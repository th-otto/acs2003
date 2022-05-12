#include "acs_i.h"
#include "edlist.h"

extern OBJECT REF_TYPE;

#ifndef C_UNION
#  define C_UNION(x) { (int32)(x) }
#endif

static struct {
	OBJECT inner;
	AOBJECT pra00;
} inner = {
	{ -1, -1, -1, G_BOX, AO_ACCEPT | AO_SILENT, 0, C_UNION(0x00001101L), 0, 0, 100, 100 },
	{ NULL, NULL, AEO | OF_LASTOB, 0, NULL, NULL, 0, 0 }
};

static struct {
	OBJECT proto;
	AOBJECT pra04;
} proto = {
	{ 0, -1, -1, G_STRING, AO_DRAGABLE | OF_SELECTABLE | OF_EXIT, 0, C_UNION(0L), 2, 1024, 32, 1 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, LIST_REFS }
};

static Obj_Head protoref = {
	NULL,
	NULL,
	0,
	0,
	0,
	NULL,
	"REFERENCE_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

static Obj_Head *copy_ref(ACS_HEAD *acs, const Obj_Head *obj);
static OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_reference = {
	NULL,
	NULL,
	&WI_REF,
	rf_list,
	rf_name,
	LIST_REFS,
	&protoref,
	copy_ref,
	del_ref,
	new_work,
	NULL
};

static Obj_Head free_ref = {
	NULL,
	NULL,
	0,
	0,
	0,
	NULL,
	"",
	1,
	0,
	{ 0, 0, 0, 0 }
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

Obj_Head *add_ref(ACS_HEAD *acs, Obj_Head *obj)
{
	Obj_Head *list;
	Obj_Head **entries;
	Obj_Head *entry;
	int i, count;
	int16 type, objtype;
	Awindow *win;
	int16 ret;
	
	acs->flags |= ACS_CHANGED;
	list = acs->rf_list;
	entries = list->object;
	count = (int)(list->used / sizeof(*entries));
	type = obj->flags & 0xff;
	for (i = 0; i < count; i++)
	{
		entry = entries[i];
		if (strcmp(entry->label, obj->label) == 0)
		{
			objtype = entry->flags & 0xff;
			if (objtype == REF_NONE)
			{
				entry->flags = (entry->flags & ~0xff) | type;
				entry->usage += 1;
			} else
			{
				if (type != REF_NONE && objtype != type)
				{
					const OBJECT *tree = &REF_TYPE;
					if ((win = WI_DIFF_TYPE.create(&WI_DIFF_TYPE)) == NULL)
						return NULL;
					Aob_puttext(win->work, DIFF_TYPE_TITLE, entry->label);
					Aob_puttext(win->work, DIFF_TYPE_OLDTYPE, tree[cross_type[objtype]].ob_spec.free_string);
					Aob_puttext(win->work, DIFF_TYPE_NEWTYPE, tree[cross_type[type]].ob_spec.free_string);
					ret = Awi_dialog(win);
					Awi_delete(win);
					if (ret != DIFF_TYPE_NEW)
					{
						/* BUG? same check as above */
						if (ret != DIFF_TYPE_NEW)
							return NULL;
						entry->usage += 1;
						return entry;
					} else
					{
						entry->flags = (entry->flags & ~0xff) | type;
					}
				}
				entry->usage += 1;
			}
			return entry;
		}
	}
	
	if (objextent(list, sizeof(*entries)) != OK ||
		(entry = objmalloc(acs, 0)) == NULL)
		return NULL;
	entry->flags = obj->flags;
	objname(acs, entry, obj->label, list_reference.asktitle);
	add_entry(list, entry);
	return entry;
}

/* -------------------------------------------------------------------------- */

void del_ref(ACS_HEAD *acs, Obj_Head *obj)
{
	acs->flags |= ACS_CHANGED;
	obj->usage -= 1;
	if (obj->usage > 0)
		return;
	del_entry(acs->rf_list, obj);
	objfree(acs, obj);
}

/* -------------------------------------------------------------------------- */

Obj_Head *dup_ref(ACS_HEAD *acs, const char *label, int16 type)
{
	strcpy(free_ref.label, label);
	free_ref.flags = 0xff & type;
	return add_ref(acs, &free_ref);
}

/* -------------------------------------------------------------------------- */

static Obj_Head *copy_ref(ACS_HEAD *acs, const Obj_Head *obj)
{
	Obj_Head *ref;
	
	/* FIXME: should be ->used */
	if ((ref = objmalloc(acs, obj->size)) == NULL)
		return NULL;
	memcpy(ref->object, obj->object, obj->size); /* FIXME: should be ->used */
	ref->used = obj->used;
	ref->flags = obj->flags;
	return ref;
}

/* -------------------------------------------------------------------------- */

static OBJECT *new_work(Obj_Head *objlist)
{
	int i, count;
	Obj_Head **entries;
	OBJECT *tree;
	OBJECT *ptr;
	char *labels;
	Obj_Head *entry;
	
	entries = objlist->object;
	count = (int)(objlist->used / sizeof(*entries));
	tree = Ax_malloc(count * (sizeof(proto) + LABEL_MAX) + sizeof(inner));
	if (tree == NULL)
		return NULL;
	memcpy(tree, &inner, sizeof(inner));
	ptr = &tree[2];
	if (count > 0)
	{
		labels = (char *)(&tree[count * 2] + 2);
		for (i = 0; i < count; i++)
		{
			memcpy(ptr, &proto, sizeof(proto));
			ptr->ob_next = i * 2 + 4;
			ptr->ob_spec.free_string = labels;
			entry = entries[i];
			if (!(entry->flags & OBJ_GLOBAL))
				ptr->ob_state |= OS_OUTLINED;
			((AOBJECT *)(&ptr[1]))->userp1 = entry;
			strcpy(labels, entry->label);
			labels += LABEL_MAX;
			ptr += 2;
		}
		tree[ROOT].ob_tail = count * 2;
		tree[ROOT].ob_head = 2;
		tree[1].ob_flags &= ~OF_LASTOB;
		ptr[-2].ob_next = ROOT;
		ptr[-1].ob_flags |= OF_LASTOB;
	}
	Aob_fix(tree);
	return tree;
}

