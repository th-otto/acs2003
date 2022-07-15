/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Startup code for modules                              */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

	.globl ACSblk
	.xref ACSinit

WITH_EXTENSIONS = 0

	.text

/*
 * ACSmod header structure
 */
compiler:
	clr.w      -(a7)
	trap       #1
	dc.l       0x41435339    /* magic2 */
init_modul:
	dc.l       ACSinit       /* entry */
ACSblk:
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
	.globl Abp_create
Abp_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl Abp_delete
Abp_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl Abp_start
Abp_start:
		move.l     #0x00000008,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl Abp_end
Abp_end:
		move.l     #0x0000000C,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl Abp_mfdb2img
Abp_mfdb2img:
		move.l     #0x00000010,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
	.globl Abp_img2mfdb
Abp_img2mfdb:
		move.l     #0x00000014,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect

/* config */
	.globl Acfg_create
Acfg_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra.s      indirect
	.globl Acfg_delete
Acfg_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra.s      indirect
	.globl Acfg_clear
Acfg_clear:
		move.l     #0x00000008,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra.s      indirect
	.globl Acfg_clearAllGroups
Acfg_clearAllGroups:
		move.l     #0x0000000C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_clearGroup
Acfg_clearGroup:
		move.l     #0x00000010,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_load
Acfg_load:
		move.l     #0x00000014,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_save
Acfg_save:
		move.l     #0x00000018,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_isChanged
Acfg_isChanged:
		move.l     #0x0000001C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_getValue
Acfg_getValue:
		move.l     #0x00000020,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_setValue
Acfg_setValue:
		move.l     #0x00000024,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_clearValue
Acfg_clearValue:
		move.l     #0x00000028,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_getChar
Acfg_getChar:
		move.l     #0x0000002C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_setChar
Acfg_setChar:
		move.l     #0x00000030,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_getLong
Acfg_getLong:
		move.l     #0x00000034,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_setLong
Acfg_setLong:
		move.l     #0x00000038,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_getString
Acfg_getString:
		move.l     #0x0000003C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_getBool
Acfg_getBool:
		move.l     #0x00000040,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_setBool
Acfg_setBool:
		move.l     #0x00000044,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_clearHeader
Acfg_clearHeader:
		move.l     #0x00000048,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_headAnzahl
Acfg_headAnzahl:
		move.l     #0x0000004C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_setHeader
Acfg_setHeader:
		move.l     #0x00000050,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_getHeader
Acfg_getHeader:
		move.l     #0x00000054,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_grpAnzahl
Acfg_grpAnzahl:
		move.l     #0x00000058,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_grpName
Acfg_grpName:
		move.l     #0x0000005C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_strAnzahl
Acfg_strAnzahl:
		move.l     #0x00000060,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_strName
Acfg_strName:
		move.l     #0x00000064,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_strValue
Acfg_strValue:
		move.l     #0x00000068,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_strIsComment
Acfg_strIsComment:
		move.l     #0x0000006C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_isCfgfile
Acfg_isCfgfile:
		move.l     #0x00000070,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_createInfo
Acfg_createInfo:
		move.l     #0x00000074,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_deleteInfo
Acfg_deleteInfo:
		move.l     #0x00000078,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_setInfo
Acfg_setInfo:
		move.l     #0x0000007C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_getInfo
Acfg_getInfo:
		move.l     #0x00000080,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_copyInfo
Acfg_copyInfo:
		move.l     #0x00000084,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_flags
Acfg_flags:
		move.l     #0x00000088,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_isGroupPresent
Acfg_isGroupPresent:
		move.l     #0x0000008C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_isStringPresent
Acfg_isStringPresent:
		move.l     #0x00000090,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl Acfg_getDouble
Acfg_getDouble:
		move.l     #0x00000094,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
	.globl Acfg_setDouble
Acfg_setDouble:
		move.l     #0x00000098,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.ENDC

/* character */
	.globl Ach_tolower
Ach_tolower:
		move.l     #0x00000000,-(a7)
		move.l     funcAch(pc),-(a7)
		bra        indirect
	.globl Ach_toupper
Ach_toupper:
		move.l     #0x00000004,-(a7)
		move.l     funcAch(pc),-(a7)
		bra        indirect
	.globl Ach_isWhite
Ach_isWhite:
		move.l     #0x00000008,-(a7)
		move.l     funcAch(pc),-(a7)
		bra        indirect

/* selection */
	.globl Adr_box
Adr_box:
		move.l     #0x00000000,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl Adr_drag
Adr_drag:
		move.l     #0x00000004,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl Adr_next
Adr_next:
		move.l     #0x00000008,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl Adr_add
Adr_add:
		move.l     #0x0000000C,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl Adr_del
Adr_del:
		move.l     #0x00000010,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl Adr_unselect
Adr_unselect:
		move.l     #0x00000014,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
	.globl Adr_start
Adr_start:
		move.l     #0x00000018,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect

/* event */
	.globl Aev_quit
Aev_quit:
		move.l     #0x00000000,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl Aev_release
Aev_release:
		move.l     #0x00000004,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl Aev_mess
Aev_mess:
		move.l     #0x00000008,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl Aev_unhidepointer
Aev_unhidepointer:
		move.l     #0x0000000C,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl Aev_DhstAdd
Aev_DhstAdd:
		move.l     #0x00000010,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl Aev_DhstSaved
Aev_DhstSaved:
		move.l     #0x00000014,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
	.globl Aev_WmRedraw
Aev_WmRedraw:
		move.l     #0x00000018,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect

/* file utilities */
	.globl Af_cfgfile
Af_cfgfile:
		move.l     #0x00000000,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_select
Af_select:
		move.l     #0x00000004,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_2drv
Af_2drv:
		move.l     #0x00000008,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_2path
Af_2path:
		move.l     #0x0000000C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_2name
Af_2name:
		move.l     #0x00000010,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_2fullname
Af_2fullname:
		move.l     #0x00000014,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_2ext
Af_2ext:
		move.l     #0x00000018,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_buildname
Af_buildname:
		move.l     #0x0000001C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_length
Af_length:
		move.l     #0x00000020,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_first_fsel
Af_first_fsel:
		move.l     #0x00000024,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_next_fsel
Af_next_fsel:
		move.l     #0x00000028,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_first
Af_first:
		move.l     #0x0000002C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_next
Af_next:
		move.l     #0x00000030,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_readdir
Af_readdir:
		move.l     #0x00000034,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_freedir
Af_freedir:
		move.l     #0x00000038,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_fileselect
Af_fileselect:
		move.l     #0x0000003C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_quote
Af_quote:
		move.l     #0x00000040,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_unquote
Af_unquote:
		move.l     #0x00000044,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl Af_chgExt
Af_chgExt:
		move.l     #0x00000048,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
	.globl Af_pathconf
Af_pathconf:
		move.l     #0x0000004C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.ENDC

/* icons */
	.globl Aic_create
Aic_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAic(pc),-(a7)
		bra        indirect
	.globl Aic_delete
Aic_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAic(pc),-(a7)
		bra        indirect

/* images */
	.globl Aim_create
Aim_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAim(pc),-(a7)
		bra        indirect
	.globl Aim_delete
Aim_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAim(pc),-(a7)
		bra        indirect

/* lists */
	.globl Alu_create
Alu_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl Alu_delete
Alu_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl As_create
As_create:
		move.l     #0x00000008,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl As_delete
As_delete:
		move.l     #0x0000000C,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl Aqu_create
Aqu_create:
		move.l     #0x00000010,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl Aqu_delete
Aqu_delete:
		move.l     #0x00000014,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl Alu_ptrCmp
Alu_ptrCmp:
		move.l     #0x00000018,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl Alu_longCmp
Alu_longCmp:
		move.l     #0x0000001C,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl Alu_intCmp
Alu_intCmp:
		move.l     #0x00000020,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl Alu_charCmp
Alu_charCmp:
		move.l     #0x00000024,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl Alu_strCmp
Alu_strCmp:
		move.l     #0x00000028,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
	.globl Alu_striCmp
Alu_striCmp:
		move.l     #0x0000002C,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.ENDC

/* menus */
	.globl Ame_namefix
Ame_namefix:
		move.l     #0x00000000,-(a7)
		move.l     funcAme(pc),-(a7)
		bra        indirect
	.globl Ame_popup
Ame_popup:
		move.l     #0x00000004,-(a7)
		move.l     funcAme(pc),-(a7)
		bra        indirect

/* mouse */
	.globl Amo_new
Amo_new:
		move.l     #0x00000000,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect
	.globl Amo_busy
Amo_busy:
		move.l     #0x00000004,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect
	.globl Amo_unbusy
Amo_unbusy:
		move.l     #0x00000008,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect
	.globl Amo_hide
Amo_hide:
		move.l     #0x0000000C,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect
	.globl Amo_show
Amo_show:
		move.l     #0x00000010,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect

/* objects */
	.globl Aob_create
Aob_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_delete
Aob_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_fix
Aob_fix:
		move.l     #0x00000008,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_offset
Aob_offset:
		move.l     #0x0000000C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_save
Aob_save:
		move.l     #0x00000010,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_restore
Aob_restore:
		move.l     #0x00000014,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_watch
Aob_watch:
		move.l     #0x00000018,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_findflag
Aob_findflag:
		move.l     #0x0000001C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_alias
Aob_alias:
		move.l     #0x00000020,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_up
Aob_up:
		move.l     #0x00000024,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_icon
Aob_icon:
		move.l     #0x00000028,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_puttext
Aob_puttext:
		move.l     #0x0000002C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_gettext
Aob_gettext:
		move.l     #0x00000030,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_within
Aob_within:
		move.l     #0x00000034,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_printf
Aob_printf:
		move.l     #0x00000038,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_scanf
Aob_scanf:
		move.l     #0x0000003C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_flags
Aob_flags:
		move.l     #0x00000040,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_state
Aob_state:
		move.l     #0x00000044,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_service
Aob_service:
		move.l     #0x00000048,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_visible
Aob_visible:
		move.l     #0x0000004C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
	.globl Aob_count
Aob_count:
		move.l     #0x00000050,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl Aob_help
Aob_help:
		move.l     #0x00000054,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.ENDC


/* clipboard */
	.globl Ascrp_clear
Ascrp_clear:
		move.l     #0x00000000,-(a7)
		move.l     funcAscrp(pc),-(a7)
		bra        indirect
	.globl Ascrp_get
Ascrp_get:
		move.l     #0x00000004,-(a7)
		move.l     funcAscrp(pc),-(a7)
		bra        indirect
	.globl Ascrp_put
Ascrp_put:
		move.l     #0x00000008,-(a7)
		move.l     funcAscrp(pc),-(a7)
		bra        indirect

/* shell */
	.globl Ash_prog
Ash_prog:
		move.l     #0x00000000,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_error
Ash_error:
		move.l     #0x00000004,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_getcookie
Ash_getcookie:
		move.l     #0x00000008,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_getenv
Ash_getenv:
		move.l     #0x0000000C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_nextdd
Ash_nextdd:
		move.l     #0x00000010,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_sendall
Ash_sendall:
		move.l     #0x00000014,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_CallEdDI
Ash_CallEdDI:
		move.l     #0x00000018,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_NVDICookie
Ash_NVDICookie:
		move.l     #0x0000001C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_NVDIVersion
Ash_NVDIVersion:
		move.l     #0x00000020,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_NVDIDatum
Ash_NVDIDatum:
		move.l     #0x00000024,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_thermometer
Ash_thermometer:
		move.l     #0x00000028,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_fileselect
Ash_fileselect:
		move.l     #0x0000002C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_font
Ash_font:
		move.l     #0x00000030,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_print
Ash_print:
		move.l     #0x00000034,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_gettimer
Ash_gettimer:
		move.l     #0x00000038,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_printSetIcon
Ash_printSetIcon:
		move.l     #0x0000003C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_fontSetIcon
Ash_fontSetIcon:
		move.l     #0x00000040,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_fileSetIcon
Ash_fileSetIcon:
		move.l     #0x00000044,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_getOSHeader
Ash_getOSHeader:
		move.l     #0x00000048,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_getMagiC
Ash_getMagiC:
		move.l     #0x0000004C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_getNAES
Ash_getNAES:
		move.l     #0x00000050,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_getMagiCVersion
Ash_getMagiCVersion:
		move.l     #0x00000054,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_getMagiCAESVars
Ash_getMagiCAESVars:
		move.l     #0x00000058,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl Ash_cmdParsen
Ash_cmdParsen:
		move.l     #0x0000005C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
	.globl Ash_sendmsg
Ash_sendmsg:
		move.l     #0x00000060,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.ENDC

/* strings */
	.globl Ast_create
Ast_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_delete
Ast_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_tolower
Ast_tolower:
		move.l     #0x00000008,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_toupper
Ast_toupper:
		move.l     #0x0000000C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_ltrim
Ast_ltrim:
		move.l     #0x00000010,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_rtrim
Ast_rtrim:
		move.l     #0x00000014,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_alltrim
Ast_alltrim:
		move.l     #0x00000018,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_cmp
Ast_cmp:
		move.l     #0x0000001C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_icmp
Ast_icmp:
		move.l     #0x00000020,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_isEmpty
Ast_isEmpty:
		move.l     #0x00000024,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_add
Ast_add:
		move.l     #0x00000028,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_adl
Ast_adl:
		move.l     #0x0000002C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_adr
Ast_adr:
		move.l     #0x00000030,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_adc
Ast_adc:
		move.l     #0x00000034,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_filter
Ast_filter:
		move.l     #0x00000038,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_count
Ast_count:
		move.l     #0x0000003C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_fcmp
Ast_fcmp:
		move.l     #0x00000040,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_ncmp
Ast_ncmp:
		move.l     #0x00000044,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_incmp
Ast_incmp:
		move.l     #0x00000048,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
	.globl Ast_istr
Ast_istr:
		move.l     #0x0000004C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect

/* tedinfos */
	.globl Ate_create
Ate_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAte(pc),-(a7)
		bra        indirect
	.globl Ate_delete
Ate_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAte(pc),-(a7)
		bra        indirect

/* user objects */
	.globl Auo_ftext
Auo_ftext:
		move.l     #0x00000000,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl Auo_string
Auo_string:
		move.l     #0x00000004,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl Auo_cycle
Auo_cycle:
		move.l     #0x00000008,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl Auo_picture
Auo_picture:
		move.l     #0x0000000C,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl Auo_boxed
Auo_boxed:
		move.l     #0x00000010,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl Auo_wislider
Auo_wislider:
		pea        20
		move.l     funcAuo(pc),-(a7)
		bra        indirect
	.globl Auo_editor
Auo_editor:
		pea        24
		move.l     funcAuo(pc),-(a7)
		bra        indirect
		.ENDC

/* user services */
	.globl Aus_create
Aus_create:
		move.l     #0x00000000,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
	.globl Aus_delete
Aus_delete:
		move.l     #0x00000004,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
	.globl Aus_boxed
Aus_boxed:
		move.l     #0x00000008,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
	.globl Aus_cycle
Aus_cycle:
		move.l     #0x0000000C,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl Aus_help
Aus_help:
		move.l     #0x00000010,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
	.globl Aus_slider
Aus_slider:
		pea        20
		move.l     funcAus(pc),-(a7)
		bra        indirect
		.globl Aus_editor
Aus_editor:
		pea        24
		move.l     funcAus(pc),-(a7)
		bra        indirect
		.ENDC

/* windows */
	.globl Awi_wid
Awi_wid:
		move.l     #0x00000000,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_root
Awi_root:
		move.l     #0x00000004,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_list
Awi_list:
		move.l     #0x00000008,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_sendall
Awi_sendall:
		move.l     #0x0000000C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_down
Awi_down:
		move.l     #0x00000010,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_up
Awi_up:
		move.l     #0x00000014,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_show
Awi_show:
		move.l     #0x00000018,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_init
Awi_init:
		move.l     #0x0000001C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_create
Awi_create:
		move.l     #0x00000020,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_open
Awi_open:
		move.l     #0x00000024,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_closed
Awi_closed:
		move.l     #0x00000028,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_delete
Awi_delete:
		move.l     #0x0000002C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_topped
Awi_topped:
		move.l     #0x00000030,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_fulled
Awi_fulled:
		move.l     #0x00000034,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_sized
Awi_sized:
		move.l     #0x00000038,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_moved
Awi_moved:
		move.l     #0x0000003C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_diaend
Awi_diaend:
		move.l     #0x00000040,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_diastart
Awi_diastart:
		move.l     #0x00000044,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_keys
Awi_keys:
		move.l     #0x00000048,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_obview
Awi_obview:
		move.l     #0x0000004C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_service
Awi_service:
		move.l     #0x00000050,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_scroll
Awi_scroll:
		move.l     #0x00000054,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_obchange
Awi_obchange:
		move.l     #0x00000058,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_obredraw
Awi_obredraw:
		move.l     #0x0000005C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_redraw
Awi_redraw:
		move.l     #0x00000060,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_arrowed
Awi_arrowed:
		move.l     #0x00000064,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_hslid
Awi_hslid:
		move.l     #0x00000068,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_vslid
Awi_vslid:
		move.l     #0x0000006C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_iconify
Awi_iconify:
		move.l     #0x00000070,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_uniconify
Awi_uniconify:
		move.l     #0x00000074,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_gemscript
Awi_gemscript:
		move.l     #0x00000078,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_modal
Awi_modal:
		move.l     #0x0000007C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_dialog
Awi_dialog:
		move.l     #0x00000080,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_alert
Awi_alert:
		move.l     #0x00000084,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_selfcreate
Awi_selfcreate:
		move.l     #0x00000088,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_nokey
Awi_nokey:
		move.l     #0x0000008C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_update
Awi_update:
		move.l     #0x00000090,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_uoself
Awi_uoself:
		move.l     #0x00000094,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_doform
Awi_doform:
		move.l     #0x00000098,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_observice
Awi_observice:
		move.l     #0x0000009C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_ontop
Awi_ontop:
		move.l     #0x000000A0,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_layout
Awi_layout:
		move.l     #0x000000A4,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_obvisible
Awi_obvisible:
		move.l     #0x000000A8,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl Awi_saved
Awi_saved:
		move.l     #0x000000AC,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
	.globl Awi_sendkey
Awi_sendkey:
		move.l     #0x000000B0,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.ENDC

/* drawing callbacks */
	.globl A_dialog
A_dialog:
		move.l     #0x00000000,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_checkbox
A_checkbox:
		move.l     #0x00000004,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_radiobutton
A_radiobutton:
		move.l     #0x00000008,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_innerframe
A_innerframe:
		move.l     #0x0000000C,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_pattern
A_pattern:
		move.l     #0x00000010,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_arrows
A_arrows:
		move.l     #0x00000014,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_select
A_select:
		move.l     #0x00000018,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_ftext
A_ftext:
		move.l     #0x0000001C,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_title
A_title:
		move.l     #0x00000020,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_3Dbutton
A_3Dbutton:
		move.l     #0x00000024,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_cycle
A_cycle:
		move.l     #0x00000028,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_picture
A_picture:
		move.l     #0x0000002C,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_dialog2
A_dialog2:
		move.l     #0x00000030,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_boxed
A_boxed:
		move.l     #0x00000034,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl A_slider
A_slider:
		pea        56
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_wislider
A_wislider:
		pea        60
		move.l     funcA(pc),-(a7)
		bra        indirect
	.globl A_editor
A_editor:
		pea        64
		move.l     funcA(pc),-(a7)
		bra        indirect
		.ENDC

/* misc */
	.globl Ax_malloc
Ax_malloc:
		move.l     #0x00000000,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl Ax_free
Ax_free:
		move.l     #0x00000004,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl Ax_ifree
Ax_ifree:
		move.l     #0x00000008,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl Ax_glmalloc
Ax_glmalloc:
		move.l     #0x0000000C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl Ax_glfree
Ax_glfree:
		move.l     #0x00000010,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect

/*
 * ACSmoduleterm is different, because we need
 * to pass the BASEPAGE pointer to Ax_mterm()
 */
	.globl ACSmoduleterm
ACSmoduleterm:
		movea.l    #compiler-256,a0
		move.l     #0x00000014,-(a7)  /* Ax_mterm */
		move.l     funcSonst(pc),-(a7)
		bra        indirect

	.globl alert_str
alert_str:
		move.l     #0x00000018,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl intersect
intersect:
		move.l     #0x0000001C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl xywh2array
xywh2array:
		move.l     #0x00000020,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl array2xywh
array2xywh:
		move.l     #0x00000024,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl dotted_xline
dotted_xline:
		move.l     #0x00000028,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl dotted_yline
dotted_yline:
		move.l     #0x0000002C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl nkc_tos2n
nkc_tos2n:
		move.l     #0x00000030,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl nkc_n2tos
nkc_n2tos:
		move.l     #0x00000034,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl nkc_gem2n
nkc_gem2n:
		move.l     #0x00000038,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl nkc_n2gem
nkc_n2gem:
		move.l     #0x0000003C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl nkc_gemks2n
nkc_gemks2n:
		move.l     #0x00000040,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl nkc_n2gemks
nkc_n2gemks:
		move.l     #0x00000044,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl nkc_n2kstate
nkc_n2kstate:
		move.l     #0x00000048,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl nkc_kstate
nkc_kstate:
		move.l     #0x0000004C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl nkc_cmp
nkc_cmp:
		move.l     #0x00000050,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl nkc_tolower
nkc_tolower:
		move.l     #0x00000054,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl nkc_toupper
nkc_toupper:
		move.l     #0x00000058,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl appl_xgetinfo
appl_xgetinfo:
		move.l     #0x0000005C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl Ax_setRecycleSize
Ax_setRecycleSize:
		move.l     #0x00000060,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl Ax_getRecycleStat
Ax_getRecycleStat:
		move.l     #0x00000064,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl Ax_recycle
Ax_recycle:
		move.l     #0x00000068,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl Avdi_getRGB
Avdi_getRGB:
		move.l     #0x0000006C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
	.globl Ax_memCheck
Ax_memCheck:
		move.l     #0x00000070,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl Adate_getMonth
Adate_getMonth:
		move.l     #0x00000074,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
	.globl Adate_ymd2dow
Adate_ymd2dow:
		move.l     #0x00000078,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.ENDC

/* VDI */
	.globl vdi
vdi:
		move.l     #0x00000000,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vdi_
vdi_:
		move.l     #0x00000004,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_opnwk
v_opnwk:
		move.l     #0x00000008,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_clswk
v_clswk:
		move.l     #0x0000000C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_opnvwk
v_opnvwk:
		move.l     #0x00000010,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_clsvwk
v_clsvwk:
		move.l     #0x00000014,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_clrwk
v_clrwk:
		move.l     #0x00000018,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_updwk
v_updwk:
		move.l     #0x0000001C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_opnbm
v_opnbm:
		move.l     #0x00000020,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_clsbm
v_clsbm:
		move.l     #0x00000024,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_load_fonts
vst_load_fonts:
		move.l     #0x00000028,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_unload_fonts
vst_unload_fonts:
		move.l     #0x0000002C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_clip
vs_clip:
		move.l     #0x00000030,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_pline
v_pline:
		move.l     #0x00000034,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_pmarker
v_pmarker:
		move.l     #0x00000038,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_gtext
v_gtext:
		move.l     #0x0000003C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_fillarea
v_fillarea:
		move.l     #0x00000040,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_cellarray
v_cellarray:
		move.l     #0x00000044,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_contourfill
v_contourfill:
		move.l     #0x00000048,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_bar
v_bar:
		move.l     #0x0000004C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_arc
v_arc:
		move.l     #0x00000050,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_pieslice
v_pieslice:
		move.l     #0x00000054,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_circle
v_circle:
		move.l     #0x00000058,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_ellipse
v_ellipse:
		move.l     #0x0000005C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_ellarc
v_ellarc:
		move.l     #0x00000060,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_ellpie
v_ellpie:
		move.l     #0x00000064,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_justified
v_justified:
		move.l     #0x00000068,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vr_recfl
vr_recfl:
		move.l     #0x0000006C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_rfbox
v_rfbox:
		move.l     #0x00000070,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_rbox
v_rbox:
		move.l     #0x00000074,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_gdos
vq_gdos:
		move.l     #0x00000078,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vswr_mode
vswr_mode:
		move.l     #0x0000007C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsl_type
vsl_type:
		move.l     #0x00000080,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsl_udsty
vsl_udsty:
		move.l     #0x00000084,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsl_width
vsl_width:
		move.l     #0x00000088,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsl_color
vsl_color:
		move.l     #0x0000008C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsl_ends
vsl_ends:
		move.l     #0x00000090,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsm_type
vsm_type:
		move.l     #0x00000094,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsm_height
vsm_height:
		move.l     #0x00000098,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsm_color
vsm_color:
		move.l     #0x0000009C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_height
vst_height:
		move.l     #0x000000A0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_point
vst_point:
		move.l     #0x000000A4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_rotation
vst_rotation:
		move.l     #0x000000A8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_font
vst_font:
		move.l     #0x000000AC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_color
vst_color:
		move.l     #0x000000B0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_effects
vst_effects:
		move.l     #0x000000B4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_alignment
vst_alignment:
		move.l     #0x000000B8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsf_interior
vsf_interior:
		move.l     #0x000000BC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsf_style
vsf_style:
		move.l     #0x000000C0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsf_color
vsf_color:
		move.l     #0x000000C4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsf_perimeter
vsf_perimeter:
		move.l     #0x000000C8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsf_udpat
vsf_udpat:
		move.l     #0x000000CC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsf_updat
vsf_updat:
		move.l     #0x000000D0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_color
vs_color:
		move.l     #0x000000D4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vr_trnfm
vr_trnfm:
		move.l     #0x000000D8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vro_cpyfm
vro_cpyfm:
		move.l     #0x000000DC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vrt_cpyfm
vrt_cpyfm:
		move.l     #0x000000E0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_get_pixel
v_get_pixel:
		move.l     #0x000000E4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsin_mode
vsin_mode:
		move.l     #0x000000E8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vrq_locator
vrq_locator:
		move.l     #0x000000EC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsm_locator
vsm_locator:
		move.l     #0x000000F0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vrq_valuator
vrq_valuator:
		move.l     #0x000000F4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsm_valuator
vsm_valuator:
		move.l     #0x000000F8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vrq_choice
vrq_choice:
		move.l     #0x000000FC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsm_choice
vsm_choice:
		move.l     #0x00000100,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vrq_string
vrq_string:
		move.l     #0x00000104,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsm_string
vsm_string:
		move.l     #0x00000108,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vex_timv
vex_timv:
		move.l     #0x0000010C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_show_c
v_show_c:
		move.l     #0x00000110,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_hide_c
v_hide_c:
		move.l     #0x00000114,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_mouse
vq_mouse:
		move.l     #0x00000118,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vex_butv
vex_butv:
		move.l     #0x0000011C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vex_motv
vex_motv:
		move.l     #0x00000120,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vex_curv
vex_curv:
		move.l     #0x00000124,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_key_s
vq_key_s:
		move.l     #0x00000128,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_extnd
vq_extnd:
		move.l     #0x0000012C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vql_attributes
vql_attributes:
		move.l     #0x00000130,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqm_attributes
vqm_attributes:
		move.l     #0x00000134,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqf_attributes
vqf_attributes:
		move.l     #0x00000138,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_attributes
vqt_attributes:
		move.l     #0x0000013C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_extent
vqt_extent:
		move.l     #0x00000140,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_width
vqt_width:
		move.l     #0x00000144,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_name
vqt_name:
		move.l     #0x00000148,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqin_mode
vqin_mode:
		move.l     #0x0000014C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_fontinfo
vqt_fontinfo:
		move.l     #0x00000150,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_scrninfo
vq_scrninfo:
		move.l     #0x00000154,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_color
vq_color:
		move.l     #0x00000158,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_cellarray
vq_cellarray:
		move.l     #0x0000015C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_chcells
vq_chcells:
		move.l     #0x00000160,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_exit_cur
v_exit_cur:
		move.l     #0x00000164,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_enter_cur
v_enter_cur:
		move.l     #0x00000168,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_curup
v_curup:
		move.l     #0x0000016C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_curdown
v_curdown:
		move.l     #0x00000170,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_curright
v_curright:
		move.l     #0x00000174,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_curleft
v_curleft:
		move.l     #0x00000178,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_curhome
v_curhome:
		move.l     #0x0000017C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_eeos
v_eeos:
		move.l     #0x00000180,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_eeol
v_eeol:
		move.l     #0x00000184,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_curaddress
v_curaddress:
		move.l     #0x00000188,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_curtext
v_curtext:
		move.l     #0x0000018C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_rvon
v_rvon:
		move.l     #0x00000190,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_rvoff
v_rvoff:
		move.l     #0x00000194,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_curaddress
vq_curaddress:
		move.l     #0x00000198,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_tabstatus
vq_tabstatus:
		move.l     #0x0000019C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_hardcopy
v_hardcopy:
		move.l     #0x000001A0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_dspcur
v_dspcur:
		move.l     #0x000001A4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_rmcur
v_rmcur:
		move.l     #0x000001A8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_form_adv
v_form_adv:
		move.l     #0x000001AC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_clear_disp_list
v_clear_disp_list:
		move.l     #0x000001B0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_scan
vq_scan:
		move.l     #0x000001B4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_alpha_text
v_alpha_text:
		move.l     #0x000001B8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_palette
vs_palette:
		move.l     #0x000001BC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_sound
v_sound:
		move.l     #0x000001C0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_mute
vs_mute:
		move.l     #0x000001C4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vt_resolution
vt_resolution:
		move.l     #0x000001C8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vt_axis
vt_axis:
		move.l     #0x000001CC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vt_origin
vt_origin:
		move.l     #0x000001D0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_tdimensions
vq_tdimensions:
		move.l     #0x000001D4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vt_alignment
vt_alignment:
		move.l     #0x000001D8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsp_film
vsp_film:
		move.l     #0x000001DC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqp_filmname
vqp_filmname:
		move.l     #0x000001E0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsc_expose
vsc_expose:
		move.l     #0x000001E4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_meta_extents
v_meta_extents:
		move.l     #0x000001E8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_write_meta
v_write_meta:
		move.l     #0x000001EC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vm_pagesize
vm_pagesize:
		move.l     #0x000001F0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vm_coords
vm_coords:
		move.l     #0x000001F4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vm_filename
vm_filename:
		move.l     #0x000001F8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_offset
v_offset:
		move.l     #0x000001FC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_fontinit
v_fontinit:
		move.l     #0x00000200,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_escape2000
v_escape2000:
		move.l     #0x00000204,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_output_window
v_output_window:
		move.l     #0x00000208,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_bit_image
v_bit_image:
		move.l     #0x0000020C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl fix31ToPixel
fix31ToPixel:
		move.l     #0x00000210,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_opnprn
v_opnprn:
		move.l     #0x00000214,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_opnmeta
v_opnmeta:
		move.l     #0x00000218,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_devinfo
vq_devinfo:
		move.l     #0x0000021C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_ext_devinfo
vq_ext_devinfo:
		move.l     #0x00000220,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_calibrate
vs_calibrate:
		move.l     #0x00000224,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_calibrate
vq_calibrate:
		move.l     #0x00000228,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_bez
v_bez:
		move.l     #0x0000022C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_bez_on
v_bez_on:
		move.l     #0x00000230,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_bez_off
v_bez_off:
		move.l     #0x00000234,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_bez_qual
v_bez_qual:
		move.l     #0x00000238,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_bez_fill
v_bez_fill:
		move.l     #0x0000023C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_ext_name
vqt_ext_name:
		move.l     #0x00000240,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_char_index
vqt_char_index:
		move.l     #0x00000244,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_isCharAvailable
vqt_isCharAvailable:
		move.l     #0x00000248,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_xfntinfo
vqt_xfntinfo:
		move.l     #0x0000024C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_name
vst_name:
		move.l     #0x00000250,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_name_and_id
vqt_name_and_id:
		move.l     #0x00000254,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_fontheader
vqt_fontheader:
		move.l     #0x00000258,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_trackkern
vqt_trackkern:
		move.l     #0x0000025C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_pairkern
vqt_pairkern:
		move.l     #0x00000260,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_charmap
vst_charmap:
		move.l     #0x00000264,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_kern
vst_kern:
		move.l     #0x00000268,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_kern_offset
vst_kern_offset:
		move.l     #0x0000026C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_getbitmap_info
v_getbitmap_info:
		move.l     #0x00000270,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_f_extent
vqt_f_extent:
		move.l     #0x00000274,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_real_extent
vqt_real_extent:
		move.l     #0x00000278,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_ftext
v_ftext:
		move.l     #0x0000027C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_ftext_offset
v_ftext_offset:
		move.l     #0x00000280,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_getoutline
v_getoutline:
		move.l     #0x00000284,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_arbpt32
vst_arbpt32:
		move.l     #0x00000288,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_advance32
vqt_advance32:
		move.l     #0x0000028C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_setsize32
vst_setsize32:
		move.l     #0x00000290,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_skew
vst_skew:
		move.l     #0x00000294,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_orient
v_orient:
		move.l     #0x00000298,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_trays
v_trays:
		move.l     #0x0000029C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_tray_names
vq_tray_names:
		move.l     #0x000002A0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_page_size
v_page_size:
		move.l     #0x000002A4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_page_name
vq_page_name:
		move.l     #0x000002A8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_fg_color
vst_fg_color:
		move.l     #0x000002AC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsf_fg_color
vsf_fg_color:
		move.l     #0x000002B0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsl_fg_color
vsl_fg_color:
		move.l     #0x000002B4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsm_fg_color
vsm_fg_color:
		move.l     #0x000002B8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsr_fg_color
vsr_fg_color:
		move.l     #0x000002BC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_bg_color
vst_bg_color:
		move.l     #0x000002C0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsf_bg_color
vsf_bg_color:
		move.l     #0x000002C4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsl_bg_color
vsl_bg_color:
		move.l     #0x000002C8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsm_bg_color
vsm_bg_color:
		move.l     #0x000002CC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsr_bg_color
vsr_bg_color:
		move.l     #0x000002D0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_fg_color
vqt_fg_color:
		move.l     #0x000002D4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqf_fg_color
vqf_fg_color:
		move.l     #0x000002D8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vql_fg_color
vql_fg_color:
		move.l     #0x000002DC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqm_fg_color
vqm_fg_color:
		move.l     #0x000002E0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqr_fg_color
vqr_fg_color:
		move.l     #0x000002E4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_bg_color
vqt_bg_color:
		move.l     #0x000002E8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqf_bg_color
vqf_bg_color:
		move.l     #0x000002EC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vql_bg_color
vql_bg_color:
		move.l     #0x000002F0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqm_bg_color
vqm_bg_color:
		move.l     #0x000002F4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqr_bg_color
vqr_bg_color:
		move.l     #0x000002F8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_color2value
v_color2value:
		move.l     #0x000002FC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_value2color
v_value2color:
		move.l     #0x00000300,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_color2nearest
v_color2nearest:
		move.l     #0x00000304,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_px_format
vq_px_format:
		move.l     #0x00000308,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_ctab
vs_ctab:
		move.l     #0x0000030C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_ctab_entry
vs_ctab_entry:
		move.l     #0x00000310,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_dflt_ctab
vs_dflt_ctab:
		move.l     #0x00000314,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_ctab
vq_ctab:
		move.l     #0x00000318,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_ctab_entry
vq_ctab_entry:
		move.l     #0x0000031C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_ctab_id
vq_ctab_id:
		move.l     #0x00000320,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_ctab_idx2vdi
v_ctab_idx2vdi:
		move.l     #0x00000324,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_ctab_vdi2idx
v_ctab_vdi2idx:
		move.l     #0x00000328,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_ctab_idx2value
v_ctab_idx2value:
		move.l     #0x0000032C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_get_ctab_id
v_get_ctab_id:
		move.l     #0x00000330,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_dflt_ctab
vq_dflt_ctab:
		move.l     #0x00000334,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_create_itab
v_create_itab:
		move.l     #0x00000338,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_delete_itab
v_delete_itab:
		move.l     #0x0000033C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vr_transfer_bits
vr_transfer_bits:
		move.l     #0x00000340,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_hilite_color
vs_hilite_color:
		move.l     #0x00000344,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_min_color
vs_min_color:
		move.l     #0x00000348,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_max_color
vs_max_color:
		move.l     #0x0000034C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_weight_color
vs_weight_color:
		move.l     #0x00000350,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_hilite_color
vq_hilite_color:
		move.l     #0x00000354,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_min_color
vq_min_color:
		move.l     #0x00000358,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_max_color
vq_max_color:
		move.l     #0x0000035C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_weight_color
vq_weight_color:
		move.l     #0x00000360,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_document_info
vs_document_info:
		move.l     #0x00000364,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_prn_scaling
vq_prn_scaling:
		move.l     #0x00000368,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_open_bm
v_open_bm:
		move.l     #0x0000036C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_resize_bm
v_resize_bm:
		move.l     #0x00000370,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_get_outline
v_get_outline:
		move.l     #0x00000374,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_track_offset
vst_track_offset:
		move.l     #0x00000378,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_arbpt
vst_arbpt:
		move.l     #0x0000037C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_advance
vqt_advance:
		move.l     #0x00000380,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_setsize
vst_setsize:
		move.l     #0x00000384,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vq_vgdos
vq_vgdos:
		move.l     #0x00000388,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_width
vst_width:
		move.l     #0x0000038C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_scratch
vst_scratch:
		move.l     #0x00000390,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vst_error
vst_error:
		move.l     #0x00000394,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_savecache
v_savecache:
		move.l     #0x00000398,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_loadcache
v_loadcache:
		move.l     #0x0000039C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_flushcache
v_flushcache:
		move.l     #0x000003A0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_cachesize
vqt_cachesize:
		move.l     #0x000003A4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_get_table
vqt_get_table:
		move.l     #0x000003A8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vs_curaddress
vs_curaddress:
		move.l     #0x000003AC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vsf_perimeter3
vsf_perimeter3:
		move.l     #0x000003B0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_justified
vqt_justified:
		move.l     #0x000003B4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_opnprnwrk
v_opnprnwrk:
		move.l     #0x000003B8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_opnmatrixprn
v_opnmatrixprn:
		move.l     #0x000003BC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_set_app_buff
v_set_app_buff:
		move.l     #0x000003C0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl vqt_devinfo
vqt_devinfo:
		move.l     #0x000003C4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_create_ctab
v_create_ctab:
		move.l     #0x000003C8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_delete_ctab
v_delete_ctab:
		move.l     #0x000003CC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
	.globl v_setrgb
v_setrgb:
		move.l     #0x000003D0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect

/* AES */
	.globl aes
aes:
		move.l     #0x00000000,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl appl_init
appl_init:
		move.l     #0x00000004,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl appl_read
appl_read:
		move.l     #0x00000008,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl appl_write
appl_write:
		move.l     #0x0000000C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl appl_find
appl_find:
		move.l     #0x00000010,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl appl_search
appl_search:
		move.l     #0x00000014,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl appl_tplay
appl_tplay:
		move.l     #0x00000018,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl appl_trecord
appl_trecord:
		move.l     #0x0000001C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl appl_yield
appl_yield:
		move.l     #0x00000020,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl appl_exit
appl_exit:
		move.l     #0x00000024,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl appl_getinfo
appl_getinfo:
		move.l     #0x00000028,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl appl_control
appl_control:
		move.l     #0x0000002C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl evnt_keybd
evnt_keybd:
		move.l     #0x00000030,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl evnt_button
evnt_button:
		move.l     #0x00000034,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl evnt_mouse
evnt_mouse:
		move.l     #0x00000038,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl evnt_mesag
evnt_mesag:
		move.l     #0x0000003C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl evnt_timer
evnt_timer:
		move.l     #0x00000040,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl evnt_event
evnt_event:
		move.l     #0x00000044,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl evnt_multi
evnt_multi:
		move.l     #0x00000048,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl evnt_dclick
evnt_dclick:
		move.l     #0x0000004C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl menu_bar
menu_bar:
		move.l     #0x00000050,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl menu_icheck
menu_icheck:
		move.l     #0x00000054,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl menu_ienable
menu_ienable:
		move.l     #0x00000058,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl menu_tnormal
menu_tnormal:
		move.l     #0x0000005C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl menu_text
menu_text:
		move.l     #0x00000060,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl menu_register
menu_register:
		move.l     #0x00000064,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl menu_unregister
menu_unregister:
		move.l     #0x00000068,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl menu_click
menu_click:
		move.l     #0x0000006C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl menu_attach
menu_attach:
		move.l     #0x00000070,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl menu_istart
menu_istart:
		move.l     #0x00000074,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl menu_popup
menu_popup:
		move.l     #0x00000078,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl menu_settings
menu_settings:
		move.l     #0x0000007C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl objc_add
objc_add:
		move.l     #0x00000080,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl objc_delete
objc_delete:
		move.l     #0x00000084,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl objc_draw
objc_draw:
		move.l     #0x00000088,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl objc_find
objc_find:
		move.l     #0x0000008C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl objc_offset
objc_offset:
		move.l     #0x00000090,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl objc_order
objc_order:
		move.l     #0x00000094,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl objc_edit
objc_edit:
		move.l     #0x00000098,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl objc_change
objc_change:
		move.l     #0x0000009C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl objc_sysvar
objc_sysvar:
		move.l     #0x000000A0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl form_do
form_do:
		move.l     #0x000000A4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl form_dial
form_dial:
		move.l     #0x000000A8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl form_alert
form_alert:
		move.l     #0x000000AC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl form_error
form_error:
		move.l     #0x000000B0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl form_center
form_center:
		move.l     #0x000000B4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl form_keybd
form_keybd:
		move.l     #0x000000B8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl form_button
form_button:
		move.l     #0x000000BC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_rubbox
graf_rubbox:
		move.l     #0x000000C0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_rubberbox
graf_rubberbox:
		move.l     #0x000000C4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_dragbox
graf_dragbox:
		move.l     #0x000000C8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_mbox
graf_mbox:
		move.l     #0x000000CC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_movebox
graf_movebox:
		move.l     #0x000000D0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_growbox
graf_growbox:
		move.l     #0x000000D4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_shrinkbox
graf_shrinkbox:
		move.l     #0x000000D8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_watchbox
graf_watchbox:
		move.l     #0x000000DC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_slidebox
graf_slidebox:
		move.l     #0x000000E0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_handle
graf_handle:
		move.l     #0x000000E4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_mouse
graf_mouse:
		move.l     #0x000000E8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_mkstate
graf_mkstate:
		move.l     #0x000000EC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_multirubber
graf_multirubber:
		move.l     #0x000000F0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl scrp_read
scrp_read:
		move.l     #0x000000F4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl scrp_write
scrp_write:
		move.l     #0x000000F8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fsel_input
fsel_input:
		move.l     #0x000000FC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fsel_exinput
fsel_exinput:
		move.l     #0x00000100,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fsel_boxinput
fsel_boxinput:
		move.l     #0x00000104,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fslx_open
fslx_open:
		move.l     #0x00000108,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fslx_close
fslx_close:
		move.l     #0x0000010C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fslx_getnxtfile
fslx_getnxtfile:
		move.l     #0x00000110,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fslx_evnt
fslx_evnt:
		move.l     #0x00000114,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fslx_do
fslx_do:
		move.l     #0x00000118,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fslx_set_flags
fslx_set_flags:
		move.l     #0x0000011C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wind_create
wind_create:
		move.l     #0x00000120,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wind_open
wind_open:
		move.l     #0x00000124,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wind_close
wind_close:
		move.l     #0x00000128,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wind_delete
wind_delete:
		move.l     #0x0000012C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wind_get
wind_get:
		move.l     #0x00000130,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wind_getQSB
wind_getQSB:
		move.l     #0x00000134,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wind_set
wind_set:
		move.l     #0x00000138,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wind_find
wind_find:
		move.l     #0x0000013C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wind_update
wind_update:
		move.l     #0x00000140,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wind_calc
wind_calc:
		move.l     #0x00000144,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wind_new
wind_new:
		move.l     #0x00000148,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl rsrc_load
rsrc_load:
		move.l     #0x0000014C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl rsrc_free
rsrc_free:
		move.l     #0x00000150,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl rsrc_gaddr
rsrc_gaddr:
		move.l     #0x00000154,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl rsrc_saddr
rsrc_saddr:
		move.l     #0x00000158,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl rsrc_obfix
rsrc_obfix:
		move.l     #0x0000015C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl rsrc_rcfix
rsrc_rcfix:
		move.l     #0x00000160,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl shel_read
shel_read:
		move.l     #0x00000164,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl shel_write
shel_write:
		move.l     #0x00000168,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl shel_get
shel_get:
		move.l     #0x0000016C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl shel_put
shel_put:
		move.l     #0x00000170,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl shel_find
shel_find:
		move.l     #0x00000174,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl shel_envrn
shel_envrn:
		move.l     #0x00000178,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl shel_help
shel_help:
		move.l     #0x0000017C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fnts_add
fnts_add:
		move.l     #0x00000180,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fnts_close
fnts_close:
		move.l     #0x00000184,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fnts_create
fnts_create:
		move.l     #0x00000188,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fnts_delete
fnts_delete:
		move.l     #0x0000018C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fnts_do
fnts_do:
		move.l     #0x00000190,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fnts_evnt
fnts_evnt:
		move.l     #0x00000194,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fnts_get_info
fnts_get_info:
		move.l     #0x00000198,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fnts_get_name
fnts_get_name:
		move.l     #0x0000019C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fnts_get_no_styles
fnts_get_no_styles:
		move.l     #0x000001A0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fnts_get_style
fnts_get_style:
		move.l     #0x000001A4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fnts_open
fnts_open:
		move.l     #0x000001A8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fnts_remove
fnts_remove:
		move.l     #0x000001AC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl fnts_update
fnts_update:
		move.l     #0x000001B0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_ascroll_to
lbox_ascroll_to:
		move.l     #0x000001B4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_scroll_to
lbox_scroll_to:
		move.l     #0x000001B8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_bscroll_to
lbox_bscroll_to:
		move.l     #0x000001BC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_cnt_items
lbox_cnt_items:
		move.l     #0x000001C0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_create
lbox_create:
		move.l     #0x000001C4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_delete
lbox_delete:
		move.l     #0x000001C8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_do
lbox_do:
		move.l     #0x000001CC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_free_items
lbox_free_items:
		move.l     #0x000001D0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_free_list
lbox_free_list:
		move.l     #0x000001D4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_get_afirst
lbox_get_afirst:
		move.l     #0x000001D8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_get_first
lbox_get_first:
		move.l     #0x000001DC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_get_avis
lbox_get_avis:
		move.l     #0x000001E0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_get_visible
lbox_get_visible:
		move.l     #0x000001E4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_get_bentries
lbox_get_bentries:
		move.l     #0x000001E8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_get_bfirst
lbox_get_bfirst:
		move.l     #0x000001EC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_get_idx
lbox_get_idx:
		move.l     #0x000001F0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_get_item
lbox_get_item:
		move.l     #0x000001F4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_get_items
lbox_get_items:
		move.l     #0x000001F8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_get_slct_idx
lbox_get_slct_idx:
		move.l     #0x000001FC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_get_slct_item
lbox_get_slct_item:
		move.l     #0x00000200,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_get_tree
lbox_get_tree:
		move.l     #0x00000204,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_get_udata
lbox_get_udata:
		move.l     #0x00000208,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_set_asldr
lbox_set_asldr:
		move.l     #0x0000020C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_set_slider
lbox_set_slider:
		move.l     #0x00000210,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_set_bentries
lbox_set_bentries:
		move.l     #0x00000214,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_set_bsldr
lbox_set_bsldr:
		move.l     #0x00000218,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_set_items
lbox_set_items:
		move.l     #0x0000021C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl lbox_update
lbox_update:
		move.l     #0x00000220,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_add_printers
pdlg_add_printers:
		move.l     #0x00000224,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_add_sub_dialogs
pdlg_add_sub_dialogs:
		move.l     #0x00000228,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_close
pdlg_close:
		move.l     #0x0000022C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_create
pdlg_create:
		move.l     #0x00000230,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_delete
pdlg_delete:
		move.l     #0x00000234,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_dflt_settings
pdlg_dflt_settings:
		move.l     #0x00000238,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_do
pdlg_do:
		move.l     #0x0000023C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_evnt
pdlg_evnt:
		move.l     #0x00000240,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_free_settings
pdlg_free_settings:
		move.l     #0x00000244,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_get_setsize
pdlg_get_setsize:
		move.l     #0x00000248,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_new_settings
pdlg_new_settings:
		move.l     #0x0000024C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_open
pdlg_open:
		move.l     #0x00000250,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_remove_printers
pdlg_remove_printers:
		move.l     #0x00000254,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_remove_sub_dialogs
pdlg_remove_sub_dialogs:
		move.l     #0x00000258,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_update
pdlg_update:
		move.l     #0x0000025C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_use_settings
pdlg_use_settings:
		move.l     #0x00000260,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl pdlg_validate_settings
pdlg_validate_settings:
		move.l     #0x00000264,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_create
edit_create:
		move.l     #0x00000268,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_set_buf
edit_set_buf:
		move.l     #0x0000026C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_open
edit_open:
		move.l     #0x00000270,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_close
edit_close:
		move.l     #0x00000274,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_delete
edit_delete:
		move.l     #0x00000278,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_cursor
edit_cursor:
		move.l     #0x0000027C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_evnt
edit_evnt:
		move.l     #0x00000280,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_get_buf
edit_get_buf:
		move.l     #0x00000284,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_get_format
edit_get_format:
		move.l     #0x00000288,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_get_colour
edit_get_colour:
		move.l     #0x0000028C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_get_color
edit_get_color:
		move.l     #0x00000290,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_get_font
edit_get_font:
		move.l     #0x00000294,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_get_cursor
edit_get_cursor:
		move.l     #0x00000298,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_get_dirty
edit_get_dirty:
		move.l     #0x0000029C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_get_sel
edit_get_sel:
		move.l     #0x000002A0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_get_scrollinfo
edit_get_scrollinfo:
		move.l     #0x000002A4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_set_format
edit_set_format:
		move.l     #0x000002A8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_set_colour
edit_set_colour:
		move.l     #0x000002AC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_set_color
edit_set_color:
		move.l     #0x000002B0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_set_font
edit_set_font:
		move.l     #0x000002B4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_set_cursor
edit_set_cursor:
		move.l     #0x000002B8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_resized
edit_resized:
		move.l     #0x000002BC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_set_dirty
edit_set_dirty:
		move.l     #0x000002C0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl edit_scroll
edit_scroll:
		move.l     #0x000002C4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl EvntMulti
EvntMulti:
		move.l     #0x000002C8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl form_wbutton
form_wbutton:
		move.l     #0x000002CC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl form_xdial
form_xdial:
		move.l     #0x000002D0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl form_xdo
form_xdo:
		move.l     #0x000002D4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl form_xerr
form_xerr:
		move.l     #0x000002D8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl _crystal
_crystal:
		move.l     #0x000002DC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_wwatchbox
graf_wwatchbox:
		move.l     #0x000002E0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_xhandle
graf_xhandle:
		move.l     #0x000002E4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_create
wdlg_create:
		move.l     #0x000002E8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_open
wdlg_open:
		move.l     #0x000002EC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_close
wdlg_close:
		move.l     #0x000002F0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_delete
wdlg_delete:
		move.l     #0x000002F4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_get_tree
wdlg_get_tree:
		move.l     #0x000002F8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_get_edit
wdlg_get_edit:
		move.l     #0x000002FC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_get_udata
wdlg_get_udata:
		move.l     #0x00000300,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_get_handle
wdlg_get_handle:
		move.l     #0x00000304,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_set_edit
wdlg_set_edit:
		move.l     #0x00000308,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_set_tree
wdlg_set_tree:
		move.l     #0x0000030C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_set_size
wdlg_set_size:
		move.l     #0x00000310,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_set_iconify
wdlg_set_iconify:
		move.l     #0x00000314,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_set_uniconify
wdlg_set_uniconify:
		move.l     #0x00000318,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_evnt
wdlg_evnt:
		move.l     #0x0000031C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wdlg_redraw
wdlg_redraw:
		move.l     #0x00000320,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl wind_draw
wind_draw:
		move.l     #0x00000324,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl scrp_clear
scrp_clear:
		move.l     #0x00000328,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl objc_xedit
objc_xedit:
		move.l     #0x0000032C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl graf_rubbbox
graf_rubbbox:
		move.l     #0x00000330,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect

/* keytab */
	.globl Akt_getKeyTab
Akt_getKeyTab:
		move.l     #0x00000000,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getRelease
Akt_getRelease:
		move.l     #0x00000004,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getEuro
Akt_getEuro:
		move.l     #0x00000008,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getExpMaxNr
Akt_getExpMaxNr:
		move.l     #0x0000000C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getImpMaxNr
Akt_getImpMaxNr:
		move.l     #0x00000010,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getExpNameFromNr
Akt_getExpNameFromNr:
		move.l     #0x00000014,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getImpNameFromNr
Akt_getImpNameFromNr:
		move.l     #0x00000018,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getExpShortNameFromNr
Akt_getExpShortNameFromNr:
		move.l     #0x0000001C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getImpShortNameFromNr
Akt_getImpShortNameFromNr:
		move.l     #0x00000020,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getExpNrFromId
Akt_getExpNrFromId:
		move.l     #0x00000024,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getImpNrFromId
Akt_getImpNrFromId:
		move.l     #0x00000028,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getExpIdFromNr
Akt_getExpIdFromNr:
		move.l     #0x0000002C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getImpIdFromNr
Akt_getImpIdFromNr:
		move.l     #0x00000030,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getExpNrFromName
Akt_getExpNrFromName:
		move.l     #0x00000034,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getImpNrFromName
Akt_getImpNrFromName:
		move.l     #0x00000038,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_CharAtari2X
Akt_CharAtari2X:
		move.l     #0x0000003C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_CharX2Atari
Akt_CharX2Atari:
		move.l     #0x00000040,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_BlockAtari2X
Akt_BlockAtari2X:
		move.l     #0x00000044,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_BlockX2Atari
Akt_BlockX2Atari:
		move.l     #0x00000048,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_StringAtari2X
Akt_StringAtari2X:
		move.l     #0x0000004C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_StringX2Atari
Akt_StringX2Atari:
		move.l     #0x00000050,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_CharX2Unicode
Akt_CharX2Unicode:
		move.l     #0x00000054,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_CharUnicode2X
Akt_CharUnicode2X:
		move.l     #0x00000058,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_BlockX2Unicode
Akt_BlockX2Unicode:
		move.l     #0x0000005C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_BlockUnicode2X
Akt_BlockUnicode2X:
		move.l     #0x00000060,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_StringX2Unicode
Akt_StringX2Unicode:
		move.l     #0x00000064,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_popExpName
Akt_popExpName:
		move.l     #0x00000068,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_popImpName
Akt_popImpName:
		move.l     #0x0000006C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_chooseExpNr
Akt_chooseExpNr:
		move.l     #0x00000070,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_chooseImpNr
Akt_chooseImpNr:
		move.l     #0x00000074,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getExpMinNr
Akt_getExpMinNr:
		move.l     #0x00000078,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getImpMinNr
Akt_getImpMinNr:
		move.l     #0x0000007C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_BlockXUtf2Unicode
Akt_BlockXUtf2Unicode:
		move.l     #0x00000080,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_BlockUnicode2XUtf
Akt_BlockUnicode2XUtf:
		move.l     #0x00000084,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_StringXUtf2Unicode
Akt_StringXUtf2Unicode:
		move.l     #0x00000088,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_BlockXUtf2U2XUtf
Akt_BlockXUtf2U2XUtf:
		move.l     #0x0000008C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_BlockXUtf2XUtf
Akt_BlockXUtf2XUtf:
		move.l     #0x00000090,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_StringXUtf2U2XUtf
Akt_StringXUtf2U2XUtf:
		move.l     #0x00000094,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_StringXUtf2XUtf
Akt_StringXUtf2XUtf:
		move.l     #0x00000098,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
		.globl Akt_getInfoShort
Akt_getInfoShort:
		move.l     #0x0000009C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_getInfoString
Akt_getInfoString:
		move.l     #0x000000A0,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_CharXUtf2Unicode
Akt_CharXUtf2Unicode:
		move.l     #0x000000A4,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
	.globl Akt_CharUnicode2XUtf
Akt_CharUnicode2XUtf:
		move.l     #0x000000A8,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.ENDC

/* Multi-threading AES */
	.globl mt_appl_init
mt_appl_init:
		move.l     #0x00000000,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_appl_read
mt_appl_read:
		move.l     #0x00000004,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_appl_write
mt_appl_write:
		move.l     #0x00000008,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_appl_find
mt_appl_find:
		move.l     #0x0000000C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_appl_search
mt_appl_search:
		move.l     #0x00000010,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_appl_tplay
mt_appl_tplay:
		move.l     #0x00000014,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_appl_trecord
mt_appl_trecord:
		move.l     #0x00000018,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_appl_yield
mt_appl_yield:
		move.l     #0x0000001C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_appl_exit
mt_appl_exit:
		move.l     #0x00000020,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_appl_getinfo
mt_appl_getinfo:
		move.l     #0x00000024,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_appl_control
mt_appl_control:
		move.l     #0x00000028,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_evnt_keybd
mt_evnt_keybd:
		move.l     #0x00000334,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl mt_evnt_button
mt_evnt_button:
		move.l     #0x0000002C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_evnt_mouse
mt_evnt_mouse:
		move.l     #0x00000030,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_evnt_mesag
mt_evnt_mesag:
		move.l     #0x00000034,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_evnt_timer
mt_evnt_timer:
		move.l     #0x00000038,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_evnt_event
mt_evnt_event:
		move.l     #0x0000003C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_evnt_multi
mt_evnt_multi:
		move.l     #0x00000040,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_evnt_dclick
mt_evnt_dclick:
		move.l     #0x00000044,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_menu_bar
mt_menu_bar:
		move.l     #0x00000048,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_menu_icheck
mt_menu_icheck:
		move.l     #0x0000004C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_menu_ienable
mt_menu_ienable:
		move.l     #0x00000050,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_menu_tnormal
mt_menu_tnormal:
		move.l     #0x00000054,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_menu_text
mt_menu_text:
		move.l     #0x00000058,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_menu_register
mt_menu_register:
		move.l     #0x0000005C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_menu_unregister
mt_menu_unregister:
		move.l     #0x00000060,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_menu_click
mt_menu_click:
		move.l     #0x00000064,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_menu_attach
mt_menu_attach:
		move.l     #0x00000068,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_menu_istart
mt_menu_istart:
		move.l     #0x0000006C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_menu_popup
mt_menu_popup:
		move.l     #0x00000070,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_menu_settings
mt_menu_settings:
		move.l     #0x00000074,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_objc_add
mt_objc_add:
		move.l     #0x00000078,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_objc_delete
mt_objc_delete:
		move.l     #0x0000007C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_objc_draw
mt_objc_draw:
		move.l     #0x00000338,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl mt_objc_find
mt_objc_find:
		move.l     #0x00000080,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_objc_offset
mt_objc_offset:
		move.l     #0x00000084,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_objc_order
mt_objc_order:
		move.l     #0x00000088,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_objc_edit
mt_objc_edit:
		move.l     #0x0000008C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_objc_change
mt_objc_change:
		move.l     #0x00000090,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_objc_sysvar
mt_objc_sysvar:
		move.l     #0x00000094,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_form_do
mt_form_do:
		move.l     #0x00000098,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_form_dial
mt_form_dial:
		move.l     #0x0000009C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_form_alert
mt_form_alert:
		move.l     #0x000000A0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_form_error
mt_form_error:
		move.l     #0x000000A4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_form_center
mt_form_center:
		move.l     #0x000000A8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_form_keybd
mt_form_keybd:
		move.l     #0x000000AC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_form_button
mt_form_button:
		move.l     #0x000000B0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_rubbox
mt_graf_rubbox:
		move.l     #0x000000B4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_rubberbox
mt_graf_rubberbox:
		move.l     #0x000000B8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_dragbox
mt_graf_dragbox:
		move.l     #0x000000BC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_mbox
mt_graf_mbox:
		move.l     #0x000000C0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_movebox
mt_graf_movebox:
		move.l     #0x000000C4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_growbox
mt_graf_growbox:
		move.l     #0x000000C8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_shrinkbox
mt_graf_shrinkbox:
		move.l     #0x000000CC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_watchbox
mt_graf_watchbox:
		move.l     #0x000000D0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_slidebox
mt_graf_slidebox:
		move.l     #0x000000D4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_handle
mt_graf_handle:
		move.l     #0x000000D8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_mouse
mt_graf_mouse:
		move.l     #0x000000DC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_mkstate
mt_graf_mkstate:
		move.l     #0x000000E0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_multirubber
mt_graf_multirubber:
		move.l     #0x000000E4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_scrp_read
mt_scrp_read:
		move.l     #0x000000E8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_scrp_write
mt_scrp_write:
		move.l     #0x000000EC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fsel_input
mt_fsel_input:
		move.l     #0x000000F0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fsel_exinput
mt_fsel_exinput:
		move.l     #0x000000F4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fsel_boxinput
mt_fsel_boxinput:
		move.l     #0x000000F8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fslx_open
mt_fslx_open:
		move.l     #0x000000FC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fslx_close
mt_fslx_close:
		move.l     #0x00000100,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fslx_getnxtfile
mt_fslx_getnxtfile:
		move.l     #0x00000104,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fslx_evnt
mt_fslx_evnt:
		move.l     #0x00000108,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fslx_do
mt_fslx_do:
		move.l     #0x0000010C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fslx_set_flags
mt_fslx_set_flags:
		move.l     #0x00000110,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wind_create
mt_wind_create:
		move.l     #0x0000033C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
	.globl mt_wind_open
mt_wind_open:
		move.l     #0x00000114,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wind_close
mt_wind_close:
		move.l     #0x00000118,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wind_delete
mt_wind_delete:
		move.l     #0x0000011C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wind_get
mt_wind_get:
		move.l     #0x00000120,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wind_getQSB
mt_wind_getQSB:
		move.l     #0x00000124,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wind_set
mt_wind_set:
		move.l     #0x00000128,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wind_find
mt_wind_find:
		move.l     #0x0000012C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wind_update
mt_wind_update:
		move.l     #0x00000130,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wind_calc
mt_wind_calc:
		move.l     #0x00000134,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wind_new
mt_wind_new:
		move.l     #0x00000138,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_rsrc_load
mt_rsrc_load:
		move.l     #0x0000013C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_rsrc_free
mt_rsrc_free:
		move.l     #0x00000140,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_rsrc_gaddr
mt_rsrc_gaddr:
		move.l     #0x00000144,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_rsrc_saddr
mt_rsrc_saddr:
		move.l     #0x00000148,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_rsrc_obfix
mt_rsrc_obfix:
		move.l     #0x0000014C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_rsrc_rcfix
mt_rsrc_rcfix:
		move.l     #0x00000150,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_shel_read
mt_shel_read:
		move.l     #0x00000154,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_shel_write
mt_shel_write:
		move.l     #0x00000158,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_shel_get
mt_shel_get:
		move.l     #0x0000015C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_shel_put
mt_shel_put:
		move.l     #0x00000160,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_shel_find
mt_shel_find:
		move.l     #0x00000164,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_shel_envrn
mt_shel_envrn:
		move.l     #0x00000168,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_shel_help
mt_shel_help:
		move.l     #0x0000016C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fnts_add
mt_fnts_add:
		move.l     #0x00000170,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fnts_close
mt_fnts_close:
		move.l     #0x00000174,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fnts_create
mt_fnts_create:
		move.l     #0x00000178,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fnts_delete
mt_fnts_delete:
		move.l     #0x0000017C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fnts_do
mt_fnts_do:
		move.l     #0x00000180,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fnts_evnt
mt_fnts_evnt:
		move.l     #0x00000184,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fnts_get_info
mt_fnts_get_info:
		move.l     #0x00000188,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fnts_get_name
mt_fnts_get_name:
		move.l     #0x0000018C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fnts_get_no_styles
mt_fnts_get_no_styles:
		move.l     #0x00000190,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fnts_get_style
mt_fnts_get_style:
		move.l     #0x00000194,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fnts_open
mt_fnts_open:
		move.l     #0x00000198,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fnts_remove
mt_fnts_remove:
		move.l     #0x0000019C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_fnts_update
mt_fnts_update:
		move.l     #0x000001A0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_ascroll_to
mt_lbox_ascroll_to:
		move.l     #0x000001A4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_scroll_to
mt_lbox_scroll_to:
		move.l     #0x000001A8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_bscroll_to
mt_lbox_bscroll_to:
		move.l     #0x000001AC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_cnt_items
mt_lbox_cnt_items:
		move.l     #0x000001B0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_create
mt_lbox_create:
		move.l     #0x000001B4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_delete
mt_lbox_delete:
		move.l     #0x000001B8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_do
mt_lbox_do:
		move.l     #0x000001BC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_free_items
mt_lbox_free_items:
		move.l     #0x000001C0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_free_list
mt_lbox_free_list:
		move.l     #0x000001C4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_get_afirst
mt_lbox_get_afirst:
		move.l     #0x000001C8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_get_first
mt_lbox_get_first:
		move.l     #0x000001CC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_get_avis
mt_lbox_get_avis:
		move.l     #0x000001D0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_get_visible
mt_lbox_get_visible:
		move.l     #0x000001D4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_get_bentries
mt_lbox_get_bentries:
		move.l     #0x000001D8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_get_bfirst
mt_lbox_get_bfirst:
		move.l     #0x000001DC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_get_idx
mt_lbox_get_idx:
		move.l     #0x000001E0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_get_item
mt_lbox_get_item:
		move.l     #0x000001E4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_get_items
mt_lbox_get_items:
		move.l     #0x000001E8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_get_slct_idx
mt_lbox_get_slct_idx:
		move.l     #0x000001EC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_get_slct_item
mt_lbox_get_slct_item:
		move.l     #0x000001F0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_get_tree
mt_lbox_get_tree:
		move.l     #0x000001F4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_get_udata
mt_lbox_get_udata:
		move.l     #0x000001F8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_set_asldr
mt_lbox_set_asldr:
		move.l     #0x000001FC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_set_slider
mt_lbox_set_slider:
		move.l     #0x00000200,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_set_bentries
mt_lbox_set_bentries:
		move.l     #0x00000204,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_set_bsldr
mt_lbox_set_bsldr:
		move.l     #0x00000208,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_set_items
mt_lbox_set_items:
		move.l     #0x0000020C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_lbox_update
mt_lbox_update:
		move.l     #0x00000210,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_add_printers
mt_pdlg_add_printers:
		move.l     #0x00000214,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_add_sub_dialogs
mt_pdlg_add_sub_dialogs:
		move.l     #0x00000218,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_close
mt_pdlg_close:
		move.l     #0x0000021C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_create
mt_pdlg_create:
		move.l     #0x00000220,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_delete
mt_pdlg_delete:
		move.l     #0x00000224,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_dflt_settings
mt_pdlg_dflt_settings:
		move.l     #0x00000228,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_do
mt_pdlg_do:
		move.l     #0x0000022C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_evnt
mt_pdlg_evnt:
		move.l     #0x00000230,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_free_settings
mt_pdlg_free_settings:
		move.l     #0x00000234,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_get_setsize
mt_pdlg_get_setsize:
		move.l     #0x00000238,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_new_settings
mt_pdlg_new_settings:
		move.l     #0x0000023C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_open
mt_pdlg_open:
		move.l     #0x00000240,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_remove_printers
mt_pdlg_remove_printers:
		move.l     #0x00000244,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_remove_sub_dialogs
mt_pdlg_remove_sub_dialogs:
		move.l     #0x00000248,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_update
mt_pdlg_update:
		move.l     #0x0000024C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_use_settings
mt_pdlg_use_settings:
		move.l     #0x00000250,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_pdlg_validate_settings
mt_pdlg_validate_settings:
		move.l     #0x00000254,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_create
mt_edit_create:
		move.l     #0x00000258,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_set_buf
mt_edit_set_buf:
		move.l     #0x0000025C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_open
mt_edit_open:
		move.l     #0x00000260,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_close
mt_edit_close:
		move.l     #0x00000264,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_delete
mt_edit_delete:
		move.l     #0x00000268,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_cursor
mt_edit_cursor:
		move.l     #0x0000026C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_evnt
mt_edit_evnt:
		move.l     #0x00000270,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_get_buf
mt_edit_get_buf:
		move.l     #0x00000274,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_get_format
mt_edit_get_format:
		move.l     #0x00000278,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_get_colour
mt_edit_get_colour:
		move.l     #0x0000027C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_get_color
mt_edit_get_color:
		move.l     #0x00000280,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_get_font
mt_edit_get_font:
		move.l     #0x00000284,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_get_cursor
mt_edit_get_cursor:
		move.l     #0x00000288,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_get_dirty
mt_edit_get_dirty:
		move.l     #0x0000028C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_get_sel
mt_edit_get_sel:
		move.l     #0x00000290,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_get_scrollinfo
mt_edit_get_scrollinfo:
		move.l     #0x00000294,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_set_format
mt_edit_set_format:
		move.l     #0x00000298,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_set_colour
mt_edit_set_colour:
		move.l     #0x0000029C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_set_color
mt_edit_set_color:
		move.l     #0x000002A0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_set_font
mt_edit_set_font:
		move.l     #0x000002A4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_set_cursor
mt_edit_set_cursor:
		move.l     #0x000002A8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_resized
mt_edit_resized:
		move.l     #0x000002AC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_set_dirty
mt_edit_set_dirty:
		move.l     #0x000002B0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_edit_scroll
mt_edit_scroll:
		move.l     #0x000002B4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_EvntMulti
mt_EvntMulti:
		move.l     #0x000002B8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_form_wbutton
mt_form_wbutton:
		move.l     #0x000002BC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_form_xdial
mt_form_xdial:
		move.l     #0x000002C0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_form_xdo
mt_form_xdo:
		move.l     #0x000002C4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_form_xerr
mt_form_xerr:
		move.l     #0x000002C8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_wwatchbox
mt_graf_wwatchbox:
		move.l     #0x000002CC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_xhandle
mt_graf_xhandle:
		move.l     #0x000002D0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_create
mt_wdlg_create:
		move.l     #0x000002D4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_open
mt_wdlg_open:
		move.l     #0x000002D8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_close
mt_wdlg_close:
		move.l     #0x000002DC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_delete
mt_wdlg_delete:
		move.l     #0x000002E0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_get_tree
mt_wdlg_get_tree:
		move.l     #0x000002E4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_get_edit
mt_wdlg_get_edit:
		move.l     #0x000002E8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_get_udata
mt_wdlg_get_udata:
		move.l     #0x000002EC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_get_handle
mt_wdlg_get_handle:
		move.l     #0x000002F0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_set_edit
mt_wdlg_set_edit:
		move.l     #0x000002F4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_set_tree
mt_wdlg_set_tree:
		move.l     #0x000002F8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_set_size
mt_wdlg_set_size:
		move.l     #0x000002FC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_set_iconify
mt_wdlg_set_iconify:
		move.l     #0x00000300,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_set_uniconify
mt_wdlg_set_uniconify:
		move.l     #0x00000304,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_evnt
mt_wdlg_evnt:
		move.l     #0x00000308,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wdlg_redraw
mt_wdlg_redraw:
		move.l     #0x0000030C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_wind_draw
mt_wind_draw:
		move.l     #0x00000310,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_scrp_clear
mt_scrp_clear:
		move.l     #0x00000314,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_objc_xedit
mt_objc_xedit:
		move.l     #0x00000318,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
	.globl mt_graf_rubbbox
mt_graf_rubbbox:
		move.l     #0x0000031C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect

	.data

	.globl errno
errno: dc.w 0
	.globl _FilSysVec
_FilSysVec:
	dc.l 0
