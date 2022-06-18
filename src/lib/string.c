/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      String functions                                      */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include <stdarg.h>

char null_string[] = "";

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

char *Ast_create(const char *parent)
{
	char *str;
	ssize_t len;
	
	if (parent != NULL && *parent != '\0')
	{
		len = strlen(parent) + 1;
		str = Ax_malloc(len);
		if (str == NULL)
			return NULL;
		memcpy(str, parent, len);
		return str;
	} else
	{
		return null_string;
	}
}

/* -------------------------------------------------------------------------- */

void Ast_delete(char *string)
{
	if (string != null_string)
		Ax_free(string);
}

/* -------------------------------------------------------------------------- */

char Ach_toupper(char ch)
{
	return nkc_toupper(ch);
}

/* -------------------------------------------------------------------------- */

char Ach_tolower(char ch)
{
	return nkc_tolower(ch);
}

/* -------------------------------------------------------------------------- */

char *Ast_toupper(char *string)
{
	char *ptr;
	
	if (string == NULL)
		string = null_string;
	if (string != NULL)
	{
		for (ptr = string; *ptr != '\0'; ptr++)
			*ptr = nkc_toupper(*ptr);
	}
	return string;
}

/* -------------------------------------------------------------------------- */

char *Ast_tolower(char *string)
{
	char *ptr;
	
	if (string == NULL)
		string = null_string;
	if (string != NULL)
	{
		for (ptr = string; *ptr != '\0'; ptr++)
			*ptr = nkc_tolower(*ptr);
	}
	return string;
}

/* -------------------------------------------------------------------------- */

char *Ast_ltrim(char *string)
{
	char *dest;
	char *ptr;
	
	if (string == NULL)
		string = null_string;
	for (ptr = string; *ptr != '\0' && Ach_isWhite(*ptr); )
		ptr++;
	if (*ptr != '\0' && ptr > string)
	{
		for (dest = string; *ptr != '\0'; ptr++, dest++)
			*dest = *ptr;
		*dest = '\0';
	}
	
	return string;
}

/* -------------------------------------------------------------------------- */

char *Ast_rtrim(char *string)
{
	char *ptr;
	
	if (string == NULL)
		string = null_string;
	for (ptr = string; *ptr != '\0'; )
		ptr++;
	ptr--;
	while (ptr > string && Ach_isWhite(*ptr))
		ptr--;
	if (ptr >= string)
	{
		if (*ptr != '\0' && !Ach_isWhite(*ptr))
		{
			*++ptr = '\0';
		} else
		{
			*ptr = '\0';
		}
	} else
	{
		*string = '\0';
	}
	
	return string;
}

/* -------------------------------------------------------------------------- */

char *Ast_alltrim(char *string)
{
	if (string != NULL)
		return Ast_rtrim(Ast_ltrim(string));
	return null_string;
}

/* -------------------------------------------------------------------------- */

int16 Ast_cmp(const char *str_1, const char *str_2)
{
	const char *ptr_1;
	const char *ptr_2;

	if (str_1 == NULL)
		str_1 = null_string;
	if (str_2 == NULL)
		str_2 = null_string;
	for (ptr_1 = str_1, ptr_2 = str_2; *ptr_1 != '\0' && *ptr_2 != '\0'; ptr_1++, ptr_2++)
	{
		if (*ptr_1 != *ptr_2)
		{
			return *ptr_1 > *ptr_2 ? 1 : -1;
		}
	}
	if (*ptr_1 > *ptr_2)
		return 1;
	if (*ptr_1 < *ptr_2)
		return -1;
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Ast_icmp(const char *str_1, const char *str_2)
{
	char c1;
	char c2;
	const char *ptr_1;
	const char *ptr_2;

	if (str_1 == NULL)
		str_1 = null_string;
	if (str_2 == NULL)
		str_2 = null_string;
	for (ptr_1 = str_1, ptr_2 = str_2; *ptr_1 != '\0' && *ptr_2 != '\0'; ptr_1++, ptr_2++)
	{
		c1 = nkc_toupper(*ptr_1);
		c2 = nkc_toupper(*ptr_2);
		if (c1 != c2)
		{
			return c1 > c2 ? 1 : -1;
		}
	}
	if (*ptr_1 > *ptr_2)
		return 1;
	if (*ptr_1 < *ptr_2)
		return -1;
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Ast_ncmp(const char *str_1, const char *str_2, int16 max_char)
{
	int16 i;
	const char *ptr_1;
	const char *ptr_2;

	if (str_1 == NULL)
		str_1 = null_string;
	if (str_2 == NULL)
		str_2 = null_string;
	i = 0;
	for (ptr_1 = str_1, ptr_2 = str_2; *ptr_1 != '\0' && *ptr_2 != '\0' && i < max_char; ptr_1++, ptr_2++, i++)
	{
		if (*ptr_1 != *ptr_2)
		{
			return *ptr_1 > *ptr_2 ? 1 : -1;
		}
	}
	return i >= max_char ? 0 :
		*ptr_1 > *ptr_2 ? 1 :
		*ptr_1 < *ptr_2 ? -1 : 0;
}

/* -------------------------------------------------------------------------- */

int16 Ast_incmp(const char *str_1, const char *str_2, int16 max_char)
{
	char c1;
	char c2;
	int16 i;
	const char *ptr_1;
	const char *ptr_2;

	if (str_1 == NULL)
		str_1 = null_string;
	if (str_2 == NULL)
		str_2 = null_string;
	i = 0;
	for (ptr_1 = str_1, ptr_2 = str_2; *ptr_1 != '\0' && *ptr_2 != '\0' && i < max_char; ptr_1++, ptr_2++, i++)
	{
		c1 = nkc_toupper(*ptr_1);
		c2 = nkc_toupper(*ptr_2);
		if (c1 != c2)
		{
			return c1 > c2 ? 1 : -1;
		}
	}
	return i >= max_char ? 0 :
		*ptr_1 > *ptr_2 ? 1 :
		*ptr_1 < *ptr_2 ? -1 : 0;
}

/* -------------------------------------------------------------------------- */

char *Ast_istr(const char *s, const char *wanted)
{
	const char *scan;
	boolean found;
	int16 maxpos;
	int16 len;
	int16 i;
	
	if (s == NULL)
		s = null_string;
	if (wanted == NULL)
		wanted = null_string;
	len = (int16)strlen(wanted);
	maxpos = (int16)strlen(s) - (int16)strlen(wanted) + 1;
	for (scan = s, found = FALSE, i = 0; !found && i < maxpos && *scan != '\0'; scan++, i++)
		found = Ast_incmp(scan, wanted, len) == 0;
	if (found)
		return (char *)NO_CONST(scan);
	return NULL;
}

/* -------------------------------------------------------------------------- */

boolean Ach_isWhite(char c)
{
	return c != '\0' && strchr(" \t\n\r", c) != NULL;
}

/* -------------------------------------------------------------------------- */

boolean Ast_isEmpty(const char *string)
{
	const char *ptr;
	
	for (ptr = string; ptr != NULL && *ptr != '\0' && Ach_isWhite(*ptr); )
		ptr++;
	return ptr == NULL || *ptr == '\0' || Ach_isWhite(*ptr);
}

/* -------------------------------------------------------------------------- */

char *Ast_add(int16 anzahl, char *ergebnis, ...)
{
	va_list args;
	int16 i;
	char *str;
	char *res;
	ssize_t slen;
	ssize_t alloc_len;
	
	res = NULL;
	alloc_len = -1;
	if (ergebnis == NULL)
		return null_string;
	va_start(args, ergebnis);
	*ergebnis = '\0';
	for (i = 0; i < anzahl; i++)
	{
		str = va_arg(args, char *);
		if (str != NULL && *str != '\0')
		{
			slen = strlen(str);
			if (slen > alloc_len)
			{
				if (res != NULL)
					Ax_free(res);
				res = Ax_malloc(slen + 1);
				alloc_len = slen;
				if (res == NULL)
					return ergebnis;
			}
			strcpy(res, str);
			Ast_alltrim(res);
			strcat(ergebnis, res);
		}
	}
	if (res != NULL)
		Ax_free(res);
	return Ast_alltrim(ergebnis);
}

/* -------------------------------------------------------------------------- */

char *Ast_adl(char *string, ssize_t len)
{
	ssize_t slen;
	
#if WITH_FIXES
	if (string == NULL)
		return NULL;
	slen = strlen(string);
#else
	slen = strlen(string);
	if (string == NULL)
		return NULL; /* BUG: too late */
#endif
	if (slen < len)
		memset(string + slen, ' ', len - slen);
	string[len] = '\0';
	return string;
}

/* -------------------------------------------------------------------------- */

char *Ast_adr(char *string, ssize_t len)
{
	ssize_t slen;
	
#if WITH_FIXES
	if (string == NULL)
		return NULL;
	slen = strlen(string);
#else
	slen = strlen(string);
	if (string == NULL)
		return NULL; /* BUG: too late */
#endif
	if (slen < len)
	{
		memmove(string + (len - slen), string, slen);
		memset(string, ' ', len - slen);
	}
	string[len] = '\0';
	return string;
}

/* -------------------------------------------------------------------------- */

char *Ast_adc(char *string, ssize_t len)
{
	ssize_t slen;
	ssize_t fill;
	
	if (string == NULL)
		return NULL;
	slen = strlen(string);
	fill = len - slen;
	if (fill > 0)
	{
		Ast_adl(string, fill >> 1);
		Ast_adr(string, (fill >> 1) + (fill & 1));
	}
	string[len] = '\0';
	return string;
}

/* -------------------------------------------------------------------------- */

char *Ast_filter(char *string, const char *wrong_char, const char *right_char)
{
	char *s1;
	char *s2;
	
	if (string == NULL || (wrong_char == NULL && right_char == NULL))
		return NULL;
	for (s1 = s2 = string; *s1 != '\0' && *s2 != '\0'; s1++, s2++)
	{
		while (wrong_char != NULL && *s1 != '\0' && strchr(wrong_char, *s1) != NULL)
			s1++;
		while (right_char != NULL && *s1 != '\0' && strchr(right_char, *s1) == NULL)
			s1++;
		if (s1 != s2)
			*s2 = *s1;
	}
	*s2 = '\0';
	return string;
}

/* -------------------------------------------------------------------------- */

int32 Ast_count(const char *string, const char *zeichen)
{
	int32 count;
	const char *ptr;
	
	if (string == NULL)
		string = null_string;
	for (count = 0, ptr = string; *ptr != '\0'; ptr++)
		if (strchr(zeichen, *ptr) != NULL)
			count++;
	return count;
}

/* -------------------------------------------------------------------------- */

static boolean strfsearchafterwc(const char **filename1, const char **filename2, const char *wildany, const char *wildsingle)
{
	size_t l2;
	size_t l1;
	size_t l3;
	char *ptr;
	char *pend;
	char savec;
	
	if (strchr(wildsingle, **filename2) != NULL)
	{
		++(*filename2);
		++(*filename1);
		return TRUE;
	}
	while (**filename2 != '\0' && strchr(wildany, **filename2) != NULL)
		++(*filename2);
	if (**filename2 == '\0')
	{
		while (**filename1 != '\0')
			++(*filename1);
		return TRUE;
	} else
	{
		l1 = strcspn(*filename2, wildany);
		l2 = strcspn(*filename2, wildsingle);
		l3 = l1 < l2 ? l1 : l2;
		pend = (char *)NO_CONST(*filename2) + l3;
		savec = *pend;
		*pend = '\0';
		ptr = strstr(*filename1, *filename2);
		*pend = savec;
		*filename2 = pend;
		if (ptr == NULL)
			return FALSE;
		*filename1 = *filename1 + l3;
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

int16 Ast_fcmp(const char *filename1, const char *filename2)
{
	char wildany[] = "*";
	char wildsingle[] = "?";
	struct {
		boolean wildsingle1;
		boolean wildsingle2;
		boolean wildany1;
		boolean wildany2;
	} b;
	struct {
		boolean wildc1;
		boolean wildc2;
	} b3;
	struct
	{
		boolean thisany1;
		boolean thisany2;
	} b2;
	struct {
		boolean thissingle1;
		boolean thissingle2;
	} b4;
	size_t len1;
	size_t len2;
	const char *ptr1;
	const char *ptr2;
	
	if (Ast_isEmpty(filename1) || Ast_isEmpty(filename2))
		return FALSE;
	
	len1 = strlen(filename1);
	len2 = strlen(filename2);
	b.wildany1 = strcspn(filename1, wildany) != len1;
	b.wildany2 = strcspn(filename2, wildany) != len2;
	b.wildsingle1 = strcspn(filename1, wildsingle) != len1;
	b.wildsingle2 = strcspn(filename2, wildsingle) != len2;
	if (b.wildany2 || b.wildsingle2)
		return FALSE;
	for (ptr1 = filename1, ptr2 = filename2; *ptr1 && *ptr2; )
	{
		b2.thisany1 = strchr(wildany, *ptr1) != NULL;
		b2.thisany2 = strchr(wildany, *ptr2) != NULL;
		b4.thissingle1 = strchr(wildsingle, *ptr1) != NULL;
		b4.thissingle2 = strchr(wildsingle, *ptr2) != NULL;
		b3.wildc1 = b2.thisany1 || b4.thissingle1;
		b3.wildc2 = b2.thisany2 || b4.thissingle2;
		
		if (!b3.wildc1 && !b3.wildc2)
		{
			if (*ptr1 != *ptr2)
				return FALSE;
			++ptr1;
			++ptr2;
		} else if (b4.thissingle1 && b4.thissingle2)
		{
			++ptr1;
			++ptr2;
		} else
		{
			if (b3.wildc1 && !b3.wildc2)
			{
				if (!strfsearchafterwc(&ptr2, &ptr1, wildany, wildsingle))
					return FALSE;
			}
			if (b3.wildc2 && !b3.wildc1)
			{
				if (!strfsearchafterwc(&ptr1, &ptr2, wildany, wildsingle))
					return FALSE;
			}
		}
	}
	return *ptr1 == *ptr2;
}

/* -------------------------------------------------------------------------- */

int16 Ast_countASCIZZ(const char *asciizz)
{
	const char *ptr;
	int16 count;
	
	ptr = asciizz;
	count = 0;
	do
	{
		count++;
		ptr += strlen(ptr) + 1;
	} while (*ptr != '\0');
	return count;
}

/* -------------------------------------------------------------------------- */

boolean Ast_splitASCIIZZ(const char *ascizz, char ***strings, int16 *anz)
{
	int16 count;
	const char *ptr;
	char **arr;
	
	*anz = Ast_countASCIZZ(ascizz);
	*strings = arr = Ax_malloc(*anz * sizeof(*arr));
	if (arr == NULL)
		return FALSE;
	ptr = ascizz;
	for (count = 0; count < *anz; count++, arr++)
	{
		*arr = Ast_create(ptr);
		ptr += strlen(ptr) + 1;
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

char *Ast_mergeASCIIZZ(const char **strings, int16 anzahl, int16 global)
{
	int16 i;
	char *ptr;
	const char *str;
	char c;
	ssize_t len;
	char *dest;
	
	for (len = 2, i = 0; i < anzahl; i++)
	{
		if (strings[i] != NULL)
		{
			if (strings[i][0] == '\0')
			{
				len += 2;
			} else if (strchr("\001\002\003\004\005\006", strings[i][0]) == NULL)
			{
				len += strlen(strings[i]) + 1;
			} else
			{
				switch (strings[i][0])
				{
				case '\001':
				case '\002':
					len += strlen(strings[i]) * 2 + 2;
					break;
				default:
					len += 2;
					break;
				}
			}
		}
	}
	
	if (global)
		dest = Ax_glmalloc(len);
	else
		dest = Ax_malloc(len);
	if (dest == NULL)
		return NULL;
	memset(dest, 0, len);
	for (i = 0, ptr = dest; i < anzahl; i++, ptr += strlen(ptr) + 1)
	{
		if (strings[i] != NULL)
		{
			if (strings[i][0] == '\0')
			{
				strcpy(ptr, "\001");
			} else if (strchr("\001\002\003\004\005\006", strings[i][0]) == NULL)
			{
				strcpy(ptr, strings[i]);
			} else
			{
				switch (strings[i][0])
				{
				case '\001':
				case '\002':
					*ptr++ = '\002';
					str = strings[i];
					while (*str != '\0')
					{
						c = *str >> 4;
						if (c > 9)
							*ptr++ = c + '0';
						else
							*ptr++ = c + 'A';
						c = *str & 0x0f;
						if (c > 9)
							*ptr++ = c + '0';
						else
							*ptr++ = c + 'A';
						str++;
					}
					break;
				default:
					break;
				}
			}
		}
	}
	return dest;
}

/* -------------------------------------------------------------------------- */

void Ast_deleteAry(char **strings, int16 anzahl)
{
	int16 i;
	char **ptr;
	
	for (i = 0, ptr = strings; i < anzahl; i++, ptr++)
		Ast_delete(*ptr);
	Ax_free(strings);
}

/* -------------------------------------------------------------------------- */

char *Ast_copy(const char *str, boolean global)
{
	ssize_t len;
	char *ptr;
	
	if (str == NULL)
		str = null_string;
	len = strlen(str);
	ptr = global ? Ax_glmalloc(len + 1) : Ax_malloc(len + 1);
	if (ptr == NULL)
		return NULL;
	return strcpy(ptr, str == NULL ? "" : str);
}

/* -------------------------------------------------------------------------- */

char *Ast_reverse(char *reverse, const char *string)
{
	char *dst;
	const char *src;
	
	if (string == NULL)
		string = null_string;
	for (src = string; *src != '\0'; )
		src++;
	dst = reverse;
	src--;
	while (src >= string)
	{
		*dst = *src;
		src--;
		dst++;
	}
	*dst = '\0';
	return reverse;
}
