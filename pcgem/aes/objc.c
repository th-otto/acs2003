/******************************************************************************/
/*                                                                            */
/*    Eine handoptimierte Bibliothek fÅr Pure-C, Pure-Pascal und GNU-C        */
/*                                                                            */
/* Die AES-Funktionen - OBJC-Bibliothek                                       */
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
/* AES 40:  objc_add                                                          */
/*                                                                            */
/******************************************************************************/

int16 mt_objc_add( OBJECT *tree, int16 parent, int16 child, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {40, 2, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = parent;
   data.intin[1] = child;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 41:  objc_delete                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_objc_delete( OBJECT *tree, int16 objnr, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {41, 1, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = objnr;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 42:  objc_draw                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_objc_draw( OBJECT *tree, int16 start, int16 depth, int16 xclip,
            int16 yclip, int16 wclip, int16 hclip, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {42, 6, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = start;
   data.intin[1] = depth;
   data.intin[2] = xclip;
   data.intin[3] = yclip;
   data.intin[4] = wclip;
   data.intin[5] = hclip;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/

#if 0
int16 mt_objc_draw_grect( OBJECT *tree, int16 start, int16 depth,
            const GRECT *r, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {42, 6, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = start;
   data.intin[1] = depth;
   if ( r!=NULL )
      MEMCPY_4(data.intin[1], r);
   else
      return 0;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}
#endif

/******************************************************************************/
/*                                                                            */
/* AES 42:  objc_wdraw                                                        */
/*                                                                            */
/******************************************************************************/

void mt_objc_wdraw( OBJECT *tree, int16 start, int16 depth, GRECT *clip,
            int16 whandle, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {60, 3, 0, 2, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = start;
   data.intin[1] = depth;
   data.intin[2] = whandle;

   data.addrin[0] = tree;
   data.addrin[1] = clip;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);
}

/******************************************************************************/
/*                                                                            */
/* AES 43:  objc_find                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_objc_find( OBJECT *tree, int16 start, int16 depth, int16 mx,
            int16 my, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {43, 4, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = start;
   data.intin[1] = depth;
   data.intin[2] = mx;
   data.intin[3] = my;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 44:  objc_offset                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_objc_offset( OBJECT *tree, int16 objnr, int16 *x, int16 *y,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {44, 1, 3, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = objnr;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Die Werte zurÅckgeben */
   if( x!=NULL )
      *x = data.intout[1];
   if( y!=NULL )
      *y = data.intout[2];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 45:  objc_order                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_objc_order( OBJECT *tree, int16 objnr, int16 new_nr, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {45, 2, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = objnr;
   data.intin[1] = new_nr;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 46:  objc_edit                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_objc_edit( OBJECT *tree, int16 objnr, int16 inchar, int16 *idx,
            int16 kind, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {46, 4, 2, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* SicherheitsprÅfung */
   if( idx==NULL )
      return 0;

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = objnr;
   data.intin[1] = inchar;
   data.intin[2] = *idx;
   data.intin[3] = kind;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Wert zurÅckgeben */
   *idx = data.intout[1];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 46:  objc_xedit                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_objc_xedit( OBJECT *tree, int16 objnr, int16 inchar, int16 *idx,
            int16 kind, GRECT *r, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {46, 4, 2, 2, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* SicherheitsprÅfung */
   if( idx==NULL )
      return 0;

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = objnr;
   data.intin[1] = inchar;
   data.intin[2] = *idx;
   data.intin[3] = kind;

   data.addrin[0] = tree;
   data.addrin[1] = r;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Wert zurÅckgeben */
   *idx = data.intout[1];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 65:  objc_wedit                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_objc_wedit( OBJECT *tree, int16 objnr, int16 inchar, int16 *idx,
            int16 kind, int16 whandle, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {65, 5, 2, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* SicherheitsprÅfung */
   if( idx==NULL )
      return 0;

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = objnr;
   data.intin[1] = inchar;
   data.intin[2] = *idx;
   data.intin[3] = kind;
   data.intin[4] = whandle;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Wert zurÅckgeben */
   *idx = data.intout[1];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 47:  objc_change                                                       */
/*                                                                            */
/******************************************************************************/

/* Parameter 'reserved' wird nicht benutzt */
#pragma warn -par

int16 mt_objc_change( OBJECT *tree, int16 objnr, int16 reserved,
            int16 xclip, int16 yclip, int16 wclip, int16 hclip,
            int16 newstate, int16 redraw, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {47, 8, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = objnr;
   data.intin[1] = 0;
   data.intin[2] = xclip;
   data.intin[3] = yclip;
   data.intin[4] = wclip;
   data.intin[5] = hclip;
   data.intin[6] = newstate;
   data.intin[7] = redraw;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

#pragma warn .par

/******************************************************************************/
/*                                                                            */
/* AES 47:  objc_wchange                                                      */
/*                                                                            */
/******************************************************************************/

void mt_objc_wchange( OBJECT *tree, int16 objnr, int16 newstate,
            GRECT *clip, int16 whandle, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {61, 3, 0, 2, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = objnr;
   data.intin[1] = newstate;
   data.intin[2] = whandle;

   data.addrin[0] = tree;
   data.addrin[1] = clip;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);
}

/******************************************************************************/
/*                                                                            */
/* AES 48:  objc_sysvar                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_objc_sysvar( int16 mode, int16 which, int16 in1, int16 in2,
            int16 *out1, int16 *out2, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {48, 4, 3, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = mode;
   data.intin[1] = which;
   data.intin[2] = in1;
   data.intin[3] = in2;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Werte zurÅckgeben */
   if( out1!=NULL )
      *out1 = data.intout[1];
   if( out2!=NULL )
      *out2 = data.intout[2];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 49:  objc_xfind                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_objc_xfind( OBJECT *obj, int16 start, int16 depth,
            int16 x, int16 y, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {49, 4, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = start;
   data.intin[1] = depth;
   data.intin[2] = x;
   data.intin[3] = y;

   data.addrin[0] = obj;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Werte zurÅckgeben */
   return data.intout[0];
}
