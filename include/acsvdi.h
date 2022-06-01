/******************************************************************************/
/*                                                                            */
/*          Eine handoptimierte Bibliothek f�r Pure-C und GNU-C               */
/*                                                                            */
/* Die (N)VDI-Funktionen - Headerdatei                                        */
/*                                                                            */
/* (c) 1998-2003 by Martin Els�sser @ LL                                      */
/* (c) 2008 Gerhard Stoll @ B                                                 */
/*                                                                            */
/*                                                 Tabsize: 1 Tag = 3 Spaces  */
/******************************************************************************/

#ifndef __ACSVDI__
#define __ACSVDI__

#ifndef __VDI__
#define __VDI__
#endif

/******************************************************************************/

#ifdef __cplusplus
extern "C" {
#endif

/******************************************************************************/

#ifndef __ACSTYPE__
   #include <acstype.h>
#endif

#include <stdlib.h>

/******************************************************************************/
/*                                                                            */
/* Die diversen VDI-Konstanten                                                */
/*                                                                            */
/******************************************************************************/

/* Die Namen der Farben */
#define WHITE            0
#define BLACK            1
#define RED              2
#define GREEN            3
#define BLUE             4
#define CYAN             5
#define YELLOW           6
#define MAGENTA          7
#define LWHITE           8
#define LBLACK           9
#define LRED            10
#define LGREEN          11
#define LBLUE           12
#define LCYAN           13
#define LYELLOW         14
#define LMAGENTA        15

#define __COLORS

/******************************************************************************/

/* Status des Atari-SLM-Laserdruckers f�r v_updwk */
#define NO_ERROR           0
#define PRINTER_NOT_READY  2
#define TONER_EMPTY        3
#define PAPER_EMPTY        5

/* Konstanten aus GEMLIB */
#define SLM_OK             NO_ERROR
#define SLM_ERROR          PRINTER_NOT_READY
#define SLM_NOTONER        TONER_EMPTY
#define SLM_NOPAPER        PAPER_EMPTY

/******************************************************************************/

/* Fehlercodes f�r vst_error */
/* Bereits definiert!
#define NO_ERROR           0 */

#define CHAR_NOT_FOUND     1
#define FILE_READERR       8
#define FILE_OPENERR       9
#define BAD_FORMAT      10
#define CACHE_FULL      11
#define MISC_ERROR      (-1)

/******************************************************************************/

/* Die Schreibmodi (f�r vswr_mode) */
#define MD_REPLACE   1
#define MD_TRANS     2
#define MD_XOR       3
#define MD_ERASE     4

/******************************************************************************/

/* Die Linientypen (f�r vsl_type) */
#define LT_SOLID        1
#define LT_LONGDASH     2
#define LT_DOTTED       3
#define LT_DASHDOT      4
#define LT_DASHED       5
#define LT_DASHDOTDOT   6
#define LT_USERDEF      7

/* Konstanten aus PureC-Binding */
#define SOLID           LT_SOLID
#define LONGDASH        LT_LONGDASH
#define DOT             LT_DOTTED
#define DASHDOT         LT_DASHDOT
#define DASH            LT_DASHED
#define DASH2DOT        LT_DASHDOTDOT
#define USERLINE        LT_USERDEF

/* Konstanten aus GEMLIB */
#define LDASHED         LT_LONGDASH
#define DOTTED          LT_DOTTED
#define DASHDOT         LT_DASHDOT
#define DASH            LT_DASHED
#define DASHDOTDOT      LT_DASHDOTDOT

/******************************************************************************/

/* Die Linienenden (f�r vsl_ends) */
#define LE_SQUARED   0
#define LE_ARROWED   1
#define LE_ROUNDED   2

#define SQUARE       LE_SQUARED
#define ARROWED      LE_ARROWED
#define ROUND        LE_ROUNDED

/******************************************************************************/

/* Die Markertypen (f�r vsm_type) */
#define MT_DOT          1
#define MT_PLUS         2
#define MT_ASTERISK     3
#define MT_SQUARE       4
#define MT_DCROSS       5
#define MT_DIAMOND      6

/* Konstanten aus GEMLIB */
#define MRKR_DOT        MT_DOT
#define MRKR_PLUS       MT_PLUS
#define MRKR_ASTERISK   MT_ASTERISK
#define MRKR_BOX        MT_SQUARE
#define MRKR_CROSS      MT_DCROSS
#define MRKR_DIAMOND    MT_DIAMOND

/******************************************************************************/

/* Texteffekte (f�r vst_effects) */
#define TF_NORMAL       0x00
#define TF_THICKENED    0x01
#define TF_LIGHTENED    0x02
#define TF_SLANTED      0x04
#define TF_UNDERLINED   0x08
#define TF_OUTLINED     0x10
#define TF_SHADOWED     0x20

/* Konstanten aus GEMLIB */
#define TXT_NORMAL      TF_NORMAL
#define TXT_THICKENED   TF_THICKENED
#define TXT_LIGHT       TF_LIGHTENED
#define TXT_SKEWED      TF_SLANTED
#define TXT_UNDERLINED  TF_UNDERLINED
#define TXT_OUTLINED    TF_OUTLINED
#define TXT_SHADOWED    TF_SHADOWED

/******************************************************************************/

/* Text-Ausrichtung (f�r vst_alignment) */
#define TA_LEFT      0
#define TA_CENTER    1
#define TA_RIGHT     2

#define TA_BASELINE  0
#define TA_HALF      1
#define TA_ASCENT    2
#define TA_BOTTOM    3
#define TA_DESCENT   4
#define TA_TOP       5

/******************************************************************************/

/* Mode f�r vst_charmap */
#define MAP_BITSTREAM   0
#define MAP_ATARI       1
#define MAP_UNICODE     2     /* for vst_map_mode, NVDI 4 */

/******************************************************************************/

/* Modes f�r 'track_mode' von vst_kern */
#define TRACK_NONE         0
#define TRACK_NORMAL       1
#define TRACK_TIGHT        2
#define TRACK_VERYTIGHT    3

/******************************************************************************/

/* Modes f�r 'pair_mode' von vst_kern */
#define PAIR_OFF           0
#define PAIR_ON            1

/******************************************************************************/

/* Modes f�r vst_scratch */
#define SCRATCH_BOTH       0
#define SCRATCH_BITMAP     1
#define SCRATCH_NONE       2

/******************************************************************************/

/* F�lltypen (f�r vsf_interior) */
#define FIS_HOLLOW   0
#define FIS_SOLID    1
#define FIS_PATTERN  2
#define FIS_HATCH    3
#define FIS_USER     4

/******************************************************************************/

/* vsf_perimeter Modes */
#define PERIMETER_OFF   0
#define PERIMETER_ON    1

/******************************************************************************/

#define IP_HOLLOW       0
#define IP_1PATT        1
#define IP_2PATT        2
#define IP_3PATT        3
#define IP_4PATT        4
#define IP_5PATT        5
#define IP_6PATT        6
#define IP_SOLID        7

/******************************************************************************/

/* Mode f�r v_bez */
#define BEZ_BEZIER      0x01
#define BEZ_POLYLINE    0x00
#define BEZ_NODRAW      0x02

/******************************************************************************/

/* Modus f�r v_bit_image */
#define IMAGE_LEFT      0
#define IMAGE_CENTER    1
#define IMAGE_RIGHT     2
#define IMAGE_TOP       0
#define IMAGE_BOTTOM    2

/******************************************************************************/

/* Modus f�r v_justified */
#define NOJUSTIFY       0
#define JUSTIFY         1

/******************************************************************************/

/* vq_color modes */
#define COLOR_REQUESTED    0
#define COLOR_ACTUAL       1

/******************************************************************************/

/* Mode f�r vqin_mode & vsin_mode analog GEMLIB */
#define VINMODE_LOCATOR       1
#define VINMODE_VALUATOR      2
#define VINMODE_CHOICE        3
#define VINMODE_STRING        4

/* DIe "alten" Namen der Konstanten */
#define LOCATOR      VINMODE_LOCATOR
#define VALUATOR     VINMODE_VALUATOR
#define CHOICE       VINMODE_CHOICE
#define STRING       VINMODE_STRING

/******************************************************************************/

/* Modus f�r vqt_cachesize */
#define CACHE_CHAR      0
#define CACHE_MISC      1

/******************************************************************************/

/* Returnwert von vqt_devinfo */
#define DEV_MISSING        0
#define DEV_INSTALLED      1

/******************************************************************************/

/* Returnwert von vqt_name */
#define BITMAP_FONT     0

/******************************************************************************/

/* Mode f�r vst_error */
#define APP_ERROR       0
#define SCREEN_ERROR    1

/******************************************************************************/

/* Die Verkn�pfungen der Raster-Operationen */
#define ALL_WHITE        0
#define S_AND_D          1
#define S_AND_NOTD       2
#define S_ONLY           3
#define NOTS_AND_D       4
#define D_ONLY           5
#define S_XOR_D          6
#define S_OR_D           7
#define NOT_SORD         8
#define NOT_SXORD        9
#define D_INVERT        10
#define NOT_D           10
#define S_OR_NOTD       11
#define NOT_S           12
#define NOTS_OR_D       13
#define NOT_SANDD       14
#define ALL_BLACK       15

/******************************************************************************/

#define T_LOGIC_MODE         0
#define T_COLORIZE          16      /* Quelle einf�rben           */
#define T_DRAW_MODE         32
#define T_ARITH_MODE        64      /* Arithmetische Transfermodi */
#define T_DITHER_MODE      128      /* Quelldaten dithern         */

/* Logische Transfermodi f�r NVDI-5-Raster-Funktionen */
#define T_LOGIC_COPY          (T_LOGIC_MODE+0)  /* dst = src;                        */
#define T_LOGIC_OR            (T_LOGIC_MODE+1)  /* dst = src OR dst;                 */
#define T_LOGIC_XOR           (T_LOGIC_MODE+2)  /* dst = src XOR dst;                */
#define T_LOGIC_AND           (T_LOGIC_MODE+3)  /* dst = src AND dst;                */
#define T_LOGIC_NOT_COPY      (T_LOGIC_MODE+4)  /* dst = ( NOT src );                */
#define T_LOGIC_NOT_OR        (T_LOGIC_MODE+5)  /* dst = ( NOT src ) OR dst;         */
#define T_LOGIC_NOT_XOR       (T_LOGIC_MODE+6)  /* dst = ( NOT src ) XOR dst;        */
#define T_LOGIC_NOT_AND       (T_LOGIC_MODE+7)  /* dst = ( NOT src ) AND dst;        */

#define T_NOT                 T_LOGIC_NOT_COPY

/* Zeichenmodi f�r NVDI-5-Raster-Funktionen */
#define T_REPLACE             (T_DRAW_MODE+0)   /* dst = src;                        */
#define T_TRANSPARENT         (T_DRAW_MODE+1)   /* if ( src != bg_col ) dst = src;   */
#define T_HILITE              (T_DRAW_MODE+2)   /* if ( src != bg_col )              */
                                                /* {                                 */
                                                /*    if ( dst == bg_col )           */
                                                /*       dst = hilite_col;           */
                                                /*    else if ( dst == hilite_col )  */
                                                /*       dst = bg_col;               */
                                                /* }                                 */
#define T_REVERS_TRANSPARENT  (T_DRAW_MODE+3)   /* if ( src == bg_col ) dst = src;   */

/* Arithmetische Transfermodi f�r NVDI-5-Raster-Funktionen */
#define T_BLEND               (T_ARITH_MODE+0)  /* Quell- und Zielfarbe mischen       */
                                                /* rgb = RGB( src ) * Gewichtung );   */
                                                /* rgb += RGB( dst ) * (1-Gewichtung));*/
                                                /* dst = PIXELWERT( rgb );            */

#define T_ADD                 (T_ARITH_MODE+1)  /* Quell- und Zielfarbe addieren      */
                                                /* rgb = RGB( src ) + RGB( dst )      */
                                                /* if ( rgb > max_rgb )               */
                                                /*    rgb = max_rgb;                  */
                                                /* dst = PIXELWERT( rgb );            */

#define T_ADD_OVER            (T_ARITH_MODE+2)  /* Quell- und Zielfarbe addieren,     */
                                                /* �berlauf nicht abfangen            */
                                                /* rgb = RGB( src ) + RGB( dst )      */
                                                /* dst = PIXELWERT( rgb );            */

#define T_SUB                 (T_ARITH_MODE+3)  /* Quell- von Zielfarbe subtrahieren  */
                                                /* rgb = RGB( dst ) - RGB( src )      */
                                                /* if ( rgb < min_rgb )               */
                                                /*    rgb = min_rgb;                  */
                                                /* dst = PIXELWERT( rgb );            */

#define T_MAX                 (T_ARITH_MODE+5)  /* maximale RGB-Komponenten           */
                                                /* rgb = MAX(RGB( dst ), RGB( src ))  */
                                                /* dst = PIXELWERT( rgb );            */

#define T_SUB_OVER            (T_ARITH_MODE+6)  /* Quell- von Zielfarbe subtrahieren, */
                                                /* �berlauf nicht abfangen            */
                                                /* rgb = RGB( dst ) - RGB( src )      */
                                                /* dst = PIXELWERT( rgb );            */

#define T_MIN                 (T_ARITH_MODE+7)  /* minimale RGB-Komponenten           */
                                                /* rgb = MIN(RGB( dst ), RGB( src ))  */
                                                /* dst = PIXELWERT( rgb );            */

/******************************************************************************/

/* Konstanten f�r Pixelformate */
#define  PX_1COMP    0x01000000L /* Pixel besteht aus einer benutzten Komponente: Farbindex */
#define  PX_3COMP    0x03000000L /* Pixel besteht aus drei benutzten Komponenten, z.B. RGB */
#define  PX_4COMP    0x04000000L /* Pixel besteht aus vier benutzten Komponenten, z.B. CMYK */

#define  PX_REVERSED 0x00800000L /* Pixel wird in umgekehrter Bytereihenfolge ausgegeben */
#define  PX_xFIRST   0x00400000L /* unbenutzte Bits liegen vor den benutzen (im Motorola-Format betrachtet) */
#define  PX_kFIRST   0x00200000L /* K liegt vor CMY (im Motorola-Format betrachtet) */
#define  PX_aFIRST   0x00100000L /* Alphakanal liegen vor den Farbbits (im Motorola-Format betrachtet) */

#define  PX_PACKED   0x00020000L /* Bits sind aufeinanderfolgend abgelegt */
#define  PX_PLANES   0x00010000L /* Bits sind auf mehrere Ebenen verteilt (Reihenfolge: 0, 1, ..., n) */
#define  PX_IPLANES  0x00000000L /* Bits sind auf mehrere Worte verteilt (Reihenfolge: 0, 1, ..., n) */

#define  PX_USES1    0x00000100L /* 1 Bit des Pixels wird benutzt */
#define  PX_USES2    0x00000200L /* 2 Bit des Pixels werden benutzt */
#define  PX_USES3    0x00000300L /* 3 Bit des Pixels werden benutzt */
#define  PX_USES4    0x00000400L /* 4 Bit des Pixels werden benutzt */
#define  PX_USES8    0x00000800L /* 8 Bit des Pixels werden benutzt */
#define  PX_USES15   0x00000f00L /* 15 Bit des Pixels werden benutzt */
#define  PX_USES16   0x00001000L /* 16 Bit des Pixels werden benutzt */
#define  PX_USES24   0x00001800L /* 24 Bit des Pixels werden benutzt */
#define  PX_USES32   0x00002000L /* 32 Bit des Pixels werden benutzt */
#define  PX_USES48   0x00003000L /* 48 Bit des Pixels werden benutzt */

#define  PX_1BIT     0x00000001L /* Pixel besteht aus 1 Bit */
#define  PX_2BIT     0x00000002L /* Pixel besteht aus 2 Bit */
#define  PX_3BIT     0x00000003L /* Pixel besteht aus 3 Bit */
#define  PX_4BIT     0x00000004L /* Pixel besteht aus 4 Bit */
#define  PX_8BIT     0x00000008L /* Pixel besteht aus 8 Bit */
#define  PX_16BIT    0x00000010L /* Pixel besteht aus 16 Bit */
#define  PX_24BIT    0x00000018L /* Pixel besteht aus 24 Bit */
#define  PX_32BIT    0x00000020L /* Pixel besteht aus 32 Bit */
#define  PX_48BIT    0x00000030L /* Pixel besteht aus 48 Bit */

#define  PX_CMPNTS   0x0f000000L /* Maske f&uuml;r Anzahl der Pixelkomponenten */
#define  PX_FLAGS    0x00f00000L /* Maske f&uuml;r diverse Flags */
#define  PX_PACKING  0x00030000L /* Maske f&uuml;r Pixelformat */
#define  PX_USED     0x00003f00L /* Maske f&uuml;r Anzahl der benutzten Bits */
#define  PX_BITS     0x0000003fL /* Maske f&uuml;r Anzahl der Bits pro Pixel */

/* Pixelformate f�r ATARI-Grafik */
#define  PX_ATARI1   ( PX_PACKED + PX_1COMP + PX_USES1 + PX_1BIT )
#define  PX_ATARI2   ( PX_IPLANES + PX_1COMP + PX_USES2 + PX_2BIT )
#define  PX_ATARI4   ( PX_IPLANES + PX_1COMP + PX_USES4 + PX_4BIT )
#define  PX_ATARI8   ( PX_IPLANES + PX_1COMP + PX_USES8 + PX_8BIT )
#define  PX_FALCON15 ( PX_PACKED + PX_3COMP + PX_USES16 + PX_16BIT )

/* Pixelformate f�r Mac */
#define  PX_MAC1     ( PX_PACKED + PX_1COMP + PX_USES1 + PX_1BIT )
#define  PX_MAC4     ( PX_PACKED + PX_1COMP + PX_USES4 + PX_4BIT )
#define  PX_MAC8     ( PX_PACKED + PX_1COMP + PX_USES8 + PX_8BIT )
#define  PX_MAC15    ( PX_xFIRST + PX_PACKED + PX_3COMP + PX_USES15 + PX_16BIT )
#define  PX_MAC32    ( PX_xFIRST + PX_PACKED + PX_3COMP + PX_USES24 + PX_32BIT )

/* Pixelformate f�r Grafikkarten */
#define  PX_VGA1     ( PX_PACKED + PX_1COMP + PX_USES1 + PX_1BIT )
#define  PX_VGA4     ( PX_PLANES + PX_1COMP + PX_USES4 + PX_4BIT )
#define  PX_VGA8     ( PX_PACKED + PX_1COMP + PX_USES8 + PX_8BIT )
#define  PX_VGA15    ( PX_REVERSED + PX_xFIRST + PX_PACKED + PX_3COMP + PX_USES15 + PX_16BIT )
#define  PX_VGA16    ( PX_REVERSED + PX_PACKED + PX_3COMP + PX_USES16 + PX_16BIT )
#define  PX_VGA24    ( PX_REVERSED + PX_PACKED + PX_3COMP + PX_USES24 + PX_24BIT )
#define  PX_VGA32    ( PX_REVERSED + PX_xFIRST + PX_PACKED + PX_3COMP + PX_USES24 + PX_32BIT )

#define  PX_MATRIX16 ( PX_PACKED + PX_3COMP + PX_USES16 + PX_16BIT )

#define  PX_NOVA32   ( PX_PACKED + PX_3COMP + PX_USES24 + PX_32BIT )

/* Pixelformate f�r Drucker */
#define  PX_PRN1     ( PX_PACKED + PX_1COMP + PX_USES1 + PX_1BIT )
#define  PX_PRN8     ( PX_PACKED + PX_1COMP + PX_USES8 + PX_8BIT )
#define  PX_PRN32    ( PX_xFIRST + PX_PACKED + PX_3COMP + PX_USES24 + PX_32BIT )

/* bevorzugte (schnelle) Pixelformate f�r Bitmaps */
#define  PX_PREF1    ( PX_PACKED + PX_1COMP + PX_USES1 + PX_1BIT )
#define  PX_PREF2    ( PX_PACKED + PX_1COMP + PX_USES2 + PX_2BIT )
#define  PX_PREF4    ( PX_PACKED + PX_1COMP + PX_USES4 + PX_4BIT )
#define  PX_PREF8    ( PX_PACKED + PX_1COMP + PX_USES8 + PX_8BIT )
#define  PX_PREF15   ( PX_xFIRST + PX_PACKED + PX_3COMP + PX_USES15 + PX_16BIT )
#define  PX_PREF32   ( PX_xFIRST + PX_PACKED + PX_3COMP + PX_USES24 + PX_32BIT )

/******************************************************************************/

enum
{
   CSPACE_RGB     =  0x0001,
   CSPACE_ARGB    =  0x0002,
   CSPACE_CMYK    =  0x0004
};

/******************************************************************************/

enum
{
   CSPACE_1COMPONENT    =  0x0001,
   CSPACE_2COMPONENTS   =  0x0002,
   CSPACE_3COMPONENTS   =  0x0003,
   CSPACE_4COMPONENTS   =  0x0004
};

/******************************************************************************/

/* Logische Eingabeger�te (f�r vsin_mode) */
#define DEV_LOCATOR  1
#define DEV_VALUATOR 2
#define DEV_CHOICE   3
#define DEV_STRING   4

/******************************************************************************/

/* Eingabe-Modus der Eingabeger�te (f�r vsin_mode) */
#define MODE_REQUEST 1
#define MODE_SAMPLE  2

/******************************************************************************/

/* Die Seiten-Formate (f�r v_opnprn) */
#define PAGE_DEFAULT    0
#define PAGE_A3         1     /* DIN A3 */
#define PAGE_A4         2     /* DIN A4 */
#define PAGE_A5         3     /* DIN A5 */
#define PAGE_B5         4     /* DIN B5 */

#define PAGE_LETTER     16    /* letter size      */
#define PAGE_HALF       17    /* half size        */
#define PAGE_LEGAL      18    /* legal size       */
#define PAGE_DOUBLE     19    /* double size      */
#define PAGE_BROAD      20    /* broad sheet size */

/******************************************************************************/

/* Flags f�r die Font-Informationen �ber Fonts (f�r vqt_ext_name) */
#define FNT_AEQUIDIST   0x0001
#define FNT_SYMBOL      0x0010

/******************************************************************************/

/* Flags f�r die Font-Informationen �ber das Font-Format (f�r vqt_ext_name) */
#define FNT_BITMAP   0x0001
#define FNT_SPEEDO   0x0002
#define FNT_TRUETYPE 0x0004
#define FNT_TYPE1    0x0008

/******************************************************************************/

/* Das Mapping von Zeichen (f�r vqt_char_index) */
#define CHARIDX_DIRECT  0
#define CHARIDX_ASCII   1
#define CHARIDX_UNICODE 2

/******************************************************************************/

/* Mode-Konstanten f�r vst_charmap */
#define CHARMODE_DIRECT     0
#define CHARMODE_ASCII      1
#define CHARMODE_UNICODE    2
#define CHARMODE_UNKNOWN   -1

/******************************************************************************/

/* Modes f�r Track-Kerning (vst_kern) */
#define TRACKMODE_NO             0
#define TRACKMODE_NORMAL         1
#define TRACKMODE_TIGHTY         2
#define TRACKMODE_VERY_TIGHTY    3

/******************************************************************************/

/* Modes f�r Pair-Kerning (vst_kern) */
#define PAIRKERN_OFF    0
#define PAIRKERN_ON     1

/******************************************************************************/

/* Ausrichtung der Seite (v_orient) */
#define ORIENT_INQUIRE     -1
#define ORIENT_NORMAL      0
#define ORIENT_LANDSCAPE   1

/******************************************************************************/

/* R�ckgabewerte von vq_vgdos */
#define GDOS_NONE      -2L            /* no GDOS installed           */
#define GDOS_FSM       0x5F46534DL    /* '_FSM' - FSMGDOS installed  */
#define GDOS_FNT       0x5F464E54L    /* '_FNT' - FONTGDOS installed */

/******************************************************************************/

/* Die Funktion _vq_gdos ist identisch mit vq_vgdos */
#define _vq_gdos() vq_vgdos()

/******************************************************************************/
/*                                                                            */
/* Die diversen VDI-Strukturen                                                */
/*                                                                            */
/******************************************************************************/

/* Datentyp f�r Vektorfonts ab NVDI 4.x */
typedef int32 fix31;

/******************************************************************************/

typedef struct
{
   void *fd_addr;
   int16 fd_w;
   int16 fd_h;
   int16 fd_wdwidth;
   int16 fd_stand;
   int16 fd_nplanes;
   int16 fd_r1;
   int16 fd_r2;
   int16 fd_r3;
} MFDB;

/******************************************************************************/

/* Struktur des Headers eines GEM-Metafiles */
typedef struct
{
   int16 mf_header;     /* -1, Metafile-Kennung                             */
   int16 mf_length;     /* Headerl�nge in Worten (normalerweise 24)         */
   int16 mf_version;    /* Versionsnummer des Formats, hier 101 f�r 1.01    */
   int16 mf_ndcrcfl;    /* NDC/RC-Flag, normalerweise 2 (Rasterkoordinaten) */
   int16 mf_extents[4]; /* optional - maximale Ausma�e der Grafik           */
   int16 mf_pagesz[2];  /* optional - Seitengr��e in 1/10 mm                */
   int16 mf_coords[4];  /* optional - Koordinatensystem                     */
   int16 mf_imgflag;    /* Flag f�r durch v_bit_image() eingebundene Bilder */
   int16 mf_resvd[9];
} METAHDR;

/******************************************************************************/

/* Font-Info-Struktur (f�r vqt_xfntinfo) */
typedef struct
{
   int32 size;             /* L�nge der Struktur, mu� vor vqt_xfntinfo() gesetzt werden */
   int16 format;           /* Fontformat, z.B. 4 f&uuml;r TrueType                      */
   int16 id;               /* Font-ID, z.B. 6059                                        */
   int16 index;            /* Index                                                     */
   char  font_name[50];    /* vollst�ndiger Fontname, z.B. "Century 725 Italic BT"      */
   char  family_name[50];  /* Name der Fontfamilie, z.B. "Century725 BT"                */
   char  style_name[50];   /* Name des Fontstils, z.B. "Italic"                         */
   char  file_name1[200];  /* Name der 1. Fontdatei, z.B. "C:\FONTS\TT1059M_.TTF"       */
   char  file_name2[200];  /* Name der optionalen 2. Fontdatei                          */
   char  file_name3[200];  /* Name der optionalen 3. Fontdatei                          */
   int16 pt_cnt;           /* Anzahl der Punkth�hen f�r vst_point(), z.B. 10            */
   int16 pt_sizes[64];     /* verf�gbare Punkth�hen, z.B.                               */
                           /* {8, 9, 10, 11, 12, 14, 18, 24, 36, 48}                    */
} XFNT_INFO;

/******************************************************************************/

/* Aufbau der RGB-Farben */
typedef struct
{
   uint16 reserved;  /* reserviert, auf 0 setzen */
   uint16 red;       /* Rot-Anteil: 0..65535     */
   uint16 green;     /* Gr�n-Anteil: 0..65535    */
   uint16 blue;      /* Blau-Anteil: 0..65535    */
} COLOR_RGB;

/******************************************************************************/

/* Aufbau der CMYK-Farben */
typedef struct
{
   uint16 cyan;
   uint16 magenta;
   uint16 yellow;
   uint16 black;
} COLOR_CMYK;

/******************************************************************************/

/* Ein Eintrag der Farbtabelle */
typedef union
{
   COLOR_RGB   rgb;
   COLOR_CMYK  cmyk;
} COLOR_ENTRY;

/******************************************************************************/

#define  COLOR_TAB_MAGIC   'ctab'

/* Die Farb-Tabelle */
typedef struct
{
   int32 magic;            /* COLOR_TAB_MAGIC ('ctab') */
   int32 length;
   int32 format;           /* Format (0) */
   int32 reserved;         /* reserviert, auf 0 setzen */

   int32 map_id;           /* Kennung der Farbtabelle */
   int32 color_space;      /* Farbraum (z.Zt. nur CSPACE_RGB) */
   int32 flags;            /* VDI-interne Flags, auf 0 setzen */
   int32 no_colors;        /* Anzahl der Farbeintr�ge */

   int32 reserved1;        /* reserviert, auf 0 setzen */
   int32 reserved2;        /* reserviert, auf 0 setzen */
   int32 reserved3;        /* reserviert, auf 0 setzen */
   int32 reserved4;        /* reserviert, auf 0 setzen */

   COLOR_ENTRY colors[];   /* Die Tabelle der Eintr�ge */
} COLOR_TAB;

/******************************************************************************/

/* vordefinierte Tabelle mit 256 Eintr�gen */
typedef struct                   /* Farbtabelle */
{
   int32 magic;            /* COLOR_TAB_MAGIC ('ctab') */
   int32 length;
   int32 format;           /* Format (0) */
   int32 reserved;         /* reserviert, auf 0 setzen */

   int32 map_id;           /* Kennung der Farbtabelle */
   int32 color_space;      /* Farbraum (z.Zt. nur CSPACE_RGB) */
   int32 flags;            /* VDI-interne Flags, auf 0 setzen */
   int32 no_colors;        /* Anzahl der Farbeintr�ge */

   int32 reserved1;        /* reserviert, auf 0 setzen */
   int32 reserved2;        /* reserviert, auf 0 setzen */
   int32 reserved3;        /* reserviert, auf 0 setzen */
   int32 reserved4;        /* reserviert, auf 0 setzen */

   COLOR_ENTRY colors[256];/* Die Tabelle der Eintr�ge */
} COLOR_TAB256;

/******************************************************************************/

/* Zwei Zeiger-Typen auf die Farb-Tabelle */
typedef COLOR_TAB *CTAB_PTR;
typedef COLOR_TAB *CTAB_REF;

/******************************************************************************/

/* Die inverse Farbtabelle - Aufbau nicht dokumentiert und nicht von Bedeutung */
typedef void INVERSE_CTAB;
typedef INVERSE_CTAB *ITAB_PTR;
typedef INVERSE_CTAB *ITAB_REF;

/******************************************************************************/

#define CBITMAP_MAGIC   'cbtm'

/* �ffentliche Bitmapbeschreibung (Struktur mit Versionsheader) */
typedef struct _gcbitmap
{
   int32       magic;      /* Strukturkennung CBITMAP_MAGIC ('cbtm') */
   int32       length;     /* Strukturl�nge */
   int32       format;     /* Strukturformat (0) */
   int32       reserved;   /* reserviert (0) */

   uint8       *addr;      /* Adresse der Bitmap */
   int32       width;      /* Breite einer Zeile in Bytes */
   int32       bits;       /* Bittiefe */
   uint32      px_format;  /* Pixelformat */

   int32       xmin;       /* minimale diskrete x-Koordinate der Bitmap */
   int32       ymin;       /* minimale diskrete y-Koordinate der Bitmap */
   int32       xmax;       /* maximale diskrete x-Koordinate der Bitmap + 1 */
   int32       ymax;       /* maximale diskrete y-Koordinate der Bitmap + 1 */

   CTAB_REF    ctab;       /* Verweis auf die Farbtabelle oder 0L */
   ITAB_REF    itab;       /* Verweis auf die inverse Farbtabelle oder 0L */
   int32       reserved0;  /* reserviert (mu� auf 0 gesetzt werden) */
   int32       reserved1;  /* reserviert (mu� auf 0 gesetzt werden) */
} GCBITMAP;

/******************************************************************************/

/* Wert des Cookies 'NVDI' */
typedef struct
{
   uint16 nvdi_version;  /*  z.B. 0x0301 f�r Version 3.01    */
   uint32 nvdi_datum;    /*  z.B. 0x18061990L f�r 18.06.1990 */
   struct
   {
      unsigned           : 9;  /* Reserved                       */
      unsigned alert     : 1;  /* Error-messages on/off          */
      unsigned           : 1;  /* Reserved                       */
      unsigned linea     : 1;  /* LINE-A                         */
      unsigned mouse     : 1;  /* Dynamic mouse                  */
      unsigned gemdos    : 1;  /* (Fast) GEMDOS character output */
      unsigned error     : 1;  /* Error compatibility            */
      unsigned gdos      : 1;  /* GDOS                           */
   } nvdi_config;
} NVDI_STRUC;

/******************************************************************************/
/*                                                                            */
/* Die AES-Include-Datei wird nun ben�tigt                                    */
/* Diese kann erst hier eingelesen werden, da dort auf vorstehende Strukturen */
/* verwiesen wird!                                                            */
/*                                                                            */
/******************************************************************************/

#include <acsaes.h>

/******************************************************************************/
/*                                                                            */
/* Prototyp der Assembler-Routine                                             */
/* Diese macht den VDI-Aufruf und setzt den dazu n�tigen VDI-Parameterblock   */
/* auf dem Stack zusammen - das ist etwas multithreading freundlicher... ;-)  */
/*                                                                            */
/******************************************************************************/

void CDECL vdi_( int16 *contrl, const int16 *intin, const int16 *ptsin, int16 *intout, int16 *ptsout );

/******************************************************************************/
/*                                                                            */
/* Eigentliche VDI-Funktionen mit "Original-Parametern"                       */
/*                                                                            */
/******************************************************************************/

typedef struct
{
   int16 contrl[15];
   int16 intin[132];
   int16 intout[140];
   int16 ptsin[145];
   int16 ptsout[145];
} VDIPARBLK;

typedef struct
{
   int16 *contrl;
   int16 *intin;
   int16 *ptsin;
   int16 *intout;
   int16 *ptsout;
} VDIPB;

extern VDIPARBLK _VDIParBlk;

/******************************************************************************/

/* Die "alte" Fassung des VDI-Aufrufes */
void vdi( VDIPB *vdipb );

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                         */
/* Die Kontroll-Funktionen                                                 */
/*                                                                         */
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

int16 vst_load_fonts( int16 handle, int16 select );
void vst_unload_fonts( int16 handle, int16 select );
void vs_clip( int16 handle, int16 clip_flag, const int16 *pxyarray );

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                         */
/* Die Ausgabe-Funktionen                                                  */
/*                                                                         */
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void vr_recfl( int16 handle, const int16 *pxyarray );
void v_rfbox( int16 handle, const int16 *rectangle );
void v_rbox( int16 handle, int16 *pxyarray );

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                         */
/* Die Attribut-Funktionen                                                 */
/*                                                                         */
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void vs_color( int16 handle, int16 index, const int16 *rgb );
int16 vs_ctab( int16 handle, COLOR_TAB *ctab );
int16 vs_ctab_entry( int16 handle, int16 index, int32 color_space, COLOR_ENTRY *color );
int16 vs_dflt_ctab( int16 handle );

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                         */
/* Die Raster-Funktionen                                                   */
/*                                                                         */
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void vro_cpyfm( int16 handle, int16 wr_mode, const int16 *pxyarray, const MFDB *source, MFDB *dest );
void vrt_cpyfm( int16 handle, int16 wr_mode, const int16 *pxyarray, const MFDB *source, MFDB *dest, const int16 color[2] );
void vr_transfer_bits( int16 handle, const GCBITMAP *src_bm, const GCBITMAP *dst_bm,
            const int16 *src_rect, const int16 *dst_rect, int16 mode );

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                         */
/* Die Auskunft-Funktionen                                                 */
/*                                                                         */
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

int16 vq_color( int16 handle, int16 color, int16 set_flag, int16 *rgb );
void vq_cellarray( int16 handle, const int16 *pxyarray, int16 row_length,
            int16 num_rows, int16 *el_used, int16 *rows_used, int16 *status,
            int16 *colarray );

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                         */
/* Die Escape-Funktionen                                                   */
/*                                                                         */
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void v_output_window( int16 handle, const int16 *pxyarray );
void v_bit_image( int16 handle, const char *filename, int16 aspect,
            int16 x_scale, int16 y_scale, int16 h_align,
            int16 v_align, const int16 *pxyarray );

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* Die Kontroll-Funktionen                                                    */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void v_opnwk( int16 *work_in, int16 *handle, int16 *work_out );
void v_opnprn( int16 *handle, PRN_SETTINGS *settings, int16 *work_out );
void v_opnprnwrk( int16 *handle, int16 *work_in, PRN_SETTINGS *settings, int16 *work_out );
void v_opnmatrixprn( int16 *work_in, int16 *handle, int16 *work_out, int16 max_x, int16 max_y );
void v_opnmeta( int16 *work_in, int16 *handle, int16 *work_out, const char *filename );
void v_clswk( int16 handle );
void v_opnvwk( int16 *work_in, int16 *handle, int16 *work_out );
void v_clsvwk( int16 handle );
void v_clrwk( int16 handle );
void v_updwk( int16 handle );

/* NVDI-Erweiterungen */
void v_opnbm( int16 *work_in, const MFDB *bitmap, int16 *handle, int16 *work_out );
void v_clsbm( int16 handle );
int16 v_open_bm( int16 base_handle, const GCBITMAP *bitmap, int16 zero,
            int16 flags, int16 pixel_width, int16 pixel_height );
int16 v_resize_bm( int16 handle, int16 width, int16 height,
            int32 byte_width, const uint8 *addr );

/* Speedo-Erweiterung */
void v_set_app_buff( int16 handle, void *address, int16 nparagraphs );

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* Die Ausgabe-Funktionen                                                     */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void v_pline( int16 handle, int16 count, const int16 *pxyarray );
void v_pmarker( int16 handle, int16 count, int16 *pxyarray );
void v_gtext( int16 handle, int16 x, int16 y, const char *string );
void v_fillarea( int16 handle, int16 count, const int16 *pxyarray );
void v_cellarray( int16 handle, int16 *pxyarray, int16 row_length,
         int16 el_used, int16 num_rows, int16 wrt_mode,
         const int16 *colarray );
void v_contourfill( int16 handle, int16 x, int16 y, int16 index );
void v_bar( int16 handle, const int16 *pxyarray );
void v_arc( int16 handle, int16 x, int16 y,
         int16 radius, int16 beg_ang, int16 end_ang );
void v_pieslice( int16 handle, int16 x, int16 y,
         int16 radius, int16 beg_ang, int16 end_ang );
void v_circle( int16 handle, int16 x, int16 y, int16 radius );
void v_ellipse( int16 handle, int16 x, int16 y, int16 xradius, int16 yradius );
void v_ellarc( int16 handle, int16 x, int16 y,
      int16 xradius, int16 yradius, int16 beg_ang, int16 end_ang );
void v_ellpie( int16 handle, int16 x, int16 y,
         int16 xradius, int16 yradius, int16 beg_ang, int16 end_ang );
void v_justified( int16 handle, int16 x, int16 y, const char *string,
         int16 length, int16 word_space, int16 char_space );

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void v_bez( int16 handle, int16 count, int16 *pxyarray, char *bezarray,
         int16 *extent, int16 *totpts, int16 *totmoves );
int16 v_bez_on( int16 handle );
void v_bez_off( int16 handle );
void v_bez_qual( int16 handle, int16 qual, int16 *set_qual );
void v_bez_fill( int16 handle, int16 count, int16 *pxyarray, uint8 *bezarray,
         int16 *extent, int16 *totpts, int16 *totmoves );
void v_ftext( int16 handle, int16 x, int16 y, const char *string );
void v_ftext_offset( int16 handle, int16 x, int16 y,
         const char *string, const int16 *offsets );

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

int16 v_get_outline( int16 handle, int16 index, int16 x_offset,
         int16 y_offset, int16 *xyarray, uint8 *bezarray, int16 max_pts );
void v_getoutline( int16 handle, int16 index, int16 *xyarray,
         uint8 *bezarray, int16 max_pts, int16 *count );

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* Die Attribut-Funktionen                                                    */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

int16 vq_gdos( void );
int32 vq_vgdos( void );
int16 vswr_mode( int16 handle, int16 mode );
int16 vsl_type( int16 handle, int16 style );
void vsl_udsty( int16 handle, int16 pattern );
int16 vsl_width( int16 handle, int16 width );
int16 vsl_color( int16 handle, int16 color );
void vsl_ends( int16 handle, int16 beg_style, int16 end_style );
int16 vsm_type( int16 handle, int16 symbol );
int16 vsm_height( int16 handle, int16 height );
int16 vsm_color( int16 handle, int16 color );
void vst_height( int16 handle, int16 height,
         int16 *char_width, int16 *char_height, int16 *cell_width, int16 *cell_height );
int16 vst_point( int16 handle, int16 point,
         int16 *char_width, int16 *char_height, int16 *cell_width, int16 *cell_height );
int16 vst_arbpt( int16 handle, int16 point, int16 *char_width,
         int16 *char_height, int16 *cell_width, int16 *cell_height );
fix31 vst_arbpt32( int16 handle, fix31 height, int16 *char_width,
         int16 *char_height, int16 *cell_width, int16 *cell_height );
int16 vst_setsize( int16 handle, int16 width, int16 *char_width,
         int16 *char_height, int16 *cell_width, int16 *cell_height );
fix31 vst_setsize32( int16 handle, fix31 width, int16 *char_width,
         int16 *char_height, int16 *cell_width, int16 *cell_height );
int16 vst_rotation( int16 handle, int16 angle );
int16 vst_font( int16 handle, int16 fontID );
int16 vst_color( int16 handle, int16 color );
int16 vst_effects( int16 handle, int16 effect );
void vst_error( int16 handle, int16 mode, int16 *errorcode );
int16 v_savecache( int16 handle, const char *filename );
int16 v_loadcache( int16 handle, const char *filename, int16 mode );
int16 v_flushcache( int16 handle );
void vst_scratch( int16 handle, int16 mode );
void vst_alignment( int16 handle, int16 hor_in, int16 ver_in,
         int16 *hor_out, int16 *ver_out );
int16 vst_name( int16 handle, int16 font_format, const char *font_name,
         char *ret_name );
void vst_width( int16 handle, int16 width, int16 *char_width,
               int16 *char_height, int16 *cell_width, int16 *cell_height );
void vst_charmap( int16 handle, int16 mode );
int16 vst_map_mode( int16 handle, int16 mode );
void vst_kern( int16 handle, int16 track_mode, int16 pair_mode,
         int16 *tracks, int16 *pairs );
void vst_kern_offset( int16 handle, fix31 offset, int16 pair_mode,
         int16 *tracks, int16 *pairs );
void vst_track_offset( int16 handle, fix31 offset, int16 pair_mode,
         int16 *tracks, int16 *pairs );
int16 vst_skew( int16 handle, int16 skew );
int16 vsf_interior( int16 handle, int16 style );
int16 vsf_style( int16 handle, int16 style );
int16 vsf_color( int16 handle, int16 color );
int16 vsf_perimeter( int16 handle, int16 per_vis );
void vsf_udpat( int16 handle, const int16 *pattern, int16 nplanes );

/* Aus PC-GEM/3 */
int16 vsf_perimeter3( int16 handle, int16 per_vis, int16 style );

/* NVDI-Erweiterungen */
int16 vst_fg_color( int16 handle, int32 color_space, COLOR_ENTRY *fg_color );
int16 vsf_fg_color( int16 handle, int32 color_space, COLOR_ENTRY *fg_color );
int16 vsl_fg_color( int16 handle, int32 color_space, COLOR_ENTRY *fg_color );
int16 vsm_fg_color( int16 handle, int32 color_space, COLOR_ENTRY *fg_color );
int16 vsr_fg_color( int16 handle, int32 color_space, COLOR_ENTRY *fg_color );
int16 vst_bg_color( int16 handle, int32 color_space, COLOR_ENTRY *bg_color );
int16 vsf_bg_color( int16 handle, int32 color_space, COLOR_ENTRY *bg_color );
int16 vsl_bg_color( int16 handle, int32 color_space, COLOR_ENTRY *bg_color );
int16 vsm_bg_color( int16 handle, int32 color_space, COLOR_ENTRY *bg_color );
int16 vsr_bg_color( int16 handle, int32 color_space, COLOR_ENTRY *bg_color );
fixed vq_prn_scaling( int16 handle );

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* Die Raster-Funktionen                                                      */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void vr_trnfm( int16 handle, const MFDB *source, MFDB *dest );
void v_get_pixel( int16 handle, int16 x, int16 y,
         int16 *pix_value, int16 *col_index );

/* NVDI-Erweiterungen */
int16 v_orient( int16 handle, int16 orient );
int16 vs_hilite_color( int16 handle, int32 color_space,
            const COLOR_ENTRY *hilite_color );
int16 vs_min_color( int16 handle, int32 color_space,
            const COLOR_ENTRY *min_color );
int16 vs_max_color( int16 handle, int32 color_space,
            const COLOR_ENTRY *min_color );
int16 vs_weight_color( int16 handle, int32 color_space,
            const COLOR_ENTRY *weight_color );
int16 vs_document_info( int16 handle, int16 type, const char *s, int16 wchar );

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* Die Eingabe-Funktionen                                                     */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

int16 vsin_mode( int16 handle, int16 dev_type, int16 mode );
void vrq_locator( int16 handle, int16 x_in, int16 y_in,
         int16 *x_out, int16 *y_out, int16 *term );
int16 vsm_locator( int16 handle, int16 x_in, int16 y_in,
         int16 *x_out, int16 *y_out, int16 *term );
void vrq_valuator( int16 handle, int16 value_in, int16 *value_out, int16 *term );
void vsm_valuator( int16 handle, int16 value_in,
         int16 *value_out, int16 *term, int16 *status );
void vrq_choice( int16 handle, int16 choice_in, int16 *choice_out );
int16 vsm_choice( int16 handle, int16 *choice );
void vrq_string( int16 handle, int16 max_length, int16 echo_mode,
         int16 *echo_xy, char *string );
int16 vsm_string( int16 handle, int16 max_length, int16 echo_mode,
         int16 *echo_xy, char *string );
void vex_timv( int16 handle, int16 (*tim_addr)(void),
         int16 (**otim_addr)(void), int16 *tim_conv );
void v_show_c( int16 handle, int16 reset );
void v_hide_c( int16 handle );
void vq_mouse( int16 handle, int16 *pstatus, int16 *x, int16 *y );
void vex_butv( int16 handle, int16 (*pusrcode)(void), int16 (**psavcode)(void) );
void vex_motv( int16 handle, int16 (*pusrcode)(void), int16 (**psavcode)(void) );
void vex_curv( int16 handle, int16 (*pusrcode)(void), int16 (**psavcode)(void) );
void vq_key_s( int16 handle, int16 *pstatus );
void vex_wheelv( int16 handle, int16 (*pusrcode)(void), int16 (**psavcode)(void) );

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* Die Auskunft-Funktionen                                                    */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void vq_extnd( int16 handle, int16 owflag, int16 *workout );
void vql_attributes( int16 handle, int16 *attrib );
void vqm_attributes( int16 handle, int16 *attrib );
void vqf_attributes( int16 handle, int16 *attrib );
void vqt_extent( int16 handle, const char *string, int16 *extent );
int16 vqt_width( int16 handle, int16 character, int16 *cell_width,
         int16 *left_delta, int16 *right_delta );
void vqin_mode( int16 handle, int16 dev_type, int16 *input_mode );
void vqt_attributes( int16 handle, int16 *attrib );

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/* Speedo-Erweiterung */
void vqt_get_table( int16 handle, int16 **map );
void vqt_cachesize( int16 handle, int16 which_cache, int32 *size );

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/* NVDI-Erweiterungen */
void vqt_f_extent( int16 handle, const char *string, int16 *extent );
void vqt_real_extent( int16 handle, int16 x,
         int16 y, const char *string, int16 *extent );
int16 vqt_name( int16 handle, int16 element_num, char *name );
int16 vqt_ext_name( int16 handle, int16 element_num, char *name,
            uint16 *font_format, uint16 *flags );
int16 vqt_xfntinfo( int16 handle, int16 flags, int16 id,
            int16 index, XFNT_INFO *info );
int16 vqt_name_and_id( int16 handle, int16 font_format,
            const char *font_name, char *ret_name );
void vqt_fontinfo( int16 handle, int16 *minADE, int16 *maxADE, int16 *distances,
         int16 *maxwidth, int16 *effects );
void vqt_justified( int16 handle, int16 x, int16 y, const char *string,
         int16 length, int16 word_space, int16 char_space, int16 *offsets );
void vq_devinfo( int16 handle, int16 device, boolean *dev_open,
         char *file_name, char *device_name );
void vqt_devinfo( int16 handle, int16 devnum,
            boolean *devexists, char *devstr );
boolean vq_ext_devinfo( int16 handle, int16 device, boolean *dev_exists,
         char *file_path, char *file_name, char *name );
void vqt_fontheader( int16 handle, void *buffer, char *tdf_name );
void vq_scrninfo( int16 handle, int16 *work_out );
void vqt_trackkern( int16 handle, fix31 *x_offset, fix31 *y_offset );
void vqt_pairkern( int16 handle, int16 index1, int16 index2,
            fix31 *x_offset, fix31 *y_offset );
void vqt_advance( int16 handle, int16 ch, int16 *x_advance, int16 *y_advance,
            int16 *x_remainder, int16 *y_remainder );
void vqt_advance32( int16 handle, int16 index,
            fix31 *x_advance, fix31 *y_advance );
void v_getbitmap_info( int16 handle, int16 index,
         fix31 *x_advance, fix31 *y_advance, fix31 *x_offset, fix31 *y_offset,
         int16 *width, int16 *height, int16 **bitmap );
int32 vq_hilite_color( int16 handle, COLOR_ENTRY *hilite_color );
int32 vq_min_color( int16 handle, COLOR_ENTRY *min_color );
int32 vq_max_color( int16 handle, COLOR_ENTRY *min_color );
int32 vq_weight_color( int16 handle, COLOR_ENTRY *min_color );

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

uint16 vqt_char_index( int16 handle, uint16 src_index,
               int16 src_mode, int16 dst_mode );
boolean vqt_isCharAvailable( int16 handle, uint16 unicode );

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* Die Escape-Funktionen                                                      */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void vq_chcells( int16 handle, int16 *rows, int16 *cols );
void v_exit_cur( int16 handle );
void v_enter_cur( int16 handle );
void v_curup( int16 handle );
void v_curdown( int16 handle );
void v_curright( int16 handle );
void v_curleft( int16 handle );
void v_curhome( int16 handle );
void v_eeos( int16 handle );
void v_eeol( int16 handle );
#define v_curaddress(handle, row, col) vs_curaddress(handle, row, col)
void vs_curaddress( int16 handle, int16 row, int16 col );
void v_curtext( int16 handle, const char *string );
void v_rvon( int16 handle );
void v_rvoff( int16 handle );
void vq_curaddress( int16 handle, int16 *row, int16 *col );
int16 vq_tabstatus( int16 handle );
void v_hardcopy( int16 handle );
void v_dspcur( int16 handle, int16 x, int16 y );
void v_rmcur( int16 handle );
void v_form_adv( int16 handle );
void v_clear_disp_list( int16 handle );
void vq_scan( int16 handle, int16 *g_slice, int16 *g_page,
         int16 *a_slice, int16 *a_page, int16 *div_fac );
void v_alpha_text( int16 handle, const char *string );
int16 v_copies( int16 handle, int16 count );
int16 v_trays( int16 handle, int16 input, int16 output,
            int16 *set_input, int16 *set_output );
int16 vq_tray_names( int16 handle, char *input_name, char *output_name,
            int16 *input, int16 *output );
int16 v_page_size( int16 handle, int16 page_id );
int16 vq_page_name( int16 handle, int16 page_id, char *page_name,
            int32 *page_width, int32 *page_height );
int16 vs_palette( int16 handle, int16 palette );
void v_sound( int16 handle, int16 frequency, int16 duration );
int16 vs_mute( int16 handle, int16 action );
void vt_resolution( int16 handle, int16 xres, int16 yres,
         int16 *xset, int16 *yset );
void vt_axis( int16 handle, int16 xres, int16 yres,
         int16 *xset, int16 *yset );
void vt_origin( int16 handle, int16 xorigin, int16 yorigin );
void vq_tdimensions( int16 handle, int16 *xdim, int16 *ydim );
void vt_alignment( int16 handle, int16 dx, int16 dy );
void vsp_film( int16 handle, int16 index, int16 lightness );
int16 vqp_filmname( int16 handle, int16 index, char *name );
void vsc_expose( int16 handle, int16 status );
void v_meta_extents( int16 handle, int16 min_x, int16 min_y,
         int16 max_x, int16 max_y );
void v_write_meta( int16 handle, int16 num_intin, const int16 *a_intin,
         int16 num_ptsin, const int16 *a_ptsin );
void vm_pagesize( int16 handle, int16 pgwidth, int16 pgheight );
void vm_coords( int16 handle, int16 llx, int16 lly,
         int16 urx, int16 ury );
void vm_filename( int16 handle, const char *filename );
void v_offset( int16 handle, int16 offset );
void v_fontinit( int16 handle, const void *font_header );
void v_escape2000( int16 handle, int16 times );

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/* NVDI-Erweiterungen */
int16 vs_calibrate( int16 handle, boolean flag, const RGB1000 *table );
int16 vq_calibrate( int16 handle, boolean *flag );

int32 vqt_fg_color( int16 handle, COLOR_ENTRY *fg_color );
int32 vqf_fg_color( int16 handle, COLOR_ENTRY *fg_color );
int32 vql_fg_color( int16 handle, COLOR_ENTRY *fg_color );
int32 vqm_fg_color( int16 handle, COLOR_ENTRY *fg_color );
int32 vqr_fg_color( int16 handle, COLOR_ENTRY *fg_color );
int32 vqt_bg_color( int16 handle, COLOR_ENTRY *bg_color );
int32 vqf_bg_color( int16 handle, COLOR_ENTRY *bg_color );
int32 vql_bg_color( int16 handle, COLOR_ENTRY *bg_color );
int32 vqm_bg_color( int16 handle, COLOR_ENTRY *bg_color );
int32 vqr_bg_color( int16 handle, COLOR_ENTRY *bg_color );
void v_setrgb( int16 handle, int16 type,
            int16 r, int16 g, int16 b );
uint32 v_color2value( int16 handle, int32 color_space, COLOR_ENTRY *color );
int32 v_value2color( int16 handle, uint32 value, COLOR_ENTRY *color );
int32 v_color2nearest( int16 handle, int32 color_space, const COLOR_ENTRY *color,
         COLOR_ENTRY *nearest );
int32 vq_px_format( int16 handle, uint32 *px_format );
int16 vq_ctab( int16 handle, int32 ctab_length, COLOR_TAB *ctab );
int32 vq_ctab_entry( int16 handle, int16 index, COLOR_ENTRY *color );
int32 vq_ctab_id( int16 handle );
int16 v_ctab_idx2vdi( int16 handle, int16 index );
int16 v_ctab_vdi2idx( int16 handle, int16 index );
int32 v_ctab_idx2value( int16 handle, int16 index );
int32 v_get_ctab_id( int16 handle );
int16 vq_dflt_ctab( int16 handle, int32 ctab_length, COLOR_TAB *ctab );
COLOR_TAB *v_create_ctab( int16 handle, int32 color_space, uint32 px_format );
int16 v_delete_ctab( int16 handle, COLOR_TAB *ctab );
ITAB_REF v_create_itab( int16 handle, COLOR_TAB *ctab, int16 bits );
int16 v_delete_itab( int16 handle, ITAB_REF *itab );

/******************************************************************************/
/*                                                                            */
/* Utility-Funktionen f�r NVDI 4.x                                            */
/*                                                                            */
/******************************************************************************/

/* Format fix31 in Pixel umrechnen */
int16 fix31ToPixel( fix31 a );

/* NVDI-Cookie lesen */
NVDI_STRUC *Ash_NVDICookie( void );

/* Eine EdDI-Funktion aufrufen */
int16 Ash_CallEdDI( int16 fkt_nr );

/* NVDI-Version & NVDI-Datum ermitteln */
uint16 Ash_NVDIVersion( void );
uint32 Ash_NVDIDatum( void );

/******************************************************************************/

#ifdef __cplusplus
}
#endif

/******************************************************************************/

#endif
