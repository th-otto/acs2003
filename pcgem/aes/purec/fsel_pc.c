/******************************************************************************/
/*                                                                            */
/*    Eine handoptimierte Bibliothek f�r Pure-C, Pure-Pascal und GNU-C        */
/*                                                                            */
/* Die AES-Funktionen - FSEL-Bibliothek kompatibel zu PureC                   */
/*                                                                            */
/* (c) 1998-2003 by Martin Els�sser @ LL                                      */
/* (c) 2008 Gerhard Stoll @ B                                                 */
/*                                                                            */
/*                                                 Tabsize: 1 Tab = 3 Spaces  */
/******************************************************************************/

/* Wir brauchen die Kompatibilit�ts-Funktionen, keine Makro-Definitionen! */
#define __COMPATIBLE_FKT__

/******************************************************************************/

#include "../pcgem_i.h"

/******************************************************************************/
/*                                                                            */
/* AES 90:  fsel_input                                                        */
/*                                                                            */
/******************************************************************************/

int16 fsel_input( char *path, char *name, int16 *button )
{
   return mt_fsel_input(path, name, button, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 91:  fsel_exinput                                                      */
/*                                                                            */
/******************************************************************************/

int16 fsel_exinput( char *path, char *name, int16 *button, const char *label )
{
   return mt_fsel_exinput(path, name, button, label, _globl);
}

/******************************************************************************/
/*                                                                            */
/* AES 91:  fsel_exinput                                                      */
/*                                                                            */
/******************************************************************************/

int16 fsel_boxinput( char *path, char *name, int16 *button, const char *label,
            FSEL_CALLBACK callback )
{
   return mt_fsel_boxinput(path, name, button, label, callback, _globl);
}
