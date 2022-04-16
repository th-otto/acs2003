acs_closewi:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a3
		move.w     d0,d3
		movea.l    324(a3),a2
		move.l     a2,d1
		beq.s      acs_closewi_1
		suba.l     a1,a1
		movea.l    4(a2),a4
		movea.l    a2,a0
		moveq.l    #2,d0
		jsr        (a4)
acs_closewi_1:
		tst.w      d3
		beq.s      acs_closewi_2
		movea.l    328(a3),a2
		move.l     a2,d0
		beq.s      acs_closewi_2
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    a2,a0
		movea.l    4(a2),a4
		jsr        (a4)
acs_closewi_2:
		movea.l    16(a3),a3
		bra.s      acs_closewi_3
acs_closewi_5:
		movea.l    18(a3),a2
		move.l     a2,d0
		beq.s      acs_closewi_4
		suba.l     a1,a1
		movea.l    a2,a0
		movea.l    4(a2),a4
		moveq.l    #2,d0
		jsr        (a4)
		jsr        Aev_mess
		jsr        Aev_mess
acs_closewi_4:
		movea.l    (a3),a3
acs_closewi_3:
		move.l     a3,d0
		bne.s      acs_closewi_5
		jsr        Aev_mess
		movem.l    (a7)+,d3/a2-a4
		rts

assert_error:
		tst.w      d0
		beq.s      assert_error_1
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
assert_error_1:
		moveq.l    #1,d0
		lea.l      err_jmp,a0
		jsr        longjmp
		rts

set_handle:
		lea.l      err_jmp,a0
		moveq.l    #0,d1
		move.l     d1,50(a0)
		move.l     d1,54(a0)
		move.w     d0,48(a0)
		rts

save_buf:
		movem.l    d3-d4/a2-a3,-(a7)
		movea.l    a0,a3
		move.l     d0,d3
		lea.l      bpos,a2
		move.l     (a2),d0
		add.l      d3,d0
		cmp.l      #0x00020000,d0
		blt.s      save_buf_1
		lea.l      2056(a2),a0
		move.l     (a2),d1
		move.w     -2(a2),d0
		jsr        Fwrite
		move.l     d0,d4
		cmp.l      (a2),d0
		bge.s      save_buf_2
		suba.l     a0,a0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		moveq.l    #10,d0
		jsr        (a1)
		moveq.l    #1,d0
		lea.l      -50(a2),a0
		jsr        longjmp
save_buf_2:
		clr.l      (a2)
save_buf_1:
		cmp.l      #0x00020000,d3
		ble.s      save_buf_3
		movea.l    a3,a0
		move.l     d3,d1
		move.w     -2(a2),d0
		jsr        Fwrite
		move.l     d0,d4
		cmp.l      d0,d3
		ble.s      save_buf_4
		suba.l     a0,a0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		moveq.l    #10,d0
		jsr        (a1)
		moveq.l    #1,d0
		lea.l      -50(a2),a0
		jsr        longjmp
		bra.s      save_buf_4
save_buf_3:
		move.l     d3,d0
		movea.l    a3,a1
		move.l     (a2),d1
		lea.l      2056(a2),a0
		adda.l     d1,a0
		jsr        memcpy
		add.l      d3,(a2)
save_buf_4:
		movem.l    (a7)+,d3-d4/a2-a3
		rts

save_string:
		move.l     a2,-(a7)
		movea.l    a0,a2
		jsr        strlen
		movea.l    a2,a0
		bsr        save_buf
		movea.l    (a7)+,a2
		rts

close_buf:
		move.l     a2,-(a7)
		lea.l      bpos,a2
		move.l     (a2),d0
		ble.s      close_buf_1
		lea.l      2056(a2),a0
		move.l     d0,d1
		move.w     -2(a2),d0
		jsr        Fwrite
		cmp.l      (a2),d0
		bge.s      close_buf_1
		suba.l     a0,a0
		moveq.l    #10,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		moveq.l    #1,d0
		lea.l      -50(a2),a0
		jsr        longjmp
close_buf_1:
		movea.l    (a7)+,a2
		rts

read_buf:
		movem.l    d3-d4/a2-a3,-(a7)
		movea.l    a0,a3
		move.l     d0,d3
		lea.l      bfill,a2
		move.l     -4(a2),d0
		add.l      d3,d0
		cmp.l      (a2),d0
		ble        read_buf_1
		move.l     (a2),d4
		sub.l      -4(a2),d4
		tst.l      d4
		ble.s      read_buf_2
		move.l     -4(a2),d1
		lea.l      2052(a2),a1
		adda.l     d1,a1
		movea.l    a3,a0
		move.l     d4,d0
		jsr        memcpy
read_buf_2:
		clr.l      -4(a2)
		sub.l      d4,d3
		adda.l     d4,a3
		cmp.l      #0x00020000,d3
		blt.s      read_buf_3
		movea.l    a3,a0
		move.l     d3,d1
		move.w     -6(a2),d0
		jsr        Fread
		move.l     d0,(a2)
		cmp.l      d0,d3
		beq.s      read_buf_4
		suba.l     a0,a0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		moveq.l    #11,d0
		jsr        (a1)
		moveq.l    #1,d0
		lea.l      -54(a2),a0
		jsr        longjmp
		bra.s      read_buf_4
read_buf_3:
		lea.l      2052(a2),a0
		move.l     #0x00020000,d1
		move.w     -6(a2),d0
		jsr        Fread
		move.l     d0,(a2)
		cmp.l      d0,d3
		ble.s      read_buf_1
		suba.l     a0,a0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		moveq.l    #11,d0
		jsr        (a1)
		moveq.l    #1,d0
		lea.l      -54(a2),a0
		jsr        longjmp
read_buf_1:
		move.l     d3,d0
		move.l     -4(a2),d1
		lea.l      2052(a2),a1
		adda.l     d1,a1
		movea.l    a3,a0
		jsr        memcpy
		add.l      d3,-4(a2)
read_buf_4:
		movem.l    (a7)+,d3-d4/a2-a3
		rts

save_acs:
		move.l     a2,-(a7)
		movea.l    a0,a2
		clr.l      bpos
		bsr        set_handle
		jsr        setjmp
		tst.w      d0
		beq.s      save_acs_1
		movea.l    a2,a0
		jsr        unfix_all
		bra.s      save_acs_2
save_acs_1:
		movea.l    a2,a0
		jsr        fix_all
		tst.w      d0
		bne.s      save_acs_3
save_acs_2:
		move.w     handle,d0
		jsr        Fclose
		moveq.l    #-1,d0
		bra.s      save_acs_4
save_acs_3:
		movea.l    a2,a0
		jsr        wr_all
		bsr        close_buf
		andi.w     #0xFFFE,6(a2)
		movea.l    a2,a0
		jsr        unfix_all
		move.w     handle,d0
		jsr        Fclose
		movea.l    8(a2),a0
		jsr        Aev_OlgaUpdate
		movea.l    8(a2),a0
		jsr        Aev_DhstSaved
		clr.w      d0
save_acs_4:
		movea.l    (a7)+,a2
		rts

init_acs:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a2
		lea.l      ml_title,a4
		move.l     8(a2),32(a4)
		move.l     #0x00000262,d0
		lea.l      24(a4),a1
		movea.l    a2,a0
		jsr        memcpy
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.l     a0,20(a2)
		lea.l      xa534e,a3
		pea.l      (a3)
		pea.l      wi_obj
		movea.l    20(a2),a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.l     a0,28(a2)
		pea.l      (a3)
		pea.l      me_obj
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.l     a0,32(a2)
		pea.l      (a3)
		pea.l      pu_obj
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.l     a0,24(a2)
		pea.l      (a3)
		pea.l      ob_obj
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.l     a0,36(a2)
		pea.l      (a3)
		pea.l      al_obj
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.l     a0,40(a2)
		pea.l      (a3)
		pea.l      te_obj
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.l     a0,44(a2)
		pea.l      (a3)
		pea.l      ic_obj
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.l     a0,48(a2)
		pea.l      (a3)
		pea.l      im_obj
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.l     a0,52(a2)
		pea.l      (a3)
		pea.l      st_obj
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.l     a0,56(a2)
		pea.l      (a3)
		pea.l      us_obj
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.l     a0,60(a2)
		pea.l      (a3)
		pea.l      rf_obj
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.l     a0,64(a2)
		pea.l      (a3)
		pea.l      mf_obj
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.l     a0,68(a2)
		pea.l      (a3)
		pea.l      if_obj
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		clr.w      d3
		bra.s      init_acs_1
init_acs_2:
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a2,d0.l),a1
		move.l     a0,502(a1)
		pea.l      (a3)
		move.w     d3,d1
		lsl.w      #2,d1
		move.l     0(a4,d1.w),-(a7)
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		move.l     #0x00000080,d0
		movea.l    a2,a0
		jsr        objmalloc
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a2,d0.l),a1
		move.l     a0,514(a1)
		pea.l      (a3)
		move.w     d3,d1
		lsl.w      #2,d1
		move.l     12(a4,d1.w),-(a7)
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		addq.w     #1,d3
init_acs_1:
		cmp.w      #0x0003,d3
		blt.s      init_acs_2
		moveq.l    #8,d0
		movea.l    ACSblk,a1
		addq.w     #8,a1
		lea.l      360(a2),a0
		jsr        memcpy
		andi.w     #0xFFFE,6(a2)
		movem.l    (a7)+,d3/a2-a4
		rts

init_ml_list:
		movem.l    d3-d5/a2-a5,-(a7)
		lea.l      -70(a7),a7
		movea.l    a0,a5
		movea.l    102(a7),a4
		lea.l      xa52ca,a0
		lea.l      4(a7),a2
		moveq.l    #15,d0
init_ml_list_1:
		move.l     (a0)+,(a2)+
		dbf        d0,init_ml_list_1
		move.w     (a0)+,(a2)+
		move.l     4(a1),(a7)
		move.l     14(a1),d3
		lsr.l      #2,d3
		clr.w      d4
		bra.s      init_ml_list_2
init_ml_list_3:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		movea.l    0(a0,d0.l),a1
		clr.b      51(a1)
		addq.w     #1,d4
init_ml_list_2:
		cmp.w      d4,d3
		bgt.s      init_ml_list_3
		clr.w      d5
		bra        init_ml_list_4
init_ml_list_11:
		move.w     d5,d0
		ext.l      d0
		lsl.l      #2,d0
		move.l     0(a4,d0.l),d1
		bne        init_ml_list_5
		ori.w      #0x0001,6(a5)
		movea.l    a5,a0
		move.l     #0x00000080,d0
		jsr        objmalloc
		move.w     d5,d0
		ext.l      d0
		lsl.l      #2,d0
		move.l     a0,0(a4,d0.l)
		move.l     a0,d1
		bne.s      init_ml_list_6
		moveq.l    #3,d0
		suba.l     a0,a0
		bsr        assert_error
init_ml_list_6:
		clr.l      -(a7)
		move.w     d5,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    110(a7),a0
		move.l     0(a0,d0.l),-(a7)
		movea.l    0(a4,d0.l),a1
		movea.l    a5,a0
		jsr        objname
		addq.w     #8,a7
		clr.w      d4
		bra        init_ml_list_7
init_ml_list_10:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		movea.l    0(a0,d0.l),a3
		move.l     4(a3),8(a7)
		move.l     10(a3),14(a7)
		move.l     14(a3),18(a7)
		lea.l      4(a7),a1
		movea.l    a5,a0
		jsr        copy_str
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      init_ml_list_8
		moveq.l    #3,d0
		suba.l     a0,a0
		bsr        assert_error
init_ml_list_8:
		move.w     d5,-(a7)
		pea.l      22(a3)
		lea.l      xa534f,a1
		lea.l      22(a2),a0
		jsr        sprintf
		addq.w     #6,a7
		clr.l      -(a7)
		pea.l      22(a2)
		movea.l    a2,a1
		movea.l    a5,a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a2,a1
		move.w     d5,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a4,d0.l),a0
		jsr        add_entry
		addq.w     #1,d0
		bne.s      init_ml_list_9
		suba.l     a0,a0
		moveq.l    #3,d0
		bsr        assert_error
init_ml_list_9:
		addq.w     #1,d4
init_ml_list_7:
		cmp.w      d4,d3
		bgt        init_ml_list_10
init_ml_list_5:
		addq.w     #1,d5
init_ml_list_4:
		cmp.w      #0x0003,d5
		blt        init_ml_list_11
		lea.l      70(a7),a7
		movem.l    (a7)+,d3-d5/a2-a5
		rts

del_mess:
		movem.l    d3-d4/a2/a4-a5,-(a7)
		lea.l      -36(a7),a7
		movea.l    a0,a4
		clr.w      d3
		jsr        Amo_busy
		clr.w      d4
		lea.l      xa534e,a2
		bra.s      del_mess_1
del_mess_3:
		move.w     d4,-(a7)
		lea.l      11(a2),a1
		lea.l      2(a7),a0
		jsr        sprintf
		addq.w     #2,a7
		lea.l      (a7),a1
		movea.l    36(a4),a0
		jsr        find_entry
		movea.l    a0,a5
		move.l     a5,d0
		beq.s      del_mess_2
		move.w     56(a5),d1
		and.w      #0x0100,d1
		beq.s      del_mess_2
		andi.w     #0xFEFF,56(a5)
		movea.l    a5,a1
		movea.l    a4,a0
		jsr        del_alert
		moveq.l    #1,d3
del_mess_2:
		addq.w     #1,d4
del_mess_1:
		cmp.w      #0x001E,d4
		blt.s      del_mess_3
		bra.s      del_mess_4
del_mess_6:
		move.w     d4,-(a7)
		lea.l      11(a2),a1
		lea.l      2(a7),a0
		jsr        sprintf
		addq.w     #2,a7
		lea.l      (a7),a1
		movea.l    52(a4),a0
		jsr        find_entry
		movea.l    a0,a5
		move.l     a5,d0
		beq.s      del_mess_5
		move.w     56(a5),d1
		and.w      #0x0100,d1
		beq.s      del_mess_5
		andi.w     #0xFEFF,56(a5)
		movea.l    a5,a1
		movea.l    a4,a0
		jsr        del_string
		moveq.l    #1,d3
del_mess_5:
		addq.w     #1,d4
del_mess_4:
		cmp.w      #0x0022,d4
		blt.s      del_mess_6
		jsr        Amo_unbusy
		tst.w      d3
		beq.s      del_mess_7
		ori.w      #0x0001,6(a4)
del_mess_7:
		lea.l      36(a7),a7
		movem.l    (a7)+,d3-d4/a2/a4-a5
		rts

init_mess:
		movem.l    d3-d4/a2-a4/a6,-(a7)
		lea.l      -102(a7),a7
		movea.l    a0,a3
		lea.l      36(a7),a2
		lea.l      xa530c,a0
		movea.l    a2,a1
		moveq.l    #15,d0
init_mess_1:
		move.l     (a0)+,(a1)+
		dbf        d0,init_mess_1
		move.w     (a0)+,(a1)+
		clr.w      d3
		move.w     6(a3),d0
		and.w      #0x8000,d0
		bne        init_mess_2
		jsr        Amo_busy
		clr.w      d4
		lea.l      mlmess,a6
		bra        init_mess_3
init_mess_5:
		move.w     d4,-(a7)
		lea.l      xa5359,a1
		lea.l      2(a7),a0
		jsr        sprintf
		addq.w     #2,a7
		lea.l      (a7),a1
		movea.l    36(a3),a0
		jsr        find_entry
		move.l     a0,d0
		bne.s      init_mess_4
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		move.l     0(a6,d0.l),4(a2)
		movea.l    0(a6,d0.l),a0
		jsr        strlen
		addq.l     #1,d0
		move.l     d0,10(a2)
		move.l     d0,14(a2)
		movea.l    a2,a1
		movea.l    a3,a0
		jsr        copy_alert
		movea.l    a0,a4
		move.l     a4,d0
		beq        init_mess_2
		lea.l      (a7),a1
		lea.l      22(a4),a0
		jsr        strcpy
		clr.l      -(a7)
		pea.l      22(a4)
		movea.l    a4,a1
		movea.l    a3,a0
		jsr        objname
		addq.w     #8,a7
		ori.w      #0x0100,56(a4)
		movea.l    a4,a1
		movea.l    36(a3),a0
		jsr        add_entry
		addq.w     #1,d0
		beq        init_mess_2
		movea.l    a4,a1
		moveq.l    #1,d0
		movea.l    a3,a0
		jsr        serv_alert
		moveq.l    #1,d3
init_mess_4:
		addq.w     #1,d4
init_mess_3:
		cmp.w      #0x001E,d4
		blt        init_mess_5
		bra        init_mess_6
init_mess_8:
		move.w     d4,-(a7)
		lea.l      xa5359,a1
		lea.l      2(a7),a0
		jsr        sprintf
		addq.w     #2,a7
		lea.l      (a7),a1
		movea.l    52(a3),a0
		jsr        find_entry
		move.l     a0,d0
		bne.s      init_mess_7
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		move.l     0(a6,d0.l),4(a2)
		movea.l    0(a6,d0.l),a0
		jsr        strlen
		addq.l     #1,d0
		move.l     d0,10(a2)
		move.l     d0,14(a2)
		movea.l    a2,a1
		movea.l    a3,a0
		jsr        copy_str
		movea.l    a0,a4
		move.l     a4,d0
		beq.s      init_mess_2
		lea.l      (a7),a1
		lea.l      22(a4),a0
		jsr        strcpy
		clr.l      -(a7)
		pea.l      22(a4)
		movea.l    a4,a1
		movea.l    a3,a0
		jsr        objname
		addq.w     #8,a7
		ori.w      #0x0100,56(a4)
		movea.l    a4,a1
		movea.l    52(a3),a0
		jsr        add_entry
		addq.w     #1,d0
		beq.s      init_mess_2
		movea.l    a4,a1
		moveq.l    #1,d0
		movea.l    a3,a0
		jsr        serv_str
		moveq.l    #1,d3
init_mess_7:
		addq.w     #1,d4
init_mess_6:
		cmp.w      #0x0022,d4
		blt        init_mess_8
		jsr        Amo_unbusy
		tst.w      d3
		beq.s      init_mess_2
		ori.w      #0x0001,6(a3)
init_mess_2:
		lea.l      102(a7),a7
		movem.l    (a7)+,d3-d4/a2-a4/a6
		rts

read_acs:
		movem.l    d3-d4/a2-a3,-(a7)
		lea.l      -10(a7),a7
		move.l     d0,d3
		movea.l    a0,a2
		move.w     d3,d4
		lea.l      proto,a3
		move.l     8(a2),8(a3)
		move.l     #0x00000262,d0
		movea.l    a3,a1
		movea.l    a2,a0
		jsr        memcpy
		clr.l      8(a3)
		tst.l      d3
		bpl.s      read_acs_1
		movea.l    a2,a0
		bsr        init_acs
		bra        read_acs_2
read_acs_1:
		lea.l      xa5363,a1
		move.l     a1,-(a7)
		movea.l    8(a2),a1
		lea.l      4(a7),a0
		jsr        Af_2ext
		movea.l    (a7)+,a1
		jsr        Ast_icmp
		tst.w      d0
		bne.s      read_acs_3
		move.w     d4,d0
		bsr        set_handle
		jsr        setjmp
		tst.w      d0
		bne.s      read_acs_4
		movea.l    a2,a0
		jsr        read_rsc
		andi.w     #0xFFFE,6(a2)
		bra        read_acs_5
read_acs_3:
		move.w     d4,d0
		bsr        set_handle
		jsr        setjmp
		tst.w      d0
		beq.s      read_acs_6
		jsr        release_err
read_acs_4:
		move.w     d4,d0
		jsr        Fclose
		moveq.l    #-1,d0
		bra        read_acs_7
read_acs_6:
		movea.l    a2,a0
		jsr        rd_all
		movea.l    a2,a0
		jsr        unfix_all
		move.l     68(a2),d0
		bne.s      read_acs_8
		movea.l    a2,a0
		move.l     #0x00000080,d0
		jsr        objmalloc
		move.l     a0,68(a2)
		pea.l      xa534e
		pea.l      if_obj
		movea.l    a0,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
read_acs_8:
		pea.l      -24(a3)
		pea.l      502(a2)
		movea.l    52(a2),a1
		movea.l    a2,a0
		bsr        init_ml_list
		addq.w     #8,a7
		pea.l      -12(a3)
		pea.l      514(a2)
		movea.l    36(a2),a1
		movea.l    a2,a0
		bsr        init_ml_list
		addq.w     #8,a7
		movea.l    a2,a0
		bsr        init_mess
		cmpi.w     #0x0191,4(a2)
		bge.s      read_acs_9
		ori.w      #0x0001,6(a2)
		bra.s      read_acs_10
read_acs_9:
		andi.w     #0xFFFE,6(a2)
read_acs_10:
		move.w     #0x0191,4(a2)
read_acs_5:
		move.w     d4,d0
		jsr        Fclose
read_acs_2:
		clr.w      d0
read_acs_7:
		lea.l      10(a7),a7
		movem.l    (a7)+,d3-d4/a2-a3
		rts

	.data

	.globl pc_welcome
pc_welcome:
		dc.b '/*********************************************************************/',$0d,$0a
		dc.b '/*                                                                   */',$0d,$0a
		dc.b '/* This file was created with ACS3.00 at %.24s    */',$0d,$0a
		dc.b '/*                                                                   */',$0d,$0a
		dc.b '/* The contents are based on file:                                   */',$0d,$0a
		dc.b '/*    %-62s */',$0d,$0a
		dc.b '/*                                                                   */',$0d,$0a
		dc.b '/* (c) 1991-2003 by Stefan Bachert, Oliver Michalak, Martin Els„sser */',$0d,$0a
		dc.b '/*********************************************************************/',$0d,$0a,0
	.globl pp_welcome
pp_welcome:
		dc.b '(*********************************************************************)',$0d,$0a
		dc.b '(*                                                                   *)',$0d,$0a
		dc.b '(* This file was created with ACS3.00 at %.24s    *)',$0d,$0a
		dc.b '(*                                                                   *)',$0d,$0a
		dc.b '(* The contents are based on file:                                   *)',$0d,$0a
		dc.b '(*    %-62s *)',$0d,$0a
		dc.b '(*                                                                   *)',$0d,$0a
		dc.b '(* (c) 1991-2003 by Stefan Bachert, Oliver Michalak, Martin Els„sser *)',$0d,$0a
		dc.b '(*********************************************************************)',$0d,$0a,0
	.globl str_welcome
str_welcome:
		dc.b '; This file was created with ACS3.00 at %.24s',$0d,$0a
		dc.b '; from %s',$0d,$0a
		dc.b '; Do not edit this file, since changes will be lost when generating',$0d,$0a
		dc.b '; (c) 1991-2003 by Stefan Bachert, Oliver Michalak, Martin Els„sser',$0d,$0a,0
		dc.b $00
	.globl ml_title
ml_title:
		dc.l ml1_obj
		dc.l ml2_obj
		dc.l ml3_obj
	.globl mlal_title
mlal_title:
		dc.l al1_obj
		dc.l al2_obj
		dc.l al3_obj

proto:
		dc.b '.ACS'
		dc.w $0191
		dc.w $b800
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
		dc.b 'ACS3.00',0
		dc.w $012c
		dc.w $ff9d
		dc.w $ff9d
		dc.w $0051
		dc.b '  ACS ACCESSORY  ',0
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
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0003
		dc.w $0000
		dc.w $0000
		dc.w $0004
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0005
		dc.w $0000
		dc.w $0000
		dc.w $0006
		dc.w $0000
		dc.w $0000
		dc.w $0007
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
		dc.w $0020
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
		dc.w $000d
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xa52ca:
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
		dc.b '                               ',0
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xa530c:
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
xa534e:
		dc.b 0
xa534f:
		dc.b '%.28s'
		dc.w $0125
		dc.w $6401
		dc.b 0
xa5359:
		dc.b 'ACS(%02d)',0
xa5363:
		dc.b 'RSC',0
		dc.b $00
obsproto:
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
