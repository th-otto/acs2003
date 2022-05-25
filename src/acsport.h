/*
 * These definitions should no longer be needed,
 * but Pure-C generates slightly different code in a few routines
 * when types are declared as int instead of short
 */
#ifdef __PUREC__
#define __PORTAB_H__
#define _BYTE signed char
#define _UBYTE unsigned char
#define _WORD int
#define _UWORD unsigned int
#define _LONG long
#define _ULONG unsigned long
#endif
