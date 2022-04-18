	.globl Acfg_create
Acfg_create:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		moveq.l    #34,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Acfg_create_1
		suba.l     a0,a0
		bra.s      Acfg_create_2
Acfg_create_1:
		moveq.l    #34,d1
		clr.w      d0
		movea.l    (a7),a0
		jsr        memset
		movea.l    6(a7),a1
		movea.l    (a7),a0
		jsr        InitConfigStruct
		movea.l    6(a7),a0
		movea.l    (a0),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      Acfg_create_3
		move.w     4(a7),d0
		beq.s      Acfg_create_3
		suba.l     a1,a1
		movea.l    (a7),a0
		jsr        Acfg_load
Acfg_create_3:
		movea.l    (a7),a0
Acfg_create_2:
		lea.l      10(a7),a7
		rts

	.globl Acfg_delete
Acfg_delete:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     4(a7),(a7)
		move.l     (a7),d0
		beq.s      Acfg_delete_1
		moveq.l    #1,d0
		movea.l    (a7),a0
		and.w      26(a0),d0
		beq.s      Acfg_delete_2
		movea.l    (a7),a0
		move.w     18(a0),d0
		beq.s      Acfg_delete_2
		suba.l     a1,a1
		movea.l    4(a7),a0
		jsr        Acfg_save
Acfg_delete_2:
		suba.l     a1,a1
		movea.l    (a7),a0
		jsr        Acfg_clear
		moveq.l    #34,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
Acfg_delete_1:
		addq.w     #8,a7
		rts

	.globl Acfg_flags
Acfg_flags:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.w     d0,6(a7)
		move.w     d1,4(a7)
		move.l     8(a7),(a7)
		move.w     4(a7),d0
		ble.s      Acfg_flags_1
		move.w     6(a7),d0
		movea.l    (a7),a0
		or.w       d0,26(a0)
		bra.s      Acfg_flags_2
Acfg_flags_1:
		move.w     4(a7),d0
		bne.s      Acfg_flags_2
		move.w     6(a7),d0
		not.w      d0
		movea.l    (a7),a0
		and.w      d0,26(a0)
Acfg_flags_2:
		movea.l    (a7),a0
		move.w     26(a0),d0
		lea.l      12(a7),a7
		rts

InitConfigStruct:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a1
		movea.l    4(a7),a0
		jsr        Acfg_copyInfo
		movea.l    4(a7),a0
		clr.w      20(a0)
		movea.l    4(a7),a0
		clr.l      22(a0)
		movea.l    4(a7),a0
		clr.w      28(a0)
		movea.l    4(a7),a0
		clr.l      30(a0)
		addq.w     #8,a7
		rts

	.globl Acfg_createInfo
Acfg_createInfo:
		subq.w     #4,a7
		moveq.l    #18,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Acfg_createInfo_1
		suba.l     a0,a0
		bra.s      Acfg_createInfo_2
Acfg_createInfo_1:
		moveq.l    #18,d1
		clr.w      d0
		movea.l    (a7),a0
		jsr        memset
		lea.l      xe0588,a1
		movea.l    (a7),a0
		jsr        Acfg_initInfo
		movea.l    (a7),a0
Acfg_createInfo_2:
		addq.w     #4,a7
		rts

	.globl Acfg_deleteInfo
Acfg_deleteInfo:
		subq.w     #4,a7
		move.l     a0,(a7)
		lea.l      xe058b,a1
		movea.l    (a7),a0
		jsr        Acfg_initInfo
		moveq.l    #18,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		addq.w     #4,a7
		rts

Acfg_initInfo:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		move.l     (a0),d0
		beq.s      Acfg_initInfo_1
		movea.l    4(a7),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		beq.s      Acfg_initInfo_1
		movea.l    4(a7),a0
		movea.l    (a0),a0
		jsr        Ast_delete
Acfg_initInfo_1:
		lea.l      xe058c,a0
		jsr        Ast_create
		movea.l    4(a7),a1
		move.l     a0,(a1)
		movea.l    4(a7),a0
		move.l     4(a0),d0
		beq.s      Acfg_initInfo_2
		movea.l    4(a7),a0
		movea.l    4(a0),a0
		move.b     (a0),d0
		beq.s      Acfg_initInfo_2
		movea.l    4(a7),a0
		movea.l    4(a0),a0
		jsr        Ast_delete
Acfg_initInfo_2:
		movea.l    (a7),a0
		jsr        Ast_create
		movea.l    4(a7),a1
		move.l     a0,4(a1)
		movea.l    4(a7),a0
		move.l     8(a0),d0
		beq.s      Acfg_initInfo_3
		movea.l    4(a7),a0
		movea.l    8(a0),a0
		move.b     (a0),d0
		beq.s      Acfg_initInfo_3
		movea.l    4(a7),a0
		movea.l    8(a0),a0
		jsr        Ast_delete
Acfg_initInfo_3:
		lea.l      xe058d,a0
		jsr        Ast_create
		movea.l    4(a7),a1
		move.l     a0,8(a1)
		movea.l    4(a7),a0
		clr.w      12(a0)
		movea.l    4(a7),a0
		clr.w      14(a0)
		movea.l    4(a7),a0
		move.w     #$0020,16(a0)
		addq.w     #8,a7
		rts

	.globl Acfg_copyInfo
Acfg_copyInfo:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		move.l     (a7),d0
		bne.s      Acfg_copyInfo_1
		move.l     #default_info,(a7)
Acfg_copyInfo_1:
		movea.l    (a7),a0
		movea.l    4(a0),a1
		movea.l    4(a7),a0
		bsr        Acfg_initInfo
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        Ast_create
		movea.l    4(a7),a1
		move.l     a0,(a1)
		movea.l    (a7),a0
		move.l     8(a0),d0
		beq.s      Acfg_copyInfo_2
		movea.l    (a7),a0
		movea.l    8(a0),a0
		jsr        Ast_create
		bra.s      Acfg_copyInfo_3
Acfg_copyInfo_2:
		suba.l     a0,a0
Acfg_copyInfo_3:
		movea.l    4(a7),a1
		move.l     a0,8(a1)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.w     12(a0),12(a1)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.w     14(a0),14(a1)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.w     16(a0),16(a1)
		movea.l    4(a7),a0
		addq.w     #8,a7
		rts

	.globl Acfg_setInfo
Acfg_setInfo:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		move.l     8(a7),(a7)
		movea.l    4(a7),a1
		movea.l    (a7),a0
		bsr        Acfg_copyInfo
		movea.l    4(a7),a0
		lea.l      12(a7),a7
		rts

	.globl Acfg_getInfo
Acfg_getInfo:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		move.l     8(a7),(a7)
		movea.l    (a7),a1
		movea.l    4(a7),a0
		bsr        Acfg_copyInfo
		lea.l      12(a7),a7
		rts

	.globl Acfg_clear
Acfg_clear:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		move.l     8(a7),(a7)
		movea.l    4(a7),a1
		movea.l    (a7),a0
		bsr        Acfg_copyInfo
		movea.l    (a7),a0
		jsr        Acfg_clearAllGroups
		movea.l    (a7),a0
		jsr        Acfg_clearHeader
		lea.l      12(a7),a7
		rts

	.globl Acfg_clearAllGroups
Acfg_clearAllGroups:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     12(a7),4(a7)
		move.l     4(a7),d0
		beq        Acfg_clearAllGroups_1
		movea.l    4(a7),a0
		move.w     20(a0),d0
		ble        Acfg_clearAllGroups_1
		movea.l    4(a7),a0
		move.l     22(a0),d0
		beq        Acfg_clearAllGroups_1
		clr.w      10(a7)
		bra        Acfg_clearAllGroups_2
Acfg_clearAllGroups_8:
		move.w     10(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    4(a7),a0
		movea.l    22(a0),a0
		move.l     0(a0,d0.l),(a7)
		move.l     (a7),d0
		beq        Acfg_clearAllGroups_3
		movea.l    (a7),a0
		move.w     4(a0),d0
		ble.w      Acfg_clearAllGroups_4
		movea.l    (a7),a0
		move.l     6(a0),d0
		beq.s      Acfg_clearAllGroups_4
		clr.w      8(a7)
		bra.s      Acfg_clearAllGroups_5
Acfg_clearAllGroups_7:
		move.w     8(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		movea.l    6(a0),a0
		move.l     0(a0,d0.l),d0
		beq.s      Acfg_clearAllGroups_6
		move.w     8(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		movea.l    6(a0),a0
		movea.l    0(a0,d0.l),a0
		move.b     (a0),d0
		beq.s      Acfg_clearAllGroups_6
		move.w     8(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		movea.l    6(a0),a0
		movea.l    0(a0,d0.l),a0
		jsr        Ast_delete
Acfg_clearAllGroups_6:
		addq.w     #1,8(a7)
Acfg_clearAllGroups_5:
		movea.l    (a7),a0
		move.w     8(a7),d0
		cmp.w      4(a0),d0
		blt.s      Acfg_clearAllGroups_7
		movea.l    (a7),a0
		movea.l    6(a0),a0
		jsr        Ax_free
		movea.l    (a7),a0
		clr.l      6(a0)
		movea.l    (a7),a0
		clr.w      4(a0)
Acfg_clearAllGroups_4:
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        Ast_delete
		moveq.l    #10,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		move.w     10(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    4(a7),a0
		movea.l    22(a0),a0
		clr.l      0(a0,d0.l)
Acfg_clearAllGroups_3:
		addq.w     #1,10(a7)
Acfg_clearAllGroups_2:
		movea.l    4(a7),a0
		move.w     10(a7),d0
		cmp.w      20(a0),d0
		blt        Acfg_clearAllGroups_8
		movea.l    4(a7),a0
		movea.l    22(a0),a0
		jsr        Ax_free
		movea.l    4(a7),a0
		clr.l      22(a0)
		movea.l    4(a7),a0
		clr.w      20(a0)
		movea.l    4(a7),a0
		move.w     #$0001,18(a0)
Acfg_clearAllGroups_1:
		lea.l      16(a7),a7
		rts

	.globl Acfg_clearGroup
Acfg_clearGroup:
		lea.l      -42(a7),a7
		move.l     a0,38(a7)
		move.l     a1,34(a7)
		move.l     38(a7),30(a7)
		clr.l      -(a7)
		movea.l    38(a7),a1
		lea.l      4(a7),a0
		jsr        InitCfgSearch
		addq.w     #4,a7
		lea.l      (a7),a1
		movea.l    30(a7),a0
		jsr        SearchGruppe
		move.l     a0,26(a7)
		move.l     26(a7),d0
		beq        Acfg_clearGroup_1
		clr.w      20(a7)
		bra.s      Acfg_clearGroup_2
Acfg_clearGroup_3:
		move.w     20(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    26(a7),a0
		movea.l    6(a0),a0
		movea.l    0(a0,d0.l),a0
		jsr        Ast_delete
		addq.w     #1,20(a7)
Acfg_clearGroup_2:
		movea.l    26(a7),a0
		move.w     20(a7),d0
		cmp.w      4(a0),d0
		blt.s      Acfg_clearGroup_3
		movea.l    26(a7),a0
		movea.l    6(a0),a0
		jsr        Ax_free
		movea.l    26(a7),a0
		movea.l    (a0),a0
		jsr        Ast_delete
		movea.l    30(a7),a0
		cmpi.w     #$0001,20(a0)
		ble        Acfg_clearGroup_4
		moveq.l    #-1,d0
		movea.l    30(a7),a0
		add.w      20(a0),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,22(a7)
		clr.w      d0
		move.w     d0,20(a7)
		move.w     d0,18(a7)
		bra.s      Acfg_clearGroup_5
Acfg_clearGroup_8:
		move.w     20(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    30(a7),a0
		movea.l    22(a0),a0
		movea.l    0(a0,d0.l),a0
		cmpa.l     26(a7),a0
		bne.s      Acfg_clearGroup_6
		addq.w     #1,20(a7)
		bra.s      Acfg_clearGroup_7
Acfg_clearGroup_6:
		move.w     20(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    30(a7),a0
		movea.l    22(a0),a0
		move.w     18(a7),d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    22(a7),a1
		move.l     0(a0,d0.l),0(a1,d1.l)
Acfg_clearGroup_7:
		addq.w     #1,20(a7)
		addq.w     #1,18(a7)
Acfg_clearGroup_5:
		movea.l    30(a7),a0
		move.w     20(a7),d0
		cmp.w      20(a0),d0
		blt.s      Acfg_clearGroup_8
		movea.l    30(a7),a0
		movea.l    22(a0),a0
		jsr        Ax_free
		movea.l    30(a7),a0
		move.l     22(a7),22(a0)
		movea.l    30(a7),a0
		subq.w     #1,20(a0)
		bra.s      Acfg_clearGroup_9
Acfg_clearGroup_4:
		movea.l    30(a7),a0
		movea.l    22(a0),a0
		jsr        Ax_free
		movea.l    30(a7),a0
		clr.l      22(a0)
		movea.l    30(a7),a0
		clr.w      20(a0)
Acfg_clearGroup_9:
		moveq.l    #10,d0
		movea.l    26(a7),a0
		jsr        Ax_recycle
Acfg_clearGroup_1:
		lea.l      42(a7),a7
		rts

Acfg_makeName:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.l     a1,6(a7)
		movea.l    6(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      Acfg_makeName_1
		clr.w      d0
		bra        Acfg_makeName_2
Acfg_makeName_1:
		movea.l    6(a7),a1
		movea.l    22(a7),a0
		jsr        Af_2name
		jsr        Ast_alltrim
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      Acfg_makeName_3
		clr.w      d0
		bra        Acfg_makeName_2
Acfg_makeName_3:
		movea.l    6(a7),a1
		lea.l      2(a7),a0
		jsr        Af_2ext
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      Acfg_makeName_4
		lea.l      xe058e,a1
		lea.l      2(a7),a0
		jsr        strcpy
Acfg_makeName_4:
		movea.l    6(a7),a0
		jsr        Af_2drv
		move.w     d0,(a7)
		movea.l    6(a7),a1
		movea.l    18(a7),a0
		jsr        Af_2path
		lea.l      xe0592,a1
		movea.l    18(a7),a0
		jsr        Ast_cmp
		tst.w      d0
		bne.s      Acfg_makeName_5
		moveq.l    #92,d0
		movea.l    6(a7),a0
		jsr        strrchr
		move.l     a0,d0
		bne.s      Acfg_makeName_5
		moveq.l    #58,d0
		movea.l    6(a7),a0
		jsr        strrchr
		move.l     a0,d0
		bne.s      Acfg_makeName_6
		movea.l    ACSblk,a1
		lea.l      726(a1),a1
		movea.l    18(a7),a0
		jsr        Af_2path
		movea.l    ACSblk,a0
		lea.l      726(a0),a0
		jsr        Af_2drv
		move.w     d0,(a7)
		bra.s      Acfg_makeName_5
Acfg_makeName_6:
		movea.l    18(a7),a0
		clr.b      (a0)
Acfg_makeName_5:
		move.l     #$00002000,d0
		jsr        Ax_malloc
		movea.l    10(a7),a1
		move.l     a0,(a1)
		movea.l    10(a7),a0
		move.l     (a0),d0
		bne.s      Acfg_makeName_7
		clr.w      d0
		bra.s      Acfg_makeName_2
Acfg_makeName_7:
		pea.l      2(a7)
		move.l     26(a7),-(a7)
		movea.l    26(a7),a1
		move.w     8(a7),d0
		movea.l    18(a7),a0
		movea.l    (a0),a0
		jsr        Af_buildname
		addq.w     #8,a7
		moveq.l    #1,d0
Acfg_makeName_2:
		lea.l      14(a7),a7
		rts

IsNewGroup:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		jsr        strlen
		move.l     d0,(a7)
		moveq.l    #2,d0
		cmp.l      (a7),d0
		bge.s      IsNewGroup_1
		movea.l    4(a7),a0
		cmpi.b     #$5B,(a0)
		bne.s      IsNewGroup_1
		move.l     (a7),d0
		movea.l    4(a7),a0
		cmpi.b     #$5D,-1(a0,d0.l)
		bne.s      IsNewGroup_1
		moveq.l    #1,d0
		bra.s      IsNewGroup_2
IsNewGroup_1:
		clr.w      d0
IsNewGroup_2:
		addq.w     #8,a7
		rts

FoundNextGroup:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.l     a1,2(a7)
		clr.w      d0
		movea.l    14(a7),a0
		move.w     d0,(a0)
		movea.l    2(a7),a0
		move.w     d0,(a0)
		clr.w      (a7)
		bra.s      FoundNextGroup_1
FoundNextGroup_4:
		movea.l    6(a7),a1
		move.w     #$2000,d0
		movea.l    22(a7),a0
		jsr        fgets
		move.l     a0,d0
		beq.s      FoundNextGroup_1
		movea.l    22(a7),a0
		jsr        Ast_alltrim
		movea.l    22(a7),a0
		bsr.w      IsNewGroup
		tst.w      d0
		beq.s      FoundNextGroup_2
		movea.l    22(a7),a1
		addq.w     #1,a1
		movea.l    18(a7),a0
		jsr        strcpy
		movea.l    18(a7),a0
		jsr        strlen
		subq.l     #1,d0
		movea.l    18(a7),a0
		clr.b      0(a0,d0.l)
		move.w     #$0001,(a7)
		bra.s      FoundNextGroup_1
FoundNextGroup_2:
		movea.l    2(a7),a0
		addq.w     #1,(a0)
		movea.l    22(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      FoundNextGroup_1
		movea.l    14(a7),a0
		addq.w     #1,(a0)
FoundNextGroup_1:
		movea.l    6(a7),a0
		jsr        feof
		tst.w      d0
		bne.s      FoundNextGroup_3
		move.w     (a7),d0
		beq        FoundNextGroup_4
FoundNextGroup_3:
		lea.l      10(a7),a7
		rts

ReadUntilNextGroup:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.l     a1,12(a7)
		move.w     d0,10(a7)
		move.w     d1,8(a7)
		move.w     10(a7),d0
		sub.w      8(a7),d0
		move.w     d0,4(a7)
		move.w     4(a7),d0
		ble.s      ReadUntilNextGroup_1
		move.w     4(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      ReadUntilNextGroup_2
		clr.w      d0
		bra        ReadUntilNextGroup_3
ReadUntilNextGroup_2:
		movea.l    12(a7),a0
		move.l     (a7),6(a0)
		movea.l    12(a7),a0
		move.w     4(a7),4(a0)
ReadUntilNextGroup_1:
		clr.w      6(a7)
		movea.l    16(a7),a1
		move.w     #$2000,d0
		movea.l    24(a7),a0
		jsr        fgets
		movea.l    24(a7),a0
		jsr        Ast_alltrim
		bra.s      ReadUntilNextGroup_4
ReadUntilNextGroup_8:
		movea.l    24(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      ReadUntilNextGroup_5
		move.w     6(a7),d0
		cmp.w      4(a7),d0
		bge.s      ReadUntilNextGroup_5
		movea.l    24(a7),a0
		jsr        Ast_create
		move.w     6(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a1
		move.l     a0,0(a1,d0.l)
		addq.w     #1,6(a7)
ReadUntilNextGroup_5:
		movea.l    24(a7),a0
		clr.b      (a0)
		movea.l    16(a7),a1
		move.w     #$2000,d0
		movea.l    24(a7),a0
		jsr        fgets
		movea.l    24(a7),a0
		jsr        Ast_alltrim
ReadUntilNextGroup_4:
		movea.l    16(a7),a0
		jsr        feof
		tst.w      d0
		beq.s      ReadUntilNextGroup_6
		movea.l    24(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      ReadUntilNextGroup_7
ReadUntilNextGroup_6:
		movea.l    24(a7),a0
		bsr        IsNewGroup
		tst.w      d0
		beq.w      ReadUntilNextGroup_8
ReadUntilNextGroup_7:
		move.w     6(a7),d0
		cmp.w      4(a7),d0
		nop
		moveq.l    #1,d0
ReadUntilNextGroup_3:
		lea.l      20(a7),a7
		rts

	.globl Acfg_load
Acfg_load:
		lea.l      -48(a7),a7
		move.l     a0,44(a7)
		move.l     a1,40(a7)
		move.l     44(a7),36(a7)
		move.l     40(a7),d0
		beq.s      Acfg_load_1
		movea.l    40(a7),a0
		bra.s      Acfg_load_2
Acfg_load_1:
		movea.l    36(a7),a0
		movea.l    (a0),a0
Acfg_load_2:
		move.l     a0,32(a7)
		movea.l    36(a7),a0
		bsr        Acfg_clearAllGroups
		movea.l    36(a7),a0
		jsr        Acfg_clearHeader
		movea.l    36(a7),a0
		clr.w      18(a0)
		move.l     #$00004004,d0
		jsr        Ax_malloc
		move.l     a0,12(a7)
		move.l     12(a7),d0
		bne.s      Acfg_load_3
		clr.w      d0
		bra        Acfg_load_4
Acfg_load_3:
		movea.l    12(a7),a0
		lea.l      8195(a0),a0
		move.l     a0,16(a7)
		move.l     16(a7),-(a7)
		move.l     16(a7),-(a7)
		movea.l    40(a7),a1
		lea.l      28(a7),a0
		bsr        Acfg_makeName
		addq.w     #8,a7
		tst.w      d0
		bne.s      Acfg_load_5
		movea.l    12(a7),a0
		jsr        Ax_free
		clr.w      d0
		bra        Acfg_load_4
Acfg_load_5:
		lea.l      xe0594,a1
		movea.l    20(a7),a0
		jsr        fopen
		move.l     a0,28(a7)
		move.l     28(a7),d0
		bne.s      Acfg_load_6
		movea.l    20(a7),a0
		jsr        Ax_free
		movea.l    12(a7),a0
		jsr        Ax_free
		clr.w      d0
		bra        Acfg_load_4
Acfg_load_6:
		movea.l    36(a7),a0
		move.w     16(a0),d0
		ble.s      Acfg_load_7
		movea.l    36(a7),a0
		move.w     16(a0),d1
		ext.l      d1
		moveq.l    #10,d0
		lsl.l      d0,d1
		clr.w      d0
		suba.l     a1,a1
		movea.l    28(a7),a0
		jsr        setvbuf
Acfg_load_7:
		move.w     #$0001,10(a7)
		clr.w      d1
		moveq.l    #0,d0
		movea.l    28(a7),a0
		jsr        fseek
		bra.s      Acfg_load_8
Acfg_load_9:
		movea.l    28(a7),a1
		move.w     #$2000,d0
		movea.l    12(a7),a0
		jsr        fgets
		move.l     a0,d0
		beq.s      Acfg_load_8
		movea.l    12(a7),a0
		jsr        Ast_alltrim
		bsr        IsNewGroup
		tst.w      d0
		beq.s      Acfg_load_8
		addq.w     #1,10(a7)
Acfg_load_8:
		movea.l    28(a7),a0
		jsr        feof
		tst.w      d0
		beq.s      Acfg_load_9
		move.w     10(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		movea.l    36(a7),a1
		move.l     a0,22(a1)
		movea.l    36(a7),a0
		move.l     22(a0),d0
		bne.s      Acfg_load_10
		movea.l    28(a7),a0
		jsr        fclose
		movea.l    20(a7),a0
		jsr        Ax_free
		movea.l    12(a7),a0
		jsr        Ax_free
		clr.w      d0
		bra        Acfg_load_4
Acfg_load_10:
		movea.l    36(a7),a0
		move.w     10(a7),20(a0)
		move.w     10(a7),d1
		ext.l      d1
		lsl.l      #2,d1
		clr.w      d0
		movea.l    36(a7),a0
		movea.l    22(a0),a0
		jsr        memset
		movea.l    16(a7),a0
		clr.b      (a0)
		clr.w      d1
		moveq.l    #0,d0
		movea.l    28(a7),a0
		jsr        fseek
		clr.w      4(a7)
		bra        Acfg_load_11
Acfg_load_14:
		moveq.l    #10,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Acfg_load_12
		movea.l    28(a7),a0
		jsr        fclose
		movea.l    36(a7),a0
		bsr        Acfg_clearAllGroups
		movea.l    20(a7),a0
		jsr        Ax_free
		movea.l    12(a7),a0
		jsr        Ax_free
		movea.l    36(a7),a0
		clr.w      18(a0)
		clr.w      d0
		bra        Acfg_load_4
Acfg_load_12:
		moveq.l    #10,d1
		clr.w      d0
		movea.l    (a7),a0
		jsr        memset
		clr.l      -(a7)
		lea.l      xe0596,a1
		move.l     a1,-(a7)
		movea.l    24(a7),a0
		jsr        Ast_create
		jsr        Ast_alltrim
		movea.l    (a7)+,a1
		jsr        Ast_filter
		addq.w     #4,a7
		movea.l    (a7),a1
		move.l     a0,(a1)
		move.w     4(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    36(a7),a0
		movea.l    22(a0),a0
		move.l     (a7),0(a0,d0.l)
		movea.l    28(a7),a0
		jsr        ftell
		move.l     d0,24(a7)
		move.l     12(a7),-(a7)
		move.l     20(a7),-(a7)
		pea.l      14(a7)
		lea.l      20(a7),a1
		movea.l    40(a7),a0
		bsr        FoundNextGroup
		lea.l      12(a7),a7
		clr.w      d1
		move.l     24(a7),d0
		movea.l    28(a7),a0
		jsr        fseek
		move.l     12(a7),-(a7)
		move.w     10(a7),d1
		move.w     12(a7),d0
		movea.l    4(a7),a1
		movea.l    32(a7),a0
		bsr        ReadUntilNextGroup
		addq.w     #4,a7
		tst.w      d0
		bne.s      Acfg_load_13
		movea.l    28(a7),a0
		jsr        fclose
		movea.l    36(a7),a0
		bsr        Acfg_clearAllGroups
		movea.l    20(a7),a0
		jsr        Ax_free
		movea.l    12(a7),a0
		jsr        Ax_free
		movea.l    36(a7),a0
		clr.w      18(a0)
Acfg_load_13:
		addq.w     #1,4(a7)
Acfg_load_11:
		move.w     4(a7),d0
		cmp.w      10(a7),d0
		blt        Acfg_load_14
		movea.l    36(a7),a0
		movea.l    (a0),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      Acfg_load_15
		movea.l    36(a7),a0
		movea.l    (a0),a0
		jsr        Ast_delete
Acfg_load_15:
		movea.l    20(a7),a0
		jsr        Ast_create
		movea.l    36(a7),a1
		move.l     a0,(a1)
		movea.l    28(a7),a0
		jsr        fclose
		movea.l    20(a7),a0
		jsr        Ax_free
		movea.l    12(a7),a0
		jsr        Ax_free
		moveq.l    #1,d0
Acfg_load_4:
		lea.l      48(a7),a7
		rts

WriteString:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.l     a1,2(a7)
		movea.l    14(a7),a0
		move.w     (a0),d0
		bne        WriteString_1
		movea.l    22(a7),a0
		jsr        Ast_alltrim
		move.b     (a0),d0
		ext.w      d0
		movea.l    2(a7),a0
		movea.l    4(a0),a0
		jsr        strchr
		move.l     a0,d0
		bne.s      WriteString_2
		clr.w      (a7)
		bra.s      WriteString_3
WriteString_4:
		move.w     (a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    2(a7),a0
		movea.l    30(a0),a0
		move.l     0(a0,d0.l),-(a7)
		movea.l    6(a7),a0
		movea.l    4(a0),a0
		move.b     (a0),d0
		ext.w      d0
		move.w     d0,-(a7)
		lea.l      xe0599,a1
		movea.l    12(a7),a0
		jsr        fprintf
		addq.w     #6,a7
		addq.w     #1,(a7)
WriteString_3:
		movea.l    2(a7),a0
		move.w     (a7),d0
		cmp.w      28(a0),d0
		blt.s      WriteString_4
		movea.l    2(a7),a0
		movea.l    4(a0),a0
		move.b     (a0),d0
		ext.w      d0
		move.w     d0,-(a7)
		lea.l      xe05a0,a1
		movea.l    8(a7),a0
		jsr        fprintf
		addq.w     #2,a7
WriteString_2:
		movea.l    14(a7),a0
		move.w     #$0001,(a0)
WriteString_1:
		move.l     22(a7),-(a7)
		movea.l    22(a7),a1
		movea.l    10(a7),a0
		jsr        fprintf
		addq.w     #4,a7
		lea.l      10(a7),a7
		rts

	.globl Acfg_save
Acfg_save:
		lea.l      -46(a7),a7
		move.l     a0,42(a7)
		move.l     a1,38(a7)
		move.l     42(a7),34(a7)
		movea.l    38(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      Acfg_save_1
		movea.l    38(a7),a0
		bra.s      Acfg_save_2
Acfg_save_1:
		movea.l    34(a7),a0
		movea.l    (a0),a0
Acfg_save_2:
		move.l     a0,30(a7)
		move.l     #$00004004,d0
		jsr        Ax_malloc
		move.l     a0,18(a7)
		move.l     18(a7),d0
		bne.s      Acfg_save_3
		clr.w      d0
		bra        Acfg_save_4
Acfg_save_3:
		movea.l    18(a7),a0
		lea.l      8195(a0),a0
		move.l     a0,14(a7)
		move.l     14(a7),-(a7)
		move.l     22(a7),-(a7)
		movea.l    38(a7),a1
		lea.l      30(a7),a0
		bsr        Acfg_makeName
		addq.w     #8,a7
		tst.w      d0
		bne.s      Acfg_save_5
		movea.l    22(a7),a0
		jsr        Ax_free
		movea.l    18(a7),a0
		jsr        Ax_free
		clr.w      d0
		bra        Acfg_save_4
Acfg_save_5:
		lea.l      xe05a4,a1
		movea.l    22(a7),a0
		jsr        fopen
		move.l     a0,26(a7)
		move.l     26(a7),d0
		bne.s      Acfg_save_6
		movea.l    22(a7),a0
		jsr        Ax_free
		movea.l    18(a7),a0
		jsr        Ax_free
		clr.w      d0
		bra        Acfg_save_4
Acfg_save_6:
		movea.l    34(a7),a0
		move.w     16(a0),d0
		ble.s      Acfg_save_7
		movea.l    34(a7),a0
		move.w     16(a0),d1
		ext.l      d1
		moveq.l    #10,d0
		lsl.l      d0,d1
		clr.w      d0
		suba.l     a1,a1
		movea.l    26(a7),a0
		jsr        setvbuf
Acfg_save_7:
		movea.l    34(a7),a0
		cmpi.w     #$0001,28(a0)
		blt.s      Acfg_save_8
		movea.l    34(a7),a0
		move.l     30(a0),d0
		bne.s      Acfg_save_9
Acfg_save_8:
		moveq.l    #1,d0
		bra.s      Acfg_save_10
Acfg_save_9:
		clr.w      d0
Acfg_save_10:
		move.w     d0,(a7)
		clr.w      4(a7)
		bra        Acfg_save_11
Acfg_save_17:
		move.w     4(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    34(a7),a0
		movea.l    22(a0),a0
		move.l     0(a0,d0.l),10(a7)
		movea.l    10(a7),a0
		movea.l    (a0),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      Acfg_save_12
		movea.l    10(a7),a0
		move.l     (a0),-(a7)
		pea.l      xe05a6
		pea.l      8(a7)
		movea.l    46(a7),a1
		movea.l    38(a7),a0
		bsr        WriteString
		lea.l      12(a7),a7
Acfg_save_12:
		clr.w      2(a7)
		movea.l    10(a7),a0
		move.l     6(a0),6(a7)
		bra.s      Acfg_save_13
Acfg_save_14:
		movea.l    6(a7),a0
		move.l     (a0),-(a7)
		pea.l      xe05ac
		pea.l      8(a7)
		movea.l    46(a7),a1
		movea.l    38(a7),a0
		bsr        WriteString
		lea.l      12(a7),a7
		addq.w     #1,2(a7)
		addq.l     #4,6(a7)
Acfg_save_13:
		movea.l    10(a7),a0
		move.w     2(a7),d0
		cmp.w      4(a0),d0
		blt.s      Acfg_save_14
		movea.l    10(a7),a0
		movea.l    (a0),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      Acfg_save_15
		movea.l    10(a7),a0
		move.w     4(a0),d0
		ble.s      Acfg_save_16
Acfg_save_15:
		lea.l      xe05b0,a1
		movea.l    26(a7),a0
		jsr        fprintf
Acfg_save_16:
		addq.w     #1,4(a7)
Acfg_save_11:
		movea.l    34(a7),a0
		move.w     4(a7),d0
		cmp.w      20(a0),d0
		blt        Acfg_save_17
		move.w     (a7),d0
		bne.s      Acfg_save_18
		pea.l      xe05b4
		pea.l      xe05b2
		pea.l      8(a7)
		movea.l    46(a7),a1
		movea.l    38(a7),a0
		bsr        WriteString
		lea.l      12(a7),a7
Acfg_save_18:
		movea.l    26(a7),a0
		jsr        fclose
		movea.l    34(a7),a0
		clr.w      18(a0)
		movea.l    22(a7),a0
		jsr        Ax_free
		movea.l    18(a7),a0
		jsr        Ax_free
		moveq.l    #1,d0
Acfg_save_4:
		lea.l      46(a7),a7
		rts

	.globl Acfg_getValue
Acfg_getValue:
		lea.l      -40(a7),a7
		move.l     a0,36(a7)
		move.l     a1,32(a7)
		move.l     36(a7),28(a7)
		clr.w      26(a7)
		movea.l    48(a7),a0
		clr.b      (a0)
		move.l     44(a7),-(a7)
		movea.l    36(a7),a1
		lea.l      4(a7),a0
		jsr        InitCfgSearch
		addq.w     #4,a7
		lea.l      (a7),a1
		movea.l    28(a7),a0
		jsr        SearchCfgString
		move.l     4(a7),d0
		beq.s      Acfg_getValue_1
		move.w     16(a7),d0
		bmi.s      Acfg_getValue_1
		move.l     12(a7),d0
		beq.s      Acfg_getValue_1
		move.l     12(a7),d0
		beq.s      Acfg_getValue_2
		moveq.l    #1,d0
		bra.s      Acfg_getValue_3
Acfg_getValue_2:
		clr.w      d0
Acfg_getValue_3:
		move.w     d0,26(a7)
Acfg_getValue_1:
		move.w     26(a7),d0
		bne        Acfg_getValue_4
		movea.l    28(a7),a0
		move.l     8(a0),d0
		beq        Acfg_getValue_4
		movea.l    28(a7),a0
		movea.l    8(a0),a0
		jsr        strlen
		move.l     d0,-(a7)
		movea.l    4(a7),a0
		jsr        strlen
		add.l      (a7)+,d0
		move.l     d0,-(a7)
		movea.l    12(a7),a0
		jsr        strlen
		add.l      (a7)+,d0
		move.l     d0,18(a7)
		move.l     18(a7),d0
		ble.s      Acfg_getValue_4
		moveq.l    #1,d0
		add.l      18(a7),d0
		jsr        Ax_malloc
		move.l     a0,22(a7)
		move.l     22(a7),d0
		beq.s      Acfg_getValue_4
		move.l     8(a7),-(a7)
		move.l     4(a7),-(a7)
		movea.l    36(a7),a0
		move.l     8(a0),-(a7)
		movea.l    34(a7),a0
		moveq.l    #3,d0
		jsr        Ast_add
		lea.l      12(a7),a7
		movea.l    8(a7),a0
		jsr        Ast_delete
		move.l     22(a7),8(a7)
		movea.l    ACSblk,a0
		move.l     652(a0),-(a7)
		moveq.l    #-1,d0
		lea.l      4(a7),a1
		movea.l    32(a7),a0
		jsr        SearchCfgNameInStrings
		addq.w     #4,a7
		move.l     12(a7),d0
		beq.s      Acfg_getValue_5
		moveq.l    #1,d0
		bra.s      Acfg_getValue_6
Acfg_getValue_5:
		clr.w      d0
Acfg_getValue_6:
		move.w     d0,26(a7)
Acfg_getValue_4:
		move.w     26(a7),d0
		beq.s      Acfg_getValue_7
		movea.l    12(a7),a1
		movea.l    48(a7),a0
		jsr        strcpy
		jsr        Ast_alltrim
Acfg_getValue_7:
		movea.l    (a7),a0
		jsr        Ast_delete
		movea.l    8(a7),a0
		jsr        Ast_delete
		movea.l    48(a7),a0
		lea.l      40(a7),a7
		rts

	.globl Acfg_setValue
Acfg_setValue:
		lea.l      -42(a7),a7
		move.l     a0,36(a7)
		move.l     a1,32(a7)
		move.l     36(a7),28(a7)
		clr.w      (a7)
		move.l     46(a7),-(a7)
		movea.l    36(a7),a1
		lea.l      14(a7),a0
		jsr        InitCfgSearch
		addq.w     #4,a7
		lea.l      10(a7),a1
		movea.l    28(a7),a0
		jsr        SearchCfgString
		move.l     14(a7),d0
		bne.s      Acfg_setValue_1
		movea.l    10(a7),a1
		movea.l    28(a7),a0
		jsr        CreateCfgGruppe
		move.l     a0,14(a7)
Acfg_setValue_1:
		move.l     14(a7),d0
		beq        Acfg_setValue_2
		movea.l    18(a7),a0
		jsr        strlen
		move.l     d0,-(a7)
		movea.l    54(a7),a0
		jsr        strlen
		add.l      (a7)+,d0
		addq.l     #2,d0
		move.l     d0,2(a7)
		move.l     2(a7),d0
		jsr        Ax_malloc
		move.l     a0,6(a7)
		move.l     50(a7),-(a7)
		pea.l      xe05b7
		move.l     26(a7),-(a7)
		movea.l    18(a7),a0
		moveq.l    #3,d0
		jsr        Ast_add
		lea.l      12(a7),a7
		move.w     26(a7),d0
		bmi.s      Acfg_setValue_3
		move.l     22(a7),d0
		bne.s      Acfg_setValue_4
Acfg_setValue_3:
		movea.l    6(a7),a1
		movea.l    14(a7),a0
		jsr        CreateCfgString
		move.w     d0,(a7)
		movea.l    28(a7),a0
		move.w     #$0001,18(a0)
		bra        Acfg_setValue_2
Acfg_setValue_4:
		movea.l    28(a7),a0
		move.w     12(a0),d0
		beq.s      Acfg_setValue_5
		move.w     26(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    14(a7),a0
		movea.l    6(a0),a0
		movea.l    0(a0,d0.l),a1
		movea.l    6(a7),a0
		jsr        Ast_cmp
		tst.w      d0
		bne.s      Acfg_setValue_6
		moveq.l    #1,d0
		bra.s      Acfg_setValue_7
Acfg_setValue_6:
		clr.w      d0
Acfg_setValue_7:
		move.w     d0,40(a7)
		bra.s      Acfg_setValue_8
Acfg_setValue_5:
		move.w     26(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    14(a7),a0
		movea.l    6(a0),a0
		movea.l    0(a0,d0.l),a1
		movea.l    6(a7),a0
		jsr        Ast_icmp
		tst.w      d0
		bne.s      Acfg_setValue_9
		moveq.l    #1,d0
		bra.s      Acfg_setValue_10
Acfg_setValue_9:
		clr.w      d0
Acfg_setValue_10:
		move.w     d0,40(a7)
Acfg_setValue_8:
		move.w     40(a7),d0
		bne.s      Acfg_setValue_2
		move.w     26(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    14(a7),a0
		movea.l    6(a0),a0
		movea.l    0(a0,d0.l),a0
		jsr        Ast_delete
		move.w     26(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    14(a7),a0
		movea.l    6(a0),a0
		move.l     6(a7),0(a0,d0.l)
		move.w     #$0001,(a7)
		movea.l    28(a7),a0
		move.w     #$0001,18(a0)
Acfg_setValue_2:
		movea.l    10(a7),a0
		jsr        Ast_delete
		movea.l    18(a7),a0
		jsr        Ast_delete
		move.w     (a7),d0
		beq.s      Acfg_setValue_11
		movea.l    50(a7),a0
		bra.s      Acfg_setValue_12
Acfg_setValue_11:
		lea.l      xe05b9,a0
Acfg_setValue_12:
		lea.l      42(a7),a7
		rts

	.globl Acfg_clearValue
Acfg_clearValue:
		lea.l      -32(a7),a7
		move.l     a0,28(a7)
		move.l     a1,24(a7)
		move.l     28(a7),20(a7)
		clr.w      (a7)
		movea.l    40(a7),a0
		clr.b      (a0)
		move.l     36(a7),-(a7)
		movea.l    28(a7),a1
		lea.l      6(a7),a0
		jsr        InitCfgSearch
		addq.w     #4,a7
		lea.l      2(a7),a1
		movea.l    20(a7),a0
		jsr        SearchCfgString
		move.l     6(a7),d0
		beq.s      Acfg_clearValue_1
		move.w     18(a7),d0
		bmi.s      Acfg_clearValue_1
		move.l     14(a7),d0
		beq.s      Acfg_clearValue_1
		movea.l    14(a7),a1
		movea.l    40(a7),a0
		jsr        strcpy
		jsr        Ast_alltrim
		move.w     18(a7),d0
		movea.l    6(a7),a0
		jsr        DeleteCfgString
		move.w     d0,(a7)
Acfg_clearValue_1:
		movea.l    2(a7),a0
		jsr        Ast_delete
		movea.l    10(a7),a0
		jsr        Ast_delete
		move.w     (a7),d0
		beq.s      Acfg_clearValue_2
		movea.l    40(a7),a0
		bra.s      Acfg_clearValue_3
Acfg_clearValue_2:
		lea.l      xe05ba,a0
Acfg_clearValue_3:
		lea.l      32(a7),a7
		rts

	.globl Acfg_getString
Acfg_getString:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		pea.l      s_val
		move.l     16(a7),-(a7)
		movea.l    8(a7),a1
		movea.l    12(a7),a0
		bsr        Acfg_getValue
		addq.w     #8,a7
		addq.w     #8,a7
		rts

	.globl Acfg_getLong
Acfg_getLong:
		lea.l      -8200(a7),a7
		move.l     a0,8196(a7)
		move.l     a1,8192(a7)
		pea.l      (a7)
		move.l     8208(a7),-(a7)
		movea.l    8200(a7),a1
		movea.l    8204(a7),a0
		bsr        Acfg_getValue
		addq.w     #8,a7
		jsr        atol
		lea.l      8200(a7),a7
		rts

	.globl Acfg_setLong
Acfg_setLong:
		lea.l      -34(a7),a7
		move.l     a0,30(a7)
		move.l     a1,26(a7)
		move.l     d0,22(a7)
		move.l     22(a7),-(a7)
		lea.l      xe05bb,a1
		lea.l      4(a7),a0
		jsr        sprintf
		addq.w     #4,a7
		pea.l      (a7)
		move.l     42(a7),-(a7)
		movea.l    34(a7),a1
		movea.l    38(a7),a0
		bsr        Acfg_setValue
		addq.w     #8,a7
		jsr        atol
		lea.l      34(a7),a7
		rts

	.globl Acfg_getChar
Acfg_getChar:
		lea.l      -60(a7),a7
		move.l     a0,56(a7)
		move.l     a1,52(a7)
		pea.l      (a7)
		move.l     68(a7),-(a7)
		movea.l    60(a7),a1
		movea.l    64(a7),a0
		bsr        Acfg_getValue
		addq.w     #8,a7
		move.b     (a0),d0
		lea.l      60(a7),a7
		rts

	.globl Acfg_setChar
Acfg_setChar:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		move.b     d0,2(a7)
		move.b     2(a7),(a7)
		clr.b      1(a7)
		pea.l      (a7)
		move.l     20(a7),-(a7)
		movea.l    12(a7),a1
		movea.l    16(a7),a0
		bsr        Acfg_setValue
		addq.w     #8,a7
		move.b     (a0),d0
		lea.l      12(a7),a7
		rts

	.globl Acfg_getBool
Acfg_getBool:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     a1,10(a7)
		lea.l      xe05bf,a1
		move.l     a1,-(a7)
		pea.l      4(a7)
		move.l     30(a7),-(a7)
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        Acfg_getValue
		addq.w     #8,a7
		movea.l    (a7)+,a1
		jsr        Ast_icmp
		tst.w      d0
		bne.s      Acfg_getBool_1
		moveq.l    #1,d0
		bra.s      Acfg_getBool_2
Acfg_getBool_1:
		clr.w      d0
Acfg_getBool_2:
		lea.l      18(a7),a7
		rts

	.globl Acfg_setBool
Acfg_setBool:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.l     a1,2(a7)
		move.w     d0,(a7)
		lea.l      xe05cf,a1
		move.l     a1,-(a7)
		move.w     4(a7),d0
		beq.s      Acfg_setBool_1
		lea.l      xe05c4,a0
		bra.s      Acfg_setBool_2
Acfg_setBool_1:
		lea.l      xe05c9,a0
Acfg_setBool_2:
		move.l     a0,-(a7)
		move.l     22(a7),-(a7)
		movea.l    14(a7),a1
		movea.l    18(a7),a0
		bsr        Acfg_setValue
		addq.w     #8,a7
		movea.l    (a7)+,a1
		jsr        Ast_icmp
		tst.w      d0
		bne.s      Acfg_setBool_3
		moveq.l    #1,d0
		bra.s      Acfg_setBool_4
Acfg_setBool_3:
		clr.w      d0
Acfg_setBool_4:
		lea.l      10(a7),a7
		rts

	.globl Acfg_isChanged
Acfg_isChanged:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.w     18(a0),d0
		addq.w     #4,a7
		rts

	.globl Acfg_grpAnzahl
Acfg_grpAnzahl:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.w     20(a0),d0
		addq.w     #4,a7
		rts

	.globl Acfg_grpName
Acfg_grpName:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.w     d0,8(a7)
		move.l     a1,4(a7)
		move.l     10(a7),(a7)
		move.w     8(a7),d0
		bmi.s      Acfg_grpName_1
		movea.l    (a7),a0
		move.w     8(a7),d0
		cmp.w      20(a0),d0
		bge.s      Acfg_grpName_1
		move.w     8(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		movea.l    22(a0),a0
		movea.l    0(a0,d0.l),a0
		movea.l    (a0),a1
		movea.l    4(a7),a0
		jsr        strcpy
		bra.s      Acfg_grpName_2
Acfg_grpName_1:
		suba.l     a0,a0
Acfg_grpName_2:
		lea.l      14(a7),a7
		rts

	.globl Acfg_strAnzahl
Acfg_strAnzahl:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.l     6(a7),(a7)
		move.w     4(a7),d0
		bmi.s      Acfg_strAnzahl_1
		movea.l    (a7),a0
		move.w     4(a7),d0
		cmp.w      20(a0),d0
		bge.s      Acfg_strAnzahl_1
		move.w     4(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		movea.l    22(a0),a0
		movea.l    0(a0,d0.l),a0
		move.w     4(a0),d0
		bra.s      Acfg_strAnzahl_2
Acfg_strAnzahl_1:
		clr.w      d0
Acfg_strAnzahl_2:
		lea.l      10(a7),a7
		rts

	.globl Acfg_isGroupPresent
Acfg_isGroupPresent:
		lea.l      -30(a7),a7
		move.l     a0,26(a7)
		move.l     a1,22(a7)
		move.l     26(a7),18(a7)
		pea.l      xe05d4
		movea.l    26(a7),a1
		lea.l      4(a7),a0
		jsr        InitCfgSearch
		addq.w     #4,a7
		lea.l      (a7),a1
		movea.l    18(a7),a0
		jsr        SearchGruppe
		move.l     a0,d0
		bne.s      Acfg_isGroupPresent_1
		clr.w      d0
		bra.s      Acfg_isGroupPresent_2
Acfg_isGroupPresent_1:
		moveq.l    #1,d0
Acfg_isGroupPresent_2:
		lea.l      30(a7),a7
		rts

	.globl Acfg_isStringPresent
Acfg_isStringPresent:
		lea.l      -30(a7),a7
		move.l     a0,26(a7)
		move.l     a1,22(a7)
		move.l     26(a7),18(a7)
		move.l     34(a7),-(a7)
		movea.l    26(a7),a1
		lea.l      4(a7),a0
		jsr        InitCfgSearch
		addq.w     #4,a7
		lea.l      (a7),a1
		movea.l    18(a7),a0
		jsr        SearchCfgString
		cmpi.w     #$FFFF,16(a7)
		bne.s      Acfg_isStringPresent_1
		clr.w      d0
		bra.s      Acfg_isStringPresent_2
Acfg_isStringPresent_1:
		moveq.l    #1,d0
Acfg_isStringPresent_2:
		lea.l      30(a7),a7
		rts

	.globl Acfg_strName
Acfg_strName:
		lea.l      -28(a7),a7
		move.l     a0,24(a7)
		move.w     d0,22(a7)
		move.w     d1,20(a7)
		move.l     a1,16(a7)
		move.l     24(a7),12(a7)
		movea.l    16(a7),a0
		clr.b      (a0)
		move.w     22(a7),d0
		bmi        Acfg_strName_1
		movea.l    12(a7),a0
		move.w     22(a7),d0
		cmp.w      20(a0),d0
		bge        Acfg_strName_1
		move.w     22(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    12(a7),a0
		movea.l    22(a0),a0
		move.l     0(a0,d0.l),8(a7)
		move.w     20(a7),d0
		bmi.s      Acfg_strName_1
		movea.l    8(a7),a0
		move.w     20(a7),d0
		cmp.w      4(a0),d0
		bge.s      Acfg_strName_1
		move.w     20(a7),d1
		move.w     22(a7),d0
		movea.l    24(a7),a0
		jsr        Acfg_strIsComment
		tst.w      d0
		bne.s      Acfg_strName_1
		move.w     20(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		movea.l    6(a0),a0
		move.l     0(a0,d0.l),(a7)
		moveq.l    #61,d0
		movea.l    (a7),a0
		jsr        strchr
		move.l     a0,4(a7)
		move.l     4(a7),d0
		beq.s      Acfg_strName_1
		move.l     4(a7),d0
		sub.l      (a7),d0
		movea.l    (a7),a1
		movea.l    16(a7),a0
		jsr        strncpy
		movea.l    4(a7),a0
		suba.l     (a7),a0
		movea.l    16(a7),a1
		clr.b      0(a1,a0.l)
Acfg_strName_1:
		movea.l    16(a7),a0
		lea.l      28(a7),a7
		rts

	.globl Acfg_strValue
Acfg_strValue:
		lea.l      -28(a7),a7
		move.l     a0,24(a7)
		move.w     d0,22(a7)
		move.w     d1,20(a7)
		move.l     a1,16(a7)
		move.l     24(a7),12(a7)
		movea.l    16(a7),a0
		clr.b      (a0)
		move.w     22(a7),d0
		bmi        Acfg_strValue_1
		movea.l    12(a7),a0
		move.w     22(a7),d0
		cmp.w      20(a0),d0
		bge        Acfg_strValue_1
		move.w     22(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    12(a7),a0
		movea.l    22(a0),a0
		move.l     0(a0,d0.l),8(a7)
		move.w     20(a7),d0
		bmi        Acfg_strValue_1
		movea.l    8(a7),a0
		move.w     20(a7),d0
		cmp.w      4(a0),d0
		bge.w      Acfg_strValue_1
		move.w     20(a7),d1
		move.w     22(a7),d0
		movea.l    24(a7),a0
		jsr        Acfg_strIsComment
		tst.w      d0
		beq.s      Acfg_strValue_2
		move.w     20(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		movea.l    6(a0),a0
		movea.l    0(a0,d0.l),a1
		movea.l    16(a7),a0
		jsr        strcpy
		movea.l    16(a7),a0
		jsr        Ast_alltrim
		bra.s      Acfg_strValue_1
Acfg_strValue_2:
		move.w     20(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		movea.l    6(a0),a0
		move.l     0(a0,d0.l),(a7)
		moveq.l    #61,d0
		movea.l    (a7),a0
		jsr        strchr
		move.l     a0,4(a7)
		move.l     4(a7),d0
		beq.s      Acfg_strValue_1
		addq.l     #1,4(a7)
		movea.l    4(a7),a1
		movea.l    16(a7),a0
		jsr        strcpy
Acfg_strValue_1:
		movea.l    16(a7),a0
		lea.l      28(a7),a7
		rts

	.globl Acfg_strIsComment
Acfg_strIsComment:
		lea.l      -22(a7),a7
		move.l     a0,18(a7)
		move.w     d0,16(a7)
		move.w     d1,14(a7)
		move.l     18(a7),10(a7)
		clr.w      (a7)
		move.w     16(a7),d0
		bmi        Acfg_strIsComment_1
		movea.l    10(a7),a0
		move.w     16(a7),d0
		cmp.w      20(a0),d0
		bge        Acfg_strIsComment_1
		move.w     16(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    10(a7),a0
		movea.l    22(a0),a0
		move.l     0(a0,d0.l),6(a7)
		move.w     14(a7),d0
		bmi.s      Acfg_strIsComment_1
		movea.l    6(a7),a0
		move.w     14(a7),d0
		cmp.w      4(a0),d0
		bge.s      Acfg_strIsComment_1
		move.w     14(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    6(a7),a0
		movea.l    6(a0),a0
		move.l     0(a0,d0.l),2(a7)
		bra.s      Acfg_strIsComment_2
Acfg_strIsComment_4:
		addq.l     #1,2(a7)
Acfg_strIsComment_2:
		movea.l    2(a7),a0
		move.b     (a0),d0
		beq.s      Acfg_strIsComment_3
		movea.l    2(a7),a0
		move.b     (a0),d0
		jsr        Ach_isWhite
		tst.w      d0
		bne.s      Acfg_strIsComment_4
Acfg_strIsComment_3:
		movea.l    2(a7),a0
		move.b     (a0),d0
		beq.s      Acfg_strIsComment_1
		movea.l    2(a7),a0
		move.b     (a0),d0
		ext.w      d0
		movea.l    10(a7),a0
		movea.l    4(a0),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Acfg_strIsComment_1
		move.w     #$0001,(a7)
Acfg_strIsComment_1:
		move.w     (a7),d0
		lea.l      22(a7),a7
		rts

	.globl Acfg_clearHeader
Acfg_clearHeader:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.l     6(a7),2(a7)
		clr.w      (a7)
		bra.s      Acfg_clearHeader_1
Acfg_clearHeader_2:
		move.w     (a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    2(a7),a0
		movea.l    30(a0),a0
		movea.l    0(a0,d0.l),a0
		jsr        Ast_delete
		addq.w     #1,(a7)
Acfg_clearHeader_1:
		movea.l    2(a7),a0
		move.w     (a7),d0
		cmp.w      28(a0),d0
		blt.s      Acfg_clearHeader_2
		movea.l    2(a7),a0
		movea.l    30(a0),a0
		jsr        Ax_free
		movea.l    2(a7),a0
		clr.l      30(a0)
		movea.l    2(a7),a0
		clr.w      28(a0)
		lea.l      10(a7),a7
		rts

	.globl Acfg_headAnzahl
Acfg_headAnzahl:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.w     28(a0),d0
		addq.w     #4,a7
		rts

	.globl Acfg_setHeader
Acfg_setHeader:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.w     d0,14(a7)
		move.l     a1,10(a7)
		move.l     16(a7),6(a7)
		movea.l    16(a7),a0
		bsr        Acfg_clearHeader
		move.w     14(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Acfg_setHeader_1
		suba.l     a0,a0
		bra.s      Acfg_setHeader_2
Acfg_setHeader_1:
		move.w     14(a7),d1
		ext.l      d1
		lsl.l      #2,d1
		clr.w      d0
		movea.l    (a7),a0
		jsr        memset
		movea.l    6(a7),a0
		move.w     14(a7),28(a0)
		movea.l    6(a7),a0
		move.l     (a7),30(a0)
		clr.w      4(a7)
		bra.s      Acfg_setHeader_3
Acfg_setHeader_4:
		move.w     4(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    10(a7),a0
		movea.l    0(a0,d0.l),a0
		jsr        Ast_create
		jsr        Ast_alltrim
		move.w     4(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a1
		move.l     a0,0(a1,d0.l)
		addq.w     #1,4(a7)
Acfg_setHeader_3:
		move.w     4(a7),d0
		cmp.w      14(a7),d0
		blt.s      Acfg_setHeader_4
		movea.l    10(a7),a0
Acfg_setHeader_2:
		lea.l      20(a7),a7
		rts

	.globl Acfg_getHeader
Acfg_getHeader:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.l     a1,6(a7)
		move.l     10(a7),2(a7)
		clr.w      (a7)
		bra.s      Acfg_getHeader_1
Acfg_getHeader_2:
		move.w     (a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    2(a7),a0
		movea.l    30(a0),a0
		movea.l    0(a0,d0.l),a0
		jsr        Ast_create
		jsr        Ast_alltrim
		move.w     (a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    6(a7),a1
		move.l     a0,0(a1,d0.l)
		addq.w     #1,(a7)
Acfg_getHeader_1:
		movea.l    2(a7),a0
		move.w     (a7),d0
		cmp.w      28(a0),d0
		blt.s      Acfg_getHeader_2
		movea.l    6(a7),a0
		lea.l      14(a7),a7
		rts

	.globl Acfg_isCfgfile
Acfg_isCfgfile:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		move.l     8(a7),(a7)
		movea.l    (a7),a0
		move.w     14(a0),d0
		beq.s      Acfg_isCfgfile_1
		movea.l    4(a7),a1
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        Ast_cmp
		bra.s      Acfg_isCfgfile_2
		bra.s      Acfg_isCfgfile_2
Acfg_isCfgfile_1:
		movea.l    4(a7),a1
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        Ast_icmp
		nop
Acfg_isCfgfile_2:
		lea.l      12(a7),a7
		rts

InitCfgSearch:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		clr.l      -(a7)
		lea.l      xe05d5,a1
		move.l     a1,-(a7)
		movea.l    8(a7),a0
		jsr        Ast_create
		jsr        Ast_alltrim
		movea.l    (a7)+,a1
		jsr        Ast_filter
		addq.w     #4,a7
		movea.l    4(a7),a1
		move.l     a0,(a1)
		movea.l    4(a7),a0
		clr.l      4(a0)
		clr.l      -(a7)
		lea.l      xe05d8,a1
		move.l     a1,-(a7)
		movea.l    20(a7),a0
		jsr        Ast_create
		jsr        Ast_alltrim
		movea.l    (a7)+,a1
		jsr        Ast_filter
		addq.w     #4,a7
		movea.l    4(a7),a1
		move.l     a0,8(a1)
		movea.l    4(a7),a0
		clr.l      12(a0)
		movea.l    4(a7),a0
		move.w     #$FFFF,16(a0)
		movea.l    4(a7),a0
		addq.w     #8,a7
		rts

SearchCfgString:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a0
		clr.l      12(a0)
		movea.l    (a7),a0
		move.w     #$FFFF,16(a0)
		movea.l    (a7),a1
		movea.l    4(a7),a0
		jsr        SearchGruppe
		movea.l    (a7),a1
		move.l     a0,4(a1)
		movea.l    (a7),a0
		move.l     4(a0),d0
		beq.s      SearchCfgString_1
		movea.l    (a7),a0
		movea.l    4(a0),a0
		move.l     6(a0),-(a7)
		movea.l    4(a7),a0
		movea.l    4(a0),a0
		move.w     4(a0),d0
		movea.l    4(a7),a1
		movea.l    8(a7),a0
		jsr        SearchCfgNameInStrings
		addq.w     #4,a7
SearchCfgString_1:
		addq.w     #8,a7
		rts

SearchCfgNameInStrings:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.l     a1,12(a7)
		move.w     d0,10(a7)
		clr.l      (a7)
		move.w     10(a7),d0
		ble.s      SearchCfgNameInStrings_1
		move.l     24(a7),d0
		bne.s      SearchCfgNameInStrings_2
SearchCfgNameInStrings_1:
		cmpi.w     #$FFFF,10(a7)
		bne        SearchCfgNameInStrings_3
		move.l     24(a7),d0
		beq        SearchCfgNameInStrings_3
SearchCfgNameInStrings_2:
		clr.w      8(a7)
		move.l     24(a7),(a7)
		clr.l      4(a7)
		bra.s      SearchCfgNameInStrings_4
SearchCfgNameInStrings_8:
		movea.l    (a7),a0
		move.l     (a0),d0
		beq.s      SearchCfgNameInStrings_5
		movea.l    (a7),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		beq.s      SearchCfgNameInStrings_5
		move.l     12(a7),-(a7)
		movea.l    4(a7),a0
		movea.l    (a0),a1
		movea.l    20(a7),a0
		jsr        SearchCfgName
		addq.w     #4,a7
		move.l     a0,4(a7)
		move.l     4(a7),d0
		beq.s      SearchCfgNameInStrings_5
		bra.s      SearchCfgNameInStrings_6
SearchCfgNameInStrings_5:
		addq.w     #1,8(a7)
		addq.l     #4,(a7)
SearchCfgNameInStrings_4:
		move.w     10(a7),d0
		ble.s      SearchCfgNameInStrings_7
		move.w     8(a7),d0
		cmp.w      10(a7),d0
		blt.s      SearchCfgNameInStrings_8
SearchCfgNameInStrings_7:
		cmpi.w     #$FFFF,10(a7)
		bne.s      SearchCfgNameInStrings_6
		movea.l    (a7),a0
		move.l     (a0),d0
		beq.s      SearchCfgNameInStrings_6
		movea.l    (a7),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		bne.s      SearchCfgNameInStrings_8
SearchCfgNameInStrings_6:
		move.l     4(a7),d0
		beq.s      SearchCfgNameInStrings_3
		movea.l    12(a7),a0
		move.l     4(a7),12(a0)
		movea.l    12(a7),a0
		move.w     8(a7),16(a0)
SearchCfgNameInStrings_3:
		lea.l      20(a7),a7
		rts

SearchGruppe:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		move.l     8(a7),d0
		bne.s      SearchGruppe_1
		suba.l     a0,a0
		bra        SearchGruppe_2
SearchGruppe_1:
		clr.w      4(a7)
		clr.w      6(a7)
		bra.s      SearchGruppe_3
SearchGruppe_12:
		move.w     6(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    12(a7),a0
		movea.l    22(a0),a0
		move.l     0(a0,d0.l),(a7)
		movea.l    12(a7),a0
		move.w     12(a0),d0
		beq.s      SearchGruppe_4
		movea.l    8(a7),a0
		movea.l    (a0),a1
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        Ast_cmp
		tst.w      d0
		bne.s      SearchGruppe_5
		moveq.l    #1,d0
		bra.s      SearchGruppe_6
SearchGruppe_5:
		clr.w      d0
SearchGruppe_6:
		move.w     d0,4(a7)
		bra.s      SearchGruppe_7
SearchGruppe_4:
		movea.l    8(a7),a0
		movea.l    (a0),a1
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        Ast_icmp
		tst.w      d0
		bne.s      SearchGruppe_8
		moveq.l    #1,d0
		bra.s      SearchGruppe_9
SearchGruppe_8:
		clr.w      d0
SearchGruppe_9:
		move.w     d0,4(a7)
SearchGruppe_7:
		move.w     4(a7),d0
		beq.s      SearchGruppe_10
		bra.s      SearchGruppe_11
SearchGruppe_10:
		addq.w     #1,6(a7)
SearchGruppe_3:
		move.w     4(a7),d0
		bne.s      SearchGruppe_11
		movea.l    12(a7),a0
		move.w     6(a7),d0
		cmp.w      20(a0),d0
		blt.w      SearchGruppe_12
SearchGruppe_11:
		move.w     4(a7),d0
		beq.s      SearchGruppe_13
		movea.l    (a7),a0
		bra.s      SearchGruppe_2
SearchGruppe_13:
		suba.l     a0,a0
SearchGruppe_2:
		lea.l      16(a7),a7
		rts

SearchCfgName:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     a1,10(a7)
		move.l     10(a7),4(a7)
		bra.s      SearchCfgName_1
SearchCfgName_3:
		addq.l     #1,4(a7)
SearchCfgName_1:
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      SearchCfgName_2
		movea.l    4(a7),a0
		move.b     (a0),d0
		jsr        Ach_isWhite
		tst.w      d0
		bne.s      SearchCfgName_3
SearchCfgName_2:
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      SearchCfgName_4
		movea.l    4(a7),a0
		move.b     (a0),d0
		ext.w      d0
		movea.l    14(a7),a0
		movea.l    4(a0),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      SearchCfgName_4
		suba.l     a0,a0
		bra        SearchCfgName_5
SearchCfgName_4:
		movea.l    22(a7),a0
		move.l     8(a0),(a7)
		move.w     #$0001,8(a7)
		bra.s      SearchCfgName_6
SearchCfgName_14:
		movea.l    14(a7),a0
		move.w     12(a0),d0
		beq.s      SearchCfgName_7
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		bne.s      SearchCfgName_8
		moveq.l    #1,d0
		bra.s      SearchCfgName_9
SearchCfgName_8:
		clr.w      d0
SearchCfgName_9:
		move.w     d0,8(a7)
		bra.s      SearchCfgName_10
SearchCfgName_7:
		movea.l    (a7),a0
		move.b     (a0),d0
		jsr        Ach_toupper
		move.b     d0,-(a7)
		movea.l    6(a7),a0
		move.b     (a0),d0
		jsr        Ach_toupper
		cmp.b      (a7)+,d0
		bne.s      SearchCfgName_11
		moveq.l    #1,d0
		bra.s      SearchCfgName_12
SearchCfgName_11:
		clr.w      d0
SearchCfgName_12:
		move.w     d0,8(a7)
SearchCfgName_10:
		addq.l     #1,(a7)
		addq.l     #1,4(a7)
SearchCfgName_6:
		move.w     8(a7),d0
		beq.s      SearchCfgName_13
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      SearchCfgName_13
		movea.l    4(a7),a0
		cmpi.b     #$3D,(a0)
		beq.s      SearchCfgName_13
		movea.l    4(a7),a0
		move.b     (a0),d0
		bne.s      SearchCfgName_14
SearchCfgName_13:
		bra.s      SearchCfgName_15
SearchCfgName_17:
		addq.l     #1,4(a7)
SearchCfgName_15:
		move.w     8(a7),d0
		beq.s      SearchCfgName_16
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      SearchCfgName_16
		movea.l    4(a7),a0
		move.b     (a0),d0
		jsr        Ach_isWhite
		tst.w      d0
		beq.s      SearchCfgName_16
		movea.l    4(a7),a0
		cmpi.b     #$3D,(a0)
		bne.s      SearchCfgName_17
SearchCfgName_16:
		move.w     8(a7),d0
		beq.s      SearchCfgName_18
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      SearchCfgName_18
		movea.l    4(a7),a0
		cmpi.b     #$3D,(a0)
		bne.s      SearchCfgName_18
		movea.l    4(a7),a0
		cmpi.b     #$3D,(a0)
		bne.s      SearchCfgName_19
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      SearchCfgName_19
SearchCfgName_18:
		suba.l     a0,a0
		bra.s      SearchCfgName_5
SearchCfgName_19:
		addq.l     #1,4(a7)
		movea.l    4(a7),a0
SearchCfgName_5:
		lea.l      18(a7),a7
		rts

CreateCfgGruppe:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     a1,10(a7)
		moveq.l    #10,d0
		jsr        Ax_malloc
		move.l     a0,6(a7)
		move.l     6(a7),d0
		bne.s      CreateCfgGruppe_1
		suba.l     a0,a0
		bra        CreateCfgGruppe_2
CreateCfgGruppe_1:
		movea.l    6(a7),a0
		clr.w      4(a0)
		movea.l    6(a7),a0
		clr.l      6(a0)
		movea.l    10(a7),a0
		jsr        Ast_create
		movea.l    6(a7),a1
		move.l     a0,(a1)
		movea.l    6(a7),a0
		move.l     (a0),d0
		bne.s      CreateCfgGruppe_3
		movea.l    6(a7),a0
		jsr        Ax_free
		suba.l     a0,a0
		bra        CreateCfgGruppe_2
CreateCfgGruppe_3:
		movea.l    14(a7),a0
		move.w     20(a0),(a7)
		moveq.l    #1,d0
		add.w      (a7),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,2(a7)
		move.l     2(a7),d0
		bne.s      CreateCfgGruppe_4
		movea.l    6(a7),a0
		movea.l    (a0),a0
		jsr        Ast_delete
		movea.l    6(a7),a0
		jsr        Ax_free
		suba.l     a0,a0
		bra.s      CreateCfgGruppe_2
CreateCfgGruppe_4:
		move.w     (a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    14(a7),a0
		movea.l    22(a0),a1
		movea.l    2(a7),a0
		jsr        memcpy
		move.w     (a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    2(a7),a0
		move.l     6(a7),0(a0,d0.l)
		movea.l    14(a7),a0
		movea.l    22(a0),a0
		jsr        Ax_free
		movea.l    14(a7),a0
		move.l     2(a7),22(a0)
		movea.l    14(a7),a0
		addq.w     #1,20(a0)
		movea.l    6(a7),a0
CreateCfgGruppe_2:
		lea.l      18(a7),a7
		rts

CreateCfgString:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.l     a1,6(a7)
		movea.l    10(a7),a0
		move.w     4(a0),4(a7)
		moveq.l    #1,d0
		add.w      4(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      CreateCfgString_1
		clr.w      d0
		bra.s      CreateCfgString_2
CreateCfgString_1:
		move.w     4(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    10(a7),a0
		movea.l    6(a0),a1
		movea.l    (a7),a0
		jsr        memcpy
		move.w     4(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		move.l     6(a7),0(a0,d0.l)
		movea.l    10(a7),a0
		movea.l    6(a0),a0
		jsr        Ax_free
		movea.l    10(a7),a0
		move.l     (a7),6(a0)
		movea.l    10(a7),a0
		addq.w     #1,4(a0)
		moveq.l    #1,d0
CreateCfgString_2:
		lea.l      14(a7),a7
		rts

DeleteCfgString:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.w     d0,12(a7)
		moveq.l    #-1,d0
		movea.l    14(a7),a0
		add.w      4(a0),d0
		move.w     d0,10(a7)
		move.w     10(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      DeleteCfgString_1
		clr.w      d0
		bra.s      DeleteCfgString_2
DeleteCfgString_1:
		clr.w      8(a7)
		move.l     4(a7),(a7)
		bra.s      DeleteCfgString_3
DeleteCfgString_5:
		move.w     8(a7),d0
		cmp.w      12(a7),d0
		beq.s      DeleteCfgString_4
		move.w     8(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    14(a7),a0
		movea.l    6(a0),a0
		movea.l    (a7),a1
		addq.l     #4,(a7)
		move.l     0(a0,d0.l),(a1)
DeleteCfgString_4:
		addq.w     #1,8(a7)
DeleteCfgString_3:
		move.w     8(a7),d0
		cmp.w      10(a7),d0
		ble.s      DeleteCfgString_5
		movea.l    14(a7),a0
		movea.l    6(a0),a0
		jsr        Ax_free
		movea.l    14(a7),a0
		move.l     4(a7),6(a0)
		movea.l    14(a7),a0
		subq.w     #1,4(a0)
		moveq.l    #1,d0
DeleteCfgString_2:
		lea.l      18(a7),a7
		rts

	.data

default_info:
		dc.l xe0584
		dc.l xe0585
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0020
xe0584:
		dc.b 0
xe0585:                              dc.b $25,$3b,0
xe0588:
		dc.b $25,$3b,0
xe058b:
		dc.b 00
xe058c:
		dc.b 0
xe058d:
		dc.b 0
xe058e:
		dc.b 'cfg',0
xe0592:
		dc.w $5c00
xe0594:
		dc.w $7200
xe0596:
		dc.b $5b,$5d,0
xe0599:
		dc.b '%c %s',$0a,0
xe05a0:
		dc.b '%c',$0a,0
xe05a4:
		dc.w $7700
xe05a6:
		dc.b '[%s]',$0a,0
xe05ac:
		dc.b '%s',$0a,0
xe05b0:
		dc.w $0a00
xe05b2:
		dc.w $0a00
xe05b4:
		dc.b $78,$78,0
xe05b7:
		dc.b $3d,0
xe05b9:
		dc.b 00
xe05ba:
		dc.b 0
xe05bb:
		dc.b '%li',0
xe05bf:
		dc.b 'True',0
xe05c4:
		dc.b 'True',0
xe05c9:
		dc.b 'False',0
xe05cf:
		dc.b 'True',0
xe05d4:
		dc.b 0
xe05d5:                              dc.b '[]',0
xe05d8:
		dc.b $3d,0
		.even
