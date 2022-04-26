	.globl INbackplan
INbackplan:
		move.w     init,d0
		addq.w     #1,init
		tst.w      d0
		beq.s      INbackplan_1
		rts
INbackplan_1:
		jsr        Logbase
		move.l     a0,screen
		jsr        ACSInitLineA
		movea.l    Vdiesc,a0
		move.w     908(a0),bytes_lin
		movea.l    Vdiesc,a0
		move.w     218(a0),max_x
		movea.l    Vdiesc,a0
		move.w     220(a0),max_y
		movea.l    Vdiesc,a0
		move.w     906(a0),v_rez_vt
		movea.l    Vdiesc,a0
		move.w     898(a0),v_rez_hz
		rts

	.globl Abp_create
Abp_create:
		lea.l      -14(a7),a7
		move.w     d0,12(a7)
		move.w     d1,10(a7)
		moveq.l    #15,d0
		add.w      12(a7),d0
		asr.w      #4,d0
		move.w     d0,4(a7)
		move.w     10(a7),d0
		movea.l    ACSblk,a0
		muls.w     28(a0),d0
		ext.l      d0
		add.l      d0,d0
		move.w     4(a7),d1
		ext.l      d1
		jsr        _lmul
		add.l      #$00000014,d0
		move.l     d0,6(a7)
		move.l     6(a7),d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Abp_create_1
		move.l     6(a7),d1
		clr.w      d0
		movea.l    (a7),a0
		jsr        memset
		movea.l    (a7),a0
		lea.l      20(a0),a0
		movea.l    (a7),a1
		move.l     a0,(a1)
		movea.l    (a7),a0
		move.w     12(a7),4(a0)
		movea.l    (a7),a0
		move.w     10(a7),6(a0)
		movea.l    (a7),a0
		move.w     4(a7),8(a0)
		movea.l    ACSblk,a0
		movea.l    (a7),a1
		move.w     28(a0),12(a1)
Abp_create_1:
		movea.l    (a7),a0
		lea.l      14(a7),a7
		rts

	.globl Abp_delete
Abp_delete:
		subq.w     #4,a7
		move.l     a0,(a7)
		moveq.l    #20,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		addq.w     #4,a7
		rts

ret:
		rts

	.globl Abp_start
Abp_start:
		subq.w     #4,a7
		move.l     a0,(a7)
		move.w     init,d0
		bne.s      Abp_start_1
		bsr        INbackplan
Abp_start_1:
		jsr        Amo_hide
		jsr        Kbdvbase
		move.l     a0,vectors
		movea.l    vectors,a0
		move.l     16(a0),kb_mousevec
		movea.l    vectors,a0
		move.l     #ret,16(a0)
		moveq.l    #-1,d0
		/* movea.l    #$FFFFFFFF,a1 */
		dc.w 0x227c,-1,-1
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        Setscreen
		movea.l    (a7),a0
		move.w     8(a0),d0
		add.w      d0,d0
		movea.l    (a7),a0
		muls.w     12(a0),d0
		movea.l    Vdiesc,a0
		move.w     d0,908(a0)
		movea.l    Linea,a0
		move.w     d0,2(a0)
		movea.l    (a7),a0
		movea.l    Vdiesc,a1
		move.w     6(a0),906(a1)
		movea.l    (a7),a0
		movea.l    Vdiesc,a1
		move.w     4(a0),898(a1)
		moveq.l    #-1,d0
		movea.l    (a7),a0
		add.w      4(a0),d0
		movea.l    Vdiesc,a0
		move.w     d0,218(a0)
		move.w     d0,pxy+4
		moveq.l    #-1,d0
		movea.l    (a7),a0
		add.w      6(a0),d0
		movea.l    Vdiesc,a0
		move.w     d0,220(a0)
		move.w     d0,pxy+6
		lea.l      pxy,a0
		moveq.l    #1,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		addq.w     #4,a7
		rts

	.globl Abp_end
Abp_end:
		move.w     bytes_lin,d0
		movea.l    Linea,a0
		move.w     d0,2(a0)
		movea.l    Vdiesc,a0
		move.w     d0,908(a0)
		movea.l    Vdiesc,a0
		move.w     v_rez_vt,906(a0)
		movea.l    Vdiesc,a0
		move.w     v_rez_hz,898(a0)
		move.w     max_x,d0
		movea.l    Vdiesc,a0
		move.w     d0,218(a0)
		move.w     d0,pxy+4
		move.w     max_y,d0
		movea.l    Vdiesc,a0
		move.w     d0,220(a0)
		move.w     d0,pxy+6
		moveq.l    #-1,d0
		/* movea.l    #$FFFFFFFF,a1 */
		dc.w 0x227c,-1,-1
		movea.l    screen,a0
		jsr        Setscreen
		movea.l    vectors,a0
		move.l     kb_mousevec,16(a0)
		lea.l      pxy,a0
		moveq.l    #1,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		jsr        Amo_show
		rts

	.globl Abp_mfdb2img
Abp_mfdb2img:
		move.l     a2,-(a7)
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		movea.l    8(a7),a0
		move.w     6(a0),d1
		movea.l    8(a7),a0
		move.w     4(a0),d0
		bsr        Abp_create
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Abp_mfdb2img_1
		moveq.l    #-1,d0
		bra        Abp_mfdb2img_2
Abp_mfdb2img_1:
		movea.l    (a7),a0
		move.w     #$0001,10(a0)
		movea.l    8(a7),a0
		move.w     10(a0),d0
		beq.s      Abp_mfdb2img_3
		movea.l    (a7),a0
		move.w     8(a0),d0
		add.w      d0,d0
		movea.l    (a7),a0
		muls.w     6(a0),d0
		movea.l    (a7),a0
		muls.w     12(a0),d0
		ext.l      d0
		add.l      #$00000014,d0
		movea.l    8(a7),a1
		movea.l    (a7),a0
		jsr        memcpy
		bra.s      Abp_mfdb2img_4
Abp_mfdb2img_3:
		movea.l    (a7),a1
		movea.l    8(a7),a0
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vr_trnfm
Abp_mfdb2img_4:
		suba.l     a1,a1
		movea.l    (a7),a0
		jsr        compress_image
		movea.l    20(a7),a0
		move.l     d0,(a0)
		movea.l    (a7),a0
		bsr        Abp_delete
		move.l     4(a7),d0
		bne.s      Abp_mfdb2img_5
		clr.w      d0
		bra        Abp_mfdb2img_2
Abp_mfdb2img_5:
		moveq.l    #16,d0
		movea.l    20(a7),a0
		add.l      (a0),d0
		jsr        Ax_malloc
		movea.l    4(a7),a1
		move.l     a0,(a1)
		movea.l    4(a7),a0
		move.l     (a0),d0
		bne.s      Abp_mfdb2img_6
		moveq.l    #-1,d0
		bra        Abp_mfdb2img_2
Abp_mfdb2img_6:
		movea.l    8(a7),a0
		move.w     6(a0),d1
		movea.l    8(a7),a0
		move.w     4(a0),d0
		bsr        Abp_create
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Abp_mfdb2img_7
		movea.l    4(a7),a0
		movea.l    (a0),a0
		jsr        Ax_ifree
		moveq.l    #-1,d0
		bra        Abp_mfdb2img_2
Abp_mfdb2img_7:
		movea.l    (a7),a0
		move.w     #$0001,10(a0)
		movea.l    8(a7),a0
		move.w     10(a0),d0
		beq.s      Abp_mfdb2img_8
		movea.l    (a7),a0
		move.w     8(a0),d0
		add.w      d0,d0
		movea.l    (a7),a0
		muls.w     6(a0),d0
		movea.l    (a7),a0
		muls.w     12(a0),d0
		ext.l      d0
		add.l      #$00000014,d0
		movea.l    8(a7),a1
		movea.l    (a7),a0
		jsr        memcpy
		bra.s      Abp_mfdb2img_9
Abp_mfdb2img_8:
		movea.l    (a7),a1
		movea.l    8(a7),a0
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vr_trnfm
Abp_mfdb2img_9:
		movea.l    4(a7),a0
		movea.l    (a0),a1
		movea.l    (a7),a0
		jsr        compress_image
		movea.l    4(a7),a0
		movea.l    (a0),a0
		move.w     #$0001,(a0)
		movea.l    4(a7),a0
		movea.l    (a0),a0
		move.w     #$0008,2(a0)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		movea.l    (a1),a1
		move.w     12(a0),4(a1)
		movea.l    4(a7),a0
		movea.l    (a0),a0
		move.w     #$0002,6(a0)
		move.w     #$01F4,d0
		movea.l    4(a7),a0
		movea.l    (a0),a0
		move.w     d0,10(a0)
		movea.l    4(a7),a0
		movea.l    (a0),a0
		move.w     d0,8(a0)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		movea.l    (a1),a1
		move.w     4(a0),12(a1)
		movea.l    (a7),a0
		movea.l    4(a7),a1
		movea.l    (a1),a1
		move.w     6(a0),14(a1)
		movea.l    (a7),a0
		bsr        Abp_delete
		clr.w      d0
Abp_mfdb2img_2:
		lea.l      12(a7),a7
		movea.l    (a7)+,a2
		rts

compress_image:
		lea.l      -172(a7),a7
		move.l     a0,168(a7)
		move.l     a1,164(a7)
		move.l     164(a7),d0
		bne.s      compress_image_1
		clr.l      160(a7)
		bra.s      compress_image_2
compress_image_1:
		movea.l    164(a7),a0
		lea.l      16(a0),a0
		move.l     a0,160(a7)
compress_image_2:
		moveq.l    #7,d0
		movea.l    168(a7),a0
		add.w      4(a0),d0
		asr.w      #3,d0
		move.w     d0,150(a7)
		movea.l    168(a7),a0
		move.w     8(a0),152(a7)
		move.w     152(a7),d0
		add.w      d0,d0
		ext.l      d0
		movea.l    168(a7),a0
		move.w     6(a0),d1
		ext.l      d1
		jsr        _lmul
		move.l     d0,4(a7)
		movea.l    168(a7),a0
		move.l     (a0),140(a7)
		clr.b      146(a7)
		bra.s      compress_image_3
compress_image_4:
		clr.w      d0
		move.b     146(a7),d0
		ext.l      d0
		move.l     4(a7),d1
		jsr        _lmul
		movea.l    140(a7),a0
		adda.l     d0,a0
		clr.w      d0
		move.b     146(a7),d0
		lsl.w      #2,d0
		move.l     a0,8(a7,d0.w)
		addq.b     #1,146(a7)
compress_image_3:
		clr.w      d0
		move.b     146(a7),d0
		movea.l    168(a7),a0
		cmp.w      12(a0),d0
		blt.s      compress_image_4
		clr.l      (a7)
		movea.l    168(a7),a0
		move.w     6(a0),156(a7)
		bra        compress_image_5
compress_image_33:
		move.w     150(a7),d1
		movea.l    168(a7),a0
		move.w     12(a0),d0
		lea.l      8(a7),a0
		jsr        vreplic
		move.b     d0,148(a7)
		cmpi.b     #$01,148(a7)
		bls.s      compress_image_6
		clr.w      d0
		move.b     148(a7),d0
		cmp.w      156(a7),d0
		ble.s      compress_image_7
		move.b     157(a7),148(a7)
compress_image_7:
		addq.l     #4,(a7)
		move.l     160(a7),d0
		beq.s      compress_image_6
		movea.l    160(a7),a0
		addq.l     #1,160(a7)
		clr.b      (a0)
		movea.l    160(a7),a0
		addq.l     #1,160(a7)
		clr.b      (a0)
		movea.l    160(a7),a0
		addq.l     #1,160(a7)
		/* move.b     #$FF,(a0) */
		dc.w 0x10bc,0xffff
		movea.l    160(a7),a0
		addq.l     #1,160(a7)
		move.b     148(a7),(a0)
compress_image_6:
		clr.w      158(a7)
		bra        compress_image_8
compress_image_32:
		move.w     150(a7),154(a7)
		move.w     158(a7),d0
		lsl.w      #2,d0
		move.l     8(a7,d0.w),140(a7)
		bra        compress_image_9
compress_image_31:
		clr.b      147(a7)
		movea.l    140(a7),a0
		move.b     (a0),d0
		bne.s      compress_image_10
compress_image_12:
		subq.w     #1,154(a7)
		addq.b     #1,147(a7)
		addq.l     #1,140(a7)
		movea.l    140(a7),a0
		move.b     (a0),d0
		bne.s      compress_image_11
		cmpi.b     #$7F,147(a7)
		bcc.s      compress_image_11
		move.w     154(a7),d0
		bgt.s      compress_image_12
compress_image_11:
		addq.l     #1,(a7)
		move.l     160(a7),d0
		beq.s      compress_image_13
		movea.l    160(a7),a0
		addq.l     #1,160(a7)
		move.b     147(a7),(a0)
compress_image_13:
		bra        compress_image_9
compress_image_10:
		movea.l    140(a7),a0
		cmpi.b     #$FF,(a0)
		bne.s      compress_image_14
compress_image_16:
		subq.w     #1,154(a7)
		addq.b     #1,147(a7)
		addq.l     #1,140(a7)
		movea.l    140(a7),a0
		cmpi.b     #$FF,(a0)
		bne.s      compress_image_15
		cmpi.b     #$7F,147(a7)
		bcc.s      compress_image_15
		move.w     154(a7),d0
		bgt.s      compress_image_16
compress_image_15:
		addq.l     #1,(a7)
		move.l     160(a7),d0
		beq.s      compress_image_17
		moveq.l    #-128,d0
		or.b       147(a7),d0
		movea.l    160(a7),a0
		addq.l     #1,160(a7)
		move.b     d0,(a0)
compress_image_17:
		bra        compress_image_9
compress_image_14:
		movea.l    140(a7),a0
		move.b     (a0),145(a7)
		movea.l    140(a7),a0
		move.b     1(a0),144(a7)
		cmpi.w     #$0003,154(a7)
		ble        compress_image_18
		movea.l    140(a7),a0
		move.b     145(a7),d0
		cmp.b      2(a0),d0
		bne        compress_image_18
		movea.l    140(a7),a0
		move.b     144(a7),d0
		cmp.b      3(a0),d0
		bne.w      compress_image_18
		move.b     #$01,147(a7)
		addq.l     #2,140(a7)
		subq.w     #2,154(a7)
compress_image_20:
		subq.w     #2,154(a7)
		addq.b     #1,147(a7)
		addq.l     #2,140(a7)
		movea.l    140(a7),a0
		move.b     145(a7),d0
		cmp.b      (a0),d0
		bne.s      compress_image_19
		movea.l    140(a7),a0
		move.b     144(a7),d0
		cmp.b      1(a0),d0
		bne.s      compress_image_19
		cmpi.b     #$FE,147(a7)
		bcc.s      compress_image_19
		cmpi.w     #$0001,154(a7)
		bgt.s      compress_image_20
compress_image_19:
		addq.l     #4,(a7)
		move.l     160(a7),d0
		beq.s      compress_image_21
		movea.l    160(a7),a0
		addq.l     #1,160(a7)
		clr.b      (a0)
		movea.l    160(a7),a0
		addq.l     #1,160(a7)
		move.b     147(a7),(a0)
		movea.l    160(a7),a0
		addq.l     #1,160(a7)
		move.b     145(a7),(a0)
		movea.l    160(a7),a0
		addq.l     #1,160(a7)
		move.b     144(a7),(a0)
compress_image_21:
		bra        compress_image_9
compress_image_18:
		move.l     140(a7),136(a7)
		bra        compress_image_22
compress_image_28:
		subq.w     #1,154(a7)
		addq.b     #1,147(a7)
		addq.l     #1,140(a7)
		move.w     154(a7),d0
		beq.s      compress_image_23
		cmpi.b     #$FF,147(a7)
		bne.s      compress_image_24
compress_image_23:
		bra        compress_image_25
compress_image_24:
		cmpi.w     #$0002,154(a7)
		ble.w      compress_image_22
		movea.l    140(a7),a0
		move.b     (a0),d0
		bne.s      compress_image_26
		movea.l    140(a7),a0
		move.b     1(a0),d0
		bne.s      compress_image_26
		movea.l    140(a7),a0
		move.b     2(a0),d0
		bne.s      compress_image_26
		bra.s      compress_image_25
compress_image_26:
		movea.l    140(a7),a0
		cmpi.b     #$FF,(a0)
		bne.s      compress_image_27
		movea.l    140(a7),a0
		cmpi.b     #$FF,1(a0)
		bne.s      compress_image_27
		movea.l    140(a7),a0
		cmpi.b     #$FF,2(a0)
		bne.s      compress_image_27
		bra.s      compress_image_25
compress_image_27:
		cmpi.w     #$0004,154(a7)
		ble.s      compress_image_22
		movea.l    140(a7),a0
		move.b     (a0),145(a7)
		movea.l    140(a7),a0
		move.b     1(a0),144(a7)
		movea.l    140(a7),a0
		move.b     2(a0),d0
		cmp.b      145(a7),d0
		bne.s      compress_image_22
		movea.l    140(a7),a0
		move.b     3(a0),d0
		cmp.b      144(a7),d0
		bne.s      compress_image_22
		bra.s      compress_image_25
compress_image_22:
		bra        compress_image_28
compress_image_25:
		clr.w      d0
		move.b     147(a7),d0
		addq.w     #2,d0
		ext.l      d0
		add.l      d0,(a7)
		move.l     160(a7),d0
		beq.s      compress_image_9
		movea.l    160(a7),a0
		addq.l     #1,160(a7)
		/* move.b     #$80,(a0) */
		dc.w 0x10bc,0xff80
		movea.l    160(a7),a0
		addq.l     #1,160(a7)
		move.b     147(a7),(a0)
		bra.s      compress_image_29
compress_image_30:
		movea.l    136(a7),a0
		addq.l     #1,136(a7)
		movea.l    160(a7),a1
		addq.l     #1,160(a7)
		move.b     (a0),(a1)
compress_image_29:
		move.b     147(a7),d0
		subq.b     #1,147(a7)
		tst.b      d0
		bne.s      compress_image_30
compress_image_9:
		move.w     154(a7),d0
		bgt        compress_image_31
		moveq.l    #0,d0
		move.b     148(a7),d0
		move.w     152(a7),d1
		ext.l      d1
		jsr        _lmul
		add.l      d0,d0
		move.w     158(a7),d1
		lsl.w      #2,d1
		add.l      d0,8(a7,d1.w)
		addq.w     #1,158(a7)
compress_image_8:
		movea.l    168(a7),a0
		move.w     158(a7),d0
		cmp.w      12(a0),d0
		blt        compress_image_32
		clr.w      d0
		move.b     148(a7),d0
		sub.w      d0,156(a7)
compress_image_5:
		move.w     156(a7),d0
		bgt        compress_image_33
		move.l     (a7),d0
		lea.l      172(a7),a7
		rts

vreplic:
		lea.l      -152(a7),a7
		move.l     a0,148(a7)
		move.w     d0,146(a7)
		move.w     d1,144(a7)
		move.w     144(a7),(a7)
		moveq.l    #1,d0
		and.w      144(a7),d0
		beq.s      vreplic_1
		addq.w     #1,(a7)
vreplic_1:
		move.b     #$01,2(a7)
		moveq.l    #-1,d0
		add.w      146(a7),d0
		move.w     d0,142(a7)
		bra.s      vreplic_2
vreplic_3:
		move.w     (a7),d0
		move.w     142(a7),d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    148(a7),a0
		movea.l    0(a0,d1.l),a0
		adda.w     d0,a0
		move.w     142(a7),d0
		lsl.w      #2,d0
		move.l     a0,12(a7,d0.w)
		subq.w     #1,142(a7)
vreplic_2:
		move.w     142(a7),d0
		bpl.s      vreplic_3
		bra.w      vreplic_4
vreplic_11:
		moveq.l    #-1,d0
		add.w      146(a7),d0
		move.w     d0,142(a7)
		bra.s      vreplic_5
vreplic_10:
		move.w     142(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    148(a7),a0
		move.l     0(a0,d0.l),8(a7)
		move.w     142(a7),d0
		lsl.w      #2,d0
		move.l     12(a7,d0.w),4(a7)
		moveq.l    #-1,d0
		add.w      144(a7),d0
		move.w     d0,140(a7)
		bra.s      vreplic_6
vreplic_9:
		movea.l    8(a7),a0
		addq.l     #1,8(a7)
		move.b     (a0),d0
		movea.l    4(a7),a0
		addq.l     #1,4(a7)
		cmp.b      (a0),d0
		beq.s      vreplic_7
		move.b     2(a7),d0
		bra.s      vreplic_8
vreplic_7:
		subq.w     #1,140(a7)
vreplic_6:
		move.w     140(a7),d0
		bpl.s      vreplic_9
		move.w     (a7),d0
		ext.l      d0
		move.w     142(a7),d1
		lsl.w      #2,d1
		add.l      d0,12(a7,d1.w)
		subq.w     #1,142(a7)
vreplic_5:
		move.w     142(a7),d0
		bpl.s      vreplic_10
		addq.b     #1,2(a7)
vreplic_4:
		cmpi.b     #$FF,2(a7)
		bcs.w      vreplic_11
		move.b     2(a7),d0
vreplic_8:
		lea.l      152(a7),a7
		rts

	.globl Abp_img2mfdb
Abp_img2mfdb:
		move.l     a2,-(a7)
		lea.l      -62(a7),a7
		move.l     a0,58(a7)
		move.l     a1,54(a7)
		move.w     d0,52(a7)
		movea.l    58(a7),a0
		move.w     14(a0),d1
		movea.l    58(a7),a0
		move.w     12(a0),d0
		bsr        Abp_create
		movea.l    54(a7),a1
		move.l     a0,(a1)
		bne.s      Abp_img2mfdb_1
		moveq.l    #-1,d0
		bra        Abp_img2mfdb_2
Abp_img2mfdb_1:
		movea.l    58(a7),a0
		move.w     12(a0),36(a7)
		movea.l    58(a7),a0
		move.w     14(a0),38(a7)
		moveq.l    #15,d0
		movea.l    58(a7),a0
		add.w      12(a0),d0
		and.w      #$FFF0,d0
		lsr.w      #4,d0
		move.w     d0,40(a7)
		move.w     #$0001,42(a7)
		movea.l    ACSblk,a0
		move.w     28(a0),44(a7)
		movea.l    ACSblk,a0
		move.w     28(a0),d0
		movea.l    58(a7),a0
		cmp.w      4(a0),d0
		ble.s      Abp_img2mfdb_3
		movea.l    ACSblk,a0
		move.w     28(a0),26(a7)
		bra.s      Abp_img2mfdb_4
Abp_img2mfdb_3:
		movea.l    58(a7),a0
		move.w     4(a0),26(a7)
Abp_img2mfdb_4:
		clr.w      d0
		move.w     d0,50(a7)
		move.w     d0,48(a7)
		move.w     d0,46(a7)
		move.w     40(a7),d0
		ext.l      d0
		move.w     38(a7),d1
		ext.l      d1
		jsr        _lmul
		add.l      d0,d0
		move.l     d0,28(a7)
		move.l     28(a7),d0
		move.w     26(a7),d1
		ext.l      d1
		jsr        _lmul
		addq.l     #1,d0
		jsr        Ax_malloc
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Abp_img2mfdb_5
		movea.l    54(a7),a0
		movea.l    (a0),a0
		bsr        Abp_delete
		moveq.l    #-1,d0
		bra        Abp_img2mfdb_2
Abp_img2mfdb_5:
		move.l     4(a7),32(a7)
		movea.l    58(a7),a0
		move.w     2(a0),d0
		ext.l      d0
		add.l      d0,d0
		movea.l    58(a7),a0
		adda.l     d0,a0
		move.l     a0,(a7)
		move.l     28(a7),d0
		move.w     26(a7),d1
		ext.l      d1
		jsr        _lmul
		movea.l    4(a7),a0
		pea.l      0(a0,d0.l)
		move.l     8(a7),-(a7)
		movea.l    8(a7),a1
		movea.l    66(a7),a0
		jsr        uncompress_image
		addq.w     #8,a7
		move.w     52(a7),d0
		beq        Abp_img2mfdb_6
		movea.l    ACSblk,a0
		move.w     28(a0),d0
		movea.l    58(a7),a0
		sub.w      4(a0),d0
		move.w     d0,8(a7)
		move.w     8(a7),d0
		ble        Abp_img2mfdb_7
		movea.l    58(a7),a0
		cmpi.w     #$0001,4(a0)
		bne        Abp_img2mfdb_8
		move.w     #$0001,44(a7)
		lea.l      32(a7),a1
		lea.l      32(a7),a0
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vr_trnfm
		clr.w      d0
		move.w     d0,20(a7)
		move.w     d0,18(a7)
		move.w     d0,12(a7)
		move.w     d0,10(a7)
		moveq.l    #-1,d0
		movea.l    54(a7),a0
		movea.l    (a0),a0
		add.w      4(a0),d0
		move.w     d0,22(a7)
		move.w     d0,14(a7)
		moveq.l    #-1,d0
		movea.l    54(a7),a0
		movea.l    (a0),a0
		add.w      6(a0),d0
		move.w     d0,24(a7)
		move.w     d0,16(a7)
		pea.l      color
		movea.l    58(a7),a0
		move.l     (a0),-(a7)
		lea.l      40(a7),a1
		lea.l      18(a7),a0
		moveq.l    #1,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vrt_cpyfm
		addq.w     #8,a7
		bra.s      Abp_img2mfdb_9
Abp_img2mfdb_8:
		move.w     8(a7),d0
		ext.l      d0
		move.l     28(a7),d1
		jsr        _lmul
		move.l     d0,d1
		clr.w      d0
		move.l     d1,-(a7)
		move.w     d0,-(a7)
		movea.l    64(a7),a0
		move.w     4(a0),d0
		ext.l      d0
		move.l     34(a7),d1
		jsr        _lmul
		movea.l    10(a7),a0
		adda.l     d0,a0
		move.w     (a7)+,d0
		move.l     (a7)+,d1
		jsr        memset
		movea.l    54(a7),a0
		movea.l    (a0),a1
		lea.l      32(a7),a0
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vr_trnfm
Abp_img2mfdb_9:
		bra.s      Abp_img2mfdb_10
Abp_img2mfdb_7:
		movea.l    54(a7),a0
		movea.l    (a0),a1
		lea.l      32(a7),a0
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vr_trnfm
Abp_img2mfdb_10:
		movea.l    54(a7),a0
		movea.l    (a0),a0
		clr.w      10(a0)
		bra.s      Abp_img2mfdb_11
Abp_img2mfdb_6:
		move.l     28(a7),d0
		move.w     26(a7),d1
		ext.l      d1
		jsr        _lmul
		movea.l    4(a7),a1
		movea.l    54(a7),a0
		movea.l    (a0),a0
		movea.l    (a0),a0
		jsr        memcpy
		movea.l    54(a7),a0
		movea.l    (a0),a0
		move.w     #$0001,10(a0)
Abp_img2mfdb_11:
		movea.l    4(a7),a0
		jsr        Ax_ifree
		clr.w      d0
Abp_img2mfdb_2:
		lea.l      62(a7),a7
		movea.l    (a7)+,a2
		rts

uncompress_image:
		lea.l      -162(a7),a7
		move.l     a0,158(a7)
		move.l     a1,154(a7)
		moveq.l    #7,d0
		movea.l    158(a7),a0
		add.w      12(a0),d0
		asr.w      #3,d0
		move.w     d0,146(a7)
		moveq.l    #1,d0
		add.w      146(a7),d0
		and.w      #$FFFE,d0
		move.w     d0,144(a7)
		move.w     144(a7),d0
		ext.l      d0
		movea.l    158(a7),a0
		move.w     14(a0),d1
		ext.l      d1
		jsr        _lmul
		move.l     d0,(a7)
		clr.b      142(a7)
		bra.s      uncompress_image_1
uncompress_image_2:
		clr.w      d0
		move.b     142(a7),d0
		ext.l      d0
		move.l     (a7),d1
		jsr        _lmul
		movea.l    166(a7),a0
		adda.l     d0,a0
		clr.w      d0
		move.b     142(a7),d0
		lsl.w      #2,d0
		move.l     a0,4(a7,d0.w)
		addq.b     #1,142(a7)
uncompress_image_1:
		clr.w      d0
		move.b     142(a7),d0
		movea.l    158(a7),a0
		cmp.w      4(a0),d0
		blt.s      uncompress_image_2
		movea.l    158(a7),a0
		move.w     14(a0),150(a7)
		bra        uncompress_image_3
uncompress_image_30:
		clr.b      143(a7)
		clr.w      152(a7)
		bra        uncompress_image_4
uncompress_image_29:
		move.w     146(a7),148(a7)
		move.w     152(a7),d0
		lsl.w      #2,d0
		movea.l    4(a7,d0.w),a0
		move.l     a0,132(a7)
		move.l     a0,136(a7)
		movea.l    132(a7),a0
		cmpa.l     170(a7),a0
		bcs.s      uncompress_image_5
		suba.l     a0,a0
		moveq.l    #21,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		bra        uncompress_image_6
uncompress_image_5:
		bra        uncompress_image_7
uncompress_image_24:
		movea.l    154(a7),a0
		addq.l     #1,154(a7)
		clr.w      d0
		move.b     (a0),d0
		tst.w      d0
		beq.s      uncompress_image_8
		sub.w      #$0080,d0
		beq        uncompress_image_9
		bra        uncompress_image_10
uncompress_image_8:
		movea.l    154(a7),a0
		addq.l     #1,154(a7)
		move.b     (a0),142(a7)
		move.b     142(a7),d0
		bne.s      uncompress_image_11
		movea.l    154(a7),a0
		cmpi.b     #$FF,(a0)
		bne.s      uncompress_image_12
		addq.l     #1,154(a7)
uncompress_image_12:
		movea.l    154(a7),a0
		addq.l     #1,154(a7)
		move.b     (a0),d0
		add.b      #$FF,d0
		move.b     d0,143(a7)
		bra.s      uncompress_image_13
uncompress_image_11:
		bra.s      uncompress_image_14
uncompress_image_17:
		clr.b      141(a7)
		bra.s      uncompress_image_15
uncompress_image_16:
		moveq.l    #0,d0
		move.b     141(a7),d0
		movea.l    154(a7),a0
		movea.l    132(a7),a1
		addq.l     #1,132(a7)
		move.b     0(a0,d0.l),(a1)
		subq.w     #1,148(a7)
		addq.b     #1,141(a7)
uncompress_image_15:
		clr.w      d0
		move.b     141(a7),d0
		movea.l    158(a7),a0
		cmp.w      6(a0),d0
		blt.s      uncompress_image_16
		subq.b     #1,142(a7)
uncompress_image_14:
		move.b     142(a7),d0
		bne.s      uncompress_image_17
		movea.l    158(a7),a0
		move.w     6(a0),d0
		ext.l      d0
		add.l      d0,154(a7)
uncompress_image_13:
		bra.w      uncompress_image_7
uncompress_image_9:
		movea.l    154(a7),a0
		addq.l     #1,154(a7)
		move.b     (a0),142(a7)
		bra.s      uncompress_image_18
uncompress_image_19:
		movea.l    154(a7),a0
		addq.l     #1,154(a7)
		movea.l    132(a7),a1
		addq.l     #1,132(a7)
		move.b     (a0),(a1)
		subq.w     #1,148(a7)
		subq.b     #1,142(a7)
uncompress_image_18:
		move.b     142(a7),d0
		bne.s      uncompress_image_19
		bra.s      uncompress_image_7
uncompress_image_10:
		movea.l    154(a7),a0
		move.b     -1(a0),142(a7)
		move.b     #$80,d0
		and.b      142(a7),d0
		beq.s      uncompress_image_20
		move.b     #$FF,140(a7)
		andi.b     #$7F,142(a7)
		bra.s      uncompress_image_21
uncompress_image_20:
		clr.b      140(a7)
uncompress_image_21:
		bra.s      uncompress_image_22
uncompress_image_23:
		movea.l    132(a7),a0
		addq.l     #1,132(a7)
		move.b     140(a7),(a0)
		subq.w     #1,148(a7)
		subq.b     #1,142(a7)
uncompress_image_22:
		move.b     142(a7),d0
		bne.s      uncompress_image_23
uncompress_image_7:
		move.w     148(a7),d0
		bgt        uncompress_image_24
		moveq.l    #1,d0
		and.w      146(a7),d0
		beq.s      uncompress_image_25
		movea.l    132(a7),a0
		addq.l     #1,132(a7)
		clr.b      (a0)
uncompress_image_25:
		clr.b      142(a7)
		bra.s      uncompress_image_26
uncompress_image_28:
		move.w     146(a7),d0
		ext.l      d0
		movea.l    136(a7),a1
		movea.l    132(a7),a0
		jsr        memcpy
		move.w     146(a7),d0
		ext.l      d0
		add.l      d0,132(a7)
		moveq.l    #1,d0
		and.w      146(a7),d0
		beq.s      uncompress_image_27
		movea.l    132(a7),a0
		addq.l     #1,132(a7)
		clr.b      (a0)
uncompress_image_27:
		addq.b     #1,142(a7)
uncompress_image_26:
		move.b     142(a7),d0
		cmp.b      143(a7),d0
		bcs.s      uncompress_image_28
		move.w     152(a7),d0
		lsl.w      #2,d0
		move.l     132(a7),4(a7,d0.w)
		addq.w     #1,152(a7)
uncompress_image_4:
		movea.l    158(a7),a0
		move.w     152(a7),d0
		cmp.w      4(a0),d0
		blt        uncompress_image_29
		clr.w      d0
		move.b     143(a7),d0
		sub.w      d0,150(a7)
		subq.w     #1,150(a7)
uncompress_image_3:
		move.w     150(a7),d0
		bgt        uncompress_image_30
uncompress_image_6:
		lea.l      162(a7),a7
		rts

	.data

init:
		dc.w $0000
pxy:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
color:
		dc.w $0001
		dc.w $0000

	.bss

screen: ds.l 1
max_x: ds.w 1
max_y: ds.w 1
bytes_lin: ds.w 1
v_rez_vt: ds.w 1
v_rez_hz: ds.w 1
vectors: ds.l 1
kb_mousevec: ds.l 1
