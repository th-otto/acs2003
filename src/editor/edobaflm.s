		.text

set_it:
		movem.l    d4/a2-a3,-(a7)
		movea.l    a0,a2
		move.w     d1,d4
		movea.l    a1,a3
		ext.l      d0
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		move.w     2(a2,d1.l),d1
		ext.l      d1
		move.l     d1,d2
		add.l      d2,d2
		add.l      d1,d2
		lsl.l      #3,d2
		lea.l      0(a2,d2.l),a0
		moveq.l    #8,d2
		and.w      10(a0),d2
		bne.s      set_it_1
		moveq.l    #1,d0
		and.w      10(a0),d0
		beq.s      set_it_2
		or.w       d4,(a1)
		bra.s      set_it_1
set_it_2:
		move.w     d4,d0
		not.w      d0
		and.w      d0,(a3)
set_it_1:
		movem.l    (a7)+,d4/a2-a3
		rts

edafl_ok:
		movem.l    d3/a2-a4,-(a7)
		subq.w     #8,a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    (a1),a0
		movea.l    20(a1),a2
		movea.l    (a0),a1
		ori.w      #0x0001,6(a1)
		movea.l    4(a0),a1
		move.l     4(a1),4(a7)
		move.l     30(a0),(a7)
		beq        edafl_ok_1
		movea.l    (a7),a0
		addq.l     #2,(a7)
		move.w     (a0),d3
		jsr        Amo_busy
		bra        edafl_ok_2
edafl_ok_7:
		movea.l    (a7),a0
		addq.l     #2,(a7)
		move.w     (a0),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a7),a3
		adda.l     d0,a3
		lea.l      16(a3),a4
		movea.l    a4,a1
		moveq.l    #4,d1
		moveq.l    #2,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		moveq.l    #64,d1
		moveq.l    #11,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		moveq.l    #2,d1
		moveq.l    #20,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		move.w     #0x4000,d1
		moveq.l    #29,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		moveq.l    #1,d1
		moveq.l    #5,d0
		movea.l    a2,a0
		bsr        set_it
		move.w     #0x0080,d0
		and.w      344(a2),d0
		bne.s      edafl_ok_3
		movea.l    a4,a1
		moveq.l    #8,d1
		movea.l    a2,a0
		moveq.l    #14,d0
		bsr        set_it
edafl_ok_3:
		movea.l    a4,a1
		moveq.l    #16,d1
		moveq.l    #23,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		move.w     #0x2000,d1
		moveq.l    #8,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		move.w     #0x1000,d1
		moveq.l    #17,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		move.w     #0x0800,d1
		moveq.l    #26,d0
		movea.l    a2,a0
		bsr        set_it
		move.w     #0x0080,d0
		and.w      1304(a2),d0
		bne.s      edafl_ok_4
		andi.w     #0xF9FF,(a4)
		moveq.l    #1,d0
		and.w      1378(a2),d0
		beq.s      edafl_ok_5
		ori.w      #0x0200,(a4)
edafl_ok_5:
		moveq.l    #1,d0
		and.w      1474(a2),d0
		beq.s      edafl_ok_6
		ori.w      #0x0400,(a4)
edafl_ok_6:
		moveq.l    #1,d0
		and.w      1426(a2),d0
		beq.s      edafl_ok_4
		ori.w      #0x0600,(a4)
edafl_ok_4:
		lea.l      18(a3),a4
		movea.l    a4,a1
		move.w     #0x2000,d1
		moveq.l    #32,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		moveq.l    #1,d1
		moveq.l    #36,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		moveq.l    #8,d1
		moveq.l    #42,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		moveq.l    #2,d1
		moveq.l    #39,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		moveq.l    #4,d1
		moveq.l    #45,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		moveq.l    #16,d1
		moveq.l    #48,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		moveq.l    #32,d1
		moveq.l    #51,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		move.w     #0x0200,d1
		moveq.l    #64,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		move.w     #0x0400,d1
		moveq.l    #73,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		move.w     #0x0100,d1
		moveq.l    #67,d0
		movea.l    a2,a0
		bsr        set_it
		movea.l    a4,a1
		move.w     #0x0800,d1
		moveq.l    #70,d0
		movea.l    a2,a0
		bsr        set_it
edafl_ok_2:
		move.w     d3,d0
		subq.w     #1,d3
		tst.w      d0
		bgt        edafl_ok_7
		jsr        Amo_unbusy
		jsr        ed_abort
edafl_ok_1:
		addq.w     #8,a7
		movem.l    (a7)+,d3/a2-a4
		rts

preset_it:
		movem.l    d3-d5/a2,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		move.w     d1,d4
		move.w     d2,d5
		ext.l      d0
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		move.w     2(a2,d1.l),d1
		ext.l      d1
		move.l     d1,d2
		add.l      d2,d2
		add.l      d1,d2
		lsl.l      #3,d2
		lea.l      0(a2,d2.l),a0
		tst.w      d4
		bne.s      preset_it_1
		tst.w      d5
		beq.s      preset_it_2
preset_it_1:
		andi.w     #0xFFF7,10(a0)
preset_it_2:
		tst.w      d4
		beq.s      preset_it_3
		ori.w      #0x0001,10(a0)
preset_it_3:
		cmpi.w     #0x0001,20(a7)
		bne.s      preset_it_4
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		move.l     #ea_duostate,24(a2,d0.l)
		bra.s      preset_it_5
preset_it_4:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		move.l     #ea_tristate,24(a2,d0.l)
preset_it_5:
		movem.l    (a7)+,d3-d5/a2
		rts

	.globl set_aflags
set_aflags:
		movem.l    d3-d7/a2-a5,-(a7)
		subq.w     #2,a7
		clr.w      d3
		lea.l      sm,a3
		lea.l      ED_AFLAGS-sm(a3),a0
		jsr        Aob_create
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      set_aflags_1
		suba.l     a0,a0
		bra        set_aflags_2
set_aflags_1:
		move.l     a2,(a3)
		movea.l    ACSblk,a0
		movea.l    600(a0),a1
		movea.l    (a1),a5
		move.w     #0xFFFF,d4
		move.w     d4,d5
		clr.w      d6
		move.w     d6,d7
		jsr        Amo_busy
		jsr        Adr_start
		bra.s      set_aflags_3
set_aflags_4:
		moveq.l    #-2,d1
		add.w      (a7),d1
		ext.l      d1
		divs.w     #0x0003,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		lsl.l      #3,d0
		movea.l    4(a5),a0
		movea.l    4(a0),a0
		adda.l     d0,a0
		lea.l      8(a0),a4
		and.w      10(a4),d5
		or.w       10(a4),d7
		and.w      8(a4),d4
		or.w       8(a4),d6
		addq.w     #1,d3
set_aflags_3:
		jsr        Adr_next
		move.w     d0,(a7)
		bpl.s      set_aflags_4
		lea.l      wintitel,a5
		cmp.w      #0x0001,d3
		bne.s      set_aflags_5
		lea.l      title1-sm(a3),a1
		movea.l    a5,a0
		jsr        strcpy
		move.w     8(a4),d0
		and.w      #0x0600,d0
		sub.w      #0x0200,d0
		beq.s      set_aflags_6
		sub.w      #0x0200,d0
		beq.s      set_aflags_7
		sub.w      #0x0200,d0
		beq.s      set_aflags_8
		bra.s      set_aflags_9
set_aflags_6:
		ori.w      #0x0001,1378(a2)
		bra.s      set_aflags_10
set_aflags_7:
		ori.w      #0x0001,1474(a2)
		bra.s      set_aflags_10
set_aflags_8:
		ori.w      #0x0001,1426(a2)
		bra.s      set_aflags_10
set_aflags_9:
		ori.w      #0x0001,1330(a2)
		bra.s      set_aflags_10
set_aflags_5:
		move.w     d3,-(a7)
		lea.l      titlemore-sm(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #2,a7
		ori.w      #0x0080,1304(a2)
set_aflags_10:
		move.l     a5,12(a3)
		move.w     d3,-(a7)
		moveq.l    #4,d0
		and.w      d6,d0
		bne.s      set_aflags_11
		moveq.l    #1,d2
		bra.s      set_aflags_12
set_aflags_11:
		clr.w      d2
set_aflags_12:
		moveq.l    #4,d1
		and.w      d4,d1
		moveq.l    #2,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		moveq.l    #64,d0
		and.w      d6,d0
		bne.s      set_aflags_13
		moveq.l    #1,d2
		bra.s      set_aflags_14
set_aflags_13:
		clr.w      d2
set_aflags_14:
		moveq.l    #64,d1
		and.w      d4,d1
		moveq.l    #11,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		moveq.l    #2,d0
		and.w      d6,d0
		bne.s      set_aflags_15
		moveq.l    #1,d2
		bra.s      set_aflags_16
set_aflags_15:
		clr.w      d2
set_aflags_16:
		moveq.l    #2,d1
		and.w      d4,d1
		moveq.l    #20,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		move.w     d6,d0
		and.w      #0x4000,d0
		bne.s      set_aflags_17
		moveq.l    #1,d2
		bra.s      set_aflags_18
set_aflags_17:
		clr.w      d2
set_aflags_18:
		move.w     d4,d1
		and.w      #0x4000,d1
		moveq.l    #29,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		moveq.l    #1,d0
		and.w      d6,d0
		bne.s      set_aflags_19
		moveq.l    #1,d2
		bra.s      set_aflags_20
set_aflags_19:
		clr.w      d2
set_aflags_20:
		moveq.l    #1,d1
		and.w      d4,d1
		moveq.l    #5,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		moveq.l    #8,d0
		and.w      d6,d0
		bne.s      set_aflags_21
		moveq.l    #1,d2
		bra.s      set_aflags_22
set_aflags_21:
		clr.w      d2
set_aflags_22:
		moveq.l    #8,d1
		and.w      d4,d1
		moveq.l    #14,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		moveq.l    #16,d0
		and.w      d6,d0
		bne.s      set_aflags_23
		moveq.l    #1,d2
		bra.s      set_aflags_24
set_aflags_23:
		clr.w      d2
set_aflags_24:
		moveq.l    #16,d1
		and.w      d4,d1
		moveq.l    #23,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		move.w     d6,d0
		and.w      #0x2000,d0
		bne.s      set_aflags_25
		moveq.l    #1,d2
		bra.s      set_aflags_26
set_aflags_25:
		clr.w      d2
set_aflags_26:
		move.w     d4,d1
		and.w      #0x2000,d1
		moveq.l    #8,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		move.w     d6,d0
		and.w      #0x1000,d0
		bne.s      set_aflags_27
		moveq.l    #1,d2
		bra.s      set_aflags_28
set_aflags_27:
		clr.w      d2
set_aflags_28:
		move.w     d4,d1
		and.w      #0x1000,d1
		moveq.l    #17,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		move.w     d6,d0
		and.w      #0x0800,d0
		bne.s      set_aflags_29
		moveq.l    #1,d2
		bra.s      set_aflags_30
set_aflags_29:
		clr.w      d2
set_aflags_30:
		move.w     d4,d1
		and.w      #0x0800,d1
		moveq.l    #26,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		move.w     d7,d0
		and.w      #0x2000,d0
		bne.s      set_aflags_31
		moveq.l    #1,d2
		bra.s      set_aflags_32
set_aflags_31:
		clr.w      d2
set_aflags_32:
		move.w     d5,d1
		and.w      #0x2000,d1
		moveq.l    #32,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		moveq.l    #1,d0
		and.w      d7,d0
		bne.s      set_aflags_33
		moveq.l    #1,d2
		bra.s      set_aflags_34
set_aflags_33:
		clr.w      d2
set_aflags_34:
		moveq.l    #1,d1
		and.w      d5,d1
		moveq.l    #36,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		moveq.l    #8,d0
		and.w      d7,d0
		bne.s      set_aflags_35
		moveq.l    #1,d2
		bra.s      set_aflags_36
set_aflags_35:
		clr.w      d2
set_aflags_36:
		moveq.l    #8,d1
		and.w      d5,d1
		moveq.l    #42,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		moveq.l    #2,d0
		and.w      d7,d0
		bne.s      set_aflags_37
		moveq.l    #1,d2
		bra.s      set_aflags_38
set_aflags_37:
		clr.w      d2
set_aflags_38:
		moveq.l    #2,d1
		and.w      d5,d1
		moveq.l    #39,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		moveq.l    #4,d0
		and.w      d7,d0
		bne.s      set_aflags_39
		moveq.l    #1,d2
		bra.s      set_aflags_40
set_aflags_39:
		clr.w      d2
set_aflags_40:
		moveq.l    #4,d1
		and.w      d5,d1
		moveq.l    #45,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		moveq.l    #16,d0
		and.w      d7,d0
		bne.s      set_aflags_41
		moveq.l    #1,d2
		bra.s      set_aflags_42
set_aflags_41:
		clr.w      d2
set_aflags_42:
		moveq.l    #16,d1
		and.w      d5,d1
		moveq.l    #48,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		moveq.l    #32,d0
		and.w      d7,d0
		bne.s      set_aflags_43
		moveq.l    #1,d2
		bra.s      set_aflags_44
set_aflags_43:
		clr.w      d2
set_aflags_44:
		moveq.l    #32,d1
		and.w      d5,d1
		moveq.l    #51,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		move.w     d7,d0
		and.w      #0x0200,d0
		bne.s      set_aflags_45
		moveq.l    #1,d2
		bra.s      set_aflags_46
set_aflags_45:
		clr.w      d2
set_aflags_46:
		move.w     d5,d1
		and.w      #0x0200,d1
		moveq.l    #64,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		move.w     d7,d0
		and.w      #0x0400,d0
		bne.s      set_aflags_47
		moveq.l    #1,d2
		bra.s      set_aflags_48
set_aflags_47:
		clr.w      d2
set_aflags_48:
		move.w     d5,d1
		and.w      #0x0400,d1
		moveq.l    #73,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		move.w     d7,d0
		and.w      #0x0100,d0
		bne.s      set_aflags_49
		moveq.l    #1,d2
		bra.s      set_aflags_50
set_aflags_49:
		clr.w      d2
set_aflags_50:
		move.w     d5,d1
		and.w      #0x0100,d1
		moveq.l    #67,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		move.w     d3,-(a7)
		move.w     d7,d0
		and.w      #0x0800,d0
		bne.s      set_aflags_51
		moveq.l    #1,d2
		bra.s      set_aflags_52
set_aflags_51:
		clr.w      d2
set_aflags_52:
		move.w     d5,d1
		and.w      #0x0800,d1
		moveq.l    #70,d0
		movea.l    a2,a0
		bsr        preset_it
		addq.w     #2,a7
		jsr        Amo_unbusy
		movea.l    a3,a0
set_aflags_2:
		addq.w     #2,a7
		movem.l    (a7)+,d3-d7/a2-a5
		rts

ea_tristate:
		move.l     a2,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		move.w     608(a0),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    604(a0),a1
		move.w     2(a1,d1.l),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    a1,a0
		adda.l     d0,a0
		moveq.l    #8,d0
		and.w      10(a0),d0
		beq.s      ea_tristate_1
		ori.w      #0x0001,10(a0)
		andi.w     #0xFFF7,10(a0)
		bra.s      ea_tristate_2
ea_tristate_1:
		moveq.l    #1,d0
		and.w      10(a0),d0
		beq.s      ea_tristate_3
		andi.w     #0xFFFE,10(a0)
		bra.s      ea_tristate_2
ea_tristate_3:
		ori.w      #0x0008,10(a0)
ea_tristate_2:
		moveq.l    #-1,d1
		movea.l    (a2),a0
		move.w     608(a0),d0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		jsr        Aev_release
		movea.l    (a7)+,a2
		rts

ea_duostate:
		move.l     a2,-(a7)
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		move.w     608(a0),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    604(a0),a1
		move.w     2(a1,d1.l),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    a1,a0
		adda.l     d0,a0
		moveq.l    #1,d0
		and.w      10(a0),d0
		beq.s      ea_duostate_1
		andi.w     #0xFFFE,10(a0)
		bra.s      ea_duostate_2
ea_duostate_1:
		ori.w      #0x0001,10(a0)
ea_duostate_2:
		moveq.l    #-1,d1
		movea.l    (a2),a0
		move.w     608(a0),d0
		movea.l    600(a0),a0
		movea.l    (a2),a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		jsr        Aev_release
		movea.l    (a7)+,a2
		rts

	.data

TEXT_001:
		dc.b 'Abbruch',0
TEXT_003:
		dc.b 'OK',0
TEXT_01:
		dc.b '   Edit',0
TEXT_02:
		dc.b '   Default',0
TEXT_03:
		dc.b '   Defaultable',0
TEXT_04:
		dc.b '   Selectable',0
TEXT_05:
		dc.b '   Accept',0
TEXT_06:
		dc.b '   Radiobutton',0
TEXT_07:
		dc.b '   Constant',0
TEXT_08:
		dc.b '   Dragable',0
TEXT_09:
		dc.b '   Silent',0
TEXT_10:
		dc.b '   Selected',0
TEXT_11:
		dc.b '   Crossed',0
TEXT_12:
		dc.b '   Disabled',0
TEXT_13:
		dc.b '   Outlined',0
TEXT_14:
		dc.b '   Checked',0
TEXT_15:
		dc.b '   Shadowed',0
TEXT_16:
		dc.b '   Oben',0
TEXT_17:
		dc.b '   Rechts',0
TEXT_18:
		dc.b '   Unten',0
TEXT_19:
		dc.b 'Indicator',0
TEXT_20:
		dc.b '   Touchexit',0
TEXT_21:
		dc.b 'None',0
TEXT_22:
		dc.b 'AES-4-Flags:',0
TEXT_23:
		dc.b '   Exit',0
TEXT_25:
		dc.b 'Status:',0
TEXT_26:
		dc.b 'Aussehen:',0
TEXT_27:
		dc.b 'Activator',0
TEXT_28:
		dc.b 'Background',0
TEXT_29:
		dc.b 'Verhalten:',0
TEXT_30:
		dc.b '   Links',0
help_title:
		dc.b 'Der Objekt-Flag-Editor',0
title1:
		dc.b ' STATUS -',0
titlemore:
		dc.b ' %d STATI -',0
A_3DBUTTON01:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON02:
		dc.l A_3Dbutton
		dc.w $21f1
		dc.w $0178
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
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_23
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON04:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_04
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON05:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_003
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON06:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_08
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON07:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_01
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON08:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_20
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON09:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_05
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON10:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_02
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON11:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_06
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON12:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_09
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON13:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_03
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON14:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_07
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON15:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_10
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON16:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_11
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON17:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_13
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON18:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_12
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON19:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_14
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON20:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_15
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON21:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_16
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON22:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_17
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON23:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_18
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON29:
		dc.l A_3Dbutton
		dc.w $a900
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_30
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_ARROWS01:
		dc.l A_arrows
		dc.w $2249
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
A_ARROWS02:
		dc.l A_arrows
		dc.w $0049
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
A_CHECKBOX01:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
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
A_CHECKBOX02:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_19
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_CHECKBOX03:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_21
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_CHECKBOX04:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_27
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_CHECKBOX05:
		dc.l A_checkbox
		dc.w $0000
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_28
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME02:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_25
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME03:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_26
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME04:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_29
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME05:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_22
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
ED_AFLAGS:
		dc.w $ffff
		dc.w $0001
		dc.w $005a
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON02
		dc.w $0000
		dc.w $0000
		dc.w $002e
		dc.w $0014
_01_ED_AFLAGS:
		dc.w $0023
		dc.w $0002
		dc.w $0020
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME04
		dc.w $0001
		dc.w $0000
		dc.w $002c
		dc.w $0006
_02_ED_AFLAGS:
		dc.w $0005
		dc.w $0004
		dc.w $0004
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON03
		dc.w $0001
		dc.w $0001
		dc.w $0007
		dc.w $0001
_02aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8845
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_04_ED_AFLAGS:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_05_ED_AFLAGS:
		dc.w $0008
		dc.w $0007
		dc.w $0007
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON04
		dc.w $0010
		dc.w $0001
		dc.w $000d
		dc.w $0001
_05aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8853
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_07_ED_AFLAGS:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_08_ED_AFLAGS:
		dc.w $000b
		dc.w $000a
		dc.w $000a
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON06
		dc.w $0020
		dc.w $0001
		dc.w $000b
		dc.w $0001
_08aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8847
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_10_ED_AFLAGS:
		dc.w $0008
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_11_ED_AFLAGS:
		dc.w $000e
		dc.w $000d
		dc.w $000d
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON08
		dc.w $0001
		dc.w $0002
		dc.w $000c
		dc.w $0001
_11aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8854
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_13_ED_AFLAGS:
		dc.w $000b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_14_ED_AFLAGS:
		dc.w $0011
		dc.w $0010
		dc.w $0010
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON07
		dc.w $0010
		dc.w $0002
		dc.w $0007
		dc.w $0001
_14aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8849
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_16_ED_AFLAGS:
		dc.w $000e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_17_ED_AFLAGS:
		dc.w $0014
		dc.w $0013
		dc.w $0013
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON09
		dc.w $0020
		dc.w $0002
		dc.w $0009
		dc.w $0001
_17aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8850
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_19_ED_AFLAGS:
		dc.w $0011
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_20_ED_AFLAGS:
		dc.w $0017
		dc.w $0016
		dc.w $0016
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON10
		dc.w $0001
		dc.w $0003
		dc.w $000a
		dc.w $0001
_20aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8844
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_22_ED_AFLAGS:
		dc.w $0014
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_23_ED_AFLAGS:
		dc.w $001a
		dc.w $0019
		dc.w $0019
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON11
		dc.w $0010
		dc.w $0003
		dc.w $000e
		dc.w $0001
_23aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8852
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_25_ED_AFLAGS:
		dc.w $0017
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_26_ED_AFLAGS:
		dc.w $001d
		dc.w $001c
		dc.w $001c
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON12
		dc.w $0020
		dc.w $0003
		dc.w $0009
		dc.w $0001
_26aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $884c
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_28_ED_AFLAGS:
		dc.w $001a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_29_ED_AFLAGS:
		dc.w $0020
		dc.w $001f
		dc.w $001f
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON13
		dc.w $0001
		dc.w $0004
		dc.w $000e
		dc.w $0001
_29aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8846
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_31_ED_AFLAGS:
		dc.w $001d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_32_ED_AFLAGS:
		dc.w $0001
		dc.w $0022
		dc.w $0022
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON14
		dc.w $0010
		dc.w $0004
		dc.w $000b
		dc.w $0001
_32aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8843
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_34_ED_AFLAGS:
		dc.w $0020
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_35_ED_AFLAGS:
		dc.w $0036
		dc.w $0024
		dc.w $0033
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME02
		dc.w $0001
		dc.w $0006
		dc.w $001c
		dc.w $0006
_36_ED_AFLAGS:
		dc.w $0027
		dc.w $0026
		dc.w $0026
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON15
		dc.w $0001
		dc.w $0001
		dc.w $000b
		dc.w $0001
_36aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b53
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_38_ED_AFLAGS:
		dc.w $0024
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_39_ED_AFLAGS:
		dc.w $002a
		dc.w $0029
		dc.w $0029
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON16
		dc.w $0010
		dc.w $0001
		dc.w $000a
		dc.w $0001
_39aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b52
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_41_ED_AFLAGS:
		dc.w $0027
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_42_ED_AFLAGS:
		dc.w $002d
		dc.w $002c
		dc.w $002c
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON18
		dc.w $0001
		dc.w $0002
		dc.w $000b
		dc.w $0001
_42aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b44
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_44_ED_AFLAGS:
		dc.w $002a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_45_ED_AFLAGS:
		dc.w $0030
		dc.w $002f
		dc.w $002f
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON19
		dc.w $0010
		dc.w $0002
		dc.w $000a
		dc.w $0001
_45aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b43
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_47_ED_AFLAGS:
		dc.w $002d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_48_ED_AFLAGS:
		dc.w $0033
		dc.w $0032
		dc.w $0032
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON17
		dc.w $0001
		dc.w $0003
		dc.w $000b
		dc.w $0001
_48aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b4f
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_50_ED_AFLAGS:
		dc.w $0030
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_51_ED_AFLAGS:
		dc.w $0023
		dc.w $0035
		dc.w $0035
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON20
		dc.w $0010
		dc.w $0003
		dc.w $000b
		dc.w $0001
_51aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b48
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_53_ED_AFLAGS:
		dc.w $0033
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_54_ED_AFLAGS:
		dc.w $003f
		dc.w $0037
		dc.w $003d
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME05
		dc.w $001d
		dc.w $0006
		dc.w $0010
		dc.w $0006
_55_ED_AFLAGS:
		dc.w $0039
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0011
		dc.w $0000
		dc.l A_CHECKBOX03
		dc.w $0001
		dc.w $0001
		dc.w $0007
		dc.w $0001
_55aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b4e
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_57_ED_AFLAGS:
		dc.w $003b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0011
		dc.w $0000
		dc.l A_CHECKBOX02
		dc.w $0001
		dc.w $0002
		dc.w $000c
		dc.w $0001
_57aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b49
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_59_ED_AFLAGS:
		dc.w $003d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0011
		dc.w $0000
		dc.l A_CHECKBOX04
		dc.w $0001
		dc.w $0003
		dc.w $000c
		dc.w $0001
_59aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b41
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_61_ED_AFLAGS:
		dc.w $0036
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0011
		dc.w $0000
		dc.l A_CHECKBOX05
		dc.w $0001
		dc.w $0004
		dc.w $000d
		dc.w $0001
_61aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b4b
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_63_ED_AFLAGS:
		dc.w $0058
		dc.w $0040
		dc.w $0055
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME03
		dc.w $0001
		dc.w $000c
		dc.w $002c
		dc.w $0005
_64_ED_AFLAGS:
		dc.w $0043
		dc.w $0042
		dc.w $0042
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON29
		dc.w $0001
		dc.w $0001
		dc.w $0008
		dc.w $0001
_64aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b4c
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_66_ED_AFLAGS:
		dc.w $0040
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_67_ED_AFLAGS:
		dc.w $0046
		dc.w $0045
		dc.w $0045
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON22
		dc.w $000b
		dc.w $0001
		dc.w $0009
		dc.w $0001
_67aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b45
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_69_ED_AFLAGS:
		dc.w $0043
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_70_ED_AFLAGS:
		dc.w $0049
		dc.w $0048
		dc.w $0048
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON21
		dc.w $0016
		dc.w $0001
		dc.w $0007
		dc.w $0001
_70aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b42
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_72_ED_AFLAGS:
		dc.w $0046
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_73_ED_AFLAGS:
		dc.w $004c
		dc.w $004b
		dc.w $004b
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_3DBUTTON23
		dc.w $0020
		dc.w $0001
		dc.w $0008
		dc.w $0001
_73aED_AFLAGS:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8b55
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_75_ED_AFLAGS:
		dc.w $0049
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0008
		dc.l A_CHECKBOX01
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_76_ED_AFLAGS:
		dc.w $004f
		dc.w $004d
		dc.w $004e
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0101
		dc.w $0004
		dc.w $0002
		dc.w $0004
		dc.w $0002
_77_ED_AFLAGS:
		dc.w $004e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS01
		dc.w $0000
		dc.w $0001
		dc.w $0004
		dc.w $0001
_78_ED_AFLAGS:
		dc.w $004c
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0040
		dc.w $0000
		dc.w $0001
		dc.w $1111
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_79_ED_AFLAGS:
		dc.w $0052
		dc.w $0050
		dc.w $0051
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0101
		dc.w $000e
		dc.w $0002
		dc.w $0004
		dc.w $0002
_80_ED_AFLAGS:
		dc.w $0051
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS01
		dc.w $0002
		dc.w $0001
		dc.w $0002
		dc.w $0001
_81_ED_AFLAGS:
		dc.w $004f
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0040
		dc.w $0000
		dc.w $0001
		dc.w $1111
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_82_ED_AFLAGS:
		dc.w $0055
		dc.w $0053
		dc.w $0054
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0101
		dc.w $0019
		dc.w $0002
		dc.w $0004
		dc.w $0002
_83_ED_AFLAGS:
		dc.w $0054
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0002
		dc.w $0000
		dc.w $0002
		dc.w $0002
_84_ED_AFLAGS:
		dc.w $0052
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0040
		dc.w $0000
		dc.w $0001
		dc.w $1111
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_85_ED_AFLAGS:
		dc.w $003f
		dc.w $0056
		dc.w $0057
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0101
		dc.w $0023
		dc.w $0002
		dc.w $0004
		dc.w $0002
_86_ED_AFLAGS:
		dc.w $0057
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_ARROWS02
		dc.w $0002
		dc.w $0001
		dc.w $0002
		dc.w $0001
_87_ED_AFLAGS:
		dc.w $0055
		dc.w $ffff
		dc.w $ffff
		dc.w $0014
		dc.w $0040
		dc.w $0000
		dc.w $0001
		dc.w $1111
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_88_ED_AFLAGS:
		dc.w $005a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON05
		dc.w $0009
		dc.w $0011
		dc.w $000c
		dc.w $0002
_88aED_AFLAGS:
		dc.l edafl_ok
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $884f
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_90_ED_AFLAGS:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON01
		dc.w $0019
		dc.w $0011
		dc.w $000c
		dc.w $0002
_90aED_AFLAGS:
		dc.l ed_abort
		dc.w $0000
		dc.w $0000
		dc.w $8020
		dc.w $8841
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
sm:
		dc.w $0000
		dc.w $0000
		dc.l edafl_ok
		dc.l Aob_delete
		dc.w $0000
		dc.w $0000
		dc.l help_title
		dc.w $0000
		dc.w $0000

	.bss

wintitel: ds.b 128
