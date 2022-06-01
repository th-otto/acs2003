/******************************************************************************/
/*                                                                            */
/*    Eine handoptimierte Bibliothek fÅr Pure-C, Pure-Pascal und GNU-C        */
/*                                                                            */
/* Die AES-Funktionen - EVNT-Bibliothek kompatibel zu PureC                   */
/*                                                                            */
/* (c) 1998-2003 by Martin ElsÑsser @ LL                                      */
/* (c) 2008 Gerhard Stoll @ B                                                 */
/*                                                                            */
/*                                                 Tabsize: 1 Tab = 3 Spaces  */
/******************************************************************************/

/* Wir brauchen die KompatibilitÑts-Funktionen, keine Makro-Definitionen! */
#define __COMPATIBLE_FKT__

/******************************************************************************/

#include "../pcgem_i.h"

/******************************************************************************/
/*                                                                            */
/* AES 20:  evnt_keybd                                                        */
/*                                                                            */
/******************************************************************************/

int16 evnt_keybd( void )
{
   return mt_evnt_keybd(_globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 21:  evnt_button                                                       */
/*                                                                            */
/******************************************************************************/

int16 evnt_button( int16 ev_bclicks, uint16 ev_bmask,
            uint16 ev_bstate, int16 *ev_bmx, int16 *ev_bmy, int16 *ev_bbutton,
            int16 *ev_bkstate )
{
   return mt_evnt_button(ev_bclicks, ev_bmask, ev_bstate, ev_bmx, ev_bmy,
         ev_bbutton, ev_bkstate, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 22:  evnt_mouse                                                        */
/*                                                                            */
/******************************************************************************/

int16 evnt_mouse( int16 ev_moflags, int16 ev_mox,
            int16 ev_moy, int16 ev_mowidth, int16 ev_moheight,
            int16 *ev_momx, int16 *ev_momy, int16 *ev_mobutton, int16 *ev_mokstate )
{
   return mt_evnt_mouse(ev_moflags, ev_mox, ev_moy, ev_mowidth, ev_moheight, ev_momx,
            ev_momy, ev_mobutton, ev_mokstate, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 23:  evnt_mesag                                                        */
/*                                                                            */
/******************************************************************************/

int16 evnt_mesag( int16 *pbuff )
{
   return mt_evnt_mesag(pbuff, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 24:  evnt_timer                                                        */
/*                                                                            */
/******************************************************************************/

int16 evnt_timer( int16 ev_tlocount, int16 ev_thicount )
{
   return mt_evnt_timer(((int32)(ev_thicount)<<32) | (int32)(ev_tlocount), _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 25:  evnt_multi                                                        */
/*                                                                            */
/******************************************************************************/

int16 evnt_multi( int16 ev_mflags, int16 ev_mbclicks, int16 ev_mbmask,
            int16 ev_mbstate, int16 ev_mm1flags, int16 ev_mm1x,
            int16 ev_mm1y, int16 ev_mm1width, int16 ev_mm1height,
            int16 ev_mm2flags, int16 ev_mm2x, int16 ev_mm2y,
            int16 ev_mm2width, int16 ev_mm2height, int16 *ev_mmgpbuff,
            int16 ev_mtlocount, int16 ev_mthicount, int16 *ev_mmox,
            int16 *ev_mmoy, int16 *ev_mmbutton, int16 *ev_mmokstate, int16 *ev_mkreturn,
            int16 *ev_mbreturn )
{
   return mt_evnt_multi(ev_mflags, ev_mbclicks, ev_mbmask, ev_mbstate, ev_mm1flags, ev_mm1x,
               ev_mm1y, ev_mm1width, ev_mm1height, ev_mm2flags, ev_mm2x, ev_mm2y,
               ev_mm2width, ev_mm2height, ev_mmgpbuff,
               ((int32)ev_mthicount<<16) | (int32)ev_mtlocount, ev_mmox, ev_mmoy, ev_mmbutton,
               ev_mmokstate, ev_mkreturn, ev_mbreturn, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 25:  evnt_xmulti                                                       */
/*                                                                            */
/******************************************************************************/

int16 evnt_xmulti( int16 ev_mflags, int16 ev_mbclicks, int16 ev_mbmask,
            int16 ev_mbstate, int16 ev_mm1flags, int16 ev_mm1x,
            int16 ev_mm1y, int16 ev_mm1width, int16 ev_mm1height,
            int16 ev_mm2flags, int16 ev_mm2x, int16 ev_mm2y,
            int16 ev_mm2width, int16 ev_mm2height, int16 *ev_mmgpbuff,
            int16 ev_mtlocount, int16 ev_mthicount, int16 *ev_mmox,
            int16 *ev_mmoy, int16 *ev_mmbutton, int16 *ev_mmokstate, int16 *ev_mkreturn,
            int16 *ev_mbreturn, int16 *ev_mwhlpbuff )
{
   return mt_evnt_xmulti(ev_mflags, ev_mbclicks, ev_mbmask, ev_mbstate, ev_mm1flags, ev_mm1x,
               ev_mm1y, ev_mm1width, ev_mm1height, ev_mm2flags, ev_mm2x, ev_mm2y,
               ev_mm2width, ev_mm2height, ev_mmgpbuff,
               ((int32)ev_mthicount<<16) | (int32)ev_mtlocount, ev_mmox, ev_mmoy, ev_mmbutton,
               ev_mmokstate, ev_mkreturn, ev_mbreturn, ev_mwhlpbuff, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 25:  EVNT_multi                                                        */
/*                                                                            */
/******************************************************************************/

void EVNT_multi( int16 ev_mflags, int16 ev_mbclicks, int16 ev_mbmask,
            int16 ev_mbstate, MOBLK *m1, MOBLK *m2, int32 ev_mtimer,
            EVNT *event )
{
   mt_EVNT_multi(ev_mflags, ev_mbclicks, ev_mbmask, ev_mbstate, m1, m2, ev_mtimer,
               event, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 25:  evnt_event                                                        */
/*                                                                            */
/******************************************************************************/

int16 evnt_event( MultiEventIn *input, MultiEventOut *output )
{
   return mt_evnt_event(input, output, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 25:  EvntMulti                                                         */
/*                                                                            */
/******************************************************************************/

int16 EvntMulti( EVENT *evnt_data )
{
   return mt_EvntMulti(evnt_data, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 26:  evnt_dclick                                                       */
/*                                                                            */
/******************************************************************************/

int16 evnt_dclick( int16 rate, int16 setit )
{
   return mt_evnt_dclick(rate, setit, _globl);
}
