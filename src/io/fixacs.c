#include "acs_i.h"
#include "acsio.h"
#include "workout.h"
#include <stddef.h>
#include <ctype.h>


typedef struct {
	/*   0 */ void (*windows)(Obj_Head *obj);
	/*   4 */ void (*objects)(Obj_Head *obj);
	/*   8 */ void (*menus)(Obj_Head *obj);
	/*  12 */ void (*popups)(Obj_Head *obj);
	/*  16 */ void (*alerts)(Obj_Head *obj);
	/*  20 */ void (*tedinfos)(Obj_Head *obj);
	/*  24 */ void (*iconblks)(Obj_Head *obj);
	/*  28 */ void (*images)(Obj_Head *obj);
	/*  32 */ void (*strings)(Obj_Head *obj);
	/*  36 */ void (*users)(Obj_Head *obj);
	/*  40 */ void (*references)(Obj_Head *obj);
	/*  44 */ void (*mouses)(Obj_Head *obj);
	/*  48 */ void (*int_list)(Obj_Head *obj);
	/*  52 */ void (*m_strings)(Obj_Head *obj);
	/*  56 */ void (*m_alerts)(Obj_Head *obj);
	/*  60 */
} FixUnfixFkt;


static Obj_Head **trans = NULL;
static long transcount = 0;
static short used;

static void fix_ob(void **ptr);
static void unfix_ob(void **ptr);
static void fix_window(Obj_Head *obj);
static void fix_object(Obj_Head *obj);
static void fix_tedinfo(Obj_Head *obj);
static void fix_icon(Obj_Head *obj);
static void fix_user(Obj_Head *obj);
static void fix_labels(Obj_Head *labels);
static void fix_list(Obj_Head *list, void (*func)(Obj_Head *obj));

static void unfix_window(Obj_Head *obj);
static void unfix_window2(Obj_Head *obj);
static void unfix_object(Obj_Head *obj);
static void unfix_tedinfo(Obj_Head *obj);
static void unfix_icon(Obj_Head *obj);
static void unfix_user(Obj_Head *obj);
static void unfix_user1(Obj_Head *obj);
static void unfix_user2(Obj_Head *obj);
static void unfix_labels(void);
static void unfix_list(Obj_Head *list, void (*func)(Obj_Head *obj));

static FixUnfixFkt const FixV3x = {
	fix_window,
	fix_object,
	fix_object,
	fix_object,
	NULL,
	fix_tedinfo,
	fix_icon,
	NULL,
	NULL,
	fix_user,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL
};
static FixUnfixFkt const UnFixV3x = {
	unfix_window,
	unfix_object,
	unfix_object,
	unfix_object,
	NULL,
	unfix_tedinfo,
	unfix_icon,
	NULL,
	NULL,
	unfix_user,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL
};
static FixUnfixFkt const UnFixV2x = {
	unfix_window2,
	unfix_object,
	unfix_object,
	unfix_object,
	NULL,
	unfix_tedinfo,
	unfix_icon,
	NULL,
	NULL,
	unfix_user2,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL
};
static FixUnfixFkt const UnFixV1x = {
	unfix_window2,
	unfix_object,
	unfix_object,
	unfix_object,
	NULL,
	unfix_tedinfo,
	unfix_icon,
	NULL,
	NULL,
	unfix_user1,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL
};

static Axywh const zero = { 0, 0, 0, 0 };

static void ConvertWindowV2x(const Awindow *src, Awindow *dst)
{
	/*
	 * zero the 5 new members that were added in 3.0.0
	 */
	memcpy(dst, src, sizeof(*dst) - 5 * sizeof(void *));
	dst->iconify = NULL;
	dst->uniconify = NULL;
	dst->gemscript = NULL;
	dst->help_title = NULL;
	dst->help_file = NULL;
}


static void ConvertUserV1x(const AUSERBLK *src, AUSERBLK *dst)
{
	dst->ub_code = src->ub_code;
	dst->ub_parm = src->ub_parm;
	dst->ub_serv = NULL;
	dst->ub_ptr1 = NULL;
	dst->ub_ptr2 = NULL;
	dst->ub_ptr3 = NULL;
	dst->bubble = NULL;
	dst->context = NULL;
}


static void ConvertUserV2x(const AUSERBLK *src, AUSERBLK *dst)
{
	dst->ub_code = src->ub_code;
	dst->ub_parm = src->ub_parm;
	dst->ub_serv = src->ub_serv;
	dst->ub_ptr1 = src->ub_ptr1;
	dst->ub_ptr2 = src->ub_ptr2;
	dst->ub_ptr3 = src->ub_ptr3;
	dst->bubble = NULL;
	dst->context = NULL;
}


static void fix_config(Aconfig *config)
{
	fix_ob((void **)&config->CfgInfo.dateiname);
	fix_ob((void **)&config->CfgInfo.comment);
	fix_ob((void **)&config->CfgInfo.env_praefix);
	fix_ob((void **)&config->BaseName);
	fix_ob((void **)&config->ACSterm);
	fix_ob((void **)&config->ACSaboutme);
	fix_ob((void **)&config->ACSclose);
	fix_ob((void **)&config->ACSmessage);
	fix_ob((void **)&config->ACSmproto);
	fix_ob((void **)&config->ACStimer);
	fix_ob((void **)&config->ACSkey);
	fix_ob((void **)&config->ACSbutton);
	fix_ob((void **)&config->ACSmouse);
	fix_ob((void **)&config->ACSwikey);
	fix_ob((void **)&config->ACSGEMScript);
	fix_ob((void **)&config->ACSinit0);
	fix_ob((void **)&config->ACSinit);
}


static void unfix_config(Aconfig *config)
{
	unfix_ob((void **)&config->CfgInfo.dateiname);
	unfix_ob((void **)&config->CfgInfo.comment);
	unfix_ob((void **)&config->CfgInfo.env_praefix);
	unfix_ob((void **)&config->BaseName);
	unfix_ob((void **)&config->ACSterm);
	unfix_ob((void **)&config->ACSaboutme);
	unfix_ob((void **)&config->ACSclose);
	unfix_ob((void **)&config->ACSmessage);
	unfix_ob((void **)&config->ACSmproto);
	unfix_ob((void **)&config->ACStimer);
	unfix_ob((void **)&config->ACSkey);
	unfix_ob((void **)&config->ACSbutton);
	unfix_ob((void **)&config->ACSmouse);
	unfix_ob((void **)&config->ACSwikey);
	unfix_ob((void **)&config->ACSGEMScript);
	unfix_ob((void **)&config->ACSinit0);
	unfix_ob((void **)&config->ACSinit);
}


static void fix_ob(void **ptr)
{
	if (*ptr != NULL)
	{
		*ptr = (void *)(int32)(((Obj_Head *)(*ptr))->oh_id);
	}
}


static void unfix_ob(void **ptr)
{
	*ptr = trans[(short)(int32)*ptr];
}


static void next_trans(void)
{
	if (used >= transcount - 1)
		Awi_alert(1, ERR_TRANS);
	else
		++used;
}


/*
 * convert pointers to IDs for writing to disk
 */
boolean fix_all(ACS_HEAD *acs)
{
	long count;
	const FixUnfixFkt *fix;
	Obj_Head *obj;
	int i;
	Amouse *mouse;
	
	/*
	 * first entry is for NULL pointer. 2nd entry is for labels
	 */
	count = 2;
	fix = &FixV3x;
	for (obj = acs->labels; obj != NULL; obj = obj->next)
		count++;
	trans = (Obj_Head **)Ax_malloc(count * sizeof(*trans));
	if (trans == NULL)
	{
		ACSblk->ACSerror(AE_OUT_OF_MEM, NULL);
		return FALSE;
	}
	memset(trans, 0, count * sizeof(*trans));
	transcount = count;
	acs->obj_count = count;
	fix_labels(acs->labels);
	fix_list(acs->wi_list, fix->windows);
	fix_list(acs->ob_list, fix->objects);
	fix_list(acs->me_list, fix->menus);
	fix_list(acs->pu_list, fix->popups);
	fix_list(acs->al_list, fix->alerts);
	fix_list(acs->te_list, fix->tedinfos);
	fix_list(acs->ic_list, fix->iconblks);
	fix_list(acs->im_list, fix->images);
	fix_list(acs->st_list, fix->strings);
	fix_list(acs->us_list, fix->users);
	fix_list(acs->rf_list, fix->references);
	fix_list(acs->mo_list, fix->mouses);
	fix_list(acs->if_list, fix->int_list);
	for (i = 0; i < MAX_LANGS; i++)
	{
		fix_list(acs->mlst_list[i], fix->m_strings);
	}
	for (i = 0; i < MAX_LANGS; i++)
	{
		fix_list(acs->mlal_list[i], fix->m_alerts);
	}
	acs->wi_list = (Obj_Head *)(int32)acs->wi_list->oh_id; /* aka fix_ob(&acs->wi_list) */
	acs->ob_list = (Obj_Head *)(int32)acs->ob_list->oh_id;
	acs->me_list = (Obj_Head *)(int32)acs->me_list->oh_id;
	acs->pu_list = (Obj_Head *)(int32)acs->pu_list->oh_id;
	acs->al_list = (Obj_Head *)(int32)acs->al_list->oh_id;
	acs->te_list = (Obj_Head *)(int32)acs->te_list->oh_id;
	acs->ic_list = (Obj_Head *)(int32)acs->ic_list->oh_id;
	acs->im_list = (Obj_Head *)(int32)acs->im_list->oh_id;
	acs->st_list = (Obj_Head *)(int32)acs->st_list->oh_id;
	acs->us_list = (Obj_Head *)(int32)acs->us_list->oh_id;
	acs->rf_list = (Obj_Head *)(int32)acs->rf_list->oh_id;
	acs->mo_list = (Obj_Head *)(int32)acs->mo_list->oh_id;
	acs->if_list = (Obj_Head *)(int32)acs->if_list->oh_id;
	fix_ob((void **)&acs->descr.root);
	fix_ob((void **)&acs->descr.acc);
	for (mouse = acs->descr.mouse, i = 32 - 1; i >= 0; mouse++, i--)
		fix_ob((void **)&mouse->form);
	for (i = 0; i < MAX_LANGS; i++)
	{
		acs->mlst_list[i] = (Obj_Head *)(int32)acs->mlst_list[i]->oh_id;
	}
	for (i = 0; i < MAX_LANGS; i++)
	{
		acs->mlal_list[i] = (Obj_Head *)(int32)acs->mlal_list[i]->oh_id;
	}
	fix_config(&acs->config);
	return TRUE;
}


/*
 * convert IDs to pointers after reading from disk
 */
void unfix_all(ACS_HEAD *acs)
{
	const FixUnfixFkt *fix;
	int i;
	Amouse *mouse;
	
	fix = &UnFixV3x;
	if (trans == NULL)
		return;
	switch (acs->version)
	{
	case 100:
		fix = &UnFixV1x;
		break;
	case 200:
	case 205:
	case 300:
		fix = &UnFixV2x;
		break;
	}
	unfix_labels();
	for (i = 0; i < MAX_LANGS; i++)
	{
		unfix_ob((void **)&acs->mlst_list[i]);
	}
	for (i = 0; i < MAX_LANGS; i++)
	{
		unfix_ob((void **)&acs->mlal_list[i]);
	}
	unfix_ob((void **)&acs->wi_list);
	unfix_ob((void **)&acs->ob_list);
	unfix_ob((void **)&acs->me_list);
	unfix_ob((void **)&acs->pu_list);
	unfix_ob((void **)&acs->te_list);
	unfix_ob((void **)&acs->ic_list);
	unfix_ob((void **)&acs->im_list);
	unfix_ob((void **)&acs->al_list);
	unfix_ob((void **)&acs->us_list);
	unfix_ob((void **)&acs->st_list);
	unfix_ob((void **)&acs->rf_list);
	unfix_ob((void **)&acs->mo_list);
	unfix_ob((void **)&acs->if_list);
	unfix_ob((void **)&acs->descr.root);
	unfix_ob((void **)&acs->descr.acc);
	for (mouse = acs->descr.mouse, i = 32 - 1; i >= 0; mouse++, i--)
		unfix_ob((void **)&mouse->form);
	unfix_list(acs->wi_list, fix->windows);
	unfix_list(acs->ob_list, fix->objects);
	unfix_list(acs->me_list, fix->menus);
	unfix_list(acs->pu_list, fix->popups);
	unfix_list(acs->al_list, fix->alerts);
	unfix_list(acs->te_list, fix->tedinfos);
	unfix_list(acs->ic_list, fix->iconblks);
	unfix_list(acs->im_list, fix->images);
	unfix_list(acs->us_list, fix->users);
	unfix_list(acs->st_list, fix->strings);
	unfix_list(acs->rf_list, fix->references);
	unfix_list(acs->mo_list, fix->mouses);
	unfix_list(acs->if_list, fix->int_list);
	for (i = 0; i < MAX_LANGS; i++)
	{
		unfix_list(acs->mlst_list[i], fix->m_strings);
	}
	for (i = 0; i < MAX_LANGS; i++)
	{
		unfix_list(acs->mlal_list[i], fix->m_alerts);
	}
	acs->labels = trans[1];
	unfix_config(&acs->config);
	Ax_free(trans);
	trans = NULL;
	transcount = 0;
}


void wr_all(ACS_HEAD *acs)
{
	int i;
	Obj_Head *obj;
	
	memcpy(&acs->last_rez, &ACSblk->desk, sizeof(acs->last_rez));
	save_buf(acs, sizeof(*acs));
	i = 1;
	do
	{
		obj = trans[i];
		save_buf(obj, sizeof(*obj));
		if ((long)obj->used > 0) /* FIXME: cast */
			save_buf(obj->object, obj->used);
		++i;
	} while (obj->next != NULL);
}


void rd_all(ACS_HEAD *acs)
{
#define header_size (sizeof(acs->magic) + sizeof(acs->version))
	long obj_count;
	int16 obj_size;
	int16 version;
	Obj_Head *list;
	void *object;
	
	obj_count = 8192;
	read_buf(acs, header_size);
	if (acs->magic != ACS_MAGIC ||
		(acs->version != 401 &&
		 acs->version != 400 &&
		 acs->version != 300 &&
		 acs->version != 205 &&
		 acs->version != 200 &&
		 acs->version != 100))
	{
		Awi_alert(1, ERR_FILETYP);
		assert_error(0, NULL);
		/* does not return */
	}
	
	version = acs->version;
	switch (version)
	{
	case 100:
		obj_size = (int16)(sizeof(Obj_Head) - sizeof(Axywh));
		read_buf(&acs->flags, offsetof(ACS_HEAD, pos_ge) - header_size);
		memcpy(&acs->pos_ge, &zero, sizeof(acs->pos_ge));
		memcpy(&acs->pos_pa, &zero, sizeof(acs->pos_pa));
		memcpy(&acs->pos_ds, &zero, sizeof(acs->pos_ds));
		memcpy(&acs->last_rez, &ACSblk->desk, sizeof(acs->last_rez));
		acs->extflags = 0;
		acs->language = 0;
		strcpy(acs->backup, ACSblk->cfg_path);
		memset(acs->mlst_list, 0, sizeof(acs->mlst_list));
		memset(acs->mlal_list, 0, sizeof(acs->mlal_list));
		acs->src_lang = acs->flags & ACS_0010 ? 1 : 0;
		break;
	
	case 200:
	case 205:
		obj_size = (int16)sizeof(Obj_Head);
		read_buf(&acs->flags, offsetof(ACS_HEAD, obj_count) - header_size);
		memcpy(&acs->last_rez, &ACSblk->desk, sizeof(acs->last_rez));
		acs->extflags = 0;
		acs->language = 0;
		strcpy(acs->backup, ACSblk->cfg_path);
		memset(acs->mlst_list, 0, sizeof(acs->mlst_list));
		memset(acs->mlal_list, 0, sizeof(acs->mlal_list));
		acs->src_lang = acs->flags & ACS_0010 ? 1 : 0;
		break;
	
	case 300:
		obj_size = (int16)sizeof(Obj_Head);
		read_buf(&acs->flags, offsetof(ACS_HEAD, src_lang) - header_size);
		obj_count = acs->obj_count;
		acs->src_lang = acs->flags & ACS_0010 ? 1 : 0;
		break;
	
	case 400:
		obj_size = (int16)sizeof(Obj_Head);
		read_buf(&acs->flags, offsetof(ACS_HEAD, config) - header_size);
		read_buf(&acs->config, sizeof(acs->config) - 2 * sizeof(void *));
		obj_count = acs->obj_count;
		break;
	
	default:
		obj_size = (int16)sizeof(Obj_Head);
		read_buf(&acs->flags, offsetof(ACS_HEAD, config) - header_size);
		read_buf(&acs->config, sizeof(acs->config));
		obj_count = acs->obj_count;
		break;
	}
	if (obj_count < 1)
		obj_count = 8192;
	
	trans = (Obj_Head **)Ax_malloc(obj_count * sizeof(*trans));
	if (trans == NULL)
		assert_error(AE_OUT_OF_MEM, NULL);
	transcount = obj_count;
	memset(trans, 0, obj_count * sizeof(*trans));
	acs->window = acs->wi_palette = acs->wi_descr = NULL;
	acs->flags &= ~(ACS_0020 | ACS_0040);
	
	do
	{
		list = Ax_malloc(sizeof(*list));
		if (list == NULL)
			assert_error(AE_OUT_OF_MEM, NULL);
		memcpy(&list->pos, &zero, sizeof(list->pos));
		read_buf(list, obj_size);
		list->object = NULL;
		list->window = NULL;
		list->size = list->used;
		if (version == 100)
			list->flags &= OBJ_GLOBAL;
		trans[list->oh_id] = list;
		trans[list->oh_id + 1] = NULL;
		if ((long)list->size > 0) /* FIXME: cast */
		{
			object = Ax_malloc(list->size);
			if (object == NULL)
				assert_error(AE_OUT_OF_MEM, NULL);
			read_buf(object, list->size);
			list->object = object;
		}
	} while (list->next != NULL);
	
#undef header_size
}


static void fix_window(Obj_Head *obj)
{
	Awindow *win = (Awindow *)obj->object;
	
	fix_ob(&win->user);
	fix_ob((void **)&win->service);
	fix_ob((void **)&win->create);
	fix_ob((void **)&win->open);
	fix_ob((void **)&win->init);
	fix_ob((void **)&win->work);
	fix_ob((void **)&win->toolbar);
	fix_ob((void **)&win->name);
	fix_ob((void **)&win->info);
	fix_ob((void **)&win->iconblk);
	fix_ob((void **)&win->menu);
	fix_ob((void **)&win->keys);
	fix_ob((void **)&win->obchange);
	fix_ob((void **)&win->redraw);
	fix_ob((void **)&win->topped);
	fix_ob((void **)&win->closed);
	fix_ob((void **)&win->fulled);
	fix_ob((void **)&win->arrowed);
	fix_ob((void **)&win->hslid);
	fix_ob((void **)&win->vslid);
	fix_ob((void **)&win->sized);
	fix_ob((void **)&win->moved);
	fix_ob((void **)&win->iconify);
	fix_ob((void **)&win->uniconify);
	fix_ob((void **)&win->gemscript);
	fix_ob((void **)&win->help_title);
	fix_ob((void **)&win->help_file);
}


static void unfix_window(Obj_Head *obj)
{
	Awindow *win = (Awindow *)obj->object;
	
	unfix_ob(&win->user);
	unfix_ob((void **)&win->service);
	unfix_ob((void **)&win->create);
	unfix_ob((void **)&win->open);
	unfix_ob((void **)&win->init);
	unfix_ob((void **)&win->work);
	unfix_ob((void **)&win->toolbar);
	unfix_ob((void **)&win->name);
	unfix_ob((void **)&win->info);
	unfix_ob((void **)&win->iconblk);
	unfix_ob((void **)&win->menu);
	unfix_ob((void **)&win->keys);
	unfix_ob((void **)&win->obchange);
	unfix_ob((void **)&win->redraw);
	unfix_ob((void **)&win->topped);
	unfix_ob((void **)&win->closed);
	unfix_ob((void **)&win->fulled);
	unfix_ob((void **)&win->arrowed);
	unfix_ob((void **)&win->hslid);
	unfix_ob((void **)&win->vslid);
	unfix_ob((void **)&win->sized);
	unfix_ob((void **)&win->moved);
	unfix_ob((void **)&win->iconify);
	unfix_ob((void **)&win->uniconify);
	unfix_ob((void **)&win->gemscript);
	unfix_ob((void **)&win->help_title);
	unfix_ob((void **)&win->help_file);
}


static void fix_icon(Obj_Head *obj)
{
	ACSCICONBLK *icon = (ACSCICONBLK *)obj->object;
	
	fix_ob((void **)&icon->cicon.monoblk.ib_ptext);
	fix_ob((void **)&icon->c16.col_data);
	fix_ob((void **)&icon->c16.col_mask);
	fix_ob((void **)&icon->c16.sel_data);
	fix_ob((void **)&icon->c16.sel_mask);
	fix_ob((void **)&icon->c256.col_data);
	fix_ob((void **)&icon->c256.col_mask);
	fix_ob((void **)&icon->c256.sel_data);
	fix_ob((void **)&icon->c256.sel_mask);
}


static void unfix_icon(Obj_Head *obj)
{
	ACSCICONBLK *icon = (ACSCICONBLK *)obj->object;
	size_t size;
	ACSCICONBLK *newicon;

	unfix_ob((void **)&icon->cicon.monoblk.ib_ptext);
	if (icon->cicon.monoblk.ib_pmask != (void *)sizeof(*icon))
	{
		size = obj->used + sizeof(*icon) - sizeof(ICONBLK);
		newicon = Ax_malloc(size);
		if (newicon == NULL)
			assert_error(AE_OUT_OF_MEM, NULL);
		memcpy(newicon, icon, sizeof(ICONBLK));
		memset(&newicon->c16, 0, sizeof(newicon->c16));
		memset(&newicon->c256, 0, sizeof(newicon->c256));
		newicon->cicon.monoblk.ib_pdata += (sizeof(*icon) - sizeof(ICONBLK)) / sizeof(*newicon->cicon.monoblk.ib_pdata);
		newicon->cicon.monoblk.ib_pmask += (sizeof(*icon) - sizeof(ICONBLK)) / sizeof(*newicon->cicon.monoblk.ib_pmask);
		newicon->cicon.mainlist = NULL;
		memcpy(newicon + 1, (char *)icon + sizeof(ICONBLK), obj->used - sizeof(ICONBLK));
		Ax_ifree(icon);
		obj->object = newicon;
		obj->size = size;
		obj->used = size;
	} else
	{
		unfix_ob((void **)&icon->c16.col_data);
		unfix_ob((void **)&icon->c16.col_mask);
		unfix_ob((void **)&icon->c16.sel_data);
		unfix_ob((void **)&icon->c16.sel_mask);
		unfix_ob((void **)&icon->c256.col_data);
		unfix_ob((void **)&icon->c256.col_mask);
		unfix_ob((void **)&icon->c256.sel_data);
		unfix_ob((void **)&icon->c256.sel_mask);
	}
}


static void fix_labels(Obj_Head *labels)
{
	used = 1;
	
	while (labels != NULL)
	{
		trans[used] = labels;
		labels->oh_id = used;
		labels = labels->next;
		next_trans();
	}
}


static void unfix_labels(void)
{
	int i;
	int next;
	Obj_Head *obj;
	
	trans[0] = NULL;
	for (i = 1, next = 2; i < transcount; i++, next++)
	{
		obj = trans[i];
		if (obj != NULL)
		{
			if (next < transcount)
				obj->next = trans[next];
			else
				obj->next = NULL;
		}
	}
}


static void fix_list(Obj_Head *list, void (*func)(Obj_Head *obj))
{
	int i, count;
	Obj_Head **items;
	Obj_Head *obj;
	
	if ((long)list->used > 0)
	{
		items = (Obj_Head **)list->object;
		count = (int)(list->used / sizeof(*items));
		for (i = 0; i < count; i++)
		{
			obj = items[i];
			if (func != 0)
				func(obj);
			items[i] = (Obj_Head *)(int32)obj->oh_id;
		}
	}
}


static void unfix_list(Obj_Head *list, void (*func)(Obj_Head *obj))
{
	int i, count;
	Obj_Head **items;
	Obj_Head *obj;
	
	if (list != NULL && (long)list->used > 0)
	{
		items = (Obj_Head **)list->object;
		count = (int)(list->used / sizeof(*items));
		for (i = 0; i < count; i++)
		{
			obj = trans[(long)items[i]];
			if (func != 0)
				func(obj);
			items[i] = obj;
		}
	}
}


static void fix_object(Obj_Head *obj)
{
	OBJ_ENTRY *entry;
	int i, count;
	
	entry = (OBJ_ENTRY *)obj->object;
	count = (int)(obj->used / sizeof(*entry));
	for (i = 0; i < count; entry++, i++)
	{
		fix_ob((void **)&entry->label);
		fix_ob((void **)&entry->type);
		switch ((signed char) entry->obj.ob_type)
		{
		case G_TEXT:
		case G_BOXTEXT:
		case G_IMAGE:
		case G_USERDEF:
		case G_BUTTON:
		case G_STRING:
		case G_FTEXT:
		case G_FBOXTEXT:
		case G_ICON:
		case G_TITLE:
		/* case G_CICON: missing? */
			fix_ob((void **)&entry->obj.ob_spec.index);
			break;
		default:
			Awi_alert(1, ERR_TYPE);
			break;
		case G_BOX:
		case G_IBOX:
		case G_BOXCHAR:
			break;
		}
		fix_ob((void **)&entry->aobj.click);
		fix_ob((void **)&entry->aobj.drag);
		fix_ob((void **)&entry->aobj.userp1);
		fix_ob((void **)&entry->aobj.userp2);
	}
}


static void unfix_object(Obj_Head *obj)
{
	OBJ_ENTRY *entry;
	int i, count;
	
	entry = (OBJ_ENTRY *)obj->object;
	count = (int)(obj->used / sizeof(*entry));
	for (i = 0; i < count; entry++, i++)
	{
		unfix_ob((void **)&entry->label);
		unfix_ob((void **)&entry->type);
		switch ((signed char) entry->obj.ob_type)
		{
		case G_TEXT:
		case G_BOXTEXT:
		case G_IMAGE:
		case G_USERDEF:
		case G_BUTTON:
		case G_STRING:
		case G_FTEXT:
		case G_FBOXTEXT:
		case G_ICON:
		case G_TITLE:
		/* case G_CICON: missing? */
			unfix_ob((void **)&entry->obj.ob_spec.index);
			break;
		default:
			Awi_alert(1, ERR_TYPE);
			break;
		case G_BOX:
		case G_IBOX:
		case G_BOXCHAR:
			break;
		}
		unfix_ob((void **)&entry->aobj.click);
		unfix_ob((void **)&entry->aobj.drag);
		unfix_ob((void **)&entry->aobj.userp1);
		unfix_ob((void **)&entry->aobj.userp2);
	}
}


static void fix_tedinfo(Obj_Head *obj)
{
	TEDINFO *ted = (TEDINFO *)obj->object;
	
	fix_ob((void **)&ted->te_ptext);
	fix_ob((void **)&ted->te_ptmplt);
	fix_ob((void **)&ted->te_pvalid);
}


static void unfix_tedinfo(Obj_Head *obj)
{
	TEDINFO *ted = (TEDINFO *)obj->object;
	
	unfix_ob((void **)&ted->te_ptext);
	unfix_ob((void **)&ted->te_ptmplt);
	unfix_ob((void **)&ted->te_pvalid);
}


static void fix_user(Obj_Head *obj)
{
	AUSERBLK *user = (AUSERBLK *)obj->object;
	
	fix_ob((void **)&user->ub_code);
	fix_ob((void **)&user->ub_parm);
	fix_ob((void **)&user->ub_serv);
	fix_ob((void **)&user->ub_ptr1);
	fix_ob((void **)&user->ub_ptr2);
	fix_ob((void **)&user->ub_ptr3);
	fix_ob((void **)&user->bubble);
	fix_ob((void **)&user->context);
}


static void unfix_user(Obj_Head *obj)
{
	AUSERBLK *user = (AUSERBLK *)obj->object;
	
	unfix_ob((void **)&user->ub_code);
	unfix_ob((void **)&user->ub_parm);
	unfix_ob((void **)&user->ub_serv);
	unfix_ob((void **)&user->ub_ptr1);
	unfix_ob((void **)&user->ub_ptr2);
	unfix_ob((void **)&user->ub_ptr3);
	unfix_ob((void **)&user->bubble);
	unfix_ob((void **)&user->context);
}


static void unfix_window2(Obj_Head *obj)
{
	Awindow *src = (Awindow *)obj->object;
	Awindow *dst;
	
	dst = Ax_malloc(sizeof(*dst));
	if (dst == NULL)
		assert_error(AE_OUT_OF_MEM, NULL);
	ConvertWindowV2x(src, dst);
	Ax_ifree(src);
	obj->object = dst;
	obj->used = obj->size = sizeof(*dst);
	unfix_window(obj);
}


static void unfix_user1(Obj_Head *obj)
{
	AUSERBLK *src = (AUSERBLK *)obj->object;
	AUSERBLK *dst;
	
	dst = Ax_malloc(sizeof(*dst));
	if (dst == NULL)
		assert_error(AE_OUT_OF_MEM, NULL);
	ConvertUserV1x(src, dst);
	Ax_ifree(src);
	obj->object = dst;
	obj->used = obj->size = sizeof(*dst);
	obj->flags = 0;
	unfix_user(obj);
}


void unfix_user2(Obj_Head *obj)
{
	AUSERBLK *src = (AUSERBLK *)obj->object;
	AUSERBLK *dst;
	
	dst = Ax_malloc(sizeof(*dst));
	if (dst == NULL)
		assert_error(AE_OUT_OF_MEM, NULL);
	ConvertUserV2x(src, dst);
	Ax_ifree(src);
	obj->object = dst;
	obj->used = obj->size = sizeof(*dst);
	unfix_user(obj);
}


void release_err(void)
{
	int i;
	Obj_Head *ptr;
	
	if (trans != NULL)
	{
		for (i = 1; i < transcount; i++)
		{
			ptr = trans[i];
			if (ptr == NULL)
				break;
			Ax_ifree(ptr->object);
			Ax_ifree(ptr);
		}
		Ax_free(trans);
		trans = NULL;
		transcount = 0;
	}
}


void free_acs(ACS_HEAD *acs)
{
	Obj_Head *obj, *next;
	
	for (obj = acs->labels; obj != NULL; obj = next)
	{
		next = obj->next;
		Ax_ifree(obj->object);
		Ax_recycle(obj, sizeof(*obj));
	}
	Ax_recycle(acs, sizeof(*acs));
}


void objfree(ACS_HEAD *acs, Obj_Head *obj)
{
	Obj_Head **prev;
	Obj_Head *ptr;
	
	acs->flags |= ACS_CHANGED;
	prev = &acs->labels;
	while ((ptr = *prev) != obj)
	{
		if (ptr == NULL)
		{
			Awi_alert(1, A_MISSENTRY);
			return;
		}
		prev = &ptr->next;
	}
	*prev = obj->next;
	if (obj->window != NULL)
		obj->window->service(obj->window, AS_TERM, NULL);
	Ax_free(obj->object);
	Ax_free(obj);
}


Obj_Head *objmalloc(ACS_HEAD *acs, size_t size)
{
	void *data;
	Obj_Head *obj;
	
	if ((long) size > 0) /* FIXME: cast */
	{
		data = Ax_malloc(size);
		if (data == NULL)
			return NULL;
		memset(data, 0, size);
	} else
	{
		data = NULL;
	}
	obj = Ax_malloc(sizeof(*obj));
	if (obj == NULL)
	{
		Ax_free(data);
		return NULL;
	}
	memset(obj, 0, sizeof(*obj));
	if (acs->flags & ACS_LOCAL)
		obj->flags |= OBJ_LOCAL;
	obj->object = data;
	obj->usage = 1;
	obj->next = acs->labels;
	acs->labels = obj;
	obj->size = size;
	return obj;
}


int16 objextent(Obj_Head *obj, size_t size)
{
	void *data;
	
	if ((long)(obj->used + size) > (long)obj->size) /* FIXME: cast */
	{
		data = Ax_malloc(obj->size + size * 32);
		if (data == NULL)
			return FAIL;
		if (obj->object != NULL)
		{
			memcpy(data, obj->object, obj->size);
			Ax_free(obj->object);
		}
		obj->size += size * 32;
		obj->object = data;
	}
	return OK;
}


static int16 makeformat(char *str)
{
	int digits;
	int val;
	char *ptr;
	
	digits = 0;
	str = strchr(str, '\0');
	while (isdigit(*--str) && digits < 4)
		digits++;
	str++;
	if (digits > 0)
	{
		ptr = str;
		val = 0;
		while (*ptr != '\0')
		{
			val = val * 10 + *ptr++ - '0';
		}
		strcpy(str, "%00d");
		str[2] += digits;
		return val;
	}
	return -1;
}


int16 uniquename(ACS_HEAD *acs, Obj_Head *obj, Obj_Head ***list)
{
	char buf[40];
	char label[40];
	Obj_Head **prev;
	int16 val;
	int len;
	int ret;
	
	strcpy(label, obj->label);
	val = makeformat(label);
	if (val >= 0)
	{
		sprintf(buf, label, val++);
		buf[31] = '\0';
		strcpy(obj->label, buf);
	}
	len = (int)strlen(obj->label);
	prev = &acs->labels;
	while (*prev != NULL)
	{
		ret = strcmp(obj->label, (*prev)->label);
		if (ret < 0)
			break;
		if (ret == 0 && *prev != obj)
		{
			if (val >= 0)
			{
				sprintf(buf, label, val++);
				buf[31] = '\0';
				strcpy(obj->label, buf);
				if (buf[len] != '\0')
				{
					prev = &acs->labels;
					len = (int)strlen(buf);
				} else
				{
					prev = &(*prev)->next;
				}
			} else
			{
				return FAIL;
			}
		} else
		{
			prev = &(*prev)->next;
		}
	}
	*list = prev;
	return OK;
}


void objname(ACS_HEAD *acs, Obj_Head *obj, const char *listname, const char *objname)
{
	Obj_Head **last;
	Obj_Head *next;

	strcpy(obj->label, listname);
	last = &acs->labels;
	while ((next = *last) != obj)
		last = &next->next;
	*last = obj->next;

	for (; uniquename(acs, obj, &last) == FAIL && objname != NULL; )
	{
		newlabel(acs, obj, objname);
	}
	obj->next = *last;
	*last = obj;
	acs->flags |= ACS_CHANGED;
}
