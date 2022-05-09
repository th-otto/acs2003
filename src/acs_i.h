#include <stdio.h>
#include <acs.h>
#include <acsaes.h>
#include <string.h>

#define __PS__   128

#define MAX_ACS   16
#define MAX_WINDS 256
#define PATH_SEP  '\\'
#define MAX_LANGS 3

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
	/*  10 */ size_t size;
	/*  14 */ size_t used;
	/*  18 */ Awindow *window;
	/*  22 */ char label[32];
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
	/*   0 */ long magic;
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
	/* 368 */ long extflags;
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

typedef struct {
	ACS_HEAD *acs;
	Obj_Head *obj;
} EDPARM;

typedef struct {
	ACS_HEAD *acs;
	Obj_Head *obj;
	Awindow *editor;
} REFPARM;

typedef struct {
	ACS_HEAD *acs;
	Obj_Head *obj;
	OBJECT *work;
	OBJECT *edit;
	void *data;
	void *mask;
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
	void *data;
} IMAGEPARM;

typedef struct {
	ACS_HEAD *acs;
	Obj_Head *obj;
	int16 image[32];
} MOUSEPARM;

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
	int16 *(*select)(void);
	void (*cleanup)(void);
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
	void (*cleanup)(void);
	char *title;
	char *help_title;
	char *help_file;
} SUBMODE;

typedef struct {
	char *string;
	int16 code;
} sc;

typedef struct {
	long full;
	long size;
	long pos;
	long step;
	int16 len;
	char text[12];
	void (*call)(void);
	void *obj;
	int16 flags;
	int16 left;
	int16 bar;
	int16 right;
	int16 oleft;
	int16 oright;
	int16 obar;
	int16 opos;
	int16 omax;
	Awiob self;
	int16 width;
	int16 height;
} ADT_SLIDER;

typedef struct {
	long full;
	long size;
	long pos;
	long step;
	Awindow *window;
	void (*call)(void);
	void *obj;
} WI_SLDIER;

typedef struct {
	char *text;
	int16 size;
	int16 flags;
} EDITLINE;

typedef struct {
	int16 color;
	int16 face;
	int16 cheight;
	int16 height;
	int16 width;
	long row;
	long col;
	int16 flags;
	long wrap;
	long start_row;
	long start_col;
	long max_col;
	long t_size;
	EDITLINE *table;
	long sel1row;
	long sel1col;
	long sel2row;
	long sel2col;
	long curv1;
	long curv2;
	int16 pheight;
	int16 pwidth;
	long orow;
	long ocol;
	Awiob self;
	OBJECT *hor;
	OBJECT *ver;
	long single;
	long till;
	int16 wraps;
	int16 select;
	void (*call)(void);
	void *obj;
	long cut1row;
	long cut1col;
	long cut2row;
	long cut2col;
	long ins2row;
	long ins2col;
	long nrow;
	char **text;
	int16 tab;
	int16 cursor;
	int16 err;
	char separator[257];
} EDITTEXT;

typedef struct {
	void (*new)(void);
	int16 sort;
	int16 max_icon;
	int16 n_row;
	int16 n_col;
} USER;

typedef struct {
	long id;
	char path[256];
	int16 count;
	Axywh box;
	long flag;
	uint16 descflags;
	void (*new)(void);
} MODDATA;

typedef struct {
	int16 key;
	char text[256];
} FKeyLine;

typedef struct {
	long id;
	int16 tab;
	int16 w;
	int16 h;
	int16 fontid;
	int16 height;
	int16 cursor;
	char ext[16];
	char filename[256];
	int16 wrap;
	int16 flags;
	char find_string[256];
	char replace_search[256];
	char replace_by[256];
	char separator[257];
	char helpacc[9];
} EDCONF;

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
	FKeyLine *fkeys[40];
	EDCONF cnf;
} EDITDATA;

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
	char name[33];
	int16 id;
	int16 points[12];
} FONTINFO;

typedef struct {
	void *expara;
	char title[128];
	long len;
	long memcount;
	long memskip;
	long count;
	uint8 *mem;
	uint8 *buff;
	long flag;
	int16 (*acc_item) (AOBJECT *aob, void *expara);
	int16 (*comp_item) (void *org, void *new, void *expara);
	int16 (*drag_item) (AOBJECT *aob, void *item, void *expara);
	int16 (*edit_item) (void *item, void *expara);
	long (*key_item) (int16 key, void *expara);
	int16 (*message) (int16 mess, void *expara);
	int16 (*print_item) (char *line, void *item, void *expara);
	int16 (*term_list) (void *expara);
} RealList;

typedef struct {
	int16 handle;
	int16 w;
	int16 h;
	MFDB *plane;
	int16 offscreen;
} GRAF_WI;

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
#define AS_GUI_10000       10000 /* in_out not used */
#define AS_GUI_SAVECFG     10001 /* in_out = Awindow * */
#define AS_GUI_SETUSED     10002 /* in_out = pathname */
#define AS_GUI_AUTOSAVE    10003 /* in_out not used */
#define AS_GUI_ISNOTUSED   10004 /* in_out = pathname */
#define AS_GENERAL_10005   10005
#define AS_GENERAL_10006   10006
#define AS_GENERAL_10007   10007
#define AS_GENERAL_10008   10008
#define AS_GENERAL_10009   10009


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


/*
 * edit2/edparts.c
 */
extern Awindow WI_PARTS;
extern Awindow *parts_window;


/*
 * edit2/edmoused.c
 */
void set_mouse(Awindow *win);


/*
 * editor/edobkeys.c
 */
char *key_string(int16 key);


/*
 * list/edmouse.c
 */
extern LISTPARM list_mouse;


/*
 * list/edlist.c
 */
extern char proto_alert[20];
extern char ABOUT[];
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
extern char proto_string[];
extern char proto_wihelpfile[];
extern char proto_wihelptitle[];
extern char proto_wiinfo[];
extern char proto_winame[];
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
void del_string(ACS_HEAD *acs, Obj_Head *str);
Obj_Head *dup_string(ACS_HEAD *acs, const char *str);
Obj_Head *copy_str(ACS_HEAD *acs, const Obj_Head *str);
boolean serv_str(ACS_HEAD *acs, int16 task, Obj_Head *str);


/*
 * list/edimage.c
 */
extern LISTPARM list_image;

Obj_Head *dup_image(ACS_HEAD *acs, BITBLK *bit);


/*
 * list/edtedi.c
 */
Obj_Head *dup_tedinfo(ACS_HEAD *acs, TEDINFO *ted);


/*
 * list/edicon.c
 */
extern LISTPARM list_icon;

Obj_Head *dup_icon(ACS_HEAD *acs, CICONBLK *icon);


/*
 * list/edmenu.c
 */
extern LISTPARM list_menu;


/*
 * list/eddata.c
 */
extern LISTPARM list_data;


/*
 * list/edobject.c
 */
extern LISTPARM list_object;


/*
 * list/edpopup.c
 */
extern LISTPARM list_popup;


/*
 * list/edref.c
 */
extern LISTPARM list_reference;

Obj_Head *dup_ref(ACS_HEAD *acs, const char *title, int16 type);
void del_ref(ACS_HEAD *acs, Obj_Head *label);


/*
 * list/edmouse.c
 */
MFORM *add_mouse(ACS_HEAD *acs, void *form);
void del_mouse(ACS_HEAD *acs, MFORM *form);


/*
 * list/edstring.c
 */
extern LISTPARM list_string;


/*
 * list/edtedi.c
 */
extern LISTPARM list_tedi;


/*
 * list/eduser.c
 */
extern LISTPARM list_user;


/*
 * list/edwind.c
 */
extern LISTPARM list_window;

void del_window(ACS_HEAD *acs, Obj_Head *label);


/*
 * lib/main.c
 */
extern char const _A_ERR_WISLOT[];


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
extern int16 _Wmax_wi;

int16 Awi_register(Awindow *win);


/*
 * lib/messages/msgserv.c
 */
extern ULinListe *globProtData;

int16 Aev_message(int16 *msg);


/*
 * lib/wdialog/filesel.c
 */
extern Awindow WI_FILESEL;


/*
 * lib/mouse.c
 */
int16 Amo_restart(Amouse *mouse);
void Amo_return(int16 busy, Amouse *mouse);
