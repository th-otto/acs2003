#include "acs_i.h"
#include "acsplus.h"
#include "country.h"

static boolean rf_service(Awindow *self, int16 task, void *in_out);
static Awindow *rf_make(void *parm);

static void editref_abort(void);
static void editref_ok(void);
static void editref_edit(void);
static void editref_choose(void);

#include "edrefed.ah"
#include "edrefed.h"

int16 const cross_type[] = {
	REF_TYPE_NONE,       /* REF_NONE */
	REF_TYPE_CLICK,      /* REF_OBJ_CLICK */
	REF_TYPE_DRAG,       /* REF_OBJ_DRAG */
	REF_TYPE_DRAW,       /* REF_USER_DRAW */
	REF_TYPE_UO_SERVICE, /* REF_USER_SERVICE */
	REF_TYPE_NONE,       /* REF_WIN_UNUSED1 */
	REF_TYPE_OPEN,       /* REF_WIN_OPEN */
	REF_TYPE_CREATE,     /* REF_WIN_CREATE */
	REF_TYPE_INIT,       /* REF_WIN_INIT */
	REF_TYPE_KEYS,       /* REF_WIN_KEYS */
	REF_TYPE_CHANGE,     /* REF_WIN_CHANGE */
	REF_TYPE_REDRAW,     /* REF_WIN_REDRAW */
	REF_TYPE_TOPPED,     /* REF_WIN_TOPPED */
	REF_TYPE_NONE,       /* REF_WIN_UNUSED2 */
	REF_TYPE_CLOSED,     /* REF_WIN_CLOSED */
	REF_TYPE_ARROWED,    /* REF_WIN_ARROWED */
	REF_TYPE_HSLIDE,     /* REF_WIN_HSLIDE */
	REF_TYPE_VSLIDE,     /* REF_WIN_VSLIDE */
	REF_TYPE_MOVED,      /* REF_WIN_MOVED */
	REF_TYPE_SIZE,       /* REF_WIN_SIZED */
	REF_TYPE_FULLED,     /* REF_WIN_FULLED */
	REF_TYPE_SERVICE,    /* REF_WIN_SERVICE */
	REF_TYPE_ICONIFY,    /* REF_WIN_ICONIFY */
	REF_TYPE_UNICONIFY,  /* REF_WIN_UNICONIFY */
	REF_TYPE_GEMSCRIPT,  /* REF_WIN_GEMSCRIPT */
	REF_TYPE_ACSINIT0,   /* REF_SYS_ACSINIT0 */
	REF_TYPE_ACSINIT,    /* REF_SYS_ACSINIT */
	REF_TYPE_TERM,       /* REF_SYS_TERM */
	REF_TYPE_ABOUTME,    /* REF_SYS_ABOUTME */
	REF_TYPE_CLOSE,      /* REF_SYS_CLOSE */
	REF_TYPE_MESSAGE,    /* REF_SYS_MESSAGE */
	REF_TYPE_MPROTO,     /* REF_SYS_MPROTO */
	REF_TYPE_TIMER,      /* REF_SYS_TIMER */
	REF_TYPE_KEY,        /* REF_SYS_KEY */
	REF_TYPE_BUTTON,     /* REF_SYS_BUTTON */
	REF_TYPE_MOUSE,      /* REF_SYS_MOUSE */
	REF_TYPE_WIKEY,      /* REF_SYS_WIKEY */
	REF_TYPE_SYS_GEMSCRIPT /* REF_SYS_GEMSCRIPT */
};
static int cross_type_anz = (int)(sizeof(cross_type) / sizeof(cross_type[0]));

#include "acsio.h"

static const char *const p_type[] = {
	/* REF_NONE */
	"Procedure %s;" NL
	"{ Unkown type of routine }" NL /* FIXME: typo */
	"Begin" NL
	"End;" NL
	NL,

	/* REF_OBJ_CLICK */
	"Procedure %s;" NL
	"{ Click routine }" NL
	"Begin" NL
	"End;" NL
	NL,

	/* REF_OBJ_DRAG */
	"Procedure %s;" NL
	"{ Drag routine }" NL
	"Begin" NL
	"End;" NL
	NL,

	/* REF_USER_DRAW */
	"Function %s (dummy1, dummy2: Pointer; pb: PARMBLKPtr): Integer;" NL
	"{ USERDEF routine }" NL
	"Begin" NL
	"\t%s := pb^.pb_currstate;" NL
	"End;" NL
	NL,

	/* REF_USER_SERVICE */
	"Function %s (entry: ACSOBJECTPtr; task: Integer; in_out: Pointer): Boolean;" NL
	"{ USERDEF service }" NL
	"Begin" NL
	"\t%s := FALSE;" NL
	"End;" NL
	NL,

	/* REF_WIN_UNUSED1 */
	"Procedure %s;" NL
	"{ Unkown type of routine }" NL /* FIXME: typo */
	"Begin" NL
	"End;" NL
	NL,

	/* REF_WIN_OPEN */
	"Function %s (wind: AwindowPtr): Integer;" NL
	"{ wind.open routine }" NL
	"Begin" NL
	"\t%s := OK;" NL
	"End;" NL
	NL,

	/* REF_WIN_CREATE */
	"Function %s (para: Pointer): AwindowPtr;" NL
	"{ wind.create routine }" NL
	"\tVar wi: AwindowPtr;" NL
	"Begin" NL
	NL
	"\twi := Awi_create (@..);" NL
	"\t%s := wi;" NL
	"End;" NL
	NL,

	/* REF_WIN_INIT */
	"Function %s (wind: AwindowPtr): Integer;" NL
	"{ wind.init routine }" NL
	"Begin" NL
	"\t%s := OK;" NL
	"End;" NL
	NL,

	/* REF_WIN_KEYS */
	"Function %s (wind: AwindowPtr; kstate, key: Integer): Integer;" NL
	"{ wind.keys routine }" NL
	"Begin" NL
	"\t%s := Awi_keys (wi, kstate, key);" NL
	"End;" NL
	NL,

	/* REF_WIN_CHANGE */
	"Procedure %s (wind: AwindowPtr; obnr, state: Integer);" NL
	"{ wind.obchange routine }" NL
	"Begin" NL
	"End;" NL
	NL,

	/* REF_WIN_REDRAW */
	"Procedure %s (wind: AwindowPtr; area: AxywhPtr);" NL
	"{ wind.redraw routine }" NL
	"Begin" NL
	"End;" NL
	NL,

	/* REF_WIN_TOPPED */
	"Procedure %s (wind: AwindowPtr);" NL
	"{ wind.topped routine }" NL
	"Begin" NL
	"End;" NL
	NL,

	/* REF_WIN_UNUSED2 */
	"Procedure %s;" NL
	"{ Unkown type of routine }" NL /* FIXME: typo */
	"Begin" NL
	"End;" NL
	NL,

	/* REF_WIN_CLOSED */
	"Procedure %s (wind: AwindowPtr);" NL
	"{ wind.closed routine }" NL
	"Begin" NL
	"End;" NL
	NL,

	/* REF_WIN_ARROWED */
	"Procedure %s (wind: AwindowPtr; which, amount: Integer);" NL
	"{ wind.arrowed routine }" NL
	"Begin" NL
	"\tCase (which) of" NL
	"\tWA_UPLINE:" NL
	"\t{ };" NL
	"\tWA_DNLINE:" NL
	"\t{ };" NL
	"\tWA_UPPAGE:" NL
	"\t{ };" NL
	"\tWA_DNPAGE:" NL
	"\t{ };" NL
	"\tWA_LFPAGE:" NL
	"\t{ };" NL
	"\tWA_RTPAGE:" NL
	"\t{ };" NL
	"\tWA_LFLINE:" NL
	"\t{ };" NL
	"\tWA_RTLINE:" NL
	"\t{ };" NL
	"\tEnd;" NL
	"End;" NL
	NL,

	/* REF_WIN_HSLIDE */
	"Procedure %s( wind: AwindowPtr; pos: Integer );" NL
	"{ wind.hslid routine }" NL
	"Begin" NL
	"End;" NL
	NL,

	/* REF_WIN_VSLIDE */
	"Procedure %s( wind: AwindowPtr; pos: Integer );" NL
	"{ wind.vslid routine }" NL
	"Begin" NL
	"End;" NL
	NL,

	/* REF_WIN_MOVED */
	"Procedure %s( wind: AwindowPtr; area: AxywhPtr );" NL
	"{ wind.moved routine }" NL
	"Begin" NL
	"End;" NL
	NL,

	/* REF_WIN_SIZED */
	"Procedure %s( wind: AwindowPtr; area: AxywhPtr );" NL
	"{ wind.sized routine }" NL
	"Begin" NL
	"End;" NL
	NL,

	/* REF_WIN_FULLED */
	"Procedure %s( wind: AwindowPtr );" NL
	"{ wi.fulled routine }" NL
	"Begin" NL
	"End;" NL
	NL,

	/* REF_WIN_SERVICE */
	"Function %s( wind: AwindowPtr; task: Integer; in_out: Pointer): Boolean;" NL
	"{ wi.service routine }" NL
	"Begin" NL
	"\tcase (task) of " NL
	"\tAS_TERM:" NL
	"\t\tAwi_delete (wind);" NL
	"\tElse Begin" NL
	"\t\t%s := Awi_service(wind, task, in_out);" NL
	"\t\tExit;" NL
	"\tEnd;" NL
	"\t%s := TRUE;" NL
	"End;" NL
	NL /* BUG: missing comma */
#if WITH_FIXES
	,
#endif

	/* REF_WIN_ICONIFY */
	"{ Window-Iconify-Routine }" NL
	"Function %s( wi: AwindowPtr; all: Integer ) : Integer;" NL
	"Begin" NL
	"\t%s:=Awi_iconify(wi, all);" NL
	"End;" NL
	NL,

	/* REF_WIN_UNICONIFY */
	"{ Window-Uniconify-Routine }" NL
	"Function %s( wi: AwindowPtr ) : Integer;" NL
	"Begin" NL
	"\t%s:=Awi_uniconify(wi);" NL
	"End;" NL
	NL,

	/* REF_WIN_GEMSCRIPT */
	"{ Window-GEMScript-Routine }" NL
	"Function %s( wi: AwindowPtr; anz: Integer; cmd: Pointer; antwort: A_GSAntwortPtr ) : Integer" NL
	"{" NL
	"\treturn Awi_gemscript(wi, anz, cmd, antwort);" NL
	"}" NL
	NL /* BUG: missing comma */
#if WITH_FIXES
	,
#endif

	/* REF_SYS_ACSINIT0 */
	"{ System-Init-Routine }" NL
	"Function %s : Integer;" NL
	"{" NL
	"\t%s:=OK;" NL
	"}" NL
	NL,

	/* REF_SYS_ACSINIT */
	"{ System-Init-Routine }" NL
	"Function %s : Integer;" NL
	"{" NL
	"\t%s:=OK;" NL
	"}" NL
	NL,

	/* REF_SYS_TERM */
	"{ System-Terminier-Routine }" NL
	"Procedure %s;" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_ABOUTME */
	"{ System-About-Routine }" NL
	"Procedure %s;" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_CLOSE */
	"{ System-Close-Routine }" NL
	"Procedure %s;" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_MESSAGE */
	"{ System-Message-Routine }" NL
	"Procedure %s( message: array [0..7] of Integer;" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_MPROTO */
	"{ System-Message-Filter }" NL
	"Procedure %s( message: array [0..7] of Integer;" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_TIMER */
	"{ System-Timer-Routine }" NL
	"Procedure %s;" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_KEY */
	"{ System-Key-Filter }" NL
	"Procedure %s( Var kstate, key: Integer );" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_BUTTON */
	"{ System-Button-Filter }" NL
	"Procedure %s( Var button, kreturn: Integer )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_MOUSE */
	"{ System-Maus-Routine }" NL
	"Procedure %s;" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_WIKEY */
	"{ System-Window-Key-Filter }" NL
	"Procedure %s( Var kstate, key: Integer );" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_GEMSCRIPT */
	"{ System-GEMScript-Routine }" NL
	"Function %s( anz: Integer; cmd: Pointer; antwort: A_GSAntwortPtr ) : Integer;" NL
	"{" NL
	"\t%s:=ACSGEMScript(anz, cmd, antwort);" NL
	"}" NL
	NL
};

static const char *c_type[] = {
	/* REF_NONE */
	"\t/* Unkown type of routine */" NL /* FIXME: typo */
	"void %s( void )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_OBJ_CLICK */
	"\t/* Click routine */" NL
	"void %s( void )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_OBJ_DRAG */
	"\t/* Drag routine */" NL
	"void %s( void )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_USER_DRAW */
	"\t/* USERDEF Draw-Routine */" NL
	"INT16 CDECL %s( PARMBLK *pb )" NL
	"{\treturn pb->pb_currstate;" NL
	"}" NL
	NL,

	/* REF_USER_SERVICE */
	"\t/* USERDEF Service-Routine */" NL
	"INT16 %s( OBJECT *entry, INT16 task, void *in_out )" NL
	"{\treturn FALSE;" NL
	"}" NL
	NL,

	/* REF_WIN_UNUSED1 */
	"\t/* Unkown type of routine */void %s( void )" NL /* FIXME: typo */ /* FIXME: missing NL */
	NL
	"{" NL
	"}" NL
	NL,

	/* REF_WIN_OPEN */
	"\t/* Window-Open-Routine*/" NL
	"INT16 %s( Awindow *wind )" NL
	"{\treturn OK;" NL
	"}" NL
	NL,

	/* REF_WIN_CREATE */
	"\t/* Window-Create-Routine */" NL
	"Awindow *%s( void *para )" NL
	"{\tAwindow\t*wi;" NL
	NL
	"\twi=Awi_create(&..);" NL
	"if( wi== NULL )" NL
	"\t\treturn NULL;" NL
	NL
	"\treturn wi;" NL
	"}" NL
	NL,

	/* REF_WIN_INIT */
	"\t/* Window-Init-Routine */" NL
	"INT16 %s( Awindow *wind )" NL
	"{\treturn OK;" NL
	"}" NL
	NL,

	/* REF_WIN_KEYS */
	"\t/* Window-Keys-Routine */" NL
	"INT16 %s( Awindow *wind, INT16 kstate, INT16 key )" NL
	"{\treturn Awi_keys(wi, kstate, key);" NL
	"}" NL
	NL,

	/* REF_WIN_CHANGE */
	"\t/* Window-Obchange-Routine */" NL
	"void %s( Awindow *wind, INT16 obnr, INT16 state )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_WIN_REDRAW */
	"\t/* Window-Redraw-Routine */" NL
	"void %s( Awindow *wind, Axywh *area )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_WIN_TOPPED */
	"\t/* Window-Topped-Routine */" NL
	"void %s( Awindow *wind )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_WIN_UNUSED2 */
	"\t/* Unkown type of routine */" NL /* FIXME: typo */
	"void %s( void )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_WIN_CLOSED */
	"\t/* Window-Closed-Routine */" NL
	"void %s( Awindow *wind )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_WIN_ARROWED */
	"\t/* Window-Arrowed-Routine */" NL
	"void %s( Awindow *wind, INT16 which, INT16 amount )" NL
	"{" NL
	"\tswitch(which)" NL
	"\t{" NL
	"\t\tcase WA_UPLINE:" NL
	"\t\t\tbreak;" NL
	NL
	"\t\tcase WA_DNLINE:" NL
	"\t\t\tbreak;" NL
	NL
	"\t\tcase WA_UPPAGE:" NL
	"\t\t\tbreak;" NL
	NL
	"\t\tcase WA_DNPAGE:" NL
	"\t\t\tbreak;" NL
	NL
	"\t\tcase WA_LFPAGE:" NL
	"\t\t\tbreak;" NL
	NL
	"\t\tcase WA_RTPAGE:" NL
	"\t\t\tbreak;" NL
	NL
	"\t\tcase WA_LFLINE:" NL
	"\t\t\tbreak;" NL
	NL
	"\t\tcase WA_RTLINE:" NL
	"\t\t\tbreak;" NL
	"\t}" NL
	"}" NL
	NL,

	/* REF_WIN_HSLIDE */
	"\t/* Window-HSlide-Routine */" NL
	"void %s( Awindow *wind, INT16 pos )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_WIN_VSLIDE */
	"\t/* Window-VSlide-Routine */" NL
	"void %s( Awindow *wind, INT16 pos )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_WIN_MOVED */
	"\t/* Window-Moved-Routine */" NL
	"void %s( Awindow *wind, Axywh *area )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_WIN_SIZED */
	"\t/* Window-Sized-Routine */" NL
	"void %s( Awindow *wind, Axywh *area )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_WIN_FULLED */
	"\t/* Window-Fulled-Routine */" NL
	"void %s( Awindow *wind )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_WIN_SERVICE */
	"\t/* Window-Service-Routine */" NL
	"INT16 %s( Awindow *wind, INT16 task, void *in_out )" NL
	"{" NL
	"\tswitch(task)" NL
	"\t{" NL
	"\t\tcase AS_TERM:" NL
	"\t\t\tAwi_delete(wind);" NL
	"\t\t\tbreak;" NL
	NL
	"\t\tdefault:" NL
	"\t\t\treturn Awi_service(wind, task, in_out);" NL
	"\t}" NL
	"\treturn TRUE;" NL
	"}" NL
	NL,

	/* REF_WIN_ICONIFY */
	"\t/* Window-Iconify-Routine */" NL
	"INT16 %s( Awindow *wind, INT16 all )" NL
	"{" NL
	"\treturn Awi_iconify(wi, all);" NL
	"}" NL
	NL,

	/* REF_WIN_UNICONIFY */
	"\t/* Window-Uniconify-Routine */" NL
	"INT16 %s( Awindow *wind )" NL
	"{" NL
	"\treturn Awi_uniconify(wi);" NL
	"}" NL
	NL,

	/* REF_WIN_GEMSCRIPT */
	"\t/* Window-GEMScript-Routine */" NL
	"INT16 %s( Awindow *wind, INT16 anz, char **cmd, A_GSAntwort *antwort )" NL
	"{" NL
	"\treturn Awi_gemscript(wi, anz, cmd, antwort);" NL
	"}" NL
	NL,

	/* REF_SYS_ACSINIT0 */
	"\t/* System-Init-Routine */" NL
	"INT16 %s( void )" NL
	"{" NL
	"\treturn OK;" NL
	"}" NL
	NL,

	/* REF_SYS_ACSINIT */
	"\t/* System-Init-Routine */" NL
	"INT16 %s( void )" NL
	"{" NL
	"\treturn OK;" NL
	"}" NL
	NL,

	/* REF_SYS_TERM */
	"\t/* System-Terminier-Routine */" NL
	"void %s( void )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_ABOUTME */
	"\t/* System-About-Routine */" NL
	"void %s( void )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_CLOSE */
	"\t/* System-Close-Routine */" NL
	"void %s( void )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_MESSAGE */
	"\t/* System-Message-Routine */" NL
	"void %s( INT16 *message )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_MPROTO */
	"\t/* System-Message-Filter */" NL
	"void %s( INT16 *message )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_TIMER */
	"\t/* System-Timer-Routine */" NL
	"void %s( void )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_KEY */
	"\t/* System-Key-Filter */" NL
	"void %s( INT16 *kstate, INT16 *key )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_BUTTON */
	"\t/* System-Button-Filter */" NL
	"void %s( INT16 *button, INT16 *kreturn )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_MOUSE */
	"\t/* System-Mouse-Filter */" NL
	"void %s( void )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_WIKEY */
	"\t/* System-Window-Key-Filter */" NL
	"void %s( INT16 *kstate, INT16 *key )" NL
	"{" NL
	"}" NL
	NL,

	/* REF_SYS_GEMSCRIPT */
	"\t/* System-GEMScript-Routine */" NL
	"INT16 %s( INT16 anz, char **cmd, A_GSAntwort *antwort )" NL
	"{" NL
	"\treturn ACSGEMScript(anz, cmd, antwort);" NL
	"}" NL
	NL
};

static void term(Awindow *self);
static void acc_eref(Awindow *self);
static void set_eref(Awindow *win);
static void ref_edit(Awindow *win);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void editref_abort(void)
{
	term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void editref_ok(void)
{
	acc_eref(ACSblk->ev_window);
	term(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

static void acc_eref(Awindow *self)
{
	REFPARM *parm = self->user;
	AOBJECT *aobj;
	void *data;
	Obj_Head *obj;
	Awindow *editor;
	int16 flags;
	
	parm->acs->flags |= ACS_CHANGED;
	aobj = (AOBJECT *)&self->work[EDIT_REF_TYPE_POPUP + 1];
	obj = parm->obj;
	flags = obj->flags;
	obj->flags = (flags & ~(OBJ_USERDEFINED | 0xff)) | (0xff & (int16)(long)aobj->userp1);
	if (self->work[EDIT_REF_EXTERN].ob_state & OS_SELECTED)
		obj->flags |= OBJ_USERDEFINED;
	editor = parm->editor;
	if (editor != NULL)
	{
		int32 needed;

		editor->service(editor, AS_EDGETNEED, &needed);
		if (needed > 0)
		{
			data = Ax_malloc(needed + 1);
			if (data != NULL)
			{
				Ax_ifree(obj->object);
				editor->service(editor, AS_EDGETSTRING, data);
				obj->object = data;
				obj->size = obj->used = needed + 1;
				editor->service(editor, AS_EDCLEAN, NULL);
			}
		} else
		{
			Ax_ifree(obj->object);
			obj->object = NULL;
			obj->size = obj->used = 0;
		}
	}
}

/* -------------------------------------------------------------------------- */

static Awindow *rf_make(void *parm)
{
	REFPARM *refparm = parm;
	Obj_Head *obj;
	Awindow *win;
	REFPARM *newparm;
	
	obj = refparm->obj;
	win = obj->window;
	if (win != NULL)
	{
		Awi_show(win);
	} else
	{
		newparm = Ax_malloc(sizeof(*newparm));
		if (newparm == NULL)
			return NULL;
		newparm->acs = refparm->acs;
		newparm->obj = refparm->obj;
		newparm->editor = NULL;
		WI_REF.iconblk->monoblk.ib_ptext = WI_REF.info = obj->label;
		win = Awi_create(&WI_REF);
		if (win == NULL)
		{
			Ax_free(newparm);
			return NULL;
		}
		wi_pos(win, &obj->pos, &refparm->acs->last_rez);
		win->user = newparm;
		obj->window = win;
		set_eref(win);
		if ((long)obj->used > 0 && !(obj->flags & OBJ_USERDEFINED)) /* FIXME: cast */
		{
			ref_edit(win);
		} else
		{
			if (win->open(win) != OK)
			{
				term(win);
				return NULL;
			}
		}
	}
	return win;
}

/* -------------------------------------------------------------------------- */

static boolean rf_service(Awindow *self, int16 task, void *in_out)
{
	REFPARM *ref = self->user;
	
	switch (task)
	{
	case AS_TERM:
	case AS_EDSAVE:
		acc_eref(self);
		term(self);
		break;
	
	case AS_EDTERM:
		term(self);
		break;
	
	case AS_GUI_RENAME_OBJ:
		new_name(self, ref->obj);
		break;

	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void set_type(OBJECT *editref, OBJECT *reftype, int16 obnr)
{
	char buf[50];
	AOBJECT *aobj;
	AOBJECT *dst;
	char *ptr;
	
	Aob_gettext(reftype, obnr, buf);
	ptr = buf;
	while (*ptr == ' ')
		ptr++;
	Aob_puttext(editref, EDIT_REF_TYPE_POPUP, ptr);
	dst = (AOBJECT *)&editref[EDIT_REF_TYPE_POPUP] + 1;
	aobj = (AOBJECT *)&reftype[obnr] + 1;
	dst->userp1 = aobj->userp1;
}

/* -------------------------------------------------------------------------- */

static void editref_choose(void)
{
	int16 select;
	AOBJECT *aobj;
	OBJECT *popup;
	
	popup = &REF_TYPE.root;
	select = Ame_popup(ACSblk->ev_window, popup, -1, -1);
	if (select >= 0)
	{
		aobj = (AOBJECT *)&popup[select] + 1;
		if (select == 1 || ((aobj->ob_flags & AEO) && (int16)(int32)aobj->userp1 != 0))
		{
			set_type(ACSblk->ev_object, popup, select);
			ACSblk->ev_window->obchange(ACSblk->ev_window, EDIT_REF_TYPE_POPUP, -1);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void set_eref(Awindow *self)
{
	REFPARM *ref = self->user;
	int16 type;
	
	type = ref->obj->flags & 0xff;
	if (type < 0 || type >= cross_type_anz)
		type = REF_NONE;
	set_type(self->work, &REF_TYPE.root, cross_type[type]);
	set_flag(ref->obj->flags & OBJ_USERDEFINED, &self->work[EDIT_REF_EXTERN]);
}

/* -------------------------------------------------------------------------- */

static void term(Awindow *self)
{
	REFPARM *ref;
	Awindow *editor;
	
	if (!(self->state & AWS_INTERM))
	{
		self->state |= AWS_INTERM | AWS_TERM;
		ref = self->user;
		editor = ref->editor;
		if (editor != NULL)
		{
			editor->service(editor, AS_EDCLEAN, NULL);
			editor->service(editor, AS_EDWINDOW, NULL);
			editor->service(editor, AS_TERM, NULL);
		}
		ref->obj->window = NULL;
		if (self->state & AWS_ICONIZED)
			memcpy(&ref->obj->pos, &self->wi_normal, sizeof(ref->obj->pos));
		else
			memcpy(&ref->obj->pos, &self->wi_act, sizeof(ref->obj->pos));
		Ax_free(ref);
		Awi_delete(self);
	}
}

/* -------------------------------------------------------------------------- */

static void ref_edit(Awindow *self)
{
	REFPARM *ref = self->user;
	Awindow *editor;
	Obj_Head *obj;
	AOBJECT *aobj;
	char *label;
	char buf[LABEL_MAX * 2];
	const char *const *table;
	int16 type;
	char textbuf[1024];
	
	editor = ref->editor;
	if (editor == NULL)
	{
		obj = ref->obj;
		label = obj->label; /* FIXME: useless extra var */
		ref->editor = editor = EDITOR.create(NULL);
		/* BUG: no NULL pointer check */
		editor->service(editor, AS_EDWINDOW, self);
		strcat(strcat(strcpy(buf, " "), label), " (REF) ");
		editor->service(editor, AS_EDTITLE, buf);
		strcat(strcat(strcpy(buf, " * "), label), " (REF) ");
		editor->service(editor, AS_EDTITLEDIRTY, buf);
		editor->service(editor, AS_EDICONTEXT, label);
		editor->service(editor, AS_EDEXT, "C"); /* FIMEX: make lowercase; FIXME: check src_lang */
		if ((long)obj->used > 0) /* FIXME: cast */
		{
			editor->service(editor, AS_EDPUTSTRING, obj->object);
		} else
		{
			switch (ref->acs->src_lang )
			{
			case ACS_LANG_C:
				if ((obj->flags & (OBJ_GLOBAL | OBJ_LOCAL)) != OBJ_GLOBAL)
					editor->service(editor, AS_EDPUTSTRING, "static ");
				table = c_type;
				break;
			case ACS_LANG_PASCAL:
				table = p_type;
				break;
#ifdef __GNUC__
			default:
				return;
#endif
			}
			aobj = (AOBJECT *)(&ACSblk->ev_object[EDIT_REF_TYPE_POPUP + 1]);
			type = (int16)(int32)aobj->userp1;
			sprintf(textbuf, table[type], obj->label, obj->label, obj->label);
			editor->service(editor, AS_EDPUTSTRING, textbuf);
		}
		editor->service(editor, AS_EDHOME, NULL);
		editor->service(editor, AS_EDCLEAN, NULL);
	}
	Awi_show(editor);
}

/* -------------------------------------------------------------------------- */

static void editref_edit(void)
{
	ref_edit(ACSblk->ev_window);
}
