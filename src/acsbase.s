		.text
		
switch_opt:
		subq.w     #4,a7
		move.l     a0,(a7)
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     608(a0),d2
		ext.l      d2
		move.l     d2,d0
		add.l      d0,d0
		add.l      d2,d0
		lsl.l      #3,d0
		movea.l    ACSblk,a0
		movea.l    604(a0),a0
		move.w     10(a0,d0.l),d0
		eor.w      d0,d1
		movea.l    ACSblk,a0
		move.w     608(a0),d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
		movea.l    (a7),a0
		move.w     (a0),d0
		bne.s      switch_opt1
		moveq.l    #1,d0
		bra.s      switch_opt2
switch_opt1:
		clr.w      d0
switch_opt2:
		movea.l    (a7),a0
		move.w     d0,(a0)
		jsr        Aev_release
		addq.w     #4,a7
		rts

ab_glue:
		lea.l      gluepart,a0
		bsr.w      switch_opt
		rts
ab_dirty:
		lea.l      dirtysave,a0
		bsr.w      switch_opt
		rts
ab_snap:
		lea.l      snapping,a0
		bsr        switch_opt
		rts
ab_copyindex:
		lea.l      copyindex,a0
		bsr        switch_opt
		rts
ab_copyimage:
		lea.l      refimages,a0
		bsr        switch_opt
		rts

save_it:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.b     #0x33,cfg
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),cfg+174
		move.w     gluepart,cfg+160
		move.w     dirtysave,cfg+164
		move.w     imagesnap,cfg+170
		move.w     snapping,cfg+166
		move.w     copyindex,cfg+168
		move.w     refimages,cfg+172
		moveq.l    #1,d0
		movea.l    4(a7),a0
		movea.l    20(a0),a0
		and.w      418(a0),d0
		beq.s      save_it1
		moveq.l    #1,d0
		bra.s      save_it2
save_it1:
		clr.w      d0
save_it2:
		move.w     d0,cfg+162
		movea.l    parts_window,a0
		move.w     86(a0),d0
		and.w      #0x0800,d0
		beq.s      save_it3
		moveq.l    #8,d0
		movea.l    parts_window,a1
		lea.l      44(a1),a1
		lea.l      cfg+176,a0
		jsr        memcpy
		bra.s      save_it4
save_it3:
		moveq.l    #8,d0
		movea.l    parts_window,a1
		lea.l      36(a1),a1
		lea.l      cfg+176,a0
		jsr        memcpy
save_it4:
		movea.l    4(a7),a0
		move.w     86(a0),d0
		and.w      #0x0800,d0
		beq.s      save_it5
		moveq.l    #8,d0
		movea.l    4(a7),a1
		lea.l      44(a1),a1
		lea.l      cfg+184,a0
		jsr        memcpy
		bra.s      save_it6
save_it5:
		moveq.l    #8,d0
		movea.l    4(a7),a1
		lea.l      36(a1),a1
		lea.l      cfg+184,a0
		jsr        memcpy
save_it6:
		clr.w      cfg+320
		movea.l    4(a7),a0
		move.w     #0x2711,d0
		jsr        Awi_sendall
		lea.l      x86873,a0
		jsr        Af_cfgfile
		clr.w      d0
		jsr        Fcreate
		move.l     d0,(a7)
		move.l     (a7),d0
		ble.s      save_it7
		lea.l      cfg,a0
		move.l     #2370,d1
		move.w     2(a7),d0
		jsr        Fwrite
		move.w     2(a7),d0
		jsr        Fclose
save_it7:
		addq.w     #8,a7
		rts

ab_save:
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		bsr        save_it
		rts

ab_make:
		lea.l      -2400(a7),a7
		lea.l      WI_COMMON,a0
		jsr        Awi_create
		move.l     a0,22(a7)
		move.l     22(a7),d0
		bne.s      ab_make1
		suba.l     a0,a0
		bra        ab_make27
ab_make1:
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #0x0100,d0
		move.w     d0,26(a7)
		move.l     #2116,d1
		clr.w      d0
		lea.l      cews,a0
		jsr        memset
		lea.l      x86877,a0
		jsr        Af_cfgfile
		clr.w      d0
		jsr        Fopen
		move.l     d0,30(a7)
		move.l     30(a7),d0
		ble        ab_make10
		lea.l      12(a7),a0
		moveq.l    #1,d1
		move.w     32(a7),d0
		jsr        Fread
		moveq.l    #1,d1
		cmp.l      d0,d1
		bne        ab_make8
		clr.w      d2
		move.w     32(a7),d1
		moveq.l    #0,d0
		jsr        Fseek
		move.b     12(a7),d0
		ext.w      d0
		sub.w      #0x0032,d0
		beq.s      ab_make4
		subq.w     #1,d0
		beq.s      ab_make2
		bra        ab_make7
ab_make2:
		lea.l      cfg,a0
		move.l     #2370,d1
		move.w     32(a7),d0
		jsr        Fread
		cmp.l      #2370,d0
		beq.s      ab_make3
		move.l     #2370,d1
		clr.w      d0
		lea.l      cfg,a0
		jsr        memset
ab_make3:
		bra        ab_make7
ab_make4:
		lea.l      34(a7),a0
		move.l     #2366,d1
		move.w     32(a7),d0
		jsr        Fread
		cmp.l      #2366,d0
		bne        ab_make5
		move.b     #0x33,cfg
		lea.l      35(a7),a1
		lea.l      cfg+1,a0
		jsr        strcpy
		lea.l      35(a7),a1
		lea.l      cfg+1,a0
		jsr        strcpy
		lea.l      163(a7),a1
		lea.l      cfg+129,a0
		jsr        strcpy
		lea.l      171(a7),a1
		lea.l      cfg+140,a0
		jsr        strcpy
		lea.l      180(a7),a1
		lea.l      cfg+151,a0
		jsr        strcpy
		moveq.l    #32,d0
		lea.l      190(a7),a1
		lea.l      cfg+160,a0
		jsr        memcpy
		lea.l      222(a7),a1
		lea.l      cfg+192,a0
		jsr        strcpy
		move.w     350(a7),cfg+320
		move.l     #0x00000800,d0
		lea.l      352(a7),a1
		lea.l      cfg+322,a0
		jsr        memcpy
ab_make5:
		cmpi.b     #0x33,cfg
		beq.s      ab_make6
		move.l     #2370,d1
		clr.w      d0
		lea.l      cfg,a0
		jsr        memset
ab_make6:
		bra.s      ab_make71
ab_make7:
		move.l     #2370,d1
		clr.w      d0
		lea.l      cfg,a0
		jsr        memset
ab_make71:
		bra.s      ab_make9
ab_make8:
		move.l     #2370,d1
		clr.w      d0
		lea.l      cfg,a0
		jsr        memset
ab_make9:
		move.w     32(a7),d0
		jsr        Fclose
ab_make10:
		cmpi.b     #0x33,cfg
		bne        ab_make14
		move.w     #0x1800,34(a7)
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      34(a7),d0
		move.w     34(a7),d1
		not.w      d1
		and.w      cfg+174,d1
		or.w       d1,d0
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     d0,14(a0)
		move.w     cfg+160,gluepart
		move.w     cfg+164,dirtysave
		move.w     cfg+170,imagesnap
		move.w     cfg+166,snapping
		move.w     cfg+168,copyindex
		move.w     cfg+172,refimages
		moveq.l    #8,d0
		lea.l      cfg+176,a1
		movea.l    parts_window,a0
		lea.l      36(a0),a0
		jsr        memcpy
		movea.l    22(a7),a0
		move.w     cfg+184,36(a0)
		movea.l    22(a7),a0
		move.w     cfg+186,38(a0)
		cmpi.w     #16,cfg+320
		ble.s      ab_make11
		move.w     #16,cfg+320
ab_make11:
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		beq.s      ab_make14
		moveq.l    #-1,d0
		add.w      cfg+320,d0
		move.w     d0,28(a7)
		bra.s      ab_make13
ab_make12:
		move.w     28(a7),d0
		lsl.w      #7,d0
		lea.l      cfg+322,a0
		adda.w     d0,a0
		movea.l    WI_GENERAL+12,a1
		jsr        (a1)
		subq.w     #1,28(a7)
ab_make13:
		move.w     28(a7),d0
		bpl.s      ab_make12
ab_make14:
		move.b     #0x33,cfg
		movea.l    22(a7),a0
		move.l     20(a0),18(a7)
		move.w     gluepart,d0
		beq.s      ab_make15
		movea.l    18(a7),a0
		ori.w      #0x0001,514(a0)
ab_make15:
		move.w     dirtysave,d0
		beq.s      ab_make16
		movea.l    18(a7),a0
		ori.w      #0x0001,466(a0)
ab_make16:
		move.w     snapping,d0
		beq.s      ab_make17
		movea.l    18(a7),a0
		ori.w      #0x0001,274(a0)
ab_make17:
		move.w     copyindex,d0
		beq.s      ab_make18
		movea.l    18(a7),a0
		ori.w      #0x0001,322(a0)
ab_make18:
		move.w     refimages,d0
		beq.s      ab_make19
		movea.l    18(a7),a0
		ori.w      #0x0001,370(a0)
ab_make19:
		move.w     cfg+162,d0
		beq.s      ab_make20
		movea.l    18(a7),a0
		ori.w      #0x0001,418(a0)
ab_make20:
		movea.l    helpacc,a1
		moveq.l    #24,d0
		movea.l    18(a7),a0
		jsr        Aob_puttext
		lea.l      cfg+1,a1
		moveq.l    #5,d0
		movea.l    18(a7),a0
		jsr        Aob_puttext
		lea.l      cfg+129,a1
		moveq.l    #6,d0
		movea.l    18(a7),a0
		jsr        Aob_puttext
		lea.l      cfg+140,a1
		moveq.l    #7,d0
		movea.l    18(a7),a0
		jsr        Aob_puttext
		move.l     #4,(a7)
		lea.l      (a7),a1
		moveq.l    #100,d0
		movea.l    18(a7),a0
		lea.l      648(a0),a0
		jsr        Auo_slider
		move.l     #1,(a7)
		lea.l      (a7),a1
		moveq.l    #101,d0
		movea.l    18(a7),a0
		lea.l      648(a0),a0
		jsr        Auo_slider
		move.w     imagesnap,d0
		subq.w     #1,d0
		beq.s      ab_make21
		subq.w     #1,d0
		beq.s      ab_make22
		subq.w     #2,d0
		beq.s      ab_make23
		subq.w     #4,d0
		beq.s      ab_make24
		bra.s      ab_make25
ab_make21:
		clr.l      (a7)
		bra.s      ab_make25
ab_make22:
		move.l     #1,(a7)
		bra.s      ab_make25
ab_make23:
		move.l     #2,(a7)
		bra.s      ab_make25
ab_make24:
		move.l     #3,(a7)
		nop
ab_make25:
		lea.l      (a7),a1
		moveq.l    #17,d0
		movea.l    18(a7),a0
		lea.l      648(a0),a0
		jsr        Auo_slider
		move.w     imagesnap,-(a7)
		lea.l      x8687b,a1
		lea.l      14(a7),a0
		jsr        sprintf
		addq.w     #2,a7
		lea.l      12(a7),a1
		moveq.l    #4,d0
		movea.l    18(a7),a0
		lea.l      648(a0),a0
		jsr        Auo_slider
		move.l     #live_snap,4(a7)
		movea.l    18(a7),a0
		lea.l      648(a0),a0
		move.l     a0,8(a7)
		lea.l      4(a7),a1
		moveq.l    #103,d0
		movea.l    18(a7),a0
		lea.l      648(a0),a0
		jsr        Auo_slider
		movea.l    ACSblk,a0
		movea.l    572(a0),a0
		move.w     14(a0),d0
		and.w      #0x0100,d0
		move.w     26(a7),d1
		eor.w      d1,d0
		beq.s      ab_make26
		movea.l    ACSblk,a0
		addq.w     #8,a0
		moveq.l    #-1,d1
		movea.l    ACSblk,a1
		move.w     (a1),d0
		jsr        Aev_WmRedraw
ab_make26:
		jsr        validate
		movea.l    22(a7),a0
ab_make27:
		lea.l      2400(a7),a7
		rts

ab_service:
		move.l     a2,-(a7)
		lea.l      -36(a7),a7
		move.l     a0,32(a7)
		move.w     d0,30(a7)
		move.l     a1,26(a7)
		move.w     30(a7),d0
		cmp.w      #0x03ED,d0
		beq        ab_service18
		bgt.s      ab_service2
		cmp.w      #0x001A,d0
		beq        ab_service51
		bgt.s      ab_service1
		subq.w     #2,d0
		beq.s      ab_service4
		sub.w      #13,d0
		beq        ab_service14
		bra        ab_service57
ab_service1:
		sub.w      #0x00D1,d0
		beq        ab_service47
		sub.w      #0x031A,d0
		beq        ab_service24
		bra        ab_service57
ab_service2:
		cmp.w      #0x2712,d0
		beq        ab_service12
		bgt.s      ab_service3
		sub.w      #0x03EE,d0
		beq        ab_service37
		sub.w      #0x005E,d0
		beq        ab_service17
		bra        ab_service57
ab_service3:
		sub.w      #0x2713,d0
		beq        ab_service15
		subq.w     #1,d0
		beq.s      ab_service8
		bra        ab_service57
ab_service4:
		movea.l    ACSblk,a0
		move.w     570(a0),d0
		beq.s      ab_service5
		movea.l    32(a7),a0
		jsr        Awi_delete
		bra.s      ab_service7
ab_service5:
		movea.l    ACSblk,a0
		move.w     566(a0),d0
		beq.s      ab_service6
		lea.l      ERR_WICLOSE,a0
		moveq.l    #1,d0
		jsr        Awi_alert
		bra.s      ab_service7
ab_service6:
		movea.l    32(a7),a0
		move.w     32(a0),d0
		ble.s      ab_service7
		movea.l    32(a7),a0
		jsr        Awi_closed
ab_service7:
		bra        ab_service58
ab_service8:
		clr.w      16(a7)
		bra.s      ab_service11
ab_service9:
		move.w     16(a7),d0
		lsl.w      #7,d0
		lea.l      cfg+322,a1
		adda.w     d0,a1
		movea.l    26(a7),a0
		jsr        Ast_icmp
		tst.w      d0
		bne.s      ab_service10
		clr.w      d0
		bra        ab_service59
ab_service10:
		addq.w     #1,16(a7)
ab_service11:
		move.w     16(a7),d0
		cmp.w      cfg+320,d0
		blt.s      ab_service9
		bra        ab_service58
ab_service12:
		cmpi.w     #16,cfg+320
		bge.s      ab_service13
		move.l     #128,d0
		movea.l    26(a7),a1
		move.w     cfg+320,d1
		addq.w     #1,cfg+320
		lsl.w      #7,d1
		lea.l      cfg+322,a0
		adda.w     d1,a0
		jsr        strncpy
ab_service13:
		bra        ab_service58
ab_service14:
		lea.l      WI_INFO_BASE,a1
		lea.l      WI_INFO_BASE,a0
		jsr        Awi_doform
		bra        ab_service58
ab_service15:
		moveq.l    #1,d0
		movea.l    32(a7),a0
		movea.l    20(a0),a0
		and.w      418(a0),d0
		beq.s      ab_service16
		movea.l    32(a7),a0
		bsr        save_it
ab_service16:
		bra        ab_service58
ab_service17:
		movea.l    26(a7),a0
		move.l     (a0),cews
		movea.l    26(a7),a0
		move.l     32(a7),(a0)
		bra        ab_service58
ab_service18:
		clr.l      -(a7)
		clr.l      -(a7)
		clr.l      -(a7)
		pea.l      26(a7)
		moveq.l    #10,d1
		clr.w      d0
		jsr        wind_get
		lea.l      16(a7),a7
		move.w     14(a7),d0
		jsr        Awi_wid
		move.l     a0,22(a7)
		move.l     22(a7),d0
		beq        ab_service23
		clr.w      16(a7)
		bra.s      ab_service21
ab_service19:
		move.w     16(a7),d0
		lsl.w      #2,d0
		lea.l      cews,a0
		movea.l    4(a0,d0.w),a0
		cmpa.l     22(a7),a0
		bne.s      ab_service20
		bra.s      ab_service22
ab_service20:
		addq.w     #1,16(a7)
ab_service21:
		cmpi.w     #16,16(a7)
		blt.s      ab_service19
ab_service22:
		cmpi.w     #16,16(a7)
		bge        ab_service23
		lea.l      (a7),a1
		move.w     #200,d0
		movea.l    22(a7),a0
		movea.l    22(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		move.l     (a7),d0
		beq.s      ab_service23
		suba.l     a1,a1
		move.w     #0x00E2,d0
		movea.l    (a7),a0
		jsr        Auo_editor
		suba.l     a1,a1
		moveq.l    #14,d0
		movea.l    (a7),a0
		jsr        Auo_editor
		suba.l     a1,a1
		move.w     #0x00F8,d0
		movea.l    (a7),a0
		jsr        Auo_editor
		suba.l     a1,a1
		move.w     #0x00F4,d0
		movea.l    (a7),a0
		jsr        Auo_editor
		suba.l     a1,a1
		move.w     #0x00F6,d0
		movea.l    (a7),a0
		jsr        Auo_editor
		movea.l    26(a7),a1
		move.w     #0x00F2,d0
		movea.l    (a7),a0
		jsr        Auo_editor
		suba.l     a1,a1
		move.w     #0x00DB,d0
		movea.l    (a7),a0
		jsr        Auo_editor
		suba.l     a1,a1
		moveq.l    #5,d0
		movea.l    (a7),a0
		jsr        Auo_editor
ab_service23:
		bra        ab_service58
ab_service24:
		move.l     26(a7),d0
		bne.s      ab_service25
		bra        ab_service58
ab_service25:
		moveq.l    #46,d0
		movea.l    26(a7),a0
		jsr        strrchr
		move.l     a0,10(a7)
		move.l     10(a7),d0
		beq        ab_service36
		lea.l      x8687e,a1
		movea.l    10(a7),a0
		addq.w     #1,a0
		jsr        strcmp
		tst.w      d0
ab_service26:
		bne.s      ab_service27
		movea.l    26(a7),a0
		movea.l    WI_GENERAL+8,a1
		jsr        (a1)
		bra        ab_service36
ab_service27:
		suba.l     a0,a0
		movea.l    EDITOR+8,a1
		jsr        (a1)
		move.l     a0,22(a7)
		move.l     22(a7),d0
		beq        ab_service36
		movea.l    32(a7),a1
		move.w     #0x00D0,d0
		movea.l    22(a7),a0
		movea.l    22(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		movea.l    26(a7),a1
		move.w     #0x00CA,d0
		movea.l    22(a7),a0
		movea.l    22(a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		lea.l      x86882,a1
		movea.l    10(a7),a0
		addq.w     #1,a0
		jsr        strcmp
		tst.w      d0
		beq.s      ab_service30
		lea.l      x86884,a1
		movea.l    10(a7),a0
		addq.w     #1,a0
		jsr        strcmp
		tst.w      d0
		beq.s      ab_service30
		lea.l      x86886,a1
		movea.l    10(a7),a0
		addq.w     #1,a0
		jsr        strcmp
		tst.w      d0
		bne.s      ab_service28
		moveq.l    #1,d0
		bra.s      ab_service29
ab_service28:
		clr.w      d0
ab_service29:
		bne.s      ab_service35
ab_service30:
		clr.w      16(a7)
		bra.s      ab_service33
ab_service31:
		move.w     16(a7),d0
		lsl.w      #2,d0
		lea.l      cews,a0
		move.l     4(a0,d0.w),d0
		bne.s      ab_service32
		bra.s      ab_service34
ab_service32:
		addq.w     #1,16(a7)
ab_service33:
		cmpi.w     #16,16(a7)
		blt.s      ab_service31
ab_service34:
		cmpi.w     #16,16(a7)
		bge.s      ab_service35
		move.w     16(a7),d0
		lsl.w      #2,d0
		lea.l      cews,a0
		move.l     22(a7),4(a0,d0.w)
		movea.l    26(a7),a1
		move.w     16(a7),d0
		lsl.w      #7,d0
		lea.l      cews+72,a0
		adda.w     d0,a0
		jsr        strcpy
ab_service35:
		movea.l    22(a7),a0
		jsr        Awi_show
ab_service36:
		bra        ab_service58
ab_service37:
		move.l     26(a7),d0
		bne.s      ab_service38
		bra        ab_service58
ab_service38:
		movea.l    26(a7),a1
		lea.l      4(a7),a0
		jsr        Af_2ext
		move.b     4(a7),d0
		beq        ab_service46
		clr.w      16(a7)
		bra.s      ab_service41
ab_service39:
		movea.l    26(a7),a1
		move.w     16(a7),d0
		lsl.w      #7,d0
		lea.l      cews+72,a0
		adda.w     d0,a0
		jsr        strcmp
		tst.w      d0
		bne.s      ab_service40
		bra.s      ab_service42
ab_service40:
		addq.w     #1,16(a7)
ab_service41:
		cmpi.w     #16,16(a7)
		blt.s      ab_service39
ab_service42:
		cmpi.w     #16,16(a7)
		bge.s      ab_service43
		suba.l     a1,a1
		move.w     #0x00D6,d0
		move.w     16(a7),d1
		lsl.w      #2,d1
		lea.l      cews,a0
		movea.l    4(a0,d1.w),a0
		move.w     16(a7),d1
		lsl.w      #2,d1
		lea.l      cews,a2
		movea.l    4(a2,d1.w),a2
		movea.l    4(a2),a2
		jsr        (a2)
		bra        ab_service46
ab_service43:
		lea.l      x8688a,a1
		lea.l      4(a7),a0
		jsr        strcmp
		tst.w      d0
		bne        ab_service46
		jsr        Awi_list
		move.l     a0,22(a7)
		move.l     a0,18(a7)
ab_service44:
		movea.l    18(a7),a0
		move.l     78(a0),d0
		beq.s      ab_service45
		movea.l    18(a7),a0
		movea.l    78(a0),a1
		lea.l      4(a7),a0
		jsr        Af_2ext
		move.l     a0,d0
		beq.s      ab_service45
		lea.l      x8688e,a1
		lea.l      4(a7),a0
		jsr        strcmp
		tst.w      d0
		bne.s      ab_service45
		movea.l    18(a7),a0
		move.l     74(a0),d0
		beq.s      ab_service45
		lea.l      _WGTITEL,a1
		movea.l    18(a7),a0
		movea.l    74(a0),a0
		jsr        strcmp
		tst.w      d0
		bne.s      ab_service45
		movea.l    26(a7),a1
		movea.l    18(a7),a0
		movea.l    78(a0),a0
		addq.w     #1,a0
		jsr        strcmp
		tst.w      d0
		bne.s      ab_service45
		movea.l    18(a7),a0
		jsr        save
ab_service45:
		jsr        Awi_list
		move.l     a0,18(a7)
		movea.l    18(a7),a0
		cmpa.l     22(a7),a0
		beq.s      ab_service46
		movea.l    22(a7),a0
		move.w     32(a0),d0
		bpl        ab_service44
ab_service46:
		bra        ab_service58
ab_service47:
		clr.w      16(a7)
		bra.s      ab_service50
ab_service48:
		move.w     16(a7),d0
		lsl.w      #2,d0
		lea.l      cews,a0
		movea.l    4(a0,d0.w),a0
		cmpa.l     26(a7),a0
		bne.s      ab_service49
		move.w     16(a7),d0
		lsl.w      #7,d0
		lea.l      cews+72,a1
		adda.w     d0,a1
		move.w     #0x00D1,d0
		movea.l    cews,a0
		movea.l    cews,a2
		movea.l    4(a2),a2
		jsr        (a2)
		move.w     16(a7),d0
		lsl.w      #2,d0
		lea.l      cews,a0
		clr.l      4(a0,d0.w)
		lea.l      x86892,a1
		move.w     16(a7),d0
		lsl.w      #7,d0
		lea.l      cews+72,a0
		adda.w     d0,a0
		jsr        strcpy
ab_service49:
		addq.w     #1,16(a7)
ab_service50:
		cmpi.w     #16,16(a7)
		blt.s      ab_service48
		bra        ab_service58
ab_service51:
		movea.l    32(a7),a0
		move.w     28(a0),d0
		subq.w     #5,d0
		beq.s      ab_service53
		subq.w     #1,d0
		beq.s      ab_service54
		subq.w     #1,d0
		beq.s      ab_service55
		sub.w      #17,d0
		beq.s      ab_service52
		bra.s      ab_service56
ab_service52:
		movea.l    helpacc,a1
		moveq.l    #24,d0
		movea.l    32(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_gettext
		bra.s      ab_service56
ab_service53:
		lea.l      cfg+1,a1
		moveq.l    #5,d0
		movea.l    32(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_gettext
		bra.s      ab_service56
ab_service54:
		lea.l      cfg+129,a1
		moveq.l    #6,d0
		movea.l    32(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_gettext
		bra.s      ab_service56
ab_service55:
		lea.l      cfg+140,a1
		moveq.l    #7,d0
		movea.l    32(a7),a0
		movea.l    20(a0),a0
		jsr        Aob_gettext
		nop
ab_service56:
		jsr        validate
		bra.s      ab_service58
ab_service57:
		movea.l    26(a7),a1
		move.w     30(a7),d0
		movea.l    32(a7),a0
		jsr        Awi_service
		bra.s      ab_service59
ab_service58:
		moveq.l    #1,d0
ab_service59:
		lea.l      36(a7),a7
		movea.l    (a7)+,a2
		rts

live_snap:
		lea.l      -10(a7),a7
		move.l     d0,6(a7)
		move.w     8(a7),d0
		tst.w      d0
		beq.s      live_snap1
		subq.w     #1,d0
		beq.s      live_snap2
		subq.w     #1,d0
		beq.s      live_snap3
		bra.s      live_snap4
live_snap1:
		move.w     #1,imagesnap
		bra.s      live_snap5
live_snap2:
		move.w     #2,imagesnap
		bra.s      live_snap5
live_snap3:
		move.w     #4,imagesnap
		bra.s      live_snap5
live_snap4:
		move.w     #8,imagesnap
live_snap5:
		move.w     imagesnap,d0
		bne.s      live_snap6
		move.w     #1,imagesnap
live_snap6:
		move.w     imagesnap,-(a7)
		lea.l      x86893,a1
		lea.l      2(a7),a0
		jsr        sprintf
		addq.w     #2,a7
		lea.l      (a7),a0
		lea.l      10(a7),a7
		rts

reg_kind:
		lea.l      -28(a7),a7
		lea.l      x86464,a0
		lea.l      4(a7),a1
		moveq.l    #11,d0
reg_kind1:
		move.b     (a0)+,(a1)+
		dbf        d0,reg_kind1
		lea.l      P_REGISTER,a0
		jsr        Aob_create
		move.l     a0,24(a7)
		bne.s      reg_kind2
		bra        reg_kind4
reg_kind2:
		moveq.l    #23,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    20(a0),a1
		lea.l      16(a7),a0
		jsr        Aob_offset
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.w     52(a0),d0
		add.w      d0,16(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.w     54(a0),d0
		add.w      d0,18(a7)
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.w     2(a0),2(a7)
		move.w     2(a7),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    24(a7),a0
		ori.w      #4,34(a0,d0.l)
		move.w     18(a7),d1
		move.w     16(a7),d0
		movea.l    24(a7),a1
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        Ame_popup
		move.w     d0,(a7)
		move.w     (a7),d0
		ble.s      reg_kind3
		moveq.l    #-1,d0
		add.w      (a7),d0
		ext.l      d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.l     d0,(a0)
		move.w     (a7),d0
		lsl.w      #2,d0
		movea.l    0(a7,d0.w),a1
		moveq.l    #23,d0
		movea.l    ACSblk,a0
		movea.l    604(a0),a0
		jsr        Aob_puttext
		moveq.l    #-1,d1
		moveq.l    #23,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a1
		movea.l    102(a1),a1
		jsr        (a1)
reg_kind3:
		movea.l    24(a7),a0
		jsr        Aob_delete
reg_kind4:
		lea.l      28(a7),a7
		rts

outreg:
		lea.l      -264(a7),a7
		move.l     d0,260(a7)
		move.l     a0,256(a7)
		bra.s      outreg2
outreg1:
		lea.l      (a7),a0
		move.l     a0,-(a7)
		movea.l    260(a7),a0
		move.l     (a0),-(a7)
		lea.l      x86896,a1
		lea.l      8(a7),a0
		jsr        sprintf
		addq.w     #4,a7
		move.w     d0,d1
		ext.l      d1
		move.w     266(a7),d0
		movea.l    (a7)+,a0
		jsr        Fwrite
		addq.l     #4,256(a7)
outreg2:
		movea.l    256(a7),a0
		move.l     (a0),d0
		bne.s      outreg1
		lea.l      264(a7),a7
		rts

reg_me:
		lea.l      -408(a7),a7
		lea.l      404(a7),a1
		moveq.l    #3,d0
		movea.l    ACSblk,a0
		movea.l    604(a0),a0
		lea.l      384(a0),a0
		jsr        Auo_boxed
		lea.l      400(a7),a1
		moveq.l    #3,d0
		movea.l    ACSblk,a0
		movea.l    604(a0),a0
		lea.l      408(a0),a0
		jsr        Auo_boxed
		lea.l      396(a7),a1
		moveq.l    #3,d0
		movea.l    ACSblk,a0
		movea.l    604(a0),a0
		lea.l      432(a0),a0
		jsr        Auo_boxed
		lea.l      392(a7),a1
		moveq.l    #3,d0
		movea.l    ACSblk,a0
		movea.l    604(a0),a0
		lea.l      456(a0),a0
		jsr        Auo_boxed
		lea.l      388(a7),a1
		moveq.l    #3,d0
		movea.l    ACSblk,a0
		movea.l    604(a0),a0
		lea.l      480(a0),a0
		jsr        Auo_boxed
		lea.l      x8689b,a1
		move.l     a1,-(a7)
		movea.l    ACSblk,a1
		lea.l      158(a1),a1
		lea.l      264(a7),a0
		jsr        strcpy
		movea.l    (a7)+,a1
		jsr        strcat
		movea.l    404(a7),a0
		move.b     (a0),d0
		beq        reg_me8
		movea.l    400(a7),a0
		move.b     (a0),d0
		beq        reg_me8
		movea.l    396(a7),a0
		move.b     (a0),d0
		beq        reg_me8
		movea.l    392(a7),a0
		move.b     (a0),d0
		beq        reg_me8
		pea.l      x868b1
		lea.l      264(a7),a1
		lea.l      x868a8,a0
		jsr        Af_select
		addq.w     #4,a7
		move.l     a0,d0
		beq        reg_me8
		clr.w      d0
		lea.l      260(a7),a0
		jsr        Fcreate
		move.l     d0,(a7)
		ble        reg_me8
		lea.l      regstart,a0
		move.l     (a7),d0
		bsr        outreg
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		move.w     2(a0),d0
		tst.w      d0
		beq.s      reg_me1
		subq.w     #1,d0
		beq.s      reg_me2
		subq.w     #1,d0
		beq.s      reg_me21
		bra.s      reg_me4
reg_me1:
		lea.l      regscheck,a0
		move.l     (a7),d0
		bsr        outreg
		bra.s      reg_me4
reg_me2:
		lea.l      regkonto,a0
		move.l     (a7),d0
		bsr        outreg
		bra.s      reg_me4
reg_me21:
		moveq.l    #1,d0
		movea.l    ACSblk,a0
		movea.l    604(a0),a0
		and.w      226(a0),d0
		beq.s      reg_me3
		lea.l      reginn,a0
		move.l     (a7),d0
		bsr        outreg
		bra.s      reg_me4
reg_me3:
		lea.l      regonn,a0
		move.l     (a7),d0
		bsr        outreg
reg_me4:
		movea.l    388(a7),a0
		move.b     (a0),d0
		beq.s      reg_me5
		lea.l      regmail,a0
		move.l     (a7),d0
		bsr        outreg
reg_me5:
		lea.l      regend,a0
		move.l     (a7),d0
		bsr        outreg
		clr.w      d2
		move.w     2(a7),d1
		moveq.l    #0,d0
		jsr        Fseek
		moveq.l    #1,d2
		move.w     2(a7),d1
		move.l     #166,d0
		jsr        Fseek
		lea.l      4(a7),a0
		move.l     a0,-(a7)
		pea.l      x868c2
		pea.l      x868c0
		pea.l      x868be
		lea.l      x868b5,a1
		lea.l      20(a7),a0
		jsr        sprintf
		lea.l      12(a7),a7
		move.w     d0,d1
		ext.l      d1
		move.w     6(a7),d0
		movea.l    (a7)+,a0
		jsr        Fwrite
		moveq.l    #1,d2
		move.w     2(a7),d1
		moveq.l    #36,d0
		jsr        Fseek
		lea.l      4(a7),a0
		move.l     a0,-(a7)
		move.l     408(a7),-(a7)
		lea.l      x868c4,a1
		lea.l      12(a7),a0
		jsr        sprintf
		addq.w     #4,a7
		move.w     d0,d1
		ext.l      d1
		move.w     6(a7),d0
		movea.l    (a7)+,a0
		jsr        Fwrite
		moveq.l    #1,d2
		move.w     2(a7),d1
		moveq.l    #9,d0
		jsr        Fseek
		lea.l      4(a7),a0
		move.l     a0,-(a7)
		move.l     404(a7),-(a7)
		lea.l      x868cc,a1
		lea.l      12(a7),a0
		jsr        sprintf
		addq.w     #4,a7
		move.w     d0,d1
		ext.l      d1
		move.w     6(a7),d0
		movea.l    (a7)+,a0
		jsr        Fwrite
		moveq.l    #1,d2
		move.w     2(a7),d1
		moveq.l    #9,d0
		jsr        Fseek
		lea.l      4(a7),a0
		move.l     a0,-(a7)
		move.l     400(a7),-(a7)
		lea.l      x868d4,a1
		lea.l      12(a7),a0
		jsr        sprintf
		addq.w     #4,a7
		move.w     d0,d1
		ext.l      d1
		move.w     6(a7),d0
		movea.l    (a7)+,a0
		jsr        Fwrite
		moveq.l    #1,d2
		move.w     2(a7),d1
		moveq.l    #9,d0
		jsr        Fseek
		lea.l      4(a7),a0
		move.l     a0,-(a7)
		move.l     396(a7),-(a7)
		lea.l      x868dc,a1
		lea.l      12(a7),a0
		jsr        sprintf
		addq.w     #4,a7
		move.w     d0,d1
		ext.l      d1
		move.w     6(a7),d0
		movea.l    (a7)+,a0
		jsr        Fwrite
		moveq.l    #1,d2
		move.w     2(a7),d1
		moveq.l    #9,d0
		jsr        Fseek
		movea.l    388(a7),a0
		move.b     (a0),d0
		beq.s      reg_me6
		lea.l      4(a7),a0
		move.l     a0,-(a7)
		move.l     392(a7),-(a7)
		lea.l      x868e4,a1
		lea.l      12(a7),a0
		jsr        sprintf
		addq.w     #4,a7
		move.w     d0,d1
		ext.l      d1
		move.w     6(a7),d0
		movea.l    (a7)+,a0
		jsr        Fwrite
		bra.s      reg_me7
reg_me6:
		lea.l      4(a7),a0
		move.l     a0,-(a7)
		pea.l      x868f4
		lea.l      x868ec,a1
		lea.l      12(a7),a0
		jsr        sprintf
		addq.w     #4,a7
		move.w     d0,d1
		ext.l      d1
		move.w     6(a7),d0
		movea.l    (a7)+,a0
		jsr        Fwrite
reg_me7:
		move.w     2(a7),d0
		jsr        Fclose
reg_me8:
		lea.l      408(a7),a7
		rts

	.globl acs_register
acs_register:
		subq.w     #4,a7
		lea.l      WI_REGISTER,a0
		movea.l    WI_REGISTER+8,a1
		jsr        (a1)
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      acs_register1
		lea.l      rkind0,a1
		moveq.l    #23,d0
		movea.l    (a7),a0
		movea.l    20(a0),a0
		jsr        Aob_puttext
		movea.l    (a7),a0
		jsr        Awi_dialog
		movea.l    (a7),a0
		jsr        Awi_delete
acs_register1:
		addq.w     #4,a7
		rts

demoabout:
		move.l     wdemo,d0
		beq.s      demoabout1
		movea.l    wdemo,a0
		jsr        Awi_open
		rts
demoabout1:
		lea.l      A_DEMO,a0
		moveq.l    #1,d0
		jsr        Awi_alert
		rts

installdemo:
		move.l     a2,-(a7)
		move.w     runasdemo,d0
		beq.s      installdemo2
		clr.l      stepper
		movea.l    ACSblk,a0
		move.l     #demoabout,668(a0)
		movea.l    ACSblk,a0
		cmpi.l     #500,562(a0)
		ble.s      installdemo1
		movea.l    ACSblk,a0
		move.l     #500,562(a0)
installdemo1:
		bra.s      installdemo4
installdemo2:
		move.l     wdemo,d0
		beq.s      installdemo3
		movea.l    wdemo,a0
		move.w     32(a0),d0
		ble.s      installdemo3
		suba.l     a1,a1
		moveq.l    #2,d0
		movea.l    wdemo,a0
		movea.l    wdemo,a2
		movea.l    4(a2),a2
		jsr        (a2)
installdemo3:
		move.l     oldabout,d0
		beq.s      installdemo4
		movea.l    ACSblk,a0
		move.l     oldabout,668(a0)
installdemo4:
		movea.l    (a7)+,a2
		rts

ComputeKey:
		lea.l      -4132(a7),a7
		move.w     d0,4130(a7)
		move.l     a0,4126(a7)
		move.w     d1,4124(a7)
		move.l     a1,4120(a7)
		movea.l    4136(a7),a0
		jsr        atoi
		ext.l      d0
		move.l     d0,4116(a7)
		movea.l    4140(a7),a0
		jsr        atoi
		ext.l      d0
		move.l     d0,4112(a7)
		movea.l    4144(a7),a0
		jsr        atoi
		ext.l      d0
		move.l     d0,4108(a7)
		lea.l      x868f5,a1
		lea.l      4(a7),a0
		jsr        strcpy
		movea.l    4126(a7),a1
		lea.l      4(a7),a0
		jsr        strcat
		lea.l      x86901,a1
		lea.l      4(a7),a0
		jsr        strcat
		movea.l    4120(a7),a1
		lea.l      4(a7),a0
		jsr        strcat
		lea.l      x8690d,a1
		lea.l      4(a7),a0
		jsr        strcat
		movea.l    4136(a7),a1
		lea.l      4(a7),a0
		jsr        strcat
		lea.l      x86917,a1
		lea.l      4(a7),a0
		jsr        strcat
		movea.l    4140(a7),a1
		lea.l      4(a7),a0
		jsr        strcat
		movea.l    4144(a7),a1
		lea.l      4(a7),a0
		jsr        strcat
		lea.l      x86919,a1
		lea.l      4(a7),a0
		jsr        strcat
		movea.l    4152(a7),a1
		lea.l      4(a7),a0
		jsr        strcat
		lea.l      x86929,a1
		lea.l      4(a7),a0
		jsr        strcat
		movea.l    4148(a7),a1
		lea.l      4(a7),a0
		jsr        strcat
		move.w     4130(a7),d0
		ext.l      d0
		moveq.l    #28,d1
		lsl.l      d1,d0
		move.w     4124(a7),d1
		ext.l      d1
		moveq.l    #24,d2
		lsl.l      d2,d1
		or.l       d1,d0
		move.l     4116(a7),d1
		moveq.l    #16,d2
		lsl.l      d2,d1
		or.l       d1,d0
		move.l     4112(a7),d1
		lsl.l      #8,d1
		or.l       d1,d0
		or.l       4108(a7),d0
		move.l     d0,4104(a7)
		lea.l      4(a7),a0
		jsr        crc16
		ext.l      d0
		moveq.l    #16,d1
		lsl.l      d1,d0
		not.l      d0
		move.l     d0,-(a7)
		movea.l    4152(a7),a0
		jsr        crc16
		ext.l      d0
		move.l     (a7)+,d1
		eor.l      d0,d1
		move.l     d1,-(a7)
		movea.l    4156(a7),a0
		jsr        crc16
		ext.l      d0
		move.l     (a7)+,d1
		eor.l      d0,d1
		move.l     d1,-(a7)
		movea.l    4130(a7),a0
		jsr        crc16
		ext.l      d0
		not.l      d0
		move.l     (a7)+,d1
		eor.l      d0,d1
		move.l     d1,-(a7)
		movea.l    4124(a7),a0
		jsr        crc16
		ext.l      d0
		not.l      d0
		move.l     (a7)+,d1
		eor.l      d0,d1
		move.l     d1,-(a7)
		movea.l    4140(a7),a0
		jsr        crc16
		ext.l      d0
		move.l     (a7)+,d1
		eor.l      d0,d1
		move.l     d1,-(a7)
		movea.l    4144(a7),a0
		jsr        crc16
		ext.l      d0
		move.l     (a7)+,d1
		eor.l      d0,d1
		move.l     d1,-(a7)
		movea.l    4148(a7),a0
		jsr        crc16
		ext.l      d0
		move.l     (a7)+,d1
		eor.l      d0,d1
		move.l     4104(a7),d0
		eor.l      d0,d1
		move.l     d1,4100(a7)
		lea.l      x86935,a1
		movea.l    4156(a7),a0
		jsr        strcpy
		clr.w      2(a7)
		bra.s      ComputeKey4
ComputeKey1:
		move.l     4100(a7),d0
		move.b     3(a7),d1
		asr.l      d1,d0
		and.w      #0xFFFF,d0
		moveq.l    #0,d1
		move.w     d0,d1
		divu.w     #26,d1
		swap       d1
		move.w     d1,(a7)
		cmpi.w     #25,(a7)
		ble.s      ComputeKey2
		moveq.l    #22,d0
		add.b      1(a7),d0
		bra.s      ComputeKey3
ComputeKey2:
		moveq.l    #65,d0
		add.b      1(a7),d0
ComputeKey3:
		move.w     2(a7),d1
		ext.l      d1
		divs.w     #3,d1
		movea.l    4156(a7),a0
		move.b     d0,0(a0,d1.w)
		addq.w     #3,2(a7)
ComputeKey4:
		cmpi.w     #32,2(a7)
		blt.s      ComputeKey1
		movea.l    4156(a7),a0
		clr.b      10(a0)
		lea.l      4132(a7),a7
		rts

crc16:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.w     #0xFFFF,2(a7)
		movea.l    8(a7),a0
		jsr        strlen
		move.w     d0,(a7)
		bra.s      crc16_6
crc16_1:
		clr.b      6(a7)
		movea.l    8(a7),a0
		addq.l     #1,8(a7)
		move.b     (a0),d0
		ext.w      d0
		and.w      #0x00FF,d0
		move.w     d0,4(a7)
		bra.s      crc16_5
crc16_2:
		moveq.l    #1,d0
		and.w      2(a7),d0
		moveq.l    #1,d1
		and.w      4(a7),d1
		eor.w      d1,d0
		beq.s      crc16_3
		move.w     2(a7),d0
		lsr.w      #1,d0
		move.w     #0x8408,d1
		eor.w      d1,d0
		move.w     d0,2(a7)
		bra.s      crc16_4
crc16_3:
		lsr.w      2(a7)
crc16_4:
		addq.b     #1,6(a7)
		lsr.w      4(a7)
crc16_5:
		cmpi.b     #8,6(a7)
		bcs.s      crc16_2
crc16_6:
		move.w     (a7),d0
		subq.w     #1,(a7)
		tst.w      d0
		bne.s      crc16_1
		move.w     2(a7),d0
		not.w      d0
		move.w     d0,2(a7)
		move.w     2(a7),4(a7)
		move.w     2(a7),d0
		lsl.w      #8,d0
		move.w     4(a7),d1
		lsr.w      #8,d1
		and.w      #0x00FF,d1
		or.w       d1,d0
		move.w     d0,2(a7)
		move.w     2(a7),d0
		lea.l      12(a7),a7
		rts

validate:
		lea.l      -12(a7),a7
		move.l     wdemo,d0
		bne.s      validate1
		lea.l      WI_DEMO,a0
		movea.l    WI_DEMO+8,a1
		jsr        (a1)
		move.l     a0,wdemo
		beq.s      validate1
		movea.l    ACSblk,a0
		move.l     668(a0),oldabout
		jsr        Ash_gettimer
		move.l     d0,timer1
		move.l     d0,timer0
validate1:
		move.w     #1,runasdemo
		move.b     cfg+1,d0
		beq.s      validate3
		moveq.l    #5,d0
		lea.l      x86940,a1
		lea.l      cfg+129,a0
		jsr        strncmp
		tst.w      d0
		bne.s      validate3
		pea.l      (a7)
		pea.l      cfg+129
		pea.l      cfg+1
		pea.l      x8695a
		pea.l      x86958
		pea.l      x86956
		lea.l      x8694f,a1
		clr.w      d1
		lea.l      x86946,a0
		clr.w      d0
		bsr        ComputeKey
		lea.l      24(a7),a7
		lea.l      (a7),a1
		lea.l      cfg+140,a0
		jsr        Ast_cmp
		tst.w      d0
		bne.s      validate3
		clr.w      runasdemo
validate3:
		bsr        installdemo
		lea.l      12(a7),a7
		rts

demo_init:
		move.l     a2,-(a7)
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		ori.w      #0x0020,86(a0)
		movea.l    (a7),a0
		move.w     32(a0),d0
		ble.s      demo_init2
		jsr        Ash_gettimer
		move.l     d0,timer1
		move.l     timer1,d0
		sub.l      timer0,d0
		moveq.l    #50,d1
		cmp.l      d0,d1
		bgt.s      demo_init1
		move.l     timer1,timer0
		addq.l     #4,stepper
		movea.l    (a7),a1
		lea.l      36(a1),a1
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    106(a2),a2
		jsr        (a2)
demo_init1:
		bra.s      demo_init3
demo_init2:
		moveq.l    #0,d0
		move.l     d0,timer1
		move.l     d0,timer0
demo_init3:
		clr.w      d0
		addq.w     #4,a7
		movea.l    (a7)+,a2
		rts

demo_serv:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.l     a1,(a7)
		move.w     4(a7),d0
		subq.w     #2,d0
		beq.s      demo_serv1
		bra.s      demo_serv4
demo_serv1:
		movea.l    ACSblk,a0
		move.w     570(a0),d0
		beq.s      demo_serv2
		movea.l    6(a7),a0
		jsr        Awi_delete
		bra.s      demo_serv3
demo_serv2:
		movea.l    6(a7),a0
		ori.w      #0x0100,86(a0)
		movea.l    6(a7),a0
		jsr        Awi_closed
		movea.l    6(a7),a0
		andi.w     #0xFEFF,86(a0)
demo_serv3:
		bra.s      demo_serv5
demo_serv4:
		movea.l    (a7),a1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		jsr        Awi_service
		bra.s      demo_serv6
demo_serv5:
		moveq.l    #1,d0
demo_serv6:
		lea.l      10(a7),a7
		rts

ScrollServ:
		lea.l      -44(a7),a7
		move.l     a0,40(a7)
		move.w     d0,38(a7)
		move.w     38(a7),d0
		subq.w     #1,d0
		beq.s      ScrollServ1
		subq.w     #1,d0
		beq        ScrollServ8
		bra        ScrollServ9
ScrollServ1:
		move.w     #1,36(a7)
		bra.s      ScrollServ5
ScrollServ2:
		lea.l      (a7),a0
		move.w     36(a7),d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vqt_name
		move.w     d0,34(a7)
		move.b     32(a7),d0
		beq.s      ScrollServ4
		lea.l      x8695c,a1
		move.l     a1,-(a7)
		lea.l      4(a7),a0
		jsr        strupr
		movea.l    (a7)+,a1
		jsr        strstr
		move.l     a0,d0
		bne.s      ScrollServ3
		lea.l      x86962,a1
		lea.l      (a7),a0
		jsr        strstr
		move.l     a0,d0
		beq.s      ScrollServ4
ScrollServ3:
		move.w     34(a7),d0
		ext.l      d0
		moveq.l    #16,d1
		lsl.l      d1,d0
		or.l       #0x0000000B,d0
		movea.l    40(a7),a0
		movea.l    12(a0),a0
		move.l     d0,4(a0)
		bra.s      ScrollServ6
ScrollServ4:
		addq.w     #1,36(a7)
ScrollServ5:
		movea.l    ACSblk,a0
		move.w     36(a7),d0
		cmp.w      644(a0),d0
		ble        ScrollServ2
ScrollServ6:
		movea.l    ACSblk,a0
		move.w     36(a7),d0
		cmp.w      644(a0),d0
		ble.s      ScrollServ7
		movea.l    ACSblk,a0
		move.w     660(a0),d0
		ext.l      d0
		moveq.l    #16,d1
		lsl.l      d1,d0
		movea.l    ACSblk,a0
		move.w     662(a0),d1
		ext.l      d1
		or.l       d1,d0
		movea.l    40(a7),a0
		movea.l    12(a0),a0
		move.l     d0,4(a0)
ScrollServ7:
		bra.s      ScrollServ10
ScrollServ8:
		bra.s      ScrollServ10
ScrollServ9:
		clr.w      d0
		bra.s      ScrollServ11
ScrollServ10:
		moveq.l    #1,d0
ScrollServ11:
		lea.l      44(a7),a7
		rts

ScrollDemo:
		move.l     d2,-(a7)
		move.l     a2,-(a7)
		lea.l      -32(a7),a7
		movea.l    44(a7),a0
		move.w     10(a0),d0
		move.w     d0,24(a7)
		movea.l    ACSblk,a0
		move.w     18(a0),d1
		asr.w      #1,d1
		add.w      d1,d0
		move.w     d0,16(a7)
		movea.l    44(a7),a0
		move.w     12(a0),d0
		move.w     d0,26(a7)
		movea.l    ACSblk,a0
		move.w     20(a0),d1
		asr.w      #1,d1
		add.w      d1,d0
		move.w     d0,18(a7)
		movea.l    44(a7),a0
		move.w     10(a0),d0
		movea.l    44(a7),a0
		add.w      14(a0),d0
		subq.w     #1,d0
		move.w     d0,28(a7)
		movea.l    ACSblk,a0
		move.w     18(a0),d1
		asr.w      #1,d1
		sub.w      d1,d0
		move.w     d0,20(a7)
		movea.l    44(a7),a0
		move.w     12(a0),d0
		movea.l    44(a7),a0
		add.w      16(a0),d0
		subq.w     #1,d0
		move.w     d0,30(a7)
		movea.l    ACSblk,a0
		move.w     20(a0),d1
		asr.w      #1,d1
		sub.w      d1,d0
		move.w     d0,22(a7)
		movea.l    44(a7),a0
		move.w     22(a0),d0
		bne.s      ScrollDemo1
		movea.l    44(a7),a0
		move.w     24(a0),d0
		beq.s      ScrollDemo2
ScrollDemo1:
		movea.l    44(a7),a0
		move.w     18(a0),24(a7)
		movea.l    44(a7),a0
		move.w     20(a0),26(a7)
		movea.l    44(a7),a0
		move.w     18(a0),d0
		movea.l    44(a7),a0
		add.w      22(a0),d0
		subq.w     #1,d0
		move.w     d0,28(a7)
		movea.l    44(a7),a0
		move.w     20(a0),d0
		movea.l    44(a7),a0
		add.w      24(a0),d0
		subq.w     #1,d0
		move.w     d0,30(a7)
		lea.l      24(a7),a0
		moveq.l    #1,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
ScrollDemo2:
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vswr_mode
		movea.l    ACSblk,a0
		cmpi.w     #4,28(a0)
		blt.s      ScrollDemo3
		moveq.l    #8,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_color
		bra.s      ScrollDemo4
ScrollDemo3:
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_color
ScrollDemo4:
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vsf_interior
		lea.l      24(a7),a0
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_bar
		movea.l    44(a7),a0
		move.w     22(a0),d0
		bne.s      ScrollDemo5
		movea.l    44(a7),a0
		move.w     24(a0),d0
		beq        ScrollDemo9
ScrollDemo5:
		movea.l    44(a7),a0
		move.w     18(a0),d0
		cmp.w      16(a7),d0
		ble.s      ScrollDemo6
		movea.l    44(a7),a0
		move.w     18(a0),16(a7)
ScrollDemo6:
		movea.l    44(a7),a0
		move.w     20(a0),d0
		cmp.w      18(a7),d0
		ble.s      ScrollDemo7
		movea.l    44(a7),a0
		move.w     20(a0),18(a7)
ScrollDemo7:
		movea.l    44(a7),a0
		move.w     18(a0),d0
		movea.l    44(a7),a0
		add.w      22(a0),d0
		subq.w     #1,d0
		cmp.w      20(a7),d0
		bge.s      ScrollDemo8
		movea.l    44(a7),a0
		move.w     18(a0),d0
		movea.l    44(a7),a0
		add.w      22(a0),d0
		subq.w     #1,d0
		move.w     d0,20(a7)
ScrollDemo8:
		movea.l    44(a7),a0
		move.w     20(a0),d0
		movea.l    44(a7),a0
		add.w      24(a0),d0
		subq.w     #1,d0
		cmp.w      22(a7),d0
		bge.s      ScrollDemo9
		movea.l    44(a7),a0
		move.w     20(a0),d0
		movea.l    44(a7),a0
		add.w      24(a0),d0
		subq.w     #1,d0
		move.w     d0,22(a7)
ScrollDemo9:
		lea.l      16(a7),a0
		moveq.l    #1,d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		movea.l    44(a7),a0
		move.w     4(a0),d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		movea.l    44(a7),a0
		movea.l    (a0),a0
		adda.l     d0,a0
		move.l     a0,(a7)
		moveq.l    #2,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vswr_mode
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_color
		movea.l    (a7),a0
		movea.l    12(a0),a0
		move.l     4(a0),d1
		moveq.l    #16,d0
		asr.l      d0,d1
		and.w      #0xFFFF,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		moveq.l    #-1,d0
		movea.l    (a7),a0
		movea.l    12(a0),a0
		and.w      6(a0),d0
		move.w     d0,12(a7)
		pea.l      12(a7)
		pea.l      18(a7)
		lea.l      18(a7),a1
		lea.l      18(a7),a0
		move.w     20(a7),d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_height
		addq.w     #8,a7
		lea.l      10(a7),a1
		lea.l      10(a7),a0
		moveq.l    #5,d2
		moveq.l    #1,d1
		movea.l    ACSblk,a2
		move.w     16(a2),d0
		jsr        vst_alignment
		movea.l    44(a7),a0
		move.w     14(a0),d0
		asr.w      #1,d0
		movea.l    44(a7),a0
		add.w      10(a0),d0
		move.w     d0,6(a7)
		move.w     12(a7),d0
		lsl.w      #5,d0
		movea.l    44(a7),a0
		add.w      16(a0),d0
		ext.l      d0
		move.l     stepper,d1
		cmp.l      d0,d1
		ble.s      ScrollDemo10
		clr.l      stepper
ScrollDemo10:
		movea.l    44(a7),a0
		move.w     12(a0),d0
		movea.l    44(a7),a0
		add.w      16(a0),d0
		movea.l    ACSblk,a0
		sub.w      20(a0),d0
		sub.w      stepper+2,d0
		move.w     d0,4(a7)
		clr.w      8(a7)
		bra        ScrollDemo16
ScrollDemo11:
		moveq.l    #2,d0
		add.w      12(a7),d0
		add.w      d0,4(a7)
		movea.l    44(a7),a0
		move.w     4(a7),d0
		cmp.w      12(a0),d0
		ble        ScrollDemo15
		move.w     4(a7),d0
		add.w      12(a7),d0
		movea.l    44(a7),a0
		move.w     12(a0),d1
		movea.l    44(a7),a0
		add.w      16(a0),d1
		cmp.w      d1,d0
		bge        ScrollDemo15
		move.w     8(a7),d0
		lsl.w      #2,d0
		lea.l      demotext,a0
		movea.l    0(a0,d0.w),a0
		cmpi.b     #'*',(a0)
		bne.s      ScrollDemo14
		movea.l    ACSblk,a0
		cmpi.w     #4,28(a0)
		blt.s      ScrollDemo12
		moveq.l    #2,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_color
		bra.s      ScrollDemo13
ScrollDemo12:
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_effects
ScrollDemo13:
		move.w     8(a7),d0
		lsl.w      #2,d0
		lea.l      demotext,a0
		movea.l    0(a0,d0.w),a0
		addq.w     #1,a0
		move.w     4(a7),d2
		move.w     6(a7),d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_gtext
		bra.s      ScrollDemo15
ScrollDemo14:
		moveq.l    #1,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_color
		clr.w      d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_effects
		move.w     8(a7),d0
		lsl.w      #2,d0
		lea.l      demotext,a0
		movea.l    0(a0,d0.w),a0
		move.w     4(a7),d2
		move.w     6(a7),d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        v_gtext
ScrollDemo15:
		addq.w     #1,8(a7)
ScrollDemo16:
		cmpi.w     #32,8(a7)
		blt        ScrollDemo11
		lea.l      16(a7),a0
		clr.w      d1
		movea.l    ACSblk,a1
		move.w     16(a1),d0
		jsr        vs_clip
		clr.w      d0
		lea.l      32(a7),a7
		movea.l    (a7)+,a2
		move.l     (a7)+,d2
		rts

		.data

regstart:
		dc.l x86470
		dc.l x86471
		dc.l x86475
		dc.l x86486
		dc.l x86496
		dc.l x86497
		dc.l x864b1
		dc.l x864b2
		dc.l x864b3
		dc.l x864b4
		dc.l x864ce
		dc.l x864cf
		dc.l x86515
		dc.l x86527
		dc.l x86528
		dc.l x8656e
		dc.l x865b4
		dc.l x865fa
		dc.l x86640
		dc.l x86686
		dc.l 0

regscheck:
		dc.l x86687
		dc.l x866c2
		dc.l 0

regkonto:
		dc.l x866c3
		dc.l x8670e
		dc.l x8671e
		dc.l x8671f
		dc.l x86731
		dc.l x86744
		dc.l x86759
		dc.l x8676b
		dc.l 0

reginn:
		dc.l x8676c
		dc.l x867a5
		dc.l 0

regonn:
		dc.l x867a6
		dc.l x867e0
		dc.l 0

regmail:
		dc.l x867e1
		dc.l x86824
		dc.l x86857
		dc.l 0

regend:
		dc.l x86858
		dc.l x86859
		dc.l x8685a
		dc.l x86862
		dc.l x86863
		dc.l x86872
		dc.l 0

runasdemo:
		dc.w 1
wdemo:
		dc.l 0

stepper:
		dc.l 0

cfg:    ds.b 2370
last_path:
		dc.l cfg+192
helpacc:
		dc.l cfg+151
gluepart:
		dc.w 1
dirtysave:
		dc.w 0
snapping:
		dc.w 1
imagesnap:
		dc.w 1
copyindex:
		dc.w 1
refimages:
		dc.w 1
A_DEMO:
		dc.b '[4][ Dies ist eine Demoversion, | in der alle Funktionen| nutzbar sind, die jedoch | nur zwei Objekte in einer| Objektliste anlegen kann.][   OK   ]',0
ERR_WICLOSE:
		dc.b '[3][ Dieses Fenster darf| nicht gelîscht werden! ][    OK    ]',0
BUBBLE_01:
		dc.b 'Tragen Sie hier bitte Ihren Namen ein.',0
BUBBLE_02:
		dc.b 'Tragen Sie hier bitte Ihre Seriennummer ein.',0
BUBBLE_03:
		dc.b 'Tragen Sie hier bitte Ihren persînlichen SchlÅssel fÅr diese ACS-Version ein.',0
BUBBLE_04:
		dc.b 'Geben Sie hier bitte den Namen Ihres Hilfe-Accessories an.',0
BUBBLE_05:
		dc.b 'Die Einstellungen werden sofort fÅr den nÑchsten ACS-Start gesichert.',0
BUBBLE_06:
		dc.b 'Tragen Sie hier bitte Ihren Namen ein.',0
BUBBLE_07:
		dc.b 'Hier wird festgelegt, ob Objekte bei Positions- oder GrîûenÑnderungen auf Zeichenpositionen einrasten sollen oder nicht.',0
BUBBLE_08:
		dc.b 'Hier wird festgelegt, ob beim Kopieren von ObjektbÑumen die Bezeichner der Indizes mitkopiert werden sollen.',0
BUBBLE_09:
		dc.b 'Hier wird eingestellt, ob Bild-Daten beim Kopieren innerhalb einer ACS-Datei kopiert oder nur referenziert werden sollen.',0
BUBBLE_10:
		dc.b 'Hier wird eingestellt, ob beim Verlassen des GUI-Editors die Konfigurationsdatei abgespeichert wird oder nicht.',0
BUBBLE_11:
		dc.b 'Hier wird eingestellt, ob beim Sichern die Editor-Fenster geîffnet bleiben sollen oder nicht (genauere Infos in der Online-Hilfe).',0
BUBBLE_12:
		dc.b 'Hier wird eingestellt, ob das Teile-Fenster mit allen zur VerfÅgung stehenden Objekten links neben dem Objekt-Editor mitgefÅhrt werden soll oder nicht.',0
BUBBLE_13:
		dc.b 'Hier wird der Rasterwert eingestellt, auf dessen Vielfaches bei Icon- und Bild-Operationen eingeschnappt werden soll.',0
DEMOT01:
		dc.b '*Willkommen beim ACSpro-GUI-Editor V3.0.0',0xe1,0
DEMOT02:
		dc.b ' ',0
DEMOT03:
		dc.b 'Mit diesem Programm kînnen Sie',0
DEMOT04:
		dc.b 'sehr komfortabel, Ñuûerst intuitiv',0
DEMOT05:
		dc.b 'und Åbersichtlich die OberflÑche',0
DEMOT06:
		dc.b 'und die Routinen Ihrer Programme',0
DEMOT07:
		dc.b 'gestalten und entwickeln.',0
DEMOT08:
		dc.b 0
DEMOT09:
		dc.b 'Sie benutzen zur Zeit eine leicht',0
DEMOT10:
		dc.b 'eingeschrÑnkte Version, in der Sie',0
DEMOT11:
		dc.b 'alle Funktionen benutzen kînnen,',0
DEMOT12:
		dc.b 'allerdings kînnen in den Objektlisten',0
DEMOT13:
		dc.b 'nur maximal zwei Objekte angelegt werden.',0
DEMOT14:
		dc.b 0
DEMOT15:
		dc.b 'Mîchten Sie in den vollen Genuû',0
DEMOT16:
		dc.b 'des ACSpro-Paketes gelangen, so',0
DEMOT17:
		dc.b 'wenden Sie sich bitte an:',0
DEMOT18:
		dc.b 0
DEMOT19:
		dc.b '*Martin ElsÑsser',0
DEMOT20:
		dc.b '*GartenÑcker 30',0
DEMOT21:
		dc.b '*D - 86938 Schondorf a.A.',0
DEMOT22:
		dc.b 0
DEMOT23:
		dc.b 'oder alternativ per EMail:',0
DEMOT24:
		dc.b 0
DEMOT25:
		dc.b '*acspro@atari-home.de',0
DEMOT26:
		dc.b 0
DEMOT27:
		dc.b 'Aktuelle Informationen zu ACSpro',0
DEMOT28:
		dc.b 'finden finden Sie im Internet unter:',0
DEMOT29:
		dc.b 0
DEMOT30:
		dc.b '*http://acspro.atari.org/',0
DEMOT31:
		dc.b 0
DEMOT32:
		dc.b 'Viel Spaû wÅnscht...   Martin ElsÑsser',0
STGUIDE_01:
		dc.b 'Die Einstellungen',0
TEXT_002:
		dc.b 0
TEXT_005:
		dc.b 'Sichern',0
TEXT_01:
		dc.b 'Bildraster:',0
TEXT_02:
		dc.b 'schnell sichern',0
TEXT_03:
		dc.b ' Einstellungen ',0
TEXT_04:
		dc.b '.ACC',0
TEXT_05:
		dc.b 'Hilfe:',0
TEXT_06:
		dc.b ' Information ',0
TEXT_07:
		dc.b 'Teilefenster mitfÅhren',0
TEXT_08:
		dc.b 'Registrierung:',0
TEXT_09:
		dc.b 'Name:',0
TEXT_10:
		dc.b 'Seriennummer:',0
TEXT_11:
		dc.b 'SchlÅssel:',0
TEXT_12:
		dc.b 'GUI-Editor:',0
TEXT_13:
		dc.b ' Information ',0
TEXT_14:
		dc.b 0
TEXT_15:
		dc.b 'Bitte lassen Sie sich fÅr ACSpro registrieren, daraufhin entfÑllt die lÑstige BeschrÑnkung auf zwei neue Objekte pro Objektliste.',0
TEXT_16:
		dc.b 'Registrierung sichern',0
TEXT_17:
		dc.b 'Name:',0
TEXT_18:
		dc.b 'Straûe:',0
TEXT_19:
		dc.b ' Ort:',0
TEXT_20:
		dc.b '   Land:',0
TEXT_21:
		dc.b 'Zahlunsart:',0
TEXT_218:
		dc.b 'Objekte einrasten',0
TEXT_22:
		dc.b 'ST-GUIDE',0
TEXT_220:
		dc.b 'Kopiere Index',0
TEXT_23:
		dc.b 'Vorname & Name',0
TEXT_24:
		dc.b 'Seriennummer',0
TEXT_25:
		dc.b 'SchlÅssel',0
TEXT_26:
		dc.b 'Nachnahme:',0
TEXT_260:
		dc.b 'Hier werden globale Einstellungen am ACS-Editor vorgenommen.',0
TEXT_265:
		dc.b 'Kopiere Bildteil',0
TEXT_27:
		dc.b 'innerhalb oder',0
TEXT_28:
		dc.b 'auûerhalb Deutschlands.',0
TEXT_29:
		dc.b 'OK',0
TEXT_30:
		dc.b 'EMail:',0
TEXT_31:
		dc.b 'Abbrechen',0
TEXT_32:
		dc.b 'Registrierdaten',0
TEXT_325:
		dc.b 'automatisch Sichern',0
TEXT_33:
		dc.b 'EINSTELLUNG',0
proto_winame:
		dc.b ' Hinweis ',0
rkind0:
		dc.b '  Scheck',0
rkind1:
		dc.b '  öberweisung',0
rkind2:
		dc.b '  Nachnahme',0
		dc.b 0
A_3DBUTTON01:
		dc.l A_3Dbutton
		dc.w 0x2011
		dc.w 0x9178
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON02:
		dc.l A_3Dbutton
		dc.w 0x2021
		dc.w 0x9178
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON03:
		dc.l A_3Dbutton
		dc.w 0x21f1
		dc.w 0x0178
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON04:
		dc.l A_3Dbutton
		dc.w 0x29f1
		dc.w 0x01f8
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON05:
		dc.l A_3Dbutton
		dc.w 0x29c1
		dc.w 0x0178
		dc.l Auo_string
		dc.l TEXT_005
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_05
		dc.w 0
		dc.w 0
A_3DBUTTON06:
		dc.l A_3Dbutton
		dc.w 0x29f1
		dc.w 0x0178
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON07:
		dc.l A_3Dbutton
		dc.w 0x09f1
		dc.w 0x0178
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON08:
		dc.l A_3Dbutton
		dc.w 0x2811
		dc.w 0x9170
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON09:
		dc.l A_3Dbutton
		dc.w 0x29c1
		dc.w 0x0178
		dc.l Auo_string
		dc.l TEXT_16
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON10:
		dc.l A_3Dbutton
		dc.w 0x09f1
		dc.w 0x0178
		dc.l Auo_string
		dc.l rkind1
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON11:
		dc.l A_3Dbutton
		dc.w 0x09f1
		dc.w 0x0178
		dc.l Auo_string
		dc.l rkind0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON12:
		dc.l A_3Dbutton
		dc.w 0x09f1
		dc.w 0x0178
		dc.l Auo_string
		dc.l rkind2
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON13:
		dc.l A_3Dbutton
		dc.w 0x29f1
		dc.w 0x0178
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON14:
		dc.l A_3Dbutton
		dc.w 0x29c1
		dc.w 0x0178
		dc.l Auo_string
		dc.l TEXT_29
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_3DBUTTON15:
		dc.l A_3Dbutton
		dc.w 0x29c1
		dc.w 0x0178
		dc.l Auo_string
		dc.l TEXT_31
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_ARROWS01:
		dc.l A_arrows
		dc.w 0xb101
		dc.w 0x0009
		dc.l Auo_string
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_BOXED01:
		dc.l A_boxed
		dc.w 0x8838
		dc.w 0x7f12
		dc.l Auo_boxed
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_01
		dc.w 0
		dc.w 0
A_BOXED02:
		dc.l A_boxed
		dc.w 0x9018
		dc.w 0x081a
		dc.l Auo_boxed
		dc.l TEXT_22
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_04
		dc.w 0
		dc.w 0
A_BOXED03:
		dc.l A_boxed
		dc.w 0x9070
		dc.w 0x0a12
		dc.l Auo_boxed
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_02
		dc.w 0
		dc.w 0
A_BOXED04:
		dc.l A_boxed
		dc.w 0x9040
		dc.w 0x0a1a
		dc.l Auo_boxed
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_03
		dc.w 0
		dc.w 0
A_BOXED05:
		dc.l A_boxed
		dc.w 0x9038
		dc.w 0x3c12
		dc.l Auo_boxed
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_BOXED06:
		dc.l A_boxed
		dc.w 0x9038
		dc.w 0xff12
		dc.l Auo_boxed
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_06
		dc.w 0
		dc.w 0
A_BOXED07:
		dc.l A_boxed
		dc.w 0x9038
		dc.w 0x0a12
		dc.l Auo_boxed
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_02
		dc.w 0
		dc.w 0
A_BOXED08:
		dc.l A_boxed
		dc.w 0x9038
		dc.w 0x0a12
		dc.l Auo_boxed
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_03
		dc.w 0
		dc.w 0
A_CHECKBOX01:
		dc.l A_checkbox
		dc.w 0
		dc.w 1
		dc.l Auo_string
		dc.l TEXT_218
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_07
		dc.w 0
		dc.w 0
A_CHECKBOX02:
		dc.l A_checkbox
		dc.w 0
		dc.w 1
		dc.l Auo_string
		dc.l TEXT_07
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_12
		dc.w 0
		dc.w 0
A_CHECKBOX03:
		dc.l A_checkbox
		dc.w 0
		dc.w 1
		dc.l Auo_string
		dc.l TEXT_220
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_08
		dc.w 0
		dc.w 0
A_CHECKBOX04:
		dc.l A_checkbox
		dc.w 0
		dc.w 1
		dc.l Auo_string
		dc.l TEXT_265
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_09
		dc.w 0
		dc.w 0
A_CHECKBOX05:
		dc.l A_checkbox
		dc.w 0
		dc.w 1
		dc.l Auo_string
		dc.l TEXT_325
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_10
		dc.w 0
		dc.w 0
A_CHECKBOX06:
		dc.l A_checkbox
		dc.w 0
		dc.w 1
		dc.l Auo_string
		dc.l TEXT_02
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_11
		dc.w 0
		dc.w 0
A_CHECKBOX07:
		dc.l A_checkbox
		dc.w 0
		dc.w 1
		dc.l Auo_string
		dc.l TEXT_27
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_CHECKBOX08:
		dc.l A_checkbox
		dc.w 0
		dc.w 1
		dc.l Auo_string
		dc.l TEXT_28
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_FTEXT01:
		dc.l A_ftext
		dc.w 1
		dc.w 0x010d
		dc.l Auo_ftext
		dc.l TEXT_15
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_FTEXT02:
		dc.l A_ftext
		dc.w 0x0001
		dc.w 0x000d
		dc.l Auo_ftext
		dc.l TEXT_260
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME01:
		dc.l A_innerframe
		dc.w 0x1800
		dc.w 0x8f19
		dc.l Auo_string
		dc.l TEXT_01
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME02:
		dc.l A_innerframe
		dc.w 0x1800
		dc.w 0x8f19
		dc.l Auo_string
		dc.l TEXT_12
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME03:
		dc.l A_innerframe
		dc.w 0x1800
		dc.w 0x8f19
		dc.l Auo_string
		dc.l TEXT_08
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME04:
		dc.l A_innerframe
		dc.w 0x1800
		dc.w 0x8f19
		dc.l Auo_string
		dc.l TEXT_05
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME05:
		dc.l A_innerframe
		dc.w 0x1000
		dc.w 0x8f19
		dc.l Auo_string
		dc.l TEXT_26
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_INNERFRAME06:
		dc.l A_innerframe
		dc.w 0x1800
		dc.w 0x8f19
		dc.l Auo_string
		dc.l TEXT_32
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
A_SLIDER01:
		dc.l A_slider
		dc.w 0
		dc.w 0x0002
		dc.l Auo_slider
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l BUBBLE_13
		dc.w 0
		dc.w 0
SCROLLDEMO02:
		dc.l ScrollDemo
		dc.w 0
		dc.w 0
		dc.l ScrollServ
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
_MSK_ICON_ADJUST:
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xfffc
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xfffe
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x7fff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x3fff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
_DAT_ICON_ADJUST:
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xfffc
		dc.w 0x8000
		dc.w 0x0000
		dc.w 0x0006
		dc.w 0x8000
		dc.w 0x0000
		dc.w 0x0007
		dc.w 0x9fff
		dc.w 0xffff
		dc.w 0xffe7
		dc.w 0x9fff
		dc.w 0xffff
		dc.w 0xffe7
		dc.w 0x9800
		dc.w 0x0000
		dc.w 0x0027
		dc.w 0x9800
		dc.w 0x00e0
		dc.w 0x0027
		dc.w 0x9842
		dc.w 0x11f0
		dc.w 0x8427
		dc.w 0x9842
		dc.w 0x11b0
		dc.w 0x8427
		dc.w 0x9842
		dc.w 0x11b0
		dc.w 0x8427
		dc.w 0x9800
		dc.w 0x01b0
		dc.w 0x0027
		dc.w 0x99ff
		dc.w 0xffbf
		dc.w 0xff27
		dc.w 0x9bff
		dc.w 0xffbf
		dc.w 0xffa7
		dc.w 0x9b00
		dc.w 0x01b8
		dc.w 0x01a7
		dc.w 0x9b00
		dc.w 0x01b8
		dc.w 0x01a7
		dc.w 0x9b00
		dc.w 0x01b8
		dc.w 0x01a7
		dc.w 0x99ff
		dc.w 0xffbf
		dc.w 0xff27
		dc.w 0x9800
		dc.w 0x01b0
		dc.w 0x0027
		dc.w 0x9842
		dc.w 0x11b0
		dc.w 0x8427
		dc.w 0x9842
		dc.w 0x11b0
		dc.w 0x8427
		dc.w 0x9842
		dc.w 0x11f0
		dc.w 0x8427
		dc.w 0x9800
		dc.w 0x00e0
		dc.w 0x0027
		dc.w 0x9800
		dc.w 0x0000
		dc.w 0x0027
		dc.w 0x9fff
		dc.w 0xffff
		dc.w 0xffe7
		dc.w 0x8000
		dc.w 0x0000
		dc.w 0x0007
		dc.w 0x8000
		dc.w 0x0000
		dc.w 0x0007
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x7fff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x3fff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
ICON_ADJUST:
		dc.l _MSK_ICON_ADJUST
		dc.l _DAT_ICON_ADJUST
		dc.l TEXT_33
		dc.w 0x1000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x000c
		dc.w 0x0000
		dc.w 0x0030
		dc.w 0x001e
		dc.w 0x0000
		dc.w 0x0020
		dc.w 0x0048
		dc.w 0x0008
		dc.w 0x0000
		dc.w 0x0000
P_REGISTER:
		dc.w 0xffff
		dc.w 0x0001
		dc.w 0x0003
		dc.w 0x0014
		dc.w 0x0000
		dc.w 0x0020
		dc.w 0x00ff
		dc.w 0x1100
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x000f
		dc.w 0x0003
_01_P_REGISTER:
		dc.w 0x0002
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0041
		dc.w 0x0000
		dc.l A_3DBUTTON11
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x000f
		dc.w 0x0001
_02_P_REGISTER:
		dc.w 0x0003
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0041
		dc.w 0x0000
		dc.l A_3DBUTTON10
		dc.w 0x0000
		dc.w 0x0001
		dc.w 0x000f
		dc.w 0x0001
_03_P_REGISTER:
		dc.w 0x0000
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0061
		dc.w 0x0000
		dc.l A_3DBUTTON12
		dc.w 0x0000
		dc.w 0x0002
		dc.w 0x000f
		dc.w 0x0001
ACS_BASE:
		dc.w 0xffff
		dc.w 0x0001
		dc.w 0x001d
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0010
		dc.l A_3DBUTTON03
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x002c
		dc.w 0x000e
_01_ACS_BASE:
		dc.w 0x000a
		dc.w 0x0002
		dc.w 0x0009
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_INNERFRAME03
		dc.w 0x0001
		dc.w 0x0000
		dc.w 0x002a
		dc.w 0x0005
_02_ACS_BASE:
		dc.w 0x0003
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x001c
		dc.w 0x0040
		dc.w 0x0000
		dc.l TEXT_09
		dc.w 0x0009
		dc.w 0x0001
		dc.w 0x0005
		dc.w 0x0001
_03_ACS_BASE:
		dc.w 0x0008
		dc.w 0x0004
		dc.w 0x0004
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_3DBUTTON01
		dc.w 0x000f
		dc.w 0x0001
		dc.w 0x001a
		dc.w 0x0003
_04_ACS_BASE:
		dc.w 0x0003
		dc.w 0x0005
		dc.w 0x0007
		dc.w 0x0014
		dc.w 0x0040
		dc.w 0x0000
		dc.w 0x00ff
		dc.w 0x0101
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x001a
		dc.w 0x0003
_05_ACS_BASE:
		dc.w 0x0006
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0008
		dc.w 0x0000
		dc.l A_BOXED01
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x001a
		dc.w 0x0001
_06_ACS_BASE:
		dc.w 0x0007
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0008
		dc.w 0x0000
		dc.l A_BOXED03
		dc.w 0x0000
		dc.w 0x0001
		dc.w 0x000a
		dc.w 0x0001
_07_ACS_BASE:
		dc.w 0x0004
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0008
		dc.w 0x0000
		dc.l A_BOXED04
		dc.w 0x0000
		dc.w 0x0002
		dc.w 0x000a
		dc.w 0x0001
_08_ACS_BASE:
		dc.w 0x0009
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x001c
		dc.w 0x0040
		dc.w 0x0000
		dc.l TEXT_10
		dc.w 0x0001
		dc.w 0x0002
		dc.w 0x000d
		dc.w 0x0001
_09_ACS_BASE:
		dc.w 0x0001
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x001c
		dc.w 0x0040
		dc.w 0x0000
		dc.l TEXT_11
		dc.w 0x0004
		dc.w 0x0003
		dc.w 0x000a
		dc.w 0x0001
_10_ACS_BASE:
		dc.w 0x0017
		dc.w 0x000b
		dc.w 0x0015
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_INNERFRAME02
		dc.w 0x0001
		dc.w 0x0005
		dc.w 0x001c
		dc.w 0x0008
_11_ACS_BASE:
		dc.w 0x000d
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_CHECKBOX01
		dc.w 0x0001
		dc.w 0x0001
		dc.w 0x0014
		dc.w 0x0001
_11aACS_BASE:
		dc.l ab_snap
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8000
		dc.w 0x884f
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
_13_ACS_BASE:
		dc.w 0x000f
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_CHECKBOX03
		dc.w 0x0001
		dc.w 0x0002
		dc.w 0x0010
		dc.w 0x0001
_13aACS_BASE:
		dc.l ab_copyindex
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8000
		dc.w 0x8849
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
_15_ACS_BASE:
		dc.w 0x0011
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_CHECKBOX04
		dc.w 0x0001
		dc.w 0x0003
		dc.w 0x0013
		dc.w 0x0001
_15aACS_BASE:
		dc.l ab_copyimage
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8000
		dc.w 0x8842
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
_17_ACS_BASE:
		dc.w 0x0013
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0001
		dc.w 0x0000
		dc.l A_CHECKBOX05
		dc.w 0x0001
		dc.w 0x0004
		dc.w 0x0016
		dc.w 0x0001
_17aACS_BASE:
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8000
		dc.w 0x8841
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
_19_ACS_BASE:
		dc.w 0x0015
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_CHECKBOX06
		dc.w 0x0001
		dc.w 0x0005
		dc.w 0x0012
		dc.w 0x0001
_19aACS_BASE:
		dc.l ab_dirty
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8000
		dc.w 0x884e
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
_21_ACS_BASE:
		dc.w 0x000a
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_CHECKBOX02
		dc.w 0x0001
		dc.w 0x0006
		dc.w 0x0019
		dc.w 0x0001
_21aACS_BASE:
		dc.l ab_glue
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8000
		dc.w 0x884d
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
_23_ACS_BASE:
		dc.w 0x001a
		dc.w 0x0018
		dc.w 0x0019
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_INNERFRAME04
		dc.w 0x001d
		dc.w 0x0005
		dc.w 0x000e
		dc.w 0x0003
_24_ACS_BASE:
		dc.w 0x0019
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0008
		dc.w 0x0010
		dc.l A_BOXED02
		dc.w 0x0001
		dc.w 0x0001
		dc.w 0x0008
		dc.w 0x0001
_25_ACS_BASE:
		dc.w 0x0017
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x001c
		dc.w 0x0040
		dc.w 0x0000
		dc.l TEXT_04
		dc.w 0x0009
		dc.w 0x0001
		dc.w 0x0004
		dc.w 0x0001
_26_ACS_BASE:
		dc.w 0x001d
		dc.w 0x001b
		dc.w 0x001b
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_INNERFRAME01
		dc.w 0x001d
		dc.w 0x0008
		dc.w 0x000e
		dc.w 0x0003
_27_ACS_BASE:
		dc.w 0x001a
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_SLIDER01
		dc.w 0x0001
		dc.w 0x0001
		dc.w 0x000c
		dc.w 0x0001
_27aACS_BASE:
		dc.l Aus_slider
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
_29_ACS_BASE:
		dc.w 0x0000
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0007
		dc.w 0x0010
		dc.l A_3DBUTTON05
		dc.w 0x001e
		dc.w 0x000b
		dc.w 0x000c
		dc.w 0x0002
_29aACS_BASE:
		dc.l ab_save
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8020
		dc.w 0x8853
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
ACS_DEMO:
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0042
		dc.w 0x0000
		dc.l SCROLLDEMO02
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0024
		dc.w 0x0009
_00aACS_DEMO:
		dc.l acs_register
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8020
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
ACS_RegisterObj:
		dc.w 0xffff
		dc.w 0x0001
		dc.w 0x000a
		dc.w 0x0018
		dc.w 0x0000
		dc.w 0x0000
		dc.l A_3DBUTTON13
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0024
		dc.w 0x000a
_01_ACS_RegisterObj:
		dc.w 0x0008
		dc.w 0x0002
		dc.w 0x0007
		dc.w 0x0018
		dc.w 0x0000
		dc.w 0x0000
		dc.l A_INNERFRAME06
		dc.w 0x0001
		dc.w 0x0000
		dc.w 0x0022
		dc.w 0x0007
_02_ACS_RegisterObj:
		dc.w 0x0003
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x001c
		dc.w 0x0000
		dc.w 0x0000
		dc.l TEXT_23
		dc.w 0x0001
		dc.w 0x0001
		dc.w 0x000e
		dc.w 0x0001
_03_ACS_RegisterObj:
		dc.w 0x0004
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0008
		dc.w 0x0010
		dc.l A_BOXED06
		dc.w 0x0011
		dc.w 0x0001
		dc.w 0x000e
		dc.w 0x0001
_04_ACS_RegisterObj:
		dc.w 0x0005
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x001c
		dc.w 0x0000
		dc.w 0x0000
		dc.l TEXT_24
		dc.w 0x0001
		dc.w 0x0003
		dc.w 0x000c
		dc.w 0x0001
_05_ACS_RegisterObj:
		dc.w 0x0006
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0008
		dc.w 0x0010
		dc.l A_BOXED07
		dc.w 0x0011
		dc.w 0x0003
		dc.w 0x000a
		dc.w 0x0001
_06_ACS_RegisterObj:
		dc.w 0x0007
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0008
		dc.w 0x0010
		dc.l A_BOXED08
		dc.w 0x0011
		dc.w 0x0005
		dc.w 0x000a
		dc.w 0x0001
_07_ACS_RegisterObj:
		dc.w 0x0001
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x001c
		dc.w 0x0000
		dc.w 0x0000
		dc.l TEXT_25
		dc.w 0x0001
		dc.w 0x0005
		dc.w 0x0009
		dc.w 0x0001
_08_ACS_RegisterObj:
		dc.w 0x000a
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x4007
		dc.w 0x0000
		dc.l A_3DBUTTON14
		dc.w 0x0004
		dc.w 0x0007
		dc.w 0x000b
		dc.w 0x0002
_08aACS_RegisterObj:
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8000
		dc.w 0x884f
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
_10_ACS_RegisterObj:
		dc.w 0x0000
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x4005
		dc.w 0x0000
		dc.l A_3DBUTTON15
		dc.w 0x0014
		dc.w 0x0007
		dc.w 0x000b
		dc.w 0x0002
_10aACS_RegisterObj:
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8020
		dc.w 0x8841
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
D_REGISTER:
		dc.w 0xffff
		dc.w 0x0001
		dc.w 0x0018
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_3DBUTTON06
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0028
		dc.w 0x0012
_01_D_REGISTER:
		dc.w 0x0002
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_FTEXT01
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0028
		dc.w 0x0004
_02_D_REGISTER:
		dc.w 0x0003
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_ARROWS01
		dc.w 0x0000
		dc.w 0x0004
		dc.w 0x0028
		dc.w 0x0001
_03_D_REGISTER:
		dc.w 0x0004
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x001c
		dc.w 0x0040
		dc.w 0x0000
		dc.l TEXT_18
		dc.w 0x0001
		dc.w 0x0805
		dc.w 0x0007
		dc.w 0x0001
_04_D_REGISTER:
		dc.w 0x0005
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x001c
		dc.w 0x0040
		dc.w 0x0000
		dc.l TEXT_30
		dc.w 0x0002
		dc.w 0x0808
		dc.w 0x0006
		dc.w 0x0001
_05_D_REGISTER:
		dc.w 0x0006
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x001c
		dc.w 0x0040
		dc.w 0x0000
		dc.l TEXT_17
		dc.w 0x0003
		dc.w 0x0804
		dc.w 0x0005
		dc.w 0x0001
_06_D_REGISTER:
		dc.w 0x0007
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x001c
		dc.w 0x0040
		dc.w 0x0000
		dc.l TEXT_20
		dc.w 0x0000
		dc.w 0x0807
		dc.w 0x0008
		dc.w 0x0001
_07_D_REGISTER:
		dc.w 0x0008
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x001c
		dc.w 0x0040
		dc.w 0x0000
		dc.l TEXT_21
		dc.w 0x0006
		dc.w 0x000a
		dc.w 0x000b
		dc.w 0x0001
_08_D_REGISTER:
		dc.w 0x000d
		dc.w 0x0009
		dc.w 0x000b
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_INNERFRAME05
		dc.w 0x0006
		dc.w 0x000b
		dc.w 0x001c
		dc.w 0x0004
_09_D_REGISTER:
		dc.w 0x000b
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0011
		dc.w 0x0001
		dc.l A_CHECKBOX07
		dc.w 0x0001
		dc.w 0x0001
		dc.w 0x0011
		dc.w 0x0001
_09aD_REGISTER:
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8000
		dc.w 0x8849
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
_11_D_REGISTER:
		dc.w 0x0008
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0011
		dc.w 0x0000
		dc.l A_CHECKBOX08
		dc.w 0x0001
		dc.w 0x0002
		dc.w 0x001a
		dc.w 0x0001
_11aD_REGISTER:
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8000
		dc.w 0x8841
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
_13_D_REGISTER:
		dc.w 0x000f
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0005
		dc.w 0x0000
		dc.l A_3DBUTTON09
		dc.w 0x0006
		dc.w 0x000f
		dc.w 0x001c
		dc.w 0x0002
_13aD_REGISTER:
		dc.l reg_me
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8000
		dc.w 0x8852
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
_15_D_REGISTER:
		dc.w 0x0015
		dc.w 0x0010
		dc.w 0x0014
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_3DBUTTON08
		dc.w 0x0009
		dc.w 0x0804
		dc.w 0x001e
		dc.w 0x0005
_16_D_REGISTER:
		dc.w 0x0011
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0008
		dc.w 0x0000
		dc.l A_BOXED05
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x001e
		dc.w 0x0001
_17_D_REGISTER:
		dc.w 0x0012
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0008
		dc.w 0x0000
		dc.l A_BOXED05
		dc.w 0x0000
		dc.w 0x0001
		dc.w 0x001e
		dc.w 0x0001
_18_D_REGISTER:
		dc.w 0x0013
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0008
		dc.w 0x0000
		dc.l A_BOXED05
		dc.w 0x0000
		dc.w 0x0002
		dc.w 0x001e
		dc.w 0x0001
_19_D_REGISTER:
		dc.w 0x0014
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0008
		dc.w 0x0000
		dc.l A_BOXED05
		dc.w 0x0000
		dc.w 0x0003
		dc.w 0x001e
		dc.w 0x0001
_20_D_REGISTER:
		dc.w 0x000f
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0008
		dc.w 0x0000
		dc.l A_BOXED05
		dc.w 0x0000
		dc.w 0x0004
		dc.w 0x001e
		dc.w 0x0001
_21_D_REGISTER:
		dc.w 0x0018
		dc.w 0x0017
		dc.w 0x0017
		dc.w 0x0014
		dc.w 0x0040
		dc.w 0x0020
		dc.w 0x00ff
		dc.w 0x1101
		dc.w 0x0012
		dc.w 0x000a
		dc.w 0x000f
		dc.w 0x0001
_21aD_REGISTER:
		dc.l reg_kind
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x8000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
_23_D_REGISTER:
		dc.w 0x0015
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0000
		dc.w 0x0000
		dc.l A_3DBUTTON07
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x000f
		dc.w 0x0001
_24_D_REGISTER:
		dc.w 0x0000
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x001c
		dc.w 0x0060
		dc.w 0x0000
		dc.l TEXT_19
		dc.w 0x0003
		dc.w 0x0806
		dc.w 0x0005
		dc.w 0x0001
INFO_BASE:
		dc.w 0xffff
		dc.w 0x0001
		dc.w 0x0001
		dc.w 0x0019
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x00ff
		dc.w 0x1178
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x001c
		dc.w 0x0005
_01_INFO_BASE:
		dc.w 0x0000
		dc.w 0x0002
		dc.w 0x0002
		dc.w 0x0018
		dc.w 0x0007
		dc.w 0x0010
		dc.l A_3DBUTTON04
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x001c
		dc.w 0x0005
_02_INFO_BASE:
		dc.w 0x0001
		dc.w 0x0003
		dc.w 0x0003
		dc.w 0x0018
		dc.w 0x0040
		dc.w 0x0000
		dc.l A_3DBUTTON02
		dc.w 0x0002
		dc.w 0x0001
		dc.w 0x0018
		dc.w 0x0003
_03_INFO_BASE:
		dc.w 0x0002
		dc.w 0x0004
		dc.w 0x0004
		dc.w 0x0014
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x1101
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0018
		dc.w 0x0003
_04_INFO_BASE:
		dc.w 0x0003
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0x0018
		dc.w 0x0860
		dc.w 0x0000
		dc.l A_FTEXT02
		dc.w 0x0000
		dc.w 0x0000
		dc.w 0x0018
		dc.w 0x0003

	.globl WI_COMMON
WI_COMMON:
		dc.l 0
		dc.l ab_service
		dc.l ab_make
		dc.l Awi_open
		dc.l Awi_init
		dc.l ACS_BASE
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0xffff
		dc.w 0x600b
		dc.w 0
		dc.w 0
		dc.w 0x0063
		dc.w 0x0063
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0
		dc.w 0
		dc.w 0xfcf8
		dc.l TEXT_03
		dc.l TEXT_002
		dc.w 0x2710
		dc.w 0x0103
		dc.w 0
		dc.w 0xffff
		dc.l ICON_ADJUST
		dc.w 0
		dc.w 0
		dc.l Awi_keys
		dc.l Awi_obchange
		dc.l Awi_redraw
		dc.l Awi_topped
		dc.l Awi_closed
		dc.l Awi_fulled
		dc.l Awi_arrowed
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l Awi_gemscript
		dc.l STGUIDE_01
		dc.l 0

WI_DEMO:
		dc.w 0
		dc.w 0
		dc.l demo_serv
		dc.l Awi_selfcreate
		dc.l Awi_open
		dc.l demo_init
		dc.l ACS_DEMO
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0xffff
		dc.w 0x000b
		dc.w 0
		dc.w 0
		dc.w 0x0078
		dc.w 0x0032
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0
		dc.w 0
		dc.w 0xf8f8
		dc.l TEXT_13
		dc.l TEXT_14
		dc.w 0
		dc.w 0x0100
		dc.w 0
		dc.w 0xffff
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l Awi_keys
		dc.l Awi_obchange
		dc.l Awi_redraw
		dc.l Awi_topped
		dc.l Awi_closed
		dc.l Awi_fulled
		dc.l Awi_arrowed
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l Awi_gemscript
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0

WI_INFO_BASE:
		dc.w 0
		dc.w 0
		dc.l Awi_service
		dc.l Awi_selfcreate
		dc.l Awi_open
		dc.l Awi_init
		dc.l INFO_BASE
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0xffff
		dc.w 0x000b
		dc.w 0
		dc.w 0
		dc.w 0x0078
		dc.w 0x0032
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0
		dc.w 0
		dc.w 0xf8f8
		dc.l TEXT_06
		dc.l TEXT_002
		dc.w 0x2710
		dc.w 0
		dc.w 0
		dc.w 0xffff
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l Awi_keys
		dc.l Awi_obchange
		dc.l Awi_redraw
		dc.l Awi_topped
		dc.l Awi_closed
		dc.l Awi_fulled
		dc.l Awi_arrowed
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l Awi_gemscript
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0

WI_REGISTER:
		dc.w 0
		dc.w 0
		dc.l Awi_service
		dc.l Awi_selfcreate
		dc.l Awi_open
		dc.l Awi_init
		dc.l D_REGISTER
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0xffff
		dc.w 0x400b
		dc.w 0
		dc.w 0
		dc.w 0x0078
		dc.w 0x0032
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0xffff
		dc.w 0
		dc.w 0
		dc.w 0xf8f8
		dc.l proto_winame
		dc.l TEXT_002
		dc.w 0
		dc.w 0x0100
		dc.w 0
		dc.w 0xffff
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.l Awi_keys
		dc.l Awi_obchange
		dc.l Awi_redraw
		dc.l Awi_topped
		dc.l Awi_closed
		dc.l Awi_fulled
		dc.l Awi_arrowed
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l Awi_gemscript
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0

demotext:
		dc.l DEMOT01
		dc.l DEMOT02
		dc.l DEMOT03
		dc.l DEMOT04
		dc.l DEMOT05
		dc.l DEMOT06
		dc.l DEMOT07
		dc.l DEMOT08
		dc.l DEMOT09
		dc.l DEMOT10
		dc.l DEMOT11
		dc.l DEMOT12
		dc.l DEMOT13
		dc.l DEMOT14
		dc.l DEMOT15
		dc.l DEMOT16
		dc.l DEMOT17
		dc.l DEMOT18
		dc.l DEMOT19
		dc.l DEMOT20
		dc.l DEMOT21
		dc.l DEMOT22
		dc.l DEMOT23
		dc.l DEMOT24
		dc.l DEMOT25
		dc.l DEMOT26
		dc.l DEMOT27
		dc.l DEMOT28
		dc.l DEMOT29
		dc.l DEMOT30
		dc.l DEMOT31
		dc.l DEMOT32
x86464:
		dc.l rkind0
		dc.l rkind1
		dc.l rkind2

x86470:                           dc.b 0
x86471:                           dc.b 9,'An',0
x86475:                           dc.b 9,'Martin ElsÑsser',0
x86486:                           dc.b 9,'GartenÑcker 30',0
x86496:                           dc.w 0
x86497:                           dc.b 9,'D - 86938 Schondorf a.A.',0
x864b1:                           dc.b 0
x864b2:                           dc.b 0
x864b3:                           dc.b 0
x864b4:                           dc.b 9,'Registrierung von ACSpro',0
x864ce:                           dc.b 0
x864cf:                           dc.b 9,'Hiermit beantrage ich die Registrierung von ACSpro Version ##### mit',0
x86515:                           dc.b 9,'folgenden Daten:',0
x86527:                           dc.b 0
x86528:                           dc.b 9,'  Name: 123456789012345678901234567890123456789012345678901234567890',0
x8656e:                           dc.b 9,'Straûe: 123456789012345678901234567890123456789012345678901234567890',0
x865b4:                           dc.b 9,'   Ort: 123456789012345678901234567890123456789012345678901234567890',0
x865fa:                           dc.b 9,'  Land: 123456789012345678901234567890123456789012345678901234567890',0
x86640:                           dc.b 9,' EMail: 123456789012345678901234567890123456789012345678901234567890',0
x86686:                           dc.b 0

x86687:                           dc.b 9,'Die Zahlung erfolgt per beiliegendem Scheck Åber 99,- DM.',0
x866c2:                           dc.b 0

x866c3:                           dc.b 9,'Den Betrag von 99,- DM Åberweise ich vorab - unter Angabe obigen Namens -',0
x8670e:                           dc.b 9,'auf das Konto:',0
x8671e:                           dc.b 0
x8671f:                           dc.b 9,9,'Martin ElsÑsser',0
x86731:                           dc.b 9,9,'Postbank MÅnchen',0
x86744:                           dc.b 9,9,'Kto: 1196 34 - 804',0
x86759:                           dc.b 9,9,'BLZ: 700 100 80',0
x8676b:                           dc.b 0

x8676c:                           dc.b 9,'Ich zahle den Betrag von 105,- DM per Inland-Nachnahme.',0
x867a5:                           dc.b 0

x867a6:                           dc.b 9,'Ich zahle den Betrag von 124,- DM per Ausland-Nachnahme.',0
x867e0:                           dc.b 0

x867e1:                           dc.b 9,'Durch Angabe meiner EMail-Adresse erhalte ich die Registrierdaten',0
x86824:                           dc.b 9,'an meine oben angegebenen EMail-Adresse gesendet.',0
x86857:                           dc.b 0

x86858:                           dc.b 0
x86859:                           dc.b 0
x8685a:                           dc.b 9,'Datum:',0
x86862:                           dc.b 0
x86863:                           dc.b 9,'Unterschrift:',0,0
x86873:                           dc.b 'ACS',0
x86877:                           dc.b 'ACS',0
x8687b:                           dc.b '%d',0
x8687e:                           dc.b 'ACS',0
x86882:                           dc.b 'C',0
x86884:                           dc.b 'S',0
x86886:                           dc.b 'PAS',0
x8688a:                           dc.b 'ACS',0
x8688e:                           dc.b 'ACS',0
x86892:                           dc.b 0
x86893:                           dc.b '%d',0
x86896:                           dc.b '%s',13,10,0
x8689b:                           dc.b 'register.txt',0
x868a8:                           dc.b 'Textname',0
x868b1:                           dc.b 'txt',0
x868b5:                           dc.b '%s.%s.%s',0
x868be:                           dc.b '3',0
x868c0:                           dc.b '0',0
x868c2:                           dc.b '0',0
x868c4:                           dc.b '%-60s',13,10,0
x868cc:                           dc.b '%-60s',13,10,0
x868d4:                           dc.b '%-60s',13,10,0
x868dc:                           dc.b '%-60s',13,10,0
x868e4:                           dc.b '%-60s',13,10,0
x868ec:                           dc.b '%-60s',13,10,0
x868f4:                           dc.b 0
x868f5:                           dc.b 'Plattform: ',0
x86901:                           dc.b ' Programm: ',0
x8690d:                           dc.b ' Version ',0
x86917:                           dc.b $2e,0
x86919:                           dc.b ' Seriennummer: ',0
x86929:                           dc.b ' UserName: ',0
x86935:                           dc.b '          ',0
x86940:                           dc.b '00121',0
x86946:                           dc.b 'Atari ST',0
x8694f:                           dc.b 'ACSpro',0
x86956:                           dc.b '3',0
x86958:                           dc.b '0',0
x8695a:                           dc.b 'x',0
x8695c:                           dc.b 'TIMES',0
x86962:                           dc.b 'DUTCH',0


