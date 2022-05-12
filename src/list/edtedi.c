#include "acs_i.h"

static Obj_Head *copy_tedinfo(ACS_HEAD *acs, const Obj_Head *src);
static OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_tedi = {
	NULL,
	NULL,
	&WI_TEDI,
	te_list,
	te_name,
	LIST_TEDINFO,
	NULL,
	copy_tedinfo,
	del_tedinfo,
	new_work,
	NULL
};

static TEDINFO my_ted = { NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0 };

static Obj_Head free_tedi = {
	NULL,
	&my_ted,
	0,
	sizeof(my_ted),
	sizeof(my_ted),
	NULL,
	"TEDINFO_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

Obj_Head *add_tedinfo(ACS_HEAD *acs, Obj_Head *obj)
{
	Obj_Head *objlist;
	Obj_Head **entries;
	Obj_Head *entry;
	TEDINFO *ted, *oldted;
	int i, count;

	acs->flags |= ACS_CHANGED;
	objlist = acs->te_list;
	entries = objlist->object;
	ted = obj->object;
	if ((ACSblk->ev_mmokstate & (K_LSHIFT | K_CTRL)) != (K_LSHIFT | K_CTRL))
	{
		count = (int)(objlist->used / sizeof(*entries));
		for (i = 0; i < count; i++)
		{
			entry = entries[i];
			oldted = entry->object;
			if (oldted->te_font == ted->te_font &&
				oldted->te_just == ted->te_just &&
				oldted->te_color == ted->te_color &&
				oldted->te_thickness == ted->te_thickness &&
				/* BUG: te_txtlen not checked */
				strcmp(((Obj_Head *)oldted->te_ptext)->object, ((Obj_Head *)ted->te_ptext)->object) == 0 &&
				strcmp(((Obj_Head *)oldted->te_ptmplt)->object, ((Obj_Head *)ted->te_ptmplt)->object) == 0 &&
				strcmp(((Obj_Head *)oldted->te_pvalid)->object, ((Obj_Head *)ted->te_pvalid)->object) == 0)
			{
				entry->usage += 1;
				return entry;
			}
		}
	}
	/* BUG: no objextent call */
	if ((entry = copy_tedinfo(acs, obj)) == NULL)
		return NULL;
	objname(acs, entry, obj->label, list_tedi.asktitle);
	/* BUG: does not check whether add_entry fails */
	add_entry(acs->te_list, entry);
	return entry;
}

/* -------------------------------------------------------------------------- */

void del_tedinfo(ACS_HEAD *acs, Obj_Head *obj)
{
	TEDINFO *ted;
	
	acs->flags |= ACS_CHANGED;
	obj->usage -= 1;
	if (obj->usage > 0)
		return;
	ted = obj->object;
	del_string(acs, (Obj_Head *)ted->te_ptext);
	del_string(acs, (Obj_Head *)ted->te_ptmplt);
	del_string(acs, (Obj_Head *)ted->te_pvalid);
	del_entry(acs->te_list, obj);
	objfree(acs, obj);
}

/* -------------------------------------------------------------------------- */

Obj_Head *dup_tedinfo(ACS_HEAD *acs, TEDINFO *ted)
{
	Obj_Head *str;
	
	memcpy(&my_ted, ted, sizeof(my_ted));
	str = dup_string(acs, ted->te_ptext);
	/* BUG: no NULL pointer check */
	str->usage--;
	my_ted.te_ptext = (char *)str;
	str = dup_string(acs, ted->te_ptmplt);
	/* BUG: no NULL pointer check */
	str->usage--;
	my_ted.te_ptmplt = (char *)str;
	str = dup_string(acs, ted->te_pvalid);
	/* BUG: no NULL pointer check */
	str->usage--;
	my_ted.te_pvalid = (char *)str;
	free_tedi.used = free_tedi.size = sizeof(*ted);
	return add_tedinfo(acs, &free_tedi);
}

/* -------------------------------------------------------------------------- */

static Obj_Head *copy_tedinfo(ACS_HEAD *acs, const Obj_Head *src)
{
	Obj_Head *obj;
	const TEDINFO *srcted;
	TEDINFO *ted;

	obj = objmalloc(acs, sizeof(*ted));
	if (obj == NULL)
		return NULL;
	srcted = src->object;
	ted = obj->object;
	memcpy(ted, srcted, sizeof(*ted));
	obj->used = sizeof(*ted);
	ted->te_ptext = (char *)add_string(acs, (Obj_Head *)srcted->te_ptext);
	ted->te_ptmplt = (char *)add_string(acs, (Obj_Head *)srcted->te_ptmplt);
	ted->te_pvalid = (char *)add_string(acs, (Obj_Head *)srcted->te_pvalid);
	return obj;
}

/* -------------------------------------------------------------------------- */

static OBJECT *new_work(Obj_Head *objlist)
{
	return work_icon(objlist, WI_TEDI.iconblk, LIST_TEDINFO);
}
