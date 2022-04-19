	.text
	
	.globl Ash_thermometer
Ash_thermometer:
		move.l     a2,-(a7)
		lea.l      -22(a7),a7
		move.w     d0,20(a7)
		move.l     a0,16(a7)
		move.w     d1,14(a7)
		move.l     a1,10(a7)
		moveq.l    #114,d0
		jsr        Ax_malloc
		move.l     a0,6(a7)
		move.l     6(a7),d0
		bne.s      Ash_thermometer_1
		moveq.l    #-1,d0
		bra        Ash_thermometer_2
Ash_thermometer_1:
		moveq.l    #114,d1
		clr.w      d0
		movea.l    6(a7),a0
		jsr        memset
		movea.l    6(a7),a0
		move.l     10(a7),64(a0)
		movea.l    6(a7),a0
		move.l     30(a7),68(a0)
		movea.l    6(a7),a0
		move.l     34(a7),72(a0)
		movea.l    6(a7),a0
		move.l     38(a7),76(a0)
		movea.l    6(a7),a0
		move.l     42(a7),80(a0)
		movea.l    6(a7),a0
		move.l     46(a7),84(a0)
		movea.l    6(a7),a0
		move.l     50(a7),88(a0)
		movea.l    6(a7),a0
		move.w     20(a7),100(a0)
		movea.l    6(a7),a0
		move.l     16(a7),92(a0)
		movea.l    6(a7),a0
		move.w     14(a7),102(a0)
		movea.l    6(a7),a0
		movea.l    ThermWind+8,a1
		jsr        (a1)
		move.l     a0,2(a7)
		move.l     2(a7),d0
		beq.s      Ash_thermometer_3
		moveq.l    #8,d0
		and.w      20(a7),d0
		beq.s      Ash_thermometer_4
		movea.l    2(a7),a0
		movea.l    2(a7),a1
		movea.l    12(a1),a1
		jsr        (a1)
		move.w     #$0002,(a7)
		bra.s      Ash_thermometer_5
Ash_thermometer_4:
		movea.l    ACSblk,a0
		movea.l    6(a7),a1
		move.l     562(a0),106(a1)
		movea.l    ACSblk,a0
		move.l     #$00000001,562(a0)
		movea.l    2(a7),a0
		jsr        Awi_dialog
		move.w     d0,(a7)
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    2(a7),a0
		movea.l    2(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		movea.l    6(a7),a0
		movea.l    ACSblk,a1
		move.l     106(a0),562(a1)
		moveq.l    #114,d0
		movea.l    6(a7),a0
		jsr        Ax_recycle
Ash_thermometer_5:
		bra.w      Ash_thermometer_6
Ash_thermometer_3:
		move.l     30(a7),d0
		beq.s      Ash_thermometer_7
		movea.l    6(a7),a0
		movea.l    30(a7),a1
		jsr        (a1)
Ash_thermometer_7:
		move.l     34(a7),d0
		beq.s      Ash_thermometer_8
		movea.l    6(a7),a0
		movea.l    34(a7),a1
		jsr        (a1)
		tst.w      d0
		beq.s      Ash_thermometer_9
Ash_thermometer_8:
		move.l     38(a7),d0
		beq.s      Ash_thermometer_10
		bra.s      Ash_thermometer_11
Ash_thermometer_12:
		move.l     42(a7),d0
		beq.s      Ash_thermometer_11
		movea.l    6(a7),a0
		movea.l    42(a7),a1
		jsr        (a1)
Ash_thermometer_11:
		movea.l    6(a7),a0
		movea.l    38(a7),a1
		jsr        (a1)
		tst.w      d0
		bne.s      Ash_thermometer_12
Ash_thermometer_10:
		move.l     46(a7),d0
		beq.s      Ash_thermometer_9
		movea.l    6(a7),a0
		movea.l    46(a7),a1
		jsr        (a1)
Ash_thermometer_9:
		move.l     50(a7),d0
		beq.s      Ash_thermometer_13
		movea.l    6(a7),a0
		movea.l    50(a7),a1
		jsr        (a1)
Ash_thermometer_13:
		moveq.l    #114,d0
		movea.l    6(a7),a0
		jsr        Ax_recycle
Ash_thermometer_6:
		move.w     (a7),d0
Ash_thermometer_2:
		lea.l      22(a7),a7
		movea.l    (a7)+,a2
		rts

Prozent:
		lea.l      -24(a7),a7
		move.l     a0,20(a7)
		move.l     d0,16(a7)
		movea.l    20(a7),a0
		move.l     (a0),12(a7)
		movea.l    12(a7),a0
		move.w     98(a0),d1
		add.w      d1,d1
		lea.l      laufBNr,a0
		move.w     0(a0,d1.w),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    20(a7),a0
		movea.l    20(a0),a0
		adda.l     d0,a0
		move.l     a0,8(a7)
		movea.l    12(a7),a0
		move.w     98(a0),d1
		add.w      d1,d1
		lea.l      fixBNr,a0
		move.w     0(a0,d1.w),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    20(a7),a0
		movea.l    20(a0),a0
		adda.l     d0,a0
		move.l     a0,4(a7)
		clr.w      (a7)
		movea.l    4(a7),a0
		move.w     20(a0),d0
		ext.l      d0
		move.l     16(a7),d1
		jsr        _lmul
		moveq.l    #12,d1
		asr.l      d1,d0
		move.w     d0,2(a7)
		movea.l    8(a7),a0
		move.w     20(a0),d0
		cmp.w      2(a7),d0
		blt.s      Prozent_1
		move.w     2(a7),d0
		bne.s      Prozent_2
Prozent_1:
		movea.l    8(a7),a0
		move.w     2(a7),20(a0)
		movea.l    20(a7),a0
		movea.l    ACSblk,a1
		move.l     20(a0),604(a1)
		movea.l    12(a7),a0
		move.w     98(a0),d0
		add.w      d0,d0
		lea.l      laufBNr,a0
		movea.l    ACSblk,a1
		move.w     0(a0,d0.w),608(a1)
		moveq.l    #-1,d1
		movea.l    12(a7),a0
		move.w     98(a0),d2
		add.w      d2,d2
		lea.l      laufBNr,a0
		move.w     0(a0,d2.w),d0
		movea.l    20(a7),a0
		jsr        Awi_obchange
		move.w     #$0001,(a7)
Prozent_2:
		moveq.l    #4,d0
		movea.l    12(a7),a0
		and.w      100(a0),d0
		beq        Prozent_3
		move.l     16(a7),d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		add.l      d1,d0
		lsl.l      #2,d0
		moveq.l    #12,d1
		asr.l      d1,d0
		move.w     d0,2(a7)
		move.w     (a7),d0
		bne.s      Prozent_4
		movea.l    12(a7),a0
		move.w     2(a7),d0
		cmp.w      96(a0),d0
		bgt.s      Prozent_4
		move.w     2(a7),d0
		bne        Prozent_3
Prozent_4:
		movea.l    12(a7),a0
		move.w     2(a7),d0
		cmp.w      96(a0),d0
		bgt.s      Prozent_5
		move.w     2(a7),d0
		bne.s      Prozent_6
Prozent_5:
		movea.l    12(a7),a0
		move.w     2(a7),96(a0)
Prozent_6:
		move.w     2(a7),-(a7)
		lea.l      xe1464,a1
		movea.l    14(a7),a0
		move.w     98(a0),d1
		add.w      d1,d1
		lea.l      prozNr,a0
		move.w     0(a0,d1.w),d0
		movea.l    22(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_printf
		addq.w     #2,a7
		movea.l    20(a7),a0
		movea.l    ACSblk,a1
		move.l     20(a0),604(a1)
		movea.l    12(a7),a0
		move.w     98(a0),d0
		add.w      d0,d0
		lea.l      prozNr,a0
		movea.l    ACSblk,a1
		move.w     0(a0,d0.w),608(a1)
		movea.l    12(a7),a0
		move.w     98(a0),d1
		add.w      d1,d1
		lea.l      prozNr,a0
		move.w     0(a0,d1.w),d0
		movea.l    20(a7),a0
		jsr        Awi_obredraw
Prozent_3:
		lea.l      24(a7),a7
		rts

TextUpdate:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		movea.l    8(a7),a0
		move.l     (a0),(a7)
		moveq.l    #1,d0
		movea.l    (a7),a0
		and.w      100(a0),d0
		beq.s      TextUpdate_1
		movea.l    4(a7),a1
		movea.l    (a7),a0
		move.w     98(a0),d1
		add.w      d1,d1
		lea.l      textNr,a0
		move.w     0(a0,d1.w),d0
		movea.l    8(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		movea.l    ACSblk,a1
		move.l     20(a0),604(a1)
		movea.l    (a7),a0
		move.w     98(a0),d0
		add.w      d0,d0
		lea.l      textNr,a0
		movea.l    ACSblk,a1
		move.w     0(a0,d0.w),608(a1)
		movea.l    (a7),a0
		move.w     98(a0),d1
		add.w      d1,d1
		lea.l      textNr,a0
		move.w     0(a0,d1.w),d0
		movea.l    8(a7),a0
		jsr        Awi_obredraw
TextUpdate_1:
		lea.l      12(a7),a7
		rts

ThermoCreate:
		move.l     a2,-(a7)
		lea.l      -18(a7),a7
		move.l     a0,10(a7)
		move.l     10(a7),2(a7)
		move.l     2(a7),d0
		bne.s      ThermoCreate_1
		suba.l     a0,a0
		bra        ThermoCreate_2
ThermoCreate_1:
		moveq.l    #3,d0
		movea.l    2(a7),a0
		and.w      100(a0),d0
		movea.l    2(a7),a0
		move.w     d0,98(a0)
		movea.l    2(a7),a0
		move.w     98(a0),d0
		lsl.w      #2,d0
		lea.l      ThermObjs,a0
		move.l     0(a0,d0.w),ThermWind+20
		movea.l    2(a7),a0
		move.l     92(a0),ThermWind+74
		lea.l      ThermWind,a0
		jsr        Awi_create
		move.l     a0,6(a7)
		move.l     6(a7),d0
		bne.s      ThermoCreate_3
		suba.l     a0,a0
		bra        ThermoCreate_2
ThermoCreate_3:
		movea.l    6(a7),a0
		movea.l    20(a0),a0
		movea.l    6(a7),a1
		move.w     20(a0),56(a1)
		movea.l    6(a7),a0
		movea.l    20(a0),a0
		movea.l    6(a7),a1
		move.w     22(a0),58(a1)
		move.l     _globl,-(a7)
		movea.l    10(a7),a0
		pea.l      42(a0)
		movea.l    14(a7),a0
		pea.l      40(a0)
		movea.l    18(a7),a0
		move.w     58(a0),-(a7)
		movea.l    20(a7),a0
		move.w     56(a0),-(a7)
		movea.l    22(a7),a0
		move.w     54(a0),-(a7)
		lea.l      18(a7),a1
		lea.l      18(a7),a0
		movea.l    24(a7),a2
		move.w     52(a2),d2
		movea.l    24(a7),a2
		move.w     34(a2),d1
		clr.w      d0
		jsr        mt_wind_calc
		lea.l      18(a7),a7
		movea.l    6(a7),a0
		move.l     2(a7),(a0)
		movea.l    2(a7),a0
		move.l     6(a7),110(a0)
		movea.l    2(a7),a0
		move.l     #$FFFFFFFF,(a0)
		movea.l    2(a7),a0
		clr.l      4(a0)
		movea.l    2(a7),a0
		clr.l      8(a0)
		movea.l    2(a7),a0
		move.w     98(a0),d1
		add.w      d1,d1
		lea.l      laufBNr,a0
		move.w     0(a0,d1.w),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		movea.l    20(a0),a0
		clr.w      20(a0,d0.l)
		moveq.l    #0,d0
		movea.l    6(a7),a0
		bsr        Prozent
		movea.l    2(a7),a0
		move.w     102(a0),d0
		bmi.s      ThermoCreate_4
		movea.l    ACSblk,a0
		cmpi.w     #$0010,26(a0)
		blt.s      ThermoCreate_4
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0100,d0
		bne.s      ThermoCreate_4
		movea.l    2(a7),a0
		move.w     98(a0),d1
		add.w      d1,d1
		lea.l      laufBNr,a0
		move.w     0(a0,d1.w),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		movea.l    20(a0),a0
		move.l     12(a0,d0.l),14(a7)
		movea.l    14(a7),a0
		andi.l     #$FFFFFF80,4(a0)
		moveq.l    #15,d0
		movea.l    2(a7),a0
		and.w      102(a0),d0
		ext.l      d0
		or.l       #$00000070,d0
		movea.l    14(a7),a0
		or.l       d0,4(a0)
ThermoCreate_4:
		movea.l    2(a7),a0
		move.l     (a0),d0
		bpl.s      ThermoCreate_5
		movea.l    2(a7),a0
		move.l     68(a0),d0
		beq.s      ThermoCreate_5
		movea.l    2(a7),a0
		movea.l    2(a7),a1
		movea.l    68(a1),a1
		jsr        (a1)
		tst.w      d0
		bne.s      ThermoCreate_5
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    6(a7),a0
		movea.l    6(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
ThermoCreate_5:
		moveq.l    #1,d0
		movea.l    2(a7),a0
		and.w      100(a0),d0
		beq.s      ThermoCreate_6
		movea.l    2(a7),a1
		lea.l      12(a1),a1
		movea.l    2(a7),a0
		move.w     98(a0),d1
		add.w      d1,d1
		lea.l      textNr,a0
		move.w     0(a0,d1.w),d0
		movea.l    6(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_puttext
ThermoCreate_6:
		moveq.l    #4,d0
		movea.l    2(a7),a0
		and.w      100(a0),d0
		bne.s      ThermoCreate_7
		moveq.l    #1,d2
		bra.s      ThermoCreate_8
ThermoCreate_7:
		clr.w      d2
ThermoCreate_8:
		move.w     #$0080,d1
		movea.l    2(a7),a0
		move.w     98(a0),d0
		add.w      d0,d0
		lea.l      prozNr,a0
		move.w     0(a0,d0.w),d0
		movea.l    6(a7),a0
		jsr        Aob_flags
		movea.l    6(a7),a0
		ori.w      #$0024,86(a0)
		movea.l    2(a7),a0
		clr.w      104(a0)
		movea.l    6(a7),a0
ThermoCreate_2:
		lea.l      18(a7),a7
		movea.l    (a7)+,a2
		rts

ThermoService:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		movea.l    6(a7),a0
		move.l     (a0),(a7)
		move.w     4(a7),d0
		subq.w     #2,d0
		beq.s      ThermoService_1
		bra        ThermoService_2
ThermoService_1:
		movea.l    6(a7),a0
		move.w     86(a0),d0
		and.w      #$0200,d0
		bne        ThermoService_3
		movea.l    6(a7),a0
		ori.w      #$0200,86(a0)
		movea.l    6(a7),a0
		andi.w     #$FFDF,86(a0)
		movea.l    (a7),a0
		move.w     104(a0),d0
		beq.s      ThermoService_4
		movea.l    (a7),a0
		move.l     84(a0),d0
		beq.s      ThermoService_4
		moveq.l    #8,d0
		movea.l    (a7),a0
		and.w      100(a0),d0
		bne.s      ThermoService_5
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.l     106(a0),562(a1)
ThermoService_5:
		movea.l    (a7),a0
		movea.l    (a7),a1
		movea.l    84(a1),a1
		jsr        (a1)
		moveq.l    #8,d0
		movea.l    (a7),a0
		and.w      100(a0),d0
		bne.s      ThermoService_4
		movea.l    ACSblk,a0
		move.l     #$00000001,562(a0)
ThermoService_4:
		movea.l    6(a7),a0
		jsr        Awi_delete
		movea.l    (a7),a0
		clr.l      110(a0)
		movea.l    (a7),a0
		move.l     88(a0),d0
		beq.s      ThermoService_6
		moveq.l    #8,d0
		movea.l    (a7),a0
		and.w      100(a0),d0
		bne.s      ThermoService_7
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.l     106(a0),562(a1)
ThermoService_7:
		movea.l    (a7),a0
		movea.l    (a7),a1
		movea.l    88(a1),a1
		jsr        (a1)
		moveq.l    #8,d0
		movea.l    (a7),a0
		and.w      100(a0),d0
		bne.s      ThermoService_6
		movea.l    ACSblk,a0
		move.l     #$00000001,562(a0)
ThermoService_6:
		moveq.l    #8,d0
		movea.l    (a7),a0
		and.w      100(a0),d0
		beq.s      ThermoService_3
		moveq.l    #114,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
ThermoService_3:
		moveq.l    #1,d0
		bra.s      ThermoService_8
ThermoService_2:
		clr.w      d0
ThermoService_8:
		lea.l      10(a7),a7
		rts

ThermoInit:
		move.l     a2,-(a7)
		lea.l      -22(a7),a7
		move.l     a0,10(a7)
		movea.l    10(a7),a0
		move.l     (a0),6(a7)
		move.w     #$0001,(a7)
		movea.l    6(a7),a0
		move.w     104(a0),d0
		beq        ThermoInit_1
		moveq.l    #8,d0
		movea.l    6(a7),a0
		and.w      100(a0),d0
		bne.s      ThermoInit_2
		movea.l    6(a7),a0
		movea.l    ACSblk,a1
		move.l     106(a0),562(a1)
ThermoInit_2:
		movea.l    10(a7),a0
		andi.w     #$FFDF,86(a0)
		movea.l    6(a7),a0
		move.l     76(a0),d0
		beq.s      ThermoInit_3
		movea.l    6(a7),a0
		movea.l    6(a7),a1
		movea.l    76(a1),a1
		jsr        (a1)
		tst.w      d0
		beq.s      ThermoInit_3
		moveq.l    #1,d0
		bra.s      ThermoInit_4
ThermoInit_3:
		clr.w      d0
ThermoInit_4:
		move.w     d0,(a7)
		movea.l    6(a7),a1
		lea.l      12(a1),a1
		movea.l    10(a7),a0
		bsr        TextUpdate
		move.w     (a7),d0
		beq.s      ThermoInit_5
		movea.l    6(a7),a0
		move.l     80(a0),d0
		beq.s      ThermoInit_5
		movea.l    6(a7),a0
		movea.l    6(a7),a1
		movea.l    80(a1),a1
		jsr        (a1)
ThermoInit_5:
		movea.l    6(a7),a0
		addq.l     #1,(a0)
		moveq.l    #8,d0
		movea.l    6(a7),a0
		and.w      100(a0),d0
		bne.s      ThermoInit_6
		movea.l    ACSblk,a0
		move.l     #$00000001,562(a0)
ThermoInit_6:
		move.w     (a7),d0
		beq.s      ThermoInit_7
		movea.l    6(a7),a0
		move.l     8(a0),d0
		beq.s      ThermoInit_7
		movea.l    6(a7),a0
		move.l     4(a0),d0
		and.l      #$FFF00000,d0
		move.l     d0,18(a7)
		movea.l    6(a7),a0
		move.l     4(a0),d0
		and.l      #$000FFFFF,d0
		move.l     d0,14(a7)
		move.l     14(a7),d0
		moveq.l    #12,d1
		lsl.l      d1,d0
		movea.l    6(a7),a0
		move.l     8(a0),d1
		jsr        _uldiv
		move.l     d0,-(a7)
		move.l     22(a7),d0
		movea.l    10(a7),a0
		move.l     8(a0),d1
		jsr        _uldiv
		moveq.l    #12,d1
		lsr.l      d1,d0
		add.l      (a7)+,d0
		move.l     d0,2(a7)
		bra.s      ThermoInit_8
ThermoInit_7:
		move.l     #$00001000,2(a7)
ThermoInit_8:
		move.l     2(a7),d0
		bpl.s      ThermoInit_9
		clr.l      2(a7)
		bra.s      ThermoInit_10
ThermoInit_9:
		cmpi.l     #$00001000,2(a7)
		ble.s      ThermoInit_10
		move.l     #$00001000,2(a7)
ThermoInit_10:
		move.l     2(a7),d0
		movea.l    10(a7),a0
		bsr        Prozent
ThermoInit_1:
		movea.l    6(a7),a0
		move.w     104(a0),d0
		bne.w      ThermoInit_11
		movea.l    10(a7),a0
		move.w     32(a0),d0
		bmi.s      ThermoInit_11
		movea.l    6(a7),a0
		move.l     72(a0),d0
		beq.s      ThermoInit_12
		moveq.l    #8,d0
		movea.l    6(a7),a0
		and.w      100(a0),d0
		bne.s      ThermoInit_13
		movea.l    6(a7),a0
		movea.l    ACSblk,a1
		move.l     106(a0),562(a1)
ThermoInit_13:
		movea.l    10(a7),a0
		andi.w     #$FFDF,86(a0)
		movea.l    6(a7),a0
		movea.l    6(a7),a1
		movea.l    72(a1),a1
		jsr        (a1)
		move.w     d0,(a7)
		moveq.l    #8,d0
		movea.l    6(a7),a0
		and.w      100(a0),d0
		bne.s      ThermoInit_12
		movea.l    ACSblk,a0
		move.l     #$00000001,562(a0)
ThermoInit_12:
		movea.l    6(a7),a1
		lea.l      12(a1),a1
		movea.l    10(a7),a0
		bsr        TextUpdate
		movea.l    6(a7),a0
		move.w     (a7),104(a0)
ThermoInit_11:
		movea.l    10(a7),a0
		move.w     86(a0),d0
		and.w      #$0200,d0
		bne.s      ThermoInit_14
		movea.l    10(a7),a0
		ori.w      #$0020,86(a0)
		moveq.l    #8,d0
		movea.l    6(a7),a0
		and.w      100(a0),d0
		bne.s      ThermoInit_15
		move.w     (a7),d0
		bne.s      ThermoInit_16
		moveq.l    #1,d0
		bra.s      ThermoInit_17
ThermoInit_16:
		clr.w      d0
ThermoInit_17:
		movea.l    ACSblk,a0
		move.w     d0,616(a0)
		bra.s      ThermoInit_14
ThermoInit_15:
		move.w     (a7),d0
		bne.s      ThermoInit_14
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    10(a7),a0
		movea.l    10(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
ThermoInit_14:
		clr.w      d0
		lea.l      22(a7),a7
		movea.l    (a7)+,a2
		rts

ThermCancel:
		move.l     a2,-(a7)
		subq.w     #8,a7
		movea.l    ACSblk,a0
		move.l     600(a0),4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		move.l     84(a0),d0
		beq        ThermCancel_1
		moveq.l    #8,d0
		movea.l    (a7),a0
		and.w      100(a0),d0
		bne.s      ThermCancel_2
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.l     106(a0),562(a1)
ThermCancel_2:
		movea.l    4(a7),a0
		andi.w     #$FFDF,86(a0)
		movea.l    (a7),a0
		movea.l    (a7),a1
		movea.l    84(a1),a1
		jsr        (a1)
		tst.w      d0
		beq.s      ThermCancel_3
		movea.l    (a7),a1
		lea.l      12(a1),a1
		movea.l    4(a7),a0
		bsr        TextUpdate
		moveq.l    #8,d0
		movea.l    (a7),a0
		and.w      100(a0),d0
		beq.s      ThermCancel_4
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    4(a7),a0
		movea.l    4(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		bra.s      ThermCancel_5
ThermCancel_4:
		movea.l    ACSblk,a0
		move.w     #$0001,616(a0)
ThermCancel_5:
		movea.l    (a7),a0
		clr.w      104(a0)
		bra.s      ThermCancel_6
ThermCancel_3:
		movea.l    4(a7),a0
		ori.w      #$0020,86(a0)
ThermCancel_6:
		moveq.l    #8,d0
		movea.l    (a7),a0
		and.w      100(a0),d0
		bne.s      ThermCancel_1
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.l     106(a0),562(a1)
ThermCancel_1:
		addq.w     #8,a7
		movea.l    (a7)+,a2
		rts

ThermoClosed:
		rts

ThermoGEMScript:
		moveq.l    #1,d0
		rts

	.data

TEXT_02:
		dc.b 0
TEXT_03:
		dc.b 'Initialisierung...                                ',0
TEXT_04:
		dc.b 'Abbrechen',0
TEXT_05:
		dc.b 0
TEXT_06:
		dc.b '100 %',0
		dc.b $00
TEDINFO_02:
		dc.l TEXT_06
		dc.l TEXT_02
		dc.l TEXT_02
		dc.w $0003
		dc.w $0006
		dc.w $0002
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $0006
		dc.w $0001
TEDINFO_03:
		dc.l TEXT_06
		dc.l TEXT_02
		dc.l TEXT_02
		dc.w $0003
		dc.w $0006
		dc.w $0002
		dc.w $1100
		dc.w $0000
		dc.w $ffff
		dc.w $0006
		dc.w $0001
TEDINFO_04:
		dc.l TEXT_03
		dc.l TEXT_02
		dc.l TEXT_02
		dc.w $0005
		dc.w $0006
		dc.w $0000
		dc.w $1100
		dc.w $0000
		dc.w $ffff
		dc.w $0033
		dc.w $0001
A_3DBUTTON01:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
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
A_3DBUTTON02:
		dc.l A_3Dbutton
		dc.w $2001
		dc.w $9178
		dc.l Auo_string
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
A_3DBUTTON04:
		dc.l A_3Dbutton
		dc.w $2901
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_04
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON05:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
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
A_3DBUTTON06:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
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
A_3DBUTTON07:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
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
A_3DBUTTON08:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
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
ThermAObj:
		dc.w $ffff
		dc.w $0001
		dc.w $0003
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON01
		dc.w $0000
		dc.w $0000
		dc.w $0029
		dc.w $0404
_01_ThermAObj:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0045
		dc.w $0000
		dc.l A_3DBUTTON04
		dc.w $000d
		dc.w $0c02
		dc.w $0010
		dc.w $0001
_01aThermAObj:
		dc.l ThermCancel
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8841
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_03_ThermAObj:
		dc.w $0000
		dc.w $0004
		dc.w $0005
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON02
		dc.w $0001
		dc.w $0001
		dc.w $0027
		dc.w $0401
_04_ThermAObj:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON05
		dc.w $0000
		dc.w $0000
		dc.w $000b
		dc.w $0401
_05_ThermAObj:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0015
		dc.w $0020
		dc.w $0000
		dc.l TEDINFO_03
		dc.w $0011
		dc.w $0200
		dc.w $0005
		dc.w $0001
ThermObj:
		dc.w $ffff
		dc.w $0001
		dc.w $0001
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON01
		dc.w $0000
		dc.w $0000
		dc.w $0029
		dc.w $0403
_01_ThermObj:
		dc.w $0000
		dc.w $0002
		dc.w $0003
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON02
		dc.w $0001
		dc.w $0001
		dc.w $0027
		dc.w $0401
_02_ThermObj:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON06
		dc.w $0000
		dc.w $0000
		dc.w $000b
		dc.w $0401
_03_ThermObj:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0015
		dc.w $0020
		dc.w $0000
		dc.l TEDINFO_03
		dc.w $0011
		dc.w $0200
		dc.w $0005
		dc.w $0001
ThermTAObj:
		dc.w $ffff
		dc.w $0001
		dc.w $0005
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON01
		dc.w $0000
		dc.w $0000
		dc.w $0029
		dc.w $0405
_01_ThermTAObj:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0015
		dc.w $0000
		dc.w $0000
		dc.l TEDINFO_04
		dc.w $0001
		dc.w $0000
		dc.w $0027
		dc.w $0002
_02_ThermTAObj:
		dc.w $0005
		dc.w $0003
		dc.w $0004
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON02
		dc.w $0001
		dc.w $0002
		dc.w $0027
		dc.w $0401
_03_ThermTAObj:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON07
		dc.w $0000
		dc.w $0000
		dc.w $000b
		dc.w $0401
_04_ThermTAObj:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0015
		dc.w $0000
		dc.w $0000
		dc.l TEDINFO_03
		dc.w $0011
		dc.w $0200
		dc.w $0005
		dc.w $0001
_05_ThermTAObj:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0045
		dc.w $0000
		dc.l A_3DBUTTON04
		dc.w $000d
		dc.w $0c03
		dc.w $0010
		dc.w $0001
_05aThermTAObj:
		dc.l ThermCancel
		dc.w $0000
		dc.w $0000
		dc.w $8020
		dc.w $8841
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
ThermTObj:
		dc.w $ffff
		dc.w $0001
		dc.w $0002
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON01
		dc.w $0000
		dc.w $0000
		dc.w $0029
		dc.w $0404
_01_ThermTObj:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0015
		dc.w $0000
		dc.w $0000
		dc.l TEDINFO_04
		dc.w $0001
		dc.w $0000
		dc.w $0027
		dc.w $0002
_02_ThermTObj:
		dc.w $0000
		dc.w $0003
		dc.w $0004
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON02
		dc.w $0001
		dc.w $0002
		dc.w $0027
		dc.w $0401
_03_ThermTObj:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON08
		dc.w $0000
		dc.w $0000
		dc.w $000b
		dc.w $0401
_04_ThermTObj:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0015
		dc.w $0020
		dc.w $0000
		dc.l TEDINFO_02
		dc.w $0011
		dc.w $0200
		dc.w $0005
		dc.w $0001
	.globl ThermWind
ThermWind:
		dc.w $0000
		dc.w $0000
		dc.l ThermoService
		dc.l ThermoCreate
		dc.l Awi_open
		dc.l ThermoInit
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $2009
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
		dc.l TEXT_05
		dc.l TEXT_02
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l Awi_keys
		dc.l Awi_obchange
		dc.l Awi_redraw
		dc.l Awi_topped
		dc.l ThermoClosed
		dc.l Awi_fulled
		dc.l Awi_arrowed
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l ThermoGEMScript
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
ThermObjs:
		dc.l ThermObj
		dc.l ThermTObj
		dc.l ThermAObj
		dc.l ThermTAObj
textNr:
		dc.w $ffff
		dc.w $0001
		dc.w $ffff
		dc.w $0001
laufBNr:
		dc.w $0002
		dc.w $0003
		dc.w $0004
		dc.w $0003
fixBNr:
		dc.w $0001
		dc.w $0002
		dc.w $0003
		dc.w $0002
prozNr:
		dc.w $0003
		dc.w $0004
		dc.w $0005
		dc.w $0004
xe1464:
		dc.b '%i %%',0
	.even
