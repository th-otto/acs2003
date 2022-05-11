#include "acs_i.h"

static Obj_Head NameObj = {
	NULL,
	proto_winame,
	0,
	sizeof(proto_winame),
	sizeof(proto_winame),
	NULL,
	"TEXT_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};
static Obj_Head InfoObj = {
	NULL,
	proto_wiinfo,
	0,
	1,
	1,
	NULL,
	"TEXT_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};
static Obj_Head HelpFileObj = {
	NULL,
	proto_wihelpfile,
	0,
	sizeof(proto_wihelpfile),
	sizeof(proto_wihelpfile),
	NULL,
	"HELPFILE_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};
static Obj_Head HelpTitleObj = {
	NULL,
	proto_wihelptitle,
	0,
	sizeof(proto_wihelptitle),
	sizeof(proto_wihelptitle),
	NULL,
	"STGUIDE_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

static Awindow window_obj = {
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	0, 0,
	-1,
	0x6fff,
	{ 0, 0, 120, 50 },
	{ 0, 0, 0, 0 },
	{ 0, 0, 0, 0 },
	{ -1, -1, -1, -1 },
	0, 0,
	0xf8f8,
	(char *)&NameObj,
	(char *)&InfoObj,
	0,
	AW_TOOLBOX | AW_ICON | AW_GHOSTICON,
	0,
	-1,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	(char *)&HelpFileObj,
	(char *)&HelpTitleObj
};

static Obj_Head protowindow = {
	NULL,
	&window_obj,
	0,
	sizeof(window_obj),
	sizeof(window_obj),
	NULL,
	"WINDOW_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

static Obj_Head *copy_window(ACS_HEAD *acs, const Obj_Head *src);
static void del_window(ACS_HEAD *acs, Obj_Head *obj);
static OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_window = {
	NULL,
	NULL,
	&WI_WINDOW,
	wi_list,
	wi_name,
	LIST_WINDOWS,
	&protowindow,
	copy_window,
	del_window,
	new_work,
	NULL
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void copyref(ACS_HEAD *acs, void *ref)
{
	Obj_Head **pref = (Obj_Head **)ref;
	if (*pref != NULL)
		*pref = add_ref(acs, *pref);
}

/* -------------------------------------------------------------------------- */

static Obj_Head *copy_window(ACS_HEAD *acs, const Obj_Head *src)
{
	Obj_Head *obj;
	Awindow *win;
	
	if ((obj = objmalloc(acs, src->used)) == NULL)
		return NULL;
	obj->used = src->used;
	win = obj->object;
	memcpy(win, src->object, src->used);
	copyref(acs, &win->user);
	copyref(acs, &win->open);
	copyref(acs, &win->service);
	copyref(acs, &win->create);
	if (win->work != NULL)
		win->work = add_object(acs, win->work);
	if (win->toolbar != NULL)
		win->toolbar = add_object(acs, win->toolbar);
	win->name = (char *)add_string(acs, (Obj_Head *)win->name);
	win->info = (char *)add_string(acs, (Obj_Head *)win->info);
	if (win->iconblk != NULL)
		win->iconblk = (CICONBLK *)add_icon(acs, (Obj_Head *)win->iconblk);
	if (win->menu != NULL)
		win->menu = add_menu(acs, win->menu);
	copyref(acs, &win->init);
	copyref(acs, &win->keys);
	copyref(acs, &win->obchange);
	copyref(acs, &win->redraw);
	copyref(acs, &win->topped);
	copyref(acs, &win->closed);
	copyref(acs, &win->fulled);
	copyref(acs, &win->arrowed);
	copyref(acs, &win->hslid);
	copyref(acs, &win->vslid);
	copyref(acs, &win->sized);
	copyref(acs, &win->moved);
	copyref(acs, &win->iconify);
	copyref(acs, &win->uniconify);
	copyref(acs, &win->gemscript);
	win->help_file = (char *)add_string(acs, (Obj_Head *)win->help_file);
	win->help_title = (char *)add_string(acs, (Obj_Head *)win->help_title);
	return obj;
}

/* -------------------------------------------------------------------------- */

static void delref(ACS_HEAD *acs, void *ref)
{
	Obj_Head **pref = (Obj_Head **)ref;
	if (*pref != NULL)
		del_ref(acs, *pref);
}

/* -------------------------------------------------------------------------- */

void del_window(ACS_HEAD *acs, Obj_Head *obj)
{
	Awindow *win;
	
	obj->usage -= 1;
	if (obj->usage > 0)
		return;
	win = obj->window;
	if (win != NULL)
		win->service(win, AS_TERM, NULL);
	win = obj->object;
	delref(acs, &win->user);
	delref(acs, &win->open);
	delref(acs, &win->service);
	delref(acs, &win->create);
	if (win->work != NULL)
		del_object(acs, (Obj_Head *)win->work);
	if (win->toolbar != NULL)
		del_object(acs, (Obj_Head *)win->toolbar);
	del_string(acs, (Obj_Head *)win->name);
	del_string(acs, (Obj_Head *)win->info);
	if (win->iconblk != NULL)
		del_icon(acs, (Obj_Head *)win->iconblk);
	if (win->menu != NULL)
		del_menu(acs, (Obj_Head *)win->menu);
	delref(acs, &win->init);
	delref(acs, &win->keys);
	delref(acs, &win->obchange);
	delref(acs, &win->redraw);
	delref(acs, &win->topped);
	delref(acs, &win->closed);
	delref(acs, &win->fulled);
	delref(acs, &win->arrowed);
	delref(acs, &win->hslid);
	delref(acs, &win->vslid);
	delref(acs, &win->sized);
	delref(acs, &win->moved);
	delref(acs, &win->iconify);
	delref(acs, &win->uniconify);
	delref(acs, &win->gemscript);
	if (win->help_file != NULL)
		del_string(acs, (Obj_Head *)win->help_file);
	if (win->help_title != NULL)
		del_string(acs, (Obj_Head *)win->help_title);
	del_entry(acs->wi_list, obj);
	objfree(acs, obj);
}

/* -------------------------------------------------------------------------- */

static OBJECT *new_work(Obj_Head *objlist)
{
	return work_icon(objlist, WI_WINDOW.iconblk, LIST_WINDOWS);
}
