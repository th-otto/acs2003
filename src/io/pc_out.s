	.text

	.globl info_start
info_start:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a4
		jsr        Aev_mess
		lea.l      work,a2
		lea.l      info_xywh,a3
		lea.l      OUTPUT_INFO,a0
		jsr        Aob_create
		move.l     a0,(a2)
		move.l     a0,d0
		beq        info_start_1
		jsr        Aob_fix
		move.l     _globl,-(a7)
		pea.l      6(a3)
		pea.l      4(a3)
		pea.l      2(a3)
		movea.l    a3,a1
		movea.l    (a2),a0
		jsr        mt_form_center
		lea.l      16(a7),a7
		subq.w     #1,(a3)
		subq.w     #1,2(a3)
		addq.w     #2,4(a3)
		addq.w     #2,6(a3)
		movea.l    a3,a0
		jsr        Aob_save
		move.l     a0,8(a3)
		moveq.l    #31,d0
		movea.l    a4,a1
		movea.l    (a2),a0
		movea.l    204(a0),a0
		movea.l    (a0),a0
		jsr        strncpy
		movea.l    (a2),a0
		movea.l    156(a0),a1
		movea.l    (a1),a4
		clr.b      (a4)
		movea.l    (a2),a0
		movea.l    252(a0),a1
		movea.l    (a1),a4
		clr.b      (a4)
		movea.l    (a2),a0
		movea.l    300(a0),a1
		movea.l    (a1),a4
		clr.b      (a4)
		move.w     6(a3),-(a7)
		move.w     4(a3),-(a7)
		move.w     2(a3),-(a7)
		movea.l    _globl,a1
		move.w     (a3),d2
		moveq.l    #10,d1
		clr.w      d0
		movea.l    (a2),a0
		jsr        mt_objc_draw
		addq.w     #6,a7
info_start_1:
		movem.l    (a7)+,a2-a4
		rts

	.globl info_end
info_end:
		movea.l    work,a0
		jsr        Aob_delete
		lea.l      info_xywh,a1
		movea.l    info_bp,a0
		jsr        Aob_restore
		rts

	.globl info_title
info_title:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		lea.l      info_xywh,a3
		move.l     12(a3),d0
		beq.s      info_title_1
		movea.l    a2,a1
		movea.l    d0,a0
		movea.l    156(a0),a0
		movea.l    (a0),a0
		jsr        strcpy
		move.w     6(a3),-(a7)
		move.w     4(a3),-(a7)
		move.w     2(a3),-(a7)
		movea.l    _globl,a1
		move.w     (a3),d2
		moveq.l    #1,d1
		moveq.l    #6,d0
		movea.l    12(a3),a0
		jsr        mt_objc_draw
		addq.w     #6,a7
		lea.l      xa59c8,a0
		jsr        info_list
		lea.l      xa59c8,a0
		jsr        info_obj
info_title_1:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl info_list
info_list:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		lea.l      info_xywh,a3
		move.l     12(a3),d0
		beq.s      info_list_1
		movea.l    a2,a1
		movea.l    d0,a0
		movea.l    252(a0),a0
		movea.l    (a0),a0
		jsr        strcpy
		move.w     6(a3),-(a7)
		move.w     4(a3),-(a7)
		move.w     2(a3),-(a7)
		movea.l    _globl,a1
		move.w     (a3),d2
		moveq.l    #1,d1
		moveq.l    #10,d0
		movea.l    12(a3),a0
		jsr        mt_objc_draw
		addq.w     #6,a7
		lea.l      xa59c8,a0
		jsr        info_obj
info_list_1:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl info_obj
info_obj:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		lea.l      info_xywh,a3
		move.l     12(a3),d0
		beq.s      info_obj_1
		movea.l    a2,a1
		movea.l    d0,a0
		movea.l    300(a0),a0
		movea.l    (a0),a0
		jsr        strcpy
		move.w     6(a3),-(a7)
		move.w     4(a3),-(a7)
		move.w     2(a3),-(a7)
		movea.l    _globl,a1
		move.w     (a3),d2
		moveq.l    #1,d1
		moveq.l    #12,d0
		movea.l    12(a3),a0
		jsr        mt_objc_draw
		addq.w     #6,a7
info_obj_1:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

out_label:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a2
		movea.l    a1,a4
		move.l     a2,d0
		beq.s      out_label_1
		lea.l      iostring,a3
		pea.l      22(a2)
		lea.l      xa59c9,a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a3,a0
		jsr        save_string
		bra.s      out_label_2
out_label_1:
		movea.l    a4,a0
		jsr        save_string
out_label_2:
		movem.l    (a7)+,a2-a4
		rts

out_label2:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a2
		movea.l    a1,a4
		move.l     a2,d0
		beq.s      out_label2_1
		lea.l      iostring,a3
		pea.l      22(a2)
		lea.l      xa59cf,a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a3,a0
		jsr        save_string
		bra.s      out_label2_2
out_label2_1:
		movea.l    a4,a0
		jsr        save_string
out_label2_2:
		movem.l    (a7)+,a2-a4
		rts

out_label3:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a2
		movea.l    a1,a4
		move.l     a2,d0
		beq.s      out_label3_1
		lea.l      iostring,a3
		pea.l      22(a2)
		lea.l      xa59d6,a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a3,a0
		jsr        save_string
		bra.s      out_label3_2
out_label3_1:
		movea.l    a4,a0
		jsr        save_string
out_label3_2:
		movem.l    (a7)+,a2-a4
		rts

out_acs:
		movem.l    d3/a2-a6,-(a7)
		lea.l      -36(a7),a7
		movea.l    a0,a2
		move.w     6(a2),d0
		and.w      #$8000,d0
		bne        out_acs_1
		lea.l      xa59c8,a3
		lea.l      24(a3),a0
		jsr        save_string
		lea.l      46(a3),a0
		jsr        save_string
		lea.l      iostring,a4
		pea.l      92(a2)
		moveq.l    #64,d0
		or.w       90(a2),d0
		move.w     d0,-(a7)
		move.w     88(a2),-(a7)
		move.w     86(a2),-(a7)
		move.w     #$012C,-(a7)
		pea.l      100(a3)
		lea.l      53(a3),a1
		movea.l    a4,a0
		jsr        sprintf
		lea.l      16(a7),a7
		movea.l    a4,a0
		jsr        save_string
		lea.l      108(a3),a1
		movea.l    124(a2),a0
		bsr        out_label2
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    128(a2),a0
		bsr        out_label2
		lea.l      126(a3),a0
		jsr        save_string
		lea.l      132(a2),a5
		clr.w      d3
		bra.s      out_acs_2
out_acs_6:
		tst.w      d3
		beq.s      out_acs_3
		lea.l      135(a3),a0
		jsr        save_string
out_acs_3:
		cmpi.w     #$00FF,(a5)
		beq.s      out_acs_4
		move.w     (a5),-(a7)
		lea.l      139(a3),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #2,a7
		bra.s      out_acs_5
out_acs_4:
		movea.l    2(a5),a0
		pea.l      22(a0)
		lea.l      154(a3),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #4,a7
out_acs_5:
		movea.l    a4,a0
		jsr        save_string
		addq.w     #6,a5
		addq.w     #1,d3
out_acs_2:
		cmp.w      #$0020,d3
		blt.s      out_acs_6
		lea.l      168(a3),a0
		jsr        save_string
		clr.w      d3
		bra        out_acs_7
out_acs_11:
		move.w     d3,-(a7)
		lea.l      177(a3),a1
		lea.l      2(a7),a0
		jsr        sprintf
		addq.w     #2,a7
		lea.l      (a7),a1
		movea.l    52(a2),a0
		jsr        find_entry
		movea.l    a0,a6
		move.l     a6,d0
		bne.s      out_acs_8
		lea.l      (a7),a1
		movea.l    36(a2),a0
		jsr        find_entry
		movea.l    a0,a6
		move.l     a6,d0
		bne.s      out_acs_8
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      mlmess,a1
		move.l     0(a1,d0.l),-(a7)
		lea.l      187(a3),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_acs_9
out_acs_8:
		move.l     4(a6),-(a7)
		lea.l      187(a3),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #4,a7
out_acs_9:
		movea.l    a4,a0
		jsr        save_string
		cmp.w      #$0021,d3
		bge.s      out_acs_10
		lea.l      194(a3),a0
		jsr        save_string
out_acs_10:
		lea.l      50(a3),a0
		jsr        save_string
		addq.w     #1,d3
out_acs_7:
		cmp.w      #$0022,d3
		blt        out_acs_11
		lea.l      196(a3),a0
		jsr        save_string
		lea.l      202(a3),a0
		jsr        save_string
		lea.l      227(a3),a0
		jsr        save_string
		lea.l      236(a3),a0
		jsr        save_string
		movea.l    a3,a1
		movea.l    532(a2),a0
		bsr        out_label
		lea.l      239(a3),a0
		jsr        save_string
		lea.l      244(a3),a1
		movea.l    536(a2),a0
		bsr        out_label
		lea.l      247(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    540(a2),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		move.w     544(a2),d0
		beq.s      out_acs_12
		lea.l      251(a3),a0
		bra.s      out_acs_13
out_acs_12:
		lea.l      258(a3),a0
out_acs_13:
		jsr        save_string
		move.w     546(a2),d0
		beq.s      out_acs_14
		lea.l      251(a3),a0
		bra.s      out_acs_15
out_acs_14:
		lea.l      258(a3),a0
out_acs_15:
		jsr        save_string
		cmpi.w     #$0004,548(a2)
		ble.s      out_acs_16
		move.w     548(a2),-(a7)
		lea.l      266(a3),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #2,a7
		bra.s      out_acs_17
out_acs_16:
		lea.l      275(a3),a1
		movea.l    a4,a0
		jsr        strcpy
out_acs_17:
		movea.l    a4,a0
		jsr        save_string
		lea.l      192(a3),a0
		jsr        save_string
		lea.l      109(a3),a1
		movea.l    550(a2),a0
		bsr        out_label
		lea.l      93(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    554(a2),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    558(a2),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    562(a2),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    566(a2),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    570(a2),a0
		bsr        out_label
		lea.l      283(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    574(a2),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    578(a2),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    582(a2),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    586(a2),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    590(a2),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		move.w     594(a2),-(a7)
		lea.l      290(a3),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a4,a0
		jsr        save_string
		move.w     596(a2),d0
		ble.s      out_acs_18
		move.w     d0,d1
		add.w      d1,d1
		add.w      d0,d1
		lea.l      xacc_types,a0
		pea.l      0(a0,d1.w)
		lea.l      295(a3),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_acs_19
out_acs_18:
		lea.l      302(a3),a1
		movea.l    a4,a0
		jsr        strcpy
out_acs_19:
		movea.l    a4,a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    598(a2),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    602(a2),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      306(a3),a1
		movea.l    606(a2),a0
		bsr        out_label
		lea.l      314(a3),a0
		jsr        save_string
out_acs_1:
		lea.l      36(a7),a7
		movem.l    (a7)+,d3/a2-a6
		rts

out_cicon:
		movem.l    d3/a2-a5,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.w     d0,d3
		lea.l      xa59c8,a4
		lea.l      iostring,a5
		move.w     (a2),-(a7)
		move.l     a3,-(a7)
		move.w     (a2),-(a7)
		lea.l      322(a4),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #8,a7
		movea.l    a5,a0
		jsr        save_string
		lea.l      121(a4),a1
		movea.l    2(a2),a0
		bsr        out_label3
		lea.l      94(a4),a0
		jsr        save_string
		lea.l      121(a4),a1
		movea.l    6(a2),a0
		bsr        out_label
		lea.l      94(a4),a0
		jsr        save_string
		lea.l      121(a4),a1
		movea.l    10(a2),a0
		bsr        out_label3
		lea.l      94(a4),a0
		jsr        save_string
		lea.l      121(a4),a1
		movea.l    14(a2),a0
		bsr        out_label
		tst.w      d3
		beq.s      out_cicon_1
		move.l     a3,-(a7)
		move.w     d3,-(a7)
		lea.l      359(a4),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #6,a7
		movea.l    a5,a0
		jsr        save_string
		bra.s      out_cicon_2
out_cicon_1:
		lea.l      378(a4),a0
		jsr        save_string
out_cicon_2:
		movem.l    (a7)+,d3/a2-a5
		rts

out_icon:
		movem.l    d3-d7/a2-a6,-(a7)
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     14(a0),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        out_icon_1
		lea.l      22(a0),a0
		bsr        info_list
		movea.l    4(a7),a0
		move.l     4(a0),(a7)
		lea.l      xa59c8,a3
		lea.l      392(a3),a0
		jsr        save_string
		clr.w      d4
		lea.l      iostring,a2
		bra        out_icon_2
out_icon_15:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		movea.l    0(a0,d0.l),a4
		lea.l      22(a4),a0
		bsr        info_obj
		movea.l    4(a4),a5
		movea.l    4(a4),a6
		clr.w      d5
		move.w     60(a6),d0
		beq.s      out_icon_3
		lea.l      60(a6),a1
		lea.l      22(a4),a0
		move.w     d5,d0
		bsr        out_cicon
		moveq.l    #8,d5
out_icon_3:
		move.w     38(a6),d0
		beq.s      out_icon_4
		lea.l      38(a6),a1
		lea.l      22(a4),a0
		move.w     d5,d0
		bsr        out_cicon
		moveq.l    #4,d5
out_icon_4:
		moveq.l    #15,d6
		add.w      22(a5),d6
		asr.w      #4,d6
		muls.w     24(a5),d6
		subq.w     #1,d6
		move.l     (a5),d0
		lea.l      0(a5,d0.l),a6
		pea.l      22(a4)
		lea.l      414(a3),a1
		movea.l    a2,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a2,a0
		jsr        save_string
		clr.w      d7
		bra.s      out_icon_5
out_icon_7:
		move.w     (a6)+,-(a7)
		lea.l      447(a3),a1
		movea.l    a2,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a2,a0
		jsr        save_string
		moveq.l    #7,d0
		and.w      d7,d0
		subq.w     #7,d0
		bne.s      out_icon_6
		lea.l      95(a3),a0
		jsr        save_string
out_icon_6:
		addq.w     #1,d7
out_icon_5:
		cmp.w      d7,d6
		bgt.s      out_icon_7
		pea.l      22(a4)
		move.w     (a6)+,-(a7)
		lea.l      455(a3),a1
		movea.l    a2,a0
		jsr        sprintf
		addq.w     #6,a7
		movea.l    a2,a0
		jsr        save_string
		clr.w      d7
		bra.s      out_icon_8
out_icon_10:
		move.w     (a6)+,-(a7)
		lea.l      447(a3),a1
		movea.l    a2,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a2,a0
		jsr        save_string
		moveq.l    #7,d0
		and.w      d7,d0
		subq.w     #7,d0
		bne.s      out_icon_9
		lea.l      95(a3),a0
		jsr        save_string
out_icon_9:
		addq.w     #1,d7
out_icon_8:
		cmp.w      d7,d6
		bgt.s      out_icon_10
		move.w     (a6)+,-(a7)
		lea.l      497(a3),a1
		movea.l    a2,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a2,a0
		jsr        save_string
		move.w     56(a4),d0
		and.w      #$0500,d0
		cmp.w      #$0100,d0
		bne.s      out_icon_11
		lea.l      507(a3),a0
		jsr        save_string
		bra.s      out_icon_12
out_icon_11:
		lea.l      515(a3),a0
		jsr        save_string
out_icon_12:
		move.w     32(a5),-(a7)
		move.w     30(a5),-(a7)
		move.w     28(a5),-(a7)
		move.w     26(a5),-(a7)
		move.w     24(a5),-(a7)
		move.w     22(a5),-(a7)
		move.w     20(a5),-(a7)
		move.w     18(a5),-(a7)
		move.w     16(a5),-(a7)
		move.w     14(a5),-(a7)
		move.w     12(a5),-(a7)
		movea.l    8(a5),a0
		pea.l      22(a0)
		pea.l      22(a4)
		pea.l      22(a4)
		pea.l      22(a4)
		lea.l      523(a3),a1
		movea.l    a2,a0
		jsr        sprintf
		lea.l      38(a7),a7
		movea.l    a2,a0
		jsr        save_string
		tst.w      d5
		beq.s      out_icon_13
		pea.l      22(a4)
		move.w     d5,-(a7)
		lea.l      629(a3),a1
		movea.l    a2,a0
		jsr        sprintf
		addq.w     #6,a7
		movea.l    a2,a0
		jsr        save_string
		bra.s      out_icon_14
out_icon_13:
		lea.l      121(a3),a0
		jsr        save_string
out_icon_14:
		lea.l      639(a3),a0
		jsr        save_string
		addq.w     #1,d4
out_icon_2:
		cmp.w      d4,d3
		bgt        out_icon_15
out_icon_1:
		addq.w     #8,a7
		movem.l    (a7)+,d3-d7/a2-a6
		rts

out_mouse:
		movem.l    d3-d5/a2-a6,-(a7)
		movea.l    a0,a2
		move.l     14(a2),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        out_mouse_1
		lea.l      22(a2),a0
		bsr        info_list
		movea.l    4(a2),a2
		lea.l      xa59c8,a3
		lea.l      646(a3),a0
		jsr        save_string
		clr.w      d4
		lea.l      iostring,a5
		bra        out_mouse_2
out_mouse_11:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a4
		lea.l      22(a4),a0
		bsr        info_obj
		movea.l    4(a4),a6
		move.w     56(a4),d0
		and.w      #$0500,d0
		cmp.w      #$0100,d0
		bne.s      out_mouse_3
		lea.l      507(a3),a0
		jsr        save_string
		bra.s      out_mouse_4
out_mouse_3:
		lea.l      515(a3),a0
		jsr        save_string
out_mouse_4:
		move.w     8(a6),-(a7)
		move.w     6(a6),-(a7)
		move.w     4(a6),-(a7)
		move.w     2(a6),-(a7)
		move.w     (a6),-(a7)
		pea.l      22(a4)
		lea.l      673(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		lea.l      14(a7),a7
		movea.l    a5,a0
		jsr        save_string
		lea.l      10(a6),a6
		moveq.l    #15,d5
		bra.s      out_mouse_5
out_mouse_7:
		move.w     (a6)+,-(a7)
		lea.l      447(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a5,a0
		jsr        save_string
		cmp.w      #$0008,d5
		bne.s      out_mouse_6
		lea.l      724(a3),a0
		jsr        save_string
out_mouse_6:
		subq.w     #1,d5
out_mouse_5:
		tst.w      d5
		bgt.s      out_mouse_7
		move.w     (a6)+,-(a7)
		lea.l      731(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a5,a0
		jsr        save_string
		moveq.l    #15,d5
		bra.s      out_mouse_8
out_mouse_10:
		move.w     (a6)+,-(a7)
		lea.l      447(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a5,a0
		jsr        save_string
		cmp.w      #$0008,d5
		bne.s      out_mouse_9
		lea.l      724(a3),a0
		jsr        save_string
out_mouse_9:
		subq.w     #1,d5
out_mouse_8:
		tst.w      d5
		bgt.s      out_mouse_10
		move.w     (a6)+,-(a7)
		lea.l      756(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a5,a0
		jsr        save_string
		addq.w     #1,d4
out_mouse_2:
		cmp.w      d4,d3
		bgt        out_mouse_11
out_mouse_1:
		movem.l    (a7)+,d3-d5/a2-a6
		rts

out_image:
		movem.l    d3-d6/a2-a6,-(a7)
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     14(a0),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        out_image_1
		lea.l      22(a0),a0
		bsr        info_list
		movea.l    4(a7),a0
		move.l     4(a0),(a7)
		lea.l      xa59c8,a3
		lea.l      780(a3),a0
		jsr        save_string
		clr.w      d4
		lea.l      iostring,a2
		bra        out_image_2
out_image_8:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		movea.l    0(a0,d0.l),a4
		lea.l      22(a4),a0
		bsr        info_obj
		movea.l    4(a4),a5
		move.w     4(a5),d5
		asr.w      #1,d5
		muls.w     6(a5),d5
		subq.w     #1,d5
		move.l     (a5),d0
		lea.l      0(a5,d0.l),a6
		pea.l      22(a4)
		lea.l      803(a3),a1
		movea.l    a2,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a2,a0
		jsr        save_string
		clr.w      d6
		bra.s      out_image_3
out_image_5:
		move.w     (a6)+,-(a7)
		lea.l      447(a3),a1
		movea.l    a2,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a2,a0
		jsr        save_string
		moveq.l    #7,d0
		and.w      d6,d0
		subq.w     #7,d0
		bne.s      out_image_4
		lea.l      95(a3),a0
		jsr        save_string
out_image_4:
		addq.w     #1,d6
out_image_3:
		cmp.w      d6,d5
		bgt.s      out_image_5
		move.w     (a6)+,-(a7)
		lea.l      838(a3),a1
		movea.l    a2,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a2,a0
		jsr        save_string
		move.w     56(a4),d0
		and.w      #$0500,d0
		cmp.w      #$0100,d0
		bne.s      out_image_6
		lea.l      507(a3),a0
		jsr        save_string
		bra.s      out_image_7
out_image_6:
		lea.l      515(a3),a0
		jsr        save_string
out_image_7:
		move.w     12(a5),-(a7)
		move.w     10(a5),-(a7)
		move.w     8(a5),-(a7)
		move.w     6(a5),-(a7)
		move.w     4(a5),-(a7)
		pea.l      22(a4)
		pea.l      22(a4)
		lea.l      851(a3),a1
		movea.l    a2,a0
		jsr        sprintf
		lea.l      18(a7),a7
		movea.l    a2,a0
		jsr        save_string
		addq.w     #1,d4
out_image_2:
		cmp.w      d4,d3
		bgt        out_image_8
out_image_1:
		addq.w     #8,a7
		movem.l    (a7)+,d3-d6/a2-a6
		rts

out_obj:
		movem.l    d3-d7/a2-a6,-(a7)
		lea.l      -64(a7),a7
		move.l     a0,60(a7)
		move.l     a1,56(a7)
		lea.l      mapX+2,a2
		move.l     14(a0),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        out_obj_1
		lea.l      22(a0),a0
		bsr        info_list
		movea.l    56(a7),a0
		jsr        save_string
		move.w     #$FFFF,mapX
		movea.l    60(a7),a0
		move.l     4(a0),52(a7)
		clr.w      d4
		lea.l      xa59c8,a6
		lea.l      iostring,a3
		lea.l      24(a7),a4
		bra        out_obj_2
out_obj_22:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    52(a7),a0
		move.l     0(a0,d0.l),48(a7)
		movea.l    48(a7),a0
		lea.l      22(a0),a0
		bsr        info_obj
		movea.l    48(a7),a0
		move.l     14(a0),d0
		moveq.l    #56,d1
		jsr        _uldiv
		move.l     d0,d5
		movea.l    48(a7),a0
		movea.l    4(a0),a5
		clr.w      d6
		move.w     d6,(a2)
		clr.w      d7
		bra.w      out_obj_3
out_obj_7:
		movea.l    48(a7),a0
		move.w     56(a0),d0
		and.w      #$0500,d0
		cmp.w      #$0100,d0
		beq.s      out_obj_4
		move.l     (a5),d1
		beq.s      out_obj_4
		move.w     d6,-(a7)
		movea.l    d1,a1
		pea.l      22(a1)
		lea.l      907(a6),a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #6,a7
		movea.l    a3,a0
		jsr        save_string
out_obj_4:
		move.l     32(a5),d0
		bne.s      out_obj_5
		move.l     36(a5),d1
		bne.s      out_obj_5
		move.l     44(a5),d2
		bne.s      out_obj_5
		move.l     48(a5),d0
		bne.s      out_obj_5
		move.l     4(a5),d1
		bne.s      out_obj_5
		move.w     42(a5),d2
		bne.s      out_obj_5
		move.w     52(a5),d0
		bne.s      out_obj_5
		addq.w     #1,d6
		bra.s      out_obj_6
out_obj_5:
		addq.w     #2,d6
out_obj_6:
		lea.l      56(a5),a5
		addq.w     #1,d7
		move.w     d7,d0
		ext.l      d0
		add.l      d0,d0
		move.w     d6,0(a2,d0.l)
out_obj_3:
		cmp.w      d7,d5
		bgt.w      out_obj_7
		movea.l    48(a7),a0
		movea.l    4(a0),a5
		clr.w      d7
		bra        out_obj_8
out_obj_21:
		moveq.l    #24,d0
		lea.l      8(a5),a1
		movea.l    a4,a0
		jsr        memcpy
		moveq.l    #24,d0
		lea.l      32(a5),a1
		lea.l      (a7),a0
		jsr        memcpy
		move.w     (a4),d0
		ext.l      d0
		add.l      d0,d0
		move.w     0(a2,d0.l),(a4)
		move.w     2(a4),d0
		ext.l      d0
		add.l      d0,d0
		move.w     0(a2,d0.l),2(a4)
		move.w     4(a4),d0
		ext.l      d0
		add.l      d0,d0
		move.w     0(a2,d0.l),4(a4)
		moveq.l    #-1,d0
		add.w      d5,d0
		cmp.w      d0,d7
		bne.s      out_obj_9
		move.w     d7,d1
		ext.l      d1
		add.l      d1,d1
		move.w     2(a2,d1.l),d2
		moveq.l    #2,d6
		add.w      0(a2,d1.l),d6
		cmp.w      d6,d2
		bne.s      out_obj_10
		ori.w      #$0020,8(a7)
		bra.s      out_obj_9
out_obj_10:
		ori.w      #$0020,8(a4)
out_obj_9:
		tst.w      d7
		bne.s      out_obj_11
		movea.l    48(a7),a0
		move.w     56(a0),d0
		and.w      #$0500,d0
		cmp.w      #$0100,d0
		bne.s      out_obj_12
		lea.l      507(a6),a0
		jsr        save_string
		bra.s      out_obj_13
out_obj_12:
		lea.l      515(a6),a0
		jsr        save_string
out_obj_13:
		movea.l    48(a7),a0
		pea.l      22(a0)
		lea.l      929(a6),a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_obj_14
out_obj_11:
		movea.l    48(a7),a0
		pea.l      22(a0)
		move.w     d7,d0
		ext.l      d0
		add.l      d0,d0
		move.w     0(a2,d0.l),-(a7)
		lea.l      947(a6),a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #6,a7
out_obj_14:
		movea.l    a3,a0
		jsr        save_string
		move.w     10(a4),-(a7)
		move.w     8(a4),-(a7)
		move.w     6(a4),-(a7)
		move.w     4(a4),-(a7)
		move.w     2(a4),-(a7)
		move.w     (a4),-(a7)
		lea.l      974(a6),a1
		movea.l    a3,a0
		jsr        sprintf
		lea.l      12(a7),a7
		movea.l    a3,a0
		jsr        save_string
		cmpi.b     #$14,7(a4)
		beq.s      out_obj_15
		cmpi.b     #$19,7(a4)
		beq.s      out_obj_15
		cmpi.b     #$1B,7(a4)
		bne.s      out_obj_16
out_obj_15:
		move.l     12(a4),-(a7)
		lea.l      1012(a6),a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_obj_17
out_obj_16:
		cmpi.b     #$20,7(a4)
		beq.s      out_obj_18
		cmpi.b     #$1C,7(a4)
		beq.s      out_obj_18
		cmpi.b     #$1A,7(a4)
		bne.s      out_obj_19
out_obj_18:
		movea.l    12(a4),a0
		pea.l      22(a0)
		lea.l      1026(a6),a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_obj_17
out_obj_19:
		movea.l    12(a4),a0
		pea.l      22(a0)
		lea.l      1039(a6),a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #4,a7
out_obj_17:
		movea.l    a3,a0
		jsr        save_string
		move.w     22(a4),-(a7)
		move.w     20(a4),-(a7)
		move.w     18(a4),-(a7)
		move.w     16(a4),-(a7)
		lea.l      1053(a6),a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #8,a7
		movea.l    a3,a0
		jsr        save_string
		move.w     d7,d0
		ext.l      d0
		add.l      d0,d0
		move.w     2(a2,d0.l),d1
		moveq.l    #2,d2
		add.w      0(a2,d0.l),d2
		cmp.w      d2,d1
		bne        out_obj_20
		movea.l    48(a7),a0
		pea.l      22(a0)
		move.w     0(a2,d0.l),-(a7)
		lea.l      1080(a6),a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #6,a7
		movea.l    a3,a0
		jsr        save_string
		lea.l      1111(a6),a1
		movea.l    (a7),a0
		bsr        out_label
		lea.l      118(a6),a0
		jsr        save_string
		lea.l      1111(a6),a1
		movea.l    4(a7),a0
		bsr        out_label
		move.w     10(a7),-(a7)
		move.w     10(a7),-(a7)
		lea.l      997(a6),a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a3,a0
		jsr        save_string
		lea.l      1119(a6),a1
		movea.l    12(a7),a0
		bsr        out_label
		lea.l      118(a6),a0
		jsr        save_string
		lea.l      1119(a6),a1
		movea.l    16(a7),a0
		bsr        out_label
		move.w     20(a7),-(a7)
		lea.l      1003(a6),a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a3,a0
		jsr        save_string
		lea.l      1128(a6),a1
		movea.l    4(a5),a0
		bsr        out_label
		lea.l      197(a6),a0
		jsr        save_string
out_obj_20:
		lea.l      56(a5),a5
		addq.w     #1,d7
out_obj_8:
		cmp.w      d7,d5
		bgt        out_obj_21
		lea.l      50(a6),a0
		jsr        save_string
		addq.w     #1,d4
out_obj_2:
		cmp.w      d4,d3
		bgt        out_obj_22
out_obj_1:
		lea.l      64(a7),a7
		movem.l    (a7)+,d3-d7/a2-a6
		rts

out_data:
		movem.l    d3-d6/a2-a5,-(a7)
		movea.l    a0,a2
		move.l     14(a2),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        out_data_1
		lea.l      22(a2),a0
		bsr        info_list
		movea.l    4(a2),a2
		lea.l      xa59c8,a3
		lea.l      1135(a3),a0
		jsr        save_string
		clr.w      d4
		lea.l      iostring,a4
		bra        out_data_2
out_data_9:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a5
		lea.l      22(a5),a0
		bsr        info_obj
		moveq.l    #-1,d5
		add.l      14(a5),d5
		asr.l      #1,d5
		tst.l      d5
		ble        out_data_3
		move.w     56(a5),d0
		and.w      #$0500,d0
		cmp.w      #$0100,d0
		bne.s      out_data_4
		lea.l      507(a3),a0
		jsr        save_string
		bra.s      out_data_5
out_data_4:
		lea.l      515(a3),a0
		jsr        save_string
out_data_5:
		pea.l      22(a5)
		lea.l      1157(a3),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a4,a0
		jsr        save_string
		movea.l    4(a5),a5
		moveq.l    #0,d6
		bra.s      out_data_6
out_data_8:
		move.w     (a5)+,-(a7)
		lea.l      447(a3),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a4,a0
		jsr        save_string
		moveq.l    #7,d0
		and.l      d6,d0
		moveq.l    #7,d1
		cmp.l      d0,d1
		bne.s      out_data_7
		lea.l      1177(a3),a0
		jsr        save_string
out_data_7:
		addq.l     #1,d6
out_data_6:
		cmp.l      d6,d5
		bgt.s      out_data_8
		move.w     (a5)+,-(a7)
		lea.l      1183(a3),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a4,a0
		jsr        save_string
out_data_3:
		addq.w     #1,d4
out_data_2:
		cmp.w      d4,d3
		bgt        out_data_9
out_data_1:
		movem.l    (a7)+,d3-d6/a2-a5
		rts

out_string:
		movem.l    d3-d4/a2-a6,-(a7)
		subq.w     #4,a7
		movea.l    a0,a2
		movea.l    a1,a3
		move.l     14(a2),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        out_string_1
		lea.l      22(a2),a0
		bsr        info_list
		movea.l    4(a2),a2
		movea.l    a3,a0
		jsr        save_string
		clr.b      1(a7)
		clr.w      d4
		lea.l      xa59c8,a4
		lea.l      iostring,a5
		bra        out_string_2
out_string_20:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a6
		lea.l      1198(a4),a1
		lea.l      22(a6),a0
		moveq.l    #4,d0
		jsr        strncmp
		tst.w      d0
		beq        out_string_3
		lea.l      22(a6),a0
		bsr        info_obj
		move.w     56(a6),d0
		and.w      #$0500,d0
		cmp.w      #$0100,d0
		bne.s      out_string_4
		lea.l      507(a4),a0
		jsr        save_string
		bra.s      out_string_5
out_string_4:
		lea.l      515(a4),a0
		jsr        save_string
out_string_5:
		pea.l      22(a6)
		lea.l      1203(a4),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a5,a0
		jsr        save_string
		movea.l    4(a6),a6
		bra        out_string_6
out_string_19:
		move.b     (a6),d0
		ext.w      d0
		cmp.w      #$000B,d0
		beq.s      out_string_7
		bgt.s      out_string_8
		subq.w     #7,d0
		beq.w      out_string_9
		subq.w     #1,d0
		beq.s      out_string_10
		subq.w     #1,d0
		beq.s      out_string_11
		subq.w     #1,d0
		beq.s      out_string_12
		bra        out_string_13
out_string_8:
		sub.w      #$000C,d0
		beq.s      out_string_14
		subq.w     #1,d0
		beq.s      out_string_15
		sub.w      #$0015,d0
		beq.s      out_string_16
		sub.w      #$003A,d0
		beq.w      out_string_17
		bra        out_string_13
out_string_12:
		lea.l      1221(a4),a1
		lea.l      (a7),a0
		jsr        strcpy
		bra        out_string_18
out_string_15:
		lea.l      1224(a4),a1
		lea.l      (a7),a0
		jsr        strcpy
		bra.w      out_string_18
out_string_11:
		lea.l      1227(a4),a1
		lea.l      (a7),a0
		jsr        strcpy
		bra.s      out_string_18
out_string_7:
		lea.l      1230(a4),a1
		lea.l      (a7),a0
		jsr        strcpy
		bra.s      out_string_18
out_string_10:
		lea.l      1233(a4),a1
		lea.l      (a7),a0
		jsr        strcpy
		bra.s      out_string_18
out_string_9:
		lea.l      1236(a4),a1
		lea.l      (a7),a0
		jsr        strcpy
		bra.s      out_string_18
out_string_14:
		lea.l      1239(a4),a1
		lea.l      (a7),a0
		jsr        strcpy
		bra.s      out_string_18
out_string_16:
		lea.l      1242(a4),a1
		lea.l      (a7),a0
		jsr        strcpy
		bra.s      out_string_18
out_string_17:
		lea.l      1245(a4),a1
		lea.l      (a7),a0
		jsr        strcpy
		bra.s      out_string_18
out_string_13:
		move.b     (a6),d0
		ext.w      d0
		move.w     d0,-(a7)
		lea.l      1248(a4),a1
		lea.l      2(a7),a0
		jsr        sprintf
		addq.w     #2,a7
out_string_18:
		lea.l      (a7),a0
		jsr        save_string
		addq.w     #1,a6
out_string_6:
		move.b     (a6),d0
		bne        out_string_19
		lea.l      1251(a4),a0
		jsr        save_string
out_string_3:
		addq.w     #1,d4
out_string_2:
		cmp.w      d4,d3
		bgt        out_string_20
out_string_1:
		addq.w     #4,a7
		movem.l    (a7)+,d3-d4/a2-a6
		rts

out_tedi:
		movem.l    d3-d4/a2-a5,-(a7)
		movea.l    a0,a2
		move.l     14(a2),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        out_tedi_1
		lea.l      22(a2),a0
		bsr        info_list
		movea.l    4(a2),a2
		lea.l      xa5eb0,a0
		jsr        save_string
		clr.w      d4
		lea.l      iostring,a5
		bra.s      out_tedi_2
out_tedi_3:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a3
		lea.l      22(a3),a0
		bsr        info_obj
		movea.l    4(a3),a4
		movea.l    4(a4),a0
		move.l     14(a0),-(a7)
		movea.l    (a4),a1
		move.l     14(a1),-(a7)
		move.w     22(a4),-(a7)
		move.w     20(a4),-(a7)
		move.w     18(a4),-(a7)
		move.w     16(a4),-(a7)
		move.w     14(a4),-(a7)
		move.w     12(a4),-(a7)
		movea.l    8(a4),a0
		pea.l      22(a0)
		movea.l    4(a4),a1
		pea.l      22(a1)
		movea.l    (a4),a0
		pea.l      22(a0)
		pea.l      22(a3)
		lea.l      xa5ec9,a1
		movea.l    a5,a0
		jsr        sprintf
		lea.l      36(a7),a7
		movea.l    a5,a0
		jsr        save_string
		addq.w     #1,d4
out_tedi_2:
		cmp.w      d4,d3
		bgt.s      out_tedi_3
out_tedi_1:
		movem.l    (a7)+,d3-d4/a2-a5
		rts

out_user:
		movem.l    d3-d4/a2-a6,-(a7)
		movea.l    a0,a2
		move.l     14(a2),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        out_user_1
		lea.l      22(a2),a0
		bsr        info_list
		movea.l    4(a2),a2
		lea.l      xa59c8,a3
		lea.l      1355(a3),a0
		jsr        save_string
		clr.w      d4
		lea.l      iostring,a6
		bra        out_user_2
out_user_3:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a4
		lea.l      22(a4),a0
		bsr        info_obj
		movea.l    4(a4),a5
		movea.l    (a5),a0
		pea.l      22(a0)
		pea.l      22(a4)
		lea.l      1380(a3),a1
		movea.l    a6,a0
		jsr        sprintf
		addq.w     #8,a7
		movea.l    a6,a0
		jsr        save_string
		lea.l      1410(a3),a1
		movea.l    4(a5),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    8(a5),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    12(a5),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    16(a5),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    20(a5),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    24(a5),a0
		bsr        out_label
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    28(a5),a0
		bsr        out_label
		lea.l      197(a3),a0
		jsr        save_string
		addq.w     #1,d4
out_user_2:
		cmp.w      d4,d3
		bgt        out_user_3
out_user_1:
		movem.l    (a7)+,d3-d4/a2-a6
		rts

out_window:
		movem.l    d3-d4/a2-a6,-(a7)
		movea.l    a0,a2
		move.l     14(a2),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        out_window_1
		lea.l      22(a2),a0
		bsr        info_list
		movea.l    4(a2),a2
		lea.l      xa59c8,a3
		lea.l      1413(a3),a0
		jsr        save_string
		clr.w      d4
		lea.l      iostring,a6
		bra        out_window_2
out_window_3:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a4
		lea.l      22(a4),a0
		bsr        info_obj
		movea.l    4(a4),a5
		pea.l      22(a4)
		lea.l      1437(a3),a1
		movea.l    a6,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a6,a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    (a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1461(a3),a1
		movea.l    4(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1473(a3),a1
		movea.l    8(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1488(a3),a1
		movea.l    12(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1497(a3),a1
		movea.l    16(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    20(a5),a0
		bsr        out_label2
		lea.l      118(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    24(a5),a0
		bsr        out_label2
		lea.l      1506(a3),a0
		jsr        save_string
		move.w     42(a5),-(a7)
		move.w     40(a5),-(a7)
		move.w     38(a5),-(a7)
		move.w     36(a5),-(a7)
		move.w     34(a5),-(a7)
		lea.l      1522(a3),a1
		movea.l    a6,a0
		jsr        sprintf
		lea.l      10(a7),a7
		movea.l    a6,a0
		jsr        save_string
		lea.l      1554(a3),a0
		jsr        save_string
		move.w     72(a5),-(a7)
		lea.l      1610(a3),a1
		movea.l    a6,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a6,a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    74(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    78(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		move.w     84(a5),-(a7)
		move.w     82(a5),-(a7)
		lea.l      1620(a3),a1
		movea.l    a6,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a6,a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    90(a5),a0
		bsr        out_label2
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    94(a5),a0
		bsr        out_label2
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1642(a3),a1
		movea.l    98(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1651(a3),a1
		movea.l    102(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1664(a3),a1
		movea.l    106(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1675(a3),a1
		movea.l    110(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1686(a3),a1
		movea.l    114(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1697(a3),a1
		movea.l    118(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1708(a3),a1
		movea.l    122(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1720(a3),a1
		movea.l    126(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1730(a3),a1
		movea.l    130(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1740(a3),a1
		movea.l    134(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1750(a3),a1
		movea.l    138(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1760(a3),a1
		movea.l    142(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1772(a3),a1
		movea.l    146(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      1786(a3),a1
		movea.l    150(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    154(a5),a0
		bsr        out_label
		lea.l      94(a3),a0
		jsr        save_string
		lea.l      121(a3),a1
		movea.l    158(a5),a0
		bsr        out_label
		lea.l      1800(a3),a0
		jsr        save_string
		addq.w     #1,d4
out_window_2:
		cmp.w      d4,d3
		bgt        out_window_3
out_window_1:
		movem.l    (a7)+,d3-d4/a2-a6
		rts

out_refs:
		movem.l    d3-d5/a2-a5,-(a7)
		movea.l    60(a0),a0
		move.l     14(a0),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        out_refs_1
		movea.l    4(a0),a2
		lea.l      xa59c8,a3
		lea.l      1812(a3),a0
		jsr        save_string
		clr.w      d4
		lea.l      iostring,a5
		bra.s      out_refs_2
out_refs_5:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a4
		lea.l      22(a4),a0
		bsr        info_obj
		move.w     56(a4),d5
		move.l     14(a4),d0
		ble.s      out_refs_3
		movea.l    4(a4),a0
		jsr        save_string
		bra.s      out_refs_4
out_refs_3:
		move.w     d5,d0
		and.w      #$00FF,d0
		beq.s      out_refs_4
		move.w     d5,d1
		and.w      #$0200,d1
		bne.s      out_refs_4
		pea.l      22(a4)
		lea.l      1844(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a5,a0
		jsr        save_string
out_refs_4:
		lea.l      50(a3),a0
		jsr        save_string
		addq.w     #1,d4
out_refs_2:
		cmp.w      d4,d3
		bgt.s      out_refs_5
out_refs_1:
		movem.l    (a7)+,d3-d5/a2-a5
		rts

out_declproto:
		movem.l    d3-d5/a2-a5,-(a7)
		movea.l    a0,a3
		movea.l    60(a3),a2
		move.l     14(a2),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        out_declproto_1
		movea.l    60(a3),a0
		lea.l      22(a0),a0
		bsr        info_list
		movea.l    4(a2),a2
		lea.l      xa59c8,a3
		lea.l      1881(a3),a0
		jsr        save_string
		clr.w      d4
		lea.l      iostring,a5
		bra        out_declproto_2
out_declproto_27:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a4
		move.w     56(a4),d5
		move.w     d5,d1
		and.w      #$0700,d1
		beq.s      out_declproto_3
		cmp.w      #$0500,d1
		bne        out_declproto_4
out_declproto_3:
		lea.l      22(a4),a0
		bsr        info_obj
		move.w     d5,d0
		and.w      #$00FF,d0
		cmp.w      #$0025,d0
		bhi        out_declproto_5
		add.w      d0,d0
		move.w     J5(pc,d0.w),d0
		jmp        J5(pc,d0.w)
J5:
		dc.w out_declproto_6-J5
		dc.w out_declproto_7-J5
		dc.w out_declproto_7-J5
		dc.w out_declproto_8-J5
		dc.w out_declproto_9-J5
		dc.w out_declproto_5-J5
		dc.w out_declproto_10-J5
		dc.w out_declproto_11-J5
		dc.w out_declproto_10-J5
		dc.w out_declproto_12-J5
		dc.w out_declproto_13-J5
		dc.w out_declproto_14-J5
		dc.w out_declproto_15-J5
		dc.w out_declproto_5-J5
		dc.w out_declproto_15-J5
		dc.w out_declproto_16-J5
		dc.w out_declproto_17-J5
		dc.w out_declproto_17-J5
		dc.w out_declproto_14-J5
		dc.w out_declproto_14-J5
		dc.w out_declproto_15-J5
		dc.w out_declproto_18-J5
		dc.w out_declproto_19-J5
		dc.w out_declproto_10-J5
		dc.w out_declproto_20-J5
		dc.w out_declproto_21-J5
		dc.w out_declproto_21-J5
		dc.w out_declproto_7-J5
		dc.w out_declproto_7-J5
		dc.w out_declproto_7-J5
		dc.w out_declproto_22-J5
		dc.w out_declproto_22-J5
		dc.w out_declproto_7-J5
		dc.w out_declproto_23-J5
		dc.w out_declproto_24-J5
		dc.w out_declproto_7-J5
		dc.w out_declproto_23-J5
		dc.w out_declproto_25-J5
out_declproto_7:
		pea.l      22(a4)
		lea.l      1915(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_8:
		pea.l      22(a4)
		lea.l      1941(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_9:
		pea.l      22(a4)
		lea.l      1981(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_10:
		pea.l      22(a4)
		lea.l      2043(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_11:
		pea.l      22(a4)
		lea.l      2079(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_12:
		pea.l      22(a4)
		lea.l      2115(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_13:
		pea.l      22(a4)
		lea.l      2176(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_14:
		pea.l      22(a4)
		lea.l      2236(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_15:
		pea.l      22(a4)
		lea.l      2284(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_16:
		pea.l      22(a4)
		lea.l      2319(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_17:
		pea.l      22(a4)
		lea.l      2379(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_18:
		pea.l      22(a4)
		lea.l      2425(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_6:
		clr.b      (a5)
		bra        out_declproto_26
out_declproto_19:
		pea.l      22(a4)
		lea.l      2487(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_20:
		pea.l      22(a4)
		lea.l      2534(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.w      out_declproto_26
out_declproto_21:
		pea.l      22(a4)
		lea.l      2616(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_declproto_26
out_declproto_22:
		pea.l      22(a4)
		lea.l      2643(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_declproto_26
out_declproto_24:
		pea.l      22(a4)
		lea.l      2680(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_declproto_26
out_declproto_23:
		pea.l      22(a4)
		lea.l      2731(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_declproto_26
out_declproto_25:
		pea.l      22(a4)
		lea.l      2778(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_declproto_26
out_declproto_5:
		move.w     d5,d0
		and.w      #$00FF,d0
		move.w     d0,-(a7)
		pea.l      22(a4)
		lea.l      2844(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #6,a7
out_declproto_26:
		movea.l    a5,a0
		jsr        save_string
out_declproto_4:
		addq.w     #1,d4
out_declproto_2:
		cmp.w      d4,d3
		bgt        out_declproto_27
		lea.l      409(a3),a0
		jsr        save_string
out_declproto_1:
		movem.l    (a7)+,d3-d5/a2-a5
		rts

	.globl pc_output
pc_output:
		movem.l    d3/a2-a5,-(a7)
		lea.l      -136(a7),a7
		movea.l    a0,a2
		moveq.l    #92,d0
		movea.l    8(a2),a0
		jsr        strrchr
		addq.w     #1,a0
		move.l     a0,(a7)
		lea.l      4(a7),a4
		movea.l    8(a2),a1
		movea.l    a4,a0
		jsr        strcpy
		moveq.l    #46,d0
		movea.l    a4,a0
		jsr        strrchr
		movea.l    a0,a3
		lea.l      xa59c8,a5
		lea.l      2866(a5),a1
		movea.l    a3,a0
		jsr        strcpy
		clr.w      d0
		movea.l    a4,a0
		jsr        Fcreate
		move.l     d0,d3
		tst.w      d3
		bpl.s      pc_output_1
		movea.l    (a7),a0
		moveq.l    #9,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		bra        pc_output_2
pc_output_1:
		movea.l    a4,a0
		bsr        info_start
		lea.l      2870(a5),a0
		bsr        info_title
		move.w     d3,d0
		jsr        set_handle
		jsr        setjmp
		tst.w      d0
		beq.s      pc_output_3
		suba.l     a0,a0
		moveq.l    #10,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		bra        pc_output_4
pc_output_3:
		suba.l     a0,a0
		jsr        time
		move.l     d0,132(a7)
		lea.l      iostring,a3
		move.l     8(a2),-(a7)
		lea.l      136(a7),a0
		jsr        ctime
		move.l     a0,-(a7)
		lea.l      pc_welcome,a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #8,a7
		movea.l    a3,a0
		jsr        save_string
		lea.l      2882(a5),a0
		jsr        save_string
		moveq.l    #1,d0
		add.w      500(a2),d0
		move.w     d0,-(a7)
		lea.l      2907(a5),a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a3,a0
		jsr        save_string
		movea.l    a2,a0
		bsr        out_declproto
		lea.l      2928(a5),a1
		movea.l    36(a2),a0
		bsr        out_string
		lea.l      2956(a5),a1
		movea.l    52(a2),a0
		bsr        out_string
		movea.l    68(a2),a0
		bsr        out_data
		movea.l    40(a2),a0
		bsr        out_tedi
		movea.l    56(a2),a0
		bsr        out_user
		movea.l    44(a2),a0
		bsr        out_icon
		movea.l    48(a2),a0
		bsr        out_image
		lea.l      2980(a5),a1
		movea.l    28(a2),a0
		bsr        out_obj
		lea.l      3007(a5),a1
		movea.l    32(a2),a0
		bsr        out_obj
		lea.l      3035(a5),a1
		movea.l    24(a2),a0
		bsr        out_obj
		movea.l    20(a2),a0
		bsr        out_window
		movea.l    64(a2),a0
		bsr        out_mouse
		movea.l    a2,a0
		bsr        out_acs
		move.w     6(a2),d0
		and.w      #$2000,d0
		beq.s      pc_output_5
		movea.l    a2,a0
		bsr        out_refs
pc_output_5:
		jsr        close_buf
pc_output_4:
		bsr        info_end
		move.w     d3,d0
		jsr        Fclose
pc_output_2:
		lea.l      136(a7),a7
		movem.l    (a7)+,d3/a2-a5
		rts

	.data

xacc_types:
		dc.w $0000
		dc.w $0057
		dc.w $5000
		dc.w $4454
		dc.w $0045
		dc.w $4400
		dc.w $4442
		dc.w $0053
		dc.w $5300
		dc.w $5247
		dc.w $0056
		dc.w $4700
		dc.w $4747
		dc.w $004d
		dc.w $5500
		dc.w $4344
		dc.w $0044
		dc.w $4300
		dc.w $4454
		dc.w $0050
		dc.w $4500
xa59c8:
		dc.b 0
xa59c9:
		dc.b '%-12s',0
xa59cf:
		dc.b '&%-12s',0
xa59d6:
		dc.b '&%-12s[3]',0
x000a59e0:                           dc.b $0d,$0a,$0d,$0a,'Adescr ACSdescr =',0
x000a59f6:                           dc.b $0d,$0a,$09,'{',$0d,$0a,0
x000a59fd:                           dc.b $09,$09,'"%s", %d,',$0d,$0a,$09,$09,'%2d, %2d,',$0d,$0a,$09,$09,'%#4x,',$0d,$0a,$09,$09,'"%s",',$0d,$0a,$09,$09,0
x000a5a2c:                           dc.b 'ACS3.00',0
x000a5a34:                           dc.b '&PUR_DESK',0
x000a5a3e:                           dc.w $2c20
x000a5a40:                           dc.w $004e
x000a5a42:                           dc.b 'ULL',0
x000a5a46:                           dc.b ',',$0d,$0a,$09,$09,'{',$0d,$0a,0
x000a5a4f:                           dc.b ',',$0d,$0a,0
x000a5a53:                           dc.b $09,$09,$09,'{%3d, NULL}',0
x000a5a62:                           dc.b $09,$09,$09,'{255, &%s}',0
x000a5a70:                           dc.b $0d,$0a,$09,$09,'},',$0d,$0a,0
x000a5a79:                           dc.b 'ACS(%02d)',0
x000a5a83:                           dc.b $09,$09,'"%s"',0
x000a5a8a:                           dc.w $2c00
x000a5a8c:                           dc.b $09,'};',$0d,$0a,0
x000a5a92:                           dc.b $0d,$0a,$0d,$0a,' Aconfig ACSconfig =',0
x000a5aab:                           dc.b $0d,$0a,$09,'{',$0d,$0a,$09,$09,0
x000a5ab4:                           dc.w $7b22
x000a5ab6:                           dc.w $0022
x000a5ab8:                           dc.b ', "',0
x000a5abc:                           dc.w $253b
x000a5abe:                           dc.w $0022
x000a5ac0:                           dc.w $2c20
x000a5ac2:                           dc.w $0054
x000a5ac4:                           dc.b 'RUE, ',0
x000a5aca:                           dc.b 'FALSE, ',0
x000a5ad2:                           dc.b '%i},',$0d,$0a,$09,$09,0
x000a5adb:                           dc.b '4},',$0d,$0a,$09,$09,0
x000a5ae3:                           dc.b ', ',$0d,$0a,$09,$09,0
x000a5aea:                           dc.b '%i, ',0
x000a5aef:                           dc.b "'%s', ",0
x000a5af6:                           dc.b '0, ',0
x000a5afa:                           dc.b 'ACSinit',0
x000a5b02:                           dc.b $0d,$0a,$09,'};',$0d,$0a,0
x000a5b0a:                           dc.b 'static CICON _C%d_%-s = {',$0d,$0a,$09,$09,'%d,',$0d,$0a,$09,$09,0
x000a5b2f:                           dc.b ',',$0d,$0a,$09,$09,'&_C%d_%-s};',$0d,$0a,0
x000a5b42:                           dc.b ',',$0d,$0a,$09,$09,'NULL};',$0d,$0a,0
x000a5b50:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ICONS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a5b66:                           dc.b 'static INT16 _MSK_%-s [] = {',$0d,$0a,$09,$09,0
x000a5b87:                           dc.b '%#06x, ',0
x000a5b8f:                           dc.b '%#06x};',$0d,$0a,'static INT16 _DAT_%-s [] = {',$0d,$0a,$09,$09,0
x000a5bb9:                           dc.b '%#06x};',$0d,$0a,0
x000a5bc3:                           dc.b '       ',0
x000a5bcb:                           dc.b 'static ',0
x000a5bd3:                           dc.b 'CICONBLK %-s = {{',$0d,$0a,$09,$09,'_MSK_%-s, _DAT_%-s, %-s,',$0d,$0a,$09,$09,'%#6x, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d},',0
x000a5c3d:                           dc.b '&_C%d_%-s',0
x000a5c47:                           dc.b '};',$0d,$0a,$0d,$0a,0
x000a5c4e:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'MOUSEFORMS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a5c69:                           dc.b 'MFORM %-s =',$0d,$0a,$09,$09,'{',$0d,$0a,$09,$09,$09,'%2d, %2d, %2d, %2d, %2d,',$0d,$0a,$09,$09,$09,'{',$0d,$0a,$09,$09,$09,$09,0
x000a5ca3:                           dc.b '%#06x',$0d,$0a,$09,$09,$09,'},',$0d,$0a,$09,$09,$09,'{',$0d,$0a,$09,$09,$09,$09,0
x000a5cbc:                           dc.b '%#06x',$0d,$0a,$09,$09,$09,'}',$0d,$0a,$09,$09,'};',$0d,$0a,$0d,$0a,$0d,$0a,0
x000a5cd4:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'IMAGES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a5ceb:                           dc.b 'static INT16 _IMG_%-s [] =',$0d,$0a,$09,'{',$0d,$0a,$09,$09,0
x000a5d0e:                           dc.b '%#06x',$0d,$0a,$09,'};',$0d,$0a,0
x000a5d1b:                           dc.b 'BITBLK %-s = {_IMG_%-s, %2d, %2d, %2d, %2d, %#04x};',$0d,$0a,$0d,$0a,0
x000a5d53:                           dc.b '#define %-14s (%3d)',$0d,$0a,0
x000a5d69:                           dc.b 'OBJECT  %-12s    ',0
x000a5d7b:                           dc.b 'static OBJECT  _%02d_%-12s',0
x000a5d96:                           dc.b ' = { %2d, %2d, %2d, %2d, %#6x, %#6x, ',0
x000a5dbc:                           dc.b ' %#010lxL',$09,$09,$09,$09,0
x000a5dca:                           dc.b '(long) %-12s',0
x000a5dd7:                           dc.b '(long) &%-12s',0
x000a5de5:                           dc.b ' , %2d, %2d, %2d, %2d };',$0d,$0a,0
x000a5e00:                           dc.b 'static AOBJECT _%02da%-12s = {',0
x000a5e1f:                           dc.b 'NULL',$09,$09,' ',0
x000a5e27:                           dc.b 'NULL',$09,$09,$09,$09,0
x000a5e30:                           dc.b '0',$09,$09,$09,$09,$09,0
x000a5e37:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'DATAS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a5e4d:                           dc.b 'INT16 %-12s [] =',$0d,$0a,$09,'{',$0d,$0a,$09,$09,$09,0
x000a5e67:                           dc.b '%#06x',$0d,$0a,$09,'};',$0d,$0a,$0d,$0a,0
x000a5e76:                           dc.b 'ACS(',0
x000a5e7b:                           dc.b 'char %-12s [] = "',0
x000a5e8d:                           dc.b $5c
x000a5e8e:                           dc.w $6e00
x000a5e90:                           dc.w $5c72
x000a5e92:                           dc.w $005c
x000a5e94:                           dc.w $7400
x000a5e96:                           dc.w $5c76
x000a5e98:                           dc.w $005c
x000a5e9a:                           dc.w $6200
x000a5e9c:                           dc.w $5c61
x000a5e9e:                           dc.w $005c
x000a5ea0:                           dc.w $6600
x000a5ea2:                           dc.w $5c22
x000a5ea4:                           dc.w $005c
x000a5ea6:                           dc.w $5c00
x000a5ea8:                           dc.w $2563
x000a5eaa:                           dc.w $0022
x000a5eac:                           dc.b ';',$0d,$0a,0
xa5eb0:
		dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'TEDINFOS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
xa5ec9:
		dc.b 'static TEDINFO %-12s = {%s, %s, %s, %d, %d, %d, %#x, %d, %d, %ld, %ld};',$0d,$0a,0
x000a5f13:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'AUSERBLK',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a5f2c:                           dc.b 'static AUSERBLK %-12s = {%s, ',0
x000a5f4a:                           dc.w $304c
x000a5f4c:                           dc.w $000d
x000a5f4e:                           dc.b $0a,$0d,$0a,'/*',$09,$09,'WINDOWS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a5f65:                           dc.b 'Awindow %-12s =',$0d,$0a,$09,'{',$0d,$0a,$09,$09,0
x000a5f7d:                           dc.b 'Awi_service',0
x000a5f89:                           dc.b 'Awi_selfcreate',0
x000a5f98:                           dc.b 'Awi_open',0
x000a5fa1:                           dc.b 'Awi_init',0
x000a5faa:                           dc.b ', 0, 0, -1,',$0d,$0a,$09,$09,0
x000a5fba:                           dc.b '%#6x, {%2i, %2i, %2i, %2i},',$0d,$0a,$09,$09,0
x000a5fda:                           dc.b '{0, 0, 0, 0}, {0, 0, 0, 0}, {-1, -1, -1, -1}, 0, 0,',$0d,$0a,$09,$09,0
x000a6012:                           dc.b '%#6x,',$0d,$0a,$09,$09,0
x000a601c:                           dc.b '%4d, %#6x, 0, -1,',$0d,$0a,$09,$09,0
x000a6032:                           dc.b 'Awi_keys',0
x000a603b:                           dc.b 'Awi_obchange',0
x000a6048:                           dc.b 'Awi_redraw',0
x000a6053:                           dc.b 'Awi_topped',0
x000a605e:                           dc.b 'Awi_closed',0
x000a6069:                           dc.b 'Awi_fulled',0
x000a6074:                           dc.b 'Awi_arrowed',0
x000a6080:                           dc.b 'Awi_hslid',0
x000a608a:                           dc.b 'Awi_vslid',0
x000a6094:                           dc.b 'Awi_sized',0
x000a609e:                           dc.b 'Awi_moved',0
x000a60a8:                           dc.b 'Awi_iconify',0
x000a60b4:                           dc.b 'Awi_uniconify',0
x000a60c2:                           dc.b 'Awi_gemscript',0
x000a60d0:                           dc.b $0d,$0a,$09,'};',$0d,$0a,$0d,$0a,$0d,$0a,0
x000a60dc:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ANSI-C Routines',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a60fc:                           dc.b "/* '%s' Not yet defined by user */",$0d,$0a,0
x000a6121:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ANSI-C Prototypes',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a6143:                           dc.b 'static void %s( void );',$0d,$0a,0
x000a615d:                           dc.b 'static INT16 CDECL %s( PARMBLK* pb );',$0d,$0a,0
x000a6185:                           dc.b 'static INT16 %s( OBJECT *entry, INT16 task, void *in_out );',$0d,$0a,0
x000a61c3:                           dc.b 'static INT16 %s( Awindow* wind );',$0d,$0a,0
x000a61e7:                           dc.b 'static Awindow *%s( void *para );',$0d,$0a,0
x000a620b:                           dc.b 'static INT16 %s( Awindow *wind, INT16 kstate, INT16 key );',$0d,$0a,0
x000a6248:                           dc.b 'static void %s( Awindow *wind, INT16 obnr, INT16 state );',$0d,$0a,0
x000a6284:                           dc.b 'static void %s( Awindow *wind, Axywh *area );',$0d,$0a,0
x000a62b4:                           dc.b 'static void %s( Awindow *wind );',$0d,$0a,0
x000a62d7:                           dc.b 'static void %s( Awindow *wind, INT16 pos, INT16 amount );',$0d,$0a,0
x000a6313:                           dc.b 'static void %s( Awindow *wind, INT16 pos );',$0d,$0a,0
x000a6341:                           dc.b 'static INT16 %s( Awindow *wind, INT16 task, void *in_out );',$0d,$0a,0
x000a637f:                           dc.b 'static INT16 %s( Awindow *wind, INT16 all );',$0d,$0a,0
x000a63ae:                           dc.b 'static INT16 %s( Awindow *wind, INT16 anz, char **cmds, A_GSAntwort *antwort );',$0d,$0a,0
x000a6400:                           dc.b 'static INT16 %s( void );',$0d,$0a,0
x000a641b:                           dc.b 'static INT16 %s( INT16 *message );',$0d,$0a,0
x000a6440:                           dc.b 'static void %s( INT16 *button, INT16 *kreturn );',$0d,$0a,0
x000a6473:                           dc.b 'static void %s( INT16 *kstate, INT16 *key );',$0d,$0a,0
x000a64a2:                           dc.b 'static INT16 %s( INT16 anz, char **cmd, A_GSAntwort *antwort );',$0d,$0a,0
x000a64e4:                           dc.b '/* %s Type %d ?? */',$0d,$0a,0
x000a64fa:                           dc.b '.AH',0
x000a64fe:                           dc.b 'ANSI C Code',0
x000a650a:                           dc.b $0d,$0a,'/*',$09,$09,'GUI-LANGUAGE',$09,$09,'*/',$0d,$0a,0
x000a6523:                           dc.b '#define ACS_LANG%d',$0d,$0a,0
x000a6538:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ALERT BOXES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a6554:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'STRINGS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a656c:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'MENU TREES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a6587:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'POPUP TREES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a65a3:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'OBJECT TREES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
	.even

	.bss

info_xywh: ds.w 4
info_bp: ds.l 1
work: ds.l 1
mapX: ds.w 1000
