/*
 * resource set indices for ediconed
 *
 * created by ORCS 2.18
 */

/*
 * Number of Strings:        75
 * Number of Bitblks:        1
 * Number of Iconblks:       1
 * Number of Color Iconblks: 0
 * Number of Color Icons:    0
 * Number of Tedinfos:       15
 * Number of Free Strings:   0
 * Number of Free Images:    0
 * Number of Objects:        106
 * Number of Trees:          3
 * Number of Userblks:       7
 * Number of Images:         3
 * Total file size:          3852
 */

#ifdef RSC_NAME
#undef RSC_NAME
#endif
#ifndef __ALCYON__
#define RSC_NAME "ediconed"
#endif
#ifdef RSC_ID
#undef RSC_ID
#endif
#ifdef ediconed
#define RSC_ID ediconed
#else
#define RSC_ID 0
#endif

#ifndef RSC_STATIC_FILE
# define RSC_STATIC_FILE 0
#endif
#if !RSC_STATIC_FILE
#define NUM_STRINGS 75
#define NUM_FRSTR 0
#define NUM_UD 7
#define NUM_IMAGES 3
#define NUM_BB 1
#define NUM_FRIMG 0
#define NUM_IB 1
#define NUM_CIB 0
#define NUM_TI 15
#define NUM_OBS 106
#define NUM_TREE 3
#endif



#define EDIT_ICON_DIALOG                   0 /* form/dialog */
#define EDIT_ICON_FRONT_BOX                4 /* BOX in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_FRONT_COLOR              6 /* BOX in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_FRONT_POPUP              7 /* BOX in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_BACK_BOX                10 /* BOX in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_BACK_COLOR              12 /* BOX in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_BACK_POPUP              13 /* BOX in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_DRAWFRAME               14 /* BOXTEXT in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_ICON                    16 /* ICON in tree EDIT_ICON_DIALOG */
#define EDIC_CONTROL                      17 /* USERDEF in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_SIZEBOX                 18 /* USERDEF in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_CORNER                  19 /* IBOX in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_TEXT                    26 /* FBOXTEXT in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_CHAR                    27 /* FBOXTEXT in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_NEWPLANE                29 /* BUTTON in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_SELECT                  31 /* BUTTON in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_DELPLANE                33 /* BUTTON in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_NEXTPATTERN             35 /* BUTTON in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_EDIT                    37 /* BUTTON in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_DIRECT                  39 /* BUTTON in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_OK                      41 /* BUTTON in tree EDIT_ICON_DIALOG */
#define EDIT_ICON_CANCEL                  43 /* BUTTON in tree EDIT_ICON_DIALOG */

#define EDIT_ICON2_DIALOG                  1 /* form/dialog */
#define EDIT_ICON2_BRUSH_BOX               1 /* USERDEF in tree EDIT_ICON2_DIALOG */
#define EDIT_ICON2_BRUSH                   2 /* USERDEF in tree EDIT_ICON2_DIALOG */
#define EDIT_ICON2_BRUSH_WHITE             4 /* BOX in tree EDIT_ICON2_DIALOG */
#define EDIT_ICON2_BRUSH_BLACK             6 /* BOX in tree EDIT_ICON2_DIALOG */
#define EDIT_ICON2_BRUSH_INVIS             8 /* BOX in tree EDIT_ICON2_DIALOG */
#define EDIT_ICON2_BRUSH_THIN             11 /* TEXT in tree EDIT_ICON2_DIALOG */
#define EDIT_ICON2_BRUSH_FAT              13 /* TEXT in tree EDIT_ICON2_DIALOG */
#define EDIT_ICON2_SHIFT_LEFT             16 /* BOXCHAR in tree EDIT_ICON2_DIALOG */
#define EDIT_ICON2_SHIFT_UP               18 /* BOXCHAR in tree EDIT_ICON2_DIALOG */
#define EDIT_ICON2_SHIFT_DOWN             20 /* BOXCHAR in tree EDIT_ICON2_DIALOG */
#define EDIT_ICON2_SHIFT_RIGHT            22 /* BOXCHAR in tree EDIT_ICON2_DIALOG */
#define EDIT_ICON2_STRUCTURE              24 /* BUTTON in tree EDIT_ICON2_DIALOG */
#define EDIT_ICON2_DRAWFRAME              26 /* BOX in tree EDIT_ICON2_DIALOG */
#define EDIT_ICON2_IMAGE                  27 /* IMAGE in tree EDIT_ICON2_DIALOG */

#define IC_POS_DIALOG                      2 /* form/dialog */
#define IC_POS_XCHAR                      12 /* FTEXT in tree IC_POS_DIALOG */
#define IC_POS_YCHAR                      14 /* FTEXT in tree IC_POS_DIALOG */
#define IC_POS_XICON                      17 /* FTEXT in tree IC_POS_DIALOG */
#define IC_POS_YICON                      18 /* FTEXT in tree IC_POS_DIALOG */
#define IC_POS_WICON                      19 /* FTEXT in tree IC_POS_DIALOG */
#define IC_POS_HICON                      20 /* FTEXT in tree IC_POS_DIALOG */
#define IC_POS_XTEXT                      21 /* FTEXT in tree IC_POS_DIALOG */
#define IC_POS_YTEXT                      22 /* FTEXT in tree IC_POS_DIALOG */
#define IC_POS_WTEXT                      23 /* FTEXT in tree IC_POS_DIALOG */
#define IC_POS_HTEXT                      24 /* FTEXT in tree IC_POS_DIALOG */
#define IC_POS_DESKICON                   26 /* BUTTON in tree IC_POS_DIALOG */
#define IC_POS_OK                         29 /* BUTTON in tree IC_POS_DIALOG */
#define IC_POS_CANCEL                     31 /* BUTTON in tree IC_POS_DIALOG */




#ifdef __STDC__
#ifndef _WORD
#  ifdef WORD
#    define _WORD WORD
#  else
#    define _WORD short
#  endif
#endif
extern _WORD ediconed_rsc_load(_WORD wchar, _WORD hchar);
extern _WORD ediconed_rsc_gaddr(_WORD type, _WORD idx, void *gaddr);
extern _WORD ediconed_rsc_free(void);
#endif
