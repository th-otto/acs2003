	.globl Aev_InitDHST
Aev_InitDHST:
		moveq.l    #1,d0
		rts

	.globl Aev_ExitDHST
Aev_ExitDHST:
		moveq.l    #1,d0
		rts

freeDhstInfo:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.l     (a0),d0
		beq.s      freeDhstInfo_1
		pea.l      Alu_ptrCmp
		movea.l    4(a7),a0
		movea.l    (a0),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    24(a2),a2
		jsr        (a2)
		addq.w     #4,a7
freeDhstInfo_1:
		movea.l    (a7),a0
		move.l     4(a0),d0
		beq.s      freeDhstInfo_2
		pea.l      Alu_ptrCmp
		movea.l    4(a7),a0
		movea.l    4(a0),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    24(a2),a2
		jsr        (a2)
		addq.w     #4,a7
freeDhstInfo_2:
		movea.l    (a7),a0
		move.l     8(a0),d0
		beq.s      freeDhstInfo_3
		pea.l      Alu_ptrCmp
		movea.l    4(a7),a0
		movea.l    8(a0),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    24(a2),a2
		jsr        (a2)
		addq.w     #4,a7
freeDhstInfo_3:
		movea.l    (a7),a0
		move.l     12(a0),d0
		beq.s      freeDhstInfo_4
		pea.l      Alu_ptrCmp
		movea.l    4(a7),a0
		movea.l    12(a0),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    24(a2),a2
		jsr        (a2)
		addq.w     #4,a7
freeDhstInfo_4:
		pea.l      Alu_ptrCmp
		movea.l    4(a7),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    24(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetDhstAdd
Aev_GetDhstAdd:
		moveq.l    #1,d0
		rts

	.globl Aev_GetDhstAck
Aev_GetDhstAck:
		move.l     a2,-(a7)
		lea.l      -54(a7),a7
		move.l     a0,50(a7)
		move.w     #$DADD,8(a7)
		movea.l    50(a7),a0
		move.l     (a0),4(a7)
		movea.l    4(a7),a0
		move.l     6(a0),(a7)
		movea.l    (a7),a0
		bsr        freeDhstInfo
		movea.l    4(a7),a0
		move.w     2(a0),14(a7)
		move.w     #$0003,16(a7)
		lea.l      8(a7),a0
		move.l     a0,18(a7)
		clr.l      22(a7)
		clr.l      26(a7)
		movea.l    4(a7),a0
		addq.w     #6,a0
		move.l     a0,30(a7)
		movea.l    4(a7),a0
		addq.w     #8,a0
		move.l     a0,34(a7)
		clr.l      38(a7)
		clr.l      42(a7)
		clr.l      46(a7)
		pea.l      Aev_CmpMsgInList
		lea.l      18(a7),a1
		movea.l    SentMsg,a0
		movea.l    SentMsg,a2
		movea.l    32(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		move.l     a0,10(a7)
		move.l     10(a7),d0
		beq.s      Aev_GetDhstAck_1
		pea.l      Alu_ptrCmp
		movea.l    14(a7),a1
		movea.l    SentMsg,a0
		movea.l    SentMsg,a2
		movea.l    32(a2),a2
		jsr        (a2)
		addq.w     #4,a7
Aev_GetDhstAck_1:
		moveq.l    #1,d0
		lea.l      54(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_DhstAdd
Aev_DhstAdd:
		move.l     a2,-(a7)
		lea.l      -34(a7),a7
		move.l     a0,30(a7)
		move.l     a1,26(a7)
		lea.l      (a7),a0
		move.l     #$44485354,d0
		jsr        Ash_getcookie
		tst.w      d0
		beq.s      Aev_DhstAdd_1
		moveq.l    #-1,d0
		and.w      2(a7),d0
		move.w     d0,20(a7)
		bpl.s      Aev_DhstAdd_2
Aev_DhstAdd_1:
		clr.w      d0
		bra        Aev_DhstAdd_3
Aev_DhstAdd_2:
		moveq.l    #16,d0
		jsr        Ax_glmalloc
		move.l     a0,22(a7)
		move.l     22(a7),d0
		bne.s      Aev_DhstAdd_4
		clr.w      d0
		bra        Aev_DhstAdd_3
Aev_DhstAdd_4:
		moveq.l    #4,d1
		clr.w      d0
		movea.l    22(a7),a0
		jsr        memset
		movea.l    22(a7),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    12(a2),a2
		jsr        (a2)
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		movea.l    1254(a0),a0
		jsr        Ast_copy
		jsr        Ast_alltrim
		movea.l    22(a7),a1
		move.l     a0,(a1)
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		lea.l      30(a0),a0
		jsr        Ast_copy
		jsr        Ast_alltrim
		movea.l    22(a7),a1
		move.l     a0,4(a1)
		moveq.l    #1,d0
		movea.l    30(a7),a0
		jsr        Ast_copy
		movea.l    22(a7),a1
		move.l     a0,8(a1)
		moveq.l    #1,d0
		movea.l    26(a7),a0
		jsr        Ast_copy
		movea.l    22(a7),a1
		move.l     a0,12(a1)
		movea.l    22(a7),a0
		movea.l    (a0),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    12(a2),a2
		jsr        (a2)
		movea.l    22(a7),a0
		movea.l    4(a0),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    12(a2),a2
		jsr        (a2)
		movea.l    22(a7),a0
		movea.l    8(a0),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    12(a2),a2
		jsr        (a2)
		movea.l    22(a7),a0
		movea.l    12(a0),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    12(a2),a2
		jsr        (a2)
		move.w     #$DADD,4(a7)
		movea.l    ACSblk,a0
		move.w     (a0),6(a7)
		clr.w      8(a7)
		clr.w      14(a7)
		clr.w      16(a7)
		clr.w      18(a7)
		move.l     22(a7),10(a7)
		moveq.l    #-1,d2
		suba.l     a1,a1
		lea.l      4(a7),a0
		moveq.l    #3,d1
		move.w     20(a7),d0
		jsr        Aev_SendMsg
Aev_DhstAdd_3:
		lea.l      34(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_DhstSaved
Aev_DhstSaved:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		movea.l    6(a7),a0
		jsr        strlen
		jsr        Ax_malloc
		move.l     a0,2(a7)
		move.l     2(a7),d0
		bne.s      Aev_DhstSaved_1
		clr.w      d0
		bra.s      Aev_DhstSaved_2
Aev_DhstSaved_1:
		movea.l    6(a7),a1
		movea.l    2(a7),a0
		jsr        Af_2fullname
		movea.l    6(a7),a1
		bsr        Aev_DhstAdd
		move.w     d0,(a7)
		movea.l    2(a7),a0
		jsr        Ax_free
		move.w     (a7),d0
Aev_DhstSaved_2:
		lea.l      10(a7),a7
		rts

