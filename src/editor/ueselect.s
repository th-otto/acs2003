		.text

init_select:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		lea.l      data,a1
		move.w     #$2329,d0
		movea.l    4(a2),a3
		jsr        (a3)
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

minsize:
		movea.l    ACSblk,a0
		move.w     18(a0),(a1)
		movea.l    ACSblk,a0
		movea.l    4(a7),a1
		move.w     20(a0),(a1)
		rts

object_tree:
		suba.l     a0,a0
		rts

test_it:
		move.l     #A_select,(a1)
		clr.l      8(a1)
		moveq.l    #0,d0
		move.l     d0,20(a1)
		move.l     d0,16(a1)
		move.l     d0,12(a1)
		clr.l      24(a1)
		clr.l      28(a1)
		rts

abort:
		movea.l    data+64,a0
		movea.l    (a0),a0
		jsr        (a0)
		rts

	.data

visual:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $001a
		dc.w $0000
		dc.w $0000
		dc.l xbcf36
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0002
logical:
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0002
aud:
		dc.l xbcf3d
		dc.l xbcf3c
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
data:
		dc.b 'A_select',0
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
		dc.l object_tree
		dc.l test_it
		dc.l abort
		dc.l Aob_delete
		dc.l visual
		dc.l logical
		dc.l aud
		dc.l minsize
		dc.w $0000
		dc.w $0000
		dc.l xbcf42
		dc.l xbcf4b
		dc.w $0000
		dc.w $0000
xbcf36:
		dc.b 'SELECT'
xbcf3c: dc.b 0
xbcf3d:
		dc.b '0x0L',0
xbcf42:
		dc.b 'SELECT |',0
xbcf4b:
		dc.b 'Der Select-Editor',0
		.even
