		.text

	.globl add_tedinfo
add_tedinfo:
		movem.l    d3-d4/a2-a5,-(a7)
		subq.w     #8,a7
		movea.l    a0,a2
		move.l     a1,4(a7)
		ori.w      #0x0001,6(a2)
		movea.l    40(a2),a0
		move.l     4(a0),(a7)
		movea.l    4(a1),a5
		moveq.l    #6,d0
		movea.l    ACSblk,a1
		and.w      614(a1),d0
		subq.w     #6,d0
		beq        add_tedinfo_1
		move.l     14(a0),d3
		lsr.l      #2,d3
		clr.w      d4
		bra        add_tedinfo_2
add_tedinfo_5:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		movea.l    0(a0,d0.l),a4
		movea.l    4(a4),a3
		move.w     12(a3),d1
		cmp.w      12(a5),d1
		bne.s      add_tedinfo_3
		move.w     16(a3),d2
		cmp.w      16(a5),d2
		bne.s      add_tedinfo_3
		move.w     18(a3),d0
		cmp.w      18(a5),d0
		bne.s      add_tedinfo_3
		move.w     22(a3),d1
		cmp.w      22(a5),d1
		bne.s      add_tedinfo_3
		movea.l    (a5),a1
		movea.l    4(a1),a1
		movea.l    (a3),a0
		movea.l    4(a0),a0
		jsr        strcmp
		tst.w      d0
		bne.s      add_tedinfo_3
		movea.l    4(a5),a0
		movea.l    4(a0),a1
		movea.l    4(a3),a0
		movea.l    4(a0),a0
		jsr        strcmp
		tst.w      d0
		bne.s      add_tedinfo_3
		movea.l    8(a5),a0
		movea.l    4(a0),a1
		movea.l    8(a3),a0
		movea.l    4(a0),a0
		jsr        strcmp
		tst.w      d0
		bne.s      add_tedinfo_3
		addq.w     #1,54(a4)
		bra.s      add_tedinfo_4
add_tedinfo_3:
		addq.w     #1,d4
add_tedinfo_2:
		cmp.w      d4,d3
		bgt        add_tedinfo_5
add_tedinfo_1:
		movea.l    4(a7),a1
		movea.l    a2,a0
		jsr        copy_tedi
		movea.l    a0,a4
		move.l     a4,d0
		bne.s      add_tedinfo_6
		suba.l     a0,a0
		bra.s      add_tedinfo_7
add_tedinfo_6:
		move.l     list_tedi+16,-(a7)
		movea.l    8(a7),a0
		pea.l      22(a0)
		movea.l    a4,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a4,a1
		movea.l    40(a2),a0
		jsr        add_entry
add_tedinfo_4:
		movea.l    a4,a0
add_tedinfo_7:
		addq.w     #8,a7
		movem.l    (a7)+,d3-d4/a2-a5
		rts

	.globl del_tedinfo
del_tedinfo:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		ori.w      #0x0001,6(a2)
		subq.w     #1,54(a3)
		move.w     54(a3),d0
		bgt.s      del_tedinfo_1
		movea.l    4(a3),a4
		movea.l    (a4),a1
		jsr        del_string
		movea.l    4(a4),a1
		movea.l    a2,a0
		jsr        del_string
		movea.l    8(a4),a1
		movea.l    a2,a0
		jsr        del_string
		movea.l    a3,a1
		movea.l    40(a2),a0
		jsr        del_entry
		movea.l    a3,a1
		movea.l    a2,a0
		jsr        objfree
del_tedinfo_1:
		movem.l    (a7)+,a2-a4
		rts

	.globl dup_tedinfo
dup_tedinfo:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a4
		movea.l    a1,a2
		lea.l      my_ted,a3
		moveq.l    #28,d0
		movea.l    a2,a1
		movea.l    a3,a0
		jsr        memcpy
		movea.l    (a2),a1
		movea.l    a4,a0
		jsr        dup_string
		movea.l    a0,a5
		subq.w     #1,54(a5)
		move.l     a0,(a3)
		movea.l    4(a2),a1
		movea.l    a4,a0
		jsr        dup_string
		movea.l    a0,a5
		subq.w     #1,54(a5)
		move.l     a0,4(a3)
		movea.l    8(a2),a1
		movea.l    a4,a0
		jsr        dup_string
		movea.l    a0,a5
		subq.w     #1,54(a5)
		move.l     a0,8(a3)
		moveq.l    #28,d0
		move.l     d0,38(a3)
		move.l     d0,42(a3)
		lea.l      28(a3),a1
		movea.l    a4,a0
		bsr        add_tedinfo
		movem.l    (a7)+,a2-a5
		rts

copy_tedi:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a2
		movea.l    a1,a4
		moveq.l    #28,d0
		jsr        objmalloc
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      copy_tedi_1
		suba.l     a0,a0
		bra.s      copy_tedi_2
copy_tedi_1:
		movea.l    4(a4),a4
		movea.l    4(a3),a5
		moveq.l    #28,d0
		movea.l    a4,a1
		movea.l    a5,a0
		jsr        memcpy
		move.l     #0x0000001C,14(a3)
		movea.l    (a4),a1
		movea.l    a2,a0
		jsr        add_string
		move.l     a0,(a5)
		movea.l    4(a4),a1
		movea.l    a2,a0
		jsr        add_string
		move.l     a0,4(a5)
		movea.l    8(a4),a1
		movea.l    a2,a0
		jsr        add_string
		move.l     a0,8(a5)
		movea.l    a3,a0
copy_tedi_2:
		movem.l    (a7)+,a2-a5
		rts

new_work:
		move.w     #0x271B,d0
		movea.l    WI_TEDI+90,a1
		jsr        work_icon
		rts

	.data

	.globl list_tedi
list_tedi:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l WI_TEDI
		dc.l te_list
		dc.l te_name
		dc.w $271b
		dc.w $0000
		dc.w $0000
		dc.l copy_tedi
		dc.l del_tedinfo
		dc.l new_work
		dc.w $0000
		dc.w $0000
my_ted:
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
free_tedi:
		dc.w $0000
		dc.w $0000
		dc.l my_ted
		dc.w $0000
		dc.w $0000
		dc.w $001c
		dc.w $0000
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.b 'TEDINFO_01',0
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
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
