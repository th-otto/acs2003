#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"
#include "acsplus.h"

static void editor_abort(void);

static void editor_minsize(AUSERBLK *user, int16 *x, int16 *y);
static OBJECT *editor_object_tree(AUSER_DEF *user, OBJECT *obj);
static void editor_test_it(AUSER_DEF *user, AUSERBLK *userblk);

#ifndef C_UNION
#  define C_UNION(x) { (int32)(x) }
#endif

static OBJECT visual = { -1, -1, -1, G_BUTTON, 0x0000, 0x0000, C_UNION("EDITOR"), 0, 0, 10, 2 };
static OBJECT logical = { -1, -1, -1, G_USERDEF, 0x0000, 0x0000, C_UNION(0L), 0, 0, 8, 2 };

static AUSER_DEF aud = { "0x0L", "Auo_editor", NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static UODATAS data = {
	"A_editor",
	editor_object_tree,
	editor_test_it,
	editor_abort,
	Aob_delete,
	&visual,
	&logical,
	&aud,
	editor_minsize,
	NULL,
	" EDITOR |",
	"Der Editor",
	NULL
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void init_editor(Awindow *win)
{
	win->service(win, AS_ACS_PART_ADD, &data);
}

/* -------------------------------------------------------------------------- */

static void editor_minsize(AUSERBLK *user, int16 *w, int16 *h)
{
	UNUSED(user);
	*w = ACSblk->gl_wbox * 8;
	*h = ACSblk->gl_hbox * 2;
}

/* -------------------------------------------------------------------------- */

static OBJECT *editor_object_tree(AUSER_DEF *user, OBJECT *obj)
{
	UNUSED(user);
	UNUSED(obj);
	return NULL;
}

/* -------------------------------------------------------------------------- */

static void editor_test_it(AUSER_DEF *userdef, AUSERBLK *userblk)
{
	UNUSED(userdef);
	userblk->ub_code = A_editor;
	/* FIXME: ub_parm not initialized */
	userblk->ub_serv = Auo_editor;
	userblk->ub_ptr1 = userblk->ub_ptr2 = userblk->ub_ptr3 = NULL;
	userblk->bubble = NULL;
	userblk->context = NULL;
}

/* -------------------------------------------------------------------------- */

static void editor_abort(void)
{
	data.interface->abort();
}
