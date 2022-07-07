#include "acs_i.h"
#include "acsplus.h"
#include "lib/messages/msgserv.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/* -------------------------------------------------------------------------- */

void Ash_printSetIcon(CICONBLK *icon, int16 ghost)
{
}

/* -------------------------------------------------------------------------- */

int16 Ash_print(PRN_SETTINGS *setting, int16 x, int16 y, int16 option, const char *title, Awindow *window)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

Awindow PrintSelWind;

/* -------------------------------------------------------------------------- */

void Ash_fontSetIcon(CICONBLK *icon, int16 ghost)
{
}

/* -------------------------------------------------------------------------- */

int16 Ash_font(const char *title, int16 x, int16 y, int16 font_flag,
         int16 button_flag, A_FontSel *font, const char *sample, const char *opt_button,
         A_FontFkt set, A_FontFkt mark, A_FontFkt opt, void *para, Awindow *window)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

Awindow FontSelWind;

/* -------------------------------------------------------------------------- */

ULinList *Alu_create(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Alu_delete(ULinList *liste)
{
}

/* -------------------------------------------------------------------------- */

int16 Alu_ptrCmp(void *para, void *elem)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Alu_longCmp(void *para, void *elem)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Alu_intCmp(void *para, void *elem)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Alu_charCmp(void *para, void *elem)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Alu_strCmp(void *para, void *elem)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Alu_striCmp(void *para, void *elem)
{
	return 0;
}
