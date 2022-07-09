/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Message services                                      */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acsport.h"
#include "acs_i.h"
#include "msgserv.h"
#include "vaproto.h"
#include "olga.h"
#include "bubble.h"
#include "gscript.h"
#include "pc_help.h"

ULinList *globProtData = NULL;

typedef struct {
	int16 MsgNr;
	boolean (*MsgFunktion)(MsgFktParams *params);
	int8 WindOffset;
	int8 XOffset;
	int8 YOffset;
	int8 WOffset;
	int8 HOffset;
	int8 draginfos;
	int16 scrolloffset;
} MsgService;

static MsgService MsgListe[] = {
	{ ACC_ID,                Aev_GetAccID,                -1, -1, -1, -1, -1, 0, -1 },
	{ ACC_ACC,               Aev_GetAccAcc,               -1, -1, -1, -1, -1, 0, -1 },
	{ ACC_ACK,               Aev_GetAccAck,               -1, -1, -1, -1, -1, 0, -1 },
	{ ACC_KEY,               Aev_GetAccKey,               -1, -1, -1, -1, -1, 1, -1 },
	{ ACC_TEXT,              Aev_GetAccText,              -1, -1, -1, -1, -1, 2, -1 },
	{ ACC_IMG,               Aev_GetAccImg,               -1, -1, -1, -1, -1, 2, -1 },
	{ ACC_META,              Aev_GetAccMeta,              -1, -1, -1, -1, -1, 2, -1 },
	{ VA_PROTOSTATUS,        Aev_GetVaProtoStatus,        -1, -1, -1, -1, -1, 0, -1 },
	{ AV_EXIT,               Aev_GetAvExit,               -1, -1, -1, -1, -1, 0, -1 },
	{ VA_START,              Aev_GetVaStart,              -1, -1, -1, -1, -1, 0, -1 },
	{ AV_STARTED,            Aev_GetAvStarted,            -1, -1, -1, -1, -1, 0, -1 },
	{ AV_SENDKEY,            Aev_GetAvSendKey,            -1, -1, -1, -1, -1, 0, -1 },
	{ AV_SENDCLICK,          Aev_GetAvSendClick,          -1, -1, -1, -1, -1, 0, -1 },
	{ AV_PATH_UPDATE,        Aev_GetVaPathUpdate,         -1, -1, -1, -1, -1, 0, -1 },
	{ AP_DRAGDROP,           Aev_GetAPDragDrop,            3, -1, -1, -1, -1, 2, -1 },
	{ OLGA_INIT,             Aev_GetOlgaInit,             -1, -1, -1, -1, -1, 0, -1 },
	{ OLE_EXIT,              Aev_GetOleExit,              -1, -1, -1, -1, -1, 0, -1 },
	{ OLE_NEW,               Aev_GetOleNew,               -1, -1, -1, -1, -1, 0, -1 },
	{ OLGA_ACK,              Aev_GetOlgaAck,              -1, -1, -1, -1, -1, 0, -1 },
	{ OLGA_UPDATED,          Aev_GetOlgaUpdated,          -1, -1, -1, -1, -1, 0, -1 },
	{ OLGA_GETINFO,          Aev_GetOlgaGetInfo,          -1, -1, -1, -1, -1, 0, -1 },
	{ OLGA_IDLE,             Aev_GetOlgaIdle,             -1, -1, -1, -1, -1, 0, -1 },
	{ OLGA_CLIENTTERMINATED, Aev_GetOlgaClientTerminated, -1, -1, -1, -1, -1, 0, -1 },
	{ BUBBLEGEM_ACK,         Aev_GetAckBubbleGEM,         -1, -1, -1, -1, -1, 0, -1 },
	{ BUBBLEGEM_REQUEST,     Aev_GetRequestBubbleGEM,      3,  4,  5,  4,  5, 0, -1 },
	{ GS_REQUEST,            Aev_GetGSRequest,            -1, -1, -1, -1, -1, 0, -1 },
	{ GS_QUIT,               Aev_GetGSQuit,               -1, -1, -1, -1, -1, 0, -1 },
	{ GS_COMMAND,            Aev_GetGSCommand,            -1, -1, -1, -1, -1, 0, -1 },
	{ GS_ACK,                Aev_GetGSAck,                -1, -1, -1, -1, -1, 0, -1 },
	{ AC_REPLY,              Aev_GetAcReply,              -1, -1, -1, -1, -1, 0, -1 },
	{ DHST_ADD,              Aev_GetDhstAdd,              -1, -1, -1, -1, -1, 0, -1 },
	{ DHST_ACK,              Aev_GetDhstAck,              -1, -1, -1, -1, -1, 0, -1 },
	{ MN_SELECTED,           Aev_GetMnSelected,           -1, -1, -1, -1, -1, 0, -1 },
	{ WM_REDRAW,             Aev_GetWmRedraw,              3,  4,  5,  6,  7, 0, -1 },
	{ WM_TOPPED,             Aev_GetWmTopped,              3, -1, -1, -1, -1, 0, -1 },
	{ WM_CLOSED,             Aev_GetWmClosed,              3, -1, -1, -1, -1, 0, -1 },
	{ WM_FULLED,             Aev_GetWmFulled,              3, -1, -1, -1, -1, 0, -1 },
	{ WM_ARROWED,            Aev_GetWmArrowed,             3, -1, -1, -1, -1, 0, -1 },
	{ WM_HSLID,              Aev_GetWmHSlid,               3, -1, -1, -1, -1, 0, -1 },
	{ WM_VSLID,              Aev_GetWmVSlid,               3, -1, -1, -1, -1, 0, -1 },
	{ WM_SIZED,              Aev_GetWmSized,               3,  4,  5,  6,  7, 0, -1 },
	{ WM_MOVED,              Aev_GetWmMoved,               3,  4,  5,  6,  7, 0, -1 },
	{ WM_M_BDROPPED,         Aev_GetWmBottomed,            3, -1, -1, -1, -1, 0, -1 },
	{ WM_BOTTOMED,           Aev_GetWmBottomed,            3, -1, -1, -1, -1, 0, -1 },
	{ WM_ONTOP,              Aev_GetWmOnTop,               3, -1, -1, -1, -1, 0, -1 },
	{ WM_UNTOPPED,           Aev_GetWmUnTopped,            3, -1, -1, -1, -1, 0, -1 },
	{ WM_NEWTOP,             NULL,                        -1, -1, -1, -1, -1, 0, -1 },
	{ WM_OFFTOP,             NULL,                        -1, -1, -1, -1, -1, 0, -1 },
	{ WM_SHADED,             Aev_GetWmShaded,              3, -1, -1, -1, -1, 0, -1 },
	{ WM_UNSHADED,           Aev_GetWmUnshaded,            3, -1, -1, -1, -1, 0, -1 },
	{ WM_MOUSEWHEEL,         Aev_GetWmMouseWheel,          3,  5,  6, -1, -1, 0,  4 },
	{ WM_TOOLBAR,            Aev_GetWmToolbar,             3, -1, -1, -1, -1, 0, -1 },
	{ AP_TERM,               Aev_GetApTerm,               -1, -1, -1, -1, -1, 0, -1 },
	{ SC_CHANGED,            Aev_GetScChanged,            -1, -1, -1, -1, -1, 0, -1 },
	{ FNT_CHANGED,           Aev_GetFntChanged,           -1, -1, -1, -1, -1, 0, -1 },
	{ PRN_CHANGED,           Aev_GetPrnChanged,           -1, -1, -1, -1, -1, 0, -1 },
	{ COLORS_CHANGED,        Aev_GetColorsChanged,        -1, -1, -1, -1, -1, 0, -1 },
	{ AC_OPEN,               Aev_GetAcOpen,               -1, -1, -1, -1, -1, 0, -1 },
	{ AC_CLOSE,              Aev_GetAcClose,              -1, -1, -1, -1, -1, 0, -1 },
	{ WM_ICONIFY,            Aev_GetWmIconify,             3, -1, -1, -1, -1, 0, -1 },
	{ WM_ALLICONIFY,         Aev_GetWmAllIconify,          3, -1, -1, -1, -1, 0, -1 },
	{ WM_UNICONIFY,          Aev_GetWmUnIconify,           3, -1, -1, -1, -1, 0, -1 }
};
static int MsgListeLen = (int)(sizeof(MsgListe) / sizeof(MsgListe[0]));

static int P2IntCmp(const void *msg1, const void *msg2);
static boolean dd_find_dest(int16 *msg, Awindow **win, AOBJECT **aobj, OBJECT **obj, int16 *obnr, int16 *obednr);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 INMsgService(void)
{
	if (globProtData == NULL)
	{
		globProtData = Alu_create();
		if (globProtData == NULL)
			return FAIL;
		globProtData->freeElem = Ax_glfree;
	}
	qsort(MsgListe, MsgListeLen, sizeof(MsgListe[0]), P2IntCmp);
	return OK;
}

/* -------------------------------------------------------------------------- */

void TRMsgService(void)
{
	if (globProtData != NULL)
		Alu_delete(globProtData);
	globProtData = NULL;
}

/* -------------------------------------------------------------------------- */

static int P2IntCmp(const void *key, const void *msg2)
{
	/*
	 * key is either a plain int16, or a MsgService *.
	 * This only works because MsgNr is the first element
	 */
	return ((const MsgService *)key)->MsgNr - ((const MsgService *)msg2)->MsgNr;
}

/* -------------------------------------------------------------------------- */

boolean Aev_message(int16 *msg)
{
	MsgService *serv;
	MsgFktParams params;
	boolean ret = TRUE;
	
	if (Awi_root() == NULL)
		return FALSE;
	if (ACSblk->ACSmproto)
		ACSblk->ACSmproto(msg);
	if (msg[0] == AC_CLOSE)
		return Aev_GetAcClose(NULL);
	serv = bsearch(&msg[0], MsgListe, MsgListeLen, sizeof(MsgListe[0]), P2IntCmp);
	if (serv != NULL)
	{
		memset(&params, 0, sizeof(params));
		params.message = msg;
		switch (serv->draginfos)
		{
		case 1:
			params.window = Awi_ontop();
			break;
		case 2:
			ret = dd_find_dest(msg, &params.window, &params.drag_aob, &params.drag_obj, &params.drag_obnr, &params.drag_obednr);
			break;
		default:
			params.window = NULL;
			break;
		}
		if (params.window == NULL &&
			serv->WindOffset >= 0 &&
			msg[serv->WindOffset] >= 0)
		{
			params.window = Awi_wid(msg[serv->WindOffset]);
			if (params.window == NULL)
				return FALSE;
			if ((params.window->state & AWS_DIALOG) != 0 || msg[0] == WM_TOPPED)
				Awi_diaend();
		} else
		{
			if (params.window == NULL)
				params.window = Awi_root();
		}
		params.area.x = serv->XOffset >= 0 ? msg[serv->XOffset] : ACSblk->desk.x;
		params.area.y = serv->YOffset >= 0 ? msg[serv->YOffset] : ACSblk->desk.y;
		params.area.w = serv->WOffset >= 0 ? msg[serv->WOffset] : ACSblk->desk.w;
		params.area.h = serv->HOffset >= 0 ? msg[serv->HOffset] : ACSblk->desk.h;
		if (serv->scrolloffset >= 0)
			params.scroll = msg[serv->scrolloffset];
		else
			params.scroll = 0;
		if (serv->MsgFunktion != NULL && ret)
			ret = serv->MsgFunktion(&params);
		else
			ret = TRUE;
	} else
	{
		params.window = Awi_root();
		ret = params.window->service(params.window, AS_GEM_MESS, msg);
	}
	Awi_diastart();
	
	return ret;
}

/* -------------------------------------------------------------------------- */

/* callback for ULinList->searchFor */
boolean Aev_CmpMsgInList(void *para, void *msg)
{
	int i;
	
	if (((MsgSearchForOriginal *)para)->dest_id != ((MsgWaitForAnswer *)msg)->dest_id)
		return FALSE;
	for (i = 0; i < 8; i++)
	{
		if (((MsgSearchForOriginal *)para)->ref_msg[i] != NULL &&
			((MsgWaitForAnswer *)msg)->message[i] != *((MsgSearchForOriginal *)para)->ref_msg[i])
			return FALSE;
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_CmpDestID(void *para, void *msg)
{
	if (((MsgSearchForOriginal *)para)->dest_id == ((MsgWaitForAnswer *)msg)->dest_id)
		return TRUE;
	return FALSE;
}

/* -------------------------------------------------------------------------- */

MsgWaitForAnswer *Aev_SearchMsg(MsgSearchForOriginal *msg)
{
	return SentMsg->searchFor(SentMsg, msg, Aev_CmpMsgInList);
}

/* -------------------------------------------------------------------------- */

boolean Aev_DeleteMsg(MsgSearchForOriginal *msg)
{
	if (SentMsg->deleteFor(SentMsg, msg, Aev_CmpMsgInList) > 0)
		return TRUE;
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_SendMsg(int16 dest_id, int16 type, int16 *message, Awindow *win, int16 timeout)
{
	MsgWaitForAnswer *ans;
	boolean ret = FALSE;
	
	message[1] = ACSblk->gl_apid;
	ret = appl_write(dest_id, 16, message) != 0;
	if (ret && timeout >= 0 && win != NULL)
	{
		ans = Ax_malloc(sizeof(*ans));
		if (ans == NULL)
			return FALSE;
		ans->dest_id = dest_id;
		ans->window = win;
		ans->timeout = timeout;
		ans->type = type;
		memcpy(ans->message, message, sizeof(ans->message));
		if (SentMsg->append(SentMsg, ans) != TRUE)
			win->service(win, AS_MOUSE, message);
	}
	return ret;
}

/* -------------------------------------------------------------------------- */

static void Aev_SendMsg2all(void *all, void *dd)
{
	if (((MsgAllStruct *)all)->timeout >= 0)
		Aev_SendMsg(((A_dd_int *)dd)->dd.id, ((MsgAllStruct *)all)->type, ((MsgAllStruct *)all)->message, ((MsgAllStruct *)all)->wd, ((MsgAllStruct *)all)->timeout);
	else
		appl_write(((A_dd_int *)dd)->dd.id, 16, ((MsgAllStruct *)all)->message);
}

/* -------------------------------------------------------------------------- */

boolean Aev_SendAllMsg(int16 *message, int16 type, Awindow *win, int16 timeout)
{
	MsgAllStruct all;
	
	all.message = message;
	all.wd = win;
	all.timeout = timeout;
	all.type = type;
	ListOfApps->doFor(ListOfApps, &all, 0, Aev_SendMsg2all);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean DDCmpIDs(void *id, void *dd)
{
	if (((A_dd_int *)dd)->dd.id == *((int16 *)id))
		return TRUE;
	return FALSE;
}

/* -------------------------------------------------------------------------- */

A_dd_int *Aev_DDSearch(int16 id)
{
	int16 key;
	A_dd_int *dd;
	
	key = id;
	dd = ListOfApps->searchFor(ListOfApps, &key, DDCmpIDs);
	return dd;
}

/* -------------------------------------------------------------------------- */

boolean Aev_DDAdd(int16 id, int16 type, int16 *msg, const char *name)
{
	A_dd_int *dd;
	
	if (type != DD_XACC && type != DD_VA)
		return FALSE;
	dd = Aev_DDSearch(id);
	if (dd == NULL)
	{
		dd = Ax_malloc(sizeof(*dd));
		if (dd == NULL)
			return FALSE;
		memset(dd, 0, sizeof(*dd));
		dd->dd.id = id;
		if (!ListOfApps->append(ListOfApps, dd))
		{
			Ax_recycle(dd, sizeof(*dd));
			return FALSE;
		}
	}
	
	switch (type)
	{
	case DD_XACC:
		dd->dd.type |= DD_XACC;
		dd->dd.xacc_val = msg[0];
		dd->dd.xacc_name = name;
		break;
	
	case DD_VA:
		dd->dd.type |= DD_VA;
		memcpy(dd->dd.va_val, msg, sizeof(dd->dd.va_val));
		dd->dd.va_name = name;
		break;
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_DDDelete(int16 id)
{
	if (ListOfApps->deleteFor(ListOfApps, &id, DDCmpIDs) == 1)
		return TRUE;
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_DDRemove(A_dd_int *dd)
{
	if (dd->dd.type & DD_XACC)
		Aev_AccExit(dd->dd.id, NULL, -1);
	if (dd->dd.type & DD_VA)
		Aev_AvExit(dd->dd.id, NULL, -1);
	XAccDataDelete(&dd->xacc_data);
	VaDataDelete(dd->va_data);
	Ax_recycle(dd, sizeof(*dd));
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Ash_sendmsg(int16 dest_id, int16 type, int16 *message)
{
	return Aev_SendMsg(dest_id, type, message, NULL, -1);
}

/* -------------------------------------------------------------------------- */

static boolean Ash_chkDDtype(void *key, void *dd)
{
#if WITH_FIXES
	if (((MsgAllStruct *)key)->type == DD_XACC || ((MsgAllStruct *)key)->type == DD_VA)
		return (int16)((A_dd_int *)dd)->dd.type & ((MsgAllStruct *)key)->type;
#else
	if (*((int16 *)key) == DD_XACC || *((int16 *)key) == DD_VA)
		return (int16)((A_dd_int *)dd)->dd.type & *((int16 *)key);
#endif
	return FALSE;
}

/* -------------------------------------------------------------------------- */

/* sendet DD-Partnern (mit Typ type) oder unter MTOS/MagiC */
/* allen (type<0) den 8 int16-langen Messageblock */
boolean Ash_sendall(int16 *mess, int32 type)
{
	int16 found;
	int16 apptype;
	int16 id;
	char fname[10];
	
	if (type < 0 && (ACSblk->AESglobal[0] >= 0x400 || _ACSv_magix >= 0x200))
	{
		found = appl_search(APP_FIRST, fname, &apptype, &id);
		while (found != 0)
		{
			if ((apptype & (APP_APPLICATION | APP_ACCESSORY)) != 0)
				if (appl_write(id, 16, mess) == 0)
					return FALSE;
			found = appl_search(APP_NEXT, fname, &apptype, &id);
		}
	} else
	{
#if WITH_FIXES
		MsgAllStruct all;

		all.message = mess;
		all.wd = NULL;
		all.timeout = -1;
		all.type = (int16)type;
		ListOfApps->doFor(ListOfApps, &all, Ash_chkDDtype, Aev_SendMsg2all);
#else
		/* BUG: wrong type for para to both callbacks */
		ListOfApps->doFor(ListOfApps, &type, Ash_chkDDtype, Aev_SendMsg2all);
#endif
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

/* Returns cyclic D&D-Partners, init act with NULL, end is NULL */
A_dd *Ash_nextdd(A_dd *act)
{
	if (act == NULL)
		return ListOfApps->first(ListOfApps);
	else
		return ListOfApps->skip(ListOfApps, TRUE, 1);
}

/* -------------------------------------------------------------------------- */

static void dd_exec(Awindow *win, OBJECT *obj, int16 obnr, AOBJECT *aobj)
{
	CONTEXT ctx;
	
	if (win == NULL)
		return;
	if ((aobj == NULL || aobj->drag == NULL) && obnr >= 0)
		return;
	Adr_unselect();
	Act_save(&ctx);
	ACSblk->ev_window = win;
	ACSblk->ev_obnr = obnr;
	ACSblk->ev_object = obj;
	Adr_add(&_WDD, 2);
	if ((obj->ob_flags & AO_SILENT) == 0) /* BUG? that flag is OF_SUBMENU and only present in aobj */
		win->obchange(win, obnr, obj->ob_state | OS_SELECTED);
	if (obnr < 0)
	{
		boolean ok = TRUE;
		
		win->service(win, AS_CHECKDRAGGED, &ok);
		if (ok)
			win->service(win, AS_DRAGGED, NULL);
	} else
	{
		aobj->drag();
	}
	win->obchange(win, obnr, obj->ob_state & ~OS_SELECTED);
	Adr_unselect();
	Act_restore(&ctx);
}

/* -------------------------------------------------------------------------- */

static boolean dd_find_dest(int16 *msg, Awindow **pwin, AOBJECT **paobj, OBJECT **pobj, int16 *obnr, int16 *obednr)
{
	int16 child;
	int16 top;
	int16 mx;
	int16 my;
	Awindow *root;
	Awindow *win;
	OBJECT *obj;
	Axywh rect;
	
	root = Awi_root();
	wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
	if (msg[0] == AP_DRAGDROP)
	{
		mx = msg[4];
		my = msg[5];
	} else
	{
		mx = ACSblk->ev_mmox;
		my = ACSblk->ev_mmoy;
	}
	win = msg[0] == AP_DRAGDROP ? Awi_wid(msg[3]) : Awi_wid(wind_find(mx, my));
	if (win == NULL && msg[0] != AP_DRAGDROP)
		win = Awi_ontop();
	if (win == NULL)
		win = root;
	if ((win->state & AWS_ICONIZED) != 0)
		return FALSE;
	if (top != win->wi_id && win != root)
	{
		win->topped(win);
		Aev_mess();
	}
	*obnr = NIL;
	*paobj = NULL;
	if (win->work != NULL)
	{
		*obnr = Adr_find(win->work, ROOT, MAX_DEPTH, mx - win->wi_work.x, my - win->wi_work.y);
		if (*obnr >= 0)
		{
			child = *obnr;
			do
			{
				obj = &win->work[child];
				if (!(obj->ob_flags & OF_LASTOB) && (obj[1].ob_flags & AEO))
				{
					*paobj = (AOBJECT *)obj + 1;
					if ((*paobj)->drag != NULL)
					{
						*obnr = child;
						*pobj = win->work;
						break;
					}
				}
			} while ((child = Aob_up(win->work, child)) != NIL);
		}
	}
	
	if (*obnr < 0 && win->toolbar != NULL)
	{
		*obnr = Adr_find(win->toolbar, ROOT, MAX_DEPTH, mx - win->wi_work.x, my - win->wi_work.y);
		if (*obnr >= 0)
		{
			child = *obnr;
			do
			{
				obj = &win->toolbar[child];
				if (!(obj->ob_flags & OF_LASTOB) && (obj[1].ob_flags & AEO))
				{
					*paobj = (AOBJECT *)obj + 1;
					if ((*paobj)->drag != NULL)
					{
						*obnr = child;
						*pobj = win->toolbar;
						break;
					}
				}
			} while ((child = Aob_up(win->toolbar, child)) != NIL);
			*obnr |= A_TOOLBAR;
		}
	}
	
	if ((*obnr & A_MASK) != 0)
	{
		*obednr = NIL;
	} else
	{
		*obednr = child = NIL;
		while ((*obednr = Aob_findflag(win->work, *obednr, OF_EDITABLE)) >= 0)
		{
			child = *obednr;
			Aob_offset(&rect, win->work, *obednr);
			if (Aob_within(&rect, mx - win->wi_work.x, my - win->wi_work.y))
				break;
		}
		if (*obednr >= 0 && win->ob_edit != *obednr)
		{
			Awi_diaend();
			win->ob_edit = *obednr;
			win->ob_col = -1;
			Awi_diastart();
		}
	}
	*pwin = win;
	if ((*obnr & A_MASK) < 0) /* nonsense; will never be < 0 */
		return FALSE;
	else
		return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean GetImgIntoObj(void *data, Awindow *win, int16 obnr, AOBJECT *aobj, OBJECT *obj)
{
	AOBJECT *ddobj;
	MFDB *fdb;
	
	if (Abp_img2mfdb(data, &fdb, FALSE) == OK)
	{
		ddobj = (AOBJECT *)&_WDD.work[3];
		ddobj->type = AT_MFDB;
		ddobj->userp1 = fdb;
		dd_exec(win, obj, obnr, aobj);
		ddobj->type = 0;
		ddobj->userp1 = NULL;
		return TRUE;
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean GetTxtIntoObj(const char *text, const char *type, Awindow *win, int16 obnr, int16 obednr, AOBJECT *aobj, OBJECT *obj)
{
	AOBJECT *ddobj;
	char *arg;
	
	ddobj = (AOBJECT *)&_WDD.work[3];
	if (aobj != NULL && aobj->drag != NULL && obnr >= 0)
	{
		if (strncmp(type, "ARGS", 4) == 0)
		{
			ULinList *args;
			char buf[1024];
			
			args = Af_parseCmdLine(text);
			if (args != NULL)
			{
				arg = args->first(args);
				while (arg != NULL)
				{
					Af_quote(buf, arg);
					ddobj->type = AT_FILE;
					ddobj->userp1 = buf;
					dd_exec(win, obj, obnr, aobj);
					arg = args->skip(args, TRUE, 1);
				}
			}
		} else
		{
			if (strpbrk(text, "\n\r") != NULL)
			{
				ddobj->type = AT_TEXT;
			} else
			{
#if WITH_FIXES
				if (strcmp(type, "XAccTxt") != 0
#else
				if (strcpy((char *)type, "XAccTxt") != 0
#endif
				    || Af_length(text) < -1)
					ddobj->type = AT_STRING;
				else
					ddobj->type = AT_FILE;
			}
			ddobj->userp1 = NO_CONST(text);
			dd_exec(win, obj, obnr, aobj);
		}
		ddobj->type = 0;
		ddobj->userp1 = NULL;
	} else if (strncmp(type, "ARGS", 4) == 0)
	{
		boolean ok;
		CONTEXT ctx;
		ULinList *args;
		char buf[1024];
		
		ok = TRUE;
		args = Af_parseCmdLine(text);
		
		if (args != NULL)
		{
			arg = args->first(args);
			while (arg != NULL)
			{
				Af_quote(buf, arg);
				ddobj->type = AT_FILE;
				ddobj->userp1 = buf;
				Adr_unselect();
				Act_save(&ctx);
				ACSblk->ev_window = win;
				ACSblk->ev_obnr = obnr;
				ACSblk->ev_object = obj;
				Adr_add(&_WDD, 2);
				
				win->service(win, AS_CHECKDRAGGED, &ok);
				if (ok)
					win->service(win, AS_DRAGGED, NULL);
				Act_restore(&ctx);
				arg = args->skip(args, TRUE, 1);
			}
		}
	} else if (strncmp(type, ".TXT", 4) == 0)
	{
		if (obednr >= 0)
		{
			while (*text != '\0')
			{
				if (*text > 0x1f)
				{
					ACSblk->ev_mkreturn = *text;
					win->keys(win, ACSblk->ev_mmokstate, *text);
				}
				text++;
			}
		} else
		{
			while (*text != '\0')
			{
				switch (*text)
				{
				case '\r':
					ACSblk->ev_mkreturn = NKF_FUNC | NK_INVALID;
					break;
				case '\t':
					ACSblk->ev_mkreturn = NKF_FUNC | NK_TAB;
					break;
				case '\n':
					ACSblk->ev_mkreturn = NKF_FUNC | NK_RET;
					break;
				default:
					ACSblk->ev_mkreturn = *text;
					break;
				}
				win->keys(win, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn);
				text++;
			}
		}
	}

	return TRUE;
}
