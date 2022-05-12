#include "acs_i.h"

#ifndef C_UNION
#  define C_UNION(x) { (int32)(x) }
#endif

static struct {
	OBJECT inner;
	AOBJECT pra00;
} inner = {
	{ -1, -1, -1, G_BOX, 0x1800, 0x0000, C_UNION(0x00001101L), 0, 0, 100, 100 },
	{ NULL, NULL, AEO | OF_LASTOB, 0, NULL, NULL, 0, 0 }
};
static struct {
	OBJECT proto;
	AOBJECT pra04;
} proto = {
	{ 0, -1, -1, G_STRING, 0x2005, 0x0000, C_UNION(NULL), 2, 0x0400, 46, 1 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, LIST_STRING }
};
static Obj_Head protostring = {
	NULL,
	proto_string,
	0,
	sizeof(proto_string),
	sizeof(proto_string),
	NULL,
	"TEXT_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

static OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_string = {
	NULL,
	NULL,
	&WI_STRING,
	st_list,
	st_name,
	LIST_STRING,
	&protostring,
	copy_str,
	del_string,
	new_work,
	serv_str
};

static Obj_Head free_string = {
	NULL,
	NULL,
	0,
	0,
	0,
	NULL,
	"TEXT_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

Obj_Head *add_string(ACS_HEAD *acs, Obj_Head *str)
{
	Obj_Head *list;
	Obj_Head **entries;
	Obj_Head **mlentries;
	int i, count;
	int l;
	Obj_Head *entry;
	
	if (str == NULL)
		return NULL;
	if (str->object == NULL)
		return NULL;
	acs->flags |= ACS_CHANGED;
	list = acs->st_list;
	entries = list->object;
	if ((ACSblk->ev_mmokstate & (K_LSHIFT | K_CTRL)) != (K_LSHIFT | K_CTRL))
	{
		count = (int)(list->used / sizeof(*entries));
		for (i = 0; i < count; i++)
		{
			entry = entries[i];
			if (strcmp(entry->object, str->object) == 0)
			{
				for (l = 0; l < MAX_LANGS; l++)
				{
					mlentries = acs->mlst_list[l]->object;
					if (strcmp(mlentries[i]->object, entry->object) != 0)
						break;
				}
				if (l == MAX_LANGS)
				{
					entry->usage += 1;
					return entry;
				}
				for (l = 0; l < MAX_LANGS; l++)
				{
					mlentries = acs->mlst_list[l]->object;
					if (strlen(mlentries[i]->object) != 0)
						break;
				}
				if (l == MAX_LANGS)
				{
					entry->usage += 1;
					return entry;
				}
			}
		}
	}
	
	entry = copy_str(acs, str);
	if (entry == NULL)
		return NULL;
	objname(acs, entry, str->label, list_string.asktitle);
	if (add_entry(list, entry) == FAIL)
		return NULL;
	serv_str(acs, LS_CREATEOBJ, entry);
	return entry;
}

/* -------------------------------------------------------------------------- */

Obj_Head *change_string(ACS_HEAD *acs, Obj_Head *obj, const char *str)
{
	int len;
	void *oldobject;
	
	if (obj == NULL)
		return NULL;
	acs->flags |= ACS_CHANGED;
	len = (int)strlen(str) + 1;
	if (len <= (long)obj->size)
	{
		strcpy(obj->object, str);
		obj->used = len;
	} else
	{
		oldobject = obj->object;
		obj->object = Ast_create(str);
		if (obj->object == NULL)
		{
			obj->object = oldobject;
		} else
		{
			Ax_free(oldobject);
			obj->used = obj->size = len;
		}
	}
	if (acs->st_list->window != NULL)
		acs->st_list->window->state |= AWS_LATEUPDATE;
	return obj;
}

/* -------------------------------------------------------------------------- */

void del_string(ACS_HEAD *acs, Obj_Head *str)
{
	Awindow *win;
	
	acs->flags |= ACS_CHANGED;
	str->usage -= 1;
	if (str->usage > 0)
		return;
	win = str->window;
	if (win != NULL)
		win->service(win, AS_TERM, NULL);
	del_entry(acs->st_list, str);
	objfree(acs, str);
	serv_str(acs, LS_DELETEOBJ, str);
}

/* -------------------------------------------------------------------------- */

Obj_Head *dup_string(ACS_HEAD *acs, const char *str)
{
	free_string.object = NO_CONST(str);
	free_string.used = free_string.size = strlen(str) + 1;
	return add_string(acs, &free_string);
}

/* -------------------------------------------------------------------------- */

boolean serv_str(ACS_HEAD *acs, int16 task, Obj_Head *str)
{
	Obj_Head proto = { NULL, NULL, 0, 0, 0, NULL, "                               ", 1, 0, { 0, 0, 0, 0, } };
	int i, j, stcount, mlcount;
	Obj_Head *entry;
	char *ptr;
	Obj_Head *mlstr;
	Obj_Head *mllist;
	Obj_Head **mlentries;
	Obj_Head **entries;
	char label[32];
	
	switch (task)
	{
	case LS_CREATEOBJ:
		for (i = 0; i < MAX_LANGS; i++)
		{
			proto.object = str->object;
			proto.used = proto.size = str->size;
			mlstr = copy_str(acs, &proto);
			if (mlstr == NULL)
				return FALSE;
			sprintf(mlstr->label, "%.28s\001%d\001", str->label, i);
			objname(acs, mlstr, mlstr->label, NULL);
			if (add_entry(acs->mlst_list[i], mlstr) == FAIL)
				return FALSE;
		}
		break;
	
	case LS_CHANGEOBJ:
		stcount = (int)(acs->st_list->used / sizeof(Obj_Head *));
		mlcount = (int)(acs->mlst_list[0]->used / sizeof(Obj_Head *));
		mllist = acs->mlst_list[0];
		mlentries = mllist->object;
		entries = acs->st_list->object;
		/* BUG? mlcount overwritten */
		for (mlcount = 0; mlcount < stcount; mlcount++)
		{
			entries[mlcount]->label[LABEL_MAX - 3] = '\0';
		}
		for (j = 0; j < mlcount; j++)
		{
			label[0] = '\0';
			ptr = strncat(label, mlentries[j]->label, LABEL_MAX - 4);
			do
			{
				ptr = strchr(label, '\001');
				if (ptr != NULL && ptr[2] == '\001')
					*ptr = '\0';
			} while (ptr != NULL && *ptr != '\0');
			for (i = 0; i < stcount; i++)
			{
				if (strcmp(entries[i]->label, label) == 0)
					break;
			}
			if (i == stcount)
				break;
		}
		if (j < mlcount)
		{
			for (i = 0; i < MAX_LANGS; i++)
			{
				mllist = acs->mlst_list[i];
				mlentries = mllist->object;
				entry = mlentries[j];
				sprintf(entry->label, "%.28s\001%d\001", str->label, i);
				objname(acs, entry, entry->label, NULL);
				del_entry(mllist, entry);
				add_entry(mllist, entry);
			}
		}
		break;
	
	case LS_DELETEOBJ:
		for (i = 0; i < MAX_LANGS; i++)
		{
			mlcount = (int)(acs->mlst_list[i]->used / sizeof(Obj_Head *));
			mllist = acs->mlst_list[i];
			mlentries = mllist->object;
			sprintf(label, "%.28s\001%d\001", str->label, i);
			for (j = 0; j < mlcount; j++)
			{
				mlstr = mlentries[j];
				if (strcmp(label, mlstr->label) == 0)
				{
					del_entry(mllist, mlstr);
					objfree(acs, mlstr);
					break;
				}
			}
		}
		break;
	
	default:
		return FALSE;
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

Obj_Head *copy_str(ACS_HEAD *acs, const Obj_Head *str)
{
	Obj_Head *newobj;
	
	acs->flags |= ACS_CHANGED;
	newobj = objmalloc(acs, str->size);
	if (newobj == NULL)
		return NULL;
	strcpy(newobj->object, str->object);
	newobj->size = /* FIXME: already done by objmalloc */ newobj->used = str->used;
	return newobj;
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
	tree = Ax_malloc(count * (sizeof(proto) + LABEL_MAX + 14) + sizeof(inner));
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
			strncpy(labels, entry->label, 12); /* BUG: strncpy does not always zero-terminate */
			strcat(labels, "            ");
			labels[12] = ' ';
			strncpy(&labels[13], entry->object, LABEL_MAX);
			labels[LABEL_MAX + 13] = '\0';
			labels += LABEL_MAX + 14;
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
