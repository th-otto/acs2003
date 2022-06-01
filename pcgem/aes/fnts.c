/******************************************************************************/
/*                                                                            */
/*    Eine handoptimierte Bibliothek f�r Pure-C, Pure-Pascal und GNU-C        */
/*                                                                            */
/* Die AES-Funktionen - FNTS-Bibliothek                                       */
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
/* AES 185: fnts_add                                                          */
/*                                                                            */
/******************************************************************************/

int16 mt_fnts_add( FNT_DIALOG *fnt_dialog, FNTS_ITEM *user_fonts,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {185, 1, 1, 2, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   data.addrin[0] = fnt_dialog;
   data.addrin[1] = user_fonts;

   data.intin[0] = 0;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 183: fnts_close                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_fnts_close( FNT_DIALOG *fnt_dialog, int16 *x, int16 *y, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {183, 0, 3, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   data.addrin[0] = fnt_dialog;

   /* Wegen alten WDIALOG-Versionen vorbeugen */
   data.intout[1] = -1;
   data.intout[2] = -1;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Die erhaltenen Werte speichern */
   if( x!=NULL )
      *x=data.intout[1];
   if( y!=NULL )
      *y=data.intout[2];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 180: fnts_create                                                       */
/*                                                                            */
/******************************************************************************/

FNT_DIALOG *mt_fnts_create( int16 vdi_handle, int16 no_fonts,
            int16 font_flags, int16 dialog_flags, const char *sample,
            const char *opt_button, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {180, 4, 0, 2, 1};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   data.addrin[0] = sample;
   data.addrin[1] = opt_button;

   data.intin[0] = vdi_handle;
   data.intin[1] = no_fonts;
   data.intin[2] = font_flags;
   data.intin[3] = dialog_flags;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.addrout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 181: fnts_delete                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_fnts_delete( FNT_DIALOG *fnt_dialog, int16 vdi_handle,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {181, 1, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl=globl;

   /* Die Werte in die Arrays �bertragen */
   data.addrin[0]=fnt_dialog;

   data.intin[0]=vdi_handle;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 187: fnts_do                                                           */
/*                                                                            */
/******************************************************************************/

int16 mt_fnts_do( FNT_DIALOG *fnt_dialog, int16 button_flags, int32 id_in,
            int32 pt_in, int32 ratio_in, int16 *check_boxes, int32 *id,
            fix31 *pt, int32 *ratio, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {187, 7, 8, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   data.addrin[0] = fnt_dialog;

   data.intin[0] = button_flags;
   *(int32 *)&data.intin[1] = id_in;
   *(int32 *)&data.intin[3] = pt_in;
   *(int32 *)&data.intin[5] = ratio_in;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Die R�kgabewerte eintragen */
   if( check_boxes!=NULL )
      *check_boxes = data.intout[1];
   if( id!=NULL )
      *id = *(int32 *)&data.intout[2];
   if( pt!=NULL )
      *pt = *(int32 *)&data.intout[4];
   if( ratio!=NULL )
      *ratio = *(int32 *)&data.intout[6];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 186: fnts_evnt                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_fnts_evnt( FNT_DIALOG *fnt_dialog, EVNT *events, int16 *button, int16 *check_boxes,
            int32 *id, fix31 *pt, fix31 *ratio, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {186, 0, 9, 2, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   data.addrin[0] = fnt_dialog;
   data.addrin[1] = events;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Die R�kgabewerte eintragen */
   if( button!=NULL )
      *button = data.intout[1];
   if( check_boxes!=NULL )
      *check_boxes = data.intout[2];
   if( id!=NULL )
      *id = *(int32 *)&data.intout[3];
   if( pt!=NULL )
      *pt = *(fix31 *)&data.intout[5];
   if( ratio!=NULL )
      *ratio = *(fix31 *)&data.intout[7];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 184: fnts_get_info                                                     */
/*                                                                            */
/******************************************************************************/

int16 mt_fnts_get_info( FNT_DIALOG *fnt_dialog, int32 id, int16 *mono, int16 *outline,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {184, 3, 3, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   data.addrin[0] = fnt_dialog;

   data.intin[0] = 3;
   *(int32 *)&data.intin[1] = id;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Die R�kgabewerte eintragen */
   if( mono!=NULL )
      *mono=data.intout[1];
   if( outline!=NULL )
      *outline=data.intout[2];

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 184: fnts_get_name                                                     */
/*                                                                            */
/******************************************************************************/

int16 mt_fnts_get_name( FNT_DIALOG *fnt_dialog, int32 id, char *full_name,
            char *family_name, char *style_name, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {184, 3, 1, 4, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   data.addrin[0] = fnt_dialog;
   data.addrin[1] = full_name;
   data.addrin[2] = family_name;
   data.addrin[3] = style_name;

   data.intin[0]=2;
   *(int32 *)&data.intin[1] = id;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 184: fnts_get_no_styles                                                */
/*                                                                            */
/******************************************************************************/

int16 mt_fnts_get_no_styles( FNT_DIALOG *fnt_dialog, int32 id, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {184, 3, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   data.addrin[0] = fnt_dialog;

   data.intin[0] = 0;
   *(int32 *)&data.intin[1] = id;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 184: fnts_get_style                                                    */
/*                                                                            */
/******************************************************************************/

int32 mt_fnts_get_style( FNT_DIALOG *fnt_dialog, int32 id, int16 index,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {184, 4, 2, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   data.addrin[0] = fnt_dialog;

   data.intin[0] = 1;
   *(int32 *)&data.intin[1] = id;
   data.intin[3] = index;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return *(int32 *)&data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 182: fnts_open                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_fnts_open( FNT_DIALOG *fnt_dialog, int16 button_flags, int16 x,
            int16 y, int32 id, fix31 pt, fix31 ratio,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {182, 9, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   data.addrin[0] = fnt_dialog;

   data.intin[0] = button_flags;
   data.intin[1] = x;
   data.intin[2] = y;
   *(int32 *)&data.intin[3] = id;
   *(fix31 *)&data.intin[5] = pt;
   *(fix31 *)&data.intin[7] = ratio;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 185: fnts_remove                                                       */
/*                                                                            */
/******************************************************************************/

void mt_fnts_remove( FNT_DIALOG *fnt_dialog, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {185, 1, 0, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   data.addrin[0] = fnt_dialog;

   data.intin[0] = 1;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);
}

/******************************************************************************/
/*                                                                            */
/* AES 185: fnts_update                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_fnts_update( FNT_DIALOG *fnt_dialog, int16 button_flags, int32 id,
            fix31 pt, int32 ratio, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {185, 8, 1, 1, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Werte in die Arrays �bertragen */
   data.addrin[0] = fnt_dialog;

   data.intin[0] = 2;
   data.intin[1] = button_flags;
   *(int32 *)&data.intin[2] = id;
   *(int32 *)&data.intin[4] = pt;
   *(int32 *)&data.intin[6] = ratio;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}
