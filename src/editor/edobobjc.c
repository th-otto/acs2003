#include "acs_i.h"
#include "acs_uo.h"

#include "edobclas.h"

static void ed_wabort(Awindow *self);

#define SORT_YX  0
#define SORT_XY  1

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void ed_abort(void)
{
	ed_wabort(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void ed_wabort(Awindow *self)
{
	OBJEDPARM *parm;
	OBJECT *tree;
	int16 *select;
	int16 count;
	
	if (ACSblk->Aselect.window == self)
		Adr_unselect();
	Awi_diaend();
	parm = self->user;
	self->kind &= ~AW_ICON;
	self->ob_edit = self->ob_col = -1;
	parm->cleanup(self->work);
	self->work = NULL;
	if (parm->oldtitle != NULL)
	{
		Ast_delete(self->name);
		self->name = parm->oldtitle;
		if (self->wi_id > 0)
			wind_set(self->wi_id, WF_NAME, self->name, 0, 0);
	}
	if (!Ast_isEmpty(self->help_title))
		Ast_delete(self->help_title);
	self->help_title = parm->oldhlptitle;
	if (!Ast_isEmpty(self->help_file))
		Ast_delete(self->help_file);
	self->help_file = parm->oldhlpfile;
	
	if (!(self->state & AWS_TERM))
	{
		self->wi_act.x = parm->x;
		self->wi_act.y = parm->y;
		self->wi_act.w = parm->w;
		self->wi_act.h = parm->h;
		self->menu = tree = Aob_create(WI_OBJECT.menu);
		if (tree != NULL)
		{
			Aob_fix(tree);
			Ame_namefix(tree);
		}
		self->init(self);
		self->work->ob_x = parm->px;
		self->work->ob_y = parm->py;
		if (!(self->wi_kind & VSLIDE) || !(self->wi_kind & HSLIDE))
		{
			self->wi_kind |= SIZER | UPARROW | DNARROW | VSLIDE | LFARROW | RTARROW | HSLIDE;
			self->state |= AWS_TERM;
			Awi_closed(self);
			Awi_open(self);
			self->state &= ~AWS_TERM;
		} else
		{
			view_shrink(self);
		}
		select = parm->select;
		if (ACSblk->Aselect.actlen == 0 && select != NULL)
		{
			count = *select++;
			while (count > 0)
			{
				Adr_add(self, *select++ * 3 + 2);
				count--;
			}
		}
	}
	
	Ax_ifree(parm->select);
	parm->select = NULL;
}

/* -------------------------------------------------------------------------- */

void edob_refs(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	OBJ_ENTRY *objtree;
	SUBMODE *mode;
	
	if (parm->act_obnr >= 0 && parm->active >= 0)
	{
		objtree = parm->obj->object;
		objtree += parm->act_obnr;
		mode = set_aeo(objtree);
		if (mode != NULL)
			change_work(self, mode->tree, mode->title, mode->ok, mode->cleanup, NULL, mode->help_title, mode->help_file);
	}
}

/* -------------------------------------------------------------------------- */

void change_work(Awindow *win, OBJECT *tree, const char *title, void (*abort)(void), void (*cleanup)(OBJECT *tree), OBJECT *menu, const char *help_title, const char *help_file)
{
	OBJEDPARM *parm;
	int16 actlen;
	int16 *select;
	OBJECT *work;
	Axywh rect;
	char *name;
	char buf[BE_MAXLEN + 1];
	int16 kind;
	
	win->kind |= AW_ICON;
	Awi_diaend();
	parm = win->user;
	actlen = ACSblk->Aselect.actlen;
	if (actlen > 0 && ACSblk->Aselect.window == win)
	{
		parm->select = select = Ax_malloc((actlen + 1) * sizeof(*select));
		if (select != NULL)
		{
			*select++ = actlen;
			ACSblk->Aselect.next = 0; /* Adr_start */
			while (actlen-- > 0)
			{
				*select++ = (Adr_next() - 2) / 3;
			}
		}
		Adr_unselect();
	} else
	{
		parm->select = NULL;
	}
	
	work = win->work;
	parm->px = work->ob_x;
	parm->py = work->ob_y;
	if (win->state & AWS_ICONIZED)
	{
		parm->x = win->wi_normal.x;
		parm->y = win->wi_normal.y;
		parm->w = win->wi_normal.w;
		parm->h = win->wi_normal.h;
	} else
	{
		parm->x = win->wi_act.x;
		parm->y = win->wi_act.y;
		parm->w = win->wi_act.w;
		parm->h = win->wi_act.h;
	}
	Aob_delete(win->menu);
	win->menu = menu;
	if (menu != NULL)
		Ame_namefix(menu);
	Ax_free(work);
	win->work = work = tree;
	parm->flags = 2;
	Aob_fix(work);
	win->ob_edit = Aob_findflag(work, NIL, OF_EDITABLE);
	win->ob_col = NIL;
	parm->ok = abort;
	parm->cleanup = cleanup;
	if (title != NULL)
	{
		strncpy(buf, title, sizeof(buf));
		strncat(buf, win->name, sizeof(buf));
		name = Ast_create(buf);
		if (name != NULL)
		{
			parm->oldtitle = win->name;
			win->name = name;
			if (win->wi_id > 0)
				wind_set(win->wi_id, WF_NAME, win->name, 0, 0);
		}
	}
	
	parm->oldhlptitle = win->help_title;
	parm->oldhlpfile = win->help_file;
	win->help_title = Ast_create(help_title);
	win->help_file = Ast_create(help_file);
	
	win->wi_act.w = ACSblk->gl_wattr * 2 + work->ob_width;
	win->wi_act.h = ACSblk->gl_hattr * 4 + work->ob_height;
	wind_calc(WC_BORDER, win->wi_kind & ~(SIZER | UPARROW | DNARROW | VSLIDE | LFARROW | RTARROW | HSLIDE),
		win->work->ob_x, win->work->ob_y, win->work->ob_width, win->work->ob_height,
		&rect.x, &rect.y, &rect.w, &rect.h);
	kind = win->wi_kind;
	if (rect.w < ACSblk->desk.w)
		kind &= ~(LFARROW | RTARROW | HSLIDE);
	if (rect.h < ACSblk->desk.h)
		kind &= ~(UPARROW | DNARROW | VSLIDE);
	if (!(kind & (VSLIDE | HSLIDE)))
		kind &= ~SIZER;
	if (win->wi_kind != kind)
	{
		win->wi_kind = kind;
		win->state |= AWS_TERM;
		Awi_closed(win);
		Awi_open(win);
		win->state &= ~AWS_TERM;
	} else
	{
		view_grow(win);
	}
}

/* -------------------------------------------------------------------------- */

void edob_aflags(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	SUBMODE *mode;
	
	if (ACSblk->Aselect.window == self && ACSblk->Aselect.actlen >= 0 && parm->active >= 0)
	{
		mode = set_aflags(NULL);
		if (mode != NULL)
			change_work(self, mode->tree, mode->title, mode->ok, mode->cleanup, NULL, mode->help_title, mode->help_file);
	}
}

/* -------------------------------------------------------------------------- */

void edob_hide(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 idx;
	OBJECT *tree;
	OBJ_ENTRY *objtree;
	
	parm->acs->flags |= ACS_CHANGED;
	obnr = parm->act_obnr;
	if (obnr > 0)
	{
		parm->act_obnr = NIL;
		Adr_unselect();
		tree = self->work;
		idx = obnr * 3 + 2;
		undraw(self, idx);
		tree[idx].ob_flags |= OF_HIDETREE;
		tree[idx - 1].ob_flags |= OF_HIDETREE;
		objtree = parm->obj->object;
		objtree[obnr].obj.ob_flags |= OF_HIDETREE;
	}
}

/* -------------------------------------------------------------------------- */

void set_userdata(AUSER_DEF *userdef, int16 width, int16 height)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	OBJ_ENTRY *objtree = parm->obj->object;
	
	objtree += parm->act_obnr;
	if (pixel_x(objtree->obj.ob_width) < width)
		objtree->obj.ob_width = char_x(width);
	if (pixel_y(objtree->obj.ob_height) < height)
		objtree->obj.ob_height = char_y(height);
	change_udf(parm->acs, (Obj_Head *)objtree->obj.ob_spec.auserblk, userdef);
}

/* -------------------------------------------------------------------------- */

void edob_specs(void)
{
	OBJEDPARM *parm;
	OBJ_ENTRY *entry;
	OBJECT temp;
	AUSER_DEF userdef;
	SUBMODE *mode;
	Obj_Head *obj;
	AUSERBLK *user;
	UODATAS *datas;
	int16 dummy;
	int16 kstate;
	Awindow *self;
	OBJECT *tree;
	
	self = ACSblk->ev_window;
	parm = self->user;
	if (parm->act_obnr >= 0)
	{
		entry = parm->obj->object;
		entry += parm->act_obnr;
		switch ((char)entry->obj.ob_type)
		{
		case G_BOX:
		case G_BOXCHAR:
		case G_IBOX:
			mode = edbo_set_box(entry);
			break;
		case G_TEXT:
		case G_FTEXT:
		case G_BOXTEXT:
		case G_FBOXTEXT:
			mode = edte_set_ted(entry);
			break;
		case G_IMAGE:
			mode = edoim_set_image(entry);
			break;
		case G_USERDEF:
			obj = (Obj_Head *)entry->obj.ob_spec.auserblk;
			user = obj->object;
			graf_mkstate(&dummy, &dummy, &dummy, &kstate);
			if (!(kstate & K_CTRL))
			{
				datas = part_get(((Obj_Head *)user->ub_code)->label);
				if (datas != NULL)
				{
					memcpy(&temp, &entry->obj, sizeof(temp));
					temp.ob_spec.auserblk = NULL;
					set_userdef(obj, &userdef);
					tree = datas->edit_ob(&userdef, &temp);
					if (tree != NULL)
					{
						change_work(self, tree, datas->title, datas->ok, datas->cleanup, NULL, datas->help_title, datas->help_file);
						return;
					}
				}
			}
			mode = edus_set_user(entry);
			break;
		case G_STRING:
		case G_TITLE:
		case G_BUTTON:
			mode = edst_set_str(entry);
			break;
		case G_ICON:
		case G_CICON:
			mode = edoic_set_icon(entry);
			break;
#if WITH_FIXES || defined(__GNUC__)
		default:
			mode = NULL;
			break;
#endif
		}
		
		if (mode != NULL)
		{
			change_work(self, mode->tree, mode->title, mode->ok, mode->cleanup, NULL, mode->help_title, mode->help_file);
		}
	}
}

/* -------------------------------------------------------------------------- */

void open_it(void)
{
	Awindow *self = ACSblk->ev_window;
	int16 obnr;
	int16 idx;
	OBJEDPARM *parm;
	OBJ_ENTRY *objtree;
	BITBLK *bit;
	OBJECT *tree;
	
	obnr = ACSblk->ev_obnr;
	Adr_unselect();
	Adr_add(self, obnr);
	parm = self->user;
	idx = (obnr - 2) / 3;
	parm->act_obnr = idx;
	objtree = parm->obj->object;
	tree = &OBJ_POPUP;
	if (objtree[idx].obj.ob_head >= 0)
	{
		tree[OBJ_POPUP_UNHIDE].ob_state &= ~OS_DISABLED;
	} else
	{
		tree[OBJ_POPUP_UNHIDE].ob_state |= OS_DISABLED;
	}
	if (objtree[idx].obj.ob_state & AOS_LOCKED)
	{
		tree[OBJ_POPUP_LOCK].ob_state |= OS_DISABLED;
		tree[OBJ_POPUP_UNLOCK].ob_state &= ~OS_DISABLED;
	} else
	{
		tree[OBJ_POPUP_LOCK].ob_state &= ~OS_DISABLED;
		tree[OBJ_POPUP_UNLOCK].ob_state |= OS_DISABLED;
	}
	if (parm->active == obnr)
	{
		tree[OBJ_POPUP_HIDE].ob_state |= OS_DISABLED;
		tree[OBJ_POPUP_UP].ob_state |= OS_DISABLED;
		tree[OBJ_POPUP_DOWN].ob_state |= OS_DISABLED;
		tree[OBJ_POPUP_ALIGNMENT].ob_state |= OS_DISABLED;
	} else
	{
		tree[OBJ_POPUP_HIDE].ob_state &= ~OS_DISABLED;
		tree[OBJ_POPUP_UP].ob_state &= ~OS_DISABLED;
		tree[OBJ_POPUP_DOWN].ob_state &= ~OS_DISABLED;
		tree[OBJ_POPUP_ALIGNMENT].ob_state &= ~OS_DISABLED;
	}
	if (objtree[idx].obj.ob_head != objtree[idx].obj.ob_tail)
	{
		tree[OBJ_POPUP_SORT].ob_state &= ~OS_DISABLED;
	} else
	{
		tree[OBJ_POPUP_SORT].ob_state |= OS_DISABLED;
	}
	Aob_fix(tree);
	bit = tree[OBJ_POPUP_SORT_XY].ob_spec.bitblk;
	tree[OBJ_POPUP_SORT_XY].ob_x =
	tree[OBJ_POPUP_SORT_YX].ob_width =
	tree[OBJ_POPUP_SORT_XY].ob_width = bit->bi_wb << 3;
	tree[OBJ_POPUP_SORT_BOX].ob_width = bit->bi_wb << 4;
	tree[OBJ_POPUP_SORT_BOX].ob_height =
	tree[OBJ_POPUP_SORT_YX].ob_height =
	tree[OBJ_POPUP_SORT_XY].ob_height = bit->bi_hl;
	Aev_release();
	Ame_popup(self, tree, -1, -1);
}

/* -------------------------------------------------------------------------- */

static int16 find_papa(OBJ_ENTRY *tree, int16 idx)
{
	int16 next;
	
	for (;;)
	{
		next = tree[idx].obj.ob_next;
		if (next < 0)
			return NIL;
		if (tree[next].obj.ob_tail == idx)
			return next;
		idx = next;
	}
}

/* -------------------------------------------------------------------------- */

/* FIXME: no check whether moving the object covers other objects */
void edob_left(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 idx;
	int16 parent;
	OBJ_ENTRY *objtree;
	OBJECT *tree;
	
	parm->acs->flags |= ACS_CHANGED;
	obnr = parm->act_obnr;
	objtree = parm->obj->object;
	objtree[obnr].obj.ob_x = 0;
	tree = self->work;
	idx = (obnr * 3) + 2;
	parent = Aob_up(tree, idx);
	tree[idx - 1].ob_x = tree[idx].ob_x = 0;
	Adr_unselect();
	Awi_obredraw(self, parent);
}

/* -------------------------------------------------------------------------- */

/* FIXME: no check whether moving the object covers other objects */
void edob_right(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 idx;
	int16 parent;
	int16 x;
	OBJ_ENTRY *objtree;
	OBJECT *tree;
	
	parm->acs->flags |= ACS_CHANGED;
	obnr = parm->act_obnr;
	tree = self->work;
	idx = (obnr * 3) + 2;
	parent = Aob_up(tree, idx);
	x = char_x(tree[parent].ob_width - tree[idx].ob_width);
	tree[idx - 1].ob_x = tree[idx].ob_x = pixel_x(x);
	Adr_unselect();
	Awi_obredraw(self, parent);
	objtree = parm->obj->object;
	objtree[obnr].obj.ob_x = x;
}

/* -------------------------------------------------------------------------- */

/* FIXME: no check whether moving the object covers other objects */
void edob_center(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 idx;
	int16 parent;
	int16 x;
	OBJ_ENTRY *objtree;
	OBJECT *tree;
	
	parm->acs->flags |= ACS_CHANGED;
	obnr = parm->act_obnr;
	idx = (obnr * 3) + 2;
	tree = self->work;
	parent = Aob_up(tree, idx);
	x = char_x((tree[parent].ob_width - tree[idx].ob_width) >> 1);
	tree[idx - 1].ob_x = tree[idx].ob_x = pixel_x(x);
	Adr_unselect();
	Awi_obredraw(self, parent);
	objtree = parm->obj->object;
	objtree[obnr].obj.ob_x = x;
}

/* -------------------------------------------------------------------------- */

void edob_horfill(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 idx;
	int16 parent;
	int16 w;
	OBJ_ENTRY *objtree;
	OBJECT *tree;
	
	parm->acs->flags |= ACS_CHANGED;
	obnr = parm->act_obnr;
	idx = (obnr * 3) + 2;
	tree = self->work;
	objtree = parm->obj->object;
	parent = Aob_up(tree, idx);
	w = tree[parent].ob_width - tree[idx].ob_width;
	resize_ob(objtree, obnr, w, 0, tree);
	tree[idx - 1].ob_x = tree[idx].ob_x = 0;
	tree[idx - 1].ob_width = tree[idx].ob_width = tree[parent].ob_width;
	Adr_unselect();
	Awi_obredraw(self, idx);
	parent = (parent - 2) / 3;
	objtree[obnr].obj.ob_x = 0;
	objtree[obnr].obj.ob_width = objtree[parent].obj.ob_width;
}

/* -------------------------------------------------------------------------- */

/* FIXME: no check whether moving the object covers other objects */
void edob_top(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 idx;
	int16 parent;
	OBJ_ENTRY *objtree;
	OBJECT *tree;
	
	parm->acs->flags |= ACS_CHANGED;
	obnr = parm->act_obnr;
	idx = (obnr * 3) + 2;
	tree = self->work;
	parent = Aob_up(tree, idx);
	tree[idx - 1].ob_y = tree[idx].ob_y = 0;
	objtree = parm->obj->object;
	objtree[obnr].obj.ob_y = 0;
	Adr_unselect();
	Awi_obredraw(self, parent);
}

/* -------------------------------------------------------------------------- */

/* FIXME: no check whether moving the object covers other objects */
void edob_bottom(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 idx;
	int16 parent;
	int16 y;
	OBJ_ENTRY *objtree;
	OBJECT *tree;
	
	parm->acs->flags |= ACS_CHANGED;
	obnr = parm->act_obnr;
	idx = (obnr * 3) + 2;
	tree = self->work;
	parent = Aob_up(tree, idx);
	y = char_y(tree[parent].ob_height - tree[idx].ob_height);
	tree[idx - 1].ob_y = tree[idx].ob_y = pixel_y(y);
	Adr_unselect();
	Awi_obredraw(self, parent);
	objtree = parm->obj->object;
	objtree[obnr].obj.ob_y = y;
}

/* -------------------------------------------------------------------------- */

/* FIXME: no check whether moving the object covers other objects */
void edob_mid(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 idx;
	int16 parent;
	int16 y;
	OBJ_ENTRY *objtree;
	OBJECT *tree;
	
	parm->acs->flags |= ACS_CHANGED;
	obnr = parm->act_obnr;
	idx = (obnr * 3) + 2;
	tree = self->work;
	parent = Aob_up(tree, idx);
	y = char_y((tree[parent].ob_height - tree[idx].ob_height) >> 1);
	tree[idx - 1].ob_y = tree[idx].ob_y = pixel_y(y);
	Adr_unselect();
	Awi_obredraw(self, parent);
	objtree = parm->obj->object;
	objtree[obnr].obj.ob_y = y;
}

/* -------------------------------------------------------------------------- */

void edob_verfill(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 idx;
	int16 parent;
	int16 h;
	OBJ_ENTRY *objtree;
	OBJECT *tree;
	
	parm->acs->flags |= ACS_CHANGED;
	obnr = parm->act_obnr;
	idx = (obnr * 3) + 2;
	tree = self->work;
	objtree = parm->obj->object;
	parent = Aob_up(tree, idx);
	h = tree[parent].ob_height - tree[idx].ob_height;
	resize_ob(objtree, obnr, 0, h, tree);
	tree[idx - 1].ob_y = tree[idx].ob_y = 0;
	tree[idx - 1].ob_height = tree[idx].ob_height = tree[parent].ob_height;
	Adr_unselect();
	Awi_obredraw(self, idx);
	parent = (parent - 2) / 3;
	objtree[obnr].obj.ob_y = 0;
	objtree[obnr].obj.ob_height = objtree[parent].obj.ob_height;
}

/* -------------------------------------------------------------------------- */

void edob_up(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 tail;
	int16 head;
	int16 prev;
	int16 parent;
	int16 idx;
	OBJ_ENTRY *objtree;
	
	obnr = parm->act_obnr;
	objtree = parm->obj->object;
	parent = find_papa(objtree, obnr);
	/* BUG: will crash when done on ROOT object */
#if WITH_FIXES
	if (parent < 0)
		return;
#endif
	tail = objtree[parent].obj.ob_tail;
	if (tail != obnr)
	{
		parm->acs->flags |= ACS_CHANGED;
		head = objtree[parent].obj.ob_head;
		if (head == obnr)
		{
			objtree[parent].obj.ob_head = objtree[obnr].obj.ob_next;
		} else
		{
			do
			{
				prev = head;
				head = objtree[head].obj.ob_next;
			} while (head != obnr);
			objtree[prev].obj.ob_next = objtree[obnr].obj.ob_next;
		}
		objtree[tail].obj.ob_next = obnr;
		objtree[obnr].obj.ob_next = parent;
		objtree[parent].obj.ob_tail = obnr;
		self->init(self);
		idx = (parent * 3) + 2;
		Awi_obredraw(self, idx);
	}
}

/* -------------------------------------------------------------------------- */

void edob_down(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 child;
	int16 head;
	int16 prev;
	int16 parent;
	int16 idx;
	OBJ_ENTRY *objtree;
	
#if !WITH_FIXES
	parm->acs->flags |= ACS_CHANGED;
#endif
	obnr = parm->act_obnr;
	objtree = parm->obj->object;
	parent = find_papa(objtree, obnr);
	/* BUG: will crash when done on ROOT object */
#if WITH_FIXES
	if (parent < 0)
		return;
#endif
	head = objtree[parent].obj.ob_head;
	if (head != obnr)
	{
#if WITH_FIXES
		parm->acs->flags |= ACS_CHANGED;
#endif
		child = head;
		do
		{
			prev = child;
			child = objtree[prev].obj.ob_next;
		} while (child != obnr);
		if (objtree[parent].obj.ob_tail == obnr)
		{
			objtree[parent].obj.ob_tail = prev;
			objtree[prev].obj.ob_next = parent;
		} else
		{
			objtree[prev].obj.ob_next = objtree[obnr].obj.ob_next;
		}
		objtree[obnr].obj.ob_next = head;
		objtree[parent].obj.ob_head = obnr;
		self->init(self);
		idx = (parent * 3) + 2;
		Awi_obredraw(self, idx);
	}
}

/* -------------------------------------------------------------------------- */

static void sort(Awindow *self, int mode)
{
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 head;
	OBJ_ENTRY *objtree;
	boolean swapped;
	int16 tail;
	int16 curr;
	int16 prev;
	int16 next;
	int16 idx;
	
	obnr = parm->act_obnr;
	objtree = parm->obj->object;
	head = objtree[obnr].obj.ob_head;
	tail = objtree[obnr].obj.ob_tail;
	objtree[tail].obj.ob_next = NIL;
	do
	{
		swapped = FALSE;
		curr = head;
		prev = NIL;
		for (;;)
		{
			next = objtree[curr].obj.ob_next;
			if (next < 0)
				break;
			if ((mode != SORT_YX && pixel_y(objtree[curr].obj.ob_y) >= pixel_y(objtree[next].obj.ob_y)) ||
				(mode == SORT_YX && pixel_x(objtree[curr].obj.ob_x) >= pixel_x(objtree[next].obj.ob_x)))
			{
				if (pixel_y(objtree[curr].obj.ob_y) > pixel_y(objtree[next].obj.ob_y) ||
					pixel_x(objtree[curr].obj.ob_x) > pixel_x(objtree[next].obj.ob_x))
				{
					swapped = TRUE;
					parm->acs->flags |= ACS_CHANGED;
					if (prev < 0)
						head = next;
					else
						objtree[prev].obj.ob_next = next;
					objtree[curr].obj.ob_next = objtree[next].obj.ob_next;
					objtree[next].obj.ob_next = curr;
					prev = next;
					next = curr;
					curr = prev;
				}
			}
			prev = curr;
			curr = next;
		}
	} while (swapped);

	objtree[obnr].obj.ob_head = head;
	objtree[obnr].obj.ob_tail = curr;
	objtree[curr].obj.ob_next = obnr;
	self->init(self);
	idx = obnr * 3 + 2;
	Awi_obredraw(self, idx);
}

/* -------------------------------------------------------------------------- */

void edob_sortxy(void)
{
	sort(ACSblk->ev_window, SORT_XY);
}

/* -------------------------------------------------------------------------- */

void edob_sortyx(void)
{
	sort(ACSblk->ev_window, SORT_YX);
}

/* -------------------------------------------------------------------------- */

void edob_lock(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 idx;
	OBJECT *tree;
	OBJ_ENTRY *objtree;
	
	parm->acs->flags |= ACS_CHANGED;
	obnr = parm->act_obnr;
	idx = obnr * 3 + 2;
	Adr_unselect();
	tree = self->work;
	tree[idx].ob_state |= AOS_LOCKED;
	objtree = parm->obj->object;
	objtree[obnr].obj.ob_state |= AOS_LOCKED;
}

/* -------------------------------------------------------------------------- */

void edob_unlock(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 idx;
	OBJECT *tree;
	OBJ_ENTRY *objtree;
	
	parm->acs->flags |= ACS_CHANGED;
	obnr = parm->act_obnr;
	idx = obnr * 3 + 2;
	Adr_unselect();
	tree = self->work;
	tree[idx].ob_state &= ~AOS_LOCKED;
	objtree = parm->obj->object;
	objtree[obnr].obj.ob_state &= ~AOS_LOCKED;
}

/* -------------------------------------------------------------------------- */

void edob_unhide(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	OBJEDPARM *parm = self->user;
	int16 obnr;
	int16 child;
	boolean changed;
	OBJ_ENTRY *objtree;
	int16 idx;
	
	obnr = parm->act_obnr;
	objtree = parm->obj->object;
	child = objtree[obnr].obj.ob_head;
	if (child >= 0)
	{
		changed = FALSE;
		while (child != obnr)
		{
			if (objtree[child].obj.ob_flags & OF_HIDETREE)
			{
				changed = TRUE;
				idx = child * 3 + 1;
				tree[idx].ob_flags &= ~OF_HIDETREE;
				tree[idx + 1].ob_flags &= ~OF_HIDETREE;
				objtree[child].obj.ob_flags &= ~OF_HIDETREE;
			}
			child = objtree[child].obj.ob_next;
		}
		if (changed)
		{
			parm->acs->flags |= ACS_CHANGED;
			obnr = obnr * 3 + 1;
			Awi_obredraw(self, obnr);
		}
	}
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
static void edob_unused(void)
{
	strcpy(0, "0x%lxL");
}
#endif

/* -------------------------------------------------------------------------- */

void edob_pos(void)
{
	int val_char, val_pixel;
	int16 px, py;
	Awindow *self;
	OBJEDPARM *parm;
	int16 obnr;
	int16 idx;
	Awindow *win;
	OBJECT *tree;
	OBJ_ENTRY *objtree;
	int16 w, h;
	int16 parent;
	
	self = ACSblk->ev_window;
	parm = self->user;
	obnr = parm->act_obnr;
	if (obnr < 0)
		return;
	if (parm->active < 0)
		return;
	win = WI_POSITION.create(&WI_POSITION);
	if (win == NULL)
		return;
	tree = self->work;
	objtree = parm->obj->object;

	Aob_printf(win->work, FINE_POS_X_CHAR, "%d", objtree[obnr].obj.ob_x & 0xff);
	Aob_printf(win->work, FINE_POS_Y_CHAR, "%d", objtree[obnr].obj.ob_y & 0xff);
	Aob_printf(win->work, FINE_POS_W_CHAR, "%d", objtree[obnr].obj.ob_width & 0xff);
	Aob_printf(win->work, FINE_POS_H_CHAR, "%d", objtree[obnr].obj.ob_height & 0xff);
	Aob_printf(win->work, FINE_POS_X_PIXEL, "%d", objtree[obnr].obj.ob_x >> 8);
	Aob_printf(win->work, FINE_POS_Y_PIXEL, "%d", objtree[obnr].obj.ob_y >> 8);
	Aob_printf(win->work, FINE_POS_W_PIXEL, "%d", objtree[obnr].obj.ob_width >> 8);
	Aob_printf(win->work, FINE_POS_H_PIXEL, "%d", objtree[obnr].obj.ob_height >> 8);
	
	idx = obnr * 3 + 2;
	w = tree[idx].ob_width;
	h = tree[idx].ob_height;
	
	if (Awi_dialog(win) == FINE_POS_OK)
	{
		parm->acs->flags |= ACS_CHANGED;
		
		if (obnr != ROOT)
		{
			Aob_scanf(win->work, FINE_POS_X_CHAR, "%d", &val_char);
			Aob_scanf(win->work, FINE_POS_X_PIXEL, "%d", &val_pixel);
			if (val_char > 255)
				val_char = 255;
			else if (val_char < 0)
				val_char = 0;
			if (val_pixel > 127)
				val_pixel = 127;
			else if (val_pixel < -128)
				val_pixel = -128;
			tree[idx - 1].ob_x =
			tree[idx].ob_x =
			objtree[obnr].obj.ob_x = (val_char & 0xff) | (val_pixel << 8);

			Aob_scanf(win->work, FINE_POS_Y_CHAR, "%d", &val_char);
			Aob_scanf(win->work, FINE_POS_Y_PIXEL, "%d", &val_pixel);
			if (val_char > 255)
				val_char = 255;
			else if (val_char < 0)
				val_char = 0;
			if (val_pixel > 127)
				val_pixel = 127;
			else if (val_pixel < -128)
				val_pixel = -128;
			tree[idx - 1].ob_y =
			tree[idx].ob_y =
			objtree[obnr].obj.ob_y = (val_char & 0xff) | (val_pixel << 8);
		} else
		{
			px = tree[idx].ob_x;
			py = tree[idx].ob_y;
		}
		
		Aob_scanf(win->work, FINE_POS_W_CHAR, "%d", &val_char);
		Aob_scanf(win->work, FINE_POS_W_PIXEL, "%d", &val_pixel);
		if (val_char > 255)
			val_char = 255;
		else if (val_char < 0)
			val_char = 0;
		if (val_pixel > 127)
			val_pixel = 127;
		else if (val_pixel < -128)
			val_pixel = -128;
		tree[idx - 1].ob_width =
		tree[idx].ob_width =
		objtree[obnr].obj.ob_width = (val_char & 0xff) | (val_pixel << 8);
		
		Aob_scanf(win->work, FINE_POS_H_CHAR, "%d", &val_char);
		Aob_scanf(win->work, FINE_POS_H_PIXEL, "%d", &val_pixel);
		if (val_char > 255)
			val_char = 255;
		else if (val_char < 0)
			val_char = 0;
		if (val_pixel > 127)
			val_pixel = 127;
		else if (val_pixel < -128)
			val_pixel = -128;
		tree[idx - 1].ob_height =
		tree[idx].ob_height =
		objtree[obnr].obj.ob_height = (val_char & 0xff) | (val_pixel << 8);
		
		rsrc_obfix(tree, idx - 1);
		rsrc_obfix(tree, idx);
		
		if (obnr == ROOT)
		{
			tree[idx - 1].ob_x = tree[idx].ob_x = px;
			tree[idx - 1].ob_y = tree[idx].ob_y = py;
		}
		w -= tree[idx].ob_width;
		h -= tree[idx].ob_height;
		if (w != 0 || h != 0)
		{
			resize_ob(objtree, obnr, -w, -h, tree);
		}

		parent = Aob_up(tree, idx);
		Adr_unselect();
		if (obnr == ROOT)
		{
			self->init(self);
			self->state |= AWS_FORCEREDRAW;
			self->sized(self, &self->wi_act);
		} else
		{
			Awi_obredraw(self, parent);
		}
	}
	Awi_delete(win);
}

/* -------------------------------------------------------------------------- */

void edob_resetref(void)
{
	OBJEDPARM *parm;
	OBJ_ENTRY *objtree;
	ACS_HEAD *acs;
	int16 obnr;
	int16 idx;
	OBJ_ENTRY *entry;
	
	if (ACSblk->ev_window == ACSblk->Aselect.window &&
		ACSblk->Aselect.actlen >= 0)
	{
		parm = ACSblk->ev_window->user;
		acs = parm->acs;
		acs->flags |= ACS_CHANGED;
		objtree = parm->obj->object;
		ACSblk->Aselect.next = 0; /* Adr_start() */
		while ((obnr = Adr_next()) >= 0)
		{
			idx = (obnr - 2) / 3;
			entry = &objtree[idx];
			entry->aobj.key = 0;
			if (entry->label != NULL)
			{
				objfree(acs, entry->label);
				entry->label = NULL;
			}
			mod_ref(acs, &entry->type, "", REF_NONE);
			mod_ref(acs, (Obj_Head **)&entry->aobj.click, "", REF_OBJ_CLICK);
			mod_ref(acs, (Obj_Head **)&entry->aobj.drag, "", REF_OBJ_DRAG);
			mod_ref(acs, (Obj_Head **)&entry->aobj.userp1, "", REF_NONE);
			mod_ref(acs, (Obj_Head **)&entry->aobj.userp2, "", REF_NONE);
		}
	}
}

/* -------------------------------------------------------------------------- */

void oe_beself(Awindow *win, OBJECT *tree, int16 obnr)
{
	Awiob self;
	AUSERBLK *user;
	
	user = tree[obnr & A_MASK].ob_spec.auserblk;
	self.window = win;
	self.entry = &tree[obnr & A_MASK];
	self.obnr = obnr;
	user->ub_serv(self.entry, AUO_SELF, &self);
}

/* -------------------------------------------------------------------------- */

int16 oe_colsel(int16 color, int16 backbox, int16 popupidx, int16 colorbox)
{
	OBJECT *popup;
	Axywh rect;
	
	popup = Aob_create(&POP_COLSEL);
	if (popup == NULL)
		return -1;
	Aob_offset(&rect, ACSblk->ev_window->work, backbox);
	rect.x += ACSblk->ev_window->wi_work.x + 1;
	rect.y += ACSblk->ev_window->wi_work.y + 1;
	popup[color * 2 + 1].ob_state |= OS_CHECKED;
	if ((color = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y)) >= 0)
	{
		color = (color & -2) / 2;
		Aob_puttext(ACSblk->ev_object, popupidx, colour_text[color]);
		ACSblk->ev_object[colorbox].ob_spec.obspec.interiorcol = color;
		ACSblk->ev_window->obchange(ACSblk->ev_window, backbox, -1);
	}
	Aob_delete(popup);
	return color;
}
