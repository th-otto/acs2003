/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Handle window slider objects                          */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "acsplus.h"

typedef struct {
	int32 full;
	int32 size;
	int32 pos;
	int32 step;
	Awindow *window;
	SLLIVE live;
} WI_SLIDER;

static WI_SLIDER proto = {
	100,
	10,
	20,
	1,
	NULL,
	{ NULL, NULL }
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 CDECL A_wislider(PARMBLK *pb)
{
	return pb->pb_currstate & ~(OS_DISABLED | OS_SELECTED);
}

/* -------------------------------------------------------------------------- */

boolean Auo_wislider(OBJECT *entry, int16 task, void *in_out)
{
	AUSERBLK *auser;
	WI_SLIDER *slider;
	int16 pos;
	int32 maxpos;
	Awindow *win;
	int16 wi_id;
	
	auser = entry->ob_spec.auserblk;
	slider = auser->ub_ptr1;
	
	switch (task)
	{
	case AUO_SLLIVE:
		if (slider->live.call)
		{
			slider->live.call(slider->live.obj, slider->pos);
		}
		break;
		
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
	
	case AUO_SELF:
		{
			Awiob *ob = (Awiob *)in_out;
			slider->window = ob->window;
		}
		break;
	
	case AUO_SLWIPOS:
		pos = *((int16 *)in_out);
		maxpos = slider->full - slider->size;
		if (maxpos > 0)
		{
			slider->pos = (pos * maxpos) / 1000;
		} else
		{
			slider->pos = 0;
		}
		break;
	
	case AUO_FULLUPDATE:
	case AUO_UPDATE:
		if (slider->pos < 0)
			slider->pos = 0;
		if (slider->full - slider->size < slider->pos)
			slider->pos = slider->full - slider->size;
		win = slider->window;
		/* FIXME: no null-pointer check */
		wi_id = win->wi_id;
		if (auser->ub_parm & AUO_SLIDER_VERTICAL)
		{
			maxpos = slider->full - slider->size;
			if (maxpos > 0)
			{
				pos = (int16)((slider->pos * 1000) / maxpos);
			} else
			{
				pos = 0;
			}
			if (pos != win->wi_slider.y)
			{
				win->wi_slider.y = pos;
				if (wi_id > 0)
					wind_set(wi_id, WF_VSLIDE, pos, 0, 0, 0);
			}
			pos = (int16)((slider->size * 1000) / slider->full);
			if (pos != win->wi_slider.h)
			{
				win->wi_slider.h = pos;
				if (wi_id > 0)
					wind_set(wi_id, WF_VSLSIZE, pos, 0, 0, 0);
			}
		} else
		{
			pos = (int16)((slider->size * 1000) / slider->full);
			if (pos != win->wi_slider.w)
			{
				win->wi_slider.w = pos;
				if (wi_id > 0)
					wind_set(wi_id, WF_HSLSIZE, pos, 0, 0, 0);
			}
			maxpos = slider->full - slider->size;
			if (maxpos > 0)
			{
				pos = (int16)((slider->pos * 1000) / maxpos);
			} else
			{
				pos = 0;
			}
			if (pos != win->wi_slider.x)
			{
				win->wi_slider.x = pos;
				if (wi_id > 0)
					wind_set(wi_id, WF_HSLIDE, pos, 0, 0, 0);
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
	
	case AUO_SLFULL:
		slider->full = *((int32 *)in_out);
		break;
	
	case AUO_SLSIZE:
		slider->size = *((int32 *)in_out);
		break;
	
	case AUO_SLSTEP:
		slider->step = *((int32 *)in_out);
		break;
	
	case AUO_SLGETPOS:
		*((int32 *)in_out) = slider->pos;
		break;
	
	case AUO_POS:
		slider->pos = *((int32 *)in_out);
		break;
		
	case AUO_NEXT:
		slider->pos += slider->step;
		break;
		
	case AUO_PREV:
		slider->pos -= slider->step;
		break;
		
	case AUO_NEXTPAGE:
		slider->pos += slider->size;
		break;
		
	case AUO_PREVPAGE:
		slider->pos -= slider->size;
		break;
	
	case AUO_BEGIN:
		slider->pos = 0;
		break;
	
	case AUO_END:
		slider->pos = slider->full - slider->size;
		break;
	
	case 7:
	case 8:
	case 16:
	case AUO_GETVAL:
	case AUO_SETVAL:
	case AUO_OWNER: /* FIXME: not handled */
	default:
		return FALSE;
	}
	return TRUE;
}
