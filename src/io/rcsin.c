#include "acs_i.h"
#include "acsio.h"

typedef struct {
	int8 index;
	int8 tree;
	int8 type;
	int8 nontree;
	char label[10];
} dfn;

static dfn *dfna;
static short dfn_size;

#ifndef C_UNION
#  define C_UNION(x) { (int32)(x) }
#endif

static OBJ_ENTRY const obsproto = {
	NULL,
	NULL,
	{ NIL, NIL, NIL, G_BOX, OF_NONE, OS_OUTLINED, C_UNION(0x00021100L), 0, 0, 32, 12 },
	{ NULL, NULL, AEO, 0, NULL, NULL, 0, 0, }
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void load_dfn(ACS_HEAD *acs)
{
	int fd;
	long size;
	
	fd = (int)Fopen(acs->filename, FO_READ);
	if (fd < 0)
	{
		dfn_size = 0;
	} else
	{
		Fread(fd, sizeof(dfn_size), &dfn_size);
		/* count is in little-endian format; swap it */
		dfn_size = ((dfn_size >> 8) & 0xff) | (dfn_size << 8);
		size = dfn_size * sizeof(*dfna);
		dfna = Ax_malloc(size);
		if (dfna == NULL)
		{
			dfn_size = 0;
		} else
		{
			Fread(fd, size, dfna);
			Fclose(fd);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void tree_label(short index, char *label, int16 *ismenu)
{
	int i;
	
	for (i = 0; i < dfn_size; i++)
	{
		if (dfna[i].index == index &&
			dfna[i].nontree == 0 &&
			dfna[i].type >= 1 && /* only PANEL, MENU, DIALOG */
			dfna[i].type <= 3)
		{
			strcpy(label, dfna[i].label);
			if (dfna[i].type == 2)
				*ismenu = 1;
			return;
		}
	}
	*label = '\0';
}

/* -------------------------------------------------------------------------- */

static void index_label(short treeindex, short index, char *label)
{
	int i;
	
	for (i = 0; i < dfn_size; i++)
	{
		if (dfna[i].index == index &&
			dfna[i].type == 0 &&
			dfna[i].nontree == 1 &&
			dfna[i].tree == treeindex)
		{
			strcpy(label, dfna[i].label);
			return;
		}
	}
	*label = '\0';
}

/* -------------------------------------------------------------------------- */

static void image_label(short index, char *label)
{
	int i;
	
	for (i = 0; i < dfn_size; i++)
	{
		if (dfna[i].index == index &&
			dfna[i].type == 2 &&
			dfna[i].nontree == 1)
		{
			strcpy(label, dfna[i].label);
			return;
		}
	}
	*label = '\0';
}

/* -------------------------------------------------------------------------- */

static void string_label(short index, char *label, boolean *isalert)
{
	int i;
	
	for (i = 0; i < dfn_size; i++)
	{
		if (dfna[i].index == index)
		{
			if (dfna[i].type == 1 && dfna[i].nontree == 1)
			{
				strcpy(label, dfna[i].label);
				return;
			}
			if (dfna[i].type == 4 && dfna[i].nontree == 0)
			{
				*isalert = 1;
				strcpy(label, dfna[i].label);
				return;
			}
		}
	}
	*label = '\0';
}

/* -------------------------------------------------------------------------- */

static void strings(ACS_HEAD *acs, void *buf)
{
	int16 i, count;
	RSHDR *hdr;
	int32 *frstr;
	char *str;
	size_t len;
	Obj_Head *obj;
	boolean isalert;
	char label[16];
	
	hdr = (RSHDR *)buf;
	count = hdr->rsh_nstring;
	frstr = (int32 *)((char *)buf + hdr->rsh_frstr);
	for (i = 0; i < count; i++)
	{
		str = (char *)buf + frstr[i];
		len = strlen(str) + 1;
		obj = objmalloc(acs, len);
		obj->flags |= OBJ_GLOBAL;
		/* BUG: null pointer check too late */
		if (obj == NULL)
			return;
		obj->used = len;
		strcpy((char *)obj->object, str);
		obj->flags |= OBJ_GLOBAL; /* FIXME: duplicate */
		isalert = FALSE;
		string_label(i, label, &isalert);
		if (label[0] != '\0')
		{
			objname(acs, obj, label, "");
		} else
		{
			if (str[0] == '[' &&
				(str[1] == '0' || str[1] == '1' || str[1] == '2' || str[1] == '3') &&
				str[2] == ']' &&
				str[3] == '[')
				isalert = TRUE;
			if (isalert)
				objname(acs, obj, "ALERTBOX_01", "Alertbox");
			else
				objname(acs, obj, "TEXT_01", "Freier String");
		}
		if (isalert)
			add_entry(acs->al_list, obj);
		else
			add_entry(acs->st_list, obj);
	}
}

/* -------------------------------------------------------------------------- */

static void images(ACS_HEAD *acs, void *buf)
{
	int16 i, count;
	RSHDR *hdr;
	int32 *frimg;
	BITBLK *bit;
	Obj_Head *obj;
	char label[16];
	
	hdr = (RSHDR *)buf;
	count = hdr->rsh_nimages;
	frimg = (int32 *)((char *)buf + hdr->rsh_frimg);
	for (i = 0; i < count; i++)
	{
		bit = (BITBLK *)((char *)buf + frimg[i]);
		bit->bi_pdata = (int16 *)((char *)buf + (int32)bit->bi_pdata);
		obj = dup_image(acs, bit);
		/* BUG: no null pointer check */
		obj->flags |= OBJ_GLOBAL;
		image_label(i, label);
		if (label[0] != '\0')
			objname(acs, obj, label, "");
	}
}

/* -------------------------------------------------------------------------- */

static void fix_cicon(CICONBLK **list)
{
	void *data; /* a5 */
	CICONBLK *ciconblk; /* a4 */
	CICON *cicon; /* a3 */
	CICON *c16; /* a2 */
	CICON *c256; /* a6 */
	CICONBLK **ptr; /* 0 */
	long size;
	
	for (ptr = list; *ptr++ == 0; )
		;
	while (*list == 0)
	{
		*list++ = (CICONBLK *)ptr;
		ciconblk = (CICONBLK *)ptr;
		size = (((ciconblk->monoblk.ib_wicon + 15) & -16) * ciconblk->monoblk.ib_hicon) >> 3;
		data = (void *)(ciconblk + 1);
		ciconblk->monoblk.ib_pdata = data;
		data = (char *)data + size;
		ciconblk->monoblk.ib_pmask = data;
		data = (char *)data + size;
		ciconblk->monoblk.ib_ptext = data;
		data = (char *)data + 12;
		c16 = c256 = NULL;
		do
		{
			cicon = data;
			if (cicon->num_planes == 4)
				c16 = cicon;
			if (cicon->num_planes == 8)
				c256 = cicon;
			data = (char *)data + sizeof(CICON);
			cicon->col_data = (int16 *)data;
			data = (char *)data + size * cicon->num_planes;
			cicon->col_mask = (int16 *)data;
			data = (char *)data + size;
			if (cicon->sel_data != NULL)
			{
				cicon->sel_data = data;
				data = (char *)data + size * cicon->num_planes;
				cicon->sel_mask = data;
				data = (char *)data + size;
			}
		} while (cicon->next_res != NULL);
		ciconblk->mainlist = NULL;
		if (c16 != NULL)
		{
			ciconblk->mainlist = c16;
			if (c256 != NULL)
				c16->next_res = c256;
		} else
		{
			if (c256 != NULL)
				ciconblk->mainlist = c256;
		}
		ptr = data;
	}
}

/* -------------------------------------------------------------------------- */

static void objects(ACS_HEAD *acs, void *buf)
{
	int16 i;
	int16 j;
	int16 count;
	OBJECT *tree;
	OBJ_ENTRY *entry;
	Obj_Head *labelobj;
	Obj_Head *obj;
	CICONBLK cicon;
	int32 *trindex;
	int16 ismenu;
	char label[16];
	int32 *ciconlist;
	RSHDR *hdr;
	CICONBLK **cicons;
	int32 numobjects;
	
	hdr = (RSHDR *)buf;
	ciconlist = (int32 *)((char *)buf + hdr->rsh_rssize);
	/* BUG: access beyond end of file when there are no cicons */
	cicons = (CICONBLK **)((char *)buf + ciconlist[1]);
 	if (hdr->rsh_vrsn & 4)
		fix_cicon(cicons);
	count = hdr->rsh_ntree - 1;
	trindex = (int32 *)((char *)buf + hdr->rsh_trindex);
	for (i = 0; i <= count; i++)
	{
		tree = (OBJECT *)((char *)buf + trindex[i]);
		/*
		 * find the number of objects in this tree,
		 * by checking addresses of other trees.
		 * FIXME: better just look for OF_LASTOB flag
		 */
		{
			int32 end;
			int32 start;
			int16 k; /* XXX uses d0 instead of d6 */
			
			end = hdr->rsh_object + hdr->rsh_nobs * sizeof(OBJECT);
			start = trindex[i];
			for (k = 0; k <= count; k++)
			{
				if (trindex[k] > start && trindex[k] < end)
					end = trindex[k];
			}
			numobjects = (end - start) / sizeof(OBJECT);
		}
		obj = objmalloc(acs, numobjects * sizeof(OBJ_ENTRY));
		if (obj == NULL)
			return;
		obj->flags |= OBJ_GLOBAL;
		obj->used = obj->size;
		ismenu = 2;
		tree_label(i, label, &ismenu);
		if (ismenu == 2)
		{
			if ((char)tree[ROOT].ob_type == G_IBOX &&
				tree[ROOT].ob_tail == tree[1].ob_next &&
				(char)tree[1].ob_type == G_BOX &&
				tree[1].ob_head == 2 &&
				tree[1].ob_tail == 2 &&
				tree[2].ob_next == 1 &&
				(char)tree[2].ob_type == G_IBOX)
				ismenu = TRUE;
			else
				ismenu = FALSE;
		}
		
		if (label[0] == '\0')
		{
			if (ismenu)
				objname(acs, obj, "MENU_01", "");
			else
				objname(acs, obj, "OBJECT_01", "");
		} else
		{
			objname(acs, obj, label, "");
		}
		if (ismenu)
		{
			int16 parent;
			int32 str;
			
			/* get object number of first title (acc menu) */
			j = tree[tree[tree[ROOT].ob_head].ob_head].ob_head;
			/* kill the string, will be replaced */
			str = tree[j].ob_spec.index;
			tree[j].ob_width = 6;
			tree[j].ob_state |= AOS_CONST;
			((char *)buf)[str] = '\0';
			/* get object number of sub-box containing acc entries */
			parent = tree[tree[ROOT].ob_tail].ob_head;
			/* walk through children and mark them as const */
			j = tree[parent].ob_head;
			while (parent != j)
			{
				tree[j].ob_state |= AOS_CONST;
				j = tree[j].ob_next;
			}
		}
		
		entry = (OBJ_ENTRY *)obj->object;
		tree->ob_x = tree->ob_y = 0;
		for (j = 0; j < numobjects; entry++, tree++, j++)
		{
			memcpy(entry, &obsproto, sizeof(*entry));
			index_label(i, j, label);
			if (label[0] != '\0')
			{
				labelobj = objmalloc(acs, 0);
				if (labelobj == NULL)
					return;
				objname(acs, labelobj, label, "");
				entry->label = labelobj;
			}
			memcpy(&entry->obj, tree, sizeof(entry->obj));
			/* clear extended object types */
			entry->obj.ob_type &= 0xff;
			/* clear OF_LASTOB, OF_INDIRECT and all extended flags */
			entry->obj.ob_flags &= OF_SELECTABLE | OF_DEFAULT | OF_EXIT | OF_EDITABLE | OF_RBUTTON | OF_TOUCHEXIT | OF_HIDETREE;
			/* clear OS_WHITEBAK, OS_DRAW3D and all extended states */
			entry->obj.ob_state &= AOS_CONST | OS_SELECTED | OS_CROSSED | OS_CHECKED | OS_DISABLED | OS_OUTLINED | OS_SHADOWED;
			switch ((char)tree->ob_type)
			{
			case G_TEXT:
			case G_BOXTEXT:
			case G_FTEXT:
			case G_FBOXTEXT:
				{
					TEDINFO *ted = (TEDINFO *)((char *)buf + tree->ob_spec.index);
					ted->te_ptext = (char *)buf + (int32)ted->te_ptext;
					ted->te_ptmplt = (char *)buf + (int32)ted->te_ptmplt;
					ted->te_pvalid = (char *)buf + (int32)ted->te_pvalid;
					entry->obj.ob_spec.tedinfo = (TEDINFO *)dup_tedinfo(acs, ted);
				}
				break;
			
			case G_IMAGE:
				{
					BITBLK *bit = (BITBLK *)((char *)buf + tree->ob_spec.index);
					bit->bi_pdata = (int16 *)((char *)buf + (int32)bit->bi_pdata);
					entry->obj.ob_spec.bitblk = (BITBLK *)dup_image(acs, bit);
				}
				break;
			
			case G_USERDEF:
				entry->obj.ob_spec.userblk = NULL;
				break;
			
			case G_BUTTON:
			case G_STRING:
			case G_TITLE:
				entry->obj.ob_spec.free_string = (char *)dup_string(acs, (char *)buf + entry->obj.ob_spec.index);
				break;
			
			case G_CICON:
				entry->obj.ob_type = G_ICON;
				entry->obj.ob_spec.ciconblk = (CICONBLK *)dup_icon(acs, cicons[tree->ob_spec.index]);
				break;
			
			case G_ICON:
				{
					ICONBLK *icon = (ICONBLK *)((char *)buf + tree->ob_spec.index);
					icon->ib_pmask = (int16 *)((char *)buf + (int32)icon->ib_pmask);
					icon->ib_pdata = (int16 *)((char *)buf + (int32)icon->ib_pdata);
					icon->ib_ptext = (char *)buf + (int32)icon->ib_ptext;
					memcpy(&cicon.monoblk, icon, sizeof(cicon.monoblk));
					cicon.mainlist = NULL;
					entry->obj.ob_spec.iconblk = (ICONBLK *)dup_icon(acs, &cicon);
				}
				break;
			}
		}
		if (ismenu)
			add_entry(acs->me_list, obj);
		else
			add_entry(acs->ob_list, obj);
	}
}

/* -------------------------------------------------------------------------- */

void read_rsc(ACS_HEAD *acs)
{
	char *dot;
	RSHDR hdr;
	
	dot = strrchr(acs->filename, '.');
	strcpy(dot, ".DFN"); /* FIXME: make lowercase */
	load_dfn(acs);
	strcpy(dot, ".ACS"); /* FIXME: make lowercase */
	read_buf(&hdr, sizeof(hdr));
	init_acs(acs);
	/* WTF? assumes that whole RSC file fits into iobuf */
	objects(acs, iobuf);
	strings(acs, iobuf);
	images(acs, iobuf);
	Ax_free(dfna);
	/* BUG: dfna not nullified */
}
