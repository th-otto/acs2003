		.text

do3d:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a3
		addq.w     #4,a3
		clr.l      (a3)
		moveq.l    #1,d0
		movea.l    (a2),a0
		move.w     608(a0),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    604(a0),a1
		and.w      10(a1,d1.l),d0
		beq.s      do3d_1
		ori.l      #$00000001,(a3)
do3d_1:
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

	.globl init_check
init_check:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		lea.l      data,a1
		move.w     #$2329,d0
		movea.l    4(a2),a3
		jsr        (a3)
		lea.l      raddata,a1
		move.w     #$2329,d0
		movea.l    a2,a0
		movea.l    4(a2),a3
		jsr        (a3)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

minsize:
		movem.l    d3/a2-a3,-(a7)
		movea.l    a1,a3
		movea.l    12(a0),a2
		move.l     a2,d0
		beq.s      minsize_1
		move.b     (a2),d1
		beq.s      minsize_1
		movea.l    a2,a0
		jsr        strlen
		move.l     d0,d3
		addq.w     #3,d3
		movea.l    ACSblk,a0
		muls.w     18(a0),d3
		bra.s      minsize_2
minsize_1:
		movea.l    ACSblk,a0
		move.w     20(a0),d3
minsize_2:
		move.w     d3,(a3)
		movea.l    ACSblk,a0
		movea.l    16(a7),a1
		move.w     20(a0),(a1)
		movem.l    (a7)+,d3/a2-a3
		rts

object_tree:
		movem.l    a2-a6,-(a7)
		subq.w     #4,a7
		movea.l    a0,a5
		movea.l    a1,a4
		lea.l      ED_CHECKBOX,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      object_tree_1
		suba.l     a0,a0
		bra        object_tree_2
object_tree_1:
		moveq.l    #8,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #13,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #15,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		lea.l      48(a2),a3
		moveq.l    #22,d0
		and.w      8(a4),d0
		or.w       d0,8(a3)
		moveq.l    #63,d0
		and.w      10(a4),d0
		or.w       d0,10(a3)
		movea.l    12(a3),a4
		pea.l      (a7)
		lea.l      xc346c,a1
		movea.l    (a5),a0
		jsr        sscanf
		addq.w     #4,a7
		move.l     (a7),4(a4)
		cmpi.w     #$0002,8(a5)
		bne.s      object_tree_3
		movea.l    10(a5),a1
		moveq.l    #8,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_4
object_tree_3:
		lea.l      xc3455,a1
		moveq.l    #4,d0
		movea.l    a3,a0
		movea.l    8(a4),a6
		jsr        (a6)
		lea.l      xc3455,a1
		moveq.l    #8,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_4:
		moveq.l    #1,d0
		and.l      (a7),d0
		beq.s      object_tree_5
		ori.w      #$0001,226(a2)
		bra.s      object_tree_6
object_tree_5:
		andi.w     #$FFFE,226(a2)
object_tree_6:
		movea.l    324(a2),a0
		move.l     12(a0),24(a4)
		movea.l    38(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_7
		lea.l      xc3455,a1
		moveq.l    #13,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_8
object_tree_7:
		movea.l    38(a5),a1
		moveq.l    #13,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_8:
		movea.l    372(a2),a0
		move.l     12(a0),28(a4)
		movea.l    42(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_9
		lea.l      xc3455,a1
		moveq.l    #15,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_10
object_tree_9:
		movea.l    42(a5),a1
		moveq.l    #15,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_10:
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
		move.l     #A_checkbox,(a1)
		pea.l      4(a2)
		lea.l      xc346c,a1
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
		clr.l      24(a2)
		clr.l      28(a2)
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
		movem.l    d3/a2-a5,-(a7)
		lea.l      -50(a7),a7
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a3
		movea.l    60(a3),a5
		lea.l      parm,a4
		move.l     4(a5),-(a7)
		lea.l      xc346c,a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #4,a7
		lea.l      4(a7),a5
		move.l     a4,(a5)
		move.l     #xc3461,4(a5)
		lea.l      (a7),a1
		moveq.l    #3,d0
		lea.l      192(a3),a0
		jsr        Auo_boxed
		movea.l    (a7),a0
		move.b     (a0),d0
		beq.s      ok_1
		jsr        strlen
		addq.l     #3,d0
		movea.l    (a2),a0
		move.w     18(a0),d1
		ext.l      d1
		jsr        _ulmul
		move.l     d0,d3
		move.w     #$0002,8(a5)
		move.l     (a7),10(a5)
		bra.s      ok_2
ok_1:
		movea.l    (a2),a0
		move.w     20(a0),d3
		clr.w      8(a5)
		clr.l      10(a5)
ok_2:
		clr.l      14(a5)
		clr.w      d0
		move.w     d0,28(a5)
		move.w     d0,18(a5)
		moveq.l    #0,d1
		move.l     d1,30(a5)
		move.l     d1,20(a5)
		moveq.l    #0,d0
		move.l     d0,34(a5)
		move.l     d0,24(a5)
		lea.l      38(a5),a1
		lea.l      312(a3),a0
		moveq.l    #3,d0
		jsr        Auo_boxed
		movea.l    38(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_3
		clr.l      38(a5)
ok_3:
		lea.l      42(a5),a1
		moveq.l    #3,d0
		lea.l      360(a3),a0
		jsr        Auo_boxed
		movea.l    42(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_4
		clr.l      42(a5)
ok_4:
		movea.l    (a2),a0
		move.w     20(a0),d1
		move.w     d3,d0
		movea.l    a5,a0
		movea.l    data+64,a1
		movea.l    4(a1),a1
		jsr        (a1)
		bsr        abort
		lea.l      50(a7),a7
		movem.l    (a7)+,d3/a2-a5
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
BUBBLE_05:
		dc.b 'Hier wird die Beschriftung der Checkbox eingegeben.',0
BUBBLE_06:
		dc.b 'Durch diese Checkbox kann die 3D-Darstellung ein- und ausgeschaltet werden. Das Ergebnis wird direkt an der Beispiel-Checkbox oben links dargestellt.',0
TEXT_005:
		dc.b $4f
		dc.w $4b00
TEXT_009:
		dc.b 'Abbruch',0
TEXT_02:
		dc.b 'Text:',0
TEXT_05:
		dc.b 'Sonstiges',0
TEXT_06:
		dc.b 'Text',0
TEXT_08:
		dc.b '3D-Darstellung (sonst flach)',0
TEXT_09:
		dc.b 'BubbleGEM-Text',0
TEXT_16:
		dc.b 'Context-Popup',0
help_title:
		dc.b 'Der Checkbox-/Radiobutton-Editor',0
title:
		dc.b 'CHECKBUTTON -',0
A_3DBUTTON02:
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
A_3DBUTTON04:
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
		dc.l BUBBLE_05
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
		dc.l TEXT_08
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_06
		dc.w $0000
		dc.w $0000
A_CHECKBOX03:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
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
A_INNERFRAME02:
		dc.l A_innerframe
		dc.w $1000
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
	.globl ED_CHECKBOX
ED_CHECKBOX:
		dc.w $ffff
		dc.w $0001
		dc.w $000b
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON05
		dc.w $0000
		dc.w $0000
		dc.w $0028
		dc.w $000c
_01_ED_CHECKBOX:
		dc.w $0003
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON02
		dc.w $0000
		dc.w $0000
		dc.w $0009
		dc.w $0003
_02_ED_CHECKBOX:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_CHECKBOX03
		dc.w $0001
		dc.w $0001
		dc.w $0007
		dc.w $0001
_03_ED_CHECKBOX:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0000
		dc.l A_3DBUTTON04
		dc.w $000d
		dc.w $0001
		dc.w $000c
		dc.w $0002
_03aED_CHECKBOX:
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
_05_ED_CHECKBOX:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0000
		dc.l A_3DBUTTON06
		dc.w $001b
		dc.w $0001
		dc.w $000c
		dc.w $0002
_05aED_CHECKBOX:
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
_07_ED_CHECKBOX:
		dc.w $0009
		dc.w $0008
		dc.w $0008
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME02
		dc.w $0001
		dc.w $0003
		dc.w $0026
		dc.w $0003
_08_ED_CHECKBOX:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED02
		dc.w $0001
		dc.w $0001
		dc.w $0024
		dc.w $0001
_09_ED_CHECKBOX:
		dc.w $000b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0001
		dc.l A_CHECKBOX01
		dc.w $0002
		dc.w $0006
		dc.w $001f
		dc.w $0001
_09aED_CHECKBOX:
		dc.l do3d
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
_11_ED_CHECKBOX:
		dc.w $0000
		dc.w $000c
		dc.w $000f
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME03
		dc.w $0001
		dc.w $0007
		dc.w $0026
		dc.w $0005
_12_ED_CHECKBOX:
		dc.w $000d
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_09
		dc.w $0001
		dc.w $0001
		dc.w $000e
		dc.w $0001
_13_ED_CHECKBOX:
		dc.w $000e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED04
		dc.w $0010
		dc.w $0001
		dc.w $0015
		dc.w $0001
_14_ED_CHECKBOX:
		dc.w $000f
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
_15_ED_CHECKBOX:
		dc.w $000b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0028
		dc.w $0010
		dc.l A_BOXED05
		dc.w $0010
		dc.w $0003
		dc.w $0015
		dc.w $0001
aucheck:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l xc3450
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
auradio:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l xc3456
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
		dc.w $0010
		dc.l aucheck
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0001
logical:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l aucheck
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0001
radvisual:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $2011
		dc.w $0010
		dc.l auradio
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0001
radlogical:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0011
		dc.w $0000
		dc.l auradio
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0001
aud:
		dc.l xc345c
		dc.l xc3461
		dc.w $0002
		dc.l xc3450
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
radaud:
		dc.l xc345c
		dc.l xc3461
		dc.w $0002
		dc.l xc3456
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
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
		dc.b 'A_checkbox',0
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
raddata:
		dc.b 'A_checkbox',0
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
		dc.l object_tree
		dc.l test_it
		dc.l ok
		dc.l Aob_delete
		dc.l radvisual
		dc.l radlogical
		dc.l radaud
		dc.l minsize
		dc.w $0000
		dc.w $0000
		dc.l title
		dc.l help_title
		dc.w $0000
		dc.w $0000
xc3450:
		dc.b 'Check'
xc3455: dc.b 0
xc3456:
		dc.b 'Radio',0
xc345c:
		dc.b '0x1L',0
xc3461:
		dc.b 'Auo_string',0
xc346c:
		dc.b '0x%lxL',0
		.even


	.bss

parm: ds.b 32
