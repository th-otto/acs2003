		.text

edte_framecol:
		move.l     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		moveq.l    #47,d0
		move.w     d0,-(a7)
		moveq.l    #48,d2
		moveq.l    #45,d1
		move.w     18(a2),d0
		moveq.l    #12,d3
		asr.w      d3,d0
		and.w      #0x000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      edte_framecol_1
		move.w     18(a2),d1
		and.w      #0x0FFF,d1
		moveq.l    #12,d2
		lsl.w      d2,d0
		or.w       d0,d1
		move.w     d1,18(a2)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		moveq.l    #1,d0
		moveq.l    #-1,d1
		jsr        (a1)
edte_framecol_1:
		movea.l    (a7)+,a2
		move.l     (a7)+,d3
		rts

edte_intercol:
		move.w     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		moveq.l    #73,d0
		move.w     d0,-(a7)
		moveq.l    #74,d2
		moveq.l    #71,d1
		moveq.l    #15,d0
		and.w      18(a2),d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      edte_intercol_1
		move.w     18(a2),d1
		and.w      #0xFFF0,d1
		or.w       d3,d1
		move.w     d1,18(a2)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		moveq.l    #1,d0
		moveq.l    #-1,d1
		jsr        (a1)
edte_intercol_1:
		movea.l    (a7)+,a2
		move.w     (a7)+,d3
		rts

edte_pattern:
		movem.l    a2-a3/a5,-(a7)
		subq.w     #8,a7
		lea.l      POP_PATSEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edte_pattern_1
		lea.l      ACSblk,a3
		moveq.l    #67,d0
		movea.l    (a3),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a1
		lea.l      (a7),a0
		jsr        Aob_offset
		moveq.l    #1,d0
		movea.l    (a3),a0
		movea.l    600(a0),a1
		add.w      52(a1),d0
		add.w      d0,(a7)
		moveq.l    #1,d1
		add.w      54(a1),d1
		add.w      d1,2(a7)
		movea.l    604(a0),a1
		movea.l    60(a1),a5
		move.w     18(a5),d0
		asr.w      #4,d0
		and.w      #0x0003,d0
		ext.l      d0
		move.l     d0,d2
		add.l      d2,d2
		add.l      d0,d2
		lsl.l      #3,d2
		ori.w      #0x0004,34(a2,d2.l)
		move.w     2(a7),d1
		move.w     (a7),d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        Ame_popup
		tst.w      d0
		ble.s      edte_pattern_2
		subq.w     #1,d0
		move.w     18(a5),d1
		and.w      #0xFF8F,d1
		move.w     d0,d2
		lsl.w      #4,d2
		or.w       d2,d1
		move.w     d1,18(a5)
		movea.l    (a3),a0
		movea.l    604(a0),a1
		move.w     d0,d1
		andi.w     #0xFF8F,1622(a1)
		and.w      #0x0007,d1
		lsl.w      #4,d1
		or.w       d1,1622(a1)
		moveq.l    #-1,d1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a5
		movea.l    102(a5),a1
		moveq.l    #67,d0
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a5
		movea.l    102(a5),a1
		jsr        (a1)
edte_pattern_2:
		movea.l    a2,a0
		jsr        Aob_delete
edte_pattern_1:
		addq.w     #8,a7
		movem.l    (a7)+,a2-a3/a5
		rts

edte_pos:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		subq.w     #8,a7
		lea.l      POP_HORPOSSEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edte_pos_1
		lea.l      ACSblk,a3
		moveq.l    #21,d0
		movea.l    (a3),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a1
		lea.l      (a7),a0
		jsr        Aob_offset
		moveq.l    #1,d0
		movea.l    (a3),a0
		movea.l    600(a0),a1
		add.w      52(a1),d0
		add.w      d0,(a7)
		moveq.l    #1,d1
		add.w      54(a1),d1
		add.w      d1,2(a7)
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		move.w     16(a0),d2
		tst.w      d2
		beq.s      edte_pos_2
		subq.w     #1,d2
		beq.s      edte_pos_3
		subq.w     #1,d2
		beq.s      edte_pos_4
		bra.s      edte_pos_5
edte_pos_2:
		ori.w      #0x0004,34(a2)
		bra.s      edte_pos_5
edte_pos_3:
		ori.w      #0x0004,82(a2)
		bra.s      edte_pos_5
edte_pos_4:
		ori.w      #0x0004,58(a2)
edte_pos_5:
		move.w     2(a7),d1
		move.w     (a7),d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        Ame_popup
		move.w     d0,d1
		subq.w     #1,d1
		beq.s      edte_pos_6
		subq.w     #1,d1
		beq.s      edte_pos_7
		subq.w     #1,d1
		beq.s      edte_pos_8
		bra        edte_pos_9
edte_pos_6:
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		clr.w      16(a0)
		lea.l      HPOS_TEXT1,a1
		moveq.l    #23,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edte_pos_10
edte_pos_7:
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		move.w     #0x0002,16(a0)
		lea.l      HPOS_TEXT2,a1
		moveq.l    #23,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edte_pos_10
edte_pos_8:
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		move.w     #0x0001,16(a0)
		lea.l      HPOS_TEXT3,a1
		moveq.l    #23,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
edte_pos_10:
		moveq.l    #-1,d1
		moveq.l    #23,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
edte_pos_9:
		movea.l    a2,a0
		jsr        Aob_delete
edte_pos_1:
		addq.w     #8,a7
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

edte_replace:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		ori.w      #0x0080,18(a0)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		rts

edte_size:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		subq.w     #8,a7
		lea.l      POP_SIZESEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edte_size_1
		lea.l      ACSblk,a3
		moveq.l    #26,d0
		movea.l    (a3),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a1
		lea.l      (a7),a0
		jsr        Aob_offset
		moveq.l    #1,d0
		movea.l    (a3),a0
		movea.l    600(a0),a1
		add.w      52(a1),d0
		add.w      d0,(a7)
		moveq.l    #1,d1
		add.w      54(a1),d1
		add.w      d1,2(a7)
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		move.w     12(a0),d2
		subq.w     #3,d2
		beq.s      edte_size_2
		subq.w     #2,d2
		beq.s      edte_size_3
		bra.s      edte_size_4
edte_size_2:
		ori.w      #0x0004,34(a2)
		bra.s      edte_size_4
edte_size_3:
		ori.w      #0x0004,58(a2)
edte_size_4:
		move.w     2(a7),d1
		move.w     (a7),d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        Ame_popup
		move.w     d0,d1
		subq.w     #1,d1
		beq.s      edte_size_5
		subq.w     #1,d1
		beq.s      edte_size_6
		bra.s      edte_size_7
edte_size_5:
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		move.w     #0x0003,12(a0)
		lea.l      SIZE_TEXT0,a1
		moveq.l    #28,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edte_size_8
edte_size_6:
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		move.w     #0x0005,12(a0)
		lea.l      SIZE_TEXT1,a1
		moveq.l    #28,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
edte_size_8:
		moveq.l    #-1,d1
		moveq.l    #28,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
edte_size_7:
		movea.l    a2,a0
		jsr        Aob_delete
edte_size_1:
		addq.w     #8,a7
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

edte_textcol:
		move.w     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		moveq.l    #17,d0
		move.w     d0,-(a7)
		moveq.l    #18,d2
		moveq.l    #15,d1
		move.w     18(a2),d0
		asr.w      #8,d0
		and.w      #0x000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      edte_textcol_1
		move.w     18(a2),d1
		and.w      #0xF0FF,d1
		lsl.w      #8,d0
		or.w       d0,d1
		move.w     d1,18(a2)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		moveq.l    #1,d0
		moveq.l    #-1,d1
		jsr        (a1)
edte_textcol_1:
		movea.l    (a7)+,a2
		move.w     (a7)+,d3
		rts

edte_trans:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		andi.w     #0xFF7F,18(a0)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		rts

edte_type:
		movem.l    d3-d4/a2-a4,-(a7)
		subq.w     #8,a7
		lea.l      POP_TYPESEL,a2
		movea.l    a2,a0
		jsr        Aob_create
		movea.l    a0,a3
		move.l     a3,d0
		beq        edte_type_1
		lea.l      ACSblk,a4
		moveq.l    #5,d0
		movea.l    (a4),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a1
		lea.l      (a7),a0
		jsr        Aob_offset
		moveq.l    #1,d0
		movea.l    (a4),a0
		movea.l    600(a0),a1
		add.w      52(a1),d0
		add.w      d0,(a7)
		moveq.l    #1,d1
		add.w      54(a1),d1
		add.w      d1,2(a7)
		movea.l    604(a0),a1
		move.w     54(a1),d3
		move.w     d3,d2
		sub.w      #0x0015,d2
		beq.s      edte_type_2
		subq.w     #1,d2
		beq.s      edte_type_3
		subq.w     #7,d2
		beq.s      edte_type_4
		subq.w     #1,d2
		beq.s      edte_type_5
		bra.s      edte_type_6
edte_type_2:
		ori.w      #0x0004,34(a3)
		bra.s      edte_type_6
edte_type_3:
		ori.w      #0x0004,58(a3)
		bra.s      edte_type_6
edte_type_4:
		ori.w      #0x0004,82(a3)
		bra.s      edte_type_6
edte_type_5:
		ori.w      #0x0004,106(a3)
edte_type_6:
		move.w     2(a7),d1
		move.w     (a7),d0
		movea.l    a3,a1
		movea.l    (a4),a0
		movea.l    600(a0),a0
		jsr        Ame_popup
		move.w     d0,d4
		subq.w     #1,d0
		beq.s      edte_type_7
		subq.w     #1,d0
		beq.s      edte_type_8
		subq.w     #1,d0
		beq.s      edte_type_9
		subq.w     #1,d0
		beq        edte_type_10
		bra        edte_type_11
edte_type_7:
		movea.l    (a4),a0
		movea.l    604(a0),a1
		move.w     #0x0015,54(a1)
		lea.l      -610(a2),a1
		moveq.l    #7,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
edte_type_13:
		cmp.w      #0x001D,d3
		beq.s      edte_type_12
		cmp.w      #0x001E,d3
		bne.w      edte_type_11
edte_type_12:
		jsr        edte_xtext
		bra.s      edte_type_11
edte_type_8:
		movea.l    (a4),a0
		movea.l    604(a0),a1
		move.w     #0x0016,54(a1)
		lea.l      -603(a2),a1
		moveq.l    #7,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edte_type_13
edte_type_9:
		movea.l    (a4),a0
		movea.l    604(a0),a1
		move.w     #0x001D,54(a1)
		lea.l      -593(a2),a1
		moveq.l    #7,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
edte_type_15:
		cmp.w      #0x0015,d3
		beq.s      edte_type_14
		cmp.w      #0x0016,d3
		bne.s      edte_type_11
edte_type_14:
		jsr        edte_xftext
		bra.s      edte_type_11
edte_type_10:
		movea.l    (a4),a0
		movea.l    604(a0),a1
		move.w     #0x001E,54(a1)
		lea.l      -584(a2),a1
		moveq.l    #7,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edte_type_15
edte_type_11:
		tst.w      d4
		ble.s      edte_type_16
		moveq.l    #-1,d1
		moveq.l    #5,d0
		movea.l    (a4),a0
		movea.l    600(a0),a0
		movea.l    (a4),a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a4),a0
		movea.l    600(a0),a0
		movea.l    (a4),a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		jsr        (a1)
edte_type_16:
		movea.l    a3,a0
		jsr        Aob_delete
edte_type_1:
		addq.w     #8,a7
		movem.l    (a7)+,d3-d4/a2-a4
		rts

edte_ok:
		movem.l    d3/a2-a5,-(a7)
		lea.l      -28(a7),a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    20(a0),a2
		movea.l    (a0),a5
		movea.l    (a5),a3
		ori.w      #0x0001,6(a3)
		movea.l    4(a5),a0
		movea.l    4(a0),a4
		move.w     10(a5),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		adda.l     d0,a4
		movea.l    20(a4),a1
		movea.l    a3,a0
		jsr        del_tedinfo
		move.w     54(a2),14(a4)
		moveq.l    #28,d0
		movea.l    60(a2),a1
		lea.l      (a7),a0
		jsr        memcpy
		lea.l      (a7),a1
		moveq.l    #3,d0
		lea.l      888(a2),a0
		jsr        Auo_boxed
		movea.l    (a7),a0
		jsr        strlen
		move.l     d0,d3
		addq.w     #1,d3
		move.w     d3,24(a7)
		cmpi.b     #0x15,15(a4)
		beq.s      edte_ok_1
		cmpi.b     #0x16,15(a4)
		bne.s      edte_ok_2
edte_ok_1:
		lea.l      xcb9f4,a0
		move.l     a0,8(a7)
		move.l     a0,4(a7)
		clr.w      26(a7)
		andi.w     #0xFFF7,16(a4)
		bra.s      edte_ok_3
edte_ok_2:
		lea.l      4(a7),a1
		moveq.l    #3,d0
		lea.l      912(a2),a0
		jsr        Auo_boxed
		lea.l      8(a7),a1
		moveq.l    #3,d0
		lea.l      936(a2),a0
		jsr        Auo_boxed
		movea.l    4(a7),a0
		jsr        strlen
		move.l     d0,d3
		addq.w     #1,d3
		move.w     d3,26(a7)
edte_ok_3:
		lea.l      (a7),a1
		movea.l    a3,a0
		jsr        dup_tedinfo
		move.l     a0,20(a4)
		subq.w     #1,d3
		move.w     d3,d0
		movea.l    ACSblk,a1
		muls.w     18(a1),d0
		move.w     d0,d3
		move.w     28(a4),d0
		jsr        pixel_x
		cmp.w      d0,d3
		ble.s      edte_ok_4
		move.w     d3,d0
		jsr        char_x
		move.w     d0,28(a4)
edte_ok_4:
		jsr        ed_abort
		lea.l      28(a7),a7
		movem.l    (a7)+,d3/a2-a5
		rts

	.globl set_ted
set_ted:
		movem.l    d3/a2-a5,-(a7)
		movea.l    a0,a3
		lea.l      sm,a5
		lea.l      -1800(a5),a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      set_ted_1
		suba.l     a0,a0
		bra        set_ted_2
set_ted_1:
		moveq.l    #37,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #38,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #39,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		move.w     14(a3),54(a2)
		move.b     55(a2),d0
		ext.w      d0
		sub.w      #0x0015,d0
		beq.s      set_ted_3
		subq.w     #1,d0
		beq.s      set_ted_3
		subq.w     #7,d0
		beq.s      set_ted_4
		subq.w     #1,d0
		beq.s      set_ted_4
		bra.s      set_ted_5
set_ted_3:
		ori.w      #0x0080,920(a2)
		andi.w     #0xFFF7,920(a2)
		ori.w      #0x0080,944(a2)
		andi.w     #0xFFF7,944(a2)
		bra.s      set_ted_5
set_ted_4:
		andi.w     #0xFF7F,920(a2)
		ori.w      #0x0008,920(a2)
		andi.w     #0xFF7F,944(a2)
		ori.w      #0x0008,944(a2)
set_ted_5:
		move.w     18(a3),58(a2)
		movea.l    20(a3),a0
		movea.l    4(a0),a4
		movea.l    60(a2),a0
		move.w     12(a4),12(a0)
		move.w     16(a4),16(a0)
		move.w     18(a4),18(a0)
		move.w     22(a4),22(a0)
		movea.l    (a4),a0
		movea.l    4(a0),a1
		moveq.l    #37,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		movea.l    4(a4),a0
		movea.l    4(a0),a1
		moveq.l    #38,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		movea.l    8(a4),a0
		movea.l    4(a0),a1
		moveq.l    #39,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		move.w     18(a4),d3
		moveq.l    #12,d0
		asr.w      d0,d3
		and.w      #0x000F,d3
		move.w     d3,d1
		ext.l      d1
		lsl.l      #2,d1
		lea.l      colour_text,a0
		movea.l    0(a0,d1.l),a1
		movea.l    a2,a0
		moveq.l    #48,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #0xFFF0,1142(a2)
		and.w      #0x000F,d0
		or.w       d0,1142(a2)
		moveq.l    #15,d3
		and.w      18(a4),d3
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      colour_text,a0
		movea.l    0(a0,d0.l),a1
		movea.l    a2,a0
		moveq.l    #74,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #0xFFF0,1766(a2)
		and.w      #0x000F,d0
		or.w       d0,1766(a2)
		move.w     18(a4),d3
		asr.w      #4,d3
		and.w      #0x0007,d3
		move.w     d3,d0
		andi.w     #0xFF8F,1622(a2)
		and.w      #0x0007,d0
		lsl.w      #4,d0
		or.w       d0,1622(a2)
		move.w     16(a4),d0
		tst.w      d0
		beq.s      set_ted_6
		subq.w     #1,d0
		beq.s      set_ted_7
		subq.w     #1,d0
		beq.s      set_ted_8
		bra.s      set_ted_9
set_ted_6:
		lea.l      HPOS_TEXT1,a1
		moveq.l    #23,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      set_ted_9
set_ted_8:
		lea.l      HPOS_TEXT2,a1
		moveq.l    #23,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      set_ted_9
set_ted_7:
		lea.l      HPOS_TEXT3,a1
		moveq.l    #23,d0
		movea.l    a2,a0
		jsr        Aob_puttext
set_ted_9:
		move.w     12(a4),d0
		subq.w     #3,d0
		beq.s      set_ted_10
		subq.w     #2,d0
		beq.s      set_ted_11
		bra.s      set_ted_12
set_ted_10:
		lea.l      SIZE_TEXT0,a1
		moveq.l    #28,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      set_ted_12
set_ted_11:
		lea.l      SIZE_TEXT1,a1
		moveq.l    #28,d0
		movea.l    a2,a0
		jsr        Aob_puttext
set_ted_12:
		move.w     18(a4),d3
		asr.w      #8,d3
		and.w      #0x000F,d3
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      colour_text,a0
		movea.l    0(a0,d0.l),a1
		movea.l    a2,a0
		moveq.l    #18,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #0xFFF0,422(a2)
		and.w      #0x000F,d0
		or.w       d0,422(a2)
		move.w     14(a3),d0
		sub.w      #0x0015,d0
		beq.s      set_ted_13
		subq.w     #1,d0
		beq.s      set_ted_14
		subq.w     #7,d0
		beq.s      set_ted_15
		subq.w     #1,d0
		beq.s      set_ted_16
		bra.s      set_ted_17
set_ted_13:
		lea.l      -2530(a5),a1
		moveq.l    #7,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      set_ted_17
set_ted_14:
		lea.l      -2523(a5),a1
		moveq.l    #7,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      set_ted_17
set_ted_15:
		lea.l      -2513(a5),a1
		moveq.l    #7,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      set_ted_17
set_ted_16:
		lea.l      -2504(a5),a1
		moveq.l    #7,d0
		movea.l    a2,a0
		jsr        Aob_puttext
set_ted_17:
		move.l     a2,(a5)
		movea.l    a5,a0
set_ted_2:
		movem.l    (a7)+,d3/a2-a5
		rts

edte_th:
		move.l     a2,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		move.w     608(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    604(a0),a1
		move.w     12(a1,d0.l),d2
		lsl.w      #8,d2
		asr.w      #8,d2
		movea.l    60(a1),a0
		move.w     d2,22(a0)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a2),a0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		movea.l    (a7)+,a2
		rts

edte_xtext:
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a2
		jsr        Awi_diaend
		movea.l    20(a2),a0
		move.w     #0x0025,28(a2)
		move.w     #0xFFFF,30(a2)
		ori.w      #0x0080,920(a0)
		andi.w     #0xFFF7,920(a0)
		ori.w      #0x0080,944(a0)
		andi.w     #0xFFF7,944(a0)
		moveq.l    #38,d0
		movea.l    a2,a0
		jsr        Awi_obredraw
		moveq.l    #39,d0
		movea.l    a2,a0
		jsr        Awi_obredraw
		jsr        Awi_diastart
		movea.l    (a7)+,a2
		rts

edte_xftext:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a2
		jsr        Awi_diaend
		movea.l    20(a2),a3
		andi.w     #0xFF7F,920(a3)
		ori.w      #0x0008,920(a3)
		andi.w     #0xFF7F,944(a3)
		ori.w      #0x0008,944(a3)
		move.w     922(a3),d1
		moveq.l    #38,d0
		movea.l    a2,a0
		movea.l    102(a2),a1
		jsr        (a1)
		move.w     946(a3),d1
		moveq.l    #39,d0
		movea.l    a2,a0
		movea.l    102(a2),a1
		jsr        (a1)
		jsr        Awi_diastart
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.data

TEXT_003:
		dc.b 'OK',0
TEXT_004:
		dc.b 'Abbruch',0
TEXT_01:
		dc.b 'Position:',0
TEXT_02:
		dc.b '1234',0
TEXT_03:
		dc.b 'EDIT:____',0
TEXT_04:
		dc.b '9999',0
TEXT_05:
		dc.b 'Typ:',0
TEXT_06:
		dc.b 'Modus:',0
TEXT_07:
		dc.b 'Muster:',0
TEXT_08:
		dc.b 'Text:',0
TEXT_09:
		dc.b 'Rand:',0
TEXT_11:
		dc.b 'Tmp:',0
TEXT_12:
		dc.b 'Val:',0
TEXT_13:
		dc.b 'Rahmen:',0
TEXT_14:
		dc.b 'Gr”že:',0
TEXT_15:
		dc.b 'Farbe:',0
TEXT_17:
		dc.b 'Innenfl„che:',0
TYPE0:
		dc.b '  Text',0
TYPE1:
		dc.b '  BoxText',0
TYPE2:
		dc.b '  F-Text',0
TYPE3:
		dc.b '  F-BoxText',0
help_title:
		dc.b 'Der TEDINFO-Editor',0
title:
		dc.b ' TEDINFOS -',0
		dc.b $00
TEDINFO_01:
		dc.l TEXT_02
		dc.l TEXT_03
		dc.l TEXT_04
		dc.w $0003
		dc.w $0006
		dc.w $0002
		dc.w $1180
		dc.w $0000
		dc.w $ffff
		dc.w $0005
		dc.w $000a
A_3DBUTTON01:
		dc.l A_3Dbutton
		dc.w $2011
		dc.w $9178
		dc.l Auo_string
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
A_3DBUTTON02:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_003
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON03:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_004
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON04:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TYPE2
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON05:
		dc.l A_3Dbutton
		dc.w $21f1
		dc.w $0178
		dc.l Auo_string
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
A_3DBUTTON07:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TYPE1
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON09:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
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
A_3DBUTTON10:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TYPE0
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON11:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TYPE3
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON23:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
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
A_ARROWS02:
		dc.l A_arrows
		dc.w $1301
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
A_BOXED01:
		dc.l A_boxed
		dc.w $9038
		dc.w $5012
		dc.l Auo_boxed
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
A_BOXED02:
		dc.l A_boxed
		dc.w $9000
		dc.w $5012
		dc.l Auo_boxed
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
A_INNERFRAME01:
		dc.l A_innerframe
		dc.w $1000
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_08
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME02:
		dc.l A_innerframe
		dc.w $1000
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_17
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME04:
		dc.l A_innerframe
		dc.w $1000
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_13
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
POP_TYPESEL:
		dc.w $ffff
		dc.w $0001
		dc.w $0004
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $00ff
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $000d
		dc.w $0004
_01_POP_TYPESEL:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON10
		dc.w $0000
		dc.w $0000
		dc.w $000d
		dc.w $0001
_02_POP_TYPESEL:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON07
		dc.w $0000
		dc.w $0001
		dc.w $000d
		dc.w $0001
_03_POP_TYPESEL:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON04
		dc.w $0000
		dc.w $0002
		dc.w $000d
		dc.w $0001
_04_POP_TYPESEL:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0061
		dc.w $0000
		dc.l A_3DBUTTON11
		dc.w $0000
		dc.w $0003
		dc.w $000d
		dc.w $0001
ED_TEDI:
		dc.w $ffff
		dc.w $0001
		dc.w $0040
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON05
		dc.w $0000
		dc.w $0000
		dc.w $0043
		dc.w $0012
_01_ED_TEDI:
		dc.w $0003
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0000
		dc.w $0010
		dc.l A_3DBUTTON09
		dc.w $0000
		dc.w $0000
		dc.w $000e
		dc.w $0004
_02_ED_TEDI:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $001e
		dc.w $0040
		dc.w $0000
		dc.l TEDINFO_01
		dc.w $0001
		dc.w $0001
		dc.w $000c
		dc.w $0002
_03_ED_TEDI:
		dc.w $0005
		dc.w $0004
		dc.w $0004
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_05
		dc.w $0010
		dc.w $0001
		dc.w $0005
		dc.w $0001
_04_ED_TEDI:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_05_ED_TEDI:
		dc.w $0008
		dc.w $0007
		dc.w $0007
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0015
		dc.w $0001
		dc.w $000d
		dc.w $0001
_05aED_TEDI:
		dc.l edte_type
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8854
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_07_ED_TEDI:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON23
		dc.w $0000
		dc.w $0000
		dc.w $000d
		dc.w $0001
_08_ED_TEDI:
		dc.w $000a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON02
		dc.w $0027
		dc.w $0001
		dc.w $000c
		dc.w $0002
_08aED_TEDI:
		dc.l edte_ok
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $884f
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_10_ED_TEDI:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON03
		dc.w $0035
		dc.w $0001
		dc.w $000c
		dc.w $0002
_10aED_TEDI:
		dc.l ed_abort
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8841
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_12_ED_TEDI:
		dc.w $002a
		dc.w $000d
		dc.w $0029
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME01
		dc.w $0001
		dc.w $0004
		dc.w $0041
		dc.w $0009
_13_ED_TEDI:
		dc.w $000f
		dc.w $000e
		dc.w $000e
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_15
		dc.w $0001
		dc.w $0001
		dc.w $0006
		dc.w $0001
_14_ED_TEDI:
		dc.w $000d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_15_ED_TEDI:
		dc.w $0013
		dc.w $0011
		dc.w $0012
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0008
		dc.w $0001
		dc.w $0012
		dc.w $0001
_15aED_TEDI:
		dc.l edte_textcol
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8846
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_17_ED_TEDI:
		dc.w $0012
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1171
		dc.w $0010
		dc.w $0000
		dc.w $0002
		dc.w $0001
_18_ED_TEDI:
		dc.w $000f
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON23
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_19_ED_TEDI:
		dc.w $0015
		dc.w $0014
		dc.w $0014
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_01
		dc.w $0020
		dc.w $0001
		dc.w $0009
		dc.w $0001
_20_ED_TEDI:
		dc.w $0013
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_21_ED_TEDI:
		dc.w $0018
		dc.w $0017
		dc.w $0017
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $002a
		dc.w $0001
		dc.w $000a
		dc.w $0001
_21aED_TEDI:
		dc.l edte_pos
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8850
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_23_ED_TEDI:
		dc.w $0015
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON23
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0001
_24_ED_TEDI:
		dc.w $001a
		dc.w $0019
		dc.w $0019
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_14
		dc.w $0001
		dc.w $0003
		dc.w $0006
		dc.w $0001
_25_ED_TEDI:
		dc.w $0018
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_26_ED_TEDI:
		dc.w $001d
		dc.w $001c
		dc.w $001c
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0008
		dc.w $0003
		dc.w $0008
		dc.w $0001
_26aED_TEDI:
		dc.l edte_size
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8847
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_28_ED_TEDI:
		dc.w $001a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON09
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0001
_29_ED_TEDI:
		dc.w $001e
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_06
		dc.w $0023
		dc.w $0003
		dc.w $0006
		dc.w $0001
_30_ED_TEDI:
		dc.w $0020
		dc.w $ffff
		dc.w $ffff
		dc.w $001b
		dc.w $0005
		dc.w $0000
		dc.w $43ff
		dc.w $1121
		dc.w $002a
		dc.w $0003
		dc.w $0003
		dc.w $0001
_30aED_TEDI:
		dc.l edte_trans
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_32_ED_TEDI:
		dc.w $0022
		dc.w $ffff
		dc.w $ffff
		dc.w $001b
		dc.w $0005
		dc.w $0000
		dc.w $43ff
		dc.w $11a1
		dc.w $002e
		dc.w $0003
		dc.w $0003
		dc.w $0001
_32aED_TEDI:
		dc.l edte_replace
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_34_ED_TEDI:
		dc.w $0023
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_08
		dc.w $0001
		dc.w $0005
		dc.w $0005
		dc.w $0001
_35_ED_TEDI:
		dc.w $0028
		dc.w $0024
		dc.w $0024
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON01
		dc.w $0007
		dc.w $0005
		dc.w $0039
		dc.w $0003
_36_ED_TEDI:
		dc.w $0023
		dc.w $0025
		dc.w $0027
		dc.w $0014
		dc.w $0040
		dc.w $0000
		dc.w $00ff
		dc.w $0101
		dc.w $0000
		dc.w $0000
		dc.w $0039
		dc.w $0003
_37_ED_TEDI:
		dc.w $0026
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED02
		dc.w $0000
		dc.w $0000
		dc.w $0039
		dc.w $0001
_38_ED_TEDI:
		dc.w $0027
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED02
		dc.w $0000
		dc.w $0001
		dc.w $0039
		dc.w $0001
_39_ED_TEDI:
		dc.w $0024
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED01
		dc.w $0000
		dc.w $0002
		dc.w $0039
		dc.w $0001
_40_ED_TEDI:
		dc.w $0029
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_11
		dc.w $0002
		dc.w $0006
		dc.w $0004
		dc.w $0001
_41_ED_TEDI:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_12
		dc.w $0002
		dc.w $0007
		dc.w $0004
		dc.w $0001
_42_ED_TEDI:
		dc.w $0040
		dc.w $002b
		dc.w $003e
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME04
		dc.w $0001
		dc.w $000d
		dc.w $0020
		dc.w $0005
_43_ED_TEDI:
		dc.w $002d
		dc.w $002c
		dc.w $002c
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_15
		dc.w $0001
		dc.w $0001
		dc.w $0006
		dc.w $0001
_44_ED_TEDI:
		dc.w $002b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0002
		dc.w $0000
		dc.w $0001
		dc.w $0001
_45_ED_TEDI:
		dc.w $0031
		dc.w $002f
		dc.w $0030
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0008
		dc.w $0001
		dc.w $0012
		dc.w $0001
_45aED_TEDI:
		dc.l edte_framecol
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8852
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_47_ED_TEDI:
		dc.w $0030
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $4301
		dc.w $1371
		dc.w $0010
		dc.w $0000
		dc.w $0002
		dc.w $0001
_48_ED_TEDI:
		dc.w $002d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON23
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_49_ED_TEDI:
		dc.w $0032
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_09
		dc.w $0002
		dc.w $0003
		dc.w $0006
		dc.w $0001
_50_ED_TEDI:
		dc.w $0034
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $0003
		dc.w $1111
		dc.w $0008
		dc.w $0003
		dc.w $0002
		dc.w $0001
_50aED_TEDI:
		dc.l edte_th
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_52_ED_TEDI:
		dc.w $0036
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $0002
		dc.w $1111
		dc.w $000b
		dc.w $0003
		dc.w $0002
		dc.w $0001
_52aED_TEDI:
		dc.l edte_th
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_54_ED_TEDI:
		dc.w $0038
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $0001
		dc.w $1111
		dc.w $000e
		dc.w $0003
		dc.w $0002
		dc.w $0001
_54aED_TEDI:
		dc.l edte_th
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_56_ED_TEDI:
		dc.w $003a
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $0000
		dc.w $1111
		dc.w $0011
		dc.w $0003
		dc.w $0002
		dc.w $0001
_56aED_TEDI:
		dc.l edte_th
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_58_ED_TEDI:
		dc.w $003c
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $00ff
		dc.w $1111
		dc.w $0014
		dc.w $0003
		dc.w $0002
		dc.w $0001
_58aED_TEDI:
		dc.l edte_th
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_60_ED_TEDI:
		dc.w $003e
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $00fe
		dc.w $1111
		dc.w $0017
		dc.w $0003
		dc.w $0002
		dc.w $0001
_60aED_TEDI:
		dc.l edte_th
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_62_ED_TEDI:
		dc.w $002a
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $00fd
		dc.w $1111
		dc.w $001a
		dc.w $0003
		dc.w $0002
		dc.w $0001
_62aED_TEDI:
		dc.l edte_th
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_64_ED_TEDI:
		dc.w $0000
		dc.w $0041
		dc.w $0047
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_INNERFRAME02
		dc.w $0022
		dc.w $000d
		dc.w $0020
		dc.w $0005
_65_ED_TEDI:
		dc.w $0043
		dc.w $0042
		dc.w $0042
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_07
		dc.w $0001
		dc.w $0001
		dc.w $0008
		dc.w $0001
_66_ED_TEDI:
		dc.w $0041
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_67_ED_TEDI:
		dc.w $0045
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0001
		dc.w $0012
		dc.w $0001
_67aED_TEDI:
		dc.l edte_pattern
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $884d
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_69_ED_TEDI:
		dc.w $0047
		dc.w $0046
		dc.w $0046
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_15
		dc.w $0002
		dc.w $0003
		dc.w $0006
		dc.w $0001
_70_ED_TEDI:
		dc.w $0045
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0003
		dc.w $0000
		dc.w $0001
		dc.w $0001
_71_ED_TEDI:
		dc.w $0040
		dc.w $0049
		dc.w $004a
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0003
		dc.w $0012
		dc.w $0001
_71aED_TEDI:
		dc.l edte_intercol
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8842
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_73_ED_TEDI:
		dc.w $004a
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1171
		dc.w $0010
		dc.w $0000
		dc.w $0002
		dc.w $0001
_74_ED_TEDI:
		dc.w $0047
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0020
		dc.w $0000
		dc.l A_3DBUTTON23
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
sm:
		dc.w $0000
		dc.w $0000
		dc.l edte_ok
		dc.l Aob_delete
		dc.l title
		dc.l help_title
		dc.w $0000
		dc.w $0000
xcb9f4:
		dc.w $0000

