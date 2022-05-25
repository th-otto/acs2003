#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"

static void edce_abort(void);
static void edce_ok(void);
static void edce_do3d(void);

#include "uecheck.ah"
#include "uecheck.h"

static void edce_minsize(AUSERBLK *user, int16 *w, int16 *h);
static OBJECT *edce_object_tree(AUSER_DEF *user, OBJECT *obj);
static void edce_test_it(AUSER_DEF *user, AUSERBLK *userblk);

static AUSERBLK aucheck = { A_checkbox, 1, Auo_string, "Check", NULL, NULL, NULL, NULL };
static AUSERBLK auradio = { A_checkbox, 1, Auo_string, "Radio", NULL, NULL, NULL, NULL };

static OBJECT visual = { -1, -1, -1, G_USERDEF, 0x2001, 0x0010, C_UNION(&aucheck), 0, 0, 8, 1 };
static OBJECT logical = { -1, -1, -1, G_USERDEF, 0x0001, 0x0000, C_UNION(&aucheck), 0, 0, 8, 1 };
static OBJECT radvisual = { -1, -1, -1, G_USERDEF, 0x2011, 0x0010, C_UNION(&auradio), 0, 0, 8, 1 };
static OBJECT radlogical = { -1, -1, -1, G_USERDEF, 0x0011, 0x0000, C_UNION(&auradio), 0, 0, 8, 1 };

static AUSER_DEF aud = { "0x1L", "Auo_string", STR_PAR, "Check", 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static AUSER_DEF radaud = { "0x1L", "Auo_string", STR_PAR, "Radio", 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static UODATAS data = {
	"A_checkbox",
	edce_object_tree,
	edce_test_it,
	edce_ok,
	Aob_delete,
	&visual,
	&logical,
	&aud,
	edce_minsize,
	NULL,
	title,
	help_title,
	NULL
};
static UODATAS raddata = {
	"A_checkbox",
	edce_object_tree,
	edce_test_it,
	edce_ok,
	Aob_delete,
	&radvisual,
	&radlogical,
	&radaud,
	edce_minsize,
	NULL,
	title,
	help_title,
	NULL
};

static char parm[32];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edce_do3d(void)
{
	int32 *parm;
	
	parm = &ACSblk->ev_object[ED_CHECKBOX_SAMPLE].ob_spec.auserblk->ub_parm;
	*parm = 0;
	if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & OS_SELECTED)
		*parm |= ACS_CHECKBOX_3D;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ACSblk->ev_obnr, -1);
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_CHECKBOX_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

void init_check(Awindow *win)
{
	win->service(win, AS_ACS_PART_ADD, &data);
	win->service(win, AS_ACS_PART_ADD, &raddata);
}

/* -------------------------------------------------------------------------- */

static void edce_minsize(AUSERBLK *user, int16 *w, int16 *h)
{
	int width;
	char *str;
	
	str = user->ub_ptr1;
	if (str != NULL && *str != '\0')
		width = ((int)strlen(str) + 3) * ACSblk->gl_wbox;
	else
		width = ACSblk->gl_hbox;
	*w = width;
	*h = ACSblk->gl_hbox;
}

/* -------------------------------------------------------------------------- */

static OBJECT *edce_object_tree(AUSER_DEF *userdef, OBJECT *edit)
{
	OBJECT *tree;
	OBJECT *ptr;
	AUSERBLK *user;
	long val;

	tree = Aob_create(&ED_CHECKBOX);
	if (tree == NULL)
		return NULL;
	oe_beself(ACSblk->ev_window, tree, ED_CHECKBOX_TEXT);
	oe_beself(ACSblk->ev_window, tree, ED_CHECKBOX_BUBBLE);
	oe_beself(ACSblk->ev_window, tree, ED_CHECKBOX_CONTEXT);

	ptr = &tree[ED_CHECKBOX_SAMPLE];
	ptr->ob_flags |= edit->ob_flags & (OF_RBUTTON | OF_DEFAULT | OF_EXIT);
	ptr->ob_state |= edit->ob_state & (OS_SELECTED | OS_CROSSED | OS_CHECKED | OS_DISABLED | OS_OUTLINED | OS_SHADOWED);
	user = ptr->ob_spec.auserblk;
	sscanf(userdef->parm, "0x%lxL", &val);
	user->ub_parm = val;
	if (userdef->type1 == STR_PAR)
	{
		Aob_puttext(tree, ED_CHECKBOX_TEXT, userdef->data1);
	} else
	{
		user->ub_serv(ptr, AUO_SETVAL, "");
		Aob_puttext(tree, ED_CHECKBOX_TEXT, "");
	}

	if (val & ACS_CHECKBOX_3D)
		tree[ED_CHECKBOX_3D].ob_state |= OS_SELECTED;
	else
		tree[ED_CHECKBOX_3D].ob_state &= ~OS_SELECTED;

	user->bubble = tree[ED_CHECKBOX_BUBBLE].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->bubble))
		Aob_puttext(tree, ED_CHECKBOX_BUBBLE, "");
	else
		Aob_puttext(tree, ED_CHECKBOX_BUBBLE, userdef->bubble);
	user->context = tree[ED_CHECKBOX_CONTEXT].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->context))
		Aob_puttext(tree, ED_CHECKBOX_CONTEXT, "");
	else
		Aob_puttext(tree, ED_CHECKBOX_CONTEXT, userdef->context);

	return tree;
}

/* -------------------------------------------------------------------------- */

static void edce_test_it(AUSER_DEF *userdef, AUSERBLK *userblk)
{
	userblk->ub_code = A_checkbox;
	sscanf(userdef->parm, "0x%lxL", &userblk->ub_parm);
	userblk->ub_serv = Auo_string;
	if (userdef->type1 == STR_PAR)
		userblk->ub_ptr1 = userdef->data1;
	else
		userblk->ub_ptr1 = NULL;
	userblk->ub_ptr2 = userblk->ub_ptr3 = NULL;
	/* FIXME: userdef->bubble not used? */
	userblk->bubble = NULL;
	userblk->context = NULL;
}

/* -------------------------------------------------------------------------- */

static void edce_abort(void)
{
	AUSERBLK *userblk;
	
	userblk = ACSblk->ev_window->work[ED_CHECKBOX_SAMPLE].ob_spec.auserblk;
	userblk->bubble = NULL;
	userblk->context = NULL;
	data.interface->abort();
}

/* -------------------------------------------------------------------------- */

static void edce_ok(void)
{
	OBJECT *tree;
	AUSER_DEF userdef;
	char *text;
	AUSERBLK *auser;
	int width;
	
	tree = ACSblk->ev_window->work;
	auser = tree[ED_CHECKBOX_SAMPLE].ob_spec.auserblk;
	
	sprintf(parm, "0x%lxL", auser->ub_parm);
	userdef.parm = parm;
	userdef.serv = "Auo_string";
	Auo_boxed(&tree[ED_CHECKBOX_TEXT], AUO_GETVAL, &text);
	if (text[0] != '\0')
	{
		width = (int)((strlen(text) + 3) * ACSblk->gl_wbox); /* FIXME: misplaced cast */
		userdef.type1 = STR_PAR;
		userdef.data1 = text;
	} else
	{
		width = ACSblk->gl_hbox;
		userdef.type1 = NONE_PAR;
		userdef.data1 = NULL;
	}
	userdef.len1 = 0;
	userdef.type2 = userdef.type3 = NONE_PAR;
	userdef.data2 = userdef.data3 = NULL;
	userdef.len2 = userdef.len3 = 0;
	Auo_boxed(&tree[ED_CHECKBOX_BUBBLE], AUO_GETVAL, &userdef.bubble);
	if (Ast_isEmpty(userdef.bubble))
		userdef.bubble = NULL;
	Auo_boxed(&tree[ED_CHECKBOX_CONTEXT], AUO_GETVAL, &userdef.context);
	if (Ast_isEmpty(userdef.context))
		userdef.context = NULL;
	data.interface->set(&userdef, width, ACSblk->gl_hbox);
	edce_abort();
}
