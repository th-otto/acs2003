#include "acs_i.h"
#include "country.h"

static int16 CDECL edic_bitmap(PARMBLK *pb);
static int16 CDECL IcnCol(PARMBLK *pb);
static int16 CDECL piccolor(PARMBLK *pb);

static void edic_frontcol(void);
static void edic_backcol(void);
static void edic_accept(void);
static void edic_control(void);
static void edic_newplane(void);
static void edic_select(void);
static void edic_delplane(void);
static void edic_nextpattern(void);
static void edic_edit(void);
static void edic_direct(void);
static void edic_ok(void);
static void edic_abort(void);

static void edic_white(void);
static void edic_black(void);
static void edic_invisible(void);
static void edic_thin(void);
static void edic_thick(void);
static void edic_left(void);
static void edic_up(void);
static void edic_down(void);
static void edic_right(void);
static void edic_struct(void);
static void edic_set(void);

static void edic_deskicon(void);

static int16 ic_keys(Awindow *window, int16 kstate, int16 key);

static boolean ic_service(Awindow *self, int16 task, void *in_out);
static Awindow *ic_make(void *a);

#include "ediconed.ah"
#include "ediconed.h"

/* mo_index is at this offset in object structure */
#define mo_index ob_width

static int16 plane_brush[] = { 0xffff, 0xffff, 0xffff };
static MFDB brush = { plane_brush, 16, 3, 1, 0, 1, 0, 0, 0 };

static void edic_term(Awindow *self);
static void accept_icon(Awindow *self);
static void edic_set_icon(Awindow *self);

#define ICON_MAXW  192
#define ICON_MAXH  192

static int16 to2plane[24];
static int16 toplane[24];
static int16 zoomplane[((256 / 8) * ICON_MAXH) / 2];
static int16 zoom2plane[((256 / 8) * ICON_MAXH) / 2];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edic_backcol(void)
{
	int16 *color;
	int16 select;
	
	color = &ACSblk->ev_object[EDIT_ICON_ICON].ob_spec.ciconblk->monoblk.ib_char;
	if ((select = oe_colsel((*color >> 8) & 15, EDIT_ICON_BACK_BOX, EDIT_ICON_BACK_POPUP, EDIT_ICON_BACK_COLOR)) >= 0)
	{
		*color = (*color & 0xf0ff) | (select << 8);
		ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_ICON_DRAWFRAME, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edic_frontcol(void)
{
	int16 *color;
	int16 select;
	
	color = &ACSblk->ev_object[EDIT_ICON_ICON].ob_spec.ciconblk->monoblk.ib_char;
	if ((select = oe_colsel((*color >> 12) & 15, EDIT_ICON_FRONT_BOX, EDIT_ICON_FRONT_POPUP, EDIT_ICON_FRONT_COLOR)) >= 0)
	{
		*color = (*color & 0x0fff) | (select << 12);
		ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_ICON_DRAWFRAME, -1);
	}
}

/* -------------------------------------------------------------------------- */

static int16 getFgColor(int16 color)
{
	int16 rgb[3];
	
	vq_color(ACSblk->vdi_handle, color, FALSE, rgb);
	if (rgb[0] < 500 && rgb[1] < 400 && rgb[2] < 600)
		return G_WHITE;
	return G_BLACK;
}

/* -------------------------------------------------------------------------- */

static void *ito_cicon(int16 *data, int16 *mask, CICONBLK *icon, int16 planes)
{
	ssize_t size;
	char *newdata;
	
	if (planes == ACSblk->nplanes)
	{
		return to_cicon(data, mask, icon, planes);
	} else
	{
		size = (((icon->monoblk.ib_wicon + 15) & -16) * icon->monoblk.ib_hicon) >> 3;
		size = size * planes;
		newdata = Ax_malloc(size + sizeof(a_hcicon));
		if (newdata == NULL)
			return NULL;
		memcpy(newdata + sizeof(a_hcicon), (char *)data + sizeof(a_hcicon), size);
		return newdata + sizeof(a_hcicon);
	}
}

/* -------------------------------------------------------------------------- */

static void mfdb_dm(MFDB *data, MFDB *mask, ICONPARM *parm, OBJECT *obj)
{
	CICONBLK *cicon;
	
	cicon = obj->ob_spec.ciconblk;
	if (ACSblk->description->flags & AB_NOTRANSICON)
		data->fd_stand = mask->fd_stand = 1;
	else
		data->fd_stand = mask->fd_stand = 0;
	data->fd_w = mask->fd_w = cicon->monoblk.ib_wicon;
	data->fd_h = mask->fd_h = cicon->monoblk.ib_hicon;
	data->fd_wdwidth = mask->fd_wdwidth = mask->fd_w >> 4; /* BUG: not rounded up */
	data->fd_r1 = data->fd_r2 = data->fd_r3 = mask->fd_r1 = mask->fd_r2 = mask->fd_r3 = 0;
	mask->fd_nplanes = 1;
	data->fd_addr = parm->data;
	mask->fd_addr = parm->mask;
	data->fd_nplanes = 1;
	/*
	 * FIXME: crap. That allows to only edit the 16 color icon in 16 color resolutions,
	 * and the 256 color icon in 256 color resolutions.
	 * It does not allow to edit any of the icons in hi-/truecolor resolutions.
	 */
	if (parm->c16.num_planes == ACSblk->nplanes)
	{
		data->fd_nplanes = ACSblk->nplanes;
		if (parm->c16.sel_data != NULL && (obj->ob_state & OS_SELECTED))
		{
			mask->fd_addr = parm->c16.sel_mask;
			data->fd_addr = parm->c16.sel_data;
		} else
		{
			mask->fd_addr = parm->c16.col_mask;
			data->fd_addr = parm->c16.col_data;
		}
	}
	if (parm->c256.num_planes == ACSblk->nplanes)
	{
		data->fd_nplanes = ACSblk->nplanes;
		if (parm->c256.sel_data != NULL && (obj->ob_state & OS_SELECTED))
		{
			mask->fd_addr = parm->c256.sel_mask;
			data->fd_addr = parm->c256.sel_data;
		} else
		{
			mask->fd_addr = parm->c256.col_mask;
			data->fd_addr = parm->c256.col_data;
		}
	}
}

/* -------------------------------------------------------------------------- */

static void *from_cicon(void *data, CICONBLK *icon, int16 planes)
{
	int16 width;
	ssize_t planesize;
	ssize_t size;
	void *dest;
	MFDB dst;
	MFDB src;
	
	width = (icon->monoblk.ib_wicon + 15) & -16;
	planesize = (width * icon->monoblk.ib_hicon) >> 3;
	size = planesize * planes;
	dest = Ax_malloc(size);
	if (dest == NULL)
		return NULL;
	if (planes != ACSblk->nplanes || (ACSblk->description->flags & AB_NOTRANSICON))
	{
		memcpy(dest, data, size);
	} else
	{
		dst.fd_stand = 1;
		src.fd_stand = 0;
		src.fd_w = width;
		dst.fd_w = width;
		dst.fd_h = src.fd_h = icon->monoblk.ib_hicon;
		dst.fd_wdwidth = src.fd_wdwidth = width >> 4;
		dst.fd_nplanes = src.fd_nplanes = ACSblk->nplanes;
		dst.fd_r1 = dst.fd_r2 = dst.fd_r3 = src.fd_r1 = src.fd_r2 = src.fd_r3 = 0;
		src.fd_addr = data;
		dst.fd_addr = dest;
		vr_trnfm(ACSblk->vdi_handle, &src, &dst);
	}
	return dest;
}

/* -------------------------------------------------------------------------- */

static void edic_link(Awindow *self)
{
	ICONPARM *parm = self->user;
	CICONBLK *icon;
	CICON *cicon;
	
	icon = parm->work[EDIT_ICON_ICON].ob_spec.ciconblk;
	icon->monoblk.ib_pmask = parm->mask;
	icon->monoblk.ib_pdata = parm->data;
	cicon = NULL;
	if (ACSblk->nplanes == parm->c256.num_planes)
	{
		cicon = &parm->c256;
		cicon->col_data = parm->c256.col_data; /* WTF? useless */
		cicon->col_mask = parm->c256.col_mask;
		cicon->sel_data = parm->c256.sel_data;
		cicon->sel_mask = parm->c256.sel_mask;
	} else if (ACSblk->nplanes == parm->c16.num_planes)
	{
		cicon = &parm->c16;
		cicon->col_data = parm->c16.col_data; /* WTF? useless */
		cicon->col_mask = parm->c16.col_mask;
		cicon->sel_data = parm->c16.sel_data;
		cicon->sel_mask = parm->c16.sel_mask;
	}
	icon->mainlist = cicon;
	Aob_icon(&parm->work[EDIT_ICON_ICON]);
}

/* -------------------------------------------------------------------------- */

static void edic_thin(void)
{
	OBJECT *obj;
	
	obj = &ACSblk->ev_object[EDIT_ICON2_BRUSH];
	obj->ob_width = obj->ob_height = 8;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_ICON2_BRUSH_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edic_thick(void)
{
	OBJECT *obj;
	
	obj = &ACSblk->ev_object[EDIT_ICON2_BRUSH];
	obj->ob_width = obj->ob_height = 24;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_ICON2_BRUSH_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edic_black0(void)
{
	OBJECT *tree = ACSblk->ev_object;
	ICONPARM *parm = ACSblk->ev_window->user;
	
	tree[EDIT_ICON2_IMAGE + 1].mo_index = MOUSE_BRUSH_BLACK;
	tree[EDIT_ICON2_BRUSH].ob_spec.auserblk->ub_parm = 
		ACSblk->description->mouse[MOUSE_BRUSH_BLACK].form->mf_bg = parm->color;
	ACSblk->description->mouse[MOUSE_BRUSH_BLACK].form->mf_fg = getFgColor(parm->color);
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_ICON2_BRUSH_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edic_black(void)
{
	ICONPARM *parm = ACSblk->ev_window->user;
	int16 color;
	
	if (parm->c16.num_planes == ACSblk->nplanes)
		color = Ame_popup(ACSblk->ev_window, &COLOR.root, -1, -1);
	else if (parm->c256.num_planes == ACSblk->nplanes)
		color = Ame_popup(ACSblk->ev_window, &COLOR256.root, -1, -1);
	else
		color = G_BLACK + 1;
	if (color > 0)
	{
		--color;
		parm->color = color;
		if (color > 0)
			edic_black0();
		else
			edic_white();
	}
}

/* -------------------------------------------------------------------------- */

static void edic_white(void)
{
	OBJECT *tree = ACSblk->ev_object;
	ICONPARM *parm = ACSblk->ev_window->user;
	
	parm->color = G_WHITE;
	tree[EDIT_ICON2_IMAGE + 1].mo_index = MOUSE_BRUSH_WHITE;
	tree[EDIT_ICON2_BRUSH].ob_spec.auserblk->ub_parm = G_WHITE;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_ICON2_BRUSH_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edic_invisible(void)
{
	OBJECT *tree = ACSblk->ev_object;
	ICONPARM *parm = ACSblk->ev_window->user;
	
	parm->color = -1;
	tree[EDIT_ICON2_IMAGE + 1].mo_index = MOUSE_BRUSH_TRANS;
	tree[EDIT_ICON2_BRUSH].ob_spec.auserblk->ub_parm = -1;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_ICON2_BRUSH_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edic_nextpattern(void)
{
	ConvInt32To2Int16 *parm = (ConvInt32To2Int16 *)&ACSblk->ev_object[EDIT_ICON_DRAWFRAME].ob_spec.auserblk->ub_parm;
	int16 pattern;
	
	pattern = parm->val16.lowWord;
	pattern += 0x10;
	pattern &= 0x70;
	parm->val16.lowWord &= ~0x70;
	parm->val16.lowWord |= pattern;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_ICON_DRAWFRAME, -1);
}

/* -------------------------------------------------------------------------- */

static int16 snap(short val)
{
	return (((imagesnap - 1) >> 1) + val) & -imagesnap;
}

/* -------------------------------------------------------------------------- */

static void do_plane(MFDB *src, MFDB *dst, short planes, ssize_t planesize, int16 *pxy, int16 **data)
{
	int16 *ptr;
	MFDB *srctmp;
	MFDB *dsttmp;
	int16 i;
	
	if (planes == 1)
	{
		ptr = Ax_malloc(planes * planesize);
	} else
	{
		ptr = Ax_malloc(planes * planesize + sizeof(a_hcicon));
		if (ptr != NULL)
			ptr += sizeof(a_hcicon) / sizeof(*ptr);
	}
	if (ptr == NULL)
		return;
	dst->fd_addr = ptr;
	src->fd_addr = *data;
	memset(ptr, 0, planes * planesize);
	if (ACSblk->nplanes == planes)
	{
		dst->fd_nplanes = src->fd_nplanes = ACSblk->nplanes;
		if (ACSblk->description->flags & AB_NOTRANSICON)
		{
			if ((srctmp = Abp_create(src->fd_w, src->fd_h)) == NULL ||
				(dsttmp = Abp_create(dst->fd_w, dst->fd_h)) == NULL)
			{
				if (srctmp != NULL)
					Abp_delete(srctmp);
				if (planes == 1)
					Ax_free(dst->fd_addr);
				else
					Ax_free((int16 *)dst->fd_addr - sizeof(a_hcicon) / sizeof(*ptr));
				return;
			}
			src->fd_stand = dst->fd_stand = 1;
			srctmp->fd_stand = dsttmp->fd_stand = 0;
			vr_trnfm(ACSblk->vdi_handle, src, srctmp);
			vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, srctmp, dsttmp);
			vr_trnfm(ACSblk->vdi_handle, dsttmp, dst);
			Abp_delete(dsttmp);
			Abp_delete(srctmp);
		} else
		{
			vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, src, dst);
		}
	} else
	{
		dst->fd_nplanes = src->fd_nplanes = 1;
		for (i = planes - 1; i >= 0; i--)
		{
			vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, src, dst);
#ifdef __GNUC__
			/* avoid type-punned pointer */
			dst->fd_addr = (char *)dst->fd_addr + planesize;
			src->fd_addr = (char *)src->fd_addr + planesize;
#else
			*((char **)&dst->fd_addr) += planesize;
			*((char **)&src->fd_addr) += planesize;
#endif
		}
	}
	if (planes == 1)
		Ax_ifree(*data);
	else
		Ax_ifree(*data - sizeof(a_hcicon) / sizeof(*ptr));
	*data = ptr;
}

/* -------------------------------------------------------------------------- */

static void edic_resize(Awindow *self, int16 w, int16 h)
{
	ICONPARM *parm = self->user;
	CICONBLK *icon = parm->work[EDIT_ICON_ICON].ob_spec.ciconblk;
	ssize_t planesize;
	MFDB src;
	MFDB dst;
	int16 pxy[8];
	
	w = (w + 15) & -16;
	dst.fd_stand = 0;
	dst.fd_w = w;
	dst.fd_h = h;
	dst.fd_wdwidth = w >> 4;
	src.fd_stand = 1;
	src.fd_h = icon->monoblk.ib_hicon;
	src.fd_w = icon->monoblk.ib_wicon;
	src.fd_wdwidth = src.fd_w >> 4; /* BUG: not rounded up */
	dst.fd_r1 = dst.fd_r2 = dst.fd_r3 = src.fd_r1 = src.fd_r2 = src.fd_r3 = 0;
	pxy[0] = pxy[1] = pxy[4] = pxy[5] = 0;
	pxy[2] = pxy[6] = icon->monoblk.ib_wicon - 1;
	pxy[3] = pxy[7] = icon->monoblk.ib_hicon - 1;
	if (icon->monoblk.ib_wicon > w)
		pxy[2] = pxy[6] = w - 1;
	if (icon->monoblk.ib_hicon > h)
		pxy[3] = pxy[7] = h - 1;
	planesize = ((ssize_t) w * h) >> 3;
	do_plane(&src, &dst, 1, planesize, pxy, &parm->data);
	do_plane(&src, &dst, 1, planesize, pxy, &parm->mask);
	if (parm->c16.num_planes > 0)
	{
		do_plane(&src, &dst, 4, planesize, pxy, &parm->c16.col_data);
		do_plane(&src, &dst, 1, planesize, pxy, &parm->c16.col_mask);
		if (parm->c16.sel_data != NULL)
		{
			do_plane(&src, &dst, 4, planesize, pxy, &parm->c16.sel_data);
			do_plane(&src, &dst, 1, planesize, pxy, &parm->c16.sel_mask);
		}
	}
	if (parm->c256.num_planes > 0)
	{
		do_plane(&src, &dst, 8, planesize, pxy, &parm->c256.col_data);
		do_plane(&src, &dst, 1, planesize, pxy, &parm->c256.col_mask);
		if (parm->c256.sel_data != NULL)
		{
			do_plane(&src, &dst, 8, planesize, pxy, &parm->c256.sel_data);
			do_plane(&src, &dst, 1, planesize, pxy, &parm->c256.sel_mask);
		}
	}
	parm->work[EDIT_ICON_SIZEBOX].ob_width = icon->monoblk.ib_wicon = snap(w);
	parm->work[EDIT_ICON_SIZEBOX].ob_height = icon->monoblk.ib_hicon = snap(h);
	edic_link(self);
}

/* -------------------------------------------------------------------------- */

static void edic_check(CICONBLK *icon)
{
	int16 x;
	
	/* FIXME: nonsense of arbitrary limits will corrupt icons */
	if (icon->monoblk.ib_wicon > ICON_MAXW)
		icon->monoblk.ib_wicon = ICON_MAXW;
	if (icon->monoblk.ib_hicon > ICON_MAXH)
		icon->monoblk.ib_hicon = ICON_MAXH;
	/* BUG: will disallow icon sizes not dividable by 16 */
	icon->monoblk.ib_wicon = (icon->monoblk.ib_wicon + 15) & -16;
	icon->monoblk.ib_hicon = snap(icon->monoblk.ib_hicon);
	if (icon->monoblk.ib_wtext > ICON_MAXW)
		icon->monoblk.ib_wtext = ICON_MAXW;
	if (icon->monoblk.ib_htext > ICON_MAXH)
		icon->monoblk.ib_htext = ICON_MAXH;
	icon->monoblk.ib_wtext = snap(icon->monoblk.ib_wtext);
	icon->monoblk.ib_htext = snap(icon->monoblk.ib_htext);
	x = icon->monoblk.ib_xchar + 6 - icon->monoblk.ib_wicon;
	if (x > 0)
		icon->monoblk.ib_xchar -= x;
	x = icon->monoblk.ib_ychar + 6 - icon->monoblk.ib_hicon;
	if (x > 0)
		icon->monoblk.ib_ychar -= x;
	x = icon->monoblk.ib_xicon + icon->monoblk.ib_wicon - ICON_MAXW;
	if (x > 0)
		icon->monoblk.ib_xicon -= x;
	x = icon->monoblk.ib_yicon + icon->monoblk.ib_hicon - ICON_MAXH;
	if (x > 0)
		icon->monoblk.ib_yicon -= x;
	x = icon->monoblk.ib_xtext + icon->monoblk.ib_wtext - ICON_MAXW;
	if (x > 0)
		icon->monoblk.ib_xtext -= x;
	x = icon->monoblk.ib_ytext + icon->monoblk.ib_htext - ICON_MAXH;
	if (x > 0)
		icon->monoblk.ib_ytext -= x;
	icon->monoblk.ib_xchar = snap(icon->monoblk.ib_xchar);
	icon->monoblk.ib_ychar = snap(icon->monoblk.ib_ychar);
	icon->monoblk.ib_xicon = snap(icon->monoblk.ib_xicon);
	icon->monoblk.ib_yicon = snap(icon->monoblk.ib_yicon);
	icon->monoblk.ib_xtext = snap(icon->monoblk.ib_xtext);
	icon->monoblk.ib_ytext = snap(icon->monoblk.ib_ytext);
}

/* -------------------------------------------------------------------------- */

static void edic_deskicon(void)
{
	Awindow *parent;
	OBJECT *tree;
	CICONBLK *icon;
	
	parent = ACSblk->ev_window->user;
	icon = parent->work[EDIT_ICON_ICON].ob_spec.ciconblk;
	tree = ACSblk->ev_object;
	Awi_diaend();
	Aob_printf(tree, IC_POS_XICON, "%d", (72 - icon->monoblk.ib_wicon) >> 1);
	ACSblk->ev_window->obchange(ACSblk->ev_window, IC_POS_XICON, -1);
	Aob_printf(tree, IC_POS_XTEXT, "0");
	ACSblk->ev_window->obchange(ACSblk->ev_window, IC_POS_XTEXT, -1);
	Aob_printf(tree, IC_POS_YTEXT, "32");
	ACSblk->ev_window->obchange(ACSblk->ev_window, IC_POS_YTEXT, -1);
	Aob_printf(tree, IC_POS_WTEXT, "72");
	ACSblk->ev_window->obchange(ACSblk->ev_window, IC_POS_WTEXT, -1);
	Aob_printf(tree, IC_POS_HTEXT, "8");
	ACSblk->ev_window->obchange(ACSblk->ev_window, IC_POS_HTEXT, -1);
	Awi_diastart();
}

/* -------------------------------------------------------------------------- */

static void edic_direct(void)
{
	Awindow *win;
	CICONBLK *icon;
	int16 oldw, oldh;
	int16 w, h;
	
	win = WI_POS.create(&WI_POS);
	if (win == NULL)
		return;
	win->user = ACSblk->ev_window;
	icon = ACSblk->ev_object[EDIT_ICON_ICON].ob_spec.ciconblk;
	Aob_printf(win->work, IC_POS_XCHAR, "%d", icon->monoblk.ib_xchar);
	Aob_printf(win->work, IC_POS_YCHAR, "%d", icon->monoblk.ib_ychar);
	Aob_printf(win->work, IC_POS_XICON, "%d", icon->monoblk.ib_xicon);
	Aob_printf(win->work, IC_POS_YICON, "%d", icon->monoblk.ib_yicon);
	Aob_printf(win->work, IC_POS_WICON, "%d", icon->monoblk.ib_wicon);
	Aob_printf(win->work, IC_POS_HICON, "%d", icon->monoblk.ib_hicon);
	Aob_printf(win->work, IC_POS_XTEXT, "%d", icon->monoblk.ib_xtext);
	Aob_printf(win->work, IC_POS_YTEXT, "%d", icon->monoblk.ib_ytext);
	Aob_printf(win->work, IC_POS_WTEXT, "%d", icon->monoblk.ib_wtext);
	Aob_printf(win->work, IC_POS_HTEXT, "%d", icon->monoblk.ib_htext);
	if (Awi_dialog(win) == IC_POS_OK)
	{
		oldw = icon->monoblk.ib_wicon;
		oldh = icon->monoblk.ib_hicon;
#ifdef __GNUC__
		{
		int x;
		Aob_scanf(win->work, IC_POS_XCHAR, "%d", &x);
		icon->monoblk.ib_xchar = x;
		Aob_scanf(win->work, IC_POS_YCHAR, "%d", &x);
		icon->monoblk.ib_ychar = x;
		Aob_scanf(win->work, IC_POS_XICON, "%d", &x);
		icon->monoblk.ib_xicon = x;
		Aob_scanf(win->work, IC_POS_YICON, "%d", &x);
		icon->monoblk.ib_yicon = x;
		Aob_scanf(win->work, IC_POS_WICON, "%d", &x);
		icon->monoblk.ib_wicon = x;
		Aob_scanf(win->work, IC_POS_HICON, "%d", &x);
		icon->monoblk.ib_hicon = x;
		Aob_scanf(win->work, IC_POS_XTEXT, "%d", &x);
		icon->monoblk.ib_xtext = x;
		Aob_scanf(win->work, IC_POS_YTEXT, "%d", &x);
		icon->monoblk.ib_ytext = x;
		Aob_scanf(win->work, IC_POS_WTEXT, "%d", &x);
		icon->monoblk.ib_wtext = x;
		Aob_scanf(win->work, IC_POS_HTEXT, "%d", &x);
		icon->monoblk.ib_htext = x;
		}
#else
		Aob_scanf(win->work, IC_POS_XCHAR, "%d", &icon->monoblk.ib_xchar);
		Aob_scanf(win->work, IC_POS_YCHAR, "%d", &icon->monoblk.ib_ychar);
		Aob_scanf(win->work, IC_POS_XICON, "%d", &icon->monoblk.ib_xicon);
		Aob_scanf(win->work, IC_POS_YICON, "%d", &icon->monoblk.ib_yicon);
		Aob_scanf(win->work, IC_POS_WICON, "%d", &icon->monoblk.ib_wicon);
		Aob_scanf(win->work, IC_POS_HICON, "%d", &icon->monoblk.ib_hicon);
		Aob_scanf(win->work, IC_POS_XTEXT, "%d", &icon->monoblk.ib_xtext);
		Aob_scanf(win->work, IC_POS_YTEXT, "%d", &icon->monoblk.ib_ytext);
		Aob_scanf(win->work, IC_POS_WTEXT, "%d", &icon->monoblk.ib_wtext);
		Aob_scanf(win->work, IC_POS_HTEXT, "%d", &icon->monoblk.ib_htext);
#endif
		edic_check(icon);
		w = icon->monoblk.ib_wicon;
		h = icon->monoblk.ib_hicon;
		icon->monoblk.ib_wicon = oldw;
		icon->monoblk.ib_hicon = oldh;
		/* BUG: Awi_dialog may have changed global variables in ACSblk */
		edic_resize(ACSblk->ev_window, w, h);
		ACSblk->ev_object[EDIT_ICON_SIZEBOX].ob_flags |= OF_HIDETREE;
		ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_ICON_DRAWFRAME, -1);
	}
	Awi_delete(win);
}

/* -------------------------------------------------------------------------- */

static void edic_select(void)
{
	ACSblk->ev_object[EDIT_ICON_ICON].ob_state ^= OS_SELECTED;
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_ICON_DRAWFRAME, -1);
}

/* -------------------------------------------------------------------------- */

#define LEFT  0
#define RIGHT 1
#define UP    2
#define DOWN  3

static void edit_shift(Awindow *self, int16 direction)
{
	ICONPARM *parm = self->user;
	OBJECT *iconobj;
	CICONBLK *icon;
	MFDB data;
	MFDB mask;
	MFDB *bp;
	int16 pxy[8];
	int16 pxy2[8];
	
	iconobj = &parm->work[EDIT_ICON_ICON];
	icon = iconobj->ob_spec.ciconblk;
	mfdb_dm(&data, &mask, parm, iconobj);
#if WITH_FIXES
	bp = NULL;
#endif
	if (!(ACSblk->description->flags & AB_NOTRANSICON) ||
		(bp = Abp_create(data.fd_w, data.fd_h)) != NULL)
	{
		pxy[0] = pxy[1] = pxy[4] = pxy[5] =
		pxy2[0] = pxy2[1] = pxy2[4] = pxy2[5] = 0;
		pxy[2] = pxy[6] = pxy2[2] = pxy2[6] = icon->monoblk.ib_wicon - 1;
		pxy[3] = pxy[7] = pxy2[3] = pxy2[7] = icon->monoblk.ib_hicon - 1;
		switch (direction)
		{
		case LEFT:
			pxy[0] += 1;
			pxy[6] -= 1;
			pxy2[0] = pxy2[4] = pxy2[2];
			break;
		case RIGHT:
			pxy[2] -= 1;
			pxy[4] += 1;
			pxy2[2] = pxy2[6] = pxy2[0];
			break;
		case UP:
			pxy[1] += 1;
			pxy[7] -= 1;
			pxy2[1] = pxy2[5] = pxy2[3];
			break;
		case DOWN:
			pxy[3] -= 1;
			pxy[5] += 1;
			pxy2[3] = pxy2[7] = pxy2[1];
			break;
		}
		if ((ACSblk->description->flags & AB_NOTRANSICON) &&
			ACSblk->nplanes == data.fd_nplanes)
		{
			vr_trnfm(ACSblk->vdi_handle, &data, bp);
			vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, bp, bp);
			vro_cpyfm(ACSblk->vdi_handle, ALL_WHITE, pxy2, bp, bp);
			vr_trnfm(ACSblk->vdi_handle, bp, &data);
		} else
		{
			vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, &data, &data);
			vro_cpyfm(ACSblk->vdi_handle, ALL_WHITE, pxy2, &data, &data);
		}
		vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, &mask, &mask);
		vro_cpyfm(ACSblk->vdi_handle, ALL_WHITE, pxy2, &mask, &mask);
		if (ACSblk->description->flags & AB_NOTRANSICON)
			Abp_delete(bp);
		ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_ICON2_IMAGE, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edic_up(void)
{
	edit_shift(ACSblk->ev_window, UP);
}

/* -------------------------------------------------------------------------- */

static void edic_down(void)
{
	edit_shift(ACSblk->ev_window, DOWN);
}

/* -------------------------------------------------------------------------- */

static void edic_right(void)
{
	edit_shift(ACSblk->ev_window, RIGHT);
}

/* -------------------------------------------------------------------------- */

static void edic_left(void)
{
	edit_shift(ACSblk->ev_window, LEFT);
}

/* -------------------------------------------------------------------------- */

static int16 control(OBJECT *tree, Axywh *pos, int16 x, int16 y)
{
	if ((tree[EDIT_ICON_SIZEBOX].ob_flags & OF_HIDETREE) ||
		tree[EDIT_ICON_SIZEBOX].ob_x != pos->x ||
		tree[EDIT_ICON_SIZEBOX].ob_y != pos->y ||
		tree[EDIT_ICON_SIZEBOX].ob_width != pos->w ||
		tree[EDIT_ICON_SIZEBOX].ob_height != pos->h)
	{
		tree[EDIT_ICON_SIZEBOX].ob_flags &= ~OF_HIDETREE;
		tree[EDIT_ICON_SIZEBOX].ob_x = pos->x;
		tree[EDIT_ICON_SIZEBOX].ob_y = pos->y;
		tree[EDIT_ICON_SIZEBOX].ob_width = pos->w;
		tree[EDIT_ICON_SIZEBOX].ob_height = pos->h;
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

static void edic_control(void)
{
	int16 destx, desty;
	int16 obx;
	int16 oby;
	int16 pxy[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	Axywh rect;
	Awindow *self;
	ICONBLK *icon;
	OBJECT *tree;
	MFDB *bp;
	MFDB dst;
	ssize_t len;
	int16 obnr;
	int16 mox;
	int16 moy;
	int16 w;
	int16 h;
	int16 tmp;

	self = ACSblk->ev_window;
	tree = self->work;
	obnr = ACSblk->ev_obnr;
	if (tree[obnr].ob_state & AOS_DCLICK)
	{
		edic_edit();
		return;
	}

	mox = ACSblk->ev_mmox;
	moy = ACSblk->ev_mmoy;
	objc_offset(tree, obnr, &obx, &oby);
	obx += self->wi_work.x;
	oby += self->wi_work.y;
	w = tree[obnr].ob_width;
	h = tree[obnr].ob_height;
	mox -= obx;
	moy -= oby;

	icon = tree[obnr].ob_spec.iconblk;
	rect.x = icon->ib_xchar + icon->ib_xicon;
	rect.y = icon->ib_ychar + icon->ib_yicon;
	rect.w = rect.h = 6;
	if (Aob_within(&rect, mox, moy))
	{
		graf_dragbox(6, 6, obx + rect.x, oby + rect.y,
			obx + icon->ib_xicon, oby + icon->ib_yicon,
			icon->ib_wicon, icon->ib_hicon,
			&destx, &desty);
		icon->ib_xchar = snap(destx - obx - icon->ib_xicon);
		icon->ib_ychar = snap(desty - oby - icon->ib_yicon);
	} else
	{
		rect.x = icon->ib_xtext;
		rect.y = icon->ib_ytext;
		rect.w = icon->ib_wtext;
		rect.h = icon->ib_htext;
		if (Aob_within(&rect, mox, moy))
		{
			switch (control(tree, &rect, mox, moy))
			{
			case 2:
				/* inside the corner */
				/* BUG: must not clip icon text size to object size */
				if (A_rubberbox(obx + icon->ib_xtext, oby + icon->ib_ytext,
					8, 8,
					&destx, &desty, w - icon->ib_xtext, h - icon->ib_ytext))
				{
					tree[EDIT_ICON_SIZEBOX].ob_width = icon->ib_wtext = snap(destx);
					tree[EDIT_ICON_SIZEBOX].ob_height = icon->ib_htext = snap(desty);
				}
				break;
			
			case 1:
				/* inside text */
				graf_dragbox(icon->ib_wtext, icon->ib_htext,
					obx + icon->ib_xtext, oby + icon->ib_ytext,
					obx, oby, w, h,
					&destx, &desty);
				tree[EDIT_ICON_SIZEBOX].ob_x = icon->ib_xtext = snap(destx - obx);
				tree[EDIT_ICON_SIZEBOX].ob_y = icon->ib_ytext = snap(desty - oby);
				break;
			}
		} else
		{
			rect.x = icon->ib_xicon;
			rect.y = icon->ib_yicon;
			rect.w = icon->ib_wicon;
			rect.h = icon->ib_hicon;
			if (Aob_within(&rect, mox, moy))
			{
				switch (control(tree, &rect, mox, moy))
				{
				case 2:
					tmp = w - icon->ib_xicon - ICON_MAXW;
					if (tmp > 0)
						w -= tmp;
					tmp = h - icon->ib_yicon - ICON_MAXH;
					if (tmp > 0)
						h -= tmp;
					if (A_rubberbox(obx + icon->ib_xicon, oby + icon->ib_yicon,
						16, 8,
						&destx, &desty, w - icon->ib_xicon, h - icon->ib_yicon))
					{
						edic_resize(ACSblk->ev_window, destx, desty);
					}
					break;
				
				case 1:
					if (ACSblk->ev_mmobutton == 2)
					{
						int16 wicon, hicon;
						ICONPARM *parm;
						
						parm = ACSblk->ev_window->user;
						icon = parm->work[EDIT_ICON_ICON].ob_spec.iconblk;
						wicon = icon->ib_wicon; 
						hicon = icon->ib_hicon;
						bp = Abp_create(wicon, hicon);
						if (bp == NULL)
							return;
						if (!(ACSblk->description->flags & AB_NOTRANSICON))
						{
							dst.fd_addr = parm->data;
							dst.fd_w = wicon;
							dst.fd_wdwidth = ((wicon + 15) & -16) >> 4;
							dst.fd_h = hicon;
							dst.fd_nplanes = 1;
							dst.fd_stand = dst.fd_r1 = dst.fd_r2 = dst.fd_r3 = 0;
							pxy[2] = pxy[6] = wicon - 1;
							pxy[3] = pxy[7] = hicon - 1;
						}
						len = ((wicon + 15) & -16) * hicon;
						len >>= 3;
						switch (ACSblk->nplanes)
						{
						case 8:
							if (parm->c256.num_planes == 8)
							{
								len <<= 4;
								if ((ACSblk->ev_object[EDIT_ICON_ICON].ob_state & OS_SELECTED) &&
									parm->c256.sel_data != NULL)
									memcpy(bp->fd_addr, parm->c256.sel_data, len);
								else
									memcpy(bp->fd_addr, parm->c256.col_data, len);
							} else
							{
								if (ACSblk->description->flags & AB_NOTRANSICON)
									memcpy(bp->fd_addr, parm->data, len);
								else
									vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, &dst, bp);
							}
							break;

						case 4:
							if (parm->c16.num_planes == 4)
							{
								len <<= 2;
								if ((ACSblk->ev_object[EDIT_ICON_ICON].ob_state & OS_SELECTED) &&
									parm->c16.sel_data != NULL)
									memcpy(bp->fd_addr, parm->c16.sel_data, len);
								else
									memcpy(bp->fd_addr, parm->c16.col_data, len);
							} else
							{
								if (ACSblk->description->flags & AB_NOTRANSICON)
									memcpy(bp->fd_addr, parm->data, len);
								else
									vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, &dst, bp);
							}
							break;
		
						case 1:
							memcpy(bp->fd_addr, parm->data, len);
							break;
						
						default:
							Abp_delete(bp);
							return;
						}
						if (!(ACSblk->description->flags & AB_NOTRANSICON))
						{
							bp->fd_stand = 0;
							vr_trnfm(ACSblk->vdi_handle, bp, bp);
						}
						bp->fd_stand = 1;
						ACSblk->ev_object[EDIT_ICON_CORNER].ob_flags &= ~OF_HIDETREE;
						ACSblk->ev_object[EDIT_ICON_CORNER].ob_x = ACSblk->ev_object[EDIT_ICON_ICON].ob_x + icon->ib_xicon;
						ACSblk->ev_object[EDIT_ICON_CORNER].ob_y = ACSblk->ev_object[EDIT_ICON_ICON].ob_y + icon->ib_yicon;
						ACSblk->ev_object[EDIT_ICON_CORNER].ob_width = wicon;
						ACSblk->ev_object[EDIT_ICON_CORNER].ob_height = hicon;
						((AOBJECT *)&ACSblk->ev_object[EDIT_ICON_CORNER + 1])->userp1 = bp;
						Adr_add(ACSblk->ev_window, EDIT_ICON_CORNER);
						Adr_drag(ACSblk->ev_mmox, ACSblk->ev_mmoy);
						Adr_del(ACSblk->ev_window, EDIT_ICON_CORNER);
						Abp_delete(bp);
						ACSblk->ev_object[EDIT_ICON_CORNER].ob_flags |= OF_HIDETREE;
						ACSblk->ev_object[EDIT_ICON_CORNER].ob_x =
						ACSblk->ev_object[EDIT_ICON_CORNER].ob_y =
						ACSblk->ev_object[EDIT_ICON_CORNER].ob_width =
						ACSblk->ev_object[EDIT_ICON_CORNER].ob_height = 0;
					} else
					{
						graf_dragbox(icon->ib_wicon, icon->ib_hicon,
							obx + icon->ib_xicon, oby + icon->ib_yicon,
							obx, oby, w, h, &destx, &desty);
						tree[EDIT_ICON_SIZEBOX].ob_x = icon->ib_xicon = snap(destx - obx);
						tree[EDIT_ICON_SIZEBOX].ob_y = icon->ib_yicon = snap(desty - oby);
					}
					break;
				}
			} else
			{
				if (tree[EDIT_ICON_SIZEBOX].ob_flags & OF_HIDETREE)
					return;
				tree[EDIT_ICON_SIZEBOX].ob_flags |= OF_HIDETREE;
			}
		}
	}
		
	ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_ICON_DRAWFRAME, -1);
}

/* -------------------------------------------------------------------------- */

static void edic_nextcol(Awindow *self)
{
	ICONPARM *parm;
	int16 colors;
	
	parm = self->user;
	colors = 2;
	if (parm->c16.num_planes == ACSblk->nplanes)
		colors = 16;
	if (parm->c256.num_planes == ACSblk->nplanes)
		colors = 256;
	switch (parm->edit[EDIT_ICON2_IMAGE + 1].mo_index)
	{
	case MOUSE_BRUSH_BLACK:
		++parm->color;
		if (parm->color < colors)
		{
			Amo_new(&ACSblk->description->mouse[MOUSE_BUSYBEE]);
			edic_black0();
		} else
		{
			parm->color = -1;
			edic_invisible();
		}
		break;
	case MOUSE_BRUSH_TRANS:
		edic_white();
		break;
	case MOUSE_BRUSH_WHITE:
		parm->color = G_BLACK;
		edic_black0();
		break;
	}
}

/* -------------------------------------------------------------------------- */

static void edic_set(void)
{
	ICONPARM *parm;
	int16 mox;
	int16 moy;
	int16 obx;
	int16 oby;
	Axywh rect;
	Awindow *self;
	int16 mobutton;
	int16 kstate;
	OBJECT *tree;
	MFDB data;
	MFDB mask;
	MFDB *bp;
	ICONBLK *icon;
	int16 fg[2] = { 1, 0 };
	int16 bg[2] = { 0, 0 };
	int16 pxy[8];
	int16 obnr;
	int16 lastx, lasty;
	
	self = ACSblk->ev_window;
	parm = self->user;
	tree = self->work;
	obnr = ACSblk->ev_obnr;
	if (tree[obnr].ob_state & AOS_DCLICK)
	{
		edic_nextcol(self);
		return;
	}
	icon = parm->work[EDIT_ICON_ICON].ob_spec.iconblk;
	mfdb_dm(&data, &mask, parm, &parm->work[EDIT_ICON_ICON]);
#if WITH_FIXES
	bp = NULL;
#endif
	if ((ACSblk->description->flags & AB_NOTRANSICON) &&
		(bp = Abp_create(data.fd_w, data.fd_h)) == NULL)
		return;
	fg[0] = parm->color;
	mox = ACSblk->ev_mmox;
	moy = ACSblk->ev_mmoy;
	objc_offset(tree, obnr, &obx, &oby);
	lastx = lasty = -1;
	do
	{
		mox = (mox - self->wi_work.x - obx) / 8;
		moy = (moy - self->wi_work.y - oby) / 8;
		if (mox != lastx || moy != lasty)
		{
			rect.x = mox * 8 + self->wi_work.x + obx;
			rect.y = moy * 8 + self->wi_work.y + oby;
			rect.w = rect.h = 8;
			if (parm->edit[EDIT_ICON2_BRUSH].ob_width == 8)
			{
				pxy[0] = pxy[1] = pxy[2] = pxy[3] = 1;
			} else
			{
				pxy[0] = pxy[1] = 0;
				pxy[2] = pxy[3] = 2;
				rect.x -= 8;
				rect.y -= 8;
				rect.w += 16;
				rect.h += 16;
			}
			if (mox < 0)
				break;
			if (moy < 0)
				break;
			if (mox >= icon->ib_wicon)
				break;
			if (moy >= icon->ib_hicon)
				break;
			pxy[4] = mox + pxy[0] - 1;
			pxy[5] = moy + pxy[1] - 1;
			pxy[6] = mox + pxy[2] - 1;
			pxy[7] = moy + pxy[3] - 1;
			if (pxy[4] < 0)
			{
				pxy[0] -= pxy[4];
				pxy[4] = 0;
			}
			if (pxy[5] < 0)
			{
				pxy[1] -= pxy[5];
				pxy[5] = 0;
			}
			if (pxy[6] >= icon->ib_wicon)
			{
				pxy[2] -= pxy[6] - icon->ib_wicon + 1;
				pxy[6] = icon->ib_wicon - 1;
			}
			if (pxy[7] >= icon->ib_hicon)
			{
				pxy[3] -= pxy[7] - icon->ib_hicon + 1;
				pxy[7] = icon->ib_hicon - 1;
			}
			if ((ACSblk->description->flags & AB_NOTRANSICON) &&
				ACSblk->nplanes == data.fd_nplanes)
			{
				vr_trnfm(ACSblk->vdi_handle, &data, bp);
				if (parm->color >= 0)
				{
					vrt_cpyfm(ACSblk->vdi_handle, MD_REPLACE, pxy, &brush, bp, fg);
					vro_cpyfm(ACSblk->vdi_handle, ALL_BLACK, pxy, &brush, &mask);
				} else
				{
					if (bp->fd_nplanes == 1)
					{
						vro_cpyfm(ACSblk->vdi_handle, ALL_WHITE, pxy, &brush, bp);
					} else
					{
						vrt_cpyfm(ACSblk->vdi_handle, MD_REPLACE, pxy, &brush, bp, bg);
					}
					vro_cpyfm(ACSblk->vdi_handle, ALL_WHITE, pxy, &brush, &mask);
				}
				vr_trnfm(ACSblk->vdi_handle, bp, &data);
			} else
			{
				if (parm->color >= 0)
				{
					vrt_cpyfm(ACSblk->vdi_handle, MD_REPLACE, pxy, &brush, &data, fg);
					vro_cpyfm(ACSblk->vdi_handle, ALL_BLACK, pxy, &brush, &mask);
				} else
				{
					if (data.fd_nplanes == 1)
						vro_cpyfm(ACSblk->vdi_handle, ALL_WHITE, pxy, &brush, &data);
					else
						vrt_cpyfm(ACSblk->vdi_handle, MD_REPLACE, pxy, &brush, &data, bg);
					vro_cpyfm(ACSblk->vdi_handle, ALL_WHITE, pxy, &brush, &mask);
				}
			}
			self->redraw(self, &rect);
		}
		lastx = mox;
		lasty = moy;
		graf_mkstate(&mox, &moy, &mobutton, &kstate);
	} while (mobutton & 1);
	
	if (ACSblk->description->flags & AB_NOTRANSICON)
		Abp_delete(bp);
}

/* -------------------------------------------------------------------------- */

static void edic_abort(void)
{
	edic_term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void edic_ok(void)
{
	accept_icon(ACSblk->ev_window);
	edic_term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void edic_newplane(void)
{
	Awindow *self;
	ICONPARM *parm;
	OBJECT *obj;
	ICONBLK *icon;
	int16 selected;
	int16 width;
	ssize_t len;
	ssize_t datalen;
	int16 *data;
	int16 *mask;
	
	self = ACSblk->ev_window;
	parm = self->user;
	obj = &parm->work[EDIT_ICON_ICON];
	icon = obj->ob_spec.iconblk;
	selected = obj->ob_state & OS_SELECTED;
	width = ((icon->ib_wicon + 15) & -16);
	len = (width >> 3) * icon->ib_hicon;
	mask = Ax_malloc(len);
	if (mask == NULL)
		return;
	memset(mask, 0xff, len);
	switch (ACSblk->nplanes)
	{
	case 4:
		datalen = len * 4 + sizeof(a_hcicon);
		data = Ax_malloc(datalen);
		if (data != NULL)
		{
			memset(data, 0, datalen);
			parm->c16.num_planes = 4;
			if (selected && parm->c16.col_data != NULL)
			{
				if (parm->c16.sel_data != NULL)
					Ax_free(parm->c16.sel_data - sizeof(a_hcicon) / sizeof(*data));
				Ax_free(parm->c16.sel_mask);
				parm->c16.sel_data = &data[sizeof(a_hcicon) / sizeof(*data)];
				parm->c16.sel_mask = mask;
			} else
			{
				if (parm->c16.col_data != NULL)
					Ax_free(parm->c16.col_data - sizeof(a_hcicon) / sizeof(*data));
				Ax_free(parm->c16.col_mask);
				parm->c16.col_data = &data[sizeof(a_hcicon) / sizeof(*data)];
				parm->c16.col_mask = mask;
			}
		} else
		{
			/* BUG: mask allocated above is leaked */
		}
		break;
		
	case 8:
		datalen = len * 8 + sizeof(a_hcicon);
		data = Ax_malloc(datalen);
		if (data != NULL)
		{
			memset(data, 0, datalen);
			parm->c256.num_planes = 8;
			if (selected && parm->c256.col_data != NULL)
			{
				if (parm->c256.sel_data != NULL)
					Ax_free(parm->c256.sel_data - sizeof(a_hcicon) / sizeof(*data));
				Ax_free(parm->c256.sel_mask);
				parm->c256.sel_data = &data[sizeof(a_hcicon) / sizeof(*data)];
				parm->c256.sel_mask = mask;
			} else
			{
				if (parm->c256.col_data != NULL)
					Ax_free(parm->c256.col_data - sizeof(a_hcicon) / sizeof(*data));
				Ax_free(parm->c256.col_mask);
				parm->c256.col_data = &data[sizeof(a_hcicon) / sizeof(*data)];
				parm->c256.col_mask = mask;
			}
		} else
		{
			/* BUG: mask allocated above is leaked */
		}
		break;
	
	default:
		datalen = len;
		data = Ax_malloc(datalen);
		if (data != NULL)
		{
			memset(data, 0, datalen);
			parm->data = data;
			parm->mask = mask;
		} else
		{
			/* BUG: mask allocated above is leaked */
		}
		break;
	}
	edic_link(self);
	self->obchange(self, EDIT_ICON_DRAWFRAME, -1);
}

/* -------------------------------------------------------------------------- */

static void edic_accept(void)
{
	Awindow *self;
	Awindow *select;
	AOBJECT *aobj;
	ICONPARM *parm;
	int16 obnr;
	int16 selected;
	int16 picw;
	int16 width;
	ssize_t len;
	ssize_t datalen;
	int16 pxy[8];
	int16 *mask;
	ICONBLK *icon;
	MFDB *src;
	OBJECT *tree;
	OBJECT *obj;
	MFDB *bp;
	MFDB *dst;
	int16 *data;
	
	if ((self = ACSblk->ev_window) == (select = ACSblk->Aselect.window))
		return;
	tree = self->work;
	Adr_start();
	if ((obnr = Adr_next()) < 0)
		return;
	aobj = (AOBJECT *)(&select->work[obnr] + 1);
	if (aobj->type != AT_MFDB)
		return;
	parm = self->user;
	obj = &parm->work[EDIT_ICON_ICON];
	icon = obj->ob_spec.iconblk;
	selected = obj->ob_state & OS_SELECTED;
	src = aobj->userp1;
	if (src->fd_stand != 1)
	{
		Awi_alert(1, A_NOSTD);
		return;
	}
	picw = src->fd_w;
	src->fd_w = (src->fd_w + 15) & -16;
	
	width = ((icon->ib_wicon + 15) & -16);
	len = (width >> 3) * icon->ib_hicon;
	if ((mask = Ax_malloc(len)) == NULL)
		return;
	memset(mask, 0xff, len);
	if ((bp = Abp_create(src->fd_w, src->fd_h)) == NULL)
	{
		Ax_free(mask);
		return;
	}
	pxy[0] = pxy[1] = pxy[4] = pxy[5] = 0;
	pxy[2] = pxy[6] = src->fd_w - 1;
	pxy[3] = pxy[7] = src->fd_h - 1;
	vr_trnfm(ACSblk->vdi_handle, src, bp);
	if ((dst = Abp_create(width, icon->ib_hicon)) == NULL)
	{
		Ax_free(mask);
		Abp_delete(bp);
		return;
	}
	pxy[2] = pxy[6] = width - 1;
	pxy[3] = pxy[7] = icon->ib_hicon - 1;
	vro_cpyfm(ACSblk->vdi_handle, ALL_WHITE, pxy, dst, dst);
	if (picw < width)
		pxy[2] = pxy[6] = picw - 1;
	if (src->fd_h < icon->ib_hicon)
		pxy[3] = pxy[7] = src->fd_h - 1;
	vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, bp, dst);
	Abp_delete(bp);
	
	if (ACSblk->description->flags & AB_NOTRANSICON)
	{
		pxy[2] = pxy[6] = width - 1;
		pxy[3] = pxy[7] = icon->ib_hicon - 1;
		if ((bp = Abp_create(width, icon->ib_hicon)) == NULL)
		{
			Abp_delete(dst);
			return; /* BUG: mask leaked */
		}
		bp->fd_stand = 1;
		vr_trnfm(ACSblk->vdi_handle, dst, bp);
		Abp_delete(dst);
		dst = bp;
	}
	
	switch (ACSblk->nplanes)
	{
	case 4:
		datalen = len * 4 + sizeof(a_hcicon);
		if ((data = Ax_malloc(datalen)) != NULL)
		{
			memcpy(&data[sizeof(a_hcicon) / sizeof(*data)], dst->fd_addr, datalen);
			parm->c16.num_planes = 4;
			if (selected && parm->c16.col_data != NULL)
			{
				if (parm->c16.sel_data != NULL)
					Ax_free(parm->c16.sel_data - sizeof(a_hcicon) / sizeof(*data));
				Ax_free(parm->c16.sel_mask);
				parm->c16.sel_data = &data[sizeof(a_hcicon) / sizeof(*data)];
				parm->c16.sel_mask = mask;
			} else
			{
				if (parm->c16.col_data != NULL)
					Ax_free(parm->c16.col_data - sizeof(a_hcicon) / sizeof(*data));
				Ax_free(parm->c16.col_mask);
				parm->c16.col_data = &data[sizeof(a_hcicon) / sizeof(*data)];
				parm->c16.col_mask = mask;
			}
		}
		break;
	
	case 8:
		datalen = len * 8 + sizeof(a_hcicon);
		data = Ax_malloc(datalen);
		if (data != NULL)
		{
			memcpy(&data[sizeof(a_hcicon) / sizeof(*data)], dst->fd_addr, datalen);
			parm->c256.num_planes = 8;
			if (selected && parm->c256.col_data != NULL)
			{
				if (parm->c256.sel_data != NULL)
					Ax_free(parm->c256.sel_data - sizeof(a_hcicon) / sizeof(*data));
				Ax_free(parm->c256.sel_mask);
				parm->c256.sel_data = &data[sizeof(a_hcicon) / sizeof(*data)];
				parm->c256.sel_mask = mask;
			} else
			{
				if (parm->c256.col_data != NULL)
					Ax_free(parm->c256.col_data - sizeof(a_hcicon) / sizeof(*data));
				Ax_free(parm->c256.col_mask);
				parm->c256.col_data = &data[sizeof(a_hcicon) / sizeof(*data)];
				parm->c256.col_mask = mask;
			}
		}
		break;
	
	default:
		datalen = len;
		data = Ax_malloc(datalen);
		if (data != NULL)
		{
			memcpy(data, dst->fd_addr, datalen);
			parm->data = data;
			parm->mask = mask;
		} else
		{
			/* BUG: mask allocated above is leaked */
		}
		break;
	}
	edic_link(self);
	Abp_delete(dst);
	tree[EDIT_ICON_SIZEBOX].ob_flags |= OF_HIDETREE;
	self->obchange(self, EDIT_ICON_DRAWFRAME, -1);
	Adr_del(select, obnr);
}

/* -------------------------------------------------------------------------- */

static void edic_delplane(void)
{
	Awindow *self;
	ICONPARM *parm;
	int16 selected;
	OBJECT *obj;
	
	self = ACSblk->ev_window;
	parm = self->user;
	obj = &parm->work[EDIT_ICON_ICON];
	selected = obj->ob_state & OS_SELECTED;
	if (parm->c16.num_planes == ACSblk->nplanes)
	{
		if (!selected)
		{
			if (parm->c16.col_data != NULL)
				Ax_free(parm->c16.col_data - sizeof(a_hcicon) / sizeof(*parm->c16.col_data));
			Ax_free(parm->c16.col_mask);
			parm->c16.col_data = NULL;
			parm->c16.col_mask = NULL;
			parm->c16.num_planes = 0;
		}
		if (parm->c16.sel_data != NULL)
			Ax_free(parm->c16.sel_data - sizeof(a_hcicon) / sizeof(*parm->c16.sel_data));
		Ax_free(parm->c16.sel_mask);
		parm->c16.sel_data = NULL;
		parm->c16.sel_mask = NULL;
	}
	if (parm->c256.num_planes == ACSblk->nplanes)
	{
		if (!selected)
		{
			if (parm->c256.col_data != NULL)
				Ax_free(parm->c256.col_data - sizeof(a_hcicon) / sizeof(*parm->c256.col_data));
			Ax_free(parm->c256.col_mask);
			parm->c256.col_data = NULL;
			parm->c256.col_mask = NULL;
			parm->c256.num_planes = 0;
		}
		if (parm->c256.sel_data != NULL)
			Ax_free(parm->c256.sel_data - sizeof(a_hcicon) / sizeof(*parm->c256.sel_data));
		Ax_free(parm->c256.sel_mask);
		parm->c256.sel_data = NULL;
		parm->c256.sel_mask = NULL;
	}
	edic_link(self);
	self->obchange(self, EDIT_ICON_DRAWFRAME, -1);
}

/* -------------------------------------------------------------------------- */

static void zooming(MFDB *src, MFDB *dst, int16 mask)
{
	int16 *srcaddr;
	char *dstaddr;
	char *dstptr;
	int16 plane;
	int16 pixval;
	int16 maskval;
	int16 bit;
	
	srcaddr = src->fd_addr;
	dstaddr = dst->fd_addr;
	for (plane = src->fd_nplanes - 1; plane >= 0; plane--)
	{
		pixval = *srcaddr++;
		maskval = mask;
		dstptr = dstaddr;
		for (bit = 15; bit >= 0; bit--)
		{
			char c2;
			
			if (maskval >= 0)
			{
				dstptr[0] =
				dstptr[32] =
				dstptr[64] =
				dstptr[96] = 0x54;
				dstptr[16] =
				dstptr[48] =
				dstptr[80] = 0xaa;
			} else
			{
				c2 = pixval >= 0 ? 0 : 0xfe;
				dstptr[0] =
				dstptr[16] =
				dstptr[32] =
				dstptr[48] =
				dstptr[64] =
				dstptr[80] =
				dstptr[96] = c2;
			}
#ifdef __PUREC__
			(void)c2; /* FIXME: useless cast to get registers right */
#endif
			dstptr[112] = 0;
			dstptr++;
			pixval += pixval;
			maskval += maskval;
		}
		dstaddr += 128;
	}
}

/* -------------------------------------------------------------------------- */

/*
 * Draw-routine for the icon in the image editor
 */
static int16 CDECL edic_bitmap(PARMBLK *pb)
{
	Awindow *self;
	ICONPARM *parm;
	ICONBLK *icon;
	MFDB datafdb;
	MFDB dstfdb;
	MFDB dst2fdb;
	MFDB zoomfdb;
	MFDB zoom2fdb;
	int16 *mask;
	int16 dsty;
	int16 y;
	int16 dstx;
	int16 x;
	ssize_t plane;
	OBJECT *obj;
	int16 pxy[8];
	int16 pxy2[8];
	int16 clip[4];
	ssize_t size;
	int16 *dataptr;
	int16 *planeptr;
	int16 fg[2] = { 1, 0 };
	int16 width;
	
	clip[2] = pb->pb_wc;
	clip[3] = pb->pb_hc;
	/* FIXME: must always be set, since it is used in the loop below */
	if (clip[2] != 0 || clip[3] != 0)
	{
		clip[0] = pb->pb_xc;
		clip[1] = pb->pb_yc;
		clip[2] += clip[0] - 1;
		clip[3] += clip[1] - 1;
		vs_clip(ACSblk->vdi_handle, 1, clip);
	}
	self = (Awindow *)pb->pb_parm;
	parm = self->user;
	obj = &parm->work[EDIT_ICON_ICON];
	icon = obj->ob_spec.iconblk;
	width = (icon->ib_wicon >> 4);
	zoomfdb.fd_addr = zoomplane;
	zoomfdb.fd_stand = 0;
	zoom2fdb.fd_addr = zoom2plane;
	zoom2fdb.fd_stand = 1;
	zoomfdb.fd_w = zoom2fdb.fd_w = 128;
	zoomfdb.fd_wdwidth = zoom2fdb.fd_wdwidth =
	zoomfdb.fd_h = zoom2fdb.fd_h = 8;
	zoom2fdb.fd_r1 = zoom2fdb.fd_r2 = zoom2fdb.fd_r3 =
	zoomfdb.fd_r1 = zoomfdb.fd_r2 = zoomfdb.fd_r3 = 0;
	dstfdb.fd_addr = toplane;
	dstfdb.fd_stand = 0;
	planeptr = dst2fdb.fd_addr = to2plane;
	dst2fdb.fd_stand = 1;
	dstfdb.fd_w = dst2fdb.fd_w = 16;
	dstfdb.fd_wdwidth = dst2fdb.fd_wdwidth = dstfdb.fd_h = dst2fdb.fd_h = 1;
	dst2fdb.fd_r1 = dst2fdb.fd_r2 = dst2fdb.fd_r3 =
	dstfdb.fd_r1 = dstfdb.fd_r2 = dstfdb.fd_r3 = 0;
	mask = parm->mask;
	zoomfdb.fd_nplanes = zoom2fdb.fd_nplanes = dstfdb.fd_nplanes = dst2fdb.fd_nplanes = datafdb.fd_nplanes = 1;
	datafdb.fd_addr = parm->data;
	
	if (ACSblk->nplanes == parm->c16.num_planes)
	{
		zoomfdb.fd_nplanes = zoom2fdb.fd_nplanes = dstfdb.fd_nplanes = dst2fdb.fd_nplanes = datafdb.fd_nplanes = ACSblk->nplanes;
		if (parm->c16.sel_data != NULL && (obj->ob_state & OS_SELECTED))
		{
			mask = parm->c16.sel_mask;
			datafdb.fd_addr = parm->c16.sel_data;
		} else
		{
			mask = parm->c16.col_mask;
			datafdb.fd_addr = parm->c16.col_data;
		}
	}
	if (ACSblk->nplanes == parm->c256.num_planes)
	{
		zoomfdb.fd_nplanes = zoom2fdb.fd_nplanes = dstfdb.fd_nplanes = dst2fdb.fd_nplanes = datafdb.fd_nplanes = ACSblk->nplanes;
		if (parm->c256.sel_data != NULL && (obj->ob_state & OS_SELECTED))
		{
			mask = parm->c256.sel_mask;
			datafdb.fd_addr = parm->c256.sel_data;
		} else
		{
			mask = parm->c256.col_mask;
			datafdb.fd_addr = parm->c256.col_data;
		}
	}
	
	dataptr = datafdb.fd_addr;
	datafdb.fd_stand = 0;
	datafdb.fd_w = icon->ib_wicon;
	datafdb.fd_wdwidth = width;
	datafdb.fd_h = icon->ib_hicon;
	datafdb.fd_r1 = datafdb.fd_r2 = datafdb.fd_r3 = 0;
	size = datafdb.fd_wdwidth * datafdb.fd_h;
	pxy[1] = pxy[4] = pxy[5] = pxy[7] = 0;
	pxy[6] = 16 - 1;
	pxy2[0] = pxy2[1] = 0;
	pxy2[2] = 128 - 1;
	pxy2[3] = 8 - 1;
	dsty = pb->pb_y;
	for (y = 0; y < icon->ib_hicon; y++)
	{
		pxy[3] = pxy[1];
		if (dsty + 7 >= clip[1] && dsty <= clip[3])
		{
			dstx = pb->pb_x;
			pxy[0] = 0;
			for (x = 0; x < width; x++)
			{
				if (dstx + 128 >= clip[0] && dstx <= clip[2])
				{
					pxy[2] = pxy[0] + pxy[6];
					if ((ACSblk->description->flags & AB_NOTRANSICON) &&
						ACSblk->nplanes == dst2fdb.fd_nplanes)
					{
						for (plane = 0; plane < datafdb.fd_nplanes; plane++)
						{
							planeptr[plane] = dataptr[(y * width + x) + plane * size];
						}
					} else
					{
						vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, &datafdb, &dstfdb);
						vr_trnfm(ACSblk->vdi_handle, &dstfdb, &dst2fdb);
					}
					zooming(&dst2fdb, &zoom2fdb, mask[y * width + x]);
					vr_trnfm(ACSblk->vdi_handle, &zoom2fdb, &zoomfdb);
					pxy2[4] = dstx;
					pxy2[5] = dsty;
					pxy2[6] = dstx + pxy2[2];
					pxy2[7] = dsty + pxy2[3];
					if (ACSblk->nplanes != zoomfdb.fd_nplanes)
					{
						vrt_cpyfm(ACSblk->vdi_handle, MD_REPLACE, pxy2, &zoomfdb, &ACSblk->screenMFDB, fg);
					} else
					{
						vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy2, &zoomfdb, &ACSblk->screenMFDB);
					}
				}
				dstx += 128;
				pxy[0] += 16;
			}
		}
		dsty += 8;
		pxy[1] += 1;
	}
	vs_clip(ACSblk->vdi_handle, 0, clip);
	return pb->pb_currstate;
}

/* -------------------------------------------------------------------------- */

static void edic_edit(void)
{
	Awindow *self = ACSblk->ev_window;
	ICONPARM *parm;
	OBJECT *edit;
	OBJECT *work;
	ICONBLK *icon;
	int16 w, h;
	
	ACSblk->ev_object[ACSblk->ev_obnr].ob_state &= ~OS_SELECTED;
	parm = self->user;
	Awi_diaend();
	self->ob_edit = -1;
	edit = parm->edit;
	self->work = edit;
	work = parm->work;
	icon = work[EDIT_ICON_ICON].ob_spec.iconblk;
	w = icon->ib_wicon * 8;
	h = icon->ib_hicon * 8;
	edit[EDIT_ICON2_IMAGE].ob_spec.userblk->ub_parm = (int32)self;
	edit[EDIT_ICON2_IMAGE].ob_width = w;
	edit[EDIT_ICON2_DRAWFRAME].ob_width = w;
	edit[EDIT_ICON2_IMAGE].ob_height = h;
	edit[EDIT_ICON2_DRAWFRAME].ob_height = h;
	edit[EDIT_ICON2_IMAGE + 1].mo_index = MOUSE_BRUSH_BLACK;
	ACSblk->description->mouse[MOUSE_BRUSH_BLACK].form->mf_bg = parm->color = G_BLACK;
	ACSblk->description->mouse[MOUSE_BRUSH_BLACK].form->mf_fg = getFgColor(G_BLACK);
	
	w += ACSblk->gl_wbox * 2 + edit[EDIT_ICON2_DRAWFRAME].ob_x;
	h += ACSblk->gl_hbox * 2 + edit[EDIT_ICON2_DRAWFRAME].ob_y;
	if (w < work->ob_width)
		edit[ROOT].ob_width = work->ob_width;
	else
		edit[ROOT].ob_width = w;
	if (h < work->ob_height)
		edit[ROOT].ob_height = work->ob_height;
	else
		edit[ROOT].ob_height = h;
	edit[EDIT_ICON2_BRUSH].ob_width = edit[EDIT_ICON2_BRUSH].ob_height = 8;
	self->keys = Awi_nokey;
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

static void edic_struct(void)
{
	Awindow *self;
	ICONPARM *parm;
	Axywh rect;
	int16 kind;
	
	kind = 0; /* FIXME: useless */
	ACSblk->ev_object[ACSblk->ev_obnr].ob_state &= ~OS_SELECTED;
	self = ACSblk->ev_window;
	parm = self->user;
	Awi_diaend();
	self->ob_edit = EDIT_ICON_TEXT;
	self->keys = ic_keys;
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

static void accept_icon(Awindow *self)
{
	ICONPARM *parm;
	ACS_HEAD *acs;
	CICONBLK *icon;
	ACSCICONBLK newicon;
	CICON *next;
	Obj_Head *obj;
	
	parm = self->user;
	acs = parm->acs;
	/* BUG: nor maked as changed */
	icon = parm->work[EDIT_ICON_ICON].ob_spec.ciconblk;
	memcpy(&newicon.cicon, icon, sizeof(newicon.cicon.monoblk));
	memset(&newicon.c16, 0, sizeof(newicon.c16));
	memset(&newicon.c256, 0, sizeof(newicon.c256));
	next = NULL;
	if (parm->c256.col_data != NULL)
	{
		newicon.c256.next_res = next;
		newicon.c256.num_planes = 8;
		newicon.c256.col_data = from_cicon(parm->c256.col_data, icon, 8);
		newicon.c256.col_mask = parm->c256.col_mask;
		if (parm->c256.sel_data != NULL)
		{
			newicon.c256.sel_data = from_cicon(parm->c256.sel_data, icon, 8);
			newicon.c256.sel_mask = parm->c256.sel_mask;
		}
		next = &newicon.c256;
	}
	if (parm->c16.col_data != NULL)
	{
		newicon.c16.next_res = next;
		newicon.c16.num_planes = 4;
		newicon.c16.col_data = from_cicon(parm->c16.col_data, icon, 4);
		newicon.c16.col_mask = parm->c16.col_mask;
		if (parm->c16.sel_data != NULL)
		{
			newicon.c16.sel_data = from_cicon(parm->c16.sel_data, icon, 4);
			newicon.c16.sel_mask = parm->c16.sel_mask;
		}
		next = &newicon.c16;
	}
	newicon.cicon.mainlist = next;
	if ((obj = dup_icon(acs, &newicon.cicon)) != NULL)
	{
		void *oldobject;
		Obj_Head *tmpobj;
		size_t tmp;

		tmpobj = parm->obj;
		oldobject = tmpobj->object;
		tmpobj->object = obj->object;
		obj->object = oldobject;
		tmp = obj->used;
		obj->used = tmpobj->used;
		tmpobj->used = tmp;
		tmp = obj->size;
		obj->size = tmpobj->size;
		tmpobj->size = tmp;
		del_icon(acs, obj);
	}
	Ax_ifree(newicon.c16.col_data);
	Ax_ifree(newicon.c16.sel_data);
	Ax_ifree(newicon.c256.col_data);
	Ax_ifree(newicon.c256.sel_data);
}

/* -------------------------------------------------------------------------- */

static int16 ic_keys(Awindow *self, int16 kstate, int16 key)
{
	char *text;
	ICONBLK *icon;
	char *pchar;
	ICONPARM *parm;
	
	Awi_keys(self, kstate, key);
	parm = self->user;
	icon = parm->work[EDIT_ICON_ICON].ob_spec.iconblk;
	pchar = (char *)&icon->ib_char; /* FIXME: ugly cast */
	Auo_boxed(&self->work[EDIT_ICON_CHAR], AUO_GETVAL, &text);
	pchar[1] = *text;
	Aob_gettext(self->work, EDIT_ICON_TEXT, icon->ib_ptext);
	self->obchange(self, EDIT_ICON_ICON, -1);
	return -1;
}

/* -------------------------------------------------------------------------- */

static Awindow *ic_make(void *a)
{
	ICONPARM *parm;
	ICONPARM *newparm;
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
		WI_ICON.iconblk->monoblk.ib_ptext = WI_ICON.info = obj->label;
		win = Awi_create(&WI_ICON);
		if (win == NULL)
		{
			Ax_free(newparm);
			return NULL;
		}
		wi_pos(win, &obj->pos, &parm->acs->last_rez);
		win->work[EDIT_ICON_CORNER].ob_width = win->work[EDIT_ICON_CORNER].ob_height = 0;
		win->work[EDIT_ICON_CORNER].ob_flags |= OF_HIDETREE;
		win->user = newparm;
		newparm->work = win->work;
		if ((newparm->edit = Aob_create(&EDIT_ICON2.root)) == NULL)
		{
			Ax_free(win);
			Ax_free(newparm);
			return NULL;
		}
		Aob_fix(newparm->edit);
		obj->window = win;
		edic_set_icon(win);
		if (win->open(win) != OK)
		{
			edic_term(win);
			return NULL;
		}
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static boolean ic_service(Awindow *self, int16 task, void *in_out)
{
	ICONPARM *parm = self->user;
	
	switch (task)
	{
	case AS_TERM:
		accept_icon(self);
		edic_term(self);
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

static void unfix_alloc(int16 **data)
{
	Obj_Head *obj;
	
	obj = (Obj_Head *)(*data);
	if (obj != NULL)
	{
		*data = Ax_malloc(obj->used);
		memcpy(*data, obj->object, obj->used);
	}
}

/* -------------------------------------------------------------------------- */

static void edic_set_icon(Awindow *self)
{
	char *ptext;
	char iconchar[2] = " ";
	ICONPARM *parm;
	OBJECT *tree;
	CICONBLK *icon;
	ACSCICONBLK *data;
	ssize_t size;
	Obj_Head *obj;
	int16 color;
	
	parm = self->user;
	tree = parm->work;
	icon = tree[EDIT_ICON_ICON].ob_spec.ciconblk;
	ptext = icon->monoblk.ib_ptext;
	data = parm->obj->object;
	memcpy(icon, &data->cicon, sizeof(icon->monoblk));
	icon->monoblk.ib_ptext = ptext;
	memcpy(&parm->c16, &data->c16, sizeof(parm->c16));
	memcpy(&parm->c256, &data->c256, sizeof(parm->c256));
	size = (((icon->monoblk.ib_wicon + 15) & -16) * icon->monoblk.ib_hicon) >> 3;
	if (parm->c16.num_planes > 0)
	{
		unfix_alloc(&parm->c16.col_mask);
		obj = (Obj_Head *)parm->c16.col_data;
		parm->c16.col_data = ito_cicon(obj->object, parm->c16.col_mask, icon, 4);
		if (parm->c16.sel_data != NULL)
		{
			unfix_alloc(&parm->c16.sel_mask);
			obj = (Obj_Head *)parm->c16.sel_data;
			parm->c16.sel_data = ito_cicon(obj->object, parm->c16.sel_mask, icon, 4);
		}
	}
	if (parm->c256.num_planes > 0)
	{
		unfix_alloc(&parm->c256.col_mask);
		obj = (Obj_Head *)parm->c256.col_data;
		parm->c256.col_data = ito_cicon(obj->object, parm->c256.col_mask, icon, 8);
		if (parm->c256.sel_data != NULL)
		{
			unfix_alloc(&parm->c256.sel_mask);
			obj = (Obj_Head *)parm->c256.sel_data;
			parm->c256.sel_data = ito_cicon(obj->object, parm->c256.sel_mask, icon, 8);
		}
	}
	
	if ((parm->mask = Ax_malloc(size)) != NULL)
		memcpy(parm->mask, (char *)data + (ssize_t)data->cicon.monoblk.ib_pmask, size);
	if ((parm->data = Ax_malloc(size)) != NULL)
		memcpy(parm->data, (char *)data + (ssize_t)data->cicon.monoblk.ib_pdata, size);
	edic_link(self);
	obj = (Obj_Head *)data->cicon.monoblk.ib_ptext;
	Auo_boxed(&tree[EDIT_ICON_TEXT], AUO_SETVAL, obj->object);
	strcpy(ptext, obj->object);
	iconchar[0] = icon->monoblk.ib_char;
	Auo_boxed(&tree[EDIT_ICON_CHAR], AUO_SETVAL, iconchar);
	color = (icon->monoblk.ib_char >> 12) & 15;
	Aob_puttext(self->work, EDIT_ICON_FRONT_POPUP, colour_text[color]);
	self->work[EDIT_ICON_FRONT_COLOR].ob_spec.obspec.interiorcol = color;
	color = (icon->monoblk.ib_char >> 8) & 15;
	Aob_puttext(self->work, EDIT_ICON_BACK_POPUP, colour_text[color]);
	self->work[EDIT_ICON_BACK_COLOR].ob_spec.obspec.interiorcol = color;
}

/* -------------------------------------------------------------------------- */

static void edic_term(Awindow *self)
{
	ICONPARM *parm;
	
	self->state |= AWS_TERM;
	parm = self->user;
	parm->work[EDIT_ICON_ICON].ob_spec.ciconblk->mainlist = NULL;
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
	Ax_free(parm->mask);
	if (parm->c16.col_data != NULL)
		Ax_free(parm->c16.col_data - sizeof(a_hcicon) / sizeof(*parm->c16.col_data));
	Ax_free(parm->c16.col_mask);
	if (parm->c16.sel_data != NULL)
		Ax_free(parm->c16.sel_data - sizeof(a_hcicon) / sizeof(*parm->c16.col_data));
	Ax_free(parm->c16.sel_mask);
	if (parm->c256.col_data != NULL)
		Ax_free(parm->c256.col_data - sizeof(a_hcicon) / sizeof(*parm->c256.col_data));
	Ax_free(parm->c256.col_mask);
	if (parm->c256.sel_data != NULL)
		Ax_free(parm->c256.sel_data - sizeof(a_hcicon) / sizeof(*parm->c256.col_data));
	Ax_free(parm->c256.sel_mask);
	Ax_free(parm);
	Awi_delete(self);
}

/* -------------------------------------------------------------------------- */

/*
 * function that draws the colors in the popup(s)
 */
static int16 CDECL piccolor(PARMBLK *pb)
{
	int16 color;
	int16 pxy[10];
	
	if (pb->pb_parm == 0)
		color = pb->pb_obj - 1;
	else
		color = (int16)pb->pb_parm;
	pxy[2] = pb->pb_wc;
	pxy[3] = pb->pb_hc;
	pxy[0] = pb->pb_xc;
	pxy[1] = pb->pb_yc;
	pxy[2] += pxy[0] - 1;
	pxy[3] += pxy[1] - 1;
	vs_clip(ACSblk->vdi_handle, 1, pxy);
	pxy[0] = pb->pb_x + 1;
	pxy[1] = pb->pb_y + 1;
	pxy[2] = pb->pb_x + pb->pb_w - 2;
	pxy[3] = pb->pb_y + pb->pb_h - 2;
	vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
	vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
	vsf_perimeter(ACSblk->vdi_handle, TRUE);
	vsf_color(ACSblk->vdi_handle, color);
	v_bar(ACSblk->vdi_handle, pxy);
	if (pb->pb_currstate & OS_SELECTED)
		vsl_color(ACSblk->vdi_handle, G_BLACK);
	else
		vsl_color(ACSblk->vdi_handle, G_WHITE);
	pxy[0] -= 1;
	pxy[1] -= 1;
	pxy[2] += 1;
	pxy[3] += 1;
	pxy[8] = pxy[0];
	pxy[9] = pxy[1];
	pxy[6] = pxy[0];
	pxy[7] = pxy[3];
	pxy[4] = pxy[2];
	pxy[5] = pxy[3];
	pxy[3] = pxy[1];
	vsl_width(ACSblk->vdi_handle, 1);
	vsl_ends(ACSblk->vdi_handle, 0, 0);
	v_pline(ACSblk->vdi_handle, 5, pxy);
	vs_clip(ACSblk->vdi_handle, FALSE, pxy);
	return pb->pb_currstate;
}

/* -------------------------------------------------------------------------- */

/*
 * function that draws the color for the brush
 */
static int16 CDECL IcnCol(PARMBLK *pb)
{
	int16 color;
	int16 pxy[10];
	
	color = (int16)pb->pb_parm;
	pxy[0] = pb->pb_xc;
	pxy[1] = pb->pb_yc;
	pxy[2] = pb->pb_wc + pxy[0] - 1;
	pxy[3] = pb->pb_hc + pxy[1] - 1;
	vs_clip(ACSblk->vdi_handle, TRUE, pxy);
	pxy[0] = pb->pb_x;
	pxy[1] = pb->pb_y;
	pxy[2] = pb->pb_x + pb->pb_w - 1;
	pxy[3] = pb->pb_y + pb->pb_h - 1;
	vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
	if (color >= 0)
	{
		vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
		vsf_color(ACSblk->vdi_handle, color);
	} else
	{
		vsf_interior(ACSblk->vdi_handle, FIS_PATTERN);
		vsf_style(ACSblk->vdi_handle, IP_4PATT);
		vsf_color(ACSblk->vdi_handle, G_BLACK);
	}
	vsf_perimeter(ACSblk->vdi_handle, TRUE);
	v_bar(ACSblk->vdi_handle, pxy);
	vs_clip(ACSblk->vdi_handle, FALSE, pxy);
	return OS_NORMAL;
}

/* -------------------------------------------------------------------------- */

/* for some unused DATAs */
#ifdef __PUREC__
#pragma warn -use
#endif
