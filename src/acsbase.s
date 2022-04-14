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
[0001036e] 514f                      subq.w     #8,a7
[00010370] 2f48 0004                 move.l     a0,4(a7)
[00010374] 13fc 0033 0008 3eb8       move.b     #0x33,cfg
[0001037c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00010382] 2068 023c                 movea.l    572(a0),a0
[00010386] 33e8 000e 0008 3f66       move.w     14(a0),$00083F66
[0001038e] 33f9 0008 4802 0008 3f58  move.w     gluepart,$00083F58
[00010398] 33f9 0008 4804 0008 3f5c  move.w     dirtysave,$00083F5C
[000103a2] 33f9 0008 4808 0008 3f62  move.w     imagesnap,$00083F62
[000103ac] 33f9 0008 4806 0008 3f5e  move.w     snapping,$00083F5E
[000103b6] 33f9 0008 480a 0008 3f60  move.w     copyindex,$00083F60
[000103c0] 33f9 0008 480c 0008 3f64  move.w     refimages,$00083F64
[000103ca] 7001                      moveq.l    #1,d0
[000103cc] 206f 0004                 movea.l    4(a7),a0
[000103d0] 2068 0014                 movea.l    20(a0),a0
[000103d4] c068 01a2                 and.w      418(a0),d0
[000103d8] 6704                      beq.s      $000103DE
[000103da] 7001                      moveq.l    #1,d0
[000103dc] 6002                      bra.s      $000103E0
[000103de] 4240                      clr.w      d0
[000103e0] 33c0 0008 3f5a            move.w     d0,$00083F5A
[000103e6] 2079 000b b542            movea.l    parts_window,a0
[000103ec] 3028 0056                 move.w     86(a0),d0
[000103f0] c07c 0800                 and.w      #$0800,d0
[000103f4] 671a                      beq.s      $00010410
[000103f6] 7008                      moveq.l    #8,d0
[000103f8] 2279 000b b542            movea.l    parts_window,a1
[000103fe] 43e9 002c                 lea.l      44(a1),a1
[00010402] 41f9 0008 3f68            lea.l      $00083F68,a0
[00010408] 4eb9 0008 3500            jsr        memcpy
[0001040e] 6018                      bra.s      $00010428
[00010410] 7008                      moveq.l    #8,d0
[00010412] 2279 000b b542            movea.l    parts_window,a1
[00010418] 43e9 0024                 lea.l      36(a1),a1
[0001041c] 41f9 0008 3f68            lea.l      $00083F68,a0
[00010422] 4eb9 0008 3500            jsr        memcpy
[00010428] 206f 0004                 movea.l    4(a7),a0
[0001042c] 3028 0056                 move.w     86(a0),d0
[00010430] c07c 0800                 and.w      #$0800,d0
[00010434] 6718                      beq.s      $0001044E
[00010436] 7008                      moveq.l    #8,d0
[00010438] 226f 0004                 movea.l    4(a7),a1
[0001043c] 43e9 002c                 lea.l      44(a1),a1
[00010440] 41f9 0008 3f70            lea.l      $00083F70,a0
[00010446] 4eb9 0008 3500            jsr        memcpy
[0001044c] 6016                      bra.s      $00010464
[0001044e] 7008                      moveq.l    #8,d0
[00010450] 226f 0004                 movea.l    4(a7),a1
[00010454] 43e9 0024                 lea.l      36(a1),a1
[00010458] 41f9 0008 3f70            lea.l      $00083F70,a0
[0001045e] 4eb9 0008 3500            jsr        memcpy
[00010464] 4279 0008 3ff8            clr.w      $00083FF8
[0001046a] 206f 0004                 movea.l    4(a7),a0
[0001046e] 303c 2711                 move.w     #$2711,d0
[00010472] 4eb9 0005 6a20            jsr        Awi_sendall
[00010478] 41f9 0008 6873            lea.l      $00086873,a0
[0001047e] 4eb9 0004 b496            jsr        Af_cfgfile
[00010484] 4240                      clr.w      d0
[00010486] 4eb9 0008 0c8e            jsr        Fcreate
[0001048c] 2e80                      move.l     d0,(a7)
[0001048e] 2017                      move.l     (a7),d0
[00010490] 6f20                      ble.s      $000104B2
[00010492] 41f9 0008 3eb8            lea.l      cfg,a0
[00010498] 223c 0000 0942            move.l     #$00000942,d1
[0001049e] 302f 0002                 move.w     2(a7),d0
[000104a2] 4eb9 0008 0d5e            jsr        Fwrite
[000104a8] 302f 0002                 move.w     2(a7),d0
[000104ac] 4eb9 0008 0c7e            jsr        Fclose
[000104b2] 504f                      addq.w     #8,a7
[000104b4] 4e75                      rts
ab_save:
[000104b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000104bc] 2068 0258                 movea.l    600(a0),a0
[000104c0] 6100 feac                 bsr        save_it
[000104c4] 4e75                      rts
ab_make:
[000104c6] 4fef f6a0                 lea.l      -2400(a7),a7
[000104ca] 41f9 0008 615c            lea.l      WI_COMMON,a0
[000104d0] 4eb9 0005 7052            jsr        Awi_create
[000104d6] 2f48 0016                 move.l     a0,22(a7)
[000104da] 202f 0016                 move.l     22(a7),d0
[000104de] 6606                      bne.s      $000104E6
[000104e0] 91c8                      suba.l     a0,a0
[000104e2] 6000 048a                 bra        $0001096E
[000104e6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000104ec] 2068 023c                 movea.l    572(a0),a0
[000104f0] 3028 000e                 move.w     14(a0),d0
[000104f4] c07c 0100                 and.w      #$0100,d0
[000104f8] 3f40 001a                 move.w     d0,26(a7)
[000104fc] 223c 0000 0844            move.l     #$00000844,d1
[00010502] 4240                      clr.w      d0
[00010504] 41f9 000e 6e86            lea.l      cews,a0
[0001050a] 4eb9 0008 36ea            jsr        memset
[00010510] 41f9 0008 6877            lea.l      $00086877,a0
[00010516] 4eb9 0004 b496            jsr        Af_cfgfile
[0001051c] 4240                      clr.w      d0
[0001051e] 4eb9 0008 0cc0            jsr        Fopen
[00010524] 2f40 001e                 move.l     d0,30(a7)
[00010528] 202f 001e                 move.l     30(a7),d0
[0001052c] 6f00 017c                 ble        $000106AA
[00010530] 41ef 000c                 lea.l      12(a7),a0
[00010534] 7201                      moveq.l    #1,d1
[00010536] 302f 0020                 move.w     32(a7),d0
[0001053a] 4eb9 0008 0cd2            jsr        Fread
[00010540] 7201                      moveq.l    #1,d1
[00010542] b280                      cmp.l      d0,d1
[00010544] 6600 0146                 bne        $0001068C
[00010548] 4242                      clr.w      d2
[0001054a] 322f 0020                 move.w     32(a7),d1
[0001054e] 7000                      moveq.l    #0,d0
[00010550] 4eb9 0008 0cfe            jsr        Fseek
[00010556] 102f 000c                 move.b     12(a7),d0
[0001055a] 4880                      ext.w      d0
[0001055c] 907c 0032                 sub.w      #$0032,d0
[00010560] 673e                      beq.s      $000105A0
[00010562] 5340                      subq.w     #1,d0
[00010564] 6704                      beq.s      $0001056A
[00010566] 6000 010e                 bra        $00010676
[0001056a] 41f9 0008 3eb8            lea.l      cfg,a0
[00010570] 223c 0000 0942            move.l     #$00000942,d1
[00010576] 302f 0020                 move.w     32(a7),d0
[0001057a] 4eb9 0008 0cd2            jsr        Fread
[00010580] b0bc 0000 0942            cmp.l      #$00000942,d0
[00010586] 6714                      beq.s      $0001059C
[00010588] 223c 0000 0942            move.l     #$00000942,d1
[0001058e] 4240                      clr.w      d0
[00010590] 41f9 0008 3eb8            lea.l      cfg,a0
[00010596] 4eb9 0008 36ea            jsr        memset
[0001059c] 6000 00ec                 bra        $0001068A
[000105a0] 41ef 0022                 lea.l      34(a7),a0
[000105a4] 223c 0000 093e            move.l     #$0000093E,d1
[000105aa] 302f 0020                 move.w     32(a7),d0
[000105ae] 4eb9 0008 0cd2            jsr        Fread
[000105b4] b0bc 0000 093e            cmp.l      #$0000093E,d0
[000105ba] 6600 009a                 bne        $00010656
[000105be] 13fc 0033 0008 3eb8       move.b     #$33,cfg
[000105c6] 43ef 0023                 lea.l      35(a7),a1
[000105ca] 41f9 0008 3eb9            lea.l      $00083EB9,a0
[000105d0] 4eb9 0008 2f0c            jsr        strcpy
[000105d6] 43ef 0023                 lea.l      35(a7),a1
[000105da] 41f9 0008 3eb9            lea.l      $00083EB9,a0
[000105e0] 4eb9 0008 2f0c            jsr        strcpy
[000105e6] 43ef 00a3                 lea.l      163(a7),a1
[000105ea] 41f9 0008 3f39            lea.l      $00083F39,a0
[000105f0] 4eb9 0008 2f0c            jsr        strcpy
[000105f6] 43ef 00ab                 lea.l      171(a7),a1
[000105fa] 41f9 0008 3f44            lea.l      $00083F44,a0
[00010600] 4eb9 0008 2f0c            jsr        strcpy
[00010606] 43ef 00b4                 lea.l      180(a7),a1
[0001060a] 41f9 0008 3f4f            lea.l      $00083F4F,a0
[00010610] 4eb9 0008 2f0c            jsr        strcpy
[00010616] 7020                      moveq.l    #32,d0
[00010618] 43ef 00be                 lea.l      190(a7),a1
[0001061c] 41f9 0008 3f58            lea.l      $00083F58,a0
[00010622] 4eb9 0008 3500            jsr        memcpy
[00010628] 43ef 00de                 lea.l      222(a7),a1
[0001062c] 41f9 0008 3f78            lea.l      $00083F78,a0
[00010632] 4eb9 0008 2f0c            jsr        strcpy
[00010638] 33ef 015e 0008 3ff8       move.w     350(a7),$00083FF8
[00010640] 203c 0000 0800            move.l     #$00000800,d0
[00010646] 43ef 0160                 lea.l      352(a7),a1
[0001064a] 41f9 0008 3ffa            lea.l      $00083FFA,a0
[00010650] 4eb9 0008 3500            jsr        memcpy
[00010656] 0c39 0033 0008 3eb8       cmpi.b     #$33,cfg
[0001065e] 6714                      beq.s      $00010674
[00010660] 223c 0000 0942            move.l     #$00000942,d1
[00010666] 4240                      clr.w      d0
[00010668] 41f9 0008 3eb8            lea.l      cfg,a0
[0001066e] 4eb9 0008 36ea            jsr        memset
[00010674] 6014                      bra.s      $0001068A
[00010676] 223c 0000 0942            move.l     #$00000942,d1
[0001067c] 4240                      clr.w      d0
[0001067e] 41f9 0008 3eb8            lea.l      cfg,a0
[00010684] 4eb9 0008 36ea            jsr        memset
[0001068a] 6014                      bra.s      $000106A0
[0001068c] 223c 0000 0942            move.l     #$00000942,d1
[00010692] 4240                      clr.w      d0
[00010694] 41f9 0008 3eb8            lea.l      cfg,a0
[0001069a] 4eb9 0008 36ea            jsr        memset
[000106a0] 302f 0020                 move.w     32(a7),d0
[000106a4] 4eb9 0008 0c7e            jsr        Fclose
[000106aa] 0c39 0033 0008 3eb8       cmpi.b     #$33,cfg
[000106b2] 6600 00ee                 bne        $000107A2
[000106b6] 3f7c 1800 0022            move.w     #$1800,34(a7)
[000106bc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000106c2] 2068 023c                 movea.l    572(a0),a0
[000106c6] 3028 000e                 move.w     14(a0),d0
[000106ca] c06f 0022                 and.w      34(a7),d0
[000106ce] 322f 0022                 move.w     34(a7),d1
[000106d2] 4641                      not.w      d1
[000106d4] c279 0008 3f66            and.w      $00083F66,d1
[000106da] 8041                      or.w       d1,d0
[000106dc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000106e2] 2068 023c                 movea.l    572(a0),a0
[000106e6] 3140 000e                 move.w     d0,14(a0)
[000106ea] 33f9 0008 3f58 0008 4802  move.w     $00083F58,gluepart
[000106f4] 33f9 0008 3f5c 0008 4804  move.w     $00083F5C,dirtysave
[000106fe] 33f9 0008 3f62 0008 4808  move.w     $00083F62,imagesnap
[00010708] 33f9 0008 3f5e 0008 4806  move.w     $00083F5E,snapping
[00010712] 33f9 0008 3f60 0008 480a  move.w     $00083F60,copyindex
[0001071c] 33f9 0008 3f64 0008 480c  move.w     $00083F64,refimages
[00010726] 7008                      moveq.l    #8,d0
[00010728] 43f9 0008 3f68            lea.l      $00083F68,a1
[0001072e] 2079 000b b542            movea.l    parts_window,a0
[00010734] 41e8 0024                 lea.l      36(a0),a0
[00010738] 4eb9 0008 3500            jsr        memcpy
[0001073e] 206f 0016                 movea.l    22(a7),a0
[00010742] 3179 0008 3f70 0024       move.w     $00083F70,36(a0)
[0001074a] 206f 0016                 movea.l    22(a7),a0
[0001074e] 3179 0008 3f72 0026       move.w     $00083F72,38(a0)
[00010756] 0c79 0010 0008 3ff8       cmpi.w     #$0010,$00083FF8
[0001075e] 6f08                      ble.s      $00010768
[00010760] 33fc 0010 0008 3ff8       move.w     #$0010,$00083FF8
[00010768] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001076e] 3028 0236                 move.w     566(a0),d0
[00010772] 672e                      beq.s      $000107A2
[00010774] 70ff                      moveq.l    #-1,d0
[00010776] d079 0008 3ff8            add.w      $00083FF8,d0
[0001077c] 3f40 001c                 move.w     d0,28(a7)
[00010780] 601a                      bra.s      $0001079C
[00010782] 302f 001c                 move.w     28(a7),d0
[00010786] ef48                      lsl.w      #7,d0
[00010788] 41f9 0008 3ffa            lea.l      $00083FFA,a0
[0001078e] d0c0                      adda.w     d0,a0
[00010790] 2279 0009 ab82            movea.l    $0009AB82,a1
[00010796] 4e91                      jsr        (a1)
[00010798] 536f 001c                 subq.w     #1,28(a7)
[0001079c] 302f 001c                 move.w     28(a7),d0
[000107a0] 6ae0                      bpl.s      $00010782
[000107a2] 13fc 0033 0008 3eb8       move.b     #$33,cfg
[000107aa] 206f 0016                 movea.l    22(a7),a0
[000107ae] 2f68 0014 0012            move.l     20(a0),18(a7)
[000107b4] 3039 0008 4802            move.w     gluepart,d0
[000107ba] 670a                      beq.s      $000107C6
[000107bc] 206f 0012                 movea.l    18(a7),a0
[000107c0] 0068 0001 0202            ori.w      #$0001,514(a0)
[000107c6] 3039 0008 4804            move.w     dirtysave,d0
[000107cc] 670a                      beq.s      $000107D8
[000107ce] 206f 0012                 movea.l    18(a7),a0
[000107d2] 0068 0001 01d2            ori.w      #$0001,466(a0)
[000107d8] 3039 0008 4806            move.w     snapping,d0
[000107de] 670a                      beq.s      $000107EA
[000107e0] 206f 0012                 movea.l    18(a7),a0
[000107e4] 0068 0001 0112            ori.w      #$0001,274(a0)
[000107ea] 3039 0008 480a            move.w     copyindex,d0
[000107f0] 670a                      beq.s      $000107FC
[000107f2] 206f 0012                 movea.l    18(a7),a0
[000107f6] 0068 0001 0142            ori.w      #$0001,322(a0)
[000107fc] 3039 0008 480c            move.w     refimages,d0
[00010802] 670a                      beq.s      $0001080E
[00010804] 206f 0012                 movea.l    18(a7),a0
[00010808] 0068 0001 0172            ori.w      #$0001,370(a0)
[0001080e] 3039 0008 3f5a            move.w     $00083F5A,d0
[00010814] 670a                      beq.s      $00010820
[00010816] 206f 0012                 movea.l    18(a7),a0
[0001081a] 0068 0001 01a2            ori.w      #$0001,418(a0)
[00010820] 2279 0008 47fe            movea.l    helpacc,a1
[00010826] 7018                      moveq.l    #24,d0
[00010828] 206f 0012                 movea.l    18(a7),a0
[0001082c] 4eb9 0005 0fd8            jsr        Aob_puttext
[00010832] 43f9 0008 3eb9            lea.l      $00083EB9,a1
[00010838] 7005                      moveq.l    #5,d0
[0001083a] 206f 0012                 movea.l    18(a7),a0
[0001083e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00010844] 43f9 0008 3f39            lea.l      $00083F39,a1
[0001084a] 7006                      moveq.l    #6,d0
[0001084c] 206f 0012                 movea.l    18(a7),a0
[00010850] 4eb9 0005 0fd8            jsr        Aob_puttext
[00010856] 43f9 0008 3f44            lea.l      $00083F44,a1
[0001085c] 7007                      moveq.l    #7,d0
[0001085e] 206f 0012                 movea.l    18(a7),a0
[00010862] 4eb9 0005 0fd8            jsr        Aob_puttext
[00010868] 2ebc 0000 0004            move.l     #$00000004,(a7)
[0001086e] 43d7                      lea.l      (a7),a1
[00010870] 7064                      moveq.l    #100,d0
[00010872] 206f 0012                 movea.l    18(a7),a0
[00010876] 41e8 0288                 lea.l      648(a0),a0
[0001087a] 4eb9 0003 71ba            jsr        Auo_slider
[00010880] 2ebc 0000 0001            move.l     #$00000001,(a7)
[00010886] 43d7                      lea.l      (a7),a1
[00010888] 7065                      moveq.l    #101,d0
[0001088a] 206f 0012                 movea.l    18(a7),a0
[0001088e] 41e8 0288                 lea.l      648(a0),a0
[00010892] 4eb9 0003 71ba            jsr        Auo_slider
[00010898] 3039 0008 4808            move.w     imagesnap,d0
[0001089e] 5340                      subq.w     #1,d0
[000108a0] 670e                      beq.s      $000108B0
[000108a2] 5340                      subq.w     #1,d0
[000108a4] 670e                      beq.s      $000108B4
[000108a6] 5540                      subq.w     #2,d0
[000108a8] 6712                      beq.s      $000108BC
[000108aa] 5940                      subq.w     #4,d0
[000108ac] 6716                      beq.s      $000108C4
[000108ae] 601c                      bra.s      $000108CC
[000108b0] 4297                      clr.l      (a7)
[000108b2] 6018                      bra.s      $000108CC
[000108b4] 2ebc 0000 0001            move.l     #$00000001,(a7)
[000108ba] 6010                      bra.s      $000108CC
[000108bc] 2ebc 0000 0002            move.l     #$00000002,(a7)
[000108c2] 6008                      bra.s      $000108CC
[000108c4] 2ebc 0000 0003            move.l     #$00000003,(a7)
[000108ca] 4e71                      nop
[000108cc] 43d7                      lea.l      (a7),a1
[000108ce] 7011                      moveq.l    #17,d0
[000108d0] 206f 0012                 movea.l    18(a7),a0
[000108d4] 41e8 0288                 lea.l      648(a0),a0
[000108d8] 4eb9 0003 71ba            jsr        Auo_slider
[000108de] 3f39 0008 4808            move.w     imagesnap,-(a7)
[000108e4] 43f9 0008 687b            lea.l      $0008687B,a1
[000108ea] 41ef 000e                 lea.l      14(a7),a0
[000108ee] 4eb9 0008 15ac            jsr        sprintf
[000108f4] 544f                      addq.w     #2,a7
[000108f6] 43ef 000c                 lea.l      12(a7),a1
[000108fa] 7004                      moveq.l    #4,d0
[000108fc] 206f 0012                 movea.l    18(a7),a0
[00010900] 41e8 0288                 lea.l      648(a0),a0
[00010904] 4eb9 0003 71ba            jsr        Auo_slider
[0001090a] 2f7c 0001 0f7e 0004       move.l     #live_snap,4(a7)
[00010912] 206f 0012                 movea.l    18(a7),a0
[00010916] 41e8 0288                 lea.l      648(a0),a0
[0001091a] 2f48 0008                 move.l     a0,8(a7)
[0001091e] 43ef 0004                 lea.l      4(a7),a1
[00010922] 7067                      moveq.l    #103,d0
[00010924] 206f 0012                 movea.l    18(a7),a0
[00010928] 41e8 0288                 lea.l      648(a0),a0
[0001092c] 4eb9 0003 71ba            jsr        Auo_slider
[00010932] 2079 0010 ee4e            movea.l    ACSblk,a0
[00010938] 2068 023c                 movea.l    572(a0),a0
[0001093c] 3028 000e                 move.w     14(a0),d0
[00010940] c07c 0100                 and.w      #$0100,d0
[00010944] 322f 001a                 move.w     26(a7),d1
[00010948] b340                      eor.w      d1,d0
[0001094a] 6718                      beq.s      $00010964
[0001094c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00010952] 5048                      addq.w     #8,a0
[00010954] 72ff                      moveq.l    #-1,d1
[00010956] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001095c] 3011                      move.w     (a1),d0
[0001095e] 4eb9 0005 eb60            jsr        Aev_WmRedraw
[00010964] 4eb9 0001 186e            jsr        validate
[0001096a] 206f 0016                 movea.l    22(a7),a0
[0001096e] 4fef 0960                 lea.l      2400(a7),a7
[00010972] 4e75                      rts
ab_service:
[00010974] 2f0a                      move.l     a2,-(a7)
[00010976] 4fef ffdc                 lea.l      -36(a7),a7
[0001097a] 2f48 0020                 move.l     a0,32(a7)
[0001097e] 3f40 001e                 move.w     d0,30(a7)
[00010982] 2f49 001a                 move.l     a1,26(a7)
[00010986] 302f 001e                 move.w     30(a7),d0
[0001098a] b07c 03ed                 cmp.w      #$03ED,d0
[0001098e] 6700 0164                 beq        $00010AF4
[00010992] 6e2e                      bgt.s      $000109C2
[00010994] b07c 001a                 cmp.w      #$001A,d0
[00010998] 6700 0542                 beq        $00010EDC
[0001099c] 6e10                      bgt.s      $000109AE
[0001099e] 5540                      subq.w     #2,d0
[000109a0] 674e                      beq.s      $000109F0
[000109a2] 907c 000d                 sub.w      #$000D,d0
[000109a6] 6700 0104                 beq        $00010AAC
[000109aa] 6000 05b4                 bra        $00010F60
[000109ae] 907c 00d1                 sub.w      #$00D1,d0
[000109b2] 6700 04ae                 beq        $00010E62
[000109b6] 907c 031a                 sub.w      #$031A,d0
[000109ba] 6700 0224                 beq        $00010BE0
[000109be] 6000 05a0                 bra        $00010F60
[000109c2] b07c 2712                 cmp.w      #$2712,d0
[000109c6] 6700 00b0                 beq        $00010A78
[000109ca] 6e14                      bgt.s      $000109E0
[000109cc] 907c 03ee                 sub.w      #$03EE,d0
[000109d0] 6700 0348                 beq        $00010D1A
[000109d4] 907c 005e                 sub.w      #$005E,d0
[000109d8] 6700 0104                 beq        $00010ADE
[000109dc] 6000 0582                 bra        $00010F60
[000109e0] 907c 2713                 sub.w      #$2713,d0
[000109e4] 6700 00dc                 beq        $00010AC2
[000109e8] 5340                      subq.w     #1,d0
[000109ea] 6750                      beq.s      $00010A3C
[000109ec] 6000 0572                 bra        $00010F60
[000109f0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000109f6] 3028 023a                 move.w     570(a0),d0
[000109fa] 670c                      beq.s      $00010A08
[000109fc] 206f 0020                 movea.l    32(a7),a0
[00010a00] 4eb9 0005 85f2            jsr        Awi_delete
[00010a06] 6030                      bra.s      $00010A38
[00010a08] 2079 0010 ee4e            movea.l    ACSblk,a0
[00010a0e] 3028 0236                 move.w     566(a0),d0
[00010a12] 6710                      beq.s      $00010A24
[00010a14] 41f9 0008 48a3            lea.l      ERR_WICLOSE,a0
[00010a1a] 7001                      moveq.l    #1,d0
[00010a1c] 4eb9 0005 a600            jsr        Awi_alert
[00010a22] 6014                      bra.s      $00010A38
[00010a24] 206f 0020                 movea.l    32(a7),a0
[00010a28] 3028 0020                 move.w     32(a0),d0
[00010a2c] 6f0a                      ble.s      $00010A38
[00010a2e] 206f 0020                 movea.l    32(a7),a0
[00010a32] 4eb9 0005 8362            jsr        Awi_closed
[00010a38] 6000 053a                 bra        $00010F74
[00010a3c] 426f 0010                 clr.w      16(a7)
[00010a40] 6026                      bra.s      $00010A68
[00010a42] 302f 0010                 move.w     16(a7),d0
[00010a46] ef48                      lsl.w      #7,d0
[00010a48] 43f9 0008 3ffa            lea.l      $00083FFA,a1
[00010a4e] d2c0                      adda.w     d0,a1
[00010a50] 206f 001a                 movea.l    26(a7),a0
[00010a54] 4eb9 0004 66ea            jsr        Ast_icmp
[00010a5a] 4a40                      tst.w      d0
[00010a5c] 6606                      bne.s      $00010A64
[00010a5e] 4240                      clr.w      d0
[00010a60] 6000 0514                 bra        $00010F76
[00010a64] 526f 0010                 addq.w     #1,16(a7)
[00010a68] 302f 0010                 move.w     16(a7),d0
[00010a6c] b079 0008 3ff8            cmp.w      $00083FF8,d0
[00010a72] 6dce                      blt.s      $00010A42
[00010a74] 6000 04fe                 bra        $00010F74
[00010a78] 0c79 0010 0008 3ff8       cmpi.w     #$0010,$00083FF8
[00010a80] 6c26                      bge.s      $00010AA8
[00010a82] 203c 0000 0080            move.l     #$00000080,d0
[00010a88] 226f 001a                 movea.l    26(a7),a1
[00010a8c] 3239 0008 3ff8            move.w     $00083FF8,d1
[00010a92] 5279 0008 3ff8            addq.w     #1,$00083FF8
[00010a98] ef49                      lsl.w      #7,d1
[00010a9a] 41f9 0008 3ffa            lea.l      $00083FFA,a0
[00010aa0] d0c1                      adda.w     d1,a0
[00010aa2] 4eb9 0008 2fd6            jsr        strncpy
[00010aa8] 6000 04ca                 bra        $00010F74
[00010aac] 43f9 0008 62a0            lea.l      WI_INFO_BASE,a1
[00010ab2] 41f9 0008 62a0            lea.l      WI_INFO_BASE,a0
[00010ab8] 4eb9 0005 a366            jsr        Awi_doform
[00010abe] 6000 04b4                 bra        $00010F74
[00010ac2] 7001                      moveq.l    #1,d0
[00010ac4] 206f 0020                 movea.l    32(a7),a0
[00010ac8] 2068 0014                 movea.l    20(a0),a0
[00010acc] c068 01a2                 and.w      418(a0),d0
[00010ad0] 6708                      beq.s      $00010ADA
[00010ad2] 206f 0020                 movea.l    32(a7),a0
[00010ad6] 6100 f896                 bsr        save_it
[00010ada] 6000 0498                 bra        $00010F74
[00010ade] 206f 001a                 movea.l    26(a7),a0
[00010ae2] 23d0 000e 6e86            move.l     (a0),cews
[00010ae8] 206f 001a                 movea.l    26(a7),a0
[00010aec] 20af 0020                 move.l     32(a7),(a0)
[00010af0] 6000 0482                 bra        $00010F74
[00010af4] 42a7                      clr.l      -(a7)
[00010af6] 42a7                      clr.l      -(a7)
[00010af8] 42a7                      clr.l      -(a7)
[00010afa] 486f 001a                 pea.l      26(a7)
[00010afe] 720a                      moveq.l    #10,d1
[00010b00] 4240                      clr.w      d0
[00010b02] 4eb9 0007 f7ba            jsr        wind_get
[00010b08] 4fef 0010                 lea.l      16(a7),a7
[00010b0c] 302f 000e                 move.w     14(a7),d0
[00010b10] 4eb9 0005 5e68            jsr        Awi_wid
[00010b16] 2f48 0016                 move.l     a0,22(a7)
[00010b1a] 202f 0016                 move.l     22(a7),d0
[00010b1e] 6700 00bc                 beq        $00010BDC
[00010b22] 426f 0010                 clr.w      16(a7)
[00010b26] 601c                      bra.s      $00010B44
[00010b28] 302f 0010                 move.w     16(a7),d0
[00010b2c] e548                      lsl.w      #2,d0
[00010b2e] 41f9 000e 6e86            lea.l      cews,a0
[00010b34] 2070 0004                 movea.l    4(a0,d0.w),a0
[00010b38] b1ef 0016                 cmpa.l     22(a7),a0
[00010b3c] 6602                      bne.s      $00010B40
[00010b3e] 600c                      bra.s      $00010B4C
[00010b40] 526f 0010                 addq.w     #1,16(a7)
[00010b44] 0c6f 0010 0010            cmpi.w     #$0010,16(a7)
[00010b4a] 6ddc                      blt.s      $00010B28
[00010b4c] 0c6f 0010 0010            cmpi.w     #$0010,16(a7)
[00010b52] 6c00 0088                 bge        $00010BDC
[00010b56] 43d7                      lea.l      (a7),a1
[00010b58] 303c 00c8                 move.w     #$00C8,d0
[00010b5c] 206f 0016                 movea.l    22(a7),a0
[00010b60] 246f 0016                 movea.l    22(a7),a2
[00010b64] 246a 0004                 movea.l    4(a2),a2
[00010b68] 4e92                      jsr        (a2)
[00010b6a] 2017                      move.l     (a7),d0
[00010b6c] 676e                      beq.s      $00010BDC
[00010b6e] 93c9                      suba.l     a1,a1
[00010b70] 303c 00e2                 move.w     #$00E2,d0
[00010b74] 2057                      movea.l    (a7),a0
[00010b76] 4eb9 0003 a772            jsr        Auo_editor
[00010b7c] 93c9                      suba.l     a1,a1
[00010b7e] 700e                      moveq.l    #14,d0
[00010b80] 2057                      movea.l    (a7),a0
[00010b82] 4eb9 0003 a772            jsr        Auo_editor
[00010b88] 93c9                      suba.l     a1,a1
[00010b8a] 303c 00f8                 move.w     #$00F8,d0
[00010b8e] 2057                      movea.l    (a7),a0
[00010b90] 4eb9 0003 a772            jsr        Auo_editor
[00010b96] 93c9                      suba.l     a1,a1
[00010b98] 303c 00f4                 move.w     #$00F4,d0
[00010b9c] 2057                      movea.l    (a7),a0
[00010b9e] 4eb9 0003 a772            jsr        Auo_editor
[00010ba4] 93c9                      suba.l     a1,a1
[00010ba6] 303c 00f6                 move.w     #$00F6,d0
[00010baa] 2057                      movea.l    (a7),a0
[00010bac] 4eb9 0003 a772            jsr        Auo_editor
[00010bb2] 226f 001a                 movea.l    26(a7),a1
[00010bb6] 303c 00f2                 move.w     #$00F2,d0
[00010bba] 2057                      movea.l    (a7),a0
[00010bbc] 4eb9 0003 a772            jsr        Auo_editor
[00010bc2] 93c9                      suba.l     a1,a1
[00010bc4] 303c 00db                 move.w     #$00DB,d0
[00010bc8] 2057                      movea.l    (a7),a0
[00010bca] 4eb9 0003 a772            jsr        Auo_editor
[00010bd0] 93c9                      suba.l     a1,a1
[00010bd2] 7005                      moveq.l    #5,d0
[00010bd4] 2057                      movea.l    (a7),a0
[00010bd6] 4eb9 0003 a772            jsr        Auo_editor
[00010bdc] 6000 0396                 bra        $00010F74
[00010be0] 202f 001a                 move.l     26(a7),d0
[00010be4] 6604                      bne.s      $00010BEA
[00010be6] 6000 038c                 bra        $00010F74
[00010bea] 702e                      moveq.l    #46,d0
[00010bec] 206f 001a                 movea.l    26(a7),a0
[00010bf0] 4eb9 0008 2e9e            jsr        strrchr
[00010bf6] 2f48 000a                 move.l     a0,10(a7)
[00010bfa] 202f 000a                 move.l     10(a7),d0
[00010bfe] 6700 0116                 beq        $00010D16
[00010c02] 43f9 0008 687e            lea.l      $0008687E,a1
[00010c08] 206f 000a                 movea.l    10(a7),a0
[00010c0c] 5248                      addq.w     #1,a0
[00010c0e] 4eb9 0008 2eba            jsr        strcmp
[00010c14] 4a40                      tst.w      d0
[00010c16] 6610                      bne.s      $00010C28
[00010c18] 206f 001a                 movea.l    26(a7),a0
[00010c1c] 2279 0009 ab82            movea.l    $0009AB82,a1
[00010c22] 4e91                      jsr        (a1)
[00010c24] 6000 00f0                 bra        $00010D16
[00010c28] 91c8                      suba.l     a0,a0
[00010c2a] 2279 000d 34dc            movea.l    $000D34DC,a1
[00010c30] 4e91                      jsr        (a1)
[00010c32] 2f48 0016                 move.l     a0,22(a7)
[00010c36] 202f 0016                 move.l     22(a7),d0
[00010c3a] 6700 00da                 beq        $00010D16
[00010c3e] 226f 0020                 movea.l    32(a7),a1
[00010c42] 303c 00d0                 move.w     #$00D0,d0
[00010c46] 206f 0016                 movea.l    22(a7),a0
[00010c4a] 246f 0016                 movea.l    22(a7),a2
[00010c4e] 246a 0004                 movea.l    4(a2),a2
[00010c52] 4e92                      jsr        (a2)
[00010c54] 226f 001a                 movea.l    26(a7),a1
[00010c58] 303c 00ca                 move.w     #$00CA,d0
[00010c5c] 206f 0016                 movea.l    22(a7),a0
[00010c60] 246f 0016                 movea.l    22(a7),a2
[00010c64] 246a 0004                 movea.l    4(a2),a2
[00010c68] 4e92                      jsr        (a2)
[00010c6a] 43f9 0008 6882            lea.l      $00086882,a1
[00010c70] 206f 000a                 movea.l    10(a7),a0
[00010c74] 5248                      addq.w     #1,a0
[00010c76] 4eb9 0008 2eba            jsr        strcmp
[00010c7c] 4a40                      tst.w      d0
[00010c7e] 6734                      beq.s      $00010CB4
[00010c80] 43f9 0008 6884            lea.l      $00086884,a1
[00010c86] 206f 000a                 movea.l    10(a7),a0
[00010c8a] 5248                      addq.w     #1,a0
[00010c8c] 4eb9 0008 2eba            jsr        strcmp
[00010c92] 4a40                      tst.w      d0
[00010c94] 671e                      beq.s      $00010CB4
[00010c96] 43f9 0008 6886            lea.l      $00086886,a1
[00010c9c] 206f 000a                 movea.l    10(a7),a0
[00010ca0] 5248                      addq.w     #1,a0
[00010ca2] 4eb9 0008 2eba            jsr        strcmp
[00010ca8] 4a40                      tst.w      d0
[00010caa] 6604                      bne.s      $00010CB0
[00010cac] 7001                      moveq.l    #1,d0
[00010cae] 6002                      bra.s      $00010CB2
[00010cb0] 4240                      clr.w      d0
[00010cb2] 6658                      bne.s      $00010D0C
[00010cb4] 426f 0010                 clr.w      16(a7)
[00010cb8] 6018                      bra.s      $00010CD2
[00010cba] 302f 0010                 move.w     16(a7),d0
[00010cbe] e548                      lsl.w      #2,d0
[00010cc0] 41f9 000e 6e86            lea.l      cews,a0
[00010cc6] 2030 0004                 move.l     4(a0,d0.w),d0
[00010cca] 6602                      bne.s      $00010CCE
[00010ccc] 600c                      bra.s      $00010CDA
[00010cce] 526f 0010                 addq.w     #1,16(a7)
[00010cd2] 0c6f 0010 0010            cmpi.w     #$0010,16(a7)
[00010cd8] 6de0                      blt.s      $00010CBA
[00010cda] 0c6f 0010 0010            cmpi.w     #$0010,16(a7)
[00010ce0] 6c2a                      bge.s      $00010D0C
[00010ce2] 302f 0010                 move.w     16(a7),d0
[00010ce6] e548                      lsl.w      #2,d0
[00010ce8] 41f9 000e 6e86            lea.l      cews,a0
[00010cee] 21af 0016 0004            move.l     22(a7),4(a0,d0.w)
[00010cf4] 226f 001a                 movea.l    26(a7),a1
[00010cf8] 302f 0010                 move.w     16(a7),d0
[00010cfc] ef48                      lsl.w      #7,d0
[00010cfe] 41f9 000e 6eca            lea.l      $000E6ECA,a0
[00010d04] d0c0                      adda.w     d0,a0
[00010d06] 4eb9 0008 2f0c            jsr        strcpy
[00010d0c] 206f 0016                 movea.l    22(a7),a0
[00010d10] 4eb9 0005 6bea            jsr        Awi_show
[00010d16] 6000 025c                 bra        $00010F74
[00010d1a] 202f 001a                 move.l     26(a7),d0
[00010d1e] 6604                      bne.s      $00010D24
[00010d20] 6000 0252                 bra        $00010F74
[00010d24] 226f 001a                 movea.l    26(a7),a1
[00010d28] 41ef 0004                 lea.l      4(a7),a0
[00010d2c] 4eb9 0004 b758            jsr        Af_2ext
[00010d32] 102f 0004                 move.b     4(a7),d0
[00010d36] 6700 0126                 beq        $00010E5E
[00010d3a] 426f 0010                 clr.w      16(a7)
[00010d3e] 6022                      bra.s      $00010D62
[00010d40] 226f 001a                 movea.l    26(a7),a1
[00010d44] 302f 0010                 move.w     16(a7),d0
[00010d48] ef48                      lsl.w      #7,d0
[00010d4a] 41f9 000e 6eca            lea.l      $000E6ECA,a0
[00010d50] d0c0                      adda.w     d0,a0
[00010d52] 4eb9 0008 2eba            jsr        strcmp
[00010d58] 4a40                      tst.w      d0
[00010d5a] 6602                      bne.s      $00010D5E
[00010d5c] 600c                      bra.s      $00010D6A
[00010d5e] 526f 0010                 addq.w     #1,16(a7)
[00010d62] 0c6f 0010 0010            cmpi.w     #$0010,16(a7)
[00010d68] 6dd6                      blt.s      $00010D40
[00010d6a] 0c6f 0010 0010            cmpi.w     #$0010,16(a7)
[00010d70] 6c30                      bge.s      $00010DA2
[00010d72] 93c9                      suba.l     a1,a1
[00010d74] 303c 00d6                 move.w     #$00D6,d0
[00010d78] 322f 0010                 move.w     16(a7),d1
[00010d7c] e549                      lsl.w      #2,d1
[00010d7e] 41f9 000e 6e86            lea.l      cews,a0
[00010d84] 2070 1004                 movea.l    4(a0,d1.w),a0
[00010d88] 322f 0010                 move.w     16(a7),d1
[00010d8c] e549                      lsl.w      #2,d1
[00010d8e] 45f9 000e 6e86            lea.l      cews,a2
[00010d94] 2472 1004                 movea.l    4(a2,d1.w),a2
[00010d98] 246a 0004                 movea.l    4(a2),a2
[00010d9c] 4e92                      jsr        (a2)
[00010d9e] 6000 00be                 bra        $00010E5E
[00010da2] 43f9 0008 688a            lea.l      $0008688A,a1
[00010da8] 41ef 0004                 lea.l      4(a7),a0
[00010dac] 4eb9 0008 2eba            jsr        strcmp
[00010db2] 4a40                      tst.w      d0
[00010db4] 6600 00a8                 bne        $00010E5E
[00010db8] 4eb9 0005 69d6            jsr        Awi_list
[00010dbe] 2f48 0016                 move.l     a0,22(a7)
[00010dc2] 2f48 0012                 move.l     a0,18(a7)
[00010dc6] 206f 0012                 movea.l    18(a7),a0
[00010dca] 2028 004e                 move.l     78(a0),d0
[00010dce] 676e                      beq.s      $00010E3E
[00010dd0] 206f 0012                 movea.l    18(a7),a0
[00010dd4] 2268 004e                 movea.l    78(a0),a1
[00010dd8] 41ef 0004                 lea.l      4(a7),a0
[00010ddc] 4eb9 0004 b758            jsr        Af_2ext
[00010de2] 2008                      move.l     a0,d0
[00010de4] 6758                      beq.s      $00010E3E
[00010de6] 43f9 0008 688e            lea.l      $0008688E,a1
[00010dec] 41ef 0004                 lea.l      4(a7),a0
[00010df0] 4eb9 0008 2eba            jsr        strcmp
[00010df6] 4a40                      tst.w      d0
[00010df8] 6644                      bne.s      $00010E3E
[00010dfa] 206f 0012                 movea.l    18(a7),a0
[00010dfe] 2028 004a                 move.l     74(a0),d0
[00010e02] 673a                      beq.s      $00010E3E
[00010e04] 43f9 0008 b1a1            lea.l      _WGTITEL,a1
[00010e0a] 206f 0012                 movea.l    18(a7),a0
[00010e0e] 2068 004a                 movea.l    74(a0),a0
[00010e12] 4eb9 0008 2eba            jsr        strcmp
[00010e18] 4a40                      tst.w      d0
[00010e1a] 6622                      bne.s      $00010E3E
[00010e1c] 226f 001a                 movea.l    26(a7),a1
[00010e20] 206f 0012                 movea.l    18(a7),a0
[00010e24] 2068 004e                 movea.l    78(a0),a0
[00010e28] 5248                      addq.w     #1,a0
[00010e2a] 4eb9 0008 2eba            jsr        strcmp
[00010e30] 4a40                      tst.w      d0
[00010e32] 660a                      bne.s      $00010E3E
[00010e34] 206f 0012                 movea.l    18(a7),a0
[00010e38] 4eb9 0001 4128            jsr        save
[00010e3e] 4eb9 0005 69d6            jsr        Awi_list
[00010e44] 2f48 0012                 move.l     a0,18(a7)
[00010e48] 206f 0012                 movea.l    18(a7),a0
[00010e4c] b1ef 0016                 cmpa.l     22(a7),a0
[00010e50] 670c                      beq.s      $00010E5E
[00010e52] 206f 0016                 movea.l    22(a7),a0
[00010e56] 3028 0020                 move.w     32(a0),d0
[00010e5a] 6a00 ff6a                 bpl        $00010DC6
[00010e5e] 6000 0114                 bra        $00010F74
[00010e62] 426f 0010                 clr.w      16(a7)
[00010e66] 6068                      bra.s      $00010ED0
[00010e68] 302f 0010                 move.w     16(a7),d0
[00010e6c] e548                      lsl.w      #2,d0
[00010e6e] 41f9 000e 6e86            lea.l      cews,a0
[00010e74] 2070 0004                 movea.l    4(a0,d0.w),a0
[00010e78] b1ef 001a                 cmpa.l     26(a7),a0
[00010e7c] 664e                      bne.s      $00010ECC
[00010e7e] 302f 0010                 move.w     16(a7),d0
[00010e82] ef48                      lsl.w      #7,d0
[00010e84] 43f9 000e 6eca            lea.l      $000E6ECA,a1
[00010e8a] d2c0                      adda.w     d0,a1
[00010e8c] 303c 00d1                 move.w     #$00D1,d0
[00010e90] 2079 000e 6e86            movea.l    cews,a0
[00010e96] 2479 000e 6e86            movea.l    cews,a2
[00010e9c] 246a 0004                 movea.l    4(a2),a2
[00010ea0] 4e92                      jsr        (a2)
[00010ea2] 302f 0010                 move.w     16(a7),d0
[00010ea6] e548                      lsl.w      #2,d0
[00010ea8] 41f9 000e 6e86            lea.l      cews,a0
[00010eae] 42b0 0004                 clr.l      4(a0,d0.w)
[00010eb2] 43f9 0008 6892            lea.l      $00086892,a1
[00010eb8] 302f 0010                 move.w     16(a7),d0
[00010ebc] ef48                      lsl.w      #7,d0
[00010ebe] 41f9 000e 6eca            lea.l      $000E6ECA,a0
[00010ec4] d0c0                      adda.w     d0,a0
[00010ec6] 4eb9 0008 2f0c            jsr        strcpy
[00010ecc] 526f 0010                 addq.w     #1,16(a7)
[00010ed0] 0c6f 0010 0010            cmpi.w     #$0010,16(a7)
[00010ed6] 6d90                      blt.s      $00010E68
[00010ed8] 6000 009a                 bra        $00010F74
[00010edc] 206f 0020                 movea.l    32(a7),a0
[00010ee0] 3028 001c                 move.w     28(a0),d0
[00010ee4] 5b40                      subq.w     #5,d0
[00010ee6] 6728                      beq.s      $00010F10
[00010ee8] 5340                      subq.w     #1,d0
[00010eea] 673c                      beq.s      $00010F28
[00010eec] 5340                      subq.w     #1,d0
[00010eee] 6750                      beq.s      $00010F40
[00010ef0] 907c 0011                 sub.w      #$0011,d0
[00010ef4] 6702                      beq.s      $00010EF8
[00010ef6] 6060                      bra.s      $00010F58
[00010ef8] 2279 0008 47fe            movea.l    helpacc,a1
[00010efe] 7018                      moveq.l    #24,d0
[00010f00] 206f 0020                 movea.l    32(a7),a0
[00010f04] 2068 0014                 movea.l    20(a0),a0
[00010f08] 4eb9 0005 11da            jsr        Aob_gettext
[00010f0e] 6048                      bra.s      $00010F58
[00010f10] 43f9 0008 3eb9            lea.l      $00083EB9,a1
[00010f16] 7005                      moveq.l    #5,d0
[00010f18] 206f 0020                 movea.l    32(a7),a0
[00010f1c] 2068 0014                 movea.l    20(a0),a0
[00010f20] 4eb9 0005 11da            jsr        Aob_gettext
[00010f26] 6030                      bra.s      $00010F58
[00010f28] 43f9 0008 3f39            lea.l      $00083F39,a1
[00010f2e] 7006                      moveq.l    #6,d0
[00010f30] 206f 0020                 movea.l    32(a7),a0
[00010f34] 2068 0014                 movea.l    20(a0),a0
[00010f38] 4eb9 0005 11da            jsr        Aob_gettext
[00010f3e] 6018                      bra.s      $00010F58
[00010f40] 43f9 0008 3f44            lea.l      $00083F44,a1
[00010f46] 7007                      moveq.l    #7,d0
[00010f48] 206f 0020                 movea.l    32(a7),a0
[00010f4c] 2068 0014                 movea.l    20(a0),a0
[00010f50] 4eb9 0005 11da            jsr        Aob_gettext
[00010f56] 4e71                      nop
[00010f58] 4eb9 0001 186e            jsr        validate
[00010f5e] 6014                      bra.s      $00010F74
[00010f60] 226f 001a                 movea.l    26(a7),a1
[00010f64] 302f 001e                 move.w     30(a7),d0
[00010f68] 206f 0020                 movea.l    32(a7),a0
[00010f6c] 4eb9 0005 9dd0            jsr        Awi_service
[00010f72] 6002                      bra.s      $00010F76
[00010f74] 7001                      moveq.l    #1,d0
[00010f76] 4fef 0024                 lea.l      36(a7),a7
[00010f7a] 245f                      movea.l    (a7)+,a2
[00010f7c] 4e75                      rts
live_snap:
[00010f7e] 4fef fff6                 lea.l      -10(a7),a7
[00010f82] 2f40 0006                 move.l     d0,6(a7)
[00010f86] 302f 0008                 move.w     8(a7),d0
[00010f8a] 4a40                      tst.w      d0
[00010f8c] 670a                      beq.s      $00010F98
[00010f8e] 5340                      subq.w     #1,d0
[00010f90] 6710                      beq.s      $00010FA2
[00010f92] 5340                      subq.w     #1,d0
[00010f94] 6716                      beq.s      $00010FAC
[00010f96] 601e                      bra.s      $00010FB6
[00010f98] 33fc 0001 0008 4808       move.w     #$0001,imagesnap
[00010fa0] 601c                      bra.s      $00010FBE
[00010fa2] 33fc 0002 0008 4808       move.w     #$0002,imagesnap
[00010faa] 6012                      bra.s      $00010FBE
[00010fac] 33fc 0004 0008 4808       move.w     #$0004,imagesnap
[00010fb4] 6008                      bra.s      $00010FBE
[00010fb6] 33fc 0008 0008 4808       move.w     #$0008,imagesnap
[00010fbe] 3039 0008 4808            move.w     imagesnap,d0
[00010fc4] 6608                      bne.s      $00010FCE
[00010fc6] 33fc 0001 0008 4808       move.w     #$0001,imagesnap
[00010fce] 3f39 0008 4808            move.w     imagesnap,-(a7)
[00010fd4] 43f9 0008 6893            lea.l      $00086893,a1
[00010fda] 41ef 0002                 lea.l      2(a7),a0
[00010fde] 4eb9 0008 15ac            jsr        sprintf
[00010fe4] 544f                      addq.w     #2,a7
[00010fe6] 41d7                      lea.l      (a7),a0
[00010fe8] 4fef 000a                 lea.l      10(a7),a7
[00010fec] 4e75                      rts
reg_kind:
[00010fee] 4fef ffe4                 lea.l      -28(a7),a7
[00010ff2] 41f9 0008 6464            lea.l      $00086464,a0
[00010ff8] 43ef 0004                 lea.l      4(a7),a1
[00010ffc] 700b                      moveq.l    #11,d0
[00010ffe] 12d8                      move.b     (a0)+,(a1)+
[00011000] 51c8 fffc                 dbf        d0,$00010FFE
[00011004] 41f9 0008 59f4            lea.l      P_REGISTER,a0
[0001100a] 4eb9 0004 f064            jsr        Aob_create
[00011010] 2f48 0018                 move.l     a0,24(a7)
[00011014] 6604                      bne.s      $0001101A
[00011016] 6000 00de                 bra        $000110F6
[0001101a] 7017                      moveq.l    #23,d0
[0001101c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011022] 2068 0258                 movea.l    600(a0),a0
[00011026] 2268 0014                 movea.l    20(a0),a1
[0001102a] 41ef 0010                 lea.l      16(a7),a0
[0001102e] 4eb9 0004 fe06            jsr        Aob_offset
[00011034] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001103a] 2068 0258                 movea.l    600(a0),a0
[0001103e] 3028 0034                 move.w     52(a0),d0
[00011042] d16f 0010                 add.w      d0,16(a7)
[00011046] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001104c] 2068 0258                 movea.l    600(a0),a0
[00011050] 3028 0036                 move.w     54(a0),d0
[00011054] d16f 0012                 add.w      d0,18(a7)
[00011058] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001105e] 2068 0258                 movea.l    600(a0),a0
[00011062] 3f68 0002 0002            move.w     2(a0),2(a7)
[00011068] 322f 0002                 move.w     2(a7),d1
[0001106c] 48c1                      ext.l      d1
[0001106e] 2001                      move.l     d1,d0
[00011070] d080                      add.l      d0,d0
[00011072] d081                      add.l      d1,d0
[00011074] e788                      lsl.l      #3,d0
[00011076] 206f 0018                 movea.l    24(a7),a0
[0001107a] 0070 0004 0822            ori.w      #$0004,34(a0,d0.l)
[00011080] 322f 0012                 move.w     18(a7),d1
[00011084] 302f 0010                 move.w     16(a7),d0
[00011088] 226f 0018                 movea.l    24(a7),a1
[0001108c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011092] 2068 0258                 movea.l    600(a0),a0
[00011096] 4eb9 0004 e84a            jsr        Ame_popup
[0001109c] 3e80                      move.w     d0,(a7)
[0001109e] 3017                      move.w     (a7),d0
[000110a0] 6f4a                      ble.s      $000110EC
[000110a2] 70ff                      moveq.l    #-1,d0
[000110a4] d057                      add.w      (a7),d0
[000110a6] 48c0                      ext.l      d0
[000110a8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000110ae] 2068 0258                 movea.l    600(a0),a0
[000110b2] 2080                      move.l     d0,(a0)
[000110b4] 3017                      move.w     (a7),d0
[000110b6] e548                      lsl.w      #2,d0
[000110b8] 2277 0000                 movea.l    0(a7,d0.w),a1
[000110bc] 7017                      moveq.l    #23,d0
[000110be] 2079 0010 ee4e            movea.l    ACSblk,a0
[000110c4] 2068 025c                 movea.l    604(a0),a0
[000110c8] 4eb9 0005 0fd8            jsr        Aob_puttext
[000110ce] 72ff                      moveq.l    #-1,d1
[000110d0] 7017                      moveq.l    #23,d0
[000110d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000110d8] 2068 0258                 movea.l    600(a0),a0
[000110dc] 2279 0010 ee4e            movea.l    ACSblk,a1
[000110e2] 2269 0258                 movea.l    600(a1),a1
[000110e6] 2269 0066                 movea.l    102(a1),a1
[000110ea] 4e91                      jsr        (a1)
[000110ec] 206f 0018                 movea.l    24(a7),a0
[000110f0] 4eb9 0004 f20a            jsr        Aob_delete
[000110f6] 4fef 001c                 lea.l      28(a7),a7
[000110fa] 4e75                      rts
outreg:
[000110fc] 4fef fef8                 lea.l      -264(a7),a7
[00011100] 2f40 0104                 move.l     d0,260(a7)
[00011104] 2f48 0100                 move.l     a0,256(a7)
[00011108] 6030                      bra.s      $0001113A
[0001110a] 41d7                      lea.l      (a7),a0
[0001110c] 2f08                      move.l     a0,-(a7)
[0001110e] 206f 0104                 movea.l    260(a7),a0
[00011112] 2f10                      move.l     (a0),-(a7)
[00011114] 43f9 0008 6896            lea.l      $00086896,a1
[0001111a] 41ef 0008                 lea.l      8(a7),a0
[0001111e] 4eb9 0008 15ac            jsr        sprintf
[00011124] 584f                      addq.w     #4,a7
[00011126] 3200                      move.w     d0,d1
[00011128] 48c1                      ext.l      d1
[0001112a] 302f 010a                 move.w     266(a7),d0
[0001112e] 205f                      movea.l    (a7)+,a0
[00011130] 4eb9 0008 0d5e            jsr        Fwrite
[00011136] 58af 0100                 addq.l     #4,256(a7)
[0001113a] 206f 0100                 movea.l    256(a7),a0
[0001113e] 2010                      move.l     (a0),d0
[00011140] 66c8                      bne.s      $0001110A
[00011142] 4fef 0108                 lea.l      264(a7),a7
[00011146] 4e75                      rts
reg_me:
[00011148] 4fef fe68                 lea.l      -408(a7),a7
[0001114c] 43ef 0194                 lea.l      404(a7),a1
[00011150] 7003                      moveq.l    #3,d0
[00011152] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011158] 2068 025c                 movea.l    604(a0),a0
[0001115c] 41e8 0180                 lea.l      384(a0),a0
[00011160] 4eb9 0006 a068            jsr        Auo_boxed
[00011166] 43ef 0190                 lea.l      400(a7),a1
[0001116a] 7003                      moveq.l    #3,d0
[0001116c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011172] 2068 025c                 movea.l    604(a0),a0
[00011176] 41e8 0198                 lea.l      408(a0),a0
[0001117a] 4eb9 0006 a068            jsr        Auo_boxed
[00011180] 43ef 018c                 lea.l      396(a7),a1
[00011184] 7003                      moveq.l    #3,d0
[00011186] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001118c] 2068 025c                 movea.l    604(a0),a0
[00011190] 41e8 01b0                 lea.l      432(a0),a0
[00011194] 4eb9 0006 a068            jsr        Auo_boxed
[0001119a] 43ef 0188                 lea.l      392(a7),a1
[0001119e] 7003                      moveq.l    #3,d0
[000111a0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000111a6] 2068 025c                 movea.l    604(a0),a0
[000111aa] 41e8 01c8                 lea.l      456(a0),a0
[000111ae] 4eb9 0006 a068            jsr        Auo_boxed
[000111b4] 43ef 0184                 lea.l      388(a7),a1
[000111b8] 7003                      moveq.l    #3,d0
[000111ba] 2079 0010 ee4e            movea.l    ACSblk,a0
[000111c0] 2068 025c                 movea.l    604(a0),a0
[000111c4] 41e8 01e0                 lea.l      480(a0),a0
[000111c8] 4eb9 0006 a068            jsr        Auo_boxed
[000111ce] 43f9 0008 689b            lea.l      $0008689B,a1
[000111d4] 2f09                      move.l     a1,-(a7)
[000111d6] 2279 0010 ee4e            movea.l    ACSblk,a1
[000111dc] 43e9 009e                 lea.l      158(a1),a1
[000111e0] 41ef 0108                 lea.l      264(a7),a0
[000111e4] 4eb9 0008 2f0c            jsr        strcpy
[000111ea] 225f                      movea.l    (a7)+,a1
[000111ec] 4eb9 0008 2e42            jsr        strcat
[000111f2] 206f 0194                 movea.l    404(a7),a0
[000111f6] 1010                      move.b     (a0),d0
[000111f8] 6700 02a0                 beq        $0001149A
[000111fc] 206f 0190                 movea.l    400(a7),a0
[00011200] 1010                      move.b     (a0),d0
[00011202] 6700 0296                 beq        $0001149A
[00011206] 206f 018c                 movea.l    396(a7),a0
[0001120a] 1010                      move.b     (a0),d0
[0001120c] 6700 028c                 beq        $0001149A
[00011210] 206f 0188                 movea.l    392(a7),a0
[00011214] 1010                      move.b     (a0),d0
[00011216] 6700 0282                 beq        $0001149A
[0001121a] 4879 0008 68b1            pea.l      $000868B1
[00011220] 43ef 0108                 lea.l      264(a7),a1
[00011224] 41f9 0008 68a8            lea.l      $000868A8,a0
[0001122a] 4eb9 0006 cefe            jsr        Af_select
[00011230] 584f                      addq.w     #4,a7
[00011232] 2008                      move.l     a0,d0
[00011234] 6700 0264                 beq        $0001149A
[00011238] 4240                      clr.w      d0
[0001123a] 41ef 0104                 lea.l      260(a7),a0
[0001123e] 4eb9 0008 0c8e            jsr        Fcreate
[00011244] 2e80                      move.l     d0,(a7)
[00011246] 6f00 0252                 ble        $0001149A
[0001124a] 41f9 0008 3de6            lea.l      regstart,a0
[00011250] 2017                      move.l     (a7),d0
[00011252] 6100 fea8                 bsr        outreg
[00011256] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001125c] 2068 0258                 movea.l    600(a0),a0
[00011260] 3028 0002                 move.w     2(a0),d0
[00011264] 4a40                      tst.w      d0
[00011266] 670a                      beq.s      $00011272
[00011268] 5340                      subq.w     #1,d0
[0001126a] 6714                      beq.s      $00011280
[0001126c] 5340                      subq.w     #1,d0
[0001126e] 671e                      beq.s      $0001128E
[00011270] 6048                      bra.s      $000112BA
[00011272] 41f9 0008 3e3a            lea.l      regscheck,a0
[00011278] 2017                      move.l     (a7),d0
[0001127a] 6100 fe80                 bsr        outreg
[0001127e] 603a                      bra.s      $000112BA
[00011280] 41f9 0008 3e46            lea.l      regkonto,a0
[00011286] 2017                      move.l     (a7),d0
[00011288] 6100 fe72                 bsr        outreg
[0001128c] 602c                      bra.s      $000112BA
[0001128e] 7001                      moveq.l    #1,d0
[00011290] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011296] 2068 025c                 movea.l    604(a0),a0
[0001129a] c068 00e2                 and.w      226(a0),d0
[0001129e] 670e                      beq.s      $000112AE
[000112a0] 41f9 0008 3e6a            lea.l      reginn,a0
[000112a6] 2017                      move.l     (a7),d0
[000112a8] 6100 fe52                 bsr        outreg
[000112ac] 600c                      bra.s      $000112BA
[000112ae] 41f9 0008 3e76            lea.l      regonn,a0
[000112b4] 2017                      move.l     (a7),d0
[000112b6] 6100 fe44                 bsr        outreg
[000112ba] 206f 0184                 movea.l    388(a7),a0
[000112be] 1010                      move.b     (a0),d0
[000112c0] 670c                      beq.s      $000112CE
[000112c2] 41f9 0008 3e82            lea.l      regmail,a0
[000112c8] 2017                      move.l     (a7),d0
[000112ca] 6100 fe30                 bsr        outreg
[000112ce] 41f9 0008 3e92            lea.l      regend,a0
[000112d4] 2017                      move.l     (a7),d0
[000112d6] 6100 fe24                 bsr        outreg
[000112da] 4242                      clr.w      d2
[000112dc] 322f 0002                 move.w     2(a7),d1
[000112e0] 7000                      moveq.l    #0,d0
[000112e2] 4eb9 0008 0cfe            jsr        Fseek
[000112e8] 7401                      moveq.l    #1,d2
[000112ea] 322f 0002                 move.w     2(a7),d1
[000112ee] 203c 0000 00a6            move.l     #$000000A6,d0
[000112f4] 4eb9 0008 0cfe            jsr        Fseek
[000112fa] 41ef 0004                 lea.l      4(a7),a0
[000112fe] 2f08                      move.l     a0,-(a7)
[00011300] 4879 0008 68c2            pea.l      $000868C2
[00011306] 4879 0008 68c0            pea.l      $000868C0
[0001130c] 4879 0008 68be            pea.l      $000868BE
[00011312] 43f9 0008 68b5            lea.l      $000868B5,a1
[00011318] 41ef 0014                 lea.l      20(a7),a0
[0001131c] 4eb9 0008 15ac            jsr        sprintf
[00011322] 4fef 000c                 lea.l      12(a7),a7
[00011326] 3200                      move.w     d0,d1
[00011328] 48c1                      ext.l      d1
[0001132a] 302f 0006                 move.w     6(a7),d0
[0001132e] 205f                      movea.l    (a7)+,a0
[00011330] 4eb9 0008 0d5e            jsr        Fwrite
[00011336] 7401                      moveq.l    #1,d2
[00011338] 322f 0002                 move.w     2(a7),d1
[0001133c] 7024                      moveq.l    #36,d0
[0001133e] 4eb9 0008 0cfe            jsr        Fseek
[00011344] 41ef 0004                 lea.l      4(a7),a0
[00011348] 2f08                      move.l     a0,-(a7)
[0001134a] 2f2f 0198                 move.l     408(a7),-(a7)
[0001134e] 43f9 0008 68c4            lea.l      $000868C4,a1
[00011354] 41ef 000c                 lea.l      12(a7),a0
[00011358] 4eb9 0008 15ac            jsr        sprintf
[0001135e] 584f                      addq.w     #4,a7
[00011360] 3200                      move.w     d0,d1
[00011362] 48c1                      ext.l      d1
[00011364] 302f 0006                 move.w     6(a7),d0
[00011368] 205f                      movea.l    (a7)+,a0
[0001136a] 4eb9 0008 0d5e            jsr        Fwrite
[00011370] 7401                      moveq.l    #1,d2
[00011372] 322f 0002                 move.w     2(a7),d1
[00011376] 7009                      moveq.l    #9,d0
[00011378] 4eb9 0008 0cfe            jsr        Fseek
[0001137e] 41ef 0004                 lea.l      4(a7),a0
[00011382] 2f08                      move.l     a0,-(a7)
[00011384] 2f2f 0194                 move.l     404(a7),-(a7)
[00011388] 43f9 0008 68cc            lea.l      $000868CC,a1
[0001138e] 41ef 000c                 lea.l      12(a7),a0
[00011392] 4eb9 0008 15ac            jsr        sprintf
[00011398] 584f                      addq.w     #4,a7
[0001139a] 3200                      move.w     d0,d1
[0001139c] 48c1                      ext.l      d1
[0001139e] 302f 0006                 move.w     6(a7),d0
[000113a2] 205f                      movea.l    (a7)+,a0
[000113a4] 4eb9 0008 0d5e            jsr        Fwrite
[000113aa] 7401                      moveq.l    #1,d2
[000113ac] 322f 0002                 move.w     2(a7),d1
[000113b0] 7009                      moveq.l    #9,d0
[000113b2] 4eb9 0008 0cfe            jsr        Fseek
[000113b8] 41ef 0004                 lea.l      4(a7),a0
[000113bc] 2f08                      move.l     a0,-(a7)
[000113be] 2f2f 0190                 move.l     400(a7),-(a7)
[000113c2] 43f9 0008 68d4            lea.l      $000868D4,a1
[000113c8] 41ef 000c                 lea.l      12(a7),a0
[000113cc] 4eb9 0008 15ac            jsr        sprintf
[000113d2] 584f                      addq.w     #4,a7
[000113d4] 3200                      move.w     d0,d1
[000113d6] 48c1                      ext.l      d1
[000113d8] 302f 0006                 move.w     6(a7),d0
[000113dc] 205f                      movea.l    (a7)+,a0
[000113de] 4eb9 0008 0d5e            jsr        Fwrite
[000113e4] 7401                      moveq.l    #1,d2
[000113e6] 322f 0002                 move.w     2(a7),d1
[000113ea] 7009                      moveq.l    #9,d0
[000113ec] 4eb9 0008 0cfe            jsr        Fseek
[000113f2] 41ef 0004                 lea.l      4(a7),a0
[000113f6] 2f08                      move.l     a0,-(a7)
[000113f8] 2f2f 018c                 move.l     396(a7),-(a7)
[000113fc] 43f9 0008 68dc            lea.l      $000868DC,a1
[00011402] 41ef 000c                 lea.l      12(a7),a0
[00011406] 4eb9 0008 15ac            jsr        sprintf
[0001140c] 584f                      addq.w     #4,a7
[0001140e] 3200                      move.w     d0,d1
[00011410] 48c1                      ext.l      d1
[00011412] 302f 0006                 move.w     6(a7),d0
[00011416] 205f                      movea.l    (a7)+,a0
[00011418] 4eb9 0008 0d5e            jsr        Fwrite
[0001141e] 7401                      moveq.l    #1,d2
[00011420] 322f 0002                 move.w     2(a7),d1
[00011424] 7009                      moveq.l    #9,d0
[00011426] 4eb9 0008 0cfe            jsr        Fseek
[0001142c] 206f 0184                 movea.l    388(a7),a0
[00011430] 1010                      move.b     (a0),d0
[00011432] 672e                      beq.s      $00011462
[00011434] 41ef 0004                 lea.l      4(a7),a0
[00011438] 2f08                      move.l     a0,-(a7)
[0001143a] 2f2f 0188                 move.l     392(a7),-(a7)
[0001143e] 43f9 0008 68e4            lea.l      $000868E4,a1
[00011444] 41ef 000c                 lea.l      12(a7),a0
[00011448] 4eb9 0008 15ac            jsr        sprintf
[0001144e] 584f                      addq.w     #4,a7
[00011450] 3200                      move.w     d0,d1
[00011452] 48c1                      ext.l      d1
[00011454] 302f 0006                 move.w     6(a7),d0
[00011458] 205f                      movea.l    (a7)+,a0
[0001145a] 4eb9 0008 0d5e            jsr        Fwrite
[00011460] 602e                      bra.s      $00011490
[00011462] 41ef 0004                 lea.l      4(a7),a0
[00011466] 2f08                      move.l     a0,-(a7)
[00011468] 4879 0008 68f4            pea.l      $000868F4
[0001146e] 43f9 0008 68ec            lea.l      $000868EC,a1
[00011474] 41ef 000c                 lea.l      12(a7),a0
[00011478] 4eb9 0008 15ac            jsr        sprintf
[0001147e] 584f                      addq.w     #4,a7
[00011480] 3200                      move.w     d0,d1
[00011482] 48c1                      ext.l      d1
[00011484] 302f 0006                 move.w     6(a7),d0
[00011488] 205f                      movea.l    (a7)+,a0
[0001148a] 4eb9 0008 0d5e            jsr        Fwrite
[00011490] 302f 0002                 move.w     2(a7),d0
[00011494] 4eb9 0008 0c7e            jsr        Fclose
[0001149a] 4fef 0198                 lea.l      408(a7),a7
[0001149e] 4e75                      rts
acs_register:
[000114a0] 594f                      subq.w     #4,a7
[000114a2] 41f9 0008 6342            lea.l      WI_REGISTER,a0
[000114a8] 2279 0008 634a            movea.l    $0008634A,a1
[000114ae] 4e91                      jsr        (a1)
[000114b0] 2e88                      move.l     a0,(a7)
[000114b2] 2017                      move.l     (a7),d0
[000114b4] 6724                      beq.s      $000114DA
[000114b6] 43f9 0008 5302            lea.l      rkind0,a1
[000114bc] 7017                      moveq.l    #23,d0
[000114be] 2057                      movea.l    (a7),a0
[000114c0] 2068 0014                 movea.l    20(a0),a0
[000114c4] 4eb9 0005 0fd8            jsr        Aob_puttext
[000114ca] 2057                      movea.l    (a7),a0
[000114cc] 4eb9 0005 9df4            jsr        Awi_dialog
[000114d2] 2057                      movea.l    (a7),a0
[000114d4] 4eb9 0005 85f2            jsr        Awi_delete
[000114da] 584f                      addq.w     #4,a7
[000114dc] 4e75                      rts
demoabout:
[000114de] 2039 0008 3eb0            move.l     wdemo,d0
[000114e4] 670e                      beq.s      $000114F4
[000114e6] 2079 0008 3eb0            movea.l    wdemo,a0
[000114ec] 4eb9 0005 7428            jsr        Awi_open
[000114f2] 4e75                      rts
[000114f4] 41f9 0008 480e            lea.l      A_DEMO,a0
[000114fa] 7001                      moveq.l    #1,d0
[000114fc] 4eb9 0005 a600            jsr        Awi_alert
[00011502] 4e75                      rts
installdemo:
[00011504] 2f0a                      move.l     a2,-(a7)
[00011506] 3039 0008 3eae            move.w     runasdemo,d0
[0001150c] 6734                      beq.s      $00011542
[0001150e] 42b9 0008 3eb4            clr.l      stepper
[00011514] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001151a] 217c 0001 14de 029c       move.l     #demoabout,668(a0)
[00011522] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011528] 0ca8 0000 01f4 0232       cmpi.l     #$000001F4,562(a0)
[00011530] 6f0e                      ble.s      $00011540
[00011532] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011538] 217c 0000 01f4 0232       move.l     #$000001F4,562(a0)
[00011540] 6040                      bra.s      $00011582
[00011542] 2039 0008 3eb0            move.l     wdemo,d0
[00011548] 6722                      beq.s      $0001156C
[0001154a] 2079 0008 3eb0            movea.l    wdemo,a0
[00011550] 3028 0020                 move.w     32(a0),d0
[00011554] 6f16                      ble.s      $0001156C
[00011556] 93c9                      suba.l     a1,a1
[00011558] 7002                      moveq.l    #2,d0
[0001155a] 2079 0008 3eb0            movea.l    wdemo,a0
[00011560] 2479 0008 3eb0            movea.l    wdemo,a2
[00011566] 246a 0004                 movea.l    4(a2),a2
[0001156a] 4e92                      jsr        (a2)
[0001156c] 2039 000e 6e7a            move.l     oldabout,d0
[00011572] 670e                      beq.s      $00011582
[00011574] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001157a] 2179 000e 6e7a 029c       move.l     oldabout,668(a0)
[00011582] 245f                      movea.l    (a7)+,a2
[00011584] 4e75                      rts
ComputeKey:
[00011586] 4fef efdc                 lea.l      -4132(a7),a7
[0001158a] 3f40 1022                 move.w     d0,4130(a7)
[0001158e] 2f48 101e                 move.l     a0,4126(a7)
[00011592] 3f41 101c                 move.w     d1,4124(a7)
[00011596] 2f49 1018                 move.l     a1,4120(a7)
[0001159a] 206f 1028                 movea.l    4136(a7),a0
[0001159e] 4eb9 0008 2cf8            jsr        atoi
[000115a4] 48c0                      ext.l      d0
[000115a6] 2f40 1014                 move.l     d0,4116(a7)
[000115aa] 206f 102c                 movea.l    4140(a7),a0
[000115ae] 4eb9 0008 2cf8            jsr        atoi
[000115b4] 48c0                      ext.l      d0
[000115b6] 2f40 1010                 move.l     d0,4112(a7)
[000115ba] 206f 1030                 movea.l    4144(a7),a0
[000115be] 4eb9 0008 2cf8            jsr        atoi
[000115c4] 48c0                      ext.l      d0
[000115c6] 2f40 100c                 move.l     d0,4108(a7)
[000115ca] 43f9 0008 68f5            lea.l      $000868F5,a1
[000115d0] 41ef 0004                 lea.l      4(a7),a0
[000115d4] 4eb9 0008 2f0c            jsr        strcpy
[000115da] 226f 101e                 movea.l    4126(a7),a1
[000115de] 41ef 0004                 lea.l      4(a7),a0
[000115e2] 4eb9 0008 2e42            jsr        strcat
[000115e8] 43f9 0008 6901            lea.l      $00086901,a1
[000115ee] 41ef 0004                 lea.l      4(a7),a0
[000115f2] 4eb9 0008 2e42            jsr        strcat
[000115f8] 226f 1018                 movea.l    4120(a7),a1
[000115fc] 41ef 0004                 lea.l      4(a7),a0
[00011600] 4eb9 0008 2e42            jsr        strcat
[00011606] 43f9 0008 690d            lea.l      $0008690D,a1
[0001160c] 41ef 0004                 lea.l      4(a7),a0
[00011610] 4eb9 0008 2e42            jsr        strcat
[00011616] 226f 1028                 movea.l    4136(a7),a1
[0001161a] 41ef 0004                 lea.l      4(a7),a0
[0001161e] 4eb9 0008 2e42            jsr        strcat
[00011624] 43f9 0008 6917            lea.l      $00086917,a1
[0001162a] 41ef 0004                 lea.l      4(a7),a0
[0001162e] 4eb9 0008 2e42            jsr        strcat
[00011634] 226f 102c                 movea.l    4140(a7),a1
[00011638] 41ef 0004                 lea.l      4(a7),a0
[0001163c] 4eb9 0008 2e42            jsr        strcat
[00011642] 226f 1030                 movea.l    4144(a7),a1
[00011646] 41ef 0004                 lea.l      4(a7),a0
[0001164a] 4eb9 0008 2e42            jsr        strcat
[00011650] 43f9 0008 6919            lea.l      $00086919,a1
[00011656] 41ef 0004                 lea.l      4(a7),a0
[0001165a] 4eb9 0008 2e42            jsr        strcat
[00011660] 226f 1038                 movea.l    4152(a7),a1
[00011664] 41ef 0004                 lea.l      4(a7),a0
[00011668] 4eb9 0008 2e42            jsr        strcat
[0001166e] 43f9 0008 6929            lea.l      $00086929,a1
[00011674] 41ef 0004                 lea.l      4(a7),a0
[00011678] 4eb9 0008 2e42            jsr        strcat
[0001167e] 226f 1034                 movea.l    4148(a7),a1
[00011682] 41ef 0004                 lea.l      4(a7),a0
[00011686] 4eb9 0008 2e42            jsr        strcat
[0001168c] 302f 1022                 move.w     4130(a7),d0
[00011690] 48c0                      ext.l      d0
[00011692] 721c                      moveq.l    #28,d1
[00011694] e3a8                      lsl.l      d1,d0
[00011696] 322f 101c                 move.w     4124(a7),d1
[0001169a] 48c1                      ext.l      d1
[0001169c] 7418                      moveq.l    #24,d2
[0001169e] e5a9                      lsl.l      d2,d1
[000116a0] 8081                      or.l       d1,d0
[000116a2] 222f 1014                 move.l     4116(a7),d1
[000116a6] 7410                      moveq.l    #16,d2
[000116a8] e5a9                      lsl.l      d2,d1
[000116aa] 8081                      or.l       d1,d0
[000116ac] 222f 1010                 move.l     4112(a7),d1
[000116b0] e189                      lsl.l      #8,d1
[000116b2] 8081                      or.l       d1,d0
[000116b4] 80af 100c                 or.l       4108(a7),d0
[000116b8] 2f40 1008                 move.l     d0,4104(a7)
[000116bc] 41ef 0004                 lea.l      4(a7),a0
[000116c0] 4eb9 0001 17ca            jsr        crc16
[000116c6] 48c0                      ext.l      d0
[000116c8] 7210                      moveq.l    #16,d1
[000116ca] e3a8                      lsl.l      d1,d0
[000116cc] 4680                      not.l      d0
[000116ce] 2f00                      move.l     d0,-(a7)
[000116d0] 206f 1038                 movea.l    4152(a7),a0
[000116d4] 4eb9 0001 17ca            jsr        crc16
[000116da] 48c0                      ext.l      d0
[000116dc] 221f                      move.l     (a7)+,d1
[000116de] b181                      eor.l      d0,d1
[000116e0] 2f01                      move.l     d1,-(a7)
[000116e2] 206f 103c                 movea.l    4156(a7),a0
[000116e6] 4eb9 0001 17ca            jsr        crc16
[000116ec] 48c0                      ext.l      d0
[000116ee] 221f                      move.l     (a7)+,d1
[000116f0] b181                      eor.l      d0,d1
[000116f2] 2f01                      move.l     d1,-(a7)
[000116f4] 206f 1022                 movea.l    4130(a7),a0
[000116f8] 4eb9 0001 17ca            jsr        crc16
[000116fe] 48c0                      ext.l      d0
[00011700] 4680                      not.l      d0
[00011702] 221f                      move.l     (a7)+,d1
[00011704] b181                      eor.l      d0,d1
[00011706] 2f01                      move.l     d1,-(a7)
[00011708] 206f 101c                 movea.l    4124(a7),a0
[0001170c] 4eb9 0001 17ca            jsr        crc16
[00011712] 48c0                      ext.l      d0
[00011714] 4680                      not.l      d0
[00011716] 221f                      move.l     (a7)+,d1
[00011718] b181                      eor.l      d0,d1
[0001171a] 2f01                      move.l     d1,-(a7)
[0001171c] 206f 102c                 movea.l    4140(a7),a0
[00011720] 4eb9 0001 17ca            jsr        crc16
[00011726] 48c0                      ext.l      d0
[00011728] 221f                      move.l     (a7)+,d1
[0001172a] b181                      eor.l      d0,d1
[0001172c] 2f01                      move.l     d1,-(a7)
[0001172e] 206f 1030                 movea.l    4144(a7),a0
[00011732] 4eb9 0001 17ca            jsr        crc16
[00011738] 48c0                      ext.l      d0
[0001173a] 221f                      move.l     (a7)+,d1
[0001173c] b181                      eor.l      d0,d1
[0001173e] 2f01                      move.l     d1,-(a7)
[00011740] 206f 1034                 movea.l    4148(a7),a0
[00011744] 4eb9 0001 17ca            jsr        crc16
[0001174a] 48c0                      ext.l      d0
[0001174c] 221f                      move.l     (a7)+,d1
[0001174e] b181                      eor.l      d0,d1
[00011750] 202f 1008                 move.l     4104(a7),d0
[00011754] b181                      eor.l      d0,d1
[00011756] 2f41 1004                 move.l     d1,4100(a7)
[0001175a] 43f9 0008 6935            lea.l      $00086935,a1
[00011760] 206f 103c                 movea.l    4156(a7),a0
[00011764] 4eb9 0008 2f0c            jsr        strcpy
[0001176a] 426f 0002                 clr.w      2(a7)
[0001176e] 6044                      bra.s      $000117B4
[00011770] 202f 1004                 move.l     4100(a7),d0
[00011774] 122f 0003                 move.b     3(a7),d1
[00011778] e2a0                      asr.l      d1,d0
[0001177a] c07c ffff                 and.w      #$FFFF,d0
[0001177e] 7200                      moveq.l    #0,d1
[00011780] 3200                      move.w     d0,d1
[00011782] 82fc 001a                 divu.w     #$001A,d1
[00011786] 4841                      swap       d1
[00011788] 3e81                      move.w     d1,(a7)
[0001178a] 0c57 0019                 cmpi.w     #$0019,(a7)
[0001178e] 6f08                      ble.s      $00011798
[00011790] 7016                      moveq.l    #22,d0
[00011792] d02f 0001                 add.b      1(a7),d0
[00011796] 6006                      bra.s      $0001179E
[00011798] 7041                      moveq.l    #65,d0
[0001179a] d02f 0001                 add.b      1(a7),d0
[0001179e] 322f 0002                 move.w     2(a7),d1
[000117a2] 48c1                      ext.l      d1
[000117a4] 83fc 0003                 divs.w     #$0003,d1
[000117a8] 206f 103c                 movea.l    4156(a7),a0
[000117ac] 1180 1000                 move.b     d0,0(a0,d1.w)
[000117b0] 566f 0002                 addq.w     #3,2(a7)
[000117b4] 0c6f 0020 0002            cmpi.w     #$0020,2(a7)
[000117ba] 6db4                      blt.s      $00011770
[000117bc] 206f 103c                 movea.l    4156(a7),a0
[000117c0] 4228 000a                 clr.b      10(a0)
[000117c4] 4fef 1024                 lea.l      4132(a7),a7
[000117c8] 4e75                      rts
crc16:
[000117ca] 4fef fff4                 lea.l      -12(a7),a7
[000117ce] 2f48 0008                 move.l     a0,8(a7)
[000117d2] 3f7c ffff 0002            move.w     #$FFFF,2(a7)
[000117d8] 206f 0008                 movea.l    8(a7),a0
[000117dc] 4eb9 0008 2f6c            jsr        strlen
[000117e2] 3e80                      move.w     d0,(a7)
[000117e4] 6050                      bra.s      $00011836
[000117e6] 422f 0006                 clr.b      6(a7)
[000117ea] 206f 0008                 movea.l    8(a7),a0
[000117ee] 52af 0008                 addq.l     #1,8(a7)
[000117f2] 1010                      move.b     (a0),d0
[000117f4] 4880                      ext.w      d0
[000117f6] c07c 00ff                 and.w      #$00FF,d0
[000117fa] 3f40 0004                 move.w     d0,4(a7)
[000117fe] 602e                      bra.s      $0001182E
[00011800] 7001                      moveq.l    #1,d0
[00011802] c06f 0002                 and.w      2(a7),d0
[00011806] 7201                      moveq.l    #1,d1
[00011808] c26f 0004                 and.w      4(a7),d1
[0001180c] b340                      eor.w      d1,d0
[0001180e] 6712                      beq.s      $00011822
[00011810] 302f 0002                 move.w     2(a7),d0
[00011814] e248                      lsr.w      #1,d0
[00011816] 323c 8408                 move.w     #$8408,d1
[0001181a] b340                      eor.w      d1,d0
[0001181c] 3f40 0002                 move.w     d0,2(a7)
[00011820] 6004                      bra.s      $00011826
[00011822] e2ef 0002                 lsr.w      2(a7)
[00011826] 522f 0006                 addq.b     #1,6(a7)
[0001182a] e2ef 0004                 lsr.w      4(a7)
[0001182e] 0c2f 0008 0006            cmpi.b     #$08,6(a7)
[00011834] 65ca                      bcs.s      $00011800
[00011836] 3017                      move.w     (a7),d0
[00011838] 5357                      subq.w     #1,(a7)
[0001183a] 4a40                      tst.w      d0
[0001183c] 66a8                      bne.s      $000117E6
[0001183e] 302f 0002                 move.w     2(a7),d0
[00011842] 4640                      not.w      d0
[00011844] 3f40 0002                 move.w     d0,2(a7)
[00011848] 3f6f 0002 0004            move.w     2(a7),4(a7)
[0001184e] 302f 0002                 move.w     2(a7),d0
[00011852] e148                      lsl.w      #8,d0
[00011854] 322f 0004                 move.w     4(a7),d1
[00011858] e049                      lsr.w      #8,d1
[0001185a] c27c 00ff                 and.w      #$00FF,d1
[0001185e] 8041                      or.w       d1,d0
[00011860] 3f40 0002                 move.w     d0,2(a7)
[00011864] 302f 0002                 move.w     2(a7),d0
[00011868] 4fef 000c                 lea.l      12(a7),a7
[0001186c] 4e75                      rts
validate:
[0001186e] 4fef fff4                 lea.l      -12(a7),a7
[00011872] 2039 0008 3eb0            move.l     wdemo,d0
[00011878] 6636                      bne.s      $000118B0
[0001187a] 41f9 0008 61fe            lea.l      WI_DEMO,a0
[00011880] 2279 0008 6206            movea.l    $00086206,a1
[00011886] 4e91                      jsr        (a1)
[00011888] 23c8 0008 3eb0            move.l     a0,wdemo
[0001188e] 6720                      beq.s      $000118B0
[00011890] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011896] 23e8 029c 000e 6e7a       move.l     668(a0),oldabout
[0001189e] 4eb9 0008 0f6c            jsr        Ash_gett
[000118a4] 23c0 000e 6e82            move.l     d0,timer1
[000118aa] 23c0 000e 6e7e            move.l     d0,timer0
[000118b0] 33fc 0001 0008 3eae       move.w     #$0001,runasdemo
[000118b8] 1039 0008 3eb9            move.b     $00083EB9,d0
[000118be] 6768                      beq.s      $00011928
[000118c0] 7005                      moveq.l    #5,d0
[000118c2] 43f9 0008 6940            lea.l      $00086940,a1
[000118c8] 41f9 0008 3f39            lea.l      $00083F39,a0
[000118ce] 4eb9 0008 2fb8            jsr        strncmp
[000118d4] 4a40                      tst.w      d0
[000118d6] 6650                      bne.s      $00011928
[000118d8] 4857                      pea.l      (a7)
[000118da] 4879 0008 3f39            pea.l      $00083F39
[000118e0] 4879 0008 3eb9            pea.l      $00083EB9
[000118e6] 4879 0008 695a            pea.l      $0008695A
[000118ec] 4879 0008 6958            pea.l      $00086958
[000118f2] 4879 0008 6956            pea.l      $00086956
[000118f8] 43f9 0008 694f            lea.l      $0008694F,a1
[000118fe] 4241                      clr.w      d1
[00011900] 41f9 0008 6946            lea.l      $00086946,a0
[00011906] 4240                      clr.w      d0
[00011908] 6100 fc7c                 bsr        ComputeKey
[0001190c] 4fef 0018                 lea.l      24(a7),a7
[00011910] 43d7                      lea.l      (a7),a1
[00011912] 41f9 0008 3f44            lea.l      $00083F44,a0
[00011918] 4eb9 0004 665a            jsr        Ast_cmp
[0001191e] 4a40                      tst.w      d0
[00011920] 6606                      bne.s      $00011928
[00011922] 4279 0008 3eae            clr.w      runasdemo
[00011928] 6100 fbda                 bsr        installdemo
[0001192c] 4fef 000c                 lea.l      12(a7),a7
[00011930] 4e75                      rts
demo_init:
[00011932] 2f0a                      move.l     a2,-(a7)
[00011934] 594f                      subq.w     #4,a7
[00011936] 2e88                      move.l     a0,(a7)
[00011938] 2057                      movea.l    (a7),a0
[0001193a] 0068 0020 0056            ori.w      #$0020,86(a0)
[00011940] 2057                      movea.l    (a7),a0
[00011942] 3028 0020                 move.w     32(a0),d0
[00011946] 6f40                      ble.s      $00011988
[00011948] 4eb9 0008 0f6c            jsr        Ash_gett
[0001194e] 23c0 000e 6e82            move.l     d0,timer1
[00011954] 2039 000e 6e82            move.l     timer1,d0
[0001195a] 90b9 000e 6e7e            sub.l      timer0,d0
[00011960] 7232                      moveq.l    #50,d1
[00011962] b280                      cmp.l      d0,d1
[00011964] 6e20                      bgt.s      $00011986
[00011966] 23f9 000e 6e82 000e 6e7e  move.l     timer1,timer0
[00011970] 58b9 0008 3eb4            addq.l     #4,stepper
[00011976] 2257                      movea.l    (a7),a1
[00011978] 43e9 0024                 lea.l      36(a1),a1
[0001197c] 2057                      movea.l    (a7),a0
[0001197e] 2457                      movea.l    (a7),a2
[00011980] 246a 006a                 movea.l    106(a2),a2
[00011984] 4e92                      jsr        (a2)
[00011986] 600e                      bra.s      $00011996
[00011988] 7000                      moveq.l    #0,d0
[0001198a] 23c0 000e 6e82            move.l     d0,timer1
[00011990] 23c0 000e 6e7e            move.l     d0,timer0
[00011996] 4240                      clr.w      d0
[00011998] 584f                      addq.w     #4,a7
[0001199a] 245f                      movea.l    (a7)+,a2
[0001199c] 4e75                      rts
demo_serv:
[0001199e] 4fef fff6                 lea.l      -10(a7),a7
[000119a2] 2f48 0006                 move.l     a0,6(a7)
[000119a6] 3f40 0004                 move.w     d0,4(a7)
[000119aa] 2e89                      move.l     a1,(a7)
[000119ac] 302f 0004                 move.w     4(a7),d0
[000119b0] 5540                      subq.w     #2,d0
[000119b2] 6702                      beq.s      $000119B6
[000119b4] 6038                      bra.s      $000119EE
[000119b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000119bc] 3028 023a                 move.w     570(a0),d0
[000119c0] 670c                      beq.s      $000119CE
[000119c2] 206f 0006                 movea.l    6(a7),a0
[000119c6] 4eb9 0005 85f2            jsr        Awi_delete
[000119cc] 601e                      bra.s      $000119EC
[000119ce] 206f 0006                 movea.l    6(a7),a0
[000119d2] 0068 0100 0056            ori.w      #$0100,86(a0)
[000119d8] 206f 0006                 movea.l    6(a7),a0
[000119dc] 4eb9 0005 8362            jsr        Awi_closed
[000119e2] 206f 0006                 movea.l    6(a7),a0
[000119e6] 0268 feff 0056            andi.w     #$FEFF,86(a0)
[000119ec] 6012                      bra.s      $00011A00
[000119ee] 2257                      movea.l    (a7),a1
[000119f0] 302f 0004                 move.w     4(a7),d0
[000119f4] 206f 0006                 movea.l    6(a7),a0
[000119f8] 4eb9 0005 9dd0            jsr        Awi_service
[000119fe] 6002                      bra.s      $00011A02
[00011a00] 7001                      moveq.l    #1,d0
[00011a02] 4fef 000a                 lea.l      10(a7),a7
[00011a06] 4e75                      rts
ScrollServ:
[00011a08] 4fef ffd4                 lea.l      -44(a7),a7
[00011a0c] 2f48 0028                 move.l     a0,40(a7)
[00011a10] 3f40 0026                 move.w     d0,38(a7)
[00011a14] 302f 0026                 move.w     38(a7),d0
[00011a18] 5340                      subq.w     #1,d0
[00011a1a] 670a                      beq.s      $00011A26
[00011a1c] 5340                      subq.w     #1,d0
[00011a1e] 6700 00ce                 beq        $00011AEE
[00011a22] 6000 00cc                 bra        $00011AF0
[00011a26] 3f7c 0001 0024            move.w     #$0001,36(a7)
[00011a2c] 6072                      bra.s      $00011AA0
[00011a2e] 41d7                      lea.l      (a7),a0
[00011a30] 322f 0024                 move.w     36(a7),d1
[00011a34] 2279 0010 ee4e            movea.l    ACSblk,a1
[00011a3a] 3029 0010                 move.w     16(a1),d0
[00011a3e] 4eb9 0007 5734            jsr        vqt_name
[00011a44] 3f40 0022                 move.w     d0,34(a7)
[00011a48] 102f 0020                 move.b     32(a7),d0
[00011a4c] 674e                      beq.s      $00011A9C
[00011a4e] 43f9 0008 695c            lea.l      $0008695C,a1
[00011a54] 2f09                      move.l     a1,-(a7)
[00011a56] 41ef 0004                 lea.l      4(a7),a0
[00011a5a] 4eb9 0008 3180            jsr        strupr
[00011a60] 225f                      movea.l    (a7)+,a1
[00011a62] 4eb9 0008 3008            jsr        strstr
[00011a68] 2008                      move.l     a0,d0
[00011a6a] 6612                      bne.s      $00011A7E
[00011a6c] 43f9 0008 6962            lea.l      $00086962,a1
[00011a72] 41d7                      lea.l      (a7),a0
[00011a74] 4eb9 0008 3008            jsr        strstr
[00011a7a] 2008                      move.l     a0,d0
[00011a7c] 671e                      beq.s      $00011A9C
[00011a7e] 302f 0022                 move.w     34(a7),d0
[00011a82] 48c0                      ext.l      d0
[00011a84] 7210                      moveq.l    #16,d1
[00011a86] e3a8                      lsl.l      d1,d0
[00011a88] 80bc 0000 000b            or.l       #$0000000B,d0
[00011a8e] 206f 0028                 movea.l    40(a7),a0
[00011a92] 2068 000c                 movea.l    12(a0),a0
[00011a96] 2140 0004                 move.l     d0,4(a0)
[00011a9a] 6016                      bra.s      $00011AB2
[00011a9c] 526f 0024                 addq.w     #1,36(a7)
[00011aa0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011aa6] 302f 0024                 move.w     36(a7),d0
[00011aaa] b068 0284                 cmp.w      644(a0),d0
[00011aae] 6f00 ff7e                 ble        $00011A2E
[00011ab2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011ab8] 302f 0024                 move.w     36(a7),d0
[00011abc] b068 0284                 cmp.w      644(a0),d0
[00011ac0] 6f2a                      ble.s      $00011AEC
[00011ac2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011ac8] 3028 0294                 move.w     660(a0),d0
[00011acc] 48c0                      ext.l      d0
[00011ace] 7210                      moveq.l    #16,d1
[00011ad0] e3a8                      lsl.l      d1,d0
[00011ad2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011ad8] 3228 0296                 move.w     662(a0),d1
[00011adc] 48c1                      ext.l      d1
[00011ade] 8081                      or.l       d1,d0
[00011ae0] 206f 0028                 movea.l    40(a7),a0
[00011ae4] 2068 000c                 movea.l    12(a0),a0
[00011ae8] 2140 0004                 move.l     d0,4(a0)
[00011aec] 6006                      bra.s      $00011AF4
[00011aee] 6004                      bra.s      $00011AF4
[00011af0] 4240                      clr.w      d0
[00011af2] 6002                      bra.s      $00011AF6
[00011af4] 7001                      moveq.l    #1,d0
[00011af6] 4fef 002c                 lea.l      44(a7),a7
[00011afa] 4e75                      rts
ScrollDemo:
[00011afc] 2f02                      move.l     d2,-(a7)
[00011afe] 2f0a                      move.l     a2,-(a7)
[00011b00] 4fef ffe0                 lea.l      -32(a7),a7
[00011b04] 206f 002c                 movea.l    44(a7),a0
[00011b08] 3028 000a                 move.w     10(a0),d0
[00011b0c] 3f40 0018                 move.w     d0,24(a7)
[00011b10] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011b16] 3228 0012                 move.w     18(a0),d1
[00011b1a] e241                      asr.w      #1,d1
[00011b1c] d041                      add.w      d1,d0
[00011b1e] 3f40 0010                 move.w     d0,16(a7)
[00011b22] 206f 002c                 movea.l    44(a7),a0
[00011b26] 3028 000c                 move.w     12(a0),d0
[00011b2a] 3f40 001a                 move.w     d0,26(a7)
[00011b2e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011b34] 3228 0014                 move.w     20(a0),d1
[00011b38] e241                      asr.w      #1,d1
[00011b3a] d041                      add.w      d1,d0
[00011b3c] 3f40 0012                 move.w     d0,18(a7)
[00011b40] 206f 002c                 movea.l    44(a7),a0
[00011b44] 3028 000a                 move.w     10(a0),d0
[00011b48] 206f 002c                 movea.l    44(a7),a0
[00011b4c] d068 000e                 add.w      14(a0),d0
[00011b50] 5340                      subq.w     #1,d0
[00011b52] 3f40 001c                 move.w     d0,28(a7)
[00011b56] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011b5c] 3228 0012                 move.w     18(a0),d1
[00011b60] e241                      asr.w      #1,d1
[00011b62] 9041                      sub.w      d1,d0
[00011b64] 3f40 0014                 move.w     d0,20(a7)
[00011b68] 206f 002c                 movea.l    44(a7),a0
[00011b6c] 3028 000c                 move.w     12(a0),d0
[00011b70] 206f 002c                 movea.l    44(a7),a0
[00011b74] d068 0010                 add.w      16(a0),d0
[00011b78] 5340                      subq.w     #1,d0
[00011b7a] 3f40 001e                 move.w     d0,30(a7)
[00011b7e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011b84] 3228 0014                 move.w     20(a0),d1
[00011b88] e241                      asr.w      #1,d1
[00011b8a] 9041                      sub.w      d1,d0
[00011b8c] 3f40 0016                 move.w     d0,22(a7)
[00011b90] 206f 002c                 movea.l    44(a7),a0
[00011b94] 3028 0016                 move.w     22(a0),d0
[00011b98] 660a                      bne.s      $00011BA4
[00011b9a] 206f 002c                 movea.l    44(a7),a0
[00011b9e] 3028 0018                 move.w     24(a0),d0
[00011ba2] 6756                      beq.s      $00011BFA
[00011ba4] 206f 002c                 movea.l    44(a7),a0
[00011ba8] 3f68 0012 0018            move.w     18(a0),24(a7)
[00011bae] 206f 002c                 movea.l    44(a7),a0
[00011bb2] 3f68 0014 001a            move.w     20(a0),26(a7)
[00011bb8] 206f 002c                 movea.l    44(a7),a0
[00011bbc] 3028 0012                 move.w     18(a0),d0
[00011bc0] 206f 002c                 movea.l    44(a7),a0
[00011bc4] d068 0016                 add.w      22(a0),d0
[00011bc8] 5340                      subq.w     #1,d0
[00011bca] 3f40 001c                 move.w     d0,28(a7)
[00011bce] 206f 002c                 movea.l    44(a7),a0
[00011bd2] 3028 0014                 move.w     20(a0),d0
[00011bd6] 206f 002c                 movea.l    44(a7),a0
[00011bda] d068 0018                 add.w      24(a0),d0
[00011bde] 5340                      subq.w     #1,d0
[00011be0] 3f40 001e                 move.w     d0,30(a7)
[00011be4] 41ef 0018                 lea.l      24(a7),a0
[00011be8] 7201                      moveq.l    #1,d1
[00011bea] 2279 0010 ee4e            movea.l    ACSblk,a1
[00011bf0] 3029 0010                 move.w     16(a1),d0
[00011bf4] 4eb9 0007 2230            jsr        vs_clip
[00011bfa] 7201                      moveq.l    #1,d1
[00011bfc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011c02] 3028 0010                 move.w     16(a0),d0
[00011c06] 4eb9 0007 3070            jsr        vswr_mode
[00011c0c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011c12] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[00011c18] 6d14                      blt.s      $00011C2E
[00011c1a] 7208                      moveq.l    #8,d1
[00011c1c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011c22] 3028 0010                 move.w     16(a0),d0
[00011c26] 4eb9 0007 3708            jsr        vsf_color
[00011c2c] 6012                      bra.s      $00011C40
[00011c2e] 4241                      clr.w      d1
[00011c30] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011c36] 3028 0010                 move.w     16(a0),d0
[00011c3a] 4eb9 0007 3708            jsr        vsf_color
[00011c40] 7201                      moveq.l    #1,d1
[00011c42] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011c48] 3028 0010                 move.w     16(a0),d0
[00011c4c] 4eb9 0007 3660            jsr        vsf_interior
[00011c52] 41ef 0018                 lea.l      24(a7),a0
[00011c56] 2279 0010 ee4e            movea.l    ACSblk,a1
[00011c5c] 3029 0010                 move.w     16(a1),d0
[00011c60] 4eb9 0007 282e            jsr        v_bar
[00011c66] 206f 002c                 movea.l    44(a7),a0
[00011c6a] 3028 0016                 move.w     22(a0),d0
[00011c6e] 660c                      bne.s      $00011C7C
[00011c70] 206f 002c                 movea.l    44(a7),a0
[00011c74] 3028 0018                 move.w     24(a0),d0
[00011c78] 6700 008e                 beq        $00011D08
[00011c7c] 206f 002c                 movea.l    44(a7),a0
[00011c80] 3028 0012                 move.w     18(a0),d0
[00011c84] b06f 0010                 cmp.w      16(a7),d0
[00011c88] 6f0a                      ble.s      $00011C94
[00011c8a] 206f 002c                 movea.l    44(a7),a0
[00011c8e] 3f68 0012 0010            move.w     18(a0),16(a7)
[00011c94] 206f 002c                 movea.l    44(a7),a0
[00011c98] 3028 0014                 move.w     20(a0),d0
[00011c9c] b06f 0012                 cmp.w      18(a7),d0
[00011ca0] 6f0a                      ble.s      $00011CAC
[00011ca2] 206f 002c                 movea.l    44(a7),a0
[00011ca6] 3f68 0014 0012            move.w     20(a0),18(a7)
[00011cac] 206f 002c                 movea.l    44(a7),a0
[00011cb0] 3028 0012                 move.w     18(a0),d0
[00011cb4] 206f 002c                 movea.l    44(a7),a0
[00011cb8] d068 0016                 add.w      22(a0),d0
[00011cbc] 5340                      subq.w     #1,d0
[00011cbe] b06f 0014                 cmp.w      20(a7),d0
[00011cc2] 6c16                      bge.s      $00011CDA
[00011cc4] 206f 002c                 movea.l    44(a7),a0
[00011cc8] 3028 0012                 move.w     18(a0),d0
[00011ccc] 206f 002c                 movea.l    44(a7),a0
[00011cd0] d068 0016                 add.w      22(a0),d0
[00011cd4] 5340                      subq.w     #1,d0
[00011cd6] 3f40 0014                 move.w     d0,20(a7)
[00011cda] 206f 002c                 movea.l    44(a7),a0
[00011cde] 3028 0014                 move.w     20(a0),d0
[00011ce2] 206f 002c                 movea.l    44(a7),a0
[00011ce6] d068 0018                 add.w      24(a0),d0
[00011cea] 5340                      subq.w     #1,d0
[00011cec] b06f 0016                 cmp.w      22(a7),d0
[00011cf0] 6c16                      bge.s      $00011D08
[00011cf2] 206f 002c                 movea.l    44(a7),a0
[00011cf6] 3028 0014                 move.w     20(a0),d0
[00011cfa] 206f 002c                 movea.l    44(a7),a0
[00011cfe] d068 0018                 add.w      24(a0),d0
[00011d02] 5340                      subq.w     #1,d0
[00011d04] 3f40 0016                 move.w     d0,22(a7)
[00011d08] 41ef 0010                 lea.l      16(a7),a0
[00011d0c] 7201                      moveq.l    #1,d1
[00011d0e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00011d14] 3029 0010                 move.w     16(a1),d0
[00011d18] 4eb9 0007 2230            jsr        vs_clip
[00011d1e] 206f 002c                 movea.l    44(a7),a0
[00011d22] 3228 0004                 move.w     4(a0),d1
[00011d26] 48c1                      ext.l      d1
[00011d28] 2001                      move.l     d1,d0
[00011d2a] d080                      add.l      d0,d0
[00011d2c] d081                      add.l      d1,d0
[00011d2e] e788                      lsl.l      #3,d0
[00011d30] 206f 002c                 movea.l    44(a7),a0
[00011d34] 2050                      movea.l    (a0),a0
[00011d36] d1c0                      adda.l     d0,a0
[00011d38] 2e88                      move.l     a0,(a7)
[00011d3a] 7202                      moveq.l    #2,d1
[00011d3c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011d42] 3028 0010                 move.w     16(a0),d0
[00011d46] 4eb9 0007 3070            jsr        vswr_mode
[00011d4c] 7201                      moveq.l    #1,d1
[00011d4e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011d54] 3028 0010                 move.w     16(a0),d0
[00011d58] 4eb9 0007 353a            jsr        vst_color
[00011d5e] 2057                      movea.l    (a7),a0
[00011d60] 2068 000c                 movea.l    12(a0),a0
[00011d64] 2228 0004                 move.l     4(a0),d1
[00011d68] 7010                      moveq.l    #16,d0
[00011d6a] e0a1                      asr.l      d0,d1
[00011d6c] c27c ffff                 and.w      #$FFFF,d1
[00011d70] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011d76] 3028 0010                 move.w     16(a0),d0
[00011d7a] 4eb9 0007 34e6            jsr        vst_font
[00011d80] 70ff                      moveq.l    #-1,d0
[00011d82] 2057                      movea.l    (a7),a0
[00011d84] 2068 000c                 movea.l    12(a0),a0
[00011d88] c068 0006                 and.w      6(a0),d0
[00011d8c] 3f40 000c                 move.w     d0,12(a7)
[00011d90] 486f 000c                 pea.l      12(a7)
[00011d94] 486f 0012                 pea.l      18(a7)
[00011d98] 43ef 0012                 lea.l      18(a7),a1
[00011d9c] 41ef 0012                 lea.l      18(a7),a0
[00011da0] 322f 0014                 move.w     20(a7),d1
[00011da4] 2479 0010 ee4e            movea.l    ACSblk,a2
[00011daa] 302a 0010                 move.w     16(a2),d0
[00011dae] 4eb9 0007 3370            jsr        vst_height
[00011db4] 504f                      addq.w     #8,a7
[00011db6] 43ef 000a                 lea.l      10(a7),a1
[00011dba] 41ef 000a                 lea.l      10(a7),a0
[00011dbe] 7405                      moveq.l    #5,d2
[00011dc0] 7201                      moveq.l    #1,d1
[00011dc2] 2479 0010 ee4e            movea.l    ACSblk,a2
[00011dc8] 302a 0010                 move.w     16(a2),d0
[00011dcc] 4eb9 0007 35e2            jsr        vst_alignment
[00011dd2] 206f 002c                 movea.l    44(a7),a0
[00011dd6] 3028 000e                 move.w     14(a0),d0
[00011dda] e240                      asr.w      #1,d0
[00011ddc] 206f 002c                 movea.l    44(a7),a0
[00011de0] d068 000a                 add.w      10(a0),d0
[00011de4] 3f40 0006                 move.w     d0,6(a7)
[00011de8] 302f 000c                 move.w     12(a7),d0
[00011dec] eb48                      lsl.w      #5,d0
[00011dee] 206f 002c                 movea.l    44(a7),a0
[00011df2] d068 0010                 add.w      16(a0),d0
[00011df6] 48c0                      ext.l      d0
[00011df8] 2239 0008 3eb4            move.l     stepper,d1
[00011dfe] b280                      cmp.l      d0,d1
[00011e00] 6f06                      ble.s      $00011E08
[00011e02] 42b9 0008 3eb4            clr.l      stepper
[00011e08] 206f 002c                 movea.l    44(a7),a0
[00011e0c] 3028 000c                 move.w     12(a0),d0
[00011e10] 206f 002c                 movea.l    44(a7),a0
[00011e14] d068 0010                 add.w      16(a0),d0
[00011e18] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011e1e] 9068 0014                 sub.w      20(a0),d0
[00011e22] 9079 0008 3eb6            sub.w      $00083EB6,d0
[00011e28] 3f40 0004                 move.w     d0,4(a7)
[00011e2c] 426f 0008                 clr.w      8(a7)
[00011e30] 6000 0100                 bra        $00011F32
[00011e34] 7002                      moveq.l    #2,d0
[00011e36] d06f 000c                 add.w      12(a7),d0
[00011e3a] d16f 0004                 add.w      d0,4(a7)
[00011e3e] 206f 002c                 movea.l    44(a7),a0
[00011e42] 302f 0004                 move.w     4(a7),d0
[00011e46] b068 000c                 cmp.w      12(a0),d0
[00011e4a] 6f00 00e2                 ble        $00011F2E
[00011e4e] 302f 0004                 move.w     4(a7),d0
[00011e52] d06f 000c                 add.w      12(a7),d0
[00011e56] 206f 002c                 movea.l    44(a7),a0
[00011e5a] 3228 000c                 move.w     12(a0),d1
[00011e5e] 206f 002c                 movea.l    44(a7),a0
[00011e62] d268 0010                 add.w      16(a0),d1
[00011e66] b041                      cmp.w      d1,d0
[00011e68] 6c00 00c4                 bge        $00011F2E
[00011e6c] 302f 0008                 move.w     8(a7),d0
[00011e70] e548                      lsl.w      #2,d0
[00011e72] 41f9 0008 63e4            lea.l      demotext,a0
[00011e78] 2070 0000                 movea.l    0(a0,d0.w),a0
[00011e7c] 0c10 002a                 cmpi.b     #$2A,(a0)
[00011e80] 6660                      bne.s      $00011EE2
[00011e82] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011e88] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[00011e8e] 6d14                      blt.s      $00011EA4
[00011e90] 7202                      moveq.l    #2,d1
[00011e92] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011e98] 3028 0010                 move.w     16(a0),d0
[00011e9c] 4eb9 0007 353a            jsr        vst_color
[00011ea2] 6012                      bra.s      $00011EB6
[00011ea4] 7201                      moveq.l    #1,d1
[00011ea6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011eac] 3028 0010                 move.w     16(a0),d0
[00011eb0] 4eb9 0007 358e            jsr        vst_effects
[00011eb6] 302f 0008                 move.w     8(a7),d0
[00011eba] e548                      lsl.w      #2,d0
[00011ebc] 41f9 0008 63e4            lea.l      demotext,a0
[00011ec2] 2070 0000                 movea.l    0(a0,d0.w),a0
[00011ec6] 5248                      addq.w     #1,a0
[00011ec8] 342f 0004                 move.w     4(a7),d2
[00011ecc] 322f 0006                 move.w     6(a7),d1
[00011ed0] 2279 0010 ee4e            movea.l    ACSblk,a1
[00011ed6] 3029 0010                 move.w     16(a1),d0
[00011eda] 4eb9 0007 24b0            jsr        v_gtext
[00011ee0] 604c                      bra.s      $00011F2E
[00011ee2] 7201                      moveq.l    #1,d1
[00011ee4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011eea] 3028 0010                 move.w     16(a0),d0
[00011eee] 4eb9 0007 353a            jsr        vst_color
[00011ef4] 4241                      clr.w      d1
[00011ef6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011efc] 3028 0010                 move.w     16(a0),d0
[00011f00] 4eb9 0007 358e            jsr        vst_effects
[00011f06] 302f 0008                 move.w     8(a7),d0
[00011f0a] e548                      lsl.w      #2,d0
[00011f0c] 41f9 0008 63e4            lea.l      demotext,a0
[00011f12] 2070 0000                 movea.l    0(a0,d0.w),a0
[00011f16] 342f 0004                 move.w     4(a7),d2
[00011f1a] 322f 0006                 move.w     6(a7),d1
[00011f1e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00011f24] 3029 0010                 move.w     16(a1),d0
[00011f28] 4eb9 0007 24b0            jsr        v_gtext
[00011f2e] 526f 0008                 addq.w     #1,8(a7)
[00011f32] 0c6f 0020 0008            cmpi.w     #$0020,8(a7)
[00011f38] 6d00 fefa                 blt        $00011E34
[00011f3c] 41ef 0010                 lea.l      16(a7),a0
[00011f40] 4241                      clr.w      d1
[00011f42] 2279 0010 ee4e            movea.l    ACSblk,a1
[00011f48] 3029 0010                 move.w     16(a1),d0
[00011f4c] 4eb9 0007 2230            jsr        vs_clip
[00011f52] 4240                      clr.w      d0
[00011f54] 4fef 0020                 lea.l      32(a7),a7
[00011f58] 245f                      movea.l    (a7)+,a2
[00011f5a] 241f                      move.l     (a7)+,d2
[00011f5c] 4e75                      rts

