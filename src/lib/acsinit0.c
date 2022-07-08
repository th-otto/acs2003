/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      main application entry                                */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 ACSinit0(void)
{
	return ACSblk->ACSinit0();
}
