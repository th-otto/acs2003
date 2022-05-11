#include "acs_i.h"
#include "country.h"

static void li_new(void);
static void li_setfree(void);
static void li_info(void);
static void li_open(void);
static void li_changename(void);
static void li_scope(void);
static boolean li_service(Awindow *self, int16 task, void *in_out);
static Awindow *li_make(void *para);
static int16 li_init(Awindow *window);

#include "edlist.ah"
#include "edlist.h"

static AUSERBLK dither = { A_3Dbutton, 0x00000078L, Auo_string, NULL, NULL, NULL, NULL, NULL };

static OBJECT inner[2] = {
	{ -1, -1, -1, G_USERDEF, 0x1800, 0, C_UNION(&dither), 0, 0, 100, 100 },
	{ 0, 0, 0, 0, AEO, 0, C_UNION(0), 0, 0, 0, 0 }
};

/* FIXME: array of 2 OBJECT */
static OBJECT proto = { 0, -1, -1, G_ICON, 0x2005, 0x0000, C_UNION(0), 8, 8, 72, 40 };
static AOBJECT pra02 = { NULL, NULL, AEO, 0, NULL, NULL, 0, 0 };

static void li_wopen(Awindow *self);
static boolean li_open_wi(Awindow *self, int16 obnr);
static void li_winfo(Awindow *self);
static void drag(Awindow *self);
static void li_newwi(Awindow *self);
static void li_open_it(void);
static void term(Awindow *self);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

Obj_Head *find_entry(Obj_Head *obj, const char *str)
{
	int count;
	Obj_Head **entries;
	
	count = (int)(obj->used / sizeof(*entries));
	entries = obj->object;
	while (count > 0)
	{
		if (strcmp(str, (*entries)->label) == 0)
			return *entries;
		entries++;
		count--;
	}
	return NULL;
}

/* -------------------------------------------------------------------------- */

int16 add_entry(Obj_Head *obj, Obj_Head *str)
{
	int i;
	Obj_Head **entries;
	
	if (objextent(obj, sizeof(*entries)) != OK)
		return FAIL;
	i = (int)(obj->used / sizeof(*entries)) - 1;
	obj->used += sizeof(*entries);
	entries = obj->object;
	entries += i;
	while (i >= 0 && strcmp(str->label, (*entries)->label) < 0)
	{
		entries[1] = entries[0];
		entries--;
		i--;
	}
	entries[1] = str;
	if (obj->window != NULL)
		obj->window->state |= AWS_LATEUPDATE;
	return OK;
}

/* -------------------------------------------------------------------------- */

void del_entry(Obj_Head *obj, Obj_Head *str)
{
	int i, count;
	Obj_Head **entries;
	
	count = (int)(obj->used / sizeof(*entries)) - 1;
	entries = obj->object;
	for (i = 0; i <= count && entries[i] != str; i++)
		;
	if (i <= count)
	{
		while (i < count)
		{
			entries[i] = entries[i + 1];
			i++;
		}
		obj->used -= sizeof(*entries);
		if (obj->window != NULL)
			obj->window->state |= AWS_LATEUPDATE;
	}
}

/* -------------------------------------------------------------------------- */

static void delete(Awindow *win)
{
	LISTPARM *list;
	int16 obnr;
	Obj_Head *obj;
	AOBJECT *aobj;
	
	if (win == ACSblk->Aselect.window)
	{
		list = win->user;
		ACSblk->Aselect.next = 0;
		while ((obnr = Adr_next()) > 0)
		{
			aobj = (AOBJECT *)&win->work[obnr] + 1;
			obj = aobj->userp1;
			if (obj->flags & OBJ_GLOBAL)
			{
				Adr_del(win, obnr);
				obj->flags &= ~OBJ_GLOBAL;
				list->del_ob(list->acs, obj);
				win->state |= AWS_LATEUPDATE;
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static void li_changename(void)
{
	int16 obnr;
	LISTPARM *list;
	AOBJECT *aobj;
	Obj_Head *obj;
	Awindow *win;
	
	ACSblk->Aselect.next = 0;
	if ((obnr = Adr_next()) > 0)
	{
		aobj = (AOBJECT *)&ACSblk->ev_window->work[obnr] + 1;
		list = ACSblk->ev_window->user;
		obj = aobj->userp1;
		if (new2label(list->acs, obj, list->asktitle))
		{
			objname(list->acs, obj, obj->label, list->asktitle);
			Adr_unselect();
			del_entry(list->objlist, obj);
			add_entry(list->objlist, obj);
			if (list->service)
				list->service(list->acs, LS_CHANGEOBJ, obj);
			if ((win = obj->window) != NULL)
				win->service(win, AS_GUI_10000, NULL);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void li_setfree(void)
{
	Awindow *self;
	LISTPARM *list;
	int16 obnr;
	AOBJECT *aobj;
	Obj_Head *obj;
	
	self = ACSblk->ev_window;
	list = self->user;
	ACSblk->Aselect.next = 0;
	while ((obnr = Adr_next()) > 0)
	{
		aobj = (AOBJECT *)&self->work[obnr] + 1;
		self->work[obnr].ob_state &= ~OS_OUTLINED;
		obj = aobj->userp1;
		if (!(obj->flags & OBJ_GLOBAL))
		{
			list->acs->flags |= ACS_CHANGED;
			obj->usage++;
			obj->flags |= OBJ_GLOBAL;
			self->state |= AWS_LATEUPDATE;
		}
		Adr_del(self, obnr);
	}
}

/* -------------------------------------------------------------------------- */

static void li_open(void)
{
	li_wopen(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void li_wopen(Awindow *self)
{
	int16 obnr;
	
	ACSblk->Aselect.next = 0;
	while ((obnr = Adr_next()) > 0)
	{
		if (!li_open_wi(self, obnr))
			return;
		Adr_del(self, obnr);
	}
}

/* -------------------------------------------------------------------------- */

static void li_info(void)
{
	li_winfo(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void li_winfo(Awindow *self)
{
	LISTPARM *list;
	Awindow *win;
	int16 obnr;
	AOBJECT *aobj;
	Obj_Head *obj;
	char buf[26];
	
	list = self->user;
	if (ACSblk->Aselect.actlen == 0 || self != ACSblk->Aselect.window)
	{
		win = WI_INFO_LISTSELF.create(&WI_INFO_LISTSELF);
		if (win != NULL)
		{
			Aob_puttext(win->work, INFO_LISTSELF_FILENAME, list->acs->filename);
			Aob_puttext(win->work, INFO_LISTSELF_OBJNAME, list->objlist->label);
			sprintf(buf, "%li", list->objlist->used / sizeof(void *));
			Aob_puttext(win->work, INFO_LISTSELF_USED, buf);
			Awi_dialog(win);
			Awi_delete(win);
		}
	} else
	{
		ACSblk->Aselect.next = 0;
		while ((obnr = Adr_next()) > 0)
		{
			aobj = (AOBJECT *)&self->work[obnr] + 1;
			obj = aobj->userp1;
			win = WI_INFO_LIST.create(&WI_INFO_LIST);
			if (win != NULL)
			{
				Aob_puttext(win->work, INFO_LIST_FILENAME, list->acs->filename);
				Aob_puttext(win->work, INFO_LIST_LISTNAME, list->objlist->label);
				Aob_puttext(win->work, INFO_LIST_OBJNAME, obj->label);
				sprintf(buf, "%li", obj->used);
				Aob_puttext(win->work, INFO_LIST_USED, buf);
				sprintf(buf, "%i", obj->usage);
				Aob_puttext(win->work, INFO_LIST_USAGE, buf);
				Awi_dialog(win);
				Awi_delete(win);
				Adr_del(self, obnr);
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static void dragged(void)
{
	drag(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static Obj_Head *generate(LISTPARM *list, Obj_Head *obj)
{
	Obj_Head *objlist;
	Obj_Head *copy;
	Obj_Head **dummy;
	
	if (obj == NULL)
		return NULL;
	objlist = list->objlist;
	if (runasdemo && (int)(objlist->used / sizeof(void *)) >= 2)
	{
		acs_register();
		return NULL;
	}
	copy = list->copy_ob(list->acs, obj);
	if (copy != NULL)
	{
		strcpy(copy->label, obj->label);
		uniquename(list->acs, copy, &dummy);
		if (new2label(list->acs, copy, list->asktitle) == FALSE)
		{
			list->del_ob(list->acs, copy);
			return NULL;
		}
		objname(list->acs, copy, copy->label, list->asktitle);
		add_entry(objlist, copy);
		if (list->service)
			list->service(list->acs, LS_CREATEOBJ, copy);
		copy->flags |= OBJ_GLOBAL;
	}
	return copy;
}

/* -------------------------------------------------------------------------- */

static void drag(Awindow *self)
{
	LISTPARM *list;
	Awindow *select;
	int16 count;
	int16 obnr;
	AOBJECT **objlist;
	AOBJECT **p;
	AOBJECT *aobj;
	
	list = self->user;
	select = ACSblk->Aselect.window;
	ACSblk->Aselect.next = 0;
	count = ACSblk->Aselect.actlen;
	p = objlist = Ax_malloc(count * sizeof(*objlist));
	if (p != NULL)
	{
		while ((obnr = Adr_next()) > 0)
		{
			if (obnr & 0x1000)
			{
				*p++ = (AOBJECT *)&select->toolbar[obnr & 0xfff] + 1;
			} else
			{
				*p++ = (AOBJECT *)&select->work[obnr] + 1;
			}
		}
		Adr_unselect();
		for (obnr = 0; obnr < count; obnr++)
		{
			aobj = objlist[obnr];
			if (aobj->type == 2)
				li_newwi(self);
			else if (aobj->type == list->type)
				generate(list, aobj->userp1);
		}
		Ax_free(objlist);
	}
}

/* -------------------------------------------------------------------------- */

static void li_newwi(Awindow *self)
{
	LISTPARM *list;
	EDPARM parm;
	
	list = self->user;
	parm.obj = generate(list, list->prototyp);
	if (parm.obj != NULL)
	{
		self->kind |= AW_STAY;
		parm.acs = list->acs;
		list->window->create(&parm);
		self->kind &= ~AW_STAY;
	}
}

/* -------------------------------------------------------------------------- */

static void li_new(void)
{
	li_newwi(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static int16 li_init(Awindow *self)
{
	LISTPARM *list;
	Obj_Head *objlist;
	OBJECT *tree;
	AOBJECT *aobj;
	int16 x, y;
	int16 i;
	
	if (self == ACSblk->Aselect.window)
		Adr_unselect();
	list = self->user;
	objlist = list->objlist;
	x = y = 0;
	tree = self->work;
	if (tree != NULL)
	{
		x = tree->ob_x;
		y = tree->ob_y;
		Ax_free(tree);
	}
	tree = list->new_work(objlist);
	if (tree == NULL)
	{
		tree = Aob_create(&LIST_NOT);
		self->work = tree;
		return FAIL;
	}
	aobj = (AOBJECT *)tree + 1;
	aobj->drag = dragged;
	for (i = tree->ob_head; i > ROOT; i = tree[i].ob_next)
	{
		aobj = (AOBJECT *)&tree[i] + 1;
		aobj->click = li_open_it;
	}
	self->work = tree;
	tree->ob_x = x;
	tree->ob_y = y;
	self->state |= AWS_FORCEREDRAW;
	return OK;
}

/* -------------------------------------------------------------------------- */

static Awindow *li_make(void *para)
{
	LISTPARM *list;
	Obj_Head *objlist;
	Awindow *win;
	char info[70]; /* BUG: too short */
	char *basename;
	
	list = para;
	objlist = list->objlist;
	win = objlist->window;
	if (win != NULL)
	{
		Awi_show(win);
	} else
	{
		if ((list = Ax_malloc(sizeof(*list))) == NULL)
			return NULL;
		memcpy(list, para, sizeof(*list));
		WI_LIST.name = list->name;
		info[0] = ' ';
		strcpy(&info[1], list->acs->filename);
		WI_LIST.info = info;
		WI_LIST.iconblk = list->window->iconblk;
		if ((basename = strrchr(list->acs->filename, PATH_SEP)) == NULL)
			basename = list->acs->filename;
		else
			basename++;
		WI_LIST.iconblk->monoblk.ib_ptext = basename;
		win = Awi_create(&WI_LIST);
		if (win == NULL)
		{
			Ax_free(list);
			return NULL;
		}
		wi_pos(win, &objlist->pos, &list->acs->last_rez);
		win->user = list;
		objlist->window = win;
		if (list->prototyp == NULL)
			win->menu[MEN_LIST_NEW].ob_state |= OS_DISABLED;
		if (win->open(win) != OK)
		{
			term(win);
			return NULL;
		}
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static void li_open_it(void)
{
	li_open_wi(ACSblk->ev_window, ACSblk->ev_obnr);
}

/* -------------------------------------------------------------------------- */

static boolean li_open_wi(Awindow *self, int16 obnr)
{
	LISTPARM *list;
	EDPARM parm;
	boolean ret;
	Obj_Head **objlist;
	
	list = self->user;
	self->kind |= AW_STAY;
	parm.acs = list->acs;
	objlist = list->objlist->object;
	parm.obj = objlist[(obnr - 2) >> 1];
	ret = list->window->create(&parm) != NULL;
	self->kind &= ~AW_STAY;
	return ret;
}

/* -------------------------------------------------------------------------- */

static boolean li_service(Awindow *self, int16 task, void *in_out)
{
	AOBJECT *aobj;
	Obj_Head *obj;
	int16 obnr;
	
	obnr = 2;
	switch (task)
	{
	case AS_TERM:
		term(self);
		break;
	
	case AS_DRAGGED:
		drag(self);
		break;
	
	case AS_OPEN:
		li_wopen(self);
		break;
	
	case AS_INFO:
		li_winfo(self);
		break;
	
	case AS_SELECTADD:
	case AS_SELECTDEL:
		self->menu[MEN_LIST_SCOPE].ob_state |= OS_DISABLED;
		if (ACSblk->Aselect.actlen == 1)
		{
			self->menu[MEN_LIST_NAME].ob_state &= ~OS_DISABLED;
			aobj = (AOBJECT *)&self->work[ACSblk->Aselect.array[0]] + 1;
			obj = aobj->userp1;
			if (obj->flags & OBJ_GLOBAL)
				self->menu[MEN_LIST_SCOPE].ob_state &= ~OS_DISABLED;
		} else
		{
			self->menu[MEN_LIST_NAME].ob_state |= OS_DISABLED;
		}
		if (ACSblk->Aselect.actlen > 0)
		{
			self->menu[MEN_LIST_FREE].ob_state &= ~OS_DISABLED;
			self->menu[MEN_LIST_OPEN].ob_state &= ~OS_DISABLED;
		} else
		{
			self->menu[MEN_LIST_FREE].ob_state |= OS_DISABLED;
			self->menu[MEN_LIST_OPEN].ob_state |= OS_DISABLED;
		}
		break;
	
	case AS_DELETE:
		delete(self);
		break;
	
	case AS_LOOKSTRING:
		if (((LISTPARM *)self->user)->type == LIST_REFS)
		{
			while (obnr < self->work[ROOT].ob_tail)
			{
				if (self->work[obnr].ob_flags & OF_LASTOB)
					break;
				if (self->work[obnr + 1].ob_flags & AEO)
				{
					aobj = (AOBJECT *)&self->work[obnr] + 1;
					obj = aobj->userp1;
					if (obj != NULL && obj->object != NULL && strstr(obj->object, in_out) != NULL)
					{
						li_open_wi(self, obnr);
					}
				}
				/* skip OBJECT & AOBJECT */
				obnr += 2;
			}
		}
		break;
		
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void term(Awindow *self)
{
	LISTPARM *list;
	
	list = self->user;
	list->objlist->window = NULL;
	if (self->state & AWS_ICONIZED)
		memcpy(&list->objlist->pos, &self->wi_normal, sizeof(list->objlist->pos));
	else
		memcpy(&list->objlist->pos, &self->wi_act, sizeof(list->objlist->pos));
	Ax_free(list);
	Ax_free(self->work);
	self->work = NULL;
	Awi_delete(self);
}

/* -------------------------------------------------------------------------- */

OBJECT *work_icon(Obj_Head *objlist, CICONBLK *icon, int16 type)
{
	Obj_Head **entries;
	int i, count;
	OBJECT *tree;
	OBJECT *ptr;
	CICONBLK *dstcicon;
	
	entries = objlist->object;
	pra02.type = type;
	count = (int)(objlist->used / sizeof(*entries));
	tree = Ax_malloc((count + 1) * (sizeof(*tree) * 2 + sizeof(*icon)));
	if (tree == NULL)
		return NULL;
	
	memcpy(tree, inner, 2 * sizeof(OBJECT));
	ptr = tree;
	if (count > 0)
	{
		dstcicon = (CICONBLK *)(&tree[count * 2] + 2);
		i = 1;
		while (count > 0)
		{
			Obj_Head *obj;
			
			i++;
			ptr += 2;
			memcpy(ptr, &proto, 2 * sizeof(OBJECT));
			memcpy(dstcicon, icon, sizeof(*icon));
			ptr->ob_next = i * 2;
			ptr->ob_spec.ciconblk = dstcicon;
			obj = entries[i - 2];
			ptr[1].ob_spec.auserblk = (void *)obj; /* set userp1 in AOBJECT */
			if (!(obj->flags & OBJ_GLOBAL))
				ptr->ob_state |= OS_OUTLINED;
			Aob_icon(ptr);
			dstcicon->monoblk.ib_ptext = entries[i - 2]->label;
			dstcicon++;
			count--;
		}
		tree[ROOT].ob_head = 2;
		tree[ROOT].ob_tail = (i - 1) * 2;
		ptr->ob_next = ROOT;
	}
	ptr[1].ob_flags |= OF_LASTOB;
	
	return tree;
}

/* -------------------------------------------------------------------------- */

static void li_scope(void)
{
	Awindow *self;
	LISTPARM *list;
	int16 obnr;
	AOBJECT *aobj;
	Obj_Head *obj;
	Awindow *win;
	
	self = ACSblk->ev_window;
	list = self->user;
	ACSblk->Aselect.next = 0;
	while ((obnr = Adr_next()) > 0)
	{
		aobj = (AOBJECT *)&self->work[obnr] + 1;
		obj = aobj->userp1;
		win = WI_INFO_SCOPE.create(&WI_INFO_SCOPE);
		if (win != NULL)
		{
			if ((obj->flags & (OBJ_GLOBAL | OBJ_LOCAL)) == OBJ_GLOBAL)
			{
				win->work[INFO_SCOPE_LOCAL].ob_state &= ~OS_SELECTED;
				win->work[INFO_SCOPE_GLOBAL].ob_state |= OS_SELECTED;
			} else
			{
				win->work[INFO_SCOPE_LOCAL].ob_state |= OS_SELECTED;
				win->work[INFO_SCOPE_GLOBAL].ob_state &= ~OS_SELECTED;
			}
			if (Awi_dialog(win) == INFO_SCOPE_OK)
			{
				if (win->work[INFO_SCOPE_GLOBAL].ob_state & OS_SELECTED)
					obj->flags &= ~OBJ_LOCAL;
				else
					obj->flags |= OBJ_LOCAL;
				list->acs->flags |= ACS_CHANGED;
			}
			Awi_delete(win);
			Adr_del(self, obnr);
		}
	}
}
