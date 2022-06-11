#include "acs_i.h"
#include "acsplus.h"
#include "country.h"

static void edwi_ok(void);
static void edwi_abort(void);
static void edwi_tme(void);
static void edwi_acc(void);
static void edwi_two(void);
static void edwi_tic(void);
static void edwi_ref(void);

static boolean wi_service(Awindow *self, int16 task, void *in_out);
static Awindow *wi_make(void *a);

#include "edwinded.ah"
#include "edwinded.h"

static void accept_window(Awindow *self, boolean force);
static void edwi_term(Awindow *self);
static void set_window(Awindow *self);
static char *live_snap(void *obj, long pos);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edwi_tme(void)
{
	Awindow *self = ACSblk->ev_window;
	EDPARM *parm = self->user;
	
	self->kind |= AW_STAY;
	list_menu.acs = parm->acs;
	list_menu.objlist = parm->acs->me_list;
	WI_LIST.create(&list_menu);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void edwi_two(void)
{
	Awindow *self = ACSblk->ev_window;
	EDPARM *parm = self->user;
	
	self->kind |= AW_STAY;
	list_object.acs = parm->acs;
	list_object.objlist = parm->acs->ob_list;
	WI_LIST.create(&list_object);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void edwi_tic(void)
{
	Awindow *self = ACSblk->ev_window;
	EDPARM *parm = self->user;
	
	self->kind |= AW_STAY;
	list_icon.acs = parm->acs;
	list_icon.objlist = parm->acs->ic_list;
	WI_LIST.create(&list_icon);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void edwi_ref(void)
{
	Awindow *self = ACSblk->ev_window;
	EDPARM *parm = self->user;
	
	self->kind |= AW_STAY;
	list_reference.acs = parm->acs;
	list_reference.objlist = parm->acs->rf_list;
	WI_LIST.create(&list_reference);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void edwi_ok(void)
{
	accept_window(ACSblk->ev_window, FALSE);
	edwi_term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void edwi_abort(void)
{
	edwi_term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void edwi_acc(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	int16 obnr;
	AOBJECT *aobj;
	Obj_Head *p1;
	
	ACSblk->Aselect.next = 0; /* FIXME: Adr_start */
	if ((obnr = Adr_next()) >= 0)
	{
		aobj = (AOBJECT *)&ACSblk->Aselect.window->work[obnr] + 1;
		p1 = aobj->userp1;
		if (aobj->type == LIST_OBJECT ||
			aobj->type == LIST_MENU ||
			aobj->type == LIST_ICON ||
			aobj->type == LIST_REFS)
		{
			Awi_diaend();
			Aob_puttext(tree, ACSblk->ev_obnr, p1->label);
			self->obchange(self, ACSblk->ev_obnr, -1);
			Awi_diastart();
			Adr_del(ACSblk->Aselect.window, obnr);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void accept_window(Awindow *self, boolean force)
{
	Obj_Head *obj;
	Obj_Head *entry;
	OBJECT *ptr;
	char *str;
	int snapx;
	int snapy;
	Obj_Head helptitle = { NULL, NULL, 0, 0, 0, NULL, "STGUIDE_01", 0, 0, { 0, 0, 0, 0 } };
	Obj_Head helpfile = { NULL, NULL, 0, 0, 0, NULL, "HELPFILE_01", 0, 0, { 0, 0, 0, 0 } };
	EDPARM *parm;
	ACS_HEAD *acs;
	Awindow *win;
	OBJECT *tree;
	int16 flags;
	
	parm = self->user;
	acs = parm->acs;
	win = parm->obj->object;
	tree = self->work;
	Auo_boxed(&tree[EDIT_WINDOW_CREATE], AUO_GETVAL, &str);
	if (*str == '\0' && !force)
		Awi_alert(1, WARN_CREATE);
	acs->flags |= ACS_CHANGED;
	flags = 0;
	if (tree[EDIT_WINDOW_CLOSER].ob_state & OS_SELECTED)
		flags |= CLOSER;
	if (tree[EDIT_WINDOW_HOTCLOSEBOX].ob_state & OS_SELECTED)
		flags |= HOTCLOSEBOX;
	if (tree[EDIT_WINDOW_MOVER].ob_state & OS_SELECTED)
		flags |= MOVER;
	if (tree[EDIT_WINDOW_NAME].ob_state & OS_SELECTED)
		flags |= NAME;
	if (tree[EDIT_WINDOW_INFO].ob_state & OS_SELECTED)
		flags |= INFO;
	if (tree[EDIT_WINDOW_FULLER].ob_state & OS_SELECTED)
		flags |= FULLER;
	if (tree[EDIT_WINDOW_SIZER].ob_state & OS_SELECTED)
		flags |= SIZER;
	if (tree[EDIT_WINDOW_UPARROW].ob_state & OS_SELECTED)
		flags |= UPARROW;
	if (tree[EDIT_WINDOW_DNARROW].ob_state & OS_SELECTED)
		flags |= DNARROW;
	if (tree[EDIT_WINDOW_RTARROW].ob_state & OS_SELECTED)
		flags |= RTARROW;
	if (tree[EDIT_WINDOW_LFARROW].ob_state & OS_SELECTED)
		flags |= LFARROW;
	if (tree[EDIT_WINDOW_HSLIDE].ob_state & OS_SELECTED)
		flags |= HSLIDE;
	if (tree[EDIT_WINDOW_VSLIDE].ob_state & OS_SELECTED)
		flags |= VSLIDE;
	if (tree[EDIT_WINDOW_ICONIFIER].ob_state & OS_SELECTED)
		flags |= ICONIFIER;
	if (tree[EDIT_WINDOW_BACKDROP].ob_state & OS_SELECTED)
		flags |= BACKDROP;
	win->wi_kind = flags;
	
	flags = 0;
	if (tree[EDIT_WINDOW_OBLIST].ob_state & OS_SELECTED)
		flags |= AW_OBLIST;
	if (tree[EDIT_WINDOW_STAY].ob_state & OS_SELECTED)
		flags |= AW_STAY;
	if (tree[EDIT_WINDOW_ICON].ob_state & OS_SELECTED)
		flags |= AW_ICON;
	if (tree[EDIT_WINDOW_GHOSTICON].ob_state & OS_SELECTED)
		flags |= AW_GHOSTICON;
	if (tree[EDIT_WINDOW_ICONACCEPT].ob_state & OS_SELECTED)
		flags |= AW_ICONACCEPT;
	if (tree[EDIT_WINDOW_TOOLBOX].ob_state & OS_SELECTED)
		flags |= AW_TOOLBOX;
	win->kind = flags;
	
	ptr = &self->work[EDIT_WINDOW_SNAPX];
	Auo_slider(ptr, AUO_GETVAL, &str);
	sscanf(str, "%d", &snapx);
	ptr = &self->work[EDIT_WINDOW_SNAPY];
	Auo_slider(ptr, AUO_GETVAL, &str);
	sscanf(str, "%d", &snapy);
	win->snap_mask = -snapx & ((-snapy << 8) | 0xff);

#ifdef __GNUC__
	{
	int x;
	Aob_scanf(tree, EDIT_WINDOW_ACT_X, "%d", &x);
	win->wi_act.x = x;
	Aob_scanf(tree, EDIT_WINDOW_ACT_Y, "%d", &x);
	x = win->wi_act.y;
	Aob_scanf(tree, EDIT_WINDOW_ACT_W, "%d", &x);
	win->wi_act.w = x;
	Aob_scanf(tree, EDIT_WINDOW_ACT_H, "%d", &x);
	win->wi_act.h = x;
	}
#else
	Aob_scanf(tree, EDIT_WINDOW_ACT_X, "%d", &win->wi_act.x);
	Aob_scanf(tree, EDIT_WINDOW_ACT_Y, "%d", &win->wi_act.y);
	Aob_scanf(tree, EDIT_WINDOW_ACT_W, "%d", &win->wi_act.w);
	Aob_scanf(tree, EDIT_WINDOW_ACT_H, "%d", &win->wi_act.h);
#endif
	
	Auo_boxed(&tree[EDIT_WINDOW_NAMESTR], AUO_GETVAL, &str);
	change_string(acs, (Obj_Head *)win->name, str);
	Auo_boxed(&tree[EDIT_WINDOW_INFOSTR], AUO_GETVAL, &str);
	change_string(acs, (Obj_Head *)win->info, str);
	
	obj = (Obj_Head *)win->work;
	Auo_boxed(&tree[EDIT_WINDOW_WORK], AUO_GETVAL, &str);
	if (*str != '\0')
	{
		entry = find_entry(acs->ob_list, str);
		if (entry == NULL)
			alert_str(ERR_OB_DEL, str);
		else
			++entry->usage;
	} else
	{
		entry = NULL;
	}
	if (obj != NULL)
		del_object(acs, obj);
	win->work = (OBJECT *)entry;
	
	obj = (Obj_Head *)win->toolbar;
	Auo_boxed(&tree[EDIT_WINDOW_TOOLBAR], AUO_GETVAL, &str);
	if (*str != '\0')
	{
		entry = find_entry(acs->ob_list, str);
		if (entry == NULL)
			alert_str(ERR_OB_DEL, str);
		else
			++entry->usage;
	} else
	{
		entry = NULL;
	}
	if (obj != NULL)
		del_object(acs, obj);
	win->toolbar = (OBJECT *)entry;
	
	obj = (Obj_Head *)win->menu;
	Auo_boxed(&tree[EDIT_WINDOW_MENU], AUO_GETVAL, &str);
	if (*str != '\0')
	{
		entry = find_entry(acs->me_list, str);
		if (entry == NULL)
			alert_str(ERR_ME_DEL, str);
		else
			++entry->usage;
	} else
	{
		entry = NULL;
	}
	if (obj != NULL)
		del_menu(acs, obj);
	win->menu = (OBJECT *)entry;
	
	obj = (Obj_Head *)win->iconblk;
	Auo_boxed(&tree[EDIT_WINDOW_ICONBLK], AUO_GETVAL, &str);
	if (*str != '\0')
	{
		entry = find_entry(acs->ic_list, str);
		if (entry == NULL)
			alert_str(ERR_IC_DEL, str);
		else
			++entry->usage;
	} else
	{
		entry = NULL;
	}
	if (obj != NULL)
		del_icon(acs, obj);
	win->iconblk = (CICONBLK *)entry;
	
	Auo_boxed(&tree[EDIT_WINDOW_USER], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->user, str, REF_NONE);
	Auo_boxed(&tree[EDIT_WINDOW_OPEN], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->open, str, REF_WIN_OPEN);
	Auo_boxed(&tree[EDIT_WINDOW_CREATE], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->create, str, REF_WIN_CREATE);
	Auo_boxed(&tree[EDIT_WINDOW_SERVICE], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->service, str, REF_WIN_SERVICE);
	Auo_boxed(&tree[EDIT_WINDOW_INIT], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->init, str, REF_WIN_INIT);
	Auo_boxed(&tree[EDIT_WINDOW_KEYS], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->keys, str, REF_WIN_KEYS);
	Auo_boxed(&tree[EDIT_WINDOW_CHANGE], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->obchange, str, REF_WIN_CHANGE);
	Auo_boxed(&tree[EDIT_WINDOW_REDRAW], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->redraw, str, REF_WIN_REDRAW);
	Auo_boxed(&tree[EDIT_WINDOW_TOPPED], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->topped, str, REF_WIN_TOPPED);
	Auo_boxed(&tree[EDIT_WINDOW_CLOSED], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->closed, str, REF_WIN_CLOSED);
	Auo_boxed(&tree[EDIT_WINDOW_FULLED], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->fulled, str, REF_WIN_FULLED);
	Auo_boxed(&tree[EDIT_WINDOW_ARROWED], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->arrowed, str, REF_WIN_ARROWED);
	Auo_boxed(&tree[EDIT_WINDOW_HSLIDEFUNC], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->hslid, str, REF_WIN_HSLIDE);
	Auo_boxed(&tree[EDIT_WINDOW_VSLIDEFUNC], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->vslid, str, REF_WIN_VSLIDE);
	Auo_boxed(&tree[EDIT_WINDOW_SIZED], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->sized, str, REF_WIN_SIZED);
	Auo_boxed(&tree[EDIT_WINDOW_MOVED], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->moved, str, REF_WIN_MOVED);
	Auo_boxed(&tree[EDIT_WINDOW_ICONIFY], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->iconify, str, REF_WIN_ICONIFY);
	Auo_boxed(&tree[EDIT_WINDOW_UNICONIFY], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->uniconify, str, REF_WIN_UNICONIFY);
	Auo_boxed(&tree[EDIT_WINDOW_GEMSCRIPT], AUO_GETVAL, &str);
	mod_ref(acs, (Obj_Head **)&win->gemscript, str, REF_WIN_GEMSCRIPT);
	
	obj = (Obj_Head *)win->help_file;
	Auo_boxed(&tree[EDIT_WINDOW_HELP_FILE], AUO_GETVAL, &helpfile.object);
	helpfile.used = helpfile.size = strlen(helpfile.object) + 1;
	if (!Ast_isEmpty(helpfile.object))
	{
		if (obj == NULL)
			entry = add_string(acs, &helpfile);
		else
			entry = change_string(acs, obj, helpfile.object);
	} else
	{
		entry = NULL;
	}
	if (obj != NULL && obj != entry)
		del_string(acs, obj);
	win->help_file = (char *)entry;
	
	obj = (Obj_Head *)win->help_title;
	Auo_boxed(&tree[EDIT_WINDOW_HELP_TITLE], AUO_GETVAL, &helptitle.object);
	helptitle.used = helptitle.size = strlen(helptitle.object) + 1;
	if (!Ast_isEmpty(helptitle.object))
	{
		if (obj == NULL)
			entry = add_string(acs, &helptitle);
		else
			entry = change_string(acs, obj, helptitle.object);
	} else
	{
		entry = NULL;
	}
	if (obj != NULL && obj != entry)
		del_string(acs, obj);
	win->help_title = (char *)entry;
}

/* -------------------------------------------------------------------------- */

static Awindow *wi_make(void *a)
{
	EDPARM *parm;
	EDPARM *newparm;
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
		newparm->obj = parm->obj;
		WI_WINDOW.iconblk->monoblk.ib_ptext = WI_WINDOW.info = obj->label;
		win = Awi_create(&WI_WINDOW);
		if (win == NULL)
		{
			Ax_free(newparm);
			return NULL;
		}
		wi_pos(win, &obj->pos, &parm->acs->last_rez);
		win->user = newparm;
		obj->window = win;
		set_window(win);
		if (win->open(win) != OK)
		{
			edwi_term(win);
			return NULL;
		}
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static boolean wi_service(Awindow *self, int16 task, void *in_out)
{
	EDPARM *parm = self->user;
	AOBJECT *aobj;
	
	switch (task)
	{
	case AS_GETBUBBLE:
		((AGetObjText *)in_out)->text = NULL;
		break;
	
	case AS_ALLOWBUBBLE:
		*((boolean *)in_out) = TRUE;
		break;

	case AS_CHECKDRAG:
		aobj = (AOBJECT *)&ACSblk->Aselect.window->work[ACSblk->Aselect.array[0]] + 1;
		switch (*((int16 *)in_out))
		{
		case EDIT_WINDOW_TOOLBAR:
		case EDIT_WINDOW_WORK:
			if (aobj->type != LIST_OBJECT)
				((int16 *)in_out)[1] = 0;
			break;
		case EDIT_WINDOW_MENU:
			if (aobj->type != LIST_MENU)
				((int16 *)in_out)[1] = 0;
			break;
		case EDIT_WINDOW_ICONBLK:
			if (aobj->type != LIST_ICON)
				((int16 *)in_out)[1] = 0;
			break;
		default:
			if (aobj->type != LIST_REFS)
				((int16 *)in_out)[1] = 0;
			break;
		}
		break;
	
	case AS_TERM:
		accept_window(self, TRUE);
		edwi_term(self);
		break;
	
	case AS_GUI_RENAME_OBJ:
		new_name(self, parm->obj);
		break;
	
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void set_window(Awindow *self)
{
	EDPARM *parm = self->user;
	OBJECT *tree;
	Awindow *win;
	int16 flags;
	OBJECT *ptr;
	Awiob ob;
	Obj_Head *obj;
	int32 val;
	char buf[LABEL_MAX + 4];
	SLLIVE live;
	
	win = parm->obj->object;
	tree = self->work;
	
	flags = win->wi_kind;
	set_flag(flags & CLOSER, &tree[EDIT_WINDOW_CLOSER]);
	set_flag(flags & HOTCLOSEBOX, &tree[EDIT_WINDOW_HOTCLOSEBOX]);
	set_flag(flags & MOVER, &tree[EDIT_WINDOW_MOVER]);
	set_flag(flags & NAME, &tree[EDIT_WINDOW_NAME]);
	set_flag(flags & INFO, &tree[EDIT_WINDOW_INFO]);
	set_flag(flags & FULLER, &tree[EDIT_WINDOW_FULLER]);
	set_flag(flags & SIZER, &tree[EDIT_WINDOW_SIZER]);
	set_flag(flags & UPARROW, &tree[EDIT_WINDOW_UPARROW]);
	set_flag(flags & DNARROW, &tree[EDIT_WINDOW_DNARROW]);
	set_flag(flags & RTARROW, &tree[EDIT_WINDOW_RTARROW]);
	set_flag(flags & LFARROW, &tree[EDIT_WINDOW_LFARROW]);
	set_flag(flags & VSLIDE, &tree[EDIT_WINDOW_VSLIDE]);
	set_flag(flags & HSLIDE, &tree[EDIT_WINDOW_HSLIDE]);
	set_flag(flags & ICONIFIER, &tree[EDIT_WINDOW_ICONIFIER]);
	set_flag(flags & BACKDROP, &tree[EDIT_WINDOW_BACKDROP]);
	
	flags = win->kind;
	set_flag(flags & AW_OBLIST, &tree[EDIT_WINDOW_OBLIST]);
	set_flag(flags & AW_STAY, &tree[EDIT_WINDOW_STAY]);
	set_flag(flags & AW_ICON, &tree[EDIT_WINDOW_ICON]);
	set_flag(flags & AW_GHOSTICON, &tree[EDIT_WINDOW_GHOSTICON]);
	set_flag(flags & AW_ICONACCEPT, &tree[EDIT_WINDOW_ICONACCEPT]);
	set_flag(flags & AW_TOOLBOX, &tree[EDIT_WINDOW_TOOLBOX]);
	
	ob.window = self;
	ptr = &tree[EDIT_WINDOW_SNAPX];
	ob.entry = ptr;
	ob.obnr = EDIT_WINDOW_SNAPX;
	Auo_slider(ptr, AUO_SELF, &ob);
	val = 7;
	Auo_slider(ptr, AUO_SLFULL, &val);
	val = 1;
	Auo_slider(ptr, AUO_SLSIZE, &val);
	switch (-(win->snap_mask | -256))
	{
	case 1:
		val = 0;
		break;
	case 2:
		val = 1;
		break;
	case 4:
		val = 2;
		break;
	case 8:
		val = 3;
		break;
	case 16:
		val = 4;
		break;
	case 32:
		val = 5;
		break;
	case 64:
		val = 6;
		break;
	}
	Auo_slider(ptr, AUO_POS, &val);
	sprintf(buf, "%d", -(win->snap_mask | -256));
	Auo_slider(ptr, AUO_SETVAL, buf);
	live.call = live_snap;
	live.obj = ptr;
	Auo_slider(ptr, AUO_SLCALL, &live);
	
	ptr = &tree[EDIT_WINDOW_SNAPY];
	ob.entry = ptr;
	ob.obnr = EDIT_WINDOW_SNAPY;
	Auo_slider(ptr, AUO_SELF, &ob);
	val = 7;
	Auo_slider(ptr, AUO_SLFULL, &val);
	val = 1;
	Auo_slider(ptr, AUO_SLSIZE, &val);
	switch (-(win->snap_mask >> 8))
	{
	case 1:
		val = 0;
		break;
	case 2:
		val = 1;
		break;
	case 4:
		val = 2;
		break;
	case 8:
		val = 3;
		break;
	case 16:
		val = 4;
		break;
	case 32:
		val = 5;
		break;
	case 64:
		val = 6;
		break;
	}
	Auo_slider(ptr, AUO_POS, &val);
	sprintf(buf, "%d", -(win->snap_mask >> 8));
	Auo_slider(ptr, AUO_SETVAL, buf);
	live.call = live_snap;
	live.obj = ptr;
	Auo_slider(ptr, AUO_SLCALL, &live);
	
	Aob_printf(tree, EDIT_WINDOW_ACT_X, "%d", win->wi_act.x);
	Aob_printf(tree, EDIT_WINDOW_ACT_Y, "%d", win->wi_act.y);
	Aob_printf(tree, EDIT_WINDOW_ACT_W, "%d", win->wi_act.w);
	Aob_printf(tree, EDIT_WINDOW_ACT_H, "%d", win->wi_act.h);
	
	obj = (Obj_Head *)win->name;
	Aob_puttext(tree, EDIT_WINDOW_NAMESTR, obj->object);
	obj = (Obj_Head *)win->info;
	Aob_puttext(tree, EDIT_WINDOW_INFOSTR, obj->object);
	
	set_ref((Obj_Head *)win->work, buf);
	Auo_boxed(&tree[EDIT_WINDOW_WORK], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->toolbar, buf);
	Auo_boxed(&tree[EDIT_WINDOW_TOOLBAR], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->menu, buf);
	Auo_boxed(&tree[EDIT_WINDOW_MENU], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->iconblk, buf);
	Auo_boxed(&tree[EDIT_WINDOW_ICONBLK], AUO_SETVAL, buf);
	
	set_ref((Obj_Head *)win->user, buf);
	Auo_boxed(&tree[EDIT_WINDOW_USER], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->open, buf);
	Auo_boxed(&tree[EDIT_WINDOW_OPEN], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->create, buf);
	Auo_boxed(&tree[EDIT_WINDOW_CREATE], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->service, buf);
	Auo_boxed(&tree[EDIT_WINDOW_SERVICE], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->init, buf);
	Auo_boxed(&tree[EDIT_WINDOW_INIT], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->keys, buf);
	Auo_boxed(&tree[EDIT_WINDOW_KEYS], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->obchange, buf);
	Auo_boxed(&tree[EDIT_WINDOW_CHANGE], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->redraw, buf);
	Auo_boxed(&tree[EDIT_WINDOW_REDRAW], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->topped, buf);
	Auo_boxed(&tree[EDIT_WINDOW_TOPPED], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->closed, buf);
	Auo_boxed(&tree[EDIT_WINDOW_CLOSED], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->fulled, buf);
	Auo_boxed(&tree[EDIT_WINDOW_FULLED], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->arrowed, buf);
	Auo_boxed(&tree[EDIT_WINDOW_ARROWED], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->hslid, buf);
	Auo_boxed(&tree[EDIT_WINDOW_HSLIDEFUNC], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->vslid, buf);
	Auo_boxed(&tree[EDIT_WINDOW_VSLIDEFUNC], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->sized, buf);
	Auo_boxed(&tree[EDIT_WINDOW_SIZED], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->moved, buf);
	Auo_boxed(&tree[EDIT_WINDOW_MOVED], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->iconify, buf);
	Auo_boxed(&tree[EDIT_WINDOW_ICONIFY], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->uniconify, buf);
	Auo_boxed(&tree[EDIT_WINDOW_UNICONIFY], AUO_SETVAL, buf);
	set_ref((Obj_Head *)win->gemscript, buf);
	Auo_boxed(&tree[EDIT_WINDOW_GEMSCRIPT], AUO_SETVAL, buf);

	if (win->help_file != NULL)
	{
		obj = (Obj_Head *)win->help_file;
		Aob_puttext(tree, EDIT_WINDOW_HELP_FILE, obj->object);
	} else
	{
		Aob_puttext(tree, EDIT_WINDOW_HELP_FILE, "");
	}
	if (win->help_title != NULL)
	{
		obj = (Obj_Head *)win->help_title;
		Aob_puttext(tree, EDIT_WINDOW_HELP_TITLE, obj->object);
	} else
	{
		Aob_puttext(tree, EDIT_WINDOW_HELP_TITLE, "");
	}
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static char *live_snap(void *obj, long val)
{
#if WITH_FIXES
	static char buf[8];
#else
	char buf[6];
#endif
	int snap;
	
	switch ((int)val)
	{
#if WITH_FIXES
	default:
#endif
	case 0:
		snap = 1;
		break;
	case 1:
		snap = 2;
		break;
	case 2:
		snap = 4;
		break;
	case 3:
		snap = 8;
		break;
	case 4:
		snap = 16;
		break;
	case 5:
		snap = 32;
		break;
	case 6:
		snap = 64;
		break;
	}
	/* BUG: returns address of local var */
#ifdef __PUREC__
	return itoa(snap, buf, 10);
#else
	sprintf(buf, "%d", snap);
	return buf;
#endif
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static void edwi_term(Awindow *self)
{
	EDPARM *parm;
	
	parm = self->user;
	parm->obj->window = NULL;
	if (self->state & AWS_ICONIZED)
		memcpy(&parm->obj->pos, &self->wi_normal, sizeof(parm->obj->pos));
	else
		memcpy(&parm->obj->pos, &self->wi_act, sizeof(parm->obj->pos));
	Ax_free(parm);
	Awi_delete(self);
}
