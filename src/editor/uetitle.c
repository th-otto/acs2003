#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"

static void edti_ok(void);
static void edti_abort(void);
static void edti_size(void);
static void edti_pos(void);
static void edti_trans(void);
static void edti_replace(void);

#include "uetitle.ah"
#include "uetitle.h"

extern OBJECT POP_SIZESEL;
extern OBJECT POP_HORPOSSEL;

static OBJECT *edti_object_tree(AUSER_DEF *user, OBJECT *obj);
static void edti_test_it(AUSER_DEF *user, AUSERBLK *userblk);
static void edti_minsize(AUSERBLK *user, int16 *w, int16 *h);

static AUSERBLK utitle = { A_title, 0L, Auo_string, "TITEL", NULL, NULL, NULL, NULL };
static OBJECT visual = { -1, -1, -1, G_USERDEF, 0x0000, 0x0000, C_UNION(&utitle), 0, 0, 7, 1 };
static OBJECT logical = { -1, -1, -1, G_USERDEF, 0x0040, 0x0000, C_UNION(&utitle), 0, 0, 7, 1 };
static AUSER_DEF aud = { "0x0L", "Auo_string", STR_PAR, "TITEL", 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static UODATAS data = {
	"A_title",
	edti_object_tree,
	edti_test_it,
	edti_ok,
	Aob_delete,
	&visual,
	&logical,
	&aud,
	edti_minsize,
	NULL,
	title,
	help_title,
	NULL
};

static char parm[32];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edti_pos(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	int32 *parm;
	
	popup = Aob_create(&POP_HORPOSSEL);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_TITLE_HORPOS);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		switch ((int)((ACSblk->ev_object[ED_TITLE_SAMPLE].ob_spec.auserblk->ub_parm) & 3))
		{
		case 0:
			popup[1].ob_state |= OS_CHECKED;
			break;
		case 1:
			popup[2].ob_state |= OS_CHECKED;
			break;
		case 2:
			popup[3].ob_state |= OS_CHECKED;
			break;
		}
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			parm = &ACSblk->ev_object[ED_TITLE_SAMPLE].ob_spec.auserblk->ub_parm;
			*parm &= ~ACS_TITLE_HORPOS;
			switch (sel)
			{
			case 1:
				Aob_puttext(ACSblk->ev_object, ED_TITLE_HORPOS_POPUP, HPOS_TEXT1);
				break;
			case 2:
				*parm |= ACS_TITLE_HORPOS_CENTER;
				Aob_puttext(ACSblk->ev_object, ED_TITLE_HORPOS_POPUP, HPOS_TEXT2);
				break;
			case 3:
				*parm |= ACS_TITLE_HORPOS_RIGHT;
				Aob_puttext(ACSblk->ev_object, ED_TITLE_HORPOS_POPUP, HPOS_TEXT3);
				break;
			}
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TITLE_HORPOS_POPUP, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TITLE_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edti_replace(void)
{
	AUSERBLK *auser;
	
	auser = ACSblk->ev_object[ED_TITLE_SAMPLE].ob_spec.auserblk;
	auser->ub_parm |= ACS_TITLE_TEXTMODE;
	Awi_obredraw(ACSblk->ev_window, ED_TITLE_SAMPLE);
}

/* -------------------------------------------------------------------------- */

static void edti_size(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	int32 *parm;
	
	popup = Aob_create(&POP_SIZESEL);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_TITLE_SIZE);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		popup[(int)((ACSblk->ev_object[ED_TITLE_SAMPLE].ob_spec.auserblk->ub_parm >> 2) & 1) + 1].ob_state |= OS_CHECKED;
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			parm = &ACSblk->ev_object[ED_TITLE_SAMPLE].ob_spec.auserblk->ub_parm;
			if (sel == 1)
			{
				*parm &= ~ACS_TITLE_SMALL;
				Aob_puttext(ACSblk->ev_object, ED_TITLE_SIZE_POPUP, SIZE_TEXT0);
			} else
			{
				*parm |= ACS_TITLE_SMALL;
				Aob_puttext(ACSblk->ev_object, ED_TITLE_SIZE_POPUP, SIZE_TEXT1);
			}
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TITLE_SIZE_POPUP, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_TITLE_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edti_trans(void)
{
	AUSERBLK *auser;
	
	auser = ACSblk->ev_object[ED_TITLE_SAMPLE].ob_spec.auserblk;
	auser->ub_parm &= ~ACS_TITLE_TEXTMODE;
	Awi_obredraw(ACSblk->ev_window, ED_TITLE_SAMPLE);
}

/* -------------------------------------------------------------------------- */

void init_title(Awindow *win)
{
	win->service(win, AS_ACS_PART_ADD, &data);
}

/* -------------------------------------------------------------------------- */

static void edti_minsize(AUSERBLK *user, int16 *w, int16 *h)
{
	char *str;
	
	str = user->ub_ptr1;
	/* BUG: user->ub_ptr1 can be NULL */
	*w = (int)strlen(str) * ACSblk->gl_wbox;
	*h = ACSblk->gl_hbox;
}

/* -------------------------------------------------------------------------- */

static OBJECT *edti_object_tree(AUSER_DEF *userdef, OBJECT *edit)
{
	OBJECT *tree;
	OBJECT *ptr;
	AUSERBLK *user;
	long val;
	
	tree = Aob_create(&ED_TITLE.root);
	if (tree == NULL)
		return NULL;
	ptr = &tree[ED_TITLE_SAMPLE];
	ptr->ob_flags |= edit->ob_flags & (OF_RBUTTON | OF_DEFAULT | OF_EXIT);
	ptr->ob_state |= edit->ob_state & (OS_SELECTED | OS_CROSSED | OS_CHECKED | OS_DISABLED | OS_OUTLINED | OS_SHADOWED);

	oe_beself(ACSblk->ev_window, tree, ED_TITLE_TEXT);
	oe_beself(ACSblk->ev_window, tree, ED_TITLE_SAMPLE);
	oe_beself(ACSblk->ev_window, tree, ED_TITLE_BUBBLE);
	oe_beself(ACSblk->ev_window, tree, ED_TITLE_CONTEXT);

	user = ptr->ob_spec.auserblk;
	sscanf(userdef->parm, "0x%lxL", &val);
	user->ub_parm = val;
	if (userdef->type1 == STR_PAR)
	{
		Aob_puttext(tree, ED_TITLE_TEXT, userdef->data1);
	} else
	{
		user->ub_serv(ptr, AUO_SETVAL, "");
		Aob_puttext(tree, ED_TITLE_TEXT, "");
	}

	if (val & ACS_TITLE_SMALL)
		Aob_puttext(tree, ED_TITLE_SIZE_POPUP, SIZE_TEXT1);
	else
		Aob_puttext(tree, ED_TITLE_SIZE_POPUP, SIZE_TEXT0);
		
	switch ((int16)((val) & ACS_TITLE_HORPOS))
	{
	case ACS_TITLE_HORPOS_LEFT:
		Aob_puttext(tree, ED_TITLE_HORPOS_POPUP, HPOS_TEXT1);
		break;
	case ACS_TITLE_HORPOS_CENTER:
		Aob_puttext(tree, ED_TITLE_HORPOS_POPUP, HPOS_TEXT2);
		break;
	case ACS_TITLE_HORPOS_RIGHT:
		Aob_puttext(tree, ED_TITLE_HORPOS_POPUP, HPOS_TEXT3);
		break;
	}
	
	user->bubble = tree[ED_TITLE_BUBBLE].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->bubble))
		Aob_puttext(tree, ED_TITLE_BUBBLE, "");
	else
		Aob_puttext(tree, ED_TITLE_BUBBLE, userdef->bubble);
	user->context = tree[ED_TITLE_CONTEXT].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->context))
		Aob_puttext(tree, ED_TITLE_CONTEXT, "");
	else
		Aob_puttext(tree, ED_TITLE_CONTEXT, userdef->context);

	return tree;
}

/* -------------------------------------------------------------------------- */

static void edti_test_it(AUSER_DEF *userdef, AUSERBLK *userblk)
{
	userblk->ub_code = A_title;
	sscanf(userdef->parm, "0x%lxL", (long *)&userblk->ub_parm);
	userblk->ub_serv = Auo_string;
	if (userdef->type1 == STR_PAR)
		userblk->ub_ptr1 = userdef->data1;
	else
		userblk->ub_ptr1 = NULL;
	userblk->ub_ptr2 = userblk->ub_ptr3 = NULL;
	userblk->bubble = Ast_isEmpty(userdef->bubble) ? NULL : userdef->bubble;
	userblk->context = Ast_isEmpty(userdef->context) ? NULL : userdef->context;
}

/* -------------------------------------------------------------------------- */

static void edti_abort(void)
{
	AUSERBLK *userblk;
	
	userblk = ACSblk->ev_window->work[ED_TITLE_SAMPLE].ob_spec.auserblk;
	userblk->bubble = NULL;
	userblk->context = NULL;
	data.interface->abort();
}

/* -------------------------------------------------------------------------- */

static void edti_ok(void)
{
	OBJECT *tree;
	AUSER_DEF userdef;
	char *text;
	AUSERBLK *auser;
	int width;
	
	tree = ACSblk->ev_window->work;
	auser = tree[ED_TITLE_SAMPLE].ob_spec.auserblk;
	
	sprintf(parm, "0x%lxL", (long)auser->ub_parm);
	userdef.parm = parm;
	userdef.serv = "Auo_string";
	Auo_boxed(&tree[ED_TITLE_TEXT], AUO_GETVAL, &text);
	width = (int)((strlen(text) + 3) * ACSblk->gl_wbox); /* FIXME: misplaced cast */
	userdef.type1 = STR_PAR;
	userdef.data1 = text;
	userdef.len1 = 0;
	userdef.type2 = userdef.type3 = NONE_PAR;
	userdef.data2 = userdef.data3 = NULL;
	userdef.len2 = userdef.len3 = 0;
	Auo_boxed(&tree[ED_TITLE_BUBBLE], AUO_GETVAL, &userdef.bubble);
	if (Ast_isEmpty(userdef.bubble))
		userdef.bubble = NULL;
	Auo_boxed(&tree[ED_TITLE_CONTEXT], AUO_GETVAL, &userdef.context);
	if (Ast_isEmpty(userdef.context))
		userdef.context = NULL;
	data.interface->set(&userdef, width, ACSblk->gl_hbox);
	edti_abort();
}
