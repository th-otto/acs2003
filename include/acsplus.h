/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    REVISION:         17. April 2001                                        */
/*    DESCRIPTION:      Headerdatei der ”ffentlichen Konstanten, Strukturen   */
/*                      und Routinen des Entwicklungssystems ACSpro           */
/*                                                                            */
/*    Extensions to ACS                                                       */
/*                                                                            */
/*    Userdef Objects:                                                        */
/*                (Wi)Sliders       100 .. 199                                */
/*                Editor            200 .. 299                                */
/*                (Ftext            300 .. 399)                               */
/*                (Cycle            400 .. 499)                               */
/*                (Picture          500 .. 599)                               */
/*                                                                            */
/*    Predefined Windows, (Menu Calls)                                        */
/*                DESKTOP           100 .. 199                                */
/*                EDITOR            200 .. 299                                */
/*                PROTOCOL          200 .. 299                                */
/*                PLOTTER           300 .. 399                                */
/*                LIST_WINDOW       400 .. 499                                */
/*                                                                            */
/*    Prefefined Dialogs                                                      */
/*                Fontsel                                                     */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Els„sser             */
/******************************************************************************/

#ifndef __ACS_PLUS__
#define __ACS_PLUS__

/******************************************************************************/

#include    <stdarg.h>

/*
--------------------------------------------------------------
      Userdefined Objects
--------------------------------------------------------------
*/

/*
      SLIDER

      ub_code = A_slider
      ub_parm = Bit 0      0 = horizontal, 1 = vertical
                Bit 1      0 = flat, 1 = 3D
                Bit 2      0 = normal, 1 = no slider (only arrows)
      ub_serv = Auo_slider
      ub_ptr1 = 'object'
      ub_ptr2 = unused
      ub_ptr3 = unused

      click    = Aus_slider

      supports also:
            AUO_CREATE           AUO_TERM
            AUO_GETVAL           AUO_SETVAL
            AUO_UPDATE           AUO_WINDOW
            AUO_FULLUPDATE
*/

#define AUO_SLIDER_VERTICAL 0x0001UL
#define AUO_SLIDER_3D       0x0002UL
#define AUO_SLIDER_NOSLIDER 0x0004UL

typedef struct {
   char* (*call) (void* obj, long pos);
   void* obj;
} SLLIVE;

/* Nachrichten des Slider-Objektes */
#define AUO_SLFULL            (100)    /* set full, int32 * */
#define AUO_SLSIZE            (101)    /* set size, int32 * */
#define AUO_SLSTEP            (102)    /* set step, int32 * */
#define AUO_SLCALL            (103)    /* set display routine and its object, SLLIVE * */
#define AUO_SLLEN             (104)    /* set display char length, int16 * (wrong in docu) */
#define AUO_SLLIVE            (105)    /* call live update routine */
#define AUO_SLWIPOS           (106)    /* accept pos as received from WM_HSLID / WM_VSLID, int16 * */
#define AUO_SLGETPOS          (107)    /* get actual pos, int32 * */

int16 CDECL A_slider (PARMBLK* pb);    /* Draw routine */
boolean Auo_slider (OBJECT *entry, int16 task, void* in_out);    /* Standard service routine */
void Aus_slider (void);                      /* standard click routine */

/*
 * Userdef controls Windowslider like slider (as far as possible)
 */

int16 CDECL A_wislider (PARMBLK* pb);     /* 'Draw' routine */
boolean Auo_wislider (OBJECT *entry, int16 task, void* in_out);     /* Standard service routine */

/*
      EDITOR

      ub_code = A_editor
      ub_parm = unused
      ub_serv = Auo_editor
      ub_ptr1 = 'object'
      ub_ptr2 = unused
      ub_ptr3 = unused

      click    = Aus_editor

      supports also:
            AUO_CREATE           AUO_TERM
            AUO_GETVAL           AUO_SETVAL
            AUO_UPDATE
*/

typedef struct {
   long row1;           /* range of substitution */
   long col1;
   long row2;
   long col2;
   long nrow;           /* number of new lines */
   char **text;         /* all lines */
} EDITSUBS;

typedef struct {
   long row;            /* which line */
   long size;           /* char size of line */
   const char *text;    /* pointer to line */
} EDITGETS;

typedef struct {
   long row1;           /* range of selection */
   long col1;
   long row2;
   long col2;
} EDITSEL;

typedef struct {
   void (*call) (void* obj, const char *text);
   void* obj;
} EDITLIVE;

int16 CDECL A_editor (PARMBLK *pb);          /* Draw routine */
boolean Auo_editor (OBJECT *entry, int16 task, void* in_out);    /* Standard service routine */
void Aus_editor (void);                            /* standard click routine */

/*
 *    ACS Plus Windows
 */

/* Nachrichten des Desktops DESKTOP */
#define AS_PLACEICON       (100)          /* place icon, in_out = the window */
#define AS_REMICON         (101)          /* remove icon, int16 * */
#define AS_GHOSTICON       (102)          /* change to ghost icon, int16 * */
#define AS_NORMICON        (103)          /* chance from ghost icon to normal icon, int16 * */
#define AS_NEWCALL         (104)          /* set new call */
#define AS_BACKOBJECT      (105)          /* Set Background Objekt, (ob_type, ob_spec) ACSinit0 ! */
#define AS_ICONNEW         (106)          /* Set New-Icon, ACSinit0 ! (wi == NULL) */
#define AS_ICONTRASH       (107)          /* Set Trash-Icon, ACSinit0 ! (wi == NULL) */
#define AS_ICONWINDOW      (108)          /* Set Default-Icon, ACSinit0 ! (wi == NULL) */
#define AS_UPDATEICON      (109)          /* updates icon, int16 * */

void Awd_quit (void);
void Awd_open (void);
void Awd_close (void);
void Awd_delete (void);
void Awd_info (void);
void Awd_hor (void);
void Awd_list (void);
void Awd_ver (void);
void Awd_behaviour (void);
void Awd_save (void);
void Awd_module (void);

extern Awindow DESKTOP;

void Apd_close (void);
void Apd_delete (void);
void Apd_info (void);
void Apd_list (void);
void Apd_module (void);
void Apd_new (void);
void Apd_open (void);
void Apd_quit (void);
extern Awindow PUR_DESK;

/*
   "printf"-Interface for 'EDITOR'
*/

int16 uputs (char* text, OBJECT *entry);
int16 uvprintf (OBJECT* entry, const char* format, va_list arglist);
int16 uprintf (OBJECT* entry, const char* format, ... );

   /*
    * Routines from EDITOR-Menu
    */

void Aed_wrap (void);
void Aed_toclip (void);
void Aed_fromclip (void);
void Aed_copy (void);
void Aed_cut (void);
void Aed_cutline (void);
void Aed_find (void);
void Aed_findnext (void);
void Aed_findsel (void);
void Aed_fkey (void);
void Aed_gotoline (void);
void Aed_info (void);
void Aed_open (void);
void Aed_merge (void);
void Aed_paste (void);
void Aed_quit (void);
void Aed_replace (void);
void Aed_replacenext (void);
void Aed_save (void);
void Aed_saveas (void);
void Aed_saveoptions (void);
void Aed_selall (void);
void Aed_swap (void);
void Aed_font (void);
void Aed_option (void);
void Aed_undo (void);

/*
 *    EDITOR
 */

/* Nachrichten des Editor-Objektes */
#define AUO_EDVERSLIDER       (200)          /* register vertical slider, Awiob * */
#define AUO_EDHORSLIDER       (201)          /* register horizontal slider, Awiob * */
#define AUO_EDGETROW          (202)          /* get pointer on line, EDITGETS * */
#define AUO_EDNEWLINE         (203)          /* append newline */
#define AUO_EDAPPLINE         (204)          /* append text, char * */
#define AUO_EDWRAP            (205)          /* set wrap lines, long * */
#define AUO_EDDELETE          (206)          /* delete all text */
#define AUO_EDFONT            (207)          /* font ID, int16 * */
#define AUO_EDHEIGHT          (208)          /* font height, int16 * */
#define AUO_EDCOLOR           (209)          /* font color, int16 * */
#define AUO_EDCFULL           (210)          /* columns (max 512), int16 * */
#define AUO_EDCURON           (211)          /* cursor on */
#define AUO_EDCUROFF          (212)          /* cursor off */
#define AUO_EDCURHIDE         (213)          /* hide cursor */
#define AUO_EDCURSHOW         (214)          /* show cursor */
#define AUO_EDCURPOS          (215)          /* set cursor pos, long * (wrong in docu) */
#define AUO_EDGETPOS          (216)          /* get line, long * */
#define AUO_EDHCOL            (217)          /* set home col, long * */
#define AUO_EDHROW            (218)          /* set home row, long * */
#define AUO_EDVIEW            (219)          /* set cursor pos in visible range */
#define AUO_ED1SELECT         (220)          /* select exactly one */
#define AUO_ED01SELECT        (221)          /* select one or nothing */
#define AUO_EDNSELECT         (222)          /* select continous */
#define AUO_EDNMSELECT        (223)          /* select discontinuos */
#define AUO_EDCHARSELECT      (224)          /* select charmode */
#define AUO_EDBLKSELECT       (225)          /* select blockchar mode */
#define AUO_EDUNSELECT        (226)          /* unselect */
#define AUO_EDGETSELECT       (227)          /* get selection block, EDITSEL * */
#define AUO_EDSETSELECT       (228)          /* set selection block, EDITSEL * */
#define AUO_EDCALL            (229)          /* set live selection call */
#define AUO_EDLIVE            (230)          /* call live routine */
#define AUO_EDGETCURPOS       (231)          /* get cursor pos, long * */
#define AUO_EDGETLENGTH       (232)          /* get length of act line, long * */
#define AUO_EDGETROWS         (233)          /* get count of rows, long * */
#define AUO_EDSUB             (234)          /* substitute val, EDITSUBS * */
#define AUO_EDUNDO            (235)          /* UNDO */
#define AUO_EDTABSIZE         (236)          /* Tabsize (def = 4), int16 * */
#define AUO_EDCLEARUNDO       (237)          /* Clear UNDO Buffer */
#define AUO_EDRESIZE          (238)          /* Size has been modified, update internal vals */
#define AUO_EDUPDATE          (239)          /* update without sliders */
#define AUO_EDGETTABSIZE      (240)          /* get Tabsize, int16 * */
#define AUO_EDBLOCKMODE       (241)          /* ? Blockmode, boolean *, TRUE / FALSE */
#define AUO_EDFIND            (242)          /* Find string, char * */
#define AUO_EDBACKWARD        (243)          /* Find direction backwards */
#define AUO_EDFORWARD         (244)          /* Find direction forward */
#define AUO_EDCASE            (245)          /* Case sensitive */
#define AUO_EDNOCASE          (246)          /* Not Case sensitive */
#define AUO_EDWORD            (247)          /* Word search */
#define AUO_EDNOWORD          (248)          /* No word search */
#define AUO_EDRESET           (249)          /* Set to unchanged */
#define AUO_EDGETCHANGED      (250)          /* changed status, boolean * */
#define AUO_EDGETNEED         (251)          /* returns byte count needed for save, long * */
#define AUO_EDSELECTWORD      (252)          /* select word at cursor pos */
#define AUO_EDSLIDERS         (253)          /* updates sliders */
#define AUO_EDCURSOR          (254)          /* set cursorform, int16 * */
#define AUO_EDGETVCURPOS      (255)          /* get !visible! cursor pos, long * */
#define AUO_EDGETHCOL         (256)          /* get col number of visibile leftmost col */
#define AUO_EDGETHROW         (257)          /* get row number of first visible row */
#define AUO_EDGETERROR        (258)          /* get error flag (actually memory alloc errors only), int16 * */
#define AUO_EDRESETERROR      (259)          /* reset error flag */
#define AUO_EDPUTINFO         (260)          /* put info, not supported anymore */
#define AUO_EDDIRTY           (261)          /* set's ditry-flag */
#define AUO_EDSETSEPARATOR    (262)          /* set's word-seps */
#define AUO_EDGETSEPARATOR    (263)          /* vice-versa */

/* Nachrichten des Editor-Fensters EDITOR */
#define AS_EDGETENTRY      (200)                /* return Editors OBJECT-Entry, OBJECT ** */
#define AS_EDEXT           (201)                /* Set Extension, char * */
#define AS_EDLOADFILE      (202)                /* Load file, Path char * */
#define AS_EDTITLE         (203)                /* Set normal Title format %s will by substituted by filename, char * */
#define AS_EDTITLEDIRTY    (204)                /* Set dirty Title format %s will by substituted by filename, char * */
#define AS_EDPUTSTRING     (205)                /* Put NUL terminate string LineSep LF / CRLF, char * */
#define AS_EDGETSTRING     (206)                /* Get NUL terminate string LineSep LF / CRLF, char * */
#define AS_EDGETNEED       (207)                /* get memory size of string */
#define AS_EDWINDOW        (208)                /* set controlling window */
#define AS_EDTERM          (209)                /* send to controlling window, editor will terminate, Awindow* editor */
#define AS_EDSAVE          (210)                /* send to controlling window, editor/user wants to save, Awindow* editor */
#define AS_EDCLEAN         (211)                /* define contents clean/unmodified */
#define AS_EDHOME          (212)                /* set cursor at home position */
#define AS_EDICONTEXT      (213)                /* set icontext */
#define AS_EDSAVEIT        (214)                /* text should be saved */
#define AS_EDGETFNAME      (215)                /* places filename into inout */
extern Awindow EDITOR;

/*
      Protocol Window
*/

typedef struct {
   int16 fontid;
   int16 height;
   int16 col;
   int16 row;
   int16 tabsize;
   int16 wrap;
   int16 x;
   int16 y;
} PROTOCOLDATA;

/*
   "printf"-Interface
*/
int16 wputs (const char *text, Awindow *wi);
int16 wvprintf (Awindow *wi, const char *format, va_list arglist);
int16 wprintf (Awindow *wi, const char *format, ... );

extern Awindow PROTOCOL;         /* parameter NULL, or PROTOCOLDATA */

/*
      Plotter Window
*/

/* Nachrichten des Plotter-Fensters PLOTTER */
#define AS_PLOTHANDLE        (300)             /* Plot windows VDI-handle, int16 * */
#define AS_PLOTMFDB          (301)             /* Plot windows MFDB, MFDB**  */
#define AS_PLOTSIZE          (302)             /* resize MFDB, int16 [2] (w, h) */
#define AS_PLOTENTRY         (303)             /* return Plotters OBJECT-Entry, OBJECT **   */

/*
   VDI-like Interface
*/

void w_pline (Awindow *wi, int16 count, int16 *pxy);
void w_pmarker (Awindow *wi, int16 count, int16 *pxy);
void w_gtext (Awindow *wi, int16 x, int16 y, char* string);
void w_fillarea (Awindow *wi, int16 count, int16 *pxy);
void w_contourfill (Awindow *wi, int16 x, int16 y, int16 index);
void wr_recfl (Awindow *wi, int16 *pxy);
void w_bar (Awindow *wi, int16 *pxy);
void w_arc (Awindow *wi, int16 x, int16 y, int16 rad, int16 begang, int16 endang);
void w_pieslice (Awindow *wi, int16 x, int16 y, int16 rad, int16 begang, int16 endang);
void w_circle (Awindow *wi, int16 x, int16 y, int16 rad);
void w_ellipse (Awindow *wi, int16 x, int16 y, int16 xrad, int16 yrad);
void w_ellarc (Awindow *wi, int16 x, int16 y, int16 xrad, int16 yrad, int16 begang, int16 endang);
void w_ellpie (Awindow *wi, int16 x, int16 y, int16 xrad, int16 yrad, int16 begang, int16 endang);
void w_rbox (Awindow *wi, int16 *pxy);
void w_rfbox (Awindow *wi, int16 *pxy);
void w_justified (Awindow *wi, int16 x, int16 y, char* string, int16 length, int16 word_space, int16 char_space);

void w_draw (Awindow *wi, int16 x1, int16 y1, int16 x2, int16 y2);
void w_update (Awindow *wi);        /* update */
void w_clr (Awindow *wi);           /* clear */
void w_inv (Awindow *wi);           /* invert */


typedef struct {
   int16 x;
   int16 y;
   int16 w;
   int16 h;
} PLOTTERDATA;

extern Awindow PLOTTER;

/*
   List-Window
*/

typedef struct
{  long  idx;
   void  *item;
}  LISTITEM;

/* Nachrichten des Listen-Fensters LIST */
#define AS_LIST_UPDATE              (400)    /* NULL */
#define AS_LIST_COUNT               (401)    /* *long */
#define AS_LIST_ADD                 (402)    /* *void */
#define AS_LIST_DELETE              (403)    /* *long */
#define AS_LIST_GET                 (404)    /* *LISTITEM */
#define AS_LIST_GET_DIRTY           (405)    /* *int16 */
#define AS_LIST_REPLACE             (406)    /* *LISTITEM */
#define AS_LIST_RESET_DIRTY         (407)    /* NULL */

/* Message-Codes */
#define LM_OUT_OF_MEM  (1)
#define LM_IDX_RANGE   (2)
#define LM_DBL_ITEM    (3)
#define LM_INFO        (4)

/* Struktur zum Aufruf */
typedef struct
{
   void *expara;           /* freier Parameter */
   char title[128];        /* Fenstertitel */
   Axywh winsize;          /* Fensterausmaže */
   CICONBLK *icon;         /* Icon-Vorlage */
   long len;               /* L„nge eines Eintrags */
   int16 (*acc_item) (AOBJECT *aob, void *expara);
   int16 (*comp_item) (void *org, void *new, void *expara);
   int16 (*drag_item) (AOBJECT *aob, void *item, void *expara);
   int16 (*edit_item) (void *item, void *expara);
   long  (*key_item) (int16 key, void *expara);
   int16 (*message) (int16 mess, void *expara);
   int16 (*print_item) (char *line, void *item, void *expara);
   int16 (*term_list) (void *expara);
}  LISTDATA;

extern Awindow LIST_WINDOW;

/*
--------------------------------------------------------------
   Predefined Dialogs
--------------------------------------------------------------
*/

int16 A_fontsel( int16 *fontid, int16 *height, int16 prop);

/*
--------------------------------------------------------------
      useful goodies
--------------------------------------------------------------
*/

void read_multiline (char* dest, int16 len, char** from, int16 lines);
void write_multiline (char* dest, int16 len, char** from, int16 lines);

/******************************************************************************/

#endif
