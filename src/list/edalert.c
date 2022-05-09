#include "acs_i.h"

static Obj_Head protoalert = {
		NULL,
		proto_alert,
		0,
		sizeof(proto_alert),
		sizeof(proto_alert),
		NULL,
		"ALERTBOX_01",
		1,
		0,
		{ 0, 0, 0, 0 }
};

static OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_alert = {
		NULL,
		NULL,
		&WI_ALERT,
		al_list,
		al_name,
		LIST_ALERT,
		&protoalert,
		copy_alert,
		del_alert,
		new_work,
		serv_alert
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void del_alert(ACS_HEAD *acs, Obj_Head *str)
{
	Awindow *win;
	
	acs->flags |= ACS_CHANGED;
	str->usage -= 1;
	if (str->usage <= 0)
	{
		win = str->window;
		if (win != NULL)
			win->service(win, AS_TERM, NULL);
		del_entry(acs->al_list, str);
		objfree(acs, str);
		serv_alert(acs, LS_DELETEOBJ, str);
	}
}

/* -------------------------------------------------------------------------- */

Obj_Head *copy_alert(ACS_HEAD *acs, const Obj_Head *str)
{
	Obj_Head *newobj;
	
	acs->flags |= ACS_CHANGED;
	if ((newobj = objmalloc(acs, str->size)) == NULL)
		return NULL;
	strcpy(newobj->object, str->object);
	newobj->used = str->used;
	return newobj;
}

/* -------------------------------------------------------------------------- */

boolean serv_alert(ACS_HEAD *acs, int16 task, Obj_Head *str)
{
	Obj_Head proto = { NULL, NULL, 0, 0, 0, NULL, "                               ", 1, 0, { 0, 0, 0, 0, } };
	int i, j, alcount, mlcount;
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
			mlstr = copy_alert(acs, &proto);
			if (mlstr == NULL)
				return FALSE;
			sprintf(mlstr->label, "%.28s\001%d\001", str->label, i);
			objname(acs, mlstr, mlstr->label, NULL);
			if (add_entry(acs->mlal_list[i], mlstr) == FAIL)
				return FALSE;
		}
		break;
	
	case LS_CHANGEOBJ:
		alcount = (int)(acs->al_list->used / sizeof(Obj_Head *));
		mlcount = (int)(acs->mlal_list[0]->used / sizeof(Obj_Head *));
		mllist = acs->mlal_list[0];
		mlentries = mllist->object;
		entries = acs->al_list->object;
		/* BUG? mlcount overwritten */
		for (mlcount = 0; mlcount < alcount; mlcount++)
		{
			entries[mlcount]->label[29] = '\0';
		}
		for (j = 0; j < mlcount; j++)
		{
			label[0] = '\0';
			ptr = strncat(label, mlentries[j]->label, 28);
			do
			{
				ptr = strchr(label, '\001');
				if (ptr != NULL && ptr[2] == '\001')
					*ptr = '\0';
			} while (ptr != NULL && *ptr != '\0');
			for (i = 0; i < alcount; i++)
			{
				if (strcmp(entries[i]->label, label) == 0)
					break;
			}
			if (i == alcount)
				break;
		}
		if (j < mlcount)
		{
			for (i = 0; i < MAX_LANGS; i++)
			{
				mllist = acs->mlal_list[i];
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
			mlcount = (int)(acs->mlal_list[i]->used / sizeof(Obj_Head *));
			mllist = acs->mlal_list[i];
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

static OBJECT *new_work(Obj_Head *objlist)
{
	return work_icon(objlist, WI_ALERT.iconblk, LIST_ALERT);
}
