#include "acs_i.h"
#include "country.h"

static void editstr_ok(void);
static void editstr_abort(void);

static boolean st_service(Awindow *self, int16 task, void *in_out);
static Awindow *st_make(void *a);

#include "edstred.ah"
#include "edstred.h"

static void editstr_term(Awindow *self);
static void acc_string(Awindow *self);
static void set_string(Awindow *self);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void editstr_abort(void)
{
	editstr_term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void editstr_ok(void)
{
	acc_string(ACSblk->ev_window);
	editstr_term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void acc_string(Awindow *self)
{
	EDPARM *parm;
	char buf[BE_MAXLEN * 2 + 2];
	char *str2;
	char *str1;
	OBJECT *tree;
	char *newstr;
	Awindow *win;
	
	parm = self->user;
	parm->acs->flags |= ACS_CHANGED;
	tree = self->work;
	Auo_boxed(&tree[EDIT_STRING_STR1], AUO_GETVAL, &str1);
	Auo_boxed(&tree[EDIT_STRING_STR2], AUO_GETVAL, &str2);
	strcat(strcpy(buf, str1), str2);
	if ((newstr = Ast_create(buf)) != NULL)
	{
		Ax_free(parm->obj->object);
		parm->obj->object = newstr;
		parm->obj->used = parm->obj->size = strlen(newstr) + 1;
		win = parm->acs->st_list->window;
		if (win != NULL)
			win->state |= AWS_LATEUPDATE;
		(void)tree; /* FIXME: useless cast to get registers right */
	}
}

/* -------------------------------------------------------------------------- */

static Awindow *st_make(void *a)
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
		if ((newparm = Ax_malloc(sizeof(*newparm))) == NULL)
			return NULL;
		newparm->acs = parm->acs;
		newparm->obj = parm->obj;
		WI_STRING.iconblk->monoblk.ib_ptext = WI_STRING.info = obj->label;
		win = Awi_create(&WI_STRING);
		if (win == NULL)
		{
			/* Ax_free(newparm); BUG: missing */
			return NULL;
		}
		wi_pos(win, &obj->pos, &parm->acs->last_rez);
		win->user = newparm;
		obj->window = win;
		set_string(win);
		if (win->open(win) != OK)
		{
			editstr_term(win);
			return NULL;
		}
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static boolean st_service(Awindow *self, int16 task, void *in_out)
{
	EDPARM *parm = self->user;
	
	switch (task)
	{
	case AS_TERM:
		acc_string(self);
		editstr_term(self);
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

static void set_string(Awindow *self)
{
	EDPARM *parm = self->user;
	OBJECT *tree;
	char buf[BE_MAXLEN + 1];
	int len;
	char *str;
	
	tree = self->work;
	str = parm->obj->object;
	len = (int)strlen(str);
	if (len > BE_MAXLEN)
	{
		strncpy(buf, &str[BE_MAXLEN], BE_MAXLEN);
		buf[BE_MAXLEN] = '\0';
		len = BE_MAXLEN;
	} else
	{
		buf[0] = '\0';
	}
	Aob_printf(tree, EDIT_STRING_STR1, "%-*s", len, str);
	Aob_puttext(tree, EDIT_STRING_STR2, buf);
}

/* -------------------------------------------------------------------------- */

static void editstr_term(Awindow *self)
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
