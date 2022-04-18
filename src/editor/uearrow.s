		.text

edar_3d:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		eori.l     #0x80000000,4(a0)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		rts

edar_arr:
		movem.l    d3/a2-a4,-(a7)
		subq.w     #8,a7
		lea.l      POP_ARR,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edar_arr_1
		lea.l      ACSblk,a3
		moveq.l    #9,d0
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
		movea.l    a1,a0
		movea.l    a2,a1
		move.w     (a7),d0
		move.w     2(a7),d1
		jsr        Ame_popup
		move.w     d0,d3
		tst.w      d0
		ble        edar_arr_2
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a4
		addq.w     #4,a4
		ext.l      d0
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		movea.l    12(a2,d1.l),a0
		addq.w     #4,a0
		move.w     d3,d2
		cmp.w      #0x0008,d2
		bhi.s      edar_arr_3
		add.w      d2,d2
		move.w     J10(pc,d2.w),d2
		jmp        J10(pc,d2.w)
J10:
		dc.w edar_arr_3-J10
		dc.w edar_arr_4-J10
		dc.w edar_arr_5-J10
		dc.w edar_arr_4-J10
		dc.w edar_arr_5-J10
		dc.w edar_arr_4-J10
		dc.w edar_arr_5-J10
		dc.w edar_arr_4-J10
		dc.w edar_arr_5-J10
edar_arr_4:
		move.l     (a4),d0
		and.l      #0xFCFFFFFF,d0
		move.l     (a0),d1
		and.l      #0x03000000,d1
		or.l       d1,d0
		move.l     d0,(a4)
		movea.l    (a3),a1
		movea.l    604(a1),a1
		movea.l    276(a1),a1
		move.l     (a0),4(a1)
		bra.s      edar_arr_3
edar_arr_5:
		move.l     (a4),d0
		and.l      #0xCFFFFFFF,d0
		move.l     (a0),d1
		and.l      #0x30000000,d1
		or.l       d1,d0
		move.l     d0,(a4)
		movea.l    (a3),a1
		movea.l    604(a1),a4
		movea.l    300(a4),a1
		move.l     (a0),4(a1)
edar_arr_3:
		moveq.l    #-1,d1
		moveq.l    #9,d0
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
edar_arr_2:
		movea.l    a2,a0
		jsr        Aob_delete
edar_arr_1:
		addq.w     #8,a7
		movem.l    (a7)+,d3/a2-a4
		rts

edar_col:
		move.w     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		addq.w     #4,a2
		moveq.l    #17,d0
		move.w     d0,-(a7)
		moveq.l    #18,d2
		moveq.l    #15,d1
		moveq.l    #15,d0
		and.w      2(a2),d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      edar_col_1
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
edar_col_1:
		movea.l    (a7)+,a2
		move.w     (a7)+,d3
		rts

edar_ends:
		movem.l    d3/a2-a3,-(a7)
		subq.w     #8,a7
		lea.l      POP_END,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edar_ends_1
		lea.l      ACSblk,a3
		moveq.l    #32,d0
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
		movea.l    a1,a0
		movea.l    a2,a1
		move.w     (a7),d0
		move.w     2(a7),d1
		jsr        Ame_popup
		move.w     d0,d3
		tst.w      d0
		ble        edar_ends_2
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		addq.w     #4,a0
		subq.w     #1,d0
		beq.s      edar_ends_3
		subq.w     #1,d0
		beq.s      edar_ends_4
		subq.w     #1,d0
		beq.s      edar_ends_5
		subq.w     #1,d0
		beq.s      edar_ends_6
		bra.s      edar_ends_7
edar_ends_3:
		move.l     (a0),d0
		and.l      #0xFFCFFFFF,d0
		move.l     d0,(a0)
		bra.s      edar_ends_7
edar_ends_4:
		move.l     (a0),d0
		and.l      #0xFF3FFFFF,d0
		move.l     d0,(a0)
		bra.s      edar_ends_7
edar_ends_5:
		move.l     (a0),d0
		and.l      #0xFFCFFFFF,d0
		or.l       #0x00100000,d0
		move.l     d0,(a0)
		bra.s      edar_ends_7
edar_ends_6:
		move.l     (a0),d0
		and.l      #0xFF3FFFFF,d0
		or.l       #0x00400000,d0
		move.l     d0,(a0)
edar_ends_7:
		move.w     d3,d0
		subq.w     #1,d0
		beq.s      edar_ends_8
		subq.w     #1,d0
		beq.s      edar_ends_9
		subq.w     #1,d0
		beq.s      edar_ends_8
		subq.w     #1,d0
		beq.s      edar_ends_9
		bra.s      edar_ends_10
edar_ends_8:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    12(a2,d0.l),a0
		movea.l    (a3),a1
		movea.l    604(a1),a1
		movea.l    828(a1),a1
		move.l     4(a0),4(a1)
		bra.s      edar_ends_10
edar_ends_9:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    12(a2,d0.l),a0
		movea.l    (a3),a1
		movea.l    604(a1),a1
		movea.l    852(a1),a1
		move.l     4(a0),4(a1)
edar_ends_10:
		moveq.l    #-1,d1
		moveq.l    #32,d0
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
edar_ends_2:
		movea.l    a2,a0
		jsr        Aob_delete
edar_ends_1:
		addq.w     #8,a7
		movem.l    (a7)+,d3/a2-a3
		rts

edar_fat:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		eori.l     #0x00080000,4(a0)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		rts

edar_len:
		movem.l    d3/a2-a3,-(a7)
		subq.w     #8,a7
		lea.l      POP_LEN,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edar_len_1
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
		movea.l    a1,a0
		movea.l    a2,a1
		move.w     (a7),d0
		move.w     2(a7),d1
		jsr        Ame_popup
		move.w     d0,d3
		tst.w      d0
		ble        edar_len_2
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		addq.w     #4,a0
		subq.w     #1,d0
		beq.s      edar_len_3
		subq.w     #1,d0
		beq.s      edar_len_4
		subq.w     #1,d0
		beq.s      edar_len_5
		subq.w     #1,d0
		beq.s      edar_len_6
		bra.s      edar_len_7
edar_len_3:
		andi.l     #0xFBFFFFFF,(a0)
		bra.s      edar_len_7
edar_len_4:
		andi.l     #0xBFFFFFFF,(a0)
		bra.s      edar_len_7
edar_len_5:
		ori.l      #0x04000000,(a0)
		bra.s      edar_len_7
edar_len_6:
		ori.l      #0x40000000,(a0)
edar_len_7:
		move.w     d3,d0
		subq.w     #1,d0
		beq.s      edar_len_8
		subq.w     #1,d0
		beq.s      edar_len_9
		subq.w     #1,d0
		beq.s      edar_len_8
		subq.w     #1,d0
		beq.s      edar_len_9
		bra.s      edar_len_10
edar_len_8:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    12(a2,d0.l),a0
		movea.l    (a3),a1
		movea.l    604(a1),a1
		movea.l    564(a1),a1
		move.l     4(a0),4(a1)
		bra.s      edar_len_10
edar_len_9:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    12(a2,d0.l),a0
		movea.l    (a3),a1
		movea.l    604(a1),a1
		movea.l    588(a1),a1
		move.l     4(a0),4(a1)
edar_len_10:
		moveq.l    #-1,d1
		moveq.l    #21,d0
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
edar_len_2:
		movea.l    a2,a0
		jsr        Aob_delete
edar_len_1:
		addq.w     #8,a7
		movem.l    (a7)+,d3/a2-a3
		rts

edar_stil:
		movem.l    d3/a2-a3,-(a7)
		subq.w     #8,a7
		lea.l      POP_STYLESEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edar_stil_1
		lea.l      ACSblk,a3
		moveq.l    #27,d0
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
		movea.l    a1,a0
		movea.l    a2,a1
		move.w     (a7),d0
		move.w     2(a7),d1
		jsr        Ame_popup
		tst.w      d0
		ble.s      edar_stil_2
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		addq.w     #4,a0
		move.l     (a0),d1
		and.l      #0xFFF8FFFF,d1
		move.w     d0,d2
		ext.l      d2
		moveq.l    #16,d3
		lsl.l      d3,d2
		or.l       d2,d1
		move.l     d1,(a0)
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    708(a1),a0
		addq.w     #4,a0
		move.l     (a0),d1
		and.l      #0xFFF8FFFF,d1
		or.l       d2,d1
		move.l     d1,(a0)
		moveq.l    #27,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		moveq.l    #-1,d1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
edar_stil_2:
		movea.l    a2,a0
		jsr        Aob_delete
edar_stil_1:
		addq.w     #8,a7
		movem.l    (a7)+,d3/a2-a3
		rts

	.globl init_arrow
init_arrow:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		lea.l      data,a1
		move.w     #0x2329,d0
		movea.l    4(a2),a3
		jsr        (a3)
		lea.l      disdata,a1
		move.w     #0x2329,d0
		movea.l    a2,a0
		movea.l    4(a2),a3
		jsr        (a3)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

minsize:
		movea.l    ACSblk,a0
		move.w     18(a0),d0
		add.w      d0,d0
		move.w     d0,(a1)
		movea.l    ACSblk,a0
		movea.l    4(a7),a1
		move.w     20(a0),(a1)
		rts

object_tree:
		movem.l    a2-a3/a5,-(a7)
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    a1,a3
		lea.l      ED_ARROW,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      object_tree_1
		suba.l     a0,a0
		bra        object_tree_2
object_tree_1:
		lea.l      48(a2),a0
		moveq.l    #22,d0
		and.w      8(a3),d0
		or.w       d0,8(a0)
		moveq.l    #63,d0
		and.w      10(a3),d0
		or.w       d0,10(a0)
		movea.l    12(a0),a3
		moveq.l    #43,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #44,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		pea.l      (a7)
		lea.l      xc03dc,a1
		movea.l    8(a7),a0
		movea.l    (a0),a0
		jsr        sscanf
		addq.w     #4,a7
		move.l     (a7),4(a3)
		movea.l    36(a2),a5
		addq.w     #4,a5
		andi.l     #0xFFFFFFF0,(a5)
		moveq.l    #15,d0
		and.w      2(a7),d0
		bne.s      object_tree_3
		ori.l      #0x00000001,(a5)
		bra.s      object_tree_4
object_tree_3:
		ori.l      #0x00000000,(a5)
object_tree_4:
		moveq.l    #15,d0
		and.w      2(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      colour_text,a0
		movea.l    0(a0,d0.l),a1
		movea.l    a2,a0
		moveq.l    #18,d0
		jsr        Aob_puttext
		moveq.l    #15,d0
		and.w      2(a7),d0
		andi.w     #0xFFF0,422(a2)
		and.w      #0x000F,d0
		or.w       d0,422(a2)
		movea.l    276(a2),a5
		addq.w     #4,a5
		move.l     (a7),d0
		moveq.l    #24,d1
		asr.l      d1,d0
		and.w      #0x0007,d0
		cmp.w      #0x0007,d0
		bhi.s      object_tree_5
		add.w      d0,d0
		move.w     J11(pc,d0.w),d0
		jmp        J11(pc,d0.w)
J11:
		dc.w object_tree_6-J11
		dc.w object_tree_7-J11
		dc.w object_tree_8-J11
		dc.w object_tree_9-J11
		dc.w object_tree_6-J11
		dc.w object_tree_7-J11
		dc.w object_tree_8-J11
		dc.w object_tree_9-J11
object_tree_6:
		move.l     #0x00110001,(a5)
		bra.s      object_tree_5
object_tree_7:
		move.l     #0x11110001,(a5)
		bra.s      object_tree_5
object_tree_8:
		move.l     #0x22110001,(a5)
		bra.s      object_tree_5
object_tree_9:
		move.l     #0x33110001,(a5)
object_tree_5:
		movea.l    300(a2),a5
		addq.w     #4,a5
		move.l     (a7),d0
		moveq.l    #28,d1
		asr.l      d1,d0
		and.w      #0x0007,d0
		cmp.w      #0x0007,d0
		bhi.s      object_tree_10
		add.w      d0,d0
		move.w     J12(pc,d0.w),d0
		jmp        J12(pc,d0.w)
J12:
		dc.w object_tree_11-J12
		dc.w object_tree_12-J12
		dc.w object_tree_13-J12
		dc.w object_tree_14-J12
		dc.w object_tree_11-J12
		dc.w object_tree_12-J12
		dc.w object_tree_13-J12
		dc.w object_tree_14-J12
object_tree_11:
		move.l     #0x00410001,(a5)
		bra.s      object_tree_10
object_tree_12:
		move.l     #0x11410001,(a5)
		bra.s      object_tree_10
object_tree_13:
		move.l     #0x22410001,(a5)
		bra.s      object_tree_10
object_tree_14:
		move.l     #0x33410001,(a5)
object_tree_10:
		movea.l    828(a2),a5
		addq.w     #4,a5
		move.l     (a5),d0
		and.l      #0xFFCFFFFF,d0
		move.l     (a7),d1
		and.l      #0x00300000,d1
		or.l       d1,d0
		move.l     d0,(a5)
		movea.l    852(a2),a5
		addq.w     #4,a5
		move.l     (a5),d0
		and.l      #0xFF3FFFFF,d0
		move.l     (a7),d1
		and.l      #0x00C00000,d1
		or.l       d1,d0
		move.l     d0,(a5)
		move.l     (a7),d1
		and.l      #0x00080000,d1
		beq.s      object_tree_15
		ori.w      #0x0001,874(a2)
		bra.s      object_tree_16
object_tree_15:
		andi.w     #0xFFFE,874(a2)
object_tree_16:
		move.l     (a7),d0
		and.l      #0x80000000,d0
		beq.s      object_tree_17
		ori.w      #0x0001,922(a2)
		bra.s      object_tree_18
object_tree_17:
		andi.w     #0xFFFE,922(a2)
object_tree_18:
		movea.l    564(a2),a5
		addq.w     #4,a5
		move.l     (a5),d0
		and.l      #0xFBFFFFFF,d0
		move.l     (a7),d1
		and.l      #0x04000000,d1
		or.l       d1,d0
		move.l     d0,(a5)
		movea.l    588(a2),a5
		addq.w     #4,a5
		move.l     (a5),d0
		and.l      #0xBFFFFFFF,d0
		move.l     (a7),d1
		and.l      #0x40000000,d1
		or.l       d1,d0
		move.l     d0,(a5)
		movea.l    708(a2),a5
		addq.w     #4,a5
		move.l     (a5),d0
		and.l      #0xFFF8FFFF,d0
		move.l     (a7),d1
		and.l      #0x00070000,d1
		or.l       d1,d0
		move.l     d0,(a5)
		movea.l    1044(a2),a0
		move.l     12(a0),24(a3)
		movea.l    4(a7),a0
		movea.l    38(a0),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_19
		lea.l      xc03cf,a1
		moveq.l    #43,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_20
object_tree_19:
		movea.l    4(a7),a0
		movea.l    38(a0),a1
		moveq.l    #43,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_20:
		movea.l    1068(a2),a0
		move.l     12(a0),28(a3)
		movea.l    4(a7),a0
		movea.l    42(a0),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_21
		lea.l      xc03cf,a1
		moveq.l    #44,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_22
object_tree_21:
		movea.l    4(a7),a0
		movea.l    42(a0),a1
		moveq.l    #44,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_22:
		movea.l    a2,a0
object_tree_2:
		addq.w     #8,a7
		movem.l    (a7)+,a2-a3/a5
		rts

test_it:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     #A_arrows,(a1)
		pea.l      4(a2)
		lea.l      xc03dc,a1
		movea.l    (a0),a0
		jsr        sscanf
		addq.w     #4,a7
		moveq.l    #0,d0
		move.l     d0,20(a2)
		move.l     d0,16(a2)
		move.l     d0,12(a2)
		move.l     d0,8(a2)
		movea.l    38(a3),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      test_it_1
		suba.l     a0,a0
		bra.s      test_it_2
test_it_1:
		movea.l    38(a3),a0
test_it_2:
		move.l     a0,24(a2)
		movea.l    42(a3),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      test_it_3
		suba.l     a0,a0
		bra.s      test_it_4
test_it_3:
		movea.l    42(a3),a0
test_it_4:
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
		movem.l    a2-a4,-(a7)
		lea.l      -46(a7),a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    20(a1),a2
		movea.l    60(a2),a4
		lea.l      parm,a3
		move.l     4(a4),-(a7)
		lea.l      xc03dc,a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #4,a7
		move.l     a3,(a7)
		move.l     #xc03cf,4(a7)
		clr.w      d0
		move.w     d0,28(a7)
		move.w     d0,18(a7)
		move.w     d0,8(a7)
		moveq.l    #0,d1
		move.l     d1,30(a7)
		move.l     d1,20(a7)
		move.l     d1,10(a7)
		moveq.l    #0,d0
		move.l     d0,34(a7)
		move.l     d0,24(a7)
		move.l     d0,14(a7)
		lea.l      38(a7),a1
		lea.l      1032(a2),a0
		moveq.l    #3,d0
		jsr        Auo_boxed
		movea.l    38(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_1
		clr.l      38(a7)
ok_1:
		lea.l      42(a7),a1
		moveq.l    #3,d0
		lea.l      1056(a2),a0
		jsr        Auo_boxed
		movea.l    42(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_2
		clr.l      42(a7)
ok_2:
		movea.l    ACSblk,a0
		move.w     20(a0),d1
		move.w     18(a0),d0
		add.w      d0,d0
		lea.l      (a7),a0
		movea.l    data+64,a1
		movea.l    4(a1),a1
		jsr        (a1)
		bsr        abort
		lea.l      46(a7),a7
		movem.l    (a7)+,a2-a4
		rts

	.data

BUBBLE_01:
		dc.b 'Hier wird angegeben, ob eine 3D-Darstellung verwendet werden soll.',0
BUBBLE_02:
		dc.b 'Hier wird angegeben, ob die Linie breit sein soll oder normal.',0
BUBBLE_03:
		dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_05:
		dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
TEXT_005:
		dc.w $4f4b
		dc.b $00
TEXT_009:
		dc.b 'Abbruch',0
TEXT_05:
		dc.b 'Sonstiges',0
TEXT_06:
		dc.b '3D-Modus',0
TEXT_07:
		dc.b 'Richtung:',0
TEXT_08:
		dc.b 'breit',0
TEXT_09:
		dc.b 'LÑngen:',0
TEXT_10:
		dc.b 'Enden:',0
TEXT_11:
		dc.b 'Farbe:',0
TEXT_12:
		dc.b 'Stil:',0
TEXT_13:
		dc.b 'BubbleGEM-Text',0
TEXT_14:
		dc.b 'Context-Popup',0
help_title:
		dc.b 'Der Arrows-Editor',0
title:
		dc.b 'PFEILE -',0
ARROW001:
		dc.l A_arrows
		dc.w $2251
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
ARROW002:
		dc.l A_arrows
		dc.w $2211
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
ARROW003:
		dc.l A_arrows
		dc.w $2201
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
ARROW004:
		dc.l A_arrows
		dc.w $2601
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
ARROW005:
		dc.l A_arrows
		dc.w $2241
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
ARROW006:
		dc.l A_arrows
		dc.w $6201
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
ARROW007:
		dc.l A_arrows
		dc.w $6601
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
ARROW008:
		dc.l A_arrows
		dc.w $0011
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
ARROW009:
		dc.l A_arrows
		dc.w $1111
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
ARROW010:
		dc.l A_arrows
		dc.w $3311
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
ARROW011:
		dc.l A_arrows
		dc.w $0041
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
ARROW012:
		dc.l A_arrows
		dc.w $1141
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
ARROW013:
		dc.l A_arrows
		dc.w $3341
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
A_3DBUTTON02:
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
A_3DBUTTON03:
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
A_3DBUTTON05:
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
A_3DBUTTON06:
		dc.l A_3Dbutton
		dc.w $21f1
		dc.w $01f8
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
A_ARROWS01:
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
A_ARROWS02:
		dc.l A_arrows
		dc.w $6602
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
A_ARROWS03:
		dc.l A_arrows
		dc.w $6603
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
A_ARROWS04:
		dc.l A_arrows
		dc.w $6604
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
A_ARROWS05:
		dc.l A_arrows
		dc.w $6605
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
A_ARROWS06:
		dc.l A_arrows
		dc.w $6606
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
A_ARROWS07:
		dc.l A_arrows
		dc.w $6607
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
A_ARROWS08:
		dc.l A_arrows
		dc.w $2611
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
A_ARROWS09:
		dc.l A_arrows
		dc.w $6241
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
		dc.l TEXT_06
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_01
		dc.w $0000
		dc.w $0000
A_CHECKBOX03:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_08
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_02
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
POP_ARR:
		dc.w $ffff
		dc.w $0001
		dc.w $0008
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $00ff
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $0006
		dc.w $0004
_01_POP_ARR:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l ARROW008
		dc.w $0000
		dc.w $0000
		dc.w $0003
		dc.w $0001
_02_POP_ARR:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l ARROW011
		dc.w $0003
		dc.w $0000
		dc.w $0003
		dc.w $0001
_03_POP_ARR:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l ARROW009
		dc.w $0000
		dc.w $0001
		dc.w $0003
		dc.w $0001
_04_POP_ARR:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l ARROW012
		dc.w $0003
		dc.w $0001
		dc.w $0003
		dc.w $0001
_05_POP_ARR:
		dc.w $0006
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l ARROW002
		dc.w $0000
		dc.w $0002
		dc.w $0003
		dc.w $0001
_06_POP_ARR:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l ARROW005
		dc.w $0003
		dc.w $0002
		dc.w $0003
		dc.w $0001
_07_POP_ARR:
		dc.w $0008
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l ARROW010
		dc.w $0000
		dc.w $0003
		dc.w $0003
		dc.w $0001
_08_POP_ARR:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0021
		dc.w $0000
		dc.l ARROW013
		dc.w $0003
		dc.w $0003
		dc.w $0003
		dc.w $0001
POP_END:
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
		dc.w $0006
		dc.w $0002
_01_POP_END:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l ARROW004
		dc.w $0000
		dc.w $0000
		dc.w $0003
		dc.w $0001
_02_POP_END:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l ARROW006
		dc.w $0003
		dc.w $0000
		dc.w $0003
		dc.w $0001
_03_POP_END:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_ARROWS08
		dc.w $0000
		dc.w $0001
		dc.w $0003
		dc.w $0001
_04_POP_END:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0021
		dc.w $0000
		dc.l A_ARROWS09
		dc.w $0003
		dc.w $0001
		dc.w $0003
		dc.w $0001
POP_LEN:
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
		dc.w $0006
		dc.w $0002
_01_POP_LEN:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l ARROW003
		dc.w $0000
		dc.w $0000
		dc.w $0003
		dc.w $0001
_02_POP_LEN:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l ARROW003
		dc.w $0003
		dc.w $0000
		dc.w $0003
		dc.w $0001
_03_POP_LEN:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l ARROW004
		dc.w $0000
		dc.w $0001
		dc.w $0003
		dc.w $0001
_04_POP_LEN:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0021
		dc.w $0000
		dc.l ARROW006
		dc.w $0003
		dc.w $0001
		dc.w $0003
		dc.w $0001
POP_STYLESEL:
		dc.w $ffff
		dc.w $0001
		dc.w $0007
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $00ff
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $0006
		dc.w $0007
_01_POP_STYLESEL:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l ARROW007
		dc.w $0000
		dc.w $0000
		dc.w $0006
		dc.w $0001
_02_POP_STYLESEL:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0000
		dc.w $0001
		dc.w $0006
		dc.w $0001
_03_POP_STYLESEL:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_ARROWS03
		dc.w $0000
		dc.w $0002
		dc.w $0006
		dc.w $0001
_04_POP_STYLESEL:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_ARROWS04
		dc.w $0000
		dc.w $0003
		dc.w $0006
		dc.w $0001
_05_POP_STYLESEL:
		dc.w $0006
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_ARROWS05
		dc.w $0000
		dc.w $0004
		dc.w $0006
		dc.w $0001
_06_POP_STYLESEL:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_ARROWS06
		dc.w $0000
		dc.w $0005
		dc.w $0006
		dc.w $0001
_07_POP_STYLESEL:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0021
		dc.w $0000
		dc.l A_ARROWS07
		dc.w $0000
		dc.w $0006
		dc.w $0006
		dc.w $0001
	.globl ED_ARROW
ED_ARROW:
		dc.w $ffff
		dc.w $0001
		dc.w $0028
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON06
		dc.w $0000
		dc.w $0000
		dc.w $002e
		dc.w $0010
_01_ED_ARROW:
		dc.w $0003
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON02
		dc.w $0000
		dc.w $0000
		dc.w $000c
		dc.w $0004
_02_ED_ARROW:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l ARROW001
		dc.w $0002
		dc.w $0001
		dc.w $0008
		dc.w $0002
_03_ED_ARROW:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON03
		dc.w $0013
		dc.w $0001
		dc.w $000c
		dc.w $0002
_03aED_ARROW:
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
_05_ED_ARROW:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON05
		dc.w $0021
		dc.w $0001
		dc.w $000c
		dc.w $0002
_05aED_ARROW:
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
_07_ED_ARROW:
		dc.w $0009
		dc.w $0008
		dc.w $0008
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_07
		dc.w $0001
		dc.w $0005
		dc.w $000a
		dc.w $0001
_08_ED_ARROW:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS01
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_09_ED_ARROW:
		dc.w $000d
		dc.w $000b
		dc.w $000c
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $000b
		dc.w $0005
		dc.w $0006
		dc.w $0001
_09aED_ARROW:
		dc.l edar_arr
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
_11_ED_ARROW:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l ARROW008
		dc.w $0000
		dc.w $0000
		dc.w $0003
		dc.w $0001
_12_ED_ARROW:
		dc.w $0009
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l ARROW011
		dc.w $0003
		dc.w $0000
		dc.w $0003
		dc.w $0001
_13_ED_ARROW:
		dc.w $000f
		dc.w $000e
		dc.w $000e
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_11
		dc.w $0013
		dc.w $0005
		dc.w $0006
		dc.w $0001
_14_ED_ARROW:
		dc.w $000d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS01
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_15_ED_ARROW:
		dc.w $0013
		dc.w $0011
		dc.w $0012
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $001a
		dc.w $0005
		dc.w $0012
		dc.w $0001
_15aED_ARROW:
		dc.l edar_col
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
_17_ED_ARROW:
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
_18_ED_ARROW:
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
_19_ED_ARROW:
		dc.w $0015
		dc.w $0014
		dc.w $0014
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_09
		dc.w $0003
		dc.w $0007
		dc.w $0007
		dc.w $0001
_20_ED_ARROW:
		dc.w $0013
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS01
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_21_ED_ARROW:
		dc.w $0019
		dc.w $0017
		dc.w $0018
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $000b
		dc.w $0007
		dc.w $0006
		dc.w $0001
_21aED_ARROW:
		dc.l edar_len
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
_23_ED_ARROW:
		dc.w $0018
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l ARROW003
		dc.w $0000
		dc.w $0000
		dc.w $0003
		dc.w $0001
_24_ED_ARROW:
		dc.w $0015
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l ARROW003
		dc.w $0003
		dc.w $0000
		dc.w $0003
		dc.w $0001
_25_ED_ARROW:
		dc.w $001b
		dc.w $001a
		dc.w $001a
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_12
		dc.w $0014
		dc.w $0007
		dc.w $0006
		dc.w $0001
_26_ED_ARROW:
		dc.w $0019
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS01
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_27_ED_ARROW:
		dc.w $001e
		dc.w $001d
		dc.w $001d
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $001a
		dc.w $0007
		dc.w $0006
		dc.w $0001
_27aED_ARROW:
		dc.l edar_stil
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8853
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_29_ED_ARROW:
		dc.w $001b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l ARROW007
		dc.w $0000
		dc.w $0000
		dc.w $0006
		dc.w $0001
_30_ED_ARROW:
		dc.w $0020
		dc.w $001f
		dc.w $001f
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_10
		dc.w $0004
		dc.w $0009
		dc.w $0006
		dc.w $0001
_31_ED_ARROW:
		dc.w $001e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS01
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_32_ED_ARROW:
		dc.w $0024
		dc.w $0022
		dc.w $0023
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $000b
		dc.w $0009
		dc.w $0006
		dc.w $0001
_32aED_ARROW:
		dc.l edar_ends
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
_34_ED_ARROW:
		dc.w $0023
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l ARROW003
		dc.w $0000
		dc.w $0000
		dc.w $0003
		dc.w $0001
_35_ED_ARROW:
		dc.w $0020
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l ARROW003
		dc.w $0003
		dc.w $0000
		dc.w $0003
		dc.w $0001
_36_ED_ARROW:
		dc.w $0026
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0001
		dc.l A_CHECKBOX03
		dc.w $0017
		dc.w $0009
		dc.w $0008
		dc.w $0001
_36aED_ARROW:
		dc.l edar_fat
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
_38_ED_ARROW:
		dc.w $0028
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0001
		dc.l A_CHECKBOX02
		dc.w $0021
		dc.w $0009
		dc.w $000b
		dc.w $0001
_38aED_ARROW:
		dc.l edar_3d
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
_40_ED_ARROW:
		dc.w $0000
		dc.w $0029
		dc.w $002c
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME03
		dc.w $0001
		dc.w $000b
		dc.w $002c
		dc.w $0005
_41_ED_ARROW:
		dc.w $002a
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_13
		dc.w $0001
		dc.w $0001
		dc.w $000e
		dc.w $0001
_42_ED_ARROW:
		dc.w $002b
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_14
		dc.w $0001
		dc.w $0003
		dc.w $000d
		dc.w $0001
_43_ED_ARROW:
		dc.w $002c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED03
		dc.w $0010
		dc.w $0001
		dc.w $001b
		dc.w $0001
_44_ED_ARROW:
		dc.w $0028
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0028
		dc.w $0010
		dc.l A_BOXED04
		dc.w $0010
		dc.w $0003
		dc.w $001b
		dc.w $0001
arrow:
		dc.l A_arrows
		dc.w $2251
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
disline:
		dc.l A_arrows
		dc.w $2209
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
visual:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $2001
		dc.w $0000
		dc.l arrow
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0001
logical:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l arrow
		dc.w $0000
		dc.w $0000
		dc.w $0004
		dc.w $0001
disvisual:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $2001
		dc.w $0000
		dc.l disline
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0001
dislogical:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0108
		dc.l disline
		dc.w $0000
		dc.w $0000
		dc.w $0004
		dc.w $0001
aud:
		dc.l xc03c4
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
disaud:
		dc.l xc03d0
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
data:
		dc.b 'A_arrows',0
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
disdata:
		dc.b 'A_arrows',0
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
		dc.w $0000
		dc.l object_tree
		dc.l test_it
		dc.l ok
		dc.l Aob_delete
		dc.l disvisual
		dc.l dislogical
		dc.l disaud
		dc.l minsize
		dc.w $0000
		dc.w $0000
		dc.l title
		dc.l help_title
		dc.w $0000
		dc.w $0000
xc03c4:
		dc.b '0x22510001L'
xc03cf: dc.b 0
xc03d0:
		dc.b '0x22090001L',0
xc03dc:
		dc.b '0x%lxL',0
		.even

	.bss

parm: ds.b 32
