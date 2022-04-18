	.globl A_ftext
A_ftext:
		move.l     d2,-(a7)
		move.l     a2,-(a7)
		lea.l      -108(a7),a7
		clr.l      38(a7)
		movea.l    120(a7),a0
		move.w     4(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    120(a7),a0
		movea.l    (a0),a0
		adda.l     d0,a0
		move.l     a0,64(a7)
		movea.l    64(a7),a0
		move.l     12(a0),68(a7)
		movea.l    68(a7),a0
		move.l     4(a0),d0
		moveq.l    #16,d1
		asr.l      d1,d0
		move.w     d0,82(a7)
		movea.l    68(a7),a0
		movea.l    12(a0),a0
		move.l     a0,46(a7)
		jsr        strlen
		move.w     d0,60(a7)
		move.w     60(a7),d0
		movea.l    46(a7),a0
		adda.w     d0,a0
		move.l     a0,26(a7)
		movea.l    68(a7),a0
		move.l     16(a0),(a7)
		movea.l    68(a7),a0
		move.l     4(a0),d0
		asr.l      #8,d0
		and.w      #$003F,d0
		move.w     d0,74(a7)
		movea.l    68(a7),a0
		move.l     4(a0),d0
		moveq.l    #14,d1
		asr.l      d1,d0
		and.w      #$0003,d0
		move.w     d0,72(a7)
		movea.l    120(a7),a0
		move.w     12(a0),d0
		movea.l    120(a7),a0
		add.w      16(a0),d0
		subq.w     #1,d0
		move.w     d0,56(a7)
		movea.l    120(a7),a0
		move.w     22(a0),d0
		bne.s      A_ftext_1
		movea.l    120(a7),a0
		move.w     24(a0),d0
		bne.s      A_ftext_1
		movea.l    ACSblk,a0
		move.w     8(a0),100(a7)
		movea.l    ACSblk,a0
		move.w     10(a0),102(a7)
		movea.l    ACSblk,a0
		move.w     12(a0),104(a7)
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		movea.l    ACSblk,a0
		add.w      14(a0),d0
		move.w     d0,106(a7)
		bra.s      A_ftext_2
A_ftext_1:
		movea.l    120(a7),a0
		move.w     18(a0),100(a7)
		movea.l    120(a7),a0
		move.w     20(a0),102(a7)
		movea.l    120(a7),a0
		move.w     22(a0),104(a7)
		movea.l    120(a7),a0
		move.w     24(a0),106(a7)
A_ftext_2:
		moveq.l    #-1,d0
		add.w      100(a7),d0
		add.w      d0,104(a7)
		moveq.l    #-1,d0
		add.w      102(a7),d0
		add.w      d0,106(a7)
		move.w     106(a7),d0
		cmp.w      56(a7),d0
		ble.s      A_ftext_3
		move.w     56(a7),106(a7)
A_ftext_3:
		move.w     106(a7),d0
		cmp.w      102(a7),d0
		bge.s      A_ftext_4
		moveq.l    #-2,d0
		movea.l    120(a7),a0
		and.w      8(a0),d0
		bra        A_ftext_5
A_ftext_4:
		lea.l      100(a7),a0
		moveq.l    #1,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		moveq.l    #2,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vswr_mode
		move.w     82(a7),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_rotation
		move.w     74(a7),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_effects
		movea.l    120(a7),a0
		move.w     12(a0),58(a7)
		movea.l    68(a7),a0
		move.w     6(a0),d0
		and.w      #$00FF,d0
		move.w     d0,80(a7)
		bne.s      A_ftext_6
		movea.l    ACSblk,a0
		move.w     24(a0),80(a7)
A_ftext_6:
		pea.l      80(a7)
		pea.l      82(a7)
		lea.l      84(a7),a1
		lea.l      84(a7),a0
		move.w     88(a7),d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_height
		addq.w     #8,a7
		movea.l    (a7),a0
		move.w     (a0),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_color
		pea.l      84(a7)
		pea.l      80(a7)
		pea.l      98(a7)
		lea.l      88(a7),a1
		lea.l      88(a7),a0
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vqt_fontinfo
		lea.l      12(a7),a7
		move.w     84(a7),d0
		add.w      d0,78(a7)
		move.w     84(a7),d0
		add.w      d0,80(a7)
		movea.l    120(a7),a0
		move.w     10(a0),54(a7)
		movea.l    120(a7),a0
		move.w     14(a0),52(a7)
		move.w     72(a7),d0
		tst.w      d0
		beq.s      A_ftext_7
		subq.w     #1,d0
		beq.s      A_ftext_8
		subq.w     #1,d0
		beq.s      A_ftext_9
		subq.w     #1,d0
		beq        A_ftext_10
		bra        A_ftext_11
A_ftext_8:
		move.w     86(a7),d0
		add.w      d0,54(a7)
		lea.l      76(a7),a1
		lea.l      76(a7),a0
		moveq.l    #5,d2
		clr.w      d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_alignment
		bra        A_ftext_11
A_ftext_7:
		movea.l    120(a7),a0
		move.w     14(a0),d0
		asr.w      #1,d0
		addq.w     #1,d0
		add.w      d0,54(a7)
		lea.l      76(a7),a1
		lea.l      76(a7),a0
		moveq.l    #5,d2
		moveq.l    #1,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_alignment
		bra.s      A_ftext_11
A_ftext_9:
		movea.l    120(a7),a0
		move.w     14(a0),d0
		sub.w      88(a7),d0
		add.w      d0,54(a7)
		moveq.l    #16,d0
		and.w      74(a7),d0
		beq.s      A_ftext_12
		subq.w     #2,54(a7)
A_ftext_12:
		lea.l      76(a7),a1
		lea.l      76(a7),a0
		moveq.l    #5,d2
		moveq.l    #2,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_alignment
		bra.s      A_ftext_11
A_ftext_10:
		lea.l      76(a7),a1
		lea.l      76(a7),a0
		moveq.l    #5,d2
		clr.w      d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_alignment
		nop
A_ftext_11:
		move.w     52(a7),d0
		sub.w      86(a7),d0
		sub.w      88(a7),d0
		move.w     d0,50(a7)
		move.w     78(a7),d0
		bgt.s      A_ftext_13
		move.w     #$0001,78(a7)
A_ftext_13:
		move.w     50(a7),d0
		ext.l      d0
		divs.w     78(a7),d0
		move.w     d0,62(a7)
		cmpi.w     #$0001,62(a7)
		bge.s      A_ftext_14
		moveq.l    #-2,d0
		movea.l    120(a7),a0
		and.w      8(a0),d0
		bra        A_ftext_5
A_ftext_14:
		move.l     46(a7),34(a7)
A_ftext_36:
		moveq.l    #124,d0
		movea.l    34(a7),a0
		jsr        strchr
		move.l     a0,42(a7)
		move.w     62(a7),d0
		movea.l    34(a7),a0
		adda.w     d0,a0
		move.l     a0,30(a7)
		move.l     42(a7),d0
		beq.s      A_ftext_15
		movea.l    42(a7),a0
		cmpa.l     30(a7),a0
		bcc.s      A_ftext_15
		move.l     42(a7),30(a7)
		movea.l    42(a7),a0
		addq.w     #1,a0
		move.l     a0,38(a7)
		bra        A_ftext_16
A_ftext_15:
		movea.l    26(a7),a0
		cmpa.l     30(a7),a0
		bls.w      A_ftext_17
		clr.w      82(a7)
A_ftext_22:
		move.l     42(a7),d0
		beq.s      A_ftext_18
		movea.l    30(a7),a0
		cmpa.l     42(a7),a0
		bcs.s      A_ftext_18
		bra.s      A_ftext_17
A_ftext_18:
		movea.l    30(a7),a0
		move.b     (a0),20(a7)
		movea.l    30(a7),a0
		clr.b      (a0)
		lea.l      4(a7),a1
		movea.l    34(a7),a0
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vqt_extent
		movea.l    30(a7),a0
		move.b     20(a7),(a0)
		move.w     8(a7),d0
		sub.w      4(a7),d0
		cmp.w      50(a7),d0
		ble.s      A_ftext_19
		subq.l     #1,30(a7)
		move.w     82(a7),d0
		beq.s      A_ftext_20
		bra.s      A_ftext_17
A_ftext_20:
		bra.s      A_ftext_21
A_ftext_19:
		addq.l     #1,30(a7)
		move.w     #$0001,82(a7)
A_ftext_21:
		movea.l    30(a7),a0
		cmpa.l     26(a7),a0
		bls.s      A_ftext_22
A_ftext_17:
		movea.l    42(a7),a0
		cmpa.l     30(a7),a0
		beq.s      A_ftext_23
		movea.l    30(a7),a0
		cmpa.l     26(a7),a0
		bcc.s      A_ftext_23
		move.l     30(a7),22(a7)
		bra.s      A_ftext_24
A_ftext_26:
		subq.l     #1,30(a7)
A_ftext_24:
		movea.l    30(a7),a0
		cmpi.b     #$20,-1(a0)
		beq.s      A_ftext_25
		movea.l    30(a7),a0
		cmpa.l     34(a7),a0
		bhi.s      A_ftext_26
A_ftext_25:
		movea.l    30(a7),a0
		cmpa.l     34(a7),a0
		bne.s      A_ftext_23
		move.l     22(a7),30(a7)
A_ftext_23:
		move.l     30(a7),38(a7)
		move.l     42(a7),d0
		beq.s      A_ftext_16
		movea.l    42(a7),a0
		cmpa.l     30(a7),a0
		bne.s      A_ftext_16
		addq.l     #1,38(a7)
A_ftext_16:
		bra.s      A_ftext_27
A_ftext_29:
		addq.l     #1,34(a7)
A_ftext_27:
		movea.l    34(a7),a0
		cmpi.b     #$20,(a0)
		bne.s      A_ftext_28
		movea.l    34(a7),a0
		cmpa.l     30(a7),a0
		bcs.s      A_ftext_29
A_ftext_28:
		bra.s      A_ftext_30
A_ftext_32:
		subq.l     #1,30(a7)
A_ftext_30:
		movea.l    30(a7),a0
		cmpi.b     #$20,-1(a0)
		bne.s      A_ftext_31
		movea.l    30(a7),a0
		cmpa.l     34(a7),a0
		bhi.s      A_ftext_32
A_ftext_31:
		movea.l    30(a7),a0
		move.b     (a0),20(a7)
		movea.l    30(a7),a0
		clr.b      (a0)
		cmpi.w     #$0003,72(a7)
		bne.s      A_ftext_33
		clr.w      -(a7)
		moveq.l    #1,d0
		move.w     d0,-(a7)
		move.w     56(a7),-(a7)
		movea.l    40(a7),a0
		move.w     64(a7),d2
		move.w     60(a7),d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_justified
		addq.w     #6,a7
		bra.s      A_ftext_34
A_ftext_33:
		movea.l    34(a7),a0
		move.w     58(a7),d2
		move.w     54(a7),d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_gtext
A_ftext_34:
		movea.l    30(a7),a0
		move.b     20(a7),(a0)
		move.l     38(a7),34(a7)
		move.w     80(a7),d0
		add.w      d0,58(a7)
		move.w     58(a7),d0
		cmp.w      56(a7),d0
		bge.s      A_ftext_35
		movea.l    34(a7),a0
		cmpa.l     26(a7),a0
		bcs        A_ftext_36
A_ftext_35:
		lea.l      100(a7),a0
		clr.w      d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		moveq.l    #-2,d0
		movea.l    120(a7),a0
		and.w      8(a0),d0
A_ftext_5:
		lea.l      108(a7),a7
		movea.l    (a7)+,a2
		move.l     (a7)+,d2
		rts

	.globl Auo_ftext
Auo_ftext:
		lea.l      -30(a7),a7
		move.l     a0,26(a7)
		move.w     d0,24(a7)
		move.l     a1,20(a7)
		movea.l    26(a7),a0
		move.l     12(a0),16(a7)
		movea.l    16(a7),a0
		move.l     16(a0),4(a7)
		move.w     24(a7),d0
		cmp.w      #$0014,d0
		beq        Auo_ftext_1
		bgt.s      Auo_ftext_2
		cmp.w      #$0013,d0
		bhi        Auo_ftext_3
		add.w      d0,d0
		move.w     J51(pc,d0.w),d0
		jmp        J51(pc,d0.w)
J51:
		dc.w Auo_ftext_3-J51
		dc.w Auo_ftext_4-J51
		dc.w Auo_ftext_5-J51
		dc.w Auo_ftext_6-J51
		dc.w Auo_ftext_7-J51
		dc.w Auo_ftext_8-J51
		dc.w Auo_ftext_8-J51
		dc.w Auo_ftext_3-J51
		dc.w Auo_ftext_3-J51
		dc.w Auo_ftext_9-J51
		dc.w Auo_ftext_3-J51
		dc.w Auo_ftext_3-J51
		dc.w Auo_ftext_3-J51
		dc.w Auo_ftext_3-J51
		dc.w Auo_ftext_3-J51
		dc.w Auo_ftext_3-J51
		dc.w Auo_ftext_3-J51
		dc.w Auo_ftext_3-J51
		dc.w Auo_ftext_10-J51
		dc.w Auo_ftext_1-J51
Auo_ftext_2:
		sub.w      #$012c,d0
		cmp.w      #$0007,d0
		bhi        Auo_ftext_3
		add.w      d0,d0
		move.w     J52(pc,d0.w),d0
		jmp        J52(pc,d0.w)
J52:
		dc.w Auo_ftext_90-J52
		dc.w Auo_ftext_91-J52
		dc.w Auo_ftext_92-J52
		dc.w Auo_ftext_93-J52
		dc.w Auo_ftext_94-J52
		dc.w Auo_ftext_95-J52
		dc.w Auo_ftext_96-J52
		dc.w Auo_ftext_97-J52

Auo_ftext_4:
		movea.l    16(a7),a0
		move.l     12(a0),d0
		beq.s      Auo_ftext_14
		movea.l    16(a7),a0
		movea.l    12(a0),a0
		jsr        Ast_create
		movea.l    16(a7),a1
		move.l     a0,12(a1)
Auo_ftext_14:
		movea.l    16(a7),a0
		move.l     12(a0),d0
		bne.s      Auo_ftext_15
		lea.l      xe1d96,a0
		jsr        Ast_create
		movea.l    16(a7),a1
		move.l     a0,12(a1)
Auo_ftext_15:
		moveq.l    #16,d0
		jsr        Ax_malloc
		move.l     a0,4(a7)
		bne.s      Auo_ftext_16
		clr.w      d0
		bra        Auo_ftext_17
Auo_ftext_16:
		moveq.l    #16,d0
		lea.l      ftextproto,a1
		movea.l    4(a7),a0
		jsr        memcpy
		movea.l    16(a7),a0
		move.l     4(a7),16(a0)
		bra        Auo_ftext_18
Auo_ftext_5:
		movea.l    16(a7),a0
		movea.l    12(a0),a0
		jsr        Ast_delete
		movea.l    4(a7),a0
		jsr        Ax_free
		bra        Auo_ftext_18
Auo_ftext_9:
		move.l     20(a7),12(a7)
		movea.l    12(a7),a0
		movea.l    4(a7),a1
		move.l     (a0),6(a1)
		movea.l    12(a7),a0
		movea.l    4(a7),a1
		move.l     4(a0),10(a1)
		movea.l    12(a7),a0
		movea.l    4(a7),a1
		move.w     8(a0),14(a1)
		bra        Auo_ftext_18
Auo_ftext_10:
		move.l     20(a7),12(a7)
		movea.l    4(a7),a0
		movea.l    12(a7),a1
		move.l     6(a0),(a1)
		movea.l    4(a7),a0
		movea.l    12(a7),a1
		move.l     10(a0),4(a1)
		movea.l    4(a7),a0
		movea.l    12(a7),a1
		move.w     14(a0),8(a1)
		bra        Auo_ftext_18
Auo_ftext_7:
		movea.l    16(a7),a0
		movea.l    12(a0),a0
		jsr        Ast_delete
		movea.l    20(a7),a0
		jsr        Ast_create
		movea.l    16(a7),a1
		move.l     a0,12(a1)
		movea.l    16(a7),a0
		move.l     12(a0),d0
		bne.s      Auo_ftext_19
		lea.l      xe1d97,a0
		jsr        Ast_create
		movea.l    16(a7),a1
		move.l     a0,12(a1)
Auo_ftext_19:
		bra        Auo_ftext_18
Auo_ftext_6:
		movea.l    16(a7),a0
		movea.l    20(a7),a1
		move.l     12(a0),(a1)
		bra        Auo_ftext_18
Auo_ftext_8:
		movea.l    4(a7),a0
		move.l     6(a0),8(a7)
		beq.s      Auo_ftext_20
		moveq.l    #-1,d1
		movea.l    4(a7),a0
		move.w     14(a0),d0
		movea.l    8(a7),a0
		movea.l    8(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
Auo_ftext_20:
		bra        Auo_ftext_18
Auo_ftext_90:
		movea.l    20(a7),a0
		move.w     (a0),d0
		ext.l      d0
		move.l     d0,(a7)
		movea.l    16(a7),a0
		move.l     4(a0),d0
		and.l      #$0000FFFF,d0
		move.l     (a7),d1
		moveq.l    #16,d2
		lsl.l      d2,d1
		or.l       d1,d0
		movea.l    16(a7),a0
		move.l     d0,4(a0)
		bra        Auo_ftext_18
Auo_ftext_91:
		movea.l    20(a7),a0
		move.w     (a0),d0
		ext.l      d0
		move.l     d0,(a7)
		cmpi.l     #$000000FF,(a7)
		ble.s      Auo_ftext_21
		move.l     #$000000FF,(a7)
Auo_ftext_21:
		movea.l    16(a7),a0
		move.l     4(a0),d0
		and.l      #$FFFFFF00,d0
		or.l       (a7),d0
		movea.l    16(a7),a0
		move.l     d0,4(a0)
		bra        Auo_ftext_18
Auo_ftext_92:
		movea.l    20(a7),a0
		movea.l    4(a7),a1
		move.w     (a0),(a1)
		bra        Auo_ftext_18
Auo_ftext_93:
		movea.l    20(a7),a0
		move.w     (a0),d0
		ext.l      d0
		and.l      #$0000003F,d0
		move.l     d0,(a7)
		movea.l    16(a7),a0
		move.l     4(a0),d0
		and.l      #$FFFFC0FF,d0
		move.l     (a7),d1
		lsl.l      #8,d1
		or.l       d1,d0
		movea.l    16(a7),a0
		move.l     d0,4(a0)
		bra.w      Auo_ftext_18
Auo_ftext_94:
		movea.l    16(a7),a0
		move.l     4(a0),d0
		and.l      #$FFFF3FFF,d0
		or.l       #$00004000,d0
		movea.l    16(a7),a0
		move.l     d0,4(a0)
		bra.s      Auo_ftext_18
Auo_ftext_95:
		movea.l    16(a7),a0
		move.l     4(a0),d0
		and.l      #$FFFF3FFF,d0
		or.l       #$FFFF8000,d0
		movea.l    16(a7),a0
		move.l     d0,4(a0)
		bra.s      Auo_ftext_18
Auo_ftext_96:
		movea.l    16(a7),a0
		move.l     4(a0),d0
		and.l      #$FFFF3FFF,d0
		or.l       #$00000000,d0
		movea.l    16(a7),a0
		move.l     d0,4(a0)
		bra.s      Auo_ftext_18
Auo_ftext_97:
		movea.l    16(a7),a0
		move.l     4(a0),d0
		and.l      #$FFFF3FFF,d0
		or.l       #$FFFFC000,d0
		movea.l    16(a7),a0
		move.l     d0,4(a0)
		bra.s      Auo_ftext_18
Auo_ftext_1:
		bra.s      Auo_ftext_18
Auo_ftext_3:
		clr.w      d0
		bra.s      Auo_ftext_17
Auo_ftext_18:
		moveq.l    #1,d0
Auo_ftext_17:
		lea.l      30(a7),a7
		rts

	.data

ftextproto:
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe1d96:
		dc.b 0
xe1d97:
		dc.b 0
		.even
