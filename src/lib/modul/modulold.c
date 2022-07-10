/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Module interfaces for modules using an older library  */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "acsplus.h"

static AUSERBLK *Aus_create23x(const AUSERBLK *user);
static OBJECT *Aob_create23x(const OBJECT *parent);
static Awindow *Awi_create23x(const Awindow *x);
static void Awi_arrowed23x(Awindow *window, int16 which);
static char *Af_first230(const char *start);
static char *Af_next230(void);


/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void noop(void)
{
}

void *ACS233[] = {
	Awi_wid,
	Awi_root,
	Awi_list,
	Awi_sendall,
	Awi_down,
	Awi_up,
	Awi_show,
	Awi_init,
	Awi_create23x,
	Awi_open,
	Awi_closed,
	Awi_delete,
	Awi_topped,
	Awi_fulled,
	Awi_sized,
	Awi_moved,
	Awi_diaend,
	Awi_diastart,
	Awi_keys,
	Awi_obview,
	Awi_service,
	Awi_scroll,
	Awi_obchange,
	Awi_obredraw,
	Awi_redraw,
	Awi_arrowed23x,
	Awi_hslid,
	Awi_vslid,
	Af_cfgfile,
	Aev_quit,
	Aev_mess,
	Aev_unhidepointer,
	Amo_new,
	Amo_busy,
	Amo_unbusy,
	Amo_hide,
	Amo_show,
	Aob_create23x,
	Aob_delete,
	Aob_fix,
	Aob_offset,
	Aob_save,
	Aob_restore,
	Aob_watch,
	Aob_findflag,
	Aob_up,
	Ame_namefix,
	Ame_popup,
	Abp_create,
	Abp_delete,
	Abp_start,
	Abp_end,
	Adr_box,
	Adr_drag,
	Adr_next,
	Adr_add,
	Adr_del,
	Adr_unselect,
	Ast_create,
	Ast_delete,
	Aic_create,
	Aic_delete,
	Aim_create,
	Aim_delete,
	Aus_create23x,
	Aus_delete,
	Ate_create,
	Ate_delete,
	Ax_malloc,
	Ax_free,
	Ax_ifree,
	Ax_mterm,
	Awi_nokey,
	Aob_alias,
	A_dialog,
	alert_str,
	intersect,
	A_checkbox,
	A_radiobutton,
	A_innerframe,
	A_pattern,
	A_arrows,
	Adr_start,
	A_select,
	Ash_prog,
	Af_select,
	A_ftext,
	A_title,
	A_3Dbutton,
	A_cycle,
	A_picture,
	Auo_ftext,
	Auo_string,
	Auo_cycle,
	Aus_cycle,
	Auo_picture,
	A_dialog2,
	Aob_icon,
	Awi_modal,
	Awi_dialog,
	Awi_alert,
	Awi_selfcreate,
	Aev_release,
	Aob_puttext,
	Aob_gettext,
	Aob_within,
	xywh2array,
	array2xywh,
	dotted_xline,
	dotted_yline,
	Ash_error,
	Ash_getcookie,
	nkc_tos2n,
	nkc_gem2n,
	nkc_n2tos,
	nkc_n2gem,
	nkc_kstate,
	nkc_cmp,
	Abp_mfdb2img,
	Abp_img2mfdb,
	Aob_printf,
	Aob_scanf,
	Af_2drv,
	Af_2path,
	Af_2name,
	Af_2fullname,
	Af_2ext,
	Af_buildname,
	Af_length,
	Ascrp_clear,
	Ascrp_get,
	Ascrp_put,
	Ash_getenv,
	Ash_nextdd,
	Ash_sendall,
	Af_first_fsel,
	Af_next_fsel,
	nkc_tolower,
	nkc_toupper,
	Awi_update,
	A_boxed,
	Auo_boxed,
	Aus_boxed,
	Awi_uoself,
	Af_first,
	Af_next,
	Af_readdir,
	Af_freedir,
	Alu_create,
	Alu_delete,
	Acfg_create,
	Acfg_delete,
	Acfg_clear,
	Acfg_clearGroup,
	Acfg_load,
	Acfg_save,
	Acfg_isChanged,
	Acfg_getValue,
	Acfg_setValue,
	Acfg_clearValue,
	Acfg_clearHeader,
	Acfg_headAnzahl,
	Acfg_setHeader,
	Acfg_getHeader,
	Acfg_grpAnzahl,
	Acfg_grpName,
	Acfg_strAnzahl,
	Acfg_strName,
	Acfg_isCfgfile,
	Acfg_createInfo,
	Acfg_deleteInfo,
	Acfg_setInfo,
	Acfg_getInfo,
	Acfg_copyInfo,
	Ach_tolower,
	Ach_toupper,
	Ach_isWhite,
	Ast_tolower,
	Ast_toupper,
	Ast_ltrim,
	Ast_rtrim,
	Ast_alltrim,
	Ast_cmp,
	Ast_icmp,
	Ast_isEmpty,
	Ast_add,
	Ast_adl,
	Ast_adr,
	Ast_adc,
	Ast_filter,
	Ast_count,
	Ast_fcmp,
	Awi_doform,
	noop,
	noop,
	noop,
	noop,
	noop,
	noop,
	noop,
	noop,
	noop,
	noop
};

/* -------------------------------------------------------------------------- */

void *ACS230[] = {
	Awi_wid,
	Awi_root,
	Awi_list,
	Awi_sendall,
	Awi_down,
	Awi_up,
	Awi_show,
	Awi_init,
	Awi_create23x,
	Awi_open,
	Awi_closed,
	Awi_delete,
	Awi_topped,
	Awi_fulled,
	Awi_sized,
	Awi_moved,
	Awi_diaend,
	Awi_diastart,
	Awi_keys,
	Awi_obview,
	Awi_service,
	Awi_scroll,
	Awi_obchange,
	Awi_obredraw,
	Awi_redraw,
	Awi_arrowed23x,
	Awi_hslid,
	Awi_vslid,
	Af_cfgfile,
	Aev_quit,
	Aev_mess,
	Aev_unhidepointer,
	Amo_new,
	Amo_busy,
	Amo_unbusy,
	Amo_hide,
	Amo_show,
	Aob_create23x,
	Aob_delete,
	Aob_fix,
	Aob_offset,
	Aob_save,
	Aob_restore,
	Aob_watch,
	Aob_findflag,
	Aob_up,
	Ame_namefix,
	Ame_popup,
	Abp_create,
	Abp_delete,
	Abp_start,
	Abp_end,
	Adr_box,
	Adr_drag,
	Adr_next,
	Adr_add,
	Adr_del,
	Adr_unselect,
	Ast_create,
	Ast_delete,
	Aic_create,
	Aic_delete,
	Aim_create,
	Aim_delete,
	Aus_create23x,
	Aus_delete,
	Ate_create,
	Ate_delete,
	Ax_malloc,
	Ax_free,
	Ax_ifree,
	Ax_mterm,
	Awi_nokey,
	Aob_alias,
	A_dialog,
	alert_str,
	intersect,
	A_checkbox,
	A_radiobutton,
	A_innerframe,
	A_pattern,
	A_arrows,
	Adr_start,
	A_select,
	Ash_prog,
	Af_select,
	A_ftext,
	A_title,
	A_3Dbutton,
	A_cycle,
	A_picture,
	Auo_ftext,
	Auo_string,
	Auo_cycle,
	Aus_cycle,
	Auo_picture,
	A_dialog2,
	Aob_icon,
	Awi_modal,
	Awi_dialog,
	Awi_alert,
	Awi_selfcreate,
	Aev_release,
	Aob_puttext,
	Aob_gettext,
	Aob_within,
	xywh2array,
	array2xywh,
	dotted_xline,
	dotted_yline,
	Ash_error,
	Ash_getcookie,
	nkc_tos2n,
	nkc_gem2n,
	nkc_n2tos,
	nkc_n2gem,
	nkc_kstate,
	nkc_cmp,
	Abp_mfdb2img,
	Abp_img2mfdb,
	Aob_printf,
	Aob_scanf,
	Af_2drv,
	Af_2path,
	Af_2name,
	Af_2fullname,
	Af_2ext,
	Af_buildname,
	Af_length,
	Ascrp_clear,
	Ascrp_get,
	Ascrp_put,
	Ash_getenv,
	Ash_nextdd,
	Ash_sendall,
	Af_first_fsel,
	Af_next_fsel,
	nkc_tolower,
	nkc_toupper,
	Awi_update,
	A_boxed,
	Auo_boxed,
	Aus_boxed,
	Awi_uoself,
	Af_first230,
	Af_next230,
	Af_readdir,
	Af_freedir,
	Alu_create,
	Alu_delete,
	Acfg_create,
	Acfg_delete,
	Acfg_clear,
	Acfg_clearGroup,
	Acfg_load,
	Acfg_save,
	Acfg_isChanged,
	Acfg_getValue,
	Acfg_setValue,
	Acfg_clearValue,
	Acfg_clearHeader,
	Acfg_headAnzahl,
	Acfg_setHeader,
	Acfg_getHeader,
	Acfg_grpAnzahl,
	Acfg_grpName,
	Acfg_strAnzahl,
	Acfg_strName,
	Acfg_isCfgfile,
	Acfg_createInfo,
	Acfg_deleteInfo,
	Acfg_setInfo,
	Acfg_getInfo,
	Acfg_copyInfo,
	Ach_tolower,
	Ach_toupper,
	Ach_isWhite,
	Ast_tolower,
	Ast_toupper,
	Ast_ltrim,
	Ast_rtrim,
	Ast_alltrim,
	Ast_cmp,
	Ast_icmp,
	Ast_isEmpty,
	Ast_add,
	Ast_adl,
	Ast_adr,
	Ast_adc,
	Ast_filter,
	Ast_count,
	Ast_fcmp,
	Awi_doform,
	noop,
	noop,
	noop,
	noop,
	noop,
	noop,
	noop,
	noop,
	noop,
	noop
};

/* -------------------------------------------------------------------------- */

static AUSERBLK *Aus_create23x(const AUSERBLK *user)
{
	AUSERBLK *newuser;
	
	newuser = (AUSERBLK *)Ax_malloc(sizeof(*user));
	if (newuser == NULL)
		return NULL;
	/*
	 * create the 2 new members that were added in 3.0.0
	 */
	memcpy(newuser, user, sizeof(*user) - 2 * sizeof(char *));
	newuser->bubble = newuser->context = Ast_create("");
	return newuser;
}

/* -------------------------------------------------------------------------- */

static OBJECT *Aob_create23x(const OBJECT *parent)
{
	size_t size;
	OBJECT *ob;
	OBJECT *newob;
	int16 i;
	void *spec;
	AUSERBLK *user;
	
	size = 0;
	ob = (OBJECT *)NO_CONST(parent);
	do
	{
		size += sizeof(*ob);
	} while (!((ob++)->ob_flags & OF_LASTOB));
	newob = (OBJECT *)Ax_malloc(size);
	if (newob == NULL)
		return NULL;
	memcpy(newob, parent, size);
	i = 0;
	ob = newob;
	spec = ob;
	do
	{
		if (!(ob->ob_flags & AEO) && !(ob->ob_state & AOS_CONST))
		{
			switch ((char)ob->ob_type)
			{
			case G_TEXT:
			case G_BOXTEXT:
			case G_FTEXT:
			case G_FBOXTEXT:
				ob->ob_spec.tedinfo = spec = Ate_create(ob->ob_spec.tedinfo);
				break;
			
			case G_USERDEF:
				user = Aus_create23x(ob->ob_spec.auserblk);
				spec = user;
				ob->ob_spec.auserblk = spec;
				if (user->ub_serv != NULL)
					user->ub_serv(ob, AUO_CREATE, &i);
				if (i == FAIL)
					return NULL; /* BUG: leaks all memory allocated so far */
				break;
			
			case G_IMAGE:
				ob->ob_spec.tedinfo = spec = Aim_create(ob->ob_spec.bitblk);
				break;
			
			case G_ICON:
			case G_CICON:
				ob->ob_spec.ciconblk = spec = Aic_create(ob->ob_spec.ciconblk);
				break;
				
			case G_BUTTON:
			case G_STRING:
			case G_TITLE:
				ob->ob_spec.free_string = spec = Ast_create(ob->ob_spec.free_string);
				break;
			
			case G_IBOX:
			case G_BOXCHAR:
			default:
				break;
			}
			if (spec == NULL)
				return NULL; /* BUG: leaks all memory allocated so far */
		}
	} while (!((ob++)->ob_flags & OF_LASTOB));
	return newob;
}

/* -------------------------------------------------------------------------- */

static Awindow *Awi_create23x(const Awindow *parent)
{
	Awindow *newwin;
	int16 i;
	
	newwin = (Awindow *)Ax_malloc(sizeof(*newwin));
	/* BUG: no check for NULL */
	memcpy(newwin, parent, sizeof(*newwin) - 5 * sizeof(void *));
	/*
	 * create the 5 new members that were added in 3.0.0
	 */
	newwin->iconify = Awi_iconify;
	newwin->uniconify = Awi_uniconify;
	newwin->gemscript = Awi_gemscript;
	newwin->help_title = newwin->help_file = Ast_create("");
	if (newwin->work != NULL)
	{
		newwin->work = Aob_create23x(newwin->work);
		if (newwin->work == NULL)
		{
			Ax_free(newwin);
			return NULL;
		}
		Aob_fix(newwin->work);
	}
	if (newwin->toolbar != NULL)
	{
		newwin->toolbar = Aob_create23x(newwin->toolbar);
		if (newwin->toolbar == NULL)
		{
			Aob_delete(newwin->work);
			Ax_free(newwin);
			return NULL;
		}
		Aob_fix(newwin->toolbar);
	}
	if (newwin->menu != NULL)
	{
		newwin->menu = Aob_create23x(newwin->menu);
		if (newwin->menu == NULL)
		{
			Aob_delete(newwin->toolbar);
			Aob_delete(newwin->work);
			Ax_free(newwin);
			return NULL;
		}
		Aob_fix(newwin->menu);
		Ame_namefix(newwin->menu);
	}
	if (newwin->iconblk != NULL)
	{
		newwin->iconblk = Aic_create(newwin->iconblk);
		if (newwin->iconblk == NULL)
		{
			Aob_delete(newwin->menu);
			Aob_delete(newwin->toolbar);
			Aob_delete(newwin->work);
			Ax_free(newwin);
			return NULL;
		}
	}
	Awi_uoself(newwin);
	if (newwin->name != NULL)
	{
		newwin->name = Ast_create(newwin->name);
	}
	if (newwin->info != NULL)
	{
		newwin->info = Ast_create(newwin->info);
	}
	newwin->state = AWS_MODIFIED;
	newwin->icon = NIL;
	newwin->ob_edit = NIL;
	newwin->ob_len = 0;
	for (i = 0; i < MAX_WINDS; i++)
	{
		if (_ACSv_winds[i] == NULL)
		{
			if (i > _Wmax_wi)
				_Wmax_wi = i;
			_ACSv_winds[i] = newwin;
			if (Aroot_wi != NULL && (newwin->kind & AW_ICON))
				Aroot_wi->service(Aroot_wi, AS_PLACEICON, newwin);
			newwin->wi_act.x = newwin->wi_act.x * ACSblk->gl_wbox;
			newwin->wi_act.y = newwin->wi_act.y * ACSblk->gl_hbox;
			newwin->wi_act.w = newwin->wi_act.w * ACSblk->gl_wbox;
			newwin->wi_act.h = newwin->wi_act.h * ACSblk->gl_hbox;
			return newwin;
		}
	}
	form_alert(1, _ALIB_ERR_WISLOT);
	return NULL;
}

/* -------------------------------------------------------------------------- */

static void Awi_arrowed23x(Awindow *window, int16 which)
{
	Awi_arrowed(window, which, 1);
}

/* -------------------------------------------------------------------------- */

static char *Af_first230(const char *start)
{
	return Af_first(start, NULL);
}

/* -------------------------------------------------------------------------- */

static char *Af_next230(void)
{
	return Af_next(NULL);
}

/* FIXME: Ast_filter in 3.0.0 has extra parameter */
/* FIXME: Ast_cleargroup in 3.0.0 has extra parameter */
