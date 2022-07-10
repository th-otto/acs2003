/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Window handling                                       */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include <ctype.h>
#include <stddef.h>
#include "country.h"
#include "acsplus.h"
#include "messages/msgserv.h"
#include "messages/vaproto.h"

static int16 init = 0;
static int16 cycle = 0;
static int16 menu_width = -1;
static int16 winupd = 0;
static int16 winoldupd = 0;
static int16 msupd = 0;
static int16 msoldupd = 0;
static char *exec_path = NULL;
static char *exec_com = NULL;
static OBJECT empty[] = { { -1, -1, -1, G_BOX, OF_LASTOB, 0, C_UNION(0), 0, 0, 240, 240 } };
Awindow *Aroot_wi = NULL;
static Awindow *top_window = NULL;
static OBJECT topline[] = { { -1, -1, -1, G_BUTTON, OF_LASTOB, 0, C_UNION(0), 0, 0, 0, 0 } };

static int16 wi_minw;
static int16 wi_minh;
static int32 timer1;
static int32 timer2;
static Awindow *gemmap[MAX_WI_ICONS];
#define MAX_MODWINS 8
static Awindow *modwins[MAX_MODWINS];
static Awindow *icnmap[MAX_WI_ICONS];
static char *_WIconText;
static OBJECT *_WWorkIcon;
static OBJECT *_WIcon;
static Axywh virt_desk;
Awindow *_ACSv_winds[MAX_WINDS];
OBJECT *_ACSv_wiicons[MAX_WI_ICONS];
static boolean _ACSv_wwork;
boolean _ACSv_wmenu;
int16 _Wmax_wi;

extern OBJECT _ICO;
#define NUM_ICO_OBJECTS 3

static int16 Awi_ropen(Awindow *root);
static void Awi_oblist(Awindow *win);
static void Awi_hotkey(char *buf, OBJECT *obj);

#ifdef __PUREC__
#define wind_set_ptr_int(h, k, p, r) wind_set(h, k, p, r)
#define wind_set_ptr_int2(h, k, p, r, r2) wind_set(h, k, p, r, r2)
#else
#define wind_set_ptr_int(h, k, p, r) wind_set(h, k, (int16)((uint32)(p) >> 16), (int16)(uint32)(p), r)
#define wind_set_ptr_int2(h, k, p, r, r2) wind_set_ptr_int(h, k, p, r)
#endif

#if COUNTRY != COUNTRY_DE && WITH_FIXES
#define AL_NO_DIALOG "[4][Error while creating|a dialog!][Cancel]"
#else
#define AL_NO_DIALOG "[4][Das Erzeugen eines|Dialoges ist fehlgeschlagen!][Abbrechen]"
#endif

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 INwindow(void)
{
	Awindow *root;
	
	if (init++ != 0)
		return OK;
	
	virt_desk.x = ACSblk->description->dx;
	virt_desk.y = max(ACSblk->desk.y, ACSblk->description->dy);
	virt_desk.w = ACSblk->desk.w - ACSblk->description->dx * 2;
	virt_desk.h = ACSblk->desk.y + ACSblk->desk.h - ACSblk->description->dy - virt_desk.y;
	wi_minw = ACSblk->gl_wattr * 5;
	wi_minh = ACSblk->gl_hattr * 6;
	_WWorkIcon = Aob_create(&_ICO);
	if (_WWorkIcon != NULL)
	{
		Aob_fix(_WWorkIcon);
		_WIcon = _WWorkIcon + 1;
		_WIconText = _WIcon->ob_spec.iconblk->ib_ptext;
	} else
	{
		_WIcon = (void *)(_WIconText = NULL);
	}
	
	_ACSv_wmenu = FALSE;
	_ACSv_wwork = FALSE;
	memset(modwins, 0, sizeof(modwins));
	memset(_ACSv_winds, 0, sizeof(_ACSv_winds));
	memset(_ACSv_wiicons, 0, sizeof(_ACSv_wiicons));
	memset(icnmap, 0, sizeof(icnmap));
	if ((!ACSblk->application || ACSblk->multitask) && ACSblk->description->acc != NULL)
		root = ACSblk->description->acc;
	else
		root = ACSblk->description->root;
	Aroot_wi = root->create(NULL);
	if (Aroot_wi == NULL)
		return FAIL;
	if (ACSblk->application)
	{
		if (ACSblk->multitask && Aroot_wi->work != NULL)
		{
			if (Awi_open(Aroot_wi) == FAIL)
				return FAIL;
		} else
		{
			Awi_ropen(Aroot_wi);
		}
	}
	
	return OK;
}

/* -------------------------------------------------------------------------- */

void TRwindow(void)
{
	int16 i;
	Awindow *win;
	
	if (--init != 0)
		return;
	Awi_update(BEG_UPDATE);
	for (i = _Wmax_wi; i >= 0; i--)
	{
		win = _ACSv_winds[i];
		if (win != NULL && win != Aroot_wi)
		{
			win->service(win, AS_TERM, NULL);
		}
	}
	ACSblk->ACSterm();
	Aroot_wi->service(Aroot_wi, AS_TERM, NULL);

	for (i = 0; i < MAX_WI_ICONS; i++)
	{
		if (_ACSv_wiicons[i] != NULL)
		{
			Aic_delete(_ACSv_wiicons[i][1].ob_spec.ciconblk);
			Ax_recycle(_ACSv_wiicons[i], NUM_ICO_OBJECTS * sizeof(OBJECT));
		}
	}
	Ax_release();
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_ontop(void)
{
	if (top_window == NULL)
		return Awi_root();
	return top_window;
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_setontop(Awindow *win)
{
	return top_window = win;
}

/* -------------------------------------------------------------------------- */

static boolean Awi_iconcreate(Awindow *win)
{
	CICONBLK *icon;
	OBJECT *tree;
	
	if (win->wi_id < 0 ||
		win->wi_id >= MAX_WI_ICONS ||
		_WWorkIcon == NULL ||
		_ACSv_wiicons[win->wi_id] != NULL ||
		(_ACSv_wiicons[win->wi_id] = tree = Ax_malloc(NUM_ICO_OBJECTS * sizeof(OBJECT))) == NULL)
		return FALSE;
	memcpy(tree, _WWorkIcon, NUM_ICO_OBJECTS * sizeof(OBJECT));
	if ((icon = win->iconblk) != NULL)
	{
		tree[1].ob_spec.ciconblk = Aic_create(icon);
	} else
	{
		if (win->name != NULL)
			tree[1].ob_spec.ciconblk->monoblk.ib_ptext = win->name;
		tree[1].ob_spec.ciconblk = Aic_create(_WIcon->ob_spec.ciconblk);
		_WIcon->ob_spec.ciconblk->monoblk.ib_ptext = _WIconText;
	}
	Aob_icon(&tree[1]);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean Awi_icondelete(Awindow *win)
{
	if (win->wi_id < 0 ||
		win->wi_id >= MAX_WI_ICONS ||
		_ACSv_wiicons[win->wi_id] == NULL)
		return FALSE;
	Aic_delete(_ACSv_wiicons[win->wi_id][1].ob_spec.ciconblk);
	Ax_recycle(_ACSv_wiicons[win->wi_id], NUM_ICO_OBJECTS * sizeof(OBJECT));
	_ACSv_wiicons[win->wi_id] = NULL;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

void Awi_invalid(void)
{
	int16 i;
	Awindow *win;
	
	for (i = 0; i < MAX_WI_ICONS; i++)
	{
		win = gemmap[i];
		if (win != NULL)
			win->wi_id = -1;
	}
	for (i = 0; i < MAX_WI_ICONS; i++)
	{
		win = gemmap[i];
		gemmap[i] = NULL;
		if (win != NULL)
		{
			Awi_closed(win);
			win->service(win, AS_ICONIZED, NULL);
		}
	}
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_wid(int16 wid)
{
	if (wid < 0 || wid >= MAX_WI_ICONS)
		return NULL;
	return gemmap[wid];
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_root(void)
{
	return Aroot_wi;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

/* Dummy Init-Routine */
int16 Awi_init(Awindow *win)
{
	return OK;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

/* Call another Program (return retvalue of Pexec(Basepage)) */
int32 Ash_prog(char *path, char *command, char *env)
{
	Awindow *map[MAX_WI_ICONS];
	Awindow *win;
	Awindow *topwin;
	int16 i = 0;
	int16 top;
	boolean isgem = FALSE;
	int16 pxy[8];
	int16 bar[4];
	int32 retcode = 0;
	char ext[10];
	char suffix[128] = "";
	char pathbuf[128] = "";
	char *slash;
	MFDB *bp = NULL;
	CONTEXT ctx;
	
	if (exec_com != NULL)
	{
		Ax_glfree(exec_com);
		exec_com = NULL;
	}
	if (exec_path != NULL)
	{
		Ax_glfree(exec_path);
		exec_path = NULL;
	}
	if (Ast_isEmpty(path))
		return -1;
	if ((ACSblk->description->flags & AB_LAZYEVAL) == 0)
	{
		strncat(pathbuf, path, sizeof(pathbuf) - 1);
		if ((slash = strrchr(pathbuf, PATH_SEP)) != NULL)
			*slash = '\0';
		Dsetdrv(Af_2drv(pathbuf));
		Dsetpath(&pathbuf[2]);
	}
	Ast_toupper(Af_2ext(ext, path));
	if ((slash = Ash_getenv("GEMSUFFIX")) != NULL)
	{
		Ast_toupper(strncat(suffix, slash, sizeof(suffix) - 1));
		suffix[sizeof(suffix) - 1] = '\0';
		slash = strtok(suffix, ",");
		while (slash != NULL)
		{
			if (strcmp(ext, slash) == 0)
			{
				isgem = TRUE;
				break;
			}
			slash = strtok(NULL, ",");
		}
	}
	if (!isgem)
	{
		if (strcmp(ext, "PRG") == 0 ||
			strcmp(ext, "APP") == 0 ||
			strcmp(ext, "GTP") == 0)
			isgem = TRUE;
	}
	
	if (ACSblk->multitask)
	{
		if (ACSblk->MagiCCookie == NULL)
			return shel_write(0, isgem ? 1 : 0, 1, path, command);
		else
			return shel_write(1, isgem ? 1 : 0, 100, path, command);
	}
	
	Awi_diaend();
	Amo_point();
	if (ACSblk->application)
	{
		Act_save(&ctx);
		wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
		topwin = Awi_wid(top);
		for (i = 1; i < MAX_WI_ICONS; i++)
		{
			map[i] = win = gemmap[i];
			gemmap[i] = NULL;
			if (win != NULL)
			{
				top = win->wi_id;
				wind_close(top);
				wind_delete(top);
				win->wi_id = -1;
				Aev_mess();
			}
		}
		if (Aroot_wi->wi_id == 0)
		{
			menu_bar(NULL, FALSE);
			wind_set_ptr_int(0, WF_NEWDESK, NULL, ROOT);
			if (isgem)
			{
				topline[ROOT].ob_spec.free_string = path;
				topline[ROOT].ob_width = ACSblk->desk.w;
				topline[ROOT].ob_height = ACSblk->desk.y - 1;
				objc_draw(topline, ROOT, 1, 0, 0, ACSblk->desk.w, ACSblk->desk.h);
				form_dial(FMD_FINISH, ACSblk->desk.x, ACSblk->desk.y, ACSblk->desk.w, ACSblk->desk.h,
					ACSblk->desk.x, ACSblk->desk.y, ACSblk->desk.w, ACSblk->desk.h);
			}
		}

		Aev_mess();
		if (isgem)
			shel_write(0, 1, 0, path, command);
		Awi_update(RESET_UPDATE);
		appl_exit();
		if (isgem)
		{
			retcode = Pexec(0, path, command, (void *)env);
		} else
		{
			graf_mouse(M_OFF, NULL);
			bp = Abp_create(ACSblk->desk.w, ACSblk->desk.y);
			if (bp != NULL)
			{
				pxy[0] = pxy[1] = pxy[4] = pxy[5] = 0;
				pxy[2] = pxy[6] = ACSblk->desk.w - 1;
				pxy[3] = pxy[7] = ACSblk->desk.y - 1;
				vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, &ACSblk->screenMFDB, bp);
			}
			bar[0] = bar[1] = 0;
			bar[2] = ACSblk->desk.x + ACSblk->desk.w - 1;
			bar[3] = ACSblk->desk.y + ACSblk->desk.h - 1;
			vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
			vsf_interior(ACSblk->vdi_handle, FIS_HOLLOW);
			vsf_perimeter(ACSblk->vdi_handle, FALSE);
			/* BUG: color not set */
			v_bar(ACSblk->vdi_handle, bar);
			(void) Cconws("\033H\033e");
			retcode = Pexec(0, path, command, (void *)env);
			(void) Cconws("\033f");
			if ((ACSblk->description->flags & AB_FEEDBACK) != 0)
			{
				(void) Cconws("[end]");
#if !WITH_FIXES
				while (Cconis() == 0)
				{
					;
				}
#endif
				(void) Cconin();
			}
			if (bp != NULL)
			{
				vro_cpyfm(ACSblk->vdi_handle, S_ONLY, pxy, bp, &ACSblk->screenMFDB);
				Abp_delete(bp);
			}
			graf_mouse(M_ON, NULL);
		}

		wind_new();
		appl_exit();
		ACSblk->gl_apid = appl_init();
		Awi_update(RESTART_UPDATE);
		wind_set_ptr_int(0, WF_NEWDESK, NULL, ROOT);
		win = Aroot_wi;
		if (win->wi_id == 0)
		{
			if (win->work != NULL)
				wind_set_ptr_int(0, WF_NEWDESK, win->work, ROOT);
			menu_bar(win->menu, TRUE);
			form_dial(FMD_FINISH, ACSblk->desk.x, ACSblk->desk.y, ACSblk->desk.w, ACSblk->desk.h,
				ACSblk->desk.x, ACSblk->desk.y, ACSblk->desk.w, ACSblk->desk.h);
		}

		for (i = 1; i < MAX_WI_ICONS; i++)
		{
			win = map[i];
			if (win != NULL)
				win->open(win);
		}
		if (topwin != NULL)
			topwin->topped(topwin);
		Act_restore(&ctx);
	} else
	{
		int16 msg[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
		int loops = 20;
		int16 dummy;
		A_dd *dd;
		
		for (dd = NULL; (dd = Ash_nextdd(dd)) != NULL; )
		{
			if ((dd->type & DD_VA) && (dd->va_val[0] & VA_PROT_STARTPROG))
				break;
		}
		if (dd == NULL)
			return -1;
		if ((exec_path = Ax_glmalloc(strlen(path) + 1)) == NULL)
			return -1;
		strcpy(exec_path, path);
		if (command != NULL)
		{
			if ((exec_com = Ax_glmalloc(strlen(command))) == NULL)
			{
				Ax_glfree(exec_path);
#if WITH_FIXES
				exec_path = NULL;
#endif
				return -1;
			}
			strcpy(exec_com, command + 1);
		}
		Awi_update(RESET_UPDATE);
		Aev_mess();
		msg[0] = AV_STARTPROG;
		msg[1] = ACSblk->gl_apid;
		msg[3] = (int32)exec_path >> 16;
		msg[4] = (int16)(int32)exec_path & 0xffff;
		msg[5] = (int32)exec_com >> 16;
		msg[6] = (int16)(int32)exec_com & 0xffff;
		if (appl_write(dd->id, (int)sizeof(msg), msg) != 0)
		{
			while (loops != 0)
			{
				if (evnt_multi(MU_MESAG | MU_TIMER,
					0, 0, 0,
					0, 0, 0, 0, 0,
					0, 0, 0, 0, 0,
					msg,
					500, 0,
					&dummy, &dummy, &dummy, &dummy, &dummy, &dummy) & MU_MESAG)
				{
					if (msg[0] == AC_CLOSE)
					{
						Aev_GetAcClose(NULL);
						Aev_unhidepointer();
						retcode = 0;
						break;
					}
					if (msg[0] == VA_PROGSTART)
					{
						retcode = msg[3] == 0 ? -1L : 0L;
						break;
					} else
					{
						Awi_update(RESTART_UPDATE);
						Aev_message(msg);
						Awi_update(RESET_UPDATE);
					}
				}
				loops--;
			}
		} else
		{
			retcode = -1;
		}
		Awi_update(RESTART_UPDATE);
	}

	Aev_mess();
	Aev_release();
	Awi_diastart();
	return retcode;
}

/* -------------------------------------------------------------------------- */

static int16 Awi_catch(Awindow *win)
{
	int16 wh;
	int16 startcycle;
	Awindow *old;
	int16 g[4] = { 0, 0, 0, 0 };

	if ((win->wi_kind & BACKDROP) != 0)
	{
		/* is BACKDROP supported? */
		if (appl_getinfo(AES_WINDOW, &g[0], &g[1], &g[2], &g[3]) == 0 ||
			(g[2] & 6) == 0)
#if WITH_FIXES
			win->wi_kind &= ~BACKDROP;
#else
			win->kind &= ~BACKDROP;
#endif
	}
	if ((win->wi_kind & HOTCLOSEBOX) != 0)
	{
		/* is HOTCLOSEBOX supported? */
		if (appl_getinfo(AES_WINDOW, &g[0], &g[1], &g[2], &g[3]) == 0 ||
			(g[2] & 8) == 0)
#if WITH_FIXES
			win->wi_kind &= ~HOTCLOSEBOX;
#else
			win->kind &= ~HOTCLOSEBOX;
#endif
	}
	wh = wind_create(win->wi_kind, 0, 0, 0, 0);
	if (wh >= MAX_WI_ICONS)
	{
#if WITH_FIXES
		wind_delete(wh);
		form_alert(1, _ALIB_ERR_WINDOW);
#endif
		return -1;
	}
	if (wh < 0)
	{
		startcycle = cycle;
		do
		{
			cycle = (cycle + 1) & (MAX_WI_ICONS - 1);
			old = gemmap[cycle];
			if (cycle != 0 &&
				old != NULL &&
				(old->kind & AW_STAY) == 0 &&
				(old->state & AWS_MODAL_WIN) == 0)
			{
				Awi_closed(old);
				old->service(old, AS_ICONIZED, NULL);
				wh = wind_create(win->wi_kind, 0, 0, 0, 0);
				break;
			}
		} while (startcycle != cycle);
	}
#if WITH_FIXES
	if (wh > 0 && wh < MAX_WI_ICONS)
#else
	if (wh >= 0 && wh <= MAX_WI_ICONS)
#endif
		return wh;
	form_alert(1, _ALIB_ERR_WINDOW);
	return -1;
}

/* -------------------------------------------------------------------------- */

/* Next Window from total Set */
Awindow *Awi_list(void)
{
	static int16 next = 0;
	int16 done;
	Awindow *win;
	
	done = 0;
	do
	{
		if (next > _Wmax_wi)
		{
			next = 0;
			if (done != 0)
				return NULL;
			done++;
		}
		win = _ACSv_winds[next];
		next++;
	} while (win == NULL);
	return win;
}

/* -------------------------------------------------------------------------- */

/* Sends Message to all Windows */
void Awi_sendall(int16 task, void *in_out)
{
	int16 i;
	Awindow *win;
	
	for (i = _Wmax_wi; i >= 0; i--)
	{
		if ((win = _ACSv_winds[i]) != NULL)
			win->service(win, task, in_out);
	}
}

/* -------------------------------------------------------------------------- */

void Awi_lateupdate(void)
{
	int16 i;
	Awindow *win;
	
	for (i = _Wmax_wi; i >= 0; i--)
	{
		win = _ACSv_winds[i];
		if (win != NULL && (win->state & AWS_LATEUPDATE) != 0)
		{
			win->state &= ~AWS_LATEUPDATE;
			if (win->wi_id >= 0)
			{
				win->state &= ~AWS_MODIFIED;
				win->init(win);
				if ((win->state & AWS_FORCEREDRAW) != 0)
					win->sized(win, &win->wi_act);
			} else
			{
				win->state |= AWS_MODIFIED;
			}
			Ax_release();
		}
	}
}

/* -------------------------------------------------------------------------- */

/* Cycle Up Windows */
void Awi_up(void)
{
	int16 startcycle;
	int16 top;
	Awindow *win;
	
	startcycle = cycle;
	do
	{
		cycle = (cycle + 1) & (MAX_WI_ICONS - 1);
		win = gemmap[cycle];
		if (cycle != 0 && win != NULL)
		{
			wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
			if (win->wi_id != top)
			{
				win->topped(win);
				break;
			}
		}
	} while (startcycle != cycle);
}

/* -------------------------------------------------------------------------- */

/* Cycle down Windows */
void Awi_down(void)
{
	int16 startcycle;
	int16 top;
	Awindow *win;
	
	startcycle = cycle;
	do
	{
		cycle = (cycle - 1) & (MAX_WI_ICONS - 1);
		win = gemmap[cycle];
		if (cycle != 0 && win != NULL)
		{
			wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
			if (win->wi_id != top)
			{
				win->topped(win);
				break;
			}
		}
	} while (startcycle != cycle);
}

/* -------------------------------------------------------------------------- */

/* Show Window */
void Awi_show(Awindow *win)
{
	if (win->wi_id > 0)
		win->topped(win);
	else
		win->open(win);
	Awi_setontop(win);
}

/* -------------------------------------------------------------------------- */

/* Creates a Copy of Awindow x */
Awindow *Awi_selfcreate(void *x)
{
	if (x != NULL)
		return Awi_create(x);
	return NULL;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void MakeModernMenu(OBJECT *menu)
{
	OBJECT *ptr;
	char *str;
	OBJECT obj;
	boolean niceline;
	int16 ok;
	AUSERBLK *auser;
	
	static AUSERBLK dis_arrow_mon = { A_arrows, 0x22090001L, NULL, NULL, NULL, NULL, NULL, NULL };
	static AUSERBLK dis_arrow_col = { A_arrows, 0x22010009L, NULL, NULL, NULL, NULL, NULL, NULL };
	static int16 box_trans = -1;

	ptr = menu;
	ok = 1;
	if (box_trans == -1)
	{
		int16 dummy;
		int16 g1;
		
		if (appl_getinfo(AES_OBJECT, &g1, &dummy, &dummy, &dummy) != 0)
			box_trans = (g1 & 1) != 0;
		else
			box_trans = 0;
	}
	do
	{
		if (box_trans != 0 && ptr->ob_type == G_BOX)
		{
			ptr->ob_spec.obspec.interiorcol = G_LWHITE;
			ptr->ob_spec.obspec.fillpattern = IP_SOLID;
			ptr->ob_spec.obspec.textmode = 1;
			ptr->ob_flags |= OF_FL3DBAK;
		}
		if ((ptr->ob_state & OS_DISABLED) != 0 && ptr->ob_type == G_STRING)
		{
			str = ptr->ob_spec.free_string;
			if (Ast_isEmpty(str))
			{
				niceline = FALSE;
			} else
			{
				niceline = TRUE;
				while (niceline && *str != '\0')
				{
					niceline = *str == '-';
					str++;
				}
			}
			if (niceline)
			{
				if (ACSblk->ncolors >= 16)
					auser = Aus_create(&dis_arrow_col);
				else
					auser = Aus_create(&dis_arrow_mon);
				if (auser != NULL)
				{
					memcpy(&obj, ptr, sizeof(obj));
					ptr->ob_type = G_USERDEF;
					ptr->ob_spec.auserblk = auser;
					if (auser->ub_serv != NULL)
						auser->ub_serv(ptr, AUO_CREATE, &ok);
					else
						ok = TRUE;
					if (ok != FAIL)
					{
						if ((obj.ob_state & AOS_CONST) == 0)
							Ast_delete(obj.ob_spec.free_string);
					} else
					{
						Aus_delete(auser);
						memcpy(ptr, &obj, sizeof(*ptr));
					}
				}
			}
		}
		
		if ((ptr->ob_state & OS_DISABLED) != 0 &&
			ptr->ob_type == G_USERDEF &&
			ptr->ob_spec.auserblk->ub_code == A_arrows &&
			ptr->ob_spec.auserblk->ub_parm == 0x22090001L &&
			ACSblk->ncolors >= 16)
			ptr->ob_spec.auserblk->ub_parm = 0x22010009L;
		
	} while (((ptr++)->ob_flags & OF_LASTOB) == 0);
}

/* -------------------------------------------------------------------------- */

static void MakeOldMenu(OBJECT *menu)
{
	OBJECT *ptr;
	Awindow *win;
	
	win = Awi_root();
	ptr = menu;
#if WITH_FIXES
	for (;;)
#else
	while ((ptr->ob_flags & OF_LASTOB) == 0)
#endif
	{
		if (ptr->ob_type == G_BOX)
		{
			if (win == NULL || win->menu != menu)
			{
				ptr->ob_spec.obspec.interiorcol = G_WHITE;
				ptr->ob_spec.obspec.fillpattern = IP_SOLID;
				ptr->ob_spec.obspec.textmode = 0;
			}
			ptr->ob_flags &= ~OF_FL3DBAK;
		}

		if ((ptr->ob_state & OS_DISABLED) != 0 &&
			ptr->ob_type == G_USERDEF &&
			ptr->ob_spec.auserblk->ub_code == A_arrows)
			ptr->ob_spec.auserblk->ub_parm = 0x22090001L;
		
#if WITH_FIXES
		if ((ptr->ob_flags & OF_LASTOB) != 0)
			break;
#endif
		ptr++;
	}
}

/* -------------------------------------------------------------------------- */

/* Toggle the layout */
void Awi_layout(int16 flag3D, int16 flagModernMenu, boolean redraw)
{
	Awindow *win;
	int i;
	boolean oldmenu;
	boolean changed;
	
	if (flag3D > -1)
	{
		if (flag3D != 0)
			ACSblk->description->flags &= ~AB_NO3D;
		else
			ACSblk->description->flags |= AB_NO3D;
	}
	if (flagModernMenu > -1)
	{
		if (flagModernMenu != 0)
			ACSblk->description->flags &= ~AB_OLDMENU;
		else
			ACSblk->description->flags |= AB_OLDMENU;
	}
	oldmenu = (ACSblk->description->flags & AB_OLDMENU) != 0;
	for (i = 0; i < MAX_WINDS; i++)
	{
		win = _ACSv_winds[i];
		if (win != NULL && win->menu != NULL)
		{
			changed = TRUE;
			if (win->service(win, AS_CHANGE_LAYOUT, &changed) == FALSE || changed)
			{
				if (oldmenu)
					MakeOldMenu(win->menu);
				else
					MakeModernMenu(win->menu);
			}
		}
	}
	
	if (redraw)
		Aev_WmRedraw(ACSblk->gl_apid, -1, &ACSblk->desk);
}

/* -------------------------------------------------------------------------- */

/* create a copy of window x */
Awindow *Awi_create(const Awindow *parent)
{
	int i;
	Awindow *win;
	
	win = Ax_malloc(sizeof(*win));
#if WITH_FIXES
	if (win == NULL)
	{
		ACSblk->ACSerror(AE_OUT_OF_MEM, NULL);
		return NULL;
	}
#endif
	memcpy(win, parent, sizeof(*win));
	if (win->work != NULL)
	{
		win->work = Aob_create(win->work);
		if (win->work == NULL)
		{
			Ax_recycle(win, sizeof(*win));
			return NULL;
		}
		Aob_fix(win->work);
	}
	if (win->toolbar != NULL)
	{
		win->toolbar = Aob_create(win->toolbar);
		if (win->toolbar == NULL)
		{
			Aob_delete(win->work);
			Ax_recycle(win, sizeof(*win));
			return NULL;
		}
		Aob_fix(win->toolbar);
	}
	if (win->menu != NULL)
	{
		win->menu = Aob_create(win->menu);
		if (win->menu == NULL)
		{
			Aob_delete(win->toolbar);
			Aob_delete(win->work);
			Ax_recycle(win, sizeof(*win));
			return NULL;
		}
		if (ACSblk->description->flags & AB_OLDMENU)
			MakeOldMenu(win->menu);
		else
			MakeModernMenu(win->menu);
		Aob_fix(win->menu);
		Ame_namefix(win->menu);
	}
	if (win->iconblk != NULL)
	{
		win->iconblk = Aic_create(win->iconblk);
		if (win->iconblk == NULL)
		{
			Aob_delete(win->menu);
			Aob_delete(win->toolbar);
			Aob_delete(win->work);
			Ax_recycle(win, sizeof(*win));
			return NULL;
		}
	}
	Awi_uoself(win);
	if (win->name != NULL)
		win->name = Ast_create(win->name);
	if (win->info != NULL)
		win->info = Ast_create(win->info);
	if (win->help_title != NULL)
		win->help_title = Ast_create(win->help_title);
	if (win->help_file != NULL)
		win->help_file = Ast_create(win->help_file);
	
	win->state = AWS_MODIFIED;
	win->icon = -1;
	win->ob_edit = -1;
	win->ob_len = 0;
	for (i = 0; i < MAX_WINDS; i++)
	{
		if (_ACSv_winds[i] == NULL)
		{
			if (i > _Wmax_wi)
				_Wmax_wi = i;
			_ACSv_winds[i] = win;
			if (Aroot_wi != NULL && (win->kind & AW_ICON) != 0)
			{
				Aroot_wi->service(Aroot_wi, AS_PLACEICON, win);
			}
			win->wi_act.x = win->wi_act.x * ACSblk->gl_wbox;
			win->wi_act.y = win->wi_act.y * ACSblk->gl_hbox;
			win->wi_act.w = win->wi_act.w * ACSblk->gl_wbox;
			win->wi_act.h = win->wi_act.h * ACSblk->gl_hbox;
			return win;
		}
	}
	form_alert(1, _ALIB_ERR_WISLOT);
	return NULL;
}

/* -------------------------------------------------------------------------- */

void Awi_slider(Awindow *win)
{
	Axywh *slider;
	int16 wh;
	
	wh = win->wi_id;
	if (wh >= 0)
	{
		slider = &win->wi_slider;
		if (win->wi_kind & HSLIDE)
		{
			wind_set(wh, WF_HSLIDE, slider->x, 0, 0, 0);
			wind_set(wh, WF_HSLSIZE, slider->w, 0, 0, 0);
		}
		if (win->wi_kind & VSLIDE)
		{
			wind_set(wh, WF_VSLIDE, slider->y, 0, 0, 0);
			wind_set(wh, WF_VSLSIZE, slider->h, 0, 0, 0);
		}
	}
}

/* -------------------------------------------------------------------------- */

/* Open Window */
int16 Awi_open(Awindow *win)
{
	int16 wh;
	int16 dummy;
	int16 icon;
	Axywh rect = { -1, 0, 0, 0 };
	Axywh work;
	OBJECT *tree;
	A_dd *dd;
	
	if (win->wi_id >= 0)
		return OK;

	if (win->state & AWS_MODIFIED)
	{
		win->state &= ~AWS_MODIFIED;
		if (win->init(win) != OK)
			return FAIL;
	}
	win->state &= ~AWS_ICONIZED;
	wh = Awi_catch(win);
	if (wh < 0)
		return FAIL;
	if (win->work == NULL)
		win->work = Aob_create(empty);
	win->wi_id = wh;
	gemmap[wh] = win;
	if (win->kind & AW_TOOLBOX)
		wind_set(wh, WF_BEVENT, 1, 0, 0, 0);

#if WITH_FIXES
	if ((win->wi_kind & NAME) != 0)
		wind_set_str(wh, WF_NAME, win->name != NULL ? win->name : "");
#else
	wind_set(wh, WF_NAME, win->name, 0, 0);
#endif

#if WITH_FIXES
	if ((win->wi_kind & INFO) != 0)
		wind_set_str(wh, WF_INFO, win->info != NULL ? win->info : "");
#else
		wind_set(wh, WF_INFO, win->info, 0, 0);
#endif
	
	if (win->wi_act.y == 0)
	{
		if ((ACSblk->description->flags & AB_CENTERDIALOG) != 0 && win->work != NULL)
		{
			form_center(win->work, &work.x, &work.y, &work.w, &work.h);
			win->work->ob_x = win->work->ob_y = 0;
			if (win->toolbar != NULL)
				work.y -= win->toolbar->ob_height;
			wind_calc(WC_BORDER, win->wi_kind, work.x, work.y, work.w, work.h,
				&win->wi_act.x, &win->wi_act.y, &dummy, &dummy);
		} else
		{
			win->wi_act.x = (wh + 8) * 8;
			win->wi_act.y = (wh + 3) * 8;
			win->service(win, AS_WIAUTOPOS, NULL);
		}
	}

	Awi_oblist(win);
	Awi_slider(win);

	icon = win->icon;
	if (icon >= 0 && Aroot_wi != NULL)
	{
		if ((win->kind & AW_GHOSTICON) != 0)
			Aroot_wi->service(Aroot_wi, AS_GHOSTICON, &win->icon);
		else
			Aroot_wi->service(Aroot_wi, AS_REMICON, &win->icon);
		if (Aroot_wi->work != NULL)
		{
			Aob_offset(&rect, Aroot_wi->work, win->icon);
			rect.x += Aroot_wi->wi_work.x;
			rect.y += Aroot_wi->wi_work.y;
		}
	}
	
	if (rect.x < 0)
	{
		rect.x = rect.y = 0;
		rect.w = rect.h = 48;
	}
	
	Awi_diaend();
	if (ACSblk->description->flags & AB_FEEDBACK)
	{
		graf_growbox(rect.x, rect.y, rect.w, rect.h, win->wi_act.x, win->wi_act.y, win->wi_act.w, win->wi_act.h);
	}
	wind_open(wh, win->wi_act.x, win->wi_act.y, win->wi_act.w, win->wi_act.h);
	if (ACSblk->AESglobal[0] > 0x300 && ACSblk->AESglobal[0] < 0x400)
		Awi_slider(win);
	Awi_setontop(win);

	dd = NULL;
	while ((dd = Ash_nextdd(dd)) != NULL)
	{
		if (dd->type & DD_VA)
		{
			int16 msg[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
			
			msg[0] = AV_ACCWINDOPEN;
			msg[1] = ACSblk->gl_apid;
			msg[3] = wh;
			appl_write(dd->id, (int)sizeof(msg), msg);
#if !WITH_FIXES
			break;
#endif
		}
	}

	tree = win->work;
	Aev_mess();
	if (win->ob_edit < 0)
	{
		win->ob_edit = Aob_findflag(tree, -1, OF_EDITABLE);
		if (win->ob_edit < 0 && win->toolbar != NULL)
			win->ob_edit = Aob_findflag(win->toolbar, -1, OF_EDITABLE) | A_TOOLBAR;
		if (win->ob_edit > 0)
			win->ob_col = -1;
	}
	Awi_diastart();
	return OK;
}

/* -------------------------------------------------------------------------- */

int16 Awi_register(Awindow *win)
{
	int16 wh;
	int16 icon;
	Axywh rect = { -1, 0, 0, 0 };
	A_dd *dd;

	if (win->wi_id < 0)
		return FAIL;
#if WITH_FIXES
	if (win->wi_id >= MAX_WI_ICONS)
		return FAIL;
#endif
	if (win->state & AWS_MODIFIED)
	{
		win->state &= ~AWS_MODIFIED;
		if (win->init(win) != OK)
			return FAIL;
	}
	win->state &= ~AWS_ICONIZED;
	if (win->work == NULL)
		win->work = Aob_create(empty);
	wh = win->wi_id;
	gemmap[wh] = win;
	
	if (win->kind & AW_TOOLBOX)
		wind_set(wh, WF_BEVENT, 1, 0, 0, 0);

#if WITH_FIXES
	if ((win->wi_kind & NAME) != 0)
		wind_set_str(wh, WF_NAME, win->name != NULL ? win->name : "");
#else
	wind_set(wh, WF_NAME, win->name, 0, 0);
#endif
#if WITH_FIXES
	if ((win->wi_kind & INFO) != 0)
		wind_set_str(wh, WF_INFO, win->info != NULL ? win->info : "");
#else
		wind_set(wh, WF_INFO, win->info, 0, 0);
#endif

	icon = win->icon;
	if (icon >= 0 && Aroot_wi != NULL)
	{
		if ((win->kind & AW_GHOSTICON) != 0)
			Aroot_wi->service(Aroot_wi, AS_GHOSTICON, &win->icon);
		else
			Aroot_wi->service(Aroot_wi, AS_REMICON, &win->icon);
		if (Aroot_wi->work != NULL)
		{
			Aob_offset(&rect, Aroot_wi->work, win->icon);
			rect.x += Aroot_wi->wi_work.x;
			rect.y += Aroot_wi->wi_work.y;
		}
	}

	if (rect.x < 0)
	{
		rect.x = rect.y = 0;
		rect.w = rect.h = 48;
	}
	
	Awi_diaend();
	
	if (ACSblk->description->flags & AB_FEEDBACK)
	{
		graf_growbox(rect.x, rect.y, rect.w, rect.h, win->wi_act.x, win->wi_act.y, win->wi_act.w, win->wi_act.h);
	}

	if (ACSblk->AESglobal[0] > 0x300 && ACSblk->AESglobal[0] < 0x400)
		Awi_slider(win);
	Awi_setontop(win);

	dd = NULL;
	while ((dd = Ash_nextdd(dd)) != NULL)
	{
		if (dd->type & DD_VA)
		{
			int16 msg[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
			
			msg[0] = AV_ACCWINDOPEN;
			msg[1] = ACSblk->gl_apid;
			msg[3] = wh;
			appl_write(dd->id, (int)sizeof(msg), msg);
#if !WITH_FIXES
			break;
#endif
		}
	}

	Aev_mess();
	return OK;
}

/* -------------------------------------------------------------------------- */

int16 Awi_backdrop(Awindow *win)
{
	if (win->wi_id <= 0)
		return OK;
	if ((win->state & AWS_MODAL_WIN) != 0)
	{
	} else
	{
		wind_set(win->wi_id, WF_BOTTOM, 0, 0, 0, 0);
	}
	return OK;
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_modal(void)
{
	int i;
	
	for (i = MAX_MODWINS - 1; i >= 0; i--)
		if (modwins[i] != NULL)
			return modwins[i];
	return NULL;
}

/* -------------------------------------------------------------------------- */

void Awi_up_modal(void)
{
	Awindow *modal;
	int16 top;
	
	modal = Awi_modal();
	if (modal == NULL)
		return;
	wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
	if (modal->wi_id != top)
	{
		wind_set(modal->wi_id, WF_TOP, 0, 0, 0, 0);
		modal->state |= AWS_FORCEREDRAW;
		modal->sized(modal, &modal->wi_act);
		Awi_setontop(modal);
	} else
	{
		if ((ACSblk->description->flags & AB_CENTERDIALOG) == 0)
		{
			if (!Aob_within(&modal->wi_work, ACSblk->ev_mmox, ACSblk->ev_mmoy))
			{
				modal->wi_act.x = min(ACSblk->desk.w - modal->wi_act.w, ACSblk->ev_mmox - (modal->wi_act.w >> 1));
				modal->wi_act.y = min(ACSblk->desk.y + ACSblk->desk.h - modal->wi_act.h, ACSblk->ev_mmoy - (modal->wi_act.h >> 1));
				modal->wi_act.x = max(ACSblk->desk.x, modal->wi_act.x);
				modal->wi_act.y = max(ACSblk->desk.y, modal->wi_act.y);
				modal->state &= ~AWS_FULL;
				Awi_cleanup(modal);
				wind_set(modal->wi_id, WF_CURRXYWH, modal->wi_act.x, modal->wi_act.y, modal->wi_act.w, modal->wi_act.h);
			}
		} else
		{
			if (ACSblk->description->flags & AB_ACUSTIC)
				Bconout(2, 7);
		}
	}
}

/* -------------------------------------------------------------------------- */

static int16 Awi_set_modal(Awindow *win, boolean modal)
{
	int i;
	int16 top;
	
	if (modal)
	{
		for (i = 0; i < MAX_MODWINS; i++)
		{
			if (modwins[i] == NULL)
			{
				modwins[i] = win;
				break;
			}
		}
		if (i == MAX_MODWINS)
			return FAIL;
		if (i == 0)
			Awi_show_menu(FALSE);
		wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
		if (win->wi_id > 0 && top != win->wi_id)
			win->topped(win);
		Awi_setontop(win);
	} else
	{
		if ((win->state & AWS_MODAL_WIN) == 0)
			return OK;
		for (i = MAX_MODWINS - 1; i >= 0; i--)
		{
			if (modwins[i] == win)
			{
				modwins[i] = NULL;
				break;
			}
		}
		if (i == 0)
			Awi_show_menu(TRUE);
	}
	return OK;
}

/* -------------------------------------------------------------------------- */

void Awi_show_menu(boolean show)
{
	int16 title;
	OBJECT *menu;
	
	if (!_ACSv_wmenu || Aroot_wi == NULL || Aroot_wi->menu == NULL)
		return;
	menu = Aroot_wi->menu;
	if (show)
	{
		if (Awi_modal() != NULL || A_isModDia())
			return;
		menu_bar(NULL, 0);
		menu[menu[menu[menu[menu[ROOT].ob_head].ob_next].ob_head].ob_head].ob_state &= ~OS_DISABLED;
		title = menu[menu[2].ob_head].ob_next;
		while (title != 2)
		{
			menu[title].ob_state &= ~OS_DISABLED;
			title = menu[title].ob_next;
		}
		menu[2].ob_width = menu_width;
		menu_bar(menu, TRUE);
	} else
	{
		if (Awi_modal() == NULL && !A_isModDia())
			return;
		menu_bar(NULL, 0);
		menu[menu[menu[menu[menu[ROOT].ob_head].ob_next].ob_head].ob_head].ob_state |= OS_DISABLED;
		menu[menu[menu[menu[menu[ROOT].ob_head].ob_next].ob_head].ob_head].ob_state &= ~OS_SELECTED;
		menu[2].ob_width = menu[3].ob_width;
		title = menu[2].ob_head;
		menu[title].ob_state &= ~OS_SELECTED;
		title = menu[title].ob_next;
		while (title != 2)
		{
			menu[title].ob_state |= OS_DISABLED;
			title = menu[title].ob_next;
		}
		menu_bar(menu, TRUE);
	}
}

/* -------------------------------------------------------------------------- */

static int16 Awi_ropen(Awindow *root)
{
	OBJECT *menu;
	OBJECT *tree;
	
	menu = root->menu;
	gemmap[0] = root;
	root->wi_id = 0;
	if (menu != NULL)
	{
		menu[menu[menu[menu[ROOT].ob_head].ob_head].ob_head].ob_spec.free_string = Ast_create(&ACSblk->basename[1]);
		Ame_namefix(menu);
		menu_bar(menu, TRUE);
		menu_width = menu[2].ob_width;
		_ACSv_wmenu = TRUE;
	}
	if ((root->state & AWS_MODIFIED) != 0)
	{
		root->state &= ~AWS_MODIFIED;
		if (root->init(root) != OK)
			return FAIL;
	}

	tree = root->work;
	if (tree != NULL)
	{
		tree->ob_x = ACSblk->desk.x;
		tree->ob_y = ACSblk->desk.y;
		tree->ob_width = ACSblk->desk.w;
		tree->ob_height = ACSblk->desk.h;
		wind_set_ptr_int2(0, WF_NEWDESK, tree, 0, 0);
		form_dial(FMD_FINISH, ACSblk->desk.x, ACSblk->desk.y, ACSblk->desk.w, ACSblk->desk.h,
			ACSblk->desk.x, ACSblk->desk.y, ACSblk->desk.w, ACSblk->desk.h);
		_ACSv_wwork = TRUE;
	}
	
	root->wi_work.x = 0;
	root->wi_work.y = 0;
	root->wi_work.w = ACSblk->desk.x + ACSblk->desk.w;
	root->wi_work.h = ACSblk->desk.y + ACSblk->desk.h;
	
	return OK;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/* Close Window */
void Awi_closed(Awindow *win)
{
	int16 wh;
	Axywh rect;
	A_dd *dd;
	
	if (Awi_modal() != NULL && win != Awi_modal())
		return;
	wh = win->wi_id;
	win->wi_id = -1;
	if (win->state & AWS_DIALOG)
		Awi_diaend();
	win->ob_edit = win->ob_col = win->ob_len = -1;
	if (ACSblk->Aselect.window == win)
		Adr_unselect();
	if (wh == 0)
	{
		wind_set(0, WF_NEWDESK, 0, 0, 0, 0);
		menu_bar(NULL, FALSE);
	} else
	{
		if ((win->state & (AWS_MODAL_WIN | AWS_TERM)) == 0 && Aroot_wi != NULL)
		{
			if (win->icon >= 0)
				Aroot_wi->service(Aroot_wi, AS_NORMICON, &win->icon);
			else
				Aroot_wi->service(Aroot_wi, AS_PLACEICON, win);
		}
		if (wh > 0)
		{
			if (ACSblk->description->flags & AB_FEEDBACK)
			{
				if (win->icon >= 0 && Aroot_wi != NULL && Aroot_wi->work != NULL)
				{
					Aob_offset(&rect, Aroot_wi->work, win->icon);
					rect.x += Aroot_wi->wi_work.x;
					rect.y += Aroot_wi->wi_work.y;
				} else
				{
					rect.x = rect.y = 0;
					rect.w = rect.h = 48;
				}
				graf_shrinkbox(rect.x, rect.y, rect.w, rect.h, win->wi_act.x, win->wi_act.y, win->wi_act.w, win->wi_act.h);
			}
			wind_close(wh);
			if (Awi_ontop() == win)
				Awi_setontop(NULL);
			wind_delete(wh);
			Awi_set_modal(win, FALSE);
			
			dd = NULL;
			while ((dd = Ash_nextdd(dd)) != NULL)
			{
				if (dd->type & DD_VA)
				{
					int16 msg[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
					
					msg[0] = AV_ACCWINDCLOSED;
					msg[1] = ACSblk->gl_apid;
					msg[3] = wh;
					appl_write(dd->id, (int)sizeof(msg), msg);
#if !WITH_FIXES
					break;
#endif
				}
			}
			Aev_mess();
			Amo_new(&ACSblk->description->mouse[MOUSE_ARROW]);
		}
	}
	if (wh >= 0
#if WITH_FIXES
		&& wh < MAX_WI_ICONS
#endif
		)
		gemmap[wh] = NULL;
}

/* -------------------------------------------------------------------------- */

/* Free Window */
void Awi_delete(Awindow *win)
{
	int i;
	
	win->state |= AWS_TERM;
	if (ACSblk->Aselect.window == win)
		ACSblk->Aselect.actlen = 0;
	CheckPcHelp(win);
	CheckSTGuide(win);
	Awi_icondelete(win);
	for (i = 100; win->wi_id >= 0 && i > 0; i--)
	{
		win->closed(win);
	}
	if (i <= 0)
	{
		win->state &= ~AWS_ICONIZED;
		Awi_closed(win);
	}
	if (win->icon >= 0 && Aroot_wi != NULL)
	{
		Aroot_wi->service(Aroot_wi, AS_REMICON, &win->icon);
	}
	Ast_delete(win->help_file);
	Ast_delete(win->help_title);
	Ast_delete(win->info);
	Ast_delete(win->name);
	Aic_delete(win->iconblk);
	Aob_delete(win->menu);
	Aob_delete(win->toolbar);
	Aob_delete(win->work);
	if (win == Aroot_wi)
	{
		Aroot_wi = NULL;
		Aev_quit();
	}
	for (i = 0; i <= _Wmax_wi; i++)
	{
		if (_ACSv_winds[i] == win)
		{
			_ACSv_winds[i] = NULL;
			if (i == _Wmax_wi)
			{
				while (_Wmax_wi-- > 0 && _ACSv_winds[_Wmax_wi] == NULL)
				{
					;
				}
			}
			Ax_recycle(win, sizeof(*win));
			break;
		}
	}
}

/* -------------------------------------------------------------------------- */

/* Top this Window */
void Awi_topped(Awindow *win)
{
	int16 wh;
	
	wh = win->wi_id;
	if (wh > 0)
	{
		if (Awi_modal() != NULL)
		{
			Awi_up_modal();
		} else
		{
			Awi_diaend();
			wind_set(wh, WF_TOP, 0, 0, 0, 0);
			Awi_setontop(win);
		}
	}
}

/* -------------------------------------------------------------------------- */

/* Fullsize Window */
void Awi_fulled(Awindow *win)
{
	int16 dummy;
	int16 snapx;
	int16 snapy;
	Axywh *act;
	Axywh *normal;
	OBJECT *tree;
	OBJECT *menu;
	
	if (win->wi_id <= 0)
		return;
	tree = win->work;
	act = &win->wi_act;
	normal = &win->wi_normal;
	if (win->state & AWS_FULL)
	{
		act->x = normal->x;
		act->y = normal->y;
		act->w = normal->w;
		act->h = normal->h;
		if (tree->ob_x != win->wi_nx || tree->ob_y != win->wi_ny)
			win->state |= AWS_FORCEREDRAW;
		tree->ob_x = win->wi_nx;
		tree->ob_y = win->wi_ny;
	} else
	{
		normal->x = act->x;
		normal->y = act->y;
		normal->w = act->w;
		normal->h = act->h;
		if (win->kind & AW_OBLIST)
		{
			act->x = ACSblk->desk.x;
			act->y = ACSblk->desk.y;
			act->w = ACSblk->desk.w;
			act->h = ACSblk->desk.h;
		} else
		{
			snapx = win->snap_mask | -256;
			snapy = win->snap_mask >> 8;
			tree->ob_width += ~snapx;
			tree->ob_width &= snapx;
			tree->ob_height += ~snapy;
			tree->ob_height &= snapy;
			wind_calc(WC_BORDER, win->wi_kind, 0, 0, tree->ob_width, tree->ob_height,
				&dummy, &dummy, &act->w, &act->h);
			if (act->x + act->w > ACSblk->desk.x + ACSblk->desk.w)
				act->x = ACSblk->desk.x;
			if ((menu = win->menu) != NULL)
			{
				act->h += menu[menu[ROOT].ob_head].ob_height;
			}
			if (win->toolbar != NULL)
				act->h += win->toolbar->ob_height;
			if (act->y + act->h > ACSblk->desk.y + ACSblk->desk.h)
				act->y = ACSblk->desk.y;
			
		}
		win->wi_nx = tree->ob_x;
		win->wi_ny = tree->ob_y;
		if (tree->ob_x != 0 || tree->ob_y != 0)
			win->state |= AWS_FORCEREDRAW;
		tree->ob_x = 0;
		tree->ob_y = 0;
	}
	
	win->state ^= AWS_FULL;
	Awi_oblist(win);
	wind_set(win->wi_id, WF_CURRXYWH, act->x, act->y, act->w, act->h);
	if (ACSblk->AESglobal[0] > 0x300 && ACSblk->AESglobal[0] < 0x400)
		Awi_slider(win);
	if ((win->state & AWS_FORCEREDRAW) != 0 && (ACSblk->description->flags & AB_SMARTREDRAW) != 0)
		Aev_WmRedraw(ACSblk->gl_apid, win->wi_id, act);
	Aev_mess();
	if ((win->state & AWS_FORCEREDRAW) != 0)
	{
		win->state &= ~AWS_DIALOG;
		win->redraw(win, &win->wi_act);
		Awi_diastart();
	}
}

/* -------------------------------------------------------------------------- */

/* Resize Window */
void Awi_sized(Awindow *win, Axywh *area)
{
	Axywh *act;
	int16 w, h;
	
	if (win->wi_id <= 0)
		return;
	win->state &= ~AWS_FULL;
	act = &win->wi_act;
	w = act->w;
	h = act->h;
	act->x = area->x;
	act->y = area->y;
	act->w = max(wi_minw, area->w);
	act->h = max(wi_minh, area->h);
	Awi_oblist(win);
	if (w == act->w && h == act->h && (win->state & AWS_FORCEREDRAW) == 0)
		return;
	wind_set(win->wi_id, WF_CURRXYWH, act->x, act->y, act->w, act->h);
	if (ACSblk->AESglobal[0] > 0x300 && ACSblk->AESglobal[0] < 0x400)
		Awi_slider(win);
	if ((win->state & AWS_FORCEREDRAW) != 0)
	{
		if ((ACSblk->description->flags & AB_SMARTREDRAW) != 0)
		{
			Aev_WmRedraw(ACSblk->gl_apid, win->wi_id, act);
		} else
		{
			win->state &= ~AWS_DIALOG;
			win->redraw(win, &win->wi_act);
			Awi_diastart();
		}
	}
}

/* -------------------------------------------------------------------------- */

/* Move Window */
void Awi_moved(Awindow *win, Axywh *area)
{
	if (win->wi_id <= 0)
		return;
	win->state &= ~AWS_FULL;
	win->wi_act.x = area->x;
	win->wi_act.y = area->y;
	win->wi_act.w = area->w;
	win->wi_act.h = area->h;
	Awi_cleanup(win);
	wind_set(win->wi_id, WF_CURRXYWH, win->wi_act.x, win->wi_act.y, win->wi_act.w, win->wi_act.h);
}

/* -------------------------------------------------------------------------- */

void Awi_cleanup(Awindow *win)
{
	int16 x, y, w, h;
	int16 wx, wy, ww, wh;
	int16 xdiff;
	int16 ydiff;
	int16 yoff;
	int16 val;
	int16 vy;
	int16 id;
	int16 title;
	int16 thebar;
	int16 snapx;
	int16 snapy;
	OBJECT *menu;
	OBJECT *work;
	OBJECT *toolbar;
	
	if (win->state & AWS_ICONIZED)
		return;
	id = win->wi_id;
	work = win->work;
	toolbar = win->toolbar;
	menu = win->menu;
	snapx = win->snap_mask | -256;
	snapy = win->snap_mask >> 8;
	if ((win->wi_kind & SIZER) != 0)
	{
		work->ob_width += ~snapx;
		work->ob_width &= snapx;
		work->ob_height += ~snapy;
		work->ob_height &= snapy;
	}
	yoff = 0;
	if (menu != NULL)
		yoff = menu[menu[ROOT].ob_head].ob_height;
	if (toolbar != NULL)
		yoff += toolbar->ob_height;
	x = win->wi_act.x;
	y = win->wi_act.y;
	w = win->wi_act.w;
	h = win->wi_act.h;
	wind_calc(WC_BORDER, win->wi_kind, 0, 0, work->ob_width, work->ob_height + yoff, &wx, &wy, &ww, &wh);
	w = min(w, ww);
	h = min(h, wh);
	w = min(w, ACSblk->desk.w);
	h = min(h, ACSblk->desk.h);
	w = max(ACSblk->gl_wbox, w);
	h = max(ACSblk->gl_hbox, h);
	vy = virt_desk.y - wy;
	x = min(x, virt_desk.x + virt_desk.w - w);
	y = min(y, virt_desk.y + virt_desk.h - h);
	x = max(virt_desk.x, x);
	y = max(virt_desk.y, y);
	wind_calc(WC_WORK, win->wi_kind, x, y, w, h, &wx, &wy, &ww, &wh);
	wh -= yoff;
	wx &= snapx;
	wy = ((wy - vy - snapy - 1) & snapy) + vy + yoff;
	if ((win->wi_kind & SIZER) != 0)
	{
		ww &= snapx;
		wh &= snapy;
	}
	if (menu != NULL)
	{
		thebar = menu[menu[ROOT].ob_head].ob_head;
		if (menu[thebar].ob_head == 3)
		{
			menu[thebar].ob_head = menu[3].ob_next;
			title = menu[ROOT].ob_tail;
			menu[title].ob_head = menu[menu[title].ob_head].ob_next;
		}
		menu[menu[ROOT].ob_head].ob_spec.index |= 0xff0000L;
		menu->ob_x = wx - 3 * ACSblk->gl_wbox;
		menu->ob_y = wy - yoff - 1;
	}
	win->wi_work.x = wx;
	win->wi_work.y = wy;
	win->wi_work.w = ww;
	win->wi_work.h = wh;
	if (toolbar != NULL)
	{
		if ((ACSblk->description->flags & AB_SMARTREDRAW) != 0 && toolbar->ob_width < ww)
		{
			Axywh area;
			
			area.x = max(win->wi_work.w - 2 * ACSblk->gl_wbox, 0) + win->wi_work.x;
			area.y = win->wi_work.y;
			area.w = ACSblk->gl_wbox * 2;
			area.h = toolbar->ob_height;
			Aev_WmRedraw(ACSblk->gl_apid, win->wi_id, &area);
			win->state |= AWS_FORCEREDRAW;
		}
		toolbar->ob_x = 0;
		toolbar->ob_y = -toolbar->ob_height;
		toolbar->ob_width = ww;
	}
	
	xdiff = (work->ob_width - ww) & snapx;
	if (work->ob_x < -xdiff)
		work->ob_x = -xdiff;
	ydiff = (work->ob_height - wh) & snapy;
	if (work->ob_y < -ydiff)
		work->ob_y = -ydiff;
	wind_calc(WC_BORDER, win->wi_kind, wx, wy - yoff, ww, wh + yoff,
		&win->wi_act.x, &win->wi_act.y, &win->wi_act.w, &win->wi_act.h);

	if ((win->wi_kind & HSLIDE) != 0 && (win->kind & AW_UHSLIDER) == 0)
	{
		val = 0;
		if (xdiff > 0)
		{
			val = (int16)(-((long)work->ob_x * 1000) / xdiff);
		}
		if (val != win->wi_slider.x)
		{
			win->wi_slider.x = val;
			if (id > 0)
				wind_set(id, WF_HSLIDE, val, 0, 0, 0);
		}
		val = (int16)(((long) ww * 1000) / work->ob_width);
		if (val != win->wi_slider.w)
		{
			win->wi_slider.w = val;
			if (id > 0)
				wind_set(id, WF_HSLSIZE, val, 0, 0, 0);
		}
	}

	if ((win->wi_kind & VSLIDE) != 0 && (win->kind & AW_UVSLIDER) == 0)
	{
		val = 0;
		if (ydiff > 0)
		{
			val = (int16)(-((long)work->ob_y * 1000) / ydiff);
		}
		if (val != win->wi_slider.y)
		{
			win->wi_slider.y = val;
			if (id > 0)
				wind_set(id, WF_VSLIDE, val, 0, 0, 0);
		}
		val = (int16)(((long) wh * 1000) / work->ob_height);
		if (val != win->wi_slider.h)
		{
			win->wi_slider.h = val;
			if (id > 0)
				wind_set(id, WF_VSLSIZE, val, 0, 0, 0);
		}
	}
}

/* -------------------------------------------------------------------------- */

static void Awi_oblist(Awindow *win)
{
	OBJECT *tree;
	int16 child;
	int16 x;
	int16 y;
	int16 w = 0;
	int16 h = 0;
	int16 dummy;
	int16 oldw = -1;
	int16 oldh = -1;
	int16 hslpos;
	int16 vslpos;
	int16 x0;
	int16 y0;
	int16 neww;
	int16 newh;
	boolean redraw = FALSE;
	
	if ((win->state & AWS_ICONIZED) != 0 || (tree = win->work) == NULL)
		return;
	if ((win->kind & AW_OBLIST) != 0)
	{
		wind_calc(WC_WORK, win->wi_kind, win->wi_act.x, win->wi_act.y, win->wi_act.w, win->wi_act.h,
			&dummy, &dummy, &w, &h);
		child = tree[ROOT].ob_head;
		newh = 0;
		if (child > 0)
		{
			x0 = x = tree[child].ob_x;
			y0 = y = tree[child].ob_y;
			while (child > 0)
			{
				if ((tree[child].ob_flags & OF_HIDETREE) == 0)
				{
					neww = x0 + tree[child].ob_width;
					if (neww > w && child != tree[ROOT].ob_head)
					{
						neww += x - x0;
						x0 = x;
						y0 += newh + y;
						newh = y;
					}
					if (newh < tree[child].ob_height)
						newh = tree[child].ob_height;
					if (tree[child].ob_x != x0 || tree[child].ob_y != y0)
					{
						tree[child].ob_x = x0;
						tree[child].ob_y = y0;
						redraw = TRUE;
					}
					if (w < neww)
						w = neww;
					x0 = neww + x;
				}
				child = tree[child].ob_next;
			}
			newh += y0 + y;
		}
		
		if (tree->ob_width != w)
		{
			oldw = tree->ob_width;
			w &= win->snap_mask | -256;
			tree->ob_width = w;
			if ((win->wi_kind & HSLIDE) != 0)
				redraw = TRUE;
		}
		if (win->menu != NULL)
			h -= win->menu[win->menu[ROOT].ob_head].ob_height;
		if (win->toolbar != NULL)
			h -= win->toolbar->ob_height;
		h = max(h, newh) & ((win->snap_mask >> 8) | -256);
		if (tree->ob_height != h)
		{
			oldh = tree->ob_height;
			tree->ob_height = h;
			if ((win->wi_kind & HSLIDE) != 0)
				redraw = TRUE;
		}
	}

	hslpos = win->wi_slider.x;
	vslpos = win->wi_slider.y;
	Awi_cleanup(win);
	if (!redraw)
	{
		if (win->kind & AW_OBLIST)
		{
			if ((win->wi_kind & HSLIDE) != 0 && oldw < w && win->wi_slider.x == 1000)
				redraw = TRUE;
			if (!redraw && (win->wi_kind & VSLIDE) != 0 &&
				oldh < h && win->wi_slider.y == 1000)
				redraw = TRUE;
		} else
		{
			if ((win->wi_kind & HSLIDE) != 0 &&
				(win->wi_slider.x != 0 || hslpos != 0))
				redraw = TRUE;
			if (!redraw && (win->wi_kind & VSLIDE) != 0 &&
				(win->wi_slider.y != 0 || vslpos != 0))
				redraw = TRUE;
		}
	}

	if (redraw)
		win->state |= AWS_FORCEREDRAW;
}

/* -------------------------------------------------------------------------- */

/* Iconify (FALSE: ein Fenster, TRUE: alle) */
boolean Awi_iconify(Awindow *win, boolean all)
{
	int16 i;
	OBJECT *tree;
	CICONBLK *icon;
	Awindow *other;
	
	if (win->wi_id <= 0 || (win->state & (AWS_ICONIZED | AWS_MODAL_WIN)) != 0 || !Awi_iconcreate(win))
		return FALSE;
	if (ACSblk->Aselect.window == win)
	{
		Adr_unselect();
		Aev_mess();
	}
	win->ob_edit = win->ob_col = win->ob_len = -1;
	win->state = (win->state & ~AWS_FULL) | AWS_ICONIZED;
	if (all)
		win->state |= AWS_ALLICONIZED;
	memcpy(&win->wi_normal, &win->wi_act, sizeof(win->wi_normal));
	wind_close(win->wi_id);
	wind_set(win->wi_id, WF_ICONIFY, -1, -1, -1, -1);
	wind_open(win->wi_id, -1, -1, -1, -1);
	wind_set(win->wi_id, WF_BOTTOM);
	tree = _ACSv_wiicons[win->wi_id];
	wind_get(win->wi_id, WF_WORKXYWH, &tree->ob_x, &tree->ob_y, &tree->ob_width, &tree->ob_height);
	icon = tree[1].ob_spec.ciconblk;
	icon->monoblk.ib_xicon = (tree->ob_width - icon->monoblk.ib_wicon) >> 1;
	icon->monoblk.ib_yicon = (tree->ob_height - icon->monoblk.ib_hicon - icon->monoblk.ib_htext) >> 1;
	if (icon->monoblk.ib_htext != 0 && icon->monoblk.ib_wtext != 0)
	{
		icon->monoblk.ib_xtext = (tree->ob_width - icon->monoblk.ib_wtext) >> 1;
		icon->monoblk.ib_ytext = icon->monoblk.ib_yicon + icon->monoblk.ib_hicon;
	} else
	{
		icon->monoblk.ib_xtext = tree->ob_width >> 1;
		icon->monoblk.ib_ytext = tree->ob_height >> 1;
	}
	if (all)
	{
		Adr_unselect();
		for (i = 1; i < MAX_WI_ICONS; i++)
		{
			other = gemmap[i];
			if (other != NULL && i != win->wi_id)
			{
				if ((other->state & AWS_ICONIZED) != 0)
				{
					Awi_icondelete(other);
					memcpy(&other->wi_act, &other->wi_normal, sizeof(other->wi_act));
				}
				icnmap[i] = other;
				gemmap[i] = NULL;
				wind_close(other->wi_id);
				wind_delete(other->wi_id);
				other->wi_id = -1;
				other->state |= AWS_ICONIZED;
				Aev_mess();
			}
		}
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Awi_uniconify(Awindow *win)
{
	Awindow *other;
	int16 i;
	
	if (win != NULL && (win->state & AWS_ICONIZED) != 0 && Awi_icondelete(win))
	{
		memcpy(&win->wi_act, &win->wi_normal, sizeof(win->wi_act));
		wind_set(win->wi_id, WF_UNICONIFY, win->wi_normal.x, win->wi_normal.y, win->wi_normal.w, win->wi_normal.h);
		Awi_diaend();
		wind_set(win->wi_id, WF_TOP, 0, 0, 0, 0);
		win->state &= ~AWS_ICONIZED;
		win->ob_edit = Aob_findflag(win->work, -1, OF_EDITABLE);
		if (win->ob_edit < 0 && win->toolbar != NULL)
			win->ob_edit = Aob_findflag(win->toolbar, -1, OF_EDITABLE) | A_TOOLBAR;
		win->ob_col = -1;
		Awi_diastart();
	}
	
	if (
#if WITH_FIXES
		win != NULL &&
#endif
		(win->state & AWS_ALLICONIZED) != 0)
	{
		for (i = 1; i < MAX_WI_ICONS; i++)
		{
			other = icnmap[i];
			if (other != NULL)
			{
				other->state &= ~AWS_ICONIZED;
				other->open(other);
				icnmap[i] = NULL;
				Aev_mess();
			}
		}
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

boolean Awi_service(Awindow *win, int16 task, void *in_out)
{
	switch (task)
	{
	case AS_TERM:
		Awi_delete(win);
		break;
	default:
		return FALSE;
	}
	return TRUE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

/* Complete Modal-Window-Dialog-Handler */
int16 Awi_dialog(Awindow *win)
{
	int16 top;
	int16 icon;
	int16 wh;
	int16 button;
	int16 tbutton;
	int16 msg[8];
	int16 events;
	CONTEXT ctx;
	
	if (win->state & AWS_ICONIZED)
		return -3;
	if (a_dialog_active != 0)
	{
		if (win->work == NULL)
		{
			return -3;
		} else
		{
			Act_save(&ctx);
			ACSblk->ev_window = win;
			button = A_dialog(win->work);
			Act_restore(&ctx);
			return button;
		}
	}
	
	if (win->wi_id < 0)
	{
		wh = wind_create(0, ACSblk->desk.x, ACSblk->desk.y, ACSblk->desk.w, ACSblk->desk.h);
		if (wh < 0)
			return -2;
		wind_delete(wh);
	}
	if (win->work == NULL || (win->state & AWS_MODAL_WIN) != 0)
		return -3;
	if (Awi_set_modal(win, TRUE) == FAIL)
		return -2;
	Act_save(&ctx);
	ACSblk->ev_window = win;
	win->wi_kind &= ~ICONIFIER;
	wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
	if (win->wi_id >= 0 && win->wi_id != top)
	{
		Awi_topped(win);
	} else
	{
		win->state |= AWS_TERM;
		if (win->open(win) != OK)
		{
			Act_restore(&ctx);
			Awi_set_modal(win, FALSE);
			return -2;
		}
		win->state &= ~AWS_TERM;
	}
	
	icon = win->icon;
	if (icon >= 0 && Aroot_wi != NULL)
	{
		Aroot_wi->service(Aroot_wi, AS_REMICON, &win->icon);
	}
	win->state |= AWS_MODAL_WIN;
	graf_mkstate(&ACSblk->ev_mmox, &ACSblk->ev_mmoy, &ACSblk->ev_mmobutton, &ACSblk->ev_mmokstate);
	for (;;)
	{
		ACSblk->dia_abort = FALSE;
		button = -1;
		Awi_update(RESET_UPDATE);
		events = evnt_multi(MU_KEYBD | MU_BUTTON | MU_M1 | MU_TIMER | MU_MESAG,
			ACSblk->ev_mbclicks, ACSblk->ev_bmask, ACSblk->ev_bstate,
			1, ACSblk->ev_mmox, ACSblk->ev_mmoy, 1, 1,
			0, 0, 0, 0, 0,
			msg,
			(uint16)ACSblk->ev_mtcount, ((uint16)(ACSblk->ev_mtcount >> 16)),
			&ACSblk->ev_mmox, &ACSblk->ev_mmoy, &ACSblk->ev_mmobutton, &ACSblk->ev_mmokstate, &ACSblk->ev_mkreturn, &ACSblk->ev_mbreturn);

		ACSblk->ev_mkreturn = nkc_gemks2n(ACSblk->ev_mkreturn, ACSblk->ev_mmokstate);
		Awi_update(RESTART_UPDATE);
		
		if (events & MU_MESAG)
		{
			Aev_message(msg);
			if (msg[0] == AC_CLOSE)
			{
				button = -1;
				Awi_update(RESTART_UPDATE);
				break;
			}
		}
		
		if (events & MU_BUTTON)
			button = evbutton(ACSblk->ev_mmobutton, ACSblk->ev_mbreturn);
		
		if (events & MU_KEYBD)
			button = evkeybrd(NULL);
		
		graf_mkstate(&ACSblk->ev_mmox, &ACSblk->ev_mmoy, &ACSblk->ev_mmobutton, &ACSblk->ev_mmokstate);
		if (ACSblk->ev_mmobutton == 0)
		{
			if (events & MU_M1)
				Aev_unhidepointer();
			evmouse();
		}
		
		Ax_release();
		Awi_lateupdate();
		ACSblk->ev_window = Aroot_wi;
		
		ACSblk->ACStimer();
		
		if (ACSblk->dia_abort)
		{
			if (button == -1 && win->work != NULL)
				button = Aob_findflag(win->work, -1, OF_DEFAULT);
			break;
		}
		
		if (button >= 0)
		{
			if (button & A_TOOLBAR)
			{
				tbutton = button & A_MASK;
				if ((win->toolbar[tbutton].ob_flags & (OF_EXIT | OF_SELECTABLE)) == (OF_EXIT | OF_SELECTABLE))
				{
#if WITH_FIXES
					if ((win->toolbar[tbutton].ob_flags & OF_LASTOB) || !(win->toolbar[tbutton + 1].ob_flags & AEO) || ((AOBJECT *)&win->toolbar[tbutton + 1])->click == NULL)
						break;
#else
					if (!(win->work[tbutton + 1].ob_flags & AEO) || ((AOBJECT *)&win->work[tbutton + 1])->click == NULL)
						break;
#endif
				}
			} else
			{
				if ((win->work[button].ob_flags & (OF_EXIT | OF_SELECTABLE)) == (OF_EXIT | OF_SELECTABLE))
				{
#if WITH_FIXES
					if ((win->work[button].ob_flags & OF_LASTOB) || !(win->work[button + 1].ob_flags & AEO) || ((AOBJECT *)&win->work[button + 1])->click == NULL)
						break;
#else
					if (!(win->work[button + 1].ob_flags & AEO) || ((AOBJECT *)&win->work[button + 1])->click == NULL)
						break;
#endif
				}
			}
		}
		
		if (win->wi_id < 0)
			break;
	}
	
	ACSblk->dia_abort = FALSE;
	if (win->wi_id >= 0)
		win->closed(win);
	
	Awi_set_modal(win, FALSE);
	win->state &= ~AWS_MODAL_WIN;
	Act_restore(&ctx);
	Aev_mess();
	Aev_mess();
	
	return button;
}

/* -------------------------------------------------------------------------- */

int16 Awi_doform(Awindow *parent, void *para)
{
	Awindow *win;
	OBJECT *tree;
	int16 button;
	
	win = NULL;
	tree = NULL;
	button = -2;
	win = parent->create(para);
	if (win != NULL)
	{
		if (ACSblk->desk.w > win->wi_work.w)
			win->wi_kind &= ~(LFARROW | RTARROW | HSLIDE);
		if (ACSblk->desk.h > win->wi_work.h)
			win->wi_kind &= ~(UPARROW | DNARROW | VSLIDE);
		if (ACSblk->desk.h > win->wi_work.h && ACSblk->desk.w > win->wi_work.w)
			win->wi_kind &= ~(FULLER | SIZER);
		win->wi_kind &= ~(ICONIFIER | BACKDROP);
		button = Awi_dialog(win);
		Awi_delete(win);
	}
	
	if (button < -1)
	{
		tree = Aob_create(parent->work);
		if (tree != NULL)
		{
			button = A_dialog(tree);
			Aob_delete(tree);
		} else
		{
			Awi_alert(1, AL_NO_DIALOG);
		}
	}
	return button;
}

/* -------------------------------------------------------------------------- */

/* Click-Routine: Einen Dialog abbrechen */
void Awi_diaabort(void)
{
	ACSblk->dia_abort = TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Awi_shadow(Awindow *win)
{
	Axywh rect;
	
	if (win->wi_id < 0)
		return TRUE;
#if WITH_FIXES
	wind_get(win->wi_id, WF_FIRSTXYWH, &rect.x, &rect.y, &rect.w, &rect.h);
	if ((win->state & AWS_SHADED) != 0 || rect.w <= 0 || rect.h <= 0)
		return TRUE;
	return FALSE;
#else
	wind_get(win->wi_id, WF_FIRSTXYWH, &rect.x, &rect.y, &rect.w, &rect.w);
	return (win->state & AWS_SHADED) != 0 || (rect.w == 0 && rect.h == 0);
#endif
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

#include "main.h"

int16 _init_alert(Awindow *win)
{
	int16 i;
	Axywh rect;
	
	if (win->user == NULL)
		return OK;
	win->state |= AWS_LATEUPDATE;
	timer1 = Ash_gettimer();
	if (timer1 - timer2 > 600)
	{
		timer2 = timer1;
		for (i = ALERT_TIME0; i <= ALERT_TIME8; i++)
		{
			if ((win->work[i].ob_flags & OF_HIDETREE) == 0)
				break;
		}
		win->work[i].ob_flags |= OF_HIDETREE;
		--i;
		win->work[i].ob_flags &= ~OF_HIDETREE;
		Aob_offset(&rect, win->work, ALERT_STOP);
		rect.x += win->wi_work.x;
		rect.y += win->wi_work.y;
		win->redraw(win, &rect);
		if (i == ALERT_TIME0)
		{
			ACSblk->dia_abort = TRUE;
			timer1 = timer2 = 0;
		}
	}
	return OK;
}

/* -------------------------------------------------------------------------- */

/* Shows Window-Alert */
int16 Awi_alert(int16 button, const char *text)
{
	Awindow *win;
	char buf[31];
	char *ptr;
	char *ptr2;
	char *ptr3;
	char *end;
	int16 numbuttons;
	int16 retcode;
	int16 i;
	int32 mtcount;
	
	if (strlen(text) < 9)
		return -1;
	
	win = _W_ALERT.create(&_W_ALERT);
	if (win != NULL)
	{
		if (ACSblk->alert_name != NULL)
		{
			ptr = win->name;
			win->name = Ast_create(ACSblk->alert_name);
			if (win->name != NULL)
				Ast_delete(ptr);
			else
				win->name = ptr;
		} else
		{
			ptr = win->name;
			switch (text[1])
			{
			case '1':
				win->name = Ast_create(ACSblk->description->mess[AD_A_ATT]);
				break;
			case '2':
				win->name = Ast_create(ACSblk->description->mess[AD_A_QUEST]);
				break;
			case '3':
				win->name = Ast_create(ACSblk->description->mess[AD_A_STOP]);
				break;
			default:
				win->name = Ast_create(ACSblk->description->mess[AD_A_TIMER]);
				break;
			}
			if (win->name != NULL)
				Ast_delete(ptr);
			else
				win->name = ptr;
		}
		
		if ((ACSblk->description->flags & AB_CENTERDIALOG) != 0)
		{
			win->work[ALERT_TEXT1].ob_spec.tedinfo->te_just =
			win->work[ALERT_TEXT2].ob_spec.tedinfo->te_just =
			win->work[ALERT_TEXT3].ob_spec.tedinfo->te_just =
			win->work[ALERT_TEXT4].ob_spec.tedinfo->te_just =
			win->work[ALERT_TEXT5].ob_spec.tedinfo->te_just = TE_CNTR;
		}
		
		for (i = ALERT_STOP; i <= ALERT_TIME8; i++)
		{
			win->work[i].ob_flags |= OF_HIDETREE;
		}
		
		switch (text[1])
		{
		case '0':
			win->work[ALERT_ICON].ob_x -= ACSblk->gl_wbox * 2;
			break;
		case '1':
			win->work[ALERT_EXCLAM].ob_flags &= ~OF_HIDETREE;
			break;
		case '2':
			win->work[ALERT_QUEST].ob_flags &= ~OF_HIDETREE;
			break;
		case '3':
			win->work[ALERT_STOP].ob_flags &= ~OF_HIDETREE;
			break;
		case '4':
			win->work[ALERT_TIME8].ob_flags &= ~OF_HIDETREE;
			win->user = (void *)1;
			timer1 = timer2 = Ash_gettimer();
			win->state |= AWS_LATEUPDATE;
			break;
		}
		
		mtcount = ACSblk->ev_mtcount;
		ACSblk->ev_mtcount = 333;
		ptr = NO_CONST(text + 1);
		while ((ptr = strchr(ptr, '[')) != NULL && ptr[1] == ']')
			ptr++;
		if (ptr != NULL)
		{
			ptr2 = ptr + 1;
			while ((ptr2 = strchr(ptr2, '[')) != NULL && ptr2[1] == ']')
				ptr2++;
		} else
		{
			ptr2 = NULL;
		}
		if (ptr != NULL && ptr2 != NULL)
		{
			for (i = ALERT_TEXT1; i <= ALERT_TEXT5; i++)
				Aob_puttext(win->work, i, "");
			
			ptr2[-1] = '\0';
			numbuttons = 4;
			i = ALERT_TEXT1;
			ptr3 = ptr + 1;
			do
			{
				if ((end = strchr(ptr3, '|')) == NULL)
				{
					strncpy(buf, ptr3, sizeof(buf) - 1);
					buf[sizeof(buf) - 1] = '\0';
					Aob_puttext(win->work, i, buf);
				} else
				{
					numbuttons--;
					*end = '\0';
					strncpy(buf, ptr3, sizeof(buf) - 1);
					buf[sizeof(buf) - 1] = '\0';
					Aob_puttext(win->work, i, buf);
					*end = '|';
					ptr3 = end + 1;
				}
				++i;
			} while (end != NULL);
			ptr2[-1] = ']';
			numbuttons = numbuttons > 3 ? 3 : numbuttons;
			if (numbuttons > 0)
			{
				win->work[ROOT].ob_height -= numbuttons * ACSblk->gl_hbox;
				win->work[ALERT_BOX].ob_height -= numbuttons * ACSblk->gl_hbox;
				win->work[ALERT_ICON].ob_height -= numbuttons * ACSblk->gl_hbox;
				win->work[ALERT_TEXT_BOX].ob_height -= numbuttons * ACSblk->gl_hbox;
				win->work[ALERT_BUTTON1].ob_y -= numbuttons * ACSblk->gl_hbox;
				win->work[ALERT_BUTTON2].ob_y -= numbuttons * ACSblk->gl_hbox;
				win->work[ALERT_BUTTON3].ob_y -= numbuttons * ACSblk->gl_hbox;
			}
			
			ptr3 = ptr2;
			numbuttons = 0;
			while (*ptr3 != '\0' && (end = strchr(ptr3, '|')) != NULL)
			{
				numbuttons++;
				ptr3 = end + 1;
			}
			switch (numbuttons)
			{
			case 0:
				win->work[ALERT_BUTTON1].ob_flags |= OF_HIDETREE;
				win->work[ALERT_BUTTON3].ob_flags |= OF_HIDETREE;
				strcpy(buf, ptr2 + 1);
				ptr3 = strchr(buf, ']');
				if (ptr3 != NULL)
					*ptr3 = '\0';
				Aob_puttext(win->work, ALERT_BUTTON2, buf);
				Awi_hotkey(buf, &win->work[ALERT_BUTTON2]);
				if (button > 0)
					win->work[ALERT_BUTTON2].ob_flags |= OF_DEFAULT;
				break;
			
			case 1:
			case 2:
				ptr3 = strchr(ptr2 + 1, '|');
				strncpy(buf, ptr2 + 1, ptr3 - ptr2 - 1);
				buf[ptr3 - ptr2 - 1] = '\0';
				Aob_puttext(win->work, ALERT_BUTTON1, buf);
				Awi_hotkey(buf, &win->work[ALERT_BUTTON1]);
				ptr3++;
				end = strchr(ptr3, '|');
				if (end != NULL)
				{
					strncpy(buf, ptr3, end - ptr3);
					buf[end - ptr3] = '\0';
				} else
				{
					strcpy(buf, ptr3);
					ptr3 = strchr(buf, ']');
					if (ptr3 != NULL)
						*ptr3 = '\0';
				}
				Aob_puttext(win->work, ALERT_BUTTON2, buf);
				Awi_hotkey(buf, &win->work[ALERT_BUTTON2]);
				if (numbuttons == 2)
				{
					end++;
					ptr3 = strchr(end, ']');
					strncpy(buf, end, ptr3 - end);
					buf[ptr3 - end] = '\0';
					Aob_puttext(win->work, ALERT_BUTTON3, buf);
					Awi_hotkey(buf, &win->work[ALERT_BUTTON3]);
				} else
				{
					win->work[ALERT_BUTTON1].ob_x += (win->work[ALERT_BUTTON1].ob_width >> 1) + ACSblk->gl_wbox;
					win->work[ALERT_BUTTON2].ob_x += (win->work[ALERT_BUTTON2].ob_width >> 1) + ACSblk->gl_wbox;
					win->work[ALERT_BUTTON3].ob_flags |= OF_HIDETREE;
				}
				switch (button)
				{
				case 1:
					win->work[ALERT_BUTTON1].ob_flags |= OF_DEFAULT;
					break;
				case 2:
					win->work[ALERT_BUTTON2].ob_flags |= OF_DEFAULT;
					break;
				case 3:
					win->work[ALERT_BUTTON3].ob_flags |= OF_DEFAULT;
					break;
				}
				/* break; */
			}
			
			retcode = Awi_dialog(win);
			Awi_delete(win);
			ACSblk->ev_mtcount = mtcount;
			switch (retcode)
			{
			case ALERT_BUTTON1:
				return 1;
			case ALERT_BUTTON2:
				return 2;
			case ALERT_BUTTON3:
				return 3;
			default:
				if (retcode >= 0)
					return -1;
				break;
			}
		}
	}
	if (text[1] > '3')
		((char *)NO_CONST(text))[1] = '1'; /* WTF: must not write to string */
	return form_alert(button, text);
}

/* -------------------------------------------------------------------------- */

static void Awi_hotkey(char *buf, OBJECT *obj)
{
	char *ptr;
	AOBJECT *aobj;
	
	aobj = (AOBJECT *)obj + 1;
	for (ptr = buf; *ptr != '\0'; )
	{
		if (isalnum(*ptr))
			break;
		else
			ptr++;
	}
	if (*ptr != '\0')
		aobj->key = toupper(*ptr) | NKF_FUNC | NKF_ALT;
	else
		aobj->key = 0;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/* Internal wind_update */
void Awi_update(int16 mode)
{
	switch (mode & 0xff)
	{
	case BEG_UPDATE:
		if (winupd++ != 0)
			return;
		wind_update(BEG_UPDATE);
		winoldupd = 0;
		break;
	
	case END_UPDATE:
		if (--winupd != 0)
			return;
		wind_update(END_UPDATE);
		winoldupd = 0;
		break;
	
	case BEG_MCTRL:
		if (msupd++ != 0)
			return;
		wind_update(BEG_MCTRL);
		msoldupd = 0;
		break;
	
	case END_MCTRL:
		if (--msupd != 0)
			return;
		wind_update(END_MCTRL);
		msoldupd = 0;
		break;
	
	case RESET_UPDATE:
		if (winupd != 0)
		{
			wind_update(END_UPDATE);
			winoldupd = winupd;
			winupd = 0;
		}
		if (msupd != 0)
		{
			wind_update(END_MCTRL);
			msoldupd = msupd;
			msupd = 0;
		}
		break;
	
	case RESTART_UPDATE:
		if (winupd == 0 && winoldupd != 0)
		{
			wind_update(BEG_UPDATE);
			winupd = winoldupd;
			winoldupd = 0;
		}
		if (msupd == 0 && msoldupd != 0)
		{
			wind_update(BEG_MCTRL);
			msupd = msoldupd;
			msoldupd = 0;
		}
		break;
	}
}

/* -------------------------------------------------------------------------- */

/* Find obnr for which Flagmask becomes TRUE, obnr is start object */
OBJECT *Awi_obfind(Awindow *win, int16 x, int16 y, OBJECT **ptree, int16 *obnr)
{
	int16 yoff;
	int16 th;
	int16 wx, wy;
	int16 nr;
	OBJECT *tree;
	
	if (ptree != NULL)
		*ptree = NULL;
	if (obnr != NULL)
		*obnr = NIL;
	if (win->wi_id < 0)
		return NULL;
	yoff = win->wi_work.y;
	wx = win->wi_work.x;
	wy = win->wi_work.y;
	th = win->toolbar != NULL ? win->toolbar->ob_height : 0;
	if (y < yoff - th)
		return NULL;
	if (win->toolbar != NULL && y < yoff && y >= yoff - th)
	{
		tree = win->toolbar;
	} else
	{
		tree = win->work;
		wy += win->toolbar != NULL ? win->wi_work.y : 0;
	}
	if (tree == NULL)
		return NULL;
	nr = objc_find(tree, ROOT, 100, x - wx, y - wy);
	if (ptree != NULL)
		*ptree = tree;
	if (obnr != NULL)
		*obnr = nr;
	return nr >= 0 ? &tree[nr] : NULL;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static char *Awi_contstring(Awindow *win, int16 mx, int16 my, ssize_t offset, OBJECT **pobj, int16 task1, int16 task2, int16 task3, int16 *pobnr)
{
	boolean ok = 1;
	boolean gottext = FALSE;
	OBJECT *obj;
	OBJECT *tree;
	AUSERBLK *auser;
	AGetObjText text = { -1, NULL };
	
	if (win->service(win, task1, &ok) && !ok)
		return NULL;
	Awi_obfind(win, mx, my, &tree, &text.obnr);
	if (text.obnr >= 0)
	{
		obj = &tree[text.obnr];
		if (obj->ob_type == G_USERDEF)
			auser = obj->ob_spec.auserblk;
		else
			auser = NULL;
		if (pobj != NULL)
			*pobj = obj;
		if (pobnr != NULL)
			*pobnr = text.obnr;
		if (auser != NULL)
		{
			text.text = ((char **)auser)[offset];
			if (auser->ub_serv != NULL)
				gottext = auser->ub_serv(obj, task2, &text.text);
		}
		if (!gottext)
		{
			if (tree == win->toolbar)
				text.obnr |= A_TOOLBAR;
			if (!win->service(win, task3, &text))
				text.text = NULL;
		}
	}
	return text.text;
}

/* -------------------------------------------------------------------------- */

/* BubbleGEM */
boolean Awi_bubblegem(Awindow *win, int16 mx, int16 my)
{
	char *text;
	
	text = Awi_contstring(win, mx, my, offsetof(AUSERBLK, bubble) / sizeof(char *), NULL, AS_ALLOWBUBBLE, AUO_GETBUBBLE, AS_GETBUBBLE, NULL);
	if (Ast_isEmpty(text))
		return FALSE;
	return Aev_ShowBubbleGEM(text, mx, my);
}

/* -------------------------------------------------------------------------- */

/* Das Kontext-Popup fr Objekt unter (mx, my) aufrufen */
boolean Awi_context(Awindow *win, int16 mx, int16 my)
{
	char *text;
	OBJECT *obj;
	AUSERBLK *auser;
	char *str;
	int16 obnr;
	boolean ok = FALSE;
	
	text = Awi_contstring(win, mx, my, offsetof(AUSERBLK, context) / sizeof(char *), &obj, AS_ALLOWCONTEXT, AUO_GETCONTEXT, AS_GETCONTEXT, &obnr);
	if (!Ast_isEmpty(text))
	{
		str = Ame_strpopup(win, text, NULL, ACSblk->gl_wbox * 30, mx, my);
		if (obj->ob_type == G_USERDEF)
			auser = obj->ob_spec.auserblk;
		else
			auser = NULL;
		/* XXX registers different */
		if (auser != NULL && auser->ub_serv != NULL && auser->ub_serv(obj, AUO_CONTEXT, *&str))
		{
			ok = TRUE;
		} else
		{
			ok = win->service(win, AS_CONTEXT, &obnr);
		}
	}
	return ok;
}

/* -------------------------------------------------------------------------- */

/* Find a window by title */
Awindow *Awi_name(const char *title, boolean sensitiv)
{
	int16 i;
	Awindow *win;
	
	if (Ast_isEmpty(title))
		return Awi_ontop();
	for (i = 0; i < MAX_WINDS; i++)
	{
		win = _ACSv_winds[i];
		if (win != NULL)
		{
			if ((sensitiv ? Ast_cmp(win->name, title) : Ast_icmp(win->name, title)) == 0)
				return win;
		}
	}
	return Aroot_wi;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

typedef struct {
	const char *cmd;
	int16 (*gs_fkt)(Awindow *win, int16 count, char **cmds, A_GSAntwort *answer);
} gs_cmd;

/* -------------------------------------------------------------------------- */

static int _gs_cmp(const void *cmd1, const void *cmd2)
{
	return Ast_icmp(((const gs_cmd *)cmd1)->cmd, ((const gs_cmd *)cmd2)->cmd);
}

/* -------------------------------------------------------------------------- */

static int _gs_search(const void *key, const void *cmd)
{
	return Ast_icmp(key, ((const gs_cmd *)cmd)->cmd);
}

/* -------------------------------------------------------------------------- */

static int16 gs_str2key(const char *str)
{
	int16 key = 0;
	int16 i;
	boolean done;
	ssize_t len;
	const char *ptr;
	char prefix[] = "+-";
	char modifiers[][6] = { "SHIFT", "CTRL", "ALT" };
	int16 masks[] = { NKF_LSH, NKF_CTRL, NKF_ALT };
	int16 num_modifiers = (int)(sizeof(modifiers) / sizeof(modifiers[0]));
	
	ptr = str;
	done = FALSE;
	while (!done && *ptr != '\0')
	{
		for (i = 0; i < num_modifiers; i++)
		{
			len = strlen(modifiers[i]);
			if (strnicmp(ptr, modifiers[i], len) == 0 &&
				strchr(prefix, ptr[len]) != NULL)
			{
				key = masks[i];
				ptr += len + 1;
				break;
			}
		}
		if (i >= num_modifiers)
		{
			key |= *ptr;
			done = TRUE;
		}
	}
	if ((key & (NKF_ALT | NKF_CTRL | NKF_SHIFT)) != 0)
		key |= NKF_FUNC;
	return key;
}

/* -------------------------------------------------------------------------- */

static int16 gs_GetFront(Awindow *win, int16 count, char **cmds, A_GSAntwort *answer);
static int16 gs_ToFront(Awindow *win, int16 count, char **cmds, A_GSAntwort *answer);
static int16 gs_CheckCommand(Awindow *win, int16 count, char **cmds, A_GSAntwort *answer);
static int16 gs_KeyPress(Awindow *win, int16 count, char **cmds, A_GSAntwort *answer);
static int16 gs_GetAllCommands(Awindow *win, int16 count, char **cmds, A_GSAntwort *answer);

static gs_cmd _gs_commands[] = {
	{ "GetFront", gs_GetFront },
	{ "ToFront", gs_ToFront },
	{ "CheckCommand", gs_CheckCommand },
	{ "KeyPress", gs_KeyPress },
	{ "GetAllCommands", gs_GetAllCommands }
};
static int _gs_cmd_anzahl = (int)(sizeof(_gs_commands) / sizeof(_gs_commands[0]));
static boolean _gs_sorted = FALSE;

/* Default GEMScript function for window */
int16 Awi_gemscript(Awindow *win, int16 count, char **cmds, A_GSAntwort *answer)
{
	gs_cmd *cmd;

	answer->ret_wert = GSACK_UNKNOWN;
	
	if (!_gs_sorted)
	{
		qsort(_gs_commands, _gs_cmd_anzahl, sizeof(_gs_commands[0]), _gs_cmp);
		_gs_sorted = TRUE;
	}
	
	cmd = bsearch(cmds[0], _gs_commands, _gs_cmd_anzahl, sizeof(_gs_commands[0]), _gs_search);
	if (cmd != NULL)
	{
		if (cmd->gs_fkt != NULL)
		{
			answer->ret_wert = cmd->gs_fkt(win, count, cmds, answer);
		} else
		{
			answer->ret_wert = GSACK_OK;
		}
	}

	return answer->ret_wert;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static int16 gs_CheckCommand(Awindow *win, int16 count, char **cmds, A_GSAntwort *answer)
{
	gs_cmd *cmd;

	if (count < 2)
		return GSACK_ERROR;
	cmd = bsearch(cmds[1], _gs_commands, _gs_cmd_anzahl, sizeof(_gs_commands[0]), _gs_search);
	Ast_delete(answer->antwort[0]);
	answer->antwort[0] = Ast_create(cmd == NULL ? "0" : "1");
	answer->anzahl = 1;
	answer->ret_wert = GSACK_OK;
	return answer->ret_wert;
}

/* -------------------------------------------------------------------------- */

static int16 gs_GetFront(Awindow *win, int16 count, char **cmds, A_GSAntwort *answer)
{
	Ast_delete(answer->antwort[0]);
	answer->antwort[0] = Ast_create(win->name);
	answer->anzahl = 1;
	return GSACK_OK;
}

/* -------------------------------------------------------------------------- */

static int16 gs_ToFront(Awindow *win, int16 count, char **cmds, A_GSAntwort *answer)
{
	Awi_show(win);
	Ast_delete(answer->antwort[0]);
	answer->antwort[0] = Ast_create("1");
	answer->anzahl = 1;
	return GSACK_OK;
}

/* -------------------------------------------------------------------------- */

static int16 gs_KeyPress(Awindow *win, int16 count, char **cmds, A_GSAntwort *answer)
{
	int16 i;
	char **ans;
	
	if (count < 2)
		return GSACK_ERROR;
	ans = Ax_malloc((count - 1) * sizeof(*ans));
	if (ans == NULL)
		return GSACK_ERROR;
	memset(ans, 0, (count - 1) * sizeof(*ans));
	for (i = 0; i < count - 1; i++)
	{
		ans[i] = Ast_create("0");
		if (ans[i] == NULL)
		{
			Ast_deleteAry(ans, count - 1);
			return GSACK_ERROR;
		}
	}
	Ast_deleteAry(answer->antwort, answer->anzahl);
	answer->anzahl = count - 1;
	answer->antwort = ans;
	for (i = 1; i < count; i++)
	{
		ACSblk->ev_mkreturn = gs_str2key(cmds[i]);
		answer->antwort[0][0] = evkeybrd(win) == -1 ? '0' : '1';
	}
	return GSACK_OK;
}

/* -------------------------------------------------------------------------- */

static int16 gs_GetAllCommands(Awindow *win, int16 count, char **cmds, A_GSAntwort *answer)
{
	int16 i;
	int16 k;
	int16 j;
	char **ans;
	char **arr;
	int16 cmdcount;
	boolean all;
	
	if (answer->anzahl == 1 && strlen(answer->antwort[0]) == 1 && strchr("01", answer->antwort[0][0]) != NULL)
	{
		cmdcount = _gs_cmd_anzahl;
		all = TRUE;
	} else
	{
		cmdcount = _gs_cmd_anzahl + answer->anzahl;
		all = FALSE;
	}
	ans = Ax_malloc(cmdcount * sizeof(*ans));
	if (ans == NULL)
		return GSACK_ERROR;
	for (i = 0; i < _gs_cmd_anzahl; i++)
	{
		ans[i] = Ast_create(_gs_commands[i].cmd);
		if (ans[i] == NULL)
		{
			Ast_deleteAry(ans, _gs_cmd_anzahl);
			return GSACK_ERROR;
		}
	}
	if (!all)
	{
		memcpy(&ans[_gs_cmd_anzahl], answer->antwort, answer->anzahl * sizeof(*ans));
	}
	qsort(ans, cmdcount, sizeof(*ans), _gs_strcmp);
	j = 0;
	for (i = 1; i < cmdcount; i++)
	{
		if (Ast_icmp(ans[i - 1], ans[i]) == 0)
			j++;
	}
	arr = Ax_malloc((cmdcount - j) * sizeof(*arr));
	if (arr != NULL)
	{
		arr[0] = ans[0];
		for (i = 1, k = 1; i < cmdcount && k < (cmdcount - j); i++)
		{
			if (Ast_icmp(ans[i], arr[k - 1]) != 0)
			{
				arr[k] = ans[i];
				k++;
				ans[i] = NULL;
			}
		}
		Ast_deleteAry(ans, cmdcount);
		cmdcount -= j;
	} else
	{
		arr = ans;
	}
	if (all)
		Ast_deleteAry(answer->antwort, answer->anzahl);
	else
		Ax_free(answer->antwort);
	answer->antwort = arr;
	answer->anzahl = cmdcount;
	return GSACK_OK;
}

#ifdef __PUREC__
#pragma warn .par
#endif
