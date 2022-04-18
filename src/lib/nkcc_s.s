	.text
nk_finds:
		btst       #13,d0
		beq.s      .search
		move.w     #$004A,d1
		cmp.b      0(a0,d1.w),d0
		beq.s      .found
		move.w     #$004E,d1
		cmp.b      0(a0,d1.w),d0
		beq.s      .found
		move.w     #$0063,d1
.numsear:
		cmp.b      0(a0,d1.w),d0
		beq.s      .found
		addq.w     #1,d1
		cmp.w      #$0073,d1
		bcs.s      .numsear
.search:
		move.w     #$0001,d1
.mainsea:
		cmp.b      0(a0,d1.w),d0
		beq.s      .found
		addq.b     #1,d1
		cmp.b      #$78,d1
		bcs.s      .mainsea
		moveq.l    #0,d1
		rts
.found:
		tst.w      d1
		rts

	.globl nkc_init
nkc_init:
		moveq.l    #-1,d0
		move.l     d0,-(a7)
		move.l     d0,-(a7)
		move.l     d0,-(a7)
		move.w     #$0010,-(a7) ; Keytbl
		trap       #14
		lea.l      14(a7),a7
		movea.l    d0,a0
		move.l     (a0)+,pkey_uns
		move.l     (a0)+,pkey_shi
		move.l     (a0),pkey_cap
.exit:
		move.w     #$0294,d0
		rts

	.globl nkc_tos2
nkc_tos2:
		movem.l    d3-d4,-(a7)
		move.l     d0,d1
		swap       d1
		move.w     d1,d2
		move.w     #$00FF,d3
		and.w      d3,d0
		and.w      d3,d1
		beq        .tos306
		and.w      #$1F00,d2
		move.w     d2,d3
		and.w      #$0300,d3
		beq.s      .ktab1
		movea.l    pkey_shi,a0
		bra.s      .ktab3
.ktab1:
		btst       #12,d2
		beq.s      .ktab2
		movea.l    pkey_cap,a0
		bra.s      .ktab3
.ktab2:
		movea.l    pkey_uns,a0
.ktab3:
		cmp.b      #$84,d1
		bcs.s      .ktab4
		move.w     d2,d1
		and.w      #$0C00,d1
		beq.s      .special
		or.w       #$2000,d0
		and.w      #$1300,d2
.special:
		or.w       d2,d0
		or.w       #$C000,d0
		cmp.b      #$20,d0
		bcc        .exit
		move.b     #$20,d0
		bra        .exit
.ktab4:
		cmp.b      #$78,d1
		bcs.s      .scan1
		sub.b      #$76,d1
		move.b     0(a0,d1.w),d0
		or.w       #$0800,d2
		bra        .cat_cod
.scan1:
		lea.l      xscantab,a1
.search_:
		move.w     (a1)+,d3
		bmi.s      .tabend
		cmp.b      d1,d3
		bne.s      .search_
		lsr.w      #8,d3
		moveq.l    #0,d0
		bra.s      .scan2
.tabend:
		moveq.l    #0,d3
.scan2:
		move.b     0(a0,d1.w),d4
		cmp.b      #$20,d0
		bcc.s      .scan3
		cmp.b      d4,d0
		beq.s      .scan3
		moveq.l    #0,d0
.scan3:
		tst.b      d0
		beq.s      .scan4
		cmp.b      d4,d0
		beq.s      .scan4
		and.w      #$F7FF,d2
.scan4:
		tst.b      d0
		bne.s      .scan5
		move.b     d3,d0
		bne.s      .scan5
		move.b     d4,d0
.scan5:
		cmp.b      #$7F,d0
		bne.s      .scan6
		move.b     #$1F,d0
.scan6:
		cmp.b      #$4A,d1
		beq.s      .numeric
		cmp.b      #$4E,d1
		beq.s      .numeric
		cmp.b      #$63,d1
		bcs.s      .scan7
		cmp.b      #$72,d1
		bhi.s      .scan7
.numeric:
		or.w       #$2000,d2
.scan7:
		cmp.b      #$20,d0
		bcc.s      .scan8
		or.w       #$8000,d2
		cmp.b      #$0D,d0
		bne.s      .scan8
		btst       #13,d2
		beq.s      .scan8
		moveq.l    #10,d0
.scan8:
		cmp.b      #$54,d1
		bcs.s      .scan9
		cmp.b      #$5D,d1
		bhi.s      .scan9
		sub.b      #$19,d1
		move.w     d2,d3
		and.w      #$0300,d3
		bne.s      .scan9
		or.w       #$0300,d2
.scan9:
		cmp.b      #$3B,d1
		bcs.s      .cat_cod
		cmp.b      #$44,d1
		bhi.s      .cat_cod
		move.b     d1,d0
		sub.b      #$2B,d0
.cat_cod:
		movea.l    pkey_shi,a0
		move.b     0(a0,d1.w),d3
		or.w       d2,d0
		bmi.s      .scan10
		and.w      #$0C00,d2
		bne.s      .scan11
.scan10:
		movea.l    pkey_uns,a0
		cmp.b      0(a0,d1.w),d3
		beq.s      .scan12
		bra.s      .exit
.scan11:
		or.w       #$8000,d0
		movea.l    pkey_cap,a0
		cmp.b      0(a0,d1.w),d3
		bne.s      .exit
		move.b     d3,d0
.scan12:
		or.w       #$4000,d0
.exit:
		tst.w      d0
		movem.l    (a7)+,d3-d4
		rts
.tos306:
		and.w      #$1000,d2
		or.w       d2,d0
		movem.l    (a7)+,d3-d4
		rts

	.globl nkc_n2to
nkc_n2to:
		move.w     d0,d1
		and.w      #$8C00,d1
		cmp.w      #$8000,d1
		bne.s      .ktab0
		cmp.b      #$20,d0
		bcs.s      .ktab0
		move.w     d0,d1
		and.l      #$00001300,d0
		btst       #13,d1
		beq.s      .mackey
		or.w       #$0C00,d0
.mackey:
		or.b       #$FF,d0
		swap       d0
		move.b     d1,d0
		bra        .exit
.ktab0:
		move.w     d0,d1
		and.w      #$0300,d1
		beq.s      .ktab1
		lea.l      n_to_sca2,a1
		movea.l    pkey_shi,a0
		bra.s      .ktab3
.ktab1:
		lea.l      n_to_sca,a1
		btst       #12,d0
		beq.s      .ktab2
		movea.l    pkey_cap,a0
		bra.s      .ktab3
.ktab2:
		movea.l    pkey_uns,a0
.ktab3:
		cmp.b      #$20,d0
		bcs.s      .lowasci
		bsr        nk_finds
		bne.s      .found
		btst       #15,d0
		beq.s      .notfoun
		move.l     a0,d1
		lea.l      tolower,a0
		moveq.l    #0,d2
		move.b     d0,d2
		move.b     0(a0,d2.w),d0
		movea.l    d1,a0
		bsr        nk_finds
		bne.s      .found
.notfoun:
		moveq.l    #0,d1
		move.b     d0,d1
		and.w      #$1F00,d0
		swap       d0
		move.w     d1,d0
		bra        .exit
.lowasci:
		btst       #15,d0
		bne.s      .func
		and.w      #$10FF,d0
		bra.s      .notfoun
.func:
		moveq.l    #0,d1
		move.b     d0,d1
		move.w     d1,d2
		move.b     0(a1,d1.w),d1
		bne.s      .getasci
		moveq.l    #0,d0
		bra        .exit
.getasci:
		lea.l      n_to_sca,a1
		move.b     0(a1,d2.w),d2
		move.b     0(a0,d2.w),d0
.found:
		move.w     d0,d2
		and.w      #$1F00,d0
		move.b     d1,d0
		swap       d0
		clr.w      d0
		move.b     d2,d0
		btst       #10,d2
		beq.s      .alterna
		cmp.b      #$4B,d1
		bne.s      .scanchk
		add.l      #$00280000,d0
		clr.b      d0
		bra.s      .exit
.scanchk:
		cmp.b      #$4D,d1
		bne.s      .scanchk2
		add.l      #$00270000,d0
		clr.b      d0
		bra.s      .exit
.scanchk2:
		cmp.b      #$47,d1
		bne.s      .ascchk
		add.l      #$00300000,d0
		bra.s      .exit
.ascchk:
		lea.l      asc_tran,a0
.ascloop:
		move.w     (a0)+,d1
		beq.s      .noctrla
		cmp.b      d0,d1
		bne.s      .ascloop
		lsr.w      #8,d1
		move.b     d1,d0
		bra.s      .exit
.noctrla:
		and.b      #$1F,d0
		bra.s      .exit
.alterna:
		btst       #11,d2
		beq.s      .exit
		cmp.b      #$02,d1
		bcs.s      .alphach
		cmp.b      #$0D,d1
		bhi.s      .alphach
		add.l      #$00760000,d0
		clr.b      d0
		bra.s      .exit
.alphach:
		cmp.b      #$41,d0
		bcs.s      .exit
		cmp.b      #$7A,d0
		bhi.s      .exit
		cmp.b      #$5A,d0
		bls.s      .ascii0
		cmp.b      #$61,d0
		bcs.s      .exit
.ascii0:
		clr.b      d0
.exit:
		tst.l      d0
		rts

	.globl nkc_toupper
nkc_toupper:
		lea.l      toupper,a0
		and.w      #$00FF,d0
		move.b     0(a0,d0.w),d0
		rts

	.globl nkc_tolower
nkc_tolower:
		lea.l      tolower,a0
		and.w      #$00FF,d0
		move.b     0(a0,d0.w),d0
		rts

	.data

xscantab:
		dc.w $0148
		dc.w $0250
		dc.w $044b
		dc.w $0473
		dc.w $034d
		dc.w $0374
		dc.w $0549
		dc.w $0651
		dc.w $074f
		dc.w $0b52
		dc.w $0c47
		dc.w $0c77
		dc.w $0e62
		dc.w $0f61
		dc.w $1a45
		dc.w $1c46
		dc.w $1d37
		dc.w $ffff
toupper:
		dc.w $0001
		dc.w $0203
		dc.w $0405
		dc.w $0607
		dc.w $0809
		dc.w $0a0b
		dc.w $0c0d
		dc.w $0e0f
		dc.w $1011
		dc.w $1213
		dc.w $1415
		dc.w $1617
		dc.w $1819
		dc.w $1a1b
		dc.w $1c1d
		dc.w $1e1f
		dc.w $2021
		dc.w $2223
		dc.w $2425
		dc.w $2627
		dc.w $2829
		dc.w $2a2b
		dc.w $2c2d
		dc.w $2e2f
		dc.w $3031
		dc.w $3233
		dc.w $3435
		dc.w $3637
		dc.w $3839
		dc.w $3a3b
		dc.w $3c3d
		dc.w $3e3f
		dc.w $4041
		dc.w $4243
		dc.w $4445
		dc.w $4647
		dc.w $4849
		dc.w $4a4b
		dc.w $4c4d
		dc.w $4e4f
		dc.w $5051
		dc.w $5253
		dc.w $5455
		dc.w $5657
		dc.w $5859
		dc.w $5a5b
		dc.w $5c5d
		dc.w $5e5f
		dc.w $6041
		dc.w $4243
		dc.w $4445
		dc.w $4647
		dc.w $4849
		dc.w $4a4b
		dc.w $4c4d
		dc.w $4e4f
		dc.w $5051
		dc.w $5253
		dc.w $5455
		dc.w $5657
		dc.w $5859
		dc.w $5a7b
		dc.w $7c7d
		dc.w $7e7f
		dc.w $809a
		dc.w $9083
		dc.w $8eb6
		dc.w $8f80
		dc.w $8889
		dc.w $8a8b
		dc.w $8c8d
		dc.w $8e8f
		dc.w $9092
		dc.w $9293
		dc.w $9995
		dc.w $9697
		dc.w $9899
		dc.w $9a9b
		dc.w $9c9d
		dc.w $9e9f
		dc.w $a0a1
		dc.w $a2a3
		dc.w $a5a5
		dc.w $a6a7
		dc.w $a8a9
		dc.w $aaab
		dc.w $acad
		dc.w $aeaf
		dc.w $b7b8
		dc.w $b2b2
		dc.w $b5b5
		dc.w $b6b7
		dc.w $b8b9
		dc.w $babb
		dc.w $bcbd
		dc.w $bebf
		dc.w $c0c1
		dc.w $c2c3
		dc.w $c4c5
		dc.w $c6c7
		dc.w $c8c9
		dc.w $cacb
		dc.w $cccd
		dc.w $cecf
		dc.w $d0d1
		dc.w $d2d3
		dc.w $d4d5
		dc.w $d6d7
		dc.w $d8d9
		dc.w $dadb
		dc.w $dcdd
		dc.w $dedf
		dc.w $e0e1
		dc.w $e2e3
		dc.w $e4e5
		dc.w $e6e7
		dc.w $e8e9
		dc.w $eaeb
		dc.w $eced
		dc.w $eeef
		dc.w $f0f1
		dc.w $f2f3
		dc.w $f4f5
		dc.w $f6f7
		dc.w $f8f9
		dc.w $fafb
		dc.w $fcfd
		dc.w $feff
tolower:
		dc.w $0001
		dc.w $0203
		dc.w $0405
		dc.w $0607
		dc.w $0809
		dc.w $0a0b
		dc.w $0c0d
		dc.w $0e0f
		dc.w $1011
		dc.w $1213
		dc.w $1415
		dc.w $1617
		dc.w $1819
		dc.w $1a1b
		dc.w $1c1d
		dc.w $1e1f
		dc.w $2021
		dc.w $2223
		dc.w $2425
		dc.w $2627
		dc.w $2829
		dc.w $2a2b
		dc.w $2c2d
		dc.w $2e2f
		dc.w $3031
		dc.w $3233
		dc.w $3435
		dc.w $3637
		dc.w $3839
		dc.w $3a3b
		dc.w $3c3d
		dc.w $3e3f
		dc.w $4061
		dc.w $6263
		dc.w $6465
		dc.w $6667
		dc.w $6869
		dc.w $6a6b
		dc.w $6c6d
		dc.w $6e6f
		dc.w $7071
		dc.w $7273
		dc.w $7475
		dc.w $7677
		dc.w $7879
		dc.w $7a5b
		dc.w $5c5d
		dc.w $5e5f
		dc.w $6061
		dc.w $6263
		dc.w $6465
		dc.w $6667
		dc.w $6869
		dc.w $6a6b
		dc.w $6c6d
		dc.w $6e6f
		dc.w $7071
		dc.w $7273
		dc.w $7475
		dc.w $7677
		dc.w $7879
		dc.w $7a7b
		dc.w $7c7d
		dc.w $7e7f
		dc.w $8781
		dc.w $8283
		dc.w $8485
		dc.w $8687
		dc.w $8889
		dc.w $8a8b
		dc.w $8c8d
		dc.w $8486
		dc.w $8291
		dc.w $9193
		dc.w $9495
		dc.w $9697
		dc.w $9894
		dc.w $819b
		dc.w $9c9d
		dc.w $9e9f
		dc.w $a0a1
		dc.w $a2a3
		dc.w $a4a4
		dc.w $a6a7
		dc.w $a8a9
		dc.w $aaab
		dc.w $acad
		dc.w $aeaf
		dc.w $b0b1
		dc.w $b3b3
		dc.w $b4b4
		dc.w $85b0
		dc.w $b1b9
		dc.w $babb
		dc.w $bcbd
		dc.w $bebf
		dc.w $c0c1
		dc.w $c2c3
		dc.w $c4c5
		dc.w $c6c7
		dc.w $c8c9
		dc.w $cacb
		dc.w $cccd
		dc.w $cecf
		dc.w $d0d1
		dc.w $d2d3
		dc.w $d4d5
		dc.w $d6d7
		dc.w $d8d9
		dc.w $dadb
		dc.w $dcdd
		dc.w $dedf
		dc.w $e0e1
		dc.w $e2e3
		dc.w $e4e5
		dc.w $e6e7
		dc.w $e8e9
		dc.w $eaeb
		dc.w $eced
		dc.w $eeef
		dc.w $f0f1
		dc.w $f2f3
		dc.w $f4f5
		dc.w $f6f7
		dc.w $f8f9
		dc.w $fafb
		dc.w $fcfd
		dc.w $feff
asc_tran:
		dc.w $0032
		dc.w $1e36
		dc.w $1f2d
		dc.w $0a0d
		dc.w $0000
n_to_sca:
		dc.w $0048
		dc.w $504d
		dc.w $4b49
		dc.w $514f
		dc.w $0e0f
		dc.w $7252
		dc.w $471c
		dc.w $6261
		dc.w $3b3c
		dc.w $3d3e
		dc.w $3f40
		dc.w $4142
		dc.w $4344
		dc.w $4501
		dc.w $4637
		dc.w $0053
n_to_sca2:
		dc.w $0048
		dc.w $504d
		dc.w $4b49
		dc.w $514f
		dc.w $0e0f
		dc.w $7252
		dc.w $471c
		dc.w $6261
		dc.w $5455
		dc.w $5657
		dc.w $5859
		dc.w $5a5b
		dc.w $5c5d
		dc.w $4501
		dc.w $4637
		dc.w $0053
	.globl pshift
pshift:
		dc.l 0

	.bss

pkey_uns: ds.l 1
pkey_shi: ds.l 1
pkey_cap: ds.l 1
