		.text

omalloc:
		movem.l    d3/a2-a3,-(a7)
		move.l     d0,d3
		suba.l     a2,a2
		tst.l      d0
		beq.s      omalloc_1
		jsr        Ax_malloc
		movea.l    a0,a2
		move.l     a2,d0
		beq.s      omalloc_2
omalloc_1:
		moveq.l    #66,d0
		jsr        Ax_malloc
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      omalloc_3
		movea.l    a2,a0
		jsr        Ax_free
omalloc_2:
		suba.l     a0,a0
		bra.s      omalloc_4
omalloc_3:
		moveq.l    #66,d1
		clr.w      d0
		movea.l    a3,a0
		jsr        memset
		move.l     a2,4(a3)
		move.w     #$0001,54(a3)
		clr.l      (a3)
		move.l     d3,10(a3)
		move.l     d3,14(a3)
		movea.l    a3,a0
omalloc_4:
		movem.l    (a7)+,d3/a2-a3
		rts

part_add:
		movem.l    d3/a2-a5,-(a7)
		lea.l      -24(a7),a7
		movea.l    a0,a3
		cmpi.w     #$0028,part_ucnt
		bge        part_add_1
		movea.l    parts_window,a1
		move.l     20(a1),20(a7)
		move.w     #$0080,d1
		moveq.l    #-1,d0
		movea.l    20(a7),a0
		jsr        Aob_findflag
		move.w     d0,d3
		tst.w      d0
		bmi        part_add_1
		ext.l      d0
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		movea.l    20(a7),a4
		adda.l     d1,a4
		move.w     2(a4),d3
		ext.l      d3
		move.l     d3,d2
		add.l      d2,d2
		add.l      d3,d2
		lsl.l      #3,d2
		movea.l    20(a7),a0
		adda.l     d2,a0
		move.l     a0,16(a7)
		lea.l      24(a0),a0
		move.l     a0,12(a7)
		move.w     18(a0),d0
		move.w     d0,d1
		lsl.w      #3,d1
		sub.w      d0,d1
		lsl.w      #3,d1
		lea.l      tree,a1
		adda.w     d1,a1
		move.l     a1,8(a7)
		move.w     #$0018,14(a1)
		movea.l    52(a3),a0
		move.w     8(a0),16(a1)
		movea.l    52(a3),a0
		move.w     10(a0),18(a1)
		movea.l    52(a3),a0
		move.w     16(a0),24(a1)
		movea.l    52(a3),a0
		move.w     18(a0),26(a1)
		movea.l    52(a3),a0
		move.w     20(a0),28(a1)
		movea.l    52(a3),a0
		move.w     22(a0),30(a1)
		movea.l    56(a3),a5
		moveq.l    #32,d0
		bsr        omalloc
		move.l     a0,(a7)
		move.l     a0,d0
		beq        part_add_1
		lea.l      xbb582,a1
		move.l     a1,-(a7)
		lea.l      22(a0),a0
		movea.l    a3,a1
		jsr        strcpy
		movea.l    (a7)+,a1
		moveq.l    #31,d0
		jsr        strncat
		jsr        strupr
		move.w     18(a5),d0
		lsl.w      #2,d0
		or.w       8(a5),d0
		move.w     28(a5),d1
		lsl.w      #4,d1
		or.w       d1,d0
		movea.l    (a7),a0
		move.w     d0,56(a0)
		move.l     4(a0),4(a7)
		moveq.l    #0,d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		beq        part_add_1
		movea.l    a3,a1
		lea.l      22(a2),a0
		jsr        strcpy
		move.w     #$0203,56(a2)
		movea.l    4(a7),a0
		move.l     a2,(a0)
		moveq.l    #0,d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		beq        part_add_1
		movea.l    (a5),a1
		lea.l      22(a2),a0
		jsr        strcpy
		clr.w      56(a2)
		movea.l    4(a7),a0
		move.l     a2,4(a0)
		move.l     4(a5),d0
		beq.s      part_add_2
		movea.l    d0,a1
		move.b     (a1),d1
		beq.s      part_add_2
		moveq.l    #0,d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		beq        part_add_1
		movea.l    4(a5),a1
		lea.l      22(a2),a0
		jsr        strcpy
		move.w     #$0204,56(a2)
		bra.s      part_add_3
part_add_2:
		suba.l     a2,a2
part_add_3:
		movea.l    4(a7),a0
		move.l     a2,8(a0)
		move.w     8(a5),d0
		subq.w     #1,d0
		beq.s      part_add_4
		subq.w     #1,d0
		beq.s      part_add_5
		subq.w     #1,d0
		beq.s      part_add_6
		bra        part_add_7
part_add_4:
		moveq.l    #0,d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		beq        part_add_1
		clr.w      56(a2)
		bra.s      part_add_8
part_add_5:
		movea.l    10(a5),a0
		jsr        strlen
		move.l     d0,d3
		addq.l     #1,d3
		move.l     d3,d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		beq        part_add_1
		lea.l      xbb585,a1
		lea.l      22(a2),a0
		jsr        strcpy
		movea.l    10(a5),a1
		movea.l    4(a2),a0
		jsr        strcpy
		bra.s      part_add_8
part_add_6:
		move.l     14(a5),d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		beq        part_add_1
		lea.l      xbb58d,a1
		lea.l      22(a2),a0
		jsr        strcpy
		move.l     14(a5),d0
		movea.l    10(a5),a1
		movea.l    4(a2),a0
		jsr        memcpy
part_add_8:
		movea.l    4(a7),a0
		move.l     a2,12(a0)
		bra.s      part_add_9
part_add_7:
		movea.l    4(a7),a0
		clr.l      12(a0)
part_add_9:
		move.w     18(a5),d0
		subq.w     #1,d0
		beq.s      part_add_10
		subq.w     #1,d0
		beq.s      part_add_11
		subq.w     #1,d0
		beq.s      part_add_12
		bra        part_add_13
part_add_10:
		moveq.l    #0,d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		beq        part_add_1
		clr.w      56(a2)
		bra.s      part_add_14
part_add_11:
		movea.l    20(a5),a0
		jsr        strlen
		move.l     d0,d3
		addq.l     #1,d3
		move.l     d3,d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		beq        part_add_1
		lea.l      xbb585,a1
		lea.l      22(a2),a0
		jsr        strcpy
		movea.l    20(a5),a1
		movea.l    4(a2),a0
		jsr        strcpy
		bra.s      part_add_14
part_add_12:
		move.l     24(a5),d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		beq        part_add_1
		lea.l      xbb58d,a1
		lea.l      22(a2),a0
		jsr        strcpy
		move.l     24(a5),d0
		movea.l    20(a5),a1
		movea.l    4(a2),a0
		jsr        memcpy
part_add_14:
		movea.l    4(a7),a0
		move.l     a2,16(a0)
		bra.s      part_add_15
part_add_13:
		movea.l    4(a7),a0
		clr.l      16(a0)
part_add_15:
		move.w     28(a5),d0
		subq.w     #1,d0
		beq.s      part_add_16
		subq.w     #1,d0
		beq.s      part_add_17
		subq.w     #1,d0
		beq.s      part_add_18
		bra        part_add_19
part_add_16:
		moveq.l    #0,d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		beq        part_add_1
		clr.w      56(a2)
		bra.s      part_add_20
part_add_17:
		movea.l    30(a5),a0
		jsr        strlen
		move.l     d0,d3
		addq.l     #1,d3
		move.l     d3,d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		beq        part_add_1
		lea.l      xbb585,a1
		lea.l      22(a2),a0
		jsr        strcpy
		movea.l    30(a5),a1
		movea.l    4(a2),a0
		jsr        strcpy
		bra.s      part_add_20
part_add_18:
		move.l     34(a5),d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		beq        part_add_1
		lea.l      xbb58d,a1
		lea.l      22(a2),a0
		jsr        strcpy
		move.l     34(a5),d0
		movea.l    30(a5),a1
		movea.l    4(a2),a0
		jsr        memcpy
part_add_20:
		movea.l    4(a7),a0
		move.l     a2,20(a0)
		bra.s      part_add_21
part_add_19:
		movea.l    4(a7),a0
		clr.l      20(a0)
part_add_21:
		movea.l    38(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      part_add_22
		movea.l    38(a5),a0
		jsr        strlen
		addq.l     #1,d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		beq.s      part_add_1
		lea.l      xbb596,a1
		lea.l      22(a2),a0
		jsr        strcpy
		movea.l    38(a5),a1
		movea.l    4(a2),a0
		jsr        strcpy
		move.w     #$0400,56(a2)
		bra.s      part_add_23
part_add_22:
		suba.l     a2,a2
part_add_23:
		movea.l    4(a7),a0
		move.l     a2,24(a0)
		movea.l    42(a5),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      part_add_24
		movea.l    42(a5),a0
		jsr        strlen
		addq.l     #1,d0
		bsr        omalloc
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      part_add_25
part_add_1:
		moveq.l    #-1,d0
		bra        part_add_26
part_add_25:
		lea.l      xbb5a0,a1
		lea.l      22(a2),a0
		jsr        strcpy
		movea.l    42(a5),a1
		movea.l    4(a2),a0
		jsr        strcpy
		move.w     #$0400,56(a2)
		bra.s      part_add_27
part_add_24:
		suba.l     a2,a2
part_add_27:
		movea.l    4(a7),a0
		move.l     a2,28(a0)
		movea.l    8(a7),a1
		move.l     (a7),20(a1)
		movea.l    48(a3),a2
		move.w     6(a2),6(a4)
		movea.l    48(a3),a2
		move.w     10(a2),d0
		or.w       #$2000,d0
		move.w     d0,10(a4)
		movea.l    48(a3),a2
		move.l     12(a2),12(a4)
		movea.l    48(a3),a2
		move.w     16(a2),d0
		move.w     d0,16(a4)
		movea.l    16(a7),a2
		move.w     d0,16(a2)
		movea.l    48(a3),a5
		move.w     18(a5),d1
		move.w     d1,18(a4)
		move.w     d1,18(a2)
		movea.l    48(a3),a5
		move.w     20(a5),d0
		move.w     d0,20(a4)
		move.w     d0,20(a2)
		movea.l    48(a3),a5
		move.w     22(a5),d1
		move.w     d1,22(a4)
		move.w     d1,22(a2)
		andi.w     #$FF7F,8(a4)
		cmpi.w     #$0018,6(a4)
		bne.s      part_add_28
		movea.l    12(a4),a2
		move.l     8(a2),d0
		beq.s      part_add_28
		movea.l    d0,a5
		movea.l    a4,a0
		moveq.l    #1,d0
		suba.l     a1,a1
		jsr        (a5)
part_add_28:
		movea.l    _globl,a1
		clr.w      d0
		movea.l    a4,a0
		jsr        mt_rsrc_obfix
		movea.l    _globl,a1
		clr.w      d0
		movea.l    16(a7),a0
		jsr        mt_rsrc_obfix
		move.l     #uocall,64(a3)
		move.w     part_ucnt,d0
		lsl.w      #2,d0
		lea.l      part_list,a0
		move.l     a3,0(a0,d0.w)
		addq.w     #1,part_ucnt
		clr.w      d0
part_add_26:
		lea.l      24(a7),a7
		movem.l    (a7)+,d3/a2-a5
		rts

	.globl part_get
part_get:
		movem.l    d3/a2-a3,-(a7)
		movea.l    a0,a3
		moveq.l    #-1,d3
		add.w      part_ucnt,d3
		lea.l      part_list,a2
		bra.s      part_get_1
part_get_4:
		move.w     d3,d0
		lsl.w      #2,d0
		movea.l    0(a2,d0.w),a1
		movea.l    a3,a0
		jsr        strcmp
		tst.w      d0
		bne.s      part_get_2
		move.w     d3,d0
		lsl.w      #2,d0
		movea.l    0(a2,d0.w),a0
		bra.s      part_get_3
part_get_2:
		subq.w     #1,d3
part_get_1:
		tst.w      d3
		bpl.s      part_get_4
		suba.l     a0,a0
part_get_3:
		movem.l    (a7)+,d3/a2-a3
		rts

	.globl part_make
part_make:
		movem.l    a2-a5,-(a7)
		lea.l      -262(a7),a7
		suba.l     a2,a2
		lea.l      WI_PARTS,a0
		jsr        Awi_create
		movea.l    a0,a3
		move.l     a0,parts_window
		move.l     a3,d0
		beq.s      part_make_1
		movea.l    a3,a0
		jsr        init_boxed
		movea.l    a3,a0
		jsr        init_title
		movea.l    a3,a0
		jsr        init_3Dbutton
		movea.l    a3,a0
		jsr        init_check
		movea.l    a3,a0
		jsr        init_cycle
		movea.l    a3,a0
		jsr        init_slider
		movea.l    a3,a0
		jsr        init_ftext
		movea.l    a3,a0
		jsr        init_inner
		movea.l    a3,a0
		jsr        init_picture
		movea.l    a3,a0
		jsr        init_editor
		movea.l    a3,a0
		jsr        init_pattern
		movea.l    a3,a0
		jsr        init_arrow
		movea.l    a3,a0
		jsr        init_select
part_make_1:
		lea.l      6(a7),a4
		movea.l    ACSblk,a1
		lea.l      158(a1),a1
		movea.l    a4,a0
		jsr        strcpy
		cmpi.b     #$43,(a4)
		bge.s      part_make_2
		jsr        Dgetdrv
		jsr        Dsetdrv
		and.l      #$00000004,d0
		beq.s      part_make_2
		move.b     #$43,(a4)
part_make_2:
		moveq.l    #92,d0
		movea.l    a4,a0
		jsr        strrchr
		movea.l    a0,a5
		move.l     a5,d0
		beq.s      part_make_3
		move.b     1(a5),d0
		beq.s      part_make_3
		clr.b      1(a5)
part_make_3:
		movea.l    a4,a0
		jsr        Af_readdir
		movea.l    a0,a5
		movea.l    a5,a2
		move.l     a2,d0
		beq.s      part_make_4
		bra.s      part_make_5
part_make_7:
		lea.l      xbb5ab,a1
		move.l     a1,-(a7)
		movea.l    (a5),a1
		lea.l      4(a7),a0
		jsr        Af_2ext
		jsr        strupr
		movea.l    (a7)+,a1
		jsr        strcmp
		tst.w      d0
		bne.s      part_make_6
		movea.l    (a5),a0
		jsr        Ash_module
part_make_6:
		movea.l    4(a5),a5
part_make_5:
		move.l     a5,d0
		bne.s      part_make_7
		movea.l    a2,a0
		jsr        Af_freedir
part_make_4:
		movea.l    a3,a0
		lea.l      262(a7),a7
		movem.l    (a7)+,a2-a5
		rts

	.globl part_close
part_close:
		move.l     a2,-(a7)
		movea.l    a0,a2
		ori.w      #$0100,86(a2)
		jsr        Awi_closed
		andi.w     #$FEFF,86(a2)
		movea.l    (a7)+,a2
		rts

	.globl part_init
part_init:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		ori.w      #$0010,86(a2)
		lea.l      36(a2),a1
		movea.l    134(a2),a3
		jsr        (a3)
		clr.w      d0
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl part_service
part_service:
		movem.l    d3/a2-a5,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		movea.l    a1,a3
		cmp.w      #$0024,d0
		beq.s      part_service_1
		bgt.s      part_service_2
		subq.w     #1,d0
		beq.s      part_service_3
		subq.w     #1,d0
		beq.s      part_service_4
		sub.w      #$000A,d0
		beq.s      part_service_5
		bra.w      part_service_6
part_service_2:
		sub.w      #$0025,d0
		beq.s      part_service_7
		sub.w      #$2303,d0
		beq.s      part_service_8
		subq.w     #1,d0
		beq.s      part_service_9
		bra.s      part_service_6
/* case 2 */
part_service_4:
		movea.l    ACSblk,a0
		move.w     570(a0),d0
		beq.s      part_service_10
		movea.l    a2,a0
		jsr        Awi_delete
		bra.s      part_service_10
/* case 37: */
part_service_7:
		clr.l      2(a3)
		bra.s      part_service_10
/* case 36 */
part_service_1:
		move.w     #$0001,(a3)
		bra.s      part_service_10
/* case 12 */
part_service_5:
		clr.w      (a3)
		bra.s      part_service_10
/* case 9000: */
part_service_8:
		cmpi.w     #$0028,part_ucnt
		bge.s      part_service_10
		move.l     a2,(a3)
		bra.s      part_service_10
/* case 9001: */
part_service_9:
		movea.l    a3,a0
		bsr        part_add
		ori.w      #$0020,86(a2)
		bra.s      part_service_10
/* case 1 */
part_service_3:
		move.w     88(a2),d0
		bmi.s      part_service_10
		jsr        Awi_root
		movea.l    a0,a4
		lea.l      88(a2),a1
		moveq.l    #101,d0
		movea.l    4(a4),a5
		jsr        (a5)
		bra.s      part_service_10
/* default */
part_service_6:
		movea.l    a3,a1
		move.w     d3,d0
		movea.l    a2,a0
		jsr        Awi_service
		bra.s      part_service_11
part_service_10:
		moveq.l    #1,d0
part_service_11:
		movem.l    (a7)+,d3/a2-a5
		rts

	.globl glue_parts
glue_parts:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		subq.w     #8,a7
		movea.l    a0,a2
		move.w     gluepart,d0
		beq        glue_parts_1
		move.w     32(a2),d1
		ble        glue_parts_1
		lea.l      parts_window,a3
		move.l     (a3),d0
		beq.w      glue_parts_1
		movea.l    d0,a0
		move.w     32(a0),d1
		ble.s      glue_parts_1
		move.w     86(a0),d2
		and.w      #$0800,d2
		bne.s      glue_parts_1
		jsr        Aev_mess
		move.w     52(a2),d0
		movea.l    (a3),a0
		move.w     40(a0),d1
		move.w     d1,4(a7)
		sub.w      d1,d0
		move.w     d0,(a7)
		lea.l      ACSblk,a0
		move.w     54(a2),d0
		movea.l    (a0),a1
		sub.w      6(a1),d0
		move.w     d0,2(a7)
		movea.l    (a3),a2
		move.l     94(a2),d1
		beq.s      glue_parts_2
		move.w     20(a1),d2
		sub.w      d2,2(a7)
glue_parts_2:
		movea.l    (a0),a1
		move.w     (a7),d0
		cmp.w      8(a1),d0
		bge.s      glue_parts_3
		move.w     8(a1),(a7)
glue_parts_3:
		movea.l    (a0),a1
		move.w     2(a7),d0
		cmp.w      10(a1),d0
		bge.s      glue_parts_4
		move.w     10(a1),2(a7)
glue_parts_4:
		movea.l    (a3),a0
		move.w     42(a0),6(a7)
		lea.l      (a7),a1
		movea.l    138(a0),a2
		jsr        (a2)
glue_parts_1:
		addq.w     #8,a7
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

go_detail:
		movem.l    a2-a5,-(a7)
		subq.w     #6,a7
		movea.l    a0,a4
		lea.l      2(a7),a2
		clr.l      (a2)
		clr.l      -(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		pea.l      12(a7)
		moveq.l    #10,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		move.w     (a7),d0
		jsr        Awi_wid
		movea.l    a0,a3
		move.l     a3,d0
		beq.s      go_detail_1
		movea.l    a2,a1
		movea.l    4(a3),a5
		move.w     #$03F7,d0
		jsr        (a5)
		move.l     (a2),d0
		beq.s      go_detail_1
		cmpa.l     d0,a3
		bne.s      go_detail_1
		lea.l      ACSblk,a0
		movea.l    (a0),a1
		move.w     582(a1),d0
		beq.s      go_detail_1
		movea.l    576(a1),a3
		cmpa.l     (a2),a3
		bne.s      go_detail_1
		move.l     (a2),600(a1)
		jsr        (a4)
go_detail_1:
		addq.w     #6,a7
		movem.l    (a7)+,a2-a5
		rts

	.globl go_spec_edit
go_spec_edit:
		lea.l      edob_specs,a0
		bsr.w      go_detail
		rts

	.globl go_flag_edit
go_flag_edit:
		lea.l      edob_aflags,a0
		bsr.w      go_detail
		rts

	.globl go_ref_edit
go_ref_edit:
		lea.l      edob_refs,a0
		bsr        go_detail
		rts

	.globl go_pos_edit
go_pos_edit:
		lea.l      edob_pos,a0
		bsr        go_detail
		rts

	.data


xbb582:
	dc.b '01',0
xbb585:
	dc.b 'TEXT_01',0
xbb58d:
	dc.b 'DATAS_01',0
xbb596:
	dc.b 'BUBBLE_01',0
xbb5a0:
	dc.b 'CONTEXT_01',0
xbb5ab:
	dc.b 'AME',0
	.even
