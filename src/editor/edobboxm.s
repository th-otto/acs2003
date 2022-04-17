	.text

edbo_framecol:
		move.l     d3,-(a7)
		moveq.l    #43,d0
		move.w     d0,-(a7)
		moveq.l    #44,d2
		moveq.l    #41,d1
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		move.w     62(a1),d0
		moveq.l    #12,d3
		lsr.w      d3,d0
		and.w      #$000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      edbo_framecol_1
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		move.w     d3,d1
		andi.w     #$0FFF,62(a1)
		and.w      #$000F,d1
		lsl.w      #8,d1
		lsl.w      #4,d1
		or.w       d1,62(a1)
		jsr        edbo_update
edbo_framecol_1:
		move.l     (a7)+,d3
		rts

edbo_intercol:
		move.w     d3,-(a7)
		moveq.l    #53,d0
		move.w     d0,-(a7)
		moveq.l    #54,d2
		moveq.l    #51,d1
		moveq.l    #15,d0
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		and.w      62(a1),d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      edbo_intercol_1
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		move.w     d3,d1
		andi.w     #$FFF0,62(a1)
		and.w      #$000F,d1
		or.w       d1,62(a1)
		jsr        edbo_update
edbo_intercol_1:
		move.w     (a7)+,d3
		rts

edbo_pattern:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		subq.w     #8,a7
		lea.l      POP_PATSEL,a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		beq        edbo_pattern_1
		lea.l      ACSblk,a3
		moveq.l    #49,d0
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
		move.w     62(a1),d0
		lsr.w      #4,d0
		and.w      #$0007,d0
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
		ble.s      edbo_pattern_2
		movea.l    (a3),a0
		movea.l    604(a0),a1
		moveq.l    #-1,d1
		add.w      d0,d1
		andi.w     #$FF8F,62(a1)
		and.w      #$0007,d1
		lsl.w      #4,d1
		or.w       d1,62(a1)
		movea.l    (a3),a0
		movea.l    604(a0),a1
		moveq.l    #-1,d1
		add.w      d0,d1
		andi.w     #$FF8F,1190(a1)
		and.w      #$0007,d1
		lsl.w      #4,d1
		or.w       d1,1190(a1)
		moveq.l    #-1,d1
		moveq.l    #49,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		jsr        edbo_update
edbo_pattern_2:
		movea.l    a2,a0
		jsr        Aob_delete
edbo_pattern_1:
		addq.w     #8,a7
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

edbo_replace:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		andi.w     #$FF7F,62(a1)
		ori.w      #$0080,62(a1)
		jsr        edbo_update
		rts

edbo_textcol:
		move.w     d3,-(a7)
		moveq.l    #15,d0
		move.w     d0,-(a7)
		moveq.l    #16,d2
		moveq.l    #13,d1
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		move.w     62(a1),d0
		lsr.w      #8,d0
		and.w      #$000F,d0
		jsr        oe_colsel
		addq.w     #2,a7
		move.w     d0,d3
		bmi.s      edbo_textcol_1
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		move.w     d3,d1
		andi.w     #$F0FF,62(a1)
		and.w      #$000F,d1
		lsl.w      #8,d1
		or.w       d1,62(a1)
		jsr        edbo_update
edbo_textcol_1:
		move.w     (a7)+,d3
		rts

edbo_trans:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		andi.w     #$FF7F,62(a1)
		jsr        edbo_update
		rts

edbo_type:
		movem.l    d3/a2-a4,-(a7)
		subq.w     #8,a7
		lea.l      POP_TYPESEL,a2
		movea.l    a2,a0
		jsr        Aob_create
		movea.l    a0,a3
		move.l     a3,d0
		beq        edbo_type_1
		lea.l      ACSblk,a4
		moveq.l    #5,d0
		movea.l    (a4),a0
		movea.l    600(a0),a1
		movea.l    20(a1),a1
		lea.l      (a7),a0
		jsr        Aob_offset
		moveq.l    #1,d0
		movea.l    (a4),a0
		movea.l    600(a0),a1
		add.w      52(a1),d0
		add.w      d0,(a7)
		moveq.l    #1,d1
		add.w      54(a1),d1
		add.w      d1,2(a7)
		movea.l    604(a0),a1
		move.w     54(a1),d2
		sub.w      #$0014,d2
		beq.s      edbo_type_2
		subq.w     #5,d2
		beq.s      edbo_type_3
		subq.w     #2,d2
		beq.s      edbo_type_4
		bra.s      edbo_type_5
edbo_type_2:
		ori.w      #$0004,34(a3)
		bra.s      edbo_type_5
edbo_type_3:
		ori.w      #$0004,58(a3)
		bra.s      edbo_type_5
edbo_type_4:
		ori.w      #$0004,82(a3)
edbo_type_5:
		move.w     2(a7),d1
		move.w     (a7),d0
		movea.l    a3,a1
		movea.l    (a4),a0
		movea.l    600(a0),a0
		jsr        Ame_popup
		move.w     d0,d3
		subq.w     #1,d0
		beq.s      edbo_type_6
		subq.w     #1,d0
		beq.s      edbo_type_7
		subq.w     #1,d0
		beq.s      edbo_type_8
		bra.s      edbo_type_9
edbo_type_6:
		movea.l    (a4),a0
		movea.l    604(a0),a1
		move.w     #$0014,54(a1)
		lea.l      -2315(a2),a1
		moveq.l    #7,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edbo_type_9
edbo_type_7:
		movea.l    (a4),a0
		movea.l    604(a0),a1
		move.w     #$0019,54(a1)
		lea.l      -2309(a2),a1
		moveq.l    #7,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edbo_type_9
edbo_type_8:
		movea.l    (a4),a0
		movea.l    604(a0),a1
		move.w     #$001B,54(a1)
		lea.l      -2301(a2),a1
		moveq.l    #7,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
edbo_type_9:
		tst.w      d3
		ble.s      edbo_type_10
		moveq.l    #-1,d1
		moveq.l    #5,d0
		movea.l    (a4),a0
		movea.l    600(a0),a0
		movea.l    (a4),a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		jsr        (a1)
		jsr        edbo_update
edbo_type_10:
		movea.l    a3,a0
		jsr        Aob_delete
edbo_type_1:
		addq.w     #8,a7
		movem.l    (a7)+,d3/a2-a4
		rts

edbo_ok:
		movem.l    a2-a4,-(a7)
		subq.w     #4,a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    (a1),a2
		movea.l    20(a1),a3
		movea.l    (a2),a0
		ori.w      #$0001,6(a0)
		movea.l    4(a2),a0
		movea.l    4(a0),a4
		move.w     10(a2),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		adda.l     d0,a4
		move.w     54(a3),14(a4)
		move.l     60(a3),20(a4)
		lea.l      (a7),a1
		moveq.l    #3,d0
		lea.l      504(a3),a0
		jsr        Auo_boxed
		movea.l    (a7),a0
		move.b     (a0),d0
		ext.w      d0
		andi.w     #$00FF,20(a4)
		and.w      #$00FF,d0
		lsl.w      #8,d0
		or.w       d0,20(a4)
		jsr        ed_abort
		addq.w     #4,a7
		movem.l    (a7)+,a2-a4
		rts

	.globl set_box
set_box:
		movem.l    d3/a2-a4,-(a7)
		subq.w     #2,a7
		movea.l    a0,a3
		lea.l      colour_text,a4
		lea.l      64(a4),a0
		lea.l      (a7),a1
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		lea.l      -1416(a4),a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      set_box_1
		suba.l     a0,a0
		bra        set_box_2
set_box_1:
		move.w     14(a3),54(a2)
		move.l     20(a3),60(a2)
		move.w     18(a3),58(a2)
		moveq.l    #21,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		move.w     20(a3),d0
		lsr.w      #8,d0
		and.w      #$00FF,d0
		move.b     d0,(a7)
		lea.l      (a7),a1
		movea.l    a2,a0
		moveq.l    #21,d0
		jsr        Aob_puttext
		move.b     15(a3),d0
		ext.w      d0
		sub.w      #$0014,d0
		beq.s      set_box_3
		subq.w     #5,d0
		beq.s      set_box_4
		subq.w     #2,d0
		beq.s      set_box_5
		bra.s      set_box_6
set_box_3:
		lea.l      -3827(a4),a1
		moveq.l    #7,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      set_box_6
set_box_4:
		lea.l      -3821(a4),a1
		moveq.l    #7,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      set_box_6
set_box_5:
		lea.l      -3813(a4),a1
		moveq.l    #7,d0
		movea.l    a2,a0
		jsr        Aob_puttext
set_box_6:
		move.w     22(a3),d3
		moveq.l    #12,d0
		lsr.w      d0,d3
		and.w      #$000F,d3
		move.w     d3,d1
		lsl.w      #2,d1
		movea.l    0(a4,d1.w),a1
		movea.l    a2,a0
		moveq.l    #44,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #$FFF0,1046(a2)
		and.w      #$000F,d0
		or.w       d0,1046(a2)
		moveq.l    #15,d3
		and.w      22(a3),d3
		move.w     d3,d0
		lsl.w      #2,d0
		movea.l    0(a4,d0.w),a1
		movea.l    a2,a0
		moveq.l    #54,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #$FFF0,1286(a2)
		and.w      #$000F,d0
		or.w       d0,1286(a2)
		move.w     22(a3),d0
		lsr.w      #4,d0
		and.w      #$0007,d0
		andi.w     #$FF8F,1190(a2)
		and.w      #$0007,d0
		lsl.w      #4,d0
		or.w       d0,1190(a2)
		move.w     22(a3),d3
		lsr.w      #8,d3
		and.w      #$000F,d3
		move.w     d3,d0
		lsl.w      #2,d0
		movea.l    0(a4,d0.w),a1
		movea.l    a2,a0
		moveq.l    #16,d0
		jsr        Aob_puttext
		move.w     d3,d0
		andi.w     #$FFF0,374(a2)
		and.w      #$000F,d0
		or.w       d0,374(a2)
		move.w     22(a3),d0
		lsr.w      #7,d0
		and.w      #$0001,d0
		andi.w     #$FF7F,62(a2)
		and.w      #$0001,d0
		lsl.w      #7,d0
		or.w       d0,62(a2)
		move.l     a2,66(a4)
		lea.l      66(a4),a0
set_box_2:
		addq.w     #2,a7
		movem.l    (a7)+,d3/a2-a4
		rts

edbo_th:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		move.w     608(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    604(a0),a0
		move.w     12(a0,d0.l),d2
		lsl.w      #8,d2
		asr.w      #8,d2
		andi.w     #$FF00,60(a1)
		and.w      #$00FF,d2
		or.w       d2,60(a1)
		jsr        edbo_update
		rts

edbo_update:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		subq.w     #4,a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a2
		movea.l    20(a2),a3
		lea.l      (a7),a1
		moveq.l    #3,d0
		lea.l      504(a3),a0
		jsr        Auo_boxed
		movea.l    (a7),a0
		move.b     (a0),d0
		ext.w      d0
		andi.w     #$00FF,60(a3)
		and.w      #$00FF,d0
		lsl.w      #8,d0
		or.w       d0,60(a3)
		move.w     34(a3),d1
		moveq.l    #1,d0
		movea.l    a2,a0
		movea.l    102(a2),a1
		jsr        (a1)
		addq.w     #4,a7
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.data

COLOUR00:
		dc.b '  Weiû',0
COLOUR01:
		dc.b '  Schwarz',0
COLOUR02:
		dc.b '  Rot',0
COLOUR03:
		dc.b '  GrÅn',0
COLOUR04:
		dc.b '  Blau',0
COLOUR05:
		dc.b '  Cyan',0
COLOUR06:
		dc.b '  Gelb',0
COLOUR07:
		dc.b '  Magenta',0
COLOUR08:
		dc.b '  Hellgrau',0
COLOUR09:
		dc.b '  Dunkelgrau',0
COLOUR10:
		dc.b '  Dunkelrot',0
COLOUR11:
		dc.b '  DunkelgrÅn',0
COLOUR12:
		dc.b '  Dunkelblau',0
COLOUR13:
		dc.b '  Dunkelcyan',0
COLOUR14:
		dc.b '  Dunkelgelb',0
COLOUR15:
		dc.b '  Dunkelmagenta',0

	.globl HPOS_TEXT1
HPOS_TEXT1:
		dc.b '  Links',0
	.globl HPOS_TEXT2
HPOS_TEXT2:
		dc.b '  Mitte',0
	.globl HPOS_TEXT3
HPOS_TEXT3:
		dc.b '  Rechts',0
	.globl SIZE_TEXT0
SIZE_TEXT0:
		dc.b 'groû',0
	.globl SIZE_TEXT1
SIZE_TEXT1:
		dc.b 'klein',0
TEXT_003:
		dc.b $4f
		dc.w $4b00
TEXT_004:
		dc.b 'Abbruch',0
TEXT_01:
		dc.b 'Muster:',0
TEXT_02:
		dc.b 'Modus:',0
TEXT_03:
		dc.b 'Zeichen:',0
TEXT_04:
		dc.b 'Typ:',0
TEXT_05:
		dc.b 'Rand:',0
TEXT_08:
		dc.b 'Rahmen:',0
TEXT_11:
		dc.b 'Text:',0
TEXT_13:
		dc.b 'Farbe:',0
TEXT_16:
		dc.b 'InnenflÑche:',0
TYPE0:
		dc.b '  Box',0
TYPE1:
		dc.b '  I-Box',0
TYPE2:
		dc.b '  BoxChar',0
help_title:
		dc.b 'Der Boxen-Editor',0
title:
		dc.b ' BOXEN -',0
		dc.b $00
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TYPE0
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
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_003
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
		dc.l COLOUR01
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
		dc.l TYPE1
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
		dc.l TEXT_004
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
		dc.l COLOUR02
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
		dc.l TYPE2
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
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l COLOUR00
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON10:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l COLOUR03
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
		dc.l COLOUR04
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
		dc.l COLOUR05
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
		dc.l COLOUR06
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
		dc.l COLOUR07
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
		dc.l COLOUR08
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
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l COLOUR09
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON17:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l COLOUR10
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON18:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l COLOUR11
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON19:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l COLOUR13
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON20:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l COLOUR12
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON21:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l COLOUR14
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON22:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l COLOUR15
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON23:
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
A_3DBUTTON25:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
		dc.l SIZE_TEXT0
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
		dc.l HPOS_TEXT1
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
		dc.l HPOS_TEXT2
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
		dc.l HPOS_TEXT3
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
A_3DBUTTON31:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
		dc.l SIZE_TEXT1
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
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME01:
		dc.l A_innerframe
		dc.w $1000
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_16
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
		dc.w $1000
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_08
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME05:
		dc.l A_innerframe
		dc.w $1000
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_11
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl POP_COLSEL
POP_COLSEL:
		dc.w $ffff
		dc.w $0001
		dc.w $0020
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $00ff
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $0012
		dc.w $0010
_01_POP_COLSEL:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON09
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_02_POP_COLSEL:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1170
		dc.w $0010
		dc.w $0000
		dc.w $0002
		dc.w $0001
_03_POP_COLSEL:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON03
		dc.w $0000
		dc.w $0001
		dc.w $0010
		dc.w $0001
_04_POP_COLSEL:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1171
		dc.w $0010
		dc.w $0001
		dc.w $0002
		dc.w $0001
_05_POP_COLSEL:
		dc.w $0006
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON07
		dc.w $0000
		dc.w $0002
		dc.w $0010
		dc.w $0001
_06_POP_COLSEL:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1172
		dc.w $0010
		dc.w $0002
		dc.w $0002
		dc.w $0001
_07_POP_COLSEL:
		dc.w $0008
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON10
		dc.w $0000
		dc.w $0003
		dc.w $0010
		dc.w $0001
_08_POP_COLSEL:
		dc.w $0009
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1173
		dc.w $0010
		dc.w $0003
		dc.w $0002
		dc.w $0001
_09_POP_COLSEL:
		dc.w $000a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON11
		dc.w $0000
		dc.w $0004
		dc.w $0010
		dc.w $0001
_10_POP_COLSEL:
		dc.w $000b
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1174
		dc.w $0010
		dc.w $0004
		dc.w $0002
		dc.w $0001
_11_POP_COLSEL:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON12
		dc.w $0000
		dc.w $0005
		dc.w $0010
		dc.w $0001
_12_POP_COLSEL:
		dc.w $000d
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1175
		dc.w $0010
		dc.w $0005
		dc.w $0002
		dc.w $0001
_13_POP_COLSEL:
		dc.w $000e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON13
		dc.w $0000
		dc.w $0006
		dc.w $0010
		dc.w $0001
_14_POP_COLSEL:
		dc.w $000f
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1176
		dc.w $0010
		dc.w $0006
		dc.w $0002
		dc.w $0001
_15_POP_COLSEL:
		dc.w $0010
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON14
		dc.w $0000
		dc.w $0007
		dc.w $0010
		dc.w $0001
_16_POP_COLSEL:
		dc.w $0011
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1177
		dc.w $0010
		dc.w $0007
		dc.w $0002
		dc.w $0001
_17_POP_COLSEL:
		dc.w $0012
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON15
		dc.w $0000
		dc.w $0008
		dc.w $0010
		dc.w $0001
_18_POP_COLSEL:
		dc.w $0013
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1178
		dc.w $0010
		dc.w $0008
		dc.w $0002
		dc.w $0001
_19_POP_COLSEL:
		dc.w $0014
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON16
		dc.w $0000
		dc.w $0009
		dc.w $0010
		dc.w $0001
_20_POP_COLSEL:
		dc.w $0015
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1179
		dc.w $0010
		dc.w $0009
		dc.w $0002
		dc.w $0001
_21_POP_COLSEL:
		dc.w $0016
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON17
		dc.w $0000
		dc.w $000a
		dc.w $0010
		dc.w $0001
_22_POP_COLSEL:
		dc.w $0017
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $117a
		dc.w $0010
		dc.w $000a
		dc.w $0002
		dc.w $0001
_23_POP_COLSEL:
		dc.w $0018
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON18
		dc.w $0000
		dc.w $000b
		dc.w $0010
		dc.w $0001
_24_POP_COLSEL:
		dc.w $0019
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $117b
		dc.w $0010
		dc.w $000b
		dc.w $0002
		dc.w $0001
_25_POP_COLSEL:
		dc.w $001a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON20
		dc.w $0000
		dc.w $000c
		dc.w $0010
		dc.w $0001
_26_POP_COLSEL:
		dc.w $001b
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $117c
		dc.w $0010
		dc.w $000c
		dc.w $0002
		dc.w $0001
_27_POP_COLSEL:
		dc.w $001c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON19
		dc.w $0000
		dc.w $000d
		dc.w $0010
		dc.w $0001
_28_POP_COLSEL:
		dc.w $001d
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $117d
		dc.w $0010
		dc.w $000d
		dc.w $0002
		dc.w $0001
_29_POP_COLSEL:
		dc.w $001e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON21
		dc.w $0000
		dc.w $000e
		dc.w $0010
		dc.w $0001
_30_POP_COLSEL:
		dc.w $001f
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $117e
		dc.w $0010
		dc.w $000e
		dc.w $0002
		dc.w $0001
_31_POP_COLSEL:
		dc.w $0020
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON22
		dc.w $0000
		dc.w $000f
		dc.w $0010
		dc.w $0001
_32_POP_COLSEL:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0020
		dc.w $0000
		dc.w $0001
		dc.w $117f
		dc.w $0010
		dc.w $000f
		dc.w $0002
		dc.w $0001
	.globl POP_HORPOSSEL
POP_HORPOSSEL:
		dc.w $ffff
		dc.w $0001
		dc.w $0003
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $00ff
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0003
_01_POP_HORPOSSEL:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON27
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0001
_02_POP_HORPOSSEL:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON28
		dc.w $0000
		dc.w $0001
		dc.w $000a
		dc.w $0001
_03_POP_HORPOSSEL:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0021
		dc.w $0000
		dc.l A_3DBUTTON29
		dc.w $0000
		dc.w $0002
		dc.w $000a
		dc.w $0001
	.globl POP_PATSEL
POP_PATSEL:
		dc.w $ffff
		dc.w $0001
		dc.w $0008
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $00ff
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $0012
		dc.w $0008
_01_POP_PATSEL:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $1101
		dc.w $0000
		dc.w $0000
		dc.w $0012
		dc.w $0001
_02_POP_PATSEL:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $1111
		dc.w $0000
		dc.w $0001
		dc.w $0012
		dc.w $0001
_03_POP_PATSEL:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $1121
		dc.w $0000
		dc.w $0002
		dc.w $0012
		dc.w $0001
_04_POP_PATSEL:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $1131
		dc.w $0000
		dc.w $0003
		dc.w $0012
		dc.w $0001
_05_POP_PATSEL:
		dc.w $0006
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $1141
		dc.w $0000
		dc.w $0004
		dc.w $0012
		dc.w $0001
_06_POP_PATSEL:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $1151
		dc.w $0000
		dc.w $0005
		dc.w $0012
		dc.w $0001
_07_POP_PATSEL:
		dc.w $0008
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $1161
		dc.w $0000
		dc.w $0006
		dc.w $0012
		dc.w $0001
_08_POP_PATSEL:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0021
		dc.w $0000
		dc.w $0001
		dc.w $1171
		dc.w $0000
		dc.w $0007
		dc.w $0012
		dc.w $0001
	.globl POP_SIZESEL
POP_SIZESEL:
		dc.w $ffff
		dc.w $0001
		dc.w $0002
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $00ff
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0002
_01_POP_SIZESEL:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0000
		dc.l A_3DBUTTON25
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0001
_02_POP_SIZESEL:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0021
		dc.w $0000
		dc.l A_3DBUTTON31
		dc.w $0000
		dc.w $0001
		dc.w $0008
		dc.w $0001
POP_TYPESEL:
		dc.w $ffff
		dc.w $0001
		dc.w $0003
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $00ff
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $000b
		dc.w $0003
_01_POP_TYPESEL:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON01
		dc.w $0000
		dc.w $0000
		dc.w $000b
		dc.w $0001
_02_POP_TYPESEL:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON04
		dc.w $0000
		dc.w $0001
		dc.w $000b
		dc.w $0001
_03_POP_TYPESEL:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0061
		dc.w $0000
		dc.l A_3DBUTTON08
		dc.w $0000
		dc.w $0002
		dc.w $000b
		dc.w $0001
	.globl ED_BOX
ED_BOX:
		dc.w $ffff
		dc.w $0001
		dc.w $0030
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON05
		dc.w $0000
		dc.w $0000
		dc.w $003c
		dc.w $000c
_01_ED_BOX:
		dc.w $0003
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON30
		dc.w $0000
		dc.w $0000
		dc.w $0009
		dc.w $0004
_02_ED_BOX:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $001b
		dc.w $0040
		dc.w $0000
		dc.w $43ff
		dc.w $1101
		dc.w $0001
		dc.w $0001
		dc.w $0007
		dc.w $0002
_03_ED_BOX:
		dc.w $0005
		dc.w $0004
		dc.w $0004
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_04
		dc.w $000b
		dc.w $0001
		dc.w $0005
		dc.w $0001
_04_ED_BOX:
		dc.w $0003
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
_05_ED_BOX:
		dc.w $0008
		dc.w $0007
		dc.w $0007
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0010
		dc.w $0001
		dc.w $000b
		dc.w $0001
_05aED_BOX:
		dc.l edbo_type
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8854
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_07_ED_BOX:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON23
		dc.w $0000
		dc.w $0000
		dc.w $000b
		dc.w $0001
_08_ED_BOX:
		dc.w $000a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON02
		dc.w $0021
		dc.w $0001
		dc.w $000c
		dc.w $0002
_08aED_BOX:
		dc.l edbo_ok
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
_10_ED_BOX:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON06
		dc.w $002f
		dc.w $0001
		dc.w $000c
		dc.w $0002
_10aED_BOX:
		dc.l ed_abort
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
_12_ED_BOX:
		dc.w $001a
		dc.w $000d
		dc.w $0019
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME05
		dc.w $0001
		dc.w $0004
		dc.w $003a
		dc.w $0003
_13_ED_BOX:
		dc.w $0011
		dc.w $000f
		dc.w $0010
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0008
		dc.w $0001
		dc.w $0012
		dc.w $0001
_13aED_BOX:
		dc.l edbo_textcol
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
_15_ED_BOX:
		dc.w $0010
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
_16_ED_BOX:
		dc.w $000d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON23
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_17_ED_BOX:
		dc.w $0013
		dc.w $ffff
		dc.w $ffff
		dc.w $001b
		dc.w $0005
		dc.w $0000
		dc.w $43ff
		dc.w $1121
		dc.w $0024
		dc.w $0001
		dc.w $0003
		dc.w $0001
_17aED_BOX:
		dc.l edbo_trans
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
_19_ED_BOX:
		dc.w $0015
		dc.w $ffff
		dc.w $ffff
		dc.w $001b
		dc.w $0005
		dc.w $0000
		dc.w $43ff
		dc.w $11a1
		dc.w $0028
		dc.w $0001
		dc.w $0003
		dc.w $0001
_19aED_BOX:
		dc.l edbo_replace
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
_21_ED_BOX:
		dc.w $0016
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED01
		dc.w $0037
		dc.w $0001
		dc.w $0001
		dc.w $0001
_22_ED_BOX:
		dc.w $0018
		dc.w $0017
		dc.w $0017
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_13
		dc.w $0001
		dc.w $0001
		dc.w $0006
		dc.w $0001
_23_ED_BOX:
		dc.w $0016
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
_24_ED_BOX:
		dc.w $0019
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_02
		dc.w $001d
		dc.w $0001
		dc.w $0006
		dc.w $0001
_25_ED_BOX:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_03
		dc.w $002e
		dc.w $0001
		dc.w $0008
		dc.w $0001
_26_ED_BOX:
		dc.w $0030
		dc.w $001b
		dc.w $002f
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME04
		dc.w $0001
		dc.w $0007
		dc.w $001e
		dc.w $0005
_27_ED_BOX:
		dc.w $001d
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $0003
		dc.w $1111
		dc.w $0008
		dc.w $0003
		dc.w $0002
		dc.w $0001
_27aED_BOX:
		dc.l edbo_th
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
_29_ED_BOX:
		dc.w $001f
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $0002
		dc.w $1111
		dc.w $000b
		dc.w $0003
		dc.w $0002
		dc.w $0001
_29aED_BOX:
		dc.l edbo_th
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
_31_ED_BOX:
		dc.w $0021
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $0001
		dc.w $1111
		dc.w $000e
		dc.w $0003
		dc.w $0002
		dc.w $0001
_31aED_BOX:
		dc.l edbo_th
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
_33_ED_BOX:
		dc.w $0023
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $0000
		dc.w $1111
		dc.w $0011
		dc.w $0003
		dc.w $0002
		dc.w $0001
_33aED_BOX:
		dc.l edbo_th
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
_35_ED_BOX:
		dc.w $0025
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $00ff
		dc.w $1111
		dc.w $0014
		dc.w $0003
		dc.w $0002
		dc.w $0001
_35aED_BOX:
		dc.l edbo_th
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
_37_ED_BOX:
		dc.w $0027
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $00fe
		dc.w $1111
		dc.w $0017
		dc.w $0003
		dc.w $0002
		dc.w $0001
_37aED_BOX:
		dc.l edbo_th
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
_39_ED_BOX:
		dc.w $0029
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0005
		dc.w $0000
		dc.w $00fd
		dc.w $1111
		dc.w $001a
		dc.w $0003
		dc.w $0002
		dc.w $0001
_39aED_BOX:
		dc.l edbo_th
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
_41_ED_BOX:
		dc.w $002d
		dc.w $002b
		dc.w $002c
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0008
		dc.w $0001
		dc.w $0012
		dc.w $0001
_41aED_BOX:
		dc.l edbo_framecol
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
_43_ED_BOX:
		dc.w $002c
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
_44_ED_BOX:
		dc.w $0029
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON23
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_45_ED_BOX:
		dc.w $002f
		dc.w $002e
		dc.w $002e
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_13
		dc.w $0001
		dc.w $0001
		dc.w $0006
		dc.w $0001
_46_ED_BOX:
		dc.w $002d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0002
		dc.w $0000
		dc.w $0001
		dc.w $0001
_47_ED_BOX:
		dc.w $001a
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_05
		dc.w $0002
		dc.w $0003
		dc.w $0006
		dc.w $0001
_48_ED_BOX:
		dc.w $0000
		dc.w $0031
		dc.w $0039
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_INNERFRAME01
		dc.w $001f
		dc.w $0007
		dc.w $001c
		dc.w $0005
_49_ED_BOX:
		dc.w $0033
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0001
		dc.w $0012
		dc.w $0001
_49aED_BOX:
		dc.l edbo_pattern
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
_51_ED_BOX:
		dc.w $0037
		dc.w $0035
		dc.w $0036
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0009
		dc.w $0003
		dc.w $0012
		dc.w $0001
_51aED_BOX:
		dc.l edbo_intercol
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8842
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_53_ED_BOX:
		dc.w $0036
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
_54_ED_BOX:
		dc.w $0033
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON23
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_55_ED_BOX:
		dc.w $0039
		dc.w $0038
		dc.w $0038
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_13
		dc.w $0002
		dc.w $0003
		dc.w $0006
		dc.w $0001
_56_ED_BOX:
		dc.w $0037
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0003
		dc.w $0000
		dc.w $0001
		dc.w $0001
_57_ED_BOX:
		dc.w $0030
		dc.w $003a
		dc.w $003a
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_01
		dc.w $0001
		dc.w $0001
		dc.w $0008
		dc.w $0001
_58_ED_BOX:
		dc.w $0039
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0060
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0001
	.globl colour_text
colour_text:
		dc.l COLOUR00
		dc.l COLOUR01
		dc.l COLOUR02
		dc.l COLOUR03
		dc.l COLOUR04
		dc.l COLOUR05
		dc.l COLOUR06
		dc.l COLOUR07
		dc.l COLOUR08
		dc.l COLOUR09
		dc.l COLOUR10
		dc.l COLOUR11
		dc.l COLOUR12
		dc.l COLOUR13
		dc.l COLOUR14
		dc.l COLOUR15
		dc.w $2000
sm:
		dc.w $0000
		dc.w $0000
		dc.l edbo_ok
		dc.l Aob_delete
		dc.l title
		dc.l help_title
		dc.w $0000
		dc.w $0000
