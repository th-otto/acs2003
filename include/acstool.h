/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    REVISION:         18. November 2001                                     */
/*    DESCRIPTION:      Headerdatei der îffentlichen Konstanten, Strukturen   */
/*                      und Routinen des Entwicklungssystems ACSpro           */
/*                      fÅr TOS- und TTP-Programme                            */
/*                                                                            */
/* (c) 1991-2001 Stefan Bachert, Oliver Michalak, Martin ElsÑsser             */
/******************************************************************************/

#ifndef __ACS_TOOL__
   #define __ACS_TOOL__

/******************************************************************************/
/*                                                                            */
/* Benîtigte Header-Dateien einlesen                                          */
/*                                                                            */
/******************************************************************************/

#include    <acstype.h>
#include    <acstos.h>

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
/* Infos Åber die Listen der freien Blîcke von ACS */
typedef struct
{
   ssize_t block_size;
   char *descr_text;
   int16 max_liste;
   int16 aktuell_liste;
   int16 max_used;
   int16 opt_anzahl;
} MemFreeBlockStat;

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
/* Zeichensatzwandelungen Åber KEYTAB                                         */
/*                                                                            */
/******************************************************************************/

#include "keytab.h"

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
#define _ll struct _ULinListe

/******************************************************************************/

typedef struct _ULinList
{
   /* Der Zeiger auf die lineare Liste (soll nur ACS-intern verwendet werden!) */
   void *ListData;

   /* Zeiger auf Funktion, die die Elemente der Liste freigeben kann */
   void (*freeElem)( void *elem );

   /* Die lineare Liste leeren, alle Daten freigeben */
   void (*clear)( _ll *liste );

   /* AnhÑngen neuer Daten an die Liste */
   boolean (*append)( _ll *liste, void *new_data );

   /* EinfÅgen neuer Daten in die Liste */
   int16 (*insert)( _ll *liste, void *new_data, int16 before_obj );

   /* Daten aus der Liste lîschen und zurÅckgeben */
   void *(*delete)( _ll *liste, int16 data_nr );

   /* Alle Daten aus der Liste lîschen, die eine bestimmte Bedingung erfÅllen     */
   /* Der Parameter para wird an den gleichnamigen Parameter der in to_delete     */
   /* Åbergebenen Funktion weitergereicht (z.B. öbergabe der Vergleichskriterien) */
   int32 (*deleteFor)( _ll *liste, void *para, boolean (*to_delete)(void *para, void *elem) );

   /* Die Daten Nummer nr holen */
   void *(*search)( _ll *liste, int32 nr );

   /* Daten suchen, die eine Bedingung erfÅllen                                 */
   /* Der Parameter para wird an den gleichnamigen Parameter der in found Åber- */
   /* gebenen Funktion weitergereicht (z.B. öbergabe der Vergleichskriterien)   */
   void *(*searchFor)( _ll *liste, void *para, boolean (*found)(void *para, void *elem) );

   /* Das erste Element der Liste */
   void *(*first)( _ll *liste );

   /* Das letzte Element der Liste */
   void *(*last)( _ll *liste );

   /* Das aktuelle Element der Liste */
   void *(*akt)( _ll *liste );

   /* Die Nummer des aktuellen Elementes der Liste */
   int32 (*aktNr)( _ll *liste );

   /* Das aktuelle Element vorwÑrts/rÅckwÑrts bewegen */
   void *(*skip)( _ll *liste, boolean forwards, int32 amount );

   /* Die Anzahl der verwalteten Daten */
   int32 (*count)( _ll *liste);

   /* Die Anzahl der Daten ermitteln, die eine Bedingung erfÅllen */
   /* Der Parameter para wird an den gleichnamigen Parameter der in found Åber- */
   /* gebenen Funktion weitergereicht (z.B. öbergabe der Vergleichskriterien)   */
   int32 (*countFor)( _ll *liste, void *para, boolean (*count)(void *para, void *elem) );

   /* FÅr alle Daten, die eine Bedingung erfÅllen, eine Aktion ausfÅhren               */
   /* Der Parameter para wird an den gleichnamigen Parameter der in to_work und        */
   /* work Åbergebenen Funktion weitergereicht (z.B. öbergabe der Vergleichskriterien) */
   void (*doFor)( _ll *liste, void *para,
            boolean (*to_work)(void *para, void *elem),
            void (*work)(void *para, void *elem) );
} ULinList;

/* For backward compatibility only */
#define ULinListe ULinlist

#undef _ll

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

/* Pathsize */
#define __PS__ (127 + 1)

/******************************************************************************/
/*                                                                            */
/* Zentrale ACS-Initialisierungs-Variablen                                    */
/* Die globale Variable ACSconfig vom Typ Aconfig muû im Programm existieren  */
/*                                                                            */
/******************************************************************************/

typedef struct
{
   UCfgInfo CfgInfo;             /* Infos zum Laden der Cfg-Strings */
   char *BaseName;               /* Zu verwendender Name fÅr basename */

   /* Informationen fÅr das Scannen der Kommandozeile */
   int16 (*ACSwrgOpt)( const char ch); /* Fehlerhafte Optionen melden */
   int16 optionScanning;         /* Flag, ob die Optionen gescannt werden sollen */
   char *optionBeginChars;       /* Alle Zeichen, die eine Option einleiten */
   char *optionsAllowed;         /* Alle Optionen, die erlaubt sind */
   char *optionsWithParam;       /* Alle erlaubten Optionen, die einen Parameter benîtigen */

   /* Start-Funktionen fÅr ACS */
   int16 (*ACSinit0)( void );    /* Initialisierung vor der ACS-Initialisierung */
   int16 (*ACSinit)( void );     /* Initialisierung nach der ACS-Initialisierung */
   int16 (*ACSwork)(void);       /* Die Funktion, die die Arbeit des Programmes macht */

   /* Initialisierungszeiger in ACSblk fÅr ACS-Interna */
   void (*ACSaboutme)( void );   /* Der Eintrag 'öber mich' */
} Aconfig;

/******************************************************************************/
/*                                                                            */
/* Zentrale ACS-Variablen                                                     */
/* Diese Variablen sind bereits vor Aufruf von ACSinit0 initialisiert         */
/*                                                                            */
/******************************************************************************/

typedef struct
{
   /* Pathes */
   char appname [__PS__];        /* application complete name */
   char apppath [__PS__];        /* application path */
   char apppara [__PS__];        /* application parameter */
   char appfrom [__PS__];        /* application called from */
   char basename[20];            /* basename appname without extention */
   char cfg_path [__PS__];       /* config path initially = apppath*/
   char scrp_path [__PS__];      /* initialised scrap-path */
   char separator[256];          /* Worttrenner */
   int16 argc;                   /* parameter passed to main routine */
   char **argv;                  /* argument list */
   char **env;                   /* environment */
   void (*ACSerror)(int16 errmess, const void *para);    /* Error-Routine */
   void (*ACSaboutme)(void);     /* call used for 'about me' */
   int16 (*ACSinit0)(void);      /* Initialisierung vor der ACS-Initialisierung */
   int16 (*ACSinit)(void);       /* Initialisierung nach der ACS-Initialisierung */

   /* Cfg-Strings des Programmes */
   UConfig *cfg;

   /* Infos zum Scannen der Kommandozeile */
   int16 (*ACScmderror)(void);   /* Fehler beim Scannen der Optionen */
   int16 (*ACSwrgOpt)(const char ch);  /* Fehlerhafte Optionen melden */
   char optionBeginChars[10];    /* Alle Zeichen, die eine Option einleiten */
   char optionsAllowed[256];     /* Alle Optionen, die erlaubt sind */
   char optionsWithParam[256];   /* Alle erlaubten Optionen, die einen Parameter benîtigen */
   char *options[256];           /* FÅr jede der mîglichen Optionen ein String (Wert) */
   ULinList *params;             /* Die "reinen" Parameter */

   /* Der MagiC-Cookie */
   MAGX_COOKIE *MagiCCookie;

   /* Der N.AES-Cookie */
   N_AESINFO *NAesCookie;
} Ablk;

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

/******************************************************************************/
/*                                                                            */
/*                                                                            */
/*                                                                            */
/******************************************************************************/

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

/* Diese globale Variable enthÑlt alle globalen */
/* ACS-Variablen. Sie wird von ACS angelegt.    */
extern Ablk *ACSblk;

/******************************************************************************/

/* Diese globale Variable muû bereitgestellt werden! */
extern Aconfig ACSconfig;

/******************************************************************************/
/*                                                                            */
/* Unterschiedliche Variablen bzw. Funktionen fÅr Nicht-Module und Module     */
/*                                                                            */
/******************************************************************************/

/* pre init */
int16 ACSinit0 (void);

/******************************************************************************/
/*                                                                            */
/* Char- und String-Support-Funktionen                                        */
/*                                                                            */
/******************************************************************************/

/* Zeichen in Groû-/Kleinbuchstaben wandeln (incl. Umlaute!) */
char Ach_toupper(char ch);
char Ach_tolower(char ch);

/* Ist ein Zeichen ein "Blank"? (incl. '\r', '\n' & '\t') */
boolean Ach_isWhite( char c );

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
int16 Ast_ncmp( const char *str_1, const char *str_2, int16 max_char );
int16 Ast_incmp( const char *str_1, const char *str_2, int16 max_char );

/* String im String suchen ohne Groû/Klein-Unterscheidung */
char *Ast_istr( const char *s1, const char *s2 );

/* Ist ein String leer, bis auf "Blanks"? */
boolean Ast_isEmpty( const char *string );

/* Mehrere Strings linksbÅndig zusammensetzen, GesamtlÑnge vorgegeben */
char *Ast_add( int16 anzahl, char *ergebnis, ... );

/* Einen String mitels Blanks links-/rechtsbÅndig bzw. zentriert auf bestimte LÑnge bringen */
char *Ast_adl( char *string, long len );
char *Ast_adr( char *string, long len );
char *Ast_adc( char *string, long len );

/* Zeichen aus einem String herausfiltern */
char *Ast_filter( char *string, const char *wrong_char, const char *right_char );

/* Die Anzahl von bestimmten Zeichen zÑhlen */
long Ast_count( const char *string, const char *zeichen );

/* Zwei Dateinamen vergleichen, der erste darf die Åblichen Wildcards enthalten */
boolean Ast_fcmp( const char *filename1, const char *filename2 );

/* Einen String umdrehen, d.h. letztes Zeichen als erstes usw. */
char *Ast_reverse( char *reverse, const char *string );

/* Anzahl der Strings eines ASCIZZ-Strings zÑhlen */
int16 Ast_countASCIZZ( const char *asciizz );

/* Einen ASCIIZZ-String in ein Array von Strings splitten */
boolean Ast_splitASCIIZZ( const char *ascizz, char ***strings, int16 *anz );

/* Aus einem String-Array einen ASCIIZZ-String machen */
char *Ast_mergeASCIIZZ( const char **strings, int16 anzahl, int16 global );

/* Ein Array von Strings komplett freigeben */
void Ast_deleteAry( char **strings, int16 anzahl );

/******************************************************************************/
/*                                                                            */
/* Funktionen rund ums Speicher-Management                                    */
/*                                                                            */
/******************************************************************************/

/* Speicher allozieren */
void *Ax_malloc( ssize_t size );
void *Ax_glmalloc( ssize_t size );

/* Speicher freigeben */
void Ax_recycle( void *memory, ssize_t size );
void Ax_free( void *memory );
void Ax_glfree( void *memory );

/* Speicher auf Les-/Schreibbarkeit prÅfen (Speicherschutz!) */
int16 Ax_memCheck( const char *buffer, ssize_t len, int16 write );

/* Lineare Liste fÅr recyclebaren Speicher erzeugen/Ñndern/lîschen */
int16 Ax_setRecycleSize( ssize_t size, int16 amount, char *beschreibung );

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

/* Den Wert des 200Hz-Timers liefern */
uint32 Ash_gettimer( void );

/******************************************************************************/

/* Kommandozeile parsen und Optionen befÅllen */
int16 Ash_cmdParsen( char *options[256], int16 argc, char **argv,
         const char *optionBeginChars, const char *optionsAllowed,
         const char *optionsWithParam, int16 (*wrongOption)(const char c),
         ULinList *params );

/******************************************************************************/
/*                                                                            */
/* ACS-System- und Shell-Funktionen                                           */
/*                                                                            */
/******************************************************************************/

/* Call an other Program (return retvalue of Pexec(Basepage)) */
long Ash_prog( char *path, char *command, char **env );

/* Load and initialize an ACS-Module (returns OK or FAIL) */
int16 Ash_module( const char* path );

/* Standard-Error-Handler */
void Ash_error( int16 messerr, void *para );

/* Looks for 'cookie' and writes its Value in val (returns TRUE on success) */
short Ash_getcookie( long cookie, void *value );

/* looks for 'char' in Env and returns value */
char *Ash_getenv( const char *var );

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
long Af_length( const char *file );

/* Dateien suchen, Verzeichnisse einlesen */
A_FileList *Af_readdir( const char *path );
void Af_freedir( A_FileList *list );
char *Af_first( const char *start, A_FileList *fileinfo );
char *Af_next( A_FileList *fileinfo );

/* Returns full Path of CFG-File */
char *Af_cfgfile( const char* file );

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
boolean Ascrp_get( const char *ext, void **buffer, ssize_t *len );

/* Writes to SCRAP."ext" the len-bytes len buffer    */
/* If append==TRUE, the Buffer will be appendended   */
/* to a possibly existing file. -> TRUE if all is ok */
boolean Ascrp_put (const char *ext, const void *buffer, ssize_t len, boolean append );

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
/* Der Stack (Stapel)                                                         */
/*                                                                            */
/******************************************************************************/

/* Einen Stack erzeugen und wieder vernichten */
Stack *As_create( void );
void As_delete( Stack *stack );

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
long Acfg_getLong( UConfig *config, const char *kategorie, const char *name );
long Acfg_setLong( UConfig *config, const char *kategorie,
         const char *name, const long value );
char Acfg_getChar( UConfig *config, const char *kategorie, const char *name );
char Acfg_setChar( UConfig *config, const char *kategorie,
         const char *name, const char value );
int16 Acfg_getBool( UConfig *config, const char *kategorie, const char *name );
int16 Acfg_setBool( UConfig *config, const char *kategorie,
         const char *name, int16 value );

void Acfg_clearHeader( UConfig *config );
int16 Acfg_headAnzahl( UConfig *config );
char **Acfg_setHeader( UConfig *config, int16 anzahl, const char **head_lines );
char **Acfg_getHeader( UConfig *config, char **head_lines );

int16 Acfg_grpAnzahl( UConfig *config );
char *Acfg_grpName( UConfig *config, int16 grp_nr, char *name );
int16 Acfg_strAnzahl( UConfig *config, int16 grp_nr );
char *Acfg_strName( UConfig *config, int16 grp_nr, int16 str_nr, char *name );
char *Acfg_strValue( UConfig *config, int16 grp_nr, int16 str_nr, char *value );

int16 Acfg_strIsComment( UConfig *config, int16 grp_nr, int16 str_nr );
int16 Acfg_isCfgfile( UConfig *config, const char *filename );

UCfgInfo *Acfg_createInfo( void );
void Acfg_deleteInfo( UCfgInfo *info );
UCfgInfo *Acfg_setInfo( UConfig *config, const UCfgInfo *info );
UCfgInfo *Acfg_getInfo( UConfig *config, UCfgInfo *info );
UCfgInfo *Acfg_copyInfo( UCfgInfo *dest, const UCfgInfo *source );

#endif         /* #ifndef __ACS__ */
