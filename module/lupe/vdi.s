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

		EXPORT v_show_c
		MODULE v_show_c
		move.w     d1,intin
		moveq.l    #122,d1
		moveq.l    #1,d2
		bra        _vdi
		ENDMOD

		EXPORT v_hide_c
		MODULE v_hide_c
		moveq.l    #123,d1
		moveq.l    #0,d2
		bra        _vdi
		ENDMOD
	
		EXPORT vs_clip
		MODULE vs_clip
		lea.l      ptsin,a1
		move.l     (a0)+,(a1)+
		move.l     (a0),(a1)
		move.w     d1,-548(a1)
		move.w     #129,d1
		move.l     #0x00020001,d2
		bra        _vdi
		ENDMOD
	
		EXPORT vr_trnfm
		MODULE vr_trnfm
		movem.l    a0-a1,contrl+14
		moveq.l    #110,d1
		moveq.l    #0,d2
		bra        _vdi
		ENDMOD

		EXPORT vro_cpyfm
		MODULE vro_cpyfm
		move.l     a0,vdipb+8
		lea.l      contrl+14,a0
		move.l     a1,(a0)+
		move.l     4(a7),(a0)
		move.w     d1,12(a0)
		moveq.l    #109,d1
		move.l     #0x00040001,d2
		bsr        _vdi
		move.l     #ptsin,vdipb+8
		rts
		ENDMOD
