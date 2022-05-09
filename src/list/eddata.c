#include "acs_i.h"

static Obj_Head protodata = {
	NULL,
	NULL,
	0,
	0,
	0,
	NULL,
	"DATAS_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

static Obj_Head *copy_data(ACS_HEAD *acs, const Obj_Head *data);
static OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_data = {
	NULL,
	NULL,
	&WI_DATA,
	if_list,
	if_name,
	LIST_DATA,
	&protodata,
	copy_data,
	del_data,
	new_work,
	NULL
};

static Obj_Head free_data = {
	NULL,
	NULL,
	0,
	0,
	0,
	NULL,
	"DATAS_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

Obj_Head *add_data(ACS_HEAD *acs, Obj_Head *data)
{
	Obj_Head *list;
	Obj_Head *newdata;
	
	list = acs->if_list;
	acs->flags |= ACS_CHANGED;
	if (refimages && find_entry(list, data->label) == data)
	{
		data->usage++;
		return data;
	}
	if (objextent(list, sizeof(Obj_Head *)) != OK ||
		(newdata = copy_data(acs, data)) == NULL)
		return NULL;
	objname(acs, newdata, data->label, list_data.asktitle);
	add_entry(list, newdata);
	return newdata;
}

/* -------------------------------------------------------------------------- */

static Obj_Head *copy_data(ACS_HEAD *acs, const Obj_Head *data)
{
	Obj_Head *newdata;
	void *src;
	void *dst;
	
	newdata = objmalloc(acs, data->used);
	if (newdata == NULL)
		return NULL;
	newdata->used = data->used;
	src = data->object;
	dst = newdata->object;
	memcpy(dst, src, data->used);
	return newdata;
}

/* -------------------------------------------------------------------------- */

Obj_Head *dup_data(ACS_HEAD *acs, void *data, size_t size)
{
	free_data.object = data;
	free_data.size = size;
	free_data.used = size;
	return add_data(acs, &free_data);
}

/* -------------------------------------------------------------------------- */

void del_data(ACS_HEAD *acs, Obj_Head *data)
{
	Awindow *win;
	
	acs->flags |= ACS_CHANGED;
	data->usage--;
	if (data->usage <= 0)
	{
		win = data->window;
		if (win != NULL)
			win->service(win, AS_TERM, NULL);
		del_entry(acs->if_list, data);
		objfree(acs, data);
	}
}

/* -------------------------------------------------------------------------- */

static OBJECT *new_work(Obj_Head *objlist)
{
	return work_icon(objlist, WI_DATA.iconblk, LIST_DATA);
}
