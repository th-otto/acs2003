/******************************************************************************/
/*                                                                            */
/*    Eine handoptimierte Bibliothek fÅr Pure-C, Pure-Pascal und GNU-C        */
/*                                                                            */
/* Die AES-Funktionen - FORM-Bibliothek                                       */
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
/* AES 50:  form_do                                                           */
/*                                                                            */
/******************************************************************************/

int16 mt_form_do( OBJECT *tree, int16 start, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {50, 1, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = start;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 51:  form_dial                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_form_dial( int16 flag, int16 xlittle, int16 ylittle,
            int16 wlittle, int16 hlittle, int16 xbig, int16 ybig,
            int16 wbig, int16 hbig, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {51, 9, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = flag;
   data.intin[1] = xlittle;
   data.intin[2] = ylittle;
   data.intin[3] = wlittle;
   data.intin[4] = hlittle;
   data.intin[5] = xbig;
   data.intin[6] = ybig;
   data.intin[7] = wbig;
   data.intin[8] = hbig;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 52:  form_alert                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_form_alert( int16 defbutton, const char *string, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {52, 1, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = defbutton;

   data.addrin[0] = string;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 53:  form_error                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_form_error( int16 errnum, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {53, 1, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = (errnum<0 ? (~errnum)-30 : errnum);

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 54:  form_center                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_form_center( OBJECT *tree, int16 *x, int16 *y, int16 *w, int16 *h,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {54, 0, 5, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Werte zurÅckgeben */
   if( x!=NULL )
      *x = data.intout[1];
   if( y!=NULL )
      *y = data.intout[2];
   if( w!=NULL )
      *w = data.intout[3];
   if( h!=NULL )
      *h = data.intout[4];

   return data.intout[0];
}

/******************************************************************************/

#if 0
int16 mt_form_center_grect( OBJECT *tree, GRECT *r, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {54, 0, 5, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Werte zurÅckgeben */
   if( r!=NULL )
      MEMCPY_4(r, data.intout + 1);

   return data.intout[0];
}
#endif

/******************************************************************************/
/*                                                                            */
/* AES 55:  form_keybd                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_form_keybd( OBJECT *tree, int16 obj, int16 next,
            int16 input_char, int16 *next_obj, int16 *pchar, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {55, 3, 3, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = obj;
   data.intin[1] = input_char;
   data.intin[2] = next;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Werte zurÅckgeben */
   if( next_obj!=NULL )
      *next_obj = data.intout[1];
   if( pchar!=NULL )
      *next_obj = data.intout[2];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 64:  form_wkeybd                                                       */
/*                                                                            */
/******************************************************************************/

/* Weiû der Henker, was das ist, steht in der CAT_Bibliothek so drin... */

/******************************************************************************/
/*                                                                            */
/* AES 56:  form_button                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_form_button( OBJECT *tree, int16 obj, int16 clicks, int16 *next_obj,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {56, 2, 2, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = obj;
   data.intin[1] = clicks;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Werte zurÅckgeben */
   if( next_obj!=NULL )
      *next_obj = data.intout[1];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 135: form_popup                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_form_popup( OBJECT *tree, int16 x, int16 y, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {135, 2, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = x;
   data.intin[1] = y;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 63:  form_wbutton                                                      */
/*                                                                            */
/******************************************************************************/

int16 mt_form_wbutton( OBJECT *fo_btree, int16 fo_bobject,
               int16 fo_bclicks, int16 *fo_bnxtobj, int16 whandle,
               GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {63, 3, 2, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = fo_bobject;
   data.intin[1] = fo_bclicks;
   data.intin[2] = whandle;

   data.addrin[0] = fo_btree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Den RÅckgabewert liefern */
   if( fo_bnxtobj!=NULL )
      *fo_bnxtobj = data.intout[1];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 51:  form_xdial                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_form_xdial( int16 fo_diflag, int16 fo_dilittlx, int16 fo_dilittly,
            int16 fo_dilittlw, int16 fo_dilittlh, int16 fo_dibigx,
            int16 fo_dibigy, int16 fo_dibigw, int16 fo_dibigh,
            void **flydial, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {51, 9, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = fo_diflag;
   data.intin[1] = fo_dilittlx;
   data.intin[2] = fo_dilittly;
   data.intin[3] = fo_dilittlw;
   data.intin[4] = fo_dilittlh;
   data.intin[5] = fo_dibigx;
   data.intin[6] = fo_dibigy;
   data.intin[7] = fo_dibigw;
   data.intin[8] = fo_dibigh;

   data.addrin[0] = flydial;
#if 0
   data.addrin[1] = 0;           /* Reserved */
#endif

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/

#if 0
int16 mt_form_xdial_grect( int16 fo_diflag,
            const GRECT *fo_dilittl, const GRECT *fo_dibig,
            void **flydial, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {51, 9, 1, 2, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = fo_diflag;

   if ( fo_dilittl!=NULL )
      MEMCPY_4(data.intin + 1, fo_dilittl);
   if ( fo_dibig!=NULL )
      MEMCPY_4(data.intin + 5, fo_dibig);

   data.addrin[0] = flydial;
   data.addrin[1] = 0;           /* Reserved */

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}
#endif

/******************************************************************************/
/*                                                                            */
/* AES 50:  form_xdo                                                          */
/*                                                                            */
/******************************************************************************/

int16 mt_form_xdo( OBJECT *tree, int16 startob, int16 *lastcrsr,
            const XDO_INF *tabs, void *flydial, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {50, 1, 2, 3, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = startob;

   data.addrin[0] = tree;
   data.addrin[1] = tabs;
   data.addrin[2] = flydial;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Den RÅckgabewert liefern */
   if( lastcrsr!=NULL )
      *lastcrsr = data.intout[1];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 136: form_xerr                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_form_xerr( int32 errcode, const char *errfile, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {136, 2, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   *(int32 *)&data.intin[0] = errcode;

   data.addrin[0] = errfile;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}
