#include "acs_i.h"
#include "io/workout.h"

char const hex[] = "0123456789ABCDEF"; /* FIXME: unused */
static char const a_planemess[] = "[1][ |planes > nplanes!| ][   OK   ]";
static int16 const map[16] = { 0, 2, 3, 6, 4, 7, 5, 8, 9, 10, 11, 14, 12, 15, 13, 1 };
static int16 xff = 0xffff;
static MFDB punkt = { &xff, 1, 1, 1, 0, 1, 0, 0, 0 };

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void set_flag(int16 setit, OBJECT *obj)
{
	if (setit)
		obj->ob_state |= OS_SELECTED;
	else
		obj->ob_state &= ~OS_SELECTED;
}

/* -------------------------------------------------------------------------- */

void mod_ref(ACS_HEAD *acs, Obj_Head **ref, const char *title, int16 type)
{
	Obj_Head *label;
	
	label = *ref;
	if (*title != '\0')
		*ref = dup_ref(acs, title, type);
	else
		*ref = NULL;
	if (label != NULL)
		del_ref(acs, label);
}

/* -------------------------------------------------------------------------- */

/* FIXME: confusing name */
void set_ref(Obj_Head *ref, char *label)
{
	if (ref == NULL)
		*label = '\0';
	else
		strcpy(label, ref->label);
}

/* -------------------------------------------------------------------------- */

void set_val(Obj_Head *ref, char *label)
{
	if (ref == NULL)
		*label = '\0';
	else
		strcpy(label, ref->object);
}

/* -------------------------------------------------------------------------- */

boolean A_rubberbox(int16 x, int16 y, int16 minw, int16 minh, int16 *dstw, int16 *dsth, int16 maxw, int16 maxh)
{
	int16 minx;
	int16 miny;
	int16 maxx;
	int16 maxy;
	int16 bstate;
	int16 kstate;
	int16 snap;
	int16 snapmask;
	int16 xx;
	int16 yy;
	int16 newx;
	int16 newy;
	int16 mox;
	int16 moy;
	int16 clip[4];
	int16 pxy[8];
	OBJECT *info;
	MFDB *back;
	char buf[12];

	if ((info = Aob_create(&INFO_OB_WH)) != NULL)
	{
		Aob_fix(info);
		info->ob_x = x - info->ob_width;
		info->ob_y = y - info->ob_height;
		if (info->ob_x < 0 || info->ob_y < 0)
		{
			Aob_delete(info);
			info = NULL;
		} else
		{
			if ((back = Abp_create(info->ob_width, info->ob_height)) != NULL)
			{
				pxy[2] = (pxy[0] = info->ob_x) + (pxy[6] = info->ob_width - 1);
				pxy[3] = (pxy[1] = info->ob_y) + (pxy[7] = info->ob_height - 1);
				pxy[4] = pxy[5] = 0;
				Amo_hide();
				vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, &ACSblk->screenMFDB, back);
				Amo_show();
			}
		}
	}
	
	snap = imagesnap >> 1;
	if (snap == 0)
		snap = 1;
	snapmask = ~(imagesnap - 1);
	
	Amo_new(&ACSblk->description->mouse[BUSYBEE]);
	clip[0] = clip[1] = 0;
	clip[2] = ACSblk->desk.x + ACSblk->desk.w /* - 1 */; /* BUG: missing -1 */
	clip[3] = ACSblk->desk.y + ACSblk->desk.h /* - 1 */;
	vs_clip(ACSblk->vdi_handle, TRUE, clip);
	maxx = x + maxw - 1;
	maxy = y + maxh - 1;
	minx = x + minw - 1;
	miny = y + minh - 1;
	graf_mkstate(&mox, &moy, &bstate, &kstate);
	/* FIXME: do not use busy loop */
	while (TRUE)
	{
		mox = ((mox - x + snap) & snapmask) + x - 1;
		moy = ((moy - y + snap) & snapmask) + y - 1;
		newx = mox;
		newy = moy;
		if (newx > maxx)
			newx = maxx;
		if (newy > maxy)
			newy = maxy;
		if (newx < minx)
			newx = minx;
		if (newy < miny)
			newy = miny;
		if (!(bstate & 1) || (bstate & 2))
		{
			vs_clip(ACSblk->vdi_handle, 0, clip);
			*dstw = newx - x + 1;
			*dsth = newy - y + 1;
			Amo_new(&ACSblk->description->mouse[ARROW]);
			if (info != NULL)
			{
				if (back != NULL)
				{
					pxy[6] = (pxy[4] = info->ob_x) + (pxy[2] = info->ob_width - 1);
					pxy[7] = (pxy[5] = info->ob_y) + (pxy[3] = info->ob_height - 1);
					pxy[0] = pxy[1] = 0;
					Amo_hide();
					vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, back, &ACSblk->screenMFDB);
					Amo_show();
					Abp_delete(back);
				} else
				{
					form_dial(FMD_FINISH,
						info->ob_x, info->ob_y, info->ob_x + info->ob_width - 1, info->ob_y + info->ob_height - 1,
						info->ob_x, info->ob_y, info->ob_x + info->ob_width - 1, info->ob_y + info->ob_height - 1);
				}
				Aob_delete(info);
			}
			Aev_release();
			if (bstate & 2)
				return FALSE;
			else
				return TRUE;
		}
		
		graf_mouse(M_OFF, NULL);
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		vsl_color(ACSblk->vdi_handle, G_BLACK);
		dotted_xline(x, newx, y);
		dotted_xline(x, newx, newy);
		dotted_yline(y, newy, x);
		dotted_yline(y, newy, newx);
		if (info != NULL)
		{
			sprintf(buf, "%d*%d", (newx - x + 1) / ACSblk->gl_wbox, (newy - y + 1) / ACSblk->gl_hbox);
			Aob_puttext(info, INFO_OB_LINE, buf);
			sprintf(buf, "%d*%d", newx - x + 1, newy - y + 1);
			Aob_puttext(info, INFO_OB_LINE2, buf);
			objc_draw(info, ROOT, 2, info->ob_x, info->ob_y, info->ob_x + info->ob_width - 1, info->ob_y + info->ob_height - 1);
		}
		graf_mouse(M_ON, NULL);
		/* FIXME: do not use busy loop */
		while (TRUE)
		{
			graf_mkstate(&xx, &yy, &bstate, &kstate);
			if (!(bstate & 1) || (bstate & 2))
				break;
			if (xx - mox > snap ||
				mox - xx > snap ||
				yy - moy > snap ||
				moy - yy > snap)
				break;
		}

		graf_mouse(M_OFF, NULL);
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		vsl_color(ACSblk->vdi_handle, G_BLACK);
		dotted_xline(x, newx, y);
		dotted_xline(x, newx, newy);
		dotted_yline(y, newy, x);
		dotted_yline(y, newy, newx);
		graf_mouse(M_ON, NULL);
		mox = xx;
		moy = yy;
	}
}

/* -------------------------------------------------------------------------- */

void view_grow(Awindow *win)
{
	if (ACSblk->description->flags & AB_MOVIES)
		graf_growbox(0, 0, 0, 0, win->wi_act.x, win->wi_act.y, win->wi_act.w, win->wi_act.h);
	win->state |= AWS_FORCEREDRAW;
	win->sized(win, &win->wi_act);
}

/* -------------------------------------------------------------------------- */

void view_shrink(Awindow *win)
{
	if (ACSblk->description->flags & AB_MOVIES)
		graf_shrinkbox(0, 0, 0, 0, win->wi_act.x, win->wi_act.y, win->wi_act.w, win->wi_act.h);
	win->state |= AWS_FORCEREDRAW;
	win->sized(win, &win->wi_act);
}

/* -------------------------------------------------------------------------- */

void new_name(Awindow *win, Obj_Head *title)
{
	int16 id;
	
	Ast_delete(win->iconblk->monoblk.ib_ptext);
	Ast_delete(win->info);
	win->iconblk->monoblk.ib_ptext = Ast_create(title->label);
	win->info = Ast_create(title->label);
	id = win->wi_id;
	if (id >= 0)
		wind_set(id, WF_INFO, win->info, 0, 0);
}

/* -------------------------------------------------------------------------- */

void chk_new_label(void)
{
	char filename[__PS__];
	
	Aob_gettext(ACSblk->ev_object, NEW_LABEL_NAME, filename);
	if (filename[0] != '\0')
		ACSblk->dia_abort = TRUE;
}

/* -------------------------------------------------------------------------- */

void newlabel(ACS_HEAD *acs, Obj_Head *obj, const char *title)
{
	Awindow *win;
	char buf[__PS__];
	
	if ((win = WI_NEW_LABEL.create(&WI_NEW_LABEL)) == NULL)
		return;
	Ast_delete(win->name);
	win->name = Ast_create(title);
	Aob_puttext(win->work, NEW_LABEL_NAME, obj->label);
	do
	{
		Awi_dialog(win);
		Aob_gettext(win->work, NEW_LABEL_NAME, buf);
	} while (buf[0] == '\0');
	if (acs->flags & ACS_IGNORECASE)
		strupr(buf);
	strcpy(obj->label, buf);
	Awi_delete(win);
}

/* -------------------------------------------------------------------------- */

boolean new2label(ACS_HEAD *acs, Obj_Head *obj, const char *title)
{
	Awindow *win;
	int16 ret;
	char buf[__PS__];
	
	if ((win = WI_NEW2_LABEL.create(&WI_NEW2_LABEL)) == NULL)
		return FALSE;
	Ast_delete(win->name);
	win->name = Ast_create(title);
	Aob_puttext(win->work, NEW2_LABEL_NAME, obj->label);
	ret = Awi_dialog(win);
	Aob_gettext(win->work, NEW2_LABEL_NAME, buf);
	Awi_delete(win);
	if (ret == NEW2_LABEL_OK && buf[0] != '\0')
	{
		if (acs->flags & ACS_IGNORECASE)
			strupr(buf);
		strcpy(obj->label, buf);
		return TRUE;
	} else
	{
		return FALSE;
	}
}

/* -------------------------------------------------------------------------- */

static int16 wicalc_pos(long val, long div, long mul, int16 min, int16 max)
{
	int16 newval;
	
	if (div == 0)
		newval = (int16)val;
	else
		newval = (int16)((val * mul) / div);
	if (newval < min)
		newval = min;
	if (newval > max)
		newval = max;
	return newval;
}

/* -------------------------------------------------------------------------- */

void wi_pos(Awindow *win, Axywh *pos, Axywh *lastpos)
{
	if (pos->w == 0)
		return;
	win->wi_act.x = wicalc_pos(pos->x, lastpos->x, ACSblk->desk.x, ACSblk->desk.x, ACSblk->desk.x + ACSblk->desk.w);
	win->wi_act.y = wicalc_pos(pos->y, lastpos->y, ACSblk->desk.y, ACSblk->desk.y, ACSblk->desk.y + ACSblk->desk.h);
	if (win->wi_kind & (SIZER | LFARROW | RTARROW | HSLIDE))
	{
		win->wi_act.w = wicalc_pos(pos->w, lastpos->w, ACSblk->desk.w, ACSblk->gl_wattr * 4, ACSblk->desk.w * 2);
	} else
	{
		win->wi_act.w = ACSblk->desk.w;
	}
	if (win->wi_kind & (SIZER | DNARROW | UPARROW | VSLIDE))
	{
		win->wi_act.h = wicalc_pos(pos->h, lastpos->h, ACSblk->desk.h, ACSblk->gl_hattr * 4, ACSblk->desk.h * 2);
	} else
	{
		win->wi_act.h = ACSblk->desk.h;
	}
}

/* -------------------------------------------------------------------------- */

static void convert(MFDB *src, MFDB *dst, int16 *mask)
{
	int16 pixel;
	ssize_t size;
	ssize_t srcoffset;
	ssize_t srcpos;
	int16 pixelmask;
	int16 *srcptr;
	int16 *maskptr;
	int16 x;
	int16 y;
	int16 pxy[8];
	
	static int16 col[2]; /* FIXME: why static? */
	
	if ((1 << ACSblk->nplanes) != ACSblk->ncolors) /* BUG: undefined for planes >= 16 */
	{
		size = src->fd_wdwidth * src->fd_h;
		pxy[0] = pxy[1] = pxy[2] = pxy[3] = 0;
		for (y = 0; y < dst->fd_h; y++)
		{
			pxy[5] = pxy[7] = y;
			srcoffset = y * src->fd_wdwidth;
			for (x = 0; x < dst->fd_w; x++)
			{
				srcpos = (x >> 4) + srcoffset;
				maskptr = &mask[srcpos];
				srcptr = (int16 *)src->fd_addr + srcpos;
				pxy[4] = pxy[6] = x;
				pixelmask = (int16)(0x8000L >> (x & 15));
				if (*maskptr & pixelmask)
				{
					pixel = 0;
					if (*srcptr & pixelmask)
						pixel += 1;
					srcptr += size;
					if (*srcptr & pixelmask)
						pixel += 2;
					srcptr += size;
					if (*srcptr & pixelmask)
						pixel += 4;
					srcptr += size;
					if (*srcptr & pixelmask)
						pixel += 8;
					srcptr += size;
					if (*srcptr & pixelmask)
						pixel += 16;
					srcptr += size;
					if (*srcptr & pixelmask)
						pixel += 32;
					srcptr += size;
					if (*srcptr & pixelmask)
						pixel += 64;
					srcptr += size;
					if (*srcptr & pixelmask)
						pixel += 128;
					if (ACSblk->nplanes < 8)
						pixel &= 15;
					if (pixel < 16)
						pixel = map[pixel];
				} else
				{
					pixel = ACSblk->ncolors - 1;
				}
				col[1] = col[0] = pixel;
				vrt_cpyfm(ACSblk->vdi_handle, MD_REPLACE, pxy, &punkt, dst, col);
			}
		}
	} else
	{
		vr_trnfm(ACSblk->vdi_handle, src, dst);
	}
}

/* -------------------------------------------------------------------------- */

void *to_cicon(int16 *data, int16 *mask, CICONBLK *icon, int16 planes)
{
	int16 width;
	ssize_t planesize;
	ssize_t dstsize;
	ssize_t srcsize;
	MFDB dst;
	MFDB src;
	int16 *tmp;
	
	width = (icon->monoblk.ib_wicon + 15) & -16;
	planesize = (width * icon->monoblk.ib_hicon) >> 3;
	if (planes > ACSblk->nplanes)
		Awi_alert(1, a_planemess); /* FIXME: debug code? */
	dstsize = planesize * ACSblk->nplanes + DATA_OFFSET * sizeof(int16);
	srcsize = planesize * planes;
	dst.fd_stand = 0;
	src.fd_stand = 1;
	dst.fd_w = src.fd_w = width;
	dst.fd_h = src.fd_h = icon->monoblk.ib_hicon;
	dst.fd_wdwidth = src.fd_wdwidth = width >> 4;
	dst.fd_nplanes = src.fd_nplanes = ACSblk->nplanes;
	dst.fd_r1 = dst.fd_r2 = dst.fd_r3 = src.fd_r1 = src.fd_r2 = src.fd_r3 = 0;
	if ((tmp = Ax_malloc(dstsize)) == NULL)
	{
		icon->mainlist = NULL;
		return NULL;
	}
	src.fd_addr = tmp;
	memset(src.fd_addr, 0, dstsize);
	memcpy(src.fd_addr, &data[DATA_OFFSET], srcsize);
	if ((tmp = Ax_malloc(dstsize)) == NULL)
	{
		Ax_ifree(src.fd_addr);
		icon->mainlist = NULL;
		return NULL;
	}
	dst.fd_addr = tmp + DATA_OFFSET;
	tmp[0] = 1;
	if (ACSblk->description->flags & AB_NOTRANSICON)
		memcpy(dst.fd_addr, src.fd_addr, srcsize);
	else
		convert(&src, &dst, mask);
	Ax_ifree(src.fd_addr);
	return dst.fd_addr;
}
