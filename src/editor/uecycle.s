		.text

init_cycle:
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
		movea.l    ACSblk,a0
		move.w     18(a0),d1
		move.w     d1,d0
		add.w      d0,d0
		add.w      d1,d0
		add.w      d0,d0
		move.w     d0,(a1)
		movea.l    ACSblk,a0
		movea.l    4(a7),a1
		move.w     20(a0),(a1)
		rts

object_tree:
		movem.l    d3/a2-a5,-(a7)
		lea.l      -10(a7),a7
		movea.l    a0,a5
		movea.l    a1,a3
		lea.l      xbf564,a0
		lea.l      4(a7),a1
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		lea.l      ED_CYCLE,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      object_tree_1
		suba.l     a0,a0
		bra        object_tree_2
object_tree_1:
		lea.l      48(a2),a0
		moveq.l    #22,d0
		and.w      8(a3),d0
		or.w       d0,8(a0)
		moveq.l    #63,d0
		and.w      10(a3),d0
		or.w       d0,10(a0)
		movea.l    12(a0),a3
		lea.l      ACSblk,a4
		moveq.l    #27,d0
		movea.l    a2,a1
		movea.l    (a4),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #8,d0
		movea.l    a2,a1
		movea.l    (a4),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #32,d0
		movea.l    a2,a1
		movea.l    (a4),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #34,d0
		movea.l    a2,a1
		movea.l    (a4),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		pea.l      (a7)
		lea.l      xbf587,a1
		movea.l    (a5),a0
		jsr        sscanf
		addq.w     #4,a7
		cmpi.l     #$00010000,(a7)
		bne.s      object_tree_3
		lea.l      A_ADAPTCYC,a0
		moveq.l    #1,d0
		jsr        Awi_alert
		subq.w     #1,d0
		bne.s      object_tree_3
		move.l     #$00010290,(a7)
object_tree_3:
		move.l     (a7),4(a3)
		cmpi.w     #$0002,8(a5)
		bne.s      object_tree_4
		move.l     10(a5),6(a7)
		bra.s      object_tree_5
object_tree_4:
		move.l     #xbf573,6(a7)
object_tree_5:
		movea.l    6(a7),a1
		move.w     #$0190,d0
		lea.l      48(a2),a0
		jsr        Auo_cycle
		move.l     (a7),d3
		asr.l      #4,d3
		and.w      #$000F,d3
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      colour_text,a0
		movea.l    0(a0,d0.l),a1
		movea.l    a2,a0
		moveq.l    #25,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #$FFF0,590(a2)
		and.w      #$000F,d0
		or.w       d0,590(a2)
		moveq.l    #15,d3
		and.w      2(a7),d3
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      colour_text,a0
		movea.l    0(a0,d0.l),a1
		movea.l    a2,a0
		moveq.l    #18,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #$FFF0,422(a2)
		and.w      #$000F,d0
		or.w       d0,422(a2)
		move.l     (a7),d0
		asr.l      #8,d0
		move.b     d0,4(a7)
		lea.l      4(a7),a1
		movea.l    a2,a0
		moveq.l    #27,d0
		jsr        Aob_puttext
		movea.l    6(a7),a1
		moveq.l    #8,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		move.l     (a7),d0
		and.l      #$00010000,d0
		beq.s      object_tree_6
		ori.w      #$0001,226(a2)
object_tree_6:
		movea.l    780(a2),a0
		move.l     12(a0),24(a3)
		movea.l    38(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_7
		lea.l      xbf573,a1
		moveq.l    #32,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_8
object_tree_7:
		movea.l    38(a5),a1
		moveq.l    #32,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_8:
		movea.l    828(a2),a0
		move.l     12(a0),28(a3)
		movea.l    42(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      object_tree_9
		lea.l      xbf573,a1
		moveq.l    #34,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      object_tree_10
object_tree_9:
		movea.l    42(a5),a1
		moveq.l    #34,d0
		movea.l    a2,a0
		jsr        Aob_puttext
object_tree_10:
		movea.l    a2,a0
object_tree_2:
		lea.l      10(a7),a7
		movem.l    (a7)+,d3/a2-a5
		rts

test_it:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     #A_cycle,(a1)
		pea.l      4(a2)
		lea.l      xbf587,a1
		movea.l    (a0),a0
		jsr        sscanf
		addq.w     #4,a7
		move.l     #Auo_cycle,8(a2)
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
		movem.l    a2-a5,-(a7)
		lea.l      -50(a7),a7
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a3
		movea.l    20(a1),a0
		movea.l    60(a0),a5
		jsr        prepair
		lea.l      parm,a4
		move.l     4(a5),-(a7)
		lea.l      xbf587,a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #4,a7
		move.l     a4,(a7)
		move.l     #xbf57d,4(a7)
		lea.l      46(a7),a1
		moveq.l    #3,d0
		lea.l      192(a3),a0
		jsr        Auo_boxed
		movea.l    46(a7),a0
		move.b     (a0),d0
		beq.s      ok_1
		move.w     #$0002,8(a7)
		move.l     a0,10(a7)
		bra.s      ok_2
ok_1:
		clr.w      8(a7)
		clr.l      10(a7)
ok_2:
		clr.l      14(a7)
		clr.w      d0
		move.w     d0,28(a7)
		move.w     d0,18(a7)
		moveq.l    #0,d1
		move.l     d1,30(a7)
		move.l     d1,20(a7)
		moveq.l    #0,d0
		move.l     d0,34(a7)
		move.l     d0,24(a7)
		lea.l      38(a7),a1
		lea.l      768(a3),a0
		moveq.l    #3,d0
		jsr        Auo_boxed
		movea.l    38(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_3
		clr.l      38(a7)
ok_3:
		lea.l      42(a7),a1
		moveq.l    #3,d0
		lea.l      816(a3),a0
		jsr        Auo_boxed
		movea.l    42(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      ok_4
		clr.l      42(a7)
ok_4:
		movea.l    (a2),a0
		move.w     20(a0),d1
		move.w     18(a0),d2
		move.w     d2,d0
		add.w      d0,d0
		add.w      d2,d0
		add.w      d0,d0
		lea.l      (a7),a0
		movea.l    data+64,a1
		movea.l    4(a1),a1
		jsr        (a1)
		bsr        abort
		lea.l      50(a7),a7
		movem.l    (a7)+,a2-a5
		rts

edcyc_outcol:
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		addq.w     #4,a2
		moveq.l    #17,d0
		move.w     d0,-(a7)
		moveq.l    #18,d2
		moveq.l    #15,d1
		moveq.l    #15,d0
		and.w      2(a2),d0
		jsr        oe_colsel
		addq.w     #2,a7
		tst.w      d0
		bmi.s      edcyc_outcol_1
		moveq.l    #-16,d1
		and.l      (a2),d1
		move.w     d0,d2
		ext.l      d2
		or.l       d2,d1
		move.l     d1,(a2)
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		moveq.l    #-1,d1
		jsr        (a1)
edcyc_outcol_1:
		movea.l    (a7)+,a2
		rts

edcyc_incol:
		move.w     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		addq.w     #4,a2
		moveq.l    #24,d0
		move.w     d0,-(a7)
		moveq.l    #25,d2
		moveq.l    #22,d1
		move.l     (a2),d0
		asr.l      #4,d0
		and.w      #$000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      edcyc_incol_1
		move.l     (a2),d1
		and.l      #$FFFFFF0F,d1
		lsl.w      #4,d0
		ext.l      d0
		or.l       d0,d1
		move.l     d1,(a2)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		moveq.l    #1,d0
		moveq.l    #-1,d1
		jsr        (a1)
edcyc_incol_1:
		movea.l    (a7)+,a2
		move.w     (a7)+,d3
		rts

prepair:
		movem.l    a2-a4,-(a7)
		lea.l      -16(a7),a7
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a0
		movea.l    60(a0),a3
		lea.l      10(a7),a1
		moveq.l    #27,d0
		jsr        Aob_gettext
		move.l     4(a3),d0
		and.l      #$000000FF,d0
		move.b     10(a7),d1
		ext.w      d1
		ext.l      d1
		and.l      #$000000FF,d1
		lsl.l      #8,d1
		add.l      d1,d0
		move.l     d0,4(a3)
		moveq.l    #1,d1
		movea.l    (a2),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a0
		and.w      226(a0),d1
		beq.s      prepair_1
		ori.l      #$00010000,4(a3)
prepair_1:
		lea.l      12(a7),a1
		moveq.l    #3,d0
		movea.l    (a2),a0
		movea.l    600(a0),a0
		movea.l    20(a0),a0
		lea.l      192(a0),a0
		jsr        Auo_boxed
		movea.l    (a2),a0
		move.l     600(a0),(a7)
		movea.l    600(a0),a1
		movea.l    20(a1),a0
		lea.l      48(a0),a0
		move.l     a0,4(a7)
		move.w     #$0002,8(a7)
		lea.l      (a7),a1
		moveq.l    #9,d0
		movea.l    8(a3),a4
		jsr        (a4)
		movea.l    12(a7),a1
		move.w     #$0190,d0
		movea.l    (a2),a0
		movea.l    600(a0),a4
		movea.l    20(a4),a0
		lea.l      48(a0),a0
		movea.l    8(a3),a4
		jsr        (a4)
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    (a2),a0
		movea.l    600(a0),a4
		movea.l    20(a4),a0
		lea.l      48(a0),a0
		movea.l    8(a3),a4
		jsr        (a4)
		lea.l      16(a7),a7
		movem.l    (a7)+,a2-a4
		rts

	.data

A_ADAPTCYC:
		dc.b '[2][ Dies ist wahrscheinlich ein| Objekt nach alter Definition.| Soll es auf den Standardwert| gesetzt werden?][OK| Abbruch ]',0
BUBBLE_01:
		dc.b 'Die énderungen werden Åbernommen und Åberschreiben die alten Einstellungen.',0
BUBBLE_02:
		dc.b 'Die énderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
BUBBLE_03:
		dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_04:
		dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
BUBBLE_05:
		dc.b 'Hier wird das Zeichen eingegeben, das im Popup auf der rechten Seite beim Anklicken zum nÑchsten Wert blÑttert.',0
BUBBLE_06:
		dc.b 'Dieser Button stellt das Beispiel-Popup links oben um auf den gerade eingegebenen Text. Damit kînnen Sie Ihr Popup direkt ausprobieren.',0
BUBBLE_07:
		dc.b 'Durch diese Checkbox kann die 3D-Darstellung ein- und ausgeschaltet werden. Das Ergebnis wird nach Klick auf den Button "Probe" am Beispiel-Popup oben links dargestellt.',0
TEXT_001:
		dc.b 'Weiû|Rot|GrÅn|Blau|Gelb|TÅrkis|Lila|Schwarz',0
TEXT_005:
		dc.b $4f
		dc.w $4b00
TEXT_008:
		dc.b 'Probe',0
TEXT_009:
		dc.b 'Abbruch',0
TEXT_01:
		dc.b '3D-Modus',0
TEXT_02:
		dc.b 'Zyklus-Zeichen:',0
TEXT_05:
		dc.b 'Sonstiges',0
TEXT_08:
		dc.b 'BubbleGEM-Text',0
TEXT_09:
		dc.b 'unten:',0
TEXT_10:
		dc.b 'Rahmen:',0
TEXT_16:
		dc.b 'Context-Popup',0
TEXT_19:
		dc.b 'oben:',0
TEXT_21:
		dc.b 'links/',0
TEXT_22:
		dc.b 'rechts/',0
help_title:
		dc.b 'Der Cycle-Button-Editor',0
title:
		dc.b 'CYCLEBUTTON -',0
A_3DBUTTON01:
		dc.l A_3Dbutton
		dc.w $a9f1
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
A_3DBUTTON07:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_008
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_06
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
A_BOXED01:
		dc.l A_boxed
		dc.w $9000
		dc.w $0112
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
		dc.l BUBBLE_07
		dc.w $0000
		dc.w $0000
A_INNERFRAME01:
		dc.l A_innerframe
		dc.w $1000
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
A_cycle002:
		dc.l A_cycle
		dc.w $0001
		dc.w $0290
		dc.l Auo_cycle
		dc.l TEXT_001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
ED_CYCLE:
		dc.w $ffff
		dc.w $0001
		dc.w $001e
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON02
		dc.w $0000
		dc.w $0000
		dc.w $0033
		dc.w $0013
_01_ED_CYCLE:
		dc.w $0004
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0000
		dc.w $0010
		dc.l A_3DBUTTON01
		dc.w $0000
		dc.w $0000
		dc.w $0016
		dc.w $0003
_02_ED_CYCLE:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_cycle002
		dc.w $0001
		dc.w $0001
		dc.w $0014
		dc.w $0001
_02aED_CYCLE:
		dc.l Aus_cycle
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
_04_ED_CYCLE:
		dc.w $0006
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON03
		dc.w $0018
		dc.w $0001
		dc.w $000c
		dc.w $0002
_04aED_CYCLE:
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
_06_ED_CYCLE:
		dc.w $0008
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON06
		dc.w $0026
		dc.w $0001
		dc.w $000c
		dc.w $0002
_06aED_CYCLE:
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
_08_ED_CYCLE:
		dc.w $0009
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED02
		dc.w $0001
		dc.w $0004
		dc.w $0031
		dc.w $0001
_09_ED_CYCLE:
		dc.w $000b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_CHECKBOX01
		dc.w $0001
		dc.w $0006
		dc.w $000b
		dc.w $0001
_09aED_CYCLE:
		dc.w $0000
		dc.w $0000
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
_11_ED_CYCLE:
		dc.w $001a
		dc.w $000c
		dc.w $0016
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME01
		dc.w $0016
		dc.w $0006
		dc.w $001c
		dc.w $0006
_12_ED_CYCLE:
		dc.w $000e
		dc.w $000d
		dc.w $000d
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_21
		dc.w $0002
		dc.w $0001
		dc.w $0006
		dc.w $0001
_13_ED_CYCLE:
		dc.w $000c
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
_14_ED_CYCLE:
		dc.w $000f
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
_15_ED_CYCLE:
		dc.w $0013
		dc.w $0011
		dc.w $0012
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0002
		dc.w $0012
		dc.w $0001
_15aED_CYCLE:
		dc.l edcyc_outcol
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
_17_ED_CYCLE:
		dc.w $0012
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
_18_ED_CYCLE:
		dc.w $000f
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
_19_ED_CYCLE:
		dc.w $0015
		dc.w $0014
		dc.w $0014
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_22
		dc.w $0001
		dc.w $0003
		dc.w $0007
		dc.w $0001
_20_ED_CYCLE:
		dc.w $0013
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
_21_ED_CYCLE:
		dc.w $0016
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
_22_ED_CYCLE:
		dc.w $000b
		dc.w $0018
		dc.w $0019
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0004
		dc.w $0012
		dc.w $0001
_22aED_CYCLE:
		dc.l edcyc_incol
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
_24_ED_CYCLE:
		dc.w $0019
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
_25_ED_CYCLE:
		dc.w $0016
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
_26_ED_CYCLE:
		dc.w $001b
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_02
		dc.w $0001
		dc.w $0807
		dc.w $000f
		dc.w $0001
_27_ED_CYCLE:
		dc.w $001c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED01
		dc.w $0011
		dc.w $0807
		dc.w $0001
		dc.w $0001
_28_ED_CYCLE:
		dc.w $001e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0010
		dc.l A_3DBUTTON07
		dc.w $0001
		dc.w $0009
		dc.w $000b
		dc.w $0002
_28aED_CYCLE:
		dc.l prepair
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
_30_ED_CYCLE:
		dc.w $0000
		dc.w $001f
		dc.w $0022
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME03
		dc.w $0001
		dc.w $000c
		dc.w $0031
		dc.w $0005
_31_ED_CYCLE:
		dc.w $0020
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
_32_ED_CYCLE:
		dc.w $0021
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED04
		dc.w $0010
		dc.w $0001
		dc.w $0020
		dc.w $0001
_33_ED_CYCLE:
		dc.w $0022
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
_34_ED_CYCLE:
		dc.w $001e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0028
		dc.w $0010
		dc.l A_BOXED05
		dc.w $0010
		dc.w $0003
		dc.w $0020
		dc.w $0001
cycle:
		dc.l A_cycle
		dc.w $0001
		dc.w $0290
		dc.l Auo_cycle
		dc.l xbf566
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
		dc.w $0030
		dc.l cycle
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0001
logical:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0030
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0006
		dc.w $0001
aud:
		dc.l xbf574
		dc.l xbf57d
		dc.w $0002
		dc.l xbf566
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
		dc.b 'A_cycle',0
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
xbf564:
		dc.w $2000
xbf566:
		dc.b 'Rot|GrÅn|Blau'
xbf573: dc.b 0
xbf574:
		dc.b '0x10290L',0
xbf57d:
		dc.b 'Auo_cycle',0
xbf587:
		dc.b '0x%lxL',0
		.even
