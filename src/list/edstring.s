		.text

add_string:
		movem.l    d3-d5/a2-a6,-(a7)
		subq.w     #4,a7
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     a2,d0
		beq        add_string_1
		move.l     4(a2),d1
		beq        add_string_1
		ori.w      #0x0001,6(a3)
		move.l     52(a3),(a7)
		movea.l    (a7),a1
		movea.l    4(a1),a5
		moveq.l    #6,d1
		movea.l    ACSblk,a0
		and.w      614(a0),d1
		subq.w     #6,d1
		beq        add_string_2
		move.l     14(a1),d3
		lsr.l      #2,d3
		clr.w      d4
		bra        add_string_3
add_string_13:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a5,d0.l),a6
		movea.l    4(a2),a1
		movea.l    4(a6),a0
		jsr        strcmp
		tst.w      d0
		bne        add_string_4
		clr.w      d5
		bra.s      add_string_5
add_string_7:
		move.w     d5,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a3,d0.l),a0
		movea.l    502(a0),a1
		movea.l    4(a1),a4
		movea.l    4(a6),a1
		move.w     d4,d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    0(a4,d1.l),a0
		movea.l    4(a0),a0
		jsr        strcmp
		tst.w      d0
		bne.s      add_string_6
		addq.w     #1,d5
add_string_5:
		cmp.w      #0x0003,d5
		blt.s      add_string_7
add_string_6:
		cmp.w      #0x0003,d5
		beq.s      add_string_8
		clr.w      d5
		bra.s      add_string_9
add_string_11:
		move.w     d5,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a3,d0.l),a0
		movea.l    502(a0),a1
		movea.l    4(a1),a4
		move.w     d4,d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    0(a4,d1.l),a0
		movea.l    4(a0),a0
		jsr        strlen
		tst.l      d0
		bne.s      add_string_10
		addq.w     #1,d5
add_string_9:
		cmp.w      #0x0003,d5
		blt.s      add_string_11
add_string_10:
		cmp.w      #0x0003,d5
		bne.s      add_string_4
add_string_8:
		addq.w     #1,54(a6)
		bra.s      add_string_12
add_string_4:
		addq.w     #1,d4
add_string_3:
		cmp.w      d4,d3
		bgt        add_string_13
add_string_2:
		movea.l    a2,a1
		movea.l    a3,a0
		jsr        copy_str
		movea.l    a0,a6
		move.l     a6,d0
		beq.s      add_string_1
		move.l     list_string+16,-(a7)
		pea.l      22(a2)
		movea.l    a6,a1
		movea.l    a3,a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a6,a1
		movea.l    (a7),a0
		jsr        add_entry
		addq.w     #1,d0
		bne.s      add_string_14
add_string_1:
		suba.l     a0,a0
		bra.s      add_string_15
add_string_14:
		movea.l    a6,a1
		moveq.l    #1,d0
		movea.l    a3,a0
		jsr        serv_str
add_string_12:
		movea.l    a6,a0
add_string_15:
		addq.w     #4,a7
		movem.l    (a7)+,d3-d5/a2-a6
		rts

change_string:
		movem.l    d3/a2-a5,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		movea.l    24(a7),a4
		move.l     a2,d0
		bne.s      change_string_1
		suba.l     a0,a0
		bra.s      change_string_2
change_string_1:
		ori.w      #0x0001,6(a3)
		movea.l    a4,a0
		jsr        strlen
		move.l     d0,d3
		addq.w     #1,d3
		move.w     d3,d0
		ext.l      d0
		cmp.l      10(a2),d0
		bgt.s      change_string_3
		movea.l    a4,a1
		movea.l    4(a2),a0
		jsr        strcpy
		move.w     d3,d0
		ext.l      d0
		move.l     d0,14(a2)
		bra.s      change_string_4
change_string_3:
		movea.l    4(a2),a5
		movea.l    a4,a0
		jsr        Ast_create
		move.l     a0,4(a2)
		move.l     a0,d0
		bne.s      change_string_5
		move.l     a5,4(a2)
		bra.s      change_string_4
change_string_5:
		movea.l    a5,a0
		jsr        Ax_free
		move.w     d3,d0
		ext.l      d0
		move.l     d0,10(a2)
		move.l     d0,14(a2)
change_string_4:
		movea.l    52(a3),a0
		move.l     18(a0),d0
		beq.s      change_string_6
		movea.l    d0,a1
		ori.w      #0x0020,86(a1)
change_string_6:
		movea.l    a2,a0
change_string_2:
		movem.l    (a7)+,d3/a2-a5
		rts

del_string:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		ori.w      #0x0001,6(a2)
		subq.w     #1,54(a3)
		move.w     54(a3),d0
		bgt.s      del_string_1
		movea.l    18(a3),a4
		move.l     a4,d1
		beq.s      del_string_2
		movea.l    4(a4),a5
		movea.l    a4,a0
		moveq.l    #2,d0
		suba.l     a1,a1
		jsr        (a5)
del_string_2:
		movea.l    a3,a1
		movea.l    52(a2),a0
		jsr        del_entry
		movea.l    a3,a1
		movea.l    a2,a0
		jsr        objfree
		movea.l    a3,a1
		moveq.l    #3,d0
		movea.l    a2,a0
		jsr        serv_str
del_string_1:
		movem.l    (a7)+,a2-a5
		rts

dup_string:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a4
		movea.l    a1,a2
		lea.l      free_string,a3
		move.l     a2,4(a3)
		movea.l    a2,a0
		jsr        strlen
		addq.l     #1,d0
		move.l     d0,10(a3)
		move.l     d0,14(a3)
		movea.l    a3,a1
		movea.l    a4,a0
		bsr        add_string
		movem.l    (a7)+,a2-a4
		rts

serv_str:
		movem.l    d3-d6/a3-a6,-(a7)
		lea.l      -110(a7),a7
		movea.l    a0,a3
		move.l     a1,106(a7)
		lea.l      xcf076,a0
		lea.l      40(a7),a1
		moveq.l    #15,d1
serv_str_1:
		move.l     (a0)+,(a1)+
		dbf        d1,serv_str_1
		move.w     (a0)+,(a1)+
		move.w     d0,d1
		subq.w     #1,d1
		beq.s      serv_str_2
		subq.w     #1,d1
		beq        serv_str_3
		subq.w     #1,d1
		beq        serv_str_4
		bra        serv_str_5
serv_str_2:
		clr.w      d3
		bra.s      serv_str_6
serv_str_7:
		movea.l    106(a7),a0
		move.l     4(a0),44(a7)
		move.l     10(a0),d0
		move.l     d0,50(a7)
		move.l     d0,54(a7)
		lea.l      40(a7),a1
		movea.l    a3,a0
		jsr        copy_str
		movea.l    a0,a4
		move.l     a4,d0
		beq        serv_str_5
		move.w     d3,-(a7)
		movea.l    108(a7),a1
		pea.l      22(a1)
		lea.l      xcf0b8,a1
		lea.l      22(a4),a0
		jsr        sprintf
		addq.w     #6,a7
		clr.l      -(a7)
		pea.l      22(a4)
		movea.l    a4,a1
		movea.l    a3,a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a4,a1
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a3,d0.l),a0
		movea.l    502(a0),a0
		jsr        add_entry
		addq.w     #1,d0
		beq        serv_str_5
		addq.w     #1,d3
serv_str_6:
		cmp.w      #0x0003,d3
		blt.s      serv_str_7
		bra        serv_str_8
serv_str_3:
		movea.l    52(a3),a0
		move.l     14(a0),d4
		lsr.l      #2,d4
		movea.l    502(a3),a1
		move.l     14(a1),d5
		lsr.l      #2,d5
		movea.l    a1,a6
		move.l     4(a6),36(a7)
		move.l     4(a0),32(a7)
		clr.w      d5
		bra.s      serv_str_9
serv_str_10:
		move.w     d5,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    32(a7),a0
		movea.l    0(a0,d0.l),a1
		clr.b      51(a1)
		addq.w     #1,d5
serv_str_9:
		cmp.w      d5,d4
		bgt.s      serv_str_10
		clr.w      d6
		bra.w      serv_str_11
serv_str_19:
		clr.b      (a7)
		moveq.l    #28,d0
		move.w     d6,d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    36(a7),a0
		movea.l    0(a0,d1.l),a1
		lea.l      22(a1),a1
		lea.l      (a7),a0
		jsr        strncat
		movea.l    a0,a5
serv_str_14:
		moveq.l    #1,d0
		lea.l      (a7),a0
		jsr        strchr
		movea.l    a0,a5
		move.l     a5,d0
		beq.s      serv_str_12
		cmpi.b     #0x01,2(a5)
		bne.s      serv_str_12
		clr.b      (a0)
serv_str_12:
		move.l     a5,d0
		beq.s      serv_str_13
		move.b     (a5),d1
		bne.s      serv_str_14
serv_str_13:
		clr.w      d3
		bra.s      serv_str_15
serv_str_17:
		lea.l      (a7),a1
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    32(a7),a0
		movea.l    0(a0,d0.l),a0
		lea.l      22(a0),a0
		jsr        strcmp
		tst.w      d0
		beq.s      serv_str_16
		addq.w     #1,d3
serv_str_15:
		cmp.w      d3,d4
		bgt.s      serv_str_17
serv_str_16:
		cmp.w      d3,d4
		beq.s      serv_str_18
		addq.w     #1,d6
serv_str_11:
		cmp.w      d6,d5
		bgt.w      serv_str_19
serv_str_18:
		cmp.w      d6,d5
		ble        serv_str_8
		clr.w      d3
		bra.s      serv_str_20
serv_str_21:
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a3,d0.l),a0
		movea.l    502(a0),a6
		move.l     4(a6),36(a7)
		move.w     d6,d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    36(a7),a1
		movea.l    0(a1,d1.l),a5
		move.w     d3,-(a7)
		movea.l    108(a7),a0
		pea.l      22(a0)
		lea.l      xcf0b8,a1
		lea.l      22(a5),a0
		jsr        sprintf
		addq.w     #6,a7
		clr.l      -(a7)
		pea.l      22(a5)
		movea.l    a5,a1
		movea.l    a3,a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a5,a1
		movea.l    a6,a0
		jsr        del_entry
		movea.l    a5,a1
		movea.l    a6,a0
		jsr        add_entry
		addq.w     #1,d3
serv_str_20:
		cmp.w      #0x0003,d3
		blt.s      serv_str_21
		bra        serv_str_8
serv_str_4:
		clr.w      d3
		bra.w      serv_str_22
serv_str_27:
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a3,d0.l),a0
		movea.l    502(a0),a1
		move.l     14(a1),d5
		lsr.l      #2,d5
		movea.l    a1,a6
		move.l     4(a6),36(a7)
		move.w     d3,-(a7)
		movea.l    108(a7),a5
		pea.l      22(a5)
		lea.l      xcf0b8,a1
		lea.l      6(a7),a0
		jsr        sprintf
		addq.w     #6,a7
		clr.w      d6
		bra.s      serv_str_23
serv_str_26:
		move.w     d6,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    36(a7),a0
		movea.l    0(a0,d0.l),a4
		lea.l      22(a4),a1
		lea.l      (a7),a0
		jsr        strcmp
		tst.w      d0
		bne.s      serv_str_24
		movea.l    a4,a1
		movea.l    a6,a0
		jsr        del_entry
		movea.l    a4,a1
		movea.l    a3,a0
		jsr        objfree
		bra.s      serv_str_25
serv_str_24:
		addq.w     #1,d6
serv_str_23:
		cmp.w      d6,d5
		bgt.s      serv_str_26
serv_str_25:
		addq.w     #1,d3
serv_str_22:
		cmp.w      #0x0003,d3
		blt.w      serv_str_27
		bra.s      serv_str_8
serv_str_5:
		clr.w      d0
		bra.s      serv_str_28
serv_str_8:
		moveq.l    #1,d0
serv_str_28:
		lea.l      110(a7),a7
		movem.l    (a7)+,d3-d6/a3-a6
		rts

copy_str:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		ori.w      #0x0001,6(a3)
		move.l     10(a2),d0
		jsr        objmalloc
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      copy_str_1
		suba.l     a0,a0
		bra.s      copy_str_2
copy_str_1:
		movea.l    4(a2),a1
		movea.l    4(a3),a0
		jsr        strcpy
		move.l     14(a2),d0
		move.l     d0,14(a3)
		move.l     d0,10(a3)
		movea.l    a3,a0
copy_str_2:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

new_work:
		movem.l    d3-d4/a2-a5,-(a7)
		subq.w     #4,a7
		move.l     4(a0),(a7)
		move.l     14(a0),d3
		lsr.l      #2,d3
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #4,d0
		sub.l      d1,d0
		add.l      d0,d0
		add.l      #0x00000030,d0
		jsr        Ax_malloc
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      new_work_1
		suba.l     a0,a0
		bra        new_work_2
new_work_1:
		moveq.l    #48,d0
		lea.l      inner,a1
		movea.l    a3,a0
		jsr        memcpy
		lea.l      48(a3),a4
		tst.w      d3
		ble        new_work_3
		move.w     d3,d1
		add.w      d1,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		lea.l      48(a3,d0.l),a5
		clr.w      d4
		bra.s      new_work_4
new_work_6:
		moveq.l    #48,d0
		lea.l      proto,a1
		movea.l    a4,a0
		jsr        memcpy
		move.w     d4,d0
		add.w      d0,d0
		addq.w     #4,d0
		move.w     d0,(a4)
		move.l     a5,12(a4)
		move.w     d4,d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    (a7),a0
		movea.l    0(a0,d1.l),a2
		move.w     56(a2),d2
		and.w      #0x0100,d2
		bne.s      new_work_5
		ori.w      #0x0010,10(a4)
new_work_5:
		move.l     a2,36(a4)
		moveq.l    #12,d0
		lea.l      22(a2),a1
		movea.l    a5,a0
		jsr        strncpy
		lea.l      xcf0c2,a1
		movea.l    a5,a0
		jsr        strcat
		move.b     #0x20,12(a5)
		moveq.l    #32,d0
		movea.l    4(a2),a1
		lea.l      13(a5),a0
		jsr        strncpy
		clr.b      45(a5)
		lea.l      46(a5),a5
		lea.l      48(a4),a4
		addq.w     #1,d4
new_work_4:
		cmp.w      d4,d3
		bgt.w      new_work_6
		move.w     d3,d0
		add.w      d0,d0
		move.w     d0,4(a3)
		move.w     #0x0002,2(a3)
		andi.w     #0xFFDF,32(a3)
		clr.w      -48(a4)
		ori.w      #0x0020,-16(a4)
new_work_3:
		movea.l    a3,a0
		jsr        Aob_fix
		movea.l    a3,a0
new_work_2:
		addq.w     #4,a7
		movem.l    (a7)+,d3-d4/a2-a5
		rts

	.data


inner:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $1800
		dc.w $0000
		dc.w $0000
		dc.w $1101
		dc.w $0000
		dc.w $0000
		dc.w $0064
		dc.w $0064
pra00:
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
proto:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $2005
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0400
		dc.w $002e
		dc.w $0001
pra04:
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
		dc.w $271a
protostring:
		dc.w $0000
		dc.w $0000
		dc.l proto_string
		dc.w $0000
		dc.w $0000
		dc.w $000e
		dc.w $0000
		dc.w $000e
		dc.w $0000
		dc.w $0000
		dc.b 'TEXT_01',0
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
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
list_string:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l WI_STRING
		dc.l st_list
		dc.l st_name
		dc.w $271a
		dc.l protostring
		dc.l copy_str
		dc.l del_string
		dc.l new_work
		dc.l serv_str
free_string:
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
		dc.b 'TEXT_01',0
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
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xcf076:
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
		dc.b '                               ',0
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xcf0b8:
		dc.b '%.28s',1,'%d',1,0
xcf0c2:
		dc.b '            ',0
		.even
