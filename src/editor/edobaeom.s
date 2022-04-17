		.text

edao_pal:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a2
		ori.w      #0x0004,84(a2)
		movea.l    (a2),a3
		movea.l    (a3),a0
		movea.l    WI_PALETTE+8,a1
		jsr        (a1)
		andi.w     #0xFFFB,84(a2)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

edao_call:
		movem.l    d3/a2-a5,-(a7)
		subq.w     #4,a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a3
		movea.l    20(a3),a4
		movea.l    576(a0),a5
		clr.w      584(a0)
		jsr        Adr_next
		move.w     d0,d3
		ble.s      edao_call_1
		ext.l      d0
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		movea.l    20(a5),a2
		lea.l      24(a2,d1.l),a2
		cmpi.w     #0x271C,22(a2)
		bne.s      edao_call_1
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
edao_call_1:
		addq.w     #4,a7
		movem.l    (a7)+,d3/a2-a5
		rts

edao_dragkey:
		movem.l    d3/a2-a4,-(a7)
		subq.w     #4,a7
		lea.l      ACSblk,a0
		movea.l    (a0),a1
		movea.l    600(a1),a2
		movea.l    20(a2),a3
		movea.l    576(a1),a4
		clr.w      584(a1)
		jsr        Adr_next
		move.w     d0,d3
		ble.s      edao_dragkey_1
		ext.l      d0
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		movea.l    20(a4),a0
		lea.l      24(a0,d1.l),a1
		move.l     a1,(a7)
		cmpi.w     #0x2723,22(a1)
		bne.s      edao_dragkey_1
		movea.l    a4,a0
		move.w     d3,d0
		jsr        Adr_del
		movea.l    (a7),a0
		move.w     18(a0),-(a7)
		lea.l      xccd2c,a1
		moveq.l    #20,d0
		movea.l    a3,a0
		jsr        Aob_printf
		addq.w     #2,a7
		move.w     490(a3),d1
		moveq.l    #20,d0
		movea.l    a2,a0
		movea.l    102(a2),a1
		jsr        (a1)
edao_dragkey_1:
		addq.w     #4,a7
		movem.l    (a7)+,d3/a2-a4
		rts

edao_ok:
		movem.l    a2-a6,-(a7)
		lea.l      -36(a7),a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    (a1),a5
		movea.l    20(a1),a2
		movea.l    (a5),a3
		ori.w      #0x0001,6(a3)
		movea.l    4(a5),a0
		movea.l    4(a0),a4
		move.w     10(a5),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		adda.l     d0,a4
		lea.l      (a7),a1
		movea.l    a2,a0
		moveq.l    #19,d0
		jsr        Aob_gettext
		move.b     (a7),d0
		beq.s      edao_ok_1
		lea.l      (a7),a0
		jsr        strupr
		lea.l      (a7),a0
		jsr        key_code
		move.w     d0,42(a4)
		tst.w      d0
		bne.s      edao_ok_2
		lea.l      (a7),a1
		lea.l      ERR_KEYCODE,a0
		jsr        alert_str
		bra.s      edao_ok_2
edao_ok_1:
		clr.w      42(a4)
edao_ok_2:
		pea.l      52(a4)
		lea.l      xccd2c,a1
		moveq.l    #20,d0
		movea.l    a2,a0
		jsr        Aob_scanf
		addq.w     #4,a7
		move.l     (a4),d0
		beq.s      edao_ok_3
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        objfree
edao_ok_3:
		lea.l      (a7),a1
		moveq.l    #3,d0
		movea.l    a2,a0
		jsr        Aob_gettext
		move.b     (a7),d0
		beq.s      edao_ok_4
		movea.l    a3,a0
		moveq.l    #0,d0
		jsr        objmalloc
		movea.l    a0,a6
		move.l     a0,(a4)
		move.l     a6,d0
		beq.s      edao_ok_5
		pea.l      xccd2f
		pea.l      4(a7)
		movea.l    a0,a1
		movea.l    a3,a0
		jsr        objname
		addq.w     #8,a7
		bra.s      edao_ok_5
edao_ok_4:
		clr.l      (a4)
edao_ok_5:
		lea.l      (a7),a1
		moveq.l    #18,d0
		movea.l    a2,a0
		jsr        Aob_gettext
		pea.l      (a7)
		clr.w      d0
		lea.l      4(a4),a1
		movea.l    a3,a0
		jsr        mod_ref
		addq.w     #4,a7
		lea.l      (a7),a1
		moveq.l    #12,d0
		movea.l    a2,a0
		jsr        Aob_gettext
		pea.l      (a7)
		moveq.l    #1,d0
		lea.l      32(a4),a1
		movea.l    a3,a0
		jsr        mod_ref
		addq.w     #4,a7
		lea.l      (a7),a1
		moveq.l    #14,d0
		movea.l    a2,a0
		jsr        Aob_gettext
		pea.l      (a7)
		moveq.l    #2,d0
		lea.l      36(a4),a1
		movea.l    a3,a0
		jsr        mod_ref
		addq.w     #4,a7
		lea.l      (a7),a1
		moveq.l    #16,d0
		movea.l    a2,a0
		jsr        Aob_gettext
		pea.l      (a7)
		clr.w      d0
		lea.l      44(a4),a1
		movea.l    a3,a0
		jsr        mod_ref
		addq.w     #4,a7
		lea.l      (a7),a1
		moveq.l    #17,d0
		movea.l    a2,a0
		jsr        Aob_gettext
		pea.l      (a7)
		clr.w      d0
		lea.l      48(a4),a1
		movea.l    a3,a0
		jsr        mod_ref
		addq.w     #4,a7
		jsr        ed_abort
		lea.l      36(a7),a7
		movem.l    (a7)+,a2-a6
		rts

edao_list:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a2
		movea.l    (a2),a0
		ori.w      #0x0004,84(a2)
		lea.l      list_reference,a3
		move.l     (a0),(a3)
		movea.l    (a0),a1
		move.l     60(a1),4(a3)
		movea.l    a3,a0
		movea.l    WI_LIST+8,a1
		jsr        (a1)
		andi.w     #0xFFFB,84(a2)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

set_aeo:
		movem.l    a2-a5,-(a7)
		lea.l      -36(a7),a7
		movea.l    a0,a4
		lea.l      sm,a5
		lea.l      -720(a5),a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      set_aeo_1
		suba.l     a0,a0
		bra        set_aeo_2
set_aeo_1:
		lea.l      ACSblk,a3
		moveq.l    #3,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #18,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #12,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #14,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		moveq.l    #16,d0
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
		moveq.l    #20,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        oe_beself
		lea.l      (a7),a1
		movea.l    (a4),a0
		jsr        set_ref
		lea.l      (a7),a1
		moveq.l    #3,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		lea.l      (a7),a1
		movea.l    4(a4),a0
		jsr        set_ref
		lea.l      (a7),a1
		moveq.l    #18,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		lea.l      (a7),a1
		movea.l    32(a4),a0
		jsr        set_ref
		lea.l      (a7),a1
		moveq.l    #12,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		lea.l      (a7),a1
		movea.l    36(a4),a0
		jsr        set_ref
		lea.l      (a7),a1
		moveq.l    #14,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		lea.l      (a7),a1
		movea.l    44(a4),a0
		jsr        set_ref
		lea.l      (a7),a1
		moveq.l    #16,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		lea.l      (a7),a1
		movea.l    48(a4),a0
		jsr        set_ref
		lea.l      (a7),a1
		moveq.l    #17,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		move.w     42(a4),d0
		jsr        key_string
		movea.l    a0,a1
		moveq.l    #19,d0
		movea.l    a2,a0
		jsr        Aob_puttext
		move.w     52(a4),-(a7)
		lea.l      xccd2c,a1
		moveq.l    #20,d0
		movea.l    a2,a0
		jsr        Aob_printf
		addq.w     #2,a7
		move.l     a2,(a5)
		movea.l    a5,a0
set_aeo_2:
		lea.l      36(a7),a7
		movem.l    (a7)+,a2-a5
		rts

	.data

ERR_KEYCODE:
		dc.b "[3][ | Unbekannter oder| falscher Tastencode | '%s'][ OK ]",0
TEXT_001:
		dc.b 'Abbruch',0
TEXT_003:
		dc.b 'OK',0
TEXT_01:
		dc.b 'Index:',0
TEXT_02:
		dc.b 'Click:',0
TEXT_03:
		dc.b 'Drag:',0
TEXT_04:
		dc.b 'UserP1:',0
TEXT_05:
		dc.b 'UserP2:',0
TEXT_06:
		dc.b ' Typ:',0
TEXT_08:
		dc.b 'Key:',0
TEXT_09:
		dc.b $00
TEXT_136:
		dc.b ' Mausindex:',0
help_title:
		dc.b 'Der AOBJECT-Editor',0
title:
		dc.b ' ERWEITERTE WERTE -',0
		dc.b $00
		dc.l TEXT_08
		dc.l TEXT_09
		dc.l TEXT_09
		dc.w $0003
		dc.w $0006
		dc.w $0001
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $0005
		dc.w $0001
A_3DBUTTON01:
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
A_3DBUTTON04:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_001
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
		dc.w $2012
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
		dc.w $9070
		dc.w $0212
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
		dc.w $2012
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
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
ED_AEO:
		dc.w $ffff
		dc.w $0001
		dc.w $001c
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON02
		dc.w $0000
		dc.w $0000
		dc.w $002c
		dc.w $000f
_01_ED_AEO:
		dc.w $0004
		dc.w $0002
		dc.w $0003
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME01
		dc.w $0001
		dc.w $0000
		dc.w $002a
		dc.w $0003
_02_ED_AEO:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_01
		dc.w $0002
		dc.w $0001
		dc.w $0006
		dc.w $0001
_03_ED_AEO:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED03
		dc.w $0009
		dc.w $0001
		dc.w $0020
		dc.w $0001
_04_ED_AEO:
		dc.w $001a
		dc.w $0005
		dc.w $0018
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME01
		dc.w $0001
		dc.w $0003
		dc.w $002a
		dc.w $0009
_05_ED_AEO:
		dc.w $0006
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_04
		dc.w $0001
		dc.w $0003
		dc.w $0007
		dc.w $0001
_06_ED_AEO:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_05
		dc.w $0001
		dc.w $0004
		dc.w $0007
		dc.w $0001
_07_ED_AEO:
		dc.w $0009
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0005
		dc.w $0000
		dc.l TEXT_02
		dc.w $0002
		dc.w $0001
		dc.w $0006
		dc.w $0001
_07aED_AEO:
		dc.l edao_list
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
_09_ED_AEO:
		dc.w $000b
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0005
		dc.w $0000
		dc.l TEXT_03
		dc.w $0003
		dc.w $0002
		dc.w $0005
		dc.w $0001
_09aED_AEO:
		dc.l edao_list
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
_11_ED_AEO:
		dc.w $0013
		dc.w $000c
		dc.w $0012
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON03
		dc.w $0009
		dc.w $0001
		dc.w $0020
		dc.w $0005
_12_ED_AEO:
		dc.w $000e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $1008
		dc.w $0000
		dc.l A_BOXED03
		dc.w $0000
		dc.w $0000
		dc.w $0020
		dc.w $0001
_12aED_AEO:
		dc.w $0000
		dc.w $0000
		dc.l edao_call
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_14_ED_AEO:
		dc.w $0010
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $1008
		dc.w $0000
		dc.l A_BOXED03
		dc.w $0000
		dc.w $0001
		dc.w $0020
		dc.w $0001
_14aED_AEO:
		dc.w $0000
		dc.w $0000
		dc.l edao_call
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_16_ED_AEO:
		dc.w $0011
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED03
		dc.w $0000
		dc.w $0002
		dc.w $0020
		dc.w $0001
_17_ED_AEO:
		dc.w $0012
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED03
		dc.w $0000
		dc.w $0003
		dc.w $0020
		dc.w $0001
_18_ED_AEO:
		dc.w $000b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0000
		dc.l A_BOXED03
		dc.w $0000
		dc.w $0004
		dc.w $0020
		dc.w $0001
_19_ED_AEO:
		dc.w $0014
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED01
		dc.w $0009
		dc.w $0007
		dc.w $000a
		dc.w $0001
_20_ED_AEO:
		dc.w $0016
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $1008
		dc.w $0010
		dc.l A_BOXED02
		dc.w $0025
		dc.w $0007
		dc.w $0002
		dc.w $0001
_20aED_AEO:
		dc.w $0000
		dc.w $0000
		dc.l edao_dragkey
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_22_ED_AEO:
		dc.w $0017
		dc.w $ffff
		dc.w $ffff
		dc.w $0015
		dc.w $0000
		dc.w $0000
		dc.l TEDINFO_01
		dc.w $0002
		dc.w $0007
		dc.w $0006
		dc.w $0001
_23_ED_AEO:
		dc.w $0018
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_06
		dc.w $0003
		dc.w $0005
		dc.w $0005
		dc.w $0001
_24_ED_AEO:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0005
		dc.w $0000
		dc.l TEXT_136
		dc.w $0019
		dc.w $0007
		dc.w $000b
		dc.w $0001
_24aED_AEO:
		dc.l edao_pal
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
_26_ED_AEO:
		dc.w $001c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON01
		dc.w $0009
		dc.w $000c
		dc.w $000c
		dc.w $0002
_26aED_AEO:
		dc.l edao_ok
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
_28_ED_AEO:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON04
		dc.w $0017
		dc.w $000c
		dc.w $000c
		dc.w $0002
_28aED_AEO:
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
		dc.l edao_ok
		dc.l Aob_delete
		dc.l title
		dc.l help_title
		dc.w $0000
		dc.w $0000
xccd2c:
		dc.b '%d',0
xccd2f:
		dc.b 'INDEX NAME',0
		.even
