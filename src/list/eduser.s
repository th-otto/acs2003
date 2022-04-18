		.text
		
add_2ref:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     a2,d0
		bne.s      add_2ref_1
		suba.l     a0,a0
		bra.s      add_2ref_2
add_2ref_1:
		movea.l    a2,a1
		movea.l    a3,a0
		jsr        add_ref
add_2ref_2:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

del_2ref:
		move.l     a2,-(a7)
		movea.l    a1,a2
		move.l     a2,d0
		beq.s      del_2ref_1
		jsr        del_ref
del_2ref_1:
		movea.l    (a7)+,a2
		rts

add_3ref:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     a2,d1
		beq.s      add_3ref_1
		moveq.l    #3,d2
		and.w      d0,d2
		subq.w     #1,d2
		beq.s      add_3ref_2
		subq.w     #1,d2
		beq.s      add_3ref_3
		subq.w     #1,d2
		beq.s      add_3ref_4
		bra.s      add_3ref_1
add_3ref_2:
		movea.l    a2,a1
		movea.l    a3,a0
		jsr        add_ref
		bra.s      add_3ref_5
add_3ref_3:
		movea.l    a2,a1
		movea.l    a3,a0
		jsr        add_string
		bra.s      add_3ref_5
add_3ref_4:
		movea.l    a2,a1
		movea.l    a3,a0
		jsr        add_data
		bra.s      add_3ref_5
add_3ref_1:
		suba.l     a0,a0
add_3ref_5:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

del_3ref:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     a2,d1
		beq.s      del_3ref_1
		moveq.l    #3,d2
		and.w      d0,d2
		subq.w     #1,d2
		beq.s      del_3ref_2
		subq.w     #1,d2
		beq.s      del_3ref_3
		subq.w     #1,d2
		beq.s      del_3ref_4
		bra.s      del_3ref_1
del_3ref_2:
		movea.l    a2,a1
		movea.l    a3,a0
		jsr        del_ref
		bra.s      del_3ref_1
del_3ref_3:
		movea.l    a2,a1
		movea.l    a3,a0
		jsr        del_string
		bra.s      del_3ref_1
del_3ref_4:
		movea.l    a2,a1
		movea.l    a3,a0
		jsr        del_data
del_3ref_1:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

comp_it:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		move.l     a2,d0
		bne.s      comp_it_1
		move.l     a3,d1
		bne.s      comp_it_1
		moveq.l    #1,d0
		bra.s      comp_it_2
comp_it_1:
		move.l     a2,d0
		beq.s      comp_it_3
		move.l     a3,d1
		bne.s      comp_it_4
comp_it_3:
		clr.w      d0
		bra.s      comp_it_2
comp_it_4:
		lea.l      22(a3),a1
		lea.l      22(a2),a0
		jsr        strcmp
		tst.w      d0
		bne.s      comp_it_5
		moveq.l    #1,d0
		bra.s      comp_it_2
comp_it_5:
		clr.w      d0
comp_it_2:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

comp2_it:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		move.l     a2,d1
		bne.s      comp2_it_1
		move.l     a3,d2
		bne.s      comp2_it_1
		moveq.l    #1,d0
		bra.s      comp2_it_2
comp2_it_1:
		move.l     a2,d1
		beq.s      comp2_it_3
		move.l     a3,d2
		beq.s      comp2_it_3
		moveq.l    #3,d1
		and.w      d0,d1
		tst.w      d1
		beq.s      comp2_it_4
		subq.w     #1,d1
		beq.s      comp2_it_4
		subq.w     #1,d1
		beq.s      comp2_it_5
		subq.w     #1,d1
		beq.s      comp2_it_5
		bra.s      comp2_it_3
comp2_it_4:
		lea.l      22(a3),a1
		lea.l      22(a2),a0
		jsr        strcmp
		tst.w      d0
		bne.s      comp2_it_6
		moveq.l    #1,d0
		bra.s      comp2_it_7
comp2_it_6:
		clr.w      d0
comp2_it_7:
		bra.s      comp2_it_2
comp2_it_5:
		move.l     14(a2),d0
		cmp.l      14(a3),d0
		bne.s      comp2_it_8
		movea.l    4(a3),a1
		movea.l    4(a2),a0
		jsr        memcmp
		tst.w      d0
		bne.s      comp2_it_8
		moveq.l    #1,d0
		bra.s      comp2_it_9
comp2_it_8:
		clr.w      d0
comp2_it_9:
		bra.s      comp2_it_2
comp2_it_3:
		clr.w      d0
comp2_it_2:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl add_user
add_user:
		movem.l    d3-d5/a2-a5,-(a7)
		subq.w     #8,a7
		movea.l    a0,a2
		move.l     a1,4(a7)
		ori.w      #0x0001,6(a2)
		movea.l    56(a2),a0
		move.l     4(a0),(a7)
		movea.l    4(a1),a5
		move.w     56(a1),d3
		and.w      #0x00FF,d3
		moveq.l    #6,d0
		movea.l    ACSblk,a1
		and.w      614(a1),d0
		subq.w     #6,d0
		beq        add_user_1
		move.l     14(a0),d4
		lsr.l      #2,d4
		clr.w      d5
		bra        add_user_2
add_user_5:
		move.w     d5,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		movea.l    0(a0,d0.l),a3
		movea.l    4(a3),a4
		move.w     56(a3),d1
		and.w      #0x00FF,d1
		cmp.w      d1,d3
		bne        add_user_3
		movea.l    (a5),a1
		lea.l      22(a1),a1
		movea.l    (a4),a0
		lea.l      22(a0),a0
		jsr        strcmp
		tst.w      d0
		bne        add_user_3
		movea.l    4(a5),a1
		lea.l      22(a1),a1
		movea.l    4(a4),a0
		lea.l      22(a0),a0
		jsr        strcmp
		tst.w      d0
		bne.w      add_user_3
		movea.l    8(a5),a1
		movea.l    8(a4),a0
		bsr        comp_it
		tst.w      d0
		beq.s      add_user_3
		move.w     d3,d0
		movea.l    12(a5),a1
		movea.l    12(a4),a0
		bsr        comp2_it
		tst.w      d0
		beq.s      add_user_3
		move.w     d3,d0
		asr.w      #2,d0
		movea.l    16(a5),a1
		movea.l    16(a4),a0
		bsr        comp2_it
		tst.w      d0
		beq.s      add_user_3
		move.w     d3,d0
		asr.w      #4,d0
		movea.l    20(a5),a1
		movea.l    20(a4),a0
		bsr        comp2_it
		tst.w      d0
		beq.s      add_user_3
		moveq.l    #2,d0
		movea.l    24(a5),a1
		movea.l    24(a4),a0
		bsr        comp2_it
		tst.w      d0
		beq.s      add_user_3
		moveq.l    #2,d0
		movea.l    28(a5),a1
		movea.l    28(a4),a0
		bsr        comp2_it
		tst.w      d0
		beq.s      add_user_3
		addq.w     #1,54(a3)
		bra.s      add_user_4
add_user_3:
		addq.w     #1,d5
add_user_2:
		cmp.w      d5,d4
		bgt        add_user_5
add_user_1:
		movea.l    4(a7),a1
		movea.l    a2,a0
		jsr        copy_user
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      add_user_6
		suba.l     a0,a0
		bra.s      add_user_7
add_user_6:
		move.l     list_user+16,-(a7)
		movea.l    8(a7),a0
		pea.l      22(a0)
		movea.l    a3,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a3,a1
		movea.l    56(a2),a0
		jsr        add_entry
add_user_4:
		movea.l    a3,a0
add_user_7:
		addq.w     #8,a7
		movem.l    (a7)+,d3-d5/a2-a5
		rts

	.globl del_user
del_user:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		ori.w      #0x0001,6(a2)
		subq.w     #1,54(a3)
		move.w     54(a3),d0
		bgt        del_user_1
		movea.l    4(a3),a4
		movea.l    (a4),a1
		jsr        del_ref
		movea.l    4(a4),a1
		movea.l    a2,a0
		jsr        del_ref
		movea.l    8(a4),a1
		movea.l    a2,a0
		bsr        del_2ref
		move.w     56(a3),d0
		movea.l    12(a4),a1
		movea.l    a2,a0
		bsr        del_3ref
		move.w     56(a3),d0
		asr.w      #2,d0
		movea.l    16(a4),a1
		movea.l    a2,a0
		bsr        del_3ref
		move.w     56(a3),d0
		asr.w      #4,d0
		movea.l    20(a4),a1
		movea.l    a2,a0
		bsr        del_3ref
		moveq.l    #2,d0
		movea.l    24(a4),a1
		movea.l    a2,a0
		bsr        del_3ref
		moveq.l    #2,d0
		movea.l    28(a4),a1
		movea.l    a2,a0
		bsr        del_3ref
		movea.l    a3,a1
		movea.l    56(a2),a0
		jsr        del_entry
		movea.l    a3,a1
		movea.l    a2,a0
		jsr        objfree
del_user_1:
		movem.l    (a7)+,a2-a4
		rts

copy_user:
		movem.l    a2-a6,-(a7)
		movea.l    a0,a2
		movea.l    a1,a4
		moveq.l    #32,d0
		jsr        objmalloc
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      copy_user_1
		suba.l     a0,a0
		bra        copy_user_2
copy_user_1:
		movea.l    4(a4),a5
		movea.l    4(a3),a6
		move.l     #0x00000020,14(a3)
		move.w     56(a4),56(a3)
		movea.l    (a5),a1
		movea.l    a2,a0
		jsr        add_ref
		move.l     a0,(a6)
		movea.l    4(a5),a1
		movea.l    a2,a0
		jsr        add_ref
		move.l     a0,4(a6)
		movea.l    8(a5),a1
		movea.l    a2,a0
		bsr        add_2ref
		move.l     a0,8(a6)
		move.w     56(a4),d0
		movea.l    12(a5),a1
		movea.l    a2,a0
		bsr        add_3ref
		move.l     a0,12(a6)
		move.w     56(a4),d0
		asr.w      #2,d0
		movea.l    16(a5),a1
		movea.l    a2,a0
		bsr        add_3ref
		move.l     a0,16(a6)
		move.w     56(a4),d0
		asr.w      #4,d0
		movea.l    20(a5),a1
		movea.l    a2,a0
		bsr        add_3ref
		move.l     a0,20(a6)
		moveq.l    #2,d0
		movea.l    24(a5),a1
		movea.l    a2,a0
		bsr        add_3ref
		move.l     a0,24(a6)
		moveq.l    #2,d0
		movea.l    28(a5),a1
		movea.l    a2,a0
		bsr        add_3ref
		move.l     a0,28(a6)
		movea.l    a3,a0
copy_user_2:
		movem.l    (a7)+,a2-a6
		rts

set_udftype:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     d1,d3
		movea.l    20(a7),a4
		move.w     d0,d2
		subq.w     #1,d2
		beq.s      set_udftype_1
		subq.w     #1,d2
		beq.s      set_udftype_2
		subq.w     #1,d2
		beq.s      set_udftype_3
		bra.s      set_udftype_4
set_udftype_1:
		moveq.l    #31,d0
		movea.l    a2,a1
		lea.l      22(a3),a0
		jsr        strncpy
		clr.l      4(a3)
		moveq.l    #0,d0
		move.l     d0,10(a3)
		move.l     d0,14(a3)
		bra.s      set_udftype_5
set_udftype_2:
		lea.l      xce7f0,a1
		lea.l      22(a3),a0
		jsr        strcpy
		movea.l    a2,a0
		jsr        strlen
		addq.l     #1,d0
		move.l     d0,10(a3)
		move.l     d0,14(a3)
		bra.s      set_udftype_6
set_udftype_3:
		lea.l      xce7f8,a1
		lea.l      22(a3),a0
		jsr        strcpy
		move.l     d3,10(a3)
		move.l     d3,14(a3)
set_udftype_6:
		move.l     a2,4(a3)
set_udftype_5:
		move.l     a3,(a4)
		bra.s      set_udftype_7
set_udftype_4:
		clr.l      (a4)
set_udftype_7:
		movem.l    (a7)+,d3/a2-a4
		rts

set_usertype:
		movem.l    a2-a6,-(a7)
		movea.l    a0,a3
		movea.l    a1,a6
		movea.l    24(a7),a2
		movea.l    28(a7),a5
		move.b     (a2),d0
		beq.s      set_usertype_1
		movea.l    52(a3),a0
		movea.l    a2,a1
		jsr        find_entry
		movea.l    a0,a4
		move.l     a4,d0
		beq.s      set_usertype_2
		move.l     d0,(a5)
		moveq.l    #2,d0
		bra.s      set_usertype_3
set_usertype_2:
		movea.l    a2,a1
		movea.l    68(a3),a0
		jsr        find_entry
		movea.l    a0,a4
		move.l     a4,d0
		beq.s      set_usertype_4
		move.l     d0,(a5)
		moveq.l    #3,d0
		bra.s      set_usertype_3
set_usertype_4:
		movea.l    a2,a1
		movea.l    60(a3),a0
		jsr        find_entry
		movea.l    a0,a4
		move.l     a4,d0
		beq.s      set_usertype_5
		move.l     d0,(a5)
		bra.s      set_usertype_6
set_usertype_5:
		movea.l    a2,a1
		lea.l      22(a6),a0
		jsr        strcpy
		move.l     a6,(a5)
set_usertype_6:
		moveq.l    #1,d0
		bra.s      set_usertype_3
set_usertype_1:
		clr.l      (a5)
		clr.w      d0
set_usertype_3:
		movem.l    (a7)+,a2-a6
		rts

	.globl change_user
change_user:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a3
		movea.l    a1,a5
		movea.l    20(a7),a2
		lea.l      us_blk,a4
		moveq.l    #31,d0
		lea.l      xce7f5,a1
		move.l     d0,-(a7)
		move.l     a1,-(a7)
		movea.l    (a2),a1
		lea.l      54(a4),a0
		jsr        strcpy
		movea.l    (a7)+,a1
		move.l     (a7)+,d0
		jsr        strncat
		jsr        strupr
		movea.l    (a2),a1
		lea.l      -506(a4),a0
		jsr        strcpy
		movea.l    4(a2),a1
		lea.l      -440(a4),a0
		jsr        strcpy
		movea.l    8(a2),a0
		move.b     (a0),d0
		beq.s      change_user_1
		movea.l    a0,a1
		lea.l      -374(a4),a0
		moveq.l    #31,d0
		jsr        strncpy
		clr.b      -342(a4)
		move.l     #serv,8(a4)
		bra.s      change_user_2
change_user_1:
		clr.l      8(a4)
change_user_2:
		pea.l      12(a4)
		move.l     12(a2),-(a7)
		lea.l      -330(a4),a1
		movea.l    a3,a0
		bsr        set_usertype
		addq.w     #8,a7
		move.w     d0,-(a7)
		pea.l      16(a4)
		move.l     16(a2),-(a7)
		lea.l      -264(a4),a1
		movea.l    a3,a0
		bsr        set_usertype
		addq.w     #8,a7
		lsl.w      #2,d0
		or.w       (a7)+,d0
		move.w     d0,-(a7)
		pea.l      20(a4)
		move.l     20(a2),-(a7)
		lea.l      -198(a4),a1
		movea.l    a3,a0
		bsr        set_usertype
		addq.w     #8,a7
		lsl.w      #4,d0
		or.w       (a7)+,d0
		move.w     d0,88(a4)
		movea.l    24(a2),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      change_user_3
		move.w     -532(a4),d0
		ext.l      d0
		movea.l    24(a2),a1
		movea.l    -128(a4),a0
		jsr        strncpy
		move.w     -532(a4),d0
		movea.l    -128(a4),a0
		clr.b      0(a0,d0.w)
		move.l     #bubble,24(a4)
		bra.s      change_user_4
change_user_3:
		clr.l      24(a4)
change_user_4:
		movea.l    28(a2),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      change_user_5
		move.w     -530(a4),d0
		ext.l      d0
		movea.l    24(a2),a1
		movea.l    -62(a4),a0
		jsr        strncpy
		move.w     -530(a4),d0
		movea.l    -62(a4),a0
		clr.b      0(a0,d0.w)
		move.l     #context,28(a4)
		bra.s      change_user_6
change_user_5:
		clr.l      28(a4)
change_user_6:
		lea.l      32(a4),a1
		movea.l    a3,a0
		bsr        add_user
		movea.l    a0,a4
		move.l     a4,d0
		beq.s      change_user_7
		movea.l    a5,a1
		movea.l    a3,a0
		bsr        del_user
change_user_7:
		movea.l    a4,a0
		movem.l    (a7)+,a2-a5
		rts

chgadd_3ref:
		movem.l    d3/a2-a5,-(a7)
		movea.l    a0,a4
		movea.l    a1,a5
		move.w     d0,d3
		movea.l    24(a7),a3
		suba.l     a2,a2
		move.l     a3,d2
		beq.s      chgadd_3ref_1
		moveq.l    #3,d0
		and.w      d1,d0
		subq.w     #1,d0
		beq.s      chgadd_3ref_2
		subq.w     #1,d0
		beq.s      chgadd_3ref_3
		subq.w     #1,d0
		beq.s      chgadd_3ref_4
		bra.s      chgadd_3ref_1
chgadd_3ref_2:
		movea.l    a3,a1
		movea.l    a4,a0
		jsr        add_ref
		movea.l    a0,a2
		bra.s      chgadd_3ref_1
chgadd_3ref_3:
		move.l     (a5),d0
		bne.s      chgadd_3ref_5
		movea.l    a3,a1
		movea.l    a4,a0
		jsr        add_string
		movea.l    a0,a2
		bra.s      chgadd_3ref_1
chgadd_3ref_5:
		move.l     4(a3),-(a7)
		movea.l    (a5),a1
		movea.l    a4,a0
		jsr        change_string
		addq.w     #4,a7
		movea.l    a0,a2
		bra.s      chgadd_3ref_1
chgadd_3ref_4:
		movea.l    a3,a1
		movea.l    a4,a0
		jsr        add_data
		movea.l    a0,a2
chgadd_3ref_1:
		move.l     (a5),d0
		beq.s      chgadd_3ref_6
		cmpa.l     d0,a2
		beq.s      chgadd_3ref_6
		movea.l    d0,a1
		movea.l    a4,a0
		move.w     d3,d0
		bsr        del_3ref
chgadd_3ref_6:
		move.l     a2,(a5)
		movem.l    (a7)+,d3/a2-a5
		rts

	.globl change_udf
change_udf:
		movem.l    a2-a6,-(a7)
		subq.w     #4,a7
		movea.l    a0,a4
		movea.l    a1,a2
		movea.l    28(a7),a5
		movea.l    4(a2),a3
		ori.w      #0x0001,6(a4)
		movea.l    (a3),a0
		lea.l      22(a0),a0
		move.l     a0,(a7)
		lea.l      us_blk,a6
		moveq.l    #31,d0
		lea.l      xce7f5,a1
		move.l     d0,-(a7)
		move.l     a1,-(a7)
		lea.l      54(a6),a0
		movea.l    8(a7),a1
		jsr        strcpy
		movea.l    (a7)+,a1
		move.l     (a7)+,d0
		jsr        strncat
		jsr        strupr
		movea.l    (a7),a1
		lea.l      -506(a6),a0
		jsr        strcpy
		movea.l    (a5),a1
		lea.l      -440(a6),a0
		jsr        strcpy
		movea.l    4(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      change_udf_1
		movea.l    4(a5),a1
		lea.l      -374(a6),a0
		jsr        strcpy
		move.l     #serv,8(a6)
		bra.s      change_udf_2
change_udf_1:
		clr.l      8(a6)
change_udf_2:
		move.w     18(a5),d0
		lsl.w      #2,d0
		or.w       8(a5),d0
		move.w     28(a5),d1
		lsl.w      #4,d1
		or.w       d1,d0
		move.w     d0,88(a6)
		pea.l      12(a6)
		move.l     14(a5),d1
		movea.l    10(a5),a1
		move.w     8(a5),d0
		lea.l      -330(a6),a0
		bsr        set_udftype
		addq.w     #4,a7
		pea.l      16(a6)
		move.l     24(a5),d1
		movea.l    20(a5),a1
		move.w     18(a5),d0
		lea.l      -264(a6),a0
		bsr        set_udftype
		addq.w     #4,a7
		pea.l      20(a6)
		move.l     34(a5),d1
		movea.l    30(a5),a1
		move.w     28(a5),d0
		lea.l      -198(a6),a0
		bsr        set_udftype
		addq.w     #4,a7
		movea.l    38(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      change_udf_3
		moveq.l    #-1,d0
		add.w      -532(a6),d0
		ext.l      d0
		movea.l    38(a5),a1
		movea.l    -128(a6),a0
		jsr        strncpy
		move.w     -532(a6),d0
		movea.l    -128(a6),a0
		clr.b      0(a0,d0.w)
		movea.l    -128(a6),a0
		jsr        strlen
		addq.l     #1,d0
		move.l     d0,-118(a6)
		move.l     d0,-122(a6)
		move.l     #bubble,24(a6)
		bra.s      change_udf_4
change_udf_3:
		clr.l      24(a6)
change_udf_4:
		movea.l    42(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      change_udf_5
		moveq.l    #-1,d0
		add.w      -530(a6),d0
		ext.l      d0
		movea.l    42(a5),a1
		movea.l    -62(a6),a0
		jsr        strncpy
		move.w     -530(a6),d0
		movea.l    -62(a6),a0
		clr.b      0(a0,d0.w)
		movea.l    -62(a6),a0
		jsr        strlen
		addq.l     #1,d0
		move.l     d0,-52(a6)
		move.l     d0,-56(a6)
		move.l     #context,28(a6)
		bra.s      change_udf_6
change_udf_5:
		clr.l      28(a6)
change_udf_6:
		movea.l    (a3),a5
		lea.l      -528(a6),a1
		movea.l    a4,a0
		jsr        add_ref
		move.l     a0,(a3)
		move.l     a0,d0
		beq.s      change_udf_7
		movea.l    a5,a1
		movea.l    a4,a0
		jsr        del_ref
		bra.s      change_udf_8
change_udf_7:
		move.l     a5,(a3)
change_udf_8:
		movea.l    4(a3),a5
		lea.l      -462(a6),a1
		movea.l    a4,a0
		jsr        add_ref
		move.l     a0,4(a3)
		move.l     a0,d0
		beq.s      change_udf_9
		movea.l    a5,a1
		movea.l    a4,a0
		jsr        del_ref
		bra.s      change_udf_10
change_udf_9:
		move.l     a5,4(a3)
change_udf_10:
		move.l     8(a6),d0
		beq.s      change_udf_11
		movea.l    8(a3),a5
		lea.l      -396(a6),a1
		movea.l    a4,a0
		bsr        add_2ref
		move.l     a0,8(a3)
		move.l     a0,d0
		beq.s      change_udf_12
		movea.l    a5,a1
		movea.l    a4,a0
		bsr        del_2ref
		bra.s      change_udf_11
change_udf_12:
		move.l     a5,8(a3)
change_udf_11:
		move.l     12(a6),-(a7)
		move.w     88(a6),d1
		move.w     56(a2),d0
		lea.l      12(a3),a1
		movea.l    a4,a0
		bsr        chgadd_3ref
		addq.w     #4,a7
		move.l     16(a6),-(a7)
		move.w     88(a6),d1
		asr.w      #2,d1
		move.w     56(a2),d0
		asr.w      #2,d0
		lea.l      16(a3),a1
		movea.l    a4,a0
		bsr        chgadd_3ref
		addq.w     #4,a7
		move.l     20(a6),-(a7)
		move.w     88(a6),d1
		asr.w      #4,d1
		move.w     56(a2),d0
		asr.w      #4,d0
		lea.l      20(a3),a1
		movea.l    a4,a0
		bsr        chgadd_3ref
		addq.w     #4,a7
		move.l     24(a6),-(a7)
		moveq.l    #2,d1
		moveq.l    #2,d0
		lea.l      24(a3),a1
		movea.l    a4,a0
		bsr        chgadd_3ref
		addq.w     #4,a7
		move.l     28(a6),-(a7)
		moveq.l    #2,d1
		moveq.l    #2,d0
		lea.l      28(a3),a1
		movea.l    a4,a0
		bsr        chgadd_3ref
		addq.w     #4,a7
		moveq.l    #-64,d0
		and.w      56(a2),d0
		moveq.l    #63,d1
		and.w      88(a6),d1
		or.w       d1,d0
		move.w     d0,56(a2)
		addq.w     #4,a7
		movem.l    (a7)+,a2-a6
		rts

new_work:
		move.w     #0x271F,d0
		movea.l    WI_USER+90,a1
		jsr        work_icon
		rts

	.data

	.globl list_user
list_user:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l WI_USER
		dc.l us_list
		dc.l us_name
		dc.w $271f
		dc.w $0000
		dc.w $0000
		dc.l copy_user
		dc.l del_user
		dc.l new_work
		dc.w $0000
		dc.w $0000
bubble_len:
		dc.w $0102
context_len:
		dc.w $0102
call:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0003
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
parm:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
serv:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0004
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
ptr1:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
ptr2:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
ptr3:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
bubble:
		dc.w $0000
		dc.w $0000
		dc.l bubble_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.b 'BUBBLE_01',0
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
context:
		dc.w $0000
		dc.w $0000
		dc.l context_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.b 'CONTEXT_01',0
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
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
us_blk:
		dc.l call
		dc.l parm
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l bubble
		dc.l context
new_user:
		dc.w $0000
		dc.w $0000
		dc.l us_blk
		dc.w $0000
		dc.w $0000
		dc.w $0020
		dc.w $0000
		dc.w $0020
		dc.w $0000
		dc.w $0000
		dc.b 'USERBLK_01',0
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
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xce7f0:
		dc.b 'TEXT_'
xce7f5:
		dc.b '01',0
xce7f8:
		dc.b 'DATAS_01',0
		.even

	.bss
bubble_string: ds.b 258
context_string: ds.b 258
