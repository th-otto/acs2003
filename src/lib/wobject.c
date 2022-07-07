/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Window Object utilities                               */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include <ctype.h>

static Awindow *open_dialog = NULL;
static Awiob last_edit = { NULL, NULL, 0 };

static boolean Awi_find_edit(Awindow *win, OBJECT **tree, OBJECT **other, int16 *edit);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/* Finish open Dialog */
void Awi_diaend(void)
{
	AUSERBLK *auser;
	OBJECT *tree;
	OBJECT *other;
	int16 edit;
	int16 ob_edit;
	
	if (open_dialog == NULL || Awi_find_edit(open_dialog, &tree, &other, &edit) == FALSE || !(open_dialog->state & AWS_DIALOG))
		return;
	auser = tree[edit].ob_spec.auserblk;
	open_dialog->state &= ~AWS_DIALOG;
	last_edit.window = open_dialog;
	last_edit.obnr = ob_edit = open_dialog->ob_edit;
	if (ob_edit & A_TOOLBAR)
		last_edit.entry = open_dialog->toolbar;
	else
		last_edit.entry = open_dialog->work;
	open_dialog->ob_edit = open_dialog->ob_col = -1;
	open_dialog->ob_len = 0;
	open_dialog = NULL;
	auser->ub_serv(&tree[edit], AUO_FULLUPDATE, NULL);
}

/* -------------------------------------------------------------------------- */

/* Start Dialog */
void Awi_diastart(void)
{
	Awindow *win;
	AUSERBLK *auser;
	Awiob ob;
	OBJECT *tree;
	OBJECT *other;
	int16 top;
	int16 sel[2];
	int16 edit;
	
	edit = NIL;
	wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
	if (top <= 0 || (win = Awi_wid(top)) == NULL || (win->state & AWS_DIALOG))
		return;
	if (win->ob_edit < 0 && win == last_edit.window)
	{
		if (win->work == last_edit.entry)
		{
			if (win->work[last_edit.obnr].ob_flags & OF_EDITABLE)
				edit = last_edit.obnr;
		} else if (win->toolbar == last_edit.entry)
		{
			if (win->toolbar[last_edit.obnr & A_MASK].ob_flags & OF_EDITABLE)
				edit = last_edit.obnr;
		}
	}
	if (edit > 0)
	{
		if (last_edit.obnr & A_TOOLBAR)
		{
			edit = last_edit.obnr & A_MASK;
			tree = win->toolbar;
		} else
		{
			edit = last_edit.obnr;
			tree = win->work;
		}  
	} else
	{
		if (!Awi_find_edit(win, &tree, &other, &edit))
			return;
	}
	auser = tree[edit].ob_spec.auserblk;
	win->state |= AWS_DIALOG;
	open_dialog = win;
	if (tree == win->work)
		win->ob_edit = edit;
	else
		win->ob_edit = edit | A_TOOLBAR;
	ob.window = win;
	if (tree == win->work)
	{
		ob.entry = &win->work[edit];
		ob.obnr = edit;
	} else
	{
		ob.entry = &win->toolbar[edit & A_MASK];
		ob.obnr = edit | A_TOOLBAR;
	}
	auser->ub_serv(&tree[edit], AUO_SELF, &ob);
	if (win->ob_col < 0)
	{
		sel[0] = 0;
		sel[1] = -1;
		auser->ub_serv(&tree[edit], AUO_BESETSELECT, sel);
	}
	auser->ub_serv(&tree[edit], AUO_FULLUPDATE, NULL);
}

/* -------------------------------------------------------------------------- */

static void Awi_self0(Awiob *ob, OBJECT *tree, int16 toolbar)
{
	int16 parent;
	int16 child;
	AUSERBLK *auser;
	
	parent = NIL;
	while (TRUE)
	{
		if (parent < 0)
		{
			child = ROOT;
		} else
		{
			child = tree[parent].ob_head;
		}
		if (child < 0)
		{
			child = tree[parent].ob_next;
			while (child >= 0 && parent == tree[child].ob_tail)
			{
				parent = child;
				child = tree[child].ob_next;
			}
		}
		if (child < 0)
			break;
		if ((char) tree[child].ob_type == G_USERDEF &&
			(auser = tree[child].ob_spec.auserblk) != NULL &&
			auser->ub_serv != NULL)
		{
			ob->entry = &tree[child];
			ob->obnr = child | toolbar;
			auser->ub_serv(ob->entry, AUO_SELF, ob);
		}
		parent = child;
	}
}

/* -------------------------------------------------------------------------- */

/* tree-look & send AUO_SELF to USERDEFs */
void Awi_uoself(Awindow *win)
{
	Awiob ob;
	
	ob.window = win;
	if (win->toolbar != NULL)
		Awi_self0(&ob, win->toolbar, A_TOOLBAR);
	if (win->work != NULL)
		Awi_self0(&ob, win->work, 0);
}

/* -------------------------------------------------------------------------- */

/* Change the State of this Object in Work-Tree */
void Awi_obchange(Awindow *win, int16 tobnr, int16 new_state)
{
	Axywh redraw;
	Axywh rect;
	Axywh *work;
	OBJECT *tree;
	OBJECT *obj;
	int16 wh;
	int16 x;
	int16 y;
	int16 tst;
	int16 obnr;
	int16 old_state;
	
	if (win->state & (AWS_ICONIZED | AWS_SHADED))
	{
		Awi_obredraw(win, ROOT);
	} else
	{
		if (tobnr & A_TOOLBAR)
		{
			tree = win->toolbar;
			if (tree == NULL)
				return;
			obnr = tobnr & A_MASK;
		} else
		{
			tree = win->work;
			if (tree == NULL)
				return;
			obnr = tobnr;
		}
		obj = &tree[obnr];
		if (new_state == -1)
			new_state = obj->ob_state;
		if ((char) obj->ob_type == G_CICON)
		{
			obj->ob_state = new_state;
			Awi_obredraw(win, tobnr);
		} else
		{
			redraw.x = win->wi_work.x;
			redraw.w = win->wi_work.w;
			if (tobnr & A_TOOLBAR)
			{
				redraw.y = win->wi_work.y + tree->ob_y;
				redraw.h = tree->ob_height;
			} else
			{
				redraw.y = win->wi_work.y;
				redraw.h = win->wi_work.h;
			}
			if ((obj->ob_state ^ new_state) & OS_DISABLED)
				obj->ob_state = new_state;
			old_state = obj->ob_state;
			wh = win->wi_id;
			if (wh >= 0)
			{
				work = &win->wi_work;
				x = tree->ob_x;
				y = tree->ob_y;
				tree->ob_x += work->x;
				tree->ob_y += work->y;
				graf_mouse(M_OFF, NULL);
				wind_get(wh, WF_FIRSTXYWH, &rect.x, &rect.y, &rect.w, &rect.h);
				while (rect.w > 0)
				{
					intersect(&rect, &redraw);
					if (rect.w != 0)
					{
						if (tobnr & A_TOOLBAR)
						{
							tst = rect.y + rect.h;
							if (tst > work->y)
							{
								ACSblk->ACSerror(AE_GEN, "Window-Lib");
								rect.h = work->y - rect.y;
							}
						} else
						{
							tst = rect.y - work->y;
							if (tst < 0)
							{
								ACSblk->ACSerror(AE_GEN, "Window-Lib");
								rect.y -= tst;
								rect.h += tst;
							}
						}
						if (rect.h > 0)
						{
							if (new_state == old_state)
							{
								objc_draw(tree, obnr, MAX_DEPTH, rect.x, rect.y, rect.w, rect.h);
							} else
							{
								obj->ob_state = old_state;
								objc_change(tree, obnr, 0, rect.x, rect.y, rect.w, rect.h, new_state, TRUE);
							}
						}
					}
					wind_get(wh, WF_NEXTXYWH, &rect.x, &rect.y, &rect.w, &rect.h);
				}
				graf_mouse(M_ON, NULL);
				tree->ob_x = x;
				tree->ob_y = y;
			}
			obj->ob_state = new_state;
		}
	}
}

/* -------------------------------------------------------------------------- */

/* Redraws everything in the Area of obnr (uses window->redraw) */
void Awi_obredraw(Awindow *win, int16 obnr)
{
	Axywh redraw = { -1, -1, -1, -1 };
	
	if (win->state & (AWS_ICONIZED | AWS_SHADED))
	{
		win->redraw(win, &redraw);
	} else
	{
		if (win->state & AWS_MODAL)
		{
			Aob_offset(&redraw, ACSblk->ev_object, obnr);
		} else
		{
			if (obnr & A_TOOLBAR)
				Aob_offset(&redraw, win->toolbar, obnr & A_MASK);
			else
				Aob_offset(&redraw, win->work, obnr);
			redraw.x += win->wi_work.x;
			redraw.y += win->wi_work.y;
		}
		win->redraw(win, &redraw);
	}
}

/* -------------------------------------------------------------------------- */

/* Default Redraw-Routine */
void Awi_redraw(Awindow *win, Axywh *redraw)
{
	int16 wh;
	int16 box;
	int16 thebar;
	int16 x, y;
	int16 ydiff;
	int16 tbsavex, tbsavey;
	int16 tby;
	int16 tbh;
	Axywh rect;
	Axywh *work;
	OBJECT *tree;
	OBJECT *menu;
	OBJECT *toolbar;
	
	if ((wh = win->wi_id) < 0 || (tree = win->work) == NULL || (win->state & AWS_SHADED))
		return;
	if ((win->state & AWS_ICONIZED) && (redraw->w > tree->ob_width || redraw->h > tree->ob_height))
	{
		Awi_uniconify(win);
		Aev_mess();
		tree = win->work;
	}
	/* BUG: assumes that window-handle < 128 */
	if ((win->state & AWS_ICONIZED) &&
		(tree = _ACSv_wiicons[win->wi_id]) != NULL)
	{
		wind_get(win->wi_id, WF_WORKXYWH, &redraw->x, &redraw->y, &redraw->w, &redraw->h);
		tree->ob_x = redraw->x;
		tree->ob_y = redraw->y;
		graf_mouse(M_OFF, NULL);
		wind_get(win->wi_id, WF_FIRSTXYWH, &rect.x, &rect.y, &rect.w, &rect.h);
		while (rect.w != 0 && rect.h != 0)
		{
			intersect(&rect, redraw);
			if (rect.w != 0 || rect.h != 0)
			{
				objc_draw(tree, ROOT, 6, rect.x, rect.y, rect.w, rect.h);
			}
			wind_get(win->wi_id, WF_NEXTXYWH, &rect.x, &rect.y, &rect.w, &rect.h);
		}
		graf_mouse(M_ON, NULL);
	} else
	{
		if (win->state & AWS_FORCEREDRAW)
		{
			redraw = &win->wi_act;
			win->state &= ~AWS_FORCEREDRAW;
		}
		x = tree->ob_x;
		y = tree->ob_y;
		work = &win->wi_work;
		tree->ob_x += work->x;
		tree->ob_y += work->y;
		graf_mouse(M_OFF, NULL);
		wind_get(wh, WF_FIRSTXYWH, &rect.x, &rect.y, &rect.w, &rect.h);
		while (rect.w != 0 && rect.h != 0)
		{
			intersect(&rect, redraw);
			if (rect.w != 0 || rect.h != 0)
			{
				ydiff = rect.y - work->y;
				if (ydiff < 0)
				{
					if ((menu = win->menu) != NULL)
					{
						thebar = menu[menu[ROOT].ob_head].ob_head;
						if (menu[thebar].ob_head == 3)
						{
							menu[thebar].ob_head = menu[3].ob_next;
							box = menu[ROOT].ob_tail;
							menu[box].ob_head = menu[menu[box].ob_head].ob_next;
						}
						objc_draw(menu, menu[ROOT].ob_head, 6, rect.x, rect.y, rect.w, rect.h);
					}
					
					if ((toolbar = win->toolbar) != NULL)
					{
						tby = toolbar->ob_y + work->y;
						if (tby < rect.y)
							tby = rect.y;
						tbh = rect.y + rect.h;
						if (tbh > work->y)
							tbh = work->y;
						if (tbh > tby)
						{
							tbsavex = toolbar->ob_x;
							tbsavey = toolbar->ob_y;
							toolbar->ob_x += work->x;
							toolbar->ob_y += work->y;
							objc_draw(toolbar, ROOT, 6, rect.x, tby, rect.w, tbh - tby);
							toolbar->ob_x = tbsavex;
							toolbar->ob_y = tbsavey;
						}
					}
					
					rect.y -= ydiff;
					rect.h += ydiff;
				}
				
				if (rect.h > 0)
				{
					objc_draw(tree, ROOT, 6, rect.x, rect.y, rect.w, rect.h);
				}
			}
			wind_get(wh, WF_NEXTXYWH, &rect.x, &rect.y, &rect.w, &rect.h);
		}
		graf_mouse(M_ON, NULL);
		win->work->ob_x = x;
		win->work->ob_y = y;
	}
}

/* -------------------------------------------------------------------------- */

static boolean next_arrow(void)
{
	int16 dummy;
	int16 msg[8];
	
	if (evnt_multi(MU_MESAG | MU_TIMER,
		0, 0, 0,
		0, 0, 0, 0, 0,
		0, 0, 0, 0, 0,
		msg,
		5, 0,
		&dummy, &dummy, &dummy, &dummy, &dummy, &dummy) & MU_MESAG)
	{
		if (msg[0] == WM_ARROWED)
			return TRUE;
		else
			appl_write(ACSblk->gl_apid, (int)sizeof(msg), msg);
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

/* Default arrowed function */
void Awi_arrowed(Awindow *win, int16 which, int16 amount)
{
	OBJECT *tree;
	int16 loop;
	int16 x, y;
	int16 snapx;
	int16 snapy;
	int16 xdiff;
	int16 ydiff;
	int16 val;
	int16 w;
	int16 h;
	
	if (win->wi_id <= 0)
		return;
	snapx = win->snap_mask | -256;
	snapy = win->snap_mask >> 8;
	tree = win->work;
	tree->ob_width += ~snapx;
	tree->ob_width &= snapx;
	tree->ob_height += ~snapy;
	tree->ob_height &= snapy;
	xdiff = -snapx;
	ydiff = -snapy;
	w = win->wi_work.w - tree->ob_width;
	h = win->wi_work.h - tree->ob_height;
	switch (which)
	{
	case WA_UPPAGE:
	case WA_DNPAGE:
	case WA_LFPAGE:
	case WA_RTPAGE:
		val = 1;
		break;
	
	case WA_LFLINE:
	case WA_RTLINE:
		val = ((1000L / win->wi_slider.w) >> 4) + 2;
		break;
	
	case WA_UPLINE:
	case WA_DNLINE:
		val = ((1000L / win->wi_slider.h) >> 4) + 2;
		break;
#if WITH_FIXES
	default:
		return;
#endif
	}
	loop = val;
	do
	{
		x = tree->ob_x;
		y = tree->ob_y;
		switch (which)
		{
		case WA_UPPAGE:
			if (y == 0)
				goto done;
			tree->ob_y += win->wi_work.h * amount;
			break;
		
		case WA_DNPAGE:
			if (y == h)
				goto done;
			tree->ob_y -= win->wi_work.h * amount;
			break;
		
		case WA_UPLINE:
			if (y == 0)
				goto done;
			tree->ob_y += ydiff * amount;
			break;
		
		case WA_DNLINE:
			if (y == h)
				goto done;
			tree->ob_y -= ydiff * amount;
			break;
		
		case WA_LFPAGE:
			if (x == 0)
				goto done;
			tree->ob_x += win->wi_work.w * amount;
			break;
		
		case WA_RTPAGE:
			if (x == w)
				goto done;
			tree->ob_x -= win->wi_work.w * amount;
			break;
		
		case WA_LFLINE:
			if (x == 0)
				goto done;
			tree->ob_x += xdiff * amount;
			break;

		case WA_RTLINE:
			if (x == w)
				goto done;
			tree->ob_x -= xdiff * amount;
			break;
		}
		if (tree->ob_x > 0)
			tree->ob_x = 0;
		if (tree->ob_x < w)
			tree->ob_x = w;
		if (tree->ob_y > 0)
			tree->ob_y = 0;
		if (tree->ob_y < h)
			tree->ob_y = h;
		tree->ob_x = -(-tree->ob_x & -xdiff);
		tree->ob_y = -(-tree->ob_y & -ydiff);
		if (--loop == 0)
		{
			Awi_cleanup(win);
			loop = val;
		}
		Awi_scroll(win, x, y);
	} while (next_arrow());
done:
	if (loop != val)
		Awi_cleanup(win);
}

/* -------------------------------------------------------------------------- */

/* Horizontal Slider */
void Awi_hslid(Awindow *win, int16 pos)
{
	int16 x;
	int16 y;
	int16 newpos;
	
	if (win->wi_id <= 0)
		return;
	x = win->work->ob_x;
	newpos = (((long)pos * (win->work->ob_width - win->wi_work.w)) / -1000) & (win->snap_mask | -256);
	if (x != newpos)
	{
		win->work->ob_x = newpos;
		y = win->work->ob_y;
		Awi_cleanup(win);
		Awi_scroll(win, x, y);
	}
}

/* -------------------------------------------------------------------------- */

/* Vertical Slider */
void Awi_vslid(Awindow *win, int16 pos)
{
	int16 x;
	int16 y;
	int16 newpos;
	
	if (win->wi_id <= 0)
		return;
	y = win->work->ob_y;
	newpos = (((long)pos * (win->work->ob_height - win->wi_work.h)) / -1000) & (win->snap_mask >> 8);
	if (y != newpos)
	{
		win->work->ob_y = newpos;
		x = win->work->ob_x;
		Awi_cleanup(win);
		Awi_scroll(win, x, y);
	}
}

/* -------------------------------------------------------------------------- */

/* get mouse wheel events */
boolean Awi_wheeled(Awindow *win, int16 wheels[16], int16 mx, int16 my)
{
	boolean done;
	int16 vslsize;
	int16 hslsize;
	int16 kstate;
	OBJECT *obj;
	
	done = FALSE;
	kstate = nkc_kstate();
	obj = Awi_obfind(win, mx, my, NULL, NULL);
	if (obj != NULL && obj->ob_type == G_USERDEF)
	{
		; /* code commented out? */
	}
	if (done == FALSE)
	{
		int16 g3;
		int16 dummy;
		int16 h_which;
		int16 v_which;
		int16 h_amount;
		int16 v_amount;
		
		h_which = 0;
		v_which = 0;
		wind_get(win->wi_id, WF_VSLSIZE, &vslsize);
		wind_get(win->wi_id, WF_HSLSIZE, &hslsize);
		if (appl_getinfo(AES_MOUSE, &dummy, &dummy, &g3, &dummy) && (g3 & 3) == 3)
		{
			if (wheels[0] > 0 && (win->wi_kind & DNARROW) && vslsize < 1000)
			{
				v_which = WA_UPLINE;
				v_amount = wheels[0];
			} else if (wheels[0] < 0 && (win->wi_kind & UPARROW) && vslsize < 1000)
			{
				v_which = WA_DNLINE;
				v_amount = -wheels[0];
			}
			if (wheels[1] > 0 && (win->wi_kind & RTARROW) && hslsize < 1000)
			{
				h_which = WA_RTLINE;
				h_amount = wheels[1];
			} else if (wheels[1] < 0 && (win->wi_kind & LFARROW) && hslsize < 1000)
			{
				h_which = WA_LFLINE;
				h_amount = -wheels[1];
			}
		} else
		{
			if (wheels[0] > 0 && (win->wi_kind & DNARROW) && (!(kstate & NKF_CTRL) || vslsize < 1000))
			{
				v_which = WA_UPLINE;
				v_amount = wheels[0];
			} else if (wheels[0] < 0 && (win->wi_kind & UPARROW) && (!(kstate & NKF_CTRL) || vslsize < 1000))
			{
				v_which = WA_DNLINE;
				v_amount = -wheels[0];
			} else if (wheels[0] > 0 && (win->wi_kind & RTARROW) && hslsize < 1000)
			{
				h_which = WA_RTLINE;
				h_amount = wheels[0];
			} else if (wheels[0] < 0 && (win->wi_kind & LFARROW) && hslsize < 1000)
			{
				h_which = WA_LFLINE;
				h_amount = -wheels[0];
			} else if (wheels[0] > 0 && (win->wi_kind & DNARROW) && vslsize < 1000)
			{
				v_which = WA_UPLINE;
				v_amount = wheels[0];
			} else if (wheels[0] < 0 && (win->wi_kind & UPARROW) && vslsize < 1000)
			{
				v_which = WA_DNLINE;
				v_amount = -wheels[0];
			}
		}
		if (h_which != 0 && h_amount != 0)
			win->arrowed(win, h_which, h_amount);
		if (v_which != 0 && v_amount != 0)
			win->arrowed(win, v_which, v_amount);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

/* Show Area in Work-Object-Coordinates */
void Awi_obview(Awindow *win, Axywh *area)
{
	boolean changed;
	boolean vslider;
	boolean hslider;
	int16 x, y;
	int16 w, h;
	int16 xdiff, ydiff;
	int16 yoff;
	OBJECT *tree;
	OBJECT *menu;
	OBJECT *toolbar;
	
	if (win->wi_id <= 0)
		return;
	changed = FALSE;
	tree = win->work;
	if ((win->wi_kind & (VSLIDE | UPARROW | DNARROW)) == (VSLIDE | UPARROW | DNARROW))
		vslider = TRUE;
	else
		vslider = FALSE;
	if ((win->wi_kind & (HSLIDE | RTARROW | LFARROW)) == (HSLIDE | RTARROW | LFARROW))
		hslider = TRUE;
	else
		hslider = FALSE;
	area->w += -(win->snap_mask | -256) * 2;
	area->h += -(win->snap_mask >> 8) * 2;
	x = tree->ob_x;
	y = tree->ob_y;
	w = win->wi_work.w;
	h = win->wi_work.h;
	if (hslider && area->x < 0)
	{
		tree->ob_x -= area->x;
		changed = TRUE;
	}
	if (vslider && area->y < 0)
	{
		tree->ob_y -= area->y;
		changed = TRUE;
	}
	if (hslider && area->w > w)
	{
		win->wi_work.w = area->w;
		changed = TRUE;
	}
	if (vslider && area->h > h)
	{
		win->wi_work.h = area->h;
		changed = TRUE;
	}
	xdiff = area->x + area->w - win->wi_work.w;
	if (hslider && xdiff > 0)
	{
		tree->ob_x -= xdiff;
		changed = TRUE;
	}
	ydiff = area->y + area->h - win->wi_work.h;
	if (vslider && ydiff > 0)
	{
		tree->ob_y -= ydiff;
		changed = TRUE;
	}
	if (!changed)
		return;
	yoff = 0;
	if ((menu = win->menu) != NULL)
		yoff += menu[menu[ROOT].ob_head].ob_height;
	if ((toolbar = win->toolbar) != NULL)
		yoff += toolbar->ob_height;
	wind_calc(WC_BORDER, win->wi_kind,
		win->wi_work.x, win->wi_work.y - yoff, win->wi_work.w, win->wi_work.h + yoff,
		&win->wi_act.x, &win->wi_act.y, &win->wi_act.w, &win->wi_act.h);
	tree->ob_x = -(-tree->ob_x & (win->snap_mask | -256));
	tree->ob_y = -(-tree->ob_y & (win->snap_mask >> 8));
	Awi_cleanup(win);
	if (tree->ob_x == x && tree->ob_y == y && win->wi_work.w == w && win->wi_work.h == h)
		return;
	win->state |= AWS_FORCEREDRAW;
	wind_set(win->wi_id, WF_CURRXYWH, win->wi_act.x, win->wi_act.y, win->wi_act.w, win->wi_act.h);
	if (ACSblk->AESglobal[0] > 0x300 && ACSblk->AESglobal[0] < 0x400)
		Awi_slider(win);
	Aev_mess();
	if (win->state & AWS_FORCEREDRAW)
		win->redraw(win, &win->wi_act);
}

/* -------------------------------------------------------------------------- */

boolean Aob_chdef(Awindow *win, OBJECT *tree)
{
	int16 def;
	int16 defable;
	
	if ((def = Aob_findflag(tree, NIL, OF_DEFAULT)) < 0)
		return FALSE;
	defable = Aob_findflag(tree, def, AO_DEFABLE);
	if (defable < 0 || (tree[defable].ob_flags & OF_HIDETREE))
		defable = Aob_findflag(tree, NIL, AO_DEFABLE);
	if (defable < 0 || (tree[defable].ob_flags & OF_HIDETREE) || def == defable)
		return FALSE;
	if (def >= 0)
		tree[def].ob_flags &= ~OF_DEFAULT;
	tree[defable].ob_flags |= OF_DEFAULT;
	ACSblk->ev_object = tree;
	if (win->toolbar == tree)
	{
		Awi_obredraw(win, def | A_TOOLBAR);
		win->obchange(win, defable | A_TOOLBAR, tree[defable].ob_state);
	} else
	{
		Awi_obredraw(win, def);
		win->obchange(win, defable, tree[defable].ob_state);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean Awi_find_edit(Awindow *win, OBJECT **ptree, OBJECT **other, int16 *edit)
{
	int16 ob_edit;
	OBJECT *tree;
	AUSERBLK *auser;
	
	ob_edit = win->ob_edit;
	if (ob_edit >= 0)
	{
		if (ob_edit & A_TOOLBAR)
			tree = win->toolbar;
		else
			tree = win->work;
		if (tree == NULL ||
			(char)tree[ob_edit & A_MASK].ob_type != G_USERDEF ||
			(auser = tree[ob_edit & A_MASK].ob_spec.auserblk) == NULL ||
			auser->ub_serv == NULL)
		{
			ob_edit = NIL;
		}
	}
	if (ob_edit < 0 &&
		win->work != NULL &&
		(ob_edit = Aob_findflag(win->work, NIL, OF_EDITABLE)) < 0 &&
		win->toolbar != NULL &&
		(ob_edit = Aob_findflag(win->toolbar, NIL, OF_EDITABLE) | A_TOOLBAR) >= 0)
	{
		ob_edit |= A_TOOLBAR;
	}
	if (ob_edit > 0)
	{
		if (ob_edit & A_TOOLBAR)
		{
			*ptree = win->toolbar;
			*other = win->work;
			*edit = ob_edit & A_MASK;
		} else
		{
			*ptree = win->work;
			*other = win->toolbar;
			*edit = ob_edit;
		}
		if ((char)(*ptree)[*edit].ob_type == G_USERDEF &&
			(auser = (*ptree)[*edit].ob_spec.auserblk) != NULL &&
			auser->ub_serv != NULL)
			return TRUE;
	}
	*ptree = *other = NULL;
	*edit = 0;
	return FALSE;
}

/* -------------------------------------------------------------------------- */

static void Awi_char(AUSERBLK *auser, OBJECT *obj, char c)
{
	char buf[] = " ";
	
	buf[0] = c;
	auser->ub_serv(obj, AUO_BEINSCHAR, buf);
}

/* -------------------------------------------------------------------------- */

static int16 Awi_firstedit(Awindow *win)
{
	int16 edit;
	
	if (win->toolbar != NULL &&
		(edit = Aob_findflag(win->toolbar, -1, OF_EDITABLE)) > 0)
		return edit | A_TOOLBAR;
	if ((edit = Aob_findflag(win->work, -1, OF_EDITABLE)) > 0)
		return edit;
	return NIL;
}

/* -------------------------------------------------------------------------- */

static int16 Awi_lastedit(Awindow *win)
{
	int16 edit;
	int16 next;
	OBJECT *tree;
	
	tree = NULL;
	if (win->work != NULL && Aob_findflag(win->work, -1, OF_EDITABLE) > 0)
		tree = win->work;
	else
		tree = win->toolbar;
	if (tree != NULL)
	{
		next = NIL;
		do
		{
			edit = next;
			next = Aob_findflag(tree, edit, OF_EDITABLE);
		} while (next > 0);
		if (edit > 0)
		{
			return win->toolbar == tree ? edit | A_TOOLBAR : edit;
		}
	}
	return NIL;
}

/* -------------------------------------------------------------------------- */

boolean Awi_focuschg(Awindow *win, int16 from, int16 to)
{
	OBJECT *tree;
	Axywh rect;
	
	if (to <= 0)
		return TRUE;
	if (to & A_TOOLBAR)
		tree = win->toolbar;
	else
		tree = win->work;
	if (win->service(win, AS_FOCUSCHG, &to) && to == from)
	{
		return FALSE;
	} else
	{
		Awi_diaend();
		win->ob_edit = to;
		Aob_offset(&rect, tree, to & A_MASK);
		if (rect.x < 0 ||
			rect.y < 0 ||
			rect.x + rect.w >= win->wi_work.w ||
			rect.y + rect.h >= win->wi_work.h)
		{
			Awi_obview(win, &rect);
			Aev_mess();
		}
		Awi_diastart();
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void Awi_newsel(Awindow *win, int16 oldobnr, int16 newobnr)
{
	Axywh rect;
	
	if (oldobnr > 0)
		Adr_del(win, oldobnr);
	else
		Adr_unselect();
	Adr_add(win, newobnr);
	Aob_offset(&rect, win->work, newobnr);
	Awi_obview(win, &rect);
}

/* -------------------------------------------------------------------------- */

static int16 Awi_prevsel(Awindow *win, int16 oldobnr, boolean vertical)
{
	OBJECT *tree;
	int16 head;
	int16 tail;
	int16 child;
	int16 next;
	
	next = NIL;
	tree = win->work;
	head = tree->ob_head;
	tail = tree->ob_tail;
	if (tree[tail].ob_flags & AEO)
		--tail;
	if (head == tail)
		return head;
	if (tail > oldobnr && oldobnr != 0)
		tail = oldobnr;
	child = head;
	while ((oldobnr != 0 && child < tail) || (oldobnr == 0 && child <= tail))
	{
		if ((tree[child].ob_flags & OF_SELECTABLE) && !(tree[child].ob_flags & OF_HIDETREE))
		{
			if (vertical && oldobnr != 0)
			{
				if (tree[oldobnr].ob_x == tree[child].ob_x)
					next = child;
			} else
			{
				next = child;
			}
		}
		child = tree[child].ob_next;
		if (child == 0)
			break;
	}
	return next;
}

/* -------------------------------------------------------------------------- */

static int16 Awi_nextsel(Awindow *win, int16 oldobnr, boolean vertical)
{
	OBJECT *tree;
	int16 head;
	int16 tail;
	int16 child;
	
	tree = win->work;
	head = tree->ob_head;
	tail = tree->ob_tail;
	if (tree[tail].ob_flags & AEO)
		--tail;
	if (head == tail)
		return head;
	if (oldobnr != 0)
	{
		if (head < oldobnr)
			head = oldobnr;
		child = tree[head].ob_next;
	} else
	{
		child = head;
	}
	while (child <= tail)
	{
		if ((tree[child].ob_flags & OF_SELECTABLE) && !(tree[child].ob_flags & OF_HIDETREE))
		{
			if (vertical)
			{
				if (oldobnr == 0 || tree[oldobnr].ob_x == tree[child].ob_x)
					return child;
			} else
			{
				return child;
			}
		}
		child = tree[child].ob_next;
		if (child == 0)
			break;
	}
	return NIL;
}

/* -------------------------------------------------------------------------- */

boolean Awi_help(Awindow *win)
{
	AGetSTGuide stguide;
	
	stguide.hyp_title = win->help_title;
	stguide.hyp_file = win->help_file;
	win->service(win, AS_ASK_STGUIDE, &stguide);
	if (!Ast_isEmpty(stguide.hyp_title))
	{
		if (!Ast_isEmpty(stguide.hyp_file) && Ast_icmp(&ACSblk->basename[2], stguide.hyp_file) != 0)
			return Aev_STGuideHelp(stguide.hyp_file, stguide.hyp_title, win);
		else
			return Aev_STGuideHelp(NULL, stguide.hyp_title, win);
	} else
	{
		return FALSE;
	}
}

/* -------------------------------------------------------------------------- */

void Aus_help(void)
{
	Awi_help(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static int16 Awi_keyACWork(Awindow *win, int16 kstate, int16 key)
{
	int16 ret;
	
	ret = FAIL;
	if ((key & (NKF_FUNC | NKF_ALT | NKF_CTRL)) == 0 &&
		isascii(key & 0xff) &&
		isalnum(key & 0xff))
	{
		if ((ACSblk->keyAltCtrlSwitch & KEY_AC_CTRL_WORK) &&
			(ACSblk->keyAltCtrlSwitch & KEY_AC_CTRL_FIRST_WORK) != 0 &&
			ret < 0)
			ret = Aob_wobkey(win, kstate, key | NKF_FUNC | NKF_CTRL);
		if ((ACSblk->keyAltCtrlSwitch & KEY_AC_ALT_WORK) &&
			ret < 0)
			ret = Aob_wobkey(win, kstate, key | NKF_FUNC | NKF_ALT);
		if ((ACSblk->keyAltCtrlSwitch & KEY_AC_CTRL_WORK) &&
			(ACSblk->keyAltCtrlSwitch & KEY_AC_CTRL_FIRST_WORK) == 0 &&
			ret < 0)
			ret = Aob_wobkey(win, kstate, key | NKF_FUNC | NKF_CTRL);
		if ((ACSblk->keyAltCtrlSwitch & KEY_AC_ALT_CTRL_WORK) &&
			ret < 0)
			ret = Aob_wobkey(win, kstate, key | NKF_FUNC | NKF_ALT | NKF_CTRL);
	}
	return ret;
}

/* -------------------------------------------------------------------------- */

static int16 Awi_keyACTool(Awindow *win, int16 kstate, int16 key)
{
	int16 ret;
	
	ret = FAIL;
	if ((key & (NKF_FUNC | NKF_ALT | NKF_CTRL)) == 0 &&
		isascii(key & 0xff) &&
		isalnum(key & 0xff))
	{
		if ((ACSblk->keyAltCtrlSwitch & KEY_AC_CTRL_TOOL) &&
			(ACSblk->keyAltCtrlSwitch & KEY_AC_CTRL_FIRST_TOOL) != 0 &&
			ret < 0)
			ret = Aob_tobkey(win, kstate, key | NKF_FUNC | NKF_CTRL);
		if ((ACSblk->keyAltCtrlSwitch & KEY_AC_ALT_TOOL) &&
			ret < 0)
			ret = Aob_tobkey(win, kstate, key | NKF_FUNC | NKF_ALT);
		if ((ACSblk->keyAltCtrlSwitch & KEY_AC_CTRL_TOOL) &&
			(ACSblk->keyAltCtrlSwitch & KEY_AC_CTRL_FIRST_TOOL) == 0 &&
			ret < 0)
			ret = Aob_tobkey(win, kstate, key | NKF_FUNC | NKF_CTRL);
		if ((ACSblk->keyAltCtrlSwitch & KEY_AC_ALT_CTRL_TOOL) &&
			ret < 0)
			ret = Aob_tobkey(win, kstate, key | NKF_FUNC | NKF_ALT | NKF_CTRL);
	}
	return ret;
}

/* -------------------------------------------------------------------------- */

static int16 Awi_keyACSwitch(Awindow *win, int16 kstate, int16 key)
{
	int16 ret;
	
	ret = FAIL;
	if ((key & (NKF_ALT | NKF_CTRL)) == 0)
	{
		if (ret < 0 && (ACSblk->keyAltCtrlSwitch & KEY_AC_TOOL_FIRST) != 0)
			ret = Awi_keyACTool(win, kstate, key);
		if (ret < 0)
			ret = Awi_keyACWork(win, kstate, key);
		if (ret < 0 && (ACSblk->keyAltCtrlSwitch & KEY_AC_TOOL_FIRST) == 0)
			ret = Awi_keyACTool(win, kstate, key);
	}
	return ret;
}

/* -------------------------------------------------------------------------- */

/* Key-Input for Dialog, send Keys to AV-Server if not used */
int16 Awi_keysend(Awindow *win, int16 kstate, int16 key)
{
	int16 ob_edit;
	int16 next_edit;
	int16 edit;
	int16 i;
	int16 len;
	int16 ret;
	int16 sel[2];
	char buf[256];
	char *text;
	OBJECT *tree;
	OBJECT *other;
	AUSERBLK *auser;
	Awiob ob;
	ssize_t textlen;
	
	ret = FAIL;
	if (win->state & AWS_ICONIZED)
		return ret - 1;
	if ((char)(key & 0xff) == NK_HELP)
	{
		Awi_help(win);
		return ret;
	}
	if ((win->kind & AW_OBLIST) && win->ob_edit < 0)
	{
		tree = win->work;
		if (tree == NULL)
			return ret - 1;
		if (win->ob_edit > 0 && (win->ob_edit & A_TOOLBAR))
			Adr_unselect();
		edit = ob_edit = win->ob_edit & A_MASK;
		if (key < 0) /* key & NK_FUNC */
		{
			switch ((char) key)
			{
			case NK_UNDO:
				Adr_unselect();
				break;
			
			case NK_ENTER:
			case NK_RET:
				if (ACSblk->Aselect.window == win)
				{
					/* FIXME: use graf_mkstate instead */
					vq_key_s(ACSblk->vdi_handle, &ACSblk->ev_mmokstate);
					Adr_start();
					while ((ob_edit = Adr_next()) >= 0 && !(ob_edit & A_TOOLBAR))
					{
						tree[ob_edit].ob_state |= AOS_DCLICK;
						Aob_execute(win, tree, ob_edit);
						tree[ob_edit].ob_state &= ~AOS_DCLICK;
						Adr_del(win, ob_edit);
					}
				} else
				{
					return ret - 1;
				}
				break;
			
			case NK_LEFT:
				if (ACSblk->Aselect.window == win)
				{
					Adr_start();
					ob_edit = Adr_next();
				} else
				{
					ob_edit = 0;
				}
				next_edit = Awi_prevsel(win, ob_edit, FALSE);
				if (next_edit > 0)
					Awi_newsel(win, ob_edit, next_edit);
				else
					return ret - 1;
				break;
			
			case NK_RIGHT:
				if (ACSblk->Aselect.window == win)
				{
					Adr_start();
					ob_edit = Adr_next();
				} else
				{
					ob_edit = 0;
				}
				next_edit = Awi_nextsel(win, ob_edit, FALSE);
				if (next_edit > 0)
					Awi_newsel(win, ob_edit, next_edit);
				else
					return ret - 1;
				break;

			case NK_UP:
				if (ACSblk->Aselect.window == win)
				{
					Adr_start();
					ob_edit = Adr_next();
				} else
				{
					ob_edit = 0;
				}
				next_edit = Awi_prevsel(win, ob_edit, TRUE);
				if (next_edit > 0)
					Awi_newsel(win, ob_edit, next_edit);
				else
					return ret - 1;
				break;
			

			case NK_DOWN:
				if (ACSblk->Aselect.window == win)
				{
					Adr_start();
					ob_edit = Adr_next();
				} else
				{
					ob_edit = 0;
				}
				next_edit = Awi_nextsel(win, ob_edit, TRUE);
				if (next_edit > 0)
					Awi_newsel(win, ob_edit, next_edit);
				else
					return ret - 1;
				break;
			
			case NK_POS1:
				if (ACSblk->Aselect.window == win)
				{
					if (key & NKF_SHIFT)
					{
						ob_edit = tree->ob_tail;
						if (tree[ob_edit].ob_flags & AEO)
							ob_edit--;
					} else
					{
						ob_edit = tree->ob_head;
					}
					if (ob_edit > 0 && (tree[ob_edit].ob_flags & OF_SELECTABLE) && !(tree[ob_edit].ob_flags & OF_HIDETREE))
						Awi_newsel(win, NIL, ob_edit);
					else
						return ret - 1;
				} else
				{
					if (key & NKF_SHIFT)
						win->vslid(win, 1000);
					else
						win->vslid(win, 0);
				}
				break;
			
			default:
				ob_edit = NIL;
				break;
			}
		} else
		{
			ob_edit = tree->ob_head;
			while (ob_edit > 0)
			{
				if (!(tree[ob_edit].ob_flags & OF_HIDETREE) && (len = Aob_gettext(tree, ob_edit, buf)) > 0)
				{
					for (i = 0; !isalnum(buf[i]) && i < len; )
						i++;
					if (i < len)
					{
						if (Ach_toupper(buf[i]) == Ach_toupper((char)key))
						{
							Awi_newsel(win, NIL, ob_edit);
							break;
						}
					}
				}
				ob_edit = tree[ob_edit].ob_next;
			}
		}
		return ret;
	}
	
	Awi_find_edit(win, &tree, &other, &ob_edit);
	edit = ob_edit;
	if (tree == NULL)
	{
		tree = win->work;
		if (tree == NULL)
		{
			tree = win->toolbar;
			if (tree == NULL)
			{
				return ret - 1;
			} else
			{
				other = NULL;
			}
		} else
		{
			other = win->toolbar;
		}
	}

	if ((char) key == NK_RET || (char)key == NK_ENTER)
	{
		next_edit = Aob_findflag(tree, NIL, OF_DEFAULT);
		if (next_edit < 0 || (tree[next_edit].ob_flags & OF_HIDETREE))
		{
			if (other != NULL)
			{
				next_edit = Aob_findflag(other, NIL, OF_DEFAULT);
				if (next_edit < 0 || tree[next_edit].ob_flags & OF_HIDETREE)
					return ret - 1;
				else
					Aob_execute(win, other, next_edit);
			} else
			{
				return ret - 1;
			}
		} else
		{
			Aob_execute(win, tree, next_edit);
		}
		return next_edit;
	}

	if ((char) key == NK_TAB)
	{
		if (key & NKF_CTRL)
		{
			if (!Aob_chdef(win, tree) ||
				(other != NULL && !Aob_chdef(win, other)))
			{
				ret--;
			}
			return ret;
		} else if (key & NKF_SHIFT)
		{
			key = NKF_FUNC | NK_UP;
		} else
		{
			key = NKF_FUNC | NK_DOWN;
		}
	}

	if (!Awi_find_edit(win, &tree, &other, &ob_edit))
	{
		ob_edit = Awi_keyACSwitch(win, kstate, key);
		if (ob_edit < 0)
			return ret - 1;
		else
			return ob_edit;
	}

	auser = tree[ob_edit].ob_spec.auserblk;
	if (open_dialog != win)
		Awi_diaend();
	ob.window = win;
	ob.entry = &tree[ob_edit];
	ob.obnr = ob_edit;
	auser->ub_serv(&tree[ob_edit], AUO_SELF, &ob);
	if (key < 0) /* key & NKF_FUNC */
	{
		switch ((char) key)
		{
		case NK_RIGHT:
			if (key & NKF_SHIFT)
				auser->ub_serv(&tree[ob_edit], AUO_END, NULL);
			else if (key & NKF_CTRL)
				auser->ub_serv(&tree[ob_edit], AUO_BEINCWPOS, NULL);
			else
				auser->ub_serv(&tree[ob_edit], AUO_BEINCPOS, NULL);
			break;
		
		case NK_LEFT:
			if (key & NKF_SHIFT)
				auser->ub_serv(&tree[ob_edit], AUO_BEGIN, NULL);
			else if (key & NKF_CTRL)
				auser->ub_serv(&tree[ob_edit], AUO_BEDECWPOS, NULL);
			else
				auser->ub_serv(&tree[ob_edit], AUO_BEDECPOS, NULL);
			break;
		
		case NK_BS:
			if (key & NKF_SHIFT)
				auser->ub_serv(&tree[ob_edit], AUO_BEBSLINE, NULL);
			else if (key & NKF_CTRL)
				auser->ub_serv(&tree[ob_edit], AUO_BEBSW, NULL);
			else
				auser->ub_serv(&tree[ob_edit], AUO_BEBS, NULL);
			break;
		
		case NK_DEL:
			if (key & NKF_SHIFT)
				auser->ub_serv(&tree[ob_edit], AUO_BEDELLINE, NULL);
			else if (key & NKF_CTRL)
				auser->ub_serv(&tree[ob_edit], AUO_BEDELW, NULL);
			else
				auser->ub_serv(&tree[ob_edit], AUO_BEDEL, NULL);
			break;
		
		case NK_ESC:
			auser->ub_serv(&tree[ob_edit], AUO_BEDELALL, NULL);
			break;
		
		case NK_UP:
			next_edit = NIL;
			if (key & NKF_SHIFT)
			{
				next_edit = Awi_firstedit(win);
			} else
			{
				while ((edit = Aob_findflag(tree, next_edit, OF_EDITABLE)) > 0 && edit < ob_edit)
					next_edit = edit;
				if (next_edit < 0)
					next_edit = Awi_lastedit(win);
				if (win->toolbar == tree)
					next_edit |= A_TOOLBAR;
			}
			if (!Awi_focuschg(win, ob_edit, next_edit))
				ret--;
			break;
		
		case NK_DOWN:
			next_edit = NIL;
			if (key & NKF_SHIFT)
			{
				next_edit = Awi_lastedit(win);
			} else
			{
				next_edit = Aob_findflag(tree, ob_edit, OF_EDITABLE);
				if (next_edit < 0)
					next_edit = Awi_firstedit(win);
				else if (win->toolbar == tree)
					next_edit |= A_TOOLBAR;
			}
			if (!Awi_focuschg(win, ob_edit, next_edit))
				ret--;
			break;
		
		case NK_INS:
			auser->ub_serv(&tree[ob_edit], AUO_BECHARLIST, NULL);
			break;
		
		case 'X':
		case 'x':
		case 'C':
		case 'c':
			if ((key & NKF_CTRL) &&
				auser->ub_serv(&tree[ob_edit], AUO_GETVAL, &text) &&
				auser->ub_serv(&tree[ob_edit], AUO_BEGETSELECT, sel))
			{
				if ((key & NKF_SHIFT) == 0)
					Ascrp_clear(NULL);
				Ascrp_put("txt", text, strlen(text), (key & NKF_SHIFT) != 0);
				if ((char) key == 'x' || (char) key == 'X')
				{
					if (sel[1] > sel[0])
						auser->ub_serv(&tree[ob_edit], AUO_BEDEL, NULL);
					else
						auser->ub_serv(&tree[ob_edit], AUO_SETVAL, "");
					
				}
			} else
			{
				Awi_char(auser, &tree[ob_edit], (char)key);
			}
			break;
		
		case 'V':
		case 'v':
			if ((key & NKF_CTRL) && Ascrp_get("txt", (void **)&text, &textlen))
			{
				if (textlen > 0)
				{
					auser->ub_serv(&tree[ob_edit], AUO_BEINSTEXT, text);
				}
				Ax_free(text);
			} else
			{
				Awi_char(auser, &tree[ob_edit], (char)key);
			}
			break;
		
		default:
			Awi_char(auser, &tree[ob_edit], (char)key);
			break;
		}
	} else
	{
		Awi_char(auser, &tree[ob_edit], (char)key);
	}
	auser->ub_serv(&tree[ob_edit], AUO_UPDATE, NULL);
	return ret;
}

/* -------------------------------------------------------------------------- */

/* Intelligent Scroll/Update (x,y upper left edge BEFORE scrolling) */
void Awi_scroll(Awindow *win, int16 x, int16 y)
{
	int16 xoff, yoff;
	int16 wh;
	int16 pxy[8];
	Axywh rect;
	Axywh nextrect;
	
	wh = win->wi_id;
	if (wh < 0)
		return;
	xoff = x - win->work->ob_x;
	yoff = y - win->work->ob_y;
	if ((win->kind & AW_NOSCROLL) != 0 ||
		xoff >= win->wi_work.w ||
		xoff <= -win->wi_work.w ||
		yoff >= win->wi_work.h ||
		yoff <= -win->wi_work.h)
	{
		win->redraw(win, &win->wi_work);
		return;
	}
	wind_get(wh, WF_FIRSTXYWH, &rect.x, &rect.y, &rect.w, &rect.h);
	if (rect.w == 0 || rect.h == 0)
		return;
	wind_get(wh, WF_NEXTXYWH, &nextrect.x, &nextrect.y, &nextrect.w, &nextrect.h);
	if (nextrect.w != 0 || nextrect.h != 0)
	{
		win->redraw(win, &win->wi_work);
		return;
	}
	intersect(&rect, &ACSblk->desk);
	intersect(&rect, &win->wi_work);
	if (rect.w == 0 || rect.h == 0)
		return;
	pxy[0] = pxy[4] = rect.x;
	pxy[1] = pxy[5] = rect.y;
	pxy[2] = pxy[6] = rect.x + rect.w - 1;
	pxy[3] = pxy[7] = rect.y + rect.h - 1;
	if (xoff != 0)
	{
		if (xoff > 0)
		{
			pxy[0] += xoff;
			pxy[6] -= xoff;
			rect.x = pxy[6] + 1;
			rect.w = xoff;
		} else
		{
			pxy[2] += xoff;
			pxy[4] -= xoff;
			rect.w = -xoff;
		}
	}
	if (yoff != 0)
	{
		if (yoff > 0)
		{
			pxy[1] += yoff;
			pxy[7] -= yoff;
			rect.y = pxy[7] + 1;
			rect.h = yoff;
		} else
		{
			pxy[3] += yoff;
			pxy[5] -= yoff;
			rect.h = -yoff;
		}
	}
	if (pxy[0] <= pxy[2] && pxy[1] <= pxy[3])
	{
		vs_clip(ACSblk->vdi_handle, FALSE, pxy);
		graf_mouse(M_OFF, NULL);
		vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, &ACSblk->screenMFDB, &ACSblk->screenMFDB);
		graf_mouse(M_ON, NULL);
	}
	win->redraw(win, &rect);
}

/* -------------------------------------------------------------------------- */

/* delete or set bits in ob_flags */
int16 Aob_flags(Awindow *win, int16 obnr, int16 flags, boolean setflag)
{
	OBJECT *obj;
	
	obj = NULL;
	if (obnr & A_TOOLBAR)
	{
		if (win->toolbar != NULL)
			obj = &win->toolbar[obnr & A_MASK];
	} else
	{
		if (win->work != NULL)
			obj = &win->work[obnr];
	}
	if (obj != NULL)
	{
		if (setflag)
			obj->ob_flags |= flags;
		else
			obj->ob_flags &= ~flags;
		if (win->wi_id >= 0 && (win->state & AWS_LATEUPDATE) == 0)
			win->obchange(win, obnr, -1);
		return obj->ob_flags;
	}
	return 0;
}

/* -------------------------------------------------------------------------- */

/* delete or set bits in ob_state */
int16 Aob_state(Awindow *win, int16 obnr, int16 flags, boolean setflag)
{
	OBJECT *obj;
	
	obj = NULL;
	if (obnr & A_TOOLBAR)
	{
		if (win->toolbar != NULL)
			obj = &win->toolbar[obnr & A_MASK];
	} else
	{
		if (win->work != NULL)
			obj = &win->work[obnr & A_MASK];
	}
	if (obj != NULL)
	{
		if (setflag)
			obj->ob_state |= flags;
		else
			obj->ob_state &= ~flags;
		if (win->wi_id >= 0 && (win->state & AWS_LATEUPDATE) == 0)
			win->obchange(win, obnr, -1);
		return obj->ob_state;
	}
	return 0;
}

/* -------------------------------------------------------------------------- */

/* Send a message to an object */
boolean Aob_service(OBJECT *tree, int16 obnr, int16 task, void *in_out)
{
	OBJECT *obj;
	AUSERBLK *auser;
	
	if ((ACSblk->description->flags & AB_LAZYEVAL) != 0 || tree != NULL)
	{
		obj = &tree[obnr & A_MASK];
		if ((ACSblk->description->flags & AB_LAZYEVAL) != 0 || (char)obj->ob_type == G_USERDEF)
		{
			auser = obj->ob_spec.auserblk;
			if ((ACSblk->description->flags & AB_LAZYEVAL) != 0 || auser->ub_serv != NULL)
				return auser->ub_serv(obj, task, in_out);
		}
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

/* Send a message to the window-object */
boolean Awi_observice(Awindow *win, int16 obnr, int16 task, void *in_out)
{
	if ((ACSblk->description->flags & AB_LAZYEVAL) != 0 || win != NULL)
	{
		if (obnr & A_TOOLBAR)
			return Aob_service(win->toolbar, obnr, task, in_out);
		else
			return Aob_service(win->work, obnr, task, in_out);
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

void Aob_help(void)
{
	Awi_help(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

/* check whether an object is visible (or could be depending on slider settings) */
boolean Aob_visible(OBJECT *tree, int16 obnr)
{
	int16 child;
	boolean visible = TRUE;
	
	for (child = obnr; child >= 0 && visible; child = Aob_up(tree, child))
	{
		if (tree[child].ob_flags & OF_HIDETREE)
			visible = FALSE;
	}
	return visible;
}

/* -------------------------------------------------------------------------- */

/* check whether an object is visible (or could be depending on slider settings) */
boolean Awi_obvisible(Awindow *win, int16 obnr)
{
	if (win == NULL || obnr < 0 || win->wi_id < 0 || (win->state & (AWS_ICONIZED | AWS_ALLICONIZED | AWS_SHADED)) != 0)
		return FALSE;
	if ((obnr & A_TOOLBAR) != 0 && win->toolbar != NULL)
		return Aob_visible(win->toolbar, obnr & A_MASK);
	else
		return Aob_visible(win->work, obnr);
}
