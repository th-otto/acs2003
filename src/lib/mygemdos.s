		.text

mygemdos:
		movea.l    (0x000004F2).w,a0
		move.l     40(a0),d0
		cmpi.w     #0x0102,2(a0)
		bge.s      chg1
		move.w     28(a0),d0
		lea.l      (0x0000602C).w,a0
		lsr.w      #1,d0
		cmp.w      #0x0004,d0
		bne.s      chg01
		lea.l      0x0000873C,a0

chg01:
		move.l     a0,d0

chg1:
		movea.l    d0,a0
		move.l     (a0),oldpd
		move.l     a0,_run
		move.l     _BasPag,(a0)
		move.l     2(a7),oldret
		move.l     #post,2(a7)
		movea.l    oldvec,a0
		jmp        (a0)

post:
		movea.l    _run,a0
		move.l     oldpd,(a0)
		movea.l    oldret,a0
		jmp        (a0)

unset:
		move.l     sint7,(0x0000007C).w
		rts

int7:
		movem.l    a0-a1,-(a7)
		movea.l    sint7,a1
		movea.l    _run,a0
		move.l     oldpd,(a0)
		tst.w      (0x0000059E).w
		beq.s      short
		move.w     14(a7),-(a7)

short:
		pea.l      intret
		move.w     sr,-(a7)
		jmp        (a1)

intret:
		movea.l    _run,a0
		move.l     _BasPag,(a0)
		movem.l    (a7)+,a0-a1
		rte

	.globl accgemdos
accgemdos:
	.globl _accgemdos
_accgemdos:
		pea.l      mygemdos
		move.l     #0x00050021,-(a7)
		trap       #13
		addq.l     #8,a7
		move.l     d0,oldvec
		rts

	.globl oldgemdos
oldgemdos:
	.globl _oldgemdos
_oldgemdos:
		move.l     oldvec,-(a7)
		move.l     #0x00050021,-(a7)
		trap       #13
		addq.l     #8,a7
		rts

	.bss

oldret: ds.l 1
oldvec: ds.l 1
oldpd: ds.l 1
_run: ds.l 1
sint7: ds.l 1
