/*
 * resource set indices for edimaged
 *
 * created by ORCS 2.18
 */

/*
 * Number of Strings:        28
 * Number of Bitblks:        0
 * Number of Iconblks:       0
 * Number of Color Iconblks: 0
 * Number of Color Icons:    0
 * Number of Tedinfos:       4
 * Number of Free Strings:   0
 * Number of Free Images:    0
 * Number of Objects:        58
 * Number of Trees:          3
 * Number of Userblks:       0
 * Number of Images:         0
 * Total file size:          1702
 */

#ifdef RSC_NAME
#undef RSC_NAME
#endif
#ifndef __ALCYON__
#define RSC_NAME "edimaged"
#endif
#ifdef RSC_ID
#undef RSC_ID
#endif
#ifdef edimaged
#define RSC_ID edimaged
#else
#define RSC_ID 0
#endif

#ifndef RSC_STATIC_FILE
# define RSC_STATIC_FILE 0
#endif
#if !RSC_STATIC_FILE
#define NUM_STRINGS 28
#define NUM_FRSTR 0
#define NUM_UD 0
#define NUM_IMAGES 0
#define NUM_BB 0
#define NUM_FRIMG 0
#define NUM_IB 0
#define NUM_CIB 0
#define NUM_TI 4
#define NUM_OBS 58
#define NUM_TREE 3
#endif



#define EDIT_IMAGE_DIALOG                  0 /* form/dialog */
#define EDIT_IMAGE_DRAWFRAME               1 /* BOX in tree EDIT_IMAGE_DIALOG */
#define EDIT_IMAGE_IMAGE                   3 /* BOX in tree EDIT_IMAGE_DIALOG */
#define EDIT_IMAGE_SIZEBOX                 5 /* IBOX in tree EDIT_IMAGE_DIALOG */
#define EDIT_IMAGE_COLOR_BOX               8 /* BOX in tree EDIT_IMAGE_DIALOG */
#define EDIT_IMAGE_COLOR                  10 /* BOX in tree EDIT_IMAGE_DIALOG */
#define EDIT_IMAGE_COLOR_POPUP            11 /* BOX in tree EDIT_IMAGE_DIALOG */
#define EDIT_IMAGE_NEW_PATTERN            12 /* BUTTON in tree EDIT_IMAGE_DIALOG */
#define EDIT_IMAGE_EDIT                   14 /* BUTTON in tree EDIT_IMAGE_DIALOG */
#define EDIT_IMAGE_DIRECT                 16 /* BUTTON in tree EDIT_IMAGE_DIALOG */
#define EDIT_IMAGE_OK                     18 /* BUTTON in tree EDIT_IMAGE_DIALOG */
#define EDIT_IMAGE_CANCEL                 20 /* BUTTON in tree EDIT_IMAGE_DIALOG */

#define IM_POS_DIALOG                      1 /* form/dialog */
#define IM_POS_HEIGHT                      3 /* TEXT in tree IM_POS_DIALOG */
#define IM_POS_OK                          4 /* BUTTON in tree IM_POS_DIALOG */
#define IM_POS_CANCEL                      6 /* BUTTON in tree IM_POS_DIALOG */
#define IM_POS_WIDTH                       9 /* TEXT in tree IM_POS_DIALOG */

#define EDIT_IMAGE2_DIALOG                 2 /* form/dialog */
#define EDIT_IMAGE2_BRUSH_BOX              1 /* BUTTON in tree EDIT_IMAGE2_DIALOG */
#define EDIT_IMAGE2_BRUSH                  2 /* IBOX in tree EDIT_IMAGE2_DIALOG */
#define EDIT_IMAGE2_BLACK                  4 /* IBOX in tree EDIT_IMAGE2_DIALOG */
#define EDIT_IMAGE2_WHITE                  6 /* IBOX in tree EDIT_IMAGE2_DIALOG */
#define EDIT_IMAGE2_THIN                   9 /* TEXT in tree EDIT_IMAGE2_DIALOG */
#define EDIT_IMAGE2_THICK                 11 /* TEXT in tree EDIT_IMAGE2_DIALOG */
#define EDIT_IMAGE2_LEFT                  14 /* BOXCHAR in tree EDIT_IMAGE2_DIALOG */
#define EDIT_IMAGE2_UP                    16 /* BOXCHAR in tree EDIT_IMAGE2_DIALOG */
#define EDIT_IMAGE2_DOWN                  18 /* BOXCHAR in tree EDIT_IMAGE2_DIALOG */
#define EDIT_IMAGE2_RIGHT                 20 /* BOXCHAR in tree EDIT_IMAGE2_DIALOG */
#define EDIT_IMAGE2_STRUCT                22 /* BUTTON in tree EDIT_IMAGE2_DIALOG */
#define EDIT_IMAGE2_DRAWFRAME             24 /* BUTTON in tree EDIT_IMAGE2_DIALOG */
#define EDIT_IMAGE2_BITMAP                25 /* IBOX in tree EDIT_IMAGE2_DIALOG */




#ifdef __STDC__
#ifndef _WORD
#  ifdef WORD
#    define _WORD WORD
#  else
#    define _WORD short
#  endif
#endif
extern _WORD edimaged_rsc_load(_WORD wchar, _WORD hchar);
extern _WORD edimaged_rsc_gaddr(_WORD type, _WORD idx, void *gaddr);
extern _WORD edimaged_rsc_free(void);
#endif
