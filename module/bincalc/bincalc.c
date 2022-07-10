#include	<stdio.h>
#include	<string.h>
#include	<acs.h>
#include	"bincalc.h"
#include "acs230.h"
#include	"bincalc.ah"

INT16 ACSinit (void)
{	F_CALC.create (NULL);
	return OK;
}
