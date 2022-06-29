/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Window messages                                       */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "msgserv.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

boolean Aev_GetMnSelected(MsgFktParams *params)
{
	Ame_root(params->message[3], params->message[4]);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmRedraw(MsgFktParams *params)
{
	params->window->redraw(params->window, &params->area);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmTopped(MsgFktParams *params)
{
	if ((params->window->kind & AW_TOOLBOX) &&
		ACSblk->AESglobal[0] < 0x400 &&
		_ACSv_magix < 0x300 &&
		Aob_within(&params->window->wi_work, ACSblk->ev_mmox, ACSblk->ev_mmoy))
		evbutton(ACSblk->ev_mmobutton, ACSblk->ev_mbreturn);
	else
		params->window->topped(params->window);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmClosed(MsgFktParams *params)
{
	Awindow *modal;
	Awindow *win;
	
	modal = Awi_modal();
	win = params->window;
	if (modal == NULL || modal == win)
	{
		if (win == Awi_root() || (win->kind & AW_ICON) || (win->state & AWS_MODAL_WIN))
			win->closed(win);
		else
			win->service(win, AS_TERM, NULL);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmFulled(MsgFktParams *params)
{
	params->window->fulled(params->window);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmArrowed(MsgFktParams *params)
{
	int16 *message;
	
	message = params->message;
	if (message[5] >= 0)
	{
		params->window->arrowed(params->window, message[4], 1);
	} else
	{
		params->window->arrowed(params->window, message[4], -message[5]);
		if (message[7] < 0)
			params->window->arrowed(params->window, message[6], -message[7]);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmMouseWheel(MsgFktParams *params)
{
	int16 *message;
	int16 wheels[16];
	
	message = params->message;
	memset(wheels, 0, sizeof(wheels));
	wheels[0] = message[4];
	return Awi_wheeled(params->window, wheels, message[5], message[6]);
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmHSlid(MsgFktParams *params)
{
	params->window->hslid(params->window, params->message[4]);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmVSlid(MsgFktParams *params)
{
	params->window->vslid(params->window, params->message[4]);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmSized(MsgFktParams *params)
{
	params->window->sized(params->window, &params->area);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmMoved(MsgFktParams *params)
{
	params->window->moved(params->window, &params->area);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmBottomed(MsgFktParams *params)
{
	Awi_backdrop(params->window);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmOnTop(MsgFktParams *params)
{
	if (_ACSv_magix > 0 && _ACSv_magix < 0x200)
		Aev_GetWmBottomed(params);
	else
		Awi_setontop(params->window);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

boolean Aev_GetWmUnTopped(MsgFktParams *params)
{
	return TRUE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

boolean Aev_GetWmToolbar(MsgFktParams *params)
{
	return TRUE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmShaded(MsgFktParams *params)
{
	params->window->state |= AWS_SHADED;
	params->window->service(params->window, AS_SHADED, NULL);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmUnshaded(MsgFktParams *params)
{
	Awindow *win;
	
	win = params->window;
	win->service(win, AS_UNSHADED, NULL);
	win->state &= ~AWS_SHADED;
	Aev_WmRedraw(ACSblk->gl_apid, win->wi_id, &win->wi_act);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmIconify(MsgFktParams *params)
{
	params->window->iconify(params->window, FALSE);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmAllIconify(MsgFktParams *params)
{
	params->window->iconify(params->window, TRUE);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmUnIconify(MsgFktParams *params)
{
	params->window->uniconify(params->window);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

boolean Aev_GetApTerm(MsgFktParams *params)
{
	Aev_quit();
	ACSblk->apterm = TRUE;
	return TRUE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

boolean Aev_GetScChanged(MsgFktParams *params)
{
	Awi_sendall(AS_SCRAP_UPDATE, NULL);
	return TRUE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

boolean Aev_GetFntChanged(MsgFktParams *params)
{
	int16 workout[57];
	
	vst_unload_fonts(ACSblk->vdi_handle, 0);
	vq_extnd(ACSblk->vdi_handle, 0, workout);
	ACSblk->fonts = workout[10];
	ACSblk->fonts += vst_load_fonts(ACSblk->vdi_handle, 0);
	Awi_sendall(AS_FONT_UPDATE, NULL);
	return TRUE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

boolean Aev_GetPrnChanged(MsgFktParams *params)
{
	Awi_sendall(AS_PRN_UPDATE, &params->message[3]);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

boolean Aev_GetColorsChanged(MsgFktParams *params)
{
	if (ACSblk->nplanes <= 8)
		Aev_WmRedraw(ACSblk->gl_apid, -1, &ACSblk->desk);
	return TRUE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

boolean Aev_GetAcClose(MsgFktParams *params)
{
	Awindow *root;
	
	root = Awi_root();
	if (root == NULL)
		return FALSE;
	Awi_invalid();
	Aev_unhidepointer();
	Awi_sendall(AS_ACCLOSED, NULL);
	if (!ACSblk->multitask)
	{
		ListOfApps->clear(ListOfApps);
		if (!ACSblk->application)
		{
			Aev_AccID(0, NULL, -1);
			Aev_AvProtokoll(0, NULL, -1);
		}
	}
	return TRUE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

boolean Aev_GetAcOpen(MsgFktParams *params)
{
	Awindow *root;

	root = Awi_root();
	if (root != NULL)
		Awi_show(root);
	return TRUE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

int16 Aev_WmRedraw(int16 dest_id, int16 wind_id, const Axywh *area)
{
	int16 ok;
	int16 msg[8];
	
	msg[0] = WM_REDRAW;
	msg[1] = ACSblk->gl_apid;
	msg[2] = 0;
	msg[3] = wind_id < 0 ? 0 : wind_id;
	msg[4] = area->x;
	msg[5] = area->y;
	msg[6] = area->w;
	msg[7] = area->h;
	ok = appl_write(dest_id, (int)sizeof(msg), msg);
	if (wind_id < 0)
	{
		form_dial(FMD_FINISH, area->x, area->y, area->w, area->h, area->x, area->y, area->w, area->h);
	}
	if (ok != 0)
		return TRUE;
	return FALSE;
}

