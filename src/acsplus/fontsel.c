/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Font Selector                                         */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "acsplus.h"
#include "country.h"

static void mod_height(void);
static boolean serv_wi_font(Awindow *self, int16 task, void *in_out);

#include "fontsel.ah"
#include "fontsel.h"

typedef struct {
	char name[33];
	int16 id;
	int16 points[12];
} FONTINFO;

static FONTINFO *table;
static int16 fonts;
static int16 fontid;
static int16 height;
static boolean pixel;

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void mod_height(void)
{
	OBJECT *tree = ACSblk->ev_object;
	int16 h;
	OBJECT *sample;
	AUSERBLK *auser;
	
	Aus_editor();
	if (pixel)
	{
		h = height;
#ifdef __GNUC__
		{
		int x;
		Aob_scanf(tree, FONTSEL_HEIGHT, "%d", &x);
		height = x;
		}
#else
		Aob_scanf(tree, FONTSEL_HEIGHT, "%d", &height);
#endif
		if (height != h)
		{
			sample = &tree[FONTSEL_SAMPLE];
			auser = sample->ob_spec.auserblk;
			auser->ub_serv(sample, AUO_FTHEIGHT, &height);
			ACSblk->ev_window->obchange(ACSblk->ev_window, FONTSEL_SAMPLE_BOX, -1);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void liveheight(void *obj, const char *text)
{
	int16 h = height;
	OBJECT *tree = obj;
	int newh;
	int16 dummy;
	OBJECT *sample;
	AUSERBLK *auser;
	
	if (*text == ' ')
	{
		sscanf(text, "%d", &newh);
		vst_font(ACSblk->vdi_handle, fontid);
		vst_point(ACSblk->vdi_handle, newh, &dummy, &height, &dummy, &dummy);
		pixel = FALSE;
	} else
	{
#ifdef __GNUC__
		{
		int x;
		Aob_scanf(tree, FONTSEL_HEIGHT, "%d", &x);
		height = x;
		}
#else
		Aob_scanf(tree, FONTSEL_HEIGHT, "%d", &height);
#endif
		pixel = TRUE;
	}
	if (height != h)
	{
		sample = &tree[FONTSEL_SAMPLE];
		auser = sample->ob_spec.auserblk;
		auser->ub_serv(sample, AUO_FTHEIGHT, &height);
		ACSblk->ev_window->obchange(ACSblk->ev_window, FONTSEL_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void set_font(OBJECT *tree, int16 idx)
{
	AUSERBLK *auser;
	EDITSEL sel;
	OBJECT *sample;
	FONTINFO *info;
	long rows;
	char buf[8];
	int16 dummy;
	int16 newh;
	OBJECT *entry;
	int16 row;
	int16 i;
	int16 point;
	
#ifdef __GNUC__
	{
	int x;
	Aob_scanf(tree, FONTSEL_HEIGHT, "%d", &x);
	height = x;
	}
#else
	Aob_scanf(tree, FONTSEL_HEIGHT, "%d", &height);
#endif
	
	info = &table[idx];
	fontid = info->id;
	sample = &tree[FONTSEL_SAMPLE];
	auser = sample->ob_spec.auserblk;
	auser->ub_serv(sample, AUO_FTFONT, &fontid);
	auser->ub_serv(sample, AUO_FTHEIGHT, &height);
	
	entry = &tree[FONTSEL_ENTRY];
	Auo_editor(entry, AUO_EDDELETE, NULL);
	row = -1;
	vst_font(ACSblk->vdi_handle, fontid);
	for (i = 0; i < 12; i++)
	{
		point = info->points[i];
		if (point > 0)
		{
			sprintf(buf, "%3d", point);
			Auo_editor(entry, AUO_EDAPPLINE, buf);
			Auo_editor(entry, AUO_EDNEWLINE, NULL);
			vst_point(ACSblk->vdi_handle, point, &dummy, &newh, &dummy, &dummy);
			if (row < 0)
			{
				--row;
				if (newh == height)
					row = -row - 2;
			}
		}
	}

	Auo_editor(entry, AUO_EDAPPLINE, "Pixel");
	if (row < 0)
	{
		Auo_editor(entry, AUO_EDGETROWS, &rows);
		sel.row1 = sel.row2 = rows - 1;
	} else
	{
		sel.row1 = sel.row2 = row;
	}
	sel.col1 = sel.col2 = 0;
	Auo_editor(entry, AUO_EDSETSELECT, &sel);
	Auo_editor(entry, AUO_EDVIEW, NULL);
	pixel = TRUE;
}

/* -------------------------------------------------------------------------- */

static void livefont(void *obj, const char *name)
{
	int16 i;
	OBJECT *tree = obj;
	AUSERBLK *auser;
	Awindow *win;
	
	auser = tree[FONTSEL_ENTRY].ob_spec.auserblk;
	win = ACSblk->ev_window;
	for (i = 0; i < fonts; i++)
	{
		if (strcmp(name, table[i].name) == 0)
		{
			set_font(obj, i);
			win->obchange(win, FONTSEL_SAMPLE_BOX, -1);
			auser->ub_serv(&tree[FONTSEL_ENTRY], AUO_FULLUPDATE, NULL);
			break;
		}
	}
}

/* -------------------------------------------------------------------------- */

static boolean get_fontinfo(OBJECT *list, boolean prop)
{
	int16 dummy;
	int16 minAde;
	int16 maxAde;
	int16 maxwidth;
	int16 distances[5];
	int16 extent[8];
	char buf[100];
	int i;
	int16 lastpoint;
	FONTINFO *info;
	int16 point; /* d4 */
	int16 test;
	
	if ((table = Ax_malloc(ACSblk->fonts * sizeof(*table))) == NULL)
		return FALSE;
	Amo_busy();
	info = table;
	fonts = 1;
	for (i = 1; i <= ACSblk->fonts; i++)
	{
		info->id = vqt_name(ACSblk->vdi_handle, i, info->name);
		vst_font(ACSblk->vdi_handle, info->id);
		point = vst_point(ACSblk->vdi_handle, 200, &dummy, &dummy, &dummy, &dummy);
		if (point <= 200 && point >= 1)
		{
			if (!prop)
			{
				vqt_fontinfo(ACSblk->vdi_handle, &minAde, &maxAde, distances, &maxwidth, distances);
				dummy = 0;
				test = minAde < 32 ? 32 : minAde;
				for (; test <= (maxAde < 0x80 ? maxAde : 0x80); test++)
				{
					buf[dummy] = test;
					dummy++;
				}
				buf[dummy] = 0;
				vqt_extent(ACSblk->vdi_handle, buf, extent);
				if ((extent[2] + extent[0]) / dummy != maxwidth)
					continue;
			}
			if (i > 1)
				Auo_editor(list, AUO_EDNEWLINE, NULL);
			Auo_editor(list, AUO_EDAPPLINE, info->name);
			lastpoint = 200;
			for (test = 11; test >= 0; test--)
			{
				point = vst_point(ACSblk->vdi_handle, lastpoint - 1, &dummy, &dummy, &dummy, &dummy);
				if (lastpoint == point)
				{
					info->points[test] = 0;
				} else
				{
					info->points[test] = point;
					lastpoint = point;
				}
			}
			fonts++;
			info++;
		}
	}
	Amo_unbusy();
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean serv_wi_font(Awindow *self, int16 task, void *in_out)
{
	OBJECT *entry;
	
	UNUSED(in_out);
	switch (task)
	{
	case AS_TERM:
		Awi_delete(self);
		break;
	
	case AS_EDITCHG:
		ACSblk->ev_window = self;
		entry = &self->work[FONTSEL_ENTRY];
		Auo_editor(entry, AUO_EDLIVE, NULL);
		break;
	
	default:
		return FALSE;
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

int16 A_fontsel(int16 *pfontid, int16 *pheight, boolean prop)
{
	Awindow *win;
	OBJECT *list;
	OBJECT *entry;
	EDITSEL sel;
	EDITLIVE live;
	Awiob ob;
	int i;
	int16 ret;
	
	fontid = *pfontid;
	height = *pheight;
	if ((win = WI_FONTSEL.create(&WI_FONTSEL)) == NULL)
		return FAIL;
	list = &win->work[FONTSEL_FONTLIST];
	
	if (get_fontinfo(list, prop) == FALSE)
	{
		Awi_delete(win);
		return FAIL;
	}
	Aob_printf(win->work, FONTSEL_HEIGHT, "%d", height);
	Auo_editor(list, AUO_ED1SELECT, NULL);
	i = fonts - 1;
	while (i > 0 && fontid != table[i].id)
	{
		i--;
	}
	set_font(win->work, i);
	sel.row1 = sel.row2 = i;
	sel.col1 = sel.col2 = 0;
	Auo_editor(list, AUO_EDHROW, &sel);
	Auo_editor(list, AUO_EDSETSELECT, &sel);
	ob.window = win;
	ob.entry = list;
	ob.obnr = FONTSEL_FONTLIST;
	Auo_editor(list, AUO_SELF, &ob);
	ob.entry = &win->work[FONTSEL_VERSLIDER];
	ob.obnr = FONTSEL_VERSLIDER;
	Auo_editor(list, AUO_EDVERSLIDER, &ob);
	live.call = livefont;
	live.obj = win->work;
	Auo_editor(list, AUO_EDCALL, &live);
	
	entry = &win->work[FONTSEL_ENTRY];
	ob.entry = entry;
	ob.obnr = FONTSEL_ENTRY;
	Auo_editor(entry, AUO_SELF, &ob);
	ob.entry = &win->work[FONTSEL_SIZE_SLIDER];
	ob.obnr = FONTSEL_SIZE_SLIDER;
	Auo_editor(entry, AUO_EDVERSLIDER, &ob);
	live.call = liveheight;
	live.obj = win->work;
	Auo_editor(entry, AUO_EDCALL, &live);
	
	if (Awi_dialog(win) == FONTSEL_OK)
	{
		if (height == 0)
			height = ACSblk->gl_hchar;
		*pheight = height;
		*pfontid = fontid;
		ret = OK;
	} else
	{
		ret = FAIL;
	}
	Awi_delete(win);
	Ax_ifree(table);
	return ret;
}
