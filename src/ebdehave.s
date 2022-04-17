		.text
		
edbh_list:
		subq.w     #8,a7
		movea.l    ACSblk,a0
		move.l     600(a0),(a7)
		movea.l    (a7),a0
		move.l     (a0),4(a7)
		movea.l    (a7),a0
		ori.w      #4,84(a0)
		move.l     4(a7),list_window
		movea.l    4(a7),a0
		move.l     20(a0),list_window+4
		lea.l      list_window,a0
		movea.l    WI_LIST+8,a1
		jsr        (a1)
		movea.l    (a7),a0
		andi.w     #0xFFFB,84(a0)
		addq.w     #8,a7
		rts

edbh_abort:
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        term
		rts

edbh_ok:
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        acc_behave
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        term
		rts

add_wi:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		movea.l    16(a7),a0
		move.b     (a0),d0
		beq.s      add_wi_1
		movea.l    16(a7),a1
		movea.l    8(a7),a0
		movea.l    20(a0),a0
		jsr        find_entry
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      add_wi_2
		clr.w      d0
		movea.l    16(a7),a1
		movea.l    8(a7),a0
		jsr        dup_ref
		move.l     a0,(a7)
		bra.s      add_wi_3
add_wi_2:
		movea.l    (a7),a0
		addq.w     #1,54(a0)
add_wi_3:
		bra.s      add_wi_4
add_wi_1:
		clr.l      (a7)
add_wi_4:
		move.l     4(a7),d0
		beq.s      add_wi_5
		movea.l    4(a7),a1
		lea.l      22(a1),a1
		movea.l    8(a7),a0
		movea.l    20(a0),a0
		jsr        find_entry
		move.l     a0,d0
		beq.s      add_wi_6
		movea.l    4(a7),a1
		movea.l    8(a7),a0
		jsr        del_window
		bra.s      add_wi_5
add_wi_6:
		movea.l    4(a7),a1
		movea.l    8(a7),a0
		jsr        del_ref
add_wi_5:
		movea.l    (a7),a0
		lea.l      12(a7),a7
		rts

add_fkt:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.l     a1,6(a7)
		move.w     d0,4(a7)
		movea.l    18(a7),a0
		move.b     (a0),d0
		beq.s      add_fkt_1
		movea.l    18(a7),a1
		movea.l    10(a7),a0
		movea.l    60(a0),a0
		jsr        find_entry
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      add_fkt_2
		move.w     4(a7),d0
		movea.l    18(a7),a1
		movea.l    10(a7),a0
		jsr        dup_ref
		move.l     a0,(a7)
		bra.s      add_fkt_3
add_fkt_2:
		movea.l    (a7),a0
		addq.w     #1,54(a0)
add_fkt_3:
		bra.s      add_fkt_4
add_fkt_1:
		clr.l      (a7)
add_fkt_4:
		move.l     6(a7),d0
		beq.s      add_fkt_5
		movea.l    6(a7),a1
		movea.l    10(a7),a0
		jsr        del_ref
add_fkt_5:
		movea.l    (a7),a0
		lea.l      14(a7),a7
		rts

swap_obj:
		lea.l      -32(a7),a7
		move.l     a0,28(a7)
		move.l     a1,24(a7)
		movea.l    24(a7),a0
		move.l     4(a0),4(a7)
		movea.l    24(a7),a0
		move.l     14(a0),d0
		lsr.l      #2,d0
		move.w     d0,14(a7)
		clr.w      12(a7)
		bra        swap_obj_1
swap_obj_2:
		move.w     12(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    4(a7),a0
		move.l     0(a0,d0.l),(a7)
		move.w     12(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    28(a7),a0
		move.l     0(a0,d0.l),8(a7)
		movea.l    (a7),a0
		move.l     4(a0),16(a7)
		movea.l    8(a7),a0
		movea.l    (a7),a1
		move.l     4(a0),4(a1)
		movea.l    8(a7),a0
		move.l     16(a7),4(a0)
		movea.l    (a7),a0
		move.l     10(a0),20(a7)
		movea.l    8(a7),a0
		movea.l    (a7),a1
		move.l     10(a0),10(a1)
		movea.l    8(a7),a0
		move.l     20(a7),10(a0)
		movea.l    (a7),a0
		move.l     14(a0),20(a7)
		movea.l    8(a7),a0
		movea.l    (a7),a1
		move.l     14(a0),14(a1)
		movea.l    8(a7),a0
		move.l     20(a7),14(a0)
		addq.w     #1,12(a7)
swap_obj_1:
		move.w     12(a7),d0
		cmp.w      14(a7),d0
		blt        swap_obj_2
		lea.l      32(a7),a7
		rts

acc_behave:
		move.l     a2,-(a7)
		lea.l      -22(a7),a7
		move.l     a0,18(a7)
		movea.l    18(a7),a0
		move.w     86(a0),d0
		and.w      #0x0200,d0
		beq.s      acc_behave_1
		bra        acc_behave_2
acc_behave_1:
		movea.l    18(a7),a0
		ori.w      #0x0200,86(a0)
		movea.l    18(a7),a0
		move.l     20(a0),6(a7)
		movea.l    18(a7),a0
		move.l     (a0),10(a7)
		movea.l    10(a7),a0
		move.w     6(a0),d0
		and.w      #0x87FF,d0
		or.w       #1,d0
		movea.l    10(a7),a0
		move.w     d0,6(a0)
		movea.l    10(a7),a1
		lea.l      372(a1),a1
		moveq.l    #33,d0
		movea.l    6(a7),a0
		jsr        Aob_gettext
		moveq.l    #1,d0
		movea.l    6(a7),a0
		and.w      706(a0),d0
		beq.s      acc_behave_3
		movea.l    10(a7),a0
		ori.w      #0x4000,6(a0)
acc_behave_3:
		moveq.l    #1,d0
		movea.l    6(a7),a0
		and.w      250(a0),d0
		beq.s      acc_behave_4
		movea.l    10(a7),a0
		ori.w      #0x2000,6(a0)
acc_behave_4:
		moveq.l    #1,d0
		movea.l    6(a7),a0
		and.w      298(a0),d0
		beq.s      acc_behave_5
		movea.l    10(a7),a0
		ori.w      #0x1000,6(a0)
acc_behave_5:
		moveq.l    #1,d0
		movea.l    6(a7),a0
		and.w      82(a0),d0
		beq.s      acc_behave_6
		movea.l    10(a7),a0
		ori.w      #0x0800,6(a0)
acc_behave_6:
		movea.l    10(a7),a0
		clr.l      368(a0)
		moveq.l    #1,d0
		movea.l    6(a7),a0
		and.w      754(a0),d0
		beq.s      acc_behave_7
		movea.l    10(a7),a0
		ori.l      #0x00000002,368(a0)
acc_behave_7:
		moveq.l    #1,d0
		movea.l    6(a7),a0
		and.w      346(a0),d0
		beq.s      acc_behave_8
		movea.l    10(a7),a0
		ori.l      #0x00000001,368(a0)
acc_behave_8:
		movea.l    6(a7),a0
		lea.l      120(a0),a0
		move.l     a0,2(a7)
		movea.l    2(a7),a0
		move.l     12(a0),14(a7)
		movea.l    10(a7),a1
		lea.l      526(a1),a1
		move.w     #0x0192,d0
		movea.l    2(a7),a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		movea.l    10(a7),a0
		move.w     500(a0),(a7)
		movea.l    6(a7),a0
		lea.l      576(a0),a0
		move.l     a0,2(a7)
		movea.l    2(a7),a0
		move.l     12(a0),14(a7)
		movea.l    10(a7),a1
		lea.l      500(a1),a1
		move.w     #0x0192,d0
		movea.l    2(a7),a0
		movea.l    14(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		movea.l    10(a7),a0
		move.w     (a7),d0
		cmp.w      500(a0),d0
		beq        acc_behave_2
		clr.w      d0
		movea.l    10(a7),a0
		jsr        acs_closewi
		move.w     (a7),d0
		tst.w      d0
		beq.s      acc_behave_9
		bra.s      acc_behave_10
acc_behave_9:
		bra.s      acc_behave_11
acc_behave_10:
		move.w     (a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    10(a7),a0
		adda.l     d0,a0
		movea.l    498(a0),a1
		movea.l    10(a7),a0
		movea.l    52(a0),a0
		movea.l    4(a0),a0
		bsr        swap_obj
		move.w     (a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    10(a7),a0
		adda.l     d0,a0
		movea.l    510(a0),a1
		movea.l    10(a7),a0
		movea.l    36(a0),a0
		movea.l    4(a0),a0
		bsr        swap_obj
acc_behave_11:
		movea.l    10(a7),a0
		move.w     500(a0),d0
		tst.w      d0
		beq.s      acc_behave_12
		bra.s      acc_behave_13
acc_behave_12:
		bra.s      acc_behave_2
acc_behave_13:
		movea.l    10(a7),a0
		move.w     500(a0),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    10(a7),a0
		adda.l     d0,a0
		movea.l    498(a0),a1
		movea.l    10(a7),a0
		movea.l    52(a0),a0
		movea.l    4(a0),a0
		bsr        swap_obj
		movea.l    10(a7),a0
		move.w     500(a0),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    10(a7),a0
		adda.l     d0,a0
		movea.l    510(a0),a1
		movea.l    10(a7),a0
		movea.l    36(a0),a0
		movea.l    4(a0),a0
		bsr        swap_obj
acc_behave_2:
		lea.l      22(a7),a7
		movea.l    (a7)+,a2
		rts

bh_make:
		lea.l      -144(a7),a7
		move.l     a0,140(a7)
		move.l     140(a7),136(a7)
		movea.l    136(a7),a0
		move.l     328(a0),d0
		beq.s      bh_make_1
		movea.l    136(a7),a0
		movea.l    328(a0),a0
		jsr        Awi_show
		movea.l    136(a7),a0
		movea.l    328(a0),a0
		bra        bh_make_2
bh_make_1:
		move.b     #0x20,4(a7)
		movea.l    136(a7),a0
		movea.l    8(a0),a1
		lea.l      5(a7),a0
		jsr        strcpy
		move.l     a0,WI_BEHAVE+78
		moveq.l    #92,d0
		lea.l      4(a7),a0
		jsr        strrchr
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      bh_make_3
		addq.l     #1,(a7)
		bra.s      bh_make_4
bh_make_3:
		lea.l      4(a7),a0
		move.l     a0,(a7)
bh_make_4:
		movea.l    WI_BEHAVE+90,a0
		move.l     (a7),8(a0)
		lea.l      WI_BEHAVE,a0
		jsr        Awi_create
		move.l     a0,132(a7)
		move.l     132(a7),d0
		bne.s      bh_make_5
		suba.l     a0,a0
		bra.s      bh_make_2
bh_make_5:
		movea.l    136(a7),a0
		pea.l      360(a0)
		movea.l    140(a7),a1
		lea.l      348(a1),a1
		movea.l    136(a7),a0
		jsr        wi_pos
		addq.w     #4,a7
		movea.l    132(a7),a0
		move.l     136(a7),(a0)
		movea.l    136(a7),a0
		move.l     132(a7),328(a0)
		movea.l    132(a7),a0
		jsr        set_behave
		movea.l    132(a7),a0
		movea.l    132(a7),a1
		movea.l    12(a1),a1
		jsr        (a1)
		tst.w      d0
		beq.s      bh_make_6
		movea.l    132(a7),a0
		jsr        term
		suba.l     a0,a0
		bra.s      bh_make_2
bh_make_6:
		movea.l    132(a7),a0
bh_make_2:
		lea.l      144(a7),a7
		rts

bh_service:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.l     a1,(a7)
		move.w     4(a7),d0
		subq.w     #2,d0
		beq.s      bh_service_1
		sub.w      #13,d0
		beq.s      bh_service_2
		bra.s      bh_service_3
bh_service_1:
		movea.l    6(a7),a0
		move.w     86(a0),d0
		and.w      #0x0200,d0
		bne.s      bh_service_4
		movea.l    6(a7),a0
		ori.w      #0x0200,86(a0)
		movea.l    6(a7),a0
		bsr        acc_behave
		movea.l    6(a7),a0
		jsr        term
bh_service_4:
		bra.s      bh_service_5
bh_service_2:
		bra.s      bh_service_5
bh_service_3:
		movea.l    (a7),a1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		jsr        Awi_service
		bra.s      bh_service_6
bh_service_5:
		moveq.l    #1,d0
bh_service_6:
		lea.l      10(a7),a7
		rts

set_behave:
		move.l     a2,-(a7)
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		movea.l    16(a7),a0
		move.l     20(a0),4(a7)
		movea.l    16(a7),a0
		move.l     (a0),12(a7)
		movea.l    12(a7),a1
		lea.l      372(a1),a1
		moveq.l    #33,d0
		movea.l    4(a7),a0
		jsr        Aob_puttext
		movea.l    4(a7),a0
		lea.l      696(a0),a0
		movea.l    12(a7),a1
		move.w     6(a1),d0
		and.w      #0x4000,d0
		jsr        set_flag
		movea.l    4(a7),a0
		lea.l      240(a0),a0
		movea.l    12(a7),a1
		move.w     6(a1),d0
		and.w      #0x2000,d0
		jsr        set_flag
		movea.l    4(a7),a0
		lea.l      288(a0),a0
		movea.l    12(a7),a1
		move.w     6(a1),d0
		and.w      #0x1000,d0
		jsr        set_flag
		movea.l    4(a7),a0
		lea.l      72(a0),a0
		movea.l    12(a7),a1
		move.w     6(a1),d0
		and.w      #0x0800,d0
		jsr        set_flag
		movea.l    4(a7),a0
		lea.l      336(a0),a0
		move.l     a0,-(a7)
		moveq.l    #1,d0
		movea.l    16(a7),a0
		and.l      368(a0),d0
		beq.s      set_behave_1
		moveq.l    #1,d0
		bra.s      set_behave_2
set_behave_1:
		clr.w      d0
set_behave_2:
		movea.l    (a7)+,a0
		jsr        set_flag
		movea.l    4(a7),a0
		lea.l      744(a0),a0
		move.l     a0,-(a7)
		moveq.l    #2,d0
		movea.l    16(a7),a0
		and.l      368(a0),d0
		beq.s      set_behave_3
		moveq.l    #1,d0
		bra.s      set_behave_4
set_behave_3:
		clr.w      d0
set_behave_4:
		movea.l    (a7)+,a0
		jsr        set_flag
		movea.l    4(a7),a0
		lea.l      120(a0),a0
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.l     12(a0),8(a7)
		movea.l    12(a7),a1
		lea.l      526(a1),a1
		move.w     #0x0191,d0
		movea.l    (a7),a0
		movea.l    8(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		movea.l    4(a7),a0
		lea.l      576(a0),a0
		move.l     a0,(a7)
		movea.l    (a7),a0
		move.l     12(a0),8(a7)
		movea.l    12(a7),a1
		lea.l      500(a1),a1
		move.w     #0x0191,d0
		movea.l    (a7),a0
		movea.l    8(a7),a2
		movea.l    8(a2),a2
		jsr        (a2)
		lea.l      20(a7),a7
		movea.l    (a7)+,a2
		rts

term:
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     (a0),(a7)
		movea.l    4(a7),a0
		move.w     86(a0),d0
		and.w      #0x0800,d0
		beq.s      term_1
		moveq.l    #8,d0
		movea.l    4(a7),a1
		lea.l      44(a1),a1
		movea.l    (a7),a0
		lea.l      348(a0),a0
		jsr        memcpy
		bra.s      term_2
term_1:
		moveq.l    #8,d0
		movea.l    4(a7),a1
		lea.l      36(a1),a1
		movea.l    (a7),a0
		lea.l      348(a0),a0
		jsr        memcpy
term_2:
		movea.l    4(a7),a0
		jsr        Awi_delete
		movea.l    (a7),a0
		clr.l      328(a0)
		addq.w     #8,a7
		rts

edmm_setflag:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.w     d0,8(a7)
		move.l     a1,4(a7)
		move.w     d1,2(a7)
		move.w     d2,(a7)
		moveq.l    #1,d0
		move.w     8(a7),d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		movea.l    10(a7),a0
		and.w      10(a0,d1.l),d0
		beq.s      edmm_setflag_1
		move.w     (a7),d0
		beq.s      edmm_setflag_2
		move.w     2(a7),d0
		not.w      d0
		movea.l    4(a7),a0
		and.w      d0,(a0)
		bra.s      edmm_setflag_3
edmm_setflag_2:
		move.w     2(a7),d0
		movea.l    4(a7),a0
		or.w       d0,(a0)
edmm_setflag_3:
		bra.s      edmm_setflag_4
edmm_setflag_1:
		move.w     (a7),d0
		beq.s      edmm_setflag_5
		move.w     2(a7),d0
		movea.l    4(a7),a0
		or.w       d0,(a0)
		bra.s      edmm_setflag_4
edmm_setflag_5:
		move.w     2(a7),d0
		not.w      d0
		movea.l    4(a7),a0
		and.w      d0,(a0)
edmm_setflag_4:
		lea.l      14(a7),a7
		rts

edmm_enable:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		movea.l    8(a7),a0
		move.l     20(a0),4(a7)
		moveq.l    #1,d0
		movea.l    4(a7),a0
		and.w      34(a0),d0
		move.w     d0,2(a7)
		moveq.l    #1,d0
		movea.l    4(a7),a0
		and.w      106(a0),d0
		move.w     d0,(a7)
		jsr        Awi_ontop
		cmpa.l     8(a7),a0
		bne.s      edmm_enable_1
		jsr        Awi_diaend
edmm_enable_1:
		moveq.l    #1,d0
		movea.l    4(a7),a0
		and.w      34(a0),d0
		move.w     d0,2(a7)
		move.w     2(a7),d0
		bne.s      edmm_enable_2
		moveq.l    #1,d2
		bra.s      edmm_enable_3
edmm_enable_2:
		clr.w      d2
edmm_enable_3:
		moveq.l    #8,d1
		moveq.l    #4,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		beq.s      edmm_enable_4
		move.w     (a7),d0
		bne.s      edmm_enable_5
edmm_enable_4:
		moveq.l    #1,d2
		bra.s      edmm_enable_6
edmm_enable_5:
		clr.w      d2
edmm_enable_6:
		moveq.l    #8,d1
		moveq.l    #10,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_7
		moveq.l    #1,d2
		bra.s      edmm_enable_8
edmm_enable_7:
		clr.w      d2
edmm_enable_8:
		moveq.l    #8,d1
		moveq.l    #6,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_9
		moveq.l    #1,d2
		bra.s      edmm_enable_10
edmm_enable_9:
		clr.w      d2
edmm_enable_10:
		moveq.l    #8,d1
		moveq.l    #8,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_11
		moveq.l    #1,d2
		bra.s      edmm_enable_12
edmm_enable_11:
		clr.w      d2
edmm_enable_12:
		moveq.l    #8,d1
		moveq.l    #40,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_13
		moveq.l    #1,d2
		bra.s      edmm_enable_14
edmm_enable_13:
		clr.w      d2
edmm_enable_14:
		moveq.l    #8,d1
		moveq.l    #42,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_15
		moveq.l    #1,d2
		bra.s      edmm_enable_16
edmm_enable_15:
		clr.w      d2
edmm_enable_16:
		moveq.l    #8,d1
		moveq.l    #44,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_17
		moveq.l    #1,d2
		bra.s      edmm_enable_18
edmm_enable_17:
		clr.w      d2
edmm_enable_18:
		moveq.l    #8,d1
		moveq.l    #46,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_19
		moveq.l    #1,d2
		bra.s      edmm_enable_20
edmm_enable_19:
		clr.w      d2
edmm_enable_20:
		moveq.l    #8,d1
		moveq.l    #36,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_21
		moveq.l    #1,d2
		bra.s      edmm_enable_22
edmm_enable_21:
		clr.w      d2
edmm_enable_22:
		moveq.l    #8,d1
		moveq.l    #38,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_23
		moveq.l    #1,d2
		bra.s      edmm_enable_24
edmm_enable_23:
		clr.w      d2
edmm_enable_24:
		moveq.l    #8,d1
		moveq.l    #48,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_25
		moveq.l    #1,d2
		bra.s      edmm_enable_26
edmm_enable_25:
		clr.w      d2
edmm_enable_26:
		moveq.l    #8,d1
		moveq.l    #50,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_27
		moveq.l    #1,d2
		bra.s      edmm_enable_28
edmm_enable_27:
		clr.w      d2
edmm_enable_28:
		moveq.l    #8,d1
		moveq.l    #52,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_29
		moveq.l    #1,d2
		bra.s      edmm_enable_30
edmm_enable_29:
		clr.w      d2
edmm_enable_30:
		moveq.l    #8,d1
		moveq.l    #54,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_31
		moveq.l    #1,d2
		bra.s      edmm_enable_32
edmm_enable_31:
		clr.w      d2
edmm_enable_32:
		moveq.l    #8,d1
		moveq.l    #56,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_33
		moveq.l    #1,d2
		bra.s      edmm_enable_34
edmm_enable_33:
		clr.w      d2
edmm_enable_34:
		moveq.l    #8,d1
		moveq.l    #33,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d0
		bne.s      edmm_enable_35
		moveq.l    #1,d2
		bra.s      edmm_enable_36
edmm_enable_35:
		clr.w      d2
edmm_enable_36:
		moveq.l    #8,d1
		moveq.l    #16,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #16,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_37
		moveq.l    #1,d2
		bra.s      edmm_enable_38
edmm_enable_37:
		clr.w      d2
edmm_enable_38:
		moveq.l    #8,d1
		moveq.l    #17,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #17,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_39
		moveq.l    #1,d2
		bra.s      edmm_enable_40
edmm_enable_39:
		clr.w      d2
edmm_enable_40:
		moveq.l    #8,d1
		moveq.l    #19,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #19,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_41
		moveq.l    #1,d2
		bra.s      edmm_enable_42
edmm_enable_41:
		clr.w      d2
edmm_enable_42:
		moveq.l    #8,d1
		moveq.l    #29,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #29,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_43
		moveq.l    #1,d2
		bra.s      edmm_enable_44
edmm_enable_43:
		clr.w      d2
edmm_enable_44:
		moveq.l    #8,d1
		moveq.l    #30,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #30,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_45
		moveq.l    #1,d2
		bra.s      edmm_enable_46
edmm_enable_45:
		clr.w      d2
edmm_enable_46:
		moveq.l    #8,d1
		moveq.l    #62,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #62,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_47
		moveq.l    #1,d2
		bra.s      edmm_enable_48
edmm_enable_47:
		clr.w      d2
edmm_enable_48:
		moveq.l    #8,d1
		moveq.l    #63,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #63,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_49
		moveq.l    #1,d2
		bra.s      edmm_enable_50
edmm_enable_49:
		clr.w      d2
edmm_enable_50:
		moveq.l    #8,d1
		moveq.l    #64,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #64,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_51
		moveq.l    #1,d2
		bra.s      edmm_enable_52
edmm_enable_51:
		clr.w      d2
edmm_enable_52:
		moveq.l    #8,d1
		moveq.l    #65,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #65,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_53
		moveq.l    #1,d2
		bra.s      edmm_enable_54
edmm_enable_53:
		clr.w      d2
edmm_enable_54:
		moveq.l    #8,d1
		moveq.l    #66,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #66,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_55
		moveq.l    #1,d2
		bra.s      edmm_enable_56
edmm_enable_55:
		clr.w      d2
edmm_enable_56:
		moveq.l    #8,d1
		moveq.l    #75,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #75,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_57
		moveq.l    #1,d2
		bra.s      edmm_enable_58
edmm_enable_57:
		clr.w      d2
edmm_enable_58:
		moveq.l    #8,d1
		moveq.l    #76,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #76,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_59
		moveq.l    #1,d2
		bra.s      edmm_enable_60
edmm_enable_59:
		clr.w      d2
edmm_enable_60:
		moveq.l    #8,d1
		moveq.l    #77,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #77,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_61
		moveq.l    #1,d2
		bra.s      edmm_enable_62
edmm_enable_61:
		clr.w      d2
edmm_enable_62:
		moveq.l    #8,d1
		moveq.l    #78,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #78,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_63
		moveq.l    #1,d2
		bra.s      edmm_enable_64
edmm_enable_63:
		clr.w      d2
edmm_enable_64:
		moveq.l    #8,d1
		moveq.l    #79,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #79,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_65
		moveq.l    #1,d2
		bra.s      edmm_enable_66
edmm_enable_65:
		clr.w      d2
edmm_enable_66:
		moveq.l    #8,d1
		moveq.l    #95,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #95,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_67
		moveq.l    #1,d2
		bra.s      edmm_enable_68
edmm_enable_67:
		clr.w      d2
edmm_enable_68:
		moveq.l    #8,d1
		moveq.l    #86,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #86,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		move.w     2(a7),d0
		bne.s      edmm_enable_69
		moveq.l    #1,d2
		bra.s      edmm_enable_70
edmm_enable_69:
		clr.w      d2
edmm_enable_70:
		moveq.l    #8,d1
		moveq.l    #88,d0
		movea.l    8(a7),a0
		jsr        Aob_state
		move.w     2(a7),d2
		moveq.l    #8,d1
		moveq.l    #88,d0
		movea.l    8(a7),a0
		jsr        Aob_flags
		jsr        Awi_ontop
		cmpa.l     8(a7),a0
		bne.s      edmm_enable_71
		jsr        Awi_diastart
edmm_enable_71:
		lea.l      12(a7),a7
		rts

edmm_setval:
		lea.l      -24(a7),a7
		move.l     a0,20(a7)
		movea.l    20(a7),a0
		move.l     (a0),16(a7)
		movea.l    16(a7),a0
		lea.l      532(a0),a0
		move.l     a0,8(a7)
		movea.l    16(a7),a0
		lea.l      76(a0),a0
		move.l     a0,4(a7)
		movea.l    20(a7),a0
		move.l     20(a0),(a7)
		movea.l    16(a7),a0
		move.w     6(a0),d0
		and.w      #0x8000,d0
		bne.s      edmm_setval_1
		moveq.l    #1,d2
		bra.s      edmm_setval_2
edmm_setval_1:
		clr.w      d2
edmm_setval_2:
		moveq.l    #1,d1
		moveq.l    #1,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		moveq.l    #1,d2
		movea.l    16(a7),a0
		and.w      594(a0),d2
		moveq.l    #1,d1
		moveq.l    #4,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		moveq.l    #2,d2
		movea.l    16(a7),a0
		and.w      594(a0),d2
		moveq.l    #1,d1
		moveq.l    #10,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		moveq.l    #4,d2
		movea.l    16(a7),a0
		and.w      594(a0),d2
		moveq.l    #1,d1
		moveq.l    #6,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		moveq.l    #8,d2
		movea.l    16(a7),a0
		and.w      594(a0),d2
		moveq.l    #1,d1
		moveq.l    #8,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		moveq.l    #4,d2
		movea.l    16(a7),a0
		and.w      90(a0),d2
		moveq.l    #1,d1
		moveq.l    #40,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		moveq.l    #16,d2
		movea.l    16(a7),a0
		and.w      90(a0),d2
		moveq.l    #1,d1
		moveq.l    #42,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		moveq.l    #32,d2
		movea.l    16(a7),a0
		and.w      90(a0),d2
		moveq.l    #1,d1
		moveq.l    #44,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		move.w     #0x0080,d2
		movea.l    16(a7),a0
		and.w      90(a0),d2
		moveq.l    #1,d1
		moveq.l    #46,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		moveq.l    #1,d2
		movea.l    16(a7),a0
		and.w      90(a0),d2
		moveq.l    #1,d1
		moveq.l    #36,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		moveq.l    #8,d2
		movea.l    16(a7),a0
		and.w      90(a0),d2
		moveq.l    #1,d1
		moveq.l    #38,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		movea.l    16(a7),a0
		move.w     90(a0),d0
		and.w      #0x0100,d0
		bne.s      edmm_setval_3
		moveq.l    #1,d2
		bra.s      edmm_setval_4
edmm_setval_3:
		clr.w      d2
edmm_setval_4:
		moveq.l    #1,d1
		moveq.l    #48,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		moveq.l    #2,d2
		movea.l    16(a7),a0
		and.w      90(a0),d2
		moveq.l    #1,d1
		moveq.l    #50,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		movea.l    16(a7),a0
		move.w     90(a0),d0
		and.w      #0x0400,d0
		bne.s      edmm_setval_5
		moveq.l    #1,d2
		bra.s      edmm_setval_6
edmm_setval_5:
		clr.w      d2
edmm_setval_6:
		moveq.l    #1,d1
		moveq.l    #52,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		movea.l    16(a7),a0
		move.w     90(a0),d0
		and.w      #0x0200,d0
		bne.s      edmm_setval_7
		moveq.l    #1,d2
		bra.s      edmm_setval_8
edmm_setval_7:
		clr.w      d2
edmm_setval_8:
		moveq.l    #1,d1
		moveq.l    #54,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		movea.l    16(a7),a0
		move.w     90(a0),d0
		and.w      #0x1000,d0
		bne.s      edmm_setval_9
		moveq.l    #1,d2
		bra.s      edmm_setval_10
edmm_setval_9:
		clr.w      d2
edmm_setval_10:
		moveq.l    #1,d1
		moveq.l    #56,d0
		movea.l    20(a7),a0
		jsr        Aob_state
		movea.l    4(a7),a1
		lea.l      18(a1),a1
		moveq.l    #16,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    4(a7),a0
		move.l     52(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_11
		lea.l      x8af8a,a1
		bra.s      edmm_setval_12
edmm_setval_11:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_12:
		moveq.l    #17,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    4(a7),a0
		move.l     48(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_13
		lea.l      x8af8b,a1
		bra.s      edmm_setval_14
edmm_setval_13:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_14:
		moveq.l    #19,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		move.l     22(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_15
		lea.l      x8af8c,a1
		bra.s      edmm_setval_16
edmm_setval_15:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_16:
		moveq.l    #66,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		move.l     26(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_17
		lea.l      x8af8d,a1
		bra.s      edmm_setval_18
edmm_setval_17:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_18:
		moveq.l    #62,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		move.l     30(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_19
		lea.l      x8af8e,a1
		bra.s      edmm_setval_20
edmm_setval_19:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_20:
		moveq.l    #63,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		move.l     34(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_21
		lea.l      x8af8f,a1
		bra.s      edmm_setval_22
edmm_setval_21:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_22:
		moveq.l    #64,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		move.l     38(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_23
		lea.l      x8af90,a1
		bra.s      edmm_setval_24
edmm_setval_23:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_24:
		moveq.l    #75,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		move.l     42(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_25
		lea.l      x8af91,a1
		bra.s      edmm_setval_26
edmm_setval_25:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_26:
		moveq.l    #65,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		move.l     46(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_27
		lea.l      x8af92,a1
		bra.s      edmm_setval_28
edmm_setval_27:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_28:
		moveq.l    #76,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		move.l     50(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_29
		lea.l      x8af93,a1
		bra.s      edmm_setval_30
edmm_setval_29:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_30:
		moveq.l    #78,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		move.l     54(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_31
		lea.l      x8af94,a1
		bra.s      edmm_setval_32
edmm_setval_31:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_32:
		moveq.l    #79,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		move.l     58(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_33
		lea.l      x8af95,a1
		bra.s      edmm_setval_34
edmm_setval_33:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_34:
		moveq.l    #77,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		move.l     66(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_35
		lea.l      x8af96,a1
		bra.s      edmm_setval_36
edmm_setval_35:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_36:
		moveq.l    #95,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		move.l     70(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_37
		lea.l      x8af97,a1
		bra.s      edmm_setval_38
edmm_setval_37:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_38:
		moveq.l    #29,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    8(a7),a0
		move.l     74(a0),12(a7)
		move.l     12(a7),d0
		bne.s      edmm_setval_39
		lea.l      x8af98,a1
		bra.s      edmm_setval_40
edmm_setval_39:
		movea.l    12(a7),a1
		lea.l      22(a1),a1
edmm_setval_40:
		moveq.l    #30,d0
		movea.l    (a7),a0
		jsr        Aob_puttext
		movea.l    4(a7),a0
		move.w     10(a0),-(a7)
		lea.l      x8af99,a1
		moveq.l    #86,d0
		movea.l    2(a7),a0
		jsr        Aob_printf
		addq.w     #2,a7
		movea.l    4(a7),a0
		move.w     12(a0),-(a7)
		lea.l      x8af9c,a1
		moveq.l    #88,d0
		movea.l    2(a7),a0
		jsr        Aob_printf
		addq.w     #2,a7
		movea.l    8(a7),a1
		lea.l      64(a1),a1
		move.w     #0x0191,d0
		movea.l    (a7),a0
		lea.l      792(a0),a0
		jsr        Auo_cycle
		lea.l      24(a7),a7
		rts

edmm_getval:
		lea.l      -30(a7),a7
		move.l     a0,26(a7)
		movea.l    26(a7),a0
		move.l     (a0),22(a7)
		movea.l    22(a7),a0
		lea.l      532(a0),a0
		move.l     a0,14(a7)
		movea.l    22(a7),a0
		lea.l      76(a0),a0
		move.l     a0,10(a7)
		movea.l    26(a7),a0
		move.l     20(a0),6(a7)
		moveq.l    #1,d0
		movea.l    6(a7),a0
		and.w      34(a0),d0
		beq.s      edmm_getval_1
		movea.l    22(a7),a0
		andi.w     #0x7FFF,6(a0)
		movea.l    22(a7),a0
		jsr        init_mess
		bra.s      edmm_getval_2
edmm_getval_1:
		movea.l    22(a7),a0
		move.w     6(a0),d0
		and.w      #0x8000,d0
		bne.s      edmm_getval_2
		lea.l      A_DELMESS,a0
		moveq.l    #1,d0
		jsr        Awi_alert
		move.w     d0,(a7)
		move.w     (a7),d0
		subq.w     #1,d0
		beq.s      edmm_getval_3
		subq.w     #1,d0
		beq.s      edmm_getval_4
		subq.w     #1,d0
		beq.s      edmm_getval_5
		bra.s      edmm_getval_2
edmm_getval_3:
		movea.l    22(a7),a0
		jsr        del_mess
		bra.s      edmm_getval_2
edmm_getval_4:
		bra.s      edmm_getval_2
edmm_getval_5:
		clr.w      d0
		bra        edmm_getval_6
edmm_getval_2:
		movea.l    22(a7),a0
		ori.w      #1,6(a0)
		moveq.l    #1,d2
		move.w     #0x8000,d1
		movea.l    22(a7),a1
		addq.w     #6,a1
		moveq.l    #1,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		clr.w      d2
		moveq.l    #1,d1
		movea.l    22(a7),a1
		lea.l      594(a1),a1
		moveq.l    #4,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		clr.w      d2
		moveq.l    #2,d1
		movea.l    22(a7),a1
		lea.l      594(a1),a1
		moveq.l    #10,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		clr.w      d2
		moveq.l    #4,d1
		movea.l    22(a7),a1
		lea.l      594(a1),a1
		moveq.l    #6,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		clr.w      d2
		moveq.l    #8,d1
		movea.l    22(a7),a1
		lea.l      594(a1),a1
		moveq.l    #8,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		clr.w      d2
		moveq.l    #4,d1
		movea.l    22(a7),a1
		lea.l      90(a1),a1
		moveq.l    #40,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		clr.w      d2
		moveq.l    #16,d1
		movea.l    22(a7),a1
		lea.l      90(a1),a1
		moveq.l    #42,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		clr.w      d2
		moveq.l    #32,d1
		movea.l    22(a7),a1
		lea.l      90(a1),a1
		moveq.l    #44,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		clr.w      d2
		move.w     #0x0080,d1
		movea.l    22(a7),a1
		lea.l      90(a1),a1
		moveq.l    #46,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		clr.w      d2
		moveq.l    #1,d1
		movea.l    22(a7),a1
		lea.l      90(a1),a1
		moveq.l    #36,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		clr.w      d2
		moveq.l    #8,d1
		movea.l    22(a7),a1
		lea.l      90(a1),a1
		moveq.l    #38,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		moveq.l    #1,d2
		move.w     #0x0100,d1
		movea.l    22(a7),a1
		lea.l      90(a1),a1
		moveq.l    #48,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		clr.w      d2
		moveq.l    #2,d1
		movea.l    22(a7),a1
		lea.l      90(a1),a1
		moveq.l    #50,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		moveq.l    #1,d2
		move.w     #0x0400,d1
		movea.l    22(a7),a1
		lea.l      90(a1),a1
		moveq.l    #52,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		moveq.l    #1,d2
		move.w     #0x0200,d1
		movea.l    22(a7),a1
		lea.l      90(a1),a1
		moveq.l    #54,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		moveq.l    #1,d2
		move.w     #0x1000,d1
		movea.l    22(a7),a1
		lea.l      90(a1),a1
		moveq.l    #56,d0
		movea.l    6(a7),a0
		bsr        edmm_setflag
		lea.l      x8af9f,a1
		movea.l    10(a7),a0
		lea.l      16(a0),a0
		jsr        strcpy
		movea.l    10(a7),a1
		lea.l      18(a1),a1
		moveq.l    #16,d0
		movea.l    6(a7),a0
		jsr        Aob_gettext
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      408(a0),a0
		jsr        Auo_boxed
		movea.l    10(a7),a0
		move.l     52(a0),18(a7)
		move.l     2(a7),-(a7)
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_wi
		addq.w     #4,a7
		movea.l    10(a7),a1
		move.l     a0,52(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      456(a0),a0
		jsr        Auo_boxed
		movea.l    10(a7),a0
		move.l     48(a0),18(a7)
		move.l     2(a7),-(a7)
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_wi
		addq.w     #4,a7
		movea.l    10(a7),a1
		move.l     a0,48(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      1584(a0),a0
		jsr        Auo_boxed
		movea.l    14(a7),a0
		move.l     22(a0),18(a7)
		move.l     2(a7),-(a7)
		moveq.l    #27,d0
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_fkt
		addq.w     #4,a7
		movea.l    14(a7),a1
		move.l     a0,22(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      1488(a0),a0
		jsr        Auo_boxed
		movea.l    14(a7),a0
		move.l     26(a0),18(a7)
		move.l     2(a7),-(a7)
		moveq.l    #28,d0
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_fkt
		addq.w     #4,a7
		movea.l    14(a7),a1
		move.l     a0,26(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      1512(a0),a0
		jsr        Auo_boxed
		movea.l    14(a7),a0
		move.l     30(a0),18(a7)
		move.l     2(a7),-(a7)
		moveq.l    #29,d0
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_fkt
		addq.w     #4,a7
		movea.l    14(a7),a1
		move.l     a0,30(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      1536(a0),a0
		jsr        Auo_boxed
		movea.l    14(a7),a0
		move.l     34(a0),18(a7)
		move.l     2(a7),-(a7)
		moveq.l    #30,d0
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_fkt
		addq.w     #4,a7
		movea.l    14(a7),a1
		move.l     a0,34(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      1800(a0),a0
		jsr        Auo_boxed
		movea.l    14(a7),a0
		move.l     38(a0),18(a7)
		move.l     2(a7),-(a7)
		moveq.l    #31,d0
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_fkt
		addq.w     #4,a7
		movea.l    14(a7),a1
		move.l     a0,38(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      1560(a0),a0
		jsr        Auo_boxed
		movea.l    14(a7),a0
		move.l     42(a0),18(a7)
		move.l     2(a7),-(a7)
		moveq.l    #32,d0
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_fkt
		addq.w     #4,a7
		movea.l    14(a7),a1
		move.l     a0,42(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      1824(a0),a0
		jsr        Auo_boxed
		movea.l    14(a7),a0
		move.l     46(a0),18(a7)
		move.l     2(a7),-(a7)
		moveq.l    #33,d0
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_fkt
		addq.w     #4,a7
		movea.l    14(a7),a1
		move.l     a0,46(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      1872(a0),a0
		jsr        Auo_boxed
		movea.l    14(a7),a0
		move.l     50(a0),18(a7)
		move.l     2(a7),-(a7)
		moveq.l    #34,d0
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_fkt
		addq.w     #4,a7
		movea.l    14(a7),a1
		move.l     a0,50(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      1896(a0),a0
		jsr        Auo_boxed
		movea.l    14(a7),a0
		move.l     54(a0),18(a7)
		move.l     2(a7),-(a7)
		moveq.l    #35,d0
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_fkt
		addq.w     #4,a7
		movea.l    14(a7),a1
		move.l     a0,54(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      1848(a0),a0
		jsr        Auo_boxed
		movea.l    14(a7),a0
		move.l     58(a0),18(a7)
		move.l     2(a7),-(a7)
		moveq.l    #36,d0
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_fkt
		addq.w     #4,a7
		movea.l    14(a7),a1
		move.l     a0,58(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      2280(a0),a0
		jsr        Auo_boxed
		movea.l    14(a7),a0
		move.l     66(a0),18(a7)
		move.l     2(a7),-(a7)
		moveq.l    #37,d0
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_fkt
		addq.w     #4,a7
		movea.l    14(a7),a1
		move.l     a0,66(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      696(a0),a0
		jsr        Auo_boxed
		movea.l    14(a7),a0
		move.l     70(a0),18(a7)
		move.l     2(a7),-(a7)
		moveq.l    #25,d0
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_fkt
		addq.w     #4,a7
		movea.l    14(a7),a1
		move.l     a0,70(a1)
		lea.l      2(a7),a1
		moveq.l    #3,d0
		movea.l    6(a7),a0
		lea.l      720(a0),a0
		jsr        Auo_boxed
		movea.l    14(a7),a0
		move.l     74(a0),18(a7)
		move.l     2(a7),-(a7)
		moveq.l    #26,d0
		movea.l    22(a7),a1
		movea.l    26(a7),a0
		bsr        add_fkt
		addq.w     #4,a7
		movea.l    14(a7),a1
		move.l     a0,74(a1)
		movea.l    10(a7),a0
		pea.l      10(a0)
		lea.l      x8afa2,a1
		moveq.l    #86,d0
		movea.l    10(a7),a0
		jsr        Aob_scanf
		addq.w     #4,a7
		movea.l    10(a7),a0
		pea.l      12(a0)
		lea.l      x8afa6,a1
		moveq.l    #88,d0
		movea.l    10(a7),a0
		jsr        Aob_scanf
		addq.w     #4,a7
		movea.l    14(a7),a1
		lea.l      64(a1),a1
		move.w     #0x0192,d0
		movea.l    6(a7),a0
		lea.l      792(a0),a0
		jsr        Auo_cycle
		movea.l    22(a7),a0
		movea.l    52(a0),a0
		move.l     18(a0),d0
		beq.s      edmm_getval_7
		movea.l    22(a7),a0
		movea.l    52(a0),a0
		movea.l    18(a0),a0
		ori.w      #0x0020,86(a0)
edmm_getval_7:
		movea.l    22(a7),a0
		movea.l    36(a0),a0
		move.l     18(a0),d0
		beq.s      edmm_getval_8
		movea.l    22(a7),a0
		movea.l    36(a0),a0
		movea.l    18(a0),a0
		ori.w      #0x0020,86(a0)
edmm_getval_8:
		moveq.l    #1,d0
edmm_getval_6:
		lea.l      30(a7),a7
		rts

edmm_create:
		move.l     a2,-(a7)
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     8(a7),4(a7)
		movea.l    4(a7),a0
		move.l     528(a0),d0
		beq.s      edmm_create_1
		movea.l    4(a7),a0
		movea.l    528(a0),a0
		jsr        Awi_show
		movea.l    4(a7),a0
		movea.l    528(a0),a0
		bra.s      edmm_create_2
edmm_create_1:
		lea.l      WI_MAINMOD,a0
		jsr        Awi_create
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      edmm_create_3
		suba.l     a0,a0
		bra.s      edmm_create_2
edmm_create_3:
		movea.l    (a7),a0
		move.l     4(a7),(a0)
		movea.l    4(a7),a0
		move.l     (a7),528(a0)
		movea.l    (a7),a0
		bsr        edmm_setval
		movea.l    (a7),a0
		bsr        edmm_enable
		movea.l    (a7),a0
		movea.l    (a7),a1
		movea.l    12(a1),a1
		jsr        (a1)
		tst.w      d0
		beq.s      edmm_create_4
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		suba.l     a0,a0
		bra.s      edmm_create_2
edmm_create_4:
		movea.l    (a7),a0
edmm_create_2:
		lea.l      12(a7),a7
		movea.l    (a7)+,a2
		rts

edmm_service:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.w     d0,8(a7)
		move.l     a1,4(a7)
		movea.l    10(a7),a0
		move.l     (a0),(a7)
		move.w     8(a7),d0
		subq.w     #2,d0
		beq.s      edmm_service_1
		sub.w      #13,d0
		beq.s      edmm_service_2
		bra.s      edmm_service_3
edmm_service_1:
		movea.l    10(a7),a0
		move.w     86(a0),d0
		and.w      #0x0200,d0
		bne.s      edmm_service_4
		movea.l    10(a7),a0
		ori.w      #0x0200,86(a0)
		movea.l    (a7),a0
		clr.l      528(a0)
		movea.l    10(a7),a0
		jsr        Awi_delete
edmm_service_4:
		bra.s      edmm_service_5
edmm_service_2:
		bra.s      edmm_service_5
edmm_service_3:
		movea.l    4(a7),a1
		move.w     8(a7),d0
		movea.l    10(a7),a0
		jsr        Awi_service
		bra.s      edmm_service_6
edmm_service_5:
		moveq.l    #1,d0
edmm_service_6:
		lea.l      14(a7),a7
		rts

edmm_ismain:
		jsr        Aev_release
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		bsr        edmm_enable
		rts

edmm_init_olga:
		subq.w     #8,a7
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.l     20(a0),4(a7)
		moveq.l    #1,d0
		movea.l    4(a7),a0
		and.w      34(a0),d0
		move.w     d0,2(a7)
		moveq.l    #1,d0
		movea.l    4(a7),a0
		and.w      106(a0),d0
		move.w     d0,(a7)
		jsr        Aev_release
		move.w     2(a7),d0
		beq.s      edmm_init_olga_1
		move.w     (a7),d0
		bne.s      edmm_init_olga_2
edmm_init_olga_1:
		moveq.l    #1,d2
		bra.s      edmm_init_olga_3
edmm_init_olga_2:
		clr.w      d2
edmm_init_olga_3:
		moveq.l    #8,d1
		moveq.l    #10,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        Aob_state
		addq.w     #8,a7
		rts

edmm_ok:
		move.l     a2,-(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		bsr        edmm_getval
		tst.w      d0
		beq.s      edmm_ok_1
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a2
		movea.l    600(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
edmm_ok_1:
		movea.l    (a7)+,a2
		rts

edmm_cancel:
		move.l     a2,-(a7)
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a2
		movea.l    600(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
		movea.l    (a7)+,a2
		rts

	.data

A_DELMESS:
		dc.b '[2][ Sollen die Applikations-| Meldungen gel”scht werden, | die als Hauptmodul gltig| waren?][ Ja | Nein | Abbruch ]',0
_A_COLREZ:
		dc.b '[1][ Die Anzahl der momentan| darstellbaren Farben oder| die aktuelle Bildaufl”sung | ist nicht korrekt!][ Abbruch ]',0
_A_CREATE_IO:
		dc.b '[1][ Eine Datei liež sich | nicht erzeugen!][ Abbruch ]',0
_A_CREATE_STR:
		dc.b "[3][ Die Datei '%s'| l„žt sich nicht erzeugen! ][ Abbruch ]",0
_A_DEFECTIVE_MEM:
		dc.b '[1][ Auf fremden Speicher | wurde zugegriffen!][ Abbruch ]',0
_A_ERR_ACC:
		dc.b '[2][ | Soll das Accessory | >>               << | gestartet werden?| ][Ja|  Nein  ]',0
_A_ERR_MESS:
		dc.b "[2][ Unbekannte GEM-Nachricht | erhalten.| ID = '%s'| Weiterhin berichten?][Ja|  Nein  ]",0
_A_ERR_WINDOW:
		dc.b '[3][ Keine freie GEM-Fenster-ID | mehr vorhanden!| Abhilfe: Ein offenes| GEM-Fenster schliežen.][    OK    ]',0
_A_ERR_WISLOT:
		dc.b '[3][ Kein freier ACS-Fenster- | Platz mehr vorhanden!| Abhilfe: Ein ACS-Fenster| l”schen.][    OK    ]',0
_A_GENERAL:
		dc.b '[3][ Es ist ein allgemeiner | Fehler aufgetreten! ][ Abbruch ]',0
_A_GENERAL_STR:
		dc.b '[1][ Ein Fehler ist aufgetreten! | %s][ Abbruch ]',0
_A_GEN_IO:
		dc.b '[1][ Es ist ein Fehler bei der | Ein-/Ausgabe aufgetreten!][ Abbruch ]',0
_A_GEN_MEM:
		dc.b '[1][ Es ist ein Fehler in| der Speicherverwaltung | aufgetreten!][ Abbruch ]',0
_A_GEN_MOD:
		dc.b '[1][ Das Modul konnte nicht | geladen werden!][ Abbruch ]',0
_A_GEN_MOD_STR:
		dc.b "[1][ Das Modul '%s' | konnte nicht geladen werden! ][ Abbruch ]",0
_A_LOAD_MOD:
		dc.b '[1][ Beim Laden des Moduls | (mit Pexec-3) ist ein| Fehler aufgetreten!][ Abbruch ]',0
_A_LOAD_MOD_STR:
		dc.b "[1][ Beim Laden des Moduls | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",0
_A_MEM_MOD:
		dc.b '[1][ Der dem Modul folgende| Restspeicher kann nicht | freigegeben werden!][ Abbruch ]',0
_A_MEM_MOD_STR:
		dc.b "[1][ Der dem Modul '%s' | folgenden Restspeicher kann | nicht freigegeben werden!][ Abbruch ]",0
_A_ODD_MEM:
		dc.b '[1][ Die Adresse eines Speicher- | blocks ist ungerade!][ Abbruch ]',0
_A_OPEN_IO:
		dc.b '[1][ Eine Datei liež sich| nicht korrekt ”ffnen! ][ Abbruch ]',0
_A_OPEN_STR:
		dc.b "[1][ Die Datei '%s' | l„žt sich nicht ”ffnen!][ Abbruch ]",0
_A_OUT_OF_MEM:
		dc.b '[1][ Es steht nicht gengend | Speicher zur Verfgung!][ Abbruch ]',0
_A_PORT:
		dc.b '[1][ Ein Fehler trat auf einem| Ein-/Ausgabekanal auf!][ Abbruch ]',0
_A_RANGE_MEM:
		dc.b '[1][ Ein Speicherblock| befindet sich aužerhalb | der legalen Bereiche!][ Abbruch ]',0
_A_READ_IO:
		dc.b '[1][ Beim Lesen aus einer Datei| ist ein Fehler aufgetreten! ][ Abbruch ]',0
_A_READ_STR:
		dc.b "[1][ Beim Lesen aus der Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",0
_A_VER_MOD:
		dc.b '[1][ Das Modul hat leider eine | falsche Versionsnummer!][ Abbruch ]',0
_A_VER_MOD_STR:
		dc.b "[1][Das Modul|'%s'|hat eine falsche|Versionsnummer!][ Abbruch ]",0
_A_WRITE_IO:
		dc.b '[1][ Beim Schreiben in eine Datei | ist ein Fehler aufgetreten!][ Abbruch ]',0
_A_WRITE_STR:
		dc.b "[1][ Beim Schreiben in die Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",0
BUBBLE_01:
		dc.b 'Die Žnderungen werden bernommen und berschreiben die alten Einstellungen.',0
BUBBLE_02:
		dc.b 'Die Žnderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
BUBBLE_03:
		dc.b 'Hier kann das Modul als Hauptmodul bestimmt werden. Jede ACS-Anwendung ben”tigt mindestens ein Hauptmodul, ACS-Module drfen keines besitzen.',0
BUBBLE_04:
		dc.b 'Hier wird angegeben, ob das OLGA-Protokoll beim Start initialisiert werden soll. Ggf. wird versucht, den OLGA-Manager nachzustarten.',0
BUBBLE_05:
		dc.b 'Hier wird angegeben, ob beim Nachstarten des OLGA-Managers gewartet werden soll, bis er l„uft. Der Start der Anwendung wird dadurch z.T. drastisch verz”gert.',0
BUBBLE_06:
		dc.b 'Hier wird angegeben, ob das GEMScript-Protokoll initialisiert werden soll.',0
BUBBLE_07:
		dc.b 'Hier wird angegeben, ob BubbleGEM initialisiert werden soll. Ggf. wird BubbleGEM nachgestartet.',0
BUBBLE_08:
		dc.b 'Hier wird angegeben, ob die Anwendung im 3D-Modus laufen soll oder nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_09:
		dc.b 'Hier wird angegeben, ob modale (Fenster-)Dialoge zentriert werden sollen oder an der Maus-Position erscheinen sollen. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_10:
		dc.b 'Hier wird angegeben, ob Fehler akustisch signalisiert werden sollen oder nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_11:
		dc.b 'Hier wird angegeben, ob beim Start GDOS-Fonts geladen werden sollen oder nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_12:
		dc.b 'Hier wird angegeben, ob bei Tastendrcken erst das Hauptmen und dann der Fenster-Dialog bercksichtigt wird oder andersherum. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_13:
		dc.b 'Hier wird angegeben, ob bei Tastendrcken der Maus-Zeiger versteckt werden sollen nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_14:
		dc.b 'Hier wird angegeben, ob sich Fenstermens erst nach einem Maus-Klick oder bereits beim Berhren mit dem Maus-Zeiger ”ffnen. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_15:
		dc.b 'Importierte Texte werden in ACS neu angelegt, wenn sie nicht vorhanden sind.',0
BUBBLE_16:
		dc.b 'Hier wird der XAcc-Typ der Anwendung angegeben. Genauere Informationen ber den Typ finden Sie in der XAcc-Dokumentation.',0
BUBBLE_17:
		dc.b 'Hier wird angegeben, ob optische Rckmeldungen (wachsende Rechtecke, Meldung beim Ende von TOS-Programmen) verwendet werden sollen oder nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_18:
		dc.b 'Hier wird angegeben, ob allozierte und freigegebene Speicherbl”cke geprft werden sollen oder nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_19:
		dc.b 'Hier wird angegeben, ob Sicherheitsprfungen (wie z.B. vor Dsetdrv/Dsetpath) durchgefhrt werden sollen oder nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_20:
		dc.b 'Hier k”nnen Sie in Zukunft angeben, fr welche Zielplattform Code erzeugt werden soll. Noch hat diese Einstellung keinen Effekt!',0
BUBBLE_21:
		dc.b 'Hier stellen Sie die Programmiersprache ein, die fr dieses ACS-Modul verwendet werden soll.',0
BUBBLE_22:
		dc.b 'Hier geben Sie an, welche Oberfl„chensprache aktiviert und ausgegeben werden soll.',0
BUBBLE_23:
		dc.b 'Sie k”nnen bei jedem Sichern automatisch ein Backup der alten Datei anlegen lassen. Hier schalten Sie dieses ein. Geben Sie bitte auch den Pfad des Backups an!',0
BUBBLE_24:
		dc.b 'Hier geben Sie bitte den Pfad an, in dem das Backup gemacht werden soll.',0
BUBBLE_25:
		dc.b 'Alle Objektnamen werden automatisch in Grožbuchstaben gewandelt.',0
BUBBLE_26:
		dc.b 'Hier wird eingestellt, ob die Prototypen fr den Compiler mit exportiert werden sollen.',0
BUBBLE_27:
		dc.b 'Alle nicht-globalen Definitionen werden als modul-lokal exportiert. Damit k”nnen sich gleiche Bezeichner in verschiedenen Modulen nicht berschneiden.',0
BUBBLE_28:
		dc.b 'Es wird automatisch eine Liste der Definitionen und Bezeichner erstellt.',0
BUBBLE_29:
		dc.b 'Hier schalten Sie die Ausgabe fr den im Popup ausgew„hlten Compiler ein.',0
BUBBLE_30:
		dc.b 'Hier wird der Name der entsprechenden Funktion eingetragen.',0
BUBBLE_31:
		dc.b 'Hier wird definiert, welchen Abstand Fenster vom Bildschirmrand haben sollen.',0
BUBBLE_32:
		dc.b 'Hier schalten Sie die Verwendung von modernen 3D-Mens ein und aus. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_33:
		dc.b 'Die Texte der ausgew„hlten Sprache werden trotz Auslagerung der Texte in die Anwendung als Default-Texte integriert.',0
BUBBLE_34:
		dc.b 'Alle Texte werden in eine ASCII-Datei ausgelagert. Diese kann gegen die einer anderen Sprache ausgetauscht werden. Das Zusammenbinden der ASCII-Dateien zur globalen ASCII-Datei der Anwendung muž getrennt erfolgen.',0
HELPFILE_01:
		dc.b 'ACSPRO',0
STGUIDE_01:
		dc.b 'Der Hauptmodul-Dialog',0
STGUIDE_02:
		dc.b 'Der Eigenschaften-Dialog',0
TEXT_002:
		dc.b 0
TEXT_003:
		dc.b 'OK',0
TEXT_004:
		dc.b 'Abbrechen',0
TEXT_009:
		dc.b 'Lade GDOS-Fonts',0
TEXT_01:
		dc.b 'Sprache, Texte',0
TEXT_012:
		dc.b 'dy:',0
TEXT_014:
		dc.b 'dx:',0
TEXT_018:
		dc.b "Definitionen als 'lokal'",0
TEXT_02:
		dc.b 'Ausgabe:',0
TEXT_03:
		dc.b 'Taste zuerst Mens',0
TEXT_04:
		dc.b 'Verhalten',0
TEXT_05:
		dc.b 'Optionen',0
TEXT_06:
		dc.b 'Plattform & Entwicklungsumgebung',0
TEXT_07:
		dc.b 'Rahmen',0
TEXT_08:
		dc.b ' Pure-C / GNU-C | Pure-Pascal ',0
TEXT_09:
		dc.b 'ACS-Ausgabe',0
TEXT_10:
		dc.b ' Eigenschaften ',0
TEXT_11:
		dc.b ' 1. Sprache (D)| 2. Sprache (E)| 3. Sprache    | 4. Sprache',0
TEXT_110:
		dc.b 'Sprache',0
TEXT_111:
		dc.b 'Oberfl„che:',0
TEXT_112:
		dc.b 'Texte',0
TEXT_118:
		dc.b 'Pulldown Mens',0
TEXT_12:
		dc.b 'Importieren',0
TEXT_13:
		dc.b 'Namen',0
TEXT_14:
		dc.b 'Verstecke Maus',0
TEXT_15:
		dc.b 'Liste der Definitionen',0
TEXT_16:
		dc.b 'BackUp anlegen',0
TEXT_17:
		dc.b ' Atari ST | Macintosh | Windows | Linux ',0
TEXT_18:
		dc.b 'Plattform',0
TEXT_19:
		dc.b ' Hauptmodul-Eigenschaften ',0
TEXT_20:
		dc.b 'Import-Texte ggf. neu anlegen',0
TEXT_21:
		dc.b 'ACC-Fenster:',0
TEXT_22:
		dc.b 'ACC-Eintrag:',0
TEXT_23:
		dc.b 'OK',0
TEXT_24:
		dc.b 'Abbrechen',0
TEXT_25:
		dc.b 'Initialisierungs-Funktionen & -Daten',0
TEXT_26:
		dc.b 'Modul ist Hauptmodul',0
TEXT_263:
		dc.b 'Zentriere Dialog',0
TEXT_27:
		dc.b 'ACSinit0',0
TEXT_28:
		dc.b 'ACSinit',0
TEXT_29:
		dc.b 'ACSterm',0
TEXT_30:
		dc.b 'ACSaboutme',0
TEXT_31:
		dc.b 'ACSclose',0
TEXT_32:
		dc.b 'ACSmessage',0
TEXT_33:
		dc.b 'ACSmproto',0
TEXT_331:
		dc.b 'VERHALTEN',0
TEXT_34:
		dc.b 'ACStimer',0
TEXT_345:
		dc.b 'abc = ABC',0
TEXT_347:
		dc.b 'Prototypen',0
TEXT_35:
		dc.b 'ACSkey',0
TEXT_350:
		dc.b 'Fehler akustisch',0
TEXT_36:
		dc.b 'ACSbutton',0
TEXT_37:
		dc.b 'ACSmouse',0
TEXT_38:
		dc.b 'ACSwikey',0
TEXT_39:
		dc.b 'ACSGEMScript',0
TEXT_40:
		dc.b 'Protokollierungs-Funktionen',0
TEXT_41:
		dc.b 'Kommunikations-Protokolle',0
TEXT_42:
		dc.b '3D-Darstellung',0
TEXT_43:
		dc.b 'Sonstige Funktionen',0
TEXT_44:
		dc.b 'XAcc-Typ',0
TEXT_45:
		dc.b '      keine | WP - Textverarbeitung | DP - DTP | ED - Editor | DB - Datenbank | SS - Tabellenkalkulation | RG - Pixelgraphik | VG - Vektorgraphik | GG - Graphik | MU - Musik | CD - CAD | DC - Kommunikation | DT - Desktop | PE - Programmierumgebung',0
TEXT_46:
		dc.b 'Initialisierung',0
TEXT_47:
		dc.b 'OLGA',0
TEXT_48:
		dc.b 'warten',0
TEXT_49:
		dc.b 'GEMScript',0
TEXT_50:
		dc.b 'BubbleGEM',0
TEXT_51:
		dc.b 'Optisches Feedback',0
TEXT_52:
		dc.b 'Speichertest',0
TEXT_53:
		dc.b 'Sicherheitschecks',0
TEXT_54:
		dc.b 'Moderne 3D-Mens',0
TEXT_55:
		dc.b 'Texte aus Anwendung auslagern',0
TEXT_56:
		dc.b 'Default-Texte behalten',0
_AL_ATT:
		dc.b ' Achtung ',0
_AL_QUEST:
		dc.b ' Frage ',0
_AL_STOP:
		dc.b ' Stop ',0
_AL_TIMER:
		dc.b ' Meldung ',0
DATAS_07:
		dc.w 0
		dc.w 0
		dc.w $02c0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0401
		dc.w $e007
		dc.w $8020
		dc.w $0407
		dc.w $f81f
		dc.w $e020
		dc.w $040f
		dc.w $fc3f
		dc.w $f020
		dc.w $040e
		dc.w $1c38
		dc.w $f020
		dc.w $041c
		dc.w $ce7b
		dc.w $7820
		dc.w $041d
		dc.w $fe7b
		dc.w $7820
		dc.w $041d
		dc.w $fe78
		dc.w $f820
		dc.w $041c
		dc.w $ce7b
		dc.w $7820
		dc.w $040e
		dc.w $1c3b
		dc.w $7020
		dc.w $040f
		dc.w $fc3f
		dc.w $f020
		dc.w $0407
		dc.w $f81f
		dc.w $e020
		dc.w $0401
		dc.w $e007
		dc.w $8020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0491
		dc.w $2244
		dc.w $8920
		dc.w $0460
		dc.w $c183
		dc.w $1fa0
		dc.w $0463
		dc.w $f183
		dc.w $1fa0
		dc.w $0463
		dc.w $f7e3
		dc.w $0620
		dc.w $0460
		dc.w $c7e3
		dc.w $0620
		dc.w $05f8
		dc.w $c18f
		dc.w $c620
		dc.w $05f8
		dc.w $c18f
		dc.w $c620
		dc.w $0491
		dc.w $2244
		dc.w $8920
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0401
		dc.w $e007
		dc.w $8020
		dc.w $0407
		dc.w $f81f
		dc.w $e020
		dc.w $040f
		dc.w $fc3f
		dc.w $f020
		dc.w $040e
		dc.w $1c38
		dc.w $f020
		dc.w $041c
		dc.w $ce7b
		dc.w $7820
		dc.w $041d
		dc.w $fe7b
		dc.w $7820
		dc.w $041d
		dc.w $fe78
		dc.w $f820
		dc.w $041c
		dc.w $ce7b
		dc.w $7820
		dc.w $040e
		dc.w $1c3b
		dc.w $7020
		dc.w $040f
		dc.w $fc3f
		dc.w $f020
		dc.w $0407
		dc.w $f81f
		dc.w $e020
		dc.w $0401
		dc.w $e007
		dc.w $8020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0491
		dc.w $2244
		dc.w $8920
		dc.w $0460
		dc.w $c183
		dc.w $0020
		dc.w $0463
		dc.w $3183
		dc.w $0020
		dc.w $0463
		dc.w $3003
		dc.w $0620
		dc.w $0460
		dc.w $c003
		dc.w $0620
		dc.w $0598
		dc.w $c180
		dc.w $0620
		dc.w $0598
		dc.w $c180
		dc.w $0620
		dc.w $0491
		dc.w $2244
		dc.w $8920
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0401
		dc.w $e007
		dc.w $8020
		dc.w $0407
		dc.w $f81f
		dc.w $e020
		dc.w $040f
		dc.w $fc3f
		dc.w $f020
		dc.w $040f
		dc.w $fc3f
		dc.w $f020
		dc.w $041f
		dc.w $fe7f
		dc.w $f820
		dc.w $041f
		dc.w $fe7f
		dc.w $f820
		dc.w $041f
		dc.w $fe7f
		dc.w $f820
		dc.w $041f
		dc.w $fe7f
		dc.w $f820
		dc.w $040f
		dc.w $fc3f
		dc.w $f020
		dc.w $040f
		dc.w $fc3f
		dc.w $f020
		dc.w $0407
		dc.w $f81f
		dc.w $e020
		dc.w $0401
		dc.w $e007
		dc.w $8020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0491
		dc.w $2244
		dc.w $8920
		dc.w $0460
		dc.w $c183
		dc.w $0020
		dc.w $0463
		dc.w $3183
		dc.w $0020
		dc.w $0463
		dc.w $3003
		dc.w $0620
		dc.w $0460
		dc.w $c003
		dc.w $0620
		dc.w $0598
		dc.w $c180
		dc.w $0620
		dc.w $0598
		dc.w $c180
		dc.w $0620
		dc.w $0491
		dc.w $2244
		dc.w $8920
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0401
		dc.w $e007
		dc.w $8020
		dc.w $0406
		dc.w $1818
		dc.w $6020
		dc.w $0408
		dc.w $0420
		dc.w $1020
		dc.w $0408
		dc.w $0420
		dc.w $1020
		dc.w $0410
		dc.w $0240
		dc.w $0820
		dc.w $0410
		dc.w $0240
		dc.w $0820
		dc.w $0410
		dc.w $0240
		dc.w $0820
		dc.w $0410
		dc.w $0240
		dc.w $0820
		dc.w $0408
		dc.w $0420
		dc.w $1020
		dc.w $0408
		dc.w $0420
		dc.w $1020
		dc.w $0406
		dc.w $1818
		dc.w $6020
		dc.w $0401
		dc.w $e007
		dc.w $8020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0460
		dc.w $c183
		dc.w $0620
		dc.w $04f1
		dc.w $e3c7
		dc.w $99a0
		dc.w $04f3
		dc.w $33c7
		dc.w $99a0
		dc.w $04f3
		dc.w $3667
		dc.w $8f20
		dc.w $04f1
		dc.w $e667
		dc.w $8f20
		dc.w $0599
		dc.w $e3cc
		dc.w $cf20
		dc.w $0599
		dc.w $e3cc
		dc.w $cf20
		dc.w $0460
		dc.w $c183
		dc.w $0620
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w 0
		dc.w 0
		dc.w 0
DATAS_08:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON01:
		dc.l A_3Dbutton
		dc.w $2011
		dc.w $9178
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON02:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_003
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON03:
		dc.l A_3Dbutton
		dc.w $21f1
		dc.w $0178
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON04:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_12
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON05:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON06:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_004
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON07:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_23
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_01
		dc.w 0
		dc.w 0
A_3DBUTTON08:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_24
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_02
		dc.w 0
		dc.w 0
A_3DBUTTON09:
		dc.l A_3Dbutton
		dc.w $2011
		dc.w $9178
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON10:
		dc.l A_3Dbutton
		dc.w $2011
		dc.w $9178
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON11:
		dc.l A_3Dbutton
		dc.w $2011
		dc.w $9178
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON12:
		dc.l A_3Dbutton
		dc.w $2011
		dc.w $9178
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_BOXED01:
		dc.l A_boxed
		dc.w $9078
		dc.w $0512
		dc.l Auo_boxed
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_31
		dc.w 0
		dc.w 0
A_BOXED02:
		dc.l A_boxed
		dc.w $9038
		dc.w $2012
		dc.l Auo_boxed
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_BOXED03:
		dc.l A_boxed
		dc.w $9008
		dc.w $ff12
		dc.l Auo_boxed
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_24
		dc.w 0
		dc.w 0
A_BOXED04:
		dc.l A_boxed
		dc.w $9038
		dc.w $2012
		dc.l Auo_boxed
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_30
		dc.w 0
		dc.w 0
A_BOXED05:
		dc.l A_boxed
		dc.w $9038
		dc.w $1d12
		dc.l Auo_boxed
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_CHECKBOX01:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_02
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_29
		dc.w 0
		dc.w 0
A_CHECKBOX02:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_20
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_15
		dc.w 0
		dc.w 0
A_CHECKBOX03:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_14
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_13
		dc.w 0
		dc.w 0
A_CHECKBOX04:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_350
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_10
		dc.w 0
		dc.w 0
A_CHECKBOX05:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_118
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_14
		dc.w 0
		dc.w 0
A_CHECKBOX06:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_55
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_34
		dc.w 0
		dc.w 0
A_CHECKBOX07:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_03
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_12
		dc.w 0
		dc.w 0
A_CHECKBOX08:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_263
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_09
		dc.w 0
		dc.w 0
A_CHECKBOX09:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_009
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_11
		dc.w 0
		dc.w 0
A_CHECKBOX10:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_15
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_28
		dc.w 0
		dc.w 0
A_CHECKBOX11:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_345
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_25
		dc.w 0
		dc.w 0
A_CHECKBOX12:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_347
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_26
		dc.w 0
		dc.w 0
A_CHECKBOX13:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_018
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_27
		dc.w 0
		dc.w 0
A_CHECKBOX14:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_16
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_23
		dc.w 0
		dc.w 0
A_CHECKBOX15:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_26
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_03
		dc.w 0
		dc.w 0
A_CHECKBOX16:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_42
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_08
		dc.w 0
		dc.w 0
A_CHECKBOX17:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_47
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_04
		dc.w 0
		dc.w 0
A_CHECKBOX18:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_48
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_05
		dc.w 0
		dc.w 0
A_CHECKBOX19:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_49
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_06
		dc.w 0
		dc.w 0
A_CHECKBOX20:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_50
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_07
		dc.w 0
		dc.w 0
A_CHECKBOX21:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_51
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_17
		dc.w 0
		dc.w 0
A_CHECKBOX22:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_52
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_18
		dc.w 0
		dc.w 0
A_CHECKBOX23:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_53
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_19
		dc.w 0
		dc.w 0
A_CHECKBOX24:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_54
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_32
		dc.w 0
		dc.w 0
A_CHECKBOX25:
		dc.l A_checkbox
		dc.w 0
		dc.w $0001
		dc.l Auo_string
		dc.l TEXT_56
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_33
		dc.w 0
		dc.w 0
A_CYCLE01:
		dc.l A_cycle
		dc.w $0001
		dc.w $0290
		dc.l Auo_cycle
		dc.l TEXT_08
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_21
		dc.w 0
		dc.w 0
A_CYCLE02:
		dc.l A_cycle
		dc.w $0001
		dc.w $0290
		dc.l Auo_cycle
		dc.l TEXT_17
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_20
		dc.w 0
		dc.w 0
A_CYCLE03:
		dc.l A_cycle
		dc.w $0001
		dc.w $0290
		dc.l Auo_cycle
		dc.l TEXT_11
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_22
		dc.w 0
		dc.w 0
A_CYCLE04:
		dc.l A_cycle
		dc.w $0001
		dc.w $0290
		dc.l Auo_cycle
		dc.l TEXT_45
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_16
		dc.w 0
		dc.w 0
A_INNERFRAME01:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_04
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME02:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_09
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME03:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_07
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME04:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_13
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME05:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_05
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME06:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_06
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME07:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_25
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME08:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_40
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME09:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_41
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME10:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_43
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME11:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_46
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME12:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_01
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_C4_IC_BEHAVE:
		dc.w $0004
		dc.l $000894c0
		dc.l DATAS_08
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_MSK_IC_BEHAVE:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w 0
		dc.w 0
		dc.w 0
_DAT_IC_BEHAVE:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0401
		dc.w $e007
		dc.w $8020
		dc.w $0406
		dc.w $1818
		dc.w $6020
		dc.w $0408
		dc.w $0420
		dc.w $1020
		dc.w $0409
		dc.w $e427
		dc.w $1020
		dc.w $0413
		dc.w $3244
		dc.w $8820
		dc.w $0412
		dc.w $0244
		dc.w $8820
		dc.w $0412
		dc.w $0247
		dc.w $0820
		dc.w $0413
		dc.w $3244
		dc.w $8820
		dc.w $0409
		dc.w $e424
		dc.w $9020
		dc.w $0408
		dc.w $0420
		dc.w $1020
		dc.w $0406
		dc.w $1818
		dc.w $6020
		dc.w $0401
		dc.w $e007
		dc.w $8020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $0460
		dc.w $c183
		dc.w $0620
		dc.w $0491
		dc.w $2244
		dc.w $9fa0
		dc.w $0493
		dc.w $f244
		dc.w $9fa0
		dc.w $0493
		dc.w $f7e4
		dc.w $8920
		dc.w $0491
		dc.w $27e4
		dc.w $8920
		dc.w $05f9
		dc.w $224f
		dc.w $c920
		dc.w $05f9
		dc.w $224f
		dc.w $c920
		dc.w $0460
		dc.w $c183
		dc.w $0620
		dc.w $0400
		dc.w 0
		dc.w $0020
		dc.w $07ff
		dc.w $ffff
		dc.w $ffe0
		dc.w 0
		dc.w 0
		dc.w 0
IC_BEHAVE:
		dc.l _MSK_IC_BEHAVE
		dc.l _DAT_IC_BEHAVE
		dc.l TEXT_331
		dc.w $1000
		dc.w 0
		dc.w 0
		dc.w $000c
		dc.w 0
		dc.w $0030
		dc.w $001d
		dc.w 0
		dc.w $0020
		dc.w $0048
		dc.w $0008
		dc.l _C4_IC_BEHAVE
EDIT_BEHAVE:
		dc.w $ffff
		dc.w $0001
		dc.w $0024
		dc.w $0018
		dc.w 0
		dc.w $0010
		dc.l A_3DBUTTON03
		dc.w 0
		dc.w 0
		dc.w $0044
		dc.w $0011
_01_EDIT_BEHAVE:
		dc.w $0009
		dc.w $0002
		dc.w $0007
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_INNERFRAME06
		dc.w $0001
		dc.w 0
		dc.w $0021
		dc.w $0005
_02_EDIT_BEHAVE:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_18
		dc.w $0001
		dc.w $0001
		dc.w $0009
		dc.w $0001
_03_EDIT_BEHAVE:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX01
		dc.w $0001
		dc.w $0003
		dc.w $000b
		dc.w $0001
_03aEDIT_BEHAVE:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8855
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_05_EDIT_BEHAVE:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0030
		dc.l A_CYCLE01
		dc.w $000d
		dc.w $0003
		dc.w $0012
		dc.w $0001
_05aEDIT_BEHAVE:
		dc.l Aus_cycle
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_07_EDIT_BEHAVE:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w 0
		dc.w $0038
		dc.l A_CYCLE02
		dc.w $000d
		dc.w $0001
		dc.w $0012
		dc.w $0001
_07aEDIT_BEHAVE:
		dc.l Aus_cycle
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_09_EDIT_BEHAVE:
		dc.w $0010
		dc.w $000a
		dc.w $000e
		dc.w $0018
		dc.w $0040
		dc.w 0
		dc.l A_INNERFRAME02
		dc.w $0022
		dc.w 0
		dc.w $0021
		dc.w $0005
_10_EDIT_BEHAVE:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX12
		dc.w $0001
		dc.w $0001
		dc.w $000d
		dc.w $0001
_10aEDIT_BEHAVE:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8852
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_12_EDIT_BEHAVE:
		dc.w $000e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX13
		dc.w $0001
		dc.w $0002
		dc.w $001b
		dc.w $0001
_12aEDIT_BEHAVE:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $884c
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_14_EDIT_BEHAVE:
		dc.w $0009
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX10
		dc.w $0001
		dc.w $0003
		dc.w $0019
		dc.w $0001
_14aEDIT_BEHAVE:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8849
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_16_EDIT_BEHAVE:
		dc.w $001c
		dc.w $0011
		dc.w $001a
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_INNERFRAME12
		dc.w $0001
		dc.w $0005
		dc.w $0042
		dc.w $0005
_17_EDIT_BEHAVE:
		dc.w $0013
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w 0
		dc.l TEXT_110
		dc.w $0001
		dc.w $0001
		dc.w $0007
		dc.w $0001
_17aEDIT_BEHAVE:
		dc.l edbh_list
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_19_EDIT_BEHAVE:
		dc.w $0015
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w 0
		dc.l TEXT_112
		dc.w $0001
		dc.w $0003
		dc.w $0005
		dc.w $0001
_19aEDIT_BEHAVE:
		dc.l edbh_list
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_21_EDIT_BEHAVE:
		dc.w $0016
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0009
		dc.l A_CHECKBOX25
		dc.w $001f
		dc.w $0002
		dc.w $0019
		dc.w $0001
_22_EDIT_BEHAVE:
		dc.w $0017
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0009
		dc.l A_CHECKBOX06
		dc.w $001f
		dc.w $0001
		dc.w $0020
		dc.w $0001
_23_EDIT_BEHAVE:
		dc.w $0018
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0008
		dc.l A_CHECKBOX02
		dc.w $001f
		dc.w $0003
		dc.w $0020
		dc.w $0001
_24_EDIT_BEHAVE:
		dc.w $001a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0030
		dc.l A_CYCLE03
		dc.w $000a
		dc.w $0001
		dc.w $0012
		dc.w $0001
_24aEDIT_BEHAVE:
		dc.l Aus_cycle
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_26_EDIT_BEHAVE:
		dc.w $0010
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0005
		dc.w $0008
		dc.l A_3DBUTTON04
		dc.w $000a
		dc.w $0003
		dc.w $0012
		dc.w $0001
_26aEDIT_BEHAVE:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8849
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_28_EDIT_BEHAVE:
		dc.w $0022
		dc.w $001d
		dc.w $0021
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_INNERFRAME05
		dc.w $0001
		dc.w $000a
		dc.w $0042
		dc.w $0004
_29_EDIT_BEHAVE:
		dc.w $001f
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX11
		dc.w $0001
		dc.w $0001
		dc.w $000c
		dc.w $0001
_29aEDIT_BEHAVE:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8842
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_31_EDIT_BEHAVE:
		dc.w $0021
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX14
		dc.w $0001
		dc.w $0002
		dc.w $0011
		dc.w $0001
_31aEDIT_BEHAVE:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8843
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_33_EDIT_BEHAVE:
		dc.w $001c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED03
		dc.w $0013
		dc.w $0002
		dc.w $002d
		dc.w $0001
_34_EDIT_BEHAVE:
		dc.w $0024
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON02
		dc.w $0015
		dc.w $000e
		dc.w $000c
		dc.w $0002
_34aEDIT_BEHAVE:
		dc.l edbh_ok
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $884f
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_36_EDIT_BEHAVE:
		dc.w 0
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON06
		dc.w $0023
		dc.w $000e
		dc.w $000c
		dc.w $0002
_36aEDIT_BEHAVE:
		dc.l edbh_abort
		dc.w 0
		dc.w 0
		dc.w $8020
		dc.w $8841
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
EDIT_MAINMOD:
		dc.w $ffff
		dc.w $0001
		dc.w $0060
		dc.w $0018
		dc.w 0
		dc.w $0010
		dc.l A_3DBUTTON05
		dc.w 0
		dc.w 0
		dc.w $0047
		dc.w $001e
_01_EDIT_MAINMOD:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0001
		dc.l A_CHECKBOX15
		dc.w $0001
		dc.w 0
		dc.w $0018
		dc.w $0002
_01aEDIT_MAINMOD:
		dc.l edmm_ismain
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8848
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_03_EDIT_MAINMOD:
		dc.w $000c
		dc.w $0004
		dc.w $000a
		dc.w $0018
		dc.w $0040
		dc.w 0
		dc.l A_INNERFRAME11
		dc.w $0030
		dc.w $0001
		dc.w $0017
		dc.w $0006
_04_EDIT_MAINMOD:
		dc.w $0006
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0041
		dc.w $0001
		dc.l A_CHECKBOX17
		dc.w $0001
		dc.w $0001
		dc.w $0007
		dc.w $0001
_04aEDIT_MAINMOD:
		dc.l edmm_init_olga
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $884f
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_06_EDIT_MAINMOD:
		dc.w $0008
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX19
		dc.w $0001
		dc.w $0003
		dc.w $000c
		dc.w $0001
_06aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8853
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_08_EDIT_MAINMOD:
		dc.w $000a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX20
		dc.w $0001
		dc.w $0004
		dc.w $000c
		dc.w $0001
_08aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8842
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_10_EDIT_MAINMOD:
		dc.w $0003
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w 0
		dc.l A_CHECKBOX18
		dc.w $0004
		dc.w $0002
		dc.w $0009
		dc.w $0001
_10aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8857
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_12_EDIT_MAINMOD:
		dc.w $0019
		dc.w $000d
		dc.w $0017
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_INNERFRAME04
		dc.w 0
		dc.w $0002
		dc.w $0030
		dc.w $0005
_13_EDIT_MAINMOD:
		dc.w $000e
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_22
		dc.w $0001
		dc.w $0001
		dc.w $000c
		dc.w $0001
_14_EDIT_MAINMOD:
		dc.w $0015
		dc.w $000f
		dc.w $000f
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_3DBUTTON01
		dc.w $000e
		dc.w $0001
		dc.w $0020
		dc.w $0003
_15_EDIT_MAINMOD:
		dc.w $000e
		dc.w $0010
		dc.w $0013
		dc.w $0014
		dc.w 0
		dc.w 0
		dc.w $00ff
		dc.w $0101
		dc.w 0
		dc.w 0
		dc.w $0020
		dc.w $0003
_16_EDIT_MAINMOD:
		dc.w $0011
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED05
		dc.w 0
		dc.w 0
		dc.w $001e
		dc.w $0001
_17_EDIT_MAINMOD:
		dc.w $0013
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $1008
		dc.w 0
		dc.l A_BOXED02
		dc.w 0
		dc.w $0001
		dc.w $0020
		dc.w $0001
_17aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.l edbh_wi
		dc.w $8000
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_19_EDIT_MAINMOD:
		dc.w $000f
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $1008
		dc.w 0
		dc.l A_BOXED02
		dc.w 0
		dc.w $0002
		dc.w $0020
		dc.w $0001
_19aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.l edbh_wi
		dc.w $8000
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_21_EDIT_MAINMOD:
		dc.w $0017
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w 0
		dc.l TEXT_21
		dc.w $0001
		dc.w $0002
		dc.w $000c
		dc.w $0001
_21aEDIT_MAINMOD:
		dc.l edbh_list
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_23_EDIT_MAINMOD:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w 0
		dc.l TEXT_111
		dc.w $0002
		dc.w $0003
		dc.w $000b
		dc.w $0001
_23aEDIT_MAINMOD:
		dc.l edbh_list
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_25_EDIT_MAINMOD:
		dc.w $0023
		dc.w $001a
		dc.w $0021
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_INNERFRAME07
		dc.w 0
		dc.w $0007
		dc.w $0030
		dc.w $0006
_26_EDIT_MAINMOD:
		dc.w $001b
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_27
		dc.w $0001
		dc.w $0001
		dc.w $0008
		dc.w $0001
_27_EDIT_MAINMOD:
		dc.w $001f
		dc.w $001c
		dc.w $001c
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_3DBUTTON09
		dc.w $000e
		dc.w $0001
		dc.w $0020
		dc.w $0002
_28_EDIT_MAINMOD:
		dc.w $001b
		dc.w $001d
		dc.w $001e
		dc.w $0014
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $1101
		dc.w 0
		dc.w 0
		dc.w $0020
		dc.w $0002
_29_EDIT_MAINMOD:
		dc.w $001e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED04
		dc.w 0
		dc.w 0
		dc.w $0020
		dc.w $0001
_30_EDIT_MAINMOD:
		dc.w $001c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED04
		dc.w 0
		dc.w $0001
		dc.w $0020
		dc.w $0001
_31_EDIT_MAINMOD:
		dc.w $0020
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_28
		dc.w $0001
		dc.w $0002
		dc.w $0007
		dc.w $0001
_32_EDIT_MAINMOD:
		dc.w $0021
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_44
		dc.w $0001
		dc.w $0004
		dc.w $0008
		dc.w $0001
_33_EDIT_MAINMOD:
		dc.w $0019
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0030
		dc.l A_CYCLE04
		dc.w $000e
		dc.w $0004
		dc.w $0020
		dc.w $0001
_33aEDIT_MAINMOD:
		dc.l Aus_cycle
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_35_EDIT_MAINMOD:
		dc.w $003a
		dc.w $0024
		dc.w $0038
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_INNERFRAME01
		dc.w $0030
		dc.w $0007
		dc.w $0017
		dc.w $000d
_36_EDIT_MAINMOD:
		dc.w $0026
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX05
		dc.w $0001
		dc.w $0001
		dc.w $0011
		dc.w $0001
_36aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8850
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_38_EDIT_MAINMOD:
		dc.w $0028
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX03
		dc.w $0001
		dc.w $0003
		dc.w $0011
		dc.w $0001
_38aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8856
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_40_EDIT_MAINMOD:
		dc.w $002a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX04
		dc.w $0001
		dc.w $0004
		dc.w $0013
		dc.w $0001
_40aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8846
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_42_EDIT_MAINMOD:
		dc.w $002c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX08
		dc.w $0001
		dc.w $0005
		dc.w $0013
		dc.w $0001
_42aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $885a
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_44_EDIT_MAINMOD:
		dc.w $002e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX09
		dc.w $0001
		dc.w $0006
		dc.w $0012
		dc.w $0001
_44aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $884c
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_46_EDIT_MAINMOD:
		dc.w $0030
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX07
		dc.w $0001
		dc.w $0007
		dc.w $0015
		dc.w $0001
_46aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8854
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_48_EDIT_MAINMOD:
		dc.w $0032
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX16
		dc.w $0001
		dc.w $0008
		dc.w $0011
		dc.w $0001
_48aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8844
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_50_EDIT_MAINMOD:
		dc.w $0034
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX21
		dc.w $0001
		dc.w $0002
		dc.w $0015
		dc.w $0001
_50aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8849
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_52_EDIT_MAINMOD:
		dc.w $0036
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX22
		dc.w $0001
		dc.w $0009
		dc.w $000f
		dc.w $0001
_52aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8845
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_54_EDIT_MAINMOD:
		dc.w $0038
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX23
		dc.w $0001
		dc.w $000a
		dc.w $0014
		dc.w $0001
_54aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8843
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_56_EDIT_MAINMOD:
		dc.w $0023
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0001
		dc.w $0001
		dc.l A_CHECKBOX24
		dc.w $0001
		dc.w $000b
		dc.w $0013
		dc.w $0001
_56aEDIT_MAINMOD:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $884d
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_58_EDIT_MAINMOD:
		dc.w $0047
		dc.w $003b
		dc.w $0046
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_INNERFRAME10
		dc.w 0
		dc.w $000d
		dc.w $0030
		dc.w $0007
_59_EDIT_MAINMOD:
		dc.w $003c
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_30
		dc.w $0001
		dc.w $0001
		dc.w $000a
		dc.w $0001
_60_EDIT_MAINMOD:
		dc.w $0043
		dc.w $003d
		dc.w $003d
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_3DBUTTON12
		dc.w $000e
		dc.w $0001
		dc.w $0020
		dc.w $0005
_61_EDIT_MAINMOD:
		dc.w $003c
		dc.w $003e
		dc.w $0042
		dc.w $0014
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $1101
		dc.w 0
		dc.w 0
		dc.w $0020
		dc.w $0005
_62_EDIT_MAINMOD:
		dc.w $003f
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED04
		dc.w 0
		dc.w 0
		dc.w $0020
		dc.w $0001
_63_EDIT_MAINMOD:
		dc.w $0040
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED04
		dc.w 0
		dc.w $0001
		dc.w $0020
		dc.w $0001
_64_EDIT_MAINMOD:
		dc.w $0041
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED04
		dc.w 0
		dc.w $0002
		dc.w $0020
		dc.w $0001
_65_EDIT_MAINMOD:
		dc.w $0042
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED04
		dc.w 0
		dc.w $0003
		dc.w $0020
		dc.w $0001
_66_EDIT_MAINMOD:
		dc.w $003d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED04
		dc.w 0
		dc.w $0004
		dc.w $0020
		dc.w $0001
_67_EDIT_MAINMOD:
		dc.w $0044
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_31
		dc.w $0001
		dc.w $0002
		dc.w $0008
		dc.w $0001
_68_EDIT_MAINMOD:
		dc.w $0045
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_32
		dc.w $0001
		dc.w $0003
		dc.w $000a
		dc.w $0001
_69_EDIT_MAINMOD:
		dc.w $0046
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_34
		dc.w $0001
		dc.w $0004
		dc.w $0008
		dc.w $0001
_70_EDIT_MAINMOD:
		dc.w $003a
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_29
		dc.w $0001
		dc.w $0005
		dc.w $0007
		dc.w $0001
_71_EDIT_MAINMOD:
		dc.w $0054
		dc.w $0048
		dc.w $0053
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_INNERFRAME08
		dc.w 0
		dc.w $0014
		dc.w $0030
		dc.w $0007
_72_EDIT_MAINMOD:
		dc.w $0049
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_33
		dc.w $0001
		dc.w $0001
		dc.w $0009
		dc.w $0001
_73_EDIT_MAINMOD:
		dc.w $0050
		dc.w $004a
		dc.w $004a
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_3DBUTTON10
		dc.w $000e
		dc.w $0001
		dc.w $0020
		dc.w $0005
_74_EDIT_MAINMOD:
		dc.w $0049
		dc.w $004b
		dc.w $004f
		dc.w $0014
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $1101
		dc.w 0
		dc.w 0
		dc.w $0020
		dc.w $0005
_75_EDIT_MAINMOD:
		dc.w $004c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED04
		dc.w 0
		dc.w 0
		dc.w $0020
		dc.w $0001
_76_EDIT_MAINMOD:
		dc.w $004d
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED04
		dc.w 0
		dc.w $0001
		dc.w $0020
		dc.w $0001
_77_EDIT_MAINMOD:
		dc.w $004e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED04
		dc.w 0
		dc.w $0002
		dc.w $0020
		dc.w $0001
_78_EDIT_MAINMOD:
		dc.w $004f
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED04
		dc.w 0
		dc.w $0003
		dc.w $0020
		dc.w $0001
_79_EDIT_MAINMOD:
		dc.w $004a
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED04
		dc.w 0
		dc.w $0004
		dc.w $0020
		dc.w $0001
_80_EDIT_MAINMOD:
		dc.w $0051
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_35
		dc.w $0001
		dc.w $0002
		dc.w $0006
		dc.w $0001
_81_EDIT_MAINMOD:
		dc.w $0052
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_38
		dc.w $0001
		dc.w $0003
		dc.w $0008
		dc.w $0001
_82_EDIT_MAINMOD:
		dc.w $0053
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_36
		dc.w $0001
		dc.w $0004
		dc.w $0009
		dc.w $0001
_83_EDIT_MAINMOD:
		dc.w $0047
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_37
		dc.w $0001
		dc.w $0005
		dc.w $0008
		dc.w $0001
_84_EDIT_MAINMOD:
		dc.w $0059
		dc.w $0055
		dc.w $0058
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_INNERFRAME03
		dc.w $0030
		dc.w $0014
		dc.w $0017
		dc.w $0003
_85_EDIT_MAINMOD:
		dc.w $0056
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_014
		dc.w $0001
		dc.w $0001
		dc.w $0003
		dc.w $0001
_86_EDIT_MAINMOD:
		dc.w $0057
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED01
		dc.w $0005
		dc.w $0001
		dc.w $0005
		dc.w $0001
_87_EDIT_MAINMOD:
		dc.w $0058
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_012
		dc.w $000c
		dc.w $0001
		dc.w $0003
		dc.w $0001
_88_EDIT_MAINMOD:
		dc.w $0054
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED01
		dc.w $0010
		dc.w $0001
		dc.w $0005
		dc.w $0001
_89_EDIT_MAINMOD:
		dc.w $005b
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w 0
		dc.l A_3DBUTTON08
		dc.w $003b
		dc.w $0019
		dc.w $000b
		dc.w $0002
_89aEDIT_MAINMOD:
		dc.l edmm_cancel
		dc.w 0
		dc.w 0
		dc.w $8000
		dc.w $8841
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_91_EDIT_MAINMOD:
		dc.w $0060
		dc.w $005c
		dc.w $005d
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_INNERFRAME09
		dc.w 0
		dc.w $001b
		dc.w $0030
		dc.w $0003
_92_EDIT_MAINMOD:
		dc.w $005d
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w 0
		dc.w 0
		dc.l TEXT_39
		dc.w $0001
		dc.w $0001
		dc.w $000c
		dc.w $0001
_93_EDIT_MAINMOD:
		dc.w $005b
		dc.w $005e
		dc.w $005e
		dc.w $0018
		dc.w 0
		dc.w 0
		dc.l A_3DBUTTON11
		dc.w $000e
		dc.w $0001
		dc.w $0020
		dc.w $0001
_94_EDIT_MAINMOD:
		dc.w $005d
		dc.w $005f
		dc.w $005f
		dc.w $0014
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $1101
		dc.w 0
		dc.w 0
		dc.w $0020
		dc.w $0001
_95_EDIT_MAINMOD:
		dc.w $005e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w 0
		dc.l A_BOXED04
		dc.w 0
		dc.w 0
		dc.w $0020
		dc.w $0001
_96_EDIT_MAINMOD:
		dc.w 0
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w 0
		dc.l A_3DBUTTON07
		dc.w $003b
		dc.w $001b
		dc.w $000b
		dc.w $0002
_96aEDIT_MAINMOD:
		dc.l edmm_ok
		dc.w 0
		dc.w 0
		dc.w $8020
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
	.globl WI_BEHAVE
WI_BEHAVE:
		dc.w 0
		dc.w 0
		dc.l bh_service
		dc.l bh_make
		dc.l Awi_open
		dc.l Awi_init
		dc.l EDIT_BEHAVE
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $ffff
		dc.w $601f
		dc.w 0
		dc.w 0
		dc.w $0063
		dc.w $0063
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w 0
		dc.w 0
		dc.w $fcf8
		dc.l TEXT_10
		dc.l TEXT_002
		dc.w $2710
		dc.w $0100
		dc.w 0
		dc.w $ffff
		dc.l IC_BEHAVE
		dc.w 0
		dc.w 0
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
		dc.l Awi_gemscript
		dc.l STGUIDE_02
		dc.w 0
		dc.w 0
	.globl WI_MAINMOD
WI_MAINMOD:
		dc.w 0
		dc.w 0
		dc.l edmm_service
		dc.l edmm_create
		dc.l Awi_open
		dc.l Awi_init
		dc.l EDIT_MAINMOD
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $ffff
		dc.w $6fef
		dc.w 0
		dc.w 0
		dc.w $0078
		dc.w $0032
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w 0
		dc.w 0
		dc.w $f8f8
		dc.l TEXT_19
		dc.l TEXT_002
		dc.w 0
		dc.w $0100
		dc.w 0
		dc.w $ffff
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
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
		dc.l Awi_gemscript
		dc.l STGUIDE_01
		dc.l HELPFILE_01
	.globl mlmess
mlmess:
		dc.l _A_GENERAL
		dc.l _A_GENERAL_STR
		dc.l _A_COLREZ
		dc.l _A_CREATE_IO
		dc.l _A_CREATE_STR
		dc.l _A_DEFECTIVE_MEM
		dc.l _A_ERR_ACC
		dc.l _A_ERR_MESS
		dc.l _A_ERR_WINDOW
		dc.l _A_ERR_WISLOT
		dc.l _A_GEN_IO
		dc.l _A_GEN_MEM
		dc.l _A_GEN_MOD
		dc.l _A_GEN_MOD_STR
		dc.l _A_LOAD_MOD
		dc.l _A_LOAD_MOD_STR
		dc.l _A_MEM_MOD
		dc.l _A_MEM_MOD_STR
		dc.l _A_ODD_MEM
		dc.l _A_OPEN_IO
		dc.l _A_OPEN_STR
		dc.l _A_OUT_OF_MEM
		dc.l _A_PORT
		dc.l _A_RANGE_MEM
		dc.l _A_READ_IO
		dc.l _A_READ_STR
		dc.l _A_VER_MOD
		dc.l _A_VER_MOD_STR
		dc.l _A_WRITE_IO
		dc.l _A_WRITE_STR
		dc.l _AL_ATT
		dc.l _AL_QUEST
		dc.l _AL_STOP
		dc.l _AL_TIMER



x8af8a:
		dc.b 0
x8af8b:
		dc.b 0
x8af8c:
		dc.b 0
x8af8d:
		dc.b 0
x8af8e:
		dc.b 0
x8af8f:
		dc.b 0
x8af90:
		dc.b 0
x8af91:
		dc.b 0
x8af92:
		dc.b 0
x8af93:
		dc.b 0
x8af94:
		dc.b 0
x8af95:
		dc.b 0
x8af96:
		dc.b 0
x8af97:
		dc.b 0
x8af98:
		dc.b 0
x8af99: dc.b '%d',0
x8af9c: dc.b '%d',0
x8af9f: dc.b '  ',0
x8afa2: dc.b '%3d',0
x8afa6: dc.b '%3d',0



