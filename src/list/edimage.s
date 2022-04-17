		.text
		
		.globl add_image
add_image:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a2
		movea.l    a1,a4
		ori.w      #0x0001,6(a2)
		movea.l    48(a2),a3
		move.w     refimages,d0
		beq.s      add_image_1
		moveq.l    #6,d1
		movea.l    ACSblk,a1
		and.w      614(a1),d1
		subq.w     #6,d1
		beq.s      add_image_1
		lea.l      22(a4),a1
		movea.l    a3,a0
		jsr        find_entry
		cmpa.l     a0,a4
		bne.s      add_image_1
		addq.w     #1,54(a4)
		movea.l    a4,a0
		bra.s      add_image_2
add_image_1:
		moveq.l    #4,d0
		movea.l    a3,a0
		jsr        objextent
		tst.w      d0
		bne.s      add_image_3
		movea.l    a4,a1
		movea.l    a2,a0
		jsr        copy_image
		movea.l    a0,a5
		move.l     a5,d0
		bne.s      add_image_4
add_image_3:
		suba.l     a0,a0
		bra.s      add_image_2
add_image_4:
		move.l     list_image+16,-(a7)
		pea.l      22(a4)
		movea.l    a5,a1
		movea.l    a2,a0
		jsr        objname
		addq.w     #8,a7
		movea.l    a5,a1
		movea.l    a3,a0
		jsr        add_entry
		movea.l    a5,a0
add_image_2:
		movem.l    (a7)+,a2-a5
		rts

copy_image:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		move.l     14(a2),d0
		jsr        objmalloc
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      copy_image_1
		suba.l     a0,a0
		bra.s      copy_image_2
copy_image_1:
		move.l     14(a2),14(a3)
		move.l     14(a2),d0
		movea.l    4(a2),a1
		movea.l    4(a3),a0
		jsr        memcpy
		movea.l    a3,a0
copy_image_2:
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.globl dup_image
dup_image:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a3
		movea.l    a1,a2
		lea.l      free_image,a4
		moveq.l    #14,d0
		movea.l    a2,a1
		lea.l      -14(a4),a0
		jsr        memcpy
		move.w     4(a2),d3
		muls.w     6(a2),d3
		ext.l      d3
		move.l     d3,d0
		add.l      d0,d0
		add.l      #0x0000000E,d0
		move.l     d0,10(a4)
		move.l     d0,14(a4)
		movea.l    a4,a1
		movea.l    a3,a0
		bsr        add_image
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      dup_image_1
		suba.l     a0,a0
		bra.s      dup_image_2
dup_image_1:
		movea.l    4(a3),a4
		move.l     d3,d0
		movea.l    (a2),a1
		lea.l      14(a4),a0
		jsr        memcpy
		move.l     d3,d0
		movea.l    (a2),a1
		lea.l      14(a4,d3.l),a0
		jsr        memcpy
		move.l     #0x0000000E,(a4)
		movea.l    a3,a0
dup_image_2:
		movem.l    (a7)+,d3/a2-a4
		rts

	.globl del_image
del_image:
		movem.l    a2-a5,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		ori.w      #0x0001,6(a2)
		subq.w     #1,54(a3)
		move.w     54(a3),d0
		bgt.s      del_image_1
		movea.l    18(a3),a4
		move.l     a4,d1
		beq.s      del_image_2
		movea.l    4(a4),a5
		movea.l    a4,a0
		moveq.l    #2,d0
		suba.l     a1,a1
		jsr        (a5)
del_image_2:
		movea.l    a3,a1
		movea.l    48(a2),a0
		jsr        del_entry
		movea.l    a3,a1
		movea.l    a2,a0
		jsr        objfree
del_image_1:
		movem.l    (a7)+,a2-a5
		rts

new_work:
		move.w     #0x2721,d0
		movea.l    WI_IMAGE+90,a1
		jsr        work_icon
		rts

	.data

bitblk_obj:
		dc.w $0000
		dc.w $000e
		dc.w $0006
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.w $0001
imagedata:
		dc.w $07ff
		dc.w $ffff
		dc.w $ff80
		dc.w $0c00
		dc.w $0000
		dc.w $00c0
		dc.w $183f
		dc.w $f03f
		dc.w $f060
		dc.w $187f
		dc.w $f860
		dc.w $1860
		dc.w $187f
		dc.w $f860
		dc.w $1860
		dc.w $187f
		dc.w $f860
		dc.w $1860
		dc.w $187f
		dc.w $f860
		dc.w $1860
		dc.w $187f
		dc.w $f860
		dc.w $1860
		dc.w $187f
		dc.w $f860
		dc.w $1860
		dc.w $187f
		dc.w $f860
		dc.w $1860
		dc.w $187f
		dc.w $f860
		dc.w $1860
		dc.w $187f
		dc.w $f860
		dc.w $1860
		dc.w $187f
		dc.w $f860
		dc.w $1860
		dc.w $187f
		dc.w $f860
		dc.w $1860
		dc.w $183f
		dc.w $f03f
		dc.w $f060
		dc.w $0c00
		dc.w $0000
		dc.w $00c0
		dc.w $07ff
		dc.w $ffff
		dc.w $ff80
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $3f30
		dc.w $c787
		dc.w $8fe0
		dc.w $0c39
		dc.w $cccc
		dc.w $cc00
		dc.w $0c36
		dc.w $cfcc
		dc.w $0f80
		dc.w $0c30
		dc.w $cccd
		dc.w $cc00
		dc.w $3f30
		dc.w $ccc7
		dc.w $cfe0
		dc.w $0000
		dc.w $0000
		dc.w $0000
protoimage:
		dc.w $0000
		dc.w $0000
		dc.l bitblk_obj
		dc.w $0000
		dc.w $0000
		dc.w $009e
		dc.w $0000
		dc.w $009e
		dc.w $0000
		dc.w $0000
		dc.b 'IMAGE_01',0
		dc.b $00
		dc.w $0000
		dc.w $0000
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
	.globl list_image
list_image:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l WI_IMAGE
		dc.l im_list
		dc.l im_name
		dc.w $2721
		dc.l protoimage
		dc.l copy_image
		dc.l del_image
		dc.l new_work
		dc.w $0000
		dc.w $0000
my_image:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
free_image:
		dc.w $0000
		dc.w $0000
		dc.l my_image
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.b 'IMAGE_01',0
		dc.b $00
		dc.w $0000
		dc.w $0000
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
