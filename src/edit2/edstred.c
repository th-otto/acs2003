#include "acs_i.h"
#include "country.h"

#define STATIC

static void editstr_ok(void);
static void editstr_abort(void);

static boolean st_service(Awindow *self, int16 task, void *in_out);
static Awindow *st_make(void *a);

#include "edstred.ah"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

