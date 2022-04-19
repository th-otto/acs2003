	.globl Ast_create
Ast_create:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     8(a7),d0
		beq.s      Ast_create_1
		movea.l    8(a7),a0
		move.b     (a0),d0
		beq.s      Ast_create_1
		movea.l    8(a7),a0
		jsr        strlen
		addq.l     #1,d0
		move.l     d0,(a7)
		move.l     (a7),d0
		jsr        Ax_malloc
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Ast_create_2
		suba.l     a0,a0
		bra.s      Ast_create_3
Ast_create_2:
		move.l     (a7),d0
		movea.l    8(a7),a1
		movea.l    4(a7),a0
		jsr        memcpy
		movea.l    4(a7),a0
		bra.s      Ast_create_3
		bra.s      Ast_create_3
Ast_create_1:
		lea.l      null_string,a0
		nop
Ast_create_3:
		lea.l      12(a7),a7
		rts

	.globl Ast_delete
Ast_delete:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		cmpa.l     #null_string,a0
		beq.s      Ast_delete_1
		movea.l    (a7),a0
		jsr        Ax_free
Ast_delete_1:
		addq.w     #4,a7
		rts

	.globl Ach_toupper
Ach_toupper:
		subq.w     #2,a7
		move.b     d0,(a7)
		move.b     (a7),d0
		ext.w      d0
		jsr        nkc_toupper
		addq.w     #2,a7
		rts

	.globl Ach_tolower
Ach_tolower:
		subq.w     #2,a7
		move.b     d0,(a7)
		move.b     (a7),d0
		ext.w      d0
		jsr        nkc_tolower
		addq.w     #2,a7
		rts

	.globl Ast_toupper
Ast_toupper:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Ast_toupper_1
		move.l     #null_string,4(a7)
Ast_toupper_1:
		move.l     4(a7),d0
		beq.s      Ast_toupper_2
		move.l     4(a7),(a7)
		bra.s      Ast_toupper_3
Ast_toupper_4:
		movea.l    (a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        nkc_toupper
		movea.l    (a7),a0
		move.b     d0,(a0)
		addq.l     #1,(a7)
Ast_toupper_3:
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      Ast_toupper_4
Ast_toupper_2:
		movea.l    4(a7),a0
		addq.w     #8,a7
		rts

	.globl Ast_tolower
Ast_tolower:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Ast_tolower_1
		move.l     #null_string,4(a7)
Ast_tolower_1:
		move.l     4(a7),d0
		beq.s      Ast_tolower_2
		move.l     4(a7),(a7)
		bra.s      Ast_tolower_3
Ast_tolower_4:
		movea.l    (a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        nkc_tolower
		movea.l    (a7),a0
		move.b     d0,(a0)
		addq.l     #1,(a7)
Ast_tolower_3:
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      Ast_tolower_4
Ast_tolower_2:
		movea.l    4(a7),a0
		addq.w     #8,a7
		rts

	.globl Ast_ltrim
Ast_ltrim:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     8(a7),d0
		bne.s      Ast_ltrim_1
		move.l     #null_string,8(a7)
Ast_ltrim_1:
		move.l     8(a7),(a7)
		bra.s      Ast_ltrim_2
Ast_ltrim_4:
		addq.l     #1,(a7)
Ast_ltrim_2:
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      Ast_ltrim_3
		movea.l    (a7),a0
		move.b     (a0),d0
		jsr        Ach_isWhite
		tst.w      d0
		bne.s      Ast_ltrim_4
Ast_ltrim_3:
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      Ast_ltrim_5
		movea.l    (a7),a0
		cmpa.l     8(a7),a0
		bls.s      Ast_ltrim_5
		move.l     8(a7),4(a7)
		bra.s      Ast_ltrim_6
Ast_ltrim_7:
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.b     (a0),(a1)
		addq.l     #1,(a7)
		addq.l     #1,4(a7)
Ast_ltrim_6:
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      Ast_ltrim_7
		movea.l    4(a7),a0
		clr.b      (a0)
Ast_ltrim_5:
		movea.l    8(a7),a0
		lea.l      12(a7),a7
		rts

	.globl Ast_rtrim
Ast_rtrim:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Ast_rtrim_1
		move.l     #null_string,4(a7)
Ast_rtrim_1:
		move.l     4(a7),(a7)
		bra.s      Ast_rtrim_2
Ast_rtrim_3:
		addq.l     #1,(a7)
Ast_rtrim_2:
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      Ast_rtrim_3
		subq.l     #1,(a7)
		bra.s      Ast_rtrim_4
Ast_rtrim_6:
		subq.l     #1,(a7)
Ast_rtrim_4:
		movea.l    (a7),a0
		cmpa.l     4(a7),a0
		bls.s      Ast_rtrim_5
		movea.l    (a7),a0
		move.b     (a0),d0
		jsr        Ach_isWhite
		tst.w      d0
		bne.s      Ast_rtrim_6
Ast_rtrim_5:
		movea.l    (a7),a0
		cmpa.l     4(a7),a0
		bcs.s      Ast_rtrim_7
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      Ast_rtrim_8
		movea.l    (a7),a0
		move.b     (a0),d0
		jsr        Ach_isWhite
		tst.w      d0
		bne.s      Ast_rtrim_8
		addq.l     #1,(a7)
		movea.l    (a7),a0
		clr.b      (a0)
		bra.s      Ast_rtrim_9
Ast_rtrim_8:
		movea.l    (a7),a0
		clr.b      (a0)
Ast_rtrim_9:
		bra.s      Ast_rtrim_10
Ast_rtrim_7:
		movea.l    4(a7),a0
		clr.b      (a0)
Ast_rtrim_10:
		movea.l    4(a7),a0
		addq.w     #8,a7
		rts

	.globl Ast_alltrim
Ast_alltrim:
		subq.w     #4,a7
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Ast_alltrim_1
		movea.l    (a7),a0
		bsr        Ast_ltrim
		bsr        Ast_rtrim
		bra.s      Ast_alltrim_2
Ast_alltrim_1:
		lea.l      null_string,a0
Ast_alltrim_2:
		addq.w     #4,a7
		rts

	.globl Ast_cmp
Ast_cmp:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		move.l     12(a7),d0
		bne.s      Ast_cmp_1
		move.l     #null_string,12(a7)
Ast_cmp_1:
		move.l     8(a7),d0
		bne.s      Ast_cmp_2
		move.l     #null_string,8(a7)
Ast_cmp_2:
		move.l     12(a7),4(a7)
		move.l     8(a7),(a7)
		bra.s      Ast_cmp_3
Ast_cmp_9:
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		beq.s      Ast_cmp_4
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		ble.s      Ast_cmp_5
		moveq.l    #1,d0
		bra.s      Ast_cmp_6
Ast_cmp_5:
		moveq.l    #-1,d0
Ast_cmp_6:
		bra.s      Ast_cmp_7
Ast_cmp_4:
		addq.l     #1,4(a7)
		addq.l     #1,(a7)
Ast_cmp_3:
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      Ast_cmp_8
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      Ast_cmp_9
Ast_cmp_8:
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		ble.s      Ast_cmp_10
		moveq.l    #1,d0
		bra.s      Ast_cmp_7
Ast_cmp_10:
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		bge.s      Ast_cmp_11
		moveq.l    #-1,d0
		bra.s      Ast_cmp_7
Ast_cmp_11:
		clr.w      d0
Ast_cmp_7:
		lea.l      16(a7),a7
		rts

	.globl Ast_icmp
Ast_icmp:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     a1,10(a7)
		move.l     14(a7),d0
		bne.s      Ast_icmp_1
		move.l     #null_string,14(a7)
Ast_icmp_1:
		move.l     10(a7),d0
		bne.s      Ast_icmp_2
		move.l     #null_string,10(a7)
Ast_icmp_2:
		move.l     14(a7),4(a7)
		move.l     10(a7),(a7)
		bra.s      Ast_icmp_3
Ast_icmp_9:
		movea.l    4(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        nkc_toupper
		move.b     d0,9(a7)
		movea.l    (a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        nkc_toupper
		move.b     d0,8(a7)
		move.b     9(a7),d0
		cmp.b      8(a7),d0
		beq.s      Ast_icmp_4
		move.b     9(a7),d0
		cmp.b      8(a7),d0
		ble.s      Ast_icmp_5
		moveq.l    #1,d0
		bra.s      Ast_icmp_6
Ast_icmp_5:
		moveq.l    #-1,d0
Ast_icmp_6:
		bra.s      Ast_icmp_7
Ast_icmp_4:
		addq.l     #1,4(a7)
		addq.l     #1,(a7)
Ast_icmp_3:
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      Ast_icmp_8
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      Ast_icmp_9
Ast_icmp_8:
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		ble.s      Ast_icmp_10
		moveq.l    #1,d0
		bra.s      Ast_icmp_7
Ast_icmp_10:
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		bge.s      Ast_icmp_11
		moveq.l    #-1,d0
		bra.s      Ast_icmp_7
Ast_icmp_11:
		clr.w      d0
Ast_icmp_7:
		lea.l      18(a7),a7
		rts

	.globl Ast_ncmp
Ast_ncmp:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.l     a1,12(a7)
		move.w     d0,10(a7)
		move.l     16(a7),d0
		bne.s      Ast_ncmp_1
		move.l     #null_string,16(a7)
Ast_ncmp_1:
		move.l     12(a7),d0
		bne.s      Ast_ncmp_2
		move.l     #null_string,12(a7)
Ast_ncmp_2:
		clr.w      8(a7)
		move.l     16(a7),4(a7)
		move.l     12(a7),(a7)
		bra.s      Ast_ncmp_3
Ast_ncmp_9:
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		beq.s      Ast_ncmp_4
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		ble.s      Ast_ncmp_5
		moveq.l    #1,d0
		bra.s      Ast_ncmp_6
Ast_ncmp_5:
		moveq.l    #-1,d0
Ast_ncmp_6:
		bra.s      Ast_ncmp_7
Ast_ncmp_4:
		addq.l     #1,4(a7)
		addq.l     #1,(a7)
		addq.w     #1,8(a7)
Ast_ncmp_3:
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      Ast_ncmp_8
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      Ast_ncmp_8
		move.w     8(a7),d0
		cmp.w      10(a7),d0
		blt.s      Ast_ncmp_9
Ast_ncmp_8:
		move.w     8(a7),d0
		cmp.w      10(a7),d0
		blt.s      Ast_ncmp_10
		clr.w      d0
		bra.s      Ast_ncmp_7
Ast_ncmp_10:
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		ble.s      Ast_ncmp_11
		moveq.l    #1,d0
		bra.s      Ast_ncmp_7
Ast_ncmp_11:
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		bge.s      Ast_ncmp_12
		moveq.l    #-1,d0
		bra.s      Ast_ncmp_7
Ast_ncmp_12:
		clr.w      d0
Ast_ncmp_7:
		lea.l      20(a7),a7
		rts

	.globl Ast_incmp
Ast_incmp:
		lea.l      -22(a7),a7
		move.l     a0,18(a7)
		move.l     a1,14(a7)
		move.w     d0,12(a7)
		move.l     18(a7),d0
		bne.s      Ast_incmp_1
		move.l     #null_string,18(a7)
Ast_incmp_1:
		move.l     14(a7),d0
		bne.s      Ast_incmp_2
		move.l     #null_string,14(a7)
Ast_incmp_2:
		clr.w      8(a7)
		move.l     18(a7),4(a7)
		move.l     14(a7),(a7)
		bra.s      Ast_incmp_3
Ast_incmp_9:
		movea.l    4(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        nkc_toupper
		move.b     d0,11(a7)
		movea.l    (a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        nkc_toupper
		move.b     d0,10(a7)
		move.b     11(a7),d0
		cmp.b      10(a7),d0
		beq.s      Ast_incmp_4
		move.b     11(a7),d0
		cmp.b      10(a7),d0
		ble.s      Ast_incmp_5
		moveq.l    #1,d0
		bra.s      Ast_incmp_6
Ast_incmp_5:
		moveq.l    #-1,d0
Ast_incmp_6:
		bra.s      Ast_incmp_7
Ast_incmp_4:
		addq.l     #1,4(a7)
		addq.l     #1,(a7)
		addq.w     #1,8(a7)
Ast_incmp_3:
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      Ast_incmp_8
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      Ast_incmp_8
		move.w     8(a7),d0
		cmp.w      12(a7),d0
		blt.s      Ast_incmp_9
Ast_incmp_8:
		move.w     8(a7),d0
		cmp.w      12(a7),d0
		blt.s      Ast_incmp_10
		clr.w      d0
		bra.s      Ast_incmp_7
Ast_incmp_10:
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		ble.s      Ast_incmp_11
		moveq.l    #1,d0
		bra.s      Ast_incmp_7
Ast_incmp_11:
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		bge.s      Ast_incmp_12
		moveq.l    #-1,d0
		bra.s      Ast_incmp_7
Ast_incmp_12:
		clr.w      d0
Ast_incmp_7:
		lea.l      22(a7),a7
		rts

	.globl Ast_istr
Ast_istr:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.l     a1,12(a7)
		move.l     16(a7),d0
		bne.s      Ast_istr_1
		move.l     #null_string,16(a7)
Ast_istr_1:
		move.l     12(a7),d0
		bne.s      Ast_istr_2
		move.l     #null_string,12(a7)
Ast_istr_2:
		movea.l    12(a7),a0
		jsr        strlen
		move.w     d0,2(a7)
		movea.l    16(a7),a0
		jsr        strlen
		move.w     d0,-(a7)
		movea.l    14(a7),a0
		jsr        strlen
		move.w     (a7)+,d1
		sub.w      d0,d1
		addq.w     #1,d1
		move.w     d1,4(a7)
		move.l     16(a7),8(a7)
		clr.w      6(a7)
		clr.w      (a7)
		bra.s      Ast_istr_3
Ast_istr_7:
		move.w     2(a7),d0
		movea.l    12(a7),a1
		movea.l    8(a7),a0
		bsr        Ast_incmp
		tst.w      d0
		bne.s      Ast_istr_4
		moveq.l    #1,d0
		bra.s      Ast_istr_5
Ast_istr_4:
		clr.w      d0
Ast_istr_5:
		move.w     d0,6(a7)
		addq.l     #1,8(a7)
		addq.w     #1,(a7)
Ast_istr_3:
		move.w     6(a7),d0
		bne.s      Ast_istr_6
		move.w     (a7),d0
		cmp.w      4(a7),d0
		bge.s      Ast_istr_6
		movea.l    8(a7),a0
		move.b     (a0),d0
		bne.s      Ast_istr_7
Ast_istr_6:
		move.w     6(a7),d0
		beq.s      Ast_istr_8
		movea.l    8(a7),a0
		bra.s      Ast_istr_9
Ast_istr_8:
		suba.l     a0,a0
Ast_istr_9:
		lea.l      20(a7),a7
		rts

	.globl Ach_isWhite
Ach_isWhite:
		subq.w     #2,a7
		move.b     d0,(a7)
		move.b     (a7),d0
		beq.s      Ach_isWhite_1
		move.b     (a7),d0
		ext.w      d0
		lea.l      xe05e0,a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Ach_isWhite_1
		moveq.l    #1,d0
		bra.s      Ach_isWhite_2
Ach_isWhite_1:
		clr.w      d0
Ach_isWhite_2:
		addq.w     #2,a7
		rts

	.globl Ast_isEmpty
Ast_isEmpty:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     4(a7),(a7)
		bra.s      Ast_isEmpty_1
Ast_isEmpty_3:
		addq.l     #1,(a7)
Ast_isEmpty_1:
		move.l     (a7),d0
		beq.s      Ast_isEmpty_2
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      Ast_isEmpty_2
		movea.l    (a7),a0
		move.b     (a0),d0
		bsr.w      Ach_isWhite
		tst.w      d0
		bne.s      Ast_isEmpty_3
Ast_isEmpty_2:
		move.l     (a7),d0
		beq.s      Ast_isEmpty_4
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      Ast_isEmpty_4
		movea.l    (a7),a0
		move.b     (a0),d0
		bsr.w      Ach_isWhite
		tst.w      d0
		beq.s      Ast_isEmpty_5
Ast_isEmpty_4:
		moveq.l    #1,d0
		bra.s      Ast_isEmpty_6
Ast_isEmpty_5:
		clr.w      d0
Ast_isEmpty_6:
		addq.w     #8,a7
		rts

	.globl Ast_add
Ast_add:
		lea.l      -28(a7),a7
		move.w     d0,26(a7)
		move.l     a0,22(a7)
		clr.l      8(a7)
		move.l     #$FFFFFFFF,(a7)
		move.l     22(a7),d0
		bne.s      Ast_add_1
		lea.l      null_string,a0
		bra        Ast_add_2
Ast_add_1:
		lea.l      32(a7),a0
		move.l     a0,18(a7)
		movea.l    22(a7),a0
		clr.b      (a0)
		clr.w      16(a7)
		bra        Ast_add_3
Ast_add_7:
		movea.l    18(a7),a0
		addq.l     #4,18(a7)
		move.l     (a0),12(a7)
		move.l     12(a7),d0
		beq.s      Ast_add_4
		movea.l    12(a7),a0
		move.b     (a0),d0
		beq.s      Ast_add_4
		movea.l    12(a7),a0
		jsr        strlen
		move.l     d0,4(a7)
		move.l     4(a7),d0
		cmp.l      (a7),d0
		ble.s      Ast_add_5
		move.l     8(a7),d0
		beq.s      Ast_add_6
		movea.l    8(a7),a0
		jsr        Ax_free
Ast_add_6:
		moveq.l    #1,d0
		add.l      4(a7),d0
		jsr        Ax_malloc
		move.l     a0,8(a7)
		move.l     4(a7),(a7)
		move.l     8(a7),d0
		bne.s      Ast_add_5
		movea.l    22(a7),a0
		bra.s      Ast_add_2
Ast_add_5:
		movea.l    12(a7),a1
		movea.l    8(a7),a0
		jsr        strcpy
		movea.l    8(a7),a0
		bsr        Ast_alltrim
		movea.l    8(a7),a1
		movea.l    22(a7),a0
		jsr        strcat
Ast_add_4:
		addq.w     #1,16(a7)
Ast_add_3:
		move.w     16(a7),d0
		cmp.w      26(a7),d0
		blt        Ast_add_7
		move.l     8(a7),d0
		beq.s      Ast_add_8
		movea.l    8(a7),a0
		jsr        Ax_free
Ast_add_8:
		movea.l    22(a7),a0
		bsr        Ast_alltrim
Ast_add_2:
		lea.l      28(a7),a7
		rts

	.globl Ast_adl
Ast_adl:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     d0,4(a7)
		movea.l    8(a7),a0
		jsr        strlen
		move.l     d0,(a7)
		move.l     8(a7),d0
		bne.s      Ast_adl_1
		suba.l     a0,a0
		bra.s      Ast_adl_2
Ast_adl_1:
		move.l     (a7),d0
		cmp.l      4(a7),d0
		bge.s      Ast_adl_3
		move.l     4(a7),d1
		sub.l      (a7),d1
		moveq.l    #32,d0
		move.l     (a7),d2
		movea.l    8(a7),a0
		adda.l     d2,a0
		jsr        memset
Ast_adl_3:
		move.l     4(a7),d0
		movea.l    8(a7),a0
		clr.b      0(a0,d0.l)
		movea.l    8(a7),a0
Ast_adl_2:
		lea.l      12(a7),a7
		rts

	.globl Ast_adr
Ast_adr:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     d0,4(a7)
		movea.l    8(a7),a0
		jsr        strlen
		move.l     d0,(a7)
		move.l     8(a7),d0
		bne.s      Ast_adr_1
		suba.l     a0,a0
		bra.s      Ast_adr_2
Ast_adr_1:
		move.l     (a7),d0
		cmp.l      4(a7),d0
		bge.s      Ast_adr_3
		move.l     (a7),d0
		movea.l    8(a7),a1
		move.l     4(a7),d1
		sub.l      (a7),d1
		movea.l    8(a7),a0
		adda.l     d1,a0
		jsr        memcpy
		move.l     4(a7),d1
		sub.l      (a7),d1
		moveq.l    #32,d0
		movea.l    8(a7),a0
		jsr        memset
Ast_adr_3:
		move.l     4(a7),d0
		movea.l    8(a7),a0
		clr.b      0(a0,d0.l)
		movea.l    8(a7),a0
Ast_adr_2:
		lea.l      12(a7),a7
		rts

	.globl Ast_adc
Ast_adc:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     d0,8(a7)
		move.l     12(a7),d0
		bne.s      Ast_adc_1
		suba.l     a0,a0
		bra.s      Ast_adc_2
Ast_adc_1:
		movea.l    12(a7),a0
		jsr        strlen
		move.l     d0,4(a7)
		move.l     8(a7),d0
		sub.l      4(a7),d0
		move.l     d0,(a7)
		move.l     (a7),d0
		ble.s      Ast_adc_3
		move.l     (a7),d0
		asr.l      #1,d0
		movea.l    12(a7),a0
		bsr        Ast_adl
		move.l     (a7),d0
		asr.l      #1,d0
		moveq.l    #1,d1
		and.l      (a7),d1
		add.l      d1,d0
		movea.l    12(a7),a0
		bsr        Ast_adr
Ast_adc_3:
		move.l     8(a7),d0
		movea.l    12(a7),a0
		clr.b      0(a0,d0.l)
		movea.l    12(a7),a0
Ast_adc_2:
		lea.l      16(a7),a7
		rts

	.globl Ast_filter
Ast_filter:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		move.l     12(a7),d0
		beq.s      Ast_filter_1
		move.l     8(a7),d0
		bne.s      Ast_filter_2
		move.l     20(a7),d0
		bne.s      Ast_filter_2
Ast_filter_1:
		suba.l     a0,a0
		bra        Ast_filter_3
Ast_filter_2:
		movea.l    12(a7),a0
		move.l     a0,(a7)
		move.l     a0,4(a7)
		bra.s      Ast_filter_4
Ast_filter_13:
		bra.s      Ast_filter_5
Ast_filter_7:
		addq.l     #1,4(a7)
Ast_filter_5:
		move.l     8(a7),d0
		beq.s      Ast_filter_6
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      Ast_filter_6
		movea.l    4(a7),a0
		move.b     (a0),d0
		ext.w      d0
		movea.l    8(a7),a0
		jsr        strchr
		move.l     a0,d0
		bne.s      Ast_filter_7
Ast_filter_6:
		bra.s      Ast_filter_8
Ast_filter_10:
		addq.l     #1,4(a7)
Ast_filter_8:
		move.l     20(a7),d0
		beq.s      Ast_filter_9
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      Ast_filter_9
		movea.l    4(a7),a0
		move.b     (a0),d0
		ext.w      d0
		movea.l    20(a7),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Ast_filter_10
Ast_filter_9:
		movea.l    4(a7),a0
		cmpa.l     (a7),a0
		beq.s      Ast_filter_11
		movea.l    4(a7),a0
		movea.l    (a7),a1
		move.b     (a0),(a1)
Ast_filter_11:
		addq.l     #1,4(a7)
		addq.l     #1,(a7)
Ast_filter_4:
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      Ast_filter_12
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.w      Ast_filter_13
Ast_filter_12:
		movea.l    (a7),a0
		clr.b      (a0)
		movea.l    12(a7),a0
Ast_filter_3:
		lea.l      16(a7),a7
		rts

	.globl Ast_count
Ast_count:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		move.l     12(a7),d0
		bne.s      Ast_count_1
		move.l     #null_string,12(a7)
Ast_count_1:
		clr.l      4(a7)
		move.l     12(a7),(a7)
		bra.s      Ast_count_2
Ast_count_4:
		movea.l    (a7),a0
		move.b     (a0),d0
		ext.w      d0
		movea.l    8(a7),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Ast_count_3
		addq.l     #1,4(a7)
Ast_count_3:
		addq.l     #1,(a7)
Ast_count_2:
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      Ast_count_4
		move.l     4(a7),d0
		lea.l      16(a7),a7
		rts

strfsearchafterwc:
		lea.l      -30(a7),a7
		move.l     a0,26(a7)
		move.l     a1,22(a7)
		movea.l    22(a7),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		ext.w      d0
		movea.l    38(a7),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      strfsearchafterwc_1
		movea.l    22(a7),a0
		addq.l     #1,(a0)
		movea.l    26(a7),a0
		addq.l     #1,(a0)
		moveq.l    #1,d0
		bra        strfsearchafterwc_2
strfsearchafterwc_1:
		bra.s      strfsearchafterwc_3
strfsearchafterwc_5:
		movea.l    22(a7),a0
		addq.l     #1,(a0)
strfsearchafterwc_3:
		movea.l    22(a7),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		beq.s      strfsearchafterwc_4
		movea.l    22(a7),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		ext.w      d0
		movea.l    34(a7),a0
		jsr        strchr
		move.l     a0,d0
		bne.s      strfsearchafterwc_5
strfsearchafterwc_4:
		movea.l    22(a7),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		bne.s      strfsearchafterwc_6
		bra.s      strfsearchafterwc_7
strfsearchafterwc_8:
		movea.l    26(a7),a0
		addq.l     #1,(a0)
strfsearchafterwc_7:
		movea.l    26(a7),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		bne.s      strfsearchafterwc_8
		moveq.l    #1,d0
		bra        strfsearchafterwc_2
		bra        strfsearchafterwc_9
strfsearchafterwc_6:
		movea.l    34(a7),a1
		movea.l    22(a7),a0
		movea.l    (a0),a0
		jsr        strcspn
		move.l     d0,14(a7)
		movea.l    38(a7),a1
		movea.l    22(a7),a0
		movea.l    (a0),a0
		jsr        strcspn
		move.l     d0,18(a7)
		move.l     14(a7),d0
		cmp.l      18(a7),d0
		bcc.s      strfsearchafterwc_10
		move.l     14(a7),d0
		bra.s      strfsearchafterwc_11
strfsearchafterwc_10:
		move.l     18(a7),d0
strfsearchafterwc_11:
		move.l     d0,10(a7)
		move.l     10(a7),d0
		movea.l    22(a7),a0
		movea.l    (a0),a0
		adda.l     d0,a0
		move.l     a0,2(a7)
		movea.l    2(a7),a0
		move.b     (a0),(a7)
		movea.l    2(a7),a0
		clr.b      (a0)
		movea.l    22(a7),a0
		movea.l    (a0),a1
		movea.l    26(a7),a0
		movea.l    (a0),a0
		jsr        strstr
		move.l     a0,6(a7)
		movea.l    2(a7),a0
		move.b     (a7),(a0)
		movea.l    22(a7),a0
		move.l     2(a7),(a0)
		move.l     6(a7),d0
		bne.s      strfsearchafterwc_12
		clr.w      d0
		bra.s      strfsearchafterwc_2
strfsearchafterwc_12:
		move.l     10(a7),d0
		movea.l    26(a7),a0
		movea.l    (a0),a0
		adda.l     d0,a0
		movea.l    26(a7),a1
		move.l     a0,(a1)
strfsearchafterwc_9:
		moveq.l    #1,d0
strfsearchafterwc_2:
		lea.l      30(a7),a7
		rts

	.globl Ast_fcmp
Ast_fcmp:
		lea.l      -48(a7),a7
		move.l     a0,44(a7)
		move.l     a1,40(a7)
		lea.l      xe05db,a0
		lea.l      38(a7),a1
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		lea.l      xe05dd,a0
		lea.l      36(a7),a1
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		movea.l    44(a7),a0
		bsr        Ast_isEmpty
		tst.w      d0
		bne.s      Ast_fcmp_1
		movea.l    40(a7),a0
		bsr        Ast_isEmpty
		tst.w      d0
		beq.s      Ast_fcmp_2
Ast_fcmp_1:
		clr.w      d0
		bra        Ast_fcmp_3
Ast_fcmp_2:
		movea.l    44(a7),a0
		jsr        strlen
		move.l     d0,12(a7)
		movea.l    40(a7),a0
		jsr        strlen
		move.l     d0,8(a7)
		lea.l      38(a7),a1
		movea.l    44(a7),a0
		jsr        strcspn
		cmp.l      12(a7),d0
		beq.s      Ast_fcmp_4
		moveq.l    #1,d0
		bra.s      Ast_fcmp_5
Ast_fcmp_4:
		clr.w      d0
Ast_fcmp_5:
		move.w     d0,32(a7)
		lea.l      38(a7),a1
		movea.l    40(a7),a0
		jsr        strcspn
		cmp.l      8(a7),d0
		beq.s      Ast_fcmp_6
		moveq.l    #1,d0
		bra.s      Ast_fcmp_7
Ast_fcmp_6:
		clr.w      d0
Ast_fcmp_7:
		move.w     d0,34(a7)
		lea.l      36(a7),a1
		movea.l    44(a7),a0
		jsr        strcspn
		cmp.l      12(a7),d0
		beq.s      Ast_fcmp_8
		moveq.l    #1,d0
		bra.s      Ast_fcmp_9
Ast_fcmp_8:
		clr.w      d0
Ast_fcmp_9:
		move.w     d0,28(a7)
		lea.l      36(a7),a1
		movea.l    40(a7),a0
		jsr        strcspn
		cmp.l      8(a7),d0
		beq.s      Ast_fcmp_10
		moveq.l    #1,d0
		bra.s      Ast_fcmp_11
Ast_fcmp_10:
		clr.w      d0
Ast_fcmp_11:
		move.w     d0,30(a7)
		move.w     34(a7),d0
		bne.s      Ast_fcmp_12
		move.w     30(a7),d0
		beq.s      Ast_fcmp_13
Ast_fcmp_12:
		clr.w      d0
		bra        Ast_fcmp_3
Ast_fcmp_13:
		move.l     44(a7),4(a7)
		move.l     40(a7),(a7)
		bra        Ast_fcmp_14
Ast_fcmp_34:
		movea.l    4(a7),a0
		move.b     (a0),d0
		ext.w      d0
		lea.l      38(a7),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Ast_fcmp_15
		moveq.l    #1,d0
		bra.s      Ast_fcmp_16
Ast_fcmp_15:
		clr.w      d0
Ast_fcmp_16:
		move.w     d0,20(a7)
		movea.l    (a7),a0
		move.b     (a0),d0
		ext.w      d0
		lea.l      38(a7),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Ast_fcmp_17
		moveq.l    #1,d0
		bra.s      Ast_fcmp_18
Ast_fcmp_17:
		clr.w      d0
Ast_fcmp_18:
		move.w     d0,22(a7)
		movea.l    4(a7),a0
		move.b     (a0),d0
		ext.w      d0
		lea.l      36(a7),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Ast_fcmp_19
		moveq.l    #1,d0
		bra.s      Ast_fcmp_20
Ast_fcmp_19:
		clr.w      d0
Ast_fcmp_20:
		move.w     d0,16(a7)
		movea.l    (a7),a0
		move.b     (a0),d0
		ext.w      d0
		lea.l      36(a7),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Ast_fcmp_21
		moveq.l    #1,d0
		bra.s      Ast_fcmp_22
Ast_fcmp_21:
		clr.w      d0
Ast_fcmp_22:
		move.w     d0,18(a7)
		move.w     20(a7),d0
		bne.s      Ast_fcmp_23
		move.w     16(a7),d0
		beq.s      Ast_fcmp_24
Ast_fcmp_23:
		moveq.l    #1,d0
		bra.s      Ast_fcmp_25
Ast_fcmp_24:
		clr.w      d0
Ast_fcmp_25:
		move.w     d0,24(a7)
		move.w     22(a7),d0
		bne.s      Ast_fcmp_26
		move.w     18(a7),d0
		beq.s      Ast_fcmp_27
Ast_fcmp_26:
		moveq.l    #1,d0
		bra.s      Ast_fcmp_28
Ast_fcmp_27:
		clr.w      d0
Ast_fcmp_28:
		move.w     d0,26(a7)
		move.w     24(a7),d0
		bne.s      Ast_fcmp_29
		move.w     26(a7),d0
		bne.s      Ast_fcmp_29
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		beq.s      Ast_fcmp_30
		clr.w      d0
		bra        Ast_fcmp_3
Ast_fcmp_30:
		addq.l     #1,4(a7)
		addq.l     #1,(a7)
		bra.s      Ast_fcmp_14
Ast_fcmp_29:
		move.w     16(a7),d0
		beq.s      Ast_fcmp_31
		move.w     18(a7),d0
		beq.s      Ast_fcmp_31
		addq.l     #1,4(a7)
		addq.l     #1,(a7)
		bra.s      Ast_fcmp_14
Ast_fcmp_31:
		move.w     24(a7),d0
		beq.s      Ast_fcmp_32
		move.w     26(a7),d0
		bne.s      Ast_fcmp_32
		pea.l      36(a7)
		pea.l      42(a7)
		lea.l      12(a7),a1
		lea.l      8(a7),a0
		bsr        strfsearchafterwc
		addq.w     #8,a7
		tst.w      d0
		bne.s      Ast_fcmp_32
		clr.w      d0
		bra.s      Ast_fcmp_3
Ast_fcmp_32:
		move.w     26(a7),d0
		beq.s      Ast_fcmp_14
		move.w     24(a7),d0
		bne.s      Ast_fcmp_14
		pea.l      36(a7)
		pea.l      42(a7)
		lea.l      8(a7),a1
		lea.l      12(a7),a0
		bsr        strfsearchafterwc
		addq.w     #8,a7
		tst.w      d0
		bne.s      Ast_fcmp_14
		clr.w      d0
		bra.s      Ast_fcmp_3
Ast_fcmp_14:
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      Ast_fcmp_33
		movea.l    (a7),a0
		move.b     (a0),d0
		bne        Ast_fcmp_34
Ast_fcmp_33:
		movea.l    4(a7),a0
		move.b     (a0),d0
		movea.l    (a7),a0
		cmp.b      (a0),d0
		bne.s      Ast_fcmp_35
		moveq.l    #1,d0
		bra.s      Ast_fcmp_3
Ast_fcmp_35:
		clr.w      d0
Ast_fcmp_3:
		lea.l      48(a7),a7
		rts

	.globl Ast_countASCIZZ
Ast_countASCIZZ:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.l     6(a7),2(a7)
		clr.w      (a7)
Ast_countASCIZZ_1:
		addq.w     #1,(a7)
		movea.l    2(a7),a0
		jsr        strlen
		addq.l     #1,d0
		add.l      d0,2(a7)
		movea.l    2(a7),a0
		move.b     (a0),d0
		bne.s      Ast_countASCIZZ_1
		move.w     (a7),d0
		lea.l      10(a7),a7
		rts

	.globl Ast_splitASCIIZZ
Ast_splitASCIIZZ:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     a1,10(a7)
		movea.l    14(a7),a0
		bsr.w      Ast_countASCIZZ
		movea.l    22(a7),a0
		move.w     d0,(a0)
		movea.l    22(a7),a0
		move.w     (a0),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		movea.l    10(a7),a1
		move.l     a0,(a1)
		move.l     (a7),d0
		bne.s      Ast_splitASCIIZZ_1
		clr.w      d0
		bra.s      Ast_splitASCIIZZ_2
Ast_splitASCIIZZ_1:
		move.l     14(a7),4(a7)
		clr.w      8(a7)
		bra.s      Ast_splitASCIIZZ_3
Ast_splitASCIIZZ_4:
		movea.l    4(a7),a0
		bsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,(a1)
		movea.l    4(a7),a0
		jsr        strlen
		addq.l     #1,d0
		add.l      d0,4(a7)
		addq.w     #1,8(a7)
		addq.l     #4,(a7)
Ast_splitASCIIZZ_3:
		movea.l    22(a7),a0
		move.w     8(a7),d0
		cmp.w      (a0),d0
		blt.s      Ast_splitASCIIZZ_4
		moveq.l    #1,d0
Ast_splitASCIIZZ_2:
		lea.l      18(a7),a7
		rts

	.globl Ast_mergeASCIIZZ
Ast_mergeASCIIZZ:
		lea.l      -28(a7),a7
		move.l     a0,24(a7)
		move.w     d0,22(a7)
		move.w     d1,20(a7)
		move.l     #$00000002,4(a7)
		clr.w      18(a7)
		bra        Ast_mergeASCIIZZ_1
Ast_mergeASCIIZZ_7:
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    24(a7),a0
		move.l     0(a0,d0.l),d0
		beq        Ast_mergeASCIIZZ_2
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    24(a7),a0
		movea.l    0(a0,d0.l),a0
		move.b     (a0),d0
		bne.s      Ast_mergeASCIIZZ_3
		addq.l     #2,4(a7)
		bra        Ast_mergeASCIIZZ_2
Ast_mergeASCIIZZ_3:
		move.w     18(a7),d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    24(a7),a0
		movea.l    0(a0,d1.l),a0
		move.b     (a0),d0
		ext.w      d0
		lea.l      xe05e5,a0
		jsr        strchr
		move.l     a0,d0
		bne.s      Ast_mergeASCIIZZ_4
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    24(a7),a0
		movea.l    0(a0,d0.l),a0
		jsr        strlen
		addq.l     #1,d0
		add.l      d0,4(a7)
		bra.s      Ast_mergeASCIIZZ_2
Ast_mergeASCIIZZ_4:
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    24(a7),a0
		movea.l    0(a0,d0.l),a0
		move.b     (a0),d0
		ext.w      d0
		subq.w     #1,d0
		beq.s      Ast_mergeASCIIZZ_5
		subq.w     #1,d0
		beq.s      Ast_mergeASCIIZZ_5
		bra.s      Ast_mergeASCIIZZ_6
Ast_mergeASCIIZZ_5:
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    24(a7),a0
		movea.l    0(a0,d0.l),a0
		jsr        strlen
		add.l      d0,d0
		addq.l     #2,d0
		add.l      d0,4(a7)
		bra.s      Ast_mergeASCIIZZ_2
Ast_mergeASCIIZZ_6:
		addq.l     #2,4(a7)
Ast_mergeASCIIZZ_2:
		addq.w     #1,18(a7)
Ast_mergeASCIIZZ_1:
		move.w     18(a7),d0
		cmp.w      22(a7),d0
		blt        Ast_mergeASCIIZZ_7
		move.w     20(a7),d0
		beq.s      Ast_mergeASCIIZZ_8
		move.l     4(a7),d0
		jsr        Ax_glmalloc
		move.l     a0,(a7)
		bra.s      Ast_mergeASCIIZZ_9
Ast_mergeASCIIZZ_8:
		move.l     4(a7),d0
		jsr        Ax_malloc
		move.l     a0,(a7)
Ast_mergeASCIIZZ_9:
		move.l     (a7),d0
		bne.s      Ast_mergeASCIIZZ_10
		suba.l     a0,a0
		bra        Ast_mergeASCIIZZ_11
Ast_mergeASCIIZZ_10:
		move.l     4(a7),d1
		clr.w      d0
		movea.l    (a7),a0
		jsr        memset
		clr.w      18(a7)
		move.l     (a7),14(a7)
		bra        Ast_mergeASCIIZZ_12
Ast_mergeASCIIZZ_23:
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    24(a7),a0
		move.l     0(a0,d0.l),d0
		beq        Ast_mergeASCIIZZ_13
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    24(a7),a0
		movea.l    0(a0,d0.l),a0
		move.b     (a0),d0
		bne.s      Ast_mergeASCIIZZ_14
		lea.l      xe05ec,a1
		movea.l    14(a7),a0
		jsr        strcpy
		bra        Ast_mergeASCIIZZ_13
Ast_mergeASCIIZZ_14:
		move.w     18(a7),d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    24(a7),a0
		movea.l    0(a0,d1.l),a0
		move.b     (a0),d0
		ext.w      d0
		lea.l      xe05ee,a0
		jsr        strchr
		move.l     a0,d0
		bne.s      Ast_mergeASCIIZZ_15
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    24(a7),a0
		movea.l    0(a0,d0.l),a1
		movea.l    14(a7),a0
		jsr        strcpy
		bra        Ast_mergeASCIIZZ_13
Ast_mergeASCIIZZ_15:
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    24(a7),a0
		movea.l    0(a0,d0.l),a0
		move.b     (a0),d0
		ext.w      d0
		subq.w     #1,d0
		beq.s      Ast_mergeASCIIZZ_16
		subq.w     #1,d0
		beq.s      Ast_mergeASCIIZZ_16
		bra        Ast_mergeASCIIZZ_13
Ast_mergeASCIIZZ_16:
		movea.l    14(a7),a0
		addq.l     #1,14(a7)
		move.b     #$02,(a0)
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    24(a7),a0
		move.l     0(a0,d0.l),10(a7)
		bra.s      Ast_mergeASCIIZZ_17
Ast_mergeASCIIZZ_22:
		movea.l    10(a7),a0
		move.b     (a0),d0
		ext.w      d0
		asr.w      #4,d0
		move.b     d0,8(a7)
		cmpi.b     #$09,8(a7)
		ble.s      Ast_mergeASCIIZZ_18
		moveq.l    #48,d0
		add.b      8(a7),d0
		movea.l    14(a7),a0
		addq.l     #1,14(a7)
		move.b     d0,(a0)
		bra.s      Ast_mergeASCIIZZ_19
Ast_mergeASCIIZZ_18:
		moveq.l    #65,d0
		add.b      8(a7),d0
		movea.l    14(a7),a0
		addq.l     #1,14(a7)
		move.b     d0,(a0)
Ast_mergeASCIIZZ_19:
		moveq.l    #15,d0
		movea.l    10(a7),a0
		and.b      (a0),d0
		move.b     d0,8(a7)
		cmpi.b     #$09,8(a7)
		ble.s      Ast_mergeASCIIZZ_20
		moveq.l    #48,d0
		add.b      8(a7),d0
		movea.l    14(a7),a0
		addq.l     #1,14(a7)
		move.b     d0,(a0)
		bra.s      Ast_mergeASCIIZZ_21
Ast_mergeASCIIZZ_20:
		moveq.l    #65,d0
		add.b      8(a7),d0
		movea.l    14(a7),a0
		addq.l     #1,14(a7)
		move.b     d0,(a0)
Ast_mergeASCIIZZ_21:
		addq.l     #1,10(a7)
Ast_mergeASCIIZZ_17:
		movea.l    10(a7),a0
		move.b     (a0),d0
		bne.w      Ast_mergeASCIIZZ_22
		nop
Ast_mergeASCIIZZ_13:
		addq.w     #1,18(a7)
		movea.l    14(a7),a0
		jsr        strlen
		addq.l     #1,d0
		add.l      d0,14(a7)
Ast_mergeASCIIZZ_12:
		move.w     18(a7),d0
		cmp.w      22(a7),d0
		blt        Ast_mergeASCIIZZ_23
		movea.l    (a7),a0
Ast_mergeASCIIZZ_11:
		lea.l      28(a7),a7
		rts

	.globl Ast_deleteAry
Ast_deleteAry:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.w     d0,6(a7)
		clr.w      4(a7)
		move.l     8(a7),(a7)
		bra.s      Ast_deleteAry_1
Ast_deleteAry_2:
		movea.l    (a7),a0
		movea.l    (a0),a0
		bsr        Ast_delete
		addq.w     #1,4(a7)
		addq.l     #4,(a7)
Ast_deleteAry_1:
		move.w     4(a7),d0
		cmp.w      6(a7),d0
		blt.s      Ast_deleteAry_2
		movea.l    8(a7),a0
		jsr        Ax_free
		lea.l      12(a7),a7
		rts

	.globl Ast_copy
Ast_copy:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.w     d0,8(a7)
		move.l     10(a7),d0
		bne.s      Ast_copy_1
		move.l     #null_string,10(a7)
Ast_copy_1:
		movea.l    10(a7),a0
		jsr        strlen
		move.l     d0,4(a7)
		move.w     8(a7),d0
		beq.s      Ast_copy_2
		moveq.l    #1,d0
		add.l      4(a7),d0
		jsr        Ax_glmalloc
		bra.s      Ast_copy_3
Ast_copy_2:
		moveq.l    #1,d0
		add.l      4(a7),d0
		jsr        Ax_malloc
Ast_copy_3:
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Ast_copy_4
		suba.l     a0,a0
		bra.s      Ast_copy_5
Ast_copy_4:
		move.l     10(a7),d0
		bne.s      Ast_copy_6
		lea.l      xe05f5,a1
		bra.s      Ast_copy_7
Ast_copy_6:
		movea.l    10(a7),a1
Ast_copy_7:
		movea.l    (a7),a0
		jsr        strcpy
Ast_copy_5:
		lea.l      14(a7),a7
		rts

	.globl Ast_reverse
Ast_reverse:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		move.l     8(a7),d0
		bne.s      Ast_reverse_1
		move.l     #null_string,8(a7)
Ast_reverse_1:
		move.l     8(a7),(a7)
		bra.s      Ast_reverse_2
Ast_reverse_3:
		addq.l     #1,(a7)
Ast_reverse_2:
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      Ast_reverse_3
		move.l     12(a7),4(a7)
		subq.l     #1,(a7)
		bra.s      Ast_reverse_4
Ast_reverse_5:
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.b     (a0),(a1)
		subq.l     #1,(a7)
		addq.l     #1,4(a7)
Ast_reverse_4:
		movea.l    (a7),a0
		cmpa.l     8(a7),a0
		bcc.s      Ast_reverse_5
		movea.l    4(a7),a0
		clr.b      (a0)
		movea.l    12(a7),a0
		lea.l      16(a7),a7
		rts

	.data

	.globl null_string
null_string: dc.b 0
xe05db:      dc.b $2a,0
xe05dd:      dc.b $3f,0,0
xe05e0:
		dc.b ' ',$09,$0a,$0d,0
xe05e5:
		dc.b $01
		dc.w $0203
		dc.w $0405
		dc.w $0600
xe05ec:
		dc.w $0100
xe05ee:
		dc.b $01,02,$03,04,$05,06,0
xe05f5:
		dc.b 00
	.even
