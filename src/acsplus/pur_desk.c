/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Default pure desktop                                  */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "acsplus.h"
#include "country.h"

static void mod_load(void);
static void mod_info(void);
static void mod_infodrag(void);
static void mod_delete(void);
static void mod_deldrag(void);

static boolean pd_serv(Awindow *self, int16 task, void *in_out);
static Awindow *pd_make(void *a);
static int16 purGEMScript(Awindow *win, int16 anz, char **cmds, A_GSAntwort *antwort);

static boolean modul_serv(Awindow *self, int16 task, void *in_out);
static Awindow *modul_make(void *a);
static void modul_close(Awindow *self);

static Awindow *module_window = NULL;
static boolean my_menu = TRUE;

#include "pur_desk.ah"
#include "pur_desk.h"

typedef struct {
	int32 id;
	char path[__PS__ * 2];
	int16 count;
	Axywh box;
	int32 flag;
	uint16 descflags;
	void (*new)(char *filename);
} MODDATA;

static void new_call(char *file_string);
static int sort_obnr(const void *ob1, const void *ob2);
static void ghost_icon(Awindow *self, int16 obnr);
static void norm_icon(Awindow *self, int16 obnr);
static void rem_icon(Awindow *self, int16 *obnr);
static void update_icon(Awindow *self, int16 obnr, boolean redraw);
static void place_icon(Awindow *self, Awindow *win);


#define MAX_ICONS 256
#define PURE_DESK_MAGIC 0x5044534BL /* "PDSK" */

/* MODDATA.flag */
#define PURDESK_OPEN   0x0001

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void Apd_close(void)
{
	Awindow *win;
	Awindow *prev;
	int16 top;
	
	prev = NULL;
	for (;;)
	{
		wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
		win = Awi_wid(top);
		if (win == Awi_root() && ACSblk->application)
			return;
		if (win == NULL)
			return;
		if (!(win->kind & AW_STAY))
			break;
		if (win->wi_kind & CLOSER)
			break;
		if (prev == NULL)
			prev = win;
		else if (prev == win)
			return;
		Awi_down();
	}
	if ((win->kind & AW_ICON) || ACSblk->description->acc != NULL)
		win->closed(win);
	else
		win->service(win, AS_TERM, NULL);
}

/* -------------------------------------------------------------------------- */

void Apd_delete(void)
{
	int16 top;
	Awindow *win;
	
	if (ACSblk->Aselect.actlen == 0)
	{
		wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
		win = Awi_wid(top);
		if (win != NULL && win != Awi_root())
		{
			win->service(win, AS_TERM, NULL);
		}
	} else
	{
		if (ACSblk->ev_window != (win = ACSblk->Aselect.window))
			win->service(win, AS_DELETE, NULL);
	}
}

/* -------------------------------------------------------------------------- */

void Apd_info(void)
{
	Awindow *win;
	
	if (ACSblk->Aselect.actlen == 0)
	{
		ACSblk->ACSaboutme();
	} else
	{
		if (ACSblk->ev_window != (win = ACSblk->Aselect.window) && ACSblk->ev_window != win) /* FIXME: duplicate test */
			win->service(win, AS_INFO, NULL);
	}
}

/* -------------------------------------------------------------------------- */

void Apd_list(void)
{
	Awindow *win;
	int16 top;
	Awindow *list;
	
	wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
	win = Awi_wid(top);
	list = Awi_list();
	if (list == win)
		list = Awi_list();
	if (win != NULL)
	{
		while (win != list && list->wi_id <= 0)
			list = Awi_list();
	}
	if (list != NULL && list->wi_id > 0)
		Awi_show(list);
}

/* -------------------------------------------------------------------------- */

void Apd_module(void)
{
	if (module_window != NULL)
		Awi_show(module_window);
}

/* -------------------------------------------------------------------------- */

void Apd_new(void)
{
	new_call(NULL);
}

/* -------------------------------------------------------------------------- */

void Apd_open(void)
{
	Awindow *win;
	
	if (ACSblk->Aselect.actlen <= 0)
	{
		new_call(NULL);
	} else
	{
		win = ACSblk->Aselect.window;
		if (ACSblk->ev_window != win)
			win->service(win, AS_OPEN, NULL);
	}
}

/* -------------------------------------------------------------------------- */

void Apd_quit(void)
{
	ACSblk->ACSclose();
}

/* -------------------------------------------------------------------------- */

/*
 * work callback of ULinList
 */
static void open_one_file(void *para, void *elem)
{
	MODDATA *parm = para;
	char *path = elem;
	char filename[__PS__ * 2] = "";
	
	if (parm != NULL && parm->new != NULL)
	{
		if (!Ast_isEmpty(path))
			Af_unquote(filename, path);
		parm->new(path != NULL ? filename : NULL);
	}
}

/* -------------------------------------------------------------------------- */

static void open_files(MODDATA *parm, char *file_string)
{
	ULinList *list;
	
	if (parm != NULL && parm->new != NULL)
	{
		list = NULL; /* FIXME: useless */
		list = Af_parseCmdLine(file_string);
		if (list != NULL)
		{
			if (list->count(list) > 0)
			{
				list->doFor(list, parm, 0, open_one_file);
			} else
			{
				open_one_file(parm, NULL);
			}
			Alu_delete(list);
		} else
		{
			open_one_file(parm, NULL);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void OpenDraggedFiles(MODDATA *parm)
{
	int16 obnr;
	Awindow *win;
	OBJECT *obj;
	AOBJECT *aobj;
	
	win = ACSblk->Aselect.window;
	if (ACSblk->Aselect.actlen >= 1)
	{
		Adr_start();
		while ((obnr = Adr_next()) != -1)
		{
			if (obnr & A_TOOLBAR)
			{
				if (win->toolbar != NULL)
					obj = &win->toolbar[obnr & A_MASK];
				else
					obj = NULL;
				if (obj)
				{
					/* maybe some code ifdef'ed out here? */
				}
			} else
			{
				if (win->work != NULL)
					obj = &win->work[obnr];
				else
					obj = NULL;
			}
			if (obj != NULL &&
				!(obj->ob_flags & OF_LASTOB) &&
				(obj[1].ob_flags & AEO))
				aobj = (AOBJECT *)obj + 1;
			else
				aobj = NULL;
			if (aobj != NULL && aobj->type == AT_FILE)
			{
				open_files(parm, aobj->userp1);
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static boolean CheckDraggedFiles(boolean *found)
{
	int16 obnr;
	Awindow *win;
	OBJECT *obj;
	AOBJECT *aobj;
	
	win = ACSblk->Aselect.window;
	if (ACSblk->Aselect.actlen < 1)
	{
		*found = FALSE;
		return FALSE;
	} else
	{
		Adr_start();
		while ((obnr = Adr_next()) != -1)
		{
			if (obnr & A_TOOLBAR)
			{
				if (win->toolbar != NULL)
					obj = &win->toolbar[obnr & A_MASK];
				else
					obj = NULL;
				if (obj)
				{
					/* maybe some code ifdef'ed out here? */
				}
			} else
			{
				if (win->work != NULL)
					obj = &win->work[obnr];
				else
					obj = NULL;
			}
			if (obj != NULL &&
				!(obj->ob_flags & OF_LASTOB) &&
				(obj[1].ob_flags & AEO))
				aobj = (AOBJECT *)obj + 1;
			else
				aobj = NULL;
			if (aobj != NULL && aobj->type == AT_FILE)
			{
				*found = TRUE;
				return TRUE;
			}
		}
		*found = FALSE;
		return TRUE;
	}
}

/* -------------------------------------------------------------------------- */

static void new_call(char *file_string)
{
	MODDATA *parm;
	
	if (module_window != NULL)
	{
		parm = module_window->user;
		open_files(parm, file_string);
	}	
}

/* -------------------------------------------------------------------------- */

static OBJECT *build_work(void)
{
	OBJECT *tree;
	OBJECT *ptr;
	const OBJECT *root;
	const OBJECT *src;
	int16 i;
	boolean done;
	void *spec;
	AUSERBLK *auser;
	
	done = OK;
	if ((ptr = tree = Ax_malloc((MAX_ICONS * 2 + 1) * sizeof(*tree))) == NULL)
		return NULL;
	root = &PUR_ICONS;
	memcpy(ptr, root, sizeof(*ptr));
	src = root + 1;
	ptr++;
	for (i = 0; i < MAX_ICONS; i++)
	{
		memcpy(ptr, src, sizeof(*ptr));
		memcpy(ptr + 1, src + 1, sizeof(*ptr));
		switch ((char)ptr->ob_type)
		{
		case G_USERDEF:
			ptr->ob_spec.auserblk = spec = auser = Aus_create(ptr->ob_spec.auserblk);
			if (auser != NULL && auser->ub_serv != NULL)
			{
				auser->ub_serv(ptr, AUO_CREATE, &done);
				if (done == FAIL)
					return NULL; /* FIXME: leaks memory allocated so far */
			}
			break;
		
		case G_ICON:
		case G_CICON:
			ptr->ob_spec.ciconblk = spec = Aic_create(ptr->ob_spec.ciconblk);
			break;
#ifdef __GNUC__ /* FIXME: no default case */
		default:
			spec = NULL;
			break;
#endif
		}
		if (spec == NULL)
			return NULL; /* FIXME: leaks memory allocated so far */
		ptr[0].ob_flags |= OF_HIDETREE;
		ptr[0].ob_flags &= ~OF_LASTOB;
		ptr[1].ob_flags &= ~OF_LASTOB;
		ptr[0].ob_head = ptr[0].ob_tail = NIL;
		ptr[0].ob_next = i * 2 + 3;
		ptr += 2;
	}
	ptr -= 2;
	ptr[1].ob_flags |= OF_LASTOB;
	ptr[0].ob_next = ROOT;
	tree[ROOT].ob_next = NIL;
	tree[ROOT].ob_head = 1;
	tree[ROOT].ob_tail = MAX_ICONS * 2 - 1;
	tree[ROOT].ob_height = ptr[0].ob_height;
	tree[ROOT].ob_width = src->ob_width < 12 ? 12 : src->ob_width;
	tree[1].ob_x = tree[1].ob_y = 1;
	Aob_fix(tree);
	return tree;
}

/* -------------------------------------------------------------------------- */

static void click_modwin(void)
{
	AOBJECT *aobj;
	Awindow *win;
	
	aobj = (AOBJECT *)&ACSblk->ev_object[ACSblk->ev_obnr] + 1;
	if ((win = aobj->userp1) != NULL)
	{
		if (win->wi_id > 0 && (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & AOS_DCLICK))
		{
			win->wi_act.x = ACSblk->desk.x > ((ACSblk->desk.w >> 1) + ACSblk->desk.x - (win->wi_act.w >> 1)) ?
				ACSblk->desk.x :
				(ACSblk->desk.w >> 1) + ACSblk->desk.x - (win->wi_act.w >> 1);
			win->wi_act.y = ACSblk->desk.y > ((ACSblk->desk.h >> 1) + ACSblk->desk.y - (win->wi_act.h >> 1)) ?
				ACSblk->desk.y :
				(ACSblk->desk.h >> 1) + ACSblk->desk.y - (win->wi_act.h >> 1);
		}
		if (win->wi_id > 0)
		{
			win->state |= AWS_FORCEREDRAW;
			win->sized(win, &win->wi_act);
			win->topped(win);
		} else
		{
			Awi_show(win);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void drag_modwin(void)
{
	AOBJECT *aobj;
	Awindow *win;
	
	aobj = (AOBJECT *)&ACSblk->ev_object[ACSblk->ev_obnr] + 1;
	if ((win = aobj->userp1) != NULL)
		win->service(win, AS_DRAGGED, NULL);
}

/* -------------------------------------------------------------------------- */

static void mod_deldrag(void)
{
	ACSblk->Aselect.window->service(ACSblk->Aselect.window, AS_DELETE, NULL);
}

/* -------------------------------------------------------------------------- */

static void mod_delete(void)
{
	ACSblk->ev_window->service(ACSblk->ev_window, AS_DELETE, NULL);
}

/* -------------------------------------------------------------------------- */

static void mod_info(void)
{
	ACSblk->ev_window->service(ACSblk->ev_window, AS_INFO, NULL);
}

/* -------------------------------------------------------------------------- */

static void mod_infodrag(void)
{
	ACSblk->Aselect.window->service(ACSblk->Aselect.window, AS_INFO, NULL);
}

/* -------------------------------------------------------------------------- */

static void load_mod(void *para, void *elem)
{
	Ash_module(elem);
	strcpy(((MODDATA *)para)->path, elem);
}

/* -------------------------------------------------------------------------- */

static void mod_load(void)
{
	MODDATA *module;
	char path[__PS__ * 2];
	ULinList *list;
	
	module = ACSblk->ev_window->user;
	strcpy(path, module->path);
	list = Af_fileselect(MODUL_LOAD_TITEL, path, "AM,am\0\0", SORTBYNAME, TRUE, NULL);
	if (list != NULL)
	{
		list->doFor(list, module, 0, load_mod);
		Alu_delete(list);
	}
}

/* -------------------------------------------------------------------------- */

static void modul_close(Awindow *self)
{
	MODDATA *module;
	
	self->state |= AWS_TERM;
	module = self->user;
	memcpy(&module->box, &self->wi_act, sizeof(module->box));
	Awi_closed(self);
	self->state &= ~AWS_TERM;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static Awindow *modul_make(void *a)
{
	MODDATA *module;
	long count;
	long fd;
	Awindow *self;
	int16 dummy;
	
	count = 0;
	module = Ax_malloc(sizeof(*module));
	if (module == NULL)
		return NULL;
	memset(module, 0, sizeof(*module));
	fd = Fopen(Af_cfgfile("pdesk"), FO_READ);
	if (fd < 0)
		fd = Fopen(Af_cfgfile("PDESK"), FO_READ);
	if (fd > 0)
	{
		count = Fread((int)fd, sizeof(*module) - sizeof(void *), module);
		Fclose((int)fd);
	}
	if (PUR_DESK.name != NAME_PUR_DESK)
		PUR_MODULE.name = PUR_DESK.name;
	self = module_window = Awi_create(&PUR_MODULE);
	if (self == NULL)
	{
		Ax_free(module);
		return NULL;
	}
	if (count + sizeof(void *) != sizeof(*module) || module->id != PURE_DESK_MAGIC)
	{
		memset(module, 0, sizeof(*module));
		module->descflags = ACSblk->description->flags;
		if (ACSblk->cfg_path[0] != '\0')
			strcpy(module->path, ACSblk->cfg_path);
		else
			strcpy(module->path, "A:\\");
		if (module->path[0] < 'C' &&
			(Dsetdrv(Dgetdrv()) & 4))
			strcpy(module->path, "C:\\");
		module->box.x = ACSblk->desk.x + ACSblk->gl_wbox;
#if WITH_FIXES
		module->box.y = ACSblk->desk.y + ACSblk->gl_hbox;
#else
		module->box.x = ACSblk->desk.x + ACSblk->gl_wbox;
#endif
		module->box.w = ACSblk->desk.w >> 1;
		module->box.h = ACSblk->desk.h >> 1;
	}
	
	module->id = PURE_DESK_MAGIC;
	module->count = 0;
	PUR_MODULE.name = NAME_MODULE;
	self->user = module;
	self->work = build_work();
	if (self->work == NULL)
	{
		Awi_delete(self);
		Ax_free(module);
		return NULL;
	}
	memcpy(&self->wi_act, &module->box, sizeof(self->wi_act));
	if (self->wi_act.x > ACSblk->desk.x + ACSblk->desk.w)
		self->wi_act.x = ACSblk->desk.x + ACSblk->gl_wbox;
	if (self->wi_act.y > ACSblk->desk.y + ACSblk->desk.h)
#if WITH_FIXES
		self->wi_act.y = ACSblk->desk.y + ACSblk->gl_hbox;
#else
		self->wi_act.x = ACSblk->desk.y + ACSblk->gl_hbox;
#endif
	wind_calc(WC_WORK, self->wi_kind, self->wi_act.x, self->wi_act.y, self->wi_act.w, self->wi_act.h,
		&dummy, &dummy, &self->work->ob_width, &self->work->ob_height);
	if (self->toolbar != NULL)
		self->work->ob_height -= self->toolbar->ob_height;
	return self;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static boolean modul_serv(Awindow *self, int16 task, void *in_out)
{
	MODDATA *module;
	long fd;
	char ext[6];
	
	module = self->user;
	switch (task)
	{
	case AS_TERM:
		if (ACSblk->appexit)
		{
			if (self->wi_id > 0)
			{
				if (self->state & AWS_ICONIZED)
					memcpy(&module->box, &self->wi_normal, sizeof(module->box));
				else
					memcpy(&module->box, &self->wi_act, sizeof(module->box));
				module->flag |= PURDESK_OPEN;
			} else
			{
				module->flag &= ~PURDESK_OPEN;
			}
			fd = Fcreate(Af_cfgfile("pdesk"), 0);
			if (fd > 0)
			{
				Fwrite((int)fd, sizeof(*module) - sizeof(void *), module);
				Fclose((int)fd);
			}
			Ax_free(self->work);
			self->work = NULL;
			Ax_free(module);
			Awi_delete(self);
		} else
		{
			modul_close(self);
		}
		break;
	
	case AS_CHECKDRAGGED:
		if (module->new)
			CheckDraggedFiles(in_out);
		break;
	
	case AS_DRAGGED:
		if (module->new)
			OpenDraggedFiles(module);
		break;
	
	case AS_BACKOBJECT:
		if (in_out && self->work)
		{
			OBJECT *obj = (OBJECT *)in_out;
			self->work->ob_type = obj->ob_type;
			self->work->ob_spec = obj->ob_spec;
		}
		break;
	
	case AS_OPEN:
	case AS_DELETE:
	case AS_INFO:
		if (self->state & AWS_ICONIZED)
			return FALSE;
		if (ACSblk->Aselect.actlen == 0 || ACSblk->Aselect.window != self)
		{
			ACSblk->ACSaboutme();
		} else
		{
			AOBJECT *aobj;
			Awindow *win;
			int16 count;
			int16 obnr;
			int16 *selection, *ptr;

			count = ACSblk->Aselect.actlen;
			selection = ptr = Ax_malloc(count * sizeof(*selection));
			if (selection != NULL)
			{
				Adr_start();
				while ((obnr = Adr_next()) >= 0)
					*ptr++ = obnr;
				qsort(selection, count, sizeof(*selection), sort_obnr);
				for (obnr = 0; obnr < count; obnr++)
				{
					aobj = (AOBJECT *)&self->work[selection[obnr]] + 1;
					if (aobj->type == AT_ICONWINDOW)
					{
						Adr_del(self, selection[obnr]);
						win = aobj->userp1;
						if (task == AS_DELETE)
							win->service(win, AS_TERM, NULL);
						else
							win->service(win, task, NULL);
					}
				}
				Ax_free(selection);
			}
		}
		break;
	
	case AS_NEWCALL:
		module->new = *((void **)in_out);
		if (my_menu)
		{
			if (module->new == NULL)
				Awi_root()->menu[PURDESK_NEW].ob_state |= OS_DISABLED;
			else
				Awi_root()->menu[PURDESK_NEW].ob_state &= ~OS_DISABLED;
		}
		break;
	
	case AS_GHOSTICON:
		ghost_icon(self, *((int16 *)in_out));
		break;
		
	case AS_NORMICON:
		norm_icon(self, *((int16 *)in_out));
		break;
		
	case AS_REMICON:
		rem_icon(self, in_out);
		break;
		
	case AS_UPDATEICON:
		update_icon(self, *((int16 *)in_out), TRUE);
		break;
		
	case AS_PLACEICON:
		place_icon(self, in_out);
		break;
	
	case AS_FILESELECT:
		if (module->new && in_out)
		{
			((ULinList *)in_out)->doFor(in_out, module, 0, open_one_file);
		}
		break;
	
	case AS_GEM_MESS:
		{
			char *path;
			char *filename;
			int16 *msg = in_out;
			
			if (msg[0] == VA_START &&
				(path = *((char **)&msg[3])) != NULL &&
				*path != '\0' &&
				(filename = Ast_create(path)) != NULL)
			{
				if (Ast_icmp(Af_2ext(ext, filename), "AM") == 0 ||
					Ast_icmp(ext, "AMA") == 0)
				{
					Ash_module(filename);
				} else
				{
					new_call(filename);
				}
				Ast_delete(filename);
			} else
			{
				return Awi_service(self, task, in_out);
			}
		}
		break;

	default:
		return Awi_service(self, task, in_out);
	}
	
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static AUSERBLK Sep = { A_arrows, 0x22090001L, NULL, NULL, NULL, NULL, NULL, NULL };

#ifdef __PUREC__
#pragma warn -par
#endif

static Awindow *pd_make(void *a)
{
	MODDATA *module;
	Awindow *self;
	char path[__PS__ * 2];
	char ext[6];
	char *basename;
	A_FileList *ptr;
	A_FileList *list;
	
	module = NULL;
	if (PUR_DESK.menu == &_PMENU)
	{
		OBJECT *tree = PUR_DESK.menu;
		tree = &tree[tree[tree[tree[tree[ROOT].ob_tail].ob_head].ob_head].ob_next];
		tree->ob_type = G_USERDEF;
		tree->ob_state |= AOS_CONST;
		tree->ob_spec.auserblk = &Sep;
	} else
	{
		my_menu = FALSE;
	}
	
	if (ACSblk->application)
	{
		if (ACSblk->multitask == FALSE && PUR_DESK.work == NULL)
			PUR_DESK.work = &PUR_BACK;
		if ((self = Awi_create(&PUR_DESK)) == NULL)
			return NULL;
		if ((self->user = PUR_MODULE.create(NULL)) != NULL)
			module = ((Awindow *)self->user)->user;
	} else
	{
		PUR_MODULE.menu = PUR_DESK.menu;
		if ((self = PUR_MODULE.create(NULL)) == NULL)
			return NULL;
		module = self->user;
	}
	
	if (module != NULL)
	{
		strcpy(path, module->path);
		if (path[0] < 'C')
			if (Dsetdrv(Dgetdrv()) & 4)
				path[0] = 'C';
		if ((basename = strrchr(path, PATH_SEP)) != NULL && basename[1] != '\0')
			basename[1] = '\0';
		if ((ptr = list = Af_readdir(path)) != NULL)
		{
			while (ptr != NULL)
			{
				if (Ast_icmp(Af_2ext(ext, ptr->file), "AMA") == 0)
					Ash_module(ptr->file);
				ptr = ptr->next;
			}
			Af_freedir(list);
		}
		if ((module->flag & PURDESK_OPEN) && ACSblk->application)
			Awi_open(self->user);
	}
	
	return self;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static boolean pd_serv(Awindow *self, int16 task, void *in_out)
{
	Awindow *parent;
	
	parent = self->user;
	switch (task)
	{
	case AS_TERM:
		if (ACSblk->application)
		{
			if (ACSblk->appexit)
				Awi_delete(self);
		} else
		{
			Awi_closed(self);
		}
		break;
	
	default:
		/* BUG: when !application, self->user is module, not window */
		return parent->service(parent, task, in_out);	
	}
	
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void ghost_icon(Awindow *self, int16 obnr)
{
	MODDATA *module;
	OBJECT *obj;
	CICONBLK *icon;
	
	module = self->user;
	if (obnr >= 0 && module->count != 0)
	{
		obj = &self->work[obnr];
		obj->ob_flags &= ~(OF_SELECTABLE | OF_EXIT | AO_DRAGABLE | AO_ACCEPT);
		obj->ob_flags |= OF_TOUCHEXIT;
		obj->ob_state &= ~OS_SELECTED;
		icon = obj->ob_spec.ciconblk;
		icon->monoblk.ib_pmask = icon->monoblk.ib_pdata;
		icon->mainlist = NULL;
		update_icon(self, obnr, TRUE);
	}
}

/* -------------------------------------------------------------------------- */

static void norm_icon(Awindow *self, int16 obnr)
{
	MODDATA *module;
	OBJECT *obj;
	AOBJECT *aobj;
	
	module = self->user;
	if (obnr >= 0 && module->count != 0)
	{
		obj = &self->work[obnr];
		aobj = (AOBJECT *)obj + 1;
		obj->ob_flags &= ~(OF_HIDETREE | OF_TOUCHEXIT | AO_ACCEPT);
		obj->ob_flags |= OF_SELECTABLE | OF_EXIT | AO_DRAGABLE;
		obj->ob_state &= ~OS_SELECTED;
		if (aobj->userp2 != NULL)
		{
			memcpy(obj->ob_spec.ciconblk, aobj->userp2, sizeof(CICONBLK));
			aobj->key = 0xff & ((CICONBLK *)aobj->userp2)->monoblk.ib_char;
		} else
		{
			memcpy(obj->ob_spec.ciconblk, &I_WIN, sizeof(CICONBLK));
			obj->ob_spec.ciconblk->monoblk.ib_ptext = ((Awindow *)aobj->userp1)->name;
			aobj->key = 0;
		}
		if (((Awindow *)aobj->userp1)->kind & AW_ICONACCEPT)
			obj->ob_flags |= AO_ACCEPT;
		update_icon(self, obnr, TRUE);
	}
}

/* -------------------------------------------------------------------------- */

static void place_icon(Awindow *self, Awindow *win)
{
	MODDATA *module;
	int16 icon;
	OBJECT *obj;
	AOBJECT *aobj;
	
	module = self->user;
	if (module->count < MAX_ICONS)
	{
		icon = module->count * 2 + 1;
		obj = &self->work[icon];
		obj->ob_flags &= ~OF_HIDETREE;
		aobj = (AOBJECT *)obj + 1;
		aobj->type = AT_ICONWINDOW;
		aobj->click = click_modwin;
		aobj->drag = drag_modwin;
		aobj->userp1 = win;
		aobj->userp2 = win->iconblk;
		win->icon = icon;
		++module->count;
		norm_icon(self, icon);
	} else
	{
		win->icon = -1;
	}
}

/* -------------------------------------------------------------------------- */

static void rem_icon(Awindow *self, int16 *pobnr)
{
	int16 obnr;
	MODDATA *module;
	int16 next;
	int16 parent;
	AOBJECT *aobj1;
	AOBJECT *aobj2;
	Awindow *win;
	OBJECT *obj;
	
	obnr = *pobnr;
	module = self->user;
	if (obnr >= 0 && module->count != 0)
	{
		next = self->work[obnr].ob_next;
		parent = Aob_up(self->work, *pobnr);
		while (parent >= 0 && next != parent && !(self->work[next].ob_flags & OF_HIDETREE))
		{
			memcpy(self->work[obnr].ob_spec.ciconblk, self->work[next].ob_spec.ciconblk, sizeof(CICONBLK));
			self->work[obnr].ob_flags = self->work[next].ob_flags;
			self->work[obnr].ob_state = self->work[next].ob_state;
			aobj1 = (AOBJECT *)&self->work[obnr] + 1;
			aobj2 = (AOBJECT *)&self->work[next] + 1;
			win = aobj2->userp1;
			aobj1->userp1 = win;
			aobj1->userp2 = aobj2->userp2;
			if (win != NULL)
				win->icon -= 2;
			obnr = next;
			next = self->work[obnr].ob_next;
		}
		
		obj = &self->work[obnr];
		obj->ob_flags |= OF_HIDETREE;
		aobj1 = (AOBJECT *)obj + 1;
		aobj1->type = 0;
		aobj1->click = aobj1->drag = aobj1->userp1 = aobj1->userp2 = NULL;
		
		--module->count;
		if (!ACSblk->appexit)
		{
			if (module->count != 0)
			{
				obnr = *pobnr;
				next = self->work[obnr].ob_next;
				while (parent >= 0 && next != parent && !(self->work[obnr].ob_flags & OF_HIDETREE))
				{
					update_icon(self, obnr, FALSE);
					next = self->work[obnr = next].ob_next;
				}
			}
			self->state |= AWS_FORCEREDRAW;
			self->sized(self, &self->wi_act);
		}
		*pobnr = -1;
	}
}

/* -------------------------------------------------------------------------- */

static void update_icon(Awindow *self, int16 obnr, boolean redraw)
{
	MODDATA *module;
	OBJECT *obj;
	AOBJECT *aobj;
	CICONBLK *icon;
	
	module = self->user;
	if (obnr >= 0 && module->count != 0)
	{
		obj = &self->work[obnr];
		aobj = (AOBJECT *)obj + 1;
		if (aobj->userp2 != NULL && 
			((CICONBLK *)aobj->userp2)->monoblk.ib_wicon < obj->ob_width &&
			((CICONBLK *)aobj->userp2)->monoblk.ib_hicon < obj->ob_height)
		{
			memcpy(obj->ob_spec.ciconblk, aobj->userp2, sizeof(CICONBLK));
			aobj->key = 0xff & ((CICONBLK *)aobj->userp2)->monoblk.ib_char;
		} else
		{
			memcpy(obj->ob_spec.ciconblk, &I_WIN, sizeof(CICONBLK));
			obj->ob_spec.ciconblk->monoblk.ib_ptext = Ast_create(((Awindow *)aobj->userp1)->name);
			aobj->key = 0;
		}
		if (!(obj->ob_flags & AO_DRAGABLE))
		{
			icon = obj->ob_spec.ciconblk;
			icon->monoblk.ib_pmask = icon->monoblk.ib_pdata;
			icon->mainlist = NULL;
		}
		Aob_icon(obj);
		if (!(self->state & AWS_ICONIZED) && redraw)
		{
			self->state |= AWS_FORCEREDRAW;
			self->sized(self, &self->wi_act);
		}
	}
}

/* -------------------------------------------------------------------------- */

static int sort_obnr(const void *ob1, const void *ob2)
{
	const int16 *obnr1 = (const int16 *)ob1;
	const int16 *obnr2 = (const int16 *)ob2;
	if (*obnr1 < *obnr2)
		return 1;
	if (*obnr1 > *obnr2)
		return -1;
	return 0;
}

/* -------------------------------------------------------------------------- */

static int16 purGEMScript(Awindow *win, int16 anz, char **cmds, A_GSAntwort *antwort)
{
	if (Ast_icmp(cmds[0], "GetFront") == 0)
	{
		Ast_delete(antwort->antwort[0]);
		antwort->antwort[0] = Ast_create(ACSblk->basename + 2);
		antwort->anzahl = 1;
		return OK;
	}
	return Awi_gemscript(win, anz, cmds, antwort);
}
