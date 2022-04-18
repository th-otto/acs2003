
	.globl Alu_create
Alu_create:
		subq.w     #4,a7
		moveq.l    #68,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Alu_create_1
		suba.l     a0,a0
		bra.s      Alu_create_2
Alu_create_1:
		moveq.l    #68,d0
		lea.l      empty,a1
		movea.l    (a7),a0
		jsr        memcpy
		moveq.l    #20,d0
		jsr        Ax_malloc
		movea.l    (a7),a1
		move.l     a0,(a1)
		movea.l    (a7),a0
		move.l     (a0),d0
		bne.s      Alu_create_3
		moveq.l    #68,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		suba.l     a0,a0
		bra.s      Alu_create_2
Alu_create_3:
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        InitLinListe
		movea.l    (a7),a0
Alu_create_2:
		addq.w     #4,a7
		rts

	.globl Alu_delete
Alu_delete:
		subq.w     #4,a7
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Alu_delete_1
		movea.l    (a7),a0
		jsr        Alu_clearElem
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        Ax_free
		moveq.l    #68,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
Alu_delete_1:
		addq.w     #4,a7
		rts

InitLinListe:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		clr.l      (a0)
		movea.l    (a7),a0
		clr.l      4(a0)
		movea.l    (a7),a0
		clr.l      8(a0)
		movea.l    (a7),a0
		clr.l      12(a0)
		movea.l    (a7),a0
		clr.l      16(a0)
		addq.w     #4,a7
		rts

Alu_clearElem:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		movea.l    12(a7),a0
		move.l     (a0),8(a7)
		movea.l    8(a7),a0
		move.l     (a0),4(a7)
		bra.s      Alu_clearElem_1
Alu_clearElem_3:
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    12(a7),a0
		move.l     4(a0),d0
		beq.s      Alu_clearElem_2
		movea.l    4(a7),a0
		movea.l    8(a0),a0
		movea.l    12(a7),a1
		movea.l    4(a1),a1
		jsr        (a1)
Alu_clearElem_2:
		moveq.l    #12,d0
		movea.l    4(a7),a0
		jsr        Ax_recycle
		move.l     (a7),4(a7)
Alu_clearElem_1:
		move.l     4(a7),d0
		bne.s      Alu_clearElem_3
		movea.l    8(a7),a0
		bsr.w      InitLinListe
		lea.l      16(a7),a7
		rts

Alu_appendElem:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		clr.l      4(a7)
		movea.l    12(a7),a0
		move.l     (a0),(a7)
		moveq.l    #12,d0
		jsr        Ax_malloc
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Alu_appendElem_1
		clr.w      d0
		bra.s      Alu_appendElem_2
Alu_appendElem_1:
		movea.l    4(a7),a0
		move.l     8(a7),8(a0)
		moveq.l    #0,d0
		movea.l    4(a7),a0
		move.l     d0,4(a0)
		movea.l    4(a7),a0
		move.l     d0,(a0)
		movea.l    (a7),a0
		move.l     (a0),d0
		bne.s      Alu_appendElem_3
		movea.l    (a7),a0
		move.l     4(a7),(a0)
		movea.l    (a7),a0
		move.l     4(a7),12(a0)
		movea.l    (a7),a0
		clr.l      16(a0)
Alu_appendElem_3:
		movea.l    (a7),a0
		move.l     4(a0),d0
		beq.s      Alu_appendElem_4
		movea.l    (a7),a0
		movea.l    4(a0),a0
		move.l     4(a7),(a0)
Alu_appendElem_4:
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.l     4(a0),4(a1)
		movea.l    (a7),a0
		move.l     4(a7),4(a0)
		movea.l    (a7),a0
		addq.l     #1,8(a0)
		moveq.l    #1,d0
Alu_appendElem_2:
		lea.l      16(a7),a7
		rts

Alu_insertElem:
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		move.l     a1,18(a7)
		move.w     d0,16(a7)
		clr.l      8(a7)
		clr.l      4(a7)
		movea.l    22(a7),a0
		move.l     (a0),(a7)
		moveq.l    #12,d0
		jsr        Ax_malloc
		move.l     a0,8(a7)
		move.l     8(a7),d0
		bne.s      Alu_insertElem_1
		clr.w      d0
		bra        Alu_insertElem_2
Alu_insertElem_1:
		clr.l      12(a7)
		movea.l    (a7),a0
		move.l     (a0),4(a7)
		bra.s      Alu_insertElem_3
Alu_insertElem_5:
		movea.l    4(a7),a0
		move.l     (a0),4(a7)
		addq.l     #1,12(a7)
Alu_insertElem_3:
		moveq.l    #-1,d0
		add.w      16(a7),d0
		ext.l      d0
		move.l     12(a7),d1
		cmp.l      d0,d1
		bge.s      Alu_insertElem_4
		move.l     4(a7),d0
		bne.s      Alu_insertElem_5
Alu_insertElem_4:
		moveq.l    #-1,d0
		add.w      16(a7),d0
		ext.l      d0
		move.l     12(a7),d1
		cmp.l      d0,d1
		bne.s      Alu_insertElem_6
		move.l     4(a7),d0
		bne.s      Alu_insertElem_7
Alu_insertElem_6:
		movea.l    (a7),a0
		move.l     4(a0),4(a7)
Alu_insertElem_7:
		movea.l    8(a7),a0
		move.l     18(a7),8(a0)
		movea.l    8(a7),a0
		clr.l      (a0)
		move.l     4(a7),d0
		beq.s      Alu_insertElem_8
		movea.l    4(a7),a0
		movea.l    8(a7),a1
		move.l     (a0),(a1)
		movea.l    4(a7),a0
		move.l     8(a7),(a0)
		movea.l    8(a7),a0
		move.l     4(a7),4(a0)
		movea.l    8(a7),a0
		move.l     (a0),d0
		beq.s      Alu_insertElem_9
		movea.l    8(a7),a0
		movea.l    (a0),a0
		move.l     8(a7),4(a0)
		bra.s      Alu_insertElem_10
Alu_insertElem_9:
		movea.l    (a7),a0
		move.l     8(a7),4(a0)
Alu_insertElem_10:
		bra.s      Alu_insertElem_11
Alu_insertElem_8:
		movea.l    8(a7),a0
		movea.l    (a7),a1
		move.l     a0,4(a1)
		movea.l    (a7),a1
		move.l     a0,(a1)
		movea.l    (a7),a0
		move.l     8(a7),12(a0)
		movea.l    (a7),a0
		clr.l      16(a0)
Alu_insertElem_11:
		movea.l    (a7),a0
		addq.l     #1,8(a0)
		moveq.l    #1,d0
Alu_insertElem_2:
		lea.l      26(a7),a7
		rts

Alu_deleteElem:
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		move.w     d0,20(a7)
		clr.l      12(a7)
		clr.l      8(a7)
		movea.l    22(a7),a0
		move.l     (a0),4(a7)
		clr.l      16(a7)
		clr.l      12(a7)
		movea.l    4(a7),a0
		move.l     (a0),8(a7)
		bra.s      Alu_deleteElem_1
Alu_deleteElem_3:
		move.l     8(a7),12(a7)
		movea.l    8(a7),a0
		move.l     (a0),8(a7)
		addq.l     #1,16(a7)
Alu_deleteElem_1:
		move.w     20(a7),d0
		ext.l      d0
		move.l     16(a7),d1
		cmp.l      d0,d1
		bge.s      Alu_deleteElem_2
		move.l     8(a7),d0
		bne.s      Alu_deleteElem_3
Alu_deleteElem_2:
		move.w     20(a7),d0
		ext.l      d0
		move.l     16(a7),d1
		cmp.l      d0,d1
		beq.s      Alu_deleteElem_4
		suba.l     a0,a0
		bra.w      Alu_deleteElem_5
Alu_deleteElem_4:
		move.l     12(a7),d0
		beq.s      Alu_deleteElem_6
		movea.l    8(a7),a0
		movea.l    12(a7),a1
		move.l     (a0),(a1)
		bra.s      Alu_deleteElem_7
Alu_deleteElem_6:
		movea.l    8(a7),a0
		movea.l    4(a7),a1
		move.l     (a0),(a1)
Alu_deleteElem_7:
		movea.l    8(a7),a0
		move.l     (a0),d0
		beq.s      Alu_deleteElem_8
		movea.l    8(a7),a0
		movea.l    (a0),a0
		move.l     12(a7),4(a0)
		bra.s      Alu_deleteElem_9
Alu_deleteElem_8:
		movea.l    4(a7),a0
		move.l     12(a7),4(a0)
Alu_deleteElem_9:
		movea.l    4(a7),a0
		subq.l     #1,8(a0)
		movea.l    4(a7),a0
		movea.l    12(a0),a0
		cmpa.l     8(a7),a0
		bne.s      Alu_deleteElem_10
		movea.l    4(a7),a0
		movea.l    4(a7),a1
		move.l     (a0),12(a1)
		movea.l    4(a7),a0
		clr.l      16(a0)
Alu_deleteElem_10:
		movea.l    8(a7),a0
		move.l     8(a0),(a7)
		moveq.l    #12,d0
		movea.l    8(a7),a0
		jsr        Ax_recycle
		movea.l    (a7),a0
Alu_deleteElem_5:
		lea.l      26(a7),a7
		rts

	.globl Alu_ptrCmp
Alu_ptrCmp:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		cmpa.l     (a7),a0
		bne.s      Alu_ptrCmp_1
		moveq.l    #1,d0
		bra.s      Alu_ptrCmp_2
Alu_ptrCmp_1:
		clr.w      d0
Alu_ptrCmp_2:
		addq.w     #8,a7
		rts

Alu_deleteForElem:
		move.l     a2,-(a7)
		lea.l      -24(a7),a7
		move.l     a0,20(a7)
		move.l     a1,16(a7)
		clr.l      12(a7)
		clr.l      8(a7)
		clr.l      4(a7)
		movea.l    20(a7),a0
		move.l     (a0),(a7)
		clr.l      4(a7)
		movea.l    (a7),a0
		move.l     (a0),8(a7)
		bra        Alu_deleteForElem_1
Alu_deleteForElem_10:
		move.l     32(a7),d0
		beq.s      Alu_deleteForElem_2
		movea.l    8(a7),a0
		movea.l    8(a0),a1
		movea.l    16(a7),a0
		movea.l    32(a7),a2
		jsr        (a2)
		tst.w      d0
		beq.w      Alu_deleteForElem_3
Alu_deleteForElem_2:
		move.l     4(a7),d0
		beq.s      Alu_deleteForElem_4
		movea.l    8(a7),a0
		movea.l    4(a7),a1
		move.l     (a0),(a1)
		bra.s      Alu_deleteForElem_5
Alu_deleteForElem_4:
		movea.l    8(a7),a0
		movea.l    (a7),a1
		move.l     (a0),(a1)
Alu_deleteForElem_5:
		movea.l    8(a7),a0
		move.l     (a0),d0
		beq.s      Alu_deleteForElem_6
		movea.l    8(a7),a0
		movea.l    (a0),a0
		move.l     4(a7),4(a0)
		bra.s      Alu_deleteForElem_7
Alu_deleteForElem_6:
		movea.l    (a7),a0
		move.l     4(a7),4(a0)
Alu_deleteForElem_7:
		movea.l    (a7),a0
		subq.l     #1,8(a0)
		movea.l    (a7),a0
		movea.l    12(a0),a0
		cmpa.l     8(a7),a0
		bne.s      Alu_deleteForElem_8
		movea.l    (a7),a0
		movea.l    (a7),a1
		move.l     (a0),12(a1)
		movea.l    (a7),a0
		clr.l      16(a0)
Alu_deleteForElem_8:
		movea.l    8(a7),a0
		movea.l    8(a0),a0
		movea.l    20(a7),a1
		movea.l    4(a1),a1
		jsr        (a1)
		moveq.l    #12,d0
		movea.l    8(a7),a0
		jsr        Ax_recycle
		addq.l     #1,12(a7)
		bra.s      Alu_deleteForElem_9
Alu_deleteForElem_3:
		move.l     8(a7),4(a7)
Alu_deleteForElem_9:
		movea.l    8(a7),a0
		move.l     (a0),8(a7)
Alu_deleteForElem_1:
		move.l     8(a7),d0
		bne        Alu_deleteForElem_10
		move.l     12(a7),d0
		lea.l      24(a7),a7
		movea.l    (a7)+,a2
		rts

Alu_searchElem:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.l     d0,12(a7)
		clr.l      4(a7)
		movea.l    16(a7),a0
		move.l     (a0),(a7)
		clr.l      8(a7)
		movea.l    (a7),a0
		move.l     (a0),4(a7)
		bra.s      Alu_searchElem_1
Alu_searchElem_3:
		movea.l    4(a7),a0
		move.l     (a0),4(a7)
		addq.l     #1,8(a7)
Alu_searchElem_1:
		move.l     8(a7),d0
		cmp.l      12(a7),d0
		bge.s      Alu_searchElem_2
		move.l     4(a7),d0
		bne.s      Alu_searchElem_3
Alu_searchElem_2:
		move.l     8(a7),d0
		cmp.l      12(a7),d0
		bne.s      Alu_searchElem_4
		move.l     4(a7),d0
		beq.s      Alu_searchElem_4
		movea.l    (a7),a0
		move.l     4(a7),12(a0)
		movea.l    (a7),a0
		move.l     12(a7),16(a0)
		movea.l    4(a7),a0
		movea.l    8(a0),a0
		bra.s      Alu_searchElem_5
Alu_searchElem_4:
		suba.l     a0,a0
Alu_searchElem_5:
		lea.l      20(a7),a7
		rts

Alu_searchForElem:
		move.l     a2,-(a7)
		lea.l      -22(a7),a7
		move.l     a0,18(a7)
		move.l     a1,14(a7)
		clr.w      12(a7)
		clr.l      8(a7)
		clr.l      4(a7)
		movea.l    18(a7),a0
		move.l     (a0),(a7)
		clr.l      8(a7)
		movea.l    (a7),a0
		move.l     (a0),4(a7)
		bra.s      Alu_searchForElem_1
Alu_searchForElem_5:
		move.l     30(a7),d0
		beq.s      Alu_searchForElem_2
		movea.l    4(a7),a0
		movea.l    8(a0),a1
		movea.l    14(a7),a0
		movea.l    30(a7),a2
		jsr        (a2)
		tst.w      d0
		beq.s      Alu_searchForElem_3
Alu_searchForElem_2:
		move.w     #$0001,12(a7)
		bra.s      Alu_searchForElem_4
Alu_searchForElem_3:
		movea.l    4(a7),a0
		move.l     (a0),4(a7)
		addq.l     #1,8(a7)
Alu_searchForElem_1:
		move.w     12(a7),d0
		bne.s      Alu_searchForElem_4
		move.l     4(a7),d0
		bne.s      Alu_searchForElem_5
Alu_searchForElem_4:
		move.w     12(a7),d0
		beq.s      Alu_searchForElem_6
		move.l     4(a7),d0
		beq.s      Alu_searchForElem_6
		movea.l    (a7),a0
		move.l     4(a7),12(a0)
		movea.l    (a7),a0
		move.l     8(a7),16(a0)
		movea.l    4(a7),a0
		movea.l    8(a0),a0
		bra.s      Alu_searchForElem_7
Alu_searchForElem_6:
		suba.l     a0,a0
Alu_searchForElem_7:
		lea.l      22(a7),a7
		movea.l    (a7)+,a2
		rts

Alu_firstElem:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		movea.l    (a7),a1
		move.l     (a0),12(a1)
		movea.l    (a7),a0
		clr.l      16(a0)
		movea.l    (a7),a0
		move.l     (a0),d0
		bne.s      Alu_firstElem_1
		suba.l     a0,a0
		bra.s      Alu_firstElem_2
		bra.s      Alu_firstElem_2
Alu_firstElem_1:
		movea.l    (a7),a0
		movea.l    (a0),a0
		movea.l    8(a0),a0
		nop
Alu_firstElem_2:
		addq.w     #8,a7
		rts

Alu_lastElem:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		movea.l    (a7),a1
		move.l     4(a0),12(a1)
		moveq.l    #-1,d0
		movea.l    (a7),a0
		add.l      8(a0),d0
		movea.l    (a7),a0
		move.l     d0,16(a0)
		movea.l    (a7),a0
		move.l     4(a0),d0
		bne.s      Alu_lastElem_1
		suba.l     a0,a0
		bra.s      Alu_lastElem_2
		bra.s      Alu_lastElem_2
Alu_lastElem_1:
		movea.l    (a7),a0
		movea.l    4(a0),a0
		movea.l    8(a0),a0
		nop
Alu_lastElem_2:
		addq.w     #8,a7
		rts

Alu_aktNrElem:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		move.l     12(a0),d0
		bne.s      Alu_aktNrElem_1
		moveq.l    #-1,d0
		bra.s      Alu_aktNrElem_2
		bra.s      Alu_aktNrElem_2
Alu_aktNrElem_1:
		movea.l    (a7),a0
		move.l     16(a0),d0
		nop
Alu_aktNrElem_2:
		addq.w     #8,a7
		rts

Alu_aktElem:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		move.l     12(a0),d0
		bne.s      Alu_aktElem_1
		suba.l     a0,a0
		bra.s      Alu_aktElem_2
		bra.s      Alu_aktElem_2
Alu_aktElem_1:
		movea.l    (a7),a0
		movea.l    12(a0),a0
		movea.l    8(a0),a0
		nop
Alu_aktElem_2:
		addq.w     #8,a7
		rts

Alu_skipElem:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.w     d0,12(a7)
		move.l     d1,8(a7)
		movea.l    14(a7),a0
		move.l     (a0),4(a7)
		move.w     12(a7),d0
		beq.s      Alu_skipElem_1
		clr.l      (a7)
		bra.s      Alu_skipElem_2
Alu_skipElem_4:
		movea.l    4(a7),a0
		movea.l    12(a0),a0
		movea.l    4(a7),a1
		move.l     (a0),12(a1)
		addq.l     #1,(a7)
Alu_skipElem_2:
		move.l     (a7),d0
		cmp.l      8(a7),d0
		bge.s      Alu_skipElem_3
		movea.l    4(a7),a0
		move.l     12(a0),d0
		bne.s      Alu_skipElem_4
Alu_skipElem_3:
		bra.s      Alu_skipElem_5
Alu_skipElem_1:
		clr.l      (a7)
		bra.s      Alu_skipElem_6
Alu_skipElem_7:
		movea.l    4(a7),a0
		movea.l    12(a0),a0
		movea.l    4(a7),a1
		move.l     4(a0),12(a1)
		addq.l     #1,(a7)
Alu_skipElem_6:
		move.l     (a7),d0
		cmp.l      8(a7),d0
		bge.s      Alu_skipElem_5
		movea.l    4(a7),a0
		move.l     12(a0),d0
		bne.s      Alu_skipElem_7
Alu_skipElem_5:
		movea.l    4(a7),a0
		move.l     12(a0),d0
		bne.s      Alu_skipElem_8
		suba.l     a0,a0
		bra.s      Alu_skipElem_9
		bra.s      Alu_skipElem_9
Alu_skipElem_8:
		movea.l    4(a7),a0
		movea.l    12(a0),a0
		movea.l    8(a0),a0
		nop
Alu_skipElem_9:
		lea.l      18(a7),a7
		rts

Alu_countElem:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		movea.l    (a0),a0
		move.l     8(a0),d0
		addq.w     #4,a7
		rts

Alu_countForElem:
		move.l     a2,-(a7)
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.l     a1,12(a7)
		clr.l      8(a7)
		clr.l      4(a7)
		movea.l    16(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		move.l     (a0),4(a7)
		bra.s      Alu_countForElem_1
Alu_countForElem_4:
		move.l     28(a7),d0
		beq.s      Alu_countForElem_2
		movea.l    4(a7),a0
		movea.l    8(a0),a1
		movea.l    12(a7),a0
		movea.l    28(a7),a2
		jsr        (a2)
		tst.w      d0
		beq.s      Alu_countForElem_3
Alu_countForElem_2:
		addq.l     #1,8(a7)
Alu_countForElem_3:
		movea.l    4(a7),a0
		move.l     (a0),4(a7)
Alu_countForElem_1:
		move.l     4(a7),d0
		bne.s      Alu_countForElem_4
		move.l     8(a7),d0
		lea.l      20(a7),a7
		movea.l    (a7)+,a2
		rts

Alu_doForElem:
		move.l     a2,-(a7)
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		clr.l      4(a7)
		movea.l    12(a7),a0
		move.l     (a0),(a7)
		movea.l    (a7),a0
		move.l     (a0),4(a7)
		bra.s      Alu_doForElem_1
Alu_doForElem_4:
		move.l     24(a7),d0
		beq.s      Alu_doForElem_2
		movea.l    4(a7),a0
		movea.l    8(a0),a1
		movea.l    8(a7),a0
		movea.l    24(a7),a2
		jsr        (a2)
		tst.w      d0
		beq.s      Alu_doForElem_3
Alu_doForElem_2:
		movea.l    4(a7),a0
		movea.l    8(a0),a1
		movea.l    8(a7),a0
		movea.l    28(a7),a2
		jsr        (a2)
Alu_doForElem_3:
		movea.l    4(a7),a0
		move.l     (a0),4(a7)
Alu_doForElem_1:
		move.l     4(a7),d0
		bne.s      Alu_doForElem_4
		lea.l      16(a7),a7
		movea.l    (a7)+,a2
		rts

	.data

empty:
		dc.l 0
		dc.l Ax_free
		dc.l Alu_clearElem
		dc.l Alu_appendElem
		dc.l Alu_insertElem
		dc.l Alu_deleteElem
		dc.l Alu_deleteForElem
		dc.l Alu_searchElem
		dc.l Alu_searchForElem
		dc.l Alu_firstElem
		dc.l Alu_lastElem
		dc.l Alu_aktElem
		dc.l Alu_aktNrElem
		dc.l Alu_skipElem
		dc.l Alu_countElem
		dc.l Alu_countForElem
		dc.l Alu_doForElem
