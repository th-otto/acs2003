	.globl Aev_InitVA
Aev_InitVA:
		lea.l      -16(a7),a7
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		beq        Aev_InitVA_1
		lea.l      xe19fc,a0
		jsr        Ash_getenv
		move.l     a0,10(a7)
		move.w     #$FFFF,14(a7)
		move.l     10(a7),d0
		beq.s      Aev_InitVA_2
		moveq.l    #8,d0
		movea.l    10(a7),a1
		lea.l      (a7),a0
		jsr        strncpy
		moveq.l    #8,d0
		lea.l      (a7),a0
		jsr        Ast_adl
		movea.l    _globl,a1
		lea.l      (a7),a0
		jsr        mt_appl_find
		move.w     d0,14(a7)
Aev_InitVA_2:
		move.w     14(a7),d0
		bpl.s      Aev_InitVA_3
		movea.l    _globl,a1
		lea.l      xe1a05,a0
		jsr        mt_appl_find
		move.w     d0,14(a7)
		bpl.s      Aev_InitVA_3
		movea.l    _globl,a1
		lea.l      xe1a0e,a0
		jsr        mt_appl_find
		move.w     d0,14(a7)
		bpl.s      Aev_InitVA_3
		movea.l    _globl,a1
		lea.l      xe1a17,a0
		jsr        mt_appl_find
		move.w     d0,14(a7)
		bpl.s      Aev_InitVA_3
		movea.l    _globl,a1
		lea.l      xe1a20,a0
		jsr        mt_appl_find
		move.w     d0,14(a7)
		bmi.s      Aev_InitVA_1
Aev_InitVA_3:
		clr.w      d1
		suba.l     a0,a0
		move.w     14(a7),d0
		jsr        Aev_AvProtokoll
Aev_InitVA_1:
		moveq.l    #1,d0
		lea.l      16(a7),a7
		rts

	.globl Aev_ExitVA
Aev_ExitVA:
		moveq.l    #1,d0
		rts

	.globl VaDataDelete
VaDataDelete:
		rts

	.globl Aev_GetAvExit
Aev_GetAvExit:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		movea.l    8(a7),a0
		move.l     (a0),4(a7)
		movea.l    4(a7),a0
		move.w     2(a0),d0
		jsr        Aev_DDSearch
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Aev_GetAvExit_1
		moveq.l    #-5,d0
		movea.l    (a7),a0
		and.l      2(a0),d0
		beq.s      Aev_GetAvExit_2
		movea.l    (a7),a0
		andi.l     #$FFFFFFFB,2(a0)
		bra.s      Aev_GetAvExit_1
Aev_GetAvExit_2:
		movea.l    4(a7),a0
		move.w     2(a0),d0
		jsr        Aev_DDDelete
Aev_GetAvExit_1:
		moveq.l    #1,d0
		lea.l      12(a7),a7
		rts

	.globl Aev_GetVaProtoStatus
Aev_GetVaProtoStatus:
		move.l     a2,-(a7)
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		movea.l    8(a7),a0
		move.l     (a0),4(a7)
		movea.l    4(a7),a0
		move.l     12(a0),(a7)
		clr.w      d1
		moveq.l    #-1,d0
		movea.l    (a7),a0
		jsr        Ax_memCheck
		tst.w      d0
		beq.s      Aev_GetVaProtoStatus_1
		movea.l    (a7),a1
		movea.l    4(a7),a0
		addq.w     #6,a0
		moveq.l    #4,d1
		movea.l    4(a7),a2
		move.w     2(a2),d0
		jsr        Aev_DDAdd
		bra.s      Aev_GetVaProtoStatus_2
		bra.s      Aev_GetVaProtoStatus_2
Aev_GetVaProtoStatus_1:
		clr.w      d0
		nop
Aev_GetVaProtoStatus_2:
		lea.l      12(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetVaStart
Aev_GetVaStart:
		move.l     a2,-(a7)
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		movea.l    10(a7),a0
		move.l     (a0),6(a7)
		movea.l    6(a7),a0
		move.l     6(a0),2(a7)
		move.l     2(a7),d0
		beq.s      Aev_GetVaStart_1
		clr.w      d1
		moveq.l    #-1,d0
		movea.l    2(a7),a0
		jsr        Ax_memCheck
		tst.w      d0
		beq.s      Aev_GetVaStart_1
		movea.l    6(a7),a1
		move.l     a1,-(a7)
		jsr        Awi_root
		move.l     a0,-(a7)
		jsr        Awi_root
		movea.l    4(a0),a2
		movea.l    (a7)+,a0
		moveq.l    #27,d0
		movea.l    (a7)+,a1
		jsr        (a2)
		move.w     d0,(a7)
		bra.s      Aev_GetVaStart_2
Aev_GetVaStart_1:
		clr.w      (a7)
Aev_GetVaStart_2:
		movea.l    2(a7),a0
		move.w     (a7),d1
		movea.l    6(a7),a1
		move.w     2(a1),d0
		jsr        Aev_AvStarted
		moveq.l    #1,d0
		lea.l      14(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetAvStarted
Aev_GetAvStarted:
		move.l     a2,-(a7)
		lea.l      -54(a7),a7
		move.l     a0,50(a7)
		movea.l    50(a7),a0
		move.l     (a0),46(a7)
		move.w     #$4711,4(a7)
		movea.l    46(a7),a0
		move.l     6(a0),(a7)
		movea.l    46(a7),a0
		move.w     2(a0),10(a7)
		move.w     #$0001,12(a7)
		lea.l      4(a7),a0
		move.l     a0,14(a7)
		clr.l      18(a7)
		clr.l      22(a7)
		movea.l    46(a7),a0
		addq.w     #6,a0
		move.l     a0,26(a7)
		movea.l    46(a7),a0
		addq.w     #8,a0
		move.l     a0,30(a7)
		clr.l      34(a7)
		clr.l      38(a7)
		clr.l      42(a7)
		pea.l      Aev_CmpMsgInList
		lea.l      14(a7),a1
		movea.l    SentMsg,a0
		movea.l    SentMsg,a2
		movea.l    32(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		move.l     a0,6(a7)
		move.l     6(a7),d0
		beq.s      Aev_GetAvStarted_1
		movea.l    6(a7),a0
		move.l     2(a0),d0
		beq.s      Aev_GetAvStarted_2
		movea.l    (a7),a1
		move.w     #$0191,d0
		movea.l    6(a7),a0
		movea.l    2(a0),a0
		movea.l    6(a7),a2
		movea.l    2(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
Aev_GetAvStarted_2:
		pea.l      Alu_ptrCmp
		movea.l    10(a7),a1
		movea.l    SentMsg,a0
		movea.l    SentMsg,a2
		movea.l    32(a2),a2
		jsr        (a2)
		addq.w     #4,a7
Aev_GetAvStarted_1:
		movea.l    (a7),a0
		jsr        Ax_glfree
		moveq.l    #1,d0
		lea.l      54(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetAvSendKey
Aev_GetAvSendKey:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		move.w     6(a0),d0
		bne.s      Aev_GetAvSendKey_1
		movea.l    (a7),a0
		cmpi.w     #$5048,10(a0)
		bne.s      Aev_GetAvSendKey_1
		movea.l    ACSblk,a0
		clr.w      614(a0)
		movea.l    (a7),a0
		move.w     8(a0),d0
		and.w      #$00FF,d0
		movea.l    ACSblk,a0
		move.w     d0,718(a0)
		bra.s      Aev_GetAvSendKey_2
Aev_GetAvSendKey_1:
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.w     6(a0),614(a1)
		movea.l    (a7),a0
		move.w     6(a0),d1
		movea.l    (a7),a0
		move.w     8(a0),d0
		jsr        nkc_gemks2n
		movea.l    ACSblk,a0
		move.w     d0,718(a0)
Aev_GetAvSendKey_2:
		suba.l     a0,a0
		jsr        evkeybrd
		addq.w     #1,d0
		blt.s      Aev_GetAvSendKey_3
		moveq.l    #1,d0
		bra.s      Aev_GetAvSendKey_4
Aev_GetAvSendKey_3:
		clr.w      d0
Aev_GetAvSendKey_4:
		addq.w     #8,a7
		rts

	.globl Aev_GetAvSendClick
Aev_GetAvSendClick:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.w     6(a0),610(a1)
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.w     8(a0),612(a1)
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.w     10(a0),714(a1)
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.w     12(a0),614(a1)
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.w     14(a0),716(a1)
		movea.l    ACSblk,a0
		move.w     716(a0),d1
		movea.l    ACSblk,a0
		move.w     714(a0),d0
		jsr        evbutton
		tst.w      d0
		bmi.s      Aev_GetAvSendClick_1
		moveq.l    #1,d0
		bra.s      Aev_GetAvSendClick_2
Aev_GetAvSendClick_1:
		clr.w      d0
Aev_GetAvSendClick_2:
		addq.w     #8,a7
		rts

	.globl Aev_GetVaPathUpdate
Aev_GetVaPathUpdate:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		movea.l    8(a7),a0
		move.l     (a0),4(a7)
		movea.l    4(a7),a0
		move.l     6(a0),(a7)
		move.l     (a7),d0
		beq.s      Aev_GetVaPathUpdate_1
		clr.w      d1
		moveq.l    #-1,d0
		movea.l    (a7),a0
		jsr        Ax_memCheck
		tst.w      d0
		beq.s      Aev_GetVaPathUpdate_1
		movea.l    (a7),a0
		move.w     #$03EA,d0
		jsr        Awi_sendall
Aev_GetVaPathUpdate_1:
		moveq.l    #1,d0
		lea.l      12(a7),a7
		rts

	.globl Aev_AvProtokoll
Aev_AvProtokoll:
		lea.l      -24(a7),a7
		move.w     d0,22(a7)
		move.l     a0,18(a7)
		move.w     d1,16(a7)
		lea.l      xe19ac,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
Aev_AvProtokoll_1:
		move.b     (a0)+,(a1)+
		dbf        d0,Aev_AvProtokoll_1
		movea.l    ACSblk,a0
		move.w     22(a7),d0
		cmp.w      (a0),d0
		beq.s      Aev_AvProtokoll_2
		move.w     #$4700,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		clr.w      8(a7)
		clr.w      10(a7)
		movea.l    ACSblk,a0
		move.l     988(a0),12(a7)
		move.w     #$0036,6(a7)
		move.w     22(a7),d0
		bmi.s      Aev_AvProtokoll_3
		move.w     16(a7),d2
		movea.l    18(a7),a1
		lea.l      (a7),a0
		moveq.l    #1,d1
		move.w     22(a7),d0
		jsr        Aev_SendMsg
		bra.s      Aev_AvProtokoll_4
		bra.s      Aev_AvProtokoll_2
Aev_AvProtokoll_3:
		move.w     16(a7),d1
		movea.l    18(a7),a1
		moveq.l    #1,d0
		lea.l      (a7),a0
		jsr        Aev_SendAllMsg
		bra.s      Aev_AvProtokoll_4
Aev_AvProtokoll_2:
		clr.w      d0
Aev_AvProtokoll_4:
		lea.l      24(a7),a7
		rts

	.globl Aev_AvExit
Aev_AvExit:
		lea.l      -24(a7),a7
		move.w     d0,22(a7)
		move.l     a0,18(a7)
		move.w     d1,16(a7)
		lea.l      xe19bc,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
Aev_AvExit_1:
		move.b     (a0)+,(a1)+
		dbf        d0,Aev_AvExit_1
		movea.l    ACSblk,a0
		move.w     22(a7),d0
		cmp.w      (a0),d0
		beq.s      Aev_AvExit_2
		move.w     #$4736,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		clr.w      4(a7)
		clr.w      6(a7)
		clr.w      8(a7)
		clr.w      10(a7)
		clr.w      12(a7)
		clr.w      14(a7)
		move.w     22(a7),d0
		bmi.s      Aev_AvExit_3
		move.w     16(a7),d2
		movea.l    18(a7),a1
		lea.l      (a7),a0
		moveq.l    #1,d1
		move.w     22(a7),d0
		jsr        Aev_SendMsg
		bra.s      Aev_AvExit_4
		bra.s      Aev_AvExit_2
Aev_AvExit_3:
		move.w     16(a7),d1
		movea.l    18(a7),a1
		moveq.l    #1,d0
		lea.l      (a7),a0
		jsr        Aev_SendAllMsg
		bra.s      Aev_AvExit_4
Aev_AvExit_2:
		clr.w      d0
Aev_AvExit_4:
		lea.l      24(a7),a7
		rts

	.globl Aev_VaStart
Aev_VaStart:
		lea.l      -32(a7),a7
		move.w     d0,30(a7)
		move.l     a0,26(a7)
		move.l     a1,22(a7)
		move.w     d1,20(a7)
		lea.l      xe19dc,a0
		lea.l      4(a7),a1
		moveq.l    #15,d0
Aev_VaStart_1:
		move.b     (a0)+,(a1)+
		dbf        d0,Aev_VaStart_1
		movea.l    ACSblk,a0
		move.w     30(a7),d0
		cmp.w      (a0),d0
		beq.s      Aev_VaStart_2
		moveq.l    #1,d0
		movea.l    26(a7),a0
		jsr        Ast_copy
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Aev_VaStart_3
		clr.w      d0
		bra.s      Aev_VaStart_4
Aev_VaStart_3:
		move.w     #$4711,4(a7)
		movea.l    ACSblk,a0
		move.w     (a0),6(a7)
		clr.w      8(a7)
		clr.w      14(a7)
		clr.w      16(a7)
		clr.w      18(a7)
		move.l     (a7),10(a7)
		move.w     30(a7),d0
		bmi.s      Aev_VaStart_5
		move.w     20(a7),d2
		movea.l    22(a7),a1
		lea.l      4(a7),a0
		moveq.l    #1,d1
		move.w     30(a7),d0
		jsr        Aev_SendMsg
		bra.s      Aev_VaStart_4
		bra.s      Aev_VaStart_2
Aev_VaStart_5:
		move.w     20(a7),d1
		movea.l    22(a7),a1
		moveq.l    #1,d0
		lea.l      4(a7),a0
		jsr        Aev_SendAllMsg
		bra.s      Aev_VaStart_4
Aev_VaStart_2:
		clr.w      d0
Aev_VaStart_4:
		lea.l      32(a7),a7
		rts

	.globl Aev_AvStarted
Aev_AvStarted:
		lea.l      -22(a7),a7
		move.w     d0,20(a7)
		move.l     a0,16(a7)
		lea.l      xe19ec,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
Aev_AvStarted_1:
		move.b     (a0)+,(a1)+
		dbf        d0,Aev_AvStarted_1
		movea.l    ACSblk,a0
		move.w     20(a7),d0
		cmp.w      (a0),d0
		beq.s      Aev_AvStarted_2
		moveq.l    #16,d1
		clr.w      d0
		lea.l      (a7),a0
		jsr        memset
		move.w     #$4738,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		move.l     16(a7),6(a7)
		move.w     20(a7),d0
		bmi.s      Aev_AvStarted_3
		moveq.l    #-1,d2
		suba.l     a1,a1
		lea.l      (a7),a0
		moveq.l    #1,d1
		move.w     20(a7),d0
		jsr        Aev_SendMsg
		bra.s      Aev_AvStarted_4
		bra.s      Aev_AvStarted_2
Aev_AvStarted_3:
		moveq.l    #-1,d1
		suba.l     a1,a1
		moveq.l    #1,d0
		lea.l      (a7),a0
		jsr        Aev_SendAllMsg
		bra.s      Aev_AvStarted_4
Aev_AvStarted_2:
		clr.w      d0
Aev_AvStarted_4:
		lea.l      22(a7),a7
		rts

	.data

xe19ac:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe19bc:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe19cc: /* unused */
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe19dc:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe19ec:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe19fc:
		dc.b 'AVSERVER',0
xe1a05:
		dc.b 'JINNEE  ',0
xe1a0e:
		dc.b 'GEMINI  ',0
xe1a17:
		dc.b 'AVSERVER',0
xe1a20:
		dc.b 'MAGXDESK',0
		.even
