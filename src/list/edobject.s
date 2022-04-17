		.text

add_object:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a2
		movea.l    a1,a4
		ori.w      #0x0001,6(a2)
		movea.l    24(a2),a3
		moveq.l    #56,d0
		movea.l    a3,a0
		jsr        objextent
		tst.w      d0
		bne.s      add_object_1
		movea.l    a4,a1
		movea.l    a2,a0
		jsr        copy_obj
		movea.l    a0,a5
		move.l     a5,d0
		bne.s      add_object_2
add_object_1:
		suba.l     a0,a0
		bra.s      add_object_3
add_object_2:
		move.l     list_object+16,-(a7)
		pea.l      22(a4)
		movea.l    a5,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a5,a1
		movea.l    a3,a0
		jsr        add_entry
		movea.l    a5,a0
add_object_3:
		movem.l    (a7)+,a2-a5
		rts

copy_obj:
		movem.l    d3-d4/a2-a6,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     14(a2),d0
		jsr        objmalloc
		movea.l    a0,a4
		move.l     a4,d0
		bne.s      copy_obj_1
		suba.l     a0,a0
		bra.s      copy_obj_2
copy_obj_1:
		move.l     14(a2),d0
		moveq.l    #56,d1
		jsr        _uldiv
		move.l     d0,d3
		movea.l    4(a2),a5
		movea.l    4(a4),a6
		clr.w      d4
		bra.s      copy_obj_3
copy_obj_4:
		move.w     d4,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		pea.l      0(a5,d0.l)
		lea.l      0(a6,d0.l),a1
		movea.l    a3,a0
		jsr        copy_ob
		addq.w     #4,a7
		addq.w     #1,d4
copy_obj_3:
		cmp.w      d4,d3
		bgt.s      copy_obj_4
		move.l     14(a2),14(a4)
		movea.l    a4,a0
copy_obj_2:
		movem.l    (a7)+,d3-d4/a2-a6
		rts

del_object:
		movem.l    d3-d4/a2-a5,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		ori.w      #0x0001,6(a2)
		subq.w     #1,54(a3)
		move.w     54(a3),d0
		bgt.s      del_object_1
		movea.l    18(a3),a4
		move.l     a4,d1
		beq.s      del_object_2
		movea.l    4(a4),a5
		movea.l    a4,a0
		moveq.l    #2,d0
		suba.l     a1,a1
		jsr        (a5)
del_object_2:
		move.l     14(a3),d0
		moveq.l    #56,d1
		jsr        _uldiv
		move.l     d0,d3
		movea.l    4(a3),a4
		clr.w      d4
		bra.s      del_object_3
del_object_4:
		move.w     d4,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		lea.l      0(a4,d0.l),a1
		movea.l    a2,a0
		jsr        del_ob
		addq.w     #1,d4
del_object_3:
		cmp.w      d4,d3
		bgt.s      del_object_4
		movea.l    a3,a1
		movea.l    24(a2),a0
		jsr        del_entry
		movea.l    a3,a1
		movea.l    a2,a0
		jsr        objfree
del_object_1:
		movem.l    (a7)+,d3-d4/a2-a5
		rts

new_work:
		move.w     #0x2710,d0
		movea.l    WI_OBJECT+90,a1
		jsr        work_icon
		rts

	.data

protoobj:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0000
		dc.w $0010
		dc.w $0002
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $0020
		dc.w $000c
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
protoobject:
		dc.w $0000
		dc.w $0000
		dc.l protoobj
		dc.w $0000
		dc.w $0000
		dc.w $0038
		dc.w $0000
		dc.w $0038
		dc.w $0000
		dc.w $0000
		dc.b 'OBJECT_01',0
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
list_object:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l WI_OBJECT
		dc.l ob_list
		dc.l ob_name
		dc.w $2710
		dc.l protoobject
		dc.l copy_obj
		dc.l del_object
		dc.l new_work
		dc.w $0000
		dc.w $0000
