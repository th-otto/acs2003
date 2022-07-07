/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Font selector                                         */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

static char TEXT_01[] = "";
static char TEXT_02[] = "";

#ifndef C_UNION
#  define C_UNION(x) { (int32)(x) }
#endif

static void FontClicked(void);

static struct {
	OBJECT root;
	AOBJECT _00aFontSelObj;
} FontSelObj = {
	{ -1, -1, -1, G_BOX, 0x0040, 0, C_UNION(0x00021100L), 0, 0, 40, 20 },
	{ FontClicked, NULL, AEO | OF_LASTOB, 0, NULL, NULL, 0, 0 }
};

static boolean FontService(Awindow *self, int16 task, void *in_out);
static Awindow *FontCreate(void *x);
static int16 FontOpen(Awindow *self);
static int16 FontInit(Awindow *self);
static int16 FontKeys(Awindow *self, int16 kstate, int16 key);
static void FontChange(Awindow *self, int16 obnr, int16 new_state);
static void FontRedraw(Awindow *self, Axywh *area);
static void FontTopped(Awindow *self);
static void FontClosed(Awindow *self);
static void FontFulled(Awindow *self);
static void FontArrowed(Awindow *self, int16 which, int16 amount);
static void FontHSlide(Awindow *self, int16 pos);
static void FontVSlide(Awindow *self, int16 pos);
static void FontSized(Awindow *self, Axywh *area);
static void FontMoved(Awindow *self, Axywh *area);
static int16 FontIconify(Awindow *self, boolean all);
static int16 FontUniconify(Awindow *self);
static int16 FontGEMScript(Awindow *self, int16 anz, char **cmds, A_GSAntwort *antwort);

Awindow FontSelWind = {
	NULL,
	FontService,
	FontCreate,
	FontOpen,
	FontInit,
	&FontSelObj.root,
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
	FontKeys,
	FontChange,
	FontRedraw,
	FontTopped,
	FontClosed,
	FontFulled,
	FontArrowed,
	FontHSlide,
	FontVSlide,
	FontSized,
	FontMoved,
	FontIconify,
	FontUniconify,
	FontGEMScript,
	NULL,
	NULL
};

static int16 vorhanden = -1;

typedef struct {
	int16 x;
	int16 y;
	int16 button_flags;
	FNT_DIALOG *dialog;
	char *sample;
	char *opt_button;
	int16 font_flags;
	A_FontSel fontData;
	int16 flags;
	boolean modal;
	int16 choosed;
	boolean toClose;
	void *para;
	A_FontFkt set;
	A_FontFkt mark;
	A_FontFkt opt;
	Awindow *meldung;
	Awindow *window;
} A_FontSelData;

static boolean hasFnts(void);
static boolean doButton(A_FontSelData *data);


/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void Ash_fontSetIcon(CICONBLK *icon, boolean ghost)
{
	FontSelWind.iconblk = icon;
	if (FontSelWind.iconblk == NULL)
	{
		FontSelWind.kind &= ~(AW_ICON | AW_GHOSTICON);
	} else
	{
		FontSelWind.kind |= AW_ICON;
		if (ghost)
			FontSelWind.kind |= AW_GHOSTICON;
		else
			FontSelWind.kind &= ~AW_GHOSTICON;
	}
}

/* -------------------------------------------------------------------------- */

int16 Ash_font(const char *title, int16 x, int16 y, int16 font_flags,
         int16 button_flags, A_FontSel *font, const char *sample, const char *opt_button,
         A_FontFkt set, A_FontFkt mark, A_FontFkt opt, void *para, Awindow *window)
{
	A_FontSelData *data;
	Awindow *win;
	int16 retcode = -1;
	
	if (font == NULL)
		return -3;
	if (!hasFnts())
		return -2;
	data = Ax_malloc(sizeof(*data));
	if (data == NULL)
		return -1;
	data->x = x;
	data->y = y;
	data->font_flags = font_flags;
	data->button_flags = button_flags;
#if WITH_FIXES
	data->sample = sample != NULL ? Ast_create(sample) : NULL;
	data->opt_button = opt_button != NULL ? Ast_create(opt_button) : NULL;
#else
	data->sample = Ast_create(sample);
	data->opt_button = Ast_create(opt_button);
#endif
	data->para = para;
	data->set = set;
	data->mark = mark;
	data->opt = opt;
	data->meldung = window;
	if (data->set == NULL)
		data->button_flags &= ~FNTS_BSET;
	if (data->mark == NULL)
		data->button_flags &= ~FNTS_BMARK;
	if (data->opt == NULL)
	{
#if WITH_FIXES
		Ast_delete(data->opt_button);
#endif
		data->opt_button = NULL;
	}
	memcpy(&data->fontData, font, sizeof(data->fontData));
	data->fontData.button = 0;
	data->fontData.check_boxes = 0;
	data->fontData.font_id = font->font_id < 0 ? ACSblk->fontid : font->font_id;
	data->fontData.pt = font->pt < 0 ? (int32)ACSblk->fheight << 16 : font->pt;
	data->fontData.ratio = font->ratio < 0 ? (1L << 16) : font->ratio;
	
	win = FontSelWind.create(data);
	if (win == NULL)
	{
		if (window == NULL)
		{
			data->dialog = fnts_create(ACSblk->vdi_handle,
				ACSblk->fonts, data->font_flags,
				ACSblk->description->flags & AB_NO3D ? 0 : FNTS_3D,
				data->sample, data->opt_button);
			if (data->dialog != NULL)
			{
				Amo_unbusy();
				do
				{
					data->fontData.button = fnts_do(data->dialog, data->button_flags,
						data->fontData.font_id, data->fontData.pt, data->fontData.ratio,
						&data->fontData.check_boxes, &data->fontData.font_id,
						&data->fontData.pt, &data->fontData.ratio);
				} while (!doButton(data));
				fnts_delete(data->dialog, 0);
				retcode = 0;
			}
		}
		memcpy(font, &data->fontData, sizeof(*font));
		Ast_delete(data->opt_button);
		Ast_delete(data->sample);
		Ax_recycle(data, sizeof(*data));
	} else
	{
		char *oldtitle;
		
		if (!Ast_isEmpty(title))
		{
			oldtitle = win->name;
			win->name = Ast_create(title);
			if (win->name != NULL)
				Ast_delete(oldtitle);
			else
				win->name = oldtitle;
		}
		if (window == NULL)
		{
			data->modal = TRUE;
			if (win->open(win) != FALSE && Awi_dialog(win) >= 0)
			{
				retcode = TRUE;
			}
			memcpy(font, &data->fontData, sizeof(*font));
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

static boolean hasFnts(void)
{
	int16 g1, g2, g3, g4;
	
	if (vorhanden < 0)
	{
		if (appl_getinfo(AES_WDIALOG, &g1, &g2, &g3, &g4) != 0)
			vorhanden = (g1 & 4) != 0;
		else
			vorhanden = 0;
	}
	return vorhanden != 0;
}

/* -------------------------------------------------------------------------- */

static boolean fntsClose(A_FontSelData *data)
{
	Awindow *win;
	Awindow *meldung;
	
	win = data->window;
	meldung = data->meldung;
	if (win != NULL && win->wi_id >= 0)
	{
		fnts_close(data->dialog, &win->wi_normal.x, &win->wi_normal.y);
		win->wi_id = -1;
		if (meldung != NULL)
			meldung->service(meldung, AS_FONT, &data->fontData);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static int16 fntsMessage(A_FontSelData *data, EVNT *event)
{
	int16 retcode;
	
#if WITH_FIXES
	event->msg[1] = ACSblk->gl_apid;
#endif
	event->msg[3] = data->window->wi_id;
	retcode = fnts_evnt(data->dialog, event,
		&data->fontData.button, &data->fontData.check_boxes,
		&data->fontData.font_id, &data->fontData.pt, &data->fontData.ratio);
	if (retcode == 0)
	{
		data->toClose = doButton(data);
		if (data->toClose)
		{
			if (data->modal)
				ACSblk->dia_abort = TRUE;
			else
				data->window->service(data->window, AS_TERM, NULL);
		}
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

static boolean doButton(A_FontSelData *data)
{
	data->toClose = FALSE;
	switch (data->fontData.button)
	{
	case FNTS_CANCEL:
		data->toClose = TRUE;
		break;
	case FNTS_OK:
		data->toClose = TRUE;
		break;
	case FNTS_SET:
		if (data->set != NULL)
			data->toClose = data->set(data->para, &data->fontData);
		break;
	case FNTS_MARK:
		if (data->mark != NULL)
			data->toClose = data->mark(data->para, &data->fontData);
		break;
	case FNTS_OPTION:
		if (data->opt != NULL)
			data->toClose = data->opt(data->para, &data->fontData);
		break;
	}
	return data->toClose;
}

/* -------------------------------------------------------------------------- */

static Awindow *FontCreate(void *x)
{
	A_FontSelData *data = (A_FontSelData *)x;
	Awindow *self;
	
	if (x == NULL)
		return NULL;
	self = Awi_create(&FontSelWind);
	if (self == NULL)
		return NULL;
	
	self->user = data;
	data->window = self;
	data->dialog = fnts_create(ACSblk->vdi_handle,
		ACSblk->fonts, data->font_flags,
		ACSblk->description->flags & AB_NO3D ? 0 : FNTS_3D,
		data->sample, data->opt_button);
	return self;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static boolean FontService(Awindow *self, int16 task, void *in_out)
{
	A_FontSelData *data = (A_FontSelData *)self->user;
	
	switch (task)
	{
	case AS_TERM:
		if (!(self->state & AWS_INTERM))
		{
			self->state |= AWS_INTERM;
			fntsClose(data);
			fnts_delete(data->dialog, 0);
			Ast_delete(data->opt_button);
			Ast_delete(data->sample);
			Ax_recycle(data, sizeof(*data));
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

static int16 FontOpen(Awindow *self)
{
	A_FontSelData *data = (A_FontSelData *)self->user;
	
	self->wi_id = fnts_open(data->dialog,
		data->button_flags, data->x, data->y, data->fontData.font_id, data->fontData.pt, data->fontData.ratio);
	if (self->wi_id > 0)
	{
		wind_get(self->wi_id, WF_CURRXYWH, &self->wi_act.x, &self->wi_act.y, &self->wi_act.w, &self->wi_act.h);
		wind_get(self->wi_id, WF_WORKXYWH, &self->wi_work.x, &self->wi_work.y, &self->wi_work.w, &self->wi_work.h);
		self->work->ob_x = 0;
		self->work->ob_y = 0;
		self->work->ob_width = self->wi_work.w;
		self->work->ob_height = self->wi_work.h;
		Awi_register(self);
		return TRUE; /* FIXME: should be OK */
	} else
	{
		return FALSE;
	}
}

/* -------------------------------------------------------------------------- */

static void FontClosed(Awindow *self)
{
	A_FontSelData *data = (A_FontSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_CLOSED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	fntsMessage(data, &event);
}

/* -------------------------------------------------------------------------- */

static void FontRedraw(Awindow *self, Axywh *area)
{
	A_FontSelData *data = (A_FontSelData *)self->user;
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
	fntsMessage(data, &event);
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static void FontArrowed(Awindow *self, int16 which, int16 amount)
{
	A_FontSelData *data = (A_FontSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_ARROWED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = which;
	fntsMessage(data, &event);
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static void FontChange(Awindow *self, int16 obnr, int16 new_state)
{
	self->redraw(self, &self->wi_work);
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static void FontFulled(Awindow *self)
{
	A_FontSelData *data = (A_FontSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_FULLED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	fntsMessage(data, &event);
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static int16 FontInit(Awindow *self)
{
	return OK;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static void FontHSlide(Awindow *self, int16 pos)
{
	A_FontSelData *data = (A_FontSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_HSLID, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = pos;
	fntsMessage(data, &event);
}

/* -------------------------------------------------------------------------- */

static void FontVSlide(Awindow *self, int16 pos)
{
	A_FontSelData *data = (A_FontSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_VSLID, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	event.msg[4] = pos;
	fntsMessage(data, &event);
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static int16 FontKeys(Awindow *self, int16 kstate, int16 key)
{
	A_FontSelData *data = (A_FontSelData *)self->user;
	EVNT event = { MU_KEYBD, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(key);
	event.key = nkc_n2gem(key);
	event.mclicks = ACSblk->ev_mbreturn;
	fntsMessage(data, &event);
	return OK;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static void FontTopped(Awindow *self)
{
	A_FontSelData *data = (A_FontSelData *)self->user;
	EVNT event = { MU_MESAG, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { WM_TOPPED, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	fntsMessage(data, &event);
}

/* -------------------------------------------------------------------------- */

static void FontMoved(Awindow *self, Axywh *area)
{
	A_FontSelData *data = (A_FontSelData *)self->user;
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
	fntsMessage(data, &event);
	wind_get(self->wi_id, WF_CURRXYWH, &self->wi_act.x, &self->wi_act.y, &self->wi_act.w, &self->wi_act.h);
	wind_get(self->wi_id, WF_WORKXYWH, &self->wi_work.x, &self->wi_work.y, &self->wi_work.w, &self->wi_work.h);
	self->work->ob_width = self->wi_work.w;
	self->work->ob_height = self->wi_work.h;
}

/* -------------------------------------------------------------------------- */

static void FontSized(Awindow *self, Axywh *area)
{
	A_FontSelData *data = (A_FontSelData *)self->user;
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
	fntsMessage(data, &event);
	wind_get(self->wi_id, WF_CURRXYWH, &self->wi_act.x, &self->wi_act.y, &self->wi_act.w, &self->wi_act.h);
	wind_get(self->wi_id, WF_WORKXYWH, &self->wi_work.x, &self->wi_work.y, &self->wi_work.w, &self->wi_work.h);
	self->work->ob_width = self->wi_work.w;
	self->work->ob_height = self->wi_work.h;
}

/* -------------------------------------------------------------------------- */

static int16 FontIconify(Awindow *self, boolean all)
{
	return Awi_iconify(self, all);
}

/* -------------------------------------------------------------------------- */

static int16 FontUniconify(Awindow *self)
{
	return Awi_uniconify(self);
}

/* -------------------------------------------------------------------------- */

static int16 FontGEMScript(Awindow *self, int16 anz, char **cmds, A_GSAntwort *answer)
{
	return Awi_gemscript(self, anz, cmds, answer);
}

/* -------------------------------------------------------------------------- */

static void FontClicked(void)
{
	A_FontSelData *data = (A_FontSelData *)ACSblk->ev_window->user;
	EVNT event = { MU_BUTTON, 0, 0, 0, 0, 0, 0, { 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
	
	event.mx = ACSblk->ev_mmox;
	event.my = ACSblk->ev_mmoy;
	event.mbutton = ACSblk->ev_mmobutton;
	event.kstate = nkc_n2kstate(ACSblk->ev_mkreturn);
	event.key = nkc_n2gem(ACSblk->ev_mkreturn);
	event.mclicks = ACSblk->ev_mbreturn;
	fntsMessage(data, &event);
}
