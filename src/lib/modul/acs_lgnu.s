/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Startup code for modules (version for GNU-C)          */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

	.globl _ACSblk
	.globl __globl
	.globl _main
	.xref _ACSinit

	.text

/*
 * ACSmod header structure
 */
_main:
compiler:
	clr.w      -(a7)
	trap       #1
	dc.l       0x41435339    /* magic2 */
init_modul:
	dc.l       _ACSinit      /* entry */
_ACSblk:
	dc.l       0             /* filled in by loader */
__globl:
	dc.l       0             /* filled in by loader */
	dc.l       (funcsend-funcs)/6  /* funcsAnz */

/*
 * list of function tables & versions.
 * Function table pointer is filled in by loader.
 * Version is zero currently for all tables.
 */
funcs: 

funcAbp:     dc.w 0,0,0
funcAcfg:    dc.w 0,0,0
funcAch:     dc.w 0,0,0
funcAdr:     dc.w 0,0,0
funcAev:     dc.w 0,0,0
funcAf:      dc.w 0,0,0
funcAic:     dc.w 0,0,0
funcAim:     dc.w 0,0,0
funcAlu:     dc.w 0,0,0
funcAme:     dc.w 0,0,0
funcAmo:     dc.w 0,0,0
funcAob:     dc.w 0,0,0
funcAscrp:   dc.w 0,0,0
funcAsh:     dc.w 0,0,0
funcAst:     dc.w 0,0,0
funcAte:     dc.w 0,0,0
funcAuo:     dc.w 0,0,0
funcAus:     dc.w 0,0,0
funcAwi:     dc.w 0,0,0
funcA:       dc.w 0,0,0
funcSonst:   dc.w 0,0,0
funcVdi:     dc.w 0,0,0
funcAes:     dc.w 0,0,0
funcKeytab:  dc.w 0,0,0
funcMtAes:   dc.w 0,0,0

funcsend:

aess:        dc.l 0
vdis:        dc.l 0

/*
 * jump indirectly to function from application.
 * This must not modify any registers.
 */
indirect:
	move.l     a0,-(a7)   /* save A0 */
	movea.l    4(a7),a0   /* get function table ptr */
	adda.l     8(a7),a0   /* add offset */
	move.l     (a0),8(a7) /* put entry pointer on stack */
	movea.l    (a7)+,a0   /* restore a0 */
	addq.l     #4,a7      /* remove args */
	rts                   /* jump to entry */


/*
 * function tables
 */
 
/* backplan */
	.globl _Abp_create
_Abp_create:
		pea        0
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl _Abp_delete
_Abp_delete:
		pea        4
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl _Abp_start
_Abp_start:
		pea        8
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl _Abp_end
_Abp_end:
		pea        12
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl _Abp_mfdb2img
_Abp_mfdb2img:
		pea        16
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl _Abp_img2mfdb
_Abp_img2mfdb:
		pea        20
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect

/* config */
	.globl _Acfg_create
_Acfg_create:
		pea        0
		move.l     funcAcfg(pc),-(a7)
		bra.s      indirect
	.globl _Acfg_delete
_Acfg_delete:
		pea        4
		move.l     funcAcfg(pc),-(a7)
		bra.s      indirect
	.globl _Acfg_clear
_Acfg_clear:
		pea        8
		move.l     funcAcfg(pc),-(a7)
		bra.s      indirect
	.globl _Acfg_clearAllGroups
_Acfg_clearAllGroups:
		pea        12
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_clearGroup
_Acfg_clearGroup:
		pea        16
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_load
_Acfg_load:
		pea        20
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_save
_Acfg_save:
		pea        24
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_isChanged
_Acfg_isChanged:
		pea        28
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getValue
_Acfg_getValue:
		pea        32
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setValue
_Acfg_setValue:
		pea        36
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_clearValue
_Acfg_clearValue:
		pea        40
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getChar
_Acfg_getChar:
		pea        44
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setChar
_Acfg_setChar:
		pea        48
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getLong
_Acfg_getLong:
		pea        52
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setLong
_Acfg_setLong:
		pea        56
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getString
_Acfg_getString:
		pea        60
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getBool
_Acfg_getBool:
		pea        64
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setBool
_Acfg_setBool:
		pea        68
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_clearHeader
_Acfg_clearHeader:
		pea        72
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_headAnzahl
_Acfg_headAnzahl:
		pea        76
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setHeader
_Acfg_setHeader:
		pea        80
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getHeader
_Acfg_getHeader:
		pea        84
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_grpAnzahl
_Acfg_grpAnzahl:
		pea        88
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_grpName
_Acfg_grpName:
		pea        92
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_strAnzahl
_Acfg_strAnzahl:
		pea        96
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_strName
_Acfg_strName:
		pea        100
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_strValue
_Acfg_strValue:
		pea        104
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_strIsComment
_Acfg_strIsComment:
		pea        108
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_isCfgfile
_Acfg_isCfgfile:
		pea        112
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_createInfo
_Acfg_createInfo:
		pea        116
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_deleteInfo
_Acfg_deleteInfo:
		pea        120
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setInfo
_Acfg_setInfo:
		pea        124
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getInfo
_Acfg_getInfo:
		pea        128
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_copyInfo
_Acfg_copyInfo:
		pea        132
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_flags
_Acfg_flags:
		pea        136
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_isGroupPresent
_Acfg_isGroupPresent:
		pea        140
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_isStringPresent
_Acfg_isStringPresent:
		pea        144
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getDouble
_Acfg_getDouble:
		pea        148
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setDouble
_Acfg_setDouble:
		pea        152
		move.l     funcAcfg(pc),-(a7)
		bra        indirect

/* character */
	.globl _Ach_tolower
_Ach_tolower:
		pea        0
		move.l     funcAch(pc),-(a7)
		bra        indirect
	.globl _Ach_toupper
_Ach_toupper:
		pea        4
		move.l     funcAch(pc),-(a7)
		bra        indirect
	.globl _Ach_isWhite
_Ach_isWhite:
		pea        8
		move.l     funcAch(pc),-(a7)
		bra        indirect

/* selection */
	.globl _Adr_box
_Adr_box:
		pea        0
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl _Adr_drag
_Adr_drag:
		pea        4
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl _Adr_next
_Adr_next:
		pea        8
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl _Adr_add
_Adr_add:
		pea        12
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl _Adr_del
_Adr_del:
		pea        16
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl _Adr_unselect
_Adr_unselect:
		pea        20
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl _Adr_start
_Adr_start:
		pea        24
		move.l     funcAdr(pc),-(a7)
		bra        indirect

/* event */
	.globl _Aev_quit
_Aev_quit:
		pea        0
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl _Aev_release
_Aev_release:
		pea        4
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl _Aev_mess
_Aev_mess:
		pea        8
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl _Aev_unhidepointer
_Aev_unhidepointer:
		pea        12
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl _Aev_DhstAdd
_Aev_DhstAdd:
		pea        16
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl _Aev_DhstSaved
_Aev_DhstSaved:
		pea        20
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl _Aev_WmRedraw
_Aev_WmRedraw:
		pea        24
		move.l     funcAev(pc),-(a7)
		bra        indirect

/* file utilities */
	.globl _Af_cfgfile
_Af_cfgfile:
		pea        0
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_select
_Af_select:
		pea        4
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_2drv
_Af_2drv:
		pea        8
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_2path
_Af_2path:
		pea        12
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_2name
_Af_2name:
		pea        16
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_2fullname
_Af_2fullname:
		pea        20
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_2ext
_Af_2ext:
		pea        24
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_buildname
_Af_buildname:
		pea        28
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_length
_Af_length:
		pea        32
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_first_fsel
_Af_first_fsel:
		pea        36
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_next_fsel
_Af_next_fsel:
		pea        40
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_first
_Af_first:
		pea        44
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_next
_Af_next:
		pea        48
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_readdir
_Af_readdir:
		pea        52
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_freedir
_Af_freedir:
		pea        56
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_fileselect
_Af_fileselect:
		pea        60
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_quote
_Af_quote:
		pea        64
		pea        64
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_unquote
_Af_unquote:
		pea        68
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_chgExt
_Af_chgExt:
		pea        72
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_pathconf
_Af_pathconf:
		pea        76
		move.l     funcAf(pc),-(a7)
		bra        indirect

/* icons */
	.globl _Aic_create
_Aic_create:
		pea        0
		move.l     funcAic(pc),-(a7)
		bra        indirect
	.globl _Aic_delete
_Aic_delete:
		pea        4
		move.l     funcAic(pc),-(a7)
		bra        indirect

/* images */
	.globl _Aim_create
_Aim_create:
		pea        0
		move.l     funcAim(pc),-(a7)
		bra        indirect
	.globl _Aim_delete
_Aim_delete:
		pea        4
		move.l     funcAim(pc),-(a7)
		bra        indirect

/* lists */
	.globl _Alu_create
_Alu_create:
		pea        0
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_delete
_Alu_delete:
		pea        4
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _As_create
_As_create:
		pea        8
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _As_delete
_As_delete:
		pea        12
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Aqu_create
_Aqu_create:
		pea        16
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Aqu_delete
_Aqu_delete:
		pea        20
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_ptrCmp
_Alu_ptrCmp:
		pea        24
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_longCmp
_Alu_longCmp:
		pea        28
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_intCmp
_Alu_intCmp:
		pea        32
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_charCmp
_Alu_charCmp:
		pea        36
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_strCmp
_Alu_strCmp:
		pea        40
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_striCmp
_Alu_striCmp:
		pea        44
		move.l     funcAlu(pc),-(a7)
		bra        indirect

/* menus */
	.globl _Ame_namefix
_Ame_namefix:
		pea        0
		move.l     funcAme(pc),-(a7)
		bra        indirect
	.globl _Ame_popup
_Ame_popup:
		pea        4
		move.l     funcAme(pc),-(a7)
		bra        indirect

/* mouse */
	.globl _Amo_new
_Amo_new:
		pea        0
		move.l     funcAmo(pc),-(a7)
		bra        indirect
	.globl _Amo_busy
_Amo_busy:
		pea        4
		move.l     funcAmo(pc),-(a7)
		bra        indirect
	.globl _Amo_unbusy
_Amo_unbusy:
		pea        8
		move.l     funcAmo(pc),-(a7)
		bra        indirect
	.globl _Amo_hide
_Amo_hide:
		pea        12
		move.l     funcAmo(pc),-(a7)
		bra        indirect
	.globl _Amo_show
_Amo_show:
		pea        16
		move.l     funcAmo(pc),-(a7)
		bra        indirect

/* objects */
	.globl _Aob_create
_Aob_create:
		pea        0
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_delete
_Aob_delete:
		pea        4
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_fix
_Aob_fix:
		pea        8
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_offset
_Aob_offset:
		pea        12
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_save
_Aob_save:
		pea        16
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_restore
_Aob_restore:
		pea        20
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_watch
_Aob_watch:
		pea        24
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_findflag
_Aob_findflag:
		pea        28
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_alias
_Aob_alias:
		pea        32
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_up
_Aob_up:
		pea        36
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_icon
_Aob_icon:
		pea        40
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_puttext
_Aob_puttext:
		pea        44
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_gettext
_Aob_gettext:
		pea        48
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_within
_Aob_within:
		pea        52
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_printf
_Aob_printf:
		pea        56
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_scanf
_Aob_scanf:
		pea        60
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_flags
_Aob_flags:
		pea        64
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_state
_Aob_state:
		pea        68
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_service
_Aob_service:
		pea        72
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_visible
_Aob_visible:
		pea        76
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_count
_Aob_count:
		pea        80
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_help
_Aob_help:
		pea        84
		move.l     funcAob(pc),-(a7)
		bra        indirect


/* clipboard */
	.globl _Ascrp_clear
_Ascrp_clear:
		pea        0
		move.l     funcAscrp(pc),-(a7)
		bra        indirect
	.globl _Ascrp_get
_Ascrp_get:
		pea        4
		move.l     funcAscrp(pc),-(a7)
		bra        indirect
	.globl _Ascrp_put
_Ascrp_put:
		pea        8
		move.l     funcAscrp(pc),-(a7)
		bra        indirect

/* shell */
	.globl _Ash_prog
_Ash_prog:
		pea        0
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_error
_Ash_error:
		pea        4
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getcookie
_Ash_getcookie:
		pea        8
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getenv
_Ash_getenv:
		pea        12
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_nextdd
_Ash_nextdd:
		pea        16
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_sendall
_Ash_sendall:
		pea        20
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_CallEdDI
_Ash_CallEdDI:
		pea        24
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_NVDICookie
_Ash_NVDICookie:
		pea        28
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_NVDIVersion
_Ash_NVDIVersion:
		pea        32
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_NVDIDatum
_Ash_NVDIDatum:
		pea        36
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_thermometer
_Ash_thermometer:
		pea        40
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_fileselect
_Ash_fileselect:
		pea        44
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_font
_Ash_font:
		pea        48
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_print
_Ash_print:
		pea        52
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_gettimer
_Ash_gettimer:
		pea        56
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_printSetIcon
_Ash_printSetIcon:
		pea        60
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_fontSetIcon
_Ash_fontSetIcon:
		pea        64
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_fileSetIcon
_Ash_fileSetIcon:
		pea        68
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getOSHeader
_Ash_getOSHeader:
		pea        72
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getMagiC
_Ash_getMagiC:
		pea        76
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getNAES
_Ash_getNAES:
		pea        80
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getMagiCVersion
_Ash_getMagiCVersion:
		pea        84
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getMagiCAESVars
_Ash_getMagiCAESVars:
		pea        88
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_cmdParsen
_Ash_cmdParsen:
		pea        92
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_sendmsg
_Ash_sendmsg:
		pea        96
		move.l     funcAsh(pc),-(a7)
		bra        indirect

/* strings */
	.globl _Ast_create
_Ast_create:
		pea        0
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_delete
_Ast_delete:
		pea        4
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_tolower
_Ast_tolower:
		pea        8
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_toupper
_Ast_toupper:
		pea        12
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_ltrim
_Ast_ltrim:
		pea        16
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_rtrim
_Ast_rtrim:
		pea        20
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_alltrim
_Ast_alltrim:
		pea        24
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_cmp
_Ast_cmp:
		pea        28
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_icmp
_Ast_icmp:
		pea        32
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_isEmpty
_Ast_isEmpty:
		pea        36
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_add
_Ast_add:
		pea        40
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_adl
_Ast_adl:
		pea        44
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_adr
_Ast_adr:
		pea        48
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_adc
_Ast_adc:
		pea        52
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_filter
_Ast_filter:
		pea        56
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_count
_Ast_count:
		pea        60
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_fcmp
_Ast_fcmp:
		pea        64
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_ncmp
_Ast_ncmp:
		pea        68
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_incmp
_Ast_incmp:
		pea        72
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_istr
_Ast_istr:
		pea        76
		move.l     funcAst(pc),-(a7)
		bra        indirect

/* tedinfos */
	.globl _Ate_create
_Ate_create:
		pea        0
		move.l     funcAte(pc),-(a7)
		bra        indirect
	.globl _Ate_delete
_Ate_delete:
		pea        4
		move.l     funcAte(pc),-(a7)
		bra        indirect

/* user objects */
	.globl _Auo_ftext
_Auo_ftext:
		pea        0
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl _Auo_string
_Auo_string:
		pea        4
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl _Auo_cycle
_Auo_cycle:
		pea        8
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl _Auo_picture
_Auo_picture:
		pea        12
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl _Auo_boxed
_Auo_boxed:
		pea        16
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl _Auo_wislider
_Auo_wislider:
		pea        20
		move.l     funcAuo(pc),-(a7)
		bra        indirect

/* user services */
	.globl _Aus_create
_Aus_create:
		pea        0
		move.l     funcAus(pc),-(a7)
		bra        indirect
	.globl _Aus_delete
_Aus_delete:
		pea        4
		move.l     funcAus(pc),-(a7)
		bra        indirect
	.globl _Aus_boxed
_Aus_boxed:
		pea        8
		move.l     funcAus(pc),-(a7)
		bra        indirect
	.globl _Aus_cycle
_Aus_cycle:
		pea        12
		move.l     funcAus(pc),-(a7)
		bra        indirect
	.globl _Aus_help
_Aus_help:
		pea        16
		move.l     funcAus(pc),-(a7)
		bra        indirect
	.globl _Aus_slider
_Aus_slider:
		pea        20
		move.l     funcAus(pc),-(a7)
		bra        indirect

/* windows */
	.globl _Awi_wid
_Awi_wid:
		pea        0
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_root
_Awi_root:
		pea        4
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_list
_Awi_list:
		pea        8
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_sendall
_Awi_sendall:
		pea        12
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_down
_Awi_down:
		pea        16
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_up
_Awi_up:
		pea        20
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_show
_Awi_show:
		pea        24
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_init
_Awi_init:
		pea        28
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_create
_Awi_create:
		pea        32
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_open
_Awi_open:
		pea        36
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_closed
_Awi_closed:
		pea        40
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_delete
_Awi_delete:
		pea        44
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_topped
_Awi_topped:
		pea        48
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_fulled
_Awi_fulled:
		pea        52
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_sized
_Awi_sized:
		pea        56
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_moved
_Awi_moved:
		pea        60
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_diaend
_Awi_diaend:
		pea        64
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_diastart
_Awi_diastart:
		pea        68
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_keys
_Awi_keys:
		pea        72
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_obview
_Awi_obview:
		pea        76
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_service
_Awi_service:
		pea        80
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_scroll
_Awi_scroll:
		pea        84
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_obchange
_Awi_obchange:
		pea        88
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_obredraw
_Awi_obredraw:
		pea        92
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_redraw
_Awi_redraw:
		pea        96
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_arrowed
_Awi_arrowed:
		pea        100
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_hslid
_Awi_hslid:
		pea        104
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_vslid
_Awi_vslid:
		pea        108
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_iconify
_Awi_iconify:
		pea        112
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_uniconify
_Awi_uniconify:
		pea        116
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_gemscript
_Awi_gemscript:
		pea        120
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_modal
_Awi_modal:
		pea        124
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_dialog
_Awi_dialog:
		pea        128
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_alert
_Awi_alert:
		pea        132
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_selfcreate
_Awi_selfcreate:
		pea        136
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_nokey
_Awi_nokey:
		pea        140
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_update
_Awi_update:
		pea        144
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_uoself
_Awi_uoself:
		pea        148
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_doform
_Awi_doform:
		pea        152
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_observice
_Awi_observice:
		pea        156
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_ontop
_Awi_ontop:
		pea        160
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_layout
_Awi_layout:
		pea        164
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_obvisible
_Awi_obvisible:
		pea        168
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_saved
_Awi_saved:
		pea        172
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_sendkey
_Awi_sendkey:
		pea        176
		move.l     funcAwi(pc),-(a7)
		bra        indirect

/* drawing callbacks */
	.globl _A_dialog
_A_dialog:
		pea        0
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_checkbox
_A_checkbox:
		pea        4
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_radiobutton
_A_radiobutton:
		pea        8
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_innerframe
_A_innerframe:
		pea        12
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_pattern
_A_pattern:
		pea        16
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_arrows
_A_arrows:
		pea        20
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_select
_A_select:
		pea        24
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_ftext
_A_ftext:
		pea        28
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_title
_A_title:
		pea        32
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_3Dbutton
_A_3Dbutton:
		pea        36
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_cycle
_A_cycle:
		pea        40
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_picture
_A_picture:
		pea        44
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_dialog2
_A_dialog2:
		pea        48
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_boxed
_A_boxed:
		pea        52
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_slider
_A_slider:
		pea        56
		move.l     funcA(pc),-(a7)
		bra        indirect

/* misc */
	.globl _Ax_malloc
_Ax_malloc:
		pea        0
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_free
_Ax_free:
		pea        4
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_ifree
_Ax_ifree:
		pea        8
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_glmalloc
_Ax_glmalloc:
		pea        12
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_glfree
_Ax_glfree:
		pea        16
		move.l     funcSonst(pc),-(a7)
		bra        indirect

/*
 * ACSmoduleterm is different, because we need
 * to pass the BASEPAGE pointer to Ax_mterm()
 */
	.globl _ACSmoduleterm
_ACSmoduleterm:
		movea.l    #compiler-256,a0
		cmp.l      #0x203a001a,228(a0)
		bne.s      ACSmoduleterm1
		cmp.l      #0x4efb08fa,232(a0)
		bne.s      ACSmoduleterm1
		lea        -228(a0),a0
ACSmoduleterm1:
		move.l     a0,-(a7)
		move.l     funcSonst(pc),a1
		move.l     20(a1),a1  /* Ax_mterm */
		jsr        (a1)
		addq.l     #4,a7
		rts

	.globl _alert_str
_alert_str:
		pea        24
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _intersect
_intersect:
		pea        28
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _xywh2array
_xywh2array:
		pea        32
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _array2xywh
_array2xywh:
		pea        36
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _dotted_xline
_dotted_xline:
		pea        40
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _dotted_yline
_dotted_yline:
		pea        44
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_tos2n
_nkc_tos2n:
		pea        48
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_n2tos
_nkc_n2tos:
		pea        52
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_gem2n
_nkc_gem2n:
		pea        56
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_n2gem
_nkc_n2gem:
		pea        60
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_gemks2n
_nkc_gemks2n:
		pea        64
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_n2gemks
_nkc_n2gemks:
		pea        68
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_n2kstate
_nkc_n2kstate:
		pea        72
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_kstate
_nkc_kstate:
		pea        76
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_cmp
_nkc_cmp:
		pea        80
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_tolower
_nkc_tolower:
		pea        84
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_toupper
_nkc_toupper:
		pea        88
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _appl_xgetinfo
_appl_xgetinfo:
		pea        92
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_setRecycleSize
_Ax_setRecycleSize:
		pea        96
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_getRecycleStat
_Ax_getRecycleStat:
		pea        100
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_recycle
_Ax_recycle:
		pea        104
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Avdi_getRGB
_Avdi_getRGB:
		pea        108
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_memCheck
_Ax_memCheck:
		pea        112
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Adate_getMonth
_Adate_getMonth:
		pea        116
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Adate_ymd2dow
_Adate_ymd2dow:
		pea        120
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _get_desktop
_get_desktop:
		pea        124
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _get_pur_desk
_get_pur_desk:
		pea        128
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _get_module_window
_get_module_window:
		pea        132
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _get_editor
_get_editor:
		pea        136
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _get_list
_get_list:
		pea        140
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _get_protocol
_get_protocol:
		pea        144
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _get_plotter
_get_plotter:
		pea        148
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _wprintf
_wprintf:
		pea        152
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _wvprintf
_wvprintf:
		pea        156
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _wputs
_wputs:
		pea        160
		move.l     funcSonst(pc),-(a7)
		bra        indirect


/* VDI */
	.globl _vdi
_vdi:
		pea        0
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vdi_
_vdi_:
		pea        4
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnwk
_v_opnwk:
		pea        8
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_clswk
_v_clswk:
		pea        12
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnvwk
_v_opnvwk:
		pea        16
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_clsvwk
_v_clsvwk:
		pea        20
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_clrwk
_v_clrwk:
		pea        24
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_updwk
_v_updwk:
		pea        28
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnbm
_v_opnbm:
		pea        32
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_clsbm
_v_clsbm:
		pea        36
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_load_fonts
_vst_load_fonts:
		pea        40
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_unload_fonts
_vst_unload_fonts:
		pea        44
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_clip
_vs_clip:
		pea        48
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_pline
_v_pline:
		pea        52
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_pmarker
_v_pmarker:
		pea        56
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_gtext
_v_gtext:
		pea        60
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_fillarea
_v_fillarea:
		pea        64
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_cellarray
_v_cellarray:
		pea        68
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_contourfill
_v_contourfill:
		pea        72
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bar
_v_bar:
		pea        76
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_arc
_v_arc:
		pea        80
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_pieslice
_v_pieslice:
		pea        84
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_circle
_v_circle:
		pea        88
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ellipse
_v_ellipse:
		pea        92
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ellarc
_v_ellarc:
		pea        96
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ellpie
_v_ellpie:
		pea        100
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_justified
_v_justified:
		pea        104
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vr_recfl
_vr_recfl:
		pea        108
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_rfbox
_v_rfbox:
		pea        112
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_rbox
_v_rbox:
		pea        116
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_gdos
_vq_gdos:
		pea        120
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vswr_mode
_vswr_mode:
		pea        124
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_type
_vsl_type:
		pea        128
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_udsty
_vsl_udsty:
		pea        132
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_width
_vsl_width:
		pea        136
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_color
_vsl_color:
		pea        140
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_ends
_vsl_ends:
		pea        144
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_type
_vsm_type:
		pea        148
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_height
_vsm_height:
		pea        152
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_color
_vsm_color:
		pea        156
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_height
_vst_height:
		pea        160
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_point
_vst_point:
		pea        164
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_rotation
_vst_rotation:
		pea        168
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_font
_vst_font:
		pea        172
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_color
_vst_color:
		pea        176
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_effects
_vst_effects:
		pea        180
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_alignment
_vst_alignment:
		pea        184
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_interior
_vsf_interior:
		pea        188
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_style
_vsf_style:
		pea        192
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_color
_vsf_color:
		pea        196
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_perimeter
_vsf_perimeter:
		pea        200
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_udpat
_vsf_udpat:
		pea        204
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_updat
_vsf_updat:
		pea        208
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_color
_vs_color:
		pea        212
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vr_trnfm
_vr_trnfm:
		pea        216
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vro_cpyfm
_vro_cpyfm:
		pea        220
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vrt_cpyfm
_vrt_cpyfm:
		pea        224
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_get_pixel
_v_get_pixel:
		pea        228
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsin_mode
_vsin_mode:
		pea        232
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vrq_locator
_vrq_locator:
		pea        236
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_locator
_vsm_locator:
		pea        240
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vrq_valuator
_vrq_valuator:
		pea        244
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_valuator
_vsm_valuator:
		pea        248
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vrq_choice
_vrq_choice:
		pea        252
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_choice
_vsm_choice:
		pea        256
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vrq_string
_vrq_string:
		pea        260
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_string
_vsm_string:
		pea        264
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vex_timv
_vex_timv:
		pea        268
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_show_c
_v_show_c:
		pea        272
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_hide_c
_v_hide_c:
		pea        276
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_mouse
_vq_mouse:
		pea        280
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vex_butv
_vex_butv:
		pea        284
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vex_motv
_vex_motv:
		pea        288
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vex_curv
_vex_curv:
		pea        292
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_key_s
_vq_key_s:
		pea        296
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_extnd
_vq_extnd:
		pea        300
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vql_attributes
_vql_attributes:
		pea        304
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqm_attributes
_vqm_attributes:
		pea        308
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqf_attributes
_vqf_attributes:
		pea        312
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_attributes
_vqt_attributes:
		pea        316
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_extent
_vqt_extent:
		pea        320
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_width
_vqt_width:
		pea        324
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_name
_vqt_name:
		pea        328
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqin_mode
_vqin_mode:
		pea        332
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_fontinfo
_vqt_fontinfo:
		pea        336
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_scrninfo
_vq_scrninfo:
		pea        340
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_color
_vq_color:
		pea        344
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_cellarray
_vq_cellarray:
		pea        348
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_chcells
_vq_chcells:
		pea        352
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_exit_cur
_v_exit_cur:
		pea        356
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_enter_cur
_v_enter_cur:
		pea        360
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curup
_v_curup:
		pea        364
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curdown
_v_curdown:
		pea        368
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curright
_v_curright:
		pea        372
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curleft
_v_curleft:
		pea        376
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curhome
_v_curhome:
		pea        380
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_eeos
_v_eeos:
		pea        384
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_eeol
_v_eeol:
		pea        388
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curaddress
_v_curaddress:
		pea        392
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curtext
_v_curtext:
		pea        396
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_rvon
_v_rvon:
		pea        400
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_rvoff
_v_rvoff:
		pea        404
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_curaddress
_vq_curaddress:
		pea        408
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_tabstatus
_vq_tabstatus:
		pea        412
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_hardcopy
_v_hardcopy:
		pea        416
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_dspcur
_v_dspcur:
		pea        420
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_rmcur
_v_rmcur:
		pea        424
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_form_adv
_v_form_adv:
		pea        428
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_clear_disp_list
_v_clear_disp_list:
		pea        432
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_scan
_vq_scan:
		pea        436
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_alpha_text
_v_alpha_text:
		pea        440
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_palette
_vs_palette:
		pea        444
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_sound
_v_sound:
		pea        448
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_mute
_vs_mute:
		pea        452
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vt_resolution
_vt_resolution:
		pea        456
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vt_axis
_vt_axis:
		pea        460
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vt_origin
_vt_origin:
		pea        464
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_tdimensions
_vq_tdimensions:
		pea        468
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vt_alignment
_vt_alignment:
		pea        472
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsp_film
_vsp_film:
		pea        476
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqp_filmname
_vqp_filmname:
		pea        480
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsc_expose
_vsc_expose:
		pea        484
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_meta_extents
_v_meta_extents:
		pea        488
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_write_meta
_v_write_meta:
		pea        492
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vm_pagesize
_vm_pagesize:
		pea        496
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vm_coords
_vm_coords:
		pea        500
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vm_filename
_vm_filename:
		pea        504
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_offset
_v_offset:
		pea        508
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_fontinit
_v_fontinit:
		pea        512
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_escape2000
_v_escape2000:
		pea        516
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_output_window
_v_output_window:
		pea        520
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bit_image
_v_bit_image:
		pea        524
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _fix31ToPixel
_fix31ToPixel:
		pea        528
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnprn
_v_opnprn:
		pea        532
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnmeta
_v_opnmeta:
		pea        536
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_devinfo
_vq_devinfo:
		pea        540
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_ext_devinfo
_vq_ext_devinfo:
		pea        544
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_calibrate
_vs_calibrate:
		pea        548
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_calibrate
_vq_calibrate:
		pea        552
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bez
_v_bez:
		pea        556
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bez_on
_v_bez_on:
		pea        560
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bez_off
_v_bez_off:
		pea        564
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bez_qual
_v_bez_qual:
		pea        568
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bez_fill
_v_bez_fill:
		pea        572
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_ext_name
_vqt_ext_name:
		pea        576
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_char_index
_vqt_char_index:
		pea        580
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_isCharAvailable
_vqt_isCharAvailable:
		pea        584
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_xfntinfo
_vqt_xfntinfo:
		pea        588
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_name
_vst_name:
		pea        592
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_name_and_id
_vqt_name_and_id:
		pea        596
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_fontheader
_vqt_fontheader:
		pea        600
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_trackkern
_vqt_trackkern:
		pea        604
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_pairkern
_vqt_pairkern:
		pea        608
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_charmap
_vst_charmap:
		pea        612
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_kern
_vst_kern:
		pea        616
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_kern_offset
_vst_kern_offset:
		pea        620
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_getbitmap_info
_v_getbitmap_info:
		pea        624
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_f_extent
_vqt_f_extent:
		pea        628
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_real_extent
_vqt_real_extent:
		pea        632
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ftext
_v_ftext:
		pea        636
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ftext_offset
_v_ftext_offset:
		pea        640
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_getoutline
_v_getoutline:
		pea        644
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_arbpt32
_vst_arbpt32:
		pea        648
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_advance32
_vqt_advance32:
		pea        652
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_setsize32
_vst_setsize32:
		pea        656
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_skew
_vst_skew:
		pea        660
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_orient
_v_orient:
		pea        664
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_trays
_v_trays:
		pea        668
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_tray_names
_vq_tray_names:
		pea        672
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_page_size
_v_page_size:
		pea        676
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_page_name
_vq_page_name:
		pea        680
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_fg_color
_vst_fg_color:
		pea        684
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_fg_color
_vsf_fg_color:
		pea        688
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_fg_color
_vsl_fg_color:
		pea        692
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_fg_color
_vsm_fg_color:
		pea        696
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsr_fg_color
_vsr_fg_color:
		pea        700
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_bg_color
_vst_bg_color:
		pea        704
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_bg_color
_vsf_bg_color:
		pea        708
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_bg_color
_vsl_bg_color:
		pea        712
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_bg_color
_vsm_bg_color:
		pea        716
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsr_bg_color
_vsr_bg_color:
		pea        720
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_fg_color
_vqt_fg_color:
		pea        724
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqf_fg_color
_vqf_fg_color:
		pea        728
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vql_fg_color
_vql_fg_color:
		pea        732
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqm_fg_color
_vqm_fg_color:
		pea        736
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqr_fg_color
_vqr_fg_color:
		pea        740
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_bg_color
_vqt_bg_color:
		pea        744
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqf_bg_color
_vqf_bg_color:
		pea        748
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vql_bg_color
_vql_bg_color:
		pea        752
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqm_bg_color
_vqm_bg_color:
		pea        756
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqr_bg_color
_vqr_bg_color:
		pea        760
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_color2value
_v_color2value:
		pea        764
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_value2color
_v_value2color:
		pea        768
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_color2nearest
_v_color2nearest:
		pea        772
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_px_format
_vq_px_format:
		pea        776
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_ctab
_vs_ctab:
		pea        780
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_ctab_entry
_vs_ctab_entry:
		pea        784
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_dflt_ctab
_vs_dflt_ctab:
		pea        788
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_ctab
_vq_ctab:
		pea        792
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_ctab_entry
_vq_ctab_entry:
		pea        796
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_ctab_id
_vq_ctab_id:
		pea        800
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ctab_idx2vdi
_v_ctab_idx2vdi:
		pea        804
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ctab_vdi2idx
_v_ctab_vdi2idx:
		pea        808
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ctab_idx2value
_v_ctab_idx2value:
		pea        812
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_get_ctab_id
_v_get_ctab_id:
		pea        816
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_dflt_ctab
_vq_dflt_ctab:
		pea        820
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_create_itab
_v_create_itab:
		pea        824
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_delete_itab
_v_delete_itab:
		pea        828
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vr_transfer_bits
_vr_transfer_bits:
		pea        832
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_hilite_color
_vs_hilite_color:
		pea        836
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_min_color
_vs_min_color:
		pea        840
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_max_color
_vs_max_color:
		pea        844
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_weight_color
_vs_weight_color:
		pea        848
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_hilite_color
_vq_hilite_color:
		pea        852
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_min_color
_vq_min_color:
		pea        856
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_max_color
_vq_max_color:
		pea        860
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_weight_color
_vq_weight_color:
		pea        864
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_document_info
_vs_document_info:
		pea        868
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_prn_scaling
_vq_prn_scaling:
		pea        872
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_open_bm
_v_open_bm:
		pea        876
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_resize_bm
_v_resize_bm:
		pea        880
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_get_outline
_v_get_outline:
		pea        884
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_track_offset
_vst_track_offset:
		pea        888
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_arbpt
_vst_arbpt:
		pea        892
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_advance
_vqt_advance:
		pea        896
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_setsize
_vst_setsize:
		pea        900
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_vgdos
_vq_vgdos:
		pea        904
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_width
_vst_width:
		pea        908
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_scratch
_vst_scratch:
		pea        912
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_error
_vst_error:
		pea        916
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_savecache
_v_savecache:
		pea        920
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_loadcache
_v_loadcache:
		pea        924
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_flushcache
_v_flushcache:
		pea        928
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_cachesize
_vqt_cachesize:
		pea        932
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_get_table
_vqt_get_table:
		pea        936
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_curaddress
_vs_curaddress:
		pea        940
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_perimeter3
_vsf_perimeter3:
		pea        944
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_justified
_vqt_justified:
		pea        948
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnprnwrk
_v_opnprnwrk:
		pea        952
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnmatrixprn
_v_opnmatrixprn:
		pea        956
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_set_app_buff
_v_set_app_buff:
		pea        960
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_devinfo
_vqt_devinfo:
		pea        964
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_create_ctab
_v_create_ctab:
		pea        968
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_delete_ctab
_v_delete_ctab:
		pea        972
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_setrgb
_v_setrgb:
		pea        976
		move.l     funcVdi(pc),-(a7)
		bra        indirect

/* AES */
	.globl _aes
_aes:
		pea        0
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_init
_appl_init:
		pea        4
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_read
_appl_read:
		pea        8
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_write
_appl_write:
		pea        12
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_find
_appl_find:
		pea        16
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_search
_appl_search:
		pea        20
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_tplay
_appl_tplay:
		pea        24
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_trecord
_appl_trecord:
		pea        28
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_yield
_appl_yield:
		pea        32
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_exit
_appl_exit:
		pea        36
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_getinfo
_appl_getinfo:
		pea        40
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_control
_appl_control:
		pea        44
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_keybd
_evnt_keybd:
		pea        48
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_button
_evnt_button:
		pea        52
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_mouse
_evnt_mouse:
		pea        56
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_mesag
_evnt_mesag:
		pea        60
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_timer
_evnt_timer:
		pea        64
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_event
_evnt_event:
		pea        68
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_multi
_evnt_multi:
		pea        72
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_dclick
_evnt_dclick:
		pea        76
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_bar
_menu_bar:
		pea        80
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_icheck
_menu_icheck:
		pea        84
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_ienable
_menu_ienable:
		pea        88
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_tnormal
_menu_tnormal:
		pea        92
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_text
_menu_text:
		pea        96
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_register
_menu_register:
		pea        100
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_unregister
_menu_unregister:
		pea        104
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_click
_menu_click:
		pea        108
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_attach
_menu_attach:
		pea        112
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_istart
_menu_istart:
		pea        116
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_popup
_menu_popup:
		pea        120
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_settings
_menu_settings:
		pea        124
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_add
_objc_add:
		pea        128
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_delete
_objc_delete:
		pea        132
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_draw
_objc_draw:
		pea        136
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_find
_objc_find:
		pea        140
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_offset
_objc_offset:
		pea        144
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_order
_objc_order:
		pea        148
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_edit
_objc_edit:
		pea        152
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_change
_objc_change:
		pea        156
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_sysvar
_objc_sysvar:
		pea        160
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_do
_form_do:
		pea        164
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_dial
_form_dial:
		pea        168
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_alert
_form_alert:
		pea        172
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_error
_form_error:
		pea        176
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_center
_form_center:
		pea        180
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_keybd
_form_keybd:
		pea        184
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_button
_form_button:
		pea        188
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_rubbox
_graf_rubbox:
		pea        192
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_rubberbox
_graf_rubberbox:
		pea        196
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_dragbox
_graf_dragbox:
		pea        200
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_mbox
_graf_mbox:
		pea        204
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_movebox
_graf_movebox:
		pea        208
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_growbox
_graf_growbox:
		pea        212
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_shrinkbox
_graf_shrinkbox:
		pea        216
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_watchbox
_graf_watchbox:
		pea        220
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_slidebox
_graf_slidebox:
		pea        224
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_handle
_graf_handle:
		pea        228
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_mouse
_graf_mouse:
		pea        232
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_mkstate
_graf_mkstate:
		pea        236
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_multirubber
_graf_multirubber:
		pea        240
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _scrp_read
_scrp_read:
		pea        244
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _scrp_write
_scrp_write:
		pea        248
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fsel_input
_fsel_input:
		pea        252
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fsel_exinput
_fsel_exinput:
		pea        256
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fsel_boxinput
_fsel_boxinput:
		pea        260
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fslx_open
_fslx_open:
		pea        264
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fslx_close
_fslx_close:
		pea        268
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fslx_getnxtfile
_fslx_getnxtfile:
		pea        272
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fslx_evnt
_fslx_evnt:
		pea        276
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fslx_do
_fslx_do:
		pea        280
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fslx_set_flags
_fslx_set_flags:
		pea        284
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_create
_wind_create:
		pea        288
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_open
_wind_open:
		pea        292
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_close
_wind_close:
		pea        296
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_delete
_wind_delete:
		pea        300
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_get
_wind_get:
		pea        304
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_getQSB
_wind_getQSB:
		pea        308
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_set
_wind_set:
		pea        312
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_find
_wind_find:
		pea        316
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_update
_wind_update:
		pea        320
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_calc
_wind_calc:
		pea        324
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_new
_wind_new:
		pea        328
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _rsrc_load
_rsrc_load:
		pea        332
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _rsrc_free
_rsrc_free:
		pea        336
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _rsrc_gaddr
_rsrc_gaddr:
		pea        340
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _rsrc_saddr
_rsrc_saddr:
		pea        344
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _rsrc_obfix
_rsrc_obfix:
		pea        348
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _rsrc_rcfix
_rsrc_rcfix:
		pea        352
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_read
_shel_read:
		pea        356
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_write
_shel_write:
		pea        360
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_get
_shel_get:
		pea        364
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_put
_shel_put:
		pea        368
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_find
_shel_find:
		pea        372
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_envrn
_shel_envrn:
		pea        376
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_help
_shel_help:
		pea        380
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_add
_fnts_add:
		pea        384
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_close
_fnts_close:
		pea        388
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_create
_fnts_create:
		pea        392
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_delete
_fnts_delete:
		pea        396
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_do
_fnts_do:
		pea        400
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_evnt
_fnts_evnt:
		pea        404
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_get_info
_fnts_get_info:
		pea        408
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_get_name
_fnts_get_name:
		pea        412
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_get_no_styles
_fnts_get_no_styles:
		pea        416
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_get_style
_fnts_get_style:
		pea        420
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_open
_fnts_open:
		pea        424
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_remove
_fnts_remove:
		pea        428
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_update
_fnts_update:
		pea        432
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_ascroll_to
_lbox_ascroll_to:
		pea        436
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_scroll_to
_lbox_scroll_to:
		pea        440
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_bscroll_to
_lbox_bscroll_to:
		pea        444
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_cnt_items
_lbox_cnt_items:
		pea        448
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_create
_lbox_create:
		pea        452
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_delete
_lbox_delete:
		pea        456
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_do
_lbox_do:
		pea        460
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_free_items
_lbox_free_items:
		pea        464
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_free_list
_lbox_free_list:
		pea        468
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_afirst
_lbox_get_afirst:
		pea        472
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_first
_lbox_get_first:
		pea        476
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_avis
_lbox_get_avis:
		pea        480
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_visible
_lbox_get_visible:
		pea        484
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_bentries
_lbox_get_bentries:
		pea        488
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_bfirst
_lbox_get_bfirst:
		pea        492
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_idx
_lbox_get_idx:
		pea        496
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_item
_lbox_get_item:
		pea        500
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_items
_lbox_get_items:
		pea        504
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_slct_idx
_lbox_get_slct_idx:
		pea        508
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_slct_item
_lbox_get_slct_item:
		pea        512
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_tree
_lbox_get_tree:
		pea        516
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_udata
_lbox_get_udata:
		pea        520
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_set_asldr
_lbox_set_asldr:
		pea        524
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_set_slider
_lbox_set_slider:
		pea        528
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_set_bentries
_lbox_set_bentries:
		pea        532
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_set_bsldr
_lbox_set_bsldr:
		pea        536
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_set_items
_lbox_set_items:
		pea        540
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_update
_lbox_update:
		pea        544
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_add_printers
_pdlg_add_printers:
		pea        548
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_add_sub_dialogs
_pdlg_add_sub_dialogs:
		pea        552
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_close
_pdlg_close:
		pea        556
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_create
_pdlg_create:
		pea        560
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_delete
_pdlg_delete:
		pea        564
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_dflt_settings
_pdlg_dflt_settings:
		pea        568
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_do
_pdlg_do:
		pea        572
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_evnt
_pdlg_evnt:
		pea        576
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_free_settings
_pdlg_free_settings:
		pea        580
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_get_setsize
_pdlg_get_setsize:
		pea        584
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_new_settings
_pdlg_new_settings:
		pea        588
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_open
_pdlg_open:
		pea        592
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_remove_printers
_pdlg_remove_printers:
		pea        596
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_remove_sub_dialogs
_pdlg_remove_sub_dialogs:
		pea        600
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_update
_pdlg_update:
		pea        604
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_use_settings
_pdlg_use_settings:
		pea        608
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_validate_settings
_pdlg_validate_settings:
		pea        612
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_create
_edit_create:
		pea        616
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_buf
_edit_set_buf:
		pea        620
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_open
_edit_open:
		pea        624
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_close
_edit_close:
		pea        628
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_delete
_edit_delete:
		pea        632
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_cursor
_edit_cursor:
		pea        636
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_evnt
_edit_evnt:
		pea        640
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_buf
_edit_get_buf:
		pea        644
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_format
_edit_get_format:
		pea        648
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_colour
_edit_get_colour:
		pea        652
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_color
_edit_get_color:
		pea        656
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_font
_edit_get_font:
		pea        660
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_cursor
_edit_get_cursor:
		pea        664
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_dirty
_edit_get_dirty:
		pea        668
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_sel
_edit_get_sel:
		pea        672
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_scrollinfo
_edit_get_scrollinfo:
		pea        676
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_format
_edit_set_format:
		pea        680
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_colour
_edit_set_colour:
		pea        684
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_color
_edit_set_color:
		pea        688
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_font
_edit_set_font:
		pea        692
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_cursor
_edit_set_cursor:
		pea        696
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_resized
_edit_resized:
		pea        700
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_dirty
_edit_set_dirty:
		pea        704
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_scroll
_edit_scroll:
		pea        708
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _EvntMulti
_EvntMulti:
		pea        712
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_wbutton
_form_wbutton:
		pea        716
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_xdial
_form_xdial:
		pea        720
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_xdo
_form_xdo:
		pea        724
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_xerr
_form_xerr:
		pea        728
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl __crystal
__crystal:
		pea        732
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_wwatchbox
_graf_wwatchbox:
		pea        736
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_xhandle
_graf_xhandle:
		pea        740
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_create
_wdlg_create:
		pea        744
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_open
_wdlg_open:
		pea        748
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_close
_wdlg_close:
		pea        752
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_delete
_wdlg_delete:
		pea        756
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_get_tree
_wdlg_get_tree:
		pea        760
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_get_edit
_wdlg_get_edit:
		pea        764
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_get_udata
_wdlg_get_udata:
		pea        768
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_get_handle
_wdlg_get_handle:
		pea        772
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_set_edit
_wdlg_set_edit:
		pea        776
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_set_tree
_wdlg_set_tree:
		pea        780
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_set_size
_wdlg_set_size:
		pea        784
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_set_iconify
_wdlg_set_iconify:
		pea        788
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_set_uniconify
_wdlg_set_uniconify:
		pea        792
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_evnt
_wdlg_evnt:
		pea        796
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_redraw
_wdlg_redraw:
		pea        800
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_draw
_wind_draw:
		pea        804
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _scrp_clear
_scrp_clear:
		pea        808
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_xedit
_objc_xedit:
		pea        812
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_rubbbox
_graf_rubbbox:
		pea        816
		move.l     funcAes(pc),-(a7)
		bra        indirect

/* keytab */
	.globl _Akt_getKeyTab
_Akt_getKeyTab:
		pea        0
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getRelease
_Akt_getRelease:
		pea        4
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getEuro
_Akt_getEuro:
		pea        8
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpMaxNr
_Akt_getExpMaxNr:
		pea        12
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpMaxNr
_Akt_getImpMaxNr:
		pea        16
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpNameFromNr
_Akt_getExpNameFromNr:
		pea        20
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpNameFromNr
_Akt_getImpNameFromNr:
		pea        24
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpShortNameFromNr
_Akt_getExpShortNameFromNr:
		pea        28
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpShortNameFromNr
_Akt_getImpShortNameFromNr:
		pea        32
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpNrFromId
_Akt_getExpNrFromId:
		pea        36
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpNrFromId
_Akt_getImpNrFromId:
		pea        40
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpIdFromNr
_Akt_getExpIdFromNr:
		pea        44
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpIdFromNr
_Akt_getImpIdFromNr:
		pea        48
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpNrFromName
_Akt_getExpNrFromName:
		pea        52
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpNrFromName
_Akt_getImpNrFromName:
		pea        56
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_CharAtari2X
_Akt_CharAtari2X:
		pea        60
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_CharX2Atari
_Akt_CharX2Atari:
		pea        64
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockAtari2X
_Akt_BlockAtari2X:
		pea        68
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockX2Atari
_Akt_BlockX2Atari:
		pea        72
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_StringAtari2X
_Akt_StringAtari2X:
		pea        76
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_StringX2Atari
_Akt_StringX2Atari:
		pea        80
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_CharX2Unicode
_Akt_CharX2Unicode:
		pea        84
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_CharUnicode2X
_Akt_CharUnicode2X:
		pea        88
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockX2Unicode
_Akt_BlockX2Unicode:
		pea        92
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockUnicode2X
_Akt_BlockUnicode2X:
		pea        96
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_StringX2Unicode
_Akt_StringX2Unicode:
		pea        100
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_popExpName
_Akt_popExpName:
		pea        104
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_popImpName
_Akt_popImpName:
		pea        108
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_chooseExpNr
_Akt_chooseExpNr:
		pea        112
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_chooseImpNr
_Akt_chooseImpNr:
		pea        116
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpMinNr
_Akt_getExpMinNr:
		pea        120
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpMinNr
_Akt_getImpMinNr:
		pea        124
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockXUtf2Unicode
_Akt_BlockXUtf2Unicode:
		pea        128
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockUnicode2XUtf
_Akt_BlockUnicode2XUtf:
		pea        132
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_StringXUtf2Unicode
_Akt_StringXUtf2Unicode:
		pea        136
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockXUtf2U2XUtf
_Akt_BlockXUtf2U2XUtf:
		pea        140
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockXUtf2XUtf
_Akt_BlockXUtf2XUtf:
		pea        144
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_StringXUtf2U2XUtf
_Akt_StringXUtf2U2XUtf:
		pea        148
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_StringXUtf2XUtf
_Akt_StringXUtf2XUtf:
		pea        152
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl _Akt_getInfoShort
_Akt_getInfoShort:
		pea        156
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getInfoString
_Akt_getInfoString:
		pea        160
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_CharXUtf2Unicode
_Akt_CharXUtf2Unicode:
		pea        164
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_CharUnicode2XUtf
_Akt_CharUnicode2XUtf:
		pea        168
		move.l     funcKeytab(pc),-(a7)
		bra        indirect

/* Multi-threading AES */
	.globl _mt_appl_init
_mt_appl_init:
		pea        0
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_read
_mt_appl_read:
		pea        4
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_write
_mt_appl_write:
		pea        8
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_find
_mt_appl_find:
		pea        12
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_search
_mt_appl_search:
		pea        16
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_tplay
_mt_appl_tplay:
		pea        20
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_trecord
_mt_appl_trecord:
		pea        24
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_yield
_mt_appl_yield:
		pea        28
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_exit
_mt_appl_exit:
		pea        32
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_getinfo
_mt_appl_getinfo:
		pea        36
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_control
_mt_appl_control:
		pea        40
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_keybd
_mt_evnt_keybd:
		pea        44
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_button
_mt_evnt_button:
		pea        48
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_mouse
_mt_evnt_mouse:
		pea        52
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_mesag
_mt_evnt_mesag:
		pea        56
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_timer
_mt_evnt_timer:
		pea        60
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_event
_mt_evnt_event:
		pea        64
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_multi
_mt_evnt_multi:
		pea        68
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_dclick
_mt_evnt_dclick:
		pea        72
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_bar
_mt_menu_bar:
		pea        76
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_icheck
_mt_menu_icheck:
		pea        80
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_ienable
_mt_menu_ienable:
		pea        84
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_tnormal
_mt_menu_tnormal:
		pea        88
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_text
_mt_menu_text:
		pea        92
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_register
_mt_menu_register:
		pea        96
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_unregister
_mt_menu_unregister:
		pea        100
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_click
_mt_menu_click:
		pea        104
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_attach
_mt_menu_attach:
		pea        108
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_istart
_mt_menu_istart:
		pea        112
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_popup
_mt_menu_popup:
		pea        116
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_settings
_mt_menu_settings:
		pea        120
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_add
_mt_objc_add:
		pea        124
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_delete
_mt_objc_delete:
		pea        128
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_draw
_mt_objc_draw:
		pea        132
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_find
_mt_objc_find:
		pea        136
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_offset
_mt_objc_offset:
		pea        140
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_order
_mt_objc_order:
		pea        144
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_edit
_mt_objc_edit:
		pea        148
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_change
_mt_objc_change:
		pea        152
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_sysvar
_mt_objc_sysvar:
		pea        156
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_do
_mt_form_do:
		pea        160
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_dial
_mt_form_dial:
		pea        164
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_alert
_mt_form_alert:
		pea        168
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_error
_mt_form_error:
		pea        172
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_center
_mt_form_center:
		pea        176
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_keybd
_mt_form_keybd:
		pea        180
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_button
_mt_form_button:
		pea        184
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_rubbox
_mt_graf_rubbox:
		pea        188
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_rubberbox
_mt_graf_rubberbox:
		pea        192
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_dragbox
_mt_graf_dragbox:
		pea        196
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_mbox
_mt_graf_mbox:
		pea        200
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_movebox
_mt_graf_movebox:
		pea        204
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_growbox
_mt_graf_growbox:
		pea        208
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_shrinkbox
_mt_graf_shrinkbox:
		pea        212
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_watchbox
_mt_graf_watchbox:
		pea        216
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_slidebox
_mt_graf_slidebox:
		pea        220
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_handle
_mt_graf_handle:
		pea        224
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_mouse
_mt_graf_mouse:
		pea        228
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_mkstate
_mt_graf_mkstate:
		pea        232
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_multirubber
_mt_graf_multirubber:
		pea        236
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_scrp_read
_mt_scrp_read:
		pea        240
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_scrp_write
_mt_scrp_write:
		pea        244
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fsel_input
_mt_fsel_input:
		pea        248
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fsel_exinput
_mt_fsel_exinput:
		pea        252
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fsel_boxinput
_mt_fsel_boxinput:
		pea        256
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fslx_open
_mt_fslx_open:
		pea        260
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fslx_close
_mt_fslx_close:
		pea        264
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fslx_getnxtfile
_mt_fslx_getnxtfile:
		pea        268
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fslx_evnt
_mt_fslx_evnt:
		pea        272
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fslx_do
_mt_fslx_do:
		pea        276
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fslx_set_flags
_mt_fslx_set_flags:
		pea        280
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_create
_mt_wind_create:
		pea        284
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_open
_mt_wind_open:
		pea        288
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_close
_mt_wind_close:
		pea        292
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_delete
_mt_wind_delete:
		pea        296
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_get
_mt_wind_get:
		pea        300
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_getQSB
_mt_wind_getQSB:
		pea        304
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_set
_mt_wind_set:
		pea        308
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_find
_mt_wind_find:
		pea        312
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_update
_mt_wind_update:
		pea        316
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_calc
_mt_wind_calc:
		pea        320
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_new
_mt_wind_new:
		pea        324
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_rsrc_load
_mt_rsrc_load:
		pea        328
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_rsrc_free
_mt_rsrc_free:
		pea        332
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_rsrc_gaddr
_mt_rsrc_gaddr:
		pea        336
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_rsrc_saddr
_mt_rsrc_saddr:
		pea        340
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_rsrc_obfix
_mt_rsrc_obfix:
		pea        344
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_rsrc_rcfix
_mt_rsrc_rcfix:
		pea        348
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_read
_mt_shel_read:
		pea        352
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_write
_mt_shel_write:
		pea        356
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_get
_mt_shel_get:
		pea        360
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_put
_mt_shel_put:
		pea        364
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_find
_mt_shel_find:
		pea        368
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_envrn
_mt_shel_envrn:
		pea        372
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_help
_mt_shel_help:
		pea        376
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_add
_mt_fnts_add:
		pea        380
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_close
_mt_fnts_close:
		pea        384
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_create
_mt_fnts_create:
		pea        388
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_delete
_mt_fnts_delete:
		pea        392
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_do
_mt_fnts_do:
		pea        396
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_evnt
_mt_fnts_evnt:
		pea        400
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_get_info
_mt_fnts_get_info:
		pea        404
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_get_name
_mt_fnts_get_name:
		pea        408
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_get_no_styles
_mt_fnts_get_no_styles:
		pea        412
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_get_style
_mt_fnts_get_style:
		pea        406
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_open
_mt_fnts_open:
		pea        420
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_remove
_mt_fnts_remove:
		pea        424
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_update
_mt_fnts_update:
		pea        428
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_ascroll_to
_mt_lbox_ascroll_to:
		pea        432
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_scroll_to
_mt_lbox_scroll_to:
		pea        436
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_bscroll_to
_mt_lbox_bscroll_to:
		pea        440
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_cnt_items
_mt_lbox_cnt_items:
		pea        444
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_create
_mt_lbox_create:
		pea        448
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_delete
_mt_lbox_delete:
		pea        452
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_do
_mt_lbox_do:
		pea        456
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_free_items
_mt_lbox_free_items:
		pea        460
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_free_list
_mt_lbox_free_list:
		pea        464
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_afirst
_mt_lbox_get_afirst:
		pea        468
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_first
_mt_lbox_get_first:
		pea        472
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_avis
_mt_lbox_get_avis:
		pea        476
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_visible
_mt_lbox_get_visible:
		pea        480
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_bentries
_mt_lbox_get_bentries:
		pea        484
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_bfirst
_mt_lbox_get_bfirst:
		pea        488
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_idx
_mt_lbox_get_idx:
		pea        492
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_item
_mt_lbox_get_item:
		pea        496
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_items
_mt_lbox_get_items:
		pea        500
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_slct_idx
_mt_lbox_get_slct_idx:
		pea        504
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_slct_item
_mt_lbox_get_slct_item:
		pea        508
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_tree
_mt_lbox_get_tree:
		pea        512
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_udata
_mt_lbox_get_udata:
		pea        516
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_set_asldr
_mt_lbox_set_asldr:
		pea        520
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_set_slider
_mt_lbox_set_slider:
		pea        524
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_set_bentries
_mt_lbox_set_bentries:
		pea        528
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_set_bsldr
_mt_lbox_set_bsldr:
		pea        532
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_set_items
_mt_lbox_set_items:
		pea        536
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_update
_mt_lbox_update:
		pea        540
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_add_printers
_mt_pdlg_add_printers:
		pea        544
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_add_sub_dialogs
_mt_pdlg_add_sub_dialogs:
		pea        548
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_close
_mt_pdlg_close:
		pea        552
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_create
_mt_pdlg_create:
		pea        556
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_delete
_mt_pdlg_delete:
		pea        560
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_dflt_settings
_mt_pdlg_dflt_settings:
		pea        564
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_do
_mt_pdlg_do:
		pea        568
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_evnt
_mt_pdlg_evnt:
		pea        572
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_free_settings
_mt_pdlg_free_settings:
		pea        576
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_get_setsize
_mt_pdlg_get_setsize:
		pea        580
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_new_settings
_mt_pdlg_new_settings:
		pea        584
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_open
_mt_pdlg_open:
		pea        588
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_remove_printers
_mt_pdlg_remove_printers:
		pea        592
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_remove_sub_dialogs
_mt_pdlg_remove_sub_dialogs:
		pea        596
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_update
_mt_pdlg_update:
		pea        600
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_use_settings
_mt_pdlg_use_settings:
		pea        604
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_validate_settings
_mt_pdlg_validate_settings:
		pea        608
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_create
_mt_edit_create:
		pea        612
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_buf
_mt_edit_set_buf:
		pea        616
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_open
_mt_edit_open:
		pea        620
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_close
_mt_edit_close:
		pea        624
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_delete
_mt_edit_delete:
		pea        628
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_cursor
_mt_edit_cursor:
		pea        632
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_evnt
_mt_edit_evnt:
		pea        636
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_buf
_mt_edit_get_buf:
		pea        640
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_format
_mt_edit_get_format:
		pea        644
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_colour
_mt_edit_get_colour:
		pea        648
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_color
_mt_edit_get_color:
		pea        652
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_font
_mt_edit_get_font:
		pea        656
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_cursor
_mt_edit_get_cursor:
		pea        660
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_dirty
_mt_edit_get_dirty:
		pea        664
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_sel
_mt_edit_get_sel:
		pea        668
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_scrollinfo
_mt_edit_get_scrollinfo:
		pea        672
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_format
_mt_edit_set_format:
		pea        676
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_colour
_mt_edit_set_colour:
		pea        680
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_color
_mt_edit_set_color:
		pea        684
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_font
_mt_edit_set_font:
		pea        688
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_cursor
_mt_edit_set_cursor:
		pea        692
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_resized
_mt_edit_resized:
		pea        696
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_dirty
_mt_edit_set_dirty:
		pea        700
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_scroll
_mt_edit_scroll:
		pea        704
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_EvntMulti
_mt_EvntMulti:
		pea        708
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_wbutton
_mt_form_wbutton:
		pea        712
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_xdial
_mt_form_xdial:
		pea        716
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_xdo
_mt_form_xdo:
		pea        720
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_xerr
_mt_form_xerr:
		pea        724
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_wwatchbox
_mt_graf_wwatchbox:
		pea        728
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_xhandle
_mt_graf_xhandle:
		pea        732
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_create
_mt_wdlg_create:
		pea        736
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_open
_mt_wdlg_open:
		pea        740
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_close
_mt_wdlg_close:
		pea        744
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_delete
_mt_wdlg_delete:
		pea        748
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_get_tree
_mt_wdlg_get_tree:
		pea        752
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_get_edit
_mt_wdlg_get_edit:
		pea        756
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_get_udata
_mt_wdlg_get_udata:
		pea        760
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_get_handle
_mt_wdlg_get_handle:
		pea        764
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_set_edit
_mt_wdlg_set_edit:
		pea        768
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_set_tree
_mt_wdlg_set_tree:
		pea        772
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_set_size
_mt_wdlg_set_size:
		pea        776
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_set_iconify
_mt_wdlg_set_iconify:
		pea        780
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_set_uniconify
_mt_wdlg_set_uniconify:
		pea        784
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_evnt
_mt_wdlg_evnt:
		pea        788
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_redraw
_mt_wdlg_redraw:
		pea        792
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_draw
_mt_wind_draw:
		pea        796
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_scrp_clear
_mt_scrp_clear:
		pea        800
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_xedit
_mt_objc_xedit:
		pea        804
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_rubbbox
_mt_graf_rubbbox:
		pea        808
		move.l     funcMtAes(pc),-(a7)
		bra        indirect

	.data

	.globl _errno
_errno: dc.l 0
	.globl __FilSysVec
__FilSysVec:
	dc.l 0
