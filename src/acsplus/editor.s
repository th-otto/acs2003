		.text
		
untab:
		movem.l    d3-d4/a2-a3,-(a7)
		movea.l    a0,a3
		move.w     d0,d4
		move.w     d1,d3
		cmp.w      #0x0400,d1
		blt.s      untab_1
		move.w     #0x03FF,d3
untab_1:
		lea.l      buffer,a2
		move.w     d3,d1
		ext.l      d1
		moveq.l    #32,d0
		movea.l    a2,a0
		jsr        memset
		clr.b      0(a2,d3.w)
		movea.l    a3,a0
		movea.l    a2,a1
		move.l     a3,d0
		bne.s      untab_2
		bra.s      untab_3
untab_5:
		move.b     (a0)+,d0
		cmp.b      #0x09,d0
		bne.s      untab_4
		move.w     d4,d1
		move.l     a1,d2
		sub.l      a2,d2
		ext.l      d2
		divs.w     d4,d2
		swap       d2
		sub.w      d2,d1
		moveq.l    #-1,d2
		add.w      d1,d2
		sub.w      d2,d3
		adda.w     d1,a1
		bra.s      untab_2
untab_4:
		move.b     d0,(a1)+
untab_2:
		move.b     (a0),d0
		beq.s      untab_3
		move.w     d3,d1
		subq.w     #1,d3
		tst.w      d1
		bne.s      untab_5
untab_3:
		movea.l    a2,a0
		movem.l    (a7)+,d3-d4/a2-a3
		rts

posv:
		movem.l    d3-d5,-(a7)
		clr.w      d2
		move.w     d2,d3
		move.l     a0,d4
		bne.s      posv_1
		bra.s      posv_2
posv_5:
		cmpi.b     #0x09,(a0)+
		bne.s      posv_3
		move.w     d0,d4
		move.w     d2,d5
		ext.l      d5
		divs.w     d0,d5
		swap       d5
		sub.w      d5,d4
		add.w      d4,d2
		cmp.w      d2,d1
		blt.s      posv_2
		bra.s      posv_4
posv_3:
		addq.w     #1,d2
posv_4:
		addq.w     #1,d3
posv_1:
		move.b     (a0),d4
		beq.s      posv_2
		cmp.w      d2,d1
		bgt.s      posv_5
posv_2:
		move.w     d3,d0
		movem.l    (a7)+,d3-d5
		rts

vpos:
		move.l     d3,-(a7)
		move.l     d4,-(a7)
		clr.w      d2
		move.l     a0,d3
		bne.s      vpos_1
		bra.s      vpos_2
vpos_4:
		cmpi.b     #0x09,(a0)+
		bne.s      vpos_3
		move.w     d0,d3
		move.w     d2,d4
		ext.l      d4
		divs.w     d0,d4
		swap       d4
		sub.w      d4,d3
		add.w      d3,d2
		bra.s      vpos_1
vpos_3:
		addq.w     #1,d2
vpos_1:
		move.b     (a0),d3
		beq.s      vpos_2
		move.w     d1,d4
		subq.w     #1,d1
		tst.w      d4
		bne.s      vpos_4
vpos_2:
		move.w     d2,d0
		move.l     (a7)+,d4
		move.l     (a7)+,d3
		rts

A_editor:
		movem.l    d2-d7/a2-a6,-(a7)
		lea.l      -56(a7),a7
		movea.l    104(a7),a0
		move.w     4(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    (a0),a4
		adda.l     d0,a4
		movea.l    12(a4),a6
		movea.l    12(a6),a3
		move.l     a3,d0
		beq        A_editor_1
		moveq.l    #1,d1
		and.w      18(a3),d1
		beq.s      A_editor_2
		movea.l    a4,a0
		jsr        resize
A_editor_2:
		move.w     #0x0001,10(a7)
		moveq.l    #2,d0
		and.w      18(a3),d0
		beq.s      A_editor_3
		moveq.l    #4,d1
		and.w      18(a3),d1
		beq.s      A_editor_3
		clr.w      10(a7)
A_editor_3:
		movea.l    104(a7),a0
		move.w     10(a0),d0
		move.w     d0,30(a7)
		move.w     d0,26(a7)
		move.w     12(a0),d0
		move.w     d0,28(a7)
		moveq.l    #-1,d1
		add.w      74(a3),d1
		add.w      d1,26(a7)
		moveq.l    #-1,d2
		add.w      72(a3),d2
		add.w      d2,d0
		move.w     18(a0),d1
		move.w     d1,20(a7)
		move.w     d1,16(a7)
		move.w     20(a0),d2
		move.w     d2,18(a7)
		move.w     d2,14(a7)
		movea.w    20(a7),a1
		cmpa.w     30(a7),a1
		bge.s      A_editor_4
		move.w     30(a7),20(a7)
A_editor_4:
		move.w     18(a7),d1
		cmp.w      28(a7),d1
		bge.s      A_editor_5
		move.w     28(a7),18(a7)
A_editor_5:
		moveq.l    #-1,d1
		movea.l    104(a7),a0
		add.w      22(a0),d1
		add.w      d1,16(a7)
		moveq.l    #-1,d2
		add.w      24(a0),d2
		add.w      d2,14(a7)
		movea.w    16(a7),a1
		cmpa.w     26(a7),a1
		ble.s      A_editor_6
		move.w     26(a7),16(a7)
A_editor_6:
		cmp.w      14(a7),d0
		bge.s      A_editor_7
		move.w     d0,14(a7)
A_editor_7:
		move.w     20(a7),d0
		cmp.w      16(a7),d0
		bgt.s      A_editor_1
		move.w     18(a7),d1
		cmp.w      14(a7),d1
		ble.s      A_editor_8
A_editor_1:
		movea.l    104(a7),a0
		move.w     8(a0),d0
		bra        A_editor_9
A_editor_8:
		lea.l      40(a7),a4
		move.w     20(a7),(a4)
		move.w     18(a7),2(a4)
		move.w     16(a7),4(a4)
		move.w     14(a7),6(a4)
		lea.l      ACSblk,a5
		movea.l    a4,a0
		moveq.l    #1,d1
		movea.l    (a5),a1
		move.w     16(a1),d0
		jsr        vs_clip
		move.w     154(a3),d3
		move.w     30(a3),d7
		moveq.l    #1,d1
		movea.l    (a5),a0
		move.w     16(a0),d0
		jsr        vsf_interior
		moveq.l    #64,d0
		and.w      18(a3),d0
		bne        A_editor_10
		moveq.l    #1,d1
		movea.l    (a5),a0
		move.w     16(a0),d0
		jsr        vswr_mode
		clr.w      d1
		movea.l    (a5),a0
		move.w     16(a0),d0
		jsr        vst_rotation
		move.w     2(a3),d1
		movea.l    (a5),a0
		move.w     16(a0),d0
		jsr        vst_font
		lea.l      12(a7),a2
		pea.l      (a2)
		pea.l      (a2)
		movea.l    a2,a1
		movea.l    a2,a0
		move.w     4(a3),d1
		movea.l    (a5),a6
		move.w     16(a6),d0
		jsr        vst_height
		addq.w     #8,a7
		move.w     (a3),d1
		movea.l    (a5),a0
		move.w     16(a0),d0
		jsr        vst_color
		clr.w      d1
		movea.l    (a5),a0
		move.w     16(a0),d0
		jsr        vst_effects
		movea.l    a2,a1
		movea.l    a2,a0
		moveq.l    #5,d2
		clr.w      d1
		movea.l    (a5),a6
		move.w     16(a6),d0
		jsr        vst_alignment
		clr.w      d1
		movea.l    (a5),a0
		move.w     16(a0),d0
		jsr        vsf_color
		move.l     10(a3),4(a7)
		move.l     24(a3),d6
		move.w     16(a3),8(a7)
		move.l     d6,d0
		lsl.l      #3,d0
		movea.l    44(a3),a0
		adda.l     d0,a0
		move.l     a0,(a7)
		move.w     18(a7),d1
		sub.w      6(a3),d1
		move.w     d1,22(a7)
		moveq.l    #1,d2
		add.w      14(a7),d2
		move.w     d2,24(a7)
		movea.w    16(a7),a1
		move.w     a1,12(a4)
		move.w     a1,4(a4)
		bra        A_editor_11
A_editor_40:
		move.w     28(a7),d0
		cmp.w      22(a7),d0
		ble        A_editor_12
		move.w     10(a7),d1
		bne.s      A_editor_13
		cmp.l      102(a3),d6
		bne        A_editor_12
A_editor_13:
		move.w     28(a7),d0
		move.w     d0,10(a4)
		move.w     d0,2(a4)
		move.w     28(a7),d1
		add.w      6(a3),d1
		subq.w     #1,d1
		move.w     d1,14(a4)
		move.w     d1,6(a4)
		cmp.l      40(a3),d6
		bgt        A_editor_14
		move.l     4(a7),d0
		ble        A_editor_14
		move.w     18(a3),d2
		and.w      #0x0100,d2
		bne        A_editor_15
		movea.l    (a7),a0
		movea.l    (a0),a2
		move.l     a2,d1
		beq.s      A_editor_16
		clr.w      d4
		bra.s      A_editor_17
A_editor_20:
		cmpi.b     #0x09,(a2)+
		bne.s      A_editor_18
		move.w     d3,d0
		move.w     d4,d1
		ext.l      d1
		divs.w     d3,d1
		swap       d1
		sub.w      d1,d0
		add.w      d0,d4
		bra.s      A_editor_17
A_editor_18:
		addq.w     #1,d4
A_editor_17:
		cmp.w      d4,d7
		ble.s      A_editor_19
		move.b     (a2),d0
		bne.s      A_editor_20
A_editor_19:
		move.w     d4,d5
		sub.w      d7,d5
		bra.s      A_editor_21
A_editor_16:
		moveq.l    #-1,d5
A_editor_21:
		tst.w      d5
		bmi        A_editor_22
		move.b     (a2),d0
		beq        A_editor_22
		tst.w      d5
		ble.s      A_editor_23
		move.w     d5,d1
		ext.l      d1
		lea.l      line,a0
		moveq.l    #32,d0
		jsr        memset
A_editor_23:
		lea.l      line,a6
		adda.w     d5,a6
		bra.s      A_editor_24
A_editor_29:
		move.b     (a2)+,d0
		cmp.b      #0x09,d0
		bne.s      A_editor_25
		move.w     d3,d4
		move.w     d5,d1
		add.w      d7,d1
		ext.l      d1
		divs.w     d3,d1
		swap       d1
		sub.w      d1,d4
		add.w      d4,d5
		bra.s      A_editor_26
A_editor_27:
		move.b     #0x20,(a6)+
A_editor_26:
		move.w     d4,d1
		subq.w     #1,d4
		tst.w      d1
		bne.s      A_editor_27
		bra.s      A_editor_24
A_editor_25:
		addq.w     #1,d5
		move.b     d0,(a6)+
A_editor_24:
		move.b     (a2),d0
		beq.s      A_editor_28
		cmp.w      8(a7),d5
		blt.s      A_editor_29
A_editor_28:
		clr.b      (a6)
		lea.l      line,a0
		move.w     28(a7),d2
		move.w     30(a7),d1
		movea.l    (a5),a1
		move.w     16(a1),d0
		jsr        v_gtext
		cmp.w      8(a7),d5
		bge.s      A_editor_15
		move.w     d5,d0
		muls.w     8(a3),d0
		add.w      30(a7),d0
		move.w     d0,(a4)
		cmp.w      4(a4),d0
		bgt.s      A_editor_15
		bra.s      A_editor_30
A_editor_22:
		move.w     20(a7),(a4)
A_editor_30:
		movea.l    a4,a0
		movea.l    (a5),a1
		move.w     16(a1),d0
		jsr        vr_recfl
A_editor_15:
		moveq.l    #3,d0
		movea.l    (a7),a0
		and.w      6(a0),d0
		beq        A_editor_12
		moveq.l    #2,d1
		and.w      6(a0),d1
		bne.s      A_editor_31
		move.w     18(a3),d2
		and.w      #0x0100,d2
		bne        A_editor_12
A_editor_31:
		move.w     112(a3),d0
		bne.s      A_editor_32
		cmp.l      48(a3),d6
		beq.s      A_editor_33
		cmp.l      56(a3),d6
		bne.s      A_editor_32
A_editor_33:
		move.w     18(a3),d0
		and.w      #0x0200,d0
		beq        A_editor_12
		cmp.l      48(a3),d6
		bne.s      A_editor_34
		move.l     64(a3),d0
		move.w     d7,d1
		ext.l      d1
		sub.l      d1,d0
		move.w     8(a3),d1
		ext.l      d1
		jsr        _lmul
		add.w      30(a7),d0
		move.w     d0,8(a4)
		move.w     d0,(a4)
		bra.s      A_editor_35
A_editor_34:
		move.w     20(a7),d0
		move.w     d0,8(a4)
		move.w     d0,(a4)
A_editor_35:
		cmp.l      56(a3),d6
		bne.s      A_editor_36
		bra.s      A_editor_37
A_editor_32:
		cmpi.w     #0x0005,112(a3)
		bne        A_editor_38
		move.w     18(a3),d0
		and.w      #0x0200,d0
		beq        A_editor_12
		move.l     64(a3),d0
		move.w     d7,d1
		ext.l      d1
		sub.l      d1,d0
		move.w     8(a3),d1
		ext.l      d1
		jsr        _lmul
		add.w      30(a7),d0
		move.w     d0,8(a4)
		move.w     d0,(a4)
A_editor_37:
		move.l     68(a3),d0
		move.w     d7,d1
		ext.l      d1
		sub.l      d1,d0
		move.w     8(a3),d1
		ext.l      d1
		jsr        _lmul
		add.w      30(a7),d0
		subq.w     #1,d0
		move.w     d0,12(a4)
		move.w     d0,4(a4)
A_editor_36:
		move.w     (a4),d0
		cmp.w      4(a4),d0
		bgt.s      A_editor_39
		movea.l    (a5),a0
		pea.l      618(a0)
		movea.l    a0,a1
		lea.l      618(a1),a1
		movea.l    a4,a0
		moveq.l    #10,d1
		movea.l    (a5),a2
		move.w     16(a2),d0
		jsr        vro_cpyfm
		addq.w     #4,a7
A_editor_39:
		move.w     16(a7),d0
		move.w     d0,12(a4)
		move.w     d0,4(a4)
		bra.s      A_editor_12
A_editor_38:
		move.w     20(a7),d0
		move.w     d0,8(a4)
		move.w     d0,(a4)
		movea.l    (a5),a0
		pea.l      618(a0)
		movea.l    a0,a1
		lea.l      618(a1),a1
		movea.l    a4,a0
		moveq.l    #10,d1
		movea.l    (a5),a2
		move.w     16(a2),d0
		jsr        vro_cpyfm
		addq.w     #4,a7
		bra.s      A_editor_12
A_editor_14:
		move.w     20(a7),(a4)
		movea.l    a4,a0
		movea.l    (a5),a1
		move.w     16(a1),d0
		jsr        vr_recfl
A_editor_12:
		move.w     6(a3),d0
		add.w      d0,28(a7)
		addq.l     #8,(a7)
		addq.l     #1,d6
		subq.l     #1,4(a7)
A_editor_11:
		move.w     28(a7),d0
		cmp.w      24(a7),d0
		blt        A_editor_40
A_editor_10:
		move.w     #0x0080,d0
		and.w      18(a3),d0
		beq        A_editor_41
		move.l     48(a3),d1
		move.l     24(a3),d2
		add.l      10(a3),d2
		cmp.l      d2,d1
		bge        A_editor_41
		cmp.l      24(a3),d1
		blt        A_editor_41
		move.w     10(a7),d4
		bne.s      A_editor_42
		move.l     102(a3),d5
		cmp.l      d1,d5
		bne        A_editor_41
A_editor_42:
		move.w     18(a3),d0
		and.w      #0x0200,d0
		bne        A_editor_41
		move.l     48(a3),d1
		lsl.l      #3,d1
		movea.l    44(a3),a0
		adda.l     d1,a0
		move.l     a0,(a7)
		move.w     66(a3),d1
		movea.l    (a0),a0
		move.w     d3,d0
		bsr        posv
		move.w     d0,8(a7)
		move.w     d0,d1
		movea.l    (a7),a0
		movea.l    (a0),a0
		move.w     d3,d0
		bsr        vpos
		move.w     d0,8(a7)
		moveq.l    #3,d1
		movea.l    (a5),a0
		move.w     16(a0),d0
		jsr        vswr_mode
		moveq.l    #1,d1
		movea.l    (a5),a0
		move.w     16(a0),d0
		jsr        vsf_color
		move.w     8(a7),d0
		sub.w      d7,d0
		muls.w     8(a3),d0
		movea.l    104(a7),a0
		add.w      10(a0),d0
		move.w     d0,32(a7)
		move.w     50(a3),d1
		sub.w      26(a3),d1
		muls.w     6(a3),d1
		add.w      12(a0),d1
		move.w     d1,34(a7)
		move.w     32(a7),d2
		add.w      8(a3),d2
		subq.w     #1,d2
		move.w     d2,36(a7)
		move.w     34(a7),d3
		add.w      6(a3),d3
		subq.w     #1,d3
		move.w     d3,38(a7)
		move.w     156(a3),d2
		subq.w     #1,d2
		beq.s      A_editor_43
		subq.w     #1,d2
		beq.s      A_editor_44
		subq.w     #1,d2
		beq.s      A_editor_45
		bra.s      A_editor_46
A_editor_43:
		moveq.l    #-1,d0
		add.w      38(a7),d0
		move.w     d0,34(a7)
		bra.s      A_editor_44
A_editor_45:
		moveq.l    #1,d1
		movea.l    (a5),a0
		move.w     16(a0),d0
		jsr        vsf_perimeter
		clr.w      d1
		movea.l    (a5),a0
		move.w     16(a0),d0
		jsr        vsf_interior
		lea.l      32(a7),a0
		movea.l    (a5),a1
		move.w     16(a1),d0
		jsr        v_bar
		bra.s      A_editor_41
A_editor_46:
		moveq.l    #1,d0
		add.w      32(a7),d0
		move.w     d0,36(a7)
A_editor_44:
		lea.l      32(a7),a0
		movea.l    (a5),a1
		move.w     16(a1),d0
		jsr        vr_recfl
A_editor_41:
		movea.l    a4,a0
		clr.w      d1
		movea.l    (a5),a1
		move.w     16(a1),d0
		jsr        vs_clip
		moveq.l    #-10,d0
		movea.l    104(a7),a0
		and.w      8(a0),d0
A_editor_9:
		lea.l      56(a7),a7
		movem.l    (a7)+,d2-d7/a2-a6
		rts

edit_view:
		move.l     d3,-(a7)
		move.l     d4,-(a7)
		move.l     48(a0),d0
		move.l     24(a0),d1
		add.l      10(a0),d1
		subq.l     #1,d1
		cmp.l      40(a0),d1
		ble.s      edit_view_1
		move.l     40(a0),d1
		move.l     d1,d2
		sub.l      10(a0),d2
		addq.l     #1,d2
		move.l     d2,24(a0)
		tst.l      d2
		bpl.s      edit_view_1
		clr.l      24(a0)
edit_view_1:
		move.l     24(a0),d2
		sub.l      d0,d2
		move.l     d0,d3
		sub.l      d1,d3
		tst.l      d2
		bgt.s      edit_view_2
		tst.l      d3
		ble.s      edit_view_3
edit_view_2:
		tst.l      d2
		ble.s      edit_view_4
		moveq.l    #2,d4
		cmp.l      d2,d4
		bge.s      edit_view_5
		bra.s      edit_view_6
edit_view_4:
		moveq.l    #2,d2
		cmp.l      d3,d2
		bge.s      edit_view_7
edit_view_6:
		move.l     10(a0),d2
		asr.l      #1,d2
		sub.l      d2,d0
		bra.s      edit_view_5
edit_view_7:
		moveq.l    #-1,d2
		add.l      10(a0),d2
		sub.l      d2,d0
edit_view_5:
		move.l     40(a0),d1
		sub.l      10(a0),d1
		addq.l     #1,d1
		cmp.l      d0,d1
		bge.s      edit_view_8
		move.l     d1,d0
edit_view_8:
		tst.l      d0
		bpl.s      edit_view_9
		moveq.l    #0,d0
edit_view_9:
		move.l     d0,24(a0)
edit_view_3:
		move.l     64(a0),d3
		move.l     28(a0),d1
		add.l      14(a0),d1
		cmp.l      32(a0),d1
		ble.s      edit_view_10
		move.l     32(a0),d1
edit_view_10:
		cmp.l      28(a0),d3
		ble.s      edit_view_11
		cmp.l      d3,d1
		bgt.s      edit_view_12
edit_view_11:
		move.l     14(a0),d0
		asr.l      #1,d0
		addq.l     #1,d0
		sub.l      d0,d3
		move.l     32(a0),d1
		sub.l      14(a0),d1
		cmp.l      d3,d1
		bge.s      edit_view_13
		move.l     d1,d3
edit_view_13:
		tst.l      d3
		bpl.s      edit_view_14
		moveq.l    #0,d3
edit_view_14:
		cmp.l      28(a0),d3
		beq.s      edit_view_12
		ori.w      #0x0008,18(a0)
		move.l     d3,28(a0)
edit_view_12:
		move.l     (a7)+,d4
		move.l     (a7)+,d3
		rts

edit_showcol:
		cmp.l      32(a0),d0
		ble.s      edit_showcol_1
		move.l     32(a0),d0
edit_showcol_1:
		cmp.l      28(a0),d0
		bge.s      edit_showcol_2
		move.l     14(a0),d1
		asr.l      #2,d1
		sub.l      d1,28(a0)
		move.l     28(a0),d1
		bpl.s      edit_showcol_3
		clr.l      28(a0)
		bra.s      edit_showcol_3
edit_showcol_2:
		move.l     28(a0),d1
		add.l      14(a0),d1
		cmp.l      d1,d0
		blt.s      edit_showcol_3
		move.l     14(a0),d0
		asr.l      #2,d0
		add.l      d0,28(a0)
		move.l     32(a0),d0
		sub.l      14(a0),d0
		tst.l      d0
		bpl.s      edit_showcol_4
		moveq.l    #0,d0
edit_showcol_4:
		cmp.l      28(a0),d0
		bge.s      edit_showcol_3
		move.l     d0,28(a0)
edit_showcol_3:
		rts

edit_freeundo:
		movem.l    d3/a2-a3,-(a7)
		movea.l    a0,a2
		move.l     d0,d3
		move.l     a2,d1
		beq.s      edit_freeundo_1
		movea.l    a2,a3
		bra.s      edit_freeundo_2
edit_freeundo_3:
		movea.l    (a3)+,a0
		jsr        Ax_ifree
edit_freeundo_2:
		move.l     d3,d0
		subq.l     #1,d3
		tst.l      d0
		bne.s      edit_freeundo_3
		movea.l    a2,a0
		jsr        Ax_ifree
edit_freeundo_1:
		movem.l    (a7)+,d3/a2-a3
		rts

edit_makeundo:
		movem.l    d3-d4/a2-a3,-(a7)
		movea.l    a0,a3
		move.l     d0,d3
		move.l     d1,d4
		sub.l      d0,d4
		addq.l     #1,d4
		tst.l      d4
		ble.s      edit_makeundo_1
		move.l     d4,d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      edit_makeundo_2
		ori.w      #0x0001,158(a3)
edit_makeundo_1:
		suba.l     a0,a0
		bra.s      edit_makeundo_3
edit_makeundo_2:
		movea.l    a2,a0
		move.l     d3,d0
		lsl.l      #3,d0
		movea.l    44(a3),a1
		adda.l     d0,a1
		bra.s      edit_makeundo_4
edit_makeundo_5:
		move.l     (a1),(a2)
		addq.w     #4,a2
		addq.w     #8,a1
edit_makeundo_4:
		move.l     d4,d0
		subq.l     #1,d4
		tst.l      d0
		bne.s      edit_makeundo_5
edit_makeundo_3:
		movem.l    (a7)+,d3-d4/a2-a3
		rts

edit_movelines:
		movem.l    d3-d5/a2-a3,-(a7)
		movea.l    a0,a2
		move.l     d0,d4
		move.l     d1,d3
		tst.l      d1
		ble.s      edit_movelines_1
		move.l     40(a2),d2
		add.l      d1,d2
		cmp.l      36(a2),d2
		blt.s      edit_movelines_2
		move.l     d1,d0
		jsr        edit_expand
		tst.w      d0
		beq.s      edit_movelines_2
		moveq.l    #-1,d0
		bra        edit_movelines_3
edit_movelines_2:
		move.l     d4,d0
		lsl.l      #3,d0
		movea.l    44(a2),a3
		adda.l     d0,a3
		moveq.l    #1,d5
		add.l      40(a2),d5
		sub.l      d4,d5
		tst.l      d5
		ble.s      edit_movelines_4
		move.l     d5,d0
		lsl.l      #3,d0
		movea.l    a3,a1
		move.l     d3,d1
		lsl.l      #3,d1
		lea.l      0(a3,d1.l),a0
		jsr        memcpy
edit_movelines_4:
		add.l      d3,40(a2)
		bra.s      edit_movelines_5
edit_movelines_1:
		tst.l      d3
		bpl.s      edit_movelines_5
		move.l     d4,d0
		lsl.l      #3,d0
		movea.l    44(a2),a3
		adda.l     d0,a3
		neg.l      d3
		moveq.l    #1,d5
		add.l      40(a2),d5
		sub.l      d4,d5
		sub.l      d3,d5
		sub.l      d3,40(a2)
		tst.l      d5
		ble.s      edit_movelines_6
		move.l     d5,d0
		lsl.l      #3,d0
		move.l     d3,d1
		lsl.l      #3,d1
		lea.l      0(a3,d1.l),a1
		movea.l    a3,a0
		jsr        memcpy
edit_movelines_6:
		move.l     d3,d1
		lsl.l      #3,d1
		clr.w      d0
		move.l     40(a2),d2
		lsl.l      #3,d2
		movea.l    44(a2),a0
		lea.l      8(a0,d2.l),a0
		jsr        memset
		move.l     40(a2),d0
		bpl.s      edit_movelines_5
		clr.l      40(a2)
edit_movelines_5:
		clr.w      d0
edit_movelines_3:
		movem.l    (a7)+,d3-d5/a2-a3
		rts

edit_insblk:
		movem.l    d3-d7/a2-a6,-(a7)
		lea.l      -32(a7),a7
		movea.l    a0,a3
		move.l     a1,28(a7)
		move.l     (a1),d3
		move.l     d3,d0
		add.l      16(a1),d0
		subq.l     #1,d0
		move.l     d0,12(a7)
		sub.l      36(a3),d0
		addq.l     #1,d0
		move.l     d0,8(a7)
		tst.l      d0
		ble.s      edit_insblk_1
		jsr        edit_expand
		tst.w      d0
		bne        edit_insblk_2
edit_insblk_1:
		move.l     12(a7),4(a7)
		move.l     12(a7),d0
		cmp.l      40(a3),d0
		ble.s      edit_insblk_3
		move.l     40(a3),4(a7)
		move.l     d0,40(a3)
edit_insblk_3:
		move.l     4(a7),d0
		sub.l      d3,d0
		addq.l     #1,d0
		move.l     d0,16(a7)
		move.l     4(a7),d1
		movea.l    a3,a0
		move.l     d3,d0
		bsr        edit_makeundo
		movea.l    a0,a4
		move.l     a4,d0
		beq        edit_insblk_2
		move.l     146(a3),d0
		movea.l    150(a3),a0
		bsr        edit_freeundo
		clr.l      150(a3)
		clr.l      146(a3)
		movea.l    28(a7),a0
		move.l     20(a0),24(a7)
		movea.l    24(a7),a1
		movea.l    (a1),a0
		jsr        strlen
		move.w     d0,(a7)
		move.w     154(a3),d6
		movea.l    28(a7),a0
		move.w     6(a0),d1
		move.l     d3,d2
		lsl.l      #3,d2
		movea.l    44(a3),a1
		movea.l    0(a1,d2.l),a0
		move.w     d6,d0
		bsr        vpos
		move.w     d0,2(a7)
		move.l     d3,d7
		bra        edit_insblk_4
edit_insblk_13:
		move.l     d7,d0
		lsl.l      #3,d0
		movea.l    44(a3),a6
		adda.l     d0,a6
		movea.l    (a6),a2
		move.l     a2,d1
		bne.s      edit_insblk_5
		lea.l      xcf36c,a2
edit_insblk_5:
		move.w     2(a7),d1
		move.w     d6,d0
		movea.l    a2,a0
		bsr        posv
		move.w     d0,d5
		move.w     d5,d1
		movea.l    a2,a0
		move.w     d6,d0
		bsr        vpos
		move.w     2(a7),d4
		sub.w      d0,d4
		movea.l    24(a7),a0
		movea.l    (a0),a0
		jsr        strlen
		move.w     4(a6),d1
		ext.l      d1
		add.l      d1,d0
		move.w     d4,d2
		ext.l      d2
		add.l      d2,d0
		move.l     d0,20(a7)
		moveq.l    #1,d0
		add.l      20(a7),d0
		jsr        Ax_malloc
		movea.l    a0,a5
		move.l     a5,d0
		beq.s      edit_insblk_6
		move.w     d5,d0
		ext.l      d0
		movea.l    a2,a1
		jsr        strncpy
		tst.w      d4
		beq.s      edit_insblk_7
		move.w     d4,d1
		ext.l      d1
		moveq.l    #32,d0
		lea.l      0(a5,d5.w),a0
		jsr        memset
edit_insblk_7:
		movea.l    24(a7),a0
		movea.l    (a0),a1
		lea.l      0(a5,d5.w),a0
		adda.w     d4,a0
		jsr        strcpy
		lea.l      0(a2,d5.w),a1
		lea.l      0(a5,d5.w),a0
		adda.w     d4,a0
		jsr        strcat
		bra.s      edit_insblk_8
edit_insblk_6:
		ori.w      #0x0001,158(a3)
		move.l     d3,d4
		bra.s      edit_insblk_9
edit_insblk_12:
		move.l     d4,d0
		lsl.l      #3,d0
		movea.l    44(a3),a6
		adda.l     d0,a6
		movea.l    (a6),a0
		jsr        Ax_ifree
		move.l     d4,d0
		sub.l      d3,d0
		lsl.l      #2,d0
		move.l     0(a4,d0.l),(a6)
		move.l     (a6),d1
		beq.s      edit_insblk_10
		movea.l    d1,a0
		jsr        strlen
		addq.w     #1,d0
		move.w     d0,4(a6)
		bra.s      edit_insblk_11
edit_insblk_10:
		clr.w      4(a6)
edit_insblk_11:
		addq.l     #1,d4
edit_insblk_9:
		cmp.l      d4,d7
		bge.s      edit_insblk_12
		movea.l    a4,a0
		jsr        Ax_ifree
		bra        edit_insblk_2
edit_insblk_8:
		move.l     a5,(a6)
		move.w     22(a7),4(a6)
		clr.w      6(a6)
		addq.l     #4,24(a7)
		addq.l     #1,d7
edit_insblk_4:
		cmp.l      12(a7),d7
		ble        edit_insblk_13
		move.l     a4,150(a3)
		move.l     16(a7),146(a3)
		andi.w     #0xFDFF,18(a3)
		ori.w      #0x0008,18(a3)
		move.l     d3,122(a3)
		move.l     4(a7),130(a3)
		movea.l    28(a7),a0
		move.l     4(a0),d0
		move.l     d0,126(a3)
		move.l     d0,134(a3)
		move.l     12(a7),138(a3)
		move.w     (a7),d0
		ext.l      d0
		add.l      4(a0),d0
		move.l     d0,142(a3)
		move.l     d3,48(a3)
		move.l     142(a3),52(a3)
		move.w     54(a3),d1
		move.w     d6,d0
		move.l     d3,d2
		lsl.l      #3,d2
		movea.l    44(a3),a1
		movea.l    0(a1,d2.l),a0
		bsr        vpos
		ext.l      d0
		move.l     d0,64(a3)
edit_insblk_2:
		lea.l      32(a7),a7
		movem.l    (a7)+,d3-d7/a2-a6
		rts

edit_cutblk:
		movem.l    d3-d7/a2-a6,-(a7)
		lea.l      -12(a7),a7
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     4(a2),d0
		cmp.l      12(a2),d0
		blt.s      edit_cutblk_1
		move.l     16(a2),d0
		movea.l    20(a2),a0
		bsr        edit_freeundo
		bra        edit_cutblk_2
edit_cutblk_1:
		move.l     8(a2),d1
		move.l     (a2),d0
		movea.l    a3,a0
		bsr        edit_makeundo
		move.l     a0,8(a7)
		move.l     a0,d0
		beq        edit_cutblk_2
		move.l     146(a3),d0
		movea.l    150(a3),a0
		bsr        edit_freeundo
		clr.l      150(a3)
		clr.l      146(a3)
		move.l     8(a2),d0
		sub.l      (a2),d0
		addq.l     #1,d0
		move.l     d0,4(a7)
		move.w     154(a3),d4
		move.w     6(a2),d1
		move.l     (a2),d2
		lsl.l      #3,d2
		movea.l    44(a3),a0
		movea.l    0(a0,d2.l),a0
		move.w     d4,d0
		bsr        vpos
		move.w     d0,2(a7)
		move.w     14(a2),d1
		move.l     8(a2),d2
		lsl.l      #3,d2
		movea.l    44(a3),a0
		movea.l    0(a0,d2.l),a0
		move.w     d4,d0
		bsr        vpos
		move.w     d0,(a7)
		move.w     2(a7),d1
		cmp.w      d0,d1
		ble.s      edit_cutblk_3
		move.w     d1,d0
		move.w     (a7),2(a7)
		move.w     d0,(a7)
edit_cutblk_3:
		move.l     (a2),d7
		bra        edit_cutblk_4
edit_cutblk_13:
		move.l     d7,d0
		lsl.l      #3,d0
		movea.l    44(a3),a5
		adda.l     d0,a5
		movea.l    (a5),a6
		move.l     a6,d1
		beq        edit_cutblk_5
		movea.l    a6,a0
		move.w     d4,d0
		move.w     2(a7),d1
		bsr        posv
		move.w     d0,d3
		move.w     (a7),d1
		movea.l    a6,a0
		move.w     d4,d0
		bsr        posv
		move.w     d0,d5
		move.w     d5,d6
		sub.w      d3,d6
		ext.l      d6
		tst.l      d6
		ble        edit_cutblk_5
		move.w     4(a5),d1
		ext.l      d1
		sub.l      d6,d1
		move.l     d1,d6
		tst.l      d1
		ble.w      edit_cutblk_6
		moveq.l    #1,d0
		add.l      d1,d0
		jsr        Ax_malloc
		movea.l    a0,a4
		move.l     a4,d0
		beq.s      edit_cutblk_7
		move.w     d3,d0
		ext.l      d0
		movea.l    a6,a1
		jsr        strncpy
		lea.l      0(a6,d5.w),a1
		lea.l      0(a4,d3.w),a0
		jsr        strcpy
		bra.s      edit_cutblk_8
edit_cutblk_7:
		move.l     (a2),d5
		bra.s      edit_cutblk_9
		move.l     d5,d0
edit_cutblk_12:
		lsl.l      #3,d0
		movea.l    44(a3),a5
		adda.l     d0,a5
		movea.l    (a5),a0
		jsr        Ax_ifree
		move.l     d5,d0
		sub.l      (a2),d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		move.l     0(a0,d0.l),(a5)
		move.l     (a5),d0
		beq.s      edit_cutblk_10
		movea.l    d0,a0
		jsr        strlen
		addq.w     #1,d0
		move.w     d0,4(a5)
		bra.s      edit_cutblk_11
edit_cutblk_10:
		clr.w      4(a5)
edit_cutblk_11:
		addq.l     #1,d5
edit_cutblk_9:
		cmp.l      d5,d7
		bgt.s      edit_cutblk_12
		movea.l    8(a7),a0
		jsr        Ax_ifree
		bra.s      edit_cutblk_2
edit_cutblk_6:
		suba.l     a4,a4
edit_cutblk_8:
		move.l     a4,(a5)
		move.w     d6,4(a5)
		clr.w      6(a5)
edit_cutblk_5:
		addq.l     #1,d7
edit_cutblk_4:
		cmp.l      8(a2),d7
		ble        edit_cutblk_13
		move.l     (a2),122(a3)
		move.l     4(a2),d0
		move.l     d0,126(a3)
		move.l     d0,142(a3)
		move.l     d0,52(a3)
		move.l     8(a2),d1
		move.l     d1,130(a3)
		move.l     d1,138(a3)
		move.l     12(a2),134(a3)
		move.w     2(a7),d0
		ext.l      d0
		move.l     d0,64(a3)
		move.l     8(a7),150(a3)
		move.l     4(a7),146(a3)
		andi.w     #0xFDFF,18(a3)
		ori.w      #0x0008,18(a3)
edit_cutblk_2:
		lea.l      12(a7),a7
		movem.l    (a7)+,d3-d7/a2-a6
		rts

edit_substitute:
		movem.l    d3-d7/a2-a6,-(a7)
		lea.l      -26(a7),a7
		movea.l    a0,a2
		movea.l    a1,a3
		ori.w      #0x2000,18(a2)
		clr.w      16(a7)
		cmpi.w     #0x0005,112(a2)
		bne.s      edit_substitute_1
		move.w     18(a2),d0
		and.w      #0x0200,d0
		beq.s      edit_substitute_2
		clr.w      d2
		move.l     56(a2),d1
		move.l     48(a2),d0
		jsr        edit_selrange
edit_substitute_2:
		move.l     (a3),d0
		cmp.l      8(a3),d0
		bne.s      edit_substitute_3
		move.l     4(a3),d1
		cmp.l      12(a3),d1
		bne.s      edit_substitute_3
		movea.l    20(a3),a0
		movea.l    (a0),a1
		move.b     (a1),d2
		beq.s      edit_substitute_1
		movea.l    a2,a0
		movea.l    a3,a1
		bsr        edit_insblk
		bra        edit_substitute_4
edit_substitute_3:
		moveq.l    #1,d0
		cmp.l      16(a3),d0
		bne.s      edit_substitute_5
		movea.l    20(a3),a0
		movea.l    (a0),a1
		move.b     (a1),d1
		bne.s      edit_substitute_5
		movea.l    a2,a0
		movea.l    a3,a1
		bsr        edit_cutblk
		bra        edit_substitute_4
edit_substitute_5:
		move.w     #0x0001,16(a7)
		move.l     (a3),8(a3)
		move.l     4(a3),12(a3)
edit_substitute_1:
		move.l     (a3),d4
		move.l     8(a3),d5
		sub.l      d4,d5
		addq.l     #1,d5
		move.l     8(a3),d1
		move.l     (a3),d0
		movea.l    a2,a0
		bsr        edit_makeundo
		move.l     a0,8(a7)
		move.l     a0,d0
		beq        edit_substitute_4
		move.l     146(a2),d0
		movea.l    150(a2),a0
		bsr        edit_freeundo
		clr.l      150(a2)
		clr.l      146(a2)
		moveq.l    #8,d0
		move.l     8(a3),d1
		lsl.l      #3,d1
		movea.l    44(a2),a1
		adda.l     d1,a1
		lea.l      (a7),a0
		jsr        memcpy
		moveq.l    #1,d0
		add.l      d4,d0
		move.l     d0,22(a7)
		moveq.l    #-1,d1
		add.l      16(a3),d1
		sub.l      8(a3),d1
		add.l      d4,d1
		move.l     d1,18(a7)
		movea.l    a2,a0
		bsr        edit_movelines
		tst.w      d0
		beq.s      edit_substitute_6
		movea.l    8(a7),a0
		jsr        Ax_ifree
		bra        edit_substitute_4
edit_substitute_6:
		andi.w     #0xFDFF,18(a2)
		move.l     (a3),122(a2)
		move.l     4(a3),126(a2)
		move.l     8(a3),130(a2)
		move.l     12(a3),134(a2)
		move.l     20(a3),12(a7)
		moveq.l    #1,d0
		cmp.l      16(a3),d0
		bne        edit_substitute_7
		cmp.l      d5,d0
		bne.s      edit_substitute_8
		move.w     16(a7),d1
		bne.s      edit_substitute_8
		movea.l    a2,a0
		move.l     d4,d0
		jsr        edit_updateline
		bra.s      edit_substitute_9
edit_substitute_8:
		ori.w      #0x0008,18(a2)
edit_substitute_9:
		move.l     d4,d0
		lsl.l      #3,d0
		movea.l    44(a2),a5
		adda.l     d0,a5
		movea.l    12(a7),a0
		movea.l    (a0),a0
		jsr        strlen
		move.l     d0,d3
		add.l      4(a3),d3
		move.l     d3,d7
		sub.l      12(a3),d7
		move.w     4(a7),d0
		ext.l      d0
		add.l      d0,d7
		tst.l      d7
		ble.s      edit_substitute_10
		moveq.l    #1,d0
		add.l      d7,d0
		jsr        Ax_malloc
		movea.l    a0,a4
		move.l     a4,d0
		beq        edit_substitute_11
		move.w     4(a5),d0
		ble.s      edit_substitute_12
		move.l     4(a3),d0
		movea.l    (a5),a1
		jsr        strncpy
edit_substitute_12:
		movea.l    12(a7),a0
		movea.l    (a0),a1
		move.l     4(a3),d0
		lea.l      0(a4,d0.l),a0
		jsr        strcpy
		move.w     4(a7),d0
		ble.s      edit_substitute_13
		move.l     12(a3),d1
		movea.l    (a7),a1
		adda.l     d1,a1
		move.l     4(a3),d2
		lea.l      0(a4,d2.l),a0
		jsr        strcat
		bra.s      edit_substitute_13
edit_substitute_10:
		suba.l     a4,a4
edit_substitute_13:
		move.l     d4,48(a2)
		move.l     d3,52(a2)
		move.w     d3,d1
		move.w     154(a2),d0
		movea.l    a4,a0
		bsr        vpos
		ext.l      d0
		move.l     d0,64(a2)
		move.l     a4,(a5)
		move.w     d7,4(a5)
		clr.w      6(a5)
		bra        edit_substitute_14
edit_substitute_7:
		ori.w      #0x0008,18(a2)
		move.l     d4,d0
		lsl.l      #3,d0
		movea.l    44(a2),a5
		adda.l     d0,a5
		movea.l    12(a7),a0
		movea.l    (a0),a0
		jsr        strlen
		move.l     d0,d7
		add.l      4(a3),d7
		tst.l      d7
		ble.s      edit_substitute_15
		moveq.l    #1,d0
		add.l      d7,d0
		jsr        Ax_malloc
		movea.l    a0,a4
		move.l     a4,d0
		beq        edit_substitute_11
		move.l     4(a3),d0
		movea.l    (a5),a1
		jsr        strncpy
		movea.l    12(a7),a0
		movea.l    (a0),a1
		move.l     4(a3),d0
		lea.l      0(a4,d0.l),a0
		jsr        strcpy
		bra.s      edit_substitute_16
edit_substitute_15:
		suba.l     a4,a4
edit_substitute_16:
		move.l     a4,(a5)
		move.w     d7,4(a5)
		clr.w      6(a5)
		move.l     16(a3),d0
		lsl.l      #2,d0
		movea.l    12(a7),a0
		movea.l    -4(a0,d0.l),a6
		movea.l    a6,a0
		jsr        strlen
		move.l     d0,d3
		move.w     4(a7),d7
		ext.l      d7
		add.l      d3,d7
		sub.l      12(a3),d7
		tst.l      d7
		ble.s      edit_substitute_17
		moveq.l    #1,d0
		add.l      d7,d0
		jsr        Ax_malloc
		movea.l    a0,a4
		move.l     a4,d0
		beq.s      edit_substitute_18
		movea.l    a6,a1
		jsr        strcpy
		move.w     4(a7),d0
		ble.s      edit_substitute_19
		move.l     12(a3),d1
		movea.l    (a7),a1
		adda.l     d1,a1
		movea.l    a4,a0
		jsr        strcat
		bra.s      edit_substitute_19
edit_substitute_18:
		moveq.l    #1,d6
		bra        edit_substitute_20
edit_substitute_17:
		suba.l     a4,a4
edit_substitute_19:
		move.w     d3,d1
		move.w     154(a2),d0
		movea.l    a4,a0
		bsr        vpos
		ext.l      d0
		move.l     d0,64(a2)
		move.l     16(a3),d1
		lsl.l      #3,d1
		move.l     d4,d2
		lsl.l      #3,d2
		movea.l    44(a2),a5
		adda.l     d2,a5
		lea.l      -8(a5,d1.l),a5
		move.l     a4,(a5)
		move.w     d7,4(a5)
		clr.w      6(a5)
		moveq.l    #1,d6
		bra.s      edit_substitute_21
edit_substitute_22:
		move.l     d6,d0
		lsl.l      #3,d0
		move.l     d4,d1
		lsl.l      #3,d1
		movea.l    44(a2),a5
		adda.l     d1,a5
		adda.l     d0,a5
		move.l     d6,d2
		lsl.l      #2,d2
		movea.l    12(a7),a0
		movea.l    0(a0,d2.l),a6
		movea.l    a6,a0
		jsr        strlen
		move.l     d0,d7
		movea.l    a6,a0
		jsr        Ast_create
		movea.l    a0,a4
		move.l     a4,d0
		beq.s      edit_substitute_20
		move.l     d0,(a5)
		move.w     d7,4(a5)
		clr.w      6(a5)
		addq.l     #1,d6
edit_substitute_21:
		moveq.l    #-1,d0
		add.l      16(a3),d0
		cmp.l      d0,d6
		blt.s      edit_substitute_22
		move.l     d3,52(a2)
		move.l     d4,d0
		add.l      16(a3),d0
		subq.l     #1,d0
		move.l     d0,48(a2)
edit_substitute_14:
		move.l     48(a2),138(a2)
		move.l     52(a2),142(a2)
		move.l     8(a7),150(a2)
		move.l     d5,146(a2)
		bra.s      edit_substitute_4
edit_substitute_20:
		moveq.l    #0,d7
		bra.s      edit_substitute_23
edit_substitute_26:
		move.l     d7,d0
		lsl.l      #3,d0
		move.l     d4,d1
		lsl.l      #3,d1
		movea.l    44(a2),a5
		adda.l     d1,a5
		adda.l     d0,a5
		movea.l    (a5),a0
		jsr        Ax_ifree
		cmp.l      d7,d5
		ble.s      edit_substitute_24
		move.l     d7,d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		move.l     0(a0,d0.l),(a5)
		move.l     (a5),d1
		beq.s      edit_substitute_25
		movea.l    d1,a0
		jsr        strlen
		addq.w     #1,d0
		move.w     d0,4(a5)
		bra.s      edit_substitute_24
edit_substitute_25:
		clr.w      4(a5)
edit_substitute_24:
		addq.l     #1,d7
edit_substitute_23:
		cmp.l      d7,d6
		bgt.s      edit_substitute_26
edit_substitute_11:
		move.l     18(a7),d1
		neg.l      d1
		move.l     22(a7),d0
		movea.l    a2,a0
		bsr        edit_movelines
		movea.l    8(a7),a0
		jsr        Ax_ifree
		ori.w      #0x0008,18(a2)
edit_substitute_4:
		lea.l      26(a7),a7
		movem.l    (a7)+,d3-d7/a2-a6
		rts

edit_undo:
		movem.l    d3/a2-a5,-(a7)
		movea.l    a0,a2
		move.l     150(a2),d0
		beq        edit_undo_1
		move.l     138(a2),d1
		move.l     122(a2),d0
		bsr        edit_makeundo
		movea.l    a0,a3
		move.l     a3,d0
		beq        edit_undo_1
		move.l     130(a2),d3
		sub.l      138(a2),d3
		move.l     d3,d1
		move.l     122(a2),d0
		movea.l    a2,a0
		bsr        edit_movelines
		tst.w      d0
		bne        edit_undo_1
		move.w     18(a2),d0
		and.w      #0x0200,d0
		beq.s      edit_undo_2
		clr.w      d2
		move.l     56(a2),d1
		move.l     48(a2),d0
		movea.l    a2,a0
		jsr        edit_selrange
edit_undo_2:
		move.l     122(a2),d0
		lsl.l      #3,d0
		movea.l    44(a2),a4
		adda.l     d0,a4
		move.l     146(a2),d3
		movea.l    150(a2),a5
		bra.s      edit_undo_3
edit_undo_6:
		move.l     (a5),(a4)
		move.l     (a5),d0
		beq.s      edit_undo_4
		movea.l    d0,a0
		jsr        strlen
		move.w     d0,4(a4)
		bra.s      edit_undo_5
edit_undo_4:
		clr.w      4(a4)
edit_undo_5:
		move.w     #0x0001,6(a4)
		addq.w     #4,a5
		addq.w     #8,a4
edit_undo_3:
		move.l     d3,d0
		subq.l     #1,d3
		tst.l      d0
		bne.s      edit_undo_6
		movea.l    150(a2),a0
		jsr        Ax_ifree
		move.l     a3,150(a2)
		move.l     138(a2),d0
		sub.l      122(a2),d0
		addq.l     #1,d0
		move.l     d0,146(a2)
		move.l     130(a2),56(a2)
		move.l     138(a2),130(a2)
		move.l     56(a2),138(a2)
		move.l     134(a2),60(a2)
		move.l     142(a2),134(a2)
		move.l     60(a2),142(a2)
		move.l     122(a2),48(a2)
		move.l     126(a2),52(a2)
		move.w     54(a2),d1
		move.w     154(a2),d0
		move.l     48(a2),d2
		lsl.l      #3,d2
		movea.l    44(a2),a0
		movea.l    0(a0,d2.l),a0
		bsr        vpos
		ext.l      d0
		move.l     d0,64(a2)
		move.w     62(a2),d1
		move.w     154(a2),d0
		move.l     56(a2),d2
		lsl.l      #3,d2
		movea.l    44(a2),a0
		movea.l    0(a0,d2.l),a0
		bsr        vpos
		ext.l      d0
		move.l     d0,68(a2)
		cmpi.w     #0x0005,112(a2)
		beq.s      edit_undo_7
		move.l     48(a2),d1
		cmp.l      56(a2),d1
		bne.s      edit_undo_8
edit_undo_7:
		move.l     52(a2),d0
		cmp.l      60(a2),d0
		bne.s      edit_undo_8
		ori.w      #0x0008,18(a2)
		andi.w     #0xFDFF,18(a2)
		bra.s      edit_undo_9
edit_undo_8:
		ori.w      #0x0208,18(a2)
edit_undo_9:
		movea.l    a2,a0
		bsr        edit_view
edit_undo_1:
		movem.l    (a7)+,d3/a2-a5
		rts

edit_updateline:
		moveq.l    #4,d1
		and.w      18(a0),d1
		beq.s      edit_updateline_1
		cmp.l      102(a0),d0
		beq.s      edit_updateline_2
		cmp.l      106(a0),d0
		beq.s      edit_updateline_2
		moveq.l    #1,d2
		add.l      106(a0),d2
		cmp.l      d2,d0
		bne.s      edit_updateline_3
		move.l     24(a0),d1
		add.l      10(a0),d1
		cmp.l      d1,d0
		bne.s      edit_updateline_3
		addq.l     #1,106(a0)
		rts
edit_updateline_3:
edit_updateline_1:
edit_updateline_2:

		ori.w      #0x0008,18(a0)
		rts

		ori.w      #0x0004,18(a0)
		move.l     d0,102(a0)
		move.l     d0,106(a0)
		rts

edit_showline:
		move.l     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    a0,a2
		move.l     d0,d3
		tst.l      d0
		bpl.s      edit_showline_1
		moveq.l    #0,d3
edit_showline_1:
		cmp.l      40(a2),d3
		ble.s      edit_showline_2
		move.l     40(a2),d3
edit_showline_2:
		cmp.l      24(a2),d3
		bge.s      edit_showline_3
		move.l     d3,24(a2)
		bra.s      edit_showline_4
edit_showline_3:
		move.l     24(a2),d0
		add.l      10(a2),d0
		cmp.l      d0,d3
		blt.s      edit_showline_5
		move.l     d3,d1
		sub.l      10(a2),d1
		addq.l     #1,d1
		move.l     d1,24(a2)
		bra.s      edit_showline_4
edit_showline_5:
		move.l     d3,d0
		movea.l    a2,a0
		bsr        edit_updateline
edit_showline_4:
		movea.l    (a7)+,a2
		move.l     (a7)+,d3
		rts

edit_exmem:
		movem.l    d3-d4/a2-a3,-(a7)
		movea.l    a0,a3
		move.l     d0,d3
		move.l     d0,d4
		lsl.l      #3,d4
		move.l     d4,d0
		jsr        Ax_malloc
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      edit_exmem_1
		ori.w      #0x0001,158(a3)
		moveq.l    #-1,d0
		bra.s      edit_exmem_2
edit_exmem_1:
		move.l     d4,d1
		clr.w      d0
		movea.l    a2,a0
		jsr        memset
		move.l     36(a3),d0
		lsl.l      #3,d0
		movea.l    44(a3),a1
		movea.l    a2,a0
		jsr        memcpy
		movea.l    44(a3),a0
		jsr        Ax_ifree
		move.l     a2,44(a3)
		move.l     d3,36(a3)
		clr.w      d0
edit_exmem_2:
		movem.l    (a7)+,d3-d4/a2-a3
		rts

edit_expand:
		movem.l    d3-d4/a2,-(a7)
		movea.l    a0,a2
		move.l     d0,d4
		moveq.l    #-1,d0
		jsr        Malloc
		move.l     a0,d3
		move.l     36(a2),d0
		add.l      d4,d0
		add.l      #0x000001FF,d0
		move.l     d0,d4
		move.l     #0x00000200,d1
		jsr        _lmod
		sub.l      d0,d4
		move.l     d4,d0
		lsl.l      #3,d0
		cmp.l      d3,d0
		bgt.s      edit_expand_1
		move.l     d0,d1
		asr.l      #1,d1
		add.l      d0,d1
		cmp.l      d1,d3
		ble.s      edit_expand_2
		move.l     d4,d2
		asr.l      #1,d2
		add.l      d2,d4
		bra.s      edit_expand_1
edit_expand_2:
		move.l     d3,d4
		lsr.l      #3,d4
		move.l     d4,d0
		move.l     #0x00000200,d1
		jsr        _lmod
		sub.l      d0,d4
edit_expand_1:
		move.l     d4,d0
		movea.l    a2,a0
		bsr        edit_exmem
		movem.l    (a7)+,d3-d4/a2
		rts

edit_newline:
		move.l     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    12(a0),a0
		movea.l    12(a0),a2
		move.l     36(a2),d0
		moveq.l    #1,d1
		add.l      40(a2),d1
		cmp.l      d1,d0
		bgt        edit_newline_1
		move.l     20(a2),d0
		sub.l      36(a2),d0
		tst.l      d0
		ble.s      edit_newline_2
		move.l     20(a2),d2
		moveq.l    #25,d1
		add.l      36(a2),d1
		cmp.l      d1,d2
		bge.s      edit_newline_3
		move.l     d2,d0
		bra.s      edit_newline_4
edit_newline_3:
		moveq.l    #25,d0
		add.l      36(a2),d0
edit_newline_4:
		movea.l    a2,a0
		bsr        edit_exmem
		tst.w      d0
		beq.s      edit_newline_1
		moveq.l    #-1,d0
		bra.s      edit_newline_5
edit_newline_2:
		movea.l    44(a2),a0
		move.w     4(a0),d0
		beq.s      edit_newline_6
		movea.l    (a0),a0
		jsr        Ax_ifree
edit_newline_6:
		move.l     40(a2),d3
		lsl.l      #3,d3
		move.l     d3,d0
		movea.l    44(a2),a1
		addq.w     #8,a1
		movea.l    44(a2),a0
		jsr        memcpy
		move.l     40(a2),d0
		lsl.l      #3,d0
		movea.l    44(a2),a0
		adda.l     d0,a0
		clr.l      (a0)
		clr.w      4(a0)
		clr.w      6(a0)
		subq.l     #1,102(a2)
		subq.l     #1,106(a2)
		addq.w     #1,110(a2)
		ori.w      #0x0010,18(a2)
		bra.s      edit_newline_7
edit_newline_1:
		addq.l     #1,40(a2)
edit_newline_7:
		move.l     40(a2),d0
		movea.l    a2,a0
		bsr        edit_showline
		clr.w      d0
edit_newline_5:
		movea.l    (a7)+,a2
		move.l     (a7)+,d3
		rts

change_cur:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		movea.l    84(a2),a3
		move.l     a3,d0
		beq.s      change_cur_1
		ori.w      #0x0040,18(a2)
		moveq.l    #-1,d1
		move.w     92(a2),d0
		movea.l    102(a3),a1
		movea.l    a3,a0
		jsr        (a1)
		andi.w     #0xFFBF,18(a2)
change_cur_1:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

edit_update:
		movem.l    d3-d5/a2-a3,-(a7)
		movea.l    a0,a2
		movea.l    84(a2),a3
		move.l     a3,d0
		beq        edit_update_1
		move.w     92(a2),d3
		movea.l    a3,a0
		move.w     d3,d0
		jsr        Awi_obvisible
		tst.w      d0
		beq        edit_update_1
		move.w     30(a2),d4
		sub.w      82(a2),d4
		muls.w     8(a2),d4
		move.w     26(a2),d5
		sub.w      78(a2),d5
		muls.w     6(a2),d5
		moveq.l    #8,d0
		and.w      18(a2),d0
		bne.s      edit_update_2
		move.w     32(a3),d1
		bmi.s      edit_update_2
		moveq.l    #4,d2
		and.w      18(a2),d2
		beq.s      edit_update_3
		moveq.l    #16,d0
		and.w      18(a2),d0
		beq.s      edit_update_4
		move.w     110(a2),d1
		muls.w     6(a2),d1
		add.w      d1,d5
		clr.w      110(a2)
		bra.s      edit_update_5
edit_update_4:
		tst.w      d4
		bne.s      edit_update_5
		tst.w      d5
		bne.s      edit_update_5
		move.l     102(a2),d0
		cmp.l      106(a2),d0
		bne.s      edit_update_2
		ori.w      #0x0002,18(a2)
edit_update_2:
		moveq.l    #-1,d1
		move.w     d3,d0
		movea.l    a3,a0
		movea.l    102(a3),a1
		jsr        (a1)
		bra.s      edit_update_6
edit_update_3:
		tst.w      d4
		bne.s      edit_update_5
		tst.w      d5
		beq.s      edit_update_6
edit_update_5:
		move.w     d5,d1
		move.w     d4,d0
		movea.l    a2,a0
		jsr        uedit_scroll
edit_update_6:
		andi.w     #0xFFE1,18(a2)
		move.l     24(a2),76(a2)
		move.l     28(a2),80(a2)
edit_update_1:
		movem.l    (a7)+,d3-d5/a2-a3
		rts

uedit_scroll:
		movem.l    d3-d7/a2-a5,-(a7)
		lea.l      -44(a7),a7
		movea.l    a0,a2
		move.w     d0,d3
		move.w     d1,d4
		tst.w      d0
		bne.s      uedit_scroll_1
		tst.w      d1
		beq        uedit_scroll_2
uedit_scroll_1:
		move.l     84(a2),24(a7)
		movea.l    24(a7),a0
		move.w     32(a0),d5
		tst.w      d5
		bmi        uedit_scroll_2
		moveq.l    #8,d0
		and.w      86(a0),d0
		beq.s      uedit_scroll_3
		movea.l    ACSblk,a1
		addq.w     #8,a1
		lea.l      8(a7),a0
		moveq.l    #8,d0
		jsr        memcpy
		clr.w      d0
		move.w     d0,6(a7)
		move.w     d0,4(a7)
		bra.s      uedit_scroll_4
uedit_scroll_3:
		pea.l      14(a7)
		pea.l      16(a7)
		pea.l      18(a7)
		pea.l      20(a7)
		moveq.l    #11,d1
		move.w     d5,d0
		jsr        wind_get
		lea.l      16(a7),a7
		move.w     12(a7),d0
		beq        uedit_scroll_2
		move.w     14(a7),d1
		beq        uedit_scroll_2
		pea.l      6(a7)
		pea.l      8(a7)
		pea.l      10(a7)
		pea.l      12(a7)
		move.w     d5,d0
		moveq.l    #12,d1
		jsr        wind_get
		lea.l      16(a7),a7
uedit_scroll_4:
		move.w     92(a2),d5
		movea.l    88(a2),a4
		move.w     d5,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		suba.l     d0,a4
		lea.l      16(a7),a5
		move.l     _globl,-(a7)
		pea.l      2(a5)
		movea.l    a5,a1
		move.w     d5,d0
		movea.l    a4,a0
		jsr        mt_objc_offset
		addq.w     #8,a7
		movea.l    24(a7),a0
		move.w     52(a0),d0
		add.w      d0,(a5)
		move.w     54(a0),d1
		add.w      d1,2(a5)
		move.w     2(a5),d7
		move.w     74(a2),4(a5)
		move.w     72(a2),6(a5)
		lea.l      8(a7),a1
		movea.l    a5,a0
		jsr        intersect
		movea.l    ACSblk,a1
		addq.w     #8,a1
		movea.l    a5,a0
		jsr        intersect
		clr.w      d6
		tst.w      d4
		ble.s      uedit_scroll_5
		moveq.l    #4,d0
		and.w      18(a2),d0
		beq.s      uedit_scroll_5
		move.w     104(a2),d0
		sub.w      26(a2),d0
		muls.w     6(a2),d0
		add.w      d7,d0
		move.w     2(a5),d1
		add.w      6(a5),d1
		cmp.w      d1,d0
		bge.s      uedit_scroll_5
		move.w     6(a2),d6
uedit_scroll_5:
		move.w     4(a7),d0
		bne.s      uedit_scroll_6
		move.w     6(a7),d1
		bne.s      uedit_scroll_6
		cmp.w      4(a5),d3
		bge.s      uedit_scroll_6
		move.w     d3,d2
		neg.w      d2
		cmp.w      4(a5),d2
		bge.s      uedit_scroll_6
		move.w     d4,d7
		add.w      d6,d7
		cmp.w      6(a5),d7
		bge.s      uedit_scroll_6
		move.w     d4,d0
		neg.w      d0
		cmp.w      6(a5),d0
		bge.s      uedit_scroll_6
		tst.w      d4
		beq.s      uedit_scroll_7
		tst.w      d3
		beq.s      uedit_scroll_7
uedit_scroll_6:
		moveq.l    #-1,d1
		move.w     d5,d0
		movea.l    24(a7),a0
		movea.l    24(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
		bra        uedit_scroll_2
uedit_scroll_7:
		lea.l      28(a7),a3
		move.w     (a5),d0
		move.w     d0,8(a3)
		move.w     d0,(a3)
		move.w     2(a5),d1
		move.w     d1,10(a3)
		move.w     d1,2(a3)
		move.w     (a5),d0
		add.w      4(a5),d0
		subq.w     #1,d0
		move.w     d0,12(a3)
		move.w     d0,4(a3)
		move.w     2(a5),d1
		add.w      6(a5),d1
		subq.w     #1,d1
		move.w     d1,14(a3)
		move.w     d1,6(a3)
		tst.w      d3
		beq.s      uedit_scroll_8
		tst.w      d3
		ble.s      uedit_scroll_9
		add.w      d3,(a3)
		sub.w      d3,12(a3)
		moveq.l    #1,d0
		add.w      12(a3),d0
		move.w     d0,(a5)
		move.w     d3,4(a5)
		bra.s      uedit_scroll_8
uedit_scroll_9:
		add.w      d3,4(a3)
		sub.w      d3,8(a3)
		move.w     d3,d0
		neg.w      d0
		move.w     d0,4(a5)
uedit_scroll_8:
		tst.w      d4
		beq.s      uedit_scroll_10
		tst.w      d4
		ble.s      uedit_scroll_11
		add.w      d4,2(a3)
		move.w     d4,d0
		add.w      d6,d0
		sub.w      d0,14(a3)
		sub.w      d6,6(a3)
		moveq.l    #1,d1
		add.w      14(a3),d1
		move.w     d1,2(a5)
		move.w     d0,6(a5)
		bra.s      uedit_scroll_10
uedit_scroll_11:
		add.w      d4,6(a3)
		sub.w      d4,10(a3)
		move.w     d4,d0
		neg.w      d0
		move.w     d0,6(a5)
uedit_scroll_10:
		movea.l    a3,a0
		clr.w      d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		move.w     16(a4),d6
		move.w     18(a4),d7
		movea.l    24(a7),a0
		move.w     52(a0),d0
		add.w      d0,16(a4)
		move.w     54(a0),d0
		add.w      d0,18(a4)
		movea.l    _globl,a1
		move.w     #0x0100,d0
		suba.l     a0,a0
		jsr        mt_graf_mouse
		move.w     2(a3),d0
		cmp.w      6(a3),d0
		bgt.s      uedit_scroll_12
		movea.l    ACSblk,a0
		pea.l      618(a0)
		movea.l    a0,a1
		lea.l      618(a1),a1
		movea.l    a3,a0
		moveq.l    #3,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vro_cpyfm
		addq.w     #4,a7
uedit_scroll_12:
		move.w     6(a5),-(a7)
		move.w     4(a5),-(a7)
		move.w     2(a5),-(a7)
		movea.l    _globl,a1
		move.w     (a5),d2
		clr.w      d1
		move.w     d5,d0
		movea.l    a4,a0
		jsr        mt_objc_draw
		addq.w     #6,a7
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #0x0101,d0
		jsr        mt_graf_mouse
		move.w     d6,16(a4)
		move.w     d7,18(a4)
uedit_scroll_2:
		lea.l      44(a7),a7
		movem.l    (a7)+,d3-d7/a2-a5
		rts

edit_invers:
		movem.l    d3-d5/a2-a3,-(a7)
		movea.l    a0,a2
		move.l     d0,d3
		cmp.l      24(a2),d0
		blt.s      edit_invers_1
		move.l     24(a2),d1
		add.l      10(a2),d1
		cmp.l      d1,d0
		bge.s      edit_invers_1
		move.w     18(a2),d4
		move.l     102(a2),d5
		move.w     #0x0304,18(a2)
		move.l     d0,102(a2)
		lsl.l      #3,d0
		movea.l    44(a2),a1
		ori.w      #0x0002,6(a1,d0.l)
		movea.l    84(a2),a3
		move.l     a3,d1
		beq.s      edit_invers_2
		move.w     92(a2),d0
		movea.l    102(a3),a1
		movea.l    a3,a0
		moveq.l    #-1,d1
		jsr        (a1)
edit_invers_2:
		move.l     d3,d0
		lsl.l      #3,d0
		movea.l    44(a2),a0
		andi.w     #0xFFFD,6(a0,d0.l)
		move.l     d5,102(a2)
		move.w     d4,18(a2)
edit_invers_1:
		movem.l    (a7)+,d3-d5/a2-a3
		rts

edit_col:
		movem.l    d3/a2-a4,-(a7)
		subq.w     #4,a7
		movea.l    a0,a2
		move.w     d0,d3
		movea.l    84(a2),a3
		movea.l    88(a2),a4
		move.w     92(a2),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		suba.l     d1,a4
		move.l     _globl,-(a7)
		pea.l      6(a7)
		lea.l      8(a7),a1
		move.w     92(a2),d0
		movea.l    a4,a0
		jsr        mt_objc_offset
		addq.w     #8,a7
		move.w     52(a3),d0
		add.w      (a7),d0
		move.w     8(a2),d1
		asr.w      #1,d1
		sub.w      d1,d0
		sub.w      d0,d3
		move.w     d3,d0
		ext.l      d0
		divs.w     8(a2),d0
		ext.l      d0
		add.l      28(a2),d0
		tst.w      d3
		bpl.s      edit_col_1
		subq.l     #1,d0
edit_col_1:
		tst.l      d0
		bpl.s      edit_col_2
		moveq.l    #0,d0
edit_col_2:
		cmp.l      32(a2),d0
		ble.s      edit_col_3
		move.l     32(a2),d0
edit_col_3:
		addq.w     #4,a7
		movem.l    (a7)+,d3/a2-a4
		rts

edit_row:
		movem.l    d3/a2-a4,-(a7)
		subq.w     #4,a7
		movea.l    a0,a2
		move.w     d0,d3
		movea.l    84(a2),a3
		movea.l    88(a2),a4
		move.w     92(a2),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		suba.l     d1,a4
		move.l     _globl,-(a7)
		pea.l      4(a7)
		lea.l      10(a7),a1
		move.w     92(a2),d0
		movea.l    a4,a0
		jsr        mt_objc_offset
		addq.w     #8,a7
		move.w     54(a3),d0
		add.w      (a7),d0
		sub.w      d0,d3
		move.w     d3,d0
		ext.l      d0
		divs.w     6(a2),d0
		ext.l      d0
		add.l      24(a2),d0
		tst.w      d3
		bpl.s      edit_row_1
		subq.l     #1,d0
edit_row_1:
		tst.l      d0
		bpl.s      edit_row_2
		moveq.l    #0,d0
edit_row_2:
		cmp.l      40(a2),d0
		ble.s      edit_row_3
		move.l     40(a2),d0
edit_row_3:
		addq.w     #4,a7
		movem.l    (a7)+,d3/a2-a4
		rts

edit_1select:
		movem.l    d3/a2-a5,-(a7)
		subq.w     #6,a7
		movea.l    a0,a3
		move.w     d0,4(a7)
edit_1select_6:
		lea.l      2(a7),a2
		move.w     4(a7),d0
		movea.l    a3,a0
		bsr        edit_row
		move.l     d0,d3
		lsl.l      #3,d0
		movea.l    44(a3),a4
		adda.l     d0,a4
		moveq.l    #1,d1
		and.w      6(a4),d1
		bne        edit_1select_1
		move.l     48(a3),d2
		lsl.l      #3,d2
		movea.l    44(a3),a5
		adda.l     d2,a5
		moveq.l    #1,d0
		and.w      6(a5),d0
		beq.s      edit_1select_2
		move.l     48(a3),d0
		movea.l    a3,a0
		bsr        edit_invers
		andi.w     #0xFFFE,6(a5)
edit_1select_2:
		move.l     d3,d0
		movea.l    a3,a0
		bsr        edit_invers
		ori.w      #0x0001,6(a4)
		move.l     d3,48(a3)
		move.l     d3,56(a3)
		ori.w      #0x0200,18(a3)
		move.l     114(a3),d0
		beq.s      edit_1select_3
		movea.l    (a4),a5
		move.l     a5,d1
		bne.s      edit_1select_4
		lea.l      xcf36c,a5
edit_1select_4:
		movea.l    a5,a1
		movea.l    118(a3),a0
		movea.l    114(a3),a4
		jsr        (a4)
edit_1select_3:
		cmp.l      24(a3),d3
		blt.s      edit_1select_5
		move.l     24(a3),d0
		add.l      10(a3),d0
		cmp.l      d0,d3
		blt.s      edit_1select_1
edit_1select_5:
		move.l     d3,d0
		movea.l    a3,a0
		bsr        edit_showline
		movea.l    a3,a0
		bsr        edit_update
		moveq.l    #1,d0
		movea.l    a3,a0
		jsr        cleanup
edit_1select_1:
		move.l     _globl,-(a7)
		pea.l      (a2)
		pea.l      8(a7)
		lea.l      16(a7),a1
		movea.l    a2,a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		moveq.l    #1,d0
		and.w      (a7),d0
		bne        edit_1select_6
		addq.w     #6,a7
		movem.l    (a7)+,d3/a2-a5
		rts

edit_01select:
		movem.l    d3/a2-a4,-(a7)
		subq.w     #6,a7
		movea.l    a0,a3
		move.w     d0,4(a7)
		lea.l      4(a7),a2
		move.w     (a2),d0
		movea.l    a3,a0
		bsr        edit_row
		move.l     d0,d3
		lsl.l      #3,d0
		movea.l    44(a3),a4
		adda.l     d0,a4
		moveq.l    #1,d1
		and.w      6(a4),d1
		beq.s      edit_01select_1
		movea.l    a3,a0
		move.l     d3,d0
		bsr        edit_invers
		andi.w     #0xFFFE,6(a4)
		andi.w     #0xFDFF,18(a3)
		move.l     114(a3),d0
		beq.s      edit_01select_2
		lea.l      xcf36c,a1
		movea.l    118(a3),a0
		movea.l    d0,a4
		jsr        (a4)
edit_01select_2:
		lea.l      2(a7),a4
		move.l     _globl,-(a7)
		pea.l      (a4)
		pea.l      8(a7)
		movea.l    a2,a1
		movea.l    a4,a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		moveq.l    #1,d0
		and.w      (a7),d0
		beq.s      edit_01select_3
		movea.l    a3,a0
		move.w     (a2),d0
		bsr        edit_row
		cmp.l      d0,d3
		beq.s      edit_01select_2
edit_01select_1:
		move.w     (a2),d0
		movea.l    a3,a0
		bsr        edit_1select
edit_01select_3:
		addq.w     #6,a7
		movem.l    (a7)+,d3/a2-a4
		rts

edit_selrange:
		movem.l    d3-d5/a2-a3,-(a7)
		subq.w     #4,a7
		movea.l    a0,a2
		move.l     24(a2),d3
		move.l     d3,d4
		add.l      10(a2),d4
		subq.l     #1,d4
		cmp.l      40(a2),d4
		ble.s      edit_selrange_1
		move.l     40(a2),d4
edit_selrange_1:
		clr.w      (a7)
		move.l     d0,d5
		bra.s      edit_selrange_2
edit_selrange_7:
		move.l     d5,d0
		lsl.l      #3,d0
		movea.l    44(a2),a0
		adda.l     d0,a0
		move.w     d2,d0
		tst.w      d0
		beq.s      edit_selrange_3
		subq.w     #1,d0
		beq.s      edit_selrange_4
		subq.w     #1,d0
		beq.s      edit_selrange_5
		bra.s      edit_selrange_6
edit_selrange_3:
		moveq.l    #1,d0
		and.w      6(a0),d0
		beq.s      edit_selrange_6
		andi.w     #0xFFFE,6(a0)
		bra.s      edit_selrange_5
edit_selrange_4:
		moveq.l    #1,d0
		and.w      6(a0),d0
		bne.s      edit_selrange_6
		ori.w      #0x0001,6(a0)
edit_selrange_5:
		cmp.l      d5,d3
		bgt.s      edit_selrange_6
		cmp.l      d5,d4
		blt.s      edit_selrange_6
		move.w     #0x0001,(a7)
		ori.w      #0x0002,6(a0)
edit_selrange_6:
		addq.l     #1,d5
edit_selrange_2:
		cmp.l      d5,d1
		bge.s      edit_selrange_7
		move.w     (a7),d0
		beq.s      edit_selrange_8
		movea.l    84(a2),a3
		move.l     a3,d1
		beq.s      edit_selrange_9
		move.w     18(a2),2(a7)
		move.w     #0x0300,18(a2)
		move.w     92(a2),d0
		movea.l    a3,a0
		movea.l    102(a3),a1
		moveq.l    #-1,d1
		jsr        (a1)
		move.w     2(a7),18(a2)
edit_selrange_9:
		move.l     d3,d5
		bra.s      edit_selrange_10
edit_selrange_11:
		move.l     d5,d0
		lsl.l      #3,d0
		movea.l    44(a2),a0
		andi.w     #0xFFFD,6(a0,d0.l)
		addq.l     #1,d5
edit_selrange_10:
		cmp.l      d5,d4
		bge.s      edit_selrange_11
edit_selrange_8:
		addq.w     #4,a7
		movem.l    (a7)+,d3-d5/a2-a3
		rts

edit_nselect:
		movem.l    d3-d7/a2-a5,-(a7)
		subq.w     #6,a7
		movea.l    a0,a2
		move.w     d0,4(a7)
		move.w     d2,d3
		lea.l      4(a7),a3
		tst.w      d3
		bne.s      edit_nselect_1
		moveq.l    #1,d4
		bra.s      edit_nselect_2
edit_nselect_1:
		clr.w      d4
edit_nselect_2:
		moveq.l    #3,d0
		and.w      d1,d0
		beq.s      edit_nselect_3
		move.l     48(a2),d1
		add.l      56(a2),d1
		asr.l      #1,d1
		move.l     d1,-(a7)
		movea.l    a2,a0
		move.w     (a3),d0
		bsr        edit_row
		cmp.l      (a7)+,d0
		ble.s      edit_nselect_4
		move.l     48(a2),d5
		bra.s      edit_nselect_5
edit_nselect_4:
		move.l     56(a2),d5
		bra.s      edit_nselect_5
edit_nselect_3:
		move.w     d4,d2
		move.l     56(a2),d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
		move.w     (a3),d0
		movea.l    a2,a0
		bsr        edit_row
		move.l     d0,d5
		move.l     d0,56(a2)
		move.l     d0,48(a2)
edit_nselect_5:
		moveq.l    #-2,d6
edit_nselect_17:
		lea.l      2(a7),a4
		move.w     (a3),d0
		movea.l    a2,a0
		bsr        edit_row
		move.l     d0,d7
		cmp.l      d0,d6
		beq        edit_nselect_6
		cmp.l      d0,d5
		bgt.s      edit_nselect_7
		cmp.l      56(a2),d0
		bge.s      edit_nselect_8
		move.w     d4,d2
		move.l     56(a2),d1
		moveq.l    #1,d0
		add.l      d7,d0
		movea.l    a2,a0
		bsr        edit_selrange
		bra.s      edit_nselect_9
edit_nselect_8:
		cmp.l      56(a2),d5
		bge.s      edit_nselect_10
		move.w     d3,d2
		move.l     d7,d1
		move.l     56(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
		bra.s      edit_nselect_9
edit_nselect_10:
		move.w     d4,d2
		moveq.l    #-1,d1
		add.l      d5,d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
		move.w     d3,d2
		move.l     d7,d1
		move.l     d5,d0
		movea.l    a2,a0
		bsr        edit_selrange
edit_nselect_9:
		move.l     d5,48(a2)
		move.l     d7,56(a2)
		bra.s      edit_nselect_11
edit_nselect_7:
		cmp.l      48(a2),d7
		ble.s      edit_nselect_12
		move.w     d4,d2
		moveq.l    #-1,d1
		add.l      d7,d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
		bra.s      edit_nselect_13
edit_nselect_12:
		cmp.l      48(a2),d5
		ble.s      edit_nselect_14
		move.w     d3,d2
		move.l     48(a2),d1
		move.l     d7,d0
		movea.l    a2,a0
		bsr        edit_selrange
		bra.s      edit_nselect_13
edit_nselect_14:
		move.w     d4,d2
		move.l     56(a2),d1
		moveq.l    #1,d0
		add.l      d5,d0
		movea.l    a2,a0
		bsr        edit_selrange
		move.w     d3,d2
		moveq.l    #-1,d1
		add.l      d5,d1
		move.l     d7,d0
		movea.l    a2,a0
		bsr        edit_selrange
edit_nselect_13:
		move.l     d7,48(a2)
		move.l     d5,56(a2)
edit_nselect_11:
		cmp.l      24(a2),d7
		blt.s      edit_nselect_15
		move.l     24(a2),d0
		add.l      10(a2),d0
		cmp.l      d0,d7
		blt.s      edit_nselect_16
edit_nselect_15:
		move.l     d7,d0
		movea.l    a2,a0
		bsr        edit_showline
		movea.l    a2,a0
		bsr        edit_update
		moveq.l    #1,d0
		movea.l    a2,a0
		jsr        cleanup
edit_nselect_16:
		move.l     114(a2),d0
		beq.s      edit_nselect_6
		lea.l      xcf36c,a1
		movea.l    118(a2),a0
		movea.l    d0,a5
		jsr        (a5)
edit_nselect_6:
		move.l     d7,d6
		move.l     _globl,-(a7)
		pea.l      (a4)
		pea.l      8(a7)
		movea.l    a3,a1
		movea.l    a4,a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		moveq.l    #1,d0
		and.w      (a7),d0
		bne        edit_nselect_17
		addq.w     #6,a7
		movem.l    (a7)+,d3-d7/a2-a5
		rts

edit_nmselect:
		move.w     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		bsr        edit_row
		move.l     d0,56(a2)
		move.l     d0,48(a2)
		moveq.l    #1,d1
		lsl.l      #3,d0
		movea.l    44(a2),a0
		and.w      6(a0,d0.l),d1
		bne.s      edit_nmselect_1
		moveq.l    #1,d2
		bra.s      edit_nmselect_2
edit_nmselect_1:
		clr.w      d2
edit_nmselect_2:
		clr.w      d1
		move.w     d3,d0
		movea.l    a2,a0
		bsr        edit_nselect
		movea.l    (a7)+,a2
		move.w     (a7)+,d3
		rts

comp_rc:
		move.l     d3,-(a7)
		move.l     8(a7),d3
		cmp.l      d0,d2
		blt.s      comp_rc_1
		cmp.l      d0,d2
		bgt.s      comp_rc_2
		cmp.l      d1,d3
		bge.s      comp_rc_3
comp_rc_1:
		moveq.l    #1,d0
		bra.s      comp_rc_4
comp_rc_3:
		cmp.l      d1,d3
		ble.s      comp_rc_5
comp_rc_2:
		moveq.l    #-1,d0
		bra.s      comp_rc_4
comp_rc_5:
		clr.w      d0
comp_rc_4:
		move.l     (a7)+,d3
		rts

edit_charselect:
		movem.l    d3-d7/a2-a5,-(a7)
		lea.l      -30(a7),a7
		movea.l    a0,a3
		move.w     d0,28(a7)
		move.w     d1,26(a7)
		move.w     d2,24(a7)
		lea.l      26(a7),a2
		lea.l      28(a7),a4
		move.w     (a2),d0
		movea.l    a3,a0
		bsr        edit_row
		move.l     d0,d3
		movea.l    a3,a0
		move.w     (a4),d0
		bsr        edit_col
		move.l     d0,8(a7)
		move.l     d3,d1
		lsl.l      #3,d1
		movea.l    44(a3),a0
		movea.l    0(a0,d1.l),a5
		move.w     154(a3),d0
		movea.l    a5,a0
		move.w     10(a7),d1
		bsr        posv
		ext.l      d0
		move.l     d0,8(a7)
		moveq.l    #3,d1
		and.w      24(a7),d1
		beq.s      edit_charselect_1
		move.l     52(a3),d2
		add.l      60(a3),d2
		asr.l      #1,d2
		move.l     d2,-(a7)
		move.l     48(a3),d2
		add.l      56(a3),d2
		asr.l      #1,d2
		move.l     d3,d0
		move.l     12(a7),d1
		bsr        comp_rc
		addq.w     #4,a7
		tst.w      d0
		ble.s      edit_charselect_2
		move.l     48(a3),d3
		move.l     52(a3),8(a7)
		move.l     64(a3),4(a7)
		bra.s      edit_charselect_3
edit_charselect_2:
		move.l     56(a3),d3
		move.l     60(a3),8(a7)
		move.l     68(a3),4(a7)
		bra.s      edit_charselect_3
edit_charselect_1:
		clr.w      d2
		move.l     56(a3),d1
		move.l     48(a3),d0
		movea.l    a3,a0
		bsr        edit_selrange
		move.l     d3,56(a3)
		move.l     d3,48(a3)
		move.w     10(a7),d1
		move.w     154(a3),d0
		movea.l    a5,a0
		bsr        vpos
		ext.l      d0
		move.l     d0,4(a7)
		move.l     d0,68(a3)
		move.l     d0,64(a3)
edit_charselect_3:
		moveq.l    #-3,d0
		move.l     d0,16(a7)
		move.l     d0,20(a7)
edit_charselect_19:
		move.w     (a2),d0
		movea.l    a3,a0
		bsr        edit_row
		move.l     d0,d7
		movea.l    a3,a0
		move.w     (a4),d0
		bsr        edit_col
		move.l     d0,d6
		move.l     d6,12(a7)
		move.l     d7,d0
		lsl.l      #3,d0
		movea.l    44(a3),a0
		movea.l    0(a0,d0.l),a5
		move.w     d6,d1
		move.w     154(a3),d0
		movea.l    a5,a0
		bsr        posv
		ext.l      d0
		move.l     d0,d6
		move.w     d6,d1
		move.w     154(a3),d0
		movea.l    a5,a0
		bsr        vpos
		move.w     d0,d5
		ext.l      d5
		cmp.l      20(a7),d7
		bne.s      edit_charselect_4
		cmp.l      16(a7),d6
		beq        edit_charselect_5
edit_charselect_4:
		move.l     8(a7),-(a7)
		move.l     d3,d2
		move.l     d6,d1
		move.l     d7,d0
		bsr        comp_rc
		addq.w     #4,a7
		tst.w      d0
		bmi        edit_charselect_6
		move.l     60(a3),-(a7)
		move.l     56(a3),d2
		move.l     d6,d1
		move.l     d7,d0
		bsr        comp_rc
		addq.w     #4,a7
		tst.w      d0
		bpl.s      edit_charselect_7
		move.l     d7,48(a3)
		move.l     d5,64(a3)
		clr.w      d2
		move.l     56(a3),d1
		move.l     d7,d0
		movea.l    a3,a0
		bsr        edit_selrange
		move.l     d7,d0
		lsl.l      #3,d0
		movea.l    44(a3),a0
		ori.w      #0x0001,6(a0,d0.l)
		bra        edit_charselect_8
edit_charselect_7:
		move.l     60(a3),-(a7)
		move.l     56(a3),d2
		move.l     12(a7),d1
		move.l     d3,d0
		bsr        comp_rc
		addq.w     #4,a7
		tst.w      d0
		bpl.s      edit_charselect_9
		move.l     56(a3),d4
		move.l     d4,48(a3)
		move.l     68(a3),64(a3)
		move.l     d7,56(a3)
		move.l     d5,68(a3)
		cmp.l      d4,d7
		bne.s      edit_charselect_10
		cmp.l      64(a3),d5
		ble.s      edit_charselect_11
edit_charselect_10:
		move.l     d4,d0
		lsl.l      #3,d0
		movea.l    44(a3),a0
		andi.w     #0xFFFE,6(a0,d0.l)
		moveq.l    #1,d2
		move.l     d7,d1
		movea.l    a3,a0
		move.l     d4,d0
		bsr        edit_selrange
		bra.s      edit_charselect_8
edit_charselect_11:
		move.l     d7,56(a3)
		bra.s      edit_charselect_8
edit_charselect_9:
		move.l     52(a3),-(a7)
		move.l     48(a3),d2
		move.l     d6,d1
		move.l     d7,d0
		bsr        comp_rc
		addq.w     #4,a7
		tst.w      d0
		ble.s      edit_charselect_8
		clr.w      d2
		move.l     d3,d1
		move.l     48(a3),d0
		movea.l    a3,a0
		bsr        edit_selrange
		move.l     d3,48(a3)
		move.l     4(a7),64(a3)
		move.l     d7,56(a3)
		move.l     d5,68(a3)
		moveq.l    #1,d2
		move.l     d7,d1
		move.l     d3,d0
		movea.l    a3,a0
		bsr        edit_selrange
edit_charselect_8:
		move.l     d3,48(a3)
		move.l     8(a7),52(a3)
		move.l     4(a7),64(a3)
		move.l     d7,56(a3)
		move.l     d6,60(a3)
		move.l     d5,68(a3)
		bra        edit_charselect_5
edit_charselect_6:
		move.l     52(a3),-(a7)
		move.l     48(a3),d2
		move.l     d6,d1
		move.l     d7,d0
		bsr        comp_rc
		addq.w     #4,a7
		tst.w      d0
		ble.s      edit_charselect_12
		move.l     d7,56(a3)
		move.l     d5,68(a3)
		clr.w      d2
		move.l     d7,d1
		move.l     48(a3),d0
		movea.l    a3,a0
		bsr        edit_selrange
		move.l     d7,d0
		lsl.l      #3,d0
		movea.l    44(a3),a0
		ori.w      #0x0001,6(a0,d0.l)
		bra        edit_charselect_13
edit_charselect_12:
		move.l     52(a3),-(a7)
		move.l     48(a3),d2
		move.l     12(a7),d1
		move.l     d3,d0
		bsr        comp_rc
		addq.w     #4,a7
		tst.w      d0
		ble.s      edit_charselect_14
		move.l     48(a3),d4
		move.l     d4,56(a3)
		move.l     64(a3),68(a3)
		move.l     d7,48(a3)
		move.l     d5,64(a3)
		cmp.l      d4,d7
		bne.s      edit_charselect_15
		move.l     68(a3),d0
		cmp.l      d5,d0
		ble.s      edit_charselect_16
edit_charselect_15:
		move.l     d4,d0
		lsl.l      #3,d0
		movea.l    44(a3),a0
		andi.w     #0xFFFE,6(a0,d0.l)
		moveq.l    #1,d2
		move.l     d4,d1
		movea.l    a3,a0
		move.l     d7,d0
		bsr        edit_selrange
		bra.s      edit_charselect_13
edit_charselect_16:
		move.l     d7,56(a3)
		bra.s      edit_charselect_13
edit_charselect_14:
		clr.w      d2
		move.l     56(a3),d1
		move.l     48(a3),d0
		movea.l    a3,a0
		bsr        edit_selrange
		move.l     d7,48(a3)
		move.l     d5,64(a3)
		move.l     d3,56(a3)
		move.l     4(a7),68(a3)
		moveq.l    #1,d2
		move.l     d3,d1
		move.l     d7,d0
		movea.l    a3,a0
		bsr        edit_selrange
edit_charselect_13:
		move.l     d7,48(a3)
		move.l     d6,52(a3)
		move.l     d5,64(a3)
		move.l     d3,56(a3)
		move.l     8(a7),60(a3)
		move.l     4(a7),68(a3)
edit_charselect_5:
		cmp.l      24(a3),d7
		blt.s      edit_charselect_17
		move.l     24(a3),d0
		add.l      10(a3),d0
		cmp.l      d0,d7
		bge.s      edit_charselect_17
		move.l     12(a7),d1
		cmp.l      28(a3),d1
		blt.s      edit_charselect_17
		move.l     28(a3),d2
		add.l      14(a3),d2
		cmp.l      d2,d1
		ble.s      edit_charselect_18
edit_charselect_17:
		move.l     d7,d0
		movea.l    a3,a0
		bsr        edit_showline
		move.l     12(a7),d0
		movea.l    a3,a0
		bsr        edit_showcol
		movea.l    a3,a0
		bsr        edit_update
		moveq.l    #1,d0
		movea.l    a3,a0
		jsr        cleanup
edit_charselect_18:
		move.l     d7,20(a7)
		move.l     d6,16(a7)
		move.l     _globl,-(a7)
		pea.l      6(a7)
		pea.l      8(a7)
		movea.l    a2,a1
		movea.l    a4,a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		moveq.l    #1,d0
		and.w      (a7),d0
		bne        edit_charselect_19
		lea.l      30(a7),a7
		movem.l    (a7)+,d3-d7/a2-a5
		rts

edit_blkselect:
		movem.l    d3-d7/a2-a5,-(a7)
		lea.l      -12(a7),a7
		movea.l    a0,a2
		move.w     d0,10(a7)
		move.w     d1,8(a7)
		lea.l      10(a7),a3
		lea.l      8(a7),a4
		moveq.l    #3,d0
		and.w      d2,d0
		beq.s      edit_blkselect_1
		move.l     64(a2),d1
		add.l      68(a2),d1
		asr.l      #1,d1
		move.l     d1,-(a7)
		movea.l    a2,a0
		move.w     (a3),d0
		bsr        edit_col
		cmp.l      (a7)+,d0
		ble.s      edit_blkselect_2
		move.l     64(a2),d3
		bra.s      edit_blkselect_3
edit_blkselect_2:
		move.l     68(a2),d3
edit_blkselect_3:
		move.l     48(a2),d0
		add.l      56(a2),d0
		asr.l      #1,d0
		move.l     d0,-(a7)
		movea.l    a2,a0
		move.w     (a4),d0
		bsr        edit_row
		cmp.l      (a7)+,d0
		ble.s      edit_blkselect_4
		move.l     48(a2),d4
		bra.s      edit_blkselect_5
edit_blkselect_4:
		move.l     56(a2),d4
		bra.s      edit_blkselect_5
edit_blkselect_1:
		clr.w      d2
		move.l     56(a2),d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
		move.w     (a4),d0
		movea.l    a2,a0
		bsr        edit_row
		move.l     d0,d4
		move.l     d0,56(a2)
		move.l     d0,48(a2)
		move.l     d4,d1
		lsl.l      #3,d1
		movea.l    44(a2),a0
		movea.l    0(a0,d1.l),a5
		movea.l    a2,a0
		move.w     (a3),d0
		bsr        edit_col
		move.l     d0,d5
		move.w     d5,d1
		move.w     154(a2),d0
		movea.l    a5,a0
		bsr        posv
		ext.l      d0
		move.l     d0,d5
		move.w     d5,d1
		move.w     154(a2),d0
		movea.l    a5,a0
		bsr        vpos
		ext.l      d0
		move.l     d0,d5
		move.l     d5,d3
		move.l     d3,68(a2)
		move.l     d3,64(a2)
		moveq.l    #1,d2
		move.l     56(a2),d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
edit_blkselect_5:
		moveq.l    #-2,d7
		move.l     d7,4(a7)
edit_blkselect_30:
		move.w     (a4),d0
		movea.l    a2,a0
		bsr        edit_row
		move.l     d0,d6
		movea.l    a2,a0
		move.w     (a3),d0
		bsr        edit_col
		move.l     d0,d5
		move.l     d6,d1
		lsl.l      #3,d1
		movea.l    44(a2),a0
		movea.l    0(a0,d1.l),a5
		move.w     154(a2),d0
		movea.l    a5,a0
		move.w     d5,d1
		bsr        posv
		ext.l      d0
		move.l     d0,d5
		move.w     d5,d1
		move.w     154(a2),d0
		movea.l    a5,a0
		bsr        vpos
		ext.l      d0
		move.l     d0,d5
		cmp.l      d6,d7
		bne.s      edit_blkselect_6
		cmp.l      4(a7),d0
		beq        edit_blkselect_7
edit_blkselect_6:
		cmp.l      d5,d3
		bgt.s      edit_blkselect_8
		cmp.l      68(a2),d5
		bge.s      edit_blkselect_9
		move.l     d5,64(a2)
		bra.s      edit_blkselect_10
edit_blkselect_9:
		cmp.l      68(a2),d3
		bge.s      edit_blkselect_11
		move.l     68(a2),64(a2)
		bra.s      edit_blkselect_12
edit_blkselect_11:
		move.l     68(a2),d0
		cmp.l      64(a2),d0
		blt.s      edit_blkselect_13
		moveq.l    #2,d2
		move.l     56(a2),d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
edit_blkselect_13:
		move.l     d3,64(a2)
edit_blkselect_12:
		move.l     d5,68(a2)
		cmp.l      64(a2),d5
		blt.s      edit_blkselect_14
edit_blkselect_10:
		moveq.l    #2,d2
		move.l     56(a2),d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
edit_blkselect_14:
		move.l     d3,64(a2)
		move.l     d5,68(a2)
		bra.s      edit_blkselect_15
edit_blkselect_8:
		cmp.l      64(a2),d5
		blt.s      edit_blkselect_16
		cmp.l      64(a2),d5
		ble.s      edit_blkselect_17
		move.l     d5,68(a2)
		bra.s      edit_blkselect_18
edit_blkselect_16:
		cmp.l      64(a2),d3
		ble.s      edit_blkselect_19
		move.l     64(a2),68(a2)
		move.l     d5,64(a2)
		bra.s      edit_blkselect_18
edit_blkselect_19:
		move.l     68(a2),d0
		cmp.l      64(a2),d0
		blt.s      edit_blkselect_20
		moveq.l    #2,d2
		move.l     56(a2),d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
edit_blkselect_20:
		move.l     d5,64(a2)
		move.l     d3,68(a2)
edit_blkselect_18:
		moveq.l    #2,d2
		move.l     56(a2),d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
edit_blkselect_17:
		move.l     d5,64(a2)
		move.l     d3,68(a2)
edit_blkselect_15:
		cmp.l      d6,d4
		bge.s      edit_blkselect_21
		cmp.l      56(a2),d6
		bge.s      edit_blkselect_22
		clr.w      d2
		move.l     56(a2),d1
		moveq.l    #1,d0
		add.l      d6,d0
		movea.l    a2,a0
		bsr        edit_selrange
		bra.s      edit_blkselect_23
edit_blkselect_22:
		cmp.l      56(a2),d4
		bge.s      edit_blkselect_24
		moveq.l    #1,d2
		move.l     d6,d1
		move.l     56(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
		bra.s      edit_blkselect_23
edit_blkselect_24:
		clr.w      d2
		moveq.l    #-1,d1
		add.l      d4,d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
		moveq.l    #1,d2
		move.l     d6,d1
		move.l     d4,d0
		movea.l    a2,a0
		bsr        edit_selrange
edit_blkselect_23:
		move.l     d4,48(a2)
		move.l     d6,56(a2)
		bra.s      edit_blkselect_25
edit_blkselect_21:
		cmp.l      48(a2),d6
		ble.s      edit_blkselect_26
		clr.w      d2
		moveq.l    #-1,d1
		add.l      d6,d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
		bra.s      edit_blkselect_27
edit_blkselect_26:
		cmp.l      48(a2),d4
		ble.s      edit_blkselect_28
		moveq.l    #1,d2
		move.l     48(a2),d1
		move.l     d6,d0
		movea.l    a2,a0
		bsr        edit_selrange
		bra.s      edit_blkselect_27
edit_blkselect_28:
		clr.w      d2
		move.l     56(a2),d1
		moveq.l    #1,d0
		add.l      d4,d0
		movea.l    a2,a0
		bsr        edit_selrange
		moveq.l    #1,d2
		moveq.l    #-1,d1
		add.l      d4,d1
		move.l     d6,d0
		movea.l    a2,a0
		bsr        edit_selrange
edit_blkselect_27:
		move.l     d6,48(a2)
		move.l     d4,56(a2)
edit_blkselect_25:
		cmp.l      24(a2),d6
		blt.s      edit_blkselect_29
		move.l     24(a2),d0
		add.l      10(a2),d0
		cmp.l      d0,d6
		bge.s      edit_blkselect_29
		cmp.l      28(a2),d5
		blt.s      edit_blkselect_29
		move.l     28(a2),d1
		add.l      14(a2),d1
		cmp.l      d1,d5
		blt.s      edit_blkselect_7
edit_blkselect_29:
		move.l     d6,d0
		movea.l    a2,a0
		bsr        edit_showline
		move.l     d5,d0
		movea.l    a2,a0
		bsr        edit_showcol
		movea.l    a2,a0
		bsr        edit_update
		moveq.l    #1,d0
		movea.l    a2,a0
		jsr        cleanup
edit_blkselect_7:
		move.l     d6,d7
		move.l     d5,4(a7)
		move.l     _globl,-(a7)
		pea.l      6(a7)
		pea.l      8(a7)
		movea.l    a4,a1
		movea.l    a3,a0
		jsr        mt_graf_mkstate
		lea.l      12(a7),a7
		moveq.l    #1,d0
		and.w      (a7),d0
		bne        edit_blkselect_30
		move.l     48(a2),d1
		lsl.l      #3,d1
		movea.l    44(a2),a0
		movea.l    0(a0,d1.l),a5
		move.w     66(a2),d1
		move.w     154(a2),d0
		movea.l    a5,a0
		bsr        posv
		ext.l      d0
		move.l     d0,52(a2)
		move.l     56(a2),d1
		lsl.l      #3,d1
		movea.l    44(a2),a0
		movea.l    0(a0,d1.l),a5
		move.w     70(a2),d1
		move.w     154(a2),d0
		movea.l    a5,a0
		bsr        posv
		ext.l      d0
		move.l     d0,60(a2)
		lea.l      12(a7),a7
		movem.l    (a7)+,d3-d7/a2-a5
		rts

edit_add:
		movem.l    d3/a2-a5,-(a7)
		movea.l    a0,a5
		movea.l    a1,a3
		move.l     44(a5),d1
		beq.s      edit_add_1
		move.l     d0,d2
		lsl.l      #3,d2
		movea.l    d1,a2
		adda.l     d2,a2
		movea.l    a1,a0
		jsr        strlen
		move.l     d0,d3
		add.w      4(a2),d3
		moveq.l    #1,d0
		add.w      d3,d0
		ext.l      d0
		jsr        Ax_malloc
		movea.l    a0,a4
		move.l     a4,d0
		bne.s      edit_add_2
		ori.w      #0x0001,158(a5)
edit_add_1:
		moveq.l    #-1,d0
		bra.s      edit_add_3
edit_add_2:
		move.w     4(a2),d0
		beq.s      edit_add_4
		movea.l    (a2),a5
		movea.l    a5,a1
		movea.l    a4,a0
		jsr        strcpy
		movea.l    a3,a1
		jsr        strcat
		move.l     a0,(a2)
		movea.l    a5,a0
		jsr        Ax_ifree
		bra.s      edit_add_5
edit_add_4:
		movea.l    a3,a1
		movea.l    a4,a0
		jsr        strcpy
		move.l     a0,(a2)
edit_add_5:
		move.w     d3,4(a2)
		clr.w      d0
edit_add_3:
		movem.l    (a7)+,d3/a2-a5
		rts

edit_appline:
		move.l     a2,-(a7)
		movea.l    12(a0),a0
		movea.l    12(a0),a2
		move.b     (a1),d0
		beq.s      edit_appline_1
		move.l     40(a2),d0
		movea.l    a2,a0
		bsr        edit_add
		tst.w      d0
		beq.s      edit_appline_1
		moveq.l    #-1,d0
		bra.s      edit_appline_2
edit_appline_1:
		move.l     40(a2),d0
		movea.l    a2,a0
		bsr        edit_showline
		clr.w      d0
edit_appline_2:
		movea.l    (a7)+,a2
		rts

edit_free:
		movem.l    d3/a2-a3,-(a7)
		movea.l    a0,a2
		movea.l    44(a2),a3
		move.l     40(a2),d3
		bra.s      edit_free_1
edit_free_3:
		move.w     4(a3),d0
		ble.s      edit_free_2
		movea.l    (a3),a0
		jsr        Ax_ifree
edit_free_2:
		addq.w     #8,a3
		subq.l     #1,d3
edit_free_1:
		tst.l      d3
		bpl.s      edit_free_3
		movea.l    44(a2),a0
		jsr        Ax_ifree
		move.l     146(a2),d0
		movea.l    150(a2),a0
		bsr        edit_freeundo
		clr.l      150(a2)
		clr.l      146(a2)
		moveq.l    #0,d0
		move.l     d0,68(a2)
		move.l     d0,64(a2)
		move.l     d0,60(a2)
		move.l     d0,52(a2)
		move.l     d0,56(a2)
		move.l     d0,48(a2)
		andi.w     #0xFDFF,18(a2)
		movem.l    (a7)+,d3/a2-a3
		rts

resize:
		move.l     a2,-(a7)
		movea.l    12(a0),a1
		movea.l    12(a1),a2
		move.w     22(a0),d0
		ext.l      d0
		divs.w     6(a2),d0
		ext.l      d0
		move.l     d0,10(a2)
		move.w     20(a0),d1
		ext.l      d1
		divs.w     8(a2),d1
		ext.l      d1
		move.l     d1,14(a2)
		move.l     d1,d0
		move.w     8(a2),d1
		ext.l      d1
		jsr        _lmul
		move.w     d0,74(a2)
		move.l     10(a2),d0
		move.w     6(a2),d1
		ext.l      d1
		jsr        _lmul
		move.w     d0,72(a2)
		andi.w     #0xFFFE,18(a2)
		ori.w      #0x0008,18(a2)
		move.l     32(a2),d0
		sub.l      14(a2),d0
		tst.l      d0
		bpl.s      resize_1
		moveq.l    #0,d0
resize_1:
		cmp.l      28(a2),d0
		bge.s      resize_2
		move.l     d0,28(a2)
resize_2:
		moveq.l    #1,d0
		add.l      40(a2),d0
		sub.l      10(a2),d0
		tst.l      d0
		bpl.s      resize_3
		moveq.l    #0,d0
resize_3:
		cmp.l      24(a2),d0
		bge.s      resize_4
		move.l     d0,24(a2)
resize_4:
		movea.l    (a7)+,a2
		rts

edit_nextrange:
		move.l     a2,-(a7)
		move.l     (a1),d0
		bmi.s      edit_nextrange_1
		moveq.l    #1,d0
		add.l      8(a1),d0
		bra.s      edit_nextrange_2
edit_nextrange_3:
		addq.l     #1,d0
		cmp.l      40(a0),d0
		ble.s      edit_nextrange_2
		move.l     #0xFFFFFFFF,(a1)
		move.l     #0xFFFFFFFF,8(a1)
		bra.s      edit_nextrange_1
edit_nextrange_2:
		moveq.l    #1,d1
		move.l     d0,d2
		lsl.l      #3,d2
		movea.l    44(a0),a2
		and.w      6(a2,d2.l),d1
		beq.s      edit_nextrange_3
		move.l     d0,(a1)
		bra.s      edit_nextrange_4
edit_nextrange_6:
		addq.l     #1,d0
edit_nextrange_4:
		cmp.l      40(a0),d0
		bge.s      edit_nextrange_5
		moveq.l    #1,d1
		move.l     d0,d2
		lsl.l      #3,d2
		movea.l    44(a0),a2
		and.w      14(a2,d2.l),d1
		bne.s      edit_nextrange_6
edit_nextrange_5:
		move.l     d0,8(a1)
edit_nextrange_1:
		movea.l    (a7)+,a2
		rts

edit_getrow:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     (a1),d0
		tst.l      d0
		bmi.s      edit_getrow_1
		cmp.l      40(a3),d0
		ble.s      edit_getrow_2
edit_getrow_1:
		move.l     #xcf36c,8(a2)
		move.l     #0xFFFFFFFF,4(a2)
		bra        edit_getrow_3
edit_getrow_2:
		move.l     d0,d1
		lsl.l      #3,d1
		movea.l    44(a3),a4
		adda.l     d1,a4
		movea.l    (a4),a0
		move.l     a0,d2
		bne.s      edit_getrow_4
		move.l     #xcf36c,8(a2)
		clr.l      4(a2)
		bra        edit_getrow_3
edit_getrow_4:
		move.w     18(a3),d1
		and.w      #0x0200,d1
		beq        edit_getrow_5
		move.w     112(a3),d2
		bne.s      edit_getrow_6
		cmp.l      48(a3),d0
		bne.s      edit_getrow_7
		move.l     52(a3),d1
		movea.l    (a4),a0
		adda.l     d1,a0
		move.l     a0,8(a2)
		cmp.l      56(a3),d0
		bne.s      edit_getrow_8
		move.l     60(a3),d1
		sub.l      52(a3),d1
		move.l     d1,4(a2)
		bra.s      edit_getrow_3
edit_getrow_8:
		move.w     4(a4),d1
		ext.l      d1
		sub.l      52(a3),d1
		move.l     d1,4(a2)
		bra.s      edit_getrow_3
edit_getrow_7:
		cmp.l      56(a3),d0
		bne.s      edit_getrow_5
		move.l     (a4),8(a2)
		move.l     60(a3),4(a2)
		bra.s      edit_getrow_3
edit_getrow_6:
		cmpi.w     #0x0005,112(a3)
		bne.s      edit_getrow_5
		move.l     68(a3),d0
		sub.l      64(a3),d0
		move.l     d0,4(a2)
		move.l     64(a3),d1
		move.l     d1,-(a7)
		move.w     70(a3),d1
		move.w     154(a3),d0
		movea.l    (a4),a0
		bsr        untab
		move.l     (a7)+,d0
		adda.l     d0,a0
		move.l     a0,8(a2)
		bra.s      edit_getrow_3
edit_getrow_5:
		move.l     (a4),8(a2)
		move.w     4(a4),d0
		ext.l      d0
		move.l     d0,4(a2)
edit_getrow_3:
		movem.l    (a7)+,a2-a4
		rts

edit_unselect:
		move.l     a2,-(a7)
		movea.l    a0,a2
		cmpi.w     #0x0004,112(a2)
		bne.s      edit_unselect_1
		clr.w      d2
		move.l     40(a2),d1
		moveq.l    #0,d0
		bsr        edit_selrange
		bra.s      edit_unselect_2
edit_unselect_1:
		clr.w      d2
		move.l     56(a2),d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
edit_unselect_2:
		move.w     18(a2),d0
		and.w      #0x0200,d0
		beq.s      edit_unselect_3
		andi.w     #0xFDFF,18(a2)
		move.w     #0x0080,d0
		and.w      18(a2),d0
		beq.s      edit_unselect_3
		movea.l    a2,a0
		bsr        change_cur
edit_unselect_3:
		movea.l    (a7)+,a2
		rts

edit_setselect:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		move.w     18(a2),d0
		and.w      #0x0200,d0
		beq.s      edit_setselect_1
		cmpi.w     #0x0004,112(a2)
		beq.s      edit_setselect_1
		move.l     48(a2),d1
		cmp.l      (a1),d1
		bne.s      edit_setselect_2
		move.l     52(a2),d2
		cmp.l      4(a3),d2
		bne.s      edit_setselect_2
		move.l     56(a2),d0
		cmp.l      8(a3),d0
		bne.s      edit_setselect_2
		move.l     60(a2),d1
		cmp.l      12(a3),d1
		beq.s      edit_setselect_3
edit_setselect_2:
		clr.w      d2
		move.l     56(a2),d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
edit_setselect_1:
		move.l     (a3),48(a2)
		move.l     4(a3),52(a2)
		move.w     54(a2),d1
		move.w     154(a2),d0
		move.l     48(a2),d2
		lsl.l      #3,d2
		movea.l    44(a2),a0
		movea.l    0(a0,d2.l),a0
		bsr        vpos
		ext.l      d0
		move.l     d0,64(a2)
		move.l     8(a3),56(a2)
		move.l     12(a3),60(a2)
		move.w     62(a2),d1
		move.w     154(a2),d0
		move.l     56(a2),d2
		lsl.l      #3,d2
		movea.l    44(a2),a0
		movea.l    0(a0,d2.l),a0
		bsr        vpos
		ext.l      d0
		move.l     d0,68(a2)
		ori.w      #0x0200,18(a2)
		moveq.l    #1,d2
		move.l     56(a2),d1
		move.l     48(a2),d0
		movea.l    a2,a0
		bsr        edit_selrange
edit_setselect_3:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

edit_find:
		movem.l    d3-d7/a2-a5,-(a7)
		lea.l      -36(a7),a7
		movea.l    a0,a3
		movea.l    a1,a2
		move.b     (a1),d0
		beq        edit_find_1
		movea.l    88(a3),a0
		move.l     12(a0),32(a7)
		lea.l      xcf36c,a1
		movea.l    32(a7),a4
		movea.l    8(a4),a4
		move.w     #0x0104,d0
		jsr        (a4)
		move.w     18(a3),d0
		and.w      #0x0400,d0
		bne.s      edit_find_2
		moveq.l    #1,d1
		bra.s      edit_find_3
edit_find_2:
		clr.w      d1
edit_find_3:
		move.w     d1,2(a7)
		move.w     18(a3),d0
		and.w      #0x0800,d0
		bne.s      edit_find_4
		moveq.l    #1,d2
		bra.s      edit_find_5
edit_find_4:
		clr.w      d2
edit_find_5:
		move.w     d2,(a7)
		move.b     (a2),d5
		move.b     d5,d6
		tst.w      d2
		bne.s      edit_find_6
		cmp.b      #0x61,d5
		blt.s      edit_find_7
		cmp.b      #0x7A,d5
		bgt.s      edit_find_7
		add.b      #0xE0,d6
		bra.s      edit_find_6
edit_find_7:
		cmp.b      #0x41,d5
		blt.s      edit_find_6
		cmp.b      #0x5A,d5
		bgt.s      edit_find_6
		add.b      #0x20,d6
edit_find_6:
		movea.l    a2,a0
		jsr        strlen
		move.l     d0,d7
		move.l     48(a3),d3
		move.l     52(a3),8(a7)
		lea.l      12(a7),a5
		move.w     18(a3),d0
		and.w      #0x1000,d0
		beq        edit_find_8
		bra        edit_find_9
edit_find_21:
		move.l     d3,d0
		lsl.l      #3,d0
		movea.l    44(a3),a0
		adda.l     d0,a0
		move.l     a0,28(a7)
		move.w     4(a0),d1
		ble        edit_find_10
		move.l     8(a7),d2
		bmi.s      edit_find_11
		moveq.l    #-1,d4
		add.l      d2,d4
		bra.s      edit_find_12
edit_find_11:
		movea.l    28(a7),a0
		move.w     4(a0),d4
		ext.l      d4
		sub.l      d7,d4
edit_find_12:
		movea.l    28(a7),a0
		movea.l    (a0),a4
		adda.l     d4,a4
		bra.w      edit_find_13
edit_find_20:
		cmp.b      (a4),d5
		beq.s      edit_find_14
		cmp.b      (a4),d6
		bne.s      edit_find_15
edit_find_14:
		move.w     (a7),d0
		beq.s      edit_find_16
		movea.l    a4,a1
		movea.l    a2,a0
		move.l     d7,d0
		jsr        strncmp
		tst.w      d0
		beq.s      edit_find_17
edit_find_16:
		move.l     d7,d0
		movea.l    a4,a1
		movea.l    a2,a0
		jsr        strnicmp
		tst.w      d0
		bne.s      edit_find_15
edit_find_17:
		move.w     2(a7),d0
		bne        edit_find_18
		tst.l      d4
		bne.s      edit_find_19
		move.b     0(a4,d7.l),d0
		ext.w      d0
		lea.l      160(a3),a0
		jsr        strchr
		move.l     a0,d0
		bne        edit_find_18
edit_find_19:
		move.b     -1(a4),d0
		ext.w      d0
		lea.l      160(a3),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      edit_find_15
		move.b     0(a4,d7.l),d0
		ext.w      d0
		lea.l      160(a3),a0
		jsr        strchr
		move.l     a0,d0
		bne        edit_find_18
edit_find_15:
		subq.w     #1,a4
		subq.l     #1,d4
edit_find_13:
		tst.l      d4
		bpl.w      edit_find_20
edit_find_10:
		move.l     #0xFFFFFFFF,8(a7)
		subq.l     #1,d3
edit_find_9:
		tst.l      d3
		bpl        edit_find_21
		bra        edit_find_22
edit_find_8:
		move.l     40(a3),4(a7)
		addq.l     #1,8(a7)
		bra        edit_find_23
edit_find_32:
		move.l     d3,d0
		lsl.l      #3,d0
		movea.l    44(a3),a0
		adda.l     d0,a0
		move.l     a0,28(a7)
		move.w     4(a0),d1
		ble        edit_find_24
		move.l     8(a7),d2
		movea.l    (a0),a4
		adda.l     d2,a4
		move.l     d2,d4
		bra        edit_find_25
edit_find_31:
		cmp.b      (a4),d5
		beq.s      edit_find_26
		cmp.b      (a4),d6
		bne        edit_find_27
edit_find_26:
		move.w     (a7),d0
		beq.s      edit_find_28
		movea.l    a4,a1
		movea.l    a2,a0
		move.l     d7,d0
		jsr        strncmp
		tst.w      d0
		beq.s      edit_find_29
edit_find_28:
		move.l     d7,d0
		movea.l    a4,a1
		movea.l    a2,a0
		jsr        strnicmp
		tst.w      d0
		bne.s      edit_find_27
edit_find_29:
		move.w     2(a7),d0
		bne.s      edit_find_18
		tst.l      d4
		bne.s      edit_find_30
		move.b     0(a4,d7.l),d0
		ext.w      d0
		lea.l      160(a3),a0
		jsr        strchr
		move.l     a0,d0
		bne.s      edit_find_18
edit_find_30:
		move.b     -1(a4),d0
		ext.w      d0
		lea.l      160(a3),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      edit_find_27
		move.b     0(a4,d7.l),d0
		ext.w      d0
		lea.l      160(a3),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      edit_find_27
edit_find_18:
		move.l     d3,(a5)
		move.l     d3,8(a5)
		move.l     d4,4(a5)
		move.l     d4,d0
		add.l      d7,d0
		move.l     d0,12(a5)
		movea.l    a5,a1
		movea.l    a3,a0
		bsr        edit_setselect
		bra.s      edit_find_1
edit_find_27:
		addq.w     #1,a4
		addq.l     #1,d4
edit_find_25:
		move.b     (a4),d0
		bne        edit_find_31
edit_find_24:
		clr.l      8(a7)
		addq.l     #1,d3
edit_find_23:
		cmp.l      4(a7),d3
		ble        edit_find_32
edit_find_22:
		moveq.l    #4,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a1
		and.w      14(a1),d0
		beq.s      edit_find_33
		moveq.l    #7,d1
		moveq.l    #2,d0
		jsr        Bconout
edit_find_33:
		lea.l      xcf36d,a1
		move.w     #0x0104,d0
		movea.l    88(a3),a0
		movea.l    32(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		eori.w     #0x1000,18(a3)
edit_find_1:
		lea.l      36(a7),a7
		movem.l    (a7)+,d3-d7/a2-a5
		rts

edit_getneed:
		move.l     a2,-(a7)
		movea.l    44(a0),a2
		move.l     40(a0),d0
		moveq.l    #-2,d1
		bra.s      edit_getneed_1
edit_getneed_2:
		moveq.l    #2,d2
		add.w      4(a2),d2
		ext.l      d2
		add.l      d2,d1
		addq.w     #8,a2
edit_getneed_1:
		move.l     d0,d2
		subq.l     #1,d0
		tst.l      d2
		bpl.s      edit_getneed_2
		move.l     d1,(a1)
		movea.l    (a7)+,a2
		rts

edit_selectword:
		movem.l    d3-d6/a2-a3,-(a7)
		lea.l      -16(a7),a7
		movea.l    a0,a2
		move.l     d0,d3
		lsl.l      #3,d0
		movea.l    44(a2),a0
		adda.l     d0,a0
		move.w     4(a0),d4
		movea.l    (a0),a3
		move.w     d1,d5
		move.w     d5,d6
		bra.s      edit_selectword_1
edit_selectword_3:
		subq.w     #1,d6
edit_selectword_1:
		tst.w      d6
		ble.s      edit_selectword_2
		move.b     -1(a3,d6.w),d0
		ext.w      d0
		lea.l      160(a2),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      edit_selectword_3
		bra.s      edit_selectword_2
edit_selectword_5:
		addq.w     #1,d5
edit_selectword_2:
		cmp.w      d5,d4
		ble.s      edit_selectword_4
		move.b     0(a3,d5.w),d0
		ext.w      d0
		lea.l      160(a2),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      edit_selectword_5
edit_selectword_4:
		cmp.w      d6,d5
		ble.s      edit_selectword_6
		move.l     d3,8(a7)
		move.l     d3,(a7)
		move.w     d6,d0
		ext.l      d0
		move.l     d0,4(a7)
		move.w     d5,d1
		ext.l      d1
		move.l     d1,12(a7)
		lea.l      (a7),a1
		movea.l    a2,a0
		bsr        edit_setselect
		bra.s      edit_selectword_7
edit_selectword_6:
		moveq.l    #4,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a1
		and.w      14(a1),d0
		beq.s      edit_selectword_7
		moveq.l    #7,d1
		moveq.l    #2,d0
		jsr        Bconout
edit_selectword_7:
		lea.l      16(a7),a7
		movem.l    (a7)+,d3-d6/a2-a3
		rts

Auo_editor:
		movem.l    d3/a2-a5,-(a7)
		lea.l      -30(a7),a7
		move.l     a0,26(a7)
		movea.l    a1,a4
		movea.l    12(a0),a0
		movea.l    12(a0),a3
		move.w     d0,d1
		cmp.w      #0x0107,d1
		bhi        Auo_editor_1
		add.w      d1,d1
		move.w     J26(pc,d1.w),d1
		jmp        J26(pc,d1.w)
J26:
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_2-J26
		dc.w Auo_editor_3-J26
		dc.w Auo_editor_4-J26
		dc.w Auo_editor_5-J26
		dc.w Auo_editor_6-J26
		dc.w Auo_editor_7-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_8-J26
		dc.w Auo_editor_9-J26
		dc.w Auo_editor_10-J26
		dc.w Auo_editor_11-J26
		dc.w Auo_editor_12-J26
		dc.w Auo_editor_13-J26
		dc.w Auo_editor_14-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_15-J26
		dc.w Auo_editor_16-J26
		dc.w Auo_editor_17-J26
		dc.w Auo_editor_17-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_18-J26
		dc.w Auo_editor_19-J26
		dc.w Auo_editor_20-J26
		dc.w Auo_editor_21-J26
		dc.w Auo_editor_22-J26
		dc.w Auo_editor_23-J26
		dc.w Auo_editor_24-J26
		dc.w Auo_editor_25-J26
		dc.w Auo_editor_26-J26
		dc.w Auo_editor_27-J26
		dc.w Auo_editor_28-J26
		dc.w Auo_editor_29-J26
		dc.w Auo_editor_30-J26
		dc.w Auo_editor_31-J26
		dc.w Auo_editor_32-J26
		dc.w Auo_editor_33-J26
		dc.w Auo_editor_34-J26
		dc.w Auo_editor_35-J26
		dc.w Auo_editor_36-J26
		dc.w Auo_editor_37-J26
		dc.w Auo_editor_38-J26
		dc.w Auo_editor_39-J26
		dc.w Auo_editor_40-J26
		dc.w Auo_editor_41-J26
		dc.w Auo_editor_42-J26
		dc.w Auo_editor_43-J26
		dc.w Auo_editor_44-J26
		dc.w Auo_editor_45-J26
		dc.w Auo_editor_46-J26
		dc.w Auo_editor_47-J26
		dc.w Auo_editor_48-J26
		dc.w Auo_editor_49-J26
		dc.w Auo_editor_50-J26
		dc.w Auo_editor_51-J26
		dc.w Auo_editor_52-J26
		dc.w Auo_editor_53-J26
		dc.w Auo_editor_54-J26
		dc.w Auo_editor_55-J26
		dc.w Auo_editor_56-J26
		dc.w Auo_editor_57-J26
		dc.w Auo_editor_58-J26
		dc.w Auo_editor_59-J26
		dc.w Auo_editor_60-J26
		dc.w Auo_editor_61-J26
		dc.w Auo_editor_62-J26
		dc.w Auo_editor_63-J26
		dc.w Auo_editor_64-J26
		dc.w Auo_editor_65-J26
		dc.w Auo_editor_66-J26
		dc.w Auo_editor_67-J26
		dc.w Auo_editor_68-J26
		dc.w Auo_editor_69-J26
		dc.w Auo_editor_70-J26
		dc.w Auo_editor_71-J26
		dc.w Auo_editor_72-J26
		dc.w Auo_editor_73-J26
		dc.w Auo_editor_74-J26
		dc.w Auo_editor_75-J26
		dc.w Auo_editor_76-J26
		dc.w Auo_editor_77-J26
		dc.w Auo_editor_1-J26
		dc.w Auo_editor_78-J26
		dc.w Auo_editor_79-J26
		dc.w Auo_editor_80-J26
Auo_editor_76:
		move.w     158(a3),(a4)
		bra        Auo_editor_17
Auo_editor_77:
		clr.w      158(a3)
		bra        Auo_editor_17
Auo_editor_72:
		move.w     (a4),156(a3)
		bra        Auo_editor_17
Auo_editor_70:
		move.l     52(a3),d1
		move.l     48(a3),d0
		movea.l    a3,a0
		bsr        edit_selectword
		bra        Auo_editor_17
Auo_editor_69:
		movea.l    a4,a1
		movea.l    a3,a0
		bsr        edit_getneed
		bra        Auo_editor_17
Auo_editor_67:
		andi.w     #0xDFFF,18(a3)
		bra        Auo_editor_17
Auo_editor_68:
		move.w     18(a3),d0
		and.w      #0x2000,d0
		bne.s      Auo_editor_81
Auo_editor_82:
		clr.w      (a4)
		bra        Auo_editor_17
Auo_editor_60:
		movea.l    a4,a1
		movea.l    a3,a0
		bsr        edit_find
		bra        Auo_editor_17
Auo_editor_65:
		ori.w      #0x0400,18(a3)
		bra        Auo_editor_17
Auo_editor_66:
		andi.w     #0xFBFF,18(a3)
		bra        Auo_editor_17
Auo_editor_61:
		ori.w      #0x1000,18(a3)
		bra        Auo_editor_17
Auo_editor_62:
		andi.w     #0xEFFF,18(a3)
		bra        Auo_editor_17
Auo_editor_64:
		ori.w      #0x0800,18(a3)
		bra        Auo_editor_17
Auo_editor_63:
		andi.w     #0xF7FF,18(a3)
		bra        Auo_editor_17
Auo_editor_59:
		cmpi.w     #0x0005,112(a3)
		bne.s      Auo_editor_82
Auo_editor_81:
		move.w     #0x0001,(a4)
		bra        Auo_editor_17
Auo_editor_56:
		movea.l    26(a7),a0
		bsr        resize
		movea.l    26(a7),a0
		move.w     74(a3),20(a0)
		move.w     72(a3),22(a0)
		bra        Auo_editor_17
Auo_editor_55:
		move.l     146(a3),d0
		movea.l    150(a3),a0
		bsr        edit_freeundo
		clr.l      150(a3)
		clr.l      146(a3)
		bra        Auo_editor_17
Auo_editor_53:
		movea.l    a3,a0
		bsr        edit_undo
		bra        Auo_editor_17
Auo_editor_20:
		movea.l    a4,a1
		movea.l    a3,a0
		bsr        edit_getrow
		bra        Auo_editor_17
Auo_editor_58:
		move.w     154(a3),(a4)
		bra        Auo_editor_17
Auo_editor_54:
		move.w     (a4),154(a3)
		move.w     54(a3),d1
		move.w     154(a3),d0
		move.l     48(a3),d2
		lsl.l      #3,d2
		movea.l    44(a3),a0
		movea.l    0(a0,d2.l),a0
		bsr        vpos
		ext.l      d0
		move.l     d0,64(a3)
		move.w     62(a3),d1
		move.w     154(a3),d0
		move.l     56(a3),d2
		lsl.l      #3,d2
		movea.l    44(a3),a0
		movea.l    0(a0,d2.l),a0
		bsr        vpos
		ext.l      d0
		move.l     d0,68(a3)
		bra        Auo_editor_17
Auo_editor_52:
		movea.l    a4,a1
		movea.l    a3,a0
		bsr        edit_substitute
		bra        Auo_editor_17
Auo_editor_51:
		moveq.l    #1,d0
		add.l      40(a3),d0
		move.l     d0,(a4)
		bra        Auo_editor_17
Auo_editor_50:
		move.l     48(a3),d0
		lsl.l      #3,d0
		movea.l    44(a3),a0
		move.w     4(a0,d0.l),d1
		ext.l      d1
		move.l     d1,(a4)
		bra        Auo_editor_17
Auo_editor_73:
		move.l     48(a3),d0
		lsl.l      #3,d0
		movea.l    44(a3),a0
		adda.l     d0,a0
		move.l     a0,18(a7)
		move.l     64(a3),(a4)
		bra        Auo_editor_17
Auo_editor_49:
		move.l     48(a3),d0
		lsl.l      #3,d0
		movea.l    44(a3),a0
		adda.l     d0,a0
		move.l     a0,18(a7)
		move.w     66(a3),d1
		move.w     154(a3),d0
		movea.l    (a0),a0
		bsr        posv
		move.w     d0,d3
		ext.l      d3
		move.l     d3,(a4)
		bra        Auo_editor_17
Auo_editor_44:
		movea.l    a3,a0
		bsr        edit_unselect
		bra        Auo_editor_17
Auo_editor_45:
		cmpi.w     #0x0004,112(a3)
		bne.s      Auo_editor_83
		movea.l    a4,a1
		movea.l    a3,a0
		bsr        edit_nextrange
		bra        Auo_editor_17
Auo_editor_83:
		move.w     18(a3),d0
		and.w      #0x0200,d0
		beq.s      Auo_editor_84
		move.l     48(a3),(a4)
		move.l     52(a3),4(a4)
		move.l     56(a3),8(a4)
		move.l     60(a3),12(a4)
		bra        Auo_editor_17
Auo_editor_84:
		move.l     #0xFFFFFFFF,(a4)
		bra        Auo_editor_17
Auo_editor_46:
		movea.l    a4,a1
		movea.l    a3,a0
		bsr        edit_setselect
		bra        Auo_editor_17
Auo_editor_47:
		move.l     (a4),114(a3)
		move.l     4(a4),118(a3)
		bra        Auo_editor_17
Auo_editor_48:
		move.l     114(a3),d0
		beq        Auo_editor_17
		move.l     48(a3),d1
		lsl.l      #3,d1
		movea.l    44(a3),a0
		adda.l     d1,a0
		move.l     a0,18(a7)
		cmpi.w     #0x0002,112(a3)
		beq.s      Auo_editor_85
		cmpi.w     #0x0001,112(a3)
		bne.s      Auo_editor_86
Auo_editor_85:
		moveq.l    #1,d0
		movea.l    18(a7),a0
		and.w      6(a0),d0
		beq.s      Auo_editor_86
		move.l     (a0),(a7)
		move.l     (a7),d1
		bne.s      Auo_editor_87
Auo_editor_86:
		move.l     #xcf36c,(a7)
Auo_editor_87:
		movea.l    (a7),a1
		movea.l    118(a3),a0
		movea.l    114(a3),a5
		jsr        (a5)
		bra        Auo_editor_17
Auo_editor_38:
		move.w     #0x0002,112(a3)
		bra        Auo_editor_17
Auo_editor_39:
		move.w     #0x0001,112(a3)
		bra        Auo_editor_17
Auo_editor_40:
		move.w     #0x0003,112(a3)
		bra        Auo_editor_17
Auo_editor_41:
		move.w     #0x0004,112(a3)
		bra        Auo_editor_17
Auo_editor_42:
		clr.w      112(a3)
		bra        Auo_editor_17
Auo_editor_43:
		move.w     #0x0005,112(a3)
		bra        Auo_editor_17
Auo_editor_8:
		movea.l    a4,a2
		move.l     (a2),84(a3)
		move.l     4(a2),88(a3)
		move.w     8(a2),92(a3)
		bra        Auo_editor_17
Auo_editor_16:
		movea.l    a4,a2
		move.l     84(a3),(a2)
		move.l     88(a3),4(a2)
		move.w     92(a3),8(a2)
		bra        Auo_editor_17
Auo_editor_37:
		movea.l    a3,a0
		bsr        edit_view
		bra        Auo_editor_17
Auo_editor_29:
		ori.w      #0x0020,18(a3)
Auo_editor_88:
		andi.w     #0xFF7F,18(a3)
		bra        Auo_editor_17
Auo_editor_30:
		andi.w     #0xFF5F,18(a3)
		bra        Auo_editor_17
Auo_editor_31:
		moveq.l    #32,d0
		and.w      18(a3),d0
		beq        Auo_editor_17
		move.w     #0x0080,d1
		and.w      18(a3),d1
		beq        Auo_editor_17
		movea.l    a3,a0
		bsr        change_cur
		bra.s      Auo_editor_88
Auo_editor_32:
		moveq.l    #32,d0
		and.w      18(a3),d0
		beq        Auo_editor_17
		move.w     #0x0080,d1
		and.w      18(a3),d1
		bne        Auo_editor_17
		ori.w      #0x0080,18(a3)
		movea.l    a3,a0
		bsr        change_cur
		bra        Auo_editor_17
Auo_editor_33:
		move.l     (a4),52(a3)
		move.l     52(a3),60(a3)
		move.w     54(a3),d1
		move.w     154(a3),d0
		move.l     48(a3),d2
		lsl.l      #3,d2
		movea.l    44(a3),a0
		movea.l    0(a0,d2.l),a0
		bsr        vpos
		ext.l      d0
		move.l     d0,64(a3)
		move.l     d0,68(a3)
		bra        Auo_editor_17
Auo_editor_34:
		move.l     48(a3),(a4)
		bra        Auo_editor_17
Auo_editor_2:
		movea.l    26(a7),a0
		jsr        create
		tst.w      d0
		beq        Auo_editor_17
		move.w     #0xFFFF,(a4)
		bra        Auo_editor_17
Auo_editor_3:
		movea.l    a3,a0
		bsr        edit_free
		movea.l    a3,a0
		jsr        Ax_ifree
		bra        Auo_editor_17
Auo_editor_5:
		move.l     48(a3),d0
		lsl.l      #3,d0
		movea.l    44(a3),a0
		adda.l     d0,a0
		move.l     a0,18(a7)
		movea.l    (a0),a0
		jsr        Ax_ifree
		movea.l    18(a7),a0
		clr.l      (a0)
		clr.w      4(a0)
		movea.l    a4,a1
		move.l     48(a3),d0
		movea.l    a3,a0
		bsr        edit_add
		move.l     48(a3),d0
		movea.l    a3,a0
		bsr        edit_showline
		bra        Auo_editor_17
Auo_editor_4:
		move.l     48(a3),d0
		lsl.l      #3,d0
		movea.l    44(a3),a0
		adda.l     d0,a0
		move.l     a0,18(a7)
		move.w     4(a0),d1
		ble.s      Auo_editor_89
		move.l     (a0),(a4)
		bra        Auo_editor_17
Auo_editor_89:
		move.l     #xcf36c,(a4)
		bra        Auo_editor_17
Auo_editor_25:
		move.w     (a4),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		move.w     d0,2(a3)
		bra.s      Auo_editor_90
Auo_editor_26:
		move.w     (a4),4(a3)
Auo_editor_90:
		pea.l      6(a3)
		pea.l      8(a3)
		lea.l      4(a3),a1
		lea.l      24(a7),a0
		move.w     4(a3),d1
		movea.l    ACSblk,a5
		move.w     16(a5),d0
		jsr        vst_height
		addq.w     #8,a7
		bra.s      Auo_editor_91
Auo_editor_27:
		move.w     (a4),(a3)
		bra        Auo_editor_17
Auo_editor_28:
		move.l     (a4),32(a3)
		cmpi.l     #0x00000200,32(a3)
		ble.s      Auo_editor_91
		move.l     #0x00000200,32(a3)
Auo_editor_91:
		movea.l    26(a7),a0
		bsr        resize
		bra        Auo_editor_17
Auo_editor_22:
		movea.l    a4,a1
		movea.l    26(a7),a0
		bsr        edit_appline
		bra        Auo_editor_17
Auo_editor_23:
		move.l     (a4),20(a3)
		move.l     36(a3),d0
		cmp.l      20(a3),d0
		ble        Auo_editor_17
		move.l     d0,20(a3)
		bra        Auo_editor_17
Auo_editor_24:
		movea.l    a3,a0
		bsr        edit_free
		movea.l    a3,a0
		jsr        edit_restart
		bra        Auo_editor_17
Auo_editor_7:
		ori.w      #0x0008,18(a3)
Auo_editor_6:
		movea.l    a3,a0
		bsr        edit_update
		bra        Auo_editor_71
Auo_editor_57:
		movea.l    a3,a0
		bsr        edit_update
		bra        Auo_editor_17
Auo_editor_9:
		addq.l     #1,48(a3)
		bra.s      Auo_editor_92
Auo_editor_10:
		subq.l     #1,48(a3)
		bra.s      Auo_editor_93
Auo_editor_11:
		move.l     10(a3),d0
		add.l      d0,48(a3)
		bra.s      Auo_editor_92
Auo_editor_12:
		move.l     10(a3),d0
		sub.l      d0,48(a3)
Auo_editor_93:
		move.l     48(a3),d0
		bpl        Auo_editor_17
Auo_editor_13:
		clr.l      48(a3)
		bra        Auo_editor_17
Auo_editor_14:
		move.l     40(a3),48(a3)
		bra        Auo_editor_17
Auo_editor_15:
		move.l     (a4),48(a3)
		move.l     48(a3),d0
		bpl.s      Auo_editor_92
		clr.l      48(a3)
Auo_editor_92:
		move.l     48(a3),d0
		cmp.l      40(a3),d0
		ble        Auo_editor_17
		bra.s      Auo_editor_14
Auo_editor_35:
		move.l     (a4),28(a3)
		move.l     32(a3),d3
		sub.l      14(a3),d3
		cmp.l      28(a3),d3
		bge.s      Auo_editor_94
		move.l     d3,28(a3)
Auo_editor_94:
		move.l     28(a3),d0
		bpl        Auo_editor_17
		clr.l      28(a3)
		bra        Auo_editor_17
Auo_editor_74:
		move.l     28(a3),(a4)
		bra        Auo_editor_17
Auo_editor_36:
		move.l     (a4),24(a3)
		move.l     24(a3),d0
		bpl.s      Auo_editor_95
		clr.l      24(a3)
Auo_editor_95:
		move.l     40(a3),d3
		sub.l      10(a3),d3
		addq.l     #1,d3
		tst.l      d3
		bmi        Auo_editor_17
		cmp.l      24(a3),d3
		bge        Auo_editor_17
		move.l     d3,24(a3)
		bra        Auo_editor_17
Auo_editor_75:
		move.l     24(a3),(a4)
		bra        Auo_editor_17
Auo_editor_21:
		movea.l    26(a7),a0
		bsr        edit_newline
		bra        Auo_editor_17
Auo_editor_18:
		moveq.l    #1,d0
		and.w      18(a3),d0
		beq.s      Auo_editor_96
		movea.l    26(a7),a0
		bsr        resize
Auo_editor_96:
		movea.l    a4,a2
		movea.l    4(a2),a0
		move.l     a0,98(a3)
		move.l     a0,12(a7)
		move.l     #vertical,4(a7)
		lea.l      84(a3),a1
		move.l     a1,8(a7)
		move.l     12(a0),22(a7)
		moveq.l    #9,d0
		movea.l    22(a7),a5
		movea.l    8(a5),a5
		movea.l    a2,a1
		jsr        (a5)
		lea.l      4(a7),a1
		moveq.l    #103,d0
		movea.l    12(a7),a0
		movea.l    22(a7),a5
		movea.l    8(a5),a5
		jsr        (a5)
		bra.s      Auo_editor_97
Auo_editor_19:
		moveq.l    #1,d0
		and.w      18(a3),d0
		beq.s      Auo_editor_98
		movea.l    26(a7),a0
		bsr        resize
Auo_editor_98:
		movea.l    a4,a2
		movea.l    4(a2),a0
		move.l     a0,94(a3)
		move.l     a0,12(a7)
		move.l     #horizontal,4(a7)
		lea.l      84(a3),a1
		move.l     a1,8(a7)
		move.l     12(a0),22(a7)
		moveq.l    #9,d0
		movea.l    22(a7),a5
		movea.l    8(a5),a5
		movea.l    a2,a1
		jsr        (a5)
		lea.l      4(a7),a1
		moveq.l    #103,d0
		movea.l    12(a7),a0
		movea.l    22(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		lea.l      32(a3),a1
		moveq.l    #100,d0
		movea.l    12(a7),a0
		movea.l    22(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Auo_editor_97:
		lea.l      xcf36c,a1
		moveq.l    #4,d0
		movea.l    12(a7),a0
		movea.l    22(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		clr.w      d0
		movea.l    a3,a0
		jsr        cleanup
		bra.s      Auo_editor_17
Auo_editor_71:
		moveq.l    #1,d0
		movea.l    a3,a0
		jsr        cleanup
		bra.s      Auo_editor_17
Auo_editor_78:
		ori.w      #0x2000,18(a3)
		bra.s      Auo_editor_17
Auo_editor_79:
		movea.l    a4,a1
		lea.l      160(a3),a0
		jsr        strcpy
		bra.s      Auo_editor_17
Auo_editor_80:
		lea.l      160(a3),a0
		move.l     a0,(a4)
		bra.s      Auo_editor_17
Auo_editor_1:
		clr.w      d0
		bra.s      Auo_editor_99
Auo_editor_17:
		moveq.l    #1,d0
Auo_editor_99:
		lea.l      30(a7),a7
		movem.l    (a7)+,d3/a2-a5
		rts

edit_forbracket:
		movem.l    d3-d7/a2-a5,-(a7)
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.l     d0,d5
		move.l     d1,d6
		move.b     d2,d3
		ext.w      d2
		sub.w      #0x0028,d2
		beq.s      edit_forbracket_1
		sub.w      #0x0014,d2
		beq.s      edit_forbracket_2
		sub.w      #0x001F,d2
		beq.s      edit_forbracket_3
		sub.w      #0x0020,d2
		beq.s      edit_forbracket_4
		bra.s      edit_forbracket_5
edit_forbracket_3:
		moveq.l    #93,d4
		bra.s      edit_forbracket_5
edit_forbracket_1:
		moveq.l    #41,d4
		bra.s      edit_forbracket_5
edit_forbracket_4:
		moveq.l    #125,d4
		bra.s      edit_forbracket_5
edit_forbracket_2:
		moveq.l    #62,d4
edit_forbracket_5:
		move.l     d5,(a7)
		move.l     d6,4(a7)
		addq.l     #1,d6
		move.l     d5,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		movea.l    44(a0),a4
		adda.l     d0,a4
		moveq.l    #1,d7
		bra        edit_forbracket_6
edit_forbracket_14:
		movea.l    16(a7),a0
		cmp.l      40(a0),d5
		ble.s      edit_forbracket_7
		moveq.l    #4,d0
		movea.l    ACSblk,a1
		movea.l    572(a1),a0
		and.w      14(a0),d0
		beq.s      edit_forbracket_8
		moveq.l    #7,d1
		moveq.l    #2,d0
		jsr        Bconout
edit_forbracket_8:
		movea.l    16(a7),a0
		movea.l    88(a0),a1
		movea.l    12(a1),a5
		lea.l      xcf37e,a1
		move.w     #0x0104,d0
		movea.l    88(a0),a0
		movea.l    8(a5),a2
		jsr        (a2)
		bra.s      edit_forbracket_9
edit_forbracket_7:
		move.w     4(a4),d0
		ble.s      edit_forbracket_10
		movea.l    (a4),a5
		adda.l     d6,a5
		move.b     d3,d0
		ext.w      d0
		movea.l    a5,a0
		jsr        strchr
		movea.l    a0,a2
		move.b     d4,d0
		ext.w      d0
		movea.l    a5,a0
		jsr        strchr
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      edit_forbracket_11
		move.l     a2,d1
		beq.s      edit_forbracket_10
edit_forbracket_13:
		move.l     a2,d6
		sub.l      (a4),d6
		addq.l     #1,d6
		addq.w     #1,d7
		bra.s      edit_forbracket_6
edit_forbracket_11:
		move.l     a2,d0
		beq.s      edit_forbracket_12
		cmpa.l     d0,a3
		bcc.s      edit_forbracket_13
edit_forbracket_12:
		move.l     a3,d6
		sub.l      (a4),d6
		addq.l     #1,d6
		subq.w     #1,d7
		bra.s      edit_forbracket_6
edit_forbracket_10:
		moveq.l    #0,d6
		addq.l     #1,d5
		addq.w     #8,a4
edit_forbracket_6:
		tst.w      d7
		bgt        edit_forbracket_14
		move.l     d5,8(a7)
		move.l     d6,12(a7)
		lea.l      (a7),a1
		movea.l    16(a7),a0
		bsr        edit_setselect
edit_forbracket_9:
		lea.l      20(a7),a7
		movem.l    (a7)+,d3-d7/a2-a5
		rts

edit_backbracket:
		movem.l    d3-d7/a2-a5,-(a7)
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		move.l     d0,d5
		move.l     d1,d6
		move.b     d2,20(a7)
		ext.w      d2
		sub.w      #0x0029,d2
		beq.s      edit_backbracket_1
		sub.w      #0x0015,d2
		beq.s      edit_backbracket_2
		sub.w      #0x001F,d2
		beq.s      edit_backbracket_3
		sub.w      #0x0020,d2
		beq.s      edit_backbracket_4
		bra.s      edit_backbracket_5
edit_backbracket_3:
		moveq.l    #91,d4
		bra.s      edit_backbracket_5
edit_backbracket_1:
		moveq.l    #40,d4
		bra.s      edit_backbracket_5
edit_backbracket_4:
		moveq.l    #123,d4
		bra.s      edit_backbracket_5
edit_backbracket_2:
		moveq.l    #60,d4
edit_backbracket_5:
		move.l     d5,12(a7)
		moveq.l    #1,d0
		add.l      d6,d0
		move.l     d0,16(a7)
		move.l     d5,d1
		lsl.l      #3,d1
		movea.l    22(a7),a0
		movea.l    44(a0),a4
		adda.l     d1,a4
		moveq.l    #1,d7
		bra        edit_backbracket_6
edit_backbracket_16:
		tst.l      d6
		bpl.s      edit_backbracket_7
		subq.l     #1,d5
		subq.w     #8,a4
		move.w     4(a4),d6
		ext.l      d6
edit_backbracket_7:
		tst.l      d5
		bpl.s      edit_backbracket_8
		moveq.l    #4,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a1
		and.w      14(a1),d0
		beq.s      edit_backbracket_9
		moveq.l    #7,d1
		moveq.l    #2,d0
		jsr        Bconout
edit_backbracket_9:
		movea.l    22(a7),a0
		movea.l    88(a0),a1
		movea.l    12(a1),a5
		lea.l      xcf37e,a1
		move.w     #0x0104,d0
		movea.l    88(a0),a0
		movea.l    8(a5),a2
		jsr        (a2)
		bra        edit_backbracket_10
edit_backbracket_8:
		move.w     4(a4),d0
		ble.s      edit_backbracket_11
		movea.l    (a4),a5
		lea.l      0(a5,d6.l),a2
		move.b     (a2),d3
		clr.b      (a2)
		move.b     20(a7),d0
		ext.w      d0
		movea.l    a5,a0
		jsr        strrchr
		movea.l    a0,a3
		move.b     d4,d0
		ext.w      d0
		movea.l    a5,a0
		jsr        strrchr
		move.l     a0,(a7)
		move.b     d3,(a2)
		move.l     a0,d0
		beq.s      edit_backbracket_12
		cmpa.l     d0,a2
		bhi.s      edit_backbracket_13
edit_backbracket_12:
		move.l     a3,d0
		beq.s      edit_backbracket_11
		cmpa.l     d0,a2
		bls.s      edit_backbracket_11
edit_backbracket_15:
		move.l     a3,d6
		sub.l      (a4),d6
		addq.w     #1,d7
		bra.s      edit_backbracket_6
edit_backbracket_13:
		move.l     a3,d0
		beq.s      edit_backbracket_14
		cmpa.l     d0,a2
		bls.s      edit_backbracket_14
		cmp.l      (a7),d0
		bcc.s      edit_backbracket_15
edit_backbracket_14:
		move.l     (a7),d6
		sub.l      (a4),d6
		subq.w     #1,d7
		bra.s      edit_backbracket_6
edit_backbracket_11:
		subq.l     #1,d5
		subq.w     #8,a4
		move.w     4(a4),d6
		ext.l      d6
edit_backbracket_6:
		tst.w      d7
		bgt        edit_backbracket_16
		move.l     d5,4(a7)
		move.l     d6,8(a7)
		lea.l      4(a7),a1
		movea.l    22(a7),a0
		bsr        edit_setselect
edit_backbracket_10:
		lea.l      26(a7),a7
		movem.l    (a7)+,d3-d7/a2-a5
		rts

edit_click:
		movem.l    d3-d5/a2-a4,-(a7)
		lea.l      -16(a7),a7
		movea.l    a0,a2
		move.w     d0,d5
		move.w     d1,d3
		move.w     d2,d4
		move.w     d1,d0
		bsr        edit_row
		move.l     d0,d3
		lsl.l      #3,d0
		movea.l    44(a2),a3
		adda.l     d0,a3
		moveq.l    #3,d1
		and.w      d4,d1
		beq.s      edit_click_1
		move.l     d3,(a7)
		clr.l      4(a7)
		cmp.l      40(a2),d3
		beq.s      edit_click_2
		moveq.l    #1,d2
		add.l      d3,d2
		move.l     d2,8(a7)
		clr.l      12(a7)
		bra.s      edit_click_3
edit_click_2:
		move.l     d3,8(a7)
		move.w     4(a3),d0
		ext.l      d0
		move.l     d0,12(a7)
edit_click_3:
		lea.l      (a7),a1
		movea.l    a2,a0
		bsr        edit_setselect
		bra        edit_click_4
edit_click_1:
		movea.l    (a3),a4
		move.w     d5,d0
		movea.l    a2,a0
		bsr        edit_col
		move.l     d0,d5
		move.w     4(a3),d1
		ble.s      edit_click_5
		move.w     154(a2),d0
		movea.l    a4,a0
		move.w     d5,d1
		bsr        posv
		move.w     d0,d4
		ext.l      d4
		move.w     4(a3),d0
		ext.l      d0
		cmp.l      d0,d4
		blt.s      edit_click_6
edit_click_5:
		moveq.l    #4,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a1
		and.w      14(a1),d0
		beq        edit_click_4
		moveq.l    #7,d1
		moveq.l    #2,d0
		jsr        Bconout
		bra.w      edit_click_4
edit_click_6:
		move.b     0(a4,d4.l),d5
		move.b     d5,d0
		ext.w      d0
		cmp.w      #0x005B,d0
		beq.s      edit_click_7
		bgt.s      edit_click_8
		sub.w      #0x0028,d0
		beq.s      edit_click_7
		subq.w     #1,d0
		beq.s      edit_click_9
		sub.w      #0x0013,d0
		beq.s      edit_click_7
		subq.w     #2,d0
		beq.s      edit_click_9
		bra.s      edit_click_10
edit_click_8:
		sub.w      #0x005D,d0
		beq.s      edit_click_9
		sub.w      #0x001E,d0
		beq.s      edit_click_7
		subq.w     #2,d0
		beq.s      edit_click_9
		bra.s      edit_click_10
edit_click_7:
		move.b     d5,d2
		move.l     d4,d1
		move.l     d3,d0
		movea.l    a2,a0
		bsr        edit_forbracket
		bra.s      edit_click_4
edit_click_9:
		move.b     d5,d2
		move.l     d4,d1
		move.l     d3,d0
		movea.l    a2,a0
		bsr        edit_backbracket
		bra.s      edit_click_4
edit_click_10:
		move.b     d5,d0
		ext.w      d0
		lea.l      160(a2),a0
		jsr        strchr
		move.l     a0,d0
		bne        edit_click_5
		move.l     d4,d1
		move.l     d3,d0
		movea.l    a2,a0
		bsr        edit_selectword
edit_click_4:
		lea.l      16(a7),a7
		movem.l    (a7)+,d3-d5/a2-a4
		rts

Aus_editor:
		movem.l    a2-a4,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		move.w     608(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    604(a0),a3
		adda.l     d0,a3
		movea.l    12(a3),a0
		movea.l    12(a0),a4
		move.w     112(a4),d2
		cmp.w      #0x0005,d2
		bhi        Aus_editor_1
		add.w      d2,d2
		move.w     J27(pc,d2.w),d2
		jmp        J27(pc,d2.w)
J27:
		dc.w Aus_editor_2-J27
		dc.w Aus_editor_3-J27
		dc.w Aus_editor_4-J27
		dc.w Aus_editor_5-J27
		dc.w Aus_editor_6-J27
		dc.w Aus_editor_7-J27
Aus_editor_3:
		movea.l    (a2),a0
		move.w     612(a0),d0
		movea.l    a4,a0
		bsr        edit_01select
		bra        Aus_editor_1
Aus_editor_4:
		movea.l    (a2),a0
		move.w     612(a0),d0
		movea.l    a4,a0
		bsr        edit_1select
		bra        Aus_editor_1
Aus_editor_5:
		moveq.l    #1,d2
		movea.l    (a2),a0
		move.w     614(a0),d1
		move.w     612(a0),d0
		movea.l    a4,a0
		bsr        edit_nselect
		bra        Aus_editor_1
Aus_editor_6:
		movea.l    (a2),a0
		move.w     612(a0),d0
		movea.l    a4,a0
		bsr        edit_nmselect
		bra        Aus_editor_1
Aus_editor_2:
		suba.l     a1,a1
		move.w     #0x00D5,d0
		movea.l    a3,a0
		bsr        Auo_editor
		move.w     18(a4),d0
		and.w      #0x0200,d0
		bne.s      Aus_editor_8
		ori.w      #0x0200,18(a4)
		move.l     48(a4),56(a4)
		move.l     52(a4),60(a4)
		move.l     64(a4),68(a4)
Aus_editor_8:
		move.w     10(a3),d0
		and.w      #0x4000,d0
		beq.s      Aus_editor_9
		movea.l    (a2),a0
		move.w     614(a0),d2
		move.w     612(a0),d1
		move.w     610(a0),d0
		movea.l    a4,a0
		bsr        edit_click
		bra.s      Aus_editor_10
Aus_editor_9:
		movea.l    (a2),a0
		move.w     614(a0),d2
		move.w     612(a0),d1
		move.w     610(a0),d0
		movea.l    a4,a0
		bsr        edit_charselect
Aus_editor_10:
		move.l     48(a4),d0
		cmp.l      56(a4),d0
		bne.w      Aus_editor_11
		move.l     52(a4),d1
		cmp.l      60(a4),d1
		bne.s      Aus_editor_11
		lsl.l      #3,d0
		movea.l    44(a4),a0
		andi.w     #0xFFFE,6(a0,d0.l)
Aus_editor_14:
		andi.w     #0xFDFF,18(a4)
		bra.s      Aus_editor_12
Aus_editor_7:
		suba.l     a1,a1
		move.w     #0x00D5,d0
		movea.l    a3,a0
		bsr        Auo_editor
		move.w     18(a4),d0
		and.w      #0x0200,d0
		bne.s      Aus_editor_13
		ori.w      #0x0200,18(a4)
		move.l     48(a4),56(a4)
		move.l     52(a4),60(a4)
		move.l     64(a4),68(a4)
Aus_editor_13:
		movea.l    (a2),a0
		move.w     614(a0),d2
		move.w     612(a0),d1
		move.w     610(a0),d0
		movea.l    a4,a0
		bsr        edit_blkselect
		move.l     64(a4),d0
		cmp.l      68(a4),d0
		bne.s      Aus_editor_11
		clr.w      d2
		move.l     56(a4),d1
		move.l     48(a4),d0
		movea.l    a4,a0
		bsr        edit_selrange
		bra.s      Aus_editor_14
Aus_editor_11:
		ori.w      #0x0200,18(a4)
Aus_editor_12:
		suba.l     a1,a1
		move.w     #0x00D6,d0
		movea.l    a3,a0
		bsr        Auo_editor
Aus_editor_1:
		movem.l    (a7)+,a2-a4
		rts

edit_restart:
		move.l     a2,-(a7)
		movea.l    a0,a2
		moveq.l    #8,d0
		jsr        Ax_malloc
		move.l     a0,d0
		bne.s      edit_restart_1
		ori.w      #0x0001,158(a2)
		bra.s      edit_restart_2
edit_restart_1:
		clr.l      (a0)
		clr.w      d0
		move.w     d0,4(a0)
		move.w     d0,6(a0)
		move.l     a0,44(a2)
		move.l     #0x00000001,36(a2)
		moveq.l    #0,d0
		move.l     d0,24(a2)
		move.l     d0,40(a2)
edit_restart_2:
		movea.l    (a7)+,a2
		rts

create:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		subq.w     #2,a7
		movea.l    12(a0),a2
		move.l     #0x000001A2,d0
		jsr        Ax_malloc
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      create_1
		moveq.l    #-1,d0
		bra.s      create_2
create_1:
		move.l     a3,12(a2)
		move.l     #0x000001A2,d0
		lea.l      proto,a1
		movea.l    a3,a0
		jsr        memcpy
		move.w     2(a3),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		move.w     d0,2(a3)
		pea.l      6(a3)
		pea.l      8(a3)
		lea.l      4(a3),a1
		lea.l      8(a7),a0
		movea.l    ACSblk,a2
		move.w     24(a2),d1
		move.w     16(a2),d0
		jsr        vst_height
		addq.w     #8,a7
		move.w     #0x0002,112(a3)
		move.w     #0x0004,154(a3)
		movea.l    a3,a0
		bsr        edit_restart
		clr.w      d0
create_2:
		addq.w     #2,a7
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

cleanup:
		movem.l    d3/a2-a5,-(a7)
		subq.w     #4,a7
		movea.l    a0,a2
		move.w     d0,d3
		movea.l    98(a2),a3
		move.l     a3,d1
		beq.s      cleanup_1
		movea.l    12(a3),a4
		moveq.l    #1,d2
		add.l      40(a2),d2
		move.l     d2,(a7)
		cmp.l      10(a2),d2
		bge.s      cleanup_2
		move.l     10(a2),(a7)
cleanup_2:
		lea.l      (a7),a1
		moveq.l    #100,d0
		movea.l    a3,a0
		movea.l    8(a4),a5
		jsr        (a5)
		lea.l      10(a2),a1
		moveq.l    #101,d0
		movea.l    a3,a0
		movea.l    8(a4),a5
		jsr        (a5)
		lea.l      24(a2),a1
		moveq.l    #17,d0
		movea.l    a3,a0
		movea.l    8(a4),a5
		jsr        (a5)
		tst.w      d3
		beq.s      cleanup_1
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    a3,a0
		movea.l    8(a4),a5
		jsr        (a5)
cleanup_1:
		movea.l    94(a2),a3
		move.l     a3,d0
		beq.s      cleanup_3
		movea.l    12(a3),a4
		lea.l      32(a2),a1
		movea.l    a3,a0
		movea.l    8(a4),a5
		moveq.l    #100,d0
		jsr        (a5)
		lea.l      28(a2),a1
		moveq.l    #17,d0
		movea.l    a3,a0
		movea.l    8(a4),a5
		jsr        (a5)
		lea.l      14(a2),a1
		moveq.l    #101,d0
		movea.l    a3,a0
		movea.l    8(a4),a5
		jsr        (a5)
		tst.w      d3
		beq.s      cleanup_3
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    a3,a0
		movea.l    8(a4),a2
		jsr        (a2)
cleanup_3:
		addq.w     #4,a7
		movem.l    (a7)+,d3/a2-a5
		rts

horizontal:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     d0,(a7)
		movea.l    4(a0),a2
		lea.l      (a7),a1
		movea.l    a2,a0
		move.w     #0x00D9,d0
		bsr        Auo_editor
		suba.l     a1,a1
		move.w     #0x00EF,d0
		movea.l    a2,a0
		bsr        Auo_editor
		lea.l      xcf36c,a0
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

vertical:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     d0,(a7)
		movea.l    4(a0),a2
		lea.l      (a7),a1
		movea.l    a2,a0
		move.w     #0x00DA,d0
		bsr        Auo_editor
		suba.l     a1,a1
		move.w     #0x00EF,d0
		movea.l    a2,a0
		bsr        Auo_editor
		lea.l      xcf36c,a0
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

wwputs:
		movem.l    d3-d4/a2-a5,-(a7)
		movea.l    a1,a5
		clr.w      d3
		move.w     d3,d4
		movea.l    a0,a2
wwputs_8:
		moveq.l    #10,d0
		movea.l    a2,a0
		jsr        strchr
		movea.l    a0,a3
		moveq.l    #13,d0
		movea.l    a2,a0
		jsr        strchr
		movea.l    a0,a4
		move.l     a3,d0
		bne.s      wwputs_1
		move.l     a4,d1
		bne.s      wwputs_1
		movea.l    a2,a1
		movea.l    a5,a0
		bsr        edit_appline
		bra.s      wwputs_2
wwputs_1:
		move.l     a4,d0
		beq.s      wwputs_3
		move.l     a3,d1
		beq.s      wwputs_4
		cmp.l      d0,d1
		bcc.s      wwputs_4
wwputs_3:
		clr.b      (a3)
		movea.l    a2,a1
		movea.l    a5,a0
		bsr        edit_appline
		move.w     d0,d4
		move.b     #0x0A,(a3)
		addq.w     #1,d0
		beq.s      wwputs_5
		movea.l    a5,a0
		bsr        edit_newline
		move.w     d0,d3
wwputs_5:
		lea.l      1(a3),a2
		bra.s      wwputs_6
wwputs_4:
		clr.b      (a4)
		movea.l    a2,a1
		movea.l    a5,a0
		bsr        edit_appline
		move.w     d0,d4
		move.b     #0x0D,(a4)
		lea.l      1(a4),a2
wwputs_6:
		cmp.w      #0xFFFF,d4
		beq.s      wwputs_7
		cmp.w      #0xFFFF,d3
		bne.w      wwputs_8
wwputs_7:
		moveq.l    #-1,d0
wwputs_2:
		movem.l    (a7)+,d3-d4/a2-a5
		rts

uvprintf:
		movem.l    d3/a2-a5,-(a7)
		movea.l    a0,a2
		movea.l    a1,a4
		movea.l    12(a2),a3
		lea.l      buffer,a5
		move.l     24(a7),-(a7)
		movea.l    a4,a1
		movea.l    a5,a0
		jsr        vsprintf
		addq.w     #4,a7
		move.w     d0,d3
		movea.l    a2,a1
		movea.l    a5,a0
		bsr        wwputs
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    a2,a0
		movea.l    8(a3),a4
		jsr        (a4)
		move.w     d3,d0
		movem.l    (a7)+,d3/a2-a5
		rts

	.data

proto:
		dc.w $0001
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0200
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0200
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
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.b ' ',$09,'=+-*/()!&|[]{}<>,.;:'
		dc.w $dd24
		dc.b '%?`',$27,'^#~@',$5c,'"',0
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
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xcf36c:
		dc.b 0
xcf36d:
		dc.b 'Nichts gefunden.',0
xcf37e:
		dc.b 'Keine Klammer.',0
		dc.b $00
