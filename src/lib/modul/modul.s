
	.globl Ax_mterm
Ax_mterm:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		lea.l      oldbas,a2
		move.l     (a2),d0
		beq.s      Ax_mterm_1
		movea.l    ACSblk,a0
		move.w     566(a0),d1
		bne.s      Ax_mterm_2
		move.w     568(a0),d2
		beq.s      Ax_mterm_3
Ax_mterm_2:
		movea.l    (a2),a0
		jsr        Mfree
		bra.s      Ax_mterm_1
Ax_mterm_3:
		jsr        accgemdo
		movea.l    (a2),a0
		jsr        Mfree
		jsr        oldgemdo
Ax_mterm_1:
		move.l     a3,(a2)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl Ash_module
Ash_module:
		movem.l    d3-d4/a2-a5,-(a7)
		movea.l    a0,a3
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		move.w     566(a0),d0
		bne.s      Ash_module_1
		move.w     568(a0),d1
		bne.s      Ash_module_1
		moveq.l    #1,d3
		bra.s      Ash_module_2
Ash_module_1:
		clr.w      d3
Ash_module_2:
		tst.w      d3
		beq.s      Ash_module_3
		jsr        accgemdo
Ash_module_3:
		lea.l      nix,a5
		pea.l      (a5)
		movea.l    a5,a1
		movea.l    a3,a0
		moveq.l    #3,d0
		jsr        Pexec
		addq.w     #4,a7
		movea.l    d0,a5
		lea.l      256(a5),a4
		tst.l      d0
		bmi        Ash_module_4
		cmp.l      #$0000FFFF,d0
		beq        Ash_module_4
		move.l     12(a5),d1
		add.l      20(a5),d1
		add.l      28(a5),d1
		add.l      #$00000400,d1
		movea.l    a5,a0
		clr.w      d0
		jsr        Mshrink
		tst.w      d0
		beq.s      Ash_module_5
		movea.l    a3,a0
		moveq.l    #15,d0
		movea.l    (a2),a1
		movea.l    982(a1),a1
		jsr        (a1)
Ash_module_5:
		cmpi.l     #$41435336,(a4)
		blt.s      Ash_module_6
		cmpi.l     #$41435337,(a4)
		bgt.s      Ash_module_6
		moveq.l    #1,d4
		bra.s      Ash_module_7
Ash_module_6:
		cmpi.l     #$41435330,(a4)
		blt.s      Ash_module_8
		cmpi.l     #$41435338,(a4)
		ble.s      Ash_module_9
Ash_module_8:
		cmpi.l     #$42674E41,(a4)
		bne.s      Ash_module_9
		cmpi.l     #$41435339,4(a4)
		bne.s      Ash_module_9
		clr.w      d4
Ash_module_7:
		tst.w      d4
		bne.s      Ash_module_10
		movea.l    a4,a0
		jsr        PushFuncLists
		tst.w      d0
		bne.s      Ash_module_10
Ash_module_9:
		movea.l    a5,a0
		jsr        Mfree
		tst.w      d3
		beq.s      Ash_module_11
		jsr        oldgemdo
Ash_module_11:
		movea.l    a3,a0
		moveq.l    #14,d0
		movea.l    (a2),a1
		movea.l    982(a1),a1
		jsr        (a1)
		bra.s      Ash_module_12
Ash_module_10:
		tst.w      d3
		beq.s      Ash_module_13
		jsr        oldgemdo
Ash_module_13:
		tst.w      d4
		bne.s      Ash_module_14
		clr.l      -(a7)
		movea.l    a5,a1
		suba.l     a0,a0
		moveq.l    #4,d0
		jsr        Pexec
		addq.w     #4,a7
		tst.l      d0
		beq.s      Ash_module_14
		tst.w      d3
		beq.s      Ash_module_15
		jsr        accgemdo
Ash_module_15:
		movea.l    a5,a0
		jsr        Mfree
Ash_module_4:
		tst.w      d3
		beq.s      Ash_module_16
		jsr        oldgemdo
Ash_module_16:
		movea.l    a3,a0
		moveq.l    #13,d0
		movea.l    (a2),a1
		movea.l    982(a1),a1
		jsr        (a1)
Ash_module_12:
		moveq.l    #-1,d0
		bra.s      Ash_module_17
Ash_module_14:
		tst.w      d4
		beq.s      Ash_module_18
		cmpi.l     #$41435336,(a4)
		blt.s      Ash_module_19
		cmpi.l     #$41435337,(a4)
		bgt.s      Ash_module_19
		movea.l    4(a4),a5
		move.l     (a2),8(a4)
		cmpi.l     #$41435336,(a4)
		bne.s      Ash_module_20
		lea.l      ACS230,a0
		bra.s      Ash_module_21
Ash_module_20:
		lea.l      ACS233,a0
Ash_module_21:
		move.l     a0,12(a4)
		bra.s      Ash_module_19
Ash_module_18:
		movea.l    8(a4),a5
		move.l     (a2),12(a4)
Ash_module_19:
		jsr        (a5)
Ash_module_17:
		movem.l    (a7)+,d3-d4/a2-a5
		rts

PushFuncLists:
		movem.l    a2-a4,-(a7)
		lea.l      20(a0),a1
		lea.l      funcs,a2
		lea.l      funcsAnz,a3
		move.l     16(a0),d1
		cmp.l      (a3),d1
		bne.s      PushFuncLists_1
		clr.w      d0
		bra.s      PushFuncLists_2
PushFuncLists_9:
		move.w     4(a1),d1
		clr.l      (a1)
		clr.w      d2
		movea.l    (a2),a0
		bra.s      PushFuncLists_3
PushFuncLists_6:
		cmp.w      4(a0),d1
		bne.s      PushFuncLists_4
		move.l     (a0),(a1)
PushFuncLists_4:
		addq.w     #1,d2
		addq.w     #6,a0
PushFuncLists_3:
		tst.l      (a1)
		bne.s      PushFuncLists_5
		movea.l    4(a2),a4
		cmp.w      (a4),d2
		blt.s      PushFuncLists_6
PushFuncLists_5:
		move.l     (a1),d1
		bne.s      PushFuncLists_7
PushFuncLists_1:
		clr.w      d0
		bra.s      PushFuncLists_8
PushFuncLists_7:
		addq.w     #1,d0
		addq.w     #6,a1
		addq.w     #8,a2
PushFuncLists_2:
		move.w     d0,d1
		ext.l      d1
		cmp.l      (a3),d1
		blt.s      PushFuncLists_9
		moveq.l    #1,d0
PushFuncLists_8:
		movem.l    (a7)+,a2-a4
		rts

noop:
		rts

	.data

oldbas:
		dc.w $0000
		dc.w $0000
nix:
		dc.w $0000
		dc.w $0000
func1Abp:
		dc.l Abp_create
		dc.l Abp_delete
		dc.l Abp_start
		dc.l Abp_end
		dc.l Abp_mfdb2img
		dc.l Abp_img2mfdb
funcAbp:
		dc.l func1Abp
		dc.w $0000
funcAnzAbp:
		dc.w $0001
func1Acfg:
		dc.l Acfg_create
		dc.l Acfg_delete
		dc.l Acfg_clear
		dc.l Acfg_clearAllGroups
		dc.l Acfg_clearGroup
		dc.l Acfg_load
		dc.l Acfg_save
		dc.l Acfg_isChanged
		dc.l Acfg_getValue
		dc.l Acfg_setValue
		dc.l Acfg_clearValue
		dc.l Acfg_getChar
		dc.l Acfg_setChar
		dc.l Acfg_getLong
		dc.l Acfg_setLong
		dc.l Acfg_getString
		dc.l Acfg_getBool
		dc.l Acfg_setBool
		dc.l Acfg_clearHeader
		dc.l Acfg_headAnzahl
		dc.l Acfg_setHeader
		dc.l Acfg_getHeader
		dc.l Acfg_grpAnzahl
		dc.l Acfg_grpName
		dc.l Acfg_strAnzahl
		dc.l Acfg_strName
		dc.l Acfg_strValue
		dc.l Acfg_strIsComment
		dc.l Acfg_isCfgfile
		dc.l Acfg_createInfo
		dc.l Acfg_deleteInfo
		dc.l Acfg_setInfo
		dc.l Acfg_getInfo
		dc.l Acfg_copyInfo
		dc.l Acfg_flags
		dc.l Acfg_isGroupPresent
		dc.l Acfg_isStringPresent
funcAcfg:
		dc.l func1Acfg
		dc.w $0000
funcAnzAcfg:
		dc.w $0001
func1Ach:
		dc.l Ach_tolower
		dc.l Ach_toupper
		dc.l Ach_isWhite
funcAch:
		dc.l func1Ach
		dc.w $0000
funcAnzAch:
		dc.w $0001
func1Adr:
		dc.l Adr_box
		dc.l Adr_drag
		dc.l Adr_next
		dc.l Adr_add
		dc.l Adr_del
		dc.l Adr_unselect
		dc.l Adr_start
funcAdr:
		dc.l func1Adr
		dc.w $0000
funcAnzAdr:
		dc.w $0001
func1Aev:
		dc.l Aev_quit
		dc.l Aev_release
		dc.l Aev_mess
		dc.l Aev_unhidepointer
		dc.l Aev_DhstAdd
		dc.l Aev_DhstSaved
		dc.l Aev_WmRedraw
funcAev:
		dc.l func1Aev
		dc.w $0000
funcAnzAev:
		dc.w $0001
func1Af:
		dc.l Af_cfgfile
		dc.l Af_select
		dc.l Af_2drv
		dc.l Af_2path
		dc.l Af_2name
		dc.l Af_2fullname
		dc.l Af_2ext
		dc.l Af_buildname
		dc.l Af_length
		dc.l Af_first_fsel
		dc.l Af_next_fsel
		dc.l Af_first
		dc.l Af_next
		dc.l Af_readdir
		dc.l Af_freedir
		dc.l Af_fileselect
		dc.l Af_quote
		dc.l Af_unquote
funcAf:
		dc.l func1Af
		dc.w $0000
funcAnzAf:
		dc.w $0001
func1Aic:
		dc.l Aic_create
		dc.l Aic_delete
funcAic:
		dc.l func1Aic
		dc.w $0000
funcAnzAic:
		dc.w $0001
func1Aim:
		dc.l Aim_create
		dc.l Aim_delete
funcAim:
		dc.l func1Aim
		dc.w $0000
funcAnzAim:
		dc.w $0001
func1Alu:
		dc.l Alu_create
		dc.l Alu_delete
funcAlu:
		dc.l func1Alu
		dc.w $0000
funcAnzAlu:
		dc.w $0001
func1Ame:
		dc.l Ame_namefix
		dc.l Ame_popup
funcAme:
		dc.l func1Ame
		dc.w $0000
funcAnzAme:
		dc.w $0001
func1Amo:
		dc.l Amo_new
		dc.l Amo_busy
		dc.l Amo_unbusy
		dc.l Amo_hide
		dc.l Amo_show
funcAmo:
		dc.l func1Amo
		dc.w $0000
funcAnzAmo:
		dc.w $0001
func1Aob:
		dc.l Aob_create
		dc.l Aob_delete
		dc.l Aob_fix
		dc.l Aob_offset
		dc.l Aob_save
		dc.l Aob_restore
		dc.l Aob_watch
		dc.l Aob_findflag
		dc.l Aob_alias
		dc.l Aob_up
		dc.l Aob_icon
		dc.l Aob_puttext
		dc.l Aob_gettext
		dc.l Aob_within
		dc.l Aob_printf
		dc.l Aob_scanf
		dc.l Aob_flags
		dc.l Aob_state
		dc.l Aob_service
		dc.l Aob_visible
		dc.l Aob_count
funcAob:
		dc.l func1Aob
		dc.w $0000
funcAnzAob:
		dc.w $0001
func1Ascrp:
		dc.l Ascrp_clear
		dc.l Ascrp_get
		dc.l Ascrp_put
funcAscrp:
		dc.l func1Ascrp
		dc.w $0000
funcAnzAscrp:
		dc.w $0001
func1Ash:
		dc.l Ash_prog
		dc.l Ash_error
		dc.l Ash_getc
		dc.l Ash_getenv
		dc.l Ash_nextdd
		dc.l Ash_sendall
		dc.l Ash_CallEdDI
		dc.l Ash_NVDICookie
		dc.l Ash_NVDIVersion
		dc.l Ash_NVDIDatum
		dc.l Ash_thermometer
		dc.l Ash_fileselect
		dc.l Ash_font
		dc.l Ash_print
		dc.l Ash_gett
		dc.l Ash_printSetIcon
		dc.l Ash_fontSetIcon
		dc.l Ash_fileSetIcon
		dc.l Ash_getO
		dc.l Ash_getM
		dc.l Ash_getN
		dc.l Ash_getM
		dc.l Ash_getM
funcAsh:
		dc.l func1Ash
		dc.w $0000
funcAnzAsh:
		dc.w $0001
func1Ast:
		dc.l Ast_create
		dc.l Ast_delete
		dc.l Ast_tolower
		dc.l Ast_toupper
		dc.l Ast_ltrim
		dc.l Ast_rtrim
		dc.l Ast_alltrim
		dc.l Ast_cmp
		dc.l Ast_icmp
		dc.l Ast_isEmpty
		dc.l Ast_add
		dc.l Ast_adl
		dc.l Ast_adr
		dc.l Ast_adc
		dc.l Ast_filter
		dc.l Ast_count
		dc.l Ast_fcmp
		dc.l Ast_ncmp
		dc.l Ast_incmp
		dc.l Ast_istr
funcAst:
		dc.l func1Ast
		dc.w $0000
funcAnzAst:
		dc.w $0001
func1Ate:
		dc.l Ate_create
		dc.l Ate_delete
funcAte:
		dc.l func1Ate
		dc.w $0000
funcAnzAte:
		dc.w $0001
func1Auo:
		dc.l Auo_ftext
		dc.l Auo_string
		dc.l Auo_cycle
		dc.l Auo_picture
		dc.l Auo_boxed
funcAuo:
		dc.l func1Auo
		dc.w $0000
funcAnzAuo:
		dc.w $0001
func1Aus:
		dc.l Aus_create
		dc.l Aus_delete
		dc.l Aus_boxed
		dc.l Aus_cycle
funcAus:
		dc.l func1Aus
		dc.w $0000
funcAnzAus:
		dc.w $0001
func1Awi:
		dc.l Awi_wid
		dc.l Awi_root
		dc.l Awi_list
		dc.l Awi_sendall
		dc.l Awi_down
		dc.l Awi_up
		dc.l Awi_show
		dc.l Awi_init
		dc.l Awi_create
		dc.l Awi_open
		dc.l Awi_closed
		dc.l Awi_delete
		dc.l Awi_topped
		dc.l Awi_fulled
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_diaend
		dc.l Awi_diastart
		dc.l Awi_keys
		dc.l Awi_obview
		dc.l Awi_service
		dc.l Awi_scroll
		dc.l Awi_obchange
		dc.l Awi_obredraw
		dc.l Awi_redraw
		dc.l Awi_arrowed
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l Awi_gemscript
		dc.l Awi_modal
		dc.l Awi_dialog
		dc.l Awi_alert
		dc.l Awi_selfcreate
		dc.l Awi_nokey
		dc.l Awi_update
		dc.l Awi_uoself
		dc.l Awi_doform
		dc.l Awi_observice
		dc.l Awi_ontop
		dc.l Awi_layout
		dc.l Awi_obvisible
funcAwi:
		dc.l func1Awi
		dc.w $0000
funcAnzAwi:
		dc.w $0001
func1A:
		dc.l A_dialog
		dc.l A_checkbox
		dc.l A_radiobutton
		dc.l A_innerframe
		dc.l A_pattern
		dc.l A_arrows
		dc.l A_select
		dc.l A_ftext
		dc.l A_title
		dc.l A_3Dbutton
		dc.l A_cycle
		dc.l A_picture
		dc.l A_dialog2
		dc.l A_boxed
funcA:
		dc.l func1A
		dc.w $0000
funcAnzA:
		dc.w $0001
func1Sonst:
		dc.l Ax_malloc
		dc.l Ax_free
		dc.l Ax_ifree
		dc.l Ax_glmalloc
		dc.l Ax_glfree
		dc.l Ax_mterm
		dc.l alert_str
		dc.l intersect
		dc.l xywh2array
		dc.l array2xywh
		dc.l dotted_xline
		dc.l dotted_yline
		dc.l nkc_tos2
		dc.l nkc_n2to
		dc.l nkc_gem2n
		dc.l nkc_n2gem
		dc.l nkc_gemks2n
		dc.l nkc_n2gemks
		dc.l nkc_n2kstate
		dc.l nkc_kstate
		dc.l nkc_cmp
		dc.l nkc_tolo
		dc.l nkc_toup
		dc.l appl_getinfo
		dc.l Ax_setRecycleSize
		dc.l Ax_getRecycleStat
		dc.l Ax_recycle
		dc.l Avdi_getRGB
funcSonst:
		dc.l func1Sonst
		dc.w $0000
funcAnzSonst:
		dc.w $0001
func1Vdi:
		dc.l vdi
		dc.l vdi_
		dc.l v_opnwk
		dc.l v_clswk
		dc.l v_opnvwk
		dc.l v_clsvwk
		dc.l v_clrwk
		dc.l v_updwk
		dc.l v_opnbm
		dc.l v_clsbm
		dc.l vst_load_fonts
		dc.l vst_unload_fonts
		dc.l vs_clip
		dc.l v_pline
		dc.l v_pmarker
		dc.l v_gtext
		dc.l v_fillarea
		dc.l v_cellarray
		dc.l v_contourfill
		dc.l v_bar
		dc.l v_arc
		dc.l v_pieslice
		dc.l v_circle
		dc.l v_ellipse
		dc.l v_ellarc
		dc.l v_ellpie
		dc.l v_justified
		dc.l vr_recfl
		dc.l v_rfbox
		dc.l v_rbox
		dc.l vq_gdos
		dc.l vswr_mode
		dc.l vsl_type
		dc.l vsl_udsty
		dc.l vsl_width
		dc.l vsl_color
		dc.l vsl_ends
		dc.l vsm_type
		dc.l vsm_height
		dc.l vsm_color
		dc.l vst_height
		dc.l vst_point
		dc.l vst_rotation
		dc.l vst_font
		dc.l vst_color
		dc.l vst_effects
		dc.l vst_alignment
		dc.l vsf_interior
		dc.l vsf_style
		dc.l vsf_color
		dc.l vsf_perimeter
		dc.l vsf_udpat
		dc.l vsf_updat
		dc.l vs_color
		dc.l vr_trnfm
		dc.l vro_cpyfm
		dc.l vrt_cpyfm
		dc.l v_get_pixel
		dc.l vsin_mode
		dc.l vrq_locator
		dc.l vsm_locator
		dc.l vrq_valuator
		dc.l vsm_valuator
		dc.l vrq_choice
		dc.l vsm_choice
		dc.l vrq_string
		dc.l vsm_string
		dc.l vex_timv
		dc.l v_show_c
		dc.l v_hide_c
		dc.l vq_mouse
		dc.l vex_butv
		dc.l vex_motv
		dc.l vex_curv
		dc.l vq_key_s
		dc.l vq_extnd
		dc.l vql_attributes
		dc.l vqm_attributes
		dc.l vqf_attributes
		dc.l vqt_attributes
		dc.l vqt_extent
		dc.l vqt_width
		dc.l vqt_name
		dc.l vqin_mode
		dc.l vqt_fontinfo
		dc.l vq_scrninfo
		dc.l vq_color
		dc.l vq_cellarray
		dc.l vq_chcells
		dc.l v_exit_cur
		dc.l v_enter_cur
		dc.l v_curup
		dc.l v_curdown
		dc.l v_curright
		dc.l v_curleft
		dc.l v_curhome
		dc.l v_eeos
		dc.l v_eeol
		dc.l v_curaddress
		dc.l v_curtext
		dc.l v_rvon
		dc.l v_rvoff
		dc.l vq_curaddress
		dc.l vq_tabstatus
		dc.l v_hardcopy
		dc.l v_dspcur
		dc.l v_rmcur
		dc.l v_form_adv
		dc.l v_clear_disp_list
		dc.l vq_scan
		dc.l v_alpha_text
		dc.l vs_palette
		dc.l v_sound
		dc.l vs_mute
		dc.l vt_resolution
		dc.l vt_axis
		dc.l vt_origin
		dc.l vq_tdimensions
		dc.l vt_alignment
		dc.l vsp_film
		dc.l vqp_filmname
		dc.l vsc_expose
		dc.l v_meta_extents
		dc.l v_write_meta
		dc.l vm_pagesize
		dc.l vm_coords
		dc.l vm_filename
		dc.l v_offset
		dc.l v_fontinit
		dc.l v_escape2000
		dc.l v_output_window
		dc.l v_bit_image
		dc.l fix31ToPixel
		dc.l v_opnprn
		dc.l v_opnmeta
		dc.l vq_devinfo
		dc.l vq_ext_devinfo
		dc.l vs_calibrate
		dc.l vq_calibrate
		dc.l v_bez
		dc.l v_bez_on
		dc.l v_bez_off
		dc.l v_bez_qual
		dc.l v_bez_fill
		dc.l vqt_ext_name
		dc.l vqt_char_index
		dc.l vqt_isCharAvailable
		dc.l vqt_xfntinfo
		dc.l vst_name
		dc.l vqt_name_and_id
		dc.l vqt_fontheader
		dc.l vqt_trackkern
		dc.l vqt_pairkern
		dc.l vst_charmap
		dc.l vst_kern
		dc.l vst_kern_offset
		dc.l v_getbitmap_info
		dc.l vqt_f_extent
		dc.l vqt_real_extent
		dc.l v_ftext
		dc.l v_ftext_offset
		dc.l v_getoutline
		dc.l vst_arbpt32
		dc.l vqt_advance32
		dc.l vst_setsize32
		dc.l vst_skew
		dc.l v_orient
		dc.l v_trays
		dc.l vq_tray_names
		dc.l v_page_size
		dc.l vq_page_name
		dc.l vst_fg_color
		dc.l vsf_fg_color
		dc.l vsl_fg_color
		dc.l vsm_fg_color
		dc.l vsr_fg_color
		dc.l vst_bg_color
		dc.l vsf_bg_color
		dc.l vsl_bg_color
		dc.l vsm_bg_color
		dc.l vsr_bg_color
		dc.l vqt_fg_color
		dc.l vqf_fg_color
		dc.l vql_fg_color
		dc.l vqm_fg_color
		dc.l vqr_fg_color
		dc.l vqt_bg_color
		dc.l vqf_bg_color
		dc.l vql_bg_color
		dc.l vqm_bg_color
		dc.l vqr_bg_color
		dc.l v_color2value
		dc.l v_value2color
		dc.l v_color2nearest
		dc.l vq_px_format
		dc.l vs_ctab
		dc.l vs_ctab_entry
		dc.l vs_dflt_ctab
		dc.l vq_ctab
		dc.l vq_ctab_entry
		dc.l vq_ctab_id
		dc.l v_ctab_idx2vdi
		dc.l v_ctab_vdi2idx
		dc.l v_ctab_idx2value
		dc.l v_get_ctab_id
		dc.l vq_dflt_ctab
		dc.l v_create_itab
		dc.l v_delete_itab
		dc.l vr_transfer_bits
		dc.l vs_hilite_color
		dc.l vs_min_color
		dc.l vs_max_color
		dc.l vs_weight_color
		dc.l vq_hilite_color
		dc.l vq_min_color
		dc.l vq_max_color
		dc.l vq_weight_color
		dc.l vs_document_info
		dc.l vq_prn_scaling
		dc.l v_open_bm
		dc.l v_resize_bm
		dc.l v_get_outline
		dc.l vst_track_offset
		dc.l vst_arbpt
		dc.l vqt_advance
		dc.l vst_setsize
		dc.l vq_vgdos
		dc.l vst_width
		dc.l vst_scratch
		dc.l vst_error
		dc.l v_savecache
		dc.l v_loadcache
		dc.l v_flushcache
		dc.l vqt_cachesize
		dc.l vqt_get_table
		dc.l vs_curaddress
		dc.l vsf_perimeter3
		dc.l vqt_justified
		dc.l v_opnprnwrk
		dc.l v_opnmatrixprn
		dc.l v_set_app_buff
		dc.l vqt_devinfo
		dc.l v_create_ctab
		dc.l v_delete_ctab
		dc.l v_setrgb
funcVdi:
		dc.l func1Vdi
		dc.w $0000
funcAnzVdi:
		dc.w $0001
func1Aes:
		dc.l aes
		dc.l appl_init
		dc.l appl_read
		dc.l appl_write
		dc.l appl_find
		dc.l appl_search
		dc.l appl_tplay
		dc.l appl_trecord
		dc.l appl_yield
		dc.l appl_exit
		dc.l appl_getinfo
		dc.l appl_control
		dc.l evnt_keybd
		dc.l evnt_button
		dc.l evnt_mouse
		dc.l evnt_mesag
		dc.l evnt_timer
		dc.l evnt_event
		dc.l evnt_multi
		dc.l evnt_dclick
		dc.l menu_bar
		dc.l menu_icheck
		dc.l menu_ienable
		dc.l menu_tnormal
		dc.l menu_text
		dc.l menu_register
		dc.l menu_unregister
		dc.l menu_click
		dc.l menu_attach
		dc.l menu_istart
		dc.l menu_popup
		dc.l menu_settings
		dc.l objc_add
		dc.l objc_delete
		dc.l objc_draw
		dc.l objc_find
		dc.l objc_offset
		dc.l objc_order
		dc.l objc_edit
		dc.l objc_change
		dc.l objc_sysvar
		dc.l form_do
		dc.l form_dial
		dc.l form_alert
		dc.l form_error
		dc.l form_center
		dc.l form_keybd
		dc.l form_button
		dc.l graf_rubbox
		dc.l graf_rubberbox
		dc.l graf_dragbox
		dc.l graf_mbox
		dc.l graf_movebox
		dc.l graf_growbox
		dc.l graf_shrinkbox
		dc.l graf_watchbox
		dc.l graf_slidebox
		dc.l graf_handle
		dc.l graf_mouse
		dc.l graf_mkstate
		dc.l graf_multirubber
		dc.l scrp_read
		dc.l scrp_write
		dc.l fsel_input
		dc.l fsel_exinput
		dc.l fsel_boxinput
		dc.l fslx_open
		dc.l fslx_close
		dc.l fslx_getnxtfile
		dc.l fslx_evnt
		dc.l fslx_do
		dc.l fslx_set_flags
		dc.l wind_create
		dc.l wind_open
		dc.l wind_close
		dc.l wind_delete
		dc.l wind_get
		dc.l wind_getQSB
		dc.l wind_set
		dc.l wind_find
		dc.l wind_update
		dc.l wind_calc
		dc.l wind_new
		dc.l rsrc_load
		dc.l rsrc_free
		dc.l rsrc_gaddr
		dc.l rsrc_saddr
		dc.l rsrc_obfix
		dc.l rsrc_rcfix
		dc.l shel_read
		dc.l shel_write
		dc.l shel_get
		dc.l shel_put
		dc.l shel_find
		dc.l shel_envrn
		dc.l shel_help
		dc.l fnts_add
		dc.l fnts_close
		dc.l fnts_create
		dc.l fnts_delete
		dc.l fnts_do
		dc.l fnts_evnt
		dc.l fnts_get_info
		dc.l fnts_get_name
		dc.l fnts_get_no_styles
		dc.l fnts_get_style
		dc.l fnts_open
		dc.l fnts_remove
		dc.l fnts_update
		dc.l lbox_ascroll_to
		dc.l lbox_scroll_to
		dc.l lbox_bscroll_to
		dc.l lbox_cnt_items
		dc.l lbox_create
		dc.l lbox_delete
		dc.l lbox_do
		dc.l lbox_free_items
		dc.l lbox_free_list
		dc.l lbox_get_afirst
		dc.l lbox_get_first
		dc.l lbox_get_avis
		dc.l lbox_get_visible
		dc.l lbox_get_bentries
		dc.l lbox_get_bfirst
		dc.l lbox_get_idx
		dc.l lbox_get_item
		dc.l lbox_get_items
		dc.l lbox_get_slct_idx
		dc.l lbox_get_slct_item
		dc.l lbox_get_tree
		dc.l lbox_get_udata
		dc.l lbox_set_asldr
		dc.l lbox_set_slider
		dc.l lbox_set_bentries
		dc.l lbox_set_bsldr
		dc.l lbox_set_items
		dc.l lbox_update
		dc.l pdlg_add_printers
		dc.l pdlg_add_sub_dialogs
		dc.l pdlg_close
		dc.l pdlg_create
		dc.l pdlg_delete
		dc.l pdlg_dflt_settings
		dc.l pdlg_do
		dc.l pdlg_evnt
		dc.l pdlg_free_settings
		dc.l pdlg_get_setsize
		dc.l pdlg_new_settings
		dc.l pdlg_open
		dc.l pdlg_remove_printers
		dc.l pdlg_remove_sub_dialogs
		dc.l pdlg_update
		dc.l pdlg_use_settings
		dc.l pdlg_validate_settings
		dc.l edit_create
		dc.l edit_set_buf
		dc.l edit_open
		dc.l edit_close
		dc.l edit_delete
		dc.l edit_cursor
		dc.l edit_evnt
		dc.l edit_get_buf
		dc.l edit_get_format
		dc.l edit_get_colour
		dc.l edit_get_color
		dc.l edit_get_font
		dc.l edit_get_cursor
		dc.l edit_get_dirty
		dc.l edit_get_sel
		dc.l edit_get_scrollinfo
		dc.l edit_set_format
		dc.l edit_set_colour
		dc.l edit_set_colour
		dc.l edit_set_font
		dc.l edit_set_cursor
		dc.l edit_resized
		dc.l edit_set_dirty
		dc.l edit_scroll
		dc.l EvntMulti
		dc.l form_wbutton
		dc.l form_xdial
		dc.l form_xdo
		dc.l form_xerr
		dc.l _crystal
		dc.l graf_wwatchbox
		dc.l graf_xhandle
		dc.l wdlg_create
		dc.l wdlg_open
		dc.l wdlg_close
		dc.l wdlg_delete
		dc.l wdlg_get_tree
		dc.l wdlg_get_edit
		dc.l wdlg_get_udata
		dc.l wdlg_get_handle
		dc.l wdlg_set_edit
		dc.l wdlg_set_tree
		dc.l wdlg_set_size
		dc.l wdlg_set_iconify
		dc.l wdlg_set_uniconify
		dc.l wdlg_evnt
		dc.l wdlg_redraw
		dc.l wind_draw
		dc.l scrp_clear
		dc.l objc_xedit
		dc.l graf_rubbbox
funcAes:
		dc.l func1Aes
		dc.w $0000
funcAnzAes:
		dc.w $0001
func1MtAes:
		dc.l mt_appl_init
		dc.l mt_appl_read
		dc.l mt_appl_write
		dc.l mt_appl_find
		dc.l mt_appl_search
		dc.l mt_appl_tplay
		dc.l mt_appl_trecord
		dc.l mt_appl_yield
		dc.l mt_appl_exit
		dc.l mt_appl_getinfo
		dc.l mt_appl_control
		dc.l mt_evnt_keybd
		dc.l mt_evnt_button
		dc.l mt_evnt_mouse
		dc.l mt_evnt_mesag
		dc.l mt_evnt_timer
		dc.l mt_evnt_event
		dc.l mt_evnt_multi
		dc.l mt_evnt_dclick
		dc.l mt_menu_bar
		dc.l mt_menu_icheck
		dc.l mt_menu_ienable
		dc.l mt_menu_tnormal
		dc.l mt_menu_text
		dc.l mt_menu_register
		dc.l mt_menu_unregister
		dc.l mt_menu_click
		dc.l mt_menu_attach
		dc.l mt_menu_istart
		dc.l mt_menu_popup
		dc.l mt_menu_settings
		dc.l mt_objc_add
		dc.l mt_objc_delete
		dc.l mt_objc_draw
		dc.l mt_objc_find
		dc.l mt_objc_offset
		dc.l mt_objc_order
		dc.l mt_objc_edit
		dc.l mt_objc_change
		dc.l mt_objc_sysvar
		dc.l mt_form_do
		dc.l mt_form_dial
		dc.l mt_form_alert
		dc.l mt_form_error
		dc.l mt_form_center
		dc.l mt_form_keybd
		dc.l mt_form_button
		dc.l mt_graf_rubbox
		dc.l mt_graf_rubberbox
		dc.l mt_graf_dragbox
		dc.l mt_graf_mbox
		dc.l mt_graf_movebox
		dc.l mt_graf_growbox
		dc.l mt_graf_shrinkbox
		dc.l mt_graf_watchbox
		dc.l mt_graf_slidebox
		dc.l mt_graf_handle
		dc.l mt_graf_mouse
		dc.l mt_graf_mkstate
		dc.l mt_graf_multirubber
		dc.l mt_scrp_read
		dc.l mt_scrp_write
		dc.l mt_fsel_input
		dc.l mt_fsel_exinput
		dc.l mt_fsel_boxinput
		dc.l mt_fslx_open
		dc.l mt_fslx_close
		dc.l mt_fslx_getnxtfile
		dc.l mt_fslx_evnt
		dc.l mt_fslx_do
		dc.l mt_fslx_set_flags
		dc.l mt_wind_create
		dc.l mt_wind_open
		dc.l mt_wind_close
		dc.l mt_wind_delete
		dc.l mt_wind_get
		dc.l mt_wind_getQSB
		dc.l mt_wind_set
		dc.l mt_wind_find
		dc.l mt_wind_update
		dc.l mt_wind_calc
		dc.l mt_wind_new
		dc.l mt_rsrc_load
		dc.l mt_rsrc_free
		dc.l mt_rsrc_gaddr
		dc.l mt_rsrc_saddr
		dc.l mt_rsrc_obfix
		dc.l mt_rsrc_rcfix
		dc.l mt_shel_read
		dc.l mt_shel_write
		dc.l mt_shel_get
		dc.l mt_shel_put
		dc.l mt_shel_find
		dc.l mt_shel_envrn
		dc.l mt_shel_help
		dc.l mt_fnts_add
		dc.l mt_fnts_close
		dc.l mt_fnts_create
		dc.l mt_fnts_delete
		dc.l mt_fnts_do
		dc.l mt_fnts_evnt
		dc.l mt_fnts_get_info
		dc.l mt_fnts_get_name
		dc.l mt_fnts_get_no_styles
		dc.l mt_fnts_get_style
		dc.l mt_fnts_open
		dc.l mt_fnts_remove
		dc.l mt_fnts_update
		dc.l mt_lbox_ascroll_to
		dc.l mt_lbox_scroll_to
		dc.l mt_lbox_bscroll_to
		dc.l mt_lbox_cnt_items
		dc.l mt_lbox_create
		dc.l mt_lbox_delete
		dc.l mt_lbox_do
		dc.l mt_lbox_free_items
		dc.l mt_lbox_free_list
		dc.l mt_lbox_get_afirst
		dc.l mt_lbox_get_first
		dc.l mt_lbox_get_avis
		dc.l mt_lbox_get_visible
		dc.l mt_lbox_get_bentries
		dc.l mt_lbox_get_bfirst
		dc.l mt_lbox_get_idx
		dc.l mt_lbox_get_item
		dc.l mt_lbox_get_items
		dc.l mt_lbox_get_slct_idx
		dc.l mt_lbox_get_slct_item
		dc.l mt_lbox_get_tree
		dc.l mt_lbox_get_udata
		dc.l mt_lbox_set_asldr
		dc.l mt_lbox_set_slider
		dc.l mt_lbox_set_bentries
		dc.l mt_lbox_set_bsldr
		dc.l mt_lbox_set_items
		dc.l mt_lbox_update
		dc.l mt_pdlg_add_printers
		dc.l mt_pdlg_add_sub_dialogs
		dc.l mt_pdlg_close
		dc.l mt_pdlg_create
		dc.l mt_pdlg_delete
		dc.l mt_pdlg_dflt_settings
		dc.l mt_pdlg_do
		dc.l mt_pdlg_evnt
		dc.l mt_pdlg_free_settings
		dc.l mt_pdlg_get_setsize
		dc.l mt_pdlg_new_settings
		dc.l mt_pdlg_open
		dc.l mt_pdlg_remove_printers
		dc.l mt_pdlg_remove_sub_dialogs
		dc.l mt_pdlg_update
		dc.l mt_pdlg_use_settings
		dc.l mt_pdlg_validate_settings
		dc.l mt_edit_create
		dc.l mt_edit_set_buf
		dc.l mt_edit_open
		dc.l mt_edit_close
		dc.l mt_edit_delete
		dc.l mt_edit_cursor
		dc.l mt_edit_evnt
		dc.l mt_edit_get_buf
		dc.l mt_edit_get_format
		dc.l mt_edit_get_colour
		dc.l mt_edit_get_color
		dc.l mt_edit_get_font
		dc.l mt_edit_get_cursor
		dc.l mt_edit_get_dirty
		dc.l mt_edit_get_sel
		dc.l mt_edit_get_scrollinfo
		dc.l mt_edit_set_format
		dc.l mt_edit_set_colour
		dc.l mt_edit_set_colour
		dc.l mt_edit_set_font
		dc.l mt_edit_set_cursor
		dc.l mt_edit_resized
		dc.l mt_edit_set_dirty
		dc.l mt_edit_scroll
		dc.l mt_EvntMulti
		dc.l mt_form_wbutton
		dc.l mt_form_xdial
		dc.l mt_form_xdo
		dc.l mt_form_xerr
		dc.l mt_graf_wwatchbox
		dc.l mt_graf_xhandle
		dc.l mt_wdlg_create
		dc.l mt_wdlg_open
		dc.l mt_wdlg_close
		dc.l mt_wdlg_delete
		dc.l mt_wdlg_get_tree
		dc.l mt_wdlg_get_edit
		dc.l mt_wdlg_get_udata
		dc.l mt_wdlg_get_handle
		dc.l mt_wdlg_set_edit
		dc.l mt_wdlg_set_tree
		dc.l mt_wdlg_set_size
		dc.l mt_wdlg_set_iconify
		dc.l mt_wdlg_set_uniconify
		dc.l mt_wdlg_evnt
		dc.l mt_wdlg_redraw
		dc.l mt_wind_draw
		dc.l mt_scrp_clear
		dc.l mt_objc_xedit
		dc.l mt_graf_rubbbox
funcMtAes:
		dc.l func1MtAes
		dc.w $0000
funcAnzMtAes:
		dc.w $0001
func1Keytab:
		dc.l Akt_getKeyTab
		dc.l Akt_getRelease
		dc.l Akt_getEuro
		dc.l Akt_getExpMaxNr
		dc.l Akt_getImpMaxNr
		dc.l Akt_getExpNameFromNr
		dc.l Akt_getImpNameFromNr
		dc.l Akt_getExpShortNameFromNr
		dc.l Akt_getImpShortNameFromNr
		dc.l Akt_getExpNrFromId
		dc.l Akt_getImpNrFromId
		dc.l Akt_getExpIdFromNr
		dc.l Akt_getImpIdFromNr
		dc.l Akt_getExpNrFromName
		dc.l Akt_getImpNrFromName
		dc.l Akt_CharAtari2X
		dc.l Akt_CharX2Atari
		dc.l Akt_BlockAtari2X
		dc.l Akt_BlockX2Atari
		dc.l Akt_StringAtari2X
		dc.l Akt_StringX2Atari
		dc.l Akt_CharX2Unicode
		dc.l Akt_CharUnicode2X
		dc.l Akt_BlockX2Unicode
		dc.l Akt_BlockUnicode2X
		dc.l Akt_StringX2Unicode
		dc.l Akt_popExpName
		dc.l Akt_popImpName
		dc.l Akt_chooseExpNr
		dc.l Akt_chooseImpNr
		dc.l Akt_getExpMinNr
		dc.l Akt_getImpMinNr
		dc.l Akt_BlockXUtf2Unicode
		dc.l Akt_BlockUnicode2XUtf
		dc.l Akt_StringXUtf2Unicode
		dc.l Akt_BlockXUtf2U2XUtf
		dc.l Akt_BlockXUtf2XUtf
		dc.l Akt_StringXUtf2U2XUtf
		dc.l Akt_StringXUtf2XUtf
funcKeytab:
		dc.l func1Keytab
		dc.w $0000
funcAnzKeytab:
		dc.w $0001
	.globl funcs
funcs:
		dc.l funcAbp
		dc.l funcAnzAbp
		dc.l funcAcfg
		dc.l funcAnzAcfg
		dc.l funcAch
		dc.l funcAnzAch
		dc.l funcAdr
		dc.l funcAnzAdr
		dc.l funcAev
		dc.l funcAnzAev
		dc.l funcAf
		dc.l funcAnzAf
		dc.l funcAic
		dc.l funcAnzAic
		dc.l funcAim
		dc.l funcAnzAim
		dc.l funcAlu
		dc.l funcAnzAlu
		dc.l funcAme
		dc.l funcAnzAme
		dc.l funcAmo
		dc.l funcAnzAmo
		dc.l funcAob
		dc.l funcAnzAob
		dc.l funcAscrp
		dc.l funcAnzAscrp
		dc.l funcAsh
		dc.l funcAnzAsh
		dc.l funcAst
		dc.l funcAnzAst
		dc.l funcAte
		dc.l funcAnzAte
		dc.l funcAuo
		dc.l funcAnzAuo
		dc.l funcAus
		dc.l funcAnzAus
		dc.l funcAwi
		dc.l funcAnzAwi
		dc.l funcA
		dc.l funcAnzA
		dc.l funcSonst
		dc.l funcAnzSonst
		dc.l funcVdi
		dc.l funcAnzVdi
		dc.l funcAes
		dc.l funcAnzAes
		dc.l funcKeytab
		dc.l funcAnzKeytab
		dc.l funcMtAes
		dc.l funcAnzMtAes
	.globl funcsAnz
funcsAnz:
		dc.w $0000
		dc.w $0019
	.globl ACS233
ACS233:
		dc.l Awi_wid
		dc.l Awi_root
		dc.l Awi_list
		dc.l Awi_sendall
		dc.l Awi_down
		dc.l Awi_up
		dc.l Awi_show
		dc.l Awi_init
		dc.l Awi_create23x
		dc.l Awi_open
		dc.l Awi_closed
		dc.l Awi_delete
		dc.l Awi_topped
		dc.l Awi_fulled
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_diaend
		dc.l Awi_diastart
		dc.l Awi_keys
		dc.l Awi_obview
		dc.l Awi_service
		dc.l Awi_scroll
		dc.l Awi_obchange
		dc.l Awi_obredraw
		dc.l Awi_redraw
		dc.l Awi_arrowed23x
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Af_cfgfile
		dc.l Aev_quit
		dc.l Aev_mess
		dc.l Aev_unhidepointer
		dc.l Amo_new
		dc.l Amo_busy
		dc.l Amo_unbusy
		dc.l Amo_hide
		dc.l Amo_show
		dc.l Aob_create23x
		dc.l Aob_delete
		dc.l Aob_fix
		dc.l Aob_offset
		dc.l Aob_save
		dc.l Aob_restore
		dc.l Aob_watch
		dc.l Aob_findflag
		dc.l Aob_up
		dc.l Ame_namefix
		dc.l Ame_popup
		dc.l Abp_create
		dc.l Abp_delete
		dc.l Abp_start
		dc.l Abp_end
		dc.l Adr_box
		dc.l Adr_drag
		dc.l Adr_next
		dc.l Adr_add
		dc.l Adr_del
		dc.l Adr_unselect
		dc.l Ast_create
		dc.l Ast_delete
		dc.l Aic_create
		dc.l Aic_delete
		dc.l Aim_create
		dc.l Aim_delete
		dc.l Aus_create23x
		dc.l Aus_delete
		dc.l Ate_create
		dc.l Ate_delete
		dc.l Ax_malloc
		dc.l Ax_free
		dc.l Ax_ifree
		dc.l Ax_mterm
		dc.l Awi_nokey
		dc.l Aob_alias
		dc.l A_dialog
		dc.l alert_str
		dc.l intersect
		dc.l A_checkbox
		dc.l A_radiobutton
		dc.l A_innerframe
		dc.l A_pattern
		dc.l A_arrows
		dc.l Adr_start
		dc.l A_select
		dc.l Ash_prog
		dc.l Af_select
		dc.l A_ftext
		dc.l A_title
		dc.l A_3Dbutton
		dc.l A_cycle
		dc.l A_picture
		dc.l Auo_ftext
		dc.l Auo_string
		dc.l Auo_cycle
		dc.l Aus_cycle
		dc.l Auo_picture
		dc.l A_dialog2
		dc.l Aob_icon
		dc.l Awi_modal
		dc.l Awi_dialog
		dc.l Awi_alert
		dc.l Awi_selfcreate
		dc.l Aev_release
		dc.l Aob_puttext
		dc.l Aob_gettext
		dc.l Aob_within
		dc.l xywh2array
		dc.l array2xywh
		dc.l dotted_xline
		dc.l dotted_yline
		dc.l Ash_error
		dc.l Ash_getc
		dc.l nkc_tos2
		dc.l nkc_gem2n
		dc.l nkc_n2to
		dc.l nkc_n2gem
		dc.l nkc_kstate
		dc.l nkc_cmp
		dc.l Abp_mfdb2img
		dc.l Abp_img2mfdb
		dc.l Aob_printf
		dc.l Aob_scanf
		dc.l Af_2drv
		dc.l Af_2path
		dc.l Af_2name
		dc.l Af_2fullname
		dc.l Af_2ext
		dc.l Af_buildname
		dc.l Af_length
		dc.l Ascrp_clear
		dc.l Ascrp_get
		dc.l Ascrp_put
		dc.l Ash_getenv
		dc.l Ash_nextdd
		dc.l Ash_sendall
		dc.l Af_first_fsel
		dc.l Af_next_fsel
		dc.l nkc_tolo
		dc.l nkc_toup
		dc.l Awi_update
		dc.l A_boxed
		dc.l Auo_boxed
		dc.l Aus_boxed
		dc.l Awi_uoself
		dc.l Af_first
		dc.l Af_next
		dc.l Af_readdir
		dc.l Af_freedir
		dc.l Alu_create
		dc.l Alu_delete
		dc.l Acfg_create
		dc.l Acfg_delete
		dc.l Acfg_clear
		dc.l Acfg_clearGroup
		dc.l Acfg_load
		dc.l Acfg_save
		dc.l Acfg_isChanged
		dc.l Acfg_getValue
		dc.l Acfg_setValue
		dc.l Acfg_clearValue
		dc.l Acfg_clearHeader
		dc.l Acfg_headAnzahl
		dc.l Acfg_setHeader
		dc.l Acfg_getHeader
		dc.l Acfg_grpAnzahl
		dc.l Acfg_grpName
		dc.l Acfg_strAnzahl
		dc.l Acfg_strName
		dc.l Acfg_isCfgfile
		dc.l Acfg_createInfo
		dc.l Acfg_deleteInfo
		dc.l Acfg_setInfo
		dc.l Acfg_getInfo
		dc.l Acfg_copyInfo
		dc.l Ach_tolower
		dc.l Ach_toupper
		dc.l Ach_isWhite
		dc.l Ast_tolower
		dc.l Ast_toupper
		dc.l Ast_ltrim
		dc.l Ast_rtrim
		dc.l Ast_alltrim
		dc.l Ast_cmp
		dc.l Ast_icmp
		dc.l Ast_isEmpty
		dc.l Ast_add
		dc.l Ast_adl
		dc.l Ast_adr
		dc.l Ast_adc
		dc.l Ast_filter
		dc.l Ast_count
		dc.l Ast_fcmp
		dc.l Awi_doform
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
	.globl ACS230
ACS230:
		dc.l Awi_wid
		dc.l Awi_root
		dc.l Awi_list
		dc.l Awi_sendall
		dc.l Awi_down
		dc.l Awi_up
		dc.l Awi_show
		dc.l Awi_init
		dc.l Awi_create23x
		dc.l Awi_open
		dc.l Awi_closed
		dc.l Awi_delete
		dc.l Awi_topped
		dc.l Awi_fulled
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_diaend
		dc.l Awi_diastart
		dc.l Awi_keys
		dc.l Awi_obview
		dc.l Awi_service
		dc.l Awi_scroll
		dc.l Awi_obchange
		dc.l Awi_obredraw
		dc.l Awi_redraw
		dc.l Awi_arrowed23x
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Af_cfgfile
		dc.l Aev_quit
		dc.l Aev_mess
		dc.l Aev_unhidepointer
		dc.l Amo_new
		dc.l Amo_busy
		dc.l Amo_unbusy
		dc.l Amo_hide
		dc.l Amo_show
		dc.l Aob_create23x
		dc.l Aob_delete
		dc.l Aob_fix
		dc.l Aob_offset
		dc.l Aob_save
		dc.l Aob_restore
		dc.l Aob_watch
		dc.l Aob_findflag
		dc.l Aob_up
		dc.l Ame_namefix
		dc.l Ame_popup
		dc.l Abp_create
		dc.l Abp_delete
		dc.l Abp_start
		dc.l Abp_end
		dc.l Adr_box
		dc.l Adr_drag
		dc.l Adr_next
		dc.l Adr_add
		dc.l Adr_del
		dc.l Adr_unselect
		dc.l Ast_create
		dc.l Ast_delete
		dc.l Aic_create
		dc.l Aic_delete
		dc.l Aim_create
		dc.l Aim_delete
		dc.l Aus_create23x
		dc.l Aus_delete
		dc.l Ate_create
		dc.l Ate_delete
		dc.l Ax_malloc
		dc.l Ax_free
		dc.l Ax_ifree
		dc.l Ax_mterm
		dc.l Awi_nokey
		dc.l Aob_alias
		dc.l A_dialog
		dc.l alert_str
		dc.l intersect
		dc.l A_checkbox
		dc.l A_radiobutton
		dc.l A_innerframe
		dc.l A_pattern
		dc.l A_arrows
		dc.l Adr_start
		dc.l A_select
		dc.l Ash_prog
		dc.l Af_select
		dc.l A_ftext
		dc.l A_title
		dc.l A_3Dbutton
		dc.l A_cycle
		dc.l A_picture
		dc.l Auo_ftext
		dc.l Auo_string
		dc.l Auo_cycle
		dc.l Aus_cycle
		dc.l Auo_picture
		dc.l A_dialog2
		dc.l Aob_icon
		dc.l Awi_modal
		dc.l Awi_dialog
		dc.l Awi_alert
		dc.l Awi_selfcreate
		dc.l Aev_release
		dc.l Aob_puttext
		dc.l Aob_gettext
		dc.l Aob_within
		dc.l xywh2array
		dc.l array2xywh
		dc.l dotted_xline
		dc.l dotted_yline
		dc.l Ash_error
		dc.l Ash_getc
		dc.l nkc_tos2
		dc.l nkc_gem2n
		dc.l nkc_n2to
		dc.l nkc_n2gem
		dc.l nkc_kstate
		dc.l nkc_cmp
		dc.l Abp_mfdb2img
		dc.l Abp_img2mfdb
		dc.l Aob_printf
		dc.l Aob_scanf
		dc.l Af_2drv
		dc.l Af_2path
		dc.l Af_2name
		dc.l Af_2fullname
		dc.l Af_2ext
		dc.l Af_buildname
		dc.l Af_length
		dc.l Ascrp_clear
		dc.l Ascrp_get
		dc.l Ascrp_put
		dc.l Ash_getenv
		dc.l Ash_nextdd
		dc.l Ash_sendall
		dc.l Af_first_fsel
		dc.l Af_next_fsel
		dc.l nkc_tolo
		dc.l nkc_toup
		dc.l Awi_update
		dc.l A_boxed
		dc.l Auo_boxed
		dc.l Aus_boxed
		dc.l Awi_uoself
		dc.l Af_first230
		dc.l Af_next230
		dc.l Af_readdir
		dc.l Af_freedir
		dc.l Alu_create
		dc.l Alu_delete
		dc.l Acfg_create
		dc.l Acfg_delete
		dc.l Acfg_clear
		dc.l Acfg_clearGroup
		dc.l Acfg_load
		dc.l Acfg_save
		dc.l Acfg_isChanged
		dc.l Acfg_getValue
		dc.l Acfg_setValue
		dc.l Acfg_clearValue
		dc.l Acfg_clearHeader
		dc.l Acfg_headAnzahl
		dc.l Acfg_setHeader
		dc.l Acfg_getHeader
		dc.l Acfg_grpAnzahl
		dc.l Acfg_grpName
		dc.l Acfg_strAnzahl
		dc.l Acfg_strName
		dc.l Acfg_isCfgfile
		dc.l Acfg_createInfo
		dc.l Acfg_deleteInfo
		dc.l Acfg_setInfo
		dc.l Acfg_getInfo
		dc.l Acfg_copyInfo
		dc.l Ach_tolower
		dc.l Ach_toupper
		dc.l Ach_isWhite
		dc.l Ast_tolower
		dc.l Ast_toupper
		dc.l Ast_ltrim
		dc.l Ast_rtrim
		dc.l Ast_alltrim
		dc.l Ast_cmp
		dc.l Ast_icmp
		dc.l Ast_isEmpty
		dc.l Ast_add
		dc.l Ast_adl
		dc.l Ast_adr
		dc.l Ast_adc
		dc.l Ast_filter
		dc.l Ast_count
		dc.l Ast_fcmp
		dc.l Awi_doform
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
		dc.l noop
