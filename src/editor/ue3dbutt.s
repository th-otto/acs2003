		.text

ed3d_dither:
		move.l     a2,-(a7)
		lea.l      ACSblk,a2
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
		beq        ed3d_dither_1
		movea.l    60(a1),a0
		addq.w     #4,a0
		andi.w     #0xFF8F,2(a0)
		ori.w      #0x0070,2(a0)
		andi.w     #0xFFF0,2(a0)
		ori.w      #0x0008,2(a0)
		move.w     (a0),d0
		lsr.w      #8,d0
		and.w      #0x00FF,d0
		and.w      #0x007F,d0
		andi.w     #0x00FF,(a0)
		and.w      #0x00FF,d0
		lsl.w      #8,d0
		or.w       d0,(a0)
		movea.l    colour_text+32,a1
		moveq.l    #65,d0
		movea.l    (a2),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		movea.l    (a2),a0
		movea.l    604(a0),a1
		andi.w     #0xFFF0,1550(a1)
		ori.w      #0x0008,1550(a1)
		moveq.l    #-1,d1
		moveq.l    #62,d0
		movea.l    (a2),a0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		movea.l    (a2),a0
		movea.l    604(a0),a1
		andi.w     #0xFF8F,1406(a1)
		ori.w      #0x0070,1406(a1)
		moveq.l    #-1,d1
		moveq.l    #58,d0
		movea.l    (a2),a0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a2),a0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
ed3d_dither_1:
		movea.l    (a7)+,a2
		rts

ed3d_incol:
		move.l     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		addq.w     #4,a2
		moveq.l    #49,d0
		move.w     d0,-(a7)
		moveq.l    #50,d2
		moveq.l    #47,d1
		move.l     (a2),d0
		moveq.l    #24,d3
		asr.l      d3,d0
		and.w      #0x000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      ed3d_incol_1
		move.l     (a2),d1
		and.l      #0xF0FFFFFF,d1
		ext.l      d0
		moveq.l    #24,d2
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
ed3d_incol_1:
		movea.l    (a7)+,a2
		move.l     (a7)+,d3
		rts

ed3d_intercol:
		movem.l    d3/a2-a3,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a3
		addq.w     #4,a3
		moveq.l    #64,d0
		move.w     d0,-(a7)
		moveq.l    #65,d2
		moveq.l    #62,d1
		moveq.l    #15,d0
		and.w      2(a3),d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      ed3d_intercol_1
		moveq.l    #-16,d1
		and.l      (a3),d1
		ext.l      d0
		or.l       d0,d1
		move.l     d1,(a3)
		movea.l    (a2),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a3
		andi.l     #0x7FFFFFFF,4(a3)
		movea.l    (a2),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a3
		move.w     1258(a3),d1
		and.w      #0xFFFE,d1
		movea.l    a1,a0
		movea.l    102(a1),a1
		moveq.l    #52,d0
		jsr        (a1)
		movea.l    (a2),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a3
		move.w     1306(a3),d1
		and.w      #0xFFFE,d1
		moveq.l    #54,d0
		movea.l    a1,a0
		movea.l    102(a1),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a2),a0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a3
		movea.l    102(a3),a1
		jsr        (a1)
ed3d_intercol_1:
		movem.l    (a7)+,d3/a2-a3
		rts

ed3d_nofill:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a3
		addq.w     #4,a3
		moveq.l    #1,d0
		move.w     608(a0),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		and.w      10(a1,d1.l),d0
		beq.s      ed3d_nofill_1
		ori.l      #0x80000000,(a3)
		bra.s      ed3d_nofill_2
ed3d_nofill_1:
		andi.l     #0x7FFFFFFF,(a3)
ed3d_nofill_2:
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

ed3d_outcol:
		move.l     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		addq.w     #4,a2
		moveq.l    #42,d0
		move.w     d0,-(a7)
		moveq.l    #43,d2
		moveq.l    #40,d1
		move.l     (a2),d0
		moveq.l    #12,d3
		asr.l      d3,d0
		and.w      #0x000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      ed3d_outcol_1
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
ed3d_outcol_1:
		movea.l    (a7)+,a2
		move.l     (a7)+,d3
		rts

ed3d_pattern:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		subq.w     #8,a7
		lea.l      POP_PATSEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        ed3d_pattern_1
		lea.l      ACSblk,a3
		moveq.l    #58,d0
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
		asr.l      #4,d0
		and.w      #0x0007,d0
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
		ble        ed3d_pattern_2
		subq.w     #1,d0
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		addq.w     #4,a0
		moveq.l    #-113,d1
		and.l      (a0),d1
		move.w     d0,d2
		ext.l      d2
		lsl.l      #4,d2
		or.l       d2,d1
		move.l     d1,(a0)
		movea.l    (a3),a0
		movea.l    604(a0),a1
		move.w     d0,d1
		andi.w     #0xFF8F,1406(a1)
		and.w      #0x0007,d1
		lsl.w      #4,d1
		or.w       d1,1406(a1)
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		andi.l     #0x7FFFFFFF,4(a0)
		movea.l    (a3),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a0
		move.w     1258(a0),d1
		and.w      #0xFFFE,d1
		moveq.l    #52,d0
		movea.l    a1,a0
		movea.l    102(a1),a1
		jsr        (a1)
		movea.l    (a3),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a0
		move.w     1306(a0),d1
		and.w      #0xFFFE,d1
		moveq.l    #54,d0
		movea.l    a1,a0
		movea.l    102(a1),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #58,d0
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
ed3d_pattern_2:
		movea.l    a2,a0
		jsr        Aob_delete
ed3d_pattern_1:
		addq.w     #8,a7
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

ed3d_pos:
		movem.l    a2-a4,-(a7)
		subq.w     #8,a7
		lea.l      POP_HORPOSSEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        ed3d_pos_1
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
		move.l     4(a0),d2
		moveq.l    #28,d0
		asr.l      d0,d2
		and.w      #0x0003,d2
		tst.w      d2
		beq.s      ed3d_pos_2
		subq.w     #1,d2
		beq.s      ed3d_pos_3
		subq.w     #1,d2
		beq.s      ed3d_pos_4
		bra.s      ed3d_pos_5
ed3d_pos_2:
		ori.w      #0x0004,34(a2)
		bra.s      ed3d_pos_5
ed3d_pos_3:
		ori.w      #0x0004,82(a2)
		bra.s      ed3d_pos_5
ed3d_pos_4:
		ori.w      #0x0004,58(a2)
ed3d_pos_5:
		move.w     2(a7),d1
		move.w     (a7),d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        Ame_popup
		tst.w      d0
		ble        ed3d_pos_6
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a4
		addq.w     #4,a4
		andi.l     #0xCFFFFFFF,(a4)
		move.w     d0,d1
		subq.w     #1,d1
		beq.s      ed3d_pos_7
		subq.w     #1,d1
		beq.s      ed3d_pos_8
		subq.w     #1,d1
		beq.s      ed3d_pos_9
		bra.s      ed3d_pos_10
ed3d_pos_7:
		lea.l      HPOS_TEXT1,a1
		moveq.l    #23,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      ed3d_pos_10
ed3d_pos_8:
		ori.l      #0x20000000,(a4)
		lea.l      HPOS_TEXT2,a1
		moveq.l    #23,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      ed3d_pos_10
ed3d_pos_9:
		ori.l      #0x10000000,(a4)
		lea.l      HPOS_TEXT3,a1
		moveq.l    #23,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
ed3d_pos_10:
		moveq.l    #-1,d1
		moveq.l    #23,d0
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
ed3d_pos_6:
		movea.l    a2,a0
		jsr        Aob_delete
ed3d_pos_1:
		addq.w     #8,a7
		movem.l    (a7)+,a2-a4
		rts

ed3d_replace:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		addq.w     #4,a0
		ori.l      #0x00000080,(a0)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		rts

ed3d_size:
		movem.l    a2-a4,-(a7)
		subq.w     #8,a7
		lea.l      POP_SIZESEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        ed3d_size_1
		lea.l      ACSblk,a3
		moveq.l    #16,d0
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
		moveq.l    #30,d1
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
		ble.s      ed3d_size_2
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a4
		addq.w     #4,a4
		cmp.w      #0x0001,d0
		bne.s      ed3d_size_3
		andi.l     #0xBFFFFFFF,(a4)
		lea.l      SIZE_TEXT0,a1
		moveq.l    #18,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      ed3d_size_4
ed3d_size_3:
		ori.l      #0x40000000,(a4)
		lea.l      SIZE_TEXT1,a1
		moveq.l    #18,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
ed3d_size_4:
		moveq.l    #-1,d1
		moveq.l    #18,d0
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
ed3d_size_2:
		movea.l    a2,a0
		jsr        Aob_delete
ed3d_size_1:
		addq.w     #8,a7
		movem.l    (a7)+,a2-a4
		rts

ed3d_textcol:
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
		asr.l      #8,d0
		and.w      #0x000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      ed3d_textcol_1
		move.l     (a2),d1
		and.l      #0xFFFFF0FF,d1
		ext.l      d0
		lsl.l      #8,d0
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
ed3d_textcol_1:
		movea.l    (a7)+,a2
		move.w     (a7)+,d3
		rts

ed3d_trans:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		addq.w     #4,a0
		andi.l     #0xFFFFFF7F,(a0)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		rts

init_3Dbutton:
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
		movea.l    ACSblk,a0
		muls.w     18(a0),d3
		bra.s      minsize_2
minsize_1:
		movea.l    ACSblk,a0
		move.w     18(a0),d3
minsize_2:
		move.w     d3,(a3)
		movea.l    ACSblk,a0
		movea.l    16(a7),a1
		move.w     20(a0),(a1)
		movem.l    (a7)+,d3/a2-a3
		rts

object_tree:
		movem.l    d3/a2-a6,-(a7)
		lea.l      -36(a7),a7
		movea.l    a0,a5
		movea.l    a1,a4
		lea.l      ED_3DBUTTON,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      object_tree_1
		suba.l     a0,a0
		bra        object_tree_2
object_tree_1:
		moveq.l    #28,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #69,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #70,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		lea.l      48(a2),a3
		moveq.l    #22,d0
		and.w      8(a4),d0
		or.w       d0,8(a3)
		moveq.l    #63,d0
		and.w      10(a4),d0
		or.w       d0,10(a3)
		movea.l    12(a3),a4
		pea.l      32(a7)
		lea.l      xc2d06,a1
		movea.l    (a5),a0
		jsr        sscanf
		addq.w     #4,a7
		move.l     32(a7),4(a4)
		cmpi.w     #0x0002,8(a5)
		bne.s      object_tree_3
		lea.l      xc2d0d,a1
		moveq.l    #4,d0
		movea.l    a3,a0
		movea.l    8(a4),a6
		jsr        (a6)
		movea.l    10(a5),a1
		moveq.l    #28,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_4
object_tree_3:
		lea.l      xc2cee,a1
		moveq.l    #4,d0
		movea.l    a3,a0
		movea.l    8(a4),a6
		jsr        (a6)
		lea.l      xc2cee,a1
		moveq.l    #28,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_4:
		movea.l    1668(a2),a0
		move.l     12(a0),24(a4)
		movea.l    38(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_5
		lea.l      xc2cee,a1
		moveq.l    #69,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_6
object_tree_5:
		movea.l    38(a5),a1
		moveq.l    #69,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_6:
		movea.l    1692(a2),a0
		move.l     12(a0),28(a4)
		movea.l    42(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_7
		lea.l      xc2cee,a1
		moveq.l    #70,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_8
object_tree_7:
		movea.l    42(a5),a1
		moveq.l    #70,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_8:
		lea.l      18(a7),a5
		movea.l    ACSblk,a0
		move.l     600(a0),(a5)
		lea.l      840(a2),a3
		move.l     a3,4(a5)
		move.w     #0x0023,8(a5)
		movea.l    a5,a1
		moveq.l    #9,d0
		movea.l    a3,a0
		jsr        Auo_slider
		lea.l      28(a7),a4
		move.l     #0x00000008,(a4)
		movea.l    a4,a1
		moveq.l    #100,d0
		movea.l    a3,a0
		jsr        Auo_slider
		move.l     #0x00000001,(a4)
		movea.l    a4,a1
		moveq.l    #101,d0
		movea.l    a3,a0
		jsr        Auo_slider
		move.l     32(a7),d0
		moveq.l    #16,d1
		asr.l      d1,d0
		and.l      #0x0000000F,d0
		move.l     d0,(a4)
		movea.l    a4,a1
		movea.l    a3,a0
		moveq.l    #17,d0
		jsr        Auo_slider
		move.l     32(a7),d0
		moveq.l    #16,d1
		asr.l      d1,d0
		and.w      #0x0007,d0
		move.w     d0,-(a7)
		lea.l      xc2d11,a1
		lea.l      2(a7),a0
		jsr        sprintf
		addq.w     #2,a7
		lea.l      (a7),a1
		moveq.l    #4,d0
		movea.l    a3,a0
		jsr        Auo_slider
		move.l     #live_thickness,10(a7)
		move.l     a3,14(a7)
		lea.l      10(a7),a1
		moveq.l    #103,d0
		movea.l    a3,a0
		jsr        Auo_slider
		lea.l      768(a2),a3
		move.l     a3,4(a5)
		move.w     #0x0020,8(a5)
		movea.l    a5,a1
		moveq.l    #9,d0
		movea.l    a3,a0
		jsr        Auo_slider
		move.l     #0x00000010,(a4)
		movea.l    a4,a1
		moveq.l    #100,d0
		movea.l    a3,a0
		jsr        Auo_slider
		move.l     #0x00000001,(a4)
		movea.l    a4,a1
		moveq.l    #101,d0
		movea.l    a3,a0
		jsr        Auo_slider
		move.l     32(a7),d0
		moveq.l    #20,d1
		asr.l      d1,d0
		and.l      #0x0000000F,d0
		move.l     d0,(a4)
		moveq.l    #8,d2
		cmp.l      d0,d2
		ble.s      object_tree_9
		add.l      d2,(a4)
		bra.s      object_tree_10
object_tree_9:
		subq.l     #8,(a4)
object_tree_10:
		movea.l    a4,a1
		moveq.l    #17,d0
		movea.l    a3,a0
		jsr        Auo_slider
		move.l     32(a7),d0
		moveq.l    #20,d1
		asr.l      d1,d0
		and.l      #0x0000000F,d0
		move.l     d0,(a4)
		moveq.l    #7,d2
		cmp.l      d0,d2
		bge.s      object_tree_11
		subi.l     #0x00000010,(a4)
object_tree_11:
		move.w     2(a4),-(a7)
		lea.l      xc2d11,a1
		lea.l      2(a7),a0
		jsr        sprintf
		addq.w     #2,a7
		lea.l      (a7),a1
		moveq.l    #4,d0
		movea.l    a3,a0
		jsr        Auo_slider
		move.l     #live_offset,10(a7)
		move.l     a3,14(a7)
		lea.l      10(a7),a1
		moveq.l    #103,d0
		movea.l    a3,a0
		jsr        Auo_slider
		move.l     32(a7),d3
		moveq.l    #24,d0
		asr.l      d0,d3
		and.w      #0x000F,d3
		move.w     d3,d1
		ext.l      d1
		lsl.l      #2,d1
		lea.l      colour_text,a0
		movea.l    0(a0,d1.l),a1
		movea.l    a2,a0
		moveq.l    #50,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #0xFFF0,1190(a2)
		and.w      #0x000F,d0
		or.w       d0,1190(a2)
		moveq.l    #15,d3
		and.w      34(a7),d3
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      colour_text,a0
		movea.l    0(a0,d0.l),a1
		movea.l    a2,a0
		moveq.l    #65,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #0xFFF0,1550(a2)
		and.w      #0x000F,d0
		or.w       d0,1550(a2)
		move.l     32(a7),d3
		moveq.l    #12,d0
		asr.l      d0,d3
		and.w      #0x000F,d3
		move.w     d3,d1
		ext.l      d1
		lsl.l      #2,d1
		lea.l      colour_text,a0
		movea.l    0(a0,d1.l),a1
		movea.l    a2,a0
		moveq.l    #43,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #0xFFF0,1022(a2)
		and.w      #0x000F,d0
		or.w       d0,1022(a2)
		move.l     32(a7),d3
		asr.l      #4,d3
		and.w      #0x0007,d3
		move.w     d3,d0
		andi.w     #0xFF8F,1406(a2)
		and.w      #0x0007,d0
		lsl.w      #4,d0
		or.w       d0,1406(a2)
		move.l     32(a7),d0
		moveq.l    #28,d1
		asr.l      d1,d0
		and.w      #0x000F,d0
		subq.w     #1,d0
		beq.s      object_tree_12
		subq.w     #1,d0
		beq.s      object_tree_13
		bra.s      object_tree_14
object_tree_12:
		lea.l      HPOS_TEXT3,a1
		moveq.l    #23,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_15
object_tree_13:
		lea.l      HPOS_TEXT2,a1
		moveq.l    #23,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_15
object_tree_14:
		lea.l      HPOS_TEXT1,a1
		moveq.l    #23,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_15:
		move.l     32(a7),d0
		and.l      #0x40000000,d0
		beq.s      object_tree_16
		lea.l      SIZE_TEXT1,a1
		movea.l    a2,a0
		moveq.l    #18,d0
		jsr        Aob_puttext
		bra.s      object_tree_17
object_tree_16:
		lea.l      SIZE_TEXT0,a1
		moveq.l    #18,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_17:
		move.l     32(a7),d3
		asr.l      #8,d3
		and.w      #0x000F,d3
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      colour_text,a0
		movea.l    0(a0,d0.l),a1
		movea.l    a2,a0
		moveq.l    #13,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #0xFFF0,302(a2)
		and.w      #0x000F,d0
		or.w       d0,302(a2)
		movea.l    a2,a0
object_tree_2:
		lea.l      36(a7),a7
		movem.l    (a7)+,d3/a2-a6
		rts

test_it:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     #A_3Dbutton,(a1)
		pea.l      4(a2)
		lea.l      xc2d06,a1
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
		lea.l      xc2d06,a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #4,a7
		lea.l      4(a7),a5
		move.l     a4,(a5)
		move.l     #xc2cfb,4(a5)
		lea.l      (a7),a1
		moveq.l    #3,d0
		lea.l      672(a3),a0
		jsr        Auo_boxed
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      ok_1
		jsr        strlen
		move.l     d0,d3
		movea.l    (a2),a0
		muls.w     18(a0),d3
		move.w     #0x0002,8(a5)
		move.l     (a7),10(a5)
		bra.s      ok_2
ok_1:
		movea.l    (a2),a0
		move.w     18(a0),d3
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
		lea.l      1656(a3),a0
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
		lea.l      1680(a3),a0
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

live_offset:
		movem.l    d3-d4/a2,-(a7)
		lea.l      -16(a7),a7
		movea.l    a0,a2
		move.l     d0,d3
		subq.l     #8,d3
		move.l     d3,d4
		lea.l      (a7),a1
		moveq.l    #18,d0
		jsr        Auo_slider
		movea.l    (a7),a2
		movea.l    20(a2),a0
		lea.l      48(a0),a0
		movea.l    12(a0),a1
		addq.w     #4,a1
		movea.l    a1,a0
		tst.l      d3
		bpl.s      live_offset_1
		add.l      #0x00000010,d3
live_offset_1:
		move.l     (a0),d0
		moveq.l    #20,d1
		asr.l      d1,d0
		and.l      #0x0000000F,d0
		cmp.l      d0,d3
		beq.s      live_offset_2
		move.l     (a0),d2
		and.l      #0xFF0FFFFF,d2
		move.l     d3,d0
		lsl.l      d1,d0
		or.l       d0,d2
		move.l     d2,(a0)
		movea.l    a2,a0
		movea.l    102(a2),a1
		moveq.l    #1,d0
		moveq.l    #-1,d1
		jsr        (a1)
live_offset_2:
		moveq.l    #10,d1
		lea.l      10(a7),a0
		move.w     d4,d0
		jsr        itoa
		lea.l      16(a7),a7
		movem.l    (a7)+,d3-d4/a2
		rts

live_thickness:
		movem.l    d3-d4/a2,-(a7)
		lea.l      -16(a7),a7
		movea.l    a0,a2
		move.l     d0,d3
		move.w     d3,d4
		lea.l      (a7),a1
		moveq.l    #18,d0
		jsr        Auo_slider
		movea.l    (a7),a2
		movea.l    20(a2),a0
		lea.l      48(a0),a0
		movea.l    12(a0),a1
		addq.w     #4,a1
		movea.l    a1,a0
		move.l     (a1),d0
		moveq.l    #16,d1
		asr.l      d1,d0
		and.l      #0x0000000F,d0
		cmp.l      d0,d3
		beq.s      live_thickness_1
		move.l     (a1),d2
		and.l      #0xFFF0FFFF,d2
		move.w     d4,d3
		ext.l      d3
		lsl.l      d1,d3
		or.l       d3,d2
		move.l     d2,(a1)
		moveq.l    #1,d0
		movea.l    a2,a0
		movea.l    102(a2),a1
		moveq.l    #-1,d1
		jsr        (a1)
live_thickness_1:
		moveq.l    #10,d1
		lea.l      10(a7),a0
		move.w     d4,d0
		jsr        itoa
		lea.l      16(a7),a7
		movem.l    (a7)+,d3-d4/a2
		rts

	.data

BUBBLE_01:
		dc.b 'Die énderungen werden Åbernommen und Åberschreiben die alten Einstellungen.',0
BUBBLE_02:
		dc.b 'Die énderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
BUBBLE_03:
		dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_04:
		dc.b 'Hier wird die Beschriftung des 3D-Buttons eingegeben.',0
BUBBLE_05:
		dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
BUBBLE_07:
		dc.b 'Hier wird die Schriftgrîûe eingestellt.',0
CONTEXT_01:
		dc.b 'Kopieren|EinfÅgen|Lîschen',0
TEXT_005:
		dc.b 'OK',0
TEXT_009:
		dc.b 'Abbruch',0
TEXT_01:
		dc.b 'Offset:',0
TEXT_02:
		dc.b 'leeres FÅllmuster',0
TEXT_03:
		dc.b 'StÑrke:',0
TEXT_037:
		dc.b 'ABC',0
TEXT_04:
		dc.b 'Position:',0
TEXT_05:
		dc.b 'Sonstiges',0
TEXT_06:
		dc.b 'BubbleGEM-Text',0
TEXT_07:
		dc.b 'Context-Popup',0
TEXT_09:
		dc.b 'unten:',0
TEXT_10:
		dc.b 'Rahmen:',0
TEXT_11:
		dc.b 'Farbe:',0
TEXT_12:
		dc.b 'Grîûe:',0
TEXT_13:
		dc.b 'Modus:',0
TEXT_14:
		dc.b 'Text:',0
TEXT_15:
		dc.b 'InnenflÑche:',0
TEXT_17:
		dc.b 'Muster:',0
TEXT_19:
		dc.b 'oben:',0
TEXT_20:
		dc.b 'DitherModus',0
TEXT_21:
		dc.b 'links/',0
TEXT_22:
		dc.b 'rechts/',0
help_title:
		dc.b 'Der 3D-Button-Editor',0
title:
		dc.b '3D-Button -',0
A_3DBUTTON04:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_005
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_01
		dc.w $0000
		dc.w $0000
A_3DBUTTON06:
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
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_07
		dc.w $0000
		dc.w $0000
A_3DBUTTON08:
		dc.l A_3Dbutton
		dc.w $2102
		dc.w $0191
		dc.l Auo_string
		dc.l TEXT_037
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
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_009
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_02
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
A_BOXED01:
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
		dc.l BUBBLE_04
		dc.l CONTEXT_01
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
A_CHECKBOX02:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_02
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_CHECKBOX03:
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
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_10
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
		dc.l TEXT_14
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
A_SLIDER02:
		dc.l A_slider
		dc.w $0000
		dc.w $0002
		dc.l Auo_slider
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
ED_3DBUTTON:
		dc.w $ffff
		dc.w $0001
		dc.w $0042
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON06
		dc.w $0000
		dc.w $0000
		dc.w $003a
		dc.w $0018
_01_ED_3DBUTTON:
		dc.w $0003
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON07
		dc.w $0000
		dc.w $0000
		dc.w $000e
		dc.w $fc04
_02_ED_3DBUTTON:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0010
		dc.l A_3DBUTTON08
		dc.w $0002
		dc.w $0001
		dc.w $000a
		dc.w $0002
_03_ED_3DBUTTON:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON04
		dc.w $001d
		dc.w $0001
		dc.w $000c
		dc.w $0002
_03aED_3DBUTTON:
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
_05_ED_3DBUTTON:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON09
		dc.w $002c
		dc.w $0001
		dc.w $000c
		dc.w $0002
_05aED_3DBUTTON:
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
_07_ED_3DBUTTON:
		dc.w $001e
		dc.w $0008
		dc.w $001d
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME02
		dc.w $0001
		dc.w $0004
		dc.w $0038
		dc.w $0007
_08_ED_3DBUTTON:
		dc.w $000a
		dc.w $0009
		dc.w $0009
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_11
		dc.w $0004
		dc.w $0001
		dc.w $0006
		dc.w $0001
_09_ED_3DBUTTON:
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
_10_ED_3DBUTTON:
		dc.w $000e
		dc.w $000c
		dc.w $000d
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $000b
		dc.w $0001
		dc.w $0012
		dc.w $0001
_10aED_3DBUTTON:
		dc.l ed3d_textcol
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
_12_ED_3DBUTTON:
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
_13_ED_3DBUTTON:
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
_14_ED_3DBUTTON:
		dc.w $0010
		dc.w $000f
		dc.w $000f
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_12
		dc.w $0022
		dc.w $0001
		dc.w $0006
		dc.w $0001
_15_ED_3DBUTTON:
		dc.w $000e
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
_16_ED_3DBUTTON:
		dc.w $0013
		dc.w $0012
		dc.w $0012
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0029
		dc.w $0001
		dc.w $0008
		dc.w $0001
_16aED_3DBUTTON:
		dc.l ed3d_size
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
_18_ED_3DBUTTON:
		dc.w $0010
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON07
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0001
_19_ED_3DBUTTON:
		dc.w $0015
		dc.w $0014
		dc.w $0014
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_04
		dc.w $0001
		dc.w $0003
		dc.w $0009
		dc.w $0001
_20_ED_3DBUTTON:
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
_21_ED_3DBUTTON:
		dc.w $0018
		dc.w $0017
		dc.w $0017
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $000b
		dc.w $0003
		dc.w $000a
		dc.w $0001
_21aED_3DBUTTON:
		dc.l ed3d_pos
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
_23_ED_3DBUTTON:
		dc.w $0015
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON27
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0001
_24_ED_3DBUTTON:
		dc.w $001a
		dc.w $ffff
		dc.w $ffff
		dc.w $001b
		dc.w $0005
		dc.w $0000
		dc.w $43ff
		dc.w $1121
		dc.w $0029
		dc.w $0003
		dc.w $0003
		dc.w $0001
_24aED_3DBUTTON:
		dc.l ed3d_trans
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
_26_ED_3DBUTTON:
		dc.w $001c
		dc.w $ffff
		dc.w $ffff
		dc.w $001b
		dc.w $0005
		dc.w $0000
		dc.w $43ff
		dc.w $11a1
		dc.w $002d
		dc.w $0003
		dc.w $0003
		dc.w $0001
_26aED_3DBUTTON:
		dc.l ed3d_replace
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
_28_ED_3DBUTTON:
		dc.w $001d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED01
		dc.w $0001
		dc.w $0005
		dc.w $0036
		dc.w $0001
_29_ED_3DBUTTON:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_13
		dc.w $0022
		dc.w $0003
		dc.w $0006
		dc.w $0001
_30_ED_3DBUTTON:
		dc.w $0033
		dc.w $001f
		dc.w $002f
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME01
		dc.w $0001
		dc.w $000b
		dc.w $001c
		dc.w $0008
_31_ED_3DBUTTON:
		dc.w $0020
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_01
		dc.w $0001
		dc.w $0001
		dc.w $0007
		dc.w $0001
_32_ED_3DBUTTON:
		dc.w $0022
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_SLIDER02
		dc.w $0009
		dc.w $0001
		dc.w $0012
		dc.w $0001
_32aED_3DBUTTON:
		dc.l Aus_slider
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
_34_ED_3DBUTTON:
		dc.w $0023
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_03
		dc.w $0001
		dc.w $0002
		dc.w $0007
		dc.w $0001
_35_ED_3DBUTTON:
		dc.w $0025
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_SLIDER02
		dc.w $0009
		dc.w $0002
		dc.w $0012
		dc.w $0001
_35aED_3DBUTTON:
		dc.l Aus_slider
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
_37_ED_3DBUTTON:
		dc.w $0027
		dc.w $0026
		dc.w $0026
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_21
		dc.w $0002
		dc.w $0003
		dc.w $0006
		dc.w $0001
_38_ED_3DBUTTON:
		dc.w $0025
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
_39_ED_3DBUTTON:
		dc.w $0028
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_19
		dc.w $0003
		dc.w $0004
		dc.w $0005
		dc.w $0001
_40_ED_3DBUTTON:
		dc.w $002c
		dc.w $002a
		dc.w $002b
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0004
		dc.w $0012
		dc.w $0001
_40aED_3DBUTTON:
		dc.l ed3d_outcol
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
_42_ED_3DBUTTON:
		dc.w $002b
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
_43_ED_3DBUTTON:
		dc.w $0028
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
_44_ED_3DBUTTON:
		dc.w $002e
		dc.w $002d
		dc.w $002d
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_22
		dc.w $0001
		dc.w $0005
		dc.w $0007
		dc.w $0001
_45_ED_3DBUTTON:
		dc.w $002c
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
_46_ED_3DBUTTON:
		dc.w $002f
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_09
		dc.w $0002
		dc.w $0006
		dc.w $0006
		dc.w $0001
_47_ED_3DBUTTON:
		dc.w $001e
		dc.w $0031
		dc.w $0032
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0006
		dc.w $0012
		dc.w $0001
_47aED_3DBUTTON:
		dc.l ed3d_incol
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
_49_ED_3DBUTTON:
		dc.w $0032
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
_50_ED_3DBUTTON:
		dc.w $002f
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
_51_ED_3DBUTTON:
		dc.w $0042
		dc.w $0034
		dc.w $003e
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME05
		dc.w $001d
		dc.w $000b
		dc.w $001c
		dc.w $0008
_52_ED_3DBUTTON:
		dc.w $0036
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_CHECKBOX03
		dc.w $0001
		dc.w $0001
		dc.w $000e
		dc.w $0001
_52aED_3DBUTTON:
		dc.l ed3d_dither
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
_54_ED_3DBUTTON:
		dc.w $0038
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_CHECKBOX02
		dc.w $0001
		dc.w $0002
		dc.w $0014
		dc.w $0001
_54aED_3DBUTTON:
		dc.l ed3d_nofill
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8845
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_56_ED_3DBUTTON:
		dc.w $003a
		dc.w $0039
		dc.w $0039
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_17
		dc.w $0001
		dc.w $0004
		dc.w $0008
		dc.w $0001
_57_ED_3DBUTTON:
		dc.w $0038
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
_58_ED_3DBUTTON:
		dc.w $003c
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0004
		dc.w $0012
		dc.w $0001
_58aED_3DBUTTON:
		dc.l ed3d_pattern
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
_60_ED_3DBUTTON:
		dc.w $003e
		dc.w $003d
		dc.w $003d
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_11
		dc.w $0002
		dc.w $0006
		dc.w $0006
		dc.w $0001
_61_ED_3DBUTTON:
		dc.w $003c
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
_62_ED_3DBUTTON:
		dc.w $0033
		dc.w $0040
		dc.w $0041
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0006
		dc.w $0012
		dc.w $0001
_62aED_3DBUTTON:
		dc.l ed3d_intercol
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
_64_ED_3DBUTTON:
		dc.w $0041
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
_65_ED_3DBUTTON:
		dc.w $003e
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
_66_ED_3DBUTTON:
		dc.w $0000
		dc.w $0043
		dc.w $0046
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME03
		dc.w $0001
		dc.w $0013
		dc.w $0038
		dc.w $0005
_67_ED_3DBUTTON:
		dc.w $0044
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
_68_ED_3DBUTTON:
		dc.w $0045
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
_69_ED_3DBUTTON:
		dc.w $0046
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
_70_ED_3DBUTTON:
		dc.w $0042
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
DB1:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
		dc.l xc2cec
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
DB2:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l xc2cec
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
		dc.w $2005
		dc.w $0010
		dc.l DB1
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0002
logical:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l DB2
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0002
aud:
		dc.l xc2cef
		dc.l xc2cfb
		dc.w $0002
		dc.l xc2cec
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
		dc.b 'A_3Dbutton',0
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
xc2cec:
		dc.b '3D'
xc2cee:
		dc.b 0
xc2cef:
		dc.b '0x29c10178L',0
xc2cfb:
		dc.b 'Auo_string',0
xc2d06:
		dc.b '0x%lxL',0
xc2d0d:
		dc.b 'ABC',0
xc2d11:
		dc.b '%d',0
		.even
