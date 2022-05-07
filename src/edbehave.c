#include "acs_i.h"
#include "country.h"
#include "acsio.h"

static Awindow *bh_make(void *para);
static boolean bh_service(Awindow *self, int16 task, void *in_out);
static Awindow *edmm_create(void *para);
static boolean edmm_service(Awindow *self, int16 task, void *in_out);

static void edbh_list(void);
static void edbh_ok(void);
static void edbh_abort(void);
static void edbh_wi(void);

static void edmm_init_olga(void);
static void edmm_ok(void);
static void edmm_cancel(void);
static void edmm_ismain(void);

#include "edbehave.ah"

const char *const mlmess[AD_COUNT] = {
	_A_GENERAL,
	_A_GENERAL_STR,
	_A_COLREZ,
	_A_CREATE_IO,
	_A_CREATE_STR,
	_A_DEFECTIVE_MEM,
	_A_ERR_ACC,
	_A_ERR_MESS,
	_A_ERR_WINDOW,
	_A_ERR_WISLOT,
	_A_GEN_IO,
	_A_GEN_MEM,
	_A_GEN_MOD,
	_A_GEN_MOD_STR,
	_A_LOAD_MOD,
	_A_LOAD_MOD_STR,
	_A_MEM_MOD,
	_A_MEM_MOD_STR,
	_A_ODD_MEM,
	_A_OPEN_IO,
	_A_OPEN_STR,
	_A_OUT_OF_MEM,
	_A_PORT,
	_A_RANGE_MEM,
	_A_READ_IO,
	_A_READ_STR,
	_A_VER_MOD,
	_A_VER_MOD_STR,
	_A_WRITE_IO,
	_A_WRITE_STR,
	_AL_ATT,
	_AL_QUEST,
	_AL_STOP,
	_AL_TIMER
};

static void acc_behave(Awindow *win);
static void term(Awindow *win);
static void set_behave(Awindow *win);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edbh_wi(void)
{
	OBJECT *obj;
	Obj_Head *head;
	Awindow *select;
	int16 next;
	Awindow *self;
	OBJECT *tree;
	
	self = ACSblk->ev_window;
	tree = self->work;
	select = ACSblk->Aselect.window;
	ACSblk->Aselect.next = 0;
	if ((next = Adr_next()) > 0)
	{
		obj = &select->work[next + 1];
		if (obj->ob_height == 10007) /* WTF? */
		{
			head = (Obj_Head *)obj->ob_spec.free_string;
			Aob_puttext(tree, ACSblk->ev_obnr, head->label);
			Awi_diaend();
			self->obchange(self, ACSblk->ev_obnr, -1);
			Awi_diastart();
			Adr_del(select, next);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void edbh_list(void)
{
	ACS_HEAD *acs;
	Awindow *self;

	self = ACSblk->ev_window;
	acs = (ACS_HEAD *)self->user;
	self->kind |= AW_STAY;
	list_window.acs = acs;
	list_window.objlist = acs->wi_list;
	WI_LIST.create(&list_window);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void edbh_abort(void)
{
	term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void edbh_ok(void)
{
	acc_behave(ACSblk->ev_window);
	term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static Obj_Head *add_wi(ACS_HEAD *acs, Obj_Head *label, const char *title)
{
	Obj_Head *win;
	
	if (*title != '\0')
	{
		win = find_entry(acs->wi_list, title);
		if (win == NULL)
			win = dup_ref(acs, title, REF_NONE);
		else
			win->usage++;
	} else
	{
		win = NULL;
	}
	if (label != NULL)
	{
		if (find_entry(acs->wi_list, label->label) != NULL)
			del_window(acs, label);
		else
			del_ref(acs, label);
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static void *add_fkt(ACS_HEAD *acs, Obj_Head *label, const char *title, int16 type)
{
	Obj_Head *obj;
	
	if (*title != '\0')
	{
		obj = find_entry(acs->rf_list, title);
		if (obj == NULL)
			obj = dup_ref(acs, title, type);
		else
			obj->usage++;
	} else
	{
		obj = NULL;
	}
	if (label != NULL)
	{
		del_ref(acs, label);
	}
	return obj;
}

/* -------------------------------------------------------------------------- */

static void swap_obj(Obj_Head **items, Obj_Head *obj)
{
	size_t size;
	void *tmpobject;
	int count, i;
	Obj_Head *item;
	Obj_Head **items2;
	Obj_Head *tmp;
	
	items2 = (Obj_Head **)obj->object;
	count = (int)(obj->used / sizeof(*items));
	for (i = 0; i < count; i++)
	{
		tmp = items2[i];
		item = items[i];
		tmpobject = tmp->object;
		tmp->object = item->object;
		item->object = tmpobject;
		size = tmp->size;
		tmp->size = item->size;
		item->size = size;
		size = tmp->used;
		tmp->used = item->used;
		item->used = size;
	}
}

/* -------------------------------------------------------------------------- */

static void acc_behave(Awindow *win)
{
	AUSERBLK *user;
	ACS_HEAD *acs;
	OBJECT *tree;
	OBJECT *cycle;
	int16 language;
	
	if (win->state & AWS_INTERM)
		return;
	win->state |= AWS_INTERM;
	
	tree = win->work;
	acs = (ACS_HEAD *)win->user;
	acs->flags = (acs->flags & ~(ACS_LOCAL | ACS_PROTOTYPES | ACS_IGNORECASE | ACS_SRCOUTPUT)) | ACS_CHANGED;
	Aob_gettext(tree, EDIT_BEHAVE_BACKUPPATH, acs->backup);
	if (tree[EDIT_BEHAVE_IGNORECASE].ob_state & OS_SELECTED)
		acs->flags |= ACS_IGNORECASE;
	if (tree[EDIT_BEHAVE_PROTOTYPES].ob_state & OS_SELECTED)
		acs->flags |= ACS_PROTOTYPES;
	if (tree[EDIT_BEHAVE_LOCAL].ob_state & OS_SELECTED)
		acs->flags |= ACS_LOCAL;
	if (tree[EDIT_BEHAVE_SRCOUTPUT].ob_state & OS_SELECTED)
		acs->flags |= ACS_SRCOUTPUT;
	acs->extflags = 0;
	if (tree[EDIT_BEHAVE_BACKUP].ob_state & OS_SELECTED)
		acs->extflags |= ACS_EXT_BACKUP;
	if (tree[EDIT_BEHAVE_PROTOCOL].ob_state & OS_SELECTED)
		acs->extflags |= ACS_EXT_PROTOCOL;
	cycle = &tree[EDIT_BEHAVE_COMPILER];
	user = cycle->ob_spec.auserblk;
	user->ub_serv(cycle, AUO_CYCGETINDEX, &acs->src_lang);
	language = acs->language;
	cycle = &tree[EDIT_BEHAVE_LANGUAGE];
	user = cycle->ob_spec.auserblk;
	user->ub_serv(cycle, AUO_CYCGETINDEX, &acs->language);
	if (language != acs->language)
	{
		acs_closewi(acs, FALSE);
		switch (language)
		{
		case 0:
			break;
		default:
			swap_obj((Obj_Head **)acs->st_list->object, acs->mlst_list[language - 1]);
			swap_obj((Obj_Head **)acs->al_list->object, acs->mlal_list[language - 1]);
			break;
		}
		switch (acs->language)
		{
		case 0:
			break;
		default:
			swap_obj((Obj_Head **)acs->st_list->object, acs->mlst_list[acs->language - 1]);
			swap_obj((Obj_Head **)acs->al_list->object, acs->mlal_list[acs->language - 1]);
			break;
		}
	}
}

/* -------------------------------------------------------------------------- */

static Awindow *bh_make(void *para)
{
	ACS_HEAD *acs;
	Awindow *win;
	char info[__PS__];
	char *basename;
	
	acs = (ACS_HEAD *)para;
	if (acs->wi_descr != NULL)
	{
		Awi_show(acs->wi_descr);
		return acs->wi_descr;
	}
	info[0] = ' ';
	WI_BEHAVE.info = strcpy(&info[1], acs->filename);
	basename = strrchr(info, PATH_SEP);
	if (basename != NULL)
		basename++;
	else
		basename = info; /* BUG: includes space */
	WI_BEHAVE.iconblk->monoblk.ib_ptext = basename;
	win = Awi_create(&WI_BEHAVE);
	if (win == NULL)
		return NULL;
	wi_pos(win, &acs->pos_ds, &acs->last_rez);
	win->user = acs;
	acs->wi_descr = win;
	set_behave(win);
	if (win->open(win) != OK)
	{
		term(win);
		return NULL;
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static boolean bh_service(Awindow *self, int16 task, void *in_out)
{
	switch (task)
	{
	case AS_TERM:
		if (!(self->state & AWS_INTERM))
		{
			self->state |= AWS_INTERM;
			acc_behave(self);
			term(self);
		}
		break;
	case AS_INFO:
		break;
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void set_behave(Awindow *win)
{
	ACS_HEAD *acs;
	AUSERBLK *user;
	OBJECT *tree;
	OBJECT *cycle;
	
	tree = win->work;
	acs = win->user;
	Aob_puttext(tree, EDIT_BEHAVE_BACKUPPATH, acs->backup);
	set_flag(acs->flags & ACS_IGNORECASE, &tree[EDIT_BEHAVE_IGNORECASE]);
	set_flag(acs->flags & ACS_PROTOTYPES, &tree[EDIT_BEHAVE_PROTOTYPES]);
	set_flag(acs->flags & ACS_LOCAL, &tree[EDIT_BEHAVE_LOCAL]);
	set_flag(acs->flags & ACS_SRCOUTPUT, &tree[EDIT_BEHAVE_SRCOUTPUT]);
	set_flag((acs->extflags & ACS_EXT_PROTOCOL) != 0, &tree[EDIT_BEHAVE_PROTOCOL]);
	set_flag((acs->extflags & ACS_EXT_BACKUP) != 0, &tree[EDIT_BEHAVE_BACKUP]);
	cycle = &tree[EDIT_BEHAVE_COMPILER];
	user = cycle->ob_spec.auserblk;
	user->ub_serv(cycle, AUO_CYCINDEX, &acs->src_lang);
	cycle = &tree[EDIT_BEHAVE_LANGUAGE];
	user = cycle->ob_spec.auserblk;
	user->ub_serv(cycle, AUO_CYCINDEX, &acs->language);
}

/* -------------------------------------------------------------------------- */

static void term(Awindow *self)
{
	ACS_HEAD *acs;
	
	acs = self->user;
	if (self->state & AWS_ICONIZED)
		memcpy(&acs->pos_ds, &self->wi_normal, sizeof(acs->pos_ds));
	else
		memcpy(&acs->pos_ds, &self->wi_act, sizeof(acs->pos_ds));
	Awi_delete(self);
	acs->wi_descr = NULL;
}

/* -------------------------------------------------------------------------- */

static void edmm_setflag(OBJECT *tree, int16 obj, int16 *value, int16 mask, boolean inverted)
{
	if (tree[obj].ob_state & OS_SELECTED)
	{
		if (inverted)
			*value &= ~mask;
		else
			*value |= mask;
	} else
	{
		if (inverted)
			*value |= mask;
		else
			*value &= ~mask;
	}
}

/* -------------------------------------------------------------------------- */

static void edmm_enable(Awindow *self)
{
	OBJECT *tree;
	int16 ismainmod;
	int16 olga;
	
	tree = self->work;
	ismainmod = tree[EDIT_MAINMOD_ISMAINMOD].ob_state & OS_SELECTED;
	olga = tree[EDIT_MAINMOD_OLGA].ob_state & OS_SELECTED;

	if (Awi_ontop() == self)
		Awi_diaend();
	
	ismainmod = tree[EDIT_MAINMOD_ISMAINMOD].ob_state & OS_SELECTED;
	Aob_state(self, EDIT_MAINMOD_OLGA, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_OLGA_WAIT, OS_DISABLED, !ismainmod || !olga);
	Aob_state(self, EDIT_MAINMOD_GEMSCRIPT, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_BUBBLEGEM, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_BEEP, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_CENTERDIALOG, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_GDOSFONT, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_MENUFIRST, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_CLICKMENU, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_HIDEPOINTER, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_3D, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_VISUAL_FEEDBACK, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_MEMCHECK, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_SECURITY_CHECKS, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_MODERN_3D, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_XACC_TYPE, OS_DISABLED, !ismainmod);
	Aob_state(self, EDIT_MAINMOD_ACC_ENTRY, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACC_ENTRY, OF_EDITABLE, ismainmod);
	Aob_state(self, EDIT_MAINMOD_ACC_WINDOW, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACC_WINDOW, OF_EDITABLE, ismainmod);
	Aob_state(self, EDIT_MAINMOD_DESKTOP, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_DESKTOP, OF_EDITABLE, ismainmod);
	Aob_state(self, EDIT_MAINMOD_ACSINIT0, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACSINIT0, OF_EDITABLE, ismainmod);
	Aob_state(self, EDIT_MAINMOD_ACSINIT, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACSINIT, OF_EDITABLE, ismainmod);

	Aob_state(self, EDIT_MAINMOD_ACSABOUTME, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACSABOUTME, OF_EDITABLE, ismainmod);
	Aob_state(self, EDIT_MAINMOD_ACSCLOSE, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACSCLOSE, OF_EDITABLE, ismainmod);
	Aob_state(self, EDIT_MAINMOD_ACSMESSAGE, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACSMESSAGE, OF_EDITABLE, ismainmod);
	Aob_state(self, EDIT_MAINMOD_ACSTIMER, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACSTIMER, OF_EDITABLE, ismainmod);
	Aob_state(self, EDIT_MAINMOD_ACSTERM, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACSTERM, OF_EDITABLE, ismainmod);

	Aob_state(self, EDIT_MAINMOD_ACSMPROTO, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACSMPROTO, OF_EDITABLE, ismainmod);
	Aob_state(self, EDIT_MAINMOD_ACSKEY, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACSKEY, OF_EDITABLE, ismainmod);
	Aob_state(self, EDIT_MAINMOD_ACSWIKEY, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACSWIKEY, OF_EDITABLE, ismainmod);
	Aob_state(self, EDIT_MAINMOD_ACSBUTTON, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACSBUTTON, OF_EDITABLE, ismainmod);
	Aob_state(self, EDIT_MAINMOD_ACSMOUSE, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACSMOUSE, OF_EDITABLE, ismainmod);

	Aob_state(self, EDIT_MAINMOD_ACSGEMSCRIPT, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_ACSGEMSCRIPT, OF_EDITABLE, ismainmod);

	Aob_state(self, EDIT_MAINMOD_DX, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_DX, OF_EDITABLE, ismainmod);
	Aob_state(self, EDIT_MAINMOD_DY, OS_DISABLED, !ismainmod);
	Aob_flags(self, EDIT_MAINMOD_DY, OF_EDITABLE, ismainmod);

	if (Awi_ontop() == self)
		Awi_diastart();
}

/* -------------------------------------------------------------------------- */

static void edmm_setval(Awindow *self)
{
	ACS_HEAD *acs;
	Obj_Head *obj;
	Aconfig *config;
	Aolddescr *descr;
	OBJECT *tree;
	
	acs = self->user;
	config = &acs->config;
	descr = &acs->descr;
	tree = self->work;

	Aob_state(self, EDIT_MAINMOD_ISMAINMOD, OS_SELECTED, !(acs->flags & ACS_SUBMODUL));

	Aob_state(self, EDIT_MAINMOD_OLGA, OS_SELECTED, acs->config.init_prot & CFG_INIT_OLGA);
	Aob_state(self, EDIT_MAINMOD_OLGA_WAIT, OS_SELECTED, acs->config.init_prot & CFG_INIT_OLGA_FULL);
	Aob_state(self, EDIT_MAINMOD_GEMSCRIPT, OS_SELECTED, acs->config.init_prot & CFG_INIT_GEMSCRIPT);
	Aob_state(self, EDIT_MAINMOD_BUBBLEGEM, OS_SELECTED, acs->config.init_prot & CFG_INIT_BUBBLEGEM);

	Aob_state(self, EDIT_MAINMOD_BEEP, OS_SELECTED, acs->descr.flags & AB_ACUSTIC);
	Aob_state(self, EDIT_MAINMOD_CENTERDIALOG, OS_SELECTED, acs->descr.flags & AB_CENTERDIALOG);
	Aob_state(self, EDIT_MAINMOD_GDOSFONT, OS_SELECTED, acs->descr.flags & AB_GDOSFONT);
	Aob_state(self, EDIT_MAINMOD_MENUFIRST, OS_SELECTED, acs->descr.flags & AB_MENUFIRST);
	Aob_state(self, EDIT_MAINMOD_CLICKMENU, OS_SELECTED, acs->descr.flags & AB_CLICKMENU);
	Aob_state(self, EDIT_MAINMOD_HIDEPOINTER, OS_SELECTED, acs->descr.flags & AB_HIDEPOINTER);
	Aob_state(self, EDIT_MAINMOD_3D, OS_SELECTED, !(acs->descr.flags & AB_NO3D));
	Aob_state(self, EDIT_MAINMOD_VISUAL_FEEDBACK, OS_SELECTED, acs->descr.flags & AB_FEEDBACK);
	Aob_state(self, EDIT_MAINMOD_MEMCHECK, OS_SELECTED, !(acs->descr.flags & AB_NOMEMCHECK));
	Aob_state(self, EDIT_MAINMOD_SECURITY_CHECKS, OS_SELECTED, !(acs->descr.flags & AB_LAZYEVAL));
	Aob_state(self, EDIT_MAINMOD_MODERN_3D, OS_SELECTED, !(acs->descr.flags & AB_OLDMENU));
	
	Aob_puttext(tree, EDIT_MAINMOD_ACC_ENTRY, descr->acc_reg + 2);
	obj = descr->acc;
	Aob_puttext(tree, EDIT_MAINMOD_ACC_WINDOW, obj == NULL ? "" : obj->label);
	obj = descr->root;
	Aob_puttext(tree, EDIT_MAINMOD_DESKTOP, obj == NULL ? "" : obj->label);

	obj = (Obj_Head *)config->ACSterm;
	Aob_puttext(tree, EDIT_MAINMOD_ACSTERM, obj == NULL ? "" : obj->label);
	obj = (Obj_Head *)config->ACSaboutme;
	Aob_puttext(tree, EDIT_MAINMOD_ACSABOUTME, obj == NULL ? "" : obj->label);
	obj = (Obj_Head *)config->ACSclose;
	Aob_puttext(tree, EDIT_MAINMOD_ACSCLOSE, obj == NULL ? "" : obj->label);
	obj = (Obj_Head *)config->ACSmessage;
	Aob_puttext(tree, EDIT_MAINMOD_ACSMESSAGE, obj == NULL ? "" : obj->label);
	obj = (Obj_Head *)config->ACSmproto;
	Aob_puttext(tree, EDIT_MAINMOD_ACSMPROTO, obj == NULL ? "" : obj->label);
	obj = (Obj_Head *)config->ACStimer;
	Aob_puttext(tree, EDIT_MAINMOD_ACSTIMER, obj == NULL ? "" : obj->label);
	obj = (Obj_Head *)config->ACSkey;
	Aob_puttext(tree, EDIT_MAINMOD_ACSKEY, obj == NULL ? "" : obj->label);
	obj = (Obj_Head *)config->ACSbutton;
	Aob_puttext(tree, EDIT_MAINMOD_ACSBUTTON, obj == NULL ? "" : obj->label);
	obj = (Obj_Head *)config->ACSmouse;
	Aob_puttext(tree, EDIT_MAINMOD_ACSMOUSE, obj == NULL ? "" : obj->label);
	obj = (Obj_Head *)config->ACSwikey;
	Aob_puttext(tree, EDIT_MAINMOD_ACSWIKEY, obj == NULL ? "" : obj->label);
	obj = (Obj_Head *)config->ACSGEMScript;
	Aob_puttext(tree, EDIT_MAINMOD_ACSGEMSCRIPT, obj == NULL ? "" : obj->label);
	obj = (Obj_Head *)config->ACSinit0;
	Aob_puttext(tree, EDIT_MAINMOD_ACSINIT0, obj == NULL ? "" : obj->label);
	obj = (Obj_Head *)config->ACSinit;
	Aob_puttext(tree, EDIT_MAINMOD_ACSINIT, obj == NULL ? "" : obj->label);
	
	Aob_printf(tree, EDIT_MAINMOD_DX, "%d", descr->dx);
	Aob_printf(tree, EDIT_MAINMOD_DY, "%d", descr->dy);
	
	Auo_cycle(&tree[EDIT_MAINMOD_XACC_TYPE], AUO_CYCINDEX, &config->XAccType);
}

/* -------------------------------------------------------------------------- */

static boolean edmm_getval(Awindow *self)
{
	ACS_HEAD *acs;
	Obj_Head *obj;
	Aconfig *config;
	Aolddescr *descr;
	OBJECT *tree;
	char *name;
	int16 button;
	
	acs = self->user;
	config = &acs->config;
	descr = &acs->descr;
	tree = self->work;

	if (tree[EDIT_MAINMOD_ISMAINMOD].ob_state & OS_SELECTED)
	{
		acs->flags &= ~ACS_SUBMODUL;
		init_mess(acs);
	} else
	{
		if (!(acs->flags & ACS_SUBMODUL))
		{
			button = Awi_alert(1, A_DELMESS);
			switch (button)
			{
			case 1:
				del_mess(acs);
				break;
			case 2:
				break;
			case 3:
				return FALSE;
			}
		}
	}
	
	acs->flags |= ACS_CHANGED;
	
	edmm_setflag(tree, EDIT_MAINMOD_ISMAINMOD, &acs->flags, ACS_SUBMODUL, TRUE);

	edmm_setflag(tree, EDIT_MAINMOD_OLGA, &acs->config.init_prot, CFG_INIT_OLGA, FALSE);
	edmm_setflag(tree, EDIT_MAINMOD_OLGA_WAIT, &acs->config.init_prot, CFG_INIT_OLGA_FULL, FALSE);
	edmm_setflag(tree, EDIT_MAINMOD_GEMSCRIPT, &acs->config.init_prot, CFG_INIT_GEMSCRIPT, FALSE);
	edmm_setflag(tree, EDIT_MAINMOD_BUBBLEGEM, &acs->config.init_prot, CFG_INIT_BUBBLEGEM, FALSE);

	edmm_setflag(tree, EDIT_MAINMOD_BEEP, &acs->descr.flags, AB_ACUSTIC, FALSE);
	edmm_setflag(tree, EDIT_MAINMOD_CENTERDIALOG, &acs->descr.flags, AB_CENTERDIALOG, FALSE);
	edmm_setflag(tree, EDIT_MAINMOD_GDOSFONT, &acs->descr.flags, AB_GDOSFONT, FALSE);
	edmm_setflag(tree, EDIT_MAINMOD_MENUFIRST, &acs->descr.flags, AB_MENUFIRST, FALSE);
	edmm_setflag(tree, EDIT_MAINMOD_CLICKMENU, &acs->descr.flags, AB_CLICKMENU, FALSE);
	edmm_setflag(tree, EDIT_MAINMOD_HIDEPOINTER, &acs->descr.flags, AB_HIDEPOINTER, FALSE);
	edmm_setflag(tree, EDIT_MAINMOD_3D, &acs->descr.flags, AB_NO3D, TRUE);
	edmm_setflag(tree, EDIT_MAINMOD_VISUAL_FEEDBACK, &acs->descr.flags, AB_FEEDBACK, FALSE);
	edmm_setflag(tree, EDIT_MAINMOD_MEMCHECK, &acs->descr.flags, AB_NOMEMCHECK, TRUE);
	edmm_setflag(tree, EDIT_MAINMOD_SECURITY_CHECKS, &acs->descr.flags, AB_LAZYEVAL, TRUE);
	edmm_setflag(tree, EDIT_MAINMOD_MODERN_3D, &acs->descr.flags, AB_OLDMENU, TRUE);
	
	strcpy(descr->acc_reg, "  ");
	Aob_gettext(tree, EDIT_MAINMOD_ACC_ENTRY, descr->acc_reg + 2);
	Auo_boxed(&tree[EDIT_MAINMOD_ACC_WINDOW], AUO_GETVAL, &name);
	obj = descr->acc;
	descr->acc = add_wi(acs, obj, name);
	Auo_boxed(&tree[EDIT_MAINMOD_DESKTOP], AUO_GETVAL, &name);
	obj = descr->root;
	descr->root = add_wi(acs, obj, name);

	Auo_boxed(&tree[EDIT_MAINMOD_ACSTERM], AUO_GETVAL, &name);
	obj = (Obj_Head *)config->ACSterm;
	config->ACSterm = add_fkt(acs, obj, name, REF_SYS_TERM);
	Auo_boxed(&tree[EDIT_MAINMOD_ACSABOUTME], AUO_GETVAL, &name);
	obj = (Obj_Head *)config->ACSaboutme;
	config->ACSaboutme = add_fkt(acs, obj, name, REF_SYS_ABOUTME);
	Auo_boxed(&tree[EDIT_MAINMOD_ACSCLOSE], AUO_GETVAL, &name);
	obj = (Obj_Head *)config->ACSclose;
	config->ACSclose = add_fkt(acs, obj, name, REF_SYS_CLOSE);
	Auo_boxed(&tree[EDIT_MAINMOD_ACSMESSAGE], AUO_GETVAL, &name);
	obj = (Obj_Head *)config->ACSmessage;
	config->ACSmessage = add_fkt(acs, obj, name, REF_SYS_MESSAGE);
	Auo_boxed(&tree[EDIT_MAINMOD_ACSMPROTO], AUO_GETVAL, &name);
	obj = (Obj_Head *)config->ACSmproto;
	config->ACSmproto = add_fkt(acs, obj, name, REF_SYS_MPROTO);
	Auo_boxed(&tree[EDIT_MAINMOD_ACSTIMER], AUO_GETVAL, &name);
	obj = (Obj_Head *)config->ACStimer;
	config->ACStimer = add_fkt(acs, obj, name, REF_SYS_TIMER);
	Auo_boxed(&tree[EDIT_MAINMOD_ACSKEY], AUO_GETVAL, &name);
	obj = (Obj_Head *)config->ACSkey;
	config->ACSkey = add_fkt(acs, obj, name, REF_SYS_KEY);
	Auo_boxed(&tree[EDIT_MAINMOD_ACSBUTTON], AUO_GETVAL, &name);
	obj = (Obj_Head *)config->ACSbutton;
	config->ACSbutton = add_fkt(acs, obj, name, REF_SYS_BUTTON);
	Auo_boxed(&tree[EDIT_MAINMOD_ACSMOUSE], AUO_GETVAL, &name);
	obj = (Obj_Head *)config->ACSmouse;
	config->ACSmouse = add_fkt(acs, obj, name, REF_SYS_MOUSE);
	Auo_boxed(&tree[EDIT_MAINMOD_ACSWIKEY], AUO_GETVAL, &name);
	obj = (Obj_Head *)config->ACSwikey;
	config->ACSwikey = add_fkt(acs, obj, name, REF_SYS_WIKEY);
	Auo_boxed(&tree[EDIT_MAINMOD_ACSGEMSCRIPT], AUO_GETVAL, &name);
	obj = (Obj_Head *)config->ACSGEMScript;
	config->ACSGEMScript = add_fkt(acs, obj, name, REF_SYS_GEMSCRIPT);
	Auo_boxed(&tree[EDIT_MAINMOD_ACSINIT0], AUO_GETVAL, &name);
	obj = (Obj_Head *)config->ACSinit0;
	config->ACSinit0 = add_fkt(acs, obj, name, REF_SYS_ACSINIT0);
	Auo_boxed(&tree[EDIT_MAINMOD_ACSINIT], AUO_GETVAL, &name);
	obj = (Obj_Head *)config->ACSinit;
	config->ACSinit = add_fkt(acs, obj, name, REF_SYS_ACSINIT);
	
	Aob_scanf(tree, EDIT_MAINMOD_DX, "%3d", &descr->dx); /* FIXME: int16 is not int */
	Aob_scanf(tree, EDIT_MAINMOD_DY, "%3d", &descr->dy); /* FIXME: int16 is not int */
	
	Auo_cycle(&tree[EDIT_MAINMOD_XACC_TYPE], AUO_CYCGETINDEX, &config->XAccType);
	
	if (acs->st_list->window != NULL)
		acs->st_list->window->state |= AWS_LATEUPDATE;
	if (acs->al_list->window != NULL)
		acs->al_list->window->state |= AWS_LATEUPDATE;
	
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static Awindow *edmm_create(void *para)
{
	ACS_HEAD *acs;
	Awindow *win;
	
	acs = (ACS_HEAD *)para;
	if (acs->wi_config != NULL)
	{
		Awi_show(acs->wi_config);
		return acs->wi_config;
	}
	win = Awi_create(&WI_MAINMOD);
	if (win == NULL)
		return NULL;
	win->user = acs;
	acs->wi_config = win;
	edmm_setval(win);
	edmm_enable(win);
	if (win->open(win) != OK)
	{
		win->service(win, AS_TERM, NULL);
		return NULL;
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static boolean edmm_service(Awindow *self, int16 task, void *in_out)
{
	ACS_HEAD *acs;
	
	acs = self->user;
	switch (task)
	{
	case AS_TERM:
		if (!(self->state & AWS_INTERM))
		{
			self->state |= AWS_INTERM;
			acs->wi_config = NULL;
			Awi_delete(self);
		}
		break;
	case AS_INFO:
		break;
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void edmm_ismain(void)
{
	Aev_release();
	edmm_enable(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void edmm_init_olga(void)
{
	OBJECT *tree;
	int16 ismain;
	int16 olga;
	
	tree = ACSblk->ev_window->work;
	ismain = tree[EDIT_MAINMOD_ISMAINMOD].ob_state & OS_SELECTED;
	olga = tree[EDIT_MAINMOD_OLGA].ob_state & OS_SELECTED;
	Aev_release();
	Aob_state(ACSblk->ev_window, EDIT_MAINMOD_OLGA_WAIT, OS_DISABLED, !ismain || !olga);
}

/* -------------------------------------------------------------------------- */

static void edmm_ok(void)
{
	if (edmm_getval(ACSblk->ev_window))
		ACSblk->ev_window->service(ACSblk->ev_window, AS_TERM, NULL);
}

/* -------------------------------------------------------------------------- */

static void edmm_cancel(void)
{
	ACSblk->ev_window->service(ACSblk->ev_window, AS_TERM, NULL);
}
