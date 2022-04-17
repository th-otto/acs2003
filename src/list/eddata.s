		.text

add_data:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a2
		movea.l    a1,a4
		movea.l    68(a2),a3
		ori.w      #0x0001,6(a2)
		move.w     refimages,d0
		beq.s      add_data_1
		lea.l      22(a4),a1
		movea.l    a3,a0
		jsr        find_entry
		cmpa.l     a0,a4
		bne.s      add_data_1
		addq.w     #1,54(a4)
		movea.l    a4,a0
		bra.s      add_data_2
add_data_1:
		moveq.l    #4,d0
		movea.l    a3,a0
		jsr        objextent
		tst.w      d0
		bne.s      add_data_3
		movea.l    a4,a1
		movea.l    a2,a0
		jsr        copy_data
		movea.l    a0,a5
		move.l     a5,d0
		bne.s      add_data_4
add_data_3:
		suba.l     a0,a0
		bra.s      add_data_2
add_data_4:
		move.l     list_data+16,-(a7)
		pea.l      22(a4)
		movea.l    a5,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a5,a1
		movea.l    a3,a0
		jsr        add_entry
		movea.l    a5,a0
add_data_2:
		movem.l    (a7)+,a2-a5
		rts

copy_data:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     14(a2),d0
		jsr        objmalloc
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      copy_data_1
		suba.l     a0,a0
		bra.s      copy_data_2
copy_data_1:
		move.l     14(a2),14(a3)
		movea.l    4(a2),a4
		movea.l    4(a3),a5
		move.l     14(a2),d0
		movea.l    a4,a1
		movea.l    a5,a0
		jsr        memcpy
		movea.l    a3,a0
copy_data_2:
		movem.l    (a7)+,a2-a5
		rts

dup_data:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		lea.l      free_data,a2
		move.l     a1,4(a2)
		move.l     d0,10(a2)
		move.l     d0,14(a2)
		movea.l    a2,a1
		movea.l    a3,a0
		bsr        add_data
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

del_data:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		ori.w      #0x0001,6(a2)
		subq.w     #1,54(a3)
		move.w     54(a3),d0
		bgt.s      del_data_1
		movea.l    18(a3),a4
		move.l     a4,d1
		beq.s      del_data_2
		movea.l    4(a4),a5
		movea.l    a4,a0
		moveq.l    #2,d0
		suba.l     a1,a1
		jsr        (a5)
del_data_2:
		movea.l    a3,a1
		movea.l    68(a2),a0
		jsr        del_entry
		movea.l    a3,a1
		movea.l    a2,a0
		jsr        objfree
del_data_1:
		movem.l    (a7)+,a2-a5
		rts

new_work:
		move.w     #0x2724,d0
		movea.l    WI_DATA+90,a1
		jsr        work_icon
		rts
