/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      XAcc protocol                                         */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "country.h"
#include "msgserv.h"

#if COUNTRY == COUNTRY_DE
#define ERR_MEMACESS "[4][Bei einem XAcc-Transfer|konnte auf den Speicher|nicht zugegriffen|werden (Speicherschutz)!][OK]"
#endif
#if COUNTRY == COUNTRY_US
#if WITH_FIXES
#define ERR_MEMACESS "[4][Error accessing memory|during XAcc-transfer|(Memory-Protection)!][OK]"
#else
#define ERR_MEMACESS "[4][Bei einem XAcc-Transfer|konnte auf den Speicher|nicht zugegriffen|werden (Speicherschutz)!][OK]"
#endif
#endif

static long GetXAccData = 0;
static int16 GetXAccID = -1;
#define IMG_MAGIC 0x00494D47L
#define GEM_MAGIC 0x0047454DL

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

boolean Aev_InitXAcc(void)
{
	int16 found;
	int16 type;
	int16 id;
	char fname[10];
	
	if (ACSblk->multitask)
	{
		if (ACSblk->AESglobal[0] >= 0x400 || _ACSv_magix >= 0x200)
		{
			found = appl_search(APP_FIRST, fname, &type, &id);
			while (found)
			{
				if (type & (APP_APPLICATION | APP_ACCESSORY))
					Aev_AccID(id, NULL, 0);
				found = appl_search(APP_NEXT, fname, &type, &id);
			}
		}
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitXAcc(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

void XAccDataDelete(XAccData *data)
{
	if (data)
	{
		if (data->globData)
			globProtData->deleteFor(globProtData, data->globData, Alu_ptrCmp);
		memset(data, 0, sizeof(*data));
	}
}

/* -------------------------------------------------------------------------- */

static A_dd_int *Aev_CheckXAccPart(int16 id)
{
	A_dd_int *dd;
	
	dd = Aev_DDSearch(id);
	if (dd == NULL || !(dd->dd.type & DD_XACC))
	{
		Aev_AccAck(id, FALSE);
		return NULL;
	}
	return dd;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAccID(MsgFktParams *params)
{
	int16 *message = params->message;
	char *name;
	boolean ok;
	
	if (!ACSblk->multitask && ACSblk->gl_apid == 0)
		Aev_AccAcc(-1, message, NULL, -1);
	name = *msg_ptr(message, 4);
	if (Ax_memCheck(name, -1, FALSE))
	{
		ok = Aev_DDAdd(message[1], DD_XACC, &message[3], name);
	} else
	{
		ok = FALSE;
	}
	if (ACSblk->multitask || ACSblk->gl_apid == 0)
		Aev_AccAcc(message[1], message, NULL, -1);
	return ok;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAccAck(MsgFktParams *params)
{
	int16 *message = params->message;
	A_dd_int *dd;
	MsgWaitForAnswer *answer;
	
	answer = NULL;
	if (message[1] != ACSblk->gl_apid)
	{
		dd = Aev_CheckXAccPart(message[1]);
		if (dd != NULL)
			XAccDataDelete(&dd->xacc_data);
		answer = SentMsg->searchFor(SentMsg, &message[1], Aev_CmpDestID);
		if (answer != NULL &&
			SentMsg->searchFor(SentMsg, answer, Alu_ptrCmp) != NULL)
		{
			if (answer->window)
				answer->window->service(answer->window, AS_ACC_ACK, &message[3]);
			SentMsg->deleteFor(SentMsg, answer, Alu_ptrCmp);
		}
	}
	return answer != NULL;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAccAcc(MsgFktParams *params)
{
	int16 *message = params->message;
	char *name;
	boolean ok;
	
#if WITH_FIXES
	ok = TRUE;
#endif
	if (ACSblk->multitask || ACSblk->gl_apid != 0)
	{
		name = *msg_ptr(message, 4);
		if (name != NULL && Ax_memCheck(name, -1, FALSE))
		{
			ok = Aev_DDAdd(message[ACSblk->multitask ? 1 : 7], DD_XACC, &message[3], name);
		} else
		{
			ok = FAIL; /* WTF? */
		}
	}
	if (!ACSblk->multitask && ACSblk->gl_apid != 0)
		Aev_AccID(message[7], NULL, -1);
	
	return ok;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAccKey(MsgFktParams *params)
{
	Awindow *win = params->window;
	int16 *message = params->message;
	int16 ok;
	
	if (Aev_CheckXAccPart(message[1]) == NULL)
		return TRUE;
	ACSblk->ev_mkreturn = nkc_gemks2n(message[3], message[4]);
	ok = win->keys(win, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn & ~NKF_RESVD);
	Aev_AccAck(message[1], ok >= FAIL);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAccText(MsgFktParams *params)
{
	int16 *message = params->message;
	char *text;

	if (Aev_CheckXAccPart(message[1]) == NULL)
		return TRUE;
	
	text = *msg_ptr(message, 4);
	if (Ax_memCheck(text, -1, FALSE))
	{
		return Aev_AccAck(message[1], GetTxtIntoObj(text, "XAccTxt", params->window, params->drag_obnr, params->drag_obednr, params->drag_aob, params->drag_obj));
	} else
	{
		if (ACSblk->description->flags & AB_NOMEMCHECK)
			Awi_alert(1, ERR_MEMACESS);
		return Aev_AccAck(message[1], FALSE);
	}
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAccImg(MsgFktParams *params)
{
	int16 *message = params->message;
	boolean ok = TRUE;
	boolean final;
	ssize_t size;
	void *data;
	
	final = message[3] == 1;
	
	if (Aev_CheckXAccPart(message[1]) == NULL)
		return TRUE;
	
	if ((GetXAccData != 0 && GetXAccData != IMG_MAGIC) ||
		(GetXAccID >= 0 && GetXAccID != message[1]))
	{
		Aev_AccAck(message[1], FALSE);
		return TRUE;
	}
	
	data = *msg_ptr(message, 4);
	size = *msg_long(message, 6);
	ok = Ax_memCheck(data, size, FALSE);
	if (final && ok)
	{
		if (GetXAccData == IMG_MAGIC && GetXAccID == message[1])
		{
			ok = Ascrp_put("img", data, size, TRUE);
			if (ok)
				ok = Ascrp_get("img", &data, &size);
		}
		if (ok)
		{
			if (params->drag_aob && params->drag_aob->drag)
			{
				ok = GetImgIntoObj(data, params->window, params->drag_obnr, params->drag_aob, params->drag_obj);
#if !WITH_FIXES
				Ax_free(data); /* BUG: that is not our data */
#endif
			} else
			{
				ok = params->window->service(params->window, AS_SCRAP_IMPORT, "IMG");
			}
		}
	} else if (ok)
	{
		if (GetXAccData != IMG_MAGIC || GetXAccID != message[1])
			Ascrp_clear("img");
		ok = Ascrp_put("img", data, size, TRUE);
	} else
	{
		if (ACSblk->description->flags & AB_NOMEMCHECK)
			Awi_alert(1, ERR_MEMACESS);
	}
	Aev_AccAck(message[1], ok);
	if (final || !ok)
	{
		if (!final)
			Ascrp_clear("img");
		GetXAccData = 0;
		GetXAccID = -1;
	} else
	{
		GetXAccData = IMG_MAGIC;
		GetXAccID = message[1];
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAccMeta(MsgFktParams *params)
{
	int16 *message = params->message;
	boolean ok = TRUE;
	boolean final;
	ssize_t size;
	void *data;
	
	final = message[3] == 1;
	
	if (Aev_CheckXAccPart(message[1]) == NULL)
		return TRUE;
	
	if ((GetXAccData != 0 && GetXAccData != GEM_MAGIC) ||
		(GetXAccID >= 0 && GetXAccID != message[1]))
	{
		Aev_AccAck(message[1], FALSE);
		return TRUE;
	}
	
#if WITH_FIXES
	data = *msg_ptr(message, 4);
	size = *msg_long(message, 6);
#else
	data = (void *)(((ssize_t)message[4] << 16) | (ssize_t)message[5]);
	size = ((ssize_t)message[6] << 16) | (ssize_t)message[7];
#endif
	ok = Ax_memCheck(data, size, FALSE);
	if (final && ok)
	{
		if (GetXAccData == GEM_MAGIC && GetXAccID == message[1])
		{
			ok = Ascrp_put("gem", data, size, TRUE);
			if (ok)
				ok = Ascrp_get("gem", &data, &size);
		}
		ok = params->window->service(params->window, AS_SCRAP_IMPORT, "gem");
	} else if (ok)
	{
		if (GetXAccData != GEM_MAGIC || GetXAccID != message[1])
			Ascrp_clear("gem");
		ok = Ascrp_put("gem", data, size, TRUE);
	} else
	{
		if (ACSblk->description->flags & AB_NOMEMCHECK)
			Awi_alert(1, ERR_MEMACESS);
	}
	Aev_AccAck(message[1], ok);
	if (final || !ok)
	{
		if (!final)
			Ascrp_clear("gem");
		GetXAccData = 0;
		GetXAccID = -1;
	} else
	{
		GetXAccData = GEM_MAGIC;
		GetXAccID = message[1];
	}
	return TRUE;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

boolean Aev_AccID(int16 dest_id, Awindow *window, int16 timeout)
{
	int16 message[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	
	if (dest_id != ACSblk->gl_apid)
	{
		message[0] = ACC_ID;
		message[1] = ACSblk->gl_apid;
		message[3] = 3;
		message[6] = ACSblk->menu_id;
		message[7] = -1;
		*msg_ptr(message, 4) = ACSblk->AppLongName;
		if (dest_id >= 0)
			return Aev_SendMsg(dest_id, DD_XACC, message, window, timeout);
		else
			return Aev_SendAllMsg(message, DD_XACC, window, timeout);
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_AccAcc(int16 dest_id, int16 *message, Awindow *window, int16 timeout)
{
	int16 msgbuf[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	
	if (dest_id != ACSblk->gl_apid)
	{
		msgbuf[0] = ACC_ACC;
		msgbuf[1] = ACSblk->gl_apid;
		msgbuf[2] = 0;
		if (ACSblk->multitask)
		{
			msgbuf[3] = 3;
			msgbuf[6] = ACSblk->menu_id;
			msgbuf[7] = -1;
			*msg_ptr(msgbuf, 4) = ACSblk->AppLongName;
		} else
		{
			msgbuf[3] = message[3];
			msgbuf[4] = message[4];
			msgbuf[5] = message[5];
			msgbuf[6] = message[6];
			msgbuf[7] = message[1];
		}
		if (dest_id >= 0)
			return Aev_SendMsg(dest_id, DD_XACC, msgbuf, window, timeout);
		else
			return Aev_SendAllMsg(msgbuf, DD_XACC, window, timeout);
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_AccExit(int16 dest_id, Awindow *window, int16 timeout)
{
	int16 msgbuf[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	
	if (dest_id != ACSblk->gl_apid)
	{
		msgbuf[0] = ACC_EXIT;
		msgbuf[1] = ACSblk->gl_apid;
		msgbuf[3] = 0;
		msgbuf[4] = 0;
		msgbuf[5] = 0;
		msgbuf[6] = 0;
		msgbuf[7] = 0;
		if (dest_id >= 0)
			return Aev_SendMsg(dest_id, DD_XACC, msgbuf, window, timeout);
		else
			return Aev_SendAllMsg(msgbuf, DD_XACC, window, timeout);
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_AccAck(int16 dest_id, boolean ok)
{
	int16 msgbuf[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	
	if (dest_id != ACSblk->gl_apid)
	{
		memset(msgbuf, 0, sizeof(msgbuf));
		msgbuf[0] = ACC_ACK;
		msgbuf[1] = ACSblk->gl_apid;
		msgbuf[3] = ok != FALSE;
		if (dest_id >= 0)
			return Aev_SendMsg(dest_id, DD_XACC, msgbuf, NULL, -1);
		else
			return Aev_SendAllMsg(msgbuf, DD_XACC, NULL, -1);
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_AccKey(int16 dest_id, int16 key, Awindow *window, int16 timeout)
{
	int16 msgbuf[8];
	int32 gemkey;
	
	if (Aev_CheckXAccPart(dest_id) == NULL)
		return FALSE;

	if (dest_id != ACSblk->gl_apid)
	{
		memset(msgbuf, 0, sizeof(msgbuf));
		msgbuf[0] = ACC_KEY;
		msgbuf[1] = ACSblk->gl_apid;
		gemkey = nkc_n2tos(key);
		msgbuf[3] = (int16)(gemkey >> 16) & 0xff;
		msgbuf[4] = (int16)(gemkey >> 24) & 0xff;
		
		if (dest_id >= 0)
			return Aev_SendMsg(dest_id, DD_XACC, msgbuf, window, timeout);
		else
			return Aev_SendAllMsg(msgbuf, DD_XACC, window, timeout);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_AccText(int16 dest_id, const char *text, Awindow *window, int16 timeout)
{
	int16 msgbuf[8];
	char *str;
	A_dd_int *dd;
	
	dd = Aev_CheckXAccPart(dest_id);
	if (dd == NULL)
		return FALSE;

	if (dest_id != ACSblk->gl_apid)
	{
		if (dd->xacc_data.msg_id != 0)
		{
			if (dd->xacc_data.timestamp < Ash_gettimer() + 500)
				return FALSE;
			XAccDataDelete(&dd->xacc_data);
		}
		str = Ast_copy(text, TRUE);
		if (str == NULL)
			return FALSE;
		globProtData->append(globProtData, str);
		
		memset(msgbuf, 0, sizeof(msgbuf));
		msgbuf[0] = ACC_TEXT;
		msgbuf[1] = ACSblk->gl_apid;
		*msg_ptr(msgbuf, 4) = str;
		dd->xacc_data.msg_id = ACC_TEXT;
		dd->xacc_data.timestamp = Ash_gettimer();
		dd->xacc_data.globData = str;
		
		if (dest_id >= 0)
			return Aev_SendMsg(dest_id, DD_XACC, msgbuf, window, timeout);
		else
			return Aev_SendAllMsg(msgbuf, DD_XACC, window, timeout);
	}
	return TRUE;
}
