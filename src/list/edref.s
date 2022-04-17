	.text

	.globl add_ref
add_ref:
		movem.l    d3-d6/a2-a5,-(a7)
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		movea.l    a1,a5
		ori.w      #0x0001,6(a0)
		move.l     60(a0),4(a7)
		movea.l    4(a7),a1
		move.l     4(a1),(a7)
		move.l     14(a1),d3
		lsr.l      #2,d3
		move.w     56(a5),d4
		and.w      #0x00FF,d4
		clr.w      d5
		bra        add_ref_1
add_ref_7:
		move.w     d5,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		movea.l    0(a0,d0.l),a2
		lea.l      22(a5),a1
		lea.l      22(a2),a0
		jsr        strcmp
		tst.w      d0
		bne        add_ref_2
		move.w     56(a2),d6
		and.w      #0x00FF,d6
		tst.w      d6
		beq        add_ref_3
		tst.w      d4
		beq        add_ref_4
		cmp.w      d6,d4
		beq        add_ref_4
		lea.l      REF_TYPE,a4
		lea.l      WI_DIFF_TYPE,a0
		movea.l    WI_DIFF_TYPE+8,a1
		jsr        (a1)
		movea.l    a0,a3
		move.l     a3,d0
		beq        add_ref_5
		lea.l      22(a2),a1
		moveq.l    #12,d0
		movea.l    20(a3),a0
		jsr        Aob_puttext
		move.w     d6,d1
		ext.l      d1
		add.l      d1,d1
		lea.l      cross_type,a0
		move.w     0(a0,d1.l),d2
		ext.l      d2
		move.l     d2,d0
		add.l      d0,d0
		add.l      d2,d0
		lsl.l      #3,d0
		movea.l    12(a4,d0.l),a1
		movea.l    20(a3),a0
		moveq.l    #3,d0
		jsr        Aob_puttext
		move.w     d4,d1
		ext.l      d1
		add.l      d1,d1
		lea.l      cross_type,a0
		move.w     0(a0,d1.l),d2
		ext.l      d2
		move.l     d2,d0
		add.l      d0,d0
		add.l      d2,d0
		lsl.l      #3,d0
		movea.l    12(a4,d0.l),a1
		movea.l    20(a3),a0
		moveq.l    #4,d0
		jsr        Aob_puttext
		movea.l    a3,a0
		jsr        Awi_dialog
		move.w     d0,d6
		movea.l    a3,a0
		jsr        Awi_delete
		cmp.w      #0x0006,d6
		beq.s      add_ref_3
		cmp.w      #0x0006,d6
		bne.s      add_ref_5
		bra.s      add_ref_4
add_ref_3:
		move.w     56(a2),d0
		and.w      #0xFF00,d0
		or.w       d4,d0
		move.w     d0,56(a2)
add_ref_4:
		addq.w     #1,54(a2)
		bra.s      add_ref_6
add_ref_2:
		addq.w     #1,d5
add_ref_1:
		cmp.w      d5,d3
		bgt        add_ref_7
		moveq.l    #4,d0
		movea.l    4(a7),a0
		jsr        objextent
		tst.w      d0
		bne.s      add_ref_5
		moveq.l    #0,d0
		movea.l    8(a7),a0
		jsr        objmalloc
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      add_ref_8
add_ref_5:
		suba.l     a0,a0
		bra.s      add_ref_9
add_ref_8:
		move.w     56(a5),56(a2)
		move.l     list_reference+16,-(a7)
		pea.l      22(a5)
		movea.l    a2,a1
		movea.l    16(a7),a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a2,a1
		movea.l    4(a7),a0
		jsr        add_entry
add_ref_6:
		movea.l    a2,a0
add_ref_9:
		lea.l      12(a7),a7
		movem.l    (a7)+,d3-d6/a2-a5
		rts

	.globl del_ref
del_ref:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		ori.w      #0x0001,6(a2)
		subq.w     #1,54(a3)
		move.w     54(a3),d0
		bgt.s      del_ref_1
		movea.l    60(a2),a0
		jsr        del_entry
		movea.l    a3,a1
		movea.l    a2,a0
		jsr        objfree
del_ref_1:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl dup_ref
dup_ref:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a4
		movea.l    a1,a2
		move.w     d0,d3
		lea.l      free_ref,a3
		movea.l    a2,a1
		lea.l      22(a3),a0
		jsr        strcpy
		move.w     #0x00FF,d0
		and.w      d3,d0
		move.w     d0,56(a3)
		movea.l    a3,a1
		movea.l    a4,a0
		bsr        add_ref
		movem.l    (a7)+,d3/a2-a4
		rts

copy_ref:
		move.l     a2,-(a7)
		move.l     a4,-(a7)
		movea.l    a1,a2
		move.l     10(a2),d0
		jsr        objmalloc
		movea.l    a0,a4
		move.l     a4,d0
		bne.s      copy_ref_1
		suba.l     a0,a0
		bra.s      copy_ref_2
copy_ref_1:
		move.l     10(a2),d0
		movea.l    4(a2),a1
		movea.l    4(a4),a0
		jsr        memcpy
		move.l     14(a2),14(a4)
		move.w     56(a2),56(a4)
		movea.l    a4,a0
copy_ref_2:
		movea.l    (a7)+,a4
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
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #4,d0
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
		lea.l      22(a2),a1
		movea.l    a5,a0
		jsr        strcpy
		lea.l      32(a5),a5
		lea.l      48(a4),a4
		addq.w     #1,d4
new_work_4:
		cmp.w      d4,d3
		bgt.s      new_work_6
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
		dc.w $0020
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
		dc.w $271c
protoref:
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
		dc.b 'REFERENCE_01',0
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
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl list_reference
list_reference:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l WI_REF
		dc.l rf_list
		dc.l rf_name
		dc.w $271c
		dc.l protoref
		dc.l copy_ref
		dc.l del_ref
		dc.l new_work
		dc.w $0000
		dc.w $0000
free_ref:
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
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
