/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Print dialog                                          */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

#ifndef C_UNION
#  define C_UNION(x) { (int32)(x) }
#endif

static void PrintClicked(void);

static char TEXT_01[] = "";
static char TEXT_02[] = "";

static struct {
	OBJECT root;
	AOBJECT _00aPrintSelObj;
} PrintSelObj = {
	{ -1, -1, -1, G_BOX, 0x0040, 0, C_UNION(0x00021100L), 0, 0, 40, 20 },
	{ PrintClicked, NULL, AEO | OF_LASTOB, 0, NULL, NULL, 0, 0 }
};

static boolean PrintService(Awindow *self, int16 task, void *in_out);
static Awindow *PrintCreate(void *x);
static int16 PrintOpen(Awindow *self);
static int16 PrintInit(Awindow *self);
static int16 PrintKeys(Awindow *self, int16 kstate, int16 key);
static void PrintChange(Awindow *self, int16 obnr, int16 new_state);
static void PrintRedraw(Awindow *self, Axywh *area);
static void PrintTopped(Awindow *self);
static void PrintClosed(Awindow *self);
static void PrintFulled(Awindow *self);
static void PrintArrowed(Awindow *self, int16 which, int16 amount);
static void PrintHSlide(Awindow *self, int16 pos);
static void PrintVSlide(Awindow *self, int16 pos);
static void PrintSized(Awindow *self, Axywh *area);
static void PrintMoved(Awindow *self, Axywh *area);
static int16 PrintIconify(Awindow *self, boolean all);
static int16 PrintUniconify(Awindow *self);
static int16 PrintGEMScript(Awindow *self, int16 anz, char **cmds, A_GSAntwort *antwort);

Awindow PrintSelWind = {
	NULL,
	PrintService,
	PrintCreate,
	PrintOpen,
	PrintInit,
	&PrintSelObj.root,
	NULL,
	0, 0,
	-1,
	ICONIFIER | BACKDROP | HSLIDE | RTARROW | LFARROW | VSLIDE | DNARROW | UPARROW | SIZER | MOVER | FULLER | CLOSER | NAME,
	{ 0, 0, 120, 50 },
	{ 0, 0, 0, 0 },
	{ 0, 0, 0, 0 },
	{ -1, -1, -1, -1 },
	0, 0,
	0xf8f8,
	TEXT_01,
	TEXT_02,
	0,
	AW_TOOLBOX,
	0,
	-1,
	NULL,
	NULL,
	PrintKeys,
	PrintChange,
	PrintRedraw,
	PrintTopped,
	PrintClosed,
	PrintFulled,
	PrintArrowed,
	PrintHSlide,
	PrintVSlide,
	PrintSized,
	PrintMoved,
	PrintIconify,
	PrintUniconify,
	PrintGEMScript,
	NULL,
	NULL
};

static int16 vorhanden = -1;

static boolean hasPdlg(void);
static PRN_SETTINGS *pdlgGetSettings(A_PrintSelData *data);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void Ash_printSetIcon(CICONBLK *icon, boolean ghost)
{
	PrintSelWind.iconblk = icon;
	if (PrintSelWind.iconblk == NULL)
	{
		PrintSelWind.kind &= ~(AW_ICON | AW_GHOSTICON);
	} else
	{
		PrintSelWind.kind |= AW_ICON;
		if (ghost)
			PrintSelWind.kind |= AW_GHOSTICON;
		else
			PrintSelWind.kind &= ~AW_GHOSTICON;
	}
}

/* -------------------------------------------------------------------------- */

int16 Ash_print(PRN_SETTINGS *setting, int16 x, int16 y, int16 option, const char *title, Awindow *window)
{
	A_PrintSelData *data;
	Awindow *win;
	int16 retcode = -1;
	
	if (!hasPdlg())
		return -1;
	data = Ax_malloc(sizeof(*data));
	if (data == NULL)
		return -1;
	data->dialog = NULL;
	data->printData = setting;
	data->x = x;
	data->y = y;
	data->option = option;
	data->title = Ast_create(title);
	data->meldung = window;
	data->modal = window == NULL;
	data->choosed = FALSE;
	data->button = 0;
#if WITH_FIXES
	data->is_my_setting = FALSE;
	data->is_print_dialog = FALSE;
#endif
	
	win = PrintSelWind.create(data);
	if (win == NULL)
	{
		if (window == NULL)
		{
			data->dialog = pdlg_create(!(ACSblk->description->flags & AB_NO3D) ? PDLG_3D : 0);
			if (data->dialog != NULL)
			{
				data->printData = pdlgGetSettings(data);
				if (data->printData != NULL)
				{
					Amo_unbusy();
					data->button = pdlg_do(data->dialog, data->printData, data->title, data->option);
					retcode = data->button == PDLG_OK;
				} else
				{
					retcode = -1;
				}
				pdlg_delete(data->dialog);
			}
		}
		if (data->is_my_setting)
			Ax_free(data->printData);
		Ast_delete(data->title);
		Ax_free(data);
	} else
	{
		if (window == NULL)
		{
			data->modal = TRUE;
			retcode = Awi_dialog(win);
			if (retcode >= -1)
			{
				retcode = data->button == PDLG_OK;
			}
			win->service(win, AS_TERM, NULL);
		} else
		{
			data->modal = FALSE;
			if (win->open(win) != FALSE)
				retcode = 2;
			else
				win->service(win, AS_TERM, NULL);
		}
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

static boolean hasPdlg(void)
{
	int16 g1, g2, g3, g4;
	
	if (vorhanden < 0)
	{
		if (appl_getinfo(AES_WDIALOG, &g1, &g2, &g3, &g4) != 0)
			vorhanden = (g1 & 16) != 0;
		else
			vorhanden = 0;
	}
	return vorhanden != 0;
}

/* -------------------------------------------------------------------------- */

static PRN_SETTINGS *pdlgGetSettings(A_PrintSelData *data)
{
	PRN_DIALOG *old_dialog;
	PRN_DIALOG *dialog;
	PRN_SETTINGS *settings;
	
	old_dialog = data->dialog;
	settings = data->printData;
	if (old_dialog == NULL)
	{
		dialog = pdlg_create(0);
		if (dialog == NULL)
			return NULL;
		old_dialog = dialog;
	} else
	{
		dialog = NULL;
	}
	data->is_my_setting = settings == NULL;
	if (data->is_my_setting)
	{
		int32 size;
		
		size = pdlg_get_setsize();
		settings = Ax_malloc(max(size, sizeof(*settings)));
		if (settings != NULL)
			pdlg_dflt_settings(old_dialog, settings);
	} else
	{
		if (pdlg_validate_settings(old_dialog, settings) == 0)
			return NULL;
	}
	if (dialog != NULL)
		pdlg_delete(dialog);
	return settings;
}

/* -------------------------------------------------------------------------- */

static boolean pdlgClose(A_PrintSelData *data)
{
	Awindow *win;
	Awindow *meldung;
	
	win = data->window;
	meldung = data->meldung;
	if (win != NULL && win->wi_id >= 0 && data->dialog != NULL)
	{
		pdlg_close(data->dialog, &win->wi_normal.x, &win->wi_normal.y);
		win->wi_id = -1;
	}
	if (meldung != NULL && data->printData != NULL)
	{
		A_PrintSel sel;
		
		sel.settings = data->printData;
		sel.option = data->option;
		sel.button = data->button;
		meldung->service(meldung, AS_PRINT, &sel);
		data->meldung = NULL;
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static int16 pdlgMessage(A_PrintSelData *data, EVNT *event)
{
	int16 retcode;
	int16 button;
	
#if WITH_FIXES
	event->msg[1] = ACSblk->gl_apid;
#endif
	event->msg[3] = data->window->wi_id;
	retcode = pdlg_evnt(data->dialog, data->printData, event, &button);
	if (retcode == 0)
	{
		if (!data->choosed)
			data->button = button;
		data->choosed = TRUE;
		if (data->modal)
		{
			ACSblk->dia_abort = TRUE;
		} else
		{
			data->window->service(data->window, AS_TERM, NULL);
		}
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

static Awindow *PrintCreate(void *x)
{
	A_PrintSelData *data = (A_PrintSelData *)x;
	Awindow *self;
	char *title;
	
	if (x == NULL)
		return NULL;
	data->dialog = pdlg_create(!(ACSblk->description->flags & AB_NO3D) ? PDLG_3D : 0);
	if (data->dialog == NULL)
		return NULL;
	data->printData = pdlgGetSettings(data);
	if (data->printData == NULL)
	{
		pdlg_delete(data->dialog);
		return NULL;
	}
	
	self = Awi_create(&PrintSelWind);
	if (self == NULL)
	{
		pdlg_delete(data->dialog);
		return NULL;
	}
	title = Ast_create(data->title);
	if (title != NULL)
	{
		Ast_delete(self->name);
		self->name = title;
	}
	self->user = data;
	data->window = self;

	return self;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static boolean PrintService(Awindow *self, int16 task, void *in_out)
{
	A_PrintSelData *data = (A_PrintSelData *)self->user;
	
	switch (task)
	{
	case AS_TERM:
		if (!(self->state & AWS_INTERM))
		{
			self->state |= AWS_INTERM;
			pdlgClose(data);
			if (data->dialog != NULL)
				pdlg_delete(data->dialog);
			if (data->is_my_setting)
				Ax_free(data->printData);
			Ast_delete(data->title);
			Ax_free(data);
			Awi_delete(self);
		}
		return TRUE;
	}
	return FALSE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static int16 PrintOpen(Awindow *self)
{
	A_PrintSelData *data = (A_PrintSelData *)self->user;
	
	self->wi_id = pdlg_open(data->dialog, data->printData, data->title, data->option, data->x, data->y);
	if (self->wi_id > 0)
	{
		wind_get(self->wi_id, WF_CURRXYWH, &self->wi_act.x, &self->wi_act.y, &self->wi_act.w, &self->wi_act.h);
		wind_get(self->wi_id, WF_WORKXYWH, &self->wi_work.x, &self->wi_work.y, &self->wi_work.w, &self->wi_work.h);
		self->work->ob_x = 0;
		self->work->ob_y = 0;
		self->work->ob_width = self->wi_work.w;
		self->work->ob_height = self->wi_work.h;
		Awi_register(self);
		return OK;
	} else
	{
		return FAIL;
	}
}

/* -------------------------------------------------------------------------- */

static void PrintClosed(Awindow *self)
{
	A_PrintSelData *data = (A_PrintSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_CLOSED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	pdlgMessage(data, &event);
}

/* -------------------------------------------------------------------------- */

static void PrintRedraw(Awindow *self, Axywh *area)
{
	A_PrintSelData *data = (A_PrintSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_REDRAW, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = area->x;
	event.msg[5] = area->y;
	event.msg[6] = area->w;
	event.msg[7] = area->h;
	pdlgMessage(data, &event);
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static void PrintArrowed(Awindow *self, int16 which, int16 amount)
{
	A_PrintSelData *data = (A_PrintSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_ARROWED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = which;
	pdlgMessage(data, &event);
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static void PrintChange(Awindow *self, int16 obnr, int16 new_state)
{
	self->redraw(self, &self->wi_work);
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static void PrintFulled(Awindow *self)
{
	A_PrintSelData *data = (A_PrintSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_FULLED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	pdlgMessage(data, &event);
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static int16 PrintInit(Awindow *self)
{
	return OK;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static void PrintHSlide(Awindow *self, int16 pos)
{
	A_PrintSelData *data = (A_PrintSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_HSLID, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = pos;
	pdlgMessage(data, &event);
}

/* -------------------------------------------------------------------------- */

static void PrintVSlide(Awindow *self, int16 pos)
{
	A_PrintSelData *data = (A_PrintSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_VSLID, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = pos;
	pdlgMessage(data, &event);
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static int16 PrintKeys(Awindow *self, int16 kstate, int16 key)
{
	A_PrintSelData *data = (A_PrintSelData *)self->user;
	EVNT event = { MU_KEYBD, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(key);
	event.key = nkc_n2gem(key);
	event.mclicks = ACSblk->ev_mbreturn;
	pdlgMessage(data, &event);
	return OK;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static void PrintTopped(Awindow *self)
{
	A_PrintSelData *data = (A_PrintSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_TOPPED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	pdlgMessage(data, &event);
}

/* -------------------------------------------------------------------------- */

static void PrintMoved(Awindow *self, Axywh *area)
{
	A_PrintSelData *data = (A_PrintSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_MOVED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = area->x;
	event.msg[5] = area->y;
	event.msg[6] = area->w;
	event.msg[7] = area->h;
	pdlgMessage(data, &event);
	wind_get(self->wi_id, WF_CURRXYWH, &self->wi_act.x, &self->wi_act.y, &self->wi_act.w, &self->wi_act.h);
	wind_get(self->wi_id, WF_WORKXYWH, &self->wi_work.x, &self->wi_work.y, &self->wi_work.w, &self->wi_work.h);
	self->work->ob_width = self->wi_work.w;
	self->work->ob_height = self->wi_work.h;
}

/* -------------------------------------------------------------------------- */

static void PrintSized(Awindow *self, Axywh *area)
{
	A_PrintSelData *data = (A_PrintSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_SIZED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = area->x;
	event.msg[5] = area->y;
	event.msg[6] = area->w;
	event.msg[7] = area->h;
	pdlgMessage(data, &event);
	wind_get(self->wi_id, WF_CURRXYWH, &self->wi_act.x, &self->wi_act.y, &self->wi_act.w, &self->wi_act.h);
	wind_get(self->wi_id, WF_WORKXYWH, &self->wi_work.x, &self->wi_work.y, &self->wi_work.w, &self->wi_work.h);
	self->work->ob_width = self->wi_work.w;
	self->work->ob_height = self->wi_work.h;
}

/* -------------------------------------------------------------------------- */

static int16 PrintIconify(Awindow *self, boolean all)
{
	return Awi_iconify(self, all);
}

/* -------------------------------------------------------------------------- */

static int16 PrintUniconify(Awindow *self)
{
	return Awi_uniconify(self);
}

/* -------------------------------------------------------------------------- */

static int16 PrintGEMScript(Awindow *self, int16 anz, char **cmds, A_GSAntwort *answer)
{
	return Awi_gemscript(self, anz, cmds, answer);
}

/* -------------------------------------------------------------------------- */

static void PrintClicked(void)
{
	A_PrintSelData *data = (A_PrintSelData *)ACSblk->ev_window->user;
	EVNT event = { MU_BUTTON, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	pdlgMessage(data, &event);
}
