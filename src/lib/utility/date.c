/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Date conversion functions                             */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static int16 ymd2n(int16 year, int16 month, int16 day)
{
	return (year - 1980) * 367 -
	       ((((month + 9) / 12) + year) * 7) / 4 -
	       (((((month - 9) / 7) + year) / 100 + 1) * 3) / 4 +
	       (month * 275) / 9 + day - 100;
}

/* -------------------------------------------------------------------------- */

static int16 n2dow(int16 day)
{
	return (((day % 7) + 8) % 7) + 1;
}

/* -------------------------------------------------------------------------- */

int16 Adate_ymd2dow(int16 year, int16 month, int16 day)
{
	return n2dow(ymd2n(year, month, day));
}

/* -------------------------------------------------------------------------- */

int16 Adate_getMonth(const char *date, char *out_month)
{
	int month = 0;

	if (Ast_incmp(date, "JAN", 3) == 0)
		month = 1;
	if (Ast_incmp(date, "FEB", 3) == 0)
		month = 2;
	if (Ast_incmp(date, "MAR", 3) == 0)
		month = 3;
	if (Ast_incmp(date, "APR", 3) == 0)
		month = 4;
	if (Ast_incmp(date, "MAY", 3) == 0)
		month = 5;
	if (Ast_incmp(date, "JUN", 3) == 0)
		month = 6;
	if (Ast_incmp(date, "JUL", 3) == 0)
		month = 7;
	if (Ast_incmp(date, "AUG", 3) == 0)
		month = 8;
	if (Ast_incmp(date, "SEP", 3) == 0)
		month = 9;
	if (Ast_incmp(date, "OCT", 3) == 0)
		month = 10;
	if (Ast_incmp(date, "NOV", 3) == 0)
		month = 11;
	if (Ast_incmp(date, "DEC", 3) == 0)
		month = 12;
	if (out_month != NULL)
		sprintf(out_month, "%02i", month);
	return month;
}
