/******************************************************************************/
/*                                                                            */
/*    Eine handoptimierte Bibliothek fÅr Pure-C, Pure-Pascal und GNU-C        */
/*                                                                            */
/* Die AES-Funktionen - MENU-Bibliothek                                       */
/*                                                                            */
/* (c) 1998-2003 by Martin ElsÑsser @ LL                                      */
/* (c) 2008 Gerhard Stoll @ B                                                 */
/*                                                                            */
/*                                                 Tabsize: 1 Tab = 3 Spaces  */
/******************************************************************************/

/******************************************************************************/
/*                                                                            */
/* Lokale Konstanten                                                          */
/*                                                                            */
/******************************************************************************/

/* Die Anzahl der Words des contrl-Arrays muû von diesem Modul konfiguriert   */
/* werden. Ferner wird das Makro CTRLCOPY auf das passende Makro MEMCPY_n     */
/* umgesetzt. Mit diesen beiden Parametern wird die gesamte BefÅllung des     */
/* control-Arrays fÅr dieses Modul definiert!                                 */
/* Achtung: die Definitionen mÅssen vor dem Lesen von PCGEM_I.H stehen!       */
#define CTRL_WORDS   5
#define CTRLCOPY     MEMCPY_5

/******************************************************************************/
/*                                                                            */
/* Benîtigte Header-Dateien                                                   */
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
   int16 intin[17];
   int16 intout[7];
   void *addrin[2];
   void *addrout[1];
} AESData;

/******************************************************************************/
/*                                                                            */
/* AES 30:  menu_bar                                                          */
/*                                                                            */
/******************************************************************************/

int16 mt_menu_bar( OBJECT *tree, int16 show, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {30, 1, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = show;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 31:  menu_icheck                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_menu_icheck( OBJECT *tree, int16 item, int16 check, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {31, 2, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = item;
   data.intin[1] = check;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 32:  menu_ienable                                                      */
/*                                                                            */
/******************************************************************************/

int16 mt_menu_ienable( OBJECT *tree, int16 item, int16 enable,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {32, 2, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = item;
   data.intin[1] = enable;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 33:  menu_tnormal                                                      */
/*                                                                            */
/******************************************************************************/

int16 mt_menu_tnormal( OBJECT *tree, int16 title, int16 normal,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {33, 2, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = title;
   data.intin[1] = (normal ? 1 : 0);

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 34:  menu_text                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_menu_text( OBJECT *tree, int16 item, char *text, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {34, 1, 1, 2, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = item;

   data.addrin[0] = tree;
   data.addrin[1] = text;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 35:  menu_register                                                     */
/*                                                                            */
/******************************************************************************/

int16 mt_menu_register( int16 apid, char *string, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {35, 1, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = apid;

   data.addrin[0] = string;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 36:  menu_unregister                                                   */
/*                                                                            */
/******************************************************************************/

int16 mt_menu_unregister( int16 apid, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {36, 1, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = apid;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 37:  menu_click                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_menu_click( int16 click, int16 setit,GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {37, 2, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = click;
   data.intin[1] = setit;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 37:  menu_attach                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_menu_attach( int16 flag, OBJECT *tree, int16 item, MENU *mdata,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {37, 2, 1, 2, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = flag;
   data.intin[1] = item;

   data.addrin[0] = tree;
   data.addrin[1] = mdata;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 38:  menu_istart                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_menu_istart( int16 flag, OBJECT *tree, int16 imenu, int16 item,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {38, 3, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = flag;
   data.intin[1] = imenu;
   data.intin[2] = item;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 36:  menu_popup                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_menu_popup( MENU *menu, int16 xpos, int16 ypos, MENU *mdata,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {36, 2, 1, 2, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = xpos;
   data.intin[1] = ypos;

   data.addrin[0] = menu;
   data.addrin[1] = mdata;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 39:  menu_settings                                                     */
/*                                                                            */
/******************************************************************************/

int16 mt_menu_settings( int16 flag, MN_SET *set, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {39, 1, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = flag;

   data.addrin[0] = set;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}
