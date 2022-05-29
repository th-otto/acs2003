		.text

edst_type:
		movem.l    d3/a2-a4,-(a7)
		subq.w     #8,a7
		lea.l      POP_TYPESEL,a2
		movea.l    a2,a0
		jsr        Aob_create
		movea.l    a0,a3
		move.l     a3,d0
		beq        edst_type_1
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
		sub.w      #0x001A,d2
		beq.s      edst_type_2
		subq.w     #2,d2
		beq.s      edst_type_3
		subq.w     #4,d2
		beq.s      edst_type_4
		bra.s      edst_type_5
edst_type_3:
		ori.w      #0x0004,34(a3)
		bra.s      edst_type_5
edst_type_2:
		ori.w      #0x0004,58(a3)
		bra.s      edst_type_5
edst_type_4:
		ori.w      #0x0004,82(a3)
edst_type_5:
		move.w     2(a7),d1
		move.w     (a7),d0
		movea.l    a3,a1
		movea.l    (a4),a0
		movea.l    600(a0),a0
		jsr        Ame_popup
		move.w     d0,d3
		subq.w     #1,d0
		beq.s      edst_type_6
		subq.w     #1,d0
		beq.s      edst_type_7
		subq.w     #1,d0
		beq.s      edst_type_8
		bra.s      edst_type_9
edst_type_6:
		movea.l    (a4),a0
		movea.l    604(a0),a1
		move.w     #0x001C,54(a1)
		lea.l      -407(a2),a1
		moveq.l    #7,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edst_type_9
edst_type_7:
		movea.l    (a4),a0
		movea.l    604(a0),a1
		move.w     #0x001A,54(a1)
		lea.l      -398(a2),a1
		moveq.l    #7,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		bra.s      edst_type_9
edst_type_8:
		movea.l    (a4),a0
		movea.l    604(a0),a1
		move.w     #0x0020,54(a1)
		lea.l      -389(a2),a1
		moveq.l    #7,d0
		movea.l    (a4),a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
edst_type_9:
		tst.w      d3
		ble.s      edst_type_10
		moveq.l    #-1,d1
		moveq.l    #5,d0
		movea.l    (a4),a0
		movea.l    600(a0),a0
		movea.l    (a4),a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		jsr        (a1)
		moveq.l    #-1,d1
		moveq.l    #1,d0
		movea.l    (a4),a0
		movea.l    600(a0),a0
		movea.l    (a4),a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		jsr        (a1)
edst_type_10:
		movea.l    a3,a0
		jsr        Aob_delete
edst_type_1:
		addq.w     #8,a7
		movem.l    (a7)+,d3/a2-a4
		rts

edst_ok:
		movem.l    d3/a2-a5,-(a7)
		subq.w     #4,a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    20(a0),a2
		movea.l    (a0),a3
		movea.l    (a3),a4
		ori.w      #0x0001,6(a4)
		movea.l    4(a3),a0
		movea.l    4(a0),a5
		move.w     10(a3),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		adda.l     d0,a5
		move.w     54(a2),14(a5)
		lea.l      (a7),a1
		moveq.l    #3,d0
		lea.l      312(a2),a0
		jsr        Auo_boxed
		movea.l    (a7),a0
		jsr        strlen
		move.l     d0,d3
		move.l     (a7),-(a7)
		movea.l    20(a5),a1
		movea.l    a4,a0
		jsr        change_string
		addq.w     #4,a7
		cmp.w      28(a5),d3
		ble.s      edst_ok_1
		move.w     d3,28(a5)
edst_ok_1:
		jsr        ed_abort
		addq.w     #4,a7
		movem.l    (a7)+,d3/a2-a5
		rts

	.globl edst_set_str
edst_set_str:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a3
		lea.l      sm,a4
		lea.l      -336(a4),a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      set_str_1
		suba.l     a0,a0
		bra.w      set_str_2
set_str_1:
		moveq.l    #13,d0
		movea.l    a2,a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        oe_beself
		move.w     14(a3),54(a2)
		move.w     18(a3),58(a2)
		movea.l    20(a3),a0
		movea.l    4(a0),a1
		moveq.l    #13,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		move.w     14(a3),d0
		sub.w      #0x001A,d0
		beq.s      set_str_3
		subq.w     #2,d0
		beq.s      set_str_4
		subq.w     #4,d0
		beq.s      set_str_5
		bra.s      set_str_6
set_str_4:
		lea.l      -839(a4),a1
		moveq.l    #7,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      set_str_6
set_str_3:
		lea.l      -830(a4),a1
		moveq.l    #7,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		bra.s      set_str_6
set_str_5:
		lea.l      -821(a4),a1
		moveq.l    #7,d0
		movea.l    a2,a0
		jsr        Aob_puttext
set_str_6:
		move.l     a2,(a4)
		movea.l    a4,a0
set_str_2:
		movem.l    (a7)+,a2-a4
		rts

	.data

TEXT_003:
		dc.b 'OK',0
TEXT_004:
		dc.b 'Abbruch',0
TEXT_02:
		dc.b 'Text:',0
TEXT_03:
		dc.b 'Typ:',0
TEXT_030:
		dc.b 'TEXT',0
TYPE0:
		dc.b '  String',0
TYPE1:
		dc.b '  Button',0
TYPE2:
		dc.b '  Titel',0
help_title:
		dc.b 'Der String-Editor',0
title:
		dc.b ' STRINGS -',0
A_3DBUTTON01:
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
A_3DBUTTON04:
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
A_3DBUTTON07:
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
		dc.l TYPE0
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
		dc.l A_3DBUTTON09
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
		dc.l A_3DBUTTON06
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
		dc.l A_3DBUTTON07
		dc.w $0000
		dc.w $0002
		dc.w $000b
		dc.w $0001
ED_STR:
		dc.w $ffff
		dc.w $0001
		dc.w $000c
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON05
		dc.w $0000
		dc.w $0000
		dc.w $003d
		dc.w $0007
_01_ED_STR:
		dc.w $0003
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0000
		dc.w $0010
		dc.l A_3DBUTTON01
		dc.w $0000
		dc.w $0000
		dc.w $000b
		dc.w $0003
_02_ED_STR:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $001a
		dc.w $0040
		dc.w $0000
		dc.l TEXT_030
		dc.w $0002
		dc.w $0001
		dc.w $0007
		dc.w $0001
_03_ED_STR:
		dc.w $0005
		dc.w $0004
		dc.w $0004
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_03
		dc.w $000d
		dc.w $0001
		dc.w $0005
		dc.w $0001
_04_ED_STR:
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
_05_ED_STR:
		dc.w $0008
		dc.w $0007
		dc.w $0007
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0012
		dc.w $0001
		dc.w $000b
		dc.w $0001
_05aED_STR:
		dc.l edst_type
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
_07_ED_STR:
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
_08_ED_STR:
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
_08aED_STR:
		dc.l edst_ok
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
_10_ED_STR:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON04
		dc.w $002f
		dc.w $0001
		dc.w $000c
		dc.w $0002
_10aED_STR:
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
_12_ED_STR:
		dc.w $0000
		dc.w $000d
		dc.w $000d
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME02
		dc.w $0001
		dc.w $0003
		dc.w $003b
		dc.w $0004
_13_ED_STR:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0028
		dc.w $0010
		dc.l A_BOXED01
		dc.w $0001
		dc.w $0002
		dc.w $0039
		dc.w $0001
sm:
		dc.w $0000
		dc.w $0000
		dc.l edst_ok
		dc.l Aob_delete
		dc.l title
		dc.l help_title
		dc.w $0000
		dc.w $0000

