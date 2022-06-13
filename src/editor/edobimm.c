#include "acs_i.h"
#include "country.h"

static void edoim_new(void);
static void edoim_edit(void);
static void edoim_ok(void);
static void edoim_list(void);

#include "edobimm.ah"
#include "edobimm.h"

static SUBMODE edoim_sm = { NULL, edoim_ok, Aob_delete, title, help_title, NULL };

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edoim_new(void)
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
		if (aobj->type == LIST_IMAGE)
		{
			obj = (Obj_Head *)aobj->userp1;
			Awi_diaend();
			Aob_puttext(tree, ED_IMAGE_TEXT, obj->label);
			self->obchange(self, ED_IMAGE_TEXT, -1);
			Awi_diastart();
			Adr_del(select, obnr);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void edoim_edit(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	Obj_Head *obj;
	EDPARM edparm;
	
	obj = find_entry(parm->acs->im_list, self->work[ED_IMAGE_TEXT].ob_spec.tedinfo->te_ptext);
	if (obj != NULL)
	{
		self->kind |= AW_STAY;
		edparm.acs = parm->acs;
		edparm.obj = obj;
		WI_IMAGE.create(&edparm);
		self->kind &= ~AW_STAY;
	}
}

/* -------------------------------------------------------------------------- */

static void edoim_ok(void)
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
	str = self->work[ED_IMAGE_TEXT].ob_spec.tedinfo->te_ptext;
	obj = find_entry(acs->im_list, str);
	if (obj == NULL)
	{
		alert_str(ERR_IM_DEL, str);
	} else
	{
		oldobj = (Obj_Head *)entry->obj.ob_spec.bitblk;
		if (obj != oldobj)
		{
			++obj->usage;
			entry->obj.ob_spec.bitblk = (BITBLK *)obj;
			del_image(acs, oldobj);
		}
		ed_abort();
	}
}

/* -------------------------------------------------------------------------- */

SUBMODE *edoim_set_image(OBJ_ENTRY *entry)
{
	OBJECT *tree;
	Obj_Head *obj;
	
	tree = Aob_create(&ED_IMAGE.root);
	if (tree == NULL)
		return NULL;
	obj = (Obj_Head *)entry->obj.ob_spec.bitblk;
	Aob_puttext(tree, ED_IMAGE_TEXT, obj->label);
	edoim_sm.tree = tree;
	return &edoim_sm;
}

/* -------------------------------------------------------------------------- */

static void edoim_list(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	
	self->kind |= AW_STAY;
	list_image.acs = parm->acs;
	list_image.objlist = parm->acs->im_list;
	WI_LIST.create(&list_image);
	self->kind &= ~AW_STAY;
}
