out_string:
		movem.l    d3-d4/a2-a5,-(a7)
		movea.l    a0,a2
		move.l     14(a2),d3
		lsr.l      #2,d3
		tst.w      d3
		ble.w      out_string_1
		lea.l      22(a2),a0
		jsr        info_list
		movea.l    4(a2),a2
		clr.w      d4
		lea.l      xa76b0,a4
		lea.l      iostring,a5
		bra.s      out_string_2
		move.w     d4,d0
out_string_4:
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a3
		lea.l      23(a4),a1
		lea.l      22(a3),a0
		moveq.l    #4,d0
		jsr        strncmp
		tst.w      d0
		beq.s      out_string_3
		lea.l      22(a3),a0
		jsr        info_obj
		pea.l      22(a3)
		lea.l      28(a4),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a5,a0
		jsr        save_string
		movea.l    4(a3),a0
		jsr        save_string
		lea.l      33(a4),a0
		jsr        save_string
out_string_3:
		addq.w     #1,d4
out_string_2:
		cmp.w      d4,d3
		bgt.s      out_string_4
out_string_1:
		movem.l    (a7)+,d3-d4/a2-a5
		rts

	.globl str_output
str_output:
		movem.l    d3/a2-a5,-(a7)
		lea.l      -516(a7),a7
		movea.l    a0,a2
		moveq.l    #92,d0
		movea.l    8(a2),a0
		jsr        strrchr
		movea.l    a0,a3
		addq.w     #1,a3
		lea.l      256(a7),a4
		movea.l    8(a2),a1
		movea.l    a4,a0
		jsr        strcpy
		moveq.l    #46,d0
		movea.l    a4,a0
		jsr        strrchr
		movea.l    a0,a5
		lea.l      xa76d5,a1
		jsr        strcpy
		move.b     501(a2),d0
		add.b      d0,3(a5)
		clr.w      d0
		movea.l    a4,a0
		jsr        Fcreate
		move.l     d0,d3
		tst.w      d3
		bpl.s      str_output_1
		movea.l    a3,a0
		moveq.l    #9,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		bra        str_output_2
str_output_1:
		movea.l    a4,a0
		jsr        info_start
		lea.l      xa76da,a0
		jsr        info_title
		move.w     d3,d0
		jsr        set_handle
		jsr        setjmp
		tst.w      d0
		beq.s      str_output_3
		suba.l     a0,a0
		moveq.l    #10,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		move.w     d3,d0
		jsr        Fclose
		jsr        info_end
		bra        str_output_2
str_output_3:
		suba.l     a0,a0
		jsr        time
		move.l     d0,512(a7)
		lea.l      iostring,a5
		move.l     8(a2),-(a7)
		lea.l      516(a7),a0
		jsr        ctime
		move.l     a0,-(a7)
		lea.l      str_welcome,a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #8,a7
		movea.l    a5,a0
		jsr        save_string
		movea.l    8(a2),a1
		lea.l      (a7),a0
		jsr        Ast_reverse
		pea.l      4(a0)
		lea.l      xa76e8,a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a5,a0
		jsr        save_string
		moveq.l    #1,d0
		add.w      500(a2),d0
		move.w     d0,-(a7)
		lea.l      xa76ef,a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a5,a0
		jsr        save_string
		movea.l    36(a2),a0
		bsr        out_string
		movea.l    52(a2),a0
		bsr        out_string
		jsr        close_buf
		jsr        info_end
		move.w     d3,d0
		jsr        Fclose
str_output_2:
		lea.l      516(a7),a7
		movem.l    (a7)+,d3/a2-a5
		rts

	.data

xa76b0:
		dc.b '%-12s',0
		dc.b '&%-12s',0
		dc.b '&%-12s[3]',0
		dc.b 'ACS(',0
		dc.b '%s=#',0
		dc.b '#',$0d,$0a,0
xa76d5:
		dc.b '.ST0',0
xa76da:
		dc.b 'String-Export',0
xa76e8:
		dc.b '[%s]',$0d,$0a,0
xa76ef:
		dc.b 'GUI-LANGUAGE=ACS_LANG%d',$0d,$0a,0
		dc.b $00
