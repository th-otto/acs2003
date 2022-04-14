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
   char *parm;                                           /* Parameter */
   char *serv;                                           /* Name of service routine */
   int16 type1; char *data1; long len1;
   int16 type2; char *data2; long len2;
   int16 type3; char *data3; long len3;
   char *bubble;
   char *context;
} AUSER_DEF;

typedef struct
{
   void (*abort)(void);                                     /* end specs edit mode */
   void (*set)(AUSER_DEF *user, int16 width, int16 height); /* set these values */
} UOCALLS;


typedef struct
{
   char uo_name[32];                                  /* Name of USERDEF, should be textual of uo_code */
   OBJECT *(*edit_ob)(AUSER_DEF *user, OBJECT *obj);  /* should return OBJECT-Tree for editor */
   void (*test)(AUSER_DEF *user, AUSERBLK *userblk);  /* fill userblk with test values */
   void (*ok)(void);                                  /* editor was closed with ok */
   void (*cleanup)(OBJECT *tree);                     /* free userdata if any */
   OBJECT *visual;                                    /* Visual Entry for Parts window */
   OBJECT *insert;                                    /* logical Entry for Parts window */
   AUSER_DEF *aud;                                    /* values for part window*/
   void (*minsize)(AUSERBLK *user, int16 *x, int16 *y);  /* calc min size */
   UOCALLS *interface;                                /* parts_window put jump herein */
   char *title;                                       /* Submode title */
   char *help_title;
   char *help_file;
}  UODATAS;
