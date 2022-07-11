/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Startup code for modules                              */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

	.globl _ACSblk
	.globl __globl
	.globl _main
	.xref _ACSinit

WITH_EXTENSIONS = 0

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
		move.l     #0x00000000,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl _Abp_delete
_Abp_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl _Abp_start
_Abp_start:
		move.l     #0x00000008,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl _Abp_end
_Abp_end:
		move.l     #0x0000000C,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl _Abp_mfdb2img
_Abp_mfdb2img:
		move.l     #0x00000010,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl _Abp_img2mfdb
_Abp_img2mfdb:
		move.l     #0x00000014,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect

/* config */
	.globl _Acfg_create
_Acfg_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra.s      indirect
	.globl _Acfg_delete
_Acfg_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra.s      indirect
	.globl _Acfg_clear
_Acfg_clear:
		move.l     #0x00000008,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra.s      indirect
	.globl _Acfg_clearAllGroups
_Acfg_clearAllGroups:
		move.l     #0x0000000C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_clearGroup
_Acfg_clearGroup:
		move.l     #0x00000010,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_load
_Acfg_load:
		move.l     #0x00000014,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_save
_Acfg_save:
		move.l     #0x00000018,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_isChanged
_Acfg_isChanged:
		move.l     #0x0000001C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getValue
_Acfg_getValue:
		move.l     #0x00000020,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setValue
_Acfg_setValue:
		move.l     #0x00000024,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_clearValue
_Acfg_clearValue:
		move.l     #0x00000028,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getChar
_Acfg_getChar:
		move.l     #0x0000002C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setChar
_Acfg_setChar:
		move.l     #0x00000030,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getLong
_Acfg_getLong:
		move.l     #0x00000034,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setLong
_Acfg_setLong:
		move.l     #0x00000038,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getString
_Acfg_getString:
		move.l     #0x0000003C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getBool
_Acfg_getBool:
		move.l     #0x00000040,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setBool
_Acfg_setBool:
		move.l     #0x00000044,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_clearHeader
_Acfg_clearHeader:
		move.l     #0x00000048,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_headAnzahl
_Acfg_headAnzahl:
		move.l     #0x0000004C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setHeader
_Acfg_setHeader:
		move.l     #0x00000050,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getHeader
_Acfg_getHeader:
		move.l     #0x00000054,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_grpAnzahl
_Acfg_grpAnzahl:
		move.l     #0x00000058,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_grpName
_Acfg_grpName:
		move.l     #0x0000005C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_strAnzahl
_Acfg_strAnzahl:
		move.l     #0x00000060,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_strName
_Acfg_strName:
		move.l     #0x00000064,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_strValue
_Acfg_strValue:
		move.l     #0x00000068,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_strIsComment
_Acfg_strIsComment:
		move.l     #0x0000006C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_isCfgfile
_Acfg_isCfgfile:
		move.l     #0x00000070,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_createInfo
_Acfg_createInfo:
		move.l     #0x00000074,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_deleteInfo
_Acfg_deleteInfo:
		move.l     #0x00000078,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setInfo
_Acfg_setInfo:
		move.l     #0x0000007C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_getInfo
_Acfg_getInfo:
		move.l     #0x00000080,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_copyInfo
_Acfg_copyInfo:
		move.l     #0x00000084,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_flags
_Acfg_flags:
		move.l     #0x00000088,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_isGroupPresent
_Acfg_isGroupPresent:
		move.l     #0x0000008C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_isStringPresent
_Acfg_isStringPresent:
		move.l     #0x00000090,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl _Acfg_getDouble
_Acfg_getDouble:
		move.l     #0x00000094,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl _Acfg_setDouble
_Acfg_setDouble:
		move.l     #0x00000098,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.ENDC

/* character */
	.globl _Ach_tolower
_Ach_tolower:
		move.l     #0x00000000,-(a7)
		move.l     funcAch(pc),-(a7)
		bra        indirect
	.globl _Ach_toupper
_Ach_toupper:
		move.l     #0x00000004,-(a7)
		move.l     funcAch(pc),-(a7)
		bra        indirect
	.globl _Ach_isWhite
_Ach_isWhite:
		move.l     #0x00000008,-(a7)
		move.l     funcAch(pc),-(a7)
		bra        indirect

/* selection */
	.globl _Adr_box
_Adr_box:
		move.l     #0x00000000,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl _Adr_drag
_Adr_drag:
		move.l     #0x00000004,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl _Adr_next
_Adr_next:
		move.l     #0x00000008,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl _Adr_add
_Adr_add:
		move.l     #0x0000000C,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl _Adr_del
_Adr_del:
		move.l     #0x00000010,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl _Adr_unselect
_Adr_unselect:
		move.l     #0x00000014,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl _Adr_start
_Adr_start:
		move.l     #0x00000018,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect

/* event */
	.globl _Aev_quit
_Aev_quit:
		move.l     #0x00000000,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl _Aev_release
_Aev_release:
		move.l     #0x00000004,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl _Aev_mess
_Aev_mess:
		move.l     #0x00000008,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl _Aev_unhidepointer
_Aev_unhidepointer:
		move.l     #0x0000000C,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl _Aev_DhstAdd
_Aev_DhstAdd:
		move.l     #0x00000010,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl _Aev_DhstSaved
_Aev_DhstSaved:
		move.l     #0x00000014,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl _Aev_WmRedraw
_Aev_WmRedraw:
		move.l     #0x00000018,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect

/* file utilities */
	.globl _Af_cfgfile
_Af_cfgfile:
		move.l     #0x00000000,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_select
_Af_select:
		move.l     #0x00000004,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_2drv
_Af_2drv:
		move.l     #0x00000008,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_2path
_Af_2path:
		move.l     #0x0000000C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_2name
_Af_2name:
		move.l     #0x00000010,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_2fullname
_Af_2fullname:
		move.l     #0x00000014,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_2ext
_Af_2ext:
		move.l     #0x00000018,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_buildname
_Af_buildname:
		move.l     #0x0000001C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_length
_Af_length:
		move.l     #0x00000020,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_first_fsel
_Af_first_fsel:
		move.l     #0x00000024,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_next_fsel
_Af_next_fsel:
		move.l     #0x00000028,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_first
_Af_first:
		move.l     #0x0000002C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_next
_Af_next:
		move.l     #0x00000030,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_readdir
_Af_readdir:
		move.l     #0x00000034,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_freedir
_Af_freedir:
		move.l     #0x00000038,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_fileselect
_Af_fileselect:
		move.l     #0x0000003C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_quote
_Af_quote:
		move.l     #0x00000040,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_unquote
_Af_unquote:
		move.l     #0x00000044,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl _Af_chgExt
_Af_chgExt:
		move.l     #0x00000048,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl _Af_pathconf
_Af_pathconf:
		move.l     #0x0000004C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.ENDC

/* icons */
	.globl _Aic_create
_Aic_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAic(pc),-(a7)
		bra        indirect
	.globl _Aic_delete
_Aic_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAic(pc),-(a7)
		bra        indirect

/* images */
	.globl _Aim_create
_Aim_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAim(pc),-(a7)
		bra        indirect
	.globl _Aim_delete
_Aim_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAim(pc),-(a7)
		bra        indirect

/* lists */
	.globl _Alu_create
_Alu_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_delete
_Alu_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl _As_create
_As_create:
		move.l     #0x00000008,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _As_delete
_As_delete:
		move.l     #0x0000000C,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Aqu_create
_Aqu_create:
		move.l     #0x00000010,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Aqu_delete
_Aqu_delete:
		move.l     #0x00000014,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_ptrCmp
_Alu_ptrCmp:
		move.l     #0x00000018,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_longCmp
_Alu_longCmp:
		move.l     #0x0000001C,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_intCmp
_Alu_intCmp:
		move.l     #0x00000020,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_charCmp
_Alu_charCmp:
		move.l     #0x00000024,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_strCmp
_Alu_strCmp:
		move.l     #0x00000028,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl _Alu_striCmp
_Alu_striCmp:
		move.l     #0x0000002C,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.ENDC

/* menus */
	.globl _Ame_namefix
_Ame_namefix:
		move.l     #0x00000000,-(a7)
		move.l     funcAme(pc),-(a7)
		bra        indirect
	.globl _Ame_popup
_Ame_popup:
		move.l     #0x00000004,-(a7)
		move.l     funcAme(pc),-(a7)
		bra        indirect

/* mouse */
	.globl _Amo_new
_Amo_new:
		move.l     #0x00000000,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect
	.globl _Amo_busy
_Amo_busy:
		move.l     #0x00000004,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect
	.globl _Amo_unbusy
_Amo_unbusy:
		move.l     #0x00000008,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect
	.globl _Amo_hide
_Amo_hide:
		move.l     #0x0000000C,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect
	.globl _Amo_show
_Amo_show:
		move.l     #0x00000010,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect

/* objects */
	.globl _Aob_create
_Aob_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_delete
_Aob_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_fix
_Aob_fix:
		move.l     #0x00000008,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_offset
_Aob_offset:
		move.l     #0x0000000C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_save
_Aob_save:
		move.l     #0x00000010,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_restore
_Aob_restore:
		move.l     #0x00000014,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_watch
_Aob_watch:
		move.l     #0x00000018,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_findflag
_Aob_findflag:
		move.l     #0x0000001C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_alias
_Aob_alias:
		move.l     #0x00000020,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_up
_Aob_up:
		move.l     #0x00000024,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_icon
_Aob_icon:
		move.l     #0x00000028,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_puttext
_Aob_puttext:
		move.l     #0x0000002C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_gettext
_Aob_gettext:
		move.l     #0x00000030,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_within
_Aob_within:
		move.l     #0x00000034,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_printf
_Aob_printf:
		move.l     #0x00000038,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_scanf
_Aob_scanf:
		move.l     #0x0000003C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_flags
_Aob_flags:
		move.l     #0x00000040,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_state
_Aob_state:
		move.l     #0x00000044,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_service
_Aob_service:
		move.l     #0x00000048,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_visible
_Aob_visible:
		move.l     #0x0000004C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl _Aob_count
_Aob_count:
		move.l     #0x00000050,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl _Aob_help
_Aob_help:
		move.l     #0x00000054,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.ENDC


/* clipboard */
	.globl _Ascrp_clear
_Ascrp_clear:
		move.l     #0x00000000,-(a7)
		move.l     funcAscrp(pc),-(a7)
		bra        indirect
	.globl _Ascrp_get
_Ascrp_get:
		move.l     #0x00000004,-(a7)
		move.l     funcAscrp(pc),-(a7)
		bra        indirect
	.globl _Ascrp_put
_Ascrp_put:
		move.l     #0x00000008,-(a7)
		move.l     funcAscrp(pc),-(a7)
		bra        indirect

/* shell */
	.globl _Ash_prog
_Ash_prog:
		move.l     #0x00000000,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_error
_Ash_error:
		move.l     #0x00000004,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getcookie
_Ash_getcookie:
		move.l     #0x00000008,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getenv
_Ash_getenv:
		move.l     #0x0000000C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_nextdd
_Ash_nextdd:
		move.l     #0x00000010,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_sendall
_Ash_sendall:
		move.l     #0x00000014,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_CallEdDI
_Ash_CallEdDI:
		move.l     #0x00000018,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_NVDICookie
_Ash_NVDICookie:
		move.l     #0x0000001C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_NVDIVersion
_Ash_NVDIVersion:
		move.l     #0x00000020,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_NVDIDatum
_Ash_NVDIDatum:
		move.l     #0x00000024,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_thermometer
_Ash_thermometer:
		move.l     #0x00000028,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_fileselect
_Ash_fileselect:
		move.l     #0x0000002C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_font
_Ash_font:
		move.l     #0x00000030,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_print
_Ash_print:
		move.l     #0x00000034,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_gettimer
_Ash_gettimer:
		move.l     #0x00000038,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_printSetIcon
_Ash_printSetIcon:
		move.l     #0x0000003C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_fontSetIcon
_Ash_fontSetIcon:
		move.l     #0x00000040,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_fileSetIcon
_Ash_fileSetIcon:
		move.l     #0x00000044,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getOSHeader
_Ash_getOSHeader:
		move.l     #0x00000048,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getMagiC
_Ash_getMagiC:
		move.l     #0x0000004C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getNAES
_Ash_getNAES:
		move.l     #0x00000050,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getMagiCVersion
_Ash_getMagiCVersion:
		move.l     #0x00000054,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_getMagiCAESVars
_Ash_getMagiCAESVars:
		move.l     #0x00000058,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl _Ash_cmdParsen
_Ash_cmdParsen:
		move.l     #0x0000005C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl _Ash_sendmsg
_Ash_sendmsg:
		move.l     #0x00000060,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.ENDC

/* strings */
	.globl _Ast_create
_Ast_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_delete
_Ast_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_tolower
_Ast_tolower:
		move.l     #0x00000008,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_toupper
_Ast_toupper:
		move.l     #0x0000000C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_ltrim
_Ast_ltrim:
		move.l     #0x00000010,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_rtrim
_Ast_rtrim:
		move.l     #0x00000014,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_alltrim
_Ast_alltrim:
		move.l     #0x00000018,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_cmp
_Ast_cmp:
		move.l     #0x0000001C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_icmp
_Ast_icmp:
		move.l     #0x00000020,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_isEmpty
_Ast_isEmpty:
		move.l     #0x00000024,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_add
_Ast_add:
		move.l     #0x00000028,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_adl
_Ast_adl:
		move.l     #0x0000002C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_adr
_Ast_adr:
		move.l     #0x00000030,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_adc
_Ast_adc:
		move.l     #0x00000034,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_filter
_Ast_filter:
		move.l     #0x00000038,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_count
_Ast_count:
		move.l     #0x0000003C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_fcmp
_Ast_fcmp:
		move.l     #0x00000040,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_ncmp
_Ast_ncmp:
		move.l     #0x00000044,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_incmp
_Ast_incmp:
		move.l     #0x00000048,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl _Ast_istr
_Ast_istr:
		move.l     #0x0000004C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect

/* tedinfos */
	.globl _Ate_create
_Ate_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAte(pc),-(a7)
		bra        indirect
	.globl _Ate_delete
_Ate_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAte(pc),-(a7)
		bra        indirect

/* user objects */
	.globl _Auo_ftext
_Auo_ftext:
		move.l     #0x00000000,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl _Auo_string
_Auo_string:
		move.l     #0x00000004,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl _Auo_cycle
_Auo_cycle:
		move.l     #0x00000008,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl _Auo_picture
_Auo_picture:
		move.l     #0x0000000C,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl _Auo_boxed
_Auo_boxed:
		move.l     #0x00000010,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect

/* user services */
	.globl _Aus_create
_Aus_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
	.globl _Aus_delete
_Aus_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
	.globl _Aus_boxed
_Aus_boxed:
		move.l     #0x00000008,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
	.globl _Aus_cycle
_Aus_cycle:
		move.l     #0x0000000C,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl _Aus_help
_Aus_help:
		move.l     #0x00000010,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
		.ENDC

/* windows */
	.globl _Awi_wid
_Awi_wid:
		move.l     #0x00000000,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_root
_Awi_root:
		move.l     #0x00000004,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_list
_Awi_list:
		move.l     #0x00000008,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_sendall
_Awi_sendall:
		move.l     #0x0000000C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_down
_Awi_down:
		move.l     #0x00000010,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_up
_Awi_up:
		move.l     #0x00000014,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_show
_Awi_show:
		move.l     #0x00000018,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_init
_Awi_init:
		move.l     #0x0000001C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_create
_Awi_create:
		move.l     #0x00000020,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_open
_Awi_open:
		move.l     #0x00000024,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_closed
_Awi_closed:
		move.l     #0x00000028,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_delete
_Awi_delete:
		move.l     #0x0000002C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_topped
_Awi_topped:
		move.l     #0x00000030,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_fulled
_Awi_fulled:
		move.l     #0x00000034,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_sized
_Awi_sized:
		move.l     #0x00000038,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_moved
_Awi_moved:
		move.l     #0x0000003C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_diaend
_Awi_diaend:
		move.l     #0x00000040,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_diastart
_Awi_diastart:
		move.l     #0x00000044,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_keys
_Awi_keys:
		move.l     #0x00000048,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_obview
_Awi_obview:
		move.l     #0x0000004C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_service
_Awi_service:
		move.l     #0x00000050,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_scroll
_Awi_scroll:
		move.l     #0x00000054,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_obchange
_Awi_obchange:
		move.l     #0x00000058,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_obredraw
_Awi_obredraw:
		move.l     #0x0000005C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_redraw
_Awi_redraw:
		move.l     #0x00000060,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_arrowed
_Awi_arrowed:
		move.l     #0x00000064,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_hslid
_Awi_hslid:
		move.l     #0x00000068,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_vslid
_Awi_vslid:
		move.l     #0x0000006C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_iconify
_Awi_iconify:
		move.l     #0x00000070,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_uniconify
_Awi_uniconify:
		move.l     #0x00000074,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_gemscript
_Awi_gemscript:
		move.l     #0x00000078,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_modal
_Awi_modal:
		move.l     #0x0000007C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_dialog
_Awi_dialog:
		move.l     #0x00000080,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_alert
_Awi_alert:
		move.l     #0x00000084,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_selfcreate
_Awi_selfcreate:
		move.l     #0x00000088,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_nokey
_Awi_nokey:
		move.l     #0x0000008C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_update
_Awi_update:
		move.l     #0x00000090,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_uoself
_Awi_uoself:
		move.l     #0x00000094,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_doform
_Awi_doform:
		move.l     #0x00000098,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_observice
_Awi_observice:
		move.l     #0x0000009C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_ontop
_Awi_ontop:
		move.l     #0x000000A0,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_layout
_Awi_layout:
		move.l     #0x000000A4,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_obvisible
_Awi_obvisible:
		move.l     #0x000000A8,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl _Awi_saved
_Awi_saved:
		move.l     #0x000000AC,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl _Awi_sendkey
_Awi_sendkey:
		move.l     #0x000000B0,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.ENDC

/* drawing callbacks */
	.globl _A_dialog
_A_dialog:
		move.l     #0x00000000,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_checkbox
_A_checkbox:
		move.l     #0x00000004,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_radiobutton
_A_radiobutton:
		move.l     #0x00000008,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_innerframe
_A_innerframe:
		move.l     #0x0000000C,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_pattern
_A_pattern:
		move.l     #0x00000010,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_arrows
_A_arrows:
		move.l     #0x00000014,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_select
_A_select:
		move.l     #0x00000018,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_ftext
_A_ftext:
		move.l     #0x0000001C,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_title
_A_title:
		move.l     #0x00000020,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_3Dbutton
_A_3Dbutton:
		move.l     #0x00000024,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_cycle
_A_cycle:
		move.l     #0x00000028,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_picture
_A_picture:
		move.l     #0x0000002C,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_dialog2
_A_dialog2:
		move.l     #0x00000030,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl _A_boxed
_A_boxed:
		move.l     #0x00000034,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect

/* misc */
	.globl _Ax_malloc
_Ax_malloc:
		move.l     #0x00000000,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_free
_Ax_free:
		move.l     #0x00000004,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_ifree
_Ax_ifree:
		move.l     #0x00000008,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_glmalloc
_Ax_glmalloc:
		move.l     #0x0000000C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_glfree
_Ax_glfree:
		move.l     #0x00000010,-(a7)
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
		move.l     #0x00000018,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _intersect
_intersect:
		move.l     #0x0000001C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _xywh2array
_xywh2array:
		move.l     #0x00000020,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _array2xywh
_array2xywh:
		move.l     #0x00000024,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _dotted_xline
_dotted_xline:
		move.l     #0x00000028,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _dotted_yline
_dotted_yline:
		move.l     #0x0000002C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_tos2n
_nkc_tos2n:
		move.l     #0x00000030,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_n2tos
_nkc_n2tos:
		move.l     #0x00000034,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_gem2n
_nkc_gem2n:
		move.l     #0x00000038,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_n2gem
_nkc_n2gem:
		move.l     #0x0000003C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_gemks2n
_nkc_gemks2n:
		move.l     #0x00000040,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_n2gemks
_nkc_n2gemks:
		move.l     #0x00000044,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_n2kstate
_nkc_n2kstate:
		move.l     #0x00000048,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_kstate
_nkc_kstate:
		move.l     #0x0000004C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_cmp
_nkc_cmp:
		move.l     #0x00000050,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_tolower
_nkc_tolower:
		move.l     #0x00000054,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _nkc_toupper
_nkc_toupper:
		move.l     #0x00000058,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _appl_xgetinfo
_appl_xgetinfo:
		move.l     #0x0000005C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_setRecycleSize
_Ax_setRecycleSize:
		move.l     #0x00000060,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_getRecycleStat
_Ax_getRecycleStat:
		move.l     #0x00000064,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Ax_recycle
_Ax_recycle:
		move.l     #0x00000068,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Avdi_getRGB
_Avdi_getRGB:
		move.l     #0x0000006C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl _Ax_memCheck
_Ax_memCheck:
		move.l     #0x00000070,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Adate_getMonth
_Adate_getMonth:
		move.l     #0x00000074,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl _Adate_ymd2dow
_Adate_ymd2dow:
		move.l     #0x00000078,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.ENDC

/* VDI */
	.globl _vdi
_vdi:
		move.l     #0x00000000,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vdi_
_vdi_:
		move.l     #0x00000004,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnwk
_v_opnwk:
		move.l     #0x00000008,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_clswk
_v_clswk:
		move.l     #0x0000000C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnvwk
_v_opnvwk:
		move.l     #0x00000010,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_clsvwk
_v_clsvwk:
		move.l     #0x00000014,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_clrwk
_v_clrwk:
		move.l     #0x00000018,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_updwk
_v_updwk:
		move.l     #0x0000001C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnbm
_v_opnbm:
		move.l     #0x00000020,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_clsbm
_v_clsbm:
		move.l     #0x00000024,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_load_fonts
_vst_load_fonts:
		move.l     #0x00000028,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_unload_fonts
_vst_unload_fonts:
		move.l     #0x0000002C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_clip
_vs_clip:
		move.l     #0x00000030,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_pline
_v_pline:
		move.l     #0x00000034,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_pmarker
_v_pmarker:
		move.l     #0x00000038,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_gtext
_v_gtext:
		move.l     #0x0000003C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_fillarea
_v_fillarea:
		move.l     #0x00000040,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_cellarray
_v_cellarray:
		move.l     #0x00000044,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_contourfill
_v_contourfill:
		move.l     #0x00000048,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bar
_v_bar:
		move.l     #0x0000004C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_arc
_v_arc:
		move.l     #0x00000050,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_pieslice
_v_pieslice:
		move.l     #0x00000054,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_circle
_v_circle:
		move.l     #0x00000058,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ellipse
_v_ellipse:
		move.l     #0x0000005C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ellarc
_v_ellarc:
		move.l     #0x00000060,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ellpie
_v_ellpie:
		move.l     #0x00000064,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_justified
_v_justified:
		move.l     #0x00000068,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vr_recfl
_vr_recfl:
		move.l     #0x0000006C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_rfbox
_v_rfbox:
		move.l     #0x00000070,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_rbox
_v_rbox:
		move.l     #0x00000074,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_gdos
_vq_gdos:
		move.l     #0x00000078,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vswr_mode
_vswr_mode:
		move.l     #0x0000007C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_type
_vsl_type:
		move.l     #0x00000080,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_udsty
_vsl_udsty:
		move.l     #0x00000084,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_width
_vsl_width:
		move.l     #0x00000088,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_color
_vsl_color:
		move.l     #0x0000008C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_ends
_vsl_ends:
		move.l     #0x00000090,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_type
_vsm_type:
		move.l     #0x00000094,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_height
_vsm_height:
		move.l     #0x00000098,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_color
_vsm_color:
		move.l     #0x0000009C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_height
_vst_height:
		move.l     #0x000000A0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_point
_vst_point:
		move.l     #0x000000A4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_rotation
_vst_rotation:
		move.l     #0x000000A8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_font
_vst_font:
		move.l     #0x000000AC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_color
_vst_color:
		move.l     #0x000000B0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_effects
_vst_effects:
		move.l     #0x000000B4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_alignment
_vst_alignment:
		move.l     #0x000000B8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_interior
_vsf_interior:
		move.l     #0x000000BC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_style
_vsf_style:
		move.l     #0x000000C0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_color
_vsf_color:
		move.l     #0x000000C4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_perimeter
_vsf_perimeter:
		move.l     #0x000000C8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_udpat
_vsf_udpat:
		move.l     #0x000000CC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_updat
_vsf_updat:
		move.l     #0x000000D0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_color
_vs_color:
		move.l     #0x000000D4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vr_trnfm
_vr_trnfm:
		move.l     #0x000000D8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vro_cpyfm
_vro_cpyfm:
		move.l     #0x000000DC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vrt_cpyfm
_vrt_cpyfm:
		move.l     #0x000000E0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_get_pixel
_v_get_pixel:
		move.l     #0x000000E4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsin_mode
_vsin_mode:
		move.l     #0x000000E8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vrq_locator
_vrq_locator:
		move.l     #0x000000EC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_locator
_vsm_locator:
		move.l     #0x000000F0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vrq_valuator
_vrq_valuator:
		move.l     #0x000000F4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_valuator
_vsm_valuator:
		move.l     #0x000000F8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vrq_choice
_vrq_choice:
		move.l     #0x000000FC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_choice
_vsm_choice:
		move.l     #0x00000100,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vrq_string
_vrq_string:
		move.l     #0x00000104,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_string
_vsm_string:
		move.l     #0x00000108,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vex_timv
_vex_timv:
		move.l     #0x0000010C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_show_c
_v_show_c:
		move.l     #0x00000110,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_hide_c
_v_hide_c:
		move.l     #0x00000114,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_mouse
_vq_mouse:
		move.l     #0x00000118,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vex_butv
_vex_butv:
		move.l     #0x0000011C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vex_motv
_vex_motv:
		move.l     #0x00000120,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vex_curv
_vex_curv:
		move.l     #0x00000124,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_key_s
_vq_key_s:
		move.l     #0x00000128,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_extnd
_vq_extnd:
		move.l     #0x0000012C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vql_attributes
_vql_attributes:
		move.l     #0x00000130,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqm_attributes
_vqm_attributes:
		move.l     #0x00000134,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqf_attributes
_vqf_attributes:
		move.l     #0x00000138,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_attributes
_vqt_attributes:
		move.l     #0x0000013C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_extent
_vqt_extent:
		move.l     #0x00000140,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_width
_vqt_width:
		move.l     #0x00000144,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_name
_vqt_name:
		move.l     #0x00000148,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqin_mode
_vqin_mode:
		move.l     #0x0000014C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_fontinfo
_vqt_fontinfo:
		move.l     #0x00000150,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_scrninfo
_vq_scrninfo:
		move.l     #0x00000154,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_color
_vq_color:
		move.l     #0x00000158,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_cellarray
_vq_cellarray:
		move.l     #0x0000015C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_chcells
_vq_chcells:
		move.l     #0x00000160,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_exit_cur
_v_exit_cur:
		move.l     #0x00000164,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_enter_cur
_v_enter_cur:
		move.l     #0x00000168,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curup
_v_curup:
		move.l     #0x0000016C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curdown
_v_curdown:
		move.l     #0x00000170,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curright
_v_curright:
		move.l     #0x00000174,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curleft
_v_curleft:
		move.l     #0x00000178,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curhome
_v_curhome:
		move.l     #0x0000017C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_eeos
_v_eeos:
		move.l     #0x00000180,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_eeol
_v_eeol:
		move.l     #0x00000184,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curaddress
_v_curaddress:
		move.l     #0x00000188,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_curtext
_v_curtext:
		move.l     #0x0000018C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_rvon
_v_rvon:
		move.l     #0x00000190,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_rvoff
_v_rvoff:
		move.l     #0x00000194,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_curaddress
_vq_curaddress:
		move.l     #0x00000198,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_tabstatus
_vq_tabstatus:
		move.l     #0x0000019C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_hardcopy
_v_hardcopy:
		move.l     #0x000001A0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_dspcur
_v_dspcur:
		move.l     #0x000001A4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_rmcur
_v_rmcur:
		move.l     #0x000001A8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_form_adv
_v_form_adv:
		move.l     #0x000001AC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_clear_disp_list
_v_clear_disp_list:
		move.l     #0x000001B0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_scan
_vq_scan:
		move.l     #0x000001B4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_alpha_text
_v_alpha_text:
		move.l     #0x000001B8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_palette
_vs_palette:
		move.l     #0x000001BC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_sound
_v_sound:
		move.l     #0x000001C0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_mute
_vs_mute:
		move.l     #0x000001C4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vt_resolution
_vt_resolution:
		move.l     #0x000001C8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vt_axis
_vt_axis:
		move.l     #0x000001CC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vt_origin
_vt_origin:
		move.l     #0x000001D0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_tdimensions
_vq_tdimensions:
		move.l     #0x000001D4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vt_alignment
_vt_alignment:
		move.l     #0x000001D8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsp_film
_vsp_film:
		move.l     #0x000001DC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqp_filmname
_vqp_filmname:
		move.l     #0x000001E0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsc_expose
_vsc_expose:
		move.l     #0x000001E4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_meta_extents
_v_meta_extents:
		move.l     #0x000001E8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_write_meta
_v_write_meta:
		move.l     #0x000001EC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vm_pagesize
_vm_pagesize:
		move.l     #0x000001F0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vm_coords
_vm_coords:
		move.l     #0x000001F4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vm_filename
_vm_filename:
		move.l     #0x000001F8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_offset
_v_offset:
		move.l     #0x000001FC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_fontinit
_v_fontinit:
		move.l     #0x00000200,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_escape2000
_v_escape2000:
		move.l     #0x00000204,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_output_window
_v_output_window:
		move.l     #0x00000208,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bit_image
_v_bit_image:
		move.l     #0x0000020C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _fix31ToPixel
_fix31ToPixel:
		move.l     #0x00000210,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnprn
_v_opnprn:
		move.l     #0x00000214,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnmeta
_v_opnmeta:
		move.l     #0x00000218,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_devinfo
_vq_devinfo:
		move.l     #0x0000021C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_ext_devinfo
_vq_ext_devinfo:
		move.l     #0x00000220,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_calibrate
_vs_calibrate:
		move.l     #0x00000224,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_calibrate
_vq_calibrate:
		move.l     #0x00000228,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bez
_v_bez:
		move.l     #0x0000022C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bez_on
_v_bez_on:
		move.l     #0x00000230,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bez_off
_v_bez_off:
		move.l     #0x00000234,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bez_qual
_v_bez_qual:
		move.l     #0x00000238,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_bez_fill
_v_bez_fill:
		move.l     #0x0000023C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_ext_name
_vqt_ext_name:
		move.l     #0x00000240,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_char_index
_vqt_char_index:
		move.l     #0x00000244,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_isCharAvailable
_vqt_isCharAvailable:
		move.l     #0x00000248,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_xfntinfo
_vqt_xfntinfo:
		move.l     #0x0000024C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_name
_vst_name:
		move.l     #0x00000250,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_name_and_id
_vqt_name_and_id:
		move.l     #0x00000254,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_fontheader
_vqt_fontheader:
		move.l     #0x00000258,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_trackkern
_vqt_trackkern:
		move.l     #0x0000025C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_pairkern
_vqt_pairkern:
		move.l     #0x00000260,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_charmap
_vst_charmap:
		move.l     #0x00000264,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_kern
_vst_kern:
		move.l     #0x00000268,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_kern_offset
_vst_kern_offset:
		move.l     #0x0000026C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_getbitmap_info
_v_getbitmap_info:
		move.l     #0x00000270,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_f_extent
_vqt_f_extent:
		move.l     #0x00000274,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_real_extent
_vqt_real_extent:
		move.l     #0x00000278,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ftext
_v_ftext:
		move.l     #0x0000027C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ftext_offset
_v_ftext_offset:
		move.l     #0x00000280,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_getoutline
_v_getoutline:
		move.l     #0x00000284,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_arbpt32
_vst_arbpt32:
		move.l     #0x00000288,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_advance32
_vqt_advance32:
		move.l     #0x0000028C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_setsize32
_vst_setsize32:
		move.l     #0x00000290,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_skew
_vst_skew:
		move.l     #0x00000294,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_orient
_v_orient:
		move.l     #0x00000298,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_trays
_v_trays:
		move.l     #0x0000029C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_tray_names
_vq_tray_names:
		move.l     #0x000002A0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_page_size
_v_page_size:
		move.l     #0x000002A4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_page_name
_vq_page_name:
		move.l     #0x000002A8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_fg_color
_vst_fg_color:
		move.l     #0x000002AC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_fg_color
_vsf_fg_color:
		move.l     #0x000002B0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_fg_color
_vsl_fg_color:
		move.l     #0x000002B4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_fg_color
_vsm_fg_color:
		move.l     #0x000002B8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsr_fg_color
_vsr_fg_color:
		move.l     #0x000002BC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_bg_color
_vst_bg_color:
		move.l     #0x000002C0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_bg_color
_vsf_bg_color:
		move.l     #0x000002C4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsl_bg_color
_vsl_bg_color:
		move.l     #0x000002C8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsm_bg_color
_vsm_bg_color:
		move.l     #0x000002CC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsr_bg_color
_vsr_bg_color:
		move.l     #0x000002D0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_fg_color
_vqt_fg_color:
		move.l     #0x000002D4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqf_fg_color
_vqf_fg_color:
		move.l     #0x000002D8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vql_fg_color
_vql_fg_color:
		move.l     #0x000002DC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqm_fg_color
_vqm_fg_color:
		move.l     #0x000002E0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqr_fg_color
_vqr_fg_color:
		move.l     #0x000002E4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_bg_color
_vqt_bg_color:
		move.l     #0x000002E8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqf_bg_color
_vqf_bg_color:
		move.l     #0x000002EC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vql_bg_color
_vql_bg_color:
		move.l     #0x000002F0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqm_bg_color
_vqm_bg_color:
		move.l     #0x000002F4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqr_bg_color
_vqr_bg_color:
		move.l     #0x000002F8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_color2value
_v_color2value:
		move.l     #0x000002FC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_value2color
_v_value2color:
		move.l     #0x00000300,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_color2nearest
_v_color2nearest:
		move.l     #0x00000304,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_px_format
_vq_px_format:
		move.l     #0x00000308,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_ctab
_vs_ctab:
		move.l     #0x0000030C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_ctab_entry
_vs_ctab_entry:
		move.l     #0x00000310,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_dflt_ctab
_vs_dflt_ctab:
		move.l     #0x00000314,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_ctab
_vq_ctab:
		move.l     #0x00000318,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_ctab_entry
_vq_ctab_entry:
		move.l     #0x0000031C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_ctab_id
_vq_ctab_id:
		move.l     #0x00000320,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ctab_idx2vdi
_v_ctab_idx2vdi:
		move.l     #0x00000324,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ctab_vdi2idx
_v_ctab_vdi2idx:
		move.l     #0x00000328,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_ctab_idx2value
_v_ctab_idx2value:
		move.l     #0x0000032C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_get_ctab_id
_v_get_ctab_id:
		move.l     #0x00000330,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_dflt_ctab
_vq_dflt_ctab:
		move.l     #0x00000334,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_create_itab
_v_create_itab:
		move.l     #0x00000338,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_delete_itab
_v_delete_itab:
		move.l     #0x0000033C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vr_transfer_bits
_vr_transfer_bits:
		move.l     #0x00000340,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_hilite_color
_vs_hilite_color:
		move.l     #0x00000344,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_min_color
_vs_min_color:
		move.l     #0x00000348,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_max_color
_vs_max_color:
		move.l     #0x0000034C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_weight_color
_vs_weight_color:
		move.l     #0x00000350,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_hilite_color
_vq_hilite_color:
		move.l     #0x00000354,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_min_color
_vq_min_color:
		move.l     #0x00000358,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_max_color
_vq_max_color:
		move.l     #0x0000035C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_weight_color
_vq_weight_color:
		move.l     #0x00000360,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_document_info
_vs_document_info:
		move.l     #0x00000364,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_prn_scaling
_vq_prn_scaling:
		move.l     #0x00000368,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_open_bm
_v_open_bm:
		move.l     #0x0000036C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_resize_bm
_v_resize_bm:
		move.l     #0x00000370,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_get_outline
_v_get_outline:
		move.l     #0x00000374,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_track_offset
_vst_track_offset:
		move.l     #0x00000378,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_arbpt
_vst_arbpt:
		move.l     #0x0000037C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_advance
_vqt_advance:
		move.l     #0x00000380,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_setsize
_vst_setsize:
		move.l     #0x00000384,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vq_vgdos
_vq_vgdos:
		move.l     #0x00000388,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_width
_vst_width:
		move.l     #0x0000038C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_scratch
_vst_scratch:
		move.l     #0x00000390,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vst_error
_vst_error:
		move.l     #0x00000394,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_savecache
_v_savecache:
		move.l     #0x00000398,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_loadcache
_v_loadcache:
		move.l     #0x0000039C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_flushcache
_v_flushcache:
		move.l     #0x000003A0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_cachesize
_vqt_cachesize:
		move.l     #0x000003A4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_get_table
_vqt_get_table:
		move.l     #0x000003A8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vs_curaddress
_vs_curaddress:
		move.l     #0x000003AC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vsf_perimeter3
_vsf_perimeter3:
		move.l     #0x000003B0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_justified
_vqt_justified:
		move.l     #0x000003B4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnprnwrk
_v_opnprnwrk:
		move.l     #0x000003B8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_opnmatrixprn
_v_opnmatrixprn:
		move.l     #0x000003BC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_set_app_buff
_v_set_app_buff:
		move.l     #0x000003C0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _vqt_devinfo
_vqt_devinfo:
		move.l     #0x000003C4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_create_ctab
_v_create_ctab:
		move.l     #0x000003C8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_delete_ctab
_v_delete_ctab:
		move.l     #0x000003CC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl _v_setrgb
_v_setrgb:
		move.l     #0x000003D0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect

/* AES */
	.globl _aes
_aes:
		move.l     #0x00000000,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_init
_appl_init:
		move.l     #0x00000004,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_read
_appl_read:
		move.l     #0x00000008,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_write
_appl_write:
		move.l     #0x0000000C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_find
_appl_find:
		move.l     #0x00000010,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_search
_appl_search:
		move.l     #0x00000014,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_tplay
_appl_tplay:
		move.l     #0x00000018,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_trecord
_appl_trecord:
		move.l     #0x0000001C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_yield
_appl_yield:
		move.l     #0x00000020,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_exit
_appl_exit:
		move.l     #0x00000024,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_getinfo
_appl_getinfo:
		move.l     #0x00000028,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _appl_control
_appl_control:
		move.l     #0x0000002C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_keybd
_evnt_keybd:
		move.l     #0x00000030,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_button
_evnt_button:
		move.l     #0x00000034,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_mouse
_evnt_mouse:
		move.l     #0x00000038,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_mesag
_evnt_mesag:
		move.l     #0x0000003C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_timer
_evnt_timer:
		move.l     #0x00000040,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_event
_evnt_event:
		move.l     #0x00000044,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_multi
_evnt_multi:
		move.l     #0x00000048,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _evnt_dclick
_evnt_dclick:
		move.l     #0x0000004C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_bar
_menu_bar:
		move.l     #0x00000050,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_icheck
_menu_icheck:
		move.l     #0x00000054,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_ienable
_menu_ienable:
		move.l     #0x00000058,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_tnormal
_menu_tnormal:
		move.l     #0x0000005C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_text
_menu_text:
		move.l     #0x00000060,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_register
_menu_register:
		move.l     #0x00000064,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_unregister
_menu_unregister:
		move.l     #0x00000068,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_click
_menu_click:
		move.l     #0x0000006C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_attach
_menu_attach:
		move.l     #0x00000070,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_istart
_menu_istart:
		move.l     #0x00000074,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_popup
_menu_popup:
		move.l     #0x00000078,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _menu_settings
_menu_settings:
		move.l     #0x0000007C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_add
_objc_add:
		move.l     #0x00000080,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_delete
_objc_delete:
		move.l     #0x00000084,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_draw
_objc_draw:
		move.l     #0x00000088,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_find
_objc_find:
		move.l     #0x0000008C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_offset
_objc_offset:
		move.l     #0x00000090,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_order
_objc_order:
		move.l     #0x00000094,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_edit
_objc_edit:
		move.l     #0x00000098,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_change
_objc_change:
		move.l     #0x0000009C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_sysvar
_objc_sysvar:
		move.l     #0x000000A0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_do
_form_do:
		move.l     #0x000000A4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_dial
_form_dial:
		move.l     #0x000000A8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_alert
_form_alert:
		move.l     #0x000000AC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_error
_form_error:
		move.l     #0x000000B0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_center
_form_center:
		move.l     #0x000000B4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_keybd
_form_keybd:
		move.l     #0x000000B8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_button
_form_button:
		move.l     #0x000000BC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_rubbox
_graf_rubbox:
		move.l     #0x000000C0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_rubberbox
_graf_rubberbox:
		move.l     #0x000000C4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_dragbox
_graf_dragbox:
		move.l     #0x000000C8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_mbox
_graf_mbox:
		move.l     #0x000000CC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_movebox
_graf_movebox:
		move.l     #0x000000D0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_growbox
_graf_growbox:
		move.l     #0x000000D4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_shrinkbox
_graf_shrinkbox:
		move.l     #0x000000D8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_watchbox
_graf_watchbox:
		move.l     #0x000000DC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_slidebox
_graf_slidebox:
		move.l     #0x000000E0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_handle
_graf_handle:
		move.l     #0x000000E4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_mouse
_graf_mouse:
		move.l     #0x000000E8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_mkstate
_graf_mkstate:
		move.l     #0x000000EC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_multirubber
_graf_multirubber:
		move.l     #0x000000F0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _scrp_read
_scrp_read:
		move.l     #0x000000F4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _scrp_write
_scrp_write:
		move.l     #0x000000F8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fsel_input
_fsel_input:
		move.l     #0x000000FC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fsel_exinput
_fsel_exinput:
		move.l     #0x00000100,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fsel_boxinput
_fsel_boxinput:
		move.l     #0x00000104,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fslx_open
_fslx_open:
		move.l     #0x00000108,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fslx_close
_fslx_close:
		move.l     #0x0000010C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fslx_getnxtfile
_fslx_getnxtfile:
		move.l     #0x00000110,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fslx_evnt
_fslx_evnt:
		move.l     #0x00000114,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fslx_do
_fslx_do:
		move.l     #0x00000118,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fslx_set_flags
_fslx_set_flags:
		move.l     #0x0000011C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_create
_wind_create:
		move.l     #0x00000120,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_open
_wind_open:
		move.l     #0x00000124,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_close
_wind_close:
		move.l     #0x00000128,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_delete
_wind_delete:
		move.l     #0x0000012C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_get
_wind_get:
		move.l     #0x00000130,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_getQSB
_wind_getQSB:
		move.l     #0x00000134,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_set
_wind_set:
		move.l     #0x00000138,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_find
_wind_find:
		move.l     #0x0000013C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_update
_wind_update:
		move.l     #0x00000140,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_calc
_wind_calc:
		move.l     #0x00000144,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_new
_wind_new:
		move.l     #0x00000148,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _rsrc_load
_rsrc_load:
		move.l     #0x0000014C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _rsrc_free
_rsrc_free:
		move.l     #0x00000150,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _rsrc_gaddr
_rsrc_gaddr:
		move.l     #0x00000154,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _rsrc_saddr
_rsrc_saddr:
		move.l     #0x00000158,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _rsrc_obfix
_rsrc_obfix:
		move.l     #0x0000015C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _rsrc_rcfix
_rsrc_rcfix:
		move.l     #0x00000160,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_read
_shel_read:
		move.l     #0x00000164,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_write
_shel_write:
		move.l     #0x00000168,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_get
_shel_get:
		move.l     #0x0000016C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_put
_shel_put:
		move.l     #0x00000170,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_find
_shel_find:
		move.l     #0x00000174,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_envrn
_shel_envrn:
		move.l     #0x00000178,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _shel_help
_shel_help:
		move.l     #0x0000017C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_add
_fnts_add:
		move.l     #0x00000180,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_close
_fnts_close:
		move.l     #0x00000184,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_create
_fnts_create:
		move.l     #0x00000188,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_delete
_fnts_delete:
		move.l     #0x0000018C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_do
_fnts_do:
		move.l     #0x00000190,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_evnt
_fnts_evnt:
		move.l     #0x00000194,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_get_info
_fnts_get_info:
		move.l     #0x00000198,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_get_name
_fnts_get_name:
		move.l     #0x0000019C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_get_no_styles
_fnts_get_no_styles:
		move.l     #0x000001A0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_get_style
_fnts_get_style:
		move.l     #0x000001A4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_open
_fnts_open:
		move.l     #0x000001A8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_remove
_fnts_remove:
		move.l     #0x000001AC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _fnts_update
_fnts_update:
		move.l     #0x000001B0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_ascroll_to
_lbox_ascroll_to:
		move.l     #0x000001B4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_scroll_to
_lbox_scroll_to:
		move.l     #0x000001B8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_bscroll_to
_lbox_bscroll_to:
		move.l     #0x000001BC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_cnt_items
_lbox_cnt_items:
		move.l     #0x000001C0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_create
_lbox_create:
		move.l     #0x000001C4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_delete
_lbox_delete:
		move.l     #0x000001C8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_do
_lbox_do:
		move.l     #0x000001CC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_free_items
_lbox_free_items:
		move.l     #0x000001D0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_free_list
_lbox_free_list:
		move.l     #0x000001D4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_afirst
_lbox_get_afirst:
		move.l     #0x000001D8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_first
_lbox_get_first:
		move.l     #0x000001DC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_avis
_lbox_get_avis:
		move.l     #0x000001E0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_visible
_lbox_get_visible:
		move.l     #0x000001E4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_bentries
_lbox_get_bentries:
		move.l     #0x000001E8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_bfirst
_lbox_get_bfirst:
		move.l     #0x000001EC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_idx
_lbox_get_idx:
		move.l     #0x000001F0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_item
_lbox_get_item:
		move.l     #0x000001F4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_items
_lbox_get_items:
		move.l     #0x000001F8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_slct_idx
_lbox_get_slct_idx:
		move.l     #0x000001FC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_slct_item
_lbox_get_slct_item:
		move.l     #0x00000200,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_tree
_lbox_get_tree:
		move.l     #0x00000204,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_get_udata
_lbox_get_udata:
		move.l     #0x00000208,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_set_asldr
_lbox_set_asldr:
		move.l     #0x0000020C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_set_slider
_lbox_set_slider:
		move.l     #0x00000210,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_set_bentries
_lbox_set_bentries:
		move.l     #0x00000214,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_set_bsldr
_lbox_set_bsldr:
		move.l     #0x00000218,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_set_items
_lbox_set_items:
		move.l     #0x0000021C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _lbox_update
_lbox_update:
		move.l     #0x00000220,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_add_printers
_pdlg_add_printers:
		move.l     #0x00000224,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_add_sub_dialogs
_pdlg_add_sub_dialogs:
		move.l     #0x00000228,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_close
_pdlg_close:
		move.l     #0x0000022C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_create
_pdlg_create:
		move.l     #0x00000230,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_delete
_pdlg_delete:
		move.l     #0x00000234,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_dflt_settings
_pdlg_dflt_settings:
		move.l     #0x00000238,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_do
_pdlg_do:
		move.l     #0x0000023C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_evnt
_pdlg_evnt:
		move.l     #0x00000240,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_free_settings
_pdlg_free_settings:
		move.l     #0x00000244,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_get_setsize
_pdlg_get_setsize:
		move.l     #0x00000248,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_new_settings
_pdlg_new_settings:
		move.l     #0x0000024C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_open
_pdlg_open:
		move.l     #0x00000250,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_remove_printers
_pdlg_remove_printers:
		move.l     #0x00000254,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_remove_sub_dialogs
_pdlg_remove_sub_dialogs:
		move.l     #0x00000258,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_update
_pdlg_update:
		move.l     #0x0000025C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_use_settings
_pdlg_use_settings:
		move.l     #0x00000260,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _pdlg_validate_settings
_pdlg_validate_settings:
		move.l     #0x00000264,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_create
_edit_create:
		move.l     #0x00000268,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_buf
_edit_set_buf:
		move.l     #0x0000026C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_open
_edit_open:
		move.l     #0x00000270,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_close
_edit_close:
		move.l     #0x00000274,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_delete
_edit_delete:
		move.l     #0x00000278,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_cursor
_edit_cursor:
		move.l     #0x0000027C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_evnt
_edit_evnt:
		move.l     #0x00000280,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_buf
_edit_get_buf:
		move.l     #0x00000284,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_format
_edit_get_format:
		move.l     #0x00000288,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_colour
_edit_get_colour:
		move.l     #0x0000028C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_color
_edit_get_color:
		move.l     #0x00000290,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_font
_edit_get_font:
		move.l     #0x00000294,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_cursor
_edit_get_cursor:
		move.l     #0x00000298,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_dirty
_edit_get_dirty:
		move.l     #0x0000029C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_sel
_edit_get_sel:
		move.l     #0x000002A0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_get_scrollinfo
_edit_get_scrollinfo:
		move.l     #0x000002A4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_format
_edit_set_format:
		move.l     #0x000002A8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_colour
_edit_set_colour:
		move.l     #0x000002AC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_color
_edit_set_color:
		move.l     #0x000002B0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_font
_edit_set_font:
		move.l     #0x000002B4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_cursor
_edit_set_cursor:
		move.l     #0x000002B8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_resized
_edit_resized:
		move.l     #0x000002BC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_set_dirty
_edit_set_dirty:
		move.l     #0x000002C0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _edit_scroll
_edit_scroll:
		move.l     #0x000002C4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _EvntMulti
_EvntMulti:
		move.l     #0x000002C8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_wbutton
_form_wbutton:
		move.l     #0x000002CC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_xdial
_form_xdial:
		move.l     #0x000002D0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_xdo
_form_xdo:
		move.l     #0x000002D4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _form_xerr
_form_xerr:
		move.l     #0x000002D8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl __crystal
__crystal:
		move.l     #0x000002DC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_wwatchbox
_graf_wwatchbox:
		move.l     #0x000002E0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_xhandle
_graf_xhandle:
		move.l     #0x000002E4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_create
_wdlg_create:
		move.l     #0x000002E8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_open
_wdlg_open:
		move.l     #0x000002EC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_close
_wdlg_close:
		move.l     #0x000002F0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_delete
_wdlg_delete:
		move.l     #0x000002F4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_get_tree
_wdlg_get_tree:
		move.l     #0x000002F8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_get_edit
_wdlg_get_edit:
		move.l     #0x000002FC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_get_udata
_wdlg_get_udata:
		move.l     #0x00000300,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_get_handle
_wdlg_get_handle:
		move.l     #0x00000304,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_set_edit
_wdlg_set_edit:
		move.l     #0x00000308,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_set_tree
_wdlg_set_tree:
		move.l     #0x0000030C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_set_size
_wdlg_set_size:
		move.l     #0x00000310,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_set_iconify
_wdlg_set_iconify:
		move.l     #0x00000314,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_set_uniconify
_wdlg_set_uniconify:
		move.l     #0x00000318,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_evnt
_wdlg_evnt:
		move.l     #0x0000031C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wdlg_redraw
_wdlg_redraw:
		move.l     #0x00000320,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _wind_draw
_wind_draw:
		move.l     #0x00000324,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _scrp_clear
_scrp_clear:
		move.l     #0x00000328,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _objc_xedit
_objc_xedit:
		move.l     #0x0000032C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _graf_rubbbox
_graf_rubbbox:
		move.l     #0x00000330,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect

/* keytab */
	.globl _Akt_getKeyTab
_Akt_getKeyTab:
		move.l     #0x00000000,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getRelease
_Akt_getRelease:
		move.l     #0x00000004,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getEuro
_Akt_getEuro:
		move.l     #0x00000008,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpMaxNr
_Akt_getExpMaxNr:
		move.l     #0x0000000C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpMaxNr
_Akt_getImpMaxNr:
		move.l     #0x00000010,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpNameFromNr
_Akt_getExpNameFromNr:
		move.l     #0x00000014,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpNameFromNr
_Akt_getImpNameFromNr:
		move.l     #0x00000018,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpShortNameFromNr
_Akt_getExpShortNameFromNr:
		move.l     #0x0000001C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpShortNameFromNr
_Akt_getImpShortNameFromNr:
		move.l     #0x00000020,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpNrFromId
_Akt_getExpNrFromId:
		move.l     #0x00000024,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpNrFromId
_Akt_getImpNrFromId:
		move.l     #0x00000028,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpIdFromNr
_Akt_getExpIdFromNr:
		move.l     #0x0000002C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpIdFromNr
_Akt_getImpIdFromNr:
		move.l     #0x00000030,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpNrFromName
_Akt_getExpNrFromName:
		move.l     #0x00000034,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpNrFromName
_Akt_getImpNrFromName:
		move.l     #0x00000038,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_CharAtari2X
_Akt_CharAtari2X:
		move.l     #0x0000003C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_CharX2Atari
_Akt_CharX2Atari:
		move.l     #0x00000040,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockAtari2X
_Akt_BlockAtari2X:
		move.l     #0x00000044,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockX2Atari
_Akt_BlockX2Atari:
		move.l     #0x00000048,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_StringAtari2X
_Akt_StringAtari2X:
		move.l     #0x0000004C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_StringX2Atari
_Akt_StringX2Atari:
		move.l     #0x00000050,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_CharX2Unicode
_Akt_CharX2Unicode:
		move.l     #0x00000054,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_CharUnicode2X
_Akt_CharUnicode2X:
		move.l     #0x00000058,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockX2Unicode
_Akt_BlockX2Unicode:
		move.l     #0x0000005C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockUnicode2X
_Akt_BlockUnicode2X:
		move.l     #0x00000060,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_StringX2Unicode
_Akt_StringX2Unicode:
		move.l     #0x00000064,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_popExpName
_Akt_popExpName:
		move.l     #0x00000068,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_popImpName
_Akt_popImpName:
		move.l     #0x0000006C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_chooseExpNr
_Akt_chooseExpNr:
		move.l     #0x00000070,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_chooseImpNr
_Akt_chooseImpNr:
		move.l     #0x00000074,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getExpMinNr
_Akt_getExpMinNr:
		move.l     #0x00000078,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getImpMinNr
_Akt_getImpMinNr:
		move.l     #0x0000007C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockXUtf2Unicode
_Akt_BlockXUtf2Unicode:
		move.l     #0x00000080,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockUnicode2XUtf
_Akt_BlockUnicode2XUtf:
		move.l     #0x00000084,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_StringXUtf2Unicode
_Akt_StringXUtf2Unicode:
		move.l     #0x00000088,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockXUtf2U2XUtf
_Akt_BlockXUtf2U2XUtf:
		move.l     #0x0000008C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_BlockXUtf2XUtf
_Akt_BlockXUtf2XUtf:
		move.l     #0x00000090,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_StringXUtf2U2XUtf
_Akt_StringXUtf2U2XUtf:
		move.l     #0x00000094,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_StringXUtf2XUtf
_Akt_StringXUtf2XUtf:
		move.l     #0x00000098,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
		.globl _Akt_getInfoShort
_Akt_getInfoShort:
		move.l     #0x0000009C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_getInfoString
_Akt_getInfoString:
		move.l     #0x000000A0,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_CharXUtf2Unicode
_Akt_CharXUtf2Unicode:
		move.l     #0x000000A4,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl _Akt_CharUnicode2XUtf
_Akt_CharUnicode2XUtf:
		move.l     #0x000000A8,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.ENDC

/* Multi-threading AES */
	.globl _mt_appl_init
_mt_appl_init:
		move.l     #0x00000000,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_read
_mt_appl_read:
		move.l     #0x00000004,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_write
_mt_appl_write:
		move.l     #0x00000008,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_find
_mt_appl_find:
		move.l     #0x0000000C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_search
_mt_appl_search:
		move.l     #0x00000010,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_tplay
_mt_appl_tplay:
		move.l     #0x00000014,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_trecord
_mt_appl_trecord:
		move.l     #0x00000018,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_yield
_mt_appl_yield:
		move.l     #0x0000001C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_exit
_mt_appl_exit:
		move.l     #0x00000020,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_getinfo
_mt_appl_getinfo:
		move.l     #0x00000024,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_appl_control
_mt_appl_control:
		move.l     #0x00000028,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_keybd
_mt_evnt_keybd:
		move.l     #0x00000334,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_button
_mt_evnt_button:
		move.l     #0x0000002C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_mouse
_mt_evnt_mouse:
		move.l     #0x00000030,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_mesag
_mt_evnt_mesag:
		move.l     #0x00000034,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_timer
_mt_evnt_timer:
		move.l     #0x00000038,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_event
_mt_evnt_event:
		move.l     #0x0000003C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_multi
_mt_evnt_multi:
		move.l     #0x00000040,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_evnt_dclick
_mt_evnt_dclick:
		move.l     #0x00000044,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_bar
_mt_menu_bar:
		move.l     #0x00000048,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_icheck
_mt_menu_icheck:
		move.l     #0x0000004C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_ienable
_mt_menu_ienable:
		move.l     #0x00000050,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_tnormal
_mt_menu_tnormal:
		move.l     #0x00000054,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_text
_mt_menu_text:
		move.l     #0x00000058,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_register
_mt_menu_register:
		move.l     #0x0000005C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_unregister
_mt_menu_unregister:
		move.l     #0x00000060,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_click
_mt_menu_click:
		move.l     #0x00000064,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_attach
_mt_menu_attach:
		move.l     #0x00000068,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_istart
_mt_menu_istart:
		move.l     #0x0000006C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_popup
_mt_menu_popup:
		move.l     #0x00000070,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_menu_settings
_mt_menu_settings:
		move.l     #0x00000074,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_add
_mt_objc_add:
		move.l     #0x00000078,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_delete
_mt_objc_delete:
		move.l     #0x0000007C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_draw
_mt_objc_draw:
		move.l     #0x00000338,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_find
_mt_objc_find:
		move.l     #0x00000080,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_offset
_mt_objc_offset:
		move.l     #0x00000084,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_order
_mt_objc_order:
		move.l     #0x00000088,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_edit
_mt_objc_edit:
		move.l     #0x0000008C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_change
_mt_objc_change:
		move.l     #0x00000090,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_sysvar
_mt_objc_sysvar:
		move.l     #0x00000094,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_do
_mt_form_do:
		move.l     #0x00000098,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_dial
_mt_form_dial:
		move.l     #0x0000009C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_alert
_mt_form_alert:
		move.l     #0x000000A0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_error
_mt_form_error:
		move.l     #0x000000A4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_center
_mt_form_center:
		move.l     #0x000000A8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_keybd
_mt_form_keybd:
		move.l     #0x000000AC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_button
_mt_form_button:
		move.l     #0x000000B0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_rubbox
_mt_graf_rubbox:
		move.l     #0x000000B4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_rubberbox
_mt_graf_rubberbox:
		move.l     #0x000000B8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_dragbox
_mt_graf_dragbox:
		move.l     #0x000000BC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_mbox
_mt_graf_mbox:
		move.l     #0x000000C0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_movebox
_mt_graf_movebox:
		move.l     #0x000000C4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_growbox
_mt_graf_growbox:
		move.l     #0x000000C8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_shrinkbox
_mt_graf_shrinkbox:
		move.l     #0x000000CC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_watchbox
_mt_graf_watchbox:
		move.l     #0x000000D0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_slidebox
_mt_graf_slidebox:
		move.l     #0x000000D4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_handle
_mt_graf_handle:
		move.l     #0x000000D8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_mouse
_mt_graf_mouse:
		move.l     #0x000000DC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_mkstate
_mt_graf_mkstate:
		move.l     #0x000000E0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_multirubber
_mt_graf_multirubber:
		move.l     #0x000000E4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_scrp_read
_mt_scrp_read:
		move.l     #0x000000E8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_scrp_write
_mt_scrp_write:
		move.l     #0x000000EC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fsel_input
_mt_fsel_input:
		move.l     #0x000000F0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fsel_exinput
_mt_fsel_exinput:
		move.l     #0x000000F4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fsel_boxinput
_mt_fsel_boxinput:
		move.l     #0x000000F8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fslx_open
_mt_fslx_open:
		move.l     #0x000000FC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fslx_close
_mt_fslx_close:
		move.l     #0x00000100,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fslx_getnxtfile
_mt_fslx_getnxtfile:
		move.l     #0x00000104,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fslx_evnt
_mt_fslx_evnt:
		move.l     #0x00000108,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fslx_do
_mt_fslx_do:
		move.l     #0x0000010C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fslx_set_flags
_mt_fslx_set_flags:
		move.l     #0x00000110,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_create
_mt_wind_create:
		move.l     #0x0000033C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_open
_mt_wind_open:
		move.l     #0x00000114,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_close
_mt_wind_close:
		move.l     #0x00000118,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_delete
_mt_wind_delete:
		move.l     #0x0000011C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_get
_mt_wind_get:
		move.l     #0x00000120,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_getQSB
_mt_wind_getQSB:
		move.l     #0x00000124,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_set
_mt_wind_set:
		move.l     #0x00000128,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_find
_mt_wind_find:
		move.l     #0x0000012C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_update
_mt_wind_update:
		move.l     #0x00000130,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_calc
_mt_wind_calc:
		move.l     #0x00000134,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_new
_mt_wind_new:
		move.l     #0x00000138,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_rsrc_load
_mt_rsrc_load:
		move.l     #0x0000013C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_rsrc_free
_mt_rsrc_free:
		move.l     #0x00000140,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_rsrc_gaddr
_mt_rsrc_gaddr:
		move.l     #0x00000144,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_rsrc_saddr
_mt_rsrc_saddr:
		move.l     #0x00000148,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_rsrc_obfix
_mt_rsrc_obfix:
		move.l     #0x0000014C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_rsrc_rcfix
_mt_rsrc_rcfix:
		move.l     #0x00000150,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_read
_mt_shel_read:
		move.l     #0x00000154,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_write
_mt_shel_write:
		move.l     #0x00000158,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_get
_mt_shel_get:
		move.l     #0x0000015C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_put
_mt_shel_put:
		move.l     #0x00000160,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_find
_mt_shel_find:
		move.l     #0x00000164,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_envrn
_mt_shel_envrn:
		move.l     #0x00000168,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_shel_help
_mt_shel_help:
		move.l     #0x0000016C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_add
_mt_fnts_add:
		move.l     #0x00000170,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_close
_mt_fnts_close:
		move.l     #0x00000174,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_create
_mt_fnts_create:
		move.l     #0x00000178,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_delete
_mt_fnts_delete:
		move.l     #0x0000017C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_do
_mt_fnts_do:
		move.l     #0x00000180,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_evnt
_mt_fnts_evnt:
		move.l     #0x00000184,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_get_info
_mt_fnts_get_info:
		move.l     #0x00000188,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_get_name
_mt_fnts_get_name:
		move.l     #0x0000018C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_get_no_styles
_mt_fnts_get_no_styles:
		move.l     #0x00000190,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_get_style
_mt_fnts_get_style:
		move.l     #0x00000194,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_open
_mt_fnts_open:
		move.l     #0x00000198,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_remove
_mt_fnts_remove:
		move.l     #0x0000019C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_fnts_update
_mt_fnts_update:
		move.l     #0x000001A0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_ascroll_to
_mt_lbox_ascroll_to:
		move.l     #0x000001A4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_scroll_to
_mt_lbox_scroll_to:
		move.l     #0x000001A8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_bscroll_to
_mt_lbox_bscroll_to:
		move.l     #0x000001AC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_cnt_items
_mt_lbox_cnt_items:
		move.l     #0x000001B0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_create
_mt_lbox_create:
		move.l     #0x000001B4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_delete
_mt_lbox_delete:
		move.l     #0x000001B8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_do
_mt_lbox_do:
		move.l     #0x000001BC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_free_items
_mt_lbox_free_items:
		move.l     #0x000001C0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_free_list
_mt_lbox_free_list:
		move.l     #0x000001C4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_afirst
_mt_lbox_get_afirst:
		move.l     #0x000001C8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_first
_mt_lbox_get_first:
		move.l     #0x000001CC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_avis
_mt_lbox_get_avis:
		move.l     #0x000001D0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_visible
_mt_lbox_get_visible:
		move.l     #0x000001D4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_bentries
_mt_lbox_get_bentries:
		move.l     #0x000001D8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_bfirst
_mt_lbox_get_bfirst:
		move.l     #0x000001DC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_idx
_mt_lbox_get_idx:
		move.l     #0x000001E0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_item
_mt_lbox_get_item:
		move.l     #0x000001E4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_items
_mt_lbox_get_items:
		move.l     #0x000001E8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_slct_idx
_mt_lbox_get_slct_idx:
		move.l     #0x000001EC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_slct_item
_mt_lbox_get_slct_item:
		move.l     #0x000001F0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_tree
_mt_lbox_get_tree:
		move.l     #0x000001F4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_get_udata
_mt_lbox_get_udata:
		move.l     #0x000001F8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_set_asldr
_mt_lbox_set_asldr:
		move.l     #0x000001FC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_set_slider
_mt_lbox_set_slider:
		move.l     #0x00000200,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_set_bentries
_mt_lbox_set_bentries:
		move.l     #0x00000204,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_set_bsldr
_mt_lbox_set_bsldr:
		move.l     #0x00000208,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_set_items
_mt_lbox_set_items:
		move.l     #0x0000020C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_lbox_update
_mt_lbox_update:
		move.l     #0x00000210,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_add_printers
_mt_pdlg_add_printers:
		move.l     #0x00000214,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_add_sub_dialogs
_mt_pdlg_add_sub_dialogs:
		move.l     #0x00000218,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_close
_mt_pdlg_close:
		move.l     #0x0000021C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_create
_mt_pdlg_create:
		move.l     #0x00000220,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_delete
_mt_pdlg_delete:
		move.l     #0x00000224,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_dflt_settings
_mt_pdlg_dflt_settings:
		move.l     #0x00000228,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_do
_mt_pdlg_do:
		move.l     #0x0000022C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_evnt
_mt_pdlg_evnt:
		move.l     #0x00000230,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_free_settings
_mt_pdlg_free_settings:
		move.l     #0x00000234,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_get_setsize
_mt_pdlg_get_setsize:
		move.l     #0x00000238,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_new_settings
_mt_pdlg_new_settings:
		move.l     #0x0000023C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_open
_mt_pdlg_open:
		move.l     #0x00000240,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_remove_printers
_mt_pdlg_remove_printers:
		move.l     #0x00000244,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_remove_sub_dialogs
_mt_pdlg_remove_sub_dialogs:
		move.l     #0x00000248,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_update
_mt_pdlg_update:
		move.l     #0x0000024C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_use_settings
_mt_pdlg_use_settings:
		move.l     #0x00000250,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_pdlg_validate_settings
_mt_pdlg_validate_settings:
		move.l     #0x00000254,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_create
_mt_edit_create:
		move.l     #0x00000258,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_buf
_mt_edit_set_buf:
		move.l     #0x0000025C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_open
_mt_edit_open:
		move.l     #0x00000260,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_close
_mt_edit_close:
		move.l     #0x00000264,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_delete
_mt_edit_delete:
		move.l     #0x00000268,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_cursor
_mt_edit_cursor:
		move.l     #0x0000026C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_evnt
_mt_edit_evnt:
		move.l     #0x00000270,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_buf
_mt_edit_get_buf:
		move.l     #0x00000274,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_format
_mt_edit_get_format:
		move.l     #0x00000278,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_colour
_mt_edit_get_colour:
		move.l     #0x0000027C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_color
_mt_edit_get_color:
		move.l     #0x00000280,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_font
_mt_edit_get_font:
		move.l     #0x00000284,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_cursor
_mt_edit_get_cursor:
		move.l     #0x00000288,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_dirty
_mt_edit_get_dirty:
		move.l     #0x0000028C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_sel
_mt_edit_get_sel:
		move.l     #0x00000290,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_get_scrollinfo
_mt_edit_get_scrollinfo:
		move.l     #0x00000294,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_format
_mt_edit_set_format:
		move.l     #0x00000298,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_colour
_mt_edit_set_colour:
		move.l     #0x0000029C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_color
_mt_edit_set_color:
		move.l     #0x000002A0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_font
_mt_edit_set_font:
		move.l     #0x000002A4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_cursor
_mt_edit_set_cursor:
		move.l     #0x000002A8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_resized
_mt_edit_resized:
		move.l     #0x000002AC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_set_dirty
_mt_edit_set_dirty:
		move.l     #0x000002B0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_edit_scroll
_mt_edit_scroll:
		move.l     #0x000002B4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_EvntMulti
_mt_EvntMulti:
		move.l     #0x000002B8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_wbutton
_mt_form_wbutton:
		move.l     #0x000002BC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_xdial
_mt_form_xdial:
		move.l     #0x000002C0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_xdo
_mt_form_xdo:
		move.l     #0x000002C4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_form_xerr
_mt_form_xerr:
		move.l     #0x000002C8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_wwatchbox
_mt_graf_wwatchbox:
		move.l     #0x000002CC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_xhandle
_mt_graf_xhandle:
		move.l     #0x000002D0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_create
_mt_wdlg_create:
		move.l     #0x000002D4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_open
_mt_wdlg_open:
		move.l     #0x000002D8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_close
_mt_wdlg_close:
		move.l     #0x000002DC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_delete
_mt_wdlg_delete:
		move.l     #0x000002E0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_get_tree
_mt_wdlg_get_tree:
		move.l     #0x000002E4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_get_edit
_mt_wdlg_get_edit:
		move.l     #0x000002E8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_get_udata
_mt_wdlg_get_udata:
		move.l     #0x000002EC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_get_handle
_mt_wdlg_get_handle:
		move.l     #0x000002F0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_set_edit
_mt_wdlg_set_edit:
		move.l     #0x000002F4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_set_tree
_mt_wdlg_set_tree:
		move.l     #0x000002F8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_set_size
_mt_wdlg_set_size:
		move.l     #0x000002FC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_set_iconify
_mt_wdlg_set_iconify:
		move.l     #0x00000300,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_set_uniconify
_mt_wdlg_set_uniconify:
		move.l     #0x00000304,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_evnt
_mt_wdlg_evnt:
		move.l     #0x00000308,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wdlg_redraw
_mt_wdlg_redraw:
		move.l     #0x0000030C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_wind_draw
_mt_wind_draw:
		move.l     #0x00000310,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_scrp_clear
_mt_scrp_clear:
		move.l     #0x00000314,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_objc_xedit
_mt_objc_xedit:
		move.l     #0x00000318,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl _mt_graf_rubbbox
_mt_graf_rubbbox:
		move.l     #0x0000031C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect

	.data

	.globl _errno
_errno: dc.l 0
	.globl __FilSysVec
__FilSysVec:
	dc.l 0
