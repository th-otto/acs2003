		.text

		.globl ACSInitLineA
ACSInitLineA:
		movem.l    d3-d7/a2-a6,-(a7)
		dc.w       0xa000
		lea.l      Linea,a3
		move.l     a0,(a3)
		lea.l      -910(a0),a0
		lea.l      Vdiesc,a3
		move.l     a0,(a3)
		lea.l      Fonts,a3
		move.l     a1,(a3)
		lea.l      Linea_funp,a3
		move.l     a2,(a3)
		movem.l    (a7)+,d3-d7/a2-a6
		rts
