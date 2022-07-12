				globl Mavail
				MODULE	Mavail
				move.l  a2,-(a7)
				move.l	#-1,-(a7)
				move.w	#$48,-(a7)
				trap #1
				addq.l	#6,a7
				subq.l  #8,d0
				bpl.s   Mavail1
				clr.l   d0
Mavail1:
				move.l	(a7)+,a2
				rts
				ENDMOD

