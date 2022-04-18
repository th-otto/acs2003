	.globl Aus_create23x
Aus_create23x:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		moveq.l    #32,d0
		jsr        Ax_malloc
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      Aus_create23x_1
		suba.l     a0,a0
		bra.s      Aus_create23x_2
Aus_create23x_1:
		moveq.l    #24,d0
		movea.l    a3,a1
		movea.l    a2,a0
		jsr        memcpy
		lea.l      xe4998,a0
		jsr        Ast_create
		move.l     a0,28(a2)
		move.l     a0,24(a2)
		movea.l    a2,a0
Aus_create23x_2:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl Aob_create23x
Aob_create23x:
		movem.l    d3/a2-a6,-(a7)
		subq.w     #2,a7
		movea.l    a0,a4
		moveq.l    #0,d3
		movea.l    a0,a2
Aob_create23x_1:
		add.l      #$00000018,d3
		moveq.l    #32,d0
		movea.l    a2,a0
		lea.l      24(a2),a2
		and.w      8(a0),d0
		beq.s      Aob_create23x_1
		move.l     d3,d0
		jsr        Ax_malloc
		movea.l    a0,a3
		move.l     a3,d0
		beq        Aob_create23x_2
		movea.l    a4,a1
		move.l     d3,d0
		jsr        memcpy
		clr.w      (a7)
		movea.l    a3,a2
		movea.l    a2,a5
Aob_create23x_12:
		move.w     8(a2),d0
		and.w      #$8000,d0
		bne        Aob_create23x_3
		move.w     10(a2),d1
		and.w      #$2000,d1
		bne        Aob_create23x_3
		move.b     7(a2),d2
		ext.w      d2
		sub.w      #$0015,d2
		cmp.w      #$000C,d2
		bhi        Aob_create23x_4
		add.w      d2,d2
		move.w     J60(pc,d2.w),d2
		jmp        J60(pc,d2.w)
J60:
		dc.w Aob_create23x_5-J60
		dc.w Aob_create23x_5-J60
		dc.w Aob_create23x_6-J60
		dc.w Aob_create23x_7-J60
		dc.w Aob_create23x_4-J60
		dc.w Aob_create23x_8-J60
		dc.w Aob_create23x_4-J60
		dc.w Aob_create23x_8-J60
		dc.w Aob_create23x_5-J60
		dc.w Aob_create23x_5-J60
		dc.w Aob_create23x_9-J60
		dc.w Aob_create23x_8-J60
		dc.w Aob_create23x_9-J60
Aob_create23x_5:
		movea.l    12(a2),a0
		jsr        Ate_create
		movea.l    a0,a5
		move.l     a0,12(a2)
		bra.s      Aob_create23x_4
Aob_create23x_7:
		movea.l    12(a2),a0
		bsr        Aus_create23x
		movea.l    a0,a4
		movea.l    a4,a5
		move.l     a5,12(a2)
		move.l     8(a4),d0
		beq.s      Aob_create23x_10
		lea.l      (a7),a1
		movea.l    d0,a6
		movea.l    a2,a0
		moveq.l    #1,d0
		jsr        (a6)
Aob_create23x_10:
		cmpi.w     #$FFFF,(a7)
		bne.s      Aob_create23x_4
		bra.s      Aob_create23x_2
Aob_create23x_6:
		movea.l    12(a2),a0
		jsr        Aim_create
		movea.l    a0,a5
		move.l     a0,12(a2)
		bra.s      Aob_create23x_4
Aob_create23x_9:
		movea.l    12(a2),a0
		jsr        Aic_create
		movea.l    a0,a5
		move.l     a0,12(a2)
		bra.s      Aob_create23x_4
Aob_create23x_8:
		movea.l    12(a2),a0
		jsr        Ast_create
		movea.l    a0,a5
		move.l     a0,12(a2)
Aob_create23x_4:
		move.l     a5,d0
		bne.s      Aob_create23x_3
Aob_create23x_2:
		suba.l     a0,a0
		bra.s      Aob_create23x_11
Aob_create23x_3:
		moveq.l    #32,d0
		movea.l    a2,a0
		lea.l      24(a2),a2
		and.w      8(a0),d0
		beq        Aob_create23x_12
		movea.l    a3,a0
Aob_create23x_11:
		addq.w     #2,a7
		movem.l    (a7)+,d3/a2-a6
		rts

	.globl Awi_create23x
Awi_create23x:
		movem.l    d3/a2-a6,-(a7)
		movea.l    a0,a3
		move.l     #$000000A2,d0
		jsr        Ax_malloc
		movea.l    a0,a2
		move.l     #$0000008E,d0
		movea.l    a3,a1
		jsr        memcpy
		move.l     #Awi_iconify,142(a2)
		move.l     #Awi_uniconify,146(a2)
		move.l     #Awi_gemscript,150(a2)
		lea.l      xe4998,a0
		jsr        Ast_create
		move.l     a0,158(a2)
		move.l     a0,154(a2)
		move.l     20(a2),d0
		beq.s      Awi_create23x_1
		movea.l    d0,a0
		bsr        Aob_create23x
		move.l     a0,20(a2)
		move.l     a0,d0
		beq.w      Awi_create23x_2
		jsr        Aob_fix
Awi_create23x_1:
		move.l     24(a2),d0
		beq.s      Awi_create23x_3
		movea.l    d0,a0
		bsr        Aob_create23x
		move.l     a0,24(a2)
		move.l     a0,d0
		beq.s      Awi_create23x_4
		jsr        Aob_fix
Awi_create23x_3:
		move.l     94(a2),d0
		beq.s      Awi_create23x_5
		movea.l    d0,a0
		bsr        Aob_create23x
		move.l     a0,94(a2)
		move.l     a0,d0
		beq.s      Awi_create23x_6
		jsr        Aob_fix
		movea.l    94(a2),a0
		jsr        Ame_namefix
Awi_create23x_5:
		move.l     90(a2),d0
		beq.s      Awi_create23x_7
		movea.l    d0,a0
		jsr        Aic_create
		move.l     a0,90(a2)
		move.l     a0,d0
		bne.s      Awi_create23x_7
		movea.l    94(a2),a0
		jsr        Aob_delete
Awi_create23x_6:
		movea.l    24(a2),a0
		jsr        Aob_delete
Awi_create23x_4:
		movea.l    20(a2),a0
		jsr        Aob_delete
Awi_create23x_2:
		movea.l    a2,a0
		jsr        Ax_free
		bra        Awi_create23x_8
Awi_create23x_7:
		movea.l    a2,a0
		jsr        Awi_uoself
		move.l     74(a2),d0
		beq.s      Awi_create23x_9
		movea.l    d0,a0
		jsr        Ast_create
		move.l     a0,74(a2)
Awi_create23x_9:
		move.l     78(a2),d0
		beq.s      Awi_create23x_10
		movea.l    d0,a0
		jsr        Ast_create
		move.l     a0,78(a2)
Awi_create23x_10:
		move.w     #$0004,86(a2)
		move.w     #$FFFF,88(a2)
		move.w     #$FFFF,28(a2)
		clr.w      82(a2)
		clr.w      d3
		lea.l      _ACSv_winds,a3
		lea.l      Aroot_wi,a5
		lea.l      ACSblk,a4
		bra.w      Awi_create23x_11
Awi_create23x_16:
		move.w     d3,d0
		lsl.w      #2,d0
		move.l     0(a3,d0.w),d1
		bne.s      Awi_create23x_12
		cmp.w      _Wmax_wi,d3
		ble.s      Awi_create23x_13
		move.w     d3,_Wmax_wi
Awi_create23x_13:
		move.w     d3,d0
		lsl.w      #2,d0
		move.l     a2,0(a3,d0.w)
		move.l     (a5),d1
		beq.s      Awi_create23x_14
		moveq.l    #1,d2
		and.w      84(a2),d2
		beq.s      Awi_create23x_14
		movea.l    a2,a1
		movea.l    d1,a0
		movea.l    d1,a6
		movea.l    4(a6),a6
		moveq.l    #100,d0
		jsr        (a6)
Awi_create23x_14:
		move.w     36(a2),d0
		movea.l    (a4),a0
		muls.w     18(a0),d0
		move.w     d0,36(a2)
		move.w     38(a2),d1
		movea.l    (a4),a0
		muls.w     20(a0),d1
		move.w     d1,38(a2)
		move.w     40(a2),d0
		movea.l    (a4),a0
		muls.w     18(a0),d0
		move.w     d0,40(a2)
		move.w     42(a2),d1
		movea.l    (a4),a0
		muls.w     20(a0),d1
		move.w     d1,42(a2)
		movea.l    a2,a0
		bra.s      Awi_create23x_15
Awi_create23x_12:
		addq.w     #1,d3
Awi_create23x_11:
		cmp.w      #$0100,d3
		blt.w      Awi_create23x_16
		movea.l    _globl,a1
		lea.l      _A_ERR_WISLOT,a0
		moveq.l    #1,d0
		jsr        mt_form_alert
Awi_create23x_8:
		suba.l     a0,a0
Awi_create23x_15:
		movem.l    (a7)+,d3/a2-a6
		rts

	.globl Awi_arrowed23x
Awi_arrowed23x:
		moveq.l    #1,d1
		jsr        Awi_arrowed
		rts

	.globl Af_first230
Af_first230:
		suba.l     a1,a1
		jsr        Af_first
		rts

	.globl Af_next230
Af_next230:
		suba.l     a0,a0
		jsr        Af_next
		rts

	.data

xe4998:
		dc.b 0
		.even
