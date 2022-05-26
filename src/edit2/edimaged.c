#include "acs_i.h"
#include "country.h"

static void edim_accept(void);
static void edim_control(void);
static void edim_col(void);
static void edim_nextpattern(void);
static void edim_edit(void);
static void edim_direct(void);
static void edim_ok(void);
static void edim_abort(void);

static boolean im_service(Awindow *self, int16 task, void *in_out);
static Awindow *im_make(void *a);

static void edim_black(void);
static void edim_white(void);
static void edim_thin(void);
static void edim_thick(void);
static void edim_left(void);
static void edim_up(void);
static void edim_down(void);
static void edim_right(void);
static void edim_struct(void);
static void edim_set(void);

static int16 CDECL edim_bitmap(PARMBLK *pb);

#include "edimaged.ah"
#include "edimaged.h"

static void edim_resize(OBJECT *tree, BITBLK *bit, int16 w, int16 h);
static void accecpt_image(Awindow *self);
static void edim_set_image(Awindow *self);
static void edim_term(Awindow *self);
static void accept_image(Awindow *self);

static int16 oooo[] = { 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 };
static int16 oooi[] = { 0x0000, 0x0000, 0x0000, 0x00fe, 0x0000, 0x00fe, 0x0000, 0x00fe, 0x0000, 0x00fe, 0x0000, 0x00fe, 0x0000, 0x00fe, 0x0000, 0x00fe };
static int16 ooio[] = { 0x0000, 0x0000, 0x0000, 0xfe00, 0x0000, 0xfe00, 0x0000, 0xfe00, 0x0000, 0xfe00, 0x0000, 0xfe00, 0x0000, 0xfe00, 0x0000, 0xfe00 };
static int16 ooii[] = { 0x0000, 0x0000, 0x0000, 0xfefe, 0x0000, 0xfefe, 0x0000, 0xfefe, 0x0000, 0xfefe, 0x0000, 0xfefe, 0x0000, 0xfefe, 0x0000, 0xfefe };
static int16 oioo[] = { 0x0000, 0x0000, 0x00fe, 0x0000, 0x00fe, 0x0000, 0x00fe, 0x0000, 0x00fe, 0x0000, 0x00fe, 0x0000, 0x00fe, 0x0000, 0x00fe, 0x0000 };
static int16 oioi[] = { 0x0000, 0x0000, 0x00fe, 0x00fe, 0x00fe, 0x00fe, 0x00fe, 0x00fe, 0x00fe, 0x00fe, 0x00fe, 0x00fe, 0x00fe, 0x00fe, 0x00fe, 0x00fe };
static int16 oiio[] = { 0x0000, 0x0000, 0x00fe, 0xfe00, 0x00fe, 0xfe00, 0x00fe, 0xfe00, 0x00fe, 0xfe00, 0x00fe, 0xfe00, 0x00fe, 0xfe00, 0x00fe, 0xfe00 };
static int16 oiii[] = { 0x0000, 0x0000, 0x00fe, 0xfefe, 0x00fe, 0xfefe, 0x00fe, 0xfefe, 0x00fe, 0xfefe, 0x00fe, 0xfefe, 0x00fe, 0xfefe, 0x00fe, 0xfefe };
static int16 iooo[] = { 0x0000, 0x0000, 0xfe00, 0x0000, 0xfe00, 0x0000, 0xfe00, 0x0000, 0xfe00, 0x0000, 0xfe00, 0x0000, 0xfe00, 0x0000, 0xfe00, 0x0000 };
static int16 iooi[] = { 0x0000, 0x0000, 0xfe00, 0x00fe, 0xfe00, 0x00fe, 0xfe00, 0x00fe, 0xfe00, 0x00fe, 0xfe00, 0x00fe, 0xfe00, 0x00fe, 0xfe00, 0x00fe };
static int16 ioio[] = { 0x0000, 0x0000, 0xfe00, 0xfe00, 0xfe00, 0xfe00, 0xfe00, 0xfe00, 0xfe00, 0xfe00, 0xfe00, 0xfe00, 0xfe00, 0xfe00, 0xfe00, 0xfe00 };
static int16 ioii[] = { 0x0000, 0x0000, 0xfe00, 0xfefe, 0xfe00, 0xfefe, 0xfe00, 0xfefe, 0xfe00, 0xfefe, 0xfe00, 0xfefe, 0xfe00, 0xfefe, 0xfe00, 0xfefe };
static int16 iioo[] = { 0x0000, 0x0000, 0xfefe, 0x0000, 0xfefe, 0x0000, 0xfefe, 0x0000, 0xfefe, 0x0000, 0xfefe, 0x0000, 0xfefe, 0x0000, 0xfefe, 0x0000 };
static int16 iioi[] = { 0x0000, 0x0000, 0xfefe, 0x00fe, 0xfefe, 0x00fe, 0xfefe, 0x00fe, 0xfefe, 0x00fe, 0xfefe, 0x00fe, 0xfefe, 0x00fe, 0xfefe, 0x00fe };
static int16 iiio[] = { 0x0000, 0x0000, 0xfefe, 0xfe00, 0xfefe, 0xfe00, 0xfefe, 0xfe00, 0xfefe, 0xfe00, 0xfefe, 0xfe00, 0xfefe, 0xfe00, 0xfefe, 0xfe00 };
static int16 iiii[] = { 0x0000, 0x0000, 0xfefe, 0xfefe, 0xfefe, 0xfefe, 0xfefe, 0xfefe, 0xfefe, 0xfefe, 0xfefe, 0xfefe, 0xfefe, 0xfefe, 0xfefe, 0xfefe };

static MFDB the_mfdb = { NULL, 32, 8, 2, 1, 1, 0, 0, 0 };
static int16 color[2] = { 1, 0 };

static int16 *pic[] = {
	oooo,
	oooi,
	ooio,
	ooii,
	oioo,
	oioi,
	oiio,
	oiii,
	iooo,
	iooi,
	ioio,
	ioii,
	iioo,
	iioi,
	iiio,
	iiii
};

#define IMAGE_MAXW  192
#define IMAGE_MAXH  192

/* mo_index is at this offset in object structure */
#define mo_index ob_width

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edim_col(void)
{
	int16 select;
	
	/* FIXME: color value not clipped */
	if ((select = oe_colsel(ACSblk->ev_object[EDIT_IMAGE_IMAGE].ob_spec.bitblk->bi_color, EDIT_IMAGE_COLOR_BOX, EDIT_IMAGE_COLOR_POPUP, EDIT_IMAGE_COLOR)) >= 0)
	{
		ACSblk->ev_object[EDIT_IMAGE_IMAGE].ob_spec.bitblk->bi_color = select;
		ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_IMAGE_DRAWFRAME, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edim_thin(void)
{
	OBJECT *obj = &ACSblk->ev_object[EDIT_IMAGE2_BRUSH];
	obj->ob_width = obj->ob_height = 8;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_IMAGE2_BRUSH_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edim_thick(void)
{
	OBJECT *obj = &ACSblk->ev_object[EDIT_IMAGE2_BRUSH];
	obj->ob_width = obj->ob_height = 24;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_IMAGE2_BRUSH_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edim_black(void)
{
	OBJECT *tree = ACSblk->ev_object;
	
	tree[EDIT_IMAGE2_BITMAP + 1].mo_index = MOUSE_BRUSH_BLACK;
	tree[EDIT_IMAGE2_BRUSH].ob_spec.obspec.fillpattern = 7;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_IMAGE2_BRUSH_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edim_white(void)
{
	OBJECT *tree = ACSblk->ev_object;
	
	tree[EDIT_IMAGE2_BITMAP + 1].mo_index = MOUSE_BRUSH_WHITE;
	tree[EDIT_IMAGE2_BRUSH].ob_spec.obspec.fillpattern = 0;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_IMAGE2_BRUSH_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edim_nextpattern(void)
{
	ConvInt32To2Int16 *parm = (ConvInt32To2Int16 *)&ACSblk->ev_object[EDIT_IMAGE_DRAWFRAME].ob_spec.auserblk->ub_parm;
	int16 pattern;
	
	pattern = parm->val16.lowWord;
	pattern += 0x10;
	pattern &= 0x70;
	parm->val16.lowWord &= ~0x70;
	parm->val16.lowWord |= pattern;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_IMAGE_DRAWFRAME, -1);
}

/* -------------------------------------------------------------------------- */

static void edim_up(void)
{
	IMAGEPARM *parm;
	BITBLK *bit;
	int16 width;
	int16 size;
	int16 *ptr;
	int16 *ptr2;
	int16 count;
	
	parm = ACSblk->ev_window->user;
	bit = parm->work[EDIT_IMAGE_IMAGE].ob_spec.bitblk;
	width = (bit->bi_wb >> 1); /* BUG: not rounded up */
	size = width * bit->bi_hl;
	ptr = parm->data;
	ptr2 = &ptr[width];
	for (count = size - width; count > 0; count--)
		*ptr++ = *ptr2++;
	ptr = &parm->data[size - 1];
	for (count = width; count > 0; count--)
		*ptr-- = 0;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_IMAGE2_BITMAP, -1);
}

/* -------------------------------------------------------------------------- */

static void edim_down(void)
{
	IMAGEPARM *parm;
	BITBLK *bit;
	int16 width;
	int16 size;
	int16 *ptr;
	int16 *ptr2;
	int16 count;
	
	parm = ACSblk->ev_window->user;
	bit = parm->work[EDIT_IMAGE_IMAGE].ob_spec.bitblk;
	width = (bit->bi_wb >> 1); /* BUG: not rounded up */
	size = width * bit->bi_hl;
	ptr = &parm->data[size - 1];
	ptr2 = ptr - width;
	for (count = size - width; count > 0; count--)
		*ptr-- = *ptr2--;
	ptr = parm->data;
	for (count = width; count > 0; count--)
		*ptr++ = 0;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_IMAGE2_BITMAP, -1);
}

/* -------------------------------------------------------------------------- */

static void edim_right(void)
{
	IMAGEPARM *parm;
	BITBLK *bit;
	int16 size;
	int16 count;
	int16 width;
	int16 *ptr;
	uint16 mask;
	
	parm = ACSblk->ev_window->user;
	bit = parm->work[EDIT_IMAGE_IMAGE].ob_spec.bitblk;
	width = (bit->bi_wb >> 1);
	size = width * bit->bi_hl;
	(void)size; /* FIXME: only to get registers right */
	ptr = parm->data;
	mask = 0;
	for (count = size; count > 0; count--)
	{
		if (mask & 1)
		{
			mask = *ptr;
			*ptr++ = (mask >> 1) | 0x8000;
		} else
		{
			mask = *ptr;
			*ptr++ = mask >> 1;
		}
	}
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_IMAGE2_BITMAP, -1);
}

/* -------------------------------------------------------------------------- */

static void edim_left(void)
{
	IMAGEPARM *parm;
	BITBLK *bit;
	int16 width;
	int16 size;
	int16 *ptr;
	int16 count;
	uint16 mask;
	
	parm = ACSblk->ev_window->user;
	bit = parm->work[EDIT_IMAGE_IMAGE].ob_spec.bitblk;
	width = (bit->bi_wb >> 1); /* BUG: not rounded up */
	size = width * bit->bi_hl;
	ptr = &parm->data[size - 1];
	mask = 0;
	for (count = size; count > 0; count--)
	{
		if (0x8000 & mask)
		{
			mask = *ptr;
			*ptr-- = (mask << 1) | 0x0001;
		} else
		{
			mask = *ptr;
			*ptr-- = mask << 1;
		}
	}
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_IMAGE2_BITMAP, -1);
}

/* -------------------------------------------------------------------------- */

static void edim_resize(OBJECT *tree, BITBLK *bit, int16 w, int16 h)
{
	int16 oldwords, newwords;
	int16 x, y;
	int16 oldy;
	int16 newy;
	
	w = (w + 15) & -16;
	oldwords = bit->bi_wb >> 1;
	newwords = w >> 4;
	if (newwords > oldwords)
	{
		for (y = bit->bi_hl - 1; y >= 0; y--)
		{
			oldy = y * oldwords;
			newy = y * newwords;
			for (x = oldwords - 1; x >= 0; x--)
			{
				bit->bi_pdata[newy + x] = bit->bi_pdata[oldy + x];
			}
			for (x = oldwords; x < newwords; x++)
				bit->bi_pdata[newy + x] = 0;
		}
	}
	if (newwords < oldwords)
	{
		for (y = 0; y < bit->bi_hl; y++)
		{
			oldy = y * oldwords;
			newy = y * newwords;
			for (x = 0; x < newwords; x++)
			{
				bit->bi_pdata[newy + x] = bit->bi_pdata[oldy + x];
			}
		}
	}
	for (y = h - 1; y >= bit->bi_hl; y--)
	{
		newy = y * newwords;
		for (x = newwords - 1; x >= 0; x--)
			bit->bi_pdata[newy + x] = 0;
	}
	
	tree[EDIT_IMAGE_SIZEBOX].ob_width = w;
	bit->bi_wb = w >> 3;
	tree[EDIT_IMAGE_SIZEBOX].ob_height = bit->bi_hl = h;
}

/* -------------------------------------------------------------------------- */

static void edim_direct(void)
{
	Awindow *win;
	BITBLK *bit;
	int w;
	int h;
	
	win = WI_IMPOS.create(&WI_IMPOS);
	if (win == NULL)
		return;
	bit = ACSblk->ev_object[EDIT_IMAGE_IMAGE].ob_spec.bitblk;
	Aob_printf(win->work, IM_POS_WIDTH, "%d", bit->bi_wb << 3);
	Aob_printf(win->work, IM_POS_HEIGHT, "%d", bit->bi_hl);
	if (Awi_dialog(win) == IM_POS_OK)
	{
		Aob_scanf(win->work, IM_POS_WIDTH, "%d", &w);
		Aob_scanf(win->work, IM_POS_HEIGHT, "%d", &h);
		if (w > IMAGE_MAXW)
			w = IMAGE_MAXW;
		if (h > IMAGE_MAXH)
			h = IMAGE_MAXH;
		w = (w + 15) & -16;
		h = (((imagesnap - 1) >> 1) + h) & -imagesnap;
		edim_resize(ACSblk->ev_object, bit, w, h);
		ACSblk->ev_object[EDIT_IMAGE_SIZEBOX].ob_flags |= OF_HIDETREE;
		ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_IMAGE_DRAWFRAME, -1);
	}
	Awi_delete(win);
}

/* -------------------------------------------------------------------------- */

static int16 control(OBJECT *tree, Axywh *pos, int16 x, int16 y)
{
	if ((tree[EDIT_IMAGE_SIZEBOX].ob_flags & OF_HIDETREE) ||
		tree[EDIT_IMAGE_SIZEBOX].ob_x != pos->x ||
		tree[EDIT_IMAGE_SIZEBOX].ob_y != pos->y ||
		tree[EDIT_IMAGE_SIZEBOX].ob_width != pos->w ||
		tree[EDIT_IMAGE_SIZEBOX].ob_height != pos->h)
	{
		tree[EDIT_IMAGE_SIZEBOX].ob_flags &= ~OF_HIDETREE;
		tree[EDIT_IMAGE_SIZEBOX].ob_x = pos->x;
		tree[EDIT_IMAGE_SIZEBOX].ob_y = pos->y;
		tree[EDIT_IMAGE_SIZEBOX].ob_width = pos->w;
		tree[EDIT_IMAGE_SIZEBOX].ob_height = pos->h;
		return 0;
	}
	x = (pos->x + pos->w - 1) - x;
	y = (pos->y + pos->h - 1) - y;
	if ((x > 8 && x > (pos->w >> 3)) ||
		(y > 8 && y > (pos->h >> 3)))
		return 1;
	return 2;
}

/* -------------------------------------------------------------------------- */

static void edim_control(void)
{
	Axywh rect;
	Awindow *self;
	BITBLK *bit;
	OBJECT *tree;
	int16 obnr;
	int16 mox;
	int16 moy;
	int16 mmox;
	int16 mmoy;
	int16 w;
	int16 h;
	int16 destx, desty;
	int16 obx;
	int16 oby;

	self = ACSblk->ev_window;
	tree = self->work;
	obnr = ACSblk->ev_obnr;
	if (tree[obnr].ob_state & AOS_DCLICK)
	{
		edim_edit();
		return;
	}

	mox = ACSblk->ev_mmox;
	moy = ACSblk->ev_mmoy;
	objc_offset(tree, obnr, &obx, &oby);
	obx += self->wi_work.x;
	oby += self->wi_work.y;
	w = tree[obnr].ob_width;
	h = tree[obnr].ob_height;
	if (w > IMAGE_MAXW)
		w = IMAGE_MAXW;
	if (h > IMAGE_MAXW)
		h = IMAGE_MAXW;
	mmox = mox - obx;
	mmoy = moy - oby;

	bit = tree[obnr].ob_spec.bitblk;
	rect.x = bit->bi_x;
	rect.y = bit->bi_y;
	rect.w = bit->bi_wb << 3;
	rect.h = bit->bi_hl;
	if (Aob_within(&rect, mmox, mmoy))
	{
		switch (control(tree, &rect, mmox, mmoy))
		{
		case 2:
			if (A_rubberbox(obx + bit->bi_x, oby + bit->bi_y,
				16, 8,
				&destx, &desty, w - bit->bi_x, h - bit->bi_y))
			{
				edim_resize(tree, bit, destx, desty);
			}
			break;
		
		case 1:
			return;
		}
	} else
	{
		if (tree[EDIT_IMAGE_SIZEBOX].ob_flags & OF_HIDETREE)
			return;
		tree[EDIT_IMAGE_SIZEBOX].ob_flags |= OF_HIDETREE;
	}
		
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_IMAGE_DRAWFRAME, -1);
}

/* -------------------------------------------------------------------------- */

static void edim_set(void)
{
	Awindow *self;
	IMAGEPARM *parm;
	BITBLK *bit;
	int16 mox;
	int16 moy;
	int16 obx;
	int16 oby;
	Axywh rect;
	int16 mobutton;
	int16 kstate;
	int16 obnr;
	OBJECT *tree;
	int16 *ptr;
	int16 width, height;
	int16 x;
	uint16 mask;
	int16 pos;
	
	self = ACSblk->ev_window;
	tree = self->work;
	mox = ACSblk->ev_mmox;
	moy = ACSblk->ev_mmoy;
	obnr = ACSblk->ev_obnr;
	if (tree[obnr].ob_state & AOS_DCLICK)
	{
		switch (tree[EDIT_IMAGE2_BITMAP + 1].mo_index)
		{
		case MOUSE_BRUSH_BLACK:
			edim_white();
			break;
		case MOUSE_BRUSH_WHITE:
			edim_black();
			break;
		}
		return;
	}
	objc_offset(self->work, obnr, &obx, &oby);
	do
	{
		mox = (mox - self->wi_work.x - obx) / 8;
		moy = (moy - self->wi_work.y - oby) / 8;
		rect.x = mox * 8 + self->wi_work.x + obx;
		rect.y = moy * 8 + self->wi_work.y + oby;
		rect.w = rect.h = 8;
		parm = self->user;
		bit = parm->work[EDIT_IMAGE_IMAGE].ob_spec.bitblk;
		
		width = bit->bi_wb >> 1;
		height = bit->bi_hl - 1;
		pos = width * moy + (mox >> 4);
		ptr = &parm->data[pos];
		x = 15 - (mox & 15);
		if (parm->edit[EDIT_IMAGE2_BRUSH].ob_width == 8)
		{
			mask = 1 << x;
			switch (parm->edit[EDIT_IMAGE2_BRUSH].ob_spec.obspec.fillpattern)
			{
			case 7:
				if (!(*ptr & mask))
				{
					*ptr |= mask;
					self->redraw(self, &rect);
				}
				break;
			case 0:
				if (*ptr & mask)
				{
					*ptr &= ~mask;
					self->redraw(self, &rect);
				}
				break;
			default:
				self->redraw(self, &rect);
				break;
			}
		} else
		{
			if (x > 0)
				mask = 7 << (x - 1);
			else
				mask = 3;
			switch (parm->edit[EDIT_IMAGE2_BRUSH].ob_spec.obspec.fillpattern)
			{
			case 7:
				if (moy != 0)
					*(ptr - width) |= mask;
				if (moy != height)
					ptr[width] |= mask;
				*ptr |= mask;
				break;
			case 0:
				if (moy != 0)
					*(ptr - width) &= ~mask;
				if (moy != height)
					ptr[width] &= ~mask;
				*ptr &= ~mask;
				break;
			default:
				break;
			}
			mask = 0;
			if (x == 0 && mox != (bit->bi_wb << 3) - 1)
			{
				mask = 0x8000;
				ptr++;
			}
			if (x == 15 && mox != 0)
			{
				mask = 0x0001;
				ptr--;
			}
			if (mask != 0)
			{
				switch (parm->edit[EDIT_IMAGE2_BRUSH].ob_spec.obspec.fillpattern)
				{
				case 7:
					if (moy != 0)
						*(ptr - width) |= mask;
					if (moy != height)
						ptr[width] |= mask;
					*ptr |= mask;
					break;
				case 0:
					if (moy != 0)
						*(ptr - width) &= ~mask;
					if (moy != height)
						ptr[width] &= ~mask;
					*ptr &= ~mask;
					break;
				}
			}
			rect.x -= 8;
			rect.y -= 8;
			rect.w += 16;
			rect.h += 16;
			self->redraw(self, &rect);
		}
		graf_mkstate(&mox, &moy, &mobutton, &kstate);
	} while (mobutton & 1);
}

/* -------------------------------------------------------------------------- */

static void edim_abort(void)
{
	edim_term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void edim_ok(void)
{
	accept_image(ACSblk->ev_window);
	edim_term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void edim_accept(void)
{
	Awindow *self = ACSblk->ev_window;
	IMAGEPARM *parm;
	OBJECT *tree;
	Awindow *select;
	int16 obnr;
	AOBJECT *aobj;
	MFDB *src;
	ssize_t size;
	BITBLK *bit;
	
	tree = self->work;
	/* FIXME: check against self, like in ediconed */
	select = ACSblk->Aselect.window;
	Adr_start();
	if ((obnr = Adr_next()) < 0)
		return;
	aobj = (AOBJECT *)(&select->work[obnr] + 1);
	/* BUG: AT_MFDB is not set in resource */
	if (aobj->type != AT_MFDB)
		return;
	src = aobj->userp1;
	/* BUG: does not check planes */
	if (src->fd_w > IMAGE_MAXW || src->fd_h > IMAGE_MAXW || src->fd_stand != 1)
	{
		Awi_alert(1, ERR_LARGE);
		return;
	}
	size = (ssize_t)src->fd_h * 2 * src->fd_wdwidth;
	parm = self->user;
	/*
	 * BUG: no check whether size fits
	 */
	memcpy(parm->data, src->fd_addr, size);
	bit = parm->work[EDIT_IMAGE_IMAGE].ob_spec.bitblk;
	tree[EDIT_IMAGE_SIZEBOX].ob_width = src->fd_wdwidth << 4;
	bit->bi_wb = src->fd_wdwidth * 2;
	tree[EDIT_IMAGE_SIZEBOX].ob_height = bit->bi_hl = src->fd_h;
	self->obchange(self, EDIT_IMAGE_DRAWFRAME, -1);
	Adr_del(select, obnr);
}

/* -------------------------------------------------------------------------- */

/*
 * Draw-routine for the icon in the image editor
 */
static int16 CDECL edim_bitmap(PARMBLK *pb)
{
	Awindow *self;
	IMAGEPARM *parm;
	BITBLK *bit;
	int16 *dataptr;
	int16 pxy[8];
	int16 clip[4];
	int16 width;
	int16 x, y;
	int16 i;
	int16 val;
	
	clip[2] = pb->pb_wc;
	clip[3] = pb->pb_hc;
	/* FIXME: must always be set, since it is used in the loop below */
	if (clip[2] != 0 || clip[3] != 0)
	{
		clip[0] = pb->pb_xc;
		clip[1] = pb->pb_yc;
		clip[2] += clip[0] - 1;
		clip[3] += clip[1] - 1;
		vs_clip(ACSblk->vdi_handle, TRUE, clip);
	}
	self = (Awindow *)pb->pb_parm;
	parm = self->user;
	bit = parm->work[EDIT_IMAGE_IMAGE].ob_spec.bitblk;
	dataptr = bit->bi_pdata;
	width = bit->bi_wb >> 1;
	pxy[0] = 0;
	pxy[1] = 0;
	pxy[2] = 32 - 1;
	pxy[3] = 8 - 1;
	pxy[5] = pb->pb_y;
	pxy[7] = pb->pb_y + 8 - 1;
	
	for (y = 0; y < bit->bi_hl; y++)
	{
		if (pxy[7] >= clip[1] && pxy[5] <= clip[3])
		{
			pxy[4] = pb->pb_x;
			pxy[6] = pb->pb_x + 32 - 1;
			for (x = 0; x < width; x++)
			{
				val = *dataptr++;
				if (pxy[6] + 128 >= clip[0] && pxy[4] <= clip[2])
				{
					for (i = 3; i >= 0; i--)
					{
						if (pxy[6] >= clip[0] && pxy[4] <= clip[2])
						{
							the_mfdb.fd_addr = pic[(val >> 12) & 15];
							vrt_cpyfm(ACSblk->vdi_handle, MD_REPLACE, pxy, &the_mfdb, &ACSblk->screenMFDB, color);
						}
						val <<= 4;
						pxy[4] += 32;
						pxy[6] += 32;
					}
				} else
				{
					pxy[4] += 128;
					pxy[6] += 128;
				}
			}
		} else
		{
			dataptr += width;
		}
		pxy[5] += 8;
		pxy[7] += 8;
	}
	
	vs_clip(ACSblk->vdi_handle, FALSE, clip);
	return pb->pb_currstate;
}

/* -------------------------------------------------------------------------- */

static void edim_struct(void)
{
	Awindow *self;
	IMAGEPARM *parm;
	Axywh rect;
	int16 kind;
	
	ACSblk->ev_object[ACSblk->ev_obnr].ob_state &= ~OS_SELECTED;
	self = ACSblk->ev_window;
	parm = self->user;
	Awi_diaend();
	self->ob_edit = -1;
	self->work = parm->work;
	self->wi_act.w = ACSblk->gl_wattr * 2 + self->work->ob_width;
	self->wi_act.h = ACSblk->gl_hattr * 4 + self->work->ob_height;
	wind_calc(WC_BORDER, self->wi_kind & ~(SIZER | UPARROW | DNARROW | VSLIDE | LFARROW | RTARROW | HSLIDE),
		self->work->ob_x, self->work->ob_y, self->work->ob_width, self->work->ob_height,
		&rect.x, &rect.y, &rect.w, &rect.h);
	kind = self->wi_kind;
	if (rect.w < ACSblk->desk.w)
		kind &= ~(LFARROW | RTARROW | HSLIDE);
	if (rect.h < ACSblk->desk.h)
		kind &= ~(UPARROW | DNARROW | VSLIDE);
	if ((kind & (VSLIDE | HSLIDE)) == 0)
		kind &= ~SIZER;
	if (self->wi_kind != kind)
	{
		self->wi_kind = kind;
		self->state |= AWS_TERM;
		Awi_closed(self);
		Awi_open(self);
		self->state &= ~AWS_TERM;
	} else
	{
		view_shrink(self);
	}
}

/* -------------------------------------------------------------------------- */

static void edim_edit(void)
{
	Awindow *self = ACSblk->ev_window;
	IMAGEPARM *parm;
	OBJECT *edit;
	OBJECT *work;
	BITBLK *bit;
	int16 w, h;
	
	ACSblk->ev_object[ACSblk->ev_obnr].ob_state &= ~OS_SELECTED;
	parm = self->user;
	Awi_diaend();
	self->ob_edit = -1;
	edit = parm->edit;
	self->work = edit;
	work = parm->work;
	bit = work[EDIT_IMAGE_IMAGE].ob_spec.bitblk;
	w = (bit->bi_wb * 8) * 8;
	h = bit->bi_hl * 8;
	edit[EDIT_IMAGE2_BITMAP].ob_spec.userblk->ub_parm = (int32)self;
	edit[EDIT_IMAGE2_BITMAP].ob_width = w;
	edit[EDIT_IMAGE2_DRAWFRAME].ob_width = w;
	edit[EDIT_IMAGE2_BITMAP].ob_height = h;
	edit[EDIT_IMAGE2_DRAWFRAME].ob_height = h;
	edit[EDIT_IMAGE2_BITMAP + 1].mo_index = MOUSE_BRUSH_BLACK;
	
	w += ACSblk->gl_wbox * 2 + edit[EDIT_IMAGE2_DRAWFRAME].ob_x;
	h += ACSblk->gl_hbox * 2 + edit[EDIT_IMAGE2_DRAWFRAME].ob_y;
	if (w < work->ob_width)
		edit[ROOT].ob_width = work->ob_width;
	else
		edit[ROOT].ob_width = w;
	if (h < work->ob_height)
		edit[ROOT].ob_height = work->ob_height;
	else
		edit[ROOT].ob_height = h;
	edit[EDIT_IMAGE2_BRUSH].ob_width = edit[EDIT_IMAGE2_BRUSH].ob_height = 8;
	edit[EDIT_IMAGE2_BRUSH].ob_spec.obspec.fillpattern = 7;
	self->wi_act.w = ACSblk->desk.w < ACSblk->gl_wattr * 2 + self->work->ob_width ? ACSblk->desk.w : ACSblk->gl_wattr * 2 + self->work->ob_width;
	self->wi_act.h = ACSblk->desk.h < ACSblk->gl_hattr * 4 + self->work->ob_height ? ACSblk->desk.h : ACSblk->gl_hattr * 4 + self->work->ob_height;
	if (!(self->wi_kind & VSLIDE) || !(self->wi_kind & HSLIDE))
	{
		self->state |= AWS_TERM;
		Awi_closed(self);
		self->wi_kind |= SIZER | UPARROW | DNARROW | VSLIDE | LFARROW | RTARROW | HSLIDE;
		Awi_open(self);
		self->state &= ~AWS_TERM;
	} else
	{
		view_grow(self);
	}
}

/* -------------------------------------------------------------------------- */

static void accept_image(Awindow *self)
{
	IMAGEPARM *parm = self->user;
	OBJECT *tree;
	Obj_Head *obj;
	BITBLK *oldbit;
	BITBLK *newbit;
	BITBLK *bit;
	ssize_t datasize;
	ssize_t size;
	
	parm->acs->flags |= ACS_CHANGED;
	obj = parm->obj;
	tree = parm->work;
	oldbit = obj->object;
	bit = tree[EDIT_IMAGE_IMAGE].ob_spec.bitblk;
	datasize = bit->bi_wb * bit->bi_hl;
	size = datasize + sizeof(*bit);
	newbit = Ax_malloc(size);
	if (newbit == NULL)
		return;
	memcpy(newbit, bit, sizeof(*newbit));
	newbit->bi_pdata = (void *)sizeof(*newbit); /* offset to data */
	obj->object = newbit;
	memcpy(++newbit, bit->bi_pdata, datasize);
	obj->used = obj->size = size;
	Ax_free(oldbit);
}

/* -------------------------------------------------------------------------- */

static Awindow *im_make(void *a)
{
	IMAGEPARM *parm;
	IMAGEPARM *newparm;
	Awindow *win;
	Obj_Head *obj;
	
	parm = a;
	obj = parm->obj;
	win = obj->window;
	if (win != NULL)
	{
		Awi_show(win);
	} else
	{
		if ((newparm = Ax_malloc(sizeof(*newparm))) == NULL)
			return NULL;
		newparm->acs = parm->acs;
		newparm->obj = parm->obj;
		WI_IMAGE.iconblk->monoblk.ib_ptext = WI_IMAGE.info = obj->label;
		win = Awi_create(&WI_IMAGE);
		if (win == NULL)
		{
			/* Ax_free(newparm); BUG: missing */
			return NULL;
		}
		wi_pos(win, &obj->pos, &parm->acs->last_rez);
		win->user = newparm;
		newparm->work = win->work;
		newparm->edit = Aob_create(&EDIT_IMAGE2);
		if (newparm->edit == NULL)
		{
			/* Ax_free(win); BUG: missing */
			/* Ax_free(newparm); BUG: missing */
			return NULL;
		}
		Aob_fix(newparm->edit);
		obj->window = win;
		edim_set_image(win);
		if (win->open(win) != OK)
		{
			edim_term(win);
			return NULL;
		}
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static boolean im_service(Awindow *self, int16 task, void *in_out)
{
	IMAGEPARM *parm = self->user;
	
	switch (task)
	{
	case AS_TERM:
		accept_image(self);
		edim_term(self);
		break;
	
	case AS_GUI_RENAME_OBJ:
		new_name(self, parm->obj);
		break;
	
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void edim_set_image(Awindow *self)
{
	IMAGEPARM *parm;
	OBJECT *tree;
	BITBLK *bit;
	BITBLK *data;
	ssize_t size;
	
	parm = self->user;
	tree = parm->work;
	bit = tree[EDIT_IMAGE_IMAGE].ob_spec.bitblk;
	data = parm->obj->object;
	data->bi_x = data->bi_y = 0; /* WTF: modifies original image */
	memcpy(bit, data, sizeof(*bit));
	size = (IMAGE_MAXW / 8) * IMAGE_MAXH;
	
	parm->data = bit->bi_pdata = Ax_malloc(size);
	if (parm->data != NULL)
		memcpy(parm->data, (char *)data + (ssize_t)data->bi_pdata, size); /* BUG: accesses too much data */
	/* FIXME: color value not clipped */
	Aob_puttext(self->work, EDIT_IMAGE_COLOR_POPUP, colour_text[bit->bi_color]);
	self->work[EDIT_IMAGE_COLOR].ob_spec.obspec.interiorcol = bit->bi_color;
}

/* -------------------------------------------------------------------------- */

static void edim_term(Awindow *self)
{
	IMAGEPARM *parm;
	
	self->state |= AWS_TERM;
	parm = self->user;
	parm->obj->window = NULL;
	if (self->work == parm->work)
		Aob_delete(parm->edit);
	else
		Aob_delete(parm->work);
	if (self->state & AWS_ICONIZED)
		memcpy(&parm->obj->pos, &self->wi_normal, sizeof(parm->obj->pos));
	else
		memcpy(&parm->obj->pos, &self->wi_act, sizeof(parm->obj->pos));
	Ax_free(parm->data);
	Ax_free(parm);
	Awi_closed(self);
	Awi_delete(self);
}

