#include <stdio.h>
#include <acs.h>
#include <acsaes.h>
#include <string.h>

#ifdef __GNUC__
/* no need to attempt to generate identical image */
#undef WITH_FIXES
#define WITH_FIXES 1
#endif

#define __PS__   128

#define MAX_ACS   16
#define MAX_WINDS 256
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
 * extra mouse forms
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
	char *grp_name;
	int16 anzahl;
	char **cfg_strings;
} ACSCfgGruppe;

typedef struct {
	UCfgInfo info;
	int16 changed;
	int16 grp_anzahl;
	ACSCfgGruppe **cfg_grp;
	int16 flags;
	int16 head_anz;
	char **header;
} ACSConfig;

typedef struct {
	char *grp_name;
	ACSCfgGruppe *gruppe;
	char *name;
	char *value;
	int16 index;
} ACSCfgSearchStruct;

typedef struct {
	int16 v[8];
} outline;

typedef struct {
	char *popup;
	long len;
} ddPopStruc;

#if 0
/* local to editwi */
typedef struct {
	int16 xr;
	int16 yr;
	int16 x1;
	int16 x2;
	int16 y1;
	int16 y2;
	int16 m[8];
} t;
#endif

typedef struct {
	Awindow *window;
	OBJECT *object;
	int16 obnr;
	int16 mmox;
	int16 mmoy;
	int16 mmokstate;
	int16 busy;
	Amouse mouse;
} CONTEXT;

typedef struct _ACSLinListElemStruct ACSLinListElemStruct;
struct _ACSLinListElemStruct
{
	ACSLinListElemStruct *next;
	ACSLinListElemStruct *last;
	void *data;
};

typedef struct
{
	int32 block_size;
	char *descr_text;
	int16 max_liste;
	int16 aktuell_liste;
	int16 max_used;
	int16 opt_anzahl;
	/* ^^^ same as MemFreeBlockStat */
	ACSLinListElemStruct *liste;
} MemFreeBlockList;

typedef struct memx {
	struct memx *prev;
	long used;
	void *entry[32];
} MEMX;

typedef struct {
	int16 count;
	int16 *planes;
} a_hcicon;

typedef struct {
	const char *cmd;
	void (*gs_fkt)(void);
} gs_cmd;

typedef struct {
	ThermoData aktData;
	const char *title;
	int16 prozent;
	int16 thermArt;
	int16 thermComp;
	int16 color;
	int16 running;
	long timer;
	Awindow *thermo;
} ThermoStruct;

typedef struct {
	int16 *message;
	Axywh area;
	Awindow *window;
	AOBJECT *drag_aob;
	OBJECT *drag_obj;
	int16 drag_obnr;
	int16 drag_obednr;
	int16 scroll;
} MsgFktParams;

typedef struct {
	int16 MsgNr;
	void (*MsgFunktion)(void);
	char WindOffset;
	char XOffset;
	char YOffset;
	char WOffset;
	char HOffset;
	char draginfos;
	int16 scrolloffset;
} MsgService;

typedef struct {
	int16 dest_id;
	Awindow *window;
	int16 timeout;
	int16 type;
	int16 message[8];
} MsgWaitForAnswer;

typedef struct {
	int16 dest_id;
	int16 type;
	int16 *ref_msg[8];
} MsgSearchForOriginal;

typedef struct {
	int16 msg_id;
	long timestamp;
	void *globData;
} XAccData;

typedef struct {
	int16 msg_id;
	long timestamp;
	void *globData;
} AVData;

typedef struct {
   int16       id;            /* The AES-ID of another PRG        */
   int32       type;          /* Same bitvec as dd_active         */
   uint16      xacc_val;      /* DD-dependant-value: XACC->groups */
   const char  *xacc_name;    /* Name of Partner, or NULL         */
   uint16      va_val[3];     /* Status-Bits of VA_PROTOSTATUS    */
   const char  *va_name;      /* The VA-Name                      */
   /* ^^^ same as A_dd */
   XAccData xacc_data;
   AVData *va_data;
} A_dd_int;

typedef struct {
	int16 *message;
	Awindow *wd;
	int16 timeout;
	int16 type;
} MsgAllStruct;

typedef struct {
	int16 ap_id;
	GS_INFO info;
	int16 gs_id;
	int16 status;
} gs_con;

typedef struct {
	int16 ap_id;
	int16 gs_id;
	int16 status;
	int16 set_flag;
} gs_search;

typedef struct {
	int16 message[8];
	A_GSAntwort antwort;
} gs_answer;

typedef struct {
	OLGA_Infos info;
	int16 olga_flags;
	int16 grp_id;
	int16 server_id;
	int16 info_index;
	int16 aktiv;
	int16 aktiv_anz;
	int16 delete;
} OLGA_Data;

typedef struct {
	int16 col;
	char *text;
	Awiob self;
} FTEXTDATA;

typedef struct {
	char *act;
	char *pos;
	char *popup;
	Awiob self;
} CYCDATA;

typedef struct {
	char act[256];
	char text[256];
	char *mask;
	Awiob wiob;
	int16 len;
	int16 *pos;
	int16 *blklen;
	int16 prevpos;
	int16 prevblklen;
	int16 offset;
	int16 cw;
	int16 ch;
	int16 flag;
} EDT_DATA;

typedef struct {
	/*  0 */ const char *title;
	/*  4 */ int16 x;
	/*  6 */ int16 y;
	/*  8 */ int16 *handle;
	/* 12 */ char *path;
	/* 16 */ int16 pathlen;
	/* 18 */ char *fname;
	/* 22 */ int16 fnamelen;
	/* 24 */ char *patterns;
	/* 28 */ XFSL_FILTER *filter;
	/* 32 */ char *paths;
	/* 36 */ int16 sort_mode;
	/* 38 */ int16 flags;
	/* 40 */ void *dialog;
	/* 44 */ boolean modal;
	/* 46 */ int16 button;
	/* 48 */ int16 nfiles;
	/* 50 */ Awindow *meldung;
	/* 54 */ Awindow *window;
	/* 58 */ ULinListe *liste;
	/* 62 */ 
} A_FileSelData;

typedef struct {
	char *title;
	int16 x;
	int16 y;
	PRN_SETTINGS *printData;
	void **dialog;
	int16 option;
	boolean is_my_setting;
	boolean is_print_dialog;
	int16 flags;
	boolean modal;
	int16 button;
	int16 choosed;
	Awindow *meldung;
	Awindow *window;
} A_PrintSelData;

typedef struct {
	int16 x;
	int16 y;
	int16 button_flag;
	void **dialog;
	const char *sample;
	const char *opt_button;
	int16 font_flag;
	A_FontSel fontData;
	int16 flags;
	boolean modal;
	int16 choosed;
	int16 toClose;
	void *para;
	void (*set)(void);
	void (*mark)(void);
	void (*opt)(void);
	Awindow *meldung;
	Awindow *window;
} A_FontSelData;

typedef struct _ACSLinListStruct {
	ACSLinListElemStruct *Beginn;
	ACSLinListElemStruct *Ende;
	long Anzahl;
	ACSLinListElemStruct *LaufVar;
	long LaufVarNr;
} ACSLinListStruct;

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

/* values for ub_parm of button objects */
#define ACS_BUTTON_COLOR    0x0000000FL

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
#define ACS_3DBUTTON_NOFILL    0x80000000L /* part of bfopspec.character */
#define ACS_3DBUTTON_SMALL     0x40000000L /* part of bfopspec.character */
#define ACS_3DBUTTON_HORPOS    0x30000000L /* part of bfopspec.character */
#define ACS_3DBUTTON_HORPOS_LEFT   0x00000000L
#define ACS_3DBUTTON_HORPOS_CENTER 0x20000000L
#define ACS_3DBUTTON_HORPOS_RIGHT  0x10000000L
#define ACS_3DBUTTON_INCOL     0x0F000000L /* part of bfopspec.character */
#define ACS_3DBUTTON_OFFSET    0x00F00000L /* part of bfopspec.framesize */
#define ACS_3DBUTTON_FRAMESIZE 0x000F0000L /* part of bfopspec.framesize */
#define ACS_3DBUTTON_OUTCOL    0x0000F000L /* same as bfopspec.framecol */
#define ACS_3DBUTTON_TEXTCOL   0x00000F00L /* same as bfopspec.textcol */
#define ACS_3DBUTTON_TEXTMODE  0x00000080L /* same as bfopspec.textmode */
#define ACS_3DBUTTON_PATTERN   0x00000070L /* same as bfopspec.fillpattern */
#define ACS_3DBUTTON_INTERCOL  0x0000000FL /* same as bfopspec.interiorcol */

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

void save(Awindow *self);
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
 * acsplus/deskop.c
 */
Awindow *get_desktop(void);


/*
 * acsplus/pur_desk.c
 */
extern Awindow PUR_DESK;

Awindow *get_pur_desk(void);
Awindow *get_module_window(void);


/*
 * acsplus/editwi.c
 */
Awindow *get_editor(void);


/*
 * acsplus/list.c
 */
Awindow *get_list(void);


/*
 * acsplus/protocol.c
 */
Awindow *get_protocol(void);


/*
 * acsplus/plotter.c
 */
Awindow *get_plotter(void);


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
extern void *SentMsg;
extern void *ListOfApps;


/*
 * lib/event.c
 */
int16 evkeybrd(int16 *msg);
int evbutton(int16 mox, int moy);
void evmouse(void);
void ACSeventhandler(void);


/*
 * lib/memory.c
 */
void INmemory(void);
void TRmemory(void);
void Ax_release(void *memory);


/*
 * lib/menu.c
 */
void Ame_root(int16 title, int16 idx);
void Ame_drop(OBJECT *menu, int16 title, int16 idx);
int16 Ame_key(OBJECT *menu, int16 kstate, int16 key);


/*
 * lib/mouse.c
 */
void INmouse(void);
void TRmouse(void);
void Amo_point(void);
int16 Amo_restart(Amouse *mouse);
void Amo_return(int16 busy, Amouse *mouse);


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

AUSERBLK *Aus_create23x(const AUSERBLK *user);
OBJECT *Aob_create23x(const OBJECT *parent);
Awindow *Awi_create23x(const Awindow *x);
void Awi_arrowed23x(Awindow *window, int16 which);
char *Af_first230(const char *start);
char *Af_next230(void);


/*
 * lib/mygemdos.s
 */
void accgemdos(void);
void oldgemdos(void);


/*
 * lib/window.c
 */
extern Awindow *_ACSv_winds[MAX_WINDS];
extern CICONBLK *_ACSv_wiicons[MAX_WINDS];
extern int16 _ACSv_wmenu;
extern int16 _Wmax_wi;

void INwindow(void);
void TRwindow(void);
int16 Awi_register(Awindow *win);
void Awi_setontop(Awindow *win);
void Awi_invalid(void);
void Awi_lateupdate(void);
void Awi_slider(Awindow *win);
int16 Awi_backdrop(Awindow *win);
Awindow *Awi_up_modal( void );
void Awi_show_menu(boolean show);
void Awi_cleanup(Awindow *win);
void Awi_shadow(Awindow *win);
int16 _init_alert(Awindow *win);


/*
 * lib/messages/msgserv.c
 */
extern ULinListe *globProtData;

void INMsgService(void);
void TRMsgService(void);
int16 Aev_message(int16 *msg);
int16 Aev_CmpMsgInList(void *list, int16 *msg);
int16 Aev_CmpDestID(void *list, int16 *msg);
void Aev_SearchMsg(void *a0);
boolean Aev_DeleteMsg(void *a0);
int16 Aev_SendMsg(int16 d0, int16 d1, void *a0, void *a1, int16 d2);
void Aev_SendMsg2all(void *a0, void *a1);
boolean Aev_SendAllMsg(void *a0, int16 d0, void *a1, int16 d1);
void *Aev_DDSearch(int16 id);
boolean Aev_DDAdd(int16 d0, int16 d1, void *a0, void *a1);
boolean Aev_DDDelete(int16 id);
boolean Aev_DDRemove(void *a0);
void Ash_sendmsg(int16 d0, int16 d1, void *a0);
boolean GetImgIntoObj(void *a0, void *a1, int16 d0);
boolean GetTxtIntoObj(void *a0, void *a1, int16 d0, int16 d1);


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
int16 Aob_tobkey(OBJECT *tree, int16 kstate, int16 key);
int16 Aob_wobkey(OBJECT *tree, int16 kstate, int16 key);
int16 Aob_execute(Awindow *win, OBJECT *tree, int16 obnr);
int16 Aob_select(Awindow *win, OBJECT *tree, int16 kstate, int16 key);
void Aob_key(Awindow *win, int16 key);


/*
 * lib/wobject.c
 */
void Awi_chdef(Awindow *window, Axywh *xywh);
boolean Awi_focuschg(Awindow *win, int16 from, int16 to);
void Aob_help(void);


/*
 * lib/backplan.c
 */
void INbackplan(void);


/*
 * lib/messages/screen.c
 */
boolean Aev_GetMnSelected(MsgFktParams *params);
boolean Aev_GetWmRedraw(MsgFktParams *params);
boolean Aev_GetWmTopped(MsgFktParams *params);
boolean Aev_GetWmClosed(MsgFktParams *params);
boolean Aev_GetWmFulled(MsgFktParams *params);
boolean Aev_GetWmArrowed(MsgFktParams *params);
boolean Aev_GetWmMouseWheel(MsgFktParams *params);
boolean Aev_GetWmHSlid(MsgFktParams *params);
boolean Aev_GetWmVSlid(MsgFktParams *params);
boolean Aev_GetWmSized(MsgFktParams *params);
boolean Aev_GetWmMoved(MsgFktParams *params);
boolean Aev_GetWmBottomed(MsgFktParams *params);
boolean Aev_GetWmOnTop(MsgFktParams *params);
boolean Aev_GetWmUnTopped(MsgFktParams *params);
boolean Aev_GetWmToolbar(MsgFktParams *params);
boolean Aev_GetWmShaded(MsgFktParams *params);
boolean Aev_GetWmUnshaded(MsgFktParams *params);
boolean Aev_GetWmIconify(MsgFktParams *params);
boolean Aev_GetWmAllIconify(MsgFktParams *params);
boolean Aev_GetWmUnIconify(MsgFktParams *params);
boolean Aev_GetApTerm(MsgFktParams *params);
boolean Aev_GetScChanged(MsgFktParams *params);
boolean Aev_GetFntChanged(MsgFktParams *params);
boolean Aev_GetPrnChanged(MsgFktParams *params);
boolean Aev_GetColorsChanged(MsgFktParams *params);
boolean Aev_GetAcClose(MsgFktParams *params);
boolean Aev_GetAcOpen(MsgFktParams *params);


/*
 * lib/messages/xacc.c
 */
boolean Aev_InitXAcc(void);
boolean Aev_ExitXAcc(void);
void XAccDataDelete(void *a0);
int16 Aev_GetAccID(void *a0);
int16 Aev_GetAccAck(void *a0);
int16 Aev_GetAccAcc(void *a0);
int16 Aev_GetAccKey(void *a0);
int16 Aev_GetAccText(void *a0);
int16 Aev_GetAccImg(void *a0);
int16 Aev_GetAccMeta(void *a0);
boolean Aev_AccText(int16 dest_id, void *a0, void *a1, int16 d1);


/*
 * lib/messages/av.c
 */
boolean Aev_InitVA(void);
boolean Aev_ExitVA(void);
void VaDataDelete(void);
boolean Aev_GetAvExit(MsgFktParams *params);
boolean Aev_GetVaProtoStatus(MsgFktParams *params);
boolean Aev_GetVaStart(MsgFktParams *params);
boolean Aev_GetAvStarted(MsgFktParams *params);
boolean Aev_GetAvSendKey(MsgFktParams *params);
boolean Aev_GetAvSendClick(MsgFktParams *params);
boolean Aev_GetVaPathUpdate(MsgFktParams *params);


/*
 * lib/messages/dd.c
 */
boolean Aev_InitDD(void);
boolean Aev_ExitDD(void);
boolean Aev_GetAPDragDrop(MsgFktParams *params);
boolean Aev_APDragDropMemory(int16 dp, int16 d1, int16 d2, void *a0, void *a2);


/*
 * lib/messages/dhst.c
 */
boolean Aev_InitDHST(void);
boolean Aev_ExitDHST(void);
boolean Aev_GetDhstAdd(MsgFktParams *params);
boolean Aev_GetDhstAck(MsgFktParams *params);


/*
 * lib/messages/bubble.c
 */
boolean Aev_InitBubble(void);
boolean Aev_ExitBubble(void);
boolean Aev_GetAckBubbleGEM(MsgFktParams *params);
boolean Aev_GetAskFontBubbleGEM(MsgFktParams *params);
boolean Aev_GetRequestBubbleGEM(MsgFktParams *params);
boolean Aev_ShowBubbleGEM(void *a0, int16 d0, int16 d1);
boolean Aev_HideBubbleGEM(int16 d0);


/*
 * lib/messages/gemscr.c
 */
boolean Aev_InitGEMScript(void);
boolean Aev_ExitGEMScript(void);
boolean Aev_GetGSRequest(MsgFktParams *params);
boolean Aev_GetGSQuit(MsgFktParams *params);
boolean Aev_GetGSCommand(MsgFktParams *params);
boolean Aev_GetGSAck(MsgFktParams *params);
int16 _gs_strcmp(const char *str1, const char *str2);


/*
 * lib/messages/olga.c
 */
boolean Aev_InitOlga(void);
boolean Aev_ExitOlga(void);
boolean Aev_GetOlgaInit(MsgFktParams *params);
boolean Aev_GetOleExit(MsgFktParams *params);
boolean Aev_GetOleNew(MsgFktParams *params);
boolean Aev_GetOlgaAck(MsgFktParams *params);
boolean Aev_GetOlgaUpdated(MsgFktParams *params);
boolean Aev_GetOlgaGetInfo(MsgFktParams *params);
boolean Aev_GetOlgaCLientTerminated(MsgFktParams *params);
boolean Aev_GetOlgaIdle(MsgFktParams *params);
boolean Aev_OleInit(void);
boolean Aev_OleExit(void);
void A_OlgaCreate(void *a0, void *a1, int16 d0);
boolean A_OlgaDelete(int16 d0);


/*
 * lib/messages/stguide.c
 */
boolean Aev_InitSTGuide(void);
boolean Aev_ExitSTGuide(void);
void CheckSTGuide(void *a0);


/*
 * lib/messages/seproto.c
 */
boolean Aev_InitSE(void);
boolean Aev_ExitSE(void);


/*
 * lib/messages/ssp.c
 */
boolean Aev_InitSSP(void);
boolean Aev_ExitSSP(void);


/*
 * lib/messages/pc_help.c
 */
boolean Aev_InitPCHelp(void);
boolean Aev_ExitPCHelp(void);
void CheckPcHelp(void *a0);
boolean Aev_GetAcReply(MsgFktParams *params);


/*
 * lib/userdef/userobj.c
 */
int16 INuserobj(void);
void TRuserobj(void);


/*
 * lib/userdef/boxed.c
 */
void Aus_objboxed(void *a0, void *a1, int16 d0);
void Aud_boxed(void);


/*
 * lib/util.c
 */
extern int16 a_dialog_active;

void Act_save(void *a0);
void Act_restore(void *a0);
boolean A_isModDia(void);
void Adate_ymd2dow(void);
int16 Awi_sendkey(Awindow *wi, int16 kstate, int16 key);
