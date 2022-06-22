/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Menu functions                                        */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acsport.h"
#include "acs_i.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void call_click(Awindow *win, OBJECT *tree, int16 obnr)
{
	AOBJECT *aobj;
	OBJECT *obj;
	
	obj = &tree[obnr];
	if ((obj->ob_flags & OF_LASTOB) || (obj->ob_state & OS_DISABLED))
		return;
	aobj = (AOBJECT *)obj + 1;
	if ((aobj->ob_flags & AEO) && aobj->click)
	{
		ACSblk->ev_window = win;
		ACSblk->ev_object = tree;
		ACSblk->ev_obnr = obnr;
		aobj->click();
	}
}

/* -------------------------------------------------------------------------- */

static int16 Ame_titmenu(OBJECT *menu, int16 obnr)
{
	int16 title;
	int16 box;
	
	title = menu[menu[menu[ROOT].ob_head].ob_head].ob_head;
	box = menu[menu[ROOT].ob_tail].ob_head;
	while (obnr != title)
	{
		title = menu[title].ob_next;
		box = menu[box].ob_next;
	}
	return box;
}

/* -------------------------------------------------------------------------- */

static void Ame_tnormal(Awindow *win, OBJECT *menu, int16 title, boolean select)
{
	Axywh rect;
	
	if (win->menu != menu)
		return;
	Aob_offset(&rect, menu, title);
	menu += title;
	if (select)
		menu->ob_state |= OS_SELECTED;
	else
		menu->ob_state &= ~OS_SELECTED;
	win->redraw(win, &rect);
}

/* -------------------------------------------------------------------------- */

static void Ame_menu(Awindow *win, OBJECT *menu, int16 title)
{
	MFDB *bp;
	Axywh submenurect;
	Axywh rect = { 0, 0, 0, 0 };
	int16 selected;
	int16 prev_selected;
	int16 box;
	int16 is_selected;
	int16 events;
	int16 mox;
	int16 moy;
	int16 button;
	int16 x;
	int16 y;
	int16 tmp;
	int16 dummy;
	
	box = Ame_titmenu(menu, title);
	Ame_tnormal(win, menu, title, TRUE);
	graf_mkstate(&mox, &moy, &button, &dummy);
	button = (button ^ 1) & 1;
	win->service(win, AS_REALMENU_START, &title);
	while (TRUE)
	{
		prev_selected = NIL;
		is_selected = FALSE;
		x  = menu[box].ob_x;
		y  = menu[box].ob_y;
		Aob_offset(&submenurect, menu, box);
		if (submenurect.x < 0)
		{
			menu[box].ob_x -= submenurect.x;
			submenurect.x = 0;
		}
		if (submenurect.y < 0)
		{
			menu[box].ob_y -= submenurect.y;
			submenurect.y = 0;
		}
		tmp = submenurect.x + submenurect.w - ACSblk->desk.x - ACSblk->desk.w;
		if (tmp > 0)
		{
			menu[box].ob_x -= tmp;
			submenurect.x -= tmp;
		}
		tmp = submenurect.y + submenurect.h - ACSblk->desk.y - ACSblk->desk.h;
		if (tmp > 0)
		{
			menu[box].ob_y -= tmp;
			submenurect.y -= tmp;
		}
		bp = Aob_save(&submenurect);
		objc_draw(menu, box, 6, submenurect.x, submenurect.y, submenurect.w, submenurect.h);
		while (TRUE)
		{
			Awi_update(BEG_MCTRL);
			events = evnt_multi(MU_BUTTON | MU_M1,
				1, 1, button,
				1, mox, moy, 1, 1,
				0, 0, 0, 0, 0,
				NULL,
				0, 0,
				&mox, &moy, &dummy, &dummy, &dummy, &dummy);
			Awi_update(END_MCTRL);
			selected = Adr_find(menu, box, 1, mox, moy);
			if (selected == box)
				selected = NIL;
			if (selected != prev_selected)
			{
				graf_mouse(M_OFF, NULL);
				if (is_selected)
				{
					menu[prev_selected].ob_state |= OS_SELECTED;
					objc_change(menu, prev_selected, 0,
						rect.x, rect.y, rect.w, rect.h,
						menu[prev_selected].ob_state & ~OS_SELECTED, TRUE);
				}
				if (selected >= 0 && !(menu[selected].ob_state & OS_DISABLED))
				{
					Aob_offset(&rect, menu, selected);
					objc_change(menu, selected, 0,
						rect.x, rect.y, rect.w, rect.h,
						menu[selected].ob_state | OS_SELECTED, TRUE);
					menu[selected].ob_state &= ~OS_SELECTED;
					is_selected = TRUE;
					win->service(win, AS_REALMENU_UPDATE, &selected);
				} else
				{
					is_selected = FALSE;
				}
				graf_mouse(M_ON, NULL);
				prev_selected = selected;
			}

			if (selected < 0)
			{
				selected = Adr_find(menu, menu[ROOT].ob_head, MAX_DEPTH, mox, moy);
				if (selected >= 0)
				{
					graf_mkstate(&mox, &moy, &button, &dummy);
					button = (button ^ 1) & 1;
					if (selected != title && (char)menu[selected].ob_type == G_TITLE)
					{
						Aob_restore(bp, &submenurect);
						menu[box].ob_x = x;
						menu[box].ob_y = y;
						Ame_tnormal(win, menu, title, FALSE);
						title = selected;
						box = Ame_titmenu(menu, title);
						Ame_tnormal(win, menu, title, TRUE);
						win->service(win, AS_REALMENU_UPDATE, &title);
						break;
					}
				}
			}

			if (selected != title && (events & MU_BUTTON))
			{
				Aob_restore(bp, &submenurect);
				menu[box].ob_x = x;
				menu[box].ob_y = y;
				Aev_release();
				if (selected > 0 &&
					selected != menu[ROOT].ob_head &&
					selected != menu[ROOT].ob_tail &&
					selected != menu[menu[ROOT].ob_head].ob_head)
				{
					Amo_busy();
					call_click(win, menu, selected);
					Amo_unbusy();
				}
				Ame_tnormal(win, menu, title, FALSE);
				win->service(win, AS_REALMENU_END, NULL);
				return;
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static int16 Ame_submenu(OBJECT *menu, int16 entry)
{
	MFDB *bp;
	Axywh subrect;
	Axywh rect = { 0, 0, 0, 0 };
	Axywh erect;
	int16 selected;
	int16 prev_selected;
	int16 submenu;
	int16 retval;
	int16 parent;
	int16 check;
	boolean is_selected;
	int16 events;
	int16 mox;
	int16 moy;
	int16 key;
	int16 button;
	int16 bstate;
	int16 minx;
	int16 miny;
	int16 x;
	int16 y;
	boolean cont;
	int16 tmp;
	int16 dummy;
	int16 w;
	
	cont = TRUE;
	prev_selected = NIL;
	is_selected = FALSE;
	selected = menu[entry].ob_head;
	if (selected >= 0)
	{
		while (selected != entry && !(menu[selected].ob_state & OS_CHECKED))
			selected = menu[selected].ob_next;
		if (selected != entry)
		{
			menu[entry].ob_x -= menu[selected].ob_x;
			menu[entry].ob_y -= menu[selected].ob_y;
		}
	}
	
	Aob_offset(&subrect, menu, entry);
	if (subrect.x < ACSblk->desk.x)
	{
		menu[entry].ob_x = ACSblk->desk.x;
		subrect.x = ACSblk->desk.x;
	}
	if (subrect.y < ACSblk->desk.y)
	{
		menu[entry].ob_y = ACSblk->desk.y;
		subrect.y = ACSblk->desk.y;
	}
	tmp = subrect.x + subrect.w - ACSblk->desk.x - ACSblk->desk.w;
	if (tmp > 0)
	{
		menu[entry].ob_x -= tmp;
		subrect.x -= tmp;
	}
	tmp = subrect.y + subrect.h - ACSblk->desk.y - ACSblk->desk.h;
	if (tmp > 0)
	{
		menu[entry].ob_y -= tmp;
		subrect.y -= tmp;
	}
	bp = Aob_save(&subrect);
	Amo_hide();
	objc_draw(menu, entry, 6, subrect.x, subrect.y, subrect.w, subrect.h);
	Amo_show();
	graf_mkstate(&mox, &moy, &button, &dummy);
	mox++;
	if (button & 1)
		bstate = 1;
	else
		bstate = 0;
	
	while (cont)
	{
		Awi_update(BEG_MCTRL);
		events = evnt_multi(MU_KEYBD | MU_BUTTON | MU_M1,
			ACSblk->ev_mbclicks, 1, bstate,
			1, mox, moy, 1, 1,
			0, 0, 0, 0, 0,
			NULL,
			0, 0,
			&mox, &moy, &dummy, &button, &key, &dummy); /* hmpf, FIMXE: wrong usage of button here */
		Awi_update(END_MCTRL);
		
		if (events & MU_KEYBD)
		{
			key = nkc_gemks2n(key, button);
			selected = -2;
			if (key & NKF_FUNC)
			{
				switch ((char) key)
				{
				case NK_ESC:
					selected = NIL;
					retval = NIL;
					cont = FALSE;
					break;
				
				case NK_ENTER:
				case NK_RET:
					if (prev_selected >= 0)
					{
						if (is_selected && menu[prev_selected].ob_head > 0)
						{
							submenu = menu[prev_selected].ob_head;
							if (submenu >= 0 && submenu == menu[prev_selected].ob_tail &&
								prev_selected == Adr_find(menu, entry, 1, rect.x + rect.w - 2, rect.y + 1))
							{
								menu[submenu].ob_flags &= ~OF_HIDETREE;
								menu[submenu].ob_x = menu[prev_selected].ob_width >> 1;
								menu[submenu].ob_y = 0;
								retval = Ame_submenu(menu, submenu);
								menu[submenu].ob_flags |= OF_HIDETREE;
								if (retval < 0 || (entry != retval && entry != Aob_up(menu, retval)))
								{
									cont = FALSE;
									selected = -2;
								} else
								{
									ACSblk->ev_window->service(ACSblk->ev_window, AS_REALPOP_UPDATE, &retval);
								}
							}
						} else
						{
							retval = prev_selected;
							cont = FALSE;
							selected = -2;
						}
					}
					break;
				
				case NK_UNDO:
					if (entry != ROOT && menu[entry].ob_next > 0)
					{
						retval = parent = menu[entry].ob_next;
						Aob_offset(&rect, menu, parent);
						mox = rect.x + 1;
						moy = rect.y + 1;
					} else
					{
						retval = NIL;
					}
					cont = FALSE;
					break;
				
				case NK_UP:
				case NK_DOWN:
				case NK_LEFT:
				case NK_RIGHT:
					if (prev_selected < 0)
					{
#ifdef __GNUC__
						minx = miny = 0; /* silence compiler */
#endif
						if ((char) key == NK_RIGHT || (char) key == NK_DOWN)
							minx = miny = 32767;
						if ((char) key == NK_LEFT || (char) key == NK_UP)
							minx = miny = 0;
						dummy = entry;
						while (menu[dummy].ob_head >= 0 && !(menu[menu[dummy].ob_head].ob_flags & OF_HIDETREE))
							dummy = menu[dummy].ob_head;
						parent = Aob_up(menu, dummy);
						selected = -2;
						while (dummy != parent)
						{
							switch ((char) key)
							{
							case NK_RIGHT:
							case NK_DOWN:
								if (!(menu[dummy].ob_state & OS_DISABLED) &&
									(menu[dummy].ob_flags & (OF_SELECTABLE | OF_TOUCHEXIT)) &&
									menu[dummy].ob_y < miny &&
									menu[dummy].ob_x < minx)
								{
									miny = menu[dummy].ob_y;
									minx = menu[dummy].ob_x;
									selected = dummy;
								}
								break;

							case NK_LEFT:
							case NK_UP:
								if (!(menu[dummy].ob_state & OS_DISABLED) &&
									(menu[dummy].ob_flags & (OF_SELECTABLE | OF_TOUCHEXIT)) &&
									menu[dummy].ob_y >= miny &&
									menu[dummy].ob_x >= minx)
								{
									miny = menu[dummy].ob_y;
									minx = menu[dummy].ob_x;
									selected = dummy;
								}
								break;
							}
							dummy = menu[dummy].ob_next;
						}
					} else
					{
						minx = miny = 32767;
						parent = Aob_up(menu, prev_selected);
						if (menu[prev_selected].ob_next == parent)
							dummy = menu[parent].ob_head;
						else
							dummy = menu[prev_selected].ob_next;
						selected = -2;
						while (dummy != prev_selected)
						{
							x = menu[dummy].ob_x - menu[prev_selected].ob_x;
							if (x < 0)
								x = -x;
							y = menu[dummy].ob_y - menu[prev_selected].ob_y;
							if (y < 0)
								y = -y;
							if (!(menu[dummy].ob_state & OS_DISABLED) &&
								(menu[dummy].ob_flags & (OF_SELECTABLE | OF_TOUCHEXIT)))
							{
								switch ((char) key)
								{
								case NK_RIGHT:
									if (menu[dummy].ob_x > menu[prev_selected].ob_x &&
										((miny == 0 && y == 0 && x < minx) ||
										 (y == 0 && miny != 0) ||
										 (miny != 0 && x < minx && y <= miny) ||
										 (miny != 0 && x <= minx && y < miny)))
									{
										miny = y;
										minx = x;
										selected = dummy;
									}
									break;
								
								case NK_DOWN:
									if (menu[dummy].ob_y > menu[prev_selected].ob_y &&
										((minx == 0 && y == 0 && y < miny) ||
										 (minx != 0 && x == 0) ||
										 (minx != 0 && y < miny && x <= minx) ||
										 (minx != 0 && y <= miny && x < minx)))
									{
										miny = y;
										minx = x;
										selected = dummy;
									}
									break;
								
								case NK_LEFT:
									if (menu[dummy].ob_x < menu[prev_selected].ob_x &&
										((miny == 0 && y == 0 && x < minx) ||
										 (miny != 0 && y == 0) ||
										 (miny != 0 && x < minx && y <= miny) ||
										 (miny != 0 && x <= minx && y < miny)))
									{
										miny = y;
										minx = x;
										selected = dummy;
									}
									break;

								case NK_UP:
									if (menu[dummy].ob_y < menu[prev_selected].ob_y &&
										((minx == 0 && x == 0 && y < miny) ||
										 (minx != 0 && x == 0) ||
										 (minx != 0 && y < miny && x <= minx) ||
										 (minx != 0 && y <= miny && x < minx)))
									{
										miny = y;
										minx = x;
										selected = dummy;
									}
									break;
								}
							}
							if (menu[dummy].ob_next == parent)
								dummy = menu[parent].ob_head;
							else
								dummy = menu[dummy].ob_next;
						}
					}
					break;
				
				default:
					retval = Aob_key(menu, button, key);
					if (retval > 0)
					{
						cont = FALSE;
					}
					/* break; */
				}
			}
		}
		
		if (events & MU_M1)
		{
			selected = Adr_find(menu, entry, MAX_DEPTH, mox, moy);
		}
		
		if (selected != prev_selected && selected != -2)
		{
			if (is_selected)
			{
				menu[prev_selected].ob_state |= OS_SELECTED;
				Amo_hide();
				objc_change(menu, prev_selected, 0, rect.x, rect.y, rect.w, rect.h, menu[prev_selected].ob_state & ~OS_SELECTED, TRUE);
				Amo_show();
			}
			if (selected >= 0 &&
				selected != entry &&
				!(menu[selected].ob_state & OS_DISABLED) &&
				(menu[selected].ob_flags & (OF_TOUCHEXIT | OF_SELECTABLE)))
			{
				Aob_offset(&rect, menu, selected);
				Amo_hide();
				objc_change(menu, selected, 0, rect.x, rect.y, rect.w, rect.h, menu[selected].ob_state | OS_SELECTED, TRUE);
				Amo_show();
				menu[selected].ob_state &= ~OS_SELECTED;
				is_selected = TRUE;
			} else
			{
				selected = NIL;
				is_selected = FALSE;
			}
			prev_selected = selected;
			ACSblk->ev_window->service(ACSblk->ev_window, AS_REALPOP_UPDATE, &prev_selected);
		}
		
		if (is_selected && menu[selected].ob_head > 0)
		{
			w = menu[selected].ob_width >> 1;
			submenu = menu[selected].ob_head;
			if (submenu >= 0 && submenu == menu[selected].ob_tail &&
				selected == Adr_find(menu, entry, 1, mox - w, moy))
			{
				menu[submenu].ob_flags &= ~OF_HIDETREE;
				menu[submenu].ob_x = w;
				menu[submenu].ob_y = 0;
				retval = Ame_submenu(menu, submenu);
				menu[submenu].ob_flags |= OF_HIDETREE;
				if (retval < 0 ||
					(entry != retval && entry != Aob_up(menu, retval)))
				{
					cont = FALSE;
				} else
				{
					ACSblk->ev_window->service(ACSblk->ev_window, AS_REALPOP_UPDATE, &retval);
				}
			}
		}

		Aob_offset(&erect, menu, entry);
		if (selected == NIL && !Aob_within(&erect, mox, moy))
		{
			parent = menu[entry].ob_next;
			while (parent >= 0)
			{
				check = Aob_up(menu, parent);
				retval = Adr_find(menu, check, 1, mox, moy);
				if (retval >= 0)
					break;
				parent = menu[check].ob_next;
			}
			if (parent > 0 && retval >= 0)
				cont = FALSE;
		}
		
		if (events & MU_BUTTON)
		{
			retval = selected;
			cont = FALSE;
		}
	}
	Aob_restore(bp, &subrect);
	return retval;
}

/* -------------------------------------------------------------------------- */

int16 Ame_popup(Awindow *window, OBJECT *popup, int16 x, int16 y)
{
	int16 selected;
	int16 dummy;
	CONTEXT ctx;
	
	Act_save(&ctx);
	Aob_fix(popup);
	if (x < 0 && y < 0)
	{
		graf_mkstate(&x, &y, &dummy, &dummy);
		x -= ACSblk->gl_wbox >> 1;
		y -= ACSblk->gl_hbox >> 1;
	}
	popup->ob_x = x;
	popup->ob_y = y;
	ACSblk->ev_window->service(ACSblk->ev_window, AS_REALPOP_START, &ACSblk->ev_obnr);
	selected = Ame_submenu(popup, ROOT);
	ACSblk->ev_window->service(ACSblk->ev_window, AS_REALPOP_END, NULL);
	Aev_release();
	if (selected > 0)
	{
		Amo_busy();
		call_click(window, popup, selected);
		Amo_unbusy();
	}
	if (selected == 0)
		selected = NIL;
	Act_restore(&ctx);
	return selected;
}

/* -------------------------------------------------------------------------- */

void Ame_root(int16 title, int16 idx)
{
	Awindow *win;
	OBJECT *menu;
	
	win = Awi_root();
	menu = win->menu;
	Amo_busy();
	if (title == 3)
	{
		ACSblk->ACSaboutme();
	} else
	{
		call_click(win, menu, idx);
	}
	Amo_unbusy();
	menu_tnormal(menu, title, TRUE);
}

/* -------------------------------------------------------------------------- */

void Ame_drop(Awindow *win, int16 mx, int16 my)
{
	Axywh rect;
	int16 title;
	int16 thebar;
	OBJECT *menu;
	
	if ((menu = win->menu) == NULL)
		return;
	rect.x = menu->ob_x;
	rect.y = menu->ob_y;
	rect.w = min(menu->ob_width, win->wi_work.w);
	rect.h = menu->ob_height;
	if (!Aob_within(&rect, mx, my))
		return;
	thebar = menu[menu[ROOT].ob_head].ob_head;
	title = Adr_find(menu, thebar, 1, mx, my);
	if (title <= thebar)
		return;
	Ame_menu(win, menu, title);
}

/* -------------------------------------------------------------------------- */

int16 Ame_key(Awindow *win, int16 kstate, int16 key)
{
	int16 entry;
	int16 thebar;
	int16 title;
	int16 box;
	int16 parent;
	int16 last;
	OBJECT *menu;

	if ((menu = win->menu) == NULL)
		return NIL;
	entry = Aob_key(menu, kstate, key);
	if (entry < 0)
		return NIL;
	thebar = menu[menu[ROOT].ob_head].ob_head;
	title = menu[thebar].ob_head;
	box = menu[menu[ROOT].ob_tail].ob_head;
	last = entry;
	do
	{
		parent = last;
		last = Aob_up(menu, parent);
		if (last < 0)
			return NIL;
	} while (last != menu[ROOT].ob_tail);
	while (box != parent)
	{
		title = menu[title].ob_next;
		box = menu[box].ob_next;
		if (title == thebar)
			return NIL;
	}
	Amo_busy();
	if (win->wi_id == 0)
	{
		menu_tnormal(menu, title, FALSE);
		call_click(win, menu, entry);
		menu_tnormal(menu, title, TRUE);
	} else
	{
		Ame_tnormal(win, menu, title, TRUE);
		call_click(win, menu, entry);
		Ame_tnormal(win, menu, title, FALSE);
	}
	Amo_unbusy();
	return entry;
}

/* -------------------------------------------------------------------------- */

void Ame_namefix(OBJECT *menu)
{
	int16 title;
	int16 thebar;
	int16 box;
	int16 w;
	int16 titlex;
	int16 boxx;
	int len;
	int16 x;
	char *str;
	char *ptr;
	
	x = 0;
	thebar = menu[ROOT].ob_head;
	menu[thebar].ob_width = ACSblk->desk.w;
	thebar = menu[thebar].ob_head;
	title = menu[thebar].ob_head;
	box = menu[ROOT].ob_tail;
	box = menu[box].ob_head;
	titlex = menu[title].ob_x;
	boxx = menu[box].ob_x;
	while (TRUE)
	{
		len = (int)strlen(str = menu[title].ob_spec.free_string);
		ptr = &str[len - 1];
		while (len > 0 && *ptr == ' ')
		{
			len--;
			ptr--;
		}
		while (len > 0 && *str == ' ')
		{
			len--;
			str++;
		}
		w = menu[title].ob_width = (len + 2) * ACSblk->gl_wbox;
		x += w;
		menu[title].ob_x = titlex;
		menu[box].ob_x = boxx;
		titlex += w;
		boxx += w;
		title = menu[title].ob_next;
		if (title == thebar)
			break;
		box = menu[box].ob_next;
	}
	menu[thebar].ob_width = x;
}
