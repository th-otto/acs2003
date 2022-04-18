	.text
	
		.globl Apd_close
Apd_close:
		movem.l    a2/a4-a5,-(a7)
		subq.w     #2,a7
		suba.l     a2,a2
Apd_close_6:
		lea.l      ACSblk,a5
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
		movea.l    a0,a4
		jsr        Awi_root
		cmpa.l     a0,a4
		bne.s      Apd_close_1
		movea.l    (a5),a0
		move.w     566(a0),d0
		bne.s      Apd_close_2
Apd_close_1:
		move.l     a4,d0
		beq.s      Apd_close_2
		moveq.l    #4,d1
		and.w      84(a4),d1
		beq.s      Apd_close_3
		moveq.l    #2,d2
		and.w      34(a4),d2
		bne.s      Apd_close_3
		move.l     a2,d0
		bne.s      Apd_close_4
		movea.l    a4,a2
		bra.s      Apd_close_5
Apd_close_4:
		cmpa.l     a2,a4
		beq.s      Apd_close_2
Apd_close_5:
		jsr        Awi_down
		bra.s      Apd_close_6
Apd_close_3:
		moveq.l    #1,d0
		and.w      84(a4),d0
		bne.s      Apd_close_7
		movea.l    (a5),a0
		movea.l    572(a0),a1
		move.l     52(a1),d1
		beq.s      Apd_close_8
Apd_close_7:
		movea.l    a4,a0
		movea.l    114(a4),a1
		jsr        (a1)
		bra.s      Apd_close_2
Apd_close_8:
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    a4,a0
		movea.l    4(a4),a2
		jsr        (a2)
Apd_close_2:
		addq.w     #2,a7
		movem.l    (a7)+,a2/a4-a5
		rts

	.globl Apd_delete
Apd_delete:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		subq.w     #2,a7
		movea.l    ACSblk,a0
		move.w     582(a0),d0
		bne.s      Apd_delete_1
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
		movea.l    a0,a2
		move.l     a2,d0
		beq.s      Apd_delete_2
		jsr        Awi_root
		cmpa.l     a0,a2
		beq.s      Apd_delete_2
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    a2,a0
		movea.l    4(a2),a3
		jsr        (a3)
		bra.s      Apd_delete_2
Apd_delete_1:
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    576(a0),a2
		cmpa.l     a2,a1
		beq.s      Apd_delete_2
		moveq.l    #11,d0
		movea.l    4(a2),a3
		movea.l    a2,a0
		suba.l     a1,a1
		jsr        (a3)
Apd_delete_2:
		addq.w     #2,a7
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl Apd_info
Apd_info:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		move.w     582(a0),d0
		bne.s      Apd_info_1
		movea.l    668(a0),a0
		jsr        (a0)
		bra.s      Apd_info_2
Apd_info_1:
		movea.l    (a2),a0
		movea.l    600(a0),a1
		movea.l    576(a0),a3
		cmpa.l     a3,a1
		beq.s      Apd_info_2
		cmpa.l     a1,a3
		beq.s      Apd_info_2
		moveq.l    #15,d0
		movea.l    4(a3),a2
		movea.l    a3,a0
		suba.l     a1,a1
		jsr        (a2)
Apd_info_2:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl Apd_list
Apd_list:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		subq.w     #2,a7
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
		movea.l    a0,a2
		jsr        Awi_list
		movea.l    a0,a3
		cmpa.l     a0,a2
		bne.s      Apd_list_1
		jsr        Awi_list
		movea.l    a0,a3
Apd_list_1:
		move.l     a2,d0
		beq.s      Apd_list_2
		bra.s      Apd_list_3
Apd_list_4:
		jsr        Awi_list
		movea.l    a0,a3
Apd_list_3:
		cmpa.l     a2,a3
		beq.s      Apd_list_2
		move.w     32(a3),d0
		ble.s      Apd_list_4
Apd_list_2:
		move.l     a3,d0
		beq.s      Apd_list_5
		move.w     32(a3),d1
		ble.s      Apd_list_5
		movea.l    a3,a0
		jsr        Awi_show
Apd_list_5:
		addq.w     #2,a7
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl Apd_module
Apd_module:
		move.l     module_window,d0
		beq.s      Apd_module_1
		movea.l    d0,a0
		jsr        Awi_show
Apd_module_1:
		rts

	.globl Apd_new
Apd_new:
		suba.l     a0,a0
		jsr        new_call
		rts

	.globl Apd_open
Apd_open:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    ACSblk,a0
		move.w     582(a0),d0
		bgt.s      Apd_open_1
		suba.l     a0,a0
		jsr        new_call
		bra.s      Apd_open_2
Apd_open_1:
		movea.l    ACSblk,a0
		movea.l    576(a0),a2
		cmpa.l     600(a0),a2
		beq.s      Apd_open_2
		suba.l     a1,a1
		moveq.l    #10,d0
		movea.l    4(a2),a3
		movea.l    a2,a0
		jsr        (a3)
Apd_open_2:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl Apd_quit
Apd_quit:
		movea.l    ACSblk,a0
		movea.l    672(a0),a0
		jsr        (a0)
		rts

open_one_file:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      -256(a7),a7
		movea.l    a0,a2
		movea.l    a1,a3
		lea.l      xd033e,a1
		lea.l      (a7),a0
		move.w     #0x00FF,d0
open_one_file_1:
		move.b     (a1)+,(a0)+
		dbf        d0,open_one_file_1
		move.l     a2,d0
		beq.s      open_one_file_2
		move.l     276(a2),d1
		beq.s      open_one_file_2
		movea.l    a3,a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      open_one_file_3
		movea.l    a3,a1
		lea.l      (a7),a0
		jsr        Af_unquote
open_one_file_3:
		move.l     a3,d0
		beq.s      open_one_file_4
		lea.l      (a7),a0
		bra.s      open_one_file_5
open_one_file_4:
		suba.l     a0,a0
open_one_file_5:
		movea.l    276(a2),a1
		jsr        (a1)
open_one_file_2:
		lea.l      256(a7),a7
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

open_files:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a2
		movea.l    a1,a4
		move.l     a2,d0
		beq.s      open_files_1
		move.l     276(a2),d1
		beq.s      open_files_1
		suba.l     a3,a3
		movea.l    a1,a0
		jsr        Af_parseCmdLine
		movea.l    a0,a3
		move.l     a3,d0
		beq.s      open_files_2
		movea.l    56(a3),a1
		jsr        (a1)
		tst.l      d0
		ble.s      open_files_3
		pea.l      open_one_file(pc)
		clr.l      -(a7)
		movea.l    a2,a1
		movea.l    a3,a0
		movea.l    64(a3),a4
		jsr        (a4)
		addq.w     #8,a7
		bra.s      open_files_4
open_files_3:
		suba.l     a1,a1
		movea.l    a2,a0
		bsr        open_one_file
open_files_4:
		movea.l    a3,a0
		jsr        Alu_delete
		bra.s      open_files_1
open_files_2:
		suba.l     a1,a1
		movea.l    a2,a0
		bsr        open_one_file
open_files_1:
		movem.l    (a7)+,a2-a4
		rts

OpenDraggedFiles:
		movem.l    d3/a2-a5,-(a7)
		movea.l    a0,a5
		movea.l    ACSblk,a1
		movea.l    576(a1),a2
		cmpi.w     #0x0001,582(a1)
		blt        OpenDraggedFiles_1
		jsr        Adr_start
		bra.w      OpenDraggedFiles_2
OpenDraggedFiles_10:
		move.w     d3,d0
		and.w      #0x1000,d0
		beq.s      OpenDraggedFiles_3
		move.l     24(a2),d1
		beq.s      OpenDraggedFiles_4
		move.w     d3,d0
		and.w      #0x0FFF,d0
		ext.l      d0
		move.l     d0,d2
		add.l      d2,d2
		add.l      d0,d2
		lsl.l      #3,d2
		movea.l    d1,a3
		adda.l     d2,a3
		bra.s      OpenDraggedFiles_5
OpenDraggedFiles_4:
		suba.l     a3,a3
OpenDraggedFiles_5:
		bra.s      OpenDraggedFiles_6
OpenDraggedFiles_3:
		move.l     20(a2),d0
		beq.s      OpenDraggedFiles_7
		move.w     d3,d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    d0,a3
		adda.l     d1,a3
		bra.s      OpenDraggedFiles_6
OpenDraggedFiles_7:
		suba.l     a3,a3
OpenDraggedFiles_6:
		move.l     a3,d0
		beq.s      OpenDraggedFiles_8
		moveq.l    #32,d1
		and.w      8(a3),d1
		bne.s      OpenDraggedFiles_8
		move.w     32(a3),d2
		and.w      #0x8000,d2
		beq.s      OpenDraggedFiles_8
		lea.l      24(a3),a4
		bra.s      OpenDraggedFiles_9
OpenDraggedFiles_8:
		suba.l     a4,a4
OpenDraggedFiles_9:
		move.l     a4,d0
		beq.s      OpenDraggedFiles_2
		cmpi.w     #0x0014,22(a4)
		bne.s      OpenDraggedFiles_2
		movea.l    12(a4),a1
		movea.l    a5,a0
		bsr        open_files
OpenDraggedFiles_2:
		jsr        Adr_next
		move.w     d0,d3
		addq.w     #1,d0
		bne        OpenDraggedFiles_10
OpenDraggedFiles_1:
		movem.l    (a7)+,d3/a2-a5
		rts

CheckDraggedFiles:
		movem.l    d3/a2-a5,-(a7)
		movea.l    a0,a3
		movea.l    ACSblk,a1
		movea.l    576(a1),a2
		cmpi.w     #0x0001,582(a1)
		bge.s      CheckDraggedFiles_1
		clr.w      (a0)
		clr.w      d0
		bra        CheckDraggedFiles_2
CheckDraggedFiles_1:
		jsr        Adr_start
		bra.w      CheckDraggedFiles_3
CheckDraggedFiles_12:
		move.w     d3,d0
		and.w      #0x1000,d0
		beq.s      CheckDraggedFiles_4
		move.l     24(a2),d1
		beq.s      CheckDraggedFiles_5
		move.w     d3,d0
		and.w      #0x0FFF,d0
		ext.l      d0
		move.l     d0,d2
		add.l      d2,d2
		add.l      d0,d2
		lsl.l      #3,d2
		movea.l    d1,a4
		adda.l     d2,a4
		bra.s      CheckDraggedFiles_6
CheckDraggedFiles_5:
		suba.l     a4,a4
CheckDraggedFiles_6:
		bra.s      CheckDraggedFiles_7
CheckDraggedFiles_4:
		move.l     20(a2),d0
		beq.s      CheckDraggedFiles_8
		move.w     d3,d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    d0,a4
		adda.l     d1,a4
		bra.s      CheckDraggedFiles_7
CheckDraggedFiles_8:
		suba.l     a4,a4
CheckDraggedFiles_7:
		move.l     a4,d0
		beq.s      CheckDraggedFiles_9
		moveq.l    #32,d1
		and.w      8(a4),d1
		bne.s      CheckDraggedFiles_9
		move.w     32(a4),d2
		and.w      #0x8000,d2
		beq.s      CheckDraggedFiles_9
		lea.l      24(a4),a5
		bra.s      CheckDraggedFiles_10
CheckDraggedFiles_9:
		suba.l     a5,a5
CheckDraggedFiles_10:
		move.l     a5,d0
		beq.s      CheckDraggedFiles_3
		cmpi.w     #0x0014,22(a5)
		bne.s      CheckDraggedFiles_3
		move.w     #0x0001,(a3)
		bra.s      CheckDraggedFiles_11
CheckDraggedFiles_3:
		jsr        Adr_next
		move.w     d0,d3
		addq.w     #1,d0
		bne.w      CheckDraggedFiles_12
		clr.w      (a3)
CheckDraggedFiles_11:
		moveq.l    #1,d0
CheckDraggedFiles_2:
		movem.l    (a7)+,d3/a2-a5
		rts

new_call:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		move.l     module_window,d0
		beq.s      new_call_1
		movea.l    d0,a1
		movea.l    (a1),a2
		movea.l    a2,a0
		movea.l    a3,a1
		bsr        open_files
new_call_1:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

build_work:
		movem.l    d3/a2-a6,-(a7)
		subq.w     #6,a7
		clr.w      4(a7)
		move.l     #0x00003018,d0
		jsr        Ax_malloc
		movea.l    a0,a3
		movea.l    a3,a4
		move.l     a4,d0
		beq        build_work_1
		lea.l      PUR_ICONS,a2
		moveq.l    #24,d0
		movea.l    a2,a1
		movea.l    a4,a0
		jsr        memcpy
		lea.l      24(a2),a5
		lea.l      24(a4),a4
		clr.w      d3
		bra        build_work_2
build_work_8:
		moveq.l    #24,d0
		movea.l    a5,a1
		movea.l    a4,a0
		jsr        memcpy
		moveq.l    #24,d0
		lea.l      24(a5),a1
		lea.l      24(a4),a0
		jsr        memcpy
		move.b     7(a4),d0
		ext.w      d0
		sub.w      #0x0018,d0
		beq.s      build_work_3
		subq.w     #7,d0
		beq.s      build_work_4
		subq.w     #2,d0
		beq.s      build_work_4
		bra.s      build_work_5
build_work_3:
		movea.l    12(a4),a0
		jsr        Aus_create
		movea.l    a0,a2
		move.l     a0,(a7)
		move.l     a0,12(a4)
		move.l     a2,d0
		beq.s      build_work_5
		move.l     8(a2),d1
		beq.s      build_work_5
		lea.l      4(a7),a1
		movea.l    d1,a6
		movea.l    a4,a0
		moveq.l    #1,d0
		jsr        (a6)
		cmpi.w     #0xFFFF,4(a7)
		beq.s      build_work_1
		bra.s      build_work_5
build_work_4:
		movea.l    12(a4),a0
		jsr        Aic_create
		move.l     a0,(a7)
		move.l     a0,12(a4)
build_work_5:
		move.l     (a7),d0
		bne.s      build_work_6
build_work_1:
		suba.l     a0,a0
		bra.w      build_work_7
build_work_6:
		ori.w      #0x0080,8(a4)
		andi.w     #0xFFDF,8(a4)
		andi.w     #0xFFDF,32(a4)
		moveq.l    #-1,d0
		move.w     d0,4(a4)
		move.w     d0,2(a4)
		move.w     d3,d1
		add.w      d1,d1
		addq.w     #3,d1
		move.w     d1,(a4)
		lea.l      48(a4),a4
		addq.w     #1,d3
build_work_2:
		cmp.w      #0x0100,d3
		blt        build_work_8
		lea.l      -48(a4),a4
		ori.w      #0x0020,32(a4)
		clr.w      (a4)
		move.w     #0xFFFF,(a3)
		move.w     #0x0001,2(a3)
		move.w     #0x01FF,4(a3)
		move.w     22(a4),22(a3)
		cmpi.w     #0x000C,20(a5)
		bge.s      build_work_9
		moveq.l    #12,d0
		bra.s      build_work_10
build_work_9:
		move.w     20(a5),d0
build_work_10:
		move.w     d0,20(a3)
		moveq.l    #1,d1
		move.w     d1,42(a3)
		move.w     d1,40(a3)
		movea.l    a3,a0
		jsr        Aob_fix
		movea.l    a3,a0
build_work_7:
		addq.w     #6,a7
		movem.l    (a7)+,d3/a2-a6
		rts

click_modwin:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		move.w     608(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    604(a0),a0
		lea.l      24(a0,d0.l),a0
		movea.l    12(a0),a3
		move.l     a3,d2
		beq        click_modwin_1
		move.w     32(a3),d2
		ble.w      click_modwin_2
		movea.l    (a2),a1
		movea.l    604(a1),a0
		move.w     10(a0,d0.l),d1
		and.w      #0x4000,d1
		beq.s      click_modwin_2
		move.w     8(a1),d2
		move.w     12(a1),d0
		asr.w      #1,d0
		add.w      8(a1),d0
		move.w     40(a3),d1
		asr.w      #1,d1
		sub.w      d1,d0
		cmp.w      d0,d2
		ble.s      click_modwin_3
		bra.s      click_modwin_4
click_modwin_3:
		movea.l    (a2),a0
		move.w     12(a0),d2
		asr.w      #1,d2
		add.w      8(a0),d2
		move.w     40(a3),d0
		asr.w      #1,d0
		sub.w      d0,d2
click_modwin_4:
		move.w     d2,36(a3)
		movea.l    (a2),a0
		move.w     10(a0),d0
		move.w     14(a0),d1
		asr.w      #1,d1
		add.w      10(a0),d1
		move.w     42(a3),d2
		asr.w      #1,d2
		sub.w      d2,d1
		cmp.w      d1,d0
		ble.s      click_modwin_5
		bra.s      click_modwin_6
click_modwin_5:
		movea.l    (a2),a0
		move.w     14(a0),d0
		asr.w      #1,d0
		add.w      10(a0),d0
		move.w     42(a3),d1
		asr.w      #1,d1
		sub.w      d1,d0
click_modwin_6:
		move.w     d0,38(a3)
click_modwin_2:
		move.w     32(a3),d0
		ble.s      click_modwin_7
		ori.w      #0x0010,86(a3)
		lea.l      36(a3),a1
		movea.l    a3,a0
		movea.l    134(a3),a2
		jsr        (a2)
		movea.l    a3,a0
		movea.l    110(a3),a1
		jsr        (a1)
		bra.s      click_modwin_1
click_modwin_7:
		movea.l    a3,a0
		jsr        Awi_show
click_modwin_1:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

drag_modwin:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    ACSblk,a0
		move.w     608(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    604(a0),a0
		lea.l      24(a0,d0.l),a0
		movea.l    12(a0),a2
		move.l     a2,d2
		beq.s      drag_modwin_1
		suba.l     a1,a1
		movea.l    4(a2),a3
		movea.l    a2,a0
		moveq.l    #16,d0
		jsr        (a3)
drag_modwin_1:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

mod_deldrag:
		move.l     a2,-(a7)
		suba.l     a1,a1
		moveq.l    #11,d0
		movea.l    ACSblk,a0
		movea.l    576(a0),a0
		movea.l    ACSblk,a2
		movea.l    576(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
		movea.l    (a7)+,a2
		rts

mod_delete:
		move.l     a2,-(a7)
		suba.l     a1,a1
		moveq.l    #11,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a2
		movea.l    600(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
		movea.l    (a7)+,a2
		rts

mod_info:
		move.l     a2,-(a7)
		suba.l     a1,a1
		moveq.l    #15,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a2
		movea.l    600(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
		movea.l    (a7)+,a2
		rts

mod_infodrag:
		move.l     a2,-(a7)
		suba.l     a1,a1
		moveq.l    #15,d0
		movea.l    ACSblk,a0
		movea.l    576(a0),a0
		movea.l    ACSblk,a2
		movea.l    576(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
		movea.l    (a7)+,a2
		rts

load_mod:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		movea.l    a1,a0
		jsr        Ash_module
		movea.l    a2,a1
		lea.l      4(a3),a0
		jsr        strcpy
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

mod_load:
		movem.l    a2-a4,-(a7)
		lea.l      -256(a7),a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    (a1),a2
		lea.l      4(a2),a1
		lea.l      (a7),a0
		jsr        strcpy
		clr.l      -(a7)
		pea.l      xd045e
		moveq.l    #1,d1
		clr.w      d0
		lea.l      8(a7),a1
		lea.l      MODUL_LOAD_TITEL,a0
		jsr        Af_fileselect
		addq.w     #8,a7
		movea.l    a0,a3
		move.l     a3,d0
		beq.s      mod_load_1
		pea.l      load_mod(pc)
		clr.l      -(a7)
		movea.l    a2,a1
		movea.l    64(a3),a4
		jsr        (a4)
		addq.w     #8,a7
		movea.l    a3,a0
		jsr        Alu_delete
mod_load_1:
		lea.l      256(a7),a7
		movem.l    (a7)+,a2-a4
		rts

	.globl modul_close
modul_close:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		ori.w      #0x0100,86(a2)
		movea.l    (a0),a3
		moveq.l    #8,d0
		lea.l      36(a2),a1
		lea.l      262(a3),a0
		jsr        memcpy
		movea.l    a2,a0
		jsr        Awi_closed
		andi.w     #0xFEFF,86(a2)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

modul_make:
		movem.l    d3-d4/a2-a6,-(a7)
		subq.w     #2,a7
		moveq.l    #0,d3
		move.l     #0x00000118,d0
		jsr        Ax_malloc
		movea.l    a0,a2
		lea.l      ACSblk,a6
		move.l     a2,d0
		beq        modul_make_1
		move.l     #0x00000118,d1
		movea.l    a2,a0
		clr.w      d0
		jsr        memset
		lea.l      xd045e,a3
		lea.l      8(a3),a0
		jsr        Af_cfgfile
		clr.w      d0
		jsr        Fopen
		move.l     d0,d4
		tst.l      d0
		bpl.s      modul_make_2
		lea.l      14(a3),a0
		jsr        Af_cfgfile
		clr.w      d0
		jsr        Fopen
		move.l     d0,d4
modul_make_2:
		tst.l      d4
		ble.s      modul_make_3
		movea.l    a2,a0
		move.l     #0x00000114,d1
		move.w     d4,d0
		jsr        Fread
		move.l     d0,d3
		move.w     d4,d0
		jsr        Fclose
modul_make_3:
		lea.l      PUR_MODULE,a4
		movea.l    -88(a4),a0
		cmpa.l     #NAME_PUR_DESK,a0
		beq.s      modul_make_4
		move.l     a0,74(a4)
modul_make_4:
		movea.l    a4,a0
		jsr        Awi_create
		movea.l    a0,a5
		move.l     a5,-3854(a4)
		move.l     a5,d0
		beq        modul_make_5
		moveq.l    #4,d1
		add.l      d3,d1
		cmp.l      #0x00000118,d1
		bne.s      modul_make_6
		cmpi.l     #0x5044534B,(a2)
		beq        modul_make_7
modul_make_6:
		move.l     #0x00000118,d1
		clr.w      d0
		movea.l    a2,a0
		jsr        memset
		movea.l    (a6),a0
		movea.l    572(a0),a1
		move.w     14(a1),274(a2)
		movea.l    (a6),a0
		move.b     726(a0),d0
		beq.s      modul_make_8
		movea.l    a0,a1
		lea.l      726(a1),a1
		lea.l      4(a2),a0
		jsr        strcpy
		bra.s      modul_make_9
modul_make_8:
		lea.l      20(a3),a1
		lea.l      4(a2),a0
		jsr        strcpy
modul_make_9:
		cmpi.b     #0x43,4(a2)
		bge.s      modul_make_10
		jsr        Dgetdrv
		jsr        Dsetdrv
		and.l      #0x00000004,d0
		beq.s      modul_make_10
		lea.l      24(a3),a1
		lea.l      4(a2),a0
		jsr        strcpy
modul_make_10:
		movea.l    (a6),a0
		move.w     8(a0),d0
		add.w      18(a0),d0
		move.w     d0,262(a2)
		movea.l    (a6),a0
		move.w     8(a0),d1
		add.w      18(a0),d1
		move.w     d1,262(a2)
		movea.l    (a6),a0
		move.w     12(a0),d0
		asr.w      #1,d0
		move.w     d0,266(a2)
		movea.l    (a6),a0
		move.w     14(a0),d1
		asr.w      #1,d1
		move.w     d1,268(a2)
modul_make_7:
		move.l     #0x5044534B,(a2)
		clr.w      260(a2)
		move.l     #NAME_MODULE,74(a4)
		move.l     a2,(a5)
		bsr        build_work
		move.l     a0,20(a5)
		move.l     a0,d0
		bne.s      modul_make_11
		movea.l    a5,a0
		jsr        Awi_delete
modul_make_5:
		movea.l    a2,a0
		jsr        Ax_free
modul_make_1:
		suba.l     a0,a0
		bra        modul_make_12
modul_make_11:
		moveq.l    #8,d0
		lea.l      262(a2),a1
		lea.l      36(a5),a0
		jsr        memcpy
		move.w     36(a5),d0
		movea.l    (a6),a0
		move.w     8(a0),d1
		add.w      12(a0),d1
		cmp.w      d1,d0
		ble.s      modul_make_13
		move.w     8(a0),d2
		add.w      18(a0),d2
		move.w     d2,36(a5)
modul_make_13:
		move.w     38(a5),d0
		movea.l    (a6),a0
		move.w     10(a0),d1
		add.w      14(a0),d1
		cmp.w      d1,d0
		ble.s      modul_make_14
		move.w     10(a0),d2
		add.w      20(a0),d2
		move.w     d2,36(a5)
modul_make_14:
		move.l     _globl,-(a7)
		movea.l    20(a5),a0
		pea.l      22(a0)
		pea.l      20(a0)
		move.w     42(a5),-(a7)
		move.w     40(a5),-(a7)
		move.w     38(a5),-(a7)
		lea.l      18(a7),a1
		lea.l      18(a7),a0
		move.w     36(a5),d2
		move.w     34(a5),d1
		moveq.l    #1,d0
		jsr        mt_wind_calc
		lea.l      18(a7),a7
		move.l     24(a5),d0
		beq.s      modul_make_15
		movea.l    d0,a0
		move.w     22(a0),d1
		movea.l    20(a5),a1
		sub.w      d1,22(a1)
modul_make_15:
		movea.l    a5,a0
modul_make_12:
		addq.w     #2,a7
		movem.l    (a7)+,d3-d4/a2-a6
		rts

modul_serv_9:
modul_serv_11:
modul_serv:
		movem.l    d3-d5/a2-a5,-(a7)
		lea.l      -14(a7),a7
		movea.l    a0,a2
		move.w     d0,d3
		move.l     a1,10(a7)
		move.l     (a0),6(a7)
		lea.l      ACSblk,a3
		move.w     d3,d0
		cmp.w      #0x0030,d0
		beq        modul_serv_1
		bgt.s      modul_serv_2
		cmp.w      #0x001B,d0
		bhi        modul_serv_3
		add.w      d0,d0
		move.w     J28(pc,d0.w),d0
		jmp        J28(pc,d0.w)
J28:
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_4-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_5-J28
		dc.w modul_serv_5-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_5-J28
		dc.w modul_serv_6-J28
		dc.w modul_serv_7-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_3-J28
		dc.w modul_serv_8-J28
modul_serv_2:
		sub.w      #0x0064,d0
		cmp.w      #0x0009,d0
		bhi        modul_serv_3
		add.w      d0,d0
		move.w     J29(pc,d0.w),d0
		jmp        J29(pc,d0.w)
J29:
		dc.w modul_serv_12-J29
		dc.w modul_serv_13-J29
		dc.w modul_serv_14-J29
		dc.w modul_serv_15-J29
		dc.w modul_serv_16-J29
		dc.w modul_serv_17-J29
		dc.w modul_serv_3-J29
		dc.w modul_serv_3-J29
		dc.w modul_serv_3-J29
		dc.w modul_serv_18-J29
modul_serv_4:
		movea.l    (a3),a0
modul_serv_10:
		move.w     570(a0),d0
		beq        modul_serv_19
		move.w     32(a2),d1
		ble.s      modul_serv_20
		move.w     86(a2),d2
		and.w      #0x0800,d2
		beq.s      modul_serv_21
		lea.l      44(a2),a1
		movea.l    6(a7),a0
		lea.l      262(a0),a0
		moveq.l    #8,d0
		jsr        memcpy
		bra.s      modul_serv_22
modul_serv_21:
		moveq.l    #8,d0
		lea.l      36(a2),a1
		movea.l    6(a7),a0
		lea.l      262(a0),a0
		jsr        memcpy
modul_serv_22:
		movea.l    6(a7),a0
		ori.l      #0x00000001,270(a0)
		bra.s      modul_serv_23
modul_serv_20:
		movea.l    6(a7),a0
		andi.l     #0xFFFFFFFE,270(a0)
modul_serv_23:
		lea.l      xd0466,a0
		jsr        Af_cfgfile
		clr.w      d0
		jsr        Fcreate
		move.l     d0,d4
		tst.l      d0
		ble.s      modul_serv_24
		movea.l    6(a7),a0
		move.l     #0x00000114,d1
		move.w     d4,d0
		jsr        Fwrite
		move.w     d4,d0
		jsr        Fclose
modul_serv_24:
		movea.l    20(a2),a0
		jsr        Ax_free
		clr.l      20(a2)
		movea.l    6(a7),a0
		jsr        Ax_free
		movea.l    a2,a0
		jsr        Awi_delete
		bra        modul_serv_25
modul_serv_19:
		movea.l    a2,a0
		bsr        modul_close
		bra        modul_serv_25
modul_serv_7:
		movea.l    6(a7),a0
		move.l     276(a0),d0
		beq        modul_serv_25
		movea.l    10(a7),a0
		bsr        CheckDraggedFiles
		bra        modul_serv_25
modul_serv_6:
		movea.l    6(a7),a0
		move.l     276(a0),d0
		beq        modul_serv_25
		bsr        OpenDraggedFiles
		bra        modul_serv_25
modul_serv_17:
		move.l     10(a7),d0
		beq        modul_serv_25
		move.l     20(a2),d1
		beq        modul_serv_25
		movea.l    d0,a0
		movea.l    d1,a1
		move.w     6(a0),6(a1)
		movea.l    20(a2),a1
		move.l     12(a0),12(a1)
		bra        modul_serv_25
modul_serv_5:
		move.w     86(a2),d0
		and.w      #0x0800,d0
		beq.s      modul_serv_26
		clr.w      d0
		bra        modul_serv_27
modul_serv_26:
		movea.l    (a3),a0
		move.w     582(a0),d0
		beq.s      modul_serv_28
		cmpa.l     576(a0),a2
		beq.s      modul_serv_29
modul_serv_28:
		movea.l    (a3),a0
		movea.l    668(a0),a0
		jsr        (a0)
		bra        modul_serv_25
modul_serv_29:
		movea.l    (a3),a0
		move.w     582(a0),d4
		move.w     d4,d0
		ext.l      d0
		add.l      d0,d0
		jsr        Ax_malloc
		movea.l    a0,a3
		movea.l    a3,a4
		move.l     a4,d0
		beq        modul_serv_25
		jsr        Adr_start
		bra.s      modul_serv_30
modul_serv_31:
		move.w     d5,(a3)+
modul_serv_30:
		jsr        Adr_next
		move.w     d0,d5
		bpl.s      modul_serv_31
		lea.l      sort_obnr,a1
		moveq.l    #2,d1
		move.w     d4,d0
		ext.l      d0
		movea.l    a4,a0
		jsr        qsort
		clr.w      d5
		bra.s      modul_serv_32
modul_serv_35:
		move.w     d5,d1
		ext.l      d1
		add.l      d1,d1
		move.w     0(a4,d1.l),d2
		ext.l      d2
		move.l     d2,d0
		add.l      d0,d0
		add.l      d2,d0
		lsl.l      #3,d0
		movea.l    20(a2),a3
		lea.l      24(a3,d0.l),a3
		cmpi.w     #0x0001,22(a3)
		bne.s      modul_serv_33
		move.w     0(a4,d1.l),d0
		movea.l    a2,a0
		jsr        Adr_del
		movea.l    12(a3),a3
		cmp.w      #0x000B,d3
		bne.s      modul_serv_34
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    a3,a0
		movea.l    4(a3),a5
		jsr        (a5)
		bra.s      modul_serv_33
modul_serv_34:
		suba.l     a1,a1
		move.w     d3,d0
		movea.l    a3,a0
		movea.l    4(a3),a5
		jsr        (a5)
modul_serv_33:
		addq.w     #1,d5
modul_serv_32:
		cmp.w      d5,d4
		bgt.s      modul_serv_35
		movea.l    a4,a0
		jsr        Ax_free
		bra        modul_serv_25
modul_serv_16:
		movea.l    10(a7),a0
		movea.l    6(a7),a1
		move.l     (a0),276(a1)
		move.w     my_menu,d0
		beq        modul_serv_25
		move.l     276(a1),d1
		bne.s      modul_serv_36
		jsr        Awi_root
		movea.l    94(a0),a0
		ori.w      #0x0008,418(a0)
		bra        modul_serv_25
modul_serv_36:
		jsr        Awi_root
		movea.l    94(a0),a0
		andi.w     #0xFFF7,418(a0)
		bra        modul_serv_25
modul_serv_14:
		movea.l    10(a7),a0
		move.w     (a0),d0
		movea.l    a2,a0
		jsr        ghost_icon
		bra        modul_serv_25
modul_serv_15:
		movea.l    10(a7),a0
		move.w     (a0),d0
		movea.l    a2,a0
		jsr        norm_icon
		bra        modul_serv_25
modul_serv_13:
		movea.l    10(a7),a1
		movea.l    a2,a0
		jsr        rem_icon
		bra        modul_serv_25
modul_serv_18:
		moveq.l    #1,d1
		movea.l    10(a7),a0
		move.w     (a0),d0
		movea.l    a2,a0
		jsr        update_icon
		bra        modul_serv_25
modul_serv_12:
		movea.l    10(a7),a1
		movea.l    a2,a0
		jsr        place_icon
		bra        modul_serv_25
modul_serv_1:
		movea.l    6(a7),a0
		move.l     276(a0),d0
		beq        modul_serv_25
		move.l     10(a7),d1
		beq        modul_serv_25
		pea.l      open_one_file(pc)
		clr.l      -(a7)
		movea.l    a0,a1
		movea.l    d1,a3
		movea.l    64(a3),a3
		movea.l    d1,a0
		jsr        (a3)
		addq.w     #8,a7
		bra        modul_serv_25
modul_serv_8:
		movea.l    10(a7),a0
		cmpi.w     #0x4711,(a0)
		bne.s      modul_serv_3
		movea.l    6(a0),a3
		move.l     a3,d0
		beq.s      modul_serv_3
		move.b     (a3),d0
		beq.s      modul_serv_3
		movea.l    a3,a0
		jsr        Ast_create
		movea.l    a0,a4
		move.l     a4,d0
		beq.s      modul_serv_3
		lea.l      xd047a,a1
		move.l     a1,-(a7)
		lea.l      4(a7),a0
		movea.l    a4,a1
		jsr        Af_2ext
		movea.l    (a7)+,a1
		jsr        Ast_icmp
		tst.w      d0
		beq.s      modul_serv_37
		lea.l      xd047d,a1
		lea.l      (a7),a0
		jsr        Ast_icmp
		tst.w      d0
		bne.s      modul_serv_38
modul_serv_37:
		movea.l    a4,a0
		jsr        Ash_module
		bra.s      modul_serv_39
modul_serv_38:
		movea.l    a4,a0
		bsr        new_call
modul_serv_39:
		movea.l    a4,a0
		jsr        Ast_delete
		bra.s      modul_serv_25
modul_serv_3:
		movea.l    10(a7),a1
		move.w     d3,d0
		movea.l    a2,a0
		jsr        Awi_service
		bra.s      modul_serv_27
modul_serv_25:
		moveq.l    #1,d0
modul_serv_27:
		lea.l      14(a7),a7
		movem.l    (a7)+,d3-d5/a2-a5
		rts

pd_make:
		movem.l    d3-d4/a2-a5,-(a7)
		lea.l      -270(a7),a7
		suba.l     a2,a2
		lea.l      PUR_DESK,a4
		movea.l    94(a4),a0
		cmpa.l     #_PMENU,a0
		bne.s      pd_make_1
		movea.l    a0,a3
		move.w     4(a3),d4
		ext.l      d4
		move.l     d4,d3
		add.l      d3,d3
		add.l      d4,d3
		lsl.l      #3,d3
		move.w     2(a3,d3.l),d3
		ext.l      d3
		move.l     d3,d2
		add.l      d2,d2
		add.l      d3,d2
		lsl.l      #3,d2
		move.w     2(a3,d2.l),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		move.w     0(a3,d1.l),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		adda.l     d0,a3
		move.w     #0x0018,6(a3)
		ori.w      #0x2000,10(a3)
		move.l     #Sep,12(a3)
		bra.s      pd_make_2
pd_make_1:
		clr.w      -3688(a4)
pd_make_2:
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		beq.s      pd_make_3
		move.w     568(a0),d1
		bne.s      pd_make_4
		move.l     20(a4),d2
		bne.s      pd_make_4
		move.l     #PUR_BACK,20(a4)
pd_make_4:
		movea.l    a4,a0
		jsr        Awi_create
		movea.l    a0,a3
		move.l     a3,d0
		beq.s      pd_make_5
		movea.l    170(a4),a1
		suba.l     a0,a0
		jsr        (a1)
		move.l     a0,(a3)
		beq.s      pd_make_6
		movea.l    (a0),a2
		bra.s      pd_make_6
pd_make_3:
		move.l     94(a4),256(a4)
		suba.l     a0,a0
		movea.l    170(a4),a1
		jsr        (a1)
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      pd_make_7
pd_make_5:
		suba.l     a0,a0
		bra        pd_make_8
pd_make_7:
		movea.l    (a3),a2
pd_make_6:
		move.l     a2,d0
		beq        pd_make_9
		lea.l      14(a7),a4
		lea.l      4(a2),a1
		movea.l    a4,a0
		jsr        strcpy
		cmpi.b     #0x43,(a4)
		bge.s      pd_make_10
		jsr        Dgetdrv
		jsr        Dsetdrv
		and.l      #0x00000004,d0
		beq.s      pd_make_10
		move.b     #0x43,(a4)
pd_make_10:
		moveq.l    #92,d0
		movea.l    a4,a0
		jsr        strrchr
		move.l     a0,4(a7)
		beq.s      pd_make_11
		move.b     1(a0),d0
		beq.s      pd_make_11
		clr.b      1(a0)
pd_make_11:
		movea.l    a4,a0
		jsr        Af_readdir
		movea.l    a0,a5
		move.l     a5,(a7)
		move.l     a5,d0
		beq.s      pd_make_12
		bra.s      pd_make_13
pd_make_15:
		lea.l      xd047d,a1
		move.l     a1,-(a7)
		movea.l    (a5),a1
		lea.l      12(a7),a0
		jsr        Af_2ext
		movea.l    (a7)+,a1
		jsr        Ast_icmp
		tst.w      d0
		bne.s      pd_make_14
		movea.l    (a5),a0
		jsr        Ash_module
pd_make_14:
		movea.l    4(a5),a5
pd_make_13:
		move.l     a5,d0
		bne.s      pd_make_15
		movea.l    (a7),a0
		jsr        Af_freedir
pd_make_12:
		moveq.l    #1,d0
		and.l      270(a2),d0
		beq.s      pd_make_9
		movea.l    ACSblk,a0
		move.w     566(a0),d1
		beq.s      pd_make_9
		movea.l    (a3),a0
		jsr        Awi_open
pd_make_9:
		movea.l    a3,a0
pd_make_8:
		lea.l      270(a7),a7
		movem.l    (a7)+,d3-d4/a2-a5
		rts

pd_serv:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		movea.l    a1,a4
		movea.l    (a0),a3
		subq.w     #2,d0
		beq.s      pd_serv_1
		bra.s      pd_serv_2
pd_serv_1:
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		beq.s      pd_serv_3
		move.w     570(a0),d1
		beq.s      pd_serv_4
		movea.l    a2,a0
		jsr        Awi_delete
		bra.s      pd_serv_4
pd_serv_3:
		movea.l    a2,a0
		jsr        Awi_closed
		bra.s      pd_serv_4
pd_serv_2:
		movea.l    a4,a1
		move.w     d3,d0
		movea.l    a3,a0
		movea.l    4(a3),a2
		jsr        (a2)
		bra.s      pd_serv_5
pd_serv_4:
		moveq.l    #1,d0
pd_serv_5:
		movem.l    (a7)+,d3/a2-a4
		rts

ghost_icon:
		move.w     d3,-(a7)
		move.l     a2,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		movea.l    (a0),a0
		tst.w      d0
		bmi.s      ghost_icon_1
		move.w     260(a0),d1
		beq.s      ghost_icon_1
		ext.l      d0
		move.l     d0,d2
		add.l      d2,d2
		add.l      d0,d2
		lsl.l      #3,d2
		movea.l    20(a2),a0
		adda.l     d2,a0
		andi.w     #0xCFFA,8(a0)
		ori.w      #0x0040,8(a0)
		andi.w     #0xFFFE,10(a0)
		movea.l    12(a0),a0
		move.l     4(a0),(a0)
		clr.l      34(a0)
		moveq.l    #1,d1
		movea.l    a2,a0
		move.w     d3,d0
		jsr        update_icon
ghost_icon_1:
		movea.l    (a7)+,a2
		move.w     (a7)+,d3
		rts

norm_icon:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		movea.l    (a0),a0
		tst.w      d0
		bmi        norm_icon_1
		move.w     260(a0),d1
		beq        norm_icon_1
		ext.l      d0
		move.l     d0,d2
		add.l      d2,d2
		add.l      d0,d2
		lsl.l      #3,d2
		movea.l    20(a2),a3
		adda.l     d2,a3
		lea.l      24(a3),a4
		andi.w     #0xEF3F,8(a3)
		ori.w      #0x2005,8(a3)
		andi.w     #0xFFFE,10(a3)
		move.l     16(a4),d1
		beq.s      norm_icon_2
		movea.l    d1,a1
		movea.l    12(a3),a0
		moveq.l    #38,d0
		jsr        memcpy
		move.w     #0x00FF,d0
		movea.l    16(a4),a0
		and.w      12(a0),d0
		move.w     d0,10(a4)
		bra.s      norm_icon_3
norm_icon_2:
		moveq.l    #38,d0
		lea.l      I_WIN,a1
		movea.l    12(a3),a0
		jsr        memcpy
		movea.l    12(a4),a0
		movea.l    12(a3),a1
		move.l     74(a0),8(a1)
		clr.w      10(a4)
norm_icon_3:
		moveq.l    #16,d0
		movea.l    12(a4),a0
		and.w      84(a0),d0
		beq.s      norm_icon_4
		ori.w      #0x1000,8(a3)
norm_icon_4:
		moveq.l    #1,d1
		move.w     d3,d0
		movea.l    a2,a0
		jsr        update_icon
norm_icon_1:
		movem.l    (a7)+,d3/a2-a4
		rts

place_icon:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a2
		movea.l    a1,a4
		movea.l    (a0),a3
		cmpi.w     #0x0100,260(a3)
		bge.s      place_icon_1
		move.w     260(a3),d3
		add.w      d3,d3
		addq.w     #1,d3
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    20(a2),a0
		adda.l     d0,a0
		andi.w     #0xFF7F,8(a0)
		lea.l      24(a0),a0
		move.w     #0x0001,22(a0)
		move.l     #click_modwin,(a0)
		move.l     #drag_modwin,4(a0)
		move.l     a1,12(a0)
		move.l     90(a4),16(a0)
		move.w     d3,88(a4)
		addq.w     #1,260(a3)
		movea.l    a2,a0
		move.w     d3,d0
		bsr        norm_icon
		bra.s      place_icon_2
place_icon_1:
		move.w     #0xFFFF,88(a4)
place_icon_2:
		movem.l    (a7)+,d3/a2-a4
		rts

rem_icon:
		movem.l    d3-d5/a2-a5,-(a7)
		subq.w     #8,a7
		movea.l    a0,a3
		move.l     a1,4(a7)
		move.w     (a1),d3
		move.l     (a0),(a7)
		tst.w      d3
		bmi        rem_icon_1
		movea.l    (a7),a1
		move.w     260(a1),d0
		beq        rem_icon_1
		move.w     d3,d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    20(a3),a0
		move.w     0(a0,d1.l),d4
		movea.l    4(a7),a1
		move.w     (a1),d0
		jsr        Aob_up
		move.w     d0,d5
		bra        rem_icon_2
rem_icon_5:
		moveq.l    #38,d0
		move.w     d4,d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    20(a3),a0
		movea.l    12(a0,d1.l),a1
		move.w     d3,d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    12(a0,d1.l),a0
		jsr        memcpy
		move.w     d4,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    20(a3),a0
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d2
		add.l      d2,d2
		add.l      d1,d2
		lsl.l      #3,d2
		movea.l    20(a3),a1
		move.w     8(a0,d0.l),8(a1,d2.l)
		movea.l    20(a3),a0
		movea.l    20(a3),a1
		move.w     10(a0,d0.l),10(a1,d2.l)
		movea.l    20(a3),a5
		lea.l      24(a5,d2.l),a5
		movea.l    20(a3),a2
		lea.l      24(a2,d0.l),a2
		movea.l    12(a2),a4
		move.l     a4,12(a5)
		move.l     16(a2),16(a5)
		move.l     a4,d1
		beq.s      rem_icon_3
		subq.w     #2,88(a4)
rem_icon_3:
		move.w     d4,d3
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    20(a3),a0
		move.w     0(a0,d0.l),d4
rem_icon_2:
		tst.w      d5
		bmi.s      rem_icon_4
		cmp.w      d4,d5
		beq.s      rem_icon_4
		move.w     #0x0080,d0
		move.w     d4,d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    20(a3),a0
		and.w      8(a0,d1.l),d0
		beq        rem_icon_5
rem_icon_4:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    20(a3),a4
		adda.l     d0,a4
		ori.w      #0x0080,8(a4)
		lea.l      24(a4),a5
		clr.w      22(a5)
		moveq.l    #0,d2
		move.l     d2,16(a5)
		move.l     d2,12(a5)
		move.l     d2,4(a5)
		move.l     d2,(a5)
		movea.l    (a7),a0
		subq.w     #1,260(a0)
		movea.l    ACSblk,a1
		move.w     570(a1),d2
		bne.w      rem_icon_6
		move.w     260(a0),d0
		beq.s      rem_icon_7
		movea.l    4(a7),a2
		move.w     (a2),d3
		move.w     d3,d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    20(a3),a4
		move.w     0(a4,d1.l),d4
		bra.s      rem_icon_8
rem_icon_9:
		clr.w      d1
		move.w     d3,d0
		movea.l    a3,a0
		jsr        update_icon
		move.w     d4,d3
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    20(a3),a0
		move.w     0(a0,d0.l),d4
rem_icon_8:
		tst.w      d5
		bmi.s      rem_icon_7
		cmp.w      d4,d5
		beq.s      rem_icon_7
		move.w     #0x0080,d0
		move.w     d3,d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    20(a3),a0
		and.w      8(a0,d1.l),d0
		beq.s      rem_icon_9
rem_icon_7:
		ori.w      #0x0010,86(a3)
		lea.l      36(a3),a1
		movea.l    a3,a0
		movea.l    134(a3),a2
		jsr        (a2)
rem_icon_6:
		movea.l    4(a7),a0
		move.w     #0xFFFF,(a0)
rem_icon_1:
		addq.w     #8,a7
		movem.l    (a7)+,d3-d5/a2-a5
		rts

update_icon:
		movem.l    d4/a2-a4,-(a7)
		movea.l    a0,a2
		move.w     d1,d4
		movea.l    (a0),a0
		tst.w      d0
		bmi        update_icon_1
		move.w     260(a0),d2
		beq        update_icon_1
		ext.l      d0
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		movea.l    20(a2),a3
		adda.l     d1,a3
		lea.l      24(a3),a4
		move.l     16(a4),d2
		beq.s      update_icon_2
		movea.l    d2,a0
		move.w     22(a0),d1
		cmp.w      20(a3),d1
		bge.s      update_icon_2
		move.w     24(a0),d0
		cmp.w      22(a3),d0
		bge.s      update_icon_2
		movea.l    d2,a1
		movea.l    12(a3),a0
		moveq.l    #38,d0
		jsr        memcpy
		move.w     #0x00FF,d0
		movea.l    16(a4),a0
		and.w      12(a0),d0
		move.w     d0,10(a4)
		bra.s      update_icon_3
update_icon_2:
		moveq.l    #38,d0
		lea.l      I_WIN,a1
		movea.l    12(a3),a0
		jsr        memcpy
		movea.l    12(a4),a0
		movea.l    74(a0),a0
		jsr        Ast_create
		movea.l    12(a3),a1
		move.l     a0,8(a1)
		clr.w      10(a4)
update_icon_3:
		move.w     8(a3),d0
		and.w      #0x2000,d0
		bne.s      update_icon_4
		movea.l    12(a3),a0
		move.l     4(a0),(a0)
		clr.l      34(a0)
update_icon_4:
		movea.l    a3,a0
		jsr        Aob_icon
		move.w     86(a2),d0
		and.w      #0x0800,d0
		bne.s      update_icon_1
		tst.w      d4
		beq.s      update_icon_1
		ori.w      #0x0010,86(a2)
		lea.l      36(a2),a1
		movea.l    a2,a0
		movea.l    134(a2),a3
		jsr        (a3)
update_icon_1:
		movem.l    (a7)+,d4/a2-a4
		rts

sort_obnr:
		move.w     (a0),d0
		cmp.w      (a1),d0
		bge.s      sort_obnr_1
		moveq.l    #1,d0
		rts
sort_obnr_1:

		move.w     (a0),d0
		cmp.w      (a1),d0
		ble.s      x3cc0a_1
		moveq.l    #-1,d0
		rts
x3cc0a_1:

		clr.w      d0
		rts

purGEMScript:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a4
		move.w     d0,d3
		movea.l    a1,a2
		movea.l    20(a7),a3
		lea.l      xd0481,a1
		movea.l    (a2),a0
		jsr        Ast_icmp
		tst.w      d0
		bne.s      purGEMScript_1
		movea.l    (a3),a0
		movea.l    (a0),a0
		jsr        Ast_delete
		movea.l    ACSblk,a0
		lea.l      544(a0),a0
		jsr        Ast_create
		movea.l    (a3),a1
		move.l     a0,(a1)
		move.w     #0x0001,4(a3)
		clr.w      d0
		bra.s      purGEMScript_2
purGEMScript_1:
		move.l     a3,-(a7)
		movea.l    a2,a1
		move.w     d3,d0
		movea.l    a4,a0
		jsr        Awi_gemscript
		addq.w     #4,a7
purGEMScript_2:
		movem.l    (a7)+,d3/a2-a4
		rts

	.data

	.globl module_window
module_window:
		dc.w $0000
		dc.w $0000
my_menu:
		dc.w $0001

BUBBLE_01:
		dc.b 'Hier wird ein ACS-Modul nachgeladen.',0
BUBBLE_02:
		dc.b 'Informationen Åber selektierte Objekte bzw. ACS.',0
BUBBLE_03:
		dc.b 'Lîschen von selektierten Objekten.',0
HELPFILE_01:
		dc.b 'ACSPRO',0
HELPFILE_02:
		dc.b 'ACSPRO',0
MODUL_LOAD_TITEL:
		dc.b 'Module laden',0
NAME_MODULE:
		dc.b ' Module ',0
NAME_PUR_DESK:
		dc.b ' Purer Desktop ',0
STGUIDE_01:
		dc.b 'Der ACSpro-GUI-Editor',0
STGUIDE_02:
		dc.b 'Der ACSpro-GUI-Editor',0
TEXT_02:
		dc.b '  Module...       ^M',0
TEXT_04:
		dc.b '  ôffnen...       ^O',0
TEXT_05:
		dc.b '  Information...  ^I',0
TEXT_06:
		dc.b 0
TEXT_07:
		dc.b '  öber mich ...',0
TEXT_08:
		dc.b '  Neu...          ^N',0
TEXT_09:
		dc.b '--------------------',0
TEXT_11:
		dc.b ' Datei ',0
TEXT_13:
		dc.b '  Beenden...      ^Q ',0
TEXT_14:
		dc.b '  Schlieûen  ^U',0
TEXT_15:
		dc.b ' Fenster ',0
TEXT_17:
		dc.b '  Entfernen  ^D',0
TEXT_18:
		dc.b '  Wechseln   ^W',0
		dc.b $00
DATAS_03:
		dc.w $0000
		dc.w $0000
		dc.w $01c8
		dc.w $0000
		dc.w $0000
		dc.w $7fff
		dc.w $fffe
		dc.w $4000
		dc.w $0012
		dc.w $4000
		dc.w $0012
		dc.w $7fff
		dc.w $fffe
		dc.w $4000
		dc.w $0012
		dc.w $4000
		dc.w $0012
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $0012
		dc.w $4000
		dc.w $0012
		dc.w $7fff
		dc.w $fffe
		dc.w $4fff
		dc.w $ff92
		dc.w $4fff
		dc.w $ff92
		dc.w $7fff
		dc.w $fffe
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $7fff
		dc.w $fffe
		dc.w $4000
		dc.w $0012
		dc.w $4000
		dc.w $0012
		dc.w $7fff
		dc.w $fffe
		dc.w $4000
		dc.w $0012
		dc.w $4000
		dc.w $0012
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $001e
		dc.w $4000
		dc.w $0012
		dc.w $4000
		dc.w $0012
		dc.w $7fff
		dc.w $fffe
		dc.w $4fff
		dc.w $ff92
		dc.w $4fff
		dc.w $ff92
		dc.w $7fff
		dc.w $fffe
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $7fff
		dc.w $fffe
		dc.w $4000
		dc.w $0012
		dc.w $4000
		dc.w $0012
		dc.w $7fff
		dc.w $fffe
		dc.w $4000
		dc.w $0012
		dc.b 'UUUR@',0
		dc.w $001e
		dc.b 'UUU^@',0
		dc.w $001e
		dc.b 'UUU^@',0
		dc.w $001e
		dc.b 'UUU^@',0
		dc.w $001e
		dc.b 'UUU^@',0
		dc.w $001e
		dc.b 'UUU^@',0
		dc.w $001e
		dc.b 'UUU^@',0
		dc.w $001e
		dc.b 'UUUR@',0
		dc.w $0012
		dc.w $7fff
		dc.w $fffe
		dc.w $4fff
		dc.w $ff92
		dc.w $4fff
		dc.w $ff92
		dc.w $7fff
		dc.w $fffe
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $7fff
		dc.w $fffe
		dc.w $4fff
		dc.w $ff93
		dc.w $4fff
		dc.w $ff93
		dc.w $7fff
		dc.w $ffff
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $001f
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $001f
		dc.w $4000
		dc.w $0013
		dc.w $4000
		dc.w $0013
		dc.w $7fff
		dc.w $ffff
		dc.w $4800
		dc.w $0093
		dc.w $4800
		dc.w $0093
		dc.w $7fff
		dc.w $ffff
		dc.w $3fff
		dc.w $ffff
		dc.w $0000
		dc.w $0000
DATAS_04:
		dc.w $0000
		dc.w $0000
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $7fff
		dc.w $ffff
		dc.w $3fff
		dc.w $ffff
		dc.w $0000
		dc.w $0000
A_3DBUTTON01:
		dc.l A_3Dbutton
		dc.w $a9e1
		dc.w $0178
		dc.l Auo_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_01
		dc.w $0000
		dc.w $0000
A_3DBUTTON02:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $9178
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
A_3DBUTTON03:
		dc.l A_3Dbutton
		dc.w $a9e1
		dc.w $0178
		dc.l Auo_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_02
		dc.w $0000
		dc.w $0000
A_3DBUTTON04:
		dc.l A_3Dbutton
		dc.w $a9e1
		dc.w $0178
		dc.l Auo_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l BUBBLE_03
		dc.w $0000
		dc.w $0000
A_ARROWS01:
		dc.l A_arrows
		dc.w $2209
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
_MSK_I_DEL:
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
		dc.w $000f
		dc.w $f000
		dc.w $003f
		dc.w $fc00
		dc.w $007f
		dc.w $fe00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $00ff
		dc.w $ff00
		dc.w $007f
		dc.w $fe00
		dc.w $003f
		dc.w $fc00
		dc.w $000f
		dc.w $f000
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
_DAT_I_DEL:
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
		dc.w $000f
		dc.w $f000
		dc.w $0030
		dc.w $0c00
		dc.w $0043
		dc.w $c300
		dc.w $0086
		dc.w $6100
		dc.w $0080
		dc.w $0100
		dc.w $00c0
		dc.w $0300
		dc.w $00b0
		dc.w $0f00
		dc.w $00df
		dc.w $f700
		dc.w $00b5
		dc.w $5f00
		dc.w $008f
		dc.w $e300
		dc.w $00a0
		dc.w $0b00
		dc.w $00a0
		dc.w $ab00
		dc.w $00aa
		dc.w $ab00
		dc.w $00aa
		dc.w $2b00
		dc.w $00aa
		dc.w $ab00
		dc.w $00aa
		dc.w $ab00
		dc.w $00aa
		dc.w $ab00
		dc.w $00a2
		dc.w $a700
		dc.w $0092
		dc.w $8b00
		dc.w $0042
		dc.w $1600
		dc.w $0030
		dc.w $3c00
		dc.w $000f
		dc.w $f000
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
I_DEL:
		dc.l _MSK_I_DEL
		dc.l _DAT_I_DEL
		dc.l TEXT_06
		dc.w $1000
		dc.w $000a
		dc.w $000a
		dc.w $0000
		dc.w $0000
		dc.w $0020
		dc.w $0020
		dc.w $000a
		dc.w $000a
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_MSK_I_INFO:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0007
		dc.w $c000
		dc.w $000f
		dc.w $e000
		dc.w $000f
		dc.w $e000
		dc.w $000f
		dc.w $e000
		dc.w $000f
		dc.w $e000
		dc.w $000f
		dc.w $e000
		dc.w $0007
		dc.w $c000
		dc.w $0000
		dc.w $0000
		dc.w $001f
		dc.w $c000
		dc.w $007f
		dc.w $e000
		dc.w $007f
		dc.w $f000
		dc.w $003f
		dc.w $f000
		dc.w $000f
		dc.w $f000
		dc.w $000f
		dc.w $f000
		dc.w $000f
		dc.w $f000
		dc.w $000f
		dc.w $f000
		dc.w $000f
		dc.w $f000
		dc.w $000f
		dc.w $f000
		dc.w $000f
		dc.w $f000
		dc.w $003f
		dc.w $f000
		dc.w $007f
		dc.w $f800
		dc.w $007f
		dc.w $f800
		dc.w $007f
		dc.w $f000
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
_DAT_I_INFO:
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
		dc.w $0003
		dc.w $8000
		dc.w $0007
		dc.w $c000
		dc.w $0007
		dc.w $c000
		dc.w $0007
		dc.w $c000
		dc.w $0003
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $001f
		dc.w $c000
		dc.w $003f
		dc.w $e000
		dc.w $0007
		dc.w $e000
		dc.w $0007
		dc.w $e000
		dc.w $0007
		dc.w $e000
		dc.w $0007
		dc.w $e000
		dc.w $0007
		dc.w $e000
		dc.w $0007
		dc.w $e000
		dc.w $0007
		dc.w $e000
		dc.w $0007
		dc.w $e000
		dc.w $0007
		dc.w $e000
		dc.w $003f
		dc.w $f000
		dc.w $003f
		dc.w $f000
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
I_INFO:
		dc.l _MSK_I_INFO
		dc.l _DAT_I_INFO
		dc.l TEXT_06
		dc.w $1000
		dc.w $000e
		dc.w $000e
		dc.w $0000
		dc.w $0000
		dc.w $0020
		dc.w $0020
		dc.w $000e
		dc.w $000e
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_MSK_I_OPEN:
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
		dc.w $07e0
		dc.w $0000
		dc.w $0ff0
		dc.w $0080
		dc.w $0ff0
		dc.w $00c0
		dc.w $0fff
		dc.w $ffe0
		dc.w $0fff
		dc.w $fff0
		dc.w $0fff
		dc.w $ffe0
		dc.w $0fff
		dc.w $fec0
		dc.w $0fff
		dc.w $fe80
		dc.w $0fff
		dc.w $fe00
		dc.w $0fff
		dc.w $fe00
		dc.w $0fff
		dc.w $ffc0
		dc.w $0fff
		dc.w $ffe0
		dc.w $0fff
		dc.w $ffe0
		dc.w $0fff
		dc.w $ffc0
		dc.w $0fff
		dc.w $ffc0
		dc.w $0fff
		dc.w $ff80
		dc.w $0fff
		dc.w $ff80
		dc.w $0fff
		dc.w $ff00
		dc.w $0fff
		dc.w $ff00
		dc.w $0fff
		dc.w $fe00
		dc.w $07ff
		dc.w $fc00
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
_DAT_I_OPEN:
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
		dc.w $07e0
		dc.w $0000
		dc.w $0810
		dc.w $0080
		dc.w $0810
		dc.w $00c0
		dc.w $080f
		dc.w $ffe0
		dc.w $0800
		dc.w $3ff0
		dc.w $0800
		dc.w $7fe0
		dc.w $0800
		dc.w $72c0
		dc.w $083e
		dc.w $7280
		dc.w $0841
		dc.w $7200
		dc.w $0841
		dc.w $0200
		dc.w $0880
		dc.w $ffc0
		dc.w $0880
		dc.w $0020
		dc.w $0900
		dc.w $0020
		dc.w $0900
		dc.w $0040
		dc.w $0a00
		dc.w $0040
		dc.w $0a00
		dc.w $0080
		dc.w $0c00
		dc.w $0080
		dc.w $0c00
		dc.w $0100
		dc.w $0c92
		dc.w $4900
		dc.w $0c00
		dc.w $0200
		dc.w $07ff
		dc.w $fe00
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
I_OPEN:
		dc.l _MSK_I_OPEN
		dc.l _DAT_I_OPEN
		dc.l TEXT_06
		dc.w $1000
		dc.w $0008
		dc.w $0008
		dc.w $0000
		dc.w $0000
		dc.w $0020
		dc.w $0020
		dc.w $0008
		dc.w $0008
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_C4_I_WIN:
		dc.w $0004
		dc.l DATAS_03+6
		dc.l DATAS_04
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_MSK_I_WIN:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $7fff
		dc.w $fffe
		dc.w $0000
		dc.w $0000
_DAT_I_WIN:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $7fff
		dc.w $fffe
		dc.w $4fff
		dc.w $ff92
		dc.w $4fff
		dc.w $ff92
		dc.w $7fff
		dc.w $fffe
		dc.w $4000
		dc.w $0012
		dc.b 'UUUR@',0
		dc.w $001e
		dc.b 'UUUR@',0
		dc.w $0012
		dc.b 'UUUR@',0
		dc.w $0012
		dc.b 'UUUR@',0
		dc.w $0012
		dc.b 'UUUR@',0
		dc.w $0012
		dc.b 'UUUR@',0
		dc.w $0012
		dc.b 'UUUR@',0
		dc.w $001e
		dc.b 'UUUR@',0
		dc.w $0012
		dc.w $7fff
		dc.w $fffe
		dc.w $4800
		dc.w $0092
		dc.w $4800
		dc.w $0092
		dc.w $7fff
		dc.w $fffe
		dc.w $0000
		dc.w $0000
I_WIN:
		dc.l _MSK_I_WIN
		dc.l _DAT_I_WIN
		dc.l TEXT_06
		dc.w $1000
		dc.w $0000
		dc.w $0000
		dc.w $0014
		dc.w $0000
		dc.w $0020
		dc.w $001c
		dc.w $0000
		dc.w $0020
		dc.w $0048
		dc.w $0008
		dc.l _C4_I_WIN
_IMG_B_OBJPROTO:
		dc.w $0000
		dc.w $0000
		dc.w $0022
		dc.w $0000
		dc.w $0066
		dc.w $0000
		dc.w $0066
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $4000
		dc.w $1f00
		dc.w $c800
		dc.w $1180
		dc.w $8800
		dc.w $1080
		dc.w $8800
		dc.w $1080
		dc.w $8800
		dc.w $0080
		dc.w $8800
		dc.w $0080
		dc.w $8800
		dc.w $0080
		dc.w $8800
		dc.w $0180
		dc.w $8800
		dc.w $0100
		dc.w $8800
		dc.w $0300
		dc.w $8fc0
		dc.w $0200
		dc.w $8c60
		dc.w $0200
		dc.w $8820
		dc.w $0200
		dc.w $8830
		dc.w $0201
		dc.w $8810
		dc.w $0201
		dc.w $1810
		dc.w $0201
		dc.w $1030
		dc.w $0303
		dc.w $1820
		dc.w $01ce
		dc.w $0860
		dc.w $0078
		dc.w $0cc0
		dc.w $0000
		dc.w $0780
		dc.w $0000
		dc.w $0000
		dc.w $0fff
		dc.w $fff8
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
B_OBJPROTO:
		dc.l _IMG_B_OBJPROTO
		dc.w $0004
		dc.w $0020
		dc.w $0000
		dc.w $0000
		dc.w $0001
_PMENU:
		dc.w $ffff
		dc.w $0001
		dc.w $0006
		dc.w $0019
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $005a
		dc.w $0019
_01__PMENU:
		dc.w $0006
		dc.w $0002
		dc.w $0002
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $005a
		dc.w $0201
_02__PMENU:
		dc.w $0001
		dc.w $0003
		dc.w $0005
		dc.w $0019
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0000
		dc.w $0016
		dc.w $0301
_03__PMENU:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $0020
		dc.w $0000
		dc.w $0000
		dc.l TEXT_06
		dc.w $0000
		dc.w $0000
		dc.w $0006
		dc.w $0301
_04__PMENU:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0020
		dc.w $0000
		dc.w $0000
		dc.l TEXT_11
		dc.w $0006
		dc.w $0000
		dc.w $0007
		dc.w $0301
_05__PMENU:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0020
		dc.w $0000
		dc.w $0000
		dc.l TEXT_15
		dc.w $000d
		dc.w $0000
		dc.w $0009
		dc.w $0301
_06__PMENU:
		dc.w $0000
		dc.w $0007
		dc.w $001d
		dc.w $0019
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0301
		dc.w $0050
		dc.w $0013
_07__PMENU:
		dc.w $0010
		dc.w $0008
		dc.w $000f
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $00ff
		dc.w $1100
		dc.w $0002
		dc.w $0000
		dc.w $0014
		dc.w $0008
_08__PMENU:
		dc.w $0009
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $2000
		dc.l TEXT_07
		dc.w $0000
		dc.w $0000
		dc.w $0014
		dc.w $0001
_09__PMENU:
		dc.w $000a
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $2008
		dc.l TEXT_09
		dc.w $0000
		dc.w $0001
		dc.w $0014
		dc.w $0001
_10__PMENU:
		dc.w $000b
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $2000
		dc.l TEXT_06
		dc.w $0000
		dc.w $0002
		dc.w $0014
		dc.w $0001
_11__PMENU:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $2000
		dc.l TEXT_06
		dc.w $0000
		dc.w $0003
		dc.w $0014
		dc.w $0001
_12__PMENU:
		dc.w $000d
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $2000
		dc.l TEXT_06
		dc.w $0000
		dc.w $0004
		dc.w $0014
		dc.w $0001
_13__PMENU:
		dc.w $000e
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $2000
		dc.l TEXT_06
		dc.w $0000
		dc.w $0005
		dc.w $0014
		dc.w $0001
_14__PMENU:
		dc.w $000f
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $2000
		dc.l TEXT_06
		dc.w $0000
		dc.w $0006
		dc.w $0014
		dc.w $0001
_15__PMENU:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $2000
		dc.l TEXT_06
		dc.w $0000
		dc.w $0007
		dc.w $0014
		dc.w $0001
_16__PMENU:
		dc.w $001d
		dc.w $0011
		dc.w $001c
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $00ff
		dc.w $1101
		dc.w $0008
		dc.w $0000
		dc.w $0015
		dc.w $0007
_17__PMENU:
		dc.w $0013
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0008
		dc.l TEXT_08
		dc.w $0000
		dc.w $0000
		dc.w $0015
		dc.w $0001
_17a_PMENU:
		dc.l Apd_new
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $844e
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_19__PMENU:
		dc.w $0015
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_04
		dc.w $0000
		dc.w $0001
		dc.w $0015
		dc.w $0001
_19a_PMENU:
		dc.l Apd_open
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $844f
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_21__PMENU:
		dc.w $0017
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_05
		dc.w $0000
		dc.w $0003
		dc.w $0015
		dc.w $0001
_21a_PMENU:
		dc.l Apd_info
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8449
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_23__PMENU:
		dc.w $0019
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_02
		dc.w $0000
		dc.w $0004
		dc.w $0015
		dc.w $0001
_23a_PMENU:
		dc.l Apd_module
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $844d
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_25__PMENU:
		dc.w $001b
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_13
		dc.w $0000
		dc.w $0006
		dc.w $0015
		dc.w $0001
_25a_PMENU:
		dc.l Apd_quit
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8451
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_27__PMENU:
		dc.w $001c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0108
		dc.l A_ARROWS01
		dc.w $0000
		dc.w $0002
		dc.w $0015
		dc.w $0001
_28__PMENU:
		dc.w $0010
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0108
		dc.l A_ARROWS01
		dc.w $0000
		dc.w $0005
		dc.w $0015
		dc.w $0001
_29__PMENU:
		dc.w $0006
		dc.w $001e
		dc.w $0024
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $00ff
		dc.w $1101
		dc.w $000f
		dc.w $0000
		dc.w $0010
		dc.w $0004
_30__PMENU:
		dc.w $0020
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_14
		dc.w $0000
		dc.w $0000
		dc.w $0010
		dc.w $0001
_30a_PMENU:
		dc.l Apd_close
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8455
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_32__PMENU:
		dc.w $0022
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_17
		dc.w $0000
		dc.w $0001
		dc.w $0010
		dc.w $0001
_32a_PMENU:
		dc.l Apd_delete
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8444
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_34__PMENU:
		dc.w $0024
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_18
		dc.w $0000
		dc.w $0003
		dc.w $0010
		dc.w $0001
_34a_PMENU:
		dc.l Apd_list
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8457
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_36__PMENU:
		dc.w $001d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0020
		dc.w $0108
		dc.l A_ARROWS01
		dc.w $0000
		dc.w $0002
		dc.w $0010
		dc.w $0001
PUR_BACK:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0060
		dc.w $0000
		dc.w $0000
		dc.w $4144
		dc.w $0000
		dc.w $0000
		dc.w $0020
		dc.w $000c
PUR_ICONS:
		dc.w $ffff
		dc.w $0001
		dc.w $0001
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $0014
		dc.w $0006
_01_PUR_ICONS:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $001f
		dc.w $3005
		dc.w $0000
		dc.l I_WIN
		dc.w $0001
		dc.w $0001
		dc.w $0009
		dc.w $0003
_01aPUR_ICONS:
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
		dc.w $0001
PUR_TOOL:
		dc.w $ffff
		dc.w $0001
		dc.w $0007
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON02
		dc.w $0000
		dc.w $0000
		dc.w $6000
		dc.w $2000
_01_PUR_TOOL:
		dc.w $0004
		dc.w $0002
		dc.w $0002
		dc.w $001f
		dc.w $0000
		dc.w $0000
		dc.l I_OPEN
		dc.w $0000
		dc.w $0000
		dc.w $2000
		dc.w $2000
_02_PUR_TOOL:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0000
		dc.l A_3DBUTTON01
		dc.w $0000
		dc.w $0000
		dc.w $2000
		dc.w $2000
_02aPUR_TOOL:
		dc.l mod_load
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
_04_PUR_TOOL:
		dc.w $0007
		dc.w $0005
		dc.w $0005
		dc.w $001f
		dc.w $0000
		dc.w $0000
		dc.l I_INFO
		dc.w $0004
		dc.w $0000
		dc.w $2000
		dc.w $2000
_05_PUR_TOOL:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $1005
		dc.w $0000
		dc.l A_3DBUTTON03
		dc.w $0000
		dc.w $0000
		dc.w $2000
		dc.w $2000
_05aPUR_TOOL:
		dc.l mod_info
		dc.l mod_infodrag
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_07_PUR_TOOL:
		dc.w $0000
		dc.w $0008
		dc.w $0008
		dc.w $001f
		dc.w $0000
		dc.w $0000
		dc.l I_DEL
		dc.w $0008
		dc.w $0000
		dc.w $2000
		dc.w $2000
_08_PUR_TOOL:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $1005
		dc.w $0000
		dc.l A_3DBUTTON04
		dc.w $0000
		dc.w $0000
		dc.w $2000
		dc.w $2000
_08aPUR_TOOL:
		dc.l mod_delete
		dc.l mod_deldrag
		dc.w $8020
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl PUR_DESK
PUR_DESK:
		dc.w $0000
		dc.w $0000
		dc.l pd_serv
		dc.l pd_make
		dc.l Awi_open
		dc.l Awi_init
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $000b
		dc.w $0000
		dc.w $0000
		dc.w $0078
		dc.w $0032
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
		dc.w $f8f8
		dc.l NAME_PUR_DESK
		dc.l TEXT_06
		dc.w $2710
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.l _PMENU
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
		dc.l purGEMScript
		dc.l STGUIDE_02
		dc.l HELPFILE_02
	.globl PUR_MODULE
PUR_MODULE:
		dc.w $0000
		dc.w $0000
		dc.l modul_serv
		dc.l modul_make
		dc.l Awi_open
		dc.l Awi_init
		dc.w $0000
		dc.w $0000
		dc.l PUR_TOOL
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $61ef
		dc.w $0000
		dc.w $0000
		dc.w $000c
		dc.w $0004
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
		dc.w $f8f8
		dc.l NAME_MODULE
		dc.l TEXT_06
		dc.w $2710
		dc.w $0118
		dc.w $0000
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l Awi_keys
		dc.l Awi_obchange
		dc.l Awi_redraw
		dc.l Awi_topped
		dc.l modul_close
		dc.l Awi_fulled
		dc.l Awi_arrowed
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l Awi_gemscript
		dc.l STGUIDE_01
		dc.l HELPFILE_01
xd033e:
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
Sep:
		dc.l A_arrows
		dc.w $2209
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
xd045e:
		dc.b 'AM,am',0,0,0
xd0466:
		dc.b 'pdesk',0
xd046c:
		dc.b 'PDESK',0
xd0472:
		dc.b 'A:\',0
xd0476:
		dc.b 'C:\',0
xd047a:
		dc.b 'AM',0
xd047d:
		dc.b 'AMA',0
xd0481:
		dc.b 'SetFront',0
		.even
