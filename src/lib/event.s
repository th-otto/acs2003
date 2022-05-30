	.globl Aev_unhidepointer
Aev_unhidepointer:
		move.w     hidepointer,d0
		beq.s      Aev_unhidepointer_1
		clr.w      hidepointer
		jsr        Amo_show
Aev_unhidepointer_1:
		rts

	.globl Aev_quit
Aev_quit:
		moveq.l    #1,d0
		move.w     d0,exitapp
		movea.l    ACSblk,a0
		move.w     d0,570(a0)
		rts

IsDeadKey:
		lea.l      -20(a7),a7
		move.l     a0,12(a7)
		move.w     d0,10(a7)
		move.l     a1,6(a7)
		clr.w      4(a7)
		movea.l    6(a7),a0
		move.w     10(a7),(a0)
		move.w     dead_handling,d0
		beq.s      IsDeadKey_1
		clr.w      d0
		bra        IsDeadKey_2
IsDeadKey_1:
		move.w     #$0001,dead_handling
		move.w     dead_key,d0
		beq        IsDeadKey_3
		moveq.l    #-1,d0
		and.b      dead_key+1,d0
		ext.w      d0
		lea.l      DeadKeys,a0
		jsr        strchr
		move.l     a0,(a7)
		move.l     (a7),d0
		beq        IsDeadKey_4
		movea.l    (a7),a0
		suba.l     #DeadKeys,a0
		move.w     a0,18(a7)
		moveq.l    #-1,d0
		and.b      11(a7),d0
		ext.w      d0
		move.w     18(a7),d1
		lsl.w      #3,d1
		lea.l      CombKeys,a0
		movea.l    0(a0,d1.w),a0
		jsr        strchr
		move.l     a0,(a7)
		move.w     10(a7),d0
		and.w      #$8000,d0
		bne.s      IsDeadKey_5
		move.l     (a7),d0
		beq.s      IsDeadKey_5
		moveq.l    #-1,d0
		and.b      dead_key+1,d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      1266(a0),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      IsDeadKey_5
		movea.l    (a7),a0
		move.w     18(a7),d0
		lsl.w      #3,d0
		lea.l      CombKeys,a1
		suba.l     0(a1,d0.w),a0
		move.w     a0,16(a7)
		move.w     16(a7),d0
		move.w     18(a7),d1
		lsl.w      #3,d1
		lea.l      CombKeys,a0
		movea.l    4(a0,d1.w),a0
		move.b     0(a0,d0.w),d0
		ext.w      d0
		movea.l    6(a7),a0
		move.w     d0,(a0)
		bra.s      IsDeadKey_4
IsDeadKey_5:
		movea.l    ACSblk,a0
		move.w     dead_key,718(a0)
		movea.l    12(a7),a0
		jsr        evkeybrd
		movea.l    6(a7),a0
		move.w     10(a7),(a0)
IsDeadKey_4:
		clr.w      dead_key
		bra.s      IsDeadKey_6
IsDeadKey_3:
		move.w     10(a7),d0
		and.w      #$8000,d0
		bne.s      IsDeadKey_6
		moveq.l    #-1,d0
		and.b      11(a7),d0
		ext.w      d0
		lea.l      DeadKeys,a0
		jsr        strchr
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      IsDeadKey_6
		moveq.l    #-1,d0
		and.b      11(a7),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      1266(a0),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      IsDeadKey_6
		move.w     10(a7),dead_key
		movea.l    6(a7),a0
		clr.w      (a0)
		move.w     #$0001,4(a7)
IsDeadKey_6:
		clr.w      dead_handling
		move.w     4(a7),d0
IsDeadKey_2:
		lea.l      20(a7),a7
		rts

	.globl evkeybrd
evkeybrd:
		move.l     a2,-(a7)
		lea.l      -32(a7),a7
		move.l     a0,28(a7)
		lea.l      xe0794,a0
		lea.l      6(a7),a1
		moveq.l    #15,d0
evkeybrd_1:
		move.b     (a0)+,(a1)+
		dbf        d0,evkeybrd_1
		move.w     #$FFFF,4(a7)
		clr.l      (a7)
		movea.l    ACSblk,a1
		lea.l      718(a1),a1
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		movea.l    28(a7),a0
		bsr        IsDeadKey
		tst.w      d0
		beq.s      evkeybrd_2
		clr.w      d0
		bra        evkeybrd_3
evkeybrd_2:
		jsr        Awi_root
		move.l     a0,24(a7)
		move.l     28(a7),d0
		bne.s      evkeybrd_4
		clr.l      -(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		pea.l      34(a7)
		moveq.l    #10,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		move.w     22(a7),d0
		jsr        Awi_wid
		move.l     a0,28(a7)
		move.l     28(a7),d0
		bne.s      evkeybrd_4
		move.w     _ACSv_wmenu,d0
		bne.s      evkeybrd_4
		movea.l    24(a7),a0
		move.w     32(a0),d0
		bpl.s      evkeybrd_5
		movea.l    24(a7),a0
		movea.l    24(a7),a1
		movea.l    12(a1),a1
		jsr        (a1)
evkeybrd_5:
		moveq.l    #-1,d0
		bra        evkeybrd_3
evkeybrd_4:
		movea.l    ACSblk,a1
		lea.l      718(a1),a1
		movea.l    ACSblk,a0
		lea.l      614(a0),a0
		movea.l    ACSblk,a2
		movea.l    694(a2),a2
		jsr        (a2)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		bne.s      evkeybrd_6
		move.w     4(a7),d0
		bra        evkeybrd_3
evkeybrd_6:
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		and.w      #$0C00,d0
		cmp.w      #$0C00,d0
		bne.s      evkeybrd_7
		movea.l    ACSblk,a0
		move.b     719(a0),d0
		ext.w      d0
		sub.w      #$0051,d0
		beq.s      evkeybrd_8
		bra.s      evkeybrd_7
evkeybrd_8:
		move.w     quote,d0
		bne.s      evkeybrd_9
		move.w     #$0001,quote
		move.w     4(a7),d0
		bra        evkeybrd_3
evkeybrd_9:
		nop
evkeybrd_7:
		move.w     hidepointer,d0
		bne.s      evkeybrd_10
		moveq.l    #8,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      evkeybrd_10
		move.w     #$0001,hidepointer
		jsr        Amo_hide
evkeybrd_10:
		move.w     quote,d0
		bne        evkeybrd_11
		move.l     28(a7),d0
		beq        evkeybrd_12
		jsr        Awi_modal
		move.l     a0,d0
		bne.s      evkeybrd_13
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    28(a7),a0
		jsr        Ame_key
		move.w     d0,4(a7)
		bmi.s      evkeybrd_13
		bra        evkeybrd_14
evkeybrd_13:
		move.w     #$0080,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq        evkeybrd_15
		jsr        Awi_modal
		move.l     a0,d0
		bne.s      evkeybrd_16
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    24(a7),a0
		jsr        Ame_key
		move.w     d0,4(a7)
		bmi.s      evkeybrd_16
		bra        evkeybrd_14
evkeybrd_16:
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    28(a7),a0
		jsr        Aob_tobkey
		move.w     d0,4(a7)
		bmi.s      evkeybrd_17
		bra        evkeybrd_14
evkeybrd_17:
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    28(a7),a0
		jsr        Aob_wobkey
		move.w     d0,4(a7)
		bmi.s      evkeybrd_18
		bra        evkeybrd_14
evkeybrd_18:
		bra        evkeybrd_12
evkeybrd_15:
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    28(a7),a0
		jsr        Aob_tobkey
		move.w     d0,4(a7)
		bmi.s      evkeybrd_19
		bra        evkeybrd_14
evkeybrd_19:
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    28(a7),a0
		jsr        Aob_wobkey
		move.w     d0,4(a7)
		bmi.s      evkeybrd_20
		bra        evkeybrd_14
evkeybrd_20:
		jsr        Awi_modal
		move.l     a0,d0
		bne.s      evkeybrd_12
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    24(a7),a0
		jsr        Ame_key
		move.w     d0,4(a7)
		bmi.s      evkeybrd_12
		bra        evkeybrd_14
evkeybrd_12:
		jsr        Awi_modal
		move.l     a0,d0
		bne.w      evkeybrd_11
		move.l     24(a7),d0
		beq.s      evkeybrd_11
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    24(a7),a0
		jsr        Ame_key
		move.w     d0,4(a7)
		bpl.s      evkeybrd_11
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    24(a7),a0
		jsr        Aob_tobkey
		move.w     d0,4(a7)
		bmi.s      evkeybrd_21
		bra        evkeybrd_14
evkeybrd_21:
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    24(a7),a0
		jsr        Aob_wobkey
		move.w     d0,4(a7)
		bmi.s      evkeybrd_11
		bra        evkeybrd_14
evkeybrd_11:
		movea.l    ACSblk,a1
		lea.l      718(a1),a1
		movea.l    ACSblk,a0
		lea.l      614(a0),a0
		movea.l    ACSblk,a2
		movea.l    706(a2),a2
		jsr        (a2)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		bne.s      evkeybrd_22
		bra        evkeybrd_14
evkeybrd_22:
		move.l     28(a7),d0
		beq.s      evkeybrd_23
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    28(a7),a0
		movea.l    28(a7),a1
		movea.l    98(a1),a1
		jsr        (a1)
		move.w     d0,4(a7)
evkeybrd_23:
		cmpi.w     #$FFFF,4(a7)
		bge.s      evkeybrd_24
		bra.s      evkeybrd_25
evkeybrd_26:
		moveq.l    #4,d0
		movea.l    (a7),a0
		and.l      2(a0),d0
		beq.s      evkeybrd_25
		moveq.l    #1,d0
		movea.l    (a7),a0
		and.w      12(a0),d0
		beq.s      evkeybrd_25
		move.w     #$4710,6(a7)
		movea.l    ACSblk,a0
		move.w     (a0),8(a7)
		movea.l    ACSblk,a0
		move.w     614(a0),12(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,14(a7)
		movea.l    _globl,a1
		lea.l      6(a7),a0
		moveq.l    #16,d1
		movea.l    (a7),a2
		move.w     (a2),d0
		jsr        mt_appl_write
		bra.s      evkeybrd_24
evkeybrd_25:
		movea.l    (a7),a0
		jsr        Ash_nextdd
		move.l     a0,(a7)
		bne.s      evkeybrd_26
evkeybrd_24:
		clr.w      quote
evkeybrd_14:
		move.w     4(a7),d0
evkeybrd_3:
		lea.l      32(a7),a7
		movea.l    (a7)+,a2
		rts

ev_dobutton:
		lea.l      -34(a7),a7
		move.l     a0,30(a7)
		move.l     a1,26(a7)
		move.w     d0,24(a7)
		move.w     d1,22(a7)
		move.w     d2,20(a7)
		move.w     #$FFFF,8(a7)
		move.w     22(a7),-(a7)
		move.w     26(a7),d2
		moveq.l    #8,d1
		clr.w      d0
		movea.l    28(a7),a0
		jsr        Adr_find
		addq.w     #2,a7
		move.w     d0,12(a7)
		move.w     12(a7),d0
		bpl.s      ev_dobutton_1
		moveq.l    #-1,d0
		bra        ev_dobutton_2
ev_dobutton_1:
		clr.w      18(a7)
		clr.w      14(a7)
		move.w     12(a7),10(a7)
		bra.s      ev_dobutton_3
ev_dobutton_5:
		move.w     10(a7),d0
		movea.l    26(a7),a0
		jsr        Aob_up
		move.w     d0,10(a7)
ev_dobutton_3:
		move.w     10(a7),d0
		bmi.s      ev_dobutton_4
		move.w     10(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    26(a7),a0
		move.w     8(a0,d0.l),d0
		and.w      #$2049,d0
		beq.s      ev_dobutton_5
ev_dobutton_4:
		move.w     10(a7),d0
		bmi.s      ev_dobutton_6
		move.w     10(a7),12(a7)
ev_dobutton_6:
		move.w     12(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    26(a7),a0
		adda.l     d0,a0
		move.l     a0,(a7)
		cmpi.w     #$0002,20(a7)
		bge        ev_dobutton_7
		movea.l    (a7),a0
		move.w     8(a0),d0
		and.w      #$2049,d0
		bne.s      ev_dobutton_8
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		jsr        Adr_box
		moveq.l    #-1,d0
		bra        ev_dobutton_2
		bra        ev_dobutton_7
ev_dobutton_8:
		movea.l    (a7),a0
		move.w     8(a0),d0
		and.w      #$205D,d0
		subq.w     #1,d0
		bne.s      ev_dobutton_9
		move.w     #$0001,18(a7)
		bra        ev_dobutton_7
ev_dobutton_9:
		movea.l    (a7),a0
		move.w     8(a0),d0
		and.w      #$2000,d0
		beq.s      ev_dobutton_10
		moveq.l    #1,d0
		movea.l    (a7),a0
		and.w      10(a0),d0
		beq.s      ev_dobutton_11
		moveq.l    #3,d0
		movea.l    ACSblk,a0
		and.w      614(a0),d0
		beq.s      ev_dobutton_12
		move.w     #$0001,18(a7)
		bra.s      ev_dobutton_13
ev_dobutton_12:
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		jsr        Adr_drag
		moveq.l    #-1,d0
		bra        ev_dobutton_2
ev_dobutton_13:
		bra.s      ev_dobutton_14
ev_dobutton_11:
		moveq.l    #3,d0
		movea.l    ACSblk,a0
		and.w      614(a0),d0
		beq.s      ev_dobutton_15
		move.w     #$0001,18(a7)
		move.w     #$0001,14(a7)
		bra.s      ev_dobutton_14
ev_dobutton_15:
		jsr        Adr_unselect
ev_dobutton_14:
		bra.s      ev_dobutton_7
ev_dobutton_10:
		moveq.l    #4,d0
		movea.l    (a7),a0
		and.w      8(a0),d0
		beq.s      ev_dobutton_7
		move.w     40(a7),d0
		or.w       12(a7),d0
		movea.l    30(a7),a0
		jsr        Aob_watch
		tst.w      d0
		bne.s      ev_dobutton_7
		moveq.l    #-1,d0
		bra        ev_dobutton_2
ev_dobutton_7:
		cmpi.w     #$0002,20(a7)
		blt.s      ev_dobutton_16
		moveq.l    #1,d1
		bra.s      ev_dobutton_17
ev_dobutton_16:
		clr.w      d1
ev_dobutton_17:
		move.w     12(a7),d0
		movea.l    26(a7),a1
		movea.l    30(a7),a0
		jsr        Aob_select
		tst.w      d0
		beq.s      ev_dobutton_18
		move.w     40(a7),d0
		or.w       12(a7),d0
		move.w     d0,8(a7)
ev_dobutton_18:
		move.w     18(a7),d0
		beq.w      ev_dobutton_19
		move.w     #$0002,16(a7)
ev_dobutton_21:
		subq.w     #1,16(a7)
		movea.l    _globl,a0
		moveq.l    #10,d0
		jsr        mt_evnt_timer
		move.l     _globl,-(a7)
		pea.l      10(a7)
		pea.l      12(a7)
		lea.l      18(a7),a1
		lea.l      18(a7),a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		move.w     4(a7),d0
		move.w     38(a7),d1
		eor.w      d1,d0
		and.w      #$0001,d0
		bne.s      ev_dobutton_20
		move.w     16(a7),d0
		bgt.s      ev_dobutton_21
		move.w     14(a7),d0
		beq.s      ev_dobutton_21
ev_dobutton_20:
		move.w     14(a7),d0
		beq.s      ev_dobutton_19
		move.w     16(a7),d0
		bgt.s      ev_dobutton_19
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		jsr        Adr_drag
ev_dobutton_19:
		move.w     8(a7),d0
ev_dobutton_2:
		lea.l      34(a7),a7
		rts

evmwheel:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.w     d0,8(a7)
		move.w     d1,6(a7)
		movea.l    _globl,a0
		move.w     6(a7),d1
		move.w     8(a7),d0
		jsr        mt_wind_find
		move.w     d0,4(a7)
		move.w     4(a7),d0
		bmi.s      evmwheel_1
		move.w     4(a7),d0
		jsr        Awi_wid
		bra.s      evmwheel_2
evmwheel_1:
		jsr        Awi_ontop
evmwheel_2:
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      evmwheel_3
		move.w     6(a7),d1
		move.w     8(a7),d0
		movea.l    10(a7),a1
		movea.l    (a7),a0
		jsr        Awi_wheeled
		bra.s      evmwheel_4
		bra.s      evmwheel_4
evmwheel_3:
		clr.w      d0
		nop
evmwheel_4:
		lea.l      14(a7),a7
		rts

	.globl evbutton
evbutton:
		move.l     a2,-(a7)
		lea.l      -30(a7),a7
		move.w     d0,28(a7)
		move.w     d1,26(a7)
		clr.w      18(a7)
		bsr        Aev_unhidepointer
		lea.l      26(a7),a1
		lea.l      28(a7),a0
		movea.l    ACSblk,a2
		movea.l    698(a2),a2
		jsr        (a2)
		movea.l    _globl,a0
		movea.l    ACSblk,a1
		move.w     612(a1),d1
		movea.l    ACSblk,a1
		move.w     610(a1),d0
		jsr        mt_wind_find
		move.w     d0,24(a7)
		move.w     24(a7),d0
		jsr        Awi_wid
		move.l     a0,8(a7)
		move.l     8(a7),d0
		bne.s      evbutton_1
		moveq.l    #-1,d0
		bra        evbutton_2
evbutton_1:
		jsr        Awi_modal
		move.l     a0,4(a7)
		move.l     4(a7),d0
		beq.s      evbutton_3
		movea.l    4(a7),a0
		cmpa.l     8(a7),a0
		beq.s      evbutton_3
		jsr        Awi_up_modal
		moveq.l    #-1,d0
		bra        evbutton_2
evbutton_3:
		movea.l    ACSblk,a0
		move.w     612(a0),d0
		movea.l    8(a7),a0
		sub.w      54(a0),d0
		move.w     d0,20(a7)
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    8(a7),a0
		sub.w      52(a0),d0
		move.w     d0,22(a7)
		moveq.l    #2,d0
		and.w      28(a7),d0
		beq        evbutton_4
		move.l     _globl,-(a7)
		pea.l      18(a7)
		pea.l      20(a7)
		lea.l      26(a7),a1
		lea.l      26(a7),a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		moveq.l    #2,d0
		and.w      12(a7),d0
		beq.s      evbutton_5
		move.l     _globl,-(a7)
		pea.l      18(a7)
		pea.l      22(a7)
		pea.l      26(a7)
		pea.l      28(a7)
		pea.l      34(a7)
		pea.l      ($000000FA).w
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		lea.l      64(a7),a1
		suba.l     a0,a0
		moveq.l    #2,d2
		clr.w      d1
		moveq.l    #34,d0
		jsr        mt_evnt_multi
		lea.l      50(a7),a7
		move.w     d0,16(a7)
		bra.s      evbutton_6
evbutton_5:
		move.w     #$0002,16(a7)
evbutton_6:
		moveq.l    #2,d0
		and.w      16(a7),d0
		beq.s      evbutton_7
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    8(a7),a0
		jsr        Awi_bubblegem
		move.w     d0,18(a7)
		bra.s      evbutton_8
evbutton_7:
		moveq.l    #32,d0
		and.w      16(a7),d0
		beq.s      evbutton_8
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    8(a7),a0
		jsr        Awi_context
		move.w     d0,18(a7)
evbutton_8:
		move.w     18(a7),d0
		bne.s      evbutton_9
		moveq.l    #2,d0
		and.w      16(a7),d0
		beq.s      evbutton_10
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    8(a7),a0
		jsr        Awi_context
		move.w     d0,18(a7)
		bra.s      evbutton_9
evbutton_10:
		moveq.l    #32,d0
		and.w      16(a7),d0
		beq.s      evbutton_9
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    8(a7),a0
		jsr        Awi_bubblegem
		move.w     d0,18(a7)
evbutton_9:
		bra        evbutton_11
evbutton_4:
		move.w     20(a7),d0
		bpl.w      evbutton_12
		movea.l    8(a7),a0
		move.l     24(a0),(a7)
		move.l     (a7),d0
		beq.s      evbutton_13
		movea.l    (a7),a0
		move.w     20(a7),d0
		cmp.w      18(a0),d0
		blt.s      evbutton_13
		move.w     #$1000,-(a7)
		move.w     30(a7),-(a7)
		move.w     30(a7),d2
		move.w     24(a7),d1
		move.w     26(a7),d0
		movea.l    4(a7),a1
		movea.l    12(a7),a0
		bsr        ev_dobutton
		addq.w     #4,a7
		bra        evbutton_2
evbutton_13:
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      evbutton_14
		move.w     24(a7),d0
		beq.s      evbutton_14
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    8(a7),a0
		jsr        Ame_drop
evbutton_14:
		move.w     #$FFFF,18(a7)
		bra.s      evbutton_11
evbutton_12:
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    8(a7),a0
		lea.l      52(a0),a0
		jsr        Aob_within
		tst.w      d0
		beq.s      evbutton_11
		movea.l    8(a7),a0
		move.l     20(a0),d0
		beq.s      evbutton_11
		clr.w      -(a7)
		move.w     30(a7),-(a7)
		move.w     30(a7),d2
		move.w     24(a7),d1
		move.w     26(a7),d0
		movea.l    12(a7),a0
		movea.l    20(a0),a1
		movea.l    12(a7),a0
		bsr        ev_dobutton
		addq.w     #4,a7
		move.w     d0,18(a7)
evbutton_11:
		move.w     18(a7),d0
evbutton_2:
		lea.l      30(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl evmouse
evmouse:
		move.l     a2,-(a7)
		lea.l      -24(a7),a7
		movea.l    ACSblk,a0
		movea.l    702(a0),a0
		jsr        (a0)
		clr.l      -(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		pea.l      34(a7)
		moveq.l    #10,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		move.w     22(a7),d0
		jsr        Awi_wid
		move.l     a0,8(a7)
		move.l     8(a7),d0
		bne.s      evmouse_1
		bra        evmouse_2
evmouse_1:
		jsr        Awi_modal
		move.l     a0,4(a7)
		move.l     4(a7),d0
		beq.s      evmouse_3
		movea.l    4(a7),a0
		cmpa.l     8(a7),a0
		beq.s      evmouse_3
		jsr        Awi_up_modal
		bra        evmouse_2
evmouse_3:
		movea.l    8(a7),a0
		jsr        Awi_shadow
		tst.w      d0
		beq.s      evmouse_4
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      56(a0),a0
		jsr        Amo_new
		bra        evmouse_2
evmouse_4:
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    8(a7),a0
		lea.l      52(a0),a0
		jsr        Aob_within
		tst.w      d0
		beq        evmouse_5
		movea.l    8(a7),a0
		move.l     20(a0),(a7)
		move.l     (a7),d0
		beq        evmouse_6
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    8(a7),a0
		sub.w      52(a0),d0
		move.w     d0,18(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),d0
		movea.l    8(a7),a0
		sub.w      54(a0),d0
		move.w     d0,16(a7)
		clr.w      14(a7)
		move.w     16(a7),-(a7)
		move.w     20(a7),d2
		moveq.l    #8,d1
		clr.w      d0
		movea.l    2(a7),a0
		jsr        Adr_find
		addq.w     #2,a7
		move.w     d0,20(a7)
		bra        evmouse_7
evmouse_11:
		moveq.l    #8,d0
		move.w     20(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    (a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      evmouse_8
		move.w     #$0080,d0
		move.w     20(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    (a7),a0
		and.w      8(a0,d1.l),d0
		bne.s      evmouse_8
		move.w     #$0004,14(a7)
evmouse_8:
		moveq.l    #32,d0
		move.w     20(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    (a7),a0
		and.w      8(a0,d1.l),d0
		bne.s      evmouse_9
		move.w     20(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a7),a0
		move.w     32(a0,d0.l),d0
		and.w      #$8000,d0
		beq.s      evmouse_9
		moveq.l    #31,d0
		move.w     20(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    (a7),a0
		and.w      44(a0,d1.l),d0
		move.w     d0,12(a7)
		move.w     12(a7),d0
		ble.s      evmouse_9
		move.w     12(a7),14(a7)
evmouse_9:
		move.w     20(a7),d0
		movea.l    (a7),a0
		jsr        Aob_up
		move.w     d0,20(a7)
evmouse_7:
		move.w     20(a7),d0
		bmi.s      evmouse_10
		move.w     14(a7),d0
		ble        evmouse_11
evmouse_10:
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		add.l      d0,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      56(a0,d0.l),a0
		jsr        Amo_new
evmouse_6:
		suba.l     a1,a1
		moveq.l    #4,d0
		movea.l    8(a7),a0
		movea.l    8(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		bra.s      evmouse_2
evmouse_5:
		bsr        Aev_unhidepointer
		jsr        Amo_point
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		bne.s      evmouse_2
		movea.l    8(a7),a0
		move.l     94(a0),d0
		beq.s      evmouse_2
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    8(a7),a0
		jsr        Ame_drop
evmouse_2:
		lea.l      24(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_mess
Aev_mess:
		lea.l      -20(a7),a7
		jsr        Awi_root
		move.l     a0,d0
		bne.s      Aev_mess_1
		bra        Aev_mess_2
Aev_mess_1:
		movea.l    ACSblk,a0
		move.w     638(a0),d0
		beq.s      Aev_mess_3
		bra        Aev_mess_2
Aev_mess_3:
		move.w     #$0004,16(a7)
		moveq.l    #16,d0
		jsr        Awi_update
		bra        Aev_mess_4
Aev_mess_8:
		move.l     _globl,-(a7)
		pea.l      22(a7)
		pea.l      26(a7)
		pea.l      30(a7)
		pea.l      34(a7)
		pea.l      38(a7)
		moveq.l    #20,d0
		move.l     d0,-(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		lea.l      68(a7),a1
		lea.l      50(a7),a0
		clr.w      d2
		clr.w      d1
		moveq.l    #48,d0
		jsr        mt_evnt_multi
		lea.l      50(a7),a7
		and.w      #$0010,d0
		beq.s      Aev_mess_5
		moveq.l    #32,d0
		jsr        Awi_update
		lea.l      (a7),a0
		jsr        Aev_message
		tst.w      d0
		beq.s      Aev_mess_6
		move.w     #$0004,16(a7)
		bra.s      Aev_mess_7
Aev_mess_6:
		subq.w     #1,16(a7)
Aev_mess_7:
		moveq.l    #16,d0
		jsr        Awi_update
		bra.s      Aev_mess_4
Aev_mess_5:
		subq.w     #1,16(a7)
Aev_mess_4:
		move.w     16(a7),d0
		bgt        Aev_mess_8
		moveq.l    #32,d0
		jsr        Awi_update
Aev_mess_2:
		lea.l      20(a7),a7
		rts

	.globl ACSeventhandler
ACSeventhandler:
		move.l     a2,-(a7)
		lea.l      -62(a7),a7
		jsr        Awi_root
		move.l     a0,58(a7)
		move.l     _globl,-(a7)
		pea.l      16(a7)
		pea.l      18(a7)
		lea.l      20(a7),a1
		lea.l      18(a7),a0
		moveq.l    #8,d0
		jsr        mt_appl_getinfo
		lea.l      12(a7),a7
		tst.w      d0
		beq.s      ACSeventhandler_1
		move.w     10(a7),d0
		beq.s      ACSeventhandler_2
		moveq.l    #1,d0
		bra.s      ACSeventhandler_3
ACSeventhandler_2:
		clr.w      d0
ACSeventhandler_3:
		move.w     d0,(a7)
		bra.s      ACSeventhandler_4
ACSeventhandler_1:
		clr.w      (a7)
ACSeventhandler_4:
		moveq.l    #32,d1
		clr.w      d0
		lea.l      6(a7),a0
		jsr        memset
		clr.w      d0
		movea.l    ACSblk,a0
		move.w     d0,612(a0)
		movea.l    ACSblk,a0
		move.w     d0,610(a0)
		movea.l    58(a7),a0
		move.l     94(a0),54(a7)
		move.l     54(a7),d0
		beq.s      ACSeventhandler_5
		bra.s      ACSeventhandler_6
ACSeventhandler_8:
		movea.l    54(a7),a0
		move.w     8(a0),d0
		and.w      #$8000,d0
		beq.s      ACSeventhandler_7
		movea.l    54(a7),a0
		movea.l    54(a7),a1
		move.w     10(a0),22(a1)
ACSeventhandler_7:
		addi.l     #$00000018,54(a7)
ACSeventhandler_6:
		moveq.l    #32,d0
		movea.l    54(a7),a0
		and.w      8(a0),d0
		beq.s      ACSeventhandler_8
ACSeventhandler_5:
		clr.w      d0
		move.w     d0,exitapp
		movea.l    ACSblk,a0
		move.w     d0,570(a0)
		movea.l    58(a7),a0
		move.l     94(a0),54(a7)
		move.l     54(a7),d0
		beq.s      ACSeventhandler_9
		bra.s      ACSeventhandler_10
ACSeventhandler_12:
		movea.l    54(a7),a0
		move.w     8(a0),d0
		and.w      #$8000,d0
		beq.s      ACSeventhandler_11
		movea.l    54(a7),a0
		movea.l    54(a7),a1
		move.w     22(a0),10(a1)
ACSeventhandler_11:
		addi.l     #$00000018,54(a7)
ACSeventhandler_10:
		moveq.l    #32,d0
		movea.l    54(a7),a0
		and.w      8(a0),d0
		beq.s      ACSeventhandler_12
ACSeventhandler_9:
		move.w     (a7),d0
		beq.s      ACSeventhandler_13
		move.w     #$0080,d0
		movea.l    ACSblk,a0
		or.w       710(a0),d0
		bra.s      ACSeventhandler_14
ACSeventhandler_13:
		movea.l    ACSblk,a0
		move.w     710(a0),d0
ACSeventhandler_14:
		move.w     d0,4(a7)
		move.l     _globl,-(a7)
		pea.l      10(a7)
		movea.l    ACSblk,a0
		pea.l      716(a0)
		movea.l    ACSblk,a0
		pea.l      718(a0)
		movea.l    ACSblk,a0
		pea.l      614(a0)
		movea.l    ACSblk,a0
		pea.l      714(a0)
		movea.l    ACSblk,a0
		pea.l      612(a0)
		movea.l    ACSblk,a0
		move.l     562(a0),d0
		moveq.l    #16,d1
		asr.l      d1,d0
		moveq.l    #0,d1
		move.w     d0,d1
		moveq.l    #16,d0
		lsl.l      d0,d1
		movea.l    ACSblk,a0
		moveq.l    #0,d0
		move.w     564(a0),d0
		or.l       d0,d1
		move.l     d1,-(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		moveq.l    #1,d0
		move.w     d0,-(a7)
		moveq.l    #1,d0
		move.w     d0,-(a7)
		movea.l    ACSblk,a0
		move.w     612(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     610(a0),-(a7)
		moveq.l    #1,d0
		move.w     d0,-(a7)
		movea.l    ACSblk,a0
		move.w     712(a0),-(a7)
		movea.l    ACSblk,a1
		lea.l      610(a1),a1
		lea.l      92(a7),a0
		move.w     58(a7),d2
		movea.l    ACSblk,a2
		move.w     720(a2),d1
		moveq.l    #55,d0
		jsr        mt_evnt_xmulti
		lea.l      54(a7),a7
		move.w     d0,2(a7)
		movea.l    ACSblk,a0
		move.w     614(a0),d1
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_gemks2n
		movea.l    ACSblk,a0
		move.w     d0,718(a0)
		moveq.l    #1,d0
		jsr        Awi_update
		moveq.l    #16,d0
		and.w      2(a7),d0
		beq.s      ACSeventhandler_15
		lea.l      38(a7),a0
		jsr        Aev_message
ACSeventhandler_15:
		moveq.l    #2,d0
		and.w      2(a7),d0
		beq.s      ACSeventhandler_16
		move.w     #$0080,d0
		movea.l    ACSblk,a0
		and.w      714(a0),d0
		beq.s      ACSeventhandler_17
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		lea.l      6(a7),a0
		bsr        evmwheel
ACSeventhandler_17:
		movea.l    ACSblk,a0
		move.w     716(a0),d1
		movea.l    ACSblk,a0
		move.w     714(a0),d0
		bsr        evbutton
ACSeventhandler_16:
		moveq.l    #1,d0
		and.w      2(a7),d0
		beq.s      ACSeventhandler_18
		suba.l     a0,a0
		bsr        evkeybrd
ACSeventhandler_18:
		move.l     _globl,-(a7)
		movea.l    ACSblk,a0
		pea.l      614(a0)
		movea.l    ACSblk,a0
		pea.l      714(a0)
		movea.l    ACSblk,a1
		lea.l      612(a1),a1
		movea.l    ACSblk,a0
		lea.l      610(a0),a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		movea.l    ACSblk,a0
		move.w     714(a0),d0
		bne.s      ACSeventhandler_19
		moveq.l    #4,d0
		and.w      2(a7),d0
		beq.s      ACSeventhandler_20
		bsr        Aev_unhidepointer
ACSeventhandler_20:
		bsr        evmouse
ACSeventhandler_19:
		jsr        Ax_release
		jsr        Awi_lateupdate
		movea.l    ACSblk,a0
		move.l     58(a7),600(a0)
		movea.l    ACSblk,a0
		movea.l    684(a0),a0
		jsr        (a0)
		clr.w      d0
		jsr        Awi_update
		suba.l     a0,a0
		jsr        Ax_mterm
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		beq.s      ACSeventhandler_21
		move.w     exitapp,d0
		bne.s      ACSeventhandler_22
ACSeventhandler_21:
		movea.l    ACSblk,a0
		move.w     638(a0),d0
		beq        ACSeventhandler_5
ACSeventhandler_22:
		movea.l    ACSblk,a0
		move.w     #$0001,570(a0)
		bsr        Aev_unhidepointer
		jsr        Amo_busy
		lea.l      62(a7),a7
		movea.l    (a7)+,a2
		rts

	.data

exitapp:
		dc.w $0000
hidepointer:
		dc.w $0000
DeadKeys:
		dc.b "^~'`"
		dc.w $b922
		dc.w $f82c
		dc.w $2f00
CombKeys:
		dc.l xe07a6
		dc.l xe07ad
		dc.l xe07b4
		dc.l xe07bc
		dc.l xe07c4
		dc.l xe07cc
		dc.l xe07d4
		dc.l xe07dc
		dc.l xe07e4
		dc.l xe07ef
		dc.l xe07fa
		dc.l xe0805
		dc.l xe0810
		dc.l xe0814
		dc.l xe0818
		dc.l xe081c
		dc.l xe0820
		dc.l xe0826
dead_handling:
		dc.w $0000
dead_key:
		dc.w $0000
xe0794:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
quote:
		dc.w $0000
xe07a6:
		dc.b ' aeiou',0
xe07ad:
		dc.b $5e
		dc.w $8388
		dc.w $8c93
		dc.w $9600
xe07b4:
		dc.b ' nNaoAo',0
xe07bc:
		dc.w $7ea4
		dc.w $a5b0
		dc.w $b1b7
		dc.w $b800
xe07c4:
		dc.b ' eEaiou',0
xe07cc:
		dc.w $2782
		dc.w $90a0
		dc.w $a1a2
		dc.w $a300
xe07d4:
		dc.b ' aeiouA',0
xe07dc:
		dc.w $6085
		dc.w $8a8d
		dc.w $9597
		dc.w $b600
xe07e4:
		dc.b ' aeiouyAOU',0
xe07ef:
		dc.b $b9
		dc.w $8489
		dc.w $8b94
		dc.w $8198
		dc.b 'Ž™š',0
xe07fa:
		dc.b ' aeiouyAOU',0
xe0805:
		dc.b $22
		dc.w $8489
		dc.w $8b94
		dc.w $8198
		dc.b 'Ž™š',0
xe0810:
		dc.b ' aA',0
xe0814:
		dc.w $f886
		dc.w $8f00
xe0818:
		dc.b ' cC',0
xe081c:
		dc.w $2c87
		dc.w $8000
xe0820:
		dc.b ' oO24',0
xe0826:
		dc.w $2fb3
		dc.w $b2ab
		dc.w $ac00
