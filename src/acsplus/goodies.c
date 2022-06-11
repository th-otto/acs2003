/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Useful goodies                                        */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "acsplus.h"
#include "country.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void read_multiline(char *dest, int16 len, char **from, int16 lines)
{
	*dest = '\0';
	
	while (lines-- > 0)
	{
		strncat(dest, *from, len);
		from++;
	}
}

/* -------------------------------------------------------------------------- */

void write_multiline(char *dest, int16 len, char **from, int16 lines)
{
	int slen;
	int16 offset;
	int copylen;
	int trylen;
	int tryoffset;
	char *ptr;
	char *destptr;
	
	destptr = dest;
	slen = (int)strlen(destptr);
	offset = lines * len - slen;
	do
	{
		if (len > slen)
		{
			copylen = slen;
		} else
		{
			copylen = len;
			trylen = copylen;
			tryoffset = offset;
			for (ptr = &destptr[copylen - 1]; trylen > 1 && tryoffset > 0; ptr--)
			{
				if (strchr(ACSblk->separator, *ptr) != NULL)
				{
					copylen = trylen;
					break;
				}
				trylen--;
				tryoffset--;
			}
		}
		if (copylen > 0)
			strncpy(*from, destptr, copylen);
		(*from)[copylen] = '\0';
		destptr += copylen;
		slen -= copylen;
		from++;
		--lines;
	} while (lines > 0);
}
