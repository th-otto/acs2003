		.text

	.globl editus_ok
editus_ok:
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        term
		rts

	.globl user_make
user_make:
		movem.l    a2-a4,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		suba.l     a3,a3
		movea.l    4(a0),a4
		movea.l    18(a4),a2
		move.l     a2,d0
		beq.s      user_make_1
		movea.l    a2,a0
		jsr        Awi_show
		bra.w      user_make_2
user_make_1:
		moveq.l    #8,d0
		jsr        Ax_malloc
		movea.l    a0,a3
		move.l     a3,d0
		beq.s      user_make_3
		movea.l    (a7),a1
		move.l     (a1),(a0)
		move.l     4(a1),4(a3)
		lea.l      22(a4),a0
		move.l     a0,WI_USER+78
		movea.l    WI_USER+90,a1
		move.l     a0,8(a1)
		lea.l      WI_USER,a0
		jsr        Awi_create
		movea.l    a0,a2
		move.l     a2,d0
		beq.s      user_make_3
		movea.l    (a7),a1
		movea.l    (a1),a0
		pea.l      360(a0)
		lea.l      58(a4),a1
		movea.l    a2,a0
		jsr        wi_pos
		addq.w     #4,a7
		move.l     a3,(a2)
		move.l     a2,18(a4)
		movea.l    a2,a0
		jsr        set_user
		movea.l    a2,a0
		movea.l    12(a2),a1
		jsr        (a1)
		tst.w      d0
		beq.s      user_make_2
		movea.l    a2,a0
		jsr        term
user_make_3:
		suba.l     a0,a0
		bra.s      user_make_4
user_make_2:
		movea.l    a2,a0
user_make_4:
		addq.w     #4,a7
		movem.l    (a7)+,a2-a4
		rts

	.globl user_service
user_service:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		movea.l    a1,a4
		movea.l    (a0),a3
		subq.w     #2,d0
		beq.s      user_service_1
		sub.w      #$270E,d0
		beq.s      user_service_2
		bra.s      user_service_3
user_service_1:
		movea.l    a2,a0
		jsr        term
		bra.s      user_service_4
user_service_2:
		movea.l    4(a3),a1
		movea.l    a2,a0
		jsr        new_name
		bra.s      user_service_4
user_service_3:
		movea.l    a4,a1
		move.w     d3,d0
		movea.l    a2,a0
		jsr        Awi_service
		bra.s      user_service_5
user_service_4:
		moveq.l    #1,d0
user_service_5:
		movem.l    (a7)+,d3/a2-a4
		rts

set_user:
		movem.l    a2-a4,-(a7)
		subq.w     #4,a7
		movea.l    (a0),a1
		move.l     20(a0),(a7)
		movea.l    4(a1),a0
		movea.l    4(a0),a3
		movea.l    (a3),a1
		lea.l      22(a1),a1
		moveq.l    #8,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    4(a3),a1
		lea.l      22(a1),a1
		moveq.l    #9,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a3),a4
		move.l     a4,d0
		beq.s      set_user_1
		lea.l      22(a4),a2
		bra.s      set_user_2
set_user_1:
		lea.l      xb32b8,a2
set_user_2:
		movea.l    a2,a1
		moveq.l    #10,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    12(a3),a4
		move.l     a4,d0
		beq.s      set_user_3
		lea.l      22(a4),a2
		bra.s      set_user_4
set_user_3:
		lea.l      xb32b8,a2
set_user_4:
		movea.l    a2,a1
		moveq.l    #11,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    16(a3),a4
		move.l     a4,d0
		beq.s      set_user_5
		lea.l      22(a4),a2
		bra.s      set_user_6
set_user_5:
		lea.l      xb32b8,a2
set_user_6:
		movea.l    a2,a1
		moveq.l    #12,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    20(a3),a4
		move.l     a4,d0
		beq.s      set_user_7
		lea.l      22(a4),a2
		bra.s      set_user_8
set_user_7:
		lea.l      xb32b8,a2
set_user_8:
		movea.l    a2,a1
		moveq.l    #13,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		addq.w     #4,a7
		movem.l    (a7)+,a2-a4
		rts

term:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		ori.w      #$0100,86(a2)
		movea.l    (a0),a3
		movea.l    4(a3),a1
		clr.l      18(a1)
		move.w     86(a2),d0
		and.w      #$0800,d0
		beq.s      term_1
		lea.l      44(a2),a1
		movea.l    4(a3),a0
		lea.l      58(a0),a0
		moveq.l    #8,d0
		jsr        memcpy
		bra.s      term_2
term_1:
		moveq.l    #8,d0
		lea.l      36(a2),a1
		movea.l    4(a3),a0
		lea.l      58(a0),a0
		jsr        memcpy
term_2:
		movea.l    a3,a0
		jsr        Ax_free
		movea.l    a2,a0
		jsr        Awi_closed
		movea.l    a2,a0
		jsr        Awi_delete
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.data

xb32b8:
		dc.b '- NULL -',0
		.even
