#include "acs.h"
#include "../src/country.h"
#include "acs230.h"

#ifndef UNUSED
# define UNUSED(x) ((void)(x))
#endif

#if COUNTRY == COUNTRY_DE
static char TEXT_001[] = " LUPE ";
static char TEXT_002[] = "";
static char TEXT_003[] = "LUPE";
static char TEXT_004[] = "  32*16";
static char TEXT_005[] = "Die Lupe kann durch einen Doppelklick auf das Fenster konfiguriert werden.";
static char TEXT_006[] = "  Kreuz";
static char TEXT_007[] = "  16*32";
static char TEXT_008[] = "  32*32";
static char TEXT_009[] = "  16*16";
static char TEXT_010[] = " Information ";
#endif

#if COUNTRY == COUNTRY_US
static char TEXT_001[] = " LUPE ";
static char TEXT_002[] = "";
static char TEXT_003[] = "LUPE";
static char TEXT_004[] = "  32*16";
static char TEXT_005[] = "The magnifying glass can be configured by a double-click on the window.";
static char TEXT_006[] = "  Cross";
static char TEXT_007[] = "  16*32";
static char TEXT_008[] = "  32*32";
static char TEXT_009[] = "  16*16";
static char TEXT_010[] = " Information ";
#endif


static boolean lupe_service(Awindow *win, int16 task, void *in_out);
static Awindow *lupe_create(void *para);
static int16 lupe_init(Awindow *self);

static AUSERBLK230 USERBLK01 = { A_3Dbutton, 0xa02191f8L, Auo_string, NULL, NULL, NULL };
static AUSERBLK230 USERBLK02 = { A_3Dbutton, 0x29e201f8L, Auo_string, NULL, NULL, NULL };
static AUSERBLK230 USERBLK03 = { A_arrows, 0x22090001L, NULL, NULL, NULL, NULL };
static AUSERBLK230 USERBLK04 = { A_ftext, 0x00118000L, Auo_ftext, TEXT_005, NULL, NULL };

static int16 lupe_icon_mask[] = {
	0x0000, 0x0000, 0x0003, 0xe000, 0x001f, 0xfc00, 0x003f, 0xfe00,
	0x007f, 0xff00, 0x00ff, 0xff80, 0x00ff, 0xffc0, 0xffff, 0xfffe,
	0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
	0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
	0x7fff, 0xffff, 0x00ff, 0xff80, 0x007f, 0xff00, 0x003f, 0xfe00,
	0x003f, 0xfc00, 0x003f, 0xe000, 0x007e, 0x0000, 0x007c, 0x0000,
	0x00fc, 0x0000, 0x00f8, 0x0000, 0x01f8, 0x0000, 0x01f0, 0x0000,
	0x03f0, 0x0000, 0x03e0, 0x0000, 0x03e0, 0x0000, 0x0180, 0x0000
};
static int16 lupe_icon_data[] = {
	0x0000, 0x0000, 0x0003, 0xe000, 0x001f, 0xfc00, 0x0038, 0x0e00,
	0x0067, 0xe300, 0x00e7, 0xe380, 0x0087, 0xe0c0, 0xffb8, 0x1cfe,
	0x8138, 0x1c43, 0x9b38, 0x1c6b, 0xa738, 0x1c6b, 0xa738, 0x1c6b,
	0xa738, 0x1c6b, 0x9b3f, 0xfc6b, 0x813f, 0xfc43, 0xffbf, 0xfcff,
	0x7fb8, 0x1cff, 0x00f8, 0x1f80, 0x0078, 0x1f00, 0x0038, 0x0e00,
	0x003f, 0xfc00, 0x0023, 0xe000, 0x0066, 0x0000, 0x0044, 0x0000,
	0x00cc, 0x0000, 0x0088, 0x0000, 0x0198, 0x0000, 0x0110, 0x0000,
	0x0330, 0x0000, 0x0220, 0x0000, 0x0260, 0x0000, 0x0180, 0x0000
};

static CICONBLK lupe_icon = { { lupe_icon_mask, lupe_icon_data, TEXT_003, 0x1000, 0, 0, 19, 0, 32, 32, 0, 32, 72, 8 }, NULL };

static struct {
	OBJECT root;
	OBJECT sel_16x16;
	OBJECT sel_16x32;
	OBJECT sel_32x16;
	OBJECT sel_32x32;
	OBJECT sep;
	OBJECT cross;
} popup = {
	{ -1,  1,  6, G_BOX, 0x0000, 0x0020, C_UNION(0x00ff1100L), 0, 0, 9, 6 },
	{  2, -1, -1, G_STRING, 0x0001, 0x0000, C_UNION(TEXT_009), 0, 0, 9, 1 },
	{  3, -1, -1, G_STRING, 0x0001, 0x0000, C_UNION(TEXT_007), 0, 1, 9, 1 },
	{  4, -1, -1, G_STRING, 0x0001, 0x0000, C_UNION(TEXT_004), 0, 2, 9, 1 },
	{  5, -1, -1, G_STRING, 0x0001, 0x0000, C_UNION(TEXT_008), 0, 3, 9, 1 },
	{  6, -1, -1, G_USERDEF, 0x0000, 0x0108, C_UNION(&USERBLK03), 0, 4, 9, 1 },
	{  0, -1, -1, G_STRING, 0x0021, 0x0004, C_UNION(TEXT_006), 0, 5, 9, 1 },
};

static struct {
	OBJECT root;
	OBJECT u02;
	OBJECT u01;
	OBJECT box;
	OBJECT u04;
} settings_work = {
	{ -1,  1,  1, G_IBOX, 0x0000, 0x0000, C_UNION(0x00ff1141L), 0, 0, 28, 6 },
	{  0,  2,  2, G_USERDEF, 0x0040, 0x0510, C_UNION(&USERBLK02), 0, 0, 28, 6 },
	{  1,  3,  3, G_USERDEF, 0x0000, 0x0010, C_UNION(&USERBLK01), 2, 1, 24, 4 },
	{  2,  4,  4, G_BOX, 0x0040, 0x0000, C_UNION(0x00001101L), 0, 0, 24, 4 },
	{  3, -1, -1, G_USERDEF, 0x0060, 0x0000, C_UNION(&USERBLK04), 1, 0, 22, 4 },
};

static Awindow23x lupe_win = {
	NULL,
	lupe_service,
	lupe_create,
	Awi_open,
	lupe_init,
	NULL,
	NULL,
	0, 0,
	-1,
	NAME | CLOSER | MOVER,
	{ 0, 0, 77, 77 },
	{ 0, 0, 0, 0 },
	{ 0, 0, 0, 0 },
	{ -1, -1, -1, -1 },
	0, 0,
	0xf0f0,
	TEXT_001,
	TEXT_002,
	10000,
	AW_TOOLBOX | AW_ICON | AW_GHOSTICON | AW_STAY,
	0,
	-1,
	&lupe_icon,
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

static Awindow23x settings_win = {
	NULL,
	Awi_service,
	Awi_selfcreate,
	Awi_open,
	Awi_init,
	&settings_work.root,
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
	TEXT_002,
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

static int16 CDECL lupe_draw(PARMBLK *pb);

static boolean cross = TRUE;
static AUSERBLK230 lupe_user = { lupe_draw, 0L, NULL, NULL, NULL, NULL };

static void lupe_click(void);

static struct {
	OBJECT root;
	AOBJECT click;
} lupe_work = {
	{ -1, -1, -1, G_USERDEF, 0x0040, 0x8000, C_UNION(&lupe_user), 0, 0, 1, 1 },
	{ lupe_click, NULL, 0x8020, 0, NULL, NULL, 0, 0 }
};

static MFDB *bp1;
static MFDB *bp2;
static MFDB *bp3;
static MFDB *bp4;
static int16 zoomw;
static int16 zoomh;
static int16 zoomed_w;
static int16 zoomed_h;
static Awindow *lupe_winptr;

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void change_zoom(int16 w, int16 h)
{
	if (w != zoomw || h != zoomh)
	{
		zoomw = w;
		zoomh = h;
		Abp_delete(bp1);
		Abp_delete(bp2);
		Abp_delete(bp3);
		Abp_delete(bp4);
		zoomed_w = zoomw * 4;
		zoomed_h = zoomh * 4;
		lupe_winptr->work->ob_width = zoomed_w;
		lupe_winptr->work->ob_height = zoomed_h;
		bp1 = Abp_create(zoomed_w, zoomed_h);
		bp2 = Abp_create(zoomed_w, zoomed_h);
		bp2->fd_stand = TRUE;
		bp3 = Abp_create(zoomw, zoomh);
		bp3->fd_stand = TRUE;
		bp4 = Abp_create(zoomw, zoomh);
		lupe_init(lupe_winptr);
	}
}

/* -------------------------------------------------------------------------- */

static void lupe_click(void)
{
	Awindow *win = ACSblk->ev_window;
	OBJECT *tree;
	
	tree = &popup.root;
	switch (Ame_popup(win, tree, -1, -1))
	{
	case 1:
		change_zoom(16, 16);
		break;
	case 3:
		change_zoom(32, 16);
		break;
	case 2:
		change_zoom(16, 32);
		break;
	case 4:
		change_zoom(32, 32);
		break;
	case 6:
		if (cross)
		{
			cross = FALSE;
			tree[6].ob_state &= ~OS_CHECKED;
		} else
		{
			cross = TRUE;
			tree[6].ob_state |= OS_CHECKED;
		}
		break;
	}
	win->wi_act.w = 256;
	win->wi_act.h = 256;
	win->sized(win, &win->wi_act);
}

/* -------------------------------------------------------------------------- */

static Awindow *lupe_create(void *para)
{
	UNUSED(para);

	if (lupe_winptr == NULL)
	{
		lupe_win.work = &lupe_work.root;
		lupe_winptr = Awi_create((Awindow *)&lupe_win);
		if (lupe_winptr == NULL)
			return NULL;
		change_zoom(32, 32);
		if (ACSblk->application)
			lupe_winptr->open(lupe_winptr);
	}
	return lupe_winptr;
}

/* -------------------------------------------------------------------------- */

static boolean lupe_service(Awindow *self, int16 task, void *in_out)
{
	UNUSED(in_out);
	
	switch (task)
	{
	case AS_TERM:
		Abp_delete(bp1);
		Abp_delete(bp2);
		Abp_delete(bp3);
		Abp_delete(bp4);
		Awi_delete(self);
		ACSmoduleterm();
		break;
	
	case AS_INFO:
		self = settings_win.create((Awindow *)&settings_win);
		if (self != NULL)
		{
			Awi_dialog(self);
			Awi_delete(self);
		}
		break;
	
	default:
		return FALSE;
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static int16 zoompix(int16 pix)
{
	int16 val = 0;
	
	if (pix & 1)
		val |= 0x000f;
	if (pix & 2)
		val |= 0x00f0;
	if (pix & 4)
		val |= 0x0f00;
	if (pix & 8)
		val |= 0xf000;
	return val;
}

/* -------------------------------------------------------------------------- */

static int16 lupe_init(Awindow *self)
{
	int16 pxy[8];
	int16 diffx;
	int16 diffy;
	int16 plane;
	int16 x;
	int16 y;
	int16 h;
	int16 w;
	int16 *src;
	int16 *dst;
	int16 wdwidth;
	int16 maxx;
	
	self->state |= AWS_LATEUPDATE;
	if (bp4 != NULL && bp1 != NULL)
	{
		x = ACSblk->ev_mmox - (zoomw >> 1);
		y = ACSblk->ev_mmoy - (zoomh >> 1);
		if (x < 0)
			x = 0;
		if (y < 0)
			y = 0;
		maxx = ACSblk->desk.x + ACSblk->desk.w - zoomw;
		if (x > maxx)
			x = maxx;
		maxx = ACSblk->desk.y + ACSblk->desk.h - zoomh;
		if (y > maxx)
			y = maxx;
		diffx = ACSblk->ev_mmox - x;
		diffy = ACSblk->ev_mmoy - y;
		pxy[0] = x;
		pxy[1] = y;
		pxy[2] = x + zoomw - 1;
		pxy[3] = y + zoomh - 1;
		pxy[4] = 0;
		pxy[5] = 0;
		pxy[6] = zoomw - 1;
		pxy[7] = zoomh - 1;
		v_hide_c(ACSblk->vdi_handle);
		vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, &ACSblk->screenMFDB, bp4);
		v_show_c(ACSblk->vdi_handle, 1);
		vr_trnfm(ACSblk->vdi_handle, bp4, bp3);
		src = bp3->fd_addr;
		dst = bp2->fd_addr;
		wdwidth = bp2->fd_wdwidth;
		for (plane = ACSblk->nplanes; plane > 0; plane--)
		{
			for (h = bp4->fd_h; h > 0; h--)
			{
				for (w = bp4->fd_wdwidth; w > 0; w--)
				{
					dst[wdwidth + wdwidth + wdwidth] = dst[wdwidth + wdwidth] = dst[wdwidth] = dst[0] = zoompix(*src >> 12);
					dst++;
					dst[wdwidth + wdwidth + wdwidth] = dst[wdwidth + wdwidth] = dst[wdwidth] = dst[0] = zoompix(*src >> 8);
					dst++;
					dst[wdwidth + wdwidth + wdwidth] = dst[wdwidth + wdwidth] = dst[wdwidth] = dst[0] = zoompix(*src >> 4);
					dst++;
					dst[wdwidth + wdwidth + wdwidth] = dst[wdwidth + wdwidth] = dst[wdwidth] = dst[0] = zoompix(*src);
					dst++;
					src++;
				}
				dst += wdwidth * 3;
			}
		}
		vr_trnfm(ACSblk->vdi_handle, bp2, bp1);
		if (cross)
		{
			pxy[4] = pxy[0] = pxy[6] = pxy[2] = diffx * 4 + 1;
			pxy[5] = pxy[1] = 0;
			pxy[7] = pxy[3] = zoomed_h - 1;
			vro_cpyfm(ACSblk->vdi_handle, NOT_D, pxy, bp1, bp1);
			pxy[4] = pxy[0] = 0;
			pxy[6] = pxy[2] = zoomed_w - 1;
			pxy[5] = pxy[1] = pxy[7] = pxy[3] = diffy * 4 + 1;
			vro_cpyfm(ACSblk->vdi_handle, NOT_D, pxy, bp1, bp1);
		}
		self->obchange(self, ROOT, self->work[ROOT].ob_state);
	}
	return OK;
}

/* -------------------------------------------------------------------------- */

static int16 CDECL lupe_draw(PARMBLK *pb)
{
	int16 pxy[8];
	
	if (bp1 != NULL)
	{
		pxy[2] = pb->pb_wc;
		pxy[3] = pb->pb_hc;
		pxy[0] = pb->pb_xc;
		pxy[1] = pb->pb_yc;
		pxy[2] += pxy[0] - 1;
		pxy[3] += pxy[1] - 1;
		vs_clip(ACSblk->vdi_handle, TRUE, pxy);
		pxy[0] = 0;
		pxy[1] = 0;
		pxy[2] = zoomed_w - 1;
		pxy[3] = zoomed_h - 1;
		pxy[4] = pb->pb_x;
		pxy[5] = pb->pb_y;
		pxy[6] = pb->pb_x + zoomed_w - 1;
		pxy[7] = pb->pb_y + zoomed_h - 1;
		vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, bp1, &ACSblk->screenMFDB);
		vs_clip(ACSblk->vdi_handle, FALSE, pxy);
	}
	return pb->pb_currstate;
}

/* -------------------------------------------------------------------------- */

int16 ACSinit(void)
{
	lupe_create(NULL);
	return OK;
}
