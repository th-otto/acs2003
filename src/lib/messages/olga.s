	.globl Aev_InitOlga
Aev_InitOlga:
		subq.w     #2,a7
		move.w     #$0001,(a7)
		jsr        Alu_create
		move.l     a0,olga_connection
		move.l     olga_connection,d0
		bne.s      Aev_InitOlga_1
		clr.w      d0
		bra.s      Aev_InitOlga_2
Aev_InitOlga_1:
		movea.l    olga_connection,a0
		move.l     #DelConnect,4(a0)
		moveq.l    #16,d1
		moveq.l    #-1,d0
		lea.l      idle_message,a0
		jsr        memset
		moveq.l    #1,d0
		and.w      ACSconfig+62,d0
		beq.s      Aev_InitOlga_3
		moveq.l    #2,d0
		and.w      ACSconfig+62,d0
		beq.s      Aev_InitOlga_4
		jsr        CheckOlga
		move.w     d0,(a7)
		bra.s      Aev_InitOlga_3
Aev_InitOlga_4:
		jsr        FindOlgaManager
		move.w     d0,olga_id
Aev_InitOlga_3:
		clr.w      phase
		move.w     (a7),d0
Aev_InitOlga_2:
		addq.w     #2,a7
		rts

	.globl Aev_ExitOlga
Aev_ExitOlga:
		move.w     #$0001,phase
		move.w     olga_id,d0
		bmi.s      Aev_ExitOlga_1
		jsr        Aev_OleExit
Aev_ExitOlga_1:
		move.l     olga_connection,d0
		beq.s      Aev_ExitOlga_2
		movea.l    olga_connection,a0
		jsr        Alu_delete
Aev_ExitOlga_2:
		moveq.l    #1,d0
		rts

FindAppl:
		lea.l      -36(a7),a7
		move.l     a0,32(a7)
		move.l     a1,28(a7)
		move.w     #$FFFF,26(a7)
		movea.l    _globl,a1
		movea.l    32(a7),a0
		jsr        mt_appl_find
		move.w     d0,26(a7)
		move.w     26(a7),d0
		bpl        FindAppl_1
		movea.l    28(a7),a0
		jsr        Ash_getenv
		move.l     a0,20(a7)
		move.l     20(a7),d0
		beq        FindAppl_1
		movea.l    20(a7),a1
		lea.l      (a7),a0
		jsr        Af_2name
		moveq.l    #8,d0
		jsr        Ast_adl
		movea.l    _globl,a1
		lea.l      (a7),a0
		jsr        mt_appl_find
		move.w     d0,26(a7)
		move.w     26(a7),d0
		bpl        FindAppl_1
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		beq.w      FindAppl_1
		movea.l    ACSblk,a0
		move.l     652(a0),-(a7)
		lea.l      xe1b72,a1
		movea.l    24(a7),a0
		jsr        Ash_prog
		addq.w     #4,a7
		clr.w      24(a7)
		bra.s      FindAppl_2
FindAppl_4:
		movea.l    _globl,a0
		moveq.l    #100,d0
		jsr        mt_evnt_timer
		movea.l    _globl,a1
		movea.l    32(a7),a0
		jsr        mt_appl_find
		move.w     d0,26(a7)
		move.w     26(a7),d0
		bpl.s      FindAppl_3
		movea.l    _globl,a1
		lea.l      (a7),a0
		jsr        mt_appl_find
		move.w     d0,26(a7)
FindAppl_3:
		addq.w     #1,24(a7)
FindAppl_2:
		move.w     phase,d0
		bne.s      FindAppl_1
		move.w     olga_id,d0
		bpl.s      FindAppl_1
		cmpi.w     #$001E,24(a7)
		blt.s      FindAppl_4
FindAppl_1:
		move.w     26(a7),d0
		lea.l      36(a7),a7
		rts

FindOlgaManager:
		move.w     olga_id,d0
		bpl.s      FindOlgaManager_1
		lea.l      xe1b7c,a1
		lea.l      xe1b73,a0
		bsr        FindAppl
		move.w     d0,olga_id
		move.w     olga_id,d0
		bpl.s      FindOlgaManager_2
		lea.l      xe1b91,a1
		lea.l      xe1b88,a0
		bsr        FindAppl
		move.w     d0,olga_id
FindOlgaManager_2:
		move.w     olga_id,d0
		bmi.s      FindOlgaManager_1
		jsr        Aev_OleInit
FindOlgaManager_1:
		move.w     olga_id,d0
		rts

CheckOlga:
		subq.w     #2,a7
		move.w     use_olga,d0
		beq.s      CheckOlga_1
		move.w     olga_id,d0
		bmi.s      CheckOlga_1
		movea.l    ACSblk,a0
		move.w     olga_id,d0
		cmp.w      (a0),d0
		beq.s      CheckOlga_1
		moveq.l    #1,d0
		bra.s      CheckOlga_2
CheckOlga_1:
		move.w     olga_id,d0
		bpl.s      CheckOlga_3
		bsr        FindOlgaManager
		move.w     d0,olga_id
CheckOlga_3:
		move.w     use_olga,d0
		bne.s      CheckOlga_4
		clr.w      (a7)
		bra.s      CheckOlga_5
CheckOlga_6:
		jsr        Aev_mess
		addq.w     #1,(a7)
CheckOlga_5:
		move.w     use_olga,d0
		bne.s      CheckOlga_4
		cmpi.w     #$001E,(a7)
		blt.s      CheckOlga_6
CheckOlga_4:
		move.w     use_olga,d0
		beq.s      CheckOlga_7
		move.w     olga_id,d0
		bmi.s      CheckOlga_7
		movea.l    ACSblk,a0
		move.w     olga_id,d0
		cmp.w      (a0),d0
		beq.s      CheckOlga_7
		moveq.l    #1,d0
		bra.s      CheckOlga_2
CheckOlga_7:
		clr.w      d0
CheckOlga_2:
		addq.w     #2,a7
		rts

DelConnect:
		move.l     a2,-(a7)
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     4(a7),(a7)
		movea.l    (a7),a1
		moveq.l    #44,d0
		movea.l    (a7),a0
		movea.l    (a0),a0
		movea.l    (a7),a2
		movea.l    (a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
		movea.l    (a7),a0
		move.l     6(a0),d0
		beq.s      DelConnect_1
		movea.l    (a7),a0
		movea.l    6(a0),a0
		jsr        Ax_glfree
DelConnect_1:
		movea.l    (a7),a0
		move.l     12(a0),d0
		beq.s      DelConnect_2
		movea.l    (a7),a0
		movea.l    12(a0),a0
		jsr        Ax_glfree
DelConnect_2:
		moveq.l    #32,d0
		movea.l    4(a7),a0
		jsr        Ax_recycle
		addq.w     #8,a7
		movea.l    (a7)+,a2
		rts

CmpIDConnect:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		move.w     (a0),d0
		movea.l    (a7),a0
		cmp.w      4(a0),d0
		bne.s      CmpIDConnect_1
		moveq.l    #1,d0
		bra.s      CmpIDConnect_2
CmpIDConnect_1:
		clr.w      d0
CmpIDConnect_2:
		addq.w     #8,a7
		rts

CmpDatInfoConnect:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		moveq.l    #1,d0
		movea.l    (a7),a0
		and.w      16(a0),d0
		beq.s      CmpDatInfoConnect_1
		movea.l    (a7),a0
		movea.l    6(a0),a1
		movea.l    4(a7),a0
		movea.l    6(a0),a0
		jsr        Ast_icmp
		tst.w      d0
		bne.s      CmpDatInfoConnect_2
		moveq.l    #1,d0
		bra.s      CmpDatInfoConnect_3
CmpDatInfoConnect_2:
		clr.w      d0
CmpDatInfoConnect_3:
		bra.s      CmpDatInfoConnect_4
CmpDatInfoConnect_1:
		movea.l    (a7),a0
		movea.l    6(a0),a1
		movea.l    4(a7),a0
		movea.l    6(a0),a0
		jsr        Ast_cmp
		tst.w      d0
		bne.s      CmpDatInfoConnect_5
		moveq.l    #1,d0
		bra.s      CmpDatInfoConnect_4
CmpDatInfoConnect_5:
		clr.w      d0
CmpDatInfoConnect_4:
		tst.w      d0
		beq.s      CmpDatInfoConnect_6
		moveq.l    #2,d0
		movea.l    4(a7),a0
		and.w      16(a0),d0
		moveq.l    #2,d1
		movea.l    (a7),a0
		and.w      18(a0),d1
		cmp.w      d1,d0
		bne.s      CmpDatInfoConnect_6
		moveq.l    #1,d0
		bra.s      CmpDatInfoConnect_7
CmpDatInfoConnect_6:
		clr.w      d0
CmpDatInfoConnect_7:
		addq.w     #8,a7
		rts

Datei2Connect:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		pea.l      CmpDatInfoConnect(pc)
		movea.l    4(a7),a1
		movea.l    olga_connection,a0
		movea.l    olga_connection,a2
		movea.l    32(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

ID2Connect:
		move.l     a2,-(a7)
		subq.w     #2,a7
		move.w     d0,(a7)
		pea.l      CmpIDConnect(pc)
		lea.l      4(a7),a1
		movea.l    olga_connection,a0
		movea.l    olga_connection,a2
		movea.l    32(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		addq.w     #2,a7
		movea.l    (a7)+,a2
		rts

SendOlgaUpdate:
		move.l     a2,-(a7)
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		movea.l    (a7),a1
		move.w     10(a0),10(a1)
		movea.l    (a7),a1
		moveq.l    #43,d0
		movea.l    (a7),a0
		movea.l    (a0),a0
		movea.l    (a7),a2
		movea.l    (a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
		addq.w     #8,a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetOlgaInit
Aev_GetOlgaInit:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		movea.l    6(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		move.w     olga_id,d0
		cmp.w      2(a0),d0
		bne.s      Aev_GetOlgaInit_1
		moveq.l    #1,d0
		bra.s      Aev_GetOlgaInit_2
Aev_GetOlgaInit_1:
		clr.w      d0
Aev_GetOlgaInit_2:
		move.w     d0,4(a7)
		move.w     4(a7),d0
		beq.s      Aev_GetOlgaInit_3
		movea.l    (a7),a0
		move.w     14(a0),d0
		bne.s      Aev_GetOlgaInit_4
		move.w     #$FFFF,olga_id
		clr.w      olga_infos
		move.w     #$FFFF,olga_stufe
		movea.l    olga_connection,a0
		movea.l    olga_connection,a1
		movea.l    8(a1),a1
		jsr        (a1)
		bra.s      Aev_GetOlgaInit_3
Aev_GetOlgaInit_4:
		movea.l    (a7),a0
		move.w     6(a0),olga_infos
		movea.l    (a7),a0
		move.w     8(a0),olga_stufe
		move.w     #$0001,use_olga
Aev_GetOlgaInit_3:
		move.w     4(a7),d0
		lea.l      10(a7),a7
		rts

	.globl Aev_GetOleExit
Aev_GetOleExit:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		move.w     olga_id,d0
		bmi.s      Aev_GetOleExit_1
		movea.l    (a7),a0
		move.w     olga_id,d0
		cmp.w      2(a0),d0
		bne.s      Aev_GetOleExit_1
		move.w     #$FFFF,olga_id
		clr.w      olga_infos
		move.w     #$FFFF,olga_stufe
		clr.w      use_olga
		movea.l    olga_connection,a0
		movea.l    olga_connection,a1
		movea.l    8(a1),a1
		jsr        (a1)
		moveq.l    #1,d0
		bra.s      Aev_GetOleExit_2
Aev_GetOleExit_1:
		clr.w      d0
Aev_GetOleExit_2:
		addq.w     #8,a7
		rts

	.globl Aev_GetOleNew
Aev_GetOleNew:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		move.w     2(a0),olga_id
		movea.l    (a7),a0
		move.w     14(a0),olga_version
		jsr        Aev_OleInit
		addq.w     #8,a7
		rts

	.globl Aev_GetOlgaAck
Aev_GetOlgaAck:
		move.l     a2,-(a7)
		lea.l      -42(a7),a7
		move.l     a0,34(a7)
		movea.l    34(a7),a0
		move.l     (a0),30(a7)
		clr.l      4(a7)
		clr.l      (a7)
		movea.l    30(a7),a0
		move.w     14(a0),d0
		sub.w      #$1238,d0
		beq.s      Aev_GetOlgaAck_1
		subq.w     #2,d0
		beq.s      Aev_GetOlgaAck_2
		sub.w      #$000A,d0
		beq        Aev_GetOlgaAck_3
		subq.w     #4,d0
		beq.s      Aev_GetOlgaAck_4
		bra        Aev_GetOlgaAck_5
Aev_GetOlgaAck_1:
		movea.l    30(a7),a0
		move.l     6(a0),14(a7)
		move.w     #$0002,24(a7)
		lea.l      8(a7),a0
		bsr        Datei2Connect
		move.l     a0,26(a7)
		bra.w      Aev_GetOlgaAck_5
Aev_GetOlgaAck_4:
		movea.l    30(a7),a0
		move.w     10(a0),d0
		bsr        ID2Connect
		move.l     a0,26(a7)
		move.l     26(a7),d0
		beq.s      Aev_GetOlgaAck_6
		movea.l    26(a7),a0
		move.l     (a0),38(a7)
		movea.l    26(a7),a1
		moveq.l    #47,d0
		movea.l    38(a7),a0
		movea.l    38(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
Aev_GetOlgaAck_6:
		bra.s      Aev_GetOlgaAck_5
Aev_GetOlgaAck_2:
		movea.l    30(a7),a0
		move.l     10(a0),14(a7)
		move.w     #$0002,24(a7)
		lea.l      8(a7),a0
		bsr        Datei2Connect
		move.l     a0,26(a7)
		movea.l    30(a7),a0
		move.l     6(a0),(a7)
		bra.s      Aev_GetOlgaAck_5
Aev_GetOlgaAck_3:
		movea.l    30(a7),a0
		move.l     6(a0),14(a7)
		move.w     #$0002,24(a7)
		lea.l      8(a7),a0
		bsr        Datei2Connect
		move.l     a0,26(a7)
		nop
Aev_GetOlgaAck_5:
		move.l     26(a7),d0
		beq.s      Aev_GetOlgaAck_7
		movea.l    30(a7),a0
		move.w     (a0),d0
		movea.l    26(a7),a0
		cmp.w      26(a0),d0
		bne.s      Aev_GetOlgaAck_8
		movea.l    26(a7),a0
		subq.w     #1,28(a0)
		movea.l    26(a7),a0
		cmpi.w     #$0001,28(a0)
		bge.s      Aev_GetOlgaAck_9
		movea.l    26(a7),a0
		move.w     #$FFFF,26(a0)
Aev_GetOlgaAck_9:
		movea.l    26(a7),a0
		move.w     30(a0),d0
		beq.s      Aev_GetOlgaAck_8
		movea.l    26(a7),a0
		bsr        DelConnect
Aev_GetOlgaAck_8:
		bra.s      Aev_GetOlgaAck_10
Aev_GetOlgaAck_7:
		move.l     14(a7),4(a7)
Aev_GetOlgaAck_10:
		move.l     4(a7),d0
		beq.s      Aev_GetOlgaAck_11
		pea.l      Alu_ptrCmp
		movea.l    8(a7),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    24(a2),a2
		jsr        (a2)
		addq.w     #4,a7
Aev_GetOlgaAck_11:
		move.l     (a7),d0
		beq.s      Aev_GetOlgaAck_12
		pea.l      Alu_ptrCmp
		movea.l    4(a7),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    24(a2),a2
		jsr        (a2)
		addq.w     #4,a7
Aev_GetOlgaAck_12:
		moveq.l    #1,d0
		lea.l      42(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetOlgaUpdated
Aev_GetOlgaUpdated:
		move.l     a2,-(a7)
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		movea.l    22(a7),a0
		move.l     (a0),18(a7)
		movea.l    18(a7),a0
		move.l     6(a0),6(a7)
		clr.w      d1
		moveq.l    #-1,d0
		movea.l    6(a7),a0
		jsr        Ax_memCheck
		tst.w      d0
		beq.s      Aev_GetOlgaUpdated_1
		movea.l    18(a7),a0
		move.w     10(a0),10(a7)
		clr.w      16(a7)
		pea.l      SendOlgaUpdate(pc)
		pea.l      CmpDatInfoConnect(pc)
		lea.l      8(a7),a1
		movea.l    olga_connection,a0
		movea.l    olga_connection,a2
		movea.l    64(a2),a2
		jsr        (a2)
		addq.w     #8,a7
Aev_GetOlgaUpdated_1:
		moveq.l    #1,d0
		lea.l      26(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetOlgaGetInfo
Aev_GetOlgaGetInfo:
		move.l     a2,-(a7)
		lea.l      -16(a7),a7
		move.l     a0,8(a7)
		movea.l    8(a7),a0
		move.l     (a0),4(a7)
		pea.l      CmpIDConnect(pc)
		movea.l    8(a7),a1
		lea.l      10(a1),a1
		movea.l    olga_connection,a0
		movea.l    olga_connection,a2
		movea.l    32(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Aev_GetOlgaGetInfo_1
		movea.l    (a7),a0
		move.l     (a0),12(a7)
		movea.l    (a7),a1
		moveq.l    #45,d0
		movea.l    12(a7),a0
		movea.l    12(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		tst.w      d0
		beq.s      Aev_GetOlgaGetInfo_1
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.w     2(a1),d0
		jsr        Aev_OlgaInfo
Aev_GetOlgaGetInfo_1:
		moveq.l    #1,d0
		lea.l      16(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetOlgaClientTerminated
Aev_GetOlgaClientTerminated:
		moveq.l    #1,d0
		rts

	.globl Aev_GetOlgaIdle
Aev_GetOlgaIdle:
		move.l     a2,-(a7)
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		movea.l    22(a7),a0
		move.l     (a0),18(a7)
		move.w     #$0001,(a7)
		cmpi.w     #$1249,idle_message
		bne.s      Aev_GetOlgaIdle_1
		moveq.l    #8,d0
		movea.l    18(a7),a1
		addq.w     #8,a1
		lea.l      idle_message+8,a0
		jsr        memcmp
		tst.w      d0
		bne.s      Aev_GetOlgaIdle_1
		moveq.l    #16,d1
		moveq.l    #-1,d0
		lea.l      idle_message,a0
		jsr        memset
		bra.s      Aev_GetOlgaIdle_2
Aev_GetOlgaIdle_1:
		movea.l    18(a7),a0
		move.w     2(a0),d0
		movea.l    ACSblk,a0
		cmp.w      (a0),d0
		beq.s      Aev_GetOlgaIdle_2
		moveq.l    #16,d0
		movea.l    18(a7),a1
		lea.l      2(a7),a0
		jsr        memcpy
		movea.l    ACSblk,a0
		move.w     (a0),4(a7)
		movea.l    _globl,a1
		lea.l      2(a7),a0
		moveq.l    #16,d1
		movea.l    18(a7),a2
		move.w     2(a2),d0
		jsr        mt_appl_write
		tst.w      d0
		beq.s      Aev_GetOlgaIdle_3
		moveq.l    #1,d0
		bra.s      Aev_GetOlgaIdle_4
Aev_GetOlgaIdle_3:
		clr.w      d0
Aev_GetOlgaIdle_4:
		move.w     d0,(a7)
Aev_GetOlgaIdle_2:
		move.w     (a7),d0
		lea.l      26(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_OleInit
Aev_OleInit:
		lea.l      -18(a7),a7
		clr.w      16(a7)
		move.w     olga_id,d0
		bmi.s      Aev_OleInit_1
		movea.l    ACSblk,a0
		move.w     olga_id,d0
		cmp.w      (a0),d0
		beq.s      Aev_OleInit_1
		moveq.l    #16,d1
		clr.w      d0
		lea.l      (a7),a0
		jsr        memset
		move.w     #$4950,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		move.w     #$0801,6(a7)
		move.w     ACSconfig+64,14(a7)
		movea.l    _globl,a1
		lea.l      (a7),a0
		moveq.l    #16,d1
		move.w     olga_id,d0
		jsr        mt_appl_write
		tst.w      d0
		beq.s      Aev_OleInit_2
		moveq.l    #1,d0
		bra.s      Aev_OleInit_3
Aev_OleInit_2:
		clr.w      d0
Aev_OleInit_3:
		move.w     d0,16(a7)
Aev_OleInit_1:
		move.w     16(a7),d0
		lea.l      18(a7),a7
		rts

	.globl Aev_OleExit
Aev_OleExit:
		lea.l      -18(a7),a7
		clr.w      16(a7)
		bsr        CheckOlga
		tst.w      d0
		beq.s      Aev_OleExit_1
		moveq.l    #16,d1
		clr.w      d0
		lea.l      (a7),a0
		jsr        memset
		move.w     #$4951,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		movea.l    _globl,a1
		lea.l      (a7),a0
		moveq.l    #16,d1
		move.w     olga_id,d0
		jsr        mt_appl_write
		tst.w      d0
		beq.s      Aev_OleExit_2
		moveq.l    #1,d0
		bra.s      Aev_OleExit_3
Aev_OleExit_2:
		clr.w      d0
Aev_OleExit_3:
		move.w     d0,16(a7)
		move.w     #$FFFF,olga_id
		clr.w      olga_infos
		move.w     #$FFFF,olga_stufe
		clr.w      use_olga
		movea.l    olga_connection,a0
		movea.l    olga_connection,a1
		movea.l    8(a1),a1
		jsr        (a1)
Aev_OleExit_1:
		move.w     16(a7),d0
		lea.l      18(a7),a7
		rts

	.globl Aev_OlgaUpdate
Aev_OlgaUpdate:
		move.l     a2,-(a7)
		lea.l      -48(a7),a7
		move.l     a0,44(a7)
		clr.w      42(a7)
		bsr        CheckOlga
		tst.w      d0
		beq        Aev_OlgaUpdate_1
		move.l     44(a7),10(a7)
		move.w     #$0002,20(a7)
		lea.l      4(a7),a0
		bsr        Datei2Connect
		move.l     a0,22(a7)
		moveq.l    #16,d1
		clr.w      d0
		lea.l      26(a7),a0
		jsr        memset
		move.w     #$1238,26(a7)
		movea.l    ACSblk,a0
		move.w     (a0),28(a7)
		move.l     22(a7),d0
		bne.s      Aev_OlgaUpdate_2
		movea.l    22(a7),a0
		move.w     30(a0),d0
		beq.s      Aev_OlgaUpdate_3
Aev_OlgaUpdate_2:
		movea.l    22(a7),a0
		movea.l    12(a0),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      Aev_OlgaUpdate_4
		clr.w      d0
		bra.s      Aev_OlgaUpdate_5
Aev_OlgaUpdate_4:
		movea.l    22(a7),a0
		move.w     4(a0),d0
Aev_OlgaUpdate_5:
		move.w     d0,36(a7)
		movea.l    22(a7),a0
		move.l     6(a0),32(a7)
		movea.l    22(a7),a0
		cmpi.w     #$1238,26(a0)
		bne.s      Aev_OlgaUpdate_6
		movea.l    22(a7),a0
		addq.w     #1,28(a0)
		bra.s      Aev_OlgaUpdate_7
Aev_OlgaUpdate_6:
		movea.l    22(a7),a0
		clr.w      28(a0)
Aev_OlgaUpdate_7:
		movea.l    22(a7),a0
		move.w     #$1238,26(a0)
		bra.s      Aev_OlgaUpdate_8
Aev_OlgaUpdate_3:
		movea.l    44(a7),a0
		jsr        strlen
		addq.l     #1,d0
		jsr        Ax_glmalloc
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Aev_OlgaUpdate_9
		clr.w      d0
		bra.s      Aev_OlgaUpdate_10
Aev_OlgaUpdate_9:
		movea.l    (a7),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    12(a2),a2
		jsr        (a2)
		movea.l    44(a7),a1
		movea.l    (a7),a0
		jsr        strcpy
		move.l     (a7),32(a7)
		clr.w      36(a7)
Aev_OlgaUpdate_8:
		movea.l    _globl,a1
		lea.l      26(a7),a0
		moveq.l    #16,d1
		move.w     olga_id,d0
		jsr        mt_appl_write
		tst.w      d0
		beq.s      Aev_OlgaUpdate_11
		moveq.l    #1,d0
		bra.s      Aev_OlgaUpdate_12
Aev_OlgaUpdate_11:
		clr.w      d0
Aev_OlgaUpdate_12:
		move.w     d0,42(a7)
Aev_OlgaUpdate_1:
		move.w     42(a7),d0
Aev_OlgaUpdate_10:
		lea.l      48(a7),a7
		movea.l    (a7)+,a2
		rts

Aev_OlgaInfo:
		lea.l      -24(a7),a7
		move.w     d0,22(a7)
		move.l     a0,18(a7)
		move.w     #$0001,(a7)
		bsr        CheckOlga
		tst.w      d0
		beq.s      Aev_OlgaInfo_1
		moveq.l    #16,d1
		clr.w      d0
		lea.l      2(a7),a0
		jsr        memset
		move.w     #$1248,2(a7)
		movea.l    ACSblk,a0
		move.w     (a0),4(a7)
		movea.l    18(a7),a0
		move.w     4(a0),12(a7)
		movea.l    18(a7),a0
		move.l     12(a0),8(a7)
		movea.l    _globl,a1
		lea.l      2(a7),a0
		moveq.l    #16,d1
		move.w     22(a7),d0
		jsr        mt_appl_write
		tst.w      d0
		beq.s      Aev_OlgaInfo_2
		moveq.l    #1,d0
		bra.s      Aev_OlgaInfo_3
Aev_OlgaInfo_2:
		clr.w      d0
Aev_OlgaInfo_3:
		move.w     d0,(a7)
Aev_OlgaInfo_1:
		move.w     (a7),d0
		lea.l      24(a7),a7
		rts

	.data

olga_connection:
		dc.w $0000
		dc.w $0000
olga_id:
		dc.w $ffff
olga_infos:
		dc.w $0000
olga_stufe:
		dc.w $ffff
olga_version:
		dc.w $0000
use_olga:
		dc.w $0000
idle_message:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
max_id:
		dc.w $0000
max_grp_id:
		dc.w $0000
phase:
		dc.w $ffff
xe1b72:
		dc.b 0
xe1b73:
		dc.b 'OLGA    ',0
xe1b7c:
		dc.b 'OLGAMANAGER',0
xe1b88:
		dc.b 'OLEMANGR',0
xe1b91:
		dc.b 'OLEMANAGER',0
		.even
