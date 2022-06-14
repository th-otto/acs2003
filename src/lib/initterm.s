
	.globl ACSinitialize
ACSinitialize:
		lea.l      -10(a7),a7
		jsr        INmemory
		addq.w     #1,d0
		bne.s      ACSinitialize_1
		moveq.l    #-1,d0
		bra        ACSinitialize_2
ACSinitialize_1:
		lea.l      4(a7),a1
		lea.l      6(a7),a0
		jsr        InitAES
		tst.w      d0
		beq.s      ACSinitialize_3
		moveq.l    #-1,d0
		bra        ACSinitialize_2
ACSinitialize_3:
		suba.l     a0,a0
		clr.w      d1
		moveq.l    #4,d0
		jsr        nkc_init
		lea.l      4(a7),a1
		lea.l      6(a7),a0
		jsr        InitVDI
		tst.w      d0
		beq.s      ACSinitialize_4
		moveq.l    #-1,d0
		bra        ACSinitialize_2
ACSinitialize_4:
		jsr        InitMagiC
		tst.w      d0
		bne.s      ACSinitialize_5
		jsr        InitNAES
		tst.w      d0
		beq.s      ACSinitialize_6
ACSinitialize_5:
		moveq.l    #-1,d0
		bra        ACSinitialize_2
ACSinitialize_6:
		movea.l    ACSblk,a0
		move.w     _app,566(a0)
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0001,2(a0)
		beq.s      ACSinitialize_7
		moveq.l    #1,d0
		bra.s      ACSinitialize_8
ACSinitialize_7:
		clr.w      d0
ACSinitialize_8:
		movea.l    ACSblk,a0
		move.w     d0,568(a0)
		movea.l    ACSblk,a0
		move.w     #$FFFF,986(a0)
		jsr        INmouse
		addq.w     #1,d0
		bne.s      ACSinitialize_9
		moveq.l    #-1,d0
		bra        ACSinitialize_2
ACSinitialize_9:
		jsr        Amo_busy
		jsr        INuserobj
		addq.w     #1,d0
		bne.s      ACSinitialize_10
		moveq.l    #-1,d0
		bra        ACSinitialize_2
ACSinitialize_10:
		jsr        InitScrap
		tst.w      d0
		beq.s      ACSinitialize_11
		moveq.l    #-1,d0
		bra        ACSinitialize_2
ACSinitialize_11:
		lea.l      xdfca0,a0
		jsr        Ash_getenv
		move.l     a0,(a7)
		beq.s      ACSinitialize_12
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      ACSinitialize_13
ACSinitialize_12:
		lea.l      xdfca3,a0
		jsr        Ash_getenv
		move.l     a0,(a7)
		beq.s      ACSinitialize_14
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      ACSinitialize_14
ACSinitialize_13:
		movea.l    (a7),a1
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strcpy
ACSinitialize_14:
		moveq.l    #1,d0
		jsr        Pdomain
		jsr        InitPaths
		tst.w      d0
		beq.s      ACSinitialize_15
		moveq.l    #-1,d0
		bra.w      ACSinitialize_2
ACSinitialize_15:
		movea.l    ACSblk,a0
		movea.l    688(a0),a0
		jsr        (a0)
		tst.w      d0
		beq.s      ACSinitialize_16
		moveq.l    #-1,d0
		bra.s      ACSinitialize_2
ACSinitialize_16:
		jsr        InitCfg
		jsr        INMsgService
		tst.w      d0
		beq.s      ACSinitialize_17
		moveq.l    #-1,d0
		bra.s      ACSinitialize_2
ACSinitialize_17:
		jsr        InitProtocol
		tst.w      d0
		beq.s      ACSinitialize_18
		moveq.l    #-1,d0
		bra.s      ACSinitialize_2
ACSinitialize_18:
		jsr        INwindow
		addq.w     #1,d0
		bne.s      ACSinitialize_19
		moveq.l    #-1,d0
		bra.s      ACSinitialize_2
ACSinitialize_19:
		jsr        Awi_root
		movea.l    ACSblk,a1
		move.l     a0,600(a1)
		movea.l    ACSconfig+74,a0 /* ACSinit */
		jsr        (a0)
		move.w     d0,8(a7)
		jsr        Amo_point
		jsr        Amo_unbusy
		clr.w      d0
		jsr        Awi_update
		move.w     8(a7),d0
ACSinitialize_2:
		lea.l      10(a7),a7
		rts

	.globl ACSterminate
ACSterminate:
		move.w     aes_open,d0
		bne.s      ACSterminate_1
		rts
ACSterminate_1:

		jsr        TRwindow
		jsr        TRuserobj
		jsr        TRmouse
		clr.w      d0
		jsr        Awi_update
		jsr        TermProtocol
		jsr        TRMsgService
		jsr        nkc_exit
		jsr        TermVDI
		jsr        TermAES
		movea.l    ACSblk,a0
		move.l     1258(a0),d0
		beq.s      x42f36_1
		movea.l    ACSblk,a0
		movea.l    1258(a0),a0
		jsr        Acfg_delete
x42f36_1:
		jsr        TRmemory
		rts

_acs_boot:
		move.w     ($00000446).w,d0
		ext.l      d0
		rts

InitCfg:
		movea.l    ACSconfig,a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      InitCfg_1
		movea.l    ACSblk,a0
		lea.l      544(a0),a0
		jsr        Af_cfgfile
		move.l     a0,ACSconfig
InitCfg_1:
		movea.l    ACSblk,a0
		move.l     1258(a0),d0
		bne.s      InitCfg_2
		moveq.l    #1,d0
		lea.l      ACSconfig,a0
		jsr        Acfg_create
		movea.l    ACSblk,a1
		move.l     a0,1258(a1)
InitCfg_2:
		clr.w      d0
		rts

InitAES:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		move.w     AesInit,d0
		addq.w     #1,AesInit
		tst.w      d0
		beq.s      InitAES_1
		clr.w      d0
		bra        InitAES_2
InitAES_1:
		movea.l    _globl,a0
		jsr        mt_appl_init
		movea.l    ACSblk,a0
		move.w     d0,(a0)
		movea.l    ACSblk,a0
		move.w     (a0),d0
		bpl.s      InitAES_3
		moveq.l    #-1,d0
		bra        InitAES_2
InitAES_3:
		move.l     _globl,-(a7)
		movea.l    ACSblk,a0
		pea.l      6(a0)
		movea.l    ACSblk,a0
		pea.l      4(a0)
		movea.l    12(a7),a1
		movea.l    16(a7),a0
		jsr        mt_graf_handle
		lea.l      12(a7),a7
		movea.l    ACSblk,a0
		move.w     d0,2(a0)
		movea.l    ACSblk,a0
		movea.l    ACSblk,a1
		move.w     2(a0),16(a1)
		movea.l    ACSblk,a0
		pea.l      14(a0)
		movea.l    ACSblk,a0
		pea.l      12(a0)
		movea.l    ACSblk,a0
		pea.l      10(a0)
		movea.l    ACSblk,a0
		pea.l      8(a0)
		moveq.l    #4,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0400,(a0)
		bge.s      InitAES_4
		cmpi.w     #$0300,_ACSv_magix
		bge.s      InitAES_4
		movea.l    ACSblk,a0
		move.l     1282(a0),d0
		beq.s      InitAES_5
InitAES_4:
		move.l     _globl,-(a7)
		suba.l     a1,a1
		suba.l     a0,a0
		clr.w      d2
		moveq.l    #1,d1
		moveq.l    #9,d0
		jsr        mt_shel_write
		addq.w     #4,a7
InitAES_5:
		move.w     #$0001,aes_open
		clr.w      d0
InitAES_2:
		addq.w     #8,a7
		rts

InitVDI:
		move.l     a2,-(a7)
		lea.l      -126(a7),a7
		move.l     a0,122(a7)
		move.l     a1,118(a7)
		clr.w      (a7)
		move.w     VdiInit,d0
		addq.w     #1,VdiInit
		tst.w      d0
		beq.s      InitVDI_1
		clr.w      d0
		bra        InitVDI_2
InitVDI_1:
		movea.l    ACSblk,a0
		movea.l    ACSblk,a1
		move.w     2(a0),16(a1)
		pea.l      4(a7)
		movea.l    ACSblk,a1
		lea.l      16(a1),a1
		lea.l      work_in,a0
		jsr        v_opnvwk
		addq.w     #4,a7
		moveq.l    #1,d0
		jsr        Awi_update
		movea.l    ACSblk,a0
		move.w     24(a7),644(a0)
		movea.l    ACSblk,a0
		move.w     30(a7),26(a0)
		lea.l      4(a7),a0
		moveq.l    #1,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vq_extnd
		movea.l    ACSblk,a0
		move.w     12(a7),28(a0)
		movea.l    ACSblk,a0
		cmpi.w     #$0004,28(a0)
		bge.s      InitVDI_3
		movea.l    ACSblk,a0
		move.w     #$0041,692(a0)
InitVDI_3:
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0400,(a0)
		blt.s      InitVDI_4
		move.l     _globl,-(a7)
		pea.l      6(a7)
		pea.l      10(a7)
		movea.l    ACSblk,a1
		lea.l      656(a1),a1
		movea.l    ACSblk,a0
		lea.l      658(a0),a0
		clr.w      d0
		jsr        mt_appl_getinfo
		lea.l      12(a7),a7
		tst.w      d0
		beq.s      InitVDI_4
		move.l     _globl,-(a7)
		pea.l      6(a7)
		pea.l      10(a7)
		movea.l    ACSblk,a1
		lea.l      660(a1),a1
		movea.l    ACSblk,a0
		lea.l      662(a0),a0
		moveq.l    #1,d0
		jsr        mt_appl_getinfo
		lea.l      12(a7),a7
		tst.w      d0
		bne        InitVDI_5
InitVDI_4:
		movea.l    122(a7),a0
		move.w     (a0),dum_ob+20
		movea.l    118(a7),a0
		move.w     (a0),dum_ob+22
		move.w     #$0003,dum_ted+12
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		movea.l    _globl,a1
		clr.w      d2
		moveq.l    #1,d1
		clr.w      d0
		lea.l      dum_ob,a0
		jsr        mt_objc_draw
		addq.w     #6,a7
		lea.l      4(a7),a0
		movea.l    ACSblk,a1
		move.w     2(a1),d0
		jsr        vqt_attributes
		movea.l    ACSblk,a0
		move.w     4(a7),656(a0)
		movea.l    ACSblk,a0
		move.w     18(a7),658(a0)
		move.w     #$0005,dum_ted+12
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		movea.l    _globl,a1
		clr.w      d2
		moveq.l    #1,d1
		clr.w      d0
		lea.l      dum_ob,a0
		jsr        mt_objc_draw
		addq.w     #6,a7
		lea.l      4(a7),a0
		movea.l    ACSblk,a1
		move.w     2(a1),d0
		jsr        vqt_attributes
		movea.l    ACSblk,a0
		move.w     4(a7),660(a0)
		movea.l    ACSblk,a0
		move.w     18(a7),662(a0)
InitVDI_5:
		clr.w      (a7)
		moveq.l    #32,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      InitVDI_6
		jsr        vq_gdos
		tst.w      d0
		beq.s      InitVDI_6
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_load_fonts
		movea.l    ACSblk,a0
		add.w      d0,644(a0)
		move.w     #$0001,(a7)
InitVDI_6:
		move.w     (a7),d0
		bne.s      InitVDI_7
		movea.l    ACSblk,a0
		move.w     660(a0),d0
		move.w     d0,-(a7)
		movea.l    ACSblk,a0
		move.w     660(a0),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		move.w     (a7)+,d1
		cmp.w      d0,d1
		beq.s      InitVDI_7
		jsr        vq_gdos
		tst.w      d0
		beq.s      InitVDI_7
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_load_fonts
		movea.l    ACSblk,a0
		add.w      d0,644(a0)
		move.w     #$0001,(a7)
InitVDI_7:
		move.w     (a7),d0
		bne.s      InitVDI_8
		movea.l    ACSblk,a0
		move.w     656(a0),d0
		move.w     d0,-(a7)
		movea.l    ACSblk,a0
		move.w     656(a0),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		move.w     (a7)+,d1
		cmp.w      d0,d1
		beq.s      InitVDI_8
		jsr        vq_gdos
		tst.w      d0
		beq.s      InitVDI_8
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_load_fonts
		movea.l    ACSblk,a0
		add.w      d0,644(a0)
		move.w     #$0001,(a7)
InitVDI_8:
		movea.l    ACSblk,a0
		move.w     656(a0),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		movea.l    ACSblk,a0
		pea.l      20(a0)
		movea.l    ACSblk,a0
		pea.l      18(a0)
		movea.l    ACSblk,a1
		lea.l      24(a1),a1
		movea.l    ACSblk,a0
		lea.l      22(a0),a0
		movea.l    ACSblk,a2
		move.w     658(a2),d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_height
		addq.w     #8,a7
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     10(a0),d0
		movea.l    ACSblk,a0
		muls.w     18(a0),d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     d0,10(a0)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     12(a0),d0
		movea.l    ACSblk,a0
		muls.w     20(a0),d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     d0,12(a0)
		clr.w      d0
InitVDI_2:
		lea.l      126(a7),a7
		movea.l    (a7)+,a2
		rts

InitMagiC:
		movea.l    ACSblk,a0
		lea.l      1278(a0),a0
		move.l     #$4D616758,d0
		jsr        Ash_getcookie
		tst.w      d0
		beq.s      InitMagiC_1
		movea.l    ACSblk,a0
		movea.l    1278(a0),a0
		movea.l    8(a0),a0
		move.w     48(a0),_ACSv_magix
		bra.s      InitMagiC_2
InitMagiC_1:
		move.w     #$FFFF,_ACSv_magix
		movea.l    ACSblk,a0
		clr.l      1278(a0)
InitMagiC_2:
		cmpi.w     #$0300,_ACSv_magix
		blt.s      InitMagiC_3
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		ori.w      #$0800,14(a0)
		bra.s      InitMagiC_4
InitMagiC_3:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		andi.w     #$F7FF,14(a0)
InitMagiC_4:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		ori.w      #$0040,14(a0)
		clr.w      d0
		rts

InitNAES:
		movea.l    ACSblk,a0
		lea.l      1282(a0),a0
		move.l     #$6E414553,d0
		jsr        Ash_getcookie
		tst.w      d0
		bne.s      InitNAES_1
		movea.l    ACSblk,a0
		clr.l      1282(a0)
InitNAES_1:
		clr.w      d0
		rts

InitPaths:
		move.l     a2,-(a7)
		subq.w     #8,a7
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		beq        InitPaths_1
		move.l     _globl,-(a7)
		movea.l    ACSblk,a1
		lea.l      286(a1),a1
		movea.l    ACSblk,a0
		lea.l      30(a0),a0
		jsr        mt_shel_read
		addq.w     #4,a7
		tst.w      d0
		bne.s      InitPaths_2
		moveq.l    #-1,d0
		bra        InitPaths_3
InitPaths_2:
		movea.l    ACSblk,a0
		move.b     286(a0),d0
		beq.s      InitPaths_4
		movea.l    ACSblk,a0
		move.b     286(a0),d0
		ext.w      d0
		movea.l    ACSblk,a0
		adda.w     d0,a0
		clr.b      287(a0)
		movea.l    ACSblk,a1
		lea.l      287(a1),a1
		movea.l    ACSblk,a0
		lea.l      286(a0),a0
		jsr        strcpy
		bra.s      InitPaths_5
InitPaths_4:
		movea.l    ACSblk,a0
		cmpi.w     #$0001,646(a0)
		ble.s      InitPaths_5
		movea.l    ACSblk,a0
		movea.l    648(a0),a0
		movea.l    4(a0),a0
		move.b     (a0),d0
		beq.s      InitPaths_5
		movea.l    ACSblk,a0
		movea.l    648(a0),a0
		movea.l    4(a0),a1
		movea.l    ACSblk,a0
		lea.l      286(a0),a0
		jsr        strcpy
InitPaths_5:
		moveq.l    #47,d0
		movea.l    ACSblk,a0
		lea.l      286(a0),a0
		jsr        strrchr
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      InitPaths_6
		movea.l    (a7),a1
		addq.w     #1,a1
		movea.l    ACSblk,a0
		lea.l      414(a0),a0
		jsr        strcpy
		movea.l    (a7),a0
		clr.b      (a0)
		bra.s      InitPaths_7
InitPaths_6:
		movea.l    ACSblk,a0
		clr.b      414(a0)
InitPaths_7:
		movea.l    ACSblk,a1
		lea.l      30(a1),a1
		movea.l    ACSblk,a0
		lea.l      158(a0),a0
		jsr        strcpy
		moveq.l    #92,d0
		movea.l    ACSblk,a0
		lea.l      158(a0),a0
		jsr        strrchr
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      InitPaths_8
		movea.l    ACSblk,a0
		move.b     158(a0),d0
		beq.s      InitPaths_9
		movea.l    ACSblk,a0
		cmpi.b     #$3A,159(a0)
		bne.s      InitPaths_9
		movea.l    ACSblk,a1
		lea.l      160(a1),a1
		movea.l    ACSblk,a0
		lea.l      544(a0),a0
		jsr        strcpy
		movea.l    ACSblk,a0
		clr.b      160(a0)
		bra.s      InitPaths_10
InitPaths_9:
		movea.l    ACSblk,a1
		lea.l      158(a1),a1
		movea.l    ACSblk,a0
		lea.l      544(a0),a0
		jsr        strcpy
		lea.l      xdfcab,a1
		movea.l    ACSblk,a0
		lea.l      158(a0),a0
		jsr        strcpy
InitPaths_10:
		bra.s      InitPaths_11
InitPaths_8:
		addq.l     #1,(a7)
		movea.l    (a7),a1
		movea.l    ACSblk,a0
		lea.l      544(a0),a0
		jsr        strcpy
		movea.l    (a7),a0
		clr.b      (a0)
InitPaths_11:
		moveq.l    #46,d0
		movea.l    ACSblk,a0
		lea.l      542(a0),a0
		jsr        strrchr
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      InitPaths_12
		movea.l    (a7),a0
		clr.b      (a0)
InitPaths_12:
		bra.s      InitPaths_13
InitPaths_1:
		clr.b      d0
		movea.l    ACSblk,a0
		move.b     d0,542(a0)
		movea.l    ACSblk,a0
		move.b     d0,414(a0)
		movea.l    ACSblk,a0
		move.b     d0,30(a0)
		movea.l    ACSblk,a0
		move.b     d0,158(a0)
		movea.l    ACSblk,a0
		move.b     d0,286(a0)
InitPaths_13:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.b     16(a0),d0
		bne.s      InitPaths_14
		lea.l      xdfcad,a1
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      16(a0),a0
		jsr        strcpy
InitPaths_14:
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0400,(a0)
		bge.s      InitPaths_15
		cmpi.w     #$0300,_ACSv_magix
		bge.s      InitPaths_15
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		bne        InitPaths_16
InitPaths_15:
		movea.l    _globl,a1
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      16(a0),a0
		movea.l    ACSblk,a2
		move.w     (a2),d0
		jsr        mt_menu_register
		movea.l    ACSblk,a0
		move.w     d0,986(a0)
		move.l     _globl,-(a7)
		pea.l      8(a7)
		pea.l      14(a7)
		lea.l      18(a7),a1
		lea.l      18(a7),a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		bne.w      InitPaths_16
		move.w     4(a7),d0
		beq.s      InitPaths_16
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      16(a0),a0
		jsr        strlen
		moveq.l    #15,d1
		cmp.l      d0,d1
		bcc.s      InitPaths_17
		moveq.l    #15,d0
		bra.s      InitPaths_18
InitPaths_17:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      16(a0),a0
		jsr        strlen
InitPaths_18:
		movea.l    ACSblk,a0
		movea.l    572(a0),a1
		lea.l      16(a1),a1
		lea.l      _ALIB_ERR_ACC+30,a0
		jsr        strncpy
		movea.l    _globl,a1
		lea.l      _ALIB_ERR_ACC,a0
		moveq.l    #1,d0
		jsr        mt_form_alert
		move.w     d0,6(a7)
		cmpi.w     #$0001,6(a7)
		beq.s      InitPaths_16
		moveq.l    #-1,d0
		bra        InitPaths_3
InitPaths_16:
		movea.l    ACSblk,a0
		clr.b      726(a0)
		lea.l      xdfcb7,a0
		jsr        Ash_getenv
		move.l     a0,(a7)
		bne.s      InitPaths_19
		lea.l      xdfcbc,a0
		jsr        Ash_getenv
		move.l     a0,(a7)
		bne.s      InitPaths_19
		lea.l      xdfcc3,a0
		jsr        Ash_getenv
		move.l     a0,(a7)
		beq        InitPaths_20
InitPaths_19:
		movea.l    (a7),a1
		movea.l    ACSblk,a0
		lea.l      726(a0),a0
		jsr        strcpy
		moveq.l    #92,d0
		movea.l    ACSblk,a0
		lea.l      726(a0),a0
		jsr        strrchr
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      InitPaths_21
		movea.l    (a7),a0
		move.b     1(a0),d0
		bne.s      InitPaths_21
		movea.l    (a7),a0
		clr.b      (a0)
InitPaths_21:
		movea.l    ACSblk,a0
		move.b     726(a0),d0
		ext.w      d0
		jsr        toupper
		cmp.w      #$0043,d0
		blt.s      InitPaths_22
		movea.l    ACSblk,a0
		lea.l      726(a0),a0
		jsr        Af_length
		moveq.l    #-1,d1
		cmp.l      d0,d1
		beq.s      InitPaths_23
InitPaths_22:
		movea.l    ACSblk,a0
		clr.b      726(a0)
		bra.s      InitPaths_20
InitPaths_23:
		lea.l      xdfcc7,a1
		movea.l    ACSblk,a0
		lea.l      726(a0),a0
		jsr        strcat
InitPaths_20:
		movea.l    ACSblk,a0
		move.b     726(a0),d0
		bne.s      InitPaths_24
		movea.l    ACSblk,a1
		lea.l      158(a1),a1
		movea.l    ACSblk,a0
		lea.l      726(a0),a0
		jsr        strcpy
InitPaths_24:
		movea.l    ACSblk,a0
		move.b     726(a0),d0
		bne.s      InitPaths_25
		lea.l      xdfcc9,a1
		movea.l    ACSblk,a0
		lea.l      726(a0),a0
		jsr        strcpy
		jsr        Dgetdrv
		jsr        Dsetdrv
		and.l      #$00000004,d0
		beq.s      InitPaths_25
		movea.l    ACSblk,a0
		move.b     #$43,726(a0)
InitPaths_25:
		clr.w      d0
InitPaths_3:
		addq.w     #8,a7
		movea.l    (a7)+,a2
		rts

InitProtocol:
		subq.w     #4,a7
		move.w     ProtInit,d0
		addq.w     #1,ProtInit
		tst.w      d0
		beq.s      InitProtocol_1
		clr.w      d0
		bra        InitProtocol_2
InitProtocol_1:
		jsr        Alu_create
		move.l     a0,ListOfApps
		move.l     ListOfApps,d0
		bne.s      InitProtocol_3
		clr.w      d0
		bra        InitProtocol_2
InitProtocol_3:
		movea.l    ListOfApps,a0
		move.l     #Aev_DDRemove,4(a0)
		jsr        Alu_create
		move.l     a0,SentMsg
		move.l     SentMsg,d0
		bne.s      InitProtocol_4
		movea.l    ListOfApps,a0
		jsr        Alu_delete
		clr.w      d0
		bra        InitProtocol_2
InitProtocol_4:
		movea.l    ACSblk,a0
		lea.l      544(a0),a0
		move.l     a0,(a7)
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		beq.s      InitProtocol_5
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      InitProtocol_6
InitProtocol_5:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      18(a0),a0
		move.l     a0,(a7)
InitProtocol_6:
		moveq.l    #10,d0
		jsr        Ax_glmalloc
		movea.l    ACSblk,a1
		move.l     a0,988(a1)
		movea.l    ACSblk,a0
		move.l     988(a0),d0
		beq.s      InitProtocol_7
		lea.l      xdfccd,a1
		movea.l    ACSblk,a0
		movea.l    988(a0),a0
		jsr        strcpy
		movea.l    (a7),a0
		jsr        strlen
		moveq.l    #8,d1
		cmp.l      d0,d1
		bls.s      InitProtocol_8
		movea.l    (a7),a0
		jsr        strlen
		bra.s      InitProtocol_9
InitProtocol_8:
		moveq.l    #8,d0
InitProtocol_9:
		movea.l    (a7),a1
		movea.l    ACSblk,a0
		movea.l    988(a0),a0
		jsr        strncpy
		jsr        Ast_toupper
InitProtocol_7:
		moveq.l    #51,d0
		jsr        Ax_glmalloc
		movea.l    ACSblk,a1
		move.l     a0,1254(a1)
		movea.l    ACSblk,a0
		move.l     1254(a0),d0
		beq.s      InitProtocol_10
		movea.l    ACSblk,a0
		movea.l    988(a0),a1
		movea.l    ACSblk,a0
		movea.l    1254(a0),a0
		jsr        strcpy
InitProtocol_10:
		movea.l    ACSblk,a0
		move.l     1254(a0),d0
		beq.s      InitProtocol_11
		jsr        Aev_InitXAcc
		jsr        Aev_InitGEMScript
InitProtocol_11:
		movea.l    ACSblk,a0
		move.l     988(a0),d0
		beq.s      InitProtocol_12
		jsr        Aev_InitVA
		jsr        Aev_InitDD
		jsr        Aev_InitBubble
		jsr        Aev_InitOlga
		jsr        Aev_InitSTGuide
		jsr        Aev_InitSE
		jsr        Aev_InitPCHelp
		jsr        Aev_InitSSP
		jsr        Aev_InitDHST
InitProtocol_12:
		clr.w      d0
InitProtocol_2:
		addq.w     #4,a7
		rts

InitScrap:
		lea.l      -12(a7),a7
		movea.l    _globl,a1
		movea.l    ACSblk,a0
		lea.l      854(a0),a0
		jsr        mt_scrp_read
		movea.l    ACSblk,a0
		move.b     854(a0),d0
		bne.s      InitScrap_1
		lea.l      xdfcd7,a0
		jsr        Ash_getenv
		move.l     a0,(a7)
		bne.s      InitScrap_2
		lea.l      xdfce1,a0
		jsr        Ash_getenv
		move.l     a0,(a7)
		bne.s      InitScrap_2
		lea.l      xdfce9,a0
		jsr        Ash_getenv
		move.l     a0,(a7)
		beq.s      InitScrap_3
InitScrap_2:
		movea.l    (a7),a1
		movea.l    ACSblk,a0
		lea.l      854(a0),a0
		jsr        strcpy
		bra.s      InitScrap_1
InitScrap_3:
		lea.l      xdfcf2,a1
		movea.l    ACSblk,a0
		lea.l      854(a0),a0
		jsr        strcpy
		lea.l      _acs_boot(pc),a0
		jsr        Supexec
		add.b      #$41,d0
		movea.l    ACSblk,a0
		move.b     d0,854(a0)
InitScrap_1:
		movea.l    ACSblk,a0
		move.b     854(a0),d0
		ext.w      d0
		jsr        toupper
		cmp.w      #$0043,d0
		blt        InitScrap_4
		movea.l    ACSblk,a0
		lea.l      854(a0),a0
		jsr        strlen
		move.l     d0,4(a7)
		ble.w      InitScrap_4
		subq.l     #1,4(a7)
		move.l     4(a7),d0
		movea.l    ACSblk,a0
		adda.l     d0,a0
		cmpi.b     #$5C,854(a0)
		bne.s      InitScrap_5
		move.l     4(a7),d0
		movea.l    ACSblk,a0
		adda.l     d0,a0
		clr.b      854(a0)
InitScrap_5:
		movea.l    ACSblk,a0
		lea.l      854(a0),a0
		jsr        Dcreate
		move.l     d0,8(a7)
		lea.l      xdfcfd,a1
		movea.l    ACSblk,a0
		lea.l      854(a0),a0
		jsr        strcat
		move.l     8(a7),d0
		bpl.s      InitScrap_6
		moveq.l    #-36,d0
		cmp.l      8(a7),d0
		bne.s      InitScrap_7
InitScrap_6:
		movea.l    _globl,a1
		movea.l    ACSblk,a0
		lea.l      854(a0),a0
		jsr        mt_scrp_write
InitScrap_7:
		bra.s      InitScrap_8
InitScrap_4:
		movea.l    _globl,a1
		lea.l      xdfcff,a0
		jsr        mt_scrp_write
InitScrap_8:
		clr.w      d0
		lea.l      12(a7),a7
		rts

TermProtocol:
		subq.w     #1,ProtInit
		beq.s      TermProtocol_1
		bra        TermProtocol_2
TermProtocol_1:
		movea.l    ListOfApps,a0
		jsr        Alu_delete
		movea.l    SentMsg,a0
		jsr        Alu_delete
		jsr        Aev_ExitDHST
		jsr        Aev_ExitSSP
		jsr        Aev_ExitPCHelp
		jsr        Aev_ExitSE
		jsr        Aev_ExitSTGuide
		jsr        Aev_ExitOlga
		jsr        Aev_ExitGEMScript
		jsr        Aev_ExitBubble
		jsr        Aev_ExitDD
		jsr        Aev_ExitVA
		jsr        Aev_ExitXAcc
		movea.l    ACSblk,a0
		move.l     1254(a0),d0
		beq.s      TermProtocol_3
		movea.l    ACSblk,a0
		movea.l    1254(a0),a0
		jsr        Ax_glfree
TermProtocol_3:
		movea.l    ACSblk,a0
		move.l     988(a0),d0
		beq.s      TermProtocol_2
		movea.l    ACSblk,a0
		movea.l    988(a0),a0
		jsr        Ax_glfree
TermProtocol_2:
		rts

TermVDI:
		subq.w     #1,VdiInit
		beq.s      TermVDI_1
		rts
TermVDI_1:

		moveq.l    #32,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      x43d1c_1
		jsr        vq_gdos
		tst.w      d0
		beq.s      x43d1c_1
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_unload_fonts
x43d1c_1:
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        v_clsvwk
		rts

TermAES:
		lea.l      -34(a7),a7
		subq.w     #1,AesInit
		beq.s      TermAES_1
		bra.w      TermAES_2
TermAES_1:
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		beq.s      TermAES_3
		movea.l    _globl,a0
		jsr        mt_appl_exit
		bra.s      TermAES_2
TermAES_3:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.b     #$05,16(a0)
		bra.s      TermAES_4
TermAES_5:
		move.l     _globl,-(a7)
		pea.l      36(a7)
		pea.l      40(a7)
		pea.l      44(a7)
		pea.l      48(a7)
		pea.l      52(a7)
		move.l     #$7FFF7FFF,-(a7)
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
		lea.l      82(a7),a1
		lea.l      50(a7),a0
		clr.w      d2
		clr.w      d1
		moveq.l    #48,d0
		jsr        mt_evnt_multi
		lea.l      50(a7),a7
TermAES_4:
		bra.s      TermAES_5
TermAES_2:
		lea.l      34(a7),a7
		rts

	.data

ProtInit:
		dc.w $0000
VdiInit:
		dc.w $0000
AesInit:
		dc.w $0000
aes_open:
		dc.w $0000
work_in:
		dc.w $0001
		dc.w $0001
		dc.w $0001
		dc.w $0001
		dc.w $0001
		dc.w $0001
		dc.w $0001
		dc.w $0001
		dc.w $0001
		dc.w $0001
		dc.w $0002
dum_ted:
		dc.l xdfca7
		dc.l xdfca9
		dc.l xdfcaa
		dc.w $0003
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
dum_ob:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0015
		dc.w $0020
		dc.w $0000
		dc.l dum_ted
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xdfca0:
		dc.b 'FS',0
xdfca3:
		dc.b 'IFS',0
xdfca7:
		dc.b $20,0
xdfca9:
		dc.b 0
xdfcaa: dc.b 0
xdfcab:
		dc.b $5c,0
xdfcad:
		dc.b '  ACS-Acc',0
xdfcb7:
		dc.b 'HOME',0
xdfcbc:
		dc.b 'TMPDIR',0
xdfcc3:
		dc.b 'TMP',0
xdfcc7:
		dc.b $5c,0
xdfcc9:
		dc.b $41,$3a,$5c,0
xdfccd:
		dc.b '        ',0,0
xdfcd7:
		dc.b 'CLIPBOARD',0
xdfce1:
		dc.b 'CLIPBRD',0
xdfce9:
		dc.b 'SCRAPDIR',0
xdfcf2:
		dc.b 'X:\clipbrd',0
xdfcfd:
		dc.b $5c,0
xdfcff:
		dc.b 0

	.even
