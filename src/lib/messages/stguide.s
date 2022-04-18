	.globl Aev_InitSTGuide
Aev_InitSTGuide:
		moveq.l    #1,d0
		rts

	.globl Aev_ExitSTGuide
Aev_ExitSTGuide:
		move.l     help_string,d0
		beq.s      Aev_ExitSTGuide_1
		movea.l    help_string,a0
		jsr        Ax_glfree
Aev_ExitSTGuide_1:
		clr.l      help_string
		clr.l      help_meldung
		moveq.l    #1,d0
		rts

	.globl CheckSTGuide
CheckSTGuide:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		cmpa.l     help_meldung,a0
		bne.s      CheckSTGuide_1
		clr.l      help_meldung
CheckSTGuide_1:
		addq.w     #4,a7
		rts

SendMeldung:
		move.l     a2,-(a7)
		move.l     help_meldung,d0
		beq.s      SendMeldung_1
		suba.l     a1,a1
		move.w     #$0192,d0
		movea.l    help_meldung,a0
		movea.l    help_meldung,a2
		movea.l    4(a2),a2
		jsr        (a2)
		clr.l      help_meldung
SendMeldung_1:
		movea.l    (a7)+,a2
		rts

	.globl Aev_STGuideHelp
Aev_STGuideHelp:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.l     a1,6(a7)
		movea.l    10(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      Aev_STGuideHelp_1
		movea.l    6(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      Aev_STGuideHelp_1
		clr.w      d0
		bra        Aev_STGuideHelp_2
Aev_STGuideHelp_1:
		movea.l    _globl,a1
		lea.l      xe1ba4,a0
		jsr        mt_appl_find
		move.w     d0,4(a7)
		move.w     4(a7),d0
		bpl.s      Aev_STGuideHelp_3
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		bne.s      Aev_STGuideHelp_3
		movea.l    ACSblk,a0
		move.w     (a0),d0
		nop
Aev_STGuideHelp_3:
		move.l     help_string,d0
		beq.s      Aev_STGuideHelp_4
		movea.l    help_string,a0
		jsr        Ax_glfree
Aev_STGuideHelp_4:
		bsr        SendMeldung
		move.l     10(a7),d0
		beq.s      Aev_STGuideHelp_5
		movea.l    10(a7),a0
		move.b     (a0),d0
		bne.s      Aev_STGuideHelp_6
Aev_STGuideHelp_5:
		move.l     18(a7),-(a7)
		movea.l    10(a7),a1
		lea.l      xe1bad,a0
		jsr        Aev_AcHelp
		addq.w     #4,a7
		bra        Aev_STGuideHelp_2
Aev_STGuideHelp_6:
		movea.l    10(a7),a0
		jsr        strlen
		move.l     d0,-(a7)
		movea.l    10(a7),a0
		jsr        strlen
		add.l      (a7)+,d0
		add.l      #$0000000A,d0
		move.l     d0,(a7)
		move.l     (a7),d0
		jsr        Ax_malloc
		move.l     a0,help_string
		move.l     help_string,d0
		bne.s      Aev_STGuideHelp_7
		clr.w      d0
		bra.s      Aev_STGuideHelp_2
Aev_STGuideHelp_7:
		lea.l      xe1bba,a1
		move.l     a1,-(a7)
		lea.l      xe1bb6,a1
		movea.l    help_string,a0
		jsr        strcpy
		movea.l    14(a7),a1
		jsr        strcat
		jsr        Ast_alltrim
		movea.l    (a7)+,a1
		jsr        strcat
		move.l     6(a7),d0
		beq.s      Aev_STGuideHelp_8
		movea.l    6(a7),a0
		move.b     (a0),d0
		beq.s      Aev_STGuideHelp_8
		lea.l      xe1bbf,a1
		movea.l    help_string,a0
		jsr        strcat
		movea.l    6(a7),a1
		jsr        strcat
		jsr        Ast_alltrim
Aev_STGuideHelp_8:
		moveq.l    #-1,d1
		suba.l     a1,a1
		movea.l    help_string,a0
		move.w     4(a7),d0
		jsr        Aev_VaStart
Aev_STGuideHelp_2:
		lea.l      14(a7),a7
		rts

	.data

help_string:
		dc.w $0000
		dc.w $0000
help_meldung:
		dc.w $0000
		dc.w $0000
xe1ba4:
		dc.b 'ST-GUIDE',0
xe1bad:
		dc.b 'ST-GUIDE',0
xe1bb6:
		dc.b '*:\',0
xe1bba:
		dc.b '.REF',0
xe1bbf:
		dc.b $20,0
		.even
