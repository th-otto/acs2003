/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      VDI-like interfacse                                   */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "acsplus.h"

static int16 CDECL graf_obj(PARMBLK *pb);
static void nix(void);
static boolean service_graf(Awindow *self, int16 task, void *in_out);
static Awindow *make_graf(void *a);

#include "plotter.ah"

static VDIPARBLK _pb;

typedef struct {
	int16 handle;
	int16 w;
	int16 h;
	MFDB *plane;
	boolean offscreen;
} GRAF_WI;

static VDIPB pb = { _pb.contrl, _pb.intin, _pb.ptsin, _pb.intout, _pb.ptsout };

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void nix(void)
{
}

/* -------------------------------------------------------------------------- */

static int16 CDECL graf_obj(PARMBLK *pb)
{
	GRAF_WI *graf;
	int16 pxy[8];
	MFDB *plane;
	
	graf = ((Awindow *)pb->pb_parm)->user;
	pxy[2] = pb->pb_wc;
	pxy[3] = pb->pb_hc;
	if (pxy[2] != 0 || pxy[3] != 0)
	{
		pxy[0] = pb->pb_xc;
		pxy[1] = pb->pb_yc;
		pxy[2] += pxy[0] - 1;
		pxy[3] += pxy[1] - 1;
	}
	vs_clip(ACSblk->vdi_handle, TRUE, pxy);
	plane = graf->plane;
	if (plane != NULL)
	{
		pxy[0] = pxy[1] = 0;
		pxy[2] = pb->pb_w - 1;
		pxy[3] = pb->pb_h - 1;
		pxy[4] = pb->pb_x;
		pxy[5] = pb->pb_y;
		pxy[6] = pb->pb_x + pb->pb_w - 1;
		pxy[7] = pb->pb_y + pb->pb_h - 1;
		vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, plane, &ACSblk->screenMFDB);
	}
	vs_clip(ACSblk->vdi_handle, FALSE, pxy);
	return pb->pb_currstate;
}

/* -------------------------------------------------------------------------- */

static void make_bp(Awindow *self)
{
	GRAF_WI *graf = self->user;
	int16 workin[20];
	int16 workout[57];
	int i;
	OBJECT *work;
	
	if (graf->plane != NULL)
	{
		Abp_delete(graf->plane);
		graf->plane = NULL;
		if (graf->offscreen)
		{
			v_clsbm(graf->handle);
			graf->offscreen = FALSE;
			graf->handle = ACSblk->vdi_handle;
		}
	}
	graf->w = (graf->w + 3) & -4;
	graf->h = (graf->h + 3) & -4;
	do
	{
		graf->plane = Abp_create(graf->w, graf->h);
		if (graf->plane != NULL)
			break;
		graf->w >>= 1;
		graf->h >>= 1;
		graf->w = (graf->w + 3) & -4;
		graf->h = (graf->h + 3) & -4;
	} while (graf->w > 32 && graf->h > 32);
	
	work = self->work;
	work->ob_width = graf->w;
	work->ob_height = graf->h;
	for (i = 1; i < 10; i++)
		workin[i] = 1;
	graf->offscreen = FALSE;
	graf->handle = ACSblk->vdi_handle;
	if (Ash_getcookie(C_EdDI, NULL))
	{
		workin[0] = Getrez() + 2;
		workin[10] = 2;
		workin[11] = graf->w - 1;
		workin[12] = graf->h - 1;
		workin[13] = workin[14] = 0;
		for (i = 15; i < 20; i++)
			workin[i] = 0;
		v_opnbm(workin, graf->plane, &graf->handle, workout);
		if (graf->handle != 0 && workout[0] == workin[11] && workout[1] == workin[12])
		{
			graf->offscreen = TRUE;
		} else
		{
			graf->handle = ACSblk->vdi_handle;
		}
	}
	w_clr(self);
}

/* -------------------------------------------------------------------------- */

static Awindow *make_graf(void *a)
{
	Axywh *area = a;
	GRAF_WI *graf;
	Awindow *self;
	
	graf = Ax_malloc(sizeof(*graf));
	if (graf == NULL)
		return NULL;
	if ((self = Awi_create(&PLOTTER)) == NULL)
		return NULL;
	graf->handle = ACSblk->vdi_handle;
	graf->w = graf->h = 320;
	graf->plane = NULL;
	graf->offscreen = FALSE;
	if (area != NULL)
	{
		self->wi_act.x = area->x;
		self->wi_act.y = area->y;
		graf->w = area->w;
		graf->h = area->h;
	}
	self->work[ROOT].ob_spec.auserblk->ub_parm = (int32)self;
	self->user = graf;
	make_bp(self);
	
	return self;
}

/* -------------------------------------------------------------------------- */

static void term(Awindow *self)
{
	GRAF_WI *graf = self->user;
	
	if (graf != NULL)
	{
		if (graf->offscreen)
			v_clsbm(graf->handle);
		Abp_delete(graf->plane);
		Ax_free(graf);
	}
	Awi_delete(self);
}

/* -------------------------------------------------------------------------- */

static boolean service_graf(Awindow *self, int16 task, void *in_out)
{
	GRAF_WI *graf = self->user;
	
	switch (task)
	{
	case AS_TERM:
		if (ACSblk->appexit || in_out == self)
			term(self);
		break;
	
	case AS_PLOTHANDLE:
		*((int16 *)in_out) = graf->handle;
		break;
	
	case AS_PLOTENTRY:
		*((OBJECT **)in_out) = self->work;
		break;
	
	case AS_PLOTMFDB:
		*((MFDB **)in_out) = graf->plane;
		break;
	
	case AS_PLOTSIZE:
		graf->w = ((int16 *)in_out)[0];
		graf->h = ((int16 *)in_out)[1];
		make_bp(self);
		break;
	
	case AS_DELETE:
		w_clr(self);
		w_update(self);
		break;
	
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

void w_update(Awindow *win)
{
	win->obchange(win, ROOT, -1);
}

/* -------------------------------------------------------------------------- */

void w_clr(Awindow *win)
{
	GRAF_WI *graf = win->user;
	MFDB *bp = graf->plane;
	int16 pxy[8];
	
	pxy[0] = pxy[1] = pxy[4] = pxy[5] = 0;
	pxy[2] = pxy[6] = graf->w - 1;
	pxy[3] = pxy[7] = graf->h - 1;
	vro_cpyfm(graf->handle, ALL_WHITE, pxy, bp, bp);
}

/* -------------------------------------------------------------------------- */

void w_inv(Awindow *win)
{
	GRAF_WI *graf = win->user;
	MFDB *bp = graf->plane;
	int16 pxy[8];
	
	pxy[0] = pxy[1] = pxy[4] = pxy[5] = 0;
	pxy[2] = pxy[6] = graf->w - 1;
	pxy[3] = pxy[7] = graf->h - 1;
	vro_cpyfm(graf->handle, NOT_D, pxy, bp, bp);
}

/* -------------------------------------------------------------------------- */

void w_draw(Awindow *win, int16 x1, int16 y1, int16 x2, int16 y2)
{
	GRAF_WI *graf = win->user;
	int16 pxy[4];
	
	pxy[0] = x1;
	pxy[1] = y1;
	pxy[2] = x2;
	pxy[3] = y2;
	if (graf->offscreen)
	{
		v_pline(graf->handle, 2, pxy);
	} else
	{
		Abp_start(graf->plane);
		v_pline(ACSblk->vdi_handle, 2, pxy);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_pline(Awindow *win, int16 count, int16 *pxy)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_pline(graf->handle, count, pxy);
	} else
	{
		Abp_start(graf->plane);
		v_pline(ACSblk->vdi_handle, count, pxy);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_pmarker(Awindow *win, int16 count, int16 *pxy)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_pmarker(graf->handle, count, pxy);
	} else
	{
		Abp_start(graf->plane);
		v_pmarker(ACSblk->vdi_handle, count, pxy);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_gtext(Awindow *win, int16 x, int16 y, const char *string)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_gtext(graf->handle, x, y, string);
	} else
	{
		Abp_start(graf->plane);
		v_gtext(ACSblk->vdi_handle, x, y, string);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_fillarea(Awindow *win, int16 count, int16 *pxy)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_fillarea(graf->handle, count, pxy);
	} else
	{
		Abp_start(graf->plane);
		v_fillarea(ACSblk->vdi_handle, count, pxy);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_contourfill(Awindow *win, int16 x, int16 y, int16 index)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_contourfill(graf->handle, x, y, index);
	} else
	{
		Abp_start(graf->plane);
		v_contourfill(ACSblk->vdi_handle, x, y, index);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void wr_recfl(Awindow *win, int16 *pxy)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		vr_recfl(graf->handle, pxy);
	} else
	{
		Abp_start(graf->plane);
		vr_recfl(ACSblk->vdi_handle, pxy);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_bar(Awindow *win, int16 *pxy)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_bar(graf->handle, pxy);
	} else
	{
		Abp_start(graf->plane);
		v_bar(ACSblk->vdi_handle, pxy);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_arc(Awindow *win, int16 x, int16 y, int16 rad, int16 begang, int16 endang)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_arc(graf->handle, x, y, rad, begang, endang);
	} else
	{
		Abp_start(graf->plane);
		v_arc(ACSblk->vdi_handle, x, y, rad, begang, endang);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_pieslice(Awindow *win, int16 x, int16 y, int16 rad, int16 begang, int16 endang)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_pieslice(graf->handle, x, y, rad, begang, endang);
	} else
	{
		Abp_start(graf->plane);
		v_pieslice(ACSblk->vdi_handle, x, y, rad, begang, endang);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_circle(Awindow *win, int16 x, int16 y, int16 rad)
{
	GRAF_WI *graf = win->user;

	if (graf->offscreen)
	{
		v_circle(graf->handle, x, y, rad);
	} else
	{
		Abp_start(graf->plane);
		v_circle(ACSblk->vdi_handle, x, y, rad);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_ellipse(Awindow *win, int16 x, int16 y, int16 xrad, int16 yrad)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_ellipse(graf->handle, x, y, xrad, yrad);
	} else
	{
		Abp_start(graf->plane);
		v_ellipse(ACSblk->vdi_handle, x, y, xrad, yrad);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_ellarc(Awindow *win, int16 x, int16 y, int16 xrad, int16 yrad, int16 begang, int16 endang)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_ellarc(graf->handle, x, y, xrad, yrad, begang, endang);
	} else
	{
		Abp_start(graf->plane);
		v_ellarc(ACSblk->vdi_handle, x, y, xrad, yrad, begang, endang);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_ellpie(Awindow *win, int16 x, int16 y, int16 xrad, int16 yrad, int16 begang, int16 endang)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_ellpie(graf->handle, x, y, xrad, yrad, begang, endang);
	} else
	{
		Abp_start(graf->plane);
		v_ellpie(ACSblk->vdi_handle, x, y, xrad, yrad, begang, endang);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_rbox(Awindow *win, int16 *pxy)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_rbox(graf->handle, pxy);
	} else
	{
		Abp_start(graf->plane);
		v_rbox(ACSblk->vdi_handle, pxy);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_rfbox(Awindow *win, int16 *pxy)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_rfbox(graf->handle, pxy);
	} else
	{
		Abp_start(graf->plane);
		v_rfbox(ACSblk->vdi_handle, pxy);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

void w_justified(Awindow *win, int16 x, int16 y, const char *string, int16 length, int16 word_space, int16 char_space)
{
	GRAF_WI *graf = win->user;
	
	if (graf->offscreen)
	{
		v_justified(graf->handle, x, y, string, length, word_space, char_space);
	} else
	{
		Abp_start(graf->plane);
		v_justified(ACSblk->vdi_handle, x, y, string, length, word_space, char_space);
		Abp_end();
	}
}

/* -------------------------------------------------------------------------- */

Awindow *get_plotter(void)
{
	return &PLOTTER;
}
