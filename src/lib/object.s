	.globl Aob_create
Aob_create:
		move.l     a2,-(a7)
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		clr.l      4(a7)
		move.l     d0,-(a7)
		moveq.l    #1,d0
		movea.l    26(a7),a0
		jsr        Aob_count
		ext.l      d0
		move.l     (a7)+,d1
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		move.l     d1,4(a7)
		move.l     4(a7),d0
		jsr        Ax_malloc
		move.l     a0,18(a7)
		bne.s      Aob_create_1
		suba.l     a0,a0
		bra        Aob_create_2
Aob_create_1:
		move.l     4(a7),d0
		movea.l    22(a7),a1
		movea.l    18(a7),a0
		jsr        memcpy
		clr.w      12(a7)
		movea.l    18(a7),a0
		move.l     a0,14(a7)
		move.l     a0,8(a7)
Aob_create_13:
		movea.l    14(a7),a0
		move.w     8(a0),d0
		and.w      #$8000,d0
		bne        Aob_create_3
		movea.l    14(a7),a0
		move.w     10(a0),d0
		and.w      #$2000,d0
		bne        Aob_create_3
		movea.l    14(a7),a0
		move.b     7(a0),d0
		ext.w      d0
		sub.w      #$0014,d0
		cmp.w      #$000D,d0
		bhi        Aob_create_4
		add.w      d0,d0
		move.w     J36(pc,d0.w),d0
		jmp        J36(pc,d0.w)
J36:
		dc.w Aob_create_5-J36
		dc.w Aob_create_6-J36
		dc.w Aob_create_6-J36
		dc.w Aob_create_7-J36
		dc.w Aob_create_8-J36
		dc.w Aob_create_5-J36
		dc.w Aob_create_9-J36
		dc.w Aob_create_5-J36
		dc.w Aob_create_9-J36
		dc.w Aob_create_6-J36
		dc.w Aob_create_6-J36
		dc.w Aob_create_10-J36
		dc.w Aob_create_9-J36
		dc.w Aob_create_10-J36
Aob_create_6:
		movea.l    14(a7),a0
		movea.l    12(a0),a0
		jsr        Ate_create
		move.l     a0,8(a7)
		movea.l    14(a7),a1
		move.l     a0,12(a1)
		bra        Aob_create_4
Aob_create_8:
		movea.l    14(a7),a0
		movea.l    12(a0),a0
		jsr        Aus_create
		move.l     a0,(a7)
		move.l     a0,8(a7)
		movea.l    14(a7),a1
		move.l     a0,12(a1)
		movea.l    (a7),a0
		move.l     8(a0),d0
		beq.s      Aob_create_11
		lea.l      12(a7),a1
		moveq.l    #1,d0
		movea.l    14(a7),a0
		movea.l    (a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Aob_create_11:
		cmpi.w     #$FFFF,12(a7)
		bne.s      Aob_create_12
		suba.l     a0,a0
		bra.w      Aob_create_2
Aob_create_12:
		bra.s      Aob_create_4
Aob_create_5:
		bra.s      Aob_create_4
Aob_create_7:
		movea.l    14(a7),a0
		movea.l    12(a0),a0
		jsr        Aim_create
		move.l     a0,8(a7)
		movea.l    14(a7),a1
		move.l     a0,12(a1)
		bra.s      Aob_create_4
Aob_create_10:
		movea.l    14(a7),a0
		movea.l    12(a0),a0
		jsr        Aic_create
		move.l     a0,8(a7)
		movea.l    14(a7),a1
		move.l     a0,12(a1)
		bra.s      Aob_create_4
Aob_create_9:
		movea.l    14(a7),a0
		movea.l    12(a0),a0
		jsr        Ast_create
		move.l     a0,8(a7)
		movea.l    14(a7),a1
		move.l     a0,12(a1)
		nop
Aob_create_4:
		move.l     8(a7),d0
		bne.s      Aob_create_3
		suba.l     a0,a0
		bra.s      Aob_create_2
Aob_create_3:
		moveq.l    #32,d0
		movea.l    14(a7),a0
		addi.l     #$00000018,14(a7)
		and.w      8(a0),d0
		beq        Aob_create_13
		movea.l    18(a7),a0
Aob_create_2:
		lea.l      26(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aob_delete
Aob_delete:
		move.l     a2,-(a7)
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     8(a7),d0
		bne.s      Aob_delete_1
		bra        Aob_delete_2
Aob_delete_1:
		move.l     8(a7),(a7)
Aob_delete_10:
		movea.l    (a7),a0
		move.w     8(a0),d0
		and.w      #$8000,d0
		bne        Aob_delete_3
		movea.l    (a7),a0
		move.w     10(a0),d0
		and.w      #$2000,d0
		bne        Aob_delete_3
		movea.l    (a7),a0
		move.b     7(a0),d0
		ext.w      d0
		sub.w      #$0014,d0
		cmp.w      #$000D,d0
		bhi        Aob_delete_3
		add.w      d0,d0
		move.w     J37(pc,d0.w),d0
		jmp        J37(pc,d0.w)
J37:
		dc.w Aob_delete_3-J37
		dc.w Aob_delete_4-J37
		dc.w Aob_delete_4-J37
		dc.w Aob_delete_5-J37
		dc.w Aob_delete_6-J37
		dc.w Aob_delete_3-J37
		dc.w Aob_delete_7-J37
		dc.w Aob_delete_3-J37
		dc.w Aob_delete_7-J37
		dc.w Aob_delete_4-J37
		dc.w Aob_delete_4-J37
		dc.w Aob_delete_8-J37
		dc.w Aob_delete_7-J37
		dc.w Aob_delete_8-J37
Aob_delete_4:
		movea.l    (a7),a0
		movea.l    12(a0),a0
		jsr        Ate_delete
		bra.s      Aob_delete_3
Aob_delete_6:
		movea.l    (a7),a0
		move.l     12(a0),4(a7)
		movea.l    4(a7),a0
		move.l     8(a0),d0
		beq.s      Aob_delete_9
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    (a7),a0
		movea.l    4(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Aob_delete_9:
		movea.l    4(a7),a0
		jsr        Aus_delete
		bra.s      Aob_delete_3
Aob_delete_7:
		movea.l    (a7),a0
		movea.l    12(a0),a0
		jsr        Ast_delete
		bra.s      Aob_delete_3
Aob_delete_5:
		movea.l    (a7),a0
		movea.l    12(a0),a0
		jsr        Aim_delete
		bra.s      Aob_delete_3
Aob_delete_8:
		movea.l    (a7),a0
		movea.l    12(a0),a0
		jsr        Aic_delete
		nop
Aob_delete_3:
		moveq.l    #32,d0
		movea.l    (a7),a0
		addi.l     #$00000018,(a7)
		and.w      8(a0),d0
		beq        Aob_delete_10
		movea.l    8(a7),a0
		jsr        Ax_free
Aob_delete_2:
		lea.l      12(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aob_count
Aob_count:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.w     d0,6(a7)
		move.w     #$0001,(a7)
		move.l     8(a7),2(a7)
		bra.s      Aob_count_1
Aob_count_4:
		move.w     6(a7),d0
		bne.s      Aob_count_2
		movea.l    2(a7),a0
		move.w     8(a0),d0
		and.w      #$8000,d0
		bne.s      Aob_count_3
Aob_count_2:
		addq.w     #1,(a7)
Aob_count_3:
		addi.l     #$00000018,2(a7)
Aob_count_1:
		moveq.l    #32,d0
		movea.l    2(a7),a0
		and.w      8(a0),d0
		beq.s      Aob_count_4
		addq.w     #1,(a7)
		move.w     (a7),d0
		lea.l      12(a7),a7
		rts

convert:
		move.l     a2,-(a7)
		lea.l      -52(a7),a7
		move.l     a0,48(a7)
		move.l     a1,44(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0800,d0
		beq.s      convert_1
		movea.l    48(a7),a0
		move.w     8(a0),d0
		movea.l    48(a7),a0
		muls.w     6(a0),d0
		add.w      d0,d0
		movea.l    ACSblk,a0
		muls.w     28(a0),d0
		ext.l      d0
		movea.l    48(a7),a0
		movea.l    (a0),a1
		movea.l    44(a7),a0
		movea.l    (a0),a0
		jsr        memcpy
		bra        convert_2
convert_1:
		movea.l    ACSblk,a0
		moveq.l    #1,d0
		movea.l    ACSblk,a1
		move.b     29(a1),d1
		lsl.w      d1,d0
		cmp.w      26(a0),d0
		beq        convert_3
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
		bra        convert_4
convert_19:
		move.w     16(a7),d0
		move.w     d0,14(a7)
		move.w     d0,10(a7)
		move.w     16(a7),d0
		movea.l    48(a7),a0
		muls.w     8(a0),d0
		ext.l      d0
		move.l     d0,34(a7)
		clr.w      18(a7)
		bra        convert_5
convert_18:
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
		move.l     #$00008000,d0
		moveq.l    #15,d1
		and.b      19(a7),d1
		asr.l      d1,d0
		move.w     d0,28(a7)
		movea.l    20(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq        convert_6
		clr.w      42(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_7
		addq.w     #1,42(a7)
convert_7:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_8
		addq.w     #2,42(a7)
convert_8:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_9
		addq.w     #4,42(a7)
convert_9:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_10
		addq.w     #8,42(a7)
convert_10:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_11
		addi.w     #$0010,42(a7)
convert_11:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_12
		addi.w     #$0020,42(a7)
convert_12:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_13
		addi.w     #$0040,42(a7)
convert_13:
		move.l     38(a7),d0
		add.l      d0,d0
		add.l      d0,24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		and.w      28(a7),d0
		beq.s      convert_14
		addi.w     #$0080,42(a7)
convert_14:
		movea.l    ACSblk,a0
		cmpi.w     #$0008,28(a0)
		bge.s      convert_15
		andi.w     #$000F,42(a7)
convert_15:
		cmpi.w     #$0010,42(a7)
		bge.s      convert_16
		move.w     42(a7),d0
		add.w      d0,d0
		lea.l      map,a0
		move.w     0(a0,d0.w),42(a7)
convert_16:
		bra.s      convert_17
convert_6:
		moveq.l    #-1,d0
		movea.l    ACSblk,a0
		add.w      26(a0),d0
		move.w     d0,42(a7)
convert_17:
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
convert_5:
		movea.l    44(a7),a0
		move.w     18(a7),d0
		cmp.w      4(a0),d0
		blt        convert_18
		addq.w     #1,16(a7)
convert_4:
		movea.l    44(a7),a0
		move.w     16(a7),d0
		cmp.w      6(a0),d0
		blt        convert_19
		bra.s      convert_2
convert_3:
		movea.l    44(a7),a1
		movea.l    48(a7),a0
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vr_trnfm
convert_2:
		lea.l      52(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aic_create
Aic_create:
		lea.l      -78(a7),a7
		move.l     a0,74(a7)
		moveq.l    #38,d0
		jsr        Ax_malloc
		move.l     a0,70(a7)
		move.l     70(a7),d0
		bne.s      Aic_create_1
		suba.l     a0,a0
		bra        Aic_create_2
Aic_create_1:
		moveq.l    #38,d0
		movea.l    74(a7),a1
		movea.l    70(a7),a0
		jsr        memcpy
		movea.l    74(a7),a0
		movea.l    8(a0),a0
		jsr        Ast_create
		movea.l    70(a7),a1
		move.l     a0,8(a1)
		movea.l    70(a7),a0
		move.l     8(a0),d0
		bne.s      Aic_create_3
		moveq.l    #38,d0
		movea.l    70(a7),a0
		jsr        Ax_recycle
		suba.l     a0,a0
		bra        Aic_create_2
Aic_create_3:
		clr.l      62(a7)
		movea.l    70(a7),a0
		move.l     34(a0),66(a7)
		move.l     66(a7),d0
		beq        Aic_create_4
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0330,(a0)
		ble.s      Aic_create_5
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0350,(a0)
		blt.s      Aic_create_6
Aic_create_5:
		move.l     _globl,-(a7)
		pea.l      46(a7)
		pea.l      48(a7)
		lea.l      54(a7),a1
		lea.l      54(a7),a0
		moveq.l    #2,d0
		jsr        mt_appl_getinfo
		lea.l      12(a7),a7
		tst.w      d0
		beq        Aic_create_4
		move.w     40(a7),d0
		beq        Aic_create_4
Aic_create_6:
		moveq.l    #15,d0
		movea.l    70(a7),a0
		add.w      22(a0),d0
		and.w      #$FFF0,d0
		move.w     d0,44(a7)
		move.w     44(a7),d0
		movea.l    70(a7),a0
		muls.w     24(a0),d0
		asr.w      #3,d0
		ext.l      d0
		move.l     d0,54(a7)
		move.l     66(a7),62(a7)
		movea.l    62(a7),a0
		move.l     18(a0),d0
		beq.s      Aic_create_7
		movea.l    62(a7),a0
		movea.l    18(a0),a0
		move.w     (a0),d0
		movea.l    ACSblk,a0
		cmp.w      28(a0),d0
		bgt.s      Aic_create_7
		movea.l    62(a7),a0
		move.l     18(a0),62(a7)
Aic_create_7:
		movea.l    70(a7),a0
		move.l     62(a7),34(a0)
		movea.l    62(a7),a0
		clr.l      18(a0)
		movea.l    ACSblk,a0
		move.w     28(a0),d0
		movea.l    62(a7),a0
		cmp.w      (a0),d0
		blt        Aic_create_8
		movea.l    62(a7),a0
		move.l     2(a0),58(a7)
		subq.l     #6,58(a7)
		movea.l    58(a7),a0
		move.w     (a0),d0
		ble.s      Aic_create_9
		movea.l    58(a7),a0
		addq.w     #1,(a0)
		movea.l    58(a7),a0
		addq.w     #6,a0
		movea.l    62(a7),a1
		move.l     a0,2(a1)
		movea.l    62(a7),a0
		move.l     10(a0),58(a7)
		move.l     58(a7),d0
		beq.s      Aic_create_10
		subq.l     #6,58(a7)
		movea.l    58(a7),a0
		addq.w     #1,(a0)
		movea.l    58(a7),a0
		addq.w     #6,a0
		movea.l    62(a7),a1
		move.l     a0,10(a1)
Aic_create_10:
		bra        Aic_create_11
Aic_create_9:
		move.l     54(a7),d0
		movea.l    ACSblk,a0
		move.w     28(a0),d1
		ext.l      d1
		jsr        _lmul
		addq.l     #6,d0
		move.l     d0,50(a7)
		move.l     54(a7),d0
		movea.l    62(a7),a0
		move.w     (a0),d1
		ext.l      d1
		jsr        _lmul
		move.l     d0,46(a7)
		movea.l    ACSblk,a0
		movea.l    62(a7),a1
		move.w     28(a0),(a1)
		clr.w      10(a7)
		move.w     #$0001,30(a7)
		move.w     44(a7),d0
		move.w     d0,24(a7)
		move.w     d0,4(a7)
		movea.l    70(a7),a0
		move.w     24(a0),d0
		move.w     d0,26(a7)
		move.w     d0,6(a7)
		move.w     44(a7),d0
		asr.w      #4,d0
		move.w     d0,28(a7)
		move.w     d0,8(a7)
		movea.l    ACSblk,a0
		move.w     28(a0),d0
		move.w     d0,32(a7)
		move.w     d0,12(a7)
		clr.w      d0
		move.w     d0,38(a7)
		move.w     d0,36(a7)
		move.w     d0,34(a7)
		move.w     d0,18(a7)
		move.w     d0,16(a7)
		move.w     d0,14(a7)
		move.l     50(a7),d0
		jsr        Ax_malloc
		move.l     a0,58(a7)
		move.l     58(a7),d0
		bne.s      Aic_create_12
		movea.l    70(a7),a0
		clr.l      34(a0)
		movea.l    70(a7),a0
		bra        Aic_create_2
Aic_create_12:
		move.l     58(a7),20(a7)
		move.l     50(a7),d1
		clr.w      d0
		movea.l    20(a7),a0
		jsr        memset
		move.l     46(a7),d0
		movea.l    62(a7),a0
		movea.l    2(a0),a1
		movea.l    20(a7),a0
		jsr        memcpy
		move.l     50(a7),d0
		jsr        Ax_malloc
		move.l     a0,58(a7)
		move.l     58(a7),d0
		bne.s      Aic_create_13
		movea.l    70(a7),a0
		clr.l      34(a0)
		movea.l    70(a7),a0
		bra        Aic_create_2
Aic_create_13:
		movea.l    58(a7),a0
		addq.w     #6,a0
		move.l     a0,(a7)
		movea.l    58(a7),a0
		move.w     #$0001,(a0)
		movea.l    62(a7),a0
		movea.l    58(a7),a1
		move.l     2(a0),2(a1)
		movea.l    62(a7),a0
		move.l     6(a0),-(a7)
		lea.l      4(a7),a1
		lea.l      24(a7),a0
		bsr        convert
		addq.w     #4,a7
		movea.l    62(a7),a0
		move.l     (a7),2(a0)
		movea.l    62(a7),a0
		move.l     10(a0),d0
		beq.s      Aic_create_14
		move.l     50(a7),d0
		jsr        Ax_malloc
		move.l     a0,58(a7)
		move.l     58(a7),d0
		bne.s      Aic_create_15
		movea.l    62(a7),a0
		clr.l      10(a0)
		movea.l    62(a7),a0
		clr.l      14(a0)
		bra.s      Aic_create_14
Aic_create_15:
		move.l     46(a7),d0
		movea.l    62(a7),a0
		movea.l    10(a0),a1
		movea.l    20(a7),a0
		jsr        memcpy
		movea.l    58(a7),a0
		addq.w     #6,a0
		move.l     a0,(a7)
		movea.l    58(a7),a0
		move.w     #$0001,(a0)
		movea.l    62(a7),a0
		movea.l    58(a7),a1
		move.l     10(a0),2(a1)
		movea.l    62(a7),a0
		move.l     14(a0),-(a7)
		lea.l      4(a7),a1
		lea.l      24(a7),a0
		bsr        convert
		addq.w     #4,a7
		movea.l    62(a7),a0
		move.l     (a7),10(a0)
Aic_create_14:
		movea.l    20(a7),a0
		jsr        Ax_ifree
Aic_create_11:
		bra.s      Aic_create_16
Aic_create_8:
		movea.l    70(a7),a0
		clr.l      34(a0)
Aic_create_16:
		bra.s      Aic_create_17
Aic_create_4:
		movea.l    70(a7),a0
		clr.l      34(a0)
Aic_create_17:
		movea.l    70(a7),a0
Aic_create_2:
		lea.l      78(a7),a7
		rts

	.globl Aic_delete
Aic_delete:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     8(a7),d0
		bne.s      Aic_delete_1
		bra        Aic_delete_2
Aic_delete_1:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0800,d0
		beq.s      Aic_delete_3
		bra        Aic_delete_2
Aic_delete_3:
		movea.l    8(a7),a0
		move.l     34(a0),4(a7)
		move.l     4(a7),d0
		beq.s      Aic_delete_4
		movea.l    4(a7),a0
		move.l     2(a0),(a7)
		subq.l     #6,(a7)
		movea.l    (a7),a0
		subq.w     #1,(a0)
		movea.l    (a7),a0
		cmpi.w     #$0001,(a0)
		bge.s      Aic_delete_5
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.l     2(a0),2(a1)
		movea.l    (a7),a0
		jsr        Ax_ifree
Aic_delete_5:
		movea.l    4(a7),a0
		move.l     10(a0),(a7)
		move.l     (a7),d0
		beq.s      Aic_delete_4
		subq.l     #6,(a7)
		movea.l    (a7),a0
		subq.w     #1,(a0)
		movea.l    (a7),a0
		cmpi.w     #$0001,(a0)
		bge.s      Aic_delete_4
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.l     2(a0),10(a1)
		movea.l    (a7),a0
		jsr        Ax_ifree
Aic_delete_4:
		movea.l    8(a7),a0
		movea.l    8(a0),a0
		jsr        Ast_delete
		moveq.l    #38,d0
		movea.l    8(a7),a0
		jsr        Ax_recycle
Aic_delete_2:
		lea.l      12(a7),a7
		rts

	.globl Aim_create
Aim_create:
		subq.w     #8,a7
		move.l     a0,4(a7)
		moveq.l    #14,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		bne.s      Aim_create_1
		suba.l     a0,a0
		bra.s      Aim_create_2
Aim_create_1:
		moveq.l    #14,d0
		movea.l    4(a7),a1
		movea.l    (a7),a0
		jsr        memcpy
		movea.l    (a7),a0
Aim_create_2:
		addq.w     #8,a7
		rts

	.globl Aim_delete
Aim_delete:
		subq.w     #4,a7
		move.l     a0,(a7)
		moveq.l    #14,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		addq.w     #4,a7
		rts

	.globl Ate_create
Ate_create:
		subq.w     #8,a7
		move.l     a0,4(a7)
		moveq.l    #28,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		bne.s      Ate_create_1
		suba.l     a0,a0
		bra        Ate_create_2
Ate_create_1:
		moveq.l    #28,d0
		movea.l    4(a7),a1
		movea.l    (a7),a0
		jsr        memcpy
		movea.l    4(a7),a0
		movea.l    (a0),a0
		jsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,(a1)
		movea.l    4(a7),a0
		movea.l    4(a0),a0
		jsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,4(a1)
		movea.l    4(a7),a0
		movea.l    8(a0),a0
		jsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,8(a1)
		movea.l    (a7),a0
		move.l     (a0),d0
		beq.s      Ate_create_3
		movea.l    (a7),a0
		move.l     4(a0),d0
		beq.s      Ate_create_3
		movea.l    (a7),a0
		move.l     8(a0),d0
		bne.s      Ate_create_4
Ate_create_3:
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        Ax_free
		movea.l    (a7),a0
		movea.l    4(a0),a0
		jsr        Ax_free
		movea.l    (a7),a0
		jsr        Ax_free
		suba.l     a0,a0
		bra.s      Ate_create_2
Ate_create_4:
		movea.l    (a7),a0
Ate_create_2:
		addq.w     #8,a7
		rts

	.globl Ate_delete
Ate_delete:
		subq.w     #4,a7
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Ate_delete_1
		bra.s      Ate_delete_2
Ate_delete_1:
		movea.l    (a7),a0
		movea.l    8(a0),a0
		jsr        Ast_delete
		movea.l    (a7),a0
		movea.l    4(a0),a0
		jsr        Ast_delete
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        Ast_delete
		moveq.l    #28,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
Ate_delete_2:
		addq.w     #4,a7
		rts

	.globl Aus_create
Aus_create:
		subq.w     #8,a7
		move.l     a0,4(a7)
		moveq.l    #32,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Aus_create_1
		suba.l     a0,a0
		bra.s      Aus_create_2
Aus_create_1:
		moveq.l    #32,d0
		movea.l    4(a7),a1
		movea.l    (a7),a0
		jsr        memcpy
		movea.l    4(a7),a0
		movea.l    24(a0),a0
		jsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,24(a1)
		movea.l    4(a7),a0
		movea.l    28(a0),a0
		jsr        Ast_create
		movea.l    (a7),a1
		move.l     a0,28(a1)
		movea.l    (a7),a0
Aus_create_2:
		addq.w     #8,a7
		rts

	.globl Aus_delete
Aus_delete:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		movea.l    28(a0),a0
		jsr        Ast_delete
		movea.l    (a7),a0
		movea.l    24(a0),a0
		jsr        Ast_delete
		moveq.l    #32,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		addq.w     #4,a7
		rts

	.globl Aob_fix
Aob_fix:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		movea.l    12(a7),a0
		move.w     10(a0),d0
		and.w      #$8000,d0
		beq.s      Aob_fix_1
		bra        Aob_fix_2
Aob_fix_1:
		movea.l    12(a7),a0
		ori.w      #$8000,10(a0)
Aob_fix_14:
		movea.l    12(a7),a0
		move.w     8(a0),d0
		and.w      #$8000,d0
		bne        Aob_fix_3
		movea.l    12(a7),a0
		move.b     7(a0),d0
		ext.w      d0
		sub.w      #$0017,d0
		beq        Aob_fix_4
		subq.w     #8,d0
		beq.s      Aob_fix_5
		subq.w     #2,d0
		beq.s      Aob_fix_6
		bra        Aob_fix_7
Aob_fix_5:
		movea.l    12(a7),a0
		jsr        Aob_icon
Aob_fix_6:
		movea.l    _globl,a1
		clr.w      d0
		movea.l    12(a7),a0
		jsr        mt_rsrc_obfix
		movea.l    12(a7),a0
		move.l     12(a0),(a7)
		movea.l    (a7),a0
		move.w     18(a0),d0
		movea.l    (a7),a0
		add.w      22(a0),d0
		move.w     d0,10(a7)
		movea.l    (a7),a0
		move.w     26(a0),d0
		movea.l    (a7),a0
		add.w      30(a0),d0
		move.w     d0,8(a7)
		move.w     8(a7),d0
		cmp.w      10(a7),d0
		ble.s      Aob_fix_8
		move.w     8(a7),10(a7)
Aob_fix_8:
		movea.l    12(a7),a0
		move.w     20(a0),d0
		cmp.w      10(a7),d0
		bge.s      Aob_fix_9
		movea.l    12(a7),a0
		move.w     10(a7),20(a0)
Aob_fix_9:
		movea.l    (a7),a0
		move.w     20(a0),d0
		movea.l    (a7),a0
		add.w      24(a0),d0
		move.w     d0,10(a7)
		movea.l    (a7),a0
		move.w     28(a0),d0
		movea.l    (a7),a0
		add.w      32(a0),d0
		move.w     d0,8(a7)
		move.w     8(a7),d0
		cmp.w      10(a7),d0
		ble.s      Aob_fix_10
		move.w     8(a7),10(a7)
Aob_fix_10:
		movea.l    12(a7),a0
		move.w     22(a0),d0
		cmp.w      10(a7),d0
		bge.s      Aob_fix_11
		movea.l    12(a7),a0
		move.w     10(a7),22(a0)
Aob_fix_11:
		bra.s      Aob_fix_3
Aob_fix_4:
		movea.l    _globl,a1
		clr.w      d0
		movea.l    12(a7),a0
		jsr        mt_rsrc_obfix
		movea.l    12(a7),a0
		move.l     12(a0),4(a7)
		movea.l    4(a7),a0
		move.w     4(a0),d0
		lsl.w      #3,d0
		move.w     d0,10(a7)
		movea.l    12(a7),a0
		move.w     20(a0),d0
		cmp.w      10(a7),d0
		bge.s      Aob_fix_12
		movea.l    12(a7),a0
		move.w     10(a7),20(a0)
Aob_fix_12:
		movea.l    12(a7),a0
		move.w     22(a0),d0
		movea.l    4(a7),a0
		cmp.w      6(a0),d0
		bge.s      Aob_fix_13
		movea.l    4(a7),a0
		movea.l    12(a7),a1
		move.w     6(a0),22(a1)
Aob_fix_13:
		bra.s      Aob_fix_3
Aob_fix_7:
		movea.l    _globl,a1
		clr.w      d0
		movea.l    12(a7),a0
		jsr        mt_rsrc_obfix
Aob_fix_3:
		moveq.l    #32,d0
		movea.l    12(a7),a0
		addi.l     #$00000018,12(a7)
		and.w      8(a0),d0
		beq        Aob_fix_14
Aob_fix_2:
		lea.l      16(a7),a7
		rts

	.globl Aob_icon
Aob_icon:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		movea.l    8(a7),a0
		move.l     12(a0),4(a7)
		movea.l    ACSblk,a0
		cmpi.w     #$0001,28(a0)
		ble.s      Aob_icon_1
		movea.l    4(a7),a0
		move.l     34(a0),d0
		beq.s      Aob_icon_1
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0330,(a0)
		ble.s      Aob_icon_2
		movea.l    ACSblk,a0
		movea.l    640(a0),a0
		cmpi.w     #$0350,(a0)
		blt.s      Aob_icon_3
Aob_icon_2:
		move.l     _globl,-(a7)
		pea.l      6(a7)
		pea.l      8(a7)
		lea.l      14(a7),a1
		lea.l      14(a7),a0
		moveq.l    #2,d0
		jsr        mt_appl_getinfo
		lea.l      12(a7),a7
		tst.w      d0
		beq.s      Aob_icon_1
		move.w     (a7),d0
		beq.s      Aob_icon_1
Aob_icon_3:
		movea.l    8(a7),a0
		move.w     #$0021,6(a0)
		bra.s      Aob_icon_4
Aob_icon_1:
		movea.l    8(a7),a0
		move.w     #$001F,6(a0)
Aob_icon_4:
		lea.l      12(a7),a7
		rts

	.globl Aob_offset
Aob_offset:
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		move.l     a1,18(a7)
		move.w     d0,16(a7)
		move.w     16(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    18(a7),a0
		adda.l     d0,a0
		move.l     a0,8(a7)
		clr.w      2(a7)
		movea.l    8(a7),a0
		move.b     7(a0),d0
		ext.w      d0
		sub.w      #$0014,d0
		cmp.w      #$000A,d0
		bhi        Aob_offset_1
		add.w      d0,d0
		move.w     J38(pc,d0.w),d0
		jmp        J38(pc,d0.w)
J38:
		dc.w Aob_offset_2-J38
		dc.w Aob_offset_3-J38
		dc.w Aob_offset_3-J38
		dc.w Aob_offset_1-J38
		dc.w Aob_offset_4-J38
		dc.w Aob_offset_2-J38
		dc.w Aob_offset_5-J38
		dc.w Aob_offset_2-J38
		dc.w Aob_offset_1-J38
		dc.w Aob_offset_3-J38
		dc.w Aob_offset_3-J38
Aob_offset_2:
		movea.l    8(a7),a0
		move.l     12(a0),d0
		moveq.l    #16,d1
		asr.l      d1,d0
		ext.w      d0
		neg.w      d0
		move.w     d0,2(a7)
		bra        Aob_offset_1
Aob_offset_3:
		movea.l    8(a7),a0
		movea.l    12(a0),a0
		move.w     22(a0),d0
		neg.w      d0
		move.w     d0,2(a7)
		bra        Aob_offset_1
Aob_offset_5:
		move.w     #$0001,2(a7)
		moveq.l    #4,d0
		movea.l    8(a7),a0
		and.w      8(a0),d0
		beq.s      Aob_offset_6
		move.w     #$0002,2(a7)
Aob_offset_6:
		movea.l    8(a7),a0
		move.w     8(a0),d0
		and.w      #$4002,d0
		beq.s      Aob_offset_7
		move.w     #$0003,2(a7)
Aob_offset_7:
		bra        Aob_offset_1
Aob_offset_4:
		movea.l    8(a7),a0
		move.l     12(a0),12(a7)
		movea.l    12(a7),a0
		movea.l    (a0),a0
		cmpa.l     #A_3Dbutton,a0
		bne.s      Aob_offset_8
		movea.l    12(a7),a0
		move.l     4(a0),d0
		moveq.l    #20,d1
		asr.l      d1,d0
		and.w      #$000F,d0
		move.w     d0,2(a7)
		cmpi.w     #$0007,2(a7)
		ble.s      Aob_offset_9
		addi.w     #$FFF0,2(a7)
Aob_offset_9:
		movea.l    12(a7),a0
		move.l     4(a0),d0
		moveq.l    #16,d1
		asr.l      d1,d0
		and.w      #$000F,d0
		move.w     d0,4(a7)
		move.w     4(a7),d0
		ble.s      Aob_offset_10
		movea.l    8(a7),a0
		move.w     8(a0),d0
		and.w      #$4002,d0
		beq.s      Aob_offset_10
		addq.w     #1,4(a7)
Aob_offset_10:
		moveq.l    #5,d0
		movea.l    8(a7),a0
		and.w      8(a0),d0
		subq.w     #5,d0
		bne.s      Aob_offset_11
		addq.w     #1,4(a7)
Aob_offset_11:
		move.w     4(a7),d0
		add.w      2(a7),d0
		move.w     d0,2(a7)
		bra.s      Aob_offset_1
Aob_offset_8:
		move.w     #$0001,2(a7)
Aob_offset_1:
		move.w     2(a7),d0
		bpl.s      Aob_offset_12
		clr.w      2(a7)
Aob_offset_12:
		moveq.l    #16,d0
		movea.l    8(a7),a0
		and.w      10(a0),d0
		beq.s      Aob_offset_13
		cmpi.w     #$0003,2(a7)
		bge.s      Aob_offset_13
		move.w     #$0003,2(a7)
Aob_offset_13:
		movea.l    8(a7),a0
		move.w     8(a0),d0
		and.w      #$4008,d0
		beq.s      Aob_offset_14
		cmpi.w     #$0003,2(a7)
		bge.s      Aob_offset_14
		move.w     #$0003,2(a7)
Aob_offset_14:
		clr.w      (a7)
		moveq.l    #32,d0
		movea.l    8(a7),a0
		and.w      10(a0),d0
		beq.s      Aob_offset_15
		move.w     2(a7),d0
		ble.s      Aob_offset_16
		move.w     2(a7),d0
		add.w      d0,d0
		move.w     d0,(a7)
		bra.s      Aob_offset_15
Aob_offset_16:
		move.w     2(a7),d0
		neg.w      d0
		add.w      d0,d0
		move.w     d0,(a7)
Aob_offset_15:
		movea.l    8(a7),a0
		move.w     16(a0),d0
		sub.w      2(a7),d0
		movea.l    22(a7),a0
		move.w     d0,(a0)
		movea.l    8(a7),a0
		move.w     18(a0),d0
		sub.w      2(a7),d0
		movea.l    22(a7),a0
		move.w     d0,2(a0)
		move.w     2(a7),d0
		add.w      d0,d0
		movea.l    8(a7),a0
		add.w      20(a0),d0
		add.w      (a7),d0
		movea.l    22(a7),a0
		move.w     d0,4(a0)
		move.w     2(a7),d0
		add.w      d0,d0
		movea.l    8(a7),a0
		add.w      22(a0),d0
		add.w      (a7),d0
		movea.l    22(a7),a0
		move.w     d0,6(a0)
		bra.w      Aob_offset_17
Aob_offset_20:
		move.w     16(a7),6(a7)
		move.w     6(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    18(a7),a0
		move.w     0(a0,d0.l),16(a7)
		cmpi.w     #$FFFF,16(a7)
		bne.s      Aob_offset_18
		bra.s      Aob_offset_19
Aob_offset_18:
		move.w     16(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    18(a7),a0
		move.w     6(a7),d1
		cmp.w      4(a0,d0.l),d1
		bne.s      Aob_offset_17
		move.w     16(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    18(a7),a0
		move.w     16(a0,d0.l),d0
		movea.l    22(a7),a0
		add.w      d0,(a0)
		move.w     16(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    18(a7),a0
		move.w     18(a0,d0.l),d0
		movea.l    22(a7),a0
		add.w      d0,2(a0)
Aob_offset_17:
		bra.w      Aob_offset_20
Aob_offset_19:
		lea.l      26(a7),a7
		rts

	.globl Aob_save
Aob_save:
		move.l     a2,-(a7)
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		movea.l    22(a7),a0
		move.w     (a0),d0
		bpl.s      Aob_save_1
		movea.l    22(a7),a0
		move.w     (a0),d0
		movea.l    22(a7),a0
		sub.w      d0,4(a0)
		movea.l    22(a7),a0
		clr.w      (a0)
Aob_save_1:
		movea.l    22(a7),a0
		move.w     2(a0),d0
		bpl.s      Aob_save_2
		movea.l    22(a7),a0
		move.w     2(a0),d0
		movea.l    22(a7),a0
		sub.w      d0,6(a0)
		movea.l    22(a7),a0
		clr.w      2(a0)
Aob_save_2:
		movea.l    22(a7),a0
		move.w     (a0),d0
		movea.l    22(a7),a0
		add.w      4(a0),d0
		movea.l    ACSblk,a0
		sub.w      12(a0),d0
		move.w     d0,(a7)
		move.w     (a7),d0
		ble.s      Aob_save_3
		move.w     (a7),d0
		movea.l    22(a7),a0
		sub.w      d0,4(a0)
Aob_save_3:
		movea.l    22(a7),a0
		move.w     2(a0),d0
		movea.l    22(a7),a0
		add.w      6(a0),d0
		movea.l    ACSblk,a0
		sub.w      10(a0),d0
		movea.l    ACSblk,a0
		sub.w      14(a0),d0
		move.w     d0,(a7)
		move.w     (a7),d0
		ble.s      Aob_save_4
		move.w     (a7),d0
		movea.l    22(a7),a0
		sub.w      d0,6(a0)
Aob_save_4:
		move.w     #$FFF8,d0
		movea.l    22(a7),a0
		and.w      (a0),d0
		move.w     d0,2(a7)
		movea.l    22(a7),a0
		move.w     2(a0),4(a7)
		movea.l    22(a7),a0
		move.w     (a0),d0
		movea.l    22(a7),a0
		add.w      4(a0),d0
		or.w       #$0007,d0
		move.w     d0,6(a7)
		movea.l    22(a7),a0
		move.w     2(a0),d0
		movea.l    22(a7),a0
		add.w      6(a0),d0
		subq.w     #1,d0
		move.w     d0,8(a7)
		movea.l    22(a7),a0
		move.w     6(a0),d1
		move.w     6(a7),d0
		sub.w      2(a7),d0
		addq.w     #1,d0
		jsr        Abp_create
		move.l     a0,18(a7)
		bne.s      Aob_save_5
		suba.l     a0,a0
		bra.s      Aob_save_6
Aob_save_5:
		clr.w      10(a7)
		clr.w      12(a7)
		move.w     6(a7),d0
		sub.w      2(a7),d0
		move.w     d0,14(a7)
		moveq.l    #-1,d0
		movea.l    22(a7),a0
		add.w      6(a0),d0
		move.w     d0,16(a7)
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0100,d0
		jsr        mt_graf_mouse
		move.l     18(a7),-(a7)
		movea.l    ACSblk,a1
		lea.l      618(a1),a1
		lea.l      6(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vro_cpyfm
		addq.w     #4,a7
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0101,d0
		jsr        mt_graf_mouse
		movea.l    18(a7),a0
Aob_save_6:
		lea.l      26(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aob_restore
Aob_restore:
		move.l     a2,-(a7)
		lea.l      -24(a7),a7
		move.l     a0,20(a7)
		move.l     a1,16(a7)
		lea.l      xe0c8e,a0
		lea.l      (a7),a1
		moveq.l    #15,d0
Aob_restore_1:
		move.b     (a0)+,(a1)+
		dbf        d0,Aob_restore_1
		move.l     20(a7),d0
		bne.s      Aob_restore_2
		movea.l    16(a7),a0
		moveq.l    #-1,d1
		movea.l    ACSblk,a1
		move.w     (a1),d0
		jsr        Aev_WmRedraw
		jsr        Aev_mess
		bra        Aob_restore_3
Aob_restore_2:
		move.w     #$FFF8,d0
		movea.l    16(a7),a0
		and.w      (a0),d0
		move.w     d0,8(a7)
		movea.l    16(a7),a0
		move.w     2(a0),10(a7)
		movea.l    16(a7),a0
		move.w     (a0),d0
		movea.l    16(a7),a0
		add.w      4(a0),d0
		or.w       #$0007,d0
		move.w     d0,12(a7)
		movea.l    16(a7),a0
		move.w     2(a0),d0
		movea.l    16(a7),a0
		add.w      6(a0),d0
		subq.w     #1,d0
		move.w     d0,14(a7)
		clr.w      (a7)
		clr.w      2(a7)
		move.w     12(a7),d0
		sub.w      8(a7),d0
		move.w     d0,4(a7)
		moveq.l    #-1,d0
		movea.l    16(a7),a0
		add.w      6(a0),d0
		move.w     d0,6(a7)
		lea.l      (a7),a0
		clr.w      d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0100,d0
		jsr        mt_graf_mouse
		movea.l    ACSblk,a0
		pea.l      618(a0)
		movea.l    24(a7),a1
		lea.l      4(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vro_cpyfm
		addq.w     #4,a7
		movea.l    _globl,a1
		suba.l     a0,a0
		move.w     #$0101,d0
		jsr        mt_graf_mouse
		movea.l    20(a7),a0
		jsr        Abp_delete
Aob_restore_3:
		lea.l      24(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aob_tobkey
Aob_tobkey:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.w     d0,10(a7)
		move.w     d1,8(a7)
		movea.l    12(a7),a0
		move.l     24(a0),4(a7)
		beq.s      Aob_tobkey_1
		movea.l    12(a7),a0
		move.w     86(a0),d0
		and.w      #$0800,d0
		beq.s      Aob_tobkey_2
Aob_tobkey_1:
		moveq.l    #-1,d0
		bra.s      Aob_tobkey_3
Aob_tobkey_2:
		move.w     8(a7),d1
		move.w     10(a7),d0
		movea.l    4(a7),a0
		jsr        Aob_key
		move.w     d0,2(a7)
		move.w     2(a7),d0
		bpl.s      Aob_tobkey_4
		moveq.l    #-1,d0
		bra.s      Aob_tobkey_3
Aob_tobkey_4:
		move.w     2(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		move.w     8(a0,d0.l),d0
		and.w      #$2000,d0
		beq.s      Aob_tobkey_5
		move.w     #$0001,(a7)
		bra.s      Aob_tobkey_6
Aob_tobkey_5:
		clr.w      (a7)
Aob_tobkey_6:
		move.w     (a7),d1
		move.w     2(a7),d0
		movea.l    4(a7),a1
		movea.l    12(a7),a0
		jsr        Aob_select
		tst.w      d0
		ble.s      Aob_tobkey_7
		move.w     2(a7),d0
		or.w       #$1000,d0
		bra.s      Aob_tobkey_3
Aob_tobkey_7:
		moveq.l    #-1,d0
Aob_tobkey_3:
		lea.l      16(a7),a7
		rts

	.globl Aob_wobkey
Aob_wobkey:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.w     d0,10(a7)
		move.w     d1,8(a7)
		movea.l    12(a7),a0
		move.l     20(a0),4(a7)
		move.l     4(a7),d0
		beq.s      Aob_wobkey_1
		movea.l    12(a7),a0
		move.w     86(a0),d0
		and.w      #$0800,d0
		beq.s      Aob_wobkey_2
Aob_wobkey_1:
		moveq.l    #-1,d0
		bra.s      Aob_wobkey_3
Aob_wobkey_2:
		move.w     8(a7),d1
		move.w     10(a7),d0
		movea.l    4(a7),a0
		jsr        Aob_key
		move.w     d0,2(a7)
		move.w     2(a7),d0
		bpl.s      Aob_wobkey_4
		moveq.l    #-1,d0
		bra.s      Aob_wobkey_3
Aob_wobkey_4:
		move.w     2(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		move.w     8(a0,d0.l),d0
		and.w      #$2000,d0
		beq.s      Aob_wobkey_5
		move.w     #$0001,(a7)
		bra.s      Aob_wobkey_6
Aob_wobkey_5:
		clr.w      (a7)
Aob_wobkey_6:
		move.w     (a7),d1
		move.w     2(a7),d0
		movea.l    4(a7),a1
		movea.l    12(a7),a0
		jsr        Aob_select
		tst.w      d0
		beq.s      Aob_wobkey_7
		move.w     2(a7),d0
		bra.s      Aob_wobkey_3
Aob_wobkey_7:
		moveq.l    #-1,d0
Aob_wobkey_3:
		lea.l      16(a7),a7
		rts

	.globl Aob_execute
Aob_execute:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.l     a1,12(a7)
		move.w     d0,10(a7)
		move.w     10(a7),(a7)
		move.w     10(a7),d0
		bpl.s      Aob_execute_1
		moveq.l    #-1,d0
		bra        Aob_execute_2
Aob_execute_1:
		move.w     10(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    12(a7),a0
		adda.l     d0,a0
		move.l     a0,2(a7)
		movea.l    2(a7),a0
		lea.l      24(a0),a0
		move.l     a0,6(a7)
		movea.l    16(a7),a0
		movea.l    12(a7),a1
		cmpa.l     24(a0),a1
		bne.s      Aob_execute_3
		ori.w      #$1000,(a7)
Aob_execute_3:
		moveq.l    #64,d0
		movea.l    2(a7),a0
		and.w      8(a0),d0
		beq.s      Aob_execute_4
		movea.l    6(a7),a0
		move.l     (a0),d0
		beq.s      Aob_execute_5
		movea.l    6(a7),a0
		move.w     8(a0),d0
		and.w      #$8000,d0
		bne.s      Aob_execute_4
Aob_execute_5:
		clr.w      d0
		bra        Aob_execute_2
Aob_execute_4:
		moveq.l    #5,d0
		movea.l    2(a7),a0
		and.w      8(a0),d0
		subq.w     #5,d0
		bne.s      Aob_execute_6
		moveq.l    #1,d0
		movea.l    2(a7),a0
		and.w      10(a0),d0
		bne.s      Aob_execute_6
		move.w     (a7),d0
		movea.l    16(a7),a0
		jsr        Adr_add
Aob_execute_6:
		moveq.l    #32,d0
		movea.l    2(a7),a0
		and.w      8(a0),d0
		bne        Aob_execute_7
		movea.l    6(a7),a0
		move.w     8(a0),d0
		and.w      #$8000,d0
		beq.w      Aob_execute_7
		movea.l    6(a7),a0
		move.l     (a0),d0
		beq.s      Aob_execute_7
		movea.l    ACSblk,a0
		move.l     16(a7),600(a0)
		movea.l    ACSblk,a0
		move.l     12(a7),604(a0)
		movea.l    ACSblk,a0
		move.w     10(a7),608(a0)
		moveq.l    #64,d0
		movea.l    2(a7),a0
		and.w      8(a0),d0
		beq.s      Aob_execute_8
		movea.l    6(a7),a0
		movea.l    (a0),a0
		jsr        (a0)
		bra.s      Aob_execute_9
Aob_execute_8:
		jsr        Amo_busy
		movea.l    6(a7),a0
		movea.l    (a0),a0
		jsr        (a0)
		jsr        Amo_unbusy
Aob_execute_9:
		movea.l    16(a7),a0
		movea.l    12(a7),a1
		cmpa.l     20(a0),a1
		beq.s      Aob_execute_7
		movea.l    16(a7),a0
		movea.l    12(a7),a1
		cmpa.l     24(a0),a1
		beq.s      Aob_execute_7
		moveq.l    #-1,d0
		bra.s      Aob_execute_2
Aob_execute_7:
		moveq.l    #5,d0
		movea.l    2(a7),a0
		and.w      8(a0),d0
		subq.w     #5,d0
		bne.s      Aob_execute_10
		moveq.l    #1,d0
		movea.l    2(a7),a0
		and.w      10(a0),d0
		beq.s      Aob_execute_10
		move.w     (a7),d0
		movea.l    16(a7),a0
		jsr        Adr_del
		moveq.l    #1,d0
		movea.l    2(a7),a0
		and.w      10(a0),d0
		beq.s      Aob_execute_10
		movea.l    2(a7),a0
		move.w     10(a0),d1
		and.w      #$FFFE,d1
		move.w     (a7),d0
		movea.l    16(a7),a0
		movea.l    16(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
Aob_execute_10:
		moveq.l    #1,d0
Aob_execute_2:
		lea.l      20(a7),a7
		rts

	.globl Aob_alias
Aob_alias:
		lea.l      -14(a7),a7
		movea.l    ACSblk,a0
		move.l     600(a0),10(a7)
		movea.l    ACSblk,a0
		move.l     604(a0),6(a7)
		movea.l    ACSblk,a0
		move.w     608(a0),(a7)
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		lea.l      24(a0,d0.l),a0
		move.l     a0,2(a7)
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		move.w     10(a0,d0.l),d0
		and.w      #$4000,d0
		beq.s      Aob_alias_1
		moveq.l    #1,d1
		bra.s      Aob_alias_2
Aob_alias_1:
		clr.w      d1
Aob_alias_2:
		movea.l    2(a7),a0
		move.w     14(a0),d0
		movea.l    6(a7),a1
		movea.l    10(a7),a0
		jsr        Aob_select
		movea.l    ACSblk,a0
		move.l     10(a7),600(a0)
		movea.l    ACSblk,a0
		move.l     6(a7),604(a0)
		movea.l    ACSblk,a0
		move.w     (a7),608(a0)
		lea.l      14(a7),a7
		rts

	.globl Aob_select
Aob_select:
		lea.l      -24(a7),a7
		move.l     a0,20(a7)
		move.l     a1,16(a7)
		move.w     d0,14(a7)
		move.w     d1,12(a7)
		clr.w      10(a7)
		movea.l    20(a7),a0
		movea.l    16(a7),a1
		cmpa.l     20(a0),a1
		bne.s      Aob_select_1
		move.w     14(a7),4(a7)
		bra.s      Aob_select_2
Aob_select_1:
		move.w     #$1000,d0
		or.w       14(a7),d0
		move.w     d0,4(a7)
Aob_select_2:
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		adda.l     d0,a0
		move.l     a0,(a7)
		move.w     #$0080,d0
		movea.l    (a7),a0
		and.w      8(a0),d0
		beq.s      Aob_select_3
		clr.w      d0
		bra        Aob_select_4
Aob_select_3:
		moveq.l    #8,d0
		movea.l    (a7),a0
		and.w      10(a0),d0
		beq.s      Aob_select_5
		clr.w      d0
		bra        Aob_select_4
Aob_select_5:
		move.w     12(a7),d0
		beq.s      Aob_select_6
		movea.l    (a7),a0
		ori.w      #$4000,10(a0)
		bra.s      Aob_select_7
Aob_select_6:
		movea.l    (a7),a0
		andi.w     #$BFFF,10(a0)
Aob_select_7:
		movea.l    (a7),a0
		move.w     8(a0),d0
		and.w      #$204D,d0
		subq.w     #8,d0
		bne.s      Aob_select_8
		movea.l    (a7),a0
		cmpi.b     #$18,7(a0)
		bne.s      Aob_select_8
		movea.l    20(a7),a0
		move.w     28(a0),d0
		cmp.w      14(a7),d0
		beq.s      Aob_select_9
		move.w     14(a7),d1
		movea.l    20(a7),a0
		move.w     28(a0),d0
		movea.l    20(a7),a0
		jsr        Awi_focuschg
		subq.w     #1,d0
		bne.s      Aob_select_10
Aob_select_9:
		move.w     14(a7),d0
		movea.l    16(a7),a1
		movea.l    20(a7),a0
		jsr        Aus_objboxed
Aob_select_10:
		clr.w      10(a7)
Aob_select_8:
		movea.l    (a7),a0
		move.w     8(a0),d0
		and.w      #$2000,d0
		beq.s      Aob_select_11
		move.w     12(a7),d0
		beq.s      Aob_select_12
		moveq.l    #4,d0
		movea.l    (a7),a0
		and.w      8(a0),d0
		beq.s      Aob_select_12
		jsr        Adr_unselect
		move.w     14(a7),d0
		movea.l    16(a7),a1
		movea.l    20(a7),a0
		bsr        Aob_execute
		bra.s      Aob_select_13
Aob_select_12:
		moveq.l    #1,d0
		movea.l    (a7),a0
		and.w      10(a0),d0
		beq.s      Aob_select_14
		move.w     4(a7),d0
		movea.l    20(a7),a0
		jsr        Adr_del
		bra.s      Aob_select_13
Aob_select_14:
		move.w     4(a7),d0
		movea.l    20(a7),a0
		jsr        Adr_add
Aob_select_13:
		moveq.l    #1,d0
		bra        Aob_select_4
Aob_select_11:
		movea.l    (a7),a0
		move.w     8(a0),d0
		or.w       #$FFEE,d0
		cmp.w      #$FFFF,d0
		bne        Aob_select_15
		moveq.l    #1,d0
		movea.l    (a7),a0
		and.w      10(a0),d0
		bne        Aob_select_16
		move.w     14(a7),d0
		movea.l    16(a7),a0
		jsr        Aob_up
		move.w     d0,8(a7)
		move.w     8(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		move.w     2(a0,d0.l),6(a7)
		bra        Aob_select_17
Aob_select_20:
		moveq.l    #16,d0
		move.w     6(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    16(a7),a0
		and.w      8(a0,d1.l),d0
		beq        Aob_select_18
		moveq.l    #1,d0
		move.w     6(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    16(a7),a0
		and.w      10(a0,d1.l),d0
		beq.s      Aob_select_18
		move.w     4(a7),d0
		and.w      #$1000,d0
		beq.s      Aob_select_19
		move.w     6(a7),d2
		ext.l      d2
		move.l     d2,d0
		add.l      d0,d0
		add.l      d2,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		move.w     10(a0,d0.l),d1
		and.w      #$FFFE,d1
		move.w     6(a7),d0
		or.w       #$1000,d0
		movea.l    20(a7),a0
		movea.l    20(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
		bra.s      Aob_select_18
Aob_select_19:
		move.w     6(a7),d2
		ext.l      d2
		move.l     d2,d0
		add.l      d0,d0
		add.l      d2,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		move.w     10(a0,d0.l),d1
		and.w      #$FFFE,d1
		move.w     6(a7),d0
		movea.l    20(a7),a0
		movea.l    20(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
Aob_select_18:
		move.w     6(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		move.w     0(a0,d0.l),6(a7)
Aob_select_17:
		move.w     6(a7),d0
		cmp.w      8(a7),d0
		bne        Aob_select_20
		moveq.l    #1,d1
		movea.l    (a7),a0
		or.w       10(a0),d1
		move.w     4(a7),d0
		movea.l    20(a7),a0
		movea.l    20(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
Aob_select_16:
		move.w     #$0001,10(a7)
Aob_select_15:
		moveq.l    #5,d0
		movea.l    (a7),a0
		and.w      8(a0),d0
		subq.w     #5,d0
		bne.s      Aob_select_21
		move.w     14(a7),d0
		movea.l    16(a7),a1
		movea.l    20(a7),a0
		bsr        Aob_execute
		moveq.l    #1,d0
		bra.w      Aob_select_4
Aob_select_21:
		moveq.l    #17,d0
		movea.l    (a7),a0
		and.w      8(a0),d0
		subq.w     #1,d0
		bne.s      Aob_select_22
		moveq.l    #1,d1
		movea.l    (a7),a0
		move.w     10(a0),d0
		eor.w      d0,d1
		move.w     4(a7),d0
		movea.l    20(a7),a0
		movea.l    20(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
		move.w     #$0001,10(a7)
Aob_select_22:
		moveq.l    #64,d0
		movea.l    (a7),a0
		and.w      8(a0),d0
		beq.s      Aob_select_23
		move.w     14(a7),d0
		movea.l    16(a7),a1
		movea.l    20(a7),a0
		bsr        Aob_execute
		tst.w      d0
		bne.s      Aob_select_24
		move.w     12(a7),d0
		beq.s      Aob_select_24
		movea.l    20(a7),a0
		move.w     84(a0),d0
		and.w      #$0100,d0
		beq.s      Aob_select_24
		movea.l    20(a7),a0
		movea.l    20(a7),a1
		movea.l    110(a1),a1
		jsr        (a1)
Aob_select_24:
		moveq.l    #1,d0
		bra.s      Aob_select_4
Aob_select_23:
		move.w     10(a7),d0
Aob_select_4:
		lea.l      24(a7),a7
		rts

	.globl Aob_watch
Aob_watch:
		lea.l      -40(a7),a7
		move.l     a0,36(a7)
		move.w     d0,34(a7)
		move.w     34(a7),d0
		and.w      #$1000,d0
		beq.s      Aob_watch_1
		movea.l    36(a7),a0
		move.l     24(a0),20(a7)
		move.w     34(a7),d0
		and.w      #$0FFF,d0
		move.w     d0,32(a7)
		bra.s      Aob_watch_2
Aob_watch_1:
		movea.l    36(a7),a0
		move.l     20(a0),20(a7)
		move.w     34(a7),32(a7)
Aob_watch_2:
		move.l     _globl,-(a7)
		pea.l      18(a7)
		lea.l      20(a7),a1
		move.w     40(a7),d0
		movea.l    28(a7),a0
		jsr        mt_objc_offset
		addq.w     #8,a7
		movea.l    36(a7),a0
		move.w     52(a0),d0
		add.w      d0,12(a7)
		movea.l    36(a7),a0
		move.w     54(a0),d0
		add.w      d0,14(a7)
		move.w     32(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    20(a7),a0
		move.w     20(a0,d0.l),16(a7)
		move.w     32(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    20(a7),a0
		move.w     22(a0,d0.l),18(a7)
		move.w     32(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    20(a7),a0
		move.w     6(a0,d0.l),d0
		and.w      #$00FF,d0
		move.w     d0,26(a7)
		cmp.w      #$001F,d0
		beq.s      Aob_watch_3
		cmpi.w     #$0021,26(a7)
		bne.s      Aob_watch_4
Aob_watch_3:
		move.w     32(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    20(a7),a0
		move.l     12(a0,d0.l),(a7)
		move.w     12(a7),d0
		movea.l    (a7),a0
		add.w      26(a0),d0
		move.w     d0,4(a7)
		move.w     14(a7),d0
		movea.l    (a7),a0
		add.w      28(a0),d0
		move.w     d0,6(a7)
		movea.l    (a7),a0
		move.w     30(a0),8(a7)
		movea.l    (a7),a0
		move.w     32(a0),10(a7)
		movea.l    (a7),a0
		move.w     18(a0),d0
		add.w      d0,12(a7)
		movea.l    (a7),a0
		move.w     20(a0),d0
		add.w      d0,14(a7)
		movea.l    (a7),a0
		move.w     22(a0),16(a7)
		movea.l    (a7),a0
		move.w     24(a0),18(a7)
		bra.s      Aob_watch_5
Aob_watch_4:
		moveq.l    #8,d0
		lea.l      12(a7),a1
		lea.l      4(a7),a0
		jsr        memcpy
Aob_watch_5:
		moveq.l    #1,d1
		move.w     32(a7),d2
		ext.l      d2
		move.l     d2,d0
		add.l      d0,d0
		add.l      d2,d0
		lsl.l      #3,d0
		movea.l    20(a7),a0
		or.w       10(a0,d0.l),d1
		move.w     34(a7),d0
		movea.l    36(a7),a0
		movea.l    36(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
		move.w     #$0001,24(a7)
		clr.w      d0
		movea.l    ACSblk,a0
		move.w     d0,612(a0)
		movea.l    ACSblk,a0
		move.w     d0,610(a0)
		bra        Aob_watch_6
Aob_watch_12:
		moveq.l    #3,d0
		jsr        Awi_update
		move.l     _globl,-(a7)
		pea.l      34(a7)
		pea.l      38(a7)
		pea.l      42(a7)
		pea.l      46(a7)
		movea.l    ACSblk,a0
		pea.l      612(a0)
		clr.l      -(a7)
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
		clr.w      -(a7)
		movea.l    ACSblk,a1
		lea.l      610(a1),a1
		suba.l     a0,a0
		moveq.l    #3,d2
		moveq.l    #1,d1
		moveq.l    #6,d0
		jsr        mt_evnt_multi
		lea.l      50(a7),a7
		move.w     d0,28(a7)
		moveq.l    #2,d0
		jsr        Awi_update
		moveq.l    #2,d0
		and.w      28(a7),d0
		beq.s      Aob_watch_7
		bra        Aob_watch_8
Aob_watch_7:
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		lea.l      12(a7),a0
		jsr        Aob_within
		tst.w      d0
		bne.s      Aob_watch_9
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		lea.l      4(a7),a0
		jsr        Aob_within
		tst.w      d0
		beq.s      Aob_watch_10
Aob_watch_9:
		move.w     24(a7),d0
		bne.s      Aob_watch_11
		move.w     #$0001,24(a7)
		moveq.l    #1,d1
		move.w     32(a7),d2
		ext.l      d2
		move.l     d2,d0
		add.l      d0,d0
		add.l      d2,d0
		lsl.l      #3,d0
		movea.l    20(a7),a0
		or.w       10(a0,d0.l),d1
		move.w     34(a7),d0
		movea.l    36(a7),a0
		movea.l    36(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
Aob_watch_11:
		bra.s      Aob_watch_6
Aob_watch_10:
		move.w     24(a7),d0
		beq.s      Aob_watch_6
		clr.w      24(a7)
		move.w     32(a7),d2
		ext.l      d2
		move.l     d2,d0
		add.l      d0,d0
		add.l      d2,d0
		lsl.l      #3,d0
		movea.l    20(a7),a0
		move.w     10(a0,d0.l),d1
		and.w      #$FFFE,d1
		move.w     34(a7),d0
		movea.l    36(a7),a0
		movea.l    36(a7),a1
		movea.l    102(a1),a1
		jsr        (a1)
Aob_watch_6:
		bra        Aob_watch_12
Aob_watch_8:
		move.w     24(a7),d0
		lea.l      40(a7),a7
		rts

	.globl Aev_release
Aev_release:
		subq.w     #4,a7
Aev_release_1:
		moveq.l    #3,d0
		jsr        Awi_update
		move.l     _globl,-(a7)
		pea.l      6(a7)
		pea.l      10(a7)
		pea.l      14(a7)
		pea.l      18(a7)
		pea.l      22(a7)
		moveq.l    #10,d0
		move.l     d0,-(a7)
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
		lea.l      52(a7),a1
		suba.l     a0,a0
		moveq.l    #3,d2
		moveq.l    #1,d1
		moveq.l    #34,d0
		jsr        mt_evnt_multi
		lea.l      50(a7),a7
		move.w     d0,(a7)
		moveq.l    #2,d0
		jsr        Awi_update
		moveq.l    #2,d0
		and.w      (a7),d0
		beq.s      Aev_release_1
		addq.w     #4,a7
		rts

	.globl Aob_key
Aob_key:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.w     d1,6(a7)
		move.b     7(a7),d0
		ext.w      d0
		jsr        isprint
		tst.w      d0
		beq.s      Aob_key_1
		moveq.l    #-1,d0
		and.b      7(a7),d0
		jsr        Ach_toupper
		ext.w      d0
		move.w     6(a7),d1
		and.w      #$FF00,d1
		or.w       d1,d0
		move.w     d0,6(a7)
Aob_key_1:
		move.w     6(a7),d0
		and.w      #$1300,d0
		beq.s      Aob_key_2
		move.w     6(a7),d0
		or.w       #$0300,d0
		and.w      #$EFFF,d0
		move.w     d0,6(a7)
Aob_key_2:
		andi.w     #$9FFF,6(a7)
		clr.w      2(a7)
		bra        Aob_key_3
Aob_key_13:
		move.w     2(a7),d0
		bpl.s      Aob_key_4
		clr.w      4(a7)
		bra.s      Aob_key_5
Aob_key_4:
		move.w     #$0080,d0
		move.w     2(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    8(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      Aob_key_6
		move.w     #$FFFF,4(a7)
		bra.s      Aob_key_5
Aob_key_6:
		move.w     2(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		move.w     2(a0,d0.l),4(a7)
Aob_key_5:
		move.w     4(a7),d0
		bpl.s      Aob_key_7
		move.w     2(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		move.w     0(a0,d0.l),4(a7)
		bra.s      Aob_key_8
Aob_key_9:
		move.w     4(a7),2(a7)
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		move.w     0(a0,d0.l),4(a7)
Aob_key_8:
		move.w     4(a7),d0
		bmi.s      Aob_key_7
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		move.w     2(a7),d1
		cmp.w      4(a0,d0.l),d1
		beq.s      Aob_key_9
Aob_key_7:
		move.w     4(a7),d0
		bmi.s      Aob_key_10
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		move.w     32(a0,d0.l),d0
		and.w      #$8000,d0
		beq.s      Aob_key_11
		moveq.l    #8,d0
		move.w     4(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    8(a7),a0
		and.w      10(a0,d1.l),d0
		bne.s      Aob_key_11
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    8(a7),a0
		move.w     34(a0,d0.l),(a7)
		beq.s      Aob_key_11
		move.w     (a7),d0
		cmp.w      6(a7),d0
		bne.s      Aob_key_11
Aob_key_10:
		move.w     4(a7),d0
		bra.s      Aob_key_12
Aob_key_11:
		move.w     4(a7),2(a7)
Aob_key_3:
		bra        Aob_key_13
Aob_key_12:
		lea.l      12(a7),a7
		rts

	.globl Aob_findflag
Aob_findflag:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.w     d1,2(a7)
		bra        Aob_findflag_1
Aob_findflag_11:
		move.w     4(a7),d0
		bpl.s      Aob_findflag_2
		clr.w      (a7)
		bra.s      Aob_findflag_3
Aob_findflag_2:
		move.w     #$0080,d0
		move.w     4(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    6(a7),a0
		and.w      8(a0,d1.l),d0
		beq.s      Aob_findflag_4
		move.w     #$FFFF,(a7)
		bra.s      Aob_findflag_3
Aob_findflag_4:
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		move.w     2(a0,d0.l),(a7)
Aob_findflag_3:
		move.w     (a7),d0
		bpl.s      Aob_findflag_5
		move.w     4(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		move.w     0(a0,d0.l),(a7)
		bra.s      Aob_findflag_6
Aob_findflag_7:
		move.w     (a7),4(a7)
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		move.w     0(a0,d0.l),(a7)
Aob_findflag_6:
		move.w     (a7),d0
		bmi.s      Aob_findflag_5
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		move.w     4(a7),d1
		cmp.w      4(a0,d0.l),d1
		beq.s      Aob_findflag_7
Aob_findflag_5:
		move.w     (a7),d0
		bmi.s      Aob_findflag_8
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		move.w     8(a0,d0.l),d0
		and.w      2(a7),d0
		beq.s      Aob_findflag_9
Aob_findflag_8:
		move.w     (a7),d0
		bra.s      Aob_findflag_10
Aob_findflag_9:
		move.w     (a7),4(a7)
Aob_findflag_1:
		bra        Aob_findflag_11
Aob_findflag_10:
		lea.l      10(a7),a7
		rts

	.globl Aob_up
Aob_up:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.w     4(a7),2(a7)
Aob_up_4:
		move.w     2(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		move.w     0(a0,d0.l),(a7)
		move.w     (a7),d0
		bpl.s      Aob_up_1
		moveq.l    #-1,d0
		bra.s      Aob_up_2
Aob_up_1:
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    6(a7),a0
		move.w     4(a0,d0.l),d0
		cmp.w      2(a7),d0
		bne.s      Aob_up_3
		move.w     (a7),d0
		bra.s      Aob_up_2
Aob_up_3:
		move.w     (a7),2(a7)
		bra.s      Aob_up_4
Aob_up_2:
		lea.l      10(a7),a7
		rts

	.globl Aob_printf
Aob_printf:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.w     d0,8(a7)
		move.l     a1,4(a7)
		lea.l      18(a7),a0
		move.l     a0,(a7)
		move.l     (a7),-(a7)
		movea.l    8(a7),a1
		lea.l      ob_inout,a0
		jsr        vsprintf
		addq.w     #4,a7
		lea.l      ob_inout,a1
		move.w     8(a7),d0
		movea.l    10(a7),a0
		jsr        Aob_puttext
		lea.l      14(a7),a7
		rts

	.globl Aob_puttext
Aob_puttext:
		move.l     a2,-(a7)
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.w     d0,12(a7)
		move.l     a1,8(a7)
		move.w     12(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    14(a7),a0
		move.b     7(a0,d0.l),d0
		ext.w      d0
		sub.w      #$0015,d0
		cmp.w      #$000C,d0
		bhi        Aob_puttext_1
		add.w      d0,d0
		move.w     J39(pc,d0.w),d0
		jmp        J39(pc,d0.w)
J39:
		dc.w Aob_puttext_2-J39
		dc.w Aob_puttext_2-J39
		dc.w Aob_puttext_1-J39
		dc.w Aob_puttext_3-J39
		dc.w Aob_puttext_1-J39
		dc.w Aob_puttext_4-J39
		dc.w Aob_puttext_1-J39
		dc.w Aob_puttext_4-J39
		dc.w Aob_puttext_2-J39
		dc.w Aob_puttext_2-J39
		dc.w Aob_puttext_5-J39
		dc.w Aob_puttext_4-J39
		dc.w Aob_puttext_5-J39
Aob_puttext_2:
		move.w     12(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    14(a7),a0
		move.l     12(a0,d0.l),(a7)
		movea.l    (a7),a0
		move.w     24(a0),d0
		ext.l      d0
		movea.l    8(a7),a1
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        strncpy
		movea.l    (a7),a0
		move.w     24(a0),d0
		movea.l    (a7),a0
		movea.l    (a0),a0
		clr.b      -1(a0,d0.w)
		bra        Aob_puttext_1
Aob_puttext_4:
		movea.l    8(a7),a1
		move.w     12(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    14(a7),a0
		movea.l    12(a0,d0.l),a0
		jsr        strcpy
		bra.s      Aob_puttext_1
Aob_puttext_5:
		movea.l    8(a7),a1
		move.w     12(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    14(a7),a0
		movea.l    12(a0,d0.l),a0
		movea.l    8(a0),a0
		jsr        strcpy
		bra.s      Aob_puttext_1
Aob_puttext_3:
		move.w     12(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    14(a7),a0
		move.l     12(a0,d0.l),4(a7)
		movea.l    8(a7),a1
		moveq.l    #4,d0
		move.w     12(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    14(a7),a0
		adda.l     d1,a0
		movea.l    4(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		nop
Aob_puttext_1:
		lea.l      18(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aob_scanf
Aob_scanf:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.w     d0,14(a7)
		move.l     a1,10(a7)
		lea.l      ob_inout,a1
		move.w     14(a7),d0
		movea.l    16(a7),a0
		jsr        Aob_gettext
		move.w     d0,4(a7)
		move.l     10(a7),d0
		beq        Aob_scanf_1
		move.b     ob_inout,d0
		bne.w      Aob_scanf_2
		moveq.l    #37,d0
		movea.l    10(a7),a0
		jsr        strchr
		move.l     a0,(a7)
		beq.s      Aob_scanf_2
		addq.l     #1,(a7)
		bra.s      Aob_scanf_3
Aob_scanf_4:
		addq.l     #1,(a7)
Aob_scanf_3:
		movea.l    (a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        isdigit
		tst.w      d0
		bne.s      Aob_scanf_4
		movea.l    (a7),a0
		cmpi.b     #$68,(a0)
		beq.s      Aob_scanf_5
		movea.l    (a7),a0
		cmpi.b     #$6C,(a0)
		beq.s      Aob_scanf_5
		movea.l    (a7),a0
		cmpi.b     #$4C,(a0)
		bne.s      Aob_scanf_6
Aob_scanf_5:
		addq.l     #1,(a7)
Aob_scanf_6:
		movea.l    (a7),a0
		cmpi.b     #$64,(a0)
		beq.s      Aob_scanf_7
		movea.l    (a7),a0
		cmpi.b     #$6F,(a0)
		beq.s      Aob_scanf_7
		movea.l    (a7),a0
		cmpi.b     #$69,(a0)
		beq.s      Aob_scanf_7
		movea.l    (a7),a0
		cmpi.b     #$75,(a0)
		beq.s      Aob_scanf_7
		movea.l    (a7),a0
		cmpi.b     #$78,(a0)
		bne.s      Aob_scanf_2
Aob_scanf_7:
		lea.l      xe0c9e,a1
		lea.l      ob_inout,a0
		jsr        strcpy
Aob_scanf_2:
		lea.l      24(a7),a0
		move.l     a0,6(a7)
		move.l     6(a7),-(a7)
		movea.l    14(a7),a1
		lea.l      ob_inout,a0
		jsr        vsscanf
		addq.w     #4,a7
Aob_scanf_1:
		move.w     4(a7),d0
		lea.l      20(a7),a7
		rts

	.globl Aob_gettext
Aob_gettext:
		move.l     a2,-(a7)
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.w     d0,14(a7)
		move.l     a1,10(a7)
		move.w     #$FFFF,4(a7)
		clr.l      (a7)
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		move.b     7(a0,d0.l),d0
		ext.w      d0
		sub.w      #$0015,d0
		cmp.w      #$000C,d0
		bhi        Aob_gettext_1
		add.w      d0,d0
		move.w     J40(pc,d0.w),d0
		jmp        J40(pc,d0.w)
J40:
		dc.w Aob_gettext_2-J40
		dc.w Aob_gettext_2-J40
		dc.w Aob_gettext_1-J40
		dc.w Aob_gettext_3-J40
		dc.w Aob_gettext_1-J40
		dc.w Aob_gettext_4-J40
		dc.w Aob_gettext_1-J40
		dc.w Aob_gettext_4-J40
		dc.w Aob_gettext_2-J40
		dc.w Aob_gettext_2-J40
		dc.w Aob_gettext_5-J40
		dc.w Aob_gettext_4-J40
		dc.w Aob_gettext_5-J40
Aob_gettext_2:
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		movea.l    12(a0,d0.l),a0
		move.w     24(a0),4(a7)
		move.l     10(a7),d0
		beq.s      Aob_gettext_6
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		movea.l    12(a0,d0.l),a0
		movea.l    (a0),a1
		movea.l    10(a7),a0
		jsr        strcpy
Aob_gettext_6:
		bra        Aob_gettext_1
Aob_gettext_5:
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		movea.l    12(a0,d0.l),a0
		movea.l    8(a0),a0
		jsr        strlen
		move.w     d0,4(a7)
		move.l     10(a7),d0
		beq.s      Aob_gettext_7
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		movea.l    12(a0,d0.l),a0
		movea.l    8(a0),a1
		movea.l    10(a7),a0
		jsr        strcpy
Aob_gettext_7:
		bra        Aob_gettext_1
Aob_gettext_4:
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		movea.l    12(a0,d0.l),a0
		jsr        strlen
		move.w     d0,4(a7)
		move.l     10(a7),d0
		beq.s      Aob_gettext_8
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		movea.l    12(a0,d0.l),a1
		movea.l    10(a7),a0
		jsr        strcpy
Aob_gettext_8:
		bra.s      Aob_gettext_1
Aob_gettext_3:
		move.w     14(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    16(a7),a0
		move.l     12(a0,d0.l),6(a7)
		lea.l      (a7),a1
		moveq.l    #3,d0
		move.w     14(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    16(a7),a0
		adda.l     d1,a0
		movea.l    6(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		move.l     (a7),d0
		beq.s      Aob_gettext_9
		movea.l    (a7),a0
		jsr        strlen
		move.w     d0,4(a7)
		move.l     10(a7),d0
		beq.s      Aob_gettext_9
		movea.l    (a7),a1
		movea.l    10(a7),a0
		jsr        strcpy
Aob_gettext_9:
		nop
Aob_gettext_1:
		move.w     4(a7),d0
		lea.l      20(a7),a7
		movea.l    (a7)+,a2
		rts

	.data

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
xe0c8e:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe0c9e:
		dc.b '0 0 0 0 0 0 0 0 0 0',0
	.even

	.bss

ob_inout: ds.b 1024
col: ds.l 1
