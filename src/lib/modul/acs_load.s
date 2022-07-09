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

WITH_EXTENSIONS equ 1

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
	.globl ABP_CREATE
Abp_create:
ABP_CREATE:
		move.l     #0x00000000,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
		.globl Abp_delete
		.globl ABP_DELETE
Abp_delete:
ABP_DELETE:
		move.l     #0x00000004,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
		.globl Abp_start
		.globl ABP_START
Abp_start:
ABP_START:
		move.l     #0x00000008,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
		.globl Abp_end
		.globl ABP_END
Abp_end:
ABP_END:
		move.l     #0x0000000C,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
		.globl Abp_mfdb2img
		.globl ABP_MFDB2IMG
Abp_mfdb2img:
ABP_MFDB2IMG:
		move.l     #0x00000010,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect
		.globl Abp_img2mfdb
		.globl ABP_IMG2MFDB
Abp_img2mfdb:
ABP_IMG2MFDB:
		move.l     #0x00000014,-(a7)
		move.l     funcAbp(pc),-(a7)
		bra.s      indirect

/* config */
	.globl Acfg_create
	.globl ACFG_CREATE
Acfg_create:
ACFG_CREATE:
		move.l     #0x00000000,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra.s      indirect
		.globl Acfg_delete
		.globl ACFG_DELETE
Acfg_delete:
ACFG_DELETE:
		move.l     #0x00000004,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra.s      indirect
		.globl Acfg_clear
		.globl ACFG_CLEAR
Acfg_clear:
ACFG_CLEAR:
		move.l     #0x00000008,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra.s      indirect
		.globl Acfg_clearAllGroups
		.globl ACFG_CLEARALLGROUPS
Acfg_clearAllGroups:
ACFG_CLEARALLGROUPS:
		move.l     #0x0000000C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_clearGroup
		.globl ACFG_CLEARGROUP
Acfg_clearGroup:
ACFG_CLEARGROUP:
		move.l     #0x00000010,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_load
		.globl ACFG_LOAD
Acfg_load:
ACFG_LOAD:
		move.l     #0x00000014,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_save
		.globl ACFG_SAVE
Acfg_save:
ACFG_SAVE:
		move.l     #0x00000018,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_isChanged
		.globl ACFG_ISCHANGED
Acfg_isChanged:
ACFG_ISCHANGED:
		move.l     #0x0000001C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_getValue
		.globl ACFG_GETVALUE
Acfg_getValue:
ACFG_GETVALUE:
		move.l     #0x00000020,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_setValue
		.globl ACFG_SETVALUE
Acfg_setValue:
ACFG_SETVALUE:
		move.l     #0x00000024,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_clearValue
		.globl ACFG_CLEARVALUE
Acfg_clearValue:
ACFG_CLEARVALUE:
		move.l     #0x00000028,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_getChar
		.globl ACFG_GETCHAR
Acfg_getChar:
ACFG_GETCHAR:
		move.l     #0x0000002C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_setChar
		.globl ACFG_SETCHAR
Acfg_setChar:
ACFG_SETCHAR:
		move.l     #0x00000030,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_getLong
		.globl ACFG_GETLONG
Acfg_getLong:
ACFG_GETLONG:
		move.l     #0x00000034,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_setLong
		.globl ACFG_SETLONG
Acfg_setLong:
ACFG_SETLONG:
		move.l     #0x00000038,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_getString
		.globl ACFG_GETSTRING
Acfg_getString:
ACFG_GETSTRING:
		move.l     #0x0000003C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_getBool
		.globl ACFG_GETBOOL
Acfg_getBool:
ACFG_GETBOOL:
		move.l     #0x00000040,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_setBool
		.globl ACFG_SETBOOL
Acfg_setBool:
ACFG_SETBOOL:
		move.l     #0x00000044,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_clearHeader
		.globl ACFG_CLEARHEADER
Acfg_clearHeader:
ACFG_CLEARHEADER:
		move.l     #0x00000048,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_headAnzahl
		.globl ACFG_HEADANZAHL
Acfg_headAnzahl:
ACFG_HEADANZAHL:
		move.l     #0x0000004C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_setHeader
		.globl ACFG_SETHEADER
Acfg_setHeader:
ACFG_SETHEADER:
		move.l     #0x00000050,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_getHeader
		.globl ACFG_GETHEADER
Acfg_getHeader:
ACFG_GETHEADER:
		move.l     #0x00000054,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_grpAnzahl
		.globl ACFG_GRPANZAHL
Acfg_grpAnzahl:
ACFG_GRPANZAHL:
		move.l     #0x00000058,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_grpName
		.globl ACFG_GRPNAME
Acfg_grpName:
ACFG_GRPNAME:
		move.l     #0x0000005C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_strAnzahl
		.globl ACFG_STRANZAHL
Acfg_strAnzahl:
ACFG_STRANZAHL:
		move.l     #0x00000060,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_strName
		.globl ACFG_STRNAME
Acfg_strName:
ACFG_STRNAME:
		move.l     #0x00000064,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_strValue
		.globl ACFG_STRVALUE
Acfg_strValue:
ACFG_STRVALUE:
		move.l     #0x00000068,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_strIsComment
		.globl ACFG_STRISCOMMENT
Acfg_strIsComment:
ACFG_STRISCOMMENT:
		move.l     #0x0000006C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_isCfgfile
		.globl ACFG_ISCFGFILE
Acfg_isCfgfile:
ACFG_ISCFGFILE:
		move.l     #0x00000070,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_createInfo
		.globl ACFG_CREATEINFO
Acfg_createInfo:
ACFG_CREATEINFO:
		move.l     #0x00000074,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_deleteInfo
		.globl ACFG_DELETEINFO
Acfg_deleteInfo:
ACFG_DELETEINFO:
		move.l     #0x00000078,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_setInfo
		.globl ACFG_SETINFO
Acfg_setInfo:
ACFG_SETINFO:
		move.l     #0x0000007C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_getInfo
		.globl ACFG_GETINFO
Acfg_getInfo:
ACFG_GETINFO:
		move.l     #0x00000080,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_copyInfo
		.globl ACFG_COPYINFO
Acfg_copyInfo:
ACFG_COPYINFO:
		move.l     #0x00000084,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_flags
		.globl ACFG_FLAGS
Acfg_flags:
ACFG_FLAGS:
		move.l     #0x00000088,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_isGroupPresent
		.globl ACFG_ISGROUPPRESENT
Acfg_isGroupPresent:
ACFG_ISGROUPPRESENT:
		move.l     #0x0000008C,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_isStringPresent
		.globl ACFG_ISSTRINGPRESENT
Acfg_isStringPresent:
ACFG_ISSTRINGPRESENT:
		move.l     #0x00000090,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
		.globl Acfg_getDouble
		.globl ACFG_GETDOUBLE
Acfg_getDouble:
ACFG_GETDOUBLE:
		move.l     #0x00000094,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.globl Acfg_setDouble
		.globl ACFG_SETDOUBLE
Acfg_setDouble:
ACFG_SETDOUBLE:
		move.l     #0x00000098,-(a7)
		move.l     funcAcfg(pc),-(a7)
		bra        indirect
		.ENDC

/* character */
	.globl Ach_tolower
	.globl ACH_TOLOWER
Ach_tolower:
ACH_TOLOWER:
		move.l     #0x00000000,-(a7)
		move.l     funcAch(pc),-(a7)
		bra        indirect
		.globl Ach_toupper
		.globl ACH_TOUPPER
Ach_toupper:
ACH_TOUPPER:
		move.l     #0x00000004,-(a7)
		move.l     funcAch(pc),-(a7)
		bra        indirect
		.globl Ach_isWhite
		.globl ACH_ISWHITE
Ach_isWhite:
ACH_ISWHITE:
		move.l     #0x00000008,-(a7)
		move.l     funcAch(pc),-(a7)
		bra        indirect

/* selection */
	.globl Adr_box
	.globl ADR_BOX
Adr_box:
ADR_BOX:
		move.l     #0x00000000,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
		.globl Adr_drag
		.globl ADR_DRAG
Adr_drag:
ADR_DRAG:
		move.l     #0x00000004,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
		.globl Adr_next
		.globl ADR_NEXT
Adr_next:
ADR_NEXT:
		move.l     #0x00000008,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
		.globl Adr_add
		.globl ADR_ADD
Adr_add:
ADR_ADD:
		move.l     #0x0000000C,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
		.globl Adr_del
		.globl ADR_DEL
Adr_del:
ADR_DEL:
		move.l     #0x00000010,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
		.globl Adr_unselect
		.globl ADR_UNSELECT
Adr_unselect:
ADR_UNSELECT:
		move.l     #0x00000014,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect
		.globl Adr_start
		.globl ADR_START
Adr_start:
ADR_START:
		move.l     #0x00000018,-(a7)
		move.l     funcAdr(pc),-(a7)
		bra        indirect

/* event */
	.globl Aev_quit
	.globl AEV_QUIT
Aev_quit:
AEV_QUIT:
		move.l     #0x00000000,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
		.globl Aev_release
		.globl AEV_RELEASE
Aev_release:
AEV_RELEASE:
		move.l     #0x00000004,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
		.globl Aev_mess
		.globl AEV_MESS
Aev_mess:
AEV_MESS:
		move.l     #0x00000008,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
		.globl Aev_unhidepointer
		.globl AEV_UNHIDEPOINTER
Aev_unhidepointer:
AEV_UNHIDEPOINTER:
		move.l     #0x0000000C,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
		.globl Aev_DhstAdd
		.globl AEV_DHSTADD
Aev_DhstAdd:
AEV_DHSTADD:
		move.l     #0x00000010,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
		.globl Aev_DhstSaved
		.globl AEV_DHSTSAVED
Aev_DhstSaved:
AEV_DHSTSAVED:
		move.l     #0x00000014,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect
		.globl Aev_WmRedraw
		.globl AEV_WMREDRAW
Aev_WmRedraw:
AEV_WMREDRAW:
		move.l     #0x00000018,-(a7)
		move.l     funcAev(pc),-(a7)
		bra        indirect

/* file utilities */
	.globl Af_cfgfile
	.globl AF_CFGFILE
Af_cfgfile:
AF_CFGFILE:
		move.l     #0x00000000,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_select
		.globl AF_SELECT
Af_select:
AF_SELECT:
		move.l     #0x00000004,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_2drv
		.globl AF_2DRV
Af_2drv:
AF_2DRV:
		move.l     #0x00000008,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_2path
		.globl AF_2PATH
Af_2path:
AF_2PATH:
		move.l     #0x0000000C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_2name
		.globl AF_2NAME
Af_2name:
AF_2NAME:
		move.l     #0x00000010,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_2fullname
		.globl AF_2FULLNAME
Af_2fullname:
AF_2FULLNAME:
		move.l     #0x00000014,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_2ext
		.globl AF_2EXT
Af_2ext:
AF_2EXT:
		move.l     #0x00000018,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_buildname
		.globl AF_BUILDNAME
Af_buildname:
AF_BUILDNAME:
		move.l     #0x0000001C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_length
		.globl AF_LENGTH
Af_length:
AF_LENGTH:
		move.l     #0x00000020,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_first_fsel
		.globl AF_FIRST_FSEL
Af_first_fsel:
AF_FIRST_FSEL:
		move.l     #0x00000024,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_next_fsel
		.globl AF_NEXT_FSEL
Af_next_fsel:
AF_NEXT_FSEL:
		move.l     #0x00000028,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_first
		.globl AF_FIRST
Af_first:
AF_FIRST:
		move.l     #0x0000002C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_next
		.globl AF_NEXT
Af_next:
AF_NEXT:
		move.l     #0x00000030,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_readdir
		.globl AF_READDIR
Af_readdir:
AF_READDIR:
		move.l     #0x00000034,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_freedir
		.globl AF_FREEDIR
Af_freedir:
AF_FREEDIR:
		move.l     #0x00000038,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_fileselect
		.globl AF_FILESELECT
Af_fileselect:
AF_FILESELECT:
		move.l     #0x0000003C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_quote
		.globl AF_QUOTE
Af_quote:
AF_QUOTE:
		move.l     #0x00000040,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_unquote
		.globl AF_UNQUOTE
Af_unquote:
AF_UNQUOTE:
		move.l     #0x00000044,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
		.globl Af_chgExt
		.globl AF_CHGEXT
Af_chgExt:
AF_CHGEXT:
		move.l     #0x00000048,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.globl Af_pathconf
		.globl AF_PATHCONF
Af_pathconf:
AF_PATHCONF:
		move.l     #0x0000004C,-(a7)
		move.l     funcAf(pc),-(a7)
		bra        indirect
		.ENDC

/* icons */
	.globl Aic_create
	.globl AIC_CREATE
Aic_create:
AIC_CREATE:
		move.l     #0x00000000,-(a7)
		move.l     funcAic(pc),-(a7)
		bra        indirect
		.globl Aic_delete
		.globl AIC_DELETE
Aic_delete:
AIC_DELETE:
		move.l     #0x00000004,-(a7)
		move.l     funcAic(pc),-(a7)
		bra        indirect

/* images */
	.globl Aim_create
	.globl AIM_CREATE
Aim_create:
AIM_CREATE:
		move.l     #0x00000000,-(a7)
		move.l     funcAim(pc),-(a7)
		bra        indirect
		.globl Aim_delete
		.globl AIM_DELETE
Aim_delete:
AIM_DELETE:
		move.l     #0x00000004,-(a7)
		move.l     funcAim(pc),-(a7)
		bra        indirect

/* lists */
	.globl Alu_create
	.globl ALU_CREATE
Alu_create:
ALU_CREATE:
		move.l     #0x00000000,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.globl Alu_delete
		.globl ALU_DELETE
Alu_delete:
ALU_DELETE:
		move.l     #0x00000004,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
		.globl As_create
		.globl AS_CREATE
As_create:
AS_CREATE:
		move.l     #0x00000008,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.globl As_delete
		.globl AS_DELETE
As_delete:
AS_DELETE:
		move.l     #0x0000000C,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.globl Aqu_create
		.globl AQU_CREATE
Aqu_create:
AQU_CREATE:
		move.l     #0x00000010,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.globl Aqu_delete
		.globl AQU_DELETE
Aqu_delete:
AQU_DELETE:
		move.l     #0x00000014,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.globl Alu_ptrCmp
		.globl ALU_PTRCMP
Alu_ptrCmp:
ALU_PTRCMP:
		move.l     #0x00000018,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.globl Alu_longCmp
		.globl ALU_LONGCMP
Alu_longCmp:
ALU_LONGCMP:
		move.l     #0x0000001C,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.globl Alu_intCmp
		.globl ALU_INTCMP
Alu_intCmp:
ALU_INTCMP:
		move.l     #0x00000020,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.globl Alu_charCmp
		.globl ALU_CHARCMP
Alu_charCmp:
ALU_CHARCMP:
		move.l     #0x00000024,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.globl Alu_strCmp
		.globl ALU_STRCMP
Alu_strCmp:
ALU_STRCMP:
		move.l     #0x00000028,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.globl Alu_striCmp
		.globl ALU_STRICMP
Alu_striCmp:
ALU_STRICMP:
		move.l     #0x0000002C,-(a7)
		move.l     funcAlu(pc),-(a7)
		bra        indirect
		.ENDC

/* menus */
	.globl Ame_namefix
	.globl AME_NAMEFIX
Ame_namefix:
AME_NAMEFIX:
		move.l     #0x00000000,-(a7)
		move.l     funcAme(pc),-(a7)
		bra        indirect
		.globl Ame_popup
		.globl AME_POPUP
Ame_popup:
AME_POPUP:
		move.l     #0x00000004,-(a7)
		move.l     funcAme(pc),-(a7)
		bra        indirect

/* mouse */
	.globl Amo_new
	.globl AMO_NEW
Amo_new:
AMO_NEW:
		move.l     #0x00000000,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect
		.globl Amo_busy
		.globl AMO_BUSY
Amo_busy:
AMO_BUSY:
		move.l     #0x00000004,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect
		.globl Amo_unbusy
		.globl AMO_UNBUSY
Amo_unbusy:
AMO_UNBUSY:
		move.l     #0x00000008,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect
		.globl Amo_hide
		.globl AMO_HIDE
Amo_hide:
AMO_HIDE:
		move.l     #0x0000000C,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect
		.globl Amo_show
		.globl AMO_SHOW
Amo_show:
AMO_SHOW:
		move.l     #0x00000010,-(a7)
		move.l     funcAmo(pc),-(a7)
		bra        indirect

/* objects */
	.globl Aob_create
	.globl AOB_CREATE
Aob_create:
AOB_CREATE:
		move.l     #0x00000000,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_delete
		.globl AOB_DELETE
Aob_delete:
AOB_DELETE:
		move.l     #0x00000004,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_fix
		.globl AOB_FIX
Aob_fix:
AOB_FIX:
		move.l     #0x00000008,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_offset
		.globl AOB_OFFSET
Aob_offset:
AOB_OFFSET:
		move.l     #0x0000000C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_save
		.globl AOB_SAVE
Aob_save:
AOB_SAVE:
		move.l     #0x00000010,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_restore
		.globl AOB_RESTORE
Aob_restore:
AOB_RESTORE:
		move.l     #0x00000014,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_watch
		.globl AOB_WATCH
Aob_watch:
AOB_WATCH:
		move.l     #0x00000018,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_findflag
		.globl AOB_FINDFLAG
Aob_findflag:
AOB_FINDFLAG:
		move.l     #0x0000001C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_alias
		.globl AOB_ALIAS
Aob_alias:
AOB_ALIAS:
		move.l     #0x00000020,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_up
		.globl AOB_UP
Aob_up:
AOB_UP:
		move.l     #0x00000024,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_icon
		.globl AOB_ICON
Aob_icon:
AOB_ICON:
		move.l     #0x00000028,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_puttext
		.globl AOB_PUTTEXT
Aob_puttext:
AOB_PUTTEXT:
		move.l     #0x0000002C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_gettext
		.globl AOB_GETTEXT
Aob_gettext:
AOB_GETTEXT:
		move.l     #0x00000030,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_within
		.globl AOB_WITHIN
Aob_within:
AOB_WITHIN:
		move.l     #0x00000034,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_printf
		.globl AOB_PRINTF
Aob_printf:
AOB_PRINTF:
		move.l     #0x00000038,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_scanf
		.globl AOB_SCANF
Aob_scanf:
AOB_SCANF:
		move.l     #0x0000003C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_flags
		.globl AOB_FLAGS
Aob_flags:
AOB_FLAGS:
		move.l     #0x00000040,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_state
		.globl AOB_STATE
Aob_state:
AOB_STATE:
		move.l     #0x00000044,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_service
		.globl AOB_SERVICE
Aob_service:
AOB_SERVICE:
		move.l     #0x00000048,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_visible
		.globl AOB_VISIBLE
Aob_visible:
AOB_VISIBLE:
		move.l     #0x0000004C,-(a7)
		move.l     funcAob(pc),-(a7)
		bra        indirect
		.globl Aob_count
		.globl AOB_COUNT
Aob_count:
AOB_COUNT:
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
	.globl ASCRP_CLEAR
Ascrp_clear:
ASCRP_CLEAR:
		move.l     #0x00000000,-(a7)
		move.l     funcAscrp(pc),-(a7)
		bra        indirect
		.globl Ascrp_get
		.globl ASCRP_GET
Ascrp_get:
ASCRP_GET:
		move.l     #0x00000004,-(a7)
		move.l     funcAscrp(pc),-(a7)
		bra        indirect
		.globl Ascrp_put
		.globl ASCRP_PUT
Ascrp_put:
ASCRP_PUT:
		move.l     #0x00000008,-(a7)
		move.l     funcAscrp(pc),-(a7)
		bra        indirect

/* shell */
	.globl Ash_prog
	.globl ASH_PROG
Ash_prog:
ASH_PROG:
		move.l     #0x00000000,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_error
		.globl ASH_ERROR
Ash_error:
ASH_ERROR:
		move.l     #0x00000004,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_getcookie
		.globl ASH_GETCOOKIE
Ash_getcookie:
ASH_GETCOOKIE:
		move.l     #0x00000008,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_getenv
		.globl ASH_GETENV
Ash_getenv:
ASH_GETENV:
		move.l     #0x0000000C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_nextdd
		.globl ASH_NEXTDD
Ash_nextdd:
ASH_NEXTDD:
		move.l     #0x00000010,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_sendall
		.globl ASH_SENDALL
Ash_sendall:
ASH_SENDALL:
		move.l     #0x00000014,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_CallEdDI
		.globl ASH_CALLEDDI
Ash_CallEdDI:
ASH_CALLEDDI:
		move.l     #0x00000018,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_NVDICookie
		.globl ASH_NVDICOOKIE
Ash_NVDICookie:
ASH_NVDICOOKIE:
		move.l     #0x0000001C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_NVDIVersion
		.globl ASH_NVDIVERSION
Ash_NVDIVersion:
ASH_NVDIVERSION:
		move.l     #0x00000020,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_NVDIDatum
		.globl ASH_NVDIDATUM
Ash_NVDIDatum:
ASH_NVDIDATUM:
		move.l     #0x00000024,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_thermometer
		.globl ASH_THERMOMETER
Ash_thermometer:
ASH_THERMOMETER:
		move.l     #0x00000028,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_fileselect
		.globl ASH_FILESELECT
Ash_fileselect:
ASH_FILESELECT:
		move.l     #0x0000002C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_font
		.globl ASH_FONT
Ash_font:
ASH_FONT:
		move.l     #0x00000030,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_print
		.globl ASH_PRINT
Ash_print:
ASH_PRINT:
		move.l     #0x00000034,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_gettimer
		.globl ASH_GETTIMER
Ash_gettimer:
ASH_GETTIMER:
		move.l     #0x00000038,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_printSetIcon
		.globl ASH_PRINTSETICON
Ash_printSetIcon:
ASH_PRINTSETICON:
		move.l     #0x0000003C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_fontSetIcon
		.globl ASH_FONTSETICON
Ash_fontSetIcon:
ASH_FONTSETICON:
		move.l     #0x00000040,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_fileSetIcon
		.globl ASH_FILESETICON
Ash_fileSetIcon:
ASH_FILESETICON:
		move.l     #0x00000044,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_getOSHeader
		.globl ASH_GETOSHEADER
Ash_getOSHeader:
ASH_GETOSHEADER:
		move.l     #0x00000048,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_getMagiC
		.globl ASH_GETMAGIC
Ash_getMagiC:
ASH_GETMAGIC:
		move.l     #0x0000004C,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_getNAES
		.globl ASH_GETNAES
Ash_getNAES:
ASH_GETNAES:
		move.l     #0x00000050,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_getMagiCVersion
		.globl ASH_GETMAGICVERSION
Ash_getMagiCVersion:
ASH_GETMAGICVERSION:
		move.l     #0x00000054,-(a7)
		move.l     funcAsh(pc),-(a7)
		bra        indirect
		.globl Ash_getMagiCAESVars
		.globl ASH_GETMAGICAESVARS
Ash_getMagiCAESVars:
ASH_GETMAGICAESVARS:
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
	.globl AST_CREATE
Ast_create:
AST_CREATE:
		move.l     #0x00000000,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_delete
		.globl AST_DELETE
Ast_delete:
AST_DELETE:
		move.l     #0x00000004,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_tolower
		.globl AST_TOLOWER
Ast_tolower:
AST_TOLOWER:
		move.l     #0x00000008,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_toupper
		.globl AST_TOUPPER
Ast_toupper:
AST_TOUPPER:
		move.l     #0x0000000C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_ltrim
		.globl AST_LTRIM
Ast_ltrim:
AST_LTRIM:
		move.l     #0x00000010,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_rtrim
		.globl AST_RTRIM
Ast_rtrim:
AST_RTRIM:
		move.l     #0x00000014,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_alltrim
		.globl AST_ALLTRIM
Ast_alltrim:
AST_ALLTRIM:
		move.l     #0x00000018,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_cmp
		.globl AST_CMP
Ast_cmp:
AST_CMP:
		move.l     #0x0000001C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_icmp
		.globl AST_ICMP
Ast_icmp:
AST_ICMP:
		move.l     #0x00000020,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_isEmpty
		.globl AST_ISEMPTY
Ast_isEmpty:
AST_ISEMPTY:
		move.l     #0x00000024,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_add
		.globl AST_ADD
Ast_add:
AST_ADD:
		move.l     #0x00000028,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_adl
		.globl AST_ADL
Ast_adl:
AST_ADL:
		move.l     #0x0000002C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_adr
		.globl AST_ADR
Ast_adr:
AST_ADR:
		move.l     #0x00000030,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_adc
		.globl AST_ADC
Ast_adc:
AST_ADC:
		move.l     #0x00000034,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_filter
		.globl AST_FILTER
Ast_filter:
AST_FILTER:
		move.l     #0x00000038,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_count
		.globl AST_COUNT
Ast_count:
AST_COUNT:
		move.l     #0x0000003C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_fcmp
		.globl AST_FCMP
Ast_fcmp:
AST_FCMP:
		move.l     #0x00000040,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_ncmp
		.globl AST_NCMP
Ast_ncmp:
AST_NCMP:
		move.l     #0x00000044,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_incmp
		.globl AST_INCMP
Ast_incmp:
AST_INCMP:
		move.l     #0x00000048,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect
		.globl Ast_istr
		.globl AST_ISTR
Ast_istr:
AST_ISTR:
		move.l     #0x0000004C,-(a7)
		move.l     funcAst(pc),-(a7)
		bra        indirect

/* tedinfos */
	.globl Ate_create
	.globl ATE_CREATE
Ate_create:
ATE_CREATE:
		move.l     #0x00000000,-(a7)
		move.l     funcAte(pc),-(a7)
		bra        indirect
		.globl Ate_delete
		.globl ATE_DELETE
Ate_delete:
ATE_DELETE:
		move.l     #0x00000004,-(a7)
		move.l     funcAte(pc),-(a7)
		bra        indirect

/* user objects */
	.globl Auo_ftext
	.globl AUO_FTEXT
Auo_ftext:
AUO_FTEXT:
		move.l     #0x00000000,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect
		.globl Auo_string
		.globl AUO_STRING
Auo_string:
AUO_STRING:
		move.l     #0x00000004,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect
		.globl Auo_cycle
		.globl AUO_CYCLE
Auo_cycle:
AUO_CYCLE:
		move.l     #0x00000008,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect
		.globl Auo_picture
		.globl AUO_PICTURE
Auo_picture:
AUO_PICTURE:
		move.l     #0x0000000C,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect
		.globl Auo_boxed
		.globl AUO_BOXED
Auo_boxed:
AUO_BOXED:
		move.l     #0x00000010,-(a7)
		move.l     funcAuo(pc),-(a7)
		bra        indirect

/* user services */
	.globl Aus_create
	.globl AUS_CREATE
Aus_create:
AUS_CREATE:
		move.l     #0x00000000,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
		.globl Aus_delete
		.globl AUS_DELETE
Aus_delete:
AUS_DELETE:
		move.l     #0x00000004,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
		.globl Aus_boxed
		.globl AUS_BOXED
Aus_boxed:
AUS_BOXED:
		move.l     #0x00000008,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
		.globl Aus_cycle
		.globl AUS_CYCLE
Aus_cycle:
AUS_CYCLE:
		move.l     #0x0000000C,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
		.globl Aus_help
Aus_help:
		move.l     #0x00000010,-(a7)
		move.l     funcAus(pc),-(a7)
		bra        indirect
		.ENDC

/* windows */
	.globl Awi_wid
	.globl AWI_WID
Awi_wid:
AWI_WID:
		move.l     #0x00000000,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_root
		.globl AWI_ROOT
Awi_root:
AWI_ROOT:
		move.l     #0x00000004,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_list
		.globl AWI_LIST
Awi_list:
AWI_LIST:
		move.l     #0x00000008,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_sendall
		.globl AWI_SENDALL
Awi_sendall:
AWI_SENDALL:
		move.l     #0x0000000C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_down
		.globl AWI_DOWN
Awi_down:
AWI_DOWN:
		move.l     #0x00000010,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_up
		.globl AWI_UP
Awi_up:
AWI_UP:
		move.l     #0x00000014,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_show
		.globl AWI_SHOW
Awi_show:
AWI_SHOW:
		move.l     #0x00000018,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_init
		.globl AWI_INIT
Awi_init:
AWI_INIT:
		move.l     #0x0000001C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_create
		.globl AWI_CREATE
Awi_create:
AWI_CREATE:
		move.l     #0x00000020,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_open
		.globl AWI_OPEN
Awi_open:
AWI_OPEN:
		move.l     #0x00000024,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_closed
		.globl AWI_CLOSED
Awi_closed:
AWI_CLOSED:
		move.l     #0x00000028,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_delete
		.globl AWI_DELETE
Awi_delete:
AWI_DELETE:
		move.l     #0x0000002C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_topped
		.globl AWI_TOPPED
Awi_topped:
AWI_TOPPED:
		move.l     #0x00000030,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_fulled
		.globl AWI_FULLED
Awi_fulled:
AWI_FULLED:
		move.l     #0x00000034,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_sized
		.globl AWI_SIZED
Awi_sized:
AWI_SIZED:
		move.l     #0x00000038,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_moved
		.globl AWI_MOVED
Awi_moved:
AWI_MOVED:
		move.l     #0x0000003C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_diaend
		.globl AWI_DIAEND
Awi_diaend:
AWI_DIAEND:
		move.l     #0x00000040,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_diastart
		.globl AWI_DIASTART
Awi_diastart:
AWI_DIASTART:
		move.l     #0x00000044,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_keys
		.globl AWI_KEYS
Awi_keys:
AWI_KEYS:
		move.l     #0x00000048,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_obview
		.globl AWI_OBVIEW
Awi_obview:
AWI_OBVIEW:
		move.l     #0x0000004C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_service
		.globl AWI_SERVICE
Awi_service:
AWI_SERVICE:
		move.l     #0x00000050,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_scroll
		.globl AWI_SCROLL
Awi_scroll:
AWI_SCROLL:
		move.l     #0x00000054,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_obchange
		.globl AWI_OBCHANGE
Awi_obchange:
AWI_OBCHANGE:
		move.l     #0x00000058,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_obredraw
		.globl AWI_OBREDRAW
Awi_obredraw:
AWI_OBREDRAW:
		move.l     #0x0000005C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_redraw
		.globl AWI_REDRAW
Awi_redraw:
AWI_REDRAW:
		move.l     #0x00000060,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_arrowed
		.globl AWI_ARROWED
Awi_arrowed:
AWI_ARROWED:
		move.l     #0x00000064,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_hslid
		.globl AWI_HSLID
Awi_hslid:
AWI_HSLID:
		move.l     #0x00000068,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_vslid
		.globl AWI_VSLID
Awi_vslid:
AWI_VSLID:
		move.l     #0x0000006C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_iconify
		.globl AWI_ICONIFY
Awi_iconify:
AWI_ICONIFY:
		move.l     #0x00000070,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_uniconify
		.globl AWI_UNICONIFY
Awi_uniconify:
AWI_UNICONIFY:
		move.l     #0x00000074,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_gemscript
		.globl AWI_GEMSCRIPT
Awi_gemscript:
AWI_GEMSCRIPT:
		move.l     #0x00000078,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_modal
		.globl AWI_MODAL
Awi_modal:
AWI_MODAL:
		move.l     #0x0000007C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_dialog
		.globl AWI_DIALOG
Awi_dialog:
AWI_DIALOG:
		move.l     #0x00000080,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_alert
		.globl AWI_ALERT
Awi_alert:
AWI_ALERT:
		move.l     #0x00000084,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_selfcreate
		.globl AWI_SELFCREATE
Awi_selfcreate:
AWI_SELFCREATE:
		move.l     #0x00000088,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_nokey
		.globl AWI_NOKEY
Awi_nokey:
AWI_NOKEY:
		move.l     #0x0000008C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_update
		.globl AWI_UPDATE
Awi_update:
AWI_UPDATE:
		move.l     #0x00000090,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_uoself
		.globl AWI_UOSELF
Awi_uoself:
AWI_UOSELF:
		move.l     #0x00000094,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_doform
		.globl AWI_DOFORM
Awi_doform:
AWI_DOFORM:
		move.l     #0x00000098,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_observice
		.globl AWI_OBSERVICE
Awi_observice:
AWI_OBSERVICE:
		move.l     #0x0000009C,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_ontop
		.globl AWI_ONTOP
Awi_ontop:
AWI_ONTOP:
		move.l     #0x000000A0,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_layout
		.globl AWI_LAYOUT
Awi_layout:
AWI_LAYOUT:
		move.l     #0x000000A4,-(a7)
		move.l     funcAwi(pc),-(a7)
		bra        indirect
		.globl Awi_obvisible
		.globl AWI_OBVISIBLE
Awi_obvisible:
AWI_OBVISIBLE:
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
	.globl A_DIALOG
A_dialog:
A_DIALOG:
		move.l     #0x00000000,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.globl A_checkbox
		.globl A_CHECKBOX
A_checkbox:
A_CHECKBOX:
		move.l     #0x00000004,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.globl A_radiobutton
		.globl A_RADIOBUTTON
A_radiobutton:
A_RADIOBUTTON:
		move.l     #0x00000008,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.globl A_innerframe
		.globl A_INNERFRAME
A_innerframe:
A_INNERFRAME:
		move.l     #0x0000000C,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.globl A_pattern
		.globl A_PATTERN
A_pattern:
A_PATTERN:
		move.l     #0x00000010,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.globl A_arrows
		.globl A_ARROWS
A_arrows:
A_ARROWS:
		move.l     #0x00000014,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.globl A_select
		.globl A_SELECT
A_select:
A_SELECT:
		move.l     #0x00000018,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.globl A_ftext
		.globl A_FTEXT
A_ftext:
A_FTEXT:
		move.l     #0x0000001C,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.globl A_title
		.globl A_TITLE
A_title:
A_TITLE:
		move.l     #0x00000020,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.globl A_3Dbutton
		.globl A_3DBUTTON
A_3Dbutton:
A_3DBUTTON:
		move.l     #0x00000024,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.globl A_cycle
		.globl A_CYCLE
A_cycle:
A_CYCLE:
		move.l     #0x00000028,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.globl A_picture
		.globl A_PICTURE
A_picture:
A_PICTURE:
		move.l     #0x0000002C,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.globl A_dialog2
		.globl A_DIALOG2
A_dialog2:
A_DIALOG2:
		move.l     #0x00000030,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect
		.globl A_boxed
		.globl A_BOXED
A_boxed:
A_BOXED:
		move.l     #0x00000034,-(a7)
		move.l     funcA(pc),-(a7)
		bra        indirect

/* misc */
	.globl Ax_malloc
	.globl AX_MALLOC
Ax_malloc:
AX_MALLOC:
		move.l     #0x00000000,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl Ax_free
		.globl AX_FREE
Ax_free:
AX_FREE:
		move.l     #0x00000004,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl Ax_ifree
		.globl AX_IFREE
Ax_ifree:
AX_IFREE:
		move.l     #0x00000008,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl Ax_glmalloc
		.globl AX_GLMALLOC
Ax_glmalloc:
AX_GLMALLOC:
		move.l     #0x0000000C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl Ax_glfree
		.globl AX_GLFREE
Ax_glfree:
AX_GLFREE:
		move.l     #0x00000010,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect

	.globl ACSmoduleterm
	.globl ACSMODULETERM
ACSmoduleterm:
ACSMODULETERM:
		movea.l    #compiler-256,a0
		move.l     #0x00000014,-(a7)  /* Ax_mterm */
		move.l     funcSonst(pc),-(a7)
		bra        indirect

	.globl alert_str
	.globl ALERT_STR
alert_str:
ALERT_STR:
		move.l     #0x00000018,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl intersect
		.globl INTERSECT
intersect:
INTERSECT:
		move.l     #0x0000001C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl xywh2array
		.globl XYWH2ARRAY
xywh2array:
XYWH2ARRAY:
		move.l     #0x00000020,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl array2xywh
		.globl ARRAY2XYWH
array2xywh:
ARRAY2XYWH:
		move.l     #0x00000024,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl dotted_xline
		.globl DOTTED_XLINE
dotted_xline:
DOTTED_XLINE:
		move.l     #0x00000028,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl dotted_yline
		.globl DOTTED_YLINE
dotted_yline:
DOTTED_YLINE:
		move.l     #0x0000002C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl nkc_tos2n
		.globl NKC_TOS2N
nkc_tos2n:
NKC_TOS2N:
		move.l     #0x00000030,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl nkc_n2tos
		.globl NKC_N2TOS
nkc_n2tos:
NKC_N2TOS:
		move.l     #0x00000034,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl nkc_gem2n
		.globl NKC_GEM2N
nkc_gem2n:
NKC_GEM2N:
		move.l     #0x00000038,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl nkc_n2gem
		.globl NKC_N2GEM
nkc_n2gem:
NKC_N2GEM:
		move.l     #0x0000003C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl nkc_gemks2n
		.globl NKC_GEMKS2N
nkc_gemks2n:
NKC_GEMKS2N:
		move.l     #0x00000040,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl nkc_n2gemks
		.globl NKC_N2GEMKS
nkc_n2gemks:
NKC_N2GEMKS:
		move.l     #0x00000044,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl nkc_n2kstate
		.globl NKC_N2KSTATE
nkc_n2kstate:
NKC_N2KSTATE:
		move.l     #0x00000048,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl nkc_kstate
		.globl NKC_KSTATE
nkc_kstate:
NKC_KSTATE:
		move.l     #0x0000004C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl nkc_cmp
		.globl NKC_CMP
nkc_cmp:
NKC_CMP:
		move.l     #0x00000050,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl nkc_tolower
		.globl NKC_TOLOWER
nkc_tolower:
NKC_TOLOWER:
		move.l     #0x00000054,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl nkc_toupper
		.globl NKC_TOUPPER
nkc_toupper:
NKC_TOUPPER:
		move.l     #0x00000058,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl appl_xgetinfo
		.globl APPL_XGETINFO
appl_xgetinfo:
APPL_XGETINFO:
		move.l     #0x0000005C,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl Ax_setRecycleSize
		.globl AX_SETRECYCLESIZE
Ax_setRecycleSize:
AX_SETRECYCLESIZE:
		move.l     #0x00000060,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl Ax_getRecycleStat
		.globl AX_GETRECYCLESTAT
Ax_getRecycleStat:
AX_GETRECYCLESTAT:
		move.l     #0x00000064,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl Ax_recycle
		.globl AX_RECYCLE
Ax_recycle:
AX_RECYCLE:
		move.l     #0x00000068,-(a7)
		move.l     funcSonst(pc),-(a7)
		bra        indirect
		.globl Avdi_getRGB
		.globl AVDI_GETRGB
Avdi_getRGB:
AVDI_GETRGB:
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
	.globl VDI
vdi:
VDI:
		move.l     #0x00000000,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vdi_
		.globl VDI_
vdi_:
VDI_:
		move.l     #0x00000004,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_opnwk
		.globl V_OPNWK
v_opnwk:
V_OPNWK:
		move.l     #0x00000008,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_clswk
		.globl V_CLSWK
v_clswk:
V_CLSWK:
		move.l     #0x0000000C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_opnvwk
		.globl V_OPNVWK
v_opnvwk:
V_OPNVWK:
		move.l     #0x00000010,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_clsvwk
		.globl V_CLSVWK
v_clsvwk:
V_CLSVWK:
		move.l     #0x00000014,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_clrwk
		.globl V_CLRWK
v_clrwk:
V_CLRWK:
		move.l     #0x00000018,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_updwk
		.globl V_UPDWK
v_updwk:
V_UPDWK:
		move.l     #0x0000001C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_opnbm
		.globl V_OPNBM
v_opnbm:
V_OPNBM:
		move.l     #0x00000020,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_clsbm
		.globl V_CLSBM
v_clsbm:
V_CLSBM:
		move.l     #0x00000024,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_load_fonts
		.globl VST_LOAD_FONTS
vst_load_fonts:
VST_LOAD_FONTS:
		move.l     #0x00000028,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_unload_fonts
		.globl VST_UNLOAD_FONTS
vst_unload_fonts:
VST_UNLOAD_FONTS:
		move.l     #0x0000002C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_clip
		.globl VS_CLIP
vs_clip:
VS_CLIP:
		move.l     #0x00000030,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_pline
		.globl V_PLINE
v_pline:
V_PLINE:
		move.l     #0x00000034,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_pmarker
		.globl V_PMARKER
v_pmarker:
V_PMARKER:
		move.l     #0x00000038,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_gtext
		.globl V_GTEXT
v_gtext:
V_GTEXT:
		move.l     #0x0000003C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_fillarea
		.globl V_FILLAREA
v_fillarea:
V_FILLAREA:
		move.l     #0x00000040,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_cellarray
		.globl V_CELLARRAY
v_cellarray:
V_CELLARRAY:
		move.l     #0x00000044,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_contourfill
		.globl V_CONTOURFILL
v_contourfill:
V_CONTOURFILL:
		move.l     #0x00000048,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_bar
		.globl V_BAR
v_bar:
V_BAR:
		move.l     #0x0000004C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_arc
		.globl V_ARC
v_arc:
V_ARC:
		move.l     #0x00000050,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_pieslice
		.globl V_PIESLICE
v_pieslice:
V_PIESLICE:
		move.l     #0x00000054,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_circle
		.globl V_CIRCLE
v_circle:
V_CIRCLE:
		move.l     #0x00000058,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_ellipse
		.globl V_ELLIPSE
v_ellipse:
V_ELLIPSE:
		move.l     #0x0000005C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_ellarc
		.globl V_ELLARC
v_ellarc:
V_ELLARC:
		move.l     #0x00000060,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_ellpie
		.globl V_ELLPIE
v_ellpie:
V_ELLPIE:
		move.l     #0x00000064,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_justified
		.globl V_JUSTIFIED
v_justified:
V_JUSTIFIED:
		move.l     #0x00000068,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vr_recfl
		.globl VR_RECFL
vr_recfl:
VR_RECFL:
		move.l     #0x0000006C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_rfbox
		.globl V_RFBOX
v_rfbox:
V_RFBOX:
		move.l     #0x00000070,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_rbox
		.globl V_RBOX
v_rbox:
V_RBOX:
		move.l     #0x00000074,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_gdos
		.globl VQ_GDOS
vq_gdos:
VQ_GDOS:
		move.l     #0x00000078,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vswr_mode
		.globl VSWR_MODE
vswr_mode:
VSWR_MODE:
		move.l     #0x0000007C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsl_type
		.globl VSL_TYPE
vsl_type:
VSL_TYPE:
		move.l     #0x00000080,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsl_udsty
		.globl VSL_UDSTY
vsl_udsty:
VSL_UDSTY:
		move.l     #0x00000084,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsl_width
		.globl VSL_WIDTH
vsl_width:
VSL_WIDTH:
		move.l     #0x00000088,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsl_color
		.globl VSL_COLOR
vsl_color:
VSL_COLOR:
		move.l     #0x0000008C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsl_ends
		.globl VSL_ENDS
vsl_ends:
VSL_ENDS:
		move.l     #0x00000090,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsm_type
		.globl VSM_TYPE
vsm_type:
VSM_TYPE:
		move.l     #0x00000094,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsm_height
		.globl VSM_HEIGHT
vsm_height:
VSM_HEIGHT:
		move.l     #0x00000098,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsm_color
		.globl VSM_COLOR
vsm_color:
VSM_COLOR:
		move.l     #0x0000009C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_height
		.globl VST_HEIGHT
vst_height:
VST_HEIGHT:
		move.l     #0x000000A0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_point
		.globl VST_POINT
vst_point:
VST_POINT:
		move.l     #0x000000A4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_rotation
		.globl VST_ROTATION
vst_rotation:
VST_ROTATION:
		move.l     #0x000000A8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_font
		.globl VST_FONT
vst_font:
VST_FONT:
		move.l     #0x000000AC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_color
		.globl VST_COLOR
vst_color:
VST_COLOR:
		move.l     #0x000000B0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_effects
		.globl VST_EFFECTS
vst_effects:
VST_EFFECTS:
		move.l     #0x000000B4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_alignment
		.globl VST_ALIGNMENT
vst_alignment:
VST_ALIGNMENT:
		move.l     #0x000000B8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsf_interior
		.globl VSF_INTERIOR
vsf_interior:
VSF_INTERIOR:
		move.l     #0x000000BC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsf_style
		.globl VSF_STYLE
vsf_style:
VSF_STYLE:
		move.l     #0x000000C0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsf_color
		.globl VSF_COLOR
vsf_color:
VSF_COLOR:
		move.l     #0x000000C4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsf_perimeter
		.globl VSF_PERIMETER
vsf_perimeter:
VSF_PERIMETER:
		move.l     #0x000000C8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsf_udpat
		.globl VSF_UDPAT
vsf_udpat:
VSF_UDPAT:
		move.l     #0x000000CC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsf_updat
		.globl VSF_UPDAT
vsf_updat:
VSF_UPDAT:
		move.l     #0x000000D0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_color
		.globl VS_COLOR
vs_color:
VS_COLOR:
		move.l     #0x000000D4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vr_trnfm
		.globl VR_TRNFM
vr_trnfm:
VR_TRNFM:
		move.l     #0x000000D8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vro_cpyfm
		.globl VRO_CPYFM
vro_cpyfm:
VRO_CPYFM:
		move.l     #0x000000DC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vrt_cpyfm
		.globl VRT_CPYFM
vrt_cpyfm:
VRT_CPYFM:
		move.l     #0x000000E0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_get_pixel
		.globl V_GET_PIXEL
v_get_pixel:
V_GET_PIXEL:
		move.l     #0x000000E4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsin_mode
		.globl VSIN_MODE
vsin_mode:
VSIN_MODE:
		move.l     #0x000000E8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vrq_locator
		.globl VRQ_LOCATOR
vrq_locator:
VRQ_LOCATOR:
		move.l     #0x000000EC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsm_locator
		.globl VSM_LOCATOR
vsm_locator:
VSM_LOCATOR:
		move.l     #0x000000F0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vrq_valuator
		.globl VRQ_VALUATOR
vrq_valuator:
VRQ_VALUATOR:
		move.l     #0x000000F4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsm_valuator
		.globl VSM_VALUATOR
vsm_valuator:
VSM_VALUATOR:
		move.l     #0x000000F8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vrq_choice
		.globl VRQ_CHOICE
vrq_choice:
VRQ_CHOICE:
		move.l     #0x000000FC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsm_choice
		.globl VSM_CHOICE
vsm_choice:
VSM_CHOICE:
		move.l     #0x00000100,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vrq_string
		.globl VRQ_STRING
vrq_string:
VRQ_STRING:
		move.l     #0x00000104,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsm_string
		.globl VSM_STRING
vsm_string:
VSM_STRING:
		move.l     #0x00000108,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vex_timv
		.globl VEX_TIMV
vex_timv:
VEX_TIMV:
		move.l     #0x0000010C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_show_c
		.globl V_SHOW_C
v_show_c:
V_SHOW_C:
		move.l     #0x00000110,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_hide_c
		.globl V_HIDE_C
v_hide_c:
V_HIDE_C:
		move.l     #0x00000114,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_mouse
		.globl VQ_MOUSE
vq_mouse:
VQ_MOUSE:
		move.l     #0x00000118,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vex_butv
		.globl VEX_BUTV
vex_butv:
VEX_BUTV:
		move.l     #0x0000011C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vex_motv
		.globl VEX_MOTV
vex_motv:
VEX_MOTV:
		move.l     #0x00000120,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vex_curv
		.globl VEX_CURV
vex_curv:
VEX_CURV:
		move.l     #0x00000124,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_key_s
		.globl VQ_KEY_S
vq_key_s:
VQ_KEY_S:
		move.l     #0x00000128,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_extnd
		.globl VQ_EXTND
vq_extnd:
VQ_EXTND:
		move.l     #0x0000012C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vql_attributes
		.globl VQL_ATTRIBUTES
vql_attributes:
VQL_ATTRIBUTES:
		move.l     #0x00000130,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqm_attributes
		.globl VQM_ATTRIBUTES
vqm_attributes:
VQM_ATTRIBUTES:
		move.l     #0x00000134,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqf_attributes
		.globl VQF_ATTRIBUTES
vqf_attributes:
VQF_ATTRIBUTES:
		move.l     #0x00000138,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_attributes
		.globl VQT_ATTRIBUTES
vqt_attributes:
VQT_ATTRIBUTES:
		move.l     #0x0000013C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_extent
		.globl VQT_EXTENT
vqt_extent:
VQT_EXTENT:
		move.l     #0x00000140,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_width
		.globl VQT_WIDTH
vqt_width:
VQT_WIDTH:
		move.l     #0x00000144,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_name
		.globl VQT_NAME
vqt_name:
VQT_NAME:
		move.l     #0x00000148,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqin_mode
		.globl VQIN_MODE
vqin_mode:
VQIN_MODE:
		move.l     #0x0000014C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_fontinfo
		.globl VQT_FONTINFO
vqt_fontinfo:
VQT_FONTINFO:
		move.l     #0x00000150,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_scrninfo
		.globl VQ_SCRNINFO
vq_scrninfo:
VQ_SCRNINFO:
		move.l     #0x00000154,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_color
		.globl VQ_COLOR
vq_color:
VQ_COLOR:
		move.l     #0x00000158,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_cellarray
		.globl VQ_CELLARRAY
vq_cellarray:
VQ_CELLARRAY:
		move.l     #0x0000015C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_chcells
		.globl VQ_CHCELLS
vq_chcells:
VQ_CHCELLS:
		move.l     #0x00000160,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_exit_cur
		.globl V_EXIT_CUR
v_exit_cur:
V_EXIT_CUR:
		move.l     #0x00000164,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_enter_cur
		.globl V_ENTER_CUR
v_enter_cur:
V_ENTER_CUR:
		move.l     #0x00000168,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_curup
		.globl V_CURUP
v_curup:
V_CURUP:
		move.l     #0x0000016C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_curdown
		.globl V_CURDOWN
v_curdown:
V_CURDOWN:
		move.l     #0x00000170,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_curright
		.globl V_CURRIGHT
v_curright:
V_CURRIGHT:
		move.l     #0x00000174,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_curleft
		.globl V_CURLEFT
v_curleft:
V_CURLEFT:
		move.l     #0x00000178,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_curhome
		.globl V_CURHOME
v_curhome:
V_CURHOME:
		move.l     #0x0000017C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_eeos
		.globl V_EEOS
v_eeos:
V_EEOS:
		move.l     #0x00000180,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_eeol
		.globl V_EEOL
v_eeol:
V_EEOL:
		move.l     #0x00000184,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_curaddress
		.globl V_CURADDRESS
v_curaddress:
V_CURADDRESS:
		move.l     #0x00000188,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_curtext
		.globl V_CURTEXT
v_curtext:
V_CURTEXT:
		move.l     #0x0000018C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_rvon
		.globl V_RVON
v_rvon:
V_RVON:
		move.l     #0x00000190,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_rvoff
		.globl V_RVOFF
v_rvoff:
V_RVOFF:
		move.l     #0x00000194,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_curaddress
		.globl VQ_CURADDRESS
vq_curaddress:
VQ_CURADDRESS:
		move.l     #0x00000198,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_tabstatus
		.globl VQ_TABSTATUS
vq_tabstatus:
VQ_TABSTATUS:
		move.l     #0x0000019C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_hardcopy
		.globl V_HARDCOPY
v_hardcopy:
V_HARDCOPY:
		move.l     #0x000001A0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_dspcur
		.globl V_DSPCUR
v_dspcur:
V_DSPCUR:
		move.l     #0x000001A4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_rmcur
		.globl V_RMCUR
v_rmcur:
V_RMCUR:
		move.l     #0x000001A8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_form_adv
		.globl V_FORM_ADV
v_form_adv:
V_FORM_ADV:
		move.l     #0x000001AC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_clear_disp_list
		.globl V_CLEAR_DISP_LIST
v_clear_disp_list:
V_CLEAR_DISP_LIST:
		move.l     #0x000001B0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_scan
		.globl VQ_SCAN
vq_scan:
VQ_SCAN:
		move.l     #0x000001B4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_alpha_text
		.globl V_ALPHA_TEXT
v_alpha_text:
V_ALPHA_TEXT:
		move.l     #0x000001B8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_palette
		.globl VS_PALETTE
vs_palette:
VS_PALETTE:
		move.l     #0x000001BC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_sound
		.globl V_SOUND
v_sound:
V_SOUND:
		move.l     #0x000001C0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_mute
		.globl VS_MUTE
vs_mute:
VS_MUTE:
		move.l     #0x000001C4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vt_resolution
		.globl VT_RESOLUTION
vt_resolution:
VT_RESOLUTION:
		move.l     #0x000001C8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vt_axis
		.globl VT_AXIS
vt_axis:
VT_AXIS:
		move.l     #0x000001CC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vt_origin
		.globl VT_ORIGIN
vt_origin:
VT_ORIGIN:
		move.l     #0x000001D0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_tdimensions
		.globl VQ_TDIMENSIONS
vq_tdimensions:
VQ_TDIMENSIONS:
		move.l     #0x000001D4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vt_alignment
		.globl VT_ALIGNMENT
vt_alignment:
VT_ALIGNMENT:
		move.l     #0x000001D8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsp_film
		.globl VSP_FILM
vsp_film:
VSP_FILM:
		move.l     #0x000001DC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqp_filmname
		.globl VQP_FILMNAME
vqp_filmname:
VQP_FILMNAME:
		move.l     #0x000001E0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsc_expose
		.globl VSC_EXPOSE
vsc_expose:
VSC_EXPOSE:
		move.l     #0x000001E4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_meta_extents
		.globl V_META_EXTENTS
v_meta_extents:
V_META_EXTENTS:
		move.l     #0x000001E8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_write_meta
		.globl V_WRITE_META
v_write_meta:
V_WRITE_META:
		move.l     #0x000001EC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vm_pagesize
		.globl VM_PAGESIZE
vm_pagesize:
VM_PAGESIZE:
		move.l     #0x000001F0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vm_coords
		.globl VM_COORDS
vm_coords:
VM_COORDS:
		move.l     #0x000001F4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vm_filename
		.globl VM_FILENAME
vm_filename:
VM_FILENAME:
		move.l     #0x000001F8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_offset
		.globl V_OFFSET
v_offset:
V_OFFSET:
		move.l     #0x000001FC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_fontinit
		.globl V_FONTINIT
v_fontinit:
V_FONTINIT:
		move.l     #0x00000200,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_escape2000
		.globl V_ESCAPE2000
v_escape2000:
V_ESCAPE2000:
		move.l     #0x00000204,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_output_window
		.globl V_OUTPUT_WINDOW
v_output_window:
V_OUTPUT_WINDOW:
		move.l     #0x00000208,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_bit_image
		.globl V_BIT_IMAGE
v_bit_image:
V_BIT_IMAGE:
		move.l     #0x0000020C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl fix31ToPixel
		.globl FIX31TOPIXEL
fix31ToPixel:
FIX31TOPIXEL:
		move.l     #0x00000210,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_opnprn
		.globl V_OPNPRN
v_opnprn:
V_OPNPRN:
		move.l     #0x00000214,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_opnmeta
		.globl V_OPNMETA
v_opnmeta:
V_OPNMETA:
		move.l     #0x00000218,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_devinfo
		.globl VQ_DEVINFO
vq_devinfo:
VQ_DEVINFO:
		move.l     #0x0000021C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_ext_devinfo
		.globl VQ_EXT_DEVINFO
vq_ext_devinfo:
VQ_EXT_DEVINFO:
		move.l     #0x00000220,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_calibrate
		.globl VS_CALIBRATE
vs_calibrate:
VS_CALIBRATE:
		move.l     #0x00000224,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_calibrate
		.globl VQ_CALIBRATE
vq_calibrate:
VQ_CALIBRATE:
		move.l     #0x00000228,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_bez
		.globl V_BEZ
v_bez:
V_BEZ:
		move.l     #0x0000022C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_bez_on
		.globl V_BEZ_ON
v_bez_on:
V_BEZ_ON:
		move.l     #0x00000230,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_bez_off
		.globl V_BEZ_OFF
v_bez_off:
V_BEZ_OFF:
		move.l     #0x00000234,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_bez_qual
		.globl V_BEZ_QUAL
v_bez_qual:
V_BEZ_QUAL:
		move.l     #0x00000238,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_bez_fill
		.globl V_BEZ_FILL
v_bez_fill:
V_BEZ_FILL:
		move.l     #0x0000023C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_ext_name
		.globl VQT_EXT_NAME
vqt_ext_name:
VQT_EXT_NAME:
		move.l     #0x00000240,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_char_index
		.globl VQT_CHAR_INDEX
vqt_char_index:
VQT_CHAR_INDEX:
		move.l     #0x00000244,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_isCharAvailable
		.globl VQT_ISCHARAVAILABLE
vqt_isCharAvailable:
VQT_ISCHARAVAILABLE:
		move.l     #0x00000248,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_xfntinfo
		.globl VQT_XFNTINFO
vqt_xfntinfo:
VQT_XFNTINFO:
		move.l     #0x0000024C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_name
		.globl VST_NAME
vst_name:
VST_NAME:
		move.l     #0x00000250,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_name_and_id
		.globl VQT_NAME_AND_ID
vqt_name_and_id:
VQT_NAME_AND_ID:
		move.l     #0x00000254,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_fontheader
		.globl VQT_FONTHEADER
vqt_fontheader:
VQT_FONTHEADER:
		move.l     #0x00000258,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_trackkern
		.globl VQT_TRACKKERN
vqt_trackkern:
VQT_TRACKKERN:
		move.l     #0x0000025C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_pairkern
		.globl VQT_PAIRKERN
vqt_pairkern:
VQT_PAIRKERN:
		move.l     #0x00000260,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_charmap
		.globl VST_CHARMAP
vst_charmap:
VST_CHARMAP:
		move.l     #0x00000264,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_kern
		.globl VST_KERN
vst_kern:
VST_KERN:
		move.l     #0x00000268,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_kern_offset
		.globl VST_KERN_OFFSET
vst_kern_offset:
VST_KERN_OFFSET:
		move.l     #0x0000026C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_getbitmap_info
		.globl V_GETBITMAP_INFO
v_getbitmap_info:
V_GETBITMAP_INFO:
		move.l     #0x00000270,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_f_extent
		.globl VQT_F_EXTENT
vqt_f_extent:
VQT_F_EXTENT:
		move.l     #0x00000274,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_real_extent
		.globl VQT_REAL_EXTENT
vqt_real_extent:
VQT_REAL_EXTENT:
		move.l     #0x00000278,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_ftext
		.globl V_FTEXT
v_ftext:
V_FTEXT:
		move.l     #0x0000027C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_ftext_offset
		.globl V_FTEXT_OFFSET
v_ftext_offset:
V_FTEXT_OFFSET:
		move.l     #0x00000280,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_getoutline
		.globl V_GETOUTLINE
v_getoutline:
V_GETOUTLINE:
		move.l     #0x00000284,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_arbpt32
		.globl VST_ARBPT32
vst_arbpt32:
VST_ARBPT32:
		move.l     #0x00000288,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_advance32
		.globl VQT_ADVANCE32
vqt_advance32:
VQT_ADVANCE32:
		move.l     #0x0000028C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_setsize32
		.globl VST_SETSIZE32
vst_setsize32:
VST_SETSIZE32:
		move.l     #0x00000290,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_skew
		.globl VST_SKEW
vst_skew:
VST_SKEW:
		move.l     #0x00000294,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_orient
		.globl V_ORIENT
v_orient:
V_ORIENT:
		move.l     #0x00000298,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_trays
		.globl V_TRAYS
v_trays:
V_TRAYS:
		move.l     #0x0000029C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_tray_names
		.globl VQ_TRAY_NAMES
vq_tray_names:
VQ_TRAY_NAMES:
		move.l     #0x000002A0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_page_size
		.globl V_PAGE_SIZE
v_page_size:
V_PAGE_SIZE:
		move.l     #0x000002A4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_page_name
		.globl VQ_PAGE_NAME
vq_page_name:
VQ_PAGE_NAME:
		move.l     #0x000002A8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_fg_color
		.globl VST_FG_COLOR
vst_fg_color:
VST_FG_COLOR:
		move.l     #0x000002AC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsf_fg_color
		.globl VSF_FG_COLOR
vsf_fg_color:
VSF_FG_COLOR:
		move.l     #0x000002B0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsl_fg_color
		.globl VSL_FG_COLOR
vsl_fg_color:
VSL_FG_COLOR:
		move.l     #0x000002B4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsm_fg_color
		.globl VSM_FG_COLOR
vsm_fg_color:
VSM_FG_COLOR:
		move.l     #0x000002B8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsr_fg_color
		.globl VSR_FG_COLOR
vsr_fg_color:
VSR_FG_COLOR:
		move.l     #0x000002BC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_bg_color
		.globl VST_BG_COLOR
vst_bg_color:
VST_BG_COLOR:
		move.l     #0x000002C0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsf_bg_color
		.globl VSF_BG_COLOR
vsf_bg_color:
VSF_BG_COLOR:
		move.l     #0x000002C4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsl_bg_color
		.globl VSL_BG_COLOR
vsl_bg_color:
VSL_BG_COLOR:
		move.l     #0x000002C8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsm_bg_color
		.globl VSM_BG_COLOR
vsm_bg_color:
VSM_BG_COLOR:
		move.l     #0x000002CC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsr_bg_color
		.globl VSR_BG_COLOR
vsr_bg_color:
VSR_BG_COLOR:
		move.l     #0x000002D0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_fg_color
		.globl VQT_FG_COLOR
vqt_fg_color:
VQT_FG_COLOR:
		move.l     #0x000002D4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqf_fg_color
		.globl VQF_FG_COLOR
vqf_fg_color:
VQF_FG_COLOR:
		move.l     #0x000002D8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vql_fg_color
		.globl VQL_FG_COLOR
vql_fg_color:
VQL_FG_COLOR:
		move.l     #0x000002DC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqm_fg_color
		.globl VQM_FG_COLOR
vqm_fg_color:
VQM_FG_COLOR:
		move.l     #0x000002E0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqr_fg_color
		.globl VQR_FG_COLOR
vqr_fg_color:
VQR_FG_COLOR:
		move.l     #0x000002E4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_bg_color
		.globl VQT_BG_COLOR
vqt_bg_color:
VQT_BG_COLOR:
		move.l     #0x000002E8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqf_bg_color
		.globl VQF_BG_COLOR
vqf_bg_color:
VQF_BG_COLOR:
		move.l     #0x000002EC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vql_bg_color
		.globl VQL_BG_COLOR
vql_bg_color:
VQL_BG_COLOR:
		move.l     #0x000002F0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqm_bg_color
		.globl VQM_BG_COLOR
vqm_bg_color:
VQM_BG_COLOR:
		move.l     #0x000002F4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqr_bg_color
		.globl VQR_BG_COLOR
vqr_bg_color:
VQR_BG_COLOR:
		move.l     #0x000002F8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_color2value
		.globl V_COLOR2VALUE
v_color2value:
V_COLOR2VALUE:
		move.l     #0x000002FC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_value2color
		.globl V_VALUE2COLOR
v_value2color:
V_VALUE2COLOR:
		move.l     #0x00000300,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_color2nearest
		.globl V_COLOR2NEAREST
v_color2nearest:
V_COLOR2NEAREST:
		move.l     #0x00000304,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_px_format
		.globl VQ_PX_FORMAT
vq_px_format:
VQ_PX_FORMAT:
		move.l     #0x00000308,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_ctab
		.globl VS_CTAB
vs_ctab:
VS_CTAB:
		move.l     #0x0000030C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_ctab_entry
		.globl VS_CTAB_ENTRY
vs_ctab_entry:
VS_CTAB_ENTRY:
		move.l     #0x00000310,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_dflt_ctab
		.globl VS_DFLT_CTAB
vs_dflt_ctab:
VS_DFLT_CTAB:
		move.l     #0x00000314,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_ctab
		.globl VQ_CTAB
vq_ctab:
VQ_CTAB:
		move.l     #0x00000318,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_ctab_entry
		.globl VQ_CTAB_ENTRY
vq_ctab_entry:
VQ_CTAB_ENTRY:
		move.l     #0x0000031C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_ctab_id
		.globl VQ_CTAB_ID
vq_ctab_id:
VQ_CTAB_ID:
		move.l     #0x00000320,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_ctab_idx2vdi
		.globl V_CTAB_IDX2VDI
v_ctab_idx2vdi:
V_CTAB_IDX2VDI:
		move.l     #0x00000324,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_ctab_vdi2idx
		.globl V_CTAB_VDI2IDX
v_ctab_vdi2idx:
V_CTAB_VDI2IDX:
		move.l     #0x00000328,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_ctab_idx2value
		.globl V_CTAB_IDX2VALUE
v_ctab_idx2value:
V_CTAB_IDX2VALUE:
		move.l     #0x0000032C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_get_ctab_id
		.globl V_GET_CTAB_ID
v_get_ctab_id:
V_GET_CTAB_ID:
		move.l     #0x00000330,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_dflt_ctab
		.globl VQ_DFLT_CTAB
vq_dflt_ctab:
VQ_DFLT_CTAB:
		move.l     #0x00000334,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_create_itab
		.globl V_CREATE_ITAB
v_create_itab:
V_CREATE_ITAB:
		move.l     #0x00000338,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_delete_itab
		.globl V_DELETE_ITAB
v_delete_itab:
V_DELETE_ITAB:
		move.l     #0x0000033C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vr_transfer_bits
		.globl VR_TRANSFER_BITS
vr_transfer_bits:
VR_TRANSFER_BITS:
		move.l     #0x00000340,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_hilite_color
		.globl VS_HILITE_COLOR
vs_hilite_color:
VS_HILITE_COLOR:
		move.l     #0x00000344,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_min_color
		.globl VS_MIN_COLOR
vs_min_color:
VS_MIN_COLOR:
		move.l     #0x00000348,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_max_color
		.globl VS_MAX_COLOR
vs_max_color:
VS_MAX_COLOR:
		move.l     #0x0000034C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_weight_color
		.globl VS_WEIGHT_COLOR
vs_weight_color:
VS_WEIGHT_COLOR:
		move.l     #0x00000350,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_hilite_color
		.globl VQ_HILITE_COLOR
vq_hilite_color:
VQ_HILITE_COLOR:
		move.l     #0x00000354,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_min_color
		.globl VQ_MIN_COLOR
vq_min_color:
VQ_MIN_COLOR:
		move.l     #0x00000358,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_max_color
		.globl VQ_MAX_COLOR
vq_max_color:
VQ_MAX_COLOR:
		move.l     #0x0000035C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_weight_color
		.globl VQ_WEIGHT_COLOR
vq_weight_color:
VQ_WEIGHT_COLOR:
		move.l     #0x00000360,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_document_info
		.globl VS_DOCUMENT_INFO
vs_document_info:
VS_DOCUMENT_INFO:
		move.l     #0x00000364,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_prn_scaling
		.globl VQ_PRN_SCALING
vq_prn_scaling:
VQ_PRN_SCALING:
		move.l     #0x00000368,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_open_bm
		.globl V_OPEN_BM
v_open_bm:
V_OPEN_BM:
		move.l     #0x0000036C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_resize_bm
		.globl V_RESIZE_BM
v_resize_bm:
V_RESIZE_BM:
		move.l     #0x00000370,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_get_outline
		.globl V_GET_OUTLINE
v_get_outline:
V_GET_OUTLINE:
		move.l     #0x00000374,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_track_offset
		.globl VST_TRACK_OFFSET
vst_track_offset:
VST_TRACK_OFFSET:
		move.l     #0x00000378,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_arbpt
		.globl VST_ARBPT
vst_arbpt:
VST_ARBPT:
		move.l     #0x0000037C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_advance
		.globl VQT_ADVANCE
vqt_advance:
VQT_ADVANCE:
		move.l     #0x00000380,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_setsize
		.globl VST_SETSIZE
vst_setsize:
VST_SETSIZE:
		move.l     #0x00000384,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vq_vgdos
		.globl VQ_VGDOS
vq_vgdos:
VQ_VGDOS:
		move.l     #0x00000388,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_width
		.globl VST_WIDTH
vst_width:
VST_WIDTH:
		move.l     #0x0000038C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_scratch
		.globl VST_SCRATCH
vst_scratch:
VST_SCRATCH:
		move.l     #0x00000390,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vst_error
		.globl VST_ERROR
vst_error:
VST_ERROR:
		move.l     #0x00000394,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_savecache
		.globl V_SAVECACHE
v_savecache:
V_SAVECACHE:
		move.l     #0x00000398,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_loadcache
		.globl V_LOADCACHE
v_loadcache:
V_LOADCACHE:
		move.l     #0x0000039C,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_flushcache
		.globl V_FLUSHCACHE
v_flushcache:
V_FLUSHCACHE:
		move.l     #0x000003A0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_cachesize
		.globl VQT_CACHESIZE
vqt_cachesize:
VQT_CACHESIZE:
		move.l     #0x000003A4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_get_table
		.globl VQT_GET_TABLE
vqt_get_table:
VQT_GET_TABLE:
		move.l     #0x000003A8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vs_curaddress
		.globl VS_CURADDRESS
vs_curaddress:
VS_CURADDRESS:
		move.l     #0x000003AC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vsf_perimeter3
		.globl VSF_PERIMETER3
vsf_perimeter3:
VSF_PERIMETER3:
		move.l     #0x000003B0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_justified
		.globl VQT_JUSTIFIED
vqt_justified:
VQT_JUSTIFIED:
		move.l     #0x000003B4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_opnprnwrk
		.globl V_OPNPRNWRK
v_opnprnwrk:
V_OPNPRNWRK:
		move.l     #0x000003B8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_opnmatrixprn
		.globl V_OPNMATRIXPRN
v_opnmatrixprn:
V_OPNMATRIXPRN:
		move.l     #0x000003BC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_set_app_buff
		.globl V_SET_APP_BUFF
v_set_app_buff:
V_SET_APP_BUFF:
		move.l     #0x000003C0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl vqt_devinfo
		.globl VQT_DEVINFO
vqt_devinfo:
VQT_DEVINFO:
		move.l     #0x000003C4,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_create_ctab
		.globl V_CREATE_CTAB
v_create_ctab:
V_CREATE_CTAB:
		move.l     #0x000003C8,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_delete_ctab
		.globl V_DELETE_CTAB
v_delete_ctab:
V_DELETE_CTAB:
		move.l     #0x000003CC,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect
		.globl v_setrgb
		.globl V_SETRGB
v_setrgb:
V_SETRGB:
		move.l     #0x000003D0,-(a7)
		move.l     funcVdi(pc),-(a7)
		bra        indirect

/* AES */
	.globl aes
	.globl AES
aes:
AES:
		move.l     #0x00000000,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl appl_init
		.globl APPL_INIT
appl_init:
APPL_INIT:
		move.l     #0x00000004,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl appl_read
		.globl APPL_READ
appl_read:
APPL_READ:
		move.l     #0x00000008,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl appl_write
		.globl APPL_WRITE
appl_write:
APPL_WRITE:
		move.l     #0x0000000C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl appl_find
		.globl APPL_FIND
appl_find:
APPL_FIND:
		move.l     #0x00000010,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl appl_search
		.globl APPL_SEARCH
appl_search:
APPL_SEARCH:
		move.l     #0x00000014,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl appl_tplay
		.globl APPL_TPLAY
appl_tplay:
APPL_TPLAY:
		move.l     #0x00000018,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl appl_trecord
		.globl APPL_TRECORD
appl_trecord:
APPL_TRECORD:
		move.l     #0x0000001C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl appl_yield
		.globl APPL_YIELD
appl_yield:
APPL_YIELD:
		move.l     #0x00000020,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl appl_exit
		.globl APPL_EXIT
appl_exit:
APPL_EXIT:
		move.l     #0x00000024,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl appl_getinfo
		.globl APPL_GETINFO
appl_getinfo:
APPL_GETINFO:
		move.l     #0x00000028,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl appl_control
		.globl APPL_CONTROL
appl_control:
APPL_CONTROL:
		move.l     #0x0000002C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl evnt_keybd
		.globl EVNT_KEYBD
evnt_keybd:
EVNT_KEYBD:
		move.l     #0x00000030,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl evnt_button
		.globl EVNT_BUTTON
evnt_button:
EVNT_BUTTON:
		move.l     #0x00000034,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl evnt_mouse
		.globl EVNT_MOUSE
evnt_mouse:
EVNT_MOUSE:
		move.l     #0x00000038,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl evnt_mesag
		.globl EVNT_MESAG
evnt_mesag:
EVNT_MESAG:
		move.l     #0x0000003C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl evnt_timer
		.globl EVNT_TIMER
evnt_timer:
EVNT_TIMER:
		move.l     #0x00000040,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl evnt_event
		.globl EVNT_EVENT
evnt_event:
EVNT_EVENT:
		move.l     #0x00000044,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl evnt_multi
		.globl EVNT_MULTI
evnt_multi:
EVNT_MULTI:
		move.l     #0x00000048,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl evnt_dclick
		.globl EVNT_DCLICK
evnt_dclick:
EVNT_DCLICK:
		move.l     #0x0000004C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl menu_bar
		.globl MENU_BAR
menu_bar:
MENU_BAR:
		move.l     #0x00000050,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl menu_icheck
		.globl MENU_ICHECK
menu_icheck:
MENU_ICHECK:
		move.l     #0x00000054,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl menu_ienable
		.globl MENU_IENABLE
menu_ienable:
MENU_IENABLE:
		move.l     #0x00000058,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl menu_tnormal
		.globl MENU_TNORMAL
menu_tnormal:
MENU_TNORMAL:
		move.l     #0x0000005C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl menu_text
		.globl MENU_TEXT
menu_text:
MENU_TEXT:
		move.l     #0x00000060,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl menu_register
		.globl MENU_REGISTER
menu_register:
MENU_REGISTER:
		move.l     #0x00000064,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl menu_unregister
		.globl MENU_UNREGISTER
menu_unregister:
MENU_UNREGISTER:
		move.l     #0x00000068,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl menu_click
		.globl MENU_CLICK
menu_click:
MENU_CLICK:
		move.l     #0x0000006C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl menu_attach
		.globl MENU_ATTACH
menu_attach:
MENU_ATTACH:
		move.l     #0x00000070,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl menu_istart
		.globl MENU_ISTART
menu_istart:
MENU_ISTART:
		move.l     #0x00000074,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl menu_popup
		.globl MENU_POPUP
menu_popup:
MENU_POPUP:
		move.l     #0x00000078,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl menu_settings
		.globl MENU_SETTINGS
menu_settings:
MENU_SETTINGS:
		move.l     #0x0000007C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl objc_add
		.globl OBJC_ADD
objc_add:
OBJC_ADD:
		move.l     #0x00000080,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl objc_delete
		.globl OBJC_DELETE
objc_delete:
OBJC_DELETE:
		move.l     #0x00000084,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl objc_draw
		.globl OBJC_DRAW
objc_draw:
OBJC_DRAW:
		move.l     #0x00000088,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl objc_find
		.globl OBJC_FIND
objc_find:
OBJC_FIND:
		move.l     #0x0000008C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl objc_offset
		.globl OBJC_OFFSET
objc_offset:
OBJC_OFFSET:
		move.l     #0x00000090,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl objc_order
		.globl OBJC_ORDER
objc_order:
OBJC_ORDER:
		move.l     #0x00000094,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl objc_edit
		.globl OBJC_EDIT
objc_edit:
OBJC_EDIT:
		move.l     #0x00000098,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl objc_change
		.globl OBJC_CHANGE
objc_change:
OBJC_CHANGE:
		move.l     #0x0000009C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl objc_sysvar
		.globl OBJC_SYSVAR
objc_sysvar:
OBJC_SYSVAR:
		move.l     #0x000000A0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl form_do
		.globl FORM_DO
form_do:
FORM_DO:
		move.l     #0x000000A4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl form_dial
		.globl FORM_DIAL
form_dial:
FORM_DIAL:
		move.l     #0x000000A8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl form_alert
		.globl FORM_ALERT
form_alert:
FORM_ALERT:
		move.l     #0x000000AC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl form_error
		.globl FORM_ERROR
form_error:
FORM_ERROR:
		move.l     #0x000000B0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl form_center
		.globl FORM_CENTER
form_center:
FORM_CENTER:
		move.l     #0x000000B4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl form_keybd
		.globl FORM_KEYBD
form_keybd:
FORM_KEYBD:
		move.l     #0x000000B8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl form_button
		.globl FORM_BUTTON
form_button:
FORM_BUTTON:
		move.l     #0x000000BC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_rubbox
		.globl GRAF_RUBBOX
graf_rubbox:
GRAF_RUBBOX:
		move.l     #0x000000C0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_rubberbox
		.globl GRAF_RUBBERBOX
graf_rubberbox:
GRAF_RUBBERBOX:
		move.l     #0x000000C4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_dragbox
		.globl GRAF_DRAGBOX
graf_dragbox:
GRAF_DRAGBOX:
		move.l     #0x000000C8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_mbox
		.globl GRAF_MBOX
graf_mbox:
GRAF_MBOX:
		move.l     #0x000000CC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_movebox
		.globl GRAF_MOVEBOX
graf_movebox:
GRAF_MOVEBOX:
		move.l     #0x000000D0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_growbox
		.globl GRAF_GROWBOX
graf_growbox:
GRAF_GROWBOX:
		move.l     #0x000000D4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_shrinkbox
		.globl GRAF_SHRINKBOX
graf_shrinkbox:
GRAF_SHRINKBOX:
		move.l     #0x000000D8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_watchbox
		.globl GRAF_WATCHBOX
graf_watchbox:
GRAF_WATCHBOX:
		move.l     #0x000000DC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_slidebox
		.globl GRAF_SLIDEBOX
graf_slidebox:
GRAF_SLIDEBOX:
		move.l     #0x000000E0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_handle
		.globl GRAF_HANDLE
graf_handle:
GRAF_HANDLE:
		move.l     #0x000000E4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_mouse
		.globl GRAF_MOUSE
graf_mouse:
GRAF_MOUSE:
		move.l     #0x000000E8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_mkstate
		.globl GRAF_MKSTATE
graf_mkstate:
GRAF_MKSTATE:
		move.l     #0x000000EC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_multirubber
		.globl GRAF_MULTIRUBBER
graf_multirubber:
GRAF_MULTIRUBBER:
		move.l     #0x000000F0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl scrp_read
		.globl SCRP_READ
scrp_read:
SCRP_READ:
		move.l     #0x000000F4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl scrp_write
		.globl SCRP_WRITE
scrp_write:
SCRP_WRITE:
		move.l     #0x000000F8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fsel_input
		.globl FSEL_INPUT
fsel_input:
FSEL_INPUT:
		move.l     #0x000000FC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fsel_exinput
		.globl FSEL_EXINPUT
fsel_exinput:
FSEL_EXINPUT:
		move.l     #0x00000100,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fsel_boxinput
		.globl FSEL_BOXINPUT
fsel_boxinput:
FSEL_BOXINPUT:
		move.l     #0x00000104,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fslx_open
		.globl FSLX_OPEN
fslx_open:
FSLX_OPEN:
		move.l     #0x00000108,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fslx_close
		.globl FSLX_CLOSE
fslx_close:
FSLX_CLOSE:
		move.l     #0x0000010C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fslx_getnxtfile
		.globl FSLX_GETNXTFILE
fslx_getnxtfile:
FSLX_GETNXTFILE:
		move.l     #0x00000110,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fslx_evnt
		.globl FSLX_EVNT
fslx_evnt:
FSLX_EVNT:
		move.l     #0x00000114,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fslx_do
		.globl FSLX_DO
fslx_do:
FSLX_DO:
		move.l     #0x00000118,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fslx_set_flags
		.globl FSLX_SET_FLAGS
fslx_set_flags:
FSLX_SET_FLAGS:
		move.l     #0x0000011C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wind_create
		.globl WIND_CREATE
wind_create:
WIND_CREATE:
		move.l     #0x00000120,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wind_open
		.globl WIND_OPEN
wind_open:
WIND_OPEN:
		move.l     #0x00000124,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wind_close
		.globl WIND_CLOSE
wind_close:
WIND_CLOSE:
		move.l     #0x00000128,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wind_delete
		.globl WIND_DELETE
wind_delete:
WIND_DELETE:
		move.l     #0x0000012C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wind_get
		.globl WIND_GET
wind_get:
WIND_GET:
		move.l     #0x00000130,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wind_getQSB
		.globl WIND_GETQSB
wind_getQSB:
WIND_GETQSB:
		move.l     #0x00000134,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wind_set
		.globl WIND_SET
wind_set:
WIND_SET:
		move.l     #0x00000138,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wind_find
		.globl WIND_FIND
wind_find:
WIND_FIND:
		move.l     #0x0000013C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wind_update
		.globl WIND_UPDATE
wind_update:
WIND_UPDATE:
		move.l     #0x00000140,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wind_calc
		.globl WIND_CALC
wind_calc:
WIND_CALC:
		move.l     #0x00000144,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wind_new
		.globl WIND_NEW
wind_new:
WIND_NEW:
		move.l     #0x00000148,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl rsrc_load
		.globl RSRC_LOAD
rsrc_load:
RSRC_LOAD:
		move.l     #0x0000014C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl rsrc_free
		.globl RSRC_FREE
rsrc_free:
RSRC_FREE:
		move.l     #0x00000150,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl rsrc_gaddr
		.globl RSRC_GADDR
rsrc_gaddr:
RSRC_GADDR:
		move.l     #0x00000154,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl rsrc_saddr
		.globl RSRC_SADDR
rsrc_saddr:
RSRC_SADDR:
		move.l     #0x00000158,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl rsrc_obfix
		.globl RSRC_OBFIX
rsrc_obfix:
RSRC_OBFIX:
		move.l     #0x0000015C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl rsrc_rcfix
		.globl RSRC_RCFIX
rsrc_rcfix:
RSRC_RCFIX:
		move.l     #0x00000160,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl shel_read
		.globl SHEL_READ
shel_read:
SHEL_READ:
		move.l     #0x00000164,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl shel_write
		.globl SHEL_WRITE
shel_write:
SHEL_WRITE:
		move.l     #0x00000168,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl shel_get
		.globl SHEL_GET
shel_get:
SHEL_GET:
		move.l     #0x0000016C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl shel_put
		.globl SHEL_PUT
shel_put:
SHEL_PUT:
		move.l     #0x00000170,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl shel_find
		.globl SHEL_FIND
shel_find:
SHEL_FIND:
		move.l     #0x00000174,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl shel_envrn
		.globl SHEL_ENVRN
shel_envrn:
SHEL_ENVRN:
		move.l     #0x00000178,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl shel_help
		.globl SHEL_HELP
shel_help:
SHEL_HELP:
		move.l     #0x0000017C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fnts_add
		.globl FNTS_ADD
fnts_add:
FNTS_ADD:
		move.l     #0x00000180,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fnts_close
		.globl FNTS_CLOSE
fnts_close:
FNTS_CLOSE:
		move.l     #0x00000184,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fnts_create
		.globl FNTS_CREATE
fnts_create:
FNTS_CREATE:
		move.l     #0x00000188,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fnts_delete
		.globl FNTS_DELETE
fnts_delete:
FNTS_DELETE:
		move.l     #0x0000018C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fnts_do
		.globl FNTS_DO
fnts_do:
FNTS_DO:
		move.l     #0x00000190,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fnts_evnt
		.globl FNTS_EVNT
fnts_evnt:
FNTS_EVNT:
		move.l     #0x00000194,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fnts_get_info
		.globl FNTS_GET_INFO
fnts_get_info:
FNTS_GET_INFO:
		move.l     #0x00000198,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fnts_get_name
		.globl FNTS_GET_NAME
fnts_get_name:
FNTS_GET_NAME:
		move.l     #0x0000019C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fnts_get_no_styles
		.globl FNTS_GET_NO_STYLES
fnts_get_no_styles:
FNTS_GET_NO_STYLES:
		move.l     #0x000001A0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fnts_get_style
		.globl FNTS_GET_STYLE
fnts_get_style:
FNTS_GET_STYLE:
		move.l     #0x000001A4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fnts_open
		.globl FNTS_OPEN
fnts_open:
FNTS_OPEN:
		move.l     #0x000001A8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fnts_remove
		.globl FNTS_REMOVE
fnts_remove:
FNTS_REMOVE:
		move.l     #0x000001AC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl fnts_update
		.globl FNTS_UPDATE
fnts_update:
FNTS_UPDATE:
		move.l     #0x000001B0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_ascroll_to
		.globl LBOX_ASCROLL_TO
lbox_ascroll_to:
LBOX_ASCROLL_TO:
		move.l     #0x000001B4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_scroll_to
		.globl LBOX_SCROLL_TO
lbox_scroll_to:
LBOX_SCROLL_TO:
		move.l     #0x000001B8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_bscroll_to
		.globl LBOX_BSCROLL_TO
lbox_bscroll_to:
LBOX_BSCROLL_TO:
		move.l     #0x000001BC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_cnt_items
		.globl LBOX_CNT_ITEMS
lbox_cnt_items:
LBOX_CNT_ITEMS:
		move.l     #0x000001C0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_create
		.globl LBOX_CREATE
lbox_create:
LBOX_CREATE:
		move.l     #0x000001C4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_delete
		.globl LBOX_DELETE
lbox_delete:
LBOX_DELETE:
		move.l     #0x000001C8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_do
		.globl LBOX_DO
lbox_do:
LBOX_DO:
		move.l     #0x000001CC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_free_items
		.globl LBOX_FREE_ITEMS
lbox_free_items:
LBOX_FREE_ITEMS:
		move.l     #0x000001D0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_free_list
		.globl LBOX_FREE_LIST
lbox_free_list:
LBOX_FREE_LIST:
		move.l     #0x000001D4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_get_afirst
		.globl LBOX_GET_AFIRST
lbox_get_afirst:
LBOX_GET_AFIRST:
		move.l     #0x000001D8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_get_first
		.globl LBOX_GET_FIRST
lbox_get_first:
LBOX_GET_FIRST:
		move.l     #0x000001DC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_get_avis
		.globl LBOX_GET_AVIS
lbox_get_avis:
LBOX_GET_AVIS:
		move.l     #0x000001E0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_get_visible
		.globl LBOX_GET_VISIBLE
lbox_get_visible:
LBOX_GET_VISIBLE:
		move.l     #0x000001E4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_get_bentries
		.globl LBOX_GET_BENTRIES
lbox_get_bentries:
LBOX_GET_BENTRIES:
		move.l     #0x000001E8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_get_bfirst
		.globl LBOX_GET_BFIRST
lbox_get_bfirst:
LBOX_GET_BFIRST:
		move.l     #0x000001EC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_get_idx
		.globl LBOX_GET_IDX
lbox_get_idx:
LBOX_GET_IDX:
		move.l     #0x000001F0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_get_item
		.globl LBOX_GET_ITEM
lbox_get_item:
LBOX_GET_ITEM:
		move.l     #0x000001F4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_get_items
		.globl LBOX_GET_ITEMS
lbox_get_items:
LBOX_GET_ITEMS:
		move.l     #0x000001F8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_get_slct_idx
		.globl LBOX_GET_SLCT_IDX
lbox_get_slct_idx:
LBOX_GET_SLCT_IDX:
		move.l     #0x000001FC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_get_slct_item
		.globl LBOX_GET_SLCT_ITEM
lbox_get_slct_item:
LBOX_GET_SLCT_ITEM:
		move.l     #0x00000200,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_get_tree
		.globl LBOX_GET_TREE
lbox_get_tree:
LBOX_GET_TREE:
		move.l     #0x00000204,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_get_udata
		.globl LBOX_GET_UDATA
lbox_get_udata:
LBOX_GET_UDATA:
		move.l     #0x00000208,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_set_asldr
		.globl LBOX_SET_ASLDR
lbox_set_asldr:
LBOX_SET_ASLDR:
		move.l     #0x0000020C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_set_slider
		.globl LBOX_SET_SLIDER
lbox_set_slider:
LBOX_SET_SLIDER:
		move.l     #0x00000210,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_set_bentries
		.globl LBOX_SET_BENTRIES
lbox_set_bentries:
LBOX_SET_BENTRIES:
		move.l     #0x00000214,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_set_bsldr
		.globl LBOX_SET_BSLDR
lbox_set_bsldr:
LBOX_SET_BSLDR:
		move.l     #0x00000218,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_set_items
		.globl LBOX_SET_ITEMS
lbox_set_items:
LBOX_SET_ITEMS:
		move.l     #0x0000021C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl lbox_update
		.globl LBOX_UPDATE
lbox_update:
LBOX_UPDATE:
		move.l     #0x00000220,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_add_printers
		.globl PDLG_ADD_PRINTERS
pdlg_add_printers:
PDLG_ADD_PRINTERS:
		move.l     #0x00000224,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_add_sub_dialogs
		.globl PDLG_ADD_SUB_DIALOGS
pdlg_add_sub_dialogs:
PDLG_ADD_SUB_DIALOGS:
		move.l     #0x00000228,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_close
		.globl PDLG_CLOSE
pdlg_close:
PDLG_CLOSE:
		move.l     #0x0000022C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_create
		.globl PDLG_CREATE
pdlg_create:
PDLG_CREATE:
		move.l     #0x00000230,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_delete
		.globl PDLG_DELETE
pdlg_delete:
PDLG_DELETE:
		move.l     #0x00000234,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_dflt_settings
		.globl PDLG_DFLT_SETTINGS
pdlg_dflt_settings:
PDLG_DFLT_SETTINGS:
		move.l     #0x00000238,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_do
		.globl PDLG_DO
pdlg_do:
PDLG_DO:
		move.l     #0x0000023C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_evnt
		.globl PDLG_EVNT
pdlg_evnt:
PDLG_EVNT:
		move.l     #0x00000240,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_free_settings
		.globl PDLG_FREE_SETTINGS
pdlg_free_settings:
PDLG_FREE_SETTINGS:
		move.l     #0x00000244,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_get_setsize
		.globl PDLG_GET_SETSIZE
pdlg_get_setsize:
PDLG_GET_SETSIZE:
		move.l     #0x00000248,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_new_settings
		.globl PDLG_NEW_SETTINGS
pdlg_new_settings:
PDLG_NEW_SETTINGS:
		move.l     #0x0000024C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_open
		.globl PDLG_OPEN
pdlg_open:
PDLG_OPEN:
		move.l     #0x00000250,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_remove_printers
		.globl PDLG_REMOVE_PRINTERS
pdlg_remove_printers:
PDLG_REMOVE_PRINTERS:
		move.l     #0x00000254,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_remove_sub_dialogs
		.globl PDLG_REMOVE_SUB_DIALOGS
pdlg_remove_sub_dialogs:
PDLG_REMOVE_SUB_DIALOGS:
		move.l     #0x00000258,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_update
		.globl PDLG_UPDATE
pdlg_update:
PDLG_UPDATE:
		move.l     #0x0000025C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_use_settings
		.globl PDLG_USE_SETTINGS
pdlg_use_settings:
PDLG_USE_SETTINGS:
		move.l     #0x00000260,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl pdlg_validate_settings
		.globl PDLG_VALIDATE_SETTINGS
pdlg_validate_settings:
PDLG_VALIDATE_SETTINGS:
		move.l     #0x00000264,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_create
		.globl EDIT_CREATE
edit_create:
EDIT_CREATE:
		move.l     #0x00000268,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_set_buf
		.globl EDIT_SET_BUF
edit_set_buf:
EDIT_SET_BUF:
		move.l     #0x0000026C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_open
		.globl EDIT_OPEN
edit_open:
EDIT_OPEN:
		move.l     #0x00000270,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_close
		.globl EDIT_CLOSE
edit_close:
EDIT_CLOSE:
		move.l     #0x00000274,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_delete
		.globl EDIT_DELETE
edit_delete:
EDIT_DELETE:
		move.l     #0x00000278,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_cursor
		.globl EDIT_CURSOR
edit_cursor:
EDIT_CURSOR:
		move.l     #0x0000027C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_evnt
		.globl EDIT_EVNT
edit_evnt:
EDIT_EVNT:
		move.l     #0x00000280,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_get_buf
		.globl EDIT_GET_BUF
edit_get_buf:
EDIT_GET_BUF:
		move.l     #0x00000284,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_get_format
		.globl EDIT_GET_FORMAT
edit_get_format:
EDIT_GET_FORMAT:
		move.l     #0x00000288,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_get_colour
		.globl EDIT_GET_COLOUR
edit_get_colour:
EDIT_GET_COLOUR:
		move.l     #0x0000028C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_get_color
		.globl EDIT_GET_COLOR
edit_get_color:
EDIT_GET_COLOR:
		move.l     #0x00000290,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_get_font
		.globl EDIT_GET_FONT
edit_get_font:
EDIT_GET_FONT:
		move.l     #0x00000294,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_get_cursor
		.globl EDIT_GET_CURSOR
edit_get_cursor:
EDIT_GET_CURSOR:
		move.l     #0x00000298,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_get_dirty
		.globl EDIT_GET_DIRTY
edit_get_dirty:
EDIT_GET_DIRTY:
		move.l     #0x0000029C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_get_sel
		.globl EDIT_GET_SEL
edit_get_sel:
EDIT_GET_SEL:
		move.l     #0x000002A0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_get_scrollinfo
		.globl EDIT_GET_SCROLLINFO
edit_get_scrollinfo:
EDIT_GET_SCROLLINFO:
		move.l     #0x000002A4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_set_format
		.globl EDIT_SET_FORMAT
edit_set_format:
EDIT_SET_FORMAT:
		move.l     #0x000002A8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_set_colour
		.globl EDIT_SET_COLOUR
edit_set_colour:
EDIT_SET_COLOUR:
		move.l     #0x000002AC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_set_color
		.globl EDIT_SET_COLOR
edit_set_color:
EDIT_SET_COLOR:
		move.l     #0x000002B0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_set_font
		.globl EDIT_SET_FONT
edit_set_font:
EDIT_SET_FONT:
		move.l     #0x000002B4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_set_cursor
		.globl EDIT_SET_CURSOR
edit_set_cursor:
EDIT_SET_CURSOR:
		move.l     #0x000002B8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_resized
		.globl EDIT_RESIZED
edit_resized:
EDIT_RESIZED:
		move.l     #0x000002BC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_set_dirty
		.globl EDIT_SET_DIRTY
edit_set_dirty:
EDIT_SET_DIRTY:
		move.l     #0x000002C0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl edit_scroll
		.globl EDIT_SCROLL
edit_scroll:
EDIT_SCROLL:
		move.l     #0x000002C4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl EvntMulti
		.globl EVNTMULTI
EvntMulti:
EVNTMULTI:
		move.l     #0x000002C8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl form_wbutton
		.globl FORM_WBUTTON
form_wbutton:
FORM_WBUTTON:
		move.l     #0x000002CC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl form_xdial
		.globl FORM_XDIAL
form_xdial:
FORM_XDIAL:
		move.l     #0x000002D0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl form_xdo
		.globl FORM_XDO
form_xdo:
FORM_XDO:
		move.l     #0x000002D4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl form_xerr
		.globl FORM_XERR
form_xerr:
FORM_XERR:
		move.l     #0x000002D8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl _crystal
		.globl _CRYSTAL
_crystal:
_CRYSTAL:
		move.l     #0x000002DC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_wwatchbox
		.globl GRAF_WWATCHBOX
graf_wwatchbox:
GRAF_WWATCHBOX:
		move.l     #0x000002E0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_xhandle
		.globl GRAF_XHANDLE
graf_xhandle:
GRAF_XHANDLE:
		move.l     #0x000002E4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_create
		.globl WDLG_CREATE
wdlg_create:
WDLG_CREATE:
		move.l     #0x000002E8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_open
		.globl WDLG_OPEN
wdlg_open:
WDLG_OPEN:
		move.l     #0x000002EC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_close
		.globl WDLG_CLOSE
wdlg_close:
WDLG_CLOSE:
		move.l     #0x000002F0,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_delete
		.globl WDLG_DELETE
wdlg_delete:
WDLG_DELETE:
		move.l     #0x000002F4,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_get_tree
		.globl WDLG_GET_TREE
wdlg_get_tree:
WDLG_GET_TREE:
		move.l     #0x000002F8,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_get_edit
		.globl WDLG_GET_EDIT
wdlg_get_edit:
WDLG_GET_EDIT:
		move.l     #0x000002FC,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_get_udata
		.globl WDLG_GET_UDATA
wdlg_get_udata:
WDLG_GET_UDATA:
		move.l     #0x00000300,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_get_handle
		.globl WDLG_GET_HANDLE
wdlg_get_handle:
WDLG_GET_HANDLE:
		move.l     #0x00000304,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_set_edit
		.globl WDLG_SET_EDIT
wdlg_set_edit:
WDLG_SET_EDIT:
		move.l     #0x00000308,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_set_tree
		.globl WDLG_SET_TREE
wdlg_set_tree:
WDLG_SET_TREE:
		move.l     #0x0000030C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_set_size
		.globl WDLG_SET_SIZE
wdlg_set_size:
WDLG_SET_SIZE:
		move.l     #0x00000310,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_set_iconify
		.globl WDLG_SET_ICONIFY
wdlg_set_iconify:
WDLG_SET_ICONIFY:
		move.l     #0x00000314,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_set_uniconify
		.globl WDLG_SET_UNICONIFY
wdlg_set_uniconify:
WDLG_SET_UNICONIFY:
		move.l     #0x00000318,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_evnt
		.globl WDLG_EVNT
wdlg_evnt:
WDLG_EVNT:
		move.l     #0x0000031C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wdlg_redraw
		.globl WDLG_REDRAW
wdlg_redraw:
WDLG_REDRAW:
		move.l     #0x00000320,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl wind_draw
		.globl WIND_DRAW
wind_draw:
WIND_DRAW:
		move.l     #0x00000324,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl scrp_clear
		.globl SCRP_CLEAR
scrp_clear:
SCRP_CLEAR:
		move.l     #0x00000328,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl objc_xedit
		.globl OBJC_XEDIT
objc_xedit:
OBJC_XEDIT:
		move.l     #0x0000032C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl graf_rubbbox
		.globl GRAF_RUBBBOX
graf_rubbbox:
GRAF_RUBBBOX:
		move.l     #0x00000330,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect

/* keytab */
	.globl Akt_getKeyTab
	.globl AKT_GETKEYTAB
Akt_getKeyTab:
AKT_GETKEYTAB:
		move.l     #0x00000000,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getRelease
		.globl AKT_GETRELEASE
Akt_getRelease:
AKT_GETRELEASE:
		move.l     #0x00000004,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getEuro
		.globl AKT_GETEURO
Akt_getEuro:
AKT_GETEURO:
		move.l     #0x00000008,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getExpMaxNr
		.globl AKT_GETEXPMAXNR
Akt_getExpMaxNr:
AKT_GETEXPMAXNR:
		move.l     #0x0000000C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getImpMaxNr
		.globl AKT_GETIMPMAXNR
Akt_getImpMaxNr:
AKT_GETIMPMAXNR:
		move.l     #0x00000010,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getExpNameFromNr
		.globl AKT_GETEXPNAMEFROMNR
Akt_getExpNameFromNr:
AKT_GETEXPNAMEFROMNR:
		move.l     #0x00000014,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getImpNameFromNr
		.globl AKT_GETIMPNAMEFROMNR
Akt_getImpNameFromNr:
AKT_GETIMPNAMEFROMNR:
		move.l     #0x00000018,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getExpShortNameFromNr
		.globl AKT_GETEXPSHORTNAMEFROMNR
Akt_getExpShortNameFromNr:
AKT_GETEXPSHORTNAMEFROMNR:
		move.l     #0x0000001C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getImpShortNameFromNr
		.globl AKT_GETIMPSHORTNAMEFROMNR
Akt_getImpShortNameFromNr:
AKT_GETIMPSHORTNAMEFROMNR:
		move.l     #0x00000020,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getExpNrFromId
		.globl AKT_GETEXPNRFROMID
Akt_getExpNrFromId:
AKT_GETEXPNRFROMID:
		move.l     #0x00000024,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getImpNrFromId
		.globl AKT_GETIMPNRFROMID
Akt_getImpNrFromId:
AKT_GETIMPNRFROMID:
		move.l     #0x00000028,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getExpIdFromNr
		.globl AKT_GETEXPIDFROMNR
Akt_getExpIdFromNr:
AKT_GETEXPIDFROMNR:
		move.l     #0x0000002C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getImpIdFromNr
		.globl AKT_GETIMPIDFROMNR
Akt_getImpIdFromNr:
AKT_GETIMPIDFROMNR:
		move.l     #0x00000030,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getExpNrFromName
		.globl AKT_GETEXPNRFROMNAME
Akt_getExpNrFromName:
AKT_GETEXPNRFROMNAME:
		move.l     #0x00000034,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getImpNrFromName
		.globl AKT_GETIMPNRFROMNAME
Akt_getImpNrFromName:
AKT_GETIMPNRFROMNAME:
		move.l     #0x00000038,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_CharAtari2X
		.globl AKT_CHARATARI2X
Akt_CharAtari2X:
AKT_CHARATARI2X:
		move.l     #0x0000003C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_CharX2Atari
		.globl AKT_CHARX2ATARI
Akt_CharX2Atari:
AKT_CHARX2ATARI:
		move.l     #0x00000040,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_BlockAtari2X
		.globl AKT_BLOCKATARI2X
Akt_BlockAtari2X:
AKT_BLOCKATARI2X:
		move.l     #0x00000044,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_BlockX2Atari
		.globl AKT_BLOCKX2ATARI
Akt_BlockX2Atari:
AKT_BLOCKX2ATARI:
		move.l     #0x00000048,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_StringAtari2X
		.globl AKT_STRINGATARI2X
Akt_StringAtari2X:
AKT_STRINGATARI2X:
		move.l     #0x0000004C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_StringX2Atari
		.globl AKT_STRINGX2ATARI
Akt_StringX2Atari:
AKT_STRINGX2ATARI:
		move.l     #0x00000050,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_CharX2Unicode
		.globl AKT_CHARX2UNICODE
Akt_CharX2Unicode:
AKT_CHARX2UNICODE:
		move.l     #0x00000054,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_CharUnicode2X
		.globl AKT_CHARUNICODE2X
Akt_CharUnicode2X:
AKT_CHARUNICODE2X:
		move.l     #0x00000058,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_BlockX2Unicode
		.globl AKT_BLOCKX2UNICODE
Akt_BlockX2Unicode:
AKT_BLOCKX2UNICODE:
		move.l     #0x0000005C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_BlockUnicode2X
		.globl AKT_BLOCKUNICODE2X
Akt_BlockUnicode2X:
AKT_BLOCKUNICODE2X:
		move.l     #0x00000060,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_StringX2Unicode
		.globl AKT_STRINGX2UNICODE
Akt_StringX2Unicode:
AKT_STRINGX2UNICODE:
		move.l     #0x00000064,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_popExpName
		.globl AKT_POPEXPNAME
Akt_popExpName:
AKT_POPEXPNAME:
		move.l     #0x00000068,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_popImpName
		.globl AKT_POPIMPNAME
Akt_popImpName:
AKT_POPIMPNAME:
		move.l     #0x0000006C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_chooseExpNr
		.globl AKT_CHOOSEEXPNR
Akt_chooseExpNr:
AKT_CHOOSEEXPNR:
		move.l     #0x00000070,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_chooseImpNr
		.globl AKT_CHOOSEIMPNR
Akt_chooseImpNr:
AKT_CHOOSEIMPNR:
		move.l     #0x00000074,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getExpMinNr
		.globl AKT_GETEXPMINNR
Akt_getExpMinNr:
AKT_GETEXPMINNR:
		move.l     #0x00000078,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getImpMinNr
		.globl AKT_GETIMPMINNR
Akt_getImpMinNr:
AKT_GETIMPMINNR:
		move.l     #0x0000007C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_BlockXUtf2Unicode
		.globl AKT_BLOCKXUTF2UNICODE
Akt_BlockXUtf2Unicode:
AKT_BLOCKXUTF2UNICODE:
		move.l     #0x00000080,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_BlockUnicode2XUtf
		.globl AKT_BLOCKUNICODE2XUTF
Akt_BlockUnicode2XUtf:
AKT_BLOCKUNICODE2XUTF:
		move.l     #0x00000084,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_StringXUtf2Unicode
		.globl AKT_STRINGXUTF2UNICODE
Akt_StringXUtf2Unicode:
AKT_STRINGXUTF2UNICODE:
		move.l     #0x00000088,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_BlockXUtf2U2XUtf
		.globl AKT_BLOCKXUTF2U2XUTF
Akt_BlockXUtf2U2XUtf:
AKT_BLOCKXUTF2U2XUTF:
		move.l     #0x0000008C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_BlockXUtf2XUtf
		.globl AKT_BLOCKXUTF2XUTF
Akt_BlockXUtf2XUtf:
AKT_BLOCKXUTF2XUTF:
		move.l     #0x00000090,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_StringXUtf2U2XUtf
		.globl AKT_STRINGXUTF2U2XUTF
Akt_StringXUtf2U2XUtf:
AKT_STRINGXUTF2U2XUTF:
		move.l     #0x00000094,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_StringXUtf2XUtf
		.globl AKT_STRINGXUTF2XUTF
Akt_StringXUtf2XUtf:
AKT_STRINGXUTF2XUTF:
		move.l     #0x00000098,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.IFNE WITH_EXTENSIONS
		.globl Akt_getInfoShort
		.globl AKT_GETINFOSHORT
Akt_getInfoShort:
AKT_GETINFOSHORT:
		move.l     #0x0000009C,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_getInfoString
		.globl AKT_GETINFOSTRING
Akt_getInfoString:
AKT_GETINFOSTRING:
		move.l     #0x000000A0,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_CharXUtf2Unicode
		.globl AKT_CHARXUTF2UNICODE
Akt_CharXUtf2Unicode:
AKT_CHARXUTF2UNICODE:
		move.l     #0x000000A4,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.globl Akt_CharUnicode2XUtf
		.globl AKT_CHARUNICODE2XUTF
Akt_CharUnicode2XUtf:
AKT_CHARUNICODE2XUTF:
		move.l     #0x000000A8,-(a7)
		move.l     funcKeytab(pc),-(a7)
		bra        indirect
		.ENDC

/* Multi-threading AES */
	.globl mt_appl_init
	.globl MT_APPL_INIT
mt_appl_init:
MT_APPL_INIT:
		move.l     #0x00000000,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_appl_read
		.globl MT_APPL_READ
mt_appl_read:
MT_APPL_READ:
		move.l     #0x00000004,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_appl_write
		.globl MT_APPL_WRITE
mt_appl_write:
MT_APPL_WRITE:
		move.l     #0x00000008,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_appl_find
		.globl MT_APPL_FIND
mt_appl_find:
MT_APPL_FIND:
		move.l     #0x0000000C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_appl_search
		.globl MT_APPL_SEARCH
mt_appl_search:
MT_APPL_SEARCH:
		move.l     #0x00000010,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_appl_tplay
		.globl MT_APPL_TPLAY
mt_appl_tplay:
MT_APPL_TPLAY:
		move.l     #0x00000014,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_appl_trecord
		.globl MT_APPL_TRECORD
mt_appl_trecord:
MT_APPL_TRECORD:
		move.l     #0x00000018,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_appl_yield
		.globl MT_APPL_YIELD
mt_appl_yield:
MT_APPL_YIELD:
		move.l     #0x0000001C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_appl_exit
		.globl MT_APPL_EXIT
mt_appl_exit:
MT_APPL_EXIT:
		move.l     #0x00000020,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_appl_getinfo
		.globl MT_APPL_GETINFO
mt_appl_getinfo:
MT_APPL_GETINFO:
		move.l     #0x00000024,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_appl_control
		.globl MT_APPL_CONTROL
mt_appl_control:
MT_APPL_CONTROL:
		move.l     #0x00000028,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_evnt_keybd
		.globl MT_EVNT_KEYBD
mt_evnt_keybd:
MT_EVNT_KEYBD:
		move.l     #0x00000334,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl mt_evnt_button
		.globl MT_EVNT_BUTTON
mt_evnt_button:
MT_EVNT_BUTTON:
		move.l     #0x0000002C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_evnt_mouse
		.globl MT_EVNT_MOUSE
mt_evnt_mouse:
MT_EVNT_MOUSE:
		move.l     #0x00000030,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_evnt_mesag
		.globl MT_EVNT_MESAG
mt_evnt_mesag:
MT_EVNT_MESAG:
		move.l     #0x00000034,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_evnt_timer
		.globl MT_EVNT_TIMER
mt_evnt_timer:
MT_EVNT_TIMER:
		move.l     #0x00000038,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_evnt_event
		.globl MT_EVNT_EVENT
mt_evnt_event:
MT_EVNT_EVENT:
		move.l     #0x0000003C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_evnt_multi
		.globl MT_EVNT_MULTI
mt_evnt_multi:
MT_EVNT_MULTI:
		move.l     #0x00000040,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_evnt_dclick
		.globl MT_EVNT_DCLICK
mt_evnt_dclick:
MT_EVNT_DCLICK:
		move.l     #0x00000044,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_menu_bar
		.globl MT_MENU_BAR
mt_menu_bar:
MT_MENU_BAR:
		move.l     #0x00000048,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_menu_icheck
		.globl MT_MENU_ICHECK
mt_menu_icheck:
MT_MENU_ICHECK:
		move.l     #0x0000004C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_menu_ienable
		.globl MT_MENU_IENABLE
mt_menu_ienable:
MT_MENU_IENABLE:
		move.l     #0x00000050,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_menu_tnormal
		.globl MT_MENU_TNORMAL
mt_menu_tnormal:
MT_MENU_TNORMAL:
		move.l     #0x00000054,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_menu_text
		.globl MT_MENU_TEXT
mt_menu_text:
MT_MENU_TEXT:
		move.l     #0x00000058,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_menu_register
		.globl MT_MENU_REGISTER
mt_menu_register:
MT_MENU_REGISTER:
		move.l     #0x0000005C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_menu_unregister
		.globl MT_MENU_UNREGISTER
mt_menu_unregister:
MT_MENU_UNREGISTER:
		move.l     #0x00000060,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_menu_click
		.globl MT_MENU_CLICK
mt_menu_click:
MT_MENU_CLICK:
		move.l     #0x00000064,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_menu_attach
		.globl MT_MENU_ATTACH
mt_menu_attach:
MT_MENU_ATTACH:
		move.l     #0x00000068,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_menu_istart
		.globl MT_MENU_ISTART
mt_menu_istart:
MT_MENU_ISTART:
		move.l     #0x0000006C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_menu_popup
		.globl MT_MENU_POPUP
mt_menu_popup:
MT_MENU_POPUP:
		move.l     #0x00000070,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_menu_settings
		.globl MT_MENU_SETTINGS
mt_menu_settings:
MT_MENU_SETTINGS:
		move.l     #0x00000074,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_objc_add
		.globl MT_OBJC_ADD
mt_objc_add:
MT_OBJC_ADD:
		move.l     #0x00000078,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_objc_delete
		.globl MT_OBJC_DELETE
mt_objc_delete:
MT_OBJC_DELETE:
		move.l     #0x0000007C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_objc_draw
		.globl MT_OBJC_DRAW
mt_objc_draw:
MT_OBJC_DRAW:
		move.l     #0x00000338,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl mt_objc_find
		.globl MT_OBJC_FIND
mt_objc_find:
MT_OBJC_FIND:
		move.l     #0x00000080,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_objc_offset
		.globl MT_OBJC_OFFSET
mt_objc_offset:
MT_OBJC_OFFSET:
		move.l     #0x00000084,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_objc_order
		.globl MT_OBJC_ORDER
mt_objc_order:
MT_OBJC_ORDER:
		move.l     #0x00000088,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_objc_edit
		.globl MT_OBJC_EDIT
mt_objc_edit:
MT_OBJC_EDIT:
		move.l     #0x0000008C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_objc_change
		.globl MT_OBJC_CHANGE
mt_objc_change:
MT_OBJC_CHANGE:
		move.l     #0x00000090,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_objc_sysvar
		.globl MT_OBJC_SYSVAR
mt_objc_sysvar:
MT_OBJC_SYSVAR:
		move.l     #0x00000094,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_form_do
		.globl MT_FORM_DO
mt_form_do:
MT_FORM_DO:
		move.l     #0x00000098,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_form_dial
		.globl MT_FORM_DIAL
mt_form_dial:
MT_FORM_DIAL:
		move.l     #0x0000009C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_form_alert
		.globl MT_FORM_ALERT
mt_form_alert:
MT_FORM_ALERT:
		move.l     #0x000000A0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_form_error
		.globl MT_FORM_ERROR
mt_form_error:
MT_FORM_ERROR:
		move.l     #0x000000A4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_form_center
		.globl MT_FORM_CENTER
mt_form_center:
MT_FORM_CENTER:
		move.l     #0x000000A8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_form_keybd
		.globl MT_FORM_KEYBD
mt_form_keybd:
MT_FORM_KEYBD:
		move.l     #0x000000AC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_form_button
		.globl MT_FORM_BUTTON
mt_form_button:
MT_FORM_BUTTON:
		move.l     #0x000000B0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_rubbox
		.globl MT_GRAF_RUBBOX
mt_graf_rubbox:
MT_GRAF_RUBBOX:
		move.l     #0x000000B4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_rubberbox
		.globl MT_GRAF_RUBBERBOX
mt_graf_rubberbox:
MT_GRAF_RUBBERBOX:
		move.l     #0x000000B8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_dragbox
		.globl MT_GRAF_DRAGBOX
mt_graf_dragbox:
MT_GRAF_DRAGBOX:
		move.l     #0x000000BC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_mbox
		.globl MT_GRAF_MBOX
mt_graf_mbox:
MT_GRAF_MBOX:
		move.l     #0x000000C0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_movebox
		.globl MT_GRAF_MOVEBOX
mt_graf_movebox:
MT_GRAF_MOVEBOX:
		move.l     #0x000000C4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_growbox
		.globl MT_GRAF_GROWBOX
mt_graf_growbox:
MT_GRAF_GROWBOX:
		move.l     #0x000000C8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_shrinkbox
		.globl MT_GRAF_SHRINKBOX
mt_graf_shrinkbox:
MT_GRAF_SHRINKBOX:
		move.l     #0x000000CC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_watchbox
		.globl MT_GRAF_WATCHBOX
mt_graf_watchbox:
MT_GRAF_WATCHBOX:
		move.l     #0x000000D0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_slidebox
		.globl MT_GRAF_SLIDEBOX
mt_graf_slidebox:
MT_GRAF_SLIDEBOX:
		move.l     #0x000000D4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_handle
		.globl MT_GRAF_HANDLE
mt_graf_handle:
MT_GRAF_HANDLE:
		move.l     #0x000000D8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_mouse
		.globl MT_GRAF_MOUSE
mt_graf_mouse:
MT_GRAF_MOUSE:
		move.l     #0x000000DC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_mkstate
		.globl MT_GRAF_MKSTATE
mt_graf_mkstate:
MT_GRAF_MKSTATE:
		move.l     #0x000000E0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_multirubber
		.globl MT_GRAF_MULTIRUBBER
mt_graf_multirubber:
MT_GRAF_MULTIRUBBER:
		move.l     #0x000000E4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_scrp_read
		.globl MT_SCRP_READ
mt_scrp_read:
MT_SCRP_READ:
		move.l     #0x000000E8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_scrp_write
		.globl MT_SCRP_WRITE
mt_scrp_write:
MT_SCRP_WRITE:
		move.l     #0x000000EC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fsel_input
		.globl MT_FSEL_INPUT
mt_fsel_input:
MT_FSEL_INPUT:
		move.l     #0x000000F0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fsel_exinput
		.globl MT_FSEL_EXINPUT
mt_fsel_exinput:
MT_FSEL_EXINPUT:
		move.l     #0x000000F4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fsel_boxinput
		.globl MT_FSEL_BOXINPUT
mt_fsel_boxinput:
MT_FSEL_BOXINPUT:
		move.l     #0x000000F8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fslx_open
		.globl MT_FSLX_OPEN
mt_fslx_open:
MT_FSLX_OPEN:
		move.l     #0x000000FC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fslx_close
		.globl MT_FSLX_CLOSE
mt_fslx_close:
MT_FSLX_CLOSE:
		move.l     #0x00000100,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fslx_getnxtfile
		.globl MT_FSLX_GETNXTFILE
mt_fslx_getnxtfile:
MT_FSLX_GETNXTFILE:
		move.l     #0x00000104,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fslx_evnt
		.globl MT_FSLX_EVNT
mt_fslx_evnt:
MT_FSLX_EVNT:
		move.l     #0x00000108,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fslx_do
		.globl MT_FSLX_DO
mt_fslx_do:
MT_FSLX_DO:
		move.l     #0x0000010C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fslx_set_flags
		.globl MT_FSLX_SET_FLAGS
mt_fslx_set_flags:
MT_FSLX_SET_FLAGS:
		move.l     #0x00000110,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wind_create
		.globl MT_WIND_CREATE
mt_wind_create:
MT_WIND_CREATE:
		move.l     #0x0000033C,-(a7)
		move.l     funcAes(pc),-(a7)
		bra        indirect
		.globl mt_wind_open
		.globl MT_WIND_OPEN
mt_wind_open:
MT_WIND_OPEN:
		move.l     #0x00000114,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wind_close
		.globl MT_WIND_CLOSE
mt_wind_close:
MT_WIND_CLOSE:
		move.l     #0x00000118,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wind_delete
		.globl MT_WIND_DELETE
mt_wind_delete:
MT_WIND_DELETE:
		move.l     #0x0000011C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wind_get
		.globl MT_WIND_GET
mt_wind_get:
MT_WIND_GET:
		move.l     #0x00000120,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wind_getQSB
		.globl MT_WIND_GETQSB
mt_wind_getQSB:
MT_WIND_GETQSB:
		move.l     #0x00000124,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wind_set
		.globl MT_WIND_SET
mt_wind_set:
MT_WIND_SET:
		move.l     #0x00000128,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wind_find
		.globl MT_WIND_FIND
mt_wind_find:
MT_WIND_FIND:
		move.l     #0x0000012C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wind_update
		.globl MT_WIND_UPDATE
mt_wind_update:
MT_WIND_UPDATE:
		move.l     #0x00000130,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wind_calc
		.globl MT_WIND_CALC
mt_wind_calc:
MT_WIND_CALC:
		move.l     #0x00000134,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wind_new
		.globl MT_WIND_NEW
mt_wind_new:
MT_WIND_NEW:
		move.l     #0x00000138,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_rsrc_load
		.globl MT_RSRC_LOAD
mt_rsrc_load:
MT_RSRC_LOAD:
		move.l     #0x0000013C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_rsrc_free
		.globl MT_RSRC_FREE
mt_rsrc_free:
MT_RSRC_FREE:
		move.l     #0x00000140,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_rsrc_gaddr
		.globl MT_RSRC_GADDR
mt_rsrc_gaddr:
MT_RSRC_GADDR:
		move.l     #0x00000144,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_rsrc_saddr
		.globl MT_RSRC_SADDR
mt_rsrc_saddr:
MT_RSRC_SADDR:
		move.l     #0x00000148,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_rsrc_obfix
		.globl MT_RSRC_OBFIX
mt_rsrc_obfix:
MT_RSRC_OBFIX:
		move.l     #0x0000014C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_rsrc_rcfix
		.globl MT_RSRC_RCFIX
mt_rsrc_rcfix:
MT_RSRC_RCFIX:
		move.l     #0x00000150,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_shel_read
		.globl MT_SHEL_READ
mt_shel_read:
MT_SHEL_READ:
		move.l     #0x00000154,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_shel_write
		.globl MT_SHEL_WRITE
mt_shel_write:
MT_SHEL_WRITE:
		move.l     #0x00000158,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_shel_get
		.globl MT_SHEL_GET
mt_shel_get:
MT_SHEL_GET:
		move.l     #0x0000015C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_shel_put
		.globl MT_SHEL_PUT
mt_shel_put:
MT_SHEL_PUT:
		move.l     #0x00000160,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_shel_find
		.globl MT_SHEL_FIND
mt_shel_find:
MT_SHEL_FIND:
		move.l     #0x00000164,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_shel_envrn
		.globl MT_SHEL_ENVRN
mt_shel_envrn:
MT_SHEL_ENVRN:
		move.l     #0x00000168,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_shel_help
		.globl MT_SHEL_HELP
mt_shel_help:
MT_SHEL_HELP:
		move.l     #0x0000016C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fnts_add
		.globl MT_FNTS_ADD
mt_fnts_add:
MT_FNTS_ADD:
		move.l     #0x00000170,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fnts_close
		.globl MT_FNTS_CLOSE
mt_fnts_close:
MT_FNTS_CLOSE:
		move.l     #0x00000174,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fnts_create
		.globl MT_FNTS_CREATE
mt_fnts_create:
MT_FNTS_CREATE:
		move.l     #0x00000178,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fnts_delete
		.globl MT_FNTS_DELETE
mt_fnts_delete:
MT_FNTS_DELETE:
		move.l     #0x0000017C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fnts_do
		.globl MT_FNTS_DO
mt_fnts_do:
MT_FNTS_DO:
		move.l     #0x00000180,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fnts_evnt
		.globl MT_FNTS_EVNT
mt_fnts_evnt:
MT_FNTS_EVNT:
		move.l     #0x00000184,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fnts_get_info
		.globl MT_FNTS_GET_INFO
mt_fnts_get_info:
MT_FNTS_GET_INFO:
		move.l     #0x00000188,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fnts_get_name
		.globl MT_FNTS_GET_NAME
mt_fnts_get_name:
MT_FNTS_GET_NAME:
		move.l     #0x0000018C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fnts_get_no_styles
		.globl MT_FNTS_GET_NO_STYLES
mt_fnts_get_no_styles:
MT_FNTS_GET_NO_STYLES:
		move.l     #0x00000190,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fnts_get_style
		.globl MT_FNTS_GET_STYLE
mt_fnts_get_style:
MT_FNTS_GET_STYLE:
		move.l     #0x00000194,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fnts_open
		.globl MT_FNTS_OPEN
mt_fnts_open:
MT_FNTS_OPEN:
		move.l     #0x00000198,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fnts_remove
		.globl MT_FNTS_REMOVE
mt_fnts_remove:
MT_FNTS_REMOVE:
		move.l     #0x0000019C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_fnts_update
		.globl MT_FNTS_UPDATE
mt_fnts_update:
MT_FNTS_UPDATE:
		move.l     #0x000001A0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_ascroll_to
		.globl MT_LBOX_ASCROLL_TO
mt_lbox_ascroll_to:
MT_LBOX_ASCROLL_TO:
		move.l     #0x000001A4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_scroll_to
		.globl MT_LBOX_SCROLL_TO
mt_lbox_scroll_to:
MT_LBOX_SCROLL_TO:
		move.l     #0x000001A8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_bscroll_to
		.globl MT_LBOX_BSCROLL_TO
mt_lbox_bscroll_to:
MT_LBOX_BSCROLL_TO:
		move.l     #0x000001AC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_cnt_items
		.globl MT_LBOX_CNT_ITEMS
mt_lbox_cnt_items:
MT_LBOX_CNT_ITEMS:
		move.l     #0x000001B0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_create
		.globl MT_LBOX_CREATE
mt_lbox_create:
MT_LBOX_CREATE:
		move.l     #0x000001B4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_delete
		.globl MT_LBOX_DELETE
mt_lbox_delete:
MT_LBOX_DELETE:
		move.l     #0x000001B8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_do
		.globl MT_LBOX_DO
mt_lbox_do:
MT_LBOX_DO:
		move.l     #0x000001BC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_free_items
		.globl MT_LBOX_FREE_ITEMS
mt_lbox_free_items:
MT_LBOX_FREE_ITEMS:
		move.l     #0x000001C0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_free_list
		.globl MT_LBOX_FREE_LIST
mt_lbox_free_list:
MT_LBOX_FREE_LIST:
		move.l     #0x000001C4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_get_afirst
		.globl MT_LBOX_GET_AFIRST
mt_lbox_get_afirst:
MT_LBOX_GET_AFIRST:
		move.l     #0x000001C8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_get_first
		.globl MT_LBOX_GET_FIRST
mt_lbox_get_first:
MT_LBOX_GET_FIRST:
		move.l     #0x000001CC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_get_avis
		.globl MT_LBOX_GET_AVIS
mt_lbox_get_avis:
MT_LBOX_GET_AVIS:
		move.l     #0x000001D0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_get_visible
		.globl MT_LBOX_GET_VISIBLE
mt_lbox_get_visible:
MT_LBOX_GET_VISIBLE:
		move.l     #0x000001D4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_get_bentries
		.globl MT_LBOX_GET_BENTRIES
mt_lbox_get_bentries:
MT_LBOX_GET_BENTRIES:
		move.l     #0x000001D8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_get_bfirst
		.globl MT_LBOX_GET_BFIRST
mt_lbox_get_bfirst:
MT_LBOX_GET_BFIRST:
		move.l     #0x000001DC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_get_idx
		.globl MT_LBOX_GET_IDX
mt_lbox_get_idx:
MT_LBOX_GET_IDX:
		move.l     #0x000001E0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_get_item
		.globl MT_LBOX_GET_ITEM
mt_lbox_get_item:
MT_LBOX_GET_ITEM:
		move.l     #0x000001E4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_get_items
		.globl MT_LBOX_GET_ITEMS
mt_lbox_get_items:
MT_LBOX_GET_ITEMS:
		move.l     #0x000001E8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_get_slct_idx
		.globl MT_LBOX_GET_SLCT_IDX
mt_lbox_get_slct_idx:
MT_LBOX_GET_SLCT_IDX:
		move.l     #0x000001EC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_get_slct_item
		.globl MT_LBOX_GET_SLCT_ITEM
mt_lbox_get_slct_item:
MT_LBOX_GET_SLCT_ITEM:
		move.l     #0x000001F0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_get_tree
		.globl MT_LBOX_GET_TREE
mt_lbox_get_tree:
MT_LBOX_GET_TREE:
		move.l     #0x000001F4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_get_udata
		.globl MT_LBOX_GET_UDATA
mt_lbox_get_udata:
MT_LBOX_GET_UDATA:
		move.l     #0x000001F8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_set_asldr
		.globl MT_LBOX_SET_ASLDR
mt_lbox_set_asldr:
MT_LBOX_SET_ASLDR:
		move.l     #0x000001FC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_set_slider
		.globl MT_LBOX_SET_SLIDER
mt_lbox_set_slider:
MT_LBOX_SET_SLIDER:
		move.l     #0x00000200,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_set_bentries
		.globl MT_LBOX_SET_BENTRIES
mt_lbox_set_bentries:
MT_LBOX_SET_BENTRIES:
		move.l     #0x00000204,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_set_bsldr
		.globl MT_LBOX_SET_BSLDR
mt_lbox_set_bsldr:
MT_LBOX_SET_BSLDR:
		move.l     #0x00000208,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_set_items
		.globl MT_LBOX_SET_ITEMS
mt_lbox_set_items:
MT_LBOX_SET_ITEMS:
		move.l     #0x0000020C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_lbox_update
		.globl MT_LBOX_UPDATE
mt_lbox_update:
MT_LBOX_UPDATE:
		move.l     #0x00000210,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_add_printers
		.globl MT_PDLG_ADD_PRINTERS
mt_pdlg_add_printers:
MT_PDLG_ADD_PRINTERS:
		move.l     #0x00000214,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_add_sub_dialogs
		.globl MT_PDLG_ADD_SUB_DIALOGS
mt_pdlg_add_sub_dialogs:
MT_PDLG_ADD_SUB_DIALOGS:
		move.l     #0x00000218,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_close
		.globl MT_PDLG_CLOSE
mt_pdlg_close:
MT_PDLG_CLOSE:
		move.l     #0x0000021C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_create
		.globl MT_PDLG_CREATE
mt_pdlg_create:
MT_PDLG_CREATE:
		move.l     #0x00000220,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_delete
		.globl MT_PDLG_DELETE
mt_pdlg_delete:
MT_PDLG_DELETE:
		move.l     #0x00000224,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_dflt_settings
		.globl MT_PDLG_DFLT_SETTINGS
mt_pdlg_dflt_settings:
MT_PDLG_DFLT_SETTINGS:
		move.l     #0x00000228,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_do
		.globl MT_PDLG_DO
mt_pdlg_do:
MT_PDLG_DO:
		move.l     #0x0000022C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_evnt
		.globl MT_PDLG_EVNT
mt_pdlg_evnt:
MT_PDLG_EVNT:
		move.l     #0x00000230,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_free_settings
		.globl MT_PDLG_FREE_SETTINGS
mt_pdlg_free_settings:
MT_PDLG_FREE_SETTINGS:
		move.l     #0x00000234,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_get_setsize
		.globl MT_PDLG_GET_SETSIZE
mt_pdlg_get_setsize:
MT_PDLG_GET_SETSIZE:
		move.l     #0x00000238,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_new_settings
		.globl MT_PDLG_NEW_SETTINGS
mt_pdlg_new_settings:
MT_PDLG_NEW_SETTINGS:
		move.l     #0x0000023C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_open
		.globl MT_PDLG_OPEN
mt_pdlg_open:
MT_PDLG_OPEN:
		move.l     #0x00000240,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_remove_printers
		.globl MT_PDLG_REMOVE_PRINTERS
mt_pdlg_remove_printers:
MT_PDLG_REMOVE_PRINTERS:
		move.l     #0x00000244,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_remove_sub_dialogs
		.globl MT_PDLG_REMOVE_SUB_DIALOGS
mt_pdlg_remove_sub_dialogs:
MT_PDLG_REMOVE_SUB_DIALOGS:
		move.l     #0x00000248,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_update
		.globl MT_PDLG_UPDATE
mt_pdlg_update:
MT_PDLG_UPDATE:
		move.l     #0x0000024C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_use_settings
		.globl MT_PDLG_USE_SETTINGS
mt_pdlg_use_settings:
MT_PDLG_USE_SETTINGS:
		move.l     #0x00000250,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_pdlg_validate_settings
		.globl MT_PDLG_VALIDATE_SETTINGS
mt_pdlg_validate_settings:
MT_PDLG_VALIDATE_SETTINGS:
		move.l     #0x00000254,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_create
		.globl MT_EDIT_CREATE
mt_edit_create:
MT_EDIT_CREATE:
		move.l     #0x00000258,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_set_buf
		.globl MT_EDIT_SET_BUF
mt_edit_set_buf:
MT_EDIT_SET_BUF:
		move.l     #0x0000025C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_open
		.globl MT_EDIT_OPEN
mt_edit_open:
MT_EDIT_OPEN:
		move.l     #0x00000260,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_close
		.globl MT_EDIT_CLOSE
mt_edit_close:
MT_EDIT_CLOSE:
		move.l     #0x00000264,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_delete
		.globl MT_EDIT_DELETE
mt_edit_delete:
MT_EDIT_DELETE:
		move.l     #0x00000268,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_cursor
		.globl MT_EDIT_CURSOR
mt_edit_cursor:
MT_EDIT_CURSOR:
		move.l     #0x0000026C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_evnt
		.globl MT_EDIT_EVNT
mt_edit_evnt:
MT_EDIT_EVNT:
		move.l     #0x00000270,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_get_buf
		.globl MT_EDIT_GET_BUF
mt_edit_get_buf:
MT_EDIT_GET_BUF:
		move.l     #0x00000274,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_get_format
		.globl MT_EDIT_GET_FORMAT
mt_edit_get_format:
MT_EDIT_GET_FORMAT:
		move.l     #0x00000278,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_get_colour
		.globl MT_EDIT_GET_COLOUR
mt_edit_get_colour:
MT_EDIT_GET_COLOUR:
		move.l     #0x0000027C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_get_color
		.globl MT_EDIT_GET_COLOR
mt_edit_get_color:
MT_EDIT_GET_COLOR:
		move.l     #0x00000280,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_get_font
		.globl MT_EDIT_GET_FONT
mt_edit_get_font:
MT_EDIT_GET_FONT:
		move.l     #0x00000284,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_get_cursor
		.globl MT_EDIT_GET_CURSOR
mt_edit_get_cursor:
MT_EDIT_GET_CURSOR:
		move.l     #0x00000288,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_get_dirty
		.globl MT_EDIT_GET_DIRTY
mt_edit_get_dirty:
MT_EDIT_GET_DIRTY:
		move.l     #0x0000028C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_get_sel
		.globl MT_EDIT_GET_SEL
mt_edit_get_sel:
MT_EDIT_GET_SEL:
		move.l     #0x00000290,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_get_scrollinfo
		.globl MT_EDIT_GET_SCROLLINFO
mt_edit_get_scrollinfo:
MT_EDIT_GET_SCROLLINFO:
		move.l     #0x00000294,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_set_format
		.globl MT_EDIT_SET_FORMAT
mt_edit_set_format:
MT_EDIT_SET_FORMAT:
		move.l     #0x00000298,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_set_colour
		.globl MT_EDIT_SET_COLOUR
mt_edit_set_colour:
MT_EDIT_SET_COLOUR:
		move.l     #0x0000029C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_set_color
		.globl MT_EDIT_SET_COLOR
mt_edit_set_color:
MT_EDIT_SET_COLOR:
		move.l     #0x000002A0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_set_font
		.globl MT_EDIT_SET_FONT
mt_edit_set_font:
MT_EDIT_SET_FONT:
		move.l     #0x000002A4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_set_cursor
		.globl MT_EDIT_SET_CURSOR
mt_edit_set_cursor:
MT_EDIT_SET_CURSOR:
		move.l     #0x000002A8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_resized
		.globl MT_EDIT_RESIZED
mt_edit_resized:
MT_EDIT_RESIZED:
		move.l     #0x000002AC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_set_dirty
		.globl MT_EDIT_SET_DIRTY
mt_edit_set_dirty:
MT_EDIT_SET_DIRTY:
		move.l     #0x000002B0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_edit_scroll
		.globl MT_EDIT_SCROLL
mt_edit_scroll:
MT_EDIT_SCROLL:
		move.l     #0x000002B4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_EvntMulti
		.globl MT_EVNTMULTI
mt_EvntMulti:
MT_EVNTMULTI:
		move.l     #0x000002B8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_form_wbutton
		.globl MT_FORM_WBUTTON
mt_form_wbutton:
MT_FORM_WBUTTON:
		move.l     #0x000002BC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_form_xdial
		.globl MT_FORM_XDIAL
mt_form_xdial:
MT_FORM_XDIAL:
		move.l     #0x000002C0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_form_xdo
		.globl MT_FORM_XDO
mt_form_xdo:
MT_FORM_XDO:
		move.l     #0x000002C4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_form_xerr
		.globl MT_FORM_XERR
mt_form_xerr:
MT_FORM_XERR:
		move.l     #0x000002C8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_wwatchbox
		.globl MT_GRAF_WWATCHBOX
mt_graf_wwatchbox:
MT_GRAF_WWATCHBOX:
		move.l     #0x000002CC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_xhandle
		.globl MT_GRAF_XHANDLE
mt_graf_xhandle:
MT_GRAF_XHANDLE:
		move.l     #0x000002D0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_create
		.globl MT_WDLG_CREATE
mt_wdlg_create:
MT_WDLG_CREATE:
		move.l     #0x000002D4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_open
		.globl MT_WDLG_OPEN
mt_wdlg_open:
MT_WDLG_OPEN:
		move.l     #0x000002D8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_close
		.globl MT_WDLG_CLOSE
mt_wdlg_close:
MT_WDLG_CLOSE:
		move.l     #0x000002DC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_delete
		.globl MT_WDLG_DELETE
mt_wdlg_delete:
MT_WDLG_DELETE:
		move.l     #0x000002E0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_get_tree
		.globl MT_WDLG_GET_TREE
mt_wdlg_get_tree:
MT_WDLG_GET_TREE:
		move.l     #0x000002E4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_get_edit
		.globl MT_WDLG_GET_EDIT
mt_wdlg_get_edit:
MT_WDLG_GET_EDIT:
		move.l     #0x000002E8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_get_udata
		.globl MT_WDLG_GET_UDATA
mt_wdlg_get_udata:
MT_WDLG_GET_UDATA:
		move.l     #0x000002EC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_get_handle
		.globl MT_WDLG_GET_HANDLE
mt_wdlg_get_handle:
MT_WDLG_GET_HANDLE:
		move.l     #0x000002F0,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_set_edit
		.globl MT_WDLG_SET_EDIT
mt_wdlg_set_edit:
MT_WDLG_SET_EDIT:
		move.l     #0x000002F4,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_set_tree
		.globl MT_WDLG_SET_TREE
mt_wdlg_set_tree:
MT_WDLG_SET_TREE:
		move.l     #0x000002F8,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_set_size
		.globl MT_WDLG_SET_SIZE
mt_wdlg_set_size:
MT_WDLG_SET_SIZE:
		move.l     #0x000002FC,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_set_iconify
		.globl MT_WDLG_SET_ICONIFY
mt_wdlg_set_iconify:
MT_WDLG_SET_ICONIFY:
		move.l     #0x00000300,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_set_uniconify
		.globl MT_WDLG_SET_UNICONIFY
mt_wdlg_set_uniconify:
MT_WDLG_SET_UNICONIFY:
		move.l     #0x00000304,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_evnt
		.globl MT_WDLG_EVNT
mt_wdlg_evnt:
MT_WDLG_EVNT:
		move.l     #0x00000308,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wdlg_redraw
		.globl MT_WDLG_REDRAW
mt_wdlg_redraw:
MT_WDLG_REDRAW:
		move.l     #0x0000030C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_wind_draw
		.globl MT_WIND_DRAW
mt_wind_draw:
MT_WIND_DRAW:
		move.l     #0x00000310,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_scrp_clear
		.globl MT_SCRP_CLEAR
mt_scrp_clear:
MT_SCRP_CLEAR:
		move.l     #0x00000314,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_objc_xedit
		.globl MT_OBJC_XEDIT
mt_objc_xedit:
MT_OBJC_XEDIT:
		move.l     #0x00000318,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect
		.globl mt_graf_rubbbox
		.globl MT_GRAF_RUBBBOX
mt_graf_rubbbox:
MT_GRAF_RUBBBOX:
		move.l     #0x0000031C,-(a7)
		move.l     funcMtAes(pc),-(a7)
		bra        indirect

	.data

	.globl errno
errno: dc.w 0
	.globl _FilSysVec
_FilSysVec:
	dc.l 0
