#include "acs_i.h"
#include "country.h"

#define STATIC

static void editus_ok(void);

static boolean user_service(Awindow *self, int16 task, void *in_out);
static Awindow *user_make(void *a);

#include "edusred.ah"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

