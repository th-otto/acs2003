#include "acsport.h"
#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"
#include "acsplus.h"

static void ed3d_dither(void);
static void ed3d_incol(void);
static void ed3d_intercol(void);
static void ed3d_nofill(void);
static void ed3d_outcol(void);
static void ed3d_pattern(void);
static void ed3d_pos(void);
static void ed3d_replace(void);
static void ed3d_size(void);
static void ed3d_textcol(void);
static void ed3d_trans(void);
static void ed3d_abort(void);
static void ed3d_ok(void);

#include "ue3dbutt.ah"
#include "ue3dbutt.h"

static char *live_offset(void *obj, int32 val);
static char *live_thickness(void *obj, int32 val);

static OBJECT *ed3d_object_tree(AUSER_DEF *user, OBJECT *obj);
static void ed3d_test_it(AUSER_DEF *user, AUSERBLK *userblk);
static void ed3d_minsize(AUSERBLK *user, int16 *w, int16 *h);

static AUSERBLK DB1 = { A_3Dbutton, 0x29f10178L, Auo_string, "3D", NULL, NULL, NULL, NULL };
static AUSERBLK DB2 = { A_3Dbutton, 0x29c10178L, Auo_string, "3D", NULL, NULL, NULL, NULL };
static OBJECT visual = { -1, -1, -1, G_USERDEF, 0x2005, 0x0010, C_UNION(&DB1), 0, 0, 10, 2 };
static OBJECT logical = { -1, -1, -1, G_USERDEF, 0x0005, 0x0000, C_UNION(&DB2), 0, 0, 10, 2 };
static AUSER_DEF aud = { "0x29c10178L", "Auo_string", STR_PAR, "3D", 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static UODATAS data = {
	"A_3Dbutton",
	ed3d_object_tree,
	ed3d_test_it,
	ed3d_ok,
	Aob_delete,
	&visual,
	&logical,
	&aud,
	ed3d_minsize,
	NULL,
	title,
	help_title,
	NULL
};

static char parm[32];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void ed3d_dither(void)
{
	bfobspec *parm;
	
	if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & OS_SELECTED)
	{
		parm = (bfobspec *)&ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.userblk->ub_parm;
		parm->fillpattern = IP_SOLID;
		parm->interiorcol = G_LWHITE;
		parm->character = parm->character & 0x7f; /* clears ACS_3DBUTTON_NOFILL */
		Aob_puttext(ACSblk->ev_object, ED_3DBUTTON_INTERCOL_POPUP, colour_text[G_LWHITE]);
		ACSblk->ev_object[ED_3DBUTTON_INTERCOL].ob_spec.obspec.interiorcol = G_LWHITE;
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_INTERCOL_BOX, -1);
		ACSblk->ev_object[ED_3DBUTTON_PATTERN].ob_spec.obspec.fillpattern = IP_SOLID;
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_PATTERN, -1);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void ed3d_incol(void)
{
	int16 color;
	int32 *parm;
	
	parm = &ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm;
	if ((color = oe_colsel((int)((*parm >> 24) & 15), ED_3DBUTTON_INCOL_BOX, ED_3DBUTTON_INCOL_POPUP, ED_3DBUTTON_INCOL)) >= 0)
	{
		*parm = (*parm & ~ACS_3DBUTTON_INCOL) | ((long)color << 24);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void ed3d_intercol(void)
{
	int16 color;
	int32 *parm;
	
	parm = &ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm;
	if ((color = oe_colsel((int)((*parm) & 15), ED_3DBUTTON_INTERCOL_BOX, ED_3DBUTTON_INTERCOL_POPUP, ED_3DBUTTON_INTERCOL)) >= 0)
	{
		*parm = (*parm & ~ACS_3DBUTTON_INTERCOL) | ((long)color);
		
		ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm &= ~ACS_3DBUTTON_NOFILL;
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_DITHER, ACSblk->ev_window->work[ED_3DBUTTON_DITHER].ob_state & ~OS_SELECTED);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_EMPTY_PATTERN, ACSblk->ev_window->work[ED_3DBUTTON_EMPTY_PATTERN].ob_state & ~OS_SELECTED);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void ed3d_nofill(void)
{
	int32 *parm;
	
	parm = &ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm;
	if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & OS_SELECTED)
		*parm |= ACS_3DBUTTON_NOFILL;
	else
		*parm &= ~ACS_3DBUTTON_NOFILL;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ACSblk->ev_obnr, -1);
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void ed3d_outcol(void)
{
	int16 color;
	int32 *parm;
	
	parm = &ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm;
	if ((color = oe_colsel((int)((*parm >> 12) & 15), ED_3DBUTTON_OUTCOL_BOX, ED_3DBUTTON_OUTCOL_POPUP, ED_3DBUTTON_OUTCOL)) >= 0)
	{
		*parm = (*parm & ~ACS_3DBUTTON_OUTCOL) | ((long)color << 12);
		
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void ed3d_pattern(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	int32 *parm;
	
	popup = Aob_create(&POP_PATSEL);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_3DBUTTON_PATTERN);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		popup[(int)((ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm >> 4) & 7) + 1].ob_state |= OS_CHECKED;
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			sel--;
			parm = &ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm;
			*parm = (*parm & ~ACS_3DBUTTON_PATTERN) | ((long)sel << 4);
			ACSblk->ev_object[ED_3DBUTTON_PATTERN].ob_spec.obspec.fillpattern = sel;
			ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm &= ~ACS_3DBUTTON_NOFILL;
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_DITHER, ACSblk->ev_window->work[ED_3DBUTTON_DITHER].ob_state & ~OS_SELECTED);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_EMPTY_PATTERN, ACSblk->ev_window->work[ED_3DBUTTON_EMPTY_PATTERN].ob_state & ~OS_SELECTED);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_PATTERN, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void ed3d_pos(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	int32 *parm;
	
	popup = Aob_create(&POP_HORPOSSEL);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_3DBUTTON_HORPOS);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		switch ((int)((ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm >> 28) & 3))
		{
		case 0:
			popup[1].ob_state |= OS_CHECKED;
			break;
		case 1:
			popup[3].ob_state |= OS_CHECKED;
			break;
		case 2:
			popup[2].ob_state |= OS_CHECKED;
			break;
		}
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			parm = &ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm;
			*parm &= ~ACS_3DBUTTON_HORPOS;
			switch (sel)
			{
			case 1:
				Aob_puttext(ACSblk->ev_object, ED_3DBUTTON_HORPOS_POPUP, HPOS_TEXT1);
				break;
			case 2:
				*parm |= ACS_3DBUTTON_HORPOS_CENTER;
				Aob_puttext(ACSblk->ev_object, ED_3DBUTTON_HORPOS_POPUP, HPOS_TEXT2);
				break;
			case 3:
				*parm |= ACS_3DBUTTON_HORPOS_RIGHT;
				Aob_puttext(ACSblk->ev_object, ED_3DBUTTON_HORPOS_POPUP, HPOS_TEXT3);
				break;
			}
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_HORPOS_POPUP, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void ed3d_replace(void)
{
	int32 *parm;
	parm = &ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm;
	*parm |= ACS_3DBUTTON_TEXTMODE;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void ed3d_size(void)
{
	OBJECT *popup;
	Axywh rect;
	int16 sel;
	int32 *parm;
	
	popup = Aob_create(&POP_SIZESEL);
	if (popup != NULL)
	{
		Aob_offset(&rect, ACSblk->ev_window->work, ED_3DBUTTON_SIZE);
		rect.x += ACSblk->ev_window->wi_work.x + 1;
		rect.y += ACSblk->ev_window->wi_work.y + 1;
		popup[(int)((ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm >> 30) & 1) + 1].ob_state |= OS_CHECKED;
		sel = Ame_popup(ACSblk->ev_window, popup, rect.x, rect.y);
		if (sel > 0)
		{
			parm = &ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm;
			if (sel == 1)
			{
				*parm &= ~ACS_3DBUTTON_SMALL;
				Aob_puttext(ACSblk->ev_object, ED_3DBUTTON_SIZE_POPUP, SIZE_TEXT0);
			} else
			{
				*parm |= ACS_3DBUTTON_SMALL;
				Aob_puttext(ACSblk->ev_object, ED_3DBUTTON_SIZE_POPUP, SIZE_TEXT1);
			}
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_SIZE_POPUP, -1);
			ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_SAMPLE_BOX, -1);
		}
		Aob_delete(popup);
	}
}

/* -------------------------------------------------------------------------- */

static void ed3d_textcol(void)
{
	int16 color;
	int32 *parm;
	
	parm = &ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm;
	if ((color = oe_colsel((int)((*parm >> 8) & 15), ED_3DBUTTON_TEXTCOL_BOX, ED_3DBUTTON_TEXTCOL_POPUP, ED_3DBUTTON_TEXTCOL)) >= 0)
	{
		*parm = (*parm & ~ACS_3DBUTTON_TEXTCOL) | ((long)color << 8);
		ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void ed3d_trans(void)
{
	int32 *parm;
	parm = &ACSblk->ev_object[ED_3DBUTTON_SAMPLE].ob_spec.auserblk->ub_parm;
	*parm &= ~ACS_3DBUTTON_TEXTMODE;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_3DBUTTON_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

void init_3Dbutton(Awindow *win)
{
	win->service(win, AS_ACS_PART_ADD, &data);
}

/* -------------------------------------------------------------------------- */

static void ed3d_minsize(AUSERBLK *user, int16 *w, int16 *h)
{
	int len;
	
	if (user->ub_ptr1 != NULL)
		len = (int)strlen(user->ub_ptr1) * ACSblk->gl_wbox;
	else
		len = ACSblk->gl_wbox;
	*w = len;
	*h = ACSblk->gl_hbox;
}

/* -------------------------------------------------------------------------- */

static OBJECT *ed3d_object_tree(AUSER_DEF *userdef, OBJECT *edit)
{
	OBJECT *tree;
	OBJECT *ptr;
	AUSERBLK *user;
	int16 color;
	long val;
	long slvalue;
	Awiob ob;
	SLLIVE live;
	char buf[10];
	
	tree = Aob_create(&ED_3DBUTTON);
	if (tree == NULL)
		return NULL;
	oe_beself(ACSblk->ev_window, tree, ED_3DBUTTON_TEXT);
	oe_beself(ACSblk->ev_window, tree, ED_3DBUTTON_BUBBLE);
	oe_beself(ACSblk->ev_window, tree, ED_3DBUTTON_CONTEXT);

	ptr = &tree[ED_3DBUTTON_SAMPLE];
	ptr->ob_flags |= edit->ob_flags & (OF_RBUTTON | OF_DEFAULT | OF_EXIT);
	ptr->ob_state |= edit->ob_state & (OS_SELECTED | OS_CROSSED | OS_CHECKED | OS_DISABLED | OS_OUTLINED | OS_SHADOWED);
	user = ptr->ob_spec.auserblk;
	sscanf(userdef->parm, "0x%lxL", &val);
	user->ub_parm = val;
	if (userdef->type1 == STR_PAR)
	{
		user->ub_serv(ptr, AUO_SETVAL, "ABC");
		Aob_puttext(tree, ED_3DBUTTON_TEXT, userdef->data1);
	} else
	{
		user->ub_serv(ptr, AUO_SETVAL, "");
		Aob_puttext(tree, ED_3DBUTTON_TEXT, "");
	}

	user->bubble = tree[ED_3DBUTTON_BUBBLE].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->bubble))
		Aob_puttext(tree, ED_3DBUTTON_BUBBLE, "");
	else
		Aob_puttext(tree, ED_3DBUTTON_BUBBLE, userdef->bubble);
	user->context = tree[ED_3DBUTTON_CONTEXT].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->context))
		Aob_puttext(tree, ED_3DBUTTON_CONTEXT, "");
	else
		Aob_puttext(tree, ED_3DBUTTON_CONTEXT, userdef->context);

	ob.window = ACSblk->ev_window;
	ptr = &tree[ED_3DBUTTON_FRAMESIZE];
	ob.entry = ptr;
	ob.obnr = ED_3DBUTTON_FRAMESIZE;
	Auo_slider(ptr, AUO_SELF, &ob);
	slvalue = 8;
	Auo_slider(ptr, AUO_SLFULL, &slvalue);
	slvalue = 1;
	Auo_slider(ptr, AUO_SLSIZE, &slvalue);
	slvalue = (val >> 16) & 15;
	Auo_slider(ptr, AUO_POS, &slvalue);
	sprintf(buf, "%d", (int)((val >> 16) & 7));
	Auo_slider(ptr, AUO_SETVAL, buf);
	live.call = live_thickness;
	live.obj = ptr;
	Auo_slider(ptr, AUO_SLCALL, &live);
	
	ptr = &tree[ED_3DBUTTON_OFFSET];
	ob.entry = ptr;
	ob.obnr = ED_3DBUTTON_OFFSET;
	Auo_slider(ptr, AUO_SELF, &ob);
	slvalue = 16;
	Auo_slider(ptr, AUO_SLFULL, &slvalue);
	slvalue = 1;
	Auo_slider(ptr, AUO_SLSIZE, &slvalue);
	slvalue = (val >> 20) & 15;
	if (slvalue < 8)
		slvalue += 8;
	else
		slvalue -= 8;
	Auo_slider(ptr, AUO_POS, &slvalue);
	slvalue = (val >> 20) & 15;
	if (slvalue > 7)
		slvalue -= 16;
	sprintf(buf, "%d", (int)slvalue);
	Auo_slider(ptr, AUO_SETVAL, buf);
	live.call = live_offset;
	live.obj = ptr;
	Auo_slider(ptr, AUO_SLCALL, &live);
	
	color = (int16)((val >> 24) & 15);
	Aob_puttext(tree, ED_3DBUTTON_INCOL_POPUP, colour_text[color]);
	tree[ED_3DBUTTON_INCOL].ob_spec.obspec.interiorcol = color;

	color = (int16)((val) & 15);
	Aob_puttext(tree, ED_3DBUTTON_INTERCOL_POPUP, colour_text[color]);
	tree[ED_3DBUTTON_INTERCOL].ob_spec.obspec.interiorcol = color;

	color = (int16)((val >> 12) & 15);
	Aob_puttext(tree, ED_3DBUTTON_OUTCOL_POPUP, colour_text[color]);
	tree[ED_3DBUTTON_OUTCOL].ob_spec.obspec.interiorcol = color;

	color = (int16)((val >> 4) & 7);
	tree[ED_3DBUTTON_PATTERN].ob_spec.obspec.fillpattern = color;

#if WITH_FIXES
	switch ((int16)((val >> 28) & 3))
#else
	switch ((int16)((val >> 28) & 15)) /* BUG: mask should be 3 */
#endif
	{
	case 1:
		Aob_puttext(tree, ED_3DBUTTON_HORPOS_POPUP, HPOS_TEXT3);
		break;
	case 2:
		Aob_puttext(tree, ED_3DBUTTON_HORPOS_POPUP, HPOS_TEXT2);
		break;
	case 0:
	default:
		Aob_puttext(tree, ED_3DBUTTON_HORPOS_POPUP, HPOS_TEXT1);
		break;
	}
	
	if (val & ACS_3DBUTTON_SMALL)
		Aob_puttext(tree, ED_3DBUTTON_SIZE_POPUP, SIZE_TEXT1);
	else
		Aob_puttext(tree, ED_3DBUTTON_SIZE_POPUP, SIZE_TEXT0);
		
	color = (int16)((val >> 8) & 15);
	Aob_puttext(tree, ED_3DBUTTON_TEXTCOL_POPUP, colour_text[color]);
	tree[ED_3DBUTTON_TEXTCOL].ob_spec.obspec.interiorcol = color;

	return tree;
}

/* -------------------------------------------------------------------------- */

static void ed3d_test_it(AUSER_DEF *userdef, AUSERBLK *userblk)
{
	userblk->ub_code = A_3Dbutton;
	sscanf(userdef->parm, "0x%lxL", &userblk->ub_parm);
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

static void ed3d_abort(void)
{
	AUSERBLK *userblk;
	
	userblk = ACSblk->ev_window->work[ED_3DBUTTON_SAMPLE].ob_spec.auserblk;
	userblk->bubble = NULL;
	userblk->context = NULL;
	data.interface->abort();
}

/* -------------------------------------------------------------------------- */

static void ed3d_ok(void)
{
	OBJECT *tree;
	AUSER_DEF userdef;
	char *text;
	AUSERBLK *auser;
	int width;
	
	tree = ACSblk->ev_window->work;
	auser = tree[ED_3DBUTTON_SAMPLE].ob_spec.auserblk;
	
	sprintf(parm, "0x%lxL", auser->ub_parm);
	userdef.parm = parm;
	userdef.serv = "Auo_string";
	Auo_boxed(&tree[ED_3DBUTTON_TEXT], AUO_GETVAL, &text);
	if (text[0] != '\0')
	{
		width = (int)strlen(text) * ACSblk->gl_wbox;
		userdef.type1 = STR_PAR;
		userdef.data1 = text;
	} else
	{
		width = ACSblk->gl_wbox;
		userdef.type1 = NONE_PAR;
		userdef.data1 = NULL;
	}
	userdef.len1 = 0;
	userdef.type2 = userdef.type3 = NONE_PAR;
	userdef.data2 = userdef.data3 = NULL;
	userdef.len2 = userdef.len3 = 0;
	Auo_boxed(&tree[ED_3DBUTTON_BUBBLE], AUO_GETVAL, &userdef.bubble);
	if (Ast_isEmpty(userdef.bubble))
		userdef.bubble = NULL;
	Auo_boxed(&tree[ED_3DBUTTON_CONTEXT], AUO_GETVAL, &userdef.context);
	if (Ast_isEmpty(userdef.context))
		userdef.context = NULL;
	data.interface->set(&userdef, width, ACSblk->gl_hbox);
	ed3d_abort();
}

/* -------------------------------------------------------------------------- */

static char *live_offset(void *obj, int32 val)
{
	char buf[6];
	Awiob ob;
	int32 sval;
	int32 *parm;
	Awindow *win;
	OBJECT *ptr;
	
	val -= 8;
	sval = val;
	Auo_slider(obj, AUO_OWNER, &ob);
	win = ob.window;
	ptr = &win->work[ED_3DBUTTON_SAMPLE];
	parm = &ptr->ob_spec.auserblk->ub_parm;
	if (val < 0)
		val += 16;
	if (((*parm >> 20) & 15) != val)
	{
		*parm = (*parm & ~ACS_3DBUTTON_OFFSET) | (val << 20);
		win->obchange(win, ED_3DBUTTON_SAMPLE_BOX, -1);
	}
	/* BUG: returns address of local var */
#ifdef __PUREC__
	return itoa((int)sval, buf, 10);
#else
	sprintf(buf, "%d", (int)sval);
	return buf;
#endif
}

/* -------------------------------------------------------------------------- */

static char *live_thickness(void *obj, int32 val)
{
	char buf[6];
	Awiob ob;
	int16 sval;
	int32 *parm;
	Awindow *win;
	OBJECT *ptr;
	
	sval = (int16)val;
	Auo_slider(obj, AUO_OWNER, &ob);
	win = ob.window;
	ptr = &win->work[ED_3DBUTTON_SAMPLE];
	parm = &ptr->ob_spec.auserblk->ub_parm;
	if (((*parm >> 16) & 15) != val)
	{
		*parm = (*parm & ~ACS_3DBUTTON_FRAMESIZE) | ((int32)sval << 16);
		win->obchange(win, ED_3DBUTTON_SAMPLE_BOX, -1);
	}
	/* BUG: returns address of local var */
#ifdef __PUREC__
	return itoa((int)sval, buf, 10);
#else
	sprintf(buf, "%d", (int)sval);
	return buf;
#endif
}
