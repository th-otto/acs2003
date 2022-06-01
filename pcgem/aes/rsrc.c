/******************************************************************************/
/*                                                                            */
/*    Eine handoptimierte Bibliothek fÅr Pure-C, Pure-Pascal und GNU-C        */
/*                                                                            */
/* Die AES-Funktionen - RSRC-Bibliothek                                       */
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
   void *addrin[3];
   void *addrout[1];
} AESData;

/******************************************************************************/
/*                                                                            */
/* AES 110: rsrc_load                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_rsrc_load( const char *name, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {110, 0, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.addrin[0] = name;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 111: rsrc_free                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_rsrc_free( GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {111, 0, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 112: rsrc_gaddr                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_rsrc_gaddr( int16 type, int16 id, void *addr, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {112, 2, 1, 0, 1};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = type;
   data.intin[1] = id;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Die Adresse zurÅckgeben */
   if( addr!=NULL )
      *(void **)addr = data.addrout[0];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 113: rsrc_saddr                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_rsrc_saddr( int16 type, int16 id, void *addr, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {113, 2, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = type;
   data.intin[1] = id;

   data.addrin[0] = addr;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 114: rsrc_obfix                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_rsrc_obfix( OBJECT *tree, int16 obj, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {114, 1, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = obj;

   data.addrin[0] = tree;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 115: rsrc_rcfix                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_rsrc_rcfix( void *rc_header, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {115, 0, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.addrin[0] = rc_header;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}
