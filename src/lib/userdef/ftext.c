/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Formatted string                                      */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

typedef struct {
	int16 color;
	char *text; /* unused */
	Awiob self;
} FTEXTDATA;

static FTEXTDATA ftextproto = { G_BLACK, NULL, { NULL, NULL, 0 } };

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 CDECL A_ftext(PARMBLK *pb)
{
	int16 clip[4];
	int16 distances[5];
	int16 feffects[3];
	int16 fontid;
	int16 fheight;
	int16 fwidth;
	int16 dummy;
	int16 effects;
	int16 align;
	AUSERBLK *auser;
	OBJECT *obj;
	int16 numchars;
	int16 len;
	int16 y;
	int16 yend;
	int16 x;
	int16 w;
	int16 fw;
	char *str;
	char *sep;
	char *nextline;
	char *ptr;
	char *lineend;
	char *strend;
	char *ptrend;
	char savec;
	int16 extent[8];
	FTEXTDATA *data;
	
	nextline = NULL;
	obj = &pb->pb_tree[pb->pb_obj];
	auser = obj->ob_spec.auserblk;
	fontid = (int16)(auser->ub_parm >> 16);
	len = (int)strlen(str = auser->ub_ptr1);
	strend = str + len;
	data = auser->ub_ptr2;
	effects = (int16)((auser->ub_parm >> 8) & 0x3f);
	align = (int16)((auser->ub_parm >> 14) & 3);
	yend = pb->pb_y + pb->pb_h - 1;
	
	if (pb->pb_wc == 0 && pb->pb_hc == 0)
	{
		clip[0] = ACSblk->desk.x;
		clip[1] = ACSblk->desk.y;
		clip[2] = ACSblk->desk.w;
#if WITH_FIXES
		clip[3] = ACSblk->desk.h;
#else
		clip[3] = ACSblk->desk.y + ACSblk->desk.h;
#endif
	} else
	{
		clip[0] = pb->pb_xc;
		clip[1] = pb->pb_yc;
		clip[2] = pb->pb_wc;
		clip[3] = pb->pb_hc;
	}
	clip[2] += clip[0] - 1;
	clip[3] += clip[1] - 1;
	if (clip[3] > yend)
		clip[3] = yend;
	if (clip[3] < clip[1])
		return pb->pb_currstate & ~(OS_SELECTED);
	
	vs_clip(ACSblk->vdi_handle, TRUE, clip);
	vswr_mode(ACSblk->vdi_handle, MD_TRANS);
	vst_font(ACSblk->vdi_handle, fontid);
	vst_rotation(ACSblk->vdi_handle, 0);
	vst_effects(ACSblk->vdi_handle, effects);
	y = pb->pb_y;
	if ((fheight = (int16)(auser->ub_parm & 0xff)) == 0)
		fheight = ACSblk->gl_hchar;
	vst_height(ACSblk->vdi_handle, fheight, &dummy, &dummy, &fwidth, &fheight);
	vst_color(ACSblk->vdi_handle, data->color);
	vqt_fontinfo(ACSblk->vdi_handle, &dummy, &dummy, distances, &dummy, feffects);
	fwidth += feffects[0];
	fheight += feffects[0];
	x = pb->pb_x;
	w = pb->pb_w;
	switch (align)
	{
	case (ACS_FTEXT_ALIGN_LEFT >> 14) & 3:
		x += feffects[1];
		vst_alignment(ACSblk->vdi_handle, TA_LEFT, TA_TOP, &dummy, &dummy);
		break;
	case (ACS_FTEXT_ALIGN_CENTER >> 14) & 3:
		x += (pb->pb_w >> 1) + 1;
		vst_alignment(ACSblk->vdi_handle, TA_CENTER, TA_TOP, &dummy, &dummy);
		break;
	case (ACS_FTEXT_ALIGN_RIGHT >> 14) & 3:
		x += pb->pb_w - feffects[2];
		if (effects & TF_OUTLINED)
			x -= 2;
		vst_alignment(ACSblk->vdi_handle, TA_RIGHT, TA_TOP, &dummy, &dummy);
		break;
	case (ACS_FTEXT_ALIGN_BLOCK >> 14) & 3:
		vst_alignment(ACSblk->vdi_handle, TA_LEFT, TA_TOP, &dummy, &dummy);
		break;
	}
	
	fw = w - feffects[1] - feffects[2];
	if (fwidth <= 0)
		fwidth = 1;
	numchars = fw / fwidth;
	if (numchars < 1)
		return pb->pb_currstate & ~(OS_SELECTED);
	
	ptr = str;
	do
	{
		sep = strchr(ptr, '|');
		lineend = ptr + numchars;
		if (sep != NULL && sep < lineend)
		{
			lineend = sep;
			nextline = sep + 1;
		} else
		{
			if (strend > lineend)
			{
				fontid = 0;
				do
				{
					if (sep != NULL && lineend >= sep)
						break;
					savec = *lineend;
					*lineend = '\0';
					vqt_extent(ACSblk->vdi_handle, ptr, extent);
					*lineend = savec;
					if (extent[2] - extent[0] > fw)
					{
						lineend--;
						if (fontid != 0)
							break;
					} else
					{
						lineend++;
						fontid = 1;
					}
					
				} while (lineend <= strend);
			}

			if (sep != lineend && lineend < strend)
			{
				ptrend = lineend;
				while (lineend[-1] != ' ' && lineend > ptr)
					lineend--;
				if (lineend == ptr)
					lineend = ptrend;
			}

			nextline = lineend;
			if (sep != NULL && sep == lineend)
				nextline++;
		}

		while (*ptr == ' ' && ptr < lineend)
			ptr++;
		while (lineend[-1] == ' ' && lineend > ptr)
			lineend--;
		savec = *lineend;
		*lineend = '\0';
		if (align == ((ACS_FTEXT_ALIGN_BLOCK >> 14) & 3))
			v_justified(ACSblk->vdi_handle, x, y, ptr, w, 1, 0);
		else
			v_gtext(ACSblk->vdi_handle, x, y, ptr);
		*lineend = savec;
		ptr = nextline;
		y += fheight;
	} while (y < yend && ptr < strend);
	
	vs_clip(ACSblk->vdi_handle, FALSE, clip);
	return pb->pb_currstate & ~(OS_SELECTED);
}

/* -------------------------------------------------------------------------- */

boolean Auo_ftext(OBJECT *entry, int16 task, void *in_out)
{
	AUSERBLK *auser;
	Awiob *ob;
	Awindow *win;
	FTEXTDATA *data;
	int32 val;
	
	auser = entry->ob_spec.auserblk;
	data = auser->ub_ptr2;
	
	switch (task)
	{
	case AUO_CREATE:
		if (auser->ub_ptr1 != NULL)
			auser->ub_ptr1 = Ast_create(auser->ub_ptr1);
		if (auser->ub_ptr1 == NULL)
			auser->ub_ptr1 = Ast_create("");
		if ((data = Ax_malloc(sizeof(*data))) == NULL)
			return FALSE;
		memcpy(data, &ftextproto, sizeof(*data));
		auser->ub_ptr2 = data;
		break;

	case AUO_TERM:
		Ast_delete(auser->ub_ptr1);
		Ax_free(data);
		break;
	
	case AUO_SELF:
		ob = in_out;
		data->self.window = ob->window;
		data->self.entry = ob->entry;
		data->self.obnr = ob->obnr;
		break;
	
	case AUO_OWNER:
		ob = in_out;
		ob->window = data->self.window;
		ob->entry = data->self.entry;
		ob->obnr = data->self.obnr;
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
		if ((win = data->self.window) != NULL)
			win->obchange(win, data->self.obnr, -1);
		break;
	
	case AUO_FTFONT:
		val = *((int16 *)in_out);
		auser->ub_parm = (auser->ub_parm & ~ACS_FTEXT_FONTID) | (val << 16);
		break;
	
	case AUO_FTHEIGHT:
		val = *((int16 *)in_out);
		if (val > 255)
			val = 255;
		auser->ub_parm = (auser->ub_parm & ~ACS_FTEXT_FONTSIZE) | (val);
		break;
	
	case AUO_FTCOLOR:
		data->color = *((int16 *)in_out);
		break;
	
	case AUO_FTEFFECTS:
		val = *((int16 *)in_out) & 0x3fL;
		auser->ub_parm = (auser->ub_parm & ~(0x3f << 8)) | (val << 8);
		break;
	
	case AUO_FTLEFT:
		auser->ub_parm = (auser->ub_parm & ~ACS_FTEXT_ALIGNMENT) | ACS_FTEXT_ALIGN_LEFT;
		break;
	
	case AUO_FTRIGHT:
#if WITH_FIXES
		auser->ub_parm = (auser->ub_parm & ~ACS_FTEXT_ALIGNMENT) | ACS_FTEXT_ALIGN_RIGHT;
#else
		auser->ub_parm = (auser->ub_parm & ~ACS_FTEXT_ALIGNMENT) | (int16)ACS_FTEXT_ALIGN_RIGHT; /* BUG: sign-extended, will trash fontid */
#endif
		break;
	
	case AUO_FTCENTER:
		auser->ub_parm = (auser->ub_parm & ~ACS_FTEXT_ALIGNMENT) | ACS_FTEXT_ALIGN_CENTER;
		break;
	
	case AUO_FTBLOCK:
#if WITH_FIXES
		auser->ub_parm = (auser->ub_parm & ~ACS_FTEXT_ALIGNMENT) | ACS_FTEXT_ALIGN_BLOCK;
#else
		auser->ub_parm = (auser->ub_parm & ~ACS_FTEXT_ALIGNMENT) | (int16)ACS_FTEXT_ALIGN_BLOCK; /* BUG: sign-extended, will trash fontid */
#endif
		break;
	
	case AUO_GETBUBBLE:
	case AUO_GETCONTEXT:
		break;
	
	default:
		return FALSE;
	}
	
	return TRUE;
}


