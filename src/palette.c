#include "acs_i.h"
#include "country.h"

static Awindow *mp_make(void *para);
static boolean mp_service(Awindow *self, int16 task, void *in_out);
static void edmp_set(void);
static void edmp_acc(void);

#include "palette.ah"

static void set_mouse(Awindow *win);
static void term(Awindow *win);

static MFORM formtest;

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edmp_acc(void)
{
	ACS_HEAD *acs;
	AOBJECT *asel;
	AOBJECT *aobj;
	MFORM *mouse;
	OBJECT *tree;
	int16 next;
	int16 obnr;
	Amouse *oldform;
	Amouse *mform;
	Awindow *select;
	Awindow *self;
	
	self = ACSblk->ev_window;
	tree = self->work;
	obnr = ACSblk->ev_obnr;
	select = ACSblk->Aselect.window;
	ACSblk->Aselect.next = 0;
	if ((next = Adr_next()) > 0)
	{
		asel = (AOBJECT *)&select->work[next] + 1;
		if (asel->type == LIST_MOUSE || asel->type == LIST_AMOUSE)
		{
			aobj = (AOBJECT *)&tree[obnr] + 1;
			Adr_del(select, next);
			acs = self->user;
			if (asel->type == LIST_MOUSE)
			{
				mouse = (MFORM *)add_mouse(acs, (Obj_Head *)asel->userp1);
			} else
			{
				mform = asel->userp1;
				if (mform->number == USER_DEF)
					mouse = (MFORM *)add_mouse(acs, (Obj_Head *)mform->form);
				else
					mouse = NULL;
			}
			oldform = aobj->userp1;
			if (oldform->number == USER_DEF)
				del_mouse(acs, (Obj_Head *)oldform->form);
			if (mouse != NULL)
			{
				oldform->number = USER_DEF;
				oldform->form = mouse;
			} else
			{
				oldform->number = mform->number;
				oldform->form = NULL;
			}
			set_mouse(self);
			Awi_obredraw(self, obnr);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void edmp_set(void)
{
	AOBJECT *aobj;
	Amouse *mouse;
	MFORM *mform;
	
	aobj = (AOBJECT *)&ACSblk->ev_object[ACSblk->ev_obnr] + 1;
	mouse = aobj->userp1;
	ACSblk->description->mouse[31].number = mouse->number;
	if (mouse->number == USER_DEF)
	{
		ACSblk->description->mouse[31].form = &formtest;
		mform = ((Obj_Head *)mouse->form)->object;
		memcpy(&formtest, mform, sizeof(formtest));
	}
}

/* -------------------------------------------------------------------------- */

static Awindow *mp_make(void *para)
{
	ACS_HEAD *acs;
	Awindow *self;
	char info[__PS__];
	
	acs = para;
	if (acs->wi_palette != NULL)
	{
		Awi_show(acs->wi_palette);
		return acs->wi_palette;
	}
	info[0] = ' ';
	strcpy(&info[1], acs->filename);
	WI_PALETTE.info = info;
	if ((self = Awi_create(&WI_PALETTE)) == NULL)
		return NULL;
	wi_pos(self, &acs->pos_pa, &acs->last_rez);
	self->user = acs;
	acs->wi_palette = self;
	set_mouse(self);
	if (self->open(self) != OK)
	{
		term(self);
		return NULL;
	}
	return self;
}

/* -------------------------------------------------------------------------- */

static boolean mp_service(Awindow *self, int16 task, void *in_out)
{
	switch (task)
	{
	case AS_TERM:
		term(self);
		break;
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void set_mouse(Awindow *win)
{
	ACS_HEAD *acs;
	Obj_Head *formobj;
	OBJECT *tree;
	AOBJECT *atree;
	ICONBLK *icon;
	MFORM *form;
	Amouse *mouse;
	int16 idx;
	long mo_index;
	
	acs = win->user;
	tree = win->work;
	atree = (AOBJECT *)(tree + 1);
	mo_index = 0;
	mouse = acs->descr.mouse;
	for (idx = tree->ob_head; idx != ROOT; idx = tree[idx].ob_next)
	{
		tree[idx].ob_width = 16;
		tree[idx].ob_height = 20;
		icon = tree[idx].ob_spec.iconblk;
		icon->ib_char = 0x1000; /* fg = BLACK, bg = WHITE */
		icon->ib_xtext = 0;
		icon->ib_ytext = 18;
		icon->ib_wtext = 16;
		icon->ib_htext = 2;
		atree[idx].userp1 = mouse;
		atree[idx].userp2 = (void *)mo_index;
		mo_index++;
		atree[idx].type = LIST_AMOUSE;
		switch (mouse->number)
		{
		case ARROW:
			icon->ib_pmask = MO_ARROW.monoblk.ib_pmask;
			icon->ib_pdata = MO_ARROW.monoblk.ib_pdata;
			break;
		case TEXT_CRSR:
			icon->ib_pmask = MO_TEXT_CRSR.monoblk.ib_pmask;
			icon->ib_pdata = MO_TEXT_CRSR.monoblk.ib_pdata;
			break;
		case BUSYBEE:
			icon->ib_pmask = MO_BUSYBEE.monoblk.ib_pmask;
			icon->ib_pdata = MO_BUSYBEE.monoblk.ib_pdata;
			break;
		case POINT_HAND:
			icon->ib_pmask = MO_POINT_HAND.monoblk.ib_pmask;
			icon->ib_pdata = MO_POINT_HAND.monoblk.ib_pdata;
			break;
		case FLAT_HAND:
			icon->ib_pmask = MO_FLAT_HAND.monoblk.ib_pmask;
			icon->ib_pdata = MO_FLAT_HAND.monoblk.ib_pdata;
			break;
		case THIN_CROSS:
			icon->ib_pmask = MO_THIN_CROSS.monoblk.ib_pmask;
			icon->ib_pdata = MO_THIN_CROSS.monoblk.ib_pdata;
			break;
		case THICK_CROSS:
			icon->ib_pmask = MO_THICK_CROSS.monoblk.ib_pmask;
			icon->ib_pdata = MO_THICK_CROSS.monoblk.ib_pdata;
			break;
		case OUTLN_CROSS:
			icon->ib_pmask = MO_OUTL_CROSS.monoblk.ib_pmask;
			icon->ib_pdata = MO_OUTL_CROSS.monoblk.ib_pdata;
			break;
		case USER_DEF:
			formobj = (Obj_Head *)mouse->form;
			form = formobj->object;
			icon->ib_char = ((form->mf_bg << 12)) | ((form->mf_fg & 0xf) << 8);
			icon->ib_pmask = form->mf_mask;
			icon->ib_pdata = form->mf_data;
			break;
		}
		mouse++;
	}
}

/* -------------------------------------------------------------------------- */

static void term(Awindow *self)
{
	ACS_HEAD *acs;
	
	acs = self->user;
	if (self->state & AWS_ICONIZED)
		memcpy(&acs->pos_pa, &self->wi_normal, sizeof(acs->pos_pa));
	else
		memcpy(&acs->pos_pa, &self->wi_act, sizeof(acs->pos_pa));
	Awi_delete(self);
	acs->wi_palette = NULL;
}
