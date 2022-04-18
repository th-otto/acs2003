		.text

	.globl ob_make
ob_make:
		movem.l    d3/a2-a4,-(a7)
		lea.l      -76(a7),a7
		movea.l    a0,a4
		move.l     4(a4),72(a7)
		movea.l    72(a7),a1
		move.l     18(a1),64(a7)
		move.l     64(a7),d0
		beq.s      ob_make_1
		movea.l    d0,a0
		jsr        Awi_show
		bra        ob_make_2
ob_make_1:
		moveq.l    #50,d0
		jsr        Ax_malloc
		move.l     a0,68(a7)
		move.l     a0,d0
		beq        ob_make_3
		move.l     (a4),(a0)
		move.l     4(a4),4(a0)
		move.w     #$0001,8(a0)
		move.w     #$0002,24(a0)
		clr.w      10(a0)
		clr.l      30(a0)
		lea.l      WI_OBJECT,a3
		movea.l    72(a7),a0
		lea.l      22(a0),a0
		move.l     a0,78(a3)
		movea.l    90(a3),a1
		move.l     a0,8(a1)
		movea.l    a3,a0
		jsr        Awi_create
		move.l     a0,64(a7)
		move.l     a0,d0
		bne.s      ob_make_4
		movea.l    68(a7),a0
		jsr        Ax_free
		bra        ob_make_3
ob_make_4:
		movea.l    (a4),a0
		pea.l      360(a0)
		movea.l    76(a7),a1
		lea.l      58(a1),a1
		movea.l    68(a7),a0
		jsr        wi_pos
		addq.w     #4,a7
		movea.l    64(a7),a0
		move.l     68(a7),(a0)
		movea.l    72(a7),a1
		move.l     a0,18(a1)
		move.l     #$000002BA,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     a0,d0
		beq        ob_make_3
		lea.l      31(a0),a0
		move.l     a0,4(a7)
		lea.l      31(a0),a0
		move.l     a0,8(a7)
		lea.l      31(a0),a0
		move.l     a0,12(a7)
		lea.l      31(a0),a0
		move.l     a0,16(a7)
		lea.l      31(a0),a0
		move.l     a0,20(a7)
		lea.l      31(a0),a0
		move.l     a0,24(a7)
		lea.l      256(a0),a0
		move.l     a0,28(a7)
		lea.l      xbb5b0,a1
		movea.l    (a7),a0
		jsr        strcpy
		move.l     (a7),32(a7)
		move.l     4(a7),36(a7)
		move.l     8(a7),40(a7)
		move.l     12(a7),44(a7)
		move.l     16(a7),48(a7)
		move.l     20(a7),52(a7)
		movea.l    64(a7),a0
		move.l     (a0),60(a7)
		movea.l    60(a7),a1
		movea.l    4(a1),a4
		move.l     4(a4),56(a7)
		move.l     14(a4),d0
		moveq.l    #56,d1
		jsr        _uldiv
		move.l     d0,d3
		bra        ob_make_5
ob_make_12:
		move.l     56(a7),d0
		beq        ob_make_6
		movea.l    d0,a0
		cmpi.b     #$18,15(a0)
		bne        ob_make_6
		movea.l    20(a0),a4
		move.l     a4,d1
		beq        ob_make_6
		movea.l    4(a4),a2
		move.l     a2,d1
		beq        ob_make_6
		lea.l      xbb5bb,a1
		movea.l    (a2),a0
		lea.l      22(a0),a0
		jsr        strcmp
		tst.w      d0
		bne        ob_make_6
		movea.l    4(a7),a1
		movea.l    4(a2),a0
		jsr        set_ref
		movea.l    8(a7),a1
		movea.l    8(a2),a0
		jsr        set_ref
		movea.l    12(a7),a1
		movea.l    12(a2),a0
		jsr        set_ref
		movea.l    16(a7),a1
		movea.l    16(a2),a0
		jsr        set_ref
		movea.l    20(a7),a1
		movea.l    20(a2),a0
		jsr        set_ref
		move.l     24(a2),d0
		bne.s      ob_make_7
		movea.l    24(a7),a0
		clr.b      (a0)
		bra.s      ob_make_8
ob_make_7:
		movea.l    24(a2),a0
		movea.l    4(a0),a1
		movea.l    24(a7),a0
		jsr        strcpy
ob_make_8:
		move.l     28(a2),d0
		bne.s      ob_make_9
		movea.l    28(a7),a0
		clr.b      (a0)
		bra.s      ob_make_10
ob_make_9:
		movea.l    28(a2),a0
		movea.l    4(a0),a1
		movea.l    28(a7),a0
		jsr        strcpy
ob_make_10:
		pea.l      32(a7)
		movea.l    a4,a1
		movea.l    64(a7),a0
		movea.l    (a0),a0
		jsr        change_user
		addq.w     #4,a7
		move.l     a0,d0
		beq.s      ob_make_6
		movea.l    56(a7),a1
		move.l     d0,20(a1)
ob_make_6:
		addi.l     #$00000038,56(a7)
		subq.w     #1,d3
ob_make_5:
		move.l     56(a7),d0
		beq.s      ob_make_11
		tst.w      d3
		bne        ob_make_12
ob_make_11:
		lea.l      (a7),a0
		jsr        Ax_free
		movea.l    64(a7),a0
		movea.l    64(a7),a1
		movea.l    12(a1),a1
		jsr        (a1)
		tst.w      d0
		beq.s      ob_make_2
		movea.l    64(a7),a0
		jsr        ed_term
ob_make_3:
		suba.l     a0,a0
		bra.s      ob_make_13
ob_make_2:
		movea.l    64(a7),a0
ob_make_13:
		lea.l      76(a7),a7
		movem.l    (a7)+,d3/a2-a4
		rts

	.data

xbb5b0:
		dc.b 'A_checkbox',0
xbb5bb:
		dc.b 'A_radiobutton',0
		.even
