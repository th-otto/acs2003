/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Edit TEDINFO objects                                  */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acsport.h"
#include "acs_i.h"
#include "country.h"

static void edte_framecol(void);
static void edte_intercol(void);
static void edte_pattern(void);
static void edte_pos(void);
static void edte_replace(void);
static void edte_size(void);
static void edte_textcol(void);
static void edte_trans(void);
static void edte_type(void);
static void edte_ok(void);
static void edte_thickness(void);
static void edte_xtext(void);
static void edte_xftext(void);

#include "edobtedm.ah"
#include "edobtedm.h"

extern OBJECT POP_PATSEL;
extern OBJECT POP_SIZESEL;
extern OBJECT POP_HORPOSSEL;

static SUBMODE edte_sm = { NULL, edte_ok, Aob_delete, title, help_title, NULL };

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edte_framecol(void)
{
	int16 select;
	TEDINFO *ted;
	
	ted = ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo;
	if ((select = oe_colsel((ted->te_color >> 12) & 15, ED_TEDI_FRAMECOLOR_BOX, ED_TEDI_FRAMECOLOR_POPUP, ED_TEDI_FRAMECOLOR)) >= 0)
	{
		ted->te_color = (ted->te_color & 0xfff) | (select << 12);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edte_intercol(void)
{
	int16 select;
	TEDINFO *ted;
	
	ted = ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo;
	if ((select = oe_colsel(ted->te_color & 15, ED_TEDI_INTERCOLOR_BOX, ED_TEDI_INTERCOLOR_POPUP, ED_TEDI_INTERCOLOR)) >= 0)
	{
		ted->te_color = (ted->te_color & 0xfff0) | select;
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edte_pattern(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	TEDINFO *ted;
	
	popup = Aob_create(&POP_PATSEL);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_TEDI_PATTERN);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
	
		ted = ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo;
#if WITH_FIXES
		popup[((ted->te_color >> 4) & 7) + 1].ob_state |= OS_CHECKED;
#else
		popup[((ted->te_color >> 4) & 3) + 1].ob_state |= OS_CHECKED;
#endif
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			--sel;
			ted->te_color = (ted->te_color & 0xff8f) | (sel << 4);
			ACSblk->ev_object[ED_TEDI_PATTERN].ob_spec.obspec.fillpattern = sel;
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_PATTERN, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edte_pos(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	
	popup = Aob_create(&POP_HORPOSSEL);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_TEDI_HORPOS);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		switch (ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo->te_just)
		{
		case TE_LEFT:
			popup[1].ob_state |= OS_CHECKED;
			break;
		case TE_RIGHT:
			popup[3].ob_state |= OS_CHECKED;
			break;
		case TE_CNTR:
			popup[2].ob_state |= OS_CHECKED;
			break;
		}
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		switch (sel)
		{
		case 1:
			ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo->te_just = TE_LEFT;
			Aob_puttext(ACSblk->ev_object, ED_TEDI_HORPOS_POPUP, HPOS_TEXT1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_HORPOS_POPUP, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SAMPLE_BOX, -1);
			break;
		case 2:
			ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo->te_just = TE_CNTR;
			Aob_puttext(ACSblk->ev_object, ED_TEDI_HORPOS_POPUP, HPOS_TEXT2);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_HORPOS_POPUP, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SAMPLE_BOX, -1);
			break;
		case 3:
			ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo->te_just = TE_RIGHT;
			Aob_puttext(ACSblk->ev_object, ED_TEDI_HORPOS_POPUP, HPOS_TEXT3);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_HORPOS_POPUP, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SAMPLE_BOX, -1);
			break;
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edte_replace(void)
{
	ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo->te_color |= 0x80;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edte_size(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	
	popup = Aob_create(&POP_SIZESEL);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_TEDI_SIZE);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		switch (ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo->te_font)
		{
		case IBM:
			popup[1].ob_state |= OS_CHECKED;
			break;
		case SMALL:
			popup[2].ob_state |= OS_CHECKED;
			break;
		}
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		switch (sel)
		{
		case 1:
			ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo->te_font = IBM;
			Aob_puttext(ACSblk->ev_object, ED_TEDI_SIZE_POPUP, SIZE_TEXT0);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SIZE_POPUP, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SAMPLE_BOX, -1);
			break;
		case 2:
			ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo->te_font = SMALL;
			Aob_puttext(ACSblk->ev_object, ED_TEDI_SIZE_POPUP, SIZE_TEXT1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SIZE_POPUP, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SAMPLE_BOX, -1);
			break;
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edte_textcol(void)
{
	int16 select;
	TEDINFO *ted;
	
	ted = ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo;
	if ((select = oe_colsel((ted->te_color >> 8) & 15, ED_TEDI_TEXTCOLOR_BOX, ED_TEDI_TEXTCOLOR_POPUP, ED_TEDI_TEXTCOLOR)) >= 0)
	{
		ted->te_color = (ted->te_color & 0xf0ff) | (select << 8);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edte_trans(void)
{
	ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo->te_color &= ~0x80;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edte_type(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
#if WITH_FIXES
	char type;
#else
	int16 type;
#endif
	
	popup = Aob_create(&POP_TYPESEL.root);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_TEDI_TYPE);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		type = ACSblk->ev_object[ED_TEDI_SAMPLE].ob_type;
		switch (type)
		{
		case G_TEXT:
			popup[1].ob_state |= OS_CHECKED;
			break;
		case G_BOXTEXT:
			popup[2].ob_state |= OS_CHECKED;
			break;
		case G_FTEXT:
			popup[3].ob_state |= OS_CHECKED;
			break;
		case G_FBOXTEXT:
			popup[4].ob_state |= OS_CHECKED;
			break;
		}
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		switch (sel)
		{
		case 1:
			ACSblk->ev_object[ED_TEDI_SAMPLE].ob_type = G_TEXT;
			Aob_puttext(ACSblk->ev_object, ED_TEDI_TYPE_POPUP, TYPE0);
			if (type == G_FTEXT || type == G_FBOXTEXT)
				edte_xtext();
			break;
		case 2:
			ACSblk->ev_object[ED_TEDI_SAMPLE].ob_type = G_BOXTEXT;
			Aob_puttext(ACSblk->ev_object, ED_TEDI_TYPE_POPUP, TYPE1);
			if (type == G_FTEXT || type == G_FBOXTEXT)
				edte_xtext();
			break;
		case 3:
			ACSblk->ev_object[ED_TEDI_SAMPLE].ob_type = G_FTEXT;
			Aob_puttext(ACSblk->ev_object, ED_TEDI_TYPE_POPUP, TYPE2);
			if (type == G_TEXT || type == G_BOXTEXT)
				edte_xftext();
			break;
		case 4:
			ACSblk->ev_object[ED_TEDI_SAMPLE].ob_type = G_FBOXTEXT;
			Aob_puttext(ACSblk->ev_object, ED_TEDI_TYPE_POPUP, TYPE3);
			if (type == G_TEXT || type == G_BOXTEXT)
				edte_xftext();
			break;
		}
		if (sel > 0)
		{
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_TYPE, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edte_ok(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	OBJEDPARM *parm = self->user;
	ACS_HEAD *acs = parm->acs;
	OBJ_ENTRY *entry;
	TEDINFO ted;
	int len;
	int16 w;
	
	acs->flags |= ACS_CHANGED;
	entry = parm->obj->object;
	entry += parm->act_obnr;
	del_tedinfo(acs, (Obj_Head *)entry->obj.ob_spec.tedinfo);
	entry->obj.ob_type = tree[ED_TEDI_SAMPLE].ob_type;
	memcpy(&ted, tree[ED_TEDI_SAMPLE].ob_spec.tedinfo, sizeof(ted));
	Auo_boxed(&tree[ED_TEDI_TEXT], AUO_GETVAL, &ted.te_ptext);
	len = (int)strlen(ted.te_ptext) + 1;
	ted.te_txtlen = len;
	if ((char)entry->obj.ob_type == G_TEXT || (char)entry->obj.ob_type == G_BOXTEXT)
	{
		ted.te_ptmplt = ted.te_pvalid = "";
		ted.te_tmplen = 0;
		entry->obj.ob_flags &= ~OF_EDITABLE;
	} else
	{
		Auo_boxed(&tree[ED_TEDI_TMPLT], AUO_GETVAL, &ted.te_ptmplt);
		Auo_boxed(&tree[ED_TEDI_VALID], AUO_GETVAL, &ted.te_pvalid);
		len = (int)strlen(ted.te_ptmplt) + 1;
		ted.te_tmplen = len;
	}
	entry->obj.ob_spec.tedinfo = (TEDINFO *)dup_tedinfo(acs, &ted);
	len--;
	w = len * ACSblk->gl_wbox;
	if (pixel_x(entry->obj.ob_width) < w)
		entry->obj.ob_width = char_x(w);
	ed_abort();
}

/* -------------------------------------------------------------------------- */

SUBMODE *edte_set_ted(OBJ_ENTRY *entry)
{
	OBJECT *tree;
	Obj_Head *obj;
	TEDINFO *ted;
	TEDINFO *sted;
	int16 color;

	tree = Aob_create(&ED_TEDI.root);
	if (tree == NULL)
		return NULL;
	oe_beself(ACSblk->ev_window, tree, ED_TEDI_TEXT);
	oe_beself(ACSblk->ev_window, tree, ED_TEDI_TMPLT);
	oe_beself(ACSblk->ev_window, tree, ED_TEDI_VALID);
	tree[ED_TEDI_SAMPLE].ob_type = entry->obj.ob_type;
	switch ((char)tree[ED_TEDI_SAMPLE].ob_type)
	{
	case G_TEXT:
	case G_BOXTEXT:
		tree[ED_TEDI_TMPLT].ob_flags |= OF_HIDETREE;
		tree[ED_TEDI_TMPLT].ob_flags &= ~OF_EDITABLE;
		tree[ED_TEDI_VALID].ob_flags |= OF_HIDETREE;
		tree[ED_TEDI_VALID].ob_flags &= ~OF_EDITABLE;
		break;
	case G_FTEXT:
	case G_FBOXTEXT:
		tree[ED_TEDI_TMPLT].ob_flags &= ~OF_HIDETREE;
		tree[ED_TEDI_TMPLT].ob_flags |= OF_EDITABLE;
		tree[ED_TEDI_VALID].ob_flags &= ~OF_HIDETREE;
		tree[ED_TEDI_VALID].ob_flags |= OF_EDITABLE;
		break;
	}
	tree[ED_TEDI_SAMPLE].ob_state = entry->obj.ob_state;
	
	obj = (Obj_Head *)entry->obj.ob_spec.tedinfo;
	ted = obj->object;
	sted = tree[ED_TEDI_SAMPLE].ob_spec.tedinfo;
	sted->te_font = ted->te_font;
	sted->te_just = ted->te_just;
	sted->te_color = ted->te_color;
	sted->te_thickness = ted->te_thickness;
	Aob_puttext(tree, ED_TEDI_TEXT, ((Obj_Head *)ted->te_ptext)->object);
	Aob_puttext(tree, ED_TEDI_TMPLT, ((Obj_Head *)ted->te_ptmplt)->object);
	Aob_puttext(tree, ED_TEDI_VALID, ((Obj_Head *)ted->te_pvalid)->object);
	color = (ted->te_color >> 12) & 15;
	Aob_puttext(tree, ED_TEDI_FRAMECOLOR_POPUP, colour_text[color]);
	tree[ED_TEDI_FRAMECOLOR].ob_spec.obspec.interiorcol = color;
	color = (ted->te_color) & 15;
	Aob_puttext(tree, ED_TEDI_INTERCOLOR_POPUP, colour_text[color]);
	tree[ED_TEDI_INTERCOLOR].ob_spec.obspec.interiorcol = color;
	color = (ted->te_color >> 4) & 7;
	tree[ED_TEDI_PATTERN].ob_spec.obspec.fillpattern = color;
	switch (ted->te_just)
	{
	case TE_LEFT:
		Aob_puttext(tree, ED_TEDI_HORPOS_POPUP, HPOS_TEXT1);
		break;
	case TE_CNTR:
		Aob_puttext(tree, ED_TEDI_HORPOS_POPUP, HPOS_TEXT2);
		break;
	case TE_RIGHT:
		Aob_puttext(tree, ED_TEDI_HORPOS_POPUP, HPOS_TEXT3);
		break;
	}
	switch (ted->te_font)
	{
	case IBM:
		Aob_puttext(tree, ED_TEDI_SIZE_POPUP, SIZE_TEXT0);
		break;
	case SMALL:
		Aob_puttext(tree, ED_TEDI_SIZE_POPUP, SIZE_TEXT1);
		break;
	}

	color = (ted->te_color >> 8) & 15;
	Aob_puttext(tree, ED_TEDI_TEXTCOLOR_POPUP, colour_text[color]);
	tree[ED_TEDI_TEXTCOLOR].ob_spec.obspec.interiorcol = color;

#if WITH_FIXES
	switch ((char)entry->obj.ob_type)
#else
	switch (entry->obj.ob_type)
#endif
	{
	case G_TEXT:
		Aob_puttext(tree, ED_TEDI_TYPE_POPUP, TYPE0);
		break;
	case G_BOXTEXT:
		Aob_puttext(tree, ED_TEDI_TYPE_POPUP, TYPE1);
		break;
	case G_FTEXT:
		Aob_puttext(tree, ED_TEDI_TYPE_POPUP, TYPE2);
		break;
	case G_FBOXTEXT:
		Aob_puttext(tree, ED_TEDI_TYPE_POPUP, TYPE3);
		break;
	}
	
	edte_sm.tree = tree;
	return &edte_sm;
}

/* -------------------------------------------------------------------------- */

static void edte_thickness(void)
{
	ACSblk->ev_object[ED_TEDI_SAMPLE].ob_spec.tedinfo->te_thickness = ACSblk->ev_object[ACSblk->ev_obnr].ob_spec.obspec.framesize;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TEDI_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edte_xtext(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree;
	
	Awi_diaend();
	tree = self->work;
	self->ob_edit = ED_TEDI_TEXT;
	self->ob_col = -1;
	tree[ED_TEDI_TMPLT].ob_flags |= OF_HIDETREE;
	tree[ED_TEDI_TMPLT].ob_flags &= ~OF_EDITABLE;
	tree[ED_TEDI_VALID].ob_flags |= OF_HIDETREE;
	tree[ED_TEDI_VALID].ob_flags &= ~OF_EDITABLE;
	Awi_obredraw(self, ED_TEDI_TMPLT);
	Awi_obredraw(self, ED_TEDI_VALID);
	Awi_diastart();
}

/* -------------------------------------------------------------------------- */

static void edte_xftext(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree;
	
	Awi_diaend();
	tree = self->work;
	tree[ED_TEDI_TMPLT].ob_flags &= ~OF_HIDETREE;
	tree[ED_TEDI_TMPLT].ob_flags |= OF_EDITABLE;
	tree[ED_TEDI_VALID].ob_flags &= ~OF_HIDETREE;
	tree[ED_TEDI_VALID].ob_flags |= OF_EDITABLE;
	self->obchange(self, ED_TEDI_TMPLT, tree[ED_TEDI_TMPLT].ob_state);
	self->obchange(self, ED_TEDI_VALID, tree[ED_TEDI_VALID].ob_state);
	Awi_diastart();
}
