/******************************************************************************/
/*                                                                            */
/*                         KeyTab - Zeichensatzumwandlungen                   */
/*                                                                            */
/* Modul:   Bibliothek, die die Anbindung an KEYTAB von Pure-C aus erledigen  */
/*                                                                            */
/*          Library, which implements the connection to KEYTAB from Pure-C    */
/*                                                                            */
/* Dieses Programm ist incl. des Sources Freeware!                            */
/*                                                                            */
/* This Program is incl. the Source Freeware!                                 */
/*                                                                            */
/* Copyright (c)  1997-98 by Thomas Much, thomas@snailshell.de                */
/*                ab 2002   by Martin Elsaesser @ LL (martin@melsaesser.de)   */
/******************************************************************************/

/******************************************************************************/
/*                                                                            */
/* header files                                                               */
/*                                                                            */
/******************************************************************************/

#if 0
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#ifdef __PUREC__
#include <tos.h>
#else
#include <osbind.h>
#endif
#include <keytab.h>

#ifndef FALSE
#define FALSE 0
#define TRUE  1
#endif

#else
#include "acs_i.h"
#endif
#include <stddef.h>

#define kt_has(f) kt->size >= ((long)(offsetof(KEYT, f) + sizeof(void *)))

/******************************************************************************/
/*                                                                            */
/* Konstanten                                                                 */
/*                                                                            */
/******************************************************************************/

/******************************************************************************/
/*                                                                            */
/* Interne Funktionen zur Adressierung des CookieJar                          */
/*                                                                            */
/******************************************************************************/

typedef struct
{
	long id;
	long val;
} COOKJAR;

/******************************************************************************/
/*                                                                            */
/* Globale Funktionen                                                         */
/*                                                                            */
/******************************************************************************/

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Den Zeiger auf die KEYT-Struktur ermitteln                     */
/*                                                                            */
/*----------------------------------------------------------------------------*/

KEYT *Akt_getKeyTab(void)
{
	static KEYT *kt = NULL;

	/* Wurde der Zeiger bereits ermittelt? */
	if (kt == NULL)
	{
		/* Den Cookie auslesen */
		if (!Ash_getcookie(0x4B455954L, &kt) || kt->magic != 0x4B455954L)
			kt = NULL;
	}

	return kt;
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* Auskunfts-Funktionen ueber Filter                                          */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Die kleinste Nummer der Import-Filter (Unicode-Codierung)      */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short Akt_getExpMinNr(void)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(BlockUnicode2X))
		return kt->GetExpMinNr();
	else
		return 0;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Die groesste Nummer der Export-Filter ermitteln                */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short Akt_getExpMaxNr(void)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
		return kt->GetExpMaxNr();
	else
		return -1;
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* Funktion:   Die kleinste Nummer der Import-Filter (Unicode-Codierung)      */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

short Akt_getImpMinNr(void)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(BlockUnicode2X))
		return kt->GetImpMinNr();
	else
		return 0;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Die groesste Nummer der Import-Filter ermitteln                */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short Akt_getImpMaxNr(void)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
		return kt->GetImpMaxNr();
	else
		return -1;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Den Namen eines Export-Filters ermitteln                       */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_getExpNameFromNr(short nr)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
	{
		if (kt_has(GetImpNameFromNr))
			return kt->GetExpNameFromNr(nr);
		else
			return ((char *(*)(short, ...))(kt->resvd0))(nr, nr);
	} else
	{
		return NULL;
	}
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Den Namen eines Import-Filters ermitteln                       */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_getImpNameFromNr(short nr)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
	{
		if (kt_has(GetImpNameFromNr))
			return kt->GetImpNameFromNr(nr);
		else
			return ((char *(*)(short, ...))(kt->resvd1))(nr, nr);
	} else
	{
		return NULL;
	}
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Den kurzen Namen eines Export-Filters ermitteln                */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_getExpShortNameFromNr(short nr)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(GetImpShortNameFromNr))
		return kt->GetExpShortNameFromNr(nr);
	else
		return NULL;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Den kurzen Namen eines Import-Filters ermitteln                */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_getImpShortNameFromNr(short nr)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(GetImpShortNameFromNr))
		return kt->GetImpShortNameFromNr(nr);
	else
		return NULL;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Die Release-Nummer abfragen                                    */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short Akt_getRelease(void)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(GetImpIdFromNr))
		return kt->GetRelease();
	else
		return -1;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Anhand der ID einen Export-Filter bestimmen                    */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short Akt_getExpNrFromId(short eid)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
		return kt->GetExpNrFromId(eid);
	else
		return -1;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Anhand der ID einen Import-Filter bestimmen                    */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short Akt_getImpNrFromId(short iid)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
		return kt->GetImpNrFromId(iid);
	else
		return -1;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Zum angegebenen Export-Filter die best-moegliche ID liefern    */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short Akt_getExpIdFromNr(short enr)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(GetImpIdFromNr))
		return kt->GetExpIdFromNr(enr);
	else
		return -1;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Zum angegebenen Export-Filter die best-moegliche ID liefern    */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short Akt_getImpIdFromNr(short inr)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(GetImpIdFromNr))
		return kt->GetImpIdFromNr(inr);
	else
		return -1;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Anhand des Namens die Nummer des Export-Filter bestimmen       */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short Akt_getExpNrFromName(char *name)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(GetImpNrFromName))
		return kt->GetExpNrFromName(name);
	else
		return 0;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Anhand des Namens die Nummer des Import-Filter bestimmen       */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short Akt_getImpNrFromName(char *name)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(GetImpNrFromName))
		return kt->GetImpNrFromName(name);
	else
		return 0;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   KEYTAB nach dem Euro-Zeichen befragen                          */
/*                                                                            */
/*----------------------------------------------------------------------------*/

long Akt_getEuro(void)
{
	KEYT *kt = Akt_getKeyTab();
	long euro;

	/* Ggf. das Euro-Zeichen ermitteln */
	if (kt != NULL && kt_has(GetEuro))
		return kt->GetEuro();
	else if (Ash_getcookie(0x4555524FL, &euro))
		return euro;
	else
		return 0x000002ECl;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Informationen im short-Format zu einem Zeichensatz erfragen    */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short Akt_getInfoShort(short nr, short what, short *info)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(GetInfoShort))
	{
		return kt->GetInfoShort(nr, what, info);
	} else
	{
		/* compatibility-hack for old KEYTAB versions */
		switch (what)
		{
		case KT_SINFO_8BIT_ASK_MAX_SINFO:
			if (info != NULL)
				*info = -1;
			return TRUE;

		case KT_CINFO_8BIT_SHORTNAME:
			if (info != NULL)
				*info = -1;
			return TRUE;

		default:
			return FALSE;
		}
	}
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Informationen im String-Format zu einem Zeichensatz erfragen   */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short Akt_getInfoString(short nr, short what, char *info, short max_len)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(GetInfoString))
	{
		return kt->GetInfoString(nr, what, info, max_len);
	} else
	{
		char *string;

		/* compatibility-hack for old KEYTAB versions */
		switch (what)
		{
		case KT_CINFO_8BIT_LONGNAME:
			string = Akt_getExpNameFromNr(nr);
			break;

		case KT_CINFO_8BIT_SHORTNAME:
			string = Akt_getExpShortNameFromNr(nr);
			break;

		default:
			string = NULL;
			break;
		}

		/* Den String kopieren */
		if (string != NULL && info != NULL)
		{
			if (max_len > 0)
			{
				strncpy(info, string, max_len);
				info[max_len - 1] = '\0';
			} else
			{
				strcpy(info, string);
			}
		}

		return string != NULL ? 1 : 0;
	}
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*                                                                            */
/* Konvertieren von Zeichen und Strings                                       */
/*                                                                            */
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Zeichens in einen anderen Zeichensatz          */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char Akt_CharAtari2X(short nr, char ch)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
		return kt->CharAtari2X(nr, ch);
	else
		return ch;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Zeichens aus einem anderen Zeichensatz         */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char Akt_CharX2Atari(short nr, char ch)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
		return kt->CharX2Atari(nr, ch);
	else
		return ch;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Block in einen anderen Zeichensatz             */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_BlockAtari2X(char *dest_string, short nr, char *source_string, long len)
{
	KEYT *kt = Akt_getKeyTab();

	/* Den String ggf. kopieren */
	if (source_string != NULL && dest_string != source_string)
		memcpy(dest_string, source_string, len);

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
	{
		if (kt_has(BlockX2Atari))
		{
			kt->BlockAtari2X(nr, len, dest_string);
		} else
		{
			char *s_ptr;
			long i;

			for (s_ptr = dest_string, i = 0; i < len; i++, s_ptr++)
				*s_ptr = kt->CharAtari2X(nr, *s_ptr);
		}
	}

	return dest_string;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Blockes aus einem anderen Zeichensatz          */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_BlockX2Atari(char *dest_string, short nr, char *source_string, long len)
{
	KEYT *kt = Akt_getKeyTab();

	/* Den String ggf. kopieren */
	if (source_string != NULL && dest_string != source_string)
		memcpy(dest_string, source_string, len);

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
	{
		if (kt_has(BlockX2Atari))
		{
			kt->BlockX2Atari(nr, len, dest_string);
		} else
		{
			char *s_ptr;
			long i;

			for (s_ptr = dest_string, i = 0; i < len; i++, s_ptr++)
				*s_ptr = kt->CharX2Atari(nr, *s_ptr);
		}
	}

	return dest_string;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Strings in einen anderen Zeichensatz           */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_StringAtari2X(char *dest_string, short nr, char *source_string)
{
	return Akt_BlockAtari2X(dest_string, nr, source_string, strlen(source_string) + 1);
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Strings aus einem anderen Zeichensatz          */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_StringX2Atari(char *dest_string, short nr, char *source_string)
{
	return Akt_BlockX2Atari(dest_string, nr, source_string, strlen(source_string) + 1);
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Zeichens in Unicode                            */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short Akt_CharX2Unicode(short nr, char ch)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(CharUnicode2X))
		return kt->CharX2Unicode(nr, ch);
	else
		return ch;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Zeichens aus Unicode                           */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char Akt_CharUnicode2X(short nr, short unichar)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(CharUnicode2X))
		return kt->CharUnicode2X(nr, unichar);
	else
		return (unichar & 0x00FF);
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Block in Unicode                               */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short *Akt_BlockX2Unicode(short *unichar, short nr, char *x_chrs, long len)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
	{
		if (kt_has(CharUnicode2X))
		{
			kt->BlockX2Unicode(unichar, nr, x_chrs, len);
		} else
		{
			memset(unichar, 0, len * 2);
			return NULL;
		}
	}

	return unichar;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Blockes aus Unicode                            */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_BlockUnicode2X(char *x_chrs, short nr, short *unichar, long len)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
	{
		if (kt_has(CharUnicode2X))
			kt->BlockUnicode2X(x_chrs, nr, unichar, len);
		else
			return NULL;
	}

	return x_chrs;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Strings in Unicode                             */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short *Akt_StringX2Unicode(short *unichar, short nr, char *string)
{
	return Akt_BlockX2Unicode(unichar, nr, string, strlen(string) + 1);
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Zeichens in Unicode                            */
/*                                                                            */
/*----------------------------------------------------------------------------*/

long Akt_CharXUtf2Unicode(short nr, char *string, long len, short *read_chars)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(BlockUnicode2X))
	{
		return kt->CharXUtf2Unicode(nr, string, len, read_chars);
	} else
	{
		if (read_chars != NULL)
			*read_chars = 1;
		return Akt_CharX2Unicode(nr, *string);
	}
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Zeichens aus Unicode                           */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_CharUnicode2XUtf(short nr, long lunicode, char *result, short *used_chars)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL && kt_has(BlockUnicode2X))
	{
		return kt->CharUnicode2XUtf(nr, lunicode, result, used_chars);
	} else
	{
		/* Den Wert wie bisher auch konvertieren */
		if (used_chars != NULL)
			*used_chars = 1;
		if (result != NULL)
			result[0] = Akt_CharUnicode2X(nr, (short) (lunicode & 0xFFFF));
	}

	return result;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Block in Unicode                               */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short *Akt_BlockXUtf2Unicode(short *unichar, long *uni_len, short nr, char *x_chrs, long len)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
	{
		if (kt_has(BlockUnicode2X))
		{
			kt->BlockXUtf2Unicode(unichar, uni_len, nr, x_chrs, len);
		} else
		{
#if 0
			/* Wie bisher konvertieren */
			if (uni_len != NULL)
				*uni_len = len;
			return Akt_BlockX2Unicode(unichar, nr, x_chrs, len);
#else
			return NULL;
#endif
		}
	}

	return unichar;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Blockes aus Unicode                            */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_BlockUnicode2XUtf(char *x_chrs, long *str_len, short nr, short *unichar, long len)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
	{
		if (kt_has(BlockUnicode2X))
		{
			kt->BlockUnicode2XUtf(x_chrs, str_len, nr, unichar, len);
			return x_chrs;
		}
#if 0
		else
		{
			/* Wie bisher konvertieren */
			if (str_len != NULL)
				*str_len = len;
			return Akt_BlockUnicode2X(x_chrs, nr, unichar, len);
		}
#endif
	}

	return NULL;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Blockes ueber Unicode                          */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_BlockXUtf2U2XUtf(char *dest, long *dest_len, short dest_nr, char *source, long src_len, short src_nr)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
	{
		if (kt_has(BlockXUtf2U2XUtf))
		{
			kt->BlockXUtf2U2XUtf(dest, dest_len, dest_nr, source, src_len, src_nr);
			return dest;
		} else
		{
			/* Wie bisher konvertieren */
			if (dest_len != NULL)
				*dest_len = -1;
		}
	}

	return NULL;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Blockes - moeglichst direkt                    */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_BlockXUtf2XUtf(char *dest, long *dest_len, short dest_nr, char *source, long src_len, short src_nr)
{
	KEYT *kt = Akt_getKeyTab();

	/* Ggf. die Nummer ermitteln */
	if (kt != NULL)
	{
		if (kt_has(BlockXUtf2XUtf))
		{
			kt->BlockXUtf2XUtf(dest, dest_len, dest_nr, source, src_len, src_nr);
			return dest;
		} else
		{
			/* Wie bisher konvertieren */
			if (dest_len != NULL)
				*dest_len = -1;
		}
	}

	return NULL;
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Strings in Unicode                             */
/*                                                                            */
/*----------------------------------------------------------------------------*/

short *Akt_StringXUtf2Unicode(short *unichar, long *uni_len, short nr, char *string)
{
	return Akt_BlockXUtf2Unicode(unichar, uni_len, nr, string, strlen(string) + 1);
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Strings ueber Unicode                          */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_StringXUtf2U2XUtf(char *dest, long *dest_len, short dest_nr, char *source, short src_nr)
{
	return Akt_BlockXUtf2U2XUtf(dest, dest_len, dest_nr, source, strlen(source) + 1, src_nr);
}

/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Funktion:   Wandelung eines Strings in Unicode                             */
/*                                                                            */
/*----------------------------------------------------------------------------*/

char *Akt_StringXUtf2XUtf(char *dest, long *dest_len, short dest_nr, char *source, short src_nr)
{
	return Akt_BlockXUtf2XUtf(dest, dest_len, dest_nr, source, strlen(source) + 1, src_nr);
}

/******************************************************************************/
/*    ACS support for KEYTAB                                                  */
/******************************************************************************/

char *Akt_popExpName(int16 *width)
{
	int16 i;
	int16 maxexp;
	int16 w;
	char *str;
	char *name;

	maxexp = Akt_getExpMaxNr() + 1;
	str = Ax_malloc(maxexp * 40 + 1);
	if (str == NULL)
		return NULL;
	*str = '\0';
	for (w = i = 0; i < maxexp; i++)
	{
		name = Akt_getExpNameFromNr(i);
		strcat(str, " ");
		strcat(str, name);
		if (i < maxexp)
			strcat(str, " |");
		else
			strcat(str, " ");
		if (strlen(name) > w)
			w = (int) strlen(name);
	}
	if (width != NULL)
		*width = w + 2;
	return str;
}

/* -------------------------------------------------------------------------- */

char *Akt_popImpName(int16 *width)
{
	int16 i;
	int16 maximp;
	int16 w;
	char *str;
	char *name;

	maximp = Akt_getImpMaxNr() + 1;
	str = Ax_malloc(maximp * 40 + 1);
	if (str == NULL)
		return NULL;
	*str = '\0';
	for (w = i = 0; i < maximp; i++)
	{
		name = Akt_getImpNameFromNr(i);
		strcat(str, " ");
		strcat(str, name);
		if (i < maximp)
			strcat(str, " |");
		else
			strcat(str, " ");
		if (strlen(name) > w)
			w = (int) strlen(name);
	}
	if (width != NULL)
		*width = w + 2;
	return str;
}

/* -------------------------------------------------------------------------- */

int16 Akt_chooseExpNr(Awindow *win, int16 x, int16 y)
{
	char *str;
	char *sel;
	char *sep;
	int16 width;
	int16 nr;

	nr = -1;
	str = Akt_popExpName(&width);
	if (str == NULL)
		return -1;
	sel = Ame_strpopup(win, str, "", ACSblk->gl_wchar * width, x, y);
	if (sel != NULL)
	{
		sep = strchr(sel, '|');
		if (sep != NULL)
			*sep = '\0';
		Ast_alltrim(sel);
		nr = Akt_getExpNrFromName(sel);
	}
#if WITH_FIXES
	Ax_free(str);
#endif
	return nr;
}

/* -------------------------------------------------------------------------- */

int16 Akt_chooseImpNr(Awindow *win, int16 x, int16 y)
{
	char *str;
	char *sel;
	char *sep;
	int16 width;
	int16 nr;

	nr = -1;
	str = Akt_popImpName(&width);
	if (str == NULL)
		return -1;
	sel = Ame_strpopup(win, str, "", ACSblk->gl_wchar * width, x, y);
	if (sel != NULL)
	{
		sep = strchr(sel, '|');
		if (sep != NULL)
			*sep = '\0';
		Ast_alltrim(sel);
		nr = Akt_getImpNrFromName(sel);
	}
#if WITH_FIXES
	Ax_free(str);
#endif
	return nr;
}
