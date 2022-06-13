#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"
#include "acsplus.h"

static void edsl_abort(void);
static void edsl_ok(void);
static void edsl_horizontal(void);
static void edsl_vertical(void);
static void edsl_3d(void);
static void edsl_slider(void);

#include "ueslider.ah"
#include "ueslider.h"

static void edsl_minsize(AUSERBLK *user, int16 *w, int16 *h);
static OBJECT *edsl_object_tree(AUSER_DEF *user, OBJECT *obj);
static void edsl_test_it(AUSER_DEF *user, AUSERBLK *userblk);

static AUSERBLK slider = { A_slider, 0x00000002L, Auo_slider, NULL, NULL, NULL, NULL, NULL };

static OBJECT visual = { -1, -1, -1, G_USERDEF, 0x2001, 0x0000, C_UNION(&slider), 0, 0, 7, 1 };
static OBJECT logical = { -1, -1, -1, G_USERDEF, 0x0040, 0x0000, C_UNION(&slider), 0, 0, 7, 1 };

static AUSER_DEF aud = { "0x2L", "Auo_slider", NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static UODATAS data = {
	"A_slider",
	edsl_object_tree,
	edsl_test_it,
	edsl_ok,
	Aob_delete,
	&visual,
	&logical,
	&aud,
	edsl_minsize,
	NULL,
	title,
	help_title,
	NULL
};

static char parm[32];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void init_slider(Awindow *win)
{
	win->service(win, AS_ACS_PART_ADD, &data);
}

/* -------------------------------------------------------------------------- */

static void edsl_minsize(AUSERBLK *user, int16 *w, int16 *h)
{
	if (user->ub_parm & AUO_SLIDER_VERTICAL)
	{
		*w = ACSblk->gl_wbox * 2;
		*h = ACSblk->gl_hbox * 4;
	} else
	{
		*w = ACSblk->gl_wbox * 7;
		*h = ACSblk->gl_hbox;
	}
}

/* -------------------------------------------------------------------------- */

static OBJECT *edsl_object_tree(AUSER_DEF *userdef, OBJECT *edit)
{
	OBJECT *tree;
	OBJECT *ptr;
	AUSERBLK *user;
	long parm;
	OBJECT *slider;
	
	tree = Aob_create(&ED_SLIDER.root);
	if (tree != NULL)
	{
		Aob_fix(tree);
		oe_beself(ACSblk->ev_window, tree, ED_SLIDER_TYPE);
		oe_beself(ACSblk->ev_window, tree, ED_SLIDER_BUBBLE);
		oe_beself(ACSblk->ev_window, tree, ED_SLIDER_CONTEXT);
		ptr = &tree[ED_SLIDER_TYPE];
		ptr->ob_flags |= edit->ob_flags & (OF_RBUTTON | OF_DEFAULT | OF_EXIT);
		ptr->ob_state |= edit->ob_state & (OS_SELECTED | OS_CROSSED | OS_CHECKED | OS_DISABLED | OS_OUTLINED | OS_SHADOWED);
		user = ptr->ob_spec.auserblk;
		sscanf(userdef->parm, "0x%lxL", &parm);
		user->ub_parm = parm;
		if (parm & AUO_SLIDER_VERTICAL)
		{
			slider = &tree[ED_SLIDER_VER];
			ptr->ob_width = ACSblk->gl_wbox * 2;
			ptr->ob_height = slider->ob_height;
		} else
		{
			slider = &tree[ED_SLIDER_HOR];
			ptr->ob_width = slider->ob_width;
			ptr->ob_height = ACSblk->gl_hbox;
		}
		if (parm & AUO_SLIDER_3D)
			tree[ED_SLIDER_3D].ob_state |= OS_SELECTED;
		else
			tree[ED_SLIDER_3D].ob_state &= ~OS_SELECTED;
		if (parm & AUO_SLIDER_NOSLIDER)
			tree[ED_SLIDER_SLIDER].ob_state &= ~OS_SELECTED;
		else
			tree[ED_SLIDER_SLIDER].ob_state |= OS_SELECTED;
		user->bubble = tree[ED_SLIDER_BUBBLE].ob_spec.auserblk->ub_ptr1;
		if (Ast_isEmpty(userdef->bubble))
			Aob_puttext(tree, ED_SLIDER_BUBBLE, "");
		else
			Aob_puttext(tree, ED_SLIDER_BUBBLE, userdef->bubble);
		user->context = tree[ED_SLIDER_CONTEXT].ob_spec.auserblk->ub_ptr1;
		if (Ast_isEmpty(userdef->context))
			Aob_puttext(tree, ED_SLIDER_CONTEXT, "");
		else
			Aob_puttext(tree, ED_SLIDER_CONTEXT, userdef->context);
	}
	return tree;
}

/* -------------------------------------------------------------------------- */

static void edsl_test_it(AUSER_DEF *userdef, AUSERBLK *userblk)
{
	userblk->ub_code = A_slider;
	sscanf(userdef->parm, "0x%lxL", (long *)&userblk->ub_parm);
	userblk->ub_serv = Auo_slider;
	userblk->ub_ptr1 = userblk->ub_ptr2 = userblk->ub_ptr3 = NULL;
	userblk->bubble = Ast_isEmpty(userdef->bubble) ? NULL : userdef->bubble;
	userblk->context = Ast_isEmpty(userdef->context) ? NULL : userdef->context;
}

/* -------------------------------------------------------------------------- */

static void edsl_abort(void)
{
	AUSERBLK *userblk;
	
	userblk = ACSblk->ev_window->work[ED_SLIDER_TYPE].ob_spec.auserblk;
	userblk->bubble = NULL;
	userblk->context = NULL;
	data.interface->abort();
}

/* -------------------------------------------------------------------------- */

static void edsl_ok(void)
{
	OBJECT *tree;
	AUSER_DEF userdef;
	int16 w, h;
	AUSERBLK *auser;
	
	tree = ACSblk->ev_window->work;
	auser = tree[ED_SLIDER_TYPE].ob_spec.auserblk;
	edsl_minsize(auser, &w, &h);
	
	sprintf(parm, "0x%lxL", (long)auser->ub_parm);
	userdef.parm = parm;
	userdef.serv = "Auo_slider";
	userdef.type1 = userdef.type2 = userdef.type3 = NONE_PAR;
	userdef.data1 = userdef.data2 = userdef.data3 = NULL;
	userdef.len1 = userdef.len2 = userdef.len3 = 0;
	userdef.bubble = NULL;
	userdef.context = NULL;
	Auo_boxed(&tree[ED_SLIDER_BUBBLE], AUO_GETVAL, &userdef.bubble);
	if (Ast_isEmpty(userdef.bubble))
		userdef.bubble = NULL;
	Auo_boxed(&tree[ED_SLIDER_CONTEXT], AUO_GETVAL, &userdef.context);
	if (Ast_isEmpty(userdef.context))
		userdef.context = NULL;
	data.interface->set(&userdef, w, h);
	edsl_abort();
}

/* -------------------------------------------------------------------------- */

static void edsl_horizontal(void)
{
	OBJECT *ptr;
	AUSERBLK *auser;
	OBJECT *slider;
	
	ptr = &ACSblk->ev_object[ED_SLIDER_TYPE];
	auser = ptr->ob_spec.auserblk;
	if (auser->ub_parm & AUO_SLIDER_VERTICAL)
	{
		auser->ub_parm &= ~AUO_SLIDER_VERTICAL;
		slider = &ACSblk->ev_object[ED_SLIDER_HOR];
		ptr->ob_width = slider->ob_width;
		ptr->ob_height = ACSblk->gl_hbox;
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_SLIDER_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edsl_vertical(void)
{
	OBJECT *ptr;
	AUSERBLK *auser;
	OBJECT *slider;
	
	ptr = &ACSblk->ev_object[ED_SLIDER_TYPE];
	slider = &ACSblk->ev_object[ED_SLIDER_VER];
	auser = ptr->ob_spec.auserblk;
	if (!(auser->ub_parm & AUO_SLIDER_VERTICAL))
	{
		auser->ub_parm |= AUO_SLIDER_VERTICAL;
		ptr->ob_width = ACSblk->gl_wbox * 2;
		ptr->ob_height = slider->ob_height;
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_SLIDER_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edsl_3d(void)
{
	ACSblk->ev_object[ED_SLIDER_TYPE].ob_spec.auserblk->ub_parm ^= AUO_SLIDER_3D;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_SLIDER_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edsl_slider(void)
{
	ACSblk->ev_object[ED_SLIDER_TYPE].ob_spec.auserblk->ub_parm ^= AUO_SLIDER_NOSLIDER;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_SLIDER_BOX, -1);
}
