/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Drag support functions                                */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acsport.h"
#define __USE_MINT_SIGNAL
#include "acs_i.h"

#define MAX_DRAGS 512

static uint16 pattern;
static int16 drags[MAX_DRAGS][8];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void dotted_xline(int16 x1, int16 x2, int16 y)
{
	int16 pxy[4];
	
	if (y <= ACSblk->desk.y)
		return;
	if (y & 1)
	{
		if (pattern != 0xaaaau)
		{
			pattern = 0xaaaa;
			vsl_udsty(ACSblk->vdi_handle, 0xaaaa);
		}
	} else
	{
		if (pattern != 0x5555)
		{
			pattern = 0x5555;
			vsl_udsty(ACSblk->vdi_handle, 0x5555);
		}
	}
	pxy[0] = x1;
	pxy[2] = x2;
	pxy[1] = pxy[3] = y;
	vsl_type(ACSblk->vdi_handle, LT_USERDEF);
	vsl_width(ACSblk->vdi_handle, 1);
	v_pline(ACSblk->vdi_handle, 2, pxy);
}

/* -------------------------------------------------------------------------- */

void dotted_yline(int16 y1, int16 y2, int16 x)
{
	int16 pxy[4];
	
	if (x <= ACSblk->desk.x)
		return;
	if ((y1 ^ x) & 1)
	{
		if (pattern != 0xaaaa)
		{
			pattern = 0xaaaa;
			vsl_udsty(ACSblk->vdi_handle, 0xaaaa);
		}
	} else
	{
		if (pattern != 0x5555)
		{
			pattern = 0x5555;
			vsl_udsty(ACSblk->vdi_handle, 0x5555);
		}
	}
	pxy[1] = y1;
	pxy[3] = y2;
	pxy[0] = pxy[2] = x;
	vsl_type(ACSblk->vdi_handle, LT_USERDEF);
	vsl_width(ACSblk->vdi_handle, 1);
	v_pline(ACSblk->vdi_handle, 2, pxy);
}

/* -------------------------------------------------------------------------- */

void xline2(int16 x1, int16 x2, int16 y)
{
	int16 pxy[4];
	
	if (y <= ACSblk->desk.y)
		return;
	if (y & 1)
	{
		if (pattern != 0x5555)
		{
			pattern = 0x5555;
			vsl_udsty(ACSblk->vdi_handle, 0x5555);
		}
	} else
	{
		if (pattern != 0xaaaa)
		{
			pattern = 0xaaaa;
			vsl_udsty(ACSblk->vdi_handle, 0xaaaa);
		}
	}
	pxy[0] = x1;
	pxy[2] = x2;
	pxy[1] = pxy[3] = y;
	vsl_type(ACSblk->vdi_handle, LT_USERDEF);
	vsl_width(ACSblk->vdi_handle, 1);
	v_pline(ACSblk->vdi_handle, 2, pxy);
}

/* -------------------------------------------------------------------------- */

void yline2(int16 y1, int16 y2, int16 x)
{
	int16 pxy[4];
	
	if (x <= ACSblk->desk.x)
		return;
	if ((y1 ^ x) & 1)
	{
		if (pattern != 0x5555)
		{
			pattern = 0x5555;
			vsl_udsty(ACSblk->vdi_handle, 0x5555);
		}
	} else
	{
		if (pattern != 0xaaaa)
		{
			pattern = 0xaaaa;
			vsl_udsty(ACSblk->vdi_handle, 0xaaaa);
		}
	}
	pxy[1] = y1;
	pxy[3] = y2;
	pxy[0] = pxy[2] = x;
	vsl_type(ACSblk->vdi_handle, LT_USERDEF);
	vsl_width(ACSblk->vdi_handle, 1);
	v_pline(ACSblk->vdi_handle, 2, pxy);
}

/* -------------------------------------------------------------------------- */

static void drag_set(void)
{
	int16 i;
	int16 type;
	int16 obnr;
	int16 obx, oby;
	OBJECT *tree;
	ICONBLK *icon;
	
	for (i = 0; i < ACSblk->Aselect.actlen; i++)
	{
		if (i >= MAX_DRAGS)
			break;
		obnr = ACSblk->Aselect.array[i];
		if (obnr & A_TOOLBAR)
		{
			tree = ACSblk->Aselect.window->toolbar;
			obnr &= A_MASK;
		} else
		{
			tree = ACSblk->Aselect.window->work;
		}
		objc_offset(tree, obnr, &obx, &oby);
		obx += ACSblk->Aselect.window->wi_work.x;
		oby += ACSblk->Aselect.window->wi_work.y;
		type = tree[obnr].ob_type & 0xff;
		if (type == G_ICON || type == G_CICON)
		{
			icon = tree[obnr].ob_spec.iconblk;
			drags[i][0] = obx + icon->ib_xtext;
			drags[i][2] = obx + icon->ib_xicon;
			drags[i][4] = obx + icon->ib_xicon + icon->ib_wicon - 1;
			drags[i][6] = obx + icon->ib_xtext + icon->ib_wtext - 1;
			drags[i][1] = oby + icon->ib_yicon;
			drags[i][3] = oby + icon->ib_ytext;
			drags[i][5] = oby + icon->ib_ytext + icon->ib_htext - 1;
			drags[i][7] = 1;
		} else
		{
			drags[i][0] = obx;
			drags[i][1] = oby;
			drags[i][2] = obx + tree[obnr].ob_width - 1;
			drags[i][3] = oby + tree[obnr].ob_height - 1;
			drags[i][7] = 0;
		}
	}
}

/* -------------------------------------------------------------------------- */

static void drag_draw(int16 x, int16 y)
{
	int16 i;
	int16 x0;
	int16 y0;
	int16 x1;
	int16 y1;
	int16 x2;
	int16 y2;
	int16 x3;
	int16 clip[4];
	
	vswr_mode(ACSblk->vdi_handle, MD_XOR);
	vsl_ends(ACSblk->vdi_handle, 0, 0);
	clip[0] = ACSblk->desk.x;
	clip[1] = ACSblk->desk.y;
	clip[2] = ACSblk->desk.x + ACSblk->desk.w - 1;
	clip[3] = ACSblk->desk.y + ACSblk->desk.h - 1;
	vs_clip(ACSblk->vdi_handle, TRUE, clip);
	graf_mouse(M_OFF, NULL);
	for (pattern = i = 0; i < ACSblk->Aselect.actlen; i++)
	{
		if (i >= MAX_DRAGS)
			break;
		if (drags[i][7] == 1)
		{
			x0 = x + drags[i][0];
			x1 = x + drags[i][2];
			x2 = x + drags[i][4];
			x3 = x + drags[i][6];
			y0 = y + drags[i][1];
			y1 = y + drags[i][3];
			y2 = y + drags[i][5];
			if (y0 < ACSblk->desk.y)
				y0 = ACSblk->desk.y - 2;
			if (y1 < ACSblk->desk.y)
				y1 = ACSblk->desk.y - 2;
			dotted_xline(x1, x2, y0);
			dotted_xline(x0, x1, y1);
			dotted_xline(x2, x3, y1);
			dotted_xline(x0, x3, y2);
			dotted_yline(y1, y2, x0);
			dotted_yline(y0, y1, x1);
			dotted_yline(y0, y1, x2);
			dotted_yline(y1, y2, x3);
		} else
		{
			x0 = x + drags[i][0];
			x1 = x + drags[i][2];
			y0 = y + drags[i][1];
			y1 = y + drags[i][3];
			if (y0 < ACSblk->desk.y)
				y0 = ACSblk->desk.y - 2;
			dotted_xline(x0, x1, y0);
			dotted_xline(x0, x1, y1);
			dotted_yline(y0, y1, x0);
			dotted_yline(y0, y1, x1);
		}
	}
	graf_mouse(M_ON, NULL);
	vs_clip(ACSblk->vdi_handle, FALSE, clip);
	pattern = 0;
}

/* -------------------------------------------------------------------------- */

void Adr_start(void)
{
	ACSblk->Aselect.next = 0;
}

/* -------------------------------------------------------------------------- */

int16 Adr_next(void)
{
	if (ACSblk->Aselect.next >= ACSblk->Aselect.actlen)
		return -1;
	else
		return ACSblk->Aselect.array[ACSblk->Aselect.next++];
}

/* -------------------------------------------------------------------------- */

void Adr_add(Awindow *win, int16 obnr)
{
	int16 nr;
	int16 i;
	OBJECT *tree;
	
	if (ACSblk->Aselect.window != win)
	{
		Adr_unselect();
		ACSblk->Aselect.window = win;
	}
	if (obnr & A_TOOLBAR)
		tree = win->toolbar;
	else
		tree = win->work;
	for (i = 0; i < ACSblk->Aselect.actlen; i++)
		if (ACSblk->Aselect.array[i] == obnr)
			return;
	if (ACSblk->Aselect.actlen < ACSblk->Aselect.maxlen)
	{
		win->obchange(win, obnr, tree[obnr & A_MASK].ob_state | OS_SELECTED);
		ACSblk->Aselect.array[ACSblk->Aselect.actlen++] = obnr;
		nr = obnr;
		win->service(win, AS_SELECTADD, &nr);
	}
}

/* -------------------------------------------------------------------------- */

void Adr_del(Awindow *win, int16 obnr)
{
	int nr;
	int16 actlen;
	int16 *array;
	OBJECT *tree;
	int16 *drag;
	
	if (ACSblk->Aselect.window != win)
		return;
	if (obnr & A_TOOLBAR)
		tree = win->toolbar;
	else
		tree = win->work;
	for (actlen = ACSblk->Aselect.actlen, array = ACSblk->Aselect.array; actlen > 0; actlen--, array++)
	{
		if (*array == obnr)
		{
			win->obchange(win, obnr, tree[obnr & A_MASK].ob_state & ~OS_SELECTED);
			if (ACSblk->Aselect.actlen - actlen < ACSblk->Aselect.next)
				ACSblk->Aselect.next--;
			ACSblk->Aselect.actlen--;
			drag = &drags[actlen][0];
			actlen--;
			while (actlen > 0)
			{
				drag[0] = drag[8];
				drag[1] = drag[9];
				drag[2] = drag[10];
				drag[3] = drag[11];
				drag[4] = drag[12];
				drag[5] = drag[13];
				drag[6] = drag[14];
				drag[7] = drag[15];
				array[0] = array[1];
				--actlen;
				drag -= 8;
				array++;
			}
			nr = obnr;
			win->service(win, AS_SELECTDEL, &nr);
			return;
		}
	}
	if (ACSblk->Aselect.actlen == 0)
		ACSblk->Aselect.window = NULL;
}

/* -------------------------------------------------------------------------- */

void Adr_unselect(void)
{
	Awindow *win;
	int16 i;
	int16 obnr;
	
	if (ACSblk->Aselect.actlen <= 0)
		return;
	win = ACSblk->Aselect.window;
	for (i = 0; i < ACSblk->Aselect.actlen; i++)
	{
		obnr = ACSblk->Aselect.array[i];
		if (obnr & A_TOOLBAR)
			win->obchange(win, obnr, win->toolbar[obnr & A_MASK].ob_state & ~OS_SELECTED);
		else
			win->obchange(win, obnr, win->work[obnr].ob_state & ~OS_SELECTED);
	}
	ACSblk->Aselect.actlen = 0;
	ACSblk->Aselect.window = NULL;
	win->service(win, AS_SELECTDEL, NULL);
}

/* -------------------------------------------------------------------------- */

static void rect_find(Awindow *win, OBJECT *tree, int16 obnr, int16 x, int16 y, Axywh *rect, Asel *sel)
{
	OBJECT *obj;
	int16 child;
	int16 x1;
	int16 x2;
	int16 y1;
	int16 y2;
	int16 type;
	int16 xtext1;
	int16 xtext2;
	int16 ytext1;
	int16 ytext2;
	ICONBLK *icon;
	
	if ((child = tree[obnr].ob_head) < 0)
		return;
	while (child != obnr)
	{
		obj = &tree[child];
		x2 = (x1 = x + obj->ob_x) + obj->ob_width - 1;
		y2 = (y1 = y + obj->ob_y) + obj->ob_height - 1;
		if ((type = obj->ob_type & 0xff) == G_ICON || type == G_CICON)
		{
			icon = obj->ob_spec.iconblk;
			x1 += icon->ib_xicon;
			x2 = x1 + icon->ib_wicon - 1;
			y1 += icon->ib_yicon;
			y2 = y1 + icon->ib_hicon - 1;
			xtext2 = (xtext1 = x + obj->ob_x + icon->ib_xtext) + icon->ib_wtext - 1;
			ytext2 = (ytext1 = y + obj->ob_y + icon->ib_ytext) + icon->ib_htext - 1;
		} else
		{
			xtext1 = xtext2 = ytext1 = ytext2 = -1;
		}
		if ((y2 >= rect->y &&
			 y1 <= rect->y + rect->h - 1 &&
			 x2 >= rect->x &&
			 x1 <= rect->x + rect->w - 1) ||
			(ytext2 >= rect->y &&
			 ytext1 <= rect->y + rect->h - 1 &&
			 xtext2 >= rect->x &&
			 xtext1 <= rect->x + rect->w - 1))
		{
			if ((obj->ob_flags & AO_DRAGABLE) && !(obj->ob_flags & OF_HIDETREE) && !(obj->ob_state & OS_DISABLED))
			{
				if (tree == win->work)
					Adr_add(win, child);
				else
					Adr_add(win, child | A_TOOLBAR);
			}
		} else
		{
			if (!(tree[child].ob_state & OS_SELECTED))
				goto next;
			if (sel->array != NULL)
			{
				for (type = 0; type < sel->actlen; type++)
					if ((sel->array[type] & A_MASK) == child)
						goto next;
			}
			if (tree == win->work)
				Adr_del(win, child);
			else
				Adr_del(win, child | A_TOOLBAR);
		}
	next:
		if (!(obj->ob_flags & OF_HIDETREE))
			rect_find(win, tree, child, x1, y1, rect, sel);
		child = obj->ob_next;
	}
}

/* -------------------------------------------------------------------------- */

void Adr_box(int16 x, int16 y)
{
	Axywh lastrect;
	Axywh rect;
	Axywh toolbar;
	int16 actlen;
	boolean with_toolbar;
	boolean arrowed;
	int16 treepos;
	int16 pos;
	Awindow *win;
	int16 sliderval;
	int16 y2;
	int16 newx;
	int16 newy;
	int16 lastx;
	int16 lasty;
	int16 kstate;
	int16 mox;
	int16 moy;
	Asel sel;
	
	arrowed = FALSE;
	if ((win = Awi_wid(wind_find(x, y))) == NULL)
		return;
	if (!(ACSblk->ev_mmokstate & K_SHIFT))
	{
		Adr_unselect();
		sel.array = NULL;
		actlen = 0;
	} else
	{
		if ((sel.array = Ax_malloc(ACSblk->Aselect.maxlen * sizeof(*sel.array))) == NULL)
			return;
		memset(sel.array, 0, ACSblk->Aselect.maxlen * sizeof(*sel.array));
		memcpy(sel.array, ACSblk->Aselect.array, ACSblk->Aselect.actlen * sizeof(*sel.array));
		actlen = sel.actlen = ACSblk->Aselect.actlen;
	}
	ACSblk->Aselect.window = win;
	toolbar.x = win->wi_work.x;
	toolbar.y = win->wi_work.y;
	toolbar.w = win->wi_work.w;
	toolbar.h = win->wi_work.h;
	if (win->toolbar == NULL || y >= win->wi_work.y)
	{
		with_toolbar = FALSE;
	} else
	{
		with_toolbar = TRUE;
		toolbar.y += win->toolbar->ob_y;
		toolbar.h = win->toolbar->ob_height;
	}
	rect.x = lastrect.x = newx = lastx = x;
	rect.y = lastrect.y = newy = lasty = y;
	rect.w = lastrect.w = rect.h = lastrect.h = 0;
	win->service(win, AS_REALSEL_START, NULL);
	Amo_new(&ACSblk->description->mouse[BUSYBEE]);
	Awi_update(BEG_MCTRL);
	
	do
	{
		Amo_hide();
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		dotted_xline(lastrect.x, sliderval = lastrect.x + lastrect.w - 1, lastrect.y);
#if WITH_FIXES
		y2 = lastrect.y + lastrect.h - 1;
		if (lastrect.x != sliderval)
			dotted_xline(lastrect.x, sliderval, y2);
#else
		if (lastrect.x != sliderval)
			dotted_xline(lastrect.x, sliderval, y2 = lastrect.y + lastrect.h - 1);
#endif
		dotted_yline(lastrect.y, y2, lastrect.x);
		if (lastrect.y != y2)
			dotted_yline(lastrect.y, y2, sliderval);
		Amo_show();
		
		do
		{
			vq_mouse(ACSblk->vdi_handle, &kstate, &mox, &moy);
		} while (arrowed == FALSE && kstate != 0 && mox == lastx && moy == lasty);

		Amo_hide();
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		dotted_xline(lastrect.x, sliderval, lastrect.y);
		if (lastrect.x != sliderval)
			dotted_xline(lastrect.x, sliderval, lastrect.y + lastrect.h - 1);
		dotted_yline(lastrect.y, y2, lastrect.x);
		if (lastrect.y != y2)
			dotted_yline(lastrect.y, y2, sliderval);
		Amo_show();
		
		if (kstate != 0)
		{
			rect.x = newx < (lastx = mox) ? newx : (lastx = mox);
			rect.y = newy < (lasty = moy) ? newy : (lasty = moy);
			if ((rect.w = lastx - newx) < 0)
				rect.w = -rect.w;
			++rect.w;
			if ((rect.h = lasty - newy) < 0)
				rect.h = -rect.h;
			++rect.h;
			arrowed = FALSE;
			if (with_toolbar == FALSE)
			{
				pos = win->wi_work.x;
				if (win->wi_slider.x > 0 && lastx < pos && (win->wi_kind & (HSLIDE | LFARROW)))
				{
					treepos = win->work->ob_x;
					sliderval = max(1, (int16)(win->wi_slider.x - ((long)(pos - lastx + 1) * 1000) / win->wi_slider.w));
					if (win->wi_slider.x - sliderval < ((~win->snap_mask & 0xff) + 1))
						win->arrowed(win, WA_LFLINE, 1);
					else
						win->hslid(win, sliderval);
					rect.w += (y2 = -treepos + win->work->ob_x);
					rect.x -= y2;
					newx += y2;
					arrowed = TRUE;
				}
				
				pos = win->wi_work.y;
				if (win->wi_slider.y > 0 && lasty < pos && (win->wi_kind & (VSLIDE | UPARROW)))
				{
					treepos = win->work->ob_y;
					sliderval = max(1, (int16)(win->wi_slider.y - ((long)(pos - lasty + 1) * 1000) / win->wi_slider.h));
					if (win->wi_slider.y - sliderval < (((~win->snap_mask >> 8) & 0xff) + 1))
						win->arrowed(win, WA_UPLINE, 1);
					else
						win->vslid(win, sliderval);
					rect.h += (y2 = -treepos + win->work->ob_y);
					rect.y -= y2;
					newy += y2;
					arrowed = TRUE;
				}
				
				pos = win->wi_work.x + win->wi_work.w - 1;
				if (win->wi_slider.x < 1000 && pos < lastx && (win->wi_kind & (HSLIDE | RTARROW)))
				{
					treepos = win->work->ob_x;
					sliderval = min(1000, (int16)(((long)(lastx - pos + 1) * 1000) / win->wi_slider.w + win->wi_slider.x));
					win->hslid(win, sliderval);
					rect.x -= (y2 = treepos - win->work->ob_x);
					rect.w += y2;
					newx -= y2;
					arrowed = TRUE;
				}
				
				pos = win->wi_work.y + win->wi_work.h - 1;
				if (win->wi_slider.y < 1000 && pos < lasty && (win->wi_kind & (VSLIDE | DNARROW)))
				{
					treepos = win->work->ob_y;
					sliderval = min(1000, (int16)(((long)(lasty - pos + 1) * 1000) / win->wi_slider.h + win->wi_slider.y));
					win->vslid(win, sliderval);
					rect.y -= (y2 = treepos - win->work->ob_y);
					rect.h += y2;
					newy -= y2;
					arrowed = TRUE;
				}
			}
			
			lastrect.x = rect.x;
			lastrect.y = rect.y;
			lastrect.w = rect.w;
			lastrect.h = rect.h;
			intersect(&lastrect, &toolbar);
			if (with_toolbar)
			{
				rect_find(win, win->toolbar, ROOT, win->wi_work.x, win->wi_work.y + win->toolbar->ob_y, &rect, &sel);
			} else
			{
				rect_find(win, win->work, ROOT, win->wi_work.x + win->work->ob_x, win->wi_work.y + win->work->ob_y, &rect, &sel);
			}
			if (actlen != ACSblk->Aselect.actlen)
			{
				win->service(win, AS_REALSEL_UPDATE, NULL);
				actlen = ACSblk->Aselect.actlen;
			}
		}
	} while (kstate != 0);
	
	Awi_update(END_MCTRL);
	win->service(win, AS_REALSEL_END, NULL);
	if (sel.array != NULL)
		Ax_ifree(sel.array);
	Amo_new(&ACSblk->description->mouse[ARROW]);
}

/* -------------------------------------------------------------------------- */

static int16 Adr_find0(OBJECT *tree, int16 obnr, int16 max_depth, int16 x, int16 y)
{
	int16 obx;
	int16 oby;
	int16 child;
	int16 type;
	int16 foundobj;
	int16 found;
	OBJECT *obj;
	Axywh rect;
	Axywh text;
	ICONBLK *icon;

	obj = &tree[obnr];
	if (obj->ob_flags & OF_HIDETREE)
		return NIL;
	if (obj->ob_state & OS_DISABLED)
		return NIL;
	if ((type = obj->ob_type & 0xff) == G_ICON || type == G_CICON)
	{
		icon = obj->ob_spec.iconblk;
		rect.x = obj->ob_x + icon->ib_xicon;
		rect.y = obj->ob_y + icon->ib_yicon;
		rect.w = icon->ib_wicon;
		rect.h = icon->ib_hicon;
		text.x = obj->ob_x + icon->ib_xtext;
		text.y = obj->ob_y + icon->ib_ytext;
		text.w = icon->ib_wtext;
		text.h = icon->ib_htext;
		if (!Aob_within(&rect, x, y) && !Aob_within(&text, x, y))
			return NIL;
	} else
	{
		rect.x = obj->ob_x;
		rect.y = obj->ob_y;
		rect.w = obj->ob_width;
		rect.h = obj->ob_height;
		if (!Aob_within(&rect, x, y))
			return NIL;
	}
	child = obj->ob_head;
	if (child >= 0 && max_depth > 0)
	{
		obx = x - obj->ob_x;
		oby = y - obj->ob_y;
		found = NIL;
		do
		{
			foundobj = Adr_find0(tree, child, max_depth - 1, obx, oby);
			if (foundobj >= 0)
				found = foundobj;
			child = tree[child].ob_next;
		} while (child != obnr);
		if (found >= 0)
			return found;
	}
	return obnr;
}

/* -------------------------------------------------------------------------- */

int16 Adr_find(OBJECT *work, int16 start, int16 depth, int16 x, int16 y)
{
	int16 px, py;
	int16 parent;
	
	if (start == ROOT)
	{
		return Adr_find0(work, ROOT, depth, x, y);
	} else
	{
		parent = Aob_up(work, start);
		objc_offset(work, parent, &px, &py);
		return Adr_find0(work, start, depth, x - px, y - py);
	}
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void addDD2Popup(void *para, void *elem)
{
	ssize_t len;
	
	if (((A_dd *)elem)->type & DD_XACC)
	{
		len = strlen(((A_dd *)elem)->xacc_name);
		if (len > 0)
		{
			if (strlen(((ddPopStruc *)para)->popup) + len < 256)
			{
				strcat(((ddPopStruc *)para)->popup, ((A_dd *)elem)->xacc_name);
				strcat(((ddPopStruc *)para)->popup, "|");
				if (((ddPopStruc *)para)->len < len)
					((ddPopStruc *)para)->len = len;
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static int16 DDCmpName(void *para, void *elem)
{
	return strncmp(para, ((A_dd *)elem)->xacc_name, min(strlen(para), strlen(((A_dd *)elem)->xacc_name))) == 0;
}

/* -------------------------------------------------------------------------- */

void Adr_drag(int16 x, int16 y)
{
	A_dd *appl;
	char popuptext[256] = "";
	char *chk;
	AOBJECT *aobj;
	CONTEXT ctx;
	int16 mox;
	int16 moy;
	int16 oldx;
	int16 oldy;
	int16 rx;
	int16 ry;
	int16 kstate;
	int16 feedback;
	int16 wfowner;
	int16 mouse_index;
	int16 obnr;
	int16 lastobj;
	int16 wh;
	boolean foreign;
	int16 owner;
	int16 button;
	int16 dragok[2];
	int16 dragdist;
	int16 dragloop;
	AUSERBLK *auser;
	Awindow *win;
	Awindow *lastwin;
	OBJECT *obj;
	OBJECT *tree;
	int16 dragx;
	int16 dragy;
	int16 mouse_form;
	int16 dragconfig[14];
	
	auser = NULL;
	if (ACSblk->Aselect.actlen <= 0)
		return;
	win = ACSblk->Aselect.window;
	dragconfig[0] = 1;
	dragconfig[1] = 1;
	dragconfig[2] = ACSblk->desk.x;
	dragconfig[3] = ACSblk->desk.x + ACSblk->desk.w - 1;
	dragconfig[4] = ACSblk->desk.y;
#if WITH_FIXES
	dragconfig[5] = ACSblk->desk.y + ACSblk->desk.h - 1;
#else
	dragconfig[5] = ACSblk->desk.y + ACSblk->desk.w - 1;
#endif
	dragconfig[13] = dragconfig[12] = dragconfig[11] = dragconfig[10] = dragconfig[9] = dragconfig[8] = dragconfig[7] = dragconfig[6] = POINT_HAND;
	win->service(win, AS_CONFIGDRAG, dragconfig);
	drag_set();
	lastwin = NULL;
	dragx = x % dragconfig[0];
	dragy = y % dragconfig[1];
	mox = x;
	moy = y;
	
	mouse_index = ACSblk->ev_mmokstate;
	if (mouse_index & K_SHIFT)
		mouse_index |= K_SHIFT;
	mouse_index >>= 1;
	mouse_form = dragconfig[mouse_index + 6];
	Amo_new(&ACSblk->description->mouse[mouse_form]);
	lastobj = -1;
	
	do
	{
		rx = mox - x;
		ry = moy - y;
		drag_draw(rx, ry);
		do
		{
			oldx = mox;
			oldy = moy;
			graf_mkstate(&mox, &moy, &button, &kstate);
			mouse_index = kstate;
			if (mouse_index & K_SHIFT)
				mouse_index |= K_SHIFT;
			mouse_index >>= 1;
			if (mouse_form != dragconfig[mouse_index + 6])
			{
				mouse_form = dragconfig[mouse_index + 6];
				Amo_new(&ACSblk->description->mouse[mouse_form]);
			}
			mox += dragconfig[0] >> 1;
			moy += dragconfig[1] >> 1;
			if (mox < dragconfig[2])
				mox = dragconfig[2];
			if (mox > dragconfig[3])
				mox = dragconfig[3];
			if (moy < dragconfig[4])
				moy = dragconfig[4];
			if (moy > dragconfig[5])
				moy = dragconfig[5];
			mox -= (mox - dragx) % dragconfig[0];
			moy -= (moy - dragy) % dragconfig[1];
		} while (button != 0 && oldx == mox && oldy == moy);
		drag_draw(rx, ry);
		wh = wind_find(mox, moy);
		win = Awi_wid(wh);
		foreign = win == NULL;
		
		if (win != NULL &&
			(win->work != NULL || win->toolbar != NULL))
		{
			obnr = Adr_find(win->work, ROOT, MAX_DEPTH, mox - win->wi_work.x, moy - win->wi_work.y);
			if (obnr < 0 && win->toolbar != NULL)
			{
				obnr = Adr_find(win->toolbar, ROOT, MAX_DEPTH, mox - win->wi_work.x, moy - win->wi_work.y);
				if (obnr >= 0)
					obnr |= A_TOOLBAR;
			}
			while (obnr >= 0)
			{
				if (win == lastwin && obnr == lastobj)
					break;
				if (obnr & A_TOOLBAR)
					obj = &win->toolbar[obnr & A_MASK];
				else
					obj = &win->work[obnr];
				if ((obj->ob_flags & AO_ACCEPT) ||
					((char)obj->ob_type == G_USERDEF && (obj->ob_flags & OF_EDITABLE)))
					break;
				if ((obj->ob_flags & AO_DRAGABLE) && (obj->ob_state & OS_SELECTED))
				{
					obnr = -1;
					break;
				}
				if (obnr & A_TOOLBAR)
					obnr = Aob_up(win->toolbar, obnr & A_MASK) | A_TOOLBAR;
				else
					obnr = Aob_up(win->work, obnr);
			}
		} else
		{
			obnr = -1;
		}
		
		if (obnr != lastobj || win != lastwin)
		{
			if (lastobj >= 0)
			{
				if (lastobj & A_TOOLBAR)
					obj = &lastwin->toolbar[lastobj & A_MASK];
				else
					obj = &lastwin->work[lastobj];
				if (!(obj->ob_flags & AO_SILENT))
					lastwin->obchange(lastwin, lastobj, obj->ob_state & ~OS_SELECTED);
			}
			lastobj = -1;
			if (obnr >= 0)
			{
				if (obnr & A_TOOLBAR)
					obj = &win->toolbar[obnr & A_MASK];
				else
					obj = &win->work[obnr];
				if ((obj->ob_flags & AO_DRAGABLE) && (obj->ob_state & OS_SELECTED))
				{
					obnr = NIL;
				} else if (!(obj->ob_flags & AO_SILENT))
				{
					dragok[0] = obnr;
					dragok[1] = TRUE;
					win->service(win, AS_CHECKDRAG, dragok);
					if (dragok[1] == TRUE)
						win->obchange(win, obnr, obj->ob_state | OS_SELECTED);
					else
						obnr = NIL;
				}
				lastwin = win;
				lastobj = obnr;
			}
		}
	} while (button != 0);
	
	Amo_new(&ACSblk->description->mouse[ARROW]);
	ACSblk->Aselect.dragback = TRUE;
	if (lastobj >= 0)
	{
		if (lastobj & A_TOOLBAR)
			tree = lastwin->toolbar;
		else
			tree = lastwin->work;
#if WITH_FIXES
		aobj = (AOBJECT *)&tree[lastobj & A_MASK];
		if (!(aobj->ob_flags & OF_LASTOB))
			aobj++;
#else
		aobj = (AOBJECT *)&tree[lastobj & A_MASK] + 1;
#endif
		if ((aobj->ob_flags & AEO) && aobj->drag)
		{
			ACSblk->Aselect.x = x;
			ACSblk->Aselect.y = y;
			ACSblk->Aselect.rx = rx;
			ACSblk->Aselect.ry = ry;
			Act_save(&ctx);
			ACSblk->ev_mmox = mox;
			ACSblk->ev_mmoy = moy;
			ACSblk->ev_mmokstate = kstate;
			ACSblk->ev_window = lastwin;
			ACSblk->ev_object = tree;
			ACSblk->ev_obnr = lastobj & A_MASK;
			Amo_busy();
			aobj->drag();
			Amo_unbusy();
			Act_restore(&ctx);
		} else
		{
			auser = tree[lastobj & A_MASK].ob_spec.auserblk;
			if (auser->ub_serv)
			{
				Adr_start();
				if ((obnr = Adr_next()) > 0)
				{
					if (obnr & A_TOOLBAR)
						aobj = (AOBJECT *)&ACSblk->Aselect.window->toolbar[obnr & A_MASK] + 1;
					else
						aobj = (AOBJECT *)&ACSblk->Aselect.window->work[obnr] + 1;
					switch (aobj->type)
					{
					case AT_STRING:
					case AT_FILE:
					case AT_TEXT:
						if (aobj->userp1 == NULL ||
							auser->ub_serv(&tree[lastobj & A_MASK], AUO_BEINSTEXT, aobj->userp1) == FALSE)
							auser = NULL;
						break;
					default:
						auser = NULL;
						break;
					}
				} else
				{
					auser = NULL;
				}
			} else
			{
				auser = NULL;
			}
		}
		
		if ((tree == lastwin->work || tree == lastwin->toolbar) && 
			!(tree[lastobj & A_MASK].ob_flags & AO_SILENT))
			lastwin->obchange(lastwin, lastobj, tree[lastobj & A_MASK].ob_state & ~OS_SELECTED);
		if (auser)
			auser->ub_serv(&tree[lastobj & A_MASK], AUO_UPDATE, NULL);
		Aev_release();
	} else if (foreign)
	{
		owner = -1;
		/* wind_get(WF_OWNER) available? */
		if (appl_getinfo(AES_WINDOW, &wfowner, NULL, NULL, NULL) && (wfowner & 0x10) &&
			wind_get(wh, WF_OWNER, &owner, NULL, NULL, NULL) == 0)
			owner = -1;
		if (owner < 0)
		{
			ddPopStruc pop;
			
			feedback = 0;
			wfowner = 0;
			popuptext[0] = '\0';
			pop.popup = popuptext;
			pop.len = 0;
			ListOfApps->doFor(ListOfApps, &pop, 0, addDD2Popup);
			wfowner = (int16)pop.len;
			if (!Ast_isEmpty(popuptext))
			{
				/* remove last '|' */
				popuptext[strlen(popuptext) - 1] = '\0';
				chk = popuptext;
				chk = Ame_strpopup(ACSblk->ev_window, popuptext, chk, (wfowner + 3) * ACSblk->gl_wbox, -1, -1);
				if (chk != NULL)
				{
					appl = ListOfApps->searchFor(ListOfApps, chk, DDCmpName);
					owner = appl->id;
				}
			}
		}

		if (owner >= 0)
		{
			int16 msg[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
			int16 events;
			int16 dummy;
			char *ansbuf = NULL;
			char reply[2];
			char pipename[] = "U:\\PIPE\\DRAGDROP.AA";
			char exts[34];
			ssize_t slen;
			long fd;
			int32 rfds;
			int32 oldhandler;
			IMG_HEADER *img_header;
			void *imgdata;
			XATTR xattr;
			
			img_header = NULL;
			imgdata = NULL;
			if (Dsetdrv(Dgetdrv()) & (1L << ('U' - 'A')) &&
				Fxattr(0, "U:\\PIPE", &xattr) == 0)
			{
				do
				{
					pipename[18]++;
					if (pipename[18] > 'Z')
					{
						pipename[17]++;
						if (pipename[17] > 'Z')
							break;
						else
							pipename[18] = 'A';
					}
					fd = Fcreate(pipename, FA_HIDDEN);
				} while (fd < 0);
				if (fd >= 0)
				{
					Awi_update(END_UPDATE);
					msg[0] = AP_DRAGDROP;
					msg[1] = ACSblk->gl_apid;
					msg[3] = wh;
					msg[4] = mox;
					msg[5] = moy;
					msg[6] = kstate;
					msg[7] = (pipename[17] << 8) | pipename[18];
					if (appl_write(owner, (int)sizeof(msg), msg) != 0)
					{
						rfds = 1L << fd;
						if (Fselect(3000, &rfds, NULL, NULL) != 0 &&
							rfds != 0 &&
							Fread((int) fd, 1, reply) == 1 &&
							reply[0] == DD_OK &&
							Fread((int) fd, 32, exts) == 32)
						{
							oldhandler = (int32)Psignal(SIGPIPE, (void *)SIG_IGN);
							Adr_start();
							if ((obnr = Adr_next()) > 0)
							{
								if (obnr & A_TOOLBAR)
									aobj = (AOBJECT *)&ACSblk->Aselect.window->toolbar[obnr & A_MASK] + 1;
								else
									aobj = (AOBJECT *)&ACSblk->Aselect.window->work[obnr] + 1;
								switch (aobj->type)
								{
								case AT_STRING:
								case AT_TEXT:
									strcpy(exts, ".TXT    \0\0");
									break;
								case AT_FILE:
									strcpy(exts, "ARGS    \0\0");
									break;
								default:
									Psignal(SIGPIPE, (void *)oldhandler);
									Fclose((int) fd);
									Awi_update(BEG_UPDATE);
									goto send_acc;
								}
								dummy = 10;
								slen = strlen(aobj->userp1);
								exts[4] = (char)((slen >> 24) & 0xff);
								exts[5] = (char)((slen >> 16) & 0xff);
								exts[6] = (char)((slen >>  8) & 0xff);
								exts[7] = (char)((slen      ) & 0xff);
								if (Fwrite((int) fd, sizeof(dummy), &dummy) == sizeof(dummy) &&
									Fwrite((int) fd, 10, exts) == 10 &&
									evnt_timer(10, 0) != 0 &&
									Fread((int) fd, 1, reply) == 1 &&
									reply[0] == DD_OK &&
									slen != Fwrite((int) fd, strlen(aobj->userp1), aobj->userp1))
								{
									Psignal(SIGPIPE, (void *)oldhandler);
									Fclose((int) fd);
									Awi_update(BEG_UPDATE);
									goto send_acc;
								}
							}
							Psignal(SIGPIPE, (void *)oldhandler);
						}
					}
					Awi_update(BEG_UPDATE);
					Fclose((int) fd);
				}
			} else
			{
			send_acc:
				Adr_start();
				if ((obnr = Adr_next()) > 0)
				{
					if (obnr & A_TOOLBAR)
						aobj = (AOBJECT *)&ACSblk->Aselect.window->toolbar[obnr & A_MASK] + 1;
					else
						aobj = (AOBJECT *)&ACSblk->Aselect.window->work[obnr] + 1;
					switch (aobj->type)
					{
					case AT_STRING:
					case AT_FILE:
					case AT_TEXT:
						ansbuf = Ax_glmalloc(strlen(aobj->userp1) + 1);
						if (ansbuf != NULL)
						{
							strcpy(ansbuf, aobj->userp1);
							memset(msg, 0, sizeof(msg));
							msg[0] = ACC_TEXT;
#if WITH_FIXES
							msg[1] = ACSblk->gl_apid;
#endif
							msg[4] = (int16)((long)ansbuf >> 16);
							msg[5] = (int16)(long)ansbuf;
							Awi_update(END_UPDATE);
							Aev_mess();
							appl_write(owner, (int)sizeof(msg), msg);
							memset(msg, 0, sizeof(msg));
							events = evnt_multi(MU_MESAG | MU_TIMER,
								0, 0, 0,
								0, 0, 0, 0, 0,
								0, 0, 0, 0, 0,
								msg,
								2000, 0,
								&dummy, &dummy, &dummy, &dummy, &dummy, &dummy);
							if (events & MU_MESAG)
							{
								if (msg[0] != ACC_ACK)
									appl_write(ACSblk->gl_apid, (int)sizeof(msg), msg);
								else if (msg[3] != 0)
									Adr_del(ACSblk->Aselect.window, obnr);
							}
							Awi_update(BEG_UPDATE);
							Ax_glfree(ansbuf);
						}
						break;

					case AT_MFDB:
						if (Abp_mfdb2img(aobj->userp1, &img_header, &slen) == OK)
						{
							slen += img_header->headlen * 2;
							if ((imgdata = Ax_glmalloc(slen)) != NULL)
							{
								memcpy(imgdata, img_header, slen);
								memset(msg, 0, sizeof(msg));
								msg[0] = ACC_IMG;
#if WITH_FIXES
								msg[1] = ACSblk->gl_apid;
#endif
								msg[3] = 1;
								msg[4] = (int16)((long)imgdata >> 16);
								msg[5] = (int16)(long)imgdata;
								msg[6] = (int16)(slen >> 16);
								msg[7] = (int16)(slen);
								Awi_update(END_UPDATE);
								Aev_mess();
								appl_write(owner, (int)sizeof(msg), msg);
								memset(msg, 0, sizeof(msg));
								events = evnt_multi(MU_MESAG | MU_TIMER,
									0, 0, 0,
									0, 0, 0, 0, 0,
									0, 0, 0, 0, 0,
									msg,
									3000, 0,
									&dummy, &dummy, &dummy, &dummy, &dummy, &dummy);
								if (events & MU_MESAG)
								{
									if (msg[0] != ACC_ACK)
										appl_write(ACSblk->gl_apid, (int)sizeof(msg), msg);
									else if (msg[3] != 0)
										Adr_del(ACSblk->Aselect.window, obnr);
								}
								Awi_update(BEG_UPDATE);
								Ax_glfree(imgdata);
							}
							Ax_free(img_header);
						}
						break;
					}
					ACSblk->Aselect.dragback = FALSE;
				}
			}
		} else
		{
			win = ACSblk->Aselect.window;
			win->service(win, AS_DRAGABORTED, &wh);
		}
	}

	if (ACSblk->Aselect.dragback == FALSE)
		return;
	if (ACSblk->Aselect.actlen == 0)
		return;
	if (ACSblk->description->flags & AB_FEEDBACK)
	{
		dragdist = ((rx > 0 ? rx : -rx) + (ry > 0 ? ry : -ry)) >> 5;
		dragloop = 0;
		while (dragdist != 0)
		{
			dragdist = ((dragdist >> 1) + dragdist) >> 2;
			dragloop++;
		}
		if (dragloop != 0 && ACSblk->Aselect.actlen > 8)
			dragloop--;
		if (dragloop != 0 && ACSblk->Aselect.actlen > 20)
			dragloop--;
		for (wfowner = 0; wfowner++ < 2; )
		{
			mox = moy = 0;
			for (feedback = 1 << dragloop; feedback > 0; feedback--)
			{
				mox += rx;
				moy += ry;
				drag_draw(rx - (mox >> dragloop), ry - (moy >> dragloop));
			}
		}
	}
}
