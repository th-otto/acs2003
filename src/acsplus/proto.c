/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Protocol window                                       */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "acsplus.h"
#include "country.h"
#include <stdarg.h>

static boolean proto_service(Awindow *self, int16 task, void *in_out);
static Awindow *proto_make(void *para);
static void proto_fulled(Awindow *self);
static void proto_arrowed(Awindow *self, int16 pos, int16 amount);
static void proto_hslid(Awindow *self, int16 pos);
static void proto_vslid(Awindow *self, int16 pos);
static void proto_sized(Awindow *self, Axywh *area);
static void proto_moved(Awindow *self, Axywh *area);

#include "proto.ah"

static AUSERBLK euser = { A_editor, 0L, Auo_editor, NULL, NULL, NULL, NULL, NULL };
static AUSERBLK vslider = { A_wislider, 1L, Auo_wislider, NULL, NULL, NULL, NULL, NULL };
static AUSERBLK hslider = { A_wislider, 0L, Auo_wislider, NULL, NULL, NULL, NULL, NULL };

static struct {
	OBJECT root;
	AOBJECT edit01;
	OBJECT hor;
	OBJECT ver;
} edit = {
	{ -1, -1, -1, G_USERDEF, 0x0000, 0x8000, C_UNION(&euser), 0, 0, 40, 10 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 },
	{ -1, -1, -1, G_USERDEF, 0x0000, 0x0000, C_UNION(&hslider), 0, 0, 0, 0 },
	{ -1, -1, -1, G_USERDEF, 0x0020, 0x0000, C_UNION(&vslider), 0, 0, 0, 0 }
};

#define PROTOCOL_EDITOR       0
#define PROTOCOL_HOR_SLIDER   2
#define PROTOCOL_VER_SLIDER   3

static PROTOCOLDATA def = { 1, 13, 40, 15, 4, 256, 0, 0 };

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void proto_fulled(Awindow *self)
{
	Axywh *act;
	Axywh *normal;
	
	act = &self->wi_act;
	normal = &self->wi_normal;
	if (self->state & AWS_FULL)
	{
		act->x = normal->x;
		act->y = normal->y;
		act->w = normal->w;
		act->h = normal->h;
		proto_sized(self, normal);
		self->state &= ~AWS_FULL;
	} else
	{
		normal->x = act->x;
		normal->y = act->y;
		normal->w = act->w;
		normal->h = act->h;
		proto_sized(self, &ACSblk->desk);
		self->state |= AWS_FULL;
	}
	wind_set(self->wi_id, WF_CURRXYWH, act->x, act->y, act->w, act->h);
	Aev_mess();
}

/* -------------------------------------------------------------------------- */

static void proto_arrowed(Awindow *self, int16 pos, int16 amount)
{
	OBJECT *horslider = &self->work[PROTOCOL_HOR_SLIDER];
	AUSERBLK *userhor = horslider->ob_spec.auserblk;
	OBJECT *verslider = &self->work[PROTOCOL_VER_SLIDER];
	AUSERBLK *userver = verslider->ob_spec.auserblk;
	int16 count = 0;
	boolean vertical;
	int16 dummy;
	int16 button;
	
	UNUSED(amount);
#if WITH_FIXES
	vertical = FALSE;
#endif

	do
	{
		switch (pos)
		{
		case WA_UPLINE:
			userver->ub_serv(verslider, AUO_PREV, NULL);
			vertical = TRUE;
			break;
	
		case WA_DNLINE:
			userver->ub_serv(verslider, AUO_NEXT, NULL);
			vertical = TRUE;
			break;
	
		case WA_UPPAGE:
			userver->ub_serv(verslider, AUO_PREVPAGE, NULL);
			count = 0;
			vertical = TRUE;
			break;
	
		case WA_DNPAGE:
			userver->ub_serv(verslider, AUO_NEXTPAGE, NULL);
			count = 0;
			vertical = TRUE;
			break;
	
		case WA_LFPAGE:
			userhor->ub_serv(horslider, AUO_PREVPAGE, NULL);
			count = 0;
			vertical = FALSE;
			break;
	
		case WA_RTPAGE:
			userhor->ub_serv(horslider, AUO_NEXTPAGE, NULL);
			count = 0;
			vertical = FALSE;
			break;

		case WA_LFLINE:
			userhor->ub_serv(horslider, AUO_PREV, NULL);
			vertical = FALSE;
			break;

		case WA_RTLINE:
			userhor->ub_serv(horslider, AUO_NEXT, NULL);
			vertical = FALSE;
			break;
		}
		
		if (vertical)
		{
			if (count-- == 0)
			{
				userver->ub_serv(verslider, AUO_UPDATE, NULL);
				count = 4;
			}
			userver->ub_serv(verslider, AUO_SLLIVE, NULL);
		} else
		{
			if (count-- == 0)
			{
				userhor->ub_serv(horslider, AUO_UPDATE, NULL);
				count = 4;
			}
			userhor->ub_serv(horslider, AUO_SLLIVE, NULL);
		}
		
		graf_mkstate(&dummy, &dummy, &button, &dummy);
	} while (button & 1);
	
	if (count != 4)
	{
		if (vertical)
			userver->ub_serv(verslider, AUO_UPDATE, NULL);
		else
#if WITH_FIXES
			userhor->ub_serv(horslider, AUO_UPDATE, NULL);
#else
			userhor->ub_serv(verslider, AUO_UPDATE, NULL);
#endif
	}	
}

/* -------------------------------------------------------------------------- */

static void proto_hslid(Awindow *self, int16 pos)
{
	OBJECT *slider = &self->work[PROTOCOL_HOR_SLIDER];
	AUSERBLK *auser = slider->ob_spec.auserblk;
	
	auser->ub_serv(slider, AUO_SLWIPOS, &pos);
	auser->ub_serv(slider, AUO_UPDATE, NULL);
	auser->ub_serv(slider, AUO_SLLIVE, NULL);
}

/* -------------------------------------------------------------------------- */

static Awindow *proto_make(void *para)
{
	Awindow *self;
	OBJECT *editor;
	PROTOCOLDATA *data;
	Awiob ob;
	long val;
	int16 cw, ch;
	int16 x;
	
	PROTOCOL.work = &edit.root;
	if ((self = Awi_create(&PROTOCOL)) == NULL)
		return NULL;
	self->kind |= AW_UHSLIDER | AW_UVSLIDER;
	editor = &self->work[PROTOCOL_EDITOR];
	if (para != NULL)
	{
		data = para;
	} else
	{
		data = &def;
		data->fontid = ACSblk->fontid;
		data->height = ACSblk->fheight;
	}
	self->wi_act.x = data->x;
	self->wi_act.y = data->y;
	vst_font(ACSblk->vdi_handle, data->fontid);
	vst_height(ACSblk->vdi_handle, data->height, &x, &x, &cw, &ch);
	editor->ob_width = cw * data->col;
	editor->ob_height = ch * data->row;
	x = ACSblk->desk.w - 2 * ACSblk->gl_wbox;
	if (editor->ob_width > x)
		editor->ob_width = x;
	x = ACSblk->desk.h - 3 * ACSblk->gl_hbox;
	if (editor->ob_height > x)
		editor->ob_height = x;
	
	Auo_editor(editor, AUO_EDFONT, &data->fontid);
	Auo_editor(editor, AUO_EDHEIGHT, &data->height);
	val = data->wrap;
	Auo_editor(editor, AUO_EDWRAP, &val);
	Auo_editor(editor, AUO_EDTABSIZE, &data->tabsize);
	ob.window = self;
	ob.entry = editor;
	ob.obnr = PROTOCOL_EDITOR;
	Auo_editor(editor, AUO_SELF, &ob);
	Auo_editor(editor, AUO_EDRESIZE, NULL);
	
	ob.entry = &self->work[PROTOCOL_HOR_SLIDER];
	ob.obnr = PROTOCOL_HOR_SLIDER;
	Auo_editor(editor, AUO_EDHORSLIDER, &ob);
	
	ob.entry = &self->work[PROTOCOL_VER_SLIDER];
	ob.obnr = PROTOCOL_VER_SLIDER;
	Auo_editor(editor, AUO_EDVERSLIDER, &ob);
	
	Auo_editor(editor, AUO_FULLUPDATE, NULL);
	
	return self;
}

/* -------------------------------------------------------------------------- */

static void term(Awindow *self)
{
	Awi_delete(self);
}

/* -------------------------------------------------------------------------- */

static boolean proto_service(Awindow *self, int16 task, void *in_out)
{
	Awindow *info;
	
	switch (task)
	{
	case AS_TERM:
		if (ACSblk->appexit || in_out == self)
			term(self);
		break;
	
	case AS_DELETE:
		Auo_editor(&self->work[PROTOCOL_EDITOR], AUO_EDDELETE, NULL);
		Auo_editor(&self->work[PROTOCOL_EDITOR], AUO_FULLUPDATE, NULL);
		break;
	
	case AS_EDGETENTRY:
		*((OBJECT **)in_out) = &self->work[PROTOCOL_EDITOR];
		break;
	
	case AS_INFO:
		info = WIPR_INFO.create(&WIPR_INFO);
		if (info != NULL)
		{
			Awi_dialog(info);
			Awi_delete(info);
		}
		break;
	
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void proto_moved(Awindow *self, Axywh *area)
{
	int16 x;
	int16 dummy;
	
	wind_calc(WC_WORK, self->wi_kind, 0, 0, 0, 0, &x, &dummy, &dummy, &dummy);
	area->x = ((area->x + 8) & -16) - x;
	Awi_moved(self, area);
}

/* -------------------------------------------------------------------------- */

static void proto_sized(Awindow *self, Axywh *area)
{
	int16 x;
	int16 y;
	OBJECT *work;
	OBJECT *menu;
	
	work = self->work;
	menu = self->menu;
	wind_calc(WC_WORK, self->wi_kind, 0, 0, area->w, area->h, &x, &y, &work->ob_width, &work->ob_height);
	area->x = ((area->x + 8) & -16) - x;
	if (menu)
		work->ob_height -= menu[menu[ROOT].ob_head].ob_height;
	if (self->toolbar)
		work->ob_height -= self->toolbar->ob_height;
	Auo_editor(&work[PROTOCOL_EDITOR], AUO_EDRESIZE, NULL);
	Auo_editor(&work[PROTOCOL_EDITOR], AUO_EDSLIDERS, NULL);
	Awi_sized(self, area);
}

/* -------------------------------------------------------------------------- */

static void proto_vslid(Awindow *self, int16 pos)
{
	OBJECT *slider = &self->work[PROTOCOL_VER_SLIDER];
	AUSERBLK *auser = slider->ob_spec.auserblk;
	
	auser->ub_serv(slider, AUO_SLWIPOS, &pos);
	auser->ub_serv(slider, AUO_UPDATE, NULL);
	auser->ub_serv(slider, AUO_SLLIVE, NULL);
}

/* -------------------------------------------------------------------------- */

int16 wputs(const char *text, Awindow *win)
{
	if (win != NULL)
		return uputs(text, &win->work[PROTOCOL_EDITOR]);
	return FAIL;
}

/* -------------------------------------------------------------------------- */

int16 wvprintf(Awindow *win, const char *format, va_list args)
{
	if (win != NULL)
		return uvprintf(&win->work[PROTOCOL_EDITOR], format, args);
	return FAIL;
}

/* -------------------------------------------------------------------------- */

int16 wprintf(Awindow *win, const char *format, ...)
{
	int len;
	va_list args;
	
	len = -1;
	if (win != NULL)
	{
		va_start(args, format);
		len = uvprintf(&win->work[PROTOCOL_EDITOR], format, args);
		va_end(args);
	}
	return len;
}

/* -------------------------------------------------------------------------- */

Awindow *get_protocol(void)
{
	return &PROTOCOL;
}
