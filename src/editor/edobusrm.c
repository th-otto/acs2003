#include "acs_i.h"
#include "country.h"

static void edus_ok(void);
static void edus_list(void);
static void edus_ref(void);
static void edus_ptr(void);

#include "edobusrm.ah"
#include "edobusrm.h"

static SUBMODE edus_sm = { NULL, edus_ok, Aob_delete, title, help_title, NULL };

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edus_ok(void)
{
	OBJEDPARM *parm;
	OBJECT *tree;
	OBJ_ENTRY *entry;
	char *strs[8];
	Obj_Head *auser;
	Obj_Head *obj;
	
	parm = ACSblk->ev_window->user;
	tree = ACSblk->ev_window->work;
	entry = parm->obj->object;
	entry += parm->act_obnr;
	auser = (Obj_Head *)entry->obj.ob_spec.auserblk;
	Auo_boxed(&tree[ED_USER_CODE], AUO_GETVAL, &strs[0]);
	Auo_boxed(&tree[ED_USER_PARM], AUO_GETVAL, &strs[1]);
	if (Ast_isEmpty(strs[0]) || Ast_isEmpty(strs[1]))
	{
		Awi_alert(1, ERR_MUST);
		return;
	}
	Auo_boxed(&tree[ED_USER_SERV], AUO_GETVAL, &strs[2]);
	Auo_boxed(&tree[ED_USER_PTR1], AUO_GETVAL, &strs[3]);
	Auo_boxed(&tree[ED_USER_PTR2], AUO_GETVAL, &strs[4]);
	Auo_boxed(&tree[ED_USER_PTR3], AUO_GETVAL, &strs[5]);
	Auo_boxed(&tree[ED_USER_BUBBLE], AUO_GETVAL, &strs[6]);
	Auo_boxed(&tree[ED_USER_CONTEXT], AUO_GETVAL, &strs[7]);
	obj = change_user(parm->acs, auser, strs);
	if (obj != NULL)
		entry->obj.ob_spec.auserblk = (AUSERBLK *)obj;
	ed_abort();
}

/* -------------------------------------------------------------------------- */

static void edus_list(void)
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

static void edus_accept(boolean isptr)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	Awindow *select = ACSblk->Aselect.window;
	int16 obnr;
	AOBJECT *aobj;
	Obj_Head *label;
	
	ACSblk->Aselect.next = 0; /* Adr_start() */
	if ((obnr = Adr_next()) > 0)
	{
		aobj = (AOBJECT *)&select->work[obnr] + 1;
		if (aobj->type == LIST_REFS ||
			(isptr && (aobj->type == LIST_DATA || aobj->type == LIST_STRING)))
		{
			label = aobj->userp1;
			Awi_diaend();
			Aob_puttext(tree, ACSblk->ev_obnr, label->label);
			self->obchange(self, ACSblk->ev_obnr, -1);
			Awi_diastart();
			Adr_del(select, obnr);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void edus_ref(void)
{
	edus_accept(FALSE);
}

/* -------------------------------------------------------------------------- */

static void edus_ptr(void)
{
	edus_accept(TRUE);
}

/* -------------------------------------------------------------------------- */

SUBMODE *edus_set_user(OBJ_ENTRY *entry)
{
	OBJECT *tree;
	Obj_Head *obj;
	AUSERBLK *auser;
	char buf[STRING_MAX + 2];
	
	tree = Aob_create(&ED_USER.root);
	if (tree == NULL)
		return NULL;
	obj = (Obj_Head *)entry->obj.ob_spec.auserblk;
	oe_beself(ACSblk->ev_window, tree, ED_USER_CODE);
	oe_beself(ACSblk->ev_window, tree, ED_USER_PARM);
	oe_beself(ACSblk->ev_window, tree, ED_USER_SERV);
	oe_beself(ACSblk->ev_window, tree, ED_USER_PTR1);
	oe_beself(ACSblk->ev_window, tree, ED_USER_PTR2);
	oe_beself(ACSblk->ev_window, tree, ED_USER_PTR3);
	oe_beself(ACSblk->ev_window, tree, ED_USER_BUBBLE);
	oe_beself(ACSblk->ev_window, tree, ED_USER_CONTEXT);
	
	auser = obj->object;
	set_ref((Obj_Head *)auser->ub_code, buf);
	Auo_boxed(&tree[ED_USER_CODE], AUO_SETVAL, buf);
	set_ref((Obj_Head *)auser->ub_parm, buf);
	Auo_boxed(&tree[ED_USER_PARM], AUO_SETVAL, buf);
	set_ref((Obj_Head *)auser->ub_serv, buf);
	Auo_boxed(&tree[ED_USER_SERV], AUO_SETVAL, buf);
	set_ref((Obj_Head *)auser->ub_ptr1, buf);
	Auo_boxed(&tree[ED_USER_PTR1], AUO_SETVAL, buf);
	set_ref((Obj_Head *)auser->ub_ptr2, buf);
	Auo_boxed(&tree[ED_USER_PTR2], AUO_SETVAL, buf);
	set_ref((Obj_Head *)auser->ub_ptr3, buf);
	Auo_boxed(&tree[ED_USER_PTR3], AUO_SETVAL, buf);
	set_val((Obj_Head *)auser->bubble, buf);
	Auo_boxed(&tree[ED_USER_BUBBLE], AUO_SETVAL, buf);
	set_val((Obj_Head *)auser->context, buf);
	Auo_boxed(&tree[ED_USER_CONTEXT], AUO_SETVAL, buf);
	
	edus_sm.tree = tree;
	return &edus_sm;
}
