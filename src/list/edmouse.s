		.text

add_mouse:
		movem.l    d3-d4/a2-a6,-(a7)
		movea.l    a0,a2
		movea.l    a1,a6
		ori.w      #0x0001,6(a2)
		movea.l    64(a2),a3
		movea.l    4(a3),a4
		move.l     14(a3),d3
		lsr.l      #2,d3
		clr.w      d4
		bra.s      add_mouse_1
add_mouse_4:
		movea.l    (a4)+,a5
		moveq.l    #74,d0
		movea.l    4(a6),a1
		movea.l    4(a5),a0
		jsr        memcmp
		tst.w      d0
		bne.s      add_mouse_2
		addq.w     #1,54(a5)
		bra.s      add_mouse_3
add_mouse_2:
		addq.w     #1,d4
add_mouse_1:
		cmp.w      d4,d3
		bgt.s      add_mouse_4
		moveq.l    #56,d0
		movea.l    a3,a0
		jsr        objextent
		tst.w      d0
		bne.s      add_mouse_5
		movea.l    a6,a1
		movea.l    a2,a0
		jsr        copy_mouse
		movea.l    a0,a5
		move.l     a5,d0
		bne.s      add_mouse_6
add_mouse_5:
		suba.l     a0,a0
		bra.s      add_mouse_7
add_mouse_6:
		move.l     list_mouse+16,-(a7)
		pea.l      22(a6)
		movea.l    a5,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a5,a1
		movea.l    a3,a0
		jsr        add_entry
add_mouse_3:
		movea.l    a5,a0
add_mouse_7:
		movem.l    (a7)+,d3-d4/a2-a6
		rts

copy_mouse:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     14(a2),d0
		jsr        objmalloc
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      copy_mouse_1
		suba.l     a0,a0
		bra.s      copy_mouse_2
copy_mouse_1:
		move.l     14(a2),14(a3)
		move.l     14(a2),d0
		movea.l    4(a2),a1
		movea.l    4(a3),a0
		jsr        memcpy
		movea.l    a3,a0
copy_mouse_2:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

del_mouse:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a4
		movea.l    a1,a2
		subq.w     #1,54(a2)
		move.w     54(a2),d0
		bgt.s      del_mouse_1
		movea.l    18(a2),a3
		move.l     a3,d1
		beq.s      del_mouse_2
		movea.l    4(a3),a5
		movea.l    a3,a0
		moveq.l    #2,d0
		suba.l     a1,a1
		jsr        (a5)
del_mouse_2:
		movea.l    a2,a1
		movea.l    64(a4),a0
		jsr        del_entry
		movea.l    a2,a1
		movea.l    a4,a0
		jsr        objfree
del_mouse_1:
		movem.l    (a7)+,a2-a5
		rts

new_work:
		move.w     #0x2722,d0
		movea.l    WI_MOUSE+90,a1
		jsr        work_icon
		rts

	.data

mouse_obj:
		dc.w $0007
		dc.w $0007
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0380
		dc.w $fffe
		dc.w $0380
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0000
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0280
		dc.w $fc7e
		dc.w $0280
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0100
		dc.w $0000
protomouse:
		dc.w $0000
		dc.w $0000
		dc.l mouse_obj
		dc.w $0000
		dc.w $0000
		dc.w $004a
		dc.w $0000
		dc.w $004a
		dc.w $0000
		dc.w $0000
		dc.b 'MOUSE_01',0
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
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
list_mouse:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l WI_MOUSE
		dc.l mf_list
		dc.l mf_name
		dc.w $2722
		dc.l protomouse
		dc.l copy_mouse
		dc.l del_mouse
		dc.l new_work
		dc.w $0000
		dc.w $0000
