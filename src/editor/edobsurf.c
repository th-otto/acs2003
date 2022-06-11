#include "acs_i.h"
#include "acs_uo.h"
#include "io/workout.h"

static void new_ob(Awindow *self, int16 obnr, boolean moveit, int16 *idx);
static void ob_addselect(Awindow *win, int16 obnr);
static int16 sizing(Awindow *self, int16 obnr, int16 mox, int16 moy);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 char_x(int16 x)
{
	if (x < 0)
		return x << 8;
	if (snapping)
		return ((ACSblk->gl_wbox >> 1) + x) / ACSblk->gl_wbox;
	return (x / ACSblk->gl_wbox) | ((x % ACSblk->gl_wbox) << 8);
}

/* -------------------------------------------------------------------------- */

int16 char_y(int16 x)
{
	if (x < 0)
		return x << 8;
	if (snapping)
		return ((ACSblk->gl_hbox >> 1) + x) / ACSblk->gl_hbox;
	return (x / ACSblk->gl_hbox) | ((x % ACSblk->gl_hbox) << 8);
}

/* -------------------------------------------------------------------------- */

int16 pixel_x(int16 x)
{
	int16 pixel;
	
	pixel = (x >> 8) & 0xff;
	if (pixel > 0x7f)
		pixel -= 256;
	return (x & 0xff) * ACSblk->gl_wbox + pixel;
}

/* -------------------------------------------------------------------------- */

int16 pixel_y(int16 x)
{
	int16 pixel;
	
	pixel = (x >> 8) & 0xff;
	if (pixel > 0x7f)
		pixel -= 256;
	return (x & 0xff) * ACSblk->gl_hbox + pixel;
}

/* -------------------------------------------------------------------------- */

void del_obentry(Awindow *win, int16 obnr, boolean flatten)
{
	OBJECT *tree;
	OBJEDPARM *parm;
	ACS_HEAD *acs;
	Obj_Head *obj;
	OBJ_ENTRY *objtree;
	int16 idx;
	int16 child;
	
	tree = win->work;
	parm = win->user;
	acs = parm->acs;
	obj = parm->obj;
	idx = (obnr - 2) / 3;
	objtree = obj->object;
	if (parm->active == obnr)
	{
		child = objtree[idx].obj.ob_head;
		if (child >= 0 && objtree[idx].obj.ob_tail == child)
		{
			objtree[child].obj.ob_x = objtree[idx].obj.ob_x;
			objtree[child].obj.ob_y = objtree[idx].obj.ob_y;
			del_ob(acs, &objtree[idx]);
			unlink_ob(objtree, idx);
		}
	} else
	{
		if (flatten)
		{
			del_ob(acs, &objtree[idx]);
			unlink_ob(objtree, idx);
		} else
		{
			delsub_ob(acs, obj, idx);
			tree[obnr].ob_head = tree[obnr].ob_tail = NIL;
		}
		tree[obnr - 1].ob_flags |= OF_HIDETREE;
		Awi_obredraw(win, obnr - 1);
	}
}

/* -------------------------------------------------------------------------- */

void ed_delete(Awindow *self)
{
	OBJEDPARM *parm;
	int16 kstate;
	int16 dummy;
	boolean active;
	int16 obnr;
	AOBJECT *aobj;
	
	parm = self->user;
	if (parm->flags == 1 && ACSblk->Aselect.window == self)
	{
		graf_mkstate(&dummy, &dummy, &dummy, &kstate);
		kstate &= K_CTRL;
		active = FALSE;
		Adr_start();
		while ((obnr = Adr_next()) >= 0)
		{
			aobj = (AOBJECT *)&self->work[obnr] + 1;
			if (aobj->type == 11000)
			{
				Adr_del(self, obnr);
				if (parm->active == obnr)
					active = TRUE;
				del_obentry(self, obnr, kstate != 0);
			}
		}
		pack_ob(parm->obj);
		self->init(self);
		if (active)
		{
			self->state |= AWS_FORCEREDRAW;
			self->sized(self, &self->wi_act);
		}
		parm->act_obnr = -1;
	}
}

/* -------------------------------------------------------------------------- */

void ed_dragged(void)
{
	int16 dummy;
	Awindow *select;
	Awindow *self;
	boolean moveit;
	int16 obnr;
	AOBJECT *aobj;
	OBJEDPARM *parm;
	int16 arr[5];
	int16 idx;
	
	if (ACSblk->Aselect.rx != 0 || ACSblk->Aselect.ry != 0)
	{
		select = ACSblk->Aselect.window;
		self = ACSblk->ev_window;
		
		graf_mkstate(&dummy, &dummy, &dummy, &ACSblk->ev_mmokstate);
		/* FIXME: should test &check both bits */
		if (ACSblk->ev_mmokstate & K_RSHIFT)
			ACSblk->ev_mmokstate |= K_LSHIFT;
		if (select != self)
			ACSblk->ev_mmokstate |= K_CTRL;
		dummy = ACSblk->ev_mmokstate & (K_LSHIFT | K_CTRL);
		if (select == self && dummy != K_LSHIFT && dummy != (K_LSHIFT | K_CTRL))
			moveit = TRUE;
		else
			moveit = FALSE;
		if (moveit)
		{
			parm = self->user;
			ACSblk->Aselect.next = 0; /* Adr_start() */
			while ((obnr = Adr_next()) >= 0)
			{
				aobj = (AOBJECT *)&select->work[obnr] + 1;
				if (aobj->type == 11000)
				{
					if (parm->active != obnr)
					{
						self->work[obnr - 1].ob_flags |= OF_HIDETREE;
						self->work[obnr].ob_flags |= OF_HIDETREE;
						self->work[obnr].ob_state &= ~OS_SELECTED;
						Awi_obredraw(self, obnr - 1);
					} else
					{
						Adr_del(select, obnr);
					}
				}
			}
		}
		arr[0] = 0;
		ACSblk->Aselect.next = 0; /* Adr_start() */
		while ((obnr = Adr_next()) >= 0)
		{
			aobj = (AOBJECT *)&select->work[obnr] + 1;
			if (aobj->type == 11000)
				new_ob(self, obnr, moveit, arr);
		}
		if (arr[0] > 0)
		{
			self->init(self);
			if (arr[0] >= 5)
			{
				Awi_obredraw(self, ROOT);
			} else
			{
				idx = arr[0];
				while (idx > 0)
				{
					obnr = arr[idx];
					self->obchange(self, obnr, self->work[obnr].ob_state);
					obnr++;
					self->obchange(self, obnr, self->work[obnr].ob_state);
					idx--;
				}
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static void ob_find(Awindow *self, int16 obnr, Axywh *rect)
{
	OBJECT *obj;
	int16 child;
	Axywh childrect;
	
	obj = &self->work[obnr];
	if (obj->ob_y < rect->y + rect->h &&
		obj->ob_y + obj->ob_height > rect->y &&
		obj->ob_x < rect->x + rect->w &&
		obj->ob_x + obj->ob_width > rect->x)
	{
		if (obj->ob_y >= rect->y &&
			obj->ob_x >= rect->x &&
			obj->ob_y + obj->ob_height <= rect->y + rect->h &&
			obj->ob_x + obj->ob_width <= rect->x + rect->w)
		{
			ob_addselect(self, obnr);
		} else
		{
			child = obj->ob_head;
			if (child >= 0)
			{
				childrect.x = rect->x - obj->ob_x;
				childrect.y = rect->y - obj->ob_y;
				childrect.w = rect->w;
				childrect.h = rect->h;
				while (child != obnr)
				{
					ob_find(self, ++child, &childrect);
					child = self->work[child].ob_next;
				}
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static void draw_box(Awindow *self)
{
	OBJECT *tree;
	Axywh rect;
	int16 obnr;
	
	tree = self->work;
	if ((ACSblk->ev_mmokstate & K_SHIFT) == 0)
		Adr_unselect();
	Amo_new(&ACSblk->description->mouse[BUSYBEE]);
	rect.x = ACSblk->ev_mmox;
	rect.y = ACSblk->ev_mmoy;
	Awi_update(BEG_MCTRL);
	graf_rubberbox(ACSblk->ev_mmox, ACSblk->ev_mmoy, -4000, -4000, &rect.w, &rect.h);
	if (rect.w < 0)
	{
		rect.x += rect.w;
		rect.w = -rect.w;
	}
	if (rect.h < 0)
	{
		rect.y += rect.h;
		rect.h = -rect.h;
	}
	Awi_update(END_MCTRL);
	obnr = 2;
	ACSblk->Aselect.window = self;
	rect.x -= self->wi_work.x + tree->ob_x + 2;
	rect.y -= self->wi_work.y + tree->ob_y + 2;
	rect.w += 4;
	rect.h += 4;
	ob_find(self, obnr, &rect);
	Amo_new(&ACSblk->description->mouse[ARROW]);
}

/* -------------------------------------------------------------------------- */

void ed_edit(void)
{
	Awindow *self;
	OBJECT *tree;
	int16 mox, moy;
	int16 kstate;
	int16 obnr;
	int16 parent;
	OBJEDPARM *parm;
	int16 loop;
	int16 button;
	int16 dummy;
	
	self = ACSblk->ev_window;
	tree = self->work;
	mox = ACSblk->ev_mmox;
	moy = ACSblk->ev_mmoy;
	kstate = ACSblk->ev_mmokstate;
	parm = self->user;
	obnr = ACSblk->ev_obnr;
	parent = obnr;
	do
	{
		if (tree[parent].ob_state & AOS_LOCKED)
			obnr = parent;
		if (parent == parm->active)
			break;
		parent = Aob_up(tree, parent);
	} while (parent >= 0);
	
	if (kstate & K_CTRL)
	{
		if (parm->active != obnr)
			obnr = Aob_up(tree, obnr);
	}
	if (tree[ACSblk->ev_obnr].ob_state & AOS_DCLICK)
	{
		ACSblk->ev_obnr = obnr;
		open_it();
	} else if (kstate & K_ALT)
	{
		draw_box(self);
	} else if (tree[obnr].ob_state & OS_SELECTED)
	{
		if (kstate & K_SHIFT)
		{
			Adr_del(self, obnr);
			Aev_release();
		} else
		{
			if (sizing(self, obnr, mox, moy) != OK)
				Adr_drag(mox, moy);
		}
	} else
	{
		if ((kstate & K_SHIFT) == 0)
			Adr_unselect();
		ob_addselect(self, obnr);
		loop = 2;
		do
		{
			--loop;
			evnt_timer(10, 0);
			graf_mkstate(&dummy, &dummy, &button, &dummy);
		} while ((button & 1) == 1 && loop > 0);
		if (loop <= 0)
		{
			if (sizing(self, obnr, mox, moy) != OK)
				Adr_drag(mox, moy);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void find_parent(Awindow *self, int16 start, int16 *found, int16 *px, int16 *py)
{
	OBJEDPARM *parm;
	int16 actx, acty;
	int16 obx, oby;
	Awindow *select;
	
	parm = self->user;
	select = ACSblk->Aselect.window;
	objc_offset(select->work, start, &obx, &oby);
	*px = obx + select->wi_work.x + ACSblk->Aselect.rx - self->wi_work.x;
	*py = oby + select->wi_work.y + ACSblk->Aselect.ry - self->wi_work.y;
	*found = Adr_find(self->work, parm->active, 100, *px, *py);
	if (*found < 0)
	{
		objc_offset(self->work, parm->active, &actx, &acty);
		if (*px < actx)
			*px = 0;
		else
			*px -= actx;
		if (*py < acty)
			*py = 0;
		else
			*py -= acty;
		*found = parm->active;
	} else
	{
		objc_offset(self->work, *found, &actx, &acty);
		*px -= actx;
		*py -= acty;
	}
}

/* -------------------------------------------------------------------------- */

static void new_ob(Awindow *self, int16 obnr, boolean moveit, int16 *idx)
{
	Awindow *select;
	AOBJECT *aobj;
	int16 px, py;
	int16 w, h;
	int16 fw, fh;
	int16 found;
	Obj_Head *proto;
	Obj_Head *obj;
	OBJ_ENTRY *objtree;
	OBJECT *tree;
	ACS_HEAD *acs;
	int16 protoidx;
	int16 parent;
	int16 child;
	int16 x, y;
	OBJEDPARM *parm;
	
	select = ACSblk->Aselect.window;
	aobj = (AOBJECT *)&select->work[obnr] + 1;
	proto = aobj->userp1;
	protoidx = (int16)(int32)aobj->userp2;
	parm = self->user;
	if (parm->active >= 0)
	{
		acs = parm->acs;
		acs->flags |= ACS_CHANGED;
		obj = parm->obj;
		tree = self->work;
		find_parent(self, obnr, &found, &px, &py);
		parent = found;
		do
		{
			if (tree[parent].ob_state & AOS_LOCKED)
			{
				if (moveit)
				{
					tree[obnr].ob_flags &= ~OF_HIDETREE;
					tree[obnr].ob_state |= OS_SELECTED;
					tree[obnr - 1].ob_flags &= ~OF_HIDETREE;
					Awi_obredraw(self, obnr - 1);
				}
				return;
			}
			parent = Aob_up(self->work, parent);
		} while (parent >= 0);
		found = (found - 2) / 3;
		if (!moveit && obj == proto && found == protoidx)
		{
			if (Awi_alert(1, WARN_SAME) == 1)
				return;
		}
		Adr_del(select, obnr);
		if (moveit)
		{
			parent = (obnr - 2) / 3;
			free_ob(obj->object, parent);
		} else
		{
			parent = copysub_ob(acs, obj, proto, protoidx);
		}
		objtree = obj->object;
		objtree[parent].obj.ob_next = found;
		child = objtree[found].obj.ob_tail;
		if (child >= 0)
		{
			objtree[child].obj.ob_next = parent;
		} else
		{
			objtree[found].obj.ob_head = parent;
		}
		objtree[found].obj.ob_tail = parent;
		x = px;
		y = py;
		w = pixel_x(objtree[parent].obj.ob_width);
		h = pixel_y(objtree[parent].obj.ob_height);
		fw = pixel_x(objtree[found].obj.ob_width);
		fh = pixel_y(objtree[found].obj.ob_height);
		if (x + w > fw)
		{
			x = fw - w;
			if (x < 0)
			{
				x = 0;
				if (Awi_alert(1, WARN_XSHRINK) == 1)
				{
					objtree[parent].obj.ob_width = char_x(fw);
				}
			}
		}
		if (y + h > fh)
		{
			y = fh - h;
			if (y < 0)
			{
				y = 0;
				if (Awi_alert(1, WARN_YSHRINK) == 1)
				{
					objtree[parent].obj.ob_height = char_y(fh);
				}
			}
		}
		objtree[parent].obj.ob_x = char_x(x);
		objtree[parent].obj.ob_y = char_y(y);
		++(*idx);
		if (*idx < 5)
		{
			idx[*idx] = parent * 3 + 1;
		}
	}
}

/* -------------------------------------------------------------------------- */

void min_size(OBJ_ENTRY *entry, OBJECT *obj, int16 *minw, int16 *minh)
{
	UODATAS *datas;
	AUSERBLK *auser;
	OBSPEC spec;
	
	*minw = ACSblk->gl_wbox;
	*minh = ACSblk->gl_hbox;
	spec = obj->ob_spec;
	switch ((char)obj->ob_type)
	{
	case G_TEXT:
	case G_BOXTEXT:
		{
			*minw = (int)strlen(spec.tedinfo->te_ptext) * ACSblk->gl_wbox;
		}
		break;
	case G_FTEXT:
	case G_FBOXTEXT:
		{
			*minw = (int)strlen(spec.tedinfo->te_ptmplt) * ACSblk->gl_wbox;
		}
		break;
	case G_IMAGE:
		{
			*minw = spec.bitblk->bi_wb * 8 + spec.bitblk->bi_x;
			*minh = spec.bitblk->bi_hl + spec.bitblk->bi_y;
		}
		break;
	case G_USERDEF:
		{
			auser = ((Obj_Head *)entry->obj.ob_spec.auserblk)->object;
			datas = part_get(((Obj_Head *)auser->ub_code)->label);
			if (datas != NULL)
				datas->minsize(spec.auserblk, minw, minh);
		}
		break;
	case G_STRING:
	case G_BUTTON:
	case G_TITLE:
		*minw = (int)strlen(spec.free_string) * ACSblk->gl_wbox;
		break;
	case G_ICON:
	case G_CICON:
		{
			int16 x1, x2;
			x1 = spec.iconblk->ib_xtext + spec.iconblk->ib_wtext;
			x2 = spec.iconblk->ib_xicon + spec.iconblk->ib_wicon;
			*minw = x1 > x2 ? x1 : x2;
			x1 = spec.iconblk->ib_ytext + spec.iconblk->ib_htext;
			x2 = spec.iconblk->ib_yicon + spec.iconblk->ib_hicon;
			*minh = x1 > x2 ? x1 : x2;
		}
		break;
	}
	if (*minw <= 0)
		*minw = ACSblk->gl_wbox;
	if (*minh <= 0)
		*minh = ACSblk->gl_hbox;
}

/* -------------------------------------------------------------------------- */

static void ob_addselect(Awindow *win, int16 obnr)
{
	OBJECT *tree;
	int16 parent;
	int16 child;
	int16 grandchild;
	OBJEDPARM *parm;
	
	tree = win->work;
	if (ACSblk->Aselect.actlen > 0)
	{
		parent = obnr;
		for (;;)
		{
			parent = Aob_up(tree, parent);
			if (parent <= 0)
				break;
			if (tree[parent].ob_state & OS_SELECTED)
			{
				Adr_del(win, parent);
				break;
			}
		}
		child = tree[obnr].ob_head + 1;
		if (child > 0)
		{
			while (child != obnr)
			{
				if (tree[child].ob_state & OS_SELECTED)
				{
					Adr_del(win, child);
					if (ACSblk->Aselect.actlen == 0)
						break;
				}
				grandchild = tree[child].ob_head + 1;
				if (grandchild < 1)
				{
					grandchild = tree[child].ob_next;
					while (grandchild != obnr && tree[grandchild].ob_tail == child)
					{
						child = grandchild;
						grandchild = tree[child].ob_next;
					}
				}
				child = grandchild;
			}
		}
	}
	Adr_add(win, obnr);
	parm = win->user;
	parm->act_obnr = (obnr - 2) / 3;
}

/* -------------------------------------------------------------------------- */

void edob_next(void)
{
	OBJEDPARM *parm;
	int16 obnr;
	int16 active;
	OBJ_ENTRY *objtree;
	int16 child;
	
	parm = ACSblk->ev_window->user;
	obnr = parm->act_obnr;
	if (obnr >= 0 && parm->active >= 0)
	{
		active = (parm->active - 2) / 3;
		objtree = parm->obj->object;
		if (ACSblk->Aselect.actlen == 1 && ACSblk->Aselect.window == ACSblk->ev_window)
		{
			do
			{
				if ((objtree[obnr].obj.ob_state & AOS_LOCKED) ||
					(obnr != active && (objtree[obnr].obj.ob_flags & OF_HIDETREE)))
				{
					child = NIL;
				} else
				{
					child = objtree[obnr].obj.ob_head;
				}
				if (child < 0)
				{
					while (obnr != active)
					{
						child = objtree[obnr].obj.ob_next;
						if (child < 0)
							break;
						if (objtree[child].obj.ob_tail != obnr)
							break;
						obnr = child;
					}
				}
				if (child < 0)
					obnr = active;
				else
					obnr = child;
			} while (obnr != active && (objtree[obnr].obj.ob_flags & OF_HIDETREE));
		}
		parm->act_obnr = obnr;
		Adr_unselect();
		Adr_add(ACSblk->ev_window, obnr * 3 + 2);
	}
}

/* -------------------------------------------------------------------------- */

static boolean rubberbox(Awindow *self, int16 obnr, int16 x, int16 y, int16 *dstx, int16 *dsty)
{
	int16 minw, minh;
	int16 rw, rh;
	int16 tmp;
	int16 px, py;
	int16 button;
	int16 kstate;
	int16 newx, newy;
	int16 mox, moy;
	int16 threshx, threshy;
	int16 parent;
	int16 clip[4];
	int16 pxy[8];
	MFDB *bp;
#if WITH_FIXES
	char buf[20];
#else
	char buf[12];
#endif
	OBJEDPARM *parm;
	OBJ_ENTRY *objtree;
	OBJ_ENTRY *obj;
	OBJECT *tree;
	OBJECT *popup;
	int16 maxx, maxy;
	int16 child;

	threshx = ACSblk->gl_wbox >> 1;
	threshy = ACSblk->gl_hbox >> 1;
	parm = self->user;
	tree = self->work;
	popup = Aob_create(&INFO_OB_WH);
	if (popup != NULL)
	{
		Aob_fix(popup);
		popup->ob_x = x - popup->ob_width;
		popup->ob_y = y - popup->ob_height;
		if (popup->ob_x < 0 || popup->ob_y < 0)
		{
			Aob_delete(popup);
			popup = NULL;
		} else
		{
			if ((bp = Abp_create(popup->ob_width, popup->ob_height)) != NULL)
			{
				pxy[2] = (pxy[0] = popup->ob_x) + (pxy[6] = popup->ob_width - 1);
				pxy[3] = (pxy[1] = popup->ob_y) + (pxy[7] = popup->ob_height - 1);
				pxy[4] = pxy[5] = 0;
				Amo_hide();
				vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, &ACSblk->screenMFDB, bp);
				Amo_show();
			}
		}
	}
	
	objtree = parm->obj->object;
	obj = &objtree[(obnr - 2) / 3];
	Amo_new(&ACSblk->description->mouse[BUSYBEE]);
	min_size(obj, &tree[obnr] - 1, &minw, &minh);
	child = tree[obnr].ob_head;
	if (child > 0 && !(tree[obnr].ob_state & OS_WHITEBAK))
	{
		do
		{
			switch (tree[child].ob_state & (AOS_CLLEFT | AOS_CLRIGHT))
			{
			case 0:
				maxx = tree[child].ob_x + tree[child].ob_width;
				break;
			case AOS_CLLEFT:
				maxx = tree[obnr].ob_width - tree[child].ob_x;
				tmp = tree[child].ob_x + tree[child].ob_width;
				if (tmp > maxx)
					maxx = tmp;
				break;
			case AOS_CLLEFT | AOS_CLRIGHT:
				maxx = tree[obnr].ob_width - tree[child].ob_x;
				break;
			case AOS_CLRIGHT:
				maxx = tree[obnr].ob_width - tree[child].ob_width + ACSblk->gl_wbox;
				break;
#ifdef __GNUC__
			/* shut up compiler */
			default:
				maxx = 0;
				break;
#endif
			}
			if (minw < maxx)
				minw = maxx;
			
			switch (tree[child].ob_state & (AOS_CLTOP | AOS_CLBOTTOM))
			{
			case 0:
				maxy = tree[child].ob_y + tree[child].ob_height;
				break;
			case AOS_CLTOP:
				maxy = tree[obnr].ob_height - tree[child].ob_y;
				tmp = tree[child].ob_y + tree[child].ob_height;
				if (tmp > maxy)
					maxy = tmp;
				break;
			case AOS_CLTOP | AOS_CLBOTTOM:
				maxy = tree[obnr].ob_height - tree[child].ob_y;
				break;
			case AOS_CLBOTTOM:
				maxy = tree[obnr].ob_height - tree[child].ob_height + ACSblk->gl_hbox;
				break;
#ifdef __GNUC__
			/* shut up compiler */
			default:
				maxy = 0;
				break;
#endif
			}
			if (minh < maxy)
				minh = maxy;
			
			child = tree[child + 1].ob_next;
		} while (obnr != child);
	}
	
	minw += x;
	minh += y;
	
	clip[0] = clip[1] = 0;
	clip[2] = ACSblk->desk.x + ACSblk->desk.w /* - 1 */; /* BUG: missing -1 */
	clip[3] = ACSblk->desk.y + ACSblk->desk.h;
	vs_clip(ACSblk->vdi_handle, TRUE, clip);
	if (obnr != parm->active)
	{
		parent = Aob_up(tree, obnr);
		px = tree[obnr].ob_x;
		py = tree[obnr].ob_y;
		rw = x + tree[parent].ob_width - px;
		rh = y + tree[parent].ob_height - py;
	} else
	{
		rw = rh = 30000;
#ifdef __GNUC__
		/* shut up compiler */
		parent = 0;
		px = py = 0;
#endif
	}
	graf_mkstate(&mox, &moy, &button, &kstate);
	for (;;)
	{
		if (snapping)
		{
			mox = ((mox - x + threshx) / ACSblk->gl_wbox) * ACSblk->gl_wbox + x;
			moy = ((moy - y + threshy) / ACSblk->gl_hbox) * ACSblk->gl_hbox + y;
		}
		*dstx = mox;
		*dsty = moy;
		if (!(kstate & K_CTRL))
		{
			if (*dstx > rw)
				*dstx = rw;
			if (*dsty > rh)
				*dsty = rh;
			if (*dstx < minw)
				*dstx = minw;
			if (*dsty < minh)
				*dsty = minh;
			if (obnr != parm->active)
			{
				child = tree[parent].ob_head;
				do
				{
					if (obnr != child)
					{
						maxx = tree[child].ob_x + tree[child].ob_width;
						maxy = tree[child].ob_y + tree[child].ob_height;
						if (px < maxx && py < maxy)
						{
							maxx = x - px + tree[child].ob_x;
							maxy = y - py + tree[child].ob_y;
							if (*dstx > maxx)
							{
								if (maxy > y)
								{
									if (*dsty > maxy && minh <= maxy &&
										(mox - maxx >= moy - maxy || minw > maxx))
										*dsty = maxy;
								} else
								{
									if (*dstx > maxx && minw <= maxx)
										*dstx = maxx;
								}
							}
							if (*dsty > maxy)
							{
								if (maxx > x)
								{
									if (*dstx > maxx && minw <= maxx)
										*dstx = maxx;
								} else
								{
									if (*dsty > maxy && minh <= maxy)
										*dsty = maxy;
								}
							}
						}
					}
					child = tree[child + 1].ob_next;
				} while (parent != child);
			}
		} else
		{
			if (*dstx < x + ACSblk->gl_wbox)
				*dstx = x + ACSblk->gl_wbox;
			if (*dsty < y + ACSblk->gl_hbox)
				*dsty = y + ACSblk->gl_hbox;
		}
		
		--(*dstx);
		--(*dsty);
		
		if ((button & 1) == 0 || (button & 2))
		{
			vs_clip(ACSblk->vdi_handle, 0, clip);
			*dstx -= x;
			*dsty -= y;
			Amo_new(&ACSblk->description->mouse[ARROW]);
			if (popup != NULL)
			{
				if (bp != NULL)
				{
					pxy[6] = (pxy[4] = popup->ob_x) + (pxy[2] = popup->ob_width - 1);
					pxy[7] = (pxy[5] = popup->ob_y) + (pxy[3] = popup->ob_height - 1);
					pxy[0] = pxy[1] = 0;
					Amo_hide();
					vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, bp, &ACSblk->screenMFDB);
					Amo_show();
					Abp_delete(bp);
				} else
				{
					form_dial(FMD_FINISH, popup->ob_x, popup->ob_y, popup->ob_x + popup->ob_width - 1, popup->ob_y + popup->ob_height - 1,
						popup->ob_x, popup->ob_y, popup->ob_x + popup->ob_width - 1, popup->ob_y + popup->ob_height - 1);
				}
				Aob_delete(popup);
			}
			Aev_release();
			if (button & 2)
				return FALSE;
			return TRUE;
		}
		
		graf_mouse(M_OFF, NULL);
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		vsl_color(ACSblk->vdi_handle, G_BLACK);
		dotted_xline(x, *dstx, y);
		dotted_xline(x, *dstx, *dsty);
		dotted_yline(y, *dsty, x);
		dotted_yline(y, *dsty, *dstx);
		if (popup != NULL)
		{
			sprintf(buf, "%d*%d", (*dstx - x + 1) / ACSblk->gl_wbox, (*dsty - y + 1) / ACSblk->gl_hbox);
			Aob_puttext(popup, INFO_OB_LINE, buf);
			sprintf(buf, "%d*%d", *dstx - x + 1, *dsty - y + 1);
			Aob_puttext(popup, INFO_OB_LINE2, buf);
			objc_draw(popup, ROOT, 2, popup->ob_x, popup->ob_y, popup->ob_x + popup->ob_width - 1, popup->ob_y + popup->ob_height - 1);
		}
		graf_mouse(M_ON, NULL);

		for (;;)
		{
			graf_mkstate(&newx, &newy, &button, &kstate);
			if (!(button & 1))
				break;
			if (button & 2)
				break;
			if (snapping)
			{
				if (newx - mox > threshx ||
					mox - newx > threshx ||
					newy - moy > threshy ||
					moy - newy > threshy)
					break;
			} else
			{
				if (newx != mox || newy != moy)
					break;
			}
		}
		
		graf_mouse(M_OFF, NULL);
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		vsl_color(ACSblk->vdi_handle, G_BLACK);
		dotted_xline(x, *dstx, y);
		dotted_xline(x, *dstx, *dsty);
		dotted_yline(y, *dsty, x);
		dotted_yline(y, *dsty, *dstx);
		graf_mouse(M_ON, NULL);

		mox = newx;
		moy = newy;
	}
}

/* -------------------------------------------------------------------------- */

static int16 sizing(Awindow *self, int16 obnr, int16 mox, int16 moy)
{
	OBJECT *tree;
	int16 obx, oby;
	int16 w, h;
	int16 x, y;
	OBJEDPARM *parm;
	Obj_Head *obj;
	OBJ_ENTRY *objtree;
	int16 idx;
	int16 x0, y0;
	
	tree = self->work;
	objc_offset(tree, obnr, &obx, &oby);
	w = tree[obnr].ob_width;
	h = tree[obnr].ob_height;
	x = self->wi_work.x + obx + w - mox;
	y = self->wi_work.y + oby + h - moy;
	if ((x > 8 && x > (w >> 3)) || (y > 8 && y > (h >> 3)))
		return FAIL;
	if (rubberbox(self, obnr, self->wi_work.x + obx, self->wi_work.y + oby, &x, &y))
	{
		parm = self->user;
		parm->acs->flags |= ACS_CHANGED;
		obj = parm->obj;
		objtree = obj->object;
		idx = (obnr - 2) / 3;
		x0 = x - w;
		y0 = y - h;
		resize_ob(objtree, idx, x0, y0, tree);
		if (snapping)
		{
			x += (ACSblk->gl_wbox >> 1) - 1;
			y += (ACSblk->gl_hbox >> 1) - 1;
		}
		x = char_x(x);
		y = char_y(y);
		objtree[idx].obj.ob_width = x;
		objtree[idx].obj.ob_height = y;
		if (idx == ROOT)
		{
			self->init(self);
			self->state |= AWS_FORCEREDRAW;
			self->sized(self, &self->wi_act);
			Adr_add(self, obnr);
		} else
		{
			undraw(self, obnr);
			self->work[obnr - 1].ob_flags &= ~OF_HIDETREE;
			self->work[obnr].ob_flags &= ~OF_HIDETREE;
			tree[obnr].ob_width = tree[obnr - 1].ob_width = pixel_x(x);
			tree[obnr].ob_height = tree[obnr - 1].ob_height = pixel_y(y);
			Awi_obredraw(self, obnr - 1);
			self->obchange(self, obnr, tree[obnr].ob_state | OS_SELECTED);
		}
	}
	return OK;
}

/* -------------------------------------------------------------------------- */

void undraw(Awindow *win, int16 obnr)
{
	OBJECT *tree;
	
	tree = win->work;
	tree[obnr].ob_flags |= OF_HIDETREE;
	tree[obnr].ob_state &= ~OS_SELECTED;
	tree[obnr - 1].ob_flags |= OF_HIDETREE;
	Awi_obredraw(win, obnr - 1);
}
