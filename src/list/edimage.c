#include "acs_i.h"

#define IMAGE_W  48
#define IMAGE_H  24

static struct {
	BITBLK bitblk;
	int16 data[((IMAGE_W / 8) * IMAGE_H) / 2];
} bitblk_obj = {
	{ (int16 *)sizeof(BITBLK), IMAGE_W / 8, IMAGE_H, 0, 0, 1 },
	{
	0x07ff, 0xffff, 0xff80, 0x0c00, 0x0000, 0x00c0, 0x183f, 0xf03f,
	0xf060, 0x187f, 0xf860, 0x1860, 0x187f, 0xf860, 0x1860, 0x187f,
	0xf860, 0x1860, 0x187f, 0xf860, 0x1860, 0x187f, 0xf860, 0x1860,
	0x187f, 0xf860, 0x1860, 0x187f, 0xf860, 0x1860, 0x187f, 0xf860,
	0x1860, 0x187f, 0xf860, 0x1860, 0x187f, 0xf860, 0x1860, 0x187f,
	0xf860, 0x1860, 0x183f, 0xf03f, 0xf060, 0x0c00, 0x0000, 0x00c0,
	0x07ff, 0xffff, 0xff80, 0x0000, 0x0000, 0x0000, 0x3f30, 0xc787,
	0x8fe0, 0x0c39, 0xcccc, 0xcc00, 0x0c36, 0xcfcc, 0x0f80, 0x0c30,
	0xcccd, 0xcc00, 0x3f30, 0xccc7, 0xcfe0, 0x0000, 0x0000, 0x0000
	}
};

static Obj_Head protoimage = {
	NULL,
	&bitblk_obj,
	0,
	sizeof(bitblk_obj),
	sizeof(bitblk_obj),
	NULL,
	"IMAGE_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

static Obj_Head *copy_image(ACS_HEAD *acs, const Obj_Head *src);
static OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_image = {
	NULL,
	NULL,
	&WI_IMAGE,
	im_list,
	im_name,
	LIST_IMAGE,
	&protoimage,
	copy_image,
	del_image,
	new_work,
	NULL
};
static BITBLK my_image = { NULL, 0, 0, 0, 0, 0 };
static Obj_Head free_image = {
	NULL,
	&my_image,
	0,
	0,
	0,
	NULL,
	"IMAGE_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

Obj_Head *add_image(ACS_HEAD *acs, Obj_Head *image)
{
	Obj_Head *objlist;
	Obj_Head *newimage;
	
	acs->flags |= ACS_CHANGED;
	objlist = acs->im_list;
	if (refimages && (ACSblk->ev_mmokstate & (K_LSHIFT | K_CTRL)) != (K_LSHIFT | K_CTRL))
	{
		if (find_entry(objlist, image->label) == image)
		{
			image->usage++;
			return image;
		}
	}
	if (objextent(objlist, sizeof(Obj_Head *)) != OK ||
		(newimage = copy_image(acs, image)) == NULL)
		return NULL;
	objname(acs, newimage, image->label, list_image.asktitle);
	add_entry(objlist, newimage);
	return newimage;
}

/* -------------------------------------------------------------------------- */

static Obj_Head *copy_image(ACS_HEAD *acs, const Obj_Head *src)
{
	Obj_Head *newimage;
	
	newimage = objmalloc(acs, src->used);
	if (newimage == NULL)
		return NULL;
	newimage->used = src->used;
	memcpy(newimage->object, src->object, src->used);
	return newimage;
}

/* -------------------------------------------------------------------------- */

Obj_Head *dup_image(ACS_HEAD *acs, BITBLK *bit)
{
	size_t size;
	Obj_Head *copy;
	BITBLK *newbit;
	
	memcpy(&my_image, bit, sizeof(my_image));
	size = bit->bi_wb * bit->bi_hl;
	free_image.used = free_image.size = size * 2 + sizeof(BITBLK); /* FIXME: BITBLK only has data and no mask */
	copy = add_image(acs, &free_image);
	if (copy == NULL)
		return NULL;
	newbit = copy->object;
	memcpy(newbit + 1, bit->bi_pdata, size);
	memcpy((char *)(newbit + 1) + size, bit->bi_pdata, size); /* FIXME: BITBLK only has data and no mask */
	newbit->bi_pdata = (int16 *)sizeof(BITBLK);
	return copy;
}

/* -------------------------------------------------------------------------- */

void del_image(ACS_HEAD *acs, Obj_Head *obj)
{
	Awindow *win;

	acs->flags |= ACS_CHANGED;
	obj->usage -= 1;
	if (obj->usage <= 0)
	{
		win = obj->window;
		if (win != NULL)
		{
			win->service(win, AS_TERM, NULL);
		}
		del_entry(acs->im_list, obj);
		objfree(acs, obj);
	}
}

/* -------------------------------------------------------------------------- */

static OBJECT *new_work(Obj_Head *objlist)
{
	return work_icon(objlist, WI_IMAGE.iconblk, LIST_IMAGE);
}
