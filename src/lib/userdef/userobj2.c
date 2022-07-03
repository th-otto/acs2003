/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      More User-defined objects                             */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

static int16 quer[] = {
	0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
	0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff
};
static int16 quer2[] = {
	0x0000, 0xffff, 0x0000, 0x0000, 0xffff, 0x0000, 0x0000, 0xffff,
	0x0000, 0x0000, 0xffff, 0x0000, 0x0000, 0xffff, 0x0000, 0x0000
};
static int16 quer3[] = {
	0x0000, 0x0000, 0xffff, 0xffff, 0x0000, 0x0000, 0xffff, 0xffff,
	0x0000, 0x0000, 0xffff, 0xffff, 0x0000, 0x0000, 0xffff, 0xffff
};
static int16 senk[] = {
	0x5555, 0x5555, 0x5555, 0x5555, 0x5555, 0x5555, 0x5555, 0x5555,
	0x5555, 0x5555, 0x5555, 0x5555, 0x5555, 0x5555, 0x5555, 0x5555
};
static int16 senk2[] = {
	0x4444, 0x4444, 0x4444, 0x4444, 0x4444, 0x4444, 0x4444, 0x4444,
	0x4444, 0x4444, 0x4444, 0x4444, 0x4444, 0x4444, 0x4444, 0x4444
};
static int16 senk3[] = {
	0x3333, 0x3333, 0x3333, 0x3333, 0x3333, 0x3333, 0x3333, 0x3333,
	0x3333, 0x3333, 0x3333, 0x3333, 0x3333, 0x3333, 0x3333, 0x3333
};
static int16 *up[] = {
	quer, quer, quer2, quer3,
	senk, senk2, senk3, quer,
	quer, quer, quer, quer,
	quer, quer, quer, quer,
	quer, quer, quer, quer,
	quer, quer, quer, quer,
	quer, quer, quer, quer,
	quer, quer, quer, quer
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 CDECL A_pattern(PARMBLK *pb)
{
	int16 pxy[4];
	int16 state;
	union {
		int32 parm;
		struct {
			unsigned int res0: 8;
			signed int framesize: 8;
			unsigned int res1: 12;
			unsigned int color: 4;
		} spec;
	} parm;
	
	if (pb->pb_wc != 0 || pb->pb_hc != 0)
	{
		pxy[0] = pb->pb_xc;
		pxy[1] = pb->pb_yc;
		pxy[2] = pb->pb_xc + pb->pb_wc - 1;
		pxy[3] = pb->pb_yc + pb->pb_hc - 1;
		vs_clip(ACSblk->vdi_handle, TRUE, pxy);
	} else
	{
		vs_clip(ACSblk->vdi_handle, FALSE, pxy);
	}
	
	pxy[0] = pb->pb_x;
	pxy[1] = pb->pb_y;
	pxy[2] = pxy[0] + pb->pb_w - 1;
	pxy[3] = pxy[1] + pb->pb_h - 1;

	parm.parm = pb->pb_parm;
	state = pb->pb_prevstate ^ pb->pb_currstate;
	
	if (state == 0)
	{
		vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
		switch (parm.spec.framesize & 0xc0)
		{
		case 0:
			vsf_interior(ACSblk->vdi_handle, FIS_HATCH);
			vsf_style(ACSblk->vdi_handle, parm.spec.framesize & 0x1f);
			break;
		case 0x40:
			vsf_interior(ACSblk->vdi_handle, FIS_PATTERN);
			vsf_style(ACSblk->vdi_handle, parm.spec.framesize & 0x1f);
			break;
		default:
			vsf_interior(ACSblk->vdi_handle, FIS_USER);
			vsf_udpat(ACSblk->vdi_handle, up[parm.spec.framesize & 0x1f], 1);
			break;
		}
		vsf_color(ACSblk->vdi_handle, parm.spec.color);
		vsf_perimeter(ACSblk->vdi_handle, (parm.spec.framesize & 0x20) != 0);
		v_bar(ACSblk->vdi_handle, pxy);
	}
	
	if ((state & OS_SELECTED) || (pb->pb_currstate & OS_SELECTED))
	{
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
		vsf_color(ACSblk->vdi_handle, G_BLACK);
		vsf_perimeter(ACSblk->vdi_handle, FALSE);
		v_bar(ACSblk->vdi_handle, pxy);
	}
	
	vs_clip(ACSblk->vdi_handle, FALSE, pxy);
	return pb->pb_currstate & ~(OS_SELECTED);
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_arrows(PARMBLK *pb)
{
	int16 pxy[4];
	int16 style;
	int32 *parm;
	int16 h;
	int16 w;
	int16 y;
	int16 x;
	int16 fat;
	
	if (pb->pb_wc != 0 || pb->pb_hc != 0)
	{
		pxy[0] = pb->pb_xc;
		pxy[1] = pb->pb_yc;
		pxy[2] = pb->pb_xc + pb->pb_wc - 1;
		pxy[3] = pb->pb_yc + pb->pb_hc - 1;
		vs_clip(ACSblk->vdi_handle, TRUE, pxy);
	} else
	{
		vs_clip(ACSblk->vdi_handle, FALSE, pxy);
	}
	
	parm = &pb->pb_parm;
	if (((*parm >> 19) & 1) != 0)
		fat = 1;
	else
		fat = 0;
	if (pb->pb_prevstate == pb->pb_currstate)
	{
		vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
		w = pb->pb_w >> 1;
		h = pb->pb_h >> 1;
		x = ACSblk->gl_wbox >> 1;
		y = ACSblk->gl_hbox >> 1;
		pxy[0] = pxy[2] = pb->pb_x;
		pxy[1] = pxy[3] = pb->pb_y;

		/* start style */
		switch ((int)((*parm >> 24) & ((ACS_ARROW_DIR_START | ACS_ARROW_LEN_START) >> 24)))
		{
		case 0:
			pxy[0] += w;
			pxy[1] += fat;
			break;
		case 1:
			pxy[0] += fat;
			pxy[1] += fat;
			break;
		case 2:
			pxy[0] += fat;
			pxy[1] += h;
			break;
		case 3:
			pxy[0] += fat;
			pxy[1] += pb->pb_h - 1 - fat;
			break;
		case 4:
			pxy[1] += y;
			pxy[0] += w;
			break;
		case 5:
			pxy[0] += x;
			pxy[1] += y;
			break;
		case 6:
			pxy[0] += x;
			pxy[1] += h;
			break;
		case 7:
			pxy[0] += x;
			pxy[1] += pb->pb_h - y;
			break;
		}

		/* end style */
		switch ((int)((*parm >> 28) & ((ACS_ARROW_DIR_END | ACS_ARROW_LEN_END) >> 28)))
		{
		case 0:
			pxy[2] += w;
			pxy[3] += pb->pb_h - 1 - fat;
			break;
		case 1:
			pxy[2] += pb->pb_w - 1 - fat;
			pxy[3] += pb->pb_h - 1 - fat;
			break;
		case 2:
			pxy[2] += pb->pb_w - 1 - fat;
			pxy[3] += h;
			break;
		case 3:
			pxy[2] += pb->pb_w - 1 - fat;
			pxy[3] += fat;
			break;
		case 4:
			pxy[2] += w;
			pxy[3] += pb->pb_h - y;
			break;
		case 5:
			pxy[2] += pb->pb_w - x;
			pxy[3] += pb->pb_h - y;
			break;
		case 6:
			pxy[2] += pb->pb_w - x;
			pxy[3] += h;
			break;
		case 7:
			pxy[2] += pb->pb_w - x;
			pxy[3] += y;
			break;
		}
		if (fat)
			vsl_width(ACSblk->vdi_handle, 3);
		else
			vsl_width(ACSblk->vdi_handle, 1);
		style = (int)((*parm >> 16) & 7);
		if (style == LT_USERDEF)
			vsl_udsty(ACSblk->vdi_handle, 0x5555);
		vsl_type(ACSblk->vdi_handle, style);
		vsl_ends(ACSblk->vdi_handle, (int)((*parm >> 20) & 3), (int)((*parm >> 22) & 3));
		if ((*parm & ACS_ARROW_3D) && (ACSblk->description->flags & AB_NO3D) == 0)
		{
			pxy[0] += 1;
			pxy[2] += 1;
			pxy[1] += 1;
			pxy[3] += 1;
			vsl_color(ACSblk->vdi_handle, G_WHITE);
			v_pline(ACSblk->vdi_handle, 2, pxy);
			pxy[0] -= 1;
			pxy[2] -= 1;
			pxy[1] -= 1;
			pxy[3] -= 1;
		}
		vsl_color(ACSblk->vdi_handle, (int)(*parm & ACS_ARROW_COLOR));
		v_pline(ACSblk->vdi_handle, 2, pxy);
	}
	
	if ((pb->pb_prevstate & OS_SELECTED) || (pb->pb_currstate & OS_SELECTED))
	{
		pxy[0] = pb->pb_xc + 1;
		pxy[1] = pb->pb_yc + 1;
		pxy[2] = pb->pb_xc + pb->pb_wc - 2;
		pxy[3] = pb->pb_yc + pb->pb_hc - 2;
		vs_clip(ACSblk->vdi_handle, TRUE, pxy);
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
		vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
		vsf_color(ACSblk->vdi_handle, G_BLACK);
		vsf_perimeter(ACSblk->vdi_handle, FALSE);
		v_bar(ACSblk->vdi_handle, pxy);
	}
	vsl_ends(ACSblk->vdi_handle, 0, 0);
	vs_clip(ACSblk->vdi_handle, FALSE, pxy);
	if (fat > 0)
		return pb->pb_currstate & ~(OS_SELECTED);
	else
		return pb->pb_currstate & ~(OS_SELECTED | OS_DISABLED);
}


/* -------------------------------------------------------------------------- */

int16 CDECL A_select(PARMBLK *pb)
{
	int16 clip[4];
	int16 pxy[10];
	int16 state;
	
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
		vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
	else
		vswr_mode(ACSblk->vdi_handle, MD_XOR);
	if ((pb->pb_prevstate & OS_SELECTED) || (pb->pb_currstate & OS_SELECTED))
	{
		vsl_width(ACSblk->vdi_handle, 1);
		vsl_color(ACSblk->vdi_handle, G_BLACK);
		vsl_ends(ACSblk->vdi_handle, 0, 0);
		vsl_type(ACSblk->vdi_handle, LT_SOLID);
		pxy[0] = pxy[6] = pxy[8] = pb->pb_x;
		pxy[1] = pxy[3] = pxy[9] = pb->pb_y;
		pxy[2] = pxy[4] = pb->pb_x + pb->pb_w - 1;
		pxy[5] = pxy[7] = pb->pb_y + pb->pb_h - 1;
		v_pline(ACSblk->vdi_handle, 5, pxy);
	}
	
	vs_clip(ACSblk->vdi_handle, FALSE, clip);
	return pb->pb_currstate & ~(OS_SELECTED);
}
