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

	EXPORT v_pline
	MODULE v_pline
	move.l     a0,vdipb+8
	move.w     d1,d2
	swap       d2
	clr.w      d2
	moveq.l    #6,d1
	bsr.w      _vdi
	move.l     #ptsin,vdipb+8
	rts
	ENDMOD

		EXPORT v_bar
		MODULE v_bar
	lea.l      ptsin,a1
	move.l     (a0)+,(a1)+
	move.l     (a0),(a1)
	moveq.l    #11,d1
	move.l     #$00020000,d2
	move.w     #1,-568(a1)
	bra        _vdi
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

		EXPORT vswr_mode
		MODULE vswr_mode
		move.w     d1,intin
		moveq.l    #32,d1
		moveq.l    #1,d2
		bra.w      _vdi
		ENDMOD

		EXPORT vst_rotation
		MODULE vst_rotation
		move.w     d1,intin
		moveq.l    #13,d1
		moveq.l    #1,d2
		bra.w      _vdi
		ENDMOD

		EXPORT vst_height
		MODULE vst_height
		pea.l      (a1)
		pea.l      (a0)
		lea.l      ptsin,a0
		clr.w      (a0)+
		move.w     d1,(a0)
		moveq.l    #12,d1
		move.l     #0x00010000,d2
		bsr.w      _vdi
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

		EXPORT vst_effects
		MODULE vst_effects
		move.w     d1,intin
		moveq.l    #106,d1
		moveq.l    #1,d2
		bra        _vdi
		ENDMOD

		EXPORT vst_color
		MODULE vst_color
		move.w     d1,intin
		moveq.l    #22,d1
		moveq.l    #1,d2
		bra        _vdi
		ENDMOD

		EXPORT vst_alignment
		MODULE vst_alignment
		pea.l      (a1)
		pea.l      (a0)
		movem.w    d1-d2,intin
		moveq.l    #39,d1
		moveq.l    #2,d2
		bsr        _vdi
		movea.l    (a7)+,a1
		move.w     d0,(a1)
		movea.l    (a7)+,a1
		move.w     (a0),(a1)
		rts
		ENDMOD

	EXPORT vsl_width
	MODULE vsl_width
	move.l     #$00010000,d2
	movem.w    d1-d2,ptsin
	moveq.l    #16,d1
	bsr        _vdi
	move.w     568(a0),d0
	rts
	ENDMOD

	EXPORT vsl_type
	MODULE vsl_type
	move.w     d1,intin
	moveq.l    #15,d1
	moveq.l    #1,d2
	bra        _vdi
	ENDMOD

	EXPORT vsl_ends
	MODULE vsl_ends
	movem.w    d1-d2,intin
	moveq.l    #108,d1
	moveq.l    #2,d2
	bra        _vdi
	ENDMOD

	EXPORT vsl_color
	MODULE vsl_color
	move.w     d1,intin
	moveq.l    #17,d1
	moveq.l    #1,d2
	bra        _vdi
	ENDMOD

	EXPORT vsf_style
	MODULE vsf_style
	move.w     d1,intin
	moveq.l    #24,d1
	moveq.l    #1,d2
	bra        _vdi
	ENDMOD

		EXPORT vsf_perimeter
		MODULE vsf_perimeter
	move.w     d1,intin
	moveq.l    #104,d1
	moveq.l    #1,d2
	bra        _vdi
		ENDMOD

		EXPORT vsf_interior
		MODULE vsf_interior
	move.w     d1,intin
	moveq.l    #23,d1
	moveq.l    #1,d2
	bra        _vdi
		ENDMOD

		EXPORT vsf_color
		MODULE vsf_color
	move.w     d1,intin
	moveq.l    #25,d1
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

		GLOBL vr_recfl
		MODULE vr_recfl
	lea.l      ptsin,a1
	move.l     (a0)+,(a1)+
	move.l     (a0),(a1)
	moveq.l    #114,d1
	move.l     #$00020000,d2
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

		EXPORT v_gtext
		MODULE v_gtext
		lea.l      intin,a1
		movem.w    d1-d2,544(a1)
		move.l     #$00010000,d2
		moveq.l    #0,d1
		bra.s      v_gtext2
v_gtext1:
		move.w     d1,(a1)+
		addq.w     #1,d2
v_gtext2:
		move.b     (a0)+,d1
		bne.s      v_gtext1
		moveq.l    #8,d1
		bra        _vdi
		ENDMOD
