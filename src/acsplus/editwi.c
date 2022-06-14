/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Editor window                                         */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "acsplus.h"
#include "country.h"

static boolean edit_service(Awindow *self, int16 task, void *in_out);
static Awindow *edit_make(void *a);
static int16 edit_init(Awindow *self);
static void edit_fulled(Awindow *self);
static void edit_arrowed(Awindow *self, int16 pos, int16 amount);
static void edit_hslid(Awindow *self, int16 pos);
static void edit_vslid(Awindow *self, int16 pos);
static void edit_sized(Awindow *self, Axywh *area);
static void edit_moved(Awindow *self, Axywh *area);
static int16 edit_key(Awindow *self, int16 kstate, int16 key);

#include "editwi.ah"
#include "editwi.h"

#if COUNTRY == COUNTRY_DE
#define NONAME_TXT   "namenlos.txt"
#define NO_BRACKET   " Keine Klammer."
#define OPEN_TITLE   "Datei ”ffnen"
#define MERGE_TITLE  "Datei hinzufgen"
#define SAVE_TITLE   "Datei sichern"
#define FONTS        "Schrift"
#define NEW_FILE     " Neue Datei."
#endif
#if COUNTRY == COUNTRY_US
#define NONAME_TXT   "noname.txt"
#define NO_BRACKET   " No bracket."
#define OPEN_TITLE   "Open text"
#define MERGE_TITLE  "Insert text"
#define SAVE_TITLE   "Save text"
#define FONTS        "Fonts"
#define NEW_FILE     " New text."
#endif

typedef struct {
	int16 key;
	char text[256];
} FKeyLine;

typedef struct {
	int32 id;
	int16 tab;
	int16 w;
	int16 h;
	int16 fontid;
	int16 height;
	int16 cursor;
	char ext[16];
	char filename[__PS__ * 2];
	int16 wrap;
	int16 flags;
	char find_string[256];
	char replace_search[256];
	char replace_by[256];
	char separator[257];
	char helpacc[9];
} EDCONF;

#define NUM_FKEYS 40

typedef struct {
	Awindow *control;
	Awindow *wifkeys;
	char open_title[32];
	char merge_title[32];
	char save_title[32];
	char normal_format[32];
	char changed_format[32];
	char icontext[16];
	char ic_name[16];
	int16 counter;
	long oldc;
	long oldr;
	FKeyLine *fkeys[NUM_FKEYS];
	EDCONF cnf;
} EDITDATA;

/* EDCONF.flags */
#define EDCONF_FIND_NOCASE       0x0001
#define EDCONF_FIND_WORD         0x0002
#define EDCONF_FIND_BACKWARD     0x0004
#define EDCONF_REPLACE_ALL       0x0008
#define EDCONF_REPLACE_NOCASE    0x0010
#define EDCONF_REPLACE_WORD      0x0020
#define EDCONF_REPLACE_BACKWARD  0x0040
#define EDCONF_DIRTY             0x0080
#define EDCONF_SAVEOK            0x0100
#define EDCONF_USERTOOLBAR       0x0200


#define EDCONF_MAGIC 	0x41454431L /* 'AED1' */

static EDCONF protocnf = {
	EDCONF_MAGIC,
	2,
	0,
	0,
	1,
	13,
	0,
	"txt",
	NONAME_TXT,
	72,
	0,
	"",
	"",
	"",
	"",
	"ST-GUIDE",
};

static EDITDATA proto = {
	NULL,
	NULL,
	OPEN_TITLE,
	MERGE_TITLE,
	SAVE_TITLE,
	" %s (EDITOR) ",
	" * %s (EDITOR) ",
	"",
	"",
	0,
	-1,
	-1,
	{
		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL
	},
	{
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		"",
		"",
		0,
		0,
		"",
		"",
		"",
		"",
		""
	}
};

static char ins[] = "a";
static char *text1[] = { ins };
static char *text2[] = { "", "" };
static EDITSUBS subins = { 0, 0, 0, 0, 1, text1 };
static EDITSUBS subcr = { 0, 0, 0, 0, 2, text2 };
static EDITSUBS subdel = { 0, 0, 0, 0, 1, text2 };
static long Apaste_rows = 0;
static char **Apaste_text = NULL;
static int editors = 0;
static AUSERBLK euser = { A_editor, 0, Auo_editor, NULL, NULL, NULL, NULL, NULL };
static AUSERBLK vslider = { A_wislider, 1, Auo_wislider, NULL, NULL, NULL, NULL, NULL };
static AUSERBLK hslider = { A_wislider, 0, Auo_wislider, NULL, NULL, NULL, NULL, NULL };
static AUSERBLK eselect = { A_select, 0, NULL, NULL, NULL, NULL, NULL, NULL };

static void sel_edit(void);
static void ins_string(void);

static struct {
	OBJECT root;
	AOBJECT edit0;
	OBJECT drag;
	AOBJECT drag0;
	OBJECT hor;
	OBJECT ver;
} edit = {
	{ -1,  2,  2, G_USERDEF, 0x1840, 0x0000, C_UNION(&euser), 0, 0, 40, 10 },
	{ sel_edit, ins_string, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{  0, -1, -1, G_USERDEF, 0x20c0, 0x0000, C_UNION(&eselect), 0, 0, 0, 0 },
	{ NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ -1, -1, -1, G_USERDEF, 0x0000, 0x0000, C_UNION(&hslider), 0, 0, 0, 0 },
	{ -1, -1, -1, G_USERDEF, 0x0020, 0x0000, C_UNION(&vslider), 0, 0, 0, 0 }
};

#define EDIT_EDITOR     0
#define EDIT_SELECT     2
#define EDIT_HOR_SLIDER 4
#define EDIT_VER_SLIDER 5

static char c_swap[] = "ab";
static char *tsw[] = { c_swap };
static EDITSUBS subswap = { 0, 0, 0, 0, 1, tsw };
static char *t[] = { "", "" };
static EDITSUBS subs = { 0, 0, 0, 0, 2, t };

#define BUFFER_SIZE 8192
static char buffer[BUFFER_SIZE + 2];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void set_title(Awindow *self, const char *title);
static int16 copy(OBJECT *editor);
static void cutline(OBJECT *editor);
static void cut(OBJECT *editor);
static void paste(OBJECT *editor);
static void put_string(Awindow *self, const char *str);
static void info_string(Awindow *self, const char *str);
static void next_key(int16 *key);
static void ed_save(Awindow *self);
static void ed_saveas(Awindow *self);
static void put_block(OBJECT *editor, char *str, ssize_t len);
static void open_file(Awindow *self, const char *filename);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void set_icon(Awindow *self)
{
	CICONBLK *icon;
	EDITDATA *editdata;
	char *icontext;
	char *filename;
	Awindow *win;
	
	if ((icon = self->iconblk) != NULL)
	{
		editdata = self->user;
		if (editdata->icontext[0] != '\0')
		{
			icontext = editdata->icontext;
		} else
		{
			filename = editdata->cnf.filename;
			icontext = strrchr(filename, PATH_SEP);
			if (icontext != NULL)
				icontext++;
			else
				icontext = filename;
		}
		if (strcmp(icontext, editdata->ic_name) != 0)
		{
			editdata->ic_name[0] = '\0';
			strncat(editdata->ic_name, icontext, sizeof(editdata->ic_name) - 1);
			Ast_delete(icon->monoblk.ib_ptext);
			icon->monoblk.ib_ptext = Ast_create(icontext);
			win = Awi_root();
			win->service(win, AS_UPDATEICON, &self->icon);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void home(OBJECT *editor)
{
	long val;
	
	val = 0;
	Auo_editor(editor, AUO_EDCURHIDE, NULL);
	Auo_editor(editor, AUO_BEGIN, NULL);
	Auo_editor(editor, AUO_EDCURPOS, &val);
	Auo_editor(editor, AUO_EDVIEW, NULL);
	Auo_editor(editor, AUO_UPDATE, NULL);
	Auo_editor(editor, AUO_EDCURSHOW, NULL);
}

/* -------------------------------------------------------------------------- */

static void set_select(OBJECT *obj, boolean setit)
{
	if (setit)
		obj->ob_state |= OS_SELECTED;
	else
		obj->ob_state &= ~OS_SELECTED;
}

/* -------------------------------------------------------------------------- */

static void undirty(Awindow *self)
{
	EDITDATA *editdata = self->user;
	
	editdata->cnf.flags &= ~EDCONF_DIRTY;
	Auo_editor(&self->work[EDIT_EDITOR], AUO_EDRESET, NULL);
	sprintf(buffer, editdata->normal_format, editdata->cnf.filename);
	set_title(self, buffer);
}

/* -------------------------------------------------------------------------- */

static void dirty(Awindow *self)
{
	EDITDATA *editdata = self->user;
	boolean changed;

	if (!(editdata->cnf.flags & EDCONF_DIRTY))
	{
		Auo_editor(&self->work[EDIT_EDITOR], AUO_EDGETCHANGED, &changed);
		if (changed)
		{
			editdata->cnf.flags |= EDCONF_DIRTY;
			sprintf(buffer, editdata->changed_format, editdata->cnf.filename);
			set_title(self, buffer);
		}
	}
}
	
/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static int16 edit_key(Awindow *self, int16 kstate, int16 key)
{
	OBJECT *editor;
	Awindow *helpwin;
	AUSERBLK *auser;
	EDITDATA *editdata;
	long rows;
	long row;
	long col;
	long size;
	long firstcol;
	EDITSEL sel;
	long col1;
	int loop;
	char savec;
	char buf[512];
	char *separator;
	char *str;
	EDITGETS gets;
	int16 ret;
	long inscol;
	boolean (*serv)(OBJECT *entry, int16 task, void *in_out);
	int16 level;
	boolean found;
	
	editor = &self->work[EDIT_EDITOR];
	ret = -1;
	editdata = self->user;
	loop = 8;
	firstcol = 0;
	auser = editor->ob_spec.auserblk;
	serv = auser->ub_serv;
	serv(editor, AUO_EDCURHIDE, NULL);
	
	while ((char) key != 0)
	{
		if (key < 0) /* key & NKF_FUNC */
		{
			/* functions keys */
			switch ((char) key)
			{
			case NK_UNDO:
				serv(editor, AUO_EDUNDO, NULL);
				serv(editor, AUO_UPDATE, NULL);
				break;
			
			case NK_HELP:
				serv(editor, AUO_EDGETSELECT, &sel);
				if (sel.row1 < 0)
				{
					serv(editor, AUO_EDGETSEPARATOR, &separator);
					serv(editor, AUO_EDGETPOS, &row);
					serv(editor, AUO_EDGETCURPOS, &col);
					sel.row1 = sel.row2 = gets.row = row;
					serv(editor, AUO_EDGETROW, &gets);
					col1 = col;
					while (col1 >= 0)
					{
						if (strchr(separator, gets.text[col1]) != NULL)
							break;
						col1--;
					}
					sel.col1 = col1 + 1;
					col1 = col;
					while (col1 < gets.size)
					{
						if (strchr(separator, gets.text[col1]) != NULL)
							break;
						col1++;
					}
					sel.col2 = col1;
				} else
				{
					serv(editor, AUO_EDUNSELECT, NULL);
					gets.row = sel.row1;
					serv(editor, AUO_EDGETROW, &gets);
					if (sel.row1 != sel.row2)
					{
						sel.row2 = sel.row1;
						sel.col2 = gets.size;
					}
				}
				if (sel.col2 > sel.col1)
				{
					helpwin = NULL;
					Awi_sendall(AS_ASKHELP, &helpwin);
					strcpy(buf, "\t");
					strncat(buf, &gets.text[sel.col1], sel.col2 - sel.col1); /* BUG: will not terminate string */
#if WITH_FIXES
					buf[sel.col2 - sel.col1 + 1] = '\0';
#endif
					serv(editor, AUO_EDSETSELECT, &sel);
					if (helpwin != NULL)
					{
						helpwin->service(helpwin, AS_HELP, buf);
					} else
					{
						if (Aev_AcHelp(editdata->cnf.helpacc, &buf[1], NULL) != TRUE)
							ret = -2;
					}
				} else
				{
					/* ret = -2; */
					goto _default;
				}
				break;
			
			case NK_UP:
				serv(editor, AUO_EDGETSELECT, &sel);
				if (sel.row1 >= 0)
				{
					serv(editor, AUO_EDUNSELECT, NULL);
					serv(editor, AUO_POS, &sel.row1);
					serv(editor, AUO_EDCURPOS, &sel.col1);
				} else
				{
					if (key & NKF_SHIFT)
						serv(editor, AUO_PREVPAGE, NULL);
					else
						serv(editor, AUO_PREV, NULL);
				}
				break;
			
			case NK_DOWN:
				serv(editor, AUO_EDGETSELECT, &sel);
				if (sel.row1 >= 0)
				{
					serv(editor, AUO_EDUNSELECT, NULL);
					serv(editor, AUO_POS, &sel.row2);
					serv(editor, AUO_EDCURPOS, &sel.col2);
				} else
				{
					if (key & NKF_SHIFT)
						serv(editor, AUO_NEXTPAGE, NULL);
					else
						serv(editor, AUO_NEXT, NULL);
				}
				break;
			
			case NK_LEFT:
				serv(editor, AUO_EDGETSELECT, &sel);
				if (sel.row1 >= 0)
				{
					serv(editor, AUO_EDUNSELECT, NULL);
					serv(editor, AUO_POS, &sel.row1);
					serv(editor, AUO_EDCURPOS, &sel.col1);
				} else
				{
					if (key & NKF_CTRL)
					{
						serv(editor, AUO_EDUNSELECT, NULL);
						serv(editor, AUO_EDGETPOS, &row);
						serv(editor, AUO_EDGETCURPOS, &col);
						if (col == 0)
						{
							if (row != 0)
							{
								--row;
								serv(editor, AUO_POS, &row);
								serv(editor, AUO_EDGETLENGTH, &col);
								serv(editor, AUO_EDCURPOS, &col);
							}
						} else
						{
							serv(editor, AUO_EDGETSEPARATOR, &separator);
							gets.row = row;
							serv(editor, AUO_EDGETROW, &gets);
							col1 = col - 1;
							while (col1 > 0)
							{
								if (strchr(separator, gets.text[col1 - 1]) == NULL)
								{
									while (col1 > 0)
									{
										if (strchr(separator, gets.text[col1 - 1]) != NULL)
											break;
										--col1;
									}
									break;
								} else
								{
									--col1;
								}
							}
						setcol1:
							serv(editor, AUO_EDCURPOS, &col1);
						}
					} else
					{
						if (key & NKF_SHIFT)
						{
							serv(editor, AUO_EDCURPOS, &firstcol);
						} else
						{
							serv(editor, AUO_EDGETCURPOS, &col);
							if (col != 0)
							{
								--col;
								serv(editor, AUO_EDCURPOS, &col);
							} else
							{
								serv(editor, AUO_EDGETPOS, &row);
								if (row > 0)
								{
									serv(editor, AUO_PREV, NULL);
									serv(editor, AUO_EDGETLENGTH, &size);
									serv(editor, AUO_EDCURPOS, &size);
								}
							}
						}
					}
				}
				break;
			
			case NK_RIGHT:
				serv(editor, AUO_EDGETSELECT, &sel);
				if (sel.row1 >= 0)
				{
					serv(editor, AUO_EDUNSELECT, NULL);
					serv(editor, AUO_POS, &sel.row2);
					serv(editor, AUO_EDCURPOS, &sel.col2);
				} else
				{
					if (key & NKF_CTRL)
					{
						serv(editor, AUO_EDUNSELECT, NULL);
						serv(editor, AUO_EDGETPOS, &row);
						serv(editor, AUO_EDGETCURPOS, &col);
						serv(editor, AUO_EDGETROWS, &rows);
						serv(editor, AUO_EDGETLENGTH, &size);
						if (col == size)
						{
							if (row != rows - 1)
							{
								serv(editor, AUO_EDCURPOS, &firstcol);
								++row;
								serv(editor, AUO_POS, &row);
							}
						} else
						{
							serv(editor, AUO_EDGETSEPARATOR, &separator);
							gets.row = row;
							serv(editor, AUO_EDGETROW, &gets);
							col1 = col;
							while (col1 < size)
							{
								if (strchr(separator, gets.text[col1]) != NULL)
								{
									while (col1 < size)
									{
										if (strchr(separator, gets.text[col1]) == NULL)
											break;
										col1++;
									}
									break;
								} else
								{
									col1++;
								}
							}
#if 0
							serv(editor, AUO_EDCURPOS, &col1);
#else
							goto setcol1;
#endif
						}
					} else
					{
						serv(editor, AUO_EDUNSELECT, NULL);
						serv(editor, AUO_EDGETLENGTH, &size);
						if (key & NKF_SHIFT)
						{
						setsize:
							serv(editor, AUO_EDCURPOS, &size);
						} else
						{
							serv(editor, AUO_EDGETCURPOS, &col);
							if (col < size)
							{
								++col;
								serv(editor, AUO_EDCURPOS, &col);
							} else
							{
								serv(editor, AUO_EDGETROWS, &rows);
								serv(editor, AUO_EDGETPOS, &row);
								if (row + 1 < rows)
								{
									serv(editor, AUO_NEXT, NULL);
									serv(editor, AUO_EDCURPOS, &firstcol);
								}
							}
						}
					}
				}
				break;
			
			case NK_CLRHOME:
				{
					serv(editor, AUO_EDUNSELECT, NULL);
					if (key & NKF_SHIFT)
					{
						serv(editor, AUO_END, NULL);
						serv(editor, AUO_EDGETLENGTH, &size);
						/* serv(editor, AUO_EDCURPOS, &size); */
						goto setsize;
					} else
					{
						serv(editor, AUO_BEGIN, NULL);
						serv(editor, AUO_EDCURPOS, &firstcol);
					}
				}
				break;
			
			case NK_DEL:
				serv(editor, AUO_EDGETSELECT, &sel);
				if (sel.row1 >= 0)
				{
					subdel.row1 = sel.row1;
					subdel.col1 = sel.col1;
					subdel.row2 = sel.row2;
					subdel.col2 = sel.col2;
				} else
				{
					serv(editor, AUO_EDGETPOS, &row);
					serv(editor, AUO_EDGETCURPOS, &col);
					serv(editor, AUO_EDGETLENGTH, &size);
					if (col < size)
					{
						subdel.row1 = subdel.row2 = row;
						subdel.col1 = col;
						if (key & NKF_SHIFT)
						{
							subdel.col2 = size;
						} else
						{
							if (key & NKF_CTRL)
							{
								serv(editor, AUO_EDGETSEPARATOR, &separator);
								gets.row = row;
								serv(editor, AUO_EDGETROW, &gets);
								col1 = col;
								str = strchr(separator, gets.text[col1]);
								while (col1 < gets.size &&
									((str != NULL ? strchr(separator, gets.text[col1]) != NULL :
									 strchr(separator, gets.text[col1]) == NULL)))
								{
									col1++;
								}
								subdel.col2 = col1;
							} else
							{
								subdel.col2 = col + 1;
							}
						}
					} else
					{
						serv(editor, AUO_EDGETROWS, &rows);
						if (row + 1 < rows)
						{
							subdel.row1 = row;
							subdel.row2 = row + 1;
							subdel.col1 = size;
							subdel.col2 = 0;
						} else
						{
							break;
						}
					}
				}
				serv(editor, AUO_EDSUB, &subdel);
				break;
			
			case NK_BS:
				serv(editor, AUO_EDGETSELECT, &sel);
				if (sel.row1 >= 0)
				{
					subdel.row1 = sel.row1;
					subdel.col1 = sel.col1;
					subdel.row2 = sel.row2;
					subdel.col2 = sel.col2;
				} else
				{
					serv(editor, AUO_EDGETPOS, &row);
					serv(editor, AUO_EDGETCURPOS, &col);
					serv(editor, AUO_EDGETLENGTH, &size);
					if (col > 0)
					{
						subdel.row1 = subdel.row2 = row;
						subdel.col2 = col;
						if (key & NKF_SHIFT)
						{
							subdel.col1 = 0;
						} else
						{
							if (key & NKF_CTRL)
							{
								serv(editor, AUO_EDGETSEPARATOR, &separator);
								gets.row = row;
								serv(editor, AUO_EDGETROW, &gets);
								col1 = col - 1;
								str = strchr(separator, gets.text[col1]);
								while (col1 >= 0 &&
									((str != NULL ? strchr(separator, gets.text[col1]) != NULL :
									 strchr(separator, gets.text[col1]) == NULL)))
								{
									col1--;
								}
								col1++;
								subdel.col1 = col1;
								
							} else
							{
								subdel.col1 = col - 1;
							}
						}
					} else
					{
						if (row > 0)
						{
							serv(editor, AUO_PREV, NULL);
							serv(editor, AUO_EDGETLENGTH, &size);
							subdel.row1 = row - 1;
							subdel.row2 = row;
							subdel.col1 = size;
							subdel.col2 = 0;
						} else
						{
							break;
						}
					}
				}
				serv(editor, AUO_EDSUB, &subdel);
				break;
			
			case NK_ENTER:
			case NK_RET:
				serv(editor, AUO_EDGETSELECT, &sel);
				if (sel.row1 >= 0)
				{
					subcr.row1 = sel.row1;
					subcr.col1 = sel.col1;
					subcr.row2 = sel.row2;
					subcr.col2 = sel.col2;
					serv(editor, AUO_EDSUB, &subcr);
				} else
				{
					serv(editor, AUO_EDGETPOS, &row);
					serv(editor, AUO_EDGETCURPOS, &col);
					subcr.row1 = subcr.row2 = row;
					subcr.col1 = subcr.col2 = col;
					serv(editor, AUO_EDSUB, &subcr);
					gets.row = row;
					serv(editor, AUO_EDGETROW, &gets);
					col1 = 0;
					while (col1 < gets.size)
					{
						if (gets.text[col1] != '\t')
							break;
						col1++;
					}
					if (col1 > 0 && col1 <= gets.size)
					{
						subins.text[0][0] = '\t';
						subins.row1 = subins.row2 = row + 1;
						inscol = 0;
						while (col1 > 0)
						{
							subins.col1 = subins.col2 = inscol;
							serv(editor, AUO_EDSUB, &subins);
							inscol++;
							col1--;
						}
					}
				}
				break;
			
			case NK_TAB:
				serv(editor, AUO_EDGETSELECT, &sel);
				subins.text[0][0] = key;
				if (sel.row1 >= 0)
				{
					subins.row1 = sel.row1;
					subins.col1 = sel.col1;
					subins.row2 = sel.row2;
					subins.col2 = sel.col2;
				} else
				{
					serv(editor, AUO_EDGETPOS, &row);
					serv(editor, AUO_EDGETCURPOS, &col);
					subins.row1 = subins.row2 = row;
					subins.col1 = subins.col2 = col;
				}
				serv(editor, AUO_EDSUB, &subins);
				break;
			
			case 'Y':
			case 'y':
				if (key & NKF_CTRL)
				{
					cutline(editor);
					break;
				}
				/* fall through */
			
			case 'X':
			case 'x':
				if (key & NKF_CTRL)
				{
					cut(editor);
					break;
				}
				/* fall through */
			
			case 'C':
			case 'c':
				if (key & NKF_CTRL)
				{
					copy(editor);
					break;
				}
				/* fall through */

			case 'V':
			case 'v':
				if (key & NKF_CTRL)
				{
					paste(editor);
					break;
				}
				/* fall through */
			
			case NK_F1:
			case NK_F2:
			case NK_F3:
			case NK_F4:
			case NK_F5:
			case NK_F6:
			case NK_F7:
			case NK_F8:
			case NK_F9:
			case NK_F10:
				{
					int16 fkey;

					fkey = (char)key - NK_F1;
					if (key & NKF_CTRL)
						fkey += 20;
					if (key & NKF_SHIFT)
						fkey += 10;
					if (editdata->fkeys[fkey] != NULL)
					{
						Auo_editor(editor, AUO_EDUNSELECT, NULL);
						put_string(self, editdata->fkeys[fkey]->text);
						Auo_editor(editor, AUO_EDVIEW, NULL);
						break;
					} else
					{
						ret = -2;
					}
				}
				break;
			
			default:
			_default:
				ret = -2;
				break;
			}
		} else
		{
			if ((unsigned char)key >= ' ')
			{
				int16 fkey;

				serv(editor, AUO_EDGETSELECT, &sel);
				subins.text[0][0] = fkey = key & 0xff;
				if (sel.row1 >= 0)
				{
					subins.row1 = sel.row1;
					subins.col1 = sel.col1;
					subins.row2 = sel.row2;
					subins.col2 = sel.col2;
				} else
				{
					serv(editor, AUO_EDGETPOS, &row);
					serv(editor, AUO_EDGETCURPOS, &col);
					subins.row1 = subins.row2 = row;
					subins.col1 = subins.col2 = col;
				}
				serv(editor, AUO_EDSUB, &subins);
				if (fkey == ']' || fkey == '}' || fkey == ')')
				{
					level = 1;
					found = 0;
					inscol = col - 1; /* BUG: col used uninitialized */
					gets.row = row;
					while (gets.row >= 0)
					{
						serv(editor, AUO_EDGETROW, &gets);
						((char *)NO_CONST(gets.text))[gets.size] = '\0'; /* WTF: should be read-only */
						col1 = gets.size > inscol ? inscol : gets.size;
						while (col1 >= 0)
						{
							switch (gets.text[col1])
							{
							case '[':
								if (fkey == ']')
								{
									if (found == 0)
										level--;
								}
								break;
							case ']':
								if (fkey == ']')
								{
									if (found == 0)
										level++;
								}
								break;
							case '{':
								if (fkey == '}')
								{
									if (found == 0)
										level--;
								}
								break;
							case '}':
								if (fkey == '}')
								{
									if (found == 0)
										level++;
								}
								break;
							case '(':
								if (fkey == ')')
								{
									if (found == 0)
										level--;
								}
								break;
							case ')':
								if (fkey == ')')
								{
									if (found == 0)
										level++;
								}
								break;
							}
							if (level == 0 && found == 0)
								break;
							col1--;
						}
						inscol = 1000;
						if (level == 0 && found == 0)
							break;
						gets.row--;
					}
					if (level == 0 && found == 0)
					{
						if (row == gets.row)
						{
							savec = gets.text[col + 1];
							((char *)NO_CONST(gets.text))[col + 1] = '\0';
						}
						strncpy(buf, &gets.text[col1 < 0 ? 0 : col1], 30);
						buf[30] = '\0';
						if (row == gets.row)
							((char *)NO_CONST(gets.text))[col + 1] = savec;
						info_string(self, buf);
					} else
					{
						info_string(self, NO_BRACKET);
					}
				}
			}
		}
		
		if (ret < -1 || --loop == 0)
			break;
		next_key(&key);
	}
	
	serv(editor, AUO_EDGETSELECT, &sel);
	if (sel.row1 < 0)
		serv(editor, AUO_EDVIEW, NULL);
	serv(editor, AUO_UPDATE, NULL);
	serv(editor, AUO_EDCURSHOW, NULL);
	dirty(self);
	
	return ret;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static void next_key(int16 *key)
{
	int16 dummy;
	int16 kstate;
	
	if (evnt_multi(MU_TIMER | MU_KEYBD,
		0, 0, 0,
		0, 0, 0, 0, 0,
		0, 0, 0, 0, 0,
		NULL,
		5, 0,
		&dummy, &dummy, &dummy, &kstate, key, &dummy) & MU_KEYBD)
		*key = nkc_gemks2n(*key, kstate);
	else
		*key = 0;
}

/* -------------------------------------------------------------------------- */

static void paste_free(void)
{
	long count = Apaste_rows;
	char **ptr = Apaste_text;
	
	while (count-- != 0)
		Ax_ifree(*ptr++);
	Ax_ifree(Apaste_text);
	Apaste_text = NULL;
	Apaste_rows = 0;
}

/* -------------------------------------------------------------------------- */

static int16 copy(OBJECT *editor)
{
	AUSERBLK *auser;
	boolean (*serv)(OBJECT *entry, int16 task, void *in_out);
	EDITGETS gets;
	EDITSEL sel;
	char **ptr;
	long count;
	
	auser = editor->ob_spec.auserblk;
	serv = auser->ub_serv;
	serv(editor, AUO_EDGETSELECT, &sel);
	if (sel.row1 >= 0)
	{
		paste_free();
		count = sel.row2 - sel.row1 + 1;
		ptr = Ax_malloc(count * sizeof(*ptr));
		if (ptr == NULL)
		{
			return FAIL;
		} else
		{
			Apaste_rows = count;
			Apaste_text = ptr;
			memset(ptr, 0, count * sizeof(*ptr));
			for (count = sel.row1; count <= sel.row2; ptr++, count++)
			{
				gets.row = count;
				serv(editor, AUO_EDGETROW, &gets);
				if (gets.size > 0)
				{
					*ptr = Ax_malloc(gets.size + 1);
					if (*ptr == NULL)
						goto error;
					strncpy(*ptr, gets.text, gets.size);
					(*ptr)[gets.size] = '\0';
				} else
				{
					*ptr = Ast_create("");
				}
			}
			return OK;
		error:
			paste_free();
		}
	}
	return FAIL;
}

/* -------------------------------------------------------------------------- */

static void paste(OBJECT *editor)
{
	AUSERBLK *auser;
	boolean (*serv)(OBJECT *entry, int16 task, void *in_out);
	EDITSUBS subs;
	long row;
	long col;
	EDITSEL sel;
	
	auser = editor->ob_spec.auserblk;
	serv = auser->ub_serv;
	if (Apaste_rows > 0)
	{
		subs.nrow = Apaste_rows;
		subs.text = Apaste_text;
		serv(editor, AUO_EDGETSELECT, &sel);
		if (sel.row1 >= 0)
		{
			subs.row1 = sel.row1;
			subs.col1 = sel.col1;
			subs.row2 = sel.row2;
			subs.col2 = sel.col2;
		} else
		{
			serv(editor, AUO_EDGETPOS, &row);
			serv(editor, AUO_EDGETCURPOS, &col);
			subs.row1 = subs.row2 = row;
			subs.col1 = subs.col2 = col;
		}
		serv(editor, AUO_EDSUB, &subs);
	}
}

/* -------------------------------------------------------------------------- */

static void cut(OBJECT *editor)
{
	AUSERBLK *auser;
	boolean (*serv)(OBJECT *entry, int16 task, void *in_out);
	EDITSEL sel;
	
	auser = editor->ob_spec.auserblk;
	serv = auser->ub_serv;
	serv(editor, AUO_EDGETSELECT, &sel);
	if (sel.row1 >= 0)
	{
		if (copy(editor) == OK)
		{
			subdel.row1 = sel.row1;
			subdel.col1 = sel.col1;
			subdel.row2 = sel.row2;
			subdel.col2 = sel.col2;
			serv(editor, AUO_EDSUB, &subdel);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void cutline(OBJECT *editor)
{
	AUSERBLK *auser;
	boolean (*serv)(OBJECT *entry, int16 task, void *in_out);
	long rows;
	long row;
	EDITGETS gets;
	long count;
	char **ptr;
	
	auser = editor->ob_spec.auserblk;
	serv = auser->ub_serv;
	serv(editor, AUO_EDUNSELECT, NULL);
	serv(editor, AUO_EDGETPOS, &row);
	serv(editor, AUO_EDGETROWS, &rows);
	paste_free();
	if (row + 1 < rows)
		count = 2;
	else
		count = 1;
	ptr = Ax_malloc(count * sizeof(*ptr));
	if (ptr != NULL)
	{
		Apaste_rows = count;
		Apaste_text = ptr;
		memset(ptr, 0, count * sizeof(*ptr));
		gets.row = row;
		serv(editor, AUO_EDGETROW, &gets);
		if (gets.size > 0)
		{
			ptr[0] = Ax_malloc(gets.size + 1);
			/* BUG: no null-pointe check */
			strncpy(ptr[0], gets.text, gets.size);
			ptr[0][gets.size] = '\0';
		} else
		{
			ptr[0] = Ast_create("");
		}
		subdel.row1 = row;
		subdel.col1 = 0;
		if (row + 1 < rows)
		{
			ptr++;
			ptr[0] = Ast_create("");
			subdel.row2 = row + 1;
			subdel.col2 = 0;
		} else
		{
			subdel.row2 = row;
			subdel.col2 = gets.size;
		}
		serv(editor, AUO_EDSUB, &subdel);
	}
}

/* -------------------------------------------------------------------------- */

static void edit_fulled(Awindow *self)
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
		edit_sized(self, normal);
		self->state &= ~AWS_FULL;
	} else
	{
		normal->x = act->x;
		normal->y = act->y;
		normal->w = act->w;
		normal->h = act->h;
		edit_sized(self, &ACSblk->desk);
		self->state |= AWS_FULL;
	}
	wind_set(self->wi_id, WF_CURRXYWH, act->x, act->y, act->w, act->h);
	Aev_mess();
}

/* -------------------------------------------------------------------------- */

static void edit_arrowed(Awindow *self, int16 pos, int16 amount)
{
	OBJECT *horslider = &self->work[EDIT_HOR_SLIDER];
	AUSERBLK *userhor = horslider->ob_spec.auserblk;
	OBJECT *verslider = &self->work[EDIT_VER_SLIDER];
	AUSERBLK *userver = verslider->ob_spec.auserblk;
	int16 count = 0;
	boolean vertical;
	int16 dummy;
	int16 button;
	
#if WITH_FIXES
	vertical = FALSE;
#endif

	do
	{
		switch (pos)
		{
		case WA_UPLINE:
			userver->ub_serv(verslider, AUO_PREV, &amount);
			vertical = TRUE;
			break;
	
		case WA_DNLINE:
			userver->ub_serv(verslider, AUO_NEXT, &amount);
			vertical = TRUE;
			break;
	
		case WA_UPPAGE:
			userver->ub_serv(verslider, AUO_PREVPAGE, &amount);
			count = 0;
			vertical = TRUE;
			break;
	
		case WA_DNPAGE:
			userver->ub_serv(verslider, AUO_NEXTPAGE, &amount);
			count = 0;
			vertical = TRUE;
			break;
	
		case WA_LFPAGE:
			userhor->ub_serv(horslider, AUO_PREVPAGE, &amount);
			count = 0;
			vertical = FALSE;
			break;
	
		case WA_RTPAGE:
			userhor->ub_serv(horslider, AUO_NEXTPAGE, &amount);
			count = 0;
			vertical = FALSE;
			break;

		case WA_LFLINE:
			userhor->ub_serv(horslider, AUO_PREV, &amount);
			vertical = FALSE;
			break;

		case WA_RTLINE:
			userhor->ub_serv(horslider, AUO_NEXT, &amount);
			vertical = FALSE;
			break;
		}
		
		if (vertical)
		{
			if (count-- == 0)
			{
				userver->ub_serv(verslider, AUO_UPDATE, NULL);
				count = 4;
			}
			userver->ub_serv(verslider, AUO_SLLIVE, NULL);
		} else
		{
			if (count-- == 0)
			{
				userhor->ub_serv(horslider, AUO_UPDATE, NULL);
				count = 4;
			}
			userhor->ub_serv(horslider, AUO_SLLIVE, NULL);
		}
		
		graf_mkstate(&dummy, &dummy, &button, &dummy);
	} while (button & 1);
	
	if (count != 4)
	{
		if (vertical)
			userver->ub_serv(verslider, AUO_UPDATE, NULL);
		else
#if WITH_FIXES
			userhor->ub_serv(horslider, AUO_UPDATE, NULL);
#else
			userhor->ub_serv(verslider, AUO_UPDATE, NULL);
#endif
	}	
}

/* -------------------------------------------------------------------------- */

static void edit_hslid(Awindow *self, int16 pos)
{
	OBJECT *slider = &self->work[EDIT_HOR_SLIDER];
	AUSERBLK *auser = slider->ob_spec.auserblk;
	
	auser->ub_serv(slider, AUO_SLWIPOS, &pos);
	auser->ub_serv(slider, AUO_UPDATE, NULL);
	auser->ub_serv(slider, AUO_SLLIVE, NULL);
}

/* -------------------------------------------------------------------------- */

static int16 edit_init(Awindow *self)
{
	EDITDATA *editdata = self->user;
	OBJECT *editor;
	char buf[50];
	long row; /* 20 */
	long col; /* 16 */
	EDITSEL sel;
	
	if (!(editdata->cnf.flags & EDCONF_USERTOOLBAR))
	{
		self->state |= AWS_LATEUPDATE;
		if (!(self->state & AWS_ICONIZED))
		{
			--editdata->counter;
			if (editdata->counter <= 0)
			{
				editor = &self->work[EDIT_EDITOR];
				Auo_editor(editor, AUO_EDGETPOS, &row);
				Auo_editor(editor, AUO_EDGETVCURPOS, &col);
				Auo_editor(editor, AUO_EDGETSELECT, &sel);
				if (sel.row1 >= 0)
				{
					sprintf(buf, " %2ld,%2ld / %2ld,%2ld", sel.col1 + 1, sel.row1 + 1, sel.col2 + 1, sel.row2 + 1);
					info_string(self, buf);
					editdata->oldc = -1;
				} else
				{
					if (editdata->oldc != col || editdata->oldr != row)
					{
						sprintf(buf, " %2ld,%2ld", col + 1, row + 1);
						info_string(self, buf);
						editdata->oldc = col;
						editdata->oldr = row;
					}
				}
			}
		}
	}
	return OK;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static Awindow *edit_make(void *a)
{
	EDITDATA *editdata;
	Awindow *self;
	OBJECT *editor;
	EDCONF conf;
	FKeyLine fkey;
	int32 id;
	Awiob ob;
	long wrap;
	long columns;
	int16 wx;
	int16 dummy;
	long fd;
	long i;
	
	wrap = 999999999L;
	columns = 256;
	if ((editdata = Ax_malloc(sizeof(*editdata))) == NULL)
		return NULL;
	memcpy(editdata, &proto, sizeof(*editdata));
	memset(proto.fkeys, 0, 11 * sizeof(proto.fkeys[0])); /* FIXME: nonsense */
	EDITOR.work = &edit.root;
	self = Awi_create(&EDITOR);
	if (self == NULL)
	{
		Ax_free(editdata);
		return NULL;
	}
	wind_calc(WC_WORK, self->wi_kind, 0, 0, 0, 0, &wx, &dummy, &dummy, &dummy);
	self->wi_act.x = ((self->wi_act.x + 8) & -16) - wx;
	self->user = editdata;
	if (editors == 0)
	{
		if ((fd = Fopen(Af_cfgfile("EDITOR"), FO_READ)) > 0)
		{
			if (Fread((int)fd, sizeof(id), &id) == sizeof(id) &&
				id == EDCONF_MAGIC &&
				Fseek(0, (int)fd, SEEK_SET) == 0 &&
				Fread((int)fd, sizeof(conf), &conf) == sizeof(conf))
			{
				memcpy(&protocnf, &conf, sizeof(protocnf));
				if (Fread((int)fd, sizeof(id), &id) == sizeof(id))
				{
					for (i = 0; i < id; i++)
					{
						if (Fread((int)fd, sizeof(fkey), &fkey) != sizeof(fkey))
							break;
						i = (char)fkey.key - NK_F1;
						if (fkey.key & NKF_CTRL)
							i += 20;
						if (fkey.key & NKF_SHIFT)
							i += 10;
						if ((proto.fkeys[i] = editdata->fkeys[i] = Ax_malloc(sizeof(fkey))) == NULL)
							break;
						memcpy(editdata->fkeys[i], &fkey, sizeof(fkey));
					}
				}
			}
			Fclose((int)fd);
		}
		
		if (protocnf.separator[0] == '\0')
		{
			strcpy(protocnf.separator, ACSblk->separator);
		}
	} else
	{
		for (i = 0; i < NUM_FKEYS; i++)
		{
			if (proto.fkeys[i] != NULL)
			{
				if ((editdata->fkeys[i] = Ax_malloc(sizeof(fkey))) == NULL)
					break;
				/* BUG: fkey not initialized here */
				memcpy(editdata->fkeys[i], &fkey, sizeof(fkey));
			}
		}
	}
	
	protocnf.flags &= 0x7f;
	memcpy(&editdata->cnf, &protocnf, sizeof(editdata->cnf));
	
	if (EDITOR.toolbar != &_ED_TOOL.root)
		editdata->cnf.flags |= EDCONF_USERTOOLBAR;
	self->kind |= AW_UVSLIDER | AW_UHSLIDER;
	self->work[EDIT_SELECT].ob_width = self->work[EDIT_SELECT].ob_height = 0;
	editor = &self->work[EDIT_EDITOR];
	if (editdata->cnf.w == 0 ||
		editdata->cnf.w > ACSblk->desk.w ||
		editdata->cnf.h > ACSblk->desk.h)
	{
		editor->ob_width = ACSblk->desk.w - (ACSblk->desk.w >> 2);
		editor->ob_height = ACSblk->desk.h - (ACSblk->desk.h >> 2);
	} else
	{
		editor->ob_width = editdata->cnf.w;
		editor->ob_height = editdata->cnf.h;
	}
	
	Auo_editor(editor, AUO_EDCFULL, &columns);
	Auo_editor(editor, AUO_EDSETSEPARATOR, editdata->cnf.separator);
	Auo_editor(editor, AUO_EDCURSOR, &editdata->cnf.cursor);
	Auo_editor(editor, AUO_EDFONT, &editdata->cnf.fontid);
	Auo_editor(editor, AUO_EDHEIGHT, &editdata->cnf.height);
	Auo_editor(editor, AUO_EDRESIZE, NULL);
	
	ob.window = self;
	ob.entry = &self->work[EDIT_HOR_SLIDER];
	ob.obnr = EDIT_HOR_SLIDER;
	Auo_editor(editor, AUO_EDHORSLIDER, &ob);
	ob.entry = &self->work[EDIT_VER_SLIDER];
	ob.obnr = EDIT_VER_SLIDER;
	Auo_editor(editor, AUO_EDVERSLIDER, &ob);
	Auo_editor(editor, AUO_EDWRAP, &wrap);
	Auo_editor(editor, AUO_EDCHARSELECT, NULL);
	Auo_editor(editor, AUO_EDCURON, NULL);
	Auo_editor(editor, AUO_EDCURSHOW, NULL);
	Auo_editor(editor, AUO_EDTABSIZE, &editdata->cnf.tab);
	Auo_editor(editor, AUO_FULLUPDATE, NULL);
	
	++editors;
	set_icon(self);
	undirty(self);
	
	return self;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static void term(Awindow *self)
{
	EDITDATA *editdata;
	Awindow *control;
	
	if (!(self->state & AWS_INTERM))
	{
		editdata = self->user;
		if (editdata->cnf.flags & EDCONF_DIRTY)
		{
			if (ACSblk->appexit)
			{
				if (alert_str(WARN_SAVED, editdata->ic_name) == 1)
				{
					self->state |= AWS_INTERM;
					ed_save(self);
				}
			} else
			{
				switch (alert_str(WARN_2SAVED, editdata->ic_name))
				{
				case 1:
					self->state |= AWS_INTERM;
					ed_save(self);
					break;
				case 3:
					return;
				default:
					break;
				}
			}
		}
		self->state |= AWS_INTERM;
		if (editdata->wifkeys != NULL)
		{
			(void)editdata->wifkeys; /* possibly code ifdef out */
		}
		if ((control = editdata->control) != NULL)
			control->service(control, AS_EDTERM, self);
		--editors;
		Ax_free(editdata);
		Awi_delete(self);
	}
}

/* -------------------------------------------------------------------------- */

static void set_title(Awindow *self, const char *title)
{
	char *name;
	
	name = self->name;
	if ((self->name = Ast_create(title)) == NULL)
	{
		self->name = name;
	} else
	{
		Ast_delete(name);
		if (self->wi_id > 0)
			wind_set(self->wi_id, WF_NAME, self->name, 0, 0);
	}
}

/* -------------------------------------------------------------------------- */

static void get_all(OBJECT *editor, void *buf)
{
	char *ptr;
	EDITGETS gets;
	long rows;
	
	Auo_editor(editor, AUO_EDCURHIDE, NULL);
	Auo_editor(editor, AUO_EDUNSELECT, NULL);
	Auo_editor(editor, AUO_EDCURSHOW, NULL);
	Auo_editor(editor, AUO_EDGETROWS, &rows);
	ptr = buf;
	for (gets.row = 0; gets.row < rows; gets.row++)
	{
		Auo_editor(editor, AUO_EDGETROW, &gets);
		if (gets.size > 0)
			strncpy(ptr, gets.text, gets.size);
		ptr += gets.size;
		if (gets.row != rows - 1)
		{
			*ptr++ = '\r';
			*ptr++ = '\n';
		}
	}
	*ptr = '\0';
}

/* -------------------------------------------------------------------------- */

static void put_string(Awindow *self, const char *str)
{
	ssize_t len;
	
	len = strlen(str);
	while (len > BUFFER_SIZE)
	{
		memcpy(buffer, str, BUFFER_SIZE);
		put_block(&self->work[EDIT_EDITOR], buffer, BUFFER_SIZE);
		len -= BUFFER_SIZE;
		str += BUFFER_SIZE;
	}
	memcpy(buffer, str, len);
	put_block(&self->work[EDIT_EDITOR], buffer, len);
}

/* -------------------------------------------------------------------------- */

static boolean edit_service(Awindow *self, int16 task, void *in_out)
{
	EDITDATA *editdata = self->user;
	char *filename;
	Awindow *win;
	
	switch (task)
	{
	case AS_TERM:
		term(self);
		break;
	
	case AS_EDICONTEXT:
		if (in_out != NULL)
		{
			editdata->icontext[0] = '\0';
			strncat(editdata->icontext, in_out, sizeof(editdata->icontext) - 1);
		} else
		{
			editdata->icontext[0] = '\0';
		}
		set_icon(self);
		break;
	
	case AS_EDWINDOW:
		editdata->control = in_out;
		break;
	
	case AS_EDGETENTRY:
		*((OBJECT **)in_out) = &self->work[EDIT_EDITOR];
		break;
	
	case AS_EDGETSTRING:
		get_all(&self->work[EDIT_EDITOR], in_out);
		break;
	
	case AS_EDGETNEED:
		Auo_editor(&self->work[EDIT_EDITOR], AUO_EDGETNEED, in_out);
		break;
	
	case AS_EDPUTSTRING:
		put_string(self, in_out);
		break;
	
	case AS_EDHOME:
		home(&self->work[EDIT_EDITOR]);
		break;
	
	case AS_EDCLEAN:
		undirty(self);
		break;
	
	case AS_EDTITLE:
#if WITH_FIXES
		strncpy(editdata->normal_format, in_out, sizeof(editdata->normal_format) - 1);
#else
		strncpy(editdata->normal_format, in_out, sizeof(editdata->normal_format));
#endif
		editdata->normal_format[sizeof(editdata->normal_format) - 1] = '\0';
		if (!(editdata->cnf.flags & EDCONF_DIRTY))
			set_title(self, editdata->normal_format); /* BUG: that will set the format as title */
		break;
		
	case AS_EDTITLEDIRTY:
#if WITH_FIXES
		strncpy(editdata->changed_format, in_out, sizeof(editdata->changed_format) - 1);
#else
		strncpy(editdata->changed_format, in_out, sizeof(editdata->changed_format));
#endif
		editdata->changed_format[sizeof(editdata->changed_format) - 1] = '\0';
		if (editdata->cnf.flags & EDCONF_DIRTY)
			set_title(self, editdata->changed_format); /* BUG: that will set the format as title */
		break;
	
	case AS_EDEXT:
#if WITH_FIXES
		strncpy(editdata->cnf.ext, in_out, sizeof(editdata->cnf.ext) - 1);
#else
		strncpy(editdata->cnf.ext, in_out, sizeof(editdata->cnf.ext));
#endif
		editdata->cnf.ext[sizeof(editdata->cnf.ext) - 1] = '\0';
		break;
	
	case AS_EDLOADFILE:
		if (in_out == NULL)
		{
			filename = Af_select(editdata->open_title, editdata->cnf.filename, editdata->cnf.ext);
			if (filename != NULL)
				open_file(self, filename);
		} else
		{
			open_file(self, in_out);
		}
		break;
	
	case AS_EDSAVEIT:
		ed_save(self);
		break;
	
	case AS_INFO:
		win = &WIED_INFOBOX;
		Awi_doform(win, win);
		break;
	
	case AS_EDGETFNAME:
		strcpy(in_out, editdata->cnf.filename);
		break;
		
	case AS_CHECKDRAGGED:
		break;
	
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void edit_moved(Awindow *self, Axywh *area)
{
	int16 wx;
	int16 dummy;
	
	wind_calc(WC_WORK, self->wi_kind, 0, 0, 0, 0, &wx, &dummy, &dummy, &dummy);
	area->x = ((area->x + 8) & -16) - wx;
	Awi_moved(self, area);
}

/* -------------------------------------------------------------------------- */

static void edit_sized(Awindow *self, Axywh *area)
{
	int16 wx;
	int16 wy;
	OBJECT *tree;
	OBJECT *menu;
	
	tree = self->work;
	menu = self->menu;
	wind_calc(WC_WORK, self->wi_kind, 0, 0, area->w, area->h, &wx, &wy, &tree->ob_width, &tree->ob_height);
	area->x = ((area->x + 8) & -16) - wx;
	if (menu != NULL)
		tree->ob_height -= menu[menu[ROOT].ob_head].ob_height;
	if (self->toolbar != NULL)
		tree->ob_height -= self->toolbar->ob_height;
	Auo_editor(&tree[EDIT_EDITOR], AUO_EDRESIZE, NULL);
	Auo_editor(&tree[EDIT_EDITOR], AUO_EDSLIDERS, NULL);
	Awi_sized(self, area);
}

/* -------------------------------------------------------------------------- */

static void edit_vslid(Awindow *self, int16 pos)
{
	OBJECT *slider = &self->work[EDIT_VER_SLIDER];
	AUSERBLK *auser = slider->ob_spec.auserblk;
	
	auser->ub_serv(slider, AUO_SLWIPOS, &pos);
	auser->ub_serv(slider, AUO_UPDATE, NULL);
	auser->ub_serv(slider, AUO_SLLIVE, NULL);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void Aed_copy(void)
{
	edit_key(ACSblk->ev_window, 0, NKF_FUNC | NKF_CTRL | 'c');
}

/* -------------------------------------------------------------------------- */

void Aed_cut(void)
{
	edit_key(ACSblk->ev_window, 0, NKF_FUNC | NKF_CTRL | 'x');
}

/* -------------------------------------------------------------------------- */

void Aed_cutline(void)
{
	edit_key(ACSblk->ev_window, 0, NKF_FUNC | NKF_CTRL | 'y');
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void find_next(Awindow *self)
{
	OBJECT *editor = &self->work[EDIT_EDITOR];
	EDITDATA *editdata = self->user;
	char *find_string = editdata->cnf.find_string;
	EDITSEL sel;
	EDITSEL newsel;
	
	if (*find_string != '\0')
	{
		if (editdata->cnf.flags & EDCONF_FIND_BACKWARD)
			Auo_editor(editor, AUO_EDBACKWARD, NULL);
		else
			Auo_editor(editor, AUO_EDFORWARD, NULL);
		if (editdata->cnf.flags & EDCONF_FIND_NOCASE)
			Auo_editor(editor, AUO_EDNOCASE, NULL);
		else
			Auo_editor(editor, AUO_EDCASE, NULL);
		if (editdata->cnf.flags & EDCONF_FIND_WORD)
			Auo_editor(editor, AUO_EDWORD, NULL);
		else
			Auo_editor(editor, AUO_EDNOWORD, NULL);

		Auo_editor(editor, AUO_EDCURHIDE, NULL);
		Auo_editor(editor, AUO_EDGETSELECT, &sel);
		Auo_editor(editor, AUO_EDFIND, find_string);
		Auo_editor(editor, AUO_EDGETSELECT, &newsel);
		if (newsel.row1 < 0 ||
			(sel.row1 == newsel.row1 &&
			 sel.col1 == newsel.col1 &&
			 sel.row2 == newsel.row2 &&
			 sel.col2 == newsel.col2))
		{
			editdata->cnf.flags ^= EDCONF_FIND_BACKWARD;
		} else
		{
			Auo_editor(editor, AUO_EDVIEW, NULL);
			Auo_editor(editor, AUO_UPDATE, NULL);
		}
		Auo_editor(editor, AUO_EDCURSHOW, NULL);
	}
}

/* -------------------------------------------------------------------------- */

void Aed_find(void)
{
	Awindow *self = ACSblk->ev_window;
	EDITDATA *editdata = self->user;
	Awindow *win;
	
	win = WIED_FIND.create(&WIED_FIND);
	if (win != NULL)
	{
		Aob_puttext(win->work, ED_FIND_FIND_STRING, editdata->cnf.find_string);
		set_select(&win->work[ED_FIND_WORD], editdata->cnf.flags & EDCONF_FIND_WORD);
		set_select(&win->work[ED_FIND_BACKWARD], editdata->cnf.flags & EDCONF_FIND_BACKWARD);
		set_select(&win->work[ED_FIND_NOCASE], editdata->cnf.flags & EDCONF_FIND_NOCASE);
		if (Awi_dialog(win) == ED_FIND_OK &&
			Aob_gettext(win->work, ED_FIND_FIND_STRING, editdata->cnf.find_string))
		{
			strcpy(protocnf.find_string, editdata->cnf.find_string);
			editdata->cnf.flags &= ~(EDCONF_FIND_WORD | EDCONF_FIND_BACKWARD | EDCONF_FIND_NOCASE);
			if (win->work[ED_FIND_WORD].ob_state & OS_SELECTED)
				editdata->cnf.flags |= EDCONF_FIND_WORD;
			if (win->work[ED_FIND_BACKWARD].ob_state & OS_SELECTED)
				editdata->cnf.flags |= EDCONF_FIND_BACKWARD;
			if (win->work[ED_FIND_NOCASE].ob_state & OS_SELECTED)
				editdata->cnf.flags |= EDCONF_FIND_NOCASE;
			protocnf.flags = editdata->cnf.flags;
			find_next(self);
		}
		Awi_delete(win);
	}
}

/* -------------------------------------------------------------------------- */

void Aed_findnext(void)
{
	find_next(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

void Aed_findsel(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *editor = &self->work[EDIT_EDITOR];
	EDITDATA *editdata = self->user;
	EDITGETS gets;
	EDITSEL sel;
	long len;
	
	Auo_editor(editor, AUO_EDGETSELECT, &sel);
	if (sel.row1 < 0)
	{
		Auo_editor(editor, AUO_EDCURHIDE, NULL);
		Auo_editor(editor, AUO_EDSELECTWORD, NULL);
		Auo_editor(editor, AUO_EDCURSHOW, NULL);
	} else
	{
		gets.row = sel.row1;
		Auo_editor(editor, AUO_EDGETROW, &gets);
		len = sizeof(editdata->cnf.find_string) - 1;
		if (gets.size > 0)
		{
			if (gets.size < len)
				len = gets.size;
			strncpy(editdata->cnf.find_string, gets.text, len);
			editdata->cnf.find_string[len] = '\0';
			find_next(self);
		}
	}
}

/* -------------------------------------------------------------------------- */

void Aed_font(void)
{
	Awindow *self = ACSblk->ev_window;
	EDITDATA *editdata = self->user;
	OBJECT *editor;
	boolean changed = FALSE;
	xFSL *xfsl;
	int16 dummy;
	int16 kstate;
	int16 fontid;
	int16 height;
	int16 sel;
	
	graf_mkstate(&dummy, &dummy, &dummy, &kstate);
	if (!(kstate & K_SHIFT) && Ash_getcookie(C_xFSL, &xfsl))
	{
		fontid = editdata->cnf.fontid;
		height = editdata->cnf.height;
		sel = xfsl->xfsl_input(0, 0xfb, FONTS, &fontid, &height);
		if (sel >= 0)
		{
			changed = TRUE;
			editdata->cnf.fontid = fontid;
			vst_font(ACSblk->vdi_handle, fontid);
			vst_point(ACSblk->vdi_handle, height, &dummy, &editdata->cnf.height, &dummy, &dummy);
		}
		sel--;
	}
	if (!changed)
	{
		sel = A_fontsel(&editdata->cnf.fontid, &editdata->cnf.height, FALSE);
	}
	if (sel == OK)
	{
		protocnf.fontid = editdata->cnf.fontid;
		protocnf.height = editdata->cnf.height;
		editor = &self->work[EDIT_EDITOR];
		Auo_editor(editor, AUO_EDCURHIDE, NULL);
		Auo_editor(editor, AUO_EDVIEW, NULL);
		Auo_editor(editor, AUO_EDFONT, &editdata->cnf.fontid);
		Auo_editor(editor, AUO_EDHEIGHT, &editdata->cnf.height);
		Auo_editor(editor, AUO_EDRESIZE, NULL);
		Auo_editor(editor, AUO_EDSLIDERS, NULL);
		Auo_editor(editor, AUO_EDCURSHOW, NULL);
		self->state |= AWS_FORCEREDRAW;
		Awi_sized(self, &self->wi_act);
	}
}

/* -------------------------------------------------------------------------- */

void Aed_gotoline(void)
{
	Awindow *win;
	Awindow *self;
	OBJECT *editor;
	long row;
	
	if ((win = WIED_GOTOLINE.create(&WIED_GOTOLINE)) != NULL)
	{
		self = ACSblk->ev_window;
		editor = &self->work[EDIT_EDITOR];
		Auo_editor(editor, AUO_EDGETPOS, &row);
		Aob_printf(win->work, ED_GOTOLINE_LINENO, "%ld", row + 1);
		if (Awi_dialog(win) == ED_GOTOLINE_OK)
		{
			Aob_scanf(win->work, ED_GOTOLINE_LINENO, "%ld", &row);
			if (row > 0)
				--row;
			Auo_editor(editor, AUO_EDCURHIDE, NULL);
			Auo_editor(editor, AUO_EDUNSELECT, NULL);
			Auo_editor(editor, AUO_POS, &row);
			Auo_editor(editor, AUO_EDVIEW, NULL);
			Auo_editor(editor, AUO_UPDATE, NULL);
			Auo_editor(editor, AUO_EDCURSHOW, NULL);
		}
		Awi_delete(win);
	}
}

/* -------------------------------------------------------------------------- */

void Aed_info(void)
{
	Awindow *win;
	OBJECT *editor;
	EDITSEL sel;
	EDITGETS gets;
	long size;
	long rows;
	long row1;
	long row2;
	long row;
	
	if ((win = WIED_INFO.create(&WIED_INFO)) != NULL)
	{
		editor = &ACSblk->ev_window->work[EDIT_EDITOR];
		Auo_editor(editor, AUO_EDGETSELECT, &sel);
		if (sel.row1 < 0)
		{
			Auo_editor(editor, AUO_EDGETROWS, &rows);
			Auo_editor(editor, AUO_EDGETNEED, &size);
		} else
		{
			row1 = sel.row1;
			row2 = sel.row2;
			rows = row2 - row1 + 1;
			for (size = -2, row = row1; row <= row2; row++)
			{
				gets.row = row;
				Auo_editor(editor, AUO_EDGETROW, &gets);
				size += gets.size + 2;
			}
		}
		Aob_printf(win->work, ED_INFO_ROWS, "%ld", rows);
		Aob_printf(win->work, ED_INFO_SIZE, "%ld", size);
		Awi_dialog(win);
		Awi_delete(win);
	}
}

/* -------------------------------------------------------------------------- */

static void put_block(OBJECT *editor, char *str, ssize_t len)
{
	EDITSUBS subs;
	char **text;
	long lines;
	char **ptr;
	char *strptr;
	long row;
	long col;
	
	if (len <= 0)
		return;
	str[len] = '\0';
	text = Ax_malloc(len * sizeof(*text));
	if (text == NULL)
		return;
	subs.text = text;
	lines = 1;
	strptr = str;
	ptr = text;
	*ptr++ = strptr;
	while (len > 0)
	{
		for (;;)
		{
			if (*strptr == '\r')
			{
				*strptr = '\0';
				if (len <= 1 || strptr[1] == '\n')
					goto nextchar;
				*strptr++ = '\0';
				lines++;
				*ptr++ = strptr;
				len--;
				break;
			} else if (*strptr == '\n')
			{
				*strptr++ = '\0';
				lines++;
				*ptr++ = strptr;
				len--;
				break;
			} else
			{
			nextchar:
				strptr++;
				len--;
				if (len > 0)
					continue;
			}
			break;
		}
	}
	Auo_editor(editor, AUO_EDGETCURPOS, &col);
	Auo_editor(editor, AUO_EDGETPOS, &row);
	subs.row1 = subs.row2 = row;
	subs.col1 = subs.col2 = col;
	subs.nrow = lines;
	Auo_editor(editor, AUO_EDSUB, &subs);
	Ax_ifree(text);
}

/* -------------------------------------------------------------------------- */

static void merge(OBJECT *editor, long fd)
{
	ssize_t len;
	
	Auo_editor(editor, AUO_EDCHARSELECT, NULL);
	for (;;)
	{
		len = Fread((int)fd, BUFFER_SIZE, buffer);
		if (len <= 0)
			break;
		put_block(editor, buffer, len);
	}
	Fclose((int)fd);
}

/* -------------------------------------------------------------------------- */

static void open_file(Awindow *self, const char *filename)
{
	EDITDATA *editdata = self->user;
	OBJECT *editor = &self->work[EDIT_EDITOR];
	long fd;
	
	fd = Fopen(filename, FO_READ);
	Auo_editor(editor, AUO_EDCURHIDE, NULL);
	Auo_editor(editor, AUO_EDDELETE, NULL);
	if (fd > 0)
	{
		merge(editor, fd);
	} else
	{
		info_string(self, NEW_FILE);
	}
	Auo_editor(editor, AUO_FULLUPDATE, NULL);
	Auo_editor(editor, AUO_EDCURSHOW, NULL);
	home(editor);
	strcpy(editdata->cnf.filename, filename);
	set_icon(self);
	undirty(self);
}

/* -------------------------------------------------------------------------- */

void Aed_open(void)
{
	Awindow *self = ACSblk->ev_window;
	EDITDATA *editdata = self->user;
	char *filename;
	
	if (editdata->cnf.flags & EDCONF_DIRTY)
	{
		switch (alert_str(WARN_2SAVED, editdata->ic_name))
		{
		case 1:
			editdata->cnf.flags |= EDCONF_SAVEOK;
			ed_save(self);
			editdata->cnf.flags &= ~EDCONF_SAVEOK;
			break;
		case 3:
			return;
		}
	}
	if ((filename = Af_select(editdata->open_title, editdata->cnf.filename, editdata->cnf.ext)) != NULL)
		open_file(self, filename);
}

/* -------------------------------------------------------------------------- */

static void merge_it(Awindow *self, const char *filename)
{
	long fd;
	OBJECT *editor;
	EDITSEL sel;
	
	if ((fd = Fopen(filename, FO_READ)) >= 0)
	{
		editor = &self->work[EDIT_EDITOR];
		Auo_editor(editor, AUO_EDCURHIDE, NULL);
		Auo_editor(editor, AUO_EDUNSELECT, NULL);
		Auo_editor(editor, AUO_EDGETPOS, &sel.row1);
		Auo_editor(editor, AUO_EDGETCURPOS, &sel.col1);
		merge(editor, fd);
		Auo_editor(editor, AUO_EDVIEW, NULL);
		Auo_editor(editor, AUO_UPDATE, NULL);
		Auo_editor(editor, AUO_EDGETPOS, &sel.row2);
		Auo_editor(editor, AUO_EDGETCURPOS, &sel.col2);
		Auo_editor(editor, AUO_EDSETSELECT, &sel);
		Auo_editor(editor, AUO_EDCURSHOW, NULL);
		dirty(self);
	}
}

/* -------------------------------------------------------------------------- */

void Aed_merge(void)
{
	Awindow *self = ACSblk->ev_window;
	EDITDATA *editdata = self->user;
	char *filename;
	
	if ((filename = Af_select(editdata->open_title, editdata->cnf.filename, editdata->cnf.ext)) != NULL)
		merge_it(self, filename);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void Aed_paste(void)
{
	edit_key(ACSblk->ev_window, 0, NKF_FUNC | NKF_CTRL | 'v');
}

/* -------------------------------------------------------------------------- */

void Aed_quit(void)
{
	term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void replace_next(Awindow *self)
{
	OBJECT *editor = &self->work[EDIT_EDITOR];
	EDITDATA *editdata = self->user;
	char *find_string = editdata->cnf.replace_search;
	char *replace_by;
	EDITSEL sel;
	EDITSEL newsel;
	EDITSUBS subs;
	
	if (*find_string != '\0')
	{
		if (editdata->cnf.flags & EDCONF_REPLACE_BACKWARD)
			Auo_editor(editor, AUO_EDBACKWARD, NULL);
		else
			Auo_editor(editor, AUO_EDFORWARD, NULL);
		if (editdata->cnf.flags & EDCONF_REPLACE_NOCASE)
			Auo_editor(editor, AUO_EDNOCASE, NULL);
		else
			Auo_editor(editor, AUO_EDCASE, NULL);
		if (editdata->cnf.flags & EDCONF_REPLACE_WORD)
			Auo_editor(editor, AUO_EDWORD, NULL);
		else
			Auo_editor(editor, AUO_EDNOWORD, NULL);

		Auo_editor(editor, AUO_EDCURHIDE, NULL);
		Auo_editor(editor, AUO_EDGETSELECT, &sel);
		do
		{
			if (sel.row1 >= 0 && (editdata->cnf.flags & EDCONF_REPLACE_BACKWARD))
			{
				Auo_editor(editor, AUO_EDUNSELECT, NULL);
				Auo_editor(editor, AUO_POS, &sel.row1);
				Auo_editor(editor, AUO_EDCURPOS, &sel.col1);
			}
			Auo_editor(editor, AUO_EDFIND, find_string);
			Auo_editor(editor, AUO_EDGETSELECT, &newsel);
			if (newsel.row1 < 0 ||
				(sel.row1 == newsel.row1 &&
				 sel.col1 == newsel.col1 &&
				 sel.row2 == newsel.row2 &&
				 sel.col2 == newsel.col2))
			{
				editdata->cnf.flags ^= EDCONF_REPLACE_BACKWARD;
				break;
			} else
			{
				subs.row1 = newsel.row1;
				subs.col1 = newsel.col1;
				subs.row2 = newsel.row2;
				subs.col2 = newsel.col2;
				subs.nrow = 1;
				replace_by = editdata->cnf.replace_by;
				subs.text = &replace_by;
				Auo_editor(editor, AUO_EDSUB, &subs);
				Auo_editor(editor, AUO_EDGETPOS, &newsel.row2);
				Auo_editor(editor, AUO_EDGETCURPOS, &newsel.col2);
				Auo_editor(editor, AUO_UPDATE, NULL);
				memcpy(&sel, &newsel, sizeof(sel));
			}
		} while (editdata->cnf.flags & EDCONF_REPLACE_ALL);
		Auo_editor(editor, AUO_EDVIEW, NULL);
		Auo_editor(editor, AUO_UPDATE, NULL);
		if (sel.row1 >= 0)
			Auo_editor(editor, AUO_EDSETSELECT, &sel);
		Auo_editor(editor, AUO_EDCURSHOW, NULL);
		dirty(self);
	}
}

/* -------------------------------------------------------------------------- */

void Aed_replace(void)
{
	Awindow *self = ACSblk->ev_window;
	EDITDATA *editdata = self->user;
	Awindow *win;
	
	if ((win = WIED_REPLACE.create(&WIED_REPLACE)) != NULL)
	{
		Aob_puttext(win->work, ED_REPLACE_FIND_STRING, editdata->cnf.replace_search);
		Aob_puttext(win->work, ED_REPLACE_REPLACE_BY, editdata->cnf.replace_by);
		set_select(&win->work[ED_REPLACE_WORD], editdata->cnf.flags & EDCONF_REPLACE_WORD);
		set_select(&win->work[ED_REPLACE_BACKWARD], editdata->cnf.flags & EDCONF_REPLACE_BACKWARD);
		set_select(&win->work[ED_REPLACE_NOCASE], editdata->cnf.flags & EDCONF_REPLACE_NOCASE);
		set_select(&win->work[ED_REPLACE_ALL], editdata->cnf.flags & EDCONF_REPLACE_ALL);
		if (Awi_dialog(win) == ED_REPLACE_OK)
		{
			Aob_gettext(win->work, ED_REPLACE_FIND_STRING, editdata->cnf.replace_search);
			Aob_gettext(win->work, ED_REPLACE_REPLACE_BY, editdata->cnf.replace_by);
			strcpy(protocnf.replace_search, editdata->cnf.replace_search);
			strcpy(protocnf.replace_by, editdata->cnf.replace_by);
			editdata->cnf.flags &= ~(EDCONF_REPLACE_WORD | EDCONF_REPLACE_BACKWARD | EDCONF_REPLACE_NOCASE | EDCONF_REPLACE_ALL);
			if (win->work[ED_REPLACE_WORD].ob_state & OS_SELECTED)
				editdata->cnf.flags |= EDCONF_REPLACE_WORD;
			if (win->work[ED_REPLACE_BACKWARD].ob_state & OS_SELECTED)
				editdata->cnf.flags |= EDCONF_REPLACE_BACKWARD;
			if (win->work[ED_REPLACE_NOCASE].ob_state & OS_SELECTED)
				editdata->cnf.flags |= EDCONF_REPLACE_NOCASE;
			if (win->work[ED_REPLACE_ALL].ob_state & OS_SELECTED)
				editdata->cnf.flags |= EDCONF_REPLACE_ALL;
			protocnf.flags = editdata->cnf.flags;
			replace_next(self);
		}
		Awi_delete(win);
	}
}

/* -------------------------------------------------------------------------- */

void Aed_replacenext(void)
{
	replace_next(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static int16 save_text(OBJECT *editor, long fd)
{
	char *ptr;
	ssize_t len;
	EDITSEL sel;
	long row;
	long end;
	EDITGETS gets;
	ssize_t size;
	ssize_t written;
	
	ptr = buffer;
	len = 0;
	Auo_editor(editor, AUO_EDGETSELECT, &sel);
	if (sel.row1 > 0) /* BUG: should be >= */
	{
		row = sel.row1;
		end = sel.row2;
	} else
	{
		Auo_editor(editor, AUO_EDGETROWS, &end);
		--end;
		row = 0;
	}
	gets.row = row;
	while (gets.row <= end)
	{
		Auo_editor(editor, AUO_EDGETROW, &gets);
		if (gets.row == end)
			size = gets.size;
		else
			size = gets.size + 2;
		if (len + size >= BUFFER_SIZE)
		{
			written = Fwrite((int)fd, len, buffer);
			if (written != len)
			{
				ACSblk->ACSerror(AE_WRITE_IO, NULL);
				Fclose(fd);
				return FAIL;
			}
			ptr = buffer;
			len = 0;
		}
		len += size;
		if (gets.size > 0)
			strncpy(ptr, gets.text, gets.size);
		ptr = &buffer[len];
		if (gets.row != end)
			strcpy(ptr - 2, "\r\n");
		gets.row++;
	}
	
	if (len > 0)
	{
		written = Fwrite(fd, len, buffer);
		if (written != len)
		{
			ACSblk->ACSerror(AE_WRITE_IO, NULL);
			Fclose(fd);
			return FAIL;
		}
	}
	Fclose(fd);
	return OK;
}

/* -------------------------------------------------------------------------- */

static void save_it(OBJECT *editor, const char *filename)
{
	char path[__PS__ * 2];
	char *dot;
	long err;
	long fd;
	
	strcpy(path, filename);
	dot = strrchr(path, '.');
	if (dot == NULL)
		strcat(path, ".$$$");
	else
		strcpy(dot, ".$$$");
	err = Frename(0, filename, path);
	fd = Fcreate(filename, 0);
	if (fd >= 0)
	{
		if (save_text(editor, fd) != OK)
		{
			Fdelete(filename);
			(void) Frename(0, path, filename);
		} else
		{
			if (err == 0)
				Fdelete(path);
		}
		Aev_OlgaUpdate(filename);
		Aev_DhstSaved(filename);
	} else
	{
		(void) Frename(0, path, filename);
	}
}

/* -------------------------------------------------------------------------- */

static void ed_save(Awindow *self)
{
	EDITDATA *editdata = self->user;
	Awindow *control = editdata->control;
	char *filename;
	OBJECT *editor;
	
	if (control == NULL ||
		(editdata->cnf.flags & EDCONF_SAVEOK) ||
		control->service(control, AS_EDSAVE, self) != TRUE)
	{
		filename = editdata->cnf.filename;
		if (*filename == '\0')
		{
			ed_saveas(self);
		} else
		{
			editor = &self->work[EDIT_EDITOR];
			Auo_editor(editor, AUO_EDCURHIDE, NULL);
			Auo_editor(editor, AUO_EDUNSELECT, NULL);
			Auo_editor(editor, AUO_EDCURSHOW, NULL);
			save_it(editor, filename);
			undirty(self);
		}
	}
}

/* -------------------------------------------------------------------------- */

void Aed_save(void)
{
	ed_save(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void ed_saveas(Awindow *self)
{
	OBJECT *editor = &self->work[EDIT_EDITOR];
	EDITDATA *editdata;
	EDITSEL sel;
	boolean selonly;
	char *filename;
	
	Auo_editor(editor, AUO_EDGETSELECT, &sel);
	selonly = FALSE;
	if (sel.row1 >= 0)
	{
		if (Awi_alert(1, ASK_SELECT) == 2)
		{
			Auo_editor(editor, AUO_EDCURHIDE, NULL);
			Auo_editor(editor, AUO_EDUNSELECT, NULL);
			Auo_editor(editor, AUO_EDCURSHOW, NULL);
		} else
		{
			selonly = TRUE;
		}
	}
	editdata = self->user;
	strcpy(protocnf.filename, editdata->cnf.filename);
	filename = Af_select(editdata->save_title, editdata->cnf.filename, editdata->cnf.ext);
	if (filename != NULL)
	{
		save_it(editor, filename);
		if (!selonly)
		{
			strcpy(editdata->cnf.filename, filename);
			set_icon(self);
			undirty(self);
		}
	}
}

/* -------------------------------------------------------------------------- */

void Aed_saveas(void)
{
	ed_saveas(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

void Aed_selall(void)
{
	OBJECT *editor = &ACSblk->ev_window->work[EDIT_EDITOR];
	long rows;
	EDITSEL sel;
	EDITGETS gets;
	
	Auo_editor(editor, AUO_EDGETROWS, &rows);
	gets.row = rows - 1;
	Auo_editor(editor, AUO_EDGETROW, &gets);
	Auo_editor(editor, AUO_EDGETSELECT, &sel);
	if (sel.row1 == 0 &&
		sel.col1 == 0 &&
		rows == sel.row2 - sel.row1 + 1 &&
		sel.col2 == gets.size)
	{
		Auo_editor(editor, AUO_EDUNSELECT, NULL);
		Auo_editor(editor, AUO_EDVIEW, NULL);
		Auo_editor(editor, AUO_EDCURSHOW, NULL);
	} else
	{
		if (sel.row1 >= 0)
			Auo_editor(editor, AUO_EDUNSELECT, NULL);
		sel.row2 = gets.row = rows - 1;
		Auo_editor(editor, AUO_EDGETROW, &gets);
		sel.row1 = sel.col1 = 0;
		sel.col2 = gets.size;
		Auo_editor(editor, AUO_EDCURHIDE, NULL);
		Auo_editor(editor, AUO_EDSETSELECT, &sel);
	}
}

/* -------------------------------------------------------------------------- */

void Aed_swap(void)
{
	OBJECT *editor = &ACSblk->ev_window->work[EDIT_EDITOR];
	long row;
	long col;
	EDITGETS gets;
	
	Auo_editor(editor, AUO_EDUNSELECT, NULL);
	Auo_editor(editor, AUO_EDVIEW, NULL);
	Auo_editor(editor, AUO_EDGETPOS, &row);
	Auo_editor(editor, AUO_EDGETCURPOS, &col);
	gets.row = row;
	Auo_editor(editor, AUO_EDGETROW, &gets);
	if (col > 0 && col < gets.size)
	{
		c_swap[0] = gets.text[col];
		c_swap[1] = gets.text[col - 1];
		subswap.row1 = subswap.row2 = row;
		subswap.col1 = col - 1;
		subswap.col2 = col + 1;
		Auo_editor(editor, AUO_EDSUB, &subswap);
		Auo_editor(editor, AUO_POS, &row);
		Auo_editor(editor, AUO_EDCURPOS, &col);
		dirty(ACSblk->ev_window);
		Auo_editor(editor, AUO_UPDATE, NULL);
	}
}

/* -------------------------------------------------------------------------- */

void Aed_undo(void)
{
	edit_key(ACSblk->ev_window, 0, NKF_FUNC | NK_UNDO);
}

/* -------------------------------------------------------------------------- */

void Aed_option(void)
{
	Awindow *win;
	Awindow *self;
	OBJECT *editor;
	EDITDATA *editdata;
	AUSERBLK *cursor_cycle;
	OBJECT *cursor;
	int16 tabsize;
	boolean blockmode;
	char *separator;
	
	if ((win = WIED_OPTION.create(&WIED_OPTION)) != NULL)
	{
		self = ACSblk->ev_window;
		editor = &self->work[EDIT_EDITOR];
		editdata = self->user;
		cursor = &win->work[ED_OPTION_CURSOR];
		cursor_cycle = cursor->ob_spec.auserblk;
		cursor_cycle->ub_serv(cursor, AUO_CYCINDEX, &editdata->cnf.cursor);
		Auo_editor(editor, AUO_EDBLOCKMODE, &blockmode);
		if (blockmode)
		{
			win->work[ED_OPTION_BLOCKMODE].ob_state |= OS_SELECTED;
			win->work[ED_OPTION_CONTINUOUS].ob_state &= ~OS_SELECTED;
		} else
		{
			win->work[ED_OPTION_CONTINUOUS].ob_state |= OS_SELECTED;
			win->work[ED_OPTION_BLOCKMODE].ob_state &= ~OS_SELECTED;
		}
		Auo_editor(editor, AUO_EDGETTABSIZE, &tabsize);
		Aob_printf(win->work, ED_OPTION_TABSIZE, "%d", tabsize);
		Aob_puttext(win->work, ED_OPTION_EXT, editdata->cnf.ext);
		Aob_puttext(win->work, ED_OPTION_HELPACC, editdata->cnf.helpacc);
		Auo_editor(editor, AUO_EDGETSEPARATOR, &separator);
		Aob_puttext(win->work, ED_OPTION_SEPARATOR, separator);
		if (Awi_dialog(win) == ED_OPTION_OK)
		{
			Auo_boxed(&win->work[ED_OPTION_SEPARATOR], AUO_GETVAL, &separator);
			Auo_editor(editor, AUO_EDSETSEPARATOR, separator);
#ifdef __GNUC__
			{
			int x;
			Aob_scanf(win->work, ED_OPTION_TABSIZE, "%2d", &x);
			tabsize = x;
			}
#else
			Aob_scanf(win->work, ED_OPTION_TABSIZE, "%2d", &tabsize);
#endif
			Aob_gettext(win->work, ED_OPTION_EXT, editdata->cnf.ext);
			Aob_gettext(win->work, ED_OPTION_HELPACC, editdata->cnf.helpacc);
			if (editdata->cnf.helpacc[0] != '\0')
			{
				int len = (int)strlen(strupr(editdata->cnf.helpacc));
				while (len < 8)
				{
					editdata->cnf.helpacc[len] = ' ';
					len++;
				}
				editdata->cnf.helpacc[8] = '\0';
			}
			cursor_cycle->ub_serv(cursor, AUO_CYCGETINDEX, &editdata->cnf.cursor);
			protocnf.cursor = editdata->cnf.cursor;
			protocnf.tab = tabsize;
			strcpy(protocnf.ext, editdata->cnf.ext);
			Auo_editor(editor, AUO_EDCURHIDE, NULL);
			Auo_editor(editor, AUO_EDCURSOR, &protocnf.cursor);
			Auo_editor(editor, AUO_EDTABSIZE, &tabsize);
			if (win->work[ED_OPTION_CONTINUOUS].ob_state & OS_SELECTED)
				Auo_editor(editor, AUO_EDCHARSELECT, NULL);
			else
				Auo_editor(editor, AUO_EDBLKSELECT, NULL);
			Auo_editor(editor, AUO_FULLUPDATE, NULL);
			Auo_editor(editor, AUO_EDCURSHOW, NULL);
		}
		Awi_delete(win);
	}
}

/* -------------------------------------------------------------------------- */

void Aed_wrap(void)
{
	Awindow *win;
	int wrap;
	OBJECT *editor;
	char *separator;
	EDITSEL sel;
	long row;
	long end;
	EDITGETS gets;
	int16 size;
	const char *str;
	
	if ((win = WIED_WRAP.create(&WIED_WRAP)) != NULL)
	{
		Aob_printf(win->work, ED_WRAP_WRAP, "%d", protocnf.wrap);
		if (Awi_dialog(win) == ED_WRAP_OK)
		{
			Aob_scanf(win->work, ED_WRAP_WRAP, "%d", &wrap);
			if (wrap > 0)
			{
				protocnf.wrap = wrap;
				editor = &ACSblk->ev_window->work[EDIT_EDITOR];
				Auo_editor(editor, AUO_EDGETSELECT, &sel);
				if (sel.row1 >= 0)
				{
					row = sel.row1;
					end = sel.row2;
					Auo_editor(editor, AUO_EDUNSELECT, NULL);
				} else
				{
					row = 0;
					Auo_editor(editor, AUO_EDGETROWS, &end);
					--end;
				}
				Auo_editor(editor, AUO_EDCURHIDE, NULL);
				Auo_editor(editor, AUO_EDGETSEPARATOR, &separator);
				do
				{
					gets.row = row;
					Auo_editor(editor, AUO_EDGETROW, &gets);
					size = (int16)gets.size;
					if (wrap < size)
					{
						size = wrap;
						str = gets.text + size;
						for (;;)
						{
							if (size < 1)
							{
								size = wrap;
								break;
							}
							--str;
							if (strchr(separator, *str) != NULL)
								break;
							size--;
						}
						subs.row1 = subs.row2 = row;
						subs.col1 = subs.col2 = size;
						Auo_editor(editor, AUO_EDSUB, &subs);
						++end;
					}
					++row;
				} while (row <= end);
				Auo_editor(editor, AUO_EDCLEARUNDO, NULL);
				Auo_editor(editor, AUO_EDVIEW, NULL);
				Auo_editor(editor, AUO_UPDATE, NULL);
				Auo_editor(editor, AUO_EDCURSHOW, NULL);
				Auo_editor(editor, AUO_UPDATE, NULL);
				dirty(ACSblk->ev_window);
			}
		}
		Awi_delete(win);
	}
}

/* -------------------------------------------------------------------------- */

void Aed_toclip(void)
{
	char filename[__PS__];
	
	strcat(strcpy(filename, ACSblk->scrp_path), "scrap.txt");
	save_it(&ACSblk->ev_window->work[EDIT_EDITOR], filename);
}

/* -------------------------------------------------------------------------- */

void Aed_fromclip(void)
{
	char filename[__PS__];
	
	strcat(strcpy(filename, ACSblk->scrp_path), "scrap.txt");
	merge_it(ACSblk->ev_window, filename);
}

/* -------------------------------------------------------------------------- */

void Aed_saveoptions(void)
{
	EDITDATA *editdata = ACSblk->ev_window->user;
	OBJECT *editor;
	char *separator;
	long fd;
	int16 num_fkeys;
	int i;
	
	memcpy(&protocnf, &editdata->cnf, sizeof(protocnf));
	protocnf.id = EDCONF_MAGIC;
	protocnf.flags &= ~EDCONF_DIRTY;
	protocnf.w = ACSblk->ev_window->work->ob_width;
	protocnf.h = ACSblk->ev_window->work->ob_height;
	editor = &ACSblk->ev_window->work[EDIT_EDITOR];
	Auo_editor(editor, AUO_EDGETSEPARATOR, &separator);
	strcpy(protocnf.separator, separator);
	if ((fd = Fcreate(Af_cfgfile("EDITOR"), 0)) > 0)
	{
		Fwrite((int) fd, sizeof(protocnf), &editdata->cnf);
		for (num_fkeys = i = 0; i < NUM_FKEYS; i++)
			if (editdata->fkeys[i] != NULL)
				num_fkeys++;
		Fwrite((int) fd, sizeof(int32), &num_fkeys); /* BUG: should write int32 (see edit_make) */
		for (num_fkeys = i = 0; i < NUM_FKEYS; i++)
			if (editdata->fkeys[i] != NULL)
				Fwrite((int) fd, sizeof(*editdata->fkeys[i]), editdata->fkeys[i]);
		Fclose((int) fd);
	}
}

/* -------------------------------------------------------------------------- */

static void sel_edit(void)
{
	long size;
	EDITDATA *editdata;
	EDITSEL sel;
	EDITGETS gets;
	long row;
	char *text;
	OBJECT *editor;
	AOBJECT *aobj;
	
	size = 0;
	Auo_editor(editor = &ACSblk->ev_window->work[EDIT_EDITOR], AUO_EDGETSELECT, &sel);
	if (sel.row1 >= 0 && ACSblk->ev_mmobutton == 2)
	{
		for (row = sel.row1; row <= sel.row2; row++)
		{
			gets.row = row;
			Auo_editor(editor, AUO_EDGETROW, &gets);
			size += gets.size + 1;
		}
		text = Ax_malloc(size + 2);
		if (text != NULL)
		{
			*text = '\0';
			size = 0;
			for (row = sel.row1; row <= sel.row2; row++)
			{
				gets.row = row;
				Auo_editor(editor, AUO_EDGETROW, &gets);
				memcpy(&text[size], gets.text, gets.size);
				size += gets.size;
				text[size] = '\n';
				size++;
			}
			text[size - 1] = '\0';
#define select editor
			select = &ACSblk->ev_window->work[EDIT_SELECT];
			aobj = (AOBJECT *)select + 1;
			aobj->userp1 = text;
			aobj->type = AT_TEXT;
			select->ob_width = ACSblk->gl_wbox * 2;
			select->ob_height = ACSblk->gl_hbox;
			select->ob_x = ACSblk->ev_mmox - ACSblk->ev_window->wi_work.x - ACSblk->gl_wbox;
			select->ob_y = ACSblk->ev_mmoy - ACSblk->ev_window->wi_work.y - (ACSblk->gl_hbox >> 1);
			select->ob_flags &= ~OF_HIDETREE;
			Adr_add(ACSblk->ev_window, EDIT_SELECT);
			Adr_drag(ACSblk->ev_mmox, ACSblk->ev_mmoy);
			Adr_del(ACSblk->ev_window, EDIT_SELECT);
			select->ob_x = select->ob_y = select->ob_width = select->ob_height = 0;
			select->ob_flags |= OF_HIDETREE;
			Ax_free(text);
			aobj->userp1 = NULL;
			aobj->type = 0;
			Auo_editor(&ACSblk->ev_window->work[EDIT_EDITOR], AUO_EDUNSELECT, NULL);
#undef select
		}
	}
	Aus_editor();
	editdata = ACSblk->ev_window->user;
	editdata->counter = 0;
}

/* -------------------------------------------------------------------------- */

static void ins_string(void)
{
	Awindow *select;
	Awindow *self;
	int16 obnr;
	AOBJECT *aobj;
	OBJECT *editor;
	EDITSEL sel;
	EDITDATA *editdata;
	
	select = ACSblk->Aselect.window;
	self = ACSblk->ev_window;
	if (select != self)
	{
		Adr_start();
		obnr = Adr_next();
		if (obnr >= 0)
		{
			aobj = (AOBJECT *)&select->work[obnr] + 1;
			switch (aobj->type)
			{
			case AT_STRING:
			case AT_TEXT:
				Adr_del(select, obnr);
				editor = &self->work[EDIT_EDITOR];
				Auo_editor(editor, AUO_EDCURHIDE, NULL);
				Auo_editor(editor, AUO_EDUNSELECT, NULL);
				Auo_editor(editor, AUO_EDGETPOS, &sel.row1);
				Auo_editor(editor, AUO_EDGETCURPOS, &sel.col1);
				put_string(self, aobj->userp1);
				Auo_editor(editor, AUO_EDGETPOS, &sel.row2);
				Auo_editor(editor, AUO_EDGETCURPOS, &sel.col2);
				Auo_editor(editor, AUO_EDSETSELECT, &sel);
				Auo_editor(editor, AUO_EDVIEW, NULL);
				Auo_editor(editor, AUO_UPDATE, NULL);
				Auo_editor(editor, AUO_EDCURSHOW, NULL);
				break;

			case AT_FILE:
				editdata = self->user;
				if (editdata->cnf.flags & EDCONF_DIRTY)
				{
					switch (alert_str(WARN_2SAVED, editdata->ic_name))
					{
					case 1:
						ed_save(self);
						break;
					case 3:
						return;
					}
				}
				Adr_del(select, obnr);
				open_file(self, aobj->userp1);
				break;
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static void info_string(Awindow *self, const char *str)
{
	EDITDATA *editdata = self->user;
	
	if (!(editdata->cnf.flags & EDCONF_USERTOOLBAR))
	{
		Aob_puttext(self->toolbar, ED_TOOL_INFO_STRING, str);
		self->obchange(self, ED_TOOL_INFO_STRING | A_TOOLBAR, -1);
		editdata->counter = 5;
	}
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static boolean edit_fkey(FKeyLine *fkey, void *expara);

static boolean acc_fkey(AOBJECT *aobj, void *expara)
{
	FKeyLine fkey = { 0, "" };
	EDITDATA *editdata;
	
	editdata = ((Awindow *)expara)->user;
	switch (aobj->type)
	{
	case AT_STRING:
	case AT_TEXT:
	case AT_ARCHIVE:
	case AT_FILE:
		strncat(fkey.text, aobj->userp1, sizeof(fkey.text) - 1);
		if (edit_fkey(&fkey, expara) == TRUE)
			editdata->wifkeys->service(editdata->wifkeys, AS_LIST_ADD, &fkey);
		break;
	default:
		return FALSE;
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static int16 comp_fkey(void *org, void *new, void *expara)
{
	FKeyLine *orgfkey = org;
	FKeyLine *newfkey = new;
	int16 fkey1;
	int16 fkey2;
	
	UNUSED(expara);
	fkey1 = (char)orgfkey->key - NK_F1;
	if (orgfkey->key & NKF_CTRL)
		fkey1 += 20;
	if (orgfkey->key & NKF_SHIFT)
		fkey1 += 10;
	fkey2 = (char)newfkey->key - NK_F1;
	if (newfkey->key & NKF_CTRL)
		fkey2 += 20;
	if (newfkey->key & NKF_SHIFT)
		fkey2 += 10;
	if (fkey1 < fkey2)
		return -1;
	if (fkey1 > fkey2)
		return 1;
	return 0;
}

/* -------------------------------------------------------------------------- */

static boolean drag_fkey(AOBJECT *aobj, void *item, void *expara)
{
	FKeyLine *fkey = item;
	
	UNUSED(expara);
	if ((aobj->userp1 = Ast_create(fkey->text)) == NULL)
		return FALSE;
	aobj->type = AT_STRING;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean edit_fkey(FKeyLine *fkey, void *expara)
{
	boolean ret;
	Awindow *win;
	int16 key;
	
	ret = FALSE;
	win = WIED_NEWFKEY.create(&WIED_NEWFKEY);
	if (win == NULL)
		return FALSE;
	win->user = expara;
	Aob_puttext(win->work, ED_NEWFKEY_TEXT, fkey->text);
	if (fkey->key < NK_F1)
		fkey->key = NK_F1;
	if (fkey->key & NKF_SHIFT)
		win->work[ED_NEWFKEY_SHIFT].ob_state |= OS_SELECTED;
	if (fkey->key & NKF_CTRL)
		win->work[ED_NEWFKEY_CTRL].ob_state |= OS_SELECTED;
	key = (char)fkey->key - NK_F1;
	Auo_cycle(&win->work[ED_NEWFKEY_FKEY], AUO_CYCINDEX, &key);
	if (Awi_dialog(win) == ED_NEWFKEY_OK)
	{
		Aob_gettext(win->work, ED_NEWFKEY_TEXT, fkey->text);
		Auo_cycle(&win->work[ED_NEWFKEY_FKEY], AUO_CYCGETINDEX, &key);
		fkey->key = key + NK_F1;
		if (win->work[ED_NEWFKEY_SHIFT].ob_state & OS_SELECTED)
			fkey->key |= NKF_SHIFT;
		if (win->work[ED_NEWFKEY_CTRL].ob_state & OS_SELECTED)
			fkey->key |= NKF_CTRL;
		if (fkey->text[0] != '\0')
			ret = TRUE;
	}
	Awi_delete(win);
	return ret;
}

/* -------------------------------------------------------------------------- */

static long key_fkey(int16 key, void *expara)
{
	Awindow *self;
	EDITDATA *editdata;
	FKeyLine fkey;
	LISTITEM item;
	long count;
	
	self = expara;
	editdata = self->user;
	item.item = &fkey;
	editdata->wifkeys->service(editdata->wifkeys, AS_LIST_COUNT, &count);
	for (item.idx = 0; item.idx < count; item.idx++)
	{
		if (editdata->wifkeys->service(editdata->wifkeys, AS_LIST_GET, &item))
		{
			if (fkey.key == (key & (NKF_CTRL | NKF_SHIFT | 0xff)))
				return item.idx;
		}
	}
	return -1;
}

/* -------------------------------------------------------------------------- */

static boolean mess_fkey(int16 mess, void *expara)
{
	Awindow *self = expara;
	
	switch (mess)
	{
	case LM_DBL_ITEM:
		if (Awi_alert(1, A_FKEYDBL) == 2)
			return FALSE;
		break;

	case LM_INFO:
		self->service(self, AS_INFO, NULL);
		break;
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean print_fkey(char *line, FKeyLine *fkey, void *expara)
{
	const char *const fkeys[] = {
		"F 1",
		"F 2",
		"F 3",
		"F 4",
		"F 5",
		"F 6",
		"F 7",
		"F 8",
		"F 9",
		"F10"
	};
	
	UNUSED(expara);
	strcpy(line, "  ");
	if (fkey->key & NKF_SHIFT)
		line[0] = SHIFT_C;
	if (fkey->key & NKF_CTRL)
		line[1] = CONTROL_C;

#ifdef __GNUC__
#pragma GCC diagnostic ignored "-Wformat"
#endif

	sprintf(&line[2], "%s:%-0.*s", fkeys[(char)fkey->key - NK_F1], 249, fkey->text);

#ifdef __GNUC__
#pragma GCC diagnostic warning "-Wformat"
#endif

	return TRUE;
}

static boolean term_fkey(void *expara)
{
	Awindow *self = expara;
	EDITDATA *editdata = self->user;
	FKeyLine fkey;
	LISTITEM item;
	long count;
	long i;
	int idx;
	
	item.item = &fkey;
	editdata->wifkeys->service(editdata->wifkeys, AS_LIST_COUNT, &count);
	for (i = 0; i < NUM_FKEYS; i++)
	{
		if (editdata->fkeys[i] != NULL)
		{
			Ax_free(editdata->fkeys[i]);
			editdata->fkeys[i] = NULL;
		}
	}
	for (item.idx = 0; item.idx < count; item.idx++)
	{
		if (editdata->wifkeys->service(editdata->wifkeys, AS_LIST_GET, &item))
		{
			idx = (char)fkey.key - NK_F1;
			if (fkey.key & NKF_CTRL)
				idx += 20;
			if (fkey.key & NKF_SHIFT)
				idx += 10;
			if ((editdata->fkeys[idx] = Ax_malloc(sizeof(fkey))) != NULL)
				memcpy(editdata->fkeys[idx], &fkey, sizeof(fkey));
		}
	}
	editdata->wifkeys = NULL;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

void Aed_fkey(void)
{
	LISTDATA listdata = {
		NULL,
		"",
		{ 0, 0, 0, 0 },
		NULL,
		sizeof(FKeyLine),
		acc_fkey,
		comp_fkey,
		drag_fkey,
		(boolean (*)(void *, void *)) edit_fkey, /* FIXME: cast */
		key_fkey,
		mess_fkey,
		(boolean (*)(char *line, void *, void *expara))print_fkey, /* FIXME: cast */
		term_fkey,
	};
	EDITDATA *editdata;
	int i;
	
	listdata.expara = ACSblk->ev_window;
	strcpy(listdata.title, FK_TITLE);
	editdata = ACSblk->ev_window->user;
	if (editdata->wifkeys == NULL)
	{
		if ((editdata->wifkeys = LIST_WINDOW.create(&listdata)) == NULL)
			return;
		for (i = 0; i < NUM_FKEYS; i++)
		{
			if (editdata->fkeys[i] != NULL)
				editdata->wifkeys->service(editdata->wifkeys, AS_LIST_ADD, editdata->fkeys[i]);
		}
		editdata->wifkeys->service(editdata->wifkeys, AS_LIST_UPDATE, NULL);
	}
	Awi_show(editdata->wifkeys);
}

/* -------------------------------------------------------------------------- */

Awindow *get_editor(void)
{
	return &EDITOR;
}
