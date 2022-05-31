/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Translate key strings to codes                        */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

typedef struct {
	const char *string;
	int16 code;
} sc;

static sc nktab[] = {
	{ "BS", NK_BS },
	{ "CLR", NK_CLRHOME },
	{ "DEL", NK_DEL },
	{ "DOWN", NK_DOWN },
	{ "ENTER", NK_ENTER },
	{ "ESC", NK_ESC },
	{ "F1", NK_F1 },
	{ "F10", NK_F10 },
	{ "F2", NK_F2 },
	{ "F3", NK_F3 },
	{ "F4", NK_F4 },
	{ "F5", NK_F5 },
	{ "F6", NK_F6 },
	{ "F7", NK_F7 },
	{ "F8", NK_F8 },
	{ "F9", NK_F9 },
	{ "HELP", NK_HELP },
	{ "HOME", NK_CLRHOME },
	{ "INS", NK_INS },
	{ "LEFT", NK_LEFT },
	{ "RET", NK_RET },
	{ "RETURN", NK_RET },
	{ "RIGHT", NK_RIGHT },
	{ "TAB", NK_TAB },
	{ "UNDO", NK_UNDO },
	{ "UP", NK_UP }
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static int comp(const void *key, const void *entry)
{
	return strcmp(key, ((const sc *)entry)->string);
}

/* -------------------------------------------------------------------------- */

int16 key_code(const char *str)
{
	int16 key;
	sc *sc;
	
	key = 0;
	--str;
	for (;;)
	{
		++str;
		if (*str == ALT_C)
			key |= NKF_FUNC | NKF_ALT;
		else if (*str == SHIFT_C)
			key |= NKF_LSH | NKF_RSH;
		else if (*str == CONTROL_C)
			key |= NKF_FUNC | NKF_CTRL;
		else
			break;
	}
	if ((sc = bsearch(str, nktab, sizeof(nktab) / sizeof(nktab[0]), sizeof(nktab[0]), comp)) == NULL)
	{
		if ((unsigned char)*str >= ' ' && (str[1] == '\0' || str[1] == ' '))
			return (unsigned char)*str | key;
		return 0;
	}
	return key | sc->code | NKF_FUNC;
}

/* -------------------------------------------------------------------------- */

char *key_string(int16 key)
{
	static char string[32];
	int i;
	int len;
	
	string[0] = '\0';
	if (key & (NKF_LSH|NKF_RSH))
		strcat(string, SHIFT_S);
	if (key & NKF_CTRL)
		strcat(string, CONTROL_S);
	if (key & NKF_ALT)
		strcat(string, ALT_S);
	len = (int)strlen(string);
	for (i = 0; i < (int)(sizeof(nktab) / sizeof(nktab[0])); i++)
	{
		if ((char)nktab[i].code == (char)key)
		{
			return strcat(string, nktab[i].string);
		}
	}
	if ((0xff & key) >= ' ')
	{
		string[len++] = key;
	}
	string[len] = '\0';
	return string;
}
