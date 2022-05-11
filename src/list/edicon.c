#include "acs_i.h"

static Obj_Head astring = {
	NULL,
	"CICON",
	0,
	sizeof("CICON"),
	sizeof("CICON"),
	NULL,
	"TEXT_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};
#define ICON_W 48
#define ICON_H 24
static struct {
	ACSCICONBLK cicon;
	int16 iconmask[((ICON_W / 8) * ICON_H) / 2];
	int16 icondata[((ICON_W / 8) * ICON_H) / 2];
} iconblk_obj = {
	{
		{ {
			(int16 *)sizeof(ACSCICONBLK), /* offset to mask */
			(int16 *)(sizeof(ACSCICONBLK) + (ICON_W / 8) * ICON_H), /* offset to data */
			(char *)&astring, 0x1041, 0, 0, 0, 0, ICON_W, ICON_H, 0, 24, 48, 8 }, NULL },
		{ 0, NULL, NULL, NULL, NULL, NULL },
		{ 0, NULL, NULL, NULL, NULL, NULL },
	},
	{
		0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff,
		0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff,
		0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00,
		0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff,
		0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff,
		0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00, 0x0fff, 0xffff, 0xfff0,
		0x0fff, 0xffff, 0xfff0, 0x0fff, 0xffff, 0xfff0, 0x0fff, 0xffff,
		0xfff0, 0x0fff, 0xffff, 0xfff0, 0x0fff, 0xffff, 0xfff0, 0x0fff,
		0xffff, 0xfff0, 0x0fff, 0xffff, 0xfff0, 0x0000, 0x0000, 0x0000
	},
	{
		0x00ff, 0xffff, 0xfe00, 0x00c0, 0x0000, 0x0600, 0x00c0, 0x7fff,
		0x8600, 0x00c0, 0xc000, 0x8600, 0x00c1, 0x4000, 0x8600, 0x00c3,
		0xc000, 0x8600, 0x00c2, 0x0000, 0x8600, 0x00c2, 0x0000, 0x8600,
		0x00c2, 0x0000, 0x8600, 0x00c2, 0x0000, 0x8600, 0x00c2, 0x0000,
		0x8600, 0x00c2, 0x0000, 0x8600, 0x00c2, 0x0000, 0x8600, 0x00c2,
		0x0000, 0x8600, 0x00c2, 0x0000, 0x8600, 0x0fc3, 0xffff, 0x87f0,
		0x0c00, 0x0000, 0x0030, 0x0c1c, 0xf9f9, 0x8830, 0x0c08, 0x8109,
		0x4830, 0x0c08, 0x8109, 0x2830, 0x0c1c, 0xf9f9, 0x1830, 0x0c00,
		0x0000, 0x0030, 0x0fff, 0xffff, 0xfff0, 0x0000, 0x0000, 0x0000
	}
};

static Obj_Head protoicon = {
	NULL,
	&iconblk_obj,
	0,
	sizeof(iconblk_obj),
	sizeof(iconblk_obj),
	NULL,
	"ICON_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

static Obj_Head *copy_icon(ACS_HEAD *acs, const Obj_Head *src);
static OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_icon = {
	NULL,
	NULL,
	&WI_ICON,
	ic_list,
	ic_name,
	LIST_ICON,
	&protoicon,
	copy_icon,
	del_icon,
	new_work,
	NULL
};
static ACSCICONBLK my_icon = {
	{ { NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, NULL },
	{ 0, NULL, NULL, NULL, NULL, NULL },
	{ 0, NULL, NULL, NULL, NULL, NULL }
};
static Obj_Head free_icon = {
	NULL,
	&my_icon,
	0,
	0,
	0,
	NULL,
	"ICON_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

Obj_Head *add_icon(ACS_HEAD *acs, Obj_Head *icon)
{
	Obj_Head *objlist;
	Obj_Head *newicon;
	
	objlist = acs->ic_list;
	acs->flags |= ACS_CHANGED;
	if (refimages && (ACSblk->ev_mmokstate & (K_LSHIFT | K_CTRL)) != (K_LSHIFT | K_CTRL))
	{
		if (find_entry(objlist, icon->label) == icon)
		{
			icon->usage++;
			return icon;
		}
	}
	if (objextent(objlist, sizeof(Obj_Head *)) != OK ||
		(newicon = copy_icon(acs, icon)) == NULL)
		return NULL;
	objname(acs, newicon, icon->label, list_icon.asktitle);
	add_entry(objlist, newicon);
	return newicon;
}

/* -------------------------------------------------------------------------- */

static Obj_Head *copy_icon(ACS_HEAD *acs, const Obj_Head *src)
{
	Obj_Head *newicon;
	ACSCICONBLK *srcicon;
	ACSCICONBLK *icon;
	
	newicon = objmalloc(acs, src->used);
	if (newicon == NULL)
		return NULL;
	newicon->used = src->used;
	srcicon = src->object;
	icon = newicon->object;
	memcpy(icon, srcicon, src->used);
	icon->cicon.monoblk.ib_ptext = (char *)add_string(acs, (Obj_Head *)srcicon->cicon.monoblk.ib_ptext);
	icon->cicon.mainlist = NULL;
	icon->c16.col_data = NULL;
	icon->c16.col_mask = NULL;
	icon->c16.sel_data = NULL;
	icon->c16.sel_mask = NULL;
	icon->c16.num_planes = srcicon->c16.num_planes;
	icon->c16.next_res = NULL;
	icon->c256.col_data = NULL;
	icon->c256.col_mask = NULL;
	icon->c256.sel_data = NULL;
	icon->c256.sel_mask = NULL;
	icon->c256.num_planes = srcicon->c256.num_planes;
	icon->c256.next_res = NULL;
	if (srcicon->c16.col_data != NULL)
		icon->c16.col_data = (int16 *)add_data(acs, (Obj_Head *)srcicon->c16.col_data);
	if (srcicon->c16.col_mask != NULL)
		icon->c16.col_mask = (int16 *)add_data(acs, (Obj_Head *)srcicon->c16.col_mask);
	if (srcicon->c16.sel_data != NULL)
		icon->c16.sel_data = (int16 *)add_data(acs, (Obj_Head *)srcicon->c16.sel_data);
	if (srcicon->c16.sel_mask != NULL)
		icon->c16.sel_mask = (int16 *)add_data(acs, (Obj_Head *)srcicon->c16.sel_mask);
	if (srcicon->c256.col_data != NULL)
		icon->c256.col_data = (int16 *)add_data(acs, (Obj_Head *)srcicon->c256.col_data);
	if (srcicon->c256.col_mask != NULL)
		icon->c256.col_mask = (int16 *)add_data(acs, (Obj_Head *)srcicon->c256.col_mask);
	if (srcicon->c256.sel_data != NULL)
		icon->c256.sel_data = (int16 *)add_data(acs, (Obj_Head *)srcicon->c256.sel_data);
	if (srcicon->c256.sel_mask != NULL)
		icon->c256.sel_mask = (int16 *)add_data(acs, (Obj_Head *)srcicon->c256.sel_mask);
	return newicon;
}

/* -------------------------------------------------------------------------- */

Obj_Head *dup_icon(ACS_HEAD *acs, CICONBLK *icon)
{
	Obj_Head *str;
	size_t size;
	CICON *cicon;
	int16 *data;
	Obj_Head *copy;
	ACSCICONBLK *newicon;
	
	memcpy(&my_icon.cicon, icon, sizeof(my_icon.cicon));
	str = dup_string(acs, icon->monoblk.ib_ptext);
	str->usage--;
	my_icon.cicon.monoblk.ib_ptext = (char *)str;
	size = (icon->monoblk.ib_wicon >> 3) * icon->monoblk.ib_hicon; /* BUG: width not rounded up */
	free_icon.used = free_icon.size = size * 2 + sizeof(ACSCICONBLK);
	my_icon.cicon.mainlist = NULL;
	my_icon.c16.col_data = NULL;
	my_icon.c16.col_mask = NULL;
	my_icon.c16.sel_data = NULL;
	my_icon.c16.sel_mask = NULL;
	my_icon.c16.num_planes = 0;
	my_icon.c16.next_res = NULL;
	my_icon.c256.col_data = NULL;
	my_icon.c256.col_mask = NULL;
	my_icon.c256.sel_data = NULL;
	my_icon.c256.sel_mask = NULL;
	my_icon.c256.num_planes = 0;
	my_icon.c256.next_res = NULL;
	
	if ((cicon = icon->mainlist) != NULL)
	{
		if (cicon->num_planes == 4)
		{
			my_icon.c16.num_planes = 4;
			data = cicon->col_data;
			if (data != NULL)
			{
				copy = dup_data(acs, &data[-DATA_OFFSET], size * 4 + DATA_OFFSET * sizeof(*data));
				/* BUG: no null-pointer check */
				my_icon.c16.col_data = (int16 *)copy;
				copy->usage--;
				data = copy->object;
				*data = 0;
			}
			if (cicon->col_mask != NULL)
			{
				copy = dup_data(acs, cicon->col_mask, size);
				/* BUG: no null-pointer check */
				my_icon.c16.col_mask = (int16 *)copy;
				copy->usage--;
			}

			data = cicon->sel_data;
			if (data != NULL)
			{
				/* BUG: no null-pointer check */
				copy = dup_data(acs, &data[-DATA_OFFSET], size * 4 + DATA_OFFSET * sizeof(*data));
				my_icon.c16.sel_data = (int16 *)copy;
				copy->usage--;
				data = copy->object;
				*data = 0;
			}
			if (cicon->sel_mask != NULL)
			{
				copy = dup_data(acs, cicon->sel_mask, size);
				/* BUG: no null-pointer check */
				my_icon.c16.sel_mask = (int16 *)copy;
				copy->usage--;
			}
			cicon = cicon->next_res;
		}

		if (cicon != NULL && cicon->num_planes == 8)
		{
			my_icon.c256.num_planes = 8;
			data = cicon->col_data;
			if (data != NULL)
			{
				copy = dup_data(acs, &data[-DATA_OFFSET], size * 8 + DATA_OFFSET * sizeof(*data));
				/* BUG: no null-pointer check */
				my_icon.c256.col_data = (int16 *)copy;
				copy->usage--;
				data = copy->object;
				*data = 0;
			}
			if (cicon->col_mask != NULL)
			{
				copy = dup_data(acs, cicon->col_mask, size);
				/* BUG: no null-pointer check */
				my_icon.c256.col_mask = (int16 *)copy;
				copy->usage--;
			}

			data = cicon->sel_data;
			if (data != NULL)
			{
				copy = dup_data(acs, &data[-DATA_OFFSET], size * 8 + DATA_OFFSET * sizeof(*data));
				/* BUG: no null-pointer check */
				my_icon.c256.sel_data = (int16 *)copy;
				copy->usage--;
				data = copy->object;
				*data = 0;
			}
			if (cicon->sel_mask != NULL)
			{
				copy = dup_data(acs, cicon->sel_mask, size);
				/* BUG: no null-pointer check */
				my_icon.c256.sel_mask = (int16 *)copy;
				copy->usage--;
			}
		}
	}
	
	copy = add_icon(acs, &free_icon);
	if (copy == NULL)
		return NULL;
	newicon = copy->object;
	memcpy(newicon + 1, icon->monoblk.ib_pmask, size);
	memcpy((char *)(newicon + 1) + size, icon->monoblk.ib_pdata, size);
	newicon->cicon.monoblk.ib_pmask = (int16 *)sizeof(ACSCICONBLK);
	newicon->cicon.monoblk.ib_pdata = (int16 *)(sizeof(ACSCICONBLK) + size);
	return copy;
}

/* -------------------------------------------------------------------------- */

void del_icon(ACS_HEAD *acs, Obj_Head *obj)
{
	Awindow *win;
	ACSCICONBLK *icon;
	
	obj->usage -= 1;
	if (obj->usage <= 0)
	{
		win = obj->window;
		if (win != NULL)
		{
#if 0 /* BUG? call is missing */
			win->service(win, AS_TERM, NULL);
#endif
			(void)win;
		}
		icon = obj->object;
		del_string(acs, (Obj_Head *)icon->cicon.monoblk.ib_ptext);
		if (icon->c16.col_data != NULL)
			del_data(acs, (Obj_Head *)icon->c16.col_data);
		if (icon->c16.col_mask != NULL)
			del_data(acs, (Obj_Head *)icon->c16.col_mask);
		if (icon->c16.sel_data != NULL)
			del_data(acs, (Obj_Head *)icon->c16.sel_data);
		if (icon->c16.sel_mask != NULL)
			del_data(acs, (Obj_Head *)icon->c16.sel_mask);
		if (icon->c256.col_data != NULL)
			del_data(acs, (Obj_Head *)icon->c256.col_data);
		if (icon->c256.col_mask != NULL)
			del_data(acs, (Obj_Head *)icon->c256.col_mask);
		if (icon->c256.sel_data != NULL)
			del_data(acs, (Obj_Head *)icon->c256.sel_data);
		if (icon->c256.sel_mask != NULL)
			del_data(acs, (Obj_Head *)icon->c256.sel_mask);
		del_entry(acs->ic_list, obj);
		objfree(acs, obj);
	}
}

/* -------------------------------------------------------------------------- */

static OBJECT *new_work(Obj_Head *objlist)
{
	return work_icon(objlist, WI_ICON.iconblk, LIST_ICON);
}
