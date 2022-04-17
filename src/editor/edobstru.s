		.text

	.globl copy_ob
copy_ob:
		movem.l    a2-a6,-(a7)
		subq.w     #4,a7
		movea.l    a0,a3
		movea.l    a1,a5
		movea.l    28(a7),a4
		lea.l      xc91bc,a2
		ori.w      #$0001,6(a3)
		moveq.l    #56,d0
		movea.l    a1,a0
		movea.l    a4,a1
		jsr        memcpy
		move.w     copyindex,d0
		beq.s      copy_ob_1
		move.l     (a4),d1
		beq.s      copy_ob_1
		movea.l    a3,a0
		moveq.l    #0,d0
		jsr        objmalloc
		movea.l    a0,a6
		move.l     a0,(a5)
		move.l     a6,d0
		beq.s      copy_ob_2
		movea.l    (a4),a1
		lea.l      22(a1),a1
		lea.l      22(a6),a0
		jsr        strcpy
		pea.l      (a7)
		movea.l    a6,a1
		movea.l    a3,a0
		jsr        uniquename
		addq.w     #4,a7
		addq.w     #1,d0
		bne.s      copy_ob_3
		move.l     a2,-(a7)
		movea.l    a6,a1
		movea.l    a3,a0
		jsr        new2label
		addq.w     #4,a7
		tst.w      d0
		bne.s      copy_ob_3
		movea.l    a6,a1
		movea.l    a3,a0
		jsr        objfree
		bra.s      copy_ob_1
copy_ob_3:
		move.l     a2,-(a7)
		pea.l      22(a6)
		movea.l    a6,a1
		movea.l    a3,a0
		jsr        objname
		addq.w     #8,a7
		bra.s      copy_ob_2
copy_ob_1:
		clr.l      (a5)
copy_ob_2:
		move.l     4(a4),d0
		beq.s      copy_ob_4
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        add_ref
		move.l     a0,4(a5)
copy_ob_4:
		move.l     32(a4),d0
		beq.s      copy_ob_5
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        add_ref
		move.l     a0,32(a5)
copy_ob_5:
		move.l     36(a4),d0
		beq.s      copy_ob_6
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        add_ref
		move.l     a0,36(a5)
copy_ob_6:
		move.l     44(a4),d0
		beq.s      copy_ob_7
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        add_ref
		move.l     a0,44(a5)
copy_ob_7:
		move.l     48(a4),d0
		beq.s      copy_ob_8
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        add_ref
		move.l     a0,48(a5)
copy_ob_8:
		move.b     15(a4),d0
		ext.w      d0
		sub.w      #$0015,d0
		cmp.w      #$000C,d0
		bhi.w      copy_ob_9
		add.w      d0,d0
		move.w     J19(pc,d0.w),d0
		jmp        J19(pc,d0.w)
J19:
		dc.w copy_ob_10-J19
		dc.w copy_ob_10-J19
		dc.w copy_ob_11-J19
		dc.w copy_ob_12-J19
		dc.w copy_ob_9-J19
		dc.w copy_ob_13-J19
		dc.w copy_ob_9-J19
		dc.w copy_ob_13-J19
		dc.w copy_ob_10-J19
		dc.w copy_ob_10-J19
		dc.w copy_ob_14-J19
		dc.w copy_ob_13-J19
		dc.w copy_ob_14-J19
copy_ob_10:
		movea.l    20(a4),a1
		movea.l    a3,a0
		jsr        add_tedinfo
		move.l     a0,20(a5)
		bra.s      copy_ob_9
copy_ob_11:
		movea.l    20(a4),a1
		movea.l    a3,a0
		jsr        add_image
		move.l     a0,20(a5)
		bra.s      copy_ob_9
copy_ob_12:
		movea.l    20(a4),a1
		movea.l    a3,a0
		jsr        add_user
		move.l     a0,20(a5)
		bra.s      copy_ob_9
copy_ob_13:
		movea.l    20(a4),a1
		movea.l    a3,a0
		jsr        add_string
		move.l     a0,20(a5)
		bra.s      copy_ob_9
copy_ob_14:
		movea.l    20(a4),a1
		movea.l    a3,a0
		jsr        add_icon
		move.l     a0,20(a5)
copy_ob_9:
		addq.w     #4,a7
		movem.l    (a7)+,a2-a6
		rts

	.globl copysub_ob
copysub_ob:
		movem.l    d3-d7/a2-a6,-(a7)
		subq.w     #2,a7
		movea.l    a0,a6
		movea.l    a1,a2
		movea.l    46(a7),a4
		move.w     d0,(a7)
		movea.l    a1,a0
		moveq.l    #56,d0
		jsr        objextent
		tst.w      d0
		bne        copysub_ob_1
		move.l     14(a2),d0
		moveq.l    #56,d1
		jsr        _uldiv
		move.l     d0,d3
		addi.l     #$00000038,14(a2)
		movea.l    4(a2),a3
		movea.l    4(a4),a5
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		pea.l      0(a5,d0.l)
		move.w     d3,d0
		ext.l      d0
		move.l     d0,d2
		lsl.l      #3,d2
		sub.l      d0,d2
		lsl.l      #3,d2
		lea.l      0(a3,d2.l),a1
		movea.l    a6,a0
		bsr        copy_ob
		addq.w     #4,a7
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     10(a5,d0.l),d5
		tst.w      d5
		bmi        copysub_ob_2
		move.l     a4,-(a7)
		movea.l    a2,a1
		movea.l    a6,a0
		move.w     d5,d0
		bsr        copysub_ob
		addq.w     #4,a7
		move.w     d0,d6
		tst.w      d0
		bmi.s      copysub_ob_1
		move.w     d6,d7
		movea.l    4(a2),a3
		movea.l    4(a4),a5
		bra.s      copysub_ob_3
copysub_ob_6:
		move.w     d5,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     8(a5,d0.l),d5
		move.l     a4,-(a7)
		move.w     d5,d0
		movea.l    a2,a1
		movea.l    a6,a0
		bsr        copysub_ob
		addq.w     #4,a7
		move.w     d0,d4
		tst.w      d0
		bpl.s      copysub_ob_4
copysub_ob_1:
		moveq.l    #-1,d0
		bra.s      copysub_ob_5
copysub_ob_4:
		movea.l    4(a4),a5
		movea.l    4(a2),a3
		move.w     d7,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     d4,8(a3,d0.l)
		move.w     d4,d7
copysub_ob_3:
		move.w     d5,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     (a7),d2
		cmp.w      8(a5,d0.l),d2
		bne.s      copysub_ob_6
		move.w     d7,d5
		ext.l      d5
		move.l     d5,d4
		lsl.l      #3,d4
		sub.l      d5,d4
		lsl.l      #3,d4
		move.w     d3,8(a3,d4.l)
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     d6,10(a3,d0.l)
		move.w     d7,12(a3,d0.l)
		bra.s      copysub_ob_7
copysub_ob_2:
		moveq.l    #-1,d0
		move.w     d3,d2
		ext.l      d2
		move.l     d2,d1
		lsl.l      #3,d1
		sub.l      d2,d1
		lsl.l      #3,d1
		move.w     d0,12(a3,d1.l)
		move.w     d0,10(a3,d1.l)
copysub_ob_7:
		move.w     d3,d0
copysub_ob_5:
		addq.w     #2,a7
		movem.l    (a7)+,d3-d7/a2-a6
		rts

	.globl del_ob
del_ob:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		move.l     (a1),d0
		beq.s      del_ob_1
		movea.l    d0,a1
		jsr        objfree
del_ob_1:
		move.l     4(a3),d0
		beq.s      del_ob_2
		movea.l    d0,a1
		movea.l    a2,a0
		jsr        del_ref
del_ob_2:
		move.l     32(a3),d0
		beq.s      del_ob_3
		movea.l    d0,a1
		movea.l    a2,a0
		jsr        del_ref
del_ob_3:
		move.l     36(a3),d0
		beq.s      del_ob_4
		movea.l    d0,a1
		movea.l    a2,a0
		jsr        del_ref
del_ob_4:
		move.l     44(a3),d0
		beq.s      del_ob_5
		movea.l    d0,a1
		movea.l    a2,a0
		jsr        del_ref
del_ob_5:
		move.l     48(a3),d0
		beq.s      del_ob_6
		movea.l    d0,a1
		movea.l    a2,a0
		jsr        del_ref
del_ob_6:
		addq.w     #8,a3
		move.b     7(a3),d0
		ext.w      d0
		sub.w      #$0015,d0
		cmp.w      #$000C,d0
		bhi.s      del_ob_7
		add.w      d0,d0
		move.w     J20(pc,d0.w),d0
		jmp        J20(pc,d0.w)
J20:
		dc.w del_ob_8-J20
		dc.w del_ob_8-J20
		dc.w del_ob_9-J20
		dc.w del_ob_10-J20
		dc.w del_ob_7-J20
		dc.w del_ob_11-J20
		dc.w del_ob_7-J20
		dc.w del_ob_11-J20
		dc.w del_ob_8-J20
		dc.w del_ob_8-J20
		dc.w del_ob_12-J20
		dc.w del_ob_11-J20
		dc.w del_ob_12-J20
del_ob_8:
		movea.l    12(a3),a1
		movea.l    a2,a0
		jsr        del_tedinfo
		bra.s      del_ob_7
del_ob_9:
		movea.l    12(a3),a1
		movea.l    a2,a0
		jsr        del_image
		bra.s      del_ob_7
del_ob_10:
		movea.l    12(a3),a1
		movea.l    a2,a0
		jsr        del_user
		bra.s      del_ob_7
del_ob_11:
		movea.l    12(a3),a1
		movea.l    a2,a0
		jsr        del_string
		bra.s      del_ob_7
del_ob_12:
		movea.l    12(a3),a1
		movea.l    a2,a0
		jsr        del_icon
del_ob_7:
		move.w     #$FFFF,6(a3)
		ori.w      #$0001,6(a2)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl delsub_ob
delsub_ob:
		movem.l    d3-d4/a2-a4,-(a7)
		movea.l    a0,a4
		movea.l    a1,a2
		move.w     d0,d3
		movea.l    4(a2),a3
		ext.l      d0
		move.l     d0,d1
		lsl.l      #3,d1
		sub.l      d0,d1
		lsl.l      #3,d1
		move.w     10(a3,d1.l),d4
		tst.w      d4
		bmi.s      delsub_ob_1
delsub_ob_2:
		move.w     d4,d0
		movea.l    a2,a1
		movea.l    a4,a0
		bsr.w      delsub_ob
		move.w     d4,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     8(a3,d0.l),d4
		cmp.w      d4,d3
		bne.s      delsub_ob_2
delsub_ob_1:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		lea.l      0(a3,d0.l),a1
		movea.l    a4,a0
		bsr        del_ob
		move.w     d3,d0
		movea.l    a3,a0
		jsr        unlink_ob
		movem.l    (a7)+,d3-d4/a2-a4
		rts

	.globl free_ob
free_ob:
		movem.l    d3-d6/a2,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		tst.w      d0
		beq        free_ob_1
		move.w     d0,d6
		move.w     d6,d2
		ext.l      d2
		move.l     d2,d1
		lsl.l      #3,d1
		sub.l      d2,d1
		lsl.l      #3,d1
		move.w     8(a2,d1.l),d4
		move.w     d4,d5
		bra.s      free_ob_2
free_ob_3:
		move.w     d4,d6
		move.w     d6,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     8(a2,d0.l),d4
free_ob_2:
		move.w     d4,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		cmp.w      12(a2,d0.l),d6
		bne.s      free_ob_3
		move.w     10(a2,d0.l),d6
		cmp.w      d6,d3
		bne.s      free_ob_4
		cmp.w      d5,d4
		bne.s      free_ob_5
		moveq.l    #-1,d2
		move.w     d2,12(a2,d0.l)
		move.w     d2,10(a2,d0.l)
		bra.s      free_ob_1
free_ob_5:
		move.w     d4,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     d5,10(a2,d0.l)
		bra.s      free_ob_1
free_ob_6:
		move.w     d6,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     8(a2,d0.l),d6
free_ob_4:
		move.w     d6,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		cmp.w      8(a2,d0.l),d3
		bne.s      free_ob_6
		move.w     d5,8(a2,d0.l)
		move.w     d4,d5
		ext.l      d5
		move.l     d5,d2
		lsl.l      #3,d2
		sub.l      d5,d2
		lsl.l      #3,d2
		cmp.w      12(a2,d2.l),d3
		bne.s      free_ob_1
		move.w     d6,12(a2,d2.l)
free_ob_1:
		movem.l    (a7)+,d3-d6/a2
		rts

	.globl moveto_ob
moveto_ob:
		movem.l    d3-d6/a2,-(a7)
		movea.l    a0,a2
		move.w     d0,d4
		move.w     d1,d3
		cmp.w      d0,d1
		beq        moveto_ob_1
		ext.l      d0
		move.l     d0,d2
		lsl.l      #3,d2
		sub.l      d0,d2
		lsl.l      #3,d2
		lea.l      0(a2,d2.l),a1
		move.w     d3,d2
		ext.l      d2
		move.l     d2,d1
		lsl.l      #3,d1
		sub.l      d2,d1
		lsl.l      #3,d1
		lea.l      0(a2,d1.l),a0
		moveq.l    #56,d0
		jsr        memcpy
		move.w     d4,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     12(a2,d0.l),d6
		tst.w      d6
		bmi.s      moveto_ob_2
		move.w     d6,d0
		ext.l      d0
		move.l     d0,d2
		lsl.l      #3,d2
		sub.l      d0,d2
		lsl.l      #3,d2
		move.w     d3,8(a2,d2.l)
moveto_ob_2:
		move.w     d4,d6
		bra.s      moveto_ob_3
moveto_ob_4:
		move.w     d5,d6
moveto_ob_3:
		move.w     d6,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     8(a2,d0.l),d5
		move.w     d5,d0
		ext.l      d0
		move.l     d0,d2
		lsl.l      #3,d2
		sub.l      d0,d2
		lsl.l      #3,d2
		cmp.w      12(a2,d2.l),d6
		bne.s      moveto_ob_4
		cmp.w      12(a2,d2.l),d4
		bne.s      moveto_ob_5
		move.w     d3,12(a2,d2.l)
moveto_ob_5:
		move.w     d5,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     10(a2,d0.l),d6
		cmp.w      d6,d4
		bne.s      moveto_ob_6
		move.w     d3,10(a2,d0.l)
		bra.s      moveto_ob_1
moveto_ob_7:
		move.w     d6,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     8(a2,d0.l),d6
moveto_ob_6:
		move.w     d6,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		cmp.w      8(a2,d0.l),d4
		bne.s      moveto_ob_7
		move.w     d3,8(a2,d0.l)
moveto_ob_1:
		movem.l    (a7)+,d3-d6/a2
		rts

	.globl pack_ob
pack_ob:
		movem.l    d3-d4/a2-a3,-(a7)
		movea.l    a0,a2
		movea.l    4(a2),a3
		move.l     14(a2),d0
		moveq.l    #56,d1
		jsr        _uldiv
		move.l     d0,d3
		clr.w      d4
		bra.s      pack_ob_1
pack_ob_5:
		move.w     d4,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		cmpi.w     #$FFFF,14(a3,d0.l)
		bne.s      pack_ob_2
pack_ob_4:
		subq.w     #1,d3
		subi.l     #$00000038,14(a2)
		cmp.w      d4,d3
		ble.s      pack_ob_3
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		cmpi.w     #$FFFF,14(a3,d0.l)
		beq.s      pack_ob_4
		movea.l    a3,a0
		move.w     d3,d0
		move.w     d4,d1
		bsr        moveto_ob
pack_ob_2:
		addq.w     #1,d4
pack_ob_1:
		cmp.w      d4,d3
		bgt.s      pack_ob_5
pack_ob_3:
		movem.l    (a7)+,d3-d4/a2-a3
		rts

	.globl unlink_ob
unlink_ob:
		movem.l    d3-d7/a2,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		ext.l      d0
		move.l     d0,d1
		lsl.l      #3,d1
		sub.l      d0,d1
		lsl.l      #3,d1
		move.w     10(a2,d1.l),d4
		tst.w      d3
		bne.s      unlink_ob_1
		tst.w      d4
		ble        unlink_ob_2
		cmp.w      12(a2),d4
		bne        unlink_ob_2
		move.w     d4,d1
		ext.l      d1
		move.l     d1,d2
		lsl.l      #3,d2
		sub.l      d1,d2
		lsl.l      #3,d2
		lea.l      0(a2,d2.l),a1
		moveq.l    #56,d0
		jsr        memcpy
		move.w     d4,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     #$FFFF,14(a2,d0.l)
		move.w     #$FFFF,8(a2)
		clr.w      24(a2)
		clr.w      26(a2)
		move.w     12(a2),d2
		ble        unlink_ob_2
		ext.l      d2
		move.l     d2,d0
		lsl.l      #3,d0
		sub.l      d2,d0
		lsl.l      #3,d0
		clr.w      8(a2,d0.l)
		bra        unlink_ob_2
unlink_ob_1:
		tst.w      d4
		bpl.s      unlink_ob_3
		move.w     d3,d0
		movea.l    a2,a0
		bsr        free_ob
		bra        unlink_ob_2
unlink_ob_3:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     24(a2,d0.l),d6
		move.w     26(a2,d0.l),d7
		move.w     d4,d5
unlink_ob_4:
		move.w     d5,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		add.w      d6,24(a2,d0.l)
		add.w      d7,26(a2,d0.l)
		move.w     8(a2,d0.l),d5
		cmp.w      d5,d3
		bne.s      unlink_ob_4
		move.w     d3,d7
		move.w     d7,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     8(a2,d0.l),d6
		move.w     d6,d5
		bra.s      unlink_ob_5
unlink_ob_6:
		move.w     d6,d7
		move.w     d7,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     8(a2,d0.l),d6
unlink_ob_5:
		move.w     d6,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		cmp.w      12(a2,d0.l),d7
		bne.s      unlink_ob_6
		move.w     10(a2,d0.l),d7
		cmp.w      d7,d3
		bne.s      unlink_ob_7
		move.w     d4,10(a2,d0.l)
		bra.s      unlink_ob_8
unlink_ob_9:
		move.w     d7,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     8(a2,d0.l),d7
unlink_ob_7:
		move.w     d7,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		cmp.w      8(a2,d0.l),d3
		bne.s      unlink_ob_9
		move.w     d4,8(a2,d0.l)
unlink_ob_8:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     12(a2,d0.l),d7
		move.w     d7,d4
		ext.l      d4
		move.l     d4,d2
		lsl.l      #3,d2
		sub.l      d4,d2
		lsl.l      #3,d2
		move.w     d5,8(a2,d2.l)
		cmp.w      d5,d6
		bne.s      unlink_ob_2
		move.w     d6,d7
		ext.l      d7
		move.l     d7,d5
		lsl.l      #3,d5
		sub.l      d7,d5
		lsl.l      #3,d5
		move.w     12(a2,d0.l),12(a2,d5.l)
unlink_ob_2:
		movem.l    (a7)+,d3-d7/a2
		rts

rob:
		movem.l    d3-d6/a2-a6,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		move.w     d1,d4
		move.w     d2,d6
		movea.l    a1,a4
		ext.l      d0
		move.l     d0,d1
		lsl.l      #3,d1
		sub.l      d0,d1
		lsl.l      #3,d1
		lea.l      0(a2,d1.l),a3
		move.w     18(a3),d2
		and.w      #$0F00,d2
		beq        rob_1
		move.w     d3,d5
		add.w      d5,d5
		add.w      d3,d5
		addq.w     #1,d5
		move.w     d5,d0
		ext.l      d0
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		lea.l      0(a4,d1.l),a5
		lea.l      24(a5),a6
		move.w     18(a3),d2
		and.w      #$0200,d2
		beq.s      rob_2
		move.w     24(a3),d0
		jsr        pixel_x
		add.w      d4,d0
		jsr        char_x
		move.w     d0,d5
		move.w     d0,24(a3)
		move.w     d5,d0
		jsr        pixel_x
		move.w     d0,16(a5)
		move.w     d0,16(a6)
		move.w     18(a3),d1
		and.w      #$0100,d1
		bne.s      rob_3
		move.w     28(a3),d0
		jsr        pixel_x
		sub.w      d4,d0
		jsr        char_x
		move.w     d0,d5
		move.w     d0,28(a3)
		bra.s      rob_4
rob_2:
		move.w     18(a3),d0
		and.w      #$0100,d0
		beq.s      rob_3
		move.w     28(a3),d0
		jsr        pixel_x
		add.w      d4,d0
		jsr        char_x
		move.w     d0,d5
		move.w     d0,28(a3)
rob_4:
		move.w     d5,d0
		jsr        pixel_x
		move.w     d0,20(a5)
		move.w     d0,20(a6)
rob_3:
		move.w     18(a3),d0
		and.w      #$0800,d0
		beq.s      rob_5
		move.w     26(a3),d0
		jsr        pixel_y
		add.w      d6,d0
		jsr        char_y
		move.w     d0,d5
		move.w     d0,26(a3)
		move.w     d5,d0
		jsr        pixel_y
		move.w     d0,18(a5)
		move.w     d0,18(a6)
		move.w     18(a3),d1
		and.w      #$0400,d1
		bne.s      rob_6
		move.w     30(a3),d0
		jsr        pixel_y
		sub.w      d6,d0
		jsr        char_y
		move.w     d0,d5
		move.w     d0,30(a3)
		bra.s      rob_7
rob_5:
		move.w     18(a3),d0
		and.w      #$0400,d0
		beq.s      rob_6
		move.w     30(a3),d0
		jsr        pixel_y
		add.w      d6,d0
		jsr        char_y
		move.w     d0,d5
		move.w     d0,30(a3)
rob_7:
		move.w     d5,d0
		jsr        pixel_y
		move.w     d0,22(a5)
		move.w     d0,22(a6)
rob_6:
		move.w     18(a3),d0
		and.w      #$0F00,d0
		cmp.w      #$0F00,d0
		beq.s      rob_1
		movea.l    a4,a1
		move.w     d6,d2
		move.w     d4,d1
		movea.l    a2,a0
		move.w     d3,d0
		jsr        resize_ob
rob_1:
		movem.l    (a7)+,d3-d6/a2-a6
		rts

	.globl resize_ob
resize_ob:
		movem.l    d3-d6/a2-a3,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		move.w     d1,d5
		move.w     d2,d6
		movea.l    a1,a3
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     10(a2,d0.l),d4
		tst.w      d4
		bmi.s      resize_ob_1
		tst.w      d5
		bne.s      resize_ob_2
		tst.w      d2
		beq.s      resize_ob_1
		bra.s      resize_ob_2
resize_ob_3:
		movea.l    a3,a1
		move.w     d6,d2
		move.w     d5,d1
		move.w     d4,d0
		movea.l    a2,a0
		bsr        rob
		move.w     d4,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		move.w     8(a2,d0.l),d4
resize_ob_2:
		cmp.w      d4,d3
		bne.s      resize_ob_3
resize_ob_1:
		movem.l    (a7)+,d3-d6/a2-a3
		rts

		.data

xc91bc:
		dc.b 'INDEX NAME',0
		.even
