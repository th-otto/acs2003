#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"

static void edbe_abort(void);
static void edbe_ok(void);
static void edbe_3d(void);
static void edbe_autobig(void);
static void edbe_secret(void);
static void edbe_incol(void);
static void edbe_outcol(void);
static void edbe_size(void);
static void edbe_mask(void);
static void edbe_textcol(void);

#include "ueboxed.ah"
#include "ueboxed.h"

static void edbe_minsize(AUSERBLK *user, int16 *w, int16 *h);
static OBJECT *edbe_object_tree(AUSER_DEF *user, OBJECT *obj);
static void edbe_test_it(AUSER_DEF *user, AUSERBLK *userblk);

union beunion {
	beparm parm;
	int32 val;
};

static const char *const masklist[] = {
	PMT00,
	PMT01,
	PMT02,
	PMT03,
	PMT04,
	PMT05,
	PMT06,
	PMT07,
	PMT08,
	PMT09,
	PMT10,
	PMT11,
	PMT12,
	PMT13,
	PMT14,
	PMT15,
	PMT16,
	PMT17,
	PMT18,
	PMT19,
	PMT20,
	PMT21,
	PMT22,
	PMT23,
	PMT24,
	PMT25,
	PMT26,
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	""
};
static AUSERBLK DB1 = { A_boxed, 0x9038ff12L, Auo_boxed, "BoxEdit", NULL, NULL, NULL, NULL };

static OBJECT visual = { -1, -1, -1, G_USERDEF, 0x2005, 0x0010, C_UNION(&DB1), 0, 0, 10, 1 };
static OBJECT logical = { -1, -1, -1, G_USERDEF, 0x0008, 0x0010, C_UNION(&DB1), 0, 0, 10, 1 };

static AUSER_DEF aud = { "0x9038ff12L", "Auo_boxed", STR_PAR, "Text", 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static UODATAS data = {
	"A_boxed",
	edbe_object_tree,
	edbe_test_it,
	edbe_ok,
	Aob_delete,
	&visual,
	&logical,
	&aud,
	edbe_minsize,
	NULL,
	title,
	help_title,
	NULL
};

static char parm[34];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void init_boxed(Awindow *win)
{
	win->service(win, AS_ACS_PART_ADD, &data);
}

/* -------------------------------------------------------------------------- */

static void edbe_minsize(AUSERBLK *user, int16 *w, int16 *h)
{
	int minw;
	
	if (user->ub_ptr1 != NULL)
		minw = (int)strlen(user->ub_ptr1) * ACSblk->gl_wbox;
	else
		minw = ACSblk->gl_wbox;
	*w = minw;
	*h = ACSblk->gl_hbox;
}

/* -------------------------------------------------------------------------- */

static OBJECT *edbe_object_tree(AUSER_DEF *userdef, OBJECT *edit)
{
	OBJECT *tree;
	OBJECT *ptr;
	AUSERBLK *user;
	char buf[10];
	long parm;
	beparm *spec;
	beparm *betext;
	
	tree = Aob_create(&ED_BOXED);
	if (tree != NULL)
	{
		/* BUG? no call to Aob_fix here */
		ptr = &tree[ED_BOXED_SAMPLE];
		ptr->ob_flags |= edit->ob_flags & (OF_RBUTTON | OF_DEFAULT | OF_EXIT);
		ptr->ob_state |= edit->ob_state & (OS_SELECTED | OS_CROSSED | OS_CHECKED | OS_DISABLED | OS_OUTLINED | OS_SHADOWED);
		user = ptr->ob_spec.auserblk;
		sscanf(userdef->parm, "0x%lxL", &parm);
		user->ub_parm = parm;
		spec = (beparm *)&user->ub_parm;
		oe_beself(ACSblk->ev_window, tree, ED_BOXED_LENGTH);
		oe_beself(ACSblk->ev_window, tree, ED_BOXED_TEXT);
		oe_beself(ACSblk->ev_window, tree, ED_BOXED_SAMPLE);
		oe_beself(ACSblk->ev_window, tree, ED_BOXED_BUBBLE);
		oe_beself(ACSblk->ev_window, tree, ED_BOXED_CONTEXT);
		betext = (beparm *)&tree[ED_BOXED_TEXT].ob_spec.auserblk->ub_parm;
		betext->mask = spec->mask;
		if (userdef->type1 == STR_PAR)
		{
			Aob_puttext(tree, ED_BOXED_SAMPLE, userdef->data1);
			Aob_puttext(tree, ED_BOXED_TEXT, userdef->data1);
		} else
		{
			Aob_puttext(tree, ED_BOXED_SAMPLE, "");
			Aob_puttext(tree, ED_BOXED_TEXT, "");
		}
		user->bubble = tree[ED_BOXED_BUBBLE].ob_spec.auserblk->ub_ptr1;
		if (Ast_isEmpty(userdef->bubble))
			Aob_puttext(tree, ED_BOXED_BUBBLE, "");
		else
			Aob_puttext(tree, ED_BOXED_BUBBLE, userdef->bubble);
		user->context = tree[ED_BOXED_CONTEXT].ob_spec.auserblk->ub_ptr1;
		if (Ast_isEmpty(userdef->context))
			Aob_puttext(tree, ED_BOXED_CONTEXT, "");
		else
			Aob_puttext(tree, ED_BOXED_CONTEXT, userdef->context);

		Aob_puttext(tree, ED_BOXED_TEXTCOL_POPUP, colour_text[spec->textcol]);
		tree[ED_BOXED_TEXTCOL].ob_spec.obspec.interiorcol = spec->textcol;
		
		Aob_puttext(tree, ED_BOXED_DOWNCOL_POPUP, colour_text[spec->downcol]);
		tree[ED_BOXED_DOWNCOL].ob_spec.obspec.interiorcol = spec->downcol;
		
		Aob_puttext(tree, ED_BOXED_UPCOL_POPUP, colour_text[spec->upcol]);
		tree[ED_BOXED_UPCOL].ob_spec.obspec.interiorcol = spec->upcol;
		
		Aob_puttext(tree, ED_BOXED_MASK_POPUP, masklist[spec->mask]);
		
		if (spec->smallfont)
			Aob_puttext(tree, ED_BOXED_FONTSIZE, SIZE_TEXT1);
		else
			Aob_puttext(tree, ED_BOXED_FONTSIZE, SIZE_TEXT0);
			
		sprintf(buf, "%d", spec->textlen);
		Aob_puttext(tree, ED_BOXED_LENGTH, buf);
		
		if (spec->threedim)
			tree[ED_BOXED_THREEDIM].ob_state |= OS_SELECTED;
		if (spec->capital)
			tree[ED_BOXED_CAPITAL].ob_state |= OS_SELECTED;
		if (spec->secret)
			tree[ED_BOXED_SECRET].ob_state |= OS_SELECTED;
	}
	return tree;
}

/* -------------------------------------------------------------------------- */

static void edbe_test_it(AUSER_DEF *userdef, AUSERBLK *userblk)
{
	userblk->ub_code = A_boxed;
	sscanf(userdef->parm, "0x%lxL", (long *)&userblk->ub_parm);
	userblk->ub_serv = Auo_boxed;
	if (userdef->type1 == STR_PAR)
		userblk->ub_ptr1 = userdef->data1;
	else
		userblk->ub_ptr1 = NULL;
	userblk->ub_ptr2 = userblk->ub_ptr3 = NULL;
	userblk->bubble = Ast_isEmpty(userdef->bubble) ? NULL : userdef->bubble;
	userblk->context = Ast_isEmpty(userdef->context) ? NULL : userdef->context;
}

/* -------------------------------------------------------------------------- */

static void edbe_abort(void)
{
	AUSERBLK *userblk;
	
	userblk = ACSblk->ev_window->work[ED_BOXED_SAMPLE].ob_spec.auserblk;
	userblk->bubble = NULL;
	userblk->context = NULL;
	data.interface->abort();
}

/* -------------------------------------------------------------------------- */

static void edbe_ok(void)
{
	OBJECT *tree;
	union beunion *beparm;
	char *text;
	AUSER_DEF userdef;
	int length;
	AUSERBLK *auser;
	
	tree = ACSblk->ev_window->work;
	auser = tree[ED_BOXED_SAMPLE].ob_spec.auserblk;
	beparm = (union beunion *)&auser->ub_parm;
	Aob_scanf(tree, ED_BOXED_LENGTH, "%d", &length);
	if (length > BE_MAXLEN)
		length = BE_MAXLEN;
	beparm->parm.textlen = length;
	sprintf(parm, "0x%lxL", (long)beparm->val);
	userdef.parm = parm;
	userdef.serv = "Auo_boxed";
	Auo_boxed(&tree[ED_BOXED_TEXT], AUO_GETVAL, &text);
	if (text[0] != '\0')
	{
		length = (int)strlen(text) * ACSblk->gl_wbox;
		userdef.type1 = STR_PAR;
		userdef.data1 = text;
	} else
	{
		length = ACSblk->gl_wbox;
		userdef.type1 = NONE_PAR;
		userdef.data1 = NULL;
	}
	userdef.len1 = 0;
	userdef.type2 = userdef.type3 = NONE_PAR;
	userdef.data2 = userdef.data3 = NULL;
	userdef.len2 = userdef.len3 = 0;
	Auo_boxed(&tree[ED_BOXED_BUBBLE], AUO_GETVAL, &userdef.bubble);
	if (Ast_isEmpty(userdef.bubble))
		userdef.bubble = NULL;
	Auo_boxed(&tree[ED_BOXED_CONTEXT], AUO_GETVAL, &userdef.context);
	if (Ast_isEmpty(userdef.context))
		userdef.context = NULL;
	data.interface->set(&userdef, length, ACSblk->gl_hbox);
	edbe_abort();
}

/* -------------------------------------------------------------------------- */

static void edbe_3d(void)
{
	beparm *parm;
	
	parm = (beparm *)&ACSblk->ev_object[ED_BOXED_SAMPLE].ob_spec.auserblk->ub_parm;
	if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & OS_SELECTED)
		parm->threedim = TRUE;
	else
		parm->threedim = FALSE;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ACSblk->ev_obnr, -1);
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_BOXED_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edbe_autobig(void)
{
	beparm *parm;
	
	parm = (beparm *)&ACSblk->ev_object[ED_BOXED_SAMPLE].ob_spec.auserblk->ub_parm;
	if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & OS_SELECTED)
		parm->capital = TRUE;
	else
		parm->capital = FALSE;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ACSblk->ev_obnr, -1);
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_BOXED_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edbe_secret(void)
{
	beparm *parm;
	
	parm = (beparm *)&ACSblk->ev_object[ED_BOXED_SAMPLE].ob_spec.auserblk->ub_parm;
	if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & OS_SELECTED)
		parm->secret = TRUE;
	else
		parm->secret = FALSE;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ACSblk->ev_obnr, -1);
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_BOXED_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edbe_incol(void)
{
	beparm *parm;
	int16 color;
	
	parm = (beparm *)&ACSblk->ev_object[ED_BOXED_SAMPLE].ob_spec.auserblk->ub_parm;
	/* BUG: cannot be changed to WHITE */
	if ((color = oe_colsel(parm->downcol, ED_BOXED_DOWNCOL_BOX, ED_BOXED_DOWNCOL_POPUP, ED_BOXED_DOWNCOL)) > 0)
	{
		parm->downcol = color;
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_BOXED_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edbe_outcol(void)
{
	beparm *parm;
	int16 color;
	
	parm = (beparm *)&ACSblk->ev_object[ED_BOXED_SAMPLE].ob_spec.auserblk->ub_parm;
	/* BUG: cannot be changed to WHITE */
	if ((color = oe_colsel(parm->upcol, ED_BOXED_UPCOL_BOX, ED_BOXED_UPCOL_POPUP, ED_BOXED_UPCOL)) > 0)
	{
		parm->upcol = color;
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_BOXED_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edbe_size(void)
{
	OBJECT *popup;
	Axywh rect;
	beparm *parm;
	int16 sel;
	
	popup = Aob_create(&POP_SIZESEL);
	if (popup == NULL)
		return;
	Aob_offset(&rect, ACSblk->ev_window->work, ED_BOXED_FONTSIZE_BOX);
	rect.x += ACSblk->ev_window->wi_work.x + 1;
	rect.y += ACSblk->ev_window->wi_work.y + 1;
	parm = (beparm *)&ACSblk->ev_object[ED_BOXED_SAMPLE].ob_spec.auserblk->ub_parm;
	popup[parm->smallfont + 1].ob_state |= OS_CHECKED;
	sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
	if (sel > 0)
	{
		if (sel == 1)
		{
			parm->smallfont = FALSE;
			Aob_puttext(ACSblk->ev_object, ED_BOXED_FONTSIZE, SIZE_TEXT0);
		} else
		{
			parm->smallfont = TRUE;
			Aob_puttext(ACSblk->ev_object, ED_BOXED_FONTSIZE, SIZE_TEXT1);
		}
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_BOXED_FONTSIZE, -1);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_BOXED_SAMPLE_BOX, -1);
	}
	Aob_delete(popup);
}

/* -------------------------------------------------------------------------- */

static void edbe_mask(void)
{
	OBJECT *popup;
	Axywh rect;
	char *text;
	char *str;
	beparm *parm;
	int16 sel;
	AOBJECT *aobj;
	
	popup = Aob_create(&POP_MASKSEL);
	if (popup == NULL)
		return;
	Aob_offset(&rect, ACSblk->ev_window->work, ED_BOXED_MASK_POPUP_BOX);
	rect.x += ACSblk->ev_window->wi_work.x + 1;
	rect.y += ACSblk->ev_window->wi_work.y + 1;
	parm = (beparm *)&ACSblk->ev_object[ED_BOXED_SAMPLE].ob_spec.auserblk->ub_parm;
	if ((sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y)) > 0)
	{
		aobj = (AOBJECT *)&popup[sel] + 1;
		if (aobj->ob_flags & AEO)
		{
			parm->mask = (int)(int32)aobj->userp1;
			Aob_puttext(ACSblk->ev_object, ED_BOXED_MASK_POPUP, masklist[parm->mask]);
			Auo_boxed(&ACSblk->ev_window->work[ED_BOXED_TEXT], AUO_GETVAL, &text);
			if ((str = Ast_create(text)) != NULL)
			{
				Auo_boxed(&ACSblk->ev_window->work[ED_BOXED_TEXT], AUO_SETVAL, "");
				parm = (beparm *)&ACSblk->ev_object[ED_BOXED_TEXT].ob_spec.auserblk->ub_parm;
				parm->mask = (int)(int32)aobj->userp1;
				Auo_boxed(&ACSblk->ev_window->work[ED_BOXED_TEXT], AUO_SETVAL, str);
				Auo_boxed(&ACSblk->ev_window->work[ED_BOXED_TEXT], AUO_FULLUPDATE, NULL);
				Ast_delete(str);
			}
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_BOXED_MASK_POPUP_BOX, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_BOXED_SAMPLE_BOX, -1);
		}
	}
	Aob_delete(popup);
}

/* -------------------------------------------------------------------------- */

static void edbe_textcol(void)
{
	beparm *parm;
	int16 color;
	
	parm = (beparm *)&ACSblk->ev_object[ED_BOXED_SAMPLE].ob_spec.auserblk->ub_parm;
	/* BUG: cannot be changed to WHITE */
	if ((color = oe_colsel(parm->textcol, ED_BOXED_TEXTCOL_BOX, ED_BOXED_TEXTCOL_POPUP, ED_BOXED_TEXTCOL)) > 0)
	{
		parm->textcol = color;
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_BOXED_SAMPLE_BOX, -1);
	}
}
