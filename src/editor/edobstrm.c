#include "acs_i.h"
#include "country.h"

static void edst_ok(void);
static void edst_type(void);

#include "edobstrm.ah"
#include "edobstrm.h"

static SUBMODE edst_sm = { NULL, edst_ok, Aob_delete, title, help_title, NULL };

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edst_type(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	
	popup = Aob_create(&POP_TYPESEL);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_STR_TYPE);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
#if WITH_FIXES
		switch ((char)ACSblk->ev_object[ED_STR_SAMPLE].ob_type)
#else
		switch (ACSblk->ev_object[ED_STR_SAMPLE].ob_type)
#endif
		{
		case G_STRING:
			popup[1].ob_state |= OS_CHECKED;
			break;
		case G_BUTTON:
			popup[2].ob_state |= OS_CHECKED;
			break;
		case G_TITLE:
			popup[3].ob_state |= OS_CHECKED;
			break;
		}
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		switch (sel)
		{
		case 1:
			ACSblk->ev_object[ED_STR_SAMPLE].ob_type = G_STRING;
			Aob_puttext(ACSblk->ev_object, ED_STR_TYPE_POPUP, TYPE0);
			break;
		case 2:
			ACSblk->ev_object[ED_STR_SAMPLE].ob_type = G_BUTTON;
			Aob_puttext(ACSblk->ev_object, ED_STR_TYPE_POPUP, TYPE1);
			break;
		case 3:
			ACSblk->ev_object[ED_STR_SAMPLE].ob_type = G_TITLE;
			Aob_puttext(ACSblk->ev_object, ED_STR_TYPE_POPUP, TYPE2);
			break;
		}
		if (sel > 0)
		{
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_STR_TYPE, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_STR_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edst_ok(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	OBJEDPARM *parm = self->user;
	ACS_HEAD *acs = parm->acs;
	OBJ_ENTRY *entry;
	char *str;
	int len;
	
	acs->flags |= ACS_CHANGED;
	entry = parm->obj->object;
	entry += parm->act_obnr;
	entry->obj.ob_type = tree[ED_STR_SAMPLE].ob_type;
	Auo_boxed(&tree[ED_STR_TEXT], AUO_GETVAL, &str);
	len = (int)strlen(str);
	change_string(acs, (Obj_Head *)entry->obj.ob_spec.free_string, str);
	if (entry->obj.ob_width < len)
		entry->obj.ob_width = len;
	ed_abort();
}

/* -------------------------------------------------------------------------- */

SUBMODE *edst_set_str(OBJ_ENTRY *entry)
{
	OBJECT *tree;
	
	tree = Aob_create(&ED_STR);
	if (tree == NULL)
		return NULL;
	oe_beself(ACSblk->ev_window, tree, ED_STR_TEXT);
	tree[ED_STR_SAMPLE].ob_type = entry->obj.ob_type;
	tree[ED_STR_SAMPLE].ob_state = entry->obj.ob_state;
	Aob_puttext(tree, ED_STR_TEXT, ((Obj_Head *)entry->obj.ob_spec.free_string)->object);
#if WITH_FIXES
	switch ((char)entry->obj.ob_type)
#else
	switch (entry->obj.ob_type)
#endif
	{
	case G_STRING:
		Aob_puttext(tree, ED_STR_TYPE_POPUP, TYPE0);
		break;
	case G_BUTTON:
		Aob_puttext(tree, ED_STR_TYPE_POPUP, TYPE1);
		break;
	case G_TITLE:
		Aob_puttext(tree, ED_STR_TYPE_POPUP, TYPE2);
		break;
	}
	edst_sm.tree = tree;
	return &edst_sm;
}
