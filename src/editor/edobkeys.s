		.text

comp:
		movea.l    (a1),a1
		jsr        strcmp
		rts

	.globl key_code
key_code:
		movem.l    d3/a2-a3,-(a7)
		movea.l    a0,a2
		clr.w      d3
		subq.w     #1,a2
key_code_2:
		addq.w     #1,a2
		cmpi.b     #0x07,(a2)
		bne.s      key_code_1
		or.w       #0x8800,d3
		bra.s      key_code_2
key_code_1:
		cmpi.b     #0x01,(a2)
		bne.s      key_code_3
		or.w       #0x0300,d3
		bra.s      key_code_2
key_code_3:
		cmpi.b     #0x5E,(a2)
		bne.s      key_code_4
		or.w       #0x8400,d3
		bra.s      key_code_2
key_code_4:
		pea.l      comp(pc)
		moveq.l    #6,d1
		moveq.l    #26,d0
		lea.l      nktab,a1
		movea.l    a2,a0
		jsr        bsearch
		addq.w     #4,a7
		movea.l    a0,a3
		move.l     a3,d0
		bne.s      key_code_5
		cmpi.b     #0x20,(a2)
		bcs.s      key_code_6
		move.b     1(a2),d0
		beq.s      key_code_7
		cmp.b      #0x20,d0
		bne.s      key_code_6
key_code_7:
		clr.w      d0
		move.b     (a2),d0
		or.w       d3,d0
		bra.s      key_code_8
key_code_6:
		clr.w      d0
		bra.s      key_code_8
key_code_5:
		move.w     d3,d0
		or.w       4(a3),d0
		or.w       #0x8000,d0
key_code_8:
		movem.l    (a7)+,d3/a2-a3
		rts

	.globl key_string
key_string:
		movem.l    d3-d5/a2-a3,-(a7)
		move.w     d0,d3
		lea.l      string,a2
		clr.b      (a2)
		move.w     d3,d0
		and.w      #0x0300,d0
		beq.s      key_string_1
		lea.l      xcce3f,a1
		movea.l    a2,a0
		jsr        strcat
key_string_1:
		move.w     d3,d0
		and.w      #0x0400,d0
		beq.s      key_string_2
		lea.l      xcce41,a1
		movea.l    a2,a0
		jsr        strcat
key_string_2:
		move.w     d3,d0
		and.w      #0x0800,d0
		beq.s      key_string_3
		lea.l      xcce43,a1
		movea.l    a2,a0
		jsr        strcat
key_string_3:
		movea.l    a2,a0
		jsr        strlen
		move.l     d0,d4
		clr.w      d5
		lea.l      nktab,a3
		bra.s      key_string_4
key_string_7:
		move.w     d5,d0
		add.w      d0,d0
		add.w      d5,d0
		add.w      d0,d0
		cmp.b      5(a3,d0.w),d3
		bne.s      key_string_5
		movea.l    0(a3,d0.w),a1
		movea.l    a2,a0
		jsr        strcat
		bra.s      key_string_6
key_string_5:
		addq.w     #1,d5
key_string_4:
		cmp.w      #0x001A,d5
		blt.s      key_string_7
		move.w     #0x00FF,d0
		and.w      d3,d0
		cmp.w      #0x0020,d0
		blt.s      key_string_8
		move.b     d3,0(a2,d4.w)
		addq.w     #1,d4
key_string_8:
		clr.b      0(a2,d4.w)
		movea.l    a2,a0
key_string_6:
		movem.l    (a7)+,d3-d5/a2-a3
		rts

	.data

	.globl nktab
nktab:
		dc.l xccdd6
		dc.w $0008
		dc.l xccdd9
		dc.w $000c
		dc.l xccddd
		dc.w $001f
		dc.l xccde1
		dc.w $0002
		dc.l xccde6
		dc.w $000a
		dc.l xccdec
		dc.w $001b
		dc.l xccdf0
		dc.w $0010
		dc.l xccdf3
		dc.w $0019
		dc.l xccdf7
		dc.w $0011
		dc.l xccdfa
		dc.w $0012
		dc.l xccdfd
		dc.w $0013
		dc.l xcce00
		dc.w $0014
		dc.l xcce03
		dc.w $0015
		dc.l xcce06
		dc.w $0016
		dc.l xcce09
		dc.w $0017
		dc.l xcce0c
		dc.w $0018
		dc.l xcce0f
		dc.w $000e
		dc.l xcce14
		dc.w $000c
		dc.l xcce19
		dc.w $000b
		dc.l xcce1d
		dc.w $0004
		dc.l xcce22
		dc.w $000d
		dc.l xcce26
		dc.w $000d
		dc.l xcce2d
		dc.w $0003
		dc.l xcce33
		dc.w $0009
		dc.l xcce37
		dc.w $000f
		dc.l xcce3c
		dc.w $0001
xccdd6:
		dc.b 'BS',0
xccdd9:
		dc.b 'CLR',0
xccddd:
		dc.b 'DEL',0
xccde1:
		dc.b 'DOWN',0
xccde6:
		dc.b 'ENTER',0
xccdec:
		dc.b 'ESC',0
xccdf0:
		dc.b 'F1',0
xccdf3:
		dc.b 'F10',0
xccdf7:
		dc.b 'F2',0
xccdfa:
		dc.b 'F3',0
xccdfd:
		dc.b 'F4',0
xcce00:
		dc.b 'F5',0
xcce03:
		dc.b 'F6',0
xcce06:
		dc.b 'F7',0
xcce09:
		dc.b 'F8',0
xcce0c:
		dc.w 'F9',0
xcce0f:
		dc.b 'HELP',0
xcce14:
		dc.b 'HOME',0
xcce19:
		dc.b 'INS',0
xcce1d:
		dc.b 'LEFT',0
xcce22:
		dc.b 'RET',0
xcce26:
		dc.b 'RETURN',0
xcce2d:
		dc.b 'RIGHT',0
xcce33:
		dc.b 'TAB',0
xcce37:
		dc.b 'UNDO',0
xcce3c:
		dc.b 'UP',0
xcce3f:
		dc.b 1,0
xcce41:
		dc.b '^',0
xcce43:
		dc.b 7,0
		.even

	.bss

string: ds.b 32
