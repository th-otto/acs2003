		.text
		
prot_texte:
		movem.l    d3-d4/a2-a6,-(a7)
		subq.w     #2,a7
		movea.l    a0,a2
		movea.l    a1,a3
		move.l     14(a2),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        prot_texte_1
		lea.l      22(a2),a0
		jsr        info_list
		movea.l    4(a2),a2
		movea.l    a3,a0
		jsr        save_string
		clr.b      1(a7)
		clr.w      d4
		lea.l      xa4704,a4
		bra        prot_texte_2
prot_texte_5:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a6
		lea.l      22(a6),a0
		jsr        info_obj
		pea.l      22(a6)
		movea.l    a4,a1
		lea.l      iostring,a0
		jsr        sprintf
		addq.w     #4,a7
		lea.l      iostring,a0
		jsr        save_string
		movea.l    4(a6),a6
		bra.s      prot_texte_3
prot_texte_4:
		move.b     (a5),(a7)
		clr.b      (a5)
		movea.l    a6,a0
		jsr        save_string
		lea.l      8(a4),a0
		jsr        save_string
		lea.l      (a7),a0
		jsr        save_string
		move.b     (a7),(a5)
		lea.l      1(a5),a6
prot_texte_3:
		lea.l      7(a4),a1
		movea.l    a6,a0
		jsr        strpbrk
		movea.l    a0,a5
		move.l     a5,d0
		bne.s      prot_texte_4
		movea.l    a6,a0
		jsr        save_string
		lea.l      10(a4),a0
		jsr        save_string
		addq.w     #1,d4
prot_texte_2:
		cmp.w      d4,d3
		bgt        prot_texte_5
		lea.l      14(a4),a0
		jsr        save_string
prot_texte_1:
		addq.w     #2,a7
		movem.l    (a7)+,d3-d4/a2-a6
		rts

prot_clickdrag:
		movem.l    d3-d6/a2-a6,-(a7)
		lea.l      -280(a7),a7
		move.l     a0,276(a7)
		move.l     14(a0),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        prot_clickdrag_1
		lea.l      22(a0),a0
		jsr        info_list
		movea.l    276(a7),a0
		lea.l      22(a0),a0
		jsr        save_string
		lea.l      xa4717,a0
		jsr        save_string
		movea.l    276(a7),a0
		move.l     4(a0),272(a7)
		clr.w      d4
		bra        prot_clickdrag_2
prot_clickdrag_20:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    272(a7),a0
		movea.l    0(a0,d0.l),a6
		lea.l      22(a6),a0
		jsr        info_obj
		clr.b      (a7)
		move.w     56(a6),d0
		and.w      #0x0100,d0
		beq.s      prot_clickdrag_3
		lea.l      xa4732,a1
		lea.l      (a7),a0
		jsr        strcat
prot_clickdrag_3:
		move.w     56(a6),d0
		and.w      #0x0200,d0
		beq.s      prot_clickdrag_4
		lea.l      xa4738,a1
		lea.l      (a7),a0
		jsr        strcat
prot_clickdrag_4:
		move.w     56(a6),d0
		and.w      #0x0400,d0
		beq.s      prot_clickdrag_5
		move.w     56(a6),d1
		and.w      #0x0100,d1
		beq.s      prot_clickdrag_5
		lea.l      xa4740,a1
		lea.l      (a7),a0
		jsr        strcat
		bra.s      prot_clickdrag_6
prot_clickdrag_5:
		lea.l      xa4746,a1
		lea.l      (a7),a0
		jsr        strcat
prot_clickdrag_6:
		pea.l      (a7)
		move.w     54(a6),-(a7)
		pea.l      22(a6)
		lea.l      xa474d,a1
		lea.l      iostring,a0
		jsr        sprintf
		lea.l      10(a7),a7
		lea.l      iostring,a0
		jsr        save_string
		move.l     14(a6),d0
		moveq.l    #56,d1
		jsr        _uldiv
		move.l     d0,d5
		movea.l    4(a6),a6
		clr.w      d6
		bra        prot_clickdrag_7
prot_clickdrag_19:
		lea.l      xa470a,a3
		movea.l    a3,a4
		movea.l    a4,a2
		clr.b      256(a7)
		move.l     (a6),d0
		beq.s      prot_clickdrag_8
		movea.l    d0,a2
		lea.l      22(a2),a2
prot_clickdrag_8:
		move.l     32(a6),d0
		beq.s      prot_clickdrag_9
		movea.l    d0,a4
		lea.l      22(a4),a4
prot_clickdrag_9:
		move.l     36(a6),d0
		beq.s      prot_clickdrag_10
		movea.l    d0,a3
		lea.l      22(a3),a3
prot_clickdrag_10:
		move.w     42(a6),d0
		beq.s      prot_clickdrag_11
		jsr        key_string
		movea.l    a0,a5
		movea.l    a5,a1
		lea.l      256(a7),a0
		jsr        strcpy
		movea.l    a0,a5
		bra.s      prot_clickdrag_12
prot_clickdrag_16:
		cmpi.b     #7,(a5)
		bne.s      prot_clickdrag_13
		move.b     #0x61,(a5)
prot_clickdrag_13:
		cmpi.b     #0x5E,(a5)
		bne.s      prot_clickdrag_14
		move.b     #0x63,(a5)
prot_clickdrag_14:
		cmpi.b     #1,(a5)
		bne.s      prot_clickdrag_15
		move.b     #0x73,(a5)
prot_clickdrag_15:
		addq.w     #1,a5
prot_clickdrag_12:
		move.b     (a5),d0
		bne.s      prot_clickdrag_16
prot_clickdrag_11:
		move.b     (a2),d0
		bne.s      prot_clickdrag_17
		move.b     256(a7),d1
		bne.s      prot_clickdrag_17
		move.b     (a4),d2
		bne.s      prot_clickdrag_17
		move.b     (a3),d0
		beq.s      prot_clickdrag_18
prot_clickdrag_17:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		move.l     a4,-(a7)
		pea.l      268(a7)
		lea.l      xa4822,a1
		lea.l      iostring,a0
		jsr        sprintf
		lea.l      16(a7),a7
		lea.l      iostring,a0
		jsr        save_string
prot_clickdrag_18:
		lea.l      56(a6),a6
		addq.w     #1,d6
prot_clickdrag_7:
		cmp.w      d6,d5
		bgt        prot_clickdrag_19
		lea.l      xa470f,a0
		jsr        save_string
		addq.w     #1,d4
prot_clickdrag_2:
		cmp.w      d4,d3
		bgt        prot_clickdrag_20
		lea.l      xa4712,a0
		jsr        save_string
prot_clickdrag_1:
		lea.l      280(a7),a7
		movem.l    (a7)+,d3-d6/a2-a6
		rts

prot_labellist:
		movem.l    d3-d4/a2-a4,-(a7)
		movea.l    a0,a3
		lea.l      xa4704,a2
		lea.l      311(a2),a0
		jsr        info_list
		lea.l      311(a2),a0
		jsr        info_obj
		lea.l      315(a2),a0
		jsr        save_string
		moveq.l    #0,d3
		move.l     d3,d4
		movea.l    16(a3),a3
		lea.l      iostring,a4
		bra.s      prot_labellist_1
prot_labellist_4:
		moveq.l    #1,d0
		and.l      d4,d0
		beq.s      prot_labellist_2
		lea.l      50(a2),a0
		jsr        save_string
		bra.s      prot_labellist_3
prot_labellist_2:
		lea.l      11(a2),a0
		jsr        save_string
prot_labellist_3:
		move.l     14(a3),-(a7)
		move.w     54(a3),-(a7)
		pea.l      22(a3)
		lea.l      534(a2),a1
		movea.l    a4,a0
		jsr        sprintf
		lea.l      10(a7),a7
		movea.l    a4,a0
		jsr        save_string
		add.l      14(a3),d3
		addq.l     #1,d4
		movea.l    (a3),a3
prot_labellist_1:
		move.l     a3,d0
		bne.s      prot_labellist_4
		lea.l      550(a2),a0
		jsr        save_string
		move.l     d3,-(a7)
		move.l     d4,-(a7)
		lea.l      642(a2),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #8,a7
		movea.l    a4,a0
		jsr        save_string
		movem.l    (a7)+,d3-d4/a2-a4
		rts

	.globl protocol
protocol:
		movem.l    d3/a2/a4-a5,-(a7)
		lea.l      -132(a7),a7
		movea.l    a0,a2
		movea.l    8(a2),a1
		lea.l      (a7),a0
		jsr        strcpy
		moveq.l    #46,d0
		lea.l      (a7),a0
		jsr        strrchr
		movea.l    a0,a5
		lea.l      xa4704,a4
		lea.l      689(a4),a1
		movea.l    a5,a0
		jsr        strcpy
		clr.w      d0
		lea.l      (a7),a0
		jsr        Fcreate
		move.l     d0,d3
		tst.l      d0
		bpl.s      protocol_1
		movea.l    8(a2),a0
		moveq.l    #92,d0
		jsr        strrchr
		addq.w     #1,a0
		moveq.l    #9,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		bra        protocol_2
protocol_1:
		clr.b      (a5)
		lea.l      (a7),a0
		jsr        info_start
		lea.l      694(a4),a0
		jsr        info_title
		move.w     d3,d0
		jsr        set_handle
		jsr        setjmp
		tst.w      d0
		beq.s      protocol_3
		suba.l     a0,a0
		moveq.l    #10,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		bra.s      protocol_4
protocol_3:
		suba.l     a0,a0
		jsr        time
		move.l     d0,128(a7)
		lea.l      iostring,a5
		move.l     8(a2),-(a7)
		lea.l      132(a7),a0
		jsr        ctime
		move.l     a0,-(a7)
		lea.l      pc_welcome,a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #8,a7
		movea.l    a5,a0
		jsr        save_string
		movea.l    28(a2),a0
		bsr        prot_clickdrag
		movea.l    32(a2),a0
		bsr        prot_clickdrag
		movea.l    24(a2),a0
		bsr        prot_clickdrag
		lea.l      704(a4),a1
		movea.l    52(a2),a0
		bsr        prot_texte
		lea.l      725(a4),a1
		movea.l    36(a2),a0
		bsr        prot_texte
		movea.l    a2,a0
		bsr        prot_labellist
		jsr        close_buf
protocol_4:
		jsr        info_end
		move.w     d3,d0
		jsr        Fclose
protocol_2:
		lea.l      132(a7),a7
		movem.l    (a7)+,d3/a2/a4-a5
		rts

	.data

xa4704:
		dc.b '%-32s"'
xa470a:  dc.b 0
		dc.b $22
		dc.w $5c00
		dc.b '"'
xa470f: dc.b $0d,$0a,0
xa4712:
		dc.b $0d,$0a,$0d,$0a,0
xa4717:
		dc.b $0d,$0a,'====================',$0d,$0a,$0d,$0a,0
xa4732:
		dc.b 'free ',0
xa4738:
		dc.b 'extern ',0
xa4740:
		dc.b 'local',0
xa4746:
		dc.b 'global',0
xa474d:
		dc.b $0d,$0a,'%s [usage %d %s]',$0d,$0a,'----------------------------------------',$0d,$0a,'keycode| click               | drag                | index               ',$0d,$0a,'=======|=====================|=====================|=====================',$0d,$0a,0
xa4822:
		dc.b '%-7s|%-21s|%-21s|%-21s',$0d,$0a,0
xa483b:
		dc.b 'all',0
xa483f:
		dc.b $0d,$0a,$09,$09,$09,' List of all named objects',$0d,$0a,$09,$09,$09,' =========================',$0d,$0a,$0d,$0a,$0d,$0a,$09,'Name',$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,' |Use |Size |',$09,' Name',$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,' |Use |Size |',$0d,$0a,'===============================|====|=====|================================|====|=====|',0
xa491a:
		dc.b '%-31s|%4d|%5ld|',0
xa492a:
		dc.b $0d,$0a,'=======================================================================================',$0d,$0a,0
xa4986:
		dc.b '%ld objects containing %ld bytes user data',$0d,$0a,$0d,$0a,0
xa49b5:
		dc.b '.LST',0
xa49ba:
		dc.b 'Protokoll',0
xa49c4:
		dc.b $09,$09,'TEXTS',$0d,$0a,$09,$09,'=====',$0d,$0a,$0d,$0a,0
xa49d9:
		dc.b $09,$09,'ALERTBOXES',$0d,$0a,$09,$09,'==========',$0d,$0a,$0d,$0a,0
	.even
