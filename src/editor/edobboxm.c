#include "acs_i.h"
#include "country.h"

static void edbo_framecol(void);
static void edbo_intercol(void);
static void edbo_pattern(void);
static void edbo_replace(void);
static void edbo_textcol(void);
static void edbo_trans(void);
static void edbo_type(void);
static void edbo_ok(void);
static void edbo_thickness(void);
static void edbo_update(void);

#include "edobboxm.ah"
#include "edobboxm.h"

const char *const colour_text[16] = {
	COLOUR00,
	COLOUR01,
	COLOUR02,
	COLOUR03,
	COLOUR04,
	COLOUR05,
	COLOUR06,
	COLOUR07,
	COLOUR08,
	COLOUR09,
	COLOUR10,
	COLOUR11,
	COLOUR12,
	COLOUR13,
	COLOUR14,
	COLOUR15
};

static void edbo_update(void);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edbo_framecol(void)
{
	int16 select;
	
	if ((select = oe_colsel(ACSblk->ev_object[ED_BOX_SAMPLE].ob_spec.obspec.framecol, ED_BOX_FRAMECOLOR_BOX, ED_BOX_FRAMECOLOR_POPUP, ED_BOX_FRAMECOLOR)) >= 0)
	{
		ACSblk->ev_object[ED_BOX_SAMPLE].ob_spec.obspec.framecol = select;
		edbo_update();
	}
}

/* -------------------------------------------------------------------------- */

static void edbo_intercol(void)
{
	int16 select;
	
	if ((select = oe_colsel(ACSblk->ev_object[ED_BOX_SAMPLE].ob_spec.obspec.interiorcol, ED_BOX_INTERCOLOR_BOX, ED_BOX_INTERCOLOR_POPUP, ED_BOX_INTERCOLOR)) >= 0)
	{
		ACSblk->ev_object[ED_BOX_SAMPLE].ob_spec.obspec.interiorcol = select;
		edbo_update();
	}
}

/* -------------------------------------------------------------------------- */

static void edbo_pattern(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	
	popup = Aob_create(&POP_PATSEL.root);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_BOX_PATTERN);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		popup[ACSblk->ev_object[ED_BOX_SAMPLE].ob_spec.obspec.fillpattern + 1].ob_state |= OS_CHECKED;
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			ACSblk->ev_object[ED_BOX_SAMPLE].ob_spec.obspec.fillpattern = sel - 1;
			ACSblk->ev_object[ED_BOX_PATTERN].ob_spec.obspec.fillpattern = sel - 1;
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_BOX_PATTERN, -1);
			edbo_update();
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edbo_replace(void)
{
	ACSblk->ev_object[ED_BOX_SAMPLE].ob_spec.obspec.textmode = TRUE;
	edbo_update();
}

/* -------------------------------------------------------------------------- */

static void edbo_textcol(void)
{
	int16 select;
	
	if ((select = oe_colsel(ACSblk->ev_object[ED_BOX_SAMPLE].ob_spec.obspec.textcol, ED_BOX_TEXTCOLOR_BOX, ED_BOX_TEXTCOLOR_POPUP, ED_BOX_TEXTCOLOR)) >= 0)
	{
		ACSblk->ev_object[ED_BOX_SAMPLE].ob_spec.obspec.textcol = select;
		edbo_update();
	}
}

/* -------------------------------------------------------------------------- */

static void edbo_trans(void)
{
	ACSblk->ev_object[ED_BOX_SAMPLE].ob_spec.obspec.textmode = FALSE;
	edbo_update();
}

/* -------------------------------------------------------------------------- */

static void edbo_type(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	
	popup = Aob_create(&POP_TYPESEL.root);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_BOX_TYPE);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
#if WITH_FIXES
		switch ((char)ACSblk->ev_object[ED_BOX_SAMPLE].ob_type)
#else
		switch (ACSblk->ev_object[ED_BOX_SAMPLE].ob_type) /* BUG: does not mask lower byte */
#endif
		{
		case G_BOX:
			popup[1].ob_state |= OS_CHECKED;
			break;
		case G_IBOX:
			popup[2].ob_state |= OS_CHECKED;
			break;
		case G_BOXCHAR:
			popup[3].ob_state |= OS_CHECKED;
			break;
		}
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		switch (sel)
		{
		case 1:
			ACSblk->ev_object[ED_BOX_SAMPLE].ob_type = G_BOX;
			Aob_puttext(ACSblk->ev_object, ED_BOX_TYPE_POPUP, TYPE0);
			break;
		case 2:
			ACSblk->ev_object[ED_BOX_SAMPLE].ob_type = G_IBOX;
			Aob_puttext(ACSblk->ev_object, ED_BOX_TYPE_POPUP, TYPE1);
			break;
		case 3:
			ACSblk->ev_object[ED_BOX_SAMPLE].ob_type = G_BOXCHAR;
			Aob_puttext(ACSblk->ev_object, ED_BOX_TYPE_POPUP, TYPE2);
			break;
		}
		if (sel > 0)
		{
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_BOX_TYPE, -1);
			edbo_update();
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edbo_ok(void)
{
	OBJEDPARM *parm = ACSblk->ev_window->user;
	OBJECT *tree = ACSblk->ev_window->work;
	OBJ_ENTRY *entry;
	char *boxchar;
	
	parm->acs->flags |= ACS_CHANGED;
	entry = parm->obj->object;
	entry += parm->act_obnr;
	entry->obj.ob_type = tree[ED_BOX_SAMPLE].ob_type;
	entry->obj.ob_spec.obspec = tree[ED_BOX_SAMPLE].ob_spec.obspec;
	Auo_boxed(&tree[ED_BOX_CHAR], AUO_GETVAL, &boxchar);
	entry->obj.ob_spec.obspec.character = *boxchar;
	ed_abort();
}

/* -------------------------------------------------------------------------- */

SUBMODE *edbo_set_box(OBJ_ENTRY *entry)
{
	OBJECT *tree;
	char boxchar[2] = " ";
	int16 color;
	static SUBMODE edbo_sm = { NULL, edbo_ok, Aob_delete, title, help_title, NULL };
	
	tree = Aob_create(&ED_BOX.root);
	if (tree == NULL)
		return NULL;
	tree[ED_BOX_SAMPLE].ob_type = entry->obj.ob_type;
	tree[ED_BOX_SAMPLE].ob_spec.obspec = entry->obj.ob_spec.obspec;
	tree[ED_BOX_SAMPLE].ob_state = entry->obj.ob_state;
	oe_beself(ACSblk->ev_window, tree, ED_BOX_CHAR);
	boxchar[0] = entry->obj.ob_spec.obspec.character;
	Aob_puttext(tree, ED_BOX_CHAR, boxchar);
	
	switch ((char)entry->obj.ob_type)
	{
	case G_BOX:
		Aob_puttext(tree, ED_BOX_TYPE_POPUP, TYPE0);
		break;
	case G_IBOX:
		Aob_puttext(tree, ED_BOX_TYPE_POPUP, TYPE1);
		break;
	case G_BOXCHAR:
		Aob_puttext(tree, ED_BOX_TYPE_POPUP, TYPE2);
		break;
	}

	color = entry->obj.ob_spec.obspec.framecol;
	Aob_puttext(tree, ED_BOX_FRAMECOLOR_POPUP, colour_text[color]);
	tree[ED_BOX_FRAMECOLOR].ob_spec.obspec.interiorcol = color;

	color = entry->obj.ob_spec.obspec.interiorcol;
	Aob_puttext(tree, ED_BOX_INTERCOLOR_POPUP, colour_text[color]);
	tree[ED_BOX_INTERCOLOR].ob_spec.obspec.interiorcol = color;

	tree[ED_BOX_PATTERN].ob_spec.obspec.fillpattern = entry->obj.ob_spec.obspec.fillpattern;

	color = entry->obj.ob_spec.obspec.textcol;
	Aob_puttext(tree, ED_BOX_TEXTCOLOR_POPUP, colour_text[color]);
	tree[ED_BOX_TEXTCOLOR].ob_spec.obspec.interiorcol = color;
	
	tree[ED_BOX_SAMPLE].ob_spec.obspec.textmode = entry->obj.ob_spec.obspec.textmode;
	
	edbo_sm.tree = tree;
	return &edbo_sm;
}

/* -------------------------------------------------------------------------- */

static void edbo_thickness(void)
{
	ACSblk->ev_object[ED_BOX_SAMPLE].ob_spec.obspec.framesize = ACSblk->ev_object[ACSblk->ev_obnr].ob_spec.obspec.framesize;
	edbo_update();
}

/* -------------------------------------------------------------------------- */

static void edbo_update(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	char *boxchar;
	
	Auo_boxed(&tree[ED_BOX_CHAR], AUO_GETVAL, &boxchar);
	tree[ED_BOX_SAMPLE].ob_spec.obspec.character = *boxchar;
	self->obchange(self, ED_BOX_SAMPLE_BOX, tree[ED_BOX_SAMPLE_BOX].ob_state);
}
