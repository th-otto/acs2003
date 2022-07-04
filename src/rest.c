#include "acs_i.h"
#include "acsplus.h"
#include "lib/messages/msgserv.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/* -------------------------------------------------------------------------- */

void Aus_boxed(void)
{
}

/* -------------------------------------------------------------------------- */

void Aus_objboxed(Awindow *win, OBJECT *tree, int16 obnr)
{
}

/* -------------------------------------------------------------------------- */

boolean Auo_boxed(OBJECT *entry, int16 task, void *in_out)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_boxed(PARMBLK *pb)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aud_boxed(void)
{
}

/* -------------------------------------------------------------------------- */

int16 Awi_keys(Awindow *window, int16 kstate, int16 key)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_sendkey(Awindow *wi, int16 kstate, int16 key)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_nokey(Awindow *wi, int16 kstate, int16 key)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aob_within(const Axywh* rect, int16 x, int16 y)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 alert_str(const char* alert, const char* para)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Act_save(CONTEXT *ctx)
{
}

/* -------------------------------------------------------------------------- */

void Act_restore(CONTEXT *ctx)
{
}

/* -------------------------------------------------------------------------- */

boolean A_isModDia(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 A_dialog(OBJECT *dia)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 A_dialog2(OBJECT *dia)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean intersect(Axywh* to, const Axywh* from)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void xywh2array(int16 *to, const Axywh *from)
{
}

/* -------------------------------------------------------------------------- */

void array2xywh(Axywh *to, const int16 *from)
{
}

/* -------------------------------------------------------------------------- */

void Ascrp_clear(const char *ext)
{
}

/* -------------------------------------------------------------------------- */

int16 Ascrp_get(const char *ext, void **buffer, ssize_t *len)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean a_dialog_active;

boolean Ascrp_put (const char *ext, void *buffer, long len, boolean append)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Adate_ymd2dow(void)
{
}

/* -------------------------------------------------------------------------- */

int16 Adate_getMonth(const char *date, char *out_month)
{
	return 0;
}

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
