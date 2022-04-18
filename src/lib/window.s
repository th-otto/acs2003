	.globl INwindow
INwindow:
		subq.w     #4,a7
		move.w     init,d0
		addq.w     #1,init
		tst.w      d0
		beq.s      INwindow_1
		clr.w      d0
		bra        INwindow_2
INwindow_1:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     10(a0),virt_desk
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		cmp.w      12(a0),d0
		ble.s      INwindow_3
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		bra.s      INwindow_4
INwindow_3:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     12(a0),d0
INwindow_4:
		move.w     d0,$00113F20
		movea.l    ACSblk,a0
		move.w     12(a0),d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     10(a0),d1
		add.w      d1,d1
		sub.w      d1,d0
		move.w     d0,$00113F22
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		movea.l    ACSblk,a0
		add.w      14(a0),d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		sub.w      12(a0),d0
		sub.w      $00113F20,d0
		move.w     d0,$00113F24
		movea.l    ACSblk,a0
		move.w     4(a0),d1
		move.w     d1,d0
		lsl.w      #2,d0
		add.w      d1,d0
		move.w     d0,wi_minw
		movea.l    ACSblk,a0
		move.w     6(a0),d1
		move.w     d1,d0
		add.w      d0,d0
		add.w      d1,d0
		add.w      d0,d0
		move.w     d0,wi_minh
		lea.l      _ICO,a0
		jsr        Aob_create
		move.l     a0,_WWorkIcon
		move.l     _WWorkIcon,d0
		beq.s      INwindow_5
		movea.l    _WWorkIcon,a0
		jsr        Aob_fix
		movea.l    _WWorkIcon,a0
		lea.l      24(a0),a0
		move.l     a0,_WIcon
		movea.l    _WIcon,a0
		movea.l    12(a0),a0
		move.l     8(a0),_WIconText
		bra.s      INwindow_6
INwindow_5:
		moveq.l    #0,d0
		move.l     d0,_WIconText
		move.l     d0,_WIcon
INwindow_6:
		clr.w      _ACSv_wmenu
		clr.w      _ACSv_wwork
		moveq.l    #32,d1
		clr.w      d0
		lea.l      modwins,a0
		jsr        memset
		move.l     #$00000400,d1
		clr.w      d0
		lea.l      _ACSv_winds,a0
		jsr        memset
		move.l     #$00000200,d1
		clr.w      d0
		lea.l      _ACSv_wiicons,a0
		jsr        memset
		move.l     #$00000200,d1
		clr.w      d0
		lea.l      icnmap,a0
		jsr        memset
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		beq.s      INwindow_7
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		beq.s      INwindow_8
INwindow_7:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     52(a0),d0
		beq.s      INwindow_8
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     52(a0),(a7)
		bra.s      INwindow_9
INwindow_8:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.l     48(a0),(a7)
INwindow_9:
		suba.l     a0,a0
		movea.l    (a7),a1
		movea.l    8(a1),a1
		jsr        (a1)
		move.l     a0,Aroot_wi
		move.l     Aroot_wi,d0
		bne.s      INwindow_10
		moveq.l    #-1,d0
		bra.s      INwindow_2
INwindow_10:
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		beq.s      INwindow_11
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		beq.s      INwindow_12
		movea.l    Aroot_wi,a0
		move.l     20(a0),d0
		beq.s      INwindow_12
		movea.l    Aroot_wi,a0
		jsr        Awi_open
		addq.w     #1,d0
		bne.s      INwindow_13
		moveq.l    #-1,d0
		bra.s      INwindow_2
INwindow_13:
		bra.s      INwindow_11
INwindow_12:
		movea.l    Aroot_wi,a0
		jsr        Awi_ropen
INwindow_11:
		clr.w      d0
INwindow_2:
		addq.w     #4,a7
		rts

	.globl TRwindow
TRwindow:
		move.l     a2,-(a7)
		subq.w     #6,a7
		subq.w     #1,init
		beq.s      TRwindow_1
		bra        TRwindow_2
TRwindow_1:
		moveq.l    #1,d0
		jsr        Awi_update
		move.w     _Wmax_wi,4(a7)
		bra.s      TRwindow_3
TRwindow_5:
		move.w     4(a7),d0
		lsl.w      #2,d0
		lea.l      _ACSv_winds,a0
		move.l     0(a0,d0.w),(a7)
		move.l     (a7),d0
		beq.s      TRwindow_4
		movea.l    (a7),a0
		cmpa.l     Aroot_wi,a0
		beq.s      TRwindow_4
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
TRwindow_4:
		subq.w     #1,4(a7)
TRwindow_3:
		move.w     4(a7),d0
		bpl.s      TRwindow_5
		movea.l    ACSblk,a0
		movea.l    664(a0),a0
		jsr        (a0)
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    Aroot_wi,a0
		movea.l    Aroot_wi,a2
		movea.l    4(a2),a2
		jsr        (a2)
		clr.w      4(a7)
		bra.s      TRwindow_6
TRwindow_8:
		move.w     4(a7),d0
		lsl.w      #2,d0
		lea.l      _ACSv_wiicons,a0
		move.l     0(a0,d0.w),d0
		beq.s      TRwindow_7
		move.w     4(a7),d0
		lsl.w      #2,d0
		lea.l      _ACSv_wiicons,a0
		movea.l    0(a0,d0.w),a0
		movea.l    36(a0),a0
		jsr        Aic_delete
		moveq.l    #72,d0
		move.w     4(a7),d1
		lsl.w      #2,d1
		lea.l      _ACSv_wiicons,a0
		movea.l    0(a0,d1.w),a0
		jsr        Ax_recycle
TRwindow_7:
		addq.w     #1,4(a7)
TRwindow_6:
		cmpi.w     #$0080,4(a7)
		blt.s      TRwindow_8
		jsr        Ax_release
TRwindow_2:
		addq.w     #6,a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_ontop
Awi_ontop:
		move.l     top_window,d0
		bne.s      Awi_ontop_1
		jsr        Awi_root
		rts
Awi_ontop_1:

		movea.l    top_window,a0
		rts

	.globl Awi_setontop
Awi_setontop:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.l     a0,top_window
		addq.w     #4,a7
		rts

Awi_iconcreate:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		movea.l    8(a7),a0
		move.w     32(a0),d0
		bmi.s      Awi_iconcreate_1
		movea.l    8(a7),a0
		cmpi.w     #$0080,32(a0)
		bge.s      Awi_iconcreate_1
		move.l     _WWorkIcon,d0
		beq.s      Awi_iconcreate_1
		movea.l    8(a7),a0
		move.w     32(a0),d0
		lsl.w      #2,d0
		lea.l      _ACSv_wiicons,a0
		move.l     0(a0,d0.w),d0
		bne.s      Awi_iconcreate_1
		moveq.l    #72,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		movea.l    8(a7),a1
		move.w     32(a1),d0
		lsl.w      #2,d0
		lea.l      _ACSv_wiicons,a1
		move.l     a0,0(a1,d0.w)
		bne.s      Awi_iconcreate_2
Awi_iconcreate_1:
		clr.w      d0
		bra        Awi_iconcreate_3
Awi_iconcreate_2:
		moveq.l    #72,d0
		movea.l    _WWorkIcon,a1
		movea.l    (a7),a0
		jsr        memcpy
		movea.l    8(a7),a0
		move.l     90(a0),4(a7)
		beq.s      Awi_iconcreate_4
		movea.l    4(a7),a0
		jsr        Aic_create
		movea.l    (a7),a1
		move.l     a0,36(a1)
		bra.s      Awi_iconcreate_5
Awi_iconcreate_4:
		movea.l    8(a7),a0
		move.l     74(a0),d0
		beq.s      Awi_iconcreate_6
		movea.l    8(a7),a0
		movea.l    (a7),a1
		movea.l    36(a1),a1
		move.l     74(a0),8(a1)
Awi_iconcreate_6:
		movea.l    _WIcon,a0
		movea.l    12(a0),a0
		jsr        Aic_create
		movea.l    (a7),a1
		move.l     a0,36(a1)
		movea.l    _WIcon,a0
		movea.l    12(a0),a0
		move.l     _WIconText,8(a0)
Awi_iconcreate_5:
		movea.l    (a7),a0
		lea.l      24(a0),a0
		jsr        Aob_icon
		moveq.l    #1,d0
Awi_iconcreate_3:
		lea.l      12(a7),a7
		rts

Awi_icondelete:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.w     32(a0),d0
		bmi.s      Awi_icondelete_1
		movea.l    (a7),a0
		cmpi.w     #$0080,32(a0)
		bge.s      Awi_icondelete_1
		movea.l    (a7),a0
		move.w     32(a0),d0
		lsl.w      #2,d0
		lea.l      _ACSv_wiicons,a0
		move.l     0(a0,d0.w),d0
		bne.s      Awi_icondelete_2
Awi_icondelete_1:
		clr.w      d0
		bra.s      Awi_icondelete_3
Awi_icondelete_2:
		movea.l    (a7),a0
		move.w     32(a0),d0
		lsl.w      #2,d0
		lea.l      _ACSv_wiicons,a0
		movea.l    0(a0,d0.w),a0
		movea.l    36(a0),a0
		jsr        Aic_delete
		moveq.l    #72,d0
		movea.l    (a7),a0
		move.w     32(a0),d1
		lsl.w      #2,d1
		lea.l      _ACSv_wiicons,a0
		movea.l    0(a0,d1.w),a0
		jsr        Ax_recycle
		movea.l    (a7),a0
		move.w     32(a0),d0
		lsl.w      #2,d0
		lea.l      _ACSv_wiicons,a0
		clr.l      0(a0,d0.w)
		moveq.l    #1,d0
Awi_icondelete_3:
		addq.w     #4,a7
		rts

	.globl Awi_invalid
Awi_invalid:
		move.l     a2,-(a7)
		subq.w     #6,a7
		clr.w      4(a7)
		bra.s      Awi_invalid_1
Awi_invalid_3:
		move.w     4(a7),d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		move.l     0(a0,d0.w),(a7)
		move.l     (a7),d0
		beq.s      Awi_invalid_2
		movea.l    (a7),a0
		move.w     #$FFFF,32(a0)
Awi_invalid_2:
		addq.w     #1,4(a7)
Awi_invalid_1:
		cmpi.w     #$0080,4(a7)
		blt.s      Awi_invalid_3
		clr.w      4(a7)
		bra.s      Awi_invalid_4
Awi_invalid_6:
		move.w     4(a7),d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		move.l     0(a0,d0.w),(a7)
		move.w     4(a7),d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		clr.l      0(a0,d0.w)
		move.l     (a7),d0
		beq.s      Awi_invalid_5
		movea.l    (a7),a0
		jsr        Awi_closed
		suba.l     a1,a1
		moveq.l    #3,d0
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
Awi_invalid_5:
		addq.w     #1,4(a7)
Awi_invalid_4:
		cmpi.w     #$0080,4(a7)
		blt.s      Awi_invalid_6
		addq.w     #6,a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_wid
Awi_wid:
		subq.w     #2,a7
		move.w     d0,(a7)
		move.w     (a7),d0
		bmi.s      Awi_wid_1
		cmpi.w     #$0080,(a7)
		blt.s      Awi_wid_2
Awi_wid_1:
		suba.l     a0,a0
		bra.s      Awi_wid_3
Awi_wid_2:
		move.w     (a7),d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		movea.l    0(a0,d0.w),a0
Awi_wid_3:
		addq.w     #2,a7
		rts

	.globl Awi_root
Awi_root:
		movea.l    Aroot_wi,a0
		rts

	.globl Awi_init
Awi_init:
		clr.w      d0
		rts

	.globl Ash_prog
Ash_prog:
		move.l     a2,-(a7)
		lea.l      -884(a7),a7
		move.l     a0,856(a7)
		move.l     a1,852(a7)
		clr.w      330(a7)
		clr.w      326(a7)
		clr.l      298(a7)
		lea.l      xe0d46,a0
		lea.l      160(a7),a1
		moveq.l    #127,d0
Ash_prog_1:
		move.b     (a0)+,(a1)+
		dbf        d0,Ash_prog_1
		lea.l      xe0dc6,a0
		lea.l      32(a7),a1
		moveq.l    #127,d0
Ash_prog_2:
		move.b     (a0)+,(a1)+
		dbf        d0,Ash_prog_2
		clr.l      24(a7)
		move.l     exec_com,d0
		beq.s      Ash_prog_3
		movea.l    exec_com,a0
		jsr        Ax_glfree
		clr.l      exec_com
Ash_prog_3:
		move.l     exec_path,d0
		beq.s      Ash_prog_4
		movea.l    exec_path,a0
		jsr        Ax_glfree
		clr.l      exec_path
Ash_prog_4:
		movea.l    856(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      Ash_prog_5
		moveq.l    #-1,d0
		bra        Ash_prog_6
Ash_prog_5:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0200,d0
		bne.s      Ash_prog_7
		moveq.l    #127,d0
		movea.l    856(a7),a1
		lea.l      32(a7),a0
		jsr        strncat
		moveq.l    #92,d0
		lea.l      32(a7),a0
		jsr        strrchr
		move.l     a0,28(a7)
		beq.s      Ash_prog_8
		movea.l    28(a7),a0
		clr.b      (a0)
Ash_prog_8:
		lea.l      32(a7),a0
		jsr        Af_2drv
		jsr        Dsetdrv
		lea.l      34(a7),a0
		jsr        Dsetpath
Ash_prog_7:
		movea.l    856(a7),a1
		lea.l      288(a7),a0
		jsr        Af_2ext
		jsr        Ast_toupper
		lea.l      xe0f30,a0
		jsr        Ash_getenv
		move.l     a0,28(a7)
		beq.s      Ash_prog_9
		moveq.l    #127,d0
		movea.l    28(a7),a1
		lea.l      160(a7),a0
		jsr        strncat
		jsr        Ast_toupper
		clr.b      287(a7)
		lea.l      xe0f3a,a1
		lea.l      160(a7),a0
		jsr        strtok
		move.l     a0,28(a7)
		bra.s      Ash_prog_10
Ash_prog_12:
		movea.l    28(a7),a1
		lea.l      288(a7),a0
		jsr        strcmp
		tst.w      d0
		bne.s      Ash_prog_11
		move.w     #$0001,326(a7)
		bra.s      Ash_prog_9
Ash_prog_11:
		lea.l      xe0f3c,a1
		suba.l     a0,a0
		jsr        strtok
		move.l     a0,28(a7)
Ash_prog_10:
		move.l     28(a7),d0
		bne.s      Ash_prog_12
Ash_prog_9:
		move.w     326(a7),d0
		bne.s      Ash_prog_13
		lea.l      xe0f3e,a1
		lea.l      288(a7),a0
		jsr        strcmp
		tst.w      d0
		beq.s      Ash_prog_14
		lea.l      xe0f42,a1
		lea.l      288(a7),a0
		jsr        strcmp
		tst.w      d0
		beq.s      Ash_prog_14
		lea.l      xe0f46,a1
		lea.l      288(a7),a0
		jsr        strcmp
		tst.w      d0
		bne.s      Ash_prog_13
Ash_prog_14:
		move.w     #$0001,326(a7)
Ash_prog_13:
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		beq        Ash_prog_15
		movea.l    ACSblk,a0
		move.l     1278(a0),d0
		bne.s      Ash_prog_16
		move.l     _globl,-(a7)
		movea.l    856(a7),a1
		movea.l    860(a7),a0
		moveq.l    #1,d2
		move.l     a1,-(a7)
		move.l     a0,-(a7)
		move.w     d2,-(a7)
		move.w     340(a7),d0
		beq.s      Ash_prog_17
		moveq.l    #1,d1
		bra.s      Ash_prog_18
Ash_prog_17:
		clr.w      d1
Ash_prog_18:
		clr.w      d0
		move.w     (a7)+,d2
		movea.l    (a7)+,a0
		movea.l    (a7)+,a1
		jsr        mt_shel_write
		addq.w     #4,a7
		ext.l      d0
		bra        Ash_prog_6
		bra.s      Ash_prog_15
Ash_prog_16:
		move.l     _globl,-(a7)
		movea.l    856(a7),a1
		movea.l    860(a7),a0
		moveq.l    #100,d2
		move.l     a1,-(a7)
		move.l     a0,-(a7)
		move.w     d2,-(a7)
		move.w     340(a7),d0
		beq.s      Ash_prog_19
		moveq.l    #1,d1
		bra.s      Ash_prog_20
Ash_prog_19:
		clr.w      d1
Ash_prog_20:
		moveq.l    #1,d0
		move.w     (a7)+,d2
		movea.l    (a7)+,a0
		movea.l    (a7)+,a1
		jsr        mt_shel_write
		addq.w     #4,a7
		ext.l      d0
		bra        Ash_prog_6
Ash_prog_15:
		jsr        Awi_diaend
		jsr        Amo_point
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		beq        Ash_prog_21
		lea.l      (a7),a0
		jsr        Act_save
		clr.l      -(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		pea.l      340(a7)
		moveq.l    #10,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		move.w     328(a7),d0
		bsr        Awi_wid
		move.l     a0,332(a7)
		move.w     #$0001,330(a7)
		bra.s      Ash_prog_22
Ash_prog_24:
		move.w     330(a7),d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		movea.l    0(a0,d0.w),a0
		move.l     a0,336(a7)
		move.w     330(a7),d0
		lsl.w      #2,d0
		lea.l      340(a7),a1
		move.l     a0,0(a1,d0.w)
		move.w     330(a7),d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		clr.l      0(a0,d0.w)
		move.l     336(a7),d0
		beq.s      Ash_prog_23
		movea.l    336(a7),a0
		move.w     32(a0),328(a7)
		movea.l    _globl,a0
		move.w     328(a7),d0
		jsr        mt_wind_close
		movea.l    _globl,a0
		move.w     328(a7),d0
		jsr        mt_wind_delete
		movea.l    336(a7),a0
		move.w     #$FFFF,32(a0)
		jsr        Aev_mess
Ash_prog_23:
		addq.w     #1,330(a7)
Ash_prog_22:
		cmpi.w     #$0080,330(a7)
		blt.s      Ash_prog_24
		movea.l    Aroot_wi,a0
		move.w     32(a0),d0
		bne        Ash_prog_25
		movea.l    _globl,a1
		clr.w      d0
		suba.l     a0,a0
		jsr        mt_menu_bar
		clr.w      -(a7)
		clr.l      -(a7)
		moveq.l    #14,d1
		clr.w      d0
		jsr        wind_set
		addq.w     #6,a7
		move.w     326(a7),d0
		beq        Ash_prog_25
		move.l     856(a7),topline+12
		movea.l    ACSblk,a0
		move.w     12(a0),topline+20
		moveq.l    #-1,d0
		movea.l    ACSblk,a0
		add.w      10(a0),d0
		move.w     d0,topline+22
		movea.l    ACSblk,a0
		move.w     14(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     12(a0),-(a7)
		clr.w      -(a7)
		movea.l    _globl,a1
		clr.w      d2
		moveq.l    #1,d1
		clr.w      d0
		lea.l      topline,a0
		jsr        mt_objc_draw
		addq.w     #6,a7
		movea.l    ACSblk,a0
		move.w     14(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     12(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     10(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     8(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     14(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     12(a0),-(a7)
		movea.l    _globl,a0
		movea.l    ACSblk,a1
		move.w     10(a1),d2
		movea.l    ACSblk,a1
		move.w     8(a1),d1
		moveq.l    #3,d0
		jsr        mt_form_dial
		lea.l      12(a7),a7
Ash_prog_25:
		jsr        Aev_mess
		move.w     326(a7),d0
		beq.s      Ash_prog_26
		move.l     _globl,-(a7)
		movea.l    856(a7),a1
		movea.l    860(a7),a0
		clr.w      d2
		moveq.l    #1,d1
		clr.w      d0
		jsr        mt_shel_write
		addq.w     #4,a7
Ash_prog_26:
		moveq.l    #16,d0
		jsr        Awi_update
		movea.l    _globl,a0
		jsr        mt_appl_exit
		move.w     326(a7),d0
		beq.s      Ash_prog_27
		move.l     892(a7),-(a7)
		movea.l    856(a7),a1
		movea.l    860(a7),a0
		clr.w      d0
		jsr        Pexec
		addq.w     #4,a7
		move.l     d0,298(a7)
		bra        Ash_prog_28
Ash_prog_27:
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0100,d0
		jsr        mt_graf_mouse
		movea.l    ACSblk,a0
		move.w     10(a0),d1
		movea.l    ACSblk,a0
		move.w     12(a0),d0
		jsr        Abp_create
		move.l     a0,24(a7)
		move.l     24(a7),d0
		beq.s      Ash_prog_29
		clr.w      d0
		move.w     d0,320(a7)
		move.w     d0,318(a7)
		move.w     d0,312(a7)
		move.w     d0,310(a7)
		moveq.l    #-1,d0
		movea.l    ACSblk,a0
		add.w      12(a0),d0
		move.w     d0,322(a7)
		move.w     d0,314(a7)
		moveq.l    #-1,d0
		movea.l    ACSblk,a0
		add.w      10(a0),d0
		move.w     d0,324(a7)
		move.w     d0,316(a7)
		move.l     24(a7),-(a7)
		movea.l    ACSblk,a1
		lea.l      618(a1),a1
		lea.l      314(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vro_cpyfm
		addq.w     #4,a7
Ash_prog_29:
		clr.w      d0
		move.w     d0,304(a7)
		move.w     d0,302(a7)
		movea.l    ACSblk,a0
		move.w     8(a0),d0
		movea.l    ACSblk,a0
		add.w      12(a0),d0
		subq.w     #1,d0
		move.w     d0,306(a7)
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		movea.l    ACSblk,a0
		add.w      14(a0),d0
		subq.w     #1,d0
		move.w     d0,308(a7)
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vswr_mode
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_interior
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_perimeter
		lea.l      302(a7),a0
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_bar
		lea.l      xe0f4a,a0
		jsr        Cconws
		move.l     892(a7),-(a7)
		movea.l    856(a7),a1
		movea.l    860(a7),a0
		clr.w      d0
		jsr        Pexec
		addq.w     #4,a7
		move.l     d0,298(a7)
		lea.l      xe0f4f,a0
		jsr        Cconws
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      Ash_prog_30
		lea.l      xe0f52,a0
		jsr        Cconws
		nop
Ash_prog_31:
		jsr        Cconis
		tst.w      d0
		beq.s      Ash_prog_31
		jsr        Cconin
Ash_prog_30:
		move.l     24(a7),d0
		beq.s      Ash_prog_32
		movea.l    ACSblk,a0
		pea.l      618(a0)
		movea.l    28(a7),a1
		lea.l      314(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vro_cpyfm
		addq.w     #4,a7
		movea.l    24(a7),a0
		jsr        Abp_delete
Ash_prog_32:
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0101,d0
		jsr        mt_graf_mouse
Ash_prog_28:
		movea.l    _globl,a0
		jsr        mt_wind_new
		movea.l    _globl,a0
		jsr        mt_appl_exit
		movea.l    _globl,a0
		jsr        mt_appl_init
		movea.l    ACSblk,a0
		move.w     d0,(a0)
		moveq.l    #32,d0
		jsr        Awi_update
		clr.w      -(a7)
		clr.l      -(a7)
		moveq.l    #14,d1
		clr.w      d0
		jsr        wind_set
		addq.w     #6,a7
		move.l     Aroot_wi,336(a7)
		movea.l    336(a7),a0
		move.w     32(a0),d0
		bne        Ash_prog_33
		movea.l    336(a7),a0
		move.l     20(a0),d0
		beq.s      Ash_prog_34
		clr.w      -(a7)
		movea.l    338(a7),a0
		move.l     20(a0),-(a7)
		moveq.l    #14,d1
		clr.w      d0
		jsr        wind_set
		addq.w     #6,a7
Ash_prog_34:
		movea.l    _globl,a1
		moveq.l    #1,d0
		movea.l    336(a7),a0
		movea.l    94(a0),a0
		jsr        mt_menu_bar
		movea.l    ACSblk,a0
		move.w     14(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     12(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     10(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     8(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     14(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     12(a0),-(a7)
		movea.l    _globl,a0
		movea.l    ACSblk,a1
		move.w     10(a1),d2
		movea.l    ACSblk,a1
		move.w     8(a1),d1
		moveq.l    #3,d0
		jsr        mt_form_dial
		lea.l      12(a7),a7
Ash_prog_33:
		move.w     #$0001,330(a7)
		bra.s      Ash_prog_35
Ash_prog_37:
		move.w     330(a7),d0
		lsl.w      #2,d0
		lea.l      340(a7),a0
		move.l     0(a0,d0.w),336(a7)
		move.l     336(a7),d0
		beq.s      Ash_prog_36
		movea.l    336(a7),a0
		movea.l    336(a7),a1
		movea.l    12(a1),a1
		jsr        (a1)
Ash_prog_36:
		addq.w     #1,330(a7)
Ash_prog_35:
		cmpi.w     #$0080,330(a7)
		blt.s      Ash_prog_37
		move.l     332(a7),d0
		beq.s      Ash_prog_38
		movea.l    332(a7),a0
		movea.l    332(a7),a1
		movea.l    110(a1),a1
		jsr        (a1)
Ash_prog_38:
		lea.l      (a7),a0
		jsr        Act_restore
		bra        Ash_prog_39
Ash_prog_21:
		lea.l      xe0e46,a0
		lea.l      868(a7),a1
		moveq.l    #15,d0
Ash_prog_40:
		move.b     (a0)+,(a1)+
		dbf        d0,Ash_prog_40
		move.w     #$0014,866(a7)
		clr.l      860(a7)
		bra.s      Ash_prog_41
Ash_prog_43:
		moveq.l    #4,d0
		movea.l    860(a7),a0
		and.l      2(a0),d0
		beq.s      Ash_prog_41
		moveq.l    #32,d0
		movea.l    860(a7),a0
		and.w      12(a0),d0
		beq.s      Ash_prog_41
		bra.s      Ash_prog_42
Ash_prog_41:
		movea.l    860(a7),a0
		jsr        Ash_nextdd
		move.l     a0,860(a7)
		bne.s      Ash_prog_43
Ash_prog_42:
		move.l     860(a7),d0
		bne.s      Ash_prog_44
		moveq.l    #-1,d0
		bra        Ash_prog_6
Ash_prog_44:
		movea.l    856(a7),a0
		jsr        strlen
		addq.l     #1,d0
		jsr        Ax_glmalloc
		move.l     a0,exec_path
		bne.s      Ash_prog_45
		moveq.l    #-1,d0
		bra        Ash_prog_6
Ash_prog_45:
		movea.l    856(a7),a1
		movea.l    exec_path,a0
		jsr        strcpy
		move.l     852(a7),d0
		beq.s      Ash_prog_46
		movea.l    852(a7),a0
		jsr        strlen
		jsr        Ax_glmalloc
		move.l     a0,exec_com
		bne.s      Ash_prog_47
		movea.l    exec_path,a0
		jsr        Ax_glfree
		moveq.l    #-1,d0
		bra        Ash_prog_6
Ash_prog_47:
		movea.l    852(a7),a1
		addq.w     #1,a1
		movea.l    exec_com,a0
		jsr        strcpy
Ash_prog_46:
		moveq.l    #16,d0
		jsr        Awi_update
		jsr        Aev_mess
		move.w     #$4722,868(a7)
		movea.l    ACSblk,a0
		move.w     (a0),870(a7)
		move.l     exec_path,d0
		moveq.l    #16,d1
		asr.l      d1,d0
		move.w     d0,874(a7)
		moveq.l    #-1,d0
		and.w      exec_path+2,d0
		move.w     d0,876(a7)
		move.l     exec_com,d0
		moveq.l    #16,d1
		asr.l      d1,d0
		move.w     d0,878(a7)
		moveq.l    #-1,d0
		and.w      exec_com+2,d0
		move.w     d0,880(a7)
		movea.l    _globl,a1
		lea.l      868(a7),a0
		moveq.l    #16,d1
		movea.l    860(a7),a2
		move.w     (a2),d0
		jsr        mt_appl_write
		tst.w      d0
		beq        Ash_prog_48
		bra        Ash_prog_49
Ash_prog_56:
		move.l     _globl,-(a7)
		pea.l      868(a7)
		pea.l      872(a7)
		pea.l      876(a7)
		pea.l      880(a7)
		pea.l      884(a7)
		pea.l      ($000001F4).w
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
		lea.l      914(a7),a1
		lea.l      918(a7),a0
		clr.w      d2
		clr.w      d1
		moveq.l    #48,d0
		jsr        mt_evnt_multi
		lea.l      50(a7),a7
		and.w      #$0010,d0
		beq.s      Ash_prog_50
		cmpi.w     #$0029,868(a7)
		bne.s      Ash_prog_51
		suba.l     a0,a0
		jsr        Aev_GetAcClose
		jsr        Aev_unhidepointer
		clr.l      298(a7)
		bra.s      Ash_prog_52
Ash_prog_51:
		cmpi.w     #$4723,868(a7)
		bne.s      Ash_prog_53
		move.w     874(a7),d0
		bne.s      Ash_prog_54
		moveq.l    #-1,d0
		bra.s      Ash_prog_55
Ash_prog_54:
		moveq.l    #0,d0
Ash_prog_55:
		move.l     d0,298(a7)
		bra.s      Ash_prog_52
		bra.s      Ash_prog_50
Ash_prog_53:
		moveq.l    #32,d0
		jsr        Awi_update
		lea.l      868(a7),a0
		jsr        Aev_message
		moveq.l    #16,d0
		jsr        Awi_update
Ash_prog_50:
		subq.w     #1,866(a7)
Ash_prog_49:
		move.w     866(a7),d0
		bne        Ash_prog_56
Ash_prog_52:
		bra.s      Ash_prog_57
Ash_prog_48:
		move.l     #$FFFFFFFF,298(a7)
Ash_prog_57:
		moveq.l    #32,d0
		jsr        Awi_update
Ash_prog_39:
		jsr        Aev_mess
		jsr        Aev_release
		jsr        Awi_diastart
		move.l     298(a7),d0
Ash_prog_6:
		lea.l      884(a7),a7
		movea.l    (a7)+,a2
		rts

Awi_catch:
		move.l     a2,-(a7)
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		lea.l      xe0e56,a0
		lea.l      (a7),a1
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		movea.l    16(a7),a0
		move.w     34(a0),d0
		and.w      #$2000,d0
		beq.s      Awi_catch_1
		move.l     _globl,-(a7)
		pea.l      10(a7)
		pea.l      12(a7)
		lea.l      14(a7),a1
		lea.l      12(a7),a0
		moveq.l    #11,d0
		jsr        mt_appl_getinfo
		lea.l      12(a7),a7
		tst.w      d0
		beq.s      Awi_catch_2
		moveq.l    #6,d0
		and.w      4(a7),d0
		bne.s      Awi_catch_1
Awi_catch_2:
		movea.l    16(a7),a0
		andi.w     #$DFFF,84(a0)
Awi_catch_1:
		movea.l    16(a7),a0
		move.w     34(a0),d0
		and.w      #$1000,d0
		beq.s      Awi_catch_3
		move.l     _globl,-(a7)
		pea.l      10(a7)
		pea.l      12(a7)
		lea.l      14(a7),a1
		lea.l      12(a7),a0
		moveq.l    #11,d0
		jsr        mt_appl_getinfo
		lea.l      12(a7),a7
		tst.w      d0
		beq.s      Awi_catch_4
		moveq.l    #8,d0
		and.w      4(a7),d0
		bne.s      Awi_catch_3
Awi_catch_4:
		movea.l    16(a7),a0
		andi.w     #$EFFF,84(a0)
Awi_catch_3:
		clr.w      -(a7)
		clr.w      -(a7)
		movea.l    _globl,a0
		clr.w      d2
		clr.w      d1
		movea.l    20(a7),a1
		move.w     34(a1),d0
		jsr        mt_wind_create
		addq.w     #4,a7
		move.w     d0,14(a7)
		cmpi.w     #$0080,14(a7)
		blt.s      Awi_catch_5
		moveq.l    #-1,d0
		bra        Awi_catch_6
Awi_catch_5:
		move.w     14(a7),d0
		bpl        Awi_catch_7
		move.w     cycle,12(a7)
Awi_catch_9:
		moveq.l    #1,d0
		add.w      cycle,d0
		and.w      #$007F,d0
		move.w     d0,cycle
		move.w     cycle,d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		move.l     0(a0,d0.w),8(a7)
		move.w     cycle,d0
		beq.s      Awi_catch_8
		move.l     8(a7),d0
		beq.s      Awi_catch_8
		moveq.l    #4,d0
		movea.l    8(a7),a0
		and.w      84(a0),d0
		bne.s      Awi_catch_8
		movea.l    8(a7),a0
		move.w     86(a0),d0
		and.w      #$0400,d0
		bne.s      Awi_catch_8
		movea.l    8(a7),a0
		jsr        Awi_closed
		suba.l     a1,a1
		moveq.l    #3,d0
		movea.l    8(a7),a0
		movea.l    8(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		clr.w      -(a7)
		clr.w      -(a7)
		movea.l    _globl,a0
		clr.w      d2
		clr.w      d1
		movea.l    20(a7),a1
		move.w     34(a1),d0
		jsr        mt_wind_create
		addq.w     #4,a7
		move.w     d0,14(a7)
		bra.s      Awi_catch_7
Awi_catch_8:
		move.w     12(a7),d0
		cmp.w      cycle,d0
		bne        Awi_catch_9
Awi_catch_7:
		move.w     14(a7),d0
		bmi.s      Awi_catch_10
		cmpi.w     #$0080,14(a7)
		bgt.s      Awi_catch_10
		move.w     14(a7),d0
		bra.s      Awi_catch_6
Awi_catch_10:
		movea.l    _globl,a1
		lea.l      _A_ERR_WINDOW,a0
		moveq.l    #1,d0
		jsr        mt_form_alert
		moveq.l    #-1,d0
Awi_catch_6:
		lea.l      20(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_list
Awi_list:
		subq.w     #6,a7
		clr.w      4(a7)
Awi_list_4:
		move.w     next,d0
		cmp.w      _Wmax_wi,d0
		ble.s      Awi_list_1
		clr.w      next
		move.w     4(a7),d0
		beq.s      Awi_list_2
		suba.l     a0,a0
		bra.s      Awi_list_3
Awi_list_2:
		addq.w     #1,4(a7)
Awi_list_1:
		move.w     next,d0
		lsl.w      #2,d0
		lea.l      _ACSv_winds,a0
		move.l     0(a0,d0.w),(a7)
		addq.w     #1,next
		move.l     (a7),d0
		beq.s      Awi_list_4
		movea.l    (a7),a0
Awi_list_3:
		addq.w     #6,a7
		rts

	.globl Awi_sendall
Awi_sendall:
		move.l     a2,-(a7)
		lea.l      -12(a7),a7
		move.w     d0,10(a7)
		move.l     a0,6(a7)
		move.w     _Wmax_wi,4(a7)
		bra.s      Awi_sendall_1
Awi_sendall_3:
		move.w     4(a7),d0
		lsl.w      #2,d0
		lea.l      _ACSv_winds,a0
		move.l     0(a0,d0.w),(a7)
		beq.s      Awi_sendall_2
		movea.l    6(a7),a1
		move.w     10(a7),d0
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
Awi_sendall_2:
		subq.w     #1,4(a7)
Awi_sendall_1:
		move.w     4(a7),d0
		bpl.s      Awi_sendall_3
		lea.l      12(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_lateupdate
Awi_lateupdate:
		move.l     a2,-(a7)
		subq.w     #6,a7
		move.w     _Wmax_wi,4(a7)
		bra.s      Awi_lateupdate_1
Awi_lateupdate_6:
		move.w     4(a7),d0
		lsl.w      #2,d0
		lea.l      _ACSv_winds,a0
		move.l     0(a0,d0.w),(a7)
		move.l     (a7),d0
		beq.s      Awi_lateupdate_2
		moveq.l    #32,d0
		movea.l    (a7),a0
		and.w      86(a0),d0
		beq.s      Awi_lateupdate_2
		movea.l    (a7),a0
		andi.w     #$FFDF,86(a0)
		movea.l    (a7),a0
		move.w     32(a0),d0
		bmi.s      Awi_lateupdate_3
		movea.l    (a7),a0
		andi.w     #$FFFB,86(a0)
		movea.l    (a7),a0
		movea.l    (a7),a1
		movea.l    16(a1),a1
		jsr        (a1)
		moveq.l    #16,d0
		movea.l    (a7),a0
		and.w      86(a0),d0
		beq.s      Awi_lateupdate_4
		movea.l    (a7),a1
		lea.l      36(a1),a1
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    134(a2),a2
		jsr        (a2)
Awi_lateupdate_4:
		bra.s      Awi_lateupdate_5
Awi_lateupdate_3:
		movea.l    (a7),a0
		ori.w      #$0004,86(a0)
Awi_lateupdate_5:
		jsr        Ax_release
Awi_lateupdate_2:
		subq.w     #1,4(a7)
Awi_lateupdate_1:
		move.w     4(a7),d0
		bpl.s      Awi_lateupdate_6
		addq.w     #6,a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_up
Awi_up:
		subq.w     #8,a7
		move.w     cycle,6(a7)
Awi_up_3:
		moveq.l    #1,d0
		add.w      cycle,d0
		and.w      #$007F,d0
		move.w     d0,cycle
		move.w     cycle,d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		move.l     0(a0,d0.w),(a7)
		move.w     cycle,d0
		beq.s      Awi_up_1
		move.l     (a7),d0
		beq.s      Awi_up_1
		clr.l      -(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		pea.l      16(a7)
		moveq.l    #10,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    (a7),a0
		move.w     32(a0),d0
		cmp.w      4(a7),d0
		beq.s      Awi_up_1
		movea.l    (a7),a0
		movea.l    (a7),a1
		movea.l    110(a1),a1
		jsr        (a1)
		bra.s      Awi_up_2
Awi_up_1:
		move.w     6(a7),d0
		cmp.w      cycle,d0
		bne.s      Awi_up_3
Awi_up_2:
		addq.w     #8,a7
		rts

	.globl Awi_down
Awi_down:
		subq.w     #8,a7
		move.w     cycle,6(a7)
Awi_down_3:
		moveq.l    #-1,d0
		add.w      cycle,d0
		and.w      #$007F,d0
		move.w     d0,cycle
		move.w     cycle,d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		move.l     0(a0,d0.w),(a7)
		move.w     cycle,d0
		beq.s      Awi_down_1
		move.l     (a7),d0
		beq.s      Awi_down_1
		clr.l      -(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		pea.l      16(a7)
		moveq.l    #10,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    (a7),a0
		move.w     32(a0),d0
		cmp.w      4(a7),d0
		beq.s      Awi_down_1
		movea.l    (a7),a0
		movea.l    (a7),a1
		movea.l    110(a1),a1
		jsr        (a1)
		bra.s      Awi_down_2
Awi_down_1:
		move.w     6(a7),d0
		cmp.w      cycle,d0
		bne.s      Awi_down_3
Awi_down_2:
		addq.w     #8,a7
		rts

	.globl Awi_show
Awi_show:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.w     32(a0),d0
		ble.s      Awi_show_1
		movea.l    (a7),a0
		movea.l    (a7),a1
		movea.l    110(a1),a1
		jsr        (a1)
		bra.s      Awi_show_2
Awi_show_1:
		movea.l    (a7),a0
		movea.l    (a7),a1
		movea.l    12(a1),a1
		jsr        (a1)
Awi_show_2:
		movea.l    (a7),a0
		bsr        Awi_setontop
		addq.w     #4,a7
		rts

	.globl Awi_selfcreate
Awi_selfcreate:
		subq.w     #4,a7
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Awi_selfcreate_1
		movea.l    (a7),a0
		jsr        Awi_create
		bra.s      Awi_selfcreate_2
Awi_selfcreate_1:
		suba.l     a0,a0
Awi_selfcreate_2:
		addq.w     #4,a7
		rts

MakeModernMenu:
		move.l     a2,-(a7)
		lea.l      -48(a7),a7
		move.l     a0,40(a7)
		move.l     40(a7),36(a7)
		move.w     #$0001,4(a7)
		cmpi.w     #$FFFF,box_trans
		bne.s      MakeModernMenu_1
		move.l     _globl,-(a7)
		pea.l      50(a7)
		pea.l      54(a7)
		lea.l      58(a7),a1
		lea.l      56(a7),a0
		moveq.l    #13,d0
		jsr        mt_appl_getinfo
		lea.l      12(a7),a7
		tst.w      d0
		beq.s      MakeModernMenu_2
		moveq.l    #1,d0
		and.w      44(a7),d0
		beq.s      MakeModernMenu_3
		moveq.l    #1,d0
		bra.s      MakeModernMenu_4
MakeModernMenu_3:
		clr.w      d0
MakeModernMenu_4:
		move.w     d0,box_trans
		bra.s      MakeModernMenu_1
MakeModernMenu_2:
		clr.w      box_trans
MakeModernMenu_1:
		move.w     box_trans,d0
		beq.s      MakeModernMenu_5
		movea.l    36(a7),a0
		cmpi.w     #$0014,6(a0)
		bne.s      MakeModernMenu_5
		movea.l    36(a7),a0
		andi.w     #$FFF0,14(a0)
		ori.w      #$0008,14(a0)
		movea.l    36(a7),a0
		andi.w     #$FF8F,14(a0)
		ori.w      #$0070,14(a0)
		movea.l    36(a7),a0
		andi.w     #$FF7F,14(a0)
		ori.w      #$0080,14(a0)
		movea.l    36(a7),a0
		ori.w      #$0400,8(a0)
MakeModernMenu_5:
		moveq.l    #8,d0
		movea.l    36(a7),a0
		and.w      10(a0),d0
		beq        MakeModernMenu_6
		movea.l    36(a7),a0
		cmpi.w     #$001C,6(a0)
		bne        MakeModernMenu_6
		movea.l    36(a7),a0
		move.l     12(a0),32(a7)
		movea.l    32(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      MakeModernMenu_7
		clr.w      6(a7)
		bra.s      MakeModernMenu_8
MakeModernMenu_7:
		move.w     #$0001,6(a7)
		bra.s      MakeModernMenu_9
MakeModernMenu_12:
		movea.l    32(a7),a0
		cmpi.b     #$2D,(a0)
		bne.s      MakeModernMenu_10
		moveq.l    #1,d0
		bra.s      MakeModernMenu_11
MakeModernMenu_10:
		clr.w      d0
MakeModernMenu_11:
		move.w     d0,6(a7)
		addq.l     #1,32(a7)
MakeModernMenu_9:
		move.w     6(a7),d0
		beq.s      MakeModernMenu_8
		movea.l    32(a7),a0
		move.b     (a0),d0
		bne.s      MakeModernMenu_12
MakeModernMenu_8:
		move.w     6(a7),d0
		beq        MakeModernMenu_6
		movea.l    ACSblk,a0
		cmpi.w     #$0010,26(a0)
		blt.s      MakeModernMenu_13
		lea.l      dis_arrow_col,a0
		jsr        Aus_create
		move.l     a0,(a7)
		bra.s      MakeModernMenu_14
MakeModernMenu_13:
		lea.l      dis_arrow_mon,a0
		jsr        Aus_create
		move.l     a0,(a7)
MakeModernMenu_14:
		move.l     (a7),d0
		beq.w      MakeModernMenu_6
		moveq.l    #24,d0
		movea.l    36(a7),a1
		lea.l      8(a7),a0
		jsr        memcpy
		movea.l    36(a7),a0
		move.w     #$0018,6(a0)
		movea.l    36(a7),a0
		move.l     (a7),12(a0)
		movea.l    (a7),a0
		move.l     8(a0),d0
		beq.s      MakeModernMenu_15
		lea.l      4(a7),a1
		moveq.l    #1,d0
		movea.l    36(a7),a0
		movea.l    (a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		bra.s      MakeModernMenu_16
MakeModernMenu_15:
		move.w     #$0001,4(a7)
MakeModernMenu_16:
		cmpi.w     #$FFFF,4(a7)
		beq.s      MakeModernMenu_17
		move.w     18(a7),d0
		and.w      #$2000,d0
		bne.s      MakeModernMenu_18
		movea.l    20(a7),a0
		jsr        Ast_delete
MakeModernMenu_18:
		bra.s      MakeModernMenu_6
MakeModernMenu_17:
		movea.l    (a7),a0
		jsr        Aus_delete
		moveq.l    #24,d0
		lea.l      8(a7),a1
		movea.l    36(a7),a0
		jsr        memcpy
MakeModernMenu_6:
		moveq.l    #8,d0
		movea.l    36(a7),a0
		and.w      10(a0),d0
		beq.s      MakeModernMenu_19
		movea.l    36(a7),a0
		cmpi.w     #$0018,6(a0)
		bne.s      MakeModernMenu_19
		movea.l    36(a7),a0
		movea.l    12(a0),a0
		movea.l    (a0),a0
		cmpa.l     #A_arrows,a0
		bne.s      MakeModernMenu_19
		movea.l    36(a7),a0
		movea.l    12(a0),a0
		cmpi.l     #$22090001,4(a0)
		bne.s      MakeModernMenu_19
		movea.l    ACSblk,a0
		cmpi.w     #$0010,26(a0)
		blt.s      MakeModernMenu_19
		movea.l    36(a7),a0
		movea.l    12(a0),a0
		move.l     #$22010009,4(a0)
MakeModernMenu_19:
		moveq.l    #32,d0
		movea.l    36(a7),a0
		addi.l     #$00000018,36(a7)
		and.w      8(a0),d0
		beq        MakeModernMenu_1
		lea.l      48(a7),a7
		movea.l    (a7)+,a2
		rts

MakeOldMenu:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		bsr        Awi_root
		move.l     a0,(a7)
		move.l     8(a7),4(a7)
		bra        MakeOldMenu_1
MakeOldMenu_6:
		movea.l    4(a7),a0
		cmpi.w     #$0014,6(a0)
		bne.s      MakeOldMenu_2
		move.l     (a7),d0
		beq.s      MakeOldMenu_3
		movea.l    (a7),a0
		movea.l    94(a0),a0
		cmpa.l     8(a7),a0
		beq.s      MakeOldMenu_4
MakeOldMenu_3:
		movea.l    4(a7),a0
		andi.w     #$FFF0,14(a0)
		movea.l    4(a7),a0
		andi.w     #$FF8F,14(a0)
		ori.w      #$0070,14(a0)
		movea.l    4(a7),a0
		andi.w     #$FF7F,14(a0)
MakeOldMenu_4:
		movea.l    4(a7),a0
		andi.w     #$FBFF,8(a0)
MakeOldMenu_2:
		moveq.l    #8,d0
		movea.l    4(a7),a0
		and.w      10(a0),d0
		beq.s      MakeOldMenu_5
		movea.l    4(a7),a0
		cmpi.w     #$0018,6(a0)
		bne.s      MakeOldMenu_5
		movea.l    4(a7),a0
		movea.l    12(a0),a0
		movea.l    (a0),a0
		cmpa.l     #A_arrows,a0
		bne.s      MakeOldMenu_5
		movea.l    4(a7),a0
		movea.l    12(a0),a0
		move.l     #$22090001,4(a0)
MakeOldMenu_5:
		addi.l     #$00000018,4(a7)
MakeOldMenu_1:
		moveq.l    #32,d0
		movea.l    4(a7),a0
		and.w      8(a0),d0
		beq        MakeOldMenu_6
		lea.l      12(a7),a7
		rts

	.globl Awi_layout
Awi_layout:
		move.l     a2,-(a7)
		lea.l      -16(a7),a7
		move.w     d0,14(a7)
		move.w     d1,12(a7)
		move.w     d2,10(a7)
		cmpi.w     #$FFFF,14(a7)
		ble.s      Awi_layout_1
		move.w     14(a7),d0
		beq.s      Awi_layout_2
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		andi.w     #$FEFF,14(a0)
		bra.s      Awi_layout_1
Awi_layout_2:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		ori.w      #$0100,14(a0)
Awi_layout_1:
		cmpi.w     #$FFFF,12(a7)
		ble.s      Awi_layout_3
		move.w     12(a7),d0
		beq.s      Awi_layout_4
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		andi.w     #$EFFF,14(a0)
		bra.s      Awi_layout_3
Awi_layout_4:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		ori.w      #$1000,14(a0)
Awi_layout_3:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$1000,d0
		beq.s      Awi_layout_5
		moveq.l    #1,d0
		bra.s      Awi_layout_6
Awi_layout_5:
		clr.w      d0
Awi_layout_6:
		move.w     d0,2(a7)
		clr.w      4(a7)
		bra.s      Awi_layout_7
Awi_layout_11:
		move.w     4(a7),d0
		lsl.w      #2,d0
		lea.l      _ACSv_winds,a0
		move.l     0(a0,d0.w),6(a7)
		move.l     6(a7),d0
		beq.s      Awi_layout_8
		movea.l    6(a7),a0
		move.l     94(a0),d0
		beq.s      Awi_layout_8
		move.w     #$0001,(a7)
		lea.l      (a7),a1
		moveq.l    #53,d0
		movea.l    6(a7),a0
		movea.l    6(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		tst.w      d0
		beq.s      Awi_layout_9
		move.w     (a7),d0
		beq.s      Awi_layout_8
Awi_layout_9:
		move.w     2(a7),d0
		beq.s      Awi_layout_10
		movea.l    6(a7),a0
		movea.l    94(a0),a0
		bsr        MakeOldMenu
		bra.s      Awi_layout_8
Awi_layout_10:
		movea.l    6(a7),a0
		movea.l    94(a0),a0
		bsr        MakeModernMenu
Awi_layout_8:
		addq.w     #1,4(a7)
Awi_layout_7:
		cmpi.w     #$0100,4(a7)
		blt.s      Awi_layout_11
		move.w     10(a7),d0
		beq.s      Awi_layout_12
		movea.l    ACSblk,a0
		addq.w     #8,a0
		moveq.l    #-1,d1
		movea.l    ACSblk,a1
		move.w     (a1),d0
		jsr        Aev_WmRedraw
Awi_layout_12:
		lea.l      16(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_create
Awi_create:
		move.l     a2,-(a7)
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.l     #$000000A2,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     #$000000A2,d0
		movea.l    6(a7),a1
		movea.l    (a7),a0
		jsr        memcpy
		movea.l    (a7),a0
		move.l     20(a0),d0
		beq.s      Awi_create_1
		movea.l    (a7),a0
		movea.l    20(a0),a0
		jsr        Aob_create
		movea.l    (a7),a1
		move.l     a0,20(a1)
		movea.l    (a7),a0
		move.l     20(a0),d0
		bne.s      Awi_create_2
		move.l     #$000000A2,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		suba.l     a0,a0
		bra        Awi_create_3
Awi_create_2:
		movea.l    (a7),a0
		movea.l    20(a0),a0
		jsr        Aob_fix
Awi_create_1:
		movea.l    (a7),a0
		move.l     24(a0),d0
		beq.s      Awi_create_4
		movea.l    (a7),a0
		movea.l    24(a0),a0
		jsr        Aob_create
		movea.l    (a7),a1
		move.l     a0,24(a1)
		movea.l    (a7),a0
		move.l     24(a0),d0
		bne.s      Awi_create_5
		movea.l    (a7),a0
		movea.l    20(a0),a0
		jsr        Aob_delete
		move.l     #$000000A2,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		suba.l     a0,a0
		bra        Awi_create_3
Awi_create_5:
		movea.l    (a7),a0
		movea.l    24(a0),a0
		jsr        Aob_fix
Awi_create_4:
		movea.l    (a7),a0
		move.l     94(a0),d0
		beq        Awi_create_6
		movea.l    (a7),a0
		movea.l    94(a0),a0
		jsr        Aob_create
		movea.l    (a7),a1
		move.l     a0,94(a1)
		movea.l    (a7),a0
		move.l     94(a0),d0
		bne.s      Awi_create_7
		movea.l    (a7),a0
		movea.l    24(a0),a0
		jsr        Aob_delete
		movea.l    (a7),a0
		movea.l    20(a0),a0
		jsr        Aob_delete
		move.l     #$000000A2,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		suba.l     a0,a0
		bra        Awi_create_3
Awi_create_7:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$1000,d0
		beq.s      Awi_create_8
		movea.l    (a7),a0
		movea.l    94(a0),a0
		bsr        MakeOldMenu
		bra.s      Awi_create_9
Awi_create_8:
		movea.l    (a7),a0
		movea.l    94(a0),a0
		bsr        MakeModernMenu
Awi_create_9:
		movea.l    (a7),a0
		movea.l    94(a0),a0
		jsr        Aob_fix
		movea.l    (a7),a0
		movea.l    94(a0),a0
		jsr        Ame_namefix
Awi_create_6:
		movea.l    (a7),a0
		move.l     90(a0),d0
		beq.s      Awi_create_10
		movea.l    (a7),a0
		movea.l    90(a0),a0
		jsr        Aic_create
		movea.l    (a7),a1
		move.l     a0,90(a1)
		movea.l    (a7),a0
		move.l     90(a0),d0
		bne.s      Awi_create_10
		movea.l    (a7),a0
		movea.l    94(a0),a0
		jsr        Aob_delete
		movea.l    (a7),a0
		movea.l    24(a0),a0
		jsr        Aob_delete
		movea.l    (a7),a0
		movea.l    20(a0),a0
		jsr        Aob_delete
		move.l     #$000000A2,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		suba.l     a0,a0
		bra        Awi_create_3
Awi_create_10:
		movea.l    (a7),a0
		jsr        Awi_uoself
		movea.l    (a7),a0
		move.l     74(a0),d0
		beq.s      Awi_create_11
		movea.l    (a7),a0
		movea.l    74(a0),a0
		jsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,74(a1)
Awi_create_11:
		movea.l    (a7),a0
		move.l     78(a0),d0
		beq.s      Awi_create_12
		movea.l    (a7),a0
		movea.l    78(a0),a0
		jsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,78(a1)
Awi_create_12:
		movea.l    (a7),a0
		move.l     154(a0),d0
		beq.s      Awi_create_13
		movea.l    (a7),a0
		movea.l    154(a0),a0
		jsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,154(a1)
Awi_create_13:
		movea.l    (a7),a0
		move.l     158(a0),d0
		beq.s      Awi_create_14
		movea.l    (a7),a0
		movea.l    158(a0),a0
		jsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,158(a1)
Awi_create_14:
		movea.l    (a7),a0
		move.w     #$0004,86(a0)
		movea.l    (a7),a0
		move.w     #$FFFF,88(a0)
		movea.l    (a7),a0
		move.w     #$FFFF,28(a0)
		movea.l    (a7),a0
		clr.w      82(a0)
		clr.w      4(a7)
		bra        Awi_create_15
Awi_create_19:
		move.w     4(a7),d0
		lsl.w      #2,d0
		lea.l      _ACSv_winds,a0
		move.l     0(a0,d0.w),d0
		bne        Awi_create_16
		move.w     4(a7),d0
		cmp.w      _Wmax_wi,d0
		ble.s      Awi_create_17
		move.w     4(a7),_Wmax_wi
Awi_create_17:
		move.w     4(a7),d0
		lsl.w      #2,d0
		lea.l      _ACSv_winds,a0
		move.l     (a7),0(a0,d0.w)
		move.l     Aroot_wi,d0
		beq.s      Awi_create_18
		moveq.l    #1,d0
		movea.l    (a7),a0
		and.w      84(a0),d0
		beq.s      Awi_create_18
		movea.l    (a7),a1
		moveq.l    #100,d0
		movea.l    Aroot_wi,a0
		movea.l    Aroot_wi,a2
		movea.l    4(a2),a2
		jsr        (a2)
Awi_create_18:
		movea.l    (a7),a0
		move.w     36(a0),d0
		movea.l    ACSblk,a0
		muls.w     18(a0),d0
		movea.l    (a7),a0
		move.w     d0,36(a0)
		movea.l    (a7),a0
		move.w     38(a0),d0
		movea.l    ACSblk,a0
		muls.w     20(a0),d0
		movea.l    (a7),a0
		move.w     d0,38(a0)
		movea.l    (a7),a0
		move.w     40(a0),d0
		movea.l    ACSblk,a0
		muls.w     18(a0),d0
		movea.l    (a7),a0
		move.w     d0,40(a0)
		movea.l    (a7),a0
		move.w     42(a0),d0
		movea.l    ACSblk,a0
		muls.w     20(a0),d0
		movea.l    (a7),a0
		move.w     d0,42(a0)
		movea.l    (a7),a0
		bra.s      Awi_create_3
Awi_create_16:
		addq.w     #1,4(a7)
Awi_create_15:
		cmpi.w     #$0100,4(a7)
		blt        Awi_create_19
		movea.l    _globl,a1
		lea.l      _A_ERR_WISLOT,a0
		moveq.l    #1,d0
		jsr        mt_form_alert
		suba.l     a0,a0
Awi_create_3:
		lea.l      10(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_slider
Awi_slider:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		movea.l    6(a7),a0
		move.w     32(a0),(a7)
		move.w     (a7),d0
		bmi        Awi_slider_1
		movea.l    6(a7),a0
		lea.l      60(a0),a0
		move.l     a0,2(a7)
		movea.l    6(a7),a0
		move.w     34(a0),d0
		and.w      #$0800,d0
		beq.s      Awi_slider_2
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		movea.l    8(a7),a0
		move.w     (a0),-(a7)
		moveq.l    #8,d1
		move.w     8(a7),d0
		jsr        wind_set
		addq.w     #8,a7
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		movea.l    8(a7),a0
		move.w     4(a0),-(a7)
		moveq.l    #15,d1
		move.w     8(a7),d0
		jsr        wind_set
		addq.w     #8,a7
Awi_slider_2:
		movea.l    6(a7),a0
		move.w     34(a0),d0
		and.w      #$0100,d0
		beq.s      Awi_slider_1
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		movea.l    8(a7),a0
		move.w     2(a0),-(a7)
		moveq.l    #9,d1
		move.w     8(a7),d0
		jsr        wind_set
		addq.w     #8,a7
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		movea.l    8(a7),a0
		move.w     6(a0),-(a7)
		moveq.l    #16,d1
		move.w     8(a7),d0
		jsr        wind_set
		addq.w     #8,a7
Awi_slider_1:
		lea.l      10(a7),a7
		rts

	.globl Awi_open
Awi_open:
		move.l     a2,-(a7)
		lea.l      -50(a7),a7
		move.l     a0,30(a7)
		lea.l      xe0ea2,a0
		lea.l      16(a7),a1
		move.l     (a0)+,(a1)+
		move.l     (a0)+,(a1)+
		movea.l    30(a7),a0
		move.w     32(a0),d0
		bmi.s      Awi_open_1
		clr.w      d0
		bra        Awi_open_2
Awi_open_1:
		moveq.l    #4,d0
		movea.l    30(a7),a0
		and.w      86(a0),d0
		beq.s      Awi_open_3
		movea.l    30(a7),a0
		andi.w     #$FFFB,86(a0)
		movea.l    30(a7),a0
		movea.l    30(a7),a1
		movea.l    16(a1),a1
		jsr        (a1)
		tst.w      d0
		beq.s      Awi_open_3
		moveq.l    #-1,d0
		bra        Awi_open_2
Awi_open_3:
		movea.l    30(a7),a0
		andi.w     #$F7FF,86(a0)
		movea.l    30(a7),a0
		bsr        Awi_catch
		move.w     d0,28(a7)
		move.w     28(a7),d0
		bpl.s      Awi_open_4
		moveq.l    #-1,d0
		bra        Awi_open_2
Awi_open_4:
		movea.l    30(a7),a0
		move.l     20(a0),d0
		bne.s      Awi_open_5
		lea.l      empty,a0
		jsr        Aob_create
		movea.l    30(a7),a1
		move.l     a0,20(a1)
Awi_open_5:
		movea.l    30(a7),a0
		move.w     28(a7),32(a0)
		move.w     28(a7),d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		move.l     30(a7),0(a0,d0.w)
		movea.l    30(a7),a0
		move.w     84(a0),d0
		and.w      #$0100,d0
		beq.s      Awi_open_6
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		moveq.l    #1,d0
		move.w     d0,-(a7)
		moveq.l    #24,d1
		move.w     36(a7),d0
		jsr        wind_set
		addq.w     #8,a7
Awi_open_6:
		clr.w      -(a7)
		clr.w      -(a7)
		movea.l    34(a7),a0
		move.l     74(a0),-(a7)
		moveq.l    #2,d1
		move.w     36(a7),d0
		jsr        wind_set
		addq.w     #8,a7
		clr.w      -(a7)
		clr.w      -(a7)
		movea.l    34(a7),a0
		move.l     78(a0),-(a7)
		moveq.l    #3,d1
		move.w     36(a7),d0
		jsr        wind_set
		addq.w     #8,a7
		movea.l    30(a7),a0
		move.w     38(a0),d0
		bne        Awi_open_7
		moveq.l    #16,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq        Awi_open_8
		movea.l    30(a7),a0
		move.l     20(a0),d0
		beq        Awi_open_8
		move.l     _globl,-(a7)
		pea.l      18(a7)
		pea.l      20(a7)
		pea.l      22(a7)
		lea.l      24(a7),a1
		movea.l    46(a7),a0
		movea.l    20(a0),a0
		jsr        mt_form_center
		lea.l      16(a7),a7
		clr.w      d0
		movea.l    30(a7),a0
		movea.l    20(a0),a0
		move.w     d0,18(a0)
		movea.l    30(a7),a0
		movea.l    20(a0),a0
		move.w     d0,16(a0)
		movea.l    30(a7),a0
		move.l     24(a0),d0
		beq.s      Awi_open_9
		movea.l    30(a7),a0
		movea.l    24(a0),a0
		move.w     22(a0),d0
		sub.w      d0,10(a7)
Awi_open_9:
		move.l     _globl,-(a7)
		pea.l      30(a7)
		pea.l      34(a7)
		move.w     26(a7),-(a7)
		move.w     26(a7),-(a7)
		move.w     26(a7),-(a7)
		movea.l    48(a7),a1
		lea.l      38(a1),a1
		movea.l    48(a7),a0
		lea.l      36(a0),a0
		move.w     26(a7),d2
		movea.l    48(a7),a2
		move.w     34(a2),d1
		clr.w      d0
		jsr        mt_wind_calc
		lea.l      18(a7),a7
		bra.s      Awi_open_7
Awi_open_8:
		moveq.l    #8,d0
		add.w      28(a7),d0
		lsl.w      #3,d0
		movea.l    30(a7),a0
		move.w     d0,36(a0)
		moveq.l    #3,d0
		add.w      28(a7),d0
		lsl.w      #3,d0
		movea.l    30(a7),a0
		move.w     d0,38(a0)
		suba.l     a1,a1
		moveq.l    #14,d0
		movea.l    30(a7),a0
		movea.l    30(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
Awi_open_7:
		movea.l    30(a7),a0
		jsr        Awi_oblist
		movea.l    30(a7),a0
		bsr        Awi_slider
		movea.l    30(a7),a0
		move.w     88(a0),24(a7)
		move.w     24(a7),d0
		bmi        Awi_open_10
		move.l     Aroot_wi,d0
		beq        Awi_open_10
		moveq.l    #2,d0
		movea.l    30(a7),a0
		and.w      84(a0),d0
		beq.s      Awi_open_11
		movea.l    30(a7),a1
		lea.l      88(a1),a1
		moveq.l    #102,d0
		movea.l    Aroot_wi,a0
		movea.l    Aroot_wi,a2
		movea.l    4(a2),a2
		jsr        (a2)
		bra.s      Awi_open_12
Awi_open_11:
		movea.l    30(a7),a1
		lea.l      88(a1),a1
		moveq.l    #101,d0
		movea.l    Aroot_wi,a0
		movea.l    Aroot_wi,a2
		movea.l    4(a2),a2
		jsr        (a2)
Awi_open_12:
		movea.l    Aroot_wi,a0
		move.l     20(a0),d0
		beq.s      Awi_open_10
		movea.l    30(a7),a0
		move.w     88(a0),d0
		movea.l    Aroot_wi,a0
		movea.l    20(a0),a1
		lea.l      16(a7),a0
		jsr        Aob_offset
		movea.l    Aroot_wi,a0
		move.w     52(a0),d0
		add.w      d0,16(a7)
		movea.l    Aroot_wi,a0
		move.w     54(a0),d0
		add.w      d0,18(a7)
Awi_open_10:
		move.w     16(a7),d0
		bpl.s      Awi_open_13
		clr.w      d0
		move.w     d0,18(a7)
		move.w     d0,16(a7)
		moveq.l    #48,d0
		move.w     d0,22(a7)
		move.w     d0,20(a7)
Awi_open_13:
		jsr        Awi_diaend
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      Awi_open_14
		movea.l    30(a7),a0
		move.w     42(a0),-(a7)
		movea.l    32(a7),a0
		move.w     40(a0),-(a7)
		movea.l    34(a7),a0
		move.w     38(a0),-(a7)
		movea.l    36(a7),a0
		move.w     36(a0),-(a7)
		move.w     30(a7),-(a7)
		movea.l    _globl,a0
		move.w     30(a7),d2
		move.w     28(a7),d1
		move.w     26(a7),d0
		jsr        mt_graf_growbox
		lea.l      10(a7),a7
Awi_open_14:
		movea.l    30(a7),a0
		move.w     42(a0),-(a7)
		movea.l    32(a7),a0
		move.w     40(a0),-(a7)
		movea.l    _globl,a0
		movea.l    34(a7),a1
		move.w     38(a1),d2
		movea.l    34(a7),a1
		move.w     36(a1),d1
		move.w     32(a7),d0
		jsr        mt_wind_open
		addq.w     #4,a7
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0300,(a0)
		ble.s      Awi_open_15
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0400,(a0)
		bge.s      Awi_open_15
		movea.l    30(a7),a0
		bsr        Awi_slider
Awi_open_15:
		movea.l    30(a7),a0
		bsr        Awi_setontop
		clr.l      (a7)
		bra.s      Awi_open_16
Awi_open_19:
		moveq.l    #4,d0
		movea.l    (a7),a0
		and.l      2(a0),d0
		beq.s      Awi_open_16
		lea.l      xe0eaa,a0
		lea.l      34(a7),a1
		moveq.l    #15,d0
Awi_open_17:
		move.b     (a0)+,(a1)+
		dbf        d0,Awi_open_17
		move.w     #$4724,34(a7)
		movea.l    ACSblk,a0
		move.w     (a0),36(a7)
		move.w     28(a7),40(a7)
		movea.l    _globl,a1
		lea.l      34(a7),a0
		moveq.l    #16,d1
		movea.l    (a7),a2
		move.w     (a2),d0
		jsr        mt_appl_write
		bra.s      Awi_open_18
Awi_open_16:
		movea.l    (a7),a0
		jsr        Ash_nextdd
		move.l     a0,(a7)
		bne.s      Awi_open_19
Awi_open_18:
		movea.l    30(a7),a0
		move.l     20(a0),4(a7)
		jsr        Aev_mess
		movea.l    30(a7),a0
		move.w     28(a0),d0
		bpl.s      Awi_open_20
		moveq.l    #8,d1
		moveq.l    #-1,d0
		movea.l    4(a7),a0
		jsr        Aob_findflag
		movea.l    30(a7),a0
		move.w     d0,28(a0)
		movea.l    30(a7),a0
		move.w     28(a0),d0
		bpl.s      Awi_open_21
		movea.l    30(a7),a0
		move.l     24(a0),d0
		beq.s      Awi_open_21
		moveq.l    #8,d1
		moveq.l    #-1,d0
		movea.l    30(a7),a0
		movea.l    24(a0),a0
		jsr        Aob_findflag
		or.w       #$1000,d0
		movea.l    30(a7),a0
		move.w     d0,28(a0)
Awi_open_21:
		movea.l    30(a7),a0
		move.w     28(a0),d0
		ble.s      Awi_open_20
		movea.l    30(a7),a0
		move.w     #$FFFF,30(a0)
Awi_open_20:
		jsr        Awi_diastart
		clr.w      d0
Awi_open_2:
		lea.l      50(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_register
Awi_register:
		move.l     a2,-(a7)
		lea.l      -36(a7),a7
		move.l     a0,16(a7)
		lea.l      xe0eba,a0
		lea.l      4(a7),a1
		move.l     (a0)+,(a1)+
		move.l     (a0)+,(a1)+
		movea.l    16(a7),a0
		move.w     32(a0),d0
		bpl.s      Awi_register_1
		moveq.l    #-1,d0
		bra        Awi_register_2
Awi_register_1:
		moveq.l    #4,d0
		movea.l    16(a7),a0
		and.w      86(a0),d0
		beq.s      Awi_register_3
		movea.l    16(a7),a0
		andi.w     #$FFFB,86(a0)
		movea.l    16(a7),a0
		movea.l    16(a7),a1
		movea.l    16(a1),a1
		jsr        (a1)
		tst.w      d0
		beq.s      Awi_register_3
		moveq.l    #-1,d0
		bra        Awi_register_2
Awi_register_3:
		movea.l    16(a7),a0
		andi.w     #$F7FF,86(a0)
		movea.l    16(a7),a0
		move.l     20(a0),d0
		bne.s      Awi_register_4
		lea.l      empty,a0
		jsr        Aob_create
		movea.l    16(a7),a1
		move.l     a0,20(a1)
Awi_register_4:
		movea.l    16(a7),a0
		move.w     32(a0),14(a7)
		move.w     14(a7),d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		move.l     16(a7),0(a0,d0.w)
		movea.l    16(a7),a0
		move.w     84(a0),d0
		and.w      #$0100,d0
		beq.s      Awi_register_5
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		moveq.l    #1,d0
		move.w     d0,-(a7)
		moveq.l    #24,d1
		move.w     22(a7),d0
		jsr        wind_set
		addq.w     #8,a7
Awi_register_5:
		clr.w      -(a7)
		clr.w      -(a7)
		movea.l    20(a7),a0
		move.l     74(a0),-(a7)
		moveq.l    #2,d1
		move.w     22(a7),d0
		jsr        wind_set
		addq.w     #8,a7
		clr.w      -(a7)
		clr.w      -(a7)
		movea.l    20(a7),a0
		move.l     78(a0),-(a7)
		moveq.l    #3,d1
		move.w     22(a7),d0
		jsr        wind_set
		addq.w     #8,a7
		movea.l    16(a7),a0
		move.w     88(a0),12(a7)
		move.w     12(a7),d0
		bmi        Awi_register_6
		move.l     Aroot_wi,d0
		beq        Awi_register_6
		moveq.l    #2,d0
		movea.l    16(a7),a0
		and.w      84(a0),d0
		beq.s      Awi_register_7
		movea.l    16(a7),a1
		lea.l      88(a1),a1
		moveq.l    #102,d0
		movea.l    Aroot_wi,a0
		movea.l    Aroot_wi,a2
		movea.l    4(a2),a2
		jsr        (a2)
		bra.s      Awi_register_8
Awi_register_7:
		movea.l    16(a7),a1
		lea.l      88(a1),a1
		moveq.l    #101,d0
		movea.l    Aroot_wi,a0
		movea.l    Aroot_wi,a2
		movea.l    4(a2),a2
		jsr        (a2)
Awi_register_8:
		movea.l    Aroot_wi,a0
		move.l     20(a0),d0
		beq.s      Awi_register_6
		movea.l    16(a7),a0
		move.w     88(a0),d0
		movea.l    Aroot_wi,a0
		movea.l    20(a0),a1
		lea.l      4(a7),a0
		jsr        Aob_offset
		movea.l    Aroot_wi,a0
		move.w     52(a0),d0
		add.w      d0,4(a7)
		movea.l    Aroot_wi,a0
		move.w     54(a0),d0
		add.w      d0,6(a7)
Awi_register_6:
		move.w     4(a7),d0
		bpl.s      Awi_register_9
		clr.w      d0
		move.w     d0,6(a7)
		move.w     d0,4(a7)
		moveq.l    #48,d0
		move.w     d0,10(a7)
		move.w     d0,8(a7)
Awi_register_9:
		jsr        Awi_diaend
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      Awi_register_10
		movea.l    16(a7),a0
		move.w     42(a0),-(a7)
		movea.l    18(a7),a0
		move.w     40(a0),-(a7)
		movea.l    20(a7),a0
		move.w     38(a0),-(a7)
		movea.l    22(a7),a0
		move.w     36(a0),-(a7)
		move.w     18(a7),-(a7)
		movea.l    _globl,a0
		move.w     18(a7),d2
		move.w     16(a7),d1
		move.w     14(a7),d0
		jsr        mt_graf_growbox
		lea.l      10(a7),a7
Awi_register_10:
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0300,(a0)
		ble.s      Awi_register_11
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0400,(a0)
		bge.s      Awi_register_11
		movea.l    16(a7),a0
		bsr        Awi_slider
Awi_register_11:
		movea.l    16(a7),a0
		bsr        Awi_setontop
		clr.l      (a7)
		bra.s      Awi_register_12
Awi_register_15:
		moveq.l    #4,d0
		movea.l    (a7),a0
		and.l      2(a0),d0
		beq.s      Awi_register_12
		lea.l      xe0ec2,a0
		lea.l      20(a7),a1
		moveq.l    #15,d0
Awi_register_13:
		move.b     (a0)+,(a1)+
		dbf        d0,Awi_register_13
		move.w     #$4724,20(a7)
		movea.l    ACSblk,a0
		move.w     (a0),22(a7)
		move.w     14(a7),26(a7)
		movea.l    _globl,a1
		lea.l      20(a7),a0
		moveq.l    #16,d1
		movea.l    (a7),a2
		move.w     (a2),d0
		jsr        mt_appl_write
		bra.s      Awi_register_14
Awi_register_12:
		movea.l    (a7),a0
		jsr        Ash_nextdd
		move.l     a0,(a7)
		bne.s      Awi_register_15
Awi_register_14:
		jsr        Aev_mess
		clr.w      d0
Awi_register_2:
		lea.l      36(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_backdrop
Awi_backdrop:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.w     32(a0),d0
		bgt.s      Awi_backdrop_1
		clr.w      d0
		bra.s      Awi_backdrop_2
Awi_backdrop_1:
		movea.l    (a7),a0
		move.w     86(a0),d0
		and.w      #$0400,d0
		beq.s      Awi_backdrop_3
		bra.s      Awi_backdrop_4
Awi_backdrop_3:
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		moveq.l    #25,d1
		movea.l    8(a7),a0
		move.w     32(a0),d0
		jsr        wind_set
		addq.w     #8,a7
Awi_backdrop_4:
		clr.w      d0
Awi_backdrop_2:
		addq.w     #4,a7
		rts

	.globl Awi_modal
Awi_modal:
		subq.w     #2,a7
		move.w     #$0007,(a7)
		bra.s      Awi_modal_1
Awi_modal_4:
		move.w     (a7),d0
		lsl.w      #2,d0
		lea.l      modwins,a0
		move.l     0(a0,d0.w),d0
		beq.s      Awi_modal_2
		move.w     (a7),d0
		lsl.w      #2,d0
		lea.l      modwins,a0
		movea.l    0(a0,d0.w),a0
		bra.s      Awi_modal_3
Awi_modal_2:
		subq.w     #1,(a7)
Awi_modal_1:
		move.w     (a7),d0
		bpl.s      Awi_modal_4
		suba.l     a0,a0
Awi_modal_3:
		addq.w     #2,a7
		rts

	.globl Awi_up_modal
Awi_up_modal:
		move.l     a2,-(a7)
		subq.w     #6,a7
		bsr.w      Awi_modal
		move.l     a0,2(a7)
		move.l     2(a7),d0
		bne.s      Awi_up_modal_1
		bra        Awi_up_modal_2
Awi_up_modal_1:
		clr.l      -(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		pea.l      12(a7)
		moveq.l    #10,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    2(a7),a0
		move.w     32(a0),d0
		cmp.w      (a7),d0
		beq.s      Awi_up_modal_3
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		moveq.l    #10,d1
		movea.l    10(a7),a0
		move.w     32(a0),d0
		jsr        wind_set
		addq.w     #8,a7
		movea.l    2(a7),a0
		ori.w      #$0010,86(a0)
		movea.l    2(a7),a1
		lea.l      36(a1),a1
		movea.l    2(a7),a0
		movea.l    2(a7),a2
		movea.l    134(a2),a2
		jsr        (a2)
		movea.l    2(a7),a0
		bsr        Awi_setontop
		bra        Awi_up_modal_2
Awi_up_modal_3:
		moveq.l    #16,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		bne        Awi_up_modal_4
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    2(a7),a0
		lea.l      52(a0),a0
		jsr        Aob_within
		tst.w      d0
		bne        Awi_up_modal_5
		movea.l    ACSblk,a0
		move.w     12(a0),d0
		movea.l    2(a7),a0
		sub.w      40(a0),d0
		movea.l    ACSblk,a0
		move.w     610(a0),d1
		movea.l    2(a7),a0
		move.w     40(a0),d2
		asr.w      #1,d2
		sub.w      d2,d1
		cmp.w      d1,d0
		bge.s      Awi_up_modal_6
		movea.l    ACSblk,a0
		move.w     12(a0),d0
		movea.l    2(a7),a0
		sub.w      40(a0),d0
		bra.s      Awi_up_modal_7
Awi_up_modal_6:
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    2(a7),a0
		move.w     40(a0),d1
		asr.w      #1,d1
		sub.w      d1,d0
Awi_up_modal_7:
		movea.l    2(a7),a0
		move.w     d0,36(a0)
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		movea.l    ACSblk,a0
		add.w      14(a0),d0
		movea.l    2(a7),a0
		sub.w      42(a0),d0
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    2(a7),a0
		move.w     42(a0),d2
		asr.w      #1,d2
		sub.w      d2,d1
		cmp.w      d1,d0
		bge.s      Awi_up_modal_8
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		movea.l    ACSblk,a0
		add.w      14(a0),d0
		movea.l    2(a7),a0
		sub.w      42(a0),d0
		bra.s      Awi_up_modal_9
Awi_up_modal_8:
		movea.l    ACSblk,a0
		move.w     612(a0),d0
		movea.l    2(a7),a0
		move.w     42(a0),d1
		asr.w      #1,d1
		sub.w      d1,d0
Awi_up_modal_9:
		movea.l    2(a7),a0
		move.w     d0,38(a0)
		movea.l    ACSblk,a0
		move.w     8(a0),d0
		movea.l    2(a7),a0
		cmp.w      36(a0),d0
		ble.s      Awi_up_modal_10
		movea.l    ACSblk,a0
		move.w     8(a0),d0
		bra.s      Awi_up_modal_11
Awi_up_modal_10:
		movea.l    2(a7),a0
		move.w     36(a0),d0
Awi_up_modal_11:
		movea.l    2(a7),a0
		move.w     d0,36(a0)
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		movea.l    2(a7),a0
		cmp.w      38(a0),d0
		ble.s      Awi_up_modal_12
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		bra.s      Awi_up_modal_13
Awi_up_modal_12:
		movea.l    2(a7),a0
		move.w     38(a0),d0
Awi_up_modal_13:
		movea.l    2(a7),a0
		move.w     d0,38(a0)
		movea.l    2(a7),a0
		andi.w     #$FFFE,86(a0)
		movea.l    2(a7),a0
		jsr        Awi_cleanup
		movea.l    2(a7),a0
		move.w     42(a0),-(a7)
		movea.l    4(a7),a0
		move.w     40(a0),-(a7)
		movea.l    6(a7),a0
		move.w     38(a0),-(a7)
		movea.l    8(a7),a0
		move.w     36(a0),-(a7)
		moveq.l    #5,d1
		movea.l    10(a7),a0
		move.w     32(a0),d0
		jsr        wind_set
		addq.w     #8,a7
Awi_up_modal_5:
		bra.s      Awi_up_modal_2
Awi_up_modal_4:
		moveq.l    #4,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      Awi_up_modal_2
		moveq.l    #7,d1
		moveq.l    #2,d0
		jsr        Bconout
Awi_up_modal_2:
		addq.w     #6,a7
		movea.l    (a7)+,a2
		rts

Awi_set_modal:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.w     4(a7),d0
		beq        Awi_set_modal_1
		clr.w      2(a7)
		bra.s      Awi_set_modal_2
Awi_set_modal_5:
		move.w     2(a7),d0
		lsl.w      #2,d0
		lea.l      modwins,a0
		move.l     0(a0,d0.w),d0
		bne.s      Awi_set_modal_3
		move.w     2(a7),d0
		lsl.w      #2,d0
		lea.l      modwins,a0
		move.l     6(a7),0(a0,d0.w)
		bra.s      Awi_set_modal_4
Awi_set_modal_3:
		addq.w     #1,2(a7)
Awi_set_modal_2:
		cmpi.w     #$0008,2(a7)
		blt.s      Awi_set_modal_5
Awi_set_modal_4:
		cmpi.w     #$0008,2(a7)
		bne.s      Awi_set_modal_6
		moveq.l    #-1,d0
		bra        Awi_set_modal_7
Awi_set_modal_6:
		move.w     2(a7),d0
		bne.s      Awi_set_modal_8
		clr.w      d0
		jsr        Awi_show_menu
Awi_set_modal_8:
		clr.l      -(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		pea.l      12(a7)
		moveq.l    #10,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    6(a7),a0
		move.w     32(a0),d0
		ble.s      Awi_set_modal_9
		movea.l    6(a7),a0
		move.w     (a7),d0
		cmp.w      32(a0),d0
		beq.s      Awi_set_modal_9
		movea.l    6(a7),a0
		movea.l    6(a7),a1
		movea.l    110(a1),a1
		jsr        (a1)
Awi_set_modal_9:
		movea.l    6(a7),a0
		bsr        Awi_setontop
		bra.s      Awi_set_modal_10
Awi_set_modal_1:
		movea.l    6(a7),a0
		move.w     86(a0),d0
		and.w      #$0400,d0
		bne.s      Awi_set_modal_11
		clr.w      d0
		bra.s      Awi_set_modal_7
Awi_set_modal_11:
		move.w     #$0007,2(a7)
		bra.s      Awi_set_modal_12
Awi_set_modal_15:
		move.w     2(a7),d0
		lsl.w      #2,d0
		lea.l      modwins,a0
		movea.l    0(a0,d0.w),a0
		cmpa.l     6(a7),a0
		bne.s      Awi_set_modal_13
		move.w     2(a7),d0
		lsl.w      #2,d0
		lea.l      modwins,a0
		clr.l      0(a0,d0.w)
		bra.s      Awi_set_modal_14
Awi_set_modal_13:
		subq.w     #1,2(a7)
Awi_set_modal_12:
		move.w     2(a7),d0
		bpl.s      Awi_set_modal_15
Awi_set_modal_14:
		move.w     2(a7),d0
		bne.s      Awi_set_modal_10
		moveq.l    #1,d0
		jsr        Awi_show_menu
Awi_set_modal_10:
		clr.w      d0
Awi_set_modal_7:
		lea.l      10(a7),a7
		rts

	.globl Awi_show_menu
Awi_show_menu:
		move.l     d3,-(a7)
		move.l     d4,-(a7)
		subq.w     #8,a7
		move.w     d0,6(a7)
		move.w     _ACSv_wmenu,d0
		beq.s      Awi_show_menu_1
		move.l     Aroot_wi,d0
		beq.s      Awi_show_menu_1
		movea.l    Aroot_wi,a0
		move.l     94(a0),d0
		bne.s      Awi_show_menu_2
Awi_show_menu_1:
		bra        Awi_show_menu_3
Awi_show_menu_2:
		movea.l    Aroot_wi,a0
		move.l     94(a0),(a7)
		move.w     6(a7),d0
		beq        Awi_show_menu_4
		bsr        Awi_modal
		move.l     a0,d0
		bne.s      Awi_show_menu_5
		jsr        A_isModDia
		tst.w      d0
		beq.s      Awi_show_menu_6
Awi_show_menu_5:
		bra        Awi_show_menu_3
Awi_show_menu_6:
		movea.l    _globl,a1
		clr.w      d0
		suba.l     a0,a0
		jsr        mt_menu_bar
		movea.l    (a7),a0
		move.w     2(a0),d4
		ext.l      d4
		move.l     d4,d3
		add.l      d3,d3
		add.l      d4,d3
		lsl.l      #3,d3
		movea.l    (a7),a0
		move.w     0(a0,d3.l),d3
		ext.l      d3
		move.l     d3,d2
		add.l      d2,d2
		add.l      d3,d2
		lsl.l      #3,d2
		movea.l    (a7),a0
		move.w     2(a0,d2.l),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    (a7),a0
		move.w     2(a0,d1.l),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a7),a0
		andi.w     #$FFF7,10(a0,d0.l)
		movea.l    (a7),a0
		move.w     50(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a7),a0
		move.w     0(a0,d0.l),4(a7)
		bra.s      Awi_show_menu_7
Awi_show_menu_8:
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a7),a0
		andi.w     #$FFF7,10(a0,d0.l)
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a7),a0
		move.w     0(a0,d0.l),4(a7)
Awi_show_menu_7:
		cmpi.w     #$0002,4(a7)
		bne.s      Awi_show_menu_8
		movea.l    (a7),a0
		move.w     menu_width,68(a0)
		movea.l    _globl,a1
		moveq.l    #1,d0
		movea.l    (a7),a0
		jsr        mt_menu_bar
		bra        Awi_show_menu_3
Awi_show_menu_4:
		bsr        Awi_modal
		move.l     a0,d0
		bne.s      Awi_show_menu_9
		jsr        A_isModDia
		tst.w      d0
		bne.s      Awi_show_menu_9
		bra        Awi_show_menu_3
Awi_show_menu_9:
		movea.l    _globl,a1
		clr.w      d0
		suba.l     a0,a0
		jsr        mt_menu_bar
		movea.l    (a7),a0
		move.w     2(a0),d4
		ext.l      d4
		move.l     d4,d3
		add.l      d3,d3
		add.l      d4,d3
		lsl.l      #3,d3
		movea.l    (a7),a0
		move.w     0(a0,d3.l),d3
		ext.l      d3
		move.l     d3,d2
		add.l      d2,d2
		add.l      d3,d2
		lsl.l      #3,d2
		movea.l    (a7),a0
		move.w     2(a0,d2.l),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    (a7),a0
		move.w     2(a0,d1.l),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a7),a0
		ori.w      #$0008,10(a0,d0.l)
		movea.l    (a7),a0
		move.w     2(a0),d4
		ext.l      d4
		move.l     d4,d3
		add.l      d3,d3
		add.l      d4,d3
		lsl.l      #3,d3
		movea.l    (a7),a0
		move.w     0(a0,d3.l),d3
		ext.l      d3
		move.l     d3,d2
		add.l      d2,d2
		add.l      d3,d2
		lsl.l      #3,d2
		movea.l    (a7),a0
		move.w     2(a0,d2.l),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    (a7),a0
		move.w     2(a0,d1.l),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a7),a0
		andi.w     #$FFFE,10(a0,d0.l)
		movea.l    (a7),a0
		movea.l    (a7),a1
		move.w     92(a0),68(a1)
		movea.l    (a7),a0
		move.w     50(a0),4(a7)
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a7),a0
		andi.w     #$FFFE,10(a0,d0.l)
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a7),a0
		move.w     0(a0,d0.l),4(a7)
		bra.s      Awi_show_menu_10
Awi_show_menu_11:
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a7),a0
		ori.w      #$0008,10(a0,d0.l)
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a7),a0
		move.w     0(a0,d0.l),4(a7)
Awi_show_menu_10:
		cmpi.w     #$0002,4(a7)
		bne.s      Awi_show_menu_11
		movea.l    _globl,a1
		moveq.l    #1,d0
		movea.l    (a7),a0
		jsr        mt_menu_bar
Awi_show_menu_3:
		addq.w     #8,a7
		move.l     (a7)+,d4
		move.l     (a7)+,d3
		rts

Awi_ropen:
		move.l     d3,-(a7)
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		movea.l    8(a7),a0
		move.l     94(a0),4(a7)
		move.l     8(a7),gemmap
		movea.l    8(a7),a0
		clr.w      32(a0)
		move.l     4(a7),d0
		beq        Awi_ropen_1
		movea.l    ACSblk,a0
		lea.l      543(a0),a0
		jsr        Ast_create
		movea.l    4(a7),a1
		move.w     2(a1),d3
		ext.l      d3
		move.l     d3,d2
		add.l      d2,d2
		add.l      d3,d2
		lsl.l      #3,d2
		movea.l    4(a7),a1
		move.w     2(a1,d2.l),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    4(a7),a1
		move.w     2(a1,d1.l),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a1
		move.l     a0,12(a1,d0.l)
		movea.l    4(a7),a0
		jsr        Ame_namefix
		movea.l    _globl,a1
		moveq.l    #1,d0
		movea.l    4(a7),a0
		jsr        mt_menu_bar
		movea.l    4(a7),a0
		move.w     68(a0),menu_width
		move.w     #$0001,_ACSv_wmenu
Awi_ropen_1:
		moveq.l    #4,d0
		movea.l    8(a7),a0
		and.w      86(a0),d0
		beq.s      Awi_ropen_2
		movea.l    8(a7),a0
		andi.w     #$FFFB,86(a0)
		movea.l    8(a7),a0
		movea.l    8(a7),a1
		movea.l    16(a1),a1
		jsr        (a1)
		tst.w      d0
		beq.s      Awi_ropen_2
		moveq.l    #-1,d0
		bra        Awi_ropen_3
Awi_ropen_2:
		movea.l    8(a7),a0
		move.l     20(a0),(a7)
		move.l     (a7),d0
		beq        Awi_ropen_4
		movea.l    ACSblk,a0
		movea.l    (a7),a1
		move.w     8(a0),16(a1)
		movea.l    ACSblk,a0
		movea.l    (a7),a1
		move.w     10(a0),18(a1)
		movea.l    ACSblk,a0
		movea.l    (a7),a1
		move.w     12(a0),20(a1)
		movea.l    ACSblk,a0
		movea.l    (a7),a1
		move.w     14(a0),22(a1)
		clr.w      -(a7)
		clr.w      -(a7)
		move.l     4(a7),-(a7)
		moveq.l    #14,d1
		clr.w      d0
		jsr        wind_set
		addq.w     #8,a7
		movea.l    ACSblk,a0
		move.w     14(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     12(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     10(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     8(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     14(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     12(a0),-(a7)
		movea.l    _globl,a0
		movea.l    ACSblk,a1
		move.w     10(a1),d2
		movea.l    ACSblk,a1
		move.w     8(a1),d1
		moveq.l    #3,d0
		jsr        mt_form_dial
		lea.l      12(a7),a7
		move.w     #$0001,_ACSv_wwork
Awi_ropen_4:
		movea.l    8(a7),a0
		clr.w      52(a0)
		movea.l    8(a7),a0
		clr.w      54(a0)
		movea.l    ACSblk,a0
		move.w     8(a0),d0
		movea.l    ACSblk,a0
		add.w      12(a0),d0
		movea.l    8(a7),a0
		move.w     d0,56(a0)
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		movea.l    ACSblk,a0
		add.w      14(a0),d0
		movea.l    8(a7),a0
		move.w     d0,58(a0)
		clr.w      d0
Awi_ropen_3:
		lea.l      12(a7),a7
		move.l     (a7)+,d3
		rts

	.globl Awi_closed
Awi_closed:
		move.l     a2,-(a7)
		lea.l      -34(a7),a7
		move.l     a0,14(a7)
		bsr        Awi_modal
		move.l     a0,d0
		beq.s      Awi_closed_1
		bsr        Awi_modal
		movea.l    14(a7),a1
		cmpa.l     a0,a1
		beq.s      Awi_closed_1
		bra        Awi_closed_2
Awi_closed_1:
		movea.l    14(a7),a0
		move.w     32(a0),12(a7)
		movea.l    14(a7),a0
		move.w     #$FFFF,32(a0)
		moveq.l    #2,d0
		movea.l    14(a7),a0
		and.w      86(a0),d0
		beq.s      Awi_closed_3
		jsr        Awi_diaend
Awi_closed_3:
		moveq.l    #-1,d0
		movea.l    14(a7),a0
		move.w     d0,82(a0)
		movea.l    14(a7),a0
		move.w     d0,30(a0)
		movea.l    14(a7),a0
		move.w     d0,28(a0)
		movea.l    ACSblk,a0
		movea.l    576(a0),a0
		cmpa.l     14(a7),a0
		bne.s      Awi_closed_4
		jsr        Adr_unselect
Awi_closed_4:
		move.w     12(a7),d0
		bne.s      Awi_closed_5
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		moveq.l    #14,d1
		clr.w      d0
		jsr        wind_set
		addq.w     #8,a7
		movea.l    _globl,a1
		clr.w      d0
		suba.l     a0,a0
		jsr        mt_menu_bar
		bra        Awi_closed_6
Awi_closed_5:
		movea.l    14(a7),a0
		move.w     86(a0),d0
		and.w      #$0500,d0
		bne.s      Awi_closed_7
		move.l     Aroot_wi,d0
		beq.s      Awi_closed_7
		movea.l    14(a7),a0
		move.w     88(a0),d0
		bmi.s      Awi_closed_8
		movea.l    14(a7),a1
		lea.l      88(a1),a1
		moveq.l    #103,d0
		movea.l    Aroot_wi,a0
		movea.l    Aroot_wi,a2
		movea.l    4(a2),a2
		jsr        (a2)
		bra.s      Awi_closed_7
Awi_closed_8:
		movea.l    14(a7),a1
		moveq.l    #100,d0
		movea.l    Aroot_wi,a0
		movea.l    Aroot_wi,a2
		movea.l    4(a2),a2
		jsr        (a2)
Awi_closed_7:
		move.w     12(a7),d0
		ble        Awi_closed_6
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq        Awi_closed_9
		movea.l    14(a7),a0
		move.w     88(a0),d0
		bmi.s      Awi_closed_10
		move.l     Aroot_wi,d0
		beq.s      Awi_closed_10
		movea.l    Aroot_wi,a0
		move.l     20(a0),d0
		beq.s      Awi_closed_10
		movea.l    14(a7),a0
		move.w     88(a0),d0
		movea.l    Aroot_wi,a0
		movea.l    20(a0),a1
		lea.l      4(a7),a0
		jsr        Aob_offset
		movea.l    Aroot_wi,a0
		move.w     52(a0),d0
		add.w      d0,4(a7)
		movea.l    Aroot_wi,a0
		move.w     54(a0),d0
		add.w      d0,6(a7)
		bra.s      Awi_closed_11
Awi_closed_10:
		clr.w      d0
		move.w     d0,6(a7)
		move.w     d0,4(a7)
		moveq.l    #48,d0
		move.w     d0,10(a7)
		move.w     d0,8(a7)
Awi_closed_11:
		movea.l    14(a7),a0
		move.w     42(a0),-(a7)
		movea.l    16(a7),a0
		move.w     40(a0),-(a7)
		movea.l    18(a7),a0
		move.w     38(a0),-(a7)
		movea.l    20(a7),a0
		move.w     36(a0),-(a7)
		move.w     18(a7),-(a7)
		movea.l    _globl,a0
		move.w     18(a7),d2
		move.w     16(a7),d1
		move.w     14(a7),d0
		jsr        mt_graf_shrinkbox
		lea.l      10(a7),a7
Awi_closed_9:
		movea.l    _globl,a0
		move.w     12(a7),d0
		jsr        mt_wind_close
		bsr        Awi_ontop
		cmpa.l     14(a7),a0
		bne.s      Awi_closed_12
		suba.l     a0,a0
		bsr        Awi_setontop
Awi_closed_12:
		movea.l    _globl,a0
		move.w     12(a7),d0
		jsr        mt_wind_delete
		clr.w      d0
		movea.l    14(a7),a0
		bsr        Awi_set_modal
		clr.l      (a7)
		bra.s      Awi_closed_13
Awi_closed_16:
		moveq.l    #4,d0
		movea.l    (a7),a0
		and.l      2(a0),d0
		beq.s      Awi_closed_13
		lea.l      xe0ed2,a0
		lea.l      18(a7),a1
		moveq.l    #15,d0
Awi_closed_14:
		move.b     (a0)+,(a1)+
		dbf        d0,Awi_closed_14
		move.w     #$4726,18(a7)
		movea.l    ACSblk,a0
		move.w     (a0),20(a7)
		move.w     12(a7),24(a7)
		movea.l    _globl,a1
		lea.l      18(a7),a0
		moveq.l    #16,d1
		movea.l    (a7),a2
		move.w     (a2),d0
		jsr        mt_appl_write
		bra.s      Awi_closed_15
Awi_closed_13:
		movea.l    (a7),a0
		jsr        Ash_nextdd
		move.l     a0,(a7)
		bne.s      Awi_closed_16
Awi_closed_15:
		jsr        Aev_mess
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      56(a0),a0
		jsr        Amo_new
Awi_closed_6:
		move.w     12(a7),d0
		bmi.s      Awi_closed_2
		move.w     12(a7),d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		clr.l      0(a0,d0.w)
Awi_closed_2:
		lea.l      34(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_delete
Awi_delete:
		move.l     a2,-(a7)
		subq.w     #6,a7
		move.l     a0,2(a7)
		movea.l    2(a7),a0
		ori.w      #$0100,86(a0)
		movea.l    ACSblk,a0
		movea.l    576(a0),a0
		cmpa.l     2(a7),a0
		bne.s      Awi_delete_1
		movea.l    ACSblk,a0
		clr.w      582(a0)
Awi_delete_1:
		movea.l    2(a7),a0
		jsr        CheckPcHelp
		movea.l    2(a7),a0
		jsr        CheckSTGuide
		movea.l    2(a7),a0
		bsr        Awi_icondelete
		move.w     #$0064,(a7)
		bra.s      Awi_delete_2
Awi_delete_4:
		movea.l    2(a7),a0
		movea.l    2(a7),a1
		movea.l    114(a1),a1
		jsr        (a1)
		subq.w     #1,(a7)
Awi_delete_2:
		movea.l    2(a7),a0
		move.w     32(a0),d0
		bmi.s      Awi_delete_3
		move.w     (a7),d0
		bgt.s      Awi_delete_4
Awi_delete_3:
		move.w     (a7),d0
		bgt.s      Awi_delete_5
		movea.l    2(a7),a0
		andi.w     #$F7FF,86(a0)
		movea.l    2(a7),a0
		bsr        Awi_closed
Awi_delete_5:
		movea.l    2(a7),a0
		move.w     88(a0),d0
		bmi.s      Awi_delete_6
		move.l     Aroot_wi,d0
		beq.s      Awi_delete_6
		movea.l    2(a7),a1
		lea.l      88(a1),a1
		moveq.l    #101,d0
		movea.l    Aroot_wi,a0
		movea.l    Aroot_wi,a2
		movea.l    4(a2),a2
		jsr        (a2)
Awi_delete_6:
		movea.l    2(a7),a0
		movea.l    158(a0),a0
		jsr        Ast_delete
		movea.l    2(a7),a0
		movea.l    154(a0),a0
		jsr        Ast_delete
		movea.l    2(a7),a0
		movea.l    78(a0),a0
		jsr        Ast_delete
		movea.l    2(a7),a0
		movea.l    74(a0),a0
		jsr        Ast_delete
		movea.l    2(a7),a0
		movea.l    90(a0),a0
		jsr        Aic_delete
		movea.l    2(a7),a0
		movea.l    94(a0),a0
		jsr        Aob_delete
		movea.l    2(a7),a0
		movea.l    24(a0),a0
		jsr        Aob_delete
		movea.l    2(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_delete
		movea.l    2(a7),a0
		cmpa.l     Aroot_wi,a0
		bne.s      Awi_delete_7
		clr.l      Aroot_wi
		jsr        Aev_quit
Awi_delete_7:
		clr.w      (a7)
		bra.s      Awi_delete_8
Awi_delete_13:
		move.w     (a7),d0
		lsl.w      #2,d0
		lea.l      _ACSv_winds,a0
		movea.l    0(a0,d0.w),a0
		cmpa.l     2(a7),a0
		bne.s      Awi_delete_9
		move.w     (a7),d0
		lsl.w      #2,d0
		lea.l      _ACSv_winds,a0
		clr.l      0(a0,d0.w)
		move.w     (a7),d0
		cmp.w      _Wmax_wi,d0
		bne.s      Awi_delete_10
		nop
Awi_delete_11:
		move.w     _Wmax_wi,d0
		subq.w     #1,_Wmax_wi
		tst.w      d0
		ble.s      Awi_delete_10
		move.w     _Wmax_wi,d0
		lsl.w      #2,d0
		lea.l      _ACSv_winds,a0
		move.l     0(a0,d0.w),d0
		beq.s      Awi_delete_11
Awi_delete_10:
		move.l     #$000000A2,d0
		movea.l    2(a7),a0
		jsr        Ax_recycle
		bra.s      Awi_delete_12
Awi_delete_9:
		addq.w     #1,(a7)
Awi_delete_8:
		move.w     (a7),d0
		cmp.w      _Wmax_wi,d0
		ble.s      Awi_delete_13
Awi_delete_12:
		addq.w     #6,a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_topped
Awi_topped:
		subq.w     #6,a7
		move.l     a0,2(a7)
		movea.l    2(a7),a0
		move.w     32(a0),(a7)
		move.w     (a7),d0
		ble.s      Awi_topped_1
		bsr        Awi_modal
		move.l     a0,d0
		beq.s      Awi_topped_2
		bsr        Awi_up_modal
		bra.s      Awi_topped_1
Awi_topped_2:
		jsr        Awi_diaend
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		moveq.l    #10,d1
		move.w     8(a7),d0
		jsr        wind_set
		addq.w     #8,a7
		movea.l    2(a7),a0
		bsr        Awi_setontop
Awi_topped_1:
		addq.w     #6,a7
		rts

	.globl Awi_fulled
Awi_fulled:
		move.l     a2,-(a7)
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		movea.l    22(a7),a0
		move.w     32(a0),d0
		bgt.s      Awi_fulled_1
		bra        Awi_fulled_2
Awi_fulled_1:
		movea.l    22(a7),a0
		move.l     20(a0),4(a7)
		movea.l    22(a7),a0
		lea.l      36(a0),a0
		move.l     a0,12(a7)
		movea.l    22(a7),a0
		lea.l      44(a0),a0
		move.l     a0,8(a7)
		moveq.l    #1,d0
		movea.l    22(a7),a0
		and.w      86(a0),d0
		beq        Awi_fulled_3
		movea.l    8(a7),a0
		movea.l    12(a7),a1
		move.w     (a0),(a1)
		movea.l    8(a7),a0
		movea.l    12(a7),a1
		move.w     2(a0),2(a1)
		movea.l    8(a7),a0
		movea.l    12(a7),a1
		move.w     4(a0),4(a1)
		movea.l    8(a7),a0
		movea.l    12(a7),a1
		move.w     6(a0),6(a1)
		movea.l    4(a7),a0
		move.w     16(a0),d0
		movea.l    22(a7),a0
		cmp.w      68(a0),d0
		bne.s      Awi_fulled_4
		movea.l    4(a7),a0
		move.w     18(a0),d0
		movea.l    22(a7),a0
		cmp.w      70(a0),d0
		beq.s      Awi_fulled_5
Awi_fulled_4:
		movea.l    22(a7),a0
		ori.w      #$0010,86(a0)
Awi_fulled_5:
		movea.l    22(a7),a0
		movea.l    4(a7),a1
		move.w     68(a0),16(a1)
		movea.l    22(a7),a0
		movea.l    4(a7),a1
		move.w     70(a0),18(a1)
		bra        Awi_fulled_6
Awi_fulled_3:
		movea.l    12(a7),a0
		movea.l    8(a7),a1
		move.w     (a0),(a1)
		movea.l    12(a7),a0
		movea.l    8(a7),a1
		move.w     2(a0),2(a1)
		movea.l    12(a7),a0
		movea.l    8(a7),a1
		move.w     4(a0),4(a1)
		movea.l    12(a7),a0
		movea.l    8(a7),a1
		move.w     6(a0),6(a1)
		moveq.l    #8,d0
		movea.l    22(a7),a0
		and.w      84(a0),d0
		beq.s      Awi_fulled_7
		movea.l    ACSblk,a0
		movea.l    12(a7),a1
		move.w     8(a0),(a1)
		movea.l    ACSblk,a0
		movea.l    12(a7),a1
		move.w     10(a0),2(a1)
		movea.l    ACSblk,a0
		movea.l    12(a7),a1
		move.w     12(a0),4(a1)
		movea.l    ACSblk,a0
		movea.l    12(a7),a1
		move.w     14(a0),6(a1)
		bra        Awi_fulled_8
Awi_fulled_7:
		movea.l    22(a7),a0
		move.w     72(a0),d0
		or.w       #$FF00,d0
		move.w     d0,18(a7)
		movea.l    22(a7),a0
		move.w     72(a0),d0
		asr.w      #8,d0
		move.w     d0,16(a7)
		move.w     18(a7),d0
		not.w      d0
		movea.l    4(a7),a0
		add.w      d0,20(a0)
		move.w     18(a7),d0
		movea.l    4(a7),a0
		and.w      d0,20(a0)
		move.w     16(a7),d0
		not.w      d0
		movea.l    4(a7),a0
		add.w      d0,22(a0)
		move.w     16(a7),d0
		movea.l    4(a7),a0
		and.w      d0,22(a0)
		move.l     _globl,-(a7)
		movea.l    16(a7),a0
		pea.l      6(a0)
		movea.l    20(a7),a0
		pea.l      4(a0)
		movea.l    16(a7),a0
		move.w     22(a0),-(a7)
		movea.l    18(a7),a0
		move.w     20(a0),-(a7)
		clr.w      -(a7)
		lea.l      38(a7),a1
		lea.l      38(a7),a0
		clr.w      d2
		movea.l    40(a7),a2
		move.w     34(a2),d1
		clr.w      d0
		jsr        mt_wind_calc
		lea.l      18(a7),a7
		movea.l    12(a7),a0
		move.w     (a0),d0
		movea.l    12(a7),a0
		add.w      4(a0),d0
		movea.l    ACSblk,a0
		move.w     8(a0),d1
		movea.l    ACSblk,a0
		add.w      12(a0),d1
		cmp.w      d1,d0
		ble.s      Awi_fulled_9
		movea.l    ACSblk,a0
		movea.l    12(a7),a1
		move.w     8(a0),(a1)
Awi_fulled_9:
		movea.l    22(a7),a0
		move.l     94(a0),(a7)
		beq.s      Awi_fulled_10
		movea.l    (a7),a0
		move.w     2(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a7),a0
		move.w     22(a0,d0.l),d0
		movea.l    12(a7),a0
		add.w      d0,6(a0)
Awi_fulled_10:
		movea.l    22(a7),a0
		move.l     24(a0),d0
		beq.s      Awi_fulled_11
		movea.l    22(a7),a0
		movea.l    24(a0),a0
		move.w     22(a0),d0
		movea.l    12(a7),a0
		add.w      d0,6(a0)
Awi_fulled_11:
		movea.l    12(a7),a0
		move.w     2(a0),d0
		movea.l    12(a7),a0
		add.w      6(a0),d0
		movea.l    ACSblk,a0
		move.w     10(a0),d1
		movea.l    ACSblk,a0
		add.w      14(a0),d1
		cmp.w      d1,d0
		ble.s      Awi_fulled_8
		movea.l    ACSblk,a0
		movea.l    12(a7),a1
		move.w     10(a0),2(a1)
Awi_fulled_8:
		movea.l    4(a7),a0
		movea.l    22(a7),a1
		move.w     16(a0),68(a1)
		movea.l    4(a7),a0
		movea.l    22(a7),a1
		move.w     18(a0),70(a1)
		movea.l    4(a7),a0
		move.w     16(a0),d0
		bne.s      Awi_fulled_12
		movea.l    4(a7),a0
		move.w     18(a0),d0
		beq.s      Awi_fulled_13
Awi_fulled_12:
		movea.l    22(a7),a0
		ori.w      #$0010,86(a0)
Awi_fulled_13:
		movea.l    4(a7),a0
		clr.w      16(a0)
		movea.l    4(a7),a0
		clr.w      18(a0)
Awi_fulled_6:
		movea.l    22(a7),a0
		eori.w     #$0001,86(a0)
		movea.l    22(a7),a0
		jsr        Awi_oblist
		movea.l    12(a7),a0
		move.w     6(a0),-(a7)
		movea.l    14(a7),a0
		move.w     4(a0),-(a7)
		movea.l    16(a7),a0
		move.w     2(a0),-(a7)
		movea.l    18(a7),a0
		move.w     (a0),-(a7)
		moveq.l    #5,d1
		movea.l    30(a7),a0
		move.w     32(a0),d0
		jsr        wind_set
		addq.w     #8,a7
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0300,(a0)
		ble.s      Awi_fulled_14
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0400,(a0)
		bge.s      Awi_fulled_14
		movea.l    22(a7),a0
		bsr        Awi_slider
Awi_fulled_14:
		moveq.l    #16,d0
		movea.l    22(a7),a0
		and.w      86(a0),d0
		beq.s      Awi_fulled_15
		moveq.l    #64,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      Awi_fulled_15
		movea.l    12(a7),a0
		movea.l    22(a7),a1
		move.w     32(a1),d1
		movea.l    ACSblk,a1
		move.w     (a1),d0
		jsr        Aev_WmRedraw
Awi_fulled_15:
		jsr        Aev_mess
		moveq.l    #16,d0
		movea.l    22(a7),a0
		and.w      86(a0),d0
		beq.s      Awi_fulled_2
		movea.l    22(a7),a0
		andi.w     #$FFFD,86(a0)
		movea.l    22(a7),a1
		lea.l      36(a1),a1
		movea.l    22(a7),a0
		movea.l    22(a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
		jsr        Awi_diastart
Awi_fulled_2:
		lea.l      26(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_sized
Awi_sized:
		move.l     a2,-(a7)
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		movea.l    12(a7),a0
		move.w     32(a0),d0
		bgt.s      Awi_sized_1
		bra        Awi_sized_2
Awi_sized_1:
		movea.l    12(a7),a0
		andi.w     #$FFFE,86(a0)
		movea.l    12(a7),a0
		lea.l      36(a0),a0
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.w     4(a0),2(a7)
		movea.l    4(a7),a0
		move.w     6(a0),(a7)
		movea.l    8(a7),a0
		movea.l    4(a7),a1
		move.w     (a0),(a1)
		movea.l    8(a7),a0
		movea.l    4(a7),a1
		move.w     2(a0),2(a1)
		movea.l    8(a7),a0
		move.w     wi_minw,d0
		cmp.w      4(a0),d0
		ble.s      Awi_sized_3
		move.w     wi_minw,d0
		bra.s      Awi_sized_4
Awi_sized_3:
		movea.l    8(a7),a0
		move.w     4(a0),d0
Awi_sized_4:
		movea.l    4(a7),a0
		move.w     d0,4(a0)
		movea.l    8(a7),a0
		move.w     wi_minh,d0
		cmp.w      6(a0),d0
		ble.s      Awi_sized_5
		move.w     wi_minh,d0
		bra.s      Awi_sized_6
Awi_sized_5:
		movea.l    8(a7),a0
		move.w     6(a0),d0
Awi_sized_6:
		movea.l    4(a7),a0
		move.w     d0,6(a0)
		movea.l    12(a7),a0
		jsr        Awi_oblist
		movea.l    4(a7),a0
		move.w     2(a7),d0
		cmp.w      4(a0),d0
		bne.s      Awi_sized_7
		movea.l    4(a7),a0
		move.w     (a7),d0
		cmp.w      6(a0),d0
		bne.s      Awi_sized_7
		moveq.l    #16,d0
		movea.l    12(a7),a0
		and.w      86(a0),d0
		bne.s      Awi_sized_7
		bra        Awi_sized_2
Awi_sized_7:
		movea.l    4(a7),a0
		move.w     6(a0),-(a7)
		movea.l    6(a7),a0
		move.w     4(a0),-(a7)
		movea.l    8(a7),a0
		move.w     2(a0),-(a7)
		movea.l    10(a7),a0
		move.w     (a0),-(a7)
		moveq.l    #5,d1
		movea.l    20(a7),a0
		move.w     32(a0),d0
		jsr        wind_set
		addq.w     #8,a7
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0300,(a0)
		ble.s      Awi_sized_8
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0400,(a0)
		bge.s      Awi_sized_8
		movea.l    12(a7),a0
		bsr        Awi_slider
Awi_sized_8:
		moveq.l    #16,d0
		movea.l    12(a7),a0
		and.w      86(a0),d0
		beq.s      Awi_sized_2
		moveq.l    #64,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      Awi_sized_9
		movea.l    4(a7),a0
		movea.l    12(a7),a1
		move.w     32(a1),d1
		movea.l    ACSblk,a1
		move.w     (a1),d0
		jsr        Aev_WmRedraw
		bra.s      Awi_sized_2
Awi_sized_9:
		movea.l    12(a7),a0
		andi.w     #$FFFD,86(a0)
		movea.l    12(a7),a1
		lea.l      36(a1),a1
		movea.l    12(a7),a0
		movea.l    12(a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
		jsr        Awi_diastart
Awi_sized_2:
		lea.l      16(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_moved
Awi_moved:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		move.w     32(a0),d0
		bgt.s      Awi_moved_1
		bra.s      Awi_moved_2
Awi_moved_1:
		movea.l    4(a7),a0
		andi.w     #$FFFE,86(a0)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.w     (a0),36(a1)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.w     2(a0),38(a1)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.w     4(a0),40(a1)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.w     6(a0),42(a1)
		movea.l    4(a7),a0
		jsr        Awi_cleanup
		movea.l    4(a7),a0
		move.w     42(a0),-(a7)
		movea.l    6(a7),a0
		move.w     40(a0),-(a7)
		movea.l    8(a7),a0
		move.w     38(a0),-(a7)
		movea.l    10(a7),a0
		move.w     36(a0),-(a7)
		moveq.l    #5,d1
		movea.l    12(a7),a0
		move.w     32(a0),d0
		jsr        wind_set
		addq.w     #8,a7
Awi_moved_2:
		addq.w     #8,a7
		rts

	.globl Awi_cleanup
Awi_cleanup:
		move.l     a2,-(a7)
		lea.l      -60(a7),a7
		move.l     a0,48(a7)
		movea.l    48(a7),a0
		move.w     86(a0),d0
		and.w      #$0800,d0
		beq.s      Awi_cleanup_1
		bra        Awi_cleanup_2
Awi_cleanup_1:
		movea.l    48(a7),a0
		move.w     32(a0),20(a7)
		movea.l    48(a7),a0
		move.l     20(a0),4(a7)
		movea.l    48(a7),a0
		move.l     24(a0),(a7)
		movea.l    48(a7),a0
		move.l     94(a0),8(a7)
		movea.l    48(a7),a0
		move.w     72(a0),d0
		or.w       #$FF00,d0
		move.w     d0,14(a7)
		movea.l    48(a7),a0
		move.w     72(a0),d0
		asr.w      #8,d0
		move.w     d0,12(a7)
		moveq.l    #32,d0
		movea.l    48(a7),a0
		and.w      34(a0),d0
		beq.s      Awi_cleanup_3
		move.w     14(a7),d0
		not.w      d0
		movea.l    4(a7),a0
		add.w      d0,20(a0)
		move.w     14(a7),d0
		movea.l    4(a7),a0
		and.w      d0,20(a0)
		move.w     12(a7),d0
		not.w      d0
		movea.l    4(a7),a0
		add.w      d0,22(a0)
		move.w     12(a7),d0
		movea.l    4(a7),a0
		and.w      d0,22(a0)
Awi_cleanup_3:
		clr.w      26(a7)
		move.l     8(a7),d0
		beq.s      Awi_cleanup_4
		movea.l    8(a7),a0
		move.w     2(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		move.w     22(a0,d0.l),26(a7)
Awi_cleanup_4:
		move.l     (a7),d0
		beq.s      Awi_cleanup_5
		movea.l    (a7),a0
		move.w     22(a0),d0
		add.w      d0,26(a7)
Awi_cleanup_5:
		movea.l    48(a7),a0
		move.w     36(a0),46(a7)
		movea.l    48(a7),a0
		move.w     38(a0),44(a7)
		movea.l    48(a7),a0
		move.w     40(a0),42(a7)
		movea.l    48(a7),a0
		move.w     42(a0),40(a7)
		move.l     _globl,-(a7)
		pea.l      36(a7)
		pea.l      42(a7)
		movea.l    16(a7),a0
		move.w     22(a0),d0
		add.w      38(a7),d0
		move.w     d0,-(a7)
		movea.l    18(a7),a0
		move.w     20(a0),-(a7)
		clr.w      -(a7)
		lea.l      54(a7),a1
		lea.l      56(a7),a0
		clr.w      d2
		movea.l    66(a7),a2
		move.w     34(a2),d1
		clr.w      d0
		jsr        mt_wind_calc
		lea.l      18(a7),a7
		move.w     42(a7),d0
		cmp.w      34(a7),d0
		bge.s      Awi_cleanup_6
		move.w     42(a7),d0
		bra.s      Awi_cleanup_7
Awi_cleanup_6:
		move.w     34(a7),d0
Awi_cleanup_7:
		move.w     d0,42(a7)
		move.w     40(a7),d0
		cmp.w      32(a7),d0
		bge.s      Awi_cleanup_8
		move.w     40(a7),d0
		bra.s      Awi_cleanup_9
Awi_cleanup_8:
		move.w     32(a7),d0
Awi_cleanup_9:
		move.w     d0,40(a7)
		movea.l    ACSblk,a0
		move.w     42(a7),d0
		cmp.w      12(a0),d0
		bge.s      Awi_cleanup_10
		move.w     42(a7),d0
		bra.s      Awi_cleanup_11
Awi_cleanup_10:
		movea.l    ACSblk,a0
		move.w     12(a0),d0
Awi_cleanup_11:
		move.w     d0,42(a7)
		movea.l    ACSblk,a0
		move.w     40(a7),d0
		cmp.w      14(a0),d0
		bge.s      Awi_cleanup_12
		move.w     40(a7),d0
		bra.s      Awi_cleanup_13
Awi_cleanup_12:
		movea.l    ACSblk,a0
		move.w     14(a0),d0
Awi_cleanup_13:
		move.w     d0,40(a7)
		movea.l    ACSblk,a0
		move.w     18(a0),d0
		cmp.w      42(a7),d0
		ble.s      Awi_cleanup_14
		movea.l    ACSblk,a0
		move.w     18(a0),d0
		bra.s      Awi_cleanup_15
Awi_cleanup_14:
		move.w     42(a7),d0
Awi_cleanup_15:
		move.w     d0,42(a7)
		movea.l    ACSblk,a0
		move.w     20(a0),d0
		cmp.w      40(a7),d0
		ble.s      Awi_cleanup_16
		movea.l    ACSblk,a0
		move.w     20(a0),d0
		bra.s      Awi_cleanup_17
Awi_cleanup_16:
		move.w     40(a7),d0
Awi_cleanup_17:
		move.w     d0,40(a7)
		move.w     $00113F20,d0
		sub.w      36(a7),d0
		move.w     d0,22(a7)
		move.w     virt_desk,d0
		add.w      $00113F22,d0
		sub.w      42(a7),d0
		move.w     46(a7),d1
		cmp.w      d0,d1
		bge.s      Awi_cleanup_18
		move.w     46(a7),d0
		bra.s      Awi_cleanup_19
Awi_cleanup_18:
		move.w     virt_desk,d0
		add.w      $00113F22,d0
		sub.w      42(a7),d0
Awi_cleanup_19:
		move.w     d0,46(a7)
		move.w     $00113F20,d0
		add.w      $00113F24,d0
		sub.w      40(a7),d0
		move.w     44(a7),d1
		cmp.w      d0,d1
		bge.s      Awi_cleanup_20
		move.w     44(a7),d0
		bra.s      Awi_cleanup_21
Awi_cleanup_20:
		move.w     $00113F20,d0
		add.w      $00113F24,d0
		sub.w      40(a7),d0
Awi_cleanup_21:
		move.w     d0,44(a7)
		move.w     virt_desk,d0
		cmp.w      46(a7),d0
		ble.s      Awi_cleanup_22
		move.w     virt_desk,d0
		bra.s      Awi_cleanup_23
Awi_cleanup_22:
		move.w     46(a7),d0
Awi_cleanup_23:
		move.w     d0,46(a7)
		move.w     $00113F20,d0
		cmp.w      44(a7),d0
		ble.s      Awi_cleanup_24
		move.w     $00113F20,d0
		bra.s      Awi_cleanup_25
Awi_cleanup_24:
		move.w     44(a7),d0
Awi_cleanup_25:
		move.w     d0,44(a7)
		move.l     _globl,-(a7)
		pea.l      36(a7)
		pea.l      42(a7)
		move.w     52(a7),-(a7)
		move.w     56(a7),-(a7)
		move.w     60(a7),-(a7)
		lea.l      54(a7),a1
		lea.l      56(a7),a0
		move.w     64(a7),d2
		movea.l    66(a7),a2
		move.w     34(a2),d1
		moveq.l    #1,d0
		jsr        mt_wind_calc
		lea.l      18(a7),a7
		move.w     26(a7),d0
		sub.w      d0,32(a7)
		move.w     14(a7),d0
		and.w      d0,38(a7)
		move.w     36(a7),d0
		sub.w      22(a7),d0
		sub.w      12(a7),d0
		subq.w     #1,d0
		and.w      12(a7),d0
		add.w      22(a7),d0
		add.w      26(a7),d0
		move.w     d0,36(a7)
		moveq.l    #32,d0
		movea.l    48(a7),a0
		and.w      34(a0),d0
		beq.s      Awi_cleanup_26
		move.w     14(a7),d0
		and.w      d0,34(a7)
		move.w     12(a7),d0
		and.w      d0,32(a7)
Awi_cleanup_26:
		move.l     8(a7),d0
		beq        Awi_cleanup_27
		movea.l    8(a7),a0
		move.w     2(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		move.w     2(a0,d0.l),16(a7)
		move.w     16(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		cmpi.w     #$0003,2(a0,d0.l)
		bne.s      Awi_cleanup_28
		movea.l    8(a7),a0
		move.w     16(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a1
		move.w     72(a0),2(a1,d0.l)
		movea.l    8(a7),a0
		move.w     4(a0),18(a7)
		move.w     18(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    8(a7),a0
		move.w     2(a0,d1.l),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		move.w     18(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    8(a7),a1
		move.w     0(a0,d0.l),2(a1,d1.l)
Awi_cleanup_28:
		movea.l    8(a7),a0
		move.w     2(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		ori.l      #$00FF0000,12(a0,d0.l)
		move.w     38(a7),d0
		movea.l    ACSblk,a0
		move.w     18(a0),d2
		move.w     d2,d1
		add.w      d1,d1
		add.w      d2,d1
		sub.w      d1,d0
		movea.l    8(a7),a0
		move.w     d0,16(a0)
		move.w     36(a7),d0
		sub.w      26(a7),d0
		subq.w     #1,d0
		movea.l    8(a7),a0
		move.w     d0,18(a0)
Awi_cleanup_27:
		movea.l    48(a7),a0
		move.w     38(a7),52(a0)
		movea.l    48(a7),a0
		move.w     36(a7),54(a0)
		movea.l    48(a7),a0
		move.w     34(a7),56(a0)
		movea.l    48(a7),a0
		move.w     32(a7),58(a0)
		move.l     (a7),d0
		beq        Awi_cleanup_29
		moveq.l    #64,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq        Awi_cleanup_30
		movea.l    (a7),a0
		move.w     20(a0),d0
		cmp.w      34(a7),d0
		bge        Awi_cleanup_30
		movea.l    48(a7),a0
		move.w     56(a0),d0
		movea.l    ACSblk,a0
		move.w     18(a0),d1
		add.w      d1,d1
		sub.w      d1,d0
		ble.s      Awi_cleanup_31
		movea.l    48(a7),a0
		move.w     56(a0),d0
		movea.l    ACSblk,a0
		move.w     18(a0),d1
		add.w      d1,d1
		sub.w      d1,d0
		bra.s      Awi_cleanup_32
Awi_cleanup_31:
		clr.w      d0
Awi_cleanup_32:
		movea.l    48(a7),a0
		add.w      52(a0),d0
		move.w     d0,52(a7)
		movea.l    48(a7),a0
		move.w     54(a0),54(a7)
		movea.l    ACSblk,a0
		move.w     18(a0),d0
		add.w      d0,d0
		move.w     d0,56(a7)
		movea.l    (a7),a0
		move.w     22(a0),58(a7)
		lea.l      52(a7),a0
		movea.l    48(a7),a1
		move.w     32(a1),d1
		movea.l    ACSblk,a1
		move.w     (a1),d0
		jsr        Aev_WmRedraw
		movea.l    48(a7),a0
		ori.w      #$0010,86(a0)
Awi_cleanup_30:
		movea.l    (a7),a0
		clr.w      16(a0)
		movea.l    (a7),a0
		move.w     22(a0),d0
		neg.w      d0
		movea.l    (a7),a0
		move.w     d0,18(a0)
		movea.l    (a7),a0
		move.w     34(a7),20(a0)
Awi_cleanup_29:
		movea.l    4(a7),a0
		move.w     20(a0),d0
		sub.w      34(a7),d0
		and.w      14(a7),d0
		move.w     d0,30(a7)
		movea.l    4(a7),a0
		move.w     16(a0),d0
		move.w     30(a7),d1
		neg.w      d1
		cmp.w      d1,d0
		bge.s      Awi_cleanup_33
		move.w     30(a7),d0
		neg.w      d0
		movea.l    4(a7),a0
		move.w     d0,16(a0)
Awi_cleanup_33:
		movea.l    4(a7),a0
		move.w     22(a0),d0
		sub.w      32(a7),d0
		and.w      12(a7),d0
		move.w     d0,28(a7)
		movea.l    4(a7),a0
		move.w     18(a0),d0
		move.w     28(a7),d1
		neg.w      d1
		cmp.w      d1,d0
		bge.s      Awi_cleanup_34
		move.w     28(a7),d0
		neg.w      d0
		movea.l    4(a7),a0
		move.w     d0,18(a0)
Awi_cleanup_34:
		move.l     _globl,-(a7)
		movea.l    52(a7),a0
		pea.l      42(a0)
		movea.l    56(a7),a0
		pea.l      40(a0)
		move.w     44(a7),d0
		add.w      38(a7),d0
		move.w     d0,-(a7)
		move.w     48(a7),-(a7)
		move.w     52(a7),d0
		sub.w      42(a7),d0
		move.w     d0,-(a7)
		movea.l    66(a7),a1
		lea.l      38(a1),a1
		movea.l    66(a7),a0
		lea.l      36(a0),a0
		move.w     56(a7),d2
		movea.l    66(a7),a2
		move.w     34(a2),d1
		clr.w      d0
		jsr        mt_wind_calc
		lea.l      18(a7),a7
		movea.l    48(a7),a0
		move.w     34(a0),d0
		and.w      #$0800,d0
		beq        Awi_cleanup_35
		moveq.l    #32,d0
		movea.l    48(a7),a0
		and.w      84(a0),d0
		bne        Awi_cleanup_35
		clr.w      24(a7)
		move.w     30(a7),d0
		ble.s      Awi_cleanup_36
		movea.l    4(a7),a0
		move.w     16(a0),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #5,d0
		sub.l      d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #3,d0
		neg.l      d0
		move.w     30(a7),d1
		ext.l      d1
		jsr        _ldiv
		move.w     d0,24(a7)
Awi_cleanup_36:
		movea.l    48(a7),a0
		move.w     24(a7),d0
		cmp.w      60(a0),d0
		beq.s      Awi_cleanup_37
		movea.l    48(a7),a0
		move.w     24(a7),60(a0)
		move.w     20(a7),d0
		ble.s      Awi_cleanup_37
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		move.w     30(a7),-(a7)
		moveq.l    #8,d1
		move.w     28(a7),d0
		jsr        wind_set
		addq.w     #8,a7
Awi_cleanup_37:
		move.w     34(a7),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #5,d0
		sub.l      d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		move.w     20(a0),d1
		ext.l      d1
		jsr        _ldiv
		move.w     d0,24(a7)
		movea.l    48(a7),a0
		move.w     24(a7),d0
		cmp.w      64(a0),d0
		beq.s      Awi_cleanup_35
		movea.l    48(a7),a0
		move.w     24(a7),64(a0)
		move.w     20(a7),d0
		ble.s      Awi_cleanup_35
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		move.w     30(a7),-(a7)
		moveq.l    #15,d1
		move.w     28(a7),d0
		jsr        wind_set
		addq.w     #8,a7
Awi_cleanup_35:
		movea.l    48(a7),a0
		move.w     34(a0),d0
		and.w      #$0100,d0
		beq        Awi_cleanup_2
		moveq.l    #64,d0
		movea.l    48(a7),a0
		and.w      84(a0),d0
		bne        Awi_cleanup_2
		clr.w      24(a7)
		move.w     28(a7),d0
		ble.s      Awi_cleanup_38
		movea.l    4(a7),a0
		move.w     18(a0),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #5,d0
		sub.l      d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #3,d0
		neg.l      d0
		move.w     28(a7),d1
		ext.l      d1
		jsr        _ldiv
		move.w     d0,24(a7)
Awi_cleanup_38:
		movea.l    48(a7),a0
		move.w     24(a7),d0
		cmp.w      62(a0),d0
		beq.s      Awi_cleanup_39
		movea.l    48(a7),a0
		move.w     24(a7),62(a0)
		move.w     20(a7),d0
		ble.s      Awi_cleanup_39
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		move.w     30(a7),-(a7)
		moveq.l    #9,d1
		move.w     28(a7),d0
		jsr        wind_set
		addq.w     #8,a7
Awi_cleanup_39:
		move.w     32(a7),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #5,d0
		sub.l      d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		move.w     22(a0),d1
		ext.l      d1
		jsr        _ldiv
		move.w     d0,24(a7)
		movea.l    48(a7),a0
		move.w     24(a7),d0
		cmp.w      66(a0),d0
		beq.s      Awi_cleanup_2
		movea.l    48(a7),a0
		move.w     24(a7),66(a0)
		move.w     20(a7),d0
		ble.s      Awi_cleanup_2
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		move.w     30(a7),-(a7)
		moveq.l    #16,d1
		move.w     28(a7),d0
		jsr        wind_set
		addq.w     #8,a7
Awi_cleanup_2:
		lea.l      60(a7),a7
		movea.l    (a7)+,a2
		rts

Awi_oblist:
		move.l     a2,-(a7)
		lea.l      -38(a7),a7
		move.l     a0,34(a7)
		clr.w      22(a7)
		clr.w      20(a7)
		move.w     #$FFFF,16(a7)
		move.w     #$FFFF,14(a7)
		clr.w      (a7)
		movea.l    34(a7),a0
		move.w     86(a0),d0
		and.w      #$0800,d0
		bne.s      Awi_oblist_1
		movea.l    34(a7),a0
		move.l     20(a0),30(a7)
		bne.s      Awi_oblist_2
Awi_oblist_1:
		bra        Awi_oblist_3
Awi_oblist_2:
		moveq.l    #8,d0
		movea.l    34(a7),a0
		and.w      84(a0),d0
		beq        Awi_oblist_4
		move.l     _globl,-(a7)
		pea.l      24(a7)
		pea.l      30(a7)
		movea.l    46(a7),a0
		move.w     42(a0),-(a7)
		movea.l    48(a7),a0
		move.w     40(a0),-(a7)
		movea.l    50(a7),a0
		move.w     38(a0),-(a7)
		lea.l      36(a7),a1
		lea.l      36(a7),a0
		movea.l    52(a7),a2
		move.w     36(a2),d2
		movea.l    52(a7),a2
		move.w     34(a2),d1
		moveq.l    #1,d0
		jsr        mt_wind_calc
		lea.l      18(a7),a7
		movea.l    30(a7),a0
		move.w     2(a0),28(a7)
		clr.w      2(a7)
		move.w     28(a7),d0
		ble        Awi_oblist_5
		move.w     28(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    30(a7),a0
		move.w     16(a0,d0.l),d0
		move.w     d0,26(a7)
		move.w     d0,8(a7)
		move.w     28(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    30(a7),a0
		move.w     18(a0,d0.l),d0
		move.w     d0,24(a7)
		move.w     d0,6(a7)
		bra        Awi_oblist_6
Awi_oblist_13:
		move.w     #$0080,d0
		move.w     28(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    30(a7),a0
		and.w      8(a0,d1.l),d0
		bne        Awi_oblist_7
		move.w     8(a7),d0
		move.w     28(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    30(a7),a0
		add.w      20(a0,d1.l),d0
		move.w     d0,4(a7)
		move.w     4(a7),d0
		cmp.w      22(a7),d0
		ble.s      Awi_oblist_8
		movea.l    30(a7),a0
		move.w     28(a7),d0
		cmp.w      2(a0),d0
		beq.s      Awi_oblist_8
		move.w     26(a7),d0
		sub.w      8(a7),d0
		add.w      d0,4(a7)
		move.w     26(a7),8(a7)
		move.w     2(a7),d0
		add.w      24(a7),d0
		add.w      d0,6(a7)
		move.w     24(a7),2(a7)
Awi_oblist_8:
		move.w     28(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    30(a7),a0
		move.w     2(a7),d1
		cmp.w      22(a0,d0.l),d1
		bge.s      Awi_oblist_9
		move.w     28(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    30(a7),a0
		move.w     22(a0,d0.l),2(a7)
Awi_oblist_9:
		move.w     28(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    30(a7),a0
		move.w     16(a0,d0.l),d0
		cmp.w      8(a7),d0
		bne.s      Awi_oblist_10
		move.w     28(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    30(a7),a0
		move.w     18(a0,d0.l),d0
		cmp.w      6(a7),d0
		beq.s      Awi_oblist_11
Awi_oblist_10:
		move.w     28(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    30(a7),a0
		move.w     8(a7),16(a0,d0.l)
		move.w     28(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    30(a7),a0
		move.w     6(a7),18(a0,d0.l)
		move.w     #$0001,(a7)
Awi_oblist_11:
		move.w     22(a7),d0
		cmp.w      4(a7),d0
		bge.s      Awi_oblist_12
		move.w     4(a7),22(a7)
Awi_oblist_12:
		move.w     4(a7),d0
		add.w      26(a7),d0
		move.w     d0,8(a7)
Awi_oblist_7:
		move.w     28(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    30(a7),a0
		move.w     0(a0,d0.l),28(a7)
Awi_oblist_6:
		move.w     28(a7),d0
		bgt        Awi_oblist_13
		move.w     6(a7),d0
		add.w      24(a7),d0
		add.w      d0,2(a7)
Awi_oblist_5:
		movea.l    30(a7),a0
		move.w     20(a0),d0
		cmp.w      22(a7),d0
		beq.s      Awi_oblist_14
		movea.l    30(a7),a0
		move.w     20(a0),16(a7)
		movea.l    34(a7),a0
		move.w     72(a0),d0
		or.w       #$FF00,d0
		and.w      d0,22(a7)
		movea.l    30(a7),a0
		move.w     22(a7),20(a0)
		movea.l    34(a7),a0
		move.w     34(a0),d0
		and.w      #$0800,d0
		beq.s      Awi_oblist_14
		move.w     #$0001,(a7)
Awi_oblist_14:
		movea.l    34(a7),a0
		move.l     94(a0),d0
		beq.s      Awi_oblist_15
		movea.l    34(a7),a0
		movea.l    94(a0),a0
		move.w     2(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    34(a7),a0
		movea.l    94(a0),a0
		move.w     22(a0,d0.l),d0
		sub.w      d0,20(a7)
Awi_oblist_15:
		movea.l    34(a7),a0
		move.l     24(a0),d0
		beq.s      Awi_oblist_16
		movea.l    34(a7),a0
		movea.l    24(a0),a0
		move.w     22(a0),d0
		sub.w      d0,20(a7)
Awi_oblist_16:
		move.w     20(a7),d0
		cmp.w      2(a7),d0
		ble.s      Awi_oblist_17
		move.w     20(a7),d0
		bra.s      Awi_oblist_18
Awi_oblist_17:
		move.w     2(a7),d0
Awi_oblist_18:
		movea.l    34(a7),a0
		move.w     72(a0),d1
		asr.w      #8,d1
		or.w       #$FF00,d1
		and.w      d1,d0
		move.w     d0,20(a7)
		movea.l    30(a7),a0
		move.w     22(a0),d0
		cmp.w      20(a7),d0
		beq.s      Awi_oblist_4
		movea.l    30(a7),a0
		move.w     22(a0),14(a7)
		movea.l    30(a7),a0
		move.w     20(a7),22(a0)
		movea.l    34(a7),a0
		move.w     34(a0),d0
		and.w      #$0800,d0
		beq.s      Awi_oblist_4
		move.w     #$0001,(a7)
Awi_oblist_4:
		movea.l    34(a7),a0
		move.w     60(a0),12(a7)
		movea.l    34(a7),a0
		move.w     62(a0),10(a7)
		movea.l    34(a7),a0
		bsr        Awi_cleanup
		move.w     (a7),d0
		bne        Awi_oblist_19
		moveq.l    #8,d0
		movea.l    34(a7),a0
		and.w      84(a0),d0
		beq.s      Awi_oblist_20
		movea.l    34(a7),a0
		move.w     34(a0),d0
		and.w      #$0800,d0
		beq.s      Awi_oblist_21
		move.w     16(a7),d0
		cmp.w      22(a7),d0
		bge.s      Awi_oblist_21
		movea.l    34(a7),a0
		cmpi.w     #$03E8,60(a0)
		bne.s      Awi_oblist_21
		move.w     #$0001,(a7)
Awi_oblist_21:
		move.w     (a7),d0
		bne.s      Awi_oblist_22
		movea.l    34(a7),a0
		move.w     34(a0),d0
		and.w      #$0100,d0
		beq.s      Awi_oblist_22
		move.w     14(a7),d0
		cmp.w      20(a7),d0
		bge.s      Awi_oblist_22
		movea.l    34(a7),a0
		cmpi.w     #$03E8,62(a0)
		bne.s      Awi_oblist_22
		move.w     #$0001,(a7)
Awi_oblist_22:
		bra.s      Awi_oblist_19
Awi_oblist_20:
		movea.l    34(a7),a0
		move.w     34(a0),d0
		and.w      #$0800,d0
		beq.s      Awi_oblist_23
		movea.l    34(a7),a0
		move.w     60(a0),d0
		bne.s      Awi_oblist_24
		move.w     12(a7),d0
		beq.s      Awi_oblist_23
Awi_oblist_24:
		move.w     #$0001,(a7)
Awi_oblist_23:
		move.w     (a7),d0
		bne.s      Awi_oblist_19
		movea.l    34(a7),a0
		move.w     34(a0),d0
		and.w      #$0100,d0
		beq.s      Awi_oblist_19
		movea.l    34(a7),a0
		move.w     62(a0),d0
		bne.s      Awi_oblist_25
		move.w     10(a7),d0
		beq.s      Awi_oblist_19
Awi_oblist_25:
		move.w     #$0001,(a7)
Awi_oblist_19:
		move.w     (a7),d0
		beq.s      Awi_oblist_3
		movea.l    34(a7),a0
		ori.w      #$0010,86(a0)
Awi_oblist_3:
		lea.l      38(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_iconify
Awi_iconify:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.w     d0,14(a7)
		movea.l    16(a7),a0
		move.w     32(a0),d0
		ble.s      Awi_iconify_1
		movea.l    16(a7),a0
		move.w     86(a0),d0
		and.w      #$0C00,d0
		bne.s      Awi_iconify_1
		movea.l    16(a7),a0
		bsr        Awi_iconcreate
		tst.w      d0
		bne.s      Awi_iconify_2
Awi_iconify_1:
		clr.w      d0
		bra        Awi_iconify_3
Awi_iconify_2:
		movea.l    ACSblk,a0
		movea.l    576(a0),a0
		cmpa.l     16(a7),a0
		bne.s      Awi_iconify_4
		jsr        Adr_unselect
		jsr        Aev_mess
Awi_iconify_4:
		moveq.l    #-1,d0
		movea.l    16(a7),a0
		move.w     d0,82(a0)
		movea.l    16(a7),a0
		move.w     d0,30(a0)
		movea.l    16(a7),a0
		move.w     d0,28(a0)
		moveq.l    #-2,d0
		movea.l    16(a7),a0
		and.w      86(a0),d0
		or.w       #$0800,d0
		movea.l    16(a7),a0
		move.w     d0,86(a0)
		move.w     14(a7),d0
		beq.s      Awi_iconify_5
		movea.l    16(a7),a0
		ori.w      #$1000,86(a0)
Awi_iconify_5:
		moveq.l    #8,d0
		movea.l    16(a7),a1
		lea.l      36(a1),a1
		movea.l    16(a7),a0
		lea.l      44(a0),a0
		jsr        memcpy
		movea.l    _globl,a0
		movea.l    16(a7),a1
		move.w     32(a1),d0
		jsr        mt_wind_close
		moveq.l    #-1,d0
		move.w     d0,-(a7)
		moveq.l    #-1,d0
		move.w     d0,-(a7)
		moveq.l    #-1,d0
		move.w     d0,-(a7)
		moveq.l    #-1,d0
		move.w     d0,-(a7)
		moveq.l    #26,d1
		movea.l    24(a7),a0
		move.w     32(a0),d0
		jsr        wind_set
		addq.w     #8,a7
		moveq.l    #-1,d0
		move.w     d0,-(a7)
		moveq.l    #-1,d0
		move.w     d0,-(a7)
		movea.l    _globl,a0
		moveq.l    #-1,d2
		moveq.l    #-1,d1
		movea.l    20(a7),a1
		move.w     32(a1),d0
		jsr        mt_wind_open
		addq.w     #4,a7
		moveq.l    #25,d1
		movea.l    16(a7),a0
		move.w     32(a0),d0
		jsr        wind_set
		movea.l    16(a7),a0
		move.w     32(a0),d0
		lsl.w      #2,d0
		lea.l      _ACSv_wiicons,a0
		move.l     0(a0,d0.w),8(a7)
		movea.l    8(a7),a0
		pea.l      22(a0)
		movea.l    12(a7),a0
		pea.l      20(a0)
		movea.l    16(a7),a0
		pea.l      18(a0)
		movea.l    20(a7),a0
		pea.l      16(a0)
		moveq.l    #4,d1
		movea.l    32(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    8(a7),a0
		move.l     36(a0),4(a7)
		movea.l    8(a7),a0
		move.w     20(a0),d0
		movea.l    4(a7),a0
		sub.w      22(a0),d0
		asr.w      #1,d0
		movea.l    4(a7),a0
		move.w     d0,18(a0)
		movea.l    8(a7),a0
		move.w     22(a0),d0
		movea.l    4(a7),a0
		sub.w      24(a0),d0
		movea.l    4(a7),a0
		sub.w      32(a0),d0
		asr.w      #1,d0
		movea.l    4(a7),a0
		move.w     d0,20(a0)
		movea.l    4(a7),a0
		move.w     32(a0),d0
		beq.s      Awi_iconify_6
		movea.l    4(a7),a0
		move.w     30(a0),d0
		beq.s      Awi_iconify_6
		movea.l    8(a7),a0
		move.w     20(a0),d0
		movea.l    4(a7),a0
		sub.w      30(a0),d0
		asr.w      #1,d0
		movea.l    4(a7),a0
		move.w     d0,26(a0)
		movea.l    4(a7),a0
		move.w     20(a0),d0
		movea.l    4(a7),a0
		add.w      24(a0),d0
		movea.l    4(a7),a0
		move.w     d0,28(a0)
		bra.s      Awi_iconify_7
Awi_iconify_6:
		movea.l    8(a7),a0
		move.w     20(a0),d0
		asr.w      #1,d0
		movea.l    4(a7),a0
		move.w     d0,26(a0)
		movea.l    8(a7),a0
		move.w     22(a0),d0
		asr.w      #1,d0
		movea.l    4(a7),a0
		move.w     d0,28(a0)
Awi_iconify_7:
		move.w     14(a7),d0
		beq        Awi_iconify_8
		jsr        Adr_unselect
		move.w     #$0001,12(a7)
		bra        Awi_iconify_9
Awi_iconify_12:
		move.w     12(a7),d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		move.l     0(a0,d0.w),(a7)
		move.l     (a7),d0
		beq        Awi_iconify_10
		movea.l    16(a7),a0
		move.w     12(a7),d0
		cmp.w      32(a0),d0
		beq        Awi_iconify_10
		movea.l    (a7),a0
		move.w     86(a0),d0
		and.w      #$0800,d0
		beq.s      Awi_iconify_11
		movea.l    (a7),a0
		bsr        Awi_icondelete
		moveq.l    #8,d0
		movea.l    (a7),a1
		lea.l      44(a1),a1
		movea.l    (a7),a0
		lea.l      36(a0),a0
		jsr        memcpy
Awi_iconify_11:
		move.w     12(a7),d0
		lsl.w      #2,d0
		lea.l      icnmap,a0
		move.l     (a7),0(a0,d0.w)
		move.w     12(a7),d0
		lsl.w      #2,d0
		lea.l      gemmap,a0
		clr.l      0(a0,d0.w)
		movea.l    _globl,a0
		movea.l    (a7),a1
		move.w     32(a1),d0
		jsr        mt_wind_close
		movea.l    _globl,a0
		movea.l    (a7),a1
		move.w     32(a1),d0
		jsr        mt_wind_delete
		movea.l    (a7),a0
		move.w     #$FFFF,32(a0)
		movea.l    (a7),a0
		ori.w      #$0800,86(a0)
		jsr        Aev_mess
Awi_iconify_10:
		addq.w     #1,12(a7)
Awi_iconify_9:
		cmpi.w     #$0080,12(a7)
		blt        Awi_iconify_12
Awi_iconify_8:
		moveq.l    #1,d0
Awi_iconify_3:
		lea.l      20(a7),a7
		rts

	.globl Awi_uniconify
Awi_uniconify:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.l     6(a7),d0
		beq        Awi_uniconify_1
		movea.l    6(a7),a0
		move.w     86(a0),d0
		and.w      #$0800,d0
		beq        Awi_uniconify_1
		movea.l    6(a7),a0
		bsr        Awi_icondelete
		tst.w      d0
		beq        Awi_uniconify_1
		moveq.l    #8,d0
		movea.l    6(a7),a1
		lea.l      44(a1),a1
		movea.l    6(a7),a0
		lea.l      36(a0),a0
		jsr        memcpy
		movea.l    6(a7),a0
		move.w     50(a0),-(a7)
		movea.l    8(a7),a0
		move.w     48(a0),-(a7)
		movea.l    10(a7),a0
		move.w     46(a0),-(a7)
		movea.l    12(a7),a0
		move.w     44(a0),-(a7)
		moveq.l    #27,d1
		movea.l    14(a7),a0
		move.w     32(a0),d0
		jsr        wind_set
		addq.w     #8,a7
		jsr        Awi_diaend
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		moveq.l    #10,d1
		movea.l    14(a7),a0
		move.w     32(a0),d0
		jsr        wind_set
		addq.w     #8,a7
		movea.l    6(a7),a0
		andi.w     #$F7FF,86(a0)
		moveq.l    #8,d1
		moveq.l    #-1,d0
		movea.l    6(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_findflag
		movea.l    6(a7),a0
		move.w     d0,28(a0)
		movea.l    6(a7),a0
		move.w     28(a0),d0
		bpl.s      Awi_uniconify_2
		movea.l    6(a7),a0
		move.l     24(a0),d0
		beq.s      Awi_uniconify_2
		moveq.l    #8,d1
		moveq.l    #-1,d0
		movea.l    6(a7),a0
		movea.l    24(a0),a0
		jsr        Aob_findflag
		or.w       #$1000,d0
		movea.l    6(a7),a0
		move.w     d0,28(a0)
Awi_uniconify_2:
		movea.l    6(a7),a0
		move.w     #$FFFF,30(a0)
		jsr        Awi_diastart
Awi_uniconify_1:
		movea.l    6(a7),a0
		move.w     86(a0),d0
		and.w      #$1000,d0
		beq.s      Awi_uniconify_3
		move.w     #$0001,(a7)
		bra.s      Awi_uniconify_4
Awi_uniconify_6:
		move.w     (a7),d0
		lsl.w      #2,d0
		lea.l      icnmap,a0
		move.l     0(a0,d0.w),2(a7)
		move.l     2(a7),d0
		beq.s      Awi_uniconify_5
		movea.l    2(a7),a0
		andi.w     #$F7FF,86(a0)
		movea.l    2(a7),a0
		movea.l    2(a7),a1
		movea.l    12(a1),a1
		jsr        (a1)
		move.w     (a7),d0
		lsl.w      #2,d0
		lea.l      icnmap,a0
		clr.l      0(a0,d0.w)
		jsr        Aev_mess
Awi_uniconify_5:
		addq.w     #1,(a7)
Awi_uniconify_4:
		cmpi.w     #$0080,(a7)
		blt.s      Awi_uniconify_6
Awi_uniconify_3:
		moveq.l    #1,d0
		lea.l      10(a7),a7
		rts

	.globl Awi_service
Awi_service:
		subq.w     #6,a7
		move.l     a0,2(a7)
		move.w     d0,(a7)
		move.w     (a7),d0
		subq.w     #2,d0
		beq.s      Awi_service_1
		bra.s      Awi_service_2
Awi_service_1:
		movea.l    2(a7),a0
		bsr        Awi_delete
		bra.s      Awi_service_3
Awi_service_2:
		clr.w      d0
		bra.s      Awi_service_4
Awi_service_3:
		moveq.l    #1,d0
Awi_service_4:
		addq.w     #6,a7
		rts

	.globl Awi_dialog
Awi_dialog:
		move.l     a2,-(a7)
		lea.l      -56(a7),a7
		move.l     a0,52(a7)
		movea.l    52(a7),a0
		move.w     86(a0),d0
		and.w      #$0800,d0
		beq.s      Awi_dialog_1
		moveq.l    #-3,d0
		bra        Awi_dialog_2
Awi_dialog_1:
		move.w     a_dialog_active,d0
		beq.s      Awi_dialog_3
		movea.l    52(a7),a0
		move.l     20(a0),d0
		bne.s      Awi_dialog_4
		moveq.l    #-3,d0
		bra        Awi_dialog_2
		bra.s      Awi_dialog_3
Awi_dialog_4:
		lea.l      (a7),a0
		jsr        Act_save
		movea.l    ACSblk,a0
		move.l     52(a7),600(a0)
		movea.l    52(a7),a0
		movea.l    20(a0),a0
		jsr        A_dialog
		move.w     d0,44(a7)
		lea.l      (a7),a0
		jsr        Act_restore
		move.w     44(a7),d0
		bra        Awi_dialog_2
Awi_dialog_3:
		movea.l    52(a7),a0
		move.w     32(a0),d0
		bpl.s      Awi_dialog_5
		movea.l    ACSblk,a0
		move.w     14(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     12(a0),-(a7)
		movea.l    _globl,a0
		movea.l    ACSblk,a1
		move.w     10(a1),d2
		movea.l    ACSblk,a1
		move.w     8(a1),d1
		clr.w      d0
		jsr        mt_wind_create
		addq.w     #4,a7
		move.w     d0,46(a7)
		move.w     46(a7),d0
		bpl.s      Awi_dialog_6
		moveq.l    #-2,d0
		bra        Awi_dialog_2
Awi_dialog_6:
		movea.l    _globl,a0
		move.w     46(a7),d0
		jsr        mt_wind_delete
Awi_dialog_5:
		movea.l    52(a7),a0
		move.l     20(a0),d0
		beq.s      Awi_dialog_7
		movea.l    52(a7),a0
		move.w     86(a0),d0
		and.w      #$0400,d0
		beq.s      Awi_dialog_8
Awi_dialog_7:
		moveq.l    #-3,d0
		bra        Awi_dialog_2
Awi_dialog_8:
		moveq.l    #1,d0
		movea.l    52(a7),a0
		bsr        Awi_set_modal
		addq.w     #1,d0
		bne.s      Awi_dialog_9
		moveq.l    #-2,d0
		bra        Awi_dialog_2
Awi_dialog_9:
		lea.l      (a7),a0
		jsr        Act_save
		movea.l    ACSblk,a0
		move.l     52(a7),600(a0)
		movea.l    52(a7),a0
		andi.w     #$BFFF,34(a0)
		clr.l      -(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		pea.l      62(a7)
		moveq.l    #10,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    52(a7),a0
		move.w     32(a0),d0
		bmi.s      Awi_dialog_10
		movea.l    52(a7),a0
		move.w     32(a0),d0
		cmp.w      50(a7),d0
		beq.s      Awi_dialog_10
		movea.l    52(a7),a0
		bsr        Awi_topped
		bra.s      Awi_dialog_11
Awi_dialog_10:
		movea.l    52(a7),a0
		ori.w      #$0100,86(a0)
		movea.l    52(a7),a0
		movea.l    52(a7),a1
		movea.l    12(a1),a1
		jsr        (a1)
		tst.w      d0
		beq.s      Awi_dialog_12
		lea.l      (a7),a0
		jsr        Act_restore
		clr.w      d0
		movea.l    52(a7),a0
		bsr        Awi_set_modal
		moveq.l    #-2,d0
		bra        Awi_dialog_2
Awi_dialog_12:
		movea.l    52(a7),a0
		andi.w     #$FEFF,86(a0)
Awi_dialog_11:
		movea.l    52(a7),a0
		move.w     88(a0),48(a7)
		move.w     48(a7),d0
		bmi.s      Awi_dialog_13
		move.l     Aroot_wi,d0
		beq.s      Awi_dialog_13
		movea.l    52(a7),a1
		lea.l      88(a1),a1
		moveq.l    #101,d0
		movea.l    Aroot_wi,a0
		movea.l    Aroot_wi,a2
		movea.l    4(a2),a2
		jsr        (a2)
Awi_dialog_13:
		movea.l    52(a7),a0
		ori.w      #$0400,86(a0)
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
Awi_dialog_28:
		movea.l    ACSblk,a0
		clr.w      616(a0)
		move.w     #$FFFF,44(a7)
		moveq.l    #16,d0
		jsr        Awi_update
		move.l     _globl,-(a7)
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
		lea.l      76(a7),a0
		movea.l    ACSblk,a2
		move.w     710(a2),d2
		movea.l    ACSblk,a2
		move.w     720(a2),d1
		moveq.l    #55,d0
		jsr        mt_evnt_multi
		lea.l      50(a7),a7
		move.w     d0,24(a7)
		movea.l    ACSblk,a0
		move.w     614(a0),d1
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_gemks2n
		movea.l    ACSblk,a0
		move.w     d0,718(a0)
		moveq.l    #32,d0
		jsr        Awi_update
		moveq.l    #16,d0
		and.w      24(a7),d0
		beq.s      Awi_dialog_14
		lea.l      26(a7),a0
		jsr        Aev_message
		cmpi.w     #$0029,26(a7)
		bne.s      Awi_dialog_14
		move.w     #$FFFF,44(a7)
		moveq.l    #32,d0
		jsr        Awi_update
		bra        Awi_dialog_15
Awi_dialog_14:
		moveq.l    #2,d0
		and.w      24(a7),d0
		beq.s      Awi_dialog_16
		movea.l    ACSblk,a0
		move.w     716(a0),d1
		movea.l    ACSblk,a0
		move.w     714(a0),d0
		jsr        evbutton
		move.w     d0,44(a7)
Awi_dialog_16:
		moveq.l    #1,d0
		and.w      24(a7),d0
		beq.s      Awi_dialog_17
		suba.l     a0,a0
		jsr        evkeybrd
		move.w     d0,44(a7)
Awi_dialog_17:
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
		bne.s      Awi_dialog_18
		moveq.l    #4,d0
		and.w      24(a7),d0
		beq.s      Awi_dialog_19
		jsr        Aev_unhidepointer
Awi_dialog_19:
		jsr        evmouse
Awi_dialog_18:
		jsr        Ax_release
		bsr        Awi_lateupdate
		movea.l    ACSblk,a0
		move.l     Aroot_wi,600(a0)
		movea.l    ACSblk,a0
		movea.l    684(a0),a0
		jsr        (a0)
		movea.l    ACSblk,a0
		move.w     616(a0),d0
		beq.s      Awi_dialog_20
		cmpi.w     #$FFFF,44(a7)
		bne.s      Awi_dialog_21
		movea.l    52(a7),a0
		move.l     20(a0),d0
		beq.s      Awi_dialog_21
		moveq.l    #2,d1
		moveq.l    #-1,d0
		movea.l    52(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_findflag
		move.w     d0,44(a7)
Awi_dialog_21:
		bra        Awi_dialog_15
Awi_dialog_20:
		move.w     44(a7),d0
		bmi        Awi_dialog_22
		move.w     44(a7),d0
		and.w      #$1000,d0
		beq.s      Awi_dialog_23
		move.w     44(a7),d0
		and.w      #$0FFF,d0
		move.w     d0,42(a7)
		moveq.l    #5,d0
		move.w     42(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    52(a7),a0
		movea.l    24(a0),a0
		and.w      8(a0,d1.l),d0
		subq.w     #5,d0
		bne.s      Awi_dialog_24
		move.w     42(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    52(a7),a0
		movea.l    20(a0),a0
		move.w     32(a0,d0.l),d0
		and.w      #$8000,d0
		beq.s      Awi_dialog_25
		move.w     42(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    52(a7),a0
		movea.l    20(a0),a0
		move.l     24(a0,d0.l),d0
		bne.s      Awi_dialog_24
Awi_dialog_25:
		bra.s      Awi_dialog_15
Awi_dialog_24:
		bra.s      Awi_dialog_22
Awi_dialog_23:
		moveq.l    #5,d0
		move.w     44(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    52(a7),a0
		movea.l    20(a0),a0
		and.w      8(a0,d1.l),d0
		subq.w     #5,d0
		bne.s      Awi_dialog_22
		move.w     44(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    52(a7),a0
		movea.l    20(a0),a0
		move.w     32(a0,d0.l),d0
		and.w      #$8000,d0
		beq.s      Awi_dialog_26
		move.w     44(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    52(a7),a0
		movea.l    20(a0),a0
		move.l     24(a0,d0.l),d0
		bne.s      Awi_dialog_22
Awi_dialog_26:
		bra.s      Awi_dialog_15
Awi_dialog_22:
		movea.l    52(a7),a0
		move.w     32(a0),d0
		bpl.s      Awi_dialog_27
		bra.s      Awi_dialog_15
Awi_dialog_27:
		bra        Awi_dialog_28
Awi_dialog_15:
		movea.l    ACSblk,a0
		clr.w      616(a0)
		movea.l    52(a7),a0
		move.w     32(a0),d0
		bmi.s      Awi_dialog_29
		movea.l    52(a7),a0
		movea.l    52(a7),a1
		movea.l    114(a1),a1
		jsr        (a1)
Awi_dialog_29:
		clr.w      d0
		movea.l    52(a7),a0
		bsr        Awi_set_modal
		movea.l    52(a7),a0
		andi.w     #$FBFF,86(a0)
		lea.l      (a7),a0
		jsr        Act_restore
		jsr        Aev_mess
		jsr        Aev_mess
		move.w     44(a7),d0
Awi_dialog_2:
		lea.l      56(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_doform
Awi_doform:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     a1,10(a7)
		clr.l      6(a7)
		clr.l      2(a7)
		move.w     #$FFFE,(a7)
		movea.l    10(a7),a0
		movea.l    14(a7),a1
		movea.l    8(a1),a1
		jsr        (a1)
		move.l     a0,6(a7)
		move.l     6(a7),d0
		beq        Awi_doform_1
		movea.l    ACSblk,a0
		move.w     12(a0),d0
		movea.l    6(a7),a0
		cmp.w      56(a0),d0
		ble.s      Awi_doform_2
		movea.l    6(a7),a0
		andi.w     #$F1FF,34(a0)
Awi_doform_2:
		movea.l    ACSblk,a0
		move.w     14(a0),d0
		movea.l    6(a7),a0
		cmp.w      58(a0),d0
		ble.s      Awi_doform_3
		movea.l    6(a7),a0
		andi.w     #$FE3F,34(a0)
Awi_doform_3:
		movea.l    ACSblk,a0
		move.w     14(a0),d0
		movea.l    6(a7),a0
		cmp.w      58(a0),d0
		ble.s      Awi_doform_4
		movea.l    ACSblk,a0
		move.w     12(a0),d0
		movea.l    6(a7),a0
		cmp.w      56(a0),d0
		ble.s      Awi_doform_4
		movea.l    6(a7),a0
		andi.w     #$FFDB,34(a0)
Awi_doform_4:
		movea.l    6(a7),a0
		andi.w     #$9FFF,34(a0)
		movea.l    6(a7),a0
		bsr        Awi_dialog
		move.w     d0,(a7)
		movea.l    6(a7),a0
		bsr        Awi_delete
Awi_doform_1:
		cmpi.w     #$FFFF,(a7)
		bge.s      Awi_doform_5
		movea.l    14(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_create
		move.l     a0,2(a7)
		move.l     2(a7),d0
		beq.s      Awi_doform_6
		movea.l    2(a7),a0
		jsr        A_dialog
		move.w     d0,(a7)
		movea.l    2(a7),a0
		jsr        Aob_delete
		bra.s      Awi_doform_5
Awi_doform_6:
		lea.l      xe0f58,a0
		moveq.l    #1,d0
		jsr        Awi_alert
Awi_doform_5:
		move.w     (a7),d0
		lea.l      18(a7),a7
		rts

	.globl Awi_diaabort
Awi_diaabort:
		movea.l    ACSblk,a0
		move.w     #$0001,616(a0)
		rts

	.globl Awi_shadow
Awi_shadow:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		movea.l    8(a7),a0
		move.w     32(a0),d0
		bpl.s      Awi_shadow_1
		moveq.l    #1,d0
		bra.s      Awi_shadow_2
Awi_shadow_1:
		pea.l      4(a7)
		pea.l      8(a7)
		pea.l      10(a7)
		pea.l      12(a7)
		moveq.l    #11,d1
		movea.l    24(a7),a0
		move.w     32(a0),d0
		jsr        wind_get
		lea.l      16(a7),a7
		movea.l    8(a7),a0
		move.w     86(a0),d0
		and.w      #$2000,d0
		bne.s      Awi_shadow_3
		move.w     4(a7),d0
		bne.s      Awi_shadow_4
		move.w     6(a7),d0
		bne.s      Awi_shadow_4
Awi_shadow_3:
		moveq.l    #1,d0
		bra.s      Awi_shadow_2
Awi_shadow_4:
		clr.w      d0
Awi_shadow_2:
		lea.l      12(a7),a7
		rts

	.globl _init_alert
_init_alert:
		move.l     a2,-(a7)
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		movea.l    10(a7),a0
		move.l     (a0),d0
		bne.s      _init_alert_1
		clr.w      d0
		bra        _init_alert_2
_init_alert_1:
		movea.l    10(a7),a0
		ori.w      #$0020,86(a0)
		jsr        Ash_gett
		move.l     d0,timer1
		move.l     timer1,d0
		sub.l      timer2,d0
		cmp.l      #$00000258,d0
		ble        _init_alert_3
		move.l     timer1,timer2
		move.w     #$0005,8(a7)
		bra.s      _init_alert_4
_init_alert_7:
		move.w     #$0080,d0
		move.w     8(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    10(a7),a0
		movea.l    20(a0),a0
		and.w      8(a0,d1.l),d0
		bne.s      _init_alert_5
		bra.s      _init_alert_6
_init_alert_5:
		addq.w     #1,8(a7)
_init_alert_4:
		cmpi.w     #$000D,8(a7)
		ble.s      _init_alert_7
_init_alert_6:
		move.w     8(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		movea.l    20(a0),a0
		ori.w      #$0080,8(a0,d0.l)
		subq.w     #1,8(a7)
		move.w     8(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		movea.l    20(a0),a0
		andi.w     #$FF7F,8(a0,d0.l)
		moveq.l    #2,d0
		movea.l    10(a7),a0
		movea.l    20(a0),a1
		lea.l      (a7),a0
		jsr        Aob_offset
		movea.l    10(a7),a0
		move.w     52(a0),d0
		add.w      d0,(a7)
		movea.l    10(a7),a0
		move.w     54(a0),d0
		add.w      d0,2(a7)
		lea.l      (a7),a1
		movea.l    10(a7),a0
		movea.l    10(a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
		cmpi.w     #$0005,8(a7)
		bne.s      _init_alert_3
		movea.l    ACSblk,a0
		move.w     #$0001,616(a0)
		moveq.l    #0,d0
		move.l     d0,timer2
		move.l     d0,timer1
_init_alert_3:
		clr.w      d0
_init_alert_2:
		lea.l      14(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_alert
Awi_alert:
		lea.l      -68(a7),a7
		move.w     d0,66(a7)
		move.l     a0,62(a7)
		movea.l    62(a7),a0
		jsr        strlen
		moveq.l    #9,d1
		cmp.l      d0,d1
		bls.s      Awi_alert_1
		moveq.l    #-1,d0
		bra        Awi_alert_2
Awi_alert_1:
		lea.l      _W_ALERT,a0
		movea.l    $000DFB0C,a1
		jsr        (a1)
		move.l     a0,58(a7)
		move.l     58(a7),d0
		beq        Awi_alert_3
		movea.l    ACSblk,a0
		move.l     992(a0),d0
		beq.s      Awi_alert_4
		movea.l    58(a7),a0
		move.l     74(a0),22(a7)
		movea.l    ACSblk,a0
		movea.l    992(a0),a0
		jsr        Ast_create
		movea.l    58(a7),a1
		move.l     a0,74(a1)
		movea.l    58(a7),a0
		move.l     74(a0),d0
		beq.s      Awi_alert_5
		movea.l    22(a7),a0
		jsr        Ast_delete
		bra.s      Awi_alert_6
Awi_alert_5:
		movea.l    58(a7),a0
		move.l     22(a7),74(a0)
Awi_alert_6:
		bra        Awi_alert_7
Awi_alert_4:
		movea.l    58(a7),a0
		move.l     74(a0),22(a7)
		movea.l    62(a7),a0
		move.b     1(a0),d0
		ext.w      d0
		sub.w      #$0031,d0
		beq.s      Awi_alert_8
		subq.w     #1,d0
		beq.s      Awi_alert_9
		subq.w     #1,d0
		beq.s      Awi_alert_10
		bra.s      Awi_alert_11
Awi_alert_8:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		movea.l    368(a0),a0
		jsr        Ast_create
		movea.l    58(a7),a1
		move.l     a0,74(a1)
		bra.s      Awi_alert_12
Awi_alert_9:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		movea.l    372(a0),a0
		jsr        Ast_create
		movea.l    58(a7),a1
		move.l     a0,74(a1)
		bra.s      Awi_alert_12
Awi_alert_10:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		movea.l    376(a0),a0
		jsr        Ast_create
		movea.l    58(a7),a1
		move.l     a0,74(a1)
		bra.s      Awi_alert_12
Awi_alert_11:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		movea.l    380(a0),a0
		jsr        Ast_create
		movea.l    58(a7),a1
		move.l     a0,74(a1)
Awi_alert_12:
		movea.l    58(a7),a0
		move.l     74(a0),d0
		beq.s      Awi_alert_13
		movea.l    22(a7),a0
		jsr        Ast_delete
		bra.s      Awi_alert_7
Awi_alert_13:
		movea.l    58(a7),a0
		move.l     22(a7),74(a0)
Awi_alert_7:
		moveq.l    #16,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      Awi_alert_14
		moveq.l    #2,d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		movea.l    492(a0),a0
		move.w     d0,16(a0)
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		movea.l    468(a0),a0
		move.w     d0,16(a0)
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		movea.l    444(a0),a0
		move.w     d0,16(a0)
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		movea.l    420(a0),a0
		move.w     d0,16(a0)
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		movea.l    396(a0),a0
		move.w     d0,16(a0)
Awi_alert_14:
		move.w     #$0002,4(a7)
		bra.s      Awi_alert_15
Awi_alert_16:
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		ori.w      #$0080,8(a0,d0.l)
		addq.w     #1,4(a7)
Awi_alert_15:
		cmpi.w     #$000D,4(a7)
		ble.s      Awi_alert_16
		movea.l    62(a7),a0
		move.b     1(a0),d0
		ext.w      d0
		sub.w      #$0030,d0
		cmp.w      #$0004,d0
		bhi        Awi_alert_17
		add.w      d0,d0
		move.w     J45(pc,d0.w),d0
		jmp        J45(pc,d0.w)
J45:
		dc.w Awi_alert_18-J45
		dc.w Awi_alert_19-J45
		dc.w Awi_alert_20-J45
		dc.w Awi_alert_21-J45
		dc.w Awi_alert_22-J45
Awi_alert_18:
		movea.l    ACSblk,a0
		move.w     18(a0),d0
		add.w      d0,d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		sub.w      d0,352(a0)
		bra.s      Awi_alert_17
Awi_alert_19:
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		andi.w     #$FF7F,80(a0)
		bra.s      Awi_alert_17
Awi_alert_20:
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		andi.w     #$FF7F,104(a0)
		bra.s      Awi_alert_17
Awi_alert_21:
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		andi.w     #$FF7F,56(a0)
		bra.s      Awi_alert_17
Awi_alert_22:
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		andi.w     #$FF7F,320(a0)
		movea.l    58(a7),a0
		move.l     #$00000001,(a0)
		jsr        Ash_gett
		move.l     d0,timer2
		move.l     d0,timer1
		movea.l    58(a7),a0
		ori.w      #$0020,86(a0)
		nop
Awi_alert_17:
		movea.l    ACSblk,a0
		move.l     562(a0),(a7)
		movea.l    ACSblk,a0
		move.l     #$0000014D,562(a0)
		movea.l    62(a7),a0
		addq.w     #1,a0
		move.l     a0,22(a7)
		bra.s      Awi_alert_23
Awi_alert_25:
		addq.l     #1,22(a7)
Awi_alert_23:
		moveq.l    #91,d0
		movea.l    22(a7),a0
		jsr        strchr
		move.l     a0,22(a7)
		beq.s      Awi_alert_24
		movea.l    22(a7),a0
		cmpi.b     #$5D,1(a0)
		beq.s      Awi_alert_25
Awi_alert_24:
		move.l     22(a7),d0
		beq.s      Awi_alert_26
		movea.l    22(a7),a0
		addq.w     #1,a0
		move.l     a0,18(a7)
		bra.s      Awi_alert_27
Awi_alert_29:
		addq.l     #1,18(a7)
Awi_alert_27:
		moveq.l    #91,d0
		movea.l    18(a7),a0
		jsr        strchr
		move.l     a0,18(a7)
		beq.s      Awi_alert_28
		movea.l    18(a7),a0
		cmpi.b     #$5D,1(a0)
		beq.s      Awi_alert_29
Awi_alert_28:
		bra.s      Awi_alert_30
Awi_alert_26:
		clr.l      18(a7)
Awi_alert_30:
		move.l     22(a7),d0
		beq        Awi_alert_3
		move.l     18(a7),d0
		beq        Awi_alert_3
		move.w     #$0010,4(a7)
		bra.s      Awi_alert_31
Awi_alert_32:
		lea.l      xe0f98,a1
		move.w     4(a7),d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_puttext
		addq.w     #1,4(a7)
Awi_alert_31:
		cmpi.w     #$0014,4(a7)
		ble.s      Awi_alert_32
		movea.l    18(a7),a0
		clr.b      -1(a0)
		move.w     #$0004,8(a7)
		move.w     #$0010,4(a7)
		movea.l    22(a7),a0
		addq.w     #1,a0
		move.l     a0,14(a7)
Awi_alert_35:
		moveq.l    #124,d0
		movea.l    14(a7),a0
		jsr        strchr
		move.l     a0,10(a7)
		bne.s      Awi_alert_33
		moveq.l    #30,d0
		movea.l    14(a7),a1
		lea.l      26(a7),a0
		jsr        strncpy
		clr.b      56(a7)
		lea.l      26(a7),a1
		move.w     4(a7),d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_puttext
		bra.s      Awi_alert_34
Awi_alert_33:
		subq.w     #1,8(a7)
		movea.l    10(a7),a0
		clr.b      (a0)
		moveq.l    #30,d0
		movea.l    14(a7),a1
		lea.l      26(a7),a0
		jsr        strncpy
		clr.b      56(a7)
		lea.l      26(a7),a1
		move.w     4(a7),d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_puttext
		movea.l    10(a7),a0
		move.b     #$7C,(a0)
		movea.l    10(a7),a0
		addq.w     #1,a0
		move.l     a0,14(a7)
Awi_alert_34:
		addq.w     #1,4(a7)
		move.l     10(a7),d0
		bne        Awi_alert_35
		movea.l    18(a7),a0
		move.b     #$5D,-1(a0)
		cmpi.w     #$0003,8(a7)
		ble.s      Awi_alert_36
		moveq.l    #3,d0
		bra.s      Awi_alert_37
Awi_alert_36:
		move.w     8(a7),d0
Awi_alert_37:
		move.w     d0,8(a7)
		move.w     8(a7),d0
		ble        Awi_alert_38
		move.w     8(a7),d0
		movea.l    ACSblk,a0
		muls.w     20(a0),d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		sub.w      d0,22(a0)
		move.w     8(a7),d0
		movea.l    ACSblk,a0
		muls.w     20(a0),d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		sub.w      d0,46(a0)
		move.w     8(a7),d0
		movea.l    ACSblk,a0
		muls.w     20(a0),d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		sub.w      d0,358(a0)
		move.w     8(a7),d0
		movea.l    ACSblk,a0
		muls.w     20(a0),d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		sub.w      d0,382(a0)
		move.w     8(a7),d0
		movea.l    ACSblk,a0
		muls.w     20(a0),d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		sub.w      d0,522(a0)
		move.w     8(a7),d0
		movea.l    ACSblk,a0
		muls.w     20(a0),d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		sub.w      d0,570(a0)
		move.w     8(a7),d0
		movea.l    ACSblk,a0
		muls.w     20(a0),d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		sub.w      d0,618(a0)
Awi_alert_38:
		move.l     18(a7),14(a7)
		clr.w      8(a7)
		bra.s      Awi_alert_39
Awi_alert_41:
		addq.w     #1,8(a7)
		movea.l    10(a7),a0
		addq.w     #1,a0
		move.l     a0,14(a7)
Awi_alert_39:
		movea.l    14(a7),a0
		move.b     (a0),d0
		beq.s      Awi_alert_40
		moveq.l    #124,d0
		movea.l    14(a7),a0
		jsr        strchr
		move.l     a0,10(a7)
		bne.s      Awi_alert_41
Awi_alert_40:
		move.w     8(a7),d0
		tst.w      d0
		beq.s      Awi_alert_42
		subq.w     #1,d0
		beq        Awi_alert_43
		subq.w     #1,d0
		beq        Awi_alert_43
		bra        Awi_alert_44
Awi_alert_42:
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		ori.w      #$0080,512(a0)
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		ori.w      #$0080,608(a0)
		movea.l    18(a7),a1
		addq.w     #1,a1
		lea.l      26(a7),a0
		jsr        strcpy
		moveq.l    #93,d0
		lea.l      26(a7),a0
		jsr        strchr
		move.l     a0,14(a7)
		move.l     14(a7),d0
		beq.s      Awi_alert_45
		movea.l    14(a7),a0
		clr.b      (a0)
Awi_alert_45:
		lea.l      26(a7),a1
		moveq.l    #23,d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_puttext
		movea.l    58(a7),a0
		movea.l    20(a0),a1
		lea.l      552(a1),a1
		lea.l      26(a7),a0
		jsr        Awi_hotkey
		move.w     66(a7),d0
		ble.s      Awi_alert_46
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		ori.w      #$0002,560(a0)
Awi_alert_46:
		bra        Awi_alert_44
Awi_alert_43:
		moveq.l    #124,d0
		movea.l    18(a7),a0
		addq.w     #1,a0
		jsr        strchr
		move.l     a0,14(a7)
		move.l     14(a7),d0
		sub.l      18(a7),d0
		subq.l     #1,d0
		movea.l    18(a7),a1
		addq.w     #1,a1
		lea.l      26(a7),a0
		jsr        strncpy
		movea.l    14(a7),a0
		suba.l     18(a7),a0
		clr.b      25(a7,a0.w)
		lea.l      26(a7),a1
		moveq.l    #21,d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_puttext
		movea.l    58(a7),a0
		movea.l    20(a0),a1
		lea.l      504(a1),a1
		lea.l      26(a7),a0
		jsr        Awi_hotkey
		addq.l     #1,14(a7)
		moveq.l    #124,d0
		movea.l    14(a7),a0
		jsr        strchr
		move.l     a0,10(a7)
		move.l     10(a7),d0
		beq.s      Awi_alert_47
		move.l     10(a7),d0
		sub.l      14(a7),d0
		movea.l    14(a7),a1
		lea.l      26(a7),a0
		jsr        strncpy
		movea.l    10(a7),a0
		suba.l     14(a7),a0
		clr.b      26(a7,a0.w)
		bra.s      Awi_alert_48
Awi_alert_47:
		movea.l    14(a7),a1
		lea.l      26(a7),a0
		jsr        strcpy
		moveq.l    #93,d0
		lea.l      26(a7),a0
		jsr        strchr
		move.l     a0,14(a7)
		move.l     14(a7),d0
		beq.s      Awi_alert_48
		movea.l    14(a7),a0
		clr.b      (a0)
Awi_alert_48:
		lea.l      26(a7),a1
		moveq.l    #23,d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_puttext
		movea.l    58(a7),a0
		movea.l    20(a0),a1
		lea.l      552(a1),a1
		lea.l      26(a7),a0
		jsr        Awi_hotkey
		cmpi.w     #$0002,8(a7)
		bne.s      Awi_alert_49
		addq.l     #1,10(a7)
		moveq.l    #93,d0
		movea.l    10(a7),a0
		jsr        strchr
		move.l     a0,14(a7)
		move.l     14(a7),d0
		sub.l      10(a7),d0
		movea.l    10(a7),a1
		lea.l      26(a7),a0
		jsr        strncpy
		movea.l    14(a7),a0
		suba.l     10(a7),a0
		clr.b      26(a7,a0.w)
		lea.l      26(a7),a1
		moveq.l    #25,d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_puttext
		movea.l    58(a7),a0
		movea.l    20(a0),a1
		lea.l      600(a1),a1
		lea.l      26(a7),a0
		jsr        Awi_hotkey
		bra.s      Awi_alert_50
Awi_alert_49:
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		move.w     524(a0),d0
		asr.w      #1,d0
		movea.l    ACSblk,a0
		add.w      18(a0),d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		add.w      d0,520(a0)
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		move.w     572(a0),d0
		asr.w      #1,d0
		movea.l    ACSblk,a0
		add.w      18(a0),d0
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		add.w      d0,568(a0)
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		ori.w      #$0080,608(a0)
Awi_alert_50:
		move.w     66(a7),d0
		subq.w     #1,d0
		beq.s      Awi_alert_51
		subq.w     #1,d0
		beq.s      Awi_alert_52
		subq.w     #1,d0
		beq.s      Awi_alert_53
		bra.s      Awi_alert_44
Awi_alert_51:
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		ori.w      #$0002,512(a0)
		bra.s      Awi_alert_44
Awi_alert_52:
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		ori.w      #$0002,560(a0)
		bra.s      Awi_alert_44
Awi_alert_53:
		movea.l    58(a7),a0
		movea.l    20(a0),a0
		ori.w      #$0002,608(a0)
		nop
Awi_alert_44:
		movea.l    58(a7),a0
		bsr        Awi_dialog
		move.w     d0,6(a7)
		movea.l    58(a7),a0
		bsr        Awi_delete
		movea.l    ACSblk,a0
		move.l     (a7),562(a0)
		move.w     6(a7),d0
		sub.w      #$0015,d0
		beq.s      Awi_alert_54
		subq.w     #2,d0
		beq.s      Awi_alert_55
		subq.w     #2,d0
		beq.s      Awi_alert_56
		bra.s      Awi_alert_57
Awi_alert_54:
		moveq.l    #1,d0
		bra.s      Awi_alert_2
Awi_alert_55:
		moveq.l    #2,d0
		bra.s      Awi_alert_2
Awi_alert_56:
		moveq.l    #3,d0
		bra.s      Awi_alert_2
Awi_alert_57:
		move.w     6(a7),d0
		bmi.s      Awi_alert_3
		moveq.l    #-1,d0
		bra.s      Awi_alert_2
Awi_alert_3:
		movea.l    62(a7),a0
		cmpi.b     #$33,1(a0)
		ble.s      Awi_alert_58
		movea.l    62(a7),a0
		move.b     #$31,1(a0)
Awi_alert_58:
		movea.l    _globl,a1
		movea.l    62(a7),a0
		move.w     66(a7),d0
		jsr        mt_form_alert
Awi_alert_2:
		lea.l      68(a7),a7
		rts

Awi_hotkey:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		movea.l    8(a7),a0
		lea.l      24(a0),a0
		move.l     a0,(a7)
		move.l     12(a7),4(a7)
		bra.s      Awi_hotkey_1
Awi_hotkey_4:
		movea.l    4(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        isalnum
		tst.w      d0
		beq.s      Awi_hotkey_2
		bra.s      Awi_hotkey_3
		bra.s      Awi_hotkey_1
Awi_hotkey_2:
		addq.l     #1,4(a7)
Awi_hotkey_1:
		movea.l    4(a7),a0
		move.b     (a0),d0
		bne.s      Awi_hotkey_4
Awi_hotkey_3:
		movea.l    4(a7),a0
		move.b     (a0),d0
		beq.s      Awi_hotkey_5
		movea.l    4(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        toupper
		or.w       #$8800,d0
		movea.l    (a7),a0
		move.w     d0,10(a0)
		bra.s      Awi_hotkey_6
Awi_hotkey_5:
		movea.l    (a7),a0
		clr.w      10(a0)
Awi_hotkey_6:
		lea.l      16(a7),a7
		rts

	.globl Awi_update
Awi_update:
		subq.w     #2,a7
		move.w     d0,(a7)
		move.w     (a7),d0
		and.w      #$00FF,d0
		cmp.w      #$0003,d0
		beq.w      Awi_update_1
		bgt.s      Awi_update_2
		tst.w      d0
		beq.s      Awi_update_3
		subq.w     #1,d0
		beq.s      Awi_update_4
		subq.w     #1,d0
		beq        Awi_update_5
		bra        Awi_update_6
Awi_update_2:
		sub.w      #$0010,d0
		beq        Awi_update_7
		sub.w      #$0010,d0
		beq        Awi_update_8
		bra        Awi_update_6
Awi_update_4:
		move.w     winupd,d0
		addq.w     #1,winupd
		tst.w      d0
		beq.s      Awi_update_9
		bra        Awi_update_6
Awi_update_9:
		movea.l    _globl,a0
		moveq.l    #1,d0
		jsr        mt_wind_update
		clr.w      winoldupd
		bra        Awi_update_6
Awi_update_3:
		subq.w     #1,winupd
		beq.s      Awi_update_10
		bra        Awi_update_6
Awi_update_10:
		movea.l    _globl,a0
		clr.w      d0
		jsr        mt_wind_update
		clr.w      winoldupd
		bra        Awi_update_6
Awi_update_1:
		move.w     msupd,d0
		addq.w     #1,msupd
		tst.w      d0
		beq.s      Awi_update_11
		bra        Awi_update_6
Awi_update_11:
		movea.l    _globl,a0
		moveq.l    #3,d0
		jsr        mt_wind_update
		clr.w      msoldupd
		bra        Awi_update_6
Awi_update_5:
		subq.w     #1,msupd
		beq.s      Awi_update_12
		bra        Awi_update_6
Awi_update_12:
		movea.l    _globl,a0
		moveq.l    #2,d0
		jsr        mt_wind_update
		clr.w      msoldupd
		bra        Awi_update_6
Awi_update_7:
		move.w     winupd,d0
		beq.s      Awi_update_13
		movea.l    _globl,a0
		clr.w      d0
		jsr        mt_wind_update
		move.w     winupd,winoldupd
		clr.w      winupd
Awi_update_13:
		move.w     msupd,d0
		beq.s      Awi_update_14
		movea.l    _globl,a0
		moveq.l    #2,d0
		jsr        mt_wind_update
		move.w     msupd,msoldupd
		clr.w      msupd
Awi_update_14:
		bra.s      Awi_update_6
Awi_update_8:
		move.w     winupd,d0
		bne.s      Awi_update_15
		move.w     winoldupd,d0
		beq.s      Awi_update_15
		movea.l    _globl,a0
		moveq.l    #1,d0
		jsr        mt_wind_update
		move.w     winoldupd,winupd
		clr.w      winoldupd
Awi_update_15:
		move.w     msupd,d0
		bne.s      Awi_update_16
		move.w     msoldupd,d0
		beq.s      Awi_update_16
		movea.l    _globl,a0
		moveq.l    #3,d0
		jsr        mt_wind_update
		move.w     msoldupd,msupd
		clr.w      msoldupd
Awi_update_16:
		nop
Awi_update_6:
		addq.w     #2,a7
		rts

	.globl Awi_obfind
Awi_obfind:
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		move.w     d0,20(a7)
		move.w     d1,18(a7)
		move.l     a1,14(a7)
		move.l     14(a7),d0
		beq.s      Awi_obfind_1
		movea.l    14(a7),a0
		clr.l      (a0)
Awi_obfind_1:
		move.l     30(a7),d0
		beq.s      Awi_obfind_2
		movea.l    30(a7),a0
		move.w     #$FFFF,(a0)
Awi_obfind_2:
		movea.l    22(a7),a0
		move.w     32(a0),d0
		bpl.s      Awi_obfind_3
		suba.l     a0,a0
		bra        Awi_obfind_4
Awi_obfind_3:
		movea.l    22(a7),a0
		move.w     54(a0),12(a7)
		movea.l    22(a7),a0
		move.w     52(a0),8(a7)
		movea.l    22(a7),a0
		move.w     54(a0),6(a7)
		movea.l    22(a7),a0
		move.l     24(a0),d0
		beq.s      Awi_obfind_5
		movea.l    22(a7),a0
		movea.l    24(a0),a0
		move.w     22(a0),d0
		bra.s      Awi_obfind_6
Awi_obfind_5:
		clr.w      d0
Awi_obfind_6:
		move.w     d0,10(a7)
		move.w     12(a7),d0
		sub.w      10(a7),d0
		move.w     18(a7),d1
		cmp.w      d0,d1
		bge.s      Awi_obfind_7
		suba.l     a0,a0
		bra        Awi_obfind_4
Awi_obfind_7:
		movea.l    22(a7),a0
		move.l     24(a0),d0
		beq.s      Awi_obfind_8
		move.w     18(a7),d0
		cmp.w      12(a7),d0
		bge.s      Awi_obfind_8
		move.w     12(a7),d0
		sub.w      10(a7),d0
		move.w     18(a7),d1
		cmp.w      d0,d1
		blt.s      Awi_obfind_8
		movea.l    22(a7),a0
		move.l     24(a0),(a7)
		bra.s      Awi_obfind_9
Awi_obfind_8:
		movea.l    22(a7),a0
		move.l     20(a0),(a7)
		movea.l    22(a7),a0
		move.l     24(a0),d0
		beq.s      Awi_obfind_10
		movea.l    22(a7),a0
		move.w     54(a0),d0
		bra.s      Awi_obfind_11
Awi_obfind_10:
		clr.w      d0
Awi_obfind_11:
		add.w      d0,6(a7)
Awi_obfind_9:
		move.l     (a7),d0
		bne.s      Awi_obfind_12
		suba.l     a0,a0
		bra.s      Awi_obfind_4
Awi_obfind_12:
		move.w     18(a7),d0
		sub.w      6(a7),d0
		move.w     d0,-(a7)
		movea.l    _globl,a1
		move.w     22(a7),d2
		sub.w      10(a7),d2
		moveq.l    #100,d1
		clr.w      d0
		movea.l    2(a7),a0
		jsr        mt_objc_find
		addq.w     #2,a7
		move.w     d0,4(a7)
		move.l     14(a7),d0
		beq.s      Awi_obfind_13
		movea.l    14(a7),a0
		move.l     (a7),(a0)
Awi_obfind_13:
		move.l     30(a7),d0
		beq.s      Awi_obfind_14
		movea.l    30(a7),a0
		move.w     4(a7),(a0)
Awi_obfind_14:
		move.w     4(a7),d0
		bmi.s      Awi_obfind_15
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a7),a0
		adda.l     d0,a0
		bra.s      Awi_obfind_4
Awi_obfind_15:
		suba.l     a0,a0
Awi_obfind_4:
		lea.l      26(a7),a7
		rts

Awi_contstring:
		move.l     a2,-(a7)
		lea.l      -38(a7),a7
		move.l     a0,34(a7)
		move.w     d0,32(a7)
		move.w     d1,30(a7)
		move.l     d2,26(a7)
		move.l     a1,22(a7)
		move.w     #$0001,20(a7)
		clr.w      18(a7)
		lea.l      xe0ee2,a0
		lea.l      (a7),a1
		move.l     (a0)+,(a1)+
		move.w     (a0)+,(a1)+
		lea.l      20(a7),a1
		move.w     46(a7),d0
		movea.l    34(a7),a0
		movea.l    34(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		tst.w      d0
		beq.s      Awi_contstring_1
		move.w     20(a7),d0
		bne.s      Awi_contstring_1
		suba.l     a0,a0
		bra        Awi_contstring_2
Awi_contstring_1:
		pea.l      (a7)
		lea.l      14(a7),a1
		move.w     34(a7),d1
		move.w     36(a7),d0
		movea.l    38(a7),a0
		bsr        Awi_obfind
		addq.w     #4,a7
		move.w     (a7),d0
		bmi        Awi_contstring_3
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    10(a7),a0
		adda.l     d0,a0
		move.l     a0,14(a7)
		movea.l    14(a7),a0
		cmpi.w     #$0018,6(a0)
		bne.s      Awi_contstring_4
		movea.l    14(a7),a0
		move.l     12(a0),6(a7)
		bra.s      Awi_contstring_5
Awi_contstring_4:
		clr.l      6(a7)
Awi_contstring_5:
		move.l     22(a7),d0
		beq.s      Awi_contstring_6
		movea.l    22(a7),a0
		move.l     14(a7),(a0)
Awi_contstring_6:
		move.l     52(a7),d0
		beq.s      Awi_contstring_7
		movea.l    52(a7),a0
		move.w     (a7),(a0)
Awi_contstring_7:
		move.l     6(a7),d0
		beq.s      Awi_contstring_8
		move.l     26(a7),d0
		lsl.l      #2,d0
		movea.l    6(a7),a0
		move.l     0(a0,d0.l),2(a7)
		movea.l    6(a7),a0
		move.l     8(a0),d0
		beq.s      Awi_contstring_8
		lea.l      2(a7),a1
		move.w     48(a7),d0
		movea.l    14(a7),a0
		movea.l    6(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		move.w     d0,18(a7)
Awi_contstring_8:
		move.w     18(a7),d0
		bne.s      Awi_contstring_3
		movea.l    34(a7),a0
		movea.l    10(a7),a1
		cmpa.l     24(a0),a1
		bne.s      Awi_contstring_9
		ori.w      #$1000,(a7)
Awi_contstring_9:
		lea.l      (a7),a1
		move.w     50(a7),d0
		movea.l    34(a7),a0
		movea.l    34(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		tst.w      d0
		bne.s      Awi_contstring_3
		clr.l      2(a7)
Awi_contstring_3:
		movea.l    2(a7),a0
Awi_contstring_2:
		lea.l      38(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Awi_bubblegem
Awi_bubblegem:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.w     d0,6(a7)
		move.w     d1,4(a7)
		clr.l      -(a7)
		moveq.l    #37,d0
		move.w     d0,-(a7)
		moveq.l    #19,d0
		move.w     d0,-(a7)
		moveq.l    #36,d0
		move.w     d0,-(a7)
		suba.l     a1,a1
		moveq.l    #6,d2
		move.w     14(a7),d1
		move.w     16(a7),d0
		movea.l    18(a7),a0
		bsr        Awi_contstring
		lea.l      10(a7),a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      Awi_bubblegem_1
		clr.w      d0
		bra.s      Awi_bubblegem_2
Awi_bubblegem_1:
		move.w     4(a7),d1
		move.w     6(a7),d0
		movea.l    (a7),a0
		jsr        Aev_ShowBubbleGEM
Awi_bubblegem_2:
		lea.l      12(a7),a7
		rts

	.globl Awi_context
Awi_context:
		move.w     d3,-(a7)
		move.l     a2,-(a7)
		lea.l      -28(a7),a7
		move.l     a0,24(a7)
		move.w     d0,22(a7)
		move.w     d1,20(a7)
		clr.w      (a7)
		pea.l      2(a7)
		moveq.l    #39,d0
		move.w     d0,-(a7)
		moveq.l    #20,d0
		move.w     d0,-(a7)
		moveq.l    #38,d0
		move.w     d0,-(a7)
		lea.l      22(a7),a1
		moveq.l    #7,d2
		move.w     30(a7),d1
		move.w     32(a7),d0
		movea.l    34(a7),a0
		bsr        Awi_contstring
		lea.l      10(a7),a7
		move.l     a0,16(a7)
		movea.l    16(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne        Awi_context_1
		clr.l      -(a7)
		move.w     24(a7),d2
		move.w     26(a7),d1
		movea.l    ACSblk,a0
		move.w     18(a0),d3
		move.w     d3,d0
		lsl.w      #4,d0
		sub.w      d3,d0
		add.w      d0,d0
		movea.l    20(a7),a1
		movea.l    28(a7),a0
		jsr        Ame_strpopup
		addq.w     #4,a7
		move.l     a0,4(a7)
		movea.l    12(a7),a0
		cmpi.w     #$0018,6(a0)
		bne.s      Awi_context_2
		movea.l    12(a7),a0
		move.l     12(a0),8(a7)
		bra.s      Awi_context_3
Awi_context_2:
		clr.l      8(a7)
Awi_context_3:
		move.l     8(a7),d0
		beq.s      Awi_context_4
		movea.l    8(a7),a0
		move.l     8(a0),d0
		beq.s      Awi_context_4
		movea.l    4(a7),a1
		moveq.l    #21,d0
		movea.l    12(a7),a0
		movea.l    8(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		tst.w      d0
		beq.s      Awi_context_4
		move.w     #$0001,(a7)
		bra.s      Awi_context_1
Awi_context_4:
		lea.l      2(a7),a1
		moveq.l    #40,d0
		movea.l    24(a7),a0
		movea.l    24(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		move.w     d0,(a7)
Awi_context_1:
		move.w     (a7),d0
		lea.l      28(a7),a7
		movea.l    (a7)+,a2
		move.w     (a7)+,d3
		rts

	.globl Awi_name
Awi_name:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.w     d0,6(a7)
		movea.l    8(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      Awi_name_1
		bsr        Awi_ontop
		bra.s      Awi_name_2
Awi_name_1:
		clr.w      4(a7)
		bra.s      Awi_name_3
Awi_name_7:
		move.w     4(a7),d0
		lsl.w      #2,d0
		lea.l      _ACSv_winds,a0
		move.l     0(a0,d0.w),(a7)
		move.l     (a7),d0
		beq.s      Awi_name_4
		move.w     6(a7),d0
		beq.s      Awi_name_5
		movea.l    8(a7),a1
		movea.l    (a7),a0
		movea.l    74(a0),a0
		jsr        Ast_cmp
		bra.s      Awi_name_6
Awi_name_5:
		movea.l    8(a7),a1
		movea.l    (a7),a0
		movea.l    74(a0),a0
		jsr        Ast_icmp
Awi_name_6:
		tst.w      d0
		bne.s      Awi_name_4
		movea.l    (a7),a0
		bra.s      Awi_name_2
Awi_name_4:
		addq.w     #1,4(a7)
Awi_name_3:
		cmpi.w     #$0100,4(a7)
		blt.s      Awi_name_7
		movea.l    Aroot_wi,a0
Awi_name_2:
		lea.l      12(a7),a7
		rts

_gs_cmp:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a0
		movea.l    (a0),a1
		movea.l    4(a7),a0
		movea.l    (a0),a0
		jsr        Ast_icmp
		addq.w     #8,a7
		rts

_gs_search:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a0
		movea.l    (a0),a1
		movea.l    4(a7),a0
		jsr        Ast_icmp
		addq.w     #8,a7
		rts

	.globl gs_str2key
gs_str2key:
		lea.l      -48(a7),a7
		move.l     a0,44(a7)
		clr.w      42(a7)
		lea.l      xe0ee8,a0
		lea.l      26(a7),a1
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		lea.l      xe0eeb,a0
		lea.l      8(a7),a1
		moveq.l    #17,d0
gs_str2key_1:
		move.b     (a0)+,(a1)+
		dbf        d0,gs_str2key_1
		lea.l      xe0efe,a0
		lea.l      2(a7),a1
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.w     #$0003,(a7)
		move.l     44(a7),30(a7)
		clr.w      38(a7)
		bra        gs_str2key_2
gs_str2key_8:
		clr.w      40(a7)
		bra.s      gs_str2key_3
gs_str2key_6:
		move.w     40(a7),d1
		move.w     d1,d0
		add.w      d0,d0
		add.w      d1,d0
		add.w      d0,d0
		lea.l      8(a7,d0.w),a0
		jsr        strlen
		move.l     d0,34(a7)
		move.l     34(a7),d0
		move.w     40(a7),d2
		move.w     d2,d1
		add.w      d1,d1
		add.w      d2,d1
		add.w      d1,d1
		lea.l      8(a7,d1.w),a1
		movea.l    30(a7),a0
		jsr        strnicmp
		tst.w      d0
		bne.s      gs_str2key_4
		move.l     34(a7),d1
		movea.l    30(a7),a0
		move.b     0(a0,d1.l),d0
		ext.w      d0
		lea.l      26(a7),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      gs_str2key_4
		move.w     40(a7),d0
		add.w      d0,d0
		move.w     2(a7,d0.w),42(a7)
		moveq.l    #1,d0
		add.l      34(a7),d0
		add.l      d0,30(a7)
		bra.s      gs_str2key_5
gs_str2key_4:
		addq.w     #1,40(a7)
gs_str2key_3:
		move.w     40(a7),d0
		cmp.w      (a7),d0
		blt.w      gs_str2key_6
gs_str2key_5:
		move.w     40(a7),d0
		cmp.w      (a7),d0
		blt.s      gs_str2key_2
		movea.l    30(a7),a0
		move.b     (a0),d0
		ext.w      d0
		or.w       d0,42(a7)
		move.w     #$0001,38(a7)
gs_str2key_2:
		move.w     38(a7),d0
		bne.s      gs_str2key_7
		movea.l    30(a7),a0
		move.b     (a0),d0
		bne        gs_str2key_8
gs_str2key_7:
		move.w     42(a7),d0
		and.w      #$0F00,d0
		beq.s      gs_str2key_9
		ori.w      #$8000,42(a7)
gs_str2key_9:
		move.w     42(a7),d0
		lea.l      48(a7),a7
		rts

	.globl Awi_gemscript
Awi_gemscript:
		move.l     a2,-(a7)
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.w     d0,8(a7)
		move.l     a1,4(a7)
		movea.l    22(a7),a0
		move.w     #$0001,6(a0)
		move.w     _gs_sorted,d0
		bne.s      Awi_gemscript_1
		lea.l      _gs_cmp(pc),a1
		moveq.l    #8,d1
		move.w     _gs_cmd_anzahl,d0
		ext.l      d0
		lea.l      _gs_commands,a0
		jsr        qsort
		move.w     #$0001,_gs_sorted
Awi_gemscript_1:
		pea.l      _gs_search(pc)
		moveq.l    #8,d1
		move.w     _gs_cmd_anzahl,d0
		ext.l      d0
		lea.l      _gs_commands,a1
		movea.l    8(a7),a0
		movea.l    (a0),a0
		jsr        bsearch
		addq.w     #4,a7
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Awi_gemscript_2
		movea.l    (a7),a0
		move.l     4(a0),d0
		beq.s      Awi_gemscript_3
		move.l     22(a7),-(a7)
		movea.l    8(a7),a1
		move.w     12(a7),d0
		movea.l    14(a7),a0
		movea.l    4(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		movea.l    22(a7),a0
		move.w     d0,6(a0)
		bra.s      Awi_gemscript_2
Awi_gemscript_3:
		movea.l    22(a7),a0
		clr.w      6(a0)
Awi_gemscript_2:
		movea.l    22(a7),a0
		move.w     6(a0),d0
		lea.l      14(a7),a7
		movea.l    (a7)+,a2
		rts

gs_CheckCommand:
		lea.l      -10(a7),a7
		move.w     d0,8(a7)
		move.l     a1,4(a7)
		cmpi.w     #$0002,8(a7)
		bge.s      gs_CheckCommand_1
		moveq.l    #2,d0
		bra.s      gs_CheckCommand_2
gs_CheckCommand_1:
		pea.l      _gs_search(pc)
		moveq.l    #8,d1
		move.w     _gs_cmd_anzahl,d0
		ext.l      d0
		lea.l      _gs_commands,a1
		movea.l    8(a7),a0
		movea.l    4(a0),a0
		jsr        bsearch
		addq.w     #4,a7
		move.l     a0,(a7)
		movea.l    14(a7),a0
		movea.l    (a0),a0
		movea.l    (a0),a0
		jsr        Ast_delete
		move.l     (a7),d0
		bne.s      gs_CheckCommand_3
		lea.l      xe0fcf,a0
		bra.s      gs_CheckCommand_4
gs_CheckCommand_3:
		lea.l      xe0fd1,a0
gs_CheckCommand_4:
		jsr        Ast_create
		movea.l    14(a7),a1
		movea.l    (a1),a1
		move.l     a0,(a1)
		movea.l    14(a7),a0
		move.w     #$0001,4(a0)
		movea.l    14(a7),a0
		clr.w      6(a0)
		movea.l    14(a7),a0
		move.w     6(a0),d0
gs_CheckCommand_2:
		lea.l      10(a7),a7
		rts

gs_GetFront:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    8(a7),a0
		movea.l    (a0),a0
		movea.l    (a0),a0
		jsr        Ast_delete
		movea.l    (a7),a0
		movea.l    74(a0),a0
		jsr        Ast_create
		movea.l    8(a7),a1
		movea.l    (a1),a1
		move.l     a0,(a1)
		movea.l    8(a7),a0
		move.w     #$0001,4(a0)
		clr.w      d0
		addq.w     #4,a7
		rts

gs_ToFront:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		bsr        Awi_show
		movea.l    8(a7),a0
		movea.l    (a0),a0
		movea.l    (a0),a0
		jsr        Ast_delete
		lea.l      xe0fd3,a0
		jsr        Ast_create
		movea.l    8(a7),a1
		movea.l    (a1),a1
		move.l     a0,(a1)
		movea.l    8(a7),a0
		move.w     #$0001,4(a0)
		clr.w      d0
		addq.w     #4,a7
		rts

gs_KeyPress:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.w     d0,10(a7)
		move.l     a1,6(a7)
		cmpi.w     #$0002,10(a7)
		bge.s      gs_KeyPress_1
		moveq.l    #2,d0
		bra        gs_KeyPress_2
gs_KeyPress_1:
		moveq.l    #-1,d0
		add.w      10(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      gs_KeyPress_3
		moveq.l    #2,d0
		bra        gs_KeyPress_2
gs_KeyPress_3:
		moveq.l    #-1,d1
		add.w      10(a7),d1
		ext.l      d1
		lsl.l      #2,d1
		clr.w      d0
		movea.l    (a7),a0
		jsr        memset
		clr.w      4(a7)
		bra.s      gs_KeyPress_4
gs_KeyPress_6:
		lea.l      xe0fd5,a0
		jsr        Ast_create
		move.w     4(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a1
		move.l     a0,0(a1,d0.l)
		move.w     4(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		move.l     0(a0,d0.l),d0
		bne.s      gs_KeyPress_5
		moveq.l    #-1,d0
		add.w      10(a7),d0
		movea.l    (a7),a0
		jsr        Ast_deleteAry
		moveq.l    #2,d0
		bra        gs_KeyPress_2
gs_KeyPress_5:
		addq.w     #1,4(a7)
gs_KeyPress_4:
		moveq.l    #-1,d0
		add.w      10(a7),d0
		move.w     4(a7),d1
		cmp.w      d0,d1
		blt.s      gs_KeyPress_6
		movea.l    20(a7),a0
		move.w     4(a0),d0
		movea.l    20(a7),a0
		movea.l    (a0),a0
		jsr        Ast_deleteAry
		moveq.l    #-1,d0
		add.w      10(a7),d0
		movea.l    20(a7),a0
		move.w     d0,4(a0)
		movea.l    20(a7),a0
		move.l     (a7),(a0)
		move.w     #$0001,4(a7)
		bra.s      gs_KeyPress_7
gs_KeyPress_10:
		move.w     4(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    6(a7),a0
		movea.l    0(a0,d0.l),a0
		bsr        gs_str2key
		movea.l    ACSblk,a0
		move.w     d0,718(a0)
		movea.l    12(a7),a0
		jsr        evkeybrd
		addq.w     #1,d0
		bne.s      gs_KeyPress_8
		moveq.l    #48,d0
		bra.s      gs_KeyPress_9
gs_KeyPress_8:
		moveq.l    #49,d0
gs_KeyPress_9:
		movea.l    20(a7),a0
		movea.l    (a0),a0
		movea.l    (a0),a0
		move.b     d0,(a0)
		addq.w     #1,4(a7)
gs_KeyPress_7:
		move.w     4(a7),d0
		cmp.w      10(a7),d0
		blt.s      gs_KeyPress_10
		clr.w      d0
gs_KeyPress_2:
		lea.l      16(a7),a7
		rts

gs_GetAllCommands:
		lea.l      -18(a7),a7
		movea.l    22(a7),a0
		cmpi.w     #$0001,4(a0)
		bne.s      gs_GetAllCommands_1
		movea.l    22(a7),a0
		movea.l    (a0),a0
		movea.l    (a0),a0
		jsr        strlen
		moveq.l    #1,d1
		cmp.l      d0,d1
		bne.s      gs_GetAllCommands_1
		movea.l    22(a7),a0
		movea.l    (a0),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		ext.w      d0
		lea.l      xe0fd7,a0
		jsr        strchr
		move.l     a0,d0
		beq.s      gs_GetAllCommands_1
		move.w     _gs_cmd_anzahl,2(a7)
		move.w     #$0001,(a7)
		bra.s      gs_GetAllCommands_2
gs_GetAllCommands_1:
		move.w     _gs_cmd_anzahl,d0
		movea.l    22(a7),a0
		add.w      4(a0),d0
		move.w     d0,2(a7)
		clr.w      (a7)
gs_GetAllCommands_2:
		move.w     2(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,8(a7)
		move.l     8(a7),d0
		bne.s      gs_GetAllCommands_3
		moveq.l    #2,d0
		bra        gs_GetAllCommands_4
gs_GetAllCommands_3:
		clr.w      16(a7)
		bra.s      gs_GetAllCommands_5
gs_GetAllCommands_7:
		move.w     16(a7),d0
		lsl.w      #3,d0
		lea.l      _gs_commands,a0
		movea.l    0(a0,d0.w),a0
		jsr        Ast_create
		move.w     16(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a1
		move.l     a0,0(a1,d0.l)
		move.w     16(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		move.l     0(a0,d0.l),d0
		bne.s      gs_GetAllCommands_6
		move.w     _gs_cmd_anzahl,d0
		movea.l    8(a7),a0
		jsr        Ast_deleteAry
		moveq.l    #2,d0
		bra        gs_GetAllCommands_4
gs_GetAllCommands_6:
		addq.w     #1,16(a7)
gs_GetAllCommands_5:
		move.w     16(a7),d0
		cmp.w      _gs_cmd_anzahl,d0
		blt.s      gs_GetAllCommands_7
		move.w     (a7),d0
		bne.s      gs_GetAllCommands_8
		movea.l    22(a7),a0
		move.w     4(a0),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    22(a7),a0
		movea.l    (a0),a1
		move.w     _gs_cmd_anzahl,d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    8(a7),a0
		adda.l     d1,a0
		jsr        memcpy
gs_GetAllCommands_8:
		lea.l      _gs_strcmp,a1
		moveq.l    #4,d1
		move.w     2(a7),d0
		ext.l      d0
		movea.l    8(a7),a0
		jsr        qsort
		clr.w      12(a7)
		move.w     #$0001,16(a7)
		bra.s      gs_GetAllCommands_9
gs_GetAllCommands_11:
		move.w     16(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		movea.l    0(a0,d0.l),a1
		move.w     16(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		movea.l    -4(a0,d0.l),a0
		jsr        Ast_icmp
		tst.w      d0
		bne.s      gs_GetAllCommands_10
		addq.w     #1,12(a7)
gs_GetAllCommands_10:
		addq.w     #1,16(a7)
gs_GetAllCommands_9:
		move.w     16(a7),d0
		cmp.w      2(a7),d0
		blt.s      gs_GetAllCommands_11
		move.w     2(a7),d0
		sub.w      12(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,4(a7)
		move.l     4(a7),d0
		beq        gs_GetAllCommands_12
		movea.l    8(a7),a0
		movea.l    4(a7),a1
		move.l     (a0),(a1)
		move.w     #$0001,16(a7)
		move.w     #$0001,14(a7)
		bra.s      gs_GetAllCommands_13
gs_GetAllCommands_16:
		move.w     14(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    4(a7),a0
		movea.l    -4(a0,d0.l),a1
		move.w     16(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		movea.l    0(a0,d0.l),a0
		jsr        Ast_icmp
		tst.w      d0
		beq.s      gs_GetAllCommands_14
		move.w     16(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		move.w     14(a7),d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    4(a7),a1
		move.l     0(a0,d0.l),0(a1,d1.l)
		addq.w     #1,14(a7)
		move.w     16(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		clr.l      0(a0,d0.l)
gs_GetAllCommands_14:
		addq.w     #1,16(a7)
gs_GetAllCommands_13:
		move.w     16(a7),d0
		cmp.w      2(a7),d0
		bge.s      gs_GetAllCommands_15
		move.w     2(a7),d0
		sub.w      12(a7),d0
		move.w     14(a7),d1
		cmp.w      d0,d1
		blt.s      gs_GetAllCommands_16
gs_GetAllCommands_15:
		move.w     2(a7),d0
		movea.l    8(a7),a0
		jsr        Ast_deleteAry
		move.w     12(a7),d0
		sub.w      d0,2(a7)
		bra.s      gs_GetAllCommands_17
gs_GetAllCommands_12:
		move.l     8(a7),4(a7)
gs_GetAllCommands_17:
		move.w     (a7),d0
		beq.s      gs_GetAllCommands_18
		movea.l    22(a7),a0
		move.w     4(a0),d0
		movea.l    22(a7),a0
		movea.l    (a0),a0
		jsr        Ast_deleteAry
		bra.s      gs_GetAllCommands_19
gs_GetAllCommands_18:
		movea.l    22(a7),a0
		movea.l    (a0),a0
		jsr        Ax_free
gs_GetAllCommands_19:
		movea.l    22(a7),a0
		move.l     4(a7),(a0)
		movea.l    22(a7),a0
		move.w     2(a7),4(a0)
		clr.w      d0
gs_GetAllCommands_4:
		lea.l      18(a7),a7
		rts

	.data

init:
		dc.w $0000
cycle:
		dc.w $0000
menu_width:
		dc.w $ffff
winupd:
		dc.w $0000
winoldupd:
		dc.w $0000
msupd:
		dc.w $0000
msoldupd:
		dc.w $0000
exec_path:
		dc.w $0000
		dc.w $0000
exec_com:
		dc.w $0000
		dc.w $0000
empty:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0020
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $00f0
		dc.w $00f0
	.globl Aroot_wi
Aroot_wi:
		dc.w $0000
		dc.w $0000
top_window:
		dc.w $0000
		dc.w $0000
topline:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $001a
		dc.w $0020
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe0d46:
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
		dc.w $0000
		dc.w $0000
xe0dc6:
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
		dc.w $0000
		dc.w $0000
xe0e46:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe0e56:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
next:
		dc.w $0000
dis_arrow_mon:
		dc.l A_arrows
		dc.w $2209
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
dis_arrow_col:
		dc.l A_arrows
		dc.w $2201
		dc.w $0009
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
box_trans:
		dc.w $ffff
xe0ea2:
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe0eaa:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe0eba:
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe0ec2:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe0ed2:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe0ee2:
		dc.w $ffff
		dc.w $0000
		dc.w $0000
xe0ee8:
		dc.b $2b,$2d,0
xe0eeb:
		dc.b 'SHIFT',0
		dc.b 'CTRL',0
		dc.w $0041
		dc.w $4c54
		dc.w $0000
		dc.w $0000
xe0efe:
		dc.w $0200
		dc.w $0400
		dc.w $0800

_gs_commands:
		dc.l xe0f99
		dc.l gs_GetFront
		dc.l xe0fa2
		dc.l gs_ToFront
		dc.l xe0faa
		dc.l gs_CheckCommand
		dc.l xe0fb7
		dc.l gs_KeyPress
		dc.l xe0fc0
		dc.l gs_GetAllCommands
_gs_cmd_anzahl:
		dc.w $0005
_gs_sorted:
		dc.w $0000
xe0f30:
		dc.b 'GEMSUFFIX',0
xe0f3a:
		dc.w $2c00
xe0f3c:
		dc.w $2c00
xe0f3e:
		dc.b 'PRG',0
xe0f42:
		dc.b 'APP',0
xe0f46:
		dc.b 'GTP',0
xe0f4a:
		dc.w $1b48
		dc.w $1b65
		dc.b $00
xe0f4f:                              dc.b $1b
		dc.w $6600
xe0f52:
		dc.b '[end]',0
xe0f58:
		dc.b '[4][Das Erzeugen eines|Dialoges ist fehlgeschlagen!][Abbrechen]',0
xe0f98:
		dc.b 0
xe0f99:
		dc.b 'GetFront',0
xe0fa2:
		dc.b 'ToFront',0
xe0faa:
		dc.b 'CheckCommand',0
xe0fb7:
		dc.b 'KeyPress',0
xe0fc0:
		dc.b 'GetAllCommands',0
xe0fcf:
		dc.b $30,0
xe0fd1:
		dc.b $31,0
xe0fd3:
		dc.b $31,0
xe0fd5:
		dc.b $30,0
xe0fd7:
		dc.b $30,$31,0
		.even
