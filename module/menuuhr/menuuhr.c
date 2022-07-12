#include <stdio.h>
#include <string.h>
#include "acs.h"
#include "../src/country.h"

#ifndef UNUSED
# define UNUSED(x) ((void)(x))
#endif

static int16 offset = 0;

static const char *const weekday_names[] = {
	"Son",
	"Mon",
	"Di",
	"Mit",
	"Don",
	"Fr",
	"Sam"
};

static const char *const digits[] = {
	"Null",
	"Eins",
	"Zwei",
	"Drei",
	"Vier",
	"F\201nf",
	"Sechs",
	"Sieben",
	"Acht",
	"Neun",
	"Zehn",
	"Elf",
	"Zw\224lf",
	"Eins"
};

#define T_FUZZ_0  "Punkt %s Uhr"
#define T_FUZZ_1  "kurz nach %s"
#define T_FUZZ_2  "%d nach %s"
#define T_FUZZ_3  "kurz vor Viertel-%s"
#define T_FUZZ_4  "Viertel-%s"
#define T_FUZZ_5  "kurz nach Viertel-%s"
#define T_FUZZ_6  "%d vor Halb-%s"
#define T_FUZZ_7  "kurz vor Halb-%s"
#define T_FUZZ_8  "Halb-%s"
#define T_FUZZ_9  "kurz nach Halb-%s"
#define T_FUZZ_10 "%d nach Halb-%s"
#define T_FUZZ_11 "kurz vor Dreiviertel-%s"
#define T_FUZZ_12 "Dreiviertel-%s"
#define T_FUZZ_13 "kurz nach Dreiviertel-%s"
#define T_FUZZ_14 "%d vor %s"
#define T_FUZZ_15 "kurz vor %s"
#define T_FUZZ_16 "Punkt %s Uhr"

static long timer1;
static long timer2;
static int16 timelen;
static uint16 lastmin;
static uint16 lasthour;
static char buf[256];
static void (*acstimer)(void);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static long get_hz200(void)
{
	return *((long *)0x4ba);
}

/* -------------------------------------------------------------------------- */

static int16 dayofweek(int16 day, int16 month, int16 year)
{
	int16 hundreds;
	int16 centuries;
	
	if (month > 2)
	{
		month -= 2;
	} else
	{
		month += 10;
		year--;
	}
	hundreds = year % 100;
	centuries = year / 100;
	year = centuries;
	return ((month * 13 - 1) / 5 + day + hundreds + hundreds / 4 + year / 4 + -(year * 2)) % 7;
}

/* -------------------------------------------------------------------------- */

static void menuuhr_timer(void)
{
	uint16 time;
	uint16 min;
	uint16 hour;
	uint16 date;
	uint16 day;
	uint16 month;
	uint16 year;
	int len;
	char display[16] = "";
	int16 dummy;
	
	timer2 = Supexec(get_hz200);
	if (timer2 - timer1 >= 200)
	{
		timer1 = timer2;
		time = Tgettime();
		min = (time >> 5) & 0x3f;
		hour = (time >> 11) & 0x1f;
		if (lastmin != min || lasthour != hour)
		{
			lastmin = min;
			lasthour = hour;
			date = Tgetdate();
			day = date & 0x1f;
			month = (date >> 5) & 0x0f;
			year = ((date >> 9) & 0x7f) + 1980;
			if (hour > 12)
				hour -= 12;
			switch (min)
			{
			case 0:
			case 1:
				len = sprintf(buf, T_FUZZ_0, digits[hour]);
				break;
			case 2:
			case 3:
			case 4:
			case 5:
				len = sprintf(buf, T_FUZZ_1, digits[hour]);
				break;
			case 6:
			case 7:
			case 8:
			case 9:
				len = sprintf(buf, T_FUZZ_2, min, digits[hour]);
				break;
			case 10:
			case 11:
			case 12:
			case 13:
				len = sprintf(buf, T_FUZZ_3, digits[hour + 1]);
				break;
			case 14:
			case 15:
			case 16:
				len = sprintf(buf, T_FUZZ_4, digits[hour + 1]);
				break;
			case 17:
			case 18:
			case 19:
			case 20:
				len = sprintf(buf, T_FUZZ_5, digits[hour + 1]);
				break;
			case 21:
			case 22:
			case 23:
			case 24:
				len = sprintf(buf, T_FUZZ_6, 30 - min, digits[hour + 1]);
				break;
			case 25:
			case 26:
			case 27:
			case 28:
				len = sprintf(buf, T_FUZZ_7, digits[hour + 1]);
				break;
			case 29:
			case 30:
			case 31:
				len = sprintf(buf, T_FUZZ_8, digits[hour + 1]);
				break;
			case 32:
			case 33:
			case 34:
			case 35:
				len = sprintf(buf, T_FUZZ_9, digits[hour + 1]);
				break;
			case 36:
			case 37:
			case 38:
			case 39:
				len = sprintf(buf, T_FUZZ_10, min - 30, digits[hour + 1]);
				break;
			case 40:
			case 41:
			case 42:
			case 43:
				len = sprintf(buf, T_FUZZ_11, digits[hour + 1]);
				break;
			case 44:
			case 45:
			case 46:
				len = sprintf(buf, T_FUZZ_12, digits[hour + 1]);
				break;
			case 47:
			case 48:
			case 49:
			case 50:
				len = sprintf(buf, T_FUZZ_13, digits[hour + 1]);
				break;
			case 51:
			case 52:
			case 53:
			case 54:
				len = sprintf(buf, T_FUZZ_14, 60 - min, digits[hour + 1]);
				break;
			case 55:
			case 56:
			case 57:
			case 58:
				len = sprintf(buf, T_FUZZ_15, digits[hour + 1]);
				break;
			case 59:
				len = sprintf(buf, T_FUZZ_16, digits[hour + 1]);
				break;
#ifdef __GNUC__
			default:
				return;
#endif
			}
			timelen = len + sprintf(buf + len, "\372\372%s:%d.%d.", weekday_names[dayofweek(day, month, year)], day, month);
			strcpy(&buf[timelen], "\372\372");
			strncat(&buf[timelen + 2], buf, timelen);
		}
		
		if (offset > (timelen + 1))
			offset = 0;
		strncat(display, &buf[offset], 15);
		offset++;
		vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
		vst_alignment(ACSblk->vdi_handle, TA_LEFT, TA_TOP, &dummy, &dummy);
		vst_rotation(ACSblk->vdi_handle, 0);
		vst_font(ACSblk->vdi_handle, ACSblk->fontid);
		vst_height(ACSblk->vdi_handle, ACSblk->fheight, &dummy, &dummy, &dummy, &dummy);
		vst_effects(ACSblk->vdi_handle, 0);
		vst_color(ACSblk->vdi_handle, G_BLACK);
		Amo_hide();
		v_gtext(ACSblk->vdi_handle, ACSblk->desk.x + ACSblk->desk.w - 15 * ACSblk->gl_wbox, 1, display);
		Amo_show();
		acstimer();
	}
}

/* -------------------------------------------------------------------------- */

int16 ACSinit(void)
{
	timer1 = timer2 = 0;
	lastmin = lasthour = 0;
	acstimer = ACSblk->ACStimer;
	ACSblk->ACStimer = menuuhr_timer;
	return OK;
}
