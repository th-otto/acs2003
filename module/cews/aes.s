	.data
pb:
	dc.l contrl
	dc.l global
	dc.l aes_intin
	dc.l aes_intout
	dc.l aes_addrin
	dc.l aes_addrout

	.bss
contrl: ds.w 15
global: ds.w 15
aes_intin: ds.w 132
aes_intout: ds.w 140
aes_addrin: ds.l 16
aes_addrout: ds.l 16

	.text

	EXPORT _aes
	MODULE _aes
	
	lea.l      contrl,a1
	pea.l      (a2)
	moveq.l    #0,d2
	move.l     d2,(a1)+
	move.l     d2,(a1)+
	move.w     d2,(a1)
	movep.l    d1,-7(a1)
	move.l     #pb,d1
	move.w     #$00C8,d0
	trap       #2
	lea.l      aes_intout,a0
	move.w     (a0)+,d0
	movea.l    (a7)+,a2
	rts
	
	ENDMOD

	EXPORT appl_write
	MODULE appl_write

	movem.w    d0-d1,aes_intin
	move.l     a0,aes_addrin
	moveq.l    #12,d0
	move.l     #$0C020101,d1
	bra        _aes

	ENDMOD

	EXPORT evnt_timer
	MODULE evnt_timer
	move.w     d0,aes_intin
	move.w     d1,aes_intin+2
	move.l     #$18020100,d1
	bra.w      _aes
	ENDMOD

	EXPORT graf_mkstate
	MODULE graf_mkstate		
	pea.l      (a1)
	pea.l      (a0)
	move.l     #$4F000500,d1
	bsr        _aes
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

	EXPORT evnt_mesag
	MODULE evnt_mesag
	move.l     a0,aes_addrin
	move.l     #$17000101,d1
	bra        _aes
	ENDMOD
	
	EXPORT form_center
	MODULE form_center
	pea.l      (a1)
	move.l     a0,aes_addrin
	move.l     #$36000501,d1
	bsr        _aes
	movea.l    (a7)+,a1
	move.w     (a0)+,(a1)
	movea.l    4(a7),a1
	move.w     (a0)+,(a1)
	move.l     8(a7),a1
	move.w     (a0)+,(a1)
	movea.l    12(a7),a1
	move.w     (a0),(a1)
	rts
	ENDMOD
	
	EXPORT form_dial
	MODULE form_dial

	lea.l      aes_intin,a1
	move.w     d0,(a1)+
	move.w     d1,(a1)+
	move.w     d2,(a1)+
	move.l     4(a7),(a1)+
	move.l     8(a7),(a1)+
	move.l     12(a7),(a1)
	move.l     #$33090100,d1
	bra        _aes

	ENDMOD

	EXPORT graf_mouse
	MODULE graf_mouse
	move.w     d0,aes_intin
	move.l     a0,aes_addrin
	move.l     #$4E010101,d1
	bra        _aes
	ENDMOD

	EXPORT objc_draw
	MODULE objc_draw
	lea.l      aes_intin,a1
	move.l     a0,544(a1)
	move.w     d0,(a1)+
	move.w     d1,(a1)+
	move.w     d2,(a1)+
	move.l     4(a7),(a1)+
	move.w     8(a7),(a1)
	move.l     #$2A060101,d1
	bra        _aes
	ENDMOD

	EXPORT objc_offset
	MODULE objc_offset
	pea.l      (a1)
	move.w     d0,aes_intin
	move.l     a0,aes_addrin
	move.l     #$2C010301,d1
	bsr        _aes
	movea.l    (a7)+,a1
	move.w     (a0)+,(a1)
	movea.l    4(a7),a1
	move.w     (a0),(a1)
	rts
	ENDMOD

	EXPORT objc_find
	MODULE objc_find
	lea.l      aes_intin,a1
	move.l     a0,544(a1)
	move.w     d0,(a1)+
	move.w     d1,(a1)+
	move.w     d2,(a1)+
	move.w     4(a7),(a1)
	move.l     #$2B040101,d1
	bra        _aes
	ENDMOD

	EXPORT wind_calc
	MODULE wind_calc
	pea.l      (a1)
	pea.l      (a0)
	lea.l      aes_intin,a1
	move.w     d0,(a1)+
	move.w     d1,(a1)+
	move.w     d2,(a1)+
	move.l     12(a7),(a1)+
	move.w     16(a7),(a1)
	move.l     #$6C060500,d1
	bsr        _aes
	movea.l    (a7)+,a1
	move.w     (a0)+,(a1)
	movea.l    (a7)+,a1
	move.w     (a0)+,(a1)
	movea.l    10(a7),a1
	move.w     (a0)+,(a1)
	movea.l    14(a7),a1
	move.w     (a0),(a1)
	rts
	ENDMOD

	EXPORT wind_get
	MODULE wind_get
	
	move.w     d1,-(a7)
	movem.w    d0-d1,aes_intin
	move.l     #$68020500,d1
	bsr        _aes
	move.l     a2,d2
	move.w     (a7)+,d1
	lea.l      4(a7),a1
	and.w      #$001F,d1
	move.b     wind_gettab(pc,d1.w),d1
	bra.s      wind_get2
wind_get1:
	movea.l    (a1)+,a2
	move.w     (a0)+,(a2)
wind_get2:
	dbf        d1,wind_get1
	movea.l    d2,a2
	rts
wind_gettab:
	dc.b    0,0,0,0
	dc.b	4,4,4,4
	dc.b	1,1,1,4
	dc.b	4,0,2,1
	dc.b	1,4,1,1
	dc.b	1,0

	ENDMOD

	EXPORT appl_find
	MODULE appl_find
	move.l     a0,aes_addrin
	move.l     #$0D000101,d1
	bra        _aes
	ENDMOD

	EXPORT form_alert
	MODULE form_alert
	move.w     d0,aes_intin
	move.l     a0,aes_addrin
	move.l     #$34010101,d1
	bra        _aes
	ENDMOD

	EXPORT wind_set
	MODULE wind_set
	lea        aes_intin,a1
	move.w     d0,(a1)+
	move.w     d1,(a1)+
	move.l     4(a7),(a1)+
	move.l     8(a7),(a1)
	moveq.l    #105,d0
	move.l     #$69060100,d1
	bra        _aes
	ENDMOD
