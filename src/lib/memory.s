	.globl INmemory
INmemory:
		subq.w     #2,a7
		move.w     MemInit,d0
		addq.w     #1,MemInit
		tst.w      d0
		beq.s      INmemory_1
		clr.w      d0
		bra        INmemory_2
INmemory_1:
		clr.w      (a7)
		bra.s      INmemory_3
INmemory_4:
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #2,d0
		movea.l    freeBlockList,a0
		clr.w      10(a0,d0.l)
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #2,d0
		movea.l    freeBlockList,a0
		clr.w      12(a0,d0.l)
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #2,d0
		movea.l    freeBlockList,a0
		clr.w      14(a0,d0.l)
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #2,d0
		movea.l    freeBlockList,a0
		clr.l      16(a0,d0.l)
		addq.w     #1,(a7)
INmemory_3:
		move.w     (a7),d0
		cmp.w      freeBlockListAnz,d0
		blt.s      INmemory_4
		move.w     freeBlockListAnz,d0
		ble.s      INmemory_5
		lea.l      sortFreeMemList,a1
		moveq.l    #20,d1
		move.w     freeBlockListAnz,d0
		ext.l      d0
		movea.l    freeBlockList,a0
		jsr        qsort
INmemory_5:
		clr.w      d0
INmemory_2:
		addq.w     #2,a7
		rts

	.globl TRmemory
TRmemory:
		lea.l      -10(a7),a7
		subq.w     #1,MemInit
		beq.s      TRmemory_1
		bra        TRmemory_2
TRmemory_1:
		clr.w      8(a7)
		bra.s      TRmemory_3
TRmemory_6:
		move.w     8(a7),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #2,d0
		movea.l    freeBlockList,a0
		adda.l     d0,a0
		move.l     a0,4(a7)
		bra.s      TRmemory_4
TRmemory_5:
		movea.l    4(a7),a0
		move.l     16(a0),(a7)
		movea.l    4(a7),a0
		movea.l    16(a0),a0
		movea.l    4(a7),a1
		move.l     (a0),16(a1)
		movea.l    (a7),a0
		jsr        Ax_free
TRmemory_4:
		movea.l    4(a7),a0
		move.l     16(a0),d0
		bne.s      TRmemory_5
		addq.w     #1,8(a7)
TRmemory_3:
		move.w     8(a7),d0
		cmp.w      freeBlockListAnz,d0
		blt.s      TRmemory_6
		movea.l    freeBlockList,a0
		cmpa.l     #_freeBlockList,a0
		beq.s      TRmemory_7
		movea.l    freeBlockList,a0
		jsr        Ax_free
TRmemory_7:
		move.l     freeBlockStat,d0
		beq.s      TRmemory_2
		movea.l    freeBlockStat,a0
		jsr        Ax_free
TRmemory_2:
		lea.l      10(a7),a7
		rts

	.globl Ax_malloc
Ax_malloc:
		subq.w     #8,a7
		move.l     d0,4(a7)
		move.l     4(a7),d0
		jsr        RecycleFreeBlocks
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Ax_malloc_1
		move.l     4(a7),d0
		jsr        _malloc
		move.l     a0,(a7)
Ax_malloc_1:
		movea.l    (a7),a0
		addq.w     #8,a7
		rts

_malloc:
		subq.w     #8,a7
		move.l     d0,4(a7)
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		bne.s      _malloc_1
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		beq.s      _malloc_2
_malloc_1:
		move.l     4(a7),d0
		jsr        malloc
		move.l     a0,(a7)
		bra.s      _malloc_3
_malloc_2:
		jsr        accgemdos
		move.l     4(a7),d0
		jsr        malloc
		move.l     a0,(a7)
		jsr        oldgemdos
_malloc_3:
		move.l     (a7),d0
		bne.s      _malloc_4
		suba.l     a0,a0
		bra.s      _malloc_5
_malloc_4:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0400,d0
		bne.s      _malloc_6
		movea.l    (a7),a0
		cmpa.l     watch_max,a0
		bcc.s      _malloc_6
		movea.l    (a7),a0
		cmpa.l     watch_min,a0
		bcs.s      _malloc_6
		suba.l     a0,a0
		moveq.l    #5,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		movea.l    (a7),a0
		movea.l    ACSblk,a1
		movea.l    722(a1),a1
		jsr        (a1)
_malloc_6:
		movea.l    (a7),a0
_malloc_5:
		addq.w     #8,a7
		rts

	.globl Ax_ifree
Ax_ifree:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     4(a7),(a7)
		move.l     4(a7),d0
		beq.s      Ax_ifree_1
		movea.l    4(a7),a0
		cmpa.l     #null_string,a0
		bne.s      Ax_ifree_2
Ax_ifree_1:
		bra        Ax_ifree_3
Ax_ifree_2:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0400,d0
		bne        Ax_ifree_4
		movea.l    4(a7),a0
		cmpa.l     watch_max,a0
		bcc.s      Ax_ifree_5
		movea.l    4(a7),a0
		cmpa.l     watch_min,a0
		bcs.s      Ax_ifree_5
		suba.l     a0,a0
		moveq.l    #5,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		movea.l    4(a7),a0
		movea.l    ACSblk,a1
		movea.l    722(a1),a1
		jsr        (a1)
Ax_ifree_5:
		cmpi.l     #$00001000,4(a7)
		bge.s      Ax_ifree_6
		suba.l     a0,a0
		moveq.l    #5,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		movea.l    4(a7),a0
		movea.l    ACSblk,a1
		movea.l    722(a1),a1
		jsr        (a1)
		bra.s      Ax_ifree_3
Ax_ifree_6:
		moveq.l    #1,d0
		and.l      (a7),d0
		beq.s      Ax_ifree_4
		suba.l     a0,a0
		moveq.l    #6,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		movea.l    4(a7),a0
		movea.l    ACSblk,a1
		movea.l    722(a1),a1
		jsr        (a1)
		bra.s      Ax_ifree_3
Ax_ifree_4:
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		bne.s      Ax_ifree_7
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		beq.s      Ax_ifree_8
Ax_ifree_7:
		movea.l    4(a7),a0
		jsr        free
		bra.s      Ax_ifree_3
Ax_ifree_8:
		jsr        accgemdos
		movea.l    4(a7),a0
		jsr        free
		jsr        oldgemdos
Ax_ifree_3:
		addq.w     #8,a7
		rts

	.globl Ax_free
Ax_free:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     8(a7),(a7)
		move.l     8(a7),d0
		beq.s      Ax_free_1
		movea.l    8(a7),a0
		cmpa.l     #null_string,a0
		bne.s      Ax_free_2
Ax_free_1:
		bra        Ax_free_3
Ax_free_2:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #$0400,d0
		bne        Ax_free_4
		movea.l    8(a7),a0
		cmpa.l     watch_max,a0
		bcc.s      Ax_free_5
		movea.l    8(a7),a0
		cmpa.l     watch_min,a0
		bcs.s      Ax_free_5
		suba.l     a0,a0
		moveq.l    #5,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		movea.l    8(a7),a0
		movea.l    ACSblk,a1
		movea.l    722(a1),a1
		jsr        (a1)
Ax_free_5:
		cmpi.l     #$00001000,8(a7)
		bge.s      Ax_free_6
		suba.l     a0,a0
		moveq.l    #5,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		movea.l    8(a7),a0
		movea.l    ACSblk,a1
		movea.l    722(a1),a1
		jsr        (a1)
		bra        Ax_free_3
Ax_free_6:
		moveq.l    #1,d0
		and.l      (a7),d0
		beq.s      Ax_free_4
		suba.l     a0,a0
		moveq.l    #6,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		movea.l    8(a7),a0
		movea.l    ACSblk,a1
		movea.l    722(a1),a1
		jsr        (a1)
		bra.s      Ax_free_3
Ax_free_4:
		movea.l    act,a0
		moveq.l    #32,d0
		cmp.l      4(a0),d0
		bgt.s      Ax_free_7
		move.l     #$00000088,d0
		bsr        Ax_malloc
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Ax_free_8
		movea.l    8(a7),a0
		bsr        Ax_ifree
		bra.s      Ax_free_3
Ax_free_8:
		movea.l    4(a7),a0
		move.l     act,(a0)
		movea.l    4(a7),a0
		clr.l      4(a0)
		move.l     4(a7),act
Ax_free_7:
		movea.l    act,a0
		move.l     4(a0),d0
		addq.l     #1,4(a0)
		lsl.l      #2,d0
		movea.l    act,a0
		move.l     8(a7),8(a0,d0.l)
Ax_free_3:
		lea.l      12(a7),a7
		rts

	.globl Ax_release
Ax_release:
		subq.w     #4,a7
		bra.s      Ax_release_1
Ax_release_6:
		bra.s      Ax_release_2
Ax_release_3:
		movea.l    act,a0
		move.l     4(a0),d0
		lsl.l      #2,d0
		movea.l    act,a0
		movea.l    8(a0,d0.l),a0
		bsr        Ax_ifree
Ax_release_2:
		movea.l    act,a0
		move.l     4(a0),d0
		subq.l     #1,4(a0)
		tst.l      d0
		bgt.s      Ax_release_3
		movea.l    act,a0
		clr.l      4(a0)
		movea.l    act,a0
		move.l     (a0),(a7)
		move.l     (a7),d0
		bne.s      Ax_release_4
		bra.s      Ax_release_5
Ax_release_4:
		move.l     #$00000088,d0
		movea.l    act,a0
		jsr        Ax_recycle
		move.l     (a7),act
Ax_release_1:
		bra.s      Ax_release_6
Ax_release_5:
		addq.w     #4,a7
		rts

	.globl Ax_glmalloc
Ax_glmalloc:
		lea.l      -10(a7),a7
		move.l     d0,6(a7)
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		bne.s      Ax_glmalloc_1
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		bne.s      Ax_glmalloc_1
		jsr        accgemdos
Ax_glmalloc_1:
		jsr        Mxmask
		move.w     d0,4(a7)
		move.w     4(a7),d0
		beq.s      Ax_glmalloc_2
		moveq.l    #35,d1
		and.w      4(a7),d1
		move.l     6(a7),d0
		jsr        Mxalloc
		move.l     a0,(a7)
		bra.s      Ax_glmalloc_3
Ax_glmalloc_2:
		move.l     6(a7),d0
		jsr        Malloc
		move.l     a0,(a7)
Ax_glmalloc_3:
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		bne.s      Ax_glmalloc_4
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		bne.s      Ax_glmalloc_4
		jsr        oldgemdos
Ax_glmalloc_4:
		movea.l    (a7),a0
		lea.l      10(a7),a7
		rts

	.globl Ax_glfree
Ax_glfree:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		bne.s      Ax_glfree_1
		movea.l    ACSblk,a0
		move.w     568(a0),d0
		beq.s      Ax_glfree_2
Ax_glfree_1:
		movea.l    (a7),a0
		jsr        Mfree
		bra.s      Ax_glfree_3
Ax_glfree_2:
		jsr        accgemdos
		movea.l    (a7),a0
		jsr        Mfree
		jsr        oldgemdos
Ax_glfree_3:
		addq.w     #4,a7
		rts

handle_sigbus:
		move.l     d2,-(a7)
		jsr        Psigreturn
		moveq.l    #1,d0
		lea.l      check,a0
		jsr        longjmp
		move.l     (a7)+,d2
		rts

	.globl Ax_memCheck
Ax_memCheck:
		lea.l      -30(a7),a7
		move.l     a0,26(a7)
		move.l     d0,22(a7)
		move.w     d1,20(a7)
		move.l     26(a7),2(a7)
		lea.l      handle_sigbus(pc),a0
		moveq.l    #10,d0
		jsr        Psignal
		move.l     d0,10(a7)
		moveq.l    #-32,d0
		cmp.l      10(a7),d0
		bne.s      Ax_memCheck_1
		moveq.l    #1,d0
		bra        Ax_memCheck_2
Ax_memCheck_1:
		lea.l      handle_sigbus(pc),a0
		moveq.l    #11,d0
		jsr        Psignal
		move.l     d0,6(a7)
		moveq.l    #-32,d0
		cmp.l      6(a7),d0
		bne.s      Ax_memCheck_3
		movea.l    10(a7),a0
		moveq.l    #10,d0
		jsr        Psignal
		moveq.l    #1,d0
		bra        Ax_memCheck_2
Ax_memCheck_3:
		move.w     #$0001,18(a7)
		lea.l      check,a0
		jsr        setjmp
		tst.w      d0
		beq.s      Ax_memCheck_4
		clr.w      18(a7)
		bra        Ax_memCheck_5
Ax_memCheck_4:
		moveq.l    #-1,d0
		and.w      24(a7),d0
		addq.w     #2,d0
		beq.s      Ax_memCheck_6
		subq.w     #1,d0
		beq.s      Ax_memCheck_7
		bra.s      Ax_memCheck_8
Ax_memCheck_7:
		move.b     #$41,(a7)
		bra.s      Ax_memCheck_9
Ax_memCheck_11:
		movea.l    2(a7),a0
		move.b     (a0),(a7)
		move.w     20(a7),d0
		beq.s      Ax_memCheck_10
		movea.l    2(a7),a0
		move.b     (a7),(a0)
Ax_memCheck_10:
		addq.l     #1,2(a7)
Ax_memCheck_9:
		move.b     (a7),d0
		bne.s      Ax_memCheck_11
		bra.s      Ax_memCheck_5
Ax_memCheck_6:
		move.b     #$41,(a7)
		bra.s      Ax_memCheck_12
Ax_memCheck_14:
		movea.l    2(a7),a0
		move.b     (a0),(a7)
		move.w     20(a7),d0
		beq.s      Ax_memCheck_13
		movea.l    2(a7),a0
		move.b     (a7),(a0)
Ax_memCheck_13:
		addq.l     #1,2(a7)
Ax_memCheck_12:
		move.b     (a7),d0
		bne.s      Ax_memCheck_14
		movea.l    2(a7),a0
		move.b     -1(a0),d0
		bne.s      Ax_memCheck_14
		bra.s      Ax_memCheck_5
Ax_memCheck_8:
		clr.l      14(a7)
		bra.s      Ax_memCheck_15
Ax_memCheck_17:
		movea.l    2(a7),a0
		move.b     (a0),(a7)
		move.w     20(a7),d0
		beq.s      Ax_memCheck_16
		movea.l    2(a7),a0
		move.b     (a7),(a0)
Ax_memCheck_16:
		addq.l     #1,14(a7)
		addq.l     #1,2(a7)
Ax_memCheck_15:
		move.l     14(a7),d0
		cmp.l      22(a7),d0
		blt.s      Ax_memCheck_17
Ax_memCheck_5:
		movea.l    10(a7),a0
		moveq.l    #10,d0
		jsr        Psignal
		movea.l    6(a7),a0
		moveq.l    #11,d0
		jsr        Psignal
		move.w     18(a7),d0
Ax_memCheck_2:
		lea.l      30(a7),a7
		rts

sortFreeMemList:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		move.l     (a0),d0
		movea.l    (a7),a0
		cmp.l      (a0),d0
		beq.s      sortFreeMemList_1
		movea.l    4(a7),a0
		move.w     2(a0),d0
		movea.l    (a7),a0
		sub.w      2(a0),d0
		bra.s      sortFreeMemList_2
		bra.s      sortFreeMemList_2
sortFreeMemList_1:
		movea.l    (a7),a0
		move.w     8(a0),d0
		movea.l    4(a7),a0
		sub.w      8(a0),d0
		nop
sortFreeMemList_2:
		addq.w     #8,a7
		rts

searchFreeMemList:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		move.w     2(a0),d0
		movea.l    (a7),a0
		sub.w      2(a0),d0
		addq.w     #8,a7
		rts

RecycleFreeBlocks:
		lea.l      -12(a7),a7
		move.l     d0,4(a7)
		clr.l      (a7)
		move.w     freeBlockListAnz,d0
		ble.s      RecycleFreeBlocks_1
		pea.l      searchFreeMemList(pc)
		moveq.l    #20,d1
		move.w     freeBlockListAnz,d0
		ext.l      d0
		movea.l    freeBlockList,a1
		lea.l      8(a7),a0
		jsr        bsearch
		addq.w     #4,a7
		move.l     a0,(a7)
RecycleFreeBlocks_1:
		move.l     (a7),d0
		beq.s      RecycleFreeBlocks_2
		movea.l    (a7),a0
		move.l     16(a0),d0
		beq.s      RecycleFreeBlocks_2
		movea.l    (a7),a0
		move.l     16(a0),8(a7)
		movea.l    8(a7),a0
		movea.l    (a7),a1
		move.l     (a0),16(a1)
		movea.l    (a7),a0
		move.w     10(a0),d0
		ble.s      RecycleFreeBlocks_3
		movea.l    (a7),a0
		subq.w     #1,10(a0)
RecycleFreeBlocks_3:
		movea.l    (a7),a0
		move.w     14(a0),d0
		ble.s      RecycleFreeBlocks_4
		movea.l    (a7),a0
		subq.w     #1,14(a0)
RecycleFreeBlocks_4:
		movea.l    8(a7),a0
		bra.s      RecycleFreeBlocks_5
RecycleFreeBlocks_2:
		suba.l     a0,a0
RecycleFreeBlocks_5:
		lea.l      12(a7),a7
		rts

	.globl Ax_recycle
Ax_recycle:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     d0,10(a7)
		clr.w      8(a7)
		move.l     14(a7),4(a7)
		clr.l      (a7)
		move.l     14(a7),d0
		beq.s      Ax_recycle_1
		movea.l    14(a7),a0
		cmpa.l     #null_string,a0
		bne.s      Ax_recycle_2
Ax_recycle_1:
		bra        Ax_recycle_3
Ax_recycle_2:
		move.w     freeBlockListAnz,d0
		ble.s      Ax_recycle_4
		pea.l      searchFreeMemList(pc)
		moveq.l    #20,d1
		move.w     freeBlockListAnz,d0
		ext.l      d0
		movea.l    freeBlockList,a1
		lea.l      14(a7),a0
		jsr        bsearch
		addq.w     #4,a7
		move.l     a0,(a7)
Ax_recycle_4:
		move.l     (a7),d0
		beq.s      Ax_recycle_5
		movea.l    (a7),a0
		move.w     10(a0),d0
		movea.l    (a7),a0
		cmp.w      8(a0),d0
		bge.s      Ax_recycle_6
		movea.l    (a7),a0
		movea.l    4(a7),a1
		move.l     16(a0),(a1)
		movea.l    (a7),a0
		move.l     4(a7),16(a0)
		move.w     #$0001,8(a7)
		movea.l    (a7),a0
		addq.w     #1,10(a0)
		movea.l    (a7),a0
		move.w     10(a0),d0
		movea.l    (a7),a0
		cmp.w      12(a0),d0
		ble.s      Ax_recycle_6
		movea.l    (a7),a0
		movea.l    (a7),a1
		move.w     10(a0),12(a1)
Ax_recycle_6:
		movea.l    (a7),a0
		addq.w     #1,14(a0)
Ax_recycle_5:
		move.w     8(a7),d0
		bne.s      Ax_recycle_3
		movea.l    14(a7),a0
		bsr        Ax_free
Ax_recycle_3:
		lea.l      18(a7),a7
		rts

createNewList:
		lea.l      -14(a7),a7
		move.l     d0,10(a7)
		move.w     d1,8(a7)
		move.l     a0,4(a7)
		clr.l      (a7)
		moveq.l    #1,d1
		add.w      freeBlockListAnz,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #2,d0
		bsr        _malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      createNewList_1
		clr.w      d0
		bra        createNewList_2
createNewList_1:
		move.w     freeBlockListAnz,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #2,d0
		movea.l    freeBlockList,a1
		movea.l    (a7),a0
		jsr        memcpy
		movea.l    freeBlockList,a0
		cmpa.l     #_freeBlockList,a0
		beq.s      createNewList_3
		movea.l    freeBlockList,a0
		bsr        Ax_free
createNewList_3:
		move.l     (a7),freeBlockList
		addq.w     #1,freeBlockListAnz
		move.w     freeBlockListAnz,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #2,d0
		movea.l    freeBlockList,a0
		lea.l      -20(a0,d0.l),a0
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.l     10(a7),(a0)
		movea.l    (a7),a0
		move.l     4(a7),4(a0)
		movea.l    (a7),a0
		clr.l      16(a0)
		movea.l    (a7),a0
		move.w     8(a7),8(a0)
		movea.l    (a7),a0
		clr.w      10(a0)
		movea.l    (a7),a0
		clr.w      12(a0)
		movea.l    (a7),a0
		clr.w      14(a0)
		move.w     freeBlockListAnz,d0
		ble.s      createNewList_4
		lea.l      sortFreeMemList(pc),a1
		moveq.l    #20,d1
		move.w     freeBlockListAnz,d0
		ext.l      d0
		movea.l    freeBlockList,a0
		jsr        qsort
createNewList_4:
		moveq.l    #1,d0
createNewList_2:
		lea.l      14(a7),a7
		rts

deleteOldList:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		clr.l      8(a7)
		bra.s      deleteOldList_1
deleteOldList_2:
		movea.l    12(a7),a0
		move.l     16(a0),4(a7)
		movea.l    4(a7),a0
		movea.l    12(a7),a1
		move.l     (a0),16(a1)
		movea.l    4(a7),a0
		bsr        Ax_free
deleteOldList_1:
		movea.l    12(a7),a0
		move.l     16(a0),d0
		bne.s      deleteOldList_2
		cmpi.w     #$0001,freeBlockListAnz
		ble.s      deleteOldList_3
		moveq.l    #-1,d1
		add.w      freeBlockListAnz,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #2,d0
		bsr        _malloc
		move.l     a0,8(a7)
deleteOldList_3:
		move.l     8(a7),d0
		beq        deleteOldList_4
		clr.w      (a7)
		clr.w      2(a7)
		bra.s      deleteOldList_5
deleteOldList_7:
		move.w     2(a7),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #2,d0
		movea.l    freeBlockList,a0
		adda.l     d0,a0
		cmpa.l     12(a7),a0
		beq.s      deleteOldList_6
		moveq.l    #20,d0
		move.w     2(a7),d2
		ext.l      d2
		move.l     d2,d1
		lsl.l      #2,d1
		add.l      d2,d1
		lsl.l      #2,d1
		movea.l    freeBlockList,a1
		adda.l     d1,a1
		move.w     (a7),d2
		addq.w     #1,(a7)
		ext.l      d2
		move.l     d2,d1
		lsl.l      #2,d1
		add.l      d2,d1
		lsl.l      #2,d1
		movea.l    8(a7),a0
		adda.l     d1,a0
		jsr        memcpy
deleteOldList_6:
		addq.w     #1,2(a7)
deleteOldList_5:
		move.w     2(a7),d0
		cmp.w      freeBlockListAnz,d0
		blt.s      deleteOldList_7
		movea.l    freeBlockList,a0
		cmpa.l     #_freeBlockList,a0
		beq.s      deleteOldList_8
		movea.l    freeBlockList,a0
		bsr        Ax_free
deleteOldList_8:
		move.l     8(a7),freeBlockList
		subq.w     #1,freeBlockListAnz
deleteOldList_4:
		move.w     freeBlockListAnz,d0
		ble.s      deleteOldList_9
		lea.l      sortFreeMemList(pc),a1
		moveq.l    #20,d1
		move.w     freeBlockListAnz,d0
		ext.l      d0
		movea.l    freeBlockList,a0
		jsr        qsort
deleteOldList_9:
		lea.l      16(a7),a7
		rts

	.globl Ax_setRecycleSize
Ax_setRecycleSize:
		lea.l      -22(a7),a7
		move.l     d0,14(a7)
		move.w     d1,12(a7)
		move.l     a0,8(a7)
		clr.l      4(a7)
		clr.w      (a7)
		moveq.l    #8,d0
		cmp.l      14(a7),d0
		ble.s      Ax_setRecycleSize_1
		move.l     14(a7),d0
		beq.s      Ax_setRecycleSize_1
		clr.w      d0
		bra        Ax_setRecycleSize_2
Ax_setRecycleSize_1:
		move.l     freeBlockStat,d0
		beq.s      Ax_setRecycleSize_3
		movea.l    freeBlockStat,a0
		bsr        Ax_free
Ax_setRecycleSize_3:
		clr.l      freeBlockStat
		move.w     freeBlockListAnz,d0
		ble.s      Ax_setRecycleSize_4
		pea.l      searchFreeMemList(pc)
		moveq.l    #20,d1
		move.w     freeBlockListAnz,d0
		ext.l      d0
		movea.l    freeBlockList,a1
		lea.l      18(a7),a0
		jsr        bsearch
		addq.w     #4,a7
		move.l     a0,4(a7)
Ax_setRecycleSize_4:
		move.l     4(a7),d0
		bne.s      Ax_setRecycleSize_5
		move.w     12(a7),d0
		ble.s      Ax_setRecycleSize_6
		movea.l    8(a7),a0
		move.w     12(a7),d1
		move.l     14(a7),d0
		bsr        createNewList
		move.w     d0,(a7)
Ax_setRecycleSize_6:
		bra        Ax_setRecycleSize_7
Ax_setRecycleSize_5:
		move.w     12(a7),2(a7)
		bra.s      Ax_setRecycleSize_8
Ax_setRecycleSize_10:
		movea.l    4(a7),a0
		move.l     16(a0),18(a7)
		movea.l    18(a7),a0
		movea.l    4(a7),a1
		move.l     (a0),16(a1)
		movea.l    18(a7),a0
		bsr        Ax_free
		addq.w     #1,2(a7)
Ax_setRecycleSize_8:
		movea.l    4(a7),a0
		move.l     16(a0),d0
		beq.s      Ax_setRecycleSize_9
		movea.l    4(a7),a0
		move.w     2(a7),d0
		cmp.w      8(a0),d0
		bge.s      Ax_setRecycleSize_9
		movea.l    4(a7),a0
		move.w     2(a7),d0
		cmp.w      10(a0),d0
		blt.s      Ax_setRecycleSize_10
Ax_setRecycleSize_9:
		movea.l    4(a7),a0
		move.w     12(a7),8(a0)
		movea.l    4(a7),a0
		move.w     10(a0),d0
		cmp.w      12(a7),d0
		ble.s      Ax_setRecycleSize_11
		movea.l    4(a7),a0
		move.w     12(a7),10(a0)
Ax_setRecycleSize_11:
		move.w     12(a7),d0
		bgt.s      Ax_setRecycleSize_12
		movea.l    4(a7),a0
		bsr        deleteOldList
Ax_setRecycleSize_12:
		move.w     #$0001,(a7)
Ax_setRecycleSize_7:
		move.w     (a7),d0
Ax_setRecycleSize_2:
		lea.l      22(a7),a7
		rts

	.globl Ax_getRecycleStat
Ax_getRecycleStat:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		clr.l      6(a7)
		clr.l      2(a7)
		move.l     freeBlockStat,d0
		bne.s      Ax_getRecycleStat_1
		move.w     freeBlockListAnz,d0
		ext.l      d0
		lsl.l      #4,d0
		bsr        Ax_malloc
		move.l     a0,freeBlockStat
		move.l     freeBlockStat,d0
		bne.s      Ax_getRecycleStat_1
		suba.l     a0,a0
		bra        Ax_getRecycleStat_2
Ax_getRecycleStat_1:
		clr.w      (a7)
		bra.s      Ax_getRecycleStat_3
Ax_getRecycleStat_4:
		move.w     (a7),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #2,d0
		add.l      d1,d0
		lsl.l      #2,d0
		movea.l    freeBlockList,a0
		adda.l     d0,a0
		move.l     a0,6(a7)
		move.w     (a7),d0
		ext.l      d0
		lsl.l      #4,d0
		movea.l    freeBlockStat,a0
		adda.l     d0,a0
		move.l     a0,2(a7)
		movea.l    6(a7),a0
		movea.l    2(a7),a1
		move.l     (a0),(a1)
		movea.l    6(a7),a0
		movea.l    2(a7),a1
		move.l     4(a0),4(a1)
		movea.l    6(a7),a0
		movea.l    2(a7),a1
		move.w     8(a0),8(a1)
		movea.l    6(a7),a0
		movea.l    2(a7),a1
		move.w     10(a0),10(a1)
		movea.l    6(a7),a0
		movea.l    2(a7),a1
		move.w     12(a0),12(a1)
		movea.l    6(a7),a0
		movea.l    2(a7),a1
		move.w     14(a0),14(a1)
		addq.w     #1,(a7)
Ax_getRecycleStat_3:
		move.w     (a7),d0
		cmp.w      freeBlockListAnz,d0
		blt        Ax_getRecycleStat_4
		move.l     10(a7),d0
		beq.s      Ax_getRecycleStat_5
		movea.l    10(a7),a0
		move.w     freeBlockListAnz,(a0)
Ax_getRecycleStat_5:
		movea.l    freeBlockStat,a0
Ax_getRecycleStat_2:
		lea.l      14(a7),a7
		rts

	.data

	.globl in_use
in_use:
		dc.w $0000
		dc.w $0000
MemInit:
		dc.w $0000
start:
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
act:
		dc.l start
_freeBlockList:
		dc.w $0000
		dc.w $00a2
		dc.l xe0b38
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0020
		dc.l xe0b40
		dc.w $01f4
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0026
		dc.l xe0b49
		dc.w $0005
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0022
		dc.l xe0b52
		dc.w $0005
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0016
		dc.l xe0b5a
		dc.w $000a
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $000e
		dc.l xe0b60
		dc.w $000a
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $001c
		dc.l xe0b67
		dc.w $001e
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0014
		dc.l xe0b6f
		dc.w $000f
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.l xe0b74
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0026
		dc.l xe0b7f
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $001a
		dc.l xe0b8b
		dc.w $0005
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0016
		dc.l xe0b96
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0024
		dc.l xe0b9b
		dc.w $000a
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0012
		dc.l xe0bac
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.l xe0bba
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0018
		dc.l xe0bc3
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0020
		dc.l xe0bce
		dc.w $0004
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0072
		dc.l xe0bd3
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $003e
		dc.l xe0bdf
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0088
		dc.l xe0bea
		dc.w $0005
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.l xe0bfd
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0022
		dc.l xe0c08
		dc.w $0005
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0012
		dc.l xe0c10
		dc.w $0005
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.l xe0c19
		dc.w $0005
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0044
		dc.l xe0c24
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $000c
		dc.l xe0c2e
		dc.w $0028
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
freeBlockList:
		dc.l _freeBlockList
freeBlockListAnz:
		dc.w $001a
freeBlockStat:
		dc.w $0000
		dc.w $0000
xe0b38:
		dc.b 'Awindow',0
xe0b40:
		dc.b 'AUSERBLK',0
xe0b49:
		dc.b 'CICONBLK',0
xe0b52:
		dc.b 'ICONBLK',0
xe0b5a:
		dc.b 'CICON',0
xe0b60:
		dc.b 'BITBLK',0
xe0b67:
		dc.b 'TEDINFO',0
xe0b6f:
		dc.b 'MFDB',0
xe0b74:
		dc.b 'FontSelect',0
xe0b7f:
		dc.b 'PrintSelect',0
xe0b8b:
		dc.b 'MsgService',0
xe0b96:
		dc.b 'A_dd',0
xe0b9b:
		dc.b 'Interne DD-Daten',0
xe0bac:
		dc.b 'GS-Connection',0
xe0bba:
		dc.b 'GS-Suche',0
xe0bc3:
		dc.b 'GS-Antwort',0
xe0bce:
		dc.b 'OLGA',0
xe0bd3:
		dc.b 'Thermometer',0
xe0bdf:
		dc.b 'FileSelect',0
xe0bea:
		dc.b 'Int. Speicherverw.',0
xe0bfd:
		dc.b 'XAcc-Daten',0
xe0c08:
		dc.b 'UConfig',0
xe0c10:
		dc.b 'UCfgInfo',0
xe0c19:
		dc.b 'Cfg-Gruppe',0
xe0c24:
		dc.b 'ULinListe',0
xe0c2e:
		dc.b 'ULinListe-Element',0
		.even

	.bss
watch_min: ds.l 1
watch_max: ds.l 1
check: ds.b 48
