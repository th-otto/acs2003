	.globl Aev_InitPCHelp
Aev_InitPCHelp:
		moveq.l    #1,d0
		rts

	.globl Aev_ExitPCHelp
Aev_ExitPCHelp:
		move.l     help_string,d0
		beq.s      Aev_ExitPCHelp_1
		movea.l    help_string,a0
		jsr        Ax_glfree
Aev_ExitPCHelp_1:
		clr.l      help_string
		clr.l      help_meldung
		moveq.l    #1,d0
		rts

FindPCHelp:
		subq.w     #6,a7
		move.l     a0,2(a7)
		move.l     2(a7),d0
		beq.s      FindPCHelp_1
		movea.l    2(a7),a0
		move.b     (a0),d0
		beq.s      FindPCHelp_1
		movea.l    _globl,a1
		movea.l    2(a7),a0
		jsr        mt_appl_find
		move.w     d0,(a7)
		moveq.l    #8,d0
		movea.l    2(a7),a1
		lea.l      help_name,a0
		jsr        strncpy
		clr.b      help_name+9
		bra.s      FindPCHelp_2
FindPCHelp_1:
		move.w     #$FFFF,(a7)
FindPCHelp_2:
		move.w     (a7),d0
		bpl.s      FindPCHelp_3
		movea.l    _globl,a1
		lea.l      xe1bd6,a0
		jsr        mt_appl_find
		move.w     d0,(a7)
		moveq.l    #8,d0
		lea.l      xe1bdf,a1
		lea.l      help_name,a0
		jsr        strncpy
		clr.b      help_name+9
FindPCHelp_3:
		move.w     (a7),d0
		bpl.s      FindPCHelp_4
		movea.l    _globl,a1
		lea.l      xe1be8,a0
		jsr        mt_appl_find
		move.w     d0,(a7)
		moveq.l    #8,d0
		lea.l      xe1bf1,a1
		lea.l      help_name,a0
		jsr        strncpy
		clr.b      help_name+9
FindPCHelp_4:
		move.w     (a7),d0
		bpl.s      FindPCHelp_5
		clr.b      help_name
FindPCHelp_5:
		move.w     (a7),d0
		addq.w     #6,a7
		rts

	.globl CheckPcHelp
CheckPcHelp:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		cmpa.l     help_meldung,a0
		bne.s      CheckPcHelp_1
		clr.l      help_meldung
CheckPcHelp_1:
		addq.w     #4,a7
		rts

SendMeldung:
		move.l     a2,-(a7)
		subq.w     #2,a7
		move.w     d0,(a7)
		move.l     help_meldung,d0
		beq.s      SendMeldung_1
		move.w     (a7),d0
		bne.s      SendMeldung_2
		clr.w      help_version
SendMeldung_2:
		lea.l      help_version,a1
		move.w     #$0192,d0
		movea.l    help_meldung,a0
		movea.l    help_meldung,a2
		movea.l    4(a2),a2
		jsr        (a2)
		clr.l      help_meldung
SendMeldung_1:
		addq.w     #2,a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetAcReply
Aev_GetAcReply:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		move.w     4(a0),d0
		ble.s      Aev_GetAcReply_1
		movea.l    (a7),a0
		move.l     a0,-(a7)
		movea.l    _globl,a1
		lea.l      help_name,a0
		jsr        mt_appl_find
		movea.l    (a7)+,a0
		cmp.w      2(a0),d0
		bne.s      Aev_GetAcReply_1
		movea.l    (a7),a0
		move.w     4(a0),help_version
		moveq.l    #1,d0
		bsr.w      SendMeldung
		move.l     help_string,d0
		beq.s      Aev_GetAcReply_2
		movea.l    help_string,a0
		jsr        Ax_glfree
Aev_GetAcReply_2:
		clr.l      help_string
		clr.b      help_name
		moveq.l    #1,d0
		bra.s      Aev_GetAcReply_3
		nop
Aev_GetAcReply_1:
		clr.w      d0
Aev_GetAcReply_3:
		addq.w     #8,a7
		rts

	.globl Aev_AcHelp
Aev_AcHelp:
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		move.l     a1,18(a7)
		movea.l    22(a7),a0
		bsr        FindPCHelp
		move.w     d0,16(a7)
		move.w     16(a7),d0
		bmi        Aev_AcHelp_1
		movea.l    ACSblk,a0
		move.w     16(a7),d0
		cmp.w      (a0),d0
		beq        Aev_AcHelp_1
		clr.w      d0
		bsr        SendMeldung
		move.l     help_string,d0
		beq.s      Aev_AcHelp_2
		movea.l    help_string,a0
		jsr        Ax_glfree
Aev_AcHelp_2:
		moveq.l    #1,d0
		movea.l    18(a7),a0
		jsr        Ast_copy
		move.l     a0,help_string
		movea.l    help_string,a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      Aev_AcHelp_3
		clr.w      d0
		bra.s      Aev_AcHelp_4
Aev_AcHelp_3:
		move.w     #$0401,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		clr.w      4(a7)
		clr.w      10(a7)
		clr.w      12(a7)
		clr.w      14(a7)
		move.l     help_string,6(a7)
		move.l     30(a7),help_meldung
		movea.l    _globl,a1
		lea.l      (a7),a0
		moveq.l    #16,d1
		move.w     16(a7),d0
		jsr        mt_appl_write
		tst.w      d0
		beq.s      Aev_AcHelp_5
		moveq.l    #1,d0
		bra.s      Aev_AcHelp_6
Aev_AcHelp_5:
		clr.w      d0
Aev_AcHelp_6:
		bra.s      Aev_AcHelp_4
Aev_AcHelp_1:
		clr.w      d0
Aev_AcHelp_4:
		lea.l      26(a7),a7
		rts

	.data

help_string:
		dc.w $0000
		dc.w $0000
help_version:
		dc.w $0000
help_meldung:
		dc.w $0000
		dc.w $0000
help_name:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe1bd6:
		dc.b 'PC_HELP ',0
xe1bdf:
		dc.b 'PC_HELP ',0
xe1be8:
		dc.b 'ST-GUIDE',0
xe1bf1:
		dc.b 'ST-GUIDE',0
		.even
