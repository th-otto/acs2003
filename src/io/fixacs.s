		.text

ConvertWindowV2x:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		move.l     #0x0000008E,d0
		movea.l    a1,a0
		movea.l    a2,a1
		jsr        memcpy
		clr.l      142(a3)
		clr.l      146(a3)
		clr.l      150(a3)
		clr.l      154(a3)
		clr.l      158(a3)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

ConvertUserV1x:
		move.l     (a0),(a1)
		move.l     4(a0),4(a1)
		clr.l      8(a1)
		clr.l      12(a1)
		clr.l      16(a1)
		clr.l      20(a1)
		clr.l      24(a1)
		clr.l      28(a1)
		rts

ConvertUserV2x:
		move.l     (a0),(a1)
		move.l     4(a0),4(a1)
		move.l     8(a0),8(a1)
		move.l     12(a0),12(a1)
		move.l     16(a0),16(a1)
		move.l     20(a0),20(a1)
		clr.l      24(a1)
		clr.l      28(a1)
		rts

fix_config:
		move.l     a2,-(a7)
		movea.l    a0,a2
		jsr        fix_ob
		lea.l      4(a2),a0
		jsr        fix_ob
		lea.l      8(a2),a0
		jsr        fix_ob
		lea.l      18(a2),a0
		jsr        fix_ob
		lea.l      22(a2),a0
		jsr        fix_ob
		lea.l      26(a2),a0
		jsr        fix_ob
		lea.l      30(a2),a0
		jsr        fix_ob
		lea.l      34(a2),a0
		jsr        fix_ob
		lea.l      38(a2),a0
		jsr        fix_ob
		lea.l      42(a2),a0
		jsr        fix_ob
		lea.l      46(a2),a0
		jsr        fix_ob
		lea.l      50(a2),a0
		jsr        fix_ob
		lea.l      54(a2),a0
		jsr        fix_ob
		lea.l      58(a2),a0
		jsr        fix_ob
		lea.l      66(a2),a0
		jsr        fix_ob
		lea.l      70(a2),a0
		jsr        fix_ob
		lea.l      74(a2),a0
		jsr        fix_ob
		movea.l    (a7)+,a2
		rts

unfix_config:
		move.l     a2,-(a7)
		movea.l    a0,a2
		jsr        unfix_ob
		lea.l      4(a2),a0
		jsr        unfix_ob
		lea.l      8(a2),a0
		jsr        unfix_ob
		lea.l      18(a2),a0
		jsr        unfix_ob
		lea.l      22(a2),a0
		jsr        unfix_ob
		lea.l      26(a2),a0
		jsr        unfix_ob
		lea.l      30(a2),a0
		jsr        unfix_ob
		lea.l      34(a2),a0
		jsr        unfix_ob
		lea.l      38(a2),a0
		jsr        unfix_ob
		lea.l      42(a2),a0
		jsr        unfix_ob
		lea.l      46(a2),a0
		jsr        unfix_ob
		lea.l      50(a2),a0
		jsr        unfix_ob
		lea.l      54(a2),a0
		jsr        unfix_ob
		lea.l      58(a2),a0
		jsr        unfix_ob
		lea.l      66(a2),a0
		jsr        unfix_ob
		lea.l      70(a2),a0
		jsr        unfix_ob
		lea.l      74(a2),a0
		jsr        unfix_ob
		movea.l    (a7)+,a2
		rts

fix_ob:
		move.l     (a0),d0
		beq.s      fix_ob_1
		movea.l    d0,a1
		moveq.l    #0,d1
		move.w     8(a1),d1
		move.l     d1,(a0)
fix_ob_1:
		rts

unfix_ob:
		move.w     2(a0),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    trans,a1
		move.l     0(a1,d0.l),(a0)
		rts

next_trans:
		move.w     used,d0
		ext.l      d0
		moveq.l    #-1,d1
		add.l      transcount,d1
		cmp.l      d1,d0
		blt.s      next_trans_1
		lea.l      ERR_TRANS,a0
		moveq.l    #1,d0
		jsr        Awi_alert
		rts
next_trans_1:

		addq.w     #1,used
		rts

fix_all:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a3
		moveq.l    #2,d3
		lea.l      trans,a4
		lea.l      8(a4),a2
		movea.l    16(a3),a0
		bra.s      fix_all_1
fix_all_2:
		addq.l     #1,d3
		movea.l    (a0),a0
fix_all_1:
		move.l     a0,d0
		bne.s      fix_all_2
		move.l     d3,d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,(a4)
		move.l     a0,d0
		bne.s      fix_all_3
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		moveq.l    #3,d0
		suba.l     a0,a0
		jsr        (a1)
		clr.w      d0
		bra        fix_all_4
fix_all_3:
		move.l     d3,d1
		lsl.l      #2,d1
		clr.w      d0
		movea.l    (a4),a0
		jsr        memset
		move.l     d3,4(a4)
		move.l     d3,356(a3)
		movea.l    16(a3),a0
		jsr        fix_labels
		movea.l    (a2),a1
		movea.l    20(a3),a0
		jsr        fix_list
		movea.l    4(a2),a1
		movea.l    24(a3),a0
		jsr        fix_list
		movea.l    8(a2),a1
		movea.l    28(a3),a0
		jsr        fix_list
		movea.l    12(a2),a1
		movea.l    32(a3),a0
		jsr        fix_list
		movea.l    16(a2),a1
		movea.l    36(a3),a0
		jsr        fix_list
		movea.l    20(a2),a1
		movea.l    40(a3),a0
		jsr        fix_list
		movea.l    24(a2),a1
		movea.l    44(a3),a0
		jsr        fix_list
		movea.l    28(a2),a1
		movea.l    48(a3),a0
		jsr        fix_list
		movea.l    32(a2),a1
		movea.l    52(a3),a0
		jsr        fix_list
		movea.l    36(a2),a1
		movea.l    56(a3),a0
		jsr        fix_list
		movea.l    40(a2),a1
		movea.l    60(a3),a0
		jsr        fix_list
		movea.l    44(a2),a1
		movea.l    64(a3),a0
		jsr        fix_list
		movea.l    48(a2),a1
		movea.l    68(a3),a0
		jsr        fix_list
		clr.w      d3
		bra.s      fix_all_5
fix_all_6:
		movea.l    52(a2),a1
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a3,d0.l),a0
		movea.l    502(a0),a0
		jsr        fix_list
		addq.w     #1,d3
fix_all_5:
		cmp.w      #3,d3
		blt.s      fix_all_6
		clr.w      d3
		bra.s      fix_all_7
fix_all_8:
		movea.l    56(a2),a1
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a3,d0.l),a0
		movea.l    514(a0),a0
		jsr        fix_list
		addq.w     #1,d3
fix_all_7:
		cmp.w      #3,d3
		blt.s      fix_all_8
		movea.l    20(a3),a0
		moveq.l    #0,d0
		move.w     8(a0),d0
		move.l     d0,20(a3)
		movea.l    24(a3),a0
		moveq.l    #0,d1
		move.w     8(a0),d1
		move.l     d1,24(a3)
		movea.l    28(a3),a0
		moveq.l    #0,d0
		move.w     8(a0),d0
		move.l     d0,28(a3)
		movea.l    32(a3),a0
		moveq.l    #0,d1
		move.w     8(a0),d1
		move.l     d1,32(a3)
		movea.l    36(a3),a0
		moveq.l    #0,d0
		move.w     8(a0),d0
		move.l     d0,36(a3)
		movea.l    40(a3),a0
		moveq.l    #0,d1
		move.w     8(a0),d1
		move.l     d1,40(a3)
		movea.l    44(a3),a0
		moveq.l    #0,d0
		move.w     8(a0),d0
		move.l     d0,44(a3)
		movea.l    48(a3),a0
		moveq.l    #0,d1
		move.w     8(a0),d1
		move.l     d1,48(a3)
		movea.l    52(a3),a0
		moveq.l    #0,d0
		move.w     8(a0),d0
		move.l     d0,52(a3)
		movea.l    56(a3),a0
		moveq.l    #0,d1
		move.w     8(a0),d1
		move.l     d1,56(a3)
		movea.l    60(a3),a0
		moveq.l    #0,d0
		move.w     8(a0),d0
		move.l     d0,60(a3)
		movea.l    64(a3),a0
		moveq.l    #0,d1
		move.w     8(a0),d1
		move.l     d1,64(a3)
		movea.l    68(a3),a0
		moveq.l    #0,d0
		move.w     8(a0),d0
		move.l     d0,68(a3)
		lea.l      124(a3),a0
		bsr        fix_ob
		lea.l      128(a3),a0
		bsr        fix_ob
		lea.l      132(a3),a4
		moveq.l    #31,d3
		bra.s      fix_all_9
fix_all_10:
		lea.l      2(a4),a0
		bsr        fix_ob
		addq.w     #6,a4
		subq.w     #1,d3
fix_all_9:
		tst.w      d3
		bpl.s      fix_all_10
		clr.w      d3
		bra.s      fix_all_11
fix_all_12:
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a3,d0.l),a0
		movea.l    502(a0),a1
		moveq.l    #0,d1
		move.w     8(a1),d1
		move.l     d1,502(a0)
		addq.w     #1,d3
fix_all_11:
		cmp.w      #3,d3
		blt.s      fix_all_12
		clr.w      d3
		bra.s      fix_all_13
fix_all_14:
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a3,d0.l),a0
		movea.l    514(a0),a1
		moveq.l    #0,d1
		move.w     8(a1),d1
		move.l     d1,514(a0)
		addq.w     #1,d3
fix_all_13:
		cmp.w      #3,d3
		blt.s      fix_all_14
		lea.l      532(a3),a0
		bsr        fix_config
		moveq.l    #1,d0
fix_all_4:
		movem.l    (a7)+,d3/a2-a4
		rts

unfix_all:
		movem.l    d3/a2-a5,-(a7)
		movea.l    a0,a4
		lea.l      trans,a3
		lea.l      68(a3),a2
		move.l     (a3),d0
		beq        unfix_all_1
		move.w     4(a4),d1
		sub.w      #100,d1
		beq.s      unfix_all_2
		sub.w      #100,d1
		beq.s      unfix_all_3
		subq.w     #5,d1
		beq.s      unfix_all_3
		sub.w      #0x005F,d1
		beq.s      unfix_all_3
		bra.s      unfix_all_4
unfix_all_2:
		lea.l      188(a3),a2
		bra.s      unfix_all_4
unfix_all_3:
		lea.l      128(a3),a2
unfix_all_4:
		jsr        unfix_labels
		clr.w      d3
		bra.s      unfix_all_5
unfix_all_6:
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a4,d0.l),a0
		lea.l      502(a0),a0
		bsr        unfix_ob
		addq.w     #1,d3
unfix_all_5:
		cmp.w      #0x0003,d3
		blt.s      unfix_all_6
		clr.w      d3
		bra.s      unfix_all_7
unfix_all_8:
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a4,d0.l),a0
		lea.l      514(a0),a0
		bsr        unfix_ob
		addq.w     #1,d3
unfix_all_7:
		cmp.w      #0x0003,d3
		blt.s      unfix_all_8
		lea.l      20(a4),a0
		bsr        unfix_ob
		lea.l      24(a4),a0
		bsr        unfix_ob
		lea.l      28(a4),a0
		bsr        unfix_ob
		lea.l      32(a4),a0
		bsr        unfix_ob
		lea.l      40(a4),a0
		bsr        unfix_ob
		lea.l      44(a4),a0
		bsr        unfix_ob
		lea.l      48(a4),a0
		bsr        unfix_ob
		lea.l      36(a4),a0
		bsr        unfix_ob
		lea.l      56(a4),a0
		bsr        unfix_ob
		lea.l      52(a4),a0
		bsr        unfix_ob
		lea.l      60(a4),a0
		bsr        unfix_ob
		lea.l      64(a4),a0
		bsr        unfix_ob
		lea.l      68(a4),a0
		bsr        unfix_ob
		lea.l      124(a4),a0
		bsr        unfix_ob
		lea.l      128(a4),a0
		bsr        unfix_ob
		lea.l      132(a4),a5
		moveq.l    #31,d3
		bra.s      unfix_all_9
unfix_all_10:
		lea.l      2(a5),a0
		bsr        unfix_ob
		addq.w     #6,a5
		subq.w     #1,d3
unfix_all_9:
		tst.w      d3
		bpl.s      unfix_all_10
		movea.l    (a2),a1
		movea.l    20(a4),a0
		jsr        unfix_list
		movea.l    4(a2),a1
		movea.l    24(a4),a0
		jsr        unfix_list
		movea.l    8(a2),a1
		movea.l    28(a4),a0
		jsr        unfix_list
		movea.l    12(a2),a1
		movea.l    32(a4),a0
		jsr        unfix_list
		movea.l    16(a2),a1
		movea.l    36(a4),a0
		jsr        unfix_list
		movea.l    20(a2),a1
		movea.l    40(a4),a0
		jsr        unfix_list
		movea.l    24(a2),a1
		movea.l    44(a4),a0
		jsr        unfix_list
		movea.l    28(a2),a1
		movea.l    48(a4),a0
		jsr        unfix_list
		movea.l    36(a2),a1
		movea.l    56(a4),a0
		jsr        unfix_list
		movea.l    32(a2),a1
		movea.l    52(a4),a0
		jsr        unfix_list
		movea.l    40(a2),a1
		movea.l    60(a4),a0
		jsr        unfix_list
		movea.l    44(a2),a1
		movea.l    64(a4),a0
		jsr        unfix_list
		movea.l    48(a2),a1
		movea.l    68(a4),a0
		jsr        unfix_list
		clr.w      d3
		bra.s      unfix_all_11
unfix_all_12:
		movea.l    52(a2),a1
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a4,d0.l),a0
		movea.l    502(a0),a0
		jsr        unfix_list
		addq.w     #1,d3
unfix_all_11:
		cmp.w      #0x0003,d3
		blt.s      unfix_all_12
		clr.w      d3
		bra.s      unfix_all_13
unfix_all_14:
		movea.l    56(a2),a1
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a4,d0.l),a0
		movea.l    514(a0),a0
		jsr        unfix_list
		addq.w     #1,d3
unfix_all_13:
		cmp.w      #0x0003,d3
		blt.s      unfix_all_14
		movea.l    (a3),a0
		move.l     4(a0),16(a4)
		lea.l      532(a4),a0
		bsr        unfix_config
		movea.l    (a3),a0
		jsr        Ax_free
		clr.l      (a3)
		clr.l      4(a3)
unfix_all_1:
		movem.l    (a7)+,d3/a2-a5
		rts

wr_all:
		move.l     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    a0,a2
		moveq.l    #8,d0
		movea.l    ACSblk,a1
		addq.w     #8,a1
		lea.l      360(a2),a0
		jsr        memcpy
		move.l     #0x00000262,d0
		movea.l    a2,a0
		jsr        save_buf
		moveq.l    #1,d3
wr_all_2:
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    trans,a0
		movea.l    0(a0,d0.l),a2
		movea.l    a2,a0
		moveq.l    #66,d0
		jsr        save_buf
		move.l     14(a2),d0
		ble.s      wr_all_1
		movea.l    4(a2),a0
		jsr        save_buf
wr_all_1:
		addq.w     #1,d3
		move.l     (a2),d0
		bne.s      wr_all_2
		movea.l    (a7)+,a2
		move.l     (a7)+,d3
		rts

rd_all:
		movem.l    d3-d5/a2-a5,-(a7)
		movea.l    a0,a4
		move.l     #0x00002000,d3
		moveq.l    #6,d0
		jsr        read_buf
		cmpi.l     #0x2E414353,(a4)
		bne.s      rd_all_1
		cmpi.w     #0x0191,4(a4)
		beq.s      rd_all_2
		cmpi.w     #0x0190,4(a4)
		beq.s      rd_all_2
		cmpi.w     #0x012C,4(a4)
		beq.s      rd_all_2
		cmpi.w     #0x00CD,4(a4)
		beq.s      rd_all_2
		cmpi.w     #0x00C8,4(a4)
		beq.s      rd_all_2
		cmpi.w     #0x0064,4(a4)
		beq.s      rd_all_2
rd_all_1:
		lea.l      ERR_FILETYP,a0
		moveq.l    #1,d0
		jsr        Awi_alert
		suba.l     a0,a0
		clr.w      d0
		jsr        assert_error
rd_all_2:
		move.w     4(a4),d4
		lea.l      zero,a2
		move.w     d4,d0
		cmp.w      #0x00CD,d0
		beq.s      rd_all_3
		bgt.s      rd_all_4
		sub.w      #0x0064,d0
		beq.s      rd_all_5
		sub.w      #0x0064,d0
		beq.s      rd_all_3
		bra        rd_all_6
rd_all_4:
		sub.w      #0x012C,d0
		beq        rd_all_7
		sub.w      #0x0064,d0
		beq        rd_all_8
		bra        rd_all_6
rd_all_5:
		moveq.l    #58,d5
		move.l     #0x00000146,d0
		lea.l      6(a4),a0
		jsr        read_buf
		moveq.l    #8,d0
		movea.l    a2,a1
		lea.l      332(a4),a0
		jsr        memcpy
		moveq.l    #8,d0
		movea.l    a2,a1
		lea.l      340(a4),a0
		jsr        memcpy
		moveq.l    #8,d0
		movea.l    a2,a1
		lea.l      348(a4),a0
		jsr        memcpy
		bra.s      rd_all_9
rd_all_3:
		moveq.l    #66,d5
		move.l     #0x0000015E,d0
		lea.l      6(a4),a0
		jsr        read_buf
rd_all_9:
		moveq.l    #8,d0
		movea.l    ACSblk,a1
		addq.w     #8,a1
		lea.l      360(a4),a0
		jsr        memcpy
		clr.l      368(a4)
		clr.w      500(a4)
		movea.l    ACSblk,a1
		lea.l      726(a1),a1
		lea.l      372(a4),a0
		jsr        strcpy
		moveq.l    #12,d1
		clr.w      d0
		lea.l      502(a4),a0
		jsr        memset
		moveq.l    #12,d1
		clr.w      d0
		lea.l      514(a4),a0
		jsr        memset
		bra.s      rd_all_10
rd_all_7:
		moveq.l    #66,d5
		move.l     #0x00000208,d0
		lea.l      6(a4),a0
		jsr        read_buf
		move.l     356(a4),d3
rd_all_10:
		moveq.l    #16,d0
		and.w      6(a4),d0
		beq.s      rd_all_11
		moveq.l    #1,d1
		bra.s      rd_all_12
rd_all_11:
		clr.w      d1
rd_all_12:
		move.w     d1,526(a4)
		bra.s      rd_all_13
rd_all_8:
		moveq.l    #66,d5
		move.l     #0x0000020E,d0
		lea.l      6(a4),a0
		jsr        read_buf
		moveq.l    #70,d0
		lea.l      532(a4),a0
		jsr        read_buf
		bra.s      rd_all_14
rd_all_6:
		moveq.l    #66,d5
		move.l     #0x0000020E,d0
		lea.l      6(a4),a0
		jsr        read_buf
		moveq.l    #78,d0
		lea.l      532(a4),a0
		jsr        read_buf
rd_all_14:
		move.l     356(a4),d3
rd_all_13:
		moveq.l    #1,d0
		cmp.l      d3,d0
		ble.s      rd_all_15
		move.l     #0x00002000,d3
rd_all_15:
		lea.l      -248(a2),a3
		move.l     d3,d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,(a3)
		move.l     a0,d0
		bne.s      rd_all_16
		moveq.l    #3,d0
		suba.l     a0,a0
		jsr        assert_error
rd_all_16:
		move.l     d3,-244(a2)
		move.l     d3,d1
		lsl.l      #2,d1
		clr.w      d0
		movea.l    (a3),a0
		jsr        memset
		moveq.l    #0,d0
		move.l     d0,328(a4)
		move.l     d0,324(a4)
		move.l     d0,12(a4)
		andi.w     #0xFF9F,6(a4)
rd_all_21:
		moveq.l    #66,d0
		jsr        Ax_malloc
		movea.l    a0,a4
		move.l     a4,d0
		bne.s      rd_all_17
		moveq.l    #3,d0
		suba.l     a0,a0
		jsr        assert_error
rd_all_17:
		moveq.l    #8,d0
		movea.l    a2,a1
		lea.l      58(a4),a0
		jsr        memcpy
		move.w     d5,d0
		ext.l      d0
		movea.l    a4,a0
		jsr        read_buf
		clr.l      4(a4)
		clr.l      18(a4)
		move.l     14(a4),10(a4)
		cmp.w      #0x0064,d4
		bne.s      rd_all_18
		andi.w     #0x0100,56(a4)
rd_all_18:
		moveq.l    #0,d0
		move.w     8(a4),d0
		lsl.l      #2,d0
		movea.l    (a3),a0
		move.l     a4,0(a0,d0.l)
		moveq.l    #1,d0
		add.w      8(a4),d0
		moveq.l    #0,d1
		move.w     d0,d1
		lsl.l      #2,d1
		movea.l    (a3),a0
		clr.l      0(a0,d1.l)
		move.l     10(a4),d0
		ble.s      rd_all_19
		jsr        Ax_malloc
		movea.l    a0,a5
		move.l     a5,d0
		bne.s      rd_all_20
		moveq.l    #3,d0
		suba.l     a0,a0
		jsr        assert_error
rd_all_20:
		move.l     10(a4),d0
		movea.l    a5,a0
		jsr        read_buf
		move.l     a5,4(a4)
rd_all_19:
		move.l     (a4),d0
		bne        rd_all_21
		movem.l    (a7)+,d3-d5/a2-a5
		rts

fix_window:
		move.l     a2,-(a7)
		movea.l    4(a0),a2
		movea.l    a2,a0
		bsr        fix_ob
		lea.l      4(a2),a0
		bsr        fix_ob
		lea.l      8(a2),a0
		bsr        fix_ob
		lea.l      12(a2),a0
		bsr        fix_ob
		lea.l      16(a2),a0
		bsr        fix_ob
		lea.l      20(a2),a0
		bsr        fix_ob
		lea.l      24(a2),a0
		bsr        fix_ob
		lea.l      74(a2),a0
		bsr        fix_ob
		lea.l      78(a2),a0
		bsr        fix_ob
		lea.l      90(a2),a0
		bsr        fix_ob
		lea.l      94(a2),a0
		bsr        fix_ob
		lea.l      98(a2),a0
		bsr        fix_ob
		lea.l      102(a2),a0
		bsr        fix_ob
		lea.l      106(a2),a0
		bsr        fix_ob
		lea.l      110(a2),a0
		bsr        fix_ob
		lea.l      114(a2),a0
		bsr        fix_ob
		lea.l      118(a2),a0
		bsr        fix_ob
		lea.l      122(a2),a0
		bsr        fix_ob
		lea.l      126(a2),a0
		bsr        fix_ob
		lea.l      130(a2),a0
		bsr        fix_ob
		lea.l      134(a2),a0
		bsr        fix_ob
		lea.l      138(a2),a0
		bsr        fix_ob
		lea.l      142(a2),a0
		bsr        fix_ob
		lea.l      146(a2),a0
		bsr        fix_ob
		lea.l      150(a2),a0
		bsr        fix_ob
		lea.l      154(a2),a0
		bsr        fix_ob
		lea.l      158(a2),a0
		bsr        fix_ob
		movea.l    (a7)+,a2
		rts

unfix_window:
		move.l     a2,-(a7)
		movea.l    4(a0),a2
		movea.l    a2,a0
		bsr        unfix_ob
		lea.l      4(a2),a0
		bsr        unfix_ob
		lea.l      8(a2),a0
		bsr        unfix_ob
		lea.l      12(a2),a0
		bsr        unfix_ob
		lea.l      16(a2),a0
		bsr        unfix_ob
		lea.l      20(a2),a0
		bsr        unfix_ob
		lea.l      24(a2),a0
		bsr        unfix_ob
		lea.l      74(a2),a0
		bsr        unfix_ob
		lea.l      78(a2),a0
		bsr        unfix_ob
		lea.l      90(a2),a0
		bsr        unfix_ob
		lea.l      94(a2),a0
		bsr        unfix_ob
		lea.l      98(a2),a0
		bsr        unfix_ob
		lea.l      102(a2),a0
		bsr        unfix_ob
		lea.l      106(a2),a0
		bsr        unfix_ob
		lea.l      110(a2),a0
		bsr        unfix_ob
		lea.l      114(a2),a0
		bsr        unfix_ob
		lea.l      118(a2),a0
		bsr        unfix_ob
		lea.l      122(a2),a0
		bsr        unfix_ob
		lea.l      126(a2),a0
		bsr        unfix_ob
		lea.l      130(a2),a0
		bsr        unfix_ob
		lea.l      134(a2),a0
		bsr        unfix_ob
		lea.l      138(a2),a0
		bsr        unfix_ob
		lea.l      142(a2),a0
		bsr        unfix_ob
		lea.l      146(a2),a0
		bsr        unfix_ob
		lea.l      150(a2),a0
		bsr        unfix_ob
		lea.l      154(a2),a0
		bsr        unfix_ob
		lea.l      158(a2),a0
		bsr        unfix_ob
		movea.l    (a7)+,a2
		rts

fix_icon:
		move.l     a2,-(a7)
		movea.l    4(a0),a2
		lea.l      8(a2),a0
		bsr        fix_ob
		lea.l      40(a2),a0
		bsr        fix_ob
		lea.l      44(a2),a0
		bsr        fix_ob
		lea.l      48(a2),a0
		bsr        fix_ob
		lea.l      52(a2),a0
		bsr        fix_ob
		lea.l      62(a2),a0
		bsr        fix_ob
		lea.l      66(a2),a0
		bsr        fix_ob
		lea.l      70(a2),a0
		bsr        fix_ob
		lea.l      74(a2),a0
		bsr        fix_ob
		movea.l    (a7)+,a2
		rts

unfix_icon:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a2
		movea.l    4(a2),a3
		lea.l      8(a3),a0
		bsr        unfix_ob
		moveq.l    #82,d0
		cmp.l      (a3),d0
		beq        unfix_icon_1
		moveq.l    #48,d3
		add.l      14(a2),d3
		move.l     d3,d0
		jsr        Ax_malloc
		movea.l    a0,a4
		move.l     a4,d0
		bne.s      unfix_icon_2
		moveq.l    #3,d0
		suba.l     a0,a0
		jsr        assert_error
unfix_icon_2:
		moveq.l    #34,d0
		movea.l    a3,a1
		movea.l    a4,a0
		jsr        memcpy
		moveq.l    #22,d1
		clr.w      d0
		lea.l      38(a4),a0
		jsr        memset
		moveq.l    #22,d1
		clr.w      d0
		lea.l      60(a4),a0
		jsr        memset
		addi.l     #0x00000030,4(a4)
		addi.l     #0x00000030,(a4)
		clr.l      34(a4)
		moveq.l    #-34,d0
		add.l      14(a2),d0
		lea.l      34(a3),a1
		lea.l      82(a4),a0
		jsr        memcpy
		movea.l    a3,a0
		jsr        Ax_ifree
		move.l     a4,4(a2)
		move.l     d3,10(a2)
		move.l     d3,14(a2)
		bra.s      unfix_icon_3
unfix_icon_1:
		lea.l      40(a3),a0
		bsr        unfix_ob
		lea.l      44(a3),a0
		bsr        unfix_ob
		lea.l      48(a3),a0
		bsr        unfix_ob
		lea.l      52(a3),a0
		bsr        unfix_ob
		lea.l      62(a3),a0
		bsr        unfix_ob
		lea.l      66(a3),a0
		bsr        unfix_ob
		lea.l      70(a3),a0
		bsr        unfix_ob
		lea.l      74(a3),a0
		bsr        unfix_ob
unfix_icon_3:
		movem.l    (a7)+,d3/a2-a4
		rts

fix_labels:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		lea.l      used,a2
		move.w     #0x0001,(a2)
		bra.s      fix_labels_1
fix_labels_2:
		move.w     (a2),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    trans,a0
		move.l     a3,0(a0,d0.l)
		move.w     (a2),8(a3)
		movea.l    (a3),a3
		bsr        next_trans
fix_labels_1:
		move.l     a3,d0
		bne.s      fix_labels_2
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

unfix_labels:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      trans,a0
		movea.l    (a0),a1
		clr.l      (a1)
		moveq.l    #1,d1
		moveq.l    #2,d0
		lea.l      4(a0),a2
		bra.s      unfix_labels_1
unfix_labels_4:
		move.w     d1,d2
		ext.l      d2
		lsl.l      #2,d2
		movea.l    (a0),a1
		movea.l    0(a1,d2.l),a1
		move.l     a1,d2
		beq.s      unfix_labels_2
		move.w     d0,d2
		ext.l      d2
		cmp.l      (a2),d2
		bge.s      unfix_labels_3
		lsl.l      #2,d2
		movea.l    (a0),a3
		move.l     0(a3,d2.l),(a1)
		bra.s      unfix_labels_2
unfix_labels_3:
		clr.l      (a1)
unfix_labels_2:
		addq.w     #1,d1
		addq.w     #1,d0
unfix_labels_1:
		move.w     d1,d2
		ext.l      d2
		cmp.l      (a2),d2
		blt.s      unfix_labels_4
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

fix_list:
		movem.l    d3-d4/a2-a4,-(a7)
		movea.l    a1,a4
		move.l     14(a0),d0
		ble.s      fix_list_1
		movea.l    4(a0),a2
		move.l     d0,d3
		lsr.l      #2,d3
		clr.w      d4
		bra.s      fix_list_2
fix_list_4:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a3
		move.l     a4,d1
		beq.s      fix_list_3
		movea.l    a3,a0
		jsr        (a4)
fix_list_3:
		moveq.l    #0,d0
		move.w     8(a3),d0
		move.w     d4,d1
		ext.l      d1
		lsl.l      #2,d1
		move.l     d0,0(a2,d1.l)
		addq.w     #1,d4
fix_list_2:
		cmp.w      d4,d3
		bgt.s      fix_list_4
fix_list_1:
		movem.l    (a7)+,d3-d4/a2-a4
		rts

unfix_list:
		movem.l    d3-d4/a2-a4,-(a7)
		movea.l    a1,a4
		move.l     a0,d0
		beq.s      unfix_list_1
		move.l     14(a0),d1
		ble.s      unfix_list_1
		movea.l    4(a0),a2
		move.l     d1,d3
		lsr.l      #2,d3
		clr.w      d4
		bra.s      unfix_list_2
unfix_list_4:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		move.l     0(a2,d0.l),d1
		lsl.l      #2,d1
		movea.l    trans,a0
		movea.l    0(a0,d1.l),a3
		move.l     a4,d2
		beq.s      unfix_list_3
		movea.l    a3,a0
		jsr        (a4)
unfix_list_3:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		move.l     a3,0(a2,d0.l)
		addq.w     #1,d4
unfix_list_2:
		cmp.w      d4,d3
		bgt.s      unfix_list_4
unfix_list_1:
		movem.l    (a7)+,d3-d4/a2-a4
		rts

fix_object:
		movem.l    d3-d4/a2-a3,-(a7)
		movea.l    a0,a3
		movea.l    4(a3),a2
		move.l     14(a3),d0
		moveq.l    #56,d1
		jsr        _uldiv
		move.l     d0,d3
		clr.w      d4
		lea.l      ERR_TYPE,a3
		bra.w      fix_object_1
fix_object_5:
		movea.l    a2,a0
		bsr        fix_ob
		lea.l      4(a2),a0
		bsr        fix_ob
		move.b     15(a2),d0
		ext.w      d0
		sub.w      #0x0014,d0
		cmp.w      #0x000C,d0
		bhi.s      fix_object_2
		add.w      d0,d0
		move.w     J1(pc,d0.w),d0
		jmp        J1(pc,d0.w)
J1:
		dc.w fix_object_3-J1
		dc.w fix_object_4-J1
		dc.w fix_object_4-J1
		dc.w fix_object_4-J1
		dc.w fix_object_4-J1
		dc.w fix_object_3-J1
		dc.w fix_object_4-J1
		dc.w fix_object_3-J1
		dc.w fix_object_4-J1
		dc.w fix_object_4-J1
		dc.w fix_object_4-J1
		dc.w fix_object_4-J1
		dc.w fix_object_4-J1
fix_object_4:
		lea.l      20(a2),a0
		bsr        fix_ob
		bra.s      fix_object_3
fix_object_2:
		movea.l    a3,a0
		moveq.l    #1,d0
		jsr        Awi_alert
fix_object_3:
		lea.l      32(a2),a0
		bsr        fix_ob
		lea.l      36(a2),a0
		bsr        fix_ob
		lea.l      44(a2),a0
		bsr        fix_ob
		lea.l      48(a2),a0
		bsr        fix_ob
		lea.l      56(a2),a2
		addq.w     #1,d4
fix_object_1:
		cmp.w      d4,d3
		bgt.w      fix_object_5
		movem.l    (a7)+,d3-d4/a2-a3
		rts

unfix_object:
		movem.l    d3-d4/a2-a3,-(a7)
		movea.l    a0,a3
		movea.l    4(a3),a2
		move.l     14(a3),d0
		moveq.l    #56,d1
		jsr        _uldiv
		move.l     d0,d3
		clr.w      d4
		lea.l      ERR_TYPE,a3
		bra.w      unfix_object_1
unfix_object_5:
		movea.l    a2,a0
		bsr        unfix_ob
		lea.l      4(a2),a0
		bsr        unfix_ob
		move.b     15(a2),d0
		ext.w      d0
		sub.w      #0x0014,d0
		cmp.w      #0x000C,d0
		bhi.s      unfix_object_2
		add.w      d0,d0
		move.w     J2(pc,d0.w),d0
		jmp        J2(pc,d0.w)
J2:
		dc.w unfix_object_3-J2
		dc.w unfix_object_4-J2
		dc.w unfix_object_4-J2
		dc.w unfix_object_4-J2
		dc.w unfix_object_4-J2
		dc.w unfix_object_3-J2
		dc.w unfix_object_4-J2
		dc.w unfix_object_3-J2
		dc.w unfix_object_4-J2
		dc.w unfix_object_4-J2
		dc.w unfix_object_4-J2
		dc.w unfix_object_4-J2
		dc.w unfix_object_4-J2
unfix_object_4:
		lea.l      20(a2),a0
		bsr        unfix_ob
		bra.s      unfix_object_3
unfix_object_2:
		movea.l    a3,a0
		moveq.l    #1,d0
		jsr        Awi_alert
unfix_object_3:
		lea.l      32(a2),a0
		bsr        unfix_ob
		lea.l      36(a2),a0
		bsr        unfix_ob
		lea.l      44(a2),a0
		bsr        unfix_ob
		lea.l      48(a2),a0
		bsr        unfix_ob
		lea.l      56(a2),a2
		addq.w     #1,d4
unfix_object_1:
		cmp.w      d4,d3
		bgt.w      unfix_object_5
		movem.l    (a7)+,d3-d4/a2-a3
		rts

fix_tedinfo:
		move.l     a2,-(a7)
		movea.l    4(a0),a2
		movea.l    a2,a0
		bsr        fix_ob
		lea.l      4(a2),a0
		bsr        fix_ob
		lea.l      8(a2),a0
		bsr        fix_ob
		movea.l    (a7)+,a2
		rts

unfix_tedinfo:
		move.l     a2,-(a7)
		movea.l    4(a0),a2
		movea.l    a2,a0
		bsr        unfix_ob
		lea.l      4(a2),a0
		bsr        unfix_ob
		lea.l      8(a2),a0
		bsr        unfix_ob
		movea.l    (a7)+,a2
		rts

fix_user:
		move.l     a2,-(a7)
		movea.l    4(a0),a2
		movea.l    a2,a0
		bsr        fix_ob
		lea.l      4(a2),a0
		bsr        fix_ob
		lea.l      8(a2),a0
		bsr        fix_ob
		lea.l      12(a2),a0
		bsr        fix_ob
		lea.l      16(a2),a0
		bsr        fix_ob
		lea.l      20(a2),a0
		bsr        fix_ob
		lea.l      24(a2),a0
		bsr        fix_ob
		lea.l      28(a2),a0
		bsr        fix_ob
		movea.l    (a7)+,a2
		rts

unfix_user:
		move.l     a2,-(a7)
		movea.l    4(a0),a2
		movea.l    a2,a0
		bsr        unfix_ob
		lea.l      4(a2),a0
		bsr        unfix_ob
		lea.l      8(a2),a0
		bsr        unfix_ob
		lea.l      12(a2),a0
		bsr        unfix_ob
		lea.l      16(a2),a0
		bsr        unfix_ob
		lea.l      20(a2),a0
		bsr        unfix_ob
		lea.l      24(a2),a0
		bsr        unfix_ob
		lea.l      28(a2),a0
		bsr        unfix_ob
		movea.l    (a7)+,a2
		rts

unfix_window2:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a2
		movea.l    4(a2),a3
		move.l     #0x000000A2,d0
		jsr        Ax_malloc
		movea.l    a0,a4
		move.l     a4,d0
		bne.s      unfix_window2_1
		moveq.l    #3,d0
		suba.l     a0,a0
		jsr        assert_error
unfix_window2_1:
		movea.l    a4,a1
		movea.l    a3,a0
		bsr        ConvertWindowV2x
		movea.l    a3,a0
		jsr        Ax_ifree
		move.l     a4,4(a2)
		move.l     #0x000000A2,d0
		move.l     d0,10(a2)
		move.l     d0,14(a2)
		movea.l    a2,a0
		bsr        unfix_window
		movem.l    (a7)+,a2-a4
		rts

unfix_user1:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a2
		movea.l    4(a2),a3
		moveq.l    #32,d0
		jsr        Ax_malloc
		movea.l    a0,a4
		move.l     a4,d0
		bne.s      unfix_user1_1
		moveq.l    #3,d0
		suba.l     a0,a0
		jsr        assert_error
unfix_user1_1:
		movea.l    a4,a1
		movea.l    a3,a0
		bsr        ConvertUserV1x
		movea.l    a3,a0
		jsr        Ax_ifree
		move.l     a4,4(a2)
		moveq.l    #32,d0
		move.l     d0,10(a2)
		move.l     d0,14(a2)
		clr.w      56(a2)
		movea.l    a2,a0
		bsr        unfix_user
		movem.l    (a7)+,a2-a4
		rts

unfix_user2:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a2
		movea.l    4(a2),a3
		moveq.l    #32,d0
		jsr        Ax_malloc
		movea.l    a0,a4
		move.l     a4,d0
		bne.s      unfix_user2_1
		moveq.l    #3,d0
		suba.l     a0,a0
		jsr        assert_error
unfix_user2_1:
		movea.l    a4,a1
		movea.l    a3,a0
		bsr        ConvertUserV2x
		movea.l    a3,a0
		jsr        Ax_ifree
		move.l     a4,4(a2)
		moveq.l    #32,d0
		move.l     d0,10(a2)
		move.l     d0,14(a2)
		movea.l    a2,a0
		bsr        unfix_user
		movem.l    (a7)+,a2-a4
		rts

release_err:
		movem.l    d3/a2-a3,-(a7)
		lea.l      trans,a2
		move.l     (a2),d0
		beq.s      release_err_1
		moveq.l    #1,d3
		bra.s      release_err_2
release_err_4:
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a2),a0
		movea.l    0(a0,d0.l),a3
		move.l     a3,d1
		beq.s      release_err_3
		movea.l    4(a3),a0
		jsr        Ax_ifree
		movea.l    a3,a0
		jsr        Ax_ifree
		addq.w     #1,d3
release_err_2:
		move.w     d3,d0
		ext.l      d0
		cmp.l      4(a2),d0
		blt.s      release_err_4
release_err_3:
		movea.l    (a2),a0
		jsr        Ax_free
		clr.l      (a2)
		clr.l      4(a2)
release_err_1:
		movem.l    (a7)+,d3/a2-a3
		rts

free_acs:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a2
		movea.l    16(a2),a3
		bra.s      free_acs_1
free_acs_2:
		movea.l    (a3),a4
		movea.l    4(a3),a0
		jsr        Ax_ifree
		moveq.l    #66,d0
		movea.l    a3,a0
		jsr        Ax_recycle
		movea.l    a4,a3
free_acs_1:
		move.l     a3,d0
		bne.s      free_acs_2
		movea.l    a2,a0
		move.l     #0x00000262,d0
		jsr        Ax_recycle
		movem.l    (a7)+,a2-a4
		rts

objfree:
		movem.l    a2-a4,-(a7)
		movea.l    a1,a4
		ori.w      #0x0001,6(a0)
		lea.l      16(a0),a2
		bra.s      objfree_1
objfree_4:
		move.l     a3,d0
		bne.s      objfree_2
		lea.l      A_MISSENTRY,a0
		moveq.l    #1,d0
		jsr        Awi_alert
		bra.s      objfree_3
objfree_2:
		movea.l    a3,a2
objfree_1:
		movea.l    (a2),a3
		cmpa.l     a3,a4
		bne.s      objfree_4
		move.l     (a4),(a2)
		move.l     18(a4),d0
		beq.s      objfree_5
		suba.l     a1,a1
		movea.l    d0,a0
		movea.l    d0,a2
		movea.l    4(a2),a2
		moveq.l    #2,d0
		jsr        (a2)
objfree_5:
		movea.l    4(a4),a0
		jsr        Ax_free
		movea.l    a4,a0
		jsr        Ax_free
objfree_3:
		movem.l    (a7)+,a2-a4
		rts

objmalloc:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a4
		move.l     d0,d3
		tst.l      d0
		ble.s      objmalloc_1
		jsr        Ax_malloc
		movea.l    a0,a2
		move.l     a2,d0
		beq.s      objmalloc_2
		move.l     d3,d1
		clr.w      d0
		jsr        memset
		bra.s      objmalloc_3
objmalloc_1:
		suba.l     a2,a2
objmalloc_3:
		moveq.l    #66,d0
		jsr        Ax_malloc
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      objmalloc_4
		movea.l    a2,a0
		jsr        Ax_free
objmalloc_2:
		suba.l     a0,a0
		bra.s      objmalloc_5
objmalloc_4:
		moveq.l    #66,d1
		clr.w      d0
		movea.l    a3,a0
		jsr        memset
		move.w     6(a4),d0
		and.w      #0x1000,d0
		beq.s      objmalloc_6
		ori.w      #0x0400,56(a3)
objmalloc_6:
		move.l     a2,4(a3)
		move.w     #0x0001,54(a3)
		move.l     16(a4),(a3)
		move.l     a3,16(a4)
		move.l     d3,10(a3)
		movea.l    a3,a0
objmalloc_5:
		movem.l    (a7)+,d3/a2-a4
		rts

objextent:
		movem.l    d3/a2-a3,-(a7)
		movea.l    a0,a2
		move.l     d0,d3
		move.l     14(a2),d1
		add.l      d0,d1
		cmp.l      10(a2),d1
		ble.s      objextent_1
		lsl.l      #5,d0
		add.l      10(a2),d0
		jsr        Ax_malloc
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      objextent_2
		moveq.l    #-1,d0
		bra.s      objextent_3
objextent_2:
		move.l     4(a2),d0
		beq.s      objextent_4
		move.l     10(a2),d0
		movea.l    4(a2),a1
		movea.l    a3,a0
		jsr        memcpy
		movea.l    4(a2),a0
		jsr        Ax_free
objextent_4:
		move.l     d3,d0
		lsl.l      #5,d0
		add.l      d0,10(a2)
		move.l     a3,4(a2)
objextent_1:
		clr.w      d0
objextent_3:
		movem.l    (a7)+,d3/a2-a3
		rts

makeformat:
		movem.l    d3-d4/a2,-(a7)
		movea.l    a0,a2
		clr.w      d3
		move.w     d3,d0
		jsr        strchr
		movea.l    a0,a2
		bra.s      makeformat_1
makeformat_3:
		addq.w     #1,d3
makeformat_1:
		move.b     -(a2),d0
		ext.w      d0
		jsr        isdigit
		tst.w      d0
		beq.s      makeformat_2
		cmp.w      #0x0004,d3
		blt.s      makeformat_3
makeformat_2:
		addq.w     #1,a2
		tst.w      d3
		ble.s      makeformat_4
		movea.l    a2,a0
		clr.w      d4
		bra.s      makeformat_5
makeformat_6:
		move.w     d4,d0
		lsl.w      #2,d0
		add.w      d4,d0
		add.w      d0,d0
		move.b     (a0)+,d1
		ext.w      d1
		add.w      d1,d0
		add.w      #0xFFD0,d0
		move.w     d0,d4
makeformat_5:
		move.b     (a0),d0
		bne.s      makeformat_6
		lea.l      xa4af8,a1
		movea.l    a2,a0
		jsr        strcpy
		add.b      d3,2(a2)
		move.w     d4,d0
		bra.s      makeformat_7
makeformat_4:
		moveq.l    #-1,d0
makeformat_7:
		movem.l    (a7)+,d3-d4/a2
		rts

uniquename:
		movem.l    d3-d4/a2/a4-a6,-(a7)
		lea.l      -80(a7),a7
		movea.l    a0,a5
		movea.l    a1,a2
		lea.l      22(a2),a1
		lea.l      (a7),a0
		jsr        strcpy
		lea.l      (a7),a0
		bsr        makeformat
		move.w     d0,d3
		lea.l      40(a7),a4
		tst.w      d3
		bmi.s      uniquename_1
		move.w     d3,d0
		addq.w     #1,d3
		move.w     d0,-(a7)
		lea.l      2(a7),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #2,a7
		clr.b      31(a4)
		movea.l    a4,a1
		lea.l      22(a2),a0
		jsr        strcpy
uniquename_1:
		lea.l      22(a2),a0
		jsr        strlen
		move.l     d0,d4
		lea.l      16(a5),a6
		bra.s      uniquename_2
uniquename_7:
		movea.l    (a6),a1
		lea.l      22(a1),a1
		lea.l      22(a2),a0
		jsr        strcmp
		tst.w      d0
		bmi.s      uniquename_3
		tst.w      d0
		bne.s      uniquename_4
		cmpa.l     (a6),a2
		beq.s      uniquename_4
		tst.w      d3
		bmi.s      uniquename_5
		move.w     d3,d0
		addq.w     #1,d3
		move.w     d0,-(a7)
		lea.l      2(a7),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #2,a7
		clr.b      31(a4)
		movea.l    a4,a1
		lea.l      22(a2),a0
		jsr        strcpy
		move.b     0(a4,d4.w),d0
		beq.s      uniquename_4
		lea.l      16(a5),a6
		movea.l    a4,a0
		jsr        strlen
		move.l     d0,d4
		bra.s      uniquename_2
uniquename_5:
		moveq.l    #-1,d0
		bra.s      uniquename_6
uniquename_4:
		movea.l    (a6),a6
uniquename_2:
		move.l     (a6),d0
		bne.s      uniquename_7
uniquename_3:
		movea.l    108(a7),a0
		move.l     a6,(a0)
		clr.w      d0
uniquename_6:
		lea.l      80(a7),a7
		movem.l    (a7)+,d3-d4/a2/a4-a6
		rts

objname:
		movem.l    a2-a3/a5,-(a7)
		subq.w     #4,a7
		movea.l    a0,a3
		movea.l    a1,a2
		movea.l    24(a7),a5
		lea.l      22(a2),a0
		movea.l    20(a7),a1
		jsr        strcpy
		lea.l      16(a3),a0
		move.l     a0,(a7)
		bra.s      objname_1
objname_2:
		move.l     a0,(a7)
objname_1:
		movea.l    (a7),a1
		movea.l    (a1),a0
		cmpa.l     a0,a2
		bne.s      objname_2
		move.l     (a2),(a1)
		bra.s      objname_3
objname_5:
		move.l     a5,-(a7)
		movea.l    a2,a1
		movea.l    a3,a0
		jsr        newlabel
		addq.w     #4,a7
objname_3:
		pea.l      (a7)
		movea.l    a2,a1
		movea.l    a3,a0
		bsr        uniquename
		addq.w     #4,a7
		addq.w     #1,d0
		bne.s      objname_4
		move.l     a5,d0
		bne.s      objname_5
objname_4:
		movea.l    (a7),a0
		move.l     (a0),(a2)
		movea.l    (a7),a0
		move.l     a2,(a0)
		ori.w      #0x0001,6(a3)
		addq.w     #4,a7
		movem.l    (a7)+,a2-a3/a5
		rts

	.data

trans:
		dc.w $0000
		dc.w $0000
transcount:
		dc.w $0000
		dc.w $0000
FixV3x:
		dc.l fix_window
		dc.l fix_object
		dc.l fix_object
		dc.l fix_object
		dc.w $0000
		dc.w $0000
		dc.l fix_tedinfo
		dc.l fix_icon
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l fix_user
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
UnfixV3x:
		dc.l unfix_window
		dc.l unfix_object
		dc.l unfix_object
		dc.l unfix_object
		dc.w $0000
		dc.w $0000
		dc.l unfix_tedinfo
		dc.l unfix_icon
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l unfix_user
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
UnfixV2x:
		dc.l unfix_window2
		dc.l unfix_object
		dc.l unfix_object
		dc.l unfix_object
		dc.w $0000
		dc.w $0000
		dc.l unfix_tedinfo
		dc.l unfix_icon
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l unfix_user2
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
UnfixV1x:
		dc.l unfix_window2
		dc.l unfix_object
		dc.l unfix_object
		dc.l unfix_object
		dc.w $0000
		dc.w $0000
		dc.l unfix_tedinfo
		dc.l unfix_icon
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l unfix_user1
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

zero:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xa4af8:
		dc.b '%00d',0
		dc.b $00
