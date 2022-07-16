/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Startup code for modules                              */
/*                      (old version for ACS 2.30)                            */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

	.globl ACSblk
	.xref ACSinit

	.text

/*
 * ACSmod header structure
 */
compiler:
	dc.l       0x41435336    /* magic1 */
init_modul:
	dc.l       ACSinit       /* entry */
ACSblk:
	dc.l       0             /* filled in by loader */
funcs:
	dc.l       0             /* filled in by loader */
aess:        dc.l 0
vdis:        dc.l 0

/*
 * jump indirectly to function from application.
 * This must not modify any registers.
 */
indirect:
	move.l     a0,-(a7)   /* save A0 */
	movea.l    funcs,a0   /* get function table ptr */
	adda.l     4(a7),a0   /* add offset */
	move.l     (a0),4(a7) /* put entry pointer on stack */
	movea.l    (a7)+,a0   /* restore a0 */
	rts                   /* jump to entry */


/*
 * function table
 */
		.globl Awi_wid
Awi_wid:
		move.l #0,-(a7)
		bra    indirect
		.globl Awi_root
Awi_root:
		move.l #4,-(a7)
		bra    indirect
		.globl Awi_list
Awi_list:
		move.l #8,-(a7)
		bra    indirect
		.globl Awi_sendall
Awi_sendall:
		move.l #12,-(a7)
		bra    indirect
		.globl Awi_down
Awi_down:
		move.l #16,-(a7)
		bra    indirect
		.globl Awi_up
Awi_up:
		move.l #20,-(a7)
		bra    indirect
		.globl Awi_show
Awi_show:
		move.l #24,-(a7)
		bra    indirect
		.globl Awi_init
Awi_init:
		move.l #28,-(a7)
		bra    indirect
		.globl Awi_create
Awi_create:
		move.l #32,-(a7)
		bra    indirect
		.globl Awi_open
Awi_open:
		move.l #36,-(a7)
		bra    indirect
		.globl Awi_closed
Awi_closed:
		move.l #40,-(a7)
		bra    indirect
		.globl Awi_delete
Awi_delete:
		move.l #44,-(a7)
		bra    indirect
		.globl Awi_topped
Awi_topped:
		move.l #48,-(a7)
		bra    indirect
		.globl Awi_fulled
Awi_fulled:
		move.l #52,-(a7)
		bra    indirect
		.globl Awi_sized
Awi_sized:
		move.l #56,-(a7)
		bra    indirect
		.globl Awi_moved
Awi_moved:
		move.l #60,-(a7)
		bra    indirect
		.globl Awi_diaend
Awi_diaend:
		move.l #64,-(a7)
		bra    indirect
		.globl Awi_diastart
Awi_diastart:
		move.l #68,-(a7)
		bra    indirect
		.globl Awi_keys
Awi_keys:
		move.l #72,-(a7)
		bra    indirect
		.globl Awi_obview
Awi_obview:
		move.l #76,-(a7)
		bra    indirect
		.globl Awi_service
Awi_service:
		move.l #80,-(a7)
		bra    indirect
		.globl Awi_scroll
Awi_scroll:
		move.l #84,-(a7)
		bra    indirect
		.globl Awi_obchange
Awi_obchange:
		move.l #88,-(a7)
		bra    indirect
		.globl Awi_obredraw
Awi_obredraw:
		move.l #92,-(a7)
		bra    indirect
		.globl Awi_redraw
Awi_redraw:
		move.l #96,-(a7)
		bra    indirect
		.globl Awi_arrowed
Awi_arrowed:
		move.l #100,-(a7)
		bra    indirect
		.globl Awi_hslid
Awi_hslid:
		move.l #104,-(a7)
		bra    indirect
		.globl Awi_vslid
Awi_vslid:
		move.l #108,-(a7)
		bra    indirect
		.globl Af_cfgfile
Af_cfgfile:
		move.l #112,-(a7)
		bra    indirect
		.globl Aev_quit
Aev_quit:
		move.l #116,-(a7)
		bra    indirect
		.globl Aev_mess
Aev_mess:
		move.l #120,-(a7)
		bra    indirect
		.globl Aev_unhidepointer
Aev_unhidepointer:
		move.l #124,-(a7)
		bra    indirect
		.globl Amo_new
Amo_new:
		move.l #128,-(a7)
		bra    indirect
		.globl Amo_busy
Amo_busy:
		move.l #132,-(a7)
		bra    indirect
		.globl Amo_unbusy
Amo_unbusy:
		move.l #136,-(a7)
		bra    indirect
		.globl Amo_hide
Amo_hide:
		move.l #140,-(a7)
		bra    indirect
		.globl Amo_show
Amo_show:
		move.l #144,-(a7)
		bra    indirect
		.globl Aob_create
Aob_create:
		move.l #148,-(a7)
		bra    indirect
		.globl Aob_delete
Aob_delete:
		move.l #152,-(a7)
		bra    indirect
		.globl Aob_fix
Aob_fix:
		move.l #156,-(a7)
		bra    indirect
		.globl Aob_offset
Aob_offset:
		move.l #160,-(a7)
		bra    indirect
		.globl Aob_save
Aob_save:
		move.l #164,-(a7)
		bra    indirect
		.globl Aob_restore
Aob_restore:
		move.l #168,-(a7)
		bra    indirect
		.globl Aob_watch
Aob_watch:
		move.l #172,-(a7)
		bra    indirect
		.globl Aob_findflag
Aob_findflag:
		move.l #176,-(a7)
		bra    indirect
		.globl Aob_up
Aob_up:
		move.l #180,-(a7)
		bra    indirect
		.globl Ame_namefix
Ame_namefix:
		move.l #184,-(a7)
		bra    indirect
		.globl Ame_popup
Ame_popup:
		move.l #188,-(a7)
		bra    indirect
		.globl Abp_create
Abp_create:
		move.l #192,-(a7)
		bra    indirect
		.globl Abp_delete
Abp_delete:
		move.l #196,-(a7)
		bra    indirect
		.globl Abp_start
Abp_start:
		move.l #200,-(a7)
		bra    indirect
		.globl Abp_end
Abp_end:
		move.l #204,-(a7)
		bra    indirect
		.globl Adr_box
Adr_box:
		move.l #208,-(a7)
		bra    indirect
		.globl Adr_drag
Adr_drag:
		move.l #212,-(a7)
		bra    indirect
		.globl Adr_next
Adr_next:
		move.l #216,-(a7)
		bra    indirect
		.globl Adr_add
Adr_add:
		move.l #220,-(a7)
		bra    indirect
		.globl Adr_del
Adr_del:
		move.l #224,-(a7)
		bra    indirect
		.globl Adr_unselect
Adr_unselect:
		move.l #228,-(a7)
		bra    indirect
		.globl Ast_create
Ast_create:
		move.l #232,-(a7)
		bra    indirect
		.globl Ast_delete
Ast_delete:
		move.l #236,-(a7)
		bra    indirect
		.globl Aic_create
Aic_create:
		move.l #240,-(a7)
		bra    indirect
		.globl Aic_delete
Aic_delete:
		move.l #244,-(a7)
		bra    indirect
		.globl Aim_create
Aim_create:
		move.l #248,-(a7)
		bra    indirect
		.globl Aim_delete
Aim_delete:
		move.l #252,-(a7)
		bra    indirect
		.globl Aus_create
Aus_create:
		move.l #256,-(a7)
		bra    indirect
		.globl Aus_delete
Aus_delete:
		move.l #260,-(a7)
		bra    indirect
		.globl Ate_create
Ate_create:
		move.l #264,-(a7)
		bra    indirect
		.globl Ate_delete
Ate_delete:
		move.l #268,-(a7)
		bra    indirect
		.globl Ax_malloc
Ax_malloc:
		move.l #272,-(a7)
		bra    indirect
		.globl Ax_free
Ax_free:
		move.l #276,-(a7)
		bra    indirect
		.globl Ax_ifree
Ax_ifree:
		move.l #280,-(a7)
		bra    indirect

/*
 * ACSmoduleterm is different, because we need
 * to pass the BASEPAGE pointer to Ax_mterm()
 */
		.globl ACSmoduleterm
ACSmoduleterm:
		movea.l    #compiler-256,a0
		move.l     funcs,a1
		add.l      #284,a1  /* Ax_mterm */
		move.l     (a1),a1
		jmp        (a1)

		.globl Awi_nokey
Awi_nokey:
		move.l #288,-(a7)
		bra    indirect
		.globl Aob_alias
Aob_alias:
		move.l #292,-(a7)
		bra    indirect
		.globl A_dialog
A_dialog:
		move.l #296,-(a7)
		bra    indirect
		.globl alert_str
alert_str:
		move.l #300,-(a7)
		bra    indirect
		.globl intersect
intersect:
		move.l #304,-(a7)
		bra    indirect
		.globl A_checkbox
A_checkbox:
		move.l #308,-(a7)
		bra    indirect
		.globl A_radiobutton
A_radiobutton:
		move.l #312,-(a7)
		bra    indirect
		.globl A_innerframe
A_innerframe:
		move.l #316,-(a7)
		bra    indirect
		.globl A_pattern
A_pattern:
		move.l #320,-(a7)
		bra    indirect
		.globl A_arrows
A_arrows:
		move.l #324,-(a7)
		bra    indirect
		.globl Adr_start
Adr_start:
		move.l #328,-(a7)
		bra    indirect
		.globl A_select
A_select:
		move.l #332,-(a7)
		bra    indirect
		.globl Ash_prog
Ash_prog:
		move.l #336,-(a7)
		bra    indirect
		.globl Af_select
Af_select:
		move.l #340,-(a7)
		bra    indirect
		.globl A_ftext
A_ftext:
		move.l #344,-(a7)
		bra    indirect
		.globl A_title
A_title:
		move.l #348,-(a7)
		bra    indirect
		.globl A_3Dbutton
A_3Dbutton:
		move.l #352,-(a7)
		bra    indirect
		.globl A_cycle
A_cycle:
		move.l #356,-(a7)
		bra    indirect
		.globl A_picture
A_picture:
		move.l #360,-(a7)
		bra    indirect
		.globl Auo_ftext
Auo_ftext:
		move.l #364,-(a7)
		bra    indirect
		.globl Auo_string
Auo_string:
		move.l #368,-(a7)
		bra    indirect
		.globl Auo_cycle
Auo_cycle:
		move.l #372,-(a7)
		bra    indirect
		.globl Aus_cycle
Aus_cycle:
		move.l #376,-(a7)
		bra    indirect
		.globl Auo_picture
Auo_picture:
		move.l #380,-(a7)
		bra    indirect
		.globl A_dialog2
A_dialog2:
		move.l #384,-(a7)
		bra    indirect
		.globl Aob_icon
Aob_icon:
		move.l #388,-(a7)
		bra    indirect
		.globl Awi_modal
Awi_modal:
		move.l #392,-(a7)
		bra    indirect
		.globl Awi_dialog
Awi_dialog:
		move.l #396,-(a7)
		bra    indirect
		.globl Awi_alert
Awi_alert:
		move.l #400,-(a7)
		bra    indirect
		.globl Awi_selfcreate
Awi_selfcreate:
		move.l #404,-(a7)
		bra    indirect
		.globl Aev_release
Aev_release:
		move.l #408,-(a7)
		bra    indirect
		.globl Aob_puttext
Aob_puttext:
		move.l #412,-(a7)
		bra    indirect
		.globl Aob_gettext
Aob_gettext:
		move.l #416,-(a7)
		bra    indirect
		.globl Aob_within
Aob_within:
		move.l #420,-(a7)
		bra    indirect
		.globl xywh2array
xywh2array:
		move.l #424,-(a7)
		bra    indirect
		.globl array2xywh
array2xywh:
		move.l #428,-(a7)
		bra    indirect
		.globl dotted_xline
dotted_xline:
		move.l #432,-(a7)
		bra    indirect
		.globl dotted_yline
dotted_yline:
		move.l #436,-(a7)
		bra    indirect
		.globl Ash_error
Ash_error:
		move.l #440,-(a7)
		bra    indirect
		.globl Ash_getcookie
Ash_getcookie:
		move.l #444,-(a7)
		bra    indirect
		.globl nkc_tos2n
nkc_tos2n:
		move.l #448,-(a7)
		bra    indirect
		.globl nkc_gem2n
nkc_gem2n:
		move.l #452,-(a7)
		bra    indirect
		.globl nkc_n2tos
nkc_n2tos:
		move.l #456,-(a7)
		bra    indirect
		.globl nkc_n2gem
nkc_n2gem:
		move.l #460,-(a7)
		bra    indirect
		.globl nkc_kstate
nkc_kstate:
		move.l #464,-(a7)
		bra    indirect
		.globl nkc_cmp
nkc_cmp:
		move.l #468,-(a7)
		bra    indirect
		.globl Abp_mfdb2img
Abp_mfdb2img:
		move.l #472,-(a7)
		bra    indirect
		.globl Abp_img2mfdb
Abp_img2mfdb:
		move.l #476,-(a7)
		bra    indirect
		.globl Aob_printf
Aob_printf:
		move.l #480,-(a7)
		bra    indirect
		.globl Aob_scanf
Aob_scanf:
		move.l #484,-(a7)
		bra    indirect
		.globl Af_2drv
Af_2drv:
		move.l #488,-(a7)
		bra    indirect
		.globl Af_2path
Af_2path:
		move.l #492,-(a7)
		bra    indirect
		.globl Af_2name
Af_2name:
		move.l #496,-(a7)
		bra    indirect
		.globl Af_2fullname
Af_2fullname:
		move.l #500,-(a7)
		bra    indirect
		.globl Af_2ext
Af_2ext:
		move.l #504,-(a7)
		bra    indirect
		.globl Af_buildname
Af_buildname:
		move.l #508,-(a7)
		bra    indirect
		.globl Af_length
Af_length:
		move.l #512,-(a7)
		bra    indirect
		.globl Ascrp_clear
Ascrp_clear:
		move.l #516,-(a7)
		bra    indirect
		.globl Ascrp_get
Ascrp_get:
		move.l #520,-(a7)
		bra    indirect
		.globl Ascrp_put
Ascrp_put:
		move.l #524,-(a7)
		bra    indirect
		.globl Ash_getenv
Ash_getenv:
		move.l #528,-(a7)
		bra    indirect
		.globl Ash_nextdd
Ash_nextdd:
		move.l #532,-(a7)
		bra    indirect
		.globl Ash_sendall
Ash_sendall:
		move.l #536,-(a7)
		bra    indirect
		.globl Af_first_fsel
Af_first_fsel:
		move.l #540,-(a7)
		bra    indirect
		.globl Af_next_fsel
Af_next_fsel:
		move.l #544,-(a7)
		bra    indirect
		.globl nkc_tolower
nkc_tolower:
		move.l #548,-(a7)
		bra    indirect
		.globl nkc_toupper
nkc_toupper:
		move.l #552,-(a7)
		bra    indirect
		.globl Awi_update
Awi_update:
		move.l #556,-(a7)
		bra    indirect
		.globl A_boxed
A_boxed:
		move.l #560,-(a7)
		bra    indirect
		.globl Auo_boxed
Auo_boxed:
		move.l #564,-(a7)
		bra    indirect
		.globl Aus_boxed
Aus_boxed:
		move.l #568,-(a7)
		bra    indirect
		.globl Awi_uoself
Awi_uoself:
		move.l #572,-(a7)
		bra    indirect
		.globl Af_first
Af_first:
		move.l #576,-(a7)
		bra    indirect
		.globl Af_next
Af_next:
		move.l #580,-(a7)
		bra    indirect
		.globl Af_readdir
Af_readdir:
		move.l #584,-(a7)
		bra    indirect
		.globl Af_freedir
Af_freedir:
		move.l #588,-(a7)
		bra    indirect
		.globl Alu_create
Alu_create:
		move.l #592,-(a7)
		bra    indirect
		.globl Alu_delete

	.data

	.globl errno
errno: dc.w 0
