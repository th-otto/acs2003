/******************************************************************************/
/*                                                                            */
/*    Eine handoptimierte Bibliothek f�r Pure-C, Pure-Pascal und GNU-C        */
/*                                                                            */
/* Die AES-Funktionen - WDLG-Bibliothek                                       */
/*                                                                            */
/* (c) 1998-2003 by Martin Els�sser @ LL                                      */
/* (c) 2008 Gerhard Stoll @ B                                                 */
/*                                                                            */
/*                                                 Tabsize: 1 Tab = 3 Spaces  */
/******************************************************************************/

/******************************************************************************/
/*                                                                            */
/* Lokale Konstanten                                                          */
/*                                                                            */
/******************************************************************************/

/* Die Anzahl der Words des contrl-Arrays mu� von diesem Modul konfiguriert   */
/* werden. Ferner wird das Makro CTRLCOPY auf das passende Makro MEMCPY_n     */
/* umgesetzt. Mit diesen beiden Parametern wird die gesamte Bef�llung des     */
/* control-Arrays f�r dieses Modul definiert!                                 */
/* Achtung: die Definitionen m�ssen vor dem Lesen von PCGEM_I.H stehen!       */
#define CTRL_WORDS   5
#define CTRLCOPY     MEMCPY_5

/******************************************************************************/
/*                                                                            */
/* Ben�tigte Header-Dateien                                                   */
/*                                                                            */
/******************************************************************************/

#include "pcgem_i.h"

/******************************************************************************/
/*                                                                            */
/* Lokale Datentypen                                                          */
/*                                                                            */
/******************************************************************************/

typedef struct
{
   int16 contrl[CTRL_WORDS];
   GlobalArray *globl;
   int16 intin[16];
   int16 intout[7];
   void *addrin[5];
   void *addrout[1];
} AESData;

/******************************************************************************/
/*                                                                            */
/* AES 160: wdlg_create                                                       */
/*                                                                            */
/******************************************************************************/

DIALOG *mt_wdlg_create( HNDL_OBJ handle_exit, OBJECT *tree, void *user_data,
            const int16 code, void *data, const int16 flags, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {160, 2, 0, 4, 1};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.intin[0] = code;
   aesparam.intin[1] = flags;

   aesparam.addrin[0]   = handle_exit;
   aesparam.addrin[1]   = tree;
   aesparam.addrin[2]   = user_data;
   aesparam.addrin[3]   = data;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   return aesparam.addrout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 161: wdlg_open                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_wdlg_open( DIALOG *dialog, char *title, const int16 kind, const int16 x,
            const int16 y, const int16 code, void *data, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {161, 4, 1, 3, 0};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.intin[0] = kind;
   aesparam.intin[1] = x;
   aesparam.intin[2] = y;
   aesparam.intin[3] = code;

   aesparam.addrin[0]   = dialog;
   aesparam.addrin[1]   = title;
   aesparam.addrin[2]   = data;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   return aesparam.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 162: wdlg_close                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_wdlg_close( DIALOG *dialog, int16 *x, int16 *y, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {162, 0, 3, 1, 0};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.addrin[0]   = dialog;

   /* Wegen �lteren WDialog-Implementierungen */
   aesparam.intout[1]   = -1;
   aesparam.intout[2]   = -1;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   /* Die R�ckgabewerte f�llen */
   if( x!=NULL )
      *x = aesparam.intout[1];
   if( y!=NULL )
      *y = aesparam.intout[2];

   return aesparam.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 163: wdlg_delete                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_wdlg_delete( DIALOG *dialog, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {163, 0, 1, 1, 0};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.addrin[0]   = dialog;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   return aesparam.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 164, 0: wdlg_get_tree                                                  */
/*                                                                            */
/******************************************************************************/

int16 mt_wdlg_get_tree( DIALOG *dialog, OBJECT **tree, GRECT *rect, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {164, 1, 1, 3, 0};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.intin[0] = 0;  /* Unternummer f�r wdlg_get_tree */

   aesparam.addrin[0]   = dialog;
   aesparam.addrin[1]   = tree;
   aesparam.addrin[2]   = rect;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   return aesparam.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 164, 1: wdlg_get_edit                                                  */
/*                                                                            */
/******************************************************************************/

int16 mt_wdlg_get_edit( DIALOG *dialog, int16 *cursor, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {164, 1, 2, 1, 0};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.intin[0] = 1;  /* Unternummer f�r wdlg_get_edit */

   aesparam.addrin[0]   = dialog;

   /* Sicherheitshalber intout initialisieren */
   aesparam.intout[1] = -1;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   /* Den R�ckgabewert liefern */
   if( cursor!=NULL )
      *cursor = aesparam.intout[1];

   return aesparam.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 164, 2: wdlg_get_udata                                                 */
/*                                                                            */
/******************************************************************************/

void *mt_wdlg_get_udata( DIALOG *dialog, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {164, 1, 0, 1, 1};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.intin[0] = 2;  /* Unternummer f�r wdlg_get_udata */

   aesparam.addrin[0]   = dialog;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   return aesparam.addrout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 164, 3: wdlg_get_handle                                                */
/*                                                                            */
/******************************************************************************/

int16 mt_wdlg_get_handle( DIALOG *dialog, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {164, 1, 1, 1, 0};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.intin[0] = 3;  /* Unternummer f�r wdlg_get_handle */

   aesparam.addrin[0]   = dialog;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   return aesparam.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 165, 0: wdlg_set_edit                                                  */
/*                                                                            */
/******************************************************************************/

int16 mt_wdlg_set_edit( DIALOG *dialog, const int16 obj, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {165, 2, 1, 1, 0};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.intin[0] = 0;  /* Unternummer f�r wdlg_set_edit */
   aesparam.intin[1] = obj;

   aesparam.addrin[0]   = dialog;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   return aesparam.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 165, 1: wdlg_set_tree                                                  */
/*                                                                            */
/******************************************************************************/

int16 mt_wdlg_set_tree( DIALOG *dialog, OBJECT *new_tree, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {165, 1, 1, 2, 0};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.intin[0] = 1;  /* Unternummer f�r wdlg_set_tree */

   aesparam.addrin[0]   = dialog;
   aesparam.addrin[1]   = new_tree;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   return aesparam.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 165, 2: wdlg_set_size                                                  */
/*                                                                            */
/******************************************************************************/

int16 mt_wdlg_set_size( DIALOG *dialog, GRECT *new_size, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {165, 1, 1, 2, 0};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.intin[0] = 2;  /* Unternummer f�r wdlg_set_size */

   aesparam.addrin[0]   = dialog;
   aesparam.addrin[1]   = new_size;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   return aesparam.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 165, 3: wdlg_set_iconify                                               */
/*                                                                            */
/******************************************************************************/

int16 mt_wdlg_set_iconify( DIALOG *dialog, GRECT *g, char *title, OBJECT *tree,
            const int16 obj, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {165, 2, 1, 4, 0};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.intin[0]  = 3; /* Unternummer f�r wdlg_set_iconify */
   aesparam.intin[1] = obj;

   aesparam.addrin[0]   = dialog;
   aesparam.addrin[1]   = g;
   aesparam.addrin[2]   = title;
   aesparam.addrin[3]   = tree;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   return aesparam.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 165, 4: wdlg_set_uniconify                                             */
/*                                                                            */
/******************************************************************************/

int16 mt_wdlg_set_uniconify( DIALOG *dialog, GRECT *g, char *title, OBJECT *tree,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {165, 1, 1, 4, 0};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.intin[0] = 4;  /* Unternummer f�r wdlg_set_uniconify */

   aesparam.addrin[0] = dialog;
   aesparam.addrin[1] = g;
   aesparam.addrin[2] = title;
   aesparam.addrin[3] = tree;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   return aesparam.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 166: wdlg_evnt                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_wdlg_evnt( DIALOG *dialog, EVNT *events, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {166, 0, 1, 2, 0};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.addrin[0] = dialog;
   aesparam.addrin[1] = events;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);

   return aesparam.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 167: wdlg_redraw                                                       */
/*                                                                            */
/******************************************************************************/

void mt_wdlg_redraw( DIALOG *dialog, GRECT *rect, const int16 obj, const int16 depth,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {167, 2, 0, 2, 0};
   AESData aesparam;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(aesparam.contrl, contrl);

   /* Das globl-Array eintragen */
   aesparam.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   aesparam.intin[0] = obj;
   aesparam.intin[1] = depth;

   aesparam.addrin[0] = dialog;
   aesparam.addrin[1] = rect;

   /* Ab in die AES... */
   aes(aesparam.contrl, aesparam.globl, aesparam.intin, aesparam.intout,
      aesparam.addrin, aesparam.addrout);
}
