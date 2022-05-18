#include "acs_i.h"
#include "acsplus.h"
#include "country.h"

#define STATIC

static void edwi_ok(void);
static void edwi_abort(void);
static void edwi_tme(void);
static void edwi_acc(void);
static void edwi_two(void);
static void edwi_tic(void);
static void edwi_ref(void);

static boolean wi_service(Awindow *self, int16 task, void *in_out);
static Awindow *wi_make(void *a);

#include "edwinded.ah"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/


