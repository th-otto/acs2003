#include "acs_i.h"
#include "country.h"

static void editdat_abort(void);
static Awindow *dt_make(void *a);
static boolean dt_service(Awindow *self, int16 task, void *in_out);

#include "eddataed.ah"

static void set_data(Awindow *self);
static void term(Awindow *self);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void editdat_abort(void)
{
	term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static Awindow *dt_make(void *parm)
{
	EDPARM *data = parm;
	Obj_Head *obj;
	EDPARM *newparm;
	Awindow *win;

	obj = data->obj;
	win = obj->window;
	if (win != NULL)
	{
		Awi_show(win);
	} else
	{
		newparm = Ax_malloc(sizeof(*newparm));
		if (newparm == NULL)
			return NULL;
		memcpy(newparm, data, sizeof(*newparm));
		WI_DATA.iconblk->monoblk.ib_ptext = WI_DATA.info = obj->label;
		win = Awi_create(&WI_DATA);
		if (win == NULL)
			return NULL;
		wi_pos(win, &obj->pos, &data->acs->last_rez);
		win->user = newparm;
		obj->window = win;
		set_data(win);
		if (win->open(win) != OK)
		{
			term(win);
			return NULL;
		}
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static boolean dt_service(Awindow *self, int16 task, void *in_out)
{
	EDPARM *parm = self->user;

	switch (task)
	{
	case AS_TERM:
		term(self);
		break;
	case AS_GUI_10000:
		new_name(self, parm->obj);
		break;
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void set_data(Awindow *self)
{
	EDPARM *parm;
	
	parm = self->user;
	/* maybe some ifdef'd debug code here */
	(void) parm;
	(void) self;
}

/* -------------------------------------------------------------------------- */

static void term(Awindow *self)
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
