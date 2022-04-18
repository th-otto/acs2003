	.text

	.globl INMsgService
INMsgService:
		move.l     globProtData,d0
		bne.s      INMsgService_1
		jsr        Alu_create
		move.l     a0,globProtData
		move.l     globProtData,d0
		bne.s      INMsgService_2
		moveq.l    #-1,d0
		rts
INMsgService_2:
		movea.l    globProtData,a0
		move.l     #Ax_glfree,4(a0)
INMsgService_1:
		lea.l      P2IntCmp,a1
		moveq.l    #14,d1
		move.w     MsgListeLen,d0
		ext.l      d0
		lea.l      MsgListe,a0
		jsr        qsort
		clr.w      d0
		rts

	.globl TRMsgService
TRMsgService:
		move.l     globProtData,d0
		beq.s      TRMsgService_1
		movea.l    globProtData,a0
		jsr        Alu_delete
TRMsgService_1:
		clr.l      globProtData
		rts

P2IntCmp:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		move.w     (a0),d0
		movea.l    (a7),a0
		sub.w      (a0),d0
		addq.w     #8,a7
		rts

	.globl Aev_message
Aev_message:
		move.l     a2,-(a7)
		lea.l      -40(a7),a7
		move.l     a0,36(a7)
		move.w     #$0001,(a7)
		jsr        Awi_root
		move.l     a0,d0
		bne.s      Aev_message_1
		clr.w      d0
		bra        Aev_message_2
Aev_message_1:
		movea.l    ACSblk,a0
		move.l     680(a0),d0
		beq.s      Aev_message_3
		movea.l    36(a7),a0
		movea.l    ACSblk,a1
		movea.l    680(a1),a1
		jsr        (a1)
Aev_message_3:
		movea.l    36(a7),a0
		cmpi.w     #$0029,(a0)
		bne.s      Aev_message_4
		suba.l     a0,a0
		jsr        Aev_GetAcClose
		bra        Aev_message_2
Aev_message_4:
		pea.l      P2IntCmp(pc)
		moveq.l    #14,d1
		move.w     MsgListeLen,d0
		ext.l      d0
		lea.l      MsgListe,a1
		movea.l    40(a7),a0
		jsr        bsearch
		addq.w     #4,a7
		move.l     a0,32(a7)
		move.l     32(a7),d0
		beq        Aev_message_5
		moveq.l    #30,d1
		clr.w      d0
		lea.l      2(a7),a0
		jsr        memset
		move.l     36(a7),2(a7)
		movea.l    32(a7),a0
		move.b     11(a0),d0
		ext.w      d0
		subq.w     #1,d0
		beq.s      Aev_message_6
		subq.w     #1,d0
		beq.s      Aev_message_7
		bra.s      Aev_message_8
Aev_message_6:
		jsr        Awi_ontop
		move.l     a0,14(a7)
		bra.s      Aev_message_9
Aev_message_7:
		pea.l      28(a7)
		pea.l      30(a7)
		pea.l      30(a7)
		pea.l      30(a7)
		lea.l      30(a7),a1
		movea.l    52(a7),a0
		jsr        dd_find_dest
		lea.l      16(a7),a7
		move.w     d0,(a7)
		bra.s      Aev_message_9
Aev_message_8:
		clr.l      14(a7)
Aev_message_9:
		move.l     14(a7),d0
		bne.s      Aev_message_10
		movea.l    32(a7),a0
		move.b     6(a0),d0
		bmi.s      Aev_message_10
		movea.l    32(a7),a0
		move.b     6(a0),d0
		ext.w      d0
		ext.l      d0
		add.l      d0,d0
		movea.l    36(a7),a0
		move.w     0(a0,d0.l),d0
		bmi.s      Aev_message_10
		movea.l    32(a7),a0
		move.b     6(a0),d1
		ext.w      d1
		ext.l      d1
		add.l      d1,d1
		movea.l    36(a7),a0
		move.w     0(a0,d1.l),d0
		jsr        Awi_wid
		move.l     a0,14(a7)
		move.l     14(a7),d0
		bne.s      Aev_message_11
		clr.w      d0
		bra        Aev_message_2
Aev_message_11:
		moveq.l    #2,d0
		movea.l    14(a7),a0
		and.w      86(a0),d0
		bne.s      Aev_message_12
		movea.l    36(a7),a0
		cmpi.w     #$0015,(a0)
		bne.s      Aev_message_13
Aev_message_12:
		jsr        Awi_diaend
Aev_message_13:
		bra.s      Aev_message_14
Aev_message_10:
		move.l     14(a7),d0
		bne.s      Aev_message_14
		jsr        Awi_root
		move.l     a0,14(a7)
Aev_message_14:
		movea.l    32(a7),a0
		move.b     7(a0),d0
		bmi.s      Aev_message_15
		movea.l    32(a7),a0
		move.b     7(a0),d0
		ext.w      d0
		ext.l      d0
		add.l      d0,d0
		movea.l    36(a7),a0
		move.w     0(a0,d0.l),d0
		bra.s      Aev_message_16
Aev_message_15:
		movea.l    ACSblk,a0
		move.w     8(a0),d0
Aev_message_16:
		move.w     d0,6(a7)
		movea.l    32(a7),a0
		move.b     8(a0),d0
		bmi.s      Aev_message_17
		movea.l    32(a7),a0
		move.b     8(a0),d0
		ext.w      d0
		ext.l      d0
		add.l      d0,d0
		movea.l    36(a7),a0
		move.w     0(a0,d0.l),d0
		bra.s      Aev_message_18
Aev_message_17:
		movea.l    ACSblk,a0
		move.w     10(a0),d0
Aev_message_18:
		move.w     d0,8(a7)
		movea.l    32(a7),a0
		move.b     9(a0),d0
		bmi.s      Aev_message_19
		movea.l    32(a7),a0
		move.b     9(a0),d0
		ext.w      d0
		ext.l      d0
		add.l      d0,d0
		movea.l    36(a7),a0
		move.w     0(a0,d0.l),d0
		bra.s      Aev_message_20
Aev_message_19:
		movea.l    ACSblk,a0
		move.w     12(a0),d0
Aev_message_20:
		move.w     d0,10(a7)
		movea.l    32(a7),a0
		move.b     10(a0),d0
		bmi.s      Aev_message_21
		movea.l    32(a7),a0
		move.b     10(a0),d0
		ext.w      d0
		ext.l      d0
		add.l      d0,d0
		movea.l    36(a7),a0
		move.w     0(a0,d0.l),d0
		bra.s      Aev_message_22
Aev_message_21:
		movea.l    ACSblk,a0
		move.w     14(a0),d0
Aev_message_22:
		move.w     d0,12(a7)
		movea.l    32(a7),a0
		move.w     12(a0),d0
		bmi.s      Aev_message_23
		movea.l    32(a7),a0
		move.w     12(a0),d0
		ext.l      d0
		add.l      d0,d0
		movea.l    36(a7),a0
		move.w     0(a0,d0.l),30(a7)
		bra.s      Aev_message_24
Aev_message_23:
		clr.w      30(a7)
Aev_message_24:
		movea.l    32(a7),a0
		move.l     2(a0),d0
		beq.s      Aev_message_25
		move.w     (a7),d0
		beq.s      Aev_message_25
		lea.l      2(a7),a0
		movea.l    32(a7),a1
		movea.l    2(a1),a1
		jsr        (a1)
		move.w     d0,(a7)
		bra.s      Aev_message_26
Aev_message_25:
		move.w     #$0001,(a7)
Aev_message_26:
		bra.s      Aev_message_27
Aev_message_5:
		jsr        Awi_root
		move.l     a0,14(a7)
		movea.l    36(a7),a1
		moveq.l    #27,d0
		movea.l    14(a7),a0
		movea.l    14(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		move.w     d0,(a7)
Aev_message_27:
		jsr        Awi_diastart
		move.w     (a7),d0
Aev_message_2:
		lea.l      40(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_CmpMsgInList
Aev_CmpMsgInList:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.l     a1,2(a7)
		movea.l    6(a7),a0
		move.w     (a0),d0
		movea.l    2(a7),a0
		cmp.w      (a0),d0
		beq.s      Aev_CmpMsgInList_1
		clr.w      d0
		bra.s      Aev_CmpMsgInList_2
Aev_CmpMsgInList_1:
		clr.w      (a7)
		bra.s      Aev_CmpMsgInList_3
Aev_CmpMsgInList_5:
		move.w     (a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    6(a7),a0
		move.l     4(a0,d0.l),d0
		beq.s      Aev_CmpMsgInList_4
		move.w     (a7),d0
		ext.l      d0
		add.l      d0,d0
		movea.l    2(a7),a0
		move.w     10(a0,d0.l),d0
		move.w     (a7),d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    6(a7),a0
		movea.l    4(a0,d1.l),a0
		cmp.w      (a0),d0
		beq.s      Aev_CmpMsgInList_4
		clr.w      d0
		bra.s      Aev_CmpMsgInList_2
Aev_CmpMsgInList_4:
		addq.w     #1,(a7)
Aev_CmpMsgInList_3:
		cmpi.w     #$0008,(a7)
		blt.s      Aev_CmpMsgInList_5
		moveq.l    #1,d0
Aev_CmpMsgInList_2:
		lea.l      10(a7),a7
		rts

	.globl Aev_CmpDestID
Aev_CmpDestID:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		move.w     (a0),d0
		movea.l    (a7),a0
		cmp.w      (a0),d0
		bne.s      Aev_CmpDestID_1
		moveq.l    #1,d0
		bra.s      Aev_CmpDestID_2
Aev_CmpDestID_1:
		clr.w      d0
Aev_CmpDestID_2:
		addq.w     #8,a7
		rts

	.globl Aev_SendMsg
Aev_SendMsg:
		move.l     a2,-(a7)
		lea.l      -20(a7),a7
		move.w     d0,18(a7)
		move.w     d1,16(a7)
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		move.w     d2,6(a7)
		clr.w      (a7)
		movea.l    ACSblk,a0
		movea.l    12(a7),a1
		move.w     (a0),2(a1)
		movea.l    _globl,a1
		movea.l    12(a7),a0
		moveq.l    #16,d1
		move.w     18(a7),d0
		jsr        mt_appl_write
		tst.w      d0
		beq.s      Aev_SendMsg_1
		moveq.l    #1,d0
		bra.s      Aev_SendMsg_2
Aev_SendMsg_1:
		clr.w      d0
Aev_SendMsg_2:
		move.w     d0,(a7)
		move.w     (a7),d0
		beq        Aev_SendMsg_3
		move.w     6(a7),d0
		bmi        Aev_SendMsg_3
		move.l     8(a7),d0
		beq        Aev_SendMsg_3
		moveq.l    #26,d0
		jsr        Ax_malloc
		move.l     a0,2(a7)
		move.l     2(a7),d0
		bne.s      Aev_SendMsg_4
		clr.w      d0
		bra.s      Aev_SendMsg_5
Aev_SendMsg_4:
		movea.l    2(a7),a0
		move.w     18(a7),(a0)
		movea.l    2(a7),a0
		move.l     8(a7),2(a0)
		movea.l    2(a7),a0
		move.w     6(a7),6(a0)
		movea.l    2(a7),a0
		move.w     16(a7),8(a0)
		moveq.l    #16,d0
		movea.l    12(a7),a1
		movea.l    2(a7),a0
		lea.l      10(a0),a0
		jsr        memcpy
		movea.l    2(a7),a1
		movea.l    SentMsg,a0
		movea.l    SentMsg,a2
		movea.l    12(a2),a2
		jsr        (a2)
		subq.w     #1,d0
		beq.s      Aev_SendMsg_3
		movea.l    12(a7),a1
		moveq.l    #4,d0
		movea.l    8(a7),a0
		movea.l    8(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
Aev_SendMsg_3:
		move.w     (a7),d0
Aev_SendMsg_5:
		lea.l      20(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_SendMsg2all
Aev_SendMsg2all:
		move.l     a2,-(a7)
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		move.w     8(a0),d0
		bmi.s      Aev_SendMsg2all_1
		movea.l    4(a7),a0
		move.w     8(a0),d2
		movea.l    4(a7),a0
		movea.l    4(a0),a1
		movea.l    4(a7),a0
		movea.l    (a0),a0
		movea.l    4(a7),a2
		move.w     10(a2),d1
		movea.l    (a7),a2
		move.w     (a2),d0
		bsr        Aev_SendMsg
		bra.s      Aev_SendMsg2all_2
Aev_SendMsg2all_1:
		movea.l    _globl,a1
		movea.l    4(a7),a0
		movea.l    (a0),a0
		moveq.l    #16,d1
		movea.l    (a7),a2
		move.w     (a2),d0
		jsr        mt_appl_write
Aev_SendMsg2all_2:
		addq.w     #8,a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_SendAllMsg
Aev_SendAllMsg:
		move.l     a2,-(a7)
		lea.l      -24(a7),a7
		move.l     a0,20(a7)
		move.w     d0,18(a7)
		move.l     a1,14(a7)
		move.w     d1,12(a7)
		move.l     20(a7),(a7)
		move.l     14(a7),4(a7)
		move.w     12(a7),8(a7)
		move.w     18(a7),10(a7)
		pea.l      Aev_SendMsg2all(pc)
		clr.l      -(a7)
		lea.l      8(a7),a1
		movea.l    ListOfApps,a0
		movea.l    ListOfApps,a2
		movea.l    64(a2),a2
		jsr        (a2)
		addq.w     #8,a7
		moveq.l    #1,d0
		lea.l      24(a7),a7
		movea.l    (a7)+,a2
		rts

DDCmpIDs:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a0
		move.w     (a0),d0
		movea.l    4(a7),a0
		cmp.w      (a0),d0
		bne.s      DDCmpIDs_1
		moveq.l    #1,d0
		bra.s      DDCmpIDs_2
DDCmpIDs_1:
		clr.w      d0
DDCmpIDs_2:
		addq.w     #8,a7
		rts

	.globl Aev_DDSearch
Aev_DDSearch:
		move.l     a2,-(a7)
		subq.w     #8,a7
		move.w     d0,6(a7)
		move.w     6(a7),4(a7)
		pea.l      DDCmpIDs(pc)
		lea.l      8(a7),a1
		movea.l    ListOfApps,a0
		movea.l    ListOfApps,a2
		movea.l    32(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		addq.w     #8,a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_DDAdd
Aev_DDAdd:
		move.l     a2,-(a7)
		lea.l      -16(a7),a7
		move.w     d0,14(a7)
		move.w     d1,12(a7)
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		cmpi.w     #$0002,12(a7)
		beq.s      Aev_DDAdd_1
		cmpi.w     #$0004,12(a7)
		beq.s      Aev_DDAdd_1
		clr.w      d0
		bra        Aev_DDAdd_2
Aev_DDAdd_1:
		move.w     14(a7),d0
		bsr.w      Aev_DDSearch
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Aev_DDAdd_3
		moveq.l    #36,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Aev_DDAdd_4
		clr.w      d0
		bra        Aev_DDAdd_2
Aev_DDAdd_4:
		moveq.l    #36,d1
		clr.w      d0
		movea.l    (a7),a0
		jsr        memset
		movea.l    (a7),a0
		move.w     14(a7),(a0)
		movea.l    (a7),a1
		movea.l    ListOfApps,a0
		movea.l    ListOfApps,a2
		movea.l    12(a2),a2
		jsr        (a2)
		tst.w      d0
		bne.s      Aev_DDAdd_3
		moveq.l    #36,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		clr.w      d0
		bra.s      Aev_DDAdd_2
Aev_DDAdd_3:
		move.w     12(a7),d0
		subq.w     #2,d0
		beq.s      Aev_DDAdd_5
		subq.w     #2,d0
		beq.s      Aev_DDAdd_6
		bra.s      Aev_DDAdd_7
Aev_DDAdd_5:
		movea.l    (a7),a0
		ori.l      #$00000002,2(a0)
		movea.l    8(a7),a0
		movea.l    (a7),a1
		move.w     (a0),6(a1)
		movea.l    (a7),a0
		move.l     4(a7),8(a0)
		bra.s      Aev_DDAdd_7
Aev_DDAdd_6:
		movea.l    (a7),a0
		ori.l      #$00000004,2(a0)
		moveq.l    #6,d0
		movea.l    8(a7),a1
		movea.l    (a7),a0
		lea.l      12(a0),a0
		jsr        memcpy
		movea.l    (a7),a0
		move.l     4(a7),18(a0)
		nop
Aev_DDAdd_7:
		moveq.l    #1,d0
Aev_DDAdd_2:
		lea.l      16(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_DDDelete
Aev_DDDelete:
		move.l     a2,-(a7)
		subq.w     #2,a7
		move.w     d0,(a7)
		pea.l      DDCmpIDs(pc)
		lea.l      4(a7),a1
		movea.l    ListOfApps,a0
		movea.l    ListOfApps,a2
		movea.l    24(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		moveq.l    #1,d1
		cmp.l      d0,d1
		bne.s      Aev_DDDelete_1
		moveq.l    #1,d0
		bra.s      Aev_DDDelete_2
Aev_DDDelete_1:
		clr.w      d0
Aev_DDDelete_2:
		addq.w     #2,a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_DDRemove
Aev_DDRemove:
		subq.w     #4,a7
		move.l     a0,(a7)
		moveq.l    #2,d0
		movea.l    (a7),a0
		and.l      2(a0),d0
		beq.s      Aev_DDRemove_1
		moveq.l    #-1,d1
		suba.l     a0,a0
		movea.l    (a7),a1
		move.w     (a1),d0
		jsr        Aev_AccExit
Aev_DDRemove_1:
		moveq.l    #4,d0
		movea.l    (a7),a0
		and.l      2(a0),d0
		beq.s      Aev_DDRemove_2
		moveq.l    #-1,d1
		suba.l     a0,a0
		movea.l    (a7),a1
		move.w     (a1),d0
		jsr        Aev_AvExit
Aev_DDRemove_2:
		movea.l    (a7),a0
		lea.l      22(a0),a0
		jsr        XAccDataDelete
		movea.l    (a7),a0
		movea.l    32(a0),a0
		jsr        VaDataDelete
		moveq.l    #36,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		moveq.l    #1,d0
		addq.w     #4,a7
		rts

Ash_chkDDtype:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		cmpi.w     #$0002,(a0)
		beq.s      Ash_chkDDtype_1
		movea.l    4(a7),a0
		cmpi.w     #$0004,(a0)
		bne.s      Ash_chkDDtype_2
Ash_chkDDtype_1:
		movea.l    (a7),a0
		move.w     4(a0),d0
		movea.l    4(a7),a0
		and.w      (a0),d0
		bra.s      Ash_chkDDtype_3
Ash_chkDDtype_2:
		clr.w      d0
Ash_chkDDtype_3:
		addq.w     #8,a7
		rts

	.globl Ash_sendall
Ash_sendall:
		move.l     a2,-(a7)
		lea.l      -24(a7),a7
		move.l     a0,20(a7)
		move.l     d0,16(a7)
		move.l     16(a7),d0
		bpl        Ash_sendall_1
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0400,(a0)
		bge.s      Ash_sendall_2
		cmpi.w     #$0200,_ACSv_magix
		blt.s      Ash_sendall_1
Ash_sendall_2:
		move.l     _globl,-(a7)
		pea.l      14(a7)
		lea.l      20(a7),a1
		lea.l      8(a7),a0
		clr.w      d0
		jsr        mt_appl_search
		addq.w     #8,a7
		move.w     d0,14(a7)
		bra.s      Ash_sendall_3
Ash_sendall_6:
		moveq.l    #6,d0
		and.w      12(a7),d0
		beq.s      Ash_sendall_4
		movea.l    _globl,a1
		movea.l    20(a7),a0
		moveq.l    #16,d1
		move.w     10(a7),d0
		jsr        mt_appl_write
		tst.w      d0
		bne.s      Ash_sendall_4
		clr.w      d0
		bra.s      Ash_sendall_5
Ash_sendall_4:
		move.l     _globl,-(a7)
		pea.l      14(a7)
		lea.l      20(a7),a1
		lea.l      8(a7),a0
		moveq.l    #1,d0
		jsr        mt_appl_search
		addq.w     #8,a7
		move.w     d0,14(a7)
Ash_sendall_3:
		move.w     14(a7),d0
		bne.s      Ash_sendall_6
		bra.s      Ash_sendall_7
Ash_sendall_1:
		pea.l      Aev_SendMsg2all(pc)
		pea.l      Ash_chkDDtype(pc)
		lea.l      24(a7),a1
		movea.l    ListOfApps,a0
		movea.l    ListOfApps,a2
		movea.l    64(a2),a2
		jsr        (a2)
		addq.w     #8,a7
Ash_sendall_7:
		moveq.l    #1,d0
Ash_sendall_5:
		lea.l      24(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Ash_nextdd
Ash_nextdd:
		subq.w     #4,a7
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Ash_nextdd_1
		movea.l    ListOfApps,a0
		movea.l    ListOfApps,a1
		movea.l    36(a1),a1
		jsr        (a1)
		bra.s      Ash_nextdd_2
		bra.s      Ash_nextdd_2
Ash_nextdd_1:
		moveq.l    #1,d1
		moveq.l    #1,d0
		movea.l    ListOfApps,a0
		movea.l    ListOfApps,a1
		movea.l    52(a1),a1
		jsr        (a1)
		nop
Ash_nextdd_2:
		addq.w     #4,a7
		rts

dd_exec:
		move.l     a2,-(a7)
		lea.l      -36(a7),a7
		move.l     a0,30(a7)
		move.l     a1,26(a7)
		move.w     d0,24(a7)
		move.l     30(a7),d0
		bne.s      dd_exec_1
		bra        dd_exec_2
dd_exec_1:
		move.l     44(a7),d0
		beq.s      dd_exec_3
		movea.l    44(a7),a0
		move.l     4(a0),d0
		bne.s      dd_exec_4
dd_exec_3:
		move.w     24(a7),d0
		bmi.s      dd_exec_4
		bra        dd_exec_2
dd_exec_4:
		jsr        Adr_unselect
		lea.l      (a7),a0
		jsr        Act_save
		movea.l    ACSblk,a0
		move.l     30(a7),600(a0)
		movea.l    ACSblk,a0
		move.w     24(a7),608(a0)
		movea.l    ACSblk,a0
		move.l     26(a7),604(a0)
		moveq.l    #2,d0
		lea.l      _WDD,a0
		jsr        Adr_add
		movea.l    26(a7),a0
		move.w     8(a0),d0
		and.w      #$0800,d0
		bne.s      dd_exec_5
		moveq.l    #1,d1
		movea.l    26(a7),a0
		or.w       10(a0),d1
		move.w     24(a7),d0
		movea.l    30(a7),a0
		movea.l    30(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
dd_exec_5:
		move.w     24(a7),d0
		bpl.s      dd_exec_6
		move.w     #$0001,34(a7)
		lea.l      34(a7),a1
		moveq.l    #17,d0
		movea.l    30(a7),a0
		movea.l    30(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		move.w     34(a7),d0
		beq.s      dd_exec_7
		suba.l     a1,a1
		moveq.l    #16,d0
		movea.l    30(a7),a0
		movea.l    30(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
dd_exec_7:
		bra.s      dd_exec_8
dd_exec_6:
		movea.l    44(a7),a0
		movea.l    4(a0),a0
		jsr        (a0)
dd_exec_8:
		movea.l    26(a7),a0
		move.w     10(a0),d1
		and.w      #$FFFE,d1
		move.w     24(a7),d0
		movea.l    30(a7),a0
		movea.l    30(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
		jsr        Adr_unselect
		lea.l      (a7),a0
		jsr        Act_restore
dd_exec_2:
		lea.l      36(a7),a7
		movea.l    (a7)+,a2
		rts

dd_find_dest:
		lea.l      -36(a7),a7
		move.l     a0,32(a7)
		move.l     a1,28(a7)
		jsr        Awi_root
		move.l     a0,16(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		pea.l      36(a7)
		moveq.l    #10,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    32(a7),a0
		cmpi.w     #$003F,(a0)
		bne.s      dd_find_dest_1
		movea.l    32(a7),a0
		move.w     8(a0),22(a7)
		movea.l    32(a7),a0
		move.w     10(a0),20(a7)
		bra.s      dd_find_dest_2
dd_find_dest_1:
		movea.l    ACSblk,a0
		move.w     610(a0),22(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),20(a7)
dd_find_dest_2:
		movea.l    32(a7),a0
		cmpi.w     #$003F,(a0)
		bne.s      dd_find_dest_3
		movea.l    32(a7),a0
		move.w     6(a0),d0
		jsr        Awi_wid
		bra.s      dd_find_dest_4
dd_find_dest_3:
		movea.l    _globl,a0
		move.w     20(a7),d1
		move.w     22(a7),d0
		jsr        mt_wind_find
		jsr        Awi_wid
dd_find_dest_4:
		move.l     a0,12(a7)
		move.l     12(a7),d0
		bne.s      dd_find_dest_5
		movea.l    32(a7),a0
		cmpi.w     #$003F,(a0)
		beq.s      dd_find_dest_5
		jsr        Awi_ontop
		move.l     a0,12(a7)
dd_find_dest_5:
		move.l     12(a7),d0
		bne.s      dd_find_dest_6
		move.l     16(a7),12(a7)
dd_find_dest_6:
		movea.l    12(a7),a0
		move.w     86(a0),d0
		and.w      #$0800,d0
		beq.s      dd_find_dest_7
		clr.w      d0
		bra        dd_find_dest_8
dd_find_dest_7:
		movea.l    12(a7),a0
		move.w     24(a7),d0
		cmp.w      32(a0),d0
		beq.s      dd_find_dest_9
		movea.l    12(a7),a0
		cmpa.l     16(a7),a0
		beq.s      dd_find_dest_9
		movea.l    12(a7),a0
		movea.l    12(a7),a1
		movea.l    110(a1),a1
		jsr        (a1)
		jsr        Aev_mess
dd_find_dest_9:
		movea.l    48(a7),a0
		move.w     #$FFFF,(a0)
		movea.l    40(a7),a0
		clr.l      (a0)
		movea.l    12(a7),a0
		move.l     20(a0),d0
		beq        dd_find_dest_10
		move.w     20(a7),d0
		movea.l    12(a7),a0
		sub.w      54(a0),d0
		move.w     d0,-(a7)
		move.w     24(a7),d2
		movea.l    14(a7),a0
		sub.w      52(a0),d2
		moveq.l    #8,d1
		clr.w      d0
		movea.l    14(a7),a0
		movea.l    20(a0),a0
		jsr        Adr_find
		addq.w     #2,a7
		movea.l    48(a7),a0
		move.w     d0,(a0)
		movea.l    48(a7),a0
		move.w     (a0),d0
		bmi        dd_find_dest_10
		movea.l    48(a7),a0
		move.w     (a0),26(a7)
dd_find_dest_12:
		move.w     26(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    12(a7),a0
		movea.l    20(a0),a0
		adda.l     d0,a0
		move.l     a0,8(a7)
		moveq.l    #32,d0
		movea.l    8(a7),a0
		and.w      8(a0),d0
		bne.s      dd_find_dest_11
		movea.l    8(a7),a0
		move.w     32(a0),d0
		and.w      #$8000,d0
		beq.s      dd_find_dest_11
		movea.l    8(a7),a0
		lea.l      24(a0),a0
		movea.l    40(a7),a1
		move.l     a0,(a1)
		movea.l    40(a7),a0
		movea.l    (a0),a0
		move.l     4(a0),d0
		beq.s      dd_find_dest_11
		movea.l    48(a7),a0
		move.w     26(a7),(a0)
		movea.l    12(a7),a0
		movea.l    44(a7),a1
		move.l     20(a0),(a1)
		bra.s      dd_find_dest_10
dd_find_dest_11:
		move.w     26(a7),d0
		movea.l    12(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_up
		move.w     d0,26(a7)
		addq.w     #1,d0
		bne.w      dd_find_dest_12
dd_find_dest_10:
		movea.l    48(a7),a0
		move.w     (a0),d0
		bpl        dd_find_dest_13
		movea.l    12(a7),a0
		move.l     24(a0),d0
		beq        dd_find_dest_13
		move.w     20(a7),d0
		movea.l    12(a7),a0
		sub.w      54(a0),d0
		move.w     d0,-(a7)
		move.w     24(a7),d2
		movea.l    14(a7),a0
		sub.w      52(a0),d2
		moveq.l    #8,d1
		clr.w      d0
		movea.l    14(a7),a0
		movea.l    24(a0),a0
		jsr        Adr_find
		addq.w     #2,a7
		movea.l    48(a7),a0
		move.w     d0,(a0)
		movea.l    48(a7),a0
		move.w     (a0),d0
		bmi        dd_find_dest_13
		movea.l    48(a7),a0
		move.w     (a0),26(a7)
dd_find_dest_16:
		move.w     26(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    12(a7),a0
		movea.l    24(a0),a0
		adda.l     d0,a0
		move.l     a0,8(a7)
		moveq.l    #32,d0
		movea.l    8(a7),a0
		and.w      8(a0),d0
		bne.s      dd_find_dest_14
		movea.l    8(a7),a0
		move.w     32(a0),d0
		and.w      #$8000,d0
		beq.s      dd_find_dest_14
		movea.l    8(a7),a0
		lea.l      24(a0),a0
		movea.l    40(a7),a1
		move.l     a0,(a1)
		movea.l    40(a7),a0
		movea.l    (a0),a0
		move.l     4(a0),d0
		beq.s      dd_find_dest_14
		movea.l    48(a7),a0
		move.w     26(a7),(a0)
		movea.l    12(a7),a0
		movea.l    44(a7),a1
		move.l     24(a0),(a1)
		bra.s      dd_find_dest_15
dd_find_dest_14:
		move.w     26(a7),d0
		movea.l    12(a7),a0
		movea.l    24(a0),a0
		jsr        Aob_up
		move.w     d0,26(a7)
		addq.w     #1,d0
		bne.w      dd_find_dest_16
dd_find_dest_15:
		movea.l    48(a7),a0
		ori.w      #$1000,(a0)
dd_find_dest_13:
		movea.l    48(a7),a0
		move.w     (a0),d0
		and.w      #$0FFF,d0
		beq.s      dd_find_dest_17
		movea.l    52(a7),a0
		move.w     #$FFFF,(a0)
		bra        dd_find_dest_18
dd_find_dest_17:
		moveq.l    #-1,d0
		move.w     d0,26(a7)
		movea.l    52(a7),a0
		move.w     d0,(a0)
		bra.s      dd_find_dest_19
dd_find_dest_21:
		movea.l    52(a7),a0
		move.w     (a0),26(a7)
		movea.l    52(a7),a0
		move.w     (a0),d0
		movea.l    12(a7),a0
		movea.l    20(a0),a1
		lea.l      (a7),a0
		jsr        Aob_offset
		move.w     20(a7),d1
		movea.l    12(a7),a0
		sub.w      54(a0),d1
		move.w     22(a7),d0
		movea.l    12(a7),a0
		sub.w      52(a0),d0
		lea.l      (a7),a0
		jsr        Aob_within
		tst.w      d0
		beq.s      dd_find_dest_19
		bra.s      dd_find_dest_20
dd_find_dest_19:
		moveq.l    #8,d1
		movea.l    52(a7),a0
		move.w     (a0),d0
		movea.l    12(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_findflag
		movea.l    52(a7),a0
		move.w     d0,(a0)
		bpl.s      dd_find_dest_21
dd_find_dest_20:
		movea.l    52(a7),a0
		move.w     (a0),d0
		bmi.s      dd_find_dest_18
		movea.l    12(a7),a0
		move.w     28(a0),d0
		movea.l    52(a7),a0
		cmp.w      (a0),d0
		beq.s      dd_find_dest_18
		jsr        Awi_diaend
		movea.l    52(a7),a0
		movea.l    12(a7),a1
		move.w     (a0),28(a1)
		movea.l    12(a7),a0
		move.w     #$FFFF,30(a0)
		jsr        Awi_diastart
dd_find_dest_18:
		movea.l    28(a7),a0
		move.l     12(a7),(a0)
		movea.l    48(a7),a0
		move.w     (a0),d0
		and.w      #$0FFF,d0
		bpl.s      dd_find_dest_22
		clr.w      d0
		bra.s      dd_find_dest_8
		bra.s      dd_find_dest_8
dd_find_dest_22:
		moveq.l    #1,d0
		nop
dd_find_dest_8:
		lea.l      36(a7),a7
		rts

	.globl GetImgIntoObj
GetImgIntoObj:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     a1,10(a7)
		move.w     d0,8(a7)
		clr.w      d0
		lea.l      (a7),a1
		movea.l    14(a7),a0
		jsr        Abp_img2mfdb
		tst.w      d0
		bne.s      GetImgIntoObj_1
		movea.l    $000DF9D4,a0
		lea.l      72(a0),a0
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.w     #$000A,22(a0)
		movea.l    4(a7),a0
		move.l     (a7),12(a0)
		move.l     22(a7),-(a7)
		move.w     12(a7),d0
		movea.l    30(a7),a1
		movea.l    14(a7),a0
		bsr        dd_exec
		addq.w     #4,a7
		movea.l    4(a7),a0
		clr.w      22(a0)
		movea.l    4(a7),a0
		clr.l      12(a0)
		moveq.l    #1,d0
		bra.s      GetImgIntoObj_2
GetImgIntoObj_1:
		clr.w      d0
GetImgIntoObj_2:
		lea.l      18(a7),a7
		rts

	.globl GetTxtIntoObj
GetTxtIntoObj:
		move.l     a2,-(a7)
		lea.l      -1074(a7),a7
		move.l     a0,16(a7)
		move.l     a1,12(a7)
		move.w     d0,10(a7)
		move.w     d1,8(a7)
		movea.l    $000DF9D4,a0
		lea.l      72(a0),a0
		move.l     a0,4(a7)
		move.l     1086(a7),d0
		beq        GetTxtIntoObj_1
		movea.l    1086(a7),a0
		move.l     4(a0),d0
		beq        GetTxtIntoObj_1
		move.w     10(a7),d0
		bmi        GetTxtIntoObj_1
		moveq.l    #4,d0
		lea.l      xe17e8,a1
		movea.l    12(a7),a0
		jsr        strncmp
		tst.w      d0
		bne.w      GetTxtIntoObj_2
		movea.l    16(a7),a0
		jsr        Af_parseCmdLine
		move.l     a0,1044(a7)
		move.l     1044(a7),d0
		beq.s      GetTxtIntoObj_3
		movea.l    1044(a7),a0
		movea.l    1044(a7),a1
		movea.l    36(a1),a1
		jsr        (a1)
		move.l     a0,(a7)
		bra.s      GetTxtIntoObj_4
GetTxtIntoObj_5:
		movea.l    (a7),a1
		lea.l      20(a7),a0
		jsr        Af_quote
		movea.l    4(a7),a0
		move.w     #$0014,22(a0)
		lea.l      20(a7),a0
		movea.l    4(a7),a1
		move.l     a0,12(a1)
		move.l     1086(a7),-(a7)
		move.w     14(a7),d0
		movea.l    1094(a7),a1
		movea.l    1086(a7),a0
		bsr        dd_exec
		addq.w     #4,a7
		moveq.l    #1,d1
		moveq.l    #1,d0
		movea.l    1044(a7),a0
		movea.l    1044(a7),a1
		movea.l    52(a1),a1
		jsr        (a1)
		move.l     a0,(a7)
GetTxtIntoObj_4:
		move.l     (a7),d0
		bne.s      GetTxtIntoObj_5
GetTxtIntoObj_3:
		bra.w      GetTxtIntoObj_6
GetTxtIntoObj_2:
		lea.l      xe17ed,a1
		movea.l    16(a7),a0
		jsr        strpbrk
		move.l     a0,d0
		beq.s      GetTxtIntoObj_7
		movea.l    4(a7),a0
		move.w     #$001F,22(a0)
		bra.s      GetTxtIntoObj_8
GetTxtIntoObj_7:
		lea.l      xe17f0,a1
		movea.l    12(a7),a0
		jsr        strcpy
		move.l     a0,d0
		bne.s      GetTxtIntoObj_9
		movea.l    16(a7),a0
		jsr        Af_length
		moveq.l    #-1,d1
		cmp.l      d0,d1
		ble.s      GetTxtIntoObj_10
GetTxtIntoObj_9:
		movea.l    4(a7),a0
		move.w     #$000B,22(a0)
		bra.s      GetTxtIntoObj_8
GetTxtIntoObj_10:
		movea.l    4(a7),a0
		move.w     #$0014,22(a0)
GetTxtIntoObj_8:
		movea.l    4(a7),a0
		move.l     16(a7),12(a0)
		move.l     1086(a7),-(a7)
		move.w     14(a7),d0
		movea.l    1094(a7),a1
		movea.l    1086(a7),a0
		bsr        dd_exec
		addq.w     #4,a7
GetTxtIntoObj_6:
		movea.l    4(a7),a0
		clr.w      22(a0)
		movea.l    4(a7),a0
		clr.l      12(a0)
		bra        GetTxtIntoObj_11
GetTxtIntoObj_1:
		moveq.l    #4,d0
		lea.l      xe17f8,a1
		movea.l    12(a7),a0
		jsr        strncmp
		tst.w      d0
		bne        GetTxtIntoObj_12
		move.w     #$0001,1072(a7)
		movea.l    16(a7),a0
		jsr        Af_parseCmdLine
		move.l     a0,1044(a7)
		move.l     1044(a7),d0
		beq        GetTxtIntoObj_13
		movea.l    1044(a7),a0
		movea.l    1044(a7),a1
		movea.l    36(a1),a1
		jsr        (a1)
		move.l     a0,(a7)
		bra        GetTxtIntoObj_14
GetTxtIntoObj_16:
		movea.l    (a7),a1
		lea.l      20(a7),a0
		jsr        Af_quote
		movea.l    4(a7),a0
		move.w     #$0014,22(a0)
		lea.l      20(a7),a0
		movea.l    4(a7),a1
		move.l     a0,12(a1)
		jsr        Adr_unselect
		lea.l      1048(a7),a0
		jsr        Act_save
		movea.l    ACSblk,a0
		move.l     1082(a7),600(a0)
		movea.l    ACSblk,a0
		move.w     10(a7),608(a0)
		movea.l    ACSblk,a0
		move.l     1090(a7),604(a0)
		moveq.l    #2,d0
		lea.l      _WDD,a0
		jsr        Adr_add
		lea.l      1072(a7),a1
		moveq.l    #17,d0
		movea.l    1082(a7),a0
		movea.l    1082(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		move.w     1072(a7),d0
		beq.s      GetTxtIntoObj_15
		suba.l     a1,a1
		moveq.l    #16,d0
		movea.l    1082(a7),a0
		movea.l    1082(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
GetTxtIntoObj_15:
		lea.l      1048(a7),a0
		jsr        Act_restore
		moveq.l    #1,d1
		moveq.l    #1,d0
		movea.l    1044(a7),a0
		movea.l    1044(a7),a1
		movea.l    52(a1),a1
		jsr        (a1)
		move.l     a0,(a7)
GetTxtIntoObj_14:
		move.l     (a7),d0
		bne        GetTxtIntoObj_16
GetTxtIntoObj_13:
		bra        GetTxtIntoObj_11
GetTxtIntoObj_12:
		moveq.l    #4,d0
		lea.l      xe17fd,a1
		movea.l    12(a7),a0
		jsr        strncmp
		tst.w      d0
		bne        GetTxtIntoObj_11
		move.w     8(a7),d0
		bmi.s      GetTxtIntoObj_17
		bra.s      GetTxtIntoObj_18
GetTxtIntoObj_20:
		movea.l    16(a7),a0
		cmpi.b     #$1F,(a0)
		ble.s      GetTxtIntoObj_19
		movea.l    16(a7),a0
		move.b     (a0),d0
		ext.w      d0
		movea.l    ACSblk,a0
		move.w     d0,718(a0)
		movea.l    16(a7),a0
		move.b     (a0),d1
		ext.w      d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    1082(a7),a0
		movea.l    1082(a7),a1
		movea.l    98(a1),a1
		jsr        (a1)
GetTxtIntoObj_19:
		addq.l     #1,16(a7)
GetTxtIntoObj_18:
		movea.l    16(a7),a0
		move.b     (a0),d0
		bne.s      GetTxtIntoObj_20
		bra        GetTxtIntoObj_11
GetTxtIntoObj_17:
		bra.w      GetTxtIntoObj_21
GetTxtIntoObj_27:
		movea.l    16(a7),a0
		move.b     (a0),d0
		ext.w      d0
		sub.w      #$0009,d0
		beq.s      GetTxtIntoObj_22
		subq.w     #1,d0
		beq.s      GetTxtIntoObj_23
		subq.w     #3,d0
		beq.s      GetTxtIntoObj_24
		bra.s      GetTxtIntoObj_25
GetTxtIntoObj_24:
		movea.l    ACSblk,a0
		move.w     #$8000,718(a0)
		bra.s      GetTxtIntoObj_26
GetTxtIntoObj_22:
		movea.l    ACSblk,a0
		move.w     #$8009,718(a0)
		bra.s      GetTxtIntoObj_26
GetTxtIntoObj_23:
		movea.l    ACSblk,a0
		move.w     #$800D,718(a0)
		bra.s      GetTxtIntoObj_26
GetTxtIntoObj_25:
		movea.l    16(a7),a0
		move.b     (a0),d0
		ext.w      d0
		movea.l    ACSblk,a0
		move.w     d0,718(a0)
GetTxtIntoObj_26:
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    1082(a7),a0
		movea.l    1082(a7),a1
		movea.l    98(a1),a1
		jsr        (a1)
		addq.l     #1,16(a7)
GetTxtIntoObj_21:
		movea.l    16(a7),a0
		move.b     (a0),d0
		bne        GetTxtIntoObj_27
GetTxtIntoObj_11:
		moveq.l    #1,d0
		lea.l      1074(a7),a7
		movea.l    (a7)+,a2
		rts

	.data

	.globl globProtData
globProtData:
		dc.w $0000
		dc.w $0000
MsgListe:
		dc.w $0400
		dc.l Aev_GetAccID
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0403
		dc.l Aev_GetAccAcc
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0500
		dc.l Aev_GetAccAck
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0502
		dc.l Aev_GetAccKey
		dc.w $ffff
		dc.w $ffff
		dc.w $ff01
		dc.w $ffff
		dc.w $0501
		dc.l Aev_GetAccText
		dc.w $ffff
		dc.w $ffff
		dc.w $ff02
		dc.w $ffff
		dc.w $0504
		dc.l Aev_GetAccImg
		dc.w $ffff
		dc.w $ffff
		dc.w $ff02
		dc.w $ffff
		dc.w $0503
		dc.l Aev_GetAccMeta
		dc.w $ffff
		dc.w $ffff
		dc.w $ff02
		dc.w $ffff
		dc.w $4701
		dc.l Aev_GetVaProtoStatus
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $4736
		dc.l Aev_GetAvExit
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $4711
		dc.l Aev_GetVaStart
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $4738
		dc.l Aev_GetAvStarted
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $4710
		dc.l Aev_GetAvSendKey
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $4709
		dc.l Aev_GetAvSendClick
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $4730
		dc.l Aev_GetVaPathUpdate
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $003f
		dc.l Aev_GetAPDragDrop
		dc.w $03ff
		dc.w $ffff
		dc.w $ff02
		dc.w $ffff
		dc.w $1236
		dc.l Aev_GetOlgaInit
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $4951
		dc.l Aev_GetOleExit
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $4952
		dc.l Aev_GetOleNew
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $1239
		dc.l Aev_GetOlgaAck
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $123f
		dc.l Aev_GetOlgaUpdated
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $1247
		dc.l Aev_GetOlgaGetInfo
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $1249
		dc.l Aev_GetOlgaIdle
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $1255
		dc.l Aev_GetOlgaClientTerminated
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $babc
		dc.l Aev_GetAckBubbleGEM
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $baba
		dc.l Aev_GetRequestBubbleGEM
		dc.w $0304
		dc.w $0504
		dc.w $0500
		dc.w $ffff
		dc.w $1350
		dc.l Aev_GetGSRequest
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $1354
		dc.l Aev_GetGSQuit
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $1352
		dc.l Aev_GetGSCommand
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $1353
		dc.l Aev_GetGSAck
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0402
		dc.l Aev_GetAcReply
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $dadd
		dc.l Aev_GetDhstAdd
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $dade
		dc.l Aev_GetDhstAck
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $000a
		dc.l Aev_GetMnSelected
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0014
		dc.l Aev_GetWmRedraw
		dc.w $0304
		dc.w $0506
		dc.w $0700
		dc.w $ffff
		dc.w $0015
		dc.l Aev_GetWmTopped
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0016
		dc.l Aev_GetWmClosed
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0017
		dc.l Aev_GetWmFulled
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0018
		dc.l Aev_GetWmArrowed
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0019
		dc.l Aev_GetWmHSlid
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $001a
		dc.l Aev_GetWmVSlid
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $001b
		dc.l Aev_GetWmSized
		dc.w $0304
		dc.w $0506
		dc.w $0700
		dc.w $ffff
		dc.w $001c
		dc.l Aev_GetWmMoved
		dc.w $0304
		dc.w $0506
		dc.w $0700
		dc.w $ffff
		dc.w $0064
		dc.l Aev_GetWmBottomed
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0021
		dc.l Aev_GetWmBottomed
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $001f
		dc.l Aev_GetWmOnTop
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $001e
		dc.l Aev_GetWmUnTopped
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $001d
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0020
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $5758
		dc.l Aev_GetWmShaded
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $5759
		dc.l Aev_GetWmUnshaded
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0930
		dc.l Aev_GetWmMouseWheel
		dc.w $0305
		dc.w $06ff
		dc.w $ff00
		dc.w $0004
		dc.w $0025
		dc.l Aev_GetWmToolbar
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0032
		dc.l Aev_GetApTerm
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0050
		dc.l Aev_GetScChanged
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0053
		dc.l Aev_GetFntChanged
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0052
		dc.l Aev_GetPrnChanged
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0054
		dc.l Aev_GetColorsChanged
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0028
		dc.l Aev_GetAcOpen
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0029
		dc.l Aev_GetAcClose
		dc.w $ffff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0022
		dc.l Aev_GetWmIconify
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0024
		dc.l Aev_GetWmAllIconify
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
		dc.w $0023
		dc.l Aev_GetWmUnIconify
		dc.w $03ff
		dc.w $ffff
		dc.w $ff00
		dc.w $ffff
MsgListeLen:
		dc.w $003e
xe17e8:
		dc.b 'ARGS',0
xe17ed:
		dc.b $0a,$0d,0
xe17f0:
		dc.b 'XAccTxt',0
xe17f8:
		dc.b 'ARGS',0
xe17fd:
		dc.b '.TXT',0
