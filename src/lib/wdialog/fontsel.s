	.text

	.globl Ash_fontSetIcon
Ash_fontSetIcon:
		subq.w     #6,a7
		move.l     a0,2(a7)
		move.w     d0,(a7)
		move.l     2(a7),FontSelWind+90
		move.l     FontSelWind+90,d0
		bne.s      Ash_fontSetIcon_1
		andi.w     #$FFFC,FontSelWind+84
		bra.s      Ash_fontSetIcon_2
Ash_fontSetIcon_1:
		ori.w      #$0001,FontSelWind+84
		move.w     (a7),d0
		beq.s      Ash_fontSetIcon_3
		ori.w      #$0002,FontSelWind+84
		bra.s      Ash_fontSetIcon_2
Ash_fontSetIcon_3:
		andi.w     #$FFFD,FontSelWind+84
Ash_fontSetIcon_2:
		addq.w     #6,a7
		rts

	.globl Ash_font
Ash_font:
		move.l     a2,-(a7)
		lea.l      -28(a7),a7
		move.l     a0,20(a7)
		move.w     d0,18(a7)
		move.w     d1,16(a7)
		move.w     d2,14(a7)
		move.l     a1,10(a7)
		move.w     #$FFFF,(a7)
		move.l     10(a7),d0
		bne.s      Ash_font_1
		moveq.l    #-3,d0
		bra        Ash_font_2
Ash_font_1:
		jsr        hasFnts
		tst.w      d0
		bne.s      Ash_font_3
		moveq.l    #-2,d0
		bra        Ash_font_2
Ash_font_3:
		moveq.l    #68,d0
		jsr        Ax_malloc
		move.l     a0,6(a7)
		move.l     6(a7),d0
		bne.s      Ash_font_4
		moveq.l    #-1,d0
		bra        Ash_font_2
Ash_font_4:
		movea.l    6(a7),a0
		move.w     18(a7),(a0)
		movea.l    6(a7),a0
		move.w     16(a7),2(a0)
		movea.l    6(a7),a0
		move.w     14(a7),18(a0)
		movea.l    6(a7),a0
		move.w     36(a7),4(a0)
		movea.l    38(a7),a0
		jsr        Ast_create
		movea.l    6(a7),a1
		move.l     a0,10(a1)
		movea.l    42(a7),a0
		jsr        Ast_create
		movea.l    6(a7),a1
		move.l     a0,14(a1)
		movea.l    6(a7),a0
		move.l     58(a7),44(a0)
		movea.l    6(a7),a0
		move.l     46(a7),48(a0)
		movea.l    6(a7),a0
		move.l     50(a7),52(a0)
		movea.l    6(a7),a0
		move.l     54(a7),56(a0)
		movea.l    6(a7),a0
		move.l     62(a7),60(a0)
		movea.l    6(a7),a0
		move.l     48(a0),d0
		bne.s      Ash_font_5
		movea.l    6(a7),a0
		andi.w     #$DFFF,4(a0)
Ash_font_5:
		movea.l    6(a7),a0
		move.l     52(a0),d0
		bne.s      Ash_font_6
		movea.l    6(a7),a0
		andi.w     #$BFFF,4(a0)
Ash_font_6:
		movea.l    6(a7),a0
		move.l     56(a0),d0
		bne.s      Ash_font_7
		movea.l    6(a7),a0
		clr.l      14(a0)
Ash_font_7:
		moveq.l    #16,d0
		movea.l    10(a7),a1
		movea.l    6(a7),a0
		lea.l      20(a0),a0
		jsr        memcpy
		movea.l    6(a7),a0
		clr.w      20(a0)
		movea.l    6(a7),a0
		clr.w      22(a0)
		movea.l    10(a7),a0
		move.l     4(a0),d0
		bpl.s      Ash_font_8
		movea.l    ACSblk,a0
		move.w     656(a0),d0
		ext.l      d0
		bra.s      Ash_font_9
Ash_font_8:
		movea.l    10(a7),a0
		move.l     4(a0),d0
Ash_font_9:
		movea.l    6(a7),a0
		move.l     d0,24(a0)
		movea.l    10(a7),a0
		move.l     8(a0),d0
		bpl.s      Ash_font_10
		movea.l    ACSblk,a0
		move.w     658(a0),d0
		ext.l      d0
		moveq.l    #16,d1
		lsl.l      d1,d0
		bra.s      Ash_font_11
Ash_font_10:
		movea.l    10(a7),a0
		move.l     8(a0),d0
Ash_font_11:
		movea.l    6(a7),a0
		move.l     d0,28(a0)
		movea.l    10(a7),a0
		move.l     12(a0),d0
		bpl.s      Ash_font_12
		move.l     #$00010000,d0
		bra.s      Ash_font_13
Ash_font_12:
		movea.l    10(a7),a0
		move.l     12(a0),d0
Ash_font_13:
		movea.l    6(a7),a0
		move.l     d0,32(a0)
		movea.l    6(a7),a0
		movea.l    FontSelWind+8,a1
		jsr        (a1)
		move.l     a0,2(a7)
		move.l     2(a7),d0
		bne        Ash_font_14
		move.l     62(a7),d0
		bne        Ash_font_15
		move.l     _globl,-(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0100,d0
		beq.s      Ash_font_16
		clr.w      d0
		bra.s      Ash_font_17
Ash_font_16:
		moveq.l    #1,d0
Ash_font_17:
		move.w     d0,-(a7)
		movea.l    12(a7),a0
		movea.l    14(a0),a1
		movea.l    12(a7),a0
		movea.l    10(a0),a0
		movea.l    12(a7),a2
		move.w     18(a2),d2
		movea.l    ACSblk,a2
		move.w     644(a2),d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        mt_fnts_create
		addq.w     #6,a7
		movea.l    6(a7),a1
		move.l     a0,6(a1)
		movea.l    6(a7),a0
		move.l     6(a0),d0
		beq        Ash_font_15
		jsr        Amo_unbusy
Ash_font_18:
		move.l     _globl,-(a7)
		movea.l    10(a7),a0
		pea.l      32(a0)
		movea.l    14(a7),a0
		pea.l      28(a0)
		movea.l    18(a7),a0
		pea.l      24(a0)
		movea.l    22(a7),a0
		move.l     32(a0),-(a7)
		movea.l    26(a7),a1
		lea.l      22(a1),a1
		movea.l    26(a7),a0
		move.l     28(a0),d2
		movea.l    26(a7),a0
		move.l     24(a0),d1
		movea.l    26(a7),a0
		move.w     4(a0),d0
		movea.l    26(a7),a0
		movea.l    6(a0),a0
		jsr        mt_fnts_do
		lea.l      20(a7),a7
		movea.l    6(a7),a0
		move.w     d0,20(a0)
		movea.l    6(a7),a0
		jsr        doButton
		tst.w      d0
		beq.s      Ash_font_18
		movea.l    _globl,a1
		clr.w      d0
		movea.l    6(a7),a0
		movea.l    6(a0),a0
		jsr        mt_fnts_delete
		clr.w      (a7)
Ash_font_15:
		moveq.l    #16,d0
		movea.l    6(a7),a1
		lea.l      20(a1),a1
		movea.l    10(a7),a0
		jsr        memcpy
		movea.l    6(a7),a0
		movea.l    14(a0),a0
		jsr        Ast_delete
		movea.l    6(a7),a0
		movea.l    10(a0),a0
		jsr        Ast_delete
		moveq.l    #68,d0
		movea.l    6(a7),a0
		jsr        Ax_recycle
		bra        Ash_font_19
Ash_font_14:
		movea.l    20(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      Ash_font_20
		movea.l    2(a7),a0
		move.l     74(a0),24(a7)
		movea.l    20(a7),a0
		jsr        Ast_create
		movea.l    2(a7),a1
		move.l     a0,74(a1)
		movea.l    2(a7),a0
		move.l     74(a0),d0
		beq.s      Ash_font_21
		movea.l    24(a7),a0
		jsr        Ast_delete
		bra.s      Ash_font_20
Ash_font_21:
		movea.l    2(a7),a0
		move.l     24(a7),74(a0)
Ash_font_20:
		move.l     62(a7),d0
		bne.s      Ash_font_22
		movea.l    6(a7),a0
		move.w     #$0001,38(a0)
		movea.l    2(a7),a0
		movea.l    2(a7),a1
		movea.l    12(a1),a1
		jsr        (a1)
		tst.w      d0
		beq.s      Ash_font_23
		movea.l    2(a7),a0
		jsr        Awi_dialog
		tst.w      d0
		bmi.s      Ash_font_23
		move.w     #$0001,(a7)
Ash_font_23:
		moveq.l    #16,d0
		movea.l    6(a7),a1
		lea.l      20(a1),a1
		movea.l    10(a7),a0
		jsr        memcpy
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    2(a7),a0
		movea.l    2(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		bra.s      Ash_font_19
Ash_font_22:
		movea.l    6(a7),a0
		clr.w      38(a0)
		movea.l    2(a7),a0
		movea.l    2(a7),a1
		movea.l    12(a1),a1
		jsr        (a1)
		tst.w      d0
		beq.s      Ash_font_24
		move.w     #$0002,(a7)
		bra.s      Ash_font_19
Ash_font_24:
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    2(a7),a0
		movea.l    2(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
Ash_font_19:
		move.w     (a7),d0
Ash_font_2:
		lea.l      28(a7),a7
		movea.l    (a7)+,a2
		rts

hasFnts:
		subq.w     #8,a7
		move.w     vorhanden,d0
		bpl.s      hasFnts_1
		move.l     _globl,-(a7)
		pea.l      4(a7)
		pea.l      10(a7)
		lea.l      16(a7),a1
		lea.l      18(a7),a0
		moveq.l    #7,d0
		jsr        mt_appl_getinfo
		lea.l      12(a7),a7
		tst.w      d0
		beq.s      hasFnts_2
		moveq.l    #4,d0
		and.w      6(a7),d0
		beq.s      hasFnts_3
		moveq.l    #1,d0
		bra.s      hasFnts_4
hasFnts_3:
		clr.w      d0
hasFnts_4:
		move.w     d0,vorhanden
		bra.s      hasFnts_1
hasFnts_2:
		clr.w      vorhanden
hasFnts_1:
		move.w     vorhanden,d0
		beq.s      hasFnts_5
		moveq.l    #1,d0
		bra.s      hasFnts_6
hasFnts_5:
		clr.w      d0
hasFnts_6:
		addq.w     #8,a7
		rts

fntsClose:
		move.l     a2,-(a7)
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		movea.l    8(a7),a0
		move.l     64(a0),4(a7)
		movea.l    8(a7),a0
		move.l     60(a0),(a7)
		move.l     4(a7),d0
		beq.s      fntsClose_1
		movea.l    4(a7),a0
		move.w     32(a0),d0
		bmi.s      fntsClose_1
		move.l     _globl,-(a7)
		movea.l    8(a7),a0
		pea.l      46(a0)
		movea.l    12(a7),a1
		lea.l      44(a1),a1
		movea.l    16(a7),a0
		movea.l    6(a0),a0
		jsr        mt_fnts_close
		addq.w     #8,a7
		movea.l    4(a7),a0
		move.w     #$FFFF,32(a0)
		move.l     (a7),d0
		beq.s      fntsClose_1
		movea.l    8(a7),a1
		lea.l      20(a1),a1
		moveq.l    #52,d0
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
fntsClose_1:
		moveq.l    #1,d0
		lea.l      12(a7),a7
		movea.l    (a7)+,a2
		rts

fntsMessage:
		move.l     a2,-(a7)
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.l     a1,2(a7)
		movea.l    6(a7),a0
		movea.l    64(a0),a0
		movea.l    2(a7),a1
		move.w     32(a0),38(a1)
		move.l     _globl,-(a7)
		movea.l    10(a7),a0
		pea.l      32(a0)
		movea.l    14(a7),a0
		pea.l      28(a0)
		movea.l    18(a7),a0
		pea.l      24(a0)
		movea.l    22(a7),a0
		pea.l      22(a0)
		movea.l    26(a7),a0
		pea.l      20(a0)
		movea.l    26(a7),a1
		movea.l    30(a7),a0
		movea.l    6(a0),a0
		jsr        mt_fnts_evnt
		lea.l      24(a7),a7
		move.w     d0,(a7)
		move.w     (a7),d0
		bne.s      fntsMessage_1
		movea.l    6(a7),a0
		jsr        doButton
		movea.l    6(a7),a0
		move.w     d0,42(a0)
		movea.l    6(a7),a0
		move.w     42(a0),d0
		beq.s      fntsMessage_1
		movea.l    6(a7),a0
		move.w     38(a0),d0
		beq.s      fntsMessage_2
		movea.l    ACSblk,a0
		move.w     #$0001,616(a0)
		bra.s      fntsMessage_1
fntsMessage_2:
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    6(a7),a0
		movea.l    64(a0),a0
		movea.l    6(a7),a2
		movea.l    64(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
fntsMessage_1:
		move.w     (a7),d0
		lea.l      10(a7),a7
		movea.l    (a7)+,a2
		rts

doButton:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		clr.w      42(a0)
		movea.l    (a7),a0
		move.w     20(a0),d0
		cmp.w      #$0005,d0
		bhi        doButton_1
		add.w      d0,d0
		move.w     J59(pc,d0.w),d0
		jmp        J59(pc,d0.w)
J59:
		dc.w doButton_1-J59
		dc.w doButton_2-J59
		dc.w doButton_3-J59
		dc.w doButton_4-J59
		dc.w doButton_5-J59
		dc.w doButton_6-J59
doButton_2:
		movea.l    (a7),a0
		move.w     #$0001,42(a0)
		bra.w      doButton_1
doButton_3:
		movea.l    (a7),a0
		move.w     #$0001,42(a0)
		bra.s      doButton_1
doButton_4:
		movea.l    (a7),a0
		move.l     48(a0),d0
		beq.s      doButton_7
		movea.l    (a7),a1
		lea.l      20(a1),a1
		movea.l    (a7),a0
		movea.l    44(a0),a0
		movea.l    (a7),a2
		movea.l    48(a2),a2
		jsr        (a2)
		movea.l    (a7),a0
		move.w     d0,42(a0)
doButton_7:
		bra.s      doButton_1
doButton_5:
		movea.l    (a7),a0
		move.l     52(a0),d0
		beq.s      doButton_8
		movea.l    (a7),a1
		lea.l      20(a1),a1
		movea.l    (a7),a0
		movea.l    44(a0),a0
		movea.l    (a7),a2
		movea.l    52(a2),a2
		jsr        (a2)
		movea.l    (a7),a0
		move.w     d0,42(a0)
doButton_8:
		bra.s      doButton_1
doButton_6:
		movea.l    (a7),a0
		move.l     56(a0),d0
		beq.s      doButton_9
		movea.l    (a7),a1
		lea.l      20(a1),a1
		movea.l    (a7),a0
		movea.l    44(a0),a0
		movea.l    (a7),a2
		movea.l    56(a2),a2
		jsr        (a2)
		movea.l    (a7),a0
		move.w     d0,42(a0)
doButton_9:
		nop
doButton_1:
		movea.l    (a7),a0
		move.w     42(a0),d0
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

FontCreate:
		move.l     a2,-(a7)
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     8(a7),4(a7)
		move.l     8(a7),d0
		bne.s      FontCreate_1
		suba.l     a0,a0
		bra        FontCreate_2
FontCreate_1:
		lea.l      FontSelWind,a0
		jsr        Awi_create
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      FontCreate_3
		suba.l     a0,a0
		bra.s      FontCreate_2
FontCreate_3:
		movea.l    (a7),a0
		move.l     4(a7),(a0)
		movea.l    4(a7),a0
		move.l     (a7),64(a0)
		move.l     _globl,-(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0100,d0
		beq.s      FontCreate_4
		clr.w      d0
		bra.s      FontCreate_5
FontCreate_4:
		moveq.l    #1,d0
FontCreate_5:
		move.w     d0,-(a7)
		movea.l    10(a7),a0
		movea.l    14(a0),a1
		movea.l    10(a7),a0
		movea.l    10(a0),a0
		movea.l    10(a7),a2
		move.w     18(a2),d2
		movea.l    ACSblk,a2
		move.w     644(a2),d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        mt_fnts_create
		addq.w     #6,a7
		movea.l    4(a7),a1
		move.l     a0,6(a1)
		movea.l    (a7),a0
FontCreate_2:
		lea.l      12(a7),a7
		movea.l    (a7)+,a2
		rts

FontService:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		movea.l    6(a7),a0
		move.l     (a0),(a7)
		move.w     4(a7),d0
		subq.w     #2,d0
		beq.s      FontService_1
		bra.s      FontService_2
FontService_1:
		movea.l    6(a7),a0
		move.w     86(a0),d0
		and.w      #$0200,d0
		bne.s      FontService_3
		movea.l    6(a7),a0
		ori.w      #$0200,86(a0)
		movea.l    (a7),a0
		bsr        fntsClose
		movea.l    _globl,a1
		clr.w      d0
		movea.l    (a7),a0
		movea.l    6(a0),a0
		jsr        mt_fnts_delete
		movea.l    (a7),a0
		movea.l    14(a0),a0
		jsr        Ast_delete
		movea.l    (a7),a0
		movea.l    10(a0),a0
		jsr        Ast_delete
		moveq.l    #68,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		movea.l    6(a7),a0
		jsr        Awi_delete
FontService_3:
		moveq.l    #1,d0
		bra.s      FontService_4
FontService_2:
		clr.w      d0
FontService_4:
		lea.l      10(a7),a7
		rts

FontOpen:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		move.l     32(a0),-(a7)
		movea.l    4(a7),a0
		move.l     28(a0),-(a7)
		movea.l    8(a7),a0
		move.l     24(a0),-(a7)
		movea.l    _globl,a1
		movea.l    12(a7),a0
		move.w     2(a0),d2
		movea.l    12(a7),a0
		move.w     (a0),d1
		movea.l    12(a7),a0
		move.w     4(a0),d0
		movea.l    12(a7),a0
		movea.l    6(a0),a0
		jsr        mt_fnts_open
		lea.l      12(a7),a7
		movea.l    4(a7),a0
		move.w     d0,32(a0)
		movea.l    4(a7),a0
		move.w     32(a0),d0
		ble        FontOpen_1
		movea.l    4(a7),a0
		pea.l      42(a0)
		movea.l    8(a7),a0
		pea.l      40(a0)
		movea.l    12(a7),a0
		pea.l      38(a0)
		movea.l    16(a7),a0
		pea.l      36(a0)
		moveq.l    #5,d1
		movea.l    20(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    4(a7),a0
		pea.l      58(a0)
		movea.l    8(a7),a0
		pea.l      56(a0)
		movea.l    12(a7),a0
		pea.l      54(a0)
		movea.l    16(a7),a0
		pea.l      52(a0)
		moveq.l    #4,d1
		movea.l    20(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    4(a7),a0
		movea.l    20(a0),a0
		clr.w      16(a0)
		movea.l    4(a7),a0
		movea.l    20(a0),a0
		clr.w      18(a0)
		movea.l    4(a7),a0
		movea.l    4(a7),a1
		movea.l    20(a1),a1
		move.w     56(a0),20(a1)
		movea.l    4(a7),a0
		movea.l    4(a7),a1
		movea.l    20(a1),a1
		move.w     58(a0),22(a1)
		movea.l    4(a7),a0
		jsr        Awi_register
		moveq.l    #1,d0
		bra.s      FontOpen_2
		bra.s      FontOpen_2
FontOpen_1:
		clr.w      d0
		nop
FontOpen_2:
		addq.w     #8,a7
		rts

FontClosed:
		lea.l      -72(a7),a7
		move.l     a0,68(a7)
		movea.l    68(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe2fd8,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
FontClosed_1:
		move.l     (a0)+,(a1)+
		dbf        d0,FontClosed_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        fntsMessage
		lea.l      72(a7),a7
		rts

FontRedraw:
		lea.l      -76(a7),a7
		move.l     a0,72(a7)
		move.l     a1,68(a7)
		movea.l    72(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe3018,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
FontRedraw_1:
		move.l     (a0)+,(a1)+
		dbf        d0,FontRedraw_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		movea.l    68(a7),a0
		move.w     (a0),40(a7)
		movea.l    68(a7),a0
		move.w     2(a0),42(a7)
		movea.l    68(a7),a0
		move.w     4(a0),44(a7)
		movea.l    68(a7),a0
		move.w     6(a0),46(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        fntsMessage
		lea.l      76(a7),a7
		rts

FontArrowed:
		lea.l      -74(a7),a7
		move.l     a0,70(a7)
		move.w     d0,68(a7)
		movea.l    70(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe3058,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
FontArrowed_1:
		move.l     (a0)+,(a1)+
		dbf        d0,FontArrowed_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		move.w     68(a7),40(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        fntsMessage
		lea.l      74(a7),a7
		rts

FontChange:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a1
		lea.l      52(a1),a1
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

FontFulled:
		lea.l      -72(a7),a7
		move.l     a0,68(a7)
		movea.l    68(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe3098,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
FontFulled_1:
		move.l     (a0)+,(a1)+
		dbf        d0,FontFulled_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        fntsMessage
		lea.l      72(a7),a7
		rts

FontInit:
		clr.w      d0
		rts

FontHSlide:
		lea.l      -74(a7),a7
		move.l     a0,70(a7)
		move.w     d0,68(a7)
		movea.l    70(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe30d8,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
FontHSlide_1:
		move.l     (a0)+,(a1)+
		dbf        d0,FontHSlide_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		move.w     68(a7),40(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        fntsMessage
		lea.l      74(a7),a7
		rts

FontVSlide:
		lea.l      -74(a7),a7
		move.l     a0,70(a7)
		move.w     d0,68(a7)
		movea.l    70(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe3118,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
FontVSlide_1:
		move.l     (a0)+,(a1)+
		dbf        d0,FontVSlide_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		move.w     68(a7),40(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        fntsMessage
		lea.l      74(a7),a7
		rts

FontKeys:
		lea.l      -74(a7),a7
		move.l     a0,70(a7)
		move.w     d1,68(a7)
		movea.l    70(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe3158,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
FontKeys_1:
		move.l     (a0)+,(a1)+
		dbf        d0,FontKeys_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		move.w     68(a7),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		move.w     68(a7),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        fntsMessage
		clr.w      d0
		lea.l      74(a7),a7
		rts

FontTopped:
		lea.l      -72(a7),a7
		move.l     a0,68(a7)
		movea.l    68(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe3198,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
FontTopped_1:
		move.l     (a0)+,(a1)+
		dbf        d0,FontTopped_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        fntsMessage
		lea.l      72(a7),a7
		rts

FontMoved:
		lea.l      -76(a7),a7
		move.l     a0,72(a7)
		move.l     a1,68(a7)
		movea.l    72(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe31d8,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
FontMoved_1:
		move.l     (a0)+,(a1)+
		dbf        d0,FontMoved_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		movea.l    68(a7),a0
		move.w     (a0),40(a7)
		movea.l    68(a7),a0
		move.w     2(a0),42(a7)
		movea.l    68(a7),a0
		move.w     4(a0),44(a7)
		movea.l    68(a7),a0
		move.w     6(a0),46(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        fntsMessage
		movea.l    72(a7),a0
		pea.l      42(a0)
		movea.l    76(a7),a0
		pea.l      40(a0)
		movea.l    80(a7),a0
		pea.l      38(a0)
		movea.l    84(a7),a0
		pea.l      36(a0)
		moveq.l    #5,d1
		movea.l    88(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    72(a7),a0
		pea.l      58(a0)
		movea.l    76(a7),a0
		pea.l      56(a0)
		movea.l    80(a7),a0
		pea.l      54(a0)
		movea.l    84(a7),a0
		pea.l      52(a0)
		moveq.l    #4,d1
		movea.l    88(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    72(a7),a0
		movea.l    72(a7),a1
		movea.l    20(a1),a1
		move.w     56(a0),20(a1)
		movea.l    72(a7),a0
		movea.l    72(a7),a1
		movea.l    20(a1),a1
		move.w     58(a0),22(a1)
		lea.l      76(a7),a7
		rts

FontSized:
		lea.l      -76(a7),a7
		move.l     a0,72(a7)
		move.l     a1,68(a7)
		movea.l    72(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe3218,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
FontSized_1:
		move.l     (a0)+,(a1)+
		dbf        d0,FontSized_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		movea.l    68(a7),a0
		move.w     (a0),40(a7)
		movea.l    68(a7),a0
		move.w     2(a0),42(a7)
		movea.l    68(a7),a0
		move.w     4(a0),44(a7)
		movea.l    68(a7),a0
		move.w     6(a0),46(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        fntsMessage
		movea.l    72(a7),a0
		pea.l      42(a0)
		movea.l    76(a7),a0
		pea.l      40(a0)
		movea.l    80(a7),a0
		pea.l      38(a0)
		movea.l    84(a7),a0
		pea.l      36(a0)
		moveq.l    #5,d1
		movea.l    88(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    72(a7),a0
		pea.l      58(a0)
		movea.l    76(a7),a0
		pea.l      56(a0)
		movea.l    80(a7),a0
		pea.l      54(a0)
		movea.l    84(a7),a0
		pea.l      52(a0)
		moveq.l    #4,d1
		movea.l    88(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    72(a7),a0
		movea.l    72(a7),a1
		movea.l    20(a1),a1
		move.w     56(a0),20(a1)
		movea.l    72(a7),a0
		movea.l    72(a7),a1
		movea.l    20(a1),a1
		move.w     58(a0),22(a1)
		lea.l      76(a7),a7
		rts

FontIconify:
		subq.w     #6,a7
		move.l     a0,2(a7)
		move.w     d0,(a7)
		move.w     (a7),d0
		movea.l    2(a7),a0
		jsr        Awi_iconify
		addq.w     #6,a7
		rts

FontUniconify:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		jsr        Awi_uniconify
		addq.w     #4,a7
		rts

FontGEMScript:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.l     a1,(a7)
		move.l     14(a7),-(a7)
		movea.l    4(a7),a1
		move.w     8(a7),d0
		movea.l    10(a7),a0
		jsr        Awi_gemscript
		addq.w     #4,a7
		lea.l      10(a7),a7
		rts

FontClicked:
		lea.l      -68(a7),a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.l     (a0),64(a7)
		lea.l      xe3258,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
FontClicked_1:
		move.l     (a0)+,(a1)+
		dbf        d0,FontClicked_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        fntsMessage
		lea.l      68(a7),a7
		rts

	.data

TEXT_01:
		dc.b 0
TEXT_02:
		dc.b 0
FontSelObj:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0040
		dc.w $0000
		dc.w $0002
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $0028
		dc.w $0014
_00aFontSelObj:
		dc.l FontClicked
		dc.w $0000
		dc.w $0000
		dc.w $8020
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl FontSelWind
FontSelWind:
		dc.w $0000
		dc.w $0000
		dc.l FontService
		dc.l FontCreate
		dc.l FontOpen
		dc.l FontInit
		dc.l FontSelObj
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $6fef
		dc.w $0000
		dc.w $0000
		dc.w $0078
		dc.w $0032
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $f8f8
		dc.l TEXT_01
		dc.l TEXT_02
		dc.w $0000
		dc.w $0100
		dc.w $0000
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l FontKeys
		dc.l FontChange
		dc.l FontRedraw
		dc.l FontTopped
		dc.l FontClosed
		dc.l FontFulled
		dc.l FontArrowed
		dc.l FontHSlide
		dc.l FontVSlide
		dc.l FontSized
		dc.l FontMoved
		dc.l FontIconify
		dc.l FontUniconify
		dc.l FontGEMScript
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
vorhanden:
		dc.w $ffff
xe2fd8:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0016
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe3018:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0014
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe3058:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe3098:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0017
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe30d8:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0019
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe3118:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $001a
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe3158:
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe3198:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0015
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe31d8:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe3218:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $001b
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe3258:
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
