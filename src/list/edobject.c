#include "acs_i.h"

static OBJ_ENTRY protoobj = {
	NULL, NULL,
	{ -1, -1, -1, G_BOX, 0, OS_OUTLINED, C_UNION(0x00021100L), 0, 0, 32, 12 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0 }
};
static Obj_Head protoobject = {
	NULL,
	&protoobj,
	0,
	sizeof(protoobj),
	sizeof(protoobj),
	NULL,
	"OBJECT_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

static Obj_Head *copy_object(ACS_HEAD *acs, const Obj_Head *obj);
static OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_object = {
	NULL,
	NULL,
	&WI_OBJECT,
	ob_list,
	ob_name,
	LIST_OBJECT,
	&protoobject,
	copy_object,
	del_object,
	new_work,
	NULL
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

Obj_Head *add_object(ACS_HEAD *acs, Obj_Head *obj)
{
	Obj_Head *list;
	Obj_Head *tree;
	
	acs->flags |= ACS_CHANGED;
	list = acs->ob_list;
	if (objextent(list, sizeof(OBJ_ENTRY)) != OK || /* FIXME: should be sizeof(Obj_Head *) */
		(tree = copy_object(acs, obj)) == NULL)
		return NULL;
	objname(acs, tree, obj->label, list_object.asktitle);
	add_entry(list, tree);
	return tree;
}

/* -------------------------------------------------------------------------- */

static Obj_Head *copy_object(ACS_HEAD *acs, const Obj_Head *obj)
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

void del_object(ACS_HEAD *acs, Obj_Head *obj)
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
	del_entry(acs->ob_list, obj);
	objfree(acs, obj);
}

/* -------------------------------------------------------------------------- */

static OBJECT *new_work(Obj_Head *objlist)
{
	return work_icon(objlist, WI_OBJECT.iconblk, LIST_OBJECT);
}
