
	.globl Ash_printSetIcon
Ash_printSetIcon:
		subq.w     #6,a7
		move.l     a0,2(a7)
		move.w     d0,(a7)
		move.l     2(a7),PrintSelWind+90
		move.l     PrintSelWind+90,d0
		bne.s      Ash_printSetIcon_1
		andi.w     #$FFFC,PrintSelWind+84
		bra.s      Ash_printSetIcon_2
Ash_printSetIcon_1:
		ori.w      #$0001,PrintSelWind+84
		move.w     (a7),d0
		beq.s      Ash_printSetIcon_3
		ori.w      #$0002,PrintSelWind+84
		bra.s      Ash_printSetIcon_2
Ash_printSetIcon_3:
		andi.w     #$FFFD,PrintSelWind+84
Ash_printSetIcon_2:
		addq.w     #6,a7
		rts

	.globl Ash_print
Ash_print:
		move.l     a2,-(a7)
		lea.l      -24(a7),a7
		move.l     a0,20(a7)
		move.w     d0,18(a7)
		move.w     d1,16(a7)
		move.w     d2,14(a7)
		move.l     a1,10(a7)
		move.w     #$FFFF,(a7)
		jsr        hasPdlg
		tst.w      d0
		bne.s      Ash_print_1
		moveq.l    #-1,d0
		bra        Ash_print_2
Ash_print_1:
		moveq.l    #38,d0
		jsr        Ax_malloc
		move.l     a0,6(a7)
		move.l     6(a7),d0
		bne.s      Ash_print_3
		moveq.l    #-1,d0
		bra        Ash_print_2
Ash_print_3:
		movea.l    6(a7),a0
		clr.l      12(a0)
		movea.l    6(a7),a0
		move.l     20(a7),8(a0)
		movea.l    6(a7),a0
		move.w     18(a7),4(a0)
		movea.l    6(a7),a0
		move.w     16(a7),6(a0)
		movea.l    6(a7),a0
		move.w     14(a7),16(a0)
		movea.l    10(a7),a0
		jsr        Ast_create
		movea.l    6(a7),a1
		move.l     a0,(a1)
		movea.l    6(a7),a0
		move.l     32(a7),30(a0)
		move.l     32(a7),d0
		bne.s      Ash_print_4
		moveq.l    #1,d0
		bra.s      Ash_print_5
Ash_print_4:
		clr.w      d0
Ash_print_5:
		movea.l    6(a7),a0
		move.w     d0,24(a0)
		movea.l    6(a7),a0
		clr.w      28(a0)
		movea.l    6(a7),a0
		clr.w      26(a0)
		movea.l    6(a7),a0
		movea.l    PrintSelWind+8,a1
		jsr        (a1)
		move.l     a0,2(a7)
		move.l     2(a7),d0
		bne        Ash_print_6
		move.l     32(a7),d0
		bne        Ash_print_7
		movea.l    _globl,a0
		move.l     a0,-(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0100,d0
		bne.s      Ash_print_8
		moveq.l    #1,d0
		bra.s      Ash_print_9
Ash_print_8:
		clr.w      d0
Ash_print_9:
		movea.l    (a7)+,a0
		jsr        mt_pdlg_create
		movea.l    6(a7),a1
		move.l     a0,12(a1)
		movea.l    6(a7),a0
		move.l     12(a0),d0
		beq        Ash_print_7
		movea.l    6(a7),a0
		jsr        pdlgGetSettings
		movea.l    6(a7),a1
		move.l     a0,8(a1)
		movea.l    6(a7),a0
		move.l     8(a0),d0
		beq.s      Ash_print_10
		jsr        Amo_unbusy
		move.l     _globl,-(a7)
		movea.l    10(a7),a0
		move.l     (a0),-(a7)
		movea.l    14(a7),a0
		move.w     16(a0),d0
		movea.l    14(a7),a0
		movea.l    8(a0),a1
		movea.l    14(a7),a0
		movea.l    12(a0),a0
		jsr        mt_pdlg_do
		addq.w     #8,a7
		movea.l    6(a7),a0
		move.w     d0,26(a0)
		movea.l    6(a7),a0
		cmpi.w     #$0002,26(a0)
		bne.s      Ash_print_11
		moveq.l    #1,d0
		bra.s      Ash_print_12
Ash_print_11:
		clr.w      d0
Ash_print_12:
		move.w     d0,(a7)
		bra.s      Ash_print_13
Ash_print_10:
		move.w     #$FFFF,(a7)
Ash_print_13:
		movea.l    _globl,a1
		movea.l    6(a7),a0
		movea.l    12(a0),a0
		jsr        mt_pdlg_delete
Ash_print_7:
		movea.l    6(a7),a0
		move.w     18(a0),d0
		beq.s      Ash_print_14
		movea.l    6(a7),a0
		movea.l    8(a0),a0
		jsr        Ax_free
Ash_print_14:
		movea.l    6(a7),a0
		movea.l    (a0),a0
		jsr        Ast_delete
		movea.l    6(a7),a0
		jsr        Ax_free
		bra.w      Ash_print_15
Ash_print_6:
		move.l     32(a7),d0
		bne.s      Ash_print_16
		movea.l    6(a7),a0
		move.w     #$0001,24(a0)
		movea.l    2(a7),a0
		jsr        Awi_dialog
		move.w     d0,(a7)
		cmpi.w     #$FFFF,(a7)
		blt.s      Ash_print_17
		movea.l    6(a7),a0
		cmpi.w     #$0002,26(a0)
		bne.s      Ash_print_18
		moveq.l    #1,d0
		bra.s      Ash_print_19
Ash_print_18:
		clr.w      d0
Ash_print_19:
		move.w     d0,(a7)
Ash_print_17:
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    2(a7),a0
		movea.l    2(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		bra.s      Ash_print_15
Ash_print_16:
		movea.l    6(a7),a0
		clr.w      24(a0)
		movea.l    2(a7),a0
		movea.l    2(a7),a1
		movea.l    12(a1),a1
		jsr        (a1)
		tst.w      d0
		beq.s      Ash_print_20
		move.w     #$0002,(a7)
		bra.s      Ash_print_15
Ash_print_20:
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    2(a7),a0
		movea.l    2(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
Ash_print_15:
		move.w     (a7),d0
Ash_print_2:
		lea.l      24(a7),a7
		movea.l    (a7)+,a2
		rts

hasPdlg:
		subq.w     #8,a7
		move.w     vorhanden,d0
		bpl.s      hasPdlg_1
		move.l     _globl,-(a7)
		pea.l      4(a7)
		pea.l      10(a7)
		lea.l      16(a7),a1
		lea.l      18(a7),a0
		moveq.l    #7,d0
		jsr        mt_appl_getinfo
		lea.l      12(a7),a7
		tst.w      d0
		beq.s      hasPdlg_2
		moveq.l    #16,d0
		and.w      6(a7),d0
		beq.s      hasPdlg_3
		moveq.l    #1,d0
		bra.s      hasPdlg_4
hasPdlg_3:
		clr.w      d0
hasPdlg_4:
		move.w     d0,vorhanden
		bra.s      hasPdlg_1
hasPdlg_2:
		clr.w      vorhanden
hasPdlg_1:
		move.w     vorhanden,d0
		beq.s      hasPdlg_5
		moveq.l    #1,d0
		bra.s      hasPdlg_6
hasPdlg_5:
		clr.w      d0
hasPdlg_6:
		addq.w     #8,a7
		rts

pdlgGetSettings:
		lea.l      -20(a7),a7
		move.l     a0,12(a7)
		movea.l    12(a7),a0
		move.l     12(a0),8(a7)
		movea.l    12(a7),a0
		move.l     8(a0),(a7)
		move.l     8(a7),d0
		bne.s      pdlgGetSettings_1
		movea.l    _globl,a0
		clr.w      d0
		jsr        mt_pdlg_create
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      pdlgGetSettings_2
		suba.l     a0,a0
		bra        pdlgGetSettings_3
pdlgGetSettings_2:
		move.l     4(a7),8(a7)
		bra.s      pdlgGetSettings_4
pdlgGetSettings_1:
		clr.l      4(a7)
pdlgGetSettings_4:
		move.l     (a7),d0
		bne.s      pdlgGetSettings_5
		moveq.l    #1,d0
		bra.s      pdlgGetSettings_6
pdlgGetSettings_5:
		clr.w      d0
pdlgGetSettings_6:
		movea.l    12(a7),a0
		move.w     d0,18(a0)
		movea.l    12(a7),a0
		move.w     18(a0),d0
		beq.s      pdlgGetSettings_7
		movea.l    _globl,a0
		jsr        mt_pdlg_get_setsize
		move.l     d0,16(a7)
		cmpi.l     #$00000178,16(a7)
		bls.s      pdlgGetSettings_8
		move.l     16(a7),d0
		bra.s      pdlgGetSettings_9
pdlgGetSettings_8:
		move.l     #$00000178,d0
pdlgGetSettings_9:
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      pdlgGetSettings_10
		move.l     _globl,-(a7)
		movea.l    4(a7),a1
		movea.l    12(a7),a0
		jsr        mt_pdlg_dflt_settings
		addq.w     #4,a7
pdlgGetSettings_10:
		bra.s      pdlgGetSettings_11
pdlgGetSettings_7:
		move.l     _globl,-(a7)
		movea.l    4(a7),a1
		movea.l    12(a7),a0
		jsr        mt_pdlg_validate_settings
		addq.w     #4,a7
		tst.w      d0
		bne.s      pdlgGetSettings_11
		suba.l     a0,a0
		bra.s      pdlgGetSettings_3
pdlgGetSettings_11:
		move.l     4(a7),d0
		beq.s      pdlgGetSettings_12
		movea.l    _globl,a1
		movea.l    4(a7),a0
		jsr        mt_pdlg_delete
pdlgGetSettings_12:
		movea.l    (a7),a0
pdlgGetSettings_3:
		lea.l      20(a7),a7
		rts

pdlgClose:
		move.l     a2,-(a7)
		lea.l      -20(a7),a7
		move.l     a0,8(a7)
		movea.l    8(a7),a0
		move.l     34(a0),4(a7)
		movea.l    8(a7),a0
		move.l     30(a0),(a7)
		move.l     4(a7),d0
		beq.s      pdlgClose_1
		movea.l    4(a7),a0
		move.w     32(a0),d0
		bmi.s      pdlgClose_1
		movea.l    8(a7),a0
		move.l     12(a0),d0
		beq.s      pdlgClose_1
		move.l     _globl,-(a7)
		movea.l    8(a7),a0
		pea.l      46(a0)
		movea.l    12(a7),a1
		lea.l      44(a1),a1
		movea.l    16(a7),a0
		movea.l    12(a0),a0
		jsr        mt_pdlg_close
		addq.w     #8,a7
		movea.l    4(a7),a0
		move.w     #$FFFF,32(a0)
pdlgClose_1:
		move.l     (a7),d0
		beq.s      pdlgClose_2
		movea.l    8(a7),a0
		move.l     8(a0),d0
		beq.s      pdlgClose_2
		movea.l    8(a7),a0
		move.l     8(a0),12(a7)
		movea.l    8(a7),a0
		move.w     16(a0),16(a7)
		movea.l    8(a7),a0
		move.w     26(a0),18(a7)
		lea.l      12(a7),a1
		moveq.l    #49,d0
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		movea.l    8(a7),a0
		clr.l      30(a0)
pdlgClose_2:
		moveq.l    #1,d0
		lea.l      20(a7),a7
		movea.l    (a7)+,a2
		rts

pdlgMessage:
		move.l     a2,-(a7)
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		movea.l    8(a7),a0
		movea.l    34(a0),a0
		movea.l    4(a7),a1
		move.w     32(a0),38(a1)
		move.l     _globl,-(a7)
		pea.l      4(a7)
		move.l     12(a7),-(a7)
		movea.l    20(a7),a0
		movea.l    8(a0),a1
		movea.l    20(a7),a0
		movea.l    12(a0),a0
		jsr        mt_pdlg_evnt
		lea.l      12(a7),a7
		move.w     d0,2(a7)
		move.w     2(a7),d0
		bne.s      pdlgMessage_1
		movea.l    8(a7),a0
		move.w     28(a0),d0
		bne.s      pdlgMessage_2
		movea.l    8(a7),a0
		move.w     (a7),26(a0)
pdlgMessage_2:
		movea.l    8(a7),a0
		move.w     #$0001,28(a0)
		movea.l    8(a7),a0
		move.w     24(a0),d0
		beq.s      pdlgMessage_3
		movea.l    ACSblk,a0
		move.w     #$0001,616(a0)
		bra.s      pdlgMessage_1
pdlgMessage_3:
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    8(a7),a0
		movea.l    34(a0),a0
		movea.l    8(a7),a2
		movea.l    34(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
pdlgMessage_1:
		move.w     2(a7),d0
		lea.l      12(a7),a7
		movea.l    (a7)+,a2
		rts

PrintCreate:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     12(a7),8(a7)
		move.l     12(a7),d0
		bne.s      PrintCreate_1
		suba.l     a0,a0
		bra        PrintCreate_2
PrintCreate_1:
		movea.l    _globl,a0
		move.l     a0,-(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0100,d0
		bne.s      PrintCreate_3
		moveq.l    #1,d0
		bra.s      PrintCreate_4
PrintCreate_3:
		clr.w      d0
PrintCreate_4:
		movea.l    (a7)+,a0
		jsr        mt_pdlg_create
		movea.l    8(a7),a1
		move.l     a0,12(a1)
		movea.l    8(a7),a0
		move.l     12(a0),d0
		bne.s      PrintCreate_5
		suba.l     a0,a0
		bra        PrintCreate_2
PrintCreate_5:
		movea.l    8(a7),a0
		bsr        pdlgGetSettings
		movea.l    8(a7),a1
		move.l     a0,8(a1)
		movea.l    8(a7),a0
		move.l     8(a0),d0
		bne.s      PrintCreate_6
		movea.l    _globl,a1
		movea.l    8(a7),a0
		movea.l    12(a0),a0
		jsr        mt_pdlg_delete
		suba.l     a0,a0
		bra.s      PrintCreate_2
PrintCreate_6:
		lea.l      PrintSelWind,a0
		jsr        Awi_create
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      PrintCreate_7
		movea.l    _globl,a1
		movea.l    8(a7),a0
		movea.l    12(a0),a0
		jsr        mt_pdlg_delete
		suba.l     a0,a0
		bra.s      PrintCreate_2
PrintCreate_7:
		movea.l    8(a7),a0
		movea.l    (a0),a0
		jsr        Ast_create
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      PrintCreate_8
		movea.l    4(a7),a0
		movea.l    74(a0),a0
		jsr        Ast_delete
		movea.l    4(a7),a0
		move.l     (a7),74(a0)
PrintCreate_8:
		movea.l    4(a7),a0
		move.l     8(a7),(a0)
		movea.l    8(a7),a0
		move.l     4(a7),34(a0)
		movea.l    4(a7),a0
PrintCreate_2:
		lea.l      16(a7),a7
		rts

PrintService:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		movea.l    6(a7),a0
		move.l     (a0),(a7)
		move.w     4(a7),d0
		subq.w     #2,d0
		beq.s      PrintService_1
		bra.s      PrintService_2
PrintService_1:
		movea.l    6(a7),a0
		move.w     86(a0),d0
		and.w      #$0200,d0
		bne.s      PrintService_3
		movea.l    6(a7),a0
		ori.w      #$0200,86(a0)
		movea.l    (a7),a0
		bsr        pdlgClose
		movea.l    (a7),a0
		move.l     12(a0),d0
		beq.s      PrintService_4
		movea.l    _globl,a1
		movea.l    (a7),a0
		movea.l    12(a0),a0
		jsr        mt_pdlg_delete
PrintService_4:
		movea.l    (a7),a0
		move.w     18(a0),d0
		beq.s      PrintService_5
		movea.l    (a7),a0
		movea.l    8(a0),a0
		jsr        Ax_free
PrintService_5:
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        Ast_delete
		movea.l    (a7),a0
		jsr        Ax_free
		movea.l    6(a7),a0
		jsr        Awi_delete
PrintService_3:
		moveq.l    #1,d0
		bra.s      PrintService_6
PrintService_2:
		clr.w      d0
PrintService_6:
		lea.l      10(a7),a7
		rts

PrintOpen:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		move.l     _globl,-(a7)
		movea.l    4(a7),a0
		move.l     (a0),-(a7)
		movea.l    8(a7),a0
		move.w     6(a0),d2
		movea.l    8(a7),a0
		move.w     4(a0),d1
		movea.l    8(a7),a0
		move.w     16(a0),d0
		movea.l    8(a7),a0
		movea.l    8(a0),a1
		movea.l    8(a7),a0
		movea.l    12(a0),a0
		jsr        mt_pdlg_open
		addq.w     #8,a7
		movea.l    4(a7),a0
		move.w     d0,32(a0)
		movea.l    4(a7),a0
		move.w     32(a0),d0
		ble        PrintOpen_1
		movea.l    4(a7),a0
		pea.l      42(a0)
		movea.l    8(a7),a0
		pea.l      40(a0)
		movea.l    12(a7),a0
		pea.l      38(a0)
		movea.l    16(a7),a0
		pea.l      36(a0)
		moveq.l    #5,d1
		movea.l    20(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    4(a7),a0
		pea.l      58(a0)
		movea.l    8(a7),a0
		pea.l      56(a0)
		movea.l    12(a7),a0
		pea.l      54(a0)
		movea.l    16(a7),a0
		pea.l      52(a0)
		moveq.l    #4,d1
		movea.l    20(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    4(a7),a0
		movea.l    20(a0),a0
		clr.w      16(a0)
		movea.l    4(a7),a0
		movea.l    20(a0),a0
		clr.w      18(a0)
		movea.l    4(a7),a0
		movea.l    4(a7),a1
		movea.l    20(a1),a1
		move.w     56(a0),20(a1)
		movea.l    4(a7),a0
		movea.l    4(a7),a1
		movea.l    20(a1),a1
		move.w     58(a0),22(a1)
		movea.l    4(a7),a0
		jsr        Awi_register
		clr.w      d0
		bra.s      PrintOpen_2
		bra.s      PrintOpen_2
PrintOpen_1:
		moveq.l    #-1,d0
		nop
PrintOpen_2:
		addq.w     #8,a7
		rts

PrintClosed:
		lea.l      -72(a7),a7
		move.l     a0,68(a7)
		movea.l    68(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe2c42,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
PrintClosed_1:
		move.l     (a0)+,(a1)+
		dbf        d0,PrintClosed_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        pdlgMessage
		lea.l      72(a7),a7
		rts

PrintRedraw:
		lea.l      -76(a7),a7
		move.l     a0,72(a7)
		move.l     a1,68(a7)
		movea.l    72(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe2c82,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
PrintRedraw_1:
		move.l     (a0)+,(a1)+
		dbf        d0,PrintRedraw_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		movea.l    68(a7),a0
		move.w     (a0),40(a7)
		movea.l    68(a7),a0
		move.w     2(a0),42(a7)
		movea.l    68(a7),a0
		move.w     4(a0),44(a7)
		movea.l    68(a7),a0
		move.w     6(a0),46(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        pdlgMessage
		lea.l      76(a7),a7
		rts

PrintArrowed:
		lea.l      -74(a7),a7
		move.l     a0,70(a7)
		move.w     d0,68(a7)
		movea.l    70(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe2cc2,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
PrintArrowed_1:
		move.l     (a0)+,(a1)+
		dbf        d0,PrintArrowed_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		move.w     68(a7),40(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        pdlgMessage
		lea.l      74(a7),a7
		rts

PrintChange:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a1
		lea.l      52(a1),a1
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

PrintFulled:
		lea.l      -72(a7),a7
		move.l     a0,68(a7)
		movea.l    68(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe2d02,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
PrintFulled_1:
		move.l     (a0)+,(a1)+
		dbf        d0,PrintFulled_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        pdlgMessage
		lea.l      72(a7),a7
		rts

PrintInit:
		clr.w      d0
		rts

PrintHSlide:
		lea.l      -74(a7),a7
		move.l     a0,70(a7)
		move.w     d0,68(a7)
		movea.l    70(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe2d42,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
PrintHSlide_1:
		move.l     (a0)+,(a1)+
		dbf        d0,PrintHSlide_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		move.w     68(a7),40(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        pdlgMessage
		lea.l      74(a7),a7
		rts

PrintVSlide:
		lea.l      -74(a7),a7
		move.l     a0,70(a7)
		move.w     d0,68(a7)
		movea.l    70(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe2d82,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
PrintVSlide_1:
		move.l     (a0)+,(a1)+
		dbf        d0,PrintVSlide_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		move.w     68(a7),40(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        pdlgMessage
		lea.l      74(a7),a7
		rts

PrintKeys:
		lea.l      -74(a7),a7
		move.l     a0,70(a7)
		move.w     d1,68(a7)
		movea.l    70(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe2dc2,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
PrintKeys_1:
		move.l     (a0)+,(a1)+
		dbf        d0,PrintKeys_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		move.w     68(a7),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		move.w     68(a7),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        pdlgMessage
		clr.w      d0
		lea.l      74(a7),a7
		rts

PrintTopped:
		lea.l      -72(a7),a7
		move.l     a0,68(a7)
		movea.l    68(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe2e02,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
PrintTopped_1:
		move.l     (a0)+,(a1)+
		dbf        d0,PrintTopped_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        pdlgMessage
		lea.l      72(a7),a7
		rts

PrintMoved:
		lea.l      -76(a7),a7
		move.l     a0,72(a7)
		move.l     a1,68(a7)
		movea.l    72(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe2e42,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
PrintMoved_1:
		move.l     (a0)+,(a1)+
		dbf        d0,PrintMoved_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		movea.l    68(a7),a0
		move.w     (a0),40(a7)
		movea.l    68(a7),a0
		move.w     2(a0),42(a7)
		movea.l    68(a7),a0
		move.w     4(a0),44(a7)
		movea.l    68(a7),a0
		move.w     6(a0),46(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        pdlgMessage
		movea.l    72(a7),a0
		pea.l      42(a0)
		movea.l    76(a7),a0
		pea.l      40(a0)
		movea.l    80(a7),a0
		pea.l      38(a0)
		movea.l    84(a7),a0
		pea.l      36(a0)
		moveq.l    #5,d1
		movea.l    88(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    72(a7),a0
		pea.l      58(a0)
		movea.l    76(a7),a0
		pea.l      56(a0)
		movea.l    80(a7),a0
		pea.l      54(a0)
		movea.l    84(a7),a0
		pea.l      52(a0)
		moveq.l    #4,d1
		movea.l    88(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    72(a7),a0
		movea.l    72(a7),a1
		movea.l    20(a1),a1
		move.w     56(a0),20(a1)
		movea.l    72(a7),a0
		movea.l    72(a7),a1
		movea.l    20(a1),a1
		move.w     58(a0),22(a1)
		lea.l      76(a7),a7
		rts

PrintSized:
		lea.l      -76(a7),a7
		move.l     a0,72(a7)
		move.l     a1,68(a7)
		movea.l    72(a7),a0
		move.l     (a0),64(a7)
		lea.l      xe2e82,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
PrintSized_1:
		move.l     (a0)+,(a1)+
		dbf        d0,PrintSized_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		movea.l    68(a7),a0
		move.w     (a0),40(a7)
		movea.l    68(a7),a0
		move.w     2(a0),42(a7)
		movea.l    68(a7),a0
		move.w     4(a0),44(a7)
		movea.l    68(a7),a0
		move.w     6(a0),46(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        pdlgMessage
		movea.l    72(a7),a0
		pea.l      42(a0)
		movea.l    76(a7),a0
		pea.l      40(a0)
		movea.l    80(a7),a0
		pea.l      38(a0)
		movea.l    84(a7),a0
		pea.l      36(a0)
		moveq.l    #5,d1
		movea.l    88(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    72(a7),a0
		pea.l      58(a0)
		movea.l    76(a7),a0
		pea.l      56(a0)
		movea.l    80(a7),a0
		pea.l      54(a0)
		movea.l    84(a7),a0
		pea.l      52(a0)
		moveq.l    #4,d1
		movea.l    88(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    72(a7),a0
		movea.l    72(a7),a1
		movea.l    20(a1),a1
		move.w     56(a0),20(a1)
		movea.l    72(a7),a0
		movea.l    72(a7),a1
		movea.l    20(a1),a1
		move.w     58(a0),22(a1)
		lea.l      76(a7),a7
		rts

PrintIconify:
		subq.w     #6,a7
		move.l     a0,2(a7)
		move.w     d0,(a7)
		move.w     (a7),d0
		movea.l    2(a7),a0
		jsr        Awi_iconify
		addq.w     #6,a7
		rts

PrintUniconify:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		jsr        Awi_uniconify
		addq.w     #4,a7
		rts

PrintGEMScript:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.l     a1,(a7)
		move.l     14(a7),-(a7)
		movea.l    4(a7),a1
		move.w     8(a7),d0
		movea.l    10(a7),a0
		jsr        Awi_gemscript
		addq.w     #4,a7
		lea.l      10(a7),a7
		rts

PrintClicked:
		lea.l      -68(a7),a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.l     (a0),64(a7)
		lea.l      xe2ec2,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
PrintClicked_1:
		move.l     (a0)+,(a1)+
		dbf        d0,PrintClicked_1
		movea.l    ACSblk,a0
		move.w     610(a0),2(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),4(a7)
		movea.l    ACSblk,a0
		move.w     714(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2kstate
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,10(a7)
		movea.l    ACSblk,a0
		move.w     716(a0),12(a7)
		lea.l      (a7),a1
		movea.l    64(a7),a0
		bsr        pdlgMessage
		lea.l      68(a7),a7
		rts

	.data

TEXT_01:
		dc.w $0000
PrintSelObj:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0040
		dc.w $0000
		dc.w $0002
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $0028
		dc.w $0014
_00aPrintSelObj:
		dc.l PrintClicked
		dc.w $0000
		dc.w $0000
		dc.w $8020
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl PrintSelWind
PrintSelWind:
		dc.w $0000
		dc.w $0000
		dc.l PrintService
		dc.l PrintCreate
		dc.l PrintOpen
		dc.l PrintInit
		dc.l PrintSelObj
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $6fef
		dc.w $0000
		dc.w $0000
		dc.w $0078
		dc.w $0032
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $f8f8
		dc.l TEXT_01
		dc.l TEXT_02
		dc.w $0000
		dc.w $0100
		dc.w $0000
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l PrintKeys
		dc.l PrintChange
		dc.l PrintRedraw
		dc.l PrintTopped
		dc.l PrintClosed
		dc.l PrintFulled
		dc.l PrintArrowed
		dc.l PrintHSlide
		dc.l PrintVSlide
		dc.l PrintSized
		dc.l PrintMoved
		dc.l PrintIconify
		dc.l PrintUniconify
		dc.l PrintGEMScript
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
vorhanden:
		dc.w $ffff
xe2c42:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0016
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe2c82:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0014
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe2cc2:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe2d02:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0017
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe2d42:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0019
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe2d82:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $001a
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe2dc2:
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe2e02:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0015
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe2e42:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe2e82:
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $001b
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe2ec2:
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000

