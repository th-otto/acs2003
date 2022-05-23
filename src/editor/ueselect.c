#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"

static void edse_abort(void);

static void edse_minsize(AUSERBLK *user, int16 *w, int16 *h);
static OBJECT *edse_object_tree(AUSER_DEF *user, OBJECT *obj);
static void edse_test_it(AUSER_DEF *user, AUSERBLK *userblk);

#ifndef C_UNION
#  define C_UNION(x) { (int32)(x) }
#endif

static OBJECT visual = { -1, -1, -1, G_BUTTON, 0x0000, 0x0000, C_UNION("SELECT"), 0, 0, 8, 2 };
static OBJECT logical = { -1, -1, -1, G_USERDEF, 0x0000, 0x0000, C_UNION(0L), 0, 0, 8, 2 };

static AUSER_DEF aud = { "0x0L", "", NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NONE_PAR, NULL, 0, NULL, NULL };
static UODATAS data = {
	"A_select",
	edse_object_tree,
	edse_test_it,
	edse_abort,
	Aob_delete,
	&visual,
	&logical,
	&aud,
	edse_minsize,
	NULL,
	"SELECT |",
	"Der Select-Editor",
	NULL
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void init_select(Awindow *win)
{
	win->service(win, AS_ACS_PART_ADD, &data);
}

/* -------------------------------------------------------------------------- */

static void edse_minsize(AUSERBLK *user, int16 *w, int16 *h)
{
	UNUSED(user);
	*w = ACSblk->gl_wbox;
	*h = ACSblk->gl_hbox;
}

/* -------------------------------------------------------------------------- */

static OBJECT *edse_object_tree(AUSER_DEF *user, OBJECT *obj)
{
	UNUSED(user);
	UNUSED(obj);
	return NULL;
}

/* -------------------------------------------------------------------------- */

static void edse_test_it(AUSER_DEF *userdef, AUSERBLK *userblk)
{
	UNUSED(userdef);
	userblk->ub_code = A_select;
	/* FIXME: ub_parm not initialized */
	userblk->ub_serv = NULL;
	userblk->ub_ptr1 = userblk->ub_ptr2 = userblk->ub_ptr3 = NULL;
	userblk->bubble = NULL;
	userblk->context = NULL;
}

/* -------------------------------------------------------------------------- */

static void edse_abort(void)
{
	data.interface->abort();
}
