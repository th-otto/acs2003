/******************************************************************************/
/*                                                                            */
/*    Eine handoptimierte Bibliothek fr Pure-C, Pure-Pascal und GNU-C        */
/*                                                                            */
/* Include-Datei zur Erstellung der Bibliothek                                */
/*                                                                            */
/* (c) 1998-2003 by Martin Els„sser @ LL                                      */
/* (c) 2008 Gerhard Stoll @ B                                                 */
/*                                                                            */
/*                                                                Tabsize: 3  */
/******************************************************************************/

#ifndef __PCGEM_Internal__
#define __PCGEM_Internal__

/******************************************************************************/
/*                                                                            */
/* Ben”tigte Header-Dateien                                                   */
/*                                                                            */
/******************************************************************************/

#include <acsaes.h>
#include <string.h>
#include <stdarg.h>
#ifndef C_MagX
   #include <acscook.h>
#endif

/******************************************************************************/
/*                                                                            */
/* Globale Konstanten und Makros                                              */
/*                                                                            */
/******************************************************************************/

/* Optimierung fr memcpy - bis zu 16 Byte k”nnen schnell per Longs kopiert werden */
#define MEMCPY_1(dest, src)   (((int16 *)dest)[0] = ((int16 *)src)[0], (dest))
#define MEMCPY_2(dest, src)   (((int32 *)dest)[0] = ((int32 *)src)[0], (dest))
#define MEMCPY_3(dest, src)   (((int32 *)dest)[0] = ((int32 *)src)[0], ((int16 *)dest)[3] = ((int16 *)src)[3], (dest))
#define MEMCPY_4(dest, src)   (((int32 *)dest)[0] = ((int32 *)src)[0], ((int32 *)dest)[1] = ((int32 *)src)[1], (dest))
#define MEMCPY_5(dest, src)   (((int32 *)dest)[0] = ((int32 *)src)[0], ((int32 *)dest)[1] = ((int32 *)src)[1], ((int16 *)dest)[4] = ((int16 *)src)[4], (dest))
#define MEMCPY_6(dest, src)   (((int32 *)dest)[0] = ((int32 *)src)[0], ((int32 *)dest)[1] = ((int32 *)src)[1], ((int32 *)dest)[3] = ((int32 *)src)[3], (dest))
#define MEMCPY_7(dest, src)   (((int32 *)dest)[0] = ((int32 *)src)[0], ((int32 *)dest)[1] = ((int32 *)src)[1], ((int32 *)dest)[3] = ((int32 *)src)[3], ((int16 *)dest)[6] = ((int16 *)src)[6], (dest))
#define MEMCPY_8(dest, src)   (((int32 *)dest)[0] = ((int32 *)src)[0], ((int32 *)dest)[1] = ((int32 *)src)[1], ((int32 *)dest)[3] = ((int32 *)src)[3], ((int32 *)dest)[4] = ((int32 *)src)[4], (dest))

/******************************************************************************/

#endif
