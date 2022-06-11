/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      List                                                  */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "acsplus.h"

static void list_click(void);
static void list_acc(void);
static void list_new(void);
static void list_open(void);
static void list_cut(void);
static void list_copy(void);
static void list_paste(void);

static boolean serv_list(Awindow *self, int16 task, void *in_out);
static Awindow *make_list(void *a);
static int16 key_list(Awindow *self, int16 kstate, int16 key);
static void vslide_list(Awindow *self, int16 pos);
static void full_list(Awindow *self);
static void size_list(Awindow *self, Axywh *area);

#include "list.ah"
#include "list.h"

typedef struct {
	void *expara;
	char title[128];
	long len;
	long memcount;
	long memskip;
	long count;
	uint8 *mem;
	uint8 *buff;
	long flags;
	boolean (*acc_item) (AOBJECT *aob, void *expara);
	int16 (*comp_item) (void *org, void *new, void *expara);
	boolean (*drag_item) (AOBJECT *aob, void *item, void *expara);
	boolean (*edit_item) (void *item, void *expara);
	long (*key_item) (int16 key, void *expara);
	boolean (*message) (int16 mess, void *expara);
	boolean (*print_item) (char *line, void *item, void *expara);
	boolean (*term_list) (void *expara);
} RealList;

/* RealList.flags */
#define LIST_CHANGED    0x0001
#define LIST_HASITEM    0x0002

static boolean DeleteItem(Awindow *self, long idx);


/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static boolean AddItem(Awindow *self, void *item)
{
	long count = 0;
	RealList *list = self->user;
	int16 comp;
	uint8 *itemmem;
	
	itemmem = item;
	if (list->count != 0)
	{
#if WITH_FIXES
		comp = 0;
#endif
		while (count < list->count && (comp = list->comp_item(list->mem + count * list->len, itemmem, list->expara)) == -1)
			count++;
		/* BUG: comp may be used uninitialized */
		if (comp == -2)
			count = list->count;
		if (count < list->count && comp == 0)
		{
			if (list->message(LM_DBL_ITEM, list->expara) != TRUE)
				return FALSE;
			DeleteItem(self, count);
		}
	}
	
	if (list->count + 1 > list->memcount)
	{
		/* WTF? reuse item here? */
#if WITH_FIXES
		uint8 *newmem;
#else
#       define newmem itemmem
#endif
		if ((newmem = Ax_malloc(list->len * (list->memcount + list->memskip))) == NULL)
		{
			if (list->message(LM_OUT_OF_MEM, list->expara) == FALSE)
				ACSblk->ACSerror(AE_OUT_OF_MEM, NULL);
			return FALSE;
		}
		memset(newmem + list->len * list->memcount, 0, list->memskip * list->len);
		memcpy(newmem, list->mem, list->len * list->memcount);
		Ax_free(list->mem);
		list->mem = newmem;
		list->memcount += list->memskip;
#undef mem
	}
	
	if (count < list->count)
	{
		memmove(list->mem + (count + 1) * list->len, list->mem + count * list->len, (list->count - count) * list->len);
	}
	memcpy(list->mem + count * list->len, itemmem, list->len);
	list->count += 1;
	list->flags |= LIST_CHANGED;

	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean DeleteItem(Awindow *self, long idx)
{
	RealList *list = self->user;

	if (idx >= list->count || idx < 0)
	{
		list->message(LM_IDX_RANGE, list->expara);
		return FALSE;
	}
	memmove(list->mem + idx * list->len, list->mem + (idx + 1) * list->len, list->len * (list->count - idx - 1));
	list->count -= 1;
	list->flags |= LIST_CHANGED;

	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean GetItem(Awindow *self, long idx, void *item)
{
	RealList *list = self->user;

	if (idx >= list->count || idx < 0)
	{
		list->message(LM_IDX_RANGE, list->expara);
		return FALSE;
	}
	memcpy(item, list->mem + idx * list->len, list->len);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean ReplaceItem(Awindow *self, long idx, void *item)
{
	if (DeleteItem(self, idx) && AddItem(self, item))
		return TRUE;
	return FALSE;
}

/* -------------------------------------------------------------------------- */

static boolean UpdateList(Awindow *self)
{
	RealList *list = self->user;
	long i;
	void *item;
	char line[512 + 2];

	Auo_editor(&self->work[D_LIST_EDITOR], AUO_EDUNSELECT, NULL);
	Auo_editor(&self->work[D_LIST_EDITOR], AUO_EDDELETE, NULL);
	for (i = 0; i < list->count; i++)
	{
		item = list->mem + i * list->len;
		list->print_item(line, item, list->expara);
		if (i != 0)
			Auo_editor(&self->work[D_LIST_EDITOR], AUO_EDNEWLINE, NULL);
		Auo_editor(&self->work[D_LIST_EDITOR], AUO_EDAPPLINE, line);
	}
	Auo_editor(&self->work[D_LIST_EDITOR], AUO_FULLUPDATE, NULL);
	Auo_editor(&self->work[D_LIST_EDITOR], AUO_EDLIVE, NULL);
	
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void full_list(Awindow *self)
{
	Axywh *act;
	Axywh *normal;
	
	act = &self->wi_act;
	normal = &self->wi_normal;
	if (self->state & AWS_FULL)
	{
		act->x = normal->x;
		act->y = normal->y;
		act->w = normal->w;
		act->h = normal->h;
		size_list(self, normal);
		self->state &= ~AWS_FULL;
	} else
	{
		normal->x = act->x;
		normal->y = act->y;
		normal->w = act->w;
		normal->h = act->h;
		size_list(self, &ACSblk->desk);
		self->state |= AWS_FULL;
	}
	wind_set(self->wi_id, WF_CURRXYWH, act->x, act->y, act->w, act->h);
	Aev_mess();
}

/* -------------------------------------------------------------------------- */

static void selline(OBJECT *tree, long row, EDITSEL *sel)
{
	EDITGETS get;
	
	if (row < 0)
	{
		Auo_editor(tree, AUO_EDGETROWS, &row);
		row--;
	}
	get.row = sel->row1 = sel->row2 = row;
	Auo_editor(tree, AUO_EDGETROW, &get);
	sel->col1 = 0;
	sel->col2 = get.size;
}

/* -------------------------------------------------------------------------- */

static int16 key_list(Awindow *self, int16 kstate, int16 key)
{
	long sel[4] = { 0, 0, 0, 0 };
#define row1 [0]
#define row2 [2]
	RealList *list = self->user;
	OBJECT *tree;
	
	if ((char) key == NK_HELP)
	{
		list->message(LM_INFO, list->expara);
	} else
	{
		if (list->count == 0)
			return Awi_keys(self, kstate, key);
		ACSblk->ev_window = self;
		tree = &self->work[D_LIST_EDITOR];
		Auo_editor(tree, AUO_EDGETSELECT, sel);
		switch ((char) key)
		{
		case NK_UP:
			if (sel row1 > 0)
			{
				sel row1--;
				sel row2--;
			} else
			{
				selline(tree, -1, (EDITSEL *)sel);
			}
			Auo_editor(tree, AUO_EDSETSELECT, sel);
			break;
		
		case NK_DOWN:
			if (sel row1 >= 0 &&
				sel row1 < list->count - 1)
			{
				sel row1++;
				if (sel row1 < list->count)
				{
					sel row2++;
					if (sel row2 >= list->count)
						selline(tree, -1, (EDITSEL *)sel);
				} else
				{
					selline(tree, 0, (EDITSEL *)sel);
				}
			} else
			{
				selline(tree, 0, (EDITSEL *)sel);
			}
			Auo_editor(tree, AUO_EDSETSELECT, sel);
			break;
		
		case NK_CLRHOME:
			if (!(key & NKF_SHIFT))
				selline(tree, 0, (EDITSEL *)sel);
			else
				selline(tree, -1, (EDITSEL *)sel);
			Auo_editor(tree, AUO_EDSETSELECT, sel);
			break;
		
		case NK_RET:
			if (sel row1 >= 0)
				list_open();
			else
				goto _default;
			break;
		
		case NK_UNDO:
			if (sel row1 >= 0)
			{
				Auo_editor(tree, AUO_EDUNSELECT, NULL);
				break;
			}
			/* fall through */
			
		default:
		_default:
			if ((sel row1 = list->key_item(key, list->expara)) < 0)
				return Awi_keys(self, kstate, key);
			if (sel row1 >= list->count)
				selline(tree, -1, (EDITSEL *)sel);
			else
				selline(tree, sel row1, (EDITSEL *)sel);
			Auo_editor(tree, AUO_EDSETSELECT, (EDITSEL *)sel);
			break;
		}
		
		Auo_editor(tree, AUO_EDVIEW, NULL);
		Auo_editor(tree, AUO_EDLIVE, NULL);
	}

#undef row1
#undef row2
	
	return -1;
}

/* -------------------------------------------------------------------------- */

static void list_acc(void)
{
	boolean found = FALSE;
	int16 obnr;
	RealList *list;
	AOBJECT *aobj;
	
	if (ACSblk->Aselect.actlen != 0)
	{
		list = ACSblk->ev_window->user;
		Adr_start();
		while ((obnr = Adr_next()) >= 0)
		{
			if (obnr & A_TOOLBAR)
				aobj = (AOBJECT *)&ACSblk->Aselect.window->toolbar[obnr & A_MASK] + 1;
			else
				aobj = (AOBJECT *)&ACSblk->Aselect.window->work[obnr] + 1;
			if (list->acc_item(aobj, list->expara) == TRUE)
			{
				found = TRUE;
				Adr_del(ACSblk->Aselect.window, obnr);
			}
		}
		if (found)
			UpdateList(ACSblk->ev_window);
	}
}

/* -------------------------------------------------------------------------- */

static void list_click(void)
{
	long sel[4] = { 0, 0, 0, 0 };
	long sel2[4] = { 0, 0, 0, 0 };
#define row1 [0]
#define row2 [2]
	RealList *list = ACSblk->ev_window->user;
	void *item;
	OBJECT *obj;
	AOBJECT *aobj;
	
	if (list->count != 0)
	{
		Auo_editor(&ACSblk->ev_object[ACSblk->ev_obnr], AUO_EDGETSELECT, sel);
		if (sel row1 >= 0 && ACSblk->ev_mmobutton == 2)
		{
			if ((item = Ax_malloc(list->len)) == NULL)
			{
				if (list->message(LM_OUT_OF_MEM, list->expara) == FALSE)
					ACSblk->ACSerror(AE_OUT_OF_MEM, NULL);
				return;
			}
			memcpy(item, list->mem + sel row1 * list->len, list->len);
			obj = &ACSblk->ev_window->work[D_LIST_SELECT];
			aobj = (AOBJECT *)obj + 1;
			if (list->drag_item(aobj, item, list->expara) == TRUE && aobj->type != 0)
			{
				obj->ob_width = ACSblk->gl_wbox * 2;
				obj->ob_height = ACSblk->gl_hbox;
				obj->ob_x = ACSblk->ev_mmox - ACSblk->ev_window->wi_work.x - ACSblk->gl_wbox;
				obj->ob_y = ACSblk->ev_mmoy - ACSblk->ev_window->wi_work.y - (ACSblk->gl_hbox >> 1);
				obj->ob_flags &= ~OF_HIDETREE;
				Adr_add(ACSblk->ev_window, D_LIST_SELECT);
				Adr_drag(ACSblk->ev_mmox, ACSblk->ev_mmoy);
				Adr_del(ACSblk->ev_window, D_LIST_SELECT);
				obj->ob_x = obj->ob_y = obj->ob_width = obj->ob_height = 0;
				obj->ob_flags |= OF_HIDETREE;
				if (aobj->userp1 != NULL)
					Ax_free(aobj->userp1);
				if (aobj->userp2 != NULL)
					Ax_free(aobj->userp2);
				aobj->userp1 = aobj->userp2 = NULL;
				aobj->type = 0;
			}
			Ax_free(item);
		} else
		{
			Aus_editor();
			if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & AOS_DCLICK)
			{
				Auo_editor(&ACSblk->ev_object[ACSblk->ev_obnr], AUO_EDGETSELECT, sel2);
				if (sel row1 >= 0 && sel2 row1 < 0)
				{
					Auo_editor(&ACSblk->ev_object[ACSblk->ev_obnr], AUO_EDSETSELECT, sel);
				}
				list_open();
			}
		}
	} else
	{
		Auo_editor(&ACSblk->ev_object[ACSblk->ev_obnr], AUO_EDUNSELECT, NULL);
	}

#undef row1
#undef row2
}

/* -------------------------------------------------------------------------- */

static void list_copy(void)
{
	long sel[4] = { 0, 0, 0, 0 };
#define row1 [0]
	RealList *list = ACSblk->ev_window->user;
	
	Auo_editor(&ACSblk->ev_window->work[D_LIST_EDITOR], AUO_EDGETSELECT, sel);
	memcpy(list->buff, list->mem + sel row1 * list->len, list->len);
	list->flags |= LIST_HASITEM;
	Auo_editor(&ACSblk->ev_window->work[D_LIST_EDITOR], AUO_EDLIVE, NULL);
#undef row1
}

/* -------------------------------------------------------------------------- */

static void list_cut(void)
{
	long sel[4] = { 0, 0, 0, 0 };
#define row1 [0]
	RealList *list = ACSblk->ev_window->user;
	
	Auo_editor(&ACSblk->ev_window->work[D_LIST_EDITOR], AUO_EDGETSELECT, sel);
	memcpy(list->buff, list->mem + sel row1 * list->len, list->len);
	DeleteItem(ACSblk->ev_window, sel row1);
	list->flags |= LIST_HASITEM;
	UpdateList(ACSblk->ev_window);
#undef row1
}

/* -------------------------------------------------------------------------- */

static void list_new(void)
{
	RealList *list = ACSblk->ev_window->user;
	void *item;
	
	if ((item = Ax_malloc(list->len)) == NULL)
	{
		if (list->message(LM_OUT_OF_MEM, list->expara) == FALSE)
			ACSblk->ACSerror(AE_OUT_OF_MEM, NULL);
		return;
	}
	memset(item, 0, list->len);
	if (list->edit_item(item, list->expara) == TRUE)
		AddItem(ACSblk->ev_window, item);
	Ax_free(item);
	UpdateList(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void list_open(void)
{
	long sel[4] = { 0, 0, 0, 0 };
#define row1 [0]
	RealList *list = ACSblk->ev_window->user;
	void *item;

	Auo_editor(&ACSblk->ev_window->work[D_LIST_EDITOR], AUO_EDGETSELECT, sel);
	if ((item = Ax_malloc(list->len)) == NULL)
	{
		if (list->message(LM_OUT_OF_MEM, list->expara) == FALSE)
			ACSblk->ACSerror(AE_OUT_OF_MEM, NULL);
		return;
	}
	memcpy(item, list->mem + sel row1 * list->len, list->len);
	if (list->edit_item(item, list->expara) == TRUE)
	{
		ReplaceItem(ACSblk->ev_window, sel row1, item);
		UpdateList(ACSblk->ev_window);
	} else
	{
		Auo_editor(&ACSblk->ev_window->work[D_LIST_EDITOR], AUO_EDLIVE, NULL);
	}
	Ax_free(item);
#undef row1
}

/* -------------------------------------------------------------------------- */

static void list_paste(void)
{
	RealList *list = ACSblk->ev_window->user;
	
	AddItem(ACSblk->ev_window, list->buff);
	UpdateList(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void live_list(void *obj, const char *text)
{
	Awindow *self = obj;
	boolean changed = FALSE;
	RealList *list = self->user;
	EDITSEL sel;
	
	UNUSED(text);
	Auo_editor(&self->work[D_LIST_EDITOR], AUO_EDGETSELECT, &sel);
	if (sel.row1 >= 0)
	{
		if (self->toolbar[T_LIST_OPEN].ob_state & OS_DISABLED)
		{
			self->toolbar[T_LIST_OPEN].ob_state &= ~OS_DISABLED;
			self->toolbar[T_LIST_CUT].ob_state &= ~OS_DISABLED;
			self->toolbar[T_LIST_COPY].ob_state &= ~OS_DISABLED;
			changed = TRUE;
		}
	} else
	{
		if (!(self->toolbar[T_LIST_OPEN].ob_state & OS_DISABLED))
		{
			self->toolbar[T_LIST_OPEN].ob_state |= OS_DISABLED;
			self->toolbar[T_LIST_CUT].ob_state |= OS_DISABLED;
			self->toolbar[T_LIST_COPY].ob_state |= OS_DISABLED;
			changed = TRUE;
		}
	}
	if (list->flags & LIST_HASITEM)
	{
		if (self->toolbar[T_LIST_PASTE].ob_state & OS_DISABLED)
		{
			self->toolbar[T_LIST_PASTE].ob_state &= ~OS_DISABLED;
			changed = TRUE;
		}
	} else
	{
		if (!(self->toolbar[T_LIST_PASTE].ob_state & OS_DISABLED))
		{
			self->toolbar[T_LIST_PASTE].ob_state |= OS_DISABLED;
			changed = TRUE;
		}
	}
	if (changed)
		self->obchange(self, A_TOOLBAR | ROOT, -1);
}

/* -------------------------------------------------------------------------- */

static Awindow *make_list(void *a)
{
	LISTDATA *listdata;
	Awiob ob;
	int16 dummy;
	long val;
	EDITLIVE live;
	RealList *list;
	Awindow *self;
	OBJECT *tree;
	
	if ((listdata = a) == NULL)
		return NULL;
	val = 7168 / listdata->len;
	if (val < 2)
		val = 2;
	LIST_WINDOW.iconblk = listdata->icon;
	if ((list = Ax_malloc(sizeof(*list))) == NULL)
		return NULL;
	if ((list->mem = Ax_malloc(listdata->len * val)) == NULL)
		return NULL; /* FIXME: leaks memory allocated above */
	if ((list->buff = Ax_malloc(listdata->len)) == NULL)
		return NULL; /* FIXME: leaks memory allocated above */
	LIST_WINDOW.name = strcpy(list->title, listdata->title);
	list->expara = listdata->expara;
	list->acc_item = listdata->acc_item;
	list->comp_item = listdata->comp_item;
	list->drag_item = listdata->drag_item;
	list->edit_item = listdata->edit_item;
	list->key_item = listdata->key_item;
	list->message = listdata->message;
	list->print_item = listdata->print_item;
	list->term_list = listdata->term_list;
	list->flags = 0;
	list->len = listdata->len;
	list->count = 0;
	list->memcount = list->memskip = val;
	memset(list->mem, 0, listdata->len * val);
	if ((self = Awi_create(&LIST_WINDOW)) == NULL)
	{
		Ax_free(list->buff);
		Ax_free(list->mem);
		Ax_free(list);
		return NULL;
	}
	if (listdata->winsize.h > 0 && listdata->winsize.w > 0)
	{
		memcpy(&self->wi_act, &listdata->winsize, sizeof(self->wi_act));
		wind_calc(WC_WORK, self->wi_kind, self->wi_act.x, self->wi_act.y, self->wi_act.w, self->wi_act.h,
			&dummy, &dummy, &self->work->ob_width, &self->work->ob_height);
		if (self->toolbar != NULL)
			self->work->ob_height -= self->toolbar->ob_height;
	}
	self->user = list;

	tree = &self->work[D_LIST_EDITOR];
	Auo_editor(tree, AUO_ED01SELECT, NULL);
	val = 999999L;
	Auo_editor(tree, AUO_EDWRAP, &val);
	val = 512;
	Auo_editor(tree, AUO_EDCFULL, &val);
	Auo_editor(tree, AUO_BEGIN, NULL);
	Auo_editor(tree, AUO_EDSLIDERS, NULL);
	ob.window = self;
	ob.entry = &self->work[D_LIST_SLIDER];
	ob.obnr = D_LIST_SLIDER;
	Auo_editor(tree, AUO_EDVERSLIDER, &ob);
	live.call = live_list;
	live.obj = self;
	Auo_editor(tree, AUO_EDCALL, &live);
	Auo_editor(tree, AUO_FULLUPDATE, NULL);
	
	return self;
}

/* -------------------------------------------------------------------------- */

static boolean serv_list(Awindow *self, int16 task, void *in_out)
{
	RealList *list = self->user;
	LISTITEM *item;
	
	switch (task)
	{
	case AS_TERM:
		if (list->term_list(list->expara) == FALSE && !ACSblk->appexit)
			return FALSE;
#if WITH_FIXES
		Ax_free(list->buff);
#endif
		Ax_free(list->mem);
		Ax_free(list);
		Awi_delete(self);
		break;
	
	case AS_INFO:
		list->message(LM_INFO, list->expara);
		break;
	
	case AS_LIST_UPDATE:
		return UpdateList(self);
	
	case AS_LIST_COUNT:
		*((long *)in_out) = list->count;
		break;
	
	case AS_LIST_ADD:
		return AddItem(self, in_out);
	
	case AS_LIST_DELETE:
		return DeleteItem(self, *((long *)in_out));
	
	case AS_LIST_GET:
		item = in_out;
		return GetItem(self, item->idx, item->item);
	
	case AS_LIST_GET_DIRTY:
		if (list->flags & LIST_CHANGED)
			*((boolean *)in_out) = TRUE;
		else
			*((boolean *)in_out) = FALSE;
		break;
	
	case AS_LIST_REPLACE:
		item = in_out;
		return ReplaceItem(self, item->idx, item->item);
	
	case AS_LIST_RESET_DIRTY:
		list->flags &= ~LIST_CHANGED;
		break;
	
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void size_list(Awindow *self, Axywh *area)
{
	OBJECT *work;
	OBJECT *menu;
	int16 x, y;
	
	if (area->w < ACSblk->gl_wbox * 5)
		area->w = ACSblk->gl_wbox * 5;
	if (area->h < ACSblk->gl_hbox * 5)
		area->h = ACSblk->gl_hbox * 5;
	work = self->work;
	menu = self->menu;
	wind_calc(WC_WORK, self->wi_kind, 0, 0, area->w, area->h, &x, &y, &work->ob_width, &work->ob_height);
	area->x = ((area->x + 7) & -9) - x;
	if (menu != NULL)
		work->ob_height -= menu[menu[ROOT].ob_head].ob_height;
	if (self->toolbar != NULL)
		work->ob_height -= self->toolbar->ob_height;
	
	Auo_editor(&work[D_LIST_EDITOR], AUO_EDRESIZE, NULL);
	Auo_editor(&work[D_LIST_EDITOR], AUO_EDSLIDERS, NULL);
	Awi_sized(self, area);
}

/* -------------------------------------------------------------------------- */

static void vslide_list(Awindow *self, int16 pos)
{
	OBJECT *slider;
	AUSERBLK *auser;
	
	slider = &self->work[D_LIST_SLIDER];
	auser = slider->ob_spec.auserblk;
	auser->ub_serv(slider, AUO_SLWIPOS, &pos);
	auser->ub_serv(slider, AUO_UPDATE, NULL);
	auser->ub_serv(slider, AUO_SLLIVE, NULL);
}

/* -------------------------------------------------------------------------- */

Awindow *get_list(void)
{
	return &LIST_WINDOW;
}
