#include "acs_i.h"

static Obj_Head aboutme = {
	NULL,
	ABOUT,
	0,
	sizeof(ABOUT),
	sizeof(ABOUT),
	NULL,
	"TEXT_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};
static char sep[] = "--------------------";
static Obj_Head separator = {
	NULL,
	sep,
	0,
	sizeof(sep),
	sizeof(sep),
	NULL,
	"TEXT_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};
static char dummy[] = "";
static Obj_Head anystr = {
	NULL,
	dummy,
	0,
	sizeof(dummy),
	sizeof(dummy),
	NULL,
	"NULL_STRING",
	1,
	0,
	{ 0, 0, 0, 0 }
};

static OBJ_ENTRY protomen[] = {
	{ NULL, NULL,
	{ -1,  1,  4, G_IBOX, 0, 0, C_UNION(0x00000000L), 0, 0, 90, 25 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } },
	{ NULL, NULL,
	{  4,  2,  2, G_BOX, 0, 0, C_UNION(0x00001100L), 0, 0, 90, 0x0201 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } },
	{ NULL, NULL,
	{  1,  3,  3, G_IBOX, 0, 0, C_UNION(0x00000000L), 2, 0, 6, 0x0301 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } },
	{ NULL, NULL,
	{  2, -1, -1, G_TITLE, 0, 0, C_UNION(&anystr), 0, 0, 6, 0x0301 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } },
	{ NULL, NULL,
	{  0,  5,  5, G_IBOX, 0, 0, C_UNION(0x00000000L), 0, 0x0301, 80, 19 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } },
	{ NULL, NULL,
	{  4,  6, 13, G_BOX, 0, 0, C_UNION(0x00ff1100L), 2, 0, 20, 8 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } },
	{ NULL, NULL,
	{  7, -1, -1, G_STRING, 0, AOS_CONST, C_UNION(&aboutme), 0, 0, 20, 1 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } },
	{ NULL, NULL,
	{  8, -1, -1, G_STRING, 0, 0x2008, C_UNION(&separator), 0, 1, 20, 1 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } },
	{ NULL, NULL,
	{  9, -1, -1, G_STRING, 0, AOS_CONST, C_UNION(&anystr), 0, 2, 20, 1 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } },
	{ NULL, NULL,
	{ 10, -1, -1, G_STRING, 0, AOS_CONST, C_UNION(&anystr), 0, 3, 20, 1 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } },
	{ NULL, NULL,
	{ 11, -1, -1, G_STRING, 0, AOS_CONST, C_UNION(&anystr), 0, 4, 20, 1 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } },
	{ NULL, NULL,
	{ 12, -1, -1, G_STRING, 0, AOS_CONST, C_UNION(&anystr), 0, 5, 20, 1 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } },
	{ NULL, NULL,
	{ 13, -1, -1, G_STRING, 0, AOS_CONST, C_UNION(&anystr), 0, 6, 20, 1 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } },
	{ NULL, NULL,
	{  5, -1, -1, G_STRING, 0, AOS_CONST, C_UNION(&anystr), 0, 7, 20, 1 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 } }
};


static Obj_Head protomenu = {
	NULL,
	protomen,
	0,
	sizeof(protomen),
	sizeof(protomen),
	NULL,
	"MENU_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

static Obj_Head *copy_menu(ACS_HEAD *acs, const Obj_Head *obj);
static OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_menu = {
	NULL,
	NULL,
	&WI_MENU,
	me_list,
	me_name,
	LIST_MENU,
	&protomenu,
	copy_menu,
	del_menu,
	new_work,
	NULL
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

Obj_Head *add_menu(ACS_HEAD *acs, Obj_Head *menu)
{
	Obj_Head *list;
	Obj_Head *newmenu;
	
	acs->flags |= ACS_CHANGED;
	list = acs->me_list;
	if (objextent(list, sizeof(OBJ_ENTRY)) != OK || /* FIXME should be sizeof(Obj_Head *) */
		(newmenu = copy_menu(acs, menu)) == NULL)
		return NULL;
	objname(acs, newmenu, menu->label, list_menu.asktitle);
	add_entry(list, newmenu);
	return newmenu;
}

/* -------------------------------------------------------------------------- */

static Obj_Head *copy_menu(ACS_HEAD *acs, const Obj_Head *obj)
{
	Obj_Head *newmenu;
	OBJ_ENTRY *dst;
	const OBJ_ENTRY *src;
	int i, count;
	
	if ((newmenu = objmalloc(acs, obj->used)) == NULL)
		return NULL;
	count = (int)(obj->used / sizeof(*src));
	src = obj->object;
	dst = newmenu->object;
	for (i = 0; i < count; i++)
		copy_ob(acs, &dst[i], &src[i]);
	newmenu->used = obj->used;
	return newmenu;
}

/* -------------------------------------------------------------------------- */

void del_menu(ACS_HEAD *acs, Obj_Head *menu)
{
	Awindow *win;
	int i, count;
	OBJ_ENTRY *entry;
	
	acs->flags |= ACS_CHANGED;
	menu->usage -= 1;
	if (menu->usage > 0)
		return;
	win = menu->window;
	if (win != NULL)
		win->service(win, AS_TERM, NULL);
	count = (int)(menu->used / sizeof(*entry));
	entry = menu->object;
	for (i = 0; i < count; i++)
		del_ob(acs, &entry[i]);
	del_entry(acs->me_list, menu);
	objfree(acs, menu);
}

/* -------------------------------------------------------------------------- */

static OBJECT *new_work(Obj_Head *objlist)
{
	return work_icon(objlist, WI_MENU.iconblk, LIST_MENU);
}
