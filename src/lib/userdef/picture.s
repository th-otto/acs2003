
	.globl A_picture
A_picture:
		move.l     d2,-(a7)
		move.l     a2,-(a7)
		lea.l      -38(a7),a7
		movea.l    50(a7),a0
		move.w     4(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    50(a7),a0
		movea.l    (a0),a0
		adda.l     d0,a0
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.l     12(a0),4(a7)
		movea.l    4(a7),a0
		move.l     20(a0),8(a7)
		move.l     8(a7),d0
		beq        A_picture_1
		movea.l    50(a7),a0
		move.w     22(a0),d0
		bne.s      A_picture_2
		movea.l    50(a7),a0
		move.w     24(a0),d0
		beq.s      A_picture_3
A_picture_2:
		movea.l    50(a7),a0
		move.w     18(a0),22(a7)
		movea.l    50(a7),a0
		move.w     20(a0),24(a7)
		movea.l    50(a7),a0
		move.w     18(a0),d0
		movea.l    50(a7),a0
		add.w      22(a0),d0
		subq.w     #1,d0
		move.w     d0,26(a7)
		movea.l    50(a7),a0
		move.w     20(a0),d0
		movea.l    50(a7),a0
		add.w      24(a0),d0
		subq.w     #1,d0
		move.w     d0,28(a7)
		bra.s      A_picture_4
A_picture_3:
		movea.l    ACSblk,a0
		move.w     8(a0),22(a7)
		movea.l    ACSblk,a0
		move.w     10(a0),24(a7)
		movea.l    ACSblk,a0
		move.w     8(a0),d0
		movea.l    ACSblk,a0
		add.w      10(a0),d0
		subq.w     #1,d0
		move.w     d0,26(a7)
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		movea.l    ACSblk,a0
		add.w      12(a0),d0
		subq.w     #1,d0
		move.w     d0,28(a7)
A_picture_4:
		movea.l    50(a7),a0
		move.w     22(a7),d0
		cmp.w      10(a0),d0
		bge.s      A_picture_5
		movea.l    50(a7),a0
		move.w     10(a0),22(a7)
A_picture_5:
		movea.l    50(a7),a0
		move.w     24(a7),d0
		cmp.w      12(a0),d0
		bge.s      A_picture_6
		movea.l    50(a7),a0
		move.w     12(a0),24(a7)
A_picture_6:
		movea.l    50(a7),a0
		move.w     10(a0),d0
		movea.l    50(a7),a0
		add.w      14(a0),d0
		subq.w     #1,d0
		move.w     d0,12(a7)
		move.w     26(a7),d0
		cmp.w      12(a7),d0
		ble.s      A_picture_7
		move.w     12(a7),26(a7)
A_picture_7:
		movea.l    50(a7),a0
		move.w     12(a0),d0
		movea.l    50(a7),a0
		add.w      16(a0),d0
		subq.w     #1,d0
		move.w     d0,12(a7)
		move.w     28(a7),d0
		cmp.w      12(a7),d0
		ble.s      A_picture_8
		move.w     12(a7),28(a7)
A_picture_8:
		move.w     22(a7),d0
		cmp.w      26(a7),d0
		bgt.s      A_picture_9
		move.w     24(a7),d0
		cmp.w      28(a7),d0
		ble.s      A_picture_10
A_picture_9:
		moveq.l    #-2,d0
		movea.l    50(a7),a0
		and.w      8(a0),d0
		bra        A_picture_11
A_picture_10:
		lea.l      22(a7),a0
		moveq.l    #1,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		movea.l    8(a7),a0
		move.w     4(a0),16(a7)
		movea.l    8(a7),a0
		move.w     6(a0),14(a7)
		moveq.l    #2,d0
		movea.l    50(a7),a0
		and.l      26(a0),d0
		beq        A_picture_12
		clr.w      d0
		move.w     d0,24(a7)
		move.w     d0,22(a7)
		moveq.l    #-1,d0
		add.w      16(a7),d0
		move.w     d0,26(a7)
		moveq.l    #-1,d0
		add.w      14(a7),d0
		move.w     d0,28(a7)
		movea.l    50(a7),a0
		move.w     12(a0),18(a7)
		bra        A_picture_13
A_picture_16:
		movea.l    50(a7),a0
		move.w     10(a0),20(a7)
		bra.s      A_picture_14
A_picture_15:
		move.w     20(a7),30(a7)
		move.w     18(a7),32(a7)
		move.w     20(a7),d0
		add.w      16(a7),d0
		subq.w     #1,d0
		move.w     d0,34(a7)
		move.w     18(a7),d0
		add.w      14(a7),d0
		subq.w     #1,d0
		move.w     d0,36(a7)
		movea.l    ACSblk,a0
		pea.l      618(a0)
		movea.l    12(a7),a1
		lea.l      26(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vro_cpyfm
		addq.w     #4,a7
		move.w     16(a7),d0
		add.w      d0,20(a7)
A_picture_14:
		movea.l    50(a7),a0
		move.w     10(a0),d0
		movea.l    50(a7),a0
		add.w      14(a0),d0
		move.w     20(a7),d1
		cmp.w      d0,d1
		blt.s      A_picture_15
		move.w     14(a7),d0
		add.w      d0,18(a7)
A_picture_13:
		movea.l    50(a7),a0
		move.w     12(a0),d0
		movea.l    50(a7),a0
		add.w      16(a0),d0
		move.w     18(a7),d1
		cmp.w      d0,d1
		blt        A_picture_16
		bra        A_picture_17
A_picture_12:
		movea.l    50(a7),a0
		move.l     26(a0),d0
		and.l      #$00100000,d0
		beq.s      A_picture_18
		movea.l    ACSblk,a0
		cmpi.w     #$0004,28(a0)
		blt.s      A_picture_19
		moveq.l    #8,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_color
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_interior
		bra.s      A_picture_20
A_picture_19:
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_color
		moveq.l    #2,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_interior
		moveq.l    #4,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_style
A_picture_20:
		bra.s      A_picture_21
A_picture_18:
		movea.l    50(a7),a0
		move.l     26(a0),d1
		asr.l      #4,d1
		and.w      #$000F,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_color
		movea.l    50(a7),a0
		move.l     26(a0),d1
		asr.l      #8,d1
		and.w      #$001F,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_style
		movea.l    50(a7),a0
		move.l     26(a0),d1
		moveq.l    #16,d0
		asr.l      d0,d1
		and.w      #$000F,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_interior
A_picture_21:
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vswr_mode
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_perimeter
		lea.l      22(a7),a0
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_bar
		clr.w      d0
		move.w     d0,24(a7)
		move.w     d0,22(a7)
		movea.l    50(a7),a0
		move.w     14(a0),d0
		sub.w      16(a7),d0
		move.w     d0,12(a7)
		move.w     12(a7),d0
		ble.s      A_picture_22
		moveq.l    #-1,d0
		add.w      16(a7),d0
		move.w     d0,26(a7)
		move.w     12(a7),d0
		asr.w      #1,d0
		movea.l    50(a7),a0
		add.w      10(a0),d0
		move.w     d0,30(a7)
		bra.s      A_picture_23
A_picture_22:
		moveq.l    #-1,d0
		movea.l    50(a7),a0
		add.w      14(a0),d0
		move.w     d0,26(a7)
		movea.l    50(a7),a0
		move.w     10(a0),30(a7)
A_picture_23:
		move.w     30(a7),d0
		add.w      26(a7),d0
		move.w     d0,34(a7)
		movea.l    50(a7),a0
		move.w     16(a0),d0
		sub.w      14(a7),d0
		move.w     d0,12(a7)
		move.w     12(a7),d0
		ble.s      A_picture_24
		moveq.l    #-1,d0
		add.w      14(a7),d0
		move.w     d0,28(a7)
		move.w     12(a7),d0
		asr.w      #1,d0
		movea.l    50(a7),a0
		add.w      12(a0),d0
		move.w     d0,32(a7)
		bra.s      A_picture_25
A_picture_24:
		moveq.l    #-1,d0
		movea.l    50(a7),a0
		add.w      16(a0),d0
		move.w     d0,28(a7)
		movea.l    50(a7),a0
		move.w     12(a0),32(a7)
A_picture_25:
		move.w     32(a7),d0
		add.w      28(a7),d0
		move.w     d0,36(a7)
		movea.l    ACSblk,a0
		pea.l      618(a0)
		movea.l    12(a7),a1
		lea.l      26(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vro_cpyfm
		addq.w     #4,a7
A_picture_17:
		lea.l      22(a7),a0
		clr.w      d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
A_picture_1:
		moveq.l    #-2,d0
		movea.l    50(a7),a0
		and.w      8(a0),d0
A_picture_11:
		lea.l      38(a7),a7
		movea.l    (a7)+,a2
		move.l     (a7)+,d2
		rts

del_pic:
		subq.w     #8,a7
		move.l     a0,4(a7)
		moveq.l    #1,d0
		movea.l    4(a7),a0
		and.l      4(a0),d0
		beq.s      del_pic_1
		movea.l    4(a7),a0
		movea.l    20(a0),a0
		jsr        Abp_delete
		bra.s      del_pic_2
del_pic_1:
		movea.l    4(a7),a0
		move.l     12(a0),(a7)
		move.l     (a7),d0
		beq.s      del_pic_3
		movea.l    (a7),a0
		movea.l    20(a0),a0
		movea.l    4(a7),a1
		cmpa.l     20(a1),a0
		bne.s      del_pic_3
		movea.l    (a7),a0
		subq.l     #1,24(a0)
		bgt.s      del_pic_4
		movea.l    (a7),a0
		movea.l    20(a0),a0
		jsr        Abp_delete
		movea.l    (a7),a0
		clr.l      20(a0)
		movea.l    (a7),a0
		clr.l      24(a0)
del_pic_4:
		bra.s      del_pic_2
del_pic_3:
		movea.l    4(a7),a0
		movea.l    20(a0),a0
		jsr        Abp_delete
del_pic_2:
		movea.l    4(a7),a0
		clr.l      20(a0)
		addq.w     #8,a7
		rts

make_pic:
		move.l     a2,-(a7)
		lea.l      -40(a7),a7
		move.l     a0,36(a7)
		movea.l    36(a7),a0
		move.l     12(a0),32(a7)
		movea.l    32(a7),a0
		move.w     6(a0),d1
		movea.l    32(a7),a0
		move.w     4(a0),d0
		jsr        Abp_create
		move.l     a0,28(a7)
		move.l     28(a7),d0
		bne.s      make_pic_1
		moveq.l    #-1,d0
		bra        make_pic_2
make_pic_1:
		movea.l    28(a7),a0
		move.w     8(a0),d0
		ext.l      d0
		add.l      d0,d0
		movea.l    28(a7),a0
		move.w     6(a0),d1
		ext.l      d1
		jsr        _lmul
		move.l     d0,16(a7)
		movea.l    32(a7),a0
		move.w     12(a0),22(a7)
		move.w     22(a7),d0
		movea.l    ACSblk,a0
		sub.w      28(a0),d0
		move.w     d0,20(a7)
		move.w     20(a7),d0
		bmi.s      make_pic_3
		movea.l    ACSblk,a0
		movea.l    32(a7),a1
		move.w     28(a0),12(a1)
		move.w     20(a7),d0
		ext.l      d0
		move.l     16(a7),d1
		jsr        _lmul
		movea.l    32(a7),a0
		lea.l      28(a0,d0.l),a0
		movea.l    32(a7),a1
		move.l     a0,(a1)
		movea.l    28(a7),a1
		movea.l    32(a7),a0
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vr_trnfm
		movea.l    32(a7),a0
		move.w     22(a7),12(a0)
		bra        make_pic_4
make_pic_3:
		movea.l    32(a7),a0
		move.w     6(a0),d1
		movea.l    32(a7),a0
		move.w     4(a0),d0
		jsr        Abp_create
		move.l     a0,24(a7)
		move.l     24(a7),d0
		bne.s      make_pic_5
		movea.l    28(a7),a0
		jsr        Abp_delete
		moveq.l    #-1,d0
		bra        make_pic_2
make_pic_5:
		cmpi.w     #$0001,22(a7)
		bne        make_pic_6
		movea.l    24(a7),a0
		move.w     #$0001,12(a0)
		movea.l    32(a7),a0
		lea.l      28(a0),a0
		movea.l    32(a7),a1
		move.l     a0,(a1)
		movea.l    24(a7),a1
		movea.l    32(a7),a0
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vr_trnfm
		clr.w      d0
		move.w     d0,10(a7)
		move.w     d0,8(a7)
		move.w     d0,2(a7)
		move.w     d0,(a7)
		moveq.l    #-1,d0
		movea.l    24(a7),a0
		add.w      4(a0),d0
		move.w     d0,12(a7)
		move.w     d0,4(a7)
		moveq.l    #-1,d0
		movea.l    24(a7),a0
		add.w      6(a0),d0
		move.w     d0,14(a7)
		move.w     d0,6(a7)
		pea.l      color
		move.l     32(a7),-(a7)
		movea.l    32(a7),a1
		lea.l      8(a7),a0
		moveq.l    #1,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vrt_cpyfm
		addq.w     #8,a7
		bra        make_pic_7
make_pic_6:
		movea.l    24(a7),a0
		move.w     #$0001,10(a0)
		move.w     22(a7),d0
		ext.l      d0
		move.l     16(a7),d1
		jsr        _lmul
		movea.l    32(a7),a1
		lea.l      28(a1),a1
		movea.l    24(a7),a0
		movea.l    (a0),a0
		jsr        memcpy
		move.w     20(a7),d0
		neg.w      d0
		ext.l      d0
		move.l     16(a7),d1
		jsr        _lmul
		move.l     d0,d1
		clr.w      d0
		move.l     d1,-(a7)
		move.w     d0,-(a7)
		move.w     28(a7),d0
		ext.l      d0
		move.l     22(a7),d1
		jsr        _lmul
		movea.l    30(a7),a0
		movea.l    (a0),a0
		adda.l     d0,a0
		move.w     (a7)+,d0
		move.l     (a7)+,d1
		jsr        memset
		movea.l    28(a7),a1
		movea.l    24(a7),a0
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vr_trnfm
make_pic_7:
		movea.l    24(a7),a0
		jsr        Abp_delete
make_pic_4:
		movea.l    36(a7),a0
		move.l     28(a7),20(a0)
		moveq.l    #1,d0
		movea.l    36(a7),a0
		and.l      4(a0),d0
		bne.s      make_pic_8
		movea.l    32(a7),a0
		move.l     28(a7),20(a0)
		movea.l    32(a7),a0
		move.l     #$00000001,24(a0)
make_pic_8:
		clr.w      d0
make_pic_2:
		lea.l      40(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Auo_picture
Auo_picture:
		lea.l      -30(a7),a7
		move.l     a0,26(a7)
		move.w     d0,24(a7)
		move.l     a1,20(a7)
		movea.l    26(a7),a0
		move.l     12(a0),(a7)
		move.w     24(a7),d0
		cmp.w      #$0009,d0
		beq        Auo_picture_1
		bgt.s      Auo_picture_2
		subq.w     #1,d0
		beq.s      Auo_picture_3
		subq.w     #1,d0
		beq        Auo_picture_4
		subq.w     #3,d0
		beq        Auo_picture_5
		subq.w     #1,d0
		beq        Auo_picture_5
		bra        Auo_picture_6
Auo_picture_2:
		sub.w      #$0013,d0
		beq        Auo_picture_7
		subq.w     #1,d0
		beq        Auo_picture_7
		sub.w      #$01E0,d0
		beq        Auo_picture_8
		bra        Auo_picture_6
Auo_picture_3:
		moveq.l    #10,d0
		jsr        Ax_malloc
		move.l     a0,12(a7)
		move.l     12(a7),d0
		bne.s      Auo_picture_9
		movea.l    20(a7),a0
		move.w     #$FFFF,(a0)
		bra        Auo_picture_10
Auo_picture_9:
		movea.l    (a7),a0
		move.l     12(a7),16(a0)
		movea.l    12(a7),a0
		clr.l      (a0)
		movea.l    (a7),a0
		move.l     12(a0),16(a7)
		move.l     16(a7),d0
		bne.s      Auo_picture_11
		bra        Auo_picture_10
Auo_picture_11:
		moveq.l    #1,d0
		movea.l    (a7),a0
		and.l      4(a0),d0
		bne.s      Auo_picture_12
		movea.l    16(a7),a0
		move.l     20(a0),d0
		bne.s      Auo_picture_13
Auo_picture_12:
		movea.l    (a7),a0
		bsr        make_pic
		addq.w     #1,d0
		bne.s      Auo_picture_14
		movea.l    20(a7),a0
		move.w     #$FFFF,(a0)
		bra        Auo_picture_10
Auo_picture_14:
		bra.s      Auo_picture_15
Auo_picture_13:
		movea.l    16(a7),a0
		addq.l     #1,24(a0)
		movea.l    16(a7),a0
		movea.l    (a7),a1
		move.l     20(a0),20(a1)
Auo_picture_15:
		bra        Auo_picture_10
Auo_picture_8:
		movea.l    (a7),a0
		bsr        del_pic
		movea.l    (a7),a0
		move.l     20(a7),20(a0)
		bra        Auo_picture_10
Auo_picture_4:
		movea.l    (a7),a0
		movea.l    16(a0),a0
		jsr        Ax_free
		movea.l    (a7),a0
		bsr        del_pic
		bra.s      Auo_picture_10
Auo_picture_1:
		move.l     20(a7),12(a7)
		movea.l    (a7),a0
		move.l     16(a0),8(a7)
		movea.l    12(a7),a0
		movea.l    8(a7),a1
		move.l     (a0),(a1)
		movea.l    12(a7),a0
		movea.l    8(a7),a1
		move.l     4(a0),4(a1)
		movea.l    12(a7),a0
		movea.l    8(a7),a1
		move.w     8(a0),8(a1)
		bra.s      Auo_picture_10
Auo_picture_5:
		movea.l    (a7),a0
		move.l     16(a0),12(a7)
		movea.l    12(a7),a0
		move.l     (a0),4(a7)
		move.l     4(a7),d0
		bne.s      Auo_picture_16
		bra.s      Auo_picture_10
Auo_picture_16:
		moveq.l    #-1,d1
		movea.l    12(a7),a0
		move.w     8(a0),d0
		movea.l    4(a7),a0
		movea.l    4(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
		bra.s      Auo_picture_10
Auo_picture_7:
		bra.s      Auo_picture_10
Auo_picture_6:
		clr.w      d0
		bra.s      Auo_picture_17
Auo_picture_10:
		moveq.l    #1,d0
Auo_picture_17:
		lea.l      30(a7),a7
		rts

	.data

color:
		dc.w $0001
		dc.w $0000
