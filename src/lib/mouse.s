	.globl INmouse
INmouse:
		move.w     init,d0
		addq.w     #1,init
		tst.w      d0
		beq.s      INmouse_1
		clr.w      d0
		rts
INmouse_1:
		clr.w      hide
		jsr        Amo_point
		clr.w      d0
		rts

	.globl TRmouse
TRmouse:
		jsr        Amo_point
		rts

	.globl Amo_new
Amo_new:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.w     prevmouse,d0
		cmp.w      (a0),d0
		bne.s      Amo_new_1
		movea.l    (a7),a0
		movea.l    prevmouse+2,a1
		cmpa.l     2(a0),a1
		bne.s      Amo_new_1
		bra.s      Amo_new_2
Amo_new_1:
		movea.l    (a7),a0
		move.w     (a0),prevmouse
		movea.l    (a7),a0
		move.l     2(a0),prevmouse+2
		move.w     hide,d0
		beq.s      Amo_new_3
		bra.s      Amo_new_2
Amo_new_3:
		movea.l    _globl,a1
		movea.l    (a7),a0
		movea.l    2(a0),a0
		movea.l    (a7),a2
		move.w     (a2),d0
		jsr        mt_graf_mouse
Amo_new_2:
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

	.globl Amo_point
Amo_point:
		clr.w      busy
		bra.s      Amo_point_1
Amo_point_2:
		jsr        Amo_show
Amo_point_1:
		move.w     hide,d0
		bne.s      Amo_point_2
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      56(a0),a0
		bsr.w      Amo_new
		rts

	.globl Amo_busy
Amo_busy:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.w     busy,d0
		addq.w     #1,busy
		tst.w      d0
		beq.s      Amo_busy_1
		bra.s      Amo_busy_2
Amo_busy_1:
		move.w     hide,d0
		beq.s      Amo_busy_3
		bra.s      Amo_busy_2
Amo_busy_3:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      62(a0),a0
		move.l     a0,(a7)
		movea.l    _globl,a1
		movea.l    (a7),a0
		movea.l    2(a0),a0
		movea.l    (a7),a2
		move.w     (a2),d0
		jsr        mt_graf_mouse
Amo_busy_2:
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

	.globl Amo_unbusy
Amo_unbusy:
		subq.w     #1,busy
		ble.s      Amo_unbusy_1
		rts
Amo_unbusy_1:
		clr.w      busy
		move.w     hide,d0
		beq.s      Amo_unbusy_2
		rts
Amo_unbusy_2:
		movea.l    _globl,a1
		movea.l    prevmouse+2,a0
		move.w     prevmouse,d0
		jsr        mt_graf_mouse
		rts

	.globl Amo_hide
Amo_hide:
		move.w     hide,d0
		addq.w     #1,hide
		tst.w      d0
		beq.s      Amo_hide_1
		rts
Amo_hide_1:

		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0100,d0
		jsr        mt_graf_mouse
		rts

	.globl Amo_show
Amo_show:
		subq.w     #1,hide
		ble.s      Amo_show_1
		rts
Amo_show_1:

		clr.w      hide
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0101,d0
		jsr        mt_graf_mouse
		movea.l    _globl,a1
		movea.l    prevmouse+2,a0
		move.w     prevmouse,d0
		jsr        mt_graf_mouse
		rts

	.globl Amo_restart
Amo_restart:
		move.l     a2,-(a7)
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     busy,4(a7)
		clr.w      busy
		movea.l    6(a7),a0
		move.w     prevmouse,(a0)
		movea.l    6(a7),a0
		move.l     prevmouse+2,2(a0)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      56(a0),a0
		move.l     a0,(a7)
		movea.l    _globl,a1
		movea.l    (a7),a0
		movea.l    2(a0),a0
		movea.l    (a7),a2
		move.w     (a2),d0
		jsr        mt_graf_mouse
		move.w     4(a7),d0
		lea.l      10(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Amo_return
Amo_return:
		move.l     a2,-(a7)
		subq.w     #6,a7
		move.w     d0,4(a7)
		move.l     a0,(a7)
		move.w     4(a7),busy
		movea.l    (a7),a0
		move.w     (a0),prevmouse
		movea.l    (a7),a0
		move.l     2(a0),prevmouse+2
		move.w     hide,d0
		beq.s      Amo_return_1
		bra.s      Amo_return_2
Amo_return_1:
		move.w     busy,d0
		beq.s      Amo_return_3
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      62(a0),a0
		move.l     a0,(a7)
Amo_return_3:
		movea.l    _globl,a1
		movea.l    (a7),a0
		movea.l    2(a0),a0
		movea.l    (a7),a2
		move.w     (a2),d0
		jsr        mt_graf_mouse
Amo_return_2:
		addq.w     #6,a7
		movea.l    (a7)+,a2
		rts

	.data

init:
		dc.w $0000
prevmouse:
		dc.w $ffff
		dc.l 0
