		.text

editref_abort:
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        term
		rts

editref_ok:
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        acc_eref
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        term
		rts

acc_eref:
		movem.l    a2-a4,-(a7)
		lea.l      -12(a7),a7
		movea.l    (a0),a1
		movea.l    (a1),a2
		ori.w      #$0001,6(a2)
		movea.l    20(a0),a2
		lea.l      336(a2),a2
		move.l     a2,4(a7)
		movea.l    4(a1),a3
		move.w     56(a3),d0
		move.w     d0,d1
		and.w      #$FD00,d1
		move.w     #$00FF,d2
		and.w      14(a2),d2
		or.w       d2,d1
		move.w     d1,56(a3)
		moveq.l    #1,d0
		movea.l    20(a0),a2
		and.w      82(a2),d0
		beq.s      acc_eref_1
		ori.w      #$0200,56(a3)
acc_eref_1:
		movea.l    8(a1),a2
		move.l     a2,d0
		beq.w      acc_eref_2
		lea.l      8(a7),a1
		movea.l    a2,a0
		movea.l    4(a2),a4
		move.w     #$00CF,d0
		jsr        (a4)
		move.l     8(a7),d0
		ble.s      acc_eref_3
		moveq.l    #1,d0
		add.l      8(a7),d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     a0,d0
		beq.s      acc_eref_2
		movea.l    4(a3),a0
		jsr        Ax_ifree
		movea.l    (a7),a1
		move.w     #$00CE,d0
		movea.l    a2,a0
		movea.l    4(a2),a4
		jsr        (a4)
		move.l     (a7),4(a3)
		moveq.l    #1,d0
		add.l      8(a7),d0
		move.l     d0,14(a3)
		move.l     d0,10(a3)
		suba.l     a1,a1
		movea.l    a2,a0
		movea.l    4(a2),a4
		move.w     #$00D3,d0
		jsr        (a4)
		bra.s      acc_eref_2
acc_eref_3:
		movea.l    4(a3),a0
		jsr        Ax_ifree
		clr.l      4(a3)
		moveq.l    #0,d0
		move.l     d0,14(a3)
		move.l     d0,10(a3)
acc_eref_2:
		lea.l      12(a7),a7
		movem.l    (a7)+,a2-a4
		rts

rf_make:
		movem.l    a2-a4,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    4(a0),a3
		movea.l    18(a3),a4
		move.l     a4,d0
		beq.s      rf_make_1
		movea.l    a4,a0
		jsr        Awi_show
		bra        rf_make_2
rf_make_1:
		moveq.l    #12,d0
		jsr        Ax_malloc
		movea.l    a0,a2
		move.l     a2,d0
		beq        rf_make_3
		movea.l    (a7),a1
		move.l     (a1),(a0)
		move.l     4(a1),4(a2)
		clr.l      8(a2)
		lea.l      22(a3),a0
		move.l     a0,WI_REF+78
		movea.l    WI_REF+90,a1
		move.l     a0,8(a1)
		lea.l      WI_REF,a0
		jsr        Awi_create
		movea.l    a0,a4
		move.l     a4,d0
		bne.s      rf_make_4
		movea.l    a2,a0
		jsr        Ax_free
		bra.s      rf_make_3
rf_make_4:
		movea.l    (a7),a0
		movea.l    (a0),a1
		pea.l      360(a1)
		lea.l      58(a3),a1
		movea.l    a4,a0
		jsr        wi_pos
		addq.w     #4,a7
		move.l     a2,(a4)
		move.l     a4,18(a3)
		movea.l    a4,a0
		jsr        set_eref
		move.l     14(a3),d0
		ble.s      rf_make_5
		move.w     56(a3),d1
		and.w      #$0200,d1
		bne.s      rf_make_5
		movea.l    a4,a0
		jsr        ref_edit
		bra.s      rf_make_2
rf_make_5:
		movea.l    a4,a0
		movea.l    12(a4),a1
		jsr        (a1)
		tst.w      d0
		beq.s      rf_make_2
		movea.l    a4,a0
		jsr        term
rf_make_3:
		suba.l     a0,a0
		bra.s      rf_make_6
rf_make_2:
		movea.l    a4,a0
rf_make_6:
		addq.w     #4,a7
		movem.l    (a7)+,a2-a4
		rts

rf_service:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		movea.l    a1,a4
		movea.l    (a0),a3
		subq.w     #2,d0
		beq.s      rf_service_1
		sub.w      #$00CF,d0
		beq.s      rf_service_2
		subq.w     #1,d0
		beq.s      rf_service_1
		sub.w      #$263E,d0
		beq.s      rf_service_3
		bra.s      rf_service_4
rf_service_1:
		movea.l    a2,a0
		bsr        acc_eref
rf_service_2:
		movea.l    a2,a0
		jsr        term
		bra.s      rf_service_5
rf_service_3:
		movea.l    4(a3),a1
		movea.l    a2,a0
		jsr        new_name
		bra.s      rf_service_5
rf_service_4:
		movea.l    a4,a1
		move.w     d3,d0
		movea.l    a2,a0
		jsr        Awi_service
		bra.s      rf_service_6
rf_service_5:
		moveq.l    #1,d0
rf_service_6:
		movem.l    (a7)+,d3/a2-a4
		rts

set_type:
		movem.l    d3/a2-a4,-(a7)
		lea.l      -50(a7),a7
		movea.l    a0,a4
		movea.l    a1,a2
		move.w     d0,d3
		lea.l      (a7),a1
		movea.l    a2,a0
		jsr        Aob_gettext
		lea.l      (a7),a3
		bra.s      set_type_1
set_type_2:
		addq.w     #1,a3
set_type_1:
		cmpi.b     #$20,(a3)
		beq.s      set_type_2
		movea.l    a3,a1
		moveq.l    #13,d0
		movea.l    a4,a0
		jsr        Aob_puttext
		lea.l      336(a4),a4
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		lea.l      24(a2,d0.l),a0
		move.l     12(a0),12(a4)
		lea.l      50(a7),a7
		movem.l    (a7)+,d3/a2-a4
		rts

editref_choose:
		movem.l    d3/a2-a3,-(a7)
		lea.l      REF_TYPE,a2
		lea.l      ACSblk,a3
		moveq.l    #-1,d1
		moveq.l    #-1,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    600(a0),a0
		jsr        Ame_popup
		move.w     d0,d3
		tst.w      d0
		bmi.s      editref_choose_1
		ext.l      d0
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		lea.l      24(a2,d1.l),a0
		cmp.w      #$0001,d3
		beq.s      editref_choose_2
		move.w     8(a0),d2
		and.w      #$8000,d2
		beq.s      editref_choose_1
		move.w     14(a0),d1
		beq.s      editref_choose_1
editref_choose_2:
		move.w     d3,d0
		movea.l    a2,a1
		movea.l    (a3),a0
		movea.l    604(a0),a0
		bsr        set_type
		moveq.l    #-1,d1
		moveq.l    #13,d0
		movea.l    (a3),a0
		movea.l    600(a0),a0
		movea.l    (a3),a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		jsr        (a1)
editref_choose_1:
		movem.l    (a7)+,d3/a2-a3
		rts

set_eref:
		movem.l    d3/a2-a3,-(a7)
		movea.l    a0,a2
		movea.l    (a0),a3
		movea.l    4(a3),a1
		move.w     56(a1),d3
		and.w      #$00FF,d3
		tst.w      d3
		bmi.s      set_eref_1
		cmp.w      cross_type_anz,d3
		blt.s      set_eref_2
set_eref_1:
		clr.w      d3
set_eref_2:
		move.w     d3,d1
		add.w      d1,d1
		lea.l      cross_type,a0
		move.w     0(a0,d1.w),d0
		lea.l      REF_TYPE,a1
		movea.l    20(a2),a0
		bsr        set_type
		movea.l    20(a2),a0
		lea.l      72(a0),a0
		movea.l    4(a3),a1
		move.w     56(a1),d0
		and.w      #$0200,d0
		jsr        set_flag
		movem.l    (a7)+,d3/a2-a3
		rts

term:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a2
		move.w     86(a2),d0
		and.w      #$0200,d0
		bne        term_1
		ori.w      #$0300,86(a2)
		movea.l    (a0),a3
		movea.l    8(a3),a4
		move.l     a4,d0
		beq.s      term_2
		suba.l     a1,a1
		movea.l    4(a4),a5
		movea.l    a4,a0
		move.w     #$00D3,d0
		jsr        (a5)
		suba.l     a1,a1
		move.w     #$00D0,d0
		movea.l    a4,a0
		movea.l    4(a4),a5
		jsr        (a5)
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    a4,a0
		movea.l    4(a4),a5
		jsr        (a5)
term_2:
		movea.l    4(a3),a0
		clr.l      18(a0)
		move.w     86(a2),d0
		and.w      #$0800,d0
		beq.s      term_3
		lea.l      44(a2),a1
		movea.l    4(a3),a0
		lea.l      58(a0),a0
		moveq.l    #8,d0
		jsr        memcpy
		bra.s      term_4
term_3:
		moveq.l    #8,d0
		lea.l      36(a2),a1
		movea.l    4(a3),a0
		lea.l      58(a0),a0
		jsr        memcpy
term_4:
		movea.l    a3,a0
		jsr        Ax_free
		movea.l    a2,a0
		jsr        Awi_delete
term_1:
		movem.l    (a7)+,a2-a5
		rts

ref_edit:
		movem.l    d3/a2-a6,-(a7)
		lea.l      -1100(a7),a7
		move.l     a0,1096(a7)
		movea.l    (a0),a2
		movea.l    8(a2),a3
		move.l     a3,d0
		bne        ref_edit_1
		movea.l    4(a2),a4
		lea.l      22(a4),a1
		move.l     a1,1088(a7)
		movea.l    EDITOR+8,a1
		suba.l     a0,a0
		jsr        (a1)
		movea.l    a0,a3
		move.l     a0,8(a2)
		movea.l    1096(a7),a1
		move.w     #$00D0,d0
		movea.l    4(a3),a5
		movea.l    a3,a0
		jsr        (a5)
		lea.l      1024(a7),a5
		lea.l      xacb6f,a1
		move.l     a1,-(a7)
		lea.l      xacb6d,a1
		movea.l    a5,a0
		jsr        strcpy
		movea.l    1092(a7),a1
		jsr        strcat
		movea.l    (a7)+,a1
		jsr        strcat
		movea.l    a5,a1
		move.w     #$00CB,d0
		movea.l    a3,a0
		movea.l    4(a3),a6
		jsr        (a6)
		lea.l      xacb6f,a1
		move.l     a1,-(a7)
		lea.l      xacb77,a1
		movea.l    a5,a0
		jsr        strcpy
		movea.l    1092(a7),a1
		jsr        strcat
		movea.l    (a7)+,a1
		jsr        strcat
		movea.l    a5,a1
		move.w     #$00CC,d0
		movea.l    a3,a0
		movea.l    4(a3),a6
		jsr        (a6)
		movea.l    1088(a7),a1
		move.w     #$00D5,d0
		movea.l    a3,a0
		movea.l    4(a3),a5
		jsr        (a5)
		lea.l      xacb7b,a1
		move.w     #$00C9,d0
		movea.l    a3,a0
		movea.l    4(a3),a5
		jsr        (a5)
		move.l     14(a4),d0
		ble.s      ref_edit_2
		movea.l    4(a4),a1
		movea.l    a3,a0
		movea.l    4(a3),a5
		move.w     #$00CD,d0
		jsr        (a5)
		bra        ref_edit_3
ref_edit_2:
		movea.l    (a2),a0
		move.w     526(a0),d0
		tst.w      d0
		beq.s      ref_edit_4
		subq.w     #1,d0
		beq.s      ref_edit_5
		bra.s      ref_edit_6
ref_edit_4:
		move.w     56(a4),d0
		and.w      #$0500,d0
		cmp.w      #$0100,d0
		beq.s      ref_edit_7
		lea.l      xacb7d,a1
		movea.l    a3,a0
		movea.l    4(a3),a2
		move.w     #$00CD,d0
		jsr        (a2)
ref_edit_7:
		lea.l      c_type,a5
		bra.s      ref_edit_6
ref_edit_5:
		lea.l      p_type,a5
ref_edit_6:
		movea.l    ACSblk,a0
		movea.l    604(a0),a1
		lea.l      336(a1),a1
		move.l     a1,1092(a7)
		move.w     14(a1),d3
		pea.l      22(a4)
		pea.l      22(a4)
		pea.l      22(a4)
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a5,d0.l),a1
		lea.l      12(a7),a0
		jsr        sprintf
		lea.l      12(a7),a7
		lea.l      (a7),a1
		move.w     #$00CD,d0
		movea.l    a3,a0
		movea.l    4(a3),a2
		jsr        (a2)
ref_edit_3:
		suba.l     a1,a1
		move.w     #$00D4,d0
		movea.l    a3,a0
		movea.l    4(a3),a2
		jsr        (a2)
		suba.l     a1,a1
		move.w     #$00D3,d0
		movea.l    a3,a0
		movea.l    4(a3),a2
		jsr        (a2)
ref_edit_1:
		movea.l    a3,a0
		jsr        Awi_show
		lea.l      1100(a7),a7
		movem.l    (a7)+,d3/a2-a6
		rts

editref_edit:
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		bsr        ref_edit
		rts

	.data


BUBBLE_01:
		dc.b 'Die Žnderungen werden bernommen.',0
BUBBLE_02:
		dc.b 'Die Žnderungen werden verworfen.',0
BUBBLE_03:
		dc.b 'Der Editor wird aufgerufen, um die Routine zu bearbeiten.',0
BUBBLE_04:
		dc.b 'Die Routine wird extern definiert, also u.U. in einem anderen Modul.',0
BUBBLE_05:
		dc.b 'In diesem Popup wird der Typ der Routine angegeben.',0
TEXT_002:
		dc.b 0
TEXT_003:
		dc.b 'OK',0
TEXT_004:
		dc.b 'Abbruch',0
TEXT_01:
		dc.b ' Closed',0
TEXT_02:
		dc.b 'Typ:',0
TEXT_03:
		dc.b 'GEMScript',0
TEXT_04:
		dc.b '  Iconify',0
TEXT_05:
		dc.b ' Fulled',0
TEXT_06:
		dc.b ' Arrowed',0
TEXT_07:
		dc.b ' Hslid',0
TEXT_08:
		dc.b ' Vslid',0
TEXT_09:
		dc.b ' Moved',0
TEXT_10:
		dc.b ' Sized',0
TEXT_11:
		dc.b ' Referenz-Editor ',0
TEXT_12:
		dc.b '  Uniconify',0
TEXT_13:
		dc.b '  GEMScript',0
TEXT_14:
		dc.b 'Edit',0
TEXT_15:
		dc.b 'extern',0
TEXT_16:
		dc.b 'REFERENZ',0
TEXT_17:
		dc.b '  Objekt   '
		dc.w $0300
TEXT_174:
		dc.b '  UOservice',0
TEXT_18:
		dc.b '  Userdef  '
		dc.b $03
		dc.b 0
TEXT_19:
		dc.b '  kein Typ',0
TEXT_20:
		dc.b '  Fenster  '
		dc.b $03
		dc.b 0
TEXT_21:
		dc.b '  DrawCode',0
TEXT_22:
		dc.b '  UO-Service',0
TEXT_23:
		dc.b '  Closed',0
TEXT_24:
		dc.b '  System   '
		dc.b $03
		dc.b 0
TEXT_25:
		dc.b '  Fulled',0
TEXT_26:
		dc.b '  Arrowed',0
TEXT_27:
		dc.b '  V-Slide',0
TEXT_28:
		dc.b '  Change',0
TEXT_29:
		dc.b '  Moved',0
TEXT_30:
		dc.b '  Sized',0
TEXT_31:
		dc.b '  H-Slide',0
TEXT_32:
		dc.b '  ACSinit',0
TEXT_33:
		dc.b '  ACSmessage',0
TEXT_34:
		dc.b '  ACSkey',0
TEXT_35:
		dc.b '  ACSbutton',0
TEXT_357:
		dc.b '  Drag',0
TEXT_358:
		dc.b '  Keys',0
TEXT_359:
		dc.b '  Service',0
TEXT_36:
		dc.b '  ACSGEMScript',0
TEXT_360:
		dc.b '  Create',0
TEXT_364:
		dc.b '  Click',0
TEXT_365:
		dc.b '  Open',0
TEXT_366:
		dc.b '  Topped',0
TEXT_367:
		dc.b '  Userdef',0
TEXT_37:
		dc.b '  ACSinit0',0
TEXT_370:
		dc.b '  Init',0
TEXT_371:
		dc.b '  Changed',0
TEXT_372:
		dc.b '  Redraw',0
TEXT_38:
		dc.b '  ACSterm',0
TEXT_39:
		dc.b '  ACSaboutme',0
TEXT_40:
		dc.b '  ACSclose',0
TEXT_41:
		dc.b '  ACSmproto',0
TEXT_42:
		dc.b '  ACStimer',0
TEXT_43:
		dc.b '  ACSmouse',0
TEXT_44:
		dc.b '  ACSwikey',0
		dc.b $00
DATAS_05:
		dc.w $0000
		dc.w $0000
		dc.w $020e
		dc.w $0001
		dc.w $0000
		dc.w $0003
		dc.w $8000
		dc.w $0006
		dc.w $c000
		dc.w $000c
		dc.w $6000
		dc.w $0018
		dc.w $3000
		dc.w $0031
		dc.w $1800
		dc.w $0062
		dc.w $8c00
		dc.w $00c4
		dc.w $4600
		dc.w $0188
		dc.w $2300
		dc.w $0310
		dc.w $1180
		dc.w $0790
		dc.w $20c0
		dc.w $0fc8
		dc.w $4860
		dc.w $1f84
		dc.w $9830
		dc.w $3703
		dc.w $3218
		dc.w $6200
		dc.w $640c
		dc.w $c000
		dc.w $c906
		dc.w $6200
		dc.w $920c
		dc.w $3101
		dc.w $f418
		dc.w $1886
		dc.w $ac04
		dc.w $0c4d
		dc.w $f404
		dc.w $062a
		dc.w $3804
		dc.w $031f
		dc.w $fc04
		dc.w $018b
		dc.w $e804
		dc.w $00c5
		dc.w $5404
		dc.w $0063
		dc.w $a804
		dc.w $0031
		dc.w $fc04
		dc.w $0018
		dc.w $0c04
		dc.w $000c
		dc.w $1bf8
		dc.w $0006
		dc.w $3000
		dc.w $0003
		dc.w $6000
		dc.w $0001
		dc.w $c000
		dc.w $0000
		dc.w $8000
		dc.w $0001
		dc.w $0000
		dc.w $0003
		dc.w $8000
		dc.w $0006
		dc.w $c000
		dc.w $000c
		dc.w $6000
		dc.w $0018
		dc.w $3000
		dc.w $0031
		dc.w $1800
		dc.w $0063
		dc.w $8c00
		dc.w $00c6
		dc.w $c600
		dc.w $018d
		dc.w $6300
		dc.w $031a
		dc.w $b180
		dc.w $0795
		dc.w $60c0
		dc.w $0fca
		dc.w $c860
		dc.w $1f85
		dc.w $9830
		dc.w $3703
		dc.w $3218
		dc.w $6200
		dc.w $640c
		dc.w $c000
		dc.w $c906
		dc.w $6200
		dc.w $920c
		dc.w $3101
		dc.w $f418
		dc.w $1886
		dc.w $ac04
		dc.w $0c4d
		dc.w $f404
		dc.w $062a
		dc.w $3804
		dc.w $031f
		dc.w $fc04
		dc.w $018b
		dc.w $e804
		dc.w $00c5
		dc.w $5404
		dc.w $0063
		dc.w $a804
		dc.w $0031
		dc.w $fc04
		dc.w $0018
		dc.w $0c04
		dc.w $000c
		dc.w $1bf8
		dc.w $0006
		dc.w $3000
		dc.w $0003
		dc.w $6000
		dc.w $0001
		dc.w $c000
		dc.w $0000
		dc.w $8000
		dc.w $0001
		dc.w $0000
		dc.w $0003
		dc.w $8000
		dc.w $0006
		dc.w $c000
		dc.w $000c
		dc.w $6000
		dc.w $0018
		dc.w $3000
		dc.w $0031
		dc.w $1800
		dc.w $0063
		dc.w $8c00
		dc.w $00c7
		dc.w $c600
		dc.w $018f
		dc.w $e300
		dc.w $031f
		dc.w $f180
		dc.w $079f
		dc.w $e0c0
		dc.w $0fcf
		dc.w $c860
		dc.w $1f87
		dc.w $9830
		dc.w $3703
		dc.w $3218
		dc.w $6200
		dc.w $640c
		dc.w $c000
		dc.w $c906
		dc.w $6200
		dc.w $920c
		dc.w $3101
		dc.w $f418
		dc.w $1886
		dc.w $0ffc
		dc.w $0c4d
		dc.w $e7fc
		dc.w $062a
		dc.w $33fc
		dc.w $031f
		dc.w $fbfc
		dc.w $0189
		dc.w $e3fc
		dc.w $00c4
		dc.w $03fc
		dc.w $0063
		dc.w $03fc
		dc.w $0031
		dc.w $fffc
		dc.w $0018
		dc.w $0ffc
		dc.w $000c
		dc.w $1bf8
		dc.w $0006
		dc.w $3000
		dc.w $0003
		dc.w $6000
		dc.w $0001
		dc.w $c000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0002
		dc.w $8000
		dc.w $0004
		dc.w $4000
		dc.w $0008
		dc.w $2000
		dc.w $0011
		dc.w $1000
		dc.w $0022
		dc.w $8800
		dc.w $0044
		dc.w $4400
		dc.w $0088
		dc.w $2200
		dc.w $0110
		dc.w $1100
		dc.w $0390
		dc.w $2080
		dc.w $07c8
		dc.w $4840
		dc.w $0f84
		dc.w $9820
		dc.w $1703
		dc.w $3210
		dc.w $2200
		dc.w $6408
		dc.w $4000
		dc.w $c904
		dc.w $2200
		dc.w $9208
		dc.w $1101
		dc.w $f410
		dc.w $0886
		dc.w $0c00
		dc.w $044d
		dc.w $e400
		dc.w $022a
		dc.w $3000
		dc.w $011f
		dc.w $f800
		dc.w $0089
		dc.w $e000
		dc.w $0044
		dc.w $0000
		dc.w $0023
		dc.w $0000
		dc.w $0011
		dc.w $fc00
		dc.w $0008
		dc.w $0800
		dc.w $0004
		dc.w $1000
		dc.w $0002
		dc.w $2000
		dc.w $0001
		dc.w $4000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
DATAS_06:
		dc.w $0001
		dc.w $0000
		dc.w $0003
		dc.w $8000
		dc.w $0007
		dc.w $c000
		dc.w $000f
		dc.w $e000
		dc.w $001f
		dc.w $f000
		dc.w $003f
		dc.w $f800
		dc.w $007f
		dc.w $fc00
		dc.w $00ff
		dc.w $fe00
		dc.w $01ff
		dc.w $ff00
		dc.w $03ff
		dc.w $ff80
		dc.w $07ff
		dc.w $ffc0
		dc.w $0fff
		dc.w $ffe0
		dc.w $1fff
		dc.w $fff0
		dc.w $3fff
		dc.w $fff8
		dc.w $7fff
		dc.w $fffc
		dc.w $ffff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffc
		dc.w $3fff
		dc.w $fff8
		dc.w $1fff
		dc.w $fffc
		dc.w $0fff
		dc.w $fffc
		dc.w $07ff
		dc.w $fffc
		dc.w $03ff
		dc.w $fffc
		dc.w $01ff
		dc.w $fffc
		dc.w $00ff
		dc.w $fffc
		dc.w $007f
		dc.w $fffc
		dc.w $003f
		dc.w $fffc
		dc.w $001f
		dc.w $fffc
		dc.w $000f
		dc.w $fbf8
		dc.w $0007
		dc.w $f000
		dc.w $0003
		dc.w $e000
		dc.w $0001
		dc.w $c000
		dc.w $0000
		dc.w $8000
A_3DBUTTON01:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_19
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
		dc.l TEXT_14
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_03
		dc.w $0000
		dc.w $0000
A_3DBUTTON03:
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
		dc.l TEXT_003
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_01
		dc.w $0000
		dc.w $0000
A_3DBUTTON05:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
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
A_3DBUTTON06:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_17
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
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_004
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_02
		dc.w $0000
		dc.w $0000
A_3DBUTTON08:
		dc.l A_3Dbutton
		dc.w $09f1
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
A_3DBUTTON09:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_357
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
		dc.l TEXT_364
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
		dc.l TEXT_21
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
		dc.l TEXT_22
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
		dc.l TEXT_370
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
		dc.l TEXT_365
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
		dc.l TEXT_360
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
		dc.l TEXT_359
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
		dc.l TEXT_358
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
		dc.l TEXT_04
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
		dc.l TEXT_372
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
		dc.l TEXT_366
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
		dc.l TEXT_23
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
		dc.l TEXT_25
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
		dc.l TEXT_26
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON24:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_27
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
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_28
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
		dc.l TEXT_29
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
		dc.l TEXT_30
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
		dc.l TEXT_31
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
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_05
		dc.w $0000
		dc.w $0000
A_3DBUTTON30:
		dc.l A_3Dbutton
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_12
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
		dc.l TEXT_13
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
		dc.l TEXT_24
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
		dc.w $09f1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_32
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
		dc.l TEXT_33
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
		dc.l TEXT_34
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
		dc.l TEXT_35
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
		dc.l TEXT_36
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
		dc.l TEXT_37
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
		dc.l TEXT_38
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
		dc.l TEXT_39
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
		dc.l TEXT_40
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
		dc.l TEXT_41
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
		dc.l TEXT_42
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
		dc.l TEXT_43
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
		dc.l TEXT_44
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
A_CHECKBOX01:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_15
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_04
		dc.w $0000
		dc.w $0000
_C4_IC_REF:
		dc.w $0004
		dc.l DATAS_05+6
		dc.l DATAS_06
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_MSK_IC_REF:
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0003
		dc.w $8000
		dc.w $0007
		dc.w $c000
		dc.w $000f
		dc.w $e000
		dc.w $001f
		dc.w $f000
		dc.w $003e
		dc.w $f800
		dc.w $007d
		dc.w $7c00
		dc.w $00fa
		dc.w $be00
		dc.w $01f5
		dc.w $5f00
		dc.w $03fa
		dc.w $bf80
		dc.w $07fd
		dc.w $7fc0
		dc.w $0ffe
		dc.w $ffe0
		dc.w $1fff
		dc.w $fff0
		dc.w $3fff
		dc.w $fff8
		dc.w $7fff
		dc.w $fffc
		dc.w $3fff
		dc.w $fffe
		dc.w $1fff
		dc.w $fffc
		dc.w $0fff
		dc.w $fffe
		dc.w $07ff
		dc.w $fffe
		dc.w $03ff
		dc.w $fffe
		dc.w $01ff
		dc.w $fffe
		dc.w $00ff
		dc.w $fffe
		dc.w $007f
		dc.w $fffe
		dc.w $003f
		dc.w $fffe
		dc.w $001f
		dc.w $fffe
		dc.w $000f
		dc.w $fbfe
		dc.w $0007
		dc.w $f000
		dc.w $0003
		dc.w $e000
		dc.w $0001
		dc.w $c000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
_DAT_IC_REF:
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0002
		dc.w $8000
		dc.w $0004
		dc.w $4000
		dc.w $0008
		dc.w $2000
		dc.w $0011
		dc.w $1000
		dc.w $0022
		dc.w $8800
		dc.w $0045
		dc.w $4400
		dc.w $008a
		dc.w $a200
		dc.w $0115
		dc.w $5100
		dc.w $039a
		dc.w $a080
		dc.w $07cd
		dc.w $4840
		dc.w $0f86
		dc.w $9820
		dc.w $1703
		dc.w $3210
		dc.w $2200
		dc.w $6408
		dc.w $4000
		dc.w $c904
		dc.w $2200
		dc.w $0202
		dc.w $1101
		dc.w $f404
		dc.w $0886
		dc.w $0bfe
		dc.w $044d
		dc.w $e600
		dc.w $022a
		dc.w $3200
		dc.w $011f
		dc.w $fa00
		dc.w $0089
		dc.w $e200
		dc.w $0044
		dc.w $0200
		dc.w $0023
		dc.w $0200
		dc.w $0011
		dc.w $fe00
		dc.w $0008
		dc.w $0bfe
		dc.w $0004
		dc.w $1000
		dc.w $0002
		dc.w $2000
		dc.w $0001
		dc.w $4000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
IC_REF:
		dc.l _MSK_IC_REF
		dc.l _DAT_IC_REF
		dc.l TEXT_16
		dc.w $1000
		dc.w $0000
		dc.w $0000
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $0020
		dc.w $0000
		dc.w $0020
		dc.w $0048
		dc.w $0008
		dc.l _C4_IC_REF
	.globl REF_TYPE
REF_TYPE:
		dc.w $ffff
		dc.w $0001
		dc.w $0056
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $00ff
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $000d
		dc.w $0005
_01_REF_TYPE:
		dc.w $0022
		dc.w $0002
		dc.w $0020
		dc.w $0014
		dc.w $0080
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0000
		dc.w $0003
		dc.w $0014
		dc.w $0008
_02_REF_TYPE:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_365
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0001
_02aREF_TYPE:
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
_04_REF_TYPE:
		dc.w $0006
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_01
		dc.w $000a
		dc.w $0000
		dc.w $000a
		dc.w $0001
_04aREF_TYPE:
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
_06_REF_TYPE:
		dc.w $0008
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_360
		dc.w $0000
		dc.w $0001
		dc.w $000a
		dc.w $0001
_06aREF_TYPE:
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
_08_REF_TYPE:
		dc.w $000a
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_05
		dc.w $000a
		dc.w $0001
		dc.w $000a
		dc.w $0001
_08aREF_TYPE:
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
_10_REF_TYPE:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_359
		dc.w $0000
		dc.w $0002
		dc.w $000a
		dc.w $0001
_10aREF_TYPE:
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
_12_REF_TYPE:
		dc.w $000e
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_06
		dc.w $000a
		dc.w $0002
		dc.w $000a
		dc.w $0001
_12aREF_TYPE:
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
_14_REF_TYPE:
		dc.w $0010
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_370
		dc.w $0000
		dc.w $0003
		dc.w $000a
		dc.w $0001
_14aREF_TYPE:
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
_16_REF_TYPE:
		dc.w $0012
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_07
		dc.w $000a
		dc.w $0003
		dc.w $000a
		dc.w $0001
_16aREF_TYPE:
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
_18_REF_TYPE:
		dc.w $0014
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_358
		dc.w $0000
		dc.w $0004
		dc.w $000a
		dc.w $0001
_18aREF_TYPE:
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
_20_REF_TYPE:
		dc.w $0016
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_08
		dc.w $000a
		dc.w $0004
		dc.w $000a
		dc.w $0001
_20aREF_TYPE:
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
_22_REF_TYPE:
		dc.w $0018
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_371
		dc.w $0000
		dc.w $0005
		dc.w $000a
		dc.w $0001
_22aREF_TYPE:
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
_24_REF_TYPE:
		dc.w $001a
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_09
		dc.w $000a
		dc.w $0005
		dc.w $000a
		dc.w $0001
_24aREF_TYPE:
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
_26_REF_TYPE:
		dc.w $001c
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_372
		dc.w $0000
		dc.w $0006
		dc.w $000a
		dc.w $0001
_26aREF_TYPE:
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
_28_REF_TYPE:
		dc.w $001e
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_10
		dc.w $000a
		dc.w $0006
		dc.w $000a
		dc.w $0001
_28aREF_TYPE:
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
_30_REF_TYPE:
		dc.w $0020
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_366
		dc.w $0000
		dc.w $0007
		dc.w $000a
		dc.w $0001
_30aREF_TYPE:
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
_32_REF_TYPE:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_03
		dc.w $000b
		dc.w $0007
		dc.w $0009
		dc.w $0001
_32aREF_TYPE:
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
_34_REF_TYPE:
		dc.w $002c
		dc.w $0023
		dc.w $0025
		dc.w $0014
		dc.w $0080
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0000
		dc.w $0001
		dc.w $0009
		dc.w $0002
_35_REF_TYPE:
		dc.w $0025
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_364
		dc.w $0000
		dc.w $0000
		dc.w $0009
		dc.w $0001
_35aREF_TYPE:
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
_37_REF_TYPE:
		dc.w $0022
		dc.w $0027
		dc.w $0027
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_357
		dc.w $0000
		dc.w $0001
		dc.w $0009
		dc.w $0001
_37aREF_TYPE:
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
_39_REF_TYPE:
		dc.w $0025
		dc.w $0028
		dc.w $002a
		dc.w $0014
		dc.w $0080
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0000
		dc.w $0000
		dc.w $000d
		dc.w $0002
_40_REF_TYPE:
		dc.w $002a
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_367
		dc.w $0000
		dc.w $0000
		dc.w $000d
		dc.w $0001
_40aREF_TYPE:
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
_42_REF_TYPE:
		dc.w $0027
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0001
		dc.w $0000
		dc.l TEXT_174
		dc.w $0000
		dc.w $0001
		dc.w $000d
		dc.w $0001
_42aREF_TYPE:
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
_44_REF_TYPE:
		dc.w $002e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON01
		dc.w $0000
		dc.w $0000
		dc.w $000d
		dc.w $0001
_44aREF_TYPE:
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
_46_REF_TYPE:
		dc.w $0034
		dc.w $002f
		dc.w $002f
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON06
		dc.w $0000
		dc.w $0001
		dc.w $000d
		dc.w $0001
_47_REF_TYPE:
		dc.w $002e
		dc.w $0030
		dc.w $0032
		dc.w $0014
		dc.w $0080
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0000
		dc.w $0000
		dc.w $0009
		dc.w $0002
_48_REF_TYPE:
		dc.w $0032
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON10
		dc.w $0000
		dc.w $0000
		dc.w $0009
		dc.w $0001
_48aREF_TYPE:
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
_50_REF_TYPE:
		dc.w $002f
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON09
		dc.w $0000
		dc.w $0001
		dc.w $0009
		dc.w $0001
_50aREF_TYPE:
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
_52_REF_TYPE:
		dc.w $0050
		dc.w $0035
		dc.w $0035
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON32
		dc.w $0000
		dc.w $0004
		dc.w $000d
		dc.w $0001
_53_REF_TYPE:
		dc.w $0034
		dc.w $0036
		dc.w $004e
		dc.w $0014
		dc.w $0080
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0000
		dc.w $0000
		dc.w $000f
		dc.w $000d
_54_REF_TYPE:
		dc.w $0038
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON38
		dc.w $0000
		dc.w $0000
		dc.w $000f
		dc.w $0001
_54aREF_TYPE:
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
_56_REF_TYPE:
		dc.w $003a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON33
		dc.w $0000
		dc.w $0001
		dc.w $000f
		dc.w $0001
_56aREF_TYPE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $001a
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_58_REF_TYPE:
		dc.w $003c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON39
		dc.w $0000
		dc.w $0002
		dc.w $000f
		dc.w $0001
_58aREF_TYPE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $001b
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_60_REF_TYPE:
		dc.w $003e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON40
		dc.w $0000
		dc.w $0003
		dc.w $000f
		dc.w $0001
_60aREF_TYPE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_62_REF_TYPE:
		dc.w $0040
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON41
		dc.w $0000
		dc.w $0004
		dc.w $000f
		dc.w $0001
_62aREF_TYPE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $001d
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_64_REF_TYPE:
		dc.w $0042
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON34
		dc.w $0000
		dc.w $0005
		dc.w $000f
		dc.w $0001
_64aREF_TYPE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $001e
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_66_REF_TYPE:
		dc.w $0044
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON42
		dc.w $0000
		dc.w $0006
		dc.w $000f
		dc.w $0001
_66aREF_TYPE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $001f
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_68_REF_TYPE:
		dc.w $0046
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON43
		dc.w $0000
		dc.w $0007
		dc.w $000f
		dc.w $0001
_68aREF_TYPE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0020
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_70_REF_TYPE:
		dc.w $0048
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON35
		dc.w $0000
		dc.w $0008
		dc.w $000f
		dc.w $0001
_70aREF_TYPE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0021
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_72_REF_TYPE:
		dc.w $004a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON36
		dc.w $0000
		dc.w $0009
		dc.w $000f
		dc.w $0001
_72aREF_TYPE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0022
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_74_REF_TYPE:
		dc.w $004c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON44
		dc.w $0000
		dc.w $000a
		dc.w $000f
		dc.w $0001
_74aREF_TYPE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0023
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_76_REF_TYPE:
		dc.w $004e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON45
		dc.w $0000
		dc.w $000b
		dc.w $000f
		dc.w $0001
_76aREF_TYPE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0024
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_78_REF_TYPE:
		dc.w $0035
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON37
		dc.w $0000
		dc.w $000c
		dc.w $000f
		dc.w $0001
_78aREF_TYPE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0025
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_80_REF_TYPE:
		dc.w $0056
		dc.w $0051
		dc.w $0051
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON05
		dc.w $0000
		dc.w $0002
		dc.w $000d
		dc.w $0001
_81_REF_TYPE:
		dc.w $0050
		dc.w $0052
		dc.w $0054
		dc.w $0014
		dc.w $0080
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0000
		dc.w $0000
		dc.w $000e
		dc.w $0002
_82_REF_TYPE:
		dc.w $0054
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l A_3DBUTTON11
		dc.w $0000
		dc.w $0000
		dc.w $000e
		dc.w $0001
_82aREF_TYPE:
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
_84_REF_TYPE:
		dc.w $0051
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l A_3DBUTTON12
		dc.w $0000
		dc.w $0001
		dc.w $000e
		dc.w $0001
_84aREF_TYPE:
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
_86_REF_TYPE:
		dc.w $0000
		dc.w $0057
		dc.w $0057
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON08
		dc.w $0000
		dc.w $0003
		dc.w $000d
		dc.w $0001
_87_REF_TYPE:
		dc.w $0056
		dc.w $0058
		dc.w $007a
		dc.w $0014
		dc.w $0080
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0000
		dc.w $0000
		dc.w $000c
		dc.w $0012
_88_REF_TYPE:
		dc.w $005a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON14
		dc.w $0000
		dc.w $0000
		dc.w $000c
		dc.w $0001
_88aREF_TYPE:
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
_90_REF_TYPE:
		dc.w $005c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON15
		dc.w $0000
		dc.w $0001
		dc.w $000c
		dc.w $0001
_90aREF_TYPE:
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
_92_REF_TYPE:
		dc.w $005e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON16
		dc.w $0000
		dc.w $0002
		dc.w $000c
		dc.w $0001
_92aREF_TYPE:
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
_94_REF_TYPE:
		dc.w $0060
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON13
		dc.w $0000
		dc.w $0003
		dc.w $000c
		dc.w $0001
_94aREF_TYPE:
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
_96_REF_TYPE:
		dc.w $0062
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON17
		dc.w $0000
		dc.w $0004
		dc.w $000c
		dc.w $0001
_96aREF_TYPE:
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
_98_REF_TYPE:
		dc.w $0064
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON25
		dc.w $0000
		dc.w $0005
		dc.w $000c
		dc.w $0001
_98aREF_TYPE:
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
_100_REF_TYPE:
		dc.w $0066
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON19
		dc.w $0000
		dc.w $0006
		dc.w $000c
		dc.w $0001
_100aREF_TYPE:
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
_102_REF_TYPE:
		dc.w $0068
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON20
		dc.w $0000
		dc.w $0007
		dc.w $000c
		dc.w $0001
_102aREF_TYPE:
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
_104_REF_TYPE:
		dc.w $006a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON21
		dc.w $0000
		dc.w $0008
		dc.w $000c
		dc.w $0001
_104aREF_TYPE:
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
_106_REF_TYPE:
		dc.w $006c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON22
		dc.w $0000
		dc.w $0009
		dc.w $000c
		dc.w $0001
_106aREF_TYPE:
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
_108_REF_TYPE:
		dc.w $006e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON23
		dc.w $0000
		dc.w $000a
		dc.w $000c
		dc.w $0001
_108aREF_TYPE:
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
_110_REF_TYPE:
		dc.w $0070
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON28
		dc.w $0000
		dc.w $000b
		dc.w $000c
		dc.w $0001
_110aREF_TYPE:
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
_112_REF_TYPE:
		dc.w $0072
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON24
		dc.w $0000
		dc.w $000c
		dc.w $000c
		dc.w $0001
_112aREF_TYPE:
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
_114_REF_TYPE:
		dc.w $0074
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON26
		dc.w $0000
		dc.w $000d
		dc.w $000c
		dc.w $0001
_114aREF_TYPE:
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
_116_REF_TYPE:
		dc.w $0076
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON27
		dc.w $0000
		dc.w $000e
		dc.w $000c
		dc.w $0001
_116aREF_TYPE:
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
_118_REF_TYPE:
		dc.w $0078
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON18
		dc.w $0000
		dc.w $000f
		dc.w $000c
		dc.w $0001
_118aREF_TYPE:
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
_120_REF_TYPE:
		dc.w $007a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON30
		dc.w $0000
		dc.w $0010
		dc.w $000c
		dc.w $0001
_120aREF_TYPE:
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
_122_REF_TYPE:
		dc.w $0057
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0000
		dc.l A_3DBUTTON31
		dc.w $0000
		dc.w $0011
		dc.w $000c
		dc.w $0001
_122aREF_TYPE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8020
		dc.w $0000
		dc.w $0000
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl EDIT_REF
EDIT_REF:
		dc.w $ffff
		dc.w $0001
		dc.w $000b
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON03
		dc.w $0000
		dc.w $0000
		dc.w $0026
		dc.w $0006
_01_EDIT_REF:
		dc.w $0003
		dc.w $0002
		dc.w $0002
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_02
		dc.w $0002
		dc.w $0001
		dc.w $0005
		dc.w $0001
_02_EDIT_REF:
		dc.w $0001
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
_03_EDIT_REF:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX01
		dc.w $001a
		dc.w $0001
		dc.w $0009
		dc.w $0001
_03aEDIT_REF:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8858
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_05_EDIT_REF:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0010
		dc.l A_3DBUTTON02
		dc.w $0002
		dc.w $0003
		dc.w $000a
		dc.w $0002
_05aEDIT_REF:
		dc.l editref_edit
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8845
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_07_EDIT_REF:
		dc.w $0009
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON04
		dc.w $000e
		dc.w $0003
		dc.w $000a
		dc.w $0002
_07aEDIT_REF:
		dc.l editref_ok
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
_09_EDIT_REF:
		dc.w $000b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON07
		dc.w $001a
		dc.w $0003
		dc.w $000a
		dc.w $0002
_09aEDIT_REF:
		dc.l editref_abort
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
_11_EDIT_REF:
		dc.w $0000
		dc.w $000d
		dc.w $000d
		dc.w $0014
		dc.w $0040
		dc.w $0020
		dc.w $00ff
		dc.w $1101
		dc.w $0008
		dc.w $0001
		dc.w $000e
		dc.w $0001
_11aEDIT_REF:
		dc.l editref_choose
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
_13_EDIT_REF:
		dc.w $000b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_3DBUTTON29
		dc.w $0000
		dc.w $0000
		dc.w $000e
		dc.w $0001
_13aEDIT_REF:
		dc.w $0000
		dc.w $0000
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
	.globl WI_REF
WI_REF:
		dc.w $0000
		dc.w $0000
		dc.l rf_service
		dc.l rf_make
		dc.l Awi_open
		dc.l Awi_init
		dc.l EDIT_REF
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $601f
		dc.w $0000
		dc.w $0000
		dc.w $0063
		dc.w $0063
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $fcf8
		dc.l TEXT_11
		dc.l TEXT_002
		dc.w $2710
		dc.w $0100
		dc.w $0000
		dc.w $ffff
		dc.l IC_REF
		dc.w $0000
		dc.w $0000
		dc.l Awi_keys
		dc.l Awi_obchange
		dc.l Awi_redraw
		dc.l Awi_topped
		dc.l Awi_closed
		dc.l Awi_fulled
		dc.l Awi_arrowed
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l Awi_gemscript
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl cross_type
cross_type:
		dc.w $002c
		dc.w $0030
		dc.w $0032
		dc.w $0052
		dc.w $0054
		dc.w $002c
		dc.w $0058
		dc.w $005a
		dc.w $005e
		dc.w $0060
		dc.w $0062
		dc.w $0064
		dc.w $0066
		dc.w $002c
		dc.w $0068
		dc.w $006c
		dc.w $006e
		dc.w $0070
		dc.w $0072
		dc.w $0074
		dc.w $006a
		dc.w $005c
		dc.w $0076
		dc.w $0078
		dc.w $007a
		dc.w $0036
		dc.w $0038
		dc.w $003a
		dc.w $003c
		dc.w $003e
		dc.w $0040
		dc.w $0042
		dc.w $0044
		dc.w $0046
		dc.w $0048
		dc.w $004a
		dc.w $004c
		dc.w $004e
cross_type_anz:
		dc.w $0026
p_type:
		dc.l xab0ba
		dc.l xab0f5
		dc.l xab127
		dc.l xab158
		dc.l xab1d8
		dc.l xab0ba
		dc.l xab259
		dc.l xab2b6
		dc.l xab347
		dc.l xab3a4
		dc.l xab42f
		dc.l xab492
		dc.l xab4ed
		dc.l xab0ba
		dc.l xab538
		dc.l xab583
		dc.l xab6a0
		dc.l xab6f9
		dc.l xab752
		dc.l xab7ad
		dc.l xab808
		dc.l xab852
		dc.l xab9cb
		dc.l xaba3c
		dc.l xabaef
		dc.l xabb33
		dc.l xabb69
		dc.l xabb9b
		dc.l xabbcd
		dc.l xabc23
		dc.l xabc78
		dc.l xabcaa
		dc.l xabcf5
		dc.l xabd46
		dc.l xabd77
		dc.l xabdc9
c_type:
		dc.l xabe66
		dc.l xabe9f
		dc.l xabecf
		dc.l xabefe
		dc.l xabf5c
		dc.l xabfc8
		dc.l xac001
		dc.l xac04b
		dc.l xac0e2
		dc.l xac12d
		dc.l xac1a8
		dc.l xac204
		dc.l xac252
		dc.l xabe66
		dc.l xac293
		dc.l xac2d4
		dc.l xac447
		dc.l xac493
		dc.l xac4df
		dc.l xac52c
		dc.l xac579
		dc.l xac5ba
		dc.l xac6a9
		dc.l xac716
		dc.l xac777
		dc.l xac818
		dc.l xac818
		dc.l xac85c
		dc.l xac897
		dc.l xac8ce
		dc.l xac905
		dc.l xac948
		dc.l xac98a
		dc.l xac9c1
		dc.l xaca0a
		dc.l xaca5a
		dc.l xaca90
		dc.l xacae0
xab0ba:
		dc.b 'Procedure %s;',$0d,$0a,'{ Unkown type of routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
xab0f5:
		dc.b 'Procedure %s;',$0d,$0a,'{ Click routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
xab127:
		dc.b 'Procedure %s;',$0d,$0a,'{ Drag routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
xab158:
		dc.b 'Function %s (dummy1, dummy2: Pointer; pb: PARMBLKPtr): Integer;',$0d,$0a,'{ USERDEF routine }',$0d,$0a,'Begin',$0d,$0a,$09,'%s := pb^.pb_currstate;',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
xab1d8:
		dc.b 'Function %s (entry: ACSOBJECTPtr; task: Integer; in_out: Pointer): Boolean;',$0d,$0a,'{ USERDEF service }',$0d,$0a,'Begin',$0d,$0a,$09,'%s := FALSE;',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
xab259:
		dc.b 'Function %s (wind: AwindowPtr): Integer;',$0d,$0a,'{ wind.open routine }',$0d,$0a,'Begin',$0d,$0a,$09,'%s := OK;',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
xab2b6:		
		dc.b 'Function %s (para: Pointer): AwindowPtr;',$0d,$0a
		dc.b '{ wind.create routine }',$0d,$0a
		dc.b $09,'Var wi: AwindowPtr;',$0d,$0a
		dc.b 'Begin',$0d,$0a
		dc.b $0d,$0a
		dc.b $09,'wi := Awi_create (@..);',$0d,$0a
		dc.b $09,'%s := wi;',$0d,$0a
		dc.b 'End;',$0d,$0a
		dc.b $0d,$0a,0
xab347:
		dc.b 'Function %s (wind: AwindowPtr): Integer;',$0d,$0a,'{ wind.init routine }',$0d,$0a,'Begin',$0d,$0a,$09,'%s := OK;',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
xab3a4:
		dc.b 'Function %s (wind: AwindowPtr; kstate, key: Integer): Integer;',$0d,$0a,'{ wind.keys routine }',$0d,$0a,'Begin',$0d,$0a,$09,'%s := Awi_keys (wi, kstate, key);',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
xab42f:
		dc.b 'Procedure %s (wind: AwindowPtr; obnr, state: Integer);',$0d,$0a,'{ wind.obchange routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
xab492:
		dc.b 'Procedure %s (wind: AwindowPtr; area: AxywhPtr);',$0d,$0a,'{ wind.redraw routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
xab4ed:
		dc.b 'Procedure %s (wind: AwindowPtr);',$0d,$0a,'{ wind.topped routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
xab538:
		dc.b 'Procedure %s (wind: AwindowPtr);',$0d,$0a,'{ wind.closed routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
xab583:
		dc.b 'Procedure %s (wind: AwindowPtr; which, amount: Integer);',$0d,$0a
		dc.b '{ wind.arrowed routine }',$0d,$0a
		dc.b 'Begin',$0d,$0a
		dc.b $09,'Case (which) of',$0d,$0a
		dc.b $09,'WA_UPLINE:',$0d,$0a
		dc.b $09,'{ };',$0d,$0a
		dc.b $09,'WA_DNLINE:',$0d,$0a
		dc.b $09,'{ };',$0d,$0a
		dc.b $09,'WA_UPPAGE:',$0d,$0a
		dc.b $09,'{ };',$0d,$0a
		dc.b $09,'WA_DNPAGE:',$0d,$0a
		dc.b $09,'{ };',$0d,$0a
		dc.b $09,'WA_LFPAGE:',$0d,$0a
		dc.b $09,'{ };',$0d,$0a
		dc.b $09,'WA_RTPAGE:',$0d,$0a
		dc.b $09,'{ };',$0d,$0a
		dc.b $09,'WA_LFLINE:',$0d,$0a
		dc.b $09,'{ };',$0d,$0a
		dc.b $09,'WA_RTLINE:',$0d,$0a
		dc.b $09,'{ };',$0d,$0a
		dc.b $09,'End;',$0d,$0a
		dc.b 'End;',$0d,$0a,$0d,$0a,0
xab6a0:
		dc.b 'Procedure %s( wind: AwindowPtr; pos: Integer );',$0d,$0a
		dc.b '{ wind.hslid routine }',$0d,$0a
		dc.b 'Begin',$0d,$0a
		dc.b 'End;',$0d,$0a,$0d,$0a,0
xab6f9:
		dc.b 'Procedure %s( wind: AwindowPtr; pos: Integer );',$0d,$0a
		dc.b '{ wind.vslid routine }',$0d,$0a
		dc.b 'Begin',$0d,$0a
		dc.b 'End;',$0d,$0a
		dc.b $0d,$0a,0
xab752:
		dc.b 'Procedure %s( wind: AwindowPtr; area: AxywhPtr );',$0d,$0a
		dc.b '{ wind.moved routine }',$0d,$0a
		dc.b 'Begin',$0d,$0a
		dc.b 'End;',$0d,$0a
		dc.b $0d,$0a,0
xab7ad:
		dc.b 'Procedure %s( wind: AwindowPtr; area: AxywhPtr );',$0d,$0a
		dc.b '{ wind.sized routine }',$0d,$0a
		dc.b 'Begin',$0d,$0a
		dc.b 'End;',$0d,$0a
		dc.b $0d,$0a,0
xab808:
		dc.b 'Procedure %s( wind: AwindowPtr );',$0d,$0a
		dc.b '{ wi.fulled routine }',$0d,$0a
		dc.b 'Begin',$0d,$0a
		dc.b 'End;',$0d,$0a
		dc.b $0d,$0a,0
xab852:
		dc.b 'Function %s( wind: AwindowPtr; task: Integer; in_out: Pointer): Boolean;',$0d,$0a
		dc.b '{ wi.service routine }',$0d,$0a
		dc.b 'Begin',$0d,$0a
		dc.b $09,'case (task) of ',$0d,$0a
		dc.b $09,'AS_TERM:',$0d,$0a
		dc.b $09,$09,'Awi_delete (wind);',$0d,$0a
		dc.b $09,'Else Begin',$0d,$0a
		dc.b $09,$09,'%s := Awi_service(wind, task, in_out);',$0d,$0a
		dc.b $09,$09,'Exit;',$0d,$0a
		dc.b $09,'End;',$0d,$0a
		dc.b $09,'%s := TRUE;',$0d,$0a
		dc.b 'End;',$0d,$0a
		dc.b $0d,$0a
		dc.b '{ Window-Iconify-Routine }',$0d,$0a
		dc.b 'Function %s( wi: AwindowPtr; all: Integer ) : Integer;',$0d,$0a
		dc.b 'Begin',$0d,$0a
		dc.b $09,'%s:=Awi_iconify(wi, all);',$0d,$0a
		dc.b 'End;',$0d,$0a
		dc.b $0d,$0a,0
xab9cb:
		dc.b '{ Window-Uniconify-Routine }',$0d,$0a
		dc.b 'Function %s( wi: AwindowPtr ) : Integer;',$0d,$0a
		dc.b 'Begin',$0d,$0a
		dc.b $09,'%s:=Awi_uniconify(wi);',$0d,$0a
		dc.b 'End;',$0d,$0a
		dc.b $0d,$0a,0
xaba3c:
		dc.b '{ Window-GEMScript-Routine }',$0d,$0a
		dc.b 'Function %s( wi: AwindowPtr; anz: Integer; cmd: Pointer; antwort: A_GSAntwortPtr ) : Integer',$0d,$0a
		dc.b '{',$0d,$0a
		dc.b $09,'return Awi_gemscript(wi, anz, cmd, antwort);',$0d,$0a
		dc.b '}',$0d,$0a
		dc.b $0d,$0a
xabaef:
		dc.b '{ System-Init-Routine }',$0d,$0a
		dc.b 'Function %s : Integer;',$0d,$0a
		dc.b '{',$0d,$0a
		dc.b $09,'%s:=OK;',$0d,$0a
		dc.b '}',$0d,$0a
		dc.b $0d,$0a,0
xabb33:
		dc.b '{ System-Terminier-Routine }',$0d,$0a,'Procedure %s;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabb69:
		dc.b '{ System-About-Routine }',$0d,$0a,'Procedure %s;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabb9b:
		dc.b '{ System-Close-Routine }',$0d,$0a,'Procedure %s;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabbcd:
		dc.b '{ System-Message-Routine }',$0d,$0a,'Procedure %s( message: array [0..7] of Integer;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabc23:
		dc.b '{ System-Message-Filter }',$0d,$0a,'Procedure %s( message: array [0..7] of Integer;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabc78:
		dc.b '{ System-Timer-Routine }',$0d,$0a,'Procedure %s;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabcaa:
		dc.b '{ System-Key-Filter }',$0d,$0a,'Procedure %s( Var kstate, key: Integer );',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabcf5:
		dc.b '{ System-Button-Filter }',$0d,$0a,'Procedure %s( Var button, kreturn: Integer )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabd46:
		dc.b '{ System-Maus-Routine }',$0d,$0a,'Procedure %s;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabd77:
		dc.b '{ System-Window-Key-Filter }',$0d,$0a,'Procedure %s( Var kstate, key: Integer );',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabdc9:
		dc.b '{ System-GEMScript-Routine }',$0d,$0a
		dc.b 'Function %s( anz: Integer; cmd: Pointer; antwort: A_GSAntwortPtr ) : Integer;',$0d,$0a
		dc.b '{',$0d,$0a
		dc.b $09,'%s:=ACSGEMScript(anz, cmd, antwort);',$0d,$0a
		dc.b '}',$0d,$0a
		dc.b $0d,$0a,0
xabe66:
		dc.b $09,'/* Unkown type of routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabe9f:
		dc.b $09,'/* Click routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabecf:
		dc.b $09,'/* Drag routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabefe:
		dc.b $09,'/* USERDEF Draw-Routine */',$0d,$0a,'INT16 CDECL %s( PARMBLK *pb )',$0d,$0a,'{',$09,'return pb->pb_currstate;',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xabf5c:
		dc.b $09,'/* USERDEF Service-Routine */',$0d,$0a
		dc.b 'INT16 %s( OBJECT *entry, INT16 task, void *in_out )',$0d,$0a
		dc.b '{',$09,'return FALSE;',$0d,$0a
		dc.b '}',$0d,$0a
		dc.b $0d,$0a,0
xabfc8:
		dc.b $09,'/* Unkown type of routine */void %s( void )',$0d,$0a,$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac001:
		dc.b $09,'/* Window-Open-Routine*/',$0d,$0a,'INT16 %s( Awindow *wind )',$0d,$0a,'{',$09,'return OK;',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac04b:
		dc.b $09,'/* Window-Create-Routine */',$0d,$0a
		dc.b 'Awindow *%s( void *para )',$0d,$0a
		dc.b '{',$09,'Awindow',$09,'*wi;',$0d,$0a
		dc.b $0d,$0a
		dc.b $09,'wi=Awi_create(&..);',$0d,$0a
		dc.b 'if( wi== NULL )',$0d,$0a
		dc.b $09,$09,'return NULL;',$0d,$0a
		dc.b $0d,$0a
		dc.b $09,'return wi;',$0d,$0a
		dc.b '}',$0d,$0a
		dc.b $0d,$0a,0
xac0e2:
		dc.b $09,'/* Window-Init-Routine */',$0d,$0a,'INT16 %s( Awindow *wind )',$0d,$0a,'{',$09,'return OK;',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac12d:
		dc.b $09,'/* Window-Keys-Routine */',$0d,$0a
		dc.b 'INT16 %s( Awindow *wind, INT16 kstate, INT16 key )',$0d,$0a
		dc.b '{',$09,'return Awi_keys(wi, kstate, key);',$0d,$0a
		dc.b '}',$0d,$0a
		dc.b $0d,$0a,0
xac1a8:
		dc.b $09,'/* Window-Obchange-Routine */',$0d,$0a,'void %s( Awindow *wind, INT16 obnr, INT16 state )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac204:
		dc.b $09,'/* Window-Redraw-Routine */',$0d,$0a,'void %s( Awindow *wind, Axywh *area )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac252:
		dc.b $09,'/* Window-Topped-Routine */',$0d,$0a,'void %s( Awindow *wind )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac293:
		dc.b $09,'/* Window-Closed-Routine */',$0d,$0a,'void %s( Awindow *wind )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac2d4:
		dc.b $09,'/* Window-Arrowed-Routine */',$0d,$0a
		dc.b 'void %s( Awindow *wind, INT16 which, INT16 amount )',$0d,$0a
		dc.b '{',$0d,$0a
		dc.b $09,'switch(which)',$0d,$0a
		dc.b $09,'{',$0d,$0a
		dc.b $09,$09,'case WA_UPLINE:',$0d,$0a
		dc.b $09,$09,$09,'break;',$0d,$0a
		dc.b $0d,$0a
		dc.b $09,$09,'case WA_DNLINE:',$0d,$0a
		dc.b $09,$09,$09,'break;',$0d,$0a
		dc.b $0d,$0a
		dc.b $09,$09,'case WA_UPPAGE:',$0d,$0a
		dc.b $09,$09,$09,'break;',$0d,$0a
		dc.b $0d,$0a
		dc.b $09,$09,'case WA_DNPAGE:',$0d,$0a
		dc.b $09,$09,$09,'break;',$0d,$0a
		dc.b $0d,$0a
		dc.b $09,$09,'case WA_LFPAGE:',$0d,$0a
		dc.b $09,$09,$09,'break;',$0d,$0a
		dc.b $0d,$0a
		dc.b $09,$09,'case WA_RTPAGE:',$0d,$0a
		dc.b $09,$09,$09,'break;',$0d,$0a
		dc.b $0d,$0a
		dc.b $09,$09,'case WA_LFLINE:',$0d,$0a
		dc.b $09,$09,$09,'break;',$0d,$0a
		dc.b $0d,$0a
		dc.b $09,$09,'case WA_RTLINE:',$0d,$0a
		dc.b $09,$09,$09,'break;',$0d,$0a
		dc.b $09,'}',$0d,$0a
		dc.b '}',$0d,$0a
		dc.b $0d,$0a,0
xac447:
		dc.b $09,'/* Window-HSlide-Routine */',$0d,$0a,'void %s( Awindow *wind, INT16 pos )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac493:
		dc.b $09,'/* Window-VSlide-Routine */',$0d,$0a,'void %s( Awindow *wind, INT16 pos )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac4df:
		dc.b $09,'/* Window-Moved-Routine */',$0d,$0a,'void %s( Awindow *wind, Axywh *area )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac52c:
		dc.b $09,'/* Window-Sized-Routine */',$0d,$0a,'void %s( Awindow *wind, Axywh *area )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac579:
		dc.b $09,'/* Window-Fulled-Routine */',$0d,$0a,'void %s( Awindow *wind )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac5ba:
		dc.b $09,'/* Window-Service-Routine */',$0d,$0a
		dc.b 'INT16 %s( Awindow *wind, INT16 task, void *in_out )',$0d,$0a
		dc.b '{',$0d,$0a
		dc.b $09,'switch(task)',$0d,$0a
		dc.b $09,'{',$0d,$0a
		dc.b $09,$09,'case AS_TERM:',$0d,$0a
		dc.b $09,$09,$09,'Awi_delete(wind);',$0d,$0a
		dc.b $09,$09,$09,'break;',$0d,$0a
		dc.b $0d,$0a
		dc.b $09,$09,'default:',$0d,$0a
		dc.b $09,$09,$09,'return Awi_service(wind, task, in_out);',$0d,$0a
		dc.b $09,'}',$0d,$0a
		dc.b $09,'return TRUE;',$0d,$0a
		dc.b '}',$0d,$0a
		dc.b $0d,$0a,0
xac6a9:
		dc.b $09,'/* Window-Iconify-Routine */',$0d,$0a
		dc.b 'INT16 %s( Awindow *wind, INT16 all )',$0d,$0a
		dc.b '{',$0d,$0a
		dc.b $09,'return Awi_iconify(wi, all);',$0d,$0a
		dc.b '}',$0d,$0a
		dc.b $0d,$0a,0
xac716:
		dc.b $09,'/* Window-Uniconify-Routine */',$0d,$0a
		dc.b 'INT16 %s( Awindow *wind )',$0d,$0a
		dc.b '{',$0d,$0a
		dc.b $09,'return Awi_uniconify(wi);',$0d,$0a
		dc.b '}',$0d,$0a
		dc.b $0d,$0a,0
xac777:
		dc.b $09,'/* Window-GEMScript-Routine */',$0d,$0a
		dc.b 'INT16 %s( Awindow *wind, INT16 anz, char **cmd, A_GSAntwort *antwort )',$0d,$0a
		dc.b '{',$0d,$0a
		dc.b $09,'return Awi_gemscript(wi, anz, cmd, antwort);',$0d,$0a
		dc.b '}',$0d,$0a
		dc.b $0d,$0a,0
xac818:
		dc.b $09,'/* System-Init-Routine */',$0d,$0a
		dc.b 'INT16 %s( void )',$0d,$0a
		dc.b '{',$0d,$0a
		dc.b $09,'return OK;',$0d,$0a
		dc.b '}',$0d,$0a
		dc.b $0d,$0a,0
xac85c:
		dc.b $09,'/* System-Terminier-Routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac897:
		dc.b $09,'/* System-About-Routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac8ce:
		dc.b $09,'/* System-Close-Routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac905:
		dc.b $09,'/* System-Message-Routine */',$0d,$0a,'void %s( INT16 *message )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac948:
		dc.b $09,'/* System-Message-Filter */',$0d,$0a,'void %s( INT16 *message )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac98a:
		dc.b $09,'/* System-Timer-Routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xac9c1:
		dc.b $09,'/* System-Key-Filter */',$0d,$0a,'void %s( INT16 *kstate, INT16 *key )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xaca0a:
		dc.b $09,'/* System-Button-Filter */',$0d,$0a,'void %s( INT16 *button, INT16 *kreturn )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xaca5a:
		dc.b $09,'/* System-Mouse-Filter */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xaca90:
		dc.b $09,'/* System-Window-Key-Filter */',$0d,$0a,'void %s( INT16 *kstate, INT16 *key )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
xacae0:
		dc.b $09,'/* System-GEMScript-Routine */',$0d,$0a
		dc.b 'INT16 %s( INT16 anz, char **cmd, A_GSAntwort *antwort )',$0d,$0a
		dc.b '{',$0d,$0a
		dc.b $09,'return ACSGEMScript(anz, cmd, antwort);',$0d,$0a
		dc.b '}',$0d,$0a
		dc.b $0d,$0a,0
xacb6d:
		dc.b $20
		dc.b 00
xacb6f:
		dc.b ' (REF) ',0
xacb77:
		dc.b ' * ',0
xacb7b:
		dc.b $43,0
xacb7d:
		dc.b 'static ',0
	.even
