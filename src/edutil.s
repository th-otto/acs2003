		.text
		
		.globl set_flag
set_flag:
		subq.w     #6,a7
		move.w     d0,4(a7)
		move.l     a0,(a7)
		move.w     4(a7),d0
		beq.s      set_flag_1
		movea.l    (a7),a0
		ori.w      #1,10(a0)
		bra.s      set_flag_2
set_flag_1:
		movea.l    (a7),a0
		andi.w     #0xFFFE,10(a0)
set_flag_2:
		addq.w     #6,a7
		rts

	.globl mod_ref
mod_ref:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.l     a1,6(a7)
		move.w     d0,4(a7)
		movea.l    6(a7),a0
		move.l     (a0),(a7)
		movea.l    18(a7),a0
		move.b     (a0),d0
		beq.s      mod_ref_1
		move.w     4(a7),d0
		movea.l    18(a7),a1
		movea.l    10(a7),a0
		jsr        dup_ref
		movea.l    6(a7),a1
		move.l     a0,(a1)
		bra.s      mod_ref_2
mod_ref_1:
		movea.l    6(a7),a0
		clr.l      (a0)
mod_ref_2:
		move.l     (a7),d0
		beq.s      mod_ref_3
		movea.l    (a7),a1
		movea.l    10(a7),a0
		jsr        del_ref
mod_ref_3:
		lea.l      14(a7),a7
		rts

	.globl set_ref
set_ref:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		move.l     4(a7),d0
		bne.s      set_ref_1
		movea.l    (a7),a0
		clr.b      (a0)
		bra.s      set_ref_2
set_ref_1:
		movea.l    4(a7),a1
		lea.l      22(a1),a1
		movea.l    (a7),a0
		jsr        strcpy
set_ref_2:
		addq.w     #8,a7
		rts

	.globl set_val
set_val:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		move.l     4(a7),d0
		bne.s      set_val_1
		movea.l    (a7),a0
		clr.b      (a0)
		bra.s      set_val_2
set_val_1:
		movea.l    4(a7),a0
		movea.l    4(a0),a1
		movea.l    (a7),a0
		jsr        strcpy
set_val_2:
		addq.w     #8,a7
		rts

	.globl A_rubberbox
A_rubberbox:
		move.l     a2,-(a7)
		lea.l      -86(a7),a7
		move.w     d0,84(a7)
		move.w     d1,82(a7)
		move.w     d2,80(a7)
		move.l     a0,76(a7)
		move.l     a1,72(a7)
		lea.l      INFO_OB_WH,a0
		jsr        Aob_create
		move.l     a0,16(a7)
		beq        A_rubberbox_1
		movea.l    16(a7),a0
		jsr        Aob_fix
		move.w     84(a7),d0
		movea.l    16(a7),a0
		sub.w      20(a0),d0
		movea.l    16(a7),a0
		move.w     d0,16(a0)
		move.w     82(a7),d0
		movea.l    16(a7),a0
		sub.w      22(a0),d0
		movea.l    16(a7),a0
		move.w     d0,18(a0)
		movea.l    16(a7),a0
		move.w     16(a0),d0
		bmi.s      A_rubberbox_2
		movea.l    16(a7),a0
		move.w     18(a0),d0
		bpl.s      A_rubberbox_3
A_rubberbox_2:
		movea.l    16(a7),a0
		jsr        Aob_delete
		clr.l      16(a7)
		bra        A_rubberbox_1
A_rubberbox_3:
		movea.l    16(a7),a0
		move.w     22(a0),d1
		movea.l    16(a7),a0
		move.w     20(a0),d0
		jsr        Abp_create
		move.l     a0,12(a7)
		beq.s      A_rubberbox_1
		movea.l    16(a7),a0
		move.w     16(a0),d0
		move.w     d0,20(a7)
		moveq.l    #-1,d1
		movea.l    16(a7),a0
		add.w      20(a0),d1
		move.w     d1,32(a7)
		add.w      d1,d0
		move.w     d0,24(a7)
		movea.l    16(a7),a0
		move.w     18(a0),d0
		move.w     d0,22(a7)
		moveq.l    #-1,d1
		movea.l    16(a7),a0
		add.w      22(a0),d1
		move.w     d1,34(a7)
		add.w      d1,d0
		move.w     d0,26(a7)
		clr.w      d0
		move.w     d0,30(a7)
		move.w     d0,28(a7)
		jsr        Amo_hide
		move.l     12(a7),-(a7)
		movea.l    ACSblk,a1
		lea.l      618(a1),a1
		lea.l      24(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vro_cpyfm
		addq.w     #4,a7
		jsr        Amo_show
A_rubberbox_1:
		move.w     imagesnap,d0
		asr.w      #1,d0
		move.w     d0,58(a7)
		move.w     58(a7),d0
		bne.s      A_rubberbox_4
		move.w     #1,58(a7)
A_rubberbox_4:
		moveq.l    #-1,d0
		add.w      imagesnap,d0
		not.w      d0
		move.w     d0,56(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      68(a0),a0
		jsr        Amo_new
		clr.w      d0
		move.w     d0,38(a7)
		move.w     d0,36(a7)
		movea.l    ACSblk,a0
		move.w     8(a0),d0
		movea.l    ACSblk,a0
		add.w      12(a0),d0
		move.w     d0,40(a7)
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		movea.l    ACSblk,a0
		add.w      14(a0),d0
		move.w     d0,42(a7)
		lea.l      36(a7),a0
		moveq.l    #1,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		move.w     84(a7),d0
		add.w      96(a7),d0
		subq.w     #1,d0
		move.w     d0,66(a7)
		move.w     82(a7),d0
		add.w      98(a7),d0
		subq.w     #1,d0
		move.w     d0,64(a7)
		move.w     84(a7),d0
		add.w      80(a7),d0
		subq.w     #1,d0
		move.w     d0,70(a7)
		move.w     82(a7),d0
		add.w      94(a7),d0
		subq.w     #1,d0
		move.w     d0,68(a7)
		move.l     _globl,-(a7)
		pea.l      64(a7)
		pea.l      70(a7)
		lea.l      56(a7),a1
		lea.l      58(a7),a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		bra        A_rubberbox_5
A_rubberbox_24:
		move.w     46(a7),d0
		sub.w      84(a7),d0
		add.w      58(a7),d0
		and.w      56(a7),d0
		add.w      84(a7),d0
		subq.w     #1,d0
		move.w     d0,46(a7)
		move.w     44(a7),d0
		sub.w      82(a7),d0
		add.w      58(a7),d0
		and.w      56(a7),d0
		add.w      82(a7),d0
		subq.w     #1,d0
		move.w     d0,44(a7)
		move.w     46(a7),50(a7)
		move.w     44(a7),48(a7)
		move.w     50(a7),d0
		cmp.w      66(a7),d0
		ble.s      A_rubberbox_6
		move.w     66(a7),50(a7)
A_rubberbox_6:
		move.w     48(a7),d0
		cmp.w      64(a7),d0
		ble.s      A_rubberbox_7
		move.w     64(a7),48(a7)
A_rubberbox_7:
		move.w     50(a7),d0
		cmp.w      70(a7),d0
		bge.s      A_rubberbox_8
		move.w     70(a7),50(a7)
A_rubberbox_8:
		move.w     48(a7),d0
		cmp.w      68(a7),d0
		bge.s      A_rubberbox_9
		move.w     68(a7),48(a7)
A_rubberbox_9:
		moveq.l    #1,d0
		and.w      62(a7),d0
		beq.s      A_rubberbox_10
		moveq.l    #2,d0
		and.w      62(a7),d0
		beq        A_rubberbox_11
A_rubberbox_10:
		lea.l      36(a7),a0
		clr.w      d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		move.w     50(a7),d0
		sub.w      84(a7),d0
		addq.w     #1,d0
		movea.l    76(a7),a0
		move.w     d0,(a0)
		move.w     48(a7),d0
		sub.w      82(a7),d0
		addq.w     #1,d0
		movea.l    72(a7),a0
		move.w     d0,(a0)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      56(a0),a0
		jsr        Amo_new
		move.l     16(a7),d0
		beq        A_rubberbox_12
		move.l     12(a7),d0
		beq        A_rubberbox_13
		movea.l    16(a7),a0
		move.w     16(a0),d0
		move.w     d0,28(a7)
		moveq.l    #-1,d1
		movea.l    16(a7),a0
		add.w      20(a0),d1
		move.w     d1,24(a7)
		add.w      d1,d0
		move.w     d0,32(a7)
		movea.l    16(a7),a0
		move.w     18(a0),d0
		move.w     d0,30(a7)
		moveq.l    #-1,d1
		movea.l    16(a7),a0
		add.w      22(a0),d1
		move.w     d1,26(a7)
		add.w      d1,d0
		move.w     d0,34(a7)
		clr.w      d0
		move.w     d0,22(a7)
		move.w     d0,20(a7)
		jsr        Amo_hide
		movea.l    ACSblk,a0
		pea.l      618(a0)
		movea.l    16(a7),a1
		lea.l      24(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vro_cpyfm
		addq.w     #4,a7
		jsr        Amo_show
		movea.l    12(a7),a0
		jsr        Abp_delete
		bra        A_rubberbox_14
A_rubberbox_13:
		movea.l    16(a7),a0
		move.w     18(a0),d0
		movea.l    16(a7),a0
		add.w      22(a0),d0
		subq.w     #1,d0
		move.w     d0,-(a7)
		movea.l    18(a7),a0
		move.w     16(a0),d0
		movea.l    18(a7),a0
		add.w      20(a0),d0
		subq.w     #1,d0
		move.w     d0,-(a7)
		movea.l    20(a7),a0
		move.w     18(a0),-(a7)
		movea.l    22(a7),a0
		move.w     16(a0),-(a7)
		movea.l    24(a7),a0
		move.w     18(a0),d0
		movea.l    24(a7),a0
		add.w      22(a0),d0
		subq.w     #1,d0
		move.w     d0,-(a7)
		movea.l    26(a7),a0
		move.w     16(a0),d0
		movea.l    26(a7),a0
		add.w      20(a0),d0
		subq.w     #1,d0
		move.w     d0,-(a7)
		movea.l    _globl,a0
		movea.l    28(a7),a1
		move.w     18(a1),d2
		movea.l    28(a7),a1
		move.w     16(a1),d1
		moveq.l    #3,d0
		jsr        mt_form_dial
		lea.l      12(a7),a7
A_rubberbox_14:
		movea.l    16(a7),a0
		jsr        Aob_delete
A_rubberbox_12:
		jsr        Aev_release
		moveq.l    #2,d0
		and.w      62(a7),d0
		beq.s      A_rubberbox_15
		clr.w      d0
		bra        A_rubberbox_16
		bra.s      A_rubberbox_11
A_rubberbox_15:
		moveq.l    #1,d0
		bra        A_rubberbox_16
A_rubberbox_11:
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #0x0100,d0
		jsr        mt_graf_mouse
		moveq.l    #3,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vswr_mode
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_color
		move.w     82(a7),d2
		move.w     50(a7),d1
		move.w     84(a7),d0
		jsr        dotted_xline
		move.w     48(a7),d2
		move.w     50(a7),d1
		move.w     84(a7),d0
		jsr        dotted_xline
		move.w     84(a7),d2
		move.w     48(a7),d1
		move.w     82(a7),d0
		jsr        dotted_yline
		move.w     50(a7),d2
		move.w     48(a7),d1
		move.w     82(a7),d0
		jsr        dotted_yline
		move.l     16(a7),d0
		beq        A_rubberbox_17
		move.w     48(a7),d0
		sub.w      82(a7),d0
		addq.w     #1,d0
		ext.l      d0
		movea.l    ACSblk,a0
		divs.w     20(a0),d0
		move.w     d0,-(a7)
		move.w     52(a7),d0
		sub.w      86(a7),d0
		addq.w     #1,d0
		ext.l      d0
		movea.l    ACSblk,a0
		divs.w     18(a0),d0
		move.w     d0,-(a7)
		lea.l      xa46f8,a1
		lea.l      4(a7),a0
		jsr        sprintf
		addq.w     #4,a7
		lea.l      (a7),a1
		moveq.l    #1,d0
		movea.l    16(a7),a0
		jsr        Aob_puttext
		move.w     48(a7),d0
		sub.w      82(a7),d0
		addq.w     #1,d0
		move.w     d0,-(a7)
		move.w     52(a7),d0
		sub.w      86(a7),d0
		addq.w     #1,d0
		move.w     d0,-(a7)
		lea.l      xa46fe,a1
		lea.l      4(a7),a0
		jsr        sprintf
		addq.w     #4,a7
		lea.l      (a7),a1
		moveq.l    #2,d0
		movea.l    16(a7),a0
		jsr        Aob_puttext
		movea.l    16(a7),a0
		move.w     18(a0),d0
		movea.l    16(a7),a0
		add.w      22(a0),d0
		subq.w     #1,d0
		move.w     d0,-(a7)
		movea.l    18(a7),a0
		move.w     16(a0),d0
		movea.l    18(a7),a0
		add.w      20(a0),d0
		subq.w     #1,d0
		move.w     d0,-(a7)
		movea.l    20(a7),a0
		move.w     18(a0),-(a7)
		movea.l    _globl,a1
		movea.l    22(a7),a0
		move.w     16(a0),d2
		moveq.l    #2,d1
		clr.w      d0
		movea.l    22(a7),a0
		jsr        mt_objc_draw
		addq.w     #6,a7
A_rubberbox_17:
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #0x0101,d0
		jsr        mt_graf_mouse
		bra.s      A_rubberbox_18
A_rubberbox_23:
		move.l     _globl,-(a7)
		pea.l      64(a7)
		pea.l      70(a7)
		lea.l      64(a7),a1
		lea.l      66(a7),a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		moveq.l    #1,d0
		and.w      62(a7),d0
		beq.s      A_rubberbox_19
		moveq.l    #2,d0
		and.w      62(a7),d0
		beq.s      A_rubberbox_20
A_rubberbox_19:
		bra.s      A_rubberbox_21
A_rubberbox_20:
		move.w     54(a7),d0
		sub.w      46(a7),d0
		cmp.w      58(a7),d0
		bgt.s      A_rubberbox_22
		move.w     46(a7),d0
		sub.w      54(a7),d0
		cmp.w      58(a7),d0
		bgt.s      A_rubberbox_22
		move.w     52(a7),d0
		sub.w      44(a7),d0
		cmp.w      58(a7),d0
		bgt.s      A_rubberbox_22
		move.w     44(a7),d0
		sub.w      52(a7),d0
		cmp.w      58(a7),d0
		ble.s      A_rubberbox_18
A_rubberbox_22:
		bra.s      A_rubberbox_21
A_rubberbox_18:
		bra.s      A_rubberbox_23
A_rubberbox_21:
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #0x0100,d0
		jsr        mt_graf_mouse
		moveq.l    #3,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vswr_mode
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_color
		move.w     82(a7),d2
		move.w     50(a7),d1
		move.w     84(a7),d0
		jsr        dotted_xline
		move.w     48(a7),d2
		move.w     50(a7),d1
		move.w     84(a7),d0
		jsr        dotted_xline
		move.w     84(a7),d2
		move.w     48(a7),d1
		move.w     82(a7),d0
		jsr        dotted_yline
		move.w     50(a7),d2
		move.w     48(a7),d1
		move.w     82(a7),d0
		jsr        dotted_yline
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #0x0101,d0
		jsr        mt_graf_mouse
		move.w     54(a7),46(a7)
		move.w     52(a7),44(a7)
A_rubberbox_5:
		bra        A_rubberbox_24
A_rubberbox_16:
		lea.l      86(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl view_grow
view_grow:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      view_grow_1
		movea.l    (a7),a0
		move.w     42(a0),-(a7)
		movea.l    2(a7),a0
		move.w     40(a0),-(a7)
		movea.l    4(a7),a0
		move.w     38(a0),-(a7)
		movea.l    6(a7),a0
		move.w     36(a0),-(a7)
		clr.w      -(a7)
		movea.l    _globl,a0
		clr.w      d2
		clr.w      d1
		clr.w      d0
		jsr        mt_graf_growbox
		lea.l      10(a7),a7
view_grow_1:
		movea.l    (a7),a0
		ori.w      #0x0010,86(a0)
		movea.l    (a7),a1
		lea.l      36(a1),a1
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    134(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

	.globl view_shrink
view_shrink:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		and.w      14(a0),d0
		beq.s      view_shrink_1
		movea.l    (a7),a0
		move.w     42(a0),-(a7)
		movea.l    2(a7),a0
		move.w     40(a0),-(a7)
		movea.l    4(a7),a0
		move.w     38(a0),-(a7)
		movea.l    6(a7),a0
		move.w     36(a0),-(a7)
		clr.w      -(a7)
		movea.l    _globl,a0
		clr.w      d2
		clr.w      d1
		clr.w      d0
		jsr        mt_graf_shrinkbox
		lea.l      10(a7),a7
view_shrink_1:
		movea.l    (a7),a0
		ori.w      #0x0010,86(a0)
		movea.l    (a7),a1
		lea.l      36(a1),a1
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    134(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

	.globl new_name
new_name:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.l     a1,2(a7)
		movea.l    6(a7),a0
		movea.l    90(a0),a0
		movea.l    8(a0),a0
		jsr        Ast_delete
		movea.l    6(a7),a0
		movea.l    78(a0),a0
		jsr        Ast_delete
		movea.l    2(a7),a0
		lea.l      22(a0),a0
		jsr        Ast_create
		movea.l    6(a7),a1
		movea.l    90(a1),a1
		move.l     a0,8(a1)
		movea.l    2(a7),a0
		lea.l      22(a0),a0
		jsr        Ast_create
		movea.l    6(a7),a1
		move.l     a0,78(a1)
		movea.l    6(a7),a0
		move.w     32(a0),(a7)
		move.w     (a7),d0
		bmi.s      new_name_1
		clr.w      -(a7)
		clr.w      -(a7)
		movea.l    10(a7),a0
		move.l     78(a0),-(a7)
		moveq.l    #3,d1
		move.w     8(a7),d0
		jsr        wind_set
		addq.w     #8,a7
new_name_1:
		lea.l      10(a7),a7
		rts

	.globl chk_new_label
chk_new_label:
		lea.l      -128(a7),a7
		lea.l      (a7),a1
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		movea.l    604(a0),a0
		jsr        Aob_gettext
		move.b     (a7),d0
		beq.s      chk_new_label_1
		movea.l    ACSblk,a0
		move.w     #0x0001,616(a0)
chk_new_label_1:
		lea.l      128(a7),a7
		rts

	.globl newlabel
newlabel:
		lea.l      -140(a7),a7
		move.l     a0,136(a7)
		move.l     a1,132(a7)
		lea.l      WI_NEW_LABEL,a0
		movea.l    WI_NEW_LABEL+8,a1
		jsr        (a1)
		move.l     a0,128(a7)
		bne.s      newlabel_1
		bra        newlabel_2
newlabel_1:
		movea.l    128(a7),a0
		movea.l    74(a0),a0
		jsr        Ast_delete
		movea.l    144(a7),a0
		jsr        Ast_create
		movea.l    128(a7),a1
		move.l     a0,74(a1)
		movea.l    132(a7),a1
		lea.l      22(a1),a1
		moveq.l    #2,d0
		movea.l    128(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_puttext
newlabel_3:
		movea.l    128(a7),a0
		jsr        Awi_dialog
		lea.l      (a7),a1
		moveq.l    #2,d0
		movea.l    128(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_gettext
		move.b     (a7),d0
		beq.s      newlabel_3
		movea.l    136(a7),a0
		move.w     6(a0),d0
		and.w      #0x4000,d0
		beq.s      newlabel_4
		lea.l      (a7),a0
		jsr        strupr
newlabel_4:
		lea.l      (a7),a1
		movea.l    132(a7),a0
		lea.l      22(a0),a0
		jsr        strcpy
		movea.l    128(a7),a0
		jsr        Awi_delete
newlabel_2:
		lea.l      140(a7),a7
		rts

	.globl new2label
new2label:
		lea.l      -142(a7),a7
		move.l     a0,138(a7)
		move.l     a1,134(a7)
		lea.l      WI_NEW2_LABEL,a0
		movea.l    WI_NEW2_LABEL+8,a1
		jsr        (a1)
		move.l     a0,130(a7)
		bne.s      new2label_1
		clr.w      d0
		bra        new2label_2
new2label_1:
		movea.l    130(a7),a0
		movea.l    74(a0),a0
		jsr        Ast_delete
		movea.l    146(a7),a0
		jsr        Ast_create
		movea.l    130(a7),a1
		move.l     a0,74(a1)
		movea.l    134(a7),a1
		lea.l      22(a1),a1
		moveq.l    #2,d0
		movea.l    130(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_puttext
		movea.l    130(a7),a0
		jsr        Awi_dialog
		move.w     d0,128(a7)
		lea.l      (a7),a1
		moveq.l    #2,d0
		movea.l    130(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_gettext
		movea.l    130(a7),a0
		jsr        Awi_delete
		cmpi.w     #0x0003,128(a7)
		bne.s      new2label_3
		move.b     (a7),d0
		beq.s      new2label_3
		movea.l    138(a7),a0
		move.w     6(a0),d0
		and.w      #0x4000,d0
		beq.s      new2label_4
		lea.l      (a7),a0
		jsr        strupr
new2label_4:
		lea.l      (a7),a1
		movea.l    134(a7),a0
		lea.l      22(a0),a0
		jsr        strcpy
		moveq.l    #1,d0
		bra.s      new2label_2
		bra.s      new2label_2
new2label_3:
		clr.w      d0
		nop
new2label_2:
		lea.l      142(a7),a7
		rts

wicalc_pos:
		lea.l      -14(a7),a7
		move.l     d0,10(a7)
		move.l     d1,6(a7)
		move.l     d2,2(a7)
		move.l     6(a7),d0
		bne.s      wicalc_pos_1
		move.w     12(a7),(a7)
		bra.s      wicalc_pos_2
wicalc_pos_1:
		move.l     10(a7),d0
		move.l     2(a7),d1
		jsr        _lmul
		move.l     6(a7),d1
		jsr        _ldiv
		move.w     d0,(a7)
wicalc_pos_2:
		move.w     (a7),d0
		cmp.w      18(a7),d0
		bge.s      wicalc_pos_3
		move.w     18(a7),(a7)
wicalc_pos_3:
		move.w     (a7),d0
		cmp.w      20(a7),d0
		ble.s      wicalc_pos_4
		move.w     20(a7),(a7)
wicalc_pos_4:
		move.w     (a7),d0
		lea.l      14(a7),a7
		rts

	.globl wi_pos
wi_pos:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a0
		move.w     4(a0),d0
		bne.s      wi_pos_1
		bra        wi_pos_2
wi_pos_1:
		movea.l    ACSblk,a0
		move.w     8(a0),d0
		movea.l    ACSblk,a0
		add.w      12(a0),d0
		move.w     d0,-(a7)
		movea.l    ACSblk,a0
		move.w     8(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     8(a0),d2
		ext.l      d2
		movea.l    16(a7),a0
		move.w     (a0),d1
		ext.l      d1
		movea.l    4(a7),a0
		move.w     (a0),d0
		ext.l      d0
		bsr        wicalc_pos
		addq.w     #4,a7
		movea.l    4(a7),a0
		move.w     d0,36(a0)
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		movea.l    ACSblk,a0
		add.w      14(a0),d0
		move.w     d0,-(a7)
		movea.l    ACSblk,a0
		move.w     10(a0),-(a7)
		movea.l    ACSblk,a0
		move.w     10(a0),d2
		ext.l      d2
		movea.l    16(a7),a0
		move.w     2(a0),d1
		ext.l      d1
		movea.l    4(a7),a0
		move.w     2(a0),d0
		ext.l      d0
		bsr        wicalc_pos
		addq.w     #4,a7
		movea.l    4(a7),a0
		move.w     d0,38(a0)
		movea.l    4(a7),a0
		move.w     34(a0),d0
		and.w      #0x0E20,d0
		beq.s      wi_pos_3
		movea.l    ACSblk,a0
		move.w     12(a0),d0
		add.w      d0,d0
		move.w     d0,-(a7)
		movea.l    ACSblk,a0
		move.w     4(a0),d0
		lsl.w      #2,d0
		move.w     d0,-(a7)
		movea.l    ACSblk,a0
		move.w     12(a0),d2
		ext.l      d2
		movea.l    16(a7),a0
		move.w     4(a0),d1
		ext.l      d1
		movea.l    4(a7),a0
		move.w     4(a0),d0
		ext.l      d0
		bsr        wicalc_pos
		addq.w     #4,a7
		movea.l    4(a7),a0
		move.w     d0,40(a0)
		bra.s      wi_pos_4
wi_pos_3:
		movea.l    ACSblk,a0
		movea.l    4(a7),a1
		move.w     12(a0),40(a1)
wi_pos_4:
		movea.l    4(a7),a0
		move.w     34(a0),d0
		and.w      #0x01E0,d0
		beq.s      wi_pos_5
		movea.l    ACSblk,a0
		move.w     14(a0),d0
		add.w      d0,d0
		move.w     d0,-(a7)
		movea.l    ACSblk,a0
		move.w     6(a0),d0
		lsl.w      #2,d0
		move.w     d0,-(a7)
		movea.l    ACSblk,a0
		move.w     14(a0),d2
		ext.l      d2
		movea.l    16(a7),a0
		move.w     6(a0),d1
		ext.l      d1
		movea.l    4(a7),a0
		move.w     6(a0),d0
		ext.l      d0
		bsr        wicalc_pos
		addq.w     #4,a7
		movea.l    4(a7),a0
		move.w     d0,42(a0)
		bra.s      wi_pos_2
wi_pos_5:
		movea.l    ACSblk,a0
		movea.l    4(a7),a1
		move.w     14(a0),42(a1)
wi_pos_2:
		addq.w     #8,a7
		rts

convert:
		move.l     a2,-(a7)
		lea.l      -52(a7),a7
		move.l     a0,48(a7)
		move.l     a1,44(a7)
		movea.l    ACSblk,a0
		moveq.l    #1,d0
		movea.l    ACSblk,a1
		move.b     29(a1),d1
		lsl.w      d1,d0
		cmp.w      26(a0),d0
		beq        convert_1
		movea.l    48(a7),a0
		move.w     8(a0),d0
		movea.l    48(a7),a0
		muls.w     6(a0),d0
		ext.l      d0
		move.l     d0,38(a7)
		clr.w      d0
		move.w     d0,6(a7)
		move.w     d0,4(a7)
		move.w     d0,2(a7)
		move.w     d0,(a7)
		clr.w      16(a7)
		bra        convert_2
convert_17:
		move.w     16(a7),d0
		move.w     d0,14(a7)
		move.w     d0,10(a7)
		move.w     16(a7),d0
		movea.l    48(a7),a0
		muls.w     8(a0),d0
		ext.l      d0
		move.l     d0,34(a7)
		clr.w      18(a7)
		bra        convert_3
convert_16:
		move.w     18(a7),d0
		asr.w      #4,d0
		ext.l      d0
		add.l      34(a7),d0
		move.l     d0,30(a7)
		move.l     30(a7),d0
		add.l      d0,d0
		movea.l    60(a7),a0
		adda.l     d0,a0
		move.l     a0,20(a7)
		move.l     30(a7),d0
		add.l      d0,d0
		movea.l    48(a7),a0
		movea.l    (a0),a0
		adda.l     d0,a0
		move.l     a0,24(a7)
		move.w     18(a7),d0
		move.w     d0,12(a7)
		move.w     d0,8(a7)
		move.l     #0x00008000,d0
		moveq.l    #15,d1
		and.b      19(a7),d1
		asr.l      d1,d0
		move.w     d0,28(a7)
		movea.l    20(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq        convert_4
		clr.w      42(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_5
		addq.w     #1,42(a7)
convert_5:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_6
		addq.w     #2,42(a7)
convert_6:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_7
		addq.w     #4,42(a7)
convert_7:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_8
		addq.w     #8,42(a7)
convert_8:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_9
		addi.w     #0x0010,42(a7)
convert_9:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_10
		addi.w     #0x0020,42(a7)
convert_10:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_11
		addi.w     #0x0040,42(a7)
convert_11:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_12
		addi.w     #0x0080,42(a7)
convert_12:
		movea.l    ACSblk,a0
		cmpi.w     #0x0008,28(a0)
		bge.s      convert_13
		andi.w     #0x000F,42(a7)
convert_13:
		cmpi.w     #16,42(a7)
		bge.s      convert_14
		move.w     42(a7),d0
		add.w      d0,d0
		lea.l      map,a0
		move.w     0(a0,d0.w),42(a7)
convert_14:
		bra.s      convert_15
convert_4:
		moveq.l    #-1,d0
		movea.l    ACSblk,a0
		add.w      26(a0),d0
		move.w     d0,42(a7)
convert_15:
		move.w     42(a7),d0
		move.w     d0,col
		move.w     d0,col+2
		pea.l      col
		move.l     48(a7),-(a7)
		lea.l      punkt,a1
		lea.l      8(a7),a0
		moveq.l    #1,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vrt_cpyfm
		addq.w     #8,a7
		addq.w     #1,18(a7)
convert_3:
		movea.l    44(a7),a0
		move.w     18(a7),d0
		cmp.w      4(a0),d0
		blt        convert_16
		addq.w     #1,16(a7)
convert_2:
		movea.l    44(a7),a0
		move.w     16(a7),d0
		cmp.w      6(a0),d0
		blt        convert_17
		bra.s      convert_18
convert_1:
		movea.l    44(a7),a1
		movea.l    48(a7),a0
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vr_trnfm
convert_18:
		lea.l      52(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl to_cicon
to_cicon:
		lea.l      -68(a7),a7
		move.l     a0,64(a7)
		move.l     a1,60(a7)
		move.w     d0,58(a7)
		moveq.l    #15,d0
		movea.l    72(a7),a0
		add.w      22(a0),d0
		and.w      #0xFFF0,d0
		move.w     d0,56(a7)
		move.w     56(a7),d0
		movea.l    72(a7),a0
		muls.w     24(a0),d0
		asr.w      #3,d0
		ext.l      d0
		move.l     d0,52(a7)
		movea.l    ACSblk,a0
		move.w     58(a7),d0
		cmp.w      28(a0),d0
		ble.s      to_cicon_1
		lea.l      a_planemess,a0
		moveq.l    #1,d0
		jsr        Awi_alert
to_cicon_1:
		move.l     52(a7),d0
		movea.l    ACSblk,a0
		move.w     28(a0),d1
		ext.l      d1
		jsr        _lmul
		addq.l     #6,d0
		move.l     d0,48(a7)
		move.l     52(a7),d0
		move.w     58(a7),d1
		ext.l      d1
		jsr        _lmul
		move.l     d0,44(a7)
		clr.w      34(a7)
		move.w     #1,14(a7)
		move.w     56(a7),d0
		move.w     d0,8(a7)
		move.w     d0,28(a7)
		movea.l    72(a7),a0
		move.w     24(a0),d0
		move.w     d0,10(a7)
		move.w     d0,30(a7)
		move.w     56(a7),d0
		asr.w      #4,d0
		move.w     d0,12(a7)
		move.w     d0,32(a7)
		movea.l    ACSblk,a0
		move.w     28(a0),d0
		move.w     d0,16(a7)
		move.w     d0,36(a7)
		clr.w      d0
		move.w     d0,22(a7)
		move.w     d0,20(a7)
		move.w     d0,18(a7)
		move.w     d0,42(a7)
		move.w     d0,40(a7)
		move.w     d0,38(a7)
		move.l     48(a7),d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		bne.s      to_cicon_2
		movea.l    72(a7),a0
		clr.l      34(a0)
		suba.l     a0,a0
		bra        to_cicon_3
to_cicon_2:
		move.l     (a7),4(a7)
		move.l     48(a7),d1
		clr.w      d0
		movea.l    4(a7),a0
		jsr        memset
		move.l     44(a7),d0
		movea.l    64(a7),a1
		addq.w     #6,a1
		movea.l    4(a7),a0
		jsr        memcpy
		move.l     48(a7),d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		bne.s      to_cicon_4
		movea.l    4(a7),a0
		jsr        Ax_ifree
		movea.l    72(a7),a0
		clr.l      34(a0)
		suba.l     a0,a0
		bra.s      to_cicon_3
to_cicon_4:
		movea.l    (a7),a0
		addq.w     #6,a0
		move.l     a0,24(a7)
		movea.l    (a7),a0
		move.w     #1,(a0)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #0x0800,d0
		beq.s      to_cicon_5
		move.l     44(a7),d0
		movea.l    4(a7),a1
		movea.l    24(a7),a0
		jsr        memcpy
		bra.s      to_cicon_6
to_cicon_5:
		move.l     60(a7),-(a7)
		lea.l      28(a7),a1
		lea.l      8(a7),a0
		bsr        convert
		addq.w     #4,a7
to_cicon_6:
		movea.l    4(a7),a0
		jsr        Ax_ifree
		movea.l    24(a7),a0
to_cicon_3:
		lea.l      68(a7),a7
		rts

	.data

hex:
		dc.b '0123456789ABCDEF',0
a_planemess:
		dc.b '[1][ |planes > nplanes!| ][   OK   ]',0
map:
		dc.w $0000
		dc.w $0002
		dc.w $0003
		dc.w $0006
		dc.w $0004
		dc.w $0007
		dc.w $0005
		dc.w $0008
		dc.w $0009
		dc.w $000a
		dc.w $000b
		dc.w $000e
		dc.w $000c
		dc.w $000f
		dc.w $000d
		dc.w $0001
xff:
		dc.w $ffff
punkt:
		dc.l xff
		dc.w $0001
		dc.w $0001
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
xa46f8:
		dc.b '%d*%d',0
xa46fe:
		dc.b '%d*%d',0

	.bss
col: ds.l 1
