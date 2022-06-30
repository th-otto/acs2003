/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      VA protocol                                           */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "msgserv.h"
#include "vaproto.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

boolean Aev_InitVA(void)
{
	int16 avserver;
	const char *server;
	char name[10];
	
	if (ACSblk->multitask)
	{
		server = Ash_getenv("AVSERVER");
		avserver = -1;
		if (server != NULL)
		{
			strncpy(name, server, 8);
#if WITH_FIXES
			name[8] = '\0';
#endif
			Ast_adl(name, 8);
			avserver = appl_find(name);
		}
		if (avserver >= 0 ||
			(avserver = appl_find("JINNEE  ")) >= 0 ||
			(avserver = appl_find("GEMINI  ")) >= 0 ||
			(avserver = appl_find("AVSERVER")) >= 0 ||
			(avserver = appl_find("MAGXDESK")) >= 0)
		{
			Aev_AvProtokoll(avserver, NULL, 0);
		}
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitVA(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

void VaDataDelete(AVData *data)
{
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

boolean Aev_GetAvExit(MsgFktParams *params)
{
	int16 *message;
	A_dd_int *dd;
	
	message = params->message;
	dd = Aev_DDSearch(message[1]);
	if (dd != NULL)
	{
		if (dd->dd.type & ~DD_VA)
			dd->dd.type &= ~DD_VA;
		else
			Aev_DDDelete(message[1]);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetVaProtoStatus(MsgFktParams *params)
{
	int16 *message;
	char *name;
	
	message = params->message;
	name = *msg_ptr(message, 6);
	if (Ax_memCheck(name, -1, FALSE))
		return Aev_DDAdd(message[1], DD_VA, &message[3], name);
	else
		return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetVaStart(MsgFktParams *params)
{
	int16 *message;
	char *filename;
	boolean ok;
	
	message = params->message;
	filename = *msg_ptr(message, 3);
	if (filename != NULL && Ax_memCheck(filename, -1, FALSE))
	{
		ok = Awi_root()->service(Awi_root(), AS_GEM_MESS, message);
	} else
	{
		ok = FALSE;
	}
	Aev_AvStarted(message[1], ok, filename);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAvStarted(MsgFktParams *params)
{
	int16 *message;
	MsgSearchForOriginal search;
	MsgWaitForAnswer *answer;
	int16 ref_msg0;
	char *filename;
	
	message = params->message;
	ref_msg0 = VA_START;
	filename = *msg_ptr(message, 3);
	search.dest_id = message[1];
	search.type = DATATYPE_VA;
	search.ref_msg[0] = &ref_msg0;
	search.ref_msg[1] = NULL;
	search.ref_msg[2] = NULL;
	search.ref_msg[3] = &message[3];
	search.ref_msg[4] = &message[4];
	search.ref_msg[5] = NULL;
	search.ref_msg[6] = NULL;
	search.ref_msg[7] = NULL;
	answer = SentMsg->searchFor(SentMsg, &search, Aev_CmpMsgInList);
	if (answer != NULL)
	{
		if (answer->window != NULL)
		{
			answer->window->service(answer->window, AS_AV_STARTED, filename);
		}
#if WITH_FIXES
		SentMsg->deleteFor(SentMsg, answer, Alu_ptrCmp);
#else
		SentMsg->searchFor(SentMsg, answer, Alu_ptrCmp);
#endif
	}
	Ax_glfree(filename);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAvSendKey(MsgFktParams *params)
{
	int16 *message;
	
	message = params->message;
	if (message[3] == 0 && message[5] == 0x5048)
	{
		ACSblk->ev_mmokstate = 0;
		ACSblk->ev_mkreturn = message[4] & 0xff;
	} else
	{
		ACSblk->ev_mmokstate = message[3];
		ACSblk->ev_mkreturn = nkc_gemks2n(message[4], message[3]);
	}
	if (evkeybrd(NULL) >= -1)
		return TRUE;
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAvSendClick(MsgFktParams *params)
{
	int16 *message;
	
	message = params->message;
	ACSblk->ev_mmox = message[3];
	ACSblk->ev_mmoy = message[4];
	ACSblk->ev_mmobutton = message[5];
	ACSblk->ev_mmokstate = message[6];
	ACSblk->ev_mbreturn = message[7];
	if (evbutton(ACSblk->ev_mmobutton, ACSblk->ev_mbreturn) >= 0)
		return TRUE;
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetVaPathUpdate(MsgFktParams *params)
{
	int16 *message;
	char *filename;
	
	message = params->message;
	filename = *msg_ptr(message, 3);
	if (filename != NULL && Ax_memCheck(filename, -1, FALSE))
		Awi_sendall(AS_REDRAWFILE, filename);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_AvProtokoll(int16 dest_id, Awindow *window, int16 timeout)
{
	int16 msg[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	
	if (dest_id != ACSblk->gl_apid)
	{
		msg[0] = AV_PROTOKOLL;
		msg[1] = ACSblk->gl_apid;
		msg[4] = 0;
		msg[5] = 0;
		*msg_ptr(msg, 6) = ACSblk->dd_name;
		msg[3] = AV_PROTOKOLL_START | AV_PROTOKOLL_STARTED | AV_PROTOKOLL_QUOTING | AV_PROTOKOLL_PATH_UPDATE;
		if (dest_id >= 0)
			return Aev_SendMsg(dest_id, DATATYPE_VA, msg, window, timeout);
		else
			return Aev_SendAllMsg(msg, DATATYPE_VA, window, timeout);
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_AvExit(int16 dest_id, Awindow *window, int16 timeout)
{
	int16 msg[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	
	if (dest_id != ACSblk->gl_apid)
	{
		msg[0] = AV_EXIT;
		msg[1] = ACSblk->gl_apid;
		msg[2] = 0;
		msg[3] = 0;
		msg[4] = 0;
		msg[5] = 0;
		msg[6] = 0;
		msg[7] = 0;
		if (dest_id >= 0)
			return Aev_SendMsg(dest_id, DATATYPE_VA, msg, window, timeout);
		else
			return Aev_SendAllMsg(msg, DATATYPE_VA, window, timeout);
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_VaProtoStatus(int16 dest_id, Awindow *window, int16 timeout)
{
	int16 msg[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	
	if (dest_id != ACSblk->gl_apid)
	{
		msg[0] = VA_PROTOSTATUS;
		msg[1] = ACSblk->gl_apid;
		msg[2] = 0;
		msg[3] = VA_PROT_ASKFILEFONT | VA_PROT_ASKCONFONT | VA_PROT_OPENWIND | VA_PROT_STARTPROG | VA_PROT_COPY_DRAGGED | VA_PROT_PATH_UPDATE | VA_PROT_EXIT | VA_PROT_QUOTING;
		msg[4] = 0;
		msg[5] = 0;
		*msg_ptr(msg, 6) = ACSblk->dd_name;
		if (dest_id >= 0)
			return Aev_SendMsg(dest_id, DATATYPE_VA, msg, window, timeout);
		else
			return Aev_SendAllMsg(msg, DATATYPE_VA, window, timeout);
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_VaStart(int16 dest_id, const char *cmd, Awindow *window, int16 timeout)
{
	int16 msg[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	char *copy;
	
	if (dest_id != ACSblk->gl_apid)
	{
		copy = Ast_copy(cmd, TRUE);
		if (copy == NULL)
			return FALSE;
		msg[0] = VA_START;
		msg[1] = ACSblk->gl_apid;
		msg[2] = 0;
		msg[5] = 0;
		msg[6] = 0;
		msg[7] = 0;
		*msg_ptr(msg, 3) = copy;
		if (dest_id >= 0)
			return Aev_SendMsg(dest_id, DATATYPE_VA, msg, window, timeout);
		else
			return Aev_SendAllMsg(msg, DATATYPE_VA, window, timeout);
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

boolean Aev_AvStarted(int16 dest_id, boolean ok, const char *cmd)
{
	int16 msg[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	
	if (dest_id != ACSblk->gl_apid)
	{
		memset(msg, 0, sizeof(msg));
		msg[0] = AV_STARTED;
		msg[1] = ACSblk->gl_apid;
		*msg_ptr(msg, 3) = NO_CONST(cmd);
		if (dest_id >= 0)
			return Aev_SendMsg(dest_id, DATATYPE_VA, msg, NULL, -1);
		else
			return Aev_SendAllMsg(msg, DATATYPE_VA, NULL, -1);
	}
	return FALSE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

