#include "acs_i.h"
#include "country.h"

static void edoic_ok(void);
static void edoic_new(void);
static void edoic_edit(void);
static void edoic_list(void);

#include "edobicm.ah"
#include "edobicm.h"

static SUBMODE edoic_sm = { NULL, edoic_ok, Aob_delete, title, help_title, NULL };

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edoic_new(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	Awindow *select = ACSblk->Aselect.window;
	int16 obnr;
	AOBJECT *aobj;
	Obj_Head *obj;
	
	ACSblk->Aselect.next = 0; /* Adr_start() */
	if ((obnr = Adr_next()) > 0)
	{
		aobj = (AOBJECT *)&select->work[obnr] + 1;
		if (aobj->type == LIST_ICON)
		{
			obj = (Obj_Head *)aobj->userp1;
			Aob_puttext(tree, ED_ICON_TEXT, obj->label);
			self->obchange(self, ED_ICON_TEXT, -1);
			Adr_del(select, obnr);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void edoic_edit(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	Obj_Head *obj;
	EDPARM edparm;
	
	obj = find_entry(parm->acs->ic_list, self->work[ED_ICON_TEXT].ob_spec.tedinfo->te_ptext);
	if (obj != NULL)
	{
		self->kind |= AW_STAY;
		edparm.acs = parm->acs;
		edparm.obj = obj;
		WI_ICON.create(&edparm);
		self->kind &= ~AW_STAY;
	}
}

/* -------------------------------------------------------------------------- */

static void edoic_ok(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	OBJ_ENTRY *entry;
	const char *str;
	ACS_HEAD *acs;
	Obj_Head *obj;
	Obj_Head *oldobj;
	
	acs = parm->acs;
	acs->flags |= ACS_CHANGED;
	entry = parm->obj->object;
	entry += parm->act_obnr;
	str = self->work[ED_ICON_TEXT].ob_spec.tedinfo->te_ptext;
	obj = find_entry(acs->ic_list, str);
	if (obj == NULL)
	{
		alert_str(ERR_IC_DEL, str);
	} else
	{
		oldobj = (Obj_Head *)entry->obj.ob_spec.ciconblk;
		if (obj != oldobj)
		{
			++obj->usage;
			entry->obj.ob_spec.ciconblk = (CICONBLK *)obj;
			del_icon(acs, oldobj);
		}
		ed_abort();
	}
}

/* -------------------------------------------------------------------------- */

SUBMODE *edoic_set_icon(OBJ_ENTRY *entry)
{
	OBJECT *tree;
	Obj_Head *obj;
	
	tree = Aob_create(&ED_ICON);
	if (tree == NULL)
		return NULL;
	obj = (Obj_Head *)entry->obj.ob_spec.ciconblk;
	Aob_puttext(tree, ED_ICON_TEXT, obj->label);
	edoic_sm.tree = tree;
	return &edoic_sm;
}

/* -------------------------------------------------------------------------- */

static void edoic_list(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	
	self->kind |= AW_STAY;
	list_icon.acs = parm->acs;
	list_icon.objlist = parm->acs->ic_list;
	WI_LIST.create(&list_icon);
	self->kind &= ~AW_STAY;
}
