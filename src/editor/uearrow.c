#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"

static void edar_3d(void);
static void edar_arr(void);
static void edar_col(void);
static void edar_ends(void);
static void edar_fat(void);
static void edar_len(void);
static void edar_style(void);
static void edar_abort(void);
static void edar_ok(void);

#include "uearrow.ah"
#include "uearrow.h"

static void edar_minsize(AUSERBLK *user, int16 *w, int16 *h);
static OBJECT *edar_object_tree(AUSER_DEF *user, OBJECT *obj);
static void edar_test_it(AUSER_DEF *user, AUSERBLK *userblk);

static AUSERBLK arrow = { A_arrows, 0x22510001L, NULL, NULL, NULL, NULL, NULL, NULL };
static AUSERBLK disline = { A_arrows, 0x22090001L, NULL, NULL, NULL, NULL, NULL, NULL };

static OBJECT visual = { -1, -1, -1, G_USERDEF, 0x2001, 0x0000, C_UNION(&arrow), 0, 0, 10, 1 };
static OBJECT logical = { -1, -1, -1, G_USERDEF, 0x0000, 0x0000, C_UNION(&arrow), 0, 0, 4, 1 };
static OBJECT disvisual = { -1, -1, -1, G_USERDEF, 0x2001, 0x0000, C_UNION(&disline), 0, 0, 10, 1 };
static OBJECT dislogical = { -1, -1, -1, G_USERDEF, 0x0000, 0x0108, C_UNION(&disline), 0, 0, 4, 1 };

static AUSER_DEF aud = { "0x22510001L", NULL, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static AUSER_DEF disaud = { "0x22090001L", NULL, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static UODATAS data = {
	"A_arrows",
	edar_object_tree,
	edar_test_it,
	edar_ok,
	Aob_delete,
	&visual,
	&logical,
	&aud,
	edar_minsize,
	NULL,
	title,
	help_title,
	NULL
};
static UODATAS disdata = {
	"A_arrows",
	edar_object_tree,
	edar_test_it,
	edar_ok,
	Aob_delete,
	&disvisual,
	&dislogical,
	&disaud,
	edar_minsize,
	NULL,
	title,
	help_title,
	NULL
};

static char parm[32];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edar_3d(void)
{
	AUSERBLK *user;
	
	user = ACSblk->ev_object[ED_ARROW_SAMPLE].ob_spec.auserblk;
	user->ub_parm ^= ACS_ARROW_3D;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_ARROW_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edar_arr(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	int32 *parm;
	int32 *selparm;
	
	popup = Aob_create(&POP_ARR);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_ARROW_DIR_BOX);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			parm = &ACSblk->ev_object[ED_ARROW_SAMPLE].ob_spec.auserblk->ub_parm;
			selparm = &popup[sel].ob_spec.auserblk->ub_parm;
			switch (sel)
			{
			case 1:
			case 3:
			case 5:
			case 7:
				*parm = (*parm & ~ACS_ARROW_DIR_START) | (*selparm & ACS_ARROW_DIR_START);
				ACSblk->ev_object[ED_ARROW_DIR_START].ob_spec.auserblk->ub_parm = *selparm;
				break;
			case 2:
			case 4:
			case 6:
			case 8:
				*parm = (*parm & ~ACS_ARROW_DIR_END) | (*selparm & ACS_ARROW_DIR_END);
				ACSblk->ev_object[ED_ARROW_DIR_END].ob_spec.auserblk->ub_parm = *selparm;
				break;
			}
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_ARROW_DIR_BOX, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_ARROW_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edar_col(void)
{
	int32 *parm;
	int16 color;
	
	parm = &ACSblk->ev_object[ED_ARROW_SAMPLE].ob_spec.auserblk->ub_parm;
	if ((color = oe_colsel((int)*parm & 15, ED_ARROW_COLOR_BOX, ED_ARROW_COLOR_POPUP, ED_ARROW_COLOR)) >= 0)
	{
		*parm = (*parm & ~ACS_ARROW_COLOR) | color;
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_ARROW_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edar_ends(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	int32 *parm;
	
	popup = Aob_create(&POP_END);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_ARROW_END_BOX);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			parm = &ACSblk->ev_object[ED_ARROW_SAMPLE].ob_spec.auserblk->ub_parm;
			switch (sel)
			{
			case 1:
				*parm = *parm & ~ACS_ARROW_END_START;
				break;
			case 2:
				*parm = *parm & ~ACS_ARROW_END_END;
				break;
			case 3:
				*parm = (*parm & ~ACS_ARROW_END_START) | 0x00100000L;
				break;
			case 4:
				*parm = (*parm & ~ACS_ARROW_END_END) | 0x00400000L;
				break;
			}
			switch (sel)
			{
			case 1:
			case 3:
				ACSblk->ev_object[ED_ARROW_END_START].ob_spec.auserblk->ub_parm = popup[sel].ob_spec.auserblk->ub_parm;
				break;
			case 2:
			case 4:
				ACSblk->ev_object[ED_ARROW_END_END].ob_spec.auserblk->ub_parm = popup[sel].ob_spec.auserblk->ub_parm;
				break;
			}
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_ARROW_END_BOX, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_ARROW_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edar_fat(void)
{
	ACSblk->ev_object[ED_ARROW_SAMPLE].ob_spec.auserblk->ub_parm ^= ACS_ARROW_FAT;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_ARROW_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edar_len(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	int32 *parm;
	
	popup = Aob_create(&POP_LEN);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_ARROW_LEN_BOX);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			parm = &ACSblk->ev_object[ED_ARROW_SAMPLE].ob_spec.auserblk->ub_parm;
			switch (sel)
			{
			case 1:
				*parm &= ~ACS_ARROW_LEN_START;
				break;
			case 2:
				*parm &= ~ACS_ARROW_LEN_END;
				break;
			case 3:
				*parm |= ACS_ARROW_LEN_START;
				break;
			case 4:
				*parm |= ACS_ARROW_LEN_END;
				break;
			}
			switch (sel)
			{
			case 1:
			case 3:
				ACSblk->ev_object[ED_ARROW_LEN_START].ob_spec.auserblk->ub_parm = popup[sel].ob_spec.auserblk->ub_parm;
				break;
			case 2:
			case 4:
				ACSblk->ev_object[ED_ARROW_LEN_END].ob_spec.auserblk->ub_parm = popup[sel].ob_spec.auserblk->ub_parm;
				break;
			}
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_ARROW_LEN_BOX, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_ARROW_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edar_style(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	int32 *parm;
	
	popup = Aob_create(&POP_STYLESEL);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_ARROW_STYLE_BOX);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			parm = &ACSblk->ev_object[ED_ARROW_SAMPLE].ob_spec.auserblk->ub_parm;
			*parm = (*parm & ~ACS_ARROW_STYLE) | ((long)sel << 16);
			parm = &ACSblk->ev_object[ED_ARROW_STYLE].ob_spec.auserblk->ub_parm;
			*parm = (*parm & ~ACS_ARROW_STYLE) | ((long)sel << 16);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_ARROW_STYLE_BOX, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_ARROW_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

void init_arrow(Awindow *win)
{
	win->service(win, AS_ACS_PART_ADD, &data);
	win->service(win, AS_ACS_PART_ADD, &disdata);
}

/* -------------------------------------------------------------------------- */

static void edar_minsize(AUSERBLK *user, int16 *w, int16 *h)
{
	UNUSED(user);
	*w = ACSblk->gl_wbox * 2;
	*h = ACSblk->gl_hbox;
}

/* -------------------------------------------------------------------------- */

static OBJECT *edar_object_tree(AUSER_DEF *userdef, OBJECT *edit)
{
	OBJECT *tree;
	OBJECT *ptr;
	AUSERBLK *user;
	long val;
	int32 *parm;
	
	tree = Aob_create(&ED_ARROW);
	if (tree == NULL)
		return NULL;
	ptr = &tree[ED_ARROW_SAMPLE];
	ptr->ob_flags |= edit->ob_flags & (OF_RBUTTON | OF_DEFAULT | OF_EXIT);
	ptr->ob_state |= edit->ob_state & (OS_SELECTED | OS_CROSSED | OS_CHECKED | OS_DISABLED | OS_OUTLINED | OS_SHADOWED);
	user = ptr->ob_spec.auserblk;
	oe_beself(ACSblk->ev_window, tree, ED_ARROW_BUBBLE);
	oe_beself(ACSblk->ev_window, tree, ED_ARROW_CONTEXT);
	sscanf(userdef->parm, "0x%lxL", &val);
	user->ub_parm = val;
	parm = &tree[ED_ARROW_SAMPLE_BOX].ob_spec.userblk->ub_parm;
	*parm &= ~ACS_BUTTON_COLOR;
	if (((int)val & ACS_ARROW_COLOR) == G_WHITE)
		*parm |= G_BLACK;
	else
		*parm |= G_WHITE;
		
	Aob_puttext(tree, ED_ARROW_COLOR_POPUP, colour_text[(int)((val) & ACS_ARROW_COLOR)]);
	tree[ED_ARROW_COLOR].ob_spec.obspec.interiorcol = (int)((val) & ACS_ARROW_COLOR);

	parm = &tree[ED_ARROW_DIR_START].ob_spec.userblk->ub_parm;
	switch ((int)(val >> 24) & 7)
	{
	case 0:
	case 4:
		*parm = 0x00110001L;
		break;
	case 1:
	case 5:
		*parm = 0x11110001L;
		break;
	case 2:
	case 6:
		*parm = 0x22110001L;
		break;
	case 3:
	case 7:
		*parm = 0x33110001L;
		break;
	}

	parm = &tree[ED_ARROW_DIR_END].ob_spec.userblk->ub_parm;
	switch ((int)(val >> 28) & 7)
	{
	case 0:
	case 4:
		*parm = 0x00410001L;
		break;
	case 1:
	case 5:
		*parm = 0x11410001L;
		break;
	case 2:
	case 6:
		*parm = 0x22410001L;
		break;
	case 3:
	case 7:
		*parm = 0x33410001L;
		break;
	}

	parm = &tree[ED_ARROW_END_START].ob_spec.userblk->ub_parm;
	*parm = (*parm & ~ACS_ARROW_END_START) | (val & ACS_ARROW_END_START);
	parm = &tree[ED_ARROW_END_END].ob_spec.userblk->ub_parm;
	*parm = (*parm & ~ACS_ARROW_END_END) | (val & ACS_ARROW_END_END);
	
	if (val & ACS_ARROW_FAT)
		tree[ED_ARROW_FAT].ob_state |= OS_SELECTED;
	else
		tree[ED_ARROW_FAT].ob_state &= ~OS_SELECTED;
	
	if (val & ACS_ARROW_3D)
		tree[ED_ARROW_3D].ob_state |= OS_SELECTED;
	else
		tree[ED_ARROW_3D].ob_state &= ~OS_SELECTED;
	
	parm = &tree[ED_ARROW_LEN_START].ob_spec.userblk->ub_parm;
	*parm = (*parm & ~ACS_ARROW_LEN_START) | (val & ACS_ARROW_LEN_START);
	parm = &tree[ED_ARROW_LEN_END].ob_spec.userblk->ub_parm;
	*parm = (*parm & ~ACS_ARROW_LEN_END) | (val & ACS_ARROW_LEN_END);

	parm = &tree[ED_ARROW_STYLE].ob_spec.userblk->ub_parm;
	*parm = (*parm & ~ACS_ARROW_STYLE) | (val & ACS_ARROW_STYLE);

	user->bubble = tree[ED_ARROW_BUBBLE].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->bubble))
		Aob_puttext(tree, ED_ARROW_BUBBLE, "");
	else
		Aob_puttext(tree, ED_ARROW_BUBBLE, userdef->bubble);
	user->context = tree[ED_ARROW_CONTEXT].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->context))
		Aob_puttext(tree, ED_ARROW_CONTEXT, "");
	else
		Aob_puttext(tree, ED_ARROW_CONTEXT, userdef->context);
	return tree;
}

/* -------------------------------------------------------------------------- */

static void edar_test_it(AUSER_DEF *userdef, AUSERBLK *userblk)
{
	userblk->ub_code = A_arrows;
	sscanf(userdef->parm, "0x%lxL", &userblk->ub_parm);
	userblk->ub_serv = userblk->ub_ptr1 = userblk->ub_ptr2 = userblk->ub_ptr3 = NULL;
	userblk->bubble = Ast_isEmpty(userdef->bubble) ? NULL : userdef->bubble;
	userblk->context = Ast_isEmpty(userdef->context) ? NULL : userdef->context;
}

/* -------------------------------------------------------------------------- */

static void edar_abort(void)
{
	AUSERBLK *userblk;
	
	userblk = ACSblk->ev_window->work[ED_ARROW_SAMPLE].ob_spec.auserblk;
	userblk->bubble = NULL;
	userblk->context = NULL;
	data.interface->abort();
}

/* -------------------------------------------------------------------------- */

static void edar_ok(void)
{
	OBJECT *tree;
	AUSER_DEF userdef;
	AUSERBLK *auser;
	
	tree = ACSblk->ev_window->work;
	auser = tree[ED_ARROW_SAMPLE].ob_spec.auserblk;
	
	sprintf(parm, "0x%lxL", auser->ub_parm);
	userdef.parm = parm;
	userdef.serv = "";
	userdef.type1 = userdef.type2 = userdef.type3 = NONE_PAR;
	userdef.data1 = userdef.data2 = userdef.data3 = NULL;
	userdef.len1 = userdef.len2 = userdef.len3 = 0;
	Auo_boxed(&tree[ED_ARROW_BUBBLE], AUO_GETVAL, &userdef.bubble);
	if (Ast_isEmpty(userdef.bubble))
		userdef.bubble = NULL;
	Auo_boxed(&tree[ED_ARROW_CONTEXT], AUO_GETVAL, &userdef.context);
	if (Ast_isEmpty(userdef.context))
		userdef.context = NULL;
	data.interface->set(&userdef, ACSblk->gl_wbox * 2, ACSblk->gl_hbox);
	edar_abort();
}
