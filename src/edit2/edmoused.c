#include "acs_i.h"
#include "country.h"

static void edmo_black(void);
static void edmo_white(void);
static void edmo_frontcol(void);
static void edmo_backcol(void);
static void edmo_invisible(void);
static void edmo_x(void);
static void edmo_y(void);
static void edmo_set(void);
static void edmo_next(void);
static void edmo_ok(void);
static void edmo_abort(void);

static int16 CDECL edmo_bitmap(PARMBLK *pb);

static boolean mo_service(Awindow *self, int16 task, void *in_out);
static Awindow *mo_make(void *a);

#include "edmoused.ah"
#include "edmoused.h"

static int16 blackim[] = { 0x0000, 0xfe00, 0xfe00, 0xfe00, 0xfe00, 0xfe00, 0xfe00, 0xfe00 };
static MFDB black = { blackim, 8, 8, 1, 1, 1, 0, 0, 0 };

static int16 whiteim[] = { 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 };
static MFDB white = { whiteim, 8, 8, 1, 1, 1, 0, 0, 0 };

static int16 invisiim[] = { 0x0000, 0xaa00, 0x5400, 0xaa00, 0x5400, 0xaa00, 0x5400, 0xaa00 };
static MFDB invisible = { invisiim, 8, 8, 1, 1, 1, 0, 0, 0 };

static int16 color[] = { 1, 0 };

static void edmo_term(Awindow *self);
static void accept_mouse(Awindow *self);
static void edmo_set_mouse(Awindow *self);

/* mo_index is at this offset in object structure */
#define mo_index ob_width

typedef struct {
	ACS_HEAD *acs;
	Obj_Head *obj;
	int16 image[32];
} MOUSEPARM;

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edmo_backcol(void)
{
	int16 *color;
	int16 select;
	
	color = &ACSblk->ev_object[EDIT_MOUSE_ICON].ob_spec.iconblk->ib_char;
	if ((select = oe_colsel((*color >> 8) & 15, EDIT_MOUSE_BACK_BOX, EDIT_MOUSE_BACK_POPUP, EDIT_MOUSE_BACK_COLOR)) >= 0)
	{
		*color = (*color & 0xf0ff) | (select << 8);
		ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_MOUSE_DRAWFRAME, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edmo_frontcol(void)
{
	int16 *color;
	int16 select;
	
	color = &ACSblk->ev_object[EDIT_MOUSE_ICON].ob_spec.iconblk->ib_char;
	if ((select = oe_colsel((*color >> 12) & 15, EDIT_MOUSE_FRONT_BOX, EDIT_MOUSE_FRONT_POPUP, EDIT_MOUSE_FRONT_COLOR)) >= 0)
	{
		*color = (*color & 0x0fff) | (select << 12);
		ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_MOUSE_DRAWFRAME, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edmo_black(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *work = self->work;
	
	work[EDIT_MOUSE_IMAGE + 1].mo_index = MOUSE_BRUSH_BLACK;
	work[EDIT_MOUSE_BRUSH].ob_spec.obspec.fillpattern = 7;
	self->obchange(self, EDIT_MOUSE_BRUSH, -1);
}

/* -------------------------------------------------------------------------- */

static void edmo_white(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *work = self->work;
	
	work[EDIT_MOUSE_IMAGE + 1].mo_index = MOUSE_BRUSH_WHITE;
	work[EDIT_MOUSE_BRUSH].ob_spec.obspec.fillpattern = 0;
	self->obchange(self, EDIT_MOUSE_BRUSH, -1);
}

/* -------------------------------------------------------------------------- */

static void edmo_invisible(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *work = self->work;
	
	work[EDIT_MOUSE_IMAGE + 1].mo_index = MOUSE_BRUSH_TRANS;
	work[EDIT_MOUSE_BRUSH].ob_spec.obspec.fillpattern = 4;
	self->obchange(self, EDIT_MOUSE_BRUSH, -1);
}

/* -------------------------------------------------------------------------- */

static void edmo_next(void)
{
	ConvInt32To2Int16 *parm = (ConvInt32To2Int16 *)&ACSblk->ev_object[EDIT_MOUSE_DRAWFRAME].ob_spec.auserblk->ub_parm;
	int16 pattern;
	
	pattern = parm->val16.lowWord;
	pattern += 0x10;
	pattern &= 0x70;
	parm->val16.lowWord &= ~0x70;
	parm->val16.lowWord |= pattern;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_MOUSE_DRAWFRAME, -1);
}

/* -------------------------------------------------------------------------- */

static void edmo_x(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	int16 obx, oby;
	int16 mox;
	
	mox = ACSblk->ev_mmox;
	objc_offset(tree, ACSblk->ev_obnr, &obx, &oby);
	mox = (((mox - self->wi_work.x - obx) / 8) & 15) * 8;
	if (mox != tree[EDIT_MOUSE_X].ob_x)
	{
		tree[EDIT_MOUSE_X].ob_flags |= OF_HIDETREE;
		Awi_obredraw(self, EDIT_MOUSE_X);
		tree[EDIT_MOUSE_X].ob_flags &= ~OF_HIDETREE;
		tree[EDIT_MOUSE_X].ob_x = mox;
		self->obchange(self, EDIT_MOUSE_X, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edmo_y(void)
{
	Awindow *self = ACSblk->ev_window;
	OBJECT *tree = self->work;
	int16 obx, oby;
	int16 moy;
	
	moy = ACSblk->ev_mmoy;
	objc_offset(tree, ACSblk->ev_obnr, &obx, &oby);
	moy = (((moy - self->wi_work.y - oby) / 8) & 15) * 8;
	if (moy != tree[EDIT_MOUSE_Y].ob_y)
	{
		tree[EDIT_MOUSE_Y].ob_flags |= OF_HIDETREE;
		Awi_obredraw(self, EDIT_MOUSE_Y);
		tree[EDIT_MOUSE_Y].ob_flags &= ~OF_HIDETREE;
		tree[EDIT_MOUSE_Y].ob_y = moy;
		self->obchange(self, EDIT_MOUSE_Y, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edmo_set(void)
{
	Awindow *self;
	MOUSEPARM *parm;
	int16 mox;
	int16 moy;
	int16 obx;
	int16 oby;
	Axywh rect;
	int16 mobutton;
	int16 kstate;
	OBJECT *tree;
	int16 *data;
	int16 *mask;
	uint16 bitmask;
	
	self = ACSblk->ev_window;
	tree = self->work;
	if (tree[ACSblk->ev_obnr].ob_state & AOS_DCLICK)
	{
		switch (tree[EDIT_MOUSE_IMAGE + 1].mo_index)
		{
		case MOUSE_BRUSH_BLACK:
			edmo_white();
			break;
		case MOUSE_BRUSH_WHITE:
			edmo_invisible();
			break;
		case MOUSE_BRUSH_TRANS:
			edmo_black();
			break;
		}
		return;
	}
	mox = ACSblk->ev_mmox;
	moy = ACSblk->ev_mmoy;
	parm = self->user;
	do
	{
		objc_offset(tree, ACSblk->ev_obnr, &obx, &oby);
		mox = (mox - self->wi_work.x - obx) / 8;
		moy = (moy - self->wi_work.y - oby) / 8;
		if (mox < 0 || moy < 0 || mox > 15 || moy > 15)
			return;
		rect.x = mox * 8 + self->wi_work.x + obx;
		rect.y = moy * 8 + self->wi_work.y + oby;
		rect.w = rect.h = 8;
		
		mask = &parm->image[moy];
		data = mask + 16;
		bitmask = 1 << (15 - mox);
		switch (tree[EDIT_MOUSE_BRUSH].ob_spec.obspec.fillpattern)
		{
		case 7:
			if ((*data & bitmask) && (*mask & bitmask))
			{
				graf_mkstate(&mox, &moy, &mobutton, &kstate);
				continue;
			}
			*data |= bitmask;
			*mask |= bitmask;
			break;
		case 0:
			if (!(*data & bitmask) && (*mask & bitmask))
			{
				graf_mkstate(&mox, &moy, &mobutton, &kstate);
				continue;
			}
			*data &= ~bitmask;
			*mask |= bitmask;
			break;
		case 4:
			if (!(*data & bitmask) && !(*mask & bitmask))
			{
				graf_mkstate(&mox, &moy, &mobutton, &kstate);
				continue;
			}
			*data &= ~bitmask;
			*mask &= ~bitmask;
			break;
		}
		self->redraw(self, &rect);
		objc_offset(tree, EDIT_MOUSE_ICON, &obx, &oby);
		rect.x = self->wi_work.x + mox + obx;
		rect.y = self->wi_work.y + moy + oby;
		rect.w = rect.h = 1;
		self->redraw(self, &rect);
		graf_mkstate(&mox, &moy, &mobutton, &kstate);
	} while (mobutton & 1);
}

/* -------------------------------------------------------------------------- */

static void edmo_abort(void)
{
	edmo_term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void edmo_ok(void)
{
	accept_mouse(ACSblk->ev_window);
	edmo_term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

/*
 * Draw-routine for the icon in the mouse editor
 */
static int16 CDECL edmo_bitmap(PARMBLK *pb)
{
	Awindow *self;
	MOUSEPARM *parm;
	int16 *dataptr;
	int16 *maskptr;
	int16 pxy[8];
	int16 clip[4];
	int16 x, y;
	int16 data;
	int16 mask;
	
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
	maskptr = parm->image;
	dataptr = maskptr + 16;
	pxy[0] = 0;
	pxy[1] = 0;
	pxy[2] = 8 - 1;
	pxy[3] = 8 - 1;
	pxy[5] = pb->pb_y;
	pxy[7] = pb->pb_y + 8 - 1;
	
	for (y = 0; y < 16; y++)
	{
		if (pxy[7] >= clip[1] && pxy[5] <= clip[3])
		{
			pxy[4] = pb->pb_x;
			pxy[6] = pb->pb_x + 8 - 1;
			data = *dataptr++;
			mask = *maskptr++;
			for (x = 16 - 1; x >= 0; x--)
			{
				if (pxy[6] >= clip[0] && pxy[4] <= clip[2])
				{
					if (data & 0x8000)
						vrt_cpyfm(ACSblk->vdi_handle, MD_REPLACE, pxy, &black, &ACSblk->screenMFDB, color);
					else if (mask & 0x8000)
						vrt_cpyfm(ACSblk->vdi_handle, MD_REPLACE, pxy, &white, &ACSblk->screenMFDB, color);
					else
						vrt_cpyfm(ACSblk->vdi_handle, MD_REPLACE, pxy, &invisible, &ACSblk->screenMFDB, color);
				}
				data <<= 1;
				mask <<= 1;
				pxy[4] += 8;
				pxy[6] += 8;
			}
		} else
		{
			dataptr++;
			maskptr++;
		}
		pxy[5] += 8;
		pxy[7] += 8;
	}
	
	vs_clip(ACSblk->vdi_handle, FALSE, clip);
	return pb->pb_currstate;
}

/* -------------------------------------------------------------------------- */

static void accept_mouse(Awindow *self)
{
	MOUSEPARM *parm = self->user;
	MFORM *form;
	Obj_Head *obj;
	OBJECT *tree;
	ICONBLK *icon;
	
	parm->acs->flags |= ACS_CHANGED;
	obj = parm->obj;
	tree = self->work;
	form = obj->object;
	icon = tree[EDIT_MOUSE_ICON].ob_spec.iconblk;
	form->mf_fg = (icon->ib_char >> 8) & 15;
	form->mf_bg = (icon->ib_char >> 12) & 15;
	form->mf_xhot = tree[EDIT_MOUSE_X].ob_x / 8;
	form->mf_yhot = tree[EDIT_MOUSE_Y].ob_y / 8;
	memcpy(form->mf_mask, parm->image, sizeof(parm->image));
}

/* -------------------------------------------------------------------------- */

static Awindow *mo_make(void *a)
{
	MOUSEPARM *parm;
	MOUSEPARM *newparm;
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
		newparm = Ax_malloc(sizeof(*newparm));
		if (newparm == NULL)
			return NULL;
		newparm->acs = parm->acs;
		newparm->obj = parm->obj;
		WI_MOUSE.iconblk->monoblk.ib_ptext = WI_MOUSE.info = obj->label;
		win = Awi_create(&WI_MOUSE);
		if (win == NULL)
		{
			/* Ax_free(newparm); BUG: missing */
			return NULL;
		}
		wi_pos(win, &obj->pos, &parm->acs->last_rez);
		win->user = newparm;
		obj->window = win;
		edmo_set_mouse(win);
		if (win->open(win) != OK)
		{
			edmo_term(win);
			return NULL;
		}
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static boolean mo_service(Awindow *self, int16 task, void *in_out)
{
	MOUSEPARM *parm = self->user;
	
	switch (task)
	{
	case AS_TERM:
		accept_mouse(self);
		edmo_term(self);
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

static void edmo_set_mouse(Awindow *self)
{
	MOUSEPARM *parm;
	MFORM *form;
	OBJECT *tree;
	OBJECT *ptr;
	OBJECT *box;
	int16 width;
	int16 h;
	ICONBLK *icon;
	int16 color;
	
	parm = self->user;
	form = parm->obj->object;
	tree = self->work;
	width = 8 * 16 - 1;
	box = &tree[EDIT_MOUSE_BOX];
	ptr = &tree[EDIT_MOUSE_IMAGE];
	ptr->ob_spec.userblk->ub_parm = (int32)self;
	box->ob_width = width + ptr->ob_x + 1;
	box->ob_height = width + ptr->ob_y + 1;
	ptr->ob_width = ptr->ob_height = width;
	h = box->ob_y + box->ob_height + ACSblk->gl_hbox;
	if (h > tree->ob_height)
		tree->ob_height = h;
	ptr = &tree[EDIT_MOUSE_BOX_X];
	ptr->ob_width = width;
	ptr = &tree[EDIT_MOUSE_X];
	ptr->ob_width = 8;
	ptr->ob_x = form->mf_xhot * 8;
	ptr = &tree[EDIT_MOUSE_BOX_Y];
	ptr->ob_height = width;
	ptr = &tree[EDIT_MOUSE_Y];
	ptr->ob_height = 8;
	ptr->ob_y = form->mf_yhot * 8;
	ptr = &tree[EDIT_MOUSE_ICON];
	ptr->ob_width = ptr->ob_height = 16;
	icon = ptr->ob_spec.iconblk;
	icon->ib_char = ((form->mf_bg << 4) + form->mf_fg) << 8;
	icon->ib_pmask = parm->image;
	icon->ib_pdata = &parm->image[16];
	icon->ib_xtext = 0;
	icon->ib_ytext = 18;
	icon->ib_wtext = 16;
	icon->ib_htext = 2;
	memcpy(parm->image, form->mf_mask, sizeof(parm->image));
	color = (icon->ib_char >> 12) & 15;
	Aob_puttext(self->work, EDIT_MOUSE_FRONT_POPUP, colour_text[color]);
	self->work[EDIT_MOUSE_FRONT_COLOR].ob_spec.obspec.interiorcol = color;
	color = (icon->ib_char >> 8) & 15;
	Aob_puttext(self->work, EDIT_MOUSE_BACK_POPUP, colour_text[color]);
	self->work[EDIT_MOUSE_BACK_COLOR].ob_spec.obspec.interiorcol = color;
}

/* -------------------------------------------------------------------------- */

static void edmo_term(Awindow *self)
{
	MOUSEPARM *parm;
	
	self->state |= AWS_TERM;
	parm = self->user;
	if (self->state & AWS_ICONIZED)
		memcpy(&parm->obj->pos, &self->wi_normal, sizeof(parm->obj->pos));
	else
		memcpy(&parm->obj->pos, &self->wi_act, sizeof(parm->obj->pos));
	parm->obj->window = NULL;
	Ax_free(parm);
	Awi_closed(self);
	Awi_delete(self);
}
