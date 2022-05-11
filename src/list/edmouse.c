#include "acs_i.h"

static MFORM mouse_obj = {
	7, 7, 1, 0, 1,
	{ 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0380, 0xfffe,
	  0x0380, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0000 },
	{ 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0280, 0xfc7e, 
	  0x0280, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0000 }
};
static Obj_Head protomouse = {
	NULL,
	&mouse_obj,
	0,
	sizeof(mouse_obj),
	sizeof(mouse_obj),
	NULL,
	"MOUSE_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

static Obj_Head *copy_mouse(ACS_HEAD *acs, const Obj_Head *obj);
static OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_mouse = {
	NULL,
	NULL,
	&WI_MOUSE,
	mf_list,
	mf_name,
	LIST_MOUSE,
	&protomouse,
	copy_mouse,
	del_mouse,
	new_work,
	NULL
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

Obj_Head *add_mouse(ACS_HEAD *acs, Obj_Head *mouse)
{
	Obj_Head *list;
	Obj_Head **entries;
	Obj_Head *entry;
	int i, count;
	
	acs->flags |= ACS_CHANGED;
	list = acs->mo_list;
	entries = list->object;
	count = (int)(list->used / sizeof(*entries));
	for (i = 0; i < count; i++)
	{
		entry = *entries++;
		if (memcmp(entry->object, mouse->object, sizeof(MFORM)) == 0)
		{
			entry->usage += 1;
			return entry;
		}
	}
	if (objextent(list, sizeof(OBJ_ENTRY)) != OK || /* FIXME: should be sizeof(Obj_Head *) */
		(entry = copy_mouse(acs, mouse)) == NULL)
		return NULL;
	objname(acs, entry, mouse->label, list_mouse.asktitle);
	add_entry(list, entry);
	return entry;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static Obj_Head *copy_mouse(ACS_HEAD *acs, const Obj_Head *obj)
{
	Obj_Head *newmouse;
	
	newmouse = objmalloc(acs, obj->used);
	if (newmouse == NULL)
		return NULL;
	newmouse->used = obj->used;
	memcpy(newmouse->object, obj->object, obj->used);
	return newmouse;
}

/* -------------------------------------------------------------------------- */

void del_mouse(ACS_HEAD *acs, Obj_Head *mouse)
{
	Awindow *win;
	
	mouse->usage -= 1;
	if (mouse->usage > 0)
		return;
	win = mouse->window;
	if (win != NULL)
		win->service(win, AS_TERM, NULL);
	del_entry(acs->mo_list, mouse);
	objfree(acs, mouse);
}

/* -------------------------------------------------------------------------- */

static OBJECT *new_work(Obj_Head *objlist)
{
	return work_icon(objlist, WI_MOUSE.iconblk, LIST_MOUSE);
}
