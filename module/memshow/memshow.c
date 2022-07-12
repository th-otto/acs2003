#include "acs.h"
#include "../src/country.h"
#include "acs230.h"

#ifndef UNUSED
# define UNUSED(x) ((void)(x))
#endif

#if COUNTRY == COUNTRY_DE
static char TEXT_001[] = "KByte";
static char TEXT_002[] = "CoreLeft:";
static char TEXT_003[] = "1. Block:";
static char TEXT_004[] = "12345678";
static char TEXT_005[] = "Summe:";
static char TEXT_006[] = "2. Block:";
static char TEXT_007[] = "3. Block:";
static char TEXT_008[] = "4. Block:";
static char TEXT_009[] = "";
static char TEXT_010[] = " Memory-Anzeige ";
#endif

#if COUNTRY == COUNTRY_US
static char TEXT_001[] = "KByte";
static char TEXT_002[] = "CoreLeft:";
static char TEXT_003[] = "1. Block:";
static char TEXT_004[] = "12345678";
static char TEXT_005[] = "Summe:";
static char TEXT_006[] = "2. Block:";
static char TEXT_007[] = "3. Block:";
static char TEXT_008[] = "4. Block:";
static char TEXT_009[] = "";
static char TEXT_010[] = " Memory-Display ";
#endif

static AUSERBLK230 USERBLK01 = { A_3Dbutton, 0x29019178L, Auo_string, NULL, NULL, NULL };

#define MEMBOX    7
#define CORELEFT  8
#define BLOCK1    9
#define BLOCK2   10
#define BLOCK3   11
#define BLOCK4   12
#define TOTAL    13

static struct {
	OBJECT root;
	OBJECT str1;
	OBJECT str2;
	OBJECT str3;
	OBJECT str4;
	OBJECT str5;
	OBJECT str6;
	OBJECT box1;
	OBJECT coreleft;
	OBJECT block1;
	OBJECT block2;
	OBJECT block3;
	OBJECT block4;
	OBJECT total;
	OBJECT str7;
	OBJECT str8;
	OBJECT str9;
	OBJECT str10;
	OBJECT str11;
	OBJECT str12;
} memshow = {
	{ -1,  1, 19, G_USERDEF, 0x0040, 0x0000, C_UNION(&USERBLK01), 0, 0, 26, 8 },
	{  2, -1, -1, G_STRING, 0x0040, 0x0000, C_UNION(TEXT_002), 1, 1, 9, 1 },
	{  3, -1, -1, G_STRING, 0x0040, 0x0000, C_UNION(TEXT_003), 1, 2, 9, 1 },
	{  4, -1, -1, G_STRING, 0x0040, 0x0000, C_UNION(TEXT_006), 1, 3, 9, 1 },
	{  5, -1, -1, G_STRING, 0x0040, 0x0000, C_UNION(TEXT_007), 1, 4, 9, 1 },
	{  6, -1, -1, G_STRING, 0x0040, 0x0000, C_UNION(TEXT_008), 1, 5, 9, 1 },
	{  7, -1, -1, G_STRING, 0x0040, 0x0000, C_UNION(TEXT_005), 4, 6, 6, 1 },
	{ 14,  8, 13, G_BOX, 0x0040, 0x0000, C_UNION(0x00001101L), 11, 1, 8, 6 },
	{  9, -1, -1, G_STRING, 0x0000, 0x0000, C_UNION(TEXT_004), 0, 0, 8, 1 },
	{ 10, -1, -1, G_STRING, 0x0000, 0x0000, C_UNION(TEXT_004), 0, 1, 8, 1 },
	{ 11, -1, -1, G_STRING, 0x0000, 0x0000, C_UNION(TEXT_004), 0, 2, 8, 1 },
	{ 12, -1, -1, G_STRING, 0x0000, 0x0000, C_UNION(TEXT_004), 0, 3, 8, 1 },
	{ 13, -1, -1, G_STRING, 0x0000, 0x0000, C_UNION(TEXT_004), 0, 4, 8, 1 },
	{  7, -1, -1, G_STRING, 0x0000, 0x0000, C_UNION(TEXT_004), 0, 5, 8, 1 },
	{ 15, -1, -1, G_STRING, 0x0040, 0x0000, C_UNION(TEXT_001), 20, 1, 5, 1 },
	{ 16, -1, -1, G_STRING, 0x0040, 0x0000, C_UNION(TEXT_001), 20, 2, 5, 1 },
	{ 17, -1, -1, G_STRING, 0x0040, 0x0000, C_UNION(TEXT_001), 20, 3, 5, 1 },
	{ 18, -1, -1, G_STRING, 0x0040, 0x0000, C_UNION(TEXT_001), 20, 4, 5, 1 },
	{ 19, -1, -1, G_STRING, 0x0040, 0x0000, C_UNION(TEXT_001), 20, 5, 5, 1 },
	{  0, -1, -1, G_STRING, 0x0060, 0x0000, C_UNION(TEXT_001), 20, 6, 5, 1 }
};

static Awindow *memshow_create(void *para);
static boolean memshow_service(Awindow *self, int16 task, void *in_out);
static void memshow_update(Awindow *self);

static Awindow23x memwshow_win = {
	NULL,
	memshow_service,
	memshow_create,
	Awi_open,
	Awi_init,
	&memshow.root,
	NULL,
	0, 0,
	-1,
	NAME | CLOSER | MOVER,
	{ 0, 0, 120, 50 },
	{ 0, 0, 0, 0 },
	{ 0, 0, 0, 0 },
	{ -1, -1, -1, -1 },
	0, 0,
	0xf0f0,
	TEXT_010,
	TEXT_009,
	10000,
	AW_ICON | AW_GHOSTICON,
	0,
	-1,
	NULL,
	NULL,
	Awi_keys,
	Awi_obchange,
	Awi_redraw,
	Awi_topped,
	Awi_closed,
	Awi_fulled,
	Awi_arrowed,
	Awi_hslid,
	Awi_vslid,
	Awi_sized,
	Awi_moved,
};

static Awindow *memshow_winptr;
static void (*acstimer)(void);

#ifdef __PUREC__
long Mavail(void);
#else
#define Mavail()  (long)Malloc(-1L)
#endif

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static Awindow *memshow_create(void *para)
{
	Awindow *self;
	
	UNUSED(para);
	self = Awi_create((Awindow *)&memwshow_win);
	if (self == NULL)
		return NULL;
	memshow_update(self);
	return self;
}

/* -------------------------------------------------------------------------- */

static boolean memshow_service(Awindow *self, int16 task, void *in_out)
{
	UNUSED(in_out);
	switch (task)
	{
	case AS_TERM:
		Awi_delete(self);
		if (acstimer != NULL)
			ACSblk->ACStimer = acstimer;
		ACSmoduleterm();
		return TRUE;
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

static void memshow_timer(void)
{
	if (memshow_winptr != NULL)
		memshow_update(memshow_winptr);
}

/* -------------------------------------------------------------------------- */

static void memshow_update(Awindow *self)
{
	long sizes[4];
	void *ptrs[4];
	long i;
	long total = 0;
	
	if (self != NULL)
	{
		Aob_printf(self->work, CORELEFT, "%8ld", (unsigned long)Mavail() >> 10);
		for (i = 0; i < 4; i++)
		{
			sizes[i] = (long)Malloc(-1L);
			if (sizes[i] > 0)
			{
				ptrs[i] = (void *)Malloc(sizes[i]);
				Aob_printf(self->work, BLOCK1 + i, "%8ld", sizes[i] / 1024);
				total += sizes[i];
			} else
			{
				ptrs[i] = NULL;
				Aob_puttext(self->work, BLOCK1 + i, "       0");
			}
		}
		for (i = 3; i >= 0; i--)
			if (ptrs[i] != NULL)
				Mfree(ptrs[i]);
		Aob_printf(self->work, TOTAL, "%8ld", total / 1024);
		self->obchange(self, MEMBOX, -1);
		if (acstimer != NULL)
			acstimer();
	}
}

/* -------------------------------------------------------------------------- */

int16 ACSinit(void)
{
	if ((memshow_winptr = memwshow_win.create(NULL)) != NULL)
	{
		memshow_winptr->open(memshow_winptr);
		acstimer = ACSblk->ACStimer;
		ACSblk->ACStimer = memshow_timer;
	} else
	{
		acstimer = NULL;
	}
	return OK;
}
