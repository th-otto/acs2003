#include "acs_i.h"

#ifndef C_UNION
#  define C_UNION(x) { (int32)(x) }
#endif

static OBJ_ENTRY protopup = {
	NULL, NULL,
	{ -1, -1, -1, G_BOX, 0, OS_SHADOWED, C_UNION(0x00ff1100L), 0, 0, 12, 6 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 }
};
static Obj_Head protopopup = {
	NULL,
	&protopup,
	0,
	sizeof(protopup),
	sizeof(protopup),
	NULL,
	"POPUP_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

static Obj_Head *copy_popup(ACS_HEAD *acs, const Obj_Head *obj);
static void del_popup(ACS_HEAD *acs, Obj_Head *obj);
static OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_popup = {
	NULL,
	NULL,
	&WI_POPUP,
	pu_list,
	pu_name,
	LIST_POPUP,
	&protopopup,
	copy_popup,
	del_popup,
	new_work,
	NULL
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static Obj_Head *copy_popup(ACS_HEAD *acs, const Obj_Head *obj)
{
	Obj_Head *tree;
	int i, count;
	OBJ_ENTRY *src;
	OBJ_ENTRY *dst;
	
	tree = objmalloc(acs, obj->used);
	if (tree == NULL)
		return NULL;
	count = (int)(obj->used / sizeof(*src));
	src = obj->object;
	dst = tree->object;
	for (i = 0; i < count; i++)
		copy_ob(acs, &dst[i], &src[i]);
	tree->used = obj->used;
	return tree;
}

/* -------------------------------------------------------------------------- */

static void del_popup(ACS_HEAD *acs, Obj_Head *obj)
{
	Awindow *win;
	int i, count;
	OBJ_ENTRY *entry;
	
	acs->flags |= ACS_CHANGED;
	obj->usage -= 1;
	if (obj->usage > 0)
		return;
	win = obj->window;
	if (win != NULL)
		win->service(win, AS_TERM, NULL);
	count = (int)(obj->used / sizeof(*entry));
	entry = obj->object;
	for (i = 0; i < count; i++)
		del_ob(acs, &entry[i]);
	del_entry(acs->pu_list, obj);
	objfree(acs, obj);
}

/* -------------------------------------------------------------------------- */

static OBJECT *new_work(Obj_Head *objlist)
{
	return work_icon(objlist, WI_POPUP.iconblk, LIST_POPUP);
}
