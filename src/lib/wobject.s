	.globl Awi_diaend
Awi_diaend:
		move.l     a2,-(a7)
		lea.l      -16(a7),a7
		move.l     open_dialog,d0
		beq.s      Awi_diaend_1
		pea.l      2(a7)
		pea.l      8(a7)
		lea.l      16(a7),a1
		movea.l    open_dialog,a0
		jsr        Awi_find_edit
		addq.w     #8,a7
		tst.w      d0
		beq.s      Awi_diaend_1
		moveq.l    #2,d0
		movea.l    open_dialog,a0
		and.w      86(a0),d0
		bne.s      Awi_diaend_2
Awi_diaend_1:
		bra        Awi_diaend_3
Awi_diaend_2:
		move.w     2(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		move.l     12(a0,d0.l),12(a7)
		movea.l    open_dialog,a0
		andi.w     #$FFFD,86(a0)
		move.l     open_dialog,last_edit
		movea.l    open_dialog,a0
		move.w     28(a0),d0
		move.w     d0,(a7)
		move.w     d0,last_edit+8
		move.w     (a7),d0
		and.w      #$1000,d0
		beq.s      Awi_diaend_4
		movea.l    open_dialog,a0
		move.l     24(a0),last_edit+4
		bra.s      Awi_diaend_5
Awi_diaend_4:
		movea.l    open_dialog,a0
		move.l     20(a0),last_edit+4
Awi_diaend_5:
		moveq.l    #-1,d0
		movea.l    open_dialog,a0
		move.w     d0,30(a0)
		movea.l    open_dialog,a0
		move.w     d0,28(a0)
		movea.l    open_dialog,a0
		clr.w      82(a0)
		clr.l      open_dialog
		suba.l     a1,a1
		moveq.l    #6,d0
		move.w     2(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    8(a7),a0
		adda.l     d1,a0
		movea.l    12(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Awi_diaend_3:
		lea.l      16(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_diastart
Awi_diastart:
		move.l     a2,-(a7)
		lea.l      -34(a7),a7
		move.w     #$FFFF,(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		pea.l      18(a7)
		moveq.l    #10,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		move.w     6(a7),d0
		ble.s      Awi_diastart_1
		move.w     6(a7),d0
		jsr        Awi_wid
		move.l     a0,30(a7)
		beq.s      Awi_diastart_1
		moveq.l    #2,d0
		movea.l    30(a7),a0
		and.w      86(a0),d0
		beq.s      Awi_diastart_2
Awi_diastart_1:
		bra        Awi_diastart_3
Awi_diastart_2:
		movea.l    30(a7),a0
		move.w     28(a0),d0
		bpl        Awi_diastart_4
		movea.l    30(a7),a0
		cmpa.l     last_edit,a0
		bne.s      Awi_diastart_4
		movea.l    30(a7),a0
		movea.l    20(a0),a0
		cmpa.l     last_edit+4,a0
		bne.s      Awi_diastart_5
		moveq.l    #8,d0
		move.w     last_edit+8,d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    30(a7),a0
		movea.l    20(a0),a0
		and.w      8(a0,d1.l),d0
		beq.s      Awi_diastart_6
		move.w     last_edit+8,(a7)
Awi_diastart_6:
		bra.s      Awi_diastart_4
Awi_diastart_5:
		movea.l    30(a7),a0
		movea.l    24(a0),a0
		cmpa.l     last_edit+4,a0
		bne.s      Awi_diastart_4
		moveq.l    #8,d0
		move.w     last_edit+8,d2
		and.w      #$0FFF,d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    30(a7),a0
		movea.l    24(a0),a0
		and.w      8(a0,d1.l),d0
		beq.s      Awi_diastart_4
		move.w     last_edit+8,(a7)
Awi_diastart_4:
		move.w     (a7),d0
		ble.s      Awi_diastart_7
		move.w     last_edit+8,d0
		and.w      #$1000,d0
		beq.s      Awi_diastart_8
		move.w     last_edit+8,d0
		and.w      #$0FFF,d0
		move.w     d0,(a7)
		movea.l    30(a7),a0
		move.l     24(a0),12(a7)
		bra.s      Awi_diastart_9
Awi_diastart_8:
		move.w     last_edit+8,(a7)
		movea.l    30(a7),a0
		move.l     20(a0),12(a7)
Awi_diastart_9:
		bra.s      Awi_diastart_10
Awi_diastart_7:
		pea.l      (a7)
		pea.l      12(a7)
		lea.l      20(a7),a1
		movea.l    38(a7),a0
		jsr        Awi_find_edit
		addq.w     #8,a7
		tst.w      d0
		bne.s      Awi_diastart_10
		bra        Awi_diastart_3
Awi_diastart_10:
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    12(a7),a0
		move.l     12(a0,d0.l),26(a7)
		movea.l    30(a7),a0
		ori.w      #$0002,86(a0)
		move.l     30(a7),open_dialog
		movea.l    30(a7),a0
		movea.l    12(a7),a1
		cmpa.l     20(a0),a1
		bne.s      Awi_diastart_11
		movea.l    30(a7),a0
		move.w     (a7),28(a0)
		bra.s      Awi_diastart_12
Awi_diastart_11:
		move.w     (a7),d0
		or.w       #$1000,d0
		movea.l    30(a7),a0
		move.w     d0,28(a0)
Awi_diastart_12:
		move.l     30(a7),16(a7)
		movea.l    30(a7),a0
		movea.l    12(a7),a1
		cmpa.l     20(a0),a1
		bne.s      Awi_diastart_13
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    30(a7),a0
		movea.l    20(a0),a0
		adda.l     d0,a0
		move.l     a0,20(a7)
		move.w     (a7),24(a7)
		bra.s      Awi_diastart_14
Awi_diastart_13:
		move.w     (a7),d1
		and.w      #$0FFF,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    30(a7),a0
		movea.l    24(a0),a0
		adda.l     d0,a0
		move.l     a0,20(a7)
		move.w     (a7),d0
		or.w       #$1000,d0
		move.w     d0,24(a7)
Awi_diastart_14:
		lea.l      16(a7),a1
		moveq.l    #9,d0
		move.w     (a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    12(a7),a0
		adda.l     d1,a0
		movea.l    26(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		movea.l    30(a7),a0
		move.w     30(a0),d0
		bpl.s      Awi_diastart_15
		clr.w      2(a7)
		move.w     #$FFFF,4(a7)
		lea.l      2(a7),a1
		move.w     #$02C2,d0
		move.w     (a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    12(a7),a0
		adda.l     d1,a0
		movea.l    26(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Awi_diastart_15:
		suba.l     a1,a1
		moveq.l    #6,d0
		move.w     (a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    12(a7),a0
		adda.l     d1,a0
		movea.l    26(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Awi_diastart_3:
		lea.l      34(a7),a7
		movea.l    (a7)+,a2
		rts

Awi_self0:
		move.l     a2,-(a7)
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     a1,10(a7)
		move.w     d0,8(a7)
		move.w     #$FFFF,6(a7)
		bra        Awi_self0_1
Awi_self0_10:
		move.w     6(a7),d0
		bpl.s      Awi_self0_2
		clr.w      4(a7)
		bra.s      Awi_self0_3
Awi_self0_2:
		move.w     6(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		move.w     2(a0,d0.l),4(a7)
Awi_self0_3:
		move.w     4(a7),d0
		bpl.s      Awi_self0_4
		move.w     6(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		move.w     0(a0,d0.l),4(a7)
		bra.s      Awi_self0_5
Awi_self0_6:
		move.w     4(a7),6(a7)
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		move.w     0(a0,d0.l),4(a7)
Awi_self0_5:
		move.w     4(a7),d0
		bmi.s      Awi_self0_4
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		move.w     6(a7),d1
		cmp.w      4(a0,d0.l),d1
		beq.s      Awi_self0_6
Awi_self0_4:
		move.w     4(a7),d0
		bpl.s      Awi_self0_7
		bra        Awi_self0_8
Awi_self0_7:
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		cmpi.b     #$18,7(a0,d0.l)
		bne.s      Awi_self0_9
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		move.l     12(a0,d0.l),(a7)
		beq.s      Awi_self0_9
		movea.l    (a7),a0
		move.l     8(a0),d0
		beq.s      Awi_self0_9
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		adda.l     d0,a0
		movea.l    14(a7),a1
		move.l     a0,4(a1)
		move.w     4(a7),d0
		or.w       8(a7),d0
		movea.l    14(a7),a0
		move.w     d0,8(a0)
		movea.l    14(a7),a1
		moveq.l    #9,d0
		movea.l    14(a7),a0
		movea.l    4(a0),a0
		movea.l    (a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Awi_self0_9:
		move.w     4(a7),6(a7)
Awi_self0_1:
		bra        Awi_self0_10
Awi_self0_8:
		lea.l      18(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_uoself
Awi_uoself:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.l     10(a7),(a7)
		movea.l    10(a7),a0
		move.l     24(a0),d0
		beq.s      Awi_uoself_1
		move.w     #$1000,d0
		movea.l    10(a7),a0
		movea.l    24(a0),a1
		lea.l      (a7),a0
		bsr        Awi_self0
Awi_uoself_1:
		movea.l    10(a7),a0
		move.l     20(a0),d0
		beq.s      Awi_uoself_2
		clr.w      d0
		movea.l    10(a7),a0
		movea.l    20(a0),a1
		lea.l      (a7),a0
		bsr        Awi_self0
Awi_uoself_2:
		lea.l      14(a7),a7
		rts

	.globl Awi_obchange
Awi_obchange:
		lea.l      -48(a7),a7
		move.l     a0,44(a7)
		move.w     d0,42(a7)
		move.w     d1,40(a7)
		movea.l    44(a7),a0
		move.w     86(a0),d0
		and.w      #$2800,d0
		beq.s      Awi_obchange_1
		clr.w      d0
		movea.l    44(a7),a0
		jsr        Awi_obredraw
		bra        Awi_obchange_2
Awi_obchange_1:
		move.w     42(a7),d0
		and.w      #$1000,d0
		beq.s      Awi_obchange_3
		movea.l    44(a7),a0
		move.l     24(a0),16(a7)
		move.l     16(a7),d0
		bne.s      Awi_obchange_4
		bra        Awi_obchange_2
Awi_obchange_4:
		move.w     42(a7),d0
		and.w      #$0FFF,d0
		move.w     d0,2(a7)
		bra.s      Awi_obchange_5
Awi_obchange_3:
		movea.l    44(a7),a0
		move.l     20(a0),16(a7)
		move.l     16(a7),d0
		bne.s      Awi_obchange_6
		bra        Awi_obchange_2
Awi_obchange_6:
		move.w     42(a7),2(a7)
Awi_obchange_5:
		move.w     2(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		adda.l     d0,a0
		move.l     a0,12(a7)
		cmpi.w     #$FFFF,40(a7)
		bne.s      Awi_obchange_7
		movea.l    12(a7),a0
		move.w     10(a0),40(a7)
Awi_obchange_7:
		movea.l    12(a7),a0
		cmpi.b     #$21,7(a0)
		bne.s      Awi_obchange_8
		movea.l    12(a7),a0
		move.w     40(a7),10(a0)
		move.w     42(a7),d0
		movea.l    44(a7),a0
		jsr        Awi_obredraw
		bra        Awi_obchange_2
Awi_obchange_8:
		movea.l    44(a7),a0
		move.w     52(a0),32(a7)
		movea.l    44(a7),a0
		move.w     56(a0),36(a7)
		move.w     42(a7),d0
		and.w      #$1000,d0
		beq.s      Awi_obchange_9
		movea.l    44(a7),a0
		move.w     54(a0),d0
		movea.l    16(a7),a0
		add.w      18(a0),d0
		move.w     d0,34(a7)
		movea.l    16(a7),a0
		move.w     22(a0),38(a7)
		bra.s      Awi_obchange_10
Awi_obchange_9:
		movea.l    44(a7),a0
		move.w     54(a0),34(a7)
		movea.l    44(a7),a0
		move.w     58(a0),38(a7)
Awi_obchange_10:
		movea.l    12(a7),a0
		move.w     10(a0),d0
		move.w     40(a7),d1
		eor.w      d1,d0
		and.w      #$0008,d0
		beq.s      Awi_obchange_11
		movea.l    12(a7),a0
		move.w     40(a7),10(a0)
Awi_obchange_11:
		movea.l    12(a7),a0
		move.w     10(a0),(a7)
		movea.l    44(a7),a0
		move.w     32(a0),10(a7)
		move.w     10(a7),d0
		bmi        Awi_obchange_12
		movea.l    44(a7),a0
		lea.l      52(a0),a0
		move.l     a0,20(a7)
		movea.l    16(a7),a0
		move.w     16(a0),8(a7)
		movea.l    16(a7),a0
		move.w     18(a0),6(a7)
		movea.l    20(a7),a0
		move.w     (a0),d0
		movea.l    16(a7),a0
		add.w      d0,16(a0)
		movea.l    20(a7),a0
		move.w     2(a0),d0
		movea.l    16(a7),a0
		add.w      d0,18(a0)
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0100,d0
		jsr        mt_graf_mouse
		pea.l      30(a7)
		pea.l      32(a7)
		pea.l      34(a7)
		pea.l      36(a7)
		moveq.l    #11,d1
		move.w     26(a7),d0
		jsr        wind_get
		lea.l      16(a7),a7
		bra        Awi_obchange_13
Awi_obchange_19:
		lea.l      32(a7),a1
		lea.l      24(a7),a0
		jsr        intersect
		move.w     28(a7),d0
		beq        Awi_obchange_14
		move.w     42(a7),d0
		and.w      #$1000,d0
		beq.s      Awi_obchange_15
		move.w     26(a7),d0
		add.w      30(a7),d0
		move.w     d0,4(a7)
		movea.l    20(a7),a0
		move.w     4(a7),d0
		cmp.w      2(a0),d0
		ble.s      Awi_obchange_16
		lea.l      last_edit+4,a0
		moveq.l    #1,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		movea.l    20(a7),a0
		move.w     2(a0),d0
		sub.w      26(a7),d0
		move.w     d0,30(a7)
Awi_obchange_16:
		bra.s      Awi_obchange_17
Awi_obchange_15:
		move.w     26(a7),d0
		movea.l    20(a7),a0
		sub.w      2(a0),d0
		move.w     d0,4(a7)
		move.w     4(a7),d0
		bpl.s      Awi_obchange_17
		lea.l      xe0cd5,a0
		moveq.l    #1,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		move.w     4(a7),d0
		sub.w      d0,26(a7)
		move.w     4(a7),d0
		add.w      d0,30(a7)
Awi_obchange_17:
		move.w     30(a7),d0
		ble.s      Awi_obchange_14
		move.w     40(a7),d0
		cmp.w      (a7),d0
		bne.s      Awi_obchange_18
		move.w     30(a7),-(a7)
		move.w     30(a7),-(a7)
		move.w     30(a7),-(a7)
		movea.l    _globl,a1
		move.w     30(a7),d2
		moveq.l    #8,d1
		move.w     8(a7),d0
		movea.l    22(a7),a0
		jsr        mt_objc_draw
		addq.w     #6,a7
		bra.s      Awi_obchange_14
Awi_obchange_18:
		movea.l    12(a7),a0
		move.w     (a7),10(a0)
		moveq.l    #1,d0
		move.w     d0,-(a7)
		move.w     42(a7),-(a7)
		move.w     34(a7),-(a7)
		move.w     34(a7),-(a7)
		move.w     34(a7),-(a7)
		movea.l    _globl,a1
		move.w     34(a7),d2
		clr.w      d1
		move.w     12(a7),d0
		movea.l    26(a7),a0
		jsr        mt_objc_change
		lea.l      10(a7),a7
Awi_obchange_14:
		pea.l      30(a7)
		pea.l      32(a7)
		pea.l      34(a7)
		pea.l      36(a7)
		moveq.l    #12,d1
		move.w     26(a7),d0
		jsr        wind_get
		lea.l      16(a7),a7
Awi_obchange_13:
		move.w     28(a7),d0
		bgt        Awi_obchange_19
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0101,d0
		jsr        mt_graf_mouse
		movea.l    16(a7),a0
		move.w     8(a7),16(a0)
		movea.l    16(a7),a0
		move.w     6(a7),18(a0)
Awi_obchange_12:
		movea.l    12(a7),a0
		move.w     40(a7),10(a0)
Awi_obchange_2:
		lea.l      48(a7),a7
		rts

	.globl Awi_obredraw
Awi_obredraw:
		move.l     a2,-(a7)
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.w     d0,8(a7)
		lea.l      xe0cc0,a0
		lea.l      (a7),a1
		move.l     (a0)+,(a1)+
		move.l     (a0)+,(a1)+
		movea.l    10(a7),a0
		move.w     86(a0),d0
		and.w      #$2800,d0
		beq.s      Awi_obredraw_1
		lea.l      (a7),a1
		movea.l    10(a7),a0
		movea.l    10(a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
		bra        Awi_obredraw_2
Awi_obredraw_1:
		moveq.l    #8,d0
		movea.l    10(a7),a0
		and.w      86(a0),d0
		beq.s      Awi_obredraw_3
		move.w     8(a7),d0
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		lea.l      (a7),a0
		jsr        Aob_offset
		bra.s      Awi_obredraw_4
Awi_obredraw_3:
		move.w     8(a7),d0
		and.w      #$1000,d0
		beq.s      Awi_obredraw_5
		move.w     8(a7),d0
		and.w      #$0FFF,d0
		movea.l    10(a7),a0
		movea.l    24(a0),a1
		lea.l      (a7),a0
		jsr        Aob_offset
		bra.s      Awi_obredraw_6
Awi_obredraw_5:
		move.w     8(a7),d0
		movea.l    10(a7),a0
		movea.l    20(a0),a1
		lea.l      (a7),a0
		jsr        Aob_offset
Awi_obredraw_6:
		movea.l    10(a7),a0
		move.w     52(a0),d0
		add.w      d0,(a7)
		movea.l    10(a7),a0
		move.w     54(a0),d0
		add.w      d0,2(a7)
Awi_obredraw_4:
		lea.l      (a7),a1
		movea.l    10(a7),a0
		movea.l    10(a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
Awi_obredraw_2:
		lea.l      14(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_redraw
Awi_redraw:
		lea.l      -52(a7),a7
		move.l     a0,48(a7)
		move.l     a1,44(a7)
		movea.l    48(a7),a0
		move.w     32(a0),42(a7)
		bmi.s      Awi_redraw_1
		movea.l    48(a7),a0
		move.l     20(a0),8(a7)
		beq.s      Awi_redraw_1
		movea.l    48(a7),a0
		move.w     86(a0),d0
		and.w      #$2000,d0
		beq.s      Awi_redraw_2
Awi_redraw_1:
		bra        Awi_redraw_3
Awi_redraw_2:
		movea.l    48(a7),a0
		move.w     86(a0),d0
		and.w      #$0800,d0
		beq.s      Awi_redraw_4
		movea.l    44(a7),a0
		move.w     4(a0),d0
		movea.l    8(a7),a0
		cmp.w      20(a0),d0
		bgt.s      Awi_redraw_5
		movea.l    44(a7),a0
		move.w     6(a0),d0
		movea.l    8(a7),a0
		cmp.w      22(a0),d0
		ble.s      Awi_redraw_4
Awi_redraw_5:
		movea.l    48(a7),a0
		jsr        Awi_uniconify
		jsr        Aev_mess
		movea.l    48(a7),a0
		move.l     20(a0),8(a7)
Awi_redraw_4:
		movea.l    48(a7),a0
		move.w     86(a0),d0
		and.w      #$0800,d0
		beq        Awi_redraw_6
		movea.l    48(a7),a0
		move.w     32(a0),d0
		lsl.w      #2,d0
		lea.l      _ACSv_wiicons,a0
		move.l     0(a0,d0.w),8(a7)
		beq        Awi_redraw_6
		movea.l    44(a7),a0
		pea.l      6(a0)
		movea.l    48(a7),a0
		pea.l      4(a0)
		movea.l    52(a7),a0
		pea.l      2(a0)
		move.l     56(a7),-(a7)
		moveq.l    #4,d1
		movea.l    64(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    44(a7),a0
		movea.l    8(a7),a1
		move.w     (a0),16(a1)
		movea.l    44(a7),a0
		movea.l    8(a7),a1
		move.w     2(a0),18(a1)
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0100,d0
		jsr        mt_graf_mouse
		pea.l      22(a7)
		pea.l      24(a7)
		pea.l      26(a7)
		pea.l      28(a7)
		moveq.l    #11,d1
		movea.l    64(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		bra.s      Awi_redraw_7
Awi_redraw_11:
		movea.l    44(a7),a1
		lea.l      16(a7),a0
		jsr        intersect
		move.w     20(a7),d0
		bne.s      Awi_redraw_8
		move.w     22(a7),d0
		beq.s      Awi_redraw_9
Awi_redraw_8:
		move.w     22(a7),-(a7)
		move.w     22(a7),-(a7)
		move.w     22(a7),-(a7)
		movea.l    _globl,a1
		move.w     22(a7),d2
		moveq.l    #6,d1
		clr.w      d0
		movea.l    14(a7),a0
		jsr        mt_objc_draw
		addq.w     #6,a7
Awi_redraw_9:
		pea.l      22(a7)
		pea.l      24(a7)
		pea.l      26(a7)
		pea.l      28(a7)
		moveq.l    #12,d1
		movea.l    64(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
Awi_redraw_7:
		move.w     20(a7),d0
		beq.s      Awi_redraw_10
		move.w     22(a7),d0
		bne.s      Awi_redraw_11
Awi_redraw_10:
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0101,d0
		jsr        mt_graf_mouse
		bra        Awi_redraw_3
Awi_redraw_6:
		moveq.l    #16,d0
		movea.l    48(a7),a0
		and.w      86(a0),d0
		beq.s      Awi_redraw_12
		movea.l    48(a7),a0
		lea.l      36(a0),a0
		move.l     a0,44(a7)
		movea.l    48(a7),a0
		andi.w     #$FFEF,86(a0)
Awi_redraw_12:
		movea.l    8(a7),a0
		move.w     16(a0),36(a7)
		movea.l    8(a7),a0
		move.w     18(a0),34(a7)
		movea.l    48(a7),a0
		lea.l      52(a0),a0
		move.l     a0,12(a7)
		movea.l    12(a7),a0
		move.w     (a0),d0
		movea.l    8(a7),a0
		add.w      d0,16(a0)
		movea.l    12(a7),a0
		move.w     2(a0),d0
		movea.l    8(a7),a0
		add.w      d0,18(a0)
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0100,d0
		jsr        mt_graf_mouse
		pea.l      22(a7)
		pea.l      24(a7)
		pea.l      26(a7)
		pea.l      28(a7)
		moveq.l    #11,d1
		move.w     58(a7),d0
		jsr        wind_get
		lea.l      16(a7),a7
		bra        Awi_redraw_13
Awi_redraw_23:
		movea.l    44(a7),a1
		lea.l      16(a7),a0
		jsr        intersect
		move.w     20(a7),d0
		bne.s      Awi_redraw_14
		move.w     22(a7),d0
		beq        Awi_redraw_15
Awi_redraw_14:
		move.w     18(a7),d0
		movea.l    12(a7),a0
		sub.w      2(a0),d0
		move.w     d0,32(a7)
		move.w     32(a7),d0
		bpl        Awi_redraw_16
		movea.l    48(a7),a0
		move.l     94(a0),4(a7)
		beq        Awi_redraw_17
		movea.l    4(a7),a0
		move.w     2(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		move.w     2(a0,d0.l),38(a7)
		move.w     38(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		cmpi.w     #$0003,2(a0,d0.l)
		bne.s      Awi_redraw_18
		movea.l    4(a7),a0
		move.w     38(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a1
		move.w     72(a0),2(a1,d0.l)
		movea.l    4(a7),a0
		move.w     4(a0),40(a7)
		move.w     40(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    4(a7),a0
		move.w     2(a0,d1.l),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		move.w     40(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    4(a7),a1
		move.w     0(a0,d0.l),2(a1,d1.l)
Awi_redraw_18:
		move.w     22(a7),-(a7)
		move.w     22(a7),-(a7)
		move.w     22(a7),-(a7)
		movea.l    _globl,a1
		move.w     22(a7),d2
		moveq.l    #6,d1
		movea.l    10(a7),a0
		move.w     2(a0),d0
		movea.l    10(a7),a0
		jsr        mt_objc_draw
		addq.w     #6,a7
Awi_redraw_17:
		movea.l    48(a7),a0
		move.l     24(a0),(a7)
		beq        Awi_redraw_19
		movea.l    (a7),a0
		move.w     18(a0),d0
		movea.l    12(a7),a0
		add.w      2(a0),d0
		move.w     d0,26(a7)
		move.w     26(a7),d0
		cmp.w      18(a7),d0
		bge.s      Awi_redraw_20
		move.w     18(a7),26(a7)
Awi_redraw_20:
		move.w     18(a7),d0
		add.w      22(a7),d0
		move.w     d0,24(a7)
		movea.l    12(a7),a0
		move.w     24(a7),d0
		cmp.w      2(a0),d0
		ble.s      Awi_redraw_21
		movea.l    12(a7),a0
		move.w     2(a0),24(a7)
Awi_redraw_21:
		move.w     24(a7),d0
		cmp.w      26(a7),d0
		ble.s      Awi_redraw_19
		movea.l    (a7),a0
		move.w     16(a0),30(a7)
		movea.l    (a7),a0
		move.w     18(a0),28(a7)
		movea.l    12(a7),a0
		move.w     (a0),d0
		movea.l    (a7),a0
		add.w      d0,16(a0)
		movea.l    12(a7),a0
		move.w     2(a0),d0
		movea.l    (a7),a0
		add.w      d0,18(a0)
		move.w     24(a7),d0
		sub.w      26(a7),d0
		move.w     d0,-(a7)
		move.w     22(a7),-(a7)
		move.w     30(a7),-(a7)
		movea.l    _globl,a1
		move.w     22(a7),d2
		moveq.l    #6,d1
		clr.w      d0
		movea.l    6(a7),a0
		jsr        mt_objc_draw
		addq.w     #6,a7
		movea.l    (a7),a0
		move.w     30(a7),16(a0)
		movea.l    (a7),a0
		move.w     28(a7),18(a0)
Awi_redraw_19:
		move.w     32(a7),d0
		sub.w      d0,18(a7)
		move.w     32(a7),d0
		add.w      d0,22(a7)
Awi_redraw_16:
		move.w     22(a7),d0
		ble.s      Awi_redraw_15
		move.w     22(a7),-(a7)
		move.w     22(a7),-(a7)
		move.w     22(a7),-(a7)
		movea.l    _globl,a1
		move.w     22(a7),d2
		moveq.l    #6,d1
		clr.w      d0
		movea.l    14(a7),a0
		jsr        mt_objc_draw
		addq.w     #6,a7
Awi_redraw_15:
		pea.l      22(a7)
		pea.l      24(a7)
		pea.l      26(a7)
		pea.l      28(a7)
		moveq.l    #12,d1
		move.w     58(a7),d0
		jsr        wind_get
		lea.l      16(a7),a7
Awi_redraw_13:
		move.w     20(a7),d0
		beq.s      Awi_redraw_22
		move.w     22(a7),d0
		bne        Awi_redraw_23
Awi_redraw_22:
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0101,d0
		jsr        mt_graf_mouse
		movea.l    48(a7),a0
		movea.l    20(a0),a0
		move.w     36(a7),16(a0)
		movea.l    48(a7),a0
		movea.l    20(a0),a0
		move.w     34(a7),18(a0)
Awi_redraw_3:
		lea.l      52(a7),a7
		rts

next_arrow:
		move.l     a2,-(a7)
		lea.l      -18(a7),a7
		move.l     _globl,-(a7)
		pea.l      20(a7)
		pea.l      24(a7)
		pea.l      28(a7)
		pea.l      32(a7)
		pea.l      36(a7)
		moveq.l    #5,d0
		move.l     d0,-(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		lea.l      66(a7),a1
		lea.l      50(a7),a0
		clr.w      d2
		clr.w      d1
		moveq.l    #48,d0
		jsr        mt_evnt_multi
		lea.l      50(a7),a7
		and.w      #$0010,d0
		beq.s      next_arrow_1
		cmpi.w     #$0018,(a7)
		bne.s      next_arrow_2
		moveq.l    #1,d0
		bra.s      next_arrow_3
		bra.s      next_arrow_1
next_arrow_2:
		movea.l    _globl,a1
		lea.l      (a7),a0
		moveq.l    #16,d1
		movea.l    ACSblk,a2
		move.w     (a2),d0
		jsr        mt_appl_write
next_arrow_1:
		clr.w      d0
next_arrow_3:
		lea.l      18(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_arrowed
Awi_arrowed:
		lea.l      -32(a7),a7
		move.l     a0,28(a7)
		move.w     d0,26(a7)
		move.w     d1,24(a7)
		movea.l    28(a7),a0
		move.w     32(a0),d0
		bgt.s      Awi_arrowed_1
		bra        Awi_arrowed_2
Awi_arrowed_1:
		movea.l    28(a7),a0
		move.w     72(a0),d0
		or.w       #$FF00,d0
		move.w     d0,12(a7)
		movea.l    28(a7),a0
		move.w     72(a0),d0
		asr.w      #8,d0
		move.w     d0,10(a7)
		movea.l    28(a7),a0
		move.l     20(a0),20(a7)
		move.w     12(a7),d0
		not.w      d0
		movea.l    20(a7),a0
		add.w      d0,20(a0)
		move.w     12(a7),d0
		movea.l    20(a7),a0
		and.w      d0,20(a0)
		move.w     10(a7),d0
		not.w      d0
		movea.l    20(a7),a0
		add.w      d0,22(a0)
		move.w     10(a7),d0
		movea.l    20(a7),a0
		and.w      d0,22(a0)
		move.w     12(a7),d0
		neg.w      d0
		move.w     d0,8(a7)
		move.w     10(a7),d0
		neg.w      d0
		move.w     d0,6(a7)
		movea.l    28(a7),a0
		move.w     56(a0),d0
		movea.l    20(a7),a0
		sub.w      20(a0),d0
		move.w     d0,2(a7)
		movea.l    28(a7),a0
		move.w     58(a0),d0
		movea.l    20(a7),a0
		sub.w      22(a0),d0
		move.w     d0,(a7)
		move.w     26(a7),d0
		cmp.w      #$0007,d0
		bhi.s      Awi_arrowed_3
		add.w      d0,d0
		move.w     J41(pc,d0.w),d0
		jmp        J41(pc,d0.w)
J41:
		dc.w Awi_arrowed_4-J41
		dc.w Awi_arrowed_4-J41
		dc.w Awi_arrowed_5-J41
		dc.w Awi_arrowed_5-J41
		dc.w Awi_arrowed_4-J41
		dc.w Awi_arrowed_4-J41
		dc.w Awi_arrowed_6-J41
		dc.w Awi_arrowed_6-J41
Awi_arrowed_4:
		move.w     #$0001,4(a7)
		bra.s      Awi_arrowed_3
Awi_arrowed_6:
		move.l     #$000003E8,d0
		movea.l    28(a7),a0
		move.w     64(a0),d1
		ext.l      d1
		jsr        _ldiv
		asr.l      #4,d0
		addq.w     #2,d0
		move.w     d0,4(a7)
		bra.s      Awi_arrowed_3
Awi_arrowed_5:
		move.l     #$000003E8,d0
		movea.l    28(a7),a0
		move.w     66(a0),d1
		ext.l      d1
		jsr        _ldiv
		asr.l      #4,d0
		addq.w     #2,d0
		move.w     d0,4(a7)
		nop
Awi_arrowed_3:
		move.w     4(a7),18(a7)
Awi_arrowed_30:
		movea.l    20(a7),a0
		move.w     16(a0),16(a7)
		movea.l    20(a7),a0
		move.w     18(a0),14(a7)
		move.w     26(a7),d0
		cmp.w      #$0007,d0
		bhi        Awi_arrowed_7
		add.w      d0,d0
		move.w     J42(pc,d0.w),d0
		jmp        J42(pc,d0.w)
J42:
		dc.w Awi_arrowed_8-J42
		dc.w Awi_arrowed_9-J42
		dc.w Awi_arrowed_10-J42
		dc.w Awi_arrowed_11-J42
		dc.w Awi_arrowed_12-J42
		dc.w Awi_arrowed_13-J42
		dc.w Awi_arrowed_14-J42
		dc.w Awi_arrowed_15-J42
Awi_arrowed_8:
		move.w     14(a7),d0
		bne.s      Awi_arrowed_16
		bra        Awi_arrowed_17
Awi_arrowed_16:
		movea.l    28(a7),a0
		move.w     58(a0),d0
		muls.w     24(a7),d0
		movea.l    20(a7),a0
		add.w      d0,18(a0)
		bra        Awi_arrowed_7
Awi_arrowed_9:
		move.w     14(a7),d0
		cmp.w      (a7),d0
		bne.s      Awi_arrowed_18
		bra        Awi_arrowed_17
Awi_arrowed_18:
		movea.l    28(a7),a0
		move.w     58(a0),d0
		muls.w     24(a7),d0
		movea.l    20(a7),a0
		sub.w      d0,18(a0)
		bra        Awi_arrowed_7
Awi_arrowed_10:
		move.w     14(a7),d0
		bne.s      Awi_arrowed_19
		bra        Awi_arrowed_17
Awi_arrowed_19:
		move.w     6(a7),d0
		muls.w     24(a7),d0
		movea.l    20(a7),a0
		add.w      d0,18(a0)
		bra        Awi_arrowed_7
Awi_arrowed_11:
		move.w     14(a7),d0
		cmp.w      (a7),d0
		bne.s      Awi_arrowed_20
		bra        Awi_arrowed_17
Awi_arrowed_20:
		move.w     6(a7),d0
		muls.w     24(a7),d0
		movea.l    20(a7),a0
		sub.w      d0,18(a0)
		bra        Awi_arrowed_7
Awi_arrowed_12:
		move.w     16(a7),d0
		bne.s      Awi_arrowed_21
		bra        Awi_arrowed_17
Awi_arrowed_21:
		movea.l    28(a7),a0
		move.w     56(a0),d0
		muls.w     24(a7),d0
		movea.l    20(a7),a0
		add.w      d0,16(a0)
		bra.s      Awi_arrowed_7
Awi_arrowed_13:
		move.w     16(a7),d0
		cmp.w      2(a7),d0
		bne.s      Awi_arrowed_22
		bra        Awi_arrowed_17
Awi_arrowed_22:
		movea.l    28(a7),a0
		move.w     56(a0),d0
		muls.w     24(a7),d0
		movea.l    20(a7),a0
		sub.w      d0,16(a0)
		bra.s      Awi_arrowed_7
Awi_arrowed_14:
		move.w     16(a7),d0
		bne.s      Awi_arrowed_23
		bra        Awi_arrowed_17
Awi_arrowed_23:
		move.w     8(a7),d0
		muls.w     24(a7),d0
		movea.l    20(a7),a0
		add.w      d0,16(a0)
		bra.s      Awi_arrowed_7
Awi_arrowed_15:
		move.w     16(a7),d0
		cmp.w      2(a7),d0
		bne.s      Awi_arrowed_24
		bra        Awi_arrowed_17
Awi_arrowed_24:
		move.w     8(a7),d0
		muls.w     24(a7),d0
		movea.l    20(a7),a0
		sub.w      d0,16(a0)
		nop
Awi_arrowed_7:
		movea.l    20(a7),a0
		move.w     16(a0),d0
		ble.s      Awi_arrowed_25
		movea.l    20(a7),a0
		clr.w      16(a0)
Awi_arrowed_25:
		movea.l    20(a7),a0
		move.w     16(a0),d0
		cmp.w      2(a7),d0
		bge.s      Awi_arrowed_26
		movea.l    20(a7),a0
		move.w     2(a7),16(a0)
Awi_arrowed_26:
		movea.l    20(a7),a0
		move.w     18(a0),d0
		ble.s      Awi_arrowed_27
		movea.l    20(a7),a0
		clr.w      18(a0)
Awi_arrowed_27:
		movea.l    20(a7),a0
		move.w     18(a0),d0
		cmp.w      (a7),d0
		bge.s      Awi_arrowed_28
		movea.l    20(a7),a0
		move.w     (a7),18(a0)
Awi_arrowed_28:
		movea.l    20(a7),a0
		move.w     16(a0),d0
		neg.w      d0
		move.w     8(a7),d1
		neg.w      d1
		and.w      d1,d0
		neg.w      d0
		movea.l    20(a7),a0
		move.w     d0,16(a0)
		movea.l    20(a7),a0
		move.w     18(a0),d0
		neg.w      d0
		move.w     6(a7),d1
		neg.w      d1
		and.w      d1,d0
		neg.w      d0
		movea.l    20(a7),a0
		move.w     d0,18(a0)
		subq.w     #1,18(a7)
		bne.s      Awi_arrowed_29
		movea.l    28(a7),a0
		jsr        Awi_cleanup
		move.w     4(a7),18(a7)
Awi_arrowed_29:
		move.w     14(a7),d1
		move.w     16(a7),d0
		movea.l    28(a7),a0
		jsr        Awi_scroll
		bsr        next_arrow
		tst.w      d0
		bne        Awi_arrowed_30
Awi_arrowed_17:
		move.w     18(a7),d0
		cmp.w      4(a7),d0
		beq.s      Awi_arrowed_2
		movea.l    28(a7),a0
		jsr        Awi_cleanup
Awi_arrowed_2:
		lea.l      32(a7),a7
		rts

	.globl Awi_hslid
Awi_hslid:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.w     d0,6(a7)
		movea.l    8(a7),a0
		move.w     32(a0),d0
		bgt.s      Awi_hslid_1
		bra        Awi_hslid_2
Awi_hslid_1:
		movea.l    8(a7),a0
		movea.l    20(a0),a0
		move.w     16(a0),4(a7)
		move.w     6(a7),d0
		ext.l      d0
		movea.l    8(a7),a0
		movea.l    20(a0),a0
		move.w     20(a0),d1
		movea.l    8(a7),a0
		sub.w      56(a0),d1
		ext.l      d1
		jsr        _lmul
		move.l     #$FFFFFC18,d1
		jsr        _ldiv
		movea.l    8(a7),a0
		move.w     72(a0),d1
		or.w       #$FF00,d1
		and.w      d1,d0
		move.w     d0,(a7)
		move.w     4(a7),d0
		cmp.w      (a7),d0
		beq.s      Awi_hslid_2
		movea.l    8(a7),a0
		movea.l    20(a0),a0
		move.w     (a7),16(a0)
		movea.l    8(a7),a0
		movea.l    20(a0),a0
		move.w     18(a0),2(a7)
		movea.l    8(a7),a0
		jsr        Awi_cleanup
		move.w     2(a7),d1
		move.w     4(a7),d0
		movea.l    8(a7),a0
		jsr        Awi_scroll
Awi_hslid_2:
		lea.l      12(a7),a7
		rts

	.globl Awi_vslid
Awi_vslid:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.w     d0,6(a7)
		movea.l    8(a7),a0
		move.w     32(a0),d0
		bgt.s      Awi_vslid_1
		bra        Awi_vslid_2
Awi_vslid_1:
		movea.l    8(a7),a0
		movea.l    20(a0),a0
		move.w     18(a0),2(a7)
		move.w     6(a7),d0
		ext.l      d0
		movea.l    8(a7),a0
		movea.l    20(a0),a0
		move.w     22(a0),d1
		movea.l    8(a7),a0
		sub.w      58(a0),d1
		ext.l      d1
		jsr        _lmul
		move.l     #$FFFFFC18,d1
		jsr        _ldiv
		movea.l    8(a7),a0
		move.w     72(a0),d1
		asr.w      #8,d1
		and.w      d1,d0
		move.w     d0,(a7)
		move.w     2(a7),d0
		cmp.w      (a7),d0
		beq.s      Awi_vslid_2
		movea.l    8(a7),a0
		movea.l    20(a0),a0
		move.w     (a7),18(a0)
		movea.l    8(a7),a0
		movea.l    20(a0),a0
		move.w     16(a0),4(a7)
		movea.l    8(a7),a0
		jsr        Awi_cleanup
		move.w     2(a7),d1
		move.w     4(a7),d0
		movea.l    8(a7),a0
		jsr        Awi_scroll
Awi_vslid_2:
		lea.l      12(a7),a7
		rts

	.globl Awi_wheeled
Awi_wheeled:
		lea.l      -36(a7),a7
		move.l     a0,20(a7)
		move.l     a1,16(a7)
		move.w     d0,14(a7)
		move.w     d1,12(a7)
		clr.w      10(a7)
		jsr        nkc_kstate
		move.w     d0,4(a7)
		clr.l      -(a7)
		suba.l     a1,a1
		move.w     16(a7),d1
		move.w     18(a7),d0
		movea.l    24(a7),a0
		jsr        Awi_obfind
		addq.w     #4,a7
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Awi_wheeled_1
		movea.l    (a7),a0
		cmpi.w     #$0018,6(a0)
		nop
Awi_wheeled_1:
		move.w     10(a7),d0
		bne        Awi_wheeled_2
		clr.w      30(a7)
		clr.w      28(a7)
		pea.l      8(a7)
		moveq.l    #16,d1
		movea.l    24(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		addq.w     #4,a7
		pea.l      6(a7)
		moveq.l    #15,d1
		movea.l    24(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		addq.w     #4,a7
		move.l     _globl,-(a7)
		pea.l      36(a7)
		pea.l      42(a7)
		lea.l      44(a7),a1
		lea.l      44(a7),a0
		moveq.l    #8,d0
		jsr        mt_appl_getinfo
		lea.l      12(a7),a7
		tst.w      d0
		beq        Awi_wheeled_3
		moveq.l    #3,d0
		and.w      34(a7),d0
		subq.w     #3,d0
		bne        Awi_wheeled_3
		movea.l    16(a7),a0
		move.w     (a0),d0
		ble.s      Awi_wheeled_4
		move.w     #$0080,d0
		movea.l    20(a7),a0
		and.w      34(a0),d0
		beq.s      Awi_wheeled_4
		cmpi.w     #$03E8,8(a7)
		bge.s      Awi_wheeled_4
		move.w     #$0002,28(a7)
		movea.l    16(a7),a0
		move.w     (a0),24(a7)
		bra.s      Awi_wheeled_5
Awi_wheeled_4:
		movea.l    16(a7),a0
		move.w     (a0),d0
		bpl.s      Awi_wheeled_5
		moveq.l    #64,d0
		movea.l    20(a7),a0
		and.w      34(a0),d0
		beq.s      Awi_wheeled_5
		cmpi.w     #$03E8,8(a7)
		bge.s      Awi_wheeled_5
		move.w     #$0003,28(a7)
		movea.l    16(a7),a0
		move.w     (a0),d0
		neg.w      d0
		move.w     d0,24(a7)
Awi_wheeled_5:
		movea.l    16(a7),a0
		move.w     2(a0),d0
		ble.s      Awi_wheeled_6
		movea.l    20(a7),a0
		move.w     34(a0),d0
		and.w      #$0400,d0
		beq.s      Awi_wheeled_6
		cmpi.w     #$03E8,6(a7)
		bge.s      Awi_wheeled_6
		move.w     #$0007,30(a7)
		movea.l    16(a7),a0
		move.w     2(a0),26(a7)
		bra.s      Awi_wheeled_7
Awi_wheeled_6:
		movea.l    16(a7),a0
		move.w     2(a0),d0
		bpl.s      Awi_wheeled_7
		movea.l    20(a7),a0
		move.w     34(a0),d0
		and.w      #$0200,d0
		beq.s      Awi_wheeled_7
		cmpi.w     #$03E8,6(a7)
		bge.s      Awi_wheeled_7
		move.w     #$0006,30(a7)
		movea.l    16(a7),a0
		move.w     2(a0),d0
		neg.w      d0
		move.w     d0,26(a7)
Awi_wheeled_7:
		bra        Awi_wheeled_8
Awi_wheeled_3:
		movea.l    16(a7),a0
		move.w     (a0),d0
		ble.s      Awi_wheeled_9
		move.w     #$0080,d0
		movea.l    20(a7),a0
		and.w      34(a0),d0
		beq.s      Awi_wheeled_9
		move.w     4(a7),d0
		and.w      #$0400,d0
		beq.s      Awi_wheeled_10
		cmpi.w     #$03E8,8(a7)
		bge.s      Awi_wheeled_9
Awi_wheeled_10:
		move.w     #$0002,28(a7)
		movea.l    16(a7),a0
		move.w     (a0),24(a7)
		bra        Awi_wheeled_8
Awi_wheeled_9:
		movea.l    16(a7),a0
		move.w     (a0),d0
		bpl.s      Awi_wheeled_11
		moveq.l    #64,d0
		movea.l    20(a7),a0
		and.w      34(a0),d0
		beq.s      Awi_wheeled_11
		move.w     4(a7),d0
		and.w      #$0400,d0
		beq.s      Awi_wheeled_12
		cmpi.w     #$03E8,8(a7)
		bge.s      Awi_wheeled_11
Awi_wheeled_12:
		move.w     #$0003,28(a7)
		movea.l    16(a7),a0
		move.w     (a0),d0
		neg.w      d0
		move.w     d0,24(a7)
		bra        Awi_wheeled_8
Awi_wheeled_11:
		movea.l    16(a7),a0
		move.w     (a0),d0
		ble.s      Awi_wheeled_13
		movea.l    20(a7),a0
		move.w     34(a0),d0
		and.w      #$0400,d0
		beq.s      Awi_wheeled_13
		cmpi.w     #$03E8,6(a7)
		bge.s      Awi_wheeled_13
		move.w     #$0007,30(a7)
		movea.l    16(a7),a0
		move.w     (a0),26(a7)
		bra        Awi_wheeled_8
Awi_wheeled_13:
		movea.l    16(a7),a0
		move.w     (a0),d0
		bpl.s      Awi_wheeled_14
		movea.l    20(a7),a0
		move.w     34(a0),d0
		and.w      #$0200,d0
		beq.s      Awi_wheeled_14
		cmpi.w     #$03E8,6(a7)
		bge.s      Awi_wheeled_14
		move.w     #$0006,30(a7)
		movea.l    16(a7),a0
		move.w     (a0),d0
		neg.w      d0
		move.w     d0,26(a7)
		bra.s      Awi_wheeled_8
Awi_wheeled_14:
		movea.l    16(a7),a0
		move.w     (a0),d0
		ble.s      Awi_wheeled_15
		move.w     #$0080,d0
		movea.l    20(a7),a0
		and.w      34(a0),d0
		beq.s      Awi_wheeled_15
		cmpi.w     #$03E8,8(a7)
		bge.s      Awi_wheeled_15
		move.w     #$0002,28(a7)
		movea.l    16(a7),a0
		move.w     (a0),24(a7)
		bra.s      Awi_wheeled_8
Awi_wheeled_15:
		movea.l    16(a7),a0
		move.w     (a0),d0
		bpl.s      Awi_wheeled_8
		moveq.l    #64,d0
		movea.l    20(a7),a0
		and.w      34(a0),d0
		beq.s      Awi_wheeled_8
		cmpi.w     #$03E8,8(a7)
		bge.s      Awi_wheeled_8
		move.w     #$0003,28(a7)
		movea.l    16(a7),a0
		move.w     (a0),d0
		neg.w      d0
		move.w     d0,24(a7)
Awi_wheeled_8:
		move.w     30(a7),d0
		beq.s      Awi_wheeled_16
		move.w     26(a7),d0
		beq.s      Awi_wheeled_16
		move.w     26(a7),d1
		move.w     30(a7),d0
		movea.l    20(a7),a0
		movea.l    20(a7),a1
		movea.l    122(a1),a1
		jsr        (a1)
Awi_wheeled_16:
		move.w     28(a7),d0
		beq.s      Awi_wheeled_2
		move.w     24(a7),d0
		beq.s      Awi_wheeled_2
		move.w     24(a7),d1
		move.w     28(a7),d0
		movea.l    20(a7),a0
		movea.l    20(a7),a1
		movea.l    122(a1),a1
		jsr        (a1)
Awi_wheeled_2:
		moveq.l    #1,d0
		lea.l      36(a7),a7
		rts

	.globl Awi_obview
Awi_obview:
		move.l     a2,-(a7)
		lea.l      -40(a7),a7
		move.l     a0,36(a7)
		move.l     a1,32(a7)
		movea.l    36(a7),a0
		move.w     32(a0),d0
		bgt.s      Awi_obview_1
		bra        Awi_obview_2
Awi_obview_1:
		clr.w      30(a7)
		movea.l    36(a7),a0
		move.l     20(a0),8(a7)
		movea.l    36(a7),a0
		move.w     34(a0),d0
		and.w      #$01C0,d0
		cmp.w      #$01C0,d0
		bne.s      Awi_obview_3
		move.w     #$0001,28(a7)
		bra.s      Awi_obview_4
Awi_obview_3:
		clr.w      28(a7)
Awi_obview_4:
		movea.l    36(a7),a0
		move.w     34(a0),d0
		and.w      #$0E00,d0
		cmp.w      #$0E00,d0
		bne.s      Awi_obview_5
		move.w     #$0001,26(a7)
		bra.s      Awi_obview_6
Awi_obview_5:
		clr.w      26(a7)
Awi_obview_6:
		movea.l    36(a7),a0
		move.w     72(a0),d0
		or.w       #$FF00,d0
		neg.w      d0
		add.w      d0,d0
		movea.l    32(a7),a0
		add.w      d0,4(a0)
		movea.l    36(a7),a0
		move.w     72(a0),d0
		asr.w      #8,d0
		neg.w      d0
		add.w      d0,d0
		movea.l    32(a7),a0
		add.w      d0,6(a0)
		movea.l    8(a7),a0
		move.w     16(a0),24(a7)
		movea.l    8(a7),a0
		move.w     18(a0),22(a7)
		movea.l    36(a7),a0
		move.w     56(a0),20(a7)
		movea.l    36(a7),a0
		move.w     58(a0),18(a7)
		move.w     26(a7),d0
		beq.s      Awi_obview_7
		movea.l    32(a7),a0
		move.w     (a0),d0
		bpl.s      Awi_obview_7
		movea.l    32(a7),a0
		move.w     (a0),d0
		movea.l    8(a7),a0
		sub.w      d0,16(a0)
		move.w     #$0001,30(a7)
Awi_obview_7:
		move.w     28(a7),d0
		beq.s      Awi_obview_8
		movea.l    32(a7),a0
		move.w     2(a0),d0
		bpl.s      Awi_obview_8
		movea.l    32(a7),a0
		move.w     2(a0),d0
		movea.l    8(a7),a0
		sub.w      d0,18(a0)
		move.w     #$0001,30(a7)
Awi_obview_8:
		move.w     26(a7),d0
		beq.s      Awi_obview_9
		movea.l    32(a7),a0
		move.w     4(a0),d0
		cmp.w      20(a7),d0
		ble.s      Awi_obview_9
		movea.l    32(a7),a0
		movea.l    36(a7),a1
		move.w     4(a0),56(a1)
		move.w     #$0001,30(a7)
Awi_obview_9:
		move.w     28(a7),d0
		beq.s      Awi_obview_10
		movea.l    32(a7),a0
		move.w     6(a0),d0
		cmp.w      18(a7),d0
		ble.s      Awi_obview_10
		movea.l    32(a7),a0
		movea.l    36(a7),a1
		move.w     6(a0),58(a1)
		move.w     #$0001,30(a7)
Awi_obview_10:
		movea.l    32(a7),a0
		move.w     (a0),d0
		movea.l    32(a7),a0
		add.w      4(a0),d0
		movea.l    36(a7),a0
		sub.w      56(a0),d0
		move.w     d0,16(a7)
		move.w     26(a7),d0
		beq.s      Awi_obview_11
		move.w     16(a7),d0
		ble.s      Awi_obview_11
		move.w     16(a7),d0
		movea.l    8(a7),a0
		sub.w      d0,16(a0)
		move.w     #$0001,30(a7)
Awi_obview_11:
		movea.l    32(a7),a0
		move.w     2(a0),d0
		movea.l    32(a7),a0
		add.w      6(a0),d0
		movea.l    36(a7),a0
		sub.w      58(a0),d0
		move.w     d0,14(a7)
		move.w     28(a7),d0
		beq.s      Awi_obview_12
		move.w     14(a7),d0
		ble.s      Awi_obview_12
		move.w     14(a7),d0
		movea.l    8(a7),a0
		sub.w      d0,18(a0)
		move.w     #$0001,30(a7)
Awi_obview_12:
		move.w     30(a7),d0
		bne.s      Awi_obview_13
		bra        Awi_obview_2
Awi_obview_13:
		clr.w      12(a7)
		movea.l    36(a7),a0
		move.l     94(a0),4(a7)
		beq.s      Awi_obview_14
		movea.l    4(a7),a0
		move.w     2(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		move.w     22(a0,d0.l),d0
		add.w      d0,12(a7)
Awi_obview_14:
		movea.l    36(a7),a0
		move.l     24(a0),(a7)
		beq.s      Awi_obview_15
		movea.l    (a7),a0
		move.w     22(a0),d0
		add.w      d0,12(a7)
Awi_obview_15:
		move.l     _globl,-(a7)
		movea.l    40(a7),a0
		pea.l      42(a0)
		movea.l    44(a7),a0
		pea.l      40(a0)
		movea.l    48(a7),a0
		move.w     58(a0),d0
		add.w      24(a7),d0
		move.w     d0,-(a7)
		movea.l    50(a7),a0
		move.w     56(a0),-(a7)
		movea.l    52(a7),a0
		move.w     54(a0),d0
		sub.w      28(a7),d0
		move.w     d0,-(a7)
		movea.l    54(a7),a1
		lea.l      38(a1),a1
		movea.l    54(a7),a0
		lea.l      36(a0),a0
		movea.l    54(a7),a2
		move.w     52(a2),d2
		movea.l    54(a7),a2
		move.w     34(a2),d1
		clr.w      d0
		jsr        mt_wind_calc
		lea.l      18(a7),a7
		movea.l    8(a7),a0
		move.w     16(a0),d0
		neg.w      d0
		movea.l    36(a7),a0
		move.w     72(a0),d1
		or.w       #$FF00,d1
		and.w      d1,d0
		neg.w      d0
		movea.l    8(a7),a0
		move.w     d0,16(a0)
		movea.l    8(a7),a0
		move.w     18(a0),d0
		neg.w      d0
		movea.l    36(a7),a0
		move.w     72(a0),d1
		asr.w      #8,d1
		and.w      d1,d0
		neg.w      d0
		movea.l    8(a7),a0
		move.w     d0,18(a0)
		movea.l    36(a7),a0
		jsr        Awi_cleanup
		movea.l    8(a7),a0
		move.w     16(a0),d0
		cmp.w      24(a7),d0
		bne.s      Awi_obview_16
		movea.l    8(a7),a0
		move.w     18(a0),d0
		cmp.w      22(a7),d0
		bne.s      Awi_obview_16
		movea.l    36(a7),a0
		move.w     56(a0),d0
		cmp.w      20(a7),d0
		bne.s      Awi_obview_16
		movea.l    36(a7),a0
		move.w     58(a0),d0
		cmp.w      18(a7),d0
		bne.s      Awi_obview_16
		bra        Awi_obview_2
Awi_obview_16:
		movea.l    36(a7),a0
		ori.w      #$0010,86(a0)
		movea.l    36(a7),a0
		move.w     42(a0),-(a7)
		movea.l    38(a7),a0
		move.w     40(a0),-(a7)
		movea.l    40(a7),a0
		move.w     38(a0),-(a7)
		movea.l    42(a7),a0
		move.w     36(a0),-(a7)
		moveq.l    #5,d1
		movea.l    44(a7),a0
		move.w     32(a0),d0
		jsr        wind_set
		addq.w     #8,a7
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0300,(a0)
		ble.s      Awi_obview_17
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0400,(a0)
		bge.s      Awi_obview_17
		movea.l    36(a7),a0
		jsr        Awi_slider
Awi_obview_17:
		jsr        Aev_mess
		moveq.l    #16,d0
		movea.l    36(a7),a0
		and.w      86(a0),d0
		beq.s      Awi_obview_2
		movea.l    36(a7),a1
		lea.l      36(a1),a1
		movea.l    36(a7),a0
		movea.l    36(a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
Awi_obview_2:
		lea.l      40(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aob_chdef
Aob_chdef:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		moveq.l    #2,d1
		moveq.l    #-1,d0
		movea.l    4(a7),a0
		jsr        Aob_findflag
		move.w     d0,2(a7)
		bpl.s      Aob_chdef_1
		clr.w      d0
		bra        Aob_chdef_2
Aob_chdef_1:
		move.w     #$4000,d1
		move.w     2(a7),d0
		movea.l    4(a7),a0
		jsr        Aob_findflag
		move.w     d0,(a7)
		move.w     (a7),d0
		bmi.s      Aob_chdef_3
		move.w     #$0080,d0
		move.w     (a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    4(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      Aob_chdef_4
Aob_chdef_3:
		move.w     #$4000,d1
		moveq.l    #-1,d0
		movea.l    4(a7),a0
		jsr        Aob_findflag
		move.w     d0,(a7)
Aob_chdef_4:
		move.w     (a7),d0
		bmi.s      Aob_chdef_5
		move.w     #$0080,d0
		move.w     (a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    4(a7),a0
		and.w      8(a0,d1.l),d0
		bne.s      Aob_chdef_5
		move.w     2(a7),d0
		cmp.w      (a7),d0
		bne.s      Aob_chdef_6
Aob_chdef_5:
		clr.w      d0
		bra        Aob_chdef_2
Aob_chdef_6:
		move.w     2(a7),d0
		bmi.s      Aob_chdef_7
		move.w     2(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		andi.w     #$FFFD,8(a0,d0.l)
Aob_chdef_7:
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		ori.w      #$0002,8(a0,d0.l)
		movea.l    ACSblk,a0
		move.l     4(a7),604(a0)
		movea.l    8(a7),a0
		movea.l    24(a0),a0
		cmpa.l     4(a7),a0
		bne.s      Aob_chdef_8
		move.w     2(a7),d0
		or.w       #$1000,d0
		movea.l    8(a7),a0
		bsr        Awi_obredraw
		move.w     (a7),d2
		ext.l      d2
		move.l     d2,d0
		add.l      d0,d0
		add.l      d2,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		move.w     10(a0,d0.l),d1
		move.w     (a7),d0
		or.w       #$1000,d0
		movea.l    8(a7),a0
		movea.l    8(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
		bra.s      Aob_chdef_9
Aob_chdef_8:
		move.w     2(a7),d0
		movea.l    8(a7),a0
		bsr        Awi_obredraw
		move.w     (a7),d2
		ext.l      d2
		move.l     d2,d0
		add.l      d0,d0
		add.l      d2,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		move.w     10(a0,d0.l),d1
		move.w     (a7),d0
		movea.l    8(a7),a0
		movea.l    8(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
Aob_chdef_9:
		moveq.l    #1,d0
Aob_chdef_2:
		lea.l      12(a7),a7
		rts

Awi_find_edit:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     a1,10(a7)
		movea.l    14(a7),a0
		move.w     28(a0),8(a7)
		move.w     8(a7),d0
		bmi.s      Awi_find_edit_1
		move.w     8(a7),d0
		and.w      #$1000,d0
		beq.s      Awi_find_edit_2
		movea.l    14(a7),a0
		move.l     24(a0),4(a7)
		bra.s      Awi_find_edit_3
Awi_find_edit_2:
		movea.l    14(a7),a0
		move.l     20(a0),4(a7)
Awi_find_edit_3:
		move.l     4(a7),d0
		beq.s      Awi_find_edit_4
		move.w     8(a7),d1
		and.w      #$0FFF,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		cmpi.b     #$18,7(a0,d0.l)
		bne.s      Awi_find_edit_4
		move.w     8(a7),d1
		and.w      #$0FFF,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		move.l     12(a0,d0.l),(a7)
		beq.s      Awi_find_edit_4
		movea.l    (a7),a0
		move.l     8(a0),d0
		bne.s      Awi_find_edit_1
Awi_find_edit_4:
		move.w     #$FFFF,8(a7)
Awi_find_edit_1:
		move.w     8(a7),d0
		bpl.s      Awi_find_edit_5
		movea.l    14(a7),a0
		move.l     20(a0),d0
		beq.s      Awi_find_edit_5
		moveq.l    #8,d1
		moveq.l    #-1,d0
		movea.l    14(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_findflag
		move.w     d0,8(a7)
		bpl.s      Awi_find_edit_5
		movea.l    14(a7),a0
		move.l     24(a0),d0
		beq.s      Awi_find_edit_5
		moveq.l    #8,d1
		moveq.l    #-1,d0
		movea.l    14(a7),a0
		movea.l    24(a0),a0
		jsr        Aob_findflag
		or.w       #$1000,d0
		move.w     d0,8(a7)
		bmi.s      Awi_find_edit_5
		ori.w      #$1000,8(a7)
Awi_find_edit_5:
		move.w     8(a7),d0
		ble        Awi_find_edit_6
		move.w     8(a7),d0
		and.w      #$1000,d0
		beq.s      Awi_find_edit_7
		movea.l    14(a7),a0
		movea.l    10(a7),a1
		move.l     24(a0),(a1)
		movea.l    14(a7),a0
		movea.l    22(a7),a1
		move.l     20(a0),(a1)
		move.w     8(a7),d0
		and.w      #$0FFF,d0
		movea.l    26(a7),a0
		move.w     d0,(a0)
		bra.s      Awi_find_edit_8
Awi_find_edit_7:
		movea.l    14(a7),a0
		movea.l    10(a7),a1
		move.l     20(a0),(a1)
		movea.l    14(a7),a0
		movea.l    22(a7),a1
		move.l     24(a0),(a1)
		movea.l    26(a7),a0
		move.w     8(a7),(a0)
Awi_find_edit_8:
		movea.l    26(a7),a0
		move.w     (a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		movea.l    (a0),a0
		cmpi.b     #$18,7(a0,d0.l)
		bne.s      Awi_find_edit_6
		movea.l    26(a7),a0
		move.w     (a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		movea.l    (a0),a0
		move.l     12(a0,d0.l),(a7)
		beq.s      Awi_find_edit_6
		movea.l    (a7),a0
		move.l     8(a0),d0
		beq.s      Awi_find_edit_6
		moveq.l    #1,d0
		bra.s      Awi_find_edit_9
Awi_find_edit_6:
		moveq.l    #0,d0
		movea.l    22(a7),a0
		move.l     d0,(a0)
		movea.l    10(a7),a0
		move.l     d0,(a0)
		movea.l    26(a7),a0
		clr.w      (a0)
		clr.w      d0
Awi_find_edit_9:
		lea.l      18(a7),a7
		rts

Awi_char:
		move.l     a2,-(a7)
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		move.b     d0,2(a7)
		lea.l      xe0cc8,a0
		lea.l      (a7),a1
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     2(a7),(a7)
		lea.l      (a7),a1
		move.w     #$02C0,d0
		movea.l    4(a7),a0
		movea.l    8(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		lea.l      12(a7),a7
		movea.l    (a7)+,a2
		rts

Awi_firstedit:
		subq.w     #6,a7
		move.l     a0,2(a7)
		movea.l    2(a7),a0
		move.l     24(a0),d0
		beq.s      Awi_firstedit_1
		moveq.l    #8,d1
		moveq.l    #-1,d0
		movea.l    2(a7),a0
		movea.l    24(a0),a0
		jsr        Aob_findflag
		move.w     d0,(a7)
		ble.s      Awi_firstedit_1
		move.w     (a7),d0
		or.w       #$1000,d0
		bra.s      Awi_firstedit_2
Awi_firstedit_1:
		moveq.l    #8,d1
		moveq.l    #-1,d0
		movea.l    2(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_findflag
		move.w     d0,(a7)
		ble.s      Awi_firstedit_3
		move.w     (a7),d0
		bra.s      Awi_firstedit_2
Awi_firstedit_3:
		moveq.l    #-1,d0
Awi_firstedit_2:
		addq.w     #6,a7
		rts

Awi_lastedit:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		clr.l      (a7)
		movea.l    8(a7),a0
		move.l     20(a0),d0
		beq.s      Awi_lastedit_1
		moveq.l    #8,d1
		moveq.l    #-1,d0
		movea.l    8(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_findflag
		tst.w      d0
		ble.s      Awi_lastedit_1
		movea.l    8(a7),a0
		move.l     20(a0),(a7)
		bra.s      Awi_lastedit_2
Awi_lastedit_1:
		movea.l    8(a7),a0
		move.l     24(a0),(a7)
Awi_lastedit_2:
		move.l     (a7),d0
		beq.s      Awi_lastedit_3
		move.w     #$FFFF,4(a7)
Awi_lastedit_4:
		move.w     4(a7),6(a7)
		moveq.l    #8,d1
		move.w     6(a7),d0
		movea.l    (a7),a0
		jsr        Aob_findflag
		move.w     d0,4(a7)
		move.w     4(a7),d0
		bgt.s      Awi_lastedit_4
		move.w     6(a7),d0
		ble.s      Awi_lastedit_3
		movea.l    8(a7),a0
		movea.l    24(a0),a0
		cmpa.l     (a7),a0
		bne.s      Awi_lastedit_5
		move.w     6(a7),d0
		or.w       #$1000,d0
		bra.s      Awi_lastedit_6
Awi_lastedit_5:
		move.w     6(a7),d0
Awi_lastedit_6:
		bra.s      Awi_lastedit_7
Awi_lastedit_3:
		moveq.l    #-1,d0
Awi_lastedit_7:
		lea.l      12(a7),a7
		rts

	.globl Awi_focuschg
Awi_focuschg:
		move.l     a2,-(a7)
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.w     d0,14(a7)
		move.w     d1,12(a7)
		move.w     12(a7),d0
		bgt.s      Awi_focuschg_1
		moveq.l    #1,d0
		bra        Awi_focuschg_2
Awi_focuschg_1:
		move.w     12(a7),d0
		and.w      #$1000,d0
		beq.s      Awi_focuschg_3
		movea.l    16(a7),a0
		move.l     24(a0),8(a7)
		bra.s      Awi_focuschg_4
Awi_focuschg_3:
		movea.l    16(a7),a0
		move.l     20(a0),8(a7)
Awi_focuschg_4:
		lea.l      12(a7),a1
		moveq.l    #8,d0
		movea.l    16(a7),a0
		movea.l    16(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		tst.w      d0
		beq.s      Awi_focuschg_5
		move.w     12(a7),d0
		cmp.w      14(a7),d0
		bne.s      Awi_focuschg_5
		clr.w      d0
		bra.s      Awi_focuschg_2
		bra.s      Awi_focuschg_6
Awi_focuschg_5:
		bsr        Awi_diaend
		movea.l    16(a7),a0
		move.w     12(a7),28(a0)
		move.w     12(a7),d0
		and.w      #$0FFF,d0
		movea.l    8(a7),a1
		lea.l      (a7),a0
		jsr        Aob_offset
		move.w     (a7),d0
		bmi.s      Awi_focuschg_7
		move.w     2(a7),d0
		bmi.s      Awi_focuschg_7
		move.w     (a7),d0
		add.w      4(a7),d0
		movea.l    16(a7),a0
		cmp.w      56(a0),d0
		bge.s      Awi_focuschg_7
		move.w     2(a7),d0
		add.w      6(a7),d0
		movea.l    16(a7),a0
		cmp.w      58(a0),d0
		blt.s      Awi_focuschg_8
Awi_focuschg_7:
		lea.l      (a7),a1
		movea.l    16(a7),a0
		bsr        Awi_obview
		jsr        Aev_mess
Awi_focuschg_8:
		bsr        Awi_diastart
Awi_focuschg_6:
		moveq.l    #1,d0
Awi_focuschg_2:
		lea.l      20(a7),a7
		movea.l    (a7)+,a2
		rts

Awi_newsel:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.w     d0,10(a7)
		move.w     d1,8(a7)
		move.w     10(a7),d0
		ble.s      Awi_newsel_1
		move.w     10(a7),d0
		movea.l    12(a7),a0
		jsr        Adr_del
		bra.s      Awi_newsel_2
Awi_newsel_1:
		jsr        Adr_unselect
Awi_newsel_2:
		move.w     8(a7),d0
		movea.l    12(a7),a0
		jsr        Adr_add
		move.w     8(a7),d0
		movea.l    12(a7),a0
		movea.l    20(a0),a1
		lea.l      (a7),a0
		jsr        Aob_offset
		lea.l      (a7),a1
		movea.l    12(a7),a0
		bsr        Awi_obview
		lea.l      16(a7),a7
		rts

Awi_prevsel:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.w     d0,14(a7)
		move.w     d1,12(a7)
		move.w     #$FFFF,(a7)
		movea.l    16(a7),a0
		move.l     20(a0),8(a7)
		movea.l    8(a7),a0
		move.w     2(a0),6(a7)
		movea.l    8(a7),a0
		move.w     4(a0),4(a7)
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		move.w     8(a0,d0.l),d0
		and.w      #$8000,d0
		beq.s      Awi_prevsel_1
		subq.w     #1,4(a7)
Awi_prevsel_1:
		move.w     6(a7),d0
		cmp.w      4(a7),d0
		bne.s      Awi_prevsel_2
		move.w     6(a7),d0
		bra        Awi_prevsel_3
Awi_prevsel_2:
		move.w     4(a7),d0
		cmp.w      14(a7),d0
		ble.s      Awi_prevsel_4
		move.w     14(a7),d0
		beq.s      Awi_prevsel_4
		move.w     14(a7),4(a7)
Awi_prevsel_4:
		move.w     6(a7),2(a7)
		bra        Awi_prevsel_5
Awi_prevsel_11:
		moveq.l    #1,d0
		move.w     2(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    8(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      Awi_prevsel_6
		move.w     #$0080,d0
		move.w     2(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    8(a7),a0
		and.w      8(a0,d1.l),d0
		bne.s      Awi_prevsel_6
		move.w     12(a7),d0
		beq.s      Awi_prevsel_7
		move.w     14(a7),d0
		beq.s      Awi_prevsel_7
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		move.w     16(a0,d0.l),d0
		move.w     2(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    8(a7),a0
		cmp.w      16(a0,d1.l),d0
		bne.s      Awi_prevsel_8
		move.w     2(a7),(a7)
Awi_prevsel_8:
		bra.s      Awi_prevsel_6
Awi_prevsel_7:
		move.w     2(a7),(a7)
Awi_prevsel_6:
		move.w     2(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		move.w     0(a0,d0.l),2(a7)
		move.w     2(a7),d0
		bne.s      Awi_prevsel_5
		bra.s      Awi_prevsel_9
Awi_prevsel_5:
		move.w     14(a7),d0
		beq.s      Awi_prevsel_10
		move.w     2(a7),d0
		cmp.w      4(a7),d0
		blt        Awi_prevsel_11
Awi_prevsel_10:
		move.w     14(a7),d0
		bne.s      Awi_prevsel_9
		move.w     2(a7),d0
		cmp.w      4(a7),d0
		ble        Awi_prevsel_11
Awi_prevsel_9:
		move.w     (a7),d0
Awi_prevsel_3:
		lea.l      20(a7),a7
		rts

Awi_nextsel:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.w     d0,12(a7)
		move.w     d1,10(a7)
		movea.l    14(a7),a0
		move.l     20(a0),6(a7)
		movea.l    6(a7),a0
		move.w     2(a0),4(a7)
		movea.l    6(a7),a0
		move.w     4(a0),2(a7)
		move.w     2(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		move.w     8(a0,d0.l),d0
		and.w      #$8000,d0
		beq.s      Awi_nextsel_1
		subq.w     #1,2(a7)
Awi_nextsel_1:
		move.w     4(a7),d0
		cmp.w      2(a7),d0
		bne.s      Awi_nextsel_2
		move.w     4(a7),d0
		bra        Awi_nextsel_3
Awi_nextsel_2:
		move.w     12(a7),d0
		beq.s      Awi_nextsel_4
		move.w     4(a7),d0
		cmp.w      12(a7),d0
		bge.s      Awi_nextsel_5
		move.w     12(a7),4(a7)
Awi_nextsel_5:
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		move.w     0(a0,d0.l),(a7)
		bra.s      Awi_nextsel_6
Awi_nextsel_4:
		move.w     4(a7),(a7)
Awi_nextsel_6:
		bra        Awi_nextsel_7
Awi_nextsel_13:
		moveq.l    #1,d0
		move.w     (a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    6(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      Awi_nextsel_8
		move.w     #$0080,d0
		move.w     (a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    6(a7),a0
		and.w      8(a0,d1.l),d0
		bne.s      Awi_nextsel_8
		move.w     10(a7),d0
		beq.s      Awi_nextsel_9
		move.w     12(a7),d0
		beq.s      Awi_nextsel_10
		move.w     12(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		move.w     16(a0,d0.l),d0
		move.w     (a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    6(a7),a0
		cmp.w      16(a0,d1.l),d0
		bne.s      Awi_nextsel_11
Awi_nextsel_10:
		move.w     (a7),d0
		bra.s      Awi_nextsel_3
Awi_nextsel_11:
		bra.s      Awi_nextsel_8
Awi_nextsel_9:
		move.w     (a7),d0
		bra.s      Awi_nextsel_3
Awi_nextsel_8:
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		move.w     0(a0,d0.l),(a7)
		move.w     (a7),d0
		bne.s      Awi_nextsel_7
		bra.s      Awi_nextsel_12
Awi_nextsel_7:
		move.w     (a7),d0
		cmp.w      2(a7),d0
		ble        Awi_nextsel_13
Awi_nextsel_12:
		moveq.l    #-1,d0
Awi_nextsel_3:
		lea.l      18(a7),a7
		rts

	.globl Awi_help
Awi_help:
		move.l     a2,-(a7)
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		movea.l    8(a7),a0
		move.l     154(a0),4(a7)
		movea.l    8(a7),a0
		move.l     158(a0),(a7)
		lea.l      (a7),a1
		moveq.l    #41,d0
		movea.l    8(a7),a0
		movea.l    8(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		movea.l    4(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      Awi_help_1
		movea.l    (a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      Awi_help_2
		movea.l    (a7),a1
		movea.l    ACSblk,a0
		lea.l      544(a0),a0
		jsr        Ast_icmp
		tst.w      d0
		beq.s      Awi_help_2
		move.l     8(a7),-(a7)
		movea.l    8(a7),a1
		movea.l    4(a7),a0
		jsr        Aev_STGuideHelp
		addq.w     #4,a7
		bra.s      Awi_help_3
		bra.s      Awi_help_4
Awi_help_2:
		move.l     8(a7),-(a7)
		movea.l    8(a7),a1
		suba.l     a0,a0
		jsr        Aev_STGuideHelp
		addq.w     #4,a7
		bra.s      Awi_help_3
Awi_help_4:
		bra.s      Awi_help_3
Awi_help_1:
		clr.w      d0
		nop
Awi_help_3:
		lea.l      12(a7),a7
		movea.l    (a7)+,a2
		rts

Awi_keyACWork:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.w     d1,2(a7)
		move.w     #$FFFF,(a7)
		move.w     2(a7),d0
		and.w      #$8C00,d0
		bne        Awi_keyACWork_1
		move.w     2(a7),d0
		and.w      #$00FF,d0
		jsr        isascii
		tst.w      d0
		beq        Awi_keyACWork_1
		move.w     2(a7),d0
		and.w      #$00FF,d0
		jsr        isalnum
		tst.w      d0
		beq        Awi_keyACWork_1
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		and.w      1276(a0),d0
		beq.s      Awi_keyACWork_2
		moveq.l    #8,d0
		movea.l    ACSblk,a0
		and.w      1276(a0),d0
		beq.s      Awi_keyACWork_2
		move.w     (a7),d0
		bpl.s      Awi_keyACWork_2
		move.w     2(a7),d1
		or.w       #$8400,d1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		jsr        Aob_wobkey
		move.w     d0,(a7)
Awi_keyACWork_2:
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		and.w      1276(a0),d0
		beq.s      Awi_keyACWork_3
		move.w     (a7),d0
		bpl.s      Awi_keyACWork_3
		move.w     2(a7),d1
		or.w       #$8800,d1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		jsr        Aob_wobkey
		move.w     d0,(a7)
Awi_keyACWork_3:
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		and.w      1276(a0),d0
		beq.s      Awi_keyACWork_4
		moveq.l    #8,d0
		movea.l    ACSblk,a0
		and.w      1276(a0),d0
		bne.s      Awi_keyACWork_4
		move.w     (a7),d0
		bpl.s      Awi_keyACWork_4
		move.w     2(a7),d1
		or.w       #$8400,d1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		jsr        Aob_wobkey
		move.w     d0,(a7)
Awi_keyACWork_4:
		moveq.l    #4,d0
		movea.l    ACSblk,a0
		and.w      1276(a0),d0
		beq.s      Awi_keyACWork_1
		move.w     (a7),d0
		bpl.s      Awi_keyACWork_1
		move.w     2(a7),d1
		or.w       #$8C00,d1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		jsr        Aob_wobkey
		move.w     d0,(a7)
Awi_keyACWork_1:
		move.w     (a7),d0
		lea.l      10(a7),a7
		rts

Awi_keyACTool:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.w     d1,2(a7)
		move.w     #$FFFF,(a7)
		move.w     2(a7),d0
		and.w      #$8C00,d0
		bne        Awi_keyACTool_1
		move.w     2(a7),d0
		and.w      #$00FF,d0
		jsr        isascii
		tst.w      d0
		beq        Awi_keyACTool_1
		move.w     2(a7),d0
		and.w      #$00FF,d0
		jsr        isalnum
		tst.w      d0
		beq        Awi_keyACTool_1
		moveq.l    #32,d0
		movea.l    ACSblk,a0
		and.w      1276(a0),d0
		beq.s      Awi_keyACTool_2
		move.w     #$0080,d0
		movea.l    ACSblk,a0
		and.w      1276(a0),d0
		beq.s      Awi_keyACTool_2
		move.w     (a7),d0
		bpl.s      Awi_keyACTool_2
		move.w     2(a7),d1
		or.w       #$8400,d1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		jsr        Aob_tobkey
		move.w     d0,(a7)
Awi_keyACTool_2:
		moveq.l    #16,d0
		movea.l    ACSblk,a0
		and.w      1276(a0),d0
		beq.s      Awi_keyACTool_3
		move.w     (a7),d0
		bpl.s      Awi_keyACTool_3
		move.w     2(a7),d1
		or.w       #$8800,d1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		jsr        Aob_tobkey
		move.w     d0,(a7)
Awi_keyACTool_3:
		moveq.l    #32,d0
		movea.l    ACSblk,a0
		and.w      1276(a0),d0
		beq.s      Awi_keyACTool_4
		move.w     #$0080,d0
		movea.l    ACSblk,a0
		and.w      1276(a0),d0
		bne.s      Awi_keyACTool_4
		move.w     (a7),d0
		bpl.s      Awi_keyACTool_4
		move.w     2(a7),d1
		or.w       #$8400,d1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		jsr        Aob_tobkey
		move.w     d0,(a7)
Awi_keyACTool_4:
		moveq.l    #64,d0
		movea.l    ACSblk,a0
		and.w      1276(a0),d0
		beq.s      Awi_keyACTool_1
		move.w     (a7),d0
		bpl.s      Awi_keyACTool_1
		move.w     2(a7),d1
		or.w       #$8C00,d1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		jsr        Aob_tobkey
		move.w     d0,(a7)
Awi_keyACTool_1:
		move.w     (a7),d0
		lea.l      10(a7),a7
		rts

Awi_keyACSwitch:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.w     d1,2(a7)
		move.w     #$FFFF,(a7)
		move.w     2(a7),d0
		and.w      #$0C00,d0
		bne.s      Awi_keyACSwitch_1
		move.w     (a7),d0
		bpl.s      Awi_keyACSwitch_2
		movea.l    ACSblk,a0
		move.w     1276(a0),d0
		and.w      #$0100,d0
		beq.s      Awi_keyACSwitch_2
		move.w     2(a7),d1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		bsr        Awi_keyACTool
		move.w     d0,(a7)
Awi_keyACSwitch_2:
		move.w     (a7),d0
		bpl.s      Awi_keyACSwitch_3
		move.w     2(a7),d1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		bsr        Awi_keyACWork
		move.w     d0,(a7)
Awi_keyACSwitch_3:
		move.w     (a7),d0
		bpl.s      Awi_keyACSwitch_1
		movea.l    ACSblk,a0
		move.w     1276(a0),d0
		and.w      #$0100,d0
		bne.s      Awi_keyACSwitch_1
		move.w     2(a7),d1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		bsr        Awi_keyACTool
		move.w     d0,(a7)
Awi_keyACSwitch_1:
		move.w     (a7),d0
		lea.l      10(a7),a7
		rts


	.globl Awi_keysend
Awi_keysend:
		move.l     a2,-(a7)
		lea.l      -310(a7),a7
		move.l     a0,306(a7)
		move.w     d0,304(a7)
		move.w     d1,302(a7)
		move.w     #$FFFF,290(a7)
		movea.l    306(a7),a0
		move.w     86(a0),d0
		and.w      #$0800,d0
		beq.s      Awi_keysend_1
		moveq.l    #-1,d0
		add.w      290(a7),d0
		bra        Awi_keysend_2
Awi_keysend_1:
		moveq.l    #-1,d0
		and.b      303(a7),d0
		cmp.b      #$0E,d0
		bne.s      Awi_keysend_3
		movea.l    306(a7),a0
		bsr        Awi_help
		move.w     290(a7),d0
		bra        Awi_keysend_2
Awi_keysend_3:
		moveq.l    #8,d0
		movea.l    306(a7),a0
		and.w      84(a0),d0
		beq        Awi_keysend_4
		movea.l    306(a7),a0
		move.w     28(a0),d0
		bpl        Awi_keysend_4
		movea.l    306(a7),a0
		move.l     20(a0),22(a7)
		move.l     22(a7),d0
		bne.s      Awi_keysend_5
		moveq.l    #-1,d0
		add.w      290(a7),d0
		bra        Awi_keysend_2
Awi_keysend_5:
		movea.l    306(a7),a0
		move.w     28(a0),d0
		ble.s      Awi_keysend_6
		movea.l    306(a7),a0
		move.w     28(a0),d0
		and.w      #$1000,d0
		beq.s      Awi_keysend_6
		jsr        Adr_unselect
Awi_keysend_6:
		movea.l    306(a7),a0
		move.w     28(a0),d0
		and.w      #$0FFF,d0
		move.w     d0,300(a7)
		move.w     d0,296(a7)
		move.w     302(a7),d0
		bpl        Awi_keysend_7
		move.b     303(a7),d0
		ext.w      d0
		cmp.w      #$000F,d0
		bhi        Awi_keysend_8
		add.w      d0,d0
		move.w     J43(pc,d0.w),d0
		jmp        J43(pc,d0.w)
J43:
		dc.w Awi_keysend_8-J43
		dc.w Awi_keysend_9-J43
		dc.w Awi_keysend_10-J43
		dc.w Awi_keysend_11-J43
		dc.w Awi_keysend_12-J43
		dc.w Awi_keysend_8-J43
		dc.w Awi_keysend_8-J43
		dc.w Awi_keysend_8-J43
		dc.w Awi_keysend_8-J43
		dc.w Awi_keysend_8-J43
		dc.w Awi_keysend_13-J43
		dc.w Awi_keysend_8-J43
		dc.w Awi_keysend_14-J43
		dc.w Awi_keysend_13-J43
		dc.w Awi_keysend_8-J43
		dc.w Awi_keysend_15-J43
Awi_keysend_15:
		jsr        Adr_unselect
		bra        Awi_keysend_16
Awi_keysend_13:
		movea.l    ACSblk,a0
		movea.l    576(a0),a0
		cmpa.l     306(a7),a0
		bne        Awi_keysend_17
		movea.l    ACSblk,a0
		lea.l      614(a0),a0
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vq_key_s
		jsr        Adr_start
		bra.s      Awi_keysend_18
Awi_keysend_20:
		move.w     300(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    22(a7),a0
		ori.w      #$4000,10(a0,d0.l)
		move.w     300(a7),d0
		movea.l    22(a7),a1
		movea.l    306(a7),a0
		jsr        Aob_execute
		move.w     300(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    22(a7),a0
		andi.w     #$BFFF,10(a0,d0.l)
		move.w     300(a7),d0
		movea.l    306(a7),a0
		jsr        Adr_del
Awi_keysend_18:
		jsr        Adr_next
		move.w     d0,300(a7)
		bmi.s      Awi_keysend_19
		move.w     300(a7),d0
		and.w      #$1000,d0
		beq.s      Awi_keysend_20
Awi_keysend_19:
		bra.s      Awi_keysend_21
Awi_keysend_17:
		moveq.l    #-1,d0
		add.w      290(a7),d0
		bra        Awi_keysend_2
Awi_keysend_21:
		bra        Awi_keysend_16
Awi_keysend_12:
		movea.l    ACSblk,a0
		movea.l    576(a0),a0
		cmpa.l     306(a7),a0
		bne.s      Awi_keysend_22
		jsr        Adr_start
		jsr        Adr_next
		move.w     d0,300(a7)
		bra.s      Awi_keysend_23
Awi_keysend_22:
		clr.w      300(a7)
Awi_keysend_23:
		clr.w      d1
		move.w     300(a7),d0
		movea.l    306(a7),a0
		bsr        Awi_prevsel
		move.w     d0,298(a7)
		move.w     298(a7),d0
		ble.s      Awi_keysend_24
		move.w     298(a7),d1
		move.w     300(a7),d0
		movea.l    306(a7),a0
		bsr        Awi_newsel
		bra.s      Awi_keysend_25
Awi_keysend_24:
		moveq.l    #-1,d0
		add.w      290(a7),d0
		bra        Awi_keysend_2
Awi_keysend_25:
		bra        Awi_keysend_16
Awi_keysend_11:
		movea.l    ACSblk,a0
		movea.l    576(a0),a0
		cmpa.l     306(a7),a0
		bne.s      Awi_keysend_26
		jsr        Adr_start
		jsr        Adr_next
		move.w     d0,300(a7)
		bra.s      Awi_keysend_27
Awi_keysend_26:
		clr.w      300(a7)
Awi_keysend_27:
		clr.w      d1
		move.w     300(a7),d0
		movea.l    306(a7),a0
		bsr        Awi_nextsel
		move.w     d0,298(a7)
		move.w     298(a7),d0
		ble.s      Awi_keysend_28
		move.w     298(a7),d1
		move.w     300(a7),d0
		movea.l    306(a7),a0
		bsr        Awi_newsel
		bra.s      Awi_keysend_29
Awi_keysend_28:
		moveq.l    #-1,d0
		add.w      290(a7),d0
		bra        Awi_keysend_2
Awi_keysend_29:
		bra        Awi_keysend_16
Awi_keysend_9:
		movea.l    ACSblk,a0
		movea.l    576(a0),a0
		cmpa.l     306(a7),a0
		bne.s      Awi_keysend_30
		jsr        Adr_start
		jsr        Adr_next
		move.w     d0,300(a7)
		bra.s      Awi_keysend_31
Awi_keysend_30:
		clr.w      300(a7)
Awi_keysend_31:
		moveq.l    #1,d1
		move.w     300(a7),d0
		movea.l    306(a7),a0
		bsr        Awi_prevsel
		move.w     d0,298(a7)
		move.w     298(a7),d0
		ble.s      Awi_keysend_32
		move.w     298(a7),d1
		move.w     300(a7),d0
		movea.l    306(a7),a0
		bsr        Awi_newsel
		bra.s      Awi_keysend_33
Awi_keysend_32:
		moveq.l    #-1,d0
		add.w      290(a7),d0
		bra        Awi_keysend_2
Awi_keysend_33:
		bra        Awi_keysend_16
Awi_keysend_10:
		movea.l    ACSblk,a0
		movea.l    576(a0),a0
		cmpa.l     306(a7),a0
		bne.s      Awi_keysend_34
		jsr        Adr_start
		jsr        Adr_next
		move.w     d0,300(a7)
		bra.s      Awi_keysend_35
Awi_keysend_34:
		clr.w      300(a7)
Awi_keysend_35:
		moveq.l    #1,d1
		move.w     300(a7),d0
		movea.l    306(a7),a0
		bsr        Awi_nextsel
		move.w     d0,298(a7)
		move.w     298(a7),d0
		ble.s      Awi_keysend_36
		move.w     298(a7),d1
		move.w     300(a7),d0
		movea.l    306(a7),a0
		bsr        Awi_newsel
		bra.s      Awi_keysend_37
Awi_keysend_36:
		moveq.l    #-1,d0
		add.w      290(a7),d0
		bra        Awi_keysend_2
Awi_keysend_37:
		bra        Awi_keysend_16
Awi_keysend_14:
		movea.l    ACSblk,a0
		movea.l    576(a0),a0
		cmpa.l     306(a7),a0
		bne        Awi_keysend_38
		move.w     302(a7),d0
		and.w      #$0300,d0
		beq.s      Awi_keysend_39
		movea.l    22(a7),a0
		move.w     4(a0),300(a7)
		move.w     300(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    22(a7),a0
		move.w     8(a0,d0.l),d0
		and.w      #$8000,d0
		beq.s      Awi_keysend_40
		subq.w     #1,300(a7)
Awi_keysend_40:
		bra.s      Awi_keysend_41
Awi_keysend_39:
		movea.l    22(a7),a0
		move.w     2(a0),300(a7)
Awi_keysend_41:
		move.w     300(a7),d0
		ble.s      Awi_keysend_42
		moveq.l    #1,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      Awi_keysend_42
		move.w     #$0080,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		and.w      8(a0,d1.l),d0
		bne.s      Awi_keysend_42
		move.w     300(a7),d1
		moveq.l    #-1,d0
		movea.l    306(a7),a0
		bsr        Awi_newsel
		bra.s      Awi_keysend_43
Awi_keysend_42:
		moveq.l    #-1,d0
		add.w      290(a7),d0
		bra        Awi_keysend_2
Awi_keysend_43:
		bra.s      Awi_keysend_44
Awi_keysend_38:
		move.w     302(a7),d0
		and.w      #$0300,d0
		beq.s      Awi_keysend_45
		move.w     #$03E8,d0
		movea.l    306(a7),a0
		movea.l    306(a7),a1
		movea.l    130(a1),a1
		jsr        (a1)
		bra.s      Awi_keysend_44
Awi_keysend_45:
		clr.w      d0
		movea.l    306(a7),a0
		movea.l    306(a7),a1
		movea.l    130(a1),a1
		jsr        (a1)
Awi_keysend_44:
		bra.s      Awi_keysend_16
Awi_keysend_8:
		move.w     #$FFFF,300(a7)
Awi_keysend_16:
		bra        Awi_keysend_46
Awi_keysend_7:
		movea.l    22(a7),a0
		move.w     2(a0),300(a7)
		bra        Awi_keysend_47
Awi_keysend_52:
		move.w     #$0080,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		and.w      8(a0,d1.l),d0
		bne.w      Awi_keysend_48
		lea.l      30(a7),a1
		move.w     300(a7),d0
		movea.l    22(a7),a0
		jsr        Aob_gettext
		move.w     d0,292(a7)
		ble.s      Awi_keysend_48
		clr.w      294(a7)
		bra.s      Awi_keysend_49
Awi_keysend_51:
		addq.w     #1,294(a7)
Awi_keysend_49:
		move.w     294(a7),d1
		move.b     30(a7,d1.w),d0
		ext.w      d0
		jsr        isalnum
		tst.w      d0
		bne.s      Awi_keysend_50
		move.w     294(a7),d0
		cmp.w      292(a7),d0
		blt.s      Awi_keysend_51
Awi_keysend_50:
		move.w     294(a7),d0
		cmp.w      292(a7),d0
		bge.s      Awi_keysend_48
		move.b     303(a7),d0
		jsr        Ach_toupper
		move.b     d0,-(a7)
		move.w     296(a7),d1
		move.b     32(a7,d1.w),d0
		jsr        Ach_toupper
		cmp.b      (a7)+,d0
		bne.s      Awi_keysend_48
		move.w     300(a7),d1
		moveq.l    #-1,d0
		movea.l    306(a7),a0
		bsr        Awi_newsel
		bra.s      Awi_keysend_46
Awi_keysend_48:
		move.w     300(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    22(a7),a0
		move.w     0(a0,d0.l),300(a7)
Awi_keysend_47:
		move.w     300(a7),d0
		bgt        Awi_keysend_52
Awi_keysend_46:
		move.w     290(a7),d0
		bra        Awi_keysend_2
Awi_keysend_4:
		pea.l      300(a7)
		pea.l      22(a7)
		lea.l      30(a7),a1
		movea.l    314(a7),a0
		bsr        Awi_find_edit
		addq.w     #8,a7
		move.w     300(a7),296(a7)
		move.l     22(a7),d0
		bne.s      Awi_keysend_53
		movea.l    306(a7),a0
		move.l     20(a0),22(a7)
		move.l     22(a7),d0
		bne.s      Awi_keysend_54
		movea.l    306(a7),a0
		move.l     24(a0),22(a7)
		move.l     22(a7),d0
		bne.s      Awi_keysend_55
		moveq.l    #-1,d0
		add.w      290(a7),d0
		bra        Awi_keysend_2
		bra.s      Awi_keysend_56
Awi_keysend_55:
		clr.l      18(a7)
Awi_keysend_56:
		bra.s      Awi_keysend_53
Awi_keysend_54:
		movea.l    306(a7),a0
		move.l     24(a0),18(a7)
Awi_keysend_53:
		cmpi.b     #$0D,303(a7)
		beq.s      Awi_keysend_57
		cmpi.b     #$0A,303(a7)
		bne        Awi_keysend_58
Awi_keysend_57:
		moveq.l    #2,d1
		moveq.l    #-1,d0
		movea.l    22(a7),a0
		jsr        Aob_findflag
		move.w     d0,298(a7)
		move.w     298(a7),d0
		bmi.s      Awi_keysend_59
		move.w     #$0080,d0
		move.w     298(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      Awi_keysend_60
Awi_keysend_59:
		move.l     18(a7),d0
		beq.s      Awi_keysend_61
		moveq.l    #2,d1
		moveq.l    #-1,d0
		movea.l    18(a7),a0
		jsr        Aob_findflag
		move.w     d0,298(a7)
		move.w     298(a7),d0
		bmi.s      Awi_keysend_62
		move.w     #$0080,d0
		move.w     298(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      Awi_keysend_63
Awi_keysend_62:
		moveq.l    #-1,d0
		add.w      290(a7),d0
		bra        Awi_keysend_2
		bra.s      Awi_keysend_64
Awi_keysend_63:
		move.w     298(a7),d0
		movea.l    18(a7),a1
		movea.l    306(a7),a0
		jsr        Aob_execute
Awi_keysend_64:
		bra.s      Awi_keysend_65
Awi_keysend_61:
		moveq.l    #-1,d0
		add.w      290(a7),d0
		bra        Awi_keysend_2
Awi_keysend_65:
		bra.s      Awi_keysend_66
Awi_keysend_60:
		move.w     298(a7),d0
		movea.l    22(a7),a1
		movea.l    306(a7),a0
		jsr        Aob_execute
Awi_keysend_66:
		move.w     298(a7),d0
		bra        Awi_keysend_2
Awi_keysend_58:
		cmpi.b     #$09,303(a7)
		bne.s      Awi_keysend_67
		move.w     302(a7),d0
		and.w      #$0400,d0
		beq.s      Awi_keysend_68
		movea.l    22(a7),a1
		movea.l    306(a7),a0
		bsr        Aob_chdef
		tst.w      d0
		beq.s      Awi_keysend_69
		move.l     18(a7),d0
		beq.s      Awi_keysend_70
		movea.l    18(a7),a1
		movea.l    306(a7),a0
		bsr        Aob_chdef
		tst.w      d0
		bne.s      Awi_keysend_70
Awi_keysend_69:
		subq.w     #1,290(a7)
Awi_keysend_70:
		move.w     290(a7),d0
		bra        Awi_keysend_2
		bra.s      Awi_keysend_67
Awi_keysend_68:
		move.w     302(a7),d0
		and.w      #$0300,d0
		beq.s      Awi_keysend_71
		move.w     #$8001,302(a7)
		bra.s      Awi_keysend_67
Awi_keysend_71:
		move.w     #$8002,302(a7)
Awi_keysend_67:
		pea.l      300(a7)
		pea.l      22(a7)
		lea.l      30(a7),a1
		movea.l    314(a7),a0
		bsr        Awi_find_edit
		addq.w     #8,a7
		tst.w      d0
		bne.s      Awi_keysend_72
		move.w     302(a7),d1
		move.w     304(a7),d0
		movea.l    306(a7),a0
		bsr        Awi_keyACSwitch
		move.w     d0,300(a7)
		move.w     300(a7),d0
		bpl.s      Awi_keysend_73
		moveq.l    #-1,d0
		add.w      290(a7),d0
		bra        Awi_keysend_2
		bra.s      Awi_keysend_72
Awi_keysend_73:
		move.w     300(a7),d0
		bra        Awi_keysend_2
Awi_keysend_72:
		move.w     300(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    22(a7),a0
		move.l     12(a0,d0.l),14(a7)
		movea.l    open_dialog,a0
		cmpa.l     306(a7),a0
		beq.s      Awi_keysend_74
		bsr        Awi_diaend
Awi_keysend_74:
		move.l     306(a7),4(a7)
		move.w     300(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    22(a7),a0
		adda.l     d0,a0
		move.l     a0,8(a7)
		move.w     300(a7),12(a7)
		lea.l      4(a7),a1
		moveq.l    #9,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		move.w     302(a7),d0
		bpl        Awi_keysend_75
		move.b     303(a7),d0
		ext.w      d0
		cmp.w      #$001F,d0
		beq        Awi_keysend_76
		bgt.s      Awi_keysend_77
		cmp.w      #$001B,d0
		bhi        Awi_keysend_78
		add.w      d0,d0
		move.w     J44(pc,d0.w),d0
		jmp        J44(pc,d0.w)
J44:
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_79-J44
		dc.w Awi_keysend_80-J44
		dc.w Awi_keysend_81-J44
		dc.w Awi_keysend_82-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_83-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_84-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_78-J44
		dc.w Awi_keysend_85-J44
Awi_keysend_77:
		cmp.w      #$0063,d0
		beq        Awi_keysend_88
		bgt.s      Awi_keysend_87
		sub.w      #$0043,d0
		beq        Awi_keysend_88
		sub.w      #$0013,d0
		beq        Awi_keysend_89
		subq.w     #2,d0
		beq        Awi_keysend_88
		bra        Awi_keysend_78
Awi_keysend_87:
		sub.w      #$0076,d0
		beq        Awi_keysend_89
		subq.w     #2,d0
		beq        Awi_keysend_88
		bra        Awi_keysend_78
Awi_keysend_81:
		move.w     302(a7),d0
		and.w      #$0300,d0
		beq.s      Awi_keysend_90
		suba.l     a1,a1
		moveq.l    #15,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		bra.s      Awi_keysend_91
Awi_keysend_90:
		move.w     302(a7),d0
		and.w      #$0400,d0
		beq.s      Awi_keysend_92
		suba.l     a1,a1
		move.w     #$02BE,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		bra.s      Awi_keysend_91
Awi_keysend_92:
		suba.l     a1,a1
		move.w     #$02BC,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Awi_keysend_91:
		bra        Awi_keysend_93
Awi_keysend_82:
		move.w     302(a7),d0
		and.w      #$0300,d0
		beq.s      Awi_keysend_94
		suba.l     a1,a1
		moveq.l    #14,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		bra.s      Awi_keysend_95
Awi_keysend_94:
		move.w     302(a7),d0
		and.w      #$0400,d0
		beq.s      Awi_keysend_96
		suba.l     a1,a1
		move.w     #$02BF,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		bra.s      Awi_keysend_95
Awi_keysend_96:
		suba.l     a1,a1
		move.w     #$02BD,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Awi_keysend_95:
		bra        Awi_keysend_93
Awi_keysend_83:
		move.w     302(a7),d0
		and.w      #$0300,d0
		beq.s      Awi_keysend_97
		suba.l     a1,a1
		move.w     #$02C6,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		bra.s      Awi_keysend_98
Awi_keysend_97:
		move.w     302(a7),d0
		and.w      #$0400,d0
		beq.s      Awi_keysend_99
		suba.l     a1,a1
		move.w     #$02C5,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		bra.s      Awi_keysend_98
Awi_keysend_99:
		suba.l     a1,a1
		move.w     #$02C4,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Awi_keysend_98:
		bra        Awi_keysend_93
Awi_keysend_76:
		move.w     302(a7),d0
		and.w      #$0300,d0
		beq.s      Awi_keysend_100
		suba.l     a1,a1
		move.w     #$02C9,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		bra.s      Awi_keysend_101
Awi_keysend_100:
		move.w     302(a7),d0
		and.w      #$0400,d0
		beq.s      Awi_keysend_102
		suba.l     a1,a1
		move.w     #$02C8,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		bra.s      Awi_keysend_101
Awi_keysend_102:
		suba.l     a1,a1
		move.w     #$02C7,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Awi_keysend_101:
		bra        Awi_keysend_93
Awi_keysend_85:
		suba.l     a1,a1
		move.w     #$02CA,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		bra        Awi_keysend_93
Awi_keysend_79:
		move.w     #$FFFF,298(a7)
		move.w     302(a7),d0
		and.w      #$0300,d0
		beq.s      Awi_keysend_103
		movea.l    306(a7),a0
		bsr        Awi_firstedit
		move.w     d0,298(a7)
		bra.s      Awi_keysend_104
Awi_keysend_103:
		bra.s      Awi_keysend_105
Awi_keysend_107:
		move.w     296(a7),298(a7)
Awi_keysend_105:
		moveq.l    #8,d1
		move.w     298(a7),d0
		movea.l    22(a7),a0
		jsr        Aob_findflag
		move.w     d0,296(a7)
		ble.s      Awi_keysend_106
		move.w     296(a7),d0
		cmp.w      300(a7),d0
		blt.s      Awi_keysend_107
Awi_keysend_106:
		move.w     298(a7),d0
		bpl.s      Awi_keysend_108
		movea.l    306(a7),a0
		bsr        Awi_lastedit
		move.w     d0,298(a7)
Awi_keysend_108:
		movea.l    306(a7),a0
		movea.l    24(a0),a0
		cmpa.l     22(a7),a0
		bne.s      Awi_keysend_104
		ori.w      #$1000,298(a7)
Awi_keysend_104:
		move.w     298(a7),d1
		move.w     300(a7),d0
		movea.l    306(a7),a0
		bsr        Awi_focuschg
		tst.w      d0
		bne.s      Awi_keysend_109
		subq.w     #1,290(a7)
Awi_keysend_109:
		bra        Awi_keysend_93
Awi_keysend_80:
		move.w     #$FFFF,298(a7)
		move.w     302(a7),d0
		and.w      #$0300,d0
		beq.s      Awi_keysend_110
		movea.l    306(a7),a0
		bsr        Awi_lastedit
		move.w     d0,298(a7)
		bra.s      Awi_keysend_111
Awi_keysend_110:
		moveq.l    #8,d1
		move.w     300(a7),d0
		movea.l    22(a7),a0
		jsr        Aob_findflag
		move.w     d0,298(a7)
		move.w     298(a7),d0
		bpl.s      Awi_keysend_112
		movea.l    306(a7),a0
		bsr        Awi_firstedit
		move.w     d0,298(a7)
		bra.s      Awi_keysend_111
Awi_keysend_112:
		movea.l    306(a7),a0
		movea.l    24(a0),a0
		cmpa.l     22(a7),a0
		bne.s      Awi_keysend_111
		ori.w      #$1000,298(a7)
Awi_keysend_111:
		move.w     298(a7),d1
		move.w     300(a7),d0
		movea.l    306(a7),a0
		bsr        Awi_focuschg
		tst.w      d0
		bne.s      Awi_keysend_113
		subq.w     #1,290(a7)
Awi_keysend_113:
		bra        Awi_keysend_93
Awi_keysend_84:
		suba.l     a1,a1
		move.w     #$02CC,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		bra        Awi_keysend_93
Awi_keysend_88:
		move.w     302(a7),d0
		and.w      #$0400,d0
		beq        Awi_keysend_114
		lea.l      26(a7),a1
		moveq.l    #3,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		tst.w      d0
		beq        Awi_keysend_114
		lea.l      286(a7),a1
		move.w     #$02C3,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		tst.w      d0
		beq        Awi_keysend_114
		move.w     302(a7),d0
		and.w      #$0300,d0
		bne.s      Awi_keysend_115
		suba.l     a0,a0
		jsr        Ascrp_clear
Awi_keysend_115:
		move.w     302(a7),d0
		and.w      #$0300,d0
		beq.s      Awi_keysend_116
		moveq.l    #1,d1
		bra.s      Awi_keysend_117
Awi_keysend_116:
		clr.w      d1
Awi_keysend_117:
		move.w     d1,-(a7)
		movea.l    28(a7),a0
		jsr        strlen
		movea.l    28(a7),a1
		lea.l      xe0ce0,a0
		move.w     (a7)+,d1
		jsr        Ascrp_put
		cmpi.b     #$78,303(a7)
		beq.s      Awi_keysend_118
		cmpi.b     #$58,303(a7)
		bne.s      Awi_keysend_119
Awi_keysend_118:
		move.w     288(a7),d0
		cmp.w      286(a7),d0
		ble.s      Awi_keysend_120
		suba.l     a1,a1
		move.w     #$02C7,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		bra.s      Awi_keysend_119
Awi_keysend_120:
		lea.l      xe0ce4,a1
		moveq.l    #4,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Awi_keysend_119:
		bra.s      Awi_keysend_121
Awi_keysend_114:
		move.b     303(a7),d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a1
		adda.l     d1,a1
		movea.l    14(a7),a0
		bsr        Awi_char
Awi_keysend_121:
		bra        Awi_keysend_93
Awi_keysend_89:
		move.w     302(a7),d0
		and.w      #$0400,d0
		beq.s      Awi_keysend_122
		pea.l      (a7)
		lea.l      30(a7),a1
		lea.l      xe0ce5,a0
		jsr        Ascrp_get
		addq.w     #4,a7
		tst.w      d0
		beq.s      Awi_keysend_122
		move.l     (a7),d0
		ble.s      Awi_keysend_123
		movea.l    26(a7),a1
		move.w     #$02C1,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Awi_keysend_123:
		movea.l    26(a7),a0
		jsr        Ax_free
		bra.s      Awi_keysend_124
Awi_keysend_122:
		move.b     303(a7),d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a1
		adda.l     d1,a1
		movea.l    14(a7),a0
		bsr        Awi_char
Awi_keysend_124:
		bra.s      Awi_keysend_93
Awi_keysend_78:
		move.b     303(a7),d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a1
		adda.l     d1,a1
		movea.l    14(a7),a0
		bsr        Awi_char
Awi_keysend_93:
		bra.s      Awi_keysend_125
Awi_keysend_75:
		move.b     303(a7),d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a1
		adda.l     d1,a1
		movea.l    14(a7),a0
		bsr        Awi_char
Awi_keysend_125:
		suba.l     a1,a1
		moveq.l    #5,d0
		move.w     300(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		adda.l     d1,a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		move.w     290(a7),d0
Awi_keysend_2:
		lea.l      310(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_scroll
Awi_scroll:
		move.l     a2,-(a7)
		lea.l      -46(a7),a7
		move.l     a0,42(a7)
		move.w     d0,40(a7)
		move.w     d1,38(a7)
		movea.l    42(a7),a0
		move.w     32(a0),32(a7)
		move.w     32(a7),d0
		bpl.s      Awi_scroll_1
		bra        Awi_scroll_2
Awi_scroll_1:
		move.w     40(a7),d0
		movea.l    42(a7),a0
		movea.l    20(a0),a0
		sub.w      16(a0),d0
		move.w     d0,36(a7)
		move.w     38(a7),d0
		movea.l    42(a7),a0
		movea.l    20(a0),a0
		sub.w      18(a0),d0
		move.w     d0,34(a7)
		move.w     #$0080,d0
		movea.l    42(a7),a0
		and.w      84(a0),d0
		bne.s      Awi_scroll_3
		movea.l    42(a7),a0
		move.w     36(a7),d0
		cmp.w      56(a0),d0
		bge.s      Awi_scroll_3
		movea.l    42(a7),a0
		move.w     56(a0),d0
		neg.w      d0
		move.w     36(a7),d1
		cmp.w      d0,d1
		ble.s      Awi_scroll_3
		movea.l    42(a7),a0
		move.w     34(a7),d0
		cmp.w      58(a0),d0
		bge.s      Awi_scroll_3
		movea.l    42(a7),a0
		move.w     58(a0),d0
		neg.w      d0
		move.w     34(a7),d1
		cmp.w      d0,d1
		bgt.s      Awi_scroll_4
Awi_scroll_3:
		movea.l    42(a7),a1
		lea.l      52(a1),a1
		movea.l    42(a7),a0
		movea.l    42(a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
		bra        Awi_scroll_2
Awi_scroll_4:
		pea.l      14(a7)
		pea.l      16(a7)
		pea.l      18(a7)
		pea.l      20(a7)
		moveq.l    #11,d1
		move.w     48(a7),d0
		jsr        wind_get
		lea.l      16(a7),a7
		move.w     12(a7),d0
		beq.s      Awi_scroll_5
		move.w     14(a7),d0
		bne.s      Awi_scroll_6
Awi_scroll_5:
		bra        Awi_scroll_2
Awi_scroll_6:
		pea.l      6(a7)
		pea.l      8(a7)
		pea.l      10(a7)
		pea.l      12(a7)
		moveq.l    #12,d1
		move.w     48(a7),d0
		jsr        wind_get
		lea.l      16(a7),a7
		move.w     4(a7),d0
		bne.s      Awi_scroll_7
		move.w     6(a7),d0
		beq.s      Awi_scroll_8
Awi_scroll_7:
		movea.l    42(a7),a1
		lea.l      52(a1),a1
		movea.l    42(a7),a0
		movea.l    42(a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
		bra        Awi_scroll_2
Awi_scroll_8:
		movea.l    ACSblk,a1
		addq.w     #8,a1
		lea.l      8(a7),a0
		jsr        intersect
		movea.l    42(a7),a1
		lea.l      52(a1),a1
		lea.l      8(a7),a0
		jsr        intersect
		move.w     12(a7),d0
		beq.s      Awi_scroll_9
		move.w     14(a7),d0
		bne.s      Awi_scroll_10
Awi_scroll_9:
		bra        Awi_scroll_2
Awi_scroll_10:
		move.w     8(a7),d0
		move.w     d0,24(a7)
		move.w     d0,16(a7)
		move.w     10(a7),d0
		move.w     d0,26(a7)
		move.w     d0,18(a7)
		move.w     8(a7),d0
		add.w      12(a7),d0
		subq.w     #1,d0
		move.w     d0,28(a7)
		move.w     d0,20(a7)
		move.w     10(a7),d0
		add.w      14(a7),d0
		subq.w     #1,d0
		move.w     d0,30(a7)
		move.w     d0,22(a7)
		move.w     36(a7),d0
		beq.s      Awi_scroll_11
		move.w     36(a7),d0
		ble.s      Awi_scroll_12
		move.w     36(a7),d0
		add.w      d0,16(a7)
		move.w     36(a7),d0
		sub.w      d0,28(a7)
		moveq.l    #1,d0
		add.w      28(a7),d0
		move.w     d0,8(a7)
		move.w     36(a7),12(a7)
		bra.s      Awi_scroll_11
Awi_scroll_12:
		move.w     36(a7),d0
		add.w      d0,20(a7)
		move.w     36(a7),d0
		sub.w      d0,24(a7)
		move.w     36(a7),d0
		neg.w      d0
		move.w     d0,12(a7)
Awi_scroll_11:
		move.w     34(a7),d0
		beq.s      Awi_scroll_13
		move.w     34(a7),d0
		ble.s      Awi_scroll_14
		move.w     34(a7),d0
		add.w      d0,18(a7)
		move.w     34(a7),d0
		sub.w      d0,30(a7)
		moveq.l    #1,d0
		add.w      30(a7),d0
		move.w     d0,10(a7)
		move.w     34(a7),14(a7)
		bra.s      Awi_scroll_13
Awi_scroll_14:
		move.w     34(a7),d0
		add.w      d0,22(a7)
		move.w     34(a7),d0
		sub.w      d0,26(a7)
		move.w     34(a7),d0
		neg.w      d0
		move.w     d0,14(a7)
Awi_scroll_13:
		move.w     16(a7),d0
		cmp.w      20(a7),d0
		bgt.s      Awi_scroll_15
		move.w     18(a7),d0
		cmp.w      22(a7),d0
		bgt.s      Awi_scroll_15
		lea.l      16(a7),a0
		clr.w      d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0100,d0
		jsr        mt_graf_mouse
		movea.l    ACSblk,a0
		pea.l      618(a0)
		movea.l    ACSblk,a1
		lea.l      618(a1),a1
		lea.l      20(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vro_cpyfm
		addq.w     #4,a7
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0101,d0
		jsr        mt_graf_mouse
Awi_scroll_15:
		lea.l      8(a7),a1
		movea.l    42(a7),a0
		movea.l    42(a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
Awi_scroll_2:
		lea.l      46(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aob_flags
Aob_flags:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.w     d0,8(a7)
		move.w     d1,6(a7)
		move.w     d2,4(a7)
		clr.l      (a7)
		move.w     8(a7),d0
		and.w      #$1000,d0
		beq.s      Aob_flags_1
		movea.l    10(a7),a0
		move.l     24(a0),d0
		beq.s      Aob_flags_2
		move.w     8(a7),d1
		and.w      #$0FFF,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		movea.l    24(a0),a0
		adda.l     d0,a0
		move.l     a0,(a7)
Aob_flags_2:
		bra.s      Aob_flags_3
Aob_flags_1:
		movea.l    10(a7),a0
		move.l     20(a0),d0
		beq.s      Aob_flags_3
		move.w     8(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		movea.l    20(a0),a0
		adda.l     d0,a0
		move.l     a0,(a7)
Aob_flags_3:
		move.l     (a7),d0
		beq.s      Aob_flags_4
		move.w     4(a7),d0
		beq.s      Aob_flags_5
		move.w     6(a7),d0
		movea.l    (a7),a0
		or.w       d0,8(a0)
		bra.s      Aob_flags_6
Aob_flags_5:
		move.w     6(a7),d0
		not.w      d0
		movea.l    (a7),a0
		and.w      d0,8(a0)
Aob_flags_6:
		movea.l    10(a7),a0
		move.w     32(a0),d0
		bmi.s      Aob_flags_7
		moveq.l    #32,d0
		movea.l    10(a7),a0
		and.w      86(a0),d0
		bne.s      Aob_flags_7
		moveq.l    #-1,d1
		move.w     8(a7),d0
		movea.l    10(a7),a0
		movea.l    10(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
Aob_flags_7:
		movea.l    (a7),a0
		move.w     8(a0),d0
		bra.s      Aob_flags_8
Aob_flags_4:
		clr.w      d0
Aob_flags_8:
		lea.l      14(a7),a7
		rts

	.globl Aob_state
Aob_state:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.w     d0,8(a7)
		move.w     d1,6(a7)
		move.w     d2,4(a7)
		clr.l      (a7)
		move.w     8(a7),d0
		and.w      #$1000,d0
		beq.s      Aob_state_1
		movea.l    10(a7),a0
		move.l     24(a0),d0
		beq.s      Aob_state_2
		move.w     8(a7),d1
		and.w      #$0FFF,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		movea.l    24(a0),a0
		adda.l     d0,a0
		move.l     a0,(a7)
Aob_state_2:
		bra.s      Aob_state_3
Aob_state_1:
		movea.l    10(a7),a0
		move.l     20(a0),d0
		beq.s      Aob_state_3
		move.w     8(a7),d1
		and.w      #$0FFF,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		movea.l    20(a0),a0
		adda.l     d0,a0
		move.l     a0,(a7)
Aob_state_3:
		move.l     (a7),d0
		beq.s      Aob_state_4
		move.w     4(a7),d0
		beq.s      Aob_state_5
		move.w     6(a7),d0
		movea.l    (a7),a0
		or.w       d0,10(a0)
		bra.s      Aob_state_6
Aob_state_5:
		move.w     6(a7),d0
		not.w      d0
		movea.l    (a7),a0
		and.w      d0,10(a0)
Aob_state_6:
		movea.l    10(a7),a0
		move.w     32(a0),d0
		bmi.s      Aob_state_7
		moveq.l    #32,d0
		movea.l    10(a7),a0
		and.w      86(a0),d0
		bne.s      Aob_state_7
		moveq.l    #-1,d1
		move.w     8(a7),d0
		movea.l    10(a7),a0
		movea.l    10(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
Aob_state_7:
		movea.l    (a7),a0
		move.w     10(a0),d0
		bra.s      Aob_state_8
Aob_state_4:
		clr.w      d0
Aob_state_8:
		lea.l      14(a7),a7
		rts

	.globl Aob_service
Aob_service:
		move.l     a2,-(a7)
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.w     d0,14(a7)
		move.w     d1,12(a7)
		move.l     a1,8(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0200,d0
		bne.s      Aob_service_1
		move.l     16(a7),d0
		beq.w      Aob_service_2
Aob_service_1:
		move.w     14(a7),d1
		and.w      #$0FFF,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		adda.l     d0,a0
		move.l     a0,4(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0200,d0
		bne.s      Aob_service_3
		movea.l    4(a7),a0
		cmpi.b     #$18,7(a0)
		bne.s      Aob_service_2
Aob_service_3:
		movea.l    4(a7),a0
		move.l     12(a0),(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0200,d0
		bne.s      Aob_service_4
		movea.l    (a7),a0
		move.l     8(a0),d0
		beq.s      Aob_service_2
Aob_service_4:
		movea.l    8(a7),a1
		move.w     12(a7),d0
		movea.l    4(a7),a0
		movea.l    (a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		bra.s      Aob_service_5
Aob_service_2:
		clr.w      d0
Aob_service_5:
		lea.l      20(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_observice
Awi_observice:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.w     d0,6(a7)
		move.w     d1,4(a7)
		move.l     a1,(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0200,d0
		bne.s      Awi_observice_1
		move.l     8(a7),d0
		beq.s      Awi_observice_2
Awi_observice_1:
		move.w     6(a7),d0
		and.w      #$1000,d0
		beq.s      Awi_observice_3
		movea.l    (a7),a1
		move.w     4(a7),d1
		move.w     6(a7),d0
		movea.l    8(a7),a0
		movea.l    24(a0),a0
		bsr        Aob_service
		bra.s      Awi_observice_4
		bra.s      Awi_observice_2
Awi_observice_3:
		movea.l    (a7),a1
		move.w     4(a7),d1
		move.w     6(a7),d0
		movea.l    8(a7),a0
		movea.l    20(a0),a0
		bsr        Aob_service
		bra.s      Awi_observice_4
Awi_observice_2:
		clr.w      d0
Awi_observice_4:
		lea.l      12(a7),a7
		rts

	.globl Aob_visible
Aob_visible:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.w     #$0001,(a7)
		move.w     4(a7),2(a7)
		bra.s      Aob_visible_1
Aob_visible_4:
		move.w     #$0080,d0
		move.w     2(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    6(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      Aob_visible_2
		clr.w      (a7)
Aob_visible_2:
		move.w     2(a7),d0
		movea.l    6(a7),a0
		jsr        Aob_up
		move.w     d0,2(a7)
Aob_visible_1:
		move.w     2(a7),d0
		bmi.s      Aob_visible_3
		move.w     (a7),d0
		bne.s      Aob_visible_4
Aob_visible_3:
		move.w     (a7),d0
		lea.l      10(a7),a7
		rts

	.globl Awi_obvisible
Awi_obvisible:
		subq.w     #6,a7
		move.l     a0,2(a7)
		move.w     d0,(a7)
		move.l     2(a7),d0
		beq.s      Awi_obvisible_1
		move.w     (a7),d0
		bmi.s      Awi_obvisible_1
		movea.l    2(a7),a0
		move.w     32(a0),d0
		bmi.s      Awi_obvisible_1
		movea.l    2(a7),a0
		move.w     86(a0),d0
		and.w      #$3800,d0
		beq.s      Awi_obvisible_2
Awi_obvisible_1:
		clr.w      d0
		bra.s      Awi_obvisible_3
Awi_obvisible_2:
		move.w     (a7),d0
		and.w      #$1000,d0
		beq.s      Awi_obvisible_4
		movea.l    2(a7),a0
		move.l     24(a0),d0
		beq.s      Awi_obvisible_4
		move.w     (a7),d0
		and.w      #$0FFF,d0
		movea.l    2(a7),a0
		movea.l    24(a0),a0
		bsr        Aob_visible
		bra.s      Awi_obvisible_3
		bra.s      Awi_obvisible_3
Awi_obvisible_4:
		move.w     (a7),d0
		movea.l    2(a7),a0
		movea.l    20(a0),a0
		bsr        Aob_visible
		nop
Awi_obvisible_3:
		addq.w     #6,a7
		rts

	.data

open_dialog:
		dc.w $0000
		dc.w $0000
last_edit:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe0cc0:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
xe0cc8:
		dc.w $2000
		dc.b 'Window-Lib',0
xe0cd5:
		dc.b 'Window-Lib',0
xe0ce0:
		dc.b 'txt',0
xe0ce4:
		dc.b 0
xe0ce5:
		dc.b 'txt',0
		.even
