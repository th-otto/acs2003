/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      User-defined objects                                  */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

static int16 icn_count = 0;
static MFDB *icn_chk_sel = NULL;
static MFDB *icn_chk_un = NULL;
static MFDB *icn_chk_dissel = NULL;
static MFDB *icn_chk_disun = NULL;
static MFDB *icn_rad_sel = NULL;
static MFDB *icn_rad_un = NULL;
static MFDB *icn_rad_dissel = NULL;
static MFDB *icn_rad_disun = NULL;
#if !WITH_FIXES
static MFDB *icn_mask = NULL;
#endif
static MFDB *icn_tmp = NULL;
static char save[2] = " ";
static char save2[2] = " ";
static MFDB rad = { NULL, 16, 16, 1, 1, 1, 0, 0, 0 };
static int16 col[2] = { 1, 0 };
static int16 col2[2] = { 0, 1 };

static MFDB *act;

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 INuserobj(void)
{
	int16 planes;
	
	if (icn_count++ != 0 || ACSblk->nplanes < 4)
		return OK;
	planes = ACSblk->nplanes;
#if !WITH_FIXES
	if (ACSblk->nplanes > 8)
#endif
		ACSblk->nplanes = 4;
#if !WITH_FIXES
	if ((icn_mask = Abp_create(16, 16)) == NULL)
		return FAIL;
#endif
	if ((icn_chk_sel = Abp_create(16, 16)) == NULL ||
		(icn_chk_un = Abp_create(16, 16)) == NULL ||
		(icn_rad_sel = Abp_create(16, 16)) == NULL ||
		(icn_rad_un = Abp_create(16, 16)) == NULL ||
		(icn_chk_dissel = Abp_create(16, 16)) == NULL ||
		(icn_chk_disun = Abp_create(16, 16)) == NULL ||
		(icn_rad_dissel = Abp_create(16, 16)) == NULL ||
		(icn_rad_disun = Abp_create(16, 16)) == NULL ||
		(icn_tmp = Abp_create(16, 16)) == NULL)
	{
		ACSblk->nplanes = planes;
#if !WITH_FIXES
		Abp_delete(icn_mask);
		icn_mask = NULL;
#endif
		if (icn_rad_un != NULL)
		{
			Abp_delete(icn_rad_un);
			icn_rad_un = NULL;
		}
		if (icn_rad_sel != NULL)
		{
			Abp_delete(icn_rad_sel);
			icn_rad_sel = NULL;
		}
		if (icn_chk_un != NULL)
		{
			Abp_delete(icn_chk_un);
			icn_chk_un = NULL;
		}
		if (icn_chk_sel != NULL)
		{
			Abp_delete(icn_chk_sel);
			icn_chk_sel = NULL;
		}
		if (icn_rad_disun != NULL)
		{
			Abp_delete(icn_rad_disun);
			icn_rad_disun = NULL;
		}
		if (icn_rad_dissel != NULL)
		{
			Abp_delete(icn_rad_dissel);
			icn_rad_dissel = NULL;
		}
		if (icn_chk_disun != NULL)
		{
			Abp_delete(icn_chk_disun);
			icn_chk_disun = NULL;
		}
		if (icn_chk_dissel != NULL)
		{
			Abp_delete(icn_chk_dissel);
			icn_chk_dissel = NULL;
		}
		return FAIL;
	}
	ACSblk->nplanes = planes;

	if (ACSblk->nplanes > 8)
	{
		int16 i;

		/* WTF? */
		for (i = 0; i < -16; i++)
			_CHK_3D_S.monoblk.ib_pmask[i] ^= -1;
	}
#if !WITH_FIXES
	memset(icn_tmp->fd_addr, 0, ACSblk->nplanes * 32L);
#endif
	memcpy(icn_tmp->fd_addr, _CHK_3D_S.mainlist->col_data, 16 * 2 * 4);
	icn_tmp->fd_stand = TRUE;
	vr_trnfm(ACSblk->vdi_handle, icn_tmp, icn_chk_sel);
	
	if (ACSblk->nplanes > 8)
	{
		int16 i;

		/* WTF? */
		for (i = 0; i < -16; i++)
			_CHK_3D_U.monoblk.ib_pmask[i] ^= -1;
	}
#if !WITH_FIXES
	memset(icn_tmp->fd_addr, 0, ACSblk->nplanes * 32L);
#endif
	memcpy(icn_tmp->fd_addr, _CHK_3D_U.mainlist->col_data, 16 * 2 * 4);
	icn_tmp->fd_stand = TRUE;
	vr_trnfm(ACSblk->vdi_handle, icn_tmp, icn_chk_un);
	
	if (ACSblk->nplanes > 8)
	{
		int16 i;

		/* WTF? */
		for (i = 0; i < -16; i++)
			_CHK_3D_DS.monoblk.ib_pmask[i] ^= -1;
	}
#if !WITH_FIXES
	memset(icn_tmp->fd_addr, 0, ACSblk->nplanes * 32L);
#endif
	memcpy(icn_tmp->fd_addr, _CHK_3D_DS.mainlist->col_data, 16 * 2 * 4);
	icn_tmp->fd_stand = TRUE;
	vr_trnfm(ACSblk->vdi_handle, icn_tmp, icn_chk_dissel);
	
	if (ACSblk->nplanes > 8)
	{
		int16 i;

		/* WTF? */
		for (i = 0; i < -16; i++)
			_CHK_3D_DU.monoblk.ib_pmask[i] ^= -1;
	}
#if !WITH_FIXES
	memset(icn_tmp->fd_addr, 0, ACSblk->nplanes * 32L);
#endif
	memcpy(icn_tmp->fd_addr, _CHK_3D_DU.mainlist->col_data, 16 * 2 * 4);
	icn_tmp->fd_stand = TRUE;
	vr_trnfm(ACSblk->vdi_handle, icn_tmp, icn_chk_disun);
	
#if !WITH_FIXES
	memset(icn_tmp->fd_addr, 0, ACSblk->nplanes * 32L);
#endif
	memcpy(icn_tmp->fd_addr, _RD_3D_S.mainlist->col_data, 16 * 2 * 4);
	icn_tmp->fd_stand = TRUE;
	vr_trnfm(ACSblk->vdi_handle, icn_tmp, icn_rad_sel);
	
#if !WITH_FIXES
	memset(icn_tmp->fd_addr, 0, ACSblk->nplanes * 32L);
#endif
	memcpy(icn_tmp->fd_addr, _RD_3D_U.mainlist->col_data, 16 * 2 * 4);
	vr_trnfm(ACSblk->vdi_handle, icn_tmp, icn_rad_un);
	
#if !WITH_FIXES
	memset(icn_tmp->fd_addr, 0, ACSblk->nplanes * 32L);
#endif
	memcpy(icn_tmp->fd_addr, _RD_3D_DS.mainlist->col_data, 16 * 2 * 4);
	vr_trnfm(ACSblk->vdi_handle, icn_tmp, icn_rad_dissel);
	
#if !WITH_FIXES
	memset(icn_tmp->fd_addr, 0, ACSblk->nplanes * 32L);
#endif
	memcpy(icn_tmp->fd_addr, _RD_3D_DU.mainlist->col_data, 16 * 2 * 4);
	vr_trnfm(ACSblk->vdi_handle, icn_tmp, icn_rad_disun);
	
	Abp_delete(icn_tmp);
	
	return OK;
}

/* -------------------------------------------------------------------------- */

void TRuserobj(void)
{
	if (--icn_count != 0 || ACSblk->nplanes < 4 || icn_rad_un == NULL)
		return;
	
	Abp_delete(icn_rad_un);
	Abp_delete(icn_rad_sel);
	Abp_delete(icn_chk_un);
	Abp_delete(icn_chk_sel);
	Abp_delete(icn_rad_disun);
	Abp_delete(icn_rad_dissel);
	Abp_delete(icn_chk_disun);
	Abp_delete(icn_chk_dissel);
#if !WITH_FIXES
	Abp_delete(icn_mask);
#endif

	icn_rad_sel =
	icn_rad_dissel =
	icn_rad_un =
	icn_rad_disun =
	icn_chk_un =
	icn_chk_disun =
	icn_chk_sel =
	icn_chk_dissel = NULL;
}

/* -------------------------------------------------------------------------- */

static void g_string(int16 x, int16 y, const char *str, int16 key, boolean disabled)
{
	int16 pxy[8];
	int16 w;
	int16 w2;
	char lowerc;
	char upperc;
	char *lowerpos;
	char *upperpos;
	int16 effects;
	int16 effects2;
	
	effects = disabled ? TF_LIGHTENED : TF_NORMAL;
	effects2 = disabled ? TF_LIGHTENED : TF_NORMAL;
	if (key & NKF_ALT)
		effects2 |= TF_UNDERLINED;
	if (key & NKF_CTRL)
		effects2 |= TF_OUTLINED;
	if (key & NKF_SHIFT)
		effects2 |= TF_THICKENED;
	if ((key & (NKF_ALT | NKF_CTRL)) != 0)
		key &= ~NKF_FUNC;
	lowerc = upperc = '\0';
	if (key != 0 && (key & NKF_FUNC) == 0)
	{
		lowerc = Ach_tolower(key);
		upperc = Ach_toupper(key);
	}
	lowerpos = strchr(str, lowerc);
	upperpos = strchr(str, upperc);
	if (lowerpos == NULL || (upperpos != NULL && lowerpos > upperpos))
		lowerpos = upperpos;
	if (!Ast_isEmpty(lowerpos))
	{
		save[0] = *lowerpos;
		*lowerpos = '\0';
		if (*str != '\0')
		{
			vst_effects(ACSblk->vdi_handle, effects);
			vqt_extent(ACSblk->vdi_handle, str, pxy);
			w = pxy[2] - pxy[0];
			v_gtext(ACSblk->vdi_handle, x, y, str);
		} else
		{
			w = 0;
		}
		vst_effects(ACSblk->vdi_handle, effects2);
		vqt_extent(ACSblk->vdi_handle, save, pxy);
		w2 = pxy[2] - pxy[0];
		v_gtext(ACSblk->vdi_handle, x + w, y, save);
		if (lowerpos[1] != '\0')
		{
			vst_effects(ACSblk->vdi_handle, effects);
			v_gtext(ACSblk->vdi_handle, x + w + w2, y, lowerpos + 1);
		}
		*lowerpos = save[0];
	} else
	{
		if (!Ast_isEmpty(str))
		{
			vst_effects(ACSblk->vdi_handle, effects);
			v_gtext(ACSblk->vdi_handle, x, y, str);
		}
	}
}

/* -------------------------------------------------------------------------- */

static int16 g_stringLen(const char *str, int16 key, boolean disabled)
{
	int16 pxy[8];
	int16 w;
	int16 w2;
	int16 w3;
	char lowerc;
	char upperc;
	char *lowerpos;
	char *upperpos;
	int16 effects;
	int16 effects2;
	
	w = 0;
	w2 = 0;
	w3 = 0;
	effects = disabled ? TF_LIGHTENED : TF_NORMAL;
	effects2 = disabled ? TF_LIGHTENED : TF_NORMAL;
	if (key & NKF_ALT)
		effects2 |= TF_UNDERLINED;
	if (key & NKF_CTRL)
		effects2 |= TF_OUTLINED;
	if (key & NKF_SHIFT)
		effects2 |= TF_THICKENED;
	if ((key & (NKF_ALT | NKF_CTRL)) != 0)
		key &= ~NKF_FUNC;
	lowerc = upperc = '\0';
	if (key != 0 && (key & NKF_FUNC) == 0)
	{
		lowerc = Ach_tolower(key);
		upperc = Ach_toupper(key);
	}
	lowerpos = strchr(str, lowerc);
	upperpos = strchr(str, upperc);
	if (lowerpos == NULL || (upperpos != NULL && lowerpos > upperpos))
		lowerpos = upperpos;
	if (!Ast_isEmpty(lowerpos))
	{
		save2[0] = *lowerpos;
		*lowerpos = '\0';
		if (*str != '\0')
		{
			vst_effects(ACSblk->vdi_handle, effects);
			vqt_extent(ACSblk->vdi_handle, str, pxy);
			w = pxy[2] - pxy[0];
		}
		vst_effects(ACSblk->vdi_handle, effects2);
		vqt_extent(ACSblk->vdi_handle, save2, pxy);
		w2 = pxy[2] - pxy[0];
		if (lowerpos[1] != '\0')
		{
			vst_effects(ACSblk->vdi_handle, effects);
			vqt_extent(ACSblk->vdi_handle, lowerpos + 1, pxy);
			w3 = pxy[2] - pxy[0];
		}
		*lowerpos = save2[0];
	} else
	{
		if (!Ast_isEmpty(str))
		{
			vst_effects(ACSblk->vdi_handle, effects);
			vqt_extent(ACSblk->vdi_handle, str, pxy);
			w = pxy[2] - pxy[0];
		}
	}
	return w + w2 + w3;
}

/* -------------------------------------------------------------------------- */

boolean Auo_string(OBJECT *entry, int16 task, void *in_out)
{
	Awiob *ob;
	Awindow *win;
	AUSERBLK *auser;
	
	auser = entry->ob_spec.auserblk;
	switch (task)
	{
	case AUO_CREATE:
		if (auser->ub_ptr1 != NULL)
			auser->ub_ptr1 = Ast_create(auser->ub_ptr1);
		if (auser->ub_ptr1 == NULL)
			auser->ub_ptr1 = Ast_create("");
		break;
	
	case AUO_SELF:
		ob = in_out;
		auser->ub_ptr2 = ob->window;
		auser->ub_ptr3 = (void *)(int32)ob->obnr;
		break;
	
	case AUO_TERM:
		Ast_delete(auser->ub_ptr1);
		break;
	
	case AUO_GETBUBBLE:
	case AUO_GETCONTEXT:
		break;
	
	case AUO_SETVAL:
		Ast_delete(auser->ub_ptr1);
		auser->ub_ptr1 = Ast_create(in_out);
		if (auser->ub_ptr1 == NULL)
			auser->ub_ptr1 = Ast_create("");
		break;
	
	case AUO_GETVAL:
		*((char **)in_out) = auser->ub_ptr1;
		break;
	
	case AUO_UPDATE:
	case AUO_FULLUPDATE:
		win = auser->ub_ptr2;
		if (win != NULL)
			win->obchange(win, (int16)(int32)auser->ub_ptr3, -1);
		break;
	
	default:
		return FALSE;
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_radiobutton(PARMBLK *pb)
{
	return A_checkbox(pb);
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_checkbox(PARMBLK *pb)
{
	int16 bar[4];
	int16 pxy[10];
	int16 clip[4];
	int16 x;
	int16 y;
	int16 xradius;
	int16 yradius;
	int16 state;
	int16 dummy;
	CICONBLK *icon;
	int16 len;
	int16 slen;
	int16 key;
	int16 w;
	int16 h;
	int16 xoff;
	int16 yoff;
	AUSERBLK *auser;
	OBJECT *obj;
	AOBJECT *aobj;
	char *str;
	
	if (pb->pb_wc != 0 || pb->pb_hc != 0)
	{
		clip[0] = pb->pb_xc;
		clip[1] = pb->pb_yc;
		clip[2] = pb->pb_xc + pb->pb_wc - 1;
		clip[3] = pb->pb_yc + pb->pb_hc - 1;
		vs_clip(ACSblk->vdi_handle, TRUE, clip);
	} else
	{
		vs_clip(ACSblk->vdi_handle, FALSE, clip);
	}
	obj = pb->pb_tree + pb->pb_obj;
	aobj = (AOBJECT *)obj + 1;
	if (!(obj->ob_flags & OF_LASTOB) && (aobj->ob_flags & AEO))
		key = aobj->key;
	else
		key = 0;
	auser = obj->ob_spec.auserblk;
	str = auser->ub_ptr1;
	if (str != NULL)
		len = (int16)strlen(str);
	else
		len = 0;
	state = pb->pb_prevstate ^ pb->pb_currstate;
	if (len > 0)
	{
		y = ((pb->pb_h - ACSblk->gl_hbox) >> 1) + pb->pb_y;
		if (state == 0)
		{
			vswr_mode(ACSblk->vdi_handle, MD_TRANS);
			vst_rotation(ACSblk->vdi_handle, 0);
			vst_color(ACSblk->vdi_handle, G_BLACK);
			vst_alignment(ACSblk->vdi_handle, TA_LEFT, TA_TOP, &dummy, &dummy);
			vst_font(ACSblk->vdi_handle, ACSblk->fontid);
			vst_height(ACSblk->vdi_handle, ACSblk->fheight, &dummy, &dummy, &dummy, &dummy);
			slen = g_stringLen(str, key, (pb->pb_currstate & OS_DISABLED) && ((ACSblk->description->flags & AB_NO3D) || ACSblk->nplanes > 2));
			if (pb->pb_currstate & OS_DISABLED)
			{
				g_string(pb->pb_x + pb->pb_w - slen, y, str, key, FALSE);
				vswr_mode(ACSblk->vdi_handle, MD_XOR);
				g_string(pb->pb_x + pb->pb_w - slen, y, str, key, FALSE);
				vswr_mode(ACSblk->vdi_handle, MD_TRANS);
			}
			g_string(pb->pb_x + pb->pb_w - slen, y, str, key, (pb->pb_currstate & OS_DISABLED) && ((ACSblk->description->flags & AB_NO3D) || ACSblk->nplanes > 2));
		}
		xoff = (ACSblk->gl_hbox * ACSblk->gl_wattr) / ACSblk->gl_hattr;
		yoff = ACSblk->gl_hbox;
		x = (xoff >> 1) + pb->pb_x;
	} else
	{
		xoff = pb->pb_w;
		yoff = pb->pb_h;
		x = pb->pb_x;
		y = pb->pb_y;
	}

	if ((yoff == 16 && xoff == 16) ||
		(yoff == ACSblk->gl_hbox && len > 0 && yoff >= 15))
	{
		act = NULL;
		if (pb->pb_tree[pb->pb_obj].ob_flags & OF_RBUTTON)
		{
			if ((ACSblk->description->flags & AB_NO3D) || !(pb->pb_parm & ACS_CHECKBOX_3D))
			{
				if (pb->pb_currstate & OS_SELECTED)
				{
					if (pb->pb_currstate & OS_DISABLED)
						icon = &_RD_1D_DS;
					else
						icon = &_RD_1D_S;
				} else
				{
					if (pb->pb_currstate & OS_DISABLED)
						icon = &_RD_1D_DU;
					else
						icon = &_RD_1D_U;
				}
			} else
			{
				if (pb->pb_currstate & OS_SELECTED)
				{
					if (pb->pb_currstate & OS_DISABLED)
					{
						if (ACSblk->nplanes >= 4 && icn_rad_dissel != NULL)
							act = icn_rad_dissel;
						icon = &_RD_3D_DS;
					} else
					{
						if (ACSblk->nplanes >= 4 && icn_rad_sel != NULL)
							act = icn_rad_sel;
						icon = &_RD_3D_S;
					}
				} else
				{
					if (pb->pb_currstate & OS_DISABLED)
					{
#if WITH_FIXES
						if (ACSblk->nplanes >= 4 && icn_rad_disun != NULL)
#else
						if (ACSblk->nplanes >= 4 && icn_rad_dissel != NULL)
#endif
							act = icn_rad_disun;
						icon = &_RD_3D_DU;
					} else
					{
#if WITH_FIXES
						if (ACSblk->nplanes >= 4 && icn_rad_un != NULL)
#else
						if (ACSblk->nplanes >= 4 && icn_rad_sel != NULL)
#endif
							act = icn_rad_un;
						icon = &_RD_3D_U;
					}
				}
			}
		} else
		{
			if ((ACSblk->description->flags & AB_NO3D) || !(pb->pb_parm & ACS_CHECKBOX_3D))
			{
				if (pb->pb_currstate & OS_SELECTED)
				{
					if (pb->pb_currstate & OS_DISABLED)
						icon = &_CHK_1D_DS;
					else
						icon = &_CHK_1D_S;
				} else
				{
					if (pb->pb_currstate & OS_DISABLED)
						icon = &_CHK_1D_DU;
					else
						icon = &_CHK_1D_U;
				}
			} else
			{
				if (pb->pb_currstate & OS_SELECTED)
				{
					if (pb->pb_currstate & OS_DISABLED)
					{
						if (ACSblk->nplanes >= 4 && icn_chk_dissel != NULL)
							act = icn_chk_dissel;
						icon = &_CHK_3D_DS;
					} else
					{
						if (ACSblk->nplanes >= 4 && icn_chk_sel != NULL)
							act = icn_chk_sel;
						icon = &_CHK_3D_S;
					}
				} else
				{
					if (pb->pb_currstate & OS_DISABLED)
					{
						if (ACSblk->nplanes >= 4 && icn_chk_disun != NULL)
							act = icn_chk_disun;
						icon = &_CHK_3D_DU;
					} else
					{
						if (ACSblk->nplanes >= 4 && icn_chk_un != NULL)
							act = icn_chk_un;
						icon = &_CHK_3D_U;
					}
				}
			}
		}

		pxy[0] = 0;
		pxy[1] = 0;
		pxy[2] = 15;
		pxy[3] = 15;
		pxy[4] = pb->pb_x;
		pxy[5] = (pb->pb_h >> 1) + pb->pb_y - 8;
		pxy[6] = pxy[4] + 15;
		pxy[7] = pxy[5] + 15;
		rad.fd_addr = icon->monoblk.ib_pmask;
		rad.fd_r1 = rad.fd_r2 = rad.fd_r3 = 0;
		if (ACSblk->nplanes <= 8)
		{
			vrt_cpyfm(ACSblk->vdi_handle, MD_TRANS, pxy, &rad, &ACSblk->screenMFDB, col2);
		} else
		{
			vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
			vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
			vsf_perimeter(ACSblk->vdi_handle, TRUE);
			vsf_color(ACSblk->vdi_handle, G_WHITE);
			v_bar(ACSblk->vdi_handle, &pxy[4]);
		}

		if (act == NULL || ACSblk->nplanes > 8)
		{
			rad.fd_addr = icon->monoblk.ib_pdata;
			if (ACSblk->nplanes <= 8)
				vrt_cpyfm(ACSblk->vdi_handle, MD_TRANS, pxy, &rad, &ACSblk->screenMFDB, col);
			else
				vrt_cpyfm(ACSblk->vdi_handle, MD_TRANS, pxy, &rad, &ACSblk->screenMFDB, col);
		} else
		{
			if (ACSblk->nplanes <= 8)
				vro_cpyfm(ACSblk->vdi_handle, S_OR_D, pxy, act, &ACSblk->screenMFDB);
			else
				vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, act, &ACSblk->screenMFDB);
		}
	} else
	{
		if (pb->pb_currstate & OS_DISABLED)
		{
			vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
			vsf_interior(ACSblk->vdi_handle, FIS_PATTERN);
			vsf_style(ACSblk->vdi_handle, IP_4PATT);
			vsf_perimeter(ACSblk->vdi_handle, TRUE);
			vsf_color(ACSblk->vdi_handle, G_BLACK);
			if (pb->pb_tree[pb->pb_obj].ob_flags & OF_RBUTTON)
			{
				xradius = (xoff - 2) >> 1;
				if (xradius < 4)
					xradius = 4;
				yradius = (yoff - 2) >> 1;
				if (yradius < 4)
					yradius = 4;
				if (len == 0)
					x += xoff >> 1;
				y += yoff >> 1;
				if (((yoff != 16 || xoff != 16) &&
					 (yoff != ACSblk->gl_hbox || len <= 0 || yoff < 15)) ||
					(ACSblk->description->flags & AB_NO3D) ||
					!(pb->pb_parm & ACS_CHECKBOX_3D))
				{
					xradius -= 2;
					yradius -= 2;
				}
				v_ellipse(ACSblk->vdi_handle, x, y, xradius, yradius);
			} else
			{
				if (len > 0)
				{
					h = ACSblk->gl_hbox - 2;
					if (h < 8)
						h = 8;
					w = (ACSblk->gl_hbox * ACSblk->gl_wattr) / ACSblk->gl_hattr - 4;
					if (w < 8)
						w = 8;
					bar[0] = pb->pb_x + 2;
					bar[1] = ((pb->pb_h - ACSblk->gl_hbox) >> 1) + pb->pb_y;
					bar[2] = bar[0] + w;
					bar[3] = bar[1] + h;
				} else
				{
					h = pb->pb_h - 2;
					if (h < 8)
						h = 8;
					w = pb->pb_w - 2;
					if (w < 8)
						w = 8;
					bar[0] = ((pb->pb_w - w) >> 1) + pb->pb_x;
					bar[1] = ((pb->pb_h - h) >> 1) + pb->pb_y;
					bar[2] = bar[0] + w - 2;
					bar[3] = bar[1] + h - 2;
				}
				if (((yoff == 16 && xoff == 16) ||
					 (yoff == ACSblk->gl_hbox && len > 0 && yoff >= 15)) &&
					!(ACSblk->description->flags & AB_NO3D) &&
					(pb->pb_parm & ACS_CHECKBOX_3D))
				{
					bar[2] += 2;
					bar[3] += 2;
				}
				v_bar(ACSblk->vdi_handle, bar);
			}
		} else
		{
			if (pb->pb_tree[pb->pb_obj].ob_flags & OF_RBUTTON)
			{
				xradius = (xoff - 4) >> 1;
				if (xradius < 4)
					xradius = 4;
				yradius = (yoff - 4) >> 1;
				if (yradius < 4)
					yradius = 4;
				if (len == 0)
					x += xoff >> 1;
				y += yoff >> 1;
				if (state == 0 || (pb->pb_currstate & OS_SELECTED) == 0)
				{
					vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
					vsf_interior(ACSblk->vdi_handle, FIS_HOLLOW);
					vsf_perimeter(ACSblk->vdi_handle, TRUE);
					vsf_color(ACSblk->vdi_handle, G_BLACK);
					if (ACSblk->nplanes > 8)
						vs_color(ACSblk->vdi_handle, G_BLACK, &Avdi_getRGB(G_BLACK)->red);
					v_ellipse(ACSblk->vdi_handle, x, y, xradius, yradius);
				}
				if (pb->pb_currstate & OS_SELECTED)
				{
					vswr_mode(ACSblk->vdi_handle, MD_XOR);
					vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
					vsf_perimeter(ACSblk->vdi_handle, FALSE);
					v_ellipse(ACSblk->vdi_handle, x, y, max(xradius - 3, 2), max(yradius - 3, 2));
				}
			} else
			{
				vsl_type(ACSblk->vdi_handle, LT_SOLID);
				vsl_width(ACSblk->vdi_handle, 1);
				vsl_color(ACSblk->vdi_handle, G_BLACK);
				if (ACSblk->nplanes > 8)
					vs_color(ACSblk->vdi_handle, G_BLACK, &Avdi_getRGB(G_BLACK)->red);
				vsl_ends(ACSblk->vdi_handle, 0, 0);
				if (len > 0)
				{
					h = ACSblk->gl_hbox - 4;
					if (h < 8)
						h = 8;
					w = (ACSblk->gl_hbox * ACSblk->gl_wattr) / ACSblk->gl_hattr - 4;
					if (w < 8)
						w = 8;
					bar[0] = pb->pb_x + 2;
					bar[1] = ((pb->pb_h - h) >> 1) + pb->pb_y;
					bar[2] = bar[0] + w;
					bar[3] = bar[1] + h;
				} else
				{
					h = pb->pb_h - 2;
					if (h < 8)
						h = 8;
					w = pb->pb_w - 2;
					if (w < 8)
						w = 8;
					bar[0] = ((pb->pb_w - w) >> 1) + pb->pb_x;
					bar[1] = ((pb->pb_h - h) >> 1) + pb->pb_y;
					bar[2] = bar[0] + w - 2;
					bar[3] = bar[1] + h - 2;
				}

				if (state == 0 || !(pb->pb_currstate & OS_SELECTED))
				{
					vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
					vsf_interior(ACSblk->vdi_handle, FIS_HOLLOW);
					vsf_perimeter(ACSblk->vdi_handle, TRUE);
					vsf_color(ACSblk->vdi_handle, G_BLACK);
					if (ACSblk->nplanes > 8)
						vs_color(ACSblk->vdi_handle, G_BLACK, &Avdi_getRGB(G_BLACK)->red);
					v_bar(ACSblk->vdi_handle, bar);
				}

				if (pb->pb_currstate & OS_SELECTED)
				{
					vswr_mode(ACSblk->vdi_handle, MD_XOR);
					vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
					v_pline(ACSblk->vdi_handle, 2, bar);
					dummy = bar[0];
					bar[0] = bar[2];
					bar[2] = dummy;
					v_pline(ACSblk->vdi_handle, 2, bar);
					dummy = bar[0] + bar[2];
					if (dummy & 1)
					{
						bar[0] = dummy >> 1;
						bar[2] = bar[0] + 1;
					} else
					{
						bar[0] = bar[2] = dummy >> 1;
					}
					dummy = bar[1] + bar[3];
					if (dummy & 1)
					{
						bar[1] = dummy >> 1;
						bar[3] = bar[1] + 1;
					} else
					{
						bar[1] = bar[3] = dummy >> 1;
					}
					v_pline(ACSblk->vdi_handle, 2, bar);
				}
			}
		}
	}

	vs_clip(ACSblk->vdi_handle, FALSE, clip);
	return pb->pb_currstate & ~(OS_DISABLED | OS_SELECTED);
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_innerframe(PARMBLK *pb)
{
	int16 clip[4];
	int16 pxy[10];
	int16 extent[8];
	int16 i;
	int16 state;
	int16 len;
	int16 key;
	int16 h;
	int16 w;
	int16 x;
	int16 y;
	int16 color;
	int16 pattern;
	boolean dither;
	AUSERBLK *auser;
	OBJECT *obj;
	AOBJECT *aobj;
	char *str;
	int32 *pb_parm;
	
	dither = FALSE;
	if (pb->pb_wc != 0 || pb->pb_hc != 0)
	{
		clip[0] = pb->pb_xc;
		clip[1] = pb->pb_yc;
		clip[2] = pb->pb_xc + pb->pb_wc - 1;
		clip[3] = pb->pb_yc + pb->pb_hc - 1;
		vs_clip(ACSblk->vdi_handle, TRUE, clip);
	} else
	{
		vs_clip(ACSblk->vdi_handle, FALSE, clip);
	}
	clip[0] = (ACSblk->gl_wbox >> 1) + pb->pb_x;
	clip[1] = (ACSblk->gl_hbox >> 1) + pb->pb_y;
	clip[2] = clip[0] + pb->pb_w - 1 - ACSblk->gl_wbox;
	clip[3] = clip[1] + pb->pb_h - 1 - ACSblk->gl_hbox;
	
	pb_parm = &pb->pb_parm;
	state = pb->pb_prevstate ^ pb->pb_currstate;
	
	if (state == 0)
	{
		vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
		vsl_type(ACSblk->vdi_handle, LT_SOLID);
		vsl_width(ACSblk->vdi_handle, 1);
		vsl_ends(ACSblk->vdi_handle, 0, 0);
		pxy[0] = pxy[6] = pxy[8] = clip[0] - 1;
		pxy[1] = pxy[3] = pxy[9] = clip[1] - 1;
		pxy[2] = pxy[4] = clip[2] + 2;
		pxy[5] = pxy[7] = clip[3] + 2;
		if (ACSblk->nplanes >= 4)
		{
			/* inner color */
			color = (int16)((*pb_parm >> 16) & 15);
			vsl_color(ACSblk->vdi_handle, color);
			v_pline(ACSblk->vdi_handle, 5, pxy);
		}
		for (i = 0; i < 10; i++)
			pxy[i] -= 1;
		/* outer color */
		color = (int16)(*pb_parm & 15);
		vsl_color(ACSblk->vdi_handle, color);
		v_pline(ACSblk->vdi_handle, 5, pxy);
		/* fill color */
		color = (int16)((*pb_parm >> 12) & 15);
		pattern = (int16)((*pb_parm >> 9) & 7);
		if (color == G_LWHITE && pattern == IP_SOLID && ACSblk->nplanes < 4)
		{
			pattern = (ACSblk->dither & 0x70) >> 4;
			color = ACSblk->dither & 15;
			dither = TRUE;
		}
		if (ACSblk->description->flags & AB_NO3D)
		{
			color = G_WHITE;
			pattern = IP_HOLLOW;
		}
		if (pattern == IP_HOLLOW)
		{
			vsf_interior(ACSblk->vdi_handle, FIS_HOLLOW);
		} else if (pattern == IP_SOLID)
		{
			vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
		} else
		{
			vsf_interior(ACSblk->vdi_handle, FIS_PATTERN);
			vsf_style(ACSblk->vdi_handle, pattern);
		}
		vsf_color(ACSblk->vdi_handle, color);
		vsf_perimeter(ACSblk->vdi_handle, FALSE);
		v_bar(ACSblk->vdi_handle, clip);
		obj = &pb->pb_tree[pb->pb_obj];
		auser = obj->ob_spec.auserblk;
		str = auser->ub_ptr1;
		if (str != NULL)
		{
			len = (int)strlen(str);
			if (len > 0)
			{
				aobj = (AOBJECT *)obj + 1;
				if (!(obj->ob_flags & OF_LASTOB) && (aobj->ob_flags & AEO))
					key = aobj->key;
				else
					key = 0;
				vst_rotation(ACSblk->vdi_handle, 0);
				vst_effects(ACSblk->vdi_handle, 0);
				/* text color */
				color = (int16)((*pb_parm >> 4) & 15);
				vst_color(ACSblk->vdi_handle, color);
				vst_alignment(ACSblk->vdi_handle, TA_LEFT, TA_TOP, &i, &i);
				if (*pb_parm & ACS_INNER_SMALL)
				{
					vst_font(ACSblk->vdi_handle, ACSblk->fontsid);
					vst_height(ACSblk->vdi_handle, ACSblk->fsheight, &i, &i, &w, &h);
					y = (ACSblk->gl_hbox - h) >> 1;
				} else
				{
					vst_font(ACSblk->vdi_handle, ACSblk->fontid);
					y = 0;
					vst_height(ACSblk->vdi_handle, ACSblk->fheight, &i, &i, &w, &h);
				}
				vqt_extent(ACSblk->vdi_handle, str, extent);
				w = extent[2] - extent[0] + 1;
				
				/* check for alignment */
				switch ((int)((*pb_parm >> 24) & 7))
				{
				case ACS_INNER_POS_TOPMID >> 24:
					x = ((pb->pb_w - w) >> 1) + pb->pb_x;
					y += pb->pb_y;
					break;
				
				case ACS_INNER_POS_TOPRIGHT >> 24:
					x = pb->pb_x + pb->pb_w - w - ACSblk->gl_wbox;
					y += pb->pb_y;
					break;
				
				case ACS_INNER_POS_BOTLEFT >> 24:
					x = pb->pb_x + ACSblk->gl_wbox;
					y += pb->pb_y + pb->pb_h - ACSblk->gl_hbox;
					break;
				
				case ACS_INNER_POS_BOTMID >> 24:
					x = ((pb->pb_w - w) >> 1) + pb->pb_x;
					y += pb->pb_y + pb->pb_h - ACSblk->gl_hbox;
					break;
				
				case ACS_INNER_POS_BOTRIGHT >> 24:
					x = pb->pb_x + pb->pb_w - w - ACSblk->gl_wbox;
					y += pb->pb_y + pb->pb_h - ACSblk->gl_hbox;
					break;
				
				case ACS_INNER_POS_TOPLEFT >> 24:
				default:
					x = pb->pb_x + ACSblk->gl_wbox;
					y += pb->pb_y;
					break;
				}
				extent[2] = x + extent[4] - extent[0];
				extent[3] = y + extent[5] + extent[1] - 1;
				extent[0] = x - 2;
				extent[1] = y;
				v_bar(ACSblk->vdi_handle, extent);
				if (((*pb_parm >> 28) & 1) && dither && (ACSblk->dither & 0x80))
					vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
				else
					vswr_mode(ACSblk->vdi_handle, MD_TRANS);
				g_string(x, y, str, key, FALSE);
			}
		}
	}

	if ((state & OS_SELECTED) || (pb->pb_currstate & OS_SELECTED))
	{
		clip[0] += 1;
		clip[1] += 1;
		clip[2] -= 1;
		clip[3] -= 1;
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
		vsf_color(ACSblk->vdi_handle, G_BLACK);
		vsf_perimeter(ACSblk->vdi_handle, FALSE);
		v_bar(ACSblk->vdi_handle, clip);
	}
	
	vs_clip(ACSblk->vdi_handle, FALSE, clip);
	return pb->pb_currstate & ~(OS_DISABLED | OS_SELECTED);
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_3Dbutton(PARMBLK *pb)
{
	union {
		int32 parm;
		bfobspec spec;
	} parm;
	int16 clip[4];
	int16 pxy[10];
	int16 extent[8];
	int16 w;
	int16 dummy;
	int16 i;
	int16 pattern;
	int16 color;
	int16 textmode;
	int16 state;
	int16 len;
	int16 key;
	int16 framesize;
	int16 offset;
	int16 x;
	int16 y;
	int16 h;
	int16 outcol;
	int16 incol;
	boolean dither;
	int16 no3d;
	int16 dither_config;
	boolean dotted;
	boolean outside;
	AUSERBLK *auser;
	OBJECT *obj;
	AOBJECT *aobj;
	char *str;
	
	if (pb->pb_wc != 0 || pb->pb_hc != 0)
	{
		clip[0] = pb->pb_xc;
		clip[1] = pb->pb_yc;
		clip[2] = pb->pb_wc != 0 ? pb->pb_xc + pb->pb_wc - 1 : pb->pb_xc;
		clip[3] = pb->pb_hc != 0 ? pb->pb_yc + pb->pb_hc - 1 : pb->pb_yc;
		vs_clip(ACSblk->vdi_handle, TRUE, clip);
	} else
	{
		vs_clip(ACSblk->vdi_handle, FALSE, clip);
	}
	
	obj = &pb->pb_tree[pb->pb_obj];
	aobj = (AOBJECT *)obj + 1;
	
	if (!(obj->ob_flags & OF_LASTOB) && (aobj->ob_flags & AEO))
		key = aobj->key;
	else
		key = 0;
	auser = obj->ob_spec.auserblk;
	if ((str = auser->ub_ptr1) == NULL)
		len = 0;
	else
		len = (int)strlen(str);
	parm.parm = pb->pb_parm;
	offset = (int16)((parm.parm >> 20) & 15);
	if (offset > 7)
		offset += -16;
	framesize = parm.spec.framesize & 0x0f;
	if (framesize > 0 && (obj->ob_flags & OF_DEFAULT))
		framesize++;
	
	dither = parm.spec.interiorcol == G_LWHITE && parm.spec.fillpattern == IP_SOLID && ACSblk->nplanes < 4;
	dither_config = ACSblk->dither;
	no3d = ACSblk->description->flags & AB_NO3D;
	outside = no3d != 0 && framesize > 1 && (obj->ob_flags & (OF_EXIT | OF_TOUCHEXIT)) == 0;
	if (outside)
	{
		offset -= 2;
		framesize += 2;
	}
	clip[0] = pb->pb_x - offset;
	clip[1] = pb->pb_y - offset;
	clip[2] = pb->pb_x + pb->pb_w + offset - 1;
	clip[3] = pb->pb_y + pb->pb_h + offset - 1;
	if (clip[2] < clip[0])
		clip[2] = clip[0];
	if (clip[3] < clip[1])
		clip[3] = clip[1];

	state = pb->pb_currstate ^ pb->pb_prevstate;
	if (state == 0)
	{
		if ((parm.parm & ACS_3DBUTTON_NOFILL) == 0)
		{
			vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
			if (dither)
			{
				pattern = (dither_config & 0x70) >> 4;
				color = dither_config & 15;
			} else
			{
				pattern = parm.spec.fillpattern;
				color = parm.spec.interiorcol;
			}
			if (no3d)
				pattern = IP_HOLLOW;
			if (pattern == IP_HOLLOW)
			{
				vsf_interior(ACSblk->vdi_handle, FIS_HOLLOW);
			} else if (pattern == IP_SOLID)
			{
				vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
			} else
			{
				vsf_interior(ACSblk->vdi_handle, FIS_PATTERN);
				vsf_style(ACSblk->vdi_handle, pattern);
			}
			vsf_color(ACSblk->vdi_handle, color);
			vsf_perimeter(ACSblk->vdi_handle, FALSE);
			v_bar(ACSblk->vdi_handle, clip);
		}

		if (len > 0)
		{
			textmode = parm.spec.textmode;
			if (dither)
			{
				if (textmode == 0)
					textmode = (dither_config & 0x80) >> 7;
				if (textmode == 0 && (dither_config & 0x100))
					Ast_toupper(str);
			}
			if (textmode != 0)
				vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
			else
				vswr_mode(ACSblk->vdi_handle, MD_TRANS);
			vst_alignment(ACSblk->vdi_handle, TA_LEFT, TA_TOP, &dummy, &dummy);
			vst_rotation(ACSblk->vdi_handle, 0);
			vst_effects(ACSblk->vdi_handle, TF_NORMAL);
			vst_color(ACSblk->vdi_handle, parm.spec.textcol);
			if ((parm.parm & ACS_3DBUTTON_SMALL) != 0 && (!dither || (ACSblk->dither & 0x100) == 0))
			{
				vst_font(ACSblk->vdi_handle, ACSblk->fontsid);
				vst_height(ACSblk->vdi_handle, ACSblk->fsheight, &dummy, &dummy, &w, &h);
			} else
			{
				vst_font(ACSblk->vdi_handle, ACSblk->fontid);
				vst_height(ACSblk->vdi_handle, ACSblk->fheight, &dummy, &dummy, &w, &h);
			}
			vqt_extent(ACSblk->vdi_handle, str, extent);
			w = extent[2] - extent[0];
			y = ((pb->pb_h - h) >> 1) + pb->pb_y;
			switch ((int)((parm.parm >> 28) & 3))
			{
			case ACS_3DBUTTON_HORPOS_LEFT >> 28:
				x = clip[0];
				break;
			case ACS_3DBUTTON_HORPOS_RIGHT >> 28:
				x = clip[2] - w + 1;
				break;
			/* case ACS_3DBUTTON_HORPOS_CENTER >> 28: */
			default:
				x = ((clip[0] + clip[2] - w) >> 1) + 1;
				break;
			}
			g_string(x, y, str, key, FALSE);
		}
	}
	
	if (no3d)
	{
		outcol = incol = G_BLACK;
	} else
	{
		outcol = parm.spec.framecol;
		incol = parm.spec.character & 15;
	}
	
	if (framesize != 0 && (state == 0 || outcol != incol))
	{
		i = framesize;
		if (i < 0)
			i = -i;
		vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
		vsl_width(ACSblk->vdi_handle, 1);
		vsl_ends(ACSblk->vdi_handle, 0, 0);
		if (pb->pb_currstate & OS_SELECTED)
		{
			if (dither &&
				(((dither_config & 0x400) && incol == G_LBLACK) ||
				 ((dither_config & 0x200) && incol == G_WHITE)))
			{
				vsl_color(ACSblk->vdi_handle, G_BLACK);
				vsl_type(ACSblk->vdi_handle, LT_USERDEF);
				dotted = TRUE;
			} else
			{
				vsl_color(ACSblk->vdi_handle, incol);
				vsl_type(ACSblk->vdi_handle, FIS_SOLID);
				dotted = FALSE;
			}
		} else
		{
			if (dither &&
				(((dither_config & 0x400) && outcol == G_LBLACK) ||
				 ((dither_config & 0x200) && outcol == G_WHITE)))
			{
				vsl_color(ACSblk->vdi_handle, G_BLACK);
				vsl_type(ACSblk->vdi_handle, LT_USERDEF);
				dotted = TRUE;
			} else
			{
				vsl_color(ACSblk->vdi_handle, outcol);
				vsl_type(ACSblk->vdi_handle, FIS_SOLID);
				dotted = FALSE;
			}
		}

		pxy[0] = pxy[2] = clip[0];
		pxy[1] = clip[3];
		pxy[3] = pxy[5] = clip[1];
		pxy[4] = clip[2];
		while (i-- != 0)
		{
			if (outside && i < 2)
				vsl_color(ACSblk->vdi_handle, G_WHITE);
			pxy[0] -= 1;
			pxy[1] += 1;
			pxy[2] -= 1;
			pxy[3] -= 1;
			pxy[4] += 1;
			pxy[5] -= 1;
			if (dotted)
			{
				vsl_udsty(ACSblk->vdi_handle, 0x5555);
				v_pline(ACSblk->vdi_handle, 2, pxy);
				if ((pxy[2] & 1) == 0)
					vsl_udsty(ACSblk->vdi_handle, 0xaaaa);
				v_pline(ACSblk->vdi_handle, 2, &pxy[2]);
			} else
			{
				v_pline(ACSblk->vdi_handle, 3, pxy);
			}
		}
		
		i = framesize;
		if (i < 0)
			i = -i;
		if (pb->pb_currstate & OS_SELECTED)
		{
			if (dither &&
				(((dither_config & 0x400) && outcol == G_LBLACK) ||
				 ((dither_config & 0x200) && outcol == G_WHITE)))
			{
				vsl_color(ACSblk->vdi_handle, G_BLACK);
				vsl_type(ACSblk->vdi_handle, LT_USERDEF);
				dotted = TRUE;
			} else
			{
				vsl_color(ACSblk->vdi_handle, outcol);
				vsl_type(ACSblk->vdi_handle, FIS_SOLID);
				dotted = FALSE;
			}
		} else
		{
			if (dither &&
				(((dither_config & 0x400) && incol == G_LBLACK) ||
				 ((dither_config & 0x200) && incol == G_WHITE)))
			{
				vsl_color(ACSblk->vdi_handle, G_BLACK);
				vsl_type(ACSblk->vdi_handle, LT_USERDEF);
				dotted = TRUE;
			} else
			{
				vsl_color(ACSblk->vdi_handle, incol);
				vsl_type(ACSblk->vdi_handle, FIS_SOLID);
				dotted = FALSE;
			}
		}
		
		pxy[0] = clip[0];
		pxy[3] = pxy[1] = clip[3];
		pxy[5] = clip[1];
		pxy[2] = pxy[4] = clip[2];
		while (i-- != 0)
		{
			if (outside && i < 2)
				vsl_color(ACSblk->vdi_handle, G_WHITE);
			pxy[0] -= 1;
			pxy[1] += 1;
			pxy[2] += 1;
			pxy[3] += 1;
			pxy[4] += 1;
			pxy[5] -= 1;
			if (dotted)
			{
				vsl_udsty(ACSblk->vdi_handle, 0x5555);
				v_pline(ACSblk->vdi_handle, 2, &pxy[2]);
				if ((pxy[2] & 1) != 0)
					vsl_udsty(ACSblk->vdi_handle, 0xaaaa);
				v_pline(ACSblk->vdi_handle, 2, pxy);
			} else
			{
				v_pline(ACSblk->vdi_handle, 3, pxy);
			}
		}
		
		if ((obj->ob_flags & (OF_EXIT | OF_SELECTABLE)) == (OF_EXIT | OF_SELECTABLE) &&
			(obj->ob_state & OS_SHADOWED) == 0)
		{
			vsl_type(ACSblk->vdi_handle, FIS_SOLID);
			vsl_color(ACSblk->vdi_handle, parm.spec.textcol);
			
			pxy[0] -= 1;
			pxy[1] += 1;
			pxy[2] += 1;
			pxy[3] += 1;
			pxy[4] += 1;
			pxy[5] -= 1;
			v_pline(ACSblk->vdi_handle, 3, pxy);
			pxy[2] = pxy[0];
			pxy[3] = pxy[5];
			v_pline(ACSblk->vdi_handle, 3, pxy);
		}
		
	}
	
	if ((framesize == 0 || outcol == incol) &&
		((state & OS_SELECTED) != 0 || (pb->pb_currstate & OS_SELECTED) != 0))
	{
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
		vsf_color(ACSblk->vdi_handle, G_BLACK);
		vsf_perimeter(ACSblk->vdi_handle, FALSE);
		v_bar(ACSblk->vdi_handle, clip);
	}
	
	if ((state & OS_DISABLED) != 0 || (pb->pb_currstate & OS_DISABLED) != 0)
	{
		vswr_mode(ACSblk->vdi_handle, MD_ERASE);
		vsf_interior(ACSblk->vdi_handle, FIS_PATTERN);
		vsf_style(ACSblk->vdi_handle, IP_4PATT);
		vsf_color(ACSblk->vdi_handle, G_WHITE);
		vsf_perimeter(ACSblk->vdi_handle, FALSE);
		v_bar(ACSblk->vdi_handle, clip);
	}
	
	vs_clip(ACSblk->vdi_handle, FALSE, clip);
	return pb->pb_currstate & ~(OS_DISABLED | OS_SELECTED | OS_OUTLINED);
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_title(PARMBLK *pb)
{
	int16 clip[4];
	int16 pxy[8];
	int16 dummy;
	int16 state;
	int16 len;
	int16 key;
	int16 h;
	int16 w;
	int16 x;
	int16 y;
	AUSERBLK *auser;
	OBJECT *obj;
	AOBJECT *aobj;
	char *str;
	
	if (pb->pb_wc != 0 || pb->pb_hc != 0)
	{
		clip[0] = pb->pb_xc;
		clip[1] = pb->pb_yc;
		clip[2] = pb->pb_xc + pb->pb_wc - 1;
		clip[3] = pb->pb_yc + pb->pb_hc - 1;
		vs_clip(ACSblk->vdi_handle, TRUE, clip);
	} else
	{
		vs_clip(ACSblk->vdi_handle, FALSE, clip);
	}
	
	state = pb->pb_prevstate ^ pb->pb_currstate;
	if (state == 0)
	{
		obj = &pb->pb_tree[pb->pb_obj];
		auser = obj->ob_spec.auserblk;
		str = auser->ub_ptr1;
		if (str != NULL)
		{
			len = (int)strlen(str);
			if (len > 0)
			{
				aobj = (AOBJECT *)obj + 1;
				if (!(obj->ob_flags & OF_LASTOB) && (aobj->ob_flags & AEO))
					key = aobj->key;
				else
					key = 0;
				if (pb->pb_parm & ACS_TITLE_TEXTMODE)
					vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
				else
					vswr_mode(ACSblk->vdi_handle, MD_TRANS);
				vst_rotation(ACSblk->vdi_handle, 0);
				vst_effects(ACSblk->vdi_handle, TF_NORMAL);
				vst_color(ACSblk->vdi_handle, G_BLACK);
				vst_alignment(ACSblk->vdi_handle, TA_LEFT, TA_TOP, &dummy, &dummy);
				if (pb->pb_parm & ACS_TITLE_SMALL)
				{
					vst_font(ACSblk->vdi_handle, ACSblk->fontsid);
					vst_height(ACSblk->vdi_handle, ACSblk->fsheight, &dummy, &dummy, &w, &h);
					y = ACSblk->gl_hbox - h;
				} else
				{
					vst_font(ACSblk->vdi_handle, ACSblk->fontid);
					vst_height(ACSblk->vdi_handle, ACSblk->fheight, &dummy, &dummy, &w, &h);
					y = 0;
				}
				vqt_extent(ACSblk->vdi_handle, str, pxy);
				w = pxy[2] - pxy[0] + 1;
				switch ((int)(pb->pb_parm & ACS_TITLE_HORPOS))
				{
				case ACS_TITLE_HORPOS_CENTER:
					x = ((pb->pb_w - w) >> 1) + pb->pb_x;
					break;
				case ACS_TITLE_HORPOS_RIGHT:
					x = pb->pb_x + pb->pb_w - w + 1;
					break;
				/* case ACS_TITLE_HORPOS_LEFT: */
				default:
					x = pb->pb_x;
					break;
				}
				g_string(x, pb->pb_y + y, str, key, FALSE);
			}
		}
		
		vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
		vsl_type(ACSblk->vdi_handle, LT_SOLID);
		vsl_width(ACSblk->vdi_handle, 1);
		vsl_color(ACSblk->vdi_handle, G_BLACK);
		vsl_ends(ACSblk->vdi_handle, 0, 0);
		pxy[0] = pb->pb_x;
		pxy[2] = pb->pb_x + pb->pb_w - 1;
		pxy[1] = pxy[3] = pb->pb_y + pb->pb_h;
		v_pline(ACSblk->vdi_handle, 2, pxy);
	}
	
	vs_clip(ACSblk->vdi_handle, FALSE, clip);
	return pb->pb_currstate & ~(OS_DISABLED);
}
