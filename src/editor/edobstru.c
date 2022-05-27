#include "acs_i.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void copy_ob(ACS_HEAD *acs, OBJ_ENTRY *dst, const OBJ_ENTRY *src)
{
	Obj_Head *label;
	Obj_Head **list;
	const char *index_name = "INDEX NAME";

	acs->flags |= ACS_CHANGED;
	memcpy(dst, src, sizeof(*dst));
	if (copyindex && src->label != NULL)
	{
		dst->label = label = objmalloc(acs, 0);
		if (label != NULL)
		{
			strcpy(label->label, src->label->label);
			if (uniquename(acs, label, &list) == FAIL && new2label(acs, label, index_name) == FALSE)
			{
				objfree(acs, label);
				dst->label = NULL;
			} else
			{
				objname(acs, label, label->label, index_name);
			}
		}
	} else
	{
		dst->label = NULL;
	}
	
	if (src->type != NULL)
		dst->type = add_ref(acs, src->type);
	if (src->aobj.click != NULL)
		dst->aobj.click = (void *)add_ref(acs, (Obj_Head *)src->aobj.click);
	if (src->aobj.drag != NULL)
		dst->aobj.drag = (void *)add_ref(acs, (Obj_Head *)src->aobj.drag);
	if (src->aobj.userp1 != NULL)
		dst->aobj.userp1 = add_ref(acs, (Obj_Head *)src->aobj.userp1);
	if (src->aobj.userp2 != NULL)
		dst->aobj.userp2 = add_ref(acs, (Obj_Head *)src->aobj.userp2);
		
	switch ((char)src->obj.ob_type)
	{
	case G_TEXT:
	case G_FTEXT:
	case G_BOXTEXT:
	case G_FBOXTEXT:
		dst->obj.ob_spec.tedinfo = (TEDINFO *)add_tedinfo(acs, (Obj_Head *)src->obj.ob_spec.tedinfo);
		break;
	case G_IMAGE:
		dst->obj.ob_spec.bitblk = (BITBLK *)add_image(acs, (Obj_Head *)src->obj.ob_spec.bitblk);
		break;
	case G_USERDEF:
		dst->obj.ob_spec.auserblk = (AUSERBLK *)add_user(acs, (Obj_Head *)src->obj.ob_spec.auserblk);
		break;
	case G_BUTTON:
	case G_STRING:
	case G_TITLE:
		dst->obj.ob_spec.free_string = (char *)add_string(acs, (Obj_Head *)src->obj.ob_spec.free_string);
		break;
	case G_ICON:
	case G_CICON:
		dst->obj.ob_spec.ciconblk = (CICONBLK *)add_icon(acs, (Obj_Head *)src->obj.ob_spec.ciconblk);
		break;
	}
}

/* -------------------------------------------------------------------------- */

int16 copysub_ob(ACS_HEAD *acs, Obj_Head *obj, Obj_Head *proto, int16 obnr)
{
	int count;
	OBJ_ENTRY *dst;
	OBJ_ENTRY *src;
	int16 head;
	int16 newhead;
	int16 child;
	int16 newchild;

	if (objextent(obj, sizeof(OBJ_ENTRY)) != OK)
		return FAIL;
	count = (int)(obj->used / sizeof(OBJ_ENTRY));
	obj->used += sizeof(OBJ_ENTRY);
	dst = obj->object;
	src = proto->object;
	copy_ob(acs, &dst[count], &src[obnr]);
	head = src[obnr].obj.ob_head;
	if (head >= 0)
	{
		newhead = copysub_ob(acs, obj, proto, head);
		if (newhead < 0)
			return FAIL;
		child = newhead;
		dst = obj->object;
		src = proto->object;
		while (obnr != src[head].obj.ob_next)
		{
			head = src[head].obj.ob_next;
			newchild = copysub_ob(acs, obj, proto, head);
			if (newchild < 0)
				return FAIL;
			src = proto->object;
			dst = obj->object;
			dst[child].obj.ob_next = newchild;
			child = newchild;
		}
		dst[child].obj.ob_next = count;
		dst[count].obj.ob_head = newhead;
		dst[count].obj.ob_tail = child;
	} else
	{
		dst[count].obj.ob_head = dst[count].obj.ob_tail = NIL;
	}
	return count;
}

/* -------------------------------------------------------------------------- */

void del_ob(ACS_HEAD *acs, OBJ_ENTRY *obj)
{
	OBJECT *ob;
	
	if (obj->label != NULL)
		objfree(acs, obj->label);
	if (obj->type != NULL)
		del_ref(acs, obj->type);
	if (obj->aobj.click != NULL)
		del_ref(acs, (Obj_Head *)obj->aobj.click);
	if (obj->aobj.drag != NULL)
		del_ref(acs, (Obj_Head *)obj->aobj.drag);
	if (obj->aobj.userp1 != NULL)
		del_ref(acs, (Obj_Head *)obj->aobj.userp1);
	if (obj->aobj.userp2 != NULL)
		del_ref(acs, (Obj_Head *)obj->aobj.userp2);
	ob = &obj->obj;
	switch ((char)ob->ob_type)
	{
	case G_TEXT:
	case G_FTEXT:
	case G_BOXTEXT:
	case G_FBOXTEXT:
		del_tedinfo(acs, (Obj_Head *)ob->ob_spec.tedinfo);
		break;
	case G_IMAGE:
		del_image(acs, (Obj_Head *)ob->ob_spec.bitblk);
		break;
	case G_USERDEF:
		del_user(acs, (Obj_Head *)ob->ob_spec.auserblk);
		break;
	case G_BUTTON:
	case G_STRING:
	case G_TITLE:
		del_string(acs, (Obj_Head *)ob->ob_spec.free_string);
		break;
	case G_ICON:
	case G_CICON:
		del_icon(acs, (Obj_Head *)ob->ob_spec.ciconblk);
		break;
	}
	ob->ob_type = -1;
	acs->flags |= ACS_CHANGED;
}

/* -------------------------------------------------------------------------- */

void delsub_ob(ACS_HEAD *acs, Obj_Head *obj, int16 obnr)
{
	int16 child;
	OBJ_ENTRY *tree;
	
	tree = obj->object;
	child = tree[obnr].obj.ob_head;
	if (child >= 0)
	{
		do
		{
			delsub_ob(acs, obj, child);
			child = tree[child].obj.ob_next;
		} while (child != obnr);
	}
	del_ob(acs, &tree[obnr]);
	unlink_ob(tree, obnr);
}

/* -------------------------------------------------------------------------- */

void free_ob(OBJ_ENTRY *tree, int16 obnr)
{
	int16 prev;
	int16 next;
	int16 child;
	int16 head;
	
	if (obnr == ROOT)
		return;
	prev = obnr;
	next = tree[prev].obj.ob_next;
	child = next;
	while (tree[next].obj.ob_tail != prev)
	{
		prev = next;
		next = tree[prev].obj.ob_next;
	}
	head = tree[next].obj.ob_head;
	if (head == obnr)
	{
		if (child == next)
		{
			tree[next].obj.ob_head = tree[next].obj.ob_tail = NIL;
		} else
		{
			tree[next].obj.ob_head = child;
		}
	} else
	{
		while (tree[head].obj.ob_next != obnr)
			head = tree[head].obj.ob_next;
		tree[head].obj.ob_next = child;
		if (tree[next].obj.ob_tail == obnr)
			tree[next].obj.ob_tail = head;
	}
}

/* -------------------------------------------------------------------------- */

void moveto_ob(OBJ_ENTRY *tree, int16 src, int16 dst)
{
	int16 tail;
	int16 next;
	int16 prev;
	int16 child;
	
	if (src == dst)
		return;
	memcpy(&tree[dst], &tree[src], sizeof(OBJ_ENTRY));
	tail = tree[src].obj.ob_tail;
	if (tail >= 0)
		tree[tail].obj.ob_next = dst;
	prev = src;
	next = tree[prev].obj.ob_next;
	while (tree[next].obj.ob_tail != prev)
	{
		prev = next;
		next = tree[prev].obj.ob_next;
	}
	if (tree[next].obj.ob_tail == src)
		tree[next].obj.ob_tail = dst;
	child = tree[next].obj.ob_head;
	if (child == src)
	{
		tree[next].obj.ob_head = dst;
	} else
	{
		while (tree[child].obj.ob_next != src)
			child = tree[child].obj.ob_next;
		tree[child].obj.ob_next = dst;
	}
}

/* -------------------------------------------------------------------------- */

void pack_ob(Obj_Head *obj)
{
	OBJ_ENTRY *tree;
	int i, count;
	
	tree = obj->object;
	count = (int)(obj->used / sizeof(*tree));
	for (i = 0; i < count; i++)
	{
		if (tree[i].obj.ob_type == (uint16)-1)
		{
			do
			{
				--count;
				obj->used -= sizeof(*tree);
				if (i >= count)
					return;
			} while (tree[count].obj.ob_type == (uint16)-1);
			moveto_ob(tree, count, i);
		}
	}
}

/* -------------------------------------------------------------------------- */

void unlink_ob(OBJ_ENTRY *tree, int16 obnr)
{
	short head;
	int16 x, y;
	int16 child;
	int16 prev;
	int16 next;
	int16 last;
	
	head = tree[obnr].obj.ob_head;
	if (obnr == ROOT)
	{
		if (head > 0 && tree[ROOT].obj.ob_tail == head)
		{
			memcpy(&tree[ROOT], &tree[head], sizeof(*tree));
			tree[head].obj.ob_type = -1;
			tree[ROOT].obj.ob_next = NIL;
			tree[ROOT].obj.ob_x = 0;
			tree[ROOT].obj.ob_y = 0;
			if (tree[ROOT].obj.ob_tail > 0)
				tree[tree[ROOT].obj.ob_tail].obj.ob_next = ROOT;
		}
	} else
	{
		if (head < 0)
		{
			free_ob(tree, obnr);
		} else
		{
			x = tree[obnr].obj.ob_x;
			y = tree[obnr].obj.ob_y;
			child = head;
			do
			{
				tree[child].obj.ob_x += x;
				tree[child].obj.ob_y += y;
				child = tree[child].obj.ob_next;
			} while (child != obnr);
			prev = obnr;
			next = tree[prev].obj.ob_next;
			child = next;
			while (tree[next].obj.ob_tail != prev)
			{
				prev = next;
				next = tree[prev].obj.ob_next;
			}
			last = tree[next].obj.ob_head;
			if (last == obnr)
			{
				tree[next].obj.ob_head = head;
			} else
			{
				while (tree[last].obj.ob_next != obnr)
				{
					last = tree[last].obj.ob_next;
				}
				tree[last].obj.ob_next = head;
			}
			last = tree[obnr].obj.ob_tail;
			tree[last].obj.ob_next = child;
			if (child == next)
				tree[next].obj.ob_tail = tree[obnr].obj.ob_tail;
		}
	}
}

/* -------------------------------------------------------------------------- */

static void rob(OBJ_ENTRY *objtree, int16 obnr, int16 w, int16 h, OBJECT *tree)
{
	OBJ_ENTRY *objentry;
	OBJECT *obj;
	OBJECT *obj1;
	int16 x;
	int16 idx;
	
	objentry = objtree + obnr;
	if ((objentry->obj.ob_state & (AOS_CLTOP | AOS_CLBOTTOM | AOS_CLLEFT | AOS_CLRIGHT)) == 0)
		return;
	idx = obnr * 3 + 1;
	obj = &tree[idx];
	obj1 = obj + 1;

	if (objentry->obj.ob_state & AOS_CLLEFT)
	{
		objentry->obj.ob_x = x = char_x(pixel_x(objentry->obj.ob_x) + w);
		obj1->ob_x = obj->ob_x = pixel_x(x);
		if (!(objentry->obj.ob_state & AOS_CLRIGHT))
		{
			objentry->obj.ob_width = x = char_x(pixel_x(objentry->obj.ob_width) - w);
			obj1->ob_width = obj->ob_width = pixel_x(x);
		}
	} else
	{
		if (objentry->obj.ob_state & AOS_CLRIGHT)
		{
			objentry->obj.ob_width = x = char_x(pixel_x(objentry->obj.ob_width) + w);
			obj1->ob_width = obj->ob_width = pixel_x(x);
		}
	}

	if (objentry->obj.ob_state & AOS_CLTOP)
	{
		objentry->obj.ob_y = x = char_y(pixel_y(objentry->obj.ob_y) + h);
		obj1->ob_y = obj->ob_y = pixel_y(x);
		if (!(objentry->obj.ob_state & AOS_CLBOTTOM))
		{
			objentry->obj.ob_height = x = char_y(pixel_y(objentry->obj.ob_height) - h);
			obj1->ob_height = obj->ob_height = pixel_y(x);
		}
	} else
	{
		if (objentry->obj.ob_state & AOS_CLBOTTOM)
		{
			objentry->obj.ob_height = x = char_y(pixel_y(objentry->obj.ob_height) + h);
			obj1->ob_height = obj->ob_height = pixel_y(x);
		}
	}

	if ((objentry->obj.ob_state & (AOS_CLTOP | AOS_CLBOTTOM | AOS_CLLEFT | AOS_CLRIGHT)) != (AOS_CLTOP | AOS_CLBOTTOM | AOS_CLLEFT | AOS_CLRIGHT))
		resize_ob(objtree, obnr, w, h, tree);
}

/* -------------------------------------------------------------------------- */

void resize_ob(OBJ_ENTRY *objtree, int16 obnr, int16 w, int16 h, OBJECT *tree)
{
	int16 child;
	
	child = objtree[obnr].obj.ob_head;
	if (child >= 0 && (w != 0 || h != 0))
	{
		while (child != obnr)
		{
			rob(objtree, child, w, h, tree);
			child = objtree[child].obj.ob_next;
		}
	}
}
