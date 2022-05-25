#include "acsport.h"
#include "acs_i.h"

#ifndef C_UNION
#  define C_UNION(x) { (int32)(x) }
#endif

static OBJ_ENTRY subtree = {
	NULL, NULL,
	{ -1, -1, -1, G_BOX, 0x0080, 0x0020, C_UNION(0x00ff1101L), 0, 0, 12, 4 },
	{ NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 }
};
static Obj_Head protosub = {
	NULL,
	&subtree,
	0,
	sizeof(subtree),
	sizeof(subtree),
	NULL,
	"SUBPROTO",
	1, 0, { 0, 0, 0, 0 }
};

static void pup_edit(void);
static void set_menu(Awindow *self, int16 active);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 pu_init(Awindow *self)
{
	OBJECT *tree;
	AOBJECT *atree;
	OBJEDPARM *parm;
	Obj_Head *obj;
	int i, count;
	int obnr;
	
	if (ed_init(self) != OK)
		return FAIL;
	tree = self->work;
	atree = (AOBJECT *)tree;
	parm = self->user;
	obj = parm->obj;
	count = (int)(obj->used / sizeof(OBJ_ENTRY));
	tree[ROOT].ob_width = ACSblk->desk.w;
	tree[ROOT].ob_height = ACSblk->desk.h;
	for (i = 0; i < count; i++)
	{
		obnr = i * 3 + 3;
		atree[obnr].click = pup_edit;
	}
	set_menu(self, parm->active);
	return OK;
}

/* -------------------------------------------------------------------------- */

Awindow *pu_make(void *a)
{
	EDPARM *parm;
	OBJEDPARM *newparm;
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
		newparm->obj = obj;
		newparm->flags = 1;
		newparm->active = 2;
		newparm->act_obnr = 0;
		newparm->select = NULL;
		WI_POPUP.iconblk->monoblk.ib_ptext = WI_POPUP.info = obj->label;
		win = Awi_create(&WI_POPUP);
		if (win == NULL)
		{
			/* FIXME: leaks memory allocated above */
			return NULL;
		}
		wi_pos(win, &obj->pos, &parm->acs->last_rez);
		win->user = newparm;
		obj->window = win;
		if (win->open(win) != OK)
		{
			ed_term(win);
			return NULL;
		}
		
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static void new_menu(Awindow *self, int16 obnr)
{
	OBJEDPARM *parm;
	ACS_HEAD *acs;
	Obj_Head *obj;
	OBJ_ENTRY *objtree;
	int16 newob;
	
	parm = self->user;
	acs = parm->acs;
	obj = parm->obj;
	newob = copysub_ob(acs, obj, ROOT, &protosub);
	obnr = (obnr - 2) / 3;
	objtree = obj->object;
	objtree[obnr].obj.ob_head = objtree[obnr].obj.ob_tail = newob;
	objtree[newob].obj.ob_next = obnr;
	self->init(self);
}

/* -------------------------------------------------------------------------- */

static void open_menu(void)
{
	int16 obnr = ACSblk->ev_obnr;
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	int16 head;
	OBJEDPARM *parm;
	int16 active;
	
	head = tree[obnr].ob_head;
	Adr_unselect();
	parm = self->user;
	active = parm->active;
	if (head < 0)
	{
		Aev_release();
		if (Awi_alert(1, NEW_POPUP) == 2)
			return;
		new_menu(self, obnr);
		tree = self->work;
	}
	self->obchange(self, obnr - 1, tree[obnr - 1].ob_state | OS_SELECTED);
	head = tree[obnr].ob_head + 1;
	parm->active = head;
	parm->act_obnr = (head - 2) / 3;
	tree[active].ob_flags &= ~(AO_ACCEPT | AO_SILENT);
	tree[head].ob_flags |= AO_ACCEPT | AO_SILENT;
	set_menu(self, head);
	Awi_obredraw(self, head);
}

/* -------------------------------------------------------------------------- */

static void pup_edit(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	int16 obnr = ACSblk->ev_obnr;
	OBJEDPARM *parm = self->user;
	int16 active = parm->active;
	Axywh ob_rect;
	Axywh active_rect;
	OBJ_ENTRY *objtree;
	int16 next;
	
	Aob_offset(&active_rect, tree, active - 1);
	Aob_offset(&ob_rect, tree, obnr - 1);
	intersect(&active_rect, &ob_rect);
	if (active_rect.w != 0)
	{
		if (ACSblk->ev_mmobutton == 2 && Aob_up(tree, obnr) == active)
		{
			open_menu();
		} else
		{
			tree[obnr].ob_state |= OS_WHITEBAK;
			ed_edit();
			tree[obnr].ob_state &= ~OS_WHITEBAK;
		}
	} else
	{
		Adr_unselect();
		tree[active].ob_flags &= ~(AO_ACCEPT | AO_SILENT);
		undraw(self, active);
		obnr = tree[ROOT].ob_head + 1;
		while (tree[obnr].ob_next + 1 != active)
		{
			obnr = tree[obnr].ob_next + 1;
		}
		tree[obnr].ob_next = ROOT;
		tree[ROOT].ob_tail = obnr;
		objtree = parm->obj->object;
		objtree += (active - 2) / 3;
		next = objtree->obj.ob_next * 3 + 2;
		tree[next].ob_head = active - 1;
		tree[next].ob_tail = active;
		tree[active].ob_next = next;
		/* BUG? should be ob_state */
		self->obchange(self, next - 1, tree[next - 1].ob_flags & ~OS_SELECTED);
		parm->active = active = Aob_up(tree, next);
		if (active >= 0)
		{
			parm->act_obnr = (active - 2) / 3;
		} else
		{
			parm->act_obnr = NIL;
		}
		tree[active].ob_flags |= AO_ACCEPT | AO_SILENT;
	}
}

/* -------------------------------------------------------------------------- */

static void set_menu(Awindow *self, int16 active)
{
	OBJECT *tree = self->work;
	int16 obnr;
	
	obnr = Aob_up(tree, active);
	if (obnr >= 1)
	{
		tree[obnr].ob_head = tree[obnr].ob_tail = NIL;
		tree[obnr - 1].ob_state |= OS_SELECTED;
		tree[active].ob_flags &= ~OF_HIDETREE;
		tree[active - 1].ob_flags &= ~OF_HIDETREE;
		obnr = Aob_up(tree, obnr);
		set_menu(self, obnr);
		obnr = tree[ROOT].ob_tail;
		tree[active - 1].ob_y = tree[active].ob_y = tree[1].ob_y;
		tree[active - 1].ob_x = tree[active].ob_x = tree[obnr].ob_x + tree[obnr].ob_width + ACSblk->gl_wbox * 2;
		tree[active].ob_next = ROOT;
		tree[obnr].ob_next = active - 1;
		tree[ROOT].ob_tail = active;
	}
}

