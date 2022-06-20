#include "acs_i.h"
#include "country.h"

static void mbar_dragged(void);
static void new_title(void);
static void title_dragged(void);
static void obspec_only(void);
static void title_edit(void);
static void tdragged(Awindow *self, int16 obnr);
static void ti_delete(Awindow *self);
static void title_dragsize(Awindow *self, int16 obnr);

#ifndef C_UNION
#  define C_UNION(x) { (int32)(x) }
#endif

static OBJ_ENTRY droptree = {
	NULL, NULL,
	{ -1, -1, -1, G_BOX, 0, 0, C_UNION(0x00ff1101L), 0, 0, 12, 1 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 }
};
static Obj_Head protodrop = {
	NULL,
	&droptree,
	0,
	sizeof(droptree),
	sizeof(droptree),
	NULL,
	"DROPPROTO",
	1, 0, { 0, 0, 0, 0 }
};


/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void align(OBJ_ENTRY *entry)
{
	int16 thebar;
	int16 theactive;
	int16 title;
	int16 item;
	int16 w;
	int16 box;
	int16 x;
	
	thebar = entry->obj.ob_head;
	theactive = entry[thebar].obj.ob_head;
	x = entry[theactive].obj.ob_x;
	thebar = entry[thebar].obj.ob_next;
	title = entry[theactive].obj.ob_head;
	entry[title].obj.ob_state &= ~AOS_CONST;
	box = entry[thebar].obj.ob_head;
	item = entry[box].obj.ob_head;
	w = entry[box].obj.ob_width;
	entry[item].obj.ob_width = w;
	item = entry[item].obj.ob_next;
	entry[item].obj.ob_width = w;
	w = 0;
	while (title != theactive)
	{
		entry[title].obj.ob_y = 0;
		entry[title].obj.ob_x = w;
		entry[box].obj.ob_x = w + x;
		w += entry[title].obj.ob_width;
		title = entry[title].obj.ob_next;
		box = entry[box].obj.ob_next;
	}
	entry[theactive].obj.ob_width = w;
}

/* -------------------------------------------------------------------------- */

static int16 find_drop(OBJECT *tree, int16 obnr)
{
	int16 thebar;
	int16 box;
	int16 title;
	int16 theactive;
	
	thebar = tree->ob_head + 1;
	thebar = tree[thebar].ob_head + 1;
	theactive = tree[thebar].ob_head + 1;
	title = tree[theactive].ob_head + 1;
	box = tree[thebar].ob_next + 1; /* BUG? thebar aleady points to title box */
	box = tree[box].ob_head + 1;
	while (theactive + 1 != title)
	{
		if (title == obnr)
			return box;
		title = tree[title].ob_next + 1;
		box = tree[box].ob_next + 1;
	}
	return NIL;
}

/* -------------------------------------------------------------------------- */

static int16 find_title(OBJECT *tree, int16 obnr)
{
	int16 thebar;
	int16 box;
	int16 title;
	int16 theactive;
	int16 subbox;
	
	thebar = tree->ob_head + 1;
	thebar = tree[thebar].ob_head + 1;
	theactive = tree[thebar].ob_head + 1;
	title = tree[theactive].ob_head + 1;
	subbox = tree[thebar].ob_next + 1; /* BUG? thebar aleady points to title box */
	box = tree[subbox].ob_head + 1;
	while (subbox + 1 != box)
	{
		if (box == obnr)
			return title;
		title = tree[title].ob_next + 1;
		box = tree[box].ob_next + 1;
	}
	return NIL;
}

/* -------------------------------------------------------------------------- */

int16 me_init(Awindow *self)
{
	OBJEDPARM *parm = self->user;
	int16 ret;
	OBJECT *tree;
	AOBJECT *atree;
	int16 thebar;
	int16 theactive;
	int16 title;
	int16 box;
	int16 subbox;
	int16 entry;
	
	align(parm->obj->object);
	ret = ed_init(self);
	if (ret == OK)
	{
		tree = self->work;
		atree = (AOBJECT *)tree;
		thebar = tree->ob_head;
		tree->ob_width -= tree[thebar].ob_x * 2;
		tree->ob_height -= tree[thebar].ob_y * 2;
		tree[thebar].ob_x = tree[thebar + 1].ob_x = 0;
		tree[thebar].ob_y = tree[thebar + 1].ob_y = 0;
		tree[thebar + 1].ob_flags = OF_NONE;
		thebar = tree[thebar + 1].ob_head;
		tree[thebar].ob_spec.index = 0x00FF1100L;
		tree[thebar + 1].ob_flags |= AO_ACCEPT | AO_SILENT;
		atree[thebar + 2].drag = mbar_dragged;
		atree[thebar + 2].click = new_title;
		theactive = tree[thebar + 1].ob_head;
		tree[theactive + 1].ob_flags = OF_NONE;
		title = tree[theactive + 1].ob_head;
		Ast_delete(tree[title].ob_spec.free_string);
		tree[title].ob_spec.free_string = Ast_create(" NAME");
		tree[title + 1].ob_flags |= AO_ACCEPT | AO_SILENT;
		atree[title + 2].click = new_title;
		atree[title + 2].drag = title_dragged;
		title = tree[title + 1].ob_next;
		while (theactive + 1 != title)
		{
			tree[title + 1].ob_flags |= AO_ACCEPT | AO_SILENT;
			atree[title + 2].type = 11001;
			atree[title + 2].click = title_edit;
			atree[title + 2].drag = title_dragged;
			title = tree[title + 1].ob_next;
		}
		
		box = tree[thebar + 1].ob_next;
		atree[box + 2].click = new_title;
		subbox = tree[box + 1].ob_head;
		tree[subbox + 1].ob_flags = OF_NONE;
		atree[subbox + 2].drag = NULL;
		entry = tree[subbox + 1].ob_head;
		atree[entry + 2].click = obspec_only;
		entry = tree[entry + 1].ob_next;
		if (subbox + 1 != entry)
		{
			atree[entry + 2].click = obspec_only;
			entry = tree[entry + 1].ob_next;
			if (subbox + 1 != entry)
			{
				while (subbox + 1 != entry)
				{
					tree[entry + 1].ob_flags = OF_NONE;
					Ast_delete(tree[entry].ob_spec.free_string);
#if WITH_FIXES && COUNTRY != COUNTRY_DE
					tree[entry].ob_spec.free_string = Ast_create("  ACC ENTRY");
#else
					tree[entry].ob_spec.free_string = Ast_create("  ACC EINTRAG");
#endif
					entry = tree[entry + 1].ob_next;
				}
			}
		}
		
		while (box + 1 != subbox)
		{
			tree[subbox].ob_flags |= OF_HIDETREE;
			tree[subbox + 1].ob_flags |= OF_HIDETREE;
			subbox = tree[subbox + 1].ob_next;
		}

		subbox = parm->active;
		if (subbox > 0)
		{
			entry = find_title(tree, subbox);
			tree[entry - 1].ob_state |= OS_SELECTED;
			if (entry != tree[theactive + 1].ob_head + 1)
				tree[entry].ob_state |= OS_SELECTED;
			tree[subbox - 1].ob_flags &= ~OF_HIDETREE;
			tree[subbox].ob_flags &= ~OF_HIDETREE;
		}
	}
	return ret;
}

/* -------------------------------------------------------------------------- */

Awindow *me_make(void *a)
{
	EDPARM *parm;
	Obj_Head *obj;
	Awindow *win;
	OBJEDPARM *newparm;
	
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
		newparm->flags = 1;
		newparm->active = -1;
		newparm->act_obnr = -1;
		newparm->select = NULL;
		WI_MENU.iconblk->monoblk.ib_ptext = WI_MENU.info = obj->label;
		win = Awi_create(&WI_MENU);
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

static void make_title(Awindow *self, int16 title, int16 entry, boolean moveit)
{
	Awindow *select;
	AOBJECT *aobj;
	int16 theactive;
	int16 thedesk;
	int16 head;
	int16 idx;
	Obj_Head *palette;
	OBJEDPARM *parm;
	ACS_HEAD *acs;
	OBJ_ENTRY *objtree;
	Obj_Head *obj;
	int16 newtitle;
	int16 newbox;
	int16 thebar;
	int16 lasttitle;
	int16 box;
	int16 tail;
	int16 stitle;
	int16 newentry;
	
	select = ACSblk->Aselect.window;
	aobj = (AOBJECT *)&select->work[title] + 1;
	if (aobj->type != 11000 && aobj->type != 11001)
		return;
	palette = aobj->userp1;
	objtree = palette->object;
	idx = (int16)(int32)aobj->userp2;
	if ((char)objtree[idx].obj.ob_type != G_TITLE || objtree[idx].obj.ob_head != NIL)
		return;
	parm = self->user;
	acs = parm->acs;
	obj = parm->obj;
	if (moveit && aobj->type != 11000)
	{
		if (entry == title)
			return;
		if (self->work[entry].ob_next + 1 == title)
			return;
		newtitle = (title - 2) / 3;
		box = find_drop(self->work, title);
		newbox = (box - 2) / 3;
		unlink_ob(objtree, newtitle);
		head = objtree[newbox].obj.ob_head;
		tail = objtree[newbox].obj.ob_tail;
		objtree[newbox].obj.ob_head = objtree[newbox].obj.ob_tail = NIL;
		unlink_ob(objtree, newbox);
		objtree[newbox].obj.ob_head = head;
		objtree[newbox].obj.ob_tail = tail;
	} else
	{
		if (aobj->type == 11000)
		{
			newbox = copysub_ob(acs, obj, &protodrop, ROOT);
		} else
		{
			thebar = objtree[ROOT].obj.ob_head;
			theactive = objtree[thebar].obj.ob_head;
			thedesk = objtree[thebar].obj.ob_next;
			stitle = objtree[theactive].obj.ob_head;
			box = objtree[thedesk].obj.ob_head;
			while (stitle != idx)
			{
				stitle = objtree[stitle].obj.ob_next;
				box = objtree[box].obj.ob_next;
			}
			newbox = copysub_ob(acs, obj, palette, box);
		}
		newtitle = copysub_ob(acs, obj, palette, idx);
	}
	
	Adr_del(select, title);
	objtree = obj->object;
	objtree[newtitle].obj.ob_height = 0x301; /* 1 character + 3 pixels */
	thebar = objtree[ROOT].obj.ob_head;
	theactive = objtree[thebar].obj.ob_head;
	thedesk = objtree[thebar].obj.ob_next;
	newentry = (entry - 2) / 3;
	lasttitle = objtree[theactive].obj.ob_tail;
	if (newentry == lasttitle)
	{
		box = objtree[thedesk].obj.ob_tail;
		objtree[newtitle].obj.ob_next = theactive;
		objtree[theactive].obj.ob_tail = newtitle;
		objtree[lasttitle].obj.ob_next = newtitle;
		objtree[newbox].obj.ob_next = thedesk;
		objtree[box].obj.ob_next = objtree[thedesk].obj.ob_tail = newbox;
	} else
	{
		box = (find_drop(self->work, entry) - 2) / 3;
		objtree[newtitle].obj.ob_next = objtree[newentry].obj.ob_next;
		objtree[newentry].obj.ob_next = newtitle;
		objtree[newbox].obj.ob_next = objtree[box].obj.ob_next;
		objtree[box].obj.ob_next = newbox;
	}
	align(objtree);
	self->init(self);
	Awi_obredraw(self, ROOT);
}

/* -------------------------------------------------------------------------- */

static void mbar_dragged(void)
{
	OBJECT *tree;
	int16 obnr;
	
	tree = ACSblk->ev_object;
	obnr = tree[tree[tree[tree[ROOT].ob_head + 1].ob_head + 1].ob_head + 1].ob_tail;
	tdragged(ACSblk->ev_window, obnr);
}

/* -------------------------------------------------------------------------- */

static void new_title(void)
{
	Awindow *self = ACSblk->ev_window;
	int16 obnr = ACSblk->ev_obnr;
	OBJECT *tree = self->work;
	OBJEDPARM *parm = self->user;
	int16 active;
	int16 title;
	AOBJECT *aobj;
	
	active = parm->active;
	if (active > 0)
	{
		title = find_title(tree, active);
		if (title == obnr)
			return;
		Adr_unselect();
		tree[title - 1].ob_state &= ~OS_SELECTED;
		tree[title].ob_state &= ~OS_SELECTED;
		tree[active - 1].ob_flags |= OF_HIDETREE;
		tree[active].ob_flags |= OF_HIDETREE;
		tree[active].ob_flags &= ~(AO_ACCEPT | AO_SILENT);
		Awi_obredraw(self, title);
		Awi_obredraw(self, active);
	}
	title = find_drop(tree, obnr);
	parm->active = title;
	parm->act_obnr = NIL;
	if (title >= 0)
	{
		tree[obnr - 1].ob_state |= OS_SELECTED;
		tree[title - 1].ob_flags &= ~OF_HIDETREE;
		tree[title].ob_flags &= ~OF_HIDETREE;
		tree[title].ob_flags |= AO_ACCEPT | AO_SILENT;
		Awi_obredraw(self, obnr);
		Awi_obredraw(self, title);
		aobj = (AOBJECT *)&tree[title] + 1;
		if (aobj->drag)
			parm->act_obnr = (title - 2) / 3;
	}
}

/* -------------------------------------------------------------------------- */

static void obspec_only(void)
{
	OBJEDPARM *parm = ACSblk->ev_window->user;
	
	parm->act_obnr = (ACSblk->ev_obnr - 2) / 3;
	parm->active = NIL;
	edob_specs();
}

/* -------------------------------------------------------------------------- */

boolean me_service(Awindow *self, int16 task, void *in_out)
{
	OBJEDPARM *parm;
	OBJ_ENTRY *objtree;
	int16 about;
	
	if (task == AS_DELETE)
	{
		ti_delete(self);
		return TRUE;
	}
	if (task == AS_TERM)
	{
		parm = self->user;
		objtree = parm->obj->object;
		about = objtree[objtree[objtree[ROOT].obj.ob_tail].obj.ob_head].obj.ob_head;
		objtree[about].aobj.key = 0;
		objtree[objtree[about].obj.ob_next].aobj.key = 0;
	}
	return ed_service(self, task, in_out);
}

/* -------------------------------------------------------------------------- */

static void ti_delete(Awindow *self)
{
	boolean flatten;
	int16 obnr;
	int16 title;
	OBJEDPARM *parm;
	AOBJECT *aobj;
	
	if (self != ACSblk->Aselect.window)
		return;
	flatten = (ACSblk->ev_mmokstate & K_CTRL) != 0;
	parm = self->user;
	ACSblk->Aselect.next = 0; /* Adr_start() */
	while ((obnr = Adr_next()) >= 0)
	{
		aobj = (AOBJECT *)&self->work[obnr] + 1;
		if (aobj->type == 11000)
		{
			Adr_del(self, obnr);
			del_obentry(self, obnr, flatten);
		}
		if (aobj->type == 11001)
		{
			Adr_del(self, obnr);
			title = find_drop(self->work, obnr);
			parm->active = NIL;
			del_obentry(self, obnr, FALSE);
			del_obentry(self, title, FALSE);
			pack_ob(parm->obj);
			align(parm->obj->object);
			self->init(self);
			title = self->work[self->work[ROOT].ob_head + 1].ob_head + 1;
			Awi_obredraw(self, title);
			return;
		}
	}
	pack_ob(parm->obj);
	self->init(self);
	parm->act_obnr = NIL;
}

/* -------------------------------------------------------------------------- */

static void title_rubber(OBJ_ENTRY *entry, OBJECT *obj, int16 x, int16 y, int16 *destx)
{
	int16 minh;
	int16 minw;
	int16 mobutton;
	int16 kstate;
	int16 newx2;
	int16 newx;
	int16 clip[4];
	int16 y2;
	int16 x2;
	int16 x3;
	
	Amo_new(&ACSblk->description->mouse[MOUSE_POINT_HAND]);
	min_size(entry, obj, &minw, &minh);
	minw += x;
	y2 = obj->ob_height + y;
	x2 = x + ACSblk->gl_wbox;
	x3 = ACSblk->gl_wbox * 32 + minw;
	clip[0] = clip[1] = 0;
	clip[2] = ACSblk->desk.x + ACSblk->desk.w; /* FIXME: off by 1 */
	clip[3] = ACSblk->desk.y + ACSblk->desk.h;
	vs_clip(ACSblk->vdi_handle, TRUE, clip);
	vswr_mode(ACSblk->vdi_handle, MD_XOR);
	vsl_width(ACSblk->vdi_handle, 1);
	vsl_color(ACSblk->vdi_handle, G_BLACK);
	vsl_ends(ACSblk->vdi_handle, 0, 0);
	vsl_type(ACSblk->vdi_handle, LT_USERDEF); /* FIXME: better use DOTTED */
	graf_mkstate(&newx, &minh, &mobutton, &kstate);
	for (;;)
	{
		*destx = newx;
		if (!(kstate & K_CTRL))
		{
			if (*destx < minw)
				*destx = minw;
			if (*destx > x3)
				*destx = x3;
		}
		if (*destx < x2)
			*destx = x2;
		if (!(mobutton & 1))
		{
			vs_clip(ACSblk->vdi_handle, FALSE, clip);
			*destx -= x - 1;
			Amo_new(&ACSblk->description->mouse[MOUSE_ARROW]);
			break;
		}
		
		graf_mouse(M_OFF, NULL);
		dotted_xline(x, *destx, y);
		dotted_xline(x, *destx, y2);
		dotted_yline(y, y2, x);
		dotted_yline(y, y2, *destx);
		graf_mouse(M_ON, NULL);
		do
		{
			graf_mkstate(&newx2, &minh, &mobutton, &kstate);
		} while ((mobutton & 1) && newx2 == newx);
		graf_mouse(M_OFF, NULL);
		dotted_xline(x, *destx, y);
		dotted_xline(x, *destx, y2);
		dotted_yline(y, y2, x);
		dotted_yline(y, y2, *destx);
		graf_mouse(M_ON, NULL);
		newx = newx2;
	}
}

/* -------------------------------------------------------------------------- */

static void title_dragged(void)
{
	tdragged(ACSblk->ev_window, ACSblk->ev_obnr);
}

/* -------------------------------------------------------------------------- */

static void tdragged(Awindow *self, int16 obnr)
{
	boolean moveit;
	int16 title;
	
	moveit = self == ACSblk->Aselect.window && (ACSblk->ev_mmokstate & (K_RSHIFT|K_LSHIFT)) == 0;
	ACSblk->Aselect.next = 0; /* Adr_start() */
	while ((title = Adr_next()) >= 0)
	{
		make_title(self, title, obnr, moveit);
	}
}

/* -------------------------------------------------------------------------- */

static void title_edit(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	int16 title = ACSblk->ev_obnr;
	
	if (tree[title].ob_state & AOS_DCLICK)
	{
		obspec_only();
	} else if (tree[title].ob_state & OS_SELECTED)
	{
		title_dragsize(self, title);
	} else
	{
		tree[title].ob_state |= OS_SELECTED;
		new_title();
	}
}

/* -------------------------------------------------------------------------- */

static void title_dragsize(Awindow *self, int16 obnr)
{
	OBJEDPARM *parm;
	OBJ_ENTRY *entry;
	Obj_Head *eobj;
	int16 obx;
	int16 oby;
	int16 x;
	int16 y;
	int16 w;
	int16 h;
	int16 mox;
	int16 moy;
	int16 dummy;
	OBJECT *obj;
	
	graf_mkstate(&mox, &moy, &dummy, &dummy);
	obj = &self->work[obnr] - 1;
	objc_offset(self->work, obnr, &obx, &oby);
	w = obj->ob_width;
	h = obj->ob_height;
	x = self->wi_work.x + obx + w - mox;
	y = self->wi_work.y + oby + h - moy;
	if ((x > 8 && x > (w >> 3)) || (y > 8 && y > (h >> 3)))
	{
		Adr_unselect();
		obj[1].ob_state &= ~OS_SELECTED;
		Adr_add(self, obnr);
		Adr_drag(mox, moy);
		Adr_unselect();
	} else
	{
		parm = self->user;
		eobj = parm->obj;
		entry = eobj->object;
		obnr = (obnr - 2) / 3;
		title_rubber(&entry[obnr], obj, obx + self->wi_work.x, oby + self->wi_work.y, &x);
		x = (ACSblk->gl_wbox / 2 + x) / ACSblk->gl_wbox;
		entry[obnr].obj.ob_width = x;
		align(entry);
		self->init(self);
		obnr = self->work[self->work[ROOT].ob_head + 1].ob_head + 1;
		Awi_obredraw(self, obnr);
	}
}
