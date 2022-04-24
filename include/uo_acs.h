/*
 *          UO_ACS.H          (c) 1991, 1992 Stefan Bachert    
 *          Revision:            1.7.1996
 *          Types for reloadable Userdefs for ACS-Editors
 *
 */

#define AS_ACSPARTSWINDOW     9000     /* return part window, Awindow ** */
#define  AS_ACSADDPART           9001     /* add part, UODATAS * */

#define  NONE_PAR          0                 /* no Paramete    0, NULL */
#define  REF_PAR           1                 /* Reference      0, char * (NUL term) */
#define  STR_PAR           2                 /* String         0, char * (NUL term) */
#define  DATA_PAR          3                 /* Datas Length,  char * */

typedef struct
{
   /*   0 */ char *parm;                                           /* Parameter */
   /*   4 */ char *serv;                                           /* Name of service routine */
   /*   8 */ int16 type1;
   /*  10 */ char *data1;
   /*  14 */ long len1;
   /*  18 */ int16 type2;
   /*  20 */ char *data2;
   /*  24 */ long len2;
   /*  28 */ int16 type3;
   /*  30 */ char *data3;
   /*  34 */ long len3;
   /*  38 */ char *bubble;
   /*  42 */ char *context;
   /*  46 */ 
} AUSER_DEF;

typedef struct
{
   /*   0 */ void (*abort)(void);                                     /* end specs edit mode */
   /*   4 */ void (*set)(AUSER_DEF *user, int16 width, int16 height); /* set these values */
} UOCALLS;


typedef struct
{
   /*   0 */ char uo_name[32];                                  /* Name of USERDEF, should be textual of uo_code */
   /*  32 */ OBJECT *(*edit_ob)(AUSER_DEF *user, OBJECT *obj);  /* should return OBJECT-Tree for editor */
   /*  36 */ void (*test)(AUSER_DEF *user, AUSERBLK *userblk);  /* fill userblk with test values */
   /*  40 */ void (*ok)(void);                                  /* editor was closed with ok */
   /*  44 */ void (*cleanup)(OBJECT *tree);                     /* free userdata if any */
   /*  48 */ OBJECT *visual;                                    /* Visual Entry for Parts window */
   /*  52 */ OBJECT *insert;                                    /* logical Entry for Parts window */
   /*  56 */ AUSER_DEF *aud;                                    /* values for part window*/
   /*  60 */ void (*minsize)(AUSERBLK *user, int16 *x, int16 *y);  /* calc min size */
   /*  64 */ UOCALLS *interface;                                /* parts_window put jump herein */
   /*  68 */ char *title;                                       /* Submode title */
   /*  72 */ char *help_title;
   /*  76 */ char *help_file;
   /*  80 */ 
}  UODATAS;
