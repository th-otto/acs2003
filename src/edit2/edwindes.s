		.text

	.globl edwi_tme
edwi_tme:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a2
		movea.l    (a2),a0
		ori.w      #$0004,84(a2)
		lea.l      list_menu,a3
		move.l     (a0),(a3)
		movea.l    (a0),a1
		move.l     28(a1),4(a3)
		movea.l    a3,a0
		movea.l    WI_LIST+8,a1
		jsr        (a1)
		andi.w     #$FFFB,84(a2)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl edwi_two
edwi_two:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a2
		movea.l    (a2),a0
		ori.w      #$0004,84(a2)
		lea.l      list_object,a3
		move.l     (a0),(a3)
		movea.l    (a0),a1
		move.l     24(a1),4(a3)
		movea.l    a3,a0
		movea.l    WI_LIST+8,a1
		jsr        (a1)
		andi.w     #$FFFB,84(a2)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl edwi_tic
edwi_tic:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a2
		movea.l    (a2),a0
		ori.w      #$0004,84(a2)
		lea.l      list_icon,a3
		move.l     (a0),(a3)
		movea.l    (a0),a1
		move.l     44(a1),4(a3)
		movea.l    a3,a0
		movea.l    WI_LIST+8,a1
		jsr        (a1)
		andi.w     #$FFFB,84(a2)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl edwi_ref
edwi_ref:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a2
		movea.l    (a2),a0
		ori.w      #$0004,84(a2)
		lea.l      list_reference,a3
		move.l     (a0),(a3)
		movea.l    (a0),a1
		move.l     60(a1),4(a3)
		movea.l    a3,a0
		movea.l    WI_LIST+8,a1
		jsr        (a1)
		andi.w     #$FFFB,84(a2)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl edwi_ok
edwi_ok:
		clr.w      d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        acc_window
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        term
		rts

	.globl edwi_abort
edwi_abort:
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        term
		rts

	.globl edwi_acc
edwi_acc:
		movem.l    d3/a2-a4,-(a7)
		subq.w     #4,a7
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    600(a0),a3
		movea.l    20(a3),a4
		clr.w      584(a0)
		jsr        Adr_next
		move.w     d0,d3
		bmi.w      edwi_acc_1
		ext.l      d0
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		movea.l    (a2),a0
		movea.l    576(a0),a1
		movea.l    20(a1),a0
		lea.l      24(a0,d1.l),a0
		move.l     12(a0),(a7)
		cmpi.w     #$2710,22(a0)
		beq.s      edwi_acc_2
		cmpi.w     #$2711,22(a0)
		beq.s      edwi_acc_2
		cmpi.w     #$2720,22(a0)
		beq.s      edwi_acc_2
		cmpi.w     #$271C,22(a0)
		bne.s      edwi_acc_1
edwi_acc_2:
		jsr        Awi_diaend
		movea.l    (a7),a1
		lea.l      22(a1),a1
		movea.l    (a2),a0
		move.w     608(a0),d0
		movea.l    a4,a0
		jsr        Aob_puttext
		moveq.l    #-1,d1
		movea.l    (a2),a0
		move.w     608(a0),d0
		movea.l    102(a3),a1
		movea.l    a3,a0
		jsr        (a1)
		jsr        Awi_diastart
		move.w     d3,d0
		movea.l    (a2),a0
		movea.l    576(a0),a0
		jsr        Adr_del
edwi_acc_1:
		addq.w     #4,a7
		movem.l    (a7)+,d3/a2-a4
		rts

acc_window:
		movem.l    d3/a2-a5,-(a7)
		lea.l      -156(a7),a7
		move.l     a0,152(a7)
		move.w     d0,d3
		lea.l      xb7a10,a1
		lea.l      66(a7),a0
		moveq.l    #15,d1
acc_window_1:
		move.l     (a1)+,(a0)+
		dbf        d1,acc_window_1
		move.w     (a1)+,(a0)+
		lea.l      xb7a52,a0
		lea.l      (a7),a1
		moveq.l    #15,d1
acc_window_2:
		move.l     (a0)+,(a1)+
		dbf        d1,acc_window_2
		move.w     (a0)+,(a1)+
		movea.l    152(a7),a0
		movea.l    (a0),a0
		movea.l    (a0),a5
		movea.l    4(a0),a1
		movea.l    4(a1),a2
		movea.l    152(a7),a0
		movea.l    20(a0),a3
		lea.l      136(a7),a4
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2376(a3),a0
		jsr        Auo_boxed
		movea.l    (a4),a0
		move.b     (a0),d0
		bne.s      acc_window_3
		tst.w      d3
		bne.s      acc_window_3
		lea.l      WARN_CREATE,a0
		moveq.l    #1,d0
		jsr        Awi_alert
acc_window_3:
		ori.w      #$0001,6(a5)
		clr.w      d0
		moveq.l    #1,d1
		and.w      562(a3),d1
		beq.s      acc_window_4
		or.w       #$0002,d0
acc_window_4:
		moveq.l    #1,d1
		and.w      970(a3),d1
		beq.s      acc_window_5
		or.w       #$1000,d0
acc_window_5:
		moveq.l    #1,d1
		and.w      946(a3),d1
		beq.s      acc_window_6
		or.w       #$0008,d0
acc_window_6:
		moveq.l    #1,d1
		and.w      922(a3),d1
		beq.s      acc_window_7
		or.w       #$0001,d0
acc_window_7:
		moveq.l    #1,d1
		and.w      586(a3),d1
		beq.s      acc_window_8
		or.w       #$0010,d0
acc_window_8:
		moveq.l    #1,d1
		and.w      850(a3),d1
		beq.s      acc_window_9
		or.w       #$0004,d0
acc_window_9:
		moveq.l    #1,d1
		and.w      730(a3),d1
		beq.s      acc_window_10
		or.w       #$0020,d0
acc_window_10:
		moveq.l    #1,d1
		and.w      826(a3),d1
		beq.s      acc_window_11
		or.w       #$0040,d0
acc_window_11:
		moveq.l    #1,d1
		and.w      754(a3),d1
		beq.s      acc_window_12
		or.w       #$0080,d0
acc_window_12:
		moveq.l    #1,d1
		and.w      706(a3),d1
		beq.s      acc_window_13
		or.w       #$0400,d0
acc_window_13:
		moveq.l    #1,d1
		and.w      682(a3),d1
		beq.s      acc_window_14
		or.w       #$0200,d0
acc_window_14:
		moveq.l    #1,d1
		and.w      658(a3),d1
		beq.s      acc_window_15
		or.w       #$0800,d0
acc_window_15:
		moveq.l    #1,d1
		and.w      802(a3),d1
		beq.s      acc_window_16
		or.w       #$0100,d0
acc_window_16:
		moveq.l    #1,d1
		and.w      874(a3),d1
		beq.s      acc_window_17
		or.w       #$4000,d0
acc_window_17:
		moveq.l    #1,d1
		and.w      898(a3),d1
		beq.s      acc_window_18
		or.w       #$2000,d0
acc_window_18:
		move.w     d0,34(a2)
		clr.w      d0
		moveq.l    #1,d1
		and.w      1018(a3),d1
		beq.s      acc_window_19
		or.w       #$0008,d0
acc_window_19:
		moveq.l    #1,d1
		and.w      1066(a3),d1
		beq.s      acc_window_20
		or.w       #$0004,d0
acc_window_20:
		moveq.l    #1,d1
		and.w      1114(a3),d1
		beq.s      acc_window_21
		or.w       #$0001,d0
acc_window_21:
		moveq.l    #1,d1
		and.w      1162(a3),d1
		beq.s      acc_window_22
		or.w       #$0002,d0
acc_window_22:
		moveq.l    #1,d1
		and.w      1210(a3),d1
		beq.s      acc_window_23
		or.w       #$0010,d0
acc_window_23:
		moveq.l    #1,d1
		and.w      1258(a3),d1
		beq.s      acc_window_24
		or.w       #$0100,d0
acc_window_24:
		move.w     d0,84(a2)
		movea.l    152(a7),a0
		movea.l    20(a0),a1
		lea.l      336(a1),a1
		move.l     a1,140(a7)
		movea.l    a4,a1
		movea.l    140(a7),a0
		moveq.l    #3,d0
		jsr        Auo_slider
		pea.l      134(a7)
		lea.l      xb7a94,a1
		movea.l    (a4),a0
		jsr        sscanf
		addq.w     #4,a7
		movea.l    152(a7),a0
		movea.l    20(a0),a1
		lea.l      408(a1),a1
		move.l     a1,140(a7)
		movea.l    a4,a1
		moveq.l    #3,d0
		movea.l    140(a7),a0
		jsr        Auo_slider
		pea.l      132(a7)
		lea.l      xb7a94,a1
		movea.l    (a4),a0
		jsr        sscanf
		addq.w     #4,a7
		move.w     134(a7),d0
		neg.w      d0
		move.w     132(a7),d1
		neg.w      d1
		lsl.w      #8,d1
		or.w       #$00FF,d1
		and.w      d1,d0
		move.w     d0,72(a2)
		pea.l      36(a2)
		lea.l      xb7a94,a1
		movea.l    a3,a0
		moveq.l    #3,d0
		jsr        Aob_scanf
		addq.w     #4,a7
		pea.l      38(a2)
		lea.l      xb7a94,a1
		moveq.l    #5,d0
		movea.l    a3,a0
		jsr        Aob_scanf
		addq.w     #4,a7
		pea.l      40(a2)
		lea.l      xb7a94,a1
		moveq.l    #7,d0
		movea.l    a3,a0
		jsr        Aob_scanf
		addq.w     #4,a7
		pea.l      42(a2)
		lea.l      xb7a94,a1
		moveq.l    #9,d0
		movea.l    a3,a0
		jsr        Aob_scanf
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      1392(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		movea.l    74(a2),a1
		movea.l    a5,a0
		jsr        change_string
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      1416(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		movea.l    78(a2),a1
		movea.l    a5,a0
		jsr        change_string
		addq.w     #4,a7
		move.l     20(a2),148(a7)
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      1872(a3),a0
		jsr        Auo_boxed
		movea.l    (a4),a0
		move.b     (a0),d0
		beq.s      acc_window_25
		movea.l    a0,a1
		movea.l    24(a5),a0
		jsr        find_entry
		move.l     a0,144(a7)
		move.l     a0,d0
		bne.s      acc_window_26
		movea.l    (a4),a1
		lea.l      ERR_OB_DEL,a0
		jsr        alert_str
		bra.s      acc_window_27
acc_window_26:
		movea.l    144(a7),a0
		addq.w     #1,54(a0)
		bra.s      acc_window_27
acc_window_25:
		clr.l      144(a7)
acc_window_27:
		move.l     148(a7),d0
		beq.s      acc_window_28
		movea.l    d0,a1
		movea.l    a5,a0
		jsr        del_object
acc_window_28:
		move.l     144(a7),20(a2)
		move.l     24(a2),148(a7)
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      1824(a3),a0
		jsr        Auo_boxed
		movea.l    (a4),a0
		move.b     (a0),d0
		beq.s      acc_window_29
		movea.l    a0,a1
		movea.l    24(a5),a0
		jsr        find_entry
		move.l     a0,144(a7)
		move.l     a0,d0
		bne.s      acc_window_30
		movea.l    (a4),a1
		lea.l      ERR_OB_DEL,a0
		jsr        alert_str
		bra.s      acc_window_31
acc_window_30:
		movea.l    144(a7),a0
		addq.w     #1,54(a0)
		bra.s      acc_window_31
acc_window_29:
		clr.l      144(a7)
acc_window_31:
		move.l     148(a7),d0
		beq.s      acc_window_32
		movea.l    d0,a1
		movea.l    a5,a0
		jsr        del_object
acc_window_32:
		move.l     144(a7),24(a2)
		move.l     94(a2),148(a7)
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      1776(a3),a0
		jsr        Auo_boxed
		movea.l    (a4),a0
		move.b     (a0),d0
		beq.s      acc_window_33
		movea.l    a0,a1
		movea.l    28(a5),a0
		jsr        find_entry
		move.l     a0,144(a7)
		move.l     a0,d0
		bne.s      acc_window_34
		movea.l    (a4),a1
		lea.l      ERR_ME_DEL,a0
		jsr        alert_str
		bra.s      acc_window_35
acc_window_34:
		movea.l    144(a7),a0
		addq.w     #1,54(a0)
		bra.s      acc_window_35
acc_window_33:
		clr.l      144(a7)
acc_window_35:
		move.l     148(a7),d0
		beq.s      acc_window_36
		movea.l    d0,a1
		movea.l    a5,a0
		jsr        del_menu
acc_window_36:
		move.l     144(a7),94(a2)
		move.l     90(a2),148(a7)
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      1920(a3),a0
		jsr        Auo_boxed
		movea.l    (a4),a0
		move.b     (a0),d0
		beq.s      acc_window_37
		movea.l    a0,a1
		movea.l    44(a5),a0
		jsr        find_entry
		move.l     a0,144(a7)
		move.l     a0,d0
		bne.s      acc_window_38
		movea.l    (a4),a1
		lea.l      ERR_IC_DEL,a0
		jsr        alert_str
		bra.s      acc_window_39
acc_window_38:
		movea.l    144(a7),a0
		addq.w     #1,54(a0)
		bra.s      acc_window_39
acc_window_37:
		clr.l      144(a7)
acc_window_39:
		move.l     148(a7),d0
		beq.s      acc_window_40
		movea.l    d0,a1
		movea.l    a5,a0
		jsr        del_icon
acc_window_40:
		move.l     144(a7),90(a2)
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      1968(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		clr.w      d0
		movea.l    a2,a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2328(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #6,d0
		lea.l      12(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2376(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #7,d0
		lea.l      8(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2424(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #21,d0
		lea.l      4(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2472(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #8,d0
		lea.l      16(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2520(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #9,d0
		lea.l      98(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2568(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #10,d0
		lea.l      102(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2616(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #11,d0
		lea.l      106(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2664(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #12,d0
		lea.l      110(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2712(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #14,d0
		lea.l      114(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2760(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #20,d0
		lea.l      118(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2808(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #15,d0
		lea.l      122(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2856(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #16,d0
		lea.l      126(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2904(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #17,d0
		lea.l      130(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      3000(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #19,d0
		lea.l      134(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      2952(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #18,d0
		lea.l      138(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      3048(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #22,d0
		lea.l      142(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      3096(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #23,d0
		lea.l      146(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		movea.l    a4,a1
		moveq.l    #3,d0
		lea.l      3144(a3),a0
		jsr        Auo_boxed
		move.l     (a4),-(a7)
		moveq.l    #24,d0
		lea.l      150(a2),a1
		movea.l    a5,a0
		jsr        mod_ref
		addq.w     #4,a7
		move.l     158(a2),148(a7)
		lea.l      4(a7),a1
		moveq.l    #3,d0
		lea.l      1608(a3),a0
		jsr        Auo_boxed
		movea.l    4(a7),a0
		jsr        strlen
		addq.l     #1,d0
		move.l     d0,10(a7)
		move.l     d0,14(a7)
		movea.l    4(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      acc_window_41
		move.l     148(a7),d0
		bne.s      acc_window_42
		lea.l      (a7),a1
		movea.l    a5,a0
		jsr        add_string
		move.l     a0,144(a7)
		bra.s      acc_window_43
acc_window_42:
		move.l     4(a7),-(a7)
		movea.l    152(a7),a1
		movea.l    a5,a0
		jsr        change_string
		addq.w     #4,a7
		move.l     a0,144(a7)
		bra.s      acc_window_43
acc_window_41:
		clr.l      144(a7)
acc_window_43:
		move.l     148(a7),d0
		beq.s      acc_window_44
		cmp.l      144(a7),d0
		beq.s      acc_window_44
		movea.l    d0,a1
		movea.l    a5,a0
		jsr        del_string
acc_window_44:
		move.l     144(a7),158(a2)
		move.l     154(a2),148(a7)
		lea.l      70(a7),a1
		moveq.l    #3,d0
		lea.l      1584(a3),a0
		jsr        Auo_boxed
		movea.l    70(a7),a0
		jsr        strlen
		addq.l     #1,d0
		move.l     d0,76(a7)
		move.l     d0,80(a7)
		movea.l    70(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      acc_window_45
		move.l     148(a7),d0
		bne.s      acc_window_46
		lea.l      66(a7),a1
		movea.l    a5,a0
		jsr        add_string
		move.l     a0,144(a7)
		bra.s      acc_window_47
acc_window_46:
		move.l     70(a7),-(a7)
		movea.l    152(a7),a1
		movea.l    a5,a0
		jsr        change_string
		addq.w     #4,a7
		move.l     a0,144(a7)
		bra.s      acc_window_47
acc_window_45:
		clr.l      144(a7)
acc_window_47:
		move.l     148(a7),d0
		beq.s      acc_window_48
		cmp.l      144(a7),d0
		beq.s      acc_window_48
		movea.l    d0,a1
		movea.l    a5,a0
		jsr        del_string
acc_window_48:
		move.l     144(a7),154(a2)
		lea.l      156(a7),a7
		movem.l    (a7)+,d3/a2-a5
		rts

	.globl wi_make
wi_make:
		movem.l    a2-a4,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    4(a0),a3
		movea.l    18(a3),a4
		move.l     a4,d0
		beq.s      wi_make_1
		movea.l    a4,a0
		jsr        Awi_show
		bra        wi_make_2
wi_make_1:
		moveq.l    #8,d0
		jsr        Ax_malloc
		movea.l    a0,a2
		move.l     a2,d0
		beq.s      wi_make_3
		movea.l    (a7),a1
		move.l     (a1),(a0)
		move.l     4(a1),4(a2)
		lea.l      22(a3),a0
		move.l     a0,WI_WINDOW+78
		movea.l    WI_WINDOW+90,a1
		move.l     a0,8(a1)
		lea.l      WI_WINDOW,a0
		jsr        Awi_create
		movea.l    a0,a4
		move.l     a4,d0
		bne.s      wi_make_4
		movea.l    a2,a0
		jsr        Ax_free
		bra.s      wi_make_3
wi_make_4:
		movea.l    (a7),a0
		movea.l    (a0),a1
		pea.l      360(a1)
		lea.l      58(a3),a1
		movea.l    a4,a0
		jsr        wi_pos
		addq.w     #4,a7
		move.l     a2,(a4)
		move.l     a4,18(a3)
		movea.l    a4,a0
		jsr        set_window
		movea.l    a4,a0
		movea.l    12(a4),a1
		jsr        (a1)
		tst.w      d0
		beq.s      wi_make_2
		movea.l    a4,a0
		jsr        term
wi_make_3:
		suba.l     a0,a0
		bra.s      wi_make_5
wi_make_2:
		movea.l    a4,a0
wi_make_5:
		addq.w     #4,a7
		movem.l    (a7)+,a2-a4
		rts

	.globl wi_service
wi_service:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		movea.l    a1,a4
		movea.l    (a0),a3
		cmp.w      #$0024,d0
		beq.s      wi_service_1
		bgt.s      wi_service_2
		subq.w     #2,d0
		beq        wi_service_3
		subq.w     #7,d0
		beq.s      wi_service_4
		bra        wi_service_5
wi_service_2:
		sub.w      #$0025,d0
		beq.s      wi_service_6
		sub.w      #$26EB,d0
		beq        wi_service_7
		bra        wi_service_5
wi_service_6:
		clr.l      2(a4)
		bra        wi_service_8
wi_service_1:
		move.w     #$0001,(a4)
		bra        wi_service_8
wi_service_4:
		movea.l    ACSblk,a0
		movea.l    596(a0),a1
		move.w     (a1),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    576(a0),a1
		movea.l    20(a1),a0
		lea.l      24(a0,d0.l),a0
		move.w     (a4),d2
		sub.w      #$004A,d2
		beq.s      wi_service_9
		subq.w     #2,d2
		beq.s      wi_service_10
		subq.w     #2,d2
		beq.s      wi_service_10
		subq.w     #2,d2
		beq.s      wi_service_11
		bra.s      wi_service_12
wi_service_10:
		cmpi.w     #$2710,22(a0)
		beq.s      wi_service_8
		bra.s      wi_service_13
wi_service_9:
		cmpi.w     #$2711,22(a0)
		beq.s      wi_service_8
		bra.s      wi_service_13
wi_service_11:
		cmpi.w     #$2720,22(a0)
		beq.s      wi_service_8
wi_service_13:
		clr.w      2(a4)
		bra.s      wi_service_8
wi_service_12:
		cmpi.w     #$271C,22(a0)
		beq.s      wi_service_8
		bra.s      wi_service_13
wi_service_3:
		moveq.l    #1,d0
		movea.l    a2,a0
		bsr        acc_window
		movea.l    a2,a0
		jsr        term
		bra.s      wi_service_8
wi_service_7:
		movea.l    4(a3),a1
		movea.l    a2,a0
		jsr        new_name
		bra.s      wi_service_8
wi_service_5:
		movea.l    a4,a1
		move.w     d3,d0
		movea.l    a2,a0
		jsr        Awi_service
		bra.s      wi_service_14
wi_service_8:
		moveq.l    #1,d0
wi_service_14:
		movem.l    (a7)+,d3/a2-a4
		rts

set_window:
		movem.l    d3/a2-a5,-(a7)
		lea.l      -62(a7),a7
		movea.l    a0,a5
		movea.l    (a0),a0
		movea.l    4(a0),a1
		movea.l    4(a1),a2
		movea.l    20(a5),a3
		move.w     34(a2),d3
		lea.l      552(a3),a0
		moveq.l    #2,d0
		and.w      d3,d0
		jsr        set_flag
		lea.l      960(a3),a0
		move.w     d3,d0
		and.w      #$1000,d0
		jsr        set_flag
		lea.l      936(a3),a0
		moveq.l    #8,d0
		and.w      d3,d0
		jsr        set_flag
		lea.l      912(a3),a0
		moveq.l    #1,d0
		and.w      d3,d0
		jsr        set_flag
		lea.l      576(a3),a0
		moveq.l    #16,d0
		and.w      d3,d0
		jsr        set_flag
		lea.l      840(a3),a0
		moveq.l    #4,d0
		and.w      d3,d0
		jsr        set_flag
		lea.l      720(a3),a0
		moveq.l    #32,d0
		and.w      d3,d0
		jsr        set_flag
		lea.l      816(a3),a0
		moveq.l    #64,d0
		and.w      d3,d0
		jsr        set_flag
		lea.l      744(a3),a0
		move.w     #$0080,d0
		and.w      d3,d0
		jsr        set_flag
		lea.l      696(a3),a0
		move.w     d3,d0
		and.w      #$0400,d0
		jsr        set_flag
		lea.l      672(a3),a0
		move.w     d3,d0
		and.w      #$0200,d0
		jsr        set_flag
		lea.l      792(a3),a0
		move.w     d3,d0
		and.w      #$0100,d0
		jsr        set_flag
		lea.l      648(a3),a0
		move.w     d3,d0
		and.w      #$0800,d0
		jsr        set_flag
		lea.l      864(a3),a0
		move.w     d3,d0
		and.w      #$4000,d0
		jsr        set_flag
		lea.l      888(a3),a0
		move.w     d3,d0
		and.w      #$2000,d0
		jsr        set_flag
		move.w     84(a2),d3
		lea.l      1008(a3),a0
		moveq.l    #8,d0
		and.w      d3,d0
		jsr        set_flag
		lea.l      1056(a3),a0
		moveq.l    #4,d0
		and.w      d3,d0
		jsr        set_flag
		lea.l      1104(a3),a0
		moveq.l    #1,d0
		and.w      d3,d0
		jsr        set_flag
		lea.l      1152(a3),a0
		moveq.l    #2,d0
		and.w      d3,d0
		jsr        set_flag
		lea.l      1200(a3),a0
		moveq.l    #16,d0
		and.w      d3,d0
		jsr        set_flag
		lea.l      1248(a3),a0
		move.w     d3,d0
		and.w      #$0100,d0
		jsr        set_flag
		move.l     a5,52(a7)
		lea.l      336(a3),a5
		move.l     a5,56(a7)
		move.w     #$000E,60(a7)
		lea.l      52(a7),a1
		moveq.l    #9,d0
		movea.l    a5,a0
		jsr        Auo_slider
		move.l     #$00000007,44(a7)
		lea.l      44(a7),a1
		moveq.l    #100,d0
		movea.l    a5,a0
		jsr        Auo_slider
		move.l     #$00000001,44(a7)
		lea.l      44(a7),a1
		moveq.l    #101,d0
		movea.l    a5,a0
		jsr        Auo_slider
		move.w     72(a2),d0
		or.w       #$FF00,d0
		neg.w      d0
		cmp.w      #$0008,d0
		beq.s      set_window_1
		bgt.s      set_window_2
		subq.w     #1,d0
		beq.s      set_window_3
		subq.w     #1,d0
		beq.s      set_window_4
		subq.w     #2,d0
		beq.s      set_window_5
		bra.s      set_window_6
set_window_2:
		sub.w      #$0010,d0
		beq.s      set_window_7
		sub.w      #$0010,d0
		beq.s      set_window_8
		sub.w      #$0020,d0
		beq.s      set_window_9
		bra.s      set_window_6
set_window_3:
		clr.l      44(a7)
		bra.s      set_window_6
set_window_4:
		move.l     #$00000001,44(a7)
		bra.s      set_window_6
set_window_5:
		move.l     #$00000002,44(a7)
		bra.s      set_window_6
set_window_1:
		move.l     #$00000003,44(a7)
		bra.s      set_window_6
set_window_7:
		move.l     #$00000004,44(a7)
		bra.s      set_window_6
set_window_8:
		move.l     #$00000005,44(a7)
		bra.s      set_window_6
set_window_9:
		move.l     #$00000006,44(a7)
set_window_6:
		lea.l      44(a7),a1
		moveq.l    #17,d0
		movea.l    a5,a0
		jsr        Auo_slider
		lea.l      8(a7),a4
		move.w     72(a2),d0
		or.w       #$FF00,d0
		neg.w      d0
		move.w     d0,-(a7)
		lea.l      xb7a94,a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a4,a1
		moveq.l    #4,d0
		movea.l    a5,a0
		jsr        Auo_slider
		move.l     #live_snap,(a7)
		move.l     a5,4(a7)
		lea.l      (a7),a1
		moveq.l    #103,d0
		movea.l    a5,a0
		jsr        Auo_slider
		lea.l      408(a3),a5
		move.l     a5,56(a7)
		move.w     #$0011,60(a7)
		lea.l      52(a7),a1
		moveq.l    #9,d0
		movea.l    a5,a0
		jsr        Auo_slider
		move.l     #$00000007,44(a7)
		lea.l      44(a7),a1
		moveq.l    #100,d0
		movea.l    a5,a0
		jsr        Auo_slider
		move.l     #$00000001,44(a7)
		lea.l      44(a7),a1
		moveq.l    #101,d0
		movea.l    a5,a0
		jsr        Auo_slider
		move.w     72(a2),d0
		asr.w      #8,d0
		neg.w      d0
		cmp.w      #$0008,d0
		beq.s      set_window_10
		bgt.s      set_window_11
		subq.w     #1,d0
		beq.s      set_window_12
		subq.w     #1,d0
		beq.s      set_window_13
		subq.w     #2,d0
		beq.s      set_window_14
		bra.s      set_window_15
set_window_11:
		sub.w      #$0010,d0
		beq.s      set_window_16
		sub.w      #$0010,d0
		beq.s      set_window_17
		sub.w      #$0020,d0
		beq.s      set_window_18
		bra.s      set_window_15
set_window_12:
		clr.l      44(a7)
		bra.s      set_window_15
set_window_13:
		move.l     #$00000001,44(a7)
		bra.s      set_window_15
set_window_14:
		move.l     #$00000002,44(a7)
		bra.s      set_window_15
set_window_10:
		move.l     #$00000003,44(a7)
		bra.s      set_window_15
set_window_16:
		move.l     #$00000004,44(a7)
		bra.s      set_window_15
set_window_17:
		move.l     #$00000005,44(a7)
		bra.s      set_window_15
set_window_18:
		move.l     #$00000006,44(a7)
set_window_15:
		lea.l      44(a7),a1
		moveq.l    #17,d0
		movea.l    a5,a0
		jsr        Auo_slider
		move.w     72(a2),d0
		asr.w      #8,d0
		neg.w      d0
		move.w     d0,-(a7)
		lea.l      xb7a94,a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a4,a1
		moveq.l    #4,d0
		movea.l    a5,a0
		jsr        Auo_slider
		move.l     #live_snap,(a7)
		move.l     a5,4(a7)
		lea.l      (a7),a1
		moveq.l    #103,d0
		movea.l    a5,a0
		jsr        Auo_slider
		move.w     36(a2),-(a7)
		lea.l      xb7a94,a1
		moveq.l    #3,d0
		movea.l    a3,a0
		jsr        Aob_printf
		addq.w     #2,a7
		move.w     38(a2),-(a7)
		lea.l      xb7a94,a1
		moveq.l    #5,d0
		movea.l    a3,a0
		jsr        Aob_printf
		addq.w     #2,a7
		move.w     40(a2),-(a7)
		lea.l      xb7a94,a1
		moveq.l    #7,d0
		movea.l    a3,a0
		jsr        Aob_printf
		addq.w     #2,a7
		move.w     42(a2),-(a7)
		lea.l      xb7a94,a1
		moveq.l    #9,d0
		movea.l    a3,a0
		jsr        Aob_printf
		addq.w     #2,a7
		move.l     74(a2),48(a7)
		movea.l    48(a7),a0
		movea.l    4(a0),a1
		moveq.l    #58,d0
		movea.l    a3,a0
		jsr        Aob_puttext
		move.l     78(a2),48(a7)
		movea.l    48(a7),a0
		movea.l    4(a0),a1
		moveq.l    #59,d0
		movea.l    a3,a0
		jsr        Aob_puttext
		movea.l    a4,a1
		movea.l    20(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      1872(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    24(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      1824(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    94(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      1776(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    90(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      1920(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    (a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      1968(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    12(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2328(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    8(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2376(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    4(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2424(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    16(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2472(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    98(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2520(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    102(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2568(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    106(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2616(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    110(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2664(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    114(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2712(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    118(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2760(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    122(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2808(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    126(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2856(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    130(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2904(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    134(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      3000(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    138(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      2952(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    142(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      3048(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    146(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      3096(a3),a0
		jsr        Auo_boxed
		movea.l    a4,a1
		movea.l    150(a2),a0
		jsr        set_ref
		movea.l    a4,a1
		moveq.l    #4,d0
		lea.l      3144(a3),a0
		jsr        Auo_boxed
		move.l     158(a2),d0
		beq.s      set_window_19
		move.l     d0,48(a7)
		movea.l    d0,a0
		movea.l    4(a0),a1
		movea.l    a3,a0
		moveq.l    #67,d0
		jsr        Aob_puttext
		bra.s      set_window_20
set_window_19:
		lea.l      xb7a96,a1
		moveq.l    #67,d0
		movea.l    a3,a0
		jsr        Aob_puttext
set_window_20:
		move.l     154(a2),d0
		beq.s      set_window_21
		move.l     d0,48(a7)
		movea.l    d0,a0
		movea.l    4(a0),a1
		movea.l    a3,a0
		moveq.l    #66,d0
		jsr        Aob_puttext
		bra.s      set_window_22
set_window_21:
		lea.l      xb7a96,a1
		moveq.l    #66,d0
		movea.l    a3,a0
		jsr        Aob_puttext
set_window_22:
		lea.l      62(a7),a7
		movem.l    (a7)+,d3/a2-a5
		rts

live_snap:
		move.l     d3,-(a7)
		subq.w     #6,a7
		move.w     d0,d1
		cmp.w      #$0006,d1
		bhi.s      live_snap_1
		add.w      d1,d1
		move.w     J9(pc,d1.w),d1
		jmp        J9(pc,d1.w)
J9:
		dc.w live_snap_2-J9
		dc.w live_snap_3-J9
		dc.w live_snap_4-J9
		dc.w live_snap_5-J9
		dc.w live_snap_6-J9
		dc.w live_snap_7-J9
		dc.w live_snap_8-J9
live_snap_2:
		moveq.l    #1,d3
		bra.s      live_snap_1
live_snap_3:
		moveq.l    #2,d3
		bra.s      live_snap_1
live_snap_4:
		moveq.l    #4,d3
		bra.s      live_snap_1
live_snap_5:
		moveq.l    #8,d3
		bra.s      live_snap_1
live_snap_6:
		moveq.l    #16,d3
		bra.s      live_snap_1
live_snap_7:
		moveq.l    #32,d3
		bra.s      live_snap_1
live_snap_8:
		moveq.l    #64,d3
live_snap_1:
		moveq.l    #10,d1
		lea.l      (a7),a0
		move.w     d3,d0
		jsr        itoa
		addq.w     #6,a7
		move.l     (a7)+,d3
		rts

term:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		movea.l    (a0),a3
		movea.l    4(a3),a1
		clr.l      18(a1)
		move.w     86(a2),d0
		and.w      #$0800,d0
		beq.s      term_1
		lea.l      44(a2),a1
		movea.l    4(a3),a0
		lea.l      58(a0),a0
		moveq.l    #8,d0
		jsr        memcpy
		bra.s      term_2
term_1:
		moveq.l    #8,d0
		lea.l      36(a2),a1
		movea.l    4(a3),a0
		lea.l      58(a0),a0
		jsr        memcpy
term_2:
		movea.l    a3,a0
		jsr        Ax_free
		movea.l    a2,a0
		jsr        Awi_delete
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.data


xb7a10:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.b 'STGUIDE_01',0
		dc.b $00
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xb7a52:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.b 'HELPFILE_01',0
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000

xb7a94: dc.b '%d'
xb7a96: dc.b 0
	.even
