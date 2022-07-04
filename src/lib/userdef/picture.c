/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Userdef picture                                       */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

static int16 color[2] = { 1, 0 };

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 CDECL A_picture(PARMBLK *pb)
{
	int16 pxy[8];
	int16 x;
	int16 y;
	int16 w;
	int16 h;
	int16 tmp;
	MFDB *src;
	AUSERBLK *auser;
	OBJECT *obj;
	
	obj = &pb->pb_tree[pb->pb_obj];
	auser = obj->ob_spec.auserblk;
	src = auser->ub_ptr3;
	
	if (src != NULL)
	{
		if (pb->pb_wc != 0 || pb->pb_hc != 0)
		{
			pxy[0] = pb->pb_xc;
			pxy[1] = pb->pb_yc;
			pxy[2] = pb->pb_xc + pb->pb_wc - 1;
			pxy[3] = pb->pb_yc + pb->pb_hc - 1;
		} else
		{
			pxy[0] = ACSblk->desk.x;
			pxy[1] = ACSblk->desk.y;
#if WITH_FIXES
			pxy[2] = ACSblk->desk.x + ACSblk->desk.w - 1;
			pxy[3] = ACSblk->desk.y + ACSblk->desk.h - 1;
#else
			pxy[2] = ACSblk->desk.x + ACSblk->desk.y - 1;
			pxy[3] = ACSblk->desk.y + ACSblk->desk.w - 1;
#endif
		}
		if (pxy[0] < pb->pb_x)
			pxy[0] = pb->pb_x;
		if (pxy[1] < pb->pb_y)
			pxy[1] = pb->pb_y;
		tmp = pb->pb_x + pb->pb_w - 1;
		if (pxy[2] > tmp)
			pxy[2] = tmp;
		tmp = pb->pb_y + pb->pb_h - 1;
		if (pxy[3] > tmp)
			pxy[3] = tmp;
		if (pxy[0] > pxy[2] || pxy[1] > pxy[3])
			return pb->pb_currstate & ~(OS_SELECTED);
		
		vs_clip(ACSblk->vdi_handle, TRUE, pxy);
		
		w = src->fd_w;
		h = src->fd_h;
		
		if (pb->pb_parm & ACS_PICTURE_TILE)
		{
			pxy[0] = pxy[1] = 0;
			pxy[2] = w - 1;
			pxy[3] = h - 1;
			for (y = pb->pb_y; y < pb->pb_y + pb->pb_h; y += h)
			{
				for (x = pb->pb_x; x < pb->pb_x + pb->pb_w; x += w)
				{
					pxy[4] = x;
					pxy[5] = y;
					pxy[6] = x + w - 1;
					pxy[7] = y + h - 1;
					vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, src, &ACSblk->screenMFDB);
				}
			}
		} else
		{
			if (pb->pb_parm & ACS_PICTURE_DITHER)
			{
				if (ACSblk->nplanes >= 4)
				{
					vsf_color(ACSblk->vdi_handle, G_LWHITE);
					vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
				} else
				{
					vsf_color(ACSblk->vdi_handle, G_BLACK);
					vsf_interior(ACSblk->vdi_handle, FIS_PATTERN);
					vsf_style(ACSblk->vdi_handle, IP_4PATT);
				}
			} else
			{
				vsf_color(ACSblk->vdi_handle, (int16)((pb->pb_parm >> 4) & 15));
				vsf_style(ACSblk->vdi_handle, (int16)((pb->pb_parm >> 8) & 31));
				vsf_interior(ACSblk->vdi_handle, (int16)((pb->pb_parm >> 16) & 15));
			}
			vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
			vsf_perimeter(ACSblk->vdi_handle, FALSE);
			v_bar(ACSblk->vdi_handle, pxy);
			pxy[0] = pxy[1] = 0;
			tmp = pb->pb_w - w;
			if (tmp > 0)
			{
				pxy[2] = w - 1;
				pxy[4] = (tmp >> 1) + pb->pb_x;
			} else
			{
				pxy[2] = pb->pb_w - 1;
				pxy[4] = pb->pb_x;
			}
			pxy[6] = pxy[4] + pxy[2];
			tmp = pb->pb_h - h;
			if (tmp > 0)
			{
				pxy[3] = h - 1;
				pxy[5] = (tmp >> 1) + pb->pb_y;
			} else
			{
				pxy[3] = pb->pb_h - 1;
				pxy[5] = pb->pb_y;
			}
			pxy[7] = pxy[5] + pxy[3];
			vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, src, &ACSblk->screenMFDB);
		}
		
		vs_clip(ACSblk->vdi_handle, FALSE, pxy);
	}
	
	return pb->pb_currstate & ~(OS_SELECTED);
}

/* -------------------------------------------------------------------------- */

static void del_pic(AUSERBLK *auser)
{
	AMFDB *mfdb;
	
	if (auser->ub_parm & ACS_PICTURE_TESTMODE)
	{
		Abp_delete(auser->ub_ptr3);
	} else
	{
		mfdb = auser->ub_ptr1;
		if (mfdb != NULL && mfdb->trans == auser->ub_ptr3)
		{
			if (--mfdb->count <= 0)
			{
				Abp_delete(mfdb->trans);
				mfdb->trans = NULL;
				mfdb->count = 0;
			}
		} else
		{
			Abp_delete(auser->ub_ptr3);
		}
	}
	auser->ub_ptr3 = NULL;
}

/* -------------------------------------------------------------------------- */

static int16 make_pic(AUSERBLK *auser)
{
	AMFDB *mfdb;
	MFDB *bp;
	MFDB *tmp;
	int16 planes;
	int16 diff_planes;
	ssize_t size;
	int16 pxy[8];
	
	mfdb = auser->ub_ptr1;
	bp = Abp_create(mfdb->org.fd_w, mfdb->org.fd_h);
	if (bp == NULL)
		return FAIL;
	size = (ssize_t)bp->fd_wdwidth * 2 * bp->fd_h;
	planes = mfdb->org.fd_nplanes;
	diff_planes = planes - ACSblk->nplanes;
	if (diff_planes >= 0)
	{
		mfdb->org.fd_nplanes = ACSblk->nplanes;
		mfdb->org.fd_addr = ((char *)(mfdb + 1)) + diff_planes * size;
		vr_trnfm(ACSblk->vdi_handle, &mfdb->org, bp);
		mfdb->org.fd_nplanes = planes;
	} else
	{
		tmp = Abp_create(mfdb->org.fd_w, mfdb->org.fd_h);
		if (tmp == NULL)
		{
			Abp_delete(bp);
			return FAIL;
		}
		if (planes == 1)
		{
			tmp->fd_nplanes = 1;
			mfdb->org.fd_addr = mfdb + 1;
			vr_trnfm(ACSblk->vdi_handle, &mfdb->org, tmp);
			pxy[0] = pxy[1] = pxy[4] = pxy[5] = 0;
			pxy[2] = pxy[6] = tmp->fd_w - 1;
			pxy[3] = pxy[7] = tmp->fd_h - 1;
			vrt_cpyfm(ACSblk->vdi_handle, MD_REPLACE, pxy, tmp, bp, color);
		} else
		{
			tmp->fd_stand = 1;
			memcpy(tmp->fd_addr, mfdb + 1, planes * size);
			memset((char *)tmp->fd_addr + planes * size, 0, (ssize_t)-diff_planes * size);
			vr_trnfm(ACSblk->vdi_handle, tmp, bp);
		}
		Abp_delete(tmp);
	}
	auser->ub_ptr3 = bp;
	if (!(auser->ub_parm & ACS_PICTURE_TESTMODE))
	{
		mfdb->trans = bp;
		mfdb->count = 1;
	}
	return OK;
}

/* -------------------------------------------------------------------------- */

boolean Auo_picture(OBJECT *entry, int16 task, void *in_out)
{
	AMFDB *mfdb;
	Awiob *ob;
	Awiob *self;
	Awindow *win;
	AUSERBLK *auser;
	
	auser = entry->ob_spec.auserblk;
	switch (task)
	{
	case AUO_CREATE:
		ob = Ax_malloc(sizeof(*ob));
		if (ob == NULL)
		{
			*((int16 *)in_out) = FAIL;
			break;
		}
		auser->ub_ptr2 = ob;
		ob->window = NULL;
		mfdb = auser->ub_ptr1;
		if (mfdb == NULL)
			break;
		if ((auser->ub_parm & ACS_PICTURE_TESTMODE) || mfdb->trans == NULL)
		{
			if (make_pic(auser) == FAIL)
			{
				*((int16 *)in_out) = FAIL;
				break;
			}
		} else
		{
			mfdb->count++;
			auser->ub_ptr3 = mfdb->trans;
		}
		break;
	
	case AUO_PICMFDB:
		del_pic(auser);
		auser->ub_ptr3 = in_out;
		break;
	
	case AUO_TERM:
		Ax_free(auser->ub_ptr2);
		del_pic(auser);
		break;
	
	case AUO_SELF:
		ob = in_out;
		self = auser->ub_ptr2;
		self->window = ob->window;
		self->entry = ob->entry;
		self->obnr = ob->obnr;
		break;
	
	case AUO_UPDATE:
	case AUO_FULLUPDATE:
		ob = auser->ub_ptr2;
		win = ob->window;
		if (win == NULL)
			break;
		win->obchange(win, ob->obnr, -1);
		break;
	
	case AUO_GETBUBBLE:
	case AUO_GETCONTEXT:
		break;
	
	default:
		return FALSE;
	}
	return TRUE;
}

