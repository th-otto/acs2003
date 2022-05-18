		.text

editte_ok:
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        term
		rts

tedi_make:
		movem.l    a2-a4,-(a7)
		subq.w     #4,a7
		movea.l    a0,a2
		movea.l    4(a2),a3
		movea.l    18(a3),a4
		move.l     a4,d0
		beq.s      tedi_make_1
		movea.l    a4,a0
		jsr        Awi_show
		bra.s      tedi_make_2
tedi_make_1:
		moveq.l    #8,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     a0,d0
		beq.s      tedi_make_3
		move.l     (a2),(a0)
		move.l     4(a2),4(a0)
		lea.l      22(a3),a1
		move.l     a1,WI_TEDI+78
		movea.l    WI_TEDI+90,a0
		move.l     a1,8(a0)
		lea.l      WI_TEDI,a0
		jsr        Awi_create
		movea.l    a0,a4
		move.l     a4,d0
		beq.s      tedi_make_3
		movea.l    (a2),a1
		pea.l      360(a1)
		lea.l      58(a3),a1
		jsr        wi_pos
		addq.w     #4,a7
		move.l     (a7),(a4)
		move.l     a4,18(a3)
		movea.l    a4,a0
		jsr        set_tedi
		movea.l    a4,a0
		movea.l    12(a4),a1
		jsr        (a1)
		tst.w      d0
		beq.s      tedi_make_2
		movea.l    a4,a0
		jsr        term
tedi_make_3:
		suba.l     a0,a0
		bra.s      tedi_make_4
tedi_make_2:
		movea.l    a4,a0
tedi_make_4:
		addq.w     #4,a7
		movem.l    (a7)+,a2-a4
		rts

tedi_service:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		movea.l    a1,a4
		movea.l    (a0),a3
		subq.w     #2,d0
		beq.s      tedi_service_1
		sub.w      #$270E,d0
		beq.s      tedi_service_2
		bra.s      tedi_service_3
tedi_service_1:
		movea.l    a2,a0
		jsr        term
		bra.s      tedi_service_4
tedi_service_2:
		movea.l    4(a3),a1
		movea.l    a2,a0
		jsr        new_name
		bra.s      tedi_service_4
tedi_service_3:
		movea.l    a4,a1
		move.w     d3,d0
		movea.l    a2,a0
		jsr        Awi_service
		bra.s      tedi_service_5
tedi_service_4:
		moveq.l    #1,d0
tedi_service_5:
		movem.l    (a7)+,d3/a2-a4
		rts

set_tedi:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    (a0),a1
		movea.l    20(a0),a2
		movea.l    4(a1),a0
		movea.l    4(a0),a3
		movea.l    (a3),a1
		movea.l    4(a1),a1
		moveq.l    #3,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		movea.l    4(a3),a0
		movea.l    4(a0),a1
		moveq.l    #5,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		movea.l    8(a3),a0
		movea.l    4(a0),a1
		moveq.l    #7,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
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
