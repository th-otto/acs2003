#include "acs_i.h"
#include "country.h"

static void editus_ok(void);

static boolean user_service(Awindow *self, int16 task, void *in_out);
static Awindow *user_make(void *a);

#include "edusred.ah"
#include "edusred.h"

static void editus_term(Awindow *self);
static void editus_set_user(Awindow *self);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void editus_ok(void)
{
	editus_term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static Awindow *user_make(void *a)
{
	EDPARM *parm;
	EDPARM *newparm;
	Obj_Head *obj;
	Awindow *win;
	
	parm = a;
	newparm = NULL;
	obj = parm->obj;
	win = obj->window;
	if (win != NULL)
	{
		Awi_show(win);
	} else
	{
		newparm = Ax_malloc(sizeof(*newparm));
		if (newparm == NULL)
			return NULL;
		newparm->acs = parm->acs;
		newparm->obj = parm->obj;
		WI_USER.iconblk->monoblk.ib_ptext = WI_USER.info = obj->label;
		win = Awi_create(&WI_USER);
		if (win == NULL)
		{
			/* Ax_free(newparm); BUG: missing */
			return NULL;
		}
		wi_pos(win, &obj->pos, &parm->acs->last_rez);
		win->user = newparm;
		obj->window = win;
		editus_set_user(win);
		if (win->open(win) != OK)
		{
			editus_term(win);
			return NULL;
		}
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static boolean user_service(Awindow *self, int16 task, void *in_out)
{
	EDPARM *parm = self->user;
	
	switch (task)
	{
	case AS_TERM:
		editus_term(self);
		break;
	
	case AS_GUI_RENAME_OBJ:
		new_name(self, parm->obj);
		break;
	
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void editus_set_user(Awindow *self)
{
	OBJECT *tree;
	EDPARM *parm;
	AUSERBLK *user;
	Obj_Head *obj;
	const char *str;
	
	parm = self->user;
	tree = self->work;
	user = parm->obj->object;
	Aob_puttext(tree, EDIT_USER_CODE, ((Obj_Head *)user->ub_code)->label);
	Aob_puttext(tree, EDIT_USER_PARM, ((Obj_Head *)user->ub_parm)->label);
	if ((obj = (Obj_Head *)user->ub_serv) != NULL)
		str = obj->label;
	else
		str = "- NULL -";
	Aob_puttext(tree, EDIT_USER_SERV, str);
	if ((obj = (Obj_Head *)user->ub_ptr1) != NULL)
		str = obj->label;
	else
		str = "- NULL -";
	Aob_puttext(tree, EDIT_USER_PTR1, str);
	if ((obj = (Obj_Head *)user->ub_ptr2) != NULL)
		str = obj->label;
	else
		str = "- NULL -";
	Aob_puttext(tree, EDIT_USER_PTR2, str);
	if ((obj = (Obj_Head *)user->ub_ptr3) != NULL)
		str = obj->label;
	else
		str = "- NULL -";
	Aob_puttext(tree, EDIT_USER_PTR3, str);
	/* FIXME: bubble/context not set */
}

/* -------------------------------------------------------------------------- */

static void editus_term(Awindow *self)
{
	EDPARM *parm;
	
	self->state |= AWS_TERM;
	parm = self->user;
	parm->obj->window = NULL;
	if (self->state & AWS_ICONIZED)
		memcpy(&parm->obj->pos, &self->wi_normal, sizeof(parm->obj->pos));
	else
		memcpy(&parm->obj->pos, &self->wi_act, sizeof(parm->obj->pos));
	Ax_free(parm);
	Awi_closed(self);
	Awi_delete(self);
}
