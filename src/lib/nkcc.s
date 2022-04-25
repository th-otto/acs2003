	.globl nkc_gemks2n
nkc_gemks2n:
		subq.w     #4,a7
		move.w     d0,2(a7)
		move.w     d1,(a7)
		move.w     2(a7),d0
		and.w      #0x00FF,d0
		ext.l      d0
		move.w     2(a7),d1
		ext.l      d1
		and.l      #0x0000FF00,d1
		lsl.l      #8,d1
		or.l       d1,d0
		move.w     (a7),d1
		and.w      #0x00FF,d1
		ext.l      d1
		moveq.l    #24,d2
		lsl.l      d2,d1
		or.l       d1,d0
		jsr        nkc_tos2n
		and.w      #0xBFFF,d0
		addq.w     #4,a7
		rts

	.globl nkc_gem2n
nkc_gem2n:
		subq.w     #2,a7
		move.w     d0,(a7)
		jsr        nkc_kstate
		move.w     (a7),d1
		bsr.w      nkc_gemks2n
		addq.w     #2,a7
		rts

	.globl nkc_n2gemks
nkc_n2gemks:
		lea.l      -14(a7),a7
		move.w     d0,12(a7)
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		move.w     12(a7),d0
		jsr        nkc_n2tos
		move.l     d0,(a7)
		move.l     4(a7),d0
		beq.s      nkc_n2gemks_1
		move.w     2(a7),d0
		and.w      #0x00FF,d0
		move.l     (a7),d1
		and.l      #0x00FF0000,d1
		asr.l      #8,d1
		or.w       d1,d0
		movea.l    4(a7),a0
		move.w     d0,(a0)
nkc_n2gemks_1:
		move.l     8(a7),d0
		beq.s      nkc_n2gemks_2
		move.l     (a7),d0
		and.l      #0xFF000000,d0
		moveq.l    #24,d1
		lsr.l      d1,d0
		movea.l    8(a7),a0
		move.w     d0,(a0)
nkc_n2gemks_2:
		lea.l      14(a7),a7
		rts

	.globl nkc_n2gem
nkc_n2gem:
		subq.w     #6,a7
		move.w     d0,4(a7)
		move.w     4(a7),d0
		jsr        nkc_n2tos
		move.l     d0,(a7)
		move.w     2(a7),d0
		and.w      #0x00FF,d0
		move.l     (a7),d1
		and.l      #0x00FF0000,d1
		asr.l      #8,d1
		or.w       d1,d0
		addq.w     #6,a7
		rts

	.globl nkc_n2kstate
nkc_n2kstate:
		subq.w     #2,a7
		move.w     d0,(a7)
		move.w     (a7),d0
		jsr        nkc_n2tos
		and.l      #0xFF000000,d0
		moveq.l    #24,d1
		lsr.l      d1,d0
		addq.w     #2,a7
		rts

	.globl nkc_kstate
nkc_kstate:
		subq.w     #4,a7
		move.l     pshift,d0
		bne.s      nkc_kstate_1
		jsr        Ash_getOSHeader
		move.l     a0,(a7)
		movea.l    (a7),a0
		cmpi.w     #0x0100,2(a0)
		beq.s      nkc_kstate_2
		movea.l    (a7),a0
		move.l     36(a0),pshift
		bra.s      nkc_kstate_1
nkc_kstate_2:
		move.l     #0x00000E1B,pshift
nkc_kstate_1:
		moveq.l    #31,d0
		movea.l    pshift,a0
		and.w      2(a0),d0
		lsl.w      #8,d0
		addq.w     #4,a7
		rts

	.globl nkc_cmp
nkc_cmp:
		lea.l      -10(a7),a7
		move.w     d0,8(a7)
		move.w     d1,6(a7)
		move.w     8(a7),d0
		move.w     6(a7),d1
		eor.w      d1,d0
		move.w     d0,4(a7)
		moveq.l    #-1,d0
		and.b      9(a7),d0
		move.b     d0,1(a7)
		moveq.l    #-1,d0
		and.b      7(a7),d0
		move.b     d0,(a7)
		move.w     4(a7),d0
		bne.s      nkc_cmp_1
		moveq.l    #1,d0
		bra        nkc_cmp_2
		bra        nkc_cmp_3
nkc_cmp_1:
		move.w     4(a7),d0
		and.w      #0x8000,d0
		beq        nkc_cmp_4
		move.w     4(a7),d0
		and.w      #0x0C00,d0
		beq.s      nkc_cmp_5
		clr.w      d0
		bra        nkc_cmp_2
nkc_cmp_5:
		cmpi.b     #0x20,1(a7)
		blt.s      nkc_cmp_6
		move.w     8(a7),d0
		bne.s      nkc_cmp_7
		moveq.l    #1,d0
		bra.s      nkc_cmp_8
nkc_cmp_7:
		clr.w      d0
nkc_cmp_8:
		and.w      #0x4000,d0
		beq.s      nkc_cmp_9
		move.w     4(a7),d0
		and.w      #0x2000,d0
		beq.s      nkc_cmp_9
		clr.w      d0
		bra        nkc_cmp_2
nkc_cmp_9:
		move.b     1(a7),d0
		cmp.b      (a7),d0
		beq.s      nkc_cmp_10
		clr.w      d0
		bra        nkc_cmp_2
nkc_cmp_10:
		move.w     6(a7),d0
		bne.s      nkc_cmp_11
		moveq.l    #1,d0
		bra.s      nkc_cmp_12
nkc_cmp_11:
		clr.w      d0
nkc_cmp_12:
		and.w      #0x4000,d0
		beq.s      nkc_cmp_13
		moveq.l    #1,d0
		bra        nkc_cmp_2
nkc_cmp_13:
		bra.s      nkc_cmp_14
nkc_cmp_6:
		move.b     1(a7),d0
		cmp.b      (a7),d0
		beq.s      nkc_cmp_14
		clr.w      d0
		bra        nkc_cmp_2
nkc_cmp_14:
		move.w     4(a7),d0
		bne.s      nkc_cmp_15
		moveq.l    #1,d0
		bra.s      nkc_cmp_16
nkc_cmp_15:
		clr.w      d0
nkc_cmp_16:
		and.w      #0x0300,d0
		beq.s      nkc_cmp_17
		moveq.l    #1,d0
		bra        nkc_cmp_2
nkc_cmp_17:
		move.w     8(a7),d0
		and.w      #0x0300,d0
		cmp.w      #0x0300,d0
		beq.s      nkc_cmp_18
		clr.w      d0
		bra        nkc_cmp_2
nkc_cmp_18:
		move.w     6(a7),d0
		and.w      #0x0300,d0
		beq.s      nkc_cmp_19
		moveq.l    #1,d0
		bra.s      nkc_cmp_20
nkc_cmp_19:
		clr.w      d0
nkc_cmp_20:
		bra        nkc_cmp_2
		bra        nkc_cmp_3
nkc_cmp_4:
		move.w     8(a7),d0
		bne.s      nkc_cmp_21
		moveq.l    #1,d0
		bra.s      nkc_cmp_22
nkc_cmp_21:
		clr.w      d0
nkc_cmp_22:
		and.w      #0x4000,d0
		beq.s      nkc_cmp_23
		move.w     4(a7),d0
		and.w      #0x2000,d0
		beq.s      nkc_cmp_23
		clr.w      d0
		bra        nkc_cmp_2
nkc_cmp_23:
		move.w     8(a7),d0
		jsr        nkc_toupper
		move.b     d0,2(a7)
		move.b     1(a7),d0
		cmp.b      (a7),d0
		beq.s      nkc_cmp_24
		move.w     8(a7),d0
		and.w      #0x1000,d0
		beq.s      nkc_cmp_25
		move.w     6(a7),d0
		jsr        nkc_toupper
		/* and.b      #0xFF,d0 */
		dc.w 0xc03c,0xffff
		move.b     2(a7),d1
		cmp.b      d0,d1
		bne.s      nkc_cmp_26
		moveq.l    #1,d0
		bra.s      nkc_cmp_27
nkc_cmp_26:
		clr.w      d0
nkc_cmp_27:
		bra.s      nkc_cmp_2
		bra.s      nkc_cmp_24
nkc_cmp_25:
		clr.w      d0
		bra.s      nkc_cmp_2
nkc_cmp_24:
		move.w     6(a7),d0
		bne.s      nkc_cmp_28
		moveq.l    #1,d0
		bra.s      nkc_cmp_29
nkc_cmp_28:
		clr.w      d0
nkc_cmp_29:
		and.w      #0x4000,d0
		beq.s      nkc_cmp_30
		moveq.l    #1,d0
		bra.s      nkc_cmp_2
nkc_cmp_30:
		move.w     4(a7),d0
		bne.s      nkc_cmp_31
		moveq.l    #1,d0
		bra.s      nkc_cmp_32
nkc_cmp_31:
		clr.w      d0
nkc_cmp_32:
		and.w      #0x0300,d0
		beq.s      nkc_cmp_33
		moveq.l    #1,d0
		bra.s      nkc_cmp_2
nkc_cmp_33:
		move.w     8(a7),d0
		and.w      #0x0300,d0
		cmp.w      #0x0300,d0
		beq.s      nkc_cmp_3
		clr.w      d0
		bra.s      nkc_cmp_2
nkc_cmp_3:
		move.w     6(a7),d0
		and.w      #0x0300,d0
		beq.s      nkc_cmp_34
		moveq.l    #1,d0
		bra.s      nkc_cmp_2
nkc_cmp_34:
		clr.w      d0
nkc_cmp_2:
		lea.l      10(a7),a7
		rts

	.globl nkc_exit
nkc_exit:
		clr.w      d0
		rts

