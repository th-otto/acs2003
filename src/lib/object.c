/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Object utilities                                      */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acsport.h"
#include "acs_i.h"
#include <ctype.h>
#include <stdarg.h>

static int16 map[16] = { 0, 2, 3, 6, 4, 7, 5, 8, 9, 10, 11, 14, 12, 15, 13, 1 };
static int16 xff[] = { -1 };
static MFDB punkt = { xff, 1, 1, 1, 0, 1, 0, 0, 0 };

static char ob_inout[1024];
static int16 col[2];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/* Creates a Copy of Parent */
OBJECT *Aob_create(const OBJECT *parent)
{
	OBJECT *copy;
	OBJECT *obj;
	int16 ok;
	void *aobj;
	ssize_t size;
	AUSERBLK *auser;
	
	size = 0; /* FIXME: useless assign */
	size = Aob_count(parent, TRUE) * sizeof(*copy);
	if ((copy = Ax_malloc(size)) == NULL)
		return NULL;
	memcpy(copy, parent, size);
	ok = OK;
	aobj = obj = copy;
	do
	{
		if (!(obj->ob_flags & AEO) && !(obj->ob_state & AOS_CONST))
		{
			switch ((char) obj->ob_type)
			{
			case G_TEXT:
			case G_BOXTEXT:
			case G_FTEXT:
			case G_FBOXTEXT:
				obj->ob_spec.tedinfo = aobj = Ate_create(obj->ob_spec.tedinfo);
				break;

			case G_USERDEF:
				obj->ob_spec.auserblk = aobj = auser = Aus_create(obj->ob_spec.auserblk);
				if (
#if WITH_FIXES
					auser != NULL &&
#endif
					auser->ub_serv != NULL)
					auser->ub_serv(obj, AUO_CREATE, &ok);
				if (ok == FAIL)
					return NULL;
				break;
			
			case G_BOX:
			case G_IBOX:
			case G_BOXCHAR:
				break;
			
			case G_IMAGE:
				obj->ob_spec.bitblk = aobj = Aim_create(obj->ob_spec.bitblk);
				break;
			
			case G_ICON:
			case G_CICON:
				obj->ob_spec.ciconblk = aobj = Aic_create(obj->ob_spec.ciconblk);
				break;

			case G_BUTTON:
			case G_STRING:
			case G_TITLE:
				obj->ob_spec.free_string = aobj = Ast_create(obj->ob_spec.free_string);
				break;
			}
			if (aobj == NULL)
				return NULL;
		}
	} while (!((obj++)->ob_flags & OF_LASTOB));
	return copy;
}

/* -------------------------------------------------------------------------- */

/* Frees Object generated by Aob_create */
void Aob_delete(OBJECT *object)
{
	AUSERBLK *auser;
    OBJECT *obj;
	
	if (object == NULL)
		return;
	obj = object;
	do
	{
		if (!(obj->ob_flags & AEO) && !(obj->ob_state & AOS_CONST))
		{
			switch ((char) obj->ob_type)
			{
			case G_TEXT:
			case G_BOXTEXT:
			case G_FTEXT:
			case G_FBOXTEXT:
				Ate_delete(obj->ob_spec.tedinfo);
				break;

			case G_USERDEF:
				auser = obj->ob_spec.auserblk;
				if (auser->ub_serv != NULL)
				{
					auser->ub_serv(obj, AUO_TERM, NULL);
				}
				Aus_delete(auser);
				break;
			
			case G_BUTTON:
			case G_STRING:
			case G_TITLE:
				Ast_delete(obj->ob_spec.free_string);
				break;
			
			case G_IMAGE:
				Aim_delete(obj->ob_spec.bitblk);
				break;
			
			case G_ICON:
			case G_CICON:
				Aic_delete(obj->ob_spec.ciconblk);
				break;

			case G_BOX:
			case G_IBOX:
			case G_BOXCHAR:
				/* break */ ;
			}
		}
	} while (!((obj++)->ob_flags & OF_LASTOB));
	Ax_free(object);
}

/* -------------------------------------------------------------------------- */

/* Count the Objects in an Object-Tree */
int16 Aob_count(const OBJECT *tree, boolean count_aobject)
{
	const OBJECT *ptr;
	int16 count;
	
	for (count = 1, ptr = tree; !(ptr->ob_flags & OF_LASTOB); ptr++)
	{
		if (count_aobject || !(ptr->ob_flags & AEO))
			count++;
	}
	count++; /* BUG? already initialized with 1 above */
	return count;
}

/* -------------------------------------------------------------------------- */

static void convert(MFDB *src, MFDB *dst, int16 *mask)
{
	int16 pixel;
	ssize_t planesize;
	ssize_t offset;
	ssize_t pos;
	int16 pixelmask;
	int16 *srcptr;
	int16 *maskptr;
	int16 x;
	int16 y;
	int16 pxy[8];
	
	if (ACSblk->description->flags & AB_NOTRANSICON)
	{
		memcpy(dst->fd_addr, src->fd_addr, src->fd_wdwidth * src->fd_h * 2 * ACSblk->nplanes);
		return;
	}
	if ((1 << ACSblk->nplanes) != ACSblk->ncolors)
	{
		planesize = src->fd_wdwidth * src->fd_h;
		pxy[0] = pxy[1] = pxy[2] = pxy[3] = 0;
		for (y = 0; y < dst->fd_h; y++)
		{
			pxy[5] = pxy[7] = y;
			offset = y * src->fd_wdwidth;
			for (x = 0; x < dst->fd_w; x++)
			{
				pos = (x >> 4) + offset;
				maskptr = mask + pos;
				srcptr = (int16 *)src->fd_addr + pos;
				pxy[4] = pxy[6] = x;
				pixelmask = (int16)(0x8000L >> (x & 15));
				if (*maskptr & pixelmask)
				{
					pixel = 0;
					if (*srcptr & pixelmask)
						pixel += 1;
					srcptr += planesize;
					if (*srcptr & pixelmask)
						pixel += 2;
					srcptr += planesize;
					if (*srcptr & pixelmask)
						pixel += 4;
					srcptr += planesize;
					if (*srcptr & pixelmask)
						pixel += 8;
					srcptr += planesize;
					if (*srcptr & pixelmask)
						pixel += 16;
					srcptr += planesize;
					if (*srcptr & pixelmask)
						pixel += 32;
					srcptr += planesize;
					if (*srcptr & pixelmask)
						pixel += 64;
					srcptr += planesize;
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

/* Create a Copy of Icon, but not image Part ! */
CICONBLK *Aic_create(const CICONBLK *icon)
{
	CICONBLK *copy;
	CICON *next_res;
	CICON *cicon;
	a_hcicon *data;
	ssize_t masksize;
	ssize_t dstsize;
	ssize_t srcsize;
	int16 w;
	int16 dummy;
	int16 g3;
	MFDB src;
	MFDB dst;
	
	copy = Ax_malloc(sizeof(*copy));
	if (copy == NULL)
		return NULL;
	memcpy(copy, icon, sizeof(*icon));
	copy->monoblk.ib_ptext = Ast_create(icon->monoblk.ib_ptext);
	if (copy->monoblk.ib_ptext == NULL)
	{
		Ax_recycle(copy, sizeof(*copy));
		return NULL;
	}
	
	cicon = NULL;
	next_res = copy->mainlist;
	if (next_res != NULL &&
		((ACSblk->AESglobal[0] > 0x330 && ACSblk->AESglobal[0] < 0x350) ||
		 (appl_getinfo(AES_SYSTEM, &dummy, &dummy, &g3, &dummy) && (g3 != 0))))
	{
		w = (copy->monoblk.ib_wicon + 15) & -16;
		masksize = (w * copy->monoblk.ib_hicon) >> 3;
		cicon = next_res;
		if (cicon->next_res != NULL && cicon->next_res->num_planes <= ACSblk->nplanes)
			cicon = cicon->next_res;
		copy->mainlist = cicon;
		cicon->next_res = NULL;
		if (ACSblk->nplanes >= cicon->num_planes)
		{
			data = (a_hcicon *)cicon->col_data;
			data--;
			if (data->count > 0)
			{
				++data->count;
				cicon->col_data = (int16 *)(data + 1);
				data = (a_hcicon *)cicon->sel_data;
				if (data != NULL)
				{
					--data;
					++data->count;
					cicon->sel_data = (int16 *)(data + 1);
				}
			} else
			{
				dstsize = masksize * ACSblk->nplanes + sizeof(a_hcicon);
				srcsize = masksize * cicon->num_planes;
				cicon->num_planes = ACSblk->nplanes;
				dst.fd_stand = FALSE;
				src.fd_stand = TRUE;
				dst.fd_w = src.fd_w = w;
				dst.fd_h = src.fd_h = copy->monoblk.ib_hicon;
				dst.fd_wdwidth = src.fd_wdwidth = w >> 4;
				dst.fd_nplanes = src.fd_nplanes = ACSblk->nplanes;
				dst.fd_r1 = dst.fd_r2 = dst.fd_r3 =
				src.fd_r1 = src.fd_r2 = src.fd_r3 = 0;
				data = Ax_malloc(dstsize);
				if (data == NULL)
				{
					copy->mainlist = NULL;
					return copy;
				}
				src.fd_addr = data;
				memset(src.fd_addr, 0, dstsize);
				memcpy(src.fd_addr, cicon->col_data, srcsize);
				data = Ax_malloc(dstsize);
				if (data == NULL)
				{
					copy->mainlist = NULL;
					return copy;
				}
				dst.fd_addr = (int16 *)(data + 1);
				data->count = 1;
				data->planes = cicon->col_data;
				convert(&src, &dst, cicon->col_mask);
				cicon->col_data = dst.fd_addr;
				
				if (cicon->sel_data != NULL)
				{
					data = Ax_malloc(dstsize);
					if (data == NULL)
					{
						cicon->sel_data = NULL;
						cicon->sel_mask = NULL;
					} else
					{
						memcpy(src.fd_addr, cicon->sel_data, srcsize);
						dst.fd_addr = (int16 *)(data + 1);
						data->count = 1;
						data->planes = cicon->sel_data;
						convert(&src, &dst, cicon->sel_mask);
						cicon->sel_data = dst.fd_addr;
					}
				}
				Ax_ifree(src.fd_addr);
			}
		} else
		{
			copy->mainlist = NULL;
		}
	} else
	{
		copy->mainlist = NULL;
	}
	return copy;
}

/* -------------------------------------------------------------------------- */

/* Release this Copy */
void Aic_delete(CICONBLK *icon)
{
	CICON *cicon;
	a_hcicon *data;
	
	if (icon == NULL)
		return;
	if (ACSblk->description->flags & AB_NOTRANSICON)
	{
#if WITH_FIXES
		Ast_delete(icon->monoblk.ib_ptext);
		icon->monoblk.ib_ptext = NULL;
		Ax_recycle(icon, sizeof(*icon));
#endif
		return;
	}
	cicon = icon->mainlist;
	if (cicon != NULL)
	{
		data = (a_hcicon *)cicon->col_data;
		data--;
		--data->count;
		if (data->count < 1)
		{
			cicon->col_data = data->planes;
			Ax_ifree(data);
		}
		data = (a_hcicon *)cicon->sel_data;
		if (data != NULL)
		{
			data--;
			--data->count;
			if (data->count < 1)
			{
				cicon->sel_data = data->planes;
				Ax_ifree(data);
			}
		}
	}
	Ast_delete(icon->monoblk.ib_ptext);
	Ax_recycle(icon, sizeof(*icon));
}

/* -------------------------------------------------------------------------- */

/* Create a bitblk-Copy, but not Image */
BITBLK *Aim_create(const BITBLK *bitblk)
{
	BITBLK *copy;
	
	if ((copy = Ax_malloc(sizeof(*copy))) == NULL)
		return NULL;
	memcpy(copy, bitblk, sizeof(*copy));
	return copy;
}

/* -------------------------------------------------------------------------- */

/* Release Copy */
void Aim_delete(BITBLK *bitblk)
{
	Ax_recycle(bitblk, sizeof(*bitblk));
}

/* -------------------------------------------------------------------------- */

/* Create a Copy */
TEDINFO *Ate_create(const TEDINFO *ted)
{
	TEDINFO *copy;
	
	if ((copy = Ax_malloc(sizeof(*copy))) == NULL)
		return NULL;
	memcpy(copy, ted, sizeof(*copy));
	copy->te_ptext = Ast_create(ted->te_ptext);
	copy->te_ptmplt = Ast_create(ted->te_ptmplt);
	copy->te_pvalid = Ast_create(ted->te_pvalid);
	if (copy->te_ptext == NULL || copy->te_ptmplt == NULL || copy->te_pvalid == NULL)
	{
		Ax_free(copy->te_ptext);
		Ax_free(copy->te_ptmplt);
		Ax_free(copy);
		return NULL;
	}
	return copy;
}

/* -------------------------------------------------------------------------- */

/* Release this Copy */
void Ate_delete(TEDINFO *ted)
{
	if (ted == NULL)
		return;
	Ast_delete(ted->te_pvalid);
	Ast_delete(ted->te_ptmplt);
	Ast_delete(ted->te_ptext);
	Ax_recycle(ted, sizeof(*ted));
}

/* -------------------------------------------------------------------------- */

/* Create a Copy */
AUSERBLK *Aus_create(const AUSERBLK *user)
{
	AUSERBLK *copy;

	copy = Ax_malloc(sizeof(*copy));
	if (copy == NULL)
		return NULL;
	memcpy(copy, user, sizeof(*copy));
	copy->bubble = Ast_create(user->bubble);
	copy->context = Ast_create(user->context);
	return copy;
}

/* -------------------------------------------------------------------------- */

/* Release this Copy */
void Aus_delete(AUSERBLK *user)
{
#if WITH_FIXES
	if (user != NULL)
#endif
	{
		Ast_delete(user->context);
		Ast_delete(user->bubble);
		Ax_recycle(user, sizeof(*user));
	}
}

/* -------------------------------------------------------------------------- */

/* Fixes Object */
void Aob_fix(OBJECT *tree)
{
	int16 x1;
	int16 x2;
	BITBLK *bit;
	ICONBLK *icon;
	
	if (tree->ob_state & AOS_FIXED)
		return;
	tree->ob_state |= AOS_FIXED;
	do
	{
		if (!(tree->ob_flags & AEO))
		{
			switch ((char) tree->ob_type)
			{
			case G_ICON:
				Aob_icon(tree);
				/* fall through */
			case G_CICON:
				rsrc_obfix(tree, 0);
				icon = tree->ob_spec.iconblk;
				x1 = icon->ib_xicon + icon->ib_wicon;
				x2 = icon->ib_xtext + icon->ib_wtext;
				if (x2 > x1)
					x1 = x2;
				if (tree->ob_width < x1)
					tree->ob_width = x1;
				x1 = icon->ib_yicon + icon->ib_hicon;
				x2 = icon->ib_ytext + icon->ib_htext;
				if (x2 > x1)
					x1 = x2;
				if (tree->ob_height < x1)
					tree->ob_height = x1;
				break;
				
			case G_IMAGE:
				rsrc_obfix(tree, 0);
				bit = tree->ob_spec.bitblk;
				x1 = bit->bi_wb * 8;
				if (tree->ob_width < x1)
					tree->ob_width = x1;
				if (tree->ob_height < bit->bi_hl)
					tree->ob_height = bit->bi_hl;
				break;
			
			default:
				rsrc_obfix(tree, 0);
				break;
			}
		}
	} while (!((tree++)->ob_flags & OF_LASTOB));
}

/* -------------------------------------------------------------------------- */

/* Changes G_ICON to G_CICON, if possible */
void Aob_icon(OBJECT *object)
{
	CICONBLK *icon;
	int16 dummy;
	int16 g3;
	
	icon = object->ob_spec.ciconblk;
	if (ACSblk->nplanes > 1 && icon->mainlist != NULL &&
		(((ACSblk->AESglobal[0] > 0x330 && ACSblk->AESglobal[0] < 0x350) ||
		 (appl_getinfo(AES_SYSTEM, &dummy, &dummy, &g3, &dummy) && (g3 != 0)))))
	{
		object->ob_type = G_CICON;
	} else
	{
		object->ob_type = G_ICON;
	}
}

/* -------------------------------------------------------------------------- */

/* Calculate Redraw-Rectangle for Object */
void Aob_offset(Axywh *area, OBJECT *tree, int16 entry)
{
	AUSERBLK *auser;
	OBJECT *obj;
	int16 obnr;
	int16 framesize;
	int16 xoff;
	int16 yoff;
	
	obj = &tree[entry];
	xoff = 0;
	switch ((char) obj->ob_type)
	{
	case G_BOX:
	case G_IBOX:
	case G_BOXCHAR:
		xoff = -(int8)(obj->ob_spec.index >> 16);
		break;
	
	case G_TEXT:
	case G_FTEXT:
	case G_BOXTEXT:
	case G_FBOXTEXT:
		xoff = -obj->ob_spec.tedinfo->te_thickness;
		break;
	
	case G_BUTTON:
		xoff = 1;
		if (obj->ob_flags & OF_EXIT)
			xoff = 2;
		if (obj->ob_flags & (OF_DEFAULT | AO_DEFABLE))
			xoff = 3;
		break;
	
	case G_USERDEF:
		auser = obj->ob_spec.auserblk;
		if (auser->ub_code == A_3Dbutton)
		{
			xoff = (int)(auser->ub_parm >> 20) & 0x0f;
			if (xoff > 7)
				xoff += -16;
			framesize = (int)(auser->ub_parm >> 16) & 0x0f;
			if (framesize > 0 && (obj->ob_flags & (OF_DEFAULT | AO_DEFABLE)))
				framesize++;
			if ((obj->ob_flags & (OF_EXIT | OF_SELECTABLE)) == (OF_EXIT | OF_SELECTABLE))
				framesize++;
			xoff = framesize + xoff;
		} else
		{
			xoff = 1;
		}
		/* break; */
	}
	
	if (xoff < 0)
		xoff = 0;
	if ((obj->ob_state & OS_OUTLINED) && xoff < 3)
		xoff = 3;
	if ((obj->ob_flags & (OF_EDITABLE | AO_DEFABLE)) && xoff < 3)
		xoff = 3;
	yoff = 0;
	if (obj->ob_state & OS_SHADOWED)
	{
		if (xoff > 0)
			yoff = xoff * 2;
		else
			yoff = -xoff * 2;
	}
	area->x = obj->ob_x - xoff;
	area->y = obj->ob_y - xoff;
	area->w = 2 * xoff + obj->ob_width + yoff;
	area->h = 2 * xoff + obj->ob_height + yoff;
	while (TRUE)
	{
		obnr = entry;
		entry = tree[obnr].ob_next;
		if (entry == NIL)
			break;
		if (obnr == tree[entry].ob_tail)
		{
			area->x += tree[entry].ob_x;
			area->y += tree[entry].ob_y;
		}
	}
}

/* -------------------------------------------------------------------------- */

/* save rectangle of desktop */
MFDB *Aob_save(Axywh *area)
{
	MFDB *bp;
	int16 pxy[8];
	int16 x;
	
	/* FIXME: should not add to width/height */
	if (area->x < 0)
	{
		area->w -= area->x;
		area->x = 0;
	}
	if (area->y < 0)
	{
		area->h -= area->y;
		area->y = 0;
	}
	x = area->x + area->w - ACSblk->desk.w;
	if (x > 0)
		area->w -= x;
	x = area->y + area->h - ACSblk->desk.y - ACSblk->desk.h;
	if (x > 0)
		area->h -= x;
	/* BUG: should not round up/down to byte boundary; this may be outside of a window */
	pxy[0] = 0xfff8 & area->x;
	pxy[1] = area->y;
	pxy[2] = (area->x + area->w) | 7;
	pxy[3] = area->y + area->h - 1;
	if ((bp = Abp_create(pxy[2] - pxy[0] + 1, area->h)) == NULL)
		return NULL;
	pxy[4] = 0;
	pxy[5] = 0;
	pxy[6] = pxy[2] - pxy[0];
	pxy[7] = area->h - 1;
	graf_mouse(M_OFF, NULL);
	vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, &ACSblk->screenMFDB, bp);
	graf_mouse(M_ON, NULL);
	return bp;
}

/* -------------------------------------------------------------------------- */

/* restore desktop previously saved with Aob_save */
void Aob_restore(MFDB *save, Axywh *area)
{
	int16 pxy[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
	
	if (save == NULL)
	{
		Aev_WmRedraw(ACSblk->gl_apid, -1, area);
		Aev_mess();
	} else
	{
		pxy[4] = 0xfff8 & area->x;
		pxy[5] = area->y;
		pxy[6] = (area->x + area->w) | 7;
		pxy[7] = area->y + area->h - 1;
		pxy[0] = 0;
		pxy[1] = 0;
		pxy[2] = pxy[6] - pxy[4];
		pxy[3] = area->h - 1;
		vs_clip(ACSblk->vdi_handle, FALSE, pxy);
		graf_mouse(M_OFF, NULL);
		vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, save, &ACSblk->screenMFDB);
		graf_mouse(M_ON, NULL);
		Abp_delete(save);
	}
}

/* -------------------------------------------------------------------------- */

/* handle key for toolbar */
int16 Aob_tobkey(Awindow *win, int16 kstate, int16 key)
{
	OBJECT *tree;
	int16 obnr;
	boolean dragable;
	
	if ((tree = win->toolbar) == NULL || (win->state & AWS_ICONIZED))
		return -1;
	obnr = Aob_key(tree, kstate, key);
	if (obnr < 0)
		return -1;
	if (tree[obnr].ob_flags & AO_DRAGABLE)
		dragable = TRUE;
	else
		dragable = FALSE;
	if (Aob_select(win, tree, obnr, dragable) > 0)
		return obnr | A_TOOLBAR;
	return -1;
}

/* -------------------------------------------------------------------------- */

/* handle key for work area */
int16 Aob_wobkey(Awindow *win, int16 kstate, int16 key)
{
	OBJECT *tree;
	int16 obnr;
	boolean dragable;
	
	tree = win->work;
	if (tree == NULL || (win->state & AWS_ICONIZED))
		return -1;
	obnr = Aob_key(tree, kstate, key);
	if (obnr < 0)
		return -1;
	if (tree[obnr].ob_flags & AO_DRAGABLE)
		dragable = TRUE;
	else
		dragable = FALSE;
	if (Aob_select(win, tree, obnr, dragable))
		return obnr;
	return -1;
}

/* -------------------------------------------------------------------------- */

int16 Aob_execute(Awindow *win, OBJECT *tree, int16 obnr)
{
	AOBJECT *aobj;
	OBJECT *obj;
	int16 tobnr;
	
	tobnr = obnr;
	if (obnr < 0)
		return FAIL;
	obj = &tree[obnr];
	aobj = (AOBJECT *)obj + 1;
	if (tree == win->toolbar)
		tobnr |= A_TOOLBAR;
	if ((obj->ob_flags & OF_TOUCHEXIT) &&
		(
#if WITH_FIXES
		 (obj->ob_flags & OF_LASTOB) ||
#endif
		 aobj->click == NULL || !(aobj->ob_flags & AEO)))
		return FALSE;
	if ((obj->ob_flags & (OF_SELECTABLE | OF_EXIT)) == (OF_SELECTABLE | OF_EXIT) && !(obj->ob_state & OS_SELECTED))
		Adr_add(win, tobnr);
	if (!(obj->ob_flags & OF_LASTOB) && (aobj->ob_flags & AEO) && aobj->click != NULL)
	{
		ACSblk->ev_window = win;
		ACSblk->ev_object = tree;
		ACSblk->ev_obnr = obnr;
		if (obj->ob_flags & OF_TOUCHEXIT)
		{
			aobj->click();
		} else
		{
			Amo_busy();
			aobj->click();
			Amo_unbusy();
		}
		if (tree != win->work && tree != win->toolbar)
			return FAIL;
	}
	if ((obj->ob_flags & (OF_SELECTABLE | OF_EXIT)) == (OF_SELECTABLE | OF_EXIT) && (obj->ob_state & OS_SELECTED))
	{
		Adr_del(win, tobnr);
		if (obj->ob_state & OS_SELECTED)
			win->obchange(win, tobnr, obj->ob_state & ~OS_SELECTED);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

/* Alias object, number in userp1 */
void Aob_alias(void)
{
	Awindow *win = ACSblk->ev_window;
	OBJECT *tree = ACSblk->ev_object;
	AOBJECT *aobj;
	int16 obnr = ACSblk->ev_obnr;
	
	aobj = (AOBJECT *)&tree[obnr] + 1;
	Aob_select(win, tree, (int16)(int32)aobj->userp1, (tree[obnr].ob_state & AOS_DCLICK) != 0);
	ACSblk->ev_window = win;
	ACSblk->ev_object = tree;
	ACSblk->ev_obnr = obnr;
}

/* -------------------------------------------------------------------------- */

/* Handle click on object */
boolean Aob_select(Awindow *win, OBJECT *tree, int16 obnr, boolean dclick)
{
	boolean ret;
	int16 parent;
	int16 child;
	int16 tobnr;
	OBJECT *obj;
	
	ret = FALSE;
	if (tree == win->work)
		tobnr = obnr;
	else
		tobnr = A_TOOLBAR | obnr;
	obj = &tree[obnr];
	if (obj->ob_flags & OF_HIDETREE)
		return FALSE;
	if (obj->ob_state & OS_DISABLED)
		return FALSE;
	if (dclick)
		obj->ob_state |= AOS_DCLICK;
	else
		obj->ob_state &= ~AOS_DCLICK;
	if ((obj->ob_flags & (OF_TOUCHEXIT | OF_EDITABLE | OF_EXIT | OF_SELECTABLE | AO_DRAGABLE)) == OF_EDITABLE &&
		(char)obj->ob_type == G_USERDEF)
	{
		if (win->ob_edit == obnr || Awi_focuschg(win, win->ob_edit, obnr) == TRUE)
			Aus_objboxed(win, tree, obnr);
		ret = FALSE;
	}
	if (obj->ob_flags & AO_DRAGABLE)
	{
		if (dclick && (obj->ob_flags & OF_EXIT))
		{
			Adr_unselect();
			Aob_execute(win, tree, obnr);
		} else
		{
			if (obj->ob_state & OS_SELECTED)
				Adr_del(win, tobnr);
			else
				Adr_add(win, tobnr);
		}
		return TRUE;
	}
	if ((obj->ob_flags | ~(OF_SELECTABLE | OF_RBUTTON)) == -1u)
	{
		if (!(obj->ob_state & OS_SELECTED))
		{
			parent = Aob_up(tree, obnr);
			for (child = tree[parent].ob_head; child != parent; child = tree[child].ob_next)
			{
				if ((tree[child].ob_flags & OF_RBUTTON) && (tree[child].ob_state & OS_SELECTED))
				{
					if (tobnr & A_TOOLBAR)
						win->obchange(win, child | A_TOOLBAR, tree[child].ob_state & ~OS_SELECTED);
					else
						win->obchange(win, child, tree[child].ob_state & ~OS_SELECTED);
				}
			}
			win->obchange(win, tobnr, obj->ob_state | OS_SELECTED);
		}
		ret = TRUE;
	}
	
	if ((obj->ob_flags & (OF_SELECTABLE | OF_EXIT)) == (OF_SELECTABLE | OF_EXIT))
	{
		Aob_execute(win, tree, obnr);
		return TRUE;
	}
	if ((obj->ob_flags & (OF_RBUTTON | OF_SELECTABLE)) == (OF_SELECTABLE))
	{
		win->obchange(win, tobnr, obj->ob_state ^ OS_SELECTED);
		ret = TRUE;
	}
	if (obj->ob_flags & OF_TOUCHEXIT)
	{
		if (Aob_execute(win, tree, obnr) == FALSE && dclick && (win->kind & AW_TOOLBOX))
			win->topped(win);
		return TRUE;
	}
	return ret;
}

/* -------------------------------------------------------------------------- */

/* Watched Object, select, if pointer upon obnr  */
/* returns TRUE, if button was released upon obnr */
int16 Aob_watch(Awindow *win, int16 tobnr)
{
	int16 obnr;
	int16 dummy;
	int16 events;
	int16 type;
	boolean inside;
	OBJECT *tree;
	Axywh rect;
	Axywh irect;
	ICONBLK *icon;
	
	if (tobnr & A_TOOLBAR)
	{
		tree = win->toolbar;
		obnr = tobnr & A_MASK;
	} else
	{
		tree = win->work;
		obnr = tobnr;
	}
	objc_offset(tree, obnr, &rect.x, &rect.y);
	rect.x += win->wi_work.x;
	rect.y += win->wi_work.y;
	rect.w = tree[obnr].ob_width;
	rect.h = tree[obnr].ob_height;
	if ((type = tree[obnr].ob_type & 0xff) == G_ICON || type == G_CICON)
	{
		icon = tree[obnr].ob_spec.iconblk;
		irect.x = rect.x + icon->ib_xtext;
		irect.y = rect.y + icon->ib_ytext;
		irect.w = icon->ib_wtext;
		irect.h = icon->ib_htext;
		rect.x += icon->ib_xicon;
		rect.y += icon->ib_yicon;
		rect.w = icon->ib_wicon;
		rect.h = icon->ib_hicon;
	} else
	{
		memcpy(&irect, &rect, sizeof(irect));
	}
	win->obchange(win, tobnr, tree[obnr].ob_state | OS_SELECTED);
	inside = TRUE;
	ACSblk->ev_mmox = ACSblk->ev_mmoy = 0;
	while (TRUE)
	{
		Awi_update(BEG_MCTRL);
		events = evnt_multi(MU_BUTTON | MU_M1,
			1, 3, 0,
			1, ACSblk->ev_mmox, ACSblk->ev_mmoy, 1, 1,
			0, 0, 0, 0, 0,
			NULL,
			0, 0,
			&ACSblk->ev_mmox, &ACSblk->ev_mmoy, &dummy, &dummy, &dummy, &dummy);
		Awi_update(END_MCTRL);
		
		if (events & MU_BUTTON)
			break;
		
		if (Aob_within(&rect, ACSblk->ev_mmox, ACSblk->ev_mmoy) ||
			Aob_within(&irect, ACSblk->ev_mmox, ACSblk->ev_mmoy))
		{
			if (!inside)
			{
				inside = TRUE;
				win->obchange(win, tobnr, tree[obnr].ob_state | OS_SELECTED);
			}
		} else
		{
			if (inside)
			{
				inside = FALSE;
				win->obchange(win, tobnr, tree[obnr].ob_state & ~OS_SELECTED);
			}
		}
	}
	return inside;
}

/* -------------------------------------------------------------------------- */

/* Waits for release of Mousebuttons */
void Aev_release(void)
{
	int16 dummy;
	int16 events;
	
	do
	{
		Awi_update(BEG_MCTRL);
		events = evnt_multi(MU_TIMER | MU_BUTTON,
			1, 3, 0,
			0, 0, 0, 0, 0,
			0, 0, 0, 0, 0,
			NULL,
			10, 0,
			&dummy, &dummy, &dummy, &dummy, &dummy, &dummy);
		Awi_update(END_MCTRL);
	} while (!(events & MU_BUTTON));
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

/* check for objects handling key */
int16 Aob_key(OBJECT *tree, int16 kstate, int16 key)
{
	int16 child;
	int16 parent;
	int16 objkey;
	
	if (isprint((char)key))
	{
		key = Ach_toupper((char)key & 0xff) | (key & ~0xff);
	}
	if (key & (NKF_CAPS | NKF_SHIFT))
	{
		key = (key | NKF_SHIFT) & ~NKF_CAPS;
	}
	key &= ~(NKF_RESVD | NKF_NUM);
	parent = ROOT;
	while (TRUE)
	{
		if (parent < 0)
		{
			child = ROOT;
		} else if (tree[parent].ob_flags & OF_HIDETREE)
		{
			child = NIL;
		} else
		{
			child = tree[parent].ob_head;
		}
		if (child < 0)
		{
			child = tree[parent].ob_next;
			while (child >= 0 && parent == tree[child].ob_tail)
			{
				parent = child;
				child = tree[child].ob_next;
			}
		}
		if (child < 0 ||
			(
#if WITH_FIXES
			 !(tree[child].ob_flags & OF_LASTOB) &&
#endif
			 (tree[child + 1].ob_flags & AEO) &&
			 !(tree[child].ob_state & OS_DISABLED) &&
			 (objkey = ((AOBJECT *)(&tree[child + 1]))->key) != 0 &&
			  objkey == key))
		{
			return child;
		}
		parent = child;
	}
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

/* Find obnr for which Flagmask becomes TRUE, obnr is start object */
int16 Aob_findflag(OBJECT *tree, int16 obnr, int16 flags)
{
	int16 child;
	
	while (TRUE)
	{
		if (obnr < 0)
		{
			child = ROOT;
		} else if (tree[obnr].ob_flags & OF_HIDETREE)
		{
			child = NIL;
		} else
		{
			child = tree[obnr].ob_head;
		}
		if (child < 0)
		{
			child = tree[obnr].ob_next;
			while (child >= 0 && obnr == tree[child].ob_tail)
			{
				obnr = child;
				child = tree[child].ob_next;
			}
		}
		if (child < 0 || (tree[child].ob_flags & flags) != 0)
			return child;
		obnr = child;
	}
}

/* -------------------------------------------------------------------------- */

/* Find parent Objectnr, returns -1 on top level */
int16 Aob_up(OBJECT *tree, int16 obnr)
{
	int16 child;
	int16 next;
	
	child = obnr;
	for (;;)
	{
		next = tree[child].ob_next;
		if (next < 0)
			return NIL;
		if (tree[next].ob_tail == child)
			return next;
		child = next;
	}
}

/* -------------------------------------------------------------------------- */

void Aob_printf(OBJECT *tree, int16 obnr, const char *format, ...)
{
	va_list args;
	
	va_start(args, format);
	vsprintf(ob_inout, format, args);
	va_end(args);
	Aob_puttext(tree, obnr, ob_inout);
}

/* -------------------------------------------------------------------------- */

void Aob_puttext(OBJECT *tree, int16 obnr, const char *text)
{
	AUSERBLK *auser;
	TEDINFO *ted;
	
	switch ((char)tree[obnr].ob_type)
	{
	case G_TEXT:
	case G_FTEXT:
	case G_BOXTEXT:
	case G_FBOXTEXT:
		ted = tree[obnr].ob_spec.tedinfo;
		strncpy(ted->te_ptext, text, ted->te_txtlen);
		ted->te_ptext[ted->te_txtlen - 1] = '\0';
		break;
	
	case G_BUTTON:
	case G_STRING:
	case G_TITLE:
		strcpy(tree[obnr].ob_spec.free_string, text);
		break;
	
	case G_ICON:
	case G_CICON:
		strcpy(tree[obnr].ob_spec.iconblk->ib_ptext, text);
		break;
	
	case G_USERDEF:
		auser = tree[obnr].ob_spec.auserblk;
		auser->ub_serv(&tree[obnr], AUO_SETVAL, NO_CONST(text));
		break;
	}
}

/* -------------------------------------------------------------------------- */

int16 Aob_scanf(OBJECT *tree, int16 obnr, const char *format, ...)
{
	va_list args;
	int16 len;
	const char *scan;
	
	len = Aob_gettext(tree, obnr, ob_inout);
	if (format != NULL)
	{
		if (ob_inout[0] == '\0' && (scan = strchr(format, '%')) != NULL)
		{
			++scan;
			while (isdigit(*scan))
				++scan;
			if (*scan == 'h' || *scan == 'l' || *scan == 'L')
				scan++;
			if (*scan == 'd' || *scan == 'o' || *scan == 'i' || *scan == 'u' || *scan == 'x')
				strcpy(ob_inout, "0 0 0 0 0 0 0 0 0 0");
		}
		va_start(args, format);
		vsscanf(ob_inout, format, args);
		va_end(args);
	}
	return len;
}

/* -------------------------------------------------------------------------- */

int16 Aob_gettext(OBJECT *tree, int16 obnr, char *text)
{
	AUSERBLK *auser;
	int16 len;
	char *usertext;
	
	len = -1;
	usertext = NULL;
	
	switch ((char)tree[obnr].ob_type)
	{
	case G_TEXT:
	case G_FTEXT:
	case G_BOXTEXT:
	case G_FBOXTEXT:
		len = tree[obnr].ob_spec.tedinfo->te_txtlen; /* BUG: te_txtlen includes terminating NUL */
		if (text != NULL)
			strcpy(text, tree[obnr].ob_spec.tedinfo->te_ptext);
		break;
	
	case G_ICON:
	case G_CICON:
		len = (int)strlen(tree[obnr].ob_spec.iconblk->ib_ptext);
		if (text != NULL)
			strcpy(text, tree[obnr].ob_spec.iconblk->ib_ptext);
		break;
	
	case G_BUTTON:
	case G_STRING:
	case G_TITLE:
		len = (int)strlen(tree[obnr].ob_spec.free_string);
		if (text != NULL)
			strcpy(text, tree[obnr].ob_spec.free_string);
		break;
	
	case G_USERDEF:
		auser = tree[obnr].ob_spec.auserblk;
		auser->ub_serv(&tree[obnr], AUO_GETVAL, &usertext);
		if (usertext != NULL)
		{
			len = (int)strlen(usertext);
			if (text != NULL)
				strcpy(text, usertext);
		}
		break;
	}
	
	return len;
}
