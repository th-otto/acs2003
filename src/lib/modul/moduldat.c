/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Function tables for module loader                     */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#define __COMPATIBLE_FKT__
#include "acs_i.h"
#include "acsvdi.h"
#include "acsplus.h"
#include "version.h"
#include "messages/msgserv.h"

#ifdef __PUREC__
/* misnamed functions no longer declared in header */
void (vsf_updat)( int16 handle, const int16 *pattern, int16 nplanes );
void (v_curaddress)( int16 handle, int16 row, int16 col );
#endif

#ifdef __GNUC__
void CDECL pc_aes( int16 *contrl, GlobalArray *global, int16 *intin, int16 *intout, void *addrin, void *addrout );
#endif

#define NUMFUNCS(a) ((int)(sizeof(a) / sizeof(a[0])))

static void *func1Abp[] = {
	Abp_create,
	Abp_delete,
	Abp_start,
	Abp_end,
	Abp_mfdb2img,
	Abp_img2mfdb
};
static funcVersion const funcAbp[] = { { func1Abp, 0 } };
static int16 const funcAnzAbp = NUMFUNCS(funcAbp);

static void *func1Acfg[] = {
	Acfg_create,
	Acfg_delete,
	Acfg_clear,
	Acfg_clearAllGroups,
	Acfg_clearGroup,
	Acfg_load,
	Acfg_save,
	Acfg_isChanged,
	Acfg_getValue,
	Acfg_setValue,
	Acfg_clearValue,
	Acfg_getChar,
	Acfg_setChar,
	Acfg_getLong,
	Acfg_setLong,
	Acfg_getString,
	Acfg_getBool,
	Acfg_setBool,
	Acfg_clearHeader,
	Acfg_headAnzahl,
	Acfg_setHeader,
	Acfg_getHeader,
	Acfg_grpAnzahl,
	Acfg_grpName,
	Acfg_strAnzahl,
	Acfg_strName,
	Acfg_strValue,
	Acfg_strIsComment,
	Acfg_isCfgfile,
	Acfg_createInfo,
	Acfg_deleteInfo,
	Acfg_setInfo,
	Acfg_getInfo,
	Acfg_copyInfo,
	Acfg_flags,
	Acfg_isGroupPresent,
	Acfg_isStringPresent,
#if !BETA
	Acfg_getDouble,
	Acfg_setDouble,
#endif
};
static funcVersion const funcAcfg[] = { { func1Acfg, 0 } };
static int16 const funcAnzAcfg = NUMFUNCS(funcAcfg);

static void *func1Ach[] = {
	Ach_tolower,
	Ach_toupper,
	Ach_isWhite
};
static funcVersion const funcAch[] = { { func1Ach, 0 } };
static int16 const funcAnzAch = NUMFUNCS(funcAch);

static void *func1Adr[] = {
	Adr_box,
	Adr_drag,
	Adr_next,
	Adr_add,
	Adr_del,
	Adr_unselect,
	Adr_start
};
static funcVersion const funcAdr[] = { { func1Adr, 0 } };
static int16 const funcAnzAdr = NUMFUNCS(funcAdr);

static void *func1Aev[] = {
	Aev_quit,
	Aev_release,
	Aev_mess,
	Aev_unhidepointer,
	Aev_DhstAdd,
	Aev_DhstSaved,
	Aev_WmRedraw,
#if WITH_FIXES
	Aev_FontBubbleGEM,
	Aev_HideBubbleGEM,
#endif
};
static funcVersion const funcAev[] = { { func1Aev, 0 } };
static int16 const funcAnzAev = NUMFUNCS(funcAev);

static void *func1Af[] = {
	Af_cfgfile,
	Af_select,
	Af_2drv,
	Af_2path,
	Af_2name,
	Af_2fullname,
	Af_2ext,
	Af_buildname,
	Af_length,
	Af_first_fsel,
	Af_next_fsel,
	Af_first,
	Af_next,
	Af_readdir,
	Af_freedir,
	Af_fileselect,
	Af_quote,
	Af_unquote,
#if WITH_FIXES
	Af_chgExt,
	Af_pathconf,
#endif
};
static funcVersion const funcAf[] = { { func1Af, 0 } };
static int16 const funcAnzAf = NUMFUNCS(funcAf);

static void *func1Aic[] = {
	Aic_create,
	Aic_delete
};
static funcVersion const funcAic[] = { { func1Aic, 0 } };
static int16 const funcAnzAic = NUMFUNCS(funcAic);

static void *func1Aim[] = {
	Aim_create,
	Aim_delete
};
static funcVersion const funcAim[] = { { func1Aim, 0 } };
static int16 const funcAnzAim = NUMFUNCS(funcAim);

static void *func1Alu[] = {
	Alu_create,
	Alu_delete,
#if !BETA || WITH_FIXES
	As_create,
	As_delete,
	Aqu_create,
	Aqu_delete,
#endif
#if WITH_FIXES
	Alu_ptrCmp,
	Alu_longCmp,
	Alu_intCmp,
	Alu_charCmp,
	Alu_strCmp,
	Alu_striCmp,
#endif
};
static funcVersion const funcAlu[] = { { func1Alu, 0 } };
static int16 const funcAnzAlu = NUMFUNCS(funcAlu);

static void *func1Ame[] = {
	Ame_namefix,
	Ame_popup
};
static funcVersion const funcAme[] = { { func1Ame, 0 } };
static int16 const funcAnzAme = NUMFUNCS(funcAme);

static void *func1Amo[] = {
	Amo_new,
	Amo_busy,
	Amo_unbusy,
	Amo_hide,
	Amo_show
};
static funcVersion const funcAmo[] = { { func1Amo, 0 } };
static int16 const funcAnzAmo = NUMFUNCS(funcAmo);

static void *func1Aob[] = {
	Aob_create,
	Aob_delete,
	Aob_fix,
	Aob_offset,
	Aob_save,
	Aob_restore,
	Aob_watch,
	Aob_findflag,
	Aob_alias,
	Aob_up,
	Aob_icon,
	Aob_puttext,
	Aob_gettext,
	Aob_within,
	Aob_printf,
	Aob_scanf,
	Aob_flags,
	Aob_state,
	Aob_service,
	Aob_visible,
	Aob_count,
#if WITH_FIXES
	Aob_help,
#endif
};
static funcVersion const funcAob[] = { { func1Aob, 0 } };
static int16 const funcAnzAob = NUMFUNCS(funcAob);

static void *func1Ascrp[] = {
	Ascrp_clear,
	Ascrp_get,
	Ascrp_put
};
static funcVersion const funcAscrp[] = { { func1Ascrp, 0 } };
static int16 const funcAnzAscrp = NUMFUNCS(funcAscrp);

static void *func1Ash[] = {
	Ash_prog,
	Ash_error,
	Ash_getcookie,
	Ash_getenv,
	Ash_nextdd,
	Ash_sendall,
	Ash_CallEdDI,
	Ash_NVDICookie,
	Ash_NVDIVersion,
	Ash_NVDIDatum,
	Ash_thermometer,
	Ash_fileselect,
	Ash_font,
	Ash_print,
	Ash_gettimer,
	Ash_printSetIcon,
	Ash_fontSetIcon,
	Ash_fileSetIcon,
	Ash_getOSHeader,
	Ash_getMagiC,
	Ash_getNAES,
	Ash_getMagiCVersion,
	Ash_getMagiCAESVars,
#if WITH_FIXES
	Ash_cmdParsen,
	Ash_sendmsg,
#endif
};
static funcVersion const funcAsh[] = { { func1Ash, 0 } };
static int16 const funcAnzAsh = NUMFUNCS(funcAsh);

static void *func1Ast[] = {
	Ast_create,
	Ast_delete,
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
	Ast_ncmp,
	Ast_incmp,
	Ast_istr
};
static funcVersion const funcAst[] = { { func1Ast, 0 } };
static int16 const funcAnzAst = NUMFUNCS(funcAst);

static void *func1Ate[] = {
	Ate_create,
	Ate_delete
};
static funcVersion const funcAte[] = { { func1Ate, 0 } };
static int16 const funcAnzAte = NUMFUNCS(funcAte);

static void *func1Auo[] = {
	Auo_ftext,
	Auo_string,
	Auo_cycle,
	Auo_picture,
	Auo_boxed
};
static funcVersion const funcAuo[] = { { func1Auo, 0 } };
static int16 const funcAnzAuo = NUMFUNCS(funcAuo);

static void *func1Aus[] = {
	Aus_create,
	Aus_delete,
	Aus_boxed,
	Aus_cycle,
#if WITH_FIXES
	Aus_help,
#endif
};
static funcVersion const funcAus[] = { { func1Aus, 0 } };
static int16 const funcAnzAus = NUMFUNCS(funcAus);

static void *func1Awi[] = {
	Awi_wid,
	Awi_root,
	Awi_list,
	Awi_sendall,
	Awi_down,
	Awi_up,
	Awi_show,
	Awi_init,
	Awi_create,
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
	Awi_arrowed,
	Awi_hslid,
	Awi_vslid,
	Awi_iconify,
	Awi_uniconify,
	Awi_gemscript,
	Awi_modal,
	Awi_dialog,
	Awi_alert,
	Awi_selfcreate,
	Awi_nokey,
	Awi_update,
	Awi_uoself,
	Awi_doform,
	Awi_observice,
	Awi_ontop,
	Awi_layout,
	Awi_obvisible,
#if WITH_FIXES
	Awi_saved,
	Awi_sendkey,
#endif
};
static funcVersion const funcAwi[] = { { func1Awi, 0 } };
static int16 const funcAnzAwi = NUMFUNCS(funcAwi);

static void *func1A[] = {
	A_dialog,
	A_checkbox,
	A_radiobutton,
	A_innerframe,
	A_pattern,
	A_arrows,
	A_select,
	A_ftext,
	A_title,
	A_3Dbutton,
	A_cycle,
	A_picture,
	A_dialog2,
	A_boxed,
};
static funcVersion const funcA[] = { { func1A, 0 } };
static int16 const funcAnzA = NUMFUNCS(funcA);

static void *func1Sonst[] = {
	Ax_malloc,
	Ax_free,
	Ax_ifree,
	Ax_glmalloc,
	Ax_glfree,
	Ax_mterm,
	alert_str,
	intersect,
	xywh2array,
	array2xywh,
	dotted_xline,
	dotted_yline,
	nkc_tos2n,
	nkc_n2tos,
	nkc_gem2n,
	nkc_n2gem,
	nkc_gemks2n,
	nkc_n2gemks,
	nkc_n2kstate,
	nkc_kstate,
	nkc_cmp,
	nkc_tolower,
	nkc_toupper,
	appl_getinfo,
	Ax_setRecycleSize,
	Ax_getRecycleStat,
	Ax_recycle,
	Avdi_getRGB,
#if !BETA || WITH_FIXES
	Ax_memCheck,
#endif
#if WITH_FIXES
	Adate_getMonth,
	Adate_ymd2dow,
#endif
};
static funcVersion const funcSonst[] = { { func1Sonst, 0 } };
static int16 const funcAnzSonst = NUMFUNCS(funcSonst);

static void *func1Vdi[] = {
	vdi,
	vdi_,
	v_opnwk,
	v_clswk,
	v_opnvwk,
	v_clsvwk,
	v_clrwk,
	v_updwk,
	v_opnbm,
	v_clsbm,
	vst_load_fonts,
	vst_unload_fonts,
	vs_clip,
	v_pline,
	v_pmarker,
	v_gtext,
	v_fillarea,
	v_cellarray,
	v_contourfill,
	v_bar,
	v_arc,
	v_pieslice,
	v_circle,
	v_ellipse,
	v_ellarc,
	v_ellpie,
	v_justified,
	vr_recfl,
	v_rfbox,
	v_rbox,
	vq_gdos,
	vswr_mode,
	vsl_type,
	vsl_udsty,
	vsl_width,
	vsl_color,
	vsl_ends,
	vsm_type,
	vsm_height,
	vsm_color,
	vst_height,
	vst_point,
	vst_rotation,
	vst_font,
	vst_color,
	vst_effects,
	vst_alignment,
	vsf_interior,
	vsf_style,
	vsf_color,
	vsf_perimeter,
	vsf_udpat,
#ifdef __PUREC__
	vsf_updat,
#else
	vsf_udpat,
#endif
	vs_color,
	vr_trnfm,
	vro_cpyfm,
	vrt_cpyfm,
	v_get_pixel,
	vsin_mode,
	vrq_locator,
	vsm_locator,
	vrq_valuator,
	vsm_valuator,
	vrq_choice,
	vsm_choice,
	vrq_string,
	vsm_string,
	vex_timv,
	v_show_c,
	v_hide_c,
	vq_mouse,
	vex_butv,
	vex_motv,
	vex_curv,
	vq_key_s,
	vq_extnd,
	vql_attributes,
	vqm_attributes,
	vqf_attributes,
	vqt_attributes,
	vqt_extent,
	vqt_width,
	vqt_name,
	vqin_mode,
	vqt_fontinfo,
	vq_scrninfo,
	vq_color,
	vq_cellarray,
	vq_chcells,
	v_exit_cur,
	v_enter_cur,
	v_curup,
	v_curdown,
	v_curright,
	v_curleft,
	v_curhome,
	v_eeos,
	v_eeol,
#ifdef __PUREC__
	v_curaddress,
#else
	vs_curaddress,
#endif
	v_curtext,
	v_rvon,
	v_rvoff,
	vq_curaddress,
	vq_tabstatus,
	v_hardcopy,
	v_dspcur,
	v_rmcur,
	v_form_adv,
	v_clear_disp_list,
	vq_scan,
	v_alpha_text,
	vs_palette,
	v_sound,
	vs_mute,
	vt_resolution,
	vt_axis,
	vt_origin,
	vq_tdimensions,
	vt_alignment,
	vsp_film,
	vqp_filmname,
	vsc_expose,
	v_meta_extents,
	v_write_meta,
	vm_pagesize,
	vm_coords,
	vm_filename,
	v_offset,
	v_fontinit,
	v_escape2000,
	v_output_window,
	v_bit_image,
	fix31ToPixel,
	v_opnprn,
	v_opnmeta,
	vq_devinfo,
	vq_ext_devinfo,
	vs_calibrate,
	vq_calibrate,
	v_bez,
	v_bez_on,
	v_bez_off,
	v_bez_qual,
	v_bez_fill,
	vqt_ext_name,
	vqt_char_index,
	vqt_isCharAvailable,
	vqt_xfntinfo,
	vst_name,
	vqt_name_and_id,
	vqt_fontheader,
	vqt_trackkern,
	vqt_pairkern,
	vst_charmap,
	vst_kern,
	vst_kern_offset,
	v_getbitmap_info,
	vqt_f_extent,
	vqt_real_extent,
	v_ftext,
	v_ftext_offset,
	v_getoutline,
	vst_arbpt32,
	vqt_advance32,
	vst_setsize32,
	vst_skew,
	v_orient,
	v_trays,
	vq_tray_names,
	v_page_size,
	vq_page_name,
	vst_fg_color,
	vsf_fg_color,
	vsl_fg_color,
	vsm_fg_color,
	vsr_fg_color,
	vst_bg_color,
	vsf_bg_color,
	vsl_bg_color,
	vsm_bg_color,
	vsr_bg_color,
	vqt_fg_color,
	vqf_fg_color,
	vql_fg_color,
	vqm_fg_color,
	vqr_fg_color,
	vqt_bg_color,
	vqf_bg_color,
	vql_bg_color,
	vqm_bg_color,
	vqr_bg_color,
	v_color2value,
	v_value2color,
	v_color2nearest,
	vq_px_format,
	vs_ctab,
	vs_ctab_entry,
	vs_dflt_ctab,
	vq_ctab,
	vq_ctab_entry,
	vq_ctab_id,
	v_ctab_idx2vdi,
	v_ctab_vdi2idx,
	v_ctab_idx2value,
	v_get_ctab_id,
	vq_dflt_ctab,
	v_create_itab,
	v_delete_itab,
	vr_transfer_bits,
	vs_hilite_color,
	vs_min_color,
	vs_max_color,
	vs_weight_color,
	vq_hilite_color,
	vq_min_color,
	vq_max_color,
	vq_weight_color,
	vs_document_info,
	vq_prn_scaling,
	v_open_bm,
	v_resize_bm,
	v_get_outline,
	vst_track_offset,
	vst_arbpt,
	vqt_advance,
	vst_setsize,
	vq_vgdos,
	vst_width,
	vst_scratch,
	vst_error,
	v_savecache,
	v_loadcache,
	v_flushcache,
	vqt_cachesize,
	vqt_get_table,
	vs_curaddress,
	vsf_perimeter3,
	vqt_justified,
	v_opnprnwrk,
	v_opnmatrixprn,
	v_set_app_buff,
	vqt_devinfo,
	v_create_ctab,
	v_delete_ctab,
	v_setrgb
};
static funcVersion const funcVdi[] = { { func1Vdi, 0 } };
static int16 const funcAnzVdi = NUMFUNCS(funcVdi);

static void *func1Aes[] = {
#ifdef __GNUC__
	pc_aes,
#else
	aes,
#endif
	appl_init,
	appl_read,
	appl_write,
	appl_find,
	appl_search,
	appl_tplay,
	appl_trecord,
	appl_yield,
	appl_exit,
	appl_getinfo,
	appl_control,
	evnt_keybd,
	evnt_button,
	evnt_mouse,
	evnt_mesag,
	evnt_timer,
	evnt_event,
	evnt_multi,
	evnt_dclick,
	menu_bar,
	menu_icheck,
	menu_ienable,
	menu_tnormal,
	menu_text,
	menu_register,
	menu_unregister,
	menu_click,
	menu_attach,
	menu_istart,
	menu_popup,
	menu_settings,
	objc_add,
	objc_delete,
	objc_draw,
	objc_find,
	objc_offset,
	objc_order,
	objc_edit,
	objc_change,
	objc_sysvar,
	form_do,
	form_dial,
	form_alert,
	form_error,
	form_center,
	form_keybd,
	form_button,
#ifdef __GNUC__
	graf_rubberbox,
#else
	graf_rubbox,
#endif
	graf_rubberbox,
	graf_dragbox,
	graf_mbox,
#ifdef __GNUC__
	graf_mbox,
#else
	graf_movebox,
#endif
	graf_growbox,
	graf_shrinkbox,
	graf_watchbox,
	graf_slidebox,
	graf_handle,
	graf_mouse,
	graf_mkstate,
	graf_multirubber,
	scrp_read,
	scrp_write,
	fsel_input,
	fsel_exinput,
	fsel_boxinput,
	fslx_open,
	fslx_close,
	fslx_getnxtfile,
	fslx_evnt,
	fslx_do,
	fslx_set_flags,
	wind_create,
	wind_open,
	wind_close,
	wind_delete,
	wind_get,
	wind_getQSB,
	wind_set,
	wind_find,
	wind_update,
	wind_calc,
	wind_new,
	rsrc_load,
	rsrc_free,
	rsrc_gaddr,
	rsrc_saddr,
	rsrc_obfix,
	rsrc_rcfix,
	shel_read,
	shel_write,
	shel_get,
	shel_put,
	shel_find,
	shel_envrn,
	shel_help,
	fnts_add,
	fnts_close,
	fnts_create,
	fnts_delete,
	fnts_do,
	fnts_evnt,
	fnts_get_info,
	fnts_get_name,
	fnts_get_no_styles,
	fnts_get_style,
	fnts_open,
	fnts_remove,
	fnts_update,
	lbox_ascroll_to,
#ifdef __GNUC__
	lbox_ascroll_to,
#else
	lbox_scroll_to,
#endif
	lbox_bscroll_to,
	lbox_cnt_items,
	lbox_create,
	lbox_delete,
	lbox_do,
	lbox_free_items,
	lbox_free_list,
	lbox_get_afirst,
#ifdef __GNUC__
	lbox_get_afirst,
#else
	lbox_get_first,
#endif
#ifdef __GNUC__
	lbox_get_visible,
#else
	lbox_get_avis,
#endif
	lbox_get_visible,
	lbox_get_bentries,
	lbox_get_bfirst,
	lbox_get_idx,
	lbox_get_item,
	lbox_get_items,
	lbox_get_slct_idx,
	lbox_get_slct_item,
	lbox_get_tree,
	lbox_get_udata,
	lbox_set_asldr,
#ifdef __GNUC__
	lbox_set_asldr,
#else
	lbox_set_slider,
#endif
	lbox_set_bentries,
	lbox_set_bsldr,
	lbox_set_items,
	lbox_update,
	pdlg_add_printers,
	pdlg_add_sub_dialogs,
	pdlg_close,
	pdlg_create,
	pdlg_delete,
	pdlg_dflt_settings,
	pdlg_do,
	pdlg_evnt,
	pdlg_free_settings,
	pdlg_get_setsize,
	pdlg_new_settings,
	pdlg_open,
	pdlg_remove_printers,
	pdlg_remove_sub_dialogs,
	pdlg_update,
	pdlg_use_settings,
	pdlg_validate_settings,
	edit_create,
	edit_set_buf,
	edit_open,
	edit_close,
	edit_delete,
	edit_cursor,
	edit_evnt,
	edit_get_buf,
	edit_get_format,
	edit_get_colour,
#ifdef __GNUC__
	edit_get_colour,
#else
	edit_get_color,
#endif
	edit_get_font,
	edit_get_cursor,
	edit_get_dirty,
	edit_get_sel,
	edit_get_scrollinfo,
	edit_set_format,
	edit_set_colour,
	edit_set_colour,
	edit_set_font,
	edit_set_cursor,
	edit_resized,
	edit_set_dirty,
	edit_scroll,
	EvntMulti,
	form_wbutton,
	form_xdial,
	form_xdo,
	form_xerr,
#ifdef __GNUC__
	aes,
#else
	_crystal,
#endif
	graf_wwatchbox,
	graf_xhandle,
	wdlg_create,
	wdlg_open,
	wdlg_close,
	wdlg_delete,
	wdlg_get_tree,
	wdlg_get_edit,
	wdlg_get_udata,
	wdlg_get_handle,
	wdlg_set_edit,
	wdlg_set_tree,
	wdlg_set_size,
	wdlg_set_iconify,
	wdlg_set_uniconify,
	wdlg_evnt,
	wdlg_redraw,
	wind_draw,
	scrp_clear,
	objc_xedit,
#ifdef __GNUC__
	graf_rubberbox,
#else
	graf_rubbbox,
#endif
};
static funcVersion const funcAes[] = { { func1Aes, 0 } };
static int16 const funcAnzAes = NUMFUNCS(funcAes);

static void *func1MtAes[] = {
	mt_appl_init,
	mt_appl_read,
	mt_appl_write,
	mt_appl_find,
	mt_appl_search,
	mt_appl_tplay,
	mt_appl_trecord,
	mt_appl_yield,
	mt_appl_exit,
	mt_appl_getinfo,
	mt_appl_control,
	mt_evnt_keybd,
	mt_evnt_button,
	mt_evnt_mouse,
	mt_evnt_mesag,
	mt_evnt_timer,
	mt_evnt_event,
	mt_evnt_multi,
	mt_evnt_dclick,
	mt_menu_bar,
	mt_menu_icheck,
	mt_menu_ienable,
	mt_menu_tnormal,
	mt_menu_text,
	mt_menu_register,
	mt_menu_unregister,
	mt_menu_click,
	mt_menu_attach,
	mt_menu_istart,
	mt_menu_popup,
	mt_menu_settings,
	mt_objc_add,
	mt_objc_delete,
	mt_objc_draw,
	mt_objc_find,
	mt_objc_offset,
	mt_objc_order,
	mt_objc_edit,
	mt_objc_change,
	mt_objc_sysvar,
	mt_form_do,
	mt_form_dial,
	mt_form_alert,
	mt_form_error,
	mt_form_center,
	mt_form_keybd,
	mt_form_button,
#ifdef __GNUC__
	mt_graf_rubberbox,
#else
	mt_graf_rubbox,
#endif
	mt_graf_rubberbox,
	mt_graf_dragbox,
	mt_graf_mbox,
#ifdef __GNUC__
	mt_graf_mbox,
#else
	mt_graf_movebox,
#endif
	mt_graf_growbox,
	mt_graf_shrinkbox,
	mt_graf_watchbox,
	mt_graf_slidebox,
	mt_graf_handle,
	mt_graf_mouse,
	mt_graf_mkstate,
	mt_graf_multirubber,
	mt_scrp_read,
	mt_scrp_write,
	mt_fsel_input,
	mt_fsel_exinput,
	mt_fsel_boxinput,
	mt_fslx_open,
	mt_fslx_close,
	mt_fslx_getnxtfile,
	mt_fslx_evnt,
	mt_fslx_do,
	mt_fslx_set_flags,
	mt_wind_create,
	mt_wind_open,
	mt_wind_close,
	mt_wind_delete,
	mt_wind_get,
	mt_wind_getQSB,
	mt_wind_set,
	mt_wind_find,
	mt_wind_update,
	mt_wind_calc,
	mt_wind_new,
	mt_rsrc_load,
	mt_rsrc_free,
	mt_rsrc_gaddr,
	mt_rsrc_saddr,
	mt_rsrc_obfix,
	mt_rsrc_rcfix,
	mt_shel_read,
	mt_shel_write,
	mt_shel_get,
	mt_shel_put,
	mt_shel_find,
	mt_shel_envrn,
	mt_shel_help,
	mt_fnts_add,
	mt_fnts_close,
	mt_fnts_create,
	mt_fnts_delete,
	mt_fnts_do,
	mt_fnts_evnt,
	mt_fnts_get_info,
	mt_fnts_get_name,
	mt_fnts_get_no_styles,
	mt_fnts_get_style,
	mt_fnts_open,
	mt_fnts_remove,
	mt_fnts_update,
	mt_lbox_ascroll_to,
#ifdef __GNUC__
	mt_lbox_ascroll_to,
#else
	mt_lbox_scroll_to,
#endif
	mt_lbox_bscroll_to,
	mt_lbox_cnt_items,
	mt_lbox_create,
	mt_lbox_delete,
	mt_lbox_do,
	mt_lbox_free_items,
	mt_lbox_free_list,
	mt_lbox_get_afirst,
#ifdef __GNUC__
	mt_lbox_get_afirst,
#else
	mt_lbox_get_first,
#endif
#ifdef __GNUC__
	mt_lbox_get_visible,
#else
	mt_lbox_get_avis,
#endif
	mt_lbox_get_visible,
	mt_lbox_get_bentries,
	mt_lbox_get_bfirst,
	mt_lbox_get_idx,
	mt_lbox_get_item,
	mt_lbox_get_items,
	mt_lbox_get_slct_idx,
	mt_lbox_get_slct_item,
	mt_lbox_get_tree,
	mt_lbox_get_udata,
	mt_lbox_set_asldr,
#ifdef __GNUC__
	mt_lbox_set_asldr,
#else
	mt_lbox_set_slider,
#endif
	mt_lbox_set_bentries,
	mt_lbox_set_bsldr,
	mt_lbox_set_items,
	mt_lbox_update,
	mt_pdlg_add_printers,
	mt_pdlg_add_sub_dialogs,
	mt_pdlg_close,
	mt_pdlg_create,
	mt_pdlg_delete,
	mt_pdlg_dflt_settings,
	mt_pdlg_do,
	mt_pdlg_evnt,
	mt_pdlg_free_settings,
	mt_pdlg_get_setsize,
	mt_pdlg_new_settings,
	mt_pdlg_open,
	mt_pdlg_remove_printers,
	mt_pdlg_remove_sub_dialogs,
	mt_pdlg_update,
	mt_pdlg_use_settings,
	mt_pdlg_validate_settings,
	mt_edit_create,
	mt_edit_set_buf,
	mt_edit_open,
	mt_edit_close,
	mt_edit_delete,
	mt_edit_cursor,
	mt_edit_evnt,
	mt_edit_get_buf,
	mt_edit_get_format,
	mt_edit_get_colour,
#ifdef __GNUC__
	mt_edit_get_colour,
#else
	mt_edit_get_color,
#endif
	mt_edit_get_font,
	mt_edit_get_cursor,
	mt_edit_get_dirty,
	mt_edit_get_sel,
	mt_edit_get_scrollinfo,
	mt_edit_set_format,
	mt_edit_set_colour,
	mt_edit_set_colour,
	mt_edit_set_font,
	mt_edit_set_cursor,
	mt_edit_resized,
	mt_edit_set_dirty,
	mt_edit_scroll,
	mt_EvntMulti,
	mt_form_wbutton,
	mt_form_xdial,
	mt_form_xdo,
	mt_form_xerr,
	mt_graf_wwatchbox,
	mt_graf_xhandle,
	mt_wdlg_create,
	mt_wdlg_open,
	mt_wdlg_close,
	mt_wdlg_delete,
	mt_wdlg_get_tree,
	mt_wdlg_get_edit,
	mt_wdlg_get_udata,
	mt_wdlg_get_handle,
	mt_wdlg_set_edit,
	mt_wdlg_set_tree,
	mt_wdlg_set_size,
	mt_wdlg_set_iconify,
	mt_wdlg_set_uniconify,
	mt_wdlg_evnt,
	mt_wdlg_redraw,
	mt_wind_draw,
	mt_scrp_clear,
	mt_objc_xedit,
#ifdef __GNUC__
	mt_graf_rubberbox,
#else
	mt_graf_rubbbox,
#endif
};
static funcVersion const funcMtAes[] = { { func1MtAes, 0 } };
static int16 const funcAnzMtAes = NUMFUNCS(funcMtAes);

static void *func1Keytab[] = {
	Akt_getKeyTab,
	Akt_getRelease,
	Akt_getEuro,
	Akt_getExpMaxNr,
	Akt_getImpMaxNr,
	Akt_getExpNameFromNr,
	Akt_getImpNameFromNr,
	Akt_getExpShortNameFromNr,
	Akt_getImpShortNameFromNr,
	Akt_getExpNrFromId,
	Akt_getImpNrFromId,
	Akt_getExpIdFromNr,
	Akt_getImpIdFromNr,
	Akt_getExpNrFromName,
	Akt_getImpNrFromName,
	Akt_CharAtari2X,
	Akt_CharX2Atari,
	Akt_BlockAtari2X,
	Akt_BlockX2Atari,
	Akt_StringAtari2X,
	Akt_StringX2Atari,
	Akt_CharX2Unicode,
	Akt_CharUnicode2X,
	Akt_BlockX2Unicode,
	Akt_BlockUnicode2X,
	Akt_StringX2Unicode,
	Akt_popExpName,
	Akt_popImpName,
	Akt_chooseExpNr,
	Akt_chooseImpNr,
	Akt_getExpMinNr,
	Akt_getImpMinNr,
	Akt_BlockXUtf2Unicode,
	Akt_BlockUnicode2XUtf,
	Akt_StringXUtf2Unicode,
	Akt_BlockXUtf2U2XUtf,
	Akt_BlockXUtf2XUtf,
	Akt_StringXUtf2U2XUtf,
	Akt_StringXUtf2XUtf,
#if !BETA || WITH_FIXES
	Akt_getInfoShort,
	Akt_getInfoString,
#endif
#if WITH_FIXES
	Akt_CharXUtf2Unicode,
	Akt_CharUnicode2XUtf,
#endif
};
static funcVersion const funcKeytab[] = { { func1Keytab, 0 } };
static int16 const funcAnzKeytab = NUMFUNCS(funcKeytab);


/*
missing exports:

Aev_SearchMsg
Aev_DeleteMsg
Aev_AccKey
Aev_AccText
Aev_APDragDropMemory
Aev_GetAskFontBubbleGEM
Aev_VaProtoStatus
A_OlgaCreate
A_OlgaDelete
Aev_OlgaIdle
Aev_OlgaGetInfo
Aev_OlgaRename
Aev_OlgaBreaklink
Aev_PCHelpVersion
Aev_AcVersion
Aev_AcCopy
Aud_boxed
*/


funcListe funcs[] = {
	{ funcAbp,    &funcAnzAbp },
	{ funcAcfg,   &funcAnzAcfg },
	{ funcAch,    &funcAnzAch },
	{ funcAdr,    &funcAnzAdr },
	{ funcAev,    &funcAnzAev },
	{ funcAf,     &funcAnzAf },
	{ funcAic,    &funcAnzAic },
	{ funcAim,    &funcAnzAim },
	{ funcAlu,    &funcAnzAlu },
	{ funcAme,    &funcAnzAme },
	{ funcAmo,    &funcAnzAmo },
	{ funcAob,    &funcAnzAob },
	{ funcAscrp,  &funcAnzAscrp },
	{ funcAsh,    &funcAnzAsh },
	{ funcAst,    &funcAnzAst },
	{ funcAte,    &funcAnzAte },
	{ funcAuo,    &funcAnzAuo },
	{ funcAus,    &funcAnzAus },
	{ funcAwi,    &funcAnzAwi },
	{ funcA,      &funcAnzA },
	{ funcSonst,  &funcAnzSonst },
	{ funcVdi,    &funcAnzVdi },
	{ funcAes,    &funcAnzAes },
	{ funcKeytab, &funcAnzKeytab },
	{ funcMtAes,  &funcAnzMtAes }
};
long const funcsAnz = NUMFUNCS(funcs);
