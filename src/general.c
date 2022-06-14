#include "acs_i.h"
#include "country.h"
#include "acsio.h"
#include "acsplus.h"

static void ge_mainmod(void);
static void ge_behave(void);
static void ge_window(void);
static void ge_object(void);
static void ge_menu(void);
static void ge_popup(void);
static void ge_reference(void);
static void ge_icon(void);
static void ge_image(void);
static void ge_alert(void);
static void ge_text(void);
static void ge_mouse(void);
static void ge_palette(void);
static void ge_tedinfo(void);
static void ge_userblk(void);
static void ge_data(void);
static void ge_save(void);
static void ge_saveas(void);
static void ge_backup(void);
static void ge_protocol(void);
static void ge_compiler(void);
static void ge_loadews(void);

static boolean ge_service(Awindow *self, int16 task, void *in_out);
static Awindow *ge_make(void *a);
static int16 ge_init(Awindow *self);

#include "general.ah"
#include "general.h"

#ifdef DEBUG
static Awindow *debug = NULL;
static long t1 = 0;
static long t2 = 0;
#endif

static void (*oldclose)(void);
void (*oldkey)(int16 *kstate, int16 *key); /* FIXME: unused */
void (*OldAboutMe)(void);

static boolean save_aborted;

static void backup(ACS_HEAD *acs);
static void compiler(Awindow *win);
static void term(Awindow *win);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void info(Awindow *self)
{
	ACS_HEAD *acs = (ACS_HEAD *)self->user;
	Obj_Head *obj;
	size_t size;
	long count;
	Awindow *win;
	char buf[26];
	
	size = sizeof(*acs);
	count = 0;
	for (obj = acs->labels; obj; obj = obj->next)
	{
		count++;
		size += obj->used + sizeof(*obj);
	}
	if ((win = WI_INFO_GENERAL.create(&WI_INFO_GENERAL)) != NULL)
	{
		Aob_puttext(win->work, INFO_GENERAL_FILE, acs->filename);
		sprintf(buf, "%li", size);
		Aob_puttext(win->work, INFO_GENERAL_SIZE, buf);
		sprintf(buf, "%li", count);
		Aob_puttext(win->work, INFO_GENERAL_OBJECTS, buf);
		Awi_dialog(win);
		Awi_delete(win);
	}
}

/* -------------------------------------------------------------------------- */

static void ge_loadews(void)
{
	ACS_HEAD *acs;
	char filename[__PS__];
	char *dot;
	
	if ((acs = (ACS_HEAD *)ACSblk->ev_window->user) == NULL || acs->magic != ACS_MAGIC || cews.w_cews == NULL)
			return;
	strcpy(filename, acs->filename);
	if ((dot = strrchr(filename, PATH_SEP)) == NULL)
		dot = filename;
	if ((dot = strrchr(dot, '.')) != NULL)
		strcpy(dot + 1, "EWS"); /* FIXME: make lowercase */
	else
		strcat(filename, ".EWS");
	cews.w_cews->service(cews.w_cews, AS_LOADFILE, filename);
}

/* -------------------------------------------------------------------------- */

static void ge_save(void)
{
	save(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

void save(Awindow *self)
{
	ACS_HEAD *acs;
	char filename[__PS__];
	char *dot;
	int fd;
	int16 changed;
	
	if ((acs = (ACS_HEAD *)self->user) == NULL || acs->magic != ACS_MAGIC)
		return;
	if (self->state & AWS_ICONIZED)
		memcpy(&acs->pos_ge, &self->wi_normal, sizeof(acs->pos_ge));
	else
		memcpy(&acs->pos_ge, &self->wi_act, sizeof(acs->pos_ge));
	changed = acs->flags & ACS_CHANGED;
	if (!dirtysave)
		acs_closewi(acs, TRUE);
	strcpy(filename, acs->filename);
	if ((dot = strrchr(filename, PATH_SEP)) == NULL)
		dot = filename;
	if ((dot = strrchr(dot, '.')) == NULL)
		strcat(filename, ".$$$");
	else
		strcpy(dot, ".$$$");
	if ((dot = strrchr(acs->filename, PATH_SEP)) == NULL)
		dot = acs->filename;
	else
		dot++;
	if (Frename(0, acs->filename, filename) == EACCDN)
	{
		Fdelete(filename);
		if (Frename(0, acs->filename, filename) == EACCDN)
			alert_str(ERR_RENAME, dot);
	}
	fd = (int)Fcreate(acs->filename, 0);
	if (fd < 0)
	{
		ACSblk->ACSerror(AE_CREATE_IO, dot);
		(void) Frename(0, filename, acs->filename);
	} else
	{
		if (save_acs(fd, acs) != OK)
		{
			ACSblk->ACSerror(AE_WRITE_IO, dot);
			Fdelete(acs->filename);
			(void) Frename(0, filename, acs->filename);
			save_aborted = TRUE;
		} else
		{
			Fdelete(filename);
			if (acs->extflags & ACS_EXT_PROTOCOL)
				protocol(acs);
			if (acs->extflags & ACS_EXT_BACKUP)
				backup(acs);
		}
	}
	if ((acs->flags & ACS_SRCOUTPUT) && changed && (!dirtysave || (self->state & AWS_INTERM)))
		compiler(self);
}

/* -------------------------------------------------------------------------- */

static void ge_saveas(void)
{
	ACS_HEAD *acs;
	char *filename;
	char info[__PS__];
	int16 wh;
	Awindow *self;
	Awindow *win;
	ULinList *list;
	
	self = ACSblk->ev_window;
	acs = (ACS_HEAD *)self->user;
	strcpy(last_path, acs->filename);
	list = Af_fileselect(ttl_save, last_path, "ACS,acs\0\0", SORTBYNAME, FALSE, NULL);
	if (list != NULL)
	{
		filename = list->first(list);
		Alu_delete(list);
	} else
	{
		filename = NULL;
	}
	if (filename == NULL)
		return;
	info[0] = ' ';
	strcpy(&info[1], filename);
	Ast_delete(self->iconblk->monoblk.ib_ptext);
	Ast_delete(self->info);
	self->info = Ast_create(info);
	self->iconblk->monoblk.ib_ptext = Ast_create(strrchr(filename, PATH_SEP) + 1);
	wh = self->wi_id;
	if (wh >= 0)
		wind_set(wh, WF_INFO, self->info, 0, 0);
	if (self->icon >= 0)
	{
		win = Awi_root();
		win->service(win, AS_UPDATEICON, &self->icon);
	}
	acs->filename = self->info + 1;
	save(self);
}

/* -------------------------------------------------------------------------- */

static void compiler(Awindow *win)
{
	ACS_HEAD *acs;
	
	if ((acs = (ACS_HEAD *)win->user) == NULL || acs->magic != ACS_MAGIC)
		return;
	acs_closewi(acs, TRUE);
	switch (acs->src_lang)
	{
	case ACS_LANG_C:
		pc_header(acs);
		pc_output(acs);
		break;
	case ACS_LANG_PASCAL:
		pp_output(acs);
		break;
	default:
		break;
	}
	str_output(acs);
}

/* -------------------------------------------------------------------------- */

static void ge_compiler(void)
{
	compiler(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void ge_protocol(void)
{
	ACS_HEAD *acs = (ACS_HEAD *)ACSblk->ev_window->user;

	acs_closewi(acs, TRUE);
	protocol(acs);
}

/* -------------------------------------------------------------------------- */

static void backup(ACS_HEAD *acs)
{
	char *slash;
	char *filename;
	int date;
	int time;
	long fd;
	
	filename = NULL;
	if (acs->backup[0] == '\0' ||
		(filename = Ax_malloc(strlen(acs->backup) + 28)) == NULL)
		return;
	strcpy(filename, acs->backup);
	if ((slash = strrchr(filename, PATH_SEP)) != NULL)
		*slash = '\0';
	strcat(filename, "\\");
	if ((slash = strrchr(acs->filename, PATH_SEP)) == NULL)
	{
		Ax_free(filename);
		return;
	}
	strcat(filename, slash + 1);
	date = ((Tgetdate() >> 9) & 0x7f) + 80;
	if (date >= 100)
		date -= 100;
	sprintf(strrchr(filename, '.'), ".%03d\\", date);
	date = Tgetdate();
	time = Tgettime();
	sprintf(strrchr(filename, PATH_SEP), "\\%02d%02d%02d%02d.ACS", (date >> 5) & 0x0f, date & 0x1f, (time >> 11) & 0x1f, (time >> 5) & 0x3f);
	time = Dgetdrv();
	Dsetdrv(filename[0] - 'A');
	slash = strchr(filename, PATH_SEP);
	slash = strchr(slash + 1, PATH_SEP);
	while (slash != NULL)
	{
		*slash = '\0';
		date = (int)Dcreate(filename);
		if (date < 0 && date != EACCDN)
			break;
		*slash = PATH_SEP;
		slash = strchr(slash + 1, PATH_SEP);
	}
	Dsetdrv(time);
	if (slash == NULL && Af_length(filename) < -1 && (fd = Fcreate(filename, 0)) > 0)
		save_acs((int16)fd, acs);
	Ax_free(filename);
}

/* -------------------------------------------------------------------------- */

static void ge_backup(void)
{
	backup(ACSblk->ev_window->user);
}

/* -------------------------------------------------------------------------- */

static void ge_behave(void)
{
	Awindow *self = ACSblk->ev_window;
	
	self->kind |= AW_STAY;
	WI_BEHAVE.create(self->user);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_mainmod(void)
{
	Awindow *self = ACSblk->ev_window;
	
	self->kind |= AW_STAY;
	WI_MAINMOD.create(self->user);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_palette(void)
{
	Awindow *self = ACSblk->ev_window;
	
	self->kind |= AW_STAY;
	WI_PALETTE.create(self->user);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static int16 ge_init(Awindow *self)
{
	long fd;
	ACS_HEAD *acs;
	char *filename;
	
	filename = self->user;
	acs = (ACS_HEAD *)Ax_malloc(sizeof(*acs));
	if (acs == NULL)
	{
		ACSblk->ACSerror(AE_OUT_OF_MEM, NULL);
		return FAIL;
	}
#if WITH_FIXES
	memset(acs, 0, sizeof(*acs));
#else
	memset(acs, 0, sizeof(acs)); /* BUG: only zeroes size of a pointer */
#endif
	self->user = acs;
	fd = Fopen(filename, FO_READ);
	acs->filename = filename;
	if (read_acs(fd, acs) != OK)
	{
		Ax_recycle(acs, sizeof(*acs));
		self->user = NULL;
		return FAIL;
	}
	acs->filename = filename;
	acs->window = self;
	wi_pos(self, &acs->pos_ge, &acs->last_rez);
	return OK;
}

/* -------------------------------------------------------------------------- */

static void ge_alert(void)
{
	ACS_HEAD *acs;
	Awindow *self = ACSblk->ev_window;
	
	acs = self->user;
	self->kind |= AW_STAY;
	list_alert.acs = acs;
	list_alert.objlist = acs->al_list;
	WI_LIST.create(&list_alert);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_icon(void)
{
	ACS_HEAD *acs;
	Awindow *self = ACSblk->ev_window;
	
	acs = self->user;
	self->kind |= AW_STAY;
	list_icon.acs = acs;
	list_icon.objlist = acs->ic_list;
	WI_LIST.create(&list_icon);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_mouse(void)
{
	ACS_HEAD *acs;
	Awindow *self = ACSblk->ev_window;
	
	acs = self->user;
	self->kind |= AW_STAY;
	list_mouse.acs = acs;
	list_mouse.objlist = acs->mo_list;
	WI_LIST.create(&list_mouse);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_image(void)
{
	ACS_HEAD *acs;
	Awindow *self = ACSblk->ev_window;
	
	acs = self->user;
	self->kind |= AW_STAY;
	list_image.acs = acs;
	list_image.objlist = acs->im_list;
	WI_LIST.create(&list_image);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_menu(void)
{
	ACS_HEAD *acs;
	Awindow *self = ACSblk->ev_window;
	
	acs = self->user;
	self->kind |= AW_STAY;
	list_menu.acs = acs;
	list_menu.objlist = acs->me_list;
	WI_LIST.create(&list_menu);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_data(void)
{
	ACS_HEAD *acs;
	Awindow *self = ACSblk->ev_window;
	
	acs = self->user;
	self->kind |= AW_STAY;
	list_data.acs = acs;
	list_data.objlist = acs->if_list;
	WI_LIST.create(&list_data);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_object(void)
{
	ACS_HEAD *acs;
	Awindow *self = ACSblk->ev_window;
	
	acs = self->user;
	self->kind |= AW_STAY;
	list_object.acs = acs;
	list_object.objlist = acs->ob_list;
	WI_LIST.create(&list_object);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_popup(void)
{
	ACS_HEAD *acs;
	Awindow *self = ACSblk->ev_window;
	
	acs = self->user;
	self->kind |= AW_STAY;
	list_popup.acs = acs;
	list_popup.objlist = acs->pu_list;
	WI_LIST.create(&list_popup);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_reference(void)
{
	ACS_HEAD *acs;
	Awindow *self = ACSblk->ev_window;
	
	acs = self->user;
	self->kind |= AW_STAY;
	list_reference.acs = acs;
	list_reference.objlist = acs->rf_list;
	WI_LIST.create(&list_reference);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_text(void)
{
	ACS_HEAD *acs;
	Awindow *self = ACSblk->ev_window;
	
	acs = self->user;
	self->kind |= AW_STAY;
	list_string.acs = acs;
	list_string.objlist = acs->st_list;
	WI_LIST.create(&list_string);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_tedinfo(void)
{
	ACS_HEAD *acs;
	Awindow *self = ACSblk->ev_window;
	
	acs = self->user;
	self->kind |= AW_STAY;
	list_tedi.acs = acs;
	list_tedi.objlist = acs->te_list;
	WI_LIST.create(&list_tedi);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_userblk(void)
{
	ACS_HEAD *acs;
	Awindow *self = ACSblk->ev_window;
	
	acs = self->user;
	self->kind |= AW_STAY;
	list_user.acs = acs;
	list_user.objlist = acs->us_list;
	WI_LIST.create(&list_user);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void ge_window(void)
{
	ACS_HEAD *acs;
	Awindow *self = ACSblk->ev_window;
	
	acs = self->user;
	self->kind |= AW_STAY;
	list_window.acs = acs;
	list_window.objlist = acs->wi_list;
	WI_LIST.create(&list_window);
	self->kind &= ~AW_STAY;
}

/* -------------------------------------------------------------------------- */

static void *openFile(void *para, void *filename)
{
	Awindow *win;
	char *basename;
	char path[__PS__];
	char ext[12];
	
	if (Ast_isEmpty(filename))
		return NULL;
	basename = strrchr(filename, PATH_SEP);
	if (basename == NULL)
		basename = filename;
	else
		basename++;
	Af_2ext(ext, filename);
	if (Ast_isEmpty(ext))
		strcat(basename, ".acs");
	Af_2ext(ext, filename);
	if (Ast_icmp(ext, "ACS") == 0 || Ast_icmp(ext, "RSC") == 0)
	{
		WI_GENERAL.iconblk->monoblk.ib_ptext = basename;
		path[0] = ' ';
		strcpy(&path[1], filename);
		WI_GENERAL.info = path;
		if ((win = Awi_create(&WI_GENERAL)) == NULL)
			return NULL;
		win->user = win->info + 1;
		if (win->open(win) != OK)
		{
			term(win);
			return NULL;
		}
	} else if (Ast_icmp(ext, "AM") == 0 || Ast_icmp(ext, "AME") == 0)
	{
		Ash_module(filename);
		/* BUG: win not set */
#if WITH_FIXES
		win = NULL;
#endif
	} else
	{
		win = EDITOR.create(NULL);
		if (win != NULL)
		{
			win->service(win, AS_EDLOADFILE, filename);
			win->open(win);
		}
	}
	if (para == NULL) /* BUG: wrong condition */
		*((void **)para) = win;
	strcpy(last_path, filename);
	return win;
}

/* -------------------------------------------------------------------------- */

static Awindow *ge_make(void *filename)
{
	Awindow *win = NULL;
	
	if (ACSblk->Aselect.actlen > 0)
		Adr_unselect();
	if (Ast_isEmpty(filename))
	{
		ULinList *list = Af_fileselect(ttl_open, last_path, "ACS,acs\0RSC,rsc\0\0", SORTBYNAME, TRUE, NULL);
		if (list != NULL)
		{
			list->doFor(list, &win, 0, (void (*)(void *, void *))openFile); /* BUG: wrong function type */
			Alu_delete(list);
		}
	} else
	{
		openFile(&win, filename);
	}
	/* BUG: win will never be set by openFile; see bug there */
	return win;
}

/* -------------------------------------------------------------------------- */

static boolean ge_service(Awindow *self, int16 task, void *in_out)
{
	ACS_HEAD *acs;
	Awindow *win;
	
	switch (task)
	{
	case AS_GUI_SAVECFG:
		acs = (ACS_HEAD *)self->user;
		if (acs != NULL)
		{
			win = in_out;
			win->service(win, AS_GUI_SETUSED, acs->filename);
		}
		break;
	case AS_GENERAL_10005:
		if (save_aborted == TRUE)
			break;
		/* fall through */
	case AS_TERM:
		term(self);
		break;
	case AS_INFO:
		info(self);
		break;
	case AS_ALLOWBUBBLE:
		*((boolean *)in_out) = TRUE;
		break;
	case AS_GETBUBBLE:
		((AGetObjText *)in_out)->text = NULL;
		break;
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void term(Awindow *win)
{
	ACS_HEAD *acs;
	const char *alert;
	char *basename;
	
	acs = (ACS_HEAD *)win->user;
	if (acs != NULL)
	{
		acs_closewi(acs, TRUE);
		if (acs->flags & ACS_CHANGED)
		{
			if (ACSblk->appexit)
				alert = ERR_MODIFIED;
			else
				alert = ERR_AMODIFIED;
			basename = strrchr(acs->filename, PATH_SEP);
			if (basename == NULL)
				basename = acs->filename;
			else
				basename++;
			switch (alert_str(alert, basename))
			{
			case 1:
				win->state |= AWS_INTERM;
				save(win);
				break;
			case 3:
				save_aborted = TRUE;
				return;
			default:
				win->state |= AWS_INTERM;
				break;
			}
		}
		free_acs(acs);
	}
	Awi_delete(win);
}

/* -------------------------------------------------------------------------- */

static void exec_cmd(char *cmd)
{
	if (Ast_isEmpty(cmd) ||
		base_window->service(base_window, AS_GUI_ISNOTUSED, cmd))
		WI_GENERAL.create(cmd);
}

/* -------------------------------------------------------------------------- */

static void newclose(void)
{
	base_window->service(base_window, AS_GUI_AUTOSAVE, NULL);
	save_aborted = FALSE;
	Awi_sendall(AS_GENERAL_10005, NULL);
	if (save_aborted == TRUE)
		return;
	if (oldclose)
		oldclose();
}	

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

#ifdef DEBUG

static long timmer_200(void)
{
	return *((long *)0x4ba);
}

/* -------------------------------------------------------------------------- */

static void debugtimer(void);

static void debugclick(void)
{
	if (ACSblk->ev_object->ob_state & AOS_DCLICK)
	{
		Auo_editor(ACSblk->ev_object, AUO_EDDELETE, NULL);
		Auo_editor(ACSblk->ev_object, AS_SELECTADD, NULL);
		debugtimer();
	}
	Aev_release();
}

/* -------------------------------------------------------------------------- */

static void debugtimer(void)
{
	Awindow *first;
	Awindow *win;
	ACS_HEAD *acs;
	int count;
	int mlcount;
	int l;
	int i;
	int j;
	boolean found;
	char buf[40];
	Obj_Head *list;
	Obj_Head **items;
	Obj_Head *item;
	Obj_Head *mllist;
	Obj_Head **mlitems;
	Obj_Head *mlitem;
	
	t1 = Supexec(timmer_200);
	if (t1 - t2 < 1000)
		return;
	if (debug != NULL &&
		Aob_within(&debug->wi_act, ACSblk->ev_mmox, ACSblk->ev_mmoy))
		return;
	t2 = t1;
	if (debug == NULL)
	{
		if ((debug = PROTOCOL.create(NULL)) != NULL)
		{
			((AOBJECT *)&debug->work[1])->click = debugclick;
			debug->work[0].ob_flags = OF_TOUCHEXIT;
		}
	}
	if (debug == NULL)
		return;
	first = win = Awi_list();
	do
	{
		if ((acs = win->user) != NULL && acs->magic == ACS_MAGIC)
		{
			list = acs->st_list;
			items = (Obj_Head **)list->object;
			count = (int)(list->used / sizeof(*items));
			for (l = 0; l < MAX_LANGS; l++)
			{
				mllist = acs->mlst_list[l];
				mlitems = (Obj_Head **)mllist->object;
				mlcount = (int)(mllist->used / sizeof(*mlitems));
				if (mlcount != count)
				{
					debug->open(debug);
#if COUNTRY == COUNTRY_DE
					wprintf(debug, "Unterschiedliche Textanzahl:\n"
						"Datei '%s'\n"
						"st_list: %d\n"
						"mlst_list[%d]: %d\n",
						win->info, count, l, mlcount);
#else
					wprintf(debug, "Unterschiedliche Textanzahl:\n"
						"Datei '%s'\n"
						"st_list: %d\n"
						"mlst_list[%d]: %d\n",
						win->info, count, l, mlcount);
#endif
					return;
				}
				for (i = 0; i < count; i++)
				{
					found = FALSE;
					item = items[i];
					sprintf(buf, "%.28s\001%d\001", item->label, l);
					for (j = 0; j < mlcount; j++)
					{
						mlitem = mlitems[j];
						if (Ast_icmp(mlitem->label, buf) == 0) /* FIXME: should use strcmp */
						{
							found = TRUE;
							break;
						}
					}
					if (!found)
					{
						debug->open(debug);
						wprintf(debug, "Textlabel nicht gefunden:\n"
							"Datei '%s'\n"
							"st_list: %d\n"
							"erwartetes Label '%s'\n",
							win->info, i, buf);
					} else if (i != j)
					{
						debug->open(debug);
						wprintf(debug, "Unterschiedliche Indizes fÅr '%s':\n"
							"sl_list: %d mlst_list[%d]: %d\n",
							buf, i, l, j);
						for (j = 0; j < mlcount; j++)
						{
							wprintf(debug, "Index %d: '%s' / '%s'\n", j, items[j]->label, mlitems[j]->label);
						}
					}
				}
			}
			
			list = acs->al_list;
			items = (Obj_Head **)list->object;
			count = (int)(list->used / sizeof(*items));
			for (l = 0; l < MAX_LANGS; l++)
			{
				mllist = acs->mlal_list[l];
				mlitems = (Obj_Head **)mllist->object;
				mlcount = (int)(mllist->used / sizeof(*mlitems));
				if (mlcount != count)
				{
					debug->open(debug);
#if COUNTRY == COUNTRY_DE
					wprintf(debug, "Unterschiedliche Textanzahl:\n"
						"Datei '%s'\n"
						"al_list: %d\n"
						"mlal_list[%d]: %d\n",
						win->info, count, l, mlcount);
#else
					wprintf(debug, "Unterschiedliche Textanzahl:\n"
						"Datei '%s'\n"
						"al_list: %d\n"
						"mlal_list[%d]: %d\n",
						win->info, count, l, mlcount);
#endif
					return;
				}
				for (i = 0; i < count; i++)
				{
					found = FALSE;
					item = items[i];
					sprintf(buf, "%.28s\001%d\001", item->label, l);
					for (j = 0; j < mlcount; j++)
					{
						mlitem = mlitems[j];
						if (strcmp(mlitem->label, buf) == 0)
						{
							found = TRUE;
							break;
						}
					}
					if (!found)
					{
						debug->open(debug);
						wprintf(debug, "Textlabel nicht gefunden:\n"
							"Datei '%s'\n"
							"al_list: %d\n"
							"erwartetes Label '%s'\n",
							win->info, i, buf);
					} else if (i != j)
					{
						debug->open(debug);
						wprintf(debug, "Unterschiedliche Indizees fÅr '%s':\n"
							"al_list: %d mlal_list[%d]: %d\n",
							buf, i, l, j);
						for (j = 0; j < mlcount; j++)
						{
							wprintf(debug, "Index %d: '%s' / '%s'\n", j, items[j]->label, mlitems[j]->label);
						}
					}
				}
			}
		}
		win = Awi_list();
	} while (first != win);
}

#endif

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 ACSinit0(void)
{
	Ax_setRecycleSize(sizeof(Obj_Head), 500, "OBJ_HEAD");
	Ax_setRecycleSize(sizeof(ACS_HEAD), 5, "ACS_HEAD");
	OldAboutMe = ACSblk->ACSaboutme;
	ACSblk->ACSaboutme = AboutGUIEditor;
	return OK;
}

/* -------------------------------------------------------------------------- */

int16 ACSinit(void)
{
	int i;
	char *filename;
	char path[__PS__];
	Awindow *root;
	char program_name[] = "ACSpro";
	char *AppLongName;
	void (*func)(char *);
	
	AppLongName = ACSblk->AppLongName;
	ACSblk->AppLongName = Ax_glmalloc(strlen(program_name) + 5);
	if (ACSblk->AppLongName != NULL)
	{
		strcpy(ACSblk->AppLongName, program_name);
		if (AppLongName != NULL)
			Ax_glfree(AppLongName);
	} else
	{
		ACSblk->AppLongName = AppLongName;
	}
	
	oldclose = ACSblk->ACSclose;
	ACSblk->ACSclose = newclose;
#ifdef DEBUG
	ACSblk->ACStimer = debugtimer;
#endif
	root = Awi_root();
	if (root == NULL)
		return FAIL;
	
	if (root->wi_id > 0)
		root->iconblk = Aic_create(&IC_GENERAL);
	func = exec_cmd;
	root->service(root, AS_NEWCALL, &func); /* WTF? why address? */
	WI_PARTS.create(NULL);
	if (parts_window == NULL)
		return FAIL;
	base_window = WI_COMMON.create(NULL);
	if (base_window == NULL)
		return FAIL;
	if (ACSblk->application && ACSblk->argc > 1)
	{
		for (i = 1; i < ACSblk->argc; i++)
		{
			filename = ACSblk->argv[i];
			if (!Ast_isEmpty(filename))
			{
				Ast_alltrim(filename);
				if (strchr("-/", *filename) == NULL)
				{
					Af_unquote(path, filename);
					if (!Ast_isEmpty(path))
						exec_cmd(path);
				}
			}
		}
	}
	
	return OK;
}
