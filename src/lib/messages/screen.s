		_GetMnSelected:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		movea.l    (a0),a0
		move.w     8(a0),d1
		movea.l    (a7),a0
		movea.l    (a0),a0
		move.w     6(a0),d0
		jsr        Ame_root
		moveq.l    #1,d0
		addq.w     #4,a7
		rts

	.globl Aev_GetWmRedraw
Aev_GetWmRedraw:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a1
		addq.w     #4,a1
		movea.l    (a7),a0
		movea.l    12(a0),a0
		movea.l    (a7),a2
		movea.l    12(a2),a2
		movea.l    106(a2),a2
		jsr        (a2)
		moveq.l    #1,d0
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetWmTopped
Aev_GetWmTopped:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		movea.l    12(a0),a0
		move.w     84(a0),d0
		and.w      #$0100,d0
		beq.s      Aev_GetWmTopped_1
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0400,(a0)
		bge.s      Aev_GetWmTopped_1
		cmpi.w     #$0300,_ACSv_magix
		bge.s      Aev_GetWmTopped_1
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    (a7),a0
		movea.l    12(a0),a0
		lea.l      52(a0),a0
		jsr        Aob_within
		tst.w      d0
		beq.s      Aev_GetWmTopped_1
		movea.l    ACSblk,a0
		move.w     716(a0),d1
		movea.l    ACSblk,a0
		move.w     714(a0),d0
		jsr        evbutton
		bra.s      Aev_GetWmTopped_2
Aev_GetWmTopped_1:
		movea.l    (a7),a0
		movea.l    12(a0),a0
		movea.l    (a7),a1
		movea.l    12(a1),a1
		movea.l    110(a1),a1
		jsr        (a1)
Aev_GetWmTopped_2:
		moveq.l    #1,d0
		addq.w     #4,a7
		rts

	.globl Aev_GetWmClosed
Aev_GetWmClosed:
		move.l     a2,-(a7)
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		jsr        Awi_modal
		move.l     a0,4(a7)
		movea.l    8(a7),a0
		move.l     12(a0),(a7)
		move.l     4(a7),d0
		beq.s      Aev_GetWmClosed_1
		movea.l    4(a7),a0
		cmpa.l     (a7),a0
		bne.s      Aev_GetWmClosed_2
Aev_GetWmClosed_1:
		jsr        Awi_root
		movea.l    (a7),a1
		cmpa.l     a0,a1
		beq.s      Aev_GetWmClosed_3
		moveq.l    #1,d0
		movea.l    (a7),a0
		and.w      84(a0),d0
		bne.s      Aev_GetWmClosed_3
		movea.l    (a7),a0
		move.w     86(a0),d0
		and.w      #$0400,d0
		beq.s      Aev_GetWmClosed_4
Aev_GetWmClosed_3:
		movea.l    (a7),a0
		movea.l    (a7),a1
		movea.l    114(a1),a1
		jsr        (a1)
		bra.s      Aev_GetWmClosed_2
Aev_GetWmClosed_4:
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
Aev_GetWmClosed_2:
		moveq.l    #1,d0
		lea.l      12(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetWmFulled
Aev_GetWmFulled:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		movea.l    12(a0),a0
		movea.l    (a7),a1
		movea.l    12(a1),a1
		movea.l    118(a1),a1
		jsr        (a1)
		moveq.l    #1,d0
		addq.w     #4,a7
		rts

	.globl Aev_GetWmArrowed
Aev_GetWmArrowed:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		move.w     10(a0),d0
		bmi.s      Aev_GetWmArrowed_1
		moveq.l    #1,d1
		movea.l    (a7),a0
		move.w     8(a0),d0
		movea.l    4(a7),a0
		movea.l    12(a0),a0
		movea.l    4(a7),a1
		movea.l    12(a1),a1
		movea.l    122(a1),a1
		jsr        (a1)
		bra.s      Aev_GetWmArrowed_2
Aev_GetWmArrowed_1:
		movea.l    (a7),a0
		move.w     10(a0),d1
		neg.w      d1
		movea.l    (a7),a0
		move.w     8(a0),d0
		movea.l    4(a7),a0
		movea.l    12(a0),a0
		movea.l    4(a7),a1
		movea.l    12(a1),a1
		movea.l    122(a1),a1
		jsr        (a1)
		movea.l    (a7),a0
		move.w     14(a0),d0
		bpl.s      Aev_GetWmArrowed_2
		movea.l    (a7),a0
		move.w     14(a0),d1
		neg.w      d1
		movea.l    (a7),a0
		move.w     12(a0),d0
		movea.l    4(a7),a0
		movea.l    12(a0),a0
		movea.l    4(a7),a1
		movea.l    12(a1),a1
		movea.l    122(a1),a1
		jsr        (a1)
Aev_GetWmArrowed_2:
		moveq.l    #1,d0
		addq.w     #8,a7
		rts

	.globl Aev_GetWmMouseWheel
Aev_GetWmMouseWheel:
		lea.l      -40(a7),a7
		move.l     a0,36(a7)
		movea.l    36(a7),a0
		move.l     (a0),32(a7)
		moveq.l    #32,d1
		clr.w      d0
		lea.l      (a7),a0
		jsr        memset
		movea.l    32(a7),a0
		move.w     8(a0),(a7)
		movea.l    32(a7),a0
		move.w     12(a0),d1
		movea.l    32(a7),a0
		move.w     10(a0),d0
		lea.l      (a7),a1
		movea.l    36(a7),a0
		movea.l    12(a0),a0
		jsr        Awi_wheeled
		lea.l      40(a7),a7
		rts

	.globl Aev_GetWmHSlid
Aev_GetWmHSlid:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		movea.l    (a0),a0
		move.w     8(a0),d0
		movea.l    (a7),a0
		movea.l    12(a0),a0
		movea.l    (a7),a1
		movea.l    12(a1),a1
		movea.l    126(a1),a1
		jsr        (a1)
		moveq.l    #1,d0
		addq.w     #4,a7
		rts

	.globl Aev_GetWmVSlid
Aev_GetWmVSlid:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		movea.l    (a0),a0
		move.w     8(a0),d0
		movea.l    (a7),a0
		movea.l    12(a0),a0
		movea.l    (a7),a1
		movea.l    12(a1),a1
		movea.l    130(a1),a1
		jsr        (a1)
		moveq.l    #1,d0
		addq.w     #4,a7
		rts

	.globl Aev_GetWmSized
Aev_GetWmSized:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a1
		addq.w     #4,a1
		movea.l    (a7),a0
		movea.l    12(a0),a0
		movea.l    (a7),a2
		movea.l    12(a2),a2
		movea.l    134(a2),a2
		jsr        (a2)
		moveq.l    #1,d0
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetWmMoved
Aev_GetWmMoved:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a1
		addq.w     #4,a1
		movea.l    (a7),a0
		movea.l    12(a0),a0
		movea.l    (a7),a2
		movea.l    12(a2),a2
		movea.l    138(a2),a2
		jsr        (a2)
		moveq.l    #1,d0
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetWmBottomed
Aev_GetWmBottomed:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		movea.l    12(a0),a0
		jsr        Awi_backdrop
		moveq.l    #1,d0
		addq.w     #4,a7
		rts

	.globl Aev_GetWmOnTop
Aev_GetWmOnTop:
		subq.w     #4,a7
		move.l     a0,(a7)
		move.w     _ACSv_magix,d0
		ble.s      Aev_GetWmOnTop_1
		cmpi.w     #$0200,_ACSv_magix
		bge.s      Aev_GetWmOnTop_1
		movea.l    (a7),a0
		bsr.w      Aev_GetWmBottomed
		bra.s      Aev_GetWmOnTop_2
Aev_GetWmOnTop_1:
		movea.l    (a7),a0
		movea.l    12(a0),a0
		jsr        Awi_setontop
Aev_GetWmOnTop_2:
		moveq.l    #1,d0
		addq.w     #4,a7
		rts

	.globl Aev_GetWmUnTopped
Aev_GetWmUnTopped:
		moveq.l    #1,d0
		rts

	.globl Aev_GetWmToolbar
Aev_GetWmToolbar:
		moveq.l    #1,d0
		rts

	.globl Aev_GetWmShaded
Aev_GetWmShaded:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		movea.l    12(a0),a0
		ori.w      #$2000,86(a0)
		suba.l     a1,a1
		moveq.l    #34,d0
		movea.l    (a7),a0
		movea.l    12(a0),a0
		movea.l    (a7),a2
		movea.l    12(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
		moveq.l    #1,d0
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetWmUnshaded
Aev_GetWmUnshaded:
		move.l     a2,-(a7)
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     12(a0),(a7)
		suba.l     a1,a1
		moveq.l    #35,d0
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		movea.l    (a7),a0
		andi.w     #$DFFF,86(a0)
		movea.l    (a7),a0
		lea.l      36(a0),a0
		movea.l    (a7),a1
		move.w     32(a1),d1
		movea.l    ACSblk,a1
		move.w     (a1),d0
		jsr        Aev_WmRedraw
		moveq.l    #1,d0
		addq.w     #8,a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetWmIconify
Aev_GetWmIconify:
		subq.w     #4,a7
		move.l     a0,(a7)
		clr.w      d0
		movea.l    (a7),a0
		movea.l    12(a0),a0
		movea.l    (a7),a1
		movea.l    12(a1),a1
		movea.l    142(a1),a1
		jsr        (a1)
		moveq.l    #1,d0
		addq.w     #4,a7
		rts

	.globl Aev_GetWmAllIconify
Aev_GetWmAllIconify:
		subq.w     #4,a7
		move.l     a0,(a7)
		moveq.l    #1,d0
		movea.l    (a7),a0
		movea.l    12(a0),a0
		movea.l    (a7),a1
		movea.l    12(a1),a1
		movea.l    142(a1),a1
		jsr        (a1)
		moveq.l    #1,d0
		addq.w     #4,a7
		rts

	.globl Aev_GetWmUnIconify
Aev_GetWmUnIconify:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		movea.l    12(a0),a0
		movea.l    (a7),a1
		movea.l    12(a1),a1
		movea.l    146(a1),a1
		jsr        (a1)
		moveq.l    #1,d0
		addq.w     #4,a7
		rts

	.globl Aev_GetApTerm
Aev_GetApTerm:
		jsr        Aev_quit
		movea.l    ACSblk,a0
		move.w     #$0001,638(a0)
		moveq.l    #1,d0
		rts

	.globl Aev_GetScChanged
Aev_GetScChanged:
		suba.l     a0,a0
		moveq.l    #28,d0
		jsr        Awi_sendall
		moveq.l    #1,d0
		rts

	.globl Aev_GetFntChanged
Aev_GetFntChanged:
		lea.l      -114(a7),a7
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_unload_fonts
		lea.l      (a7),a0
		clr.w      d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vq_extnd
		movea.l    ACSblk,a0
		move.w     20(a7),644(a0)
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_load_fonts
		movea.l    ACSblk,a0
		add.w      d0,644(a0)
		suba.l     a0,a0
		moveq.l    #50,d0
		jsr        Awi_sendall
		moveq.l    #1,d0
		lea.l      114(a7),a7
		rts

	.globl Aev_GetPrnChanged
Aev_GetPrnChanged:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		movea.l    (a0),a0
		addq.w     #6,a0
		moveq.l    #51,d0
		jsr        Awi_sendall
		moveq.l    #1,d0
		addq.w     #4,a7
		rts

	.globl Aev_GetColorsChanged
Aev_GetColorsChanged:
		movea.l    ACSblk,a0
		cmpi.w     #$0008,28(a0)
		bgt.s      Aev_GetColorsChanged_1
		movea.l    ACSblk,a0
		addq.w     #8,a0
		moveq.l    #-1,d1
		movea.l    ACSblk,a1
		move.w     (a1),d0
		jsr        Aev_WmRedraw
Aev_GetColorsChanged_1:
		moveq.l    #1,d0
		rts

	.globl Aev_GetAcClose
Aev_GetAcClose:
		subq.w     #4,a7
		jsr        Awi_root
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Aev_GetAcClose_1
		clr.w      d0
		bra.s      Aev_GetAcClose_2
Aev_GetAcClose_1:
		jsr        Awi_invalid
		jsr        Aev_unhidepointer
		suba.l     a0,a0
		moveq.l    #1,d0
		jsr        Awi_sendall
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		bne.s      Aev_GetAcClose_3
		movea.l    ListOfApps,a0
		movea.l    ListOfApps,a1
		movea.l    8(a1),a1
		jsr        (a1)
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		bne.s      Aev_GetAcClose_3
		moveq.l    #-1,d1
		suba.l     a0,a0
		clr.w      d0
		jsr        Aev_AccID
		moveq.l    #-1,d1
		suba.l     a0,a0
		clr.w      d0
		jsr        Aev_AvProtokoll
Aev_GetAcClose_3:
		moveq.l    #1,d0
Aev_GetAcClose_2:
		addq.w     #4,a7
		rts

	.globl Aev_GetAcOpen
Aev_GetAcOpen:
		subq.w     #4,a7
		jsr        Awi_root
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Aev_GetAcOpen_1
		movea.l    (a7),a0
		jsr        Awi_show
Aev_GetAcOpen_1:
		moveq.l    #1,d0
		addq.w     #4,a7
		rts

	.globl Aev_WmRedraw
Aev_WmRedraw:
		lea.l      -26(a7),a7
		move.w     d0,24(a7)
		move.w     d1,22(a7)
		move.l     a0,18(a7)
		move.w     #$0014,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		clr.w      4(a7)
		move.w     22(a7),d0
		bpl.s      Aev_WmRedraw_1
		clr.w      d0
		bra.s      Aev_WmRedraw_2
Aev_WmRedraw_1:
		move.w     22(a7),d0
Aev_WmRedraw_2:
		move.w     d0,6(a7)
		movea.l    18(a7),a0
		move.w     (a0),8(a7)
		movea.l    18(a7),a0
		move.w     2(a0),10(a7)
		movea.l    18(a7),a0
		move.w     4(a0),12(a7)
		movea.l    18(a7),a0
		move.w     6(a0),14(a7)
		movea.l    _globl,a1
		lea.l      (a7),a0
		moveq.l    #16,d1
		move.w     24(a7),d0
		jsr        mt_appl_write
		move.w     d0,16(a7)
		move.w     22(a7),d0
		bpl.s      Aev_WmRedraw_3
		movea.l    18(a7),a0
		move.w     6(a0),-(a7)
		movea.l    20(a7),a0
		move.w     4(a0),-(a7)
		movea.l    22(a7),a0
		move.w     2(a0),-(a7)
		movea.l    24(a7),a0
		move.w     (a0),-(a7)
		movea.l    26(a7),a0
		move.w     6(a0),-(a7)
		movea.l    28(a7),a0
		move.w     4(a0),-(a7)
		movea.l    _globl,a0
		movea.l    30(a7),a1
		move.w     2(a1),d2
		movea.l    30(a7),a1
		move.w     (a1),d1
		moveq.l    #3,d0
		jsr        mt_form_dial
		lea.l      12(a7),a7
Aev_WmRedraw_3:
		move.w     16(a7),d0
		beq.s      Aev_WmRedraw_4
		moveq.l    #1,d0
		bra.s      Aev_WmRedraw_5
Aev_WmRedraw_4:
		clr.w      d0
Aev_WmRedraw_5:
		lea.l      26(a7),a7
		rts

