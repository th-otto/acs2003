#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"
#include "acsplus.h"

static void edf_abort(void);
static void edf_ok(void);
static void edf_font_sel(void);
static void edf_pos(void);
static void edf_effect(void);

#include "ueftext.ah"
#include "ueftext.h"

static void edf_minsize(AUSERBLK *user, int16 *w, int16 *h);
static OBJECT *edf_object_tree(AUSER_DEF *user, OBJECT *obj);
static void edf_test_it(AUSER_DEF *user, AUSERBLK *userblk);

static AUSERBLK ftext = { A_ftext, 0x0001000dL, Auo_ftext, "Guten Tag mit ACSpro", NULL, NULL, NULL, NULL };

static OBJECT visual = { -1, -1, -1, G_USERDEF, 0x0000, 0x0010, C_UNION(&ftext), 0, 0, 10, 2 };
static OBJECT logical = { -1, -1, -1, G_USERDEF, 0x0040, 0x0000, C_UNION(0L), 0, 0, 5, 2 };

static AUSER_DEF aud = { "0x1000DL", "Auo_ftext", STR_PAR, "Guten Tag", 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static UODATAS data = {
	"A_ftext",
	edf_object_tree,
	edf_test_it,
	edf_ok,
	Aob_delete,
	&visual,
	&logical,
	&aud,
	edf_minsize,
	NULL,
	title,
	help_title,
	NULL
};

static char parm[36];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void init_ftext(Awindow *win)
{
	win->service(win, AS_ACS_PART_ADD, &data);
}

/* -------------------------------------------------------------------------- */

static void edf_minsize(AUSERBLK *user, int16 *w, int16 *h)
{
	UNUSED(user);
	*w = ACSblk->gl_wbox;
	*h = ACSblk->gl_hbox;
}

/* -------------------------------------------------------------------------- */

static OBJECT *edf_object_tree(AUSER_DEF *userdef, OBJECT *edit)
{
	OBJECT *tree;
	OBJECT *ptr;
	const char *str;
	char buf[BE_MAXLEN + 1];
	char fontname[50] = "";
	long val;
	AUSERBLK *user;
	Awiob ob;
	int16 i;
	int16 id;
	
	tree = Aob_create(&ED_FTEXT.root);
	if (tree == NULL)
		return NULL;

	ptr = &tree[ED_FTEXT_SAMPLE];
	ptr->ob_flags |= edit->ob_flags & (OF_RBUTTON | OF_DEFAULT | OF_EXIT);
	ptr->ob_state |= edit->ob_state & (OS_SELECTED | OS_CROSSED | OS_CHECKED | OS_DISABLED | OS_OUTLINED | OS_SHADOWED);

	ob.window = ACSblk->ev_window;
	ob.entry = ptr;
	ob.obnr = ED_FTEXT_SAMPLE;
	Auo_ftext(ptr, AUO_SELF, &ob);
	
	oe_beself(ACSblk->ev_window, tree, ED_FTEXT_TEXT1);
	oe_beself(ACSblk->ev_window, tree, ED_FTEXT_TEXT2);
	oe_beself(ACSblk->ev_window, tree, ED_FTEXT_BUBBLE);
	oe_beself(ACSblk->ev_window, tree, ED_FTEXT_CONTEXT);

	user = ptr->ob_spec.auserblk;
	sscanf(userdef->parm, "0x%lxL", &val);
	
	id = (int16)(val >> 16);
	for (i = 0; i < ACSblk->fonts; i++)
	{
		if (vqt_name(ACSblk->vdi_handle, i, fontname) == id)
			break;
	}
	if (i == ACSblk->fonts)
	{
		if (Awi_alert(1, A_ADAPTFONT) == 1)
			val = (1L << 16) | 13;
	}
	user->ub_parm = val;

	id = (int16)(val >> 16); /* FIXME: useless asignment */
	Aob_printf(tree, ED_FTEXT_FONTNAME, "%-30s", fontname);
	Aob_printf(tree, ED_FTEXT_FONTSIZE, "%-5d", (int)(val & ACS_FTEXT_FONTSIZE));
	switch ((int)(val >> 14) & 3)
	{
	case ACS_FTEXT_ALIGN_LEFT >> 14:
		tree[ED_FTEXT_ALIGN_LEFT].ob_state |= OS_SELECTED;
		break;
	case ACS_FTEXT_ALIGN_CENTER >> 14:
		tree[ED_FTEXT_ALIGN_CENTER].ob_state |= OS_SELECTED;
		break;
	case ACS_FTEXT_ALIGN_RIGHT >> 14:
		tree[ED_FTEXT_ALIGN_RIGHT].ob_state |= OS_SELECTED;
		break;
	case ACS_FTEXT_ALIGN_BLOCK >> 14:
		tree[ED_FTEXT_ALIGN_BLOCK].ob_state |= OS_SELECTED;
		break;
	}
	
	if (val & ACS_FTEXT_BOLD)
		tree[ED_FTEXT_BOLD].ob_state |= OS_SELECTED;
	if (val & ACS_FTEXT_LIGHT)
		tree[ED_FTEXT_LIGHT].ob_state |= OS_SELECTED;
	if (val & ACS_FTEXT_ITALIC)
		tree[ED_FTEXT_ITALIC].ob_state |= OS_SELECTED;
	if (val & ACS_FTEXT_UNDERLINED)
		tree[ED_FTEXT_UNDERLINED].ob_state |= OS_SELECTED;
	if (val & ACS_FTEXT_OUTLINED)
		tree[ED_FTEXT_OUTLINED].ob_state |= OS_SELECTED;
	if (val & ACS_FTEXT_SHADOWED)
		tree[ED_FTEXT_SHADOWED].ob_state |= OS_SELECTED;
	
	if (userdef->type1 == STR_PAR)
	{
		str = userdef->data1;
		user->ub_serv(ptr, AUO_SETVAL, NO_CONST(str));
	} else
	{
		str = "";
	}
	id = (int)strlen(str);
	if (id > BE_MAXLEN)
	{
		strncpy(buf, &str[BE_MAXLEN], BE_MAXLEN);
		buf[BE_MAXLEN] = '\0';
		id = BE_MAXLEN;
	} else
	{
		buf[0] = '\0';
	}
	Aob_printf(tree, ED_FTEXT_TEXT1, "%-*s", id, str);
	Aob_puttext(tree, ED_FTEXT_TEXT2, buf);
	
	user->bubble = tree[ED_FTEXT_BUBBLE].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->bubble))
		Aob_puttext(tree, ED_FTEXT_BUBBLE, "");
	else
		Aob_puttext(tree, ED_FTEXT_BUBBLE, userdef->bubble);
	user->context = tree[ED_FTEXT_CONTEXT].ob_spec.auserblk->ub_ptr1;
	if (Ast_isEmpty(userdef->context))
		Aob_puttext(tree, ED_FTEXT_CONTEXT, "");
	else
		Aob_puttext(tree, ED_FTEXT_CONTEXT, userdef->context);

	return tree;
}

/* -------------------------------------------------------------------------- */

static void edf_test_it(AUSER_DEF *userdef, AUSERBLK *userblk)
{
	userblk->ub_code = A_ftext;
	sscanf(userdef->parm, "0x%lxL", (long *)&userblk->ub_parm);
	userblk->ub_serv = Auo_ftext;
	if (userdef->type1 == STR_PAR)
		userblk->ub_ptr1 = userdef->data1;
	else
		userblk->ub_ptr1 = NULL;
	userblk->ub_ptr2 = userblk->ub_ptr3 = NULL;
	userblk->bubble = Ast_isEmpty(userdef->bubble) ? NULL : userdef->bubble;
	userblk->context = Ast_isEmpty(userdef->context) ? NULL : userdef->context;
}

/* -------------------------------------------------------------------------- */

static void edf_abort(void)
{
	AUSERBLK *userblk;

	userblk = ACSblk->ev_window->work[ED_FTEXT_SAMPLE].ob_spec.auserblk;
	userblk->bubble = NULL;
	userblk->context = NULL;
	data.interface->abort();
}

/* -------------------------------------------------------------------------- */

static void edf_ok(void)
{
	OBJECT *tree;
	char buf[BE_MAXLEN * 2 + 2];
	int len;
	AUSER_DEF userdef;
	AUSERBLK *auser;
	
	tree = ACSblk->ev_window->work;
	auser = tree[ED_FTEXT_SAMPLE].ob_spec.auserblk;
	
	sprintf(parm, "0x%lxL", (long)auser->ub_parm);
	userdef.parm = parm;
	userdef.serv = "Auo_ftext";
	Aob_gettext(tree, ED_FTEXT_TEXT1, buf);
	len = (int)strlen(buf);
	Aob_gettext(tree, ED_FTEXT_TEXT2, &buf[len]);

	if (buf[0] != '\0')
	{
		userdef.type1 = STR_PAR;
		userdef.data1 = buf;
	} else
	{
		userdef.type1 = NONE_PAR;
		userdef.data1 = NULL;
	}
	userdef.len1 = 0;
	userdef.type2 = userdef.type3 = NONE_PAR;
	userdef.data2 = userdef.data3 = NULL;
	userdef.len2 = userdef.len3 = 0;
	Auo_boxed(&tree[ED_FTEXT_BUBBLE], AUO_GETVAL, &userdef.bubble);
	if (Ast_isEmpty(userdef.bubble))
		userdef.bubble = NULL;
	Auo_boxed(&tree[ED_FTEXT_CONTEXT], AUO_GETVAL, &userdef.context);
	if (Ast_isEmpty(userdef.context))
		userdef.context = NULL;
	data.interface->set(&userdef, ACSblk->gl_wbox, ACSblk->gl_hbox);
	edf_abort();
}

/* -------------------------------------------------------------------------- */

static void edf_font_sel(void)
{
	int16 fontid;
	int16 height;
	char fontname[50];
	Awindow *win;
	OBJECT *tree;
	AUSERBLK *auser;
	int16 i;
	
	win = ACSblk->ev_window;
	tree = ACSblk->ev_object;
	auser = ACSblk->ev_object[ED_FTEXT_SAMPLE].ob_spec.auserblk;
	fontid = (int16)(auser->ub_parm >> 16);
	height = (int16)(auser->ub_parm & ACS_FTEXT_FONTSIZE);
	if (A_fontsel(&fontid, &height, TRUE) == OK)
	{
		if (height > 255)
			height = 255;
		auser->ub_parm = (auser->ub_parm & ~(ACS_FTEXT_FONTSIZE | ACS_FTEXT_FONTID)) | ((int32)fontid << 16) | height;
		for (i = 0; i < ACSblk->fonts; i++)
		{
			if (fontid == vqt_name(ACSblk->vdi_handle, i, fontname))
				break;
		}
		Aob_printf(tree, ED_FTEXT_FONTNAME, "%-30s", fontname);
		Aob_printf(tree, ED_FTEXT_FONTSIZE, "%-5d", height);
		win->obchange(win, ED_FTEXT_FONTSEL_BOX, -1);
		win->obchange(win, ED_FTEXT_SAMPLE_BOX, -1);
	}
}

/* -------------------------------------------------------------------------- */

static void edf_pos(void)
{
	AOBJECT *aobj;
	int32 val;
	AUSERBLK *auser;
	
	aobj = (AOBJECT *)&ACSblk->ev_object[ACSblk->ev_obnr] + 1;
	val = (int32)aobj->userp1;
	auser = ACSblk->ev_object[ED_FTEXT_SAMPLE].ob_spec.auserblk;
	auser->ub_parm &= ~ACS_FTEXT_ALIGNMENT;
	if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & OS_SELECTED)
		auser->ub_parm |= val << 14;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ACSblk->ev_obnr, -1);
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_FTEXT_SAMPLE_BOX, -1);
}

/* -------------------------------------------------------------------------- */

static void edf_effect(void)
{
	AOBJECT *aobj;
	int32 val;
	AUSERBLK *auser;
	
	aobj = (AOBJECT *)&ACSblk->ev_object[ACSblk->ev_obnr] + 1;
	val = (int32)aobj->userp1;
	auser = ACSblk->ev_object[ED_FTEXT_SAMPLE].ob_spec.auserblk;
	auser->ub_parm &= ~(val << 8);
	if (ACSblk->ev_object[ACSblk->ev_obnr].ob_state & OS_SELECTED)
		auser->ub_parm |= val << 8;
	ACSblk->ev_window->obchange(ACSblk->ev_window, ACSblk->ev_obnr, -1);
	ACSblk->ev_window->obchange(ACSblk->ev_window, ED_FTEXT_SAMPLE_BOX, -1);
}
