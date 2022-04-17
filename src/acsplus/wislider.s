		.text

	.globl A_wislider
A_wislider:
		moveq.l    #-10,d0
		movea.l    4(a7),a0
		and.w      8(a0),d0
		rts

	.globl Auo_wislider
Auo_wislider:
		movem.l    d3-d5/a2-a4,-(a7)
		subq.w     #4,a7
		movea.l    a1,a4
		move.l     12(a0),(a7)
		movea.l    (a7),a0
		movea.l    12(a0),a3
		move.w     d0,d1
		cmp.w      #0x000F,d1
		beq        Auo_wislider_1
		bgt.s      Auo_wislider_2
		cmp.w      #0x000E,d1
		bhi        Auo_wislider_3
		add.w      d1,d1
		move.w     J25(pc,d1.w),d1
		jmp        J25(pc,d1.w)
J25:
		dc.w Auo_wislider_3-J25
		dc.w Auo_wislider_4-J25
		dc.w Auo_wislider_5-J25
		dc.w Auo_wislider_3-J25
		dc.w Auo_wislider_3-J25
		dc.w Auo_wislider_6-J25
		dc.w Auo_wislider_6-J25
		dc.w Auo_wislider_3-J25
		dc.w Auo_wislider_3-J25
		dc.w Auo_wislider_7-J25
		dc.w Auo_wislider_8-J25
		dc.w Auo_wislider_9-J25
		dc.w Auo_wislider_10-J25
		dc.w Auo_wislider_11-J25
		dc.w Auo_wislider_12-J25
Auo_wislider_2:
		cmp.w      #0x0066,d1
		beq        Auo_wislider_99
		bgt.s      Auo_wislider_98
		cmp.w      #0x0014,d1
		beq        Auo_wislider_19
		bgt.s      Auo_wislider_20
		sub.w      #0x0011,d1
		beq        Auo_wislider_21
		subq.w     #2,d1
		beq        Auo_wislider_19
		bra        Auo_wislider_3
Auo_wislider_20:
		sub.w      #0x0064,d1
		beq        Auo_wislider_22
		subq.w     #1,d1
		beq        Auo_wislider_23
		bra        Auo_wislider_3
Auo_wislider_98:
		sub.w      #0x0067,d1
		beq        Auo_wislider_24
		subq.w     #2,d1
		beq.s      Auo_wislider_25
		subq.w     #1,d1
		beq.s      Auo_wislider_26
Auo_wislider_14:
		subq.w     #1,d1
		beq        Auo_wislider_27
		bra        Auo_wislider_3
Auo_wislider_25:
		move.l     20(a3),d0
		beq        Auo_wislider_19
		move.l     8(a3),d0
		movea.l    24(a3),a0
		movea.l    20(a3),a1
		jsr        (a1)
		bra        Auo_wislider_19
Auo_wislider_4:
		moveq.l    #28,d0
		jsr        Ax_malloc
		movea.l    a0,a3
		move.l     a3,d0
		beq.s      Auo_wislider_28
		lea.l      proto,a1
		moveq.l    #28,d0
		jsr        memcpy
		movea.l    (a7),a0
		move.l     a3,12(a0)
		bra        Auo_wislider_19
Auo_wislider_28:
		move.w     #0xFFFF,(a4)
		bra        Auo_wislider_19
Auo_wislider_5:
		movea.l    a3,a0
		jsr        Ax_free
		bra        Auo_wislider_19
Auo_wislider_7:
		movea.l    a4,a0
		move.l     (a0),16(a3)
		bra        Auo_wislider_19
Auo_wislider_26:
		move.w     (a4),d3
		move.l     (a3),d4
		sub.l      4(a3),d4
		tst.l      d4
		ble        Auo_wislider_12
		move.w     d3,d0
		ext.l      d0
		move.l     d4,d1
		jsr        _lmul
		move.l     #0x000003E8,d1
		jsr        _ldiv
		move.l     d0,8(a3)
		bra        Auo_wislider_19
Auo_wislider_6:
		move.l     8(a3),d0
		bpl.s      Auo_wislider_29
		clr.l      8(a3)
Auo_wislider_29:
		move.l     (a3),d0
		sub.l      4(a3),d0
		cmp.l      8(a3),d0
		bge.s      Auo_wislider_30
		move.l     d0,8(a3)
Auo_wislider_30:
		movea.l    16(a3),a2
		move.w     32(a2),d5
		moveq.l    #1,d0
		movea.l    (a7),a0
		and.l      4(a0),d0
		beq        Auo_wislider_31
		move.l     (a3),d4
		sub.l      4(a3),d4
		tst.l      d4
		ble.s      Auo_wislider_32
		move.l     8(a3),d1
		move.l     d1,d0
		lsl.l      #5,d0
		sub.l      d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #3,d0
		move.l     d4,d1
		jsr        _ldiv
		move.l     d0,d3
		bra.s      Auo_wislider_33
Auo_wislider_32:
		clr.w      d3
Auo_wislider_33:
		cmp.w      62(a2),d3
		beq.s      Auo_wislider_34
		move.w     d3,62(a2)
		tst.w      d5
		ble.s      Auo_wislider_34
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		move.w     d3,-(a7)
		moveq.l    #9,d1
		move.w     d5,d0
		jsr        wind_set
		addq.w     #8,a7
Auo_wislider_34:
		move.l     4(a3),d1
		move.l     d1,d0
		lsl.l      #5,d0
		sub.l      d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #3,d0
		move.l     (a3),d1
		jsr        _ldiv
		move.l     d0,d3
		cmp.w      66(a2),d3
		beq        Auo_wislider_19
		move.w     d3,66(a2)
		tst.w      d5
		ble        Auo_wislider_19
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		move.w     d3,-(a7)
		moveq.l    #16,d1
		move.w     d5,d0
		jsr        wind_set
		addq.w     #8,a7
		bra        Auo_wislider_19
Auo_wislider_31:
		move.l     4(a3),d1
		move.l     d1,d0
		lsl.l      #5,d0
		sub.l      d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #3,d0
		move.l     (a3),d1
		jsr        _ldiv
		move.l     d0,d3
		cmp.w      64(a2),d3
		beq.s      Auo_wislider_35
		move.w     d3,64(a2)
		tst.w      d5
		ble.s      Auo_wislider_35
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		move.w     d3,-(a7)
		moveq.l    #15,d1
		move.w     d5,d0
		jsr        wind_set
		addq.w     #8,a7
Auo_wislider_35:
		move.l     (a3),d4
		sub.l      4(a3),d4
		tst.l      d4
		ble.s      Auo_wislider_36
		move.l     8(a3),d1
		move.l     d1,d0
		lsl.l      #5,d0
		sub.l      d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #3,d0
		move.l     d4,d1
		jsr        _ldiv
		move.l     d0,d3
		bra.s      Auo_wislider_37
Auo_wislider_36:
		clr.w      d3
Auo_wislider_37:
		cmp.w      60(a2),d3
		beq        Auo_wislider_19
		move.w     d3,60(a2)
		tst.w      d5
		ble        Auo_wislider_19
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		move.w     d3,-(a7)
		moveq.l    #8,d1
Auo_wislider_16:
		move.w     d5,d0
		jsr        wind_set
		addq.w     #8,a7
		bra.w      Auo_wislider_19
Auo_wislider_24:
		move.l     (a4),20(a3)
		move.l     4(a4),24(a3)
		bra.s      Auo_wislider_19
Auo_wislider_22:
		move.l     (a4),(a3)
		bra.s      Auo_wislider_19
Auo_wislider_23:
		move.l     (a4),4(a3)
		bra.s      Auo_wislider_19
Auo_wislider_99:
		move.l     (a4),12(a3)
		bra.s      Auo_wislider_19
Auo_wislider_27:
		move.l     8(a3),(a4)
		bra.s      Auo_wislider_19
Auo_wislider_21:
		move.l     (a4),8(a3)
		bra.s      Auo_wislider_19
Auo_wislider_8:
		move.l     12(a3),d0
		add.l      d0,8(a3)
		bra.s      Auo_wislider_19
Auo_wislider_9:
		move.l     12(a3),d0
		sub.l      d0,8(a3)
		bra.s      Auo_wislider_19
Auo_wislider_10:
		move.l     4(a3),d0
		add.l      d0,8(a3)
		bra.s      Auo_wislider_19
Auo_wislider_11:
		move.l     4(a3),d0
		sub.l      d0,8(a3)
		bra.s      Auo_wislider_19
Auo_wislider_12:
		clr.l      8(a3)
		bra.s      Auo_wislider_19
Auo_wislider_1:
		move.l     (a3),d0
		sub.l      4(a3),d0
		move.l     d0,8(a3)
		bra.s      Auo_wislider_19
Auo_wislider_3:
		clr.w      d0
		bra.s      Auo_wislider_38
Auo_wislider_19:
		moveq.l    #1,d0
Auo_wislider_38:
		addq.w     #4,a7
		movem.l    (a7)+,d3-d5/a2-a4
		rts
Auo_wislider_15:
Auo_wislider_17:

	.data

proto:
		dc.w $0000
		dc.w $0064
		dc.w $0000
		dc.w $000a
		dc.w $0000
		dc.w $0014
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
