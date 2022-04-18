		.text

	.globl Adate_getMonth
Adate_getMonth:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.l     a1,2(a7)
		clr.w      (a7)
		moveq.l    #3,d0
		lea.l      xe20fc,a1
		movea.l    6(a7),a0
		jsr        Ast_incmp
		tst.w      d0
		bne.s      Adate_getMonth_1
		move.w     #$0001,(a7)
Adate_getMonth_1:
		moveq.l    #3,d0
		lea.l      xe2100,a1
		movea.l    6(a7),a0
		jsr        Ast_incmp
		tst.w      d0
		bne.s      Adate_getMonth_2
		move.w     #$0002,(a7)
Adate_getMonth_2:
		moveq.l    #3,d0
		lea.l      xe2104,a1
		movea.l    6(a7),a0
		jsr        Ast_incmp
		tst.w      d0
		bne.s      Adate_getMonth_3
		move.w     #$0003,(a7)
Adate_getMonth_3:
		moveq.l    #3,d0
		lea.l      xe2108,a1
		movea.l    6(a7),a0
		jsr        Ast_incmp
		tst.w      d0
		bne.s      Adate_getMonth_4
		move.w     #$0004,(a7)
Adate_getMonth_4:
		moveq.l    #3,d0
		lea.l      xe210c,a1
		movea.l    6(a7),a0
		jsr        Ast_incmp
		tst.w      d0
		bne.s      Adate_getMonth_5
		move.w     #$0005,(a7)
Adate_getMonth_5:
		moveq.l    #3,d0
		lea.l      xe2110,a1
		movea.l    6(a7),a0
		jsr        Ast_incmp
		tst.w      d0
		bne.s      Adate_getMonth_6
		move.w     #$0006,(a7)
Adate_getMonth_6:
		moveq.l    #3,d0
		lea.l      xe2114,a1
		movea.l    6(a7),a0
		jsr        Ast_incmp
		tst.w      d0
		bne.s      Adate_getMonth_7
		move.w     #$0007,(a7)
Adate_getMonth_7:
		moveq.l    #3,d0
		lea.l      xe2118,a1
		movea.l    6(a7),a0
		jsr        Ast_incmp
		tst.w      d0
		bne.s      Adate_getMonth_8
		move.w     #$0008,(a7)
Adate_getMonth_8:
		moveq.l    #3,d0
		lea.l      xe211c,a1
		movea.l    6(a7),a0
		jsr        Ast_incmp
		tst.w      d0
		bne.s      Adate_getMonth_9
		move.w     #$0009,(a7)
Adate_getMonth_9:
		moveq.l    #3,d0
		lea.l      xe2120,a1
		movea.l    6(a7),a0
		jsr        Ast_incmp
		tst.w      d0
		bne.s      Adate_getMonth_10
		move.w     #$000A,(a7)
Adate_getMonth_10:
		moveq.l    #3,d0
		lea.l      xe2124,a1
		movea.l    6(a7),a0
		jsr        Ast_incmp
		tst.w      d0
		bne.s      Adate_getMonth_11
		move.w     #$000B,(a7)
Adate_getMonth_11:
		moveq.l    #3,d0
		lea.l      xe2128,a1
		movea.l    6(a7),a0
		jsr        Ast_incmp
		tst.w      d0
		bne.s      Adate_getMonth_12
		move.w     #$000C,(a7)
Adate_getMonth_12:
		move.l     2(a7),d0
		beq.s      Adate_getMonth_13
		move.w     (a7),-(a7)
		lea.l      xe212c,a1
		movea.l    4(a7),a0
		jsr        sprintf
		addq.w     #2,a7
Adate_getMonth_13:
		move.w     (a7),d0
		lea.l      10(a7),a7
		rts

	.data

xe20fc:
		dc.b 'JAN',0
xe2100:
		dc.b 'FEB',0
xe2104:
		dc.b 'MAR',0
xe2108:
		dc.b 'APR',0
xe210c:
		dc.b 'MAY',0
xe2110:
		dc.b 'JUN',0
xe2114:
		dc.b 'JUL',0
xe2118:
		dc.b 'AUG',0
xe211c:
		dc.b 'SEP',0
xe2120:
		dc.b 'OCT',0
xe2124:
		dc.b 'NOV',0
xe2128:
		dc.b 'DEC',0
xe212c:
		dc.b '%02i',0
			.even
