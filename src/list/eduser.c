#include "acs_i.h"
#include "acs_uo.h"

static Obj_Head *copy_user(ACS_HEAD *acs, const Obj_Head *src);
static OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_user = {
	NULL,
	NULL,
	&WI_USER,
	us_list,
	us_name,
	LIST_USERBLK,
	NULL,
	copy_user,
	del_user,
	new_work,
	NULL
};

static char bubble_string[258];
static int bubble_len = (int)sizeof(bubble_string);
static char context_string[258];
static int context_len = (int)sizeof(context_string);

static Obj_Head call = { NULL, NULL, 0, 0, 0, NULL, "", 1, 3, { 0, 0, 0, 0 } };
static Obj_Head parm = { NULL, NULL, 0, 0, 0, NULL, "", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head serv = { NULL, NULL, 0, 0, 0, NULL, "", 1, 4, { 0, 0, 0, 0 } };
static Obj_Head ptr1 = { NULL, NULL, 0, 0, 0, NULL, "", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head ptr2 = { NULL, NULL, 0, 0, 0, NULL, "", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head ptr3 = { NULL, NULL, 0, 0, 0, NULL, "", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head bubble = { NULL, bubble_string, 0, 0, 0, NULL, "BUBBLE_01", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head context = { NULL, context_string, 0, 0, 0, NULL, "CONTEXT_01", 1, 0, { 0, 0, 0, 0 } };

static AUSERBLK us_blk = { (void *)&call, (long)&parm, NULL, NULL, NULL, NULL, (char *)&bubble, (char *)&context };
static Obj_Head new_user = {
	NULL,
	&us_blk,
	0,
	sizeof(us_blk),
	sizeof(us_blk),
	NULL,
	"USERBLK_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static Obj_Head *add_2ref(ACS_HEAD *acs, Obj_Head *obj)
{
	if (obj == NULL)
		return NULL;
	return add_ref(acs, obj);
}

/* -------------------------------------------------------------------------- */

static void del_2ref(ACS_HEAD *acs, Obj_Head *obj)
{
	if (obj != NULL)
		del_ref(acs, obj);
}

/* -------------------------------------------------------------------------- */

static Obj_Head *add_3ref(ACS_HEAD *acs, Obj_Head *obj, int16 type)
{
	if (obj != NULL)
	{
		switch (type & 3)
		{
		case REF_PAR:
			return add_ref(acs, obj);
		case STR_PAR:
			return add_string(acs, obj);
		case DATA_PAR:
			return add_data(acs, obj);
		}
	}
	return NULL;
}

/* -------------------------------------------------------------------------- */

static void del_3ref(ACS_HEAD *acs, Obj_Head *obj, int16 type)
{
	if (obj != NULL)
	{
		switch (type & 3)
		{
		case REF_PAR:
			del_ref(acs, obj);
			break;
		case STR_PAR:
			del_string(acs, obj);
			break;
		case DATA_PAR:
			del_data(acs, obj);
			break;
		}
	}
}

/* -------------------------------------------------------------------------- */

static boolean comp_it(Obj_Head *obj1, Obj_Head *obj2)
{
	if (obj1 == NULL && obj2 == NULL)
		return TRUE;
	if (obj1 == NULL || obj2 == NULL)
		return FALSE;
	return strcmp(obj1->label, obj2->label) == 0;
}

/* -------------------------------------------------------------------------- */

static boolean comp2_it(Obj_Head *obj1, Obj_Head *obj2, int16 type)
{
	if (obj1 == NULL && obj2 == NULL)
		return TRUE;
	if (obj1 != NULL && obj2 != NULL)
	{
		switch (type & 3)
		{
		case NONE_PAR:
		case REF_PAR:
			return strcmp(obj1->label, obj2->label) == 0;
		case STR_PAR:
		case DATA_PAR:
			return obj1->used == obj2->used && memcmp(obj1->object, obj2->object, obj1->used) == 0;
		}
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

Obj_Head *add_user(ACS_HEAD *acs, Obj_Head *obj)
{
	int i, count;
	Obj_Head **items;
	Obj_Head *item;
	AUSERBLK *user1;
	AUSERBLK *user2;
	Obj_Head *list;
	int16 type;
	
	acs->flags |= ACS_CHANGED;
	list = acs->us_list;
	items = list->object;
	user1 = obj->object;
	type = obj->flags & 0xff;
	if ((ACSblk->ev_mmokstate & (K_LSHIFT | K_CTRL)) != (K_LSHIFT | K_CTRL))
	{
		count = (int)(list->used / sizeof(*items));
		for (i = 0; i < count; i++)
		{
			item = items[i];
			user2 = item->object;
			if ((item->flags & 0xff) == type &&
				strcmp(((Obj_Head *)user2->ub_code)->label, ((Obj_Head *)user1->ub_code)->label) == 0 &&
				strcmp(((Obj_Head *)user2->ub_parm)->label, ((Obj_Head *)user1->ub_parm)->label) == 0 &&
				comp_it((Obj_Head *)user2->ub_serv, (Obj_Head *)user1->ub_serv) &&
				comp2_it((Obj_Head *)user2->ub_ptr1, (Obj_Head *)user1->ub_ptr1, type) &&
				comp2_it((Obj_Head *)user2->ub_ptr2, (Obj_Head *)user1->ub_ptr2, type >> 2) &&
				comp2_it((Obj_Head *)user2->ub_ptr3, (Obj_Head *)user1->ub_ptr3, type >> 4) &&
				comp2_it((Obj_Head *)user2->bubble, (Obj_Head *)user1->bubble, STR_PAR) &&
				comp2_it((Obj_Head *)user2->context, (Obj_Head *)user1->context, STR_PAR))
			{
				item->usage += 1;
				return item;
			}
		}
	}
	
	if ((item = copy_user(acs, obj)) == NULL)
		return NULL;
	objname(acs, item, obj->label, list_user.asktitle);
	add_entry(acs->us_list, item);
	return item;
}

/* -------------------------------------------------------------------------- */

void del_user(ACS_HEAD *acs, Obj_Head *obj)
{
	AUSERBLK *user;
	
	acs->flags |= ACS_CHANGED;
	obj->usage -= 1;
	if (obj->usage <= 0)
	{
		user = obj->object;
		del_ref(acs, (Obj_Head *)user->ub_code);
		del_ref(acs, (Obj_Head *)user->ub_parm);
		del_2ref(acs, (Obj_Head *)user->ub_serv);
		del_3ref(acs, (Obj_Head *)user->ub_ptr1, obj->flags);
		del_3ref(acs, (Obj_Head *)user->ub_ptr2, obj->flags >> 2);
		del_3ref(acs, (Obj_Head *)user->ub_ptr3, obj->flags >> 4);
		del_3ref(acs, (Obj_Head *)user->bubble, STR_PAR);
		del_3ref(acs, (Obj_Head *)user->context, STR_PAR);
		del_entry(acs->us_list, obj);
		objfree(acs, obj);
	}
}

/* -------------------------------------------------------------------------- */

static Obj_Head *copy_user(ACS_HEAD *acs, const Obj_Head *src)
{
	Obj_Head *newobj;
	AUSERBLK *newuser;
	const AUSERBLK *srcuser;
	
	newobj = objmalloc(acs, sizeof(*newuser));
	if (newobj == NULL)
		return NULL;
	srcuser = src->object;
	newuser = newobj->object;
	newobj->used = sizeof(*newuser);
	newobj->flags = src->flags;
	newuser->ub_code = (void *)add_ref(acs, (Obj_Head *)srcuser->ub_code);
	newuser->ub_parm = (long)add_ref(acs, (Obj_Head *)srcuser->ub_parm);
	newuser->ub_serv = (void *)add_2ref(acs, (Obj_Head *)srcuser->ub_serv);
	newuser->ub_ptr1 = (void *)add_3ref(acs, (Obj_Head *)srcuser->ub_ptr1, src->flags);
	newuser->ub_ptr2 = (void *)add_3ref(acs, (Obj_Head *)srcuser->ub_ptr2, src->flags >> 2);
	newuser->ub_ptr3 = (void *)add_3ref(acs, (Obj_Head *)srcuser->ub_ptr3, src->flags >> 4);
	newuser->bubble = (void *)add_3ref(acs, (Obj_Head *)srcuser->bubble, STR_PAR);
	newuser->context = (void *)add_3ref(acs, (Obj_Head *)srcuser->context, STR_PAR);
	
	return newobj;
}

/* -------------------------------------------------------------------------- */

static void set_udftype(Obj_Head *obj, int16 type, char *label, size_t size, void **ret)
{
	switch (type)
	{
	case REF_PAR:
		strncpy(obj->label, label, 31);
		obj->object = NULL;
		obj->used = obj->size = 0;
		*ret = obj;
		break;
	case STR_PAR:
		strcpy(obj->label, "TEXT_01");
		obj->used = obj->size = strlen(label) + 1;
		obj->object = label;
		*ret = obj;
		break;
	case DATA_PAR:
		strcpy(obj->label, "DATAS_01");
		obj->used = obj->size = size;
		obj->object = label;
		*ret = obj;
		break;
	default:
		*ret = NULL;
		break;
	}
}

/* -------------------------------------------------------------------------- */

static int16 set_usertype(ACS_HEAD *acs, Obj_Head *obj, char *label, void **ret)
{
	Obj_Head *item;
	
	if (*label != '\0')
	{
		item = find_entry(acs->st_list, label);
		if (item != NULL)
		{
			*ret = item;
			return STR_PAR;
		}
		item = find_entry(acs->if_list, label);
		if (item != NULL)
		{
			*ret = item;
			return DATA_PAR;
		}
		item = find_entry(acs->rf_list, label);
		if (item != NULL)
		{
			*ret = item;
			return REF_PAR;
		}
		strcpy(obj->label, label);
		*ret = obj;
		return REF_PAR;
	}
	*ret = NULL;
	return NONE_PAR;
}

/* -------------------------------------------------------------------------- */

Obj_Head *change_user(ACS_HEAD *acs, Obj_Head *obj, char *str[8])
{
	Obj_Head *item;
	
	strupr(strncat(strcpy(new_user.label, str[0]), "01", 31));
	strcpy(call.label, str[0]);
	strcpy(parm.label, str[1]);
	if (str[2][0] != '\0')
	{
		strncpy(serv.label, str[2], 31);
		serv.label[32] = '\0'; /* BUG: will write beyond end of buffer */
		us_blk.ub_serv = (void *)&serv;
	} else
	{
		us_blk.ub_serv = NULL;
	}
	new_user.flags = set_usertype(acs, &ptr1, str[3], &us_blk.ub_ptr1) |
	                 (set_usertype(acs, &ptr2, str[4], &us_blk.ub_ptr2) << 2) |
	                 (set_usertype(acs, &ptr3, str[5], &us_blk.ub_ptr3) << 4);
	if (!Ast_isEmpty(str[6]))
	{
		strncpy(bubble.object, str[6], bubble_len);
		((char *)bubble.object)[bubble_len] = '\0'; /* BUG: will write beyond end of buffer */
		us_blk.bubble = (char *)&bubble;
	} else
	{
		us_blk.bubble = NULL;
	}
	if (!Ast_isEmpty(str[7]))
	{
		strncpy(context.object, str[6], context_len);
		((char *)context.object)[context_len] = '\0'; /* BUG: will write beyond end of buffer */
		us_blk.context = (char *)&context;
	} else
	{
		us_blk.context = NULL;
	}
	item = add_user(acs, &new_user);
	if (item != NULL)
		del_user(acs, obj);
	return item;
}

/* -------------------------------------------------------------------------- */

static void chgadd_3ref(ACS_HEAD *acs, void **ref, int16 oldtype, int16 newtype, Obj_Head *obj)
{
	Obj_Head *item;
	
	item = NULL;
	if (obj != NULL)
	{
		switch (newtype & 3)
		{
		case REF_PAR:
			item = add_ref(acs, obj);
			break;
		case STR_PAR:
			if (*ref == NULL)
				item = add_string(acs, obj);
			else
				item = change_string(acs, *ref, obj->object);
			break;
		case DATA_PAR:
			item = add_data(acs, obj);
			break;
		}
	}
	if (*ref != NULL && *ref != item)
		del_3ref(acs, *ref, oldtype);
	*ref = item;
}

/* -------------------------------------------------------------------------- */

void change_udf(ACS_HEAD *acs, Obj_Head *obj, AUSER_DEF *def)
{
	Obj_Head *item;
	Obj_Head **items;
	char *label;
	
	items = obj->object;
	acs->flags |= ACS_CHANGED;
	label = items[0]->label;
	strupr(strncat(strcpy(new_user.label, label), "01", 31));
	strcpy(call.label, label);
	strcpy(parm.label, def->parm);
	
	if (!Ast_isEmpty(def->serv))
	{
		strcpy(serv.label, def->serv);
		us_blk.ub_serv = (void *)&serv;
	} else
	{
		us_blk.ub_serv = NULL;
	}

	new_user.flags = (def->type2 << 2) | (def->type1) | (def->type3 << 4);
	set_udftype(&ptr1, def->type1, def->data1, def->len1, &us_blk.ub_ptr1);
	set_udftype(&ptr2, def->type2, def->data2, def->len2, &us_blk.ub_ptr2);
	set_udftype(&ptr3, def->type3, def->data3, def->len3, &us_blk.ub_ptr3);
	
	if (!Ast_isEmpty(def->bubble))
	{
		strncpy(bubble.object, def->bubble, bubble_len - 1);
		((char *)bubble.object)[bubble_len] = '\0'; /* BUG: will write beyond end of buffer */
		bubble.size = bubble.used = strlen(bubble.object) + 1;
		us_blk.bubble = (char *)&bubble;
	} else
	{
		us_blk.bubble = NULL;
	}
	if (!Ast_isEmpty(def->context))
	{
		strncpy(context.object, def->context, context_len - 1);
		((char *)context.object)[context_len] = '\0'; /* BUG: will write beyond end of buffer */
		context.size = context.used = strlen(context.object) + 1;
		us_blk.context = (char *)&context;
	} else
	{
		us_blk.context = NULL;
	}
	
	item = items[0];
	items[0] = add_ref(acs, &call);
	if (items[0] != NULL)
		del_ref(acs, item);
	else
		items[0] = item;
	
	item = items[1];
	items[1] = add_ref(acs, &parm);
	if (items[1] != NULL)
		del_ref(acs, item);
	else
		items[1] = item;
	
	if (us_blk.ub_serv != NULL)
	{
		item = items[2];
		items[2] = add_2ref(acs, &serv);
		if (items[2] != NULL)
			del_2ref(acs, item);
		else
			items[2] = item;
	}
	
	chgadd_3ref(acs, (void **)&items[3], obj->flags,      new_user.flags,      (Obj_Head *)us_blk.ub_ptr1);
	chgadd_3ref(acs, (void **)&items[4], obj->flags >> 2, new_user.flags >> 2, (Obj_Head *)us_blk.ub_ptr2);
	chgadd_3ref(acs, (void **)&items[5], obj->flags >> 4, new_user.flags >> 4, (Obj_Head *)us_blk.ub_ptr3);
	chgadd_3ref(acs, (void **)&items[6], STR_PAR, STR_PAR, (Obj_Head *)us_blk.bubble);
	chgadd_3ref(acs, (void **)&items[7], STR_PAR, STR_PAR, (Obj_Head *)us_blk.context);
	obj->flags = (obj->flags & ~0x3f) | (new_user.flags & 0x3f);
}

/* -------------------------------------------------------------------------- */

static OBJECT *new_work(Obj_Head *objlist)
{
	return work_icon(objlist, WI_USER.iconblk, LIST_USERBLK);
}
