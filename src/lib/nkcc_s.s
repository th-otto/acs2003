		.text

nk_finds:
		btst       #13,d0
		beq.s      nk_finds_search
		move.w     #0x004A,d1
		cmp.b      0(a0,d1.w),d0
		beq.s      nk_finds_found
		move.w     #0x004E,d1
		cmp.b      0(a0,d1.w),d0
		beq.s      nk_finds_found
		move.w     #0x0063,d1
nk_finds_numsear:
		cmp.b      0(a0,d1.w),d0
		beq.s      nk_finds_found
		addq.w     #1,d1
		cmp.w      #0x0073,d1
		bcs.s      nk_finds_numsear
nk_finds_search:
		move.w     #0x0001,d1
nk_finds_mainsea:
		cmp.b      0(a0,d1.w),d0
		beq.s      nk_finds_found
		addq.b     #1,d1
		cmp.b      #0x78,d1
		bcs.s      nk_finds_mainsea
		moveq.l    #0,d1
		rts
nk_finds_found:
		tst.w      d1
		rts

	.globl nkc_init
nkc_init:
		moveq.l    #-1,d0
		move.l     d0,-(a7)
		move.l     d0,-(a7)
		move.l     d0,-(a7)
		move.w     #0x0010,-(a7)
		trap       #14
		lea.l      14(a7),a7
		movea.l    d0,a0
		move.l     (a0)+,pkey_uns
		move.l     (a0)+,pkey_shi
		move.l     (a0),pkey_cap
		move.w     #0x0294,d0
		rts

	.globl nkc_tos2n
nkc_tos2n:
		movem.l    d3-d4,-(a7)
		move.l     d0,d1
		swap       d1
		move.w     d1,d2
		move.w     #0x00FF,d3
		and.w      d3,d0
		and.w      d3,d1
		beq        nkc_tos2n_tos306
		and.w      #0x1F00,d2
		move.w     d2,d3
		and.w      #0x0300,d3
		beq.s      nkc_tos2n_ktab1
		movea.l    pkey_shi,a0
		bra.s      nkc_tos2n_ktab3
nkc_tos2n_ktab1:
		btst       #12,d2
		beq.s      nkc_tos2n_ktab2
		movea.l    pkey_cap,a0
		bra.s      nkc_tos2n_ktab3
nkc_tos2n_ktab2:
		movea.l    pkey_uns,a0
nkc_tos2n_ktab3:
		cmp.b      #0x84,d1
		bcs.s      nkc_tos2n_ktab4
		move.w     d2,d1
		and.w      #0x0C00,d1
		beq.s      nkc_tos2n_special
		or.w       #0x2000,d0
		and.w      #0x1300,d2
nkc_tos2n_special:
		or.w       d2,d0
		or.w       #0xC000,d0
		cmp.b      #0x20,d0
		bcc        nkc_tos2n_exit
		move.b     #0x20,d0
		bra        nkc_tos2n_exit
nkc_tos2n_ktab4:
		cmp.b      #0x78,d1
		bcs.s      nkc_tos2n_scan1
		sub.b      #0x76,d1
		move.b     0(a0,d1.w),d0
		or.w       #0x0800,d2
		bra        nkc_tos2n_cat_cod
nkc_tos2n_scan1:
		lea.l      xscantab,a1
nkc_tos2n_search:
		move.w     (a1)+,d3
		bmi.s      nkc_tos2n_tabend
		cmp.b      d1,d3
		bne.s      nkc_tos2n_search
		lsr.w      #8,d3
		moveq.l    #0,d0
		bra.s      nkc_tos2n_scan2
nkc_tos2n_tabend:
		moveq.l    #0,d3
nkc_tos2n_scan2:
		move.b     0(a0,d1.w),d4
		cmp.b      #0x20,d0
		bcc.s      nkc_tos2n_scan3
		cmp.b      d4,d0
		beq.s      nkc_tos2n_scan3
		moveq.l    #0,d0
nkc_tos2n_scan3:
		tst.b      d0
		beq.s      nkc_tos2n_scan4
		cmp.b      d4,d0
		beq.s      nkc_tos2n_scan4
		and.w      #0xF7FF,d2
nkc_tos2n_scan4:
		tst.b      d0
		bne.s      nkc_tos2n_scan5
		move.b     d3,d0
		bne.s      nkc_tos2n_scan5
		move.b     d4,d0
nkc_tos2n_scan5:
		cmp.b      #0x7F,d0
		bne.s      nkc_tos2n_scan6
		move.b     #0x1F,d0
nkc_tos2n_scan6:
		cmp.b      #0x4A,d1
		beq.s      nkc_tos2n_numeric
		cmp.b      #0x4E,d1
		beq.s      nkc_tos2n_numeric
		cmp.b      #0x63,d1
		bcs.s      nkc_tos2n_scan7
		cmp.b      #0x72,d1
		bhi.s      nkc_tos2n_scan7
nkc_tos2n_numeric:
		or.w       #0x2000,d2
nkc_tos2n_scan7:
		cmp.b      #0x20,d0
		bcc.s      nkc_tos2n_scan8
		or.w       #0x8000,d2
		cmp.b      #0x0D,d0
		bne.s      nkc_tos2n_scan8
		btst       #13,d2
		beq.s      nkc_tos2n_scan8
		moveq.l    #10,d0
nkc_tos2n_scan8:
		cmp.b      #0x54,d1
		bcs.s      nkc_tos2n_scan9
		cmp.b      #0x5D,d1
		bhi.s      nkc_tos2n_scan9
		sub.b      #0x19,d1
		move.w     d2,d3
		and.w      #0x0300,d3
		bne.s      nkc_tos2n_scan9
		or.w       #0x0300,d2
nkc_tos2n_scan9:
		cmp.b      #0x3B,d1
		bcs.s      nkc_tos2n_cat_cod
		cmp.b      #0x44,d1
		bhi.s      nkc_tos2n_cat_cod
		move.b     d1,d0
		sub.b      #0x2B,d0
nkc_tos2n_cat_cod:
		movea.l    pkey_shi,a0
		move.b     0(a0,d1.w),d3
		or.w       d2,d0
		bmi.s      nkc_tos2n_scan10
		and.w      #0x0C00,d2
		bne.s      nkc_tos2n_scan11
nkc_tos2n_scan10:
		movea.l    pkey_uns,a0
		cmp.b      0(a0,d1.w),d3
		beq.s      nkc_tos2n_scan12
		bra.s      nkc_tos2n_exit
nkc_tos2n_scan11:
		or.w       #0x8000,d0
		movea.l    pkey_cap,a0
		cmp.b      0(a0,d1.w),d3
		bne.s      nkc_tos2n_exit
		move.b     d3,d0
nkc_tos2n_scan12:
		or.w       #0x4000,d0
nkc_tos2n_exit:
		tst.w      d0
		movem.l    (a7)+,d3-d4
		rts
nkc_tos2n_tos306:
		and.w      #0x1000,d2
		or.w       d2,d0
		movem.l    (a7)+,d3-d4
		rts

	.globl nkc_n2tos
nkc_n2tos:
		move.w     d0,d1
		and.w      #0x8C00,d1
		cmp.w      #0x8000,d1
		bne.s      nkc_n2tos_ktab0
		cmp.b      #0x20,d0
		bcs.s      nkc_n2tos_ktab0
		move.w     d0,d1
		and.l      #0x00001300,d0
		btst       #13,d1
		beq.s      nkc_n2tos_mackey
		or.w       #0x0C00,d0
nkc_n2tos_mackey:
		or.b       #0xFF,d0
		swap       d0
		move.b     d1,d0
		bra        nkc_n2tos_exit
nkc_n2tos_ktab0:
		move.w     d0,d1
		and.w      #0x0300,d1
		beq.s      nkc_n2tos_ktab1
		lea.l      n_to_sca2,a1
		movea.l    pkey_shi,a0
		bra.s      nkc_n2tos_ktab3
nkc_n2tos_ktab1:
		lea.l      n_to_sca,a1
		btst       #12,d0
		beq.s      nkc_n2tos_ktab2
		movea.l    pkey_cap,a0
		bra.s      nkc_n2tos_ktab3
nkc_n2tos_ktab2:
		movea.l    pkey_uns,a0
nkc_n2tos_ktab3:
		cmp.b      #0x20,d0
		bcs.s      nkc_n2tos_lowasci
		bsr        nk_finds
		bne.s      nkc_n2tos_found
		btst       #15,d0
		beq.s      nkc_n2tos_notfoun
		move.l     a0,d1
		lea.l      tolower,a0
		moveq.l    #0,d2
		move.b     d0,d2
		move.b     0(a0,d2.w),d0
		movea.l    d1,a0
		bsr        nk_finds
		bne.s      nkc_n2tos_found
nkc_n2tos_notfoun:
		moveq.l    #0,d1
		move.b     d0,d1
		and.w      #0x1F00,d0
		swap       d0
		move.w     d1,d0
		bra        nkc_n2tos_exit
nkc_n2tos_lowasci:
		btst       #15,d0
		bne.s      nkc_n2tos_func
		and.w      #0x10FF,d0
		bra.s      nkc_n2tos_notfoun
nkc_n2tos_func:
		moveq.l    #0,d1
		move.b     d0,d1
		move.w     d1,d2
		move.b     0(a1,d1.w),d1
		bne.s      nkc_n2tos_getasci
		moveq.l    #0,d0
		bra        nkc_n2tos_exit
nkc_n2tos_getasci:
		lea.l      n_to_sca,a1
		move.b     0(a1,d2.w),d2
		move.b     0(a0,d2.w),d0
nkc_n2tos_found:
		move.w     d0,d2
		and.w      #0x1F00,d0
		move.b     d1,d0
		swap       d0
		clr.w      d0
		move.b     d2,d0
		btst       #10,d2
		beq.s      nkc_n2tos_alterna
		cmp.b      #0x4B,d1
		bne.s      nkc_n2tos_scanchk
		add.l      #0x00280000,d0
		clr.b      d0
		bra.s      nkc_n2tos_exit
nkc_n2tos_scanchk:
		cmp.b      #0x4D,d1
		bne.s      nkc_n2tos_scanchk2
		add.l      #0x00270000,d0
		clr.b      d0
		bra.s      nkc_n2tos_exit
nkc_n2tos_scanchk2:
		cmp.b      #0x47,d1
		bne.s      nkc_n2tos_ascchk
		add.l      #0x00300000,d0
		bra.s      nkc_n2tos_exit
nkc_n2tos_ascchk:
		lea.l      asc_tran,a0
nkc_n2tos_ascloop:
		move.w     (a0)+,d1
		beq.s      nkc_n2tos_noctrla
		cmp.b      d0,d1
		bne.s      nkc_n2tos_ascloop
		lsr.w      #8,d1
		move.b     d1,d0
		bra.s      nkc_n2tos_exit
nkc_n2tos_noctrla:
		and.b      #0x1F,d0
		bra.s      nkc_n2tos_exit
nkc_n2tos_alterna:
		btst       #11,d2
		beq.s      nkc_n2tos_exit
		cmp.b      #0x02,d1
		bcs.s      nkc_n2tos_alphach
		cmp.b      #0x0D,d1
		bhi.s      nkc_n2tos_alphach
		add.l      #0x00760000,d0
		clr.b      d0
		bra.s      nkc_n2tos_exit
nkc_n2tos_alphach:
		cmp.b      #0x41,d0
		bcs.s      nkc_n2tos_exit
		cmp.b      #0x7A,d0
		bhi.s      nkc_n2tos_exit
		cmp.b      #0x5A,d0
		bls.s      nkc_n2tos_ascii0
		cmp.b      #0x61,d0
		bcs.s      nkc_n2tos_exit
nkc_n2tos_ascii0:
		clr.b      d0
nkc_n2tos_exit:
		tst.l      d0
		rts

	.globl nkc_toupper
nkc_toupper:
		lea.l      toupper,a0
		and.w      #0x00FF,d0
		move.b     0(a0,d0.w),d0
		rts

	.globl nkc_tolower
nkc_tolower:
		lea.l      tolower,a0
		and.w      #0x00FF,d0
		move.b     0(a0,d0.w),d0
		rts

	.data

xscantab:
		dc.w 0x0148
		dc.w 0x0250
		dc.w 0x044b
		dc.w 0x0473
		dc.w 0x034d
		dc.w 0x0374
		dc.w 0x0549
		dc.w 0x0651
		dc.w 0x074f
		dc.w 0x0b52
		dc.w 0x0c47
		dc.w 0x0c77
		dc.w 0x0e62
		dc.w 0x0f61
		dc.w 0x1a45
		dc.w 0x1c46
		dc.w 0x1d37
		dc.w 0xffff
toupper:
		dc.w 0x0001
		dc.w 0x0203
		dc.w 0x0405
		dc.w 0x0607
		dc.w 0x0809
		dc.w 0x0a0b
		dc.w 0x0c0d
		dc.w 0x0e0f
		dc.w 0x1011
		dc.w 0x1213
		dc.w 0x1415
		dc.w 0x1617
		dc.w 0x1819
		dc.w 0x1a1b
		dc.w 0x1c1d
		dc.w 0x1e1f
		dc.w 0x2021
		dc.w 0x2223
		dc.w 0x2425
		dc.w 0x2627
		dc.w 0x2829
		dc.w 0x2a2b
		dc.w 0x2c2d
		dc.w 0x2e2f
		dc.w 0x3031
		dc.w 0x3233
		dc.w 0x3435
		dc.w 0x3637
		dc.w 0x3839
		dc.w 0x3a3b
		dc.w 0x3c3d
		dc.w 0x3e3f
		dc.w 0x4041
		dc.w 0x4243
		dc.w 0x4445
		dc.w 0x4647
		dc.w 0x4849
		dc.w 0x4a4b
		dc.w 0x4c4d
		dc.w 0x4e4f
		dc.w 0x5051
		dc.w 0x5253
		dc.w 0x5455
		dc.w 0x5657
		dc.w 0x5859
		dc.w 0x5a5b
		dc.w 0x5c5d
		dc.w 0x5e5f
		dc.w 0x6041
		dc.w 0x4243
		dc.w 0x4445
		dc.w 0x4647
		dc.w 0x4849
		dc.w 0x4a4b
		dc.w 0x4c4d
		dc.w 0x4e4f
		dc.w 0x5051
		dc.w 0x5253
		dc.w 0x5455
		dc.w 0x5657
		dc.w 0x5859
		dc.w 0x5a7b
		dc.w 0x7c7d
		dc.w 0x7e7f
		dc.w 0x809a
		dc.w 0x9083
		dc.w 0x8eb6
		dc.w 0x8f80
		dc.w 0x8889
		dc.w 0x8a8b
		dc.w 0x8c8d
		dc.w 0x8e8f
		dc.w 0x9092
		dc.w 0x9293
		dc.w 0x9995
		dc.w 0x9697
		dc.w 0x9899
		dc.w 0x9a9b
		dc.w 0x9c9d
		dc.w 0x9e9f
		dc.w 0xa0a1
		dc.w 0xa2a3
		dc.w 0xa5a5
		dc.w 0xa6a7
		dc.w 0xa8a9
		dc.w 0xaaab
		dc.w 0xacad
		dc.w 0xaeaf
		dc.w 0xb7b8
		dc.w 0xb2b2
		dc.w 0xb5b5
		dc.w 0xb6b7
		dc.w 0xb8b9
		dc.w 0xbabb
		dc.w 0xbcbd
		dc.w 0xbebf
		dc.w 0xc0c1
		dc.w 0xc2c3
		dc.w 0xc4c5
		dc.w 0xc6c7
		dc.w 0xc8c9
		dc.w 0xcacb
		dc.w 0xcccd
		dc.w 0xcecf
		dc.w 0xd0d1
		dc.w 0xd2d3
		dc.w 0xd4d5
		dc.w 0xd6d7
		dc.w 0xd8d9
		dc.w 0xdadb
		dc.w 0xdcdd
		dc.w 0xdedf
		dc.w 0xe0e1
		dc.w 0xe2e3
		dc.w 0xe4e5
		dc.w 0xe6e7
		dc.w 0xe8e9
		dc.w 0xeaeb
		dc.w 0xeced
		dc.w 0xeeef
		dc.w 0xf0f1
		dc.w 0xf2f3
		dc.w 0xf4f5
		dc.w 0xf6f7
		dc.w 0xf8f9
		dc.w 0xfafb
		dc.w 0xfcfd
		dc.w 0xfeff
tolower:
		dc.w 0x0001
		dc.w 0x0203
		dc.w 0x0405
		dc.w 0x0607
		dc.w 0x0809
		dc.w 0x0a0b
		dc.w 0x0c0d
		dc.w 0x0e0f
		dc.w 0x1011
		dc.w 0x1213
		dc.w 0x1415
		dc.w 0x1617
		dc.w 0x1819
		dc.w 0x1a1b
		dc.w 0x1c1d
		dc.w 0x1e1f
		dc.w 0x2021
		dc.w 0x2223
		dc.w 0x2425
		dc.w 0x2627
		dc.w 0x2829
		dc.w 0x2a2b
		dc.w 0x2c2d
		dc.w 0x2e2f
		dc.w 0x3031
		dc.w 0x3233
		dc.w 0x3435
		dc.w 0x3637
		dc.w 0x3839
		dc.w 0x3a3b
		dc.w 0x3c3d
		dc.w 0x3e3f
		dc.w 0x4061
		dc.w 0x6263
		dc.w 0x6465
		dc.w 0x6667
		dc.w 0x6869
		dc.w 0x6a6b
		dc.w 0x6c6d
		dc.w 0x6e6f
		dc.w 0x7071
		dc.w 0x7273
		dc.w 0x7475
		dc.w 0x7677
		dc.w 0x7879
		dc.w 0x7a5b
		dc.w 0x5c5d
		dc.w 0x5e5f
		dc.w 0x6061
		dc.w 0x6263
		dc.w 0x6465
		dc.w 0x6667
		dc.w 0x6869
		dc.w 0x6a6b
		dc.w 0x6c6d
		dc.w 0x6e6f
		dc.w 0x7071
		dc.w 0x7273
		dc.w 0x7475
		dc.w 0x7677
		dc.w 0x7879
		dc.w 0x7a7b
		dc.w 0x7c7d
		dc.w 0x7e7f
		dc.w 0x8781
		dc.w 0x8283
		dc.w 0x8485
		dc.w 0x8687
		dc.w 0x8889
		dc.w 0x8a8b
		dc.w 0x8c8d
		dc.w 0x8486
		dc.w 0x8291
		dc.w 0x9193
		dc.w 0x9495
		dc.w 0x9697
		dc.w 0x9894
		dc.w 0x819b
		dc.w 0x9c9d
		dc.w 0x9e9f
		dc.w 0xa0a1
		dc.w 0xa2a3
		dc.w 0xa4a4
		dc.w 0xa6a7
		dc.w 0xa8a9
		dc.w 0xaaab
		dc.w 0xacad
		dc.w 0xaeaf
		dc.w 0xb0b1
		dc.w 0xb3b3
		dc.w 0xb4b4
		dc.w 0x85b0
		dc.w 0xb1b9
		dc.w 0xbabb
		dc.w 0xbcbd
		dc.w 0xbebf
		dc.w 0xc0c1
		dc.w 0xc2c3
		dc.w 0xc4c5
		dc.w 0xc6c7
		dc.w 0xc8c9
		dc.w 0xcacb
		dc.w 0xcccd
		dc.w 0xcecf
		dc.w 0xd0d1
		dc.w 0xd2d3
		dc.w 0xd4d5
		dc.w 0xd6d7
		dc.w 0xd8d9
		dc.w 0xdadb
		dc.w 0xdcdd
		dc.w 0xdedf
		dc.w 0xe0e1
		dc.w 0xe2e3
		dc.w 0xe4e5
		dc.w 0xe6e7
		dc.w 0xe8e9
		dc.w 0xeaeb
		dc.w 0xeced
		dc.w 0xeeef
		dc.w 0xf0f1
		dc.w 0xf2f3
		dc.w 0xf4f5
		dc.w 0xf6f7
		dc.w 0xf8f9
		dc.w 0xfafb
		dc.w 0xfcfd
		dc.w 0xfeff
asc_tran:
		dc.w 0x0032
		dc.w 0x1e36
		dc.w 0x1f2d
		dc.w 0x0a0d
		dc.w 0x0000
n_to_sca:
		dc.w 0x0048
		dc.w 0x504d
		dc.w 0x4b49
		dc.w 0x514f
		dc.w 0x0e0f
		dc.w 0x7252
		dc.w 0x471c
		dc.w 0x6261
		dc.w 0x3b3c
		dc.w 0x3d3e
		dc.w 0x3f40
		dc.w 0x4142
		dc.w 0x4344
		dc.w 0x4501
		dc.w 0x4637
		dc.w 0x0053
n_to_sca2:
		dc.w 0x0048
		dc.w 0x504d
		dc.w 0x4b49
		dc.w 0x514f
		dc.w 0x0e0f
		dc.w 0x7252
		dc.w 0x471c
		dc.w 0x6261
		dc.w 0x5455
		dc.w 0x5657
		dc.w 0x5859
		dc.w 0x5a5b
		dc.w 0x5c5d
		dc.w 0x4501
		dc.w 0x4637
		dc.w 0x0053
	.globl pshift
pshift:
		dc.l 0

	.bss

pkey_uns: ds.l 1
pkey_shi: ds.l 1
pkey_cap: ds.l 1
