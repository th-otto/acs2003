#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"

static void edcyc_abort(void);
static void edcyc_ok(void);
static void edcyc_outcol(void);
static void edcyc_incol(void);
static void edcyc_prepair(void);

#include "uecycle.ah"
#include "uecycle.h"

static void edcyc_minsize(AUSERBLK *user, int16 *w, int16 *h);
static OBJECT *edcyc_object_tree(AUSER_DEF *user, OBJECT *obj);
static void edcyc_test_it(AUSER_DEF *user, AUSERBLK *userblk);

static AUSERBLK aucycle = { A_cycle, 0x00010290L, Auo_cycle, "Rot|Grn|Blau", NULL, NULL, NULL, NULL };

static OBJECT visual = { -1, -1, -1, G_USERDEF, 0x0000, 0x0030, C_UNION(&aucycle), 0, 0, 10, 1 };
static OBJECT logical = { -1, -1, -1, G_USERDEF, 0x0040, 0x0030, C_UNION(0L), 0, 0, 6, 1 };

static AUSER_DEF aud = { "0x10290L", "Auo_cycle", STR_PAR, "Rot|Grn|Blau", 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static UODATAS data = {
	"A_cycle",
	edcyc_object_tree,
	edcyc_test_it,
	edcyc_ok,
	Aob_delete,
	&visual,
	&logical,
	&aud,
	edcyc_minsize,
	NULL,
	title,
	help_title,
	NULL
};

static char parm[36];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void init_cycle(Awindow *win)
{
	win->service(win, AS_ACS_PART_ADD, &data);
}

/* -------------------------------------------------------------------------- */

static void edcyc_minsize(AUSERBLK *user, int16 *w, int16 *h)
{
	UNUSED(user);
	*w = ACSblk->gl_wbox * 6;
	*h = ACSblk->gl_hbox;
}

/* -------------------------------------------------------------------------- */

static OBJECT *edcyc_object_tree(AUSER_DEF *userdef, OBJECT *edit)
{
	OBJECT *tree;
	OBJECT *ptr;
	AUSERBLK *user;
	char *strval;
	char boxchar[2] = " ";
	long parm;
	int color;
	
	tree = Aob_create(&ED_CYCLE);
	if (tree == NULL)
		return NULL;
	ptr = &tree[ED_CYCLE_SAMPLE];
	ptr->ob_flags |= edit->ob_flags & (OF_RBUTTON | OF_DEFAULT | OF_EXIT);
	ptr->ob_state |= edit->ob_state & (OS_SELECTED | OS_CROSSED | OS_CHECKED | OS_DISABLED | OS_OUTLINED | OS_SHADOWED);
	user = ptr->ob_spec.auserblk;
	oe_beself(ACSblk->ev_window, tree, ED_CYCLE_CHAR);
	oe_beself(ACSblk->ev_window, tree, ED_CYCLE_TEXT);
	oe_beself(ACSblk->ev_window, tree, ED_CYCLE_BUBBLE);
	oe_beself(ACSblk->ev_window, tree, ED_CYCLE_CONTEXT);
	sscanf(userdef->parm, "0x%lxL", &parm);
	if (parm == ACS_CYCLE_3D)
	{
		if (Awi_alert(1, A_ADAPTCYC) == 1)
			parm = ACS_CYCLE_3D | (2 << 8) | (9 << 4) | (0 << 0);
	}
	user->ub_parm = parm;
	if (userdef->type1 == STR_PAR)
		strval = userdef->data1;
	else
		strval = "";
	Auo_cycle(&tree[ED_CYCLE_SAMPLE], AUO_CYCPOPUP, strval);
	color = (int)((parm >> 4) & 15);
	Aob_puttext(tree, ED_CYCLE_IN_COLOR_POPUP, colour_text[color]);
	tree[ED_CYCLE_IN_COLOR].ob_spec.obspec.interiorcol = color;
	color = (int)((parm) & ACS_CYCLE_OUTCOL);
	Aob_puttext(tree, ED_CYCLE_OUT_COLOR_POPUP, colour_text[color]);
	tree[ED_CYCLE_OUT_COLOR].ob_spec.obspec.interiorcol = color;
	boxchar[0] = (char)(parm >> 8);
	Aob_puttext(tree, ED_CYCLE_CHAR, boxchar);
	Aob_puttext(tree, ED_CYCLE_TEXT, strval);
	if (parm & ACS_CYCLE_3D)
		tree[ED_CYCLE_3D].ob_state |= OS_SELECTED;
	user->bubble = tree[ED_CYCLE_BUBBLE].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->bubble))
		Aob_puttext(tree, ED_CYCLE_BUBBLE, "");
	else
		Aob_puttext(tree, ED_CYCLE_BUBBLE, userdef->bubble);
	user->context = tree[ED_CYCLE_CONTEXT].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->context))
		Aob_puttext(tree, ED_CYCLE_CONTEXT, "");
	else
		Aob_puttext(tree, ED_CYCLE_CONTEXT, userdef->context);
	return tree;
}

/* -------------------------------------------------------------------------- */

static void edcyc_test_it(AUSER_DEF *userdef, AUSERBLK *userblk)
{
	userblk->ub_code = A_cycle;
	sscanf(userdef->parm, "0x%lxL", (long *)&userblk->ub_parm);
	userblk->ub_serv = Auo_cycle;
	if (userdef->type1 == STR_PAR)
		userblk->ub_ptr1 = userdef->data1;
	else
		userblk->ub_ptr1 = NULL;
	userblk->ub_ptr2 = userblk->ub_ptr3 = NULL;
	userblk->bubble = Ast_isEmpty(userdef->bubble) ? NULL : userdef->bubble;
	userblk->context = Ast_isEmpty(userdef->context) ? NULL : userdef->context;
}

/* -------------------------------------------------------------------------- */

static void edcyc_abort(void)
{
	AUSERBLK *userblk;
	
	userblk = ACSblk->ev_window->work[ED_CYCLE_SAMPLE].ob_spec.auserblk;
	userblk->bubble = NULL;
	userblk->context = NULL;
	data.interface->abort();
}

/* -------------------------------------------------------------------------- */

static void edcyc_ok(void)
{
	OBJECT *tree;
	char *text;
	AUSER_DEF userdef;
	AUSERBLK *auser;
	
	tree = ACSblk->ev_window->work;
	auser = ACSblk->ev_window->work[ED_CYCLE_SAMPLE].ob_spec.auserblk;
	edcyc_prepair();
	
	sprintf(parm, "0x%lxL", (long)auser->ub_parm);
	userdef.parm = parm;
	userdef.serv = "Auo_cycle";
	Auo_boxed(&tree[ED_CYCLE_TEXT], AUO_GETVAL, &text);
	if (text[0] != '\0')
	{
		userdef.type1 = STR_PAR;
		userdef.data1 = text;
	} else
	{
		userdef.type1 = NONE_PAR;
		userdef.data1 = NULL;
	}
	userdef.len1 = 0;
	userdef.type2 = userdef.type3 = NONE_PAR;
	userdef.data2 = userdef.data3 = NULL;
	userdef.len2 = userdef.len3 = 0;
	Auo_boxed(&tree[ED_CYCLE_BUBBLE], AUO_GETVAL, &userdef.bubble);
	if (Ast_isEmpty(userdef.bubble))
		userdef.bubble = NULL;
	Auo_boxed(&tree[ED_CYCLE_CONTEXT], AUO_GETVAL, &userdef.context);
	if (Ast_isEmpty(userdef.context))
		userdef.context = NULL;
	data.interface->set(&userdef, ACSblk->gl_wbox * 6, ACSblk->gl_hbox);
	edcyc_abort();
}

/* -------------------------------------------------------------------------- */

static void edcyc_outcol(void)
{
	int32 *parm;
	int16 color;
	
	parm = &ACSblk->ev_object[ED_CYCLE_SAMPLE].ob_spec.auserblk->ub_parm;
	color = oe_colsel((int)(*parm & ACS_CYCLE_OUTCOL), ED_CYCLE_OUT_COLOR_BOX, ED_CYCLE_OUT_COLOR_POPUP, ED_CYCLE_OUT_COLOR);
	if (color >= 0)
	{
		*parm = (*parm & ~ACS_CYCLE_OUTCOL) | color;
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_CYCLE_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edcyc_incol(void)
{
	int32 *parm;
	int16 color;
	
	parm = &ACSblk->ev_object[ED_CYCLE_SAMPLE].ob_spec.auserblk->ub_parm;
	if ((color = oe_colsel((int)(*parm >> 4) & 15, ED_CYCLE_IN_COLOR_BOX, ED_CYCLE_IN_COLOR_POPUP, ED_CYCLE_IN_COLOR)) >= 0)
	{
		*parm = (*parm & ~ACS_CYCLE_INCOL) | (color << 4);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_CYCLE_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edcyc_prepair(void)
{
	AUSERBLK *user;
	char *text;
	char boxchar[2];
	Awiob ob;
	
	user = ACSblk->ev_window->work[ED_CYCLE_SAMPLE].ob_spec.auserblk;
	Aob_gettext(ACSblk->ev_window->work, ED_CYCLE_CHAR, boxchar);
	user->ub_parm = (user->ub_parm & 0xff) + (((int32)boxchar[0] & 0xffL) << 8);
	if (ACSblk->ev_window->work[ED_CYCLE_3D].ob_state & OS_SELECTED)
		user->ub_parm |= 0x10000L;
	Auo_boxed(&ACSblk->ev_window->work[ED_CYCLE_TEXT], AUO_GETVAL, &text);
	ob.window = ACSblk->ev_window;
	ob.entry = &ACSblk->ev_window->work[ED_CYCLE_SAMPLE];
	ob.obnr = ED_CYCLE_SAMPLE;
	user->ub_serv(&ACSblk->ev_window->work[ED_CYCLE_SAMPLE], AUO_SELF, &ob);
	user->ub_serv(&ACSblk->ev_window->work[ED_CYCLE_SAMPLE], AUO_CYCPOPUP, text);
	user->ub_serv(&ACSblk->ev_window->work[ED_CYCLE_SAMPLE], AUO_UPDATE, NULL);
}
