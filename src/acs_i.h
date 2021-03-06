/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Internal include file for application & library       */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include <stdio.h>
#include <acstype.h>
#include <acs.h>
#include <acsaes.h>
#include <string.h>

/*
 * Library configuration:
 */
/*
 * set this to 1 to apply some fixes
 * if set to 0, attempt to compile the original version
 */
#ifndef WITH_FIXES
#  define WITH_FIXES 0
#endif

/* set this to 1 to remove the demo check */
#ifndef KILLDEMO
#  define KILLDEMO 0
#endif


#ifdef __GNUC__
/* no need to attempt to generate identical image */
#undef WITH_FIXES
#define WITH_FIXES 1
#undef KILLDEMO
#define KILLDEMO 1
#endif
#define WITH_UNUSED_ICONS (!WITH_FIXES)

#define __PS__   128

#define MAX_ACS   16
#define MAX_WINDS 256
#define MAX_WI_ICONS 128
#define PATH_SEP  '\\'
#define MAX_LANGS 3
#define LABEL_MAX 32
#define STRING_MAX 256

/*
 * sometimes we have to cast away constness
 */
#ifndef NO_CONST
#  ifdef __GNUC__
#	 define NO_CONST(p) __extension__({ union { const void *cs; void *s; } x; x.cs = p; x.s; })
#  else
#	 define NO_CONST(p) ((void *)(p))
#  endif
#endif

#undef UNUSED
#define UNUSED(x) (void)(x)


struct UConfig {
    /*   0 */ char id;
    /*   1 */ char username[128];
    /* 129 */ char userserial[11];
    /* 140 */ char userkey[11];
    /* 151 */ char helpname[9];
    /* 160 */ boolean gluepart;
    /* 162 */ int16 save;
    /* 164 */ boolean dirty;
    /* 166 */ boolean snapping;
    /* 168 */ boolean copyindex;
    /* 170 */ int16 imagesnap;
    /* 172 */ boolean refimages;
    /* 174 */ int16 flags;
    /* 176 */ Axywh pxywh;
    /* 184 */ Axywh bxywh;
    /* 192 */ char last_path[__PS__];
    /* 320 */ int16 used;
    /* 322 */ char acs[MAX_ACS][__PS__];
    /*2370 */ 
};

typedef struct _Obj_Head Obj_Head;
typedef struct _ACS_HEAD ACS_HEAD;

typedef struct {
	Awindow *w_cews;
	Awindow *w_edit[MAX_ACS];
	char p_edit[MAX_ACS][__PS__];
} CEWSDATA;

struct _Obj_Head {
	/*   0 */ Obj_Head *next;
	/*   4 */ void *object;
	/*   8 */ uint16 oh_id;
	/*  10 */ ssize_t size;
	/*  14 */ ssize_t used;
	/*  18 */ Awindow *window;
	/*  22 */ char label[LABEL_MAX];
	/*  54 */ int16 usage;
	/*  56 */ int16 flags;
	/*  58 */ Axywh pos;
	/*  66 */
};
/* OBJ_HEAD.flags */
#define OBJ_GLOBAL           0x0100
#define OBJ_USERDEFINED      0x0200
#define OBJ_LOCAL            0x0400


typedef struct {
	/*   0 */ ACS_HEAD *acs;
	/*   4 */ Obj_Head *objlist;
	/*   8 */ Awindow *window;
	/*  12 */ char *name;
	/*  16 */ const char *asktitle;
	/*  20 */ int16 type;
	/*  22 */ Obj_Head *prototyp;
	/*  26 */ Obj_Head *(*copy_ob)(ACS_HEAD *acs, const Obj_Head *obj);
	/*  30 */ void (*del_ob)(ACS_HEAD *acs, Obj_Head *obj);
	/*  34 */ OBJECT *(*new_work)(Obj_Head *objlist);
	/*  38 */ boolean (*service)(ACS_HEAD *acs, int16 task, Obj_Head *obj);
	/*  42 */ 
} LISTPARM;
/*
 * LISTPARM.type
 */
#define LIST_OBJECT      10000
#define LIST_MENU        10001
#define LIST_POPUP       10002
#define LIST_WINDOWS     10007
#define LIST_STRING      10010
#define LIST_TEDINFO     10011
#define LIST_REFS        10012
#define LIST_ALERT       10014
#define LIST_USERBLK     10015
#define LIST_ICON        10016
#define LIST_IMAGE       10017
#define LIST_MOUSE       10018
#define LIST_AMOUSE      10019
#define LIST_DATA        10020

/*
 * LIST services
 */
#define LS_CREATEOBJ   1
#define LS_CHANGEOBJ   2
#define LS_DELETEOBJ   3


typedef struct {
	/*   0 */ char magic[8];
	/*   8 */ int16 version;
	/*  10 */ int16 dx;
	/*  12 */ int16 dy;
	/*  14 */ int16 flags;
	/*  16 */ char acc_reg[32];
	/*  48 */ Obj_Head *root;
	/*  52 */ Obj_Head *acc;
	/*  56 */ Amouse mouse[32];
	/* 248 */
} Aolddescr;

struct _ACS_HEAD {
	/*   0 */ int32 magic;
	/*   4 */ int16 version;
	/*   6 */ int16 flags;
	/*   8 */ char *filename;
	/*  12 */ Awindow *window;
	/*  16 */ Obj_Head *labels;
	/*  20 */ Obj_Head *wi_list;  /* windows */
	/*  24 */ Obj_Head *ob_list;  /* objects */
	/*  28 */ Obj_Head *me_list;  /* menus */
	/*  32 */ Obj_Head *pu_list;  /* popups */
	/*  36 */ Obj_Head *al_list;  /* alerts */
	/*  40 */ Obj_Head *te_list;  /* tedinfos */
	/*  44 */ Obj_Head *ic_list;  /* icons */
	/*  48 */ Obj_Head *im_list;  /* images */
	/*  52 */ Obj_Head *st_list;  /* strings */
	/*  56 */ Obj_Head *us_list;  /* userdefs */
	/*  60 */ Obj_Head *rf_list;  /* references */
	/*  64 */ Obj_Head *mo_list;  /* mouses */
	/*  68 */ Obj_Head *if_list;  /* data */
	/*  72 */ Obj_Head *list_3;
	/*  76 */ Aolddescr descr; /* does not include mess[AD_COUNT] */
	/* 324 */ Awindow *wi_palette;
	/* 328 */ Awindow *wi_descr;
	/* 332 */ Axywh pos_ge;       /* position of general window */
	/* 340 */ Axywh pos_pa;       /* position of palette window */
	/* 348 */ Axywh pos_ds;       /* position of description window */
	/* 356 */ long obj_count;
	/* 360 */ Axywh last_rez;
	/* 368 */ int32 extflags;
	/* 372 */ char backup[__PS__]; /* path for backups */
	/* 500 */ int16 language;     /* current language being edited */
	/* 502 */ Obj_Head *mlst_list[MAX_LANGS]; /* strings of other languages */
	/* 514 */ Obj_Head *mlal_list[MAX_LANGS]; /* alert strings of other languages */
	/* 526 */ int16 src_lang;     /* compiler output language */
	/* 528 */ Awindow *wi_config;
	/* 532 */ Aconfig config;
	/* 610 */
};
#define ACS_MAGIC 0x2e414353L /* ".ACS" */

/*
 * ACS_HEAD.src_lang
 */
#define ACS_LANG_C      0
#define ACS_LANG_PASCAL 1


/*
 * ACS_HEAD.flags
 */
#define ACS_CHANGED     0x0001
#define ACS_0002        0x0002
#define ACS_0004        0x0004
#define ACS_0008        0x0008
#define ACS_0010        0x0010
#define ACS_0020        0x0020
#define ACS_0040        0x0040
#define ACS_0080        0x0080
#define ACS_0100        0x0100
#define ACS_0200        0x0200
#define ACS_0400        0x0400
#define ACS_SRCOUTPUT   0x0800
#define ACS_LOCAL       0x1000
#define ACS_PROTOTYPES  0x2000
#define ACS_IGNORECASE  0x4000
#define ACS_SUBMODUL    0x8000

/*
 * ACS_HEAD.extflags
 */
#define ACS_EXT_PROTOCOL  0x0001
#define ACS_EXT_BACKUP    0x0002


/*
 * builtin mouse forms.
 * (confusingly, they have different indices than AES)
 */
#define MOUSE_ARROW        0
#define MOUSE_BUSYBEE      1
#define MOUSE_POINT_HAND   2
#define MOUSE_FLAT_HAND    3
#define MOUSE_TEXT_CRSR    4
#define MOUSE_THIN_CROSS   5
#define MOUSE_THICK_CROSS  6
#define MOUSE_OUTLN_CROSS  7
/*
 * extra mouse forms for this application
 */
#define MOUSE_BRUSH_BLACK  8
#define MOUSE_BRUSH_WHITE  9
#define MOUSE_BRUSH_TRANS 10
#define MOUSE_OBJ_DRAG    11
#define MOUSE_OBJ_ADD     12


typedef struct {
	/*   0 */ Obj_Head *label;
	/*   4 */ Obj_Head *type;
	/*   8 */ OBJECT obj;
	/*  32 */ AOBJECT aobj;
	/*  56 */
} OBJ_ENTRY;

typedef struct {
	/*   0 */ CICONBLK cicon;
	/*  38 */ CICON c16;
	/*  60 */ CICON c256;
	/*  82 */
} ACSCICONBLK;

#define DATA_OFFSET 3

typedef struct {
	ACS_HEAD *acs;
	Obj_Head *obj;
	/* ^^^ must match first entries of LISTPARM */
} EDPARM;

typedef struct {
	ACS_HEAD *acs;
	Obj_Head *obj;
	Awindow *editor;
	/* ^^^ must match first entries of LISTPARM */
} REFPARM;

typedef struct {
	ACS_HEAD *acs;
	Obj_Head *obj;
	OBJECT *work;
	OBJECT *edit;
	int16 *data;
	int16 *mask;
	CICON c16;
	CICON c256;
	int16 color;
	int16 brush;
} ICONPARM;

typedef struct {
	ACS_HEAD *acs;
	Obj_Head *obj;
	OBJECT *work;
	OBJECT *edit;
	int16 *data;
} IMAGEPARM;

typedef struct {
	ACS_HEAD *acs;
	Obj_Head *obj;
	int16 flags;
	int16 act_obnr;
	int16 px;
	int16 py;
	int16 x;
	int16 y;
	int16 w;
	int16 h;
	int16 active;
	void (*ok)(void);
	int16 *select;
	void (*cleanup)(OBJECT *tree);
	char *oldtitle;
	char *oldhlptitle;
	char *oldhlpfile;
} OBJEDPARM;

typedef struct {
	MFDB org;
	MFDB *trans;
	long count;
} AMFDB;

typedef struct {
	OBJECT *tree;
	void (*ok)(void);
	void (*cleanup)(OBJECT *tree);
	char *title;
	char *help_title;
	char *help_file;
} SUBMODE;

typedef struct {
	unsigned long xfsl;
	uint16 revision;
	unsigned long product;
	uint16 version;
	int16 CDECL (*xfsl_input)(int16 vdihandle, uint16 fontflags, const char *headline, int16 *id, int16 *size);
	int16 CDECL (*xfsl_init)(int16 vdihandle, void *xpar);
	int16 CDECL (*xfsl_event)(int16 xfsl_handle, void *event);
	int16 CDECL (*xfsl_exit)(int16 xfsl_handle);
	long CDECL (*xfsl_info)(void);
} xFSL;

typedef struct {
	char *popup;
	long len;
} ddPopStruc;

typedef struct {
	Awindow *window;
	OBJECT *object;
	int16 obnr;
	int16 mmox;
	int16 mmoy;
	int16 mmokstate;
	boolean busy;
	Amouse mouse;
} CONTEXT;

typedef struct _ACSLinListElemStruct ACSLinListElemStruct;
struct _ACSLinListElemStruct
{
	ACSLinListElemStruct *next;
	ACSLinListElemStruct *prev;
	void *data;
};

typedef struct {
	int16 count;
	int16 *planes;
} a_hcicon;

typedef struct {
	const char *title;
	int16 x;
	int16 y;
	int16 *handle;
	char *path;
	int16 pathlen;
	char *fname;
	int16 fnamelen;
	char *patterns;
	XFSL_FILTER *filter;
	char *paths;
	int16 sort_mode;
	int16 flags;
	void *dialog;
	boolean modal;
	int16 button;
	int16 nfiles;
	Awindow *meldung;
	Awindow *window;
	 ULinList *liste;
} A_FileSelData;

typedef struct {
	char *title;
	int16 x;
	int16 y;
	PRN_SETTINGS *printData;
	PRN_DIALOG *dialog;
	int16 option;
	boolean is_my_setting;
	boolean is_print_dialog;
	int16 flags;
	boolean modal;
	int16 button;
	boolean choosed;
	Awindow *meldung;
	Awindow *window;
} A_PrintSelData;

typedef struct {
	void **funcs;
	int16 version;
} funcVersion;

typedef struct {
	const funcVersion *funcs;
	const int16 *versionen;
} funcListe;


/* characters to mark key modifiers */
#define ALT_C      '\007'
#define ALT_S      "\007"
#define CONTROL_C  '^'
#define CONTROL_S  "^"
#define SHIFT_C    '\001'
#define SHIFT_S    "\001"

/* values for ub_parm of cycle objects */
#define ACS_CYCLE_3D     0x10000L 
#define ACS_CYCLE_OUTCOL 0x0000FL
#define ACS_CYCLE_INCOL  0x000F0L
#define ACS_CYCLE_CHAR   0x0FF00L

/* values for ub_parm of arrow objects */
#define ACS_ARROW_3D        0x80000000L
#define ACS_ARROW_DIR_END   0x30000000L
#define ACS_ARROW_DIR_START 0x03000000L
#define ACS_ARROW_END_END   0x00c00000L
#define ACS_ARROW_END_START 0x00300000L
#define ACS_ARROW_LEN_END   0x40000000L
#define ACS_ARROW_LEN_START 0x04000000L
#define ACS_ARROW_FAT       0x00080000L
#define ACS_ARROW_STYLE     0x00070000L
#define ACS_ARROW_COLOR     0x0000000FL

/* values for ub_parm of pattern objects */
#define ACS_PATTERN_COLOR   0x0000000FL
#define ACS_PATTERN_FRAME   0x00200000L
#define ACS_PATTERN_PATTERN 0x00DF0000L

/* values for ub_parm of innerframe objects */
#define ACS_INNER_DITHER    0x10000000L
#define ACS_INNER_INCOL     0x000F0000L
#define ACS_INNER_INTERCOL  0x0000F000L
#define ACS_INNER_OUTCOL    0x0000000FL
#define ACS_INNER_TEXTCOL   0x000000F0L
#define ACS_INNER_PATTERN   0x00000E00L
#define ACS_INNER_POS       0x07000000L
#define ACS_INNER_POS_TOPLEFT   0x00000000L
#define ACS_INNER_POS_TOPMID    0x01000000L
#define ACS_INNER_POS_TOPRIGHT  0x02000000L
#define ACS_INNER_POS_BOTLEFT   0x04000000L
#define ACS_INNER_POS_BOTMID    0x05000000L
#define ACS_INNER_POS_BOTRIGHT  0x06000000L
#define ACS_INNER_SMALL     0x08000000L

/* values for ub_parm of 3dbutton objects */
#define ACS_3DBUTTON_NOFILL    0x80000000L /* part of bfobspec.character */
#define ACS_3DBUTTON_SMALL     0x40000000L /* part of bfobspec.character */
#define ACS_3DBUTTON_HORPOS    0x30000000L /* part of bfobspec.character */
#define ACS_3DBUTTON_HORPOS_LEFT   0x00000000L
#define ACS_3DBUTTON_HORPOS_CENTER 0x20000000L
#define ACS_3DBUTTON_HORPOS_RIGHT  0x10000000L
#define ACS_3DBUTTON_INCOL     0x0F000000L /* part of bfobspec.character */
#define ACS_3DBUTTON_OFFSET    0x00F00000L /* part of bfobspec.framesize */
#define ACS_3DBUTTON_FRAMESIZE 0x000F0000L /* part of bfobspec.framesize */
#define ACS_3DBUTTON_OUTCOL    0x0000F000L /* same as bfobspec.framecol */
#define ACS_3DBUTTON_TEXTCOL   0x00000F00L /* same as bfobspec.textcol */
#define ACS_3DBUTTON_TEXTMODE  0x00000080L /* same as bfobspec.textmode */
#define ACS_3DBUTTON_PATTERN   0x00000070L /* same as bfobspec.fillpattern */
#define ACS_3DBUTTON_INTERCOL  0x0000000FL /* same as bfobspec.interiorcol */

/* values for ub_parm of checkbox objects */
#define ACS_CHECKBOX_3D        0x00000001L

/* values for ub_parm of ftext objects */
#define ACS_FTEXT_FONTID       0xffff0000L
#define ACS_FTEXT_FONTSIZE     0x000000ffL
#define ACS_FTEXT_ALIGNMENT    0x0000c000L
#define ACS_FTEXT_ALIGN_CENTER    0x00000000L
#define ACS_FTEXT_ALIGN_LEFT      0x00004000L
#define ACS_FTEXT_ALIGN_RIGHT     0x00008000L
#define ACS_FTEXT_ALIGN_BLOCK     0x0000c000L
#define ACS_FTEXT_BOLD         0x00000100L
#define ACS_FTEXT_LIGHT        0x00000200L
#define ACS_FTEXT_ITALIC       0x00000400L
#define ACS_FTEXT_UNDERLINED   0x00000800L
#define ACS_FTEXT_OUTLINED     0x00001000L
#define ACS_FTEXT_SHADOWED     0x00002000L

/* values for ub_parm of title objects */
#define ACS_TITLE_HORPOS    0x00000003L
#define ACS_TITLE_HORPOS_LEFT   0x00000000L
#define ACS_TITLE_HORPOS_CENTER 0x00000001L
#define ACS_TITLE_HORPOS_RIGHT  0x00000002L
#define ACS_TITLE_SMALL     0x00000004L
#define ACS_TITLE_TEXTMODE  0x00000008L

/* values for ub_parm of picture objects */
#define ACS_PICTURE_TESTMODE   0x00000001L
#define ACS_PICTURE_TILE       0x00000002L
#define ACS_PICTURE_DITHER     0x00100000L


/*
 * about.c
 */
void ShowACSVersion(void);
void ShowACSUpdate(void);
void AboutGUIEditor(void);


/*
 * acsbase.c
 */
extern boolean runasdemo;
extern struct UConfig cfg;
extern char *last_path;
extern char *helpacc;
extern boolean gluepart;
extern boolean dirtysave;
extern boolean snapping;
extern int16 imagesnap;
extern boolean copyindex;
extern boolean refimages;
extern CEWSDATA cews;
extern Awindow *base_window;
extern Awindow WI_COMMON;

void acs_register(void);


/*
 * general.c
 */
#define AS_GUI_RENAME_OBJ  10000 /* in_out not used */
#define AS_GUI_SAVECFG     10001 /* in_out = Awindow * */
#define AS_GUI_SETUSED     10002 /* in_out = pathname */
#define AS_GUI_AUTOSAVE    10003 /* in_out not used */
#define AS_GUI_ISNOTUSED   10004 /* in_out = pathname */
#define AS_GENERAL_10005   10005
#define AS_GENERAL_10006   10006
#define AS_GENERAL_10007   10007
#define AS_GENERAL_10008   10008
#define AS_GENERAL_10009   10009

#define AS_ACS_PART_CHECK  9000
#define AS_ACS_PART_ADD    9001


extern void (*OldAboutMe)(void);
extern char _WGTITEL[];
extern Awindow WI_GENERAL;
extern Awindow WI_INFO_GENERAL;

void saveacs(Awindow *self);
int16 ACSinit0(void);
int16 ACSinit(void);


/*
 * edbehave.c
 */
extern const char *const mlmess[ /* AD_COUNT */ ];
extern Awindow WI_BEHAVE;
extern Awindow WI_MAINMOD;


/*
 * edutil.c
 */
void set_flag(int16 setit, OBJECT *obj);
void mod_ref(ACS_HEAD *acs, Obj_Head **ref, const char *title, int16 type);
void set_ref(Obj_Head *ref, char *label);
void set_val(Obj_Head *ref, char *label);
boolean A_rubberbox(int16 x, int16 y, int16 minw, int16 minh, int16 *dstw, int16 *dsth, int16 maxw, int16 maxh);
void view_grow(Awindow *win);
void view_shrink(Awindow *win);
void new_name(Awindow *win, Obj_Head *title);
void chk_new_label(void);
void newlabel(ACS_HEAD *acs, Obj_Head *obj, const char *title);
boolean new2label(ACS_HEAD *acs, Obj_Head *obj, const char *title);
void wi_pos(Awindow *win, Axywh *pos, Axywh *lastpos);
void *to_cicon(int16 *data, int16 *mask, CICONBLK *icon, int16 planes);


/*
 * palette.c
 */
extern Awindow WI_PALETTE;


/*
 * io/protocol.c
 */
void protocol(ACS_HEAD *acs);


/*
 * io/fixacs.c
 */
boolean fix_all(ACS_HEAD *acs);
void unfix_all(ACS_HEAD *acs);
void wr_all(ACS_HEAD *acs);
void rd_all(ACS_HEAD *acs);
void release_err(void);
void free_acs(ACS_HEAD *acs);
void objfree(ACS_HEAD *acs, Obj_Head *obj);
Obj_Head *objmalloc(ACS_HEAD *acs, size_t size);
int16 objextent(Obj_Head *obj, size_t size);
int16 uniquename(ACS_HEAD *acs, Obj_Head *obj, Obj_Head ***list);
void objname(ACS_HEAD *acs, Obj_Head *obj, const char *listname, const char *objname);


/*
 * io/rscin.c
 */
void read_rsc(ACS_HEAD *acs);


/*
 * io/pc_head.c
 */
void pc_header(ACS_HEAD *acs);


/*
 * io/pc_out.c
 */
void info_start(const char *filename);
void info_end(void);
void info_title(const char *title);
void info_list(const char *name);
void info_obj(const char *name);
void pc_output(ACS_HEAD *acs);


/*
 * io/pp_out.c
 */
void pp_output(ACS_HEAD *acs);


/*
 * io/str_out.c
 */
void str_output(ACS_HEAD *acs);

/*
 * io/acsio.c
 */
void acs_closewi(ACS_HEAD *acs, boolean all);



/*
 * edit2/edaled.c
 */
extern Awindow WI_ALERT;


/*
 * edit2/edwinded.c
 */
extern Awindow WI_WINDOW;


/*
 * edit2/edrefed.c
 */
#define REF_NONE           0
#define REF_OBJ_CLICK      1
#define REF_OBJ_DRAG       2
#define REF_USER_DRAW      3
#define REF_USER_SERVICE   4
#define REF_WIN_UNUSED1    5
#define REF_WIN_OPEN       6
#define REF_WIN_CREATE     7
#define REF_WIN_INIT       8
#define REF_WIN_KEYS       9
#define REF_WIN_CHANGE    10
#define REF_WIN_REDRAW    11
#define REF_WIN_TOPPED    12
#define REF_WIN_UNUSED2   13
#define REF_WIN_CLOSED    14
#define REF_WIN_ARROWED   15
#define REF_WIN_HSLIDE    16
#define REF_WIN_VSLIDE    17
#define REF_WIN_MOVED     18
#define REF_WIN_SIZED     19
#define REF_WIN_FULLED    20
#define REF_WIN_SERVICE   21
#define REF_WIN_ICONIFY   22
#define REF_WIN_UNICONIFY 23
#define REF_WIN_GEMSCRIPT 24
#define REF_SYS_ACSINIT0  25
#define REF_SYS_ACSINIT   26
#define REF_SYS_TERM      27
#define REF_SYS_ABOUTME   28
#define REF_SYS_CLOSE     29
#define REF_SYS_MESSAGE   30
#define REF_SYS_MPROTO    31
#define REF_SYS_TIMER     32
#define REF_SYS_KEY       33
#define REF_SYS_BUTTON    34
#define REF_SYS_MOUSE     35
#define REF_SYS_WIKEY     36
#define REF_SYS_GEMSCRIPT 37

extern Awindow WI_REF;
extern int16 const cross_type[];


/*
 * edit2/edparts.c
 */
extern Awindow WI_PARTS;
extern Awindow *parts_window;

void glue_parts(Awindow *win);


/*
 * edit2/eddataed.c
 */
extern Awindow WI_DATA;
extern Adescr ACSdescr;
extern Aconfig ACSconfig;


/*
 * edit2/edmoused.c
 */
extern Awindow WI_MOUSE;


/*
 * edit2/ediconed.c
 */
extern Awindow WI_ICON;


/*
 * edit2/edimaged.c
 */
extern Awindow WI_IMAGE;


/*
 * edit2/edusered.c
 */
extern Awindow WI_USER;


/*
 * edit2/edstred.c
 */
extern Awindow WI_STRING;


/*
 * edit2/edteded.c
 */
extern Awindow WI_TEDI;


/*
 * editor/edobjced.c
 */
Awindow *ob_make(void *a);


/*
 * editor/edobicm.c
 */
SUBMODE *edoic_set_icon(OBJ_ENTRY *entry);


/*
 * editor/edobimm.c
 */
SUBMODE *edoim_set_image(OBJ_ENTRY *entry);


/*
 * editor/edobstrm.c
 */
SUBMODE *edst_set_str(OBJ_ENTRY *entry);


/*
 * editor/edobtedm.c
 */
SUBMODE *edte_set_ted(OBJ_ENTRY *entry);


/*
 * editor/edobusrm.c
 */
SUBMODE *edus_set_user(OBJ_ENTRY *entry);


/*
 * editor/edobboxm.c
 */
extern const char *const colour_text[];
extern char HPOS_TEXT1[];
extern char HPOS_TEXT2[];
extern char HPOS_TEXT3[];
extern char SIZE_TEXT0[];
extern char SIZE_TEXT1[];

SUBMODE *edbo_set_box(OBJ_ENTRY *entry);


/*
 * editor/edobaeom.c
 */
SUBMODE *set_aeo(OBJ_ENTRY *entry);


/*
 * editor/edobaflm.c
 */
SUBMODE *set_aflags(OBJ_ENTRY *entry);


/*
 * editor/edobclas.c
 */
extern Awindow WI_MENU;
extern Awindow WI_OBJECT;
extern Awindow WI_POPUP;
extern Awindow WI_POSITION;
extern char NEW_POPUP[];
extern char WARN_SAME[];
extern char WARN_XSHRINK[];
extern char WARN_YSHRINK[];

boolean ed_service(Awindow *self, int16 task, void *in_out);
int16 ed_init(Awindow *win);
void ed_term(Awindow *win);
int16 CDECL user_control(PARMBLK *pb);


/*
 * editor/edobkeys.c
 */
char *key_string(int16 key);
int16 key_code(const char *str);


/*
 * editor/edobstru.c
 */
void copy_ob(ACS_HEAD *acs, OBJ_ENTRY *dst, const OBJ_ENTRY *src);
void del_ob(ACS_HEAD *acs, OBJ_ENTRY *obj);
void unlink_ob(OBJ_ENTRY *objtree, int16 obnr);
int16 copysub_ob(ACS_HEAD *acs, Obj_Head *obj, Obj_Head *proto, int16 obnr);
void pack_ob(Obj_Head *obj);
void delsub_ob(ACS_HEAD *acs, Obj_Head *obj, int16 obnr);
void moveto_ob(OBJ_ENTRY *tree, int16 src, int16 dst);
void resize_ob(OBJ_ENTRY *objtree, int16 obnr, int16 w, int16 h, OBJECT *tree);
void free_ob(OBJ_ENTRY *tree, int16 obnr);


/*
 * editor/edobsurf.c
 */
void del_obentry(Awindow *win, int16 obnr, boolean flatten);
void min_size(OBJ_ENTRY *entry, OBJECT *obj, int16 *minw, int16 *minh);
void ed_edit(void);
void ed_dragged(void);
void undraw(Awindow *win, int16 obnr);
void edob_next(void);
void ed_delete(Awindow *self);
int16 char_x(int16 x);
int16 pixel_x(int16 x);
int16 char_y(int16 x);
int16 pixel_y(int16 x);


/*
 * editor/edobobjc.c
 */
void oe_beself(Awindow *win, OBJECT *tree, int16 obnr);
int16 oe_colsel(int16 color, int16 backbox, int16 popup, int16 colorbox);
void edob_specs(void);
void edob_aflags(void);
void edob_refs(void);
void edob_pos(void);
void ed_abort(void);
void edob_resetref(void);
void edob_left(void);
void edob_center(void);
void edob_right(void);
void edob_horfill(void);
void edob_top(void);
void edob_mid(void);
void edob_bottom(void);
void edob_verfill(void);
void edob_hide(void);
void edob_unhide(void);
void edob_lock(void);
void edob_unlock(void);
void edob_up(void);
void edob_down(void);
void edob_sortyx(void);
void edob_sortxy(void);
void change_work(Awindow *win, OBJECT *tree, const char *title, void (*abort)(void), void (*cleanup)(OBJECT *tree), OBJECT *tree2, const char *help_title, const char *help_file);
void open_it(void);


/*
 * editor/ueboxed.c
 */
void init_boxed(Awindow *win);


/*
 * editor/uetitle.c
 */
void init_title(Awindow *win);


/*
 * editor/ue3dbutt.c
 */
void init_3Dbutton(Awindow *win);


/*
 * editor/uecheck.c
 */
void init_check(Awindow *win);


/*
 * editor/uecycle.c
 */
void init_cycle(Awindow *win);


/*
 * editor/ueslider.c
 */
void init_slider(Awindow *win);


/*
 * editor/ueftext.c
 */
void init_ftext(Awindow *win);


/*
 * editor/ueinner.c
 */
void init_inner(Awindow *win);


/*
 * editor/uepictur.c
 */
void init_picture(Awindow *win);


/*
 * editor/uepatter.c
 */
void init_pattern(Awindow *win);


/*
 * editor/uearrow.c
 */
void init_arrow(Awindow *win);


/*
 * editor/ueselect.c
 */
void init_select(Awindow *win);


/*
 * editor/ueeditor.c
 */
void init_editor(Awindow *win);


/*
 * list/edmouse.c
 */
extern LISTPARM list_mouse;

Obj_Head *add_mouse(ACS_HEAD *acs, Obj_Head *form);
void del_mouse(ACS_HEAD *acs, Obj_Head *form);


/*
 * editor/edmenued.c
 */
int16 me_init(Awindow *self);
Awindow *me_make(void *a);
boolean me_service(Awindow *self, int16 task, void *in_out);


/*
 * editor/edpuped.c
 */
Awindow *pu_make(void *a);
int16 pu_init(Awindow *self);



/*
 * list/edlist.c
 */
extern char proto_alert[20];
extern char ABOUT[16];
extern char al_list[];
extern char al_name[];
extern char ic_list[];
extern char ic_name[];
extern char if_list[];
extern char if_name[];
extern char im_list[];
extern char im_name[];
extern char me_list[];
extern char me_name[];
extern char mf_list[];
extern char mf_name[];
extern char ob_list[];
extern char ob_name[];
extern char proto_string[14];
extern char proto_wihelpfile[1];
extern char proto_wihelptitle[1];
extern char proto_wiinfo[1];
extern char proto_winame[10];
extern char pu_list[];
extern char pu_name[];
extern char rf_list[];
extern char rf_name[];
extern char st_list[];
extern char st_name[];
extern char te_list[];
extern char te_name[];
extern char us_list[];
extern char us_name[];
extern char wi_list[];
extern char wi_name[];

extern Awindow WI_DIFF_TYPE;
extern Awindow WI_INFO_LIST;
extern Awindow WI_INFO_LISTSELF;
extern Awindow WI_INFO_SCOPE;
extern Awindow WI_LIST;

Obj_Head *find_entry(Obj_Head *obj, const char *str);
int16 add_entry(Obj_Head *obj, Obj_Head *str);
void del_entry(Obj_Head *obj, Obj_Head *str);
Obj_Head *copy_str(ACS_HEAD *acs, const Obj_Head *src);
OBJECT *work_icon(Obj_Head *objlisttype, CICONBLK *icon, int16 );


/*
 * list/edalert.c
 */
extern LISTPARM list_alert;

void del_alert(ACS_HEAD *acs, Obj_Head *str);
Obj_Head *copy_alert(ACS_HEAD *acs, const Obj_Head *str);
boolean serv_alert(ACS_HEAD *acs, int16 task, Obj_Head *str);


/*
 * list/edstring.c
 */
extern LISTPARM list_string;

Obj_Head *add_string(ACS_HEAD *acs, Obj_Head *str);
void del_string(ACS_HEAD *acs, Obj_Head *str);
Obj_Head *dup_string(ACS_HEAD *acs, const char *str);
Obj_Head *copy_str(ACS_HEAD *acs, const Obj_Head *str);
boolean serv_str(ACS_HEAD *acs, int16 task, Obj_Head *str);
Obj_Head *change_string(ACS_HEAD *acs, Obj_Head *obj, const char *str);


/*
 * list/edimage.c
 */
extern LISTPARM list_image;

Obj_Head *add_image(ACS_HEAD *acs, Obj_Head *image);
Obj_Head *dup_image(ACS_HEAD *acs, BITBLK *bit);
void del_image(ACS_HEAD *acs, Obj_Head *image);


/*
 * list/edtedi.c
 */
extern LISTPARM list_tedi;

Obj_Head *dup_tedinfo(ACS_HEAD *acs, TEDINFO *ted);
void del_tedinfo(ACS_HEAD *acs, Obj_Head *ted);
Obj_Head *add_tedinfo(ACS_HEAD *acs, Obj_Head *obj);


/*
 * list/edicon.c
 */
extern LISTPARM list_icon;

Obj_Head *add_icon(ACS_HEAD *acs, Obj_Head *icon);
Obj_Head *dup_icon(ACS_HEAD *acs, CICONBLK *icon);
void del_icon(ACS_HEAD *acs, Obj_Head *icon);


/*
 * list/edmenu.c
 */
extern LISTPARM list_menu;

Obj_Head *add_menu(ACS_HEAD *acs, Obj_Head *menu);
void del_menu(ACS_HEAD *acs, Obj_Head *menu);


/*
 * list/eddata.c
 */
extern LISTPARM list_data;

Obj_Head *add_data(ACS_HEAD *acs, Obj_Head *data);
void del_data(ACS_HEAD *acs, Obj_Head *data);
Obj_Head *dup_data(ACS_HEAD *acs, void *data, size_t size);


/*
 * list/edobject.c
 */
extern LISTPARM list_object;

Obj_Head *add_object(ACS_HEAD *acs, Obj_Head *tree);
void del_object(ACS_HEAD *acs, Obj_Head *tree);


/*
 * list/edpopup.c
 */
extern LISTPARM list_popup;


/*
 * list/edref.c
 */
extern LISTPARM list_reference;

Obj_Head *dup_ref(ACS_HEAD *acs, const char *label, int16 type);
void del_ref(ACS_HEAD *acs, Obj_Head *label);
Obj_Head *add_ref(ACS_HEAD *acs, Obj_Head *obj);


/*
 * list/eduser.c
 */
extern LISTPARM list_user;

Obj_Head *add_user(ACS_HEAD *acs, Obj_Head *obj);
void del_user(ACS_HEAD *acs, Obj_Head *obj);
Obj_Head *change_user(ACS_HEAD *acs, Obj_Head *obj, char *str[8]);


/*
 * list/edwind.c
 */
extern LISTPARM list_window;

void del_window(ACS_HEAD *acs, Obj_Head *label);


/*
 * acsplus/pur_desk.c
 */
extern Awindow PUR_DESK;


/*
 * lib/initterm.c
 */
int16 ACSinitialize(void);
void ACSterminate(void);


/*
 * lib/vdi_data.c
 */
void ACSInitLineA(void);



/*
 * lib/main.c
 */
extern int16 _ACSv_magix;
extern char _ALIB_ERR_ACC[];
extern char const _ALIB_ERR_WINDOW[];
extern char const _ALIB_ERR_WISLOT[];
extern CICONBLK _CHK_1D_DS;
extern CICONBLK _CHK_1D_DU;
extern CICONBLK _CHK_1D_S;
extern CICONBLK _CHK_1D_U;
extern CICONBLK _CHK_3D_DS;
extern CICONBLK _CHK_3D_DU;
extern CICONBLK _CHK_3D_S;
extern CICONBLK _CHK_3D_U;
extern CICONBLK _RD_1D_DS;
extern CICONBLK _RD_1D_DU;
extern CICONBLK _RD_1D_S;
extern CICONBLK _RD_1D_U;
extern CICONBLK _RD_3D_DS;
extern CICONBLK _RD_3D_DU;
extern CICONBLK _RD_3D_S;
extern CICONBLK _RD_3D_U;
extern Awindow _WDD;
extern Awindow _W_ALERT;
/* element is MsgWaitForAnswer * */
extern ULinList *SentMsg;
/* element is A_dd_int * */
extern ULinList *ListOfApps;

int acs_call(int argc, char **argv, char **envp);
Ablk *get_acsblk(void);


/*
 * lib/nkcc.c
 */
void nkc_init(unsigned long flags, int16 vdi_handle, int16 *pglobl);


/*
 * lib/event.c
 */
int16 evkeybrd(Awindow *win);
int16 evbutton(int16 button, int16 clicks);
void evmouse(void);
void ACSeventhandler(void);


/*
 * lib/string.c
 */
extern char null_string[];


/*
 * lib/memory.c
 */
int16 INmemory(void);
void TRmemory(void);
void Ax_release(void);


/*
 * lib/menu.c
 */
void Ame_root(int16 title, int16 idx);
void Ame_drop(Awindow *win, int16 mx, int16 my);
int16 Ame_key(Awindow *win, int16 kstate, int16 key);


/*
 * lib/mouse.c
 */
int16 INmouse(void);
void TRmouse(void);
void Amo_point(void);
boolean Amo_restart(Amouse *mouse);
void Amo_return(boolean busy, Amouse *mouse);


/*
 * lib/modul/modul.c
 */
void Ax_mterm(void *);


/*
 * lib/modul/modulold.c
 */
extern funcListe funcs[];
extern long const funcsAnz;
extern void *ACS233[];
extern void *ACS230[];


/*
 * lib/mygemdos.s
 */
void accgemdos(void);
void oldgemdos(void);


/*
 * lib/window.c
 */
extern Awindow *_ACSv_winds[MAX_WINDS];
extern OBJECT *_ACSv_wiicons[MAX_WI_ICONS];
extern boolean _ACSv_wmenu;
extern int16 _Wmax_wi;

int16 INwindow(void);
void TRwindow(void);
int16 Awi_register(Awindow *win);
Awindow *Awi_setontop(Awindow *win);
void Awi_invalid(void);
void Awi_lateupdate(void);
void Awi_slider(Awindow *win);
int16 Awi_backdrop(Awindow *win);
void Awi_up_modal(void);
void Awi_show_menu(boolean show);
void Awi_cleanup(Awindow *win);
boolean Awi_shadow(Awindow *win);
int16 _init_alert(Awindow *win);


/*
 * lib/wdialog/filesel.c
 */
extern Awindow WI_FILESEL;


/*
 * lib/wdialog/printsel.c
 */
extern Awindow PrintSelWind;


/*
 * lib/wdialog/fontsel.c
 */
extern Awindow FontSelWind;


/*
 * lib/drag.c
 */
void xline2(int16 x1, int16 x2, int16 y);
void yline2(int16 y1, int16 y2, int16 x);


/*
 * lib/object.c
 */
int16 Aob_tobkey(Awindow *win, int16 kstate, int16 key);
int16 Aob_wobkey(Awindow *win, int16 kstate, int16 key);
int16 Aob_execute(Awindow *win, OBJECT *tree, int16 obnr);
boolean Aob_select(Awindow *win, OBJECT *tree, int16 obnr, boolean dclick);
int16 Aob_key(OBJECT *tree, int16 kstate, int16 key);


/*
 * lib/wobject.c
 */
boolean Aob_chdef(Awindow *window, OBJECT *tree);
boolean Awi_focuschg(Awindow *win, int16 from, int16 to);
void Aob_help(void);


/*
 * lib/backplan.c
 */
void INbackplan(void);


/*
 * lib/userdef/userobj.c
 */
int16 INuserobj(void);
void TRuserobj(void);


/*
 * lib/userdef/boxed.c
 */
void Aus_objboxed(Awindow *win, OBJECT *tree, int16 obnr);
void Aud_boxed(void);


/*
 * lib/util.c
 */
extern int16 a_dialog_active;

void Act_save(CONTEXT *ctx);
void Act_restore(CONTEXT *ctx);
boolean A_isModDia(void);
int16 Awi_sendkey(Awindow *wi, int16 kstate, int16 key);
