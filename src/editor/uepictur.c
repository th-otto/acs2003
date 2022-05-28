#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"

static void edpi_col(void);
static void edpi_dither(void);
static void edpi_pattern(void);
static void edpi_tile(void);
static void edpi_acc(void);
static void edpi_ok(void);
static void edpi_abort(void);

#include "uepictur.ah"
#include "uepictur.h"

static void edpi_minsize(AUSERBLK *user, int16 *w, int16 *h);
static OBJECT *edpi_object_tree(AUSER_DEF *user, OBJECT *obj);
static void edpi_test_it(AUSER_DEF *user, AUSERBLK *userblk);

static AUSERBLK picture = { A_picture, 0, Auo_picture, PICDATA, NULL, NULL, NULL, NULL };

static OBJECT visual = { -1, -1, -1, G_USERDEF, 0x0000, 0x0000, C_UNION(&picture), 0, 0, 6, 2 };
static OBJECT logical = { -1, -1, -1, G_USERDEF, 0x0040, 0x0000, C_UNION(0L), 0, 0, 6, 2 };

static AUSER_DEF aud = { "0x0L", "Auo_picture", DATA_PAR, (void *)PICDATA, sizeof(PICDATA), NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static UODATAS data = {
	"A_picture",
	edpi_object_tree,
	edpi_test_it,
	edpi_ok,
	Aob_delete,
	&visual,
	&logical,
	&aud,
	edpi_minsize,
	NULL,
	title,
	help_title,
	NULL
};

static char parm[32];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edpi_col(void)
{
	int32 *parm;
	int16 color;
	
	parm = &ACSblk->ev_object[ED_PICTURE_IMAGE].ob_spec.auserblk->ub_parm;
	if ((color = oe_colsel((int16)((*parm >> 4) & 15), ED_PICTURE_COLOR_BOX, ED_PICTURE_COLOR_POPUP, ED_PICTURE_COLOR)) >= 0)
	{
		*parm = (*parm & ~0xf0) | ((int32)color << 4);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_PICTURE_IMAGE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edpi_dither(void)
{
	AUSERBLK *auser;
	
	auser = ACSblk->ev_object[ED_PICTURE_IMAGE].ob_spec.auserblk;
	auser->ub_parm ^= 0x00100000L;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_PICTURE_IMAGE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edpi_pattern(void)
{
	AOBJECT *aobj;
	int32 *parm;

	aobj = (AOBJECT *)&ACSblk->ev_window->work[ACSblk->ev_obnr] + 1;
	parm = &ACSblk->ev_object[ED_PICTURE_IMAGE].ob_spec.auserblk->ub_parm;
	*parm = (*parm & ~0xfff00L) | ((int32)aobj->userp1);
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_PICTURE_IMAGE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edpi_tile(void)
{
	AUSERBLK *auser;
	
	auser = ACSblk->ev_object[ED_PICTURE_IMAGE].ob_spec.auserblk;
	auser->ub_parm ^= 0x00000002L;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_PICTURE_IMAGE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

void init_picture(Awindow *win)
{
	win->service(win, AS_ACS_PART_ADD, &data);
}

/* -------------------------------------------------------------------------- */

static void edpi_minsize(AUSERBLK *user, int16 *w, int16 *h)
{
	AMFDB *mfdb;
	
	mfdb = user->ub_ptr1;
	if (mfdb != NULL)
	{
		*w = mfdb->org.fd_w;
		*h = mfdb->org.fd_h;
	} else
	{
		*w = ACSblk->gl_wbox;
		*h = ACSblk->gl_hbox;
	}
}

/* -------------------------------------------------------------------------- */

static OBJECT *edpi_object_tree(AUSER_DEF *userdef, OBJECT *edit)
{
	OBJECT *tree;
	OBJECT *ptr;
	AUSERBLK *user;
	long parm;
	boolean done;
	
	tree = Aob_create(&ED_PICTURE);
	if (tree != NULL)
	{
		Aob_fix(tree);
		ptr = &tree[ED_PICTURE_IMAGE];
		ptr->ob_flags |= edit->ob_flags & (OF_RBUTTON | OF_DEFAULT | OF_EXIT);
		ptr->ob_state |= edit->ob_state & (OS_SELECTED | OS_CROSSED | OS_CHECKED | OS_DISABLED | OS_OUTLINED | OS_SHADOWED);
		user = ptr->ob_spec.auserblk;
		user->ub_serv(ptr, AUO_TERM, NULL);
		sscanf(userdef->parm, "0x%lxL", &parm);
		if (parm & 2)
			tree[ED_PICTURE_TILE].ob_state |= OS_SELECTED;
		if (parm & 0x00100000L)
			tree[ED_PICTURE_DITHER].ob_state |= OS_SELECTED;
		user->ub_parm = parm | 1;
		user->ub_ptr1 = userdef->data1;
		user->ub_serv(ptr, AUO_CREATE, &done);
		Aob_puttext(tree, ED_PICTURE_COLOR_POPUP, colour_text[(int)((parm >> 4) & 15)]);
		tree[ED_PICTURE_COLOR].ob_spec.obspec.interiorcol = (int)(parm >> 4) & 15;
	}
	return tree;
}

/* -------------------------------------------------------------------------- */

static void edpi_test_it(AUSER_DEF *userdef, AUSERBLK *userblk)
{
	userblk->ub_code = A_picture;
	sscanf(userdef->parm, "0x%lxL", (long *)&userblk->ub_parm);
	userblk->ub_parm |= 1;
	userblk->ub_serv = Auo_picture;
	userblk->ub_ptr1 = userdef->data1;
	userblk->ub_ptr2 = userblk->ub_ptr3 = NULL;
	userblk->bubble = NULL;
	userblk->context = NULL;
}

/* -------------------------------------------------------------------------- */

static void edpi_abort(void)
{
	data.interface->abort();
}

/* -------------------------------------------------------------------------- */

static void edpi_ok(void)
{
	OBJECT *tree;
	AUSERBLK *auser;
	AMFDB *fdb;
	AMFDB *newfdb;
	ssize_t size;
	AUSER_DEF userdef;
	
	tree = ACSblk->ev_window->work;
	auser = tree[ED_PICTURE_IMAGE].ob_spec.auserblk;
	fdb = auser->ub_ptr3;
	if (fdb != NULL)
	{
		size = (long)fdb->org.fd_h * 2 * fdb->org.fd_wdwidth * fdb->org.fd_nplanes + sizeof(*fdb);
		newfdb = Ax_malloc(size);
		if (newfdb != NULL)
		{
			memcpy(&newfdb->org, &fdb->org, sizeof(newfdb->org));
			newfdb->trans = NULL;
			newfdb->count = 0;
			newfdb->org.fd_addr = newfdb + 1;
			newfdb->org.fd_stand = TRUE;
			vr_trnfm(ACSblk->vdi_handle, &fdb->org, &newfdb->org);
			sprintf(parm, "0x%lxL", (long)auser->ub_parm & ~1);
			userdef.parm = parm;
			userdef.serv = "Auo_picture";
			userdef.type1 = DATA_PAR;
			userdef.data1 = (void *)newfdb;
			userdef.len1 = size;
			userdef.type2 = userdef.type3 = NONE_PAR;
			userdef.data2 = userdef.data3 = NULL;
			userdef.len2 = userdef.len3 = 0;
			userdef.bubble = NULL;
			userdef.context = NULL;
			data.interface->set(&userdef, fdb->org.fd_w, fdb->org.fd_h);
			Ax_ifree(newfdb);
		}
	}
	edpi_abort();
}

/* -------------------------------------------------------------------------- */

static void edpi_acc(void)
{
	Awindow *self;
	Awindow *select;
	AUSERBLK *user;
	OBJECT *tree;
	OBJECT *ptr;
	int16 obnr;
	AOBJECT *aobj;
	AMFDB *fdb;
	MFDB *bp;
	int16 w, h;
	
	self = ACSblk->ev_window;
	tree = self->work;
	select = ACSblk->Aselect.window;
	Adr_start();
	if ((obnr = Adr_next()) > 0)
	{
		aobj = (AOBJECT *)&select->work[obnr] + 1;
		if (aobj->type == AT_MFDB)
		{
			fdb = aobj->userp1;
			w = fdb->org.fd_w;
			h = fdb->org.fd_h;
			bp = Abp_create(w, h);
			if (bp != NULL)
			{
				if (fdb->org.fd_stand == 1)
				{
					bp->fd_stand = 0;
					vr_trnfm(ACSblk->vdi_handle, &fdb->org, bp);
				} else
				{
					memcpy(bp->fd_addr, fdb->org.fd_addr, (long)h * 2 * bp->fd_wdwidth * bp->fd_nplanes);
				}
				ptr = &tree[ED_PICTURE_IMAGE];
				user = ptr->ob_spec.auserblk;
				user->ub_serv(ptr, AUO_PICMFDB, bp);
				self->state |= AWS_FORCEREDRAW;
				self->sized(self, &self->wi_act);
				Adr_del(select, obnr);
			}
		}
	}
}
