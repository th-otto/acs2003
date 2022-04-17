		.text

	.globl init_boxed
init_boxed:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		lea.l      data,a1
		move.w     #$2329,d0 /* AS_ACSADDPART */
		movea.l    4(a2),a3
		jsr        (a3)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

minsize:
		movem.l    d3/a2-a3,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		move.l     12(a2),d0
		beq.s      minsize_1
		movea.l    d0,a0
		jsr        strlen
		move.l     d0,d3
		movea.l    ACSblk,a0
		muls.w     18(a0),d3
		bra.s      minsize_2
minsize_1:
		movea.l    ACSblk,a0
		move.w     18(a0),d3
minsize_2:
		move.w     d3,(a3)
		movea.l    ACSblk,a0
		movea.l    16(a7),a1
		move.w     20(a0),(a1)
		movem.l    (a7)+,d3/a2-a3
		rts

object_tree:
		movem.l    a2-a6,-(a7)
		lea.l      -14(a7),a7
		movea.l    a0,a5
		movea.l    a1,a3
		lea.l      ED_BOXED,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        object_tree_1
		lea.l      48(a2),a4
		moveq.l    #22,d1
		and.w      8(a3),d1
		or.w       d1,8(a4)
		moveq.l    #63,d1
		and.w      10(a3),d1
		or.w       d1,10(a4)
		movea.l    12(a4),a3
		pea.l      (a7)
		lea.l      xbce7e,a1
		movea.l    (a5),a0
		jsr        sscanf
		addq.w     #4,a7
		move.l     (a7),4(a3)
		lea.l      4(a3),a6
		moveq.l    #22,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #8,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #2,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #53,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #54,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		movea.l    204(a2),a4
		addq.w     #4,a4
		move.w     (a6),d0
		lsr.w      #3,d0
		and.w      #$001F,d0
		andi.w     #$FF07,(a4)
		and.w      #$001F,d0
		lsl.w      #3,d0
		or.w       d0,(a4)
		cmpi.w     #$0002,8(a5)
		bne.s      object_tree_2
		movea.l    10(a5),a1
		moveq.l    #2,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		movea.l    10(a5),a1
		moveq.l    #8,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_3
object_tree_2:
		lea.l      xbce5a,a1
		moveq.l    #2,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		lea.l      xbce5a,a1
		moveq.l    #8,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_3:
		movea.l    1284(a2),a0
		move.l     12(a0),24(a3)
		movea.l    38(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_4
		lea.l      xbce5a,a1
		moveq.l    #53,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_5
object_tree_4:
		movea.l    38(a5),a1
		moveq.l    #53,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_5:
		movea.l    1308(a2),a0
		move.l     12(a0),28(a3)
		movea.l    42(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_6
		lea.l      xbce5a,a1
		moveq.l    #54,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_7
object_tree_6:
		movea.l    42(a5),a1
		moveq.l    #54,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_7:
		move.w     2(a6),d0
		lsr.w      #4,d0
		and.w      #$000F,d0
		moveq.l    #0,d1
		move.w     d0,d1
		lsl.l      #2,d1
		lea.l      colour_text,a0
		movea.l    0(a0,d1.l),a1
		movea.l    a2,a0
		moveq.l    #15,d0
		jsr        Aob_puttext
		move.w     2(a6),d0
		lsr.w      #4,d0
		and.w      #$000F,d0
		andi.w     #$FFF0,350(a2)
		and.w      #$000F,d0
		or.w       d0,350(a2)
		move.w     (a6),d0
		lsr.w      #8,d0
		and.w      #$000F,d0
		moveq.l    #0,d1
		move.w     d0,d1
		lsl.l      #2,d1
		lea.l      colour_text,a0
		movea.l    0(a0,d1.l),a1
		movea.l    a2,a0
		moveq.l    #47,d0
		jsr        Aob_puttext
		move.w     (a6),d0
		lsr.w      #8,d0
		and.w      #$000F,d0
		andi.w     #$FFF0,1118(a2)
		and.w      #$000F,d0
		or.w       d0,1118(a2)
		move.w     (a6),d0
		moveq.l    #12,d1
		lsr.w      d1,d0
		and.w      #$000F,d0
		moveq.l    #0,d2
		move.w     d0,d2
		lsl.l      #2,d2
		lea.l      colour_text,a0
		movea.l    0(a0,d2.l),a1
		movea.l    a2,a0
		moveq.l    #40,d0
		jsr        Aob_puttext
		move.w     (a6),d0
		moveq.l    #12,d1
		lsr.w      d1,d0
		and.w      #$000F,d0
		andi.w     #$FFF0,950(a2)
		and.w      #$000F,d0
		or.w       d0,950(a2)
		move.w     (a6),d0
		lsr.w      #3,d0
		and.w      #$001F,d0
		lsl.w      #2,d0
		lea.l      masklist,a0
		movea.l    0(a0,d0.w),a1
		movea.l    a2,a0
		moveq.l    #30,d0
		jsr        Aob_puttext
		move.w     2(a6),d0
		lsr.w      #2,d0
		and.w      #$0001,d0
		beq.s      object_tree_8
		lea.l      SIZE_TEXT1,a1
		movea.l    a2,a0
		moveq.l    #20,d0
		jsr        Aob_puttext
		bra.s      object_tree_9
object_tree_8:
		lea.l      SIZE_TEXT0,a1
		moveq.l    #20,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_9:
		move.w     2(a6),d0
		lsr.w      #8,d0
		and.w      #$00FF,d0
		move.w     d0,-(a7)
		lea.l      xbce85,a1
		lea.l      6(a7),a0
		jsr        sprintf
		addq.w     #2,a7
		lea.l      4(a7),a1
		moveq.l    #22,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		move.w     2(a6),d0
		lsr.w      #1,d0
		and.w      #$0001,d0
		beq.s      object_tree_10
		ori.w      #$0001,1162(a2)
object_tree_10:
		move.w     2(a6),d0
		lsr.w      #3,d0
		and.w      #$0001,d0
		beq.s      object_tree_11
		ori.w      #$0001,586(a2)
object_tree_11:
		moveq.l    #1,d0
		and.w      2(a6),d0
		beq.s      object_tree_1
		ori.w      #$0001,634(a2)
object_tree_1:
		movea.l    a2,a0
		lea.l      14(a7),a7
		movem.l    (a7)+,a2-a6
		rts

test_it:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     #A_boxed,(a1)
		pea.l      4(a2)
		lea.l      xbce7e,a1
		movea.l    (a0),a0
		jsr        sscanf
		addq.w     #4,a7
		move.l     #Auo_boxed,8(a2)
		cmpi.w     #$0002,8(a3)
		bne.s      test_it_1
		move.l     10(a3),12(a2)
		bra.s      test_it_2
test_it_1:
		clr.l      12(a2)
test_it_2:
		moveq.l    #0,d0
		move.l     d0,20(a2)
		move.l     d0,16(a2)
		movea.l    38(a3),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      test_it_3
		suba.l     a0,a0
		bra.s      test_it_4
test_it_3:
		movea.l    38(a3),a0
test_it_4:
		move.l     a0,24(a2)
		movea.l    42(a3),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      test_it_5
		suba.l     a0,a0
		bra.s      test_it_6
test_it_5:
		movea.l    42(a3),a0
test_it_6:
		move.l     a0,28(a2)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

abort:
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    20(a1),a0
		movea.l    60(a0),a0
		clr.l      24(a0)
		clr.l      28(a0)
		movea.l    data+64,a0
		movea.l    (a0),a0
		jsr        (a0)
		rts

ok:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      -52(a7),a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    20(a1),a3
		movea.l    60(a3),a0
		lea.l      4(a0),a2
		pea.l      (a7)
		lea.l      xbce85,a1
		moveq.l    #22,d0
		movea.l    a3,a0
		jsr        Aob_scanf
		addq.w     #4,a7
		cmpi.w     #$00FF,(a7)
		ble.s      ok_1
		move.w     #$00FF,(a7)
ok_1:
		move.w     (a7),d0
		andi.w     #$00FF,2(a2)
		and.w      #$00FF,d0
		lsl.w      #8,d0
		or.w       d0,2(a2)
		move.l     (a2),-(a7)
		lea.l      xbce7e,a1
		lea.l      parm,a0
		jsr        sprintf
		addq.w     #4,a7
		lea.l      2(a7),a2
		move.l     #parm,(a2)
		move.l     #xbce6f,4(a2)
		lea.l      48(a7),a1
		moveq.l    #3,d0
		lea.l      192(a3),a0
		jsr        Auo_boxed
		movea.l    48(a7),a0
		move.b     (a0),d0
		beq.s      ok_2
		jsr        strlen
		movea.l    ACSblk,a0
		muls.w     18(a0),d0
		move.w     d0,(a7)
		move.w     #$0002,8(a2)
		move.l     48(a7),10(a2)
		bra.s      ok_3
ok_2:
		movea.l    ACSblk,a0
		move.w     18(a0),(a7)
		clr.w      8(a2)
		clr.l      10(a2)
ok_3:
		clr.l      14(a2)
		clr.w      d0
		move.w     d0,28(a2)
		move.w     d0,18(a2)
		moveq.l    #0,d1
		move.l     d1,30(a2)
		move.l     d1,20(a2)
		moveq.l    #0,d0
		move.l     d0,34(a2)
		move.l     d0,24(a2)
		lea.l      38(a2),a1
		lea.l      1272(a3),a0
		moveq.l    #3,d0
		jsr        Auo_boxed
		movea.l    38(a2),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_4
		clr.l      38(a2)
ok_4:
		lea.l      42(a2),a1
		moveq.l    #3,d0
		lea.l      1296(a3),a0
		jsr        Auo_boxed
		movea.l    42(a2),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_5
		clr.l      42(a2)
ok_5:
		movea.l    ACSblk,a0
		move.w     20(a0),d1
		move.w     (a7),d0
		movea.l    a2,a0
		movea.l    data+64,a1
		movea.l    4(a1),a1
		jsr        (a1)
		bsr        abort
		lea.l      52(a7),a7
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

edbe_3d:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a3
		addq.w     #4,a3
		moveq.l    #1,d0
		move.w     608(a0),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		and.w      10(a1,d1.l),d0
		beq.s      edbe_3d_1
		andi.w     #$FFFD,2(a3)
		ori.w      #$0002,2(a3)
		bra.s      edbe_3d_2
edbe_3d_1:
		andi.w     #$FFFD,2(a3)
edbe_3d_2:
		moveq.l    #-1,d1
		movea.l    (a2),a0
		move.w     608(a0),d0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a3
		movea.l    102(a3),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a2),a0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a3
		movea.l    102(a3),a1
		jsr        (a1)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

edbe_autobig:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a3
		addq.w     #4,a3
		moveq.l    #1,d0
		move.w     608(a0),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		and.w      10(a1,d1.l),d0
		beq.s      edbe_autobig_1
		andi.w     #$FFF7,2(a3)
		ori.w      #$0008,2(a3)
		bra.s      edbe_autobig_2
edbe_autobig_1:
		andi.w     #$FFF7,2(a3)
edbe_autobig_2:
		moveq.l    #-1,d1
		movea.l    (a2),a0
		move.w     608(a0),d0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a3
		movea.l    102(a3),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a2),a0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a3
		movea.l    102(a3),a1
		jsr        (a1)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

edbe_secret:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a3
		addq.w     #4,a3
		moveq.l    #1,d0
		move.w     608(a0),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		and.w      10(a1,d1.l),d0
		beq.s      edbe_secret_1
		andi.w     #$FFFE,2(a3)
		ori.w      #$0001,2(a3)
		bra.s      edbe_secret_2
edbe_secret_1:
		andi.w     #$FFFE,2(a3)
edbe_secret_2:
		moveq.l    #-1,d1
		movea.l    (a2),a0
		move.w     608(a0),d0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a3
		movea.l    102(a3),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a2),a0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a3
		movea.l    102(a3),a1
		jsr        (a1)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

edbe_incol:
		move.w     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		addq.w     #4,a2
		moveq.l    #46,d0
		move.w     d0,-(a7)
		moveq.l    #47,d2
		moveq.l    #44,d1
		move.w     (a2),d0
		lsr.w      #8,d0
		and.w      #$000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		ble.s      edbe_incol_1
		move.w     d3,d1
		andi.w     #$F0FF,(a2)
		and.w      #$000F,d1
		lsl.w      #8,d1
		or.w       d1,(a2)
		moveq.l    #-1,d1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		moveq.l    #1,d0
		jsr        (a1)
edbe_incol_1:
		movea.l    (a7)+,a2
		move.w     (a7)+,d3
		rts

edbe_outcol:
		move.l     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		addq.w     #4,a2
		moveq.l    #39,d0
		move.w     d0,-(a7)
		moveq.l    #40,d2
		moveq.l    #37,d1
		move.w     (a2),d0
		moveq.l    #12,d3
		lsr.w      d3,d0
		and.w      #$000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		ble.s      edbe_outcol_1
		move.w     d3,d1
		andi.w     #$0FFF,(a2)
		and.w      #$000F,d1
		lsl.w      #8,d1
		lsl.w      #4,d1
		or.w       d1,(a2)
		moveq.l    #-1,d1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		moveq.l    #1,d0
		jsr        (a1)
edbe_outcol_1:
		movea.l    (a7)+,a2
		move.l     (a7)+,d3
		rts

edbe_size:
		movem.l    a2-a3/a5,-(a7)
		subq.w     #8,a7
		lea.l      POP_SIZESEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edbe_size_1
		lea.l      ACSblk,a3
		moveq.l    #18,d0
		movea.l    (a3),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a1
		lea.l      (a7),a0
		jsr        Aob_offset
		moveq.l    #1,d0
		movea.l    (a3),a0
		movea.l    600(a0),a1
		add.w      52(a1),d0
		add.w      d0,(a7)
		moveq.l    #1,d1
		add.w      54(a1),d1
		add.w      d1,2(a7)
		movea.l    604(a0),a1
		movea.l    60(a1),a5
		addq.w     #4,a5
		move.w     2(a5),d0
		lsr.w      #2,d0
		and.w      #$0001,d0
		addq.w     #1,d0
		moveq.l    #0,d1
		move.w     d0,d1
		move.l     d1,d2
		add.l      d2,d2
		add.l      d1,d2
		lsl.l      #3,d2
		ori.w      #$0004,10(a2,d2.l)
		move.w     2(a7),d1
		move.w     (a7),d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        Ame_popup
		tst.w      d0
		ble.s      edbe_size_2
		cmp.w      #$0001,d0
		bne.s      edbe_size_3
		andi.w     #$FFFB,2(a5)
		lea.l      SIZE_TEXT0,a1
		moveq.l    #20,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edbe_size_4
edbe_size_3:
		andi.w     #$FFFB,2(a5)
		ori.w      #$0004,2(a5)
		lea.l      SIZE_TEXT1,a1
		moveq.l    #20,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
edbe_size_4:
		moveq.l    #-1,d1
		moveq.l    #20,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a5
		movea.l    102(a5),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a5
		movea.l    102(a5),a1
		jsr        (a1)
edbe_size_2:
		movea.l    a2,a0
		jsr        Aob_delete
edbe_size_1:
		addq.w     #8,a7
		movem.l    (a7)+,a2-a3/a5
		rts

edbe_mask:
		movem.l    d3/a2-a5,-(a7)
		lea.l      -16(a7),a7
		lea.l      POP_MASKSEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edbe_mask_1
		lea.l      ACSblk,a3
		lea.l      8(a7),a5
		moveq.l    #28,d0
		movea.l    (a3),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a1
		movea.l    a5,a0
		jsr        Aob_offset
		moveq.l    #1,d0
		movea.l    (a3),a0
		movea.l    600(a0),a1
		add.w      52(a1),d0
		add.w      d0,(a5)
		moveq.l    #1,d1
		add.w      54(a1),d1
		add.w      d1,2(a5)
		movea.l    604(a0),a1
		movea.l    60(a1),a4
		addq.w     #4,a4
		movea.l    600(a0),a0
		movea.l    a2,a1
		move.w     (a5),d0
		move.w     2(a5),d1
		jsr        Ame_popup
		move.w     d0,d3
		ble        edbe_mask_2
		ext.l      d0
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		lea.l      24(a2,d1.l),a5
		move.w     8(a5),d2
		and.w      #$8000,d2
		beq        edbe_mask_2
		move.w     14(a5),d2
		andi.w     #$FF07,(a4)
		and.w      #$001F,d2
		lsl.w      #3,d2
		or.w       d2,(a4)
		move.w     (a4),d2
		lsr.w      #3,d2
		and.w      #$001F,d2
		lsl.w      #2,d2
		lea.l      masklist,a0
		movea.l    0(a0,d2.w),a1
		movea.l    (a3),a0
		movea.l    604(a0),a0
		moveq.l    #30,d0
		jsr        Aob_puttext
		lea.l      4(a7),a1
		moveq.l    #3,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    20(a0),a0
		lea.l      192(a0),a0
		jsr        Auo_boxed
		movea.l    4(a7),a0
		jsr        Ast_create
		move.l     a0,(a7)
		beq.s      edbe_mask_3
		lea.l      xbce5a,a1
		moveq.l    #4,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    20(a0),a0
		lea.l      192(a0),a0
		jsr        Auo_boxed
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    204(a1),a4
		addq.w     #4,a4
		move.w     14(a5),d0
		andi.w     #$FF07,(a4)
		and.w      #$001F,d0
		lsl.w      #3,d0
		or.w       d0,(a4)
		movea.l    (a7),a1
		moveq.l    #4,d0
		movea.l    (a3),a0
		movea.l    600(a0),a4
		movea.l    20(a4),a0
		lea.l      192(a0),a0
		jsr        Auo_boxed
		suba.l     a1,a1
		moveq.l    #6,d0
		movea.l    (a3),a0
		movea.l    600(a0),a4
		movea.l    20(a4),a0
		lea.l      192(a0),a0
		jsr        Auo_boxed
		movea.l    (a7),a0
		jsr        Ast_delete
edbe_mask_3:
		moveq.l    #-1,d1
		moveq.l    #28,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a4
		movea.l    102(a4),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a4
		movea.l    102(a4),a1
		jsr        (a1)
edbe_mask_2:
		movea.l    a2,a0
		jsr        Aob_delete
edbe_mask_1:
		lea.l      16(a7),a7
		movem.l    (a7)+,d3/a2-a5
		rts

edbe_textcol:
		move.w     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		addq.w     #4,a2
		moveq.l    #14,d0
		move.w     d0,-(a7)
		moveq.l    #15,d2
		moveq.l    #12,d1
		move.w     2(a2),d0
		lsr.w      #4,d0
		and.w      #$000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		ble.s      edbe_textcol_1
		move.w     d3,d1
		andi.w     #$FF0F,2(a2)
		and.w      #$000F,d1
		lsl.w      #4,d1
		or.w       d1,2(a2)
		moveq.l    #-1,d1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		moveq.l    #1,d0
		jsr        (a1)
edbe_textcol_1:
		movea.l    (a7)+,a2
		move.w     (a7)+,d3
		rts

	.data

BUBBLE_01:
		dc.b 'Die énderungen werden Åbernommen und Åberschreiben die alten Einstellungen.',0
BUBBLE_02:
		dc.b 'Die énderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
BUBBLE_03:
		dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_04:
		dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
PMT00:
		dc.b '  alle Zeichen',0
PMT01:
		dc.b '  normaler Pfad',0
PMT02:
		dc.b '  normale Datei',0
PMT03:
		dc.b '  TOS-Datei',0
PMT04:
		dc.b '  TOS-Datei-Muster',0
PMT05:
		dc.b '  TOS-Pfad',0
PMT06:
		dc.b '  TOS-Pfad-Muster',0
PMT07:
		dc.b '  normal',0
PMT08:
		dc.b '  Buchstaben',0
PMT09:
		dc.b '  Buchstaben & Zahlen',0
PMT10:
		dc.b '  BinÑrzahl',0
PMT11:
		dc.b '  neg. BinÑrzahl',0
PMT12:
		dc.b '  Oktalzahl',0
PMT13:
		dc.b '  neg. Oktalzahl',0
PMT14:
		dc.b '  Dezimalzahl',0
PMT15:
		dc.b '  neg. Dezimalzahl',0
PMT16:
		dc.b '  Hexadezimalzahl',0
PMT17:
		dc.b '  neg. Hexadezimalzahl',0
PMT18:
		dc.b '  Flieûkommazahl',0
PMT19:
		dc.b '  neg. Flieûkommazahl',0
PMT20:
		dc.b '  TT.MM.JJJJ',0
PMT21:
		dc.b '  TT/MM/JJJJ',0
PMT22:
		dc.b '  MM.TT.JJJJ',0
PMT23:
		dc.b '  MM/TT/JJJJ',0
PMT24:
		dc.b '  Stunden unbegrenzt',0
PMT25:
		dc.b '  max. 12 Stunden',0
PMT26:
		dc.b '  max. 24 Stunden',0
TEXT_005:
		dc.b '  Datum             '
		dc.w $0300
TEXT_009:
		dc.b 'Abbruch',0
TEXT_01:
		dc.b '3D-Modus',0
TEXT_02:
		dc.b 'unsichtbarer Text',0
TEXT_05:
		dc.b 'Sonstiges',0
TEXT_06:
		dc.b '  Zeit              '
		dc.b $03
		dc.w $004b
		dc.b 'apitalisieren',0
TEXT_08:
		dc.b 'BubbleGEM-Text',0
TEXT_09:
		dc.b 'unten:',0
TEXT_10:
		dc.b 'Rahmen:                ',0
TEXT_11:
		dc.b 'Farbe:',0
TEXT_12:
		dc.b 'Grîûe:',0
TEXT_13:
		dc.b 'LÑnge:',0
TEXT_14:
		dc.b 'Text:',0
TEXT_15:
		dc.b 'Maske:',0
TEXT_16:
		dc.b 'Context-Popup',0
TEXT_18:
		dc.b 'Eingabe:',0
TEXT_19:
		dc.b 'oben:',0
TEXT_20:
		dc.b 'Format: Std:Min:Sek',0
TEXT_21:
		dc.b 'links/',0
TEXT_22:
		dc.b 'rechts/',0
TEXT_30:
		dc.b '  Zahlen            '
		dc.w $0300
TEXT_41:
		dc.w $4f4b
		dc.w $0020
		dc.b ' Pfad              '
		dc.b $03
		dc.w $0020
		dc.b ' Datei             '
		dc.b $03
		dc.w $0044
		dc.b 'er BoxEdit-Editor',0
title:
		dc.b 'BOXEDIT -',0
A_3DBUTTON01:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TXT1
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON02:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT00
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON03:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_30
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON04:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_005
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON05:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TXT0
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON06:
		dc.l A_3Dbutton
		dc.w $21f1
		dc.w $0178
		dc.l Auo_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON07:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON08:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT02
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON09:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_009
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_02
		dc.w $0000
		dc.w $0000
A_3DBUTTON10:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT03
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON11:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT07
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON12:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT10
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON13:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT08
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON14:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT09
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON15:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT11
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON16:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_41
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_01
		dc.w $0000
		dc.w $0000
A_3DBUTTON25:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT20
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON26:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT22
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON27:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON28:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT21
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON29:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_06
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON30:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT24
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON31:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT25
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON32:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT26
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON33:
		dc.l A_3Dbutton
		dc.w $6900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_20
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON34:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT23
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON35:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT01
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON36:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT05
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON37:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT06
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON38:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT04
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON39:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT12
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON40:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT13
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON41:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT14
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON42:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT15
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON43:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT16
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON44:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT17
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON45:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT18
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON46:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l PMT19
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_ARROWS02:
		dc.l A_arrows
		dc.w $1301
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
A_BOXED01:
		dc.l A_boxed
		dc.w $9000
		dc.w $ff12
		dc.l Auo_boxed
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_BOXED02:
		dc.l A_boxed
		dc.w $9038
		dc.w $ff12
		dc.l Auo_boxed
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_BOXED03:
		dc.l A_boxed
		dc.w $9070
		dc.w $0512
		dc.l Auo_boxed
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_BOXED04:
		dc.l A_boxed
		dc.w $9038
		dc.w $ff12
		dc.l Auo_boxed
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_03
		dc.w $0000
		dc.w $0000
A_BOXED05:
		dc.l A_boxed
		dc.w $9038
		dc.w $ff12
		dc.l Auo_boxed
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_04
		dc.w $0000
		dc.w $0000
A_CHECKBOX01:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_01
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_CHECKBOX02:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_07
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_CHECKBOX03:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_02
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME01:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_10
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME02:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_14
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME03:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_05
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME04:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_18
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
POP_MASKSEL:
		dc.w $ffff
		dc.w $0001
		dc.w $0039
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $00ff
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $0016
		dc.w $0009
_01_POP_MASKSEL:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON02
		dc.w $0000
		dc.w $0000
		dc.w $0016
		dc.w $0001
_01aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_03_POP_MASKSEL:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON11
		dc.w $0000
		dc.w $0001
		dc.w $0016
		dc.w $0001
_03aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0007
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_05_POP_MASKSEL:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON13
		dc.w $0000
		dc.w $0002
		dc.w $0016
		dc.w $0001
_05aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_07_POP_MASKSEL:
		dc.w $0009
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON14
		dc.w $0000
		dc.w $0003
		dc.w $0016
		dc.w $0001
_07aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0009
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_09_POP_MASKSEL:
		dc.w $0011
		dc.w $000a
		dc.w $000a
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON05
		dc.w $0000
		dc.w $0004
		dc.w $0016
		dc.w $0001
_10_POP_MASKSEL:
		dc.w $0009
		dc.w $000b
		dc.w $000f
		dc.w $0014
		dc.w $0080
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0000
		dc.w $0000
		dc.w $0012
		dc.w $0003
_11_POP_MASKSEL:
		dc.w $000d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON35
		dc.w $0000
		dc.w $0000
		dc.w $0012
		dc.w $0001
_11aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_13_POP_MASKSEL:
		dc.w $000f
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON36
		dc.w $0000
		dc.w $0001
		dc.w $0012
		dc.w $0001
_13aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0005
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_15_POP_MASKSEL:
		dc.w $000a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON37
		dc.w $0000
		dc.w $0002
		dc.w $0012
		dc.w $0001
_15aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0006
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_17_POP_MASKSEL:
		dc.w $0019
		dc.w $0012
		dc.w $0012
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON01
		dc.w $0000
		dc.w $0005
		dc.w $0016
		dc.w $0001
_18_POP_MASKSEL:
		dc.w $0011
		dc.w $0013
		dc.w $0017
		dc.w $0014
		dc.w $0080
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0000
		dc.w $0000
		dc.w $0013
		dc.w $0003
_19_POP_MASKSEL:
		dc.w $0015
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON08
		dc.w $0000
		dc.w $0000
		dc.w $0013
		dc.w $0001
_19aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_21_POP_MASKSEL:
		dc.w $0017
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON10
		dc.w $0000
		dc.w $0001
		dc.w $0013
		dc.w $0001
_21aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0003
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_23_POP_MASKSEL:
		dc.w $0012
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON38
		dc.w $0000
		dc.w $0002
		dc.w $0013
		dc.w $0001
_23aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0004
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_25_POP_MASKSEL:
		dc.w $002f
		dc.w $001a
		dc.w $001a
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON03
		dc.w $0000
		dc.w $0006
		dc.w $0016
		dc.w $0001
_26_POP_MASKSEL:
		dc.w $0019
		dc.w $001b
		dc.w $002d
		dc.w $0014
		dc.w $0080
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0000
		dc.w $0000
		dc.w $0017
		dc.w $000a
_27_POP_MASKSEL:
		dc.w $001d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON12
		dc.w $0000
		dc.w $0000
		dc.w $0017
		dc.w $0001
_27aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_29_POP_MASKSEL:
		dc.w $001f
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON15
		dc.w $0000
		dc.w $0001
		dc.w $0017
		dc.w $0001
_29aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $000b
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_31_POP_MASKSEL:
		dc.w $0021
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON39
		dc.w $0000
		dc.w $0002
		dc.w $0017
		dc.w $0001
_31aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $000c
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_33_POP_MASKSEL:
		dc.w $0023
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON40
		dc.w $0000
		dc.w $0003
		dc.w $0017
		dc.w $0001
_33aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $000d
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_35_POP_MASKSEL:
		dc.w $0025
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON41
		dc.w $0000
		dc.w $0004
		dc.w $0017
		dc.w $0001
_35aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $000e
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_37_POP_MASKSEL:
		dc.w $0027
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON42
		dc.w $0000
		dc.w $0005
		dc.w $0017
		dc.w $0001
_37aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $000f
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_39_POP_MASKSEL:
		dc.w $0029
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON43
		dc.w $0000
		dc.w $0006
		dc.w $0017
		dc.w $0001
_39aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_41_POP_MASKSEL:
		dc.w $002b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON44
		dc.w $0000
		dc.w $0007
		dc.w $0017
		dc.w $0001
_41aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0011
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_43_POP_MASKSEL:
		dc.w $002d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON45
		dc.w $0000
		dc.w $0008
		dc.w $0017
		dc.w $0001
_43aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0012
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_45_POP_MASKSEL:
		dc.w $001a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON46
		dc.w $0000
		dc.w $0009
		dc.w $0017
		dc.w $0001
_45aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0013
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_47_POP_MASKSEL:
		dc.w $0039
		dc.w $0030
		dc.w $0030
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON04
		dc.w $0000
		dc.w $0007
		dc.w $0016
		dc.w $0001
_48_POP_MASKSEL:
		dc.w $002f
		dc.w $0031
		dc.w $0037
		dc.w $0014
		dc.w $0080
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0000
		dc.w $0000
		dc.w $000e
		dc.w $0004
_49_POP_MASKSEL:
		dc.w $0033
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON25
		dc.w $0000
		dc.w $0000
		dc.w $000e
		dc.w $0001
_49aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_51_POP_MASKSEL:
		dc.w $0035
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON28
		dc.w $0000
		dc.w $0001
		dc.w $000e
		dc.w $0001
_51aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0015
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_53_POP_MASKSEL:
		dc.w $0037
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON26
		dc.w $0000
		dc.w $0002
		dc.w $000e
		dc.w $0001
_53aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0016
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_55_POP_MASKSEL:
		dc.w $0030
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON34
		dc.w $0000
		dc.w $0003
		dc.w $000e
		dc.w $0001
_55aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0017
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_57_POP_MASKSEL:
		dc.w $0000
		dc.w $003a
		dc.w $003a
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON29
		dc.w $0000
		dc.w $0008
		dc.w $0016
		dc.w $0001
_58_POP_MASKSEL:
		dc.w $0039
		dc.w $003b
		dc.w $0040
		dc.w $0014
		dc.w $0080
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0000
		dc.w $0000
		dc.w $0015
		dc.w $0004
_59_POP_MASKSEL:
		dc.w $003c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON33
		dc.w $0000
		dc.w $0000
		dc.w $0015
		dc.w $0001
_60_POP_MASKSEL:
		dc.w $003e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON30
		dc.w $0000
		dc.w $0001
		dc.w $0015
		dc.w $0001
_60aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_62_POP_MASKSEL:
		dc.w $0040
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON31
		dc.w $0000
		dc.w $0002
		dc.w $0015
		dc.w $0001
_62aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0019
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_64_POP_MASKSEL:
		dc.w $003a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON32
		dc.w $0000
		dc.w $0003
		dc.w $0015
		dc.w $0001
_64aPOP_MASKSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8020
		dc.w $0000
		dc.w $0000
		dc.w $001a
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl ED_BOXED
ED_BOXED:
		dc.w $ffff
		dc.w $0001
		dc.w $0032
		dc.w $0018
		dc.w $0000
		dc.w $0010
		dc.l A_3DBUTTON06
		dc.w $0000
		dc.w $0000
		dc.w $003c
		dc.w $0014
_01_ED_BOXED:
		dc.w $0003
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON07
		dc.w $0000
		dc.w $0000
		dc.w $0017
		dc.w $0003
_02_ED_BOXED:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0010
		dc.l A_BOXED02
		dc.w $0002
		dc.w $0001
		dc.w $0013
		dc.w $0001
_03_ED_BOXED:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON16
		dc.w $0020
		dc.w $0001
		dc.w $000c
		dc.w $0002
_03aED_BOXED:
		dc.l ok
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $884f
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_05_ED_BOXED:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON09
		dc.w $002e
		dc.w $0001
		dc.w $000c
		dc.w $0002
_05aED_BOXED:
		dc.l abort
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8841
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_07_ED_BOXED:
		dc.w $0017
		dc.w $0008
		dc.w $0016
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME02
		dc.w $0001
		dc.w $0004
		dc.w $003a
		dc.w $0005
_08_ED_BOXED:
		dc.w $000a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0048
		dc.w $0010
		dc.l A_BOXED01
		dc.w $0001
		dc.w $0001
		dc.w $0038
		dc.w $0002
_08aED_BOXED:
		dc.l Aus_boxed
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_10_ED_BOXED:
		dc.w $000c
		dc.w $000b
		dc.w $000b
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_11
		dc.w $0001
		dc.w $0003
		dc.w $0006
		dc.w $0001
_11_ED_BOXED:
		dc.w $000a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_12_ED_BOXED:
		dc.w $0010
		dc.w $000e
		dc.w $000f
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0008
		dc.w $0003
		dc.w $0012
		dc.w $0001
_12aED_BOXED:
		dc.l edbe_textcol
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8846
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_14_ED_BOXED:
		dc.w $000f
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1171
		dc.w $0010
		dc.w $0000
		dc.w $0002
		dc.w $0001
_15_ED_BOXED:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON27
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_16_ED_BOXED:
		dc.w $0012
		dc.w $0011
		dc.w $0011
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_12
		dc.w $001d
		dc.w $0003
		dc.w $0006
		dc.w $0001
_17_ED_BOXED:
		dc.w $0010
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_18_ED_BOXED:
		dc.w $0015
		dc.w $0014
		dc.w $0014
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0024
		dc.w $0003
		dc.w $0008
		dc.w $0001
_18aED_BOXED:
		dc.l edbe_size
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8847
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_20_ED_BOXED:
		dc.w $0012
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON07
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0001
_21_ED_BOXED:
		dc.w $0016
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_13
		dc.w $002f
		dc.w $0003
		dc.w $0007
		dc.w $0001
_22_ED_BOXED:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED03
		dc.w $0036
		dc.w $0003
		dc.w $0003
		dc.w $0001
_23_ED_BOXED:
		dc.w $0021
		dc.w $0018
		dc.w $001f
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME04
		dc.w $0001
		dc.w $0009
		dc.w $001e
		dc.w $0006
_24_ED_BOXED:
		dc.w $001a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_CHECKBOX02
		dc.w $0007
		dc.w $0001
		dc.w $0011
		dc.w $0001
_24aED_BOXED:
		dc.l edbe_autobig
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $884b
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_26_ED_BOXED:
		dc.w $001c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_CHECKBOX03
		dc.w $0007
		dc.w $0002
		dc.w $0014
		dc.w $0001
_26aED_BOXED:
		dc.l edbe_secret
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_28_ED_BOXED:
		dc.w $001f
		dc.w $001e
		dc.w $001e
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0007
		dc.w $0004
		dc.w $0016
		dc.w $0001
_28aED_BOXED:
		dc.l edbe_mask
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $884d
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_30_ED_BOXED:
		dc.w $001c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON07
		dc.w $0000
		dc.w $0000
		dc.w $0016
		dc.w $0001
_31_ED_BOXED:
		dc.w $0017
		dc.w $0020
		dc.w $0020
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_15
		dc.w $0001
		dc.w $0004
		dc.w $0006
		dc.w $0001
_32_ED_BOXED:
		dc.w $001f
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_33_ED_BOXED:
		dc.w $0032
		dc.w $0022
		dc.w $0030
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME01
		dc.w $001f
		dc.w $0009
		dc.w $001c
		dc.w $0006
_34_ED_BOXED:
		dc.w $0024
		dc.w $0023
		dc.w $0023
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_21
		dc.w $0002
		dc.w $0001
		dc.w $0006
		dc.w $0001
_35_ED_BOXED:
		dc.w $0022
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_36_ED_BOXED:
		dc.w $0025
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_19
		dc.w $0003
		dc.w $0002
		dc.w $0005
		dc.w $0001
_37_ED_BOXED:
		dc.w $0029
		dc.w $0027
		dc.w $0028
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0002
		dc.w $0012
		dc.w $0001
_37aED_BOXED:
		dc.l edbe_outcol
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $884c
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_39_ED_BOXED:
		dc.w $0028
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $4301
		dc.w $1371
		dc.w $0010
		dc.w $0000
		dc.w $0002
		dc.w $0001
_40_ED_BOXED:
		dc.w $0025
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON27
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_41_ED_BOXED:
		dc.w $002b
		dc.w $002a
		dc.w $002a
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_22
		dc.w $0001
		dc.w $0003
		dc.w $0007
		dc.w $0001
_42_ED_BOXED:
		dc.w $0029
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
_43_ED_BOXED:
		dc.w $002c
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_09
		dc.w $0002
		dc.w $0004
		dc.w $0006
		dc.w $0001
_44_ED_BOXED:
		dc.w $0030
		dc.w $002e
		dc.w $002f
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0004
		dc.w $0012
		dc.w $0001
_44aED_BOXED:
		dc.l edbe_incol
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8852
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_46_ED_BOXED:
		dc.w $002f
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $4301
		dc.w $1371
		dc.w $0010
		dc.w $0000
		dc.w $0002
		dc.w $0001
_47_ED_BOXED:
		dc.w $002c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON27
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_48_ED_BOXED:
		dc.w $0021
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_CHECKBOX01
		dc.w $0007
		dc.w $0000
		dc.w $000b
		dc.w $0001
_48aED_BOXED:
		dc.l edbe_3d
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8844
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_50_ED_BOXED:
		dc.w $0000
		dc.w $0033
		dc.w $0036
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME03
		dc.w $0001
		dc.w $000f
		dc.w $003a
		dc.w $0005
_51_ED_BOXED:
		dc.w $0034
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_08
		dc.w $0001
		dc.w $0001
		dc.w $000e
		dc.w $0001
_52_ED_BOXED:
		dc.w $0035
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_16
		dc.w $0001
		dc.w $0003
		dc.w $000d
		dc.w $0001
_53_ED_BOXED:
		dc.w $0036
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED04
		dc.w $0010
		dc.w $0001
		dc.w $0029
		dc.w $0001
_54_ED_BOXED:
		dc.w $0032
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0028
		dc.w $0010
		dc.l A_BOXED05
		dc.w $0010
		dc.w $0003
		dc.w $0029
		dc.w $0001
masklist:
		dc.l PMT00
		dc.l PMT01
		dc.l PMT02
		dc.l PMT03
		dc.l PMT04
		dc.l PMT05
		dc.l PMT06
		dc.l PMT07
		dc.l PMT08
		dc.l PMT09
		dc.l PMT10
		dc.l PMT11
		dc.l PMT12
		dc.l PMT13
		dc.l PMT14
		dc.l PMT15
		dc.l PMT16
		dc.l PMT17
		dc.l PMT18
		dc.l PMT19
		dc.l PMT20
		dc.l PMT21
		dc.l PMT22
		dc.l PMT23
		dc.l PMT24
		dc.l PMT25
		dc.l PMT26
		dc.l xbce5a
		dc.l xbce5a
		dc.l xbce5a
		dc.l xbce5a
		dc.l xbce5a
		dc.l xbce5a
		dc.l xbce5a
		dc.l xbce5a
DB1:
		dc.l A_boxed
		dc.w $9038
		dc.w $ff12
		dc.l Auo_boxed
		dc.l xbce5b
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
visual:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $2005
		dc.w $0010
		dc.l DB1
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0001
logical:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l DB1
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0001
aud:
		dc.l xbce63
		dc.l xbce6f
		dc.w $0002
		dc.l xbce79
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
data:
		dc.b 'A_boxed',0
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l object_tree
		dc.l test_it
		dc.l ok
		dc.l Aob_delete
		dc.l visual
		dc.l logical
		dc.l aud
		dc.l minsize
		dc.l 0
		dc.l title
		dc.l help_title
		dc.w $0000
		dc.w $0000
xbce5a:
		dc.b 0
xbce5b:
		dc.b 'BoxEdit',0
xbce63:
		dc.b '0x9038ff12L',0
xbce6f:
		dc.b 'Auo_boxed',0
xbce79:
		dc.b 'Text',0
xbce7e:
		dc.b '0x%lxL',0
xbce85:
		dc.b '%d',9
		.even
