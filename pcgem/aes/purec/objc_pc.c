/******************************************************************************/
/*                                                                            */
/*    Eine handoptimierte Bibliothek fÅr Pure-C, Pure-Pascal und GNU-C        */
/*                                                                            */
/* Die AES-Funktionen - OBJC-Bibliothek kompatibel zu PureC                   */
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
/* AES 40:  objc_add                                                          */
/*                                                                            */
/******************************************************************************/

int16 objc_add( OBJECT *tree, int16 parent, int16 child )
{
   return mt_objc_add(tree, parent, child, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 41:  objc_delete                                                       */
/*                                                                            */
/******************************************************************************/

int16 objc_delete( OBJECT *tree, int16 objnr )
{
   return mt_objc_delete(tree, objnr, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 42:  objc_draw                                                         */
/*                                                                            */
/******************************************************************************/

int16 objc_draw( OBJECT *tree, int16 start, int16 depth, int16 xclip,
            int16 yclip, int16 wclip, int16 hclip )
{
   return mt_objc_draw(tree, start, depth, xclip, yclip, wclip, hclip, _globl);
}

/******************************************************************************/

int16 objc_draw_grect( OBJECT *tree, int16 start, int16 depth,
            const GRECT *r )
{
   return mt_objc_draw_grect(tree, start, depth, r, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 42:  objc_wdraw                                                        */
/*                                                                            */
/******************************************************************************/

void objc_wdraw( OBJECT *tree, int16 start, int16 depth, GRECT *clip,
            int16 whandle )
{
   mt_objc_wdraw(tree, start, depth, clip, whandle, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 43:  objc_find                                                         */
/*                                                                            */
/******************************************************************************/

int16 objc_find( OBJECT *tree, int16 start, int16 depth,
            int16 mx, int16 my )
{
   return mt_objc_find(tree, start, depth, mx, my, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 44:  objc_offset                                                       */
/*                                                                            */
/******************************************************************************/

int16 objc_offset( OBJECT *tree, int16 objnr, int16 *x, int16 *y )
{
   return mt_objc_offset(tree, objnr, x, y, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 45:  objc_order                                                        */
/*                                                                            */
/******************************************************************************/

int16 objc_order( OBJECT *tree, int16 objnr, int16 new_nr )
{
   return mt_objc_order(tree, objnr, new_nr, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 46:  objc_edit                                                         */
/*                                                                            */
/******************************************************************************/

int16 objc_edit( OBJECT *tree, int16 objnr, int16 inchar, int16 *idx,
            int16 kind )
{
   return mt_objc_edit(tree, objnr, inchar, idx, kind, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 46:  objc_xedit                                                        */
/*                                                                            */
/******************************************************************************/

int16 objc_xedit( OBJECT *tree, int16 objnr, int16 inchar, int16 *idx,
            int16 kind, GRECT *r )
{
   return mt_objc_xedit(tree, objnr, inchar, idx, kind, r, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 65:  objc_wedit                                                        */
/*                                                                            */
/******************************************************************************/

int16 objc_wedit( OBJECT *tree, int16 objnr, int16 inchar, int16 *idx,
            int16 kind, int16 whandle )
{
   return mt_objc_wedit(tree, objnr, inchar, idx, kind, whandle, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 47:  objc_change                                                       */
/*                                                                            */
/******************************************************************************/

int16 objc_change( OBJECT *tree, int16 objnr, int16 reserved,
            int16 xclip, int16 yclip, int16 wclip, int16 hclip,
            int16 newstate, int16 redraw )
{
   return mt_objc_change(tree, objnr, reserved,  xclip, yclip, wclip, hclip, newstate,
               redraw, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 47:  objc_wchange                                                      */
/*                                                                            */
/******************************************************************************/

void objc_wchange( OBJECT *tree, int16 objnr, int16 newstate,
            GRECT *clip, int16 whandle )
{
   mt_objc_wchange(tree, objnr, newstate, clip, whandle, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 48:  objc_sysvar                                                       */
/*                                                                            */
/******************************************************************************/

int16 objc_sysvar( int16 mode, int16 which, int16 in1, int16 in2,
            int16 *out1, int16 *out2 )
{
   return mt_objc_sysvar(mode, which, in1, in2, out1, out2, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 49:  objc_xfind                                                        */
/*                                                                            */
/******************************************************************************/

int16 objc_xfind( OBJECT *obj, int16 start, int16 depth,
            int16 x, int16 y )
{
   return mt_objc_xfind(obj, start, depth, x, y, _globl);
}
