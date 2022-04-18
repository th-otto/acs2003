	.text

edti_pos:
		movem.l    a2-a4,-(a7)
		subq.w     #8,a7
		lea.l      POP_HORPOSSEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edti_pos_1
		lea.l      ACSblk,a3
		moveq.l    #25,d0
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
		moveq.l    #3,d2
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		and.w      6(a0),d2
		tst.w      d2
		beq.s      edti_pos_2
		subq.w     #1,d2
		beq.s      edti_pos_3
		subq.w     #1,d2
		beq.s      edti_pos_4
		bra.s      edti_pos_5
edti_pos_2:
		ori.w      #$0004,34(a2)
		bra.s      edti_pos_5
edti_pos_3:
		ori.w      #$0004,58(a2)
		bra.s      edti_pos_5
edti_pos_4:
		ori.w      #$0004,82(a2)
edti_pos_5:
		move.w     2(a7),d1
		move.w     (a7),d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        Ame_popup
		tst.w      d0
		ble        edti_pos_6
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a4
		addq.w     #4,a4
		andi.l     #$FFFFFFFC,(a4)
		move.w     d0,d1
		subq.w     #1,d1
		beq.s      edti_pos_7
		subq.w     #1,d1
		beq.s      edti_pos_8
		subq.w     #1,d1
		beq.s      edti_pos_9
		bra.s      edti_pos_10
edti_pos_7:
		lea.l      HPOS_TEXT1,a1
		moveq.l    #27,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edti_pos_10
edti_pos_8:
		ori.l      #$00000001,(a4)
		lea.l      HPOS_TEXT2,a1
		moveq.l    #27,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edti_pos_10
edti_pos_9:
		ori.l      #$00000002,(a4)
		lea.l      HPOS_TEXT3,a1
		moveq.l    #27,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
edti_pos_10:
		moveq.l    #-1,d1
		moveq.l    #27,d0
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
edti_pos_6:
		movea.l    a2,a0
		jsr        Aob_delete
edti_pos_1:
		addq.w     #8,a7
		movem.l    (a7)+,a2-a4
		rts

edti_replace:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		ori.l      #$00000008,4(a0)
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        Awi_obredraw
		rts

edti_size:
		movem.l    a2-a4,-(a7)
		subq.w     #8,a7
		lea.l      POP_SIZESEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edti_size_1
		lea.l      ACSblk,a3
		moveq.l    #11,d0
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
		movea.l    60(a1),a0
		move.l     4(a0),d0
		asr.l      #2,d0
		and.w      #$0001,d0
		ext.l      d0
		move.l     d0,d2
		add.l      d2,d2
		add.l      d0,d2
		lsl.l      #3,d2
		ori.w      #$0004,34(a2,d2.l)
		move.w     2(a7),d1
		move.w     (a7),d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        Ame_popup
		tst.w      d0
		ble.s      edti_size_2
		movea.l    (a3),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a4
		addq.w     #4,a4
		cmp.w      #$0001,d0
		bne.s      edti_size_3
		andi.l     #$FFFFFFFB,(a4)
		lea.l      SIZE_TEXT0,a1
		moveq.l    #13,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edti_size_4
edti_size_3:
		ori.l      #$00000004,(a4)
		lea.l      SIZE_TEXT1,a1
		moveq.l    #13,d0
		movea.l    (a3),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
edti_size_4:
		moveq.l    #-1,d1
		moveq.l    #13,d0
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
edti_size_2:
		movea.l    a2,a0
		jsr        Aob_delete
edti_size_1:
		addq.w     #8,a7
		movem.l    (a7)+,a2-a4
		rts

edti_trans:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		andi.l     #$FFFFFFF7,4(a0)
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        Awi_obredraw
		rts

	.globl init_title
init_title:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		lea.l      data,a1
		move.w     #$2329,d0
		movea.l    4(a2),a3
		jsr        (a3)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

minsize:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a1,a3
		movea.l    12(a0),a2
		movea.l    a2,a0
		jsr        strlen
		movea.l    ACSblk,a0
		muls.w     18(a0),d0
		move.w     d0,(a3)
		movea.l    ACSblk,a0
		movea.l    12(a7),a1
		move.w     20(a0),(a1)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

object_tree:
		movem.l    a2-a6,-(a7)
		subq.w     #4,a7
		movea.l    a0,a5
		movea.l    a1,a4
		lea.l      ED_TITLE,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      object_tree_1
		suba.l     a0,a0
		bra        object_tree_2
object_tree_1:
		lea.l      48(a2),a3
		moveq.l    #22,d0
		and.w      8(a4),d0
		or.w       d0,8(a3)
		moveq.l    #63,d0
		and.w      10(a4),d0
		or.w       d0,10(a3)
		lea.l      ACSblk,a4
		moveq.l    #14,d0
		movea.l    a2,a1
		movea.l    (a4),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #2,d0
		movea.l    a2,a1
		movea.l    (a4),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #23,d0
		movea.l    a2,a1
		movea.l    (a4),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #24,d0
		movea.l    a2,a1
		movea.l    (a4),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		movea.l    12(a3),a4
		pea.l      (a7)
		lea.l      xc4974,a1
		movea.l    (a5),a0
		jsr        sscanf
		addq.w     #4,a7
		move.l     (a7),4(a4)
		cmpi.w     #$0002,8(a5)
		bne.s      object_tree_3
		movea.l    10(a5),a1
		moveq.l    #14,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_4
object_tree_3:
		lea.l      xc4963,a1
		moveq.l    #4,d0
		movea.l    a3,a0
		movea.l    8(a4),a6
		jsr        (a6)
		lea.l      xc4963,a1
		moveq.l    #14,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_4:
		moveq.l    #4,d0
		and.l      (a7),d0
		beq.s      object_tree_5
		lea.l      SIZE_TEXT1,a1
		movea.l    a2,a0
		moveq.l    #13,d0
		jsr        Aob_puttext
		bra.s      object_tree_6
object_tree_5:
		lea.l      SIZE_TEXT0,a1
		moveq.l    #13,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_6:
		moveq.l    #3,d0
		and.w      2(a7),d0
		tst.w      d0
		beq.s      object_tree_7
		subq.w     #1,d0
		beq.s      object_tree_8
		subq.w     #1,d0
		beq.s      object_tree_9
		bra.s      object_tree_10
object_tree_7:
		lea.l      HPOS_TEXT1,a1
		moveq.l    #27,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_10
object_tree_8:
		lea.l      HPOS_TEXT2,a1
		moveq.l    #27,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_10
object_tree_9:
		lea.l      HPOS_TEXT3,a1
		moveq.l    #27,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_10:
		movea.l    564(a2),a0
		move.l     12(a0),24(a4)
		movea.l    38(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_11
		lea.l      xc4963,a1
		moveq.l    #23,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_12
object_tree_11:
		movea.l    38(a5),a1
		moveq.l    #23,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_12:
		movea.l    588(a2),a0
		move.l     12(a0),28(a4)
		movea.l    42(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_13
		lea.l      xc4963,a1
		moveq.l    #24,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_14
object_tree_13:
		movea.l    42(a5),a1
		moveq.l    #24,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_14:
		movea.l    a2,a0
object_tree_2:
		addq.w     #4,a7
		movem.l    (a7)+,a2-a6
		rts

test_it:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     #A_title,(a1)
		pea.l      4(a2)
		lea.l      xc4974,a1
		movea.l    (a0),a0
		jsr        sscanf
		addq.w     #4,a7
		move.l     #Auo_string,8(a2)
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
		movem.l    d3/a2-a4,-(a7)
		lea.l      -50(a7),a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    20(a1),a2
		movea.l    60(a2),a4
		lea.l      parm,a3
		move.l     4(a4),-(a7)
		lea.l      data+64,a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #4,a7
		lea.l      4(a7),a4
		move.l     a3,(a4)
		move.l     #xc4969,4(a4)
		lea.l      (a7),a1
		moveq.l    #3,d0
		lea.l      336(a2),a0
		jsr        Auo_boxed
		movea.l    (a7),a0
		jsr        strlen
		addq.l     #3,d0
		movea.l    ACSblk,a0
		move.w     18(a0),d1
		ext.l      d1
		jsr        _ulmul
		move.l     d0,d3
		move.w     #$0002,8(a4)
		move.l     (a7),10(a4)
		clr.l      14(a4)
		clr.w      d0
		move.w     d0,28(a4)
		move.w     d0,18(a4)
		moveq.l    #0,d1
		move.l     d1,30(a4)
		move.l     d1,20(a4)
		moveq.l    #0,d0
		move.l     d0,34(a4)
		move.l     d0,24(a4)
		lea.l      38(a4),a1
		lea.l      552(a2),a0
		moveq.l    #3,d0
		jsr        Auo_boxed
		movea.l    38(a4),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_1
		clr.l      38(a4)
ok_1:
		lea.l      42(a4),a1
		moveq.l    #3,d0
		lea.l      576(a2),a0
		jsr        Auo_boxed
		movea.l    42(a4),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_2
		clr.l      42(a4)
ok_2:
		movea.l    ACSblk,a0
		move.w     20(a0),d1
		move.w     d3,d0
		movea.l    a4,a0
		movea.l    data+64,a1
		movea.l    4(a1),a1
		jsr        (a1)
		bsr        abort
		lea.l      50(a7),a7
		movem.l    (a7)+,d3/a2-a4
		rts

	.data

BUBBLE_01:
		dc.b 'Die énderungen werden Åbernommen und Åberschreiben die alten Einstellungen.',0
BUBBLE_02:
		dc.b 'Die énderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
BUBBLE_03:
		dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_05:
		dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
TEXT_005:
		dc.b 'OK',0
TEXT_006:
		dc.b 'TEXT',0
TEXT_009:
		dc.b 'Abbruch',0
TEXT_04:
		dc.b 'Position:',0
TEXT_05:
		dc.b 'Sonstiges',0
TEXT_06:
		dc.b 'BubbleGEM-Text',0
TEXT_07:
		dc.b 'Context-Popup',0
TEXT_12:
		dc.b 'Grîûe:',0
TEXT_13:
		dc.b 'Modus:',0
help_title:
		dc.b 'Der Title-Editor',0
title:
		dc.b 'TITLE -',0
		dc.b $00
A_3DBUTTON03:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_005
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_01
		dc.w $0000
		dc.w $0000
A_3DBUTTON04:
		dc.l A_3Dbutton
		dc.w $29f1
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
A_3DBUTTON05:
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
A_3DBUTTON06:
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
A_BOXED02:
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
A_BOXED03:
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
		dc.l BUBBLE_05
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
A_TITLE01:
		dc.l A_title
		dc.w $0000
		dc.w $0000
		dc.l Auo_string
		dc.l TEXT_006
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl ED_TITLE
ED_TITLE:
		dc.w $ffff
		dc.w $0001
		dc.w $0019
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON05
		dc.w $0000
		dc.w $0000
		dc.w $002c
		dc.w $000d
_01_ED_TITLE:
		dc.w $0003
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON04
		dc.w $0000
		dc.w $0000
		dc.w $000c
		dc.w $0003
_02_ED_TITLE:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_TITLE01
		dc.w $0001
		dc.w $0001
		dc.w $000a
		dc.w $0001
_03_ED_TITLE:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0000
		dc.l A_3DBUTTON03
		dc.w $0010
		dc.w $0001
		dc.w $000c
		dc.w $0002
_03aED_TITLE:
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
_05_ED_TITLE:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0000
		dc.l A_3DBUTTON06
		dc.w $001f
		dc.w $0001
		dc.w $000c
		dc.w $0002
_05aED_TITLE:
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
_07_ED_TITLE:
		dc.w $0009
		dc.w $0008
		dc.w $0008
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_04
		dc.w $0002
		dc.w $0004
		dc.w $0009
		dc.w $0001
_08_ED_TITLE:
		dc.w $0007
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
_09_ED_TITLE:
		dc.w $000b
		dc.w $000a
		dc.w $000a
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_12
		dc.w $001c
		dc.w $0004
		dc.w $0006
		dc.w $0001
_10_ED_TITLE:
		dc.w $0009
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
_11_ED_TITLE:
		dc.w $000e
		dc.w $000d
		dc.w $000d
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0023
		dc.w $0004
		dc.w $0008
		dc.w $0001
_11aED_TITLE:
		dc.l edti_size
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
_13_ED_TITLE:
		dc.w $000b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON04
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0001
_14_ED_TITLE:
		dc.w $000f
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED02
		dc.w $0002
		dc.w $0006
		dc.w $0018
		dc.w $0001
_15_ED_TITLE:
		dc.w $0010
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_13
		dc.w $001c
		dc.w $0006
		dc.w $0006
		dc.w $0001
_16_ED_TITLE:
		dc.w $0012
		dc.w $ffff
		dc.w $ffff
		dc.w $001b
		dc.w $0005
		dc.w $0000
		dc.w $43ff
		dc.w $1121
		dc.w $0023
		dc.w $0006
		dc.w $0003
		dc.w $0001
_16aED_TITLE:
		dc.l edti_trans
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
_18_ED_TITLE:
		dc.w $0014
		dc.w $ffff
		dc.w $ffff
		dc.w $001b
		dc.w $0005
		dc.w $0000
		dc.w $43ff
		dc.w $11a1
		dc.w $0027
		dc.w $0006
		dc.w $0003
		dc.w $0001
_18aED_TITLE:
		dc.l edti_replace
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
_20_ED_TITLE:
		dc.w $0019
		dc.w $0015
		dc.w $0018
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME03
		dc.w $0001
		dc.w $0008
		dc.w $002a
		dc.w $0005
_21_ED_TITLE:
		dc.w $0016
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_06
		dc.w $0001
		dc.w $0001
		dc.w $000e
		dc.w $0001
_22_ED_TITLE:
		dc.w $0017
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_07
		dc.w $0001
		dc.w $0003
		dc.w $000d
		dc.w $0001
_23_ED_TITLE:
		dc.w $0018
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED03
		dc.w $0010
		dc.w $0001
		dc.w $0019
		dc.w $0001
_24_ED_TITLE:
		dc.w $0014
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED04
		dc.w $0010
		dc.w $0003
		dc.w $0019
		dc.w $0001
_25_ED_TITLE:
		dc.w $0000
		dc.w $001b
		dc.w $001b
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0010
		dc.w $0004
		dc.w $000a
		dc.w $0001
_25aED_TITLE:
		dc.l edti_pos
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8850
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_27_ED_TITLE:
		dc.w $0019
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0020
		dc.w $0000
		dc.l A_3DBUTTON27
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0001
utitle:
		dc.l A_title
		dc.w $0000
		dc.w $0000
		dc.l Auo_string
		dc.l xc495e
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
		dc.w $0000
		dc.w $0000
		dc.l utitle
		dc.w $0000
		dc.w $0000
		dc.w $0007
		dc.w $0001
logical:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l utitle
		dc.w $0000
		dc.w $0000
		dc.w $0007
		dc.w $0001
aud:
		dc.l xc4964
		dc.l xc4969
		dc.w $0002
		dc.l xc495e
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
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
		dc.b 'A_title',0
		dc.w $0000
		dc.w $0000
		dc.w $0000
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
		dc.w $0000
		dc.w $0000
		dc.l title
		dc.l help_title
		dc.w $0000
		dc.w $0000
xc495e:
		dc.b 'TITEL'
xc4963: dc.b 0
xc4964:
		dc.b '0x0L',0
xc4969:
		dc.b 'Auo_string',0
xc4974:
		dc.b '0x%lxL',0
		.even


	.bss

parm: ds.b 32
