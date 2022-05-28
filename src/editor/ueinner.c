#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"

static void edin_dither(void);
static void edin_incol(void);
static void edin_intercol(void);
static void edin_outcol(void);
static void edin_pattern(void);
static void edin_pos(void);
static void edin_size(void);
static void edin_textcol(void);
static void edin_abort(void);
static void edin_ok(void);
static void edin_font_sel(void);
static void edin_effect(void);

#include "ueinner.ah"
#include "ueinner.h"

static void edin_minsize(AUSERBLK *user, int16 *w, int16 *h);
static OBJECT *edin_object_tree(AUSER_DEF *user, OBJECT *obj);
static void edin_test_it(AUSER_DEF *user, AUSERBLK *userblk);

static AUSERBLK INNER1 = { A_innerframe, 0x18008f19L, Auo_string, "Titel", NULL, NULL, NULL, NULL };
static AUSERBLK INNER2 = { A_innerframe, 0x10008f19L, Auo_string, "Titel", NULL, NULL, NULL, NULL };

static OBJECT visual = { -1, -1, -1, G_USERDEF, 0x2001, 0x0010, C_UNION(&INNER1), 0, 0, 10, 2 };
static OBJECT logical = { -1, -1, -1, G_USERDEF, 0x0040, 0x0000, C_UNION(&INNER2), 0, 0, 7, 2 };

static AUSER_DEF aud = { "0x10008f19L", "Auo_string", STR_PAR, "Titel", 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static UODATAS data = {
	"A_innerframe",
	edin_object_tree,
	edin_test_it,
	edin_ok,
	Aob_delete,
	&visual,
	&logical,
	&aud,
	edin_minsize,
	NULL,
	title,
	help_title,
	NULL
};

static char parm[32];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void edin_dither(void)
{
	int32 *parm;
	
	parm = &ACSblk->ev_object[ED_INNER_SAMPLE].ob_spec.auserblk->ub_parm;
	*parm &= ~ACS_INNER_DITHER;
	if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & OS_SELECTED)
		*parm |= ACS_INNER_DITHER;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ACSblk->ev_obnr, -1);
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_INNER_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edin_incol(void)
{
	int16 color;
	int32 *parm;
	
	parm = &ACSblk->ev_object[ED_INNER_SAMPLE].ob_spec.auserblk->ub_parm;
	if ((color = oe_colsel((int)((*parm >> 16) & 15), ED_INNER_INCOL_BOX, ED_INNER_INCOL_POPUP, ED_INNER_INCOL)) >= 0)
	{
		*parm = (*parm & ~ACS_INNER_INCOL) | ((long)color << 16);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_INNER_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edin_intercol(void)
{
	int16 color;
	int32 *parm;
	
	parm = &ACSblk->ev_object[ED_INNER_SAMPLE].ob_spec.auserblk->ub_parm;
	if ((color = oe_colsel((int)((*parm >> 12) & 15), ED_INNER_INTERCOL_BOX, ED_INNER_INTERCOL_POPUP, ED_INNER_INTERCOL)) >= 0)
	{
		*parm = (*parm & ~ACS_INNER_INTERCOL) | ((long)color << 12);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_INNER_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edin_outcol(void)
{
	int16 color;
	int32 *parm;
	
	parm = &ACSblk->ev_object[ED_INNER_SAMPLE].ob_spec.auserblk->ub_parm;
	if ((color = oe_colsel((int)((*parm) & 15), ED_INNER_OUTCOL_BOX, ED_INNER_OUTCOL_POPUP, ED_INNER_OUTCOL)) >= 0)
	{
		*parm = (*parm & ~ACS_INNER_OUTCOL) | ((long)color);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_INNER_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edin_pattern(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	int32 *parm;
	
	popup = Aob_create(&POP_PATSEL);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_INNER_STYLE_BOX);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		popup[(int)((ACSblk->ev_object[ED_INNER_SAMPLE].ob_spec.auserblk->ub_parm >> 9) & 7) + 1].ob_state |= OS_CHECKED;
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			sel--;
			parm = &ACSblk->ev_object[ED_INNER_SAMPLE].ob_spec.auserblk->ub_parm;
			*parm = (*parm & ~ACS_INNER_PATTERN) | ((long)sel << 9);
			ACSblk->ev_object[ED_INNER_STYLE_BOX].ob_spec.obspec.fillpattern = sel;
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_INNER_STYLE_BOX, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_INNER_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edin_pos(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	int32 *parm;
	
	popup = Aob_create(&POP_POSSEL);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_INNER_POS_BOX);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			sel -= 2;
			parm = &ACSblk->ev_object[ED_INNER_SAMPLE].ob_spec.auserblk->ub_parm;
			*parm &= ~ACS_INNER_POS;
			switch (sel)
			{
			case 0:
				Aob_puttext(ACSblk->ev_object, ED_INNER_POS_POPUP, POS_TEXT0);
				break;
			case 1:
				*parm |= ACS_INNER_POS_TOPMID;
				Aob_puttext(ACSblk->ev_object, ED_INNER_POS_POPUP, POS_TEXT1);
				break;
			case 2:
				*parm |= ACS_INNER_POS_TOPRIGHT;
				Aob_puttext(ACSblk->ev_object, ED_INNER_POS_POPUP, POS_TEXT2);
				break;
			case 3:
				*parm |= ACS_INNER_POS_BOTLEFT;
				Aob_puttext(ACSblk->ev_object, ED_INNER_POS_POPUP, POS_TEXT3);
				break;
			case 4:
				*parm |= ACS_INNER_POS_BOTMID;
				Aob_puttext(ACSblk->ev_object, ED_INNER_POS_POPUP, POS_TEXT4);
				break;
			case 5:
				*parm |= ACS_INNER_POS_BOTRIGHT;
				Aob_puttext(ACSblk->ev_object, ED_INNER_POS_POPUP, POS_TEXT5);
				break;
			}
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_INNER_POS_POPUP, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_INNER_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edin_size(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	int32 *parm;
	
	popup = Aob_create(&POP_SIZESEL);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_INNER_SIZE_BOX);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		popup[(int)((ACSblk->ev_object[ED_INNER_SAMPLE].ob_spec.auserblk->ub_parm >> 27) & 1) + 1].ob_state |= OS_CHECKED;
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			parm = &ACSblk->ev_object[ED_INNER_SAMPLE].ob_spec.auserblk->ub_parm;
			if (sel == 1)
			{
				*parm &= ~ACS_INNER_SMALL;
				Aob_puttext(ACSblk->ev_object, ED_INNER_SIZE_POPUP, SIZE_TEXT0);
			} else
			{
				*parm |= ACS_INNER_SMALL;
				Aob_puttext(ACSblk->ev_object, ED_INNER_SIZE_POPUP, SIZE_TEXT1);
			}
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_INNER_SIZE_POPUP, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_INNER_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void edin_textcol(void)
{
	int16 color;
	int32 *parm;
	
	parm = &ACSblk->ev_object[ED_INNER_SAMPLE].ob_spec.auserblk->ub_parm;
	if ((color = oe_colsel((int)((*parm >> 4) & 15), ED_INNER_TEXTCOL_BOX, ED_INNER_TEXTCOL_POPUP, ED_INNER_TEXTCOL)) >= 0)
	{
		*parm = (*parm & ~ACS_INNER_TEXTCOL) | ((long)color << 4);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_INNER_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

void init_inner(Awindow *win)
{
	win->service(win, AS_ACS_PART_ADD, &data);
}

/* -------------------------------------------------------------------------- */

static void edin_minsize(AUSERBLK *user, int16 *w, int16 *h)
{
	int len;
	
	if (user->ub_ptr1 != NULL)
		len = ((int)strlen(user->ub_ptr1) + 2) * ACSblk->gl_wbox;
	else
		len = ACSblk->gl_wbox * 2;
	*w = len;
	*h = ACSblk->gl_hbox;
}

/* -------------------------------------------------------------------------- */

static OBJECT *edin_object_tree(AUSER_DEF *userdef, OBJECT *edit)
{
	OBJECT *tree;
	OBJECT *ptr;
	AUSERBLK *user;
	long val;
	int16 color;
	
	tree = Aob_create(&ED_INNER);
	if (tree == NULL)
		return NULL;
	ptr = &tree[ED_INNER_SAMPLE];
	ptr->ob_flags |= edit->ob_flags & (OF_RBUTTON | OF_DEFAULT | OF_EXIT);
	ptr->ob_state |= edit->ob_state & (OS_SELECTED | OS_CROSSED | OS_CHECKED | OS_DISABLED | OS_OUTLINED | OS_SHADOWED);
	oe_beself(ACSblk->ev_window, tree, ED_INNER_TEXT);
	oe_beself(ACSblk->ev_window, tree, ED_INNER_BUBBLE);
	oe_beself(ACSblk->ev_window, tree, ED_INNER_CONTEXT);
	user = ptr->ob_spec.auserblk;
	sscanf(userdef->parm, "0x%lxL", &val);
	user->ub_parm = val;
	
	if (userdef->type1 == STR_PAR)
	{
		Aob_puttext(tree, ED_INNER_TEXT, userdef->data1);
	} else
	{
		user->ub_serv(ptr, AUO_SETVAL, "");
		Aob_puttext(tree, ED_INNER_TEXT, "");
	}
	if ((val >> 28) & 1) /* val & ACS_INNER_DITHER */
		tree[ED_INNER_DITHER].ob_state |= OS_SELECTED;
	else
		tree[ED_INNER_DITHER].ob_state &= ~OS_SELECTED;
	
	color = (int)((val >> 16) & 15);
	Aob_puttext(tree, ED_INNER_INCOL_POPUP, colour_text[color]);
	tree[ED_INNER_INCOL].ob_spec.obspec.interiorcol = color;

	color = (int)(val & ACS_INNER_OUTCOL);
	Aob_puttext(tree, ED_INNER_OUTCOL_POPUP, colour_text[color]);
	tree[ED_INNER_OUTCOL].ob_spec.obspec.interiorcol = color;
	
	color = (int)((val >> 12) & 15);
	Aob_puttext(tree, ED_INNER_INTERCOL_POPUP, colour_text[color]);
	tree[ED_INNER_INTERCOL].ob_spec.obspec.interiorcol = color;
	
	color = (int)((val >> 9) & 7);
	tree[ED_INNER_STYLE_BOX].ob_spec.obspec.fillpattern = color;
	
	color = (int)((val >> 24) & 7);
	switch (color)
	{
	case 0:
		Aob_puttext(tree, ED_INNER_POS_POPUP, POS_TEXT0);
		break;
	case 1:
		Aob_puttext(tree, ED_INNER_POS_POPUP, POS_TEXT1);
		break;
	case 2:
		Aob_puttext(tree, ED_INNER_POS_POPUP, POS_TEXT2);
		break;
	case 4:
		Aob_puttext(tree, ED_INNER_POS_POPUP, POS_TEXT3);
		break;
	case 5:
		Aob_puttext(tree, ED_INNER_POS_POPUP, POS_TEXT4);
		break;
	case 6:
		Aob_puttext(tree, ED_INNER_POS_POPUP, POS_TEXT5);
		break;
	}
	
	if (val & ACS_INNER_SMALL)
		Aob_puttext(tree, ED_INNER_SIZE_POPUP, SIZE_TEXT1);
	else
		Aob_puttext(tree, ED_INNER_SIZE_POPUP, SIZE_TEXT0);
		
	color = (int)((val >> 4) & 15);
	Aob_puttext(tree, ED_INNER_TEXTCOL_POPUP, colour_text[color]);
	tree[ED_INNER_TEXTCOL].ob_spec.obspec.interiorcol = color;
	
	user->bubble = tree[ED_INNER_BUBBLE].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->bubble))
		Aob_puttext(tree, ED_INNER_BUBBLE, "");
	else
		Aob_puttext(tree, ED_INNER_BUBBLE, userdef->bubble);
	user->context = tree[ED_INNER_CONTEXT].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->context))
		Aob_puttext(tree, ED_INNER_CONTEXT, "");
	else
		Aob_puttext(tree, ED_INNER_CONTEXT, userdef->context);
	return tree;
}

/* -------------------------------------------------------------------------- */

static void edin_test_it(AUSER_DEF *userdef, AUSERBLK *userblk)
{
	userblk->ub_code = A_innerframe;
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

static void edin_abort(void)
{
	AUSERBLK *userblk;
	
	userblk = ACSblk->ev_window->work[ED_INNER_SAMPLE].ob_spec.auserblk;
	userblk->bubble = NULL;
	userblk->context = NULL;
	data.interface->abort();
}

/* -------------------------------------------------------------------------- */

static void edin_ok(void)
{
	OBJECT *tree;
	AUSER_DEF userdef;
	char *text;
	AUSERBLK *auser;
	int len;
	
	tree = ACSblk->ev_window->work;
	auser = tree[ED_INNER_SAMPLE].ob_spec.auserblk;
	
	sprintf(parm, "0x%lxL", (long)auser->ub_parm);
	userdef.parm = parm;
	userdef.serv = "Auo_string";
	Auo_boxed(&tree[ED_INNER_TEXT], AUO_GETVAL, &text);
	if (*text != '\0')
	{
		len = ((int)strlen(text) + 2) * ACSblk->gl_wbox;
		userdef.type1 = STR_PAR;
		userdef.data1 = text;
	} else
	{
		len = ACSblk->gl_wbox * 2;
		userdef.type1 = NONE_PAR;
		userdef.data1 = NULL;
	}
	userdef.len1 = 0;
	userdef.type2 = userdef.type3 = NONE_PAR;
	userdef.data2 = userdef.data3 = NULL;
	userdef.len2 = userdef.len3 = 0;
	Auo_boxed(&tree[ED_INNER_BUBBLE], AUO_GETVAL, &userdef.bubble);
	if (Ast_isEmpty(userdef.bubble))
		userdef.bubble = NULL;
	Auo_boxed(&tree[ED_INNER_CONTEXT], AUO_GETVAL, &userdef.context);
	if (Ast_isEmpty(userdef.context))
		userdef.context = NULL;
	data.interface->set(&userdef, len, ACSblk->gl_hbox);
	edin_abort();
}
