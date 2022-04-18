
	.globl A_cycle
A_cycle:
		move.l     d2,-(a7)
		move.l     a2,-(a7)
		lea.l      -84(a7),a7
		lea.l      xe1db8,a0
		lea.l      12(a7),a1
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		movea.l    96(a7),a0
		move.w     22(a0),d0
		bne.s      A_cycle_1
		movea.l    96(a7),a0
		move.w     24(a0),d0
		beq.s      A_cycle_2
A_cycle_1:
		movea.l    96(a7),a0
		move.w     18(a0),72(a7)
		movea.l    96(a7),a0
		move.w     20(a0),74(a7)
		movea.l    96(a7),a0
		move.w     18(a0),d0
		movea.l    96(a7),a0
		add.w      22(a0),d0
		subq.w     #1,d0
		move.w     d0,76(a7)
		movea.l    96(a7),a0
		move.w     20(a0),d0
		movea.l    96(a7),a0
		add.w      24(a0),d0
		subq.w     #1,d0
		move.w     d0,78(a7)
		lea.l      72(a7),a0
		moveq.l    #1,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		bra.s      A_cycle_3
A_cycle_2:
		lea.l      72(a7),a0
		clr.w      d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
A_cycle_3:
		movea.l    96(a7),a0
		move.w     8(a0),d0
		movea.l    96(a7),a0
		move.w     6(a0),d1
		eor.w      d1,d0
		bne        A_cycle_4
		movea.l    96(a7),a0
		move.w     4(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    96(a7),a0
		movea.l    (a0),a0
		adda.l     d0,a0
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     12(a0),8(a7)
		movea.l    8(a7),a0
		move.l     16(a0),(a7)
		movea.l    96(a7),a0
		move.w     14(a0),d0
		movea.l    ACSblk,a0
		move.w     18(a0),d1
		add.w      d1,d1
		sub.w      d1,d0
		subq.w     #1,d0
		move.w     d0,26(a7)
		movea.l    96(a7),a0
		move.w     10(a0),d0
		move.w     d0,68(a7)
		move.w     d0,56(a7)
		move.w     d0,52(a7)
		move.w     d0,72(a7)
		add.w      26(a7),d0
		move.w     d0,64(a7)
		move.w     d0,60(a7)
		addq.w     #1,d0
		move.w     d0,48(a7)
		move.w     d0,36(a7)
		move.w     d0,32(a7)
		movea.l    ACSblk,a0
		move.w     18(a0),d1
		add.w      d1,d1
		add.w      d1,d0
		move.w     d0,44(a7)
		move.w     d0,40(a7)
		move.w     d0,76(a7)
		movea.l    96(a7),a0
		move.w     12(a0),d0
		move.w     d0,62(a7)
		move.w     d0,42(a7)
		move.w     d0,58(a7)
		move.w     d0,38(a7)
		move.w     d0,74(a7)
		movea.l    96(a7),a0
		add.w      16(a0),d0
		move.w     d0,70(a7)
		move.w     d0,50(a7)
		move.w     d0,66(a7)
		move.w     d0,46(a7)
		move.w     d0,54(a7)
		move.w     d0,34(a7)
		move.w     d0,78(a7)
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vswr_mode
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_width
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_type
		clr.w      d2
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_ends
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_interior
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_perimeter
		movea.l    8(a7),a0
		move.l     4(a0),d0
		and.l      #$00010000,d0
		beq        A_cycle_5
		movea.l    ACSblk,a0
		cmpi.w     #$0004,28(a0)
		blt        A_cycle_5
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0100,d0
		bne        A_cycle_5
		moveq.l    #8,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_color
		lea.l      72(a7),a0
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_bar
		moveq.l    #15,d1
		movea.l    8(a7),a0
		and.w      6(a0),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_color
		lea.l      52(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_pline
		lea.l      32(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_pline
		movea.l    8(a7),a0
		move.l     4(a0),d1
		asr.l      #4,d1
		and.w      #$000F,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_color
		lea.l      60(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_pline
		lea.l      40(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_pline
		bra        A_cycle_6
A_cycle_5:
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_color
		lea.l      72(a7),a0
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_bar
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_color
		lea.l      52(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_pline
		lea.l      64(a7),a0
		moveq.l    #2,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_pline
		move.w     64(a7),d2
		move.w     66(a7),d1
		move.w     62(a7),d0
		jsr        dotted_yline
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_type
		lea.l      36(a7),a0
		moveq.l    #4,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_pline
A_cycle_6:
		movea.l    96(a7),a0
		move.w     16(a0),d0
		movea.l    ACSblk,a0
		sub.w      20(a0),d0
		asr.w      #1,d0
		movea.l    96(a7),a0
		add.w      12(a0),d0
		move.w     d0,30(a7)
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_rotation
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_color
		lea.l      24(a7),a1
		lea.l      24(a7),a0
		moveq.l    #5,d2
		clr.w      d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_alignment
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_effects
		movea.l    ACSblk,a0
		move.w     656(a0),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		pea.l      24(a7)
		pea.l      26(a7)
		lea.l      32(a7),a1
		lea.l      32(a7),a0
		movea.l    ACSblk,a2
		move.w     658(a2),d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_height
		addq.w     #8,a7
		moveq.l    #2,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vswr_mode
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_color
		movea.l    96(a7),a0
		move.w     10(a0),d0
		movea.l    96(a7),a0
		add.w      14(a0),d0
		movea.l    ACSblk,a0
		sub.w      18(a0),d0
		moveq.l    #-2,d1
		movea.l    ACSblk,a0
		add.w      18(a0),d1
		asr.w      #1,d1
		sub.w      d1,d0
		subq.w     #1,d0
		move.w     d0,28(a7)
		movea.l    8(a7),a0
		move.l     4(a0),d0
		asr.l      #8,d0
		move.b     d0,18(a7)
		move.b     18(a7),d0
		beq.s      A_cycle_7
		move.b     18(a7),12(a7)
A_cycle_7:
		lea.l      12(a7),a0
		move.w     30(a7),d2
		move.w     28(a7),d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_gtext
		moveq.l    #32,d0
		movea.l    96(a7),a0
		and.w      8(a0),d0
		beq.s      A_cycle_8
		moveq.l    #1,d0
		movea.l    96(a7),a0
		add.w      10(a0),d0
		move.w     d0,72(a7)
		movea.l    96(a7),a0
		move.w     12(a0),d0
		movea.l    96(a7),a0
		add.w      16(a0),d0
		addq.w     #1,d0
		move.w     d0,74(a7)
		move.w     d0,78(a7)
		movea.l    96(a7),a0
		move.w     10(a0),d0
		movea.l    96(a7),a0
		add.w      14(a0),d0
		addq.w     #1,d0
		move.w     d0,76(a7)
		move.w     d0,80(a7)
		moveq.l    #1,d0
		movea.l    96(a7),a0
		add.w      12(a0),d0
		move.w     d0,82(a7)
		lea.l      72(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_pline
A_cycle_8:
		movea.l    (a7),a0
		move.l     (a0),d0
		beq        A_cycle_4
		moveq.l    #2,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vswr_mode
		movea.l    96(a7),a0
		move.w     14(a0),d0
		ext.l      d0
		movea.l    ACSblk,a0
		divs.w     18(a0),d0
		subq.w     #2,d0
		move.w     d0,20(a7)
		move.w     20(a7),d0
		bpl.s      A_cycle_9
		clr.w      20(a7)
A_cycle_9:
		move.w     20(a7),d0
		ext.l      d0
		move.l     d0,-(a7)
		movea.l    4(a7),a0
		movea.l    (a0),a0
		jsr        strlen
		move.l     (a7)+,d1
		cmp.l      d0,d1
		bcc.s      A_cycle_10
		move.w     20(a7),d0
		movea.l    (a7),a0
		movea.l    (a0),a0
		adda.w     d0,a0
		move.l     a0,14(a7)
		movea.l    14(a7),a0
		move.b     (a0),18(a7)
		movea.l    14(a7),a0
		clr.b      (a0)
		movea.l    (a7),a0
		movea.l    (a0),a0
		move.w     30(a7),d2
		moveq.l    #1,d1
		movea.l    96(a7),a1
		add.w      10(a1),d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_gtext
		movea.l    14(a7),a0
		move.b     18(a7),(a0)
		bra.s      A_cycle_4
A_cycle_10:
		movea.l    (a7),a0
		movea.l    (a0),a0
		move.w     30(a7),d2
		moveq.l    #1,d1
		movea.l    96(a7),a1
		add.w      10(a1),d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_gtext
A_cycle_4:
		lea.l      72(a7),a0
		clr.w      d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		moveq.l    #-18,d0
		movea.l    96(a7),a0
		and.w      8(a0),d0
		lea.l      84(a7),a7
		movea.l    (a7)+,a2
		move.l     (a7)+,d2
		rts

setit:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.l     a1,6(a7)
		movea.l    10(a7),a0
		movea.l    (a0),a0
		jsr        Ax_ifree
		move.l     6(a7),2(a7)
		clr.w      (a7)
		bra.s      set_1
set_2:
		addq.l     #1,2(a7)
		addq.w     #1,(a7)
set_1:
		movea.l    2(a7),a0
		move.b     (a0),d0
		ext.w      d0
		lea.l      xe1dbb,a0
		jsr        strchr
		move.l     a0,d0
		beq.s      set_2
		moveq.l    #1,d0
		add.w      (a7),d0
		ext.l      d0
		jsr        Ax_malloc
		move.l     a0,2(a7)
		move.w     (a7),d0
		ble.s      set_3
		move.w     (a7),d0
		ext.l      d0
		movea.l    6(a7),a1
		movea.l    2(a7),a0
		jsr        strncpy
set_3:
		move.w     (a7),d0
		movea.l    2(a7),a0
		clr.b      0(a0,d0.w)
		movea.l    10(a7),a0
		move.l     2(a7),(a0)
		lea.l      14(a7),a7
		rts

next_entry:
		subq.w     #4,a7
		move.l     a0,(a7)
		bra.s      next_entry_1
next_entry_6:
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      next_entry_2
		bra.s      next_entry_3
next_entry_2:
		movea.l    (a7),a0
		cmpi.b     #$5D,(a0)
		bne.s      next_entry_4
		addq.l     #1,(a7)
		movea.l    (a7),a0
		cmpi.b     #$7C,(a0)
		beq.s      next_entry_4
		bra.s      next_entry_3
next_entry_4:
		movea.l    (a7),a0
		cmpi.b     #$7C,(a0)
		bne.s      next_entry_5
		addq.l     #1,(a7)
		bra.s      next_entry_3
next_entry_5:
		addq.l     #1,(a7)
next_entry_1:
		bra.s      next_entry_6
next_entry_3:
		movea.l    (a7),a0
		addq.w     #4,a7
		rts

next:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		movea.l    4(a0),a0
		bsr.w      next_entry
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      next_1
		movea.l    4(a7),a0
		move.l     8(a0),(a7)
next_1:
		bra.s      next_2
next_3:
		movea.l    (a7),a0
		bsr.w      next_entry
		move.l     a0,(a7)
next_2:
		movea.l    (a7),a0
		cmpi.b     #$5B,(a0)
		beq.s      next_3
		movea.l    4(a7),a0
		move.l     (a7),4(a0)
		movea.l    (a7),a1
		movea.l    4(a7),a0
		bsr        setit
		addq.w     #8,a7
		rts

make_popup:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		clr.l      (a0)
		movea.l    (a7),a0
		move.l     #xe1dbe,4(a0)
		movea.l    (a7),a0
		bsr.w      next
		addq.w     #4,a7
		rts

cyc_getindex:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		movea.l    12(a7),a0
		movea.l    (a0),a0
		jsr        strlen
		move.w     d0,4(a7)
		movea.l    12(a7),a0
		move.l     8(a0),(a7)
		clr.w      6(a7)
		bra.s      cyc_getindex_1
cyc_getindex_7:
		movea.l    (a7),a0
		cmpi.b     #$5B,(a0)
		beq.s      cyc_getindex_2
		move.w     4(a7),d0
		ext.l      d0
		movea.l    (a7),a1
		movea.l    12(a7),a0
		movea.l    (a0),a0
		jsr        strncmp
		tst.w      d0
		bne.s      cyc_getindex_3
		move.w     4(a7),d0
		movea.l    (a7),a0
		move.b     0(a0,d0.w),d0
		beq.s      cyc_getindex_4
		move.w     4(a7),d0
		movea.l    (a7),a0
		cmpi.b     #$7C,0(a0,d0.w)
		bne.s      cyc_getindex_3
cyc_getindex_4:
		movea.l    8(a7),a0
		move.w     6(a7),(a0)
		bra.s      cyc_getindex_5
cyc_getindex_3:
		addq.w     #1,6(a7)
cyc_getindex_2:
		moveq.l    #124,d0
		movea.l    (a7),a0
		jsr        strchr
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      cyc_getindex_6
		movea.l    8(a7),a0
		move.w     #$FFFF,(a0)
		bra.s      cyc_getindex_5
cyc_getindex_6:
		addq.l     #1,(a7)
cyc_getindex_1:
		bra.s      cyc_getindex_7
cyc_getindex_5:
		lea.l      16(a7),a7
		rts

cyc_index:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.l     a1,2(a7)
		moveq.l    #1,d0
		movea.l    2(a7),a0
		add.w      (a0),d0
		move.w     d0,(a7)
		movea.l    6(a7),a0
		move.l     #xe1dbf,4(a0)
		bra.s      cyc_index_1
cyc_index_2:
		movea.l    6(a7),a0
		bsr        next
cyc_index_1:
		move.w     (a7),d0
		subq.w     #1,(a7)
		tst.w      d0
		bgt.s      cyc_index_2
		lea.l      10(a7),a7
		rts

	.globl Auo_cycle
Auo_cycle:
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		move.w     d0,20(a7)
		move.l     a1,16(a7)
		movea.l    22(a7),a0
		move.l     12(a0),4(a7)
		movea.l    4(a7),a0
		move.l     16(a0),(a7)
		move.w     20(a7),d0
		cmp.w      #$0009,d0
		beq        Auo_cycle_1
		bgt.s      Auo_cycle_2
		cmp.w      #$0006,d0
		bhi        Auo_cycle_3
		add.w      d0,d0
		move.w     J52(pc,d0.w),d0
		jmp        J52(pc,d0.w)
J52:
		dc.w Auo_cycle_3-J52
		dc.w Auo_cycle_4-J52
		dc.w Auo_cycle_5-J52
		dc.w Auo_cycle_6-J52
		dc.w Auo_cycle_7-J52
		dc.w Auo_cycle_8-J52
		dc.w Auo_cycle_8-J52
Auo_cycle_2:
		cmp.w      #$0190,d0
		beq        Auo_cycle_90
		bgt.s      Auo_cycle_91
		sub.w      #$0013,d0
		beq        Auo_cycle_15
		subq.w     #1,d0
		beq        Auo_cycle_15
		bra        Auo_cycle_3
Auo_cycle_91:
		sub.w      #$0191,d0
		beq        Auo_cycle_16
		subq.w     #1,d0
		beq        Auo_cycle_17
		bra        Auo_cycle_3
Auo_cycle_4:
		moveq.l    #22,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Auo_cycle_18
		moveq.l    #22,d1
		clr.w      d0
		movea.l    (a7),a0
		jsr        memset
		movea.l    4(a7),a0
		move.l     12(a0),d0
		beq.s      Auo_cycle_19
		movea.l    4(a7),a0
		movea.l    12(a0),a0
		jsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,8(a1)
		bra.s      Auo_cycle_20
Auo_cycle_19:
		lea.l      xe1dc0,a0
		jsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,8(a1)
Auo_cycle_20:
		movea.l    (a7),a0
		move.l     8(a0),d0
		beq.s      Auo_cycle_21
		movea.l    4(a7),a0
		move.l     (a7),16(a0)
		movea.l    (a7),a0
		bsr        make_popup
		bra.s      Auo_cycle_22
Auo_cycle_21:
		movea.l    16(a7),a0
		move.w     #$FFFF,(a0)
Auo_cycle_22:
		bra.s      Auo_cycle_23
Auo_cycle_18:
		movea.l    16(a7),a0
		move.w     #$FFFF,(a0)
Auo_cycle_23:
		bra        Auo_cycle_24
Auo_cycle_5:
		movea.l    (a7),a0
		move.l     8(a0),d0
		beq.s      Auo_cycle_25
		movea.l    (a7),a0
		movea.l    8(a0),a0
		jsr        Ast_delete
Auo_cycle_25:
		movea.l    (a7),a0
		move.l     (a0),d0
		beq.s      Auo_cycle_26
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        Ax_free
Auo_cycle_26:
		movea.l    4(a7),a0
		movea.l    16(a0),a0
		jsr        Ax_free
		bra        Auo_cycle_24
Auo_cycle_7:
		movea.l    16(a7),a1
		movea.l    (a7),a0
		bsr        setit
		bra        Auo_cycle_24
Auo_cycle_1:
		move.l     16(a7),12(a7)
		movea.l    12(a7),a0
		movea.l    (a7),a1
		move.l     (a0),12(a1)
		movea.l    12(a7),a0
		movea.l    (a7),a1
		move.l     4(a0),16(a1)
		movea.l    12(a7),a0
		movea.l    (a7),a1
		move.w     8(a0),20(a1)
		bra        Auo_cycle_24
Auo_cycle_6:
		movea.l    (a7),a0
		movea.l    16(a7),a1
		move.l     (a0),(a1)
		bra        Auo_cycle_24
Auo_cycle_8:
		movea.l    (a7),a0
		move.l     12(a0),8(a7)
		move.l     8(a7),d0
		bne.s      Auo_cycle_27
		bra.w      Auo_cycle_24
Auo_cycle_27:
		moveq.l    #-1,d1
		movea.l    (a7),a0
		move.w     20(a0),d0
		movea.l    8(a7),a0
		movea.l    8(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
		bra.s      Auo_cycle_24
Auo_cycle_16:
		movea.l    16(a7),a1
Auo_cycle_12:
		movea.l    (a7),a0
		bsr        cyc_index
		bra.s      Auo_cycle_24
Auo_cycle_17:
		movea.l    16(a7),a1
		movea.l    (a7),a0
		bsr        cyc_getindex
		bra.s      Auo_cycle_24
Auo_cycle_90:
		movea.l    (a7),a0
		movea.l    8(a0),a0
		jsr        Ax_free
		movea.l    16(a7),a0
		jsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,8(a1)
Auo_cycle_10:
		movea.l    (a7),a0
		move.l     8(a0),d0
		bne.s      Auo_cycle_28
		lea.l      xe1dc1,a0
		jsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,8(a1)
Auo_cycle_28:
		movea.l    (a7),a0
		bsr        make_popup
		bra.s      Auo_cycle_24
Auo_cycle_15:
		bra.s      Auo_cycle_24
Auo_cycle_3:
		clr.w      d0
		bra.s      Auo_cycle_29
Auo_cycle_24:
		moveq.l    #1,d0
Auo_cycle_29:
		lea.l      26(a7),a7
		rts
Auo_cycle_11:
Auo_cycle_13:

count_it:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		move.l     8(a7),(a7)
		movea.l    4(a7),a0
		move.w     #$0001,(a0)
		bra.s      count_it_1
count_it_4:
		movea.l    (a7),a0
		cmpi.b     #$7C,(a0)
		bne.s      count_it_2
		movea.l    4(a7),a0
		addq.w     #1,(a0)
count_it_2:
		movea.l    (a7),a0
		cmpi.b     #$5D,(a0)
		bne.s      count_it_3
		movea.l    (a7),a0
		cmpi.b     #$7C,1(a0)
		beq.s      count_it_3
		movea.l    4(a7),a0
		addq.w     #1,(a0)
count_it_3:
		addq.l     #1,(a7)
count_it_1:
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      count_it_4
		move.l     8(a7),(a7)
		moveq.l    #1,d0
		movea.l    4(a7),a0
		add.w      (a0),d0
		movea.l    16(a7),a0
		move.w     d0,(a0)
		bra.s      count_it_5
count_it_7:
		movea.l    (a7),a0
		cmpi.b     #$5B,(a0)
		bne.s      count_it_6
		movea.l    16(a7),a0
		addq.w     #1,(a0)
count_it_6:
		addq.l     #1,(a7)
count_it_5:
		movea.l    (a7),a0
		move.b     (a0),d0
		bne.s      count_it_7
		lea.l      12(a7),a7
		rts

make_panel:
		lea.l      -38(a7),a7
		move.l     a0,34(a7)
		move.l     a1,30(a7)
		move.w     d0,28(a7)
		move.w     d1,26(a7)
		move.w     d2,24(a7)
		movea.l    30(a7),a0
		move.w     (a0),10(a7)
		move.w     10(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    34(a7),a0
		adda.l     d0,a0
		move.l     a0,20(a7)
		moveq.l    #-1,d0
		add.w      10(a7),d0
		movea.l    20(a7),a0
		move.w     d0,(a0)
		moveq.l    #1,d0
		add.w      10(a7),d0
		movea.l    20(a7),a0
		move.w     d0,2(a0)
		movea.l    20(a7),a0
		move.w     #$0014,6(a0)
		movea.l    20(a7),a0
		move.w     #$0080,8(a0)
		movea.l    20(a7),a0
		move.w     #$0020,10(a0)
		movea.l    20(a7),a0
		move.l     #$00FF1001,12(a0)
		clr.w      d0
		movea.l    20(a7),a0
		move.w     d0,18(a0)
		movea.l    20(a7),a0
		move.w     d0,16(a0)
		movea.l    20(a7),a0
		move.w     28(a7),20(a0)
		clr.w      6(a7)
		movea.l    30(a7),a0
		addq.w     #1,(a0)
		clr.w      (a7)
		bra        make_panel_1
make_panel_22:
		movea.l    30(a7),a0
		move.w     (a0),8(a7)
		move.w     8(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    34(a7),a0
		adda.l     d0,a0
		move.l     a0,16(a7)
		movea.l    30(a7),a0
		addq.w     #1,(a0)
		movea.l    42(a7),a0
		movea.l    (a0),a0
		cmpi.b     #$5B,(a0)
		bne.s      make_panel_2
		movea.l    30(a7),a0
		move.w     (a0),d0
		movea.l    16(a7),a0
		move.w     d0,4(a0)
		movea.l    16(a7),a0
		move.w     d0,2(a0)
		move.w     24(a7),d0
		beq.s      make_panel_3
		movea.l    16(a7),a0
		move.w     #$0018,6(a0)
		bra.s      make_panel_4
make_panel_3:
		movea.l    16(a7),a0
		move.w     #$0020,6(a0)
make_panel_4:
		move.w     #$0001,2(a7)
		movea.l    42(a7),a0
		addq.l     #1,(a0)
		bra.s      make_panel_5
make_panel_2:
		moveq.l    #-1,d0
		movea.l    16(a7),a0
		move.w     d0,4(a0)
		movea.l    16(a7),a0
		move.w     d0,2(a0)
		move.w     24(a7),d0
		beq.s      make_panel_6
		movea.l    16(a7),a0
		move.w     #$0018,6(a0)
		bra.s      make_panel_7
make_panel_6:
		movea.l    16(a7),a0
		move.w     #$001C,6(a0)
make_panel_7:
		clr.w      2(a7)
make_panel_5:
		movea.l    42(a7),a0
		movea.l    (a0),a0
		cmpa.l     54(a7),a0
		bne.s      make_panel_8
		movea.l    16(a7),a0
		move.w     #$0004,10(a0)
		bra.s      make_panel_9
make_panel_8:
		movea.l    16(a7),a0
		clr.w      10(a0)
make_panel_9:
		movea.l    46(a7),a0
		move.l     (a0),12(a7)
		move.w     24(a7),d0
		beq.s      make_panel_10
		movea.l    50(a7),a0
		movea.l    16(a7),a1
		move.l     (a0),12(a1)
		moveq.l    #32,d0
		lea.l      a3dproto,a1
		movea.l    50(a7),a0
		movea.l    (a0),a0
		jsr        memcpy
		movea.l    50(a7),a0
		movea.l    (a0),a0
		move.l     12(a7),12(a0)
		movea.l    50(a7),a0
		addi.l     #$00000020,(a0)
		bra.s      make_panel_11
make_panel_10:
		movea.l    16(a7),a0
		move.l     12(a7),12(a0)
make_panel_11:
		move.w     26(a7),d0
		ext.l      d0
		movea.l    46(a7),a0
		add.l      d0,(a0)
		moveq.l    #32,d0
		movea.l    12(a7),a0
		move.b     d0,1(a0)
		movea.l    12(a7),a0
		move.b     d0,(a0)
		addq.l     #2,12(a7)
		moveq.l    #-3,d0
		add.w      26(a7),d0
		move.w     d0,4(a7)
		bra.s      make_panel_12
make_panel_17:
		movea.l    42(a7),a0
		movea.l    (a0),a0
		cmpi.b     #$5D,(a0)
		bne.s      make_panel_13
		move.w     #$0001,(a7)
		movea.l    42(a7),a0
		movea.l    (a0),a0
		cmpi.b     #$7C,1(a0)
		bne.s      make_panel_14
		movea.l    42(a7),a0
		addq.l     #1,(a0)
make_panel_14:
		bra.s      make_panel_15
make_panel_13:
		move.w     4(a7),d0
		ble.s      make_panel_16
		movea.l    42(a7),a0
		movea.l    (a0),a0
		movea.l    12(a7),a1
		move.b     (a0),(a1)
		addq.l     #1,12(a7)
		subq.w     #1,4(a7)
make_panel_16:
		movea.l    42(a7),a0
		addq.l     #1,(a0)
make_panel_12:
		movea.l    42(a7),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		beq.s      make_panel_15
		movea.l    42(a7),a0
		movea.l    (a0),a0
		cmpi.b     #$7C,(a0)
		bne.s      make_panel_17
make_panel_15:
		movea.l    12(a7),a0
		clr.b      (a0)
		movea.l    42(a7),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		beq.s      make_panel_18
		movea.l    42(a7),a0
		addq.l     #1,(a0)
make_panel_18:
		move.w     2(a7),d0
		beq.s      make_panel_19
		move.l     54(a7),-(a7)
		move.l     54(a7),-(a7)
		move.l     54(a7),-(a7)
		move.l     54(a7),-(a7)
		move.w     40(a7),d2
		move.w     42(a7),d1
		move.w     44(a7),d0
		movea.l    46(a7),a1
		movea.l    50(a7),a0
		bsr        make_panel
		lea.l      16(a7),a7
make_panel_19:
		movea.l    16(a7),a0
		move.w     #$0001,8(a0)
		move.w     6(a7),d0
		movea.l    ACSblk,a0
		muls.w     20(a0),d0
		movea.l    16(a7),a0
		move.w     d0,18(a0)
		movea.l    ACSblk,a0
		movea.l    16(a7),a1
		move.w     20(a0),22(a1)
		movea.l    16(a7),a0
		clr.w      16(a0)
		movea.l    16(a7),a0
		move.w     28(a7),20(a0)
		movea.l    30(a7),a0
		movea.l    16(a7),a1
		move.w     (a0),(a1)
		addq.w     #1,6(a7)
		move.w     (a7),d0
		bne.s      make_panel_1
		movea.l    42(a7),a0
		movea.l    (a0),a0
		cmpi.b     #$5D,(a0)
		bne.s      make_panel_1
		movea.l    42(a7),a0
		movea.l    (a0),a0
		cmpi.b     #$7C,1(a0)
		bne.s      make_panel_20
		movea.l    42(a7),a0
		addq.l     #1,(a0)
make_panel_20:
		movea.l    42(a7),a0
		addq.l     #1,(a0)
		bra.s      make_panel_21
make_panel_1:
		movea.l    42(a7),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		beq.s      make_panel_21
		move.w     (a7),d0
		beq        make_panel_22
make_panel_21:
		movea.l    16(a7),a0
		move.w     10(a7),(a0)
		movea.l    ACSblk,a0
		move.w     20(a0),d0
		muls.w     6(a7),d0
		movea.l    20(a7),a0
		move.w     d0,22(a0)
		movea.l    20(a7),a0
		move.w     8(a7),4(a0)
		lea.l      38(a7),a7
		rts

create_popup:
		lea.l      -36(a7),a7
		move.l     a0,32(a7)
		move.l     a1,28(a7)
		move.w     d0,26(a7)
		move.w     d1,24(a7)
		pea.l      14(a7)
		lea.l      20(a7),a1
		movea.l    36(a7),a0
		bsr        count_it
		addq.w     #4,a7
		move.w     26(a7),d0
		movea.l    ACSblk,a0
		add.w      18(a0),d0
		subq.w     #1,d0
		ext.l      d0
		movea.l    ACSblk,a0
		divs.w     18(a0),d0
		move.w     d0,18(a7)
		move.w     18(a7),d0
		bpl.s      create_popup_1
		clr.w      18(a7)
create_popup_1:
		addq.w     #3,18(a7)
		move.w     24(a7),d0
		beq.s      create_popup_2
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		move.w     16(a7),d1
		muls.w     18(a7),d1
		ext.l      d1
		add.l      d1,d0
		move.w     16(a7),d1
		ext.l      d1
		lsl.l      #5,d1
		add.l      d1,d0
		jsr        Ax_malloc
		move.l     a0,20(a7)
		bra.s      create_popup_3
create_popup_2:
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		move.w     16(a7),d1
		muls.w     18(a7),d1
		ext.l      d1
		add.l      d1,d0
		jsr        Ax_malloc
		move.l     a0,20(a7)
create_popup_3:
		move.l     20(a7),d0
		bne.s      create_popup_4
		suba.l     a0,a0
		bra        create_popup_5
create_popup_4:
		clr.w      12(a7)
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    20(a7),a0
		adda.l     d0,a0
		move.l     a0,4(a7)
		move.w     16(a7),d0
		muls.w     18(a7),d0
		movea.l    4(a7),a0
		adda.w     d0,a0
		move.l     a0,(a7)
		move.l     32(a7),8(a7)
		move.l     28(a7),-(a7)
		pea.l      4(a7)
		pea.l      12(a7)
		pea.l      20(a7)
		move.w     40(a7),d2
		move.w     34(a7),d1
		move.w     42(a7),d0
		lea.l      28(a7),a1
		movea.l    36(a7),a0
		bsr        make_panel
		lea.l      16(a7),a7
		movea.l    20(a7),a0
		move.w     #$FFFF,(a0)
		movea.l    20(a7),a0
		andi.w     #$FF7F,8(a0)
		movea.l    20(a7),a0
		ori.w      #$8000,10(a0)
		move.w     12(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    20(a7),a0
		ori.w      #$0020,-16(a0,d0.l)
		movea.l    20(a7),a0
create_popup_5:
		lea.l      36(a7),a7
		rts

	.globl Ame_strpopup
Ame_strpopup:
		lea.l      -34(a7),a7
		move.l     a0,30(a7)
		move.l     a1,26(a7)
		move.w     d0,24(a7)
		move.w     d1,22(a7)
		move.w     d2,20(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0100,d0
		bne.s      Ame_strpopup_1
		movea.l    ACSblk,a0
		cmpi.w     #$0004,28(a0)
		blt.s      Ame_strpopup_1
		moveq.l    #1,d0
		bra.s      Ame_strpopup_2
Ame_strpopup_1:
		clr.w      d0
Ame_strpopup_2:
		move.w     d0,12(a7)
		move.w     12(a7),d1
		move.w     24(a7),d0
		movea.l    38(a7),a1
		movea.l    26(a7),a0
		bsr        create_popup
		move.l     a0,16(a7)
		move.l     16(a7),d0
		beq        Ame_strpopup_3
		move.w     20(a7),d1
		move.w     22(a7),d0
		movea.l    16(a7),a1
		movea.l    30(a7),a0
		jsr        Ame_popup
		move.w     d0,14(a7)
		move.w     14(a7),d0
		bmi        Ame_strpopup_4
		move.w     12(a7),d0
		beq.s      Ame_strpopup_5
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		movea.l    12(a0,d0.l),a0
		movea.l    12(a0),a0
		addq.w     #2,a0
		move.l     a0,4(a7)
		bra.s      Ame_strpopup_6
Ame_strpopup_5:
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		movea.l    12(a0,d0.l),a0
		addq.w     #2,a0
		move.l     a0,4(a7)
Ame_strpopup_6:
		movea.l    4(a7),a0
		jsr        strlen
		move.l     d0,(a7)
		movea.l    4(a7),a1
		movea.l    26(a7),a0
		jsr        strstr
		move.l     a0,8(a7)
		bra.s      Ame_strpopup_7
Ame_strpopup_8:
		movea.l    4(a7),a1
		movea.l    8(a7),a0
		addq.w     #1,a0
		jsr        strstr
		move.l     a0,8(a7)
Ame_strpopup_7:
		move.l     (a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.l),d0
		ext.w      d0
		lea.l      xe1dc2,a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Ame_strpopup_8
		bra.s      Ame_strpopup_9
Ame_strpopup_4:
		clr.l      8(a7)
Ame_strpopup_9:
		movea.l    16(a7),a0
		jsr        Ax_free
		movea.l    8(a7),a0
		bra.s      Ame_strpopup_10
Ame_strpopup_3:
		suba.l     a0,a0
Ame_strpopup_10:
		lea.l      34(a7),a7
		rts

	.globl Aus_cycle
Aus_cycle:
		move.l     a2,-(a7)
		lea.l      -42(a7),a7
		movea.l    ACSblk,a0
		move.l     604(a0),28(a7)
		movea.l    ACSblk,a0
		move.w     608(a0),(a7)
		move.l     _globl,-(a7)
		pea.l      12(a7)
		lea.l      18(a7),a1
		move.w     8(a7),d0
		movea.l    36(a7),a0
		jsr        mt_objc_offset
		addq.w     #8,a7
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    28(a7),a0
		adda.l     d0,a0
		move.l     a0,24(a7)
		movea.l    24(a7),a0
		move.l     12(a0),16(a7)
		movea.l    24(a7),a0
		move.w     20(a0),2(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.w     52(a0),d0
		add.w      d0,10(a7)
		move.w     10(a7),d0
		add.w      2(a7),d0
		move.w     d0,6(a7)
		move.w     6(a7),d0
		movea.l    ACSblk,a0
		move.w     18(a0),d1
		add.w      d1,d1
		sub.w      d1,d0
		move.w     d0,4(a7)
		movea.l    16(a7),a0
		move.l     16(a0),12(a7)
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		cmp.w      4(a7),d0
		blt.s      Aus_cycle_1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		cmp.w      6(a7),d0
		bge.s      Aus_cycle_1
		movea.l    12(a7),a0
		bsr        next
		bra        Aus_cycle_2
Aus_cycle_1:
		movea.l    24(a7),a0
		move.w     22(a0),d0
		movea.l    ACSblk,a0
		sub.w      20(a0),d0
		asr.w      #1,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		add.w      54(a0),d0
		add.w      d0,8(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),6(a7)
		move.l     a3dproto+4,d0
		and.l      #$F0FF0FFF,d0
		moveq.l    #15,d1
		movea.l    16(a7),a0
		and.l      4(a0),d1
		moveq.l    #12,d2
		lsl.l      d2,d1
		or.l       d1,d0
		movea.l    16(a7),a0
		move.l     4(a0),d1
		and.l      #$000000F0,d1
		moveq.l    #20,d2
		lsl.l      d2,d1
		or.l       d1,d0
		move.l     d0,a3dproto+4
		movea.l    16(a7),a0
		move.l     4(a0),d0
		and.l      #$00010000,d0
		bne.s      Aus_cycle_3
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		ori.w      #$0100,14(a0)
Aus_cycle_3:
		movea.l    12(a7),a0
		move.l     4(a0),-(a7)
		move.w     12(a7),d2
		move.w     14(a7),d1
		move.w     6(a7),d0
		movea.l    16(a7),a0
		movea.l    8(a0),a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		bsr        Ame_strpopup
		addq.w     #4,a7
		move.l     a0,20(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     6(a7),14(a0)
		move.l     #$09F10178,a3dproto+4
		move.l     20(a7),d0
		beq.s      Aus_cycle_2
		movea.l    12(a7),a0
		move.l     20(a7),4(a0)
		movea.l    20(a7),a1
		movea.l    12(a7),a0
		bsr        setit
Aus_cycle_2:
		movea.l    ACSblk,a0
		move.l     600(a0),32(a7)
		move.l     24(a7),36(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    24(a0),a0
		movea.l    ACSblk,a1
		cmpa.l     604(a1),a0
		bne.s      Aus_cycle_4
		move.w     (a7),d0
		or.w       #$1000,d0
		move.w     d0,40(a7)
		bra.s      Aus_cycle_5
Aus_cycle_4:
		move.w     (a7),40(a7)
Aus_cycle_5:
		lea.l      32(a7),a1
		moveq.l    #9,d0
		movea.l    24(a7),a0
		movea.l    16(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    24(a7),a0
		movea.l    16(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		lea.l      42(a7),a7
		movea.l    (a7)+,a2
		rts

	.data

a3dproto:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l xe1dba
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe1db8:
		dc.b $02,0
xe1dba:
		dc.b 0
xe1dbb:
		dc.b $7c
		dc.w $5d00
xe1dbe:
		dc.b 0
xe1dbf:
		dc.b 0
xe1dc0:
		dc.b 0
xe1dc1:
		dc.b 0
xe1dc2:
		dc.b '[]|',0
		.even
