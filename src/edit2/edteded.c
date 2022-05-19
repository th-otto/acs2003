#include "acs_i.h"
#include "country.h"

static void editte_ok(void);

static boolean tedi_service(Awindow *self, int16 task, void *in_out);
static Awindow *tedi_make(void *a);

#include "edteded.ah"
#include "edteded.h"

static void editte_term(Awindow *self);
static void editte_set_tedi(Awindow *self);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void editte_ok(void)
{
	editte_term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static Awindow *tedi_make(void *a)
{
	EDPARM *parm;
	EDPARM *newparm;
	Obj_Head *obj;
	Awindow *win;
	
	parm = a;
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
		WI_TEDI.iconblk->monoblk.ib_ptext = WI_TEDI.info = obj->label;
		win = Awi_create(&WI_TEDI);
		if (win == NULL)
		{
			/* Ax_free(newparm); BUG: missing */
			return NULL;
		}
		wi_pos(win, &obj->pos, &parm->acs->last_rez);
		win->user = newparm;
		obj->window = win;
		editte_set_tedi(win);
		if (win->open(win) != OK)
		{
			editte_term(win);
			return NULL;
		}
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static boolean tedi_service(Awindow *self, int16 task, void *in_out)
{
	EDPARM *parm = self->user;
	
	switch (task)
	{
	case AS_TERM:
		editte_term(self);
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

static void editte_set_tedi(Awindow *self)
{
	OBJECT *tree;
	EDPARM *parm;
	TEDINFO *ted;
	
	parm = self->user;
	tree = self->work;
	ted = parm->obj->object;
	Aob_puttext(tree, EDIT_TEDI_PTEXT, ((Obj_Head *)ted->te_ptext)->object);
	Aob_puttext(tree, EDIT_TEDI_PTMPLT, ((Obj_Head *)ted->te_ptmplt)->object);
	Aob_puttext(tree, EDIT_TEDI_PVALID, ((Obj_Head *)ted->te_pvalid)->object);
}

/* -------------------------------------------------------------------------- */

static void editte_term(Awindow *self)
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
