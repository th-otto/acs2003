	.text
	
proto_fulled:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a2
		lea.l      36(a2),a3
		lea.l      44(a2),a4
		moveq.l    #1,d0
		and.w      86(a2),d0
		beq.s      proto_fulled_1
		move.w     (a4),(a3)
		move.w     2(a4),2(a3)
		move.w     4(a4),4(a3)
		move.w     6(a4),6(a3)
		movea.l    a4,a1
		jsr        proto_sized
		andi.w     #0xFFFE,86(a2)
		bra.s      proto_fulled_2
proto_fulled_1:
		move.w     (a3),(a4)
		move.w     2(a3),2(a4)
		move.w     4(a3),4(a4)
		move.w     6(a3),6(a4)
		movea.l    ACSblk,a1
		addq.w     #8,a1
		movea.l    a2,a0
		jsr        proto_sized
		ori.w      #0x0001,86(a2)
proto_fulled_2:
		move.w     6(a3),-(a7)
		move.w     4(a3),-(a7)
		move.w     2(a3),-(a7)
		move.w     (a3),-(a7)
		moveq.l    #5,d1
		move.w     32(a2),d0
		jsr        wind_set
		addq.w     #8,a7
		jsr        Aev_mess
		movem.l    (a7)+,a2-a4
		rts

proto_arrowed:
		movem.l    d3-d5/a2-a5,-(a7)
		subq.w     #8,a7
		move.w     d0,d4
		movea.l    20(a0),a2
		lea.l      48(a2),a2
		movea.l    12(a2),a3
		movea.l    20(a0),a4
		lea.l      72(a4),a4
		move.l     12(a4),4(a7)
		clr.w      d3
proto_arrowed_18:
		move.w     d4,d0
		cmp.w      #0x0007,d0
		bhi        proto_arrowed_1
		add.w      d0,d0
		move.w     J34(pc,d0.w),d0
		jmp        J34(pc,d0.w)
J34:
		dc.w proto_arrowed_2-J34
		dc.w proto_arrowed_3-J34
		dc.w proto_arrowed_4-J34
		dc.w proto_arrowed_5-J34
		dc.w proto_arrowed_6-J34
		dc.w proto_arrowed_7-J34
		dc.w proto_arrowed_8-J34
		dc.w proto_arrowed_9-J34
proto_arrowed_4:
		suba.l     a1,a1
		moveq.l    #11,d0
		movea.l    a4,a0
		movea.l    4(a7),a5
		movea.l    8(a5),a5
		jsr        (a5)
		bra.s      proto_arrowed_10
proto_arrowed_5:
		suba.l     a1,a1
		moveq.l    #10,d0
		movea.l    a4,a0
		movea.l    4(a7),a5
		movea.l    8(a5),a5
		jsr        (a5)
		bra.s      proto_arrowed_10
proto_arrowed_2:
		suba.l     a1,a1
		moveq.l    #13,d0
		movea.l    a4,a0
		movea.l    4(a7),a5
		movea.l    8(a5),a5
		jsr        (a5)
		bra.s      proto_arrowed_11
proto_arrowed_3:
		suba.l     a1,a1
		moveq.l    #12,d0
		movea.l    a4,a0
		movea.l    4(a7),a5
		movea.l    8(a5),a5
		jsr        (a5)
proto_arrowed_11:
		clr.w      d3
proto_arrowed_10:
		moveq.l    #1,d5
		bra.s      proto_arrowed_1
proto_arrowed_6:
		suba.l     a1,a1
		moveq.l    #13,d0
		movea.l    a2,a0
		movea.l    8(a3),a5
		jsr        (a5)
		bra.s      proto_arrowed_12
proto_arrowed_7:
		suba.l     a1,a1
		moveq.l    #12,d0
		movea.l    a2,a0
		movea.l    8(a3),a5
		jsr        (a5)
proto_arrowed_12:
		clr.w      d3
		bra.s      proto_arrowed_13
proto_arrowed_8:
		suba.l     a1,a1
		moveq.l    #11,d0
		movea.l    a2,a0
		movea.l    8(a3),a5
		jsr        (a5)
		bra.s      proto_arrowed_13
proto_arrowed_9:
		suba.l     a1,a1
		moveq.l    #10,d0
		movea.l    a2,a0
		movea.l    8(a3),a5
		jsr        (a5)
proto_arrowed_13:
		clr.w      d5
proto_arrowed_1:
		tst.w      d5
		beq.s      proto_arrowed_14
		move.w     d3,d0
		subq.w     #1,d3
		tst.w      d0
		bne.s      proto_arrowed_15
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    a4,a0
		movea.l    4(a7),a5
		movea.l    8(a5),a5
		jsr        (a5)
		moveq.l    #4,d3
proto_arrowed_15:
		suba.l     a1,a1
		moveq.l    #105,d0
		movea.l    a4,a0
		movea.l    4(a7),a5
		movea.l    8(a5),a5
		jsr        (a5)
		bra.s      proto_arrowed_16
proto_arrowed_14:
		move.w     d3,d0
		subq.w     #1,d3
		tst.w      d0
		bne.s      proto_arrowed_17
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    a2,a0
		movea.l    8(a3),a5
		jsr        (a5)
		moveq.l    #4,d3
proto_arrowed_17:
		suba.l     a1,a1
		moveq.l    #105,d0
		movea.l    a2,a0
		movea.l    8(a3),a5
		jsr        (a5)
proto_arrowed_16:
		move.l     _globl,-(a7)
		pea.l      6(a7)
		pea.l      8(a7)
		lea.l      14(a7),a1
		lea.l      14(a7),a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		moveq.l    #1,d0
		and.w      (a7),d0
		bne        proto_arrowed_18
		cmp.w      #0x0004,d3
		beq.s      proto_arrowed_19
		tst.w      d5
		beq.s      proto_arrowed_20
		suba.l     a1,a1
		movea.l    a4,a0
		movea.l    4(a7),a2
		movea.l    8(a2),a2
		moveq.l    #5,d0
		jsr        (a2)
		bra.s      proto_arrowed_19
proto_arrowed_20:
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    a4,a0
		movea.l    8(a3),a2
		jsr        (a2)
proto_arrowed_19:
		addq.w     #8,a7
		movem.l    (a7)+,d3-d5/a2-a5
		rts

proto_hslid:
		movem.l    a2-a4,-(a7)
		subq.w     #2,a7
		move.w     d0,(a7)
		movea.l    20(a0),a2
		lea.l      48(a2),a2
		movea.l    12(a2),a3
		lea.l      (a7),a1
		movea.l    a2,a0
		movea.l    8(a3),a4
		moveq.l    #106,d0
		jsr        (a4)
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    a2,a0
		movea.l    8(a3),a4
		jsr        (a4)
		suba.l     a1,a1
		moveq.l    #105,d0
		movea.l    a2,a0
		movea.l    8(a3),a4
		jsr        (a4)
		addq.w     #2,a7
		movem.l    (a7)+,a2-a4
		rts

proto_make:
		movem.l    a2-a6,-(a7)
		lea.l      -20(a7),a7
		movea.l    a0,a2
		move.l     #edit,PROTOCOL+20
		lea.l      PROTOCOL,a0
		jsr        Awi_create
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      proto_make_1
		suba.l     a0,a0
		bra        proto_make_2
proto_make_1:
		ori.w      #0x0060,84(a3)
		movea.l    20(a3),a4
		lea.l      ACSblk,a6
		move.l     a2,d0
		beq.s      proto_make_3
		movea.l    a2,a5
		bra.s      proto_make_4
proto_make_3:
		lea.l      def,a5
		movea.l    (a6),a0
		move.w     656(a0),(a5)
		movea.l    (a6),a0
		move.w     658(a0),2(a5)
proto_make_4:
		move.w     12(a5),36(a3)
		move.w     14(a5),38(a3)
		move.w     (a5),d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vst_font
		pea.l      2(a7)
		pea.l      8(a7)
		lea.l      8(a7),a1
		lea.l      8(a7),a0
		move.w     2(a5),d1
		movea.l    (a6),a2
		move.w     16(a2),d0
		jsr        vst_height
		addq.w     #8,a7
		move.w     4(a7),d0
		muls.w     4(a5),d0
		move.w     d0,20(a4)
		move.w     2(a7),d1
		muls.w     6(a5),d1
		move.w     d1,22(a4)
		movea.l    (a6),a0
		move.w     12(a0),d0
		move.w     18(a0),d2
		add.w      d2,d2
		sub.w      d2,d0
		move.w     d0,(a7)
		move.w     20(a4),d1
		cmp.w      d0,d1
		ble.s      proto_make_5
		move.w     d0,20(a4)
proto_make_5:
		movea.l    (a6),a0
		move.w     14(a0),d0
		move.w     20(a0),d2
		move.w     d2,d1
		add.w      d1,d1
		add.w      d2,d1
		sub.w      d1,d0
		move.w     d0,(a7)
		move.w     22(a4),d0
		cmp.w      (a7),d0
		ble.s      proto_make_6
		move.w     (a7),22(a4)
proto_make_6:
		movea.l    a5,a1
		move.w     #0x00CF,d0
		movea.l    a4,a0
		jsr        Auo_editor
		lea.l      2(a5),a1
		move.w     #0x00D0,d0
		movea.l    a4,a0
		jsr        Auo_editor
		move.w     10(a5),d0
		ext.l      d0
		move.l     d0,6(a7)
		lea.l      6(a7),a1
		movea.l    a4,a0
		move.w     #0x00CD,d0
		jsr        Auo_editor
		lea.l      8(a5),a1
		move.w     #0x00EC,d0
		movea.l    a4,a0
		jsr        Auo_editor
		lea.l      10(a7),a2
		move.l     a3,(a2)
		move.l     a4,4(a2)
		clr.w      8(a2)
		movea.l    a2,a1
		moveq.l    #9,d0
		movea.l    a4,a0
		jsr        Auo_editor
		suba.l     a1,a1
		move.w     #0x00EE,d0
		movea.l    a4,a0
		jsr        Auo_editor
		movea.l    20(a3),a0
		lea.l      48(a0),a0
		move.l     a0,4(a2)
		move.w     #0x0002,8(a2)
		movea.l    a2,a1
		move.w     #0x00C9,d0
		movea.l    a4,a0
		jsr        Auo_editor
		movea.l    20(a3),a0
		lea.l      72(a0),a0
		move.l     a0,4(a2)
		move.w     #0x0003,8(a2)
		movea.l    a2,a1
		move.w     #0x00C8,d0
		movea.l    a4,a0
		jsr        Auo_editor
		suba.l     a1,a1
		moveq.l    #6,d0
		movea.l    a4,a0
		jsr        Auo_editor
		movea.l    a3,a0
proto_make_2:
		lea.l      20(a7),a7
		movem.l    (a7)+,a2-a6
		rts

term:
		jsr        Awi_delete
		rts

proto_service:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		movea.l    a1,a3
		subq.w     #2,d0
		beq.s      proto_service_1
		sub.w      #0x0009,d0
		beq.s      proto_service_2
		subq.w     #4,d0
		beq.s      proto_service_3
		sub.w      #0x00B9,d0
		beq.s      proto_service_4
		bra.s      proto_service_5
proto_service_1:
		movea.l    ACSblk,a0
		move.w     570(a0),d0
		bne.s      proto_service_6
		cmpa.l     a3,a2
		bne.s      proto_service_7
proto_service_6:
		movea.l    a2,a0
		bsr.w      term
		bra.s      proto_service_7
proto_service_2:
		suba.l     a1,a1
		move.w     #0x00CE,d0
		movea.l    20(a2),a0
		jsr        Auo_editor
		suba.l     a1,a1
		moveq.l    #6,d0
		movea.l    20(a2),a0
		jsr        Auo_editor
		bra.s      proto_service_7
proto_service_4:
		move.l     20(a2),(a3)
		bra.s      proto_service_7
proto_service_3:
		lea.l      WIPR_INFO,a0
		movea.l    WIPR_INFO+8,a1
		jsr        (a1)
		movea.l    a0,a4
		move.l     a4,d0
		beq.s      proto_service_7
		jsr        Awi_dialog
		movea.l    a4,a0
		jsr        Awi_delete
		bra.s      proto_service_7
proto_service_5:
		movea.l    a3,a1
		move.w     d3,d0
		movea.l    a2,a0
		jsr        Awi_service
		bra.s      proto_service_8
proto_service_7:
		moveq.l    #1,d0
proto_service_8:
		movem.l    (a7)+,d3/a2-a4
		rts

proto_moved:
		move.l     a3,-(a7)
		move.l     a4,-(a7)
		subq.w     #4,a7
		movea.l    a0,a3
		movea.l    a1,a4
		move.l     _globl,-(a7)
		pea.l      4(a7)
		pea.l      8(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		lea.l      18(a7),a1
		lea.l      20(a7),a0
		clr.w      d2
		move.w     34(a3),d1
		moveq.l    #1,d0
		jsr        mt_wind_calc
		lea.l      18(a7),a7
		moveq.l    #8,d0
		add.w      (a4),d0
		and.w      #0xFFF0,d0
		sub.w      2(a7),d0
		move.w     d0,(a4)
		movea.l    a4,a1
		movea.l    a3,a0
		jsr        Awi_moved
		addq.w     #4,a7
		movea.l    (a7)+,a4
		movea.l    (a7)+,a3
		rts

proto_sized:
		movem.l    a2-a5,-(a7)
		subq.w     #4,a7
		movea.l    a0,a2
		movea.l    a1,a5
		movea.l    20(a2),a3
		movea.l    94(a2),a4
		move.l     _globl,-(a7)
		pea.l      22(a3)
		pea.l      20(a3)
		move.w     6(a5),-(a7)
		move.w     4(a5),-(a7)
		clr.w      -(a7)
		lea.l      18(a7),a1
		lea.l      20(a7),a0
		clr.w      d2
		move.w     34(a2),d1
		moveq.l    #1,d0
		jsr        mt_wind_calc
		lea.l      18(a7),a7
		moveq.l    #8,d0
		add.w      (a5),d0
		and.w      #0xFFF0,d0
		sub.w      2(a7),d0
		move.w     d0,(a5)
		move.l     a4,d1
		beq.s      proto_sized_1
		move.w     2(a4),d0
		ext.l      d0
		move.l     d0,d2
		add.l      d2,d2
		add.l      d0,d2
		lsl.l      #3,d2
		move.w     22(a4,d2.l),d1
		sub.w      d1,22(a3)
proto_sized_1:
		move.l     24(a2),d0
		beq.s      proto_sized_2
		movea.l    d0,a0
		move.w     22(a0),d1
		sub.w      d1,22(a3)
proto_sized_2:
		suba.l     a1,a1
		move.w     #0x00EE,d0
		movea.l    a3,a0
		jsr        Auo_editor
		suba.l     a1,a1
		move.w     #0x00FD,d0
		movea.l    a3,a0
		jsr        Auo_editor
		movea.l    a5,a1
		movea.l    a2,a0
		jsr        Awi_sized
		addq.w     #4,a7
		movem.l    (a7)+,a2-a5
		rts

proto_vslid:
		movem.l    a2-a4,-(a7)
		subq.w     #2,a7
		move.w     d0,(a7)
		movea.l    20(a0),a2
		lea.l      72(a2),a2
		movea.l    12(a2),a3
		lea.l      (a7),a1
		movea.l    a2,a0
		movea.l    8(a3),a4
		moveq.l    #106,d0
		jsr        (a4)
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    a2,a0
		movea.l    8(a3),a4
		jsr        (a4)
		suba.l     a1,a1
		moveq.l    #105,d0
		movea.l    a2,a0
		movea.l    8(a3),a4
		jsr        (a4)
		addq.w     #2,a7
		movem.l    (a7)+,a2-a4
		rts

	.globl wprintf
wprintf:
		movem.l    d3/a2-a3,-(a7)
		movea.l    a0,a2
		moveq.l    #-1,d3
		move.l     a2,d0
		beq.s      wprintf_1
		lea.l      16(a7),a3
		move.l     a3,-(a7)
		movea.l    20(a2),a0
		jsr        uvprintf
		addq.w     #4,a7
		move.w     d0,d3
wprintf_1:
		move.w     d3,d0
		movem.l    (a7)+,d3/a2-a3
		rts

	.data

TEXT_002:
		dc.b 0
TEXT_02:
		dc.b 'PROTOCOL',0
TEXT_03:
		dc.b ' PROTOCOL ',0
TEXT_04:
		dc.b 'PROTOKOLL',0
TEXT_05:
		dc.b 'Auf diesem Fenster k�nnen Ausgaben analog zu printf erfolgen!|Ein ACSpro-Feature...',0
TEXT_08:
		dc.b ' Information ',0
		dc.b $00
DATAS_01:
		dc.w $0000
		dc.w $0000
		dc.w $0208
		dc.w $ffff
		dc.w $ffc0
		dc.w $8000
		dc.w $0040
		dc.w $8000
		dc.w $0040
		dc.w $9fff
		dc.w $fe78
		dc.w $9fff
		dc.w $fe58
		dc.w $8000
		dc.w $0058
		dc.w $9fff
		dc.w $fe5f
		dc.w $9fff
		dc.w $fe59
		dc.w $8000
		dc.w $0059
		dc.w $9fff
		dc.w $fe59
		dc.w $9fff
		dc.w $fe59
		dc.w $8000
		dc.w $0059
		dc.w $9fff
		dc.w $fe59
		dc.w $9fff
		dc.w $fe59
		dc.w $8000
		dc.w $0059
		dc.w $9fff
		dc.w $fe59
		dc.w $9fff
		dc.w $fe59
		dc.w $8000
		dc.w $0059
		dc.w $9fff
		dc.w $ffd9
		dc.w $9fff
		dc.w $fed9
		dc.w $8000
		dc.w $3db9
		dc.w $8000
		dc.w $3b79
		dc.w $8000
		dc.w $36f9
		dc.w $8000
		dc.w $2df9
		dc.w $8000
		dc.w $3bf9
		dc.w $ffff
		dc.w $f7f9
		dc.w $0800
		dc.w $0ff9
		dc.w $0fff
		dc.w $fff9
		dc.w $0fff
		dc.w $fff9
		dc.w $0080
		dc.w $0001
		dc.w $0080
		dc.w $0001
		dc.w $00ff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffc0
		dc.w $8000
		dc.w $0040
		dc.w $8000
		dc.w $0040
		dc.w $9fff
		dc.w $fe78
		dc.w $9fff
		dc.w $fe58
		dc.w $8000
		dc.w $0058
		dc.w $9fff
		dc.w $fe5f
		dc.w $9fff
		dc.w $fe59
		dc.w $8000
		dc.w $0059
		dc.w $9fff
		dc.w $fe59
		dc.w $9fff
		dc.w $fe59
		dc.w $8000
		dc.w $0059
		dc.w $9fff
		dc.w $fe59
		dc.w $9fff
		dc.w $fe59
		dc.w $8000
		dc.w $0059
		dc.w $9fff
		dc.w $fe59
		dc.w $9fff
		dc.w $fe59
		dc.w $8000
		dc.w $0059
		dc.w $9fff
		dc.w $ffd9
		dc.w $9fff
		dc.w $fed9
		dc.w $8000
		dc.w $3db9
		dc.w $8000
		dc.w $3b79
		dc.w $8000
		dc.w $36f9
		dc.w $8000
		dc.w $2df9
		dc.w $8000
		dc.w $3bf9
		dc.w $ffff
		dc.w $f7f9
		dc.w $0800
		dc.w $0ff9
		dc.w $0fff
		dc.w $fff9
		dc.w $0fff
		dc.w $fff9
		dc.w $0080
		dc.w $0001
		dc.w $0080
		dc.w $0001
		dc.w $00ff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffc0
		dc.w $8000
		dc.w $0040
		dc.w $8000
		dc.w $0040
		dc.w $8000
		dc.w $0078
		dc.w $8000
		dc.w $0058
		dc.w $8000
		dc.w $0058
		dc.w $8000
		dc.w $005f
		dc.w $8000
		dc.w $0059
		dc.w $8000
		dc.w $0059
		dc.w $8000
		dc.w $0059
		dc.w $8000
		dc.w $0059
		dc.w $8000
		dc.w $0059
		dc.w $8000
		dc.w $0059
		dc.w $8000
		dc.w $0059
		dc.w $8000
		dc.w $0059
		dc.w $8000
		dc.w $0059
		dc.w $8000
		dc.w $0059
		dc.w $8000
		dc.w $0059
		dc.w $8000
		dc.w $3fd9
		dc.w $8000
		dc.w $3ed9
		dc.w $8000
		dc.w $3db9
		dc.w $8000
		dc.w $3b79
		dc.w $8000
		dc.w $36f9
		dc.w $8000
		dc.w $2df9
		dc.w $8000
		dc.w $3bf9
		dc.w $ffff
		dc.w $f7f9
		dc.w $0800
		dc.w $0ff9
		dc.w $0fff
		dc.w $fff9
		dc.w $0fff
		dc.w $fff9
		dc.w $0080
		dc.w $0001
		dc.w $0080
		dc.w $0001
		dc.w $00ff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffc0
		dc.w $8000
		dc.w $0040
		dc.w $8000
		dc.w $0040
		dc.w $8000
		dc.w $0078
		dc.w $9fff
		dc.w $fe68
		dc.w $8000
		dc.w $0068
		dc.w $8000
		dc.w $006f
		dc.w $9fff
		dc.w $fe6f
		dc.w $8000
		dc.w $006f
		dc.w $8000
		dc.w $006f
		dc.w $9fff
		dc.w $fe6f
		dc.w $8000
		dc.w $006f
		dc.w $8000
		dc.w $006f
		dc.w $9fff
		dc.w $fe6f
		dc.w $8000
		dc.w $006f
		dc.w $8000
		dc.w $006f
		dc.w $9fff
		dc.w $fe6f
		dc.w $8000
		dc.w $006f
		dc.w $8000
		dc.w $3fef
		dc.w $9fff
		dc.w $e1ef
		dc.w $8000
		dc.w $23cf
		dc.w $8000
		dc.w $278f
		dc.w $8000
		dc.w $2f0f
		dc.w $8000
		dc.w $3e0f
		dc.w $8000
		dc.w $3c0f
		dc.w $ffff
		dc.w $f80f
		dc.w $0fff
		dc.w $f00f
		dc.w $0800
		dc.w $000f
		dc.w $0fff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
DATAS_02:
		dc.w $ffff
		dc.w $ffc0
		dc.w $ffff
		dc.w $ffc0
		dc.w $ffff
		dc.w $ffc0
		dc.w $ffff
		dc.w $fff8
		dc.w $ffff
		dc.w $fff8
		dc.w $ffff
		dc.w $fff8
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0fff
		dc.w $ffff
		dc.w $0fff
		dc.w $ffff
		dc.w $0fff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
DATAS_03:
		dc.w $0000
		dc.w $0000
		dc.w $0208
		dc.w $ffff
		dc.w $ffc0
		dc.w $8000
		dc.w $0040
		dc.w $8000
		dc.w $0040
		dc.w $9fff
		dc.w $fe78
		dc.w $9fff
		dc.w $fe78
		dc.w $8000
		dc.w $0078
		dc.w $9fff
		dc.w $fe7f
		dc.w $9fff
		dc.w $fe7f
		dc.w $8000
		dc.w $007f
		dc.w $9fff
		dc.w $fe7f
		dc.w $9fff
		dc.w $fe7f
		dc.w $8000
		dc.w $007f
		dc.w $9fff
		dc.w $fe7f
		dc.w $9fff
		dc.w $fe7f
		dc.w $8000
		dc.w $007f
		dc.w $9fff
		dc.w $fe7f
		dc.w $9fff
		dc.w $fe7f
		dc.w $8000
		dc.w $007f
		dc.w $9fff
		dc.w $ffff
		dc.w $9fff
		dc.w $feff
		dc.w $8000
		dc.w $3dff
		dc.w $8000
		dc.w $3bff
		dc.w $8000
		dc.w $37ff
		dc.w $8000
		dc.w $2fff
		dc.w $8000
		dc.w $3fff
		dc.w $ffff
		dc.w $ffff
		dc.w $0fff
		dc.w $ffff
		dc.w $0fff
		dc.w $ffff
		dc.w $0fff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffc0
		dc.w $8000
		dc.w $0040
		dc.w $8000
		dc.w $0040
		dc.w $9fff
		dc.w $fe78
		dc.w $9fff
		dc.w $fe78
		dc.w $8000
		dc.w $0078
		dc.w $9fff
		dc.w $fe7f
		dc.w $9fff
		dc.w $fe7f
		dc.w $8000
		dc.w $007f
		dc.w $9fff
		dc.w $fe7f
		dc.w $9fff
		dc.w $fe7f
		dc.w $8000
		dc.w $007f
		dc.w $9fff
		dc.w $fe7f
		dc.w $9fff
		dc.w $fe7f
		dc.w $8000
		dc.w $007f
		dc.w $9fff
		dc.w $fe7f
		dc.w $9fff
		dc.w $fe7f
		dc.w $8000
		dc.w $007f
		dc.w $9fff
		dc.w $ffff
		dc.w $9fff
		dc.w $feff
		dc.w $8000
		dc.w $3dff
		dc.w $8000
		dc.w $3bff
		dc.w $8000
		dc.w $37ff
		dc.w $8000
		dc.w $2fff
		dc.w $8000
		dc.w $3fff
		dc.w $ffff
		dc.w $ffff
		dc.w $0fff
		dc.w $ffff
		dc.w $0fff
		dc.w $ffff
		dc.w $0fff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffc0
		dc.w $8000
		dc.w $0040
		dc.w $8000
		dc.w $0040
		dc.w $8000
		dc.w $0078
		dc.w $8000
		dc.w $0048
		dc.w $8000
		dc.w $0048
		dc.w $8000
		dc.w $004f
		dc.w $8000
		dc.w $0049
		dc.w $8000
		dc.w $0049
		dc.w $8000
		dc.w $0049
		dc.w $8000
		dc.w $0049
		dc.w $8000
		dc.w $0049
		dc.w $8000
		dc.w $0049
		dc.w $8000
		dc.w $0049
		dc.w $8000
		dc.w $0049
		dc.w $8000
		dc.w $0049
		dc.w $8000
		dc.w $0049
		dc.w $8000
		dc.w $0049
		dc.w $8000
		dc.w $3fc9
		dc.w $8000
		dc.w $3ec9
		dc.w $8000
		dc.w $3d89
		dc.w $8000
		dc.w $3b09
		dc.w $8000
		dc.w $3609
		dc.w $8000
		dc.w $2c09
		dc.w $8000
		dc.w $3809
		dc.w $ffff
		dc.w $f009
		dc.w $0800
		dc.w $0009
		dc.w $0800
		dc.w $0009
		dc.w $0fff
		dc.w $fff9
		dc.w $0080
		dc.w $0001
		dc.w $0080
		dc.w $0001
		dc.w $00ff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffc0
		dc.w $8000
		dc.w $0040
		dc.w $8000
		dc.w $0040
		dc.w $8000
		dc.w $0078
		dc.w $9fff
		dc.w $fe68
		dc.w $8000
		dc.w $0068
		dc.w $8000
		dc.w $006f
		dc.w $9fff
		dc.w $fe6f
		dc.w $8000
		dc.w $006f
		dc.w $8000
		dc.w $006f
		dc.w $9fff
		dc.w $fe6f
		dc.w $8000
		dc.w $006f
		dc.w $8000
		dc.w $006f
		dc.w $9fff
		dc.w $fe6f
		dc.w $8000
		dc.w $006f
		dc.w $8000
		dc.w $006f
		dc.w $9fff
		dc.w $fe6f
		dc.w $8000
		dc.w $006f
		dc.w $8000
		dc.w $3fef
		dc.w $9fff
		dc.w $e1ef
		dc.w $8000
		dc.w $23cf
		dc.w $8000
		dc.w $278f
		dc.w $8000
		dc.w $2f0f
		dc.w $8000
		dc.w $3e0f
		dc.w $8000
		dc.w $3c0f
		dc.w $ffff
		dc.w $f80f
		dc.w $0fff
		dc.w $f00f
		dc.w $0800
		dc.w $000f
		dc.w $0fff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
DATAS_04:
		dc.w $ffff
		dc.w $ffc0
		dc.w $ffff
		dc.w $ffc0
		dc.w $ffff
		dc.w $ffc0
		dc.w $ffff
		dc.w $fff8
		dc.w $ffff
		dc.w $fff8
		dc.w $ffff
		dc.w $fff8
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0fff
		dc.w $ffff
		dc.w $0fff
		dc.w $ffff
		dc.w $0fff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
		dc.w $00ff
		dc.w $ffff
A_3DBUTTON02:
		dc.l A_3Dbutton
		dc.w $2021
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
		dc.w $29f1
		dc.w $01f8
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
A_FTEXT02:
		dc.l A_ftext
		dc.w $0001
		dc.w $000d
		dc.l Auo_ftext
		dc.l TEXT_05
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_C4_PROTO_ICON:
		dc.w $0004
		dc.l DATAS_01+6
		dc.l DATAS_02
		dc.l DATAS_03+6
		dc.l DATAS_04
		dc.w $0000
		dc.w $0000
_MSK_PROTO_ICON:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0fff
		dc.w $ff00
		dc.w $0fff
		dc.w $ff00
		dc.w $0fff
		dc.w $ff40
		dc.w $0fff
		dc.w $ff40
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $ff50
		dc.w $0fff
		dc.w $c050
		dc.w $0fff
		dc.w $de50
		dc.w $0fff
		dc.w $dcd0
		dc.w $0fff
		dc.w $d9d0
		dc.w $0fff
		dc.w $d3d0
		dc.w $0fff
		dc.w $c7d0
		dc.w $0000
		dc.w $0fd0
		dc.w $03ff
		dc.w $ffd0
		dc.w $0000
		dc.w $0010
		dc.w $00ff
		dc.w $fff0
		dc.w $0000
		dc.w $0000
_DAT_PROTO_ICON:
		dc.w $0000
		dc.w $0000
		dc.w $1fff
		dc.w $ff80
		dc.w $1000
		dc.w $0080
		dc.w $1000
		dc.w $00e0
		dc.w $1000
		dc.w $00a0
		dc.w $1000
		dc.w $00b8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $00a8
		dc.w $1000
		dc.w $3fa8
		dc.w $1000
		dc.w $21a8
		dc.w $1000
		dc.w $2328
		dc.w $1000
		dc.w $2628
		dc.w $1000
		dc.w $2c28
		dc.w $1000
		dc.w $3828
		dc.w $1fff
		dc.w $f028
		dc.w $0400
		dc.w $0028
		dc.w $07ff
		dc.w $ffe8
		dc.w $0100
		dc.w $0008
		dc.w $01ff
		dc.w $fff8
PROTO_ICON:
		dc.l _MSK_PROTO_ICON
		dc.l _DAT_PROTO_ICON
		dc.l TEXT_04
		dc.w $1000
		dc.w $0000
		dc.w $0000
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $0020
		dc.w $0000
		dc.w $0020
		dc.w $0048
		dc.w $0008
		dc.l _C4_PROTO_ICON
_MSK_PROT_ICON:
		dc.w $0fff
		dc.w $ffff
		dc.w $ff00
		dc.w $0fff
		dc.w $ffff
		dc.w $ff80
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $0fff
		dc.w $ffff
		dc.w $fffc
		dc.w $03ff
		dc.w $ffff
		dc.w $fffc
		dc.w $03ff
		dc.w $ffff
		dc.w $fffc
_DAT_PROT_ICON:
		dc.w $0fff
		dc.w $ffff
		dc.w $ff00
		dc.w $0800
		dc.w $0000
		dc.w $0180
		dc.w $0800
		dc.w $0000
		dc.w $017c
		dc.w $0a39
		dc.w $9fdf
		dc.w $7124
		dc.w $0839
		dc.w $9fdf
		dc.w $71f4
		dc.w $0800
		dc.w $0000
		dc.w $0014
		dc.w $0a00
		dc.w $0000
		dc.w $0054
		dc.w $083d
		dc.w $df75
		dc.w $e414
		dc.w $0800
		dc.w $0000
		dc.w $0014
		dc.w $0a00
		dc.w $0000
		dc.w $0054
		dc.w $0827
		dc.w $cf9e
		dc.w $7c14
		dc.w $0800
		dc.w $0000
		dc.w $0014
		dc.w $0a00
		dc.w $0000
		dc.w $0054
		dc.w $081f
		dc.w $79ef
		dc.w $cc14
		dc.w $0800
		dc.w $0000
		dc.w $0014
		dc.w $0a00
		dc.w $0000
		dc.w $0054
		dc.w $0837
		dc.w $bf3d
		dc.w $dc14
		dc.w $0800
		dc.w $0000
		dc.w $0014
		dc.w $0a00
		dc.w $0000
		dc.w $0054
		dc.w $083c
		dc.w $f7d7
		dc.w $7c14
		dc.w $0800
		dc.w $0000
		dc.w $0014
		dc.w $0a00
		dc.w $0000
		dc.w $0054
		dc.w $0837
		dc.w $defe
		dc.w $ec14
		dc.w $0800
		dc.w $0000
		dc.w $0014
		dc.w $0a00
		dc.w $0000
		dc.w $0054
		dc.w $0800
		dc.w $0000
		dc.w $0014
		dc.w $0800
		dc.w $0000
		dc.w $0014
		dc.w $0800
		dc.w $0000
		dc.w $0014
		dc.w $0fff
		dc.w $ffff
		dc.w $fff4
		dc.w $0200
		dc.w $0000
		dc.w $0004
		dc.w $03ff
		dc.w $ffff
		dc.w $fffc
PROT_ICON:
		dc.l _MSK_PROT_ICON
		dc.l _DAT_PROT_ICON
		dc.l TEXT_02
		dc.w $1000
		dc.w $0000
		dc.w $0000
		dc.w $000c
		dc.w $0000
		dc.w $0030
		dc.w $001f
		dc.w $0000
		dc.w $0020
		dc.w $0048
		dc.w $0008
		dc.w $0000
		dc.w $0000
INFOBOX:
		dc.w $ffff
		dc.w $0001
		dc.w $0001
		dc.w $0019
		dc.w $0040
		dc.w $0000
		dc.w $00ff
		dc.w $1141
		dc.w $0000
		dc.w $0000
		dc.w $001c
		dc.w $0006
_01_INFOBOX:
		dc.w $0000
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON04
		dc.w $0000
		dc.w $0000
		dc.w $001c
		dc.w $0006
_02_INFOBOX:
		dc.w $0001
		dc.w $0003
		dc.w $0003
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON02
		dc.w $0002
		dc.w $0001
		dc.w $0018
		dc.w $0004
_03_INFOBOX:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0060
		dc.w $0000
		dc.l A_FTEXT02
		dc.w $0000
		dc.w $0000
		dc.w $0018
		dc.w $0004
	.globl PROTOCOL
PROTOCOL:
		dc.w $0000
		dc.w $0000
		dc.l proto_service
		dc.l proto_make
		dc.l Awi_open
		dc.l Awi_init
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $4fef
		dc.w $0000
		dc.w $0000
		dc.w $0063
		dc.w $0063
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
		dc.w $fefe
		dc.l TEXT_03
		dc.l TEXT_002
		dc.w $2710
		dc.w $0103
		dc.w $0000
		dc.w $ffff
		dc.l PROTO_ICON
		dc.w $0000
		dc.w $0000
		dc.l Awi_keys
		dc.l Awi_obchange
		dc.l Awi_redraw
		dc.l Awi_topped
		dc.l Awi_closed
		dc.l proto_fulled
		dc.l proto_arrowed
		dc.l proto_hslid
		dc.l proto_vslid
		dc.l proto_sized
		dc.l proto_moved
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l Awi_gemscript
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl WIPR_INFO
WIPR_INFO:
		dc.w $0000
		dc.w $0000
		dc.l Awi_service
		dc.l Awi_selfcreate
		dc.l Awi_open
		dc.l Awi_init
		dc.l INFOBOX
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $000b
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
		dc.l TEXT_08
		dc.l TEXT_002
		dc.w $2710
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
		dc.l Awi_closed
		dc.l Awi_fulled
		dc.l Awi_arrowed
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l Awi_gemscript
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
euser:
		dc.l A_editor
		dc.w $0000
		dc.w $0000
		dc.l Auo_editor
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
vslider:
		dc.l A_wislider
		dc.w $0000
		dc.w $0001
		dc.l Auo_wislider
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
hslider:
		dc.l A_wislider
		dc.w $0000
		dc.w $0000
		dc.l Auo_wislider
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
edit:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $8000
		dc.l euser
		dc.w $0000
		dc.w $0000
		dc.w $0028
		dc.w $000a
edit0:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
hor:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l hslider
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
ver:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0020
		dc.w $0000
		dc.l vslider
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
def:
		dc.w $0001
		dc.w $000d
		dc.w $0028
		dc.w $000f
		dc.w $0004
		dc.w $0100
		dc.w $0000
		dc.w $0000
