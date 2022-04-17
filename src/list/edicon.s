		.text
		
add_icon:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a2
		movea.l    a1,a4
		movea.l    44(a2),a3
		ori.w      #0x0001,6(a2)
		move.w     refimages,d0
		beq.s      add_icon_1
		moveq.l    #6,d1
		movea.l    ACSblk,a1
		and.w      614(a1),d1
		subq.w     #6,d1
		beq.s      add_icon_1
		lea.l      22(a4),a1
		movea.l    a3,a0
		jsr        find_entry
		cmpa.l     a0,a4
		bne.s      add_icon_1
		addq.w     #1,54(a4)
		movea.l    a4,a0
		bra.s      add_icon_2
add_icon_1:
		moveq.l    #4,d0
		movea.l    a3,a0
		jsr        objextent
		tst.w      d0
		bne.s      add_icon_3
		movea.l    a4,a1
		movea.l    a2,a0
		jsr        copy_icon
		movea.l    a0,a5
		move.l     a5,d0
		bne.s      add_icon_4
add_icon_3:
		suba.l     a0,a0
		bra.s      add_icon_2
add_icon_4:
		move.l     list_icon+16,-(a7)
		pea.l      22(a4)
		movea.l    a5,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a5,a1
		movea.l    a3,a0
		jsr        add_entry
		movea.l    a5,a0
add_icon_2:
		movem.l    (a7)+,a2-a5
		rts

copy_icon:
		movem.l    a2-a6,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     14(a2),d0
		jsr        objmalloc
		movea.l    a0,a4
		move.l     a4,d0
		bne.s      copy_icon_1
		suba.l     a0,a0
		bra        copy_icon_2
copy_icon_1:
		move.l     14(a2),14(a4)
		movea.l    4(a2),a5
		movea.l    4(a4),a6
		move.l     14(a2),d0
		movea.l    a5,a1
		movea.l    a6,a0
		jsr        memcpy
		movea.l    8(a5),a1
		movea.l    a3,a0
		jsr        add_string
		move.l     a0,8(a6)
		clr.l      34(a6)
		clr.l      40(a6)
		clr.l      44(a6)
		clr.l      48(a6)
		clr.l      52(a6)
		move.w     38(a5),38(a6)
		clr.l      56(a6)
		clr.l      62(a6)
		clr.l      66(a6)
		clr.l      70(a6)
		clr.l      74(a6)
		move.w     60(a5),60(a6)
		clr.l      78(a6)
		move.l     40(a5),d0
		beq.s      copy_icon_3
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        add_data
		move.l     a0,40(a6)
copy_icon_3:
		move.l     44(a5),d0
		beq.s      copy_icon_4
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        add_data
		move.l     a0,44(a6)
copy_icon_4:
		move.l     48(a5),d0
		beq.s      copy_icon_5
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        add_data
		move.l     a0,48(a6)
copy_icon_5:
		move.l     52(a5),d0
		beq.s      copy_icon_6
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        add_data
		move.l     a0,52(a6)
copy_icon_6:
		move.l     62(a5),d0
		beq.s      copy_icon_7
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        add_data
		move.l     a0,62(a6)
copy_icon_7:
		move.l     66(a5),d0
		beq.s      copy_icon_8
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        add_data
		move.l     a0,66(a6)
copy_icon_8:
		move.l     70(a5),d0
		beq.s      copy_icon_9
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        add_data
		move.l     a0,70(a6)
copy_icon_9:
		move.l     74(a5),d0
		beq.s      copy_icon_10
		movea.l    d0,a1
		movea.l    a3,a0
		jsr        add_data
		move.l     a0,74(a6)
copy_icon_10:
		movea.l    a4,a0
copy_icon_2:
		movem.l    (a7)+,a2-a6
		rts

dup_icon:
		movem.l    d3/a2-a5,-(a7)
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		lea.l      my_icon,a3
		moveq.l    #38,d0
		movea.l    (a7),a1
		movea.l    a3,a0
		jsr        memcpy
		movea.l    (a7),a0
		movea.l    8(a0),a1
		movea.l    4(a7),a0
		jsr        dup_string
		subq.w     #1,54(a0)
		move.l     a0,8(a3)
		movea.l    (a7),a1
		move.w     22(a1),d3
		asr.w      #3,d3
		muls.w     24(a1),d3
		ext.l      d3
		move.l     d3,d0
		add.l      d0,d0
		add.l      #0x00000052,d0
		move.l     d0,92(a3)
		move.l     d0,96(a3)
		clr.l      34(a3)
		clr.l      40(a3)
		clr.l      44(a3)
		clr.l      48(a3)
		clr.l      52(a3)
		clr.w      38(a3)
		clr.l      56(a3)
		clr.l      62(a3)
		clr.l      66(a3)
		clr.l      70(a3)
		clr.l      74(a3)
		clr.w      60(a3)
		clr.l      78(a3)
		movea.l    34(a1),a5
		move.l     a5,d0
		beq        dup_icon_1
		cmpi.w     #0x0004,(a5)
		bne        dup_icon_2
		move.w     #0x0004,38(a3)
		movea.l    2(a5),a4
		move.l     a4,d0
		beq.s      dup_icon_3
		move.l     d3,d0
		lsl.l      #2,d0
		addq.l     #6,d0
		lea.l      -6(a4),a1
		movea.l    4(a7),a0
		jsr        dup_data
		movea.l    a0,a2
		move.l     a0,40(a3)
		subq.w     #1,54(a2)
		movea.l    4(a2),a4
		clr.w      (a4)
dup_icon_3:
		move.l     6(a5),d0
		beq.s      dup_icon_4
		movea.l    d0,a1
		movea.l    4(a7),a0
		move.l     d3,d0
		jsr        dup_data
		movea.l    a0,a2
		move.l     a0,44(a3)
		subq.w     #1,54(a2)
dup_icon_4:
		movea.l    10(a5),a4
		move.l     a4,d0
		beq.s      dup_icon_5
		move.l     d3,d0
		lsl.l      #2,d0
		addq.l     #6,d0
		lea.l      -6(a4),a1
		movea.l    4(a7),a0
		jsr        dup_data
		movea.l    a0,a2
		move.l     a0,48(a3)
		subq.w     #1,54(a2)
		movea.l    4(a2),a4
		clr.w      (a4)
dup_icon_5:
		move.l     14(a5),d0
		beq.s      dup_icon_6
		movea.l    d0,a1
		movea.l    4(a7),a0
		move.l     d3,d0
		jsr        dup_data
		movea.l    a0,a2
		move.l     a0,52(a3)
		subq.w     #1,54(a2)
dup_icon_6:
		movea.l    18(a5),a5
dup_icon_2:
		move.l     a5,d0
		beq        dup_icon_1
		cmpi.w     #0x0008,(a5)
		bne        dup_icon_1
		move.w     #0x0008,60(a3)
		movea.l    2(a5),a4
		move.l     a4,d1
		beq.s      dup_icon_7
		move.l     d3,d0
		lsl.l      #3,d0
		addq.l     #6,d0
		lea.l      -6(a4),a1
		movea.l    4(a7),a0
		jsr        dup_data
		movea.l    a0,a2
		move.l     a0,62(a3)
		subq.w     #1,54(a2)
		movea.l    4(a2),a4
		clr.w      (a4)
dup_icon_7:
		move.l     6(a5),d0
		beq.s      dup_icon_8
		movea.l    d0,a1
		movea.l    4(a7),a0
		move.l     d3,d0
		jsr        dup_data
		movea.l    a0,a2
		move.l     a0,66(a3)
		subq.w     #1,54(a2)
dup_icon_8:
		movea.l    10(a5),a4
		move.l     a4,d0
		beq.s      dup_icon_9
		move.l     d3,d0
		lsl.l      #3,d0
		addq.l     #6,d0
		lea.l      -6(a4),a1
		movea.l    4(a7),a0
		jsr        dup_data
		movea.l    a0,a2
		move.l     a0,70(a3)
		subq.w     #1,54(a2)
		movea.l    4(a2),a4
		clr.w      (a4)
dup_icon_9:
		move.l     14(a5),d0
		beq.s      dup_icon_1
		movea.l    d0,a1
		movea.l    4(a7),a0
		move.l     d3,d0
		jsr        dup_data
		movea.l    a0,a2
		move.l     a0,74(a3)
		subq.w     #1,54(a2)
dup_icon_1:
		lea.l      82(a3),a1
		movea.l    4(a7),a0
		bsr        add_icon
		movea.l    a0,a2
		move.l     a2,d0
		bne.s      dup_icon_10
		suba.l     a0,a0
		bra.s      dup_icon_11
dup_icon_10:
		movea.l    4(a2),a4
		move.l     d3,d0
		movea.l    (a7),a0
		movea.l    (a0),a1
		lea.l      82(a4),a0
		jsr        memcpy
		move.l     d3,d0
		movea.l    (a7),a0
		movea.l    4(a0),a1
		lea.l      82(a4,d3.l),a0
		jsr        memcpy
		move.l     #0x00000052,(a4)
		moveq.l    #82,d0
		add.l      d3,d0
		move.l     d0,4(a4)
		movea.l    a2,a0
dup_icon_11:
		addq.w     #8,a7
		movem.l    (a7)+,d3/a2-a5
		rts

del_icon:
		movem.l    a2-a4,-(a7)
		movea.l    a0,a4
		movea.l    a1,a2
		subq.w     #1,54(a2)
		move.w     54(a2),d0
		bgt        del_icon_1
		movea.l    18(a2),a0
		move.l     a0,d1
		nop
		movea.l    4(a2),a3
		movea.l    8(a3),a1
		movea.l    a4,a0
		jsr        del_string
		move.l     40(a3),d0
		beq.s      del_icon_2
		movea.l    d0,a1
		movea.l    a4,a0
		jsr        del_data
del_icon_2:
		move.l     44(a3),d0
		beq.s      del_icon_3
		movea.l    d0,a1
		movea.l    a4,a0
		jsr        del_data
del_icon_3:
		move.l     48(a3),d0
		beq.s      del_icon_4
		movea.l    d0,a1
		movea.l    a4,a0
		jsr        del_data
del_icon_4:
		move.l     52(a3),d0
		beq.s      del_icon_5
		movea.l    d0,a1
		movea.l    a4,a0
		jsr        del_data
del_icon_5:
		move.l     62(a3),d0
		beq.s      del_icon_6
		movea.l    d0,a1
		movea.l    a4,a0
		jsr        del_data
del_icon_6:
		move.l     66(a3),d0
		beq.s      del_icon_7
		movea.l    d0,a1
		movea.l    a4,a0
		jsr        del_data
del_icon_7:
		move.l     70(a3),d0
		beq.s      del_icon_8
		movea.l    d0,a1
		movea.l    a4,a0
		jsr        del_data
del_icon_8:
		move.l     74(a3),d0
		beq.s      del_icon_9
		movea.l    d0,a1
		movea.l    a4,a0
		jsr        del_data
del_icon_9:
		movea.l    a2,a1
		movea.l    44(a4),a0
		jsr        del_entry
		movea.l    a2,a1
		movea.l    a4,a0
		jsr        objfree
del_icon_1:
		movem.l    (a7)+,a2-a4
		rts

new_work:
		move.w     #0x2720,d0
		movea.l    WI_ICON+90,a1
		jsr        work_icon
		rts

	.data

astring:
		dc.w $0000
		dc.w $0000
		dc.l xce3f0
		dc.w $0000
		dc.w $0000
		dc.w $0006
		dc.w $0000
		dc.w $0006
		dc.w $0000
		dc.w $0000
		dc.b 'TEXT_01',0
		dc.w $0000
		dc.w $0000
		dc.w $0000
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
iconblk_obj:
		dc.w $0000
		dc.w $0052
		dc.w $0000
		dc.w $00e2
		dc.l astring
		dc.w $1041
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0030
		dc.w $0018
		dc.w $0000
		dc.w $0018
		dc.w $0030
		dc.w $0008
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
iconmask:
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $0fff
		dc.w $ffff
		dc.w $fff0
		dc.w $0fff
		dc.w $ffff
		dc.w $fff0
		dc.w $0fff
		dc.w $ffff
		dc.w $fff0
		dc.w $0fff
		dc.w $ffff
		dc.w $fff0
		dc.w $0fff
		dc.w $ffff
		dc.w $fff0
		dc.w $0fff
		dc.w $ffff
		dc.w $fff0
		dc.w $0fff
		dc.w $ffff
		dc.w $fff0
		dc.w $0fff
		dc.w $ffff
		dc.w $fff0
		dc.w $0000
		dc.w $0000
		dc.w $0000
icondata:
		dc.w $00ff
		dc.w $ffff
		dc.w $fe00
		dc.w $00c0
		dc.w $0000
		dc.w $0600
		dc.w $00c0
		dc.w $7fff
		dc.w $8600
		dc.w $00c0
		dc.w $c000
		dc.w $8600
		dc.w $00c1
		dc.w $4000
		dc.w $8600
		dc.w $00c3
		dc.w $c000
		dc.w $8600
		dc.w $00c2
		dc.w $0000
		dc.w $8600
		dc.w $00c2
		dc.w $0000
		dc.w $8600
		dc.w $00c2
		dc.w $0000
		dc.w $8600
		dc.w $00c2
		dc.w $0000
		dc.w $8600
		dc.w $00c2
		dc.w $0000
		dc.w $8600
		dc.w $00c2
		dc.w $0000
		dc.w $8600
		dc.w $00c2
		dc.w $0000
		dc.w $8600
		dc.w $00c2
		dc.w $0000
		dc.w $8600
		dc.w $00c2
		dc.w $0000
		dc.w $8600
		dc.w $0fc3
		dc.w $ffff
		dc.w $87f0
		dc.w $0c00
		dc.w $0000
		dc.w $0030
		dc.w $0c1c
		dc.w $f9f9
		dc.w $8830
		dc.w $0c08
		dc.b '�',$09,'H0'
		dc.w $0c08
		dc.b '�',$09,'(0'
		dc.w $0c1c
		dc.w $f9f9
		dc.w $1830
		dc.w $0c00
		dc.w $0000
		dc.w $0030
		dc.w $0fff
		dc.w $ffff
		dc.w $fff0
		dc.w $0000
		dc.w $0000
		dc.w $0000
protoicon:
		dc.w $0000
		dc.w $0000
		dc.l iconblk_obj
		dc.w $0000
		dc.w $0000
		dc.w $0172
		dc.w $0000
		dc.w $0172
		dc.w $0000
		dc.w $0000
		dc.b 'ICON_01',0
		dc.w $0000
		dc.w $0000
		dc.w $0000
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
list_icon:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l WI_ICON
		dc.l ic_list
		dc.l ic_name
		dc.w $2720
		dc.l protoicon
		dc.l copy_icon
		dc.l del_icon
		dc.l new_work
		dc.w $0000
		dc.w $0000
my_icon:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
free_icon:
		dc.w $0000
		dc.w $0000
		dc.l my_icon
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.b 'ICON_01',0
		dc.w $0000
		dc.w $0000
		dc.w $0000
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
xce3f0:
		dc.b 'CICON',0
		.even
