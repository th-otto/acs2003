/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Edit AOBJECT extended values                          */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "country.h"

static void edao_list(void);
static void edao_call(void);
static void edao_dragkey(void);
static void edao_ok(void);
static void edao_pal(void);

#include "edobaeom.ah"
#include "edobaeom.h"

static SUBMODE edao_sm = { NULL, edao_ok, Aob_delete, title, help_title, NULL };

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edao_pal(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm;
	
	self->kind |= AW_STAY;
	parm = self->user;
	WI_PALETTE.create(parm->acs);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void edao_call(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	Awindow *select = ACSblk->Aselect.window;
	int16 obnr;
	AOBJECT *aobj;
	Obj_Head *obj;
	
	ACSblk->Aselect.next = 0; /* Adr_start */
	if ((obnr = Adr_next()) > 0)
	{
		aobj = (AOBJECT *)&select->work[obnr] + 1;
		if (aobj->type == LIST_REFS)
		{
			obj = (Obj_Head *)aobj->userp1;
			Awi_diaend();
			Aob_puttext(tree, ACSblk->ev_obnr, obj->label);
			self->obchange(self, ACSblk->ev_obnr, -1);
			Awi_diastart();
			Adr_del(select, obnr);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void edao_dragkey(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	Awindow *select = ACSblk->Aselect.window;
	int16 obnr;
	AOBJECT *aobj;
	
	ACSblk->Aselect.next = 0; /* Adr_start */
	if ((obnr = Adr_next()) > 0)
	{
		aobj = (AOBJECT *)&select->work[obnr] + 1;
		if (aobj->type == LIST_AMOUSE)
		{
			Adr_del(select, obnr);
			Aob_printf(tree, ED_AEO_MOUSEINDEX, "%d", (int)(int32)aobj->userp2);
			self->obchange(self, ED_AEO_MOUSEINDEX, tree[ED_AEO_MOUSEINDEX].ob_state);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void edao_ok(void)
{
	Obj_Head *obj;
	OBJEDPARM *parm;
	OBJECT *tree;
	ACS_HEAD *acs;
	OBJ_ENTRY *entry;
	char text[LABEL_MAX + 4];
	
	parm = ACSblk->ev_window->user;
	tree = ACSblk->ev_window->work;
	acs = parm->acs;
	acs->flags |= ACS_CHANGED;
	entry = parm->obj->object;
	entry += parm->act_obnr;
	Aob_gettext(tree, ED_AEO_KEY, text);
	if (text[0] != '\0')
	{
		strupr(text);
		entry->aobj.key = key_code(text);
		if (entry->aobj.key == 0)
		{
			alert_str(ERR_KEYCODE, text);
		}
	} else
	{
		entry->aobj.key = 0;
	}
	Aob_scanf(tree, ED_AEO_MOUSEINDEX, "%d", &entry->aobj.mo_index);

	if (entry->label != NULL)
		objfree(acs, entry->label);
	Aob_gettext(tree, ED_AEO_NAME, text);
	if (text[0] != '\0')
	{
		entry->label = obj = objmalloc(acs, 0);
		if (obj != NULL)
		{
			objname(acs, entry->label, text, "INDEX NAME");
		}
	} else
	{
		entry->label = NULL;
	}

	Aob_gettext(tree, ED_AEO_TYPE, text);
	mod_ref(acs, &entry->type, text, REF_NONE);

	Aob_gettext(tree, ED_AEO_CLICK, text);
	mod_ref(acs, (Obj_Head **)&entry->aobj.click, text, REF_OBJ_CLICK);

	Aob_gettext(tree, ED_AEO_DRAG, text);
	mod_ref(acs, (Obj_Head **)&entry->aobj.drag, text, REF_OBJ_DRAG);

	Aob_gettext(tree, ED_AEO_USERP1, text);
	mod_ref(acs, (Obj_Head **)&entry->aobj.userp1, text, REF_NONE);

	Aob_gettext(tree, ED_AEO_USERP2, text);
	mod_ref(acs, (Obj_Head **)&entry->aobj.userp2, text, REF_NONE);
	
	ed_abort();
}

/* -------------------------------------------------------------------------- */

static void edao_list(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	
	self->kind |= AW_STAY;
	list_reference.acs = parm->acs;
	list_reference.objlist = parm->acs->rf_list;
	WI_LIST.create(&list_reference);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

SUBMODE *set_aeo(OBJ_ENTRY *entry)
{
	OBJECT *tree;
	char text[LABEL_MAX + 4];
	
	tree = Aob_create(&ED_AEO);
	if (tree == NULL)
		return NULL;
	
	oe_beself(ACSblk->ev_window, tree, ED_AEO_NAME);
	oe_beself(ACSblk->ev_window, tree, ED_AEO_TYPE);
	oe_beself(ACSblk->ev_window, tree, ED_AEO_CLICK);
	oe_beself(ACSblk->ev_window, tree, ED_AEO_DRAG);
	oe_beself(ACSblk->ev_window, tree, ED_AEO_USERP1);
	oe_beself(ACSblk->ev_window, tree, ED_AEO_USERP2);
	oe_beself(ACSblk->ev_window, tree, ED_AEO_KEY);
	oe_beself(ACSblk->ev_window, tree, ED_AEO_MOUSEINDEX);
	
	set_ref(entry->label, text);
	Aob_puttext(tree, ED_AEO_NAME, text);
	set_ref(entry->type, text);
	Aob_puttext(tree, ED_AEO_TYPE, text);
	set_ref((Obj_Head *)entry->aobj.click, text);
	Aob_puttext(tree, ED_AEO_CLICK, text);
	set_ref((Obj_Head *)entry->aobj.drag, text);
	Aob_puttext(tree, ED_AEO_DRAG, text);
	set_ref((Obj_Head *)entry->aobj.userp1, text);
	Aob_puttext(tree, ED_AEO_USERP1, text);
	set_ref((Obj_Head *)entry->aobj.userp2, text);
	Aob_puttext(tree, ED_AEO_USERP2, text);
	
	Aob_puttext(tree, ED_AEO_KEY, key_string(entry->aobj.key));
	Aob_printf(tree, ED_AEO_MOUSEINDEX, "%d", entry->aobj.mo_index);
	
	edao_sm.tree = tree;
	return &edao_sm;
}
