/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Event handling                                        */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "messages/vaproto.h"
#include "messages/msgserv.h"

static boolean exitapp = FALSE;
static boolean hidepointer = FALSE;
static char const DeadKeys[] = "^~'`\271\"\370,/";
static struct {
	const char *ascii;
	const char *translated;
} const CombKeys[] = {
	{ " aeiou",  "^\203\210\214\223\226" },
	{ " nNaoAo", "~\244\245\260\261\267\270" },
	{ " eEaiou", "'\202\220\240\241\242\243" },
	{ " aeiouA", "`\205\212\215\225\227\266" },
	{ " aeiouyAOU", "\271\204\211\213\224\201\230\216\231\232" },
	{ " aeiouyAOU", "\"\204\211\213\224\201\230\216\231\232" },
	{ " aA", "\370\206\217" },
	{ " cC", ",\207\200" },
	{ " oO24", "/\263\262\253\254" }
};
static boolean dead_handling = FALSE;
static int16 dead_key = 0;

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void Aev_unhidepointer(void)
{
	if (hidepointer)
	{
		hidepointer = FALSE;
		Amo_show();
	}
}

/* -------------------------------------------------------------------------- */

void Aev_quit(void)
{
	ACSblk->appexit = exitapp = TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean IsDeadKey(Awindow *win, int16 key, int16 *ascii)
{
	boolean found;
	const char *ptr;
	
	found = FALSE;
	*ascii = key;
	if (dead_handling)
		return FALSE;
	dead_handling = TRUE;
	if (dead_key != 0)
	{
		ptr = strchr(DeadKeys, (char)(dead_key & 0xff));
		if (ptr != NULL)
		{
			int16 index;
			int16 trans_index;
			
			index = (int16)(ptr - DeadKeys);
			ptr = strchr(CombKeys[index].ascii, (char)(key & 0xff));
			if (!(key & NKF_FUNC) && ptr != NULL && strchr(ACSblk->ev_mkdead, (char)(dead_key & 0xff)) != NULL)
			{
				trans_index = (int16)(ptr - CombKeys[index].ascii);
				*ascii = CombKeys[index].translated[trans_index];
			} else
			{
				ACSblk->ev_mkreturn = dead_key;
				evkeybrd(win);
				*ascii = key;
			}
		}
		dead_key = 0;
	} else
	{
		if (!(key & NKF_FUNC))
		{
			ptr = strchr(DeadKeys, (char)(key & 0xff));
			if (ptr != NULL && strchr(ACSblk->ev_mkdead, (char)(key & 0xff)) != NULL)
			{
				dead_key = key;
				*ascii = 0;
				found = TRUE;
			}
		}
	}
	dead_handling = FALSE;
	return found;
}

/* -------------------------------------------------------------------------- */

int16 evkeybrd(Awindow *win)
{
	Awindow *root;
	int16 top;
	int16 msgbuf[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	int16 key = -1;
	A_dd *dd = NULL;
	static boolean quote = FALSE;
	
	if (IsDeadKey(win, ACSblk->ev_mkreturn, &ACSblk->ev_mkreturn))
		return 0;
	root = Awi_root();
	if (win == NULL)
	{
		wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
		win = Awi_wid(top);
		if (win == NULL && !_ACSv_wmenu)
		{
			if (root->wi_id < 0)
				root->open(root);
			return FAIL;
		}
	}
	ACSblk->ACSkey(&ACSblk->ev_mmokstate, &ACSblk->ev_mkreturn);
	if (ACSblk->ev_mkreturn == 0)
		return key;
	if ((ACSblk->ev_mkreturn & (NKF_ALT|NKF_CTRL)) == (NKF_ALT|NKF_CTRL))
	{
		switch ((char)ACSblk->ev_mkreturn)
		{
		case 'Q':
			if (!quote)
			{
				quote = TRUE;
				return key;
			}
			break;
		}
	}
	
	if (!hidepointer && (ACSblk->description->flags & AB_HIDEPOINTER))
	{
		hidepointer = TRUE;
		Amo_hide();
	}
	
	if (!quote)
	{
		if (win != NULL)
		{
			if (Awi_modal() == NULL && (key = Ame_key(win, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn)) >= 0)
				goto retkey;
			if (ACSblk->description->flags & AB_MENUFIRST)
			{
				if (Awi_modal() == NULL && (key = Ame_key(root, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn)) >= 0)
					goto retkey;
				if ((key = Aob_tobkey(win, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn)) >= 0)
					goto retkey;
				if ((key = Aob_wobkey(win, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn)) >= 0)
					goto retkey;
			} else
			{
				if ((key = Aob_tobkey(win, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn)) >= 0)
					goto retkey;
				if ((key = Aob_wobkey(win, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn)) >= 0)
					goto retkey;
				if (Awi_modal() == NULL && (key = Ame_key(root, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn)) >= 0)
					goto retkey;
			}
		}

		if (Awi_modal() == NULL && root != NULL)
		{
			if ((key = Ame_key(root, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn)) < 0)
			{
				if ((key = Aob_tobkey(root, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn)) >= 0)
					goto retkey;
				if ((key = Aob_wobkey(root, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn)) >= 0)
					goto retkey;
			}
		}
	}

	ACSblk->ACSwikey(&ACSblk->ev_mmokstate, &ACSblk->ev_mkreturn);
	if (ACSblk->ev_mkreturn == 0)
		goto retkey;
	if (win != NULL)
		key = win->keys(win, ACSblk->ev_mmokstate, ACSblk->ev_mkreturn);
	if (key < -1)
	{
		while ((dd = Ash_nextdd(dd)) != NULL)
		{
			if ((dd->type & DD_VA) && (dd->va_val[0] & VA_PROT_SENDKEY))
			{
				msgbuf[0] = AV_SENDKEY;
				msgbuf[1] = ACSblk->gl_apid;
				msgbuf[3] = ACSblk->ev_mmokstate;
				msgbuf[4] = nkc_n2gem(ACSblk->ev_mkreturn);
				appl_write(dd->id, (int)sizeof(msgbuf), msgbuf);
				(void)_globl; /* FIXME: useless cast to get registers right */
				break;
			}
		}
	}
	quote = FALSE;

retkey:
	return key;
}

/* -------------------------------------------------------------------------- */

static int16 ev_dobutton(Awindow *win, OBJECT *tree, int16 x, int16 y, int16 clicks, int16 button, int16 toolbarflag)
{
	boolean checkdrag;
	int16 loops;
	boolean shifted;
	int16 obnr;
	int16 parent;
	int16 selected = NIL;
	int16 dummy;
	int16 newbutton;
	OBJECT *obj;
	
	obnr = Adr_find(tree, ROOT, MAX_DEPTH, x, y);
	if (obnr < 0)
		return NIL;
	checkdrag = FALSE;
	shifted = FALSE;
	for (parent = obnr; parent >= 0 && !(tree[parent].ob_flags & (AO_DRAGABLE | OF_SELECTABLE | OF_TOUCHEXIT | OF_EDITABLE)); )
		parent = Aob_up(tree, parent);
	if (parent >= 0)
		obnr = parent;
	obj = &tree[obnr];
	if (clicks < 2)
	{
		if (!(obj->ob_flags & (AO_DRAGABLE | OF_SELECTABLE | OF_TOUCHEXIT | OF_EDITABLE)))
		{
			Adr_box(ACSblk->ev_mmox, ACSblk->ev_mmoy);
			return NIL;
		} else if ((obj->ob_flags & (AO_DRAGABLE | OF_SELECTABLE | OF_TOUCHEXIT | OF_EDITABLE | OF_RBUTTON | OF_EXIT)) == OF_SELECTABLE)
		{
			checkdrag = TRUE;
		} else
		{
			if (obj->ob_flags & AO_DRAGABLE)
			{
				if (obj->ob_state & OS_SELECTED)
				{
					if (ACSblk->ev_mmokstate & K_SHIFT)
					{
						checkdrag = TRUE;
					} else
					{
						Adr_drag(ACSblk->ev_mmox, ACSblk->ev_mmoy);
						return NIL;
					}	
				} else
				{
					if (ACSblk->ev_mmokstate & K_SHIFT)
					{
						checkdrag = TRUE;
						shifted = TRUE;
					} else
					{
						Adr_unselect();
					}
				}
			} else
			{
				if (obj->ob_flags & OF_EXIT)
				{
					if (Aob_watch(win, toolbarflag | obnr) == FALSE)
						return NIL;
				}
			}
		}
	}

	if (Aob_select(win, tree, obnr, clicks >= 2))
	{
		selected = toolbarflag | obnr;
	}
	if (checkdrag)
	{
		loops = 2;
		do
		{
			loops--;
			evnt_timer(10, 0);
			graf_mkstate(&dummy, &dummy, &newbutton, &dummy);
		} while (!((newbutton ^ button) & 1) && (loops > 0 || !shifted));
		if (shifted && loops <= 0)
		{
			Adr_drag(ACSblk->ev_mmox, ACSblk->ev_mmoy);
		}
	}
	return selected;
}

/* -------------------------------------------------------------------------- */

static boolean evmwheel(int16 wheels[16], int16 mx, int16 my)
{
	int16 wh;
	Awindow *win;
	
	wh = wind_find(mx, my);
	win = wh >= 0 ? Awi_wid(wh) : Awi_ontop();
	if (win != NULL)
		return Awi_wheeled(win, wheels, mx, my);
	else
		return FALSE;
}

/* -------------------------------------------------------------------------- */

int16 evbutton(int16 button, int16 clicks)
{
	int16 wh;
	int16 x;
	int16 y;
	int16 done;
	int16 events;
	int16 dummy;
	int16 newbutton;
	Awindow *win;
	Awindow *modal;
	OBJECT *tree;
	
	done = ROOT;
	Aev_unhidepointer();
	ACSblk->ACSbutton(&button, &clicks);
	wh = wind_find(ACSblk->ev_mmox, ACSblk->ev_mmoy);
	win = Awi_wid(wh);
	if (win == NULL)
		return NIL;
	modal = Awi_modal();
	if (modal != NULL && modal != win)
	{
		Awi_up_modal();
		return NIL;
	}
	y = ACSblk->ev_mmoy - win->wi_work.y;
	x = ACSblk->ev_mmox - win->wi_work.x;
	if (button & 2)
	{
		graf_mkstate(&dummy, &dummy, &newbutton, &dummy);
		if (newbutton & 2)
		{
			events = evnt_multi(MU_TIMER | MU_BUTTON,
				0, 2, 0,
				0, 0, 0, 0, 0,
				0, 0, 0, 0, 0,
				NULL,
				250, 0,
				&dummy, &dummy, &newbutton, &dummy, &dummy, &dummy);
		} else
		{
			events = MU_BUTTON;
		}
		if (events & MU_BUTTON)
			done = Awi_bubblegem(win, ACSblk->ev_mmox, ACSblk->ev_mmoy);
		else if (events & MU_TIMER)
			done = Awi_context(win, ACSblk->ev_mmox, ACSblk->ev_mmoy);
		if (!done)
		{
			if (events & MU_BUTTON)
				done = Awi_context(win, ACSblk->ev_mmox, ACSblk->ev_mmoy);
			else if (events & MU_TIMER)
				done = Awi_bubblegem(win, ACSblk->ev_mmox, ACSblk->ev_mmoy);
		}
	} else
	{
		if (y < 0)
		{
			tree = win->toolbar;
			if (tree != NULL && y >= tree->ob_y)
				return ev_dobutton(win, tree, x, y, clicks, button, A_TOOLBAR);
			if ((ACSblk->description->flags & AB_CLICKMENU) && wh != 0)
				Ame_drop(win, ACSblk->ev_mmox, ACSblk->ev_mmoy);
			done = NIL;
		} else
		{
			if (Aob_within(&win->wi_work, ACSblk->ev_mmox, ACSblk->ev_mmoy) && win->work != NULL)
				done = ev_dobutton(win, win->work, x, y, clicks, button, 0);
		}
	}
	return done;
}

/* -------------------------------------------------------------------------- */

void evmouse(void)
{
	int16 top;
	int16 obnr;
	int16 x;
	int16 y;
	int16 moindex;
	int16 aobj_moindex;
	Awindow *win;
	Awindow *modal;
	OBJECT *tree;
	
	ACSblk->ACSmouse();
	wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
	win = Awi_wid(top);
	if (win == NULL)
		return;
	modal = Awi_modal();
	if (modal != NULL && modal != win)
	{
		Awi_up_modal();
		return;
	}
	if (Awi_shadow(win))
	{
		Amo_new(&ACSblk->description->mouse[MOUSE_ARROW]);
		return;
	}
	if (Aob_within(&win->wi_work, ACSblk->ev_mmox, ACSblk->ev_mmoy))
	{
		tree = win->work;
		if (tree != NULL)
		{
			x = ACSblk->ev_mmox - win->wi_work.x;
			y = ACSblk->ev_mmoy - win->wi_work.y;
			moindex = MOUSE_ARROW;
			obnr = Adr_find(tree, ROOT, MAX_DEPTH, x, y);
			while (obnr >= 0 && moindex <= 0)
			{
				if ((tree[obnr].ob_flags & OF_EDITABLE) && !(tree[obnr].ob_flags & OF_HIDETREE))
					moindex = MOUSE_TEXT_CRSR;
				if (!(tree[obnr].ob_flags & OF_LASTOB) && (tree[obnr + 1].ob_flags & AEO))
				{
					aobj_moindex = ((AOBJECT *)(&tree[obnr + 1]))->mo_index & (32 - 1);
					if (aobj_moindex > 0)
						moindex = aobj_moindex;
				}
				obnr = Aob_up(tree, obnr);
			}
			Amo_new(&ACSblk->description->mouse[moindex]);
		}
		win->service(win, AS_MOUSE, NULL);
	} else
	{
		Aev_unhidepointer();
		Amo_point();
		if (!(ACSblk->description->flags & AB_CLICKMENU) && win->menu != NULL)
			Ame_drop(win, ACSblk->ev_mmox, ACSblk->ev_mmoy);
	}
}

/* -------------------------------------------------------------------------- */

void Aev_mess(void)
{
	int16 dummy;
	int16 loops;
	int16 msg[8];
	
	if (Awi_root() == NULL)
		return;
	if (ACSblk->apterm)
		return;
	loops = 4;
	Awi_update(RESET_UPDATE);
	while (loops > 0)
	{
		if (evnt_multi(MU_MESAG | MU_TIMER,
			0, 0, 0,
			0, 0, 0, 0, 0,
			0, 0, 0, 0, 0,
			msg,
			20, 0,
			&dummy, &dummy, &dummy, &dummy, &dummy, &dummy) & MU_MESAG)
		{
			Awi_update(RESTART_UPDATE);
			if (Aev_message(msg))
				loops = 4;
			else
				--loops;
			Awi_update(RESET_UPDATE);
		} else
		{
			--loops;
		}
	}
	Awi_update(RESTART_UPDATE);
}

/* -------------------------------------------------------------------------- */

void ACSeventhandler(void)
{
	Awindow *root;
	AOBJECT *menu;
	int16 msgbuf[8];
	int16 wheels[16];
	int16 bmask;
	int16 events;
	boolean wheel;
	
	root = Awi_root();
	if (appl_getinfo(AES_MOUSE, &wheels[0], &wheels[1], &wheels[2], &wheels[3]))
		wheel = wheels[2] != 0;
	else
		wheel = FALSE;
	memset(wheels, 0, sizeof(wheels));
	ACSblk->ev_mmox = ACSblk->ev_mmoy = 0;
	menu = (AOBJECT *)root->menu;
	if (menu != NULL)
	{
		while (!(menu->ob_flags & OF_LASTOB))
		{
			if (menu->ob_flags & AEO)
				menu->type = menu->key;
			menu++;
		}
	}
	
	do
	{
		ACSblk->appexit = exitapp = FALSE;
		menu = (AOBJECT *)root->menu;
		if (menu != NULL)
		{
			while (!(menu->ob_flags & OF_LASTOB))
			{
				if (menu->ob_flags & AEO)
					menu->key = menu->type;
				menu++;
			}
		}
		
		bmask = wheel ? ACSblk->ev_bmask | 0x80 : ACSblk->ev_bmask;
#ifdef __GNUC__
		/* gemlib does not have evnt_xmulti() */
		events = evnt_multi(MU_MESAG | MU_TIMER | MU_BUTTON | MU_KEYBD | MU_M1,
			ACSblk->ev_mbclicks, bmask, ACSblk->ev_bstate,
			1, ACSblk->ev_mmox, ACSblk->ev_mmoy, 1, 1,
			0, 0, 0, 0, 0,
			msgbuf,
			(uint16)ACSblk->ev_mtcount, ((uint32)(uint16)(ACSblk->ev_mtcount >> 16)),
			&ACSblk->ev_mmox, &ACSblk->ev_mmoy, &ACSblk->ev_mmobutton, &ACSblk->ev_mmokstate, &ACSblk->ev_mkreturn, &ACSblk->ev_mbreturn);
#else
		/* there was a bug in the evnt_xmulti macro, which is already fixed */
		events = evnt_xmulti(MU_MESAG | MU_TIMER | MU_BUTTON | MU_KEYBD | MU_M1,
			ACSblk->ev_mbclicks, bmask, ACSblk->ev_bstate,
			1, ACSblk->ev_mmox, ACSblk->ev_mmoy, 1, 1,
			0, 0, 0, 0, 0,
			msgbuf,
			(uint16)ACSblk->ev_mtcount, ((uint32)(uint16)(ACSblk->ev_mtcount >> 16)),
			&ACSblk->ev_mmox, &ACSblk->ev_mmoy, &ACSblk->ev_mmobutton, &ACSblk->ev_mmokstate, &ACSblk->ev_mkreturn, &ACSblk->ev_mbreturn, wheels);
#endif
		ACSblk->ev_mkreturn = nkc_gemks2n(ACSblk->ev_mkreturn, ACSblk->ev_mmokstate);
		
		Awi_update(BEG_UPDATE);
		
		if (events & MU_MESAG)
			Aev_message(msgbuf);
		
		if (events & MU_BUTTON)
		{
			if (ACSblk->ev_mmobutton & 0x80)
				evmwheel(wheels, ACSblk->ev_mmox, ACSblk->ev_mmoy);
			evbutton(ACSblk->ev_mmobutton, ACSblk->ev_mbreturn);
		}
		
		if (events & MU_KEYBD)
			evkeybrd(NULL);
		
		graf_mkstate(&ACSblk->ev_mmox, &ACSblk->ev_mmoy, &ACSblk->ev_mmobutton, &ACSblk->ev_mmokstate);		
		if (ACSblk->ev_mmobutton == 0)
		{
			if (events & MU_M1)
				Aev_unhidepointer();
			evmouse();
		}
		
		Ax_release();
		Awi_lateupdate();
		ACSblk->ev_window = root;
		ACSblk->ACStimer();
		
		Awi_update(END_UPDATE);
		Ax_mterm(NULL);
		
	} while ((!ACSblk->application || !exitapp) && !ACSblk->apterm);
	
	ACSblk->appexit = TRUE;
	Aev_unhidepointer();
	Amo_busy();
}
