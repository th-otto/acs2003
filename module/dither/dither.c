#include "acs.h"
#include "acs230.h"
#include "../src/country.h"

#ifndef UNUSED
# define UNUSED(x) ((void)(x))
#endif

static void click_patternframe(void);
static void click_pattern(void);
static void click_colorframe(void);
static void click_gray(void);
static void click_white(void);
static void click_large(void);
static void click_transparent(void);
static void click_opaque(void);

#if COUNTRY == COUNTRY_DE
#define TEXT_CANCEL "Abbruch"
static char TEXT_001[] = "OK";
static char TEXT_002[] = TEXT_CANCEL;
static char TEXT_003[] = "";
static char TEXT_004[] = "Muster:";
static char TEXT_005[] = "Farbe:";
static char TEXT_006[] = "Weiss";
static char TEXT_007[] = "Gross";
static char TEXT_008[] = "Grau";
static char TEXT_009[] = "Modus:";
static char TEXT_010[] = " Dither-Modus ";
#endif

#if COUNTRY == COUNTRY_US
#define TEXT_CANCEL "Cancel"
static char TEXT_001[] = "OK";
static char TEXT_002[] = TEXT_CANCEL;
static char TEXT_003[] = "";
static char TEXT_004[] = "Pattern:";
static char TEXT_005[] = "Color:";
static char TEXT_006[] = "White";
static char TEXT_007[] = "Large";
static char TEXT_008[] = "Gray";
static char TEXT_009[] = "Mode:";
static char TEXT_010[] = " Dither-Mode ";
#endif

static AUSERBLK230 A_3DBUTTON01 = { A_3Dbutton, 0x29c10178L, Auo_string, TEXT_001, NULL, NULL };
static AUSERBLK230 A_3DBUTTON02 = { A_3Dbutton, 0x29c10178L, Auo_string, TEXT_002, NULL, NULL };
static AUSERBLK230 A_3DBUTTON03 = { A_3Dbutton, 0x29e20178L, Auo_string, NULL, NULL, NULL };

static AUSERBLK230 A_CHECKBOX01 = { A_checkbox, 0x00000001L, Auo_string, TEXT_008, NULL, NULL };
static AUSERBLK230 A_CHECKBOX02 = { A_checkbox, 0x00000001L, Auo_string, TEXT_007, NULL, NULL };
static AUSERBLK230 A_CHECKBOX03 = { A_checkbox, 0x00000001L, Auo_string, TEXT_006, NULL, NULL };

static AUSERBLK230 A_FRAME01 = { A_innerframe, 0x10008f19L, Auo_string, TEXT_004, NULL, NULL };
static AUSERBLK230 A_FRAME02 = { A_innerframe, 0x10008f19L, Auo_string, TEXT_005, NULL, NULL };
static AUSERBLK230 A_FRAME03 = { A_innerframe, 0x10008f19L, Auo_string, TEXT_009, NULL, NULL };

#define DITHER_GRAY    55
#define DITHER_WHITE   57
#define DITHER_LARGE   59
#define DITHER_OK      65
#define DITHER_CANCEL  67


static struct {
	OBJECT root;
	OBJECT button03;
	OBJECT frame01;
	AOBJECT _a_frame01;
	OBJECT pattern0;
	AOBJECT _a_pattern0;
	OBJECT pattern1;
	AOBJECT _a_pattern1;
	OBJECT pattern2;
	AOBJECT _a_pattern2;
	OBJECT pattern3;
	AOBJECT _a_pattern3;
	OBJECT pattern4;
	AOBJECT _a_pattern4;
	OBJECT pattern5;
	AOBJECT _a_pattern5;
	OBJECT pattern6;
	AOBJECT _a_pattern6;
	OBJECT pattern7;
	AOBJECT _a_pattern7;
	OBJECT frame02;
	AOBJECT _a_frame02;
	OBJECT color0;
	AOBJECT _a_color0;
	OBJECT color1;
	AOBJECT _a_color1;
	OBJECT color2;
	AOBJECT _a_color2;
	OBJECT color3;
	AOBJECT _a_color3;
	OBJECT color4;
	AOBJECT _a_color4;
	OBJECT color5;
	AOBJECT _a_color5;
	OBJECT color6;
	AOBJECT _a_color6;
	OBJECT color7;
	AOBJECT _a_color7;
	OBJECT color8;
	AOBJECT _a_color8;
	OBJECT color9;
	AOBJECT _a_color9;
	OBJECT color10;
	AOBJECT _a_color10;
	OBJECT color11;
	AOBJECT _a_color11;
	OBJECT color12;
	AOBJECT _a_color12;
	OBJECT color13;
	AOBJECT _a_color13;
	OBJECT color14;
	AOBJECT _a_color14;
	OBJECT color15;
	AOBJECT _a_color15;
	OBJECT frame03;
	OBJECT gray;
	AOBJECT _a_gray;
	OBJECT white;
	AOBJECT _a_white;
	OBJECT large;
	AOBJECT _a_large;
	OBJECT transparent;
	AOBJECT _a_transparent;
	OBJECT opaque;
	AOBJECT a_opaque;
	OBJECT ok;
	AOBJECT _a_ok;
	OBJECT cancel;
	AOBJECT _a_cancel;
} dither_work = {
	{ 0xffff, 0x0001, 0x0001, 0x0019, 0x0000, 0x0000, C_UNION(0x00ff1100L), 0x0000, 0x0000, 0x0020, 0x000a },
	{ 0x0000, 0x0002, 0x0043, 0x0018, 0x0040, 0x0010, C_UNION(&A_3DBUTTON03), 0x0000, 0x0000, 0x0020, 0x000a },
	{ 0x0014, 0x0004, 0x0012, 0x0018, 0x0040, 0x0000, C_UNION(&A_FRAME01), 0x0001, 0x0001, 0x000a, 0x0006 },
	{ click_patternframe, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0006, 0xffff, 0xffff, 0x0014, 0x0005, 0x0000, C_UNION(0x00011101L), 0x0001, 0x0001, 0x0004, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0008, 0xffff, 0xffff, 0x0014, 0x0005, 0x0000, C_UNION(0x00011141L), 0x0005, 0x0001, 0x0004, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x000a, 0xffff, 0xffff, 0x0014, 0x0005, 0x0000, C_UNION(0x00011111L), 0x0001, 0x0002, 0x0004, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x000c, 0xffff, 0xffff, 0x0014, 0x0005, 0x0000, C_UNION(0x00011151L), 0x0005, 0x0002, 0x0004, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x000e, 0xffff, 0xffff, 0x0014, 0x0005, 0x0000, C_UNION(0x00011121L), 0x0001, 0x0003, 0x0004, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0010, 0xffff, 0xffff, 0x0014, 0x0005, 0x0000, C_UNION(0x00011161L), 0x0005, 0x0003, 0x0004, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0012, 0xffff, 0xffff, 0x0014, 0x0005, 0x0000, C_UNION(0x00011131L), 0x0001, 0x0004, 0x0004, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0002, 0xffff, 0xffff, 0x0014, 0x0005, 0x0000, C_UNION(0x00011171L), 0x0005, 0x0004, 0x0004, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0036, 0x0016, 0x0034, 0x0018, 0x0040, 0x0000, C_UNION(&A_FRAME02), 0x000b, 0x0001, 0x000a, 0x0006 },
	{ click_colorframe, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0018, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x300011f0L), 0x0001, 0x0001, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x001a, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x31001071L), 0x0003, 0x0001, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x001c, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x32001072L), 0x0005, 0x0001, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x001e, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x33001073L), 0x0007, 0x0001, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0020, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x34001074L), 0x0001, 0x0002, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0022, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x35001075L), 0x0003, 0x0002, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0024, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x36001076L), 0x0005, 0x0002, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0026, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x37001077L), 0x0007, 0x0002, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0028, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x38001078L), 0x0001, 0x0003, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x002a, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x39001079L), 0x0003, 0x0003, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x002c, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x4100107aL), 0x0005, 0x0003, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x002e, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x4200107bL), 0x0007, 0x0003, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0030, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x4300107cL), 0x0001, 0x0004, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0032, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x4400107dL), 0x0003, 0x0004, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0034, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x4500107eL), 0x0005, 0x0004, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0014, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x4600107fL), 0x0007, 0x0004, 0x0002, 0x0001 },
	{ click_pattern, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0041, 0x0037, 0x003f, 0x0018, 0x0040, 0x0000, C_UNION(&A_FRAME03), 0x0015, 0x0001, 0x000a, 0x0006 },
	{ 0x0039, 0xffff, 0xffff, 0x0018, 0x0040, 0x0000, C_UNION(&A_CHECKBOX01), 0x0001, 0x0001, 0x0007, 0x0001 },
	{ click_gray, NULL, 0x8000, 0x8822, NULL, NULL, 0, 0 },
	{ 0x003b, 0xffff, 0xffff, 0x0018, 0x0040, 0x0000, C_UNION(&A_CHECKBOX03), 0x0001, 0x0002, 0x0008, 0x0001 },
	{ click_white, NULL, 0x8000, 0x8811, NULL, NULL, 0, 0 },
	{ 0x003d, 0xffff, 0xffff, 0x0018, 0x0040, 0x0000, C_UNION(&A_CHECKBOX02), 0x0001, 0x0003, 0x0008, 0x0001 },
	{ click_large, NULL, 0x8000, 0x881f, NULL, NULL, 0, 0 },
	{ 0x003f, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x43000141L), 0x0001, 0x0004, 0x0004, 0x0001 },
	{ click_transparent, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0036, 0xffff, 0xffff, 0x001b, 0x0005, 0x0000, C_UNION(0x430001c1L), 0x0005, 0x0004, 0x0004, 0x0001 },
	{ click_opaque, NULL, 0x8000, 0x0000, NULL, NULL, 0, 0 },
	{ 0x0043, 0xffff, 0xffff, 0x0018, 0x4007, 0x0000, C_UNION(&A_3DBUTTON01), 0x0003, 0x0007, 0x000c, 0x0002 },
	{ NULL, NULL, 0x8000, 0x8818, NULL, NULL, 0, 0 },
	{ 0x0001, 0xffff, 0xffff, 0x0018, 0x4005, 0x0000, C_UNION(&A_3DBUTTON02), 0x0011, 0x0007, 0x000c, 0x0002 },
	{ NULL, NULL, 0x8020, 0x881e, NULL, NULL, 0, 0 }
};

static Awindow23x dither_win = {
	NULL,
	Awi_service,
	Awi_selfcreate,
	Awi_open,
	Awi_init,
	&dither_work.root,
	NULL,
	0, 0,
	-1,
	NAME | CLOSER | MOVER,
	{ 0, 0, 120, 50 },
	{ 0, 0, 0, 0 },
	{ 0, 0, 0, 0 },
	{ -1, -1, -1, -1 },
	0, 0,
	0xf8f8,
	TEXT_010,
	TEXT_003,
	10000,
	0,
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

#define ACS_DITHER_OPAQUE 0x080
#define ACS_DITHER_LARGE  0x100
#define ACS_DITHER_WHITE  0x200
#define ACS_DITHER_GRAY   0x400

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 ACSinit(void)
{
	int16 dither;
	Awindow *win;
	
	dither = ACSblk->dither;
	
	win = dither_win.create(&dither_win);
	if (win != NULL)
	{
		if (dither & ACS_DITHER_LARGE)
			win->work[DITHER_LARGE].ob_state |= OS_SELECTED;
		if (dither & ACS_DITHER_WHITE)
			win->work[DITHER_WHITE].ob_state |= OS_SELECTED;
		if (dither & ACS_DITHER_GRAY)
			win->work[DITHER_GRAY].ob_state |= OS_SELECTED;
		if (Awi_dialog(win) == DITHER_OK)
			form_dial(FMD_FINISH, ACSblk->desk.x, ACSblk->desk.y, ACSblk->desk.w, ACSblk->desk.h,
				ACSblk->desk.x, ACSblk->desk.y, ACSblk->desk.w, ACSblk->desk.h);
		else
			ACSblk->dither = dither;
		Awi_delete(win);
	}
	ACSmoduleterm();
	return OK;
}

/* -------------------------------------------------------------------------- */

static void click_colorframe(void)
{
	int16 color;
	Awindow *self;
	
	color = ACSblk->ev_object[ACSblk->ev_obnr].ob_spec.obspec.interiorcol;
	ACSblk->dither = (ACSblk->dither & -16) | color;
	self = ACSblk->ev_window;
	self->obchange(self, ROOT, -1);
}

/* -------------------------------------------------------------------------- */

static void click_gray(void)
{
	Awindow *self;
	OBJECT *obj;
	
	obj = &ACSblk->ev_object[ACSblk->ev_obnr];
	if (obj->ob_state & OS_SELECTED)
		ACSblk->dither &= ~ACS_DITHER_GRAY;
	else
		ACSblk->dither |= ACS_DITHER_GRAY;
	obj->ob_state ^= OS_SELECTED;
	self = ACSblk->ev_window;
	self->obchange(self, ROOT, -1);
}

/* -------------------------------------------------------------------------- */

static void click_pattern(void)
{
	int16 obnr;
	AOBJECT *aobj;
	
	obnr = Aob_up(ACSblk->ev_object, ACSblk->ev_obnr);
	aobj = (AOBJECT *)&ACSblk->ev_object[obnr] + 1;
	aobj->click();
}

/* -------------------------------------------------------------------------- */

static void click_patternframe(void)
{
	int16 pattern;
	Awindow *self;
	
	pattern = ACSblk->ev_object[ACSblk->ev_obnr].ob_spec.obspec.fillpattern;
	ACSblk->dither = (ACSblk->dither & ~0x70) | (pattern << 4);
	self = ACSblk->ev_window;
	self->obchange(self, ROOT, -1);
}

/* -------------------------------------------------------------------------- */

static void click_opaque(void)
{
	Awindow *self;

	ACSblk->dither |= ACS_DITHER_OPAQUE;
	self = ACSblk->ev_window;
	self->obchange(self, ROOT, -1);
}

/* -------------------------------------------------------------------------- */

static void click_transparent(void)
{
	Awindow *self;

	ACSblk->dither &= ~ACS_DITHER_OPAQUE;
	self = ACSblk->ev_window;
	self->obchange(self, ROOT, -1);
}

/* -------------------------------------------------------------------------- */

static void click_large(void)
{
	Awindow *self;
	OBJECT *obj;
	OBJECT *cancel;
	AUSERBLK *auser;
	
	obj = &ACSblk->ev_object[ACSblk->ev_obnr];
	if (obj->ob_state & OS_SELECTED)
	{
		ACSblk->dither &= ~ACS_DITHER_LARGE;
		cancel = &ACSblk->ev_object[DITHER_CANCEL];
		auser = cancel->ob_spec.auserblk;
		auser->ub_serv(cancel, AUO_SETVAL, TEXT_CANCEL);
	} else
	{
		ACSblk->dither |= ACS_DITHER_LARGE;
	}
	obj->ob_state ^= OS_SELECTED;
	self = ACSblk->ev_window;
	self->obchange(self, ROOT, -1);
}

/* -------------------------------------------------------------------------- */

static void click_white(void)
{
	Awindow *self;
	OBJECT *obj;
	
	obj = &ACSblk->ev_object[ACSblk->ev_obnr];
	if (obj->ob_state & OS_SELECTED)
		ACSblk->dither &= ~ACS_DITHER_WHITE;
	else
		ACSblk->dither |= ACS_DITHER_WHITE;
	obj->ob_state ^= OS_SELECTED;
	self = ACSblk->ev_window;
	self->obchange(self, ROOT, -1);
}
