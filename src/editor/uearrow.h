/*
 * resource set indices for uearrow
 *
 * created by ORCS 2.18
 */

/*
 * Number of Strings:        18
 * Number of Bitblks:        0
 * Number of Iconblks:       0
 * Number of Color Iconblks: 0
 * Number of Color Icons:    0
 * Number of Tedinfos:       2
 * Number of Free Strings:   0
 * Number of Free Images:    0
 * Number of Objects:        45
 * Number of Trees:          1
 * Number of Userblks:       0
 * Number of Images:         0
 * Total file size:          1284
 */

#ifdef RSC_NAME
#undef RSC_NAME
#endif
#ifndef __ALCYON__
#define RSC_NAME "uearrow"
#endif
#ifdef RSC_ID
#undef RSC_ID
#endif
#ifdef uearrow
#define RSC_ID uearrow
#else
#define RSC_ID 0
#endif

#ifndef RSC_STATIC_FILE
# define RSC_STATIC_FILE 0
#endif
#if !RSC_STATIC_FILE
#define NUM_STRINGS 18
#define NUM_FRSTR 0
#define NUM_UD 0
#define NUM_IMAGES 0
#define NUM_BB 0
#define NUM_FRIMG 0
#define NUM_IB 0
#define NUM_CIB 0
#define NUM_TI 2
#define NUM_OBS 45
#define NUM_TREE 1
#endif



#define ED_ARROW_DIALOG                    0 /* form/dialog */
#define ED_ARROW_SAMPLE_BOX                1 /* BOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_SAMPLE                    2 /* BOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_OK                        3 /* BUTTON in tree ED_ARROW_DIALOG */
#define ED_ARROW_CANCEL                    5 /* BUTTON in tree ED_ARROW_DIALOG */
#define ED_ARROW_DIR_BOX                   9 /* BOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_DIR_START                11 /* IBOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_DIR_END                  12 /* IBOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_COLOR_BOX                15 /* BOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_COLOR                    17 /* IBOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_COLOR_POPUP              18 /* IBOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_LEN_BOX                  21 /* BOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_LEN_START                23 /* IBOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_LEN_END                  24 /* IBOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_STYLE_BOX                27 /* BOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_STYLE                    29 /* IBOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_END_BOX                  32 /* BOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_END_START                34 /* IBOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_END_END                  35 /* IBOX in tree ED_ARROW_DIALOG */
#define ED_ARROW_FAT                      36 /* BUTTON in tree ED_ARROW_DIALOG */
#define ED_ARROW_3D                       38 /* BUTTON in tree ED_ARROW_DIALOG */
#define ED_ARROW_BUBBLE                   43 /* FBOXTEXT in tree ED_ARROW_DIALOG */
#define ED_ARROW_CONTEXT                  44 /* FBOXTEXT in tree ED_ARROW_DIALOG */




#ifdef __STDC__
#ifndef _WORD
#  ifdef WORD
#    define _WORD WORD
#  else
#    define _WORD short
#  endif
#endif
extern _WORD uearrow_rsc_load(_WORD wchar, _WORD hchar);
extern _WORD uearrow_rsc_gaddr(_WORD type, _WORD idx, void *gaddr);
extern _WORD uearrow_rsc_free(void);
#endif
