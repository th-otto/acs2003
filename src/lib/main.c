/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      main application entry                                */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "country.h"
#ifdef __PUREC__
#include <linea.h>
#endif
#include <ctype.h>
#include "version.h"

#include "main.ah"
#include "main.h"

void *SentMsg = NULL;
void *ListOfApps = NULL;
static char const __attribute__((used)) copyright[] = "(c) 1991-" __STRINGIFY(COPYRIGHT_YEAR) " S.Bachert, O.Michalak & M.Els„sser ACS "
	__STRINGIFY(ACS_VERSION_MAJOR) "." __STRINGIFY(ACS_VERSION_MINOR) "." __STRINGIFY(ACS_VERSION_MICRO)
#if BETA
	"\341"
#endif
	;
static char const _c_version[] = "ACSpro V" 
	__STRINGIFY(ACS_VERSION_MAJOR) "." __STRINGIFY(ACS_VERSION_MINOR) "." __STRINGIFY(ACS_VERSION_MICRO)
#if BETA
	"\341"
#endif
	;
#if WITH_FIXES
static char const compiler_date[] = __DATE__;
#else
static char const compiler_date[] = RELEASE_DATE;
#endif

static char lib_date[11] = "";

Ablk *ACSblk;
static Ablk _ACSblk;
static int16 list[256];
static void *DEBUG_DEFECT_MEM;
int16 _ACSv_magix;

#ifdef __PUREC__
LINEA *Linea;
VDIESC *Vdiesc;
FONTS *Fonts;
LINEA_FUNP *Linea_funp;
#endif

#if COUNTRY == COUNTRY_DE
#define AS_OF "vom %s"
#define DATE_SEP '.'
#else
#define AS_OF "as of %s"
#define DATE_SEP '-'
#endif

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

#ifdef __PUREC__
#pragma warn -par
#endif

static void _ACSmessage(int16 *ev_mmgpbuf)
{
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static void _ACSclose(void)
{
	Aev_unhidepointer();
	if (ACSblk->application || ACSblk->apterm)
		Aev_quit();
	else
		Awi_sendall(AS_TERM, NULL);
}

/* -------------------------------------------------------------------------- */

static void _ACSaboutme(void)
{
	Awindow *win;
	
	win = _W_ABOUT.create(&_W_ABOUT);
	if (win != NULL)
	{
		Aob_puttext(win->work, ABOUT_VERSION, _c_version);
		if (lib_date[0] == '\0')
		{
#if COUNTRY == COUNTRY_DE
			lib_date[0] = isspace(compiler_date[4]) ? '0' : compiler_date[4];
			lib_date[1] = compiler_date[5];
			lib_date[2] = DATE_SEP;
			Adate_getMonth(compiler_date, &lib_date[3]);
			lib_date[5] = DATE_SEP;
			lib_date[6] = compiler_date[7];
			lib_date[7] = compiler_date[8];
			lib_date[8] = compiler_date[9];
			lib_date[9] = compiler_date[10];
#else
			lib_date[0] = compiler_date[7];
			lib_date[1] = compiler_date[8];
			lib_date[2] = compiler_date[9];
			lib_date[3] = compiler_date[10];
			lib_date[4] = DATE_SEP;
			Adate_getMonth(compiler_date, &lib_date[5]);
			lib_date[7] = DATE_SEP;
			lib_date[8] = isspace(compiler_date[4]) ? '0' : compiler_date[4];
			lib_date[9] = compiler_date[5];
#endif
			lib_date[10] = '\0';
		}
		Aob_printf(win->work, ABOUT_DATE, AS_OF, lib_date);
		Awi_dialog(win);
		Awi_delete(win);
	}
}

/* -------------------------------------------------------------------------- */

static void dummy(void)
{
}

/* -------------------------------------------------------------------------- */

static int16 ok(void)
{
	return OK;
}

/* -------------------------------------------------------------------------- */

void DEBUG_MEM(void *defective)
{
	DEBUG_DEFECT_MEM = defective;
}

/* -------------------------------------------------------------------------- */

static int acs_call(int argc, char **argv, char **envp)
{
	ACSblk->argc = argc;
	ACSblk->argv = argv;
	ACSblk->env = envp;
	if (ACSinitialize() == OK)
	{
		ACSeventhandler();
		ACSterminate();
		return OK;
	} else
	{
		ACSterminate();
		return FAIL;
	}
}

/* -------------------------------------------------------------------------- */

static Ablk *get_acsblk(void)
{
	ACSblk = &_ACSblk;
	memset(ACSblk, 0, sizeof(*ACSblk));
	ACSblk->cfg = NULL;
	strcpy(ACSblk->basename, "                   ");
	ACSblk->ev_mtcount = 500;
	ACSblk->application = TRUE;
	ACSblk->multitask = FALSE;
	ACSblk->appexit = FALSE;
	ACSblk->description = &ACSdescr;
	ACSblk->description->flags |= AB_SMARTREDRAW;
	ACSblk->apterm = FALSE;
#ifdef __GNUC__
	ACSblk->AESglobal = (int16 *)_globl;
#else
	ACSblk->AESglobal = _GemParBlk.global;
#endif
	ACSblk->Aselect.maxlen = sizeof(list) / sizeof(list[0]);
	ACSblk->Aselect.array = list;
	ACSblk->argc = 0;
	ACSblk->argv = NULL;
	ACSblk->env = NULL;
	ACSblk->ACSerror = Ash_error;
	ACSblk->ACSterm = ACSconfig.ACSterm ? ACSconfig.ACSterm : dummy;
	ACSblk->ACSaboutme = ACSconfig.ACSaboutme ? ACSconfig.ACSaboutme : _ACSaboutme;
	ACSblk->ACSclose = ACSconfig.ACSclose ? ACSconfig.ACSclose : _ACSclose;
	ACSblk->ACSmessage = ACSconfig.ACSmessage ? ACSconfig.ACSmessage : _ACSmessage;
	ACSblk->ACSmproto = ACSconfig.ACSmproto ? ACSconfig.ACSmproto : (void (*)(int16 *))dummy;
	ACSblk->ACStimer = ACSconfig.ACStimer ? ACSconfig.ACStimer : dummy;
	ACSblk->ACSinit0 = ACSconfig.ACSinit0 ? ACSconfig.ACSinit0 : ok;
	ACSblk->dither = 0xc1;
	ACSblk->ACSkey = ACSconfig.ACSkey ? ACSconfig.ACSkey : (void (*)(int16 *, int16 *))dummy;
	ACSblk->ACSwikey = ACSconfig.ACSwikey ? ACSconfig.ACSwikey : (void (*)(int16 *, int16 *))dummy;
	ACSblk->ACSbutton = ACSconfig.ACSbutton ? ACSconfig.ACSbutton : (void (*)(int16 *, int16 *))dummy;
	ACSblk->ACSmouse = ACSconfig.ACSmouse ? ACSconfig.ACSmouse : dummy;
	ACSblk->GEMScript = ACSconfig.ACSGEMScript ? ACSconfig.ACSGEMScript : Aev_GEMScript;
	ACSblk->ev_mbclicks = 256 | 2;
	ACSblk->ev_bstate = 0;
	ACSblk->ev_bmask = 3;
	ACSblk->DEBUG_MEM = DEBUG_MEM;
	ACSblk->alert_name = NULL;
	ACSblk->mfsel_count = 20;
	strcpy(ACSblk->separator, " \t=+-*/()!&|[]{}<>,.;:\335$%?`'^#~@\\\"");
	ACSblk->screenMFDB.fd_addr = NULL;
	ACSblk->ev_mkdead[0] = '\0';
	ACSblk->keyAltCtrlSwitch = TRUE;
	
	return ACSblk;
}

/* -------------------------------------------------------------------------- */

int main(int argc, char **argv, char **envp)
{
	get_acsblk();
	return acs_call(argc, argv, envp);
}

/* -------------------------------------------------------------------------- */

#if defined(__PUREC__) && !WITH_FIXES
#pragma warn -use
#endif
