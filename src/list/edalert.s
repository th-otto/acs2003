		.text

	.globl del_alert
del_alert:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		ori.w      #$0001,6(a2)
		subq.w     #1,54(a3)
		move.w     54(a3),d0
		bgt.s      del_alert_1
		movea.l    18(a3),a4
		move.l     a4,d1
		beq.s      del_alert_2
		movea.l    4(a4),a5
		movea.l    a4,a0
		moveq.l    #2,d0
		suba.l     a1,a1
		jsr        (a5)
del_alert_2:
		movea.l    a3,a1
		movea.l    36(a2),a0
		jsr        del_entry
		movea.l    a3,a1
		movea.l    a2,a0
		jsr        objfree
		movea.l    a3,a1
		moveq.l    #3,d0
		movea.l    a2,a0
		jsr        serv_alert
del_alert_1:
		movem.l    (a7)+,a2-a5
		rts

	.globl copy_alert
copy_alert:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		ori.w      #$0001,6(a2)
		move.l     10(a3),d0
		jsr        objmalloc
		movea.l    a0,a4
		move.l     a4,d0
		bne.s      copy_alert_1
		suba.l     a0,a0
		bra.s      copy_alert_2
copy_alert_1:
		movea.l    4(a3),a1
		movea.l    4(a4),a0
		jsr        strcpy
		move.l     14(a3),14(a4)
		movea.l    a4,a0
copy_alert_2:
		movem.l    (a7)+,a2-a4
		rts

	.globl serv_alert
serv_alert:
		movem.l    d3-d6/a3-a6,-(a7)
		lea.l      -110(a7),a7
		movea.l    a0,a3
		move.l     a1,106(a7)
		lea.l      xcde2c,a0
		lea.l      40(a7),a1
		moveq.l    #15,d1
serv_alert_1:
		move.l     (a0)+,(a1)+
		dbf        d1,serv_alert_1
		move.w     (a0)+,(a1)+
		move.w     d0,d1
		subq.w     #1,d1
		beq.s      serv_alert_2
		subq.w     #1,d1
		beq        serv_alert_3
		subq.w     #1,d1
		beq        serv_alert_4
		bra        serv_alert_5
serv_alert_2:
		clr.w      d3
		bra.s      serv_alert_6
serv_alert_7:
		movea.l    106(a7),a0
		move.l     4(a0),44(a7)
		move.l     10(a0),d0
		move.l     d0,50(a7)
		move.l     d0,54(a7)
		lea.l      40(a7),a1
		movea.l    a3,a0
		bsr        copy_alert
		movea.l    a0,a4
		move.l     a4,d0
		beq        serv_alert_5
		move.w     d3,-(a7)
		movea.l    108(a7),a1
		pea.l      22(a1)
		lea.l      xcde6e,a1
		lea.l      22(a4),a0
		jsr        sprintf
		addq.w     #6,a7
		clr.l      -(a7)
		pea.l      22(a4)
		movea.l    a4,a1
		movea.l    a3,a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a4,a1
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a3,d0.l),a0
		movea.l    514(a0),a0
		jsr        add_entry
		addq.w     #1,d0
		beq        serv_alert_5
		addq.w     #1,d3
serv_alert_6:
		cmp.w      #$0003,d3
		blt.s      serv_alert_7
		bra        serv_alert_8
serv_alert_3:
		movea.l    36(a3),a0
		move.l     14(a0),d4
		lsr.l      #2,d4
		movea.l    514(a3),a1
		move.l     14(a1),d5
		lsr.l      #2,d5
		movea.l    a1,a6
		move.l     4(a6),36(a7)
		move.l     4(a0),32(a7)
		clr.w      d5
		bra.s      serv_alert_9
serv_alert_10:
		move.w     d5,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    32(a7),a0
		movea.l    0(a0,d0.l),a1
		clr.b      51(a1)
		addq.w     #1,d5
serv_alert_9:
		cmp.w      d5,d4
		bgt.s      serv_alert_10
		clr.w      d6
		bra.w      serv_alert_11
serv_alert_19:
		clr.b      (a7)
		moveq.l    #28,d0
		move.w     d6,d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    36(a7),a0
		movea.l    0(a0,d1.l),a1
		lea.l      22(a1),a1
		lea.l      (a7),a0
		jsr        strncat
		movea.l    a0,a5
serv_alert_14:
		moveq.l    #1,d0
		lea.l      (a7),a0
		jsr        strchr
		movea.l    a0,a5
		move.l     a5,d0
		beq.s      serv_alert_12
		cmpi.b     #$01,2(a5)
		bne.s      serv_alert_12
		clr.b      (a0)
serv_alert_12:
		move.l     a5,d0
		beq.s      serv_alert_13
		move.b     (a5),d1
		bne.s      serv_alert_14
serv_alert_13:
		clr.w      d3
		bra.s      serv_alert_15
serv_alert_17:
		lea.l      (a7),a1
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    32(a7),a0
		movea.l    0(a0,d0.l),a0
		lea.l      22(a0),a0
		jsr        strcmp
		tst.w      d0
		beq.s      serv_alert_16
		addq.w     #1,d3
serv_alert_15:
		cmp.w      d3,d4
		bgt.s      serv_alert_17
serv_alert_16:
		cmp.w      d3,d4
		beq.s      serv_alert_18
		addq.w     #1,d6
serv_alert_11:
		cmp.w      d6,d5
		bgt.w      serv_alert_19
serv_alert_18:
		cmp.w      d6,d5
		ble        serv_alert_8
		clr.w      d3
		bra.s      serv_alert_20
serv_alert_21:
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a3,d0.l),a0
		movea.l    514(a0),a6
		move.l     4(a6),36(a7)
		move.w     d6,d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    36(a7),a1
		movea.l    0(a1,d1.l),a5
		move.w     d3,-(a7)
		movea.l    108(a7),a0
		pea.l      22(a0)
		lea.l      xcde6e,a1
		lea.l      22(a5),a0
		jsr        sprintf
		addq.w     #6,a7
		clr.l      -(a7)
		pea.l      22(a5)
		movea.l    a5,a1
		movea.l    a3,a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a5,a1
		movea.l    a6,a0
		jsr        del_entry
		movea.l    a5,a1
		movea.l    a6,a0
		jsr        add_entry
		addq.w     #1,d3
serv_alert_20:
		cmp.w      #$0003,d3
		blt.s      serv_alert_21
		bra        serv_alert_8
serv_alert_4:
		clr.w      d3
		bra.w      serv_alert_22
serv_alert_27:
		move.w     d3,d0
		ext.l      d0
		lsl.l      #2,d0
		lea.l      0(a3,d0.l),a0
		movea.l    514(a0),a1
		move.l     14(a1),d5
		lsr.l      #2,d5
		movea.l    a1,a6
		move.l     4(a6),36(a7)
		move.w     d3,-(a7)
		movea.l    108(a7),a5
		pea.l      22(a5)
		lea.l      xcde6e,a1
		lea.l      6(a7),a0
		jsr        sprintf
		addq.w     #6,a7
		clr.w      d6
		bra.s      serv_alert_23
serv_alert_26:
		move.w     d6,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    36(a7),a0
		movea.l    0(a0,d0.l),a4
		lea.l      22(a4),a1
		lea.l      (a7),a0
		jsr        strcmp
		tst.w      d0
		bne.s      serv_alert_24
		movea.l    a4,a1
		movea.l    a6,a0
		jsr        del_entry
		movea.l    a4,a1
		movea.l    a3,a0
		jsr        objfree
		bra.s      serv_alert_25
serv_alert_24:
		addq.w     #1,d6
serv_alert_23:
		cmp.w      d6,d5
		bgt.s      serv_alert_26
serv_alert_25:
		addq.w     #1,d3
serv_alert_22:
		cmp.w      #$0003,d3
		blt.w      serv_alert_27
		bra.s      serv_alert_8
serv_alert_5:
		clr.w      d0
		bra.s      serv_alert_28
serv_alert_8:
		moveq.l    #1,d0
serv_alert_28:
		lea.l      110(a7),a7
		movem.l    (a7)+,d3-d6/a3-a6
		rts

new_work:
		move.w     #$271E,d0
		movea.l    $000AD794,a1
		jsr        work_icon
		rts

	.data

protoalert:
		dc.w $0000
		dc.w $0000
		dc.l proto_alert
		dc.w $0000
		dc.w $0000
		dc.w $0014
		dc.w $0000
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.b 'ALERTBOX_01',0
		dc.w $0000
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
	.globl list_alert
list_alert:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l WI_ALERT
		dc.l al_list
		dc.l al_name
		dc.w $271e
		dc.l protoalert
		dc.l copy_alert
		dc.l del_alert
		dc.l new_work
		dc.l serv_alert
xcde2c:
		dc.w $0000
		dc.w $0000
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
xcde6e:
		dc.b '%.28s',1,'%d',1,0
		.even
