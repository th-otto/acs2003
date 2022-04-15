/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    REVISION:         17. April 2001                                        */
/*    DESCRIPTION:      Headerdatei der îffentlichen Konstanten, Strukturen   */
/*                      und Routinen des Entwicklungssystems ACSpro           */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin ElsÑsser             */
/******************************************************************************/

#ifndef __ACS__
#define __ACS__

/* Es sind C-Deklarationen */
#ifdef __cplusplus
extern "C" {
#endif

/* Kommentar entfernen fÅr Makro-Zugriffe auf */
/* die ACSblk-Variablen der ACS-Version 1.x   */
/*#define __ACS1__ */

/******************************************************************************/
/*                                                                            */
/* Benîtigte Header-Dateien einlesen                                          */
/*                                                                            */
/******************************************************************************/

#include    <acstos.h>
#include    <acsaes.h>
#include    <acsvdi.h>
#include    <acstype.h>

/* Ggf. die Cookie-Konstanten einlesen */
#ifndef _cookie_h_
   #include <acscook.h>
#endif

/******************************************************************************/
/*                                                                            */
/* Globale ACS-Datentypen                                                     */
/*                                                                            */
/******************************************************************************/

/* Ein Element einer einfach verketten linearen Liste */
typedef struct _ACSNextStruct
{
   struct _ACSNextStruct *next;
   void *data;
} A_ListNextStruct;

/******************************************************************************/
/*                                                                            */
/* GEM-Objekte - Teil 1                                                       */
/*                                                                            */
/******************************************************************************/

/* Infos Åber die Listen der freien Blîcke von ACS */
typedef struct
{
   int32 block_size;
   char *descr_text;
   int16 max_liste;
   int16 aktuell_liste;
   int16 max_used;
   int16 opt_anzahl;
} MemFreeBlockStat;

/******************************************************************************/
/*                                                                            */
/* GEM-Objekte                                                                */
/*                                                                            */
/******************************************************************************/

/* Lokale Definition */
#define swd struct wd

/* ForwÑrts-Deklaration wegen rekursiver Verwendung */
swd;

/* Zeiger auf Create-Routine als Datentype */
typedef swd* (*Acreate) (void *x);

/******************************************************************************/

/* Mouse parameters */
typedef struct
{
   int16 number;                       /* Mousenumber 255=Userdef */
   MFORM* form;                        /* Mouseform or NULL */
} Amouse;

/******************************************************************************/

/* Struktur fÅr Antworten auf GEMScript-Kommandos */
typedef struct
{
   char **antwort;
   int16 anzahl;
   int16 ret_wert;
} A_GSAntwort;

/******************************************************************************/

/* Das zentrale Window-Objekt */
typedef struct wd
{
   /* Users part */
   void *user;                      /* Users object pointer */
   int16 (*service)(swd *a,         /* Service call */
                  int16 task, void *in_out);
   swd *(*create)(void *a);         /* create window passing window specific parameters*/
   int16 (*open)(swd *a);           /* open window return success */
   int16 (*init)(swd *a);           /* init window return success */
   OBJECT *work;                    /* Object within window */
   OBJECT *toolbar;                 /* Toolbar */
   int16 ob_edit, ob_col;           /* object nr and act column */

   /* GEM attributes */
   int16 wi_id;                     /* gem window id or -1 */
   int16 wi_kind;                   /* window attributes */
   Axywh wi_act;                    /* actual outer coordinates */
   Axywh wi_normal;                 /* normal outer coordinates */
   Axywh wi_work;                   /* inner size without menu */
   Axywh wi_slider;                 /* last set slider (init -1) */
   int16 wi_nx, wi_ny;              /* normal offset zero or negative */
   int16 snap_mask;                 /* hi y lo x, snap mask due to pattern offset */
   char *name;                      /* points to name */
   char *info;                      /* points to info */

   /* ACS attributes */
   int16 ob_len;                    /* len of edit-block-text, 0 if no selection */
   int16 kind;                      /* own attributes */
   int16 state;                     /* state of window */
   int16 icon;                      /* objectnr in root window, -1 if not */
   CICONBLK *iconblk;               /* defines the Iconimage, NULL means default Icon */

   /* Menue */
   OBJECT *menu;                    /* Menu-Tree OBJECT */

   /* Keyboard */
   int16 (*keys)(swd *x,            /* unknown key actions */
                  int16 kstate, int16 key);

   /* mouse select */
   void (*obchange)(swd *a,         /* change state of this object */
                  int16 obnr, int16 new_state);

   /* window attribute reactions */
   void (*redraw)(swd *a, Axywh *b);      /* Redraw */
   void (*topped)(swd *a);                /* Topped */
   void (*closed)(swd *a);                /* Closed */
   void (*fulled)(swd *a);                /* Fulled */
   void (*arrowed)(swd *a, int16 which,   /* Arrowed */
                  int16 amount);
   void (*hslid)(swd *a, int16 pos);      /* HSlide */
   void (*vslid)(swd *a, int16 pos);      /* VSlide */
   void (*sized)(swd *a, Axywh *b);       /* Sized */
   void (*moved)(swd *a, Axywh *b);       /* Moved */

   int16 (*iconify)(swd *a, int16 all);   /* Iconify, Iconify All */
   int16 (*uniconify)(swd *a);            /* Uniconify */

   int16 (*gemscript)(swd *a, int16 anz,  /* GEMScript */
                  char **cmds, A_GSAntwort *antwort );

   char *help_title;                      /* Titel der Hilfe-Seite */
   char *help_file;                       /* Name der Hilfe-Datei */
} Awindow;

/******************************************************************************/
/*                                                                            */
/* ACS-standardisierte Fehlermeldungsnummern                                  */
/*                                                                            */
/******************************************************************************/

#define AD_COUNT              34

#define AD_GENERAL            0
#define AD_GENERAL_STR        1
#define AD_COLREZ             2
#define AD_CREATE_IO          3
#define AD_CREATE_STR         4
#define AD_DEFECTIVE_MEM      5
#define AD_ERR_ACC            6
#define AD_ERR_MESS           7
#define AD_ERR_WINDOW         8
#define AD_ERR_WISLOT         9
#define AD_GEN_IO             10
#define AD_GEN_MEM            11
#define AD_GEN_MOD            12
#define AD_GEN_MOD_STR        13
#define AD_LOAD_MOD           14
#define AD_LOAD_MOD_STR       15
#define AD_MEM_MOD            16
#define AD_MEM_MOD_STR        17
#define AD_ODD_MEM            18
#define AD_OPEN_IO            19
#define AD_OPEN_STR           20
#define AD_OUT_OF_MEM         21
#define AD_PORT               22
#define AD_RANGE_MEM          23
#define AD_READ_IO            24
#define AD_READ_STR           25
#define AD_VER_MOD            26
#define AD_VER_MOD_STR        27
#define AD_WRITE_IO           28
#define AD_WRITE_STR          29
#define AD_A_ATT              30
#define AD_A_QUEST            31
#define AD_A_STOP             32
#define AD_A_TIMER            33

/******************************************************************************/
/*                                                                            */
/* Die Konfigurations-String-UnterstÅtzung                                    */
/*                                                                            */
/******************************************************************************/

/* Maximale LÑnge eines Config-Strings insgesamt! */
#define MAX_CFGLEN 8192

/******************************************************************************/

typedef struct
{
   char *dateiname;
   char *comment;
   char *env_praefix;
   int16 casesensitiv;
   int16 file_sensitiv;
   int16 file_buffer;
} UCfgInfo;

/******************************************************************************/
/*                                                                            */
/* Initialisierungs-Infos fÅr den Anwendungsstart                             */
/*                                                                            */
/******************************************************************************/

typedef struct
{
   char     magic[8];            /* Magic "ACS 2.0" */
   int16    version;             /* Version * 200 */
   int16    dx,dy;               /* virtuell desktop increments */
   uint16   flags;               /* commom flags */
   char     acc_reg[32];         /* Accessory register message */
   Awindow  *root;               /* Root window */
   Awindow  *acc;                /* Accessory first window */
   Amouse   mouse[32];           /* 32 Mouseforms */
   char     *mess[AD_COUNT];     /* multilinguale Strings */
} Adescr;

/******************************************************************************/

typedef struct
{
   UCfgInfo CfgInfo;                                     /* Infos zum Laden der Cfg-Strings */
   char *BaseName;                                       /* Zu verwendender Name fÅr basename */

   /* Initialisierungszeiger in ACSblk fÅr ACS-Interna */
   void (*ACSterm)( void );                              /* Vor dem Terminieren von ACS */
   void (*ACSaboutme)( void );                           /* Der Eintrag 'öber mich' */
   void (*ACSclose)( void );                             /* ACS beenden (Eintrag 'Quit') */
   void (*ACSmessage)( int16 *ev_mmgpbuf );              /* Unbekannte Messages bearbeiten */
   void (*ACSmproto)( int16 *ev_mmgpbuf );               /* Message-Filter-Routine */
   void (*ACStimer)( void );                             /* Timer am Ende der Event-Schleife */
   void (*ACSkey)( int16 *kstate, int16 *key );          /* Tastendruck-Filter-Routine */
   void (*ACSbutton)( int16 *button, int16 *breturn );   /* Maus-Button-Filter-Routine */
   void (*ACSmouse)( void );                             /* Maus-Bewegungs-Filter-Routine */
   void (*ACSwikey)( int16 *kstate, int16 *key );        /* Tastendruck-Filter-Routine vor wi->keys */

   int16 init_prot;                                      /* Welche Protokolle sollen (komplett) initialisiert werden? */
   int16 XAccType;                                       /* Maschinenlesbarer XAcc-Programmtyp */

   /* Initialisierungszeiger in ACSblk fÅr GEMScript */
   int16 (*ACSGEMScript)( int16 anz, char **cmd, A_GSAntwort *antwort );   /* Allgemeine GEMScript-Funktion */

   /* Start-Funktionen fÅr ACS */
   int16 (*ACSinit0)( void );                            /* Initialisierung nach GEM-Initialisierung */
   int16 (*ACSinit)( void );                             /* Initialisierung nach der ACS-Initialisierung */

   /* Initialisierungszeiger in ACSblk fÅr AV-Protokoll */
   /* Noch nicht implementiert */
} Aconfig;

/******************************************************************************/

/* Flags fÅr die Initialisierung der Protokolle beim Systemstart                           */
/* Falls die Protokolle nicht initialisiert werden, wird dies nachgeholt, sobald sie       */
/* das erstemal benîtigt werden!                                                           */
#define CFG_INIT_OLGA         0x0001      /* Starte ggf. OLGA-Manager nach,                */
                                          /* Anmeldung beim OLGA-Manager anstoûen          */
#define CFG_INIT_OLGA_FULL    0x0002      /* ZusÑtzlich auf das Ende der OLGA-             */
                                          /* Initialisierung warten                        */
#define CFG_INIT_GEMSCRIPT    0x0004      /* Volle Initialisiere des GEMScript-Protokolles */
#define CFG_INIT_BUBBLEGEM    0x0008      /* Ggf. BubbleGEM nachstarten und initialisieren */

/******************************************************************************/

/* Die Flags fÅr die Behandlung von nicht bearbeiteten "normalen"  */
/* TastendrÅcken zum Setzen der Variablen ACSblk->keyAltCtrlSwitch */
#define KEY_AC_NONE              0x0000
#define KEY_AC_ALT_WORK          0x0001
#define KEY_AC_CTRL_WORK         0x0002
#define KEY_AC_ALT_CTRL_WORK     0x0004
#define KEY_AC_CTRL_FIRST_WORK   0x0008
#define KEY_AC_ALT_TOOL          0x0010
#define KEY_AC_CTRL_TOOL         0x0020
#define KEY_AC_ALT_CTRL_TOOL     0x0040
#define KEY_AC_CTRL_FIRST_TOOL   0x0080
#define KEY_AC_TOOL_FIRST        0x0100

/******************************************************************************/
/*                                                                            */
/* Struktur der Auswahl-Liste                                                 */
/*                                                                            */
/******************************************************************************/

typedef struct
{
   Awindow *window;                 /* the objects belong to this window */
   int16 maxlen;                    /* max entries in list */
   int16 actlen;                    /* actual count */
   int16 next;                      /* next entry return by Adr_next */
   int16 dragback;                  /* drag still selected object back to origin */
   int16 x, y;                      /* position during pick up */
   int16 rx, ry;                    /* relativ dragged distance */
   int16 *array;                    /* points to array of obnr's */
} Asel;

/******************************************************************************/
/*                                                                            */
/* Konstanten und Strukturen der Kommunikations-Protokolle                    */
/*                                                                            */
/******************************************************************************/

#define DD_PIPEDD (0x1)          /* ATARI-Pipe-Drag&Drop */
#define DD_XACC   (0x2)          /* XACC-D&D */
#define DD_VA     (0x4)          /* VA-Server */

/******************************************************************************/

/* XACC-Messages */
#ifndef __xaccproto__
   #define __xaccproto__
   #define ACC_ID             0x400
   #define ACC_OPEN           0x401
   #define ACC_CLOSE          0x402
   #define ACC_ACC            0x403
   #define ACC_EXIT           0x404
   #define ACC_ACK            0x500
   #define ACC_TEXT           0x501
   #define ACC_KEY            0x502
   #define ACC_META           0x503
   #define ACC_IMG            0x504
#endif

/******************************************************************************/

/* AV-Messages */
#ifndef __vaproto__
   #define __vaproto__
   #define AV_PROTOKOLL       0x4700
   #define VA_PROTOSTATUS     0x4701
   #define AV_GETSTATUS       0x4703
   #define AV_STATUS          0x4704
   #define VA_SETSTATUS       0x4705
   #define AV_SENDCLICK       0x4709
   #define AV_SENDKEY         0x4710
   #define VA_START           0x4711
   #define AV_ASKFILEFONT     0x4712
   #define VA_FILEFONT        0x4713
   #define AV_ASKCONFONT      0x4714
   #define VA_CONFONT         0x4715
   #define AV_ASKOBJECT       0x4716
   #define VA_OBJECT          0x4717
   #define AV_OPENCONSOLE     0x4718
   #define VA_CONSOLEOPEN     0x4719
   #define AV_OPENWIND        0x4720
   #define VA_WINDOPEN        0x4721
   #define AV_STARTPROG       0x4722
   #define VA_PROGSTART       0x4723
   #define AV_ACCWINDOPEN     0x4724
   #define VA_DRAGACCWIND     0x4725
   #define AV_ACCWINDCLOSED   0x4726
   #define AV_COPY_DRAGGED    0x4728
   #define VA_COPY_COMPLETE   0x4729
   #define AV_PATH_UPDATE     0x4730
   #define AV_WHAT_IZIT       0x4732
   #define VA_THAT_IZIT       0x4733
   #define AV_DRAG_ON_WINDOW  0x4734
   #define VA_DRAG_COMPLETE   0x4735
   #define AV_EXIT            0x4736
   #define AV_STARTED         0x4738
   #define VA_OB_UNKNOWN      0
   #define VA_OB_TRASHCAN     1
   #define VA_OB_SHREDDER     2
   #define VA_OB_CLIPBOARD    3
   #define VA_OB_FILE         4
   #define VA_OB_FOLDER       5
   #define VA_OB_DRIVE        6
   #define VA_OB_WINDOW       7
#endif

/******************************************************************************/

#ifndef __gemscript__
   #define __gemscript__
   typedef struct
   {
      int32 len;     /* LÑnge der Struktur in Bytes */
      int16 version; /* Versionsnummer des Protokolles beim Sender (z.Z. 0x0120 = 1.2) */
      int16 msgs;    /* Bitmap der unterstÅtzten Nachrichten und FÑhigkeiten (GSM_xxx) */
      int32 ext;     /* benutzte Endung, etwa '.SIC'                     */
   } GS_INFO;

   /* Kennung fÅr den Empfang von GS_COMMAND */
   #define GSM_COMMAND     0x0001

   /* Kennung fÅr Empfang von GS_OPENMACRO, GS_WRITE */
   /* und GS_CLOSEMACRO und Senden von GS_MACRO      */
   #define GSM_MACRO       0x0002

   /* Kennung fÅr Versand von GS_OPENMACRO, GS_WRITE */
   /* und GS_CLOSEMACRO und Empfang von GS_MACRO     */
   #define GSM_WRITE       0x0004

   /* Hex-Codierung wird verstanden */
   #define GSM_HEXCODING   0x0008

   /* RÅckgabewerte der GEMScript-Funktionen (Anwendung & Fenster) */
   #define GSACK_OK        0
   #define GSACK_UNKNOWN   1
   #define GSACK_ERROR     2

#endif

/******************************************************************************/

typedef struct
{
   int16       id;            /* The AES-ID of another PRG        */
   int32       type;          /* Same bitvec as dd_active         */
   uint16      xacc_val;      /* DD-dependant-value: XACC->groups */
   const char  *xacc_name;    /* Name of Partner, or NULL         */
   uint16      va_val[3];     /* Status-Bits of VA_PROTOSTATUS    */
   const char  *va_name;      /* The VA-Name                      */
} A_dd;

/******************************************************************************/

/* Informationen fÅr UserDef bei AUO_SELF */
typedef struct
{
   Awindow *window;
   OBJECT *entry;
   int16 obnr;
} Awiob;

/******************************************************************************/
/*                                                                            */
/* Zeichensatzwandelungen Åber KEYTAB                                         */
/*                                                                            */
/******************************************************************************/

#ifdef __KEYTAB_LIB__
   #error "KeyTab-Library is in ACS implemented!"
#endif
#ifdef KEYTAB_H
   #error "KeyTab-Header-File is in ACS included!"
#endif

/******************************************************************************/
/*                                                                            */
/* Globale Konstanten fÅr KEYTAB - Global Constants for KEYTAB                */
/*                                                                            */
/******************************************************************************/

/* Konstanten fÅr die Short-Informationen der 8-Bit-ZeichensÑtze */
/* Constants for the Short-Informations of the 8-Bit-Charsets   */
#define KT_SINFO_8BIT_ASK_MAX_SINFO       KT_SINFO_8BIT_MAX
#define KT_SINFO_8BIT_ASK_MAX_CINFO       KT_CINFO_8BIT_MAX
#define KT_SINFO_8BIT_CONV_ATARI          2
#define KT_SINFO_8BIT_CONV_UNICODE        3
#define KT_SINFO_8BIT_MAX                 3

/******************************************************************************/

/* Konstanten fÅr die String-Informationen der 8-Bit-ZeichensÑtze */
/* Constants for the String-Informations of the 8-Bit-Charsets    */
#define KT_CINFO_8BIT_LONGNAME            0
#define KT_CINFO_8BIT_SHORTNAME           1
#define KT_CINFO_8BIT_MAX                 1

/******************************************************************************/

/* Konstanten fÅr die Short-Informationen der Unicode-Codierungen */
/* Constants for the Short-Informations of the Unicode-Encodings  */
#define KT_SINFO_UNICODE_ASK_MAX_SINFO    KT_SINFO_UNICODE_MAX
#define KT_SINFO_UNICODE_ASK_MAX_CINFO    KT_CINFO_UNICODE_MAX
#define KT_SINFO_UNICODE_MAX              1

/******************************************************************************/

/* Konstanten fÅr die String-Informationen der Unicode-Codierungen */
/* Constants for the String-Informations of the Unicode-Encodings  */
#define KT_CINFO_UNICODE_LONGNAME         0
#define KT_CINFO_UNICODE_SHORTNAME        1
#define KT_CINFO_UNICODE_MAX              1

/******************************************************************************/

/* Konstanten fÅr maximale LÑnge der Zeichensatz-Namen */
/* Constants for the maximum length of charsets names  */
#define KT_MAX_LONG_NAME   38
#define KT_MAX_SHORT_NAME  14

/******************************************************************************/

/* Daten-Struktur, auf die der KEYT-Cookie verweist */
typedef struct
{
   int32  magic;
   int32 size;
   int16 cdecl (*GetExpMaxNr)(void);
   int32 resvd0;
   int16 cdecl (*GetExpNrFromId)(int16 id);
   char  cdecl (*CharAtari2X)(int16 nr, char chr);
   int16 cdecl (*GetImpMaxNr)(void);
   int32 resvd1;
   int16 cdecl (*GetImpNrFromId)(int16 id);
   char  cdecl (*CharX2Atari)(int16 nr, char chr);
   void  cdecl (*BlockAtari2X)(int16 nr, int32 len, char *chrs);
   void  cdecl (*BlockX2Atari)(int16 nr, int32 len, char *chrs);
   char *cdecl (*GetExpNameFromNr)(int16 nr);
   char *cdecl (*GetImpNameFromNr)(int16 nr);
   char *cdecl (*GetExpShortNameFromNr)(int16 nr);
   char *cdecl (*GetImpShortNameFromNr)(int16 nr);
   int16 cdecl (*GetRelease)(void);
   int16 cdecl (*GetExpIdFromNr)(int16 nr);
   int16 cdecl (*GetImpIdFromNr)(int16 nr);
   int16 cdecl (*GetExpNrFromName)(char *name);
   int16 cdecl (*GetImpNrFromName)(char *name);
   int32 cdecl (*GetEuro)(void);
   int16 cdecl (*CharX2Unicode)(int16 nr, char ch);
   char cdecl  (*CharUnicode2X)(int16 nr, int16 unicode);
   void cdecl (*BlockX2Unicode)( int16 *unicode, int16 nr, char *x_chrs, int32 len );
   void cdecl (*BlockUnicode2X)( char *x_chrs, int16 nr, int16 *unicode, int32 len );
   int16 cdecl (*GetExpMinNr)(void);
   int16 cdecl (*GetImpMinNr)(void);
   int32  cdecl (*CharXUtf2Unicode)( int16 nr, char *string, int32 len, int16 *read_chars );
   char *cdecl (*CharUnicode2XUtf)( int16 nr, int32 lunicode, char *result, int16 *used_chars );
   void cdecl (*BlockXUtf2Unicode)( int16 *unicode, int32 *uni_len, int16 nr,
                  char *string, int32 len );
   void cdecl (*BlockUnicode2XUtf)( char *string, int32 *str_len, int16 nr,
                  int16 *unicode, int32 len );
   void cdecl (*BlockXUtf2U2XUtf)( char *dest, int32 *dest_len, int16 dest_nr,
                  char *source, int32 src_len, int16 src_nr );
   void cdecl (*BlockXUtf2XUtf)( char *dest, int32 *dest_len, int16 dest_nr,
                  char *source, int32 src_len, int16 src_nr );
   /* new in 3.0.0 */
   int16 cdecl (*GetInfoShort)( int16 nr, int16 what, int16 *info );
   int16 cdecl (*GetInfoString)( int16 nr, int16 what, char *info, int16 maxLen );
} KEYT;

/******************************************************************************/
/*                                                                            */
/* Die lineare unsortierte Liste                                              */
/*                                                                            */
/******************************************************************************/

typedef void (*A_ListFree)(void *elem);
typedef int16 (*A_ListFor)(void *para, void *elem);
typedef void (*A_ListWork)(void *para, void *elem);

/******************************************************************************/

/* Keine FOR-Funktion, alle Daten sollen bearbeitet/gesucht werden */
#define NO_FOR ((A_ListFor)NULL)

/******************************************************************************/

/* AbkÅrzung, da Zeiger auf Struktur in deren Deklaration benîtigt werden */
#define _sul struct _ULinList

/******************************************************************************/

typedef struct _ULinList
{
   /* Der Zeiger auf die lineare Liste (soll nur ACS-intern verwendet werden!) */
   void *ListData;

   /* Zeiger auf Funktion, die die Elemente der Liste freigeben kann */
   void (*freeElem)( void *elem );

   /* Die lineare Liste leeren, alle Daten freigeben */
   void (*clear)( _sul *liste );

   /* AnhÑngen neuer Daten an die Liste */
   int16 (*append)( _sul *liste, void *new_data );

   /* EinfÅgen neuer Daten in die Liste */
   int16 (*insert)( _sul *liste, void *new_data, int16 before_obj );

   /* Daten aus der Liste lîschen und zurÅckgeben */
   void *(*delete)( _sul *liste, int16 data_nr );

   /* Alle Daten aus der Liste lîschen, die eine bestimmte Bedingung erfÅllen     */
   /* Der Parameter para wird an den gleichnamigen Parameter der in to_delete     */
   /* Åbergebenen Funktion weitergereicht (z.B. öbergabe der Vergleichskriterien) */
   int32 (*deleteFor)( _sul *liste, void *para,
         int16 (*to_delete)(void *para, void *elem) );

   /* Die Daten Nummer nr holen */
   void *(*search)( _sul *liste, int32 nr );

   /* Daten suchen, die eine Bedingung erfÅllen                                 */
   /* Der Parameter para wird an den gleichnamigen Parameter der in found Åber- */
   /* gebenen Funktion weitergereicht (z.B. öbergabe der Vergleichskriterien)   */
   void *(*searchFor)( _sul *liste, void *para, int16 (*found)(void *para,void *elem) );

   /* Das erste Element der Liste */
   void *(*first)( _sul *liste );

   /* Das letzte Element der Liste */
   void *(*last)( _sul *liste );

   /* Das aktuelle Element der Liste */
   void *(*akt)( _sul *liste );

   /* Die Nummer des aktuellen Elementes der Liste */
   int32 (*aktNr)( _sul *liste );

   /* Das aktuelle Element vorwÑrts/rÅckwÑrts bewegen */
   void *(*skip)( _sul *liste, int16 vorwaerts, int32 amount );

   /* Die Anzahl der verwalteten Daten */
   int32 (*count)( _sul *liste);

   /* Die Anzahl der Daten ermitteln, die eine Bedingung erfÅllen */
   /* Der Parameter para wird an den gleichnamigen Parameter der in found Åber- */
   /* gebenen Funktion weitergereicht (z.B. öbergabe der Vergleichskriterien)   */
   int32 (*countFor)( _sul *liste, void *para, int16 (*count)(void *para, void *elem) );

   /* FÅr alle Daten, die eine Bedingung erfÅllen, eine Aktion ausfÅhren               */
   /* Der Parameter para wird an den gleichnamigen Parameter der in to_work und        */
   /* work Åbergebenen Funktion weitergereicht (z.B. öbergabe der Vergleichskriterien) */
   void (*doFor)( _sul *liste, void *para,
            int16 (*to_work)(void *para, void *elem),
            void (*work)(void *para, void *elem) );
} ULinList;

/* For backward compatibility only */
#define ULinListe ULinList

#undef _sul

/******************************************************************************/
/*                                                                            */
/* Der Stack (Stapel)                                                         */
/*                                                                            */
/******************************************************************************/

/* AbkÅrzung, da Zeiger auf Struktur in deren Deklaration benîtigt werden */
#define _ss struct _Stack

typedef struct _Stack
{
   /* Der Zeiger auf die Elemente des Stacks (sollte nur ACS-intern verwendet werden!) */
   A_ListNextStruct *StackData;

   /* Zeiger auf Funktion, die die Elemente der Liste freigeben kann */
   void (*freeElem)( void *elem );

   /* Ein Element auf den Stack legen */
   boolean (*push)( _ss *stack, void *elem );

   /* Das oberste ELement vom Stack holen */
   void *(*pop)( _ss *stack );

   /* PrÅfen, ob der Stack leer ist */
   boolean (*isEmpty)( _ss *stack );

   /* Die Anzahl der Elemente auf dem Stack ermitteln */
   int32 (*count)( _ss *stack );

   /* Den Stack komplett lîschen */
   void (*clear)( _ss *stack );
} Stack;

#undef _ss

/******************************************************************************/
/*                                                                            */
/* Die Warteschlange (Queue)                                                  */
/*                                                                            */
/******************************************************************************/

/* AbkÅrzung, da Zeiger auf Struktur in deren Deklaration benîtigt werden */
#define _sq struct _Queue

typedef struct _Queue
{
   /* Der Zeiger auf die Queue (soll nur ACS-intern verwendet werden!) */
   void *QueueData;

   /* Zeiger auf Funktion, die die Elemente der Liste freigeben kann */
   void (*freeElem)( void *elem );

   /* Ein Element in die Queue stellen */
   boolean (*put)( _sq *queue, void *elem );

   /* Das erste Element aus der Queue holen */
   void *(*get)( _sq *queue );

   /* PrÅfen, ob die Queue leer ist */
   boolean (*isEmpty)( _sq *queue );

   /* Die Anzahl der Elemente in der Queue ermitteln */
   int32 (*count)( _sq *queue );

   /* Die Queue komplett lîschen */
   void (*clear)( _sq *queue );
} Queue;

#undef _sq

/******************************************************************************/
/*                                                                            */
/* Zentrale ACS-Variablen                                                     */
/* Diese Variablen sind bereits vor Aufruf von ACSinit0 initialisiert         */
/*                                                                            */
/******************************************************************************/

/* Pathsize */
#define __PS__ (127 + 1)

/******************************************************************************/

typedef struct
{
   /* AES */
   int16 gl_apid;                /* AES application ID */
   int16 phys_handle;            /* workstation for aes */
   int16 gl_wattr;               /* attribut width */
   int16 gl_hattr;               /* attribut height */
   Axywh desk;                   /* desktop limits XYWH */

   /* VDI */
   int16 vdi_handle;             /* virtual VDI workstation for ACS */
   int16 gl_wbox;                /* cell width of standard char */
   int16 gl_hbox;                /* cell height of standard char */
   int16 gl_wchar;               /* max width of standard char*/
   int16 gl_hchar;               /* max height of standard char */
   int16 ncolors;                /* number of colors (2=mono) */
   int16 nplanes;                /* number of colors expressed in planes */

   /* Pathes */
   char appname [__PS__];        /* application complete name */
   char apppath [__PS__];        /* application path */
   char apppara [__PS__];        /* application parameter */
   char appfrom [__PS__];        /* application called from */
   char basename[20];            /* basename appname without extention */

   /* others */
   int32 ev_mtcount;          /* Timerintervall in milli sec (initial 500 ms) */
   int16 application;         /* runs as an application */
   int16 multitask;           /* more than 1 applications possible */
   int16 appexit;             /* application is in system termination mode */
   Adescr *description;       /* surface description, pointer for late assignment */
   Asel Aselect;              /* list of selected objects */

   /* context during callback pointer values */
   Awindow *ev_window;                       /* actual window */
   OBJECT *ev_object;                        /* actual object tree */
   int16 ev_obnr;                            /* actaul objectnumber, index */
   int16 ev_mmox, ev_mmoy;                   /* Mouse position */
   int16 ev_mmokstate;                       /* Keyboard state */
   int16 dia_abort;                          /* Abort modal dialog */
   MFDB screenMFDB;                          /* exactly this */
   int16 apterm;                             /* AP_TERM received */
   int16 *AESglobal;                         /* points to initialized (AES) global */
   int16 fonts;                              /* count of available fonts */
   int16 argc;                               /* parameter passed to main routine */
   char **argv;                              /* argument list */
   char **env;                               /* environment */
   int16 fontid;                             /* Fontid for Userdefs */
   int16 fheight;                            /* Height for Userdeffonts */
   int16 fontsid;                            /* Fontid for Userdef (small) */
   int16 fsheight;                           /* Height for Userdeffonts (small) */
   void (*ACSterm) (void);                   /* called before terminating ACS */
   void (*ACSaboutme) (void);                /* call used for 'about me' */
   void (*ACSclose) (void);                  /* call used for 'Quit' */
   void (*ACSmessage)(int16 *ev_mmgpbuf);    /* handle unprocessed messages */
   void (*ACSmproto)(int16 *ev_mmgpbuf);     /* filter unprocessed messages */
   void (*ACStimer)(void);                   /* called at end of event loop */
   int16 (*ACSinit0)(void);                  /* pre init */
   int16 dither;                             /* dither config */
   void (*ACSkey)(int16 *kstate, int16 *key);/* filter keys */
   void (*ACSbutton)(int16 *button, int16 *breturn);  /* filter mouse buttons */
   void (*ACSmouse)(void);                /* filter mouse moves (ev_mmox/y) */
   void (*ACSwikey)(int16 *kstate, int16 *key);    /* filter keystroke before wi->keys call */
   int16 ev_bmask;                           /* evnt_multi */
   int16 ev_bstate;                          /* evnt_multi */
   int16 ev_mmobutton;                       /* evnt_multi */
   int16 ev_mbreturn;                        /* evnt_multi */
   int16 ev_mkreturn;                        /* evnt_multi */
   int16 ev_mbclicks;                        /* evnt_multi default 2 */
   void (*DEBUG_MEM)(void *defective);       /* Debuggable */
   char cfg_path [__PS__];                   /* config path initially = apppath*/
   char scrp_path [__PS__];                  /* initialised scrap-path */
   void (*ACSerror)(int16 errmess, void *para);    /* error-Routine */
   int16 menu_id;                            /* ACC-Menu-ID or -1 */
   char  *dd_name;                           /* global available name for DD-Protos */
   char  *alert_name;                        /* own WinAlert-Name */
   int16 mfsel_count;                        /* multi-Fsel-Counter */
   char  separator[256];                     /* Worttrenner */

   /* Langer Name der Applikation (u.a. fÅr GEMScript) */
   char *AppLongName;

   /* Die Config-Strings der Anwendung */
   UConfig *cfg;

   /* Allgemeine GEMScript-Funktion der Applikation */
   int16 (*GEMScript)( int16 anz, char **cmd, A_GSAntwort *antwort );

   /* Erlaubte, d.h. freigeschaltete Dead-Keys aus der Menge ^'`π\"¯,/~ */
   char ev_mkdead[10];

   /* Einstellung, ob eine nicht verarbeitete "normale" Taste zusammen mit */
   /* ALT oder CTRL als TastenkÅrzel fÅr Toolbar/Work-Objekt ausprobiert   */
   /* werden soll */
   int16 keyAltCtrlSwitch;

   /* Der MagiC-Cookie */
   MAGX_COOKIE *MagiCCookie;

   /* Der N.AES-Cookie */
   N_AESINFO *NAesCookie;
} Ablk;

/******************************************************************************/

#define A_TOOLBAR    (0x1000)          /* Flag indicates Toolbar */
#define A_MASK       (0x0fff)          /* mask out pure index number */

/******************************************************************************/
/*                                                                            */
/* Definitionen der Nachrichten und Strukturen                                */
/* fÅr Fenster-/UserDef-Service-Funktionen                                    */
/*                                                                            */
/******************************************************************************/

/* Userdefined Objects Services */
#define AUO_CREATE         (1)               /* UObject can add or initialize data structs */
#define AUO_TERM           (2)               /* UObject can free data structs */
#define AUO_GETVAL         (3)               /* UObject returns value, char ** */
#define AUO_SETVAL         (4)               /* UObject sets value, char * */
#define AUO_UPDATE         (5)               /* UObject smart update */
#define AUO_FULLUPDATE     (6)               /* UObject no smart update */
#define AUO_SELF           (9)               /* tells own identity, Awiob * */
#define AUO_NEXT           (10)              /* inc pos     */
#define AUO_PREV           (11)              /* dec pos     */
#define AUO_NEXTPAGE       (12)              /* inc pos by 'step' */
#define AUO_PREVPAGE       (13)              /* dec pos     by 'step' */
#define AUO_BEGIN          (14)              /* pos = 0     */
#define AUO_END            (15)              /* pos = max */
#define AUO_POS            (17)              /* set pos     */
#define AUO_OWNER          (18)              /* gets own identity, Awiob */
#define AUO_GETBUBBLE      (19)              /* Text fÅr BubbleGEM-Hilfe erfragen */
#define AUO_GETCONTEXT     (20)              /* Text fÅr Context-Popup erfragen */
#define AUO_CONTEXT        (21)              /* Aus dem Context-Popup ausgewÑhlter Eintrag */

/******************************************************************************/

/* description.flags */
#define AB_CLICKMENU       (0x0001)    /* menu drop down on click instead of touch */
#define AB_MOVIES          (0x0002)    /* draws moving, growing, shrink rectangle */
#define AB_FEEDBACK        (0x0002)    /* new name for feedback-actions */
#define AB_ACUSTIC         (0x0004)    /* acustic bell if user clicks outside of dialog */
#define AB_HIDEPOINTER     (0x0008)    /* hide pointer on key input */
#define AB_CENTERDIALOG    (0x0010)    /* center dialog */
#define AB_GDOSFONT        (0x0020)    /* load and frees gdos fonts if available */
#define AB_SMARTREDRAW     (0x0040)    /* use smart redraw */
#define AB_MENUFIRST       (0x0080)    /* change key consume strategie */
#define AB_NO3D            (0x0100)    /* suppress 3D effects */
#define AB_LAZYEVAL        (0x0200)    /* no secure checks, i.e. no Dsetdrv/Dsetpath in Ash_prog */
#define AB_NOMEMCHECK      (0x0400)    /* dont check memory assuming Pure C style */
#define AB_NOTRANSICON     (0x0800)    /* dont transform internal icons */
#define AB_OLDMENU         (0x1000)    /* Keine modernen MenÅs, wie sie unter MagiC mit prop. Systemfont erscheinen */

/******************************************************************************/

/* Awindow.service (generic) */
#define AS_ACCLOSED        (1)         /* accessory closed, initialize correctly */
#define AS_TERM            (2)         /* terminate */
#define AS_ICONIZED        (3)         /* the window was iconized (in order to receive a free window id) */
#define AS_MOUSE           (4)         /* Mouse is upon the window */
#define AS_SELECTADD       (5)         /* added object in select list */
#define AS_SELECTDEL       (6)         /* deleted object in select list */
#define AS_UNTOPPED        (7)         /* ACS does not handle UNTOPPED, maybe the window want it to know */
#define AS_FOCUSCHG        (8)         /* Input Focus changed within a window */
#define AS_CHECKDRAG       (9)         /* check if window will accept draglist (in) int16 [0] = obnr, (out) int16 [1] = TRUE/FALSE */
#define AS_OPEN            (10)        /* Open the selected list of objects */
#define AS_DELETE          (11)        /* delete selected list */
#define AS_CHECKDELETE     (12)        /* is list deleteable, int16 * (TRUE/FALSE) */
#define AS_WIAUTOPOS       (14)        /* automatic determination of pos */
#define AS_INFO            (15)        /* Info about Window */
#define AS_DRAGGED         (16)        /* Something dragged on windows ICON */
#define AS_CHECKDRAGGED    (17)        /* is list acceptable for this window icon, int16 * (TRUE/FALSE) */
#define AS_CONFIGDRAG      (18)        /* Allows owner window to modify drag parameter like raster (see Doc), int16 * */
#define AS_DRAGABORTED     (19)        /* Drag was released on foreign window, int16* wi_id */
#define AS_REALSEL_START   (20)        /* Start neuer Aselect-Liste */
#define AS_REALSEL_UPDATE  (21)        /* énderung der Aselect-Liste */
#define AS_REALSEL_END     (22)        /* Ende der Aselect-Liste */
#define AS_REALPOP_START   (23)        /* Start des Popups, IN_OUT: *int16 auf Startobjekt */
#define AS_REALPOP_UPDATE  (24)        /* énderung des Popups, IN_OUT: *int16 auf Objektnummer */
#define AS_REALPOP_END     (25)        /* Ende des Popups */
#define AS_EDITCHG         (26)        /* neue Taste in der Eingabe */
#define AS_GEM_MESS        (27)        /* unbekannte GEM-Message fÅr RootFenster */
#define AS_SCRAP_UPDATE    (28)        /* das Klemmbrett wurde erneuert, in_out *ext */
#define AS_SCRAP_IMPORT    (29)        /* Aufruf, aus dem Klemmbrett zu importieren, in_out *ext */
#define AS_SCRAP_EXPORT    (30)        /* dito fÅr Export */
#define AS_REALMENU_START  (31)        /* Start der MenÅbedienung, in_out *int16 auf Start */
#define AS_REALMENU_UPDATE (32)        /* ...neuer Eintrag, in_out *int16 auf neuen Eintrag */
#define AS_REALMENU_END    (33)        /* ...und Ende */
#define AS_SHADED          (34)        /* Fenster wurde gerade shaded (WINX, MagiC) */
#define AS_UNSHADED        (35)        /* Fenster wurde gerade unshaded (WINX, MagiC) */

/* Meldungen BubbleGEM betreffend */
#define AS_ALLOWBUBBLE     (36)        /* Soll fÅr dieses Fenster BubbleGEM unterstÅtzt werden? */
#define AS_GETBUBBLE       (37)        /* Text fÅr BubbleGEM-Hilfe wird gefragt */

/* Meldungen das Context-Popup betreffend */
#define AS_ALLOWCONTEXT    (38)        /* Soll fÅr dieses Fenster ein Context-Popup unterstÅtzt werden? */
#define AS_GETCONTEXT      (39)        /* Text fÅr Context-Popup wird gefragt */
#define AS_CONTEXT         (40)        /* Aus dem Context-Popup ausgewÑhlter Substring */

/* Erlaubt das Fenster die ST-Guide-Hilfe? */
#define AS_ASK_STGUIDE     (41)        /* Nachfrage nach dem ST-Guide-Text, das fÅr das Fenster angegebene Thema wird mitgegeben und kann geÑndert werden */

/* Meldungen OLGA betreffend */
#define AS_OLGA_CONNECT    (42)        /* Die OLGA-Verbindung ist hergestellt */
#define AS_OLGA_UPDATED    (43)        /* Ein verknÅpftes OLGA-Dokument wurde geÑndert */
#define AS_OLGA_DISCONNECT (44)        /* Die OLGA-Verbindung ist getrennt */
#define AS_OLGA_MAKE_INFO  (45)        /* Eine Info-Datei zu einer OLGA-Verbindung soll erzeugt werden */
#define AS_OLGA_INFO       (46)        /* Eine (bestellte) Info-Datei einer OLGA-Verbindung steht zur VerfÅgung */
#define AS_OLGA_CLEAR_INFO (47)        /* Eine erzeugt Info-Datei einer OLGA-Verbindung kann wieder gelîscht werden */

/* Ergebnis einer (MagiC-)Multi-Dateiauswahl wird gemeldet */
#define AS_FILESELECT      (48)

/* Ergebnis eines Druck-Dialoges wird gemeldet */
#define AS_PRINT           (49)

typedef struct
{
   PRN_SETTINGS *settings;
   int16 option;
   int16 button;
} A_PrintSel;

/******************************************************************************/

#define AS_FONT_UPDATE     (50)        /* Meldung, daû die ZeichensÑtze geÑndert wurden */
#define AS_PRN_UPDATE      (51)        /* GDOS-Druckertreiber wurden verÑndert */

/* Struktur zu AS_PRN_UPDATE */
typedef struct
{
   int16 driver;     /* GerÑtenummer des GDOS-Treibers             */
   int16 change;     /* Kennzeichen: 0=neu, 1=geÑndert, 2=entfernt */
} A_PrnUpd;

/******************************************************************************/

/* Ergebnis einer Zeichensatzauswahl wird gemeldet */
#define AS_FONT            (52)

typedef struct
{
   int16 button;
   int16 check_boxes;
   int32 font_id;
   int32 pt;
   int32 ratio;
} A_FontSel;

/******************************************************************************/

#define AS_CHANGE_LAYOUT   (53)        /* Layout des Fensters Ñndern */

/******************************************************************************/

/* Zeiger auf Callback-Funktion fÅr Ash_font */
typedef int16 (*A_FontFkt)(void *para, A_FontSel *font);

/******************************************************************************/

/* Einige Messages fÅr Ergebnis-Meldungen der diversen Protokolle */
#define AS_ACC_ACK         (400)       /* BestÑtigung eines XAcc-Transfers eingegangen */
#define AS_AV_STARTED      (401)       /* BestÑtigung eines VA_START-Transfers eingegangen */
#define AS_PC_VERSION      (402)       /* Versionsnummer der PureC-Hilfe als BestÑtigung */

/******************************************************************************/

/* Datenstrukturen fÅr die Nachrichten */
typedef struct
{
   int16 obnr;                /* Objekt-Nummer */
   char *text;                /* Text fÅr BubbleGEM/Context-MenÅ */
} AGetObjText;

/******************************************************************************/

typedef struct
{
   char *hyp_file;
   char *hyp_title;
} AGetSTGuide;

/******************************************************************************/

typedef struct
{
   Awindow *window;           /* Bearbeitendes Fenster */
   int16 id;                  /* ID der Verbindung */
   char *datei;               /* Dateiname der Austausch-Datei */
   int16 info_id;             /* ID-Nummer des Servers (als OLGA-Client nutzbar, sonst gleich id) */
   char *info_datei;          /* Dateiname der vorhandenen bzw. erzeugbaren Info-Datei */
   int16 olga_flags;          /* Einige Flags der OLGA-Connection */
} OLGA_Infos;

/******************************************************************************/

/* Ein paar Konstanten fÅr die OLGA-Infos */
#define OLGA_INF_SENSITIV  0x0001      /* Dateinamen case-sensitiv vergleichen? */
#define OLGA_INF_SERVER    0x0002      /* Das Fenster ist der OLGA-Server */
#define OLGA_INF_CONNECTED 0x0004      /* Kennt der OLGA-Manager diese Verbindung eigentlich? */

/******************************************************************************/

/* zusÑtzliche, neue Nachrichten */

#define AS_ASKHELP         (1000)      /* Kann ein Fenster AS_HELP verstehen? */
                                       /* in in_out ist dann Fensterzeiger */
#define AS_HELP            (1001)      /* Hilfe anzeigen lassen */
               /* in INOUT ein fertiger HELP-Text-Pfad oder IMG-Pfad Åbergeben        */
               /* einzelne öberschriften aus dem Text kînnen ausgewÑhlt werden, indem */
               /* nach dem Pfad, durch ein TAB getrennt, die öberschrift folgt        */
               /* dabei wird in der Åbergeben Datei nach einer Zeile gesucht, die     */
               /* mit # beginnt und dann genau die öberschrift hat. In diesem Fall    */
               /* erfolgt die Textausgabe bis zum nÑchsten # am Zeilenanfang          */
#define AS_REDRAWFILE      (1002)      /* Fenster mit Dateidarstellungen sollen auf diese Nachricht die */
                                       /* Dateidarstellung aktualisieren, OPTIONAL KANN in IN_OUT ein Pfad */
                                       /* angegeben sein, fÅr den diese VerÑnderung gilt */
#define AS_LOADFILE        (1003)      /* ein Fenster soll, sofern es als PRG lÑuft, die Textdatei aus */
                                       /* IN_OUT in einen EDITOR laden */

#define AS_SELECTFILE      (1004)      /* ein Fenster mit einer Dateidarstellung sollte die Datei IN_OUT selektieren */
                                       /* zusÑtzlich selekt. nur dann, wenn die Datei sich im gleichen Verzeichnis befindet */
                                       /* NULL in IN_OUT bedeutet deselktieren */
#define AS_LOOKSTRING      (1005)      /* suche nullterminierten String aus IN_OUT in den eigenen Datenstrukturen */
#define AS_SAVEFILE        (1006)      /* sichere Datei *IN_OUT */
#define AS_DOARCHIVE       (1010)      /* LAZy-Shell-intern... */
#define AS_ASKLAZY         (1011)      /* bist Du LAZy-Fenster? */
#define AS_ASKFILE         (1012)      /* bist Du Dateidarstellungsfenster? */
#define AS_ASKTURNUS       (1013)      /* bist Du TURNUS-Fenster? */
#define AS_ASKNOTIO        (1014)      /* bist Du NOTIO-Fenster? */
#define AS_ASKACSOBJ       (1015)      /* bist Du ACS-Object-Fenster? */
#define AS_CEWS_BASE       (1100)      /* bist Du ACS-Base-Fenster? */
#define AS_IMGSETOWNER     (2000)      /* IMGEDIT-intern */

/******************************************************************************/

/* VAMOS */
#define ADD_DLO            (20000)     /* Nachricht */
#define AS_MODE            (20001)     /* Modus wechseln */
#define AS_CALC            (20002)     /* Fensterinhalt neu berechnen */

/******************************************************************************/
/*                                                                            */
/* Flags fÅr die Awindow-, OBJECT- bzw. AOBJECT-Struktur                      */
/*                                                                            */
/******************************************************************************/

/* Awindow.kind */
#define AW_ICON            (0x0001)    /* Iconizing Window instead of Terminating */
#define AW_GHOSTICON       (0x0002)    /* Ghost Icon from beginning */
#define AW_STAY            (0x0004)    /* do not change state of the window iconize/open */
#define AW_OBLIST          (0x0008)    /* inner object is a objects list */
#define AW_ICONACCEPT      (0x0010)    /* accept dragging on windows icon */
#define AW_UHSLIDER        (0x0020)    /* user administrated horizontal slider */
#define AW_UVSLIDER        (0x0040)    /* user administrated vertical slider */
#define AW_NOSCROLL        (0x0080)    /* no optimized scrolling */
#define AW_TOOLBOX         (0x0100)    /* do not top if access (AES 4.0 only) */

/******************************************************************************/

/* Awindow.state */
#define AWS_FULL           (0x0001)    /* State full */
#define AWS_DIALOG         (0x0002)    /* dialog is activ */
#define AWS_MODIFIED       (0x0004)    /* dependend information was changed call init before open */
#define AWS_MODAL          (0x0008)    /* a modal dialog is open for this window */
#define AWS_FORCEREDRAW    (0x0010)    /* forces a redraw */
#define AWS_LATEUPDATE     (0x0020)    /* send AS_UPATE after returning to main loop */
#define AWS_TERM           (0x0100)    /* Terminatesequence active, skip iconizing */
#define AWS_INTERM         (0x0200)    /* USER set! window is term routine in progress, just to avoid double terminating and freeing memory */
#define AWS_MODAL_WIN      (0x0400)    /* modal, window dialog */
#define AWS_ICONIZED       (0x0800)    /* GEM-iconified */
#define AWS_ALLICONIZED    (0x1000)    /* Main-GEM-iconified */
#define AWS_SHADED         (0x2000)    /* window is shaded (MagiC,WINX) */

/******************************************************************************/

/* OBJECT.ob_flags */
#define AEO                (0x8000)    /* Extended Object */
#define AO_DEFABLE         (0x4000)    /* defaultable Object */
#define AO_DRAGABLE        (0x2000)    /* dragable Object */
#define AO_ACCEPT          (0x1000)    /* accept dragable Object */
#define AO_SILENT          (0x0800)    /* object will NOT visual react (AO_ACCEPT) */

/******************************************************************************/

/* OBJECT.ob_state */
#define AOS_FIXED          (0x8000)    /* Object tree is already fixed */
#define AOS_DCLICK         (0x4000)    /* last selection was a double click */
#define AOS_CONST          (0x2000)    /* Do not copy substructure, do not release (free) substructure */
#define AOS_LOCKED         (0x1000)    /* subtree is locked */
#define AOS_CLTOP          (0x0800)    /* Counterlock Top; is bound to Bottom of parent */
#define AOS_CLBOTTOM       (0x0400)    /* Counterlock Bottom */
#define AOS_CLLEFT         (0x0200)    /* Counterlock Left */
#define AOS_CLRIGHT        (0x0100)    /* Counterlock Right */

/******************************************************************************/

/* AOBJECT.type */
#define AT_ICONWINDOW      (1)            /* iconized window */
#define AT_NEW             (2)            /* new object */
#define AT_TRASH           (3)            /* trash bin */
#define AT_MFDB            (10)           /* MFDB in userp1 */
#define AT_STRING          (11)           /* Nullterminated String in userp1 */
#define AT_FILE            (20)           /* Nullterminated String in userp1, file path */
#define AT_ARCHIVE         (30)           /* LAZY SHELL */
#define AT_TEXT            (31)           /* '\n'-seperated Strings with final zero */
#define AT_TURNUS          (32)           /* TurnUs-intern */
#define AT_NOTIO           (33)           /* Notio-intern */

/******************************************************************************/

/* VAMOS, reserviert 20000 - 20009 */
#define AT_DLO             (20000)        /* DainÑmik Link Obdschekt */
#define AT_SLOT            (20001)        /* Modulslot */
#define AT_JOBSYMBOL       (20002)        /* Symbol fÅr JOB - Layout - Programm */
#define AT_BITBLK          (20003)        /* Bitblock */
#define AT_ICONBLK         (20004)        /* Iconblock */
#define AT_JOBITEM         (20005)        /* Objekt fÅr Joblauf */

/******************************************************************************/

/* S_C_M, reserviert 50-59 */
#define  AT_DATE           (50)
#define  AT_BOOKING        (51)
#define  AT_CUSTOMER       (52)
#define  AT_NEWCUSTOMER    (53)
#define  AT_ARTICLE        (54)

/******************************************************************************/
/*                                                                            */
/* ACSerror-Fehler-Nummern                                                    */
/*                                                                            */
/******************************************************************************/

/* For Std-Message-Numbers, not-NULL-Pointer in Para means */
/* printable Text, which can be added to the normal message */

#define AE_GEN                (1)         /* general error occured */
#define AE_GEN_MEM            (2)         /* general memory error, prefer following specialized numbers */
#define AE_OUT_OF_MEM         (3)         /* not enough memory */
#define AE_DEFECTIVE_MEM      (4)         /* mem orgininally not allocated */
#define AE_RANGE_MEM          (5)         /* to much or not enough memory handled */
#define AE_ODD_MEM            (6)         /* odd mem-adress */
#define AE_GEN_IO             (7)         /* general io-error, prefer following specialized numbers */
#define AE_OPEN_IO            (8)         /* IO-channel-open error */
#define AE_CREATE_IO          (9)         /* IO-channel-create error */
#define AE_WRITE_IO           (10)        /* IO-channel-write error */
#define AE_READ_IO            (11)        /* IO-channel-read error */
#define AE_GEN_MOD            (12)        /* general modul-error */
#define AE_LOAD_MOD           (13)        /* Pexec-3 Load-error */
#define AE_VER_MOD            (14)        /* wrong version */
#define AE_MEM_MOD            (15)        /* mshrink-error */
#define AE_PORT               (16)        /* io-port-error */
#define AE_COLORS             (17)        /* incorrect amounts of colors */
#define AE_REZ                (18)        /* unsupported resolution */
#define AE_VDI                (19)        /* VDI-error (like version-numbers) */
#define AE_AES                (20)        /* AES-Error (like 'MTos required') */
#define AE_IMG                (21)        /* IMG-Depack-error */
#define AE_DD_WARN            (22)        /* D&D-Warning */
#define AE_DD_ERR             (23)        /* D&D-Error */

#undef swd                                      /* no one knows it any more */

/******************************************************************************/
/*                                                                            */
/* Init entry after ACS initializing                                          */
/*                                                                            */
/******************************************************************************/

int16 ACSinit( void );

/******************************************************************************/
/*                                                                            */
/* Die globalen ACS-Variablen                                                 */
/*                                                                            */
/******************************************************************************/

extern Ablk *ACSblk;

/******************************************************************************/
/*                                                                            */
/* Unterschiedliche Variablen bzw. Funktionen fÅr Nicht-Module und Module     */
/*                                                                            */
/******************************************************************************/

#ifndef __ACS_MODULE__
   extern Awindow* Aroot_wi;
   extern Adescr ACSdescr;
   extern Aconfig ACSconfig;

   /* pre init */
   int16 ACSinit0 (void);
#else
   /* This module should terminate, WARNING dangerous call*/
   void ACSmoduleterm (void);
#endif

/******************************************************************************/
/*                                                                            */
/* Zugriffs-Makros: abwÑrtskompatiblen Zugriff auf die Variablen von ACS 1.x  */
/*                                                                            */
/******************************************************************************/

#ifdef __ACS1__
   #define gl_apid         (ACSblk-> gl_apid)
   #define phys_handle     (ACSblk-> phys_handle)
   #define gl_wattr        (ACSblk-> gl_wattr)
   #define gl_hattr        (ACSblk-> gl_hattr)
   #define desk            (ACSblk-> desk)

   /* VDI */
   #define vdi_handle      (ACSblk-> vdi_handle)
   #define gl_wbox         (ACSblk-> gl_wbox)
   #define gl_hbox         (ACSblk-> gl_hbox)
   #define gl_wchar        (ACSblk-> gl_wchar)
   #define gl_hchar        (ACSblk-> gl_hchar)
   #define ncolors         (ACSblk-> ncolors)
   #define nplanes         (ACSblk-> nplanes)

   /* Pathes */
   #define appname         (ACSblk-> appname)
   #define apppath         (ACSblk-> apppath)
   #define apppara         (ACSblk-> apppara)
   #define appfrom         (ACSblk-> appfrom)
   #define basename        (ACSblk-> basename)

   /* others */
   #define ev_mtcount      (ACSblk-> ev_mtcount)
   #define application     (ACSblk-> application)
   #define multitask       (ACSblk-> multitask)
   #define appexit         (ACSblk-> appexit)
   #define description     (ACSblk-> description)
   #define Aselect         (ACSblk-> Aselect)

   /* context during callback pointer values */
   #define ev_window       (ACSblk-> ev_window)
   #define ev_object       (ACSblk-> ev_object)
   #define ev_obnr         (ACSblk-> ev_obnr)
   #define ev_mmox         (ACSblk-> ev_mmox)
   #define ev_mmoy         (ACSblk-> ev_mmoy)
   #define ev_mmokstate    (ACSblk-> ev_mmokstate)
   #define dia_abort       (ACSblk-> dia_abort)
   #define screenMFDB      (ACSblk-> screenMFDB)
   #define apterm          (ACSblk-> apterm)
   #define AESglobal       (ACSblk-> AESglobal)
#endif

/******************************************************************************/
/*                                                                            */
/* Allgemeine Fenster-Routinen                                                */
/*                                                                            */
/******************************************************************************/

/* Get window for GEM-Window-ID */
Awindow *Awi_wid( const int16 wid );

/* Return Root-Window */
Awindow *Awi_root( void );

/* Next Window from total Set */
Awindow *Awi_list( void );

/* Sends Message to all Windows */
void Awi_sendall( int16 task, void *in_out );

/* Cycle down Windows */
void Awi_down( void );

/* Cycle Up Windows */
void Awi_up( void );

/* Show Window */
void Awi_show( Awindow *window );

/* Dummy Init-Routine */
int16 Awi_init( Awindow *window );

/* create a copy of window x */
Awindow *Awi_create( const Awindow *x );

/* Open Window */
int16 Awi_open( Awindow *x );

/* Close Window */
void Awi_closed( Awindow *x );

/* Free Window */
void Awi_delete( Awindow *x );

/* Top this Window */
void Awi_topped( Awindow *window );

/* Abfrage des obersten eigenen Fensters */
Awindow *Awi_ontop( void );

/* Fullsize Window */
void Awi_fulled( Awindow *window );

/* Move/Resize Window */
void Awi_sized( Awindow *window, Axywh *new );
void Awi_moved( Awindow *window, Axywh *new );

/* Iconify (FALSE: ein Fenster, TRUE: alle) & Uniconify */
int16 Awi_iconify (Awindow *wi, int16 all);
int16 Awi_uniconify (Awindow *wi);

/* Allgemeine GEMScript-Funktion der Anwendung und eines Fensters */
int16 Aev_GEMScript( int16 anz, char **cmd, A_GSAntwort *antwort );
int16 Awi_gemscript( Awindow *wi, int16 anz, char **cmds, A_GSAntwort *antwort );

/* Fenstern anhand des Titels bestimmen */
Awindow *Awi_name( const char *title, int16 sensitiv );

/* Finish open Dialog */
void Awi_diaend( void );

/* Start Dialog */
void Awi_diastart( void );

/* Key-Input for Dialog */
int16 Awi_keys( Awindow *window, int16 kstate, int16 key );

/* Key-Input for Dialog, send Keys to AV-Server if not used */
int16 Awi_keysend( Awindow *window, int16 kstate, int16 key );

/* Key-Input for Dialog, sends no Keys to AV-Server */
int16 Awi_nokey( Awindow *wi, int16 kstate, int16 key );

/* Show Area in Work-Object-Coordinates */
void Awi_obview( Awindow *window, Axywh *xywh );

/* Very simple Service-Routine */
int16 Awi_service( Awindow *window, int16 task, void *in_out );

/* Intelligent Scroll/Update (x,y upper left edge BEFORE scrolling) */
void Awi_scroll( Awindow *window, int16 x, int16 y );

/* Modal Dialog on Top? (returns NULL if not) */
Awindow *Awi_modal( void );

/* Complete Modal-Window-Dialog-Handler */
int16 Awi_dialog( Awindow *win );
int16 Awi_doform( Awindow *mod_dia, void *para );

/* Click-Routine: Einen Dialog abbrechen */
void Awi_diaabort( void );

/* Shows Window-Alert */
int16 Awi_alert( int16 but, char *text );

/* Creates a Copy of Awindow x */
Awindow *Awi_selfcreate( void *x );

/* tree-look & send AUO_SELF to USERDEFs */
void Awi_uoself( Awindow *wi );

/* Internal wind_update */
void Awi_update( int16 mode );

/* Das Layout umschalten */
void Awi_layout( const int16 flag3D, const int16 flagModernMenu, const int16 redraw );

/* ST-Guide-Hilfe zum Fenster anzeigen */
int16 Awi_help( Awindow *window );

/* Redraw-Routine */
void Awi_redraw( Awindow *window, Axywh *limit );

/* Arrows */
void Awi_arrowed( Awindow *window, int16 which, int16 amount );

/* Horizontal Slider */
void Awi_hslid( Awindow *window, int16 pos );

/* vertical slider */
void Awi_vslid( Awindow *window, int16 pos );

/* Mausrad-Ereignisse verarbeiten - get mouse wheel events */
int16 Awi_wheeled( Awindow *wind, int16 wheels[16], int16 mx, int16 my );

/* Daten wurden gesichert, andere Fenster und OLGA davon informieren */
void Awi_saved( Awindow *window, const char *datei );

/******************************************************************************/
/*                                                                            */
/* Routinen, die ObjektbÑume der Fenster betreffend                           */
/*                                                                            */
/******************************************************************************/

/* Change the State of this Object in Work-Tree */
/* ! changed behaviour to 1.0                   */
void Awi_obchange( Awindow *window, int16 obnr, int16 new_state );

/* Redraws everthing in the Area of obnr (uses window->redraw) */
void Awi_obredraw( Awindow *window, int16 obnr );

/* Send a message zu the window-object */
int16 Awi_observice( Awindow *wind, int16 obnr, int16 task, void *in_out );

/* Find obnr for which Flagmask becomes TRUE, obnr is start object */
OBJECT *Awi_obfind( Awindow *window, int16 x, int16 y, OBJECT **tree, int16 *obnr );

/* PrÅfen, ob ein Objekt sichtbar ist (bzw. je nach Slider-Stellungen sein kînnte) */
int16 Awi_obvisible( Awindow *window, int16 obnr );

/* Das Kontext-Popup fÅr Objekt unter (mx, my) aufrufen */
int16 Awi_context( Awindow *window, int16 mx, int16 my );

/******************************************************************************/
/*                                                                            */
/* Event-Funktionen                                                           */
/*                                                                            */
/******************************************************************************/

/* Next eventloop will terminate */
void Aev_quit( void );

/* Accept and handle messages eg redraw */
void Aev_mess( void );

/* Unhides hidden Pointer */
void Aev_unhidepointer( void );

/* Waits for release of Mousebuttons */
void Aev_release( void );

/******************************************************************************/
/*                                                                            */
/* Diverse Nachrichten verschicken                                            */
/*                                                                            */
/******************************************************************************/

/* Screen-Messages */
int16 Aev_WmRedraw( const int16 dest_id, const int16 wind_id, const Axywh *area );

/* AV-Protokoll */
int16 Aev_AvProtokoll( const int16 dest_id, Awindow *window, const int16 timeout );
int16 Aev_AvExit( const int16 dest_id, Awindow *window, const int16 timeout );
int16 Aev_VaProtoStatus( const int16 dest_id, Awindow *window, const int16 timeout );
int16 Aev_VaStart( const int16 dest_id, const char *cmd, Awindow *window, const int16 timeout );
int16 Aev_AvStarted( const int16 dest_id, const int16 ok, const char *cmd );

/* XAcc-Protokoll */
int16 Aev_AccID( const int16 dest_id, Awindow *window, const int16 timeout );
int16 Aev_AccExit( const int16 dest_id, Awindow *window, const int16 timeout );
int16 Aev_AccAck( const int16 dest_id, const int16 ok );
int16 Aev_AccAcc( const int16 dest_id, const int16 *message, Awindow *window, const int16 timeout );
int16 Aev_AccKey( const int16 dest_id, const int16 key, Awindow *window, const int16 timeout );

/* ST-Guide-Hilfe anfordern */
int16 Aev_STGuideHelp( char *hyp_text, char *referenz, Awindow *window );

/* PureC-Hilfe */
int16 Aev_PCHelpVersion( void );
int16 Aev_AcHelp( char *help_acc, char *referenz, Awindow *window );
int16 Aev_AcVersion( char *help_acc, Awindow *window );
int16 Aev_AcCopy( char *help_acc, Awindow *window );

/* BubbleGEM */
int16 Awi_bubblegem( Awindow *window, const int16 mx, const int16 my );
int16 Aev_FontBubbleGEM( const int16 font_id, const int16 points );

/* OLGA-Protokoll */
int16 Aev_OlgaIdle( void );
int16 Aev_OlgaUpdate( const char *datei );
int16 Aev_OlgaGetInfo( const int16 id );
int16 Aev_OlgaRename( const char *old_datei, const char *new_datei );
int16 Aev_OlgaBreaklink( const char *datei );

/* DHST-Protokoll */
int16 Aev_DhstAdd( const char *docname, const char *docpath );
int16 Aev_DhstSaved( const char *file );

/******************************************************************************/
/*                                                                            */
/* Maus-Handling                                                              */
/*                                                                            */
/******************************************************************************/

/* Set new Mouse */
void Amo_new( Amouse *mouse );

/* Set busy Indicator */
void Amo_busy( void );

/* Remove busy Indicator */
void Amo_unbusy( void );

/* Hide Mouse */
void Amo_hide( void );

/* Unhide Mouse */
void Amo_show( void );

/******************************************************************************/
/*                                                                            */
/* OBJECT-Handling                                                            */
/*                                                                            */
/******************************************************************************/

/* Creates a Copy of Parent */
OBJECT *Aob_create( const OBJECT *parent );

/* Frees Object generated by Aob_create */
void Aob_delete( OBJECT *object );

/* Changes G_ICON to G_CICON, if possible */
void Aob_icon( OBJECT *object );

/* Fixes Object */
void Aob_fix( OBJECT *object );

/* Calculate Redraw-Rectangle for Object */
void Aob_offset( Axywh *redraw, OBJECT *ob, int16 entry );

/* Count the Objects in an Object-Tree */
int16 Aob_count( const OBJECT *tree, boolean count_aobject );

/* save rectangle of desktop */
MFDB *Aob_save( Axywh *rect );

/* restore desktop previously save with Aob_save */
void Aob_restore( MFDB *save, Axywh *rect );

/* Watched Object, select, if pointer upon obnr  */
/* returns TRUE, if button was release upon obnr */
int16 Aob_watch( Awindow *window, int16 obnr );

/* Klick-Routine, die Awi_help(ev_window) aufruft */
void Aob_help( void );

/* Find obnr for which Flagmask becomes TRUE, obnr is start object */
int16 Aob_findflag( OBJECT *ob, int16 obnr, int16 flag );

/* PrÅfen, ob ein Objekt sichtbar ist (bzw. je nach Slider-Stellungen sein kînnte) */
int16 Aob_visible( OBJECT *tree, int16 obnr );

/* Find parent Objectnr, returns -1 on top level */
int16 Aob_up( OBJECT* ob, int16 obnr );

/* Bits aus ob_flags und ob_state setzen oder lîschen */
int16 Aob_flags( Awindow *window, int16 obnr, int16 flag, int16 setflag );
int16 Aob_state( Awindow *window, int16 obnr, int16 flag, int16 setflag );

/* Setzt TEXT in das Objekt ein, betrachtet die Typen!        */
/* Nur fÅr die USERDEFS wird in UB_PTR1 dynamisch Speicher    */
/* entsprechend der TextlÑnge angelegt, sonst darf auf keinen */
/* Fall die TextlÑnge die vorhandene LÑnge Åberschreiten!!!   */
void Aob_puttext( const OBJECT *ob, const int16 obnr, char *text );

/* Gibt analog zu printf Text in ein Objekt aus, 1024 Zeichen Puffer */
void Aob_printf( const OBJECT *ob, const int16 obnr, const char *format, ... );

/* Holt Text aus Objekt, TEXT muû lang genug sein!           */
/* zurÅckgeleifert wird die LÑnge des Textes oder -1         */
/* wenn die LÑnge nicht ermittelt werden konnte.             */
/* wird TEXT=NULL gesetzt, wird nur die LÑnge ermittelt,     */
/* was dazu dienen kann, die TextlÑnge dynamisch zu erfragen */
int16 Aob_gettext( const OBJECT *ob, const int16 obnr, char *text );

/* Holt Werte analog zu scanf, liefert analog zu Aob_gettext */
/* nur LÑnge wenn format!=NULL, 1024 Zeichen Puffer          */
int16 Aob_scanf( const OBJECT *ob, const int16 obnr, const char *format, ... );

/* Is x/y in Rectangle? */
int16 Aob_within( const Axywh* rect, const int16 x, const int16 y );

/* Send a message to an object */
int16 Aob_service( OBJECT *tree, int16 obnr, int16 task, void *in_out );

/******************************************************************************/
/*                                                                            */
/* MenÅ-Handling                                                              */
/*                                                                            */
/******************************************************************************/

/* Fixes Tree on different Length of first Title (name) */
void Ame_namefix( OBJECT *menu );

/* Pop up a Popup-Menu, x/y determs upper left Edge */
/* returns selected Obnr, If a Callback is defined, */
/* it will be called                                */
int16 Ame_popup( Awindow *window, OBJECT *popup, int16 x, int16 y );

/* Build a Popup out of pstr, the Entry chk will be checked,        */
/* should be a substring of pstr, Width is the Pixel-Width of Popup */
/* returns the selected Substring or NULL in none                   */
char* Ame_strpopup( Awindow* wi, char* pstr, char* chk, int16 width, int16 x, int16 y );

/******************************************************************************/
/*                                                                            */
/* Backplane-Support-Funktionen                                               */
/*                                                                            */
/******************************************************************************/

/* IMG-Header */
typedef struct
{
   int16 version;
   int16 headlen;                                  /* normally 8 */
   int16 planes;
   int16 pat_run;
   int16 pix_width;
   int16 pix_height;
   int16 sl_width;
   int16 sl_height;
} IMG_HEADER;

/******************************************************************************/

/* XIMG-Header */
#define RGB       (0)                                 /* col-table-model for color_model */
#define CYM       (1)
#define HLS       (2)
#define PANTONE   (3)

/******************************************************************************/

/* Color-Entries for XIMG-Header */
typedef struct
{
   uint16   red;
   uint16   green;
   uint16   blue;
}  RGB_LIST;

/******************************************************************************/

typedef struct
{
   int16 version;
   int16 headlen;                                  /* sizeof (XIMG_HEADER) + sizeof (all_rgb_list) */
   int16 planes;
   int16 pat_run;
   int16 pix_width;
   int16 pix_height;
   int16 sl_width;
   int16 sl_height;
   char  x_id[4];                                  /* should be 'XIMG' */
   int16 color_model;                              /* see defines above */
   RGB_LIST color_table[];                         /* array of colors, length is 2^planes */
} XIMG_HEADER;

/******************************************************************************/

/* Create Backplane with Width w and Height h */
MFDB* Abp_create( int16 w, int16 h );

/* Free Backplane */
void Abp_delete( MFDB *backplane );

/* Start Writing on Backplane (all VDI and AES Calls) */
void Abp_start( MFDB *backplane );

/* Stop Writing on Backplane, resume to Screen */
void Abp_end( void );

/* Converts IMAGE to MFDB, transform into dev-fmt, if do_trnsfm=TRUE, OK on success */
int16 Abp_img2mfdb( IMG_HEADER *org, MFDB **dest, int16 do_trnsfm );

/* Converts dev-depend. MFDB to IMG-Format, gives IMG-DATA-Length */
/* dest=NULL serves ONLY img_len, returns OK on sucess */
int16 Abp_mfdb2img( MFDB* org, IMG_HEADER **dest, int32 *img_len );

/******************************************************************************/
/*                                                                            */
/* Drag-Support-Funktionen                                                    */
/*                                                                            */
/******************************************************************************/

/* substitute for objc_find */
int16 Adr_find( OBJECT *work, int16 start, int16 depth, int16 x, int16 y );

/* Start Drawing a Box which select intersected Objects */
void Adr_box( int16 x, int16 y );

/* Drag Objectlist */
void Adr_drag( int16 x, int16 y );

/* Initialize Start */
void Adr_start( void );

/* Returns next obnr from List, init with Adr_start(), */
/* return -1 if no more Object are available           */
int16 Adr_next( void );

/* Add Object in Aselect-List */
void Adr_add( Awindow *window, const int16 obnr );

/* Delete Object from Aselect-List, did not update on Screen ! */
void Adr_del( Awindow *window, const int16 obnr );

/* Unselect all Object in List, update Screen ! */
void Adr_unselect( void );

/******************************************************************************/
/*                                                                            */
/* Char- und String-Support-Funktionen                                        */
/*                                                                            */
/******************************************************************************/

/* Zeichen in Groû-/Kleinbuchstaben wandeln (incl. Umlaute!) */
char Ach_toupper( const char ch );
char Ach_tolower( const char ch );

/* Ist ein Zeichen ein "Blank"? (incl. '\r', '\n' & '\t') */
int16 Ach_isWhite( const char c );

/******************************************************************************/

/* Neue Kopie eines Strings anlegen bzw. freigeben */
char* Ast_create( const char *parent );
void Ast_delete( char *string );

/* Strings in Groû-/Kleinbuchstaben wandeln */
char *Ast_tolower( char *string );
char *Ast_toupper( char *string );

/* FÅhrende und abschlieûende Leerzeichen entfernen */
char *Ast_ltrim( char *string );
char *Ast_rtrim( char *string );
char *Ast_alltrim( char *string );

/* Stringvergleiche mit und ohne Groû/Klein-Unterscheidung */
int16 Ast_cmp( const char *str_1, const char *str_2 );
int16 Ast_icmp( const char *str_1, const char *str_2 );
int16 Ast_ncmp( const char *str_1, const char *str_2, const int16 max_char );
int16 Ast_incmp( const char *str_1, const char *str_2, const int16 max_char );

/* String im String suchen ohne Groû/Klein-Unterscheidung */
char *Ast_istr( const char *s1, const char *s2 );

/* Ist ein String leer, bis auf "Blanks"? */
int16 Ast_isEmpty( const char *string );

/* Mehrere Strings linksbÅndig zusammensetzen, GesamtlÑnge vorgegeben */
char *Ast_add( int16 anzahl, char *ergebnis, ... );

/* Einen String mitels Blanks links-/rehtsbÅndig bzw. zentriert auf bestimte LÑnge bringen */
char *Ast_adl( char *string, int32 len );
char *Ast_adr( char *string, int32 len );
char *Ast_adc( char *string, int32 len );

/* Zeichen aus einem String herausfiltern */
char *Ast_filter( char *string, char *wrg_char, char *right_char );

/* Die Anzahl von bestimmten Zeichen zÑhlen */
int32 Ast_count( const char *string, const char *zeichen );

/* Zwei Dateinamen vergleichen, der erste darf die Åblichen Wildcards enthalten */
int16 Ast_fcmp( char *filename1, char *filename2 );

/* Einen String umdrehen, d.h. letztes Zeichen als erstes usw. */
char *Ast_reverse( char *reverse, const char *string );

/* Anzahl der Strings eines ASCIZZ-Strings zÑhlen */
int16 Ast_countASCIZZ( const char *asciizz );

/* Einen ASCIIZZ-String in ein Array von Strings splitten */
int16 Ast_splitASCIIZZ( const char *ascizz, char ***strings, int16 *anz );

/* Aus einem String-Array einen ASCIIZZ-String machen */
char *Ast_mergeASCIIZZ( const char **strings, const int16 anzahl, const int16 global );

/* Ein Array von Strings komplett freigeben */
void Ast_deleteAry( char **strings, int16 anzahl );

/******************************************************************************/
/*                                                                            */
/* Funktionen zur Zeichensatz-Wandelung mittels KEYTAB                        */
/*                                                                            */
/******************************************************************************/

/* Funktionen rund um den CookieJar - Functions around the CookieJar   */
KEYT *Akt_getKeyTab( void );
int16 Akt_getRelease( void );

/******************************************************************************/

/* Auskunfts-Funktionen Åber Filter - Info-Functions about the Filters */
int16 Akt_getExpMinNr( void );
int16 Akt_getExpMaxNr( void );
int16 Akt_getImpMinNr( void );
int16 Akt_getImpMaxNr( void );
char *Akt_getExpNameFromNr( int16 nr );
char *Akt_getImpNameFromNr( int16 nr );
char *Akt_getExpShortNameFromNr( int16 nr );
char *Akt_getImpShortNameFromNr( int16 nr );
int16 Akt_getExpNrFromId( int16 id );
int16 Akt_getImpNrFromId( int16 id );
int16 Akt_getExpIdFromNr( int16 nr );
int16 Akt_getImpIdFromNr( int16 nr );
int16 Akt_getExpNrFromName( char *name );
int16 Akt_getImpNrFromName( char *name );
int16 Akt_getInfoShort( int16 nr, int16 what, int16 *info );
int16 Akt_getInfoString( int16 nr, int16 what, char *info, int16 max_len );

/******************************************************************************/

/* Konvertieren von Zeichen - Conversion of Chars */
char Akt_CharAtari2X( int16 nr, char ch );
char Akt_CharX2Atari( int16 nr, char ch );
int16 Akt_CharX2Unicode( int16 nr, char ch );
char Akt_CharUnicode2X( int16 nr, int16 unicode );
int32 Akt_CharXUtf2Unicode( int16 nr, char *string, int32 len, int16 *read_chars );
char *Akt_CharUnicode2XUtf( int16 nr, int32 lunicode, char *result, int16 *used_chars );

/* Konvertieren von Speicherblîcken - Conversion of memory blocks */
char *Akt_BlockAtari2X( char *dest_string, int16 nr, char *source_string, int32 len );
char *Akt_BlockX2Atari( char *dest_string, int16 nr, char *source_string, int32 len );
int16 *Akt_BlockX2Unicode( int16 *unicode, int16 nr, char *x_chrs, int32 len );
char *Akt_BlockUnicode2X( char *x_chrs, int16 nr, int16 *unicode, int32 len );
int16 *Akt_BlockXUtf2Unicode( int16 *unicode, int32 *uni_len, int16 nr, char *x_chrs, int32 len );
char *Akt_BlockUnicode2XUtf( char *x_chrs, int32 *str_len, int16 nr, int16 *unicode, int32 len );
char *Akt_BlockXUtf2U2XUtf( char *dest, int32 *dest_len, int16 dest_nr, char *source, int32 src_len, int16 src_nr );
char *Akt_BlockXUtf2XUtf( char *dest, int32 *dest_len, int16 dest_nr, char *source, int32 src_len, int16 src_nr );

/* Konvertieren von Strings - Conversion of Strings */
char *Akt_StringAtari2X( char *dest_string, int16 nr, char *source_string );
char *Akt_StringX2Atari( char *dest_string, int16 nr, char *source_string );
int16 *Akt_StringX2Unicode( int16 *unicode, int16 nr, char *string );
int16 *Akt_StringXUtf2Unicode( int16 *unicode, int32 *uni_len, int16 nr, char *string );
char *Akt_StringXUtf2U2XUtf( char *dest, int32 *dest_len, int16 dest_nr, char *source, int16 src_nr );
char *Akt_StringXUtf2XUtf( char *dest, int32 *dest_len, int16 dest_nr, char *source, int16 src_nr );

/******************************************************************************/

/* Das Euro-Zeichen und Infos Åber Euro - The Euro-Sign and Infos about Euro */
int32 Akt_getEuro( void );

/******************************************************************************/

/* ACS-UnterstÅtzung zur Auswahl der Filter */
char *Akt_popExpName( int16 *width );
char *Akt_popImpName( int16 *width );
int16 Akt_chooseExpNr( Awindow *window, int16 x, int16 y );
int16 Akt_chooseImpNr( Awindow *window, int16 x, int16 y );

/******************************************************************************/
/*                                                                            */
/* Icon- und Image-Support-Funktionen                                         */
/*                                                                            */
/******************************************************************************/

/* Create a Copy of Icon, but not image Part ! */
CICONBLK *Aic_create( const CICONBLK *icon );

/* Release this Copy */
void Aic_delete( CICONBLK *icon );

/* Create a bitblk-Copy, but not Image */
BITBLK *Aim_create( const BITBLK *bitblk );

/* Release Copy */
void Aim_delete( BITBLK *bitblk );

/******************************************************************************/
/*                                                                            */
/* Funktionen fÅr UserDef-Objekte                                             */
/*                                                                            */
/******************************************************************************/

/* Create a Copy */
AUSERBLK* Aus_create( const AUSERBLK *user );

/* Release this Copy */
void Aus_delete( AUSERBLK *user );

/* Klick-Routine: ST-Guide-Hilfe zum Fenster anzeigen */
void Aus_help( void );

/******************************************************************************/
/*                                                                            */
/* TEDINFO-Support-Funktionen                                                 */
/*                                                                            */
/******************************************************************************/

/* Create a Copy */
TEDINFO* Ate_create( const TEDINFO *tedi );

/* Release this Copy */
void Ate_delete( TEDINFO *tedi );

/******************************************************************************/
/*                                                                            */
/* Funktionen rund ums Speicher-Management                                    */
/*                                                                            */
/******************************************************************************/

/* Speicher allozieren */
void *Ax_malloc( int32 size );
void *Ax_glmalloc( int32 size );

/* Speicher freigeben */
void Ax_recycle( void *memory, int32 size );
void Ax_free( void *memory );
void Ax_glfree( void *memory );

/* Speicher sofort freigeben       */
/* ACHTUNG: Mit Vorsicht benutzen! */
void Ax_ifree( void *memory );

/* Speicher auf Les-/Schreibbarkeit prÅfen (Speicherschutz!) */
int16 Ax_memCheck( const char *buffer, int32 len, int16 write );

/* Liste fÅr recyclebaren Speicher erzeugen/Ñndern/lîschen */
int16 Ax_setRecycleSize( int32 size, int16 amount, char *beschreibung );

/* Akt. Statistik Åber freie Listen zusammenstellen und liefern */
MemFreeBlockStat *Ax_getRecycleStat( int16 *anzahl );

/******************************************************************************/
/*                                                                            */
/* Utility-Funktionen                                                         */
/*                                                                            */
/******************************************************************************/

typedef struct afilelist
{
   char *file;
   struct afilelist *next;
   XATTR attribs;
} A_FileList;

/******************************************************************************/

/* Alias object, number in userp1 */
void Aob_alias( void );

/* Draw a Dialogbox near the Pointer, handle Draw and Redraw, returns Buttonnumber */
int16 A_dialog( OBJECT* dia );

/* Same as A_dialog, except Position is not changed (dia->ob_x/y) */
int16 A_dialog2( OBJECT* dia );

/* Display an Alert-Box with one String-Parameter */
/* alert must have the form [X][...%s....][Y] */
int16 alert_str( const char* alert, const char* para );

/* Veschneidet beide Rechtecke, TRUE wenn Schnitt existiert */
int16 intersect( Axywh* to, const Axywh* from );

/* Wandelt Axywh in pxyarray */
void xywh2array( int16 *to, const Axywh *from );

/* Wandlet pxyarray in Axywh */
void array2xywh( Axywh *to, const int16 *from );

/* Punktierte waagerechte Linie */
void dotted_xline( int16 x1, int16 x2, int16 y );

/* Punktierte senkrechte Linie */
void dotted_yline( int16 y1, int16 y2, int16 x );

/* Den Wert des 200Hz-Timers liefern */
uint32 Ash_gettimer( void );

/* Die Farbwerte ab NVDI 5.x liefern */
const RGB1000 * const Avdi_getRGB( int16 index );

/******************************************************************************/
/*                                                                            */
/* Funktionen rund um Datumswerte                                             */
/*                                                                            */
/******************************************************************************/

/* Convert the month of a __DATE__-like String into a number 1..12 */
/* or 0 if an error occurs or no month is detected                 */
/*       __DATE__-format: "MMM DD YYYY" with                       */
/*           MMM  - Month "jan", "Feb" etc,                        */
/*           DD   - Day of Month with leading space                */
/*           YYYY - Year with Century                              */
int16 Adate_getMonth( const char *date, char *out_month );

/******************************************************************************/
/*                                                                            */
/* Zeichen-Routinen der Standard-ACS-UserDefs                                 */
/*                                                                            */
/******************************************************************************/

int16 CDECL A_checkbox( PARMBLK* pb );    /* checkboxes, parm simular to ob_spec for boxes ! */
int16 CDECL A_radiobutton( PARMBLK* pb ); /* uses CHECKBOX-Routine */
int16 CDECL A_innerframe( PARMBLK* pb );  /* draws a frames half a character inside ! */
int16 CDECL A_pattern( PARMBLK* pb );     /* draws general patterns */
int16 CDECL A_arrows( PARMBLK* pb );      /* draws arrows */
int16 CDECL A_select( PARMBLK* pb );      /* select in a frame instead of reverse */
int16 CDECL A_ftext( PARMBLK* pb );       /* Formated multiline Text */
int16 CDECL A_3Dbutton( PARMBLK *pb );    /* 3D-Style Buttons */
int16 CDECL A_cycle( PARMBLK *pb );       /* Cycle Buttons */
int16 CDECL A_picture( PARMBLK *pb );     /* draw picture */
int16 CDECL A_title( PARMBLK *pb );       /* underscored title */
int16 CDECL A_boxed( PARMBLK *pb );

/******************************************************************************/
/*                                                                            */
/* Service-Routinen der Standard-ACS-UserDefs                                 */
/*                                                                            */
/******************************************************************************/

/******************************************************************************/
/*                                                                            */
/* Service-Routinen des ACS-UserDefs FText                                    */
/*                                                                            */
/******************************************************************************/

#define AUO_FTFONT            (300)                /* Set Font, int16 * */
#define AUO_FTHEIGHT          (301)                /* Set Height, int16 * */
#define AUO_FTCOLOR           (302)                /* Set Color, int16 * */
#define AUO_FTEFFECTS         (303)                /* Set Effects, int16 * */
#define AUO_FTLEFT            (304)                /* Set leftalign */
#define AUO_FTRIGHT           (305)                /* Set right align */
#define AUO_FTCENTER          (306)                /* Set center align */
#define AUO_FTBLOCK           (307)                /* Set block align */

/******************************************************************************/

int16 Auo_ftext( OBJECT* entry, int16 task, void* in_out );
int16 Auo_string( OBJECT* entry, int16 task, void* in_out );

/******************************************************************************/
/*                                                                            */
/* Service-Routinen des ACS-UserDefs Cycle                                    */
/*                                                                            */
/******************************************************************************/

#define AUO_CYCPOPUP          (400)                /* set popup string */
#define AUO_CYCINDEX          (401)                /* set index, int16 * */
#define AUO_CYCGETINDEX       (402)                /* return actual index, int16 * */

/******************************************************************************/

int16 Auo_cycle( OBJECT* entry, int16 task, void* in_out );
void Aus_cycle( void );

/******************************************************************************/
/*                                                                            */
/* Service-Routinen des ACS-UserDefs Picture                                  */
/*                                                                            */
/******************************************************************************/

#define AUO_PICMFDB           (500)                /* take MFDB, will not copy MFDB */

int16 Auo_picture( OBJECT* entry, int16 task, void* in_out );

/******************************************************************************/
/*                                                                            */
/* Service-Routinen des ACS-UserDefs BoxEdit                                  */
/*                                                                            */
/******************************************************************************/

#define BE_MAXLEN          (255)

/******************************************************************************/

typedef struct
{
   unsigned upcol       :4;
   unsigned downcol     :4;
   unsigned mask        :5;
   unsigned textlen     :8;
   unsigned textcol     :4;
   unsigned capital     :1;
   unsigned smallfont   :1;
   unsigned threedim    :1;
   unsigned secret      :1;
   unsigned resv        :3;
} beparm;

/******************************************************************************/

/* Nachrichten */
#define AUO_BEINCPOS    (700)
#define AUO_BEDECPOS    (701)
#define AUO_BEINCWPOS   (702)
#define AUO_BEDECWPOS   (703)
#define AUO_BEINSCHAR   (704)
#define AUO_BEINSTEXT   (705)
#define AUO_BESETSELECT (706)
#define AUO_BEGETSELECT (707)
#define AUO_BEBS        (708)
#define AUO_BEBSW       (709)
#define AUO_BEBSLINE    (710)
#define AUO_BEDEL       (711)
#define AUO_BEDELW      (712)
#define AUO_BEDELLINE   (713)
#define AUO_BEDELALL    (714)
#define AUO_BEMASK      (715)
#define AUO_BECHARLIST  (716)

/******************************************************************************/

/* Masken */
#define BEM_ALL            (0)   /* alles */
#define BEM_PATH           (1)   /* alles */
#define BEM_FILE           (2)   /* alles ohne \: */
#define BEM_TOSFILE        (3)   /* A-Za-z0-9 ._!@#$%^&()+-=~';",<>|[]{} */
#define BEM_TOSFILESPEC    (4)   /* BEM_TOSFILE *? */
#define BEM_TOSPATH        (5)   /* BEM_TOSFILE \: */
#define BEM_TOSPATHSPEC    (6)   /* BEM_TOSFILE \:*? */
#define BEM_NORM           (7)   /* Space... */
#define BEM_ALPHA          (8)   /* a-zA-Z Space */
#define BEM_ALPHADIGIT     (9)   /* a-zA-Z0-9 Space */
#define BEM_BIN            (10)  /* 0-1 */
#define BEM_NEGBIN         (11)  /* - 0-1 */
#define BEM_OCT            (12)  /* 0-7 */
#define BEM_NEGOCT         (13)  /* - 0-7 */
#define BEM_DEC            (14)  /* 0-9 */
#define BEM_NEGDEC         (15)  /* - 0-9 */
#define BEM_HEX            (16)  /* 0-9A-Z */
#define BEM_NEGHEX         (17)  /* - 0-9A-Z */
#define BEM_FLOAT          (18)  /* 0-9.0-9 */
#define BEM_NEGFLOAT       (19)  /* - 0-9.0-9 */
#define BEM_DATEEURO       (20)  /* Tag(2).Monat(2).Jahr(4) */
#define BEM_DATEEURO_SEP   (21)  /* Tag(2)/Monat(2)/Jahr(4) */
#define BEM_DATEUS         (22)  /* Monat(2).Tag(2).Jahr(4) */
#define BEM_DATEUS_SEP     (23)  /* Monat(2)/Tag(2)/Jahr(4) */
#define BEM_TIME           (24)  /* Std:Min(2):sek(2) Std unbegrenzt */
#define BEM_TIME12         (25)  /* Std(2):Min(2):sek(2) max 12 Stunden */
#define BEM_TIME24         (26)  /* Std(2):Min(2):sek(2) max 24 Stunden */

/******************************************************************************/

int16 Auo_boxed( OBJECT *entry, int16 task, void *in_out );
void Aus_boxed( void );

/******************************************************************************/
/*                                                                            */
/* ACS-System- und Shell-Funktionen                                           */
/*                                                                            */
/******************************************************************************/

/* Call an other Program (return retvalue of Pexec(Basepage)) */
int32 Ash_prog( char *path, char *command, char **env );

/* Load and initialize an ACS-Module (returns OK or FAIL) */
int16 Ash_module( char* path );

/* Standard-Error-Handler */
void Ash_error( int16 messerr, void *para );

/* Returns cyclic D&D-Partners, init act with NULL, end is NULL */
A_dd *Ash_nextdd( A_dd *act );

/* sendet DD-Partnern (mit Typ type) oder unter MTOS/MagiC */
/* allen (type<0) den 8 int16-langen Messageblock */
int16 Ash_sendall( int16 *mess, int32 type );

/* looks for 'char' in Env and returns value */
char *Ash_getenv( const char *var );

/* Die Icons fÅr das Fenster der Druck-Dialoge, Zeichensatz- */
/* Auswahl und den File-Selector setzen.                     */
void Ash_printSetIcon( CICONBLK *icon, int16 ghost );
void Ash_fontSetIcon( CICONBLK *icon, int16 ghost );
void Ash_fileSetIcon( CICONBLK *icon, int16 ghost );

/* Die WDIALOG-Druck-Dialoge aufrufen */
int16 Ash_print( PRN_SETTINGS *setting, int16 x, int16 y, int16 option,
                  char *title, Awindow *window );

/* Die Zeichensatz-Auswahl Åber die fnts_xx-Funktionen aufrufen */
int16 Ash_font( const char *title, const int16 x, const int16 y, const int16 font_flag,
         const int16 button_flag, A_FontSel *font, const char *sample, const char *opt_button,
         A_FontFkt set, A_FontFkt mark, A_FontFkt opt, void *para, Awindow *window );

/* Der MagiC-Fileselector - nur Åber FSLX-Funktionen bedient     */
/* Der Fileselector wird - wenn mîglich - im Fenster aufgerufen  */
/* und lÑuft dann als (nicht-)modaler Fenster-Dialog komplett in */
/* ACS integriert! Evetl. wird der File-Selector Åber die        */
/* Funktion fslx_do als modaler Dialog aufgerufen. Falls auch    */
/* dies schief geht, gibt es eine leere Liste als Antwort... ;-) */
ULinList *Ash_fileselect( char *title, int16 x, int16 y, char *path, char *fname,
               char *patterns, XFSL_FILTER *filter, char *paths, int16 sort_mode,
               int16 flags, Awindow *meldung );


/******************************************************************************/
/*                                                                            */
/* Sog. "Thermometer" fÅr lÑngere Aktionen/Schleifen                          */
/*                                                                            */
/******************************************************************************/

/* Art des Thermometers (Parameter kind in Ash_thermometer) */
#define THERMO_MINIMAL  0x00
#define THERMO_TEXT     0x01
#define THERMO_CANCEL   0x02
#define THERMO_PERCENT  0x04
#define THERMO_NONMODAL 0x08

/******************************************************************************/

/* Benîtigte Funktionszeiger */
struct _ThermoData;
typedef int16 (*A_ThermFkt)( struct _ThermoData *thermo );

/******************************************************************************/

typedef struct _ThermoData
{
   int32 aufruf;           /* SchleifenzÑhler - Nummer des aktuellen Schleifendurchlaufes */
   int32 aktuell;          /* Bereits erledigte Aufgaben (ergibt Prozentzahl)             */
   int32 maximum;          /* Aufgabenanzahl insgesamt (fÅr Prozentzahl)                  */
   char text[51];          /* Text, der im Textfeld angezeigt werden soll                 */
   void *data;             /* Daten, die die Schleifen-Funktionen benîtigen               */
                           /* wird an Ash_thermometer Åbergeben und weitergereicht        */
   A_ThermFkt init;        /* Funktion, die alles notwendige initialisiert  */
   A_ThermFkt start;       /* Funktion, die den Start zu Beginn oder        */
                           /* nach einem "Zwischen-Stop" einleitet          */
   A_ThermFkt cont;        /* Funktion, die die Abbruchbedingung formuliert */
                           /* bzw. ugekehrt angibt, wenn es weiterlÑuft     */
                           /* (innerhalb init-Methode des Thermometers)     */
   A_ThermFkt fkt;         /* Funktion, die die eigentliche Aktion ausfÅhrt */
                           /* (innerhalb init-Methode des Thermometers)     */
   A_ThermFkt stop;        /* Funktion, die die einen "Zwischen-Stop" ein-  */
                           /* legt bzw. am Ende aufgerufen wird             */
   A_ThermFkt quit;        /* Funktion, die alles abschlieût                */
} ThermoData;

/******************************************************************************/

int16 Ash_thermometer( const int16 kind, const char *titel, const int16 color, void *data,
         A_ThermFkt init, A_ThermFkt start, A_ThermFkt cont, A_ThermFkt fkt,
         A_ThermFkt stop, A_ThermFkt quit );

/******************************************************************************/
/*                                                                            */
/* Debug-Funktion                                                             */
/*                                                                            */
/******************************************************************************/

void DEBUG_MEM( void *defective );

#undef __PS__

/******************************************************************************/
/*                                                                            */
/* In ACS integrierte NKCC-FunktionalitÑt                                     */
/*                                                                            */
/******************************************************************************/

#ifndef __NKCC
   #define __NKCC
   /*******************************************************************************
    * NKCC-Header
    * Autor: Harald Siegmund (adequate systems)
    * ACS verwendet ab Version 2.18 nur noch NKCC-Tastencodes (AO_SCANCODE ist
    * also nicht mehr gÅltig).
    * Es wird zwar kstate aus der Hauptschleife zurÅckgeliefert,
    * allerdings lÑût sich die Taste samt der Umschalttasten komplett
    * aus ev_mkretrun ableiten, die 16 Bits aus ev_mkreturn sind folgendermaûen
    * belegt:
    *
    * 1111110000000000
    * 5432109876543210
    * ||||||||++++++++-> acht Bits, druckbarer Ascii-Code ((char) ev_mkreturn)
    * |||||||+---------> rechte Shifttaste                (ev_mkreturn & NKF_RSH)
    * ||||||+----------> linke Shifttaste                 (ev_mkreturn & NKF_LSH)
    * ||||||                                beide Tasten: (ev_mkreturn & NKF_SHIFT)
    * |||||+-----------> Control-Taste                    (ev_mkreturn & NKF_CTRL)
    * ||||+------------> ALT-Taste                        (ev_mkreturn & NKF_ALT)
    * |||+-------------> CAPS-Taste                       (ev_mkreturn & NKF_CAPS)
    * ||+--------------> Eingabe Åber ALT-Num-Pad         (ev_mkreturn & NKF_NUM)
    * |+---------------> reserviert
    * +----------------> Taste mit 'Funktion',            (ev_mkreturn & NKF_FUNC)
    *                    wenn gesetzt, dann entweder ALT- oder CONTROL-Kombination oder
    *                    eine Sondertaste (also HELP, ESC, Cursortasten oder F-Tasten,
    *                    deren Codes unter NK_???? definiert sind (s.u.))
    */

/* flags for special key code handling */
/* not used */

/* NKCC key code flags */

   #define NKF_FUNC     0x8000         /* function          */
   #define NKF_RESVD    0x4000         /* resvd, ignore it! */
   #define NKF_NUM      0x2000         /* numeric pad       */
   #define NKF_CAPS     0x1000         /* CapsLock          */
   #define NKF_ALT      0x0800         /* Alternate         */
   #define NKF_CTRL     0x0400         /* Control           */
   #define NKF_SHIFT    0x0300         /* any Shift key     */
   #define NKF_LSH      0x0200         /* left Shift key    */
   #define NKF_RSH      0x0100         /* right Shift key   */
   #define NKF_MODIFY   (NKF_CAPS|NKF_ALT|NKF_CTRL|NKF_SHIFT)

   #define NKF_IGNUM    NKF_RESVD      /* special flag for nkc_cmp() */

   /* Special Key-Codes for Keys performing a Function */

   #define NK_INVALID   0x00           /* invalid key code      */
   #define NK_UP        0x01           /* cursor up             */
   #define NK_DOWN      0x02           /* cursor down           */
   #define NK_RIGHT     0x03           /* cursor right          */
   #define NK_LEFT      0x04           /* cursor left           */
   #define NK_M_PGUP    0x05           /* Mac: page up          */
   #define NK_M_PGDN    0x06           /* Mac: page down        */
   #define NK_M_END     0x07           /* Mac: end              */
   #define NK_BS        0x08           /* Backspace             */
   #define NK_TAB       0x09           /* Tab                   */
   #define NK_ENTER     0x0a           /* Enter                 */
   #define NK_INS       0x0b           /* Insert                */
   #define NK_CLRHOME   0x0c           /* Clr/Home              */
   #define NK_POS1      0x0c           /* Pos1                  */
   #define NK_RET       0x0d           /* Return                */
   #define NK_HELP      0x0e           /* Help                  */
   #define NK_UNDO      0x0f           /* Undo                  */
   #define NK_F1        0x10           /* function key #1       */
   #define NK_F2        0x11           /* function key #2       */
   #define NK_F3        0x12           /* function key #3       */
   #define NK_F4        0x13           /* function key #4       */
   #define NK_F5        0x14           /* function key #5       */
   #define NK_F6        0x15           /* function key #6       */
   #define NK_F7        0x16           /* function key #7       */
   #define NK_F8        0x17           /* function key #8       */
   #define NK_F9        0x18           /* function key #9       */
   #define NK_F10       0x19           /* function key #10      */
   #define NK_M_F11     0x1a           /* Mac: function key #11 */
   #define NK_ESC       0x1b           /* Esc                   */
   #define NK_M_F12     0x1c           /* Mac: function key #12 */
   #define NK_M_F14     0x1d           /* Mac: function key #12 */
   #define NK_RVD1E     0x1e           /* reserved!             */
   #define NK_DEL       0x1f           /* Delete                */

   /* terminator for key code tables */
   #define NK_TERM      ((int16)(NKF_FUNC | NK_INVALID))

   /* ASCII codes less than 32 */
   /* not supported by ACS, just for general purpose */
   #define NUL          0x00           /* Null */
   #define SOH          0x01           /* Start Of Header */
   #define STX          0x02           /* Start Of Text */
   #define ETX          0x03           /* End Of Text */
   #define EOT          0x04           /* End Of Transmission */
   #define ENQ          0x05           /* Enquiry */
   #define ACK          0x06           /* positive Acknowledgement */
   #define BEL          0x07           /* Bell */
   #define BS           0x08           /* BackSpace */
   #define HT           0x09           /* Horizontal Tab */
   #define LF           0x0a           /* Line Feed */
   #define VT           0x0b           /* Vertical Tab */
   #define FF           0x0c           /* Form Feed */
   #define CR           0x0d           /* Carriage Return */
   #define SO           0x0e           /* Shift Out */
   #define SI           0x0f           /* Shift In */
   #define DLE          0x10           /* Data Link Escape */
   #define DC1          0x11           /* Device Control 1 */
   #define XON          0x11           /* same as DC1 */
   #define DC2          0x12           /* Device Control 2 */
   #define DC3          0x13           /* Device Control 3 */
   #define XOFF         0x13           /* same as DC3 */
   #define DC4          0x14           /* Device Control 4 */
   #define NAK          0x15           /* Negative Acknowledgement */
   #define SYN          0x16           /* Synchronize */
   #define ETB          0x17           /* End of Transmission Block */
   #define CAN          0x18           /* Cancel */
   #define EM           0x19           /* End of Medium */
   #define SUB          0x1a           /* Substitute */
   #define ESC          0x1b           /* Escape */
   #define FS           0x1c           /* Form Separator */
   #define GS           0x1d           /* Group Separator */
   #define RS           0x1e           /* Record Separator */
   #define US           0x1f           /* Unit Separator */

   /*******************************************************************************
    * PROTOTYPES
    */

   /* TOS-Key & NKCC-Key */
   int32 nkc_n2tos( int16 nkcode );
   int16 nkc_tos2n( int32 toskey );

   #define nkc_tconv( toskey )   nkc_tos2n(toskey)

   /* GEM-Key & NKCC-Key */
   int16 nkc_gemks2n( int16 gemkey, int16 kstate );
   int16 nkc_gem2n( int16 gemkey );
   void nkc_n2gemks( int16 norm, int16 *kstate, int16 *gemkey );
   int16 nkc_n2gem( int16 nkcode );
   int16 nkc_n2kstate( int16 nkcode );

   #define nkc_gconv( gemkey )   nkc_gem2n(gemkey)

   /* Sonstiges */
   int16 nkc_kstate( void );
   int16 nkc_cmp( int16 refkey, int16 kcode );
   int16 nkc_tolower( int16 key );
   int16 nkc_toupper( int16 key );

#endif      /* #ifndef __NKCC */

/******************************************************************************/
/*                                                                            */
/* NÅtzliche Makros                                                           */
/*                                                                            */
/******************************************************************************/

/* Minimum */
#ifndef min
   #define min(A,B) (((A) < (B)) ? (A) : (B))
#endif

/******************************************************************************/

/* Maximum */
#ifndef max
   #define max(A,B) (((A) > (B)) ? (A) : (B))
#endif

/******************************************************************************/
/*                                                                            */
/* Funktionen rund um Dateien und Verzeichnisse                               */
/*                                                                            */
/******************************************************************************/

#define     EOS   '\0'        /* Ende des Strings */
#define     DIR   '\\'        /* Directory-Trenner */
#define     DEV   ':'         /* Device-Trenner */
#define     SEP   '/'         /* Called by Trenner */
#define     EXT   '.'         /* Extension Trenner */

/******************************************************************************/

/* turns filedrv or Dgetdrv if non-exist */
int16 Af_2drv( const char *file );

/* Returns Path of file or "\\"  in dest and back */
char *Af_2path( char *dest, const char *file );

/* Returns DEMO from [d:][bla\\bli]\\DEMO[.EXT] or "" in dest and back */
char *Af_2name( char *dest, const char *file );

/* Returns DEMO[.EXT] from [d:][bla\\bli]\\DEMO[.EXT] or "" in dest an back */
char *Af_2fullname( char *dest, const char *file );

/* Returns Extension from the Filename(!) or "" in dest and back */
char *Af_2ext( char *dest, const char *file );

/* Builds full Pathfilename, missing Parts were added to dest and back */
char *Af_buildname( char *dest, int16 drv, const char *path,
         const char *name, const char *ext );

/* Changes the extension of a filename */
char *Af_chgExt( char *file, char *new_ext );

/* Ermittelt DateilÑnge (nicht Dirlength) */
int32 Af_length( const char *file );

/* Calls Fileselector */
char *Af_select( char *title, char *path, char *ext );

/* MultiFsel */
char *Af_first_fsel( char *titel, char *path, char *ext);
char *Af_next_fsel( void );

/* Neue Dateiauswahl, bevorzugt Åber fslx_xx-Funktionen, */
/* zur Not per Af_first_sel/Af_next_sel oder Af_select   */
/* RÅckgabe: Lineare Liste mit EintrÑgen char *file      */
ULinList *Af_fileselect( char *title, char *path, char *ext,
                  int16 sort_mode, int16 multi, Awindow *window );

/* Dateien suchen, Verzeichnisse einlesen */
A_FileList *Af_readdir( const char *path );
void Af_freedir( A_FileList *list );
char *Af_first( const char *start, A_FileList *fileinfo );
char *Af_next( A_FileList *fileinfo );

/* Returns full Path of CFG-File */
char *Af_cfgfile( char* file );

/* Infos gem. Dpathconf, 1=A:, 2=B:, etc. */
int32 Af_pathconf( int16 drv, int16 mode );

/* Dateinamen ggf. quoten bzw. Quote-Zeichen entfernen */
char *Af_quote( char *dest, char *source );
char *Af_unquote( char *dest, char *source );

/* Datei-Zeile parsen und in Liste von Dateinamen zerlegen */
/* Quoting wird beachtet!                                  */
ULinList *Af_parseCmdLine( char *file_string );

/******************************************************************************/
/*                                                                            */
/* Funktionen rund um das GEM-Clipboard                                       */
/*                                                                            */
/******************************************************************************/

/* Deletes SCRAP."ext" or SCRAP.*, if ext=NULL */
void Ascrp_clear( const char *ext );

/* Reads from clipboard SCRAP."ext" or first Scrap-file  */
/* If buffer==NULL, only Length will be returned, Buffer */
/* and real ext are returned and TRUE, if all is ok      */
int16 Ascrp_get( char *ext, void **buffer, int32 *len );

/* Writes to SCRAP."ext" the len-bytes len buffer    */
/* If append==TRUE, the Buffer will be appendended   */
/* to a possibly existing file. -> TRUE if all is ok */
int16 Ascrp_put (char *ext, void *buffer, int32 len, int16 append );

/******************************************************************************/
/*                                                                            */
/* Die lineare unsortierte Liste                                              */
/*                                                                            */
/******************************************************************************/

/* Eine lineare Liste erzeugen und wieder vernichten */
ULinList *Alu_create( void );
void Alu_delete( ULinList *liste );

/* Diverse Standard-Such-Funktionen */
int16 Alu_ptrCmp( void *para, void *elem );
int16 Alu_longCmp( void *para, void *elem );
int16 Alu_intCmp( void *para, void *elem );
int16 Alu_charCmp( void *para, void *elem );
int16 Alu_strCmp( void *para, void *elem );
int16 Alu_striCmp( void *para, void *elem );

/******************************************************************************/
/*                                                                            */
/* Der Stack (Stapel)                                                         */
/*                                                                            */
/******************************************************************************/

/* Einen Stack erzeugen und wieder vernichten */
Stack *As_create( void );
void As_delete( Stack *stack );

/******************************************************************************/
/*                                                                            */
/* Die Warteschlange (Queue)                                                  */
/*                                                                            */
/******************************************************************************/

/* Eine Queue erzeugen und wieder vernichten */
Queue *Aqu_create( void );
void Aqu_delete( Queue *queue );

/******************************************************************************/
/*                                                                            */
/* Die Konfigurations-String-UnterstÅtzung                                    */
/*                                                                            */
/******************************************************************************/

UConfig *Acfg_create( const UCfgInfo *info, int16 load );
void Acfg_delete( UConfig *config );
void Acfg_clear( UConfig *cfg, const UCfgInfo *info );
void Acfg_clearAllGroups( UConfig *config );
void Acfg_clearGroup( UConfig *config, char *kategorie );
int16 Acfg_load( UConfig *config, const char *filename );
int16 Acfg_save( UConfig *config, const char *filename );
int16 Acfg_isChanged( UConfig *config );

/* Achtung: Alle Flags zwischen 0x0002 und 0x0800 sind */
/*          fÅr zukÅnftige Zwecke fÅr ACS reserviert!  */
#define ACFG_AUTOSAVE   0x0001   /* Cfg-Strings am Ende automatisch sichern */
#define ACFG_USER1      0x1000   /* User-Flag, Funktion frei definierbar    */
#define ACFG_USER2      0x2000   /* User-Flag, Funktion frei definierbar    */
#define ACFG_USER3      0x4000   /* User-Flag, Funktion frei definierbar    */
#define ACFG_USER4      0x8000   /* User-Flag, Funktion frei definierbar    */

/* Flags setzen (set>0), lîschen (set=0) oder nur anfragen (set<0) */
int16 Acfg_flags( UConfig *config, int16 flags, int16 set );

int16 Acfg_isGroupPresent( UConfig *config, const char *kategorie );
int16 Acfg_isStringPresent( UConfig *config, const char *kategorie, const char *name );

char *Acfg_getValue( UConfig *config, const char *kategorie,
      const char *name, char *value );
char *Acfg_setValue( UConfig *config, const char *kategorie,
      const char *name, const char *value );
char *Acfg_clearValue( UConfig *config, const char *kategorie,
      const char *name, char *value );
char *Acfg_getString( UConfig *config, const char *kategorie, const char *name );
int32 Acfg_getLong( UConfig *config, const char *kategorie, const char *name );
int32 Acfg_setLong( UConfig *config, const char *kategorie,
         const char *name, const int32 value );
char Acfg_getChar( UConfig *config, const char *kategorie, const char *name );
char Acfg_setChar( UConfig *config, const char *kategorie,
         const char *name, const char value );
int16 Acfg_getBool( UConfig *config, const char *kategorie, const char *name );
int16 Acfg_setBool( UConfig *config, const char *kategorie,
         const char *name, const int16 value );
double Acfg_getDouble( UConfig *config, const char *kategorie, const char *name );
double Acfg_setDouble( UConfig *config, const char *kategorie,
         const char *name, const double value );

void Acfg_clearHeader( UConfig *config );
int16 Acfg_headAnzahl( UConfig *config );
char **Acfg_setHeader( UConfig *config, int16 anzahl, const char **head_lines );
char **Acfg_getHeader( UConfig *config, char **head_lines );

int16 Acfg_grpAnzahl( UConfig *config );
char *Acfg_grpName( UConfig *config, int16 grp_nr, char *name );
int16 Acfg_strAnzahl( UConfig *config, const int16 grp_nr );
char *Acfg_strName( UConfig *config, const int16 grp_nr, const int16 str_nr, char *name );
char *Acfg_strValue( UConfig *config, const int16 grp_nr, const int16 str_nr, char *value );

int16 Acfg_strIsComment( UConfig *config, const int16 grp_nr, const int16 str_nr );
int16 Acfg_isCfgfile( UConfig *config, const char *filename );

UCfgInfo *Acfg_createInfo( void );
void Acfg_deleteInfo( UCfgInfo *info );
UCfgInfo *Acfg_setInfo( UConfig *config, const UCfgInfo *info );
UCfgInfo *Acfg_getInfo( UConfig *config, UCfgInfo *info );
UCfgInfo *Acfg_copyInfo( UCfgInfo *dest, const UCfgInfo *source );

/******************************************************************************/

#ifdef __cplusplus
}
#endif

/******************************************************************************/

#endif         /* #ifndef __ACS__ */
