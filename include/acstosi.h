/*
 * do not include <ostruct.h>,
 * their definitions conflict with the ones
 * in aestos.h.
 * But we need the macros from osbind.h for the actual
 * system calls
 */
#define _MINT_OSTRUCT_H
#include <mint/osbind.h>
#include <mint/mintbind.h>
#define _DTA DTA
