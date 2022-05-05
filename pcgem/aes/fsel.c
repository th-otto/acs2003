/******************************************************************************/
/*                                                                            */
/*    Eine handoptimierte Bibliothek fr Pure-C, Pure-Pascal und GNU-C        */
/*                                                                            */
/* Die AES-Funktionen - FSEL-Bibliothek                                       */
/*                                                                            */
/* (c) 1998-2003 by Martin Els„sser @ LL                                      */
/* (c) 2008 Gerhard Stoll @ B                                                 */
/*                                                                            */
/*                                                 Tabsize: 1 Tab = 3 Spaces  */
/******************************************************************************/

/******************************************************************************/
/*                                                                            */
/* Lokale Konstanten                                                          */
/*                                                                            */
/******************************************************************************/

/* Die Anzahl der Words des contrl-Arrays muž von diesem Modul konfiguriert   */
/* werden. Ferner wird das Makro CTRLCOPY auf das passende Makro MEMCPY_n     */
/* umgesetzt. Mit diesen beiden Parametern wird die gesamte Befllung des     */
/* control-Arrays fr dieses Modul definiert!                                 */
/* Achtung: die Definitionen mssen vor dem Lesen von PCGEM_I.H stehen!       */
#define CTRL_WORDS   5
#define CTRLCOPY     MEMCPY_5

/******************************************************************************/
/*                                                                            */
/* Ben”tigte Header-Dateien                                                   */
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
/* AES 90:  fsel_input                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_fsel_input( char *path, char *name, int16 *button, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {90, 0, 2, 2, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fllen */
   data.addrin[0] = path;
   data.addrin[1] = name;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Den Wert zurckgeben */
   if( button!=NULL )
      *button = data.intout[1];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 91:  fsel_exinput                                                      */
/*                                                                            */
/******************************************************************************/

int16 mt_fsel_exinput( char *path, char *name, int16 *button, const char *label,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {91, 0, 2, 3, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Wenn fsel_exinput nicht verfgbar ist, wird fsel_input verwendet */
   if( data.globl->ap_version<0x0140
         || (data.globl->ap_version>=0x0200 && data.globl->ap_version<0x0300) )
      return mt_fsel_input(path, name, button, globl);
   else
   {
      /* Die Arrays fllen */
      data.addrin[0] = path;
      data.addrin[1] = name;
      data.addrin[2] = label;

      /* Ab in die AES... */
      aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

      /* Den Wert zurckgeben */
      if( button!=NULL )
         *button = data.intout[1];

      return data.intout[0];
   }
}

/******************************************************************************/
/*                                                                            */
/* AES 91:  fsel_exinput                                                      */
/*                                                                            */
/******************************************************************************/

int16 mt_fsel_boxinput( char *path, char *name, int16 *button, const char *label,
            FSEL_CALLBACK callback, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {91, 0, 2, 4, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Wenn fsel_boxinput nicht verfgbar ist, wird fsel_input verwendet */
   if( !Ash_getcookie(C_HBFS, NULL) )
      return mt_fsel_exinput(path, name, button, label, globl);
   else
   {
      /* Die Arrays fllen */
      data.addrin[0] = path;
      data.addrin[1] = name;
      data.addrin[2] = label;
      data.addrin[3] = callback;

      /* Ab in die AES... */
      aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

      /* Den Wert zurckgeben */
      if( button!=NULL )
         *button = data.intout[1];

      return data.intout[0];
   }
}
