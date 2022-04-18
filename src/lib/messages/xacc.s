	.text
	
	.globl Aev_InitXAcc
Aev_InitXAcc:
		lea.l      -16(a7),a7
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		beq.w      Aev_InitXAcc_1
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0400,(a0)
		bge.s      Aev_InitXAcc_2
		cmpi.w     #$0200,_ACSv_magix
		blt.s      Aev_InitXAcc_1
Aev_InitXAcc_2:
		move.l     _globl,-(a7)
		pea.l      14(a7)
		lea.l      20(a7),a1
		lea.l      8(a7),a0
		clr.w      d0
		jsr        mt_appl_search
		addq.w     #8,a7
		move.w     d0,14(a7)
		bra.s      Aev_InitXAcc_3
Aev_InitXAcc_5:
		moveq.l    #6,d0
		and.w      12(a7),d0
		beq.s      Aev_InitXAcc_4
		clr.w      d1
		suba.l     a0,a0
		move.w     10(a7),d0
		jsr        Aev_AccID
Aev_InitXAcc_4:
		move.l     _globl,-(a7)
		pea.l      14(a7)
		lea.l      20(a7),a1
		lea.l      8(a7),a0
		moveq.l    #1,d0
		jsr        mt_appl_search
		addq.w     #8,a7
		move.w     d0,14(a7)
Aev_InitXAcc_3:
		move.w     14(a7),d0
		bne.s      Aev_InitXAcc_5
Aev_InitXAcc_1:
		moveq.l    #1,d0
		lea.l      16(a7),a7
		rts

	.globl Aev_ExitXAcc
Aev_ExitXAcc:
		moveq.l    #1,d0
		rts

	.globl XAccDataDelete
XAccDataDelete:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      XAccDataDelete_1
		movea.l    (a7),a0
		move.l     6(a0),d0
		beq.s      XAccDataDelete_2
		pea.l      Alu_ptrCmp
		movea.l    4(a7),a0
		movea.l    6(a0),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    24(a2),a2
		jsr        (a2)
		addq.w     #4,a7
XAccDataDelete_2:
		moveq.l    #10,d1
		clr.w      d0
		movea.l    (a7),a0
		jsr        memset
XAccDataDelete_1:
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

Aev_CheckXAccPart:
		subq.w     #6,a7
		move.w     d0,4(a7)
		move.w     4(a7),d0
		jsr        Aev_DDSearch
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Aev_CheckXAccPart_1
		moveq.l    #2,d0
		movea.l    (a7),a0
		and.l      2(a0),d0
		bne.s      Aev_CheckXAccPart_2
Aev_CheckXAccPart_1:
		clr.w      d1
		move.w     4(a7),d0
		jsr        Aev_AccAck
		suba.l     a0,a0
		bra.s      Aev_CheckXAccPart_3
Aev_CheckXAccPart_2:
		movea.l    (a7),a0
Aev_CheckXAccPart_3:
		addq.w     #6,a7
		rts

	.globl Aev_GetAccID
Aev_GetAccID:
		move.l     a2,-(a7)
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		movea.l    10(a7),a0
		move.l     (a0),6(a7)
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		bne.s      Aev_GetAccID_1
		movea.l    ACSblk,a0
		move.w     (a0),d0
		bne.s      Aev_GetAccID_1
		moveq.l    #-1,d1
		suba.l     a1,a1
		movea.l    6(a7),a0
		moveq.l    #-1,d0
		jsr        Aev_AccAcc
Aev_GetAccID_1:
		movea.l    6(a7),a0
		move.l     8(a0),2(a7)
		clr.w      d1
		moveq.l    #-1,d0
		movea.l    2(a7),a0
		jsr        Ax_memCheck
		tst.w      d0
		beq.s      Aev_GetAccID_2
		movea.l    2(a7),a1
		movea.l    6(a7),a0
		addq.w     #6,a0
		moveq.l    #2,d1
		movea.l    6(a7),a2
		move.w     2(a2),d0
		jsr        Aev_DDAdd
		move.w     d0,(a7)
		bra.s      Aev_GetAccID_3
Aev_GetAccID_2:
		clr.w      (a7)
Aev_GetAccID_3:
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		bne.s      Aev_GetAccID_4
		movea.l    ACSblk,a0
		move.w     (a0),d0
		bne.s      Aev_GetAccID_5
Aev_GetAccID_4:
		moveq.l    #-1,d1
		suba.l     a1,a1
		movea.l    6(a7),a0
		movea.l    6(a7),a2
		move.w     2(a2),d0
		jsr        Aev_AccAcc
Aev_GetAccID_5:
		move.w     (a7),d0
		lea.l      14(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetAccAck
Aev_GetAccAck:
		move.l     a2,-(a7)
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		movea.l    12(a7),a0
		move.l     (a0),8(a7)
		clr.l      (a7)
		movea.l    8(a7),a0
		move.w     2(a0),d0
		movea.l    ACSblk,a0
		cmp.w      (a0),d0
		beq        Aev_GetAccAck_1
		movea.l    8(a7),a0
		move.w     2(a0),d0
		bsr        Aev_CheckXAccPart
		move.l     a0,4(a7)
		move.l     4(a7),d0
		beq.s      Aev_GetAccAck_2
		movea.l    4(a7),a0
		lea.l      22(a0),a0
		bsr        XAccDataDelete
Aev_GetAccAck_2:
		pea.l      Aev_CmpDestID
		movea.l    12(a7),a1
		addq.w     #2,a1
		movea.l    SentMsg,a0
		movea.l    SentMsg,a2
		movea.l    32(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Aev_GetAccAck_1
		pea.l      Alu_ptrCmp
		movea.l    4(a7),a1
		movea.l    SentMsg,a0
		movea.l    SentMsg,a2
		movea.l    32(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		move.l     a0,d0
		beq.s      Aev_GetAccAck_1
		movea.l    (a7),a0
		move.l     2(a0),d0
		beq.s      Aev_GetAccAck_3
		movea.l    8(a7),a1
		addq.w     #6,a1
		move.w     #$0190,d0
		movea.l    (a7),a0
		movea.l    2(a0),a0
		movea.l    (a7),a2
		movea.l    2(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
Aev_GetAccAck_3:
		pea.l      Alu_ptrCmp
		movea.l    4(a7),a1
		movea.l    SentMsg,a0
		movea.l    SentMsg,a2
		movea.l    24(a2),a2
		jsr        (a2)
		addq.w     #4,a7
Aev_GetAccAck_1:
		move.l     (a7),d0
		beq.s      Aev_GetAccAck_4
		moveq.l    #1,d0
		bra.s      Aev_GetAccAck_5
Aev_GetAccAck_4:
		clr.w      d0
Aev_GetAccAck_5:
		lea.l      16(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetAccAcc
Aev_GetAccAcc:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		movea.l    10(a7),a0
		move.l     (a0),6(a7)
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		bne.s      Aev_GetAccAcc_1
		movea.l    ACSblk,a0
		move.w     (a0),d0
		beq.s      Aev_GetAccAcc_2
Aev_GetAccAcc_1:
		movea.l    6(a7),a0
		move.l     8(a0),2(a7)
		move.l     2(a7),d0
		beq.s      Aev_GetAccAcc_3
		clr.w      d1
		moveq.l    #-1,d0
		movea.l    2(a7),a0
		jsr        Ax_memCheck
		tst.w      d0
		beq.s      Aev_GetAccAcc_3
		movea.l    2(a7),a1
		movea.l    6(a7),a0
		addq.w     #6,a0
		moveq.l    #2,d1
		move.l     a1,-(a7)
		move.l     a0,-(a7)
		move.w     d1,-(a7)
		movea.l    ACSblk,a0
		move.w     568(a0),d1
		beq.s      Aev_GetAccAcc_4
		moveq.l    #1,d1
		bra.s      Aev_GetAccAcc_5
Aev_GetAccAcc_4:
		moveq.l    #7,d1
Aev_GetAccAcc_5:
		ext.l      d1
		add.l      d1,d1
		movea.l    16(a7),a0
		move.w     0(a0,d1.l),d0
		move.w     (a7)+,d1
		movea.l    (a7)+,a0
		movea.l    (a7)+,a1
		jsr        Aev_DDAdd
		move.w     d0,(a7)
		bra.s      Aev_GetAccAcc_2
Aev_GetAccAcc_3:
		move.w     #$FFFF,(a7)
Aev_GetAccAcc_2:
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		bne.s      Aev_GetAccAcc_6
		movea.l    ACSblk,a0
		move.w     (a0),d0
		beq.s      Aev_GetAccAcc_6
		moveq.l    #-1,d1
		suba.l     a0,a0
		movea.l    6(a7),a1
		move.w     14(a1),d0
		jsr        Aev_AccID
Aev_GetAccAcc_6:
		move.w     (a7),d0
		lea.l      14(a7),a7
		rts

	.globl Aev_GetAccKey
Aev_GetAccKey:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		movea.l    10(a7),a0
		move.l     12(a0),6(a7)
		movea.l    10(a7),a0
		move.l     (a0),2(a7)
		movea.l    2(a7),a0
		move.w     2(a0),d0
		bsr        Aev_CheckXAccPart
		move.l     a0,d0
		bne.s      Aev_GetAccKey_1
		moveq.l    #1,d0
		bra.s      Aev_GetAccKey_2
Aev_GetAccKey_1:
		movea.l    2(a7),a0
		move.w     8(a0),d1
		movea.l    2(a7),a0
		move.w     6(a0),d0
		jsr        nkc_gemks2n
		movea.l    ACSblk,a0
		move.w     d0,718(a0)
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		and.w      #$BFFF,d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    6(a7),a0
		movea.l    6(a7),a1
		movea.l    98(a1),a1
		jsr        (a1)
		move.w     d0,(a7)
		cmpi.w     #$FFFF,(a7)
		blt.s      Aev_GetAccKey_3
		moveq.l    #1,d1
		bra.s      Aev_GetAccKey_4
Aev_GetAccKey_3:
		clr.w      d1
Aev_GetAccKey_4:
		movea.l    2(a7),a0
		move.w     2(a0),d0
		jsr        Aev_AccAck
		moveq.l    #1,d0
Aev_GetAccKey_2:
		lea.l      14(a7),a7
		rts

	.globl Aev_GetAccText
Aev_GetAccText:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		movea.l    8(a7),a0
		move.l     (a0),4(a7)
		movea.l    4(a7),a0
		move.w     2(a0),d0
		bsr        Aev_CheckXAccPart
		move.l     a0,d0
		bne.s      Aev_GetAccText_1
		moveq.l    #1,d0
		bra        Aev_GetAccText_2
Aev_GetAccText_1:
		movea.l    4(a7),a0
		move.l     8(a0),(a7)
		clr.w      d1
		moveq.l    #-1,d0
		movea.l    (a7),a0
		jsr        Ax_memCheck
		tst.w      d0
		beq.s      Aev_GetAccText_3
		movea.l    8(a7),a0
		move.l     20(a0),-(a7)
		movea.l    12(a7),a0
		move.l     16(a0),-(a7)
		movea.l    16(a7),a0
		move.l     12(a0),-(a7)
		movea.l    20(a7),a0
		move.w     26(a0),d1
		movea.l    20(a7),a0
		move.w     24(a0),d0
		lea.l      xe1848,a1
		movea.l    12(a7),a0
		jsr        GetTxtIntoObj
		lea.l      12(a7),a7
		move.w     d0,d1
		movea.l    4(a7),a0
		move.w     2(a0),d0
		jsr        Aev_AccAck
		bra.s      Aev_GetAccText_2
		bra.s      Aev_GetAccText_2
Aev_GetAccText_3:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0400,d0
		beq.s      Aev_GetAccText_4
		lea.l      xe1850,a0
		moveq.l    #1,d0
		jsr        Awi_alert
Aev_GetAccText_4:
		clr.w      d1
		movea.l    4(a7),a0
		move.w     2(a0),d0
		jsr        Aev_AccAck
		nop
Aev_GetAccText_2:
		lea.l      12(a7),a7
		rts

	.globl Aev_GetAccImg
Aev_GetAccImg:
		move.l     a2,-(a7)
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		movea.l    16(a7),a0
		move.l     (a0),12(a7)
		move.w     #$0001,10(a7)
		movea.l    12(a7),a0
		cmpi.w     #$0001,6(a0)
		bne.s      Aev_GetAccImg_1
		moveq.l    #1,d0
		bra.s      Aev_GetAccImg_2
Aev_GetAccImg_1:
		clr.w      d0
Aev_GetAccImg_2:
		move.w     d0,8(a7)
		movea.l    12(a7),a0
		move.w     2(a0),d0
		bsr        Aev_CheckXAccPart
		move.l     a0,d0
		bne.s      Aev_GetAccImg_3
		moveq.l    #1,d0
		bra        Aev_GetAccImg_4
Aev_GetAccImg_3:
		move.l     GetXAccData,d0
		beq.s      Aev_GetAccImg_5
		cmpi.l     #$00494D47,GetXAccData
		bne.s      Aev_GetAccImg_6
Aev_GetAccImg_5:
		move.w     GetXAccID,d0
		bmi.s      Aev_GetAccImg_7
		movea.l    12(a7),a0
		move.w     GetXAccID,d0
		cmp.w      2(a0),d0
		beq.s      Aev_GetAccImg_7
Aev_GetAccImg_6:
		clr.w      d1
		movea.l    12(a7),a0
		move.w     2(a0),d0
		jsr        Aev_AccAck
		moveq.l    #1,d0
		bra        Aev_GetAccImg_4
Aev_GetAccImg_7:
		movea.l    12(a7),a0
		move.l     8(a0),(a7)
		movea.l    12(a7),a0
		move.l     12(a0),4(a7)
		clr.w      d1
		move.l     4(a7),d0
		movea.l    (a7),a0
		jsr        Ax_memCheck
		move.w     d0,10(a7)
		move.w     8(a7),d0
		beq        Aev_GetAccImg_8
		move.w     10(a7),d0
		beq        Aev_GetAccImg_8
		cmpi.l     #$00494D47,GetXAccData
		bne.s      Aev_GetAccImg_9
		movea.l    12(a7),a0
		move.w     GetXAccID,d0
		cmp.w      2(a0),d0
		bne.s      Aev_GetAccImg_9
		moveq.l    #1,d1
		move.l     4(a7),d0
		movea.l    (a7),a1
		lea.l      xe18b4,a0
		jsr        Ascrp_put
		move.w     d0,10(a7)
		move.w     10(a7),d0
		beq.s      Aev_GetAccImg_9
		pea.l      4(a7)
		lea.l      4(a7),a1
		lea.l      xe18b8,a0
		jsr        Ascrp_get
		addq.w     #4,a7
		move.w     d0,10(a7)
Aev_GetAccImg_9:
		move.w     10(a7),d0
		beq.s      Aev_GetAccImg_10
		movea.l    16(a7),a0
		move.l     16(a0),d0
		beq.s      Aev_GetAccImg_11
		movea.l    16(a7),a0
		movea.l    16(a0),a0
		move.l     4(a0),d0
		beq.s      Aev_GetAccImg_11
		movea.l    16(a7),a0
		move.l     20(a0),-(a7)
		movea.l    20(a7),a0
		move.l     16(a0),-(a7)
		movea.l    24(a7),a0
		move.w     24(a0),d0
		movea.l    24(a7),a0
		movea.l    12(a0),a1
		movea.l    8(a7),a0
		jsr        GetImgIntoObj
		addq.w     #8,a7
		move.w     d0,10(a7)
		movea.l    (a7),a0
		jsr        Ax_free
		bra.s      Aev_GetAccImg_10
Aev_GetAccImg_11:
		lea.l      xe18bc,a1
		moveq.l    #29,d0
		movea.l    16(a7),a0
		movea.l    12(a0),a0
		movea.l    16(a7),a2
		movea.l    12(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
		move.w     d0,10(a7)
Aev_GetAccImg_10:
		bra.s      Aev_GetAccImg_12
Aev_GetAccImg_8:
		move.w     10(a7),d0
		beq.s      Aev_GetAccImg_13
		cmpi.l     #$00494D47,GetXAccData
		bne.s      Aev_GetAccImg_14
		movea.l    12(a7),a0
		move.w     GetXAccID,d0
		cmp.w      2(a0),d0
		beq.s      Aev_GetAccImg_15
Aev_GetAccImg_14:
		lea.l      xe18c0,a0
		jsr        Ascrp_clear
Aev_GetAccImg_15:
		moveq.l    #1,d1
		move.l     4(a7),d0
		movea.l    (a7),a1
		lea.l      xe18c4,a0
		jsr        Ascrp_put
		move.w     d0,10(a7)
		bra.s      Aev_GetAccImg_12
Aev_GetAccImg_13:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0400,d0
		beq.s      Aev_GetAccImg_12
		lea.l      xe18c8,a0
		moveq.l    #1,d0
		jsr        Awi_alert
Aev_GetAccImg_12:
		move.w     10(a7),d1
		movea.l    12(a7),a0
		move.w     2(a0),d0
		jsr        Aev_AccAck
		move.w     8(a7),d0
		bne.s      Aev_GetAccImg_16
		move.w     10(a7),d0
		bne.s      Aev_GetAccImg_17
Aev_GetAccImg_16:
		move.w     8(a7),d0
		bne.s      Aev_GetAccImg_18
		lea.l      xe192c,a0
		jsr        Ascrp_clear
Aev_GetAccImg_18:
		clr.l      GetXAccData
		move.w     #$FFFF,GetXAccID
		bra.s      Aev_GetAccImg_19
Aev_GetAccImg_17:
		move.l     #$00494D47,GetXAccData
		movea.l    12(a7),a0
		move.w     2(a0),GetXAccID
Aev_GetAccImg_19:
		moveq.l    #1,d0
Aev_GetAccImg_4:
		lea.l      20(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetAccMeta
Aev_GetAccMeta:
		move.l     a2,-(a7)
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		movea.l    16(a7),a0
		move.l     (a0),12(a7)
		move.w     #$0001,10(a7)
		movea.l    12(a7),a0
		cmpi.w     #$0001,6(a0)
		bne.s      Aev_GetAccMeta_1
		moveq.l    #1,d0
		bra.s      Aev_GetAccMeta_2
Aev_GetAccMeta_1:
		clr.w      d0
Aev_GetAccMeta_2:
		move.w     d0,8(a7)
		movea.l    12(a7),a0
		move.w     2(a0),d0
		bsr        Aev_CheckXAccPart
		move.l     a0,d0
		bne.s      Aev_GetAccMeta_3
		moveq.l    #1,d0
		bra        Aev_GetAccMeta_4
Aev_GetAccMeta_3:
		move.l     GetXAccData,d0
		beq.s      Aev_GetAccMeta_5
		cmpi.l     #$0047454D,GetXAccData
		bne.s      Aev_GetAccMeta_6
Aev_GetAccMeta_5:
		move.w     GetXAccID,d0
		bmi.s      Aev_GetAccMeta_7
		movea.l    12(a7),a0
		move.w     GetXAccID,d0
		cmp.w      2(a0),d0
		beq.s      Aev_GetAccMeta_7
Aev_GetAccMeta_6:
		clr.w      d1
		movea.l    12(a7),a0
		move.w     2(a0),d0
		jsr        Aev_AccAck
		moveq.l    #1,d0
		bra        Aev_GetAccMeta_4
Aev_GetAccMeta_7:
		movea.l    12(a7),a0
		move.w     8(a0),d0
		ext.l      d0
		moveq.l    #16,d1
		lsl.l      d1,d0
		movea.l    12(a7),a0
		move.w     10(a0),d1
		ext.l      d1
		or.l       d1,d0
		move.l     d0,(a7)
		movea.l    12(a7),a0
		move.w     12(a0),d0
		ext.l      d0
		moveq.l    #16,d1
		lsl.l      d1,d0
		movea.l    12(a7),a0
		move.w     14(a0),d1
		ext.l      d1
		or.l       d1,d0
		move.l     d0,4(a7)
		clr.w      d1
		move.l     4(a7),d0
		movea.l    (a7),a0
		jsr        Ax_memCheck
		move.w     d0,10(a7)
		move.w     8(a7),d0
		beq        Aev_GetAccMeta_8
		move.w     10(a7),d0
		beq.w      Aev_GetAccMeta_8
		cmpi.l     #$0047454D,GetXAccData
		bne.s      Aev_GetAccMeta_9
		movea.l    12(a7),a0
		move.w     GetXAccID,d0
		cmp.w      2(a0),d0
		bne.s      Aev_GetAccMeta_9
		moveq.l    #1,d1
		move.l     4(a7),d0
		movea.l    (a7),a1
		lea.l      xe1930,a0
		jsr        Ascrp_put
		move.w     d0,10(a7)
		move.w     10(a7),d0
		beq.s      Aev_GetAccMeta_9
		pea.l      4(a7)
		lea.l      4(a7),a1
		lea.l      xe1934,a0
		jsr        Ascrp_get
		addq.w     #4,a7
		move.w     d0,10(a7)
Aev_GetAccMeta_9:
		lea.l      xe1938,a1
		moveq.l    #29,d0
		movea.l    16(a7),a0
		movea.l    12(a0),a0
		movea.l    16(a7),a2
		movea.l    12(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
		move.w     d0,10(a7)
		bra.s      Aev_GetAccMeta_10
Aev_GetAccMeta_8:
		move.w     10(a7),d0
		beq.s      Aev_GetAccMeta_11
		cmpi.l     #$0047454D,GetXAccData
		bne.s      Aev_GetAccMeta_12
		movea.l    12(a7),a0
		move.w     GetXAccID,d0
		cmp.w      2(a0),d0
		beq.s      Aev_GetAccMeta_13
Aev_GetAccMeta_12:
		lea.l      xe193c,a0
		jsr        Ascrp_clear
Aev_GetAccMeta_13:
		moveq.l    #1,d1
		move.l     4(a7),d0
		movea.l    (a7),a1
		lea.l      xe1940,a0
		jsr        Ascrp_put
		move.w     d0,10(a7)
		bra.s      Aev_GetAccMeta_10
Aev_GetAccMeta_11:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0400,d0
		beq.s      Aev_GetAccMeta_10
		lea.l      xe1944,a0
		moveq.l    #1,d0
		jsr        Awi_alert
Aev_GetAccMeta_10:
		move.w     10(a7),d1
		movea.l    12(a7),a0
		move.w     2(a0),d0
		jsr        Aev_AccAck
		move.w     8(a7),d0
		bne.s      Aev_GetAccMeta_14
		move.w     10(a7),d0
		bne.s      Aev_GetAccMeta_15
Aev_GetAccMeta_14:
		move.w     8(a7),d0
		bne.s      Aev_GetAccMeta_16
		lea.l      xe19a8,a0
		jsr        Ascrp_clear
Aev_GetAccMeta_16:
		clr.l      GetXAccData
		move.w     #$FFFF,GetXAccID
		bra.s      Aev_GetAccMeta_17
Aev_GetAccMeta_15:
		move.l     #$0047454D,GetXAccData
		movea.l    12(a7),a0
		move.w     2(a0),GetXAccID
Aev_GetAccMeta_17:
		moveq.l    #1,d0
Aev_GetAccMeta_4:
		lea.l      20(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_AccID
Aev_AccID:
		lea.l      -24(a7),a7
		move.w     d0,22(a7)
		move.l     a0,18(a7)
		move.w     d1,16(a7)
		lea.l      xe1808,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
Aev_AccID_1:
		move.b     (a0)+,(a1)+
		dbf        d0,Aev_AccID_1
		movea.l    ACSblk,a0
		move.w     22(a7),d0
		cmp.w      (a0),d0
		beq.s      Aev_AccID_2
		move.w     #$0400,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		move.w     #$0003,6(a7)
		movea.l    ACSblk,a0
		move.w     986(a0),12(a7)
		move.w     #$FFFF,14(a7)
		movea.l    ACSblk,a0
		move.l     1254(a0),8(a7)
		move.w     22(a7),d0
		bmi.s      Aev_AccID_3
		move.w     16(a7),d2
		movea.l    18(a7),a1
		lea.l      (a7),a0
		moveq.l    #2,d1
		move.w     22(a7),d0
		jsr        Aev_SendMsg
		bra.s      Aev_AccID_4
		bra.s      Aev_AccID_2
Aev_AccID_3:
		move.w     16(a7),d1
		movea.l    18(a7),a1
		moveq.l    #2,d0
		lea.l      (a7),a0
		jsr        Aev_SendAllMsg
		bra.s      Aev_AccID_4
Aev_AccID_2:
		clr.w      d0
Aev_AccID_4:
		lea.l      24(a7),a7
		rts

	.globl Aev_AccAcc
Aev_AccAcc:
		lea.l      -28(a7),a7
		move.w     d0,26(a7)
		move.l     a0,22(a7)
		move.l     a1,18(a7)
		move.w     d1,16(a7)
		lea.l      xe1818,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
Aev_AccAcc_1:
		move.b     (a0)+,(a1)+
		dbf        d0,Aev_AccAcc_1
		movea.l    ACSblk,a0
		move.w     26(a7),d0
		cmp.w      (a0),d0
		beq        Aev_AccAcc_2
		move.w     #$0403,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		clr.w      4(a7)
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		beq.s      Aev_AccAcc_3
		move.w     #$0003,6(a7)
		movea.l    ACSblk,a0
		move.w     986(a0),12(a7)
		move.w     #$FFFF,14(a7)
		movea.l    ACSblk,a0
		move.l     1254(a0),8(a7)
		bra.s      Aev_AccAcc_4
Aev_AccAcc_3:
		movea.l    22(a7),a0
		move.w     6(a0),6(a7)
		movea.l    22(a7),a0
		move.w     8(a0),8(a7)
		movea.l    22(a7),a0
		move.w     10(a0),10(a7)
		movea.l    22(a7),a0
		move.w     12(a0),12(a7)
		movea.l    22(a7),a0
		move.w     2(a0),14(a7)
Aev_AccAcc_4:
		move.w     26(a7),d0
		bmi.s      Aev_AccAcc_5
		move.w     16(a7),d2
		movea.l    18(a7),a1
		lea.l      (a7),a0
		moveq.l    #2,d1
		move.w     26(a7),d0
		jsr        Aev_SendMsg
		bra.s      Aev_AccAcc_6
		bra.s      Aev_AccAcc_2
Aev_AccAcc_5:
		move.w     16(a7),d1
		movea.l    18(a7),a1
		moveq.l    #2,d0
		lea.l      (a7),a0
		jsr        Aev_SendAllMsg
		bra.s      Aev_AccAcc_6
Aev_AccAcc_2:
		clr.w      d0
Aev_AccAcc_6:
		lea.l      28(a7),a7
		rts

	.globl Aev_AccExit
Aev_AccExit:
		lea.l      -24(a7),a7
		move.w     d0,22(a7)
		move.l     a0,18(a7)
		move.w     d1,16(a7)
		lea.l      xe1828,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
Aev_AccExit_1:
		move.b     (a0)+,(a1)+
		dbf        d0,Aev_AccExit_1
		movea.l    ACSblk,a0
		move.w     22(a7),d0
		cmp.w      (a0),d0
		beq.s      Aev_AccExit_2
		move.w     #$0404,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		clr.w      6(a7)
		clr.w      8(a7)
		clr.w      10(a7)
		clr.w      12(a7)
		clr.w      14(a7)
		move.w     22(a7),d0
		bmi.s      Aev_AccExit_3
		move.w     16(a7),d2
		movea.l    18(a7),a1
		lea.l      (a7),a0
		moveq.l    #2,d1
		move.w     22(a7),d0
		jsr        Aev_SendMsg
		bra.s      Aev_AccExit_4
		bra.s      Aev_AccExit_2
Aev_AccExit_3:
		move.w     16(a7),d1
		movea.l    18(a7),a1
		moveq.l    #2,d0
		lea.l      (a7),a0
		jsr        Aev_SendAllMsg
		bra.s      Aev_AccExit_4
Aev_AccExit_2:
		clr.w      d0
Aev_AccExit_4:
		lea.l      24(a7),a7
		rts

	.globl Aev_AccAck
Aev_AccAck:
		lea.l      -20(a7),a7
		move.w     d0,18(a7)
		move.w     d1,16(a7)
		lea.l      xe1838,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
Aev_AccAck_1:
		move.b     (a0)+,(a1)+
		dbf        d0,Aev_AccAck_1
		movea.l    ACSblk,a0
		move.w     18(a7),d0
		cmp.w      (a0),d0
		beq.s      Aev_AccAck_2
		moveq.l    #16,d1
		clr.w      d0
		lea.l      (a7),a0
		jsr        memset
		move.w     #$0500,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		move.w     16(a7),d0
		beq.s      Aev_AccAck_3
		moveq.l    #1,d0
		bra.s      Aev_AccAck_4
Aev_AccAck_3:
		clr.w      d0
Aev_AccAck_4:
		move.w     d0,6(a7)
		move.w     18(a7),d0
		bmi.s      Aev_AccAck_5
		moveq.l    #-1,d2
		suba.l     a1,a1
		lea.l      (a7),a0
		moveq.l    #2,d1
		move.w     18(a7),d0
		jsr        Aev_SendMsg
		bra.s      Aev_AccAck_6
		bra.s      Aev_AccAck_2
Aev_AccAck_5:
		moveq.l    #-1,d1
		suba.l     a1,a1
		moveq.l    #2,d0
		lea.l      (a7),a0
		jsr        Aev_SendAllMsg
		bra.s      Aev_AccAck_6
Aev_AccAck_2:
		clr.w      d0
Aev_AccAck_6:
		lea.l      20(a7),a7
		rts

	.data

GetXAccData:
		dc.w $0000
		dc.w $0000
GetXAccID:
		dc.w $ffff
xe1808:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe1818:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe1828:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe1838:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe1848:
		dc.b 'XAccTxt',0
xe1850:
		dc.b '[4][Bei einem XAcc-Transfer|konnte auf den Speicher|nicht zugegriffen|werden (Speicherschutz)!][OK]',0
xe18b4:
		dc.b 'img',0
xe18b8:
		dc.b 'img',0
xe18bc:
		dc.b 'IMG',0
xe18c0:
		dc.b 'img',0
xe18c4:
		dc.b 'img',0
xe18c8:
		dc.b '[4][Bei einem XAcc-Transfer|konnte auf den Speicher|nicht zugegriffen|werden (Speicherschutz)!][OK]',0
xe192c:
		dc.b 'img',0
xe1930:
		dc.b 'gem',0
xe1934:
		dc.b 'gem',0
xe1938:
		dc.b 'gem',0
xe193c:
		dc.b 'gem',0
xe1940:
		dc.b 'gem',0
xe1944:
		dc.b '[4][Bei einem XAcc-Transfer|konnte auf den Speicher|nicht zugegriffen|werden (Speicherschutz)!][OK]',0
xe19a8:
		dc.b 'gem',0
		.even
