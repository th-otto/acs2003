/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Default pure desktop                                  */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "acsplus.h"
#include "country.h"

#define STATIC

typedef struct {
	void (*newcall)(char *filename);
	int16 sort;
	int16 max_icon;
	int16 n_row;
	int16 n_col;
} USER;

static struct {
	char path[__PS__];
	int16 flags;
	int16 more;
	int16 color;
	int16 pattern;
	int16 dither;
} CONFIG = {
	"",
	AB_NOMEMCHECK | AB_CENTERDIALOG | AB_FEEDBACK | AB_CLICKMENU,
	0,
	12,
	4,
	0x41
};
#define SORT_NONE 0
#define SORT_HOR  1
#define SORT_VER  2
static USER proto_user = { NULL, SORT_VER, 8, 0, 0 };
static OBJECT *__W_BACK = NULL;

static void wd_color(void);
static void wd_pattern(void);
static boolean wd_service(Awindow *self, int16 task, void *in_out);
static Awindow *wd_make(void *a);
static void wd_deskclose(Awindow *self);

#include "desktop.ah"
#include "desktop.h"

static const char *const colour_txt[] = {
	COLOUR00,
	COLOUR01,
	COLOUR02,
	COLOUR03,
	COLOUR04,
	COLOUR05,
	COLOUR06,
	COLOUR07,
	COLOUR08,
	COLOUR09,
	COLOUR10,
	COLOUR11,
	COLOUR12,
	COLOUR13,
	COLOUR14,
	COLOUR15
};

static void new_pos(void);
static void new(void);
static void del_info(void);

static CICONBLK *trash_ic = &__TRASH_IC;
static CICONBLK *new_ic = &__NEW_IC;
static CICONBLK *window_ic = &__WINDOW_IC;
static AUSERBLK dither = { A_3Dbutton, 0x00000078L, NULL, NULL, NULL, NULL, NULL, NULL };
static struct {
	OBJECT root;
	AOBJECT pra00;
	OBJECT pro02;
	AOBJECT pra02;
	OBJECT pro04;
	AOBJECT pra04;
	OBJECT pro06;
	AOBJECT pra06;
	OBJECT pro08;
	AOBJECT pra08;
} proto = {
	{ -1,  2,  6, G_USERDEF, 0x1800, 0x2000, C_UNION(&dither), 0, 0, 0, 0 },
	{ NULL, new_pos, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 },
	{  4, -1, -1, 0x0019, 0x0080, 0x0000, C_UNION(0L), 0x0000, 0x0000, 0x0000, 0x0000 },
	{ NULL, 0, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 },
	{  6, -1, -1, 0x001F, 0x3004, 0x0000, C_UNION(&__TRASH_IC), 0x0000, 0x0000, 0x0048, 0x0028 },
	{ del_info, Awd_delete, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0003 },
	{  0, -1, -1, 0x001F, 0x3084, 0x0000, C_UNION(&__NEW_IC), 0x0000, 0x0000, 0x0048, 0x0028 },
	{ new, new, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0002 },
	{  0, -1, -1, 0x001F, 0x0080, 0x0000, C_UNION(&__WINDOW_IC), 0x0000, 0x0000, 0x0048, 0x0028 },
	{ NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0001 }
};
static AUSERBLK Sep = { A_arrows, 0x22090001L, NULL, NULL, NULL, NULL, NULL, NULL };

static CICONBLK *xtrash_ic;
static CICONBLK *xnew_ic;
static CICONBLK *xwindow_ic;

static void wd_delete(Awindow *self);
static void info(Awindow *self);
static void sort(Awindow *self);
static void open_li(Awindow *self);
static void set_new(Awindow *self, void (*newcall)(char *filename));
static void term(Awindow *self);

#define ICON_WIDTH  80
#define ICON_HEIGHT 48

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void Awd_module(void)
{
	char *filename;
	
	if (CONFIG.path[0] < 'C')
	{
		if (Dsetdrv(Dgetdrv()) & 4)
			CONFIG.path[0] = 'C';
	}
	filename = Af_first_fsel(_TITLE_MODULE, CONFIG.path, "AM");
	while (filename != NULL)
	{
		Ash_module(filename);
		filename = Af_next_fsel();
	}
}

/* -------------------------------------------------------------------------- */

void Awd_close(void)
{
	int16 top;
	Awindow *last;
	Awindow *win;
	
	last = NULL;
	for (;;)
	{
		wind_get(0, WF_TOP, &top, 0L, 0L, 0L);
		win = Awi_wid(top);
		if (win == Awi_root() || win == NULL)
			return;
		if (!(win->kind & AW_STAY) || (win->wi_kind & CLOSER))
			break;
		if (last == NULL)
		{
			last = win;
		} else if (last == win)
		{
			return;
		}
		Awi_down();
	}
	if ((win->kind & AW_ICON) || ACSblk->description->acc != NULL)
	{
		win->closed(win);
	} else
	{
		win->service(win, AS_TERM, NULL);
	}
}

/* -------------------------------------------------------------------------- */

static void wd_deskclose(Awindow *self)
{
	if (ACSblk->application && ACSblk->multitask && !ACSblk->appexit && !(self->state & AWS_ICONIZED))
		ACSblk->ACSclose();
	else
		Awi_closed(self);
}

/* -------------------------------------------------------------------------- */

void Awd_quit(void)
{
	ACSblk->ACSclose();
}

/* -------------------------------------------------------------------------- */

void Awd_delete(void)
{
	wd_delete(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void wd_delete(Awindow *self)
{
	Awindow *select;
	int16 obnr;
	Awindow *win;
	AOBJECT *aobj;
	
	if (ACSblk->Aselect.actlen != 0)
	{
		select = ACSblk->Aselect.window;
		if (select != self)
		{
			select->service(select, AS_DELETE, NULL);
		} else
		{
			ACSblk->Aselect.next = 0; /* Adr_start() */
			while ((obnr = Adr_next()) >= 0)
			{
				aobj = (AOBJECT *)&self->work[obnr] + 1;
				if (aobj->type == AT_ICONWINDOW)
				{
					Adr_del(self, obnr);
					win = aobj->userp1;
					win->service(win, AS_TERM, NULL);
				}
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static void drag_wi(void)
{
	AOBJECT *aobj;
	Awindow *win;
	
	aobj = (AOBJECT *)&ACSblk->ev_object[ACSblk->ev_obnr] + 1;
	win = aobj->userp1;
	win->service(win, AS_DRAGGED, NULL);
}

/* -------------------------------------------------------------------------- */

void Awd_info(void)
{
	info(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void del_info(void)
{
	Awindow *win;
	
	if ((win = _WI_TRASH_INFO.create(&_WI_TRASH_INFO)) != NULL)
	{
		Awi_dialog(win);
		Awi_delete(win);
	}
}

/* -------------------------------------------------------------------------- */

static void info(Awindow *self)
{
	int16 obnr;
	Awindow *select;
	AOBJECT *aobj;
	Awindow *win;
	
	if (ACSblk->Aselect.actlen == 0)
	{
		ACSblk->ACSaboutme();
	} else
	{
		select = ACSblk->Aselect.window;
		if (select != self)
		{
			select->service(select, AS_INFO, NULL);
		} else
		{
			ACSblk->Aselect.next = 0; /* Adr_start(); */
			while ((obnr = Adr_next()) >= 0)
			{
				aobj = (AOBJECT *)&self->work[obnr] + 1;
				Adr_del(self, obnr);
				switch (aobj->type)
				{
				case AT_ICONWINDOW:
					win = aobj->userp1;
					win->service(win, AS_INFO, NULL);
					break;
				
				case AT_TRASH:
					del_info();
					break;
				
				case AT_NEW:
					if ((win = _WI_NEW_INFO.create(&_WI_NEW_INFO)) != NULL)
					{
						Awi_dialog(win);
						Awi_delete(win);
					}
					break;
				}
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static void wd_color(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	
	popup = Aob_create(&DPOP_COLSEL.root);
	if (popup == NULL)
		return;
	Aob_offset(&rect, ACSblk->ev_window->work, BEHAVIOUR_COLOR_POPUP_BOX);
	rect.x += ACSblk->ev_window->wi_work.x + 1;
	rect.y += ACSblk->ev_window->wi_work.y + 1;
	popup[(int)(ACSblk->ev_window->work[BEHAVIOUR_COLOR].ob_spec.obspec.interiorcol) * 2 + 1].ob_state |= OS_CHECKED;
	sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
	if (sel > 0)
	{
		sel = (sel & -2) / 2;
		Aob_puttext(ACSblk->ev_object, BEHAVIOUR_COLOR_POPUP, colour_txt[sel]);
		ACSblk->ev_object[BEHAVIOUR_COLOR].ob_spec.obspec.interiorcol = sel;
		ACSblk->ev_window->obchange(ACSblk->ev_window, BEHAVIOUR_COLOR_POPUP_BOX, -1);
	}
	Aob_delete(popup);
}

/* -------------------------------------------------------------------------- */

static void wd_pattern(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	
	popup = Aob_create(&DPOP_PATSEL.root);
	if (popup == NULL)
		return;
	Aob_offset(&rect, ACSblk->ev_window->work, BEHAVIOUR_PATTERN_POPUP);
	rect.x += ACSblk->ev_window->wi_work.x + 1;
	rect.y += ACSblk->ev_window->wi_work.y + 1;
	popup[(int)(ACSblk->ev_window->work[BEHAVIOUR_PATTERN_POPUP].ob_spec.obspec.fillpattern) + 1].ob_state |= OS_CHECKED;
	sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
	if (sel > 0)
	{
		ACSblk->ev_object[BEHAVIOUR_PATTERN_POPUP].ob_spec.obspec.fillpattern = sel - 1;
		ACSblk->ev_window->obchange(ACSblk->ev_window, BEHAVIOUR_PATTERN_POPUP, -1);
	}
	Aob_delete(popup);
}

/* -------------------------------------------------------------------------- */

static int16 wd_init(Awindow *self)
{
	int16 w, h;
	boolean multi;
	char *acc_reg;
	USER *user;
	OBJECT *tree;
	AUSERBLK *auser;
	OBJECT *ptr;
	CICONBLK *icon;
	int i;
	
	xnew_ic = Aic_create(new_ic);
	xtrash_ic = Aic_create(trash_ic);
	xwindow_ic = Aic_create(window_ic);
	if (proto.root.ob_width < ICON_WIDTH && proto.root.ob_height < ICON_HEIGHT)
	{
		w = ACSblk->desk.w;
		h = ACSblk->desk.h;
		multi = !ACSblk->application || ACSblk->multitask;
		if (multi)
		{
			acc_reg = ACSblk->description->acc_reg;
			while (*acc_reg == ' ')
				acc_reg++;
			self->name = Ast_create(acc_reg);
			/* BUG: no null-pointer check */
			acc_reg = &self->name[strlen(self->name)] - 1;
			while (*acc_reg == ' ')
			{
				*acc_reg = '\0';
				acc_reg--;
			}
			w = (w >> 1) + ICON_WIDTH;
			h = (h >> 1) + ICON_HEIGHT;
		}
	} else
	{
		w = proto.root.ob_width;
		h = proto.root.ob_height;
	}
	user = self->user;
	user->n_row = (h + 8) / ICON_HEIGHT;
	user->n_col = w / ICON_WIDTH;
	if (user->n_row < 2)
		user->n_row = 2;
	if (user->n_col < 2)
		user->n_col = 2;
	h = user->n_row * ICON_HEIGHT;
	w = user->n_col * ICON_WIDTH;
	user->max_icon = user->n_col * user->n_row;
	tree = Ax_malloc((user->max_icon + 4) * (2 * sizeof(OBJECT) + sizeof(*icon)));
	if (tree == NULL)
		return FAIL;
	self->work = tree;
	memcpy(tree, &proto, 8 * sizeof(OBJECT));
	if ((char)tree[ROOT].ob_type == G_USERDEF)
	{
		auser = tree[ROOT].ob_spec.auserblk;
		if (auser->ub_serv != NULL)
			auser->ub_serv(&tree[ROOT], AUO_CREATE, NULL);
	}
	tree[ROOT].ob_x = 0;
	tree[ROOT].ob_y = 0;
	tree[ROOT].ob_width = w;
	tree[ROOT].ob_height = h;
	Aob_icon(&tree[6]);
	Aob_icon(&tree[4]);
	tree[2].ob_head = 8;
	ptr = &tree[8];
	tree[ROOT].ob_tail = 6;
	icon = (CICONBLK *)(&tree[user->max_icon * 2] + 4);
	i = 8;
	for (;;)
	{
		memcpy(ptr, &proto.pro08, 2 * sizeof(OBJECT));
		memcpy(icon, window_ic, sizeof(*icon));
		ptr->ob_spec.ciconblk = icon;
		Aob_icon(ptr);
		if (i >= user->max_icon * 2 + 2)
		{
			tree[2].ob_tail = i;
			ptr->ob_next = 2;
			ptr[1].ob_flags |= OF_LASTOB;
			sort(self);
			return OK;
		}
		i += 2;
		ptr->ob_next = i;
		ptr += 2;
		icon++;
	}
}

/* -------------------------------------------------------------------------- */

static void ghost_icon(Awindow *self, int16 obnr)
{
	OBJECT *obj;
	CICONBLK *icon;
	
	if (obnr >= 0)
	{
		obj = &self->work[obnr];
		obj->ob_flags &= ~(AO_DRAGABLE | AO_ACCEPT | OF_SELECTABLE | OF_EXIT);
		obj->ob_flags |= OF_TOUCHEXIT;
		obj->ob_state &= ~OS_SELECTED;
		icon = obj->ob_spec.ciconblk;
		icon->monoblk.ib_pmask = icon->monoblk.ib_pdata;
		icon->mainlist = NULL;
		Awi_obredraw(self, obnr);
	}
}

/* -------------------------------------------------------------------------- */

static void update_icon(Awindow *self, int16 obnr)
{
	OBJECT *obj;
	AOBJECT *aobj;
	CICONBLK *icon;
	Awindow *win;
	CICONBLK *icon2;
	
	if (obnr >= 0)
	{
		obj = &self->work[obnr];
		aobj = (AOBJECT *)obj + 1;
		win = aobj->userp1;
		icon = win->iconblk;
		aobj->userp2 = icon;
		if (icon != NULL)
		{
			memcpy(obj->ob_spec.ciconblk, icon, sizeof(*icon));
			aobj->key = 0xff & icon->monoblk.ib_char;
		} else
		{
			memcpy(obj->ob_spec.ciconblk, window_ic, sizeof(*icon));
			obj->ob_spec.ciconblk->monoblk.ib_ptext = win->name;
			aobj->key = 0;
		}
		if (!(obj->ob_flags & AO_DRAGABLE))
		{
			icon2 = obj->ob_spec.ciconblk;
			icon2->monoblk.ib_pmask = icon2->monoblk.ib_pdata;
			icon2->mainlist = NULL;
		}
		Aob_icon(obj);
		Awi_obredraw(self, obnr);
	}
}

/* -------------------------------------------------------------------------- */

void Awd_hor(void)
{
	Awindow *self = ACSblk->ev_window;
	USER *user = self->user;
	
	if (user->sort != SORT_HOR)
	{
		user->sort = SORT_HOR;
		sort(self);
		if (self->wi_id >= 0)
			Awi_obredraw(self, ROOT);
	}
}

/* -------------------------------------------------------------------------- */

void Awd_behaviour(void)
{
	Awindow *win;
	int16 flags;
	int16 color;
	int16 pattern;
	Awindow *root;
	int32 *pparm;
	
	if ((win = _WI_BEHAVIOUR.create(&_WI_BEHAVIOUR)) != NULL)
	{
		win->work[BEHAVIOUR_PULLDOWN].ob_state &= ~OS_SELECTED;
		win->work[BEHAVIOUR_FEEDBACK].ob_state &= ~OS_SELECTED;
		win->work[BEHAVIOUR_HIDEMOUSE].ob_state &= ~OS_SELECTED;
		win->work[BEHAVIOUR_CENTER_DIALOG].ob_state &= ~OS_SELECTED;
		win->work[BEHAVIOUR_SMART_REDRAW].ob_state &= ~OS_SELECTED;
		win->work[BEHAVIOUR_MENU_FIRST].ob_state &= ~OS_SELECTED;
		win->work[BEHAVIOUR_3D].ob_state &= ~OS_SELECTED;
		flags = ACSblk->description->flags;
		if (flags & AB_CLICKMENU)
			win->work[BEHAVIOUR_PULLDOWN].ob_state |= OS_SELECTED;
		if (flags & AB_FEEDBACK)
			win->work[BEHAVIOUR_FEEDBACK].ob_state |= OS_SELECTED;
		if (flags & AB_HIDEPOINTER)
			win->work[BEHAVIOUR_HIDEMOUSE].ob_state |= OS_SELECTED;
		if (flags & AB_ACUSTIC)
			win->work[BEHAVIOUR_ACUSTIC].ob_state |= OS_SELECTED;
		if (flags & AB_CENTERDIALOG)
			win->work[BEHAVIOUR_CENTER_DIALOG].ob_state |= OS_SELECTED;
		if (flags & AB_SMARTREDRAW)
			win->work[BEHAVIOUR_SMART_REDRAW].ob_state |= OS_SELECTED;
		if (flags & AB_MENUFIRST)
			win->work[BEHAVIOUR_MENU_FIRST].ob_state |= OS_SELECTED;
		if (!(flags & AB_NO3D))
			win->work[BEHAVIOUR_3D].ob_state |= OS_SELECTED;
		Aob_puttext(win->work, BEHAVIOUR_COLOR_POPUP, colour_txt[CONFIG.color]);
		color = CONFIG.color;
		win->work[BEHAVIOUR_COLOR].ob_spec.obspec.interiorcol = color;
		pattern = CONFIG.pattern;
		win->work[BEHAVIOUR_PATTERN_POPUP].ob_spec.obspec.fillpattern = pattern;
		if (Awi_dialog(win) == BEHAVIOUR_OK)
		{
			flags = ACSblk->description->flags & ~AB_NOTRANSICON;
			if (win->work[BEHAVIOUR_PULLDOWN].ob_state & OS_SELECTED)
				flags |= AB_CLICKMENU;
			if (win->work[BEHAVIOUR_FEEDBACK].ob_state & OS_SELECTED)
				flags |= AB_FEEDBACK;
			if (win->work[BEHAVIOUR_HIDEMOUSE].ob_state & OS_SELECTED)
				flags |= AB_HIDEPOINTER;
			if (win->work[BEHAVIOUR_ACUSTIC].ob_state & OS_SELECTED)
				flags |= AB_ACUSTIC;
			if (win->work[BEHAVIOUR_CENTER_DIALOG].ob_state & OS_SELECTED)
				flags |= AB_CENTERDIALOG;
			if (win->work[BEHAVIOUR_SMART_REDRAW].ob_state & OS_SELECTED)
				flags |= AB_SMARTREDRAW;
			if (win->work[BEHAVIOUR_MENU_FIRST].ob_state & OS_SELECTED)
				flags |= AB_MENUFIRST;
			if (!(win->work[BEHAVIOUR_3D].ob_state & OS_SELECTED))
				flags |= AB_NO3D;
			root = Awi_root();
			if (root != NULL && __W_BACK != NULL && __W_BACK == root->work)
			{
				color = win->work[BEHAVIOUR_COLOR].ob_spec.obspec.interiorcol;
				pattern = win->work[BEHAVIOUR_PATTERN_POPUP].ob_spec.obspec.fillpattern;
				pparm = &root->work[ROOT].ob_spec.auserblk->ub_parm;
				*pparm = (*pparm & ~0x7f) | ((int32)pattern << 4) | color;
			}
			if (((ACSblk->description->flags ^ flags) & AB_NO3D) ||
				CONFIG.color != color ||
				CONFIG.pattern != pattern)
			{
				Aev_WmRedraw(ACSblk->gl_apid, -1, &ACSblk->desk);
			}
			ACSblk->description->flags = flags;
			CONFIG.color = color;
			CONFIG.pattern = pattern;
		}
		Awi_delete(win);
	}
}

/* -------------------------------------------------------------------------- */

static Awindow *wd_make(void *a)
{
	A_FileList *list, *ptr;
	long fd;
	OBJECT *menu;
	int16 sep;
	Awindow *self;
	char path[__PS__];
	char ext[6];
	char *basename;
	
	UNUSED(a);
	strcpy(CONFIG.path, "A:\\");
	fd = Fopen(Af_cfgfile("DESKTOP"), FO_READ);
	if (fd > 0)
	{
		Fread((int)fd, sizeof(CONFIG), &CONFIG);
		Fclose((int)fd);
		ACSblk->description->flags = (ACSblk->description->flags & AB_NOTRANSICON) | (CONFIG.flags & ~AB_NOTRANSICON);
		ACSblk->dither = CONFIG.dither;
	}
	CONFIG.path[0] = Dgetdrv() + 'A';
	if (CONFIG.path[0] < 'C' && (Dsetdrv(Dgetdrv()) & 4))
		CONFIG.path[0] = 'C';
	menu = DESKTOP.menu;
	if (menu == &__MENU.root)
	{
		sep = menu[menu[menu[menu[ROOT].ob_tail].ob_head].ob_head].ob_next;
		menu[sep].ob_type = G_USERDEF;
		menu[sep].ob_state |= AOS_CONST;
		menu[sep].ob_spec.auserblk = &Sep;
	}
	dither.ub_parm = (dither.ub_parm & ~0x7f) | ((long)CONFIG.pattern << 4) | CONFIG.color;
	self = Awi_create(&DESKTOP);
	if (self == NULL)
		return NULL;
	if ((self->user = Ax_malloc(sizeof(proto_user))) == NULL)
		return NULL;
	memcpy(self->user, &proto_user, sizeof(proto_user));
	if (wd_init(self) != OK)
		return NULL;
	__W_BACK = self->work;
	Aroot_wi = self;
	strcpy(path, CONFIG.path);
	basename = strrchr(path, PATH_SEP);
	if (basename != NULL && basename[1] != '\0')
		basename[1] = '\0';
	ptr = list = Af_readdir(path);
	if (ptr != NULL)
	{
		while (ptr != NULL)
		{
			if (strcmp(strupr(Af_2ext(ext, ptr->file)), "AMA") == 0)
				Ash_module(ptr->file);
			ptr = ptr->next;
		}
		Af_freedir(list);
	}
	return self;
}

/* -------------------------------------------------------------------------- */

static void new_pos(void)
{
	Awindow *self;
	OBJECT *tree;
	int16 actlen;
	int16 obnr;
	int16 *xpos;
	int16 *ypos;
	int16 x0;
	int16 y0;
	int16 x;
	int16 y;
	Axywh rect;
	int16 test;
	int16 pos;
	
	self = ACSblk->ev_window;
	if (ACSblk->Aselect.window == self)
	{
		tree = self->work;
		actlen = ACSblk->Aselect.actlen;
		xpos = Ax_malloc((actlen * sizeof(*xpos)) * 2);
		if (xpos != NULL)
		{
			ypos = &xpos[actlen];
			rect.w = ICON_WIDTH;
			rect.h = ICON_HEIGHT;
			actlen = 0;
			ACSblk->Aselect.next = 0; /* Adr_start() */
			while ((obnr = Adr_next()) >= 0)
			{
				xpos[actlen] = tree[obnr].ob_x;
				ypos[actlen] = tree[obnr].ob_y;
				actlen++;
			}
			x0 = (ACSblk->Aselect.x - tree[ROOT].ob_x - self->wi_work.x) % ICON_WIDTH + ACSblk->Aselect.rx + 4;
			y0 = (ACSblk->Aselect.y - tree[ROOT].ob_y - self->wi_work.y) % ICON_HEIGHT + ACSblk->Aselect.ry;
			actlen = 0;
			ACSblk->Aselect.next = 0; /* Adr_start() */
			while ((obnr = Adr_next()) >= 0)
			{
				x = xpos[actlen] + x0;
				y = ypos[actlen] + y0;
				test = 8;
				pos = -1;
				while (!(tree[test + 1].ob_flags & OF_LASTOB))
				{
					rect.x = tree[test].ob_x;
					rect.y = tree[test].ob_y;
					if (Aob_within(&rect, x, y))
					{
						pos = test;
						break;
					}
					test += 2;
				}
				if (pos > 0)
				{
					int16 savex;
					int16 savey;
					
					((USER *)self->user)->sort = SORT_NONE;
					savex = tree[pos].ob_x;
					tree[pos].ob_x = tree[obnr].ob_x;
					savey = tree[pos].ob_y;
					tree[pos].ob_y = tree[obnr].ob_y;
					self->work[obnr].ob_flags |= OF_HIDETREE;
					Awi_obredraw(self, obnr);
					self->work[obnr].ob_flags &= ~OF_HIDETREE;
					tree[obnr].ob_x = savex;
					tree[obnr].ob_y = savey;
					Awi_obredraw(self, obnr);
				}
				actlen++;
			}
			Ax_free(xpos);
			ACSblk->Aselect.dragback = 0;
		}
	}
}

/* -------------------------------------------------------------------------- */

static void new_call(char *filename)
{
	USER *user = ACSblk->ev_window->user;
	void (*newcall)(char *filename) = user->newcall;
	char path[__PS__ * 2];
	
	if (newcall != NULL)
	{
		if (!Ast_isEmpty(filename))
			Af_unquote(path, filename);
		else
			path[0] = '\0';
		newcall(filename != NULL ? path : NULL);
	}
}

/* -------------------------------------------------------------------------- */

static void new(void)
{
	new_call(NULL);
}

/* -------------------------------------------------------------------------- */

void Awd_list(void)
{
	Awindow *win;
	
	if ((win = Awi_list()) != NULL || (win = Awi_list()) != NULL)
	{
		if (win->wi_id > 0)
			Awi_show(win);
	}
}

/* -------------------------------------------------------------------------- */

static void norm_icon(Awindow *self, int16 obnr)
{
	OBJECT *obj;
	AOBJECT *aobj;
	
	if (obnr >= 0)
	{
		obj = &self->work[obnr];
		aobj = (AOBJECT *)obj + 1;
		obj->ob_flags &= ~(AO_ACCEPT | OF_HIDETREE | OF_TOUCHEXIT);
		obj->ob_flags |= AO_DRAGABLE | OF_EXIT;
		obj->ob_state &= ~OS_SELECTED;
		if (aobj->userp2)
		{
			memcpy(obj->ob_spec.ciconblk, aobj->userp2, sizeof(CICONBLK));
			aobj->key = 0xff & ((CICONBLK *)aobj->userp2)->monoblk.ib_char;
		} else
		{
			memcpy(obj->ob_spec.ciconblk, window_ic, sizeof(CICONBLK));
			obj->ob_spec.ciconblk->monoblk.ib_ptext = ((Awindow *)aobj->userp1)->name;
			aobj->key = 0;
		}
		if (((Awindow *)aobj->userp1)->kind & AW_ICONACCEPT)
			obj->ob_flags |= AO_ACCEPT;
		Aob_icon(obj);
		self->obchange(self, obnr, obj->ob_state);
	}
}

/* -------------------------------------------------------------------------- */

#if 0
static void open_icon(Awindow *self, int16 obnr)
{
	AOBJECT *aobj;
	
	aobj = (AOBJECT *)&self->work[obnr] + 1;
	if (aobj->click)
	{
		ACSblk->ev_window = self;
		ACSblk->ev_object = self->work;
		ACSblk->ev_obnr = obnr;
		aobj->click();
	}
}
#endif

/* -------------------------------------------------------------------------- */

void Awd_open(void)
{
	open_li(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void open_li(Awindow *self)
{
	Awindow *select;
	int16 obnr;
	AOBJECT *aobj;
	
	if (ACSblk->Aselect.actlen <= 0)
	{
		ACSblk->ev_window = self;
		new_call(NULL);
	} else
	{
		select = ACSblk->Aselect.window;
		if (select != self)
		{
			select->service(select, AS_OPEN, NULL);
		} else
		{
			ACSblk->Aselect.next = 0; /* Adr_start(); */
			while ((obnr = Adr_next()) >= 0)
			{
				aobj = (AOBJECT *)&self->work[obnr] + 1;
				if (aobj->type == AT_ICONWINDOW)
				{
					Adr_del(self, obnr);
					select = aobj->userp1;
					if (select->open(select) != OK)
						break;
				}
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static void open_wi(void)
{
	AOBJECT *aobj;
	Awindow *win;
	
	aobj = (AOBJECT *)&ACSblk->ev_object[ACSblk->ev_obnr] + 1;
	win = aobj->userp1;
	if (win->wi_id > 0)
	{
		if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & AOS_DCLICK)
		{
			win->wi_act.x = max(ACSblk->desk.x, ((ACSblk->desk.w - win->wi_act.w) >> 1) + ACSblk->desk.x);
			win->wi_act.y = max(ACSblk->desk.y, ((ACSblk->desk.h - win->wi_act.h) >> 1) + ACSblk->desk.y);
		}
	}
	if (win->wi_id > 0)
	{
		win->state |= AWS_FORCEREDRAW;
		win->sized(win, &win->wi_act);
		win->topped(win);
	} else
	{
		Awi_show(win);
	}
}

/* -------------------------------------------------------------------------- */

static void place(Awindow *self, Awindow *win)
{
	OBJECT *tree;
	int16 child;
	AOBJECT *aobj;
	
	tree = self->work;
	if (tree != NULL)
	{
		child = tree[2].ob_head;
		if (child > 0)
		{
			tree[tree[ROOT].ob_tail].ob_next = child;
			tree[ROOT].ob_tail = child;
			if (tree[child].ob_next == 2)
			{
				tree[2].ob_head = tree[2].ob_tail = NIL;
			} else
			{
				tree[2].ob_head = tree[child].ob_next;
			}
			tree[child].ob_next = ROOT;
			tree[child].ob_flags &= ~OF_HIDETREE;
			aobj = (AOBJECT *)&tree[child] + 1;
			aobj->type = AT_ICONWINDOW;
			aobj->click = open_wi;
			aobj->drag = drag_wi;
			aobj->userp1 = win;
			aobj->userp2 = win->iconblk;
			win->icon = child;
			norm_icon(self, child);
		} else
		{
			win->icon = NIL;
		}
	}
}

/* -------------------------------------------------------------------------- */

static void rem_icon(Awindow *self, int16 *icon)
{
	int16 obnr;
	OBJECT *tree;
	int16 child;
	
	obnr = *icon;
	if (obnr >= 0)
	{
		tree = self->work;
		tree[obnr].ob_flags |= OF_HIDETREE;
		Awi_obredraw(self, obnr);
		child = tree[ROOT].ob_head;
		while (tree[child].ob_next != obnr)
		{
			child = tree[child].ob_next;
		}
		tree[child].ob_next = tree[obnr].ob_next;
		if (tree[obnr].ob_next == ROOT)
			tree[ROOT].ob_tail = child;
		if (tree[2].ob_head < 0)
		{
			tree[2].ob_head = tree[2].ob_tail = obnr;
			tree[obnr].ob_next = 2;
		} else
		{
			tree[obnr].ob_next = tree[2].ob_head;
			tree[2].ob_head = obnr;
		}
		((USER *)self->user)->sort = SORT_NONE;
		*icon = NIL;
	}
}

/* -------------------------------------------------------------------------- */

static void checkdrag(Awindow *self, int16 *in_out)
{
	int16 obnr;
	AOBJECT *aobj;
	Awindow *win;
	
	if (ACSblk->Aselect.window == self)
	{
		switch (in_out[0])
		{
		case 4:
			ACSblk->Aselect.next = 0; /* Adr_start() */
			in_out[1] = FALSE;
			while ((obnr = Adr_next()) >= 0)
			{
				aobj = (AOBJECT *)&self->work[obnr] + 1;
				if (aobj->type == AT_ICONWINDOW)
				{
					in_out[1] = TRUE;
					break;
				}
			}
			break;
		case 6:
			break;
		default:
			aobj = (AOBJECT *)&self->work[in_out[0]] + 1;
			win = aobj->userp1;
			win->service(win, AS_CHECKDRAGGED, &in_out[1]);
			break;
		}
	} else
	{
		win = ACSblk->Aselect.window;
		switch (in_out[0])
		{
		case 4:
			win->service(win, AS_CHECKDELETE, &in_out[1]);
			break;
		case 6:
			break;
		default:
			win->service(win, AS_CHECKDRAGGED, &in_out[1]);
			break;
		}
	}
}

/* -------------------------------------------------------------------------- */

static boolean wd_service(Awindow *self, int16 task, void *in_out)
{
	switch (task)
	{
	case AS_CHECKDRAG:
		checkdrag(self, in_out);
		break;
	
	case AS_BACKOBJECT:
		{
			OBJECT *obj = (OBJECT *)in_out;
			proto.root.ob_type = obj->ob_type;
			proto.root.ob_spec = obj->ob_spec;
			proto.root.ob_width = obj->ob_width;
			proto.root.ob_height = obj->ob_height;
		}
		break;
	
	case AS_ICONNEW:
		new_ic = in_out;
		proto.pro06.ob_spec.ciconblk = in_out;
		break;
	
	case AS_ICONTRASH:
		trash_ic = in_out;
		proto.pro04.ob_spec.ciconblk = in_out;
		break;
	
	case AS_ICONWINDOW:
		window_ic = in_out;
		proto.pro08.ob_spec.ciconblk = in_out;
		break;
	
	case AS_TERM:
		term(self);
		break;
	
	case AS_PLACEICON:
		place(self, in_out);
		break;
	
	case AS_REMICON:
		rem_icon(self, in_out);
		break;
	
	case AS_GHOSTICON:
		ghost_icon(self, *((int16 *)in_out));
		break;
	
	case AS_NORMICON:
		norm_icon(self, *((int16 *)in_out));
		break;
	
	case AS_UPDATEICON:
		update_icon(self, *((int16 *)in_out));
		break;
	
	case AS_NEWCALL:
		set_new(self, *((void (**)(char *))in_out));
		break;
	
	case AS_DELETE:
		wd_delete(self);
		break;
	
	case AS_INFO:
		info(self);
		break;
	
	case AS_OPEN:
		open_li(self);
		break;
	
	case AS_GEM_MESS:
		{
			char *path;
			int16 *msg = in_out;
			char filename[__PS__];
			char ext[6];
			
			if (msg[0] == VA_START &&
				(path = (char *)(((long)msg[3] << 16) | ((long)msg[4] & 0xffff))) != NULL)
			{
				strcpy(filename, path);
				if (strcmp(strupr(Af_2ext(ext, filename)), "AM") == 0 ||
					strcmp(ext, "AMA") == 0)
				{
					Ash_module(filename);
				} else
				{
					new_call(filename);
				}
			} else
			{
				return Awi_service(self, task, in_out);
			}
		}
		break;
	
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void set_new(Awindow *self, void (*newcall)(char *filename))
{
	USER *user = self->user;
	
	user->newcall = newcall;
	if (newcall == NULL)
		self->work[6].ob_flags |= OF_HIDETREE;
	else
		self->work[6].ob_flags &= ~OF_HIDETREE;
	self->obchange(self, 6, self->work[6].ob_state);
}

/* -------------------------------------------------------------------------- */

static void sort(Awindow *self)
{
	OBJECT *tree = self->work;
	USER *user = self->user;
	int16 n_col = user->n_col;
	int16 n_row = user->n_row;
	int16 col, row, obj;
	
	if (user->sort == SORT_HOR)
	{
		tree[4].ob_x = (n_col - 1) * ICON_WIDTH + 4;
		tree[6].ob_x = (n_col - 2) * ICON_WIDTH + 4;
		tree[4].ob_y = tree[6].ob_y = (n_row - 1) * ICON_HEIGHT;
		row = col = 0;
		obj = tree[6].ob_next;
		while (obj != ROOT)
		{
			tree[obj].ob_x = col * ICON_WIDTH + 4;
			tree[obj].ob_y = row * ICON_HEIGHT;
			col++;
			if (col == n_col)
			{
				col = 0;
				row++;
			}
			obj = tree[obj].ob_next;
		}
		obj = tree[2].ob_head;
		while (obj > 2)
		{
			tree[obj].ob_x = col * ICON_WIDTH + 4;
			tree[obj].ob_y = row * ICON_HEIGHT;
			col++;
			if (col == n_col)
			{
				col = 0;
				row++;
			}
			obj = tree[obj].ob_next;
		}
	} else if (user->sort == SORT_VER)
	{
		tree[4].ob_x = tree[6].ob_x = (n_col - 1) * ICON_WIDTH + 4;
		tree[4].ob_y = (n_row - 1) * ICON_HEIGHT;
		tree[6].ob_y = (n_row - 2) * ICON_HEIGHT;
		row = col = 0;
		obj = tree[6].ob_next;
		while (obj != ROOT)
		{
			tree[obj].ob_x = col * ICON_WIDTH + 4;
			tree[obj].ob_y = row * ICON_HEIGHT;
			row++;
			if (row == n_row)
			{
				row = 0;
				col++;
			}
			obj = tree[obj].ob_next;
		}
		obj = tree[2].ob_head;
		while (obj > 2)
		{
			tree[obj].ob_x = col * ICON_WIDTH + 4;
			tree[obj].ob_y = row * ICON_HEIGHT;
			row++;
			if (row == n_row)
			{
				row = 0;
				col++;
			}
			obj = tree[obj].ob_next;
		}
	}
}

/* -------------------------------------------------------------------------- */

static void term(Awindow *self)
{
	OBJECT *tree;
	AUSERBLK *auser;

	if (ACSblk->application)
	{
		if (ACSblk->appexit)
		{
			tree = self->work;
			if (tree != NULL && (char)tree[ROOT].ob_type == G_USERDEF)
			{
				auser = tree[ROOT].ob_spec.auserblk;
				if (auser->ub_serv != NULL)
					auser->ub_serv(&tree[ROOT], AS_ACCLOSED, NULL);
			}
			Aic_delete(xnew_ic);
			Aic_delete(xtrash_ic);
			Aic_delete(xwindow_ic);
			Ax_free(tree);
			self->work = NULL;
			Ax_free(self->user);
			Awi_delete(self);
			Awd_save();
		}
	} else
	{
		Awi_closed(self);
	}
}

/* -------------------------------------------------------------------------- */

void Awd_save(void)
{
	char path[__PS__];
	char *filename;
	long ret;
	long fd;
	
	filename = Af_cfgfile("DESKTOP");
	ret = Fattrib(filename, 0, 0);
	if (ret < 0 || !(ret & FA_RDONLY))
	{
		fd = Fcreate(filename, 0);
		if (fd > 0)
		{
			CONFIG.flags = ACSblk->description->flags;
			CONFIG.dither = ACSblk->dither;
			Fwrite((int) fd, sizeof(CONFIG), &CONFIG);
			Fclose((int) fd);
		} else
		{
			ACSblk->ACSerror(AE_CREATE_IO, Af_2fullname(path, filename));
		}
	}
}

/* -------------------------------------------------------------------------- */

void Awd_ver(void)
{
	Awindow *self = ACSblk->ev_window;
	USER *user = self->user;
	
	if (user->sort != SORT_VER)
	{
		user->sort = SORT_VER;
		sort(self);
		if (self->wi_id >= 0)
			Awi_obredraw(self, ROOT);
	}
}

/* -------------------------------------------------------------------------- */

Awindow *get_desktop(void)
{
	return &DESKTOP;
}
