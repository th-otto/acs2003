	.text

	.globl Awi_keys
Awi_keys:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.w     d1,2(a7)
		move.w     2(a7),d1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		jsr        Awi_keysend
		move.w     d0,(a7)
		cmpi.w     #$FFFF,(a7)
		bge.s      Awi_keys_1
		moveq.l    #-1,d0
		bra.s      Awi_keys_2
Awi_keys_1:
		move.w     (a7),d0
Awi_keys_2:
		lea.l      10(a7),a7
		rts

	.globl Awi_nokey
Awi_nokey:
		subq.w     #6,a7
		move.l     a0,2(a7)
		move.w     d1,(a7)
		move.w     (a7),d0
		bpl.s      Awi_nokey_1
		move.b     1(a7),d0
		ext.w      d0
		sub.w      #$000E,d0
		beq.s      Awi_nokey_2
		bra.s      Awi_nokey_1
Awi_nokey_2:
		movea.l    2(a7),a0
		jsr        Awi_help
		nop
Awi_nokey_1:
		moveq.l    #-1,d0
		addq.w     #6,a7
		rts

	.globl Aob_within
Aob_within:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.w     d0,2(a7)
		move.w     d1,(a7)
		movea.l    4(a7),a0
		move.w     2(a7),d0
		cmp.w      (a0),d0
		bge.s      Aob_within_1
		clr.w      d0
		bra.s      Aob_within_2
Aob_within_1:
		movea.l    4(a7),a0
		move.w     (a7),d0
		cmp.w      2(a0),d0
		bge.s      Aob_within_3
		clr.w      d0
		bra.s      Aob_within_2
Aob_within_3:
		movea.l    4(a7),a0
		move.w     (a0),d0
		movea.l    4(a7),a0
		add.w      4(a0),d0
		move.w     2(a7),d1
		cmp.w      d0,d1
		blt.s      Aob_within_4
		clr.w      d0
		bra.s      Aob_within_2
Aob_within_4:
		movea.l    4(a7),a0
		move.w     2(a0),d0
		movea.l    4(a7),a0
		add.w      6(a0),d0
		move.w     (a7),d1
		cmp.w      d0,d1
		blt.s      Aob_within_5
		clr.w      d0
		bra.s      Aob_within_2
Aob_within_5:
		moveq.l    #1,d0
Aob_within_2:
		addq.w     #8,a7
		rts

	.globl alert_str
alert_str:
		lea.l      -268(a7),a7
		move.l     a0,264(a7)
		move.l     a1,260(a7)
		lea.l      4(a7),a0
		move.l     a0,(a7)
		bra.s      alert_str_1
alert_str_4:
		movea.l    264(a7),a0
		cmpi.b     #$25,(a0)
		bne.s      alert_str_2
		movea.l    264(a7),a0
		cmpi.b     #$73,1(a0)
		bne.s      alert_str_2
		addq.l     #2,264(a7)
		bra.s      alert_str_3
alert_str_2:
		movea.l    264(a7),a0
		addq.l     #1,264(a7)
		movea.l    (a7),a1
		addq.l     #1,(a7)
		move.b     (a0),(a1)
alert_str_1:
		movea.l    264(a7),a0
		move.b     (a0),d0
		bne.s      alert_str_4
alert_str_3:
		movea.l    (a7),a0
		clr.b      (a0)
		moveq.l    #30,d0
		movea.l    260(a7),a1
		movea.l    (a7),a0
		jsr        strncat
		movea.l    264(a7),a1
		movea.l    (a7),a0
		jsr        strcat
		lea.l      4(a7),a0
		moveq.l    #1,d0
		jsr        Awi_alert
		lea.l      268(a7),a7
		rts

dia_obchange:
		lea.l      -24(a7),a7
		move.l     a0,20(a7)
		move.w     d0,18(a7)
		move.w     d1,16(a7)
		movea.l    ACSblk,a0
		move.l     604(a0),12(a7)
		move.w     18(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    12(a7),a0
		adda.l     d0,a0
		move.l     a0,8(a7)
		move.w     18(a7),d0
		movea.l    12(a7),a1
		lea.l      (a7),a0
		jsr        Aob_offset
		movea.l    8(a7),a0
		cmpi.b     #$21,7(a0)
		bne.s      dia_obchange_1
		move.w     18(a7),d0
		movea.l    20(a7),a0
		jsr        Awi_obredraw
		bra.s      dia_obchange_2
dia_obchange_1:
		cmpi.w     #$FFFF,16(a7)
		beq.s      dia_obchange_3
		movea.l    8(a7),a0
		move.w     10(a0),d0
		cmp.w      16(a7),d0
		bne.s      dia_obchange_4
dia_obchange_3:
		move.w     6(a7),-(a7)
		move.w     6(a7),-(a7)
		move.w     6(a7),-(a7)
		movea.l    _globl,a1
		move.w     6(a7),d2
		moveq.l    #6,d1
		move.w     24(a7),d0
		movea.l    18(a7),a0
		jsr        mt_objc_draw
		addq.w     #6,a7
		bra.s      dia_obchange_2
dia_obchange_4:
		moveq.l    #1,d0
		move.w     d0,-(a7)
		move.w     18(a7),-(a7)
		move.w     10(a7),-(a7)
		move.w     10(a7),-(a7)
		move.w     10(a7),-(a7)
		movea.l    _globl,a1
		move.w     10(a7),d2
		clr.w      d1
		move.w     28(a7),d0
		movea.l    22(a7),a0
		jsr        mt_objc_change
		lea.l      10(a7),a7
dia_obchange_2:
		lea.l      24(a7),a7
		rts

dia_redraw:
		subq.w     #4,a7
		move.l     a1,(a7)
		movea.l    (a7),a0
		move.w     6(a0),-(a7)
		movea.l    2(a7),a0
		move.w     4(a0),-(a7)
		movea.l    4(a7),a0
		move.w     2(a0),-(a7)
		movea.l    _globl,a1
		movea.l    6(a7),a0
		move.w     (a0),d2
		moveq.l    #6,d1
		clr.w      d0
		movea.l    ACSblk,a0
		movea.l    604(a0),a0
		jsr        mt_objc_draw
		addq.w     #6,a7
		addq.w     #4,a7
		rts

Aform_do:
		move.l     a2,-(a7)
		lea.l      -28(a7),a7
		move.l     a0,24(a7)
		move.l     a1,20(a7)
		clr.w      14(a7)
		movea.l    ACSblk,a0
		move.l     24(a7),604(a0)
		movea.l    20(a7),a0
		move.w     (a0),d0
		bgt.s      Aform_do_1
		moveq.l    #8,d1
		clr.w      d0
		movea.l    24(a7),a0
		jsr        Aob_findflag
		move.w     d0,18(a7)
		bra.s      Aform_do_2
Aform_do_1:
		movea.l    20(a7),a0
		move.w     (a0),18(a7)
Aform_do_2:
		movea.l    20(a7),a0
		clr.w      (a0)
		move.w     18(a7),d0
		bgt.s      Aform_do_3
		clr.w      18(a7)
Aform_do_3:
		move.w     #$0001,10(a7)
		bra        Aform_do_4
Aform_do_21:
		move.w     18(a7),d0
		beq.s      Aform_do_5
		movea.l    20(a7),a0
		move.w     (a0),d0
		cmp.w      18(a7),d0
		beq.s      Aform_do_5
		movea.l    20(a7),a0
		move.w     18(a7),(a0)
		clr.w      18(a7)
		moveq.l    #8,d0
		movea.l    20(a7),a0
		move.w     (a0),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    24(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      Aform_do_5
		move.l     _globl,-(a7)
		moveq.l    #1,d2
		lea.l      10(a7),a1
		clr.w      d1
		movea.l    24(a7),a0
		move.w     (a0),d0
		movea.l    28(a7),a0
		jsr        mt_objc_edit
		addq.w     #4,a7
Aform_do_5:
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
		clr.l      -(a7)
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
		movea.l    ACSblk,a0
		move.w     712(a0),-(a7)
		movea.l    ACSblk,a1
		lea.l      610(a1),a1
		suba.l     a0,a0
		movea.l    ACSblk,a2
		move.w     710(a2),d2
		movea.l    ACSblk,a2
		move.w     720(a2),d1
		moveq.l    #3,d0
		jsr        mt_evnt_multi
		lea.l      50(a7),a7
		move.w     d0,12(a7)
		movea.l    ACSblk,a0
		move.w     614(a0),d1
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_gemks2n
		movea.l    ACSblk,a0
		move.w     d0,718(a0)
		moveq.l    #1,d0
		and.w      12(a7),d0
		beq        Aform_do_6
		movea.l    ACSblk,a1
		lea.l      718(a1),a1
		movea.l    ACSblk,a0
		lea.l      614(a0),a0
		movea.l    ACSblk,a2
		movea.l    694(a2),a2
		jsr        (a2)
		movea.l    ACSblk,a1
		lea.l      718(a1),a1
		movea.l    ACSblk,a0
		lea.l      614(a0),a0
		movea.l    ACSblk,a2
		movea.l    706(a2),a2
		jsr        (a2)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		beq        Aform_do_6
		clr.w      12(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		movea.l    ACSblk,a0
		move.w     614(a0),d0
		movea.l    24(a7),a0
		jsr        Aob_key
		move.w     d0,8(a7)
		move.w     8(a7),d0
		bmi.s      Aform_do_7
		move.w     8(a7),18(a7)
		move.l     _globl,-(a7)
		lea.l      22(a7),a1
		moveq.l    #1,d1
		move.w     22(a7),d0
		movea.l    28(a7),a0
		jsr        mt_form_button
		addq.w     #4,a7
		move.w     d0,10(a7)
		bra        Aform_do_6
Aform_do_7:
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		and.w      #$0400,d0
		beq.s      Aform_do_8
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		and.w      #$0400,d0
		movea.l    ACSblk,a0
		move.w     718(a0),d1
		and.w      #$1F00,d1
		cmp.w      d1,d0
		bne.s      Aform_do_8
		movea.l    ACSblk,a0
		cmpi.b     #$09,719(a0)
		bne.s      Aform_do_8
		movea.l    24(a7),a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        Aob_chdef
		tst.w      d0
		bne        Aform_do_6
Aform_do_8:
		move.l     _globl,-(a7)
		pea.l      18(a7)
		lea.l      26(a7),a1
		move.l     a1,-(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,d2
		movea.l    32(a7),a0
		move.w     (a0),d1
		movea.l    32(a7),a0
		move.w     (a0),d0
		movea.l    36(a7),a0
		movea.l    (a7)+,a1
		jsr        mt_form_keybd
		addq.w     #8,a7
		move.w     d0,10(a7)
		moveq.l    #32,d0
		movea.l    20(a7),a0
		move.w     (a0),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    24(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      Aform_do_9
		movea.l    20(a7),a0
		move.w     18(a7),d0
		cmp.w      (a0),d0
		ble.s      Aform_do_9
		movea.l    20(a7),a0
		move.w     (a0),18(a7)
Aform_do_9:
		move.w     14(a7),d0
		beq        Aform_do_6
		moveq.l    #8,d0
		movea.l    20(a7),a0
		move.w     (a0),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    24(a7),a0
		and.w      8(a0,d1.l),d0
		beq        Aform_do_6
		movea.l    ACSblk,a0
		move.b     719(a0),d0
		ext.w      d0
		tst.w      d0
		beq.s      Aform_do_10
		subq.w     #3,d0
		beq        Aform_do_11
		subq.w     #1,d0
		beq.s      Aform_do_12
		bra        Aform_do_13
Aform_do_10:
		bra        Aform_do_6
Aform_do_12:
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		and.w      #$8300,d0
		beq.s      Aform_do_11
		move.l     _globl,-(a7)
		moveq.l    #3,d2
		lea.l      10(a7),a1
		clr.w      d1
		movea.l    24(a7),a0
		move.w     (a0),d0
		movea.l    28(a7),a0
		jsr        mt_objc_edit
		addq.w     #4,a7
		movea.l    20(a7),a0
		move.w     (a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    24(a7),a0
		movea.l    12(a0,d0.l),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		move.b     (a0),4(a7)
		movea.l    (a7),a0
		clr.b      (a0)
		move.l     _globl,-(a7)
		moveq.l    #1,d2
		lea.l      10(a7),a1
		clr.w      d1
		movea.l    24(a7),a0
		move.w     (a0),d0
		movea.l    28(a7),a0
		jsr        mt_objc_edit
		addq.w     #4,a7
		movea.l    (a7),a0
		move.b     4(a7),(a0)
		bra        Aform_do_6
Aform_do_11:
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		and.w      #$8300,d0
		beq.s      Aform_do_13
		move.l     _globl,-(a7)
		moveq.l    #3,d2
		lea.l      10(a7),a1
		clr.w      d1
		movea.l    24(a7),a0
		move.w     (a0),d0
		movea.l    28(a7),a0
		jsr        mt_objc_edit
		addq.w     #4,a7
		move.l     _globl,-(a7)
		moveq.l    #1,d2
		lea.l      10(a7),a1
		clr.w      d1
		movea.l    24(a7),a0
		move.w     (a0),d0
		movea.l    28(a7),a0
		jsr        mt_objc_edit
		addq.w     #4,a7
		bra.s      Aform_do_6
Aform_do_13:
		moveq.l    #8,d0
		movea.l    20(a7),a0
		move.w     (a0),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    24(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      Aform_do_6
		move.l     _globl,-(a7)
		moveq.l    #2,d2
		lea.l      10(a7),a1
		move.w     d2,-(a7)
		move.l     a1,-(a7)
		movea.l    ACSblk,a0
		move.w     718(a0),d0
		jsr        nkc_n2gem
		move.w     d0,d1
		movea.l    30(a7),a0
		move.w     (a0),d0
		movea.l    34(a7),a0
		movea.l    (a7)+,a1
		move.w     (a7)+,d2
		jsr        mt_objc_edit
		addq.w     #4,a7
Aform_do_6:
		moveq.l    #2,d0
		and.w      12(a7),d0
		beq        Aform_do_14
		movea.l    ACSblk,a1
		lea.l      716(a1),a1
		movea.l    ACSblk,a0
		lea.l      714(a0),a0
		movea.l    ACSblk,a2
		movea.l    698(a2),a2
		jsr        (a2)
		movea.l    ACSblk,a0
		move.w     612(a0),-(a7)
		movea.l    _globl,a1
		movea.l    ACSblk,a0
		move.w     610(a0),d2
		moveq.l    #6,d1
		clr.w      d0
		movea.l    26(a7),a0
		jsr        mt_objc_find
		addq.w     #2,a7
		move.w     d0,18(a7)
		cmpi.w     #$FFFF,18(a7)
		bne.w      Aform_do_15
		clr.w      18(a7)
		movea.l    ACSblk,a0
		cmpi.w     #$0002,716(a0)
		bne.s      Aform_do_16
		clr.w      10(a7)
		bra.s      Aform_do_17
Aform_do_16:
		movea.l    24(a7),a0
		move.w     10(a0),16(a7)
		moveq.l    #4,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      Aform_do_18
		moveq.l    #7,d1
		moveq.l    #2,d0
		jsr        Bconout
		bra.s      Aform_do_17
Aform_do_18:
		movea.l    _globl,a1
		moveq.l    #1,d2
		or.w       16(a7),d2
		move.w     16(a7),d1
		clr.w      d0
		movea.l    24(a7),a0
		jsr        mt_graf_watchbox
		tst.w      d0
		bne.s      Aform_do_17
		move.w     16(a7),d1
		clr.w      d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		bsr        dia_obchange
Aform_do_17:
		bra.s      Aform_do_14
Aform_do_15:
		moveq.l    #8,d0
		move.w     18(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    24(a7),a0
		and.w      10(a0,d1.l),d0
		bne.s      Aform_do_19
		move.l     _globl,-(a7)
		lea.l      22(a7),a1
		moveq.l    #1,d1
		move.w     22(a7),d0
		movea.l    28(a7),a0
		jsr        mt_form_button
		addq.w     #4,a7
		move.w     d0,10(a7)
		bra.s      Aform_do_14
Aform_do_19:
		clr.w      18(a7)
Aform_do_14:
		move.w     10(a7),d0
		beq.s      Aform_do_20
		move.w     18(a7),d0
		beq.s      Aform_do_4
		movea.l    20(a7),a0
		move.w     18(a7),d0
		cmp.w      (a0),d0
		beq.s      Aform_do_4
Aform_do_20:
		moveq.l    #8,d0
		movea.l    20(a7),a0
		move.w     (a0),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    24(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      Aform_do_4
		move.l     _globl,-(a7)
		moveq.l    #3,d2
		lea.l      10(a7),a1
		clr.w      d1
		movea.l    24(a7),a0
		move.w     (a0),d0
		movea.l    28(a7),a0
		jsr        mt_objc_edit
		addq.w     #4,a7
Aform_do_4:
		move.w     10(a7),d0
		bne        Aform_do_21
		movea.l    ACSblk,a0
		cmpi.w     #$0002,716(a0)
		bne.s      Aform_do_22
		move.w     18(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    24(a7),a0
		ori.w      #$4000,10(a0,d0.l)
		bra.s      Aform_do_23
Aform_do_22:
		move.w     18(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    24(a7),a0
		andi.w     #$BFFF,10(a0,d0.l)
Aform_do_23:
		move.w     18(a7),d0
		lea.l      28(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Act_save
Act_save:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    ACSblk,a0
		movea.l    (a7),a1
		move.l     600(a0),(a1)
		movea.l    ACSblk,a0
		movea.l    (a7),a1
		move.l     604(a0),4(a1)
		movea.l    ACSblk,a0
		movea.l    (a7),a1
		move.w     608(a0),8(a1)
		movea.l    ACSblk,a0
		movea.l    (a7),a1
		move.w     610(a0),10(a1)
		movea.l    ACSblk,a0
		movea.l    (a7),a1
		move.w     612(a0),12(a1)
		movea.l    ACSblk,a0
		movea.l    (a7),a1
		move.w     614(a0),14(a1)
		movea.l    (a7),a0
		lea.l      18(a0),a0
		jsr        Amo_restart
		movea.l    (a7),a0
		move.w     d0,16(a0)
		addq.w     #4,a7
		rts

	.globl Act_restore
Act_restore:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.l     (a0),600(a1)
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.l     4(a0),604(a1)
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.w     8(a0),608(a1)
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.w     10(a0),610(a1)
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.w     12(a0),612(a1)
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		move.w     14(a0),614(a1)
		movea.l    (a7),a0
		lea.l      18(a0),a0
		movea.l    (a7),a1
		move.w     16(a1),d0
		jsr        Amo_return
		addq.w     #4,a7
		rts

	.globl A_isModDia
A_isModDia:
		move.w     a_dialog_active,d0
		ble.s      A_isModDia_1
		moveq.l    #1,d0
		rts
A_isModDia_1:

		clr.w      d0
		rts

A_exdialog:
		move.l     a2,-(a7)
		lea.l      -74(a7),a7
		move.l     a0,70(a7)
		move.w     d0,68(a7)
		jsr        Aev_unhidepointer
		lea.l      40(a7),a0
		bsr        Act_save
		movea.l    70(a7),a0
		jsr        Aob_fix
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.l     106(a0),36(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.l     102(a0),32(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.w     86(a0),4(a7)
		moveq.l    #8,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		lea.l      52(a1),a1
		lea.l      12(a7),a0
		jsr        memcpy
		clr.w      d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.w     d0,54(a0)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.w     d0,52(a0)
		movea.l    ACSblk,a0
		move.w     8(a0),d0
		movea.l    ACSblk,a0
		add.w      12(a0),d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.w     d0,56(a0)
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		movea.l    ACSblk,a0
		add.w      14(a0),d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.w     d0,58(a0)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.l     #dia_redraw,106(a0)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.l     #dia_obchange,102(a0)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		ori.w      #$0008,86(a0)
		clr.w      (a7)
		move.w     68(a7),d0
		beq        A_exdialog_1
		moveq.l    #16,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      A_exdialog_2
		move.l     _globl,-(a7)
		pea.l      30(a7)
		pea.l      32(a7)
		pea.l      34(a7)
		lea.l      36(a7),a1
		movea.l    86(a7),a0
		jsr        mt_form_center
		lea.l      16(a7),a7
		bra.s      A_exdialog_3
A_exdialog_2:
		move.l     _globl,-(a7)
		pea.l      6(a7)
		pea.l      10(a7)
		lea.l      76(a7),a1
		lea.l      78(a7),a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		andi.w     #$FFC0,66(a7)
		andi.w     #$FFC0,64(a7)
		move.w     66(a7),d0
		movea.l    70(a7),a0
		move.w     20(a0),d1
		asr.w      #1,d1
		sub.w      d1,d0
		move.w     d0,20(a7)
		move.w     64(a7),d0
		movea.l    70(a7),a0
		move.w     22(a0),d1
		asr.w      #1,d1
		sub.w      d1,d0
		move.w     d0,22(a7)
A_exdialog_3:
		bra.s      A_exdialog_4
A_exdialog_1:
		moveq.l    #-8,d0
		movea.l    70(a7),a0
		add.w      16(a0),d0
		move.w     d0,20(a7)
		moveq.l    #-8,d0
		movea.l    70(a7),a0
		add.w      18(a0),d0
		move.w     d0,22(a7)
A_exdialog_4:
		moveq.l    #8,d0
		movea.l    70(a7),a0
		add.w      20(a0),d0
		move.w     d0,24(a7)
		moveq.l    #8,d0
		movea.l    70(a7),a0
		add.w      22(a0),d0
		move.w     d0,26(a7)
		addq.w     #1,a_dialog_active
		moveq.l    #3,d0
		jsr        Awi_update
		clr.w      d0
		jsr        Awi_show_menu
		bra        A_exdialog_5
A_exdialog_16:
		movea.l    ACSblk,a1
		addq.w     #8,a1
		lea.l      20(a7),a0
		jsr        fitin
		moveq.l    #4,d0
		add.w      20(a7),d0
		movea.l    70(a7),a0
		move.w     d0,16(a0)
		moveq.l    #4,d0
		add.w      22(a7),d0
		movea.l    70(a7),a0
		move.w     d0,18(a0)
		lea.l      20(a7),a0
		jsr        Aob_save
		move.l     a0,8(a7)
		movea.l    ACSblk,a0
		move.w     14(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     12(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     10(a0),-(a7)
		movea.l    _globl,a1
		movea.l    ACSblk,a0
		move.w     8(a0),d2
		moveq.l    #6,d1
		clr.w      d0
		movea.l    76(a7),a0
		jsr        mt_objc_draw
		addq.w     #6,a7
		clr.w      6(a7)
		bra        A_exdialog_6
A_exdialog_12:
		lea.l      (a7),a1
		movea.l    70(a7),a0
		bsr        Aform_do
		move.w     d0,6(a7)
		move.w     6(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    70(a7),a0
		move.w     8(a0,d0.l),d0
		and.w      #$2000,d0
		beq.s      A_exdialog_7
		bra        A_exdialog_8
A_exdialog_7:
		move.w     6(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    70(a7),a0
		lea.l      24(a0,d0.l),a0
		move.l     a0,28(a7)
		moveq.l    #32,d0
		move.w     6(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    70(a7),a0
		and.w      8(a0,d1.l),d0
		bne        A_exdialog_9
		movea.l    28(a7),a0
		move.w     8(a0),d0
		and.w      #$8000,d0
		beq        A_exdialog_9
		movea.l    28(a7),a0
		move.l     (a0),d0
		beq        A_exdialog_9
		movea.l    ACSblk,a0
		move.l     70(a7),604(a0)
		movea.l    ACSblk,a0
		move.w     6(a7),608(a0)
		movea.l    ACSblk,a0
		clr.w      616(a0)
		movea.l    28(a7),a0
		movea.l    (a0),a0
		jsr        (a0)
		moveq.l    #1,d0
		move.w     6(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    70(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      A_exdialog_10
		moveq.l    #64,d0
		move.w     6(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    70(a7),a0
		and.w      8(a0,d1.l),d0
		bne.s      A_exdialog_10
		moveq.l    #1,d0
		move.w     6(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    70(a7),a0
		and.w      10(a0,d1.l),d0
		beq.s      A_exdialog_10
		move.w     6(a7),d2
		ext.l      d2
		move.l     d2,d0
		add.l      d0,d0
		add.l      d2,d0
		lsl.l      #3,d0
		movea.l    70(a7),a0
		move.w     10(a0,d0.l),d1
		and.w      #$FFFE,d1
		move.w     6(a7),d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		bsr        dia_obchange
A_exdialog_10:
		movea.l    ACSblk,a0
		move.w     616(a0),d0
		beq.s      A_exdialog_11
		bra.s      A_exdialog_8
A_exdialog_11:
		bra.s      A_exdialog_6
A_exdialog_9:
		move.w     6(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    70(a7),a0
		move.w     8(a0,d0.l),d0
		and.w      #$2047,d0
		cmp.w      #$0040,d0
		beq.s      A_exdialog_6
		bra.s      A_exdialog_8
A_exdialog_6:
		bra        A_exdialog_12
A_exdialog_8:
		move.w     6(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    70(a7),a0
		andi.w     #$FFFE,10(a0,d0.l)
		lea.l      20(a7),a1
		movea.l    8(a7),a0
		jsr        Aob_restore
		move.w     6(a7),d0
		bne.s      A_exdialog_13
		movea.l    70(a7),a0
		move.w     10(a0),d0
		and.w      #$4000,d0
		beq.s      A_exdialog_13
		bra        A_exdialog_14
A_exdialog_13:
		move.w     6(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    70(a7),a0
		move.w     8(a0,d0.l),d0
		and.w      #$2000,d0
		bne.s      A_exdialog_15
		bra.s      A_exdialog_14
A_exdialog_15:
		move.l     _globl,-(a7)
		movea.l    ACSblk,a0
		move.w     14(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     12(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     10(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     8(a0),-(a7)
		movea.l    82(a7),a0
		move.w     18(a0),-(a7)
		lea.l      36(a7),a1
		lea.l      34(a7),a0
		movea.l    84(a7),a2
		move.w     16(a2),d2
		movea.l    84(a7),a2
		move.w     22(a2),d1
		movea.l    84(a7),a2
		move.w     20(a2),d0
		jsr        mt_graf_dragbox
		lea.l      14(a7),a7
		subq.w     #4,20(a7)
		subq.w     #4,22(a7)
A_exdialog_5:
		bra        A_exdialog_16
A_exdialog_14:
		movea.l    ACSblk,a0
		clr.w      616(a0)
		moveq.l    #2,d0
		jsr        Awi_update
		subq.w     #1,a_dialog_active
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.l     36(a7),106(a0)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.l     32(a7),102(a0)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.w     4(a7),86(a0)
		moveq.l    #8,d0
		lea.l      12(a7),a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		lea.l      52(a0),a0
		jsr        memcpy
		lea.l      40(a7),a0
		bsr        Act_restore
		moveq.l    #1,d0
		jsr        Awi_show_menu
		move.w     6(a7),d0
		lea.l      74(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl A_dialog
A_dialog:
		subq.w     #4,a7
		move.l     a0,(a7)
		moveq.l    #1,d0
		movea.l    (a7),a0
		bsr        A_exdialog
		addq.w     #4,a7
		rts

	.globl A_dialog2
A_dialog2:
		subq.w     #4,a7
		move.l     a0,(a7)
		clr.w      d0
		movea.l    (a7),a0
		bsr        A_exdialog
		addq.w     #4,a7
		rts

fitin:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		move.w     (a0),d0
		movea.l    (a7),a0
		cmp.w      (a0),d0
		bge.s      fitin_1
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.w     (a0),(a1)
fitin_1:
		movea.l    4(a7),a0
		move.w     2(a0),d0
		movea.l    (a7),a0
		cmp.w      2(a0),d0
		bge.s      fitin_2
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.w     2(a0),2(a1)
fitin_2:
		movea.l    4(a7),a0
		move.w     (a0),d0
		movea.l    4(a7),a0
		add.w      4(a0),d0
		movea.l    (a7),a0
		move.w     (a0),d1
		movea.l    (a7),a0
		add.w      4(a0),d1
		cmp.w      d1,d0
		ble.s      fitin_3
		movea.l    (a7),a0
		move.w     (a0),d0
		movea.l    (a7),a0
		add.w      4(a0),d0
		movea.l    4(a7),a0
		sub.w      4(a0),d0
		movea.l    4(a7),a0
		move.w     d0,(a0)
fitin_3:
		movea.l    4(a7),a0
		move.w     2(a0),d0
		movea.l    4(a7),a0
		add.w      6(a0),d0
		movea.l    (a7),a0
		move.w     2(a0),d1
		movea.l    (a7),a0
		add.w      6(a0),d1
		cmp.w      d1,d0
		ble.s      fitin_4
		movea.l    (a7),a0
		move.w     2(a0),d0
		movea.l    (a7),a0
		add.w      6(a0),d0
		movea.l    4(a7),a0
		sub.w      6(a0),d0
		movea.l    4(a7),a0
		move.w     d0,2(a0)
fitin_4:
		addq.w     #8,a7
		rts

	.globl intersect
intersect:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		movea.l    8(a7),a0
		move.w     (a0),d0
		movea.l    8(a7),a0
		add.w      4(a0),d0
		movea.l    4(a7),a0
		move.w     (a0),d1
		movea.l    4(a7),a0
		add.w      4(a0),d1
		cmp.w      d1,d0
		bge.s      intersect_1
		movea.l    8(a7),a0
		move.w     (a0),d0
		movea.l    8(a7),a0
		add.w      4(a0),d0
		bra.s      intersect_2
intersect_1:
		movea.l    4(a7),a0
		move.w     (a0),d0
		movea.l    4(a7),a0
		add.w      4(a0),d0
intersect_2:
		move.w     d0,2(a7)
		movea.l    8(a7),a0
		move.w     2(a0),d0
		movea.l    8(a7),a0
		add.w      6(a0),d0
		movea.l    4(a7),a0
		move.w     2(a0),d1
		movea.l    4(a7),a0
		add.w      6(a0),d1
		cmp.w      d1,d0
		bge.s      intersect_3
		movea.l    8(a7),a0
		move.w     2(a0),d0
		movea.l    8(a7),a0
		add.w      6(a0),d0
		bra.s      intersect_4
intersect_3:
		movea.l    4(a7),a0
		move.w     2(a0),d0
		movea.l    4(a7),a0
		add.w      6(a0),d0
intersect_4:
		move.w     d0,(a7)
		movea.l    8(a7),a0
		move.w     (a0),d0
		movea.l    4(a7),a0
		cmp.w      (a0),d0
		ble.s      intersect_5
		movea.l    8(a7),a0
		move.w     (a0),d0
		bra.s      intersect_6
intersect_5:
		movea.l    4(a7),a0
		move.w     (a0),d0
intersect_6:
		movea.l    8(a7),a0
		move.w     d0,(a0)
		movea.l    8(a7),a0
		move.w     2(a0),d0
		movea.l    4(a7),a0
		cmp.w      2(a0),d0
		ble.s      intersect_7
		movea.l    8(a7),a0
		move.w     2(a0),d0
		bra.s      intersect_8
intersect_7:
		movea.l    4(a7),a0
		move.w     2(a0),d0
intersect_8:
		movea.l    8(a7),a0
		move.w     d0,2(a0)
		move.w     2(a7),d0
		movea.l    8(a7),a0
		sub.w      (a0),d0
		movea.l    8(a7),a0
		move.w     d0,4(a0)
		move.w     (a7),d0
		movea.l    8(a7),a0
		sub.w      2(a0),d0
		movea.l    8(a7),a0
		move.w     d0,6(a0)
		movea.l    8(a7),a0
		move.w     4(a0),d0
		ble.s      intersect_9
		movea.l    8(a7),a0
		move.w     6(a0),d0
		bgt.s      intersect_10
intersect_9:
		clr.w      d0
		movea.l    8(a7),a0
		move.w     d0,6(a0)
		movea.l    8(a7),a0
		move.w     d0,4(a0)
		clr.w      d0
		bra.s      intersect_11
		bra.s      intersect_11
intersect_10:
		moveq.l    #1,d0
		nop
intersect_11:
		lea.l      12(a7),a7
		rts

	.globl xywh2array
xywh2array:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		addq.l     #2,4(a7)
		move.w     (a0),(a1)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		addq.l     #2,4(a7)
		move.w     2(a0),(a1)
		movea.l    (a7),a0
		move.w     (a0),d0
		movea.l    (a7),a0
		add.w      4(a0),d0
		subq.w     #1,d0
		movea.l    4(a7),a0
		addq.l     #2,4(a7)
		move.w     d0,(a0)
		movea.l    (a7),a0
		move.w     2(a0),d0
		movea.l    (a7),a0
		add.w      6(a0),d0
		subq.w     #1,d0
		movea.l    4(a7),a0
		move.w     d0,(a0)
		addq.w     #8,a7
		rts

	.globl array2xywh
array2xywh:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.w     (a0),(a1)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.w     2(a0),2(a1)
		movea.l    (a7),a0
		move.w     4(a0),d0
		movea.l    4(a7),a0
		sub.w      (a0),d0
		addq.w     #1,d0
		movea.l    4(a7),a0
		move.w     d0,4(a0)
		movea.l    (a7),a0
		move.w     6(a0),d0
		movea.l    4(a7),a0
		sub.w      2(a0),d0
		addq.w     #1,d0
		movea.l    4(a7),a0
		move.w     d0,6(a0)
		addq.w     #8,a7
		rts

scrp_chg:
		lea.l      -32(a7),a7
		move.w     d0,30(a7)
		lea.l      xe1fcc,a0
		lea.l      14(a7),a1
		moveq.l    #15,d0
scrp_chg_1:
		move.b     (a0)+,(a1)+
		dbf        d0,scrp_chg_1
		move.w     #$FFFF,10(a7)
		move.w     #$0050,14(a7)
		movea.l    ACSblk,a0
		move.w     (a0),18(a7)
		moveq.l    #-1,d0
		lea.l      14(a7),a0
		jsr        Ash_sendall
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0400,(a0)
		bge.s      scrp_chg_2
		cmpi.w     #$0200,_ACSv_magix
		blt.s      scrp_chg_3
scrp_chg_2:
		move.l     _globl,-(a7)
		pea.l      14(a7)
		lea.l      20(a7),a1
		lea.l      8(a7),a0
		moveq.l    #2,d0
		jsr        mt_appl_search
		addq.w     #8,a7
		tst.w      d0
		bne.s      scrp_chg_4
		move.w     #$FFFF,10(a7)
scrp_chg_4:
		bra.s      scrp_chg_5
scrp_chg_3:
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		bne.s      scrp_chg_5
		clr.w      10(a7)
scrp_chg_5:
		move.w     10(a7),d0
		bmi.s      scrp_chg_6
		move.w     #$0048,14(a7)
		move.w     30(a7),20(a7)
		movea.l    _globl,a1
		lea.l      14(a7),a0
		moveq.l    #16,d1
		move.w     10(a7),d0
		jsr        mt_appl_write
scrp_chg_6:
		suba.l     a0,a0
		moveq.l    #28,d0
		jsr        Awi_sendall
		lea.l      32(a7),a7
		rts

	.globl Ascrp_clear
Ascrp_clear:
		lea.l      -396(a7),a7
		move.l     a0,392(a7)
		lea.l      xe1fdc,a0
		lea.l      264(a7),a1
		moveq.l    #127,d0
Ascrp_clear_1:
		move.b     (a0)+,(a1)+
		dbf        d0,Ascrp_clear_1
		clr.l      (a7)
		movea.l    ACSblk,a0
		move.b     854(a0),d0
		beq        Ascrp_clear_2
		jsr        Amo_busy
		movea.l    ACSblk,a0
		lea.l      854(a0),a0
		jsr        Af_2drv
		add.b      d0,264(a7)
		movea.l    ACSblk,a1
		lea.l      854(a1),a1
		lea.l      266(a7),a0
		jsr        Af_2path
		lea.l      264(a7),a0
		jsr        Af_readdir
		move.l     a0,(a7)
		move.l     a0,4(a7)
		move.l     4(a7),d0
		beq        Ascrp_clear_3
		bra        Ascrp_clear_4
Ascrp_clear_10:
		movea.l    4(a7),a0
		movea.l    (a0),a1
		lea.l      136(a7),a0
		jsr        Af_2name
		jsr        Ast_toupper
		movea.l    4(a7),a0
		movea.l    (a0),a1
		lea.l      8(a7),a0
		jsr        Af_2ext
		lea.l      xe20e9,a1
		lea.l      136(a7),a0
		jsr        stricmp
		tst.w      d0
		bne.s      Ascrp_clear_5
		move.l     392(a7),d0
		beq.s      Ascrp_clear_6
		movea.l    392(a7),a0
		move.b     (a0),d0
		bne.s      Ascrp_clear_7
Ascrp_clear_6:
		movea.l    4(a7),a0
		movea.l    (a0),a0
		jsr        Fdelete
		tst.l      d0
		beq.s      Ascrp_clear_8
		bra.s      Ascrp_clear_9
Ascrp_clear_8:
		bra.s      Ascrp_clear_5
Ascrp_clear_7:
		movea.l    392(a7),a1
		lea.l      8(a7),a0
		jsr        strcmp
		tst.w      d0
		bne.s      Ascrp_clear_5
		movea.l    4(a7),a0
		movea.l    (a0),a0
		jsr        Fdelete
		tst.l      d0
		beq.s      Ascrp_clear_5
		bra.s      Ascrp_clear_9
Ascrp_clear_5:
		movea.l    4(a7),a0
		move.l     4(a0),4(a7)
Ascrp_clear_4:
		move.l     4(a7),d0
		bne        Ascrp_clear_10
Ascrp_clear_9:
		movea.l    (a7),a0
		jsr        Af_freedir
		move.b     264(a7),d0
		ext.w      d0
		add.w      #$FFBF,d0
		bsr        scrp_chg
Ascrp_clear_3:
		jsr        Amo_unbusy
Ascrp_clear_2:
		lea.l      396(a7),a7
		rts

	.globl Ascrp_get
Ascrp_get:
		lea.l      -406(a7),a7
		move.l     a0,402(a7)
		move.l     a1,398(a7)
		lea.l      xe205c,a0
		lea.l      270(a7),a1
		moveq.l    #127,d0
Ascrp_get_1:
		move.b     (a0)+,(a1)+
		dbf        d0,Ascrp_get_1
		clr.l      2(a7)
		clr.w      (a7)
		movea.l    ACSblk,a0
		move.b     854(a0),d0
		beq        Ascrp_get_2
		jsr        Amo_busy
		move.l     402(a7),d0
		beq.s      Ascrp_get_3
		movea.l    402(a7),a0
		jsr        Ast_toupper
Ascrp_get_3:
		movea.l    ACSblk,a0
		lea.l      854(a0),a0
		jsr        Af_2drv
		add.b      d0,270(a7)
		movea.l    ACSblk,a1
		lea.l      854(a1),a1
		lea.l      272(a7),a0
		jsr        Af_2path
		lea.l      270(a7),a0
		jsr        Af_readdir
		move.l     a0,2(a7)
		move.l     a0,6(a7)
		move.l     6(a7),d0
		beq        Ascrp_get_4
		bra.w      Ascrp_get_5
Ascrp_get_10:
		movea.l    6(a7),a0
		movea.l    (a0),a1
		lea.l      142(a7),a0
		jsr        Af_2name
		jsr        Ast_toupper
		movea.l    6(a7),a0
		movea.l    (a0),a1
		lea.l      14(a7),a0
		jsr        Af_2ext
		jsr        Ast_toupper
		lea.l      xe20ef,a1
		lea.l      142(a7),a0
		jsr        Ast_icmp
		tst.w      d0
		bne.s      Ascrp_get_6
		move.l     402(a7),d0
		beq.s      Ascrp_get_7
		movea.l    402(a7),a0
		move.b     (a0),d0
		beq.s      Ascrp_get_7
		movea.l    402(a7),a0
		cmpi.b     #$2A,(a0)
		bne.s      Ascrp_get_8
Ascrp_get_7:
		bra.s      Ascrp_get_9
		bra.s      Ascrp_get_6
Ascrp_get_8:
		movea.l    402(a7),a1
		lea.l      14(a7),a0
		jsr        Ast_icmp
		tst.w      d0
		bne.s      Ascrp_get_6
		bra.s      Ascrp_get_9
Ascrp_get_6:
		movea.l    6(a7),a0
		move.l     4(a0),6(a7)
Ascrp_get_5:
		move.l     6(a7),d0
		bne.w      Ascrp_get_10
Ascrp_get_9:
		move.l     6(a7),d0
		beq        Ascrp_get_11
		movea.l    6(a7),a0
		movea.l    (a0),a0
		jsr        Af_length
		movea.l    410(a7),a0
		move.l     d0,(a0)
		move.l     398(a7),d0
		bne.s      Ascrp_get_12
		move.w     #$0001,(a7)
		bra        Ascrp_get_13
Ascrp_get_12:
		moveq.l    #1,d0
		movea.l    410(a7),a0
		add.l      (a0),d0
		jsr        Ax_malloc
		movea.l    398(a7),a1
		move.l     a0,(a1)
		movea.l    398(a7),a0
		move.l     (a0),d0
		beq.s      Ascrp_get_13
		clr.w      d0
		movea.l    6(a7),a0
		movea.l    (a0),a0
		jsr        Fopen
		move.l     d0,10(a7)
		move.l     10(a7),d0
		bpl.s      Ascrp_get_14
		movea.l    398(a7),a0
		movea.l    (a0),a0
		jsr        Ax_free
		bra.s      Ascrp_get_13
Ascrp_get_14:
		movea.l    410(a7),a0
		move.l     a0,-(a7)
		movea.l    402(a7),a0
		movea.l    (a0),a0
		movea.l    414(a7),a1
		move.l     (a1),d1
		move.w     16(a7),d0
		jsr        Fread
		movea.l    (a7)+,a0
		cmp.l      (a0),d0
		beq.s      Ascrp_get_15
		movea.l    398(a7),a0
		movea.l    (a0),a0
		jsr        Ax_free
		bra.s      Ascrp_get_16
Ascrp_get_15:
		movea.l    410(a7),a0
		move.l     (a0),d0
		movea.l    398(a7),a0
		movea.l    (a0),a0
		clr.b      0(a0,d0.l)
		move.w     #$0001,(a7)
Ascrp_get_16:
		move.w     12(a7),d0
		jsr        Fclose
Ascrp_get_13:
		move.l     402(a7),d0
		beq.s      Ascrp_get_11
		movea.l    6(a7),a0
		movea.l    (a0),a1
		movea.l    402(a7),a0
		jsr        Af_2ext
Ascrp_get_11:
		movea.l    2(a7),a0
		jsr        Af_freedir
Ascrp_get_4:
		jsr        Amo_unbusy
Ascrp_get_2:
		move.w     (a7),d0
		lea.l      406(a7),a7
		rts

	.globl Ascrp_put
Ascrp_put:
		lea.l      -280(a7),a7
		move.l     a0,276(a7)
		move.l     a1,272(a7)
		move.l     d0,268(a7)
		move.w     d1,266(a7)
		move.w     #$0001,(a7)
		movea.l    ACSblk,a0
		move.b     854(a0),d0
		beq        Ascrp_put_1
		movea.l    276(a7),a0
		move.b     (a0),d0
		beq        Ascrp_put_1
		move.l     276(a7),-(a7)
		pea.l      xe20f5
		movea.l    ACSblk,a1
		lea.l      854(a1),a1
		lea.l      18(a7),a0
		jsr        Af_2path
		movea.l    a0,a1
		move.l     a1,-(a7)
		movea.l    ACSblk,a0
		lea.l      854(a0),a0
		jsr        Af_2drv
		lea.l      150(a7),a0
		movea.l    (a7)+,a1
		jsr        Af_buildname
		addq.w     #8,a7
		jsr        Amo_busy
		lea.l      138(a7),a0
		jsr        Af_length
		move.l     d0,2(a7)
		moveq.l    #-1,d1
		cmp.l      d0,d1
		bne.s      Ascrp_put_2
		clr.w      d0
		bra        Ascrp_put_3
Ascrp_put_2:
		move.w     266(a7),d0
		beq.s      Ascrp_put_4
		move.l     2(a7),d0
		bpl.s      Ascrp_put_5
		clr.w      d0
		lea.l      138(a7),a0
		jsr        Fcreate
		move.l     d0,6(a7)
		bpl.s      Ascrp_put_6
		clr.w      (a7)
Ascrp_put_6:
		bra.s      Ascrp_put_7
Ascrp_put_5:
		moveq.l    #2,d0
		lea.l      138(a7),a0
		jsr        Fopen
		move.l     d0,6(a7)
		bpl.s      Ascrp_put_8
		clr.w      (a7)
		bra.s      Ascrp_put_7
Ascrp_put_8:
		moveq.l    #2,d2
		move.w     8(a7),d1
		moveq.l    #0,d0
		jsr        Fseek
		cmp.l      2(a7),d0
		beq.s      Ascrp_put_7
		clr.w      (a7)
Ascrp_put_7:
		bra.s      Ascrp_put_9
Ascrp_put_4:
		move.l     2(a7),d0
		bmi.s      Ascrp_put_10
		lea.l      138(a7),a0
		jsr        Fdelete
		tst.l      d0
		beq.s      Ascrp_put_10
		clr.w      (a7)
Ascrp_put_10:
		clr.w      d0
		lea.l      138(a7),a0
		jsr        Fcreate
		move.l     d0,6(a7)
		bpl.s      Ascrp_put_9
		clr.w      (a7)
Ascrp_put_9:
		move.w     (a7),d0
		beq.s      Ascrp_put_11
		movea.l    272(a7),a0
		move.l     268(a7),d1
		move.w     8(a7),d0
		jsr        Fwrite
		cmp.l      268(a7),d0
		beq.s      Ascrp_put_12
		move.w     8(a7),d0
		jsr        Fclose
		lea.l      138(a7),a0
		jsr        Fdelete
		clr.w      (a7)
		bra.s      Ascrp_put_11
Ascrp_put_12:
		move.w     8(a7),d0
		jsr        Fclose
		move.b     138(a7),d0
		ext.w      d0
		add.w      #$FFBF,d0
		bsr        scrp_chg
Ascrp_put_11:
		jsr        Amo_unbusy
Ascrp_put_1:
		move.w     (a7),d0
Ascrp_put_3:
		lea.l      280(a7),a7
		rts

	.data

	.globl a_dialog_active
a_dialog_active:
		dc.w $0000
xe1fcc:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe1fdc:
		dc.b 'A:\',0
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe205c:
		dc.b 'A:\',0
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.b '[3][',0
		dc.b '][ OK ]',0
xe20e9:
		dc.b 'SCRAP',0
xe20ef:
		dc.b 'SCRAP',0
xe20f5:
		dc.b 'scrap',0
	.even
