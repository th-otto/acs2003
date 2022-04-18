		.text

dr_3dbut:
		movem.l    d3/a2-a3,-(a7)
		lea.l      -12(a7),a7
		movea.l    a0,a3
		move.w     d0,d3
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		cmpi.w     #0x0004,28(a0)
		blt.s      dr_3dbut_1
		tst.w      d3
		beq.s      dr_3dbut_2
		moveq.l    #8,d1
		move.w     16(a0),d0
		jsr        vsf_color
		bra.s      dr_3dbut_3
dr_3dbut_2:
		moveq.l    #9,d1
		movea.l    (a2),a0
		move.w     16(a0),d0
		jsr        vsf_color
dr_3dbut_3:
		moveq.l    #1,d1
		movea.l    (a2),a0
		move.w     16(a0),d0
		jsr        vsf_interior
		bra.s      dr_3dbut_4
dr_3dbut_1:
		tst.w      d3
		beq.s      dr_3dbut_5
		clr.w      d1
		movea.l    (a2),a0
		move.w     16(a0),d0
		jsr        vsf_color
		bra.s      dr_3dbut_4
dr_3dbut_5:
		moveq.l    #1,d1
		movea.l    (a2),a0
		move.w     16(a0),d0
		jsr        vsf_color
dr_3dbut_4:
		movea.l    a3,a0
		movea.l    (a2),a1
		move.w     16(a1),d0
		jsr        v_bar
		move.w     (a3),d0
		move.w     d0,4(a7)
		move.w     d0,(a7)
		move.w     6(a3),2(a7)
		move.w     2(a3),d0
		move.w     d0,10(a7)
		move.w     d0,6(a7)
		move.w     4(a3),8(a7)
		moveq.l    #1,d1
		movea.l    (a2),a0
		move.w     16(a0),d0
		jsr        vsl_color
		lea.l      (a7),a0
		moveq.l    #3,d1
		movea.l    (a2),a1
		move.w     16(a1),d0
		jsr        v_pline
		move.w     4(a3),4(a7)
		move.w     6(a3),6(a7)
		lea.l      (a7),a0
		moveq.l    #3,d1
		movea.l    (a2),a1
		move.w     16(a1),d0
		jsr        v_pline
		tst.w      d3
		beq.s      dr_3dbut_6
		moveq.l    #1,d0
		add.w      (a3),d0
		move.w     d0,4(a7)
		moveq.l    #1,d1
		add.w      2(a3),d1
		move.w     d1,6(a7)
		addq.w     #1,(a7)
		subq.w     #1,2(a7)
		subq.w     #1,8(a7)
		addq.w     #1,10(a7)
		movea.l    (a2),a0
		cmpi.w     #0x0004,28(a0)
		blt.s      dr_3dbut_7
		move.w     16(a0),d0
		clr.w      d1
		jsr        vsl_color
		lea.l      (a7),a0
		moveq.l    #3,d1
		movea.l    (a2),a1
		move.w     16(a1),d0
		jsr        v_pline
dr_3dbut_7:
		moveq.l    #-1,d0
		add.w      4(a3),d0
		move.w     d0,4(a7)
		moveq.l    #-1,d1
		add.w      6(a3),d1
		move.w     d1,6(a7)
		movea.l    (a2),a0
		move.w     16(a0),d0
		moveq.l    #9,d1
		jsr        vsl_color
		lea.l      (a7),a0
		moveq.l    #3,d1
		movea.l    (a2),a1
		move.w     16(a1),d0
		jsr        v_pline
dr_3dbut_6:
		lea.l      12(a7),a7
		movem.l    (a7)+,d3/a2-a3
		rts

	.globl A_slider
A_slider:
		movem.l    d2-d7/a2-a6,-(a7)
		lea.l      -32(a7),a7
		movea.l    80(a7),a2
		move.w     4(a2),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a2),a0
		adda.l     d0,a0
		move.l     a0,28(a7)
		move.l     12(a0),24(a7)
		movea.l    24(a7),a1
		movea.l    12(a1),a5
		moveq.l    #1,d0
		and.w      38(a5),d0
		bne.s      A_slider_1
		move.w     20(a0),d1
		cmp.w      70(a5),d1
		bne.s      A_slider_1
		move.w     22(a0),d0
		cmp.w      72(a5),d0
		beq.s      A_slider_2
A_slider_1:
		movea.l    28(a7),a0
		jsr        sl_calc
A_slider_2:
		moveq.l    #2,d0
		and.w      38(a5),d0
		bne.s      A_slider_3
		moveq.l    #1,d3
		bra.s      A_slider_4
A_slider_3:
		clr.w      d3
A_slider_4:
		moveq.l    #1,d0
		movea.l    24(a7),a0
		and.l      4(a0),d0
		bne.s      A_slider_5
		moveq.l    #1,d4
		bra.s      A_slider_6
A_slider_5:
		clr.w      d4
A_slider_6:
		lea.l      ACSblk,a6
		moveq.l    #2,d0
		movea.l    24(a7),a0
		and.l      4(a0),d0
		moveq.l    #2,d1
		cmp.l      d0,d1
		bne.s      A_slider_7
		movea.l    (a6),a1
		movea.l    572(a1),a0
		move.w     14(a0),d2
		and.w      #0x0100,d2
		bne.s      A_slider_7
		moveq.l    #1,d5
		bra.s      A_slider_8
A_slider_7:
		clr.w      d5
A_slider_8:
		lea.l      4(a7),a3
		move.w     22(a2),4(a3)
		move.w     24(a2),6(a3)
		move.w     4(a3),d0
		bne.s      A_slider_9
		move.w     6(a3),d1
		beq.s      A_slider_10
A_slider_9:
		move.w     18(a2),(a3)
		move.w     20(a2),2(a3)
		moveq.l    #-1,d0
		add.w      (a3),d0
		add.w      d0,4(a3)
		moveq.l    #-1,d0
		add.w      2(a3),d0
		add.w      d0,6(a3)
		movea.l    a3,a0
		moveq.l    #1,d1
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        vs_clip
A_slider_10:
		movea.l    (a6),a0
		move.w     656(a0),d1
		move.w     16(a0),d0
		jsr        vst_font
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vst_color
		clr.w      d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vst_rotation
		lea.l      2(a7),a4
		movea.l    a4,a1
		movea.l    a4,a0
		moveq.l    #5,d2
		clr.w      d1
		move.l     a1,-(a7)
		movea.l    (a6),a1
		move.w     16(a1),d0
		movea.l    (a7)+,a1
		jsr        vst_alignment
		pea.l      (a4)
		pea.l      (a4)
		movea.l    a4,a1
		movea.l    a4,a0
		move.l     a1,-(a7)
		movea.l    (a6),a1
		move.w     658(a1),d1
		move.w     16(a1),d0
		movea.l    (a7)+,a1
		jsr        vst_height
		addq.w     #8,a7
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsl_width
		lea.l      12(a7),a4
		tst.w      d4
		beq.s      A_slider_11
		movea.l    (a6),a0
		move.w     18(a0),d6
		add.w      d6,d6
		move.w     16(a2),d0
		sub.w      20(a0),d0
		asr.w      #1,d0
		add.w      12(a2),d0
		move.w     d0,(a7)
		move.w     12(a2),d1
		move.w     d1,2(a4)
		move.w     d1,6(a4)
		moveq.l    #-1,d2
		add.w      16(a2),d2
		add.w      d2,6(a4)
		bra.s      A_slider_12
A_slider_11:
		movea.l    (a6),a0
		move.w     20(a0),d6
		move.w     14(a2),d0
		sub.w      18(a0),d0
		asr.w      #1,d0
		add.w      10(a2),d0
		move.w     d0,(a7)
		move.w     10(a2),d1
		move.w     d1,(a4)
		move.w     d1,4(a4)
		moveq.l    #-1,d2
		add.w      14(a2),d2
		add.w      d2,4(a4)
A_slider_12:
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsl_type
		tst.w      d3
		bne.s      A_slider_13
		moveq.l    #4,d0
		and.w      38(a5),d0
		beq        A_slider_14
A_slider_13:
		tst.w      d4
		beq.s      A_slider_15
		move.w     10(a2),d0
		move.w     d0,(a4)
		move.w     d0,4(a4)
		add.w      d6,4(a4)
		bra.s      A_slider_16
A_slider_15:
		move.w     12(a2),d0
		move.w     d0,2(a4)
		move.w     d0,6(a4)
		add.w      d6,6(a4)
A_slider_16:
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vswr_mode
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsf_perimeter
		clr.w      d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsf_interior
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsf_color
		tst.w      d5
		beq.s      A_slider_17
		move.l     8(a5),d0
		beq.s      A_slider_18
		moveq.l    #8,d1
		and.w      8(a2),d1
		bne.s      A_slider_18
		moveq.l    #1,d0
		bra.s      A_slider_19
A_slider_18:
		clr.w      d0
A_slider_19:
		movea.l    a4,a0
		bsr        dr_3dbut
		bra.s      A_slider_20
A_slider_17:
		movea.l    a4,a0
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        v_bar
A_slider_20:
		moveq.l    #2,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vswr_mode
		move.l     8(a5),d0
		bne.s      A_slider_21
		moveq.l    #2,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vst_effects
		bra.s      A_slider_22
A_slider_21:
		clr.w      d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vst_effects
A_slider_22:
		tst.w      d4
		beq.s      A_slider_23
		lea.l      xcf1a2,a0
		move.w     (a7),d2
		movea.l    (a6),a1
		move.w     18(a1),d1
		asr.w      #1,d1
		add.w      (a4),d1
		addq.w     #1,d1
		move.w     16(a1),d0
		jsr        v_gtext
		bra.s      A_slider_14
A_slider_23:
		lea.l      xcf1a4,a0
		move.w     2(a4),d2
		move.w     (a7),d1
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        v_gtext
A_slider_14:
		tst.w      d3
		bne.s      A_slider_24
		moveq.l    #8,d0
		and.w      38(a5),d0
		beq        A_slider_25
A_slider_24:
		tst.w      d4
		beq.s      A_slider_26
		move.w     10(a2),d0
		add.w      14(a2),d0
		subq.w     #1,d0
		move.w     d0,(a4)
		move.w     d0,4(a4)
		sub.w      d6,(a4)
		bra.s      A_slider_27
A_slider_26:
		move.w     12(a2),d0
		add.w      16(a2),d0
		subq.w     #1,d0
		move.w     d0,2(a4)
		move.w     d0,6(a4)
		sub.w      d6,2(a4)
A_slider_27:
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vswr_mode
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsf_perimeter
		clr.w      d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsf_interior
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsf_color
		tst.w      d5
		beq.s      A_slider_28
		move.l     8(a5),d0
		add.l      4(a5),d0
		cmp.l      (a5),d0
		beq.s      A_slider_29
		moveq.l    #8,d1
		and.w      8(a2),d1
		bne.s      A_slider_29
		moveq.l    #1,d0
		bra.s      A_slider_30
A_slider_29:
		clr.w      d0
A_slider_30:
		movea.l    a4,a0
		bsr        dr_3dbut
		bra.s      A_slider_31
A_slider_28:
		movea.l    a4,a0
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        v_bar
A_slider_31:
		moveq.l    #2,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vswr_mode
		move.l     8(a5),d0
		add.l      4(a5),d0
		cmp.l      (a5),d0
		bne.s      A_slider_32
		moveq.l    #2,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vst_effects
		bra.s      A_slider_33
A_slider_32:
		clr.w      d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vst_effects
A_slider_33:
		tst.w      d4
		beq.s      A_slider_34
		lea.l      xcf1a6,a0
		move.w     (a7),d2
		movea.l    (a6),a1
		move.w     18(a1),d1
		asr.w      #1,d1
		add.w      (a4),d1
		addq.w     #1,d1
		move.w     16(a1),d0
		jsr        v_gtext
		bra.s      A_slider_25
A_slider_34:
		lea.l      xcf1a8,a0
		move.w     2(a4),d2
		move.w     (a7),d1
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        v_gtext
A_slider_25:
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vswr_mode
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsf_perimeter
		moveq.l    #2,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsf_interior
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsf_style
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsf_color
		moveq.l    #4,d0
		movea.l    24(a7),a0
		and.l      4(a0),d0
		bne        A_slider_35
		move.w     40(a5),d1
		beq        A_slider_35
		tst.w      d3
		bne.s      A_slider_36
		moveq.l    #16,d2
		and.w      38(a5),d2
		beq        A_slider_35
A_slider_36:
		tst.w      d4
		beq.s      A_slider_37
		move.w     10(a2),d7
		add.w      d6,d7
		move.w     d7,(a4)
		move.w     d7,4(a4)
		move.w     40(a5),d0
		add.w      d0,4(a4)
		bra.s      A_slider_38
A_slider_37:
		move.w     12(a2),d7
		add.w      d6,d7
		move.w     d7,2(a4)
		move.w     d7,6(a4)
		move.w     40(a5),d0
		add.w      d0,6(a4)
A_slider_38:
		add.w      46(a5),d7
		tst.w      d3
		bne.s      A_slider_39
		tst.w      d4
		beq.s      A_slider_40
		cmp.w      4(a3),d7
		bgt.s      A_slider_35
		cmp.w      (a3),d7
		ble.s      A_slider_41
		move.w     d7,(a3)
A_slider_41:
		movea.l    a3,a0
		moveq.l    #1,d1
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        vs_clip
		tst.w      d5
		beq.s      A_slider_42
A_slider_44:
		clr.w      d0
		movea.l    a4,a0
		bsr        dr_3dbut
		bra.s      A_slider_35
A_slider_40:
		cmp.w      6(a3),d7
		bgt.s      A_slider_35
		cmp.w      2(a3),d7
		ble.s      A_slider_43
		move.w     d7,2(a3)
A_slider_43:
		movea.l    a3,a0
		moveq.l    #1,d1
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        vs_clip
A_slider_39:
		tst.w      d5
		bne.s      A_slider_44
A_slider_42:
		movea.l    a4,a0
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        v_bar
A_slider_35:
		moveq.l    #4,d0
		movea.l    24(a7),a0
		and.l      4(a0),d0
		bne        A_slider_45
		move.w     44(a5),d1
		beq        A_slider_45
		tst.w      d3
		bne.s      A_slider_46
		moveq.l    #32,d2
		and.w      38(a5),d2
		beq        A_slider_45
A_slider_46:
		tst.w      d4
		beq.s      A_slider_47
		move.w     10(a2),d7
		add.w      14(a2),d7
		sub.w      d6,d7
		subq.w     #1,d7
		move.w     d7,(a4)
		move.w     d7,4(a4)
		move.w     44(a5),d0
		sub.w      d0,(a4)
		bra.s      A_slider_48
A_slider_47:
		move.w     12(a2),d7
		add.w      16(a2),d7
		sub.w      d6,d7
		subq.w     #1,d7
		move.w     d7,2(a4)
		move.w     d7,6(a4)
		move.w     44(a5),d0
		sub.w      d0,2(a4)
A_slider_48:
		sub.w      48(a5),d7
		tst.w      d3
		bne.s      A_slider_49
		tst.w      d4
		beq.s      A_slider_50
		cmp.w      (a3),d7
		blt.s      A_slider_45
		cmp.w      4(a3),d7
		bge.s      A_slider_51
		move.w     d7,4(a3)
A_slider_51:
		movea.l    a3,a0
		moveq.l    #1,d1
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        vs_clip
		tst.w      d5
		beq.s      A_slider_52
A_slider_54:
		clr.w      d0
		movea.l    a4,a0
		bsr        dr_3dbut
		bra.s      A_slider_45
A_slider_50:
		cmp.w      2(a3),d7
		blt.s      A_slider_45
		cmp.w      6(a3),d7
		bge.s      A_slider_53
		move.w     d7,6(a3)
A_slider_53:
		movea.l    a3,a0
		moveq.l    #1,d1
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        vs_clip
A_slider_49:
		tst.w      d5
		bne.s      A_slider_54
A_slider_52:
		movea.l    a4,a0
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        v_bar
A_slider_45:
		moveq.l    #4,d0
		movea.l    24(a7),a0
		and.l      4(a0),d0
		bne        A_slider_55
		tst.w      d4
		beq.s      A_slider_56
		move.w     10(a2),d1
		add.w      d6,d1
		add.w      40(a5),d1
		move.w     d1,(a4)
		move.w     d1,4(a4)
		moveq.l    #-1,d2
		add.w      42(a5),d2
		add.w      d2,4(a4)
		bra.s      A_slider_57
A_slider_56:
		move.w     12(a2),d0
		add.w      d6,d0
		add.w      40(a5),d0
		move.w     d0,2(a4)
		move.w     d0,6(a4)
		moveq.l    #-1,d1
		add.w      42(a5),d1
		add.w      d1,6(a4)
A_slider_57:
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsf_perimeter
		clr.w      d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsf_interior
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsf_color
		tst.w      d5
		beq.s      A_slider_58
		moveq.l    #8,d0
		and.w      8(a2),d0
		bne.s      A_slider_59
		move.l     4(a5),d1
		cmp.l      (a5),d1
		beq.s      A_slider_59
		moveq.l    #1,d0
		bra.s      A_slider_60
A_slider_59:
		clr.w      d0
A_slider_60:
		movea.l    a4,a0
		bsr        dr_3dbut
		bra.s      A_slider_61
A_slider_58:
		movea.l    a4,a0
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        v_bar
A_slider_61:
		move.b     18(a5),d0
		beq        A_slider_55
		moveq.l    #2,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vswr_mode
		clr.w      d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vst_effects
		tst.w      d4
		beq.s      A_slider_62
		lea.l      18(a5),a0
		jsr        strlen
		movea.l    (a6),a0
		move.w     18(a0),d1
		ext.l      d1
		jsr        _ulmul
		move.w     42(a5),d7
		sub.w      d0,d7
		asr.w      #1,d7
		lea.l      18(a5),a0
		move.w     (a7),d2
		move.w     (a4),d1
		add.w      d7,d1
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        v_gtext
		bra.s      A_slider_55
A_slider_62:
		lea.l      18(a5),a0
		jsr        strlen
		movea.l    (a6),a0
		move.w     18(a0),d1
		ext.l      d1
		jsr        _ulmul
		move.w     14(a2),d7
		sub.w      d0,d7
		asr.w      #1,d7
		lea.l      18(a5),a0
		move.w     42(a5),d2
		movea.l    (a6),a1
		sub.w      20(a1),d2
		asr.w      #1,d2
		add.w      2(a4),d2
		move.w     (a4),d1
		add.w      d7,d1
		move.w     16(a1),d0
		jsr        v_gtext
A_slider_55:
		tst.w      d3
		beq        A_slider_63
		moveq.l    #32,d0
		movea.l    28(a7),a0
		and.w      10(a0),d0
		beq        A_slider_63
		moveq.l    #1,d1
		add.w      10(a2),d1
		move.w     d1,(a4)
		moveq.l    #1,d2
		add.w      12(a2),d2
		move.w     d2,10(a4)
		move.w     12(a2),d3
		add.w      16(a2),d3
		move.w     d3,2(a4)
		move.w     d3,6(a4)
		move.w     10(a2),d4
		add.w      14(a2),d4
		move.w     d4,4(a4)
		move.w     d4,8(a4)
		movea.l    (a6),a1
		move.w     16(a1),d0
		moveq.l    #1,d1
		jsr        vswr_mode
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsl_color
		clr.w      d2
		clr.w      d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsl_ends
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsl_width
		moveq.l    #1,d1
		movea.l    (a6),a0
		move.w     16(a0),d0
		jsr        vsl_type
		movea.l    a4,a0
		moveq.l    #3,d1
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        v_pline
A_slider_63:
		movea.l    a3,a0
		clr.w      d1
		movea.l    (a6),a1
		move.w     16(a1),d0
		jsr        vs_clip
		moveq.l    #-10,d0
		and.w      8(a2),d0
		lea.l      32(a7),a7
		movem.l    (a7)+,d2-d7/a2-a6
		rts

sl_calc:
		movem.l    d3-d5/a2-a3,-(a7)
		movea.l    a0,a2
		movea.l    12(a2),a0
		movea.l    12(a0),a3
		lea.l      ACSblk,a1
		moveq.l    #1,d0
		and.l      4(a0),d0
		beq.s      sl_calc_1
		movea.l    (a1),a0
		move.w     20(a0),d3
		move.w     22(a2),d4
		move.w     20(a0),d1
		add.w      d1,d1
		sub.w      d1,d4
		move.w     d4,d5
		bra.s      sl_calc_2
sl_calc_1:
		movea.l    (a1),a0
		move.w     18(a0),d3
		muls.w     16(a3),d3
		move.w     20(a2),d4
		move.w     18(a0),d0
		lsl.w      #2,d0
		sub.w      d0,d4
		move.w     d4,d5
sl_calc_2:
		move.l     4(a3),d0
		move.w     d4,d1
		ext.l      d1
		jsr        _lmul
		move.l     (a3),d1
		jsr        _ldiv
		move.w     d0,42(a3)
		cmp.w      d0,d3
		ble.s      sl_calc_3
		move.w     d4,d5
		add.w      d0,d5
		sub.w      d3,d5
		subq.w     #1,d5
		move.w     d3,42(a3)
sl_calc_3:
		move.l     8(a3),d0
		move.w     d5,d1
		ext.l      d1
		jsr        _lmul
		move.l     (a3),d1
		asr.l      #1,d1
		add.l      d1,d0
		move.l     (a3),d1
		jsr        _ldiv
		move.w     d0,40(a3)
		move.w     d4,d1
		sub.w      42(a3),d1
		sub.w      d0,d1
		move.w     d1,44(a3)
		tst.w      d1
		bmi.s      sl_calc_4
		move.l     8(a3),d0
		add.l      4(a3),d0
		cmp.l      (a3),d0
		bne.s      sl_calc_5
sl_calc_4:
		move.w     44(a3),d0
		add.w      d0,40(a3)
		clr.w      44(a3)
sl_calc_5:
		move.w     20(a2),70(a3)
		move.w     22(a2),72(a3)
		andi.w     #0xFFFE,38(a3)
		movem.l    (a7)+,d3-d5/a2-a3
		rts

	.globl Auo_slider
Auo_slider:
		movem.l    d3/a2-a5,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    a1,a4
		movea.l    12(a0),a2
		movea.l    12(a2),a3
		move.w     d0,d1
		cmp.w      #0x000F,d1
		beq        Auo_slider_1
		bgt.s      Auo_slider_2
		cmp.w      #0x000E,d1
		bhi        Auo_slider_3
		add.w      d1,d1
		move.w     J23(pc,d1.w),d1
		jmp        J23(pc,d1.w)
J23:
		dc.w Auo_slider_3-J23
		dc.w Auo_slider_4-J23
		dc.w Auo_slider_5-J23
		dc.w Auo_slider_6-J23
		dc.w Auo_slider_7-J23
		dc.w Auo_slider_8-J23
		dc.w Auo_slider_9-J23
		dc.w Auo_slider_3-J23
		dc.w Auo_slider_3-J23
		dc.w Auo_slider_10-J23
		dc.w Auo_slider_11-J23
		dc.w Auo_slider_12-J23
		dc.w Auo_slider_13-J23
		dc.w Auo_slider_14-J23
		dc.w Auo_slider_15-J23
Auo_slider_2:
		cmp.w      #0x0065,d1
		beq        Auo_slider_99
		bgt.s      Auo_slider_98
		cmp.w      #0x0013,d1
		beq        Auo_slider_17
		bgt.s      Auo_slider_18
		sub.w      #0x0011,d1
		beq        Auo_slider_19
		subq.w     #1,d1
		beq        Auo_slider_20
		bra        Auo_slider_3
Auo_slider_18:
		sub.w      #0x0014,d1
		beq        Auo_slider_17
		sub.w      #0x0050,d1
		beq        Auo_slider_21
		bra        Auo_slider_3
Auo_slider_98:
		sub.w      #0x0066,d1
		cmp.w      #0x0005,d1
		bhi        Auo_slider_3
		add.w      d1,d1
		move.w     J24(pc,d1.w),d1
		jmp        J24(pc,d1.w)
J24:
		dc.w Auo_slider_22-J24
		dc.w Auo_slider_23-J24
		dc.w Auo_slider_24-J24
		dc.w Auo_slider_25-J24
		dc.w Auo_slider_3-J24
		dc.w Auo_slider_26-J24
Auo_slider_4:
		moveq.l    #74,d0
		jsr        Ax_malloc
		movea.l    a0,a3
		move.l     a3,d0
		beq.s      Auo_slider_28
		lea.l      proto,a1
		moveq.l    #74,d0
		jsr        memcpy
		move.l     a3,12(a2)
		bra        Auo_slider_17
Auo_slider_28:
		move.w     #0xFFFF,(a4)
		bra        Auo_slider_17
Auo_slider_5:
		movea.l    a3,a0
		jsr        Ax_free
		bra        Auo_slider_17
Auo_slider_7:
		moveq.l    #11,d0
		movea.l    a4,a1
		lea.l      18(a3),a0
		jsr        strncpy
Auo_slider_51:
		move.w     16(a3),d0
		clr.b      18(a3,d0.w)
		bra        Auo_slider_17
Auo_slider_6:
		lea.l      18(a3),a0
		move.l     a0,(a4)
		bra        Auo_slider_17
Auo_slider_10:
		movea.l    a4,a5
		move.l     (a5),60(a3)
		move.l     4(a5),64(a3)
		move.w     8(a5),68(a3)
		bra        Auo_slider_17
Auo_slider_20:
		movea.l    a4,a5
		move.l     60(a3),(a5)
		move.l     64(a3),4(a5)
		move.w     68(a3),8(a5)
		bra        Auo_slider_17
Auo_slider_9:
		ori.w      #0x0040,38(a3)
Auo_slider_8:
		movea.l    60(a3),a2
		move.l     a2,d0
		beq        Auo_slider_17
		move.l     8(a3),d1
		bpl.s      Auo_slider_29
		clr.l      8(a3)
Auo_slider_29:
		move.l     (a3),d3
		sub.l      4(a3),d3
		cmp.l      8(a3),d3
		bge.s      Auo_slider_30
		move.l     d3,8(a3)
Auo_slider_30:
		movea.l    (a7),a0
		bsr        sl_calc
		move.l     52(a3),d0
		bne.s      Auo_slider_31
		moveq.l    #1,d1
		bra.s      Auo_slider_32
Auo_slider_31:
		clr.w      d1
Auo_slider_32:
		move.w     d1,-(a7)
		move.l     8(a3),d0
		bne.s      Auo_slider_33
		moveq.l    #1,d2
		bra.s      Auo_slider_34
Auo_slider_33:
		clr.w      d2
Auo_slider_34:
		move.w     (a7)+,d0
		eor.w      d2,d0
		beq.s      Auo_slider_35
		ori.w      #0x0004,38(a3)
Auo_slider_35:
		move.l     52(a3),d0
		cmp.l      56(a3),d0
		bne.s      Auo_slider_36
		moveq.l    #1,d1
		bra.s      Auo_slider_37
Auo_slider_36:
		clr.w      d1
Auo_slider_37:
		move.w     d1,-(a7)
		cmp.l      8(a3),d3
		bne.s      Auo_slider_38
		moveq.l    #1,d0
		bra.s      Auo_slider_39
Auo_slider_38:
		clr.w      d0
Auo_slider_39:
		move.w     (a7)+,d1
		eor.w      d0,d1
		beq.s      Auo_slider_40
		ori.w      #0x0008,38(a3)
Auo_slider_40:
		move.w     46(a3),d0
		cmp.w      40(a3),d0
		bge.s      Auo_slider_41
		ori.w      #0x0010,38(a3)
Auo_slider_41:
		move.w     48(a3),d0
		cmp.w      44(a3),d0
		bge.s      Auo_slider_42
		ori.w      #0x0020,38(a3)
Auo_slider_42:
		move.w     50(a3),d0
		cmp.w      42(a3),d0
		beq.s      Auo_slider_43
		ori.w      #0x0080,38(a3)
Auo_slider_43:
		move.w     38(a3),d0
		and.w      #0x00FC,d0
		beq        Auo_slider_17
		moveq.l    #64,d1
		and.w      38(a3),d1
		bne.s      Auo_slider_44
		ori.w      #0x0002,38(a3)
Auo_slider_44:
		moveq.l    #-1,d1
		move.w     68(a3),d0
		movea.l    a2,a0
		movea.l    102(a2),a1
		jsr        (a1)
		move.w     40(a3),46(a3)
		move.w     44(a3),48(a3)
		move.l     8(a3),52(a3)
		move.w     42(a3),50(a3)
		move.l     d3,56(a3)
		andi.w     #0xFF01,38(a3)
		bra        Auo_slider_17
Auo_slider_23:
		move.l     (a4),30(a3)
		move.l     4(a4),34(a3)
		bra        Auo_slider_17
Auo_slider_26:
		move.l     8(a3),(a4)
		bra        Auo_slider_17
Auo_slider_21:
		move.l     (a4),(a3)
		bra        Auo_slider_17
Auo_slider_99:
		move.l     (a4),4(a3)
		bra        Auo_slider_17
Auo_slider_24:
		move.w     (a4),16(a3)
		bra        Auo_slider_17
Auo_slider_22:
		move.l     (a4),12(a3)
		bra        Auo_slider_17
Auo_slider_19:
		move.l     (a4),8(a3)
		bra        Auo_slider_17
Auo_slider_11:
		move.l     a4,d0
		bne.s      Auo_slider_45
		move.l     12(a3),d1
		add.l      d1,8(a3)
		bra        Auo_slider_17
Auo_slider_45:
		move.l     12(a3),d0
		move.w     (a4),d1
		ext.l      d1
		jsr        _lmul
		add.l      d0,8(a3)
		bra        Auo_slider_17
Auo_slider_12:
		move.l     a4,d0
		bne.s      Auo_slider_46
		move.l     12(a3),d1
		sub.l      d1,8(a3)
		bra        Auo_slider_17
Auo_slider_46:
		move.l     12(a3),d0
		move.w     (a4),d1
		ext.l      d1
		jsr        _lmul
		sub.l      d0,8(a3)
		bra        Auo_slider_17
Auo_slider_13:
		move.l     a4,d0
		bne.s      Auo_slider_47
		move.l     4(a3),d1
		add.l      d1,8(a3)
		bra        Auo_slider_17
Auo_slider_47:
		move.l     4(a3),d0
		move.w     (a4),d1
		ext.l      d1
		jsr        _lmul
		add.l      d0,8(a3)
		bra.w      Auo_slider_17
Auo_slider_14:
		move.l     a4,d0
		bne.s      Auo_slider_48
		move.l     4(a3),d1
		sub.l      d1,8(a3)
		bra.s      Auo_slider_17
Auo_slider_48:
		move.l     4(a3),d0
		move.w     (a4),d1
		ext.l      d1
		jsr        _lmul
		sub.l      d0,8(a3)
		bra.s      Auo_slider_17
Auo_slider_15:
		clr.l      8(a3)
		bra.s      Auo_slider_17
Auo_slider_1:
		move.l     (a3),d0
		sub.l      4(a3),d0
		move.l     d0,8(a3)
		bra.s      Auo_slider_17
Auo_slider_25:
		move.l     30(a3),d0
		beq.s      Auo_slider_17
		move.l     8(a3),d1
		bpl.s      Auo_slider_49
		clr.l      8(a3)
Auo_slider_49:
		move.l     (a3),d3
		sub.l      4(a3),d3
		cmp.l      8(a3),d3
		bge.s      Auo_slider_50
		move.l     d3,8(a3)
Auo_slider_50:
		move.l     8(a3),d0
		movea.l    34(a3),a0
		movea.l    30(a3),a1
		jsr        (a1)
		movea.l    a0,a1
		lea.l      18(a3),a0
		moveq.l    #11,d0
		jsr        strncpy
		bra        Auo_slider_51
Auo_slider_3:
		clr.w      d0
		bra.s      Auo_slider_52
Auo_slider_17:
		moveq.l    #1,d0
Auo_slider_52:
		addq.w     #4,a7
		movem.l    (a7)+,d3/a2-a5
		rts
Auo_slider_27:

printval:
		move.l     d3,-(a7)
		move.l     a2,-(a7)
		move.l     d0,d3
		lea.l      text,a2
		move.l     d3,-(a7)
		lea.l      xcf1aa,a1
		movea.l    a2,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a2,a0
		movea.l    (a7)+,a2
		move.l     (a7)+,d3
		rts

sl_bar:
		movem.l    d3-d5/a2-a3,-(a7)
		move.w     d0,d5
		movea.l    12(a0),a1
		movea.l    12(a1),a2
		lea.l      ACSblk,a3
		moveq.l    #1,d0
		and.l      4(a1),d0
		beq.s      sl_bar_1
		movea.l    (a3),a1
		move.w     20(a1),d3
		move.w     22(a0),d4
		move.w     20(a1),d1
		add.w      d1,d1
		sub.w      d1,d4
		bra.s      sl_bar_2
sl_bar_1:
		movea.l    (a3),a1
		move.w     18(a1),d3
		muls.w     16(a2),d3
		move.w     20(a0),d4
		move.w     18(a1),d0
		lsl.w      #2,d0
		sub.w      d0,d4
sl_bar_2:
		move.l     4(a2),d0
		move.w     d4,d1
		ext.l      d1
		jsr        _lmul
		move.l     (a2),d1
		jsr        _ldiv
		cmp.w      d0,d3
		ble.s      sl_bar_3
		move.w     d0,d1
		sub.w      d3,d1
		add.w      d1,d4
sl_bar_3:
		tst.w      d5
		bpl.s      sl_bar_4
		clr.w      d5
sl_bar_4:
		cmp.w      d5,d4
		bge.s      sl_bar_5
		move.w     d4,d5
sl_bar_5:
		move.l     (a2),d0
		move.w     d5,d1
		ext.l      d1
		jsr        _lmul
		move.w     d4,d1
		asr.w      #1,d1
		ext.l      d1
		add.l      d1,d0
		move.w     d4,d1
		ext.l      d1
		jsr        _ldiv
		movem.l    (a7)+,d3-d5/a2-a3
		rts

	.globl Aus_slider
Aus_slider:
		movem.l    d3-d7/a2-a6,-(a7)
		lea.l      -26(a7),a7
		movea.l    ACSblk,a0
		move.w     608(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    604(a0),a3
		adda.l     d0,a3
		move.l     600(a0),16(a7)
		move.l     a3,20(a7)
		movea.l    600(a0),a1
		movea.l    24(a1),a0
		movea.l    ACSblk,a1
		cmpa.l     604(a1),a0
		bne.s      Aus_slider_1
		move.w     #0x1000,d2
		or.w       608(a1),d2
		move.w     d2,24(a7)
		bra.s      Aus_slider_2
Aus_slider_1:
		movea.l    ACSblk,a0
		move.w     608(a0),24(a7)
Aus_slider_2:
		lea.l      16(a7),a1
		moveq.l    #9,d0
		movea.l    a3,a0
		bsr        Auo_slider
		move.l     12(a3),12(a7)
		movea.l    12(a7),a0
		movea.l    12(a0),a5
		moveq.l    #1,d0
		and.w      38(a5),d0
		beq.s      Aus_slider_3
		movea.l    a3,a0
		bsr        sl_calc
Aus_slider_3:
		lea.l      8(a7),a6
		lea.l      10(a7),a4
		move.l     _globl,-(a7)
		pea.l      (a6)
		movea.l    a4,a1
		movea.l    ACSblk,a0
		move.w     608(a0),d0
		movea.l    604(a0),a0
		jsr        mt_objc_offset
		addq.w     #8,a7
		moveq.l    #1,d0
		movea.l    12(a7),a0
		and.l      4(a0),d0
		beq.s      Aus_slider_4
		moveq.l    #1,d3
		bra.s      Aus_slider_5
Aus_slider_4:
		clr.w      d3
Aus_slider_5:
		tst.w      d3
		beq.s      Aus_slider_6
		movea.l    ACSblk,a0
		move.w     20(a0),d0
		movea.l    600(a0),a1
		move.w     54(a1),d4
		add.w      (a6),d4
		move.w     612(a0),d1
		sub.w      d4,d1
		move.w     d1,(a4)
		bra.s      Aus_slider_7
Aus_slider_6:
		movea.l    ACSblk,a0
		move.w     18(a0),d0
		add.w      d0,d0
		movea.l    600(a0),a1
		move.w     52(a1),d4
		add.w      (a4),d4
		move.w     610(a0),d1
		sub.w      d4,d1
		move.w     d1,(a4)
Aus_slider_7:
		moveq.l    #1,d5
		move.w     (a4),d1
		bmi        Aus_slider_8
		lea.l      6(a7),a2
		sub.w      d0,(a4)
		bpl.s      Aus_slider_9
		move.w     10(a3),d1
		and.w      #0x4000,d1
		beq.s      Aus_slider_10
		moveq.l    #14,d6
		bra        Aus_slider_11
Aus_slider_10:
		moveq.l    #11,d6
		bra        Aus_slider_12
Aus_slider_9:
		move.w     40(a5),d1
		sub.w      d1,(a4)
		bpl.s      Aus_slider_13
		moveq.l    #4,d2
		movea.l    12(a7),a0
		and.l      4(a0),d2
		bne        Aus_slider_8
		moveq.l    #13,d6
		bra        Aus_slider_12
Aus_slider_13:
		move.w     42(a5),d1
		sub.w      d1,(a4)
		bpl        Aus_slider_14
		move.w     (a4),d2
		add.w      d1,d2
		add.w      d0,d2
		add.w      d2,d4
		tst.w      d3
		beq.s      Aus_slider_15
		movea.l    ACSblk,a0
		move.w     612(a0),(a4)
		bra.s      Aus_slider_16
Aus_slider_15:
		movea.l    ACSblk,a0
		move.w     610(a0),(a4)
Aus_slider_16:
		move.w     (a4),d0
		sub.w      d4,d0
		movea.l    a3,a0
		bsr        sl_bar
		move.l     d0,(a7)
		cmp.l      8(a5),d0
		beq.s      Aus_slider_17
		lea.l      (a7),a1
		movea.l    a3,a0
		moveq.l    #17,d0
		bsr        Auo_slider
		suba.l     a1,a1
		moveq.l    #105,d0
		movea.l    a3,a0
		bsr        Auo_slider
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    a3,a0
		bsr        Auo_slider
Aus_slider_17:
		move.w     (a4),d7
		move.l     _globl,-(a7)
		pea.l      8(a7)
		pea.l      (a2)
		movea.l    a6,a1
		movea.l    a4,a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		tst.w      d3
		beq.s      Aus_slider_18
		move.w     (a6),(a4)
Aus_slider_18:
		cmp.w      (a4),d7
		bne.s      Aus_slider_19
		moveq.l    #1,d0
		and.w      (a2),d0
		bne.s      Aus_slider_17
Aus_slider_19:
		moveq.l    #1,d0
		and.w      (a2),d0
		bne.s      Aus_slider_16
		bra.w      Aus_slider_8
Aus_slider_14:
		move.w     44(a5),d0
		sub.w      d0,(a4)
		bpl.s      Aus_slider_20
		moveq.l    #4,d1
		movea.l    12(a7),a0
		and.l      4(a0),d1
		bne.s      Aus_slider_8
		moveq.l    #12,d6
		bra.s      Aus_slider_12
Aus_slider_20:
		move.w     10(a3),d0
		and.w      #0x4000,d0
		beq.s      Aus_slider_21
		moveq.l    #15,d6
Aus_slider_11:
		clr.w      d5
		bra.s      Aus_slider_12
Aus_slider_21:
		moveq.l    #10,d6
Aus_slider_12:
		move.l     8(a5),(a7)
		suba.l     a1,a1
		move.w     d6,d0
		movea.l    a3,a0
		bsr        Auo_slider
		move.l     (a7),d0
		cmp.l      8(a5),d0
		beq.s      Aus_slider_22
		suba.l     a1,a1
		movea.l    a3,a0
		moveq.l    #105,d0
		bsr        Auo_slider
Aus_slider_22:
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    a3,a0
		bsr        Auo_slider
		tst.w      d5
		beq.s      Aus_slider_8
		move.l     _globl,-(a7)
		pea.l      8(a7)
		pea.l      (a2)
		movea.l    a6,a1
		movea.l    a4,a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		moveq.l    #1,d0
		and.w      (a2),d0
		bne.s      Aus_slider_12
Aus_slider_8:
		lea.l      26(a7),a7
		movem.l    (a7)+,d3-d7/a2-a6
		rts

	.data

proto:
		dc.w $0000
		dc.w $0014
		dc.w $0000
		dc.w $0004
		dc.w $0000
		dc.w $0003
		dc.w $0000
		dc.w $0001
		dc.w $0002
		dc.w $3300
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l printval
		dc.w $0000
		dc.w $0000
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
xcf1a2:
		dc.w $0400
xcf1a4:
		dc.w $0100
xcf1a6:
		dc.w $0300
xcf1a8:
		dc.w $0200
xcf1aa:
		dc.b '%ld',0
		.even

	.bss

text: ds.b 12
