#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"

static void edpa_col(void);
static void edpa_frame(void);
static void edpa_pattern(void);
static void edpa_ok(void);
static void edpa_abort(void);

#include "uepatter.ah"
#include "uepatter.h"

static void edpa_minsize(AUSERBLK *user, int16 *w, int16 *h);
static OBJECT *edpa_object_tree(AUSER_DEF *user, OBJECT *obj);
static void edpa_test_it(AUSER_DEF *user, AUSERBLK *userblk);

static AUSERBLK pattern = { A_pattern, 0x00230001L, NULL, NULL, NULL, NULL, NULL, NULL };

static OBJECT visual = { -1, -1, -1, G_USERDEF, 0x0000, 0x0000, C_UNION(&pattern), 0, 0, 10, 2 };
static OBJECT logical = { -1, -1, -1, G_USERDEF, 0x0040, 0x0000, C_UNION(0L), 0, 0, 3, 1 };

static AUSER_DEF aud = { "0x230001L", NULL, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static UODATAS data = {
	"A_pattern",
	edpa_object_tree,
	edpa_test_it,
	edpa_ok,
	Aob_delete,
	&visual,
	&logical,
	&aud,
	edpa_minsize,
	NULL,
	title,
	help_title,
	NULL
};

static char parm[32];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edpa_col(void)
{
	int32 *parm;
	int16 color;
	
	parm = &ACSblk->ev_object[ED_PATTERN_SAMPLE].ob_spec.auserblk->ub_parm;
	if ((color = oe_colsel((int)(*parm & ACS_PATTERN_COLOR), ED_PATTERN_COLOR_BOX, ED_PATTERN_COLOR_POPUP, ED_PATTERN_COLOR)) >= 0)
	{
		*parm = (*parm & ~ACS_PATTERN_COLOR) | color;
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_PATTERN_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edpa_frame(void)
{
	ACSblk->ev_object[ED_PATTERN_SAMPLE].ob_spec.auserblk->ub_parm ^= ACS_PATTERN_FRAME;;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_PATTERN_SAMPLE, -1);
}

/* -------------------------------------------------------------------------- */

static void edpa_pattern(void)
{
	int32 *parm;
	
	parm = &ACSblk->ev_object[ED_PATTERN_SAMPLE].ob_spec.auserblk->ub_parm;
	*parm = (ACS_PATTERN_PATTERN & ACSblk->ev_object[ACSblk->ev_obnr].ob_spec.auserblk->ub_parm) | (*parm & ~ACS_PATTERN_PATTERN);
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_PATTERN_SAMPLE, -1);
}

/* -------------------------------------------------------------------------- */

void init_pattern(Awindow *win)
{
	win->service(win, AS_ACS_PART_ADD, &data);
}

/* -------------------------------------------------------------------------- */

static void edpa_minsize(AUSERBLK *user, int16 *w, int16 *h)
{
	UNUSED(user);
	*w = ACSblk->gl_wbox;
	*h = ACSblk->gl_hbox;
}

/* -------------------------------------------------------------------------- */

static OBJECT *edpa_object_tree(AUSER_DEF *userdef, OBJECT *edit)
{
	OBJECT *tree;
	OBJECT *ptr;
	AUSERBLK *user;
	long parm;
	
	tree = Aob_create(&ED_PATTERN);
	if (tree != NULL)
	{
		ptr = &tree[ED_PATTERN_SAMPLE];
		ptr->ob_flags |= edit->ob_flags & (OF_RBUTTON | OF_DEFAULT | OF_EXIT);
		ptr->ob_state |= edit->ob_state & (OS_SELECTED | OS_CROSSED | OS_CHECKED | OS_DISABLED | OS_OUTLINED | OS_SHADOWED);
		user = ptr->ob_spec.auserblk;
		sscanf(userdef->parm, "0x%lxL", &parm);
		user->ub_parm = parm;
		if (parm & ACS_PATTERN_FRAME)
			tree[ED_PATTERN_FRAME].ob_state |= OS_SELECTED;
		
		Aob_puttext(tree, ED_PATTERN_COLOR_POPUP, colour_text[(int)((parm) & ACS_PATTERN_COLOR)]);
		tree[ED_PATTERN_COLOR].ob_spec.obspec.interiorcol = (int)((parm) & ACS_PATTERN_COLOR);
		/* FIXME: no bubble text here */
		user->bubble = user->context = NULL;
	}
	return tree;
}

/* -------------------------------------------------------------------------- */

static void edpa_test_it(AUSER_DEF *userdef, AUSERBLK *userblk)
{
	userblk->ub_code = A_pattern;
	sscanf(userdef->parm, "0x%lxL", &userblk->ub_parm);
	userblk->ub_serv = NULL;
	userblk->ub_ptr1 = userblk->ub_ptr2 = userblk->ub_ptr3 = NULL;
	userblk->bubble =  NULL;
	userblk->context = NULL;
}

/* -------------------------------------------------------------------------- */

static void edpa_abort(void)
{
	data.interface->abort();
}

/* -------------------------------------------------------------------------- */

static void edpa_ok(void)
{
	OBJECT *tree;
	AUSER_DEF userdef;
	AUSERBLK *auser;
	
	tree = ACSblk->ev_window->work;
	auser = tree[ED_PATTERN_SAMPLE].ob_spec.auserblk;
	
	sprintf(parm, "0x%lxL", auser->ub_parm);
	userdef.parm = parm;
	userdef.serv = "";
	userdef.type1 = userdef.type2 = userdef.type3 = NONE_PAR;
	userdef.data1 = userdef.data2 = userdef.data3 = NULL;
	userdef.len1 = userdef.len2 = userdef.len3 = 0;
	userdef.bubble = NULL;
	userdef.context = NULL;
	data.interface->set(&userdef, ACSblk->gl_wbox, ACSblk->gl_hbox);
	edpa_abort();
}

