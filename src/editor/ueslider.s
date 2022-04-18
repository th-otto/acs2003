		.text

	.globl init_slider
init_slider:
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
		movea.l    12(a7),a3
		lea.l      ACSblk,a2
		moveq.l    #1,d0
		and.l      4(a0),d0
		beq.s      minsize_1
		movea.l    (a2),a0
		move.w     18(a0),d1
		add.w      d1,d1
		move.w     d1,(a1)
		movea.l    (a2),a0
		move.w     20(a0),d0
		lsl.w      #2,d0
		move.w     d0,(a3)
		bra.s      minsize_2
minsize_1:
		movea.l    (a2),a0
		move.w     18(a0),d1
		move.w     d1,d0
		lsl.w      #3,d0
		sub.w      d1,d0
		move.w     d0,(a1)
		movea.l    (a2),a0
		move.w     20(a0),(a3)
minsize_2:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

object_tree:
		movem.l    a2-a6,-(a7)
		subq.w     #4,a7
		movea.l    a0,a3
		movea.l    a1,a5
		lea.l      ED_SLIDER,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        object_tree_1
		jsr        Aob_fix
		moveq.l    #2,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #14,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #16,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		lea.l      48(a2),a4
		moveq.l    #22,d0
		and.w      8(a5),d0
		or.w       d0,8(a4)
		moveq.l    #63,d0
		and.w      10(a5),d0
		or.w       d0,10(a4)
		movea.l    12(a4),a5
		pea.l      (a7)
		lea.l      xbd774,a1
		movea.l    (a3),a0
		jsr        sscanf
		addq.w     #4,a7
		move.l     (a7),4(a5)
		moveq.l    #1,d0
		and.l      (a7),d0
		beq.s      object_tree_2
		lea.l      432(a2),a6
		movea.l    ACSblk,a0
		move.w     18(a0),d1
		add.w      d1,d1
		move.w     d1,20(a4)
		move.w     22(a6),22(a4)
		bra.s      object_tree_3
object_tree_2:
		lea.l      480(a2),a6
		move.w     20(a6),20(a4)
		movea.l    ACSblk,a0
		move.w     20(a0),22(a4)
object_tree_3:
		moveq.l    #2,d0
		and.l      (a7),d0
		beq.s      object_tree_4
		ori.w      #$0001,226(a2)
		bra.s      object_tree_5
object_tree_4:
		andi.w     #$FFFE,226(a2)
object_tree_5:
		moveq.l    #4,d0
		and.l      (a7),d0
		beq.s      object_tree_6
		andi.w     #$FFFE,274(a2)
		bra.s      object_tree_7
object_tree_6:
		ori.w      #$0001,274(a2)
object_tree_7:
		movea.l    348(a2),a0
		move.l     12(a0),24(a5)
		movea.l    38(a3),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_8
		lea.l      xbd768,a1
		moveq.l    #14,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_9
object_tree_8:
		movea.l    38(a3),a1
		moveq.l    #14,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_9:
		movea.l    396(a2),a0
		move.l     12(a0),28(a5)
		movea.l    42(a3),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_10
		lea.l      xbd768,a1
		moveq.l    #16,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_1
object_tree_10:
		movea.l    42(a3),a1
		moveq.l    #16,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_1:
		movea.l    a2,a0
		addq.w     #4,a7
		movem.l    (a7)+,a2-a6
		rts

test_it:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     #A_slider,(a1)
		pea.l      4(a2)
		lea.l      xbd774,a1
		movea.l    (a0),a0
		jsr        sscanf
		addq.w     #4,a7
		move.l     #Auo_slider,8(a2)
		moveq.l    #0,d0
		move.l     d0,20(a2)
		move.l     d0,16(a2)
		move.l     d0,12(a2)
		movea.l    38(a3),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      test_it_1
		suba.l     a0,a0
		bra.s      test_it_2
test_it_1:
		movea.l    38(a3),a0
test_it_2:
		move.l     a0,24(a2)
		movea.l    42(a3),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      test_it_3
		suba.l     a0,a0
		bra.s      test_it_4
test_it_3:
		movea.l    42(a3),a0
test_it_4:
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
		movem.l    a2-a4,-(a7)
		lea.l      -50(a7),a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    20(a1),a2
		movea.l    60(a2),a4
		pea.l      (a7)
		lea.l      6(a7),a1
		movea.l    a4,a0
		bsr        minsize
		addq.w     #4,a7
		lea.l      parm,a3
		move.l     4(a4),-(a7)
		lea.l      xbd774,a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #4,a7
		lea.l      4(a7),a4
		move.l     a3,(a4)
		move.l     #xbd769,4(a4)
		clr.w      d0
		move.w     d0,28(a4)
		move.w     d0,18(a4)
		move.w     d0,8(a4)
		moveq.l    #0,d1
		move.l     d1,30(a4)
		move.l     d1,20(a4)
		move.l     d1,10(a4)
		moveq.l    #0,d0
		move.l     d0,34(a4)
		move.l     d0,24(a4)
		move.l     d0,14(a4)
		clr.l      38(a4)
		clr.l      42(a4)
		lea.l      38(a4),a1
		moveq.l    #3,d0
		lea.l      336(a2),a0
		jsr        Auo_boxed
		movea.l    38(a4),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_1
		clr.l      38(a4)
ok_1:
		lea.l      42(a4),a1
		moveq.l    #3,d0
		lea.l      384(a2),a0
		jsr        Auo_boxed
		movea.l    42(a4),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_2
		clr.l      42(a4)
ok_2:
		move.w     (a7),d1
		move.w     2(a7),d0
		movea.l    a4,a0
		movea.l    data+64,a1
		movea.l    4(a1),a1
		jsr        (a1)
		bsr        abort
		lea.l      50(a7),a7
		movem.l    (a7)+,a2-a4
		rts

horizontal:
		move.l     a2,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    604(a0),a0
		lea.l      48(a0),a0
		movea.l    12(a0),a1
		moveq.l    #1,d0
		and.l      4(a1),d0
		beq.s      horizontal_1
		andi.l     #$FFFFFFFE,4(a1)
		movea.l    (a2),a1
		movea.l    604(a1),a1
		lea.l      480(a1),a1
		move.w     20(a1),20(a0)
		movea.l    (a2),a1
		move.w     20(a1),22(a0)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a2),a0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
horizontal_1:
		movea.l    (a7)+,a2
		rts

vertical:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    604(a0),a0
		lea.l      48(a0),a0
		movea.l    (a2),a1
		movea.l    604(a1),a1
		lea.l      432(a1),a1
		movea.l    12(a0),a3
		moveq.l    #1,d0
		and.l      4(a3),d0
		bne.s      vertical_1
		ori.l      #$00000001,4(a3)
		movea.l    (a2),a3
		move.w     18(a3),d0
		add.w      d0,d0
		move.w     d0,20(a0)
		move.w     22(a1),22(a0)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a2),a0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a3
		movea.l    102(a3),a1
		jsr        (a1)
vertical_1:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

edsl_3d:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		eori.l     #$00000002,4(a0)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		rts

edsl_slider:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		eori.l     #$00000004,4(a0)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		rts

	.data

BUBBLE_01:
		dc.b 'Die énderungen werden Åbernommen und Åberschreiben die alten Einstellungen.',0
BUBBLE_02:
		dc.b 'Die énderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
BUBBLE_03:
		dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_04:
		dc.b 'Hiermit wird der 3D-Modus fÅr den Slider ein- und ausgeschaltet',0
BUBBLE_05:
		dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
BUBBLE_06:
		dc.b 'Hier wird angegeben, ob der Schieber in der Mitte vorhanden sein soll oder nicht.',0
BUBBLE_07:
		dc.b 'Der Slider wird als horizontaler Slider verwendet.',0
BUBBLE_08:
		dc.b 'Der Slider wird als vertikaler Slider verwendet.',0
TEXT_005:
		dc.b $4f
		dc.w $4b00
TEXT_009:
		dc.b 'Abbruch',0
TEXT_01:
		dc.b '3D-Modus',0
TEXT_02:
		dc.b 'Orientierung',0
TEXT_04:
		dc.b 'Slider',0
TEXT_05:
		dc.b 'Sonstiges',0
TEXT_06:
		dc.b 'BubbleGEM-Text',0
TEXT_07:
		dc.b 'Context-Popup',0
help_title:
		dc.b 'Der Slider-Editor',0
title:
		dc.b 'SLIDER -',0
		dc.b $00
A_3DBUTTON01:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $01f8
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
A_3DBUTTON02:
		dc.l A_3Dbutton
		dc.w $21f1
		dc.w $01f8
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
		dc.l BUBBLE_04
		dc.w $0000
		dc.w $0000
A_CHECKBOX03:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_04
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_06
		dc.w $0000
		dc.w $0000
A_INNERFRAME02:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
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
A_SLIDER01:
		dc.l A_slider
		dc.w $0000
		dc.w $0002
		dc.l Auo_slider
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_07
		dc.w $0000
		dc.w $0000
A_SLIDER02:
		dc.l A_slider
		dc.w $0000
		dc.w $0003
		dc.l Auo_slider
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_08
		dc.w $0000
		dc.w $0000
ED_SLIDER:
		dc.w $ffff
		dc.w $0001
		dc.w $0011
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON02
		dc.w $0000
		dc.w $0000
		dc.w $0029
		dc.w $000d
_01_ED_SLIDER:
		dc.w $0004
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0000
		dc.w $0010
		dc.l A_3DBUTTON01
		dc.w $0000
		dc.w $0000
		dc.w $000c
		dc.w $0006
_02_ED_SLIDER:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_SLIDER01
		dc.w $0001
		dc.w $0001
		dc.w $000a
		dc.w $0001
_02aED_SLIDER:
		dc.l Aus_slider
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
_04_ED_SLIDER:
		dc.w $0006
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON06
		dc.w $001d
		dc.w $0001
		dc.w $000a
		dc.w $0002
_04aED_SLIDER:
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
_06_ED_SLIDER:
		dc.w $0008
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON03
		dc.w $0012
		dc.w $0001
		dc.w $000a
		dc.w $0002
_06aED_SLIDER:
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
_08_ED_SLIDER:
		dc.w $0011
		dc.w $0009
		dc.w $0010
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME03
		dc.w $0010
		dc.w $0004
		dc.w $0018
		dc.w $0009
_09_ED_SLIDER:
		dc.w $000b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_CHECKBOX01
		dc.w $0001
		dc.w $0001
		dc.w $000b
		dc.w $0001
_09aED_SLIDER:
		dc.l edsl_3d
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
_11_ED_SLIDER:
		dc.w $000d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_CHECKBOX03
		dc.w $000e
		dc.w $0001
		dc.w $0009
		dc.w $0001
_11aED_SLIDER:
		dc.l edsl_slider
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8853
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_13_ED_SLIDER:
		dc.w $000e
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_06
		dc.w $0001
		dc.w $0003
		dc.w $000e
		dc.w $0001
_14_ED_SLIDER:
		dc.w $000f
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED03
		dc.w $0001
		dc.w $0004
		dc.w $0016
		dc.w $0001
_15_ED_SLIDER:
		dc.w $0010
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_07
		dc.w $0001
		dc.w $0006
		dc.w $000d
		dc.w $0001
_16_ED_SLIDER:
		dc.w $0008
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED04
		dc.w $0001
		dc.w $0007
		dc.w $0016
		dc.w $0001
_17_ED_SLIDER:
		dc.w $0000
		dc.w $0012
		dc.w $0014
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME02
		dc.w $0001
		dc.w $0007
		dc.w $000f
		dc.w $0006
_18_ED_SLIDER:
		dc.w $0014
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0020
		dc.l A_SLIDER02
		dc.w $0001
		dc.w $0001
		dc.w $0002
		dc.w $0004
_18aED_SLIDER:
		dc.l vertical
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
_20_ED_SLIDER:
		dc.w $0011
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0020
		dc.l A_SLIDER01
		dc.w $0004
		dc.w $0001
		dc.w $000a
		dc.w $0001
_20aED_SLIDER:
		dc.l horizontal
		dc.w $0000
		dc.w $0000
		dc.w $8020
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
slider:
		dc.l A_slider
		dc.w $0000
		dc.w $0002
		dc.l Auo_slider
		dc.w $0000
		dc.w $0000
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
		dc.w $2001
		dc.w $0000
		dc.l slider
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
		dc.l slider
		dc.w $0000
		dc.w $0000
		dc.w $0007
		dc.w $0001
aud:
		dc.l xbd764
		dc.l xbd769
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
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
		dc.b 'A_slider',0
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
xbd764:
		dc.b '0x2L'
xbd768: dc.b 0
xbd769:
		dc.b 'Auo_slider',0
xbd774:
		dc.b '0x%lxL',0
		.even


	.bss

parm: ds.b 32
