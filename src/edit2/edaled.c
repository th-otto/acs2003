#include "acs_i.h"
#include "country.h"

static void edal_newim(void);
static void edal_ok(void);
static void edal_abort(void);
static void edal_try(void);

static boolean al_service(Awindow *self, int16 task, void *in_out);
static Awindow *al_make(void *a);

#include "edaled.ah"

static void get_alert(Awindow *self, char *buf);
static void accept_alert(Awindow *self);
static void term(Awindow *self);
static void set_alert(Awindow *self);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edal_try(void)
{
	char buf[256];
	
	get_alert(ACSblk->ev_window, buf);
	if (ACSblk->ev_mmokstate & K_CTRL)
		form_alert(1, buf);
	else
		Awi_alert(1, buf);
}	

/* -------------------------------------------------------------------------- */

static void edal_newim(void)
{
	Awindow *self = ACSblk->ev_window;
	int16 select;
	OBJECT *popup;
	
	popup = &NEW_IMAGE;
	if ((select = Ame_popup(self, popup, -1, -1)) >= 0)
	{
		self->work[EDIT_ALERT_ICON].ob_spec.bitblk = popup[select].ob_spec.bitblk;
		Awi_obredraw(self, EDIT_ALERT_ICON);
	}
}

/* -------------------------------------------------------------------------- */

static void edal_ok(void)
{
	accept_alert(ACSblk->ev_window);
	term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void edal_abort(void)
{
	term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

/*
 * FIXME: does not properly quote | and ]
 */
static void get_alert(Awindow *self, char *buf)
{
	OBJECT *tree = self->work;
	char *str;
	
	strcpy(buf, "[0][");
	if (tree[EDIT_ALERT_ICON].ob_spec.bitblk == &IM_NONE)
		buf[1] = '0';
	if (tree[EDIT_ALERT_ICON].ob_spec.bitblk == &IM_EXCLAM)
		buf[1] = '1';
	if (tree[EDIT_ALERT_ICON].ob_spec.bitblk == &IM_QUEST)
		buf[1] = '2';
	if (tree[EDIT_ALERT_ICON].ob_spec.bitblk == &IM_STOP)
		buf[1] = '3';
	if (tree[EDIT_ALERT_ICON].ob_spec.bitblk == &IM_TIME)
		buf[1] = '4';
	buf += 4;
	Auo_boxed(&tree[EDIT_ALERT_STR1], AUO_GETVAL, &str);
	if (*str != '\0')
	{
		strcat(buf, str);
	}
	Auo_boxed(&tree[EDIT_ALERT_STR2], AUO_GETVAL, &str);
	if (*str != '\0')
	{
		strcat(strcat(buf, "|"), str);
	}
	Auo_boxed(&tree[EDIT_ALERT_STR3], AUO_GETVAL, &str);
	if (*str != '\0')
	{
		strcat(strcat(buf, "|"), str);
	}
	Auo_boxed(&tree[EDIT_ALERT_STR4], AUO_GETVAL, &str);
	if (*str != '\0')
	{
		strcat(strcat(buf, "|"), str);
	}
	Auo_boxed(&tree[EDIT_ALERT_STR5], AUO_GETVAL, &str);
	if (*str != '\0')
	{
		strcat(strcat(buf, "|"), str);
	}
	strcat(buf, "][");
	Auo_boxed(&tree[EDIT_ALERT_BUTTON1], AUO_GETVAL, &str);
	if (*str != '\0')
	{
		strcat(buf, str);
	}
	Auo_boxed(&tree[EDIT_ALERT_BUTTON2], AUO_GETVAL, &str);
	if (*str != '\0')
	{
		strcat(strcat(buf, "|"), str);
	}
	Auo_boxed(&tree[EDIT_ALERT_BUTTON3], AUO_GETVAL, &str);
	if (*str != '\0')
	{
		strcat(strcat(buf, "|"), str);
	}
	strcat(buf, "]");
}

/* -------------------------------------------------------------------------- */

/*
 * OK button pressed, accept input
 */
static void accept_alert(Awindow *self)
{
	EDPARM *parm = self->user;
	char buf[256];
	size_t len;
	char *str;
	
	parm->acs->flags |= ACS_CHANGED;
	get_alert(self, buf);
	len = strlen(buf) + 1;
	if ((str = Ax_malloc(len)) != NULL)
	{
		strcpy(str, buf);
		Ax_free(parm->obj->object);
		parm->obj->object = str;
		parm->obj->size = len;
		parm->obj->used = len;
	}
}

/* -------------------------------------------------------------------------- */

static Awindow *al_make(void *a)
{
	EDPARM *parm = a;
	Obj_Head *obj;
	EDPARM *newparm;
	Awindow *win;

	obj = parm->obj;
	win = obj->window;
	if (win != NULL)
	{
		Awi_show(win);
	} else
	{
		if ((newparm = Ax_malloc(sizeof(*newparm))) == NULL)
			return NULL;
		memcpy(newparm, parm, sizeof(*newparm));
		WI_ALERT.iconblk->monoblk.ib_ptext = WI_ALERT.info = obj->label;
		win = Awi_create(&WI_ALERT);
		if (win == NULL)
			return NULL;
		wi_pos(win, &obj->pos, &parm->acs->last_rez);
		win->user = newparm;
		obj->window = win;
		set_alert(win);
		if (win->open(win) != OK)
		{
			term(win);
			return NULL;
		}
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static boolean al_service(Awindow *self, int16 task, void *in_out)
{
	EDPARM *parm = self->user;
	
	switch (task)
	{
	case AS_TERM:
		accept_alert(self); /* BUG: closing window should be treated as cancel */
		term(self);
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

static char *find_brk(char *str, boolean *cont)
{
	str--;
	do
	{
		str++;
	} while ((*str != '\0' && *str != '|' && *str != ']') ||
		(*str != '\0' && *str == ']' && str[-1] == '['));
	*cont = *str == '|';
	*str = '\0';
	return str;
}

/* -------------------------------------------------------------------------- */

static void set_alert(Awindow *self)
{
	EDPARM *parm = self->user;
	char buf[256];
	boolean cont;
	OBJECT *tree;
	char *ptr;
	char *end;
	
	tree = self->work;
	strcpy(buf, parm->obj->object);
	switch (buf[1])
	{
	case '0':
		tree[EDIT_ALERT_ICON].ob_spec.bitblk = &IM_NONE;
		break;
	case '1':
		tree[EDIT_ALERT_ICON].ob_spec.bitblk = &IM_EXCLAM;
		break;
	case '2':
		tree[EDIT_ALERT_ICON].ob_spec.bitblk = &IM_QUEST;
		break;
	case '3':
		tree[EDIT_ALERT_ICON].ob_spec.bitblk = &IM_STOP;
		break;
	case '4':
		tree[EDIT_ALERT_ICON].ob_spec.bitblk = &IM_TIME;
		break;
	}
	
	oe_beself(self, tree, EDIT_ALERT_STR1);
	oe_beself(self, tree, EDIT_ALERT_STR2);
	oe_beself(self, tree, EDIT_ALERT_STR3);
	oe_beself(self, tree, EDIT_ALERT_STR4);
	oe_beself(self, tree, EDIT_ALERT_STR5);
	oe_beself(self, tree, EDIT_ALERT_BUTTON1);
	oe_beself(self, tree, EDIT_ALERT_BUTTON2);
	oe_beself(self, tree, EDIT_ALERT_BUTTON3);
	
	ptr = &buf[4];
	end = find_brk(ptr, &cont);
	Aob_puttext(tree, EDIT_ALERT_STR1, ptr);
	if (cont)
	{
		ptr = &end[1];
		end = find_brk(ptr, &cont);
		Aob_puttext(tree, EDIT_ALERT_STR2, ptr);
		if (cont)
		{
			ptr = &end[1];
			end = find_brk(ptr, &cont);
			Aob_puttext(tree, EDIT_ALERT_STR3, ptr);
			if (cont)
			{
				ptr = &end[1];
				end = find_brk(ptr, &cont);
				Aob_puttext(tree, EDIT_ALERT_STR4, ptr);
				if (cont)
				{
					ptr = &end[1];
					end = find_brk(ptr, &cont);
					Aob_puttext(tree, EDIT_ALERT_STR5, ptr);
				}
			}
		}
	}
	
	ptr = &end[2];
	end = find_brk(ptr, &cont);
	Aob_puttext(tree, EDIT_ALERT_BUTTON1, ptr);
	if (cont)
	{
		ptr = &end[1];
		end = find_brk(ptr, &cont);
		Aob_puttext(tree, EDIT_ALERT_BUTTON2, ptr);
		if (cont)
		{
			ptr = &end[1];
			end = find_brk(ptr, &cont);
			Aob_puttext(tree, EDIT_ALERT_BUTTON3, ptr);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void term(Awindow *self)
{
	EDPARM *parm;

	parm = self->user;
	parm->obj->window = NULL;
	if (self->state & AWS_ICONIZED)
		memcpy(&parm->obj->pos, &self->wi_normal, sizeof(parm->obj->pos));
	else
		memcpy(&parm->obj->pos, &self->wi_act, sizeof(parm->obj->pos));
	Ax_free(parm);
	Awi_delete(self);
}
