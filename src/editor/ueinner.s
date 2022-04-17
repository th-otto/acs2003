		.text

edin_dither:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a3
		addq.w     #4,a3
		andi.l     #0xEFFFFFFF,(a3)
		moveq.l    #1,d0
		movea.l    (a2),a0
		move.w     608(a0),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    604(a0),a1
		and.w      10(a1,d1.l),d0
		beq.s      edin_dither_1
		ori.l      #0x10000000,(a3)
edin_dither_1:
		moveq.l    #-1,d1
		movea.l    (a2),a0
		move.w     608(a0),d0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a3
		movea.l    102(a3),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a2),a0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a3
		movea.l    102(a3),a1
		jsr        (a1)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

edin_incol:
		move.l     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		addq.w     #4,a2
		moveq.l    #38,d0
		move.w     d0,-(a7)
		moveq.l    #39,d2
		moveq.l    #36,d1
		move.l     (a2),d0
		moveq.l    #16,d3
		asr.l      d3,d0
		and.w      #0x000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      edin_incol_1
		move.l     (a2),d1
		and.l      #0xFFF0FFFF,d1
		ext.l      d0
		moveq.l    #16,d2
		lsl.l      d2,d0
		or.l       d0,d1
		move.l     d1,(a2)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		moveq.l    #1,d0
		moveq.l    #-1,d1
		jsr        (a1)
edin_incol_1:
		movea.l    (a7)+,a2
		move.l     (a7)+,d3
		rts

edin_intercol:
		move.l     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		addq.w     #4,a2
		moveq.l    #51,d0
		move.w     d0,-(a7)
		moveq.l    #52,d2
		moveq.l    #49,d1
		move.l     (a2),d0
		moveq.l    #12,d3
		asr.l      d3,d0
		and.w      #0x000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      edin_intercol_1
		move.l     (a2),d1
		and.l      #0xFFFF0FFF,d1
		ext.l      d0
		moveq.l    #12,d2
		lsl.l      d2,d0
		or.l       d0,d1
		move.l     d1,(a2)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		moveq.l    #1,d0
		moveq.l    #-1,d1
		jsr        (a1)
edin_intercol_1:
		movea.l    (a7)+,a2
		move.l     (a7)+,d3
		rts

edin_outcol:
		move.w     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		addq.w     #4,a2
		moveq.l    #30,d0
		move.w     d0,-(a7)
		moveq.l    #31,d2
		moveq.l    #28,d1
		moveq.l    #15,d0
		and.w      2(a2),d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      edin_outcol_1
		moveq.l    #-16,d1
		and.l      (a2),d1
		ext.l      d0
		or.l       d0,d1
		move.l     d1,(a2)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		moveq.l    #1,d0
		moveq.l    #-1,d1
		jsr        (a1)
edin_outcol_1:
		movea.l    (a7)+,a2
		move.w     (a7)+,d3
		rts

edin_pattern:
		movem.l    d3/a2-a3,-(a7)
		subq.w     #8,a7
		lea.l      POP_PATSEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edin_pattern_1
		lea.l      ACSblk,a3
		moveq.l    #43,d0
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
		move.l     4(a0),d0
		moveq.l    #9,d1
		asr.l      d1,d0
		and.w      #0x0007,d0
		ext.l      d0
		move.l     d0,d2
		add.l      d2,d2
		add.l      d0,d2
		lsl.l      #3,d2
		ori.w      #0x0004,34(a2,d2.l)
		move.w     (a7),d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		move.w     2(a7),d1
		jsr        Ame_popup
		tst.w      d0
		ble.s      edin_pattern_2
		subq.w     #1,d0
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		addq.w     #4,a0
		move.l     (a0),d1
		and.l      #0xFFFFF1FF,d1
		move.w     d0,d2
		ext.l      d2
		moveq.l    #9,d3
		lsl.l      d3,d2
		or.l       d2,d1
		move.l     d1,(a0)
		movea.l    (a3),a0
		movea.l    604(a0),a1
		move.w     d0,d1
		andi.w     #0xFF8F,1046(a1)
		and.w      #0x0007,d1
		lsl.w      #4,d1
		or.w       d1,1046(a1)
		moveq.l    #-1,d1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		moveq.l    #43,d0
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
edin_pattern_2:
		movea.l    a2,a0
		jsr        Aob_delete
edin_pattern_1:
		addq.w     #8,a7
		movem.l    (a7)+,d3/a2-a3
		rts

edin_pos:
		movem.l    a2-a5,-(a7)
		subq.w     #8,a7
		lea.l      POP_POSSEL,a2
		movea.l    a2,a0
		jsr        Aob_create
		movea.l    a0,a3
		move.l     a3,d0
		beq        edin_pos_1
		lea.l      ACSblk,a4
		moveq.l    #17,d0
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
		movea.l    a1,a0
		movea.l    a3,a1
		move.w     (a7),d0
		move.w     2(a7),d1
		jsr        Ame_popup
		tst.w      d0
		ble        edin_pos_2
		subq.w     #2,d0
		movea.l    (a4),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a5
		addq.w     #4,a5
		andi.l     #0xF8FFFFFF,(a5)
		move.w     d0,d1
		cmp.w      #0x0005,d1
		bhi        edin_pos_3
		add.w      d1,d1
		move.w     J13(pc,d1.w),d1
		jmp        J13(pc,d1.w)
J13:
		dc.w edin_pos_4-J13
		dc.w edin_pos_5-J13
		dc.w edin_pos_6-J13
		dc.w edin_pos_7-J13
		dc.w edin_pos_8-J13
		dc.w edin_pos_9-J13
edin_pos_4:
		lea.l      -733(a2),a1
		moveq.l    #19,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra        edin_pos_3
edin_pos_5:
		ori.l      #0x01000000,(a5)
		lea.l      -729(a2),a1
		moveq.l    #19,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edin_pos_3
edin_pos_6:
		ori.l      #0x02000000,(a5)
		lea.l      -725(a2),a1
		moveq.l    #19,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edin_pos_3
edin_pos_7:
		ori.l      #0x04000000,(a5)
		lea.l      -721(a2),a1
		moveq.l    #19,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edin_pos_3
edin_pos_8:
		ori.l      #0x05000000,(a5)
		lea.l      -717(a2),a1
		moveq.l    #19,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edin_pos_3
edin_pos_9:
		ori.l      #0x06000000,(a5)
		lea.l      -713(a2),a1
		moveq.l    #19,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
edin_pos_3:
		moveq.l    #-1,d1
		moveq.l    #19,d0
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
edin_pos_2:
		movea.l    a3,a0
		jsr        Aob_delete
edin_pos_1:
		addq.w     #8,a7
		movem.l    (a7)+,a2-a5
		rts

edin_size:
		movem.l    a2-a4,-(a7)
		subq.w     #8,a7
		lea.l      POP_SIZESEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edin_size_1
		lea.l      ACSblk,a3
		moveq.l    #22,d0
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
		move.l     4(a0),d0
		moveq.l    #27,d1
		asr.l      d1,d0
		and.w      #0x0001,d0
		ext.l      d0
		move.l     d0,d2
		add.l      d2,d2
		add.l      d0,d2
		lsl.l      #3,d2
		ori.w      #0x0004,34(a2,d2.l)
		move.w     (a7),d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		move.w     2(a7),d1
		jsr        Ame_popup
		tst.w      d0
		ble.s      edin_size_2
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a4
		addq.w     #4,a4
		cmp.w      #0x0001,d0
		bne.s      edin_size_3
		andi.l     #0xF7FFFFFF,(a4)
		lea.l      SIZE_TEXT0,a1
		moveq.l    #24,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edin_size_4
edin_size_3:
		ori.l      #0x08000000,(a4)
		lea.l      SIZE_TEXT1,a1
		moveq.l    #24,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
edin_size_4:
		moveq.l    #-1,d1
		moveq.l    #24,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a4
		movea.l    102(a4),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a4
		movea.l    102(a4),a1
		jsr        (a1)
edin_size_2:
		movea.l    a2,a0
		jsr        Aob_delete
edin_size_1:
		addq.w     #8,a7
		movem.l    (a7)+,a2-a4
		rts

edin_textcol:
		move.w     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		addq.w     #4,a2
		moveq.l    #12,d0
		move.w     d0,-(a7)
		moveq.l    #13,d2
		moveq.l    #10,d1
		move.l     (a2),d0
		asr.l      #4,d0
		and.w      #0x000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      edin_textcol_1
		move.l     (a2),d1
		and.l      #0xFFFFFF0F,d1
		ext.l      d0
		lsl.l      #4,d0
		or.l       d0,d1
		move.l     d1,(a2)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		moveq.l    #1,d0
		moveq.l    #-1,d1
		jsr        (a1)
edin_textcol_1:
		movea.l    (a7)+,a2
		move.w     (a7)+,d3
		rts

	.globl init_inner
init_inner:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		lea.l      data,a1
		move.w     #0x2329,d0
		movea.l    4(a2),a3
		jsr        (a3)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

minsize:
		movem.l    d3/a2-a3,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		move.l     12(a2),d0
		beq.s      minsize_1
		movea.l    d0,a0
		jsr        strlen
		move.l     d0,d3
		addq.w     #2,d3
		movea.l    ACSblk,a0
		muls.w     18(a0),d3
		bra.s      minsize_2
minsize_1:
		movea.l    ACSblk,a0
		move.w     18(a0),d3
		add.w      d3,d3
minsize_2:
		move.w     d3,(a3)
		movea.l    ACSblk,a0
		movea.l    16(a7),a1
		move.w     20(a0),(a1)
		movem.l    (a7)+,d3/a2-a3
		rts

object_tree:
		movem.l    d3/a2-a6,-(a7)
		subq.w     #4,a7
		movea.l    a0,a2
		movea.l    a1,a4
		lea.l      ED_INNER,a0
		jsr        Aob_create
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      object_tree_1
		suba.l     a0,a0
		bra        object_tree_2
object_tree_1:
		lea.l      48(a3),a5
		moveq.l    #22,d0
		and.w      8(a4),d0
		or.w       d0,8(a5)
		moveq.l    #63,d0
		and.w      10(a4),d0
		or.w       d0,10(a5)
		moveq.l    #14,d0
		movea.l    a3,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #56,d0
		movea.l    a3,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #57,d0
		movea.l    a3,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		movea.l    12(a5),a4
		pea.l      (a7)
		lea.l      xc2067,a1
		movea.l    (a2),a0
		jsr        sscanf
		addq.w     #4,a7
		move.l     (a7),4(a4)
		cmpi.w     #0x0002,8(a2)
		bne.s      object_tree_3
		movea.l    10(a2),a1
		moveq.l    #14,d0
		movea.l    a3,a0
		jsr        Aob_puttext
		bra.s      object_tree_4
object_tree_3:
		lea.l      xc204f,a1
		moveq.l    #4,d0
		movea.l    a5,a0
		movea.l    8(a4),a6
		jsr        (a6)
		lea.l      xc204f,a1
		moveq.l    #14,d0
		movea.l    a3,a0
		jsr        Aob_puttext
object_tree_4:
		move.l     (a7),d0
		moveq.l    #28,d1
		asr.l      d1,d0
		and.l      #0x00000001,d0
		beq.s      object_tree_5
		ori.w      #0x0001,994(a3)
		bra.s      object_tree_6
object_tree_5:
		andi.w     #0xFFFE,994(a3)
object_tree_6:
		move.l     (a7),d3
		moveq.l    #16,d0
		asr.l      d0,d3
		and.w      #0x000F,d3
		lea.l      colour_text,a5
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a5,d0.l),a1
		movea.l    a3,a0
		moveq.l    #39,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #0xFFF0,926(a3)
		and.w      #0x000F,d0
		or.w       d0,926(a3)
		moveq.l    #15,d3
		and.w      2(a7),d3
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a5,d0.l),a1
		movea.l    a3,a0
		moveq.l    #31,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #0xFFF0,734(a3)
		and.w      #0x000F,d0
		or.w       d0,734(a3)
		move.l     (a7),d3
		moveq.l    #12,d0
		asr.l      d0,d3
		and.w      #0x000F,d3
		move.w     d3,d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    0(a5,d1.l),a1
		movea.l    a3,a0
		moveq.l    #52,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #0xFFF0,1238(a3)
		and.w      #0x000F,d0
		or.w       d0,1238(a3)
		move.l     (a7),d3
		moveq.l    #9,d0
		asr.l      d0,d3
		and.w      #0x0007,d3
		move.w     d3,d1
		andi.w     #0xFF8F,1046(a3)
		and.w      #0x0007,d1
		lsl.w      #4,d1
		or.w       d1,1046(a3)
		move.l     (a7),d3
		moveq.l    #24,d1
		asr.l      d1,d3
		and.w      #0x0007,d3
		move.w     d3,d2
		cmp.w      #0x0006,d2
		bhi        object_tree_7
		add.w      d2,d2
		move.w     J14(pc,d2.w),d2
		jmp        J14(pc,d2.w)
J14:
		dc.w object_tree_8-J14
		dc.w object_tree_9-J14
		dc.w object_tree_10-J14
		dc.w object_tree_7-J14
		dc.w object_tree_11-J14
		dc.w object_tree_12-J14
		dc.w object_tree_13-J14
object_tree_8:
		lea.l      POS_TEXT0,a1
		moveq.l    #19,d0
		movea.l    a3,a0
		jsr        Aob_puttext
		bra.s      object_tree_7
object_tree_9:
		lea.l      POS_TEXT1,a1
		moveq.l    #19,d0
		movea.l    a3,a0
		jsr        Aob_puttext
		bra.s      object_tree_7
object_tree_10:
		lea.l      POS_TEXT2,a1
		moveq.l    #19,d0
		movea.l    a3,a0
		jsr        Aob_puttext
		bra.s      object_tree_7
object_tree_11:
		lea.l      POS_TEXT3,a1
		moveq.l    #19,d0
		movea.l    a3,a0
		jsr        Aob_puttext
		bra.s      object_tree_7
object_tree_12:
		lea.l      POS_TEXT4,a1
		moveq.l    #19,d0
		movea.l    a3,a0
		jsr        Aob_puttext
		bra.s      object_tree_7
object_tree_13:
		lea.l      POS_TEXT5,a1
		moveq.l    #19,d0
		movea.l    a3,a0
		jsr        Aob_puttext
object_tree_7:
		move.l     (a7),d0
		and.l      #0x08000000,d0
		beq.s      object_tree_14
		lea.l      SIZE_TEXT1,a1
		movea.l    a3,a0
		moveq.l    #24,d0
		jsr        Aob_puttext
		bra.s      object_tree_15
object_tree_14:
		lea.l      SIZE_TEXT0,a1
		moveq.l    #24,d0
		movea.l    a3,a0
		jsr        Aob_puttext
object_tree_15:
		move.l     (a7),d3
		asr.l      #4,d3
		and.w      #0x000F,d3
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a5,d0.l),a1
		movea.l    a3,a0
		moveq.l    #13,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #0xFFF0,302(a3)
		and.w      #0x000F,d0
		or.w       d0,302(a3)
		movea.l    1356(a3),a0
		move.l     12(a0),24(a4)
		movea.l    38(a2),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_16
		lea.l      xc204f,a1
		moveq.l    #56,d0
		movea.l    a3,a0
		jsr        Aob_puttext
		bra.s      object_tree_17
object_tree_16:
		movea.l    38(a2),a1
		moveq.l    #56,d0
		movea.l    a3,a0
		jsr        Aob_puttext
object_tree_17:
		movea.l    1380(a3),a0
		move.l     12(a0),28(a4)
		movea.l    42(a2),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_18
		lea.l      xc204f,a1
		moveq.l    #57,d0
		movea.l    a3,a0
		jsr        Aob_puttext
		bra.s      object_tree_19
object_tree_18:
		movea.l    42(a2),a1
		moveq.l    #57,d0
		movea.l    a3,a0
		jsr        Aob_puttext
object_tree_19:
		movea.l    a3,a0
object_tree_2:
		addq.w     #4,a7
		movem.l    (a7)+,d3/a2-a6
		rts

test_it:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     #A_innerframe,(a1)
		pea.l      4(a2)
		lea.l      xc2067,a1
		movea.l    (a0),a0
		jsr        sscanf
		addq.w     #4,a7
		move.l     #Auo_string,8(a2)
		cmpi.w     #0x0002,8(a3)
		bne.s      test_it_1
		move.l     10(a3),12(a2)
		bra.s      test_it_2
test_it_1:
		clr.l      12(a2)
test_it_2:
		moveq.l    #0,d0
		move.l     d0,20(a2)
		move.l     d0,16(a2)
		movea.l    38(a3),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      test_it_3
		suba.l     a0,a0
		bra.s      test_it_4
test_it_3:
		movea.l    38(a3),a0
test_it_4:
		move.l     a0,24(a2)
		movea.l    42(a3),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      test_it_5
		suba.l     a0,a0
		bra.s      test_it_6
test_it_5:
		movea.l    42(a3),a0
test_it_6:
		move.l     a0,28(a2)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

abort:
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    20(a1),a0
		movea.l    60(a0),a0
		clr.l      24(a0)
		clr.l      28(a0)
		movea.l    data+64,a0
		movea.l    (a0),a0
		jsr        (a0)
		rts

ok:
		movem.l    d3/a2-a5,-(a7)
		lea.l      -50(a7),a7
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a3
		movea.l    60(a3),a5
		lea.l      parm,a4
		move.l     4(a5),-(a7)
		lea.l      xc2067,a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #4,a7
		lea.l      4(a7),a5
		move.l     a4,(a5)
		move.l     #xc205c,4(a5)
		lea.l      (a7),a1
		moveq.l    #3,d0
		lea.l      336(a3),a0
		jsr        Auo_boxed
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      ok_1
		jsr        strlen
		move.l     d0,d3
		addq.w     #2,d3
		movea.l    (a2),a0
		muls.w     18(a0),d3
		move.w     #0x0002,8(a5)
		move.l     (a7),10(a5)
		bra.s      ok_2
ok_1:
		movea.l    (a2),a0
		move.w     18(a0),d3
		add.w      d3,d3
		clr.w      8(a5)
		clr.l      10(a5)
ok_2:
		clr.l      14(a5)
		clr.w      d0
		move.w     d0,28(a5)
		move.w     d0,18(a5)
		moveq.l    #0,d1
		move.l     d1,30(a5)
		move.l     d1,20(a5)
		moveq.l    #0,d0
		move.l     d0,34(a5)
		move.l     d0,24(a5)
		lea.l      38(a5),a1
		lea.l      1344(a3),a0
		moveq.l    #3,d0
		jsr        Auo_boxed
		movea.l    38(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_3
		clr.l      38(a5)
ok_3:
		lea.l      42(a5),a1
		moveq.l    #3,d0
		lea.l      1368(a3),a0
		jsr        Auo_boxed
		movea.l    42(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_4
		clr.l      42(a5)
ok_4:
		movea.l    (a2),a0
		move.w     20(a0),d1
		move.w     d3,d0
		movea.l    a5,a0
		movea.l    data+64,a1
		movea.l    4(a1),a1
		jsr        (a1)
		bsr        abort
		lea.l      50(a7),a7
		movem.l    (a7)+,d3/a2-a5
		rts

	.data

BUBBLE_01:
		dc.b 'Hier wird der Titel eingegeben',0
BUBBLE_03:
		dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_05:
		dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
POS_TEXT0:
		dc.b 'l/o',0
POS_TEXT1:
		dc.b 'm/o',0
POS_TEXT2:
		dc.b 'r/o',0
POS_TEXT3:
		dc.b 'l/u',0
POS_TEXT4:
		dc.b 'm/u',0
POS_TEXT5:
		dc.b 'r/u',0
TEXT_001:
		dc.b 'TITEL',0
TEXT_005:
		dc.b 'OK',0
TEXT_009:
		dc.b 'Abbruch',0
TEXT_05:
		dc.b 'Sonstiges',0
TEXT_06:
		dc.b 'BubbleGEM-Text',0
TEXT_07:
		dc.b 'Context-Popup',0
TEXT_09:
		dc.b 'unten:',0
TEXT_10:
		dc.b 'Farbe:',0
TEXT_12:
		dc.b 'Grîûe:',0
TEXT_13:
		dc.b 'Muster:',0
TEXT_14:
		dc.b 'Rahmen-Farbe:',0
TEXT_15:
		dc.b 'InnenflÑche:',0
TEXT_16:
		dc.b 'Text:',0
TEXT_18:
		dc.b 'Pos:',0
TEXT_19:
		dc.b 'oben:',0
TEXT_20:
		dc.b 'DitherModus',0
TEXT_21:
		dc.b 'links/',0
TEXT_22:
		dc.b 'rechts/',0
TEXT_23:
		dc.b ' XXX ',0
help_title:
		dc.b 'Der Innerframe-Editor',0
title:
		dc.b 'INNERFRAME -',0
A_3DBUTTON01:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_005
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
		dc.l TEXT_009
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
A_3DBUTTON06:
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
A_3DBUTTON27:
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
A_BOXED02:
		dc.l A_boxed
		dc.w $9000
		dc.w $ff12
		dc.l Auo_boxed
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_01
		dc.w $0000
		dc.w $0000
A_BOXED03:
		dc.l A_boxed
		dc.w $9038
		dc.w $ff12
		dc.l Auo_boxed
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_03
		dc.w $0000
		dc.w $0000
A_BOXED04:
		dc.l A_boxed
		dc.w $9038
		dc.w $ff12
		dc.l Auo_boxed
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_05
		dc.w $0000
		dc.w $0000
A_CHECKBOX01:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_20
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
		dc.w $1400
		dc.w $8f11
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
A_INNERFRAME02:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_16
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME03:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_05
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
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME05:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_15
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME06:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_14
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl POP_POSSEL
POP_POSSEL:
		dc.w $ffff
		dc.w $0001
		dc.w $0001
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $00ff
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $000f
		dc.w $0002
_01_POP_POSSEL:
		dc.w $0000
		dc.w $0002
		dc.w $0007
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_INNERFRAME01
		dc.w $0000
		dc.w $0000
		dc.w $000f
		dc.w $0002
_02_POP_POSSEL:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_23
		dc.w $0000
		dc.w $0000
		dc.w $0005
		dc.w $0001
_03_POP_POSSEL:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_23
		dc.w $0005
		dc.w $0000
		dc.w $0005
		dc.w $0001
_04_POP_POSSEL:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_23
		dc.w $000a
		dc.w $0000
		dc.w $0005
		dc.w $0001
_05_POP_POSSEL:
		dc.w $0006
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_23
		dc.w $0000
		dc.w $0001
		dc.w $0005
		dc.w $0001
_06_POP_POSSEL:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_23
		dc.w $0005
		dc.w $0001
		dc.w $0005
		dc.w $0001
_07_POP_POSSEL:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0021
		dc.w $0000
		dc.l TEXT_23
		dc.w $000a
		dc.w $0001
		dc.w $0005
		dc.w $0001
	.globl ED_INNER
ED_INNER:
		dc.w $ffff
		dc.w $0001
		dc.w $0035
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON06
		dc.w $0000
		dc.w $0000
		dc.w $003a
		dc.w $0014
_01_ED_INNER:
		dc.w $0003
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON05
		dc.w $0000
		dc.w $0000
		dc.w $0016
		dc.w $0004
_02_ED_INNER:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_INNERFRAME04
		dc.w $0002
		dc.w $0001
		dc.w $0012
		dc.w $0002
_03_ED_INNER:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON01
		dc.w $001f
		dc.w $0001
		dc.w $000c
		dc.w $0002
_03aED_INNER:
		dc.l ok
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
_05_ED_INNER:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON02
		dc.w $002d
		dc.w $0001
		dc.w $000c
		dc.w $0002
_05aED_INNER:
		dc.l abort
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
_07_ED_INNER:
		dc.w $0019
		dc.w $0008
		dc.w $0016
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME02
		dc.w $0001
		dc.w $0004
		dc.w $0038
		dc.w $0005
_08_ED_INNER:
		dc.w $000a
		dc.w $0009
		dc.w $0009
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_10
		dc.w $0001
		dc.w $0001
		dc.w $0006
		dc.w $0001
_09_ED_INNER:
		dc.w $0008
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
_10_ED_INNER:
		dc.w $000e
		dc.w $000c
		dc.w $000d
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0008
		dc.w $0001
		dc.w $0012
		dc.w $0001
_10aED_INNER:
		dc.l edin_textcol
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
_12_ED_INNER:
		dc.w $000d
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
_13_ED_INNER:
		dc.w $000a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON27
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_14_ED_INNER:
		dc.w $000f
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED02
		dc.w $0001
		dc.w $0003
		dc.w $0036
		dc.w $0001
_15_ED_INNER:
		dc.w $0011
		dc.w $0010
		dc.w $0010
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_18
		dc.w $002d
		dc.w $0001
		dc.w $0004
		dc.w $0001
_16_ED_INNER:
		dc.w $000f
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
_17_ED_INNER:
		dc.w $0014
		dc.w $0013
		dc.w $0013
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0032
		dc.w $0001
		dc.w $0005
		dc.w $0001
_17aED_INNER:
		dc.l edin_pos
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
_19_ED_INNER:
		dc.w $0011
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON27
		dc.w $0000
		dc.w $0000
		dc.w $0005
		dc.w $0001
_20_ED_INNER:
		dc.w $0016
		dc.w $0015
		dc.w $0015
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_12
		dc.w $001c
		dc.w $0001
		dc.w $0006
		dc.w $0001
_21_ED_INNER:
		dc.w $0014
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
_22_ED_INNER:
		dc.w $0007
		dc.w $0018
		dc.w $0018
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0023
		dc.w $0001
		dc.w $0008
		dc.w $0001
_22aED_INNER:
		dc.l edin_size
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
_24_ED_INNER:
		dc.w $0016
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON05
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0001
_25_ED_INNER:
		dc.w $0028
		dc.w $001a
		dc.w $0024
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME06
		dc.w $0001
		dc.w $0009
		dc.w $001c
		dc.w $0006
_26_ED_INNER:
		dc.w $001c
		dc.w $001b
		dc.w $001b
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_21
		dc.w $0002
		dc.w $0001
		dc.w $0006
		dc.w $0001
_27_ED_INNER:
		dc.w $001a
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
_28_ED_INNER:
		dc.w $0020
		dc.w $001e
		dc.w $001f
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0002
		dc.w $0012
		dc.w $0001
_28aED_INNER:
		dc.l edin_outcol
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $884c
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_30_ED_INNER:
		dc.w $001f
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
_31_ED_INNER:
		dc.w $001c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON27
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_32_ED_INNER:
		dc.w $0021
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_19
		dc.w $0003
		dc.w $0002
		dc.w $0005
		dc.w $0001
_33_ED_INNER:
		dc.w $0023
		dc.w $0022
		dc.w $0022
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_22
		dc.w $0001
		dc.w $0003
		dc.w $0007
		dc.w $0001
_34_ED_INNER:
		dc.w $0021
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
_35_ED_INNER:
		dc.w $0024
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_09
		dc.w $0002
		dc.w $0004
		dc.w $0006
		dc.w $0001
_36_ED_INNER:
		dc.w $0019
		dc.w $0026
		dc.w $0027
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0004
		dc.w $0012
		dc.w $0001
_36aED_INNER:
		dc.l edin_incol
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
_38_ED_INNER:
		dc.w $0027
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
_39_ED_INNER:
		dc.w $0024
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON27
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_40_ED_INNER:
		dc.w $0035
		dc.w $0029
		dc.w $0031
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME05
		dc.w $001d
		dc.w $0009
		dc.w $001c
		dc.w $0006
_41_ED_INNER:
		dc.w $002b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0001
		dc.l A_CHECKBOX01
		dc.w $0001
		dc.w $0001
		dc.w $000e
		dc.w $0001
_41aED_INNER:
		dc.l edin_dither
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8844
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_43_ED_INNER:
		dc.w $002d
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0002
		dc.w $0012
		dc.w $0001
_43aED_INNER:
		dc.l edin_pattern
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
_45_ED_INNER:
		dc.w $002f
		dc.w $002e
		dc.w $002e
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_13
		dc.w $0001
		dc.w $0002
		dc.w $0008
		dc.w $0001
_46_ED_INNER:
		dc.w $002d
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
_47_ED_INNER:
		dc.w $0031
		dc.w $0030
		dc.w $0030
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_10
		dc.w $0002
		dc.w $0004
		dc.w $0006
		dc.w $0001
_48_ED_INNER:
		dc.w $002f
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
_49_ED_INNER:
		dc.w $0028
		dc.w $0033
		dc.w $0034
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0004
		dc.w $0012
		dc.w $0001
_49aED_INNER:
		dc.l edin_intercol
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
_51_ED_INNER:
		dc.w $0034
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
_52_ED_INNER:
		dc.w $0031
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON27
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_53_ED_INNER:
		dc.w $0000
		dc.w $0036
		dc.w $0039
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME03
		dc.w $0001
		dc.w $000f
		dc.w $0038
		dc.w $0005
_54_ED_INNER:
		dc.w $0037
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_06
		dc.w $0001
		dc.w $0001
		dc.w $000e
		dc.w $0001
_55_ED_INNER:
		dc.w $0038
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_07
		dc.w $0001
		dc.w $0003
		dc.w $000d
		dc.w $0001
_56_ED_INNER:
		dc.w $0039
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED03
		dc.w $0010
		dc.w $0001
		dc.w $0027
		dc.w $0001
_57_ED_INNER:
		dc.w $0035
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0028
		dc.w $0010
		dc.l A_BOXED04
		dc.w $0010
		dc.w $0003
		dc.w $0027
		dc.w $0001
INNER1:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l xc204a
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
INNER2:
		dc.l A_innerframe
		dc.w $1000
		dc.w $8f19
		dc.l Auo_string
		dc.l xc204a
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
visual:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $2001
		dc.w $0010
		dc.l INNER1
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0002
logical:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l INNER2
		dc.w $0000
		dc.w $0000
		dc.w $0007
		dc.w $0002
aud:
		dc.l xc2050
		dc.l xc205c
		dc.w $0002
		dc.l xc204a
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
data:
		dc.b 'A_innerframe',0
		dc.b $00
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l object_tree
		dc.l test_it
		dc.l ok
		dc.l Aob_delete
		dc.l visual
		dc.l logical
		dc.l aud
		dc.l minsize
		dc.w $0000
		dc.w $0000
		dc.l title
		dc.l help_title
		dc.w $0000
		dc.w $0000
xc204a:
		dc.b 'Titel'
xc204f: dc.b 0
xc2050:
		dc.b '0x10008f19L',0
xc205c:
		dc.b 'Auo_string',0
xc2067:
		dc.b '0x%lxL',0
		.even
