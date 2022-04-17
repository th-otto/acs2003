		.text

edus_ok:
		movem.l    a2-a6,-(a7)
		lea.l      -36(a7),a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    (a1),a2
		movea.l    20(a1),a3
		movea.l    4(a2),a0
		movea.l    4(a0),a4
		move.w     10(a2),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		adda.l     d0,a4
		move.l     20(a4),(a7)
		lea.l      4(a7),a6
		movea.l    a6,a1
		moveq.l    #3,d0
		lea.l      360(a3),a0
		jsr        Auo_boxed
		lea.l      4(a6),a1
		moveq.l    #3,d0
		lea.l      408(a3),a0
		jsr        Auo_boxed
		movea.l    (a6),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      edus_ok_1
		movea.l    4(a6),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq.s      edus_ok_2
edus_ok_1:
		lea.l      ERR_MUST,a0
		moveq.l    #1,d0
		jsr        Awi_alert
		bra        edus_ok_3
edus_ok_2:
		lea.l      8(a6),a1
		moveq.l    #3,d0
		lea.l      456(a3),a0
		jsr        Auo_boxed
		lea.l      12(a6),a1
		moveq.l    #3,d0
		lea.l      504(a3),a0
		jsr        Auo_boxed
		lea.l      16(a6),a1
		moveq.l    #3,d0
		lea.l      552(a3),a0
		jsr        Auo_boxed
		lea.l      20(a6),a1
		moveq.l    #3,d0
		lea.l      600(a3),a0
		jsr        Auo_boxed
		lea.l      24(a6),a1
		moveq.l    #3,d0
		lea.l      648(a3),a0
		jsr        Auo_boxed
		lea.l      28(a6),a1
		moveq.l    #3,d0
		lea.l      672(a3),a0
		jsr        Auo_boxed
		pea.l      (a6)
		movea.l    4(a7),a1
		movea.l    (a2),a0
		jsr        change_user
		addq.w     #4,a7
		movea.l    a0,a5
		move.l     a5,d0
		beq.s      edus_ok_4
		move.l     d0,20(a4)
edus_ok_4:
		jsr        ed_abort
edus_ok_3:
		lea.l      36(a7),a7
		movem.l    (a7)+,a2-a6
		rts

edus_list:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a2
		movea.l    (a2),a0
		ori.w      #$0004,84(a2)
		lea.l      list_reference,a3
		move.l     (a0),(a3)
		movea.l    (a0),a1
		move.l     60(a1),4(a3)
		movea.l    a3,a0
		movea.l    WI_LIST+8,a1
		jsr        (a1)
		andi.w     #$FFFB,84(a2)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

accept:
		movem.l    d3-d4/a2-a5,-(a7)
		subq.w     #4,a7
		move.w     d0,d4
		movea.l    ACSblk,a0
		movea.l    600(a0),a3
		movea.l    20(a3),a4
		movea.l    576(a0),a5
		clr.w      584(a0)
		jsr        Adr_next
		move.w     d0,d3
		ble.s      accept_1
		ext.l      d0
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		movea.l    20(a5),a2
		lea.l      24(a2,d1.l),a2
		cmpi.w     #$271C,22(a2)
		beq.s      accept_2
		tst.w      d4
		beq.s      accept_1
		cmpi.w     #$2724,22(a2)
		beq.s      accept_2
		cmpi.w     #$271A,22(a2)
		bne.s      accept_1
accept_2:
		move.l     12(a2),(a7)
		jsr        Awi_diaend
		movea.l    (a7),a1
		lea.l      22(a1),a1
		movea.l    ACSblk,a0
		move.w     608(a0),d0
		movea.l    a4,a0
		jsr        Aob_puttext
		moveq.l    #-1,d1
		movea.l    ACSblk,a0
		move.w     608(a0),d0
		movea.l    102(a3),a1
		movea.l    a3,a0
		jsr        (a1)
		jsr        Awi_diastart
		move.w     d3,d0
		movea.l    a5,a0
		jsr        Adr_del
accept_1:
		addq.w     #4,a7
		movem.l    (a7)+,d3-d4/a2-a5
		rts

edus_ref:
		clr.w      d0
		bsr        accept
		rts

edus_ptr:
		moveq.l    #1,d0
		bsr        accept
		rts

set_user:
		movem.l    a2-a5,-(a7)
		lea.l      -258(a7),a7
		movea.l    a0,a4
		lea.l      sm,a5
		lea.l      -840(a5),a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      set_user_1
		suba.l     a0,a0
		bra        set_user_2
set_user_1:
		movea.l    20(a4),a4
		lea.l      ACSblk,a3
		moveq.l    #15,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #17,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #19,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #21,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #23,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #25,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #27,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #28,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		movea.l    4(a4),a3
		lea.l      (a7),a1
		movea.l    (a3),a0
		jsr        set_ref
		lea.l      (a7),a1
		moveq.l    #4,d0
		lea.l      360(a2),a0
		jsr        Auo_boxed
		lea.l      (a7),a1
		movea.l    4(a3),a0
		jsr        set_ref
		lea.l      (a7),a1
		moveq.l    #4,d0
		lea.l      408(a2),a0
		jsr        Auo_boxed
		lea.l      (a7),a1
		movea.l    8(a3),a0
		jsr        set_ref
		lea.l      (a7),a1
		moveq.l    #4,d0
		lea.l      456(a2),a0
		jsr        Auo_boxed
		lea.l      (a7),a1
		movea.l    12(a3),a0
		jsr        set_ref
		lea.l      (a7),a1
		moveq.l    #4,d0
		lea.l      504(a2),a0
		jsr        Auo_boxed
		lea.l      (a7),a1
		movea.l    16(a3),a0
		jsr        set_ref
		lea.l      (a7),a1
		moveq.l    #4,d0
		lea.l      552(a2),a0
		jsr        Auo_boxed
		lea.l      (a7),a1
		movea.l    20(a3),a0
		jsr        set_ref
		lea.l      (a7),a1
		moveq.l    #4,d0
		lea.l      600(a2),a0
		jsr        Auo_boxed
		lea.l      (a7),a1
		movea.l    24(a3),a0
		jsr        set_val
		lea.l      (a7),a1
		moveq.l    #4,d0
		lea.l      648(a2),a0
		jsr        Auo_boxed
		lea.l      (a7),a1
		movea.l    28(a3),a0
		jsr        set_val
		lea.l      (a7),a1
		moveq.l    #4,d0
		lea.l      672(a2),a0
		jsr        Auo_boxed
		move.l     a2,(a5)
		movea.l    a5,a0
set_user_2:
		lea.l      258(a7),a7
		movem.l    (a7)+,a2-a5
		rts

	.data

ERR_MUST:
		dc.b '[3][ | Es mÅssen Werte | eingegeben werden ][ OK ]',0
TEXT_003:
		dc.b 'OK',0
TEXT_004:
		dc.b 'Abbruch',0
TEXT_01:
		dc.b 'Code:',0
TEXT_02:
		dc.b 'Parm:',0
TEXT_03:
		dc.b 'Serv:',0
TEXT_04:
		dc.b 'Ptr1:',0
TEXT_05:
		dc.b 'Ptr2:',0
TEXT_06:
		dc.b 'Ptr3:',0
TEXT_07:
		dc.b 'Bubb:',0
TEXT_08:
		dc.b 'CMen:',0
help_title:
		dc.b 'Der USERDEF-Editor',0
title:
		dc.b ' USERBLK -',0
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
		dc.l TEXT_004
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
		dc.l TEXT_003
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
		dc.w $2011
		dc.w $9178
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
A_BOXED01:
		dc.l A_boxed
		dc.w $9038
		dc.w $1f12
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
A_INNERFRAME02:
		dc.l A_innerframe
		dc.w $1000
		dc.w $8f19
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
ED_USER:
		dc.w $ffff
		dc.w $0001
		dc.w $0021
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON02
		dc.w $0000
		dc.w $0000
		dc.w $002a
		dc.w $000d
_01_ED_USER:
		dc.w $001f
		dc.w $0002
		dc.w $001e
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME02
		dc.w $0001
		dc.w $0000
		dc.w $0028
		dc.w $000a
_02_ED_USER:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0005
		dc.w $0000
		dc.l TEXT_01
		dc.w $0001
		dc.w $0001
		dc.w $0005
		dc.w $0001
_02aED_USER:
		dc.l edus_list
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
_04_ED_USER:
		dc.w $0006
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0005
		dc.w $0000
		dc.l TEXT_02
		dc.w $0001
		dc.w $0002
		dc.w $0005
		dc.w $0001
_04aED_USER:
		dc.l edus_list
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
_06_ED_USER:
		dc.w $0008
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0005
		dc.w $0000
		dc.l TEXT_03
		dc.w $0001
		dc.w $0003
		dc.w $0005
		dc.w $0001
_06aED_USER:
		dc.l edus_list
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
_08_ED_USER:
		dc.w $000a
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0005
		dc.w $0000
		dc.l TEXT_04
		dc.w $0001
		dc.w $0004
		dc.w $0005
		dc.w $0001
_08aED_USER:
		dc.l edus_list
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
_10_ED_USER:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0005
		dc.w $0000
		dc.l TEXT_05
		dc.w $0001
		dc.w $0005
		dc.w $0005
		dc.w $0001
_10aED_USER:
		dc.l edus_list
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
_12_ED_USER:
		dc.w $000e
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0005
		dc.w $0000
		dc.l TEXT_06
		dc.w $0001
		dc.w $0006
		dc.w $0005
		dc.w $0001
_12aED_USER:
		dc.l edus_list
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
_14_ED_USER:
		dc.w $001d
		dc.w $000f
		dc.w $001c
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON05
		dc.w $0007
		dc.w $0001
		dc.w $001f
		dc.w $0008
_15_ED_USER:
		dc.w $0011
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED01
		dc.w $0000
		dc.w $0000
		dc.w $001f
		dc.w $0001
_15aED_USER:
		dc.w $0000
		dc.w $0000
		dc.l edus_ref
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_17_ED_USER:
		dc.w $0013
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED01
		dc.w $0000
		dc.w $0001
		dc.w $001f
		dc.w $0001
_17aED_USER:
		dc.w $0000
		dc.w $0000
		dc.l edus_ref
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_19_ED_USER:
		dc.w $0015
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED01
		dc.w $0000
		dc.w $0002
		dc.w $001f
		dc.w $0001
_19aED_USER:
		dc.w $0000
		dc.w $0000
		dc.l edus_ref
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_21_ED_USER:
		dc.w $0017
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED01
		dc.w $0000
		dc.w $0003
		dc.w $001f
		dc.w $0001
_21aED_USER:
		dc.w $0000
		dc.w $0000
		dc.l edus_ptr
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_23_ED_USER:
		dc.w $0019
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED01
		dc.w $0000
		dc.w $0004
		dc.w $001f
		dc.w $0001
_23aED_USER:
		dc.w $0000
		dc.w $0000
		dc.l edus_ptr
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_25_ED_USER:
		dc.w $001b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED01
		dc.w $0000
		dc.w $0005
		dc.w $001f
		dc.w $0001
_25aED_USER:
		dc.w $0000
		dc.w $0000
		dc.l edus_ptr
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_27_ED_USER:
		dc.w $001c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED02
		dc.w $0000
		dc.w $0006
		dc.w $001f
		dc.w $0001
_28_ED_USER:
		dc.w $000e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED03
		dc.w $0000
		dc.w $0007
		dc.w $001f
		dc.w $0001
_29_ED_USER:
		dc.w $001e
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_07
		dc.w $0001
		dc.w $0007
		dc.w $0005
		dc.w $0001
_30_ED_USER:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_08
		dc.w $0001
		dc.w $0008
		dc.w $0005
		dc.w $0001
_31_ED_USER:
		dc.w $0021
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON04
		dc.w $0008
		dc.w $000a
		dc.w $000c
		dc.w $0002
_31aED_USER:
		dc.l edus_ok
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
_33_ED_USER:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON03
		dc.w $0016
		dc.w $000a
		dc.w $000c
		dc.w $0002
_33aED_USER:
		dc.l ed_abort
		dc.w $0000
		dc.w $0000
		dc.w $8020
		dc.w $8841
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
sm:
		dc.w $0000
		dc.w $0000
		dc.l edus_ok
		dc.l Aob_delete
		dc.l title
		dc.l help_title
		dc.w $0000
		dc.w $0000
