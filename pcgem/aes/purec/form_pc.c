/******************************************************************************/
/*                                                                            */
/*    Eine handoptimierte Bibliothek fÅr Pure-C, Pure-Pascal und GNU-C        */
/*                                                                            */
/* Die AES-Funktionen - FORM-Bibliothek kompatibel zu PureC                   */
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
/* AES 50:  form_do                                                           */
/*                                                                            */
/******************************************************************************/

int16 form_do( OBJECT *tree, int16 start )
{
   return mt_form_do(tree, start, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 51:  form_dial                                                         */
/*                                                                            */
/******************************************************************************/

int16 form_dial( int16 flag, int16 xlittle, int16 ylittle,
            int16 wlittle, int16 hlittle, int16 xbig, int16 ybig,
            int16 wbig, int16 hbig )
{
   return mt_form_dial(flag, xlittle, ylittle, wlittle, hlittle,
               xbig, ybig, wbig, hbig, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 52:  form_alert                                                        */
/*                                                                            */
/******************************************************************************/

int16 form_alert( int16 defbutton, const char *string )
{
   return mt_form_alert(defbutton, string, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 53:  form_error                                                        */
/*                                                                            */
/******************************************************************************/

int16 form_error( int16 errnum )
{
   return mt_form_error(errnum, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 54:  form_center                                                       */
/*                                                                            */
/******************************************************************************/

int16 form_center( OBJECT *tree, int16 *x, int16 *y, int16 *w, int16 *h )
{
   return mt_form_center(tree, x, y, w, h, _globl);
}

/******************************************************************************/

int16 form_center_grect( OBJECT *tree, GRECT *r )
{
   return mt_form_center_grect(tree, r, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 55:  form_keybd                                                        */
/*                                                                            */
/******************************************************************************/

int16 form_keybd( OBJECT *tree, int16 obj, int16 next,
            int16 input_char, int16 *next_obj, int16 *pchar )
{
   return mt_form_keybd(tree, obj, next, input_char, next_obj, pchar, _globl);
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

int16 form_button( OBJECT *tree, int16 obj, int16 clicks, int16 *next_obj )
{
   return mt_form_button(tree, obj, clicks, next_obj, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 135: form_popup                                                        */
/*                                                                            */
/******************************************************************************/

int16 form_popup( OBJECT *tree, int16 x, int16 y)
{
   return mt_form_popup(tree, x, y, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 63:  form_wbutton                                                      */
/*                                                                            */
/******************************************************************************/

int16 form_wbutton( OBJECT *fo_btree, int16 fo_bobject,
               int16 fo_bclicks, int16 *fo_bnxtobj, int16 whandle )
{
   return mt_form_wbutton(fo_btree, fo_bobject, fo_bclicks, fo_bnxtobj, whandle, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 51:  form_xdial                                                        */
/*                                                                            */
/******************************************************************************/

int16 form_xdial( int16 fo_diflag, int16 fo_dilittlx, int16 fo_dilittly,
            int16 fo_dilittlw, int16 fo_dilittlh, int16 fo_dibigx,
            int16 fo_dibigy, int16 fo_dibigw, int16 fo_dibigh,
            void **flydial )
{
   return mt_form_xdial(fo_diflag, fo_dilittlx, fo_dilittly, fo_dilittlw, fo_dilittlh,
               fo_dibigx, fo_dibigy, fo_dibigw, fo_dibigh, flydial, _globl);
}

/******************************************************************************/

int16 form_xdial_grect( int16 fo_diflag, const GRECT *fo_dilittl, const GRECT *fo_dibig,
            void **flydial )
{
   return mt_form_xdial_grect(fo_diflag, fo_dilittl, fo_dibig, flydial, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 50:  form_xdo                                                          */
/*                                                                            */
/******************************************************************************/

int16 form_xdo( OBJECT *tree, int16 startob,
            int16 *lastcrsr, const XDO_INF *tabs, void *flydial )
{
   return mt_form_xdo(tree, startob, lastcrsr, tabs, flydial, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 136: form_xerr                                                         */
/*                                                                            */
/******************************************************************************/

int16 form_xerr( int32 errcode, const char *errfile )
{
   return mt_form_xerr(errcode, errfile, _globl);
}
