	.globl Ash_error
Ash_error:
		lea.l      -140(a7),a7
		move.w     d0,138(a7)
		move.l     a0,134(a7)
		move.w     #$FFFE,132(a7)
		clr.l      (a7)
		move.w     138(a7),d0
		cmp.w      #$0014,d0
		bhi        Ash_error_1
		add.w      d0,d0
		move.w     J46(pc,d0.w),d0
		jmp        J46(pc,d0.w)
J46:
		dc.w Ash_error_1-J46
		dc.w Ash_error_1-J46
		dc.w Ash_error_2-J46
		dc.w Ash_error_3-J46
		dc.w Ash_error_4-J46
		dc.w Ash_error_5-J46
		dc.w Ash_error_6-J46
		dc.w Ash_error_7-J46
		dc.w Ash_error_8-J46
		dc.w Ash_error_9-J46
		dc.w Ash_error_10-J46
		dc.w Ash_error_11-J46
		dc.w Ash_error_12-J46
		dc.w Ash_error_12-J46
		dc.w Ash_error_12-J46
		dc.w Ash_error_12-J46
		dc.w Ash_error_13-J46
		dc.w Ash_error_14-J46
		dc.w Ash_error_14-J46
		dc.w Ash_error_1-J46
		dc.w Ash_error_1-J46
Ash_error_2:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     292(a0),(a7)
		clr.l      134(a7)
		bra        Ash_error_15
Ash_error_3:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     332(a0),(a7)
		clr.l      134(a7)
		bra        Ash_error_15
Ash_error_4:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     268(a0),(a7)
		clr.l      134(a7)
		bra        Ash_error_15
Ash_error_5:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     340(a0),(a7)
		clr.l      134(a7)
		bra        Ash_error_15
Ash_error_6:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     320(a0),(a7)
		clr.l      134(a7)
		bra        Ash_error_15
Ash_error_7:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     288(a0),(a7)
		clr.l      134(a7)
		bra        Ash_error_15
Ash_error_8:
		move.l     134(a7),d0
		beq.s      Ash_error_16
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     328(a0),(a7)
		bra.s      Ash_error_17
Ash_error_16:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     324(a0),(a7)
Ash_error_17:
		bra        Ash_error_15
Ash_error_9:
		move.l     134(a7),d0
		beq.s      Ash_error_18
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     264(a0),(a7)
		bra.s      Ash_error_19
Ash_error_18:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     260(a0),(a7)
Ash_error_19:
		bra        Ash_error_15
Ash_error_10:
		move.l     134(a7),d0
		beq.s      Ash_error_20
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     364(a0),(a7)
		bra.s      Ash_error_21
Ash_error_20:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     360(a0),(a7)
Ash_error_21:
		bra        Ash_error_15
Ash_error_11:
		move.l     134(a7),d0
		beq.s      Ash_error_22
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     348(a0),(a7)
		bra.s      Ash_error_23
Ash_error_22:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     344(a0),(a7)
Ash_error_23:
		bra        Ash_error_15
Ash_error_12:
		move.l     134(a7),d0
		beq.w      Ash_error_24
		movea.l    134(a7),a0
		move.b     (a0),d0
		beq.w      Ash_error_24
		movea.l    134(a7),a1
		lea.l      4(a7),a0
		jsr        Af_2name
		move.b     (a0),d0
		beq.s      Ash_error_24
		move.w     138(a7),d0
		sub.w      #$000C,d0
		beq.s      Ash_error_25
		subq.w     #1,d0
		beq.s      Ash_error_26
		subq.w     #1,d0
		beq.s      Ash_error_27
		subq.w     #1,d0
		beq.s      Ash_error_28
		bra.s      Ash_error_29
Ash_error_25:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     300(a0),(a7)
		bra.s      Ash_error_29
Ash_error_26:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     308(a0),(a7)
		bra.s      Ash_error_29
Ash_error_27:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     356(a0),(a7)
		bra.s      Ash_error_29
Ash_error_28:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     316(a0),(a7)
		nop
Ash_error_29:
		lea.l      4(a7),a0
		move.l     a0,134(a7)
		bra.s      Ash_error_30
Ash_error_24:
		clr.l      134(a7)
		move.w     138(a7),d0
		sub.w      #$000C,d0
		beq.s      Ash_error_31
		subq.w     #1,d0
		beq.s      Ash_error_32
		subq.w     #1,d0
		beq.s      Ash_error_33
		subq.w     #1,d0
		beq.s      Ash_error_34
		bra.s      Ash_error_30
Ash_error_31:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     296(a0),(a7)
		bra.s      Ash_error_30
Ash_error_32:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     304(a0),(a7)
		bra.s      Ash_error_30
Ash_error_33:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     352(a0),(a7)
		bra.s      Ash_error_30
Ash_error_34:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     312(a0),(a7)
		nop
Ash_error_30:
		bra.s      Ash_error_15
Ash_error_13:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     336(a0),(a7)
		clr.l      134(a7)
		bra.s      Ash_error_15
Ash_error_14:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     256(a0),(a7)
		clr.l      134(a7)
		bra.s      Ash_error_15
Ash_error_1:
		move.l     134(a7),d0
		beq.s      Ash_error_35
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     252(a0),(a7)
		bra.s      Ash_error_15
Ash_error_35:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     248(a0),(a7)
Ash_error_15:
		move.l     (a7),d0
		beq.s      Ash_error_36
		move.l     134(a7),d0
		beq.s      Ash_error_37
		movea.l    134(a7),a1
		movea.l    (a7),a0
		jsr        alert_str
		move.w     d0,132(a7)
		bra.s      Ash_error_36
Ash_error_37:
		movea.l    (a7),a0
		moveq.l    #1,d0
		jsr        Awi_alert
		move.w     d0,132(a7)
Ash_error_36:
		cmpi.w     #$FFFF,132(a7)
		bge.s      Ash_error_38
		movea.l    _globl,a1
		lea.l      xe0fda,a0
		moveq.l    #1,d0
		jsr        mt_form_alert
Ash_error_38:
		lea.l      140(a7),a7
		rts

	.globl Ash_getenv
Ash_getenv:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		movea.l    ACSblk,a0
		move.l     652(a0),8(a7)
		move.l     8(a7),d0
		beq.s      Ash_getenv_1
		movea.l    8(a7),a0
		move.l     (a0),4(a7)
		bra.s      Ash_getenv_2
Ash_getenv_7:
		move.l     12(a7),(a7)
		bra.s      Ash_getenv_3
Ash_getenv_6:
		movea.l    4(a7),a0
		cmpi.b     #$3D,(a0)
		bne.s      Ash_getenv_3
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      Ash_getenv_3
		addq.l     #1,4(a7)
		movea.l    4(a7),a0
		bra.s      Ash_getenv_4
Ash_getenv_3:
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      Ash_getenv_5
		movea.l    4(a7),a0
		addq.l     #1,4(a7)
		move.b     (a0),d0
		movea.l    (a7),a0
		addq.l     #1,(a7)
		cmp.b      (a0),d0
		beq.s      Ash_getenv_6
Ash_getenv_5:
		addq.l     #4,8(a7)
		movea.l    8(a7),a0
		move.l     (a0),4(a7)
Ash_getenv_2:
		move.l     4(a7),d0
		beq.s      Ash_getenv_1
		movea.l    4(a7),a0
		move.b     (a0),d0
		bne.s      Ash_getenv_7
Ash_getenv_1:
		suba.l     a0,a0
Ash_getenv_4:
		lea.l      16(a7),a7
		rts

	.data

xe0fda:
		dc.b '[| Internal errors! | Take care! |][  OK  ]',0
		dc.w $0000
