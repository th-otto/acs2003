		globl Bconout
		MODULE Bconout
		pea.l      (a2)
		move.w     d1,-(a7)
		move.w     d0,-(a7)
		move.w     #$0003,-(a7)
		trap       #13
		addq.w     #6,a7
		movea.l    (a7)+,a2
		rts
		ENDMOD

		globl Sversion
		MODULE Sversion
		pea.l      (a2)
		move.w     #$0030,-(a7) ; Sversion
		trap       #1
		addq.w     #2,a7
		movea.l    (a7)+,a2
		rts
		ENDMOD
		
				globl Super
				MODULE	Super
				pea		(a2)
				pea		(a0)
				move.w	#$20,-(a7)
				trap    #1
				addq.w	#6,a7
				move.l  (a7)+,a2
				rts
				ENDMOD

				globl Mxalloc
				MODULE	Mxalloc
				pea		(a2)
				move.w	d1,-(a7)
				move.l	d0,-(a7)
				move.w	#$44,-(a7)
				trap #1
				addq.w	#8,a7
				move.l	d0,a0
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Mfree
				MODULE	Mfree
				pea		(a2)
				pea		(a0)
				move.w	#$49,-(a7)
				trap #1
				addq.w	#6,a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Mavail
				MODULE	Mavail
				move.l  a2,-(a7)
				move.l	#-1,-(a7)
				move.w	#$48,-(a7)
				trap #1
				addq.w	#6,a7
				subq.l  #8,d0
				bpl.s   Mavail1
				clr.l   d0
Mavail1:
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Malloc
				MODULE	Malloc
				pea		(a2)
				move.l	d0,-(a7)
				move.w	#$48,-(a7)
				trap #1
				addq.w	#6,a7
				movea.l	d0,a0
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Fwrite
				MODULE	Fwrite
				movem.l    d0-d1/a0/a2,-(a7)
				move.w	#$40,(a7)
				trap #1
				lea		12(a7),a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Fseek
				MODULE	Fseek
				pea		(a2)
				move.w	d2,-(a7)
				move.w	d1,-(a7)
				move.l	d0,-(a7)
				move.w	#$42,-(a7)
				trap #1
				lea		10(a7),a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Fread
				MODULE	Fread
				movem.l    d0-d1/a0/a2,-(a7)
				move.w	#$3F,(a7)
				trap #1
				lea		12(a7),a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Fdatime
				MODULE	Fdatime
				pea		(a2)
				move.w	d1,-(a7)
				move.w	d0,-(a7)
				pea		(a0)
				move.w	#$57,-(a7)
				trap #1
				lea		10(a7),a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Fclose
				MODULE	Fclose
				pea		(a2)
				move.w	d0,-(a7)
				move.w	#$3E,-(a7)
				trap #1
				addq.w	#4,a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Dsetdrv
				MODULE	Dsetdrv
				pea		(a2)
				move.w	d0,-(a7)
				move.w	#$0E,-(a7)
				trap #1
				addq.w	#4,a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Dgetdrv
				MODULE	Dgetdrv
				pea		(a2)
				move.w	#$19,-(a7)
				trap #1
				addq.w	#2,a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Frename
				MODULE	Frename
				movem.l    a0-a2,-(a7)
				clr.w      -(a7)
				move.w	#$56,-(a7)
				trap #1
				lea		12(a7),a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Fopen
				MODULE	Fopen
				pea		(a2)
				move.w	d0,-(a7)
				pea		(a0)
				move.w	#$3D,-(a7)
				trap #1
				addq.w	#8,a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Fdelete
				MODULE	Fdelete
				pea		(a2)
				pea		(a0)
				move.w	#$41,-(a7)
				trap #1
				addq.w	#6,a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Fcreate
				MODULE	Fcreate
				pea		(a2)
				move.w	d0,-(a7)
				pea		(a0)
				move.w	#$3C,-(a7)
				trap #1
				addq.w	#8,a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Fattrib
				MODULE	Fattrib
				pea		(a2)
				move.w	d1,-(a7)
				move.w	d0,-(a7)
				pea		(a0)
				move.w	#$43,-(a7)
				trap #1
				lea		10(a7),a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Dsetpath
				MODULE	Dsetpath
				pea		(a2)
				pea		(a0)
				move.w	#$3B,-(a7)
				trap #1
				addq.w	#6,a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Dgetpath
				MODULE	Dgetpath
				pea		(a2)
				move.w	d0,-(a7)
				pea		(a0)
				move.w	#$47,-(a7)
				trap #1
				addq.w	#8,a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Ddelete
				MODULE	Ddelete
				pea		(a2)
				pea		(a0)
				move.w	#$3A,-(a7)
				trap #1
				addq.w	#6,a7
				move.l	(a7)+,a2
				rts
				ENDMOD

				globl Dcreate
				MODULE Dcreate
				pea		(a2)
				pea		(a0)
				move.w	#$39,-(a7)
				trap #1
				addq.w	#6,a7
				move.l	(a7)+,a2
				rts
				ENDMOD

		globl Tgettime
		MODULE Tgettime
		pea.l      (a2)
		move.w     #$002C,-(a7)
		trap       #1
		addq.w     #2,a7
		movea.l    (a7)+,a2
		rts
		ENDMOD

		EXPORT Tgetdate
		MODULE Tgetdate
		pea.l      (a2)
		move.w     #$002A,-(a7)
		trap       #1
		addq.w     #2,a7
		movea.l    (a7)+,a2
		rts
		ENDMOD

		EXPORT Supexec
		MODULE Supexec
		pea.l      (a2)
		pea.l      (a0)
		move.w     #$0026,-(a7)
		trap       #14
		addq.w     #6,a7
		movea.l    (a7)+,a2
		rts
		ENDMOD
