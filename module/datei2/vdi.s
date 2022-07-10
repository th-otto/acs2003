		.data
		
vdipb:
		dc.l contrl
		dc.l intin
		dc.l ptsin
		dc.l intout
		dc.l ptsout

		.bss
contrl: ds.w 15
intin:  ds.w 132
intout: ds.w 140
ptsin:  ds.w 145
ptsout: ds.w 145


		.text
		
		MODULE _vdi
		lea.l      contrl,a0
		move.w     d0,12(a0)
		move.w     d1,(a0)+
		move.w     d2,4(a0)
		swap       d2
		move.w     d2,(a0)
		moveq.l    #115,d0
		move.l     #vdipb,d1
		pea.l      (a2)
		trap       #2
		movea.l    (a7)+,a2
		lea.l      intout,a0
		move.w     (a0)+,d0
		rts
		ENDMOD

		EXPORT vst_height
		MODULE vst_height
		pea.l      (a1)
		pea.l      (a0)
		lea.l      ptsin,a0
		clr.w      (a0)+
		move.w     d1,(a0)
		moveq.l    #12,d1
		move.l     #$00010000,d2
		bsr        _vdi
		lea.l      568(a0),a0
		movea.l    (a7)+,a1
		move.w     (a0)+,(a1)
		movea.l    (a7)+,a1
		move.w     (a0)+,(a1)
		movea.l    4(a7),a1
		move.w     (a0)+,(a1)
		movea.l    8(a7),a1
		move.w     (a0),(a1)
		rts
		ENDMOD

		EXPORT vst_font
		MODULE vst_font
		move.w     d1,intin
		moveq.l    #21,d1
		moveq.l    #1,d2
		bra        _vdi
		ENDMOD
	
		EXPORT vq_key_s
		MODULE vq_key_s
		pea.l      (a0)
		move.w     #$0080,d1
		moveq.l    #0,d2
		bsr        _vdi
		movea.l    (a7)+,a1
		move.w     d0,(a1)
		rts
		ENDMOD
