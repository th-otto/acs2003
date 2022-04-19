	.globl Aev_InitBubble
Aev_InitBubble:
		subq.w     #2,a7
		moveq.l    #8,d0
		and.w      ACSconfig+62,d0
		beq.s      Aev_InitBubble_1
		jsr        FindBubbleGEM
Aev_InitBubble_1:
		jsr        CreateBubbleString
		move.w     d0,(a7)
		clr.w      phase
		move.w     (a7),d0
		addq.w     #2,a7
		rts

	.globl Aev_ExitBubble
Aev_ExitBubble:
		move.w     #$0001,phase
		move.l     bubble_string,d0
		beq.s      Aev_ExitBubble_1
		movea.l    bubble_string,a0
		jsr        Ax_glfree
Aev_ExitBubble_1:
		clr.l      bubble_string
		moveq.l    #1,d0
		rts

CreateBubbleString:
		move.l     bubble_string,d0
		bne.s      CreateBubbleString_1
		move.l     #$00000100,d0
		jsr        Ax_glmalloc
		move.l     a0,bubble_string
		move.l     bubble_string,d0
		bne.s      CreateBubbleString_2
		clr.w      d0
		rts
CreateBubbleString_2:
		movea.l    bubble_string,a0
		clr.b      (a0)
CreateBubbleString_1:
		moveq.l    #1,d0
		rts

FindBubbleGEM:
		subq.w     #8,a7
		movea.l    _globl,a1
		lea.l      xe1a94,a0
		jsr        mt_appl_find
		move.w     d0,6(a7)
		move.w     6(a7),d0
		bpl        FindBubbleGEM_1
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		beq.w      FindBubbleGEM_1
		lea.l      xe1a9d,a0
		jsr        Ash_getenv
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      FindBubbleGEM_1
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      FindBubbleGEM_1
		movea.l    ACSblk,a0
		move.l     652(a0),-(a7)
		lea.l      xe1aa7,a1
		movea.l    4(a7),a0
		jsr        Ash_prog
		addq.w     #4,a7
		clr.w      4(a7)
		bra.s      FindBubbleGEM_2
FindBubbleGEM_3:
		movea.l    _globl,a0
		moveq.l    #100,d0
		jsr        mt_evnt_timer
		movea.l    _globl,a1
		lea.l      xe1aa8,a0
		jsr        mt_appl_find
		move.w     d0,6(a7)
		addq.w     #1,4(a7)
FindBubbleGEM_2:
		move.w     phase,d0
		bne.s      FindBubbleGEM_1
		move.w     6(a7),d0
		bpl.s      FindBubbleGEM_1
		cmpi.w     #$001E,4(a7)
		blt.s      FindBubbleGEM_3
FindBubbleGEM_1:
		move.w     6(a7),d0
		addq.w     #8,a7
		rts

	.globl Aev_GetAckBubbleGEM
Aev_GetAckBubbleGEM:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		move.l     a0,-(a7)
		bsr        FindBubbleGEM
		movea.l    (a7)+,a0
		cmp.w      2(a0),d0
		bne.s      Aev_GetAckBubbleGEM_1
		bsr        CreateBubbleString
		tst.w      d0
		beq.s      Aev_GetAckBubbleGEM_2
		movea.l    (a7),a0
		movea.l    6(a0),a0
		cmpa.l     bubble_string,a0
		bne.s      Aev_GetAckBubbleGEM_2
		movea.l    bubble_string,a0
		clr.b      (a0)
Aev_GetAckBubbleGEM_2:
		moveq.l    #1,d0
		bra.s      Aev_GetAckBubbleGEM_3
Aev_GetAckBubbleGEM_1:
		clr.w      d0
Aev_GetAckBubbleGEM_3:
		addq.w     #8,a7
		rts

	.globl Aev_GetRequestBubbleGEM
Aev_GetRequestBubbleGEM:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.w     6(a0),d1
		movea.l    (a7),a0
		move.w     4(a0),d0
		movea.l    (a7),a0
		movea.l    12(a0),a0
		jsr        Awi_bubblegem
		addq.w     #4,a7
		rts

	.globl Aev_ShowBubbleGEM
Aev_ShowBubbleGEM:
		lea.l      -30(a7),a7
		move.l     a0,26(a7)
		move.w     d0,24(a7)
		move.w     d1,22(a7)
		movea.l    26(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      Aev_ShowBubbleGEM_1
		moveq.l    #1,d0
		bra        Aev_ShowBubbleGEM_2
Aev_ShowBubbleGEM_1:
		bsr        FindBubbleGEM
		move.w     d0,20(a7)
		move.w     20(a7),d0
		bmi        Aev_ShowBubbleGEM_3
		movea.l    ACSblk,a0
		move.w     20(a7),d0
		cmp.w      (a0),d0
		beq        Aev_ShowBubbleGEM_3
		bsr        CreateBubbleString
		tst.w      d0
		bne.s      Aev_ShowBubbleGEM_4
		clr.w      d0
		bra        Aev_ShowBubbleGEM_2
Aev_ShowBubbleGEM_4:
		movea.l    26(a7),a0
		jsr        strlen
		move.l     d0,16(a7)
		cmpi.l     #$000000FF,16(a7)
		ble.s      Aev_ShowBubbleGEM_5
		move.l     #$000000FF,16(a7)
Aev_ShowBubbleGEM_5:
		move.w     18(a7),d0
		ext.l      d0
		movea.l    26(a7),a1
		movea.l    bubble_string,a0
		jsr        strncpy
		move.w     18(a7),d0
		movea.l    bubble_string,a0
		clr.b      0(a0,d0.w)
		move.w     #$BABB,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		clr.w      4(a7)
		move.w     24(a7),d0
		bmi.s      Aev_ShowBubbleGEM_6
		move.w     24(a7),d0
		bra.s      Aev_ShowBubbleGEM_7
Aev_ShowBubbleGEM_6:
		movea.l    ACSblk,a0
		move.w     610(a0),d0
Aev_ShowBubbleGEM_7:
		move.w     d0,6(a7)
		move.w     22(a7),d0
		bmi.s      Aev_ShowBubbleGEM_8
		move.w     22(a7),d0
		bra.s      Aev_ShowBubbleGEM_9
Aev_ShowBubbleGEM_8:
		movea.l    ACSblk,a0
		move.w     612(a0),d0
Aev_ShowBubbleGEM_9:
		move.w     d0,8(a7)
		jsr        A_isModDia
		tst.w      d0
		beq.s      Aev_ShowBubbleGEM_10
		moveq.l    #1,d0
		bra.s      Aev_ShowBubbleGEM_11
Aev_ShowBubbleGEM_10:
		clr.w      d0
Aev_ShowBubbleGEM_11:
		move.w     d0,14(a7)
		move.l     bubble_string,10(a7)
		moveq.l    #-1,d2
		suba.l     a1,a1
		lea.l      (a7),a0
		moveq.l    #4,d1
		move.w     20(a7),d0
		jsr        Aev_SendMsg
		tst.w      d0
		beq.s      Aev_ShowBubbleGEM_12
		moveq.l    #1,d0
		bra.s      Aev_ShowBubbleGEM_13
Aev_ShowBubbleGEM_12:
		clr.w      d0
Aev_ShowBubbleGEM_13:
		bra.s      Aev_ShowBubbleGEM_2
Aev_ShowBubbleGEM_3:
		clr.w      d0
Aev_ShowBubbleGEM_2:
		lea.l      30(a7),a7
		rts

	.data

bubble_string:
		dc.w $0000
		dc.w $0000
phase:
		dc.w $ffff
xe1a94:
		dc.b 'BUBBLE  ',0
xe1a9d:
		dc.b 'BUBBLEGEM',0
xe1aa7:
		dc.b $00
xe1aa8:
		dc.b 'BUBBLE  ',0
		.even
