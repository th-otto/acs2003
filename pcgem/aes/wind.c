/******************************************************************************/
/*                                                                            */
/*    Eine handoptimierte Bibliothek fÅr Pure-C, Pure-Pascal und GNU-C        */
/*                                                                            */
/* Die AES-Funktionen - WIND-Bibliothek                                       */
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
/* Lokale Variablen                                                           */
/*                                                                            */
/******************************************************************************/

/* Anzahl der benutzten Parameter fÅr wind_get und wind_set */
/* Belegung:   1. Index: Modus                              */
/*             2. Index: 0 - wind_get, 1 - wind_set         */
int16 MaxParmsWindGetSet[][2] =
   {
      {-1, -1},            /* unused                           */
      { 1,  1},            /* WF_KIND                          */
      { 0,  2},            /* WF_NAME                 (N.AES)  */
      { 0,  2},            /* WF_INFO                 (N.AES)  */
      { 4,  0},            /* WF_WORKXYWH                      */
      { 4,  4},            /* WF_CURRXYWH                      */
      { 4,  0},            /* WF_PREVXYWH                      */
      { 4,  0},            /* WF_FULLXYWH                      */
      { 1,  1},            /* WF_HSLIDE                        */
      { 1,  1},            /* WF_VSLIDE                        */
      { 3,  1},            /* WF_TOP (was 1, 3 since AES 3.3)  */
      { 4,  0},            /* WF_FIRSTXYWH                     */
      { 4,  0},            /* WF_NEXTXYWH                      */
      {-1, -1},            /* unused                           */
      { 3,  3},            /* WF_NEWDESK     (since AES 3.3)   */
      { 1,  1},            /* WF_HSLSIZE                       */
      { 1,  1},            /* WF_VSLSIZE                       */
      { 4, -1},            /* WF_SCREEN                        */
      { 3,  3},            /* WF_COLOR       (since AES 3.3)   */
      { 3,  3},            /* WF_DCOLOR      (since AES 3.3)   */
      { 4, -1},            /* WF_OWNER       (since AES 3.3)   */
      {-1, -1},            /* unused                           */
      {-1, -1},            /* unused                           */
      {-1, -1},            /* unused                           */
      { 1,  1},            /* WF_BEVENT      (since AES 3.31)  */
      { 1,  0},            /* WF_BOTTOM      (since AES 3.31)  */
      { 3,  3},            /* WF_ICONIFY     (since AES 4.1)   */
      { 4,  4},            /* WF_UNICONIFY   (since AES 4.1)   */
      {-1, -1},            /* unused                           */
      {-1, -1},            /* unused                           */
      { 2,  2},            /* WF_TOOLBAR     (since AES 4.1)   */
      { 4,  4},            /* WF_FTOOLBAR    (since AES 4.1)   */
      { 4,  4}             /* WF_NTOOLBAR    (since AES 4.1)   */
   };
int16 AnzMaxParmsWindGetSet =
                     (int16)(sizeof(MaxParmsWindGetSet)/sizeof(MaxParmsWindGetSet[0]));

/******************************************************************************/
/*                                                                            */
/* AES 100: wind_create                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_wind_create( int16 kind, int16 max_x, int16 max_y,
            int16 max_w, int16 max_h, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {100, 5, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = kind;
   data.intin[1] = max_x;
   data.intin[2] = max_y;
   data.intin[3] = max_w;
   data.intin[4] = max_h;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/

#if 0
int16 mt_wind_create_grect( int16 kind, const GRECT *r, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {100, 5, 1, 0, 0};
   AESData data;

   if( r == NULL )
      return -1;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = kind;
   MEMCPY_4(data.intin[1], r);

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}
#endif

/******************************************************************************/
/*                                                                            */
/* AES 101: wind_open                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_wind_open( int16 handle, int16 x, int16 y,
            int16 w, int16 h, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {101, 5, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;
   data.intin[1] = x;
   data.intin[2] = y;
   data.intin[3] = w;
   data.intin[4] = h;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/

#if 0
int16 mt_wind_open_grect( int16 handle, const GRECT *r, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {101, 5, 1, 0, 0};
   AESData data;

   if( r == NULL )
      return 0;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;
   MEMCPY_4(data.intin[1], r);

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}
#endif

/******************************************************************************/
/*                                                                            */
/* AES 102: wind_close                                                        */
/*                                                                            */
/******************************************************************************/

int16 mt_wind_close( int16 handle, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {102, 1, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 103: wind_delete                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_wind_delete( int16 handle, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {103, 1, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 104: wind_get - multithreading-feste Version mit 4 fixen Parametern    */
/*                                                                            */
/*          WF_NAME und WF_INFO interpretiert 'value1' als 'char *value1'     */
/*                                                                            */
/******************************************************************************/

int16 mt_wind_get( int16 handle, int16 what, int16 *value1, int16 *value2,
            int16 *value3, int16 *value4, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {104, 2, 5, 0, 0};
   int16 max = (what>=0 && what<AnzMaxParmsWindGetSet ? MaxParmsWindGetSet[what][0] : 4);
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Bei Wert -1 wird abgebrochen! */
   if( max<0 )
      return 0;

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;
   data.intin[1] = what;

   /* Bei manchen Werten muû das intin-Array mit Werten belegt werden */
   switch(what)
   {
      case WF_COLOR:
      case WF_DCOLOR:
         /* Die Fensternummer wird in intin[2] erwartet! */
         data.intin[2] = handle;
         data.contrl[1] += 1;
         break;

      case WF_NAME:
      case WF_INFO:
         /* Der Zeiger auf den String wird in intin[2/3] erwartet */
         if( value1!=NULL )
         {
            *(int16 **)&data.intin[2] = value1;
            data.contrl[1] += 2;
         }
         break;
   }

   /* Sicherheitshalber intout mit 0 initiaisieren */
   data.intout[0] = data.intout[1] = data.intout[2] = data.intout[3] = data.intout[4] = 0;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Die Werte verteilen */
   if( max>0 && value1!=NULL )
      *value1 = data.intout[1];
   if( max>1 && value2!=NULL )
      *value2 = data.intout[2];
   if( max>2 && value3!=NULL )
      *value3 = data.intout[3];
   if( max>3 && value4!=NULL )
      *value4 = data.intout[4];

   return data.intout[0];
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* AES 104: wind_get - Spezial-Version fÅr die QSB-Ermittelung                */
/*                      (QSB: Quater Screen Buffer, WF_SCREEN)                */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

int16 mt_wind_getQSB( int16 handle, void **buffer, int32 *length, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {104, 2, 5, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;
   data.intin[1] = WF_SCREEN;

   /* Sicherheitshalber intout mit 0 initiaisieren */
   data.intout[0] = data.intout[1] = data.intout[2] = data.intout[3] = data.intout[4] = 0;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Die Werte verteilen */
   if( buffer!=NULL )
      *buffer = *(void **)&data.intout[1];
   if( length!=NULL )
   {
      *length = *(int32 *)&data.intout[3];

      /* Die Korrektur fÅr TOS 1.02 aus dem Profibuch */
      if( *length==0 && data.globl->ap_version==0x0120 )
         *length = 8000;
   }

   return data.intout[0];
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* AES 104: wind_get - Optimiert fÅr RÅckgaben von Rechtecken                 */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

#if 0
int16 mt_wind_get_grect( int16 handle, int16 what, GRECT *r, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {104, 2, 5, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;
   data.intin[1] = what;

   /* Sicherheitshalber intout mit 0 initiaisieren */
   data.intout[0] = data.intout[1] = data.intout[2] = data.intout[3] = data.intout[4] = 0;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Die Werte verteilen */
   if( r!=NULL )
      MEMCPY_4(r, data.intout[1]);

   return data.intout[0];
}
#endif

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* AES 104: wind_get - Optimiert fÅr RÅckgaben eines Integerwertes            */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

#if 0
int16 mt_wind_get_int( int16 handle, int16 what, int16 *g1, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {104, 2, 5, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;
   data.intin[1] = what;

   /* Sicherheitshalber intout mit 0 initiaisieren */
   data.intout[0] = data.intout[1] = data.intout[2] = data.intout[3] = data.intout[4] = 0;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Die Werte verteilen */
   if( g1!=NULL )
      *g1 = data.intout[1];

   return data.intout[0];
}
#endif

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* AES 104: wind_xget - Spezial-Binding aus der GEMLIB                        */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

#if 0
int16 mt_wind_xget_grect( int16 handle, int16 what, const GRECT *clip, GRECT *r, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {104, 6, 5, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;
   data.intin[1] = what;
   MEMCPY_4(data.intin[2], clip);

   /* Sicherheitshalber intout mit 0 initiaisieren */
   data.intout[0] = data.intout[1] = data.intout[2] = data.intout[3] = data.intout[4] = 0;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Die Werte verteilen */
   if( r!=NULL )
   {
      r->g_x = data.intout[1];
      r->g_y = data.intout[2];
      r->g_w = data.intout[3];
      r->g_h = data.intout[4];
   }

   return data.intout[0];
}
#endif

/******************************************************************************/
/*                                                                            */
/* AES 105: wind_set - multithreading-feste Version mit 4 fixen Parametern    */
/*                                                                            */
/******************************************************************************/

int16 mt_wind_set( int16 handle, int16 what, int16 value1,
            int16 value2, int16 value3, int16 value4, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {105, 6, 1, 0, 0};
   int16 max = (what>=0 && what<AnzMaxParmsWindGetSet ? MaxParmsWindGetSet[what][1] : 4);
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Bei Wert -1 wird abgebrochen! */
   if( max<0 )
      return 0;

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;
   data.intin[1] = what;
   data.intin[2] = (max>0 ? value1 : 0);
   data.intin[3] = (max>1 ? value2 : 0);
   data.intin[4] = (max>2 ? value3 : 0);
   data.intin[5] = (max>4 ? value4 : 0);

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* AES 105: wind_set - FÅr Rechteck-Daten optimierte Version                  */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

int16 mt_wind_xset_grect( int16 handle, int16 what, const GRECT *xywh,
            GRECT *ret, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {105, 6, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;
   data.intin[1] = what;
   MEMCPY_4(data.intin + 2, xywh);

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Ggf. die RÅckgabedaten fÅllen */
   if( ret!=NULL )
      MEMCPY_4(ret, data.intout + 1);

   return data.intout[0];
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* AES 105: wind_set - FÅr Rechteck-Daten optimierte Version                  */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

#if 0
int16 mt_wind_setGRECT( int16 handle, int16 what, const GRECT *xywh,
            GlobalArray *globl )
{
   return mt_wind_xset_grect(handle, what, xywh, NULL, globl);
}
#endif

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* AES 105: wind_set - FÅr Rechteck-Daten optimierte Version                  */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

#if 0
int16 mt_wind_set_grect( int16 handle, int16 what, const GRECT *r,
            GlobalArray *globl )
{
   return mt_wind_xset_grect(handle, what, r, NULL, globl);
}
#endif

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* AES 105: wind_set - FÅr Strings optimierte Version                         */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

#if 0
int16 mt_wind_set_string( int16 handle, int16 what, const char *str,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {105, 6, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;
   data.intin[1] = what;
   /* Optimierung: Anstelle von                                */
   /*                                                          */
   /* data.intin[2] = (int16)((((int32)str) >> 16) & 0xFFFF);  */
   /* data.intin[3] = (int16)(((int32)str) & 0xFFFF);          */
   /*                                                          */
   /* heiût es nun:                                            */
   if( str!=NULL )
      *((const char **)&data.intin[2]) = str;
   else
      return -1;
   data.intin[4] = 0;
   data.intin[5] = 0;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}
#endif

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* AES 105: wind_set - FÅr einen Integer optimierte Version                   */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

#if 0
int16 mt_wind_set_int( int16 handle, int16 what, int16 g1,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {105, 6, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;
   data.intin[1] = what;
   data.intin[2] = g1;
   data.intin[3] = 0;
   data.intin[4] = 0;
   data.intin[5] = 0;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}
#endif

/******************************************************************************/
/*                                                                            */
/* AES 106: wind_find                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_wind_find( int16 x, int16 y, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {106, 2, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = x;
   data.intin[1] = y;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 107: wind_update                                                       */
/*                                                                            */
/******************************************************************************/

int16 mt_wind_update( int16 what, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {107, 1, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = what;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}

/******************************************************************************/
/*                                                                            */
/* AES 108: wind_calc                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_wind_calc( int16 wtype, int16 kind, int16 x, int16 y,
            int16 w, int16 h, int16 *px, int16 *py, int16 *pw, int16 *ph,
            GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {108, 6, 5, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = wtype;
   data.intin[1] = kind;
   data.intin[2] = x;
   data.intin[3] = y;
   data.intin[4] = w;
   data.intin[5] = h;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Die Werte verteilen */
   if( px!=NULL )
      *px = data.intout[1];
   if( py!=NULL )
      *py = data.intout[2];
   if( pw!=NULL )
      *pw = data.intout[3];
   if( ph!=NULL )
      *ph = data.intout[4];

   return data.intout[0];
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* AES 108: wind_calc - optimierte Version                                    */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

int16 mt_wind_calcGRECT( int16 wtype, int16 kind, const GRECT *input,
            GRECT *output, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {108, 6, 5, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = wtype;
   data.intin[1] = kind;
   MEMCPY_4(data.intin + 2, input);

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   /* Die Werte verteilen */
   if( output!=NULL )
      MEMCPY_4(output, data.intout + 1);

   return data.intout[0];
}

/******************************************************************************/

int16 mt_wind_calc_grect( int16 type, int16 parts, const GRECT *In,
            GRECT *Out, GlobalArray *globl )
{
   return mt_wind_calcGRECT(type,parts,In,Out, globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 109: wind_new                                                          */
/*                                                                            */
/******************************************************************************/

int16 mt_wind_new( GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {109, 0, 1, 0, 0};
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
/* AES 99:  wind_draw                                                         */
/*                                                                            */
/******************************************************************************/

int16 mt_wind_draw( int16 handle, int16 startob, GlobalArray *globl )
{
   /* AES-Datenblock anlegen */
   static int16 contrl[] = {99, 2, 1, 0, 0};
   AESData data;

   /* Das contrl-Array initialisieren */
   CTRLCOPY(data.contrl, contrl);

   /* Das globl-Array eintragen */
   data.globl = globl;

   /* Die Arrays fÅllen */
   data.intin[0] = handle;
   data.intin[1] = startob;

   /* Ab in die AES... */
   aes(data.contrl, data.globl, data.intin, data.intout, data.addrin, data.addrout);

   return data.intout[0];
}
