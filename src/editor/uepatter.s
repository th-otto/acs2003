		.text

edpa_col:
		move.w     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a2
		addq.w     #4,a2
		moveq.l    #13,d0
		move.w     d0,-(a7)
		moveq.l    #14,d2
		moveq.l    #11,d1
		moveq.l    #15,d0
		and.w      2(a2),d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      edpa_col_1
		moveq.l    #-16,d1
		and.l      (a2),d1
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
edpa_col_1:
		movea.l    (a7)+,a2
		move.w     (a7)+,d3
		rts

edpa_frame:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		movea.l    60(a1),a0
		eori.l     #$00200000,4(a0)
		moveq.l    #-1,d1
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		rts

edpa_pattern:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		movea.l    604(a0),a1
		movea.l    60(a1),a3
		addq.w     #4,a3
		move.w     608(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    12(a1,d0.l),a0
		move.l     #$00DF0000,d2
		and.l      4(a0),d2
		move.l     (a3),d0
		and.l      #$FF20FFFF,d0
		or.l       d0,d2
		move.l     d2,(a3)
		moveq.l    #-1,d1
		moveq.l    #2,d0
		movea.l    (a2),a0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a3
		movea.l    102(a3),a1
		jsr        (a1)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

init_pattern:
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
		move.w     18(a0),(a1)
		movea.l    ACSblk,a0
		movea.l    4(a7),a1
		move.w     20(a0),(a1)
		rts

object_tree:
		movem.l    a2-a3/a5,-(a7)
		subq.w     #4,a7
		movea.l    a0,a5
		movea.l    a1,a3
		lea.l      ED_PATTERN,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        object_tree_1
		lea.l      48(a2),a0
		moveq.l    #22,d1
		and.w      8(a3),d1
		or.w       d1,8(a0)
		moveq.l    #63,d1
		and.w      10(a3),d1
		or.w       d1,10(a0)
		movea.l    12(a0),a3
		pea.l      (a7)
		lea.l      xc1552,a1
		movea.l    (a5),a0
		jsr        sscanf
		addq.w     #4,a7
		move.l     (a7),4(a3)
		move.l     (a7),d0
		and.l      #$00200000,d0
		beq.s      object_tree_2
		ori.w      #$0001,178(a2)
object_tree_2:
		moveq.l    #15,d0
		and.w      2(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      colour_text,a0
		movea.l    0(a0,d0.l),a1
		movea.l    a2,a0
		moveq.l    #14,d0
		jsr        Aob_puttext
		moveq.l    #15,d0
		and.w      2(a7),d0
		andi.w     #$FFF0,326(a2)
		and.w      #$000F,d0
		or.w       d0,326(a2)
		moveq.l    #0,d0
		move.l     d0,28(a3)
		move.l     d0,24(a3)
object_tree_1:
		movea.l    a2,a0
		addq.w     #4,a7
		movem.l    (a7)+,a2-a3/a5
		rts

test_it:
		move.l     a2,-(a7)
		movea.l    a1,a2
		move.l     #A_pattern,(a1)
		pea.l      4(a2)
		lea.l      xc1552,a1
		movea.l    (a0),a0
		jsr        sscanf
		addq.w     #4,a7
		clr.l      8(a2)
		moveq.l    #0,d0
		move.l     d0,20(a2)
		move.l     d0,16(a2)
		move.l     d0,12(a2)
		clr.l      24(a2)
		clr.l      28(a2)
		movea.l    (a7)+,a2
		rts

abort:
		movea.l    data+64,a0
		movea.l    (a0),a0
		jsr        (a0)
		rts

ok:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      -46(a7),a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    20(a1),a0
		movea.l    60(a0),a3
		lea.l      parm,a2
		move.l     4(a3),-(a7)
		lea.l      xc1552,a1
		movea.l    a2,a0
		jsr        sprintf
		addq.w     #4,a7
		move.l     a2,(a7)
		move.l     #xc1551,4(a7)
		clr.w      d0
		move.w     d0,28(a7)
		move.w     d0,18(a7)
		move.w     d0,8(a7)
		moveq.l    #0,d1
		move.l     d1,30(a7)
		move.l     d1,20(a7)
		move.l     d1,10(a7)
		moveq.l    #0,d0
		move.l     d0,34(a7)
		move.l     d0,24(a7)
		move.l     d0,14(a7)
		clr.l      38(a7)
		clr.l      42(a7)
		movea.l    ACSblk,a0
		move.w     20(a0),d1
		move.w     18(a0),d0
		lea.l      (a7),a0
		movea.l    data+64,a1
		movea.l    4(a1),a1
		jsr        (a1)
		bsr        abort
		lea.l      46(a7),a7
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.data

BUBBLE_01:
		dc.b 'Die �nderungen werden �bernommen und �berschreiben die alten Einstellungen.',0
BUBBLE_02:
		dc.b 'Die �nderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
TEXT_005:
		dc.b $4f
		dc.w $4b00
TEXT_009:
		dc.b 'Abbruch',0
TEXT_02:
		dc.b 'Rahmen',0
TEXT_03:
		dc.b 'Muster:',0
TEXT_11:
		dc.b 'Farbe:',0
help_title:
		dc.b 'Der Pattern-Editor',0
title:
		dc.b 'PATTERN -',0
		dc.b $00
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
A_3DBUTTON06:
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
A_3DBUTTON07:
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
A_CHECKBOX02:
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
A_INNERFRAME02:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_03
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_pattern001:
		dc.l A_pattern
		dc.w $0050
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
USER_007:
		dc.l A_pattern
		dc.w $0021
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
USER_009:
		dc.l A_pattern
		dc.w $0023
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
USER_012:
		dc.l A_pattern
		dc.w $0022
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
USER_013:
		dc.l A_pattern
		dc.w $0024
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
USER_014:
		dc.l A_pattern
		dc.w $0025
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
USER_015:
		dc.l A_pattern
		dc.w $0026
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
USER_016:
		dc.l A_pattern
		dc.w $0027
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
USER_017:
		dc.l A_pattern
		dc.w $0028
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
USER_018:
		dc.l A_pattern
		dc.w $0029
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
USER_019:
		dc.l A_pattern
		dc.w $002a
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
USER_020:
		dc.l A_pattern
		dc.w $002b
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
USER_021:
		dc.l A_pattern
		dc.w $002c
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
USER_022:
		dc.l A_pattern
		dc.w $0061
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
USER_023:
		dc.l A_pattern
		dc.w $0062
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
USER_024:
		dc.l A_pattern
		dc.w $0063
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
USER_025:
		dc.l A_pattern
		dc.w $0064
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
USER_026:
		dc.l A_pattern
		dc.w $0065
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
USER_027:
		dc.l A_pattern
		dc.w $0066
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
USER_028:
		dc.l A_pattern
		dc.w $0067
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
USER_029:
		dc.l A_pattern
		dc.w $0068
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
USER_030:
		dc.l A_pattern
		dc.w $0069
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
USER_031:
		dc.l A_pattern
		dc.w $006b
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
USER_032:
		dc.l A_pattern
		dc.w $006a
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
USER_033:
		dc.l A_pattern
		dc.w $006c
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
USER_034:
		dc.l A_pattern
		dc.w $006d
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
USER_035:
		dc.l A_pattern
		dc.w $006e
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
USER_036:
		dc.l A_pattern
		dc.w $006f
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
USER_037:
		dc.l A_pattern
		dc.w $0070
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
USER_038:
		dc.l A_pattern
		dc.w $0071
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
USER_039:
		dc.l A_pattern
		dc.w $0072
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
USER_040:
		dc.l A_pattern
		dc.w $0073
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
USER_041:
		dc.l A_pattern
		dc.w $0074
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
USER_042:
		dc.l A_pattern
		dc.w $0075
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
USER_043:
		dc.l A_pattern
		dc.w $0076
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
USER_044:
		dc.l A_pattern
		dc.w $0077
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
USER_045:
		dc.l A_pattern
		dc.w $0078
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
USER_046:
		dc.l A_pattern
		dc.w $00a1
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
USER_047:
		dc.l A_pattern
		dc.w $00a2
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
USER_048:
		dc.l A_pattern
		dc.w $00a3
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
USER_049:
		dc.l A_pattern
		dc.w $00a4
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
USER_050:
		dc.l A_pattern
		dc.w $00a5
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
USER_051:
		dc.l A_pattern
		dc.w $00a6
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
ED_PATTERN:
		dc.w $ffff
		dc.w $0001
		dc.w $000f
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON06
		dc.w $0000
		dc.w $0000
		dc.w $002e
		dc.w $000a
_01_ED_PATTERN:
		dc.w $0003
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON07
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0003
_02_ED_PATTERN:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_pattern001
		dc.w $0001
		dc.w $0001
		dc.w $0008
		dc.w $0001
_03_ED_PATTERN:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON01
		dc.w $0013
		dc.w $0001
		dc.w $000c
		dc.w $0002
_03aED_PATTERN:
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
_05_ED_PATTERN:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON04
		dc.w $0021
		dc.w $0001
		dc.w $000c
		dc.w $0002
_05aED_PATTERN:
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
_07_ED_PATTERN:
		dc.w $0009
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_CHECKBOX02
		dc.w $0002
		dc.w $0004
		dc.w $0009
		dc.w $0001
_07aED_PATTERN:
		dc.l edpa_frame
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
_09_ED_PATTERN:
		dc.w $000b
		dc.w $000a
		dc.w $000a
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_11
		dc.w $0010
		dc.w $0004
		dc.w $0006
		dc.w $0001
_10_ED_PATTERN:
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
_11_ED_PATTERN:
		dc.w $000f
		dc.w $000d
		dc.w $000e
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0017
		dc.w $0004
		dc.w $0012
		dc.w $0001
_11aED_PATTERN:
		dc.l edpa_col
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
_13_ED_PATTERN:
		dc.w $000e
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
_14_ED_PATTERN:
		dc.w $000b
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
_15_ED_PATTERN:
		dc.w $0000
		dc.w $0010
		dc.w $0062
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME02
		dc.w $0001
		dc.w $0005
		dc.w $002c
		dc.w $0005
_16_ED_PATTERN:
		dc.w $0012
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_007
		dc.w $0001
		dc.w $0001
		dc.w $0003
		dc.w $0001
_16aED_PATTERN:
		dc.l edpa_pattern
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
_18_ED_PATTERN:
		dc.w $0014
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_012
		dc.w $0001
		dc.w $0002
		dc.w $0003
		dc.w $0001
_18aED_PATTERN:
		dc.l edpa_pattern
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
_20_ED_PATTERN:
		dc.w $0016
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_009
		dc.w $0001
		dc.w $0003
		dc.w $0003
		dc.w $0001
_20aED_PATTERN:
		dc.l edpa_pattern
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
_22_ED_PATTERN:
		dc.w $0018
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_013
		dc.w $0004
		dc.w $0001
		dc.w $0003
		dc.w $0001
_22aED_PATTERN:
		dc.l edpa_pattern
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
_24_ED_PATTERN:
		dc.w $001a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_014
		dc.w $0004
		dc.w $0002
		dc.w $0003
		dc.w $0001
_24aED_PATTERN:
		dc.l edpa_pattern
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
_26_ED_PATTERN:
		dc.w $001c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_015
		dc.w $0004
		dc.w $0003
		dc.w $0003
		dc.w $0001
_26aED_PATTERN:
		dc.l edpa_pattern
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
_28_ED_PATTERN:
		dc.w $001e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_019
		dc.w $000a
		dc.w $0001
		dc.w $0003
		dc.w $0001
_28aED_PATTERN:
		dc.l edpa_pattern
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
_30_ED_PATTERN:
		dc.w $0020
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_020
		dc.w $000a
		dc.w $0002
		dc.w $0003
		dc.w $0001
_30aED_PATTERN:
		dc.l edpa_pattern
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
_32_ED_PATTERN:
		dc.w $0022
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_021
		dc.w $000a
		dc.w $0003
		dc.w $0003
		dc.w $0001
_32aED_PATTERN:
		dc.l edpa_pattern
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
_34_ED_PATTERN:
		dc.w $0024
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_017
		dc.w $0007
		dc.w $0002
		dc.w $0003
		dc.w $0001
_34aED_PATTERN:
		dc.l edpa_pattern
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
_36_ED_PATTERN:
		dc.w $0026
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_018
		dc.w $0007
		dc.w $0003
		dc.w $0003
		dc.w $0001
_36aED_PATTERN:
		dc.l edpa_pattern
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
_38_ED_PATTERN:
		dc.w $0028
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_016
		dc.w $0007
		dc.w $0001
		dc.w $0003
		dc.w $0001
_38aED_PATTERN:
		dc.l edpa_pattern
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
_40_ED_PATTERN:
		dc.w $002a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_025
		dc.w $0010
		dc.w $0001
		dc.w $0003
		dc.w $0001
_40aED_PATTERN:
		dc.l edpa_pattern
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
_42_ED_PATTERN:
		dc.w $002c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_026
		dc.w $0010
		dc.w $0002
		dc.w $0003
		dc.w $0001
_42aED_PATTERN:
		dc.l edpa_pattern
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
_44_ED_PATTERN:
		dc.w $002e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_027
		dc.w $0010
		dc.w $0003
		dc.w $0003
		dc.w $0001
_44aED_PATTERN:
		dc.l edpa_pattern
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
_46_ED_PATTERN:
		dc.w $0030
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_024
		dc.w $000d
		dc.w $0003
		dc.w $0003
		dc.w $0001
_46aED_PATTERN:
		dc.l edpa_pattern
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
_48_ED_PATTERN:
		dc.w $0032
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_022
		dc.w $000d
		dc.w $0001
		dc.w $0003
		dc.w $0001
_48aED_PATTERN:
		dc.l edpa_pattern
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
_50_ED_PATTERN:
		dc.w $0034
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_023
		dc.w $000d
		dc.w $0002
		dc.w $0003
		dc.w $0001
_50aED_PATTERN:
		dc.l edpa_pattern
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
_52_ED_PATTERN:
		dc.w $0036
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_031
		dc.w $0016
		dc.w $0001
		dc.w $0003
		dc.w $0001
_52aED_PATTERN:
		dc.l edpa_pattern
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
_54_ED_PATTERN:
		dc.w $0038
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_032
		dc.w $0016
		dc.w $0002
		dc.w $0003
		dc.w $0001
_54aED_PATTERN:
		dc.l edpa_pattern
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
_56_ED_PATTERN:
		dc.w $003a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_033
		dc.w $0016
		dc.w $0003
		dc.w $0003
		dc.w $0001
_56aED_PATTERN:
		dc.l edpa_pattern
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
_58_ED_PATTERN:
		dc.w $003c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_028
		dc.w $0013
		dc.w $0001
		dc.w $0003
		dc.w $0001
_58aED_PATTERN:
		dc.l edpa_pattern
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
_60_ED_PATTERN:
		dc.w $003e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_029
		dc.w $0013
		dc.w $0002
		dc.w $0003
		dc.w $0001
_60aED_PATTERN:
		dc.l edpa_pattern
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
_62_ED_PATTERN:
		dc.w $0040
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_030
		dc.w $0013
		dc.w $0003
		dc.w $0003
		dc.w $0001
_62aED_PATTERN:
		dc.l edpa_pattern
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
_64_ED_PATTERN:
		dc.w $0042
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_034
		dc.w $0019
		dc.w $0001
		dc.w $0003
		dc.w $0001
_64aED_PATTERN:
		dc.l edpa_pattern
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
_66_ED_PATTERN:
		dc.w $0044
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_035
		dc.w $0019
		dc.w $0002
		dc.w $0003
		dc.w $0001
_66aED_PATTERN:
		dc.l edpa_pattern
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
_68_ED_PATTERN:
		dc.w $0046
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_036
		dc.w $0019
		dc.w $0003
		dc.w $0003
		dc.w $0001
_68aED_PATTERN:
		dc.l edpa_pattern
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
_70_ED_PATTERN:
		dc.w $0048
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_040
		dc.w $001f
		dc.w $0001
		dc.w $0003
		dc.w $0001
_70aED_PATTERN:
		dc.l edpa_pattern
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
_72_ED_PATTERN:
		dc.w $004a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_041
		dc.w $001f
		dc.w $0002
		dc.w $0003
		dc.w $0001
_72aED_PATTERN:
		dc.l edpa_pattern
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
_74_ED_PATTERN:
		dc.w $004c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_042
		dc.w $001f
		dc.w $0003
		dc.w $0003
		dc.w $0001
_74aED_PATTERN:
		dc.l edpa_pattern
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
_76_ED_PATTERN:
		dc.w $004e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_038
		dc.w $001c
		dc.w $0002
		dc.w $0003
		dc.w $0001
_76aED_PATTERN:
		dc.l edpa_pattern
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
_78_ED_PATTERN:
		dc.w $0050
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_039
		dc.w $001c
		dc.w $0003
		dc.w $0003
		dc.w $0001
_78aED_PATTERN:
		dc.l edpa_pattern
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
_80_ED_PATTERN:
		dc.w $0052
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_037
		dc.w $001c
		dc.w $0001
		dc.w $0003
		dc.w $0001
_80aED_PATTERN:
		dc.l edpa_pattern
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
_82_ED_PATTERN:
		dc.w $0054
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_046
		dc.w $0025
		dc.w $0001
		dc.w $0003
		dc.w $0001
_82aED_PATTERN:
		dc.l edpa_pattern
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
_84_ED_PATTERN:
		dc.w $0056
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_047
		dc.w $0025
		dc.w $0002
		dc.w $0003
		dc.w $0001
_84aED_PATTERN:
		dc.l edpa_pattern
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
_86_ED_PATTERN:
		dc.w $0058
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_048
		dc.w $0025
		dc.w $0003
		dc.w $0003
		dc.w $0001
_86aED_PATTERN:
		dc.l edpa_pattern
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
_88_ED_PATTERN:
		dc.w $005a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_045
		dc.w $0022
		dc.w $0003
		dc.w $0003
		dc.w $0001
_88aED_PATTERN:
		dc.l edpa_pattern
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
_90_ED_PATTERN:
		dc.w $005c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_043
		dc.w $0022
		dc.w $0001
		dc.w $0003
		dc.w $0001
_90aED_PATTERN:
		dc.l edpa_pattern
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
_92_ED_PATTERN:
		dc.w $005e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_044
		dc.w $0022
		dc.w $0002
		dc.w $0003
		dc.w $0001
_92aED_PATTERN:
		dc.l edpa_pattern
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
_94_ED_PATTERN:
		dc.w $0060
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_049
		dc.w $0028
		dc.w $0001
		dc.w $0003
		dc.w $0001
_94aED_PATTERN:
		dc.l edpa_pattern
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
_96_ED_PATTERN:
		dc.w $0062
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_050
		dc.w $0028
		dc.w $0002
		dc.w $0003
		dc.w $0001
_96aED_PATTERN:
		dc.l edpa_pattern
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
_98_ED_PATTERN:
		dc.w $000f
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l USER_051
		dc.w $0028
		dc.w $0003
		dc.w $0003
		dc.w $0001
_98aED_PATTERN:
		dc.l edpa_pattern
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
pattern:
		dc.l A_pattern
		dc.w $0023
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
visual:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l pattern
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0002
logical:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0003
		dc.w $0001
aud:
		dc.l xc1548
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
data:
		dc.b 'A_pattern',0
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
xc1548:
		dc.b '0x230001L'
xc1551: dc.b 0
xc1552:
		dc.b '0x%lxL',0
		.even

