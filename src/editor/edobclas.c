#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"

static void eded_try(void);
static void eded_info(void);
static void eded_parts(void);
static void eded_keys(void);

static Awindow *make_a_window(void *a);

static int16 open_me(Awindow *self);
static int16 key_me(Awindow *self, int16 kstate, int16 key);
static void top_me(Awindow *self);
static void close_me(Awindow *self);
static void move_me(Awindow *self, Axywh *rect);

#include "edobclas.ah"
#include "edobclas.h"

static int16 CDECL user_dummy(PARMBLK *pb);
static void ed_info(Awindow *self);
static void reorg(Obj_Head *obj, Awindow *win);
static void map_user(Obj_Head *src, AUSERBLK *dst);

static int visible_editors = 0;
static AUSERBLK control = { user_control, 0L, NULL, NULL, NULL, NULL, NULL, NULL };
static struct {
	OBJECT entry;
	OBJECT ent01;
	AOBJECT ent02;
} protoentry = {
	{ -1, -1, -1, 0, 0, 0, C_UNION(0L), 0, 0, 0, 0 },
	{ -1, -1, -1, G_USERDEF, 0x0040, 0x2030, C_UNION(&control), 0, 0, 0, 0 },
	{ ed_edit, ed_dragged, AEO, 0, NULL, NULL, 0, 11000 }
};
static AUSERBLK dither = { A_3Dbutton, 0x00000078L, NULL, NULL, NULL, NULL, NULL, NULL };
static OBJECT deskob = { -1, 1, 2, G_USERDEF, 0x0040, 0x2000, C_UNION(&dither), 0, 0, 4, 2 };

static int16 pxy[4]; /* FIXME: why static? */

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static Awindow *make_a_window(void *parent)
{
	Awindow *win;
	
	win = Awi_create(parent);
	if (win == NULL)
		return NULL;
	return win;
}

/* -------------------------------------------------------------------------- */

static void close_uc(Awindow *self)
{
	--visible_editors;
	if (visible_editors <= 0 && parts_window->wi_id >= 0)
	{
		parts_window->closed(parts_window);
	}
	if (self->wi_id >= 0)
		Awi_closed(self);
}

/* -------------------------------------------------------------------------- */

static void close_me(Awindow *self)
{
	OBJEDPARM *parm;
	
	parm = self->user;
	if (parm->flags == 1 || self->work == NULL)
	{
		close_uc(self);
	} else
	{
		ACSblk->ev_window = self;
		parm->ok();
	}
}

/* -------------------------------------------------------------------------- */

static int16 open_me(Awindow *self)
{
	if (visible_editors == 0)
	{
		if (parts_window->open(parts_window) != OK)
			return FAIL;
	}
	visible_editors++;
	if (Awi_open(self) == FAIL)
	{
		close_uc(self);
		return FAIL;
	}
	glue_parts(self);
	return OK;
}

/* -------------------------------------------------------------------------- */

static void top_me(Awindow *self)
{
	if (visible_editors != 0)
	{
		Awi_show(parts_window);
		glue_parts(self);
	}
	Awi_topped(self);
}

/* -------------------------------------------------------------------------- */

static void move_me(Awindow *self, Axywh *rect)
{
	Awi_moved(self, rect);
	glue_parts(self);
}

/* -------------------------------------------------------------------------- */

static int16 key_me(Awindow *self, int16 kstate, int16 key)
{
	OBJEDPARM *parm;
	
	parm = self->user;
	if (parm != NULL && parm->flags == 1)
	{
		if ((char)(key & 0xff) == NK_HELP)
		{
			Awi_help(self);
		} else
		{
			if (key > 0)
			{
				ACSblk->ev_window = self;
				switch (Ach_toupper(key & 0xff))
				{
				case 'R':
					edob_refs();
					break;
				case 'F':
					edob_aflags();
					break;
				case 'S':
					edob_specs();
					break;
				case 'P':
					edob_pos();
					break;
				case NK_HELP:
					Awi_help(self);
					break;
				default:
					return -1;
				}
			} else if ((char)key == NK_TAB)
			{
				edob_next();
			} else
			{
				return -1;
			}
		}
		return 0;
	}
	return Awi_keys(self, kstate, key);
}

/* -------------------------------------------------------------------------- */

static void eded_info(void)
{
	ed_info(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void eded_parts(void)
{
	Awi_show(parts_window);
}

/* -------------------------------------------------------------------------- */

static void ed_info(Awindow *self)
{
	OBJEDPARM *parm;
	Obj_Head *obj;
	Awindow *win;
	char buf[10];
	
	parm = self->user;
	obj = parm->obj;
	win = WI_INFO.create(&WI_INFO);
	if (win != NULL)
	{
		Aob_puttext(win->work, INFO_EDIT_FILENAME, parm->acs->filename);
		Aob_puttext(win->work, INFO_EDIT_LABEL, obj->label);
		sprintf(buf, "%4ld", obj->used / sizeof(OBJ_ENTRY));
		Aob_puttext(win->work, INFO_EDIT_USED, buf);
		Awi_dialog(win);
		Awi_delete(win);
	}
}

/* -------------------------------------------------------------------------- */

static void eded_keys(void)
{
	OBJEDPARM *parm;
	Obj_Head *obj;
	Obj_Head *strobj;
	OBJ_ENTRY *entry;
	int i, count;
	char *text;
	int len;
	int key;
	char buf[32];
	TEDINFO *ted;
	char *keystr;
	
	parm = ACSblk->ev_window->user;
	obj = parm->obj;
	entry = obj->object;
	count = (int)(obj->used / sizeof(*entry));
	for (i = 0; i < count; entry++, i++)
	{
		switch ((char)entry->obj.ob_type)
		{
		case G_BUTTON:
		case G_STRING:
		case G_TITLE:
			strobj = (Obj_Head *) entry->obj.ob_spec.free_string;
			break;
		case G_TEXT:
		case G_BOXTEXT:
			ted = ((Obj_Head *)entry->obj.ob_spec.tedinfo)->object;
			strobj = (Obj_Head *) ted->te_ptext;
			break;
		default:
			strobj = NULL;
			break;
		}
		if (strobj != NULL)
		{
			text = strobj->object;
			len = (int)strlen(text);
			if (len > 30)
				len -= 30;
			else
				len = 0;
			buf[0] = '\0';
			len = (int)strlen(strncat(buf, &text[len], 30));
			while (len > 0 && buf[len - 1] == ' ')
				len--;
			if (len != 0)
			{
				buf[len] = '\0';
				if ((keystr = strrchr(buf, ' ')) != NULL)
				{
					if ((key = key_code(&keystr[1])) != 0)
					{
						parm->acs->flags |= ACS_CHANGED;
						entry->aobj.key = key;
					}
				}
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static int16 click_ans(Awindow *self, int16 obnr)
{
	Awindow *win;
	OBJEDPARM *parm;
	OBJ_ENTRY *entry;
	Obj_Head *click;
	int16 ans;
	
	parm = self->user;
	win = WI_TRYCLICK.create(&WI_TRYCLICK);
	if (win == NULL)
		return 0;
	Aob_puttext(win->work, TRY_CLICK_FILENAME, strrchr(parm->acs->filename, PATH_SEP) + 1);
	Aob_puttext(win->work, TRY_CLICK_LABEL, parm->obj->label);
	entry = parm->obj->object;
	click = (Obj_Head *)entry[obnr >> 1].aobj.click;
	if (click == NULL)
	{
		Aob_puttext(win->work, TRY_CLICK_CLICKFUNC, "- NULL -");
	} else
	{
		Aob_puttext(win->work, TRY_CLICK_CLICKFUNC, click->label);
	}
	click = (Obj_Head *)entry[obnr >> 1].label;
	if (click == NULL)
	{
		Aob_puttext(win->work, TRY_CLICK_INDEX, "- NULL -");
	} else
	{
		Aob_puttext(win->work, TRY_CLICK_INDEX, click->label);
	}
	ans = Awi_dialog(win);
	Awi_delete(win);
	return ans;
}

/* -------------------------------------------------------------------------- */

static void try_click(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = ACSblk->ev_object;
	
	if (click_ans(self, ACSblk->ev_obnr) != TRY_CLICK_OK)
	{
		if (tree == self->work || tree == self->menu)
			ed_abort();
		else
			ACSblk->dia_abort = TRUE;
	}
}

/* -------------------------------------------------------------------------- */

static void try_drag(void)
{
	OBJEDPARM *parm = ACSblk->ev_window->user;
	int16 obnr = ACSblk->ev_obnr;
	Awindow *win;
	OBJ_ENTRY *entry;
	Obj_Head *drag;
	int16 ans;
	
	if ((win = WI_TRYDRAG.create(&WI_TRYDRAG)) != NULL)
	{
		Aob_puttext(win->work, TRY_DRAG_FILENAME, strrchr(parm->acs->filename, PATH_SEP) + 1);
		Aob_puttext(win->work, TRY_DRAG_LABEL, parm->obj->label);
		entry = parm->obj->object;
		drag = (Obj_Head *)entry[obnr >> 1].aobj.drag;
		if (drag == NULL)
		{
			Aob_puttext(win->work, TRY_DRAG_DRAGFUNC, "- NULL -");
		} else
		{
			Aob_puttext(win->work, TRY_DRAG_DRAGFUNC, drag->label);
		}
		drag = (Obj_Head *)entry[obnr >> 1].label;
		if (drag == NULL)
		{
			Aob_puttext(win->work, TRY_DRAG_INDEX, "- NULL -");
		} else
		{
			Aob_puttext(win->work, TRY_DRAG_INDEX, drag->label);
		}
		ans = Awi_dialog(win);
		Awi_delete(win);
		if (ans == TRY_DRAG_OK)
		{
			ACSblk->Aselect.dragback = 0;
			Adr_unselect();
		} else
		{
			ed_abort();
		}
	}
}
	
/* -------------------------------------------------------------------------- */

static ACSCICONBLK *fix_cicon(ACSCICONBLK *icon)
{
	ACSCICONBLK *newicon;
	int32 offset;
	CICON *next;
	
	newicon = Ax_malloc(sizeof(*newicon));
	if (newicon == NULL)
		return NULL;
	memcpy(newicon, icon, sizeof(*newicon));
	offset = (int32)icon;
	*((char **)&newicon->cicon.monoblk.ib_pmask) += offset;
	*((char **)&newicon->cicon.monoblk.ib_pdata) += offset;
	newicon->cicon.monoblk.ib_ptext = Ast_create(((Obj_Head *)newicon->cicon.monoblk.ib_ptext)->object);
	next = NULL;
	if (icon->c16.num_planes != 0 && ACSblk->nplanes >= 4)
		next = &newicon->c16;
	if (icon->c256.num_planes != 0 && ACSblk->nplanes >= 8)
		next = &newicon->c256;
	newicon->cicon.mainlist = next;
	if (next != NULL)
	{
		next->col_mask = ((Obj_Head *)next->col_mask)->object;
		next->col_data = to_cicon(((Obj_Head *)next->col_data)->object, next->col_mask, &newicon->cicon, next->num_planes);
		if (next->col_data == NULL)
			return NULL;
		if (next->sel_data != NULL)
		{
			next->sel_data = to_cicon(((Obj_Head *)next->sel_data)->object, ((Obj_Head *)next->sel_mask)->object, &newicon->cicon, next->num_planes);
			if (next->sel_data != NULL)
				next->sel_mask = ((Obj_Head *)next->sel_mask)->object;
			else
				next->sel_mask = NULL;
		}
		next->num_planes = ACSblk->nplanes;
	}
	return newicon;
}

/* -------------------------------------------------------------------------- */

static OBJECT *try(Obj_Head *obj, Awindow *win)
{
	AOBJECT *aobj;
	int i, count;
	OBJECT *tree;
	Awiob ob;
	OBJ_ENTRY *entry;
	boolean done;
	ACSCICONBLK *icon;
	OBJECT *res;
	Obj_Head *src;
	
	count = (int)(obj->used / sizeof(OBJ_ENTRY));
	res = tree = Ax_malloc(count * 2 * sizeof(*tree));
	if (tree == NULL)
		return NULL;
	Adr_unselect();
	reorg(obj, win);
	entry = obj->object;
	for (i = 0; i < count; i++)
	{
		memcpy(tree, &entry->obj, sizeof(OBJECT) + sizeof(AOBJECT));
		tree->ob_state &= ~AOS_CONST;
		if (tree->ob_next >= 0)
			tree->ob_next <<= 1;
		if (tree->ob_head >= 0)
			tree->ob_head <<= 1;
		if (tree->ob_tail >= 0)
			tree->ob_tail <<= 1;
		aobj = (AOBJECT *)tree + 1;
		aobj->click = try_click;
		aobj->drag = try_drag;
		switch ((char)tree->ob_type)
		{
		case G_TEXT:
		case G_BOXTEXT:
		case G_FTEXT:
		case G_FBOXTEXT:
			{
				TEDINFO *ted;
				
				src = (Obj_Head *)tree->ob_spec.tedinfo;
				ted = Ax_malloc(sizeof(*ted));
				if (ted == NULL)
				{
					/* FIXME: leaks all memory allocated so far */
					return NULL;
				}
				memcpy(ted, src->object, sizeof(*ted));
				ted->te_ptext = Ast_create(((Obj_Head *)ted->te_ptext)->object);
				ted->te_ptmplt = Ast_create(((Obj_Head *)ted->te_ptmplt)->object);
				ted->te_pvalid = Ast_create(((Obj_Head *)ted->te_pvalid)->object);
				ted->te_txtlen = (int)strlen(ted->te_ptext) + 1;  /* BUG: wrong for editable fields */
				ted->te_tmplen = (int)strlen(ted->te_ptmplt) + 1;
				tree->ob_spec.tedinfo = ted;
			}
			break;
		
		case G_IMAGE:
			{
				BITBLK *bit;
				
				src = (Obj_Head *)tree->ob_spec.bitblk;
				bit = Ax_malloc(sizeof(*bit));
				if (bit == NULL)
				{
					/* FIXME: leaks all memory allocated so far */
					return NULL;
				}
				memcpy(bit, src->object, sizeof(*bit));
				bit->bi_pdata = (int16 *)((char *)src->object + sizeof(*bit));
				tree->ob_spec.bitblk = bit;
			}
			break;
		
		case G_USERDEF:
			{
				AUSERBLK *user;
				
				src = (Obj_Head *)tree->ob_spec.auserblk;
				user = Ax_malloc(sizeof(*user));
				if (user == NULL)
				{
					/* FIXME: leaks all memory allocated so far */
					return NULL;
				}
				map_user(src, user);
				tree->ob_spec.auserblk = user;
				if (user->ub_serv != NULL)
				{
					done = TRUE;
					user->ub_serv(tree, AUO_CREATE, &done);
					ob.window = win;
					ob.entry = tree;
					ob.obnr = i * 2;
					user->ub_serv(tree, AUO_SELF, &ob);
				}
			}
			break;
		
		case G_BUTTON:
		case G_STRING:
		case G_TITLE:
			{
				src = (Obj_Head *)tree->ob_spec.free_string;
				tree->ob_spec.free_string = Ast_create(src->object);
			}
			break;
		
		case G_ICON:
		case G_CICON:
			{
				src = (Obj_Head *)tree->ob_spec.ciconblk;
				icon = fix_cicon(src->object);
				if (icon == NULL)
				{
					/* FIXME: leaks all memory allocated so far */
					return NULL;
				}
				tree->ob_spec.ciconblk = &icon->cicon;
			}
			break;
		}
		
		tree += 2;
		entry++;
	}
	tree--;
	tree->ob_flags |= OF_LASTOB;
	Aob_fix(res);
	return res;
}

/* -------------------------------------------------------------------------- */

static void eded_try(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJEDPARM *parm = self->user;
	ACS_HEAD *acs;
	Obj_Head *obj;
	OBJECT *tree;
	int16 kstate;
	int16 dummy;
	OBJECT *menu;
	
	acs = parm->acs;
	obj = parm->obj;
	tree = try(parm->obj, self);
	if (tree != NULL)
	{
		if (find_entry(acs->ob_list, obj->label) == obj)
		{
			graf_mkstate(&dummy, &dummy, &dummy, &kstate);
			if (kstate & K_CTRL)
			{
				self->init(self);
				A_dialog(tree);
				Aob_delete(tree);
			} else
			{
				change_work(self, tree, testmode, ed_abort, Aob_delete, NULL, NULL, NULL);
			}
		} else if (find_entry(acs->me_list, obj->label) == obj)
		{
			menu = Aob_create(&MINIOB);
			/* BUG: no null-pointer check */
			menu->ob_width = self->wi_work.w;
			menu->ob_height = self->wi_work.h;
			menu->ob_state |= AOS_FIXED;
			change_work(self, menu, testmode, ed_abort, Aob_delete, tree, NULL, NULL);
		} else if (find_entry(acs->pu_list, obj->label) == obj)
		{
			self->init(self);
			Amo_unbusy();
			Ame_popup(self, tree, -1, -1);
			Amo_busy();
			/* BUG: leaks whole tree */
		}
	}
}

/* -------------------------------------------------------------------------- */

int16 ed_init(Awindow *self)
{
	Awiob ob;
	OBJEDPARM *parm;
	OBJ_ENTRY *entry;
	boolean done;
	ACSCICONBLK *icon;
	Obj_Head *obj;
	OBJECT *tree;
	int i, count;
	int16 x, y;
	OBJECT *ptr;
	Obj_Head *src;
	
	if (ACSblk->Aselect.window == self)
		Adr_unselect();
	parm = self->user;
	obj = parm->obj;
	entry = obj->object;
	count = (int)(obj->used / sizeof(*entry));
	tree = self->work;
	x = y = 0;
	if (tree != NULL)
	{
		x = tree->ob_x;
		y = tree->ob_y;
		Aob_delete(tree);
	}
	parm->flags = 1;
	self->work = tree = Ax_malloc((count * 3 + 1) * sizeof(*tree));
	if (tree == NULL)
		return FAIL;
	memcpy(tree, &deskob, sizeof(*tree));
	ptr = tree + 1;
	protoentry.ent02.userp1 = obj;
	for (i = 0; i < count; i++, ptr += 3)
	{
		protoentry.ent02.userp2 = (void *)(int32)i;
		memcpy(ptr, &protoentry, sizeof(protoentry));
		memcpy(ptr, &entry[i].obj, sizeof(OBJECT));
		switch ((char)ptr->ob_type)
		{
		case G_TEXT:
		case G_BOXTEXT:
		case G_FTEXT:
		case G_FBOXTEXT:
			{
				TEDINFO *ted;
				
				src = (Obj_Head *)ptr->ob_spec.tedinfo;
				ted = Ax_malloc(sizeof(*ted));
				if (ted == NULL)
				{
					/* FIXME: leaks all memory allocated so far */
					return FAIL;
				}
				memcpy(ted, src->object, sizeof(*ted));
				ted->te_ptext = Ast_create(((Obj_Head *)ted->te_ptext)->object);
				ted->te_ptmplt = Ast_create(((Obj_Head *)ted->te_ptmplt)->object);
				ted->te_pvalid = Ast_create(((Obj_Head *)ted->te_pvalid)->object);
				ted->te_txtlen = (int)strlen(ted->te_ptext) + 1;  /* BUG: wrong for editable fields */
				ted->te_tmplen = (int)strlen(ted->te_ptmplt) + 1;
				ptr->ob_spec.tedinfo = ted;
			}
			break;
			
		case G_IMAGE:
			{
				BITBLK *bit;
				
				src = (Obj_Head *)ptr->ob_spec.bitblk;
				bit = Ax_malloc(sizeof(*bit));
				if (bit == NULL)
				{
					/* FIXME: leaks all memory allocated so far */
					return FAIL;
				}
				memcpy(bit, src->object, sizeof(*bit));
				bit->bi_pdata = (int16 *)((char *)src->object + sizeof(*bit));
				ptr->ob_spec.bitblk = bit;
			}
			break;
		
		case G_USERDEF:
			{
				AUSERBLK *user;
				
				src = (Obj_Head *)ptr->ob_spec.auserblk;
				user = Ax_malloc(sizeof(*user));
				if (user == NULL)
				{
					/* FIXME: leaks all memory allocated so far */
					return FAIL;
				}
				map_user(src, user);
				ptr->ob_spec.auserblk = user;
				if (user->ub_serv != NULL)
				{
					done = TRUE;
					user->ub_serv(ptr, AUO_CREATE, &done);
					ob.window = self;
					ob.entry = ptr;
					ob.obnr = i * 2;
					user->ub_serv(ptr, AUO_SELF, &ob);
				}
			}
			break;
		
		case G_BUTTON:
		case G_STRING:
		case G_TITLE:
			{
				src = (Obj_Head *)ptr->ob_spec.free_string;
				ptr->ob_spec.free_string = Ast_create(src->object);
			}
			break;
		
		case G_ICON:
		case G_CICON:
			{
				src = (Obj_Head *)ptr->ob_spec.ciconblk;
				if ((icon = fix_cicon(src->object)) == NULL)
				{
					/* FIXME: leaks all memory allocated so far */
					return FAIL;
				}
				ptr->ob_spec.ciconblk = &icon->cicon;
			}
			break;
		}
		
		ptr[1].ob_next = ptr[0].ob_next * 3 + 1;
		if (entry[ptr[0].ob_next].obj.ob_tail == i)
			ptr[1].ob_next++;
		if (ptr[0].ob_head >= 0)
		{
			ptr[1].ob_head = ptr[0].ob_head * 3 + 1;
			ptr[1].ob_tail = ptr[0].ob_tail * 3 + 2;
			ptr[0].ob_head = ptr[0].ob_tail = NIL;
		}
		ptr[0].ob_next = i * 3 + 2;
		ptr[1].ob_x = ptr[0].ob_x;
		ptr[1].ob_y = ptr[0].ob_y;
		ptr[1].ob_width = ptr[0].ob_width;
		ptr[1].ob_height = ptr[0].ob_height;
		if (ptr[0].ob_flags & OF_HIDETREE)
			ptr[1].ob_flags |= OF_HIDETREE;
		if (ptr[0].ob_state & AOS_LOCKED)
			ptr[1].ob_state |= AOS_LOCKED;
		ptr[0].ob_flags &= ~(OF_EDITABLE | OF_LASTOB | OF_INDIRECT | OF_SUBMENU | AO_ACCEPT | AO_DRAGABLE | AO_DEFABLE | AEO);
		ptr[0].ob_state &= ~(OS_WHITEBAK | OS_DRAW3D | AOS_LOCKED | AOS_CONST | AOS_DCLICK | AOS_FIXED);
	}
	
	ptr--;
	ptr->ob_flags |= OF_LASTOB;
	
	tree[2].ob_next = ROOT;
	tree[2].ob_x = tree[1].ob_x = tree[0].ob_width >> 1;
	tree[2].ob_y = tree[1].ob_y = tree[0].ob_height >> 1;
	tree[0].ob_width += tree[1].ob_width;
	tree[0].ob_height += tree[1].ob_height;
	
	if (parm->active >= 0)
		tree[parm->active].ob_flags |= AO_ACCEPT | AO_SILENT;
		
	Aob_fix(tree);
	
	tree->ob_x = x;
	tree->ob_y = y;
	
	return OK;
}

/* -------------------------------------------------------------------------- */

boolean ed_service(Awindow *self, int16 task, void *in_out)
{
	OBJEDPARM *parm = self->user;
	
	switch (task)
	{
	case AS_GETBUBBLE:
		((AGetObjText *)in_out)->text = NULL;
		break;
	
	case AS_ALLOWBUBBLE:
		*((boolean *)in_out) = TRUE;
		break;
	
	case AS_CONFIGDRAG:
		{
			int16 *drag;
			drag = in_out;

			if (snapping)
			{
				drag[0] = ACSblk->gl_wbox;
				drag[1] = ACSblk->gl_hbox;
			}
			drag[6] = 3;
			drag[7] = 11;
			drag[8] = 3;
			drag[9] = 12;
			drag[10] = 3;
			drag[11] = 11;
			drag[12] = 3;
			drag[13] = 12;
		}
		break;

	case AS_TERM:
		ed_term(self);
		break;
	
	case AS_ICONIZED:
		close_uc(self);
		break;
	
	case AS_GUI_RENAME_OBJ:
		new_name(self, parm->obj);
		break;
	
	case AS_DELETE:
		ed_delete(self);
		break;
	
	case AS_ACCLOSED:
		visible_editors = 0;
		break;
	
	case AS_INFO:
		ed_info(self);
		break;

	case AS_ASKACSOBJ:
		*((Awindow **)in_out) = self;
		break;
	
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

void ed_term(Awindow *self)
{
	OBJEDPARM *parm = self->user;
	
	self->state |= AWS_TERM;
	if (parm != NULL)
	{
		if (parm->flags == 2)
		{
			ACSblk->ev_window = self;
			parm->ok();
		}
		Ax_free(parm->select);
		reorg(parm->obj, self);
		if (self->state & AWS_ICONIZED)
			memcpy(&parm->obj->pos, &self->wi_normal, sizeof(parm->obj->pos));
		else
			memcpy(&parm->obj->pos, &self->wi_act, sizeof(parm->obj->pos));
		parm->obj->window = NULL;
		Ax_free(parm);
	}
	Awi_delete(self);
}

/* -------------------------------------------------------------------------- */

void set_userdef(Obj_Head *obj, AUSER_DEF *userdef)
{
	AUSERBLK *user = obj->object;
	
	userdef->parm = ((Obj_Head *)user->ub_parm)->label;
	userdef->serv = ((Obj_Head *)user->ub_serv)->label;
	if (user->ub_ptr1 == NULL)
		obj->flags &= ~(3 << 0);
	if (user->ub_ptr2 == NULL)
		obj->flags &= ~(3 << 2);
	if (user->ub_ptr3 == NULL)
		obj->flags &= ~(3 << 4);

	userdef->type1 = obj->flags & 3;
	switch (userdef->type1)
	{
	case NONE_PAR:
		userdef->data1 = NULL;
		userdef->len1 = 0;
		break;
	case REF_PAR:
		userdef->data1 = ((Obj_Head *)user->ub_ptr1)->label;
		userdef->len1 = 0;
		break;
	case STR_PAR:
		userdef->data1 = ((Obj_Head *)user->ub_ptr1)->object;
		userdef->len1 = 0;
		break;
	case DATA_PAR:
		userdef->data1 = ((Obj_Head *)user->ub_ptr1)->object;
		userdef->len1 = ((Obj_Head *)user->ub_ptr1)->used;
		break;
	}

	userdef->type2 = (obj->flags >> 2) & 3;
	switch (userdef->type2)
	{
	case NONE_PAR:
		userdef->data2 = NULL;
		userdef->len2 = 0;
		break;
	case REF_PAR:
		userdef->data2 = ((Obj_Head *)user->ub_ptr2)->label;
		userdef->len2 = 0;
		break;
	case STR_PAR:
		userdef->data2 = ((Obj_Head *)user->ub_ptr2)->object;
		userdef->len2 = 0;
		break;
	case DATA_PAR:
		userdef->data2 = ((Obj_Head *)user->ub_ptr2)->object;
		userdef->len2 = ((Obj_Head *)user->ub_ptr2)->used;
		break;
	}

	userdef->type3 = (obj->flags >> 4) & 3;
	switch (userdef->type3)
	{
	case NONE_PAR:
		userdef->data3 = NULL;
		userdef->len3 = 0;
		break;
	case REF_PAR:
		userdef->data3 = ((Obj_Head *)user->ub_ptr3)->label;
		userdef->len3 = 0;
		break;
	case STR_PAR:
		userdef->data3 = ((Obj_Head *)user->ub_ptr3)->object;
		userdef->len3 = 0;
		break;
	case DATA_PAR:
		userdef->data3 = ((Obj_Head *)user->ub_ptr3)->object;
		userdef->len3 = ((Obj_Head *)user->ub_ptr3)->used;
		break;
	}
	
	userdef->bubble = user->bubble == NULL ? NULL : Ast_create(((Obj_Head *)user->bubble)->object);
	userdef->context = user->context == NULL ? NULL : Ast_create(((Obj_Head *)user->context)->object);
}

/* -------------------------------------------------------------------------- */

static void map_user(Obj_Head *src, AUSERBLK *dst)
{
	AUSERBLK *user;
	UODATAS *datas;
	AUSER_DEF userdef;
	
	memset(dst, 0, sizeof(*dst));
	user = src->object;
	datas = part_get(((Obj_Head *)user->ub_code)->label);
	if (datas != NULL)
	{
		set_userdef(src, &userdef);
		datas->test(&userdef, dst);
	} else
	{
		dst->ub_code = user_dummy;
		sscanf(((Obj_Head *)user->ub_parm)->label, "0x%lx", (long *)&dst->ub_parm);
	}
}

/* -------------------------------------------------------------------------- */

static int16 subtree(OBJ_ENTRY *old, int16 oldidx, OBJ_ENTRY *new, int16 *idx, int16 parent, int16 active, int16 *pactive, int16 obnr, int16 *pact);

static void reorg(Obj_Head *obj, Awindow *win)
{
	int16 idx;
	OBJ_ENTRY *newtree;
	OBJ_ENTRY *entry;
	OBJEDPARM *parm;
	
	idx = 0;
	if ((newtree = Ax_malloc(obj->used)) != NULL)
	{
		entry = obj->object;
		parm = win->user;
		subtree(entry, ROOT, newtree, &idx, NIL, parm->active, &parm->active, parm->act_obnr, &parm->act_obnr);
		obj->object = newtree;
		obj->size = obj->used;
		Ax_free(entry);
	}
}

static int16 subtree(OBJ_ENTRY *old, int16 oldidx, OBJ_ENTRY *new, int16 *pidx, int16 parent, int16 active, int16 *pactive, int16 obnr, int16 *pact)
{
	int16 idx;
	int16 next;
	int16 head;
	
	for (;;)
	{
		idx = *pidx;
		if (active == oldidx * 3 + 2)
			*pactive = idx * 3 + 2;
		if (obnr == oldidx)
			*pact = idx;
		memcpy(&new[idx], &old[oldidx], sizeof(*new));
		++(*pidx);
		next = old[oldidx].obj.ob_next;
		head = old[oldidx].obj.ob_head;
		if (head >= 0)
		{
			new[idx].obj.ob_head = *pidx;
			head = subtree(old, head, new, pidx, idx, active, pactive, obnr, pact);
			new[idx].obj.ob_tail = head;
		}
		if (next < 0)
			break;
		new[idx].obj.ob_next = *pidx;
		if (old[next].obj.ob_tail == oldidx)
			break;
		oldidx = next;
	}
	new[idx].obj.ob_next = parent;
	return idx;
}

/* -------------------------------------------------------------------------- */

int16 CDECL user_control(PARMBLK *pb)
{
	if ((pb->pb_currstate & OS_SELECTED) || (pb->pb_prevstate & OS_SELECTED))
	{
		pxy[2] = pb->pb_wc;
		pxy[3] = pb->pb_hc;
		if (pxy[2] != 0 || pxy[3] != 0)
		{
			pxy[0] = pb->pb_xc;
			pxy[1] = pb->pb_yc;
			pxy[2] += pxy[0] - 1;
			pxy[3] += pxy[1] - 1;
			vs_clip(ACSblk->vdi_handle, TRUE, pxy);
		}
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		vsl_width(ACSblk->vdi_handle, 1);
		vsl_ends(ACSblk->vdi_handle, 0, 0);
		vsl_type(ACSblk->vdi_handle, LT_USERDEF);
		vsl_color(ACSblk->vdi_handle, G_BLACK);
		pxy[0] = pb->pb_x;
		pxy[1] = pb->pb_y;
		pxy[2] = pxy[0] + pb->pb_w - 1;
		pxy[3] = pxy[1] + pb->pb_h - 1;
		xline2(pxy[0], pxy[2], pxy[1]);
		xline2(pxy[0], pxy[2], pxy[3]);
		yline2(pxy[1], pxy[3], pxy[0]);
		yline2(pxy[1], pxy[3], pxy[2]);
		if ((pb->pb_w >> 3) > 8)
			pxy[0] = pxy[2] - (pb->pb_w >> 3);
		else
			pxy[0] = pxy[2] - 8;
		if ((pb->pb_h >> 3) > 8)
			pxy[1] = pxy[3] - (pb->pb_h >> 3);
		else
			pxy[1] = pxy[3] - 8;
		vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
		vsf_color(ACSblk->vdi_handle, G_BLACK);
		vsf_perimeter(ACSblk->vdi_handle, FALSE);
		v_bar(ACSblk->vdi_handle, pxy);
		vs_clip(ACSblk->vdi_handle, FALSE, pxy);
	}
	return 0;
}

/* -------------------------------------------------------------------------- */

static int16 CDECL user_dummy(PARMBLK *pb)
{
	int16 pxy[4];
	
	pxy[2] = pb->pb_wc;
	pxy[3] = pb->pb_hc;
	if (pxy[2] != 0 || pxy[3] != 0)
	{
		pxy[0] = pb->pb_xc;
		pxy[1] = pb->pb_yc;
		pxy[2] += pxy[0] - 1;
		pxy[3] += pxy[1] - 1;
		vs_clip(ACSblk->vdi_handle, TRUE, pxy);
	}
	if (!(pb->pb_currstate & OS_SELECTED) && !(pb->pb_prevstate & OS_SELECTED))
	{
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		pxy[0] = pb->pb_x;
		pxy[1] = pb->pb_y;
		pxy[2] = pxy[0] + pb->pb_w - 1;
		pxy[3] = pxy[1] + pb->pb_h - 1;
		vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
		vsf_color(ACSblk->vdi_handle, G_BLACK);
		/* vsf_perimeter(ACSblk->vdi_handle, FALSE); FIXME: missing */
		v_bar(ACSblk->vdi_handle, pxy);
	}
	vs_clip(ACSblk->vdi_handle, FALSE, pxy);
	return pb->pb_currstate & ~OS_SELECTED;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -use
#endif
