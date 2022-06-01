/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Handle slider objects                                 */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "acsplus.h"

#define ACS_SLIDER_DIRTY         0x0001
#define ACS_SLIDER_UPTODATE      0x0002
#define ACS_SLIDER_UPDATE_LEFT   0x0004
#define ACS_SLIDER_UPDATE_POS    0x0008
#define ACS_SLIDER_UPDATE_OLEFT  0x0010
#define ACS_SLIDER_UPDATE_ORIGHT 0x0020
#define ACS_SLIDER_FULLUPDATE    0x0040
#define ACS_SLIDER_UPDATE_BAR    0x0080

typedef struct {
	int32 full;
	int32 size;
	int32 pos;
	int32 step;
	int16 len;
	char text[12];
	SLLIVE live;
	int16 flags;
	int16 left;
	int16 bar;
	int16 right;
	int16 oleft;
	int16 oright;
	int16 obar;
	int32 opos;
	int32 omax;
	Awiob self;
	int16 width;
	int16 height;
} ADT_SLIDER;

static char *printval(void *obj, long pos);

static ADT_SLIDER proto = {
	20, /* full */
	4,  /* size */
	3, /* pos */
	1, /* step */
	2, /* len */
	"3", /* text */
	{ printval, NULL }, /* live */
	ACS_SLIDER_DIRTY, /* flags */
	0, /* left */
	0, /* bar */
	0, /* right */
	0, /* oleft */
	0, /* oright */
	0, /* obar */
	0, /* opos */
	0, /* omax */
	{ NULL, NULL, 0 }, /* self */
	0, /* width */
	0 /* height */
};

static void sl_calc(OBJECT *obj);

static char text[12];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void dr_3dbut(int16 *pxy, boolean flag)
{
	int16 pxy2[6];
	
	if (ACSblk->nplanes >= 4)
	{
		if (flag)
			vsf_color(ACSblk->vdi_handle, G_LWHITE);
		else
			vsf_color(ACSblk->vdi_handle, G_LBLACK);
		vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
	} else
	{
		if (flag)
			vsf_color(ACSblk->vdi_handle, G_WHITE);
		else
			vsf_color(ACSblk->vdi_handle, G_BLACK);
	}
	
	v_bar(ACSblk->vdi_handle, pxy);
	pxy2[0] = pxy2[2] = pxy[0];
	pxy2[1] = pxy[3];
	pxy2[3] = pxy2[5] = pxy[1];
	pxy2[4] = pxy[2];
	vsl_color(ACSblk->vdi_handle, G_BLACK);
	v_pline(ACSblk->vdi_handle, 3, pxy2);
	pxy2[2] = pxy[2];
	pxy2[3] = pxy[3];
	v_pline(ACSblk->vdi_handle, 3, pxy2);
	if (flag)
	{
		pxy2[2] = pxy[0] + 1;
		pxy2[3] = pxy[1] + 1;
		pxy2[0] += 1;
		pxy2[1] -= 1;
		pxy2[4] -= 1;
		pxy2[5] += 1;
		if (ACSblk->nplanes >= 4)
		{
			vsl_color(ACSblk->vdi_handle, G_WHITE);
			v_pline(ACSblk->vdi_handle, 3, pxy2);
		}
		pxy2[2] = pxy[2] - 1;
		pxy2[3] = pxy[3] - 1;
		vsl_color(ACSblk->vdi_handle, G_LBLACK);
		v_pline(ACSblk->vdi_handle, 3, pxy2);
	}
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_slider(PARMBLK *pb)
{
	OBJECT *obj;
	AUSERBLK *auser;
	int16 pxy[6];
	int16 clip[4];
	int16 dummy;
	int16 w;
	int16 x;
	int16 y;
	ADT_SLIDER *slider;
	boolean needupdate;
	boolean horizontal;
	boolean draw3d;
	
	obj = &pb->pb_tree[pb->pb_obj];
	auser = obj->ob_spec.auserblk;
	slider = auser->ub_ptr1;
	if ((slider->flags & ACS_SLIDER_DIRTY) ||
		obj->ob_width != slider->width ||
		obj->ob_height != slider->height)
	{
		sl_calc(obj);
	}
	needupdate = !(slider->flags & ACS_SLIDER_UPTODATE);
	horizontal = !(auser->ub_parm & AUO_SLIDER_VERTICAL);
	if ((auser->ub_parm & AUO_SLIDER_3D) == AUO_SLIDER_3D && !(ACSblk->description->flags & AB_NO3D))
		draw3d = TRUE;
	else
		draw3d = FALSE;
	clip[2] = pb->pb_wc;
	clip[3] = pb->pb_hc;
	if (clip[2] != 0 || clip[3] != 0)
	{
		clip[0] = pb->pb_xc;
		clip[1] = pb->pb_yc;
		clip[2] += clip[0] - 1;
		clip[3] += clip[1] - 1;
		vs_clip(ACSblk->vdi_handle, TRUE, clip);
	}
	
	vst_font(ACSblk->vdi_handle, ACSblk->fontid);
	vst_color(ACSblk->vdi_handle, G_BLACK);
	vst_rotation(ACSblk->vdi_handle, 0);
	vst_alignment(ACSblk->vdi_handle, TA_LEFT, TA_TOP, &dummy, &dummy);
	vst_height(ACSblk->vdi_handle, ACSblk->fheight, &dummy, &dummy, &dummy, &dummy);
	vsl_width(ACSblk->vdi_handle, 1);
	
	if (horizontal)
	{
		w = ACSblk->gl_wbox * 2;
		y = ((pb->pb_h - ACSblk->gl_hbox) >> 1) + pb->pb_y;
		pxy[3] = pxy[1] = pb->pb_y;
		pxy[3] += pb->pb_h - 1;
	} else
	{
		w = ACSblk->gl_hbox;
		y = ((pb->pb_w - ACSblk->gl_wbox) >> 1) + pb->pb_x;
		pxy[2] = pxy[0] = pb->pb_x;
		pxy[2] += pb->pb_w - 1;
	}
	vsl_type(ACSblk->vdi_handle, LT_SOLID);
	if (needupdate || (slider->flags & ACS_SLIDER_UPDATE_LEFT))
	{
		if (horizontal)
		{
			pxy[2] = pxy[0] = pb->pb_x;
			pxy[2] += w;
		} else
		{
			pxy[3] = pxy[1] = pb->pb_y;
			pxy[3] += w;
		}
		vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
		vsf_perimeter(ACSblk->vdi_handle, TRUE);
		vsf_interior(ACSblk->vdi_handle, FIS_HOLLOW);
		vsf_color(ACSblk->vdi_handle, G_BLACK);
		if (draw3d)
			dr_3dbut(pxy, slider->pos != 0 && !(pb->pb_currstate & OS_DISABLED));
		else
			v_bar(ACSblk->vdi_handle, pxy);
		vswr_mode(ACSblk->vdi_handle, MD_TRANS);
		if (slider->pos == 0)
			vst_effects(ACSblk->vdi_handle, TF_LIGHTENED);
		else
			vst_effects(ACSblk->vdi_handle, TF_NORMAL);
		if (horizontal)
			v_gtext(ACSblk->vdi_handle, (ACSblk->gl_wbox >> 1) + pxy[0] + 1, y, "\004");
		else
			v_gtext(ACSblk->vdi_handle, y, pxy[1], "\001");
	}
	
	if (needupdate || (slider->flags & ACS_SLIDER_UPDATE_POS))
	{
		if (horizontal)
		{
			pxy[2] = pxy[0] = pb->pb_x + pb->pb_w - 1;
			pxy[0] -= w;
		} else
		{
			pxy[3] = pxy[1] = pb->pb_y + pb->pb_h - 1;
			pxy[1] -= w;
		}
		vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
		vsf_perimeter(ACSblk->vdi_handle, TRUE);
		vsf_interior(ACSblk->vdi_handle, FIS_HOLLOW);
		vsf_color(ACSblk->vdi_handle, G_BLACK);
		if (draw3d)
			dr_3dbut(pxy, slider->pos + slider->size != slider->full && !(pb->pb_currstate & OS_DISABLED));
		else
			v_bar(ACSblk->vdi_handle, pxy);
		vswr_mode(ACSblk->vdi_handle, MD_TRANS);
		if (slider->pos + slider->size == slider->full)
			vst_effects(ACSblk->vdi_handle, TF_LIGHTENED);
		else
			vst_effects(ACSblk->vdi_handle, TF_NORMAL);
		if (horizontal)
			v_gtext(ACSblk->vdi_handle, (ACSblk->gl_wbox >> 1) + pxy[0] + 1, y, "\003");
		else
			v_gtext(ACSblk->vdi_handle, y, pxy[1], "\002");
			
	}
	
	vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
	vsf_perimeter(ACSblk->vdi_handle, TRUE);
	vsf_interior(ACSblk->vdi_handle, FIS_PATTERN);
	vsf_style(ACSblk->vdi_handle, 1);
	vsf_color(ACSblk->vdi_handle, G_BLACK);

	if (!(auser->ub_parm & AUO_SLIDER_NOSLIDER))
	{
		if (slider->left != 0 && (needupdate || (slider->flags & ACS_SLIDER_UPDATE_OLEFT)))
		{
			if (horizontal)
			{
				x = pb->pb_x + w;
				pxy[2] = pxy[0] = x;
				pxy[2] += slider->left;
			} else
			{
				x = pb->pb_y + w;
				pxy[3] = pxy[1] = x;
				pxy[3] += slider->left;
			}
			x += slider->oleft;
			if (needupdate)
			{
				if (draw3d)
					dr_3dbut(pxy, FALSE);
				else
					v_bar(ACSblk->vdi_handle, pxy);
			} else
			{
				if (horizontal)
				{
					if (clip[2] >= x)
					{
						if (clip[0] < x)
							clip[0] = x;
						vs_clip(ACSblk->vdi_handle, TRUE, clip);
						if (draw3d)
							dr_3dbut(pxy, FALSE);
						else
							v_bar(ACSblk->vdi_handle, pxy);
					}
				} else
				{
					if (clip[3] >= x)
					{
						if (clip[1] < x)
							clip[1] = x;
						vs_clip(ACSblk->vdi_handle, TRUE, clip);
						if (draw3d)
							dr_3dbut(pxy, FALSE);
						else
							v_bar(ACSblk->vdi_handle, pxy);
					}
				}
			}
		}
	}

	if (!(auser->ub_parm & AUO_SLIDER_NOSLIDER))
	{
		if (slider->right != 0 && (needupdate || (slider->flags & ACS_SLIDER_UPDATE_ORIGHT)))
		{
			if (horizontal)
			{
				x = pb->pb_x + pb->pb_w - w - 1;
				pxy[2] = pxy[0] = x;
				pxy[0] -= slider->right;
			} else
			{
				x = pb->pb_y + pb->pb_h - w - 1;
				pxy[3] = pxy[1] = x;
				pxy[1] -= slider->right;
			}
			x -= slider->oright;
			if (needupdate)
			{
				if (draw3d)
					dr_3dbut(pxy, FALSE);
				else
					v_bar(ACSblk->vdi_handle, pxy);
			} else
			{
				if (horizontal)
				{
					if (clip[0] <= x)
					{
						if (clip[2] > x)
							clip[2] = x;
						vs_clip(ACSblk->vdi_handle, TRUE, clip);
						if (draw3d)
							dr_3dbut(pxy, FALSE);
						else
							v_bar(ACSblk->vdi_handle, pxy);
					}
				} else
				{
					if (clip[1] <= x)
					{
						if (clip[3] > x)
							clip[3] = x;
						vs_clip(ACSblk->vdi_handle, TRUE, clip);
						if (draw3d)
							dr_3dbut(pxy, FALSE);
						else
							v_bar(ACSblk->vdi_handle, pxy);
					}
				}
			}
		}
	}

	if (!(auser->ub_parm & AUO_SLIDER_NOSLIDER))
	{
		if (horizontal)
		{
			pxy[2] = pxy[0] = pb->pb_x + w + slider->left;
			pxy[2] += slider->bar - 1;
		} else
		{
			pxy[3] = pxy[1] = pb->pb_y + w + slider->left;
			pxy[3] += slider->bar - 1;
		}
		vsf_perimeter(ACSblk->vdi_handle, TRUE);
		vsf_interior(ACSblk->vdi_handle, FIS_HOLLOW);
		vsf_color(ACSblk->vdi_handle, G_BLACK);
		if (draw3d)
			dr_3dbut(pxy, !(pb->pb_currstate & OS_DISABLED) && slider->size != slider->full);
		else
			v_bar(ACSblk->vdi_handle, pxy);
		if (slider->text[0] != '\0')
		{
			vswr_mode(ACSblk->vdi_handle, MD_TRANS);
			vst_effects(ACSblk->vdi_handle, TF_NORMAL);
			if (horizontal)
			{
				x = (slider->bar - (int)(strlen(slider->text) * ACSblk->gl_wbox)) >> 1; /* FIXME: misplaced cast */
				v_gtext(ACSblk->vdi_handle, pxy[0] + x, y, slider->text);
			} else
			{
				x = (pb->pb_w - (int)(strlen(slider->text) * ACSblk->gl_wbox)) >> 1; /* FIXME: misplaced cast */
				v_gtext(ACSblk->vdi_handle, pxy[0] + x, ((slider->bar - ACSblk->gl_hbox) >> 1) + pxy[1], slider->text);
			}
		}
	}

	if (needupdate && (obj->ob_state & OS_SHADOWED))
	{
		pxy[0] = pb->pb_x + 1;
		pxy[5] = pb->pb_y + 1;
		pxy[3] = pxy[1] = pb->pb_y + pb->pb_h;
		pxy[4] = pxy[2] = pb->pb_x + pb->pb_w;
		vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
		vsl_color(ACSblk->vdi_handle, G_BLACK);
		vsl_ends(ACSblk->vdi_handle, 0, 0);
		vsl_width(ACSblk->vdi_handle, 1);
		vsl_type(ACSblk->vdi_handle, LT_SOLID);
		v_pline(ACSblk->vdi_handle, 3, pxy);
	}
	
	vs_clip(ACSblk->vdi_handle, FALSE, clip);
	
	return pb->pb_currstate & ~(OS_DISABLED | OS_SELECTED);
}

/* -------------------------------------------------------------------------- */

static void sl_calc(OBJECT *obj)
{
	AUSERBLK *auser;
	ADT_SLIDER *slider;
	int16 box;
	int16 size;
	int16 width;
	
	auser = obj->ob_spec.auserblk;
	slider = auser->ub_ptr1;
	if (auser->ub_parm & AUO_SLIDER_VERTICAL)
	{
		box = ACSblk->gl_hbox;
		width = size = obj->ob_height - 2 * ACSblk->gl_hbox;
	} else
	{
		box = ACSblk->gl_wbox * slider->len;
		width = size = obj->ob_width - 4 * ACSblk->gl_wbox;
	}
	slider->bar = (int16)((slider->size * size) / slider->full);
	if (slider->bar < box)
	{
		width = size + slider->bar - box - 1;
		slider->bar = box;
	}
	
	slider->left = (int16)((slider->pos * width + (slider->full >> 1)) / slider->full);
	slider->right = size - slider->bar - slider->left;
	if (slider->right < 0 || slider->pos + slider-> size == slider->full)
	{
		slider->left += slider->right;
		slider->right = 0;
	}
	slider->width = obj->ob_width;
	slider->height = obj->ob_height;
	slider->flags &= ~ACS_SLIDER_DIRTY;
}

/* -------------------------------------------------------------------------- */

int16 Auo_slider(OBJECT *entry, int16 task, void *in_out)
{
	AUSERBLK *auser;
	ADT_SLIDER *slider;
	Awindow *win;
	int32 pos;
	Awiob *ob;
	
	auser = entry->ob_spec.auserblk;
	slider = auser->ub_ptr1;
	switch (task)
	{
	case AUO_CREATE:
		slider = Ax_malloc(sizeof(*slider));
		if (slider != NULL)
		{
			memcpy(slider, &proto, sizeof(*slider));
			auser->ub_ptr1 = slider;
		} else
		{
			*((int16 *)in_out) = FAIL;
		}
		break;
	
	case AUO_TERM:
		Ax_free(slider);
		break;
	
	case AUO_SETVAL:
		strncpy(slider->text, in_out, sizeof(slider->text) - 1);
		slider->text[slider->len] = '\0';
		break;
	
	case AUO_GETVAL:
		*((char **)in_out) = slider->text;
		break;
	
	case AUO_SELF:
		{
			ob = (Awiob *)in_out;
			slider->self.window = ob->window;
			slider->self.entry = ob->entry;
			slider->self.obnr = ob->obnr;
		}
		break;
	
	case AUO_OWNER:
		{
			ob = (Awiob *)in_out;
			ob->window = slider->self.window;
			ob->entry = slider->self.entry;
			ob->obnr = slider->self.obnr;
		}
		break;
	
	case AUO_FULLUPDATE:
		slider->flags |= ACS_SLIDER_FULLUPDATE;
		/* fall through */
	
	case AUO_UPDATE:
		win = slider->self.window;
		if (win != NULL)
		{
			if (slider->pos < 0)
				slider->pos = 0;
			pos = slider->full - slider->size;
			if (pos < slider->pos)
				slider->pos = pos;
			sl_calc(entry);
			if ((slider->opos == 0) ^ (slider->pos == 0))
				slider->flags |= ACS_SLIDER_UPDATE_LEFT;
			if ((slider->opos == slider->omax) ^ (slider->pos == pos))
				slider->flags |= ACS_SLIDER_UPDATE_POS;
			if (slider->oleft < slider->left)
				slider->flags |= ACS_SLIDER_UPDATE_OLEFT;
			if (slider->oright < slider->right)
				slider->flags |= ACS_SLIDER_UPDATE_ORIGHT;
			if (slider->obar != slider->bar)
				slider->flags |= ACS_SLIDER_UPDATE_BAR;
			
			if (slider->flags & (ACS_SLIDER_UPDATE_LEFT | ACS_SLIDER_UPDATE_POS | ACS_SLIDER_UPDATE_OLEFT | ACS_SLIDER_UPDATE_ORIGHT | ACS_SLIDER_FULLUPDATE | ACS_SLIDER_UPDATE_BAR))
			{
				if (!(slider->flags & ACS_SLIDER_FULLUPDATE))
					slider->flags |= ACS_SLIDER_UPTODATE;
				win->obchange(win, slider->self.obnr, -1);
				slider->oleft = slider->left;
				slider->oright = slider->right;
				slider->opos = slider->pos;
				slider->obar = slider->bar;
				slider->omax = pos;
				slider->flags &= ~(ACS_SLIDER_UPTODATE | ACS_SLIDER_UPDATE_LEFT | ACS_SLIDER_UPDATE_POS | ACS_SLIDER_UPDATE_OLEFT | ACS_SLIDER_UPDATE_ORIGHT | ACS_SLIDER_FULLUPDATE | ACS_SLIDER_UPDATE_BAR);
			}
		}
		break;
	
	case AUO_GETBUBBLE:
	case AUO_GETCONTEXT:
		break;
	
	case AUO_SLCALL:
		/* slider->live = *((SLLIVE *)in_out); */
		slider->live.call = ((SLLIVE *)in_out)->call;
		slider->live.obj = ((SLLIVE *)in_out)->obj;
		break;
	
	case AUO_SLGETPOS:
		*((int32 *)in_out) = slider->pos;
		break;
		
	case AUO_SLFULL:
		slider->full = *((int32 *)in_out);
		break;
	
	case AUO_SLSIZE:
		slider->size = *((int32 *)in_out);
		break;
	
	case AUO_SLLEN:
		slider->len = *((int16 *)in_out);
		/* FIXME: limit to sizeof(slider->text) */
		break;
	
	case AUO_SLSTEP:
		slider->step = *((int32 *)in_out);
		break;
	
	case AUO_POS:
		slider->pos = *((int32 *)in_out);
		break;
		
	case AUO_NEXT:
		if (in_out == NULL)
			slider->pos += slider->step;
		else
			slider->pos += slider->step * *((int16 *)in_out);
		break;
		
	case AUO_PREV:
		if (in_out == NULL)
			slider->pos -= slider->step;
		else
			slider->pos -= slider->step * *((int16 *)in_out);
		break;
		
	case AUO_NEXTPAGE:
		if (in_out == NULL)
			slider->pos += slider->size;
		else
			slider->pos += slider->size * *((int16 *)in_out);
		break;
		
	case AUO_PREVPAGE:
		if (in_out == NULL)
			slider->pos -= slider->size;
		else
			slider->pos -= slider->size * *((int16 *)in_out);
		break;
	
	case AUO_BEGIN:
		slider->pos = 0;
		break;
	
	case AUO_END:
		slider->pos = slider->full - slider->size;
		break;
	
	case AUO_SLLIVE:
		if (slider->live.call)
		{
			if (slider->pos < 0)
				slider->pos = 0;
			pos = slider->full - slider->size;
			if (pos < slider->pos)
				slider->pos = pos;
			strncpy(slider->text, slider->live.call(slider->live.obj, slider->pos), sizeof(slider->text) - 1);
			slider->text[slider->len] = '\0';
		}
		break;
		
	case 7:
	case 8:
	case 16:
	case AUO_SLWIPOS:
	default:
		return FALSE;
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static char *printval(void *obj, long pos)
{
	UNUSED(obj);
	sprintf(text, "%ld", pos);
	return text;
}

/* -------------------------------------------------------------------------- */

static long sl_bar(OBJECT *entry, int16 pos)
{
	AUSERBLK *auser;
	ADT_SLIDER *slider;
	int16 box;
	int16 size;
	int16 bar;
	
	auser = entry->ob_spec.auserblk;
	slider = auser->ub_ptr1;
	if (auser->ub_parm & AUO_SLIDER_VERTICAL)
	{
		box = ACSblk->gl_hbox;
		size = entry->ob_height - 2 * ACSblk->gl_hbox;
	} else
	{
		box = ACSblk->gl_wbox * slider->len;
		size = entry->ob_width - 4 * ACSblk->gl_wbox;
	}
	bar = (int16)((slider->size * size) / slider->full);
	if (bar < box)
	{
		size += bar - box;
	}
	if (pos < 0)
		pos = 0;
	if (pos > size)
		pos = size;
	return (slider->full * pos + (size >> 1)) / size;
}

/* -------------------------------------------------------------------------- */

void Aus_slider(void)
{
	OBJECT *entry;
	Awiob ob;
	AUSERBLK *auser;
	int16 obx, oby;
	ADT_SLIDER *slider;
	boolean vertical;
	int16 y;
	int16 box;
	boolean buttonwait;
	int16 task;
	int16 oldx;
	int16 button;
	int16 kstate;
	int32 pos;
	
	entry = &ACSblk->ev_object[ACSblk->ev_obnr];
	ob.window = ACSblk->ev_window;
	ob.entry = entry;
	if (ACSblk->ev_window->toolbar == ACSblk->ev_object)
		ob.obnr = A_TOOLBAR | ACSblk->ev_obnr;
	else
		ob.obnr = ACSblk->ev_obnr;
	Auo_slider(entry, AUO_SELF, &ob);
	auser = entry->ob_spec.auserblk;
	slider = auser->ub_ptr1;
	if (slider->flags & ACS_SLIDER_DIRTY)
	{
		sl_calc(entry);
	}
	objc_offset(ACSblk->ev_object, ACSblk->ev_obnr, &obx, &oby);
	vertical = (auser->ub_parm & AUO_SLIDER_VERTICAL) != 0;
	if (vertical)
	{
		box = ACSblk->gl_hbox;
		y = ACSblk->ev_window->wi_work.y + oby;
		obx = ACSblk->ev_mmoy - y;
	} else
	{
		box = ACSblk->gl_wbox * 2;
		y = ACSblk->ev_window->wi_work.x + obx;
		obx = ACSblk->ev_mmox - y;
	} 
	buttonwait = TRUE;
	if (obx < 0)
		return;
	if ((obx -= box) < 0)
	{
		if (entry->ob_state & AOS_DCLICK)
		{
			task = AUO_BEGIN;
			buttonwait = FALSE;
		} else
		{
			task = AUO_PREV;
		}
	} else if ((obx -= slider->left) < 0)
	{
		if (auser->ub_parm & AUO_SLIDER_NOSLIDER)
			return;
		task = AUO_PREVPAGE;
	} else if ((obx -= slider->bar) < 0)
	{
		y += obx + slider->bar + box;
		if (vertical)
			obx = ACSblk->ev_mmoy;
		else
			obx = ACSblk->ev_mmox;
		do
		{
			pos = sl_bar(entry, obx - y);
			if (pos != slider->pos)
			{
				Auo_slider(entry, AUO_POS, &pos);
				Auo_slider(entry, AUO_SLLIVE, NULL);
				Auo_slider(entry, AUO_UPDATE, NULL);
			}
			do
			{
				oldx = obx;
				graf_mkstate(&obx, &oby, &button, &kstate);
				if (vertical)
					obx = oby;
			} while (obx == oldx && (button & 1));
		} while (button & 1);
		return;
	} else if ((obx -= slider->right) < 0)
	{
		if (auser->ub_parm & AUO_SLIDER_NOSLIDER)
			return;
		task = AUO_NEXTPAGE;
	} else
	{
		if (entry->ob_state & AOS_DCLICK)
		{
			task = AUO_END;
			buttonwait = FALSE;
		} else
		{
			task = AUO_NEXT;
		}
	}

	do
	{
		pos = slider->pos;
		Auo_slider(entry, task, NULL);
		if (pos != slider->pos)
			Auo_slider(entry, AUO_SLLIVE, NULL);
		Auo_slider(entry, AUO_UPDATE, NULL);
		if (!buttonwait)
			break;
		graf_mkstate(&obx, &oby, &button, &kstate);
	} while (button & 1);
}
