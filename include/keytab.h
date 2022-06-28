/******************************************************************************/
/*                                                                            */
/*                         KeyTab - Zeichensatzumwandlungen                   */
/*                                                                            */
/* Include-Datei zur Bibliothek, die die Anbindung an KEYTAB                  */
/* von Pure-C aus erledigt                                                    */
/*                                                                            */
/* Dieses Programm ist incl. des Sources Freeware!                            */
/*                                                                            */
/* Include-File of the library, which implements the connection to KEYTAB     */
/* from Pure-C and GNU-C                                                      */
/*                                                                            */
/* This Program is incl. the Source Freeware!                                 */
/*                                                                            */
/* Copyright (c)  1997-2001 by Thomas Much, thomas@snailshell.de              */
/*                ab 2002   by Martin Els„sser @ LL (martin@melsaesser.de)    */
/******************************************************************************/

#ifndef __KEYTAB_LIB__
#define __KEYTAB_LIB__

#ifndef CDECL
   #if defined(LATTICE)
      #define CDECL        __stdargs
   #elif defined(__PUREC__)
      #define CDECL        cdecl
   #else
      #define CDECL
   #endif
#endif

/******************************************************************************/
/*                                                                            */
/* Globale Konstanten fr KEYTAB - Global Constants for KEYTAB                */
/*                                                                            */
/******************************************************************************/

/* Konstanten fr die Short-Informationen der 8-Bit-Zeichens„tze */
/* Constants for the Short-Informations of the 8-Bit-Charsets   */
#define KT_SINFO_8BIT_ASK_MAX_SINFO       KT_SINFO_8BIT_MAX
#define KT_SINFO_8BIT_ASK_MAX_CINFO       KT_CINFO_8BIT_MAX
#define KT_SINFO_8BIT_CONV_ATARI          2
#define KT_SINFO_8BIT_CONV_UNICODE        3
#define KT_SINFO_8BIT_MAX                 3

/******************************************************************************/

/* Konstanten fr die String-Informationen der 8-Bit-Zeichens„tze */
/* Constants for the String-Informations of the 8-Bit-Charsets    */
#define KT_CINFO_8BIT_LONGNAME            0
#define KT_CINFO_8BIT_SHORTNAME           1
#define KT_CINFO_8BIT_MAX                 1

/******************************************************************************/

/* Konstanten fr die Short-Informationen der Unicode-Codierungen */
/* Constants for the Short-Informations of the Unicode-Encodings  */
#define KT_SINFO_UNICODE_ASK_MAX_SINFO    KT_SINFO_UNICODE_MAX
#define KT_SINFO_UNICODE_ASK_MAX_CINFO    KT_CINFO_UNICODE_MAX
#define KT_SINFO_UNICODE_MAX              1

/******************************************************************************/

/* Konstanten fr die String-Informationen der Unicode-Codierungen */
/* Constants for the String-Informations of the Unicode-Encodings  */
#define KT_CINFO_UNICODE_LONGNAME         0
#define KT_CINFO_UNICODE_SHORTNAME        1
#define KT_CINFO_UNICODE_MAX              1

/******************************************************************************/

/* Konstanten fr maximale L„nge der Zeichensatz-Namen */
/* Constants for the maximum length of charsets names  */
#define KT_MAX_LONG_NAME   38
#define KT_MAX_SHORT_NAME  14

/******************************************************************************/
/*                                                                            */
/* Globale Datentypen                                                         */
/*                                                                            */
/* Global Typedefs                                                            */
/*                                                                            */
/******************************************************************************/

/* In KEYTAB.H evtl. definiert - in KEYTAB.H perhaps defined */
#ifndef KEYTAB_H
#define KEYTAB_H
   
   typedef struct
   {
      long  magic;
      long  size;
      short CDECL (*GetExpMaxNr)(void);
      long  resvd0;
      short CDECL (*GetExpNrFromId)(short id);
      char  CDECL (*CharAtari2X)(short nr, char chr);
      short CDECL (*GetImpMaxNr)(void);
      long  resvd1;
      short CDECL (*GetImpNrFromId)(short id);
      char  CDECL (*CharX2Atari)(short nr, char ichr);
      void  CDECL (*BlockAtari2X)(short nr, long len, char *chrs);
      void  CDECL (*BlockX2Atari)(short nr, long len, char *chrs);
      char *CDECL (*GetExpNameFromNr)(short nr);
      char *CDECL (*GetImpNameFromNr)(short nr);
      char *CDECL (*GetExpShortNameFromNr)(short nr);
      char *CDECL (*GetImpShortNameFromNr)(short nr);
      short CDECL (*GetRelease)(void);
      short CDECL (*GetExpIdFromNr)(short nr);
      short CDECL (*GetImpIdFromNr)(short nr);
      short CDECL (*GetExpNrFromName)(char *name);
      short CDECL (*GetImpNrFromName)(char *name);
      long  CDECL (*GetEuro)(void);
      short CDECL (*CharX2Unicode)(short nr, char chr);
      char  CDECL (*CharUnicode2X)(short nr, short unichar);
      void  CDECL (*BlockX2Unicode)( short *unichar, short nr, char *x_chrs, long len );
      void  CDECL (*BlockUnicode2X)( char *x_chrs, short nr, short *unichar, long len );
      short CDECL (*GetExpMinNr)(void);
      short CDECL (*GetImpMinNr)(void);
      long  CDECL (*CharXUtf2Unicode)( short nr, char *string, long len, short *read_chars );
      char *CDECL (*CharUnicode2XUtf)( short nr, long lunicode, char *result, short *used_chars );
      void CDECL (*BlockXUtf2Unicode)( short *unichar, long *uni_len, short nr, char *string, long len );
      void CDECL (*BlockUnicode2XUtf)( char *string, long *str_len, short nr, short *unichar, long len );
      void CDECL (*BlockXUtf2U2XUtf)( char *dest, long *dest_len, short dest_nr, char *source, long src_len, short src_nr );
      void CDECL (*BlockXUtf2XUtf)( char *dest, long *dest_len, short dest_nr, char *source, long src_len, short src_nr );
      short CDECL (*GetInfoShort)( short nr, short what, short *info );
      short CDECL (*GetInfoString)( short nr, short what, char *info, short maxLen );
   } KEYT;
   
#endif

/******************************************************************************/
/*                                                                            */
/* Funktions-Prototypen                                                       */
/*                                                                            */
/* Prototypes of the Functions                                                */
/*                                                                            */
/******************************************************************************/

/* Funktionen rund um den CookieJar - Functions around the CookieJar   */
KEYT *Akt_getKeyTab( void );
short Akt_getRelease( void );

/* Da die Funktion Ash_getcookie ist in der PCTOS.LIB ab Version 0.3.0   */
/* vorhanden ist, ist sie hier quasi auskommentiert. Falls die PCTOS.LIB */
/* nicht verwendet wird oder in einer Version vor 0.3.0, so muž das #if  */
/* in der n„chsten Zeile zusammen mit dem zugeh”rigen #endif gel”scht    */
/* werden. Ebenso muž der Source der Bibliothek bearbeitet werden. Dann  */
/* ist die Bibliothek neu zu compilieren.                                */
/* Since the function Ash_getcookie is present in the library PCTOS.LIB  */
/* (Version >= 0.3.0), the function is here not present. If the library  */
/* PCTOSS.LIB is not used or the version is < 0.3.0, this #if must be    */
/* deleted with the corresponding #endif. After changing the source of   */
/* the library in the same manner, you has to rebuild the library.       */
short Ash_getcookie( long cookie, void *value );

/******************************************************************************/

/* Auskunfts-Funktionen ber Filter - Info-Functions about the Filters */
short Akt_getExpMinNr( void );
short Akt_getExpMaxNr( void );
short Akt_getImpMinNr( void );
short Akt_getImpMaxNr( void );
char *Akt_getExpNameFromNr( short nr );
char *Akt_getImpNameFromNr( short nr );
char *Akt_getExpShortNameFromNr( short nr );
char *Akt_getImpShortNameFromNr( short nr );
short Akt_getExpNrFromId( short eid );
short Akt_getImpNrFromId( short iid );
short Akt_getExpIdFromNr( short enr );
short Akt_getImpIdFromNr( short inr );
short Akt_getExpNrFromName( char *name );
short Akt_getImpNrFromName( char *name );
short Akt_getInfoShort( short nr, short what, short *info );
short Akt_getInfoString( short nr, short what, char *info, short max_len );

/******************************************************************************/

/* Konvertieren von Zeichen - Conversion of Chars */
char Akt_CharAtari2X( short nr, char ch );
char Akt_CharX2Atari( short nr, char ch );
short Akt_CharX2Unicode( short nr, char ch );
char Akt_CharUnicode2X( short nr, short unichar );
long Akt_CharXUtf2Unicode( short nr, char *string, long len, short *read_chars );
char *Akt_CharUnicode2XUtf( short nr, long lunicode, char *result, short *used_chars );

/* Konvertieren von Speicherbereichen - Conversion of memory blocks */
char *Akt_BlockAtari2X( char *dest_string, short nr, char *source_string, long len );
char *Akt_BlockX2Atari( char *dest_string, short nr, char *source_string, long len );
short *Akt_BlockX2Unicode( short *unichar, short nr, char *x_chrs, long len );
char *Akt_BlockUnicode2X( char *x_chrs, short nr, short *unichar, long len );
short *Akt_BlockXUtf2Unicode( short *unichar, long *uni_len, short nr, char *x_chrs, long len );
char *Akt_BlockUnicode2XUtf( char *x_chrs, long *str_len, short nr, short *unichar, long len );
char *Akt_BlockXUtf2U2XUtf( char *dest, long *dest_len, short dest_nr, char *source, long src_len, short src_nr );
char *Akt_BlockXUtf2XUtf( char *dest, long *dest_len, short dest_nr, char *source, long src_len, short src_nr );

/* Konvertieren von Strings - Conversion of Strings */
char *Akt_StringAtari2X( char *dest_string, short nr, char *source_string );
char *Akt_StringX2Atari( char *dest_string, short nr, char *source_string );
short *Akt_StringX2Unicode( short *unichar, short nr, char *string );
short *Akt_StringXUtf2Unicode( short *unichar, long *uni_len, short nr, char *string );
char *Akt_StringXUtf2U2XUtf( char *dest, long *dest_len, short dest_nr, char *source, short src_nr );
char *Akt_StringXUtf2XUtf( char *dest, long *dest_len, short dest_nr, char *source, short src_nr );

/******************************************************************************/

/* Das Euro-Zeichen und Infos ber Euro - The Euro-Sign and Infos about Euro */
long Akt_getEuro( void );

/******************************************************************************/

#endif
