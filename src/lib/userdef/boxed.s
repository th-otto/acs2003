		.text

boxed_insert:
		move.l     a2,-(a7)
		lea.l      -296(a7),a7
		move.l     a0,292(a7)
		move.l     a1,288(a7)
		move.w     d0,286(a7)
		move.w     #$FFFF,20(a7)
		movea.l    292(a7),a0
		move.l     12(a0),12(a7)
		movea.l    12(a7),a0
		move.l     16(a0),8(a7)
		movea.l    8(a7),a0
		move.l     516(a0),4(a7)
		movea.l    12(a7),a0
		addq.w     #4,a0
		move.l     a0,(a7)
		move.l     4(a7),d0
		beq.s      boxed_insert_1
		movea.l    4(a7),a0
		move.w     28(a0),d0
		movea.l    8(a7),a0
		cmp.w      524(a0),d0
		bne.s      boxed_insert_1
		movea.l    8(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),20(a7)
		movea.l    8(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),22(a7)
boxed_insert_1:
		move.w     20(a7),d0
		bpl.s      boxed_insert_2
		clr.w      20(a7)
		movea.l    8(a7),a0
		move.w     526(a0),22(a7)
boxed_insert_2:
		move.w     22(a7),d0
		ble.s      boxed_insert_3
		move.w     22(a7),d1
		move.w     20(a7),d0
		movea.l    292(a7),a0
		jsr        boxed_delsel
boxed_insert_3:
		movea.l    (a7),a0
		move.w     2(a0),d0
		lsr.w      #8,d0
		and.w      #$00FF,d0
		move.w     d0,18(a7)
		movea.l    288(a7),a0
		jsr        strlen
		move.w     d0,24(a7)
		movea.l    8(a7),a0
		move.w     526(a0),d0
		add.w      24(a7),d0
		cmp.w      18(a7),d0
		ble.s      boxed_insert_4
		move.w     18(a7),d0
		movea.l    8(a7),a0
		sub.w      526(a0),d0
		move.w     d0,24(a7)
boxed_insert_4:
		move.w     24(a7),d0
		ble        boxed_insert_5
		pea.l      24(a7)
		pea.l      30(a7)
		movea.l    296(a7),a1
		movea.l    300(a7),a0
		jsr        boxed_checktext
		addq.w     #8,a7
		tst.w      d0
		beq        boxed_insert_5
		move.w     20(a7),d0
		movea.l    8(a7),a0
		adda.w     d0,a0
		lea.l      256(a0),a0
		move.l     a0,282(a7)
		movea.l    8(a7),a0
		move.w     526(a0),d0
		move.w     20(a7),d1
		add.w      24(a7),d1
		sub.w      d1,d0
		addq.w     #1,d0
		move.w     d0,16(a7)
		move.w     16(a7),d0
		bgt.s      boxed_insert_6
		lea.l      26(a7),a1
		movea.l    282(a7),a0
		jsr        strcpy
		bra.s      boxed_insert_7
boxed_insert_6:
		bra.s      boxed_insert_8
boxed_insert_9:
		move.w     16(a7),d0
		movea.l    282(a7),a0
		move.w     16(a7),d1
		add.w      24(a7),d1
		movea.l    282(a7),a1
		move.b     0(a0,d0.w),0(a1,d1.w)
		subq.w     #1,16(a7)
boxed_insert_8:
		move.w     16(a7),d0
		bpl.s      boxed_insert_9
		move.w     24(a7),d0
		ext.l      d0
		lea.l      26(a7),a1
		movea.l    282(a7),a0
		jsr        memcpy
boxed_insert_7:
		move.l     4(a7),d0
		beq        boxed_insert_10
		movea.l    8(a7),a0
		move.w     524(a0),d0
		movea.l    4(a7),a0
		cmp.w      28(a0),d0
		bne        boxed_insert_10
		movea.l    8(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		bmi        boxed_insert_10
		move.w     286(a7),d0
		beq.s      boxed_insert_11
		movea.l    8(a7),a0
		movea.l    532(a0),a0
		move.w     24(a7),(a0)
		move.w     24(a7),d0
		ext.l      d0
		movea.l    8(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d1
		movea.l    8(a7),a1
		adda.w     d1,a1
		lea.l      256(a1),a1
		movea.l    8(a7),a0
		jsr        memcpy
		move.w     24(a7),d0
		movea.l    8(a7),a0
		clr.b      0(a0,d0.w)
		bra.s      boxed_insert_12
boxed_insert_11:
		movea.l    8(a7),a1
		lea.l      256(a1),a1
		movea.l    8(a7),a0
		jsr        strcpy
		movea.l    8(a7),a0
		movea.l    528(a0),a0
		addq.w     #1,(a0)
boxed_insert_12:
		move.w     24(a7),d0
		movea.l    8(a7),a0
		add.w      d0,526(a0)
		movea.l    292(a7),a0
		jsr        boxed_postcheck
		moveq.l    #-1,d0
		movea.l    292(a7),a0
		jsr        boxed_viewpos
		bra.s      boxed_insert_13
boxed_insert_10:
		movea.l    8(a7),a1
		lea.l      256(a1),a1
		movea.l    8(a7),a0
		jsr        strcpy
		move.w     24(a7),d0
		movea.l    8(a7),a0
		add.w      d0,526(a0)
		movea.l    292(a7),a0
		jsr        boxed_postcheck
boxed_insert_13:
		movea.l    8(a7),a0
		ori.w      #$0004,546(a0)
		move.l     4(a7),d0
		beq.s      boxed_insert_5
		suba.l     a1,a1
		moveq.l    #26,d0
		movea.l    4(a7),a0
		movea.l    4(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
boxed_insert_5:
		lea.l      296(a7),a7
		movea.l    (a7)+,a2
		rts

boxed_within:
		lea.l      -14(a7),a7
		move.b     d0,12(a7)
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		clr.w      2(a7)
		movea.l    8(a7),a0
		jsr        strlen
		asr.w      #1,d0
		move.w     d0,(a7)
		bra.s      boxed_within_1
boxed_within_4:
		move.w     2(a7),d0
		movea.l    8(a7),a0
		move.b     12(a7),d1
		cmp.b      0(a0,d0.w),d1
		bcs.s      boxed_within_2
		move.w     2(a7),d0
		movea.l    8(a7),a0
		move.b     12(a7),d1
		cmp.b      1(a0,d0.w),d1
		bhi.s      boxed_within_2
		moveq.l    #1,d0
		bra.s      boxed_within_3
boxed_within_2:
		subq.w     #1,(a7)
		addq.w     #2,2(a7)
boxed_within_1:
		move.w     (a7),d0
		bgt.s      boxed_within_4
		move.l     4(a7),d0
		beq.s      boxed_within_5
		clr.w      d0
		move.b     12(a7),d0
		movea.l    4(a7),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      boxed_within_5
		moveq.l    #1,d0
		bra.s      boxed_within_3
boxed_within_5:
		clr.w      d0
boxed_within_3:
		lea.l      14(a7),a7
		rts

boxed_findsep:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.b     d0,4(a7)
		move.l     a1,(a7)
		moveq.l    #0,d0
		movea.l    (a7),a0
		move.l     d0,4(a0)
		movea.l    (a7),a0
		move.l     d0,(a0)
		move.b     4(a7),d0
		ext.w      d0
		movea.l    6(a7),a0
		jsr        strchr
		movea.l    (a7),a1
		move.l     a0,(a1)
		movea.l    (a7),a0
		move.l     (a0),d0
		beq.s      boxed_findsep_1
		move.b     4(a7),d0
		ext.w      d0
		movea.l    (a7),a0
		movea.l    (a0),a0
		addq.w     #1,a0
		jsr        strchr
		movea.l    (a7),a1
		move.l     a0,4(a1)
boxed_findsep_1:
		lea.l      10(a7),a7
		rts

boxed_checktext:
		move.l     a2,-(a7)
		lea.l      -50(a7),a7
		move.l     a0,46(a7)
		move.l     a1,42(a7)
		move.w     #$FFFF,40(a7)
		clr.w      38(a7)
		clr.b      16(a7)
		movea.l    58(a7),a0
		clr.b      (a0)
		movea.l    46(a7),a0
		move.l     12(a0),4(a7)
		movea.l    4(a7),a0
		move.l     16(a0),12(a7)
		movea.l    4(a7),a0
		addq.w     #4,a0
		move.l     a0,(a7)
		movea.l    12(a7),a0
		move.l     516(a0),8(a7)
		move.l     8(a7),d0
		beq.s      boxed_checktext_1
		movea.l    8(a7),a0
		move.w     28(a0),d0
		movea.l    12(a7),a0
		cmp.w      524(a0),d0
		bne.s      boxed_checktext_1
		movea.l    12(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),40(a7)
boxed_checktext_1:
		move.w     40(a7),d0
		bpl.s      boxed_checktext_2
		movea.l    12(a7),a0
		move.w     526(a0),40(a7)
boxed_checktext_2:
		movea.l    62(a7),a0
		move.w     (a0),34(a7)
		bgt.s      boxed_checktext_3
		clr.w      d0
		bra        boxed_checktext_4
boxed_checktext_3:
		movea.l    (a7),a0
		move.w     2(a0),d0
		lsr.w      #3,d0
		and.w      #$0001,d0
		beq.s      boxed_checktext_5
		moveq.l    #1,d0
		bra.s      boxed_checktext_6
boxed_checktext_5:
		clr.w      d0
boxed_checktext_6:
		move.w     d0,32(a7)
		move.l     58(a7),26(a7)
		clr.w      36(a7)
		movea.l    12(a7),a0
		move.l     512(a0),d0
		beq.s      boxed_checktext_7
		bra.s      boxed_checktext_8
boxed_checktext_10:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_8:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		bge.s      boxed_checktext_9
		move.w     36(a7),d0
		movea.l    42(a7),a0
		clr.w      d1
		move.b     0(a0,d0.w),d1
		move.w     d1,d0
		movea.l    12(a7),a0
		movea.l    512(a0),a0
		jsr        strchr
		move.l     a0,d0
		bne.s      boxed_checktext_10
boxed_checktext_9:
		bra        boxed_checktext_11
boxed_checktext_7:
		movea.l    (a7),a0
		move.w     (a0),d0
		lsr.w      #3,d0
		and.w      #$001F,d0
		cmp.w      #$001A,d0
		bhi        boxed_checktext_11
		add.w      d0,d0
		move.w     J53(pc,d0.w),d0
		jmp        J53(pc,d0.w)
J53:
		dc.w boxed_checktext_12-J53
		dc.w boxed_checktext_12-J53
		dc.w boxed_checktext_13-J53
		dc.w boxed_checktext_14-J53
		dc.w boxed_checktext_15-J53
		dc.w boxed_checktext_16-J53
		dc.w boxed_checktext_17-J53
		dc.w boxed_checktext_18-J53
		dc.w boxed_checktext_19-J53
		dc.w boxed_checktext_20-J53
		dc.w boxed_checktext_21-J53
		dc.w boxed_checktext_22-J53
		dc.w boxed_checktext_23-J53
		dc.w boxed_checktext_24-J53
		dc.w boxed_checktext_25-J53
		dc.w boxed_checktext_26-J53
		dc.w boxed_checktext_27-J53
		dc.w boxed_checktext_28-J53
		dc.w boxed_checktext_29-J53
		dc.w boxed_checktext_30-J53
		dc.w boxed_checktext_31-J53
		dc.w boxed_checktext_32-J53
		dc.w boxed_checktext_31-J53
		dc.w boxed_checktext_32-J53
		dc.w boxed_checktext_33-J53
		dc.w boxed_checktext_33-J53
		dc.w boxed_checktext_33-J53
boxed_checktext_12:
		move.w     34(a7),d0
		sub.w      36(a7),d0
		ext.l      d0
		move.w     36(a7),d1
		movea.l    42(a7),a1
		adda.w     d1,a1
		movea.l    26(a7),a0
		jsr        strncpy
		move.w     34(a7),d0
		sub.w      36(a7),d0
		ext.l      d0
		add.l      d0,26(a7)
		bra        boxed_checktext_11
boxed_checktext_13:
		bra.s      boxed_checktext_34
boxed_checktext_36:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_34:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		bge.s      boxed_checktext_35
		move.w     36(a7),d0
		movea.l    42(a7),a0
		clr.w      d1
		move.b     0(a0,d0.w),d1
		move.w     d1,d0
		lea.l      xe1efe,a0
		jsr        strchr
		move.l     a0,d0
		beq.s      boxed_checktext_36
boxed_checktext_35:
		bra        boxed_checktext_11
boxed_checktext_14:
		move.w     #$0001,32(a7)
		bra.s      boxed_checktext_37
boxed_checktext_39:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_37:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		bge.s      boxed_checktext_38
		lea.l      xe1f08,a1
		lea.l      xe1f01,a0
		move.w     36(a7),d1
		movea.l    42(a7),a2
		move.b     0(a2,d1.w),d0
		bsr        boxed_within
		tst.w      d0
		bne.s      boxed_checktext_39
boxed_checktext_38:
		bra        boxed_checktext_11
boxed_checktext_15:
		move.w     #$0001,32(a7)
		bra.s      boxed_checktext_40
boxed_checktext_42:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_40:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		bge.s      boxed_checktext_41
		lea.l      xe1f2a,a1
		lea.l      xe1f23,a0
		move.w     36(a7),d1
		movea.l    42(a7),a2
		move.b     0(a2,d1.w),d0
		bsr        boxed_within
		tst.w      d0
		bne.s      boxed_checktext_42
boxed_checktext_41:
		bra        boxed_checktext_11
boxed_checktext_16:
		move.w     #$0001,32(a7)
		bra.s      boxed_checktext_43
boxed_checktext_45:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_43:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		bge.s      boxed_checktext_44
		lea.l      xe1f4e,a1
		lea.l      xe1f47,a0
		move.w     36(a7),d1
		movea.l    42(a7),a2
		move.b     0(a2,d1.w),d0
		bsr        boxed_within
		tst.w      d0
		bne.s      boxed_checktext_45
boxed_checktext_44:
		bra        boxed_checktext_11
boxed_checktext_17:
		move.w     #$0001,32(a7)
		bra.s      boxed_checktext_46
boxed_checktext_48:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_46:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		bge.s      boxed_checktext_47
		lea.l      xe1f72,a1
		lea.l      xe1f6b,a0
		move.w     36(a7),d1
		movea.l    42(a7),a2
		move.b     0(a2,d1.w),d0
		bsr        boxed_within
		tst.w      d0
		bne.s      boxed_checktext_48
boxed_checktext_47:
		bra        boxed_checktext_11
boxed_checktext_18:
		bra.s      boxed_checktext_49
boxed_checktext_51:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_49:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		bge.s      boxed_checktext_50
		move.w     36(a7),d0
		movea.l    42(a7),a0
		cmpi.b     #$20,0(a0,d0.w)
		bcc.s      boxed_checktext_51
boxed_checktext_50:
		bra        boxed_checktext_11
boxed_checktext_19:
		move.w     #$0001,38(a7)
boxed_checktext_20:
		bra.s      boxed_checktext_52
boxed_checktext_56:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_52:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		bge.s      boxed_checktext_53
		lea.l      xe1f9d,a1
		move.l     a1,-(a7)
		move.w     42(a7),d0
		beq.s      boxed_checktext_54
		lea.l      xe1f91,a0
		bra.s      boxed_checktext_55
boxed_checktext_54:
		lea.l      xe1f96,a0
boxed_checktext_55:
		move.w     40(a7),d1
		movea.l    46(a7),a1
		move.b     0(a1,d1.w),d0
		movea.l    (a7)+,a1
		bsr        boxed_within
		tst.w      d0
		bne.s      boxed_checktext_56
boxed_checktext_53:
		bra        boxed_checktext_11
boxed_checktext_22:
		move.w     36(a7),d0
		bne.s      boxed_checktext_21
		move.w     40(a7),d0
		bne.s      boxed_checktext_21
		move.w     36(a7),d0
		movea.l    42(a7),a0
		cmpi.b     #$2D,0(a0,d0.w)
		bne.s      boxed_checktext_21
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_21:
		bra.s      boxed_checktext_57
boxed_checktext_59:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_57:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		bge.s      boxed_checktext_58
		suba.l     a1,a1
		lea.l      xe1f9f,a0
		move.w     36(a7),d1
		movea.l    42(a7),a2
		move.b     0(a2,d1.w),d0
		bsr        boxed_within
		tst.w      d0
		bne.s      boxed_checktext_59
boxed_checktext_58:
		bra        boxed_checktext_11
boxed_checktext_24:
		move.w     36(a7),d0
		bne.s      boxed_checktext_23
		move.w     40(a7),d0
		bne.s      boxed_checktext_23
		move.w     36(a7),d0
		movea.l    42(a7),a0
		cmpi.b     #$2D,0(a0,d0.w)
		bne.s      boxed_checktext_23
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_23:
		bra.s      boxed_checktext_60
boxed_checktext_62:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_60:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		bge.s      boxed_checktext_61
		suba.l     a1,a1
		lea.l      xe1fa2,a0
		move.w     36(a7),d1
		movea.l    42(a7),a2
		move.b     0(a2,d1.w),d0
		bsr        boxed_within
		tst.w      d0
		bne.s      boxed_checktext_62
boxed_checktext_61:
		bra        boxed_checktext_11
boxed_checktext_26:
		move.w     36(a7),d0
		bne.s      boxed_checktext_25
		move.w     40(a7),d0
		bne.s      boxed_checktext_25
		move.w     36(a7),d0
		movea.l    42(a7),a0
		cmpi.b     #$2D,0(a0,d0.w)
		bne.s      boxed_checktext_25
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_25:
		bra.s      boxed_checktext_63
boxed_checktext_65:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_63:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		bge.s      boxed_checktext_64
		suba.l     a1,a1
		lea.l      xe1fa5,a0
		move.w     36(a7),d1
		movea.l    42(a7),a2
		move.b     0(a2,d1.w),d0
		bsr        boxed_within
		tst.w      d0
		bne.s      boxed_checktext_65
boxed_checktext_64:
		bra        boxed_checktext_11
boxed_checktext_28:
		move.w     36(a7),d0
		bne.s      boxed_checktext_27
		move.w     40(a7),d0
		bne.s      boxed_checktext_27
		move.w     36(a7),d0
		movea.l    42(a7),a0
		cmpi.b     #$2D,0(a0,d0.w)
		bne.s      boxed_checktext_27
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_27:
		move.w     #$0001,32(a7)
		bra.s      boxed_checktext_66
boxed_checktext_68:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_66:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		bge.s      boxed_checktext_67
		suba.l     a1,a1
		lea.l      xe1fa8,a0
		move.w     36(a7),d1
		movea.l    42(a7),a2
		move.b     0(a2,d1.w),d0
		bsr        boxed_within
		tst.w      d0
		bne.s      boxed_checktext_68
boxed_checktext_67:
		bra        boxed_checktext_11
boxed_checktext_30:
		move.w     36(a7),d0
		bne.s      boxed_checktext_29
		move.w     40(a7),d0
		bne.s      boxed_checktext_29
		move.w     36(a7),d0
		movea.l    42(a7),a0
		cmpi.b     #$2D,0(a0,d0.w)
		bne.s      boxed_checktext_29
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
		addq.w     #1,36(a7)
boxed_checktext_29:
		moveq.l    #46,d0
		movea.l    12(a7),a0
		lea.l      256(a0),a0
		jsr        strchr
		move.l     a0,18(a7)
		moveq.l    #46,d0
		movea.l    42(a7),a0
		jsr        strchr
		move.l     a0,22(a7)
		bra.s      boxed_checktext_69
boxed_checktext_74:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		cmpi.b     #$2E,0(a0,d0.w)
		bne.s      boxed_checktext_70
		move.l     18(a7),d0
		bne.s      boxed_checktext_71
		move.w     36(a7),d0
		movea.l    42(a7),a0
		adda.w     d0,a0
		cmpa.l     22(a7),a0
		bne.s      boxed_checktext_71
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
boxed_checktext_71:
		bra.s      boxed_checktext_72
boxed_checktext_70:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
boxed_checktext_72:
		addq.w     #1,36(a7)
boxed_checktext_69:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		bge.s      boxed_checktext_73
		lea.l      xe1fb2,a1
		lea.l      xe1faf,a0
		move.w     36(a7),d1
		movea.l    42(a7),a2
		move.b     0(a2,d1.w),d0
		bsr        boxed_within
		tst.w      d0
		bne.w      boxed_checktext_74
boxed_checktext_73:
		bra        boxed_checktext_11
boxed_checktext_31:
		move.b     #$2E,16(a7)
boxed_checktext_32:
		move.b     16(a7),d0
		bne.s      boxed_checktext_33
		move.b     #$2F,16(a7)
boxed_checktext_33:
		move.b     16(a7),d0
		bne.s      boxed_checktext_75
		move.b     #$3A,16(a7)
boxed_checktext_75:
		lea.l      18(a7),a1
		move.b     16(a7),d0
		movea.l    12(a7),a0
		lea.l      256(a0),a0
		bsr        boxed_findsep
		bra        boxed_checktext_76
boxed_checktext_84:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		clr.w      d1
		move.b     0(a0,d0.w),d1
		sub.w      #$002E,d1
		beq.s      boxed_checktext_77
		subq.w     #1,d1
		beq.s      boxed_checktext_77
		sub.w      #$000B,d1
		beq.s      boxed_checktext_77
		bra.s      boxed_checktext_78
boxed_checktext_77:
		move.w     36(a7),d0
		movea.l    42(a7),a0
		move.b     0(a0,d0.w),d0
		cmp.b      16(a7),d0
		bne.s      boxed_checktext_79
		clr.w      30(a7)
		bra.s      boxed_checktext_80
boxed_checktext_82:
		move.w     30(a7),d0
		lsl.w      #2,d0
		move.l     18(a7,d0.w),d0
		bne.s      boxed_checktext_81
		move.w     36(a7),d0
		movea.l    42(a7),a0
		adda.w     d0,a0
		move.w     30(a7),d0
		lsl.w      #2,d0
		move.l     a0,18(a7,d0.w)
		movea.l    26(a7),a0
		addq.l     #1,26(a7)
		move.b     16(a7),(a0)
		bra.s      boxed_checktext_79
boxed_checktext_81:
		addq.w     #1,30(a7)
boxed_checktext_80:
		cmpi.w     #$0002,30(a7)
		blt.s      boxed_checktext_82
boxed_checktext_79:
		bra.s      boxed_checktext_83
boxed_checktext_78:
		suba.l     a1,a1
		lea.l      xe1fb4,a0
		move.w     36(a7),d1
		movea.l    42(a7),a2
		move.b     0(a2,d1.w),d0
		bsr        boxed_within
		tst.w      d0
		beq.s      boxed_checktext_83
		move.w     36(a7),d0
		movea.l    42(a7),a0
		movea.l    26(a7),a1
		addq.l     #1,26(a7)
		move.b     0(a0,d0.w),(a1)
boxed_checktext_83:
		addq.w     #1,36(a7)
boxed_checktext_76:
		move.w     36(a7),d0
		cmp.w      34(a7),d0
		blt        boxed_checktext_84
		nop
boxed_checktext_11:
		clr.b      d0
		movea.l    26(a7),a0
		move.b     d0,(a0)
		move.w     34(a7),d1
		movea.l    58(a7),a0
		move.b     d0,0(a0,d1.w)
		move.w     32(a7),d0
		beq.s      boxed_checktext_85
		movea.l    58(a7),a0
		jsr        Ast_toupper
boxed_checktext_85:
		movea.l    58(a7),a0
		jsr        strlen
		movea.l    62(a7),a0
		move.w     d0,(a0)
		movea.l    62(a7),a0
		move.w     (a0),d0
		ble.s      boxed_checktext_86
		moveq.l    #1,d0
		bra.s      boxed_checktext_4
		bra.s      boxed_checktext_4
boxed_checktext_86:
		clr.w      d0
		nop
boxed_checktext_4:
		lea.l      50(a7),a7
		movea.l    (a7)+,a2
		rts

boxed_validate:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		clr.l      (a7)
		movea.l    4(a7),a0
		lea.l      -9(a0),a0
		cmpa.l     8(a7),a0
		bls.s      boxed_validate_1
		movea.l    8(a7),a0
		lea.l      9(a0),a0
		move.l     a0,4(a7)
boxed_validate_1:
		movea.l    8(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        isdigit
		tst.w      d0
		bne.s      boxed_validate_2
		moveq.l    #-1,d0
		bra.s      boxed_validate_3
boxed_validate_2:
		bra.s      boxed_validate_4
boxed_validate_6:
		move.l     (a7),d1
		move.l     d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		add.l      d0,d0
		move.l     d0,(a7)
		movea.l    8(a7),a0
		move.b     (a0),d0
		ext.w      d0
		add.w      #$FFD0,d0
		ext.l      d0
		add.l      d0,(a7)
		addq.l     #1,8(a7)
boxed_validate_4:
		movea.l    8(a7),a0
		cmpa.l     4(a7),a0
		bcc.s      boxed_validate_5
		movea.l    8(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        isdigit
		tst.w      d0
		bne.s      boxed_validate_6
boxed_validate_5:
		move.l     (a7),d0
boxed_validate_3:
		lea.l      12(a7),a7
		rts

boxed_postcheck:
		lea.l      -300(a7),a7
		move.l     a0,296(a7)
		lea.l      xe1dfa,a0
		lea.l      18(a7),a1
		move.w     #$00FF,d0
boxed_postcheck_1:
		move.b     (a0)+,(a1)+
		dbf        d0,boxed_postcheck_1
		move.l     #$FFFFFFFF,14(a7)
		move.l     #$FFFFFFFF,10(a7)
		move.l     #$FFFFFFFF,6(a7)
		movea.l    296(a7),a0
		move.l     12(a0),292(a7)
		movea.l    292(a7),a0
		move.l     16(a0),288(a7)
		movea.l    292(a7),a0
		addq.w     #4,a0
		move.l     a0,284(a7)
		movea.l    284(a7),a0
		move.w     (a0),d0
		lsr.w      #3,d0
		and.w      #$001F,d0
		sub.w      #$0014,d0
		cmp.w      #$0006,d0
		bhi.s      boxed_postcheck_2
		add.w      d0,d0
		move.w     J54(pc,d0.w),d0
		jmp        J54(pc,d0.w)
J54:
		dc.w boxed_postcheck_3-J54
		dc.w boxed_postcheck_4-J54
		dc.w boxed_postcheck_3-J54
		dc.w boxed_postcheck_4-J54
		dc.w boxed_postcheck_5-J54
		dc.w boxed_postcheck_5-J54
		dc.w boxed_postcheck_5-J54
boxed_postcheck_3:
		move.b     #$2E,282(a7)
		bra.s      boxed_postcheck_2
boxed_postcheck_4:
		move.b     #$2F,282(a7)
		bra.s      boxed_postcheck_2
boxed_postcheck_5:
		move.b     #$3A,282(a7)
boxed_postcheck_2:
		movea.l    284(a7),a0
		move.w     (a0),d0
		lsr.w      #3,d0
		and.w      #$001F,d0
		cmp.w      #$0014,d0
		bcs        boxed_postcheck_6
		movea.l    284(a7),a0
		move.w     (a0),d0
		lsr.w      #3,d0
		and.w      #$001F,d0
		cmp.w      #$001A,d0
		bhi        boxed_postcheck_6
		lea.l      274(a7),a1
		move.b     282(a7),d0
		movea.l    288(a7),a0
		lea.l      256(a0),a0
		bsr        boxed_findsep
		move.l     274(a7),d0
		beq.s      boxed_postcheck_7
		movea.l    274(a7),a1
		bra.s      boxed_postcheck_8
boxed_postcheck_7:
		movea.l    288(a7),a0
		move.w     526(a0),d0
		movea.l    288(a7),a1
		adda.w     d0,a1
		lea.l      256(a1),a1
boxed_postcheck_8:
		movea.l    288(a7),a0
		lea.l      256(a0),a0
		bsr        boxed_validate
		move.l     d0,14(a7)
		move.l     274(a7),d0
		beq.s      boxed_postcheck_6
		move.l     278(a7),d0
		beq.s      boxed_postcheck_9
		movea.l    278(a7),a1
		bra.s      boxed_postcheck_10
boxed_postcheck_9:
		movea.l    288(a7),a0
		move.w     526(a0),d0
		movea.l    288(a7),a1
		adda.w     d0,a1
		lea.l      256(a1),a1
boxed_postcheck_10:
		movea.l    274(a7),a0
		addq.w     #1,a0
		bsr        boxed_validate
		move.l     d0,10(a7)
		move.l     278(a7),d0
		beq.s      boxed_postcheck_6
		movea.l    288(a7),a0
		move.w     526(a0),d0
		movea.l    288(a7),a1
		adda.w     d0,a1
		lea.l      256(a1),a1
		movea.l    278(a7),a0
		addq.w     #1,a0
		bsr        boxed_validate
		move.l     d0,6(a7)
boxed_postcheck_6:
		movea.l    284(a7),a0
		move.w     (a0),d0
		lsr.w      #3,d0
		and.w      #$001F,d0
		sub.w      #$0014,d0
		cmp.w      #$0006,d0
		bhi        boxed_postcheck_11
		add.w      d0,d0
		move.w     J55(pc,d0.w),d0
		jmp        J55(pc,d0.w)
J55:
		dc.w boxed_postcheck_12-J55
		dc.w boxed_postcheck_12-J55
		dc.w boxed_postcheck_12-J55
		dc.w boxed_postcheck_12-J55
		dc.w boxed_postcheck_13-J55
		dc.w boxed_postcheck_14-J55
		dc.w boxed_postcheck_15-J55
boxed_postcheck_12:
		movea.l    284(a7),a0
		move.w     (a0),d0
		lsr.w      #3,d0
		and.w      #$001F,d0
		cmp.w      #$0016,d0
		beq.s      boxed_postcheck_16
		movea.l    284(a7),a0
		move.w     (a0),d0
		lsr.w      #3,d0
		and.w      #$001F,d0
		cmp.w      #$0017,d0
		bne.s      boxed_postcheck_17
boxed_postcheck_16:
		move.l     14(a7),2(a7)
		move.l     10(a7),14(a7)
		move.l     2(a7),10(a7)
boxed_postcheck_17:
		moveq.l    #12,d0
		cmp.l      10(a7),d0
		bge.s      boxed_postcheck_18
		move.l     #$0000000C,10(a7)
boxed_postcheck_18:
		move.l     10(a7),d0
		ble.w      boxed_postcheck_19
		move.l     6(a7),d0
		bmi.w      boxed_postcheck_19
		moveq.l    #2,d0
		cmp.l      10(a7),d0
		bne.s      boxed_postcheck_20
		move.l     6(a7),d0
		move.l     #$00000190,d1
		jsr        _lmod
		tst.l      d0
		beq.s      boxed_postcheck_21
		move.l     6(a7),d0
		moveq.l    #4,d1
		jsr        _lmod
		tst.l      d0
		bne.s      boxed_postcheck_22
		move.l     6(a7),d0
		moveq.l    #100,d1
		jsr        _lmod
		tst.l      d0
		beq.s      boxed_postcheck_22
boxed_postcheck_21:
		moveq.l    #29,d0
		bra.s      boxed_postcheck_23
boxed_postcheck_22:
		moveq.l    #28,d0
boxed_postcheck_23:
		move.w     d0,(a7)
		bra.s      boxed_postcheck_24
boxed_postcheck_20:
		moveq.l    #7,d0
		cmp.l      10(a7),d0
		bge.s      boxed_postcheck_25
		moveq.l    #-7,d0
		add.w      12(a7),d0
		bra.s      boxed_postcheck_26
boxed_postcheck_25:
		move.w     12(a7),d0
boxed_postcheck_26:
		move.w     d0,(a7)
		move.w     (a7),d0
		ext.l      d0
		divs.w     #$0002,d0
		swap       d0
		tst.w      d0
		bne.s      boxed_postcheck_27
		moveq.l    #30,d0
		bra.s      boxed_postcheck_28
boxed_postcheck_27:
		moveq.l    #31,d0
boxed_postcheck_28:
		move.w     d0,(a7)
boxed_postcheck_24:
		bra.s      boxed_postcheck_29
boxed_postcheck_19:
		move.w     #$001F,(a7)
boxed_postcheck_29:
		move.w     (a7),d0
		ext.l      d0
		move.l     14(a7),d1
		cmp.l      d0,d1
		ble.s      boxed_postcheck_30
		move.w     (a7),d0
		ext.l      d0
		move.l     d0,14(a7)
boxed_postcheck_30:
		movea.l    284(a7),a0
		move.w     (a0),d0
		lsr.w      #3,d0
		and.w      #$001F,d0
		cmp.w      #$0016,d0
		beq.s      boxed_postcheck_31
		movea.l    284(a7),a0
		move.w     (a0),d0
		lsr.w      #3,d0
		and.w      #$001F,d0
		cmp.w      #$0017,d0
		bne.s      boxed_postcheck_32
boxed_postcheck_31:
		move.l     14(a7),2(a7)
		move.l     10(a7),14(a7)
		move.l     2(a7),10(a7)
boxed_postcheck_32:
		bra.s      boxed_postcheck_11
boxed_postcheck_14:
		moveq.l    #12,d0
		cmp.l      14(a7),d0
		bge.s      boxed_postcheck_15
		move.l     #$0000000C,14(a7)
boxed_postcheck_15:
		moveq.l    #23,d0
		cmp.l      14(a7),d0
		bge.s      boxed_postcheck_13
		move.l     #$00000017,14(a7)
boxed_postcheck_13:
		moveq.l    #59,d0
		cmp.l      10(a7),d0
		bge.s      boxed_postcheck_33
		move.l     #$0000003B,10(a7)
boxed_postcheck_33:
		moveq.l    #59,d0
		cmp.l      6(a7),d0
		bge.s      boxed_postcheck_11
		move.l     #$0000003B,6(a7)
boxed_postcheck_11:
		movea.l    284(a7),a0
		move.w     (a0),d0
		lsr.w      #3,d0
		and.w      #$001F,d0
		cmp.w      #$0014,d0
		bcs        boxed_postcheck_34
		movea.l    284(a7),a0
		move.w     (a0),d0
		lsr.w      #3,d0
		and.w      #$001F,d0
		cmp.w      #$001A,d0
		bhi        boxed_postcheck_34
		clr.w      (a7)
		move.l     14(a7),d0
		bmi.s      boxed_postcheck_35
		move.l     14(a7),-(a7)
		lea.l      xe1fb7,a1
		lea.l      22(a7),a0
		jsr        sprintf
		addq.w     #4,a7
		move.w     d0,(a7)
boxed_postcheck_35:
		move.l     274(a7),d0
		beq.s      boxed_postcheck_36
		clr.w      d0
		move.b     282(a7),d0
		move.w     d0,-(a7)
		lea.l      xe1fbb,a1
		move.w     2(a7),d0
		lea.l      20(a7,d0.w),a0
		jsr        sprintf
		addq.w     #2,a7
		add.w      d0,(a7)
boxed_postcheck_36:
		move.l     10(a7),d0
		bmi.s      boxed_postcheck_37
		move.l     10(a7),-(a7)
		lea.l      xe1fbe,a1
		move.w     4(a7),d0
		lea.l      22(a7,d0.w),a0
		jsr        sprintf
		addq.w     #4,a7
		add.w      d0,(a7)
boxed_postcheck_37:
		move.l     278(a7),d0
		beq.s      boxed_postcheck_38
		clr.w      d0
		move.b     282(a7),d0
		move.w     d0,-(a7)
		lea.l      xe1fc2,a1
		move.w     2(a7),d0
		lea.l      20(a7,d0.w),a0
		jsr        sprintf
		addq.w     #2,a7
		add.w      d0,(a7)
boxed_postcheck_38:
		move.l     6(a7),d0
		bmi.s      boxed_postcheck_39
		move.l     6(a7),-(a7)
		lea.l      xe1fc5,a1
		move.w     4(a7),d0
		lea.l      22(a7,d0.w),a0
		jsr        sprintf
		addq.w     #4,a7
		add.w      d0,(a7)
boxed_postcheck_39:
		move.w     (a7),d0
		ble.s      boxed_postcheck_34
		movea.l    288(a7),a0
		move.w     526(a0),d0
		sub.w      (a7),d0
		move.w     d0,(a7)
		move.w     (a7),d0
		movea.l    288(a7),a0
		sub.w      d0,526(a0)
		movea.l    288(a7),a0
		move.l     528(a0),d0
		beq.s      boxed_postcheck_40
		move.w     (a7),d0
		movea.l    288(a7),a0
		movea.l    528(a0),a0
		sub.w      d0,(a0)
boxed_postcheck_40:
		movea.l    288(a7),a0
		move.l     532(a0),d0
		beq.s      boxed_postcheck_41
		move.w     (a7),d0
		movea.l    288(a7),a0
		movea.l    532(a0),a0
		sub.w      d0,(a0)
		movea.l    288(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		bpl.s      boxed_postcheck_41
		movea.l    288(a7),a0
		movea.l    532(a0),a0
		clr.w      (a0)
boxed_postcheck_41:
		lea.l      18(a7),a1
		movea.l    288(a7),a0
		lea.l      256(a0),a0
		jsr        strcpy
boxed_postcheck_34:
		lea.l      300(a7),a7
		rts

boxed_delsel:
		move.l     a2,-(a7)
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.w     d0,14(a7)
		move.w     d1,12(a7)
		movea.l    16(a7),a0
		movea.l    12(a0),a0
		move.l     16(a0),8(a7)
		move.w     12(a7),d0
		ble        boxed_delsel_1
		movea.l    8(a7),a0
		move.w     526(a0),d0
		ble        boxed_delsel_1
		move.w     14(a7),d0
		bmi        boxed_delsel_1
		move.w     14(a7),d0
		add.w      12(a7),d0
		movea.l    8(a7),a0
		cmp.w      526(a0),d0
		bgt        boxed_delsel_1
		move.w     14(a7),d0
		movea.l    8(a7),a0
		adda.w     d0,a0
		lea.l      256(a0),a0
		move.l     a0,4(a7)
		move.w     12(a7),d0
		movea.l    4(a7),a1
		adda.w     d0,a1
		movea.l    4(a7),a0
		jsr        strcpy
		move.w     12(a7),d0
		movea.l    8(a7),a0
		sub.w      d0,526(a0)
		movea.l    8(a7),a0
		move.l     532(a0),d0
		beq.s      boxed_delsel_2
		movea.l    8(a7),a0
		movea.l    532(a0),a0
		clr.w      (a0)
boxed_delsel_2:
		movea.l    8(a7),a0
		move.l     532(a0),d0
		beq.s      boxed_delsel_3
		movea.l    8(a7),a0
		movea.l    528(a0),a0
		move.w     14(a7),(a0)
boxed_delsel_3:
		movea.l    8(a7),a0
		ori.w      #$0004,546(a0)
		movea.l    8(a7),a1
		lea.l      256(a1),a1
		movea.l    8(a7),a0
		jsr        strcpy
		movea.l    8(a7),a0
		move.l     516(a0),(a7)
		move.l     (a7),d0
		beq.s      boxed_delsel_1
		suba.l     a1,a1
		moveq.l    #26,d0
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
boxed_delsel_1:
		lea.l      20(a7),a7
		movea.l    (a7)+,a2
		rts

boxed_viewpos:
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		move.w     d0,20(a7)
		movea.l    22(a7),a0
		movea.l    12(a0),a0
		move.l     16(a0),8(a7)
		movea.l    8(a7),a0
		move.w     540(a0),16(a7)
		movea.l    8(a7),a0
		move.l     516(a0),(a7)
		movea.l    8(a7),a0
		move.w     524(a0),d0
		and.w      #$1000,d0
		beq.s      boxed_viewpos_1
		movea.l    (a7),a0
		move.l     24(a0),4(a7)
		bra.s      boxed_viewpos_2
boxed_viewpos_1:
		movea.l    (a7),a0
		move.l     20(a0),4(a7)
boxed_viewpos_2:
		movea.l    8(a7),a0
		move.w     524(a0),d1
		and.w      #$0FFF,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a0
		move.w     20(a0,d0.l),d0
		ext.l      d0
		movea.l    8(a7),a0
		divs.w     542(a0),d0
		move.w     d0,14(a7)
		move.w     20(a7),12(a7)
		move.w     12(a7),d0
		bpl.s      boxed_viewpos_3
		movea.l    8(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),12(a7)
boxed_viewpos_3:
		movea.l    8(a7),a0
		move.w     12(a7),d0
		cmp.w      526(a0),d0
		ble.s      boxed_viewpos_4
		movea.l    8(a7),a0
		move.w     526(a0),12(a7)
boxed_viewpos_4:
		move.w     12(a7),d0
		ble.s      boxed_viewpos_5
		moveq.l    #-1,d0
		add.w      12(a7),d0
		cmp.w      16(a7),d0
		bge.s      boxed_viewpos_5
		moveq.l    #-1,d0
		add.w      12(a7),d0
		move.w     d0,16(a7)
		bra.s      boxed_viewpos_6
boxed_viewpos_5:
		move.w     12(a7),d0
		sub.w      16(a7),d0
		sub.w      14(a7),d0
		addq.w     #1,d0
		move.w     d0,18(a7)
		move.w     18(a7),d0
		bgt.s      boxed_viewpos_7
		move.w     12(a7),d0
		cmp.w      16(a7),d0
		bge.s      boxed_viewpos_6
boxed_viewpos_7:
		move.w     18(a7),d0
		add.w      d0,16(a7)
boxed_viewpos_6:
		move.w     16(a7),d0
		add.w      14(a7),d0
		movea.l    8(a7),a0
		sub.w      526(a0),d0
		move.w     d0,18(a7)
		move.w     18(a7),d0
		ble.s      boxed_viewpos_8
		move.w     18(a7),d0
		sub.w      d0,16(a7)
boxed_viewpos_8:
		move.w     16(a7),d0
		bpl.s      boxed_viewpos_9
		clr.w      16(a7)
boxed_viewpos_9:
		movea.l    8(a7),a0
		move.w     540(a0),d0
		cmp.w      16(a7),d0
		beq.s      boxed_viewpos_10
		movea.l    8(a7),a0
		ori.w      #$0004,546(a0)
boxed_viewpos_10:
		movea.l    8(a7),a0
		move.w     16(a7),540(a0)
		lea.l      26(a7),a7
		rts

boxed_charlist:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		lea.l      xe1efa,a0
		lea.l      2(a7),a1
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		lea.l      xe1efc,a0
		lea.l      (a7),a1
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.l     #$00001818,d0
		jsr        Ax_malloc
		move.l     a0,12(a7)
		move.l     a0,8(a7)
		move.l     12(a7),d0
		bne.s      boxed_charlist_1
		bra        boxed_charlist_2
boxed_charlist_1:
		moveq.l    #24,d0
		lea.l      CHARLIST,a1
		movea.l    8(a7),a0
		jsr        memcpy
		movea.l    8(a7),a0
		move.w     #$0001,2(a0)
		movea.l    8(a7),a0
		move.w     #$0100,4(a0)
		addi.l     #$00000018,8(a7)
		clr.w      6(a7)
		bra        boxed_charlist_3
boxed_charlist_6:
		moveq.l    #24,d0
		lea.l      CHARENTRY,a1
		movea.l    8(a7),a0
		jsr        memcpy
		movea.l    8(a7),a0
		clr.w      d0
		move.b     7(a7),d0
		andi.w     #$00FF,12(a0)
		and.w      #$00FF,d0
		lsl.w      #8,d0
		or.w       d0,12(a0)
		moveq.l    #2,d0
		add.w      6(a7),d0
		movea.l    8(a7),a0
		move.w     d0,(a0)
		move.w     6(a7),d0
		ext.l      d0
		divs.w     #$0010,d0
		swap       d0
		add.w      d0,d0
		movea.l    8(a7),a0
		move.w     d0,16(a0)
		move.w     6(a7),d0
		ext.l      d0
		divs.w     #$0010,d0
		movea.l    8(a7),a0
		move.w     d0,18(a0)
		move.b     7(a7),2(a7)
		move.w     #$0001,4(a7)
		pea.l      4(a7)
		pea.l      4(a7)
		lea.l      10(a7),a1
		movea.l    24(a7),a0
		bsr        boxed_checktext
		addq.w     #8,a7
		tst.w      d0
		beq.s      boxed_charlist_4
		move.b     (a7),d0
		cmp.b      7(a7),d0
		beq.s      boxed_charlist_5
boxed_charlist_4:
		movea.l    8(a7),a0
		ori.w      #$0008,10(a0)
		movea.l    8(a7),a0
		andi.w     #$F0FF,14(a0)
		movea.l    8(a7),a0
		andi.w     #$FFF0,14(a0)
		ori.w      #$0008,14(a0)
boxed_charlist_5:
		addi.l     #$00000018,8(a7)
		addq.w     #1,6(a7)
boxed_charlist_3:
		cmpi.w     #$0100,6(a7)
		blt        boxed_charlist_6
		subi.l     #$00000018,8(a7)
		movea.l    8(a7),a0
		ori.w      #$0020,8(a0)
		movea.l    8(a7),a0
		clr.w      (a0)
		movea.l    12(a7),a0
		jsr        Aob_fix
		movea.l    ACSblk,a0
		move.w     612(a0),d1
		movea.l    12(a7),a0
		move.w     22(a0),d0
		asr.w      #1,d0
		sub.w      d0,d1
		movea.l    ACSblk,a0
		move.w     610(a0),d0
		movea.l    12(a7),a0
		move.w     20(a0),d2
		asr.w      #1,d2
		sub.w      d2,d0
		movea.l    12(a7),a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        Ame_popup
		move.w     d0,4(a7)
		cmpi.w     #$0001,4(a7)
		ble.s      boxed_charlist_7
		move.b     5(a7),d0
		add.b      #$FF,d0
		move.b     d0,2(a7)
		clr.w      d0
		lea.l      2(a7),a1
		movea.l    16(a7),a0
		bsr        boxed_insert
boxed_charlist_7:
		movea.l    12(a7),a0
		jsr        Ax_free
boxed_charlist_2:
		lea.l      20(a7),a7
		rts

	.globl Aus_boxed
Aus_boxed:
		movea.l    ACSblk,a0
		move.w     608(a0),d0
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        Aus_objboxed
		rts

	.globl Aus_objboxed
Aus_objboxed:
		move.l     a2,-(a7)
		lea.l      -108(a7),a7
		move.l     a0,104(a7)
		move.l     a1,100(a7)
		move.w     d0,98(a7)
		move.w     #$0006,6(a7)
		move.w     #$0064,4(a7)
		move.w     #$0002,(a7)
		move.w     98(a7),d1
		and.w      #$0FFF,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    100(a7),a0
		adda.l     d0,a0
		move.l     a0,90(a7)
		movea.l    90(a7),a0
		move.l     12(a0),82(a7)
		movea.l    82(a7),a0
		move.l     16(a0),86(a7)
		movea.l    90(a7),a0
		cmpi.b     #$18,7(a0)
		bne.s      Aus_objboxed_1
		move.l     82(a7),d0
		beq.s      Aus_objboxed_1
		movea.l    82(a7),a0
		move.l     8(a0),d0
		beq.s      Aus_objboxed_1
		move.l     86(a7),d0
		bne.s      Aus_objboxed_2
Aus_objboxed_1:
		bra        Aus_objboxed_3
Aus_objboxed_2:
		clr.l      -(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		pea.l      22(a7)
		moveq.l    #10,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		move.w     10(a7),d0
		jsr        Awi_wid
		move.l     a0,94(a7)
		move.w     10(a7),d0
		ble.s      Aus_objboxed_4
		move.l     94(a7),d0
		beq.s      Aus_objboxed_4
		movea.l    94(a7),a0
		cmpa.l     104(a7),a0
		beq.s      Aus_objboxed_5
Aus_objboxed_4:
		movea.l    104(a7),a0
		movea.l    104(a7),a1
		movea.l    110(a1),a1
		jsr        (a1)
		bra        Aus_objboxed_3
Aus_objboxed_5:
		move.l     104(a7),24(a7)
		move.l     90(a7),28(a7)
		move.w     98(a7),32(a7)
		lea.l      24(a7),a1
		moveq.l    #9,d0
		movea.l    90(a7),a0
		movea.l    82(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		movea.l    104(a7),a0
		move.w     28(a0),d0
		ble.s      Aus_objboxed_6
		movea.l    104(a7),a0
		move.w     28(a0),d0
		cmp.w      98(a7),d0
		beq.s      Aus_objboxed_6
		jsr        Awi_diaend
Aus_objboxed_6:
		movea.l    104(a7),a0
		move.w     98(a7),28(a0)
		jsr        Awi_diastart
		movea.l    104(a7),a0
		move.w     28(a0),d0
		bpl.s      Aus_objboxed_7
		bra        Aus_objboxed_3
Aus_objboxed_7:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      80(a0),a0
		jsr        Amo_new
		moveq.l    #48,d1
		clr.w      d0
		lea.l      34(a7),a0
		jsr        memset
		move.w     98(a7),d0
		and.w      #$0FFF,d0
		movea.l    100(a7),a1
		lea.l      50(a7),a0
		jsr        Aob_offset
		movea.l    104(a7),a0
		move.w     52(a0),d0
		add.w      d0,50(a7)
		movea.l    104(a7),a0
		move.w     54(a0),d0
		add.w      d0,52(a7)
		clr.w      22(a7)
		bra.s      Aus_objboxed_8
Aus_objboxed_9:
		move.w     22(a7),d0
		lsl.w      #3,d0
		clr.w      36(a7,d0.w)
		movea.l    ACSblk,a0
		move.w     10(a0),d0
		movea.l    ACSblk,a0
		add.w      14(a0),d0
		move.w     22(a7),d1
		lsl.w      #3,d1
		move.w     d0,40(a7,d1.w)
		addq.w     #1,22(a7)
Aus_objboxed_8:
		cmpi.w     #$0006,22(a7)
		blt.s      Aus_objboxed_9
		move.w     50(a7),16(a7)
		movea.l    ACSblk,a0
		move.w     18(a0),d0
		add.w      d0,d0
		move.w     54(a7),d1
		cmp.w      d0,d1
		ble.s      Aus_objboxed_10
		movea.l    ACSblk,a0
		move.w     18(a0),d0
		add.w      d0,50(a7)
		movea.l    ACSblk,a0
		move.w     18(a0),d0
		add.w      d0,d0
		sub.w      d0,54(a7)
Aus_objboxed_10:
		movea.l    ACSblk,a0
		move.w     18(a0),d0
		add.w      d0,d0
		move.w     d0,62(a7)
		move.w     d0,46(a7)
		move.w     50(a7),d0
		sub.w      46(a7),d0
		move.w     d0,42(a7)
		move.w     d0,38(a7)
		move.w     50(a7),d0
		add.w      54(a7),d0
		move.w     d0,58(a7)
		move.w     58(a7),d0
		add.w      62(a7),d0
		move.w     d0,66(a7)
		movea.l    ACSblk,a0
		move.w     12(a0),d0
		sub.w      66(a7),d0
		move.w     d0,70(a7)
		movea.l    86(a7),a0
		move.w     542(a0),78(a7)
		movea.l    ACSblk,a0
		move.w     610(a0),14(a7)
		move.w     14(a7),d0
		sub.w      16(a7),d0
		ext.l      d0
		movea.l    86(a7),a0
		divs.w     542(a0),d0
		movea.l    86(a7),a0
		add.w      540(a0),d0
		move.w     d0,20(a7)
		move.w     d0,18(a7)
		lea.l      18(a7),a1
		moveq.l    #17,d0
		movea.l    90(a7),a0
		movea.l    82(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    90(a7),a0
		movea.l    82(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		movea.l    90(a7),a0
		move.w     10(a0),d0
		and.w      #$4000,d0
		beq.s      Aus_objboxed_11
		move.w     18(a7),20(a7)
		movea.l    86(a7),a0
		ori.w      #$0010,546(a0)
		lea.l      18(a7),a1
		move.w     #$02C2,d0
		movea.l    90(a7),a0
		movea.l    82(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    90(a7),a0
		movea.l    82(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Aus_objboxed_11:
		bra        Aus_objboxed_12
Aus_objboxed_29:
		cmpi.w     #$0002,(a7)
		bne.s      Aus_objboxed_13
		move.w     14(a7),d0
		sub.w      16(a7),d0
		ext.l      d0
		movea.l    86(a7),a0
		divs.w     542(a0),d0
		movea.l    86(a7),a0
		muls.w     542(a0),d0
		add.w      16(a7),d0
		move.w     d0,74(a7)
		move.w     #$0005,2(a7)
		bra.s      Aus_objboxed_14
Aus_objboxed_13:
		move.w     (a7),2(a7)
Aus_objboxed_14:
		move.l     _globl,-(a7)
		pea.l      26(a7)
		pea.l      30(a7)
		pea.l      34(a7)
		pea.l      38(a7)
		pea.l      32(a7)
		move.w     28(a7),d0
		ext.l      d0
		or.l       #$00000000,d0
		move.l     d0,-(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		clr.w      -(a7)
		move.w     40(a7),d0
		lsl.w      #3,d0
		move.w     78(a7,d0.w),-(a7)
		move.w     42(a7),d0
		lsl.w      #3,d0
		move.w     78(a7,d0.w),-(a7)
		move.w     44(a7),d0
		lsl.w      #3,d0
		move.w     78(a7,d0.w),-(a7)
		move.w     46(a7),d0
		lsl.w      #3,d0
		move.w     78(a7,d0.w),-(a7)
		moveq.l    #1,d0
		move.w     d0,-(a7)
		clr.w      -(a7)
		lea.l      64(a7),a1
		suba.l     a0,a0
		movea.l    ACSblk,a2
		move.w     714(a2),d2
		moveq.l    #1,d1
		move.w     56(a7),d0
		jsr        mt_evnt_multi
		lea.l      50(a7),a7
		move.w     d0,8(a7)
		moveq.l    #2,d0
		and.w      8(a7),d0
		beq.s      Aus_objboxed_15
		bra        Aus_objboxed_16
Aus_objboxed_15:
		moveq.l    #4,d0
		and.w      8(a7),d0
		beq.w      Aus_objboxed_17
		move.w     12(a7),d1
		move.w     14(a7),d0
		lea.l      50(a7),a0
		jsr        Aob_within
		tst.w      d0
		beq.s      Aus_objboxed_18
		move.w     #$0002,(a7)
		bra.s      Aus_objboxed_17
Aus_objboxed_18:
		move.w     12(a7),d1
		move.w     14(a7),d0
		lea.l      42(a7),a0
		jsr        Aob_within
		tst.w      d0
		beq.s      Aus_objboxed_19
		move.w     #$0001,(a7)
		bra.s      Aus_objboxed_17
Aus_objboxed_19:
		move.w     12(a7),d1
		move.w     14(a7),d0
		lea.l      34(a7),a0
		jsr        Aob_within
		tst.w      d0
		beq.s      Aus_objboxed_20
		clr.w      (a7)
		bra.s      Aus_objboxed_17
Aus_objboxed_20:
		move.w     12(a7),d1
		move.w     14(a7),d0
		lea.l      58(a7),a0
		jsr        Aob_within
		tst.w      d0
		beq.s      Aus_objboxed_21
		move.w     #$0003,(a7)
		bra.s      Aus_objboxed_17
Aus_objboxed_21:
		move.w     #$0004,(a7)
Aus_objboxed_17:
		ori.w      #$0020,6(a7)
		move.w     (a7),d0
		cmp.w      #$0004,d0
		bhi.s      Aus_objboxed_22
		add.w      d0,d0
		move.w     J56(pc,d0.w),d0
		jmp        J56(pc,d0.w)
J56:
		dc.w Aus_objboxed_23-J56
		dc.w Aus_objboxed_24-J56
		dc.w Aus_objboxed_25-J56
		dc.w Aus_objboxed_26-J56
		dc.w Aus_objboxed_27-J56
Aus_objboxed_23:
		subq.w     #1,20(a7)
		move.w     #$001E,4(a7)
		bra.s      Aus_objboxed_22
Aus_objboxed_24:
		subq.w     #1,20(a7)
		move.w     #$0064,4(a7)
		bra.s      Aus_objboxed_22
Aus_objboxed_25:
		move.w     14(a7),d0
		sub.w      16(a7),d0
		ext.l      d0
		movea.l    86(a7),a0
		divs.w     542(a0),d0
		movea.l    86(a7),a0
		add.w      540(a0),d0
		move.w     d0,20(a7)
		andi.w     #$FFDF,6(a7)
		bra.s      Aus_objboxed_22
Aus_objboxed_26:
		addq.w     #1,20(a7)
		move.w     #$0064,4(a7)
		bra.s      Aus_objboxed_22
Aus_objboxed_27:
		addq.w     #1,20(a7)
		move.w     #$001E,4(a7)
		nop
Aus_objboxed_22:
		move.w     20(a7),d0
		bpl.s      Aus_objboxed_28
		clr.w      20(a7)
Aus_objboxed_28:
		lea.l      18(a7),a1
		move.w     #$02C2,d0
		movea.l    90(a7),a0
		movea.l    82(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    90(a7),a0
		movea.l    82(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
Aus_objboxed_12:
		bra        Aus_objboxed_29
Aus_objboxed_16:
		movea.l    86(a7),a0
		andi.w     #$FFEF,546(a0)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		lea.l      80(a0),a0
		jsr        Amo_new
Aus_objboxed_3:
		lea.l      108(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Auo_boxed
Auo_boxed:
		move.l     a2,-(a7)
		lea.l      -76(a7),a7
		move.l     a0,72(a7)
		move.w     d0,70(a7)
		move.l     a1,66(a7)
		movea.l    72(a7),a0
		move.l     12(a0),54(a7)
		movea.l    54(a7),a0
		addq.w     #4,a0
		move.l     a0,(a7)
		movea.l    54(a7),a0
		move.l     16(a0),62(a7)
		cmpi.w     #$0001,70(a7)
		beq.s      Auo_boxed_1
		movea.l    62(a7),a0
		move.l     516(a0),50(a7)
Auo_boxed_1:
		move.w     70(a7),d0
		cmp.w      #$0009,d0
		beq        Auo_boxed_2
		bgt.s      Auo_boxed_3
		cmp.w      #$0006,d0
		bhi        Auo_boxed_4
		add.w      d0,d0
		move.w     J57(pc,d0.w),d0
		jmp        J57(pc,d0.w)
J57:
		dc.w Auo_boxed_4-J57
		dc.w Auo_boxed_5-J57
		dc.w Auo_boxed_6-J57
		dc.w Auo_boxed_7-J57
		dc.w Auo_boxed_8-J57
		dc.w Auo_boxed_9-J57
		dc.w Auo_boxed_10-J57
Auo_boxed_3:
		cmp.w      #$0014,d0
		beq        Auo_boxed_16
		bgt.s      Auo_boxed_14
		sub.w      #$0012,d0
		beq        Auo_boxed_15
		subq.w     #1,d0
		beq        Auo_boxed_16
		bra        Auo_boxed_4
Auo_boxed_14:
		sub.w      #$02C0,d0
		beq        Auo_boxed_17
		subq.w     #1,d0
		beq        Auo_boxed_18
		bra        Auo_boxed_4
Auo_boxed_5:
		movea.l    54(a7),a0
		move.l     12(a0),8(a7)
		move.l     #$00000224,d0
		jsr        Ax_malloc
		movea.l    54(a7),a1
		move.l     a0,16(a1)
		move.l     a0,62(a7)
		move.l     62(a7),d0
		bne.s      Auo_boxed_19
		clr.w      d0
		bra        Auo_boxed_20
Auo_boxed_19:
		move.l     #$00000224,d1
		clr.w      d0
		movea.l    62(a7),a0
		jsr        memset
		movea.l    54(a7),a0
		move.l     62(a7),12(a0)
		movea.l    (a7),a0
		move.w     2(a0),d0
		lsr.w      #2,d0
		and.w      #$0001,d0
		beq.s      Auo_boxed_21
		movea.l    ACSblk,a0
		move.w     660(a0),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		movea.l    62(a7),a0
		pea.l      544(a0)
		movea.l    66(a7),a0
		pea.l      542(a0)
		lea.l      30(a7),a1
		lea.l      30(a7),a0
		movea.l    ACSblk,a2
		move.w     662(a2),d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_height
		addq.w     #8,a7
		bra.s      Auo_boxed_22
Auo_boxed_21:
		movea.l    ACSblk,a0
		move.w     656(a0),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		movea.l    62(a7),a0
		pea.l      544(a0)
		movea.l    66(a7),a0
		pea.l      542(a0)
		lea.l      30(a7),a1
		lea.l      30(a7),a0
		movea.l    ACSblk,a2
		move.w     658(a2),d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_height
		addq.w     #8,a7
Auo_boxed_22:
		move.l     8(a7),d0
		beq.s      Auo_boxed_23
		moveq.l    #1,d0
		movea.l    8(a7),a1
		movea.l    72(a7),a0
		bsr        boxed_insert
Auo_boxed_23:
		movea.l    62(a7),a0
		move.w     #$0004,546(a0)
		bra        Auo_boxed_24
Auo_boxed_2:
		move.l     66(a7),30(a7)
		movea.l    30(a7),a0
		movea.l    62(a7),a1
		move.l     (a0),516(a1)
		movea.l    30(a7),a0
		movea.l    62(a7),a1
		move.l     4(a0),520(a1)
		movea.l    30(a7),a0
		movea.l    62(a7),a1
		move.w     8(a0),524(a1)
		movea.l    30(a7),a0
		movea.l    (a0),a0
		lea.l      30(a0),a0
		movea.l    62(a7),a1
		move.l     a0,528(a1)
		movea.l    30(a7),a0
		movea.l    (a0),a0
		lea.l      82(a0),a0
		movea.l    62(a7),a1
		move.l     a0,532(a1)
		bra        Auo_boxed_24
Auo_boxed_15:
		move.l     66(a7),30(a7)
		movea.l    62(a7),a0
		movea.l    30(a7),a1
		move.l     516(a0),(a1)
		movea.l    62(a7),a0
		movea.l    30(a7),a1
		move.l     520(a0),4(a1)
		movea.l    62(a7),a0
		movea.l    30(a7),a1
		move.w     524(a0),8(a1)
		bra        Auo_boxed_24
Auo_boxed_6:
		movea.l    54(a7),a0
		movea.l    16(a0),a0
		jsr        Ax_free
		bra        Auo_boxed_24
Auo_boxed_16:
		bra        Auo_boxed_24
Auo_boxed_8:
		move.l     50(a7),d0
		beq.s      Auo_boxed_25
		movea.l    62(a7),a0
		move.l     528(a0),d0
		beq.s      Auo_boxed_25
		movea.l    62(a7),a0
		move.l     532(a0),d0
		bne.s      Auo_boxed_26
Auo_boxed_25:
		clr.w      d0
		bra        Auo_boxed_20
Auo_boxed_26:
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		clr.w      (a0)
		movea.l    62(a7),a0
		movea.l    62(a7),a1
		movea.l    532(a1),a1
		move.w     526(a0),(a1)
		moveq.l    #1,d0
		movea.l    66(a7),a1
		movea.l    72(a7),a0
		bsr        boxed_insert
		bra        Auo_boxed_24
Auo_boxed_7:
		move.l     50(a7),d0
		beq.s      Auo_boxed_27
		movea.l    62(a7),a0
		move.l     528(a0),d0
		beq.s      Auo_boxed_27
		movea.l    62(a7),a0
		move.l     532(a0),d0
		bne.s      Auo_boxed_28
Auo_boxed_27:
		clr.w      d0
		bra        Auo_boxed_20
Auo_boxed_28:
		movea.l    54(a7),a0
		movea.l    66(a7),a1
		move.l     12(a0),(a1)
		bra        Auo_boxed_24
Auo_boxed_10:
		movea.l    62(a7),a0
		ori.w      #$0004,546(a0)
Auo_boxed_9:
		move.l     50(a7),d0
		beq.s      Auo_boxed_29
		movea.l    62(a7),a0
		move.l     528(a0),d0
		beq.s      Auo_boxed_29
		movea.l    62(a7),a0
		move.l     532(a0),d0
		bne.s      Auo_boxed_30
Auo_boxed_29:
		clr.w      d0
		bra        Auo_boxed_20
Auo_boxed_30:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),16(a7)
		movea.l    50(a7),a0
		move.w     28(a0),d0
		movea.l    62(a7),a0
		cmp.w      524(a0),d0
		bne.s      Auo_boxed_31
		move.w     16(a7),d0
		ble.s      Auo_boxed_31
		move.w     16(a7),d0
		ext.l      d0
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d1
		movea.l    62(a7),a1
		adda.w     d1,a1
		lea.l      256(a1),a1
		movea.l    62(a7),a0
		jsr        memcpy
		move.w     16(a7),d0
		movea.l    62(a7),a0
		clr.b      0(a0,d0.w)
		bra.s      Auo_boxed_32
Auo_boxed_31:
		movea.l    62(a7),a1
		lea.l      256(a1),a1
		movea.l    62(a7),a0
		jsr        strcpy
Auo_boxed_32:
		moveq.l    #7,d0
		movea.l    62(a7),a0
		and.w      546(a0),d0
		beq        Auo_boxed_33
		movea.l    62(a7),a0
		move.w     524(a0),d0
		and.w      #$1000,d0
		beq.s      Auo_boxed_34
		movea.l    50(a7),a0
		move.l     24(a0),58(a7)
		bra.s      Auo_boxed_35
Auo_boxed_34:
		movea.l    50(a7),a0
		move.l     20(a0),58(a7)
Auo_boxed_35:
		movea.l    72(a7),a0
		move.w     10(a0),14(a7)
		movea.l    72(a7),a0
		move.w     8(a0),12(a7)
		movea.l    72(a7),a0
		andi.w     #$FFCF,10(a0)
		movea.l    72(a7),a0
		andi.w     #$BFF7,8(a0)
		movea.l    62(a7),a0
		move.w     524(a0),d0
		and.w      #$0FFF,d0
		movea.l    58(a7),a1
		lea.l      42(a7),a0
		jsr        Aob_offset
		movea.l    72(a7),a0
		move.w     14(a7),10(a0)
		movea.l    72(a7),a0
		move.w     12(a7),8(a0)
		movea.l    50(a7),a0
		move.w     52(a0),d0
		add.w      d0,42(a7)
		movea.l    50(a7),a0
		move.w     54(a0),d0
		add.w      d0,44(a7)
		move.w     44(a7),36(a7)
		move.w     48(a7),40(a7)
		moveq.l    #7,d0
		movea.l    62(a7),a0
		and.w      546(a0),d0
		subq.w     #1,d0
		bne        Auo_boxed_36
		movea.l    62(a7),a0
		move.w     536(a0),d0
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		cmp.w      (a0),d0
		beq        Auo_boxed_37
		move.w     #$0001,38(a7)
		movea.l    62(a7),a0
		move.w     536(a0),d0
		bmi.s      Auo_boxed_38
		movea.l    62(a7),a0
		move.w     536(a0),d0
		movea.l    62(a7),a0
		sub.w      540(a0),d0
		movea.l    62(a7),a0
		muls.w     542(a0),d0
		add.w      42(a7),d0
		addq.w     #1,d0
		move.w     d0,34(a7)
		lea.l      34(a7),a1
		movea.l    50(a7),a0
		movea.l    50(a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
Auo_boxed_38:
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		bmi.s      Auo_boxed_37
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		movea.l    62(a7),a0
		sub.w      540(a0),d0
		movea.l    62(a7),a0
		muls.w     542(a0),d0
		add.w      42(a7),d0
		addq.w     #1,d0
		move.w     d0,34(a7)
		lea.l      34(a7),a1
		movea.l    50(a7),a0
		movea.l    50(a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
Auo_boxed_37:
		bra        Auo_boxed_39
Auo_boxed_36:
		moveq.l    #7,d0
		movea.l    62(a7),a0
		and.w      546(a0),d0
		subq.w     #2,d0
		bne        Auo_boxed_40
		movea.l    62(a7),a0
		move.w     536(a0),d0
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		cmp.w      (a0),d0
		bne.s      Auo_boxed_41
		movea.l    62(a7),a0
		move.w     538(a0),d0
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		cmp.w      (a0),d0
		beq        Auo_boxed_42
Auo_boxed_41:
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		movea.l    62(a7),a0
		cmp.w      536(a0),d0
		bge.s      Auo_boxed_43
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		bra.s      Auo_boxed_44
Auo_boxed_43:
		movea.l    62(a7),a0
		move.w     536(a0),d0
Auo_boxed_44:
		move.w     d0,20(a7)
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		movea.l    62(a7),a0
		cmp.w      538(a0),d0
		ble.s      Auo_boxed_45
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		bra.s      Auo_boxed_46
Auo_boxed_45:
		movea.l    62(a7),a0
		move.w     538(a0),d0
Auo_boxed_46:
		move.w     d0,16(a7)
		move.w     20(a7),d0
		movea.l    62(a7),a0
		sub.w      540(a0),d0
		movea.l    62(a7),a0
		muls.w     542(a0),d0
		add.w      42(a7),d0
		move.w     d0,34(a7)
		move.w     16(a7),d0
		movea.l    62(a7),a0
		muls.w     542(a0),d0
		addq.w     #2,d0
		move.w     d0,38(a7)
		lea.l      34(a7),a1
		movea.l    50(a7),a0
		movea.l    50(a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
Auo_boxed_42:
		bra.s      Auo_boxed_39
Auo_boxed_40:
		moveq.l    #-1,d1
		movea.l    62(a7),a0
		move.w     524(a0),d0
		movea.l    62(a7),a0
		movea.l    516(a0),a0
		movea.l    62(a7),a1
		movea.l    516(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
Auo_boxed_39:
		movea.l    62(a7),a0
		andi.w     #$FFF8,546(a0)
Auo_boxed_33:
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		movea.l    62(a7),a1
		move.w     (a0),536(a1)
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		movea.l    62(a7),a1
		move.w     (a0),538(a1)
		bra        Auo_boxed_24
Auo_boxed_17:
		clr.w      d0
		movea.l    66(a7),a1
		movea.l    72(a7),a0
		bsr        boxed_insert
		bra        Auo_boxed_24
Auo_boxed_18:
		moveq.l    #1,d0
		movea.l    66(a7),a1
		movea.l    72(a7),a0
		bsr        boxed_insert
		bra        Auo_boxed_24
Auo_boxed_4:
		movea.l    50(a7),a0
		move.w     28(a0),d0
		movea.l    62(a7),a0
		cmp.w      524(a0),d0
		bne.s      Auo_boxed_47
		movea.l    62(a7),a0
		move.l     528(a0),d0
		beq.s      Auo_boxed_47
		movea.l    62(a7),a0
		move.l     532(a0),d0
		bne.s      Auo_boxed_48
Auo_boxed_47:
		clr.w      d0
		bra        Auo_boxed_20
Auo_boxed_48:
		move.w     70(a7),d0
		cmp.w      #$02C4,d0
		beq        Auo_boxed_49
		bgt.s      Auo_boxed_50
		cmp.w      #$02BD,d0
		beq        Auo_boxed_51
		bgt.s      Auo_boxed_52
		sub.w      #$000E,d0
		beq.s      Auo_boxed_53
		subq.w     #1,d0
		beq        Auo_boxed_54
		subq.w     #2,d0
		beq        Auo_boxed_55
		sub.w      #$02AB,d0
		beq        Auo_boxed_56
		bra        Auo_boxed_57
Auo_boxed_52:
		sub.w      #$02BE,d0
		beq        Auo_boxed_58
		subq.w     #1,d0
		beq        Auo_boxed_59
		subq.w     #3,d0
		beq        Auo_boxed_60
		subq.w     #1,d0
		beq        Auo_boxed_61
		bra        Auo_boxed_57
Auo_boxed_50:
		sub.w      #$02C5,d0
		cmp.w      #$0007,d0
		bhi        Auo_boxed_57
		add.w      d0,d0
		move.w     J58(pc,d0.w),d0
		jmp        J58(pc,d0.w)
J58:
		dc.w Auo_boxed_62-J58
		dc.w Auo_boxed_63-J58
		dc.w Auo_boxed_64-J58
		dc.w Auo_boxed_65-J58
		dc.w Auo_boxed_66-J58
		dc.w Auo_boxed_67-J58
		dc.w Auo_boxed_68-J58
		dc.w Auo_boxed_69-J58
Auo_boxed_53:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		ble.s      Auo_boxed_70
		movea.l    62(a7),a0
		ori.w      #$0004,546(a0)
		bra.s      Auo_boxed_71
Auo_boxed_70:
		movea.l    62(a7),a0
		ori.w      #$0001,546(a0)
Auo_boxed_71:
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		clr.w      (a0)
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		clr.w      (a0)
		moveq.l    #-1,d0
		movea.l    72(a7),a0
		bsr        boxed_viewpos
		bra        Auo_boxed_24
Auo_boxed_54:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		ble.s      Auo_boxed_72
		movea.l    62(a7),a0
		ori.w      #$0004,546(a0)
		bra.s      Auo_boxed_73
Auo_boxed_72:
		movea.l    62(a7),a0
		ori.w      #$0001,546(a0)
Auo_boxed_73:
		movea.l    62(a7),a0
		movea.l    62(a7),a1
		movea.l    528(a1),a1
		move.w     526(a0),(a1)
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		clr.w      (a0)
		moveq.l    #-1,d0
		movea.l    72(a7),a0
		bsr        boxed_viewpos
		bra        Auo_boxed_24
Auo_boxed_55:
		movea.l    66(a7),a0
		movea.l    62(a7),a1
		movea.l    528(a1),a1
		move.w     (a0),(a1)
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		ble.s      Auo_boxed_74
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		clr.w      (a0)
		movea.l    62(a7),a0
		ori.w      #$0004,546(a0)
Auo_boxed_74:
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		bmi.s      Auo_boxed_75
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		movea.l    62(a7),a0
		cmp.w      526(a0),d0
		ble.s      Auo_boxed_76
Auo_boxed_75:
		movea.l    62(a7),a0
		movea.l    62(a7),a1
		movea.l    528(a1),a1
		move.w     526(a0),(a1)
Auo_boxed_76:
		movea.l    62(a7),a0
		ori.w      #$0001,546(a0)
		moveq.l    #-1,d0
		movea.l    72(a7),a0
		bsr        boxed_viewpos
		bra        Auo_boxed_24
Auo_boxed_58:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		bne        Auo_boxed_56
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		movea.l    62(a7),a0
		cmp.w      526(a0),d0
		bne.s      Auo_boxed_77
		bra        Auo_boxed_24
Auo_boxed_77:
		movea.l    62(a7),a0
		lea.l      256(a0),a0
		move.l     a0,8(a7)
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),28(a7)
		bra.s      Auo_boxed_78
Auo_boxed_80:
		addq.w     #1,28(a7)
Auo_boxed_78:
		movea.l    62(a7),a0
		move.w     28(a7),d0
		cmp.w      526(a0),d0
		bge.s      Auo_boxed_79
		move.w     28(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Auo_boxed_80
Auo_boxed_79:
		bra.s      Auo_boxed_81
Auo_boxed_83:
		addq.w     #1,28(a7)
Auo_boxed_81:
		movea.l    62(a7),a0
		move.w     28(a7),d0
		cmp.w      526(a0),d0
		bge.s      Auo_boxed_82
		move.w     28(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,d0
		bne.s      Auo_boxed_83
Auo_boxed_82:
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     28(a7),(a0)
		movea.l    62(a7),a0
		ori.w      #$0001,546(a0)
		moveq.l    #-1,d0
		movea.l    72(a7),a0
		bsr        boxed_viewpos
		bra        Auo_boxed_24
Auo_boxed_56:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		ble.s      Auo_boxed_84
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		add.w      d0,(a0)
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		clr.w      (a0)
		movea.l    62(a7),a0
		ori.w      #$0004,546(a0)
		moveq.l    #-1,d0
		movea.l    72(a7),a0
		bsr        boxed_viewpos
		bra.s      Auo_boxed_85
Auo_boxed_84:
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		movea.l    62(a7),a0
		cmp.w      526(a0),d0
		bge.s      Auo_boxed_85
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		addq.w     #1,(a0)
		moveq.l    #-1,d0
		movea.l    72(a7),a0
		bsr        boxed_viewpos
		movea.l    62(a7),a0
		ori.w      #$0001,546(a0)
Auo_boxed_85:
		bra        Auo_boxed_24
Auo_boxed_59:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		bne        Auo_boxed_51
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		bne.s      Auo_boxed_86
		bra        Auo_boxed_24
Auo_boxed_86:
		movea.l    62(a7),a0
		lea.l      256(a0),a0
		move.l     a0,8(a7)
		moveq.l    #-1,d0
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		add.w      (a0),d0
		move.w     d0,28(a7)
		bra.s      Auo_boxed_87
Auo_boxed_89:
		subq.w     #1,28(a7)
Auo_boxed_87:
		move.w     28(a7),d0
		bmi.s      Auo_boxed_88
		move.w     28(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,d0
		bne.s      Auo_boxed_89
Auo_boxed_88:
		bra.s      Auo_boxed_90
Auo_boxed_92:
		subq.w     #1,28(a7)
Auo_boxed_90:
		move.w     28(a7),d0
		bmi.s      Auo_boxed_91
		move.w     28(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Auo_boxed_92
Auo_boxed_91:
		moveq.l    #1,d0
		add.w      28(a7),d0
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     d0,(a0)
		movea.l    62(a7),a0
		ori.w      #$0001,546(a0)
		moveq.l    #-1,d0
		movea.l    72(a7),a0
		bsr        boxed_viewpos
		bra        Auo_boxed_24
Auo_boxed_51:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		ble.s      Auo_boxed_93
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		clr.w      (a0)
		movea.l    62(a7),a0
		ori.w      #$0004,546(a0)
		moveq.l    #-1,d0
		movea.l    72(a7),a0
		bsr        boxed_viewpos
		bra.s      Auo_boxed_94
Auo_boxed_93:
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		ble.s      Auo_boxed_94
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		subq.w     #1,(a0)
		moveq.l    #-1,d0
		movea.l    72(a7),a0
		bsr        boxed_viewpos
		movea.l    62(a7),a0
		ori.w      #$0001,546(a0)
Auo_boxed_94:
		bra        Auo_boxed_24
Auo_boxed_60:
		move.l     66(a7),24(a7)
		movea.l    24(a7),a0
		move.w     (a0),d0
		movea.l    24(a7),a0
		cmp.w      2(a0),d0
		bge.s      Auo_boxed_95
		movea.l    24(a7),a0
		move.w     (a0),20(a7)
		movea.l    24(a7),a0
		move.w     2(a0),18(a7)
		bra.s      Auo_boxed_96
Auo_boxed_95:
		movea.l    24(a7),a0
		move.w     2(a0),20(a7)
		movea.l    24(a7),a0
		move.w     (a0),18(a7)
Auo_boxed_96:
		move.w     20(a7),d0
		bpl.s      Auo_boxed_97
		movea.l    62(a7),a0
		move.w     526(a0),18(a7)
		clr.w      20(a7)
Auo_boxed_97:
		movea.l    62(a7),a0
		move.w     18(a7),d0
		cmp.w      526(a0),d0
		ble.s      Auo_boxed_98
		movea.l    62(a7),a0
		move.w     526(a0),18(a7)
Auo_boxed_98:
		movea.l    62(a7),a0
		move.w     20(a7),d0
		cmp.w      526(a0),d0
		ble.s      Auo_boxed_99
		movea.l    62(a7),a0
		move.w     526(a0),20(a7)
Auo_boxed_99:
		moveq.l    #16,d0
		movea.l    62(a7),a0
		and.w      546(a0),d0
		beq        Auo_boxed_100
		movea.l    62(a7),a0
		lea.l      256(a0),a0
		move.l     a0,8(a7)
		move.w     20(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,4(a7)
		bra.s      Auo_boxed_101
Auo_boxed_108:
		subq.w     #1,20(a7)
Auo_boxed_101:
		move.w     20(a7),d0
		bmi.s      Auo_boxed_102
		move.l     4(a7),d0
		beq.s      Auo_boxed_103
		move.w     20(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Auo_boxed_104
		moveq.l    #1,d0
		bra.s      Auo_boxed_105
Auo_boxed_104:
		clr.w      d0
Auo_boxed_105:
		bra.s      Auo_boxed_106
Auo_boxed_103:
		move.w     20(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,d0
		bne.s      Auo_boxed_107
		moveq.l    #1,d0
		bra.s      Auo_boxed_106
Auo_boxed_107:
		clr.w      d0
Auo_boxed_106:
		tst.w      d0
		bne.s      Auo_boxed_108
Auo_boxed_102:
		addq.w     #1,20(a7)
		move.w     18(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,4(a7)
		bra.s      Auo_boxed_109
Auo_boxed_115:
		addq.w     #1,18(a7)
Auo_boxed_109:
		movea.l    62(a7),a0
		move.w     18(a7),d0
		cmp.w      526(a0),d0
		bge.s      Auo_boxed_100
		move.l     4(a7),d0
		beq.s      Auo_boxed_110
		move.w     18(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Auo_boxed_111
		moveq.l    #1,d0
		bra.s      Auo_boxed_112
Auo_boxed_111:
		clr.w      d0
Auo_boxed_112:
		bra.s      Auo_boxed_113
Auo_boxed_110:
		move.w     18(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,d0
		bne.s      Auo_boxed_114
		moveq.l    #1,d0
		bra.s      Auo_boxed_113
Auo_boxed_114:
		clr.w      d0
Auo_boxed_113:
		tst.w      d0
		bne.s      Auo_boxed_115
Auo_boxed_100:
		movea.l    24(a7),a0
		move.w     2(a0),d0
		movea.l    72(a7),a0
		bsr        boxed_viewpos
		move.w     20(a7),d0
		cmp.w      18(a7),d0
		bne.s      Auo_boxed_116
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     20(a7),(a0)
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		clr.w      (a0)
		bra.s      Auo_boxed_117
Auo_boxed_116:
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     20(a7),(a0)
		move.w     18(a7),d0
		sub.w      20(a7),d0
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     d0,(a0)
Auo_boxed_117:
		movea.l    62(a7),a0
		ori.w      #$0002,546(a0)
		bra        Auo_boxed_24
Auo_boxed_61:
		move.l     66(a7),24(a7)
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		movea.l    24(a7),a1
		move.w     (a0),(a1)
		movea.l    24(a7),a0
		move.w     (a0),d0
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		add.w      (a0),d0
		movea.l    24(a7),a0
		move.w     d0,2(a0)
		bra        Auo_boxed_24
Auo_boxed_63:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		bne.s      Auo_boxed_62
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		movea.l    62(a7),a1
		movea.l    532(a1),a1
		move.w     (a0),(a1)
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		clr.w      (a0)
Auo_boxed_62:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		bne        Auo_boxed_49
		moveq.l    #-1,d0
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		add.w      (a0),d0
		move.w     d0,28(a7)
		movea.l    62(a7),a0
		lea.l      256(a0),a0
		move.l     a0,8(a7)
		move.w     28(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,4(a7)
		bra.s      Auo_boxed_118
Auo_boxed_125:
		subq.w     #1,28(a7)
Auo_boxed_118:
		move.w     28(a7),d0
		bmi.s      Auo_boxed_119
		move.l     4(a7),d0
		beq.s      Auo_boxed_120
		move.w     28(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Auo_boxed_121
		moveq.l    #1,d0
		bra.s      Auo_boxed_122
Auo_boxed_121:
		clr.w      d0
Auo_boxed_122:
		bra.s      Auo_boxed_123
Auo_boxed_120:
		move.w     28(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,d0
		bne.s      Auo_boxed_124
		moveq.l    #1,d0
		bra.s      Auo_boxed_123
Auo_boxed_124:
		clr.w      d0
Auo_boxed_123:
		tst.w      d0
		bne.s      Auo_boxed_125
Auo_boxed_119:
		addq.w     #1,28(a7)
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		sub.w      28(a7),d0
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     d0,(a0)
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     28(a7),(a0)
Auo_boxed_49:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		bne.s      Auo_boxed_126
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		ble.s      Auo_boxed_126
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		addq.w     #1,(a0)
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		subq.w     #1,(a0)
Auo_boxed_126:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		beq.s      Auo_boxed_127
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d1
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		movea.l    72(a7),a0
		bsr        boxed_delsel
		moveq.l    #-1,d0
		movea.l    72(a7),a0
		bsr        boxed_viewpos
Auo_boxed_127:
		bra        Auo_boxed_24
Auo_boxed_66:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		bne.s      Auo_boxed_65
		movea.l    62(a7),a0
		move.w     526(a0),d0
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		sub.w      (a0),d0
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     d0,(a0)
Auo_boxed_65:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		bne        Auo_boxed_64
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),28(a7)
		movea.l    62(a7),a0
		lea.l      256(a0),a0
		move.l     a0,8(a7)
		move.w     28(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,4(a7)
		bra.s      Auo_boxed_128
Auo_boxed_135:
		addq.w     #1,28(a7)
Auo_boxed_128:
		movea.l    62(a7),a0
		move.w     28(a7),d0
		cmp.w      526(a0),d0
		bge.s      Auo_boxed_129
		move.l     4(a7),d0
		beq.s      Auo_boxed_130
		move.w     28(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Auo_boxed_131
		moveq.l    #1,d0
		bra.s      Auo_boxed_132
Auo_boxed_131:
		clr.w      d0
Auo_boxed_132:
		bra.s      Auo_boxed_133
Auo_boxed_130:
		move.w     28(a7),d1
		movea.l    8(a7),a0
		move.b     0(a0,d1.w),d0
		ext.w      d0
		movea.l    ACSblk,a0
		lea.l      998(a0),a0
		jsr        strchr
		move.l     a0,d0
		bne.s      Auo_boxed_134
		moveq.l    #1,d0
		bra.s      Auo_boxed_133
Auo_boxed_134:
		clr.w      d0
Auo_boxed_133:
		tst.w      d0
		bne.s      Auo_boxed_135
Auo_boxed_129:
		move.w     28(a7),d0
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		sub.w      (a0),d0
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     d0,(a0)
Auo_boxed_64:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		bne.s      Auo_boxed_136
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		movea.l    62(a7),a0
		cmp.w      526(a0),d0
		bge.s      Auo_boxed_136
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		addq.w     #1,(a0)
Auo_boxed_136:
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		beq.s      Auo_boxed_137
		movea.l    62(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d1
		movea.l    62(a7),a0
		movea.l    528(a0),a0
		move.w     (a0),d0
		movea.l    72(a7),a0
		bsr        boxed_delsel
		moveq.l    #-1,d0
		movea.l    72(a7),a0
		bsr        boxed_viewpos
Auo_boxed_137:
		bra.s      Auo_boxed_24
Auo_boxed_67:
		movea.l    62(a7),a0
		move.w     526(a0),d1
		clr.w      d0
		movea.l    72(a7),a0
		bsr        boxed_delsel
		moveq.l    #-1,d0
		movea.l    72(a7),a0
		bsr        boxed_viewpos
		bra.s      Auo_boxed_24
Auo_boxed_68:
		movea.l    62(a7),a0
		move.l     512(a0),d0
		beq.s      Auo_boxed_138
		movea.l    62(a7),a0
		movea.l    512(a0),a0
		jsr        Ast_delete
		movea.l    62(a7),a0
		clr.l      512(a0)
Auo_boxed_138:
		move.l     66(a7),8(a7)
		move.l     8(a7),d0
		beq.s      Auo_boxed_139
		movea.l    8(a7),a0
		jsr        Ast_create
		movea.l    62(a7),a1
		move.l     a0,512(a1)
Auo_boxed_139:
		bra.s      Auo_boxed_24
Auo_boxed_69:
		movea.l    72(a7),a0
		bsr        boxed_charlist
		bra.s      Auo_boxed_24
Auo_boxed_57:
		clr.w      d0
		bra.s      Auo_boxed_20
Auo_boxed_24:
		moveq.l    #1,d0
Auo_boxed_20:
		lea.l      76(a7),a7
		movea.l    (a7)+,a2
		rts
Auo_boxed_13:

	.globl A_boxed
A_boxed:
		move.l     d2,-(a7)
		move.l     a2,-(a7)
		lea.l      -590(a7),a7
		clr.l      518(a7)
		movea.l    602(a7),a0
		move.w     22(a0),d0
		bne.s      A_boxed_1
		movea.l    602(a7),a0
		move.w     24(a0),d0
		beq.s      A_boxed_2
A_boxed_1:
		movea.l    602(a7),a0
		move.w     18(a0),558(a7)
		move.w     558(a7),d0
		movea.l    602(a7),a0
		add.w      22(a0),d0
		subq.w     #1,d0
		move.w     d0,562(a7)
		movea.l    602(a7),a0
		move.w     20(a0),560(a7)
		move.w     560(a7),d0
		movea.l    602(a7),a0
		add.w      24(a0),d0
		subq.w     #1,d0
		move.w     d0,564(a7)
		lea.l      558(a7),a0
		moveq.l    #1,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		bra.s      A_boxed_3
A_boxed_2:
		lea.l      558(a7),a0
		clr.w      d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
A_boxed_3:
		movea.l    602(a7),a0
		lea.l      26(a0),a0
		move.l     a0,522(a7)
		movea.l    602(a7),a0
		move.w     4(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    602(a7),a0
		movea.l    (a0),a0
		adda.l     d0,a0
		move.l     a0,582(a7)
		movea.l    582(a7),a0
		move.l     12(a0),574(a7)
		movea.l    574(a7),a0
		move.l     16(a0),586(a7)
		movea.l    586(a7),a0
		move.l     516(a0),578(a7)
		move.l     578(a7),d0
		beq.s      A_boxed_4
		movea.l    578(a7),a0
		move.w     28(a0),d0
		movea.l    586(a7),a0
		cmp.w      524(a0),d0
		bne.s      A_boxed_4
		movea.l    578(a7),a0
		move.w     30(a0),526(a7)
		movea.l    586(a7),a0
		move.w     540(a0),528(a7)
		bra.s      A_boxed_5
A_boxed_4:
		move.w     #$FFFF,526(a7)
		clr.w      528(a7)
A_boxed_5:
		movea.l    602(a7),a0
		move.w     14(a0),d0
		ext.l      d0
		movea.l    586(a7),a0
		divs.w     542(a0),d0
		move.w     d0,550(a7)
		movea.l    522(a7),a0
		move.w     2(a0),d0
		lsr.w      #8,d0
		and.w      #$00FF,d0
		cmp.w      550(a7),d0
		bcc.s      A_boxed_6
		movea.l    522(a7),a0
		move.w     2(a0),d0
		lsr.w      #8,d0
		and.w      #$00FF,d0
		move.w     d0,550(a7)
A_boxed_6:
		move.w     550(a7),d0
		movea.l    586(a7),a0
		muls.w     542(a0),d0
		move.w     d0,552(a7)
		moveq.l    #-1,d0
		movea.l    602(a7),a0
		add.w      10(a0),d0
		move.w     d0,566(a7)
		move.w     566(a7),d0
		add.w      552(a7),d0
		addq.w     #1,d0
		move.w     d0,570(a7)
		movea.l    602(a7),a0
		move.w     16(a0),d0
		movea.l    586(a7),a0
		sub.w      544(a0),d0
		asr.w      #1,d0
		movea.l    602(a7),a0
		add.w      12(a0),d0
		subq.w     #1,d0
		move.w     d0,568(a7)
		move.w     568(a7),d0
		movea.l    586(a7),a0
		add.w      544(a0),d0
		move.w     d0,572(a7)
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vswr_mode
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_width
		clr.w      d2
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_ends
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_type
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_effects
		movea.l    522(a7),a0
		move.w     2(a0),d0
		lsr.w      #2,d0
		and.w      #$0001,d0
		beq.s      A_boxed_7
		movea.l    ACSblk,a0
		move.w     660(a0),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		pea.l      554(a7)
		pea.l      558(a7)
		lea.l      562(a7),a1
		lea.l      562(a7),a0
		movea.l    ACSblk,a2
		move.w     662(a2),d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_height
		addq.w     #8,a7
		bra.s      A_boxed_8
A_boxed_7:
		movea.l    ACSblk,a0
		move.w     656(a0),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		pea.l      554(a7)
		pea.l      558(a7)
		lea.l      562(a7),a1
		lea.l      562(a7),a0
		movea.l    ACSblk,a2
		move.w     658(a2),d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_height
		addq.w     #8,a7
A_boxed_8:
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_interior
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_perimeter
		lea.l      566(a7),a0
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_bar
		moveq.l    #16,d0
		movea.l    582(a7),a0
		and.w      10(a0),d0
		beq        A_boxed_9
		movea.l    522(a7),a0
		move.w     2(a0),d0
		lsr.w      #1,d0
		and.w      #$0001,d0
		beq.s      A_boxed_10
		movea.l    ACSblk,a0
		cmpi.w     #$0004,28(a0)
		blt.s      A_boxed_10
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0100,d0
		bne.s      A_boxed_10
		movea.l    522(a7),a0
		move.w     (a0),d0
		moveq.l    #12,d1
		lsr.w      d1,d0
		and.w      #$000F,d0
		move.w     d0,556(a7)
		movea.l    522(a7),a0
		move.w     (a0),d0
		lsr.w      #8,d0
		and.w      #$000F,d0
		move.w     d0,554(a7)
		bra.s      A_boxed_11
A_boxed_10:
		moveq.l    #1,d0
		move.w     d0,554(a7)
		move.w     d0,556(a7)
A_boxed_11:
		moveq.l    #1,d0
		add.w      570(a7),d0
		move.w     d0,530(a7)
		move.w     d0,546(a7)
		moveq.l    #-1,d0
		add.w      568(a7),d0
		move.w     d0,532(a7)
		move.w     d0,548(a7)
		moveq.l    #1,d0
		add.w      570(a7),d0
		move.w     d0,534(a7)
		moveq.l    #1,d0
		add.w      572(a7),d0
		move.w     d0,536(a7)
		moveq.l    #-1,d0
		add.w      566(a7),d0
		move.w     d0,538(a7)
		moveq.l    #1,d0
		add.w      572(a7),d0
		move.w     d0,540(a7)
		moveq.l    #-1,d0
		add.w      566(a7),d0
		move.w     d0,542(a7)
		moveq.l    #-1,d0
		add.w      568(a7),d0
		move.w     d0,544(a7)
		move.w     556(a7),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_color
		lea.l      538(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_pline
		move.w     554(a7),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_color
		lea.l      530(a7),a0
		moveq.l    #3,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_pline
A_boxed_9:
		addq.w     #1,566(a7)
		addq.w     #1,568(a7)
		subq.w     #2,570(a7)
		subq.w     #1,572(a7)
		movea.l    522(a7),a0
		move.w     2(a0),d1
		lsr.w      #4,d1
		and.w      #$000F,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_color
		lea.l      554(a7),a1
		lea.l      554(a7),a0
		moveq.l    #5,d2
		clr.w      d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_alignment
		movea.l    586(a7),a0
		move.w     526(a0),d0
		beq        A_boxed_12
		moveq.l    #1,d0
		movea.l    522(a7),a0
		and.w      2(a0),d0
		beq.s      A_boxed_13
		lea.l      256(a7),a0
		move.l     a0,514(a7)
		move.l     #$000000FF,d1
		moveq.l    #42,d0
		lea.l      256(a7),a0
		jsr        memset
		clr.b      d0
		move.b     d0,511(a7)
		movea.l    586(a7),a0
		move.w     526(a0),d1
		lea.l      256(a7),a0
		move.b     d0,0(a0,d1.w)
		bra.s      A_boxed_14
A_boxed_13:
		move.w     528(a7),d0
		movea.l    586(a7),a0
		adda.w     d0,a0
		lea.l      256(a0),a0
		move.l     a0,514(a7)
A_boxed_14:
		movea.l    586(a7),a0
		move.w     526(a0),d0
		sub.w      528(a7),d0
		cmp.w      550(a7),d0
		ble.s      A_boxed_15
		move.w     550(a7),d0
		movea.l    514(a7),a0
		adda.w     d0,a0
		move.l     a0,518(a7)
		movea.l    518(a7),a0
		move.b     (a0),512(a7)
		movea.l    518(a7),a0
		clr.b      (a0)
A_boxed_15:
		movea.l    514(a7),a1
		lea.l      (a7),a0
		jsr        strcpy
		movea.l    514(a7),a0
		move.w     568(a7),d2
		movea.l    602(a7),a1
		move.w     10(a1),d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_gtext
		move.l     518(a7),d0
		beq.s      A_boxed_12
		movea.l    518(a7),a0
		move.b     512(a7),(a0)
A_boxed_12:
		move.w     550(a7),d0
		movea.l    586(a7),a0
		sub.w      526(a0),d0
		add.w      528(a7),d0
		move.w     d0,554(a7)
		move.w     554(a7),d0
		ble.s      A_boxed_16
		move.l     #$000000FF,d1
		moveq.l    #95,d0
		lea.l      256(a7),a0
		jsr        memset
		move.w     554(a7),d0
		lea.l      256(a7),a0
		clr.b      0(a0,d0.w)
		lea.l      256(a7),a0
		move.w     568(a7),d2
		movea.l    586(a7),a1
		move.w     526(a1),d1
		sub.w      528(a7),d1
		movea.l    586(a7),a1
		muls.w     542(a1),d1
		movea.l    602(a7),a1
		add.w      10(a1),d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_gtext
A_boxed_16:
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsl_color
		moveq.l    #1,d0
		movea.l    602(a7),a0
		and.w      8(a0),d0
		beq.s      A_boxed_17
		moveq.l    #-1,d0
		movea.l    602(a7),a0
		add.w      10(a0),d0
		move.w     d0,530(a7)
		move.w     d0,546(a7)
		move.w     d0,542(a7)
		move.w     530(a7),d0
		add.w      552(a7),d0
		addq.w     #1,d0
		move.w     d0,538(a7)
		move.w     d0,534(a7)
		movea.l    602(a7),a0
		move.w     16(a0),d0
		movea.l    586(a7),a0
		sub.w      544(a0),d0
		asr.w      #1,d0
		movea.l    602(a7),a0
		add.w      12(a0),d0
		subq.w     #1,d0
		move.w     d0,532(a7)
		move.w     d0,548(a7)
		move.w     d0,536(a7)
		move.w     532(a7),d0
		movea.l    586(a7),a0
		add.w      544(a0),d0
		move.w     d0,540(a7)
		move.w     d0,544(a7)
		lea.l      530(a7),a0
		moveq.l    #5,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_pline
A_boxed_17:
		move.w     526(a7),d0
		bmi        A_boxed_18
		moveq.l    #3,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vswr_mode
		movea.l    586(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		ble        A_boxed_19
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_interior
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_color
		move.w     526(a7),d0
		sub.w      528(a7),d0
		movea.l    586(a7),a0
		muls.w     542(a0),d0
		movea.l    602(a7),a0
		add.w      10(a0),d0
		move.w     d0,566(a7)
		movea.l    586(a7),a0
		movea.l    532(a0),a0
		move.w     (a0),d0
		movea.l    586(a7),a0
		muls.w     542(a0),d0
		add.w      566(a7),d0
		subq.w     #1,d0
		move.w     d0,570(a7)
		movea.l    602(a7),a0
		move.w     566(a7),d0
		cmp.w      10(a0),d0
		bge.s      A_boxed_20
		movea.l    602(a7),a0
		move.w     10(a0),566(a7)
A_boxed_20:
		movea.l    602(a7),a0
		move.w     10(a0),d0
		add.w      552(a7),d0
		move.w     570(a7),d1
		cmp.w      d0,d1
		ble.s      A_boxed_21
		movea.l    602(a7),a0
		move.w     10(a0),d0
		add.w      552(a7),d0
		move.w     d0,570(a7)
A_boxed_21:
		lea.l      566(a7),a0
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_bar
		bra.s      A_boxed_18
A_boxed_19:
		move.w     526(a7),d0
		sub.w      528(a7),d0
		movea.l    586(a7),a0
		muls.w     542(a0),d0
		movea.l    602(a7),a0
		add.w      10(a0),d0
		move.w     d0,566(a7)
		move.w     566(a7),570(a7)
		movea.l    602(a7),a0
		move.w     566(a7),d0
		cmp.w      10(a0),d0
		blt.s      A_boxed_18
		movea.l    602(a7),a0
		move.w     10(a0),d0
		movea.l    602(a7),a0
		add.w      14(a0),d0
		move.w     566(a7),d1
		cmp.w      d0,d1
		bgt.s      A_boxed_18
		lea.l      566(a7),a0
		moveq.l    #2,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_pline
A_boxed_18:
		lea.l      558(a7),a0
		clr.w      d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		moveq.l    #-18,d0
		movea.l    602(a7),a0
		and.w      8(a0),d0
		lea.l      590(a7),a7
		movea.l    (a7)+,a2
		move.l     (a7)+,d2
		rts

	.data

CHARLIST:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $00ff
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $0020
		dc.w $0010
CHARENTRY:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $001b
		dc.w $0005
		dc.w $0000
		dc.w $0000
		dc.w $0170
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
xe1dfa:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xe1efa:
		dc.w $2000
xe1efc:
		dc.w $2000
xe1efe:
		dc.b $3a,$5c,0
xe1f01:
		dc.b 'azAZ09',0
xe1f08:
		dc.b '._!@#$%^&()+-=~',$27,';",<>|[]{}',0
xe1f23:
		dc.b 'azAZ09',0
xe1f2a:
		dc.b '._!@#$%^&()+-=~',$27,';",<>|[]{}*?',0
xe1f47:
		dc.b 'azAZ09',0
xe1f4e:
		dc.b '._!@#$%^&()+-=~',$27,';",<>|[]{}\:',0
xe1f6b:
		dc.b 'azAZ09',0
xe1f72:
		dc.b '._!@#$%^&()+-=~',$27,';",<>|[]{}*?\:',0
xe1f91:
		dc.b 'azAZ',0
xe1f96:
		dc.b 'azAZ09',0
xe1f9d:
		dc.b $20,0
xe1f9f:
		dc.b $30
		dc.w $3100
xe1fa2:
		dc.b $30,$37,0
xe1fa5:
		dc.b $30
		dc.w $3900
xe1fa8:
		dc.b '09afAF',0
xe1faf:
		dc.b $30
		dc.w $3900
xe1fb2:
		dc.w $2e00
xe1fb4:
		dc.b $30,$39,0
xe1fb7:
		dc.b '%ld',0
xe1fbb:
		dc.b '%c',0
xe1fbe:
		dc.b '%ld',0
xe1fc2:
		dc.b $25,$63,0
xe1fc5:
		dc.b $25
		dc.b $6c,$64,0
		.even
