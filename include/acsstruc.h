
#define swd struct wd            /* local #undef */
swd;                             /* recursive use: Awindow */

/******************************************************************************/

typedef void (*Aaction)( void );

/******************************************************************************/

typedef swd* (*Acreate)( void *x );

/******************************************************************************/

/* Extended Object */
typedef struct
{
   /* Action-Routine fÅr Exit, TouchExit or Doppelklick */
   /*   0 */ Aaction click;
   
   /* Action-Routine fÅr Drag&Drop */
   /*   4 */ Aaction drag;
   
   /* ob_flags, muû an gleicher Stelle wie in OBJECT stehen, wird geprÅft! */
   /*   8 */ int16 ob_flags;
   
   /* Tastatur-Shortcut */
   /*  10 */ int16 key;
   
   /* User-Pointer */
   /*  12 */ void *userp1;
   /*  16 */ void *userp2;
   
   /* Maus-Index fÅr dieses Feld */
   /*  20 */ int16 mo_index;
   
   /* Objekt-Typ (nicht der AES Typ) */
   /*  22 */ int16 type;
   /*  24 */ 
} AOBJECT;

/******************************************************************************/

/* Extended USERBLK */
typedef struct
{
   /* Redraw-Routine, wie in USERBLK */
   /*  0 */ int16 CDECL (*ub_code)(PARMBLK *pb);
   
   /* Parameter wie in USERBLK */
   /*  4 */ long ub_parm;
   
   /* Service-Routne des Objektes */
   /*  8 */ int16 (*ub_serv)(OBJECT *entry, int16 task, void *in_out);
   
   /* Extra pointers (data) */
   /* 12 */ void *ub_ptr1;
   
   /* typically window */
   /* 16 */ void *ub_ptr2;
   
   /* typically obnr */
   /* 20 */ void *ub_ptr3;
   
   /* BubbleGEM-Hilfe-String */
   /* 24 */ char *bubble;
   
   /* Context-Popup-String fÅr Ame_strpopup */
   /* 28 */ char *context;
   /* 32 */ 
} AUSERBLK;

/******************************************************************************/

/* Maus-Parameter */
typedef struct
{
   /* Maus-Nummer, 255: durch form beschrieben */
   int16 number;
   
   /* Maus-Form oder NULL */
   MFORM *form;
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

/* Das (zentrale) Fenster-Objekt */
typedef struct wd
{
   /* Users object pointer */
   /*   0 */ void *user;
   
   /* Service-Routine */
   /*   4 */ int16 (*service)(swd *a, int16 task, void *in_out);
   
   /* Fenster erzeugen mit fenster abhÑngigem Parameter */
   /*   8 */ swd *(*create)(void *a);
   
   /* Fenster îffnen */
   /*  12 */ int16 (*open)(swd *a);
   
   /* Init-Routine des Fensters */
   /*  16 */ int16 (*init)(swd *a);
   
   /* Das sog. Work-Objekt im Fenster */
   /*  20 */ OBJECT *work;
   
   /* Die Toolbar des Fensters */
   /*  24 */ OBJECT *toolbar;
   
   /* Objektnr and aktuelle Position fÅr Edit-Felder im Fenster */
   /*  28 */ int16 ob_edit, ob_col;
   
   /* GEM-Fenster-Handle oder -1 */
   /*  32 */ int16 wi_id;
   
   /* Fenster-Attribute */
   /*  34 */ int16 wi_kind;
   
   /* Fenster-Koordinaten: akteulle (auûen), normale (auûen) und innere */
   /*  36 */ Axywh wi_act;
   /*  44 */ Axywh wi_normal;
   /*  52 */ Axywh wi_work;
   
   /* Letzte Slider-Position & ->Grîûe */
   /*  60 */ Axywh wi_slider;
   
   /* Offset des Work-Objektes */
   /*  68 */ int16 wi_nx, wi_ny;
   
   /* Raster des Fensters, Highbyte fÅr y, Lowbyte fÅr x */
   /*  72 */ int16 snap_mask;
   
   /* Name und Info-Zeile des Fensters */
   /*  74 */ char *name;
   /*  78 */ char *info;
   
   /* LÑnge des selektierten Edit-Textes, 0 fÅr keine Selektion */
   /*  82 */ int16 ob_len;
   
   /* ACS-Fenster-Attribute */
   /*  84 */ int16 kind;
   
   /* Status des Fensters */
   /*  86 */ int16 state;
   
   /* Objektnummer des Icons im verwaltenden Root-Fenster */
   /*  88 */ int16 icon;
   
   /* Das Icon-Image, NULL: Default-Icon */
   /*  90 */ CICONBLK *iconblk;
   
   /* Fenster-MenÅ */
   /*  94 */ OBJECT *menu;
   
   /* TastendrÅcke */
   /*  98 */ int16 (*keys)(swd *x, int16 kstate, int16 key);
   
   /* Status-énderungen von Objekten des Fensters */
   /* 102 */ void (*obchange)(swd *a, int16 obnr, int16 new_state);
   
   /* Reaktion auf Nachrichten des Screen-Managers */
   /* 106 */ void (*redraw)(swd *a, Axywh *b);     /* Redraw */
   /* 110 */ void (*topped)(swd *a);                  /* Topped */
   /* 114 */ void (*closed)(swd *a);                  /* Closed */
   /* 118 */ void (*fulled)(swd *a);                  /* Fulled */
   /* 122 */ void (*arrowed)(swd *a, int16 which); /* Arrowed */
   /* 126 */ void (*hslid)(swd *a, int16 pos);     /* HSlide */
   /* 130 */ void (*vslid)(swd *a, int16 pos);     /* VSlide */
   /* 134 */ void (*sized)(swd *a, Axywh *b);         /* Sized */
   /* 138 */ void (*moved)(swd *a, Axywh *b);         /* Moved */
   /* New in 3.0.0: */
   /* 142 */ int16 (*iconify)(swd *a, int16 all);  /* Iconify, Iconify All */
   /* 146 */ int16 (*uniconify)(swd *a);           /* Uniconify */
   
   /* Zeiger auf Funktion fÅr fensterspezifische GEMScript-Befehle */
   /* 150 */ int16 (*gemscript)(swd *a, int16 anz, char **cmds, A_GSAntwort *antwort );
   
   /* Titel der Hilfe-Seite */
   /* 154 */ char *help_title;
   
   /* Name der Hilfe-Datei */
   /* 158 */ char *help_file;
   /* 162 */ 
} Awindow;


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

/* Description start */
typedef struct
{
   /*   0 */ char     magic[8];            /* Magic "ACS 2.0" */
   /*   8 */ int16    version;             /* Version * 200 */
   /*  10 */ int16    dx,dy;               /* virtuell desktop increments */
   /*  14 */ uint16   flags;               /* commom flags */
   /*  16 */ char     acc_reg[32];         /* Accessory register message */
   /*  48 */ Awindow  *root;               /* Root window */
   /*  52 */ Awindow  *acc;                /* Accessory first window */
   /*  56 */ Amouse   mouse[32];           /* 32 Mouseforms */
   /* 248 */ char     *mess[];             /* multilinguale Strings */
} Adescr;

/* Initialisierungs-Infos fÅr den Anwendungsstart */
typedef struct
{
   /*   0 */ UCfgInfo CfgInfo;                                     /* Infos zum Laden der Cfg-Strings */
   /*  18 */ char *BaseName;                                       /* Zu verwendender Name fÅr basename */

   /* Initialisierungszeiger in ACSblk fÅr ACS-Interna */
   /*  22 */ void (*ACSterm)( void );                              /* Vor dem Terminieren von ACS */
   /*  26 */ void (*ACSaboutme)( void );                           /* Der Eintrag 'öber mich' */
   /*  30 */ void (*ACSclose)( void );                             /* ACS beenden (Eintrag 'Quit') */
   /*  34 */ void (*ACSmessage)( int16 *ev_mmgpbuf );              /* Unbekannte Messages bearbeiten */
   /*  38 */ void (*ACSmproto)( int16 *ev_mmgpbuf );               /* Message-Filter-Routine */
   /*  42 */ void (*ACStimer)( void );                             /* Timer am Ende der Event-Schleife */
   /*  46 */ void (*ACSkey)( int16 *kstate, int16 *key );          /* Tastendruck-Filter-Routine */
   /*  50 */ void (*ACSbutton)( int16 *button, int16 *breturn );   /* Maus-Button-Filter-Routine */
   /*  54 */ void (*ACSmouse)( void );                             /* Maus-Bewegungs-Filter-Routine */
   /*  58 */ void (*ACSwikey)( int16 *kstate, int16 *key );        /* Tastendruck-Filter-Routine vor wi->keys */

   /*  62 */ int16 init_prot;                                      /* Welche Protokolle sollen (komplett) initialisiert werden? */
   /*  64 */ int16 XAccType;                                       /* Maschinenlesbarer XAcc-Programmtyp */

   /* Initialisierungszeiger in ACSblk fÅr GEMScript */
   /*  66 */ int16 (*ACSGEMScript)( int16 anz, char **cmd, A_GSAntwort *antwort );   /* Allgemeine GEMScript-Funktion */

   /* Start-Funktionen fÅr ACS */
   /*  70 */ int16 (*ACSinit0)( void );                            /* Initialisierung nach GEM-Initialisierung */
   /*  74 */ int16 (*ACSinit)( void );                             /* Initialisierung nach der ACS-Initialisierung */

   /* Initialisierungszeiger in ACSblk fÅr AV-Protokoll */
   /* Noch nicht implementiert */
   /*  78 */ 
} Aconfig;

/* Flags fÅr die Initialisierung der Protokolle beim Systemstart */
/* Falls die Protokolle nicht initialisiert werden, wird dies    */
/* nachgeholt, sobald sie benîtigt werden!                       */
#define CFG_INIT_OLGA         0x0001      /* Starte ggf. OLGA-Manager nach, Anmeldung beim OLGA-Manager anstoûen */
#define CFG_INIT_OLGA_FULL    0x0002      /* ZusÑtzlich auf das Ende der OLGA-Initialisierung warten */
#define CFG_INIT_GEMSCRIPT    0x0004      /* Volle Initialisiere des GEMScript-Protokolles */
#define CFG_INIT_BUBBLEGEM    0x0008      /* Ggf. BubbleGEM nachstarten und intialisieren */

/* list of selected Objects */
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

#define DD_PIPEDD (0x1)                   /* ATARI-Pipe-Drag&Drop */
#define DD_XACC   (0x2)                   /* XACC-D&D */
#define DD_VA     (0x4)                   /* VA-Server */

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

#ifndef __gemscript__
   #define __gemscript__
   typedef struct
   {
      long len;      /* LÑnge der Struktur in Bytes */
      int16 version; /* Versionsnummer des Protokolles beim Sender (z.Z. 0x0120 = 1.2) */
      int16 msgs;    /* Bitmap der unterstÅtzten Nachrichten und FÑhigkeiten (GSM_xxx) */
      long ext;      /* benutzte Endung, etwa '.SIC'                     */
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

typedef struct
{
   int16 id;                     /* the AES-ID of another PRG */
   long  type;                   /* same bitvec as dd_active   */
   unsigned int16 xacc_val;      /* DD-dependant-value: XACC->groups */
   const char  *xacc_name;       /* name of partner, or NULL */
   unsigned int16 va_val[3];
   const char  *va_name;
} A_dd;

typedef struct
{
   Awindow *window;
   OBJECT *entry;
   int16 obnr;
} Awiob;

/******************************************************************************/
/*                                                                            */
/* Die lineare unsortierte Liste                                              */
/*                                                                            */
/******************************************************************************/

/* Keine FOR-Funktion, alle sollen bearbeitet/gesucht werden */
#define NO_FOR (int16 (*)(void *,void *)) NULL

typedef int16 (*A_ListFor)(void *para, void *elem);
typedef void (*A_ListWork)(void *para, void *elem);

typedef struct _ULinList
{
   /* Der Zeiger auf die lineare Liste (soll nur ACS-intern verwendet werden!) */
   /*   0 */ void *ListData;

   /* Zeiger auf Funktion, die die Elemente der Liste freigeben kann */
   /*   4 */ void (*freeElem)( void *elem );

   /* Die lineare Liste leeren, alle Daten freigeben */
   /*   8 */ void (*clear)( struct _ULinList *liste );

   /* AnhÑngen neuer Daten an die Liste */
   /*  12 */ int16 (*append)( struct _ULinList *liste, void *new_data );

   /* EinfÅgen neuer Daten in die Liste */
   /*  16 */ int16 (*insert)( struct _ULinList *liste, void *new_data, int16 before_obj );

   /* Daten aus der Liste lîschen und zurÅckgeben */
   /*  20 */ void *(*delete)( struct _ULinList *liste, int16 data_nr );

   /* Alle Daten aus der Liste lîschen, die eine bestimmte Bedingung erfÅllen     */
   /* Der Parameter para wird an den gleichnamigen Parameter der in to_delete     */
   /* Åbergebenen Funktion weitergereicht (z.B. öbergabe der Vergleichskriterien) */
   /*  24 */ int32 (*deleteFor)( struct _ULinList *liste, void *para,
         int16 (*to_delete)(void *para, void *elem) );

   /* Die Daten Nummer nr holen */
   /*  28 */ void *(*search)( struct _ULinList *liste, int32 nr );

   /* Daten suchen, die eine Bedingung erfÅllen                                 */
   /* Der Parameter para wird an den gleichnamigen Parameter der in found Åber- */
   /* gebenen Funktion weitergereicht (z.B. öbergabe der Vergleichskriterien)   */
   /*  32 */ void *(*searchFor)( struct _ULinList *liste, void *para, int16 (*found)(void *para,void *elem) );

   /* Das erste Element der Liste */
   /*  36 */ void *(*first)( struct _ULinList *liste );

   /* Das letzte Element der Liste */
   /*  40 */ void *(*last)( struct _ULinList *liste );

   /* Das aktuelle Element der Liste */
   /*  44 */ void *(*akt)( struct _ULinList *liste );

   /* Die Nummer des aktuellen Elementes der Liste */
   /*  48 */ int32 (*aktNr)( struct _ULinList *liste );

   /* Das aktuelle Element vorwÑrts/rÅckwÑrts bewegen */
   /*  52 */ void *(*skip)( struct _ULinList *liste, int16 vorwaerts, int32 amount );

   /* Die Anzahl der verwalteten Daten */
   /*  56 */ int32 (*count)( struct _ULinList *liste);

   /* Die Anzahl der Daten ermitteln, die eine Bedingung erfÅllen */
   /* Der Parameter para wird an den gleichnamigen Parameter der in found Åber- */
   /* gebenen Funktion weitergereicht (z.B. öbergabe der Vergleichskriterien)   */
   /*  60 */ int32 (*countFor)( struct _ULinList *liste, void *para, int16 (*count)(void *para, void *elem) );

   /* FÅr alle Daten, die eine Bedingung erfÅllen, eine Aktion ausfÅhren               */
   /* Der Parameter para wird an den gleichnamigen Parameter der in to_work und        */
   /* work Åbergebenen Funktion weitergereicht (z.B. öbergabe der Vergleichskriterien) */
   /*  64 */ void (*doFor)( struct _ULinList *liste, void *para,
            int16 (*to_work)(void *para, void *elem),
            void (*work)(void *para, void *elem) );
} ULinList;

/* Pathsize */
#define __PS__ (127 + 1)

/* Before ACSinit0() initialized !! */
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
   int32 ev_mtcount;             /* Timerintervall in milli sec (initial 500 ms) */
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
   void (*ACSmouse)(void);                   /* filter mouse moves (ev_mmox/y) */
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
} Ablk;

/*
 *    Global Defines
 */

#define A_TOOLBAR    (0x1000)          /* Flag indicates Toolbar */
#define A_MASK       (0x0fff)          /* mask out pure index number */

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

/* Einige Messages fÅr Ergebnis-Meldungen der diversen Protokolle */
#define AS_ACC_ACK         (100)       /* BestÑtigung eines XAcc-Transfers eingegangen */
#define AS_AV_STARTED      (101)       /* BestÑtigung eines VA_START-Transfers eingegangen */
#define AS_PC_VERSION      (102)       /* Versionsnummer der PureC-Hilfe als BestÑtigung */

/* Datenstrukturen fÅr die Nachrichten */
typedef struct
{
   int16 obnr;                /* Objekt-Nummer */
   char *text;                /* Text fÅr BubbleGEM */
} AGetObjText;

typedef struct
{
   char *hyp_file;
   char *hyp_title;
} AGetSTGuide;

typedef struct
{
   Awindow *window;           /* Bearbeitendes Fenster */
   int16 id;                  /* ID der Verbindung */
   char *datei;               /* Dateiname der Austausch-Datei */
   int16 info_id;             /* ID-Nummer des Servers (als OLGA-Client nutzbar, sonst gleich id) */
   char *info_datei;          /* Dateiname der vorhandenen bzw. erzeugbaren Info-Datei */
   int16 olga_flags;          /* Einige FLags der OLGA-Connection */
} OLGA_Infos;

/* Ein paar Konstanten fÅr die OLGA-Infos */
#define OLGA_INF_SENSITIV  0x0001      /* Dateinamen case-sensitiv vergleichen? */
#define OLGA_INF_SERVER    0x0002      /* Das Fenster ist der OLGA-Server */
#define OLGA_INF_CONNECTED 0x0004      /* Kennt der OLGA-Manager diese Verbindung eigentlich? */

/* zusÑtzliche, neue Nachrichten *******************************************/
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

/* VAMOS */
#define ADD_DLO            (20000)     /* Nachricht */
#define AS_MODE            (20001)     /* Modus wechseln */
#define AS_CALC            (20002)     /* Fensterinhalt neu berechnen */

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

/* OBJECT.ob_flags */
#define AEO                (0x8000)    /* Extended Object */
#define AO_DEFABLE         (0x4000)    /* defaultable Object */
#define AO_DRAGABLE        (0x2000)    /* dragable Object */
#define AO_ACCEPT          (0x1000)    /* accept dragable Object */
#define AO_SILENT          (0x0800)    /* object will NOT visual react (AO_ACCEPT) */

/* OBJECT.ob_state */
#define AOS_FIXED          (0x8000)    /* Object tree is already fixed */
#define AOS_DCLICK         (0x4000)    /* last selection was a double click */
#define AOS_CONST          (0x2000)    /* Do not copy substructure, do not release (free) substructure */
#define AOS_LOCKED         (0x1000)    /* subtree is locked */
#define AOS_CLTOP          (0x0800)    /* Counterlock Top; is bound to Bottom of parent */
#define AOS_CLBOTTOM       (0x0400)    /* Counterlock Bottom */
#define AOS_CLLEFT         (0x0200)    /* Counterlock Left */
#define AOS_CLRIGHT        (0x0100)    /* Counterlock Right */

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

/* VAMOS, reserviert 20000 - 20009 */
#define AT_DLO             (20000)        /* DainÑmik Link Obdschekt */
#define AT_SLOT            (20001)        /* Modulslot */
#define AT_JOBSYMBOL       (20002)        /* Symbol fÅr JOB - Layout - Programm */
#define AT_BITBLK          (20003)        /* Bitblock */
#define AT_ICONBLK         (20004)        /* Iconblock */
#define AT_JOBITEM         (20005)        /* Objekt fÅr Joblauf */

/* S_C_M, reserviert 50-59 */
#define  AT_DATE           (50)
#define  AT_BOOKING        (51)
#define  AT_CUSTOMER       (52)
#define  AT_NEWCUSTOMER    (53)
#define  AT_ARTICLE        (54)


/* ACSerror-Message Numbers */
/*    For Std-Message-Numbers, not-NULL-Pointer in Para means */
/*    printable Text, which can be added to the normal message */
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


/*
 *    Global Defines
 */

/* Init entry after ACS initializing */
int16 ACSinit( void );

/*
 *    Global Vars    (no Values)
 */

extern Ablk *ACSblk;

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

/*
 *    Windowhandling common Routines
 */

/* Get window for GEM-Window-ID */
Awindow* Awi_wid( const int16 wid );

/* Return Root-Window */
Awindow* Awi_root( void );

/* Next Window from total Set */
Awindow* Awi_list( void );

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
Awindow* Awi_create( const Awindow *x );

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
int16 ACSGEMScript( int16 anz, char **cmd, A_GSAntwort *antwort );
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
#define RESET_UPDATE    (0x0010)
#define RESTART_UPDATE  (0x0020)
void Awi_update( int16 mode );

/* ST-Guide-Hilfe zum Fenster anzeigen */
int16 Awi_help( Awindow *window );

/*
 * Window: inner Objects
 */

/* Change the State of this Object in Work-Tree */
/* ! changed behaviour to 1.0                   */
void Awi_obchange( Awindow *window, int16 obnr, int16 new_state );

/* Redraws everthing in the Area of obnr (uses window->redraw) */
void Awi_obredraw(Awindow *window, int16 obnr );

/* Redraw-Routine */
void Awi_redraw( Awindow *window, Axywh *limit );

/* Arrows */
void Awi_arrowed( Awindow *window, int16 which );

/* Horizontal Slider */
void Awi_hslid( Awindow *window, int16 pos );

/* vertical slider */
void Awi_vslid( Awindow *window, int16 pos );

/* Daten wurden gesichert, andere Fenster und OLGA davon informieren */
void Awi_saved( Awindow *window, const char *datei );

/* Das Kontext-Popup fÅr Objekt unter (mx, my) aufrufen */
int16 Awi_context( Awindow *window, int16 mx, int16 my );

/*
 * Events
 */

/* Next eventloop will terminate */
void Aev_quit( void );

/* Accept and handle messages eg redraw */
void Aev_mess( void );

/* Unhides hidden Pointer */
void Aev_unhidepointer( void );

/* Waits for release of Mousebuttons */
void Aev_release( void );

/* Diverse Nachrichten verschicken */

/* AV-Protokoll */
int16 Aev_AvProtokoll( int16 dest_id, Awindow *window, int16 timeout );
int16 Aev_AvExit( int16 dest_id, Awindow *window, int16 timeout );
int16 Aev_VaProtoStatus( int16 dest_id, Awindow *window, int16 timeout );
int16 Aev_VaStart( int16 dest_id, char *cmd, Awindow *window, int16 timeout );
int16 Aev_AvStarted( int16 dest_id, int16 ok, const char *cmd );

/* XAcc-Protokoll */
int16 Aev_AccID( int16 dest_id, Awindow *window, int16 timeout );
int16 Aev_AccExit( int16 dest_id, Awindow *window, int16 timeout );
int16 Aev_AccAck( int16 dest_id, int16 ok );
int16 Aev_AccAcc( int16 dest_id, int16 *message, Awindow *window, int16 timeout );
int16 Aev_AccKey( int16 dest_id, int16 key, Awindow *window, int16 timeout );

/* ST-Guide-Hilfe anfordern */
int16 Aev_STGuideHelp( char *hyp_text, char *referenz, Awindow *window );

/* PC-Hilfe anfordern */
int16 Aev_PCHelpVersion( void );
int16 Aev_AcHelp( char *help_acc, char *referenz, Awindow *window );
int16 Aev_AcVersion( char *help_acc, Awindow *window );
int16 Aev_AcCopy( char *help_acc, Awindow *window );

/* BubbleGEM */
int16 Awi_bubblegem( Awindow *window, int16 mx, int16 my );
int16 Aev_FontBubbleGEM( int16 font_id, int16 points );

/* OLGA-Protokoll */
int16 Aev_OlgaIdle( void );
int16 Aev_OlgaUpdate( const char *datei );
int16 Aev_OlgaGetInfo( const int16 id );
int16 Aev_OlgaRename( const char *old_datei, const char *new_datei );
int16 Aev_OlgaBreaklink( const char *datei );

/*
 *    Mousehandling
 */

/* Set new Mouse */
void Amo_new( Amouse* mouse );

/* Set busy Indicator */
void Amo_busy( void );

/* Remove busy Indicator */
void Amo_unbusy( void );

/* Hide Mouse */
void Amo_hide( void );

/* Unhide Mouse */
void Amo_show( void );

/*
 *    Objecthandling
 */

/* Creates a Copy of Parent */
OBJECT* Aob_create( const OBJECT *parent );

/* Frees Object generated by Aob_create */
void Aob_delete( OBJECT *object );

/* Changes G_ICON to G_CICON, if possible */
void Aob_icon( OBJECT *object );

/* Fixes Object */
void Aob_fix( OBJECT *object );

/* Calculate Redraw-Rectangle for Object */
void Aob_offset( Axywh *redraw, OBJECT *ob, int16 entry );

/* save rectangle of desktop */
MFDB* Aob_save( Axywh *rect );

/* restore desktop previously save with Aob_save */
void Aob_restore( MFDB *save, Axywh *rect );

/* Watched Object, select, if pointer upon obnr  */
/* returns TRUE, if button was release upon obnr */
int16 Aob_watch( Awindow *window, int16 obnr );

/* Find obnr for which Flagmask becomes TRUE, obnr is start object */
int16 Aob_findflag( OBJECT *ob, int16 obnr, int16 flag );

/* Find parent Objectnr, returns -1 on top level */
int16 Aob_up( OBJECT* ob, int16 obnr );

/* Bits aus ob_flags und ob_state setzen oder lîschen */
int16 Aob_flags( Awindow *window, int16 obnr, int16 flag, int16 setflag );
int16 Aob_state( Awindow *window, int16 obnr, int16 flag, int16 setflag );

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

/*
 * Backplane Support
 */

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

/* XIMG-Header */
#define RGB       (0)                                 /* col-table-model for color_model */
#define CYM       (1)
#define HLS       (2)
#define PANTONE   (3)

/* Color-Entries for XIMG-Header */
typedef struct
{
   unsigned int16 red;
   unsigned int16 green;
   unsigned int16 blue;
}  RGB_LIST;

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
int16 Abp_mfdb2img( MFDB* org, IMG_HEADER **dest, long *img_len );

/*
 * Drag support functions
 */

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

/*
 *    Char & String Support
 */

/* Zeichen in Groû-/Kleinbuchstaben wandeln (incl. Umlaute!) */
char Ach_toupper( const char ch );
char Ach_tolower( const char ch );

/* Ist ein Zeichen ein "Blank"? (incl. '\r', '\n' & '\t') */
int16 Ach_isWhite( const char c );

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

/* Ist ein String leer, bis auf "Blanks"? */
int16 Ast_isEmpty( const char *string );

/* Mehrere Strings linksbÅndig zusammensetzen, GesamtlÑnge vorgegeben */
char *Ast_add( int16 anzahl, char *ergebnis, ... );

/* Einen String mitels Blanks links-/rehtsbÅndig bzw. zentriert auf bestimte LÑnge bringen */
char *Ast_adl( char *string, long len );
char *Ast_adr( char *string, long len );
char *Ast_adc( char *string, long len );

/* Zeichen aus einem String herausfiltern */
char *Ast_filter( char *string, char *wrg_char );

/* Die Anzahl von bestimmten Zeichen zÑhlen */
long Ast_count( const char *string, const char *zeichen );

/* Zwei Dateinamen vergleichen, der erste darf die Åblichen Wildcards enthalten */
int16 Ast_fcmp( char *filename1, char *filename2 );

/* Anzahl der Strings eines ASCIZZ-Strings zÑhlen */
int16 Ast_countASCIZZ( const char *asciizz );

/* Einen ASCIIZZ-String in ein Array von Strings splitten */
int16 Ast_splitASCIZZ( const char *ascizz, char ***strings, int16 *anz );

/* Aus einem String-Array einen ASCIIZZ-String machen */
char *Ast_mergeASCIIZZ( const char **strings, const int16 anzahl, const int16 global );

/* EIn Array von Strings komplett freigeben */
void Ast_deleteAry( char **strings, int16 anzahl );

/*
 * ICON, Image Support
 */

/* Create a Copy of Icon, but not image Part ! */
CICONBLK* Aic_create( const CICONBLK *icon );

/* Release this Copy */
void Aic_delete( CICONBLK *icon );

/* Create a bitblk-Copy, but not Image */
BITBLK* Aim_create( const BITBLK *bitblk );

/* Release Copy */
void Aim_delete( BITBLK *bitblk );

/*
 *    USER defined Objects
 */

/* Create a Copy */
AUSERBLK* Aus_create( const AUSERBLK *user );

/* Release this Copy */
void Aus_delete( AUSERBLK *user );

/* Klick-Routine: ST-Guide-Hilfe zum Fenster anzeigen */
void Aus_help( void );

/*
 *    TEDINFO Support
 */

/* Create a Copy */
TEDINFO* Ate_create( const TEDINFO *tedi );

/* Release this Copy */
void Ate_delete( TEDINFO *tedi );

/*
 *    Xtra Functions
 */

/* ACS Malloc can be overwritten if linked before Library */
void *Ax_malloc( long size );
void *Ax_glmalloc( long size );

/* Mark Memory as free */
void Ax_free( void* memory );
void Ax_glfree( void *memory );

/* Give Memory immediate free (be very carefully) */
void Ax_ifree( void* memory );

/*
 *    Utilities
 */

typedef struct afilelist
{
   char *file;
   struct afilelist *next;
   XATTR attribs;
} A_FileList;

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



/*
 *    Predefined "Userdefined Objects"
 */

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

/*
 *    USERDEFs Service routines
 */

/*
 *          Object Services for USERDEF 'A_ftext'
 */

#define AUO_FTFONT            (300)                /* Set Font, int16 * */
#define AUO_FTHEIGHT          (301)                /* Set Height, int16 * */
#define AUO_FTCOLOR           (302)                /* Set Color, int16 * */
#define AUO_FTEFFECTS         (303)                /* Set Effects, int16 * */
#define AUO_FTLEFT            (304)                /* Set leftalign */
#define AUO_FTRIGHT           (305)                /* Set right align */
#define AUO_FTCENTER          (306)                /* Set center align */
#define AUO_FTBLOCK           (307)                /* Set block align */
int16 Auo_ftext( OBJECT* entry, int16 task, void* in_out );
int16 Auo_string( OBJECT* entry, int16 task, void* in_out );

#define AUO_CYCPOPUP          (400)                /* set popup string */
#define AUO_CYCINDEX          (401)                /* set index, int16 * */
#define AUO_CYCGETINDEX       (402)                /* return actual index, int16 * */
int16 Auo_cycle( OBJECT* entry, int16 task, void* in_out );
void Aus_cycle( void );

#define AUO_PICMFDB           (500)                /* take MFDB, will not copy MFDB */
int16 Auo_picture( OBJECT* entry, int16 task, void* in_out );

/*
 *  Box-Edit
 */
#define BE_MAXLEN          (255)
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

/*** Nachrichten ***/
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

/*** Masken ***/
#define  BEM_ALL           (0)   /* alles */
#define BEM_PATH           (1)   /* alles */
#define BEM_FILE           (2)   /* alles ohne \: */
#define BEM_TOSFILE        (3)   /* A-Za-z0-9 ._!@#$%^&()+-=~';",<>|[]{} */
#define BEM_TOSFILESPEC    (4)   /* BEM_TOSFILE *? */
#define BEM_TOSPATH        (5)   /* BEM_TOSFILE \: */
#define  BEM_TOSPATHSPEC   (6)   /* BEM_TOSFILE \:*? */
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

int16 Auo_boxed( OBJECT *entry, int16 task, void *in_out );
void Aus_boxed( void );

/*
 * Shell feature(s)
 */

/* Call an other Program (return retvalue of Pexec(Basepage)) */
long Ash_prog( char* path, char* command, char** env );

/* Load and initialize an ACS-Module (returns OK or FAIL) */
int16 Ash_module( char* path );

/* Standard-Error-Handler */
void Ash_error( int16 messerr, void *para );

/* Returns cyclic D&D-Partners, init act with NULL, end is NULL */
A_dd *Ash_nextdd( A_dd *act );

/* sendet DD-Partnern (mit Typ type) oder unter MTOS/MagiC */
/* allen (type<0) den 8 int16-langen Messageblock */
int16 Ash_sendall( int16 *mess, long type );

/* Looks for 'cookie' and writes its Value in val (returns TRUE on success) */
int16 Ash_getcookie( long cookie, void *value );

/* looks for 'char' in Env and returns value */
char *Ash_getenv( const char *var );

/*
      Debug entry
*/

void DEBUG_MEM( void* defective );

#undef __PS__

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
   
   #define NK_INVALID   0x00           /* invalid key code  */
   #define NK_UP        0x01           /* cursor up         */
   #define NK_DOWN      0x02           /* cursor down       */
   #define NK_RIGHT     0x03           /* cursor right      */
   #define NK_LEFT      0x04           /* cursor left       */
   #define NK_RVD05     0x05           /* reserved!         */
   #define NK_RVD06     0x06           /* reserved!         */
   #define NK_RVD07     0x07           /* reserved!         */
   #define NK_BS        0x08           /* Backspace         */
   #define NK_TAB       0x09           /* Tab               */
   #define NK_ENTER     0x0a           /* Enter             */
   #define NK_INS       0x0b           /* Insert            */
   #define NK_CLRHOME   0x0c           /* Clr/Home          */
   #define NK_RET       0x0d           /* Return            */
   #define NK_HELP      0x0e           /* Help              */
   #define NK_UNDO      0x0f           /* Undo              */
   #define NK_F1        0x10           /* function key #1   */
   #define NK_F2        0x11           /* function key #2   */
   #define NK_F3        0x12           /* function key #3   */
   #define NK_F4        0x13           /* function key #4   */
   #define NK_F5        0x14           /* function key #5   */
   #define NK_F6        0x15           /* function key #6   */
   #define NK_F7        0x16           /* function key #7   */
   #define NK_F8        0x17           /* function key #8   */
   #define NK_F9        0x18           /* function key #9   */
   #define NK_F10       0x19           /* function key #10  */
   #define NK_RVD1A     0x1a           /* reserved!         */
   #define NK_ESC       0x1b           /* Esc               */
   #define NK_RVD1C     0x1c           /* reserved!         */
   #define NK_RVD1D     0x1d           /* reserved!         */
   #define NK_RVD1E     0x1e           /* reserved!         */
   #define NK_DEL       0x1f           /* Delete            */
   
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
   
   int16 nkc_tconv( long toskey );
   int16 nkc_gconv( int16 gemkey );
   long nkc_n2tos( int16 nkcode );
   int16 nkc_n2gem( int16 nkcode );
   int16 nkc_kstate( void );
   int16 nkc_cmp( int16 refkey,int16 kcode );
   int16 nkc_tolower( int16 key );
   int16 nkc_toupper( int16 key );

#endif      /* #ifndef __NKCC */

/*******************************************************************************
 * Goodies
 */

/* Minimum */
#ifndef min
   #define min(A,B) (((A) < (B)) ? (A) : (B))
#endif

/* Maximum */
#ifndef max
   #define max(A,B) (((A) > (B)) ? (A) : (B))
#endif

#define     EOS '\0'                /* Ende des Strings */
#define     DIR   '\\'              /* Directory-Trenner */
#define     DEV   ':'               /* Device-Trenner */
#define     SEP   '/'               /* Called by Trenner */
#define     EXT '.'                 /* Extension Trenner */

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
long Af_length( const char *file );

/* Calls Fileselector */
char *Af_select( char *title, char *path, char *ext );

/* MultiFsel */
char *Af_first_fsel( char *titel, char *path, char *ext);
char *Af_next_fsel( void );
char *Af_first( const char *start, A_FileList *fileinfo );
char *Af_next( A_FileList *fileinfo );
A_FileList *Af_readdir( const char *path );
void Af_freedir( A_FileList *list );

/* Returns full Path of CFG-File */
char *Af_cfgfile( char* file );

/* Deletes SCRAP."ext" or SCRAP.*, if ext=NULL */
void Ascrp_clear( const char *ext );

/* Reads from clipboard SCRAP."ext" or first Scrap-file  */
/* If buffer==NULL, only Length will be returned, Buffer */
/* and real ext are returned and TRUE, if all is ok      */
int16 Ascrp_get( char *ext, void **buffer, long *len );

/* Writes to SCRAP."ext" the len-bytes len buffer    */
/* If append==TRUE, the Buffer will be appendended   */
/* to a possibly existing file. -> TRUE if all is ok */
int16 Ascrp_put (char *ext, void *buffer, long len, int16 append );

/******************************************************************************/
/*                                                                            */
/* Die lineare unsortierte Liste                                              */
/*                                                                            */
/******************************************************************************/

/* Eine lineare Liste erzeugen */
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
/* Die Konfigurations-String-UnterstÅtzung                                    */
/*                                                                            */
/******************************************************************************/

UConfig *Acfg_create( const UCfgInfo *info, int16 load );
void Acfg_delete( UConfig *config );
void Acfg_clear( UConfig *cfg, const UCfgInfo *info );
void Acfg_clearGroup( UConfig *config );
int16 Acfg_load( UConfig *config, const char *filename );
int16 Acfg_save( UConfig *config, const char *filename );
int16 Acfg_isChanged( UConfig *config );
char *Acfg_getValue( UConfig *config, const char *kategorie,
      const char *name, char *value );
char *Acfg_setValue( UConfig *config, const char *kategorie,
      const char *name, const char *value );
char *Acfg_clearValue( UConfig *config, const char *kategorie,
      const char *name, char *value );
long Acfg_getLong( UConfig *config, const char *kategorie, const char *name );
long Acfg_setLong( UConfig *config, const char *kategorie,
         const char *name, const long value );
int16 Acfg_getBool( UConfig *config, const char *kategorie, const char *name );
int16 Acfg_setBool( UConfig *config, const char *kategorie,
         const char *name, const int16 value );
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


#endif         /* #ifndef __ACS__ */

/* Eines der Sprachen-Makros muû definiert sein! */
#if !defined(ACS_LANG1) && !defined(ACS_LANG2) && !defined(ACS_LANG3) && !defined(ACS_LANG4)
   #define ACS_LANG1
#endif
