nk_finds:
[00043f22] 0800 000d                 btst       #13,d0
[00043f26] 6726                      beq.s      .search
[00043f28] 323c 004a                 move.w     #$004A,d1
[00043f2c] b030 1000                 cmp.b      0(a0,d1.w),d0
[00043f30] 6732                      beq.s      .found
[00043f32] 323c 004e                 move.w     #$004E,d1
[00043f36] b030 1000                 cmp.b      0(a0,d1.w),d0
[00043f3a] 6728                      beq.s      .found
[00043f3c] 323c 0063                 move.w     #$0063,d1
.numsear:
[00043f40] b030 1000                 cmp.b      0(a0,d1.w),d0
[00043f44] 671e                      beq.s      .found
[00043f46] 5241                      addq.w     #1,d1
[00043f48] b27c 0073                 cmp.w      #$0073,d1
[00043f4c] 65f2                      bcs.s      .numsear
.search:
[00043f4e] 323c 0001                 move.w     #$0001,d1
.mainsea:
[00043f52] b030 1000                 cmp.b      0(a0,d1.w),d0
[00043f56] 670c                      beq.s      .found
[00043f58] 5201                      addq.b     #1,d1
[00043f5a] b23c 0078                 cmp.b      #$78,d1
[00043f5e] 65f2                      bcs.s      .mainsea
[00043f60] 7200                      moveq.l    #0,d1
[00043f62] 4e75                      rts
.found:
[00043f64] 4a41                      tst.w      d1
[00043f66] 4e75                      rts
nkc_init:
[00043f68] 70ff                      moveq.l    #-1,d0
[00043f6a] 2f00                      move.l     d0,-(a7)
[00043f6c] 2f00                      move.l     d0,-(a7)
[00043f6e] 2f00                      move.l     d0,-(a7)
[00043f70] 3f3c 0010                 move.w     #$0010,-(a7) ; Keytbl
[00043f74] 4e4e                      trap       #14
[00043f76] 4fef 000e                 lea.l      14(a7),a7
[00043f7a] 2040                      movea.l    d0,a0
[00043f7c] 23d8 0010 f582            move.l     (a0)+,pkey_uns
[00043f82] 23d8 0010 f586            move.l     (a0)+,pkey_shi
[00043f88] 23d0 0010 f58a            move.l     (a0),pkey_cap
.exit:
[00043f8e] 303c 0294                 move.w     #$0294,d0
[00043f92] 4e75                      rts
nkc_tos2:
[00043f94] 48e7 1800                 movem.l    d3-d4,-(a7)
[00043f98] 2200                      move.l     d0,d1
[00043f9a] 4841                      swap       d1
[00043f9c] 3401                      move.w     d1,d2
[00043f9e] 363c 00ff                 move.w     #$00FF,d3
[00043fa2] c043                      and.w      d3,d0
[00043fa4] c243                      and.w      d3,d1
[00043fa6] 6700 0154                 beq        .tos306
[00043faa] c47c 1f00                 and.w      #$1F00,d2
[00043fae] 3602                      move.w     d2,d3
[00043fb0] c67c 0300                 and.w      #$0300,d3
[00043fb4] 6708                      beq.s      .ktab1
[00043fb6] 2079 0010 f586            movea.l    pkey_shi,a0
[00043fbc] 6014                      bra.s      .ktab3
.ktab1:
[00043fbe] 0802 000c                 btst       #12,d2
[00043fc2] 6708                      beq.s      .ktab2
[00043fc4] 2079 0010 f58a            movea.l    pkey_cap,a0
[00043fca] 6006                      bra.s      .ktab3
.ktab2:
[00043fcc] 2079 0010 f582            movea.l    pkey_uns,a0
.ktab3:
[00043fd2] b23c 0084                 cmp.b      #$84,d1
[00043fd6] 6526                      bcs.s      .ktab4
[00043fd8] 3202                      move.w     d2,d1
[00043fda] c27c 0c00                 and.w      #$0C00,d1
[00043fde] 6708                      beq.s      .special
[00043fe0] 807c 2000                 or.w       #$2000,d0
[00043fe4] c47c 1300                 and.w      #$1300,d2
.special:
[00043fe8] 8042                      or.w       d2,d0
[00043fea] 807c c000                 or.w       #$C000,d0
[00043fee] b03c 0020                 cmp.b      #$20,d0
[00043ff2] 6400 0100                 bcc        .exit
[00043ff6] 103c 0020                 move.b     #$20,d0
[00043ffa] 6000 00f8                 bra        .exit
.ktab4:
[00043ffe] b23c 0078                 cmp.b      #$78,d1
[00044002] 6510                      bcs.s      .scan1
[00044004] 923c 0076                 sub.b      #$76,d1
[00044008] 1030 1000                 move.b     0(a0,d1.w),d0
[0004400c] 847c 0800                 or.w       #$0800,d2
[00044010] 6000 00aa                 bra        .cat_cod
.scan1:
[00044014] 43f9 000e 0300            lea.l      xscantab,a1
.search_:
[0004401a] 3619                      move.w     (a1)+,d3
[0004401c] 6b0a                      bmi.s      .tabend
[0004401e] b601                      cmp.b      d1,d3
[00044020] 66f8                      bne.s      .search_
[00044022] e04b                      lsr.w      #8,d3
[00044024] 7000                      moveq.l    #0,d0
[00044026] 6002                      bra.s      .scan2
.tabend:
[00044028] 7600                      moveq.l    #0,d3
.scan2:
[0004402a] 1830 1000                 move.b     0(a0,d1.w),d4
[0004402e] b03c 0020                 cmp.b      #$20,d0
[00044032] 6406                      bcc.s      .scan3
[00044034] b004                      cmp.b      d4,d0
[00044036] 6702                      beq.s      .scan3
[00044038] 7000                      moveq.l    #0,d0
.scan3:
[0004403a] 4a00                      tst.b      d0
[0004403c] 6708                      beq.s      .scan4
[0004403e] b004                      cmp.b      d4,d0
[00044040] 6704                      beq.s      .scan4
[00044042] c47c f7ff                 and.w      #$F7FF,d2
.scan4:
[00044046] 4a00                      tst.b      d0
[00044048] 6606                      bne.s      .scan5
[0004404a] 1003                      move.b     d3,d0
[0004404c] 6602                      bne.s      .scan5
[0004404e] 1004                      move.b     d4,d0
.scan5:
[00044050] b03c 007f                 cmp.b      #$7F,d0
[00044054] 6604                      bne.s      .scan6
[00044056] 103c 001f                 move.b     #$1F,d0
.scan6:
[0004405a] b23c 004a                 cmp.b      #$4A,d1
[0004405e] 6712                      beq.s      .numeric
[00044060] b23c 004e                 cmp.b      #$4E,d1
[00044064] 670c                      beq.s      .numeric
[00044066] b23c 0063                 cmp.b      #$63,d1
[0004406a] 650a                      bcs.s      .scan7
[0004406c] b23c 0072                 cmp.b      #$72,d1
[00044070] 6204                      bhi.s      .scan7
.numeric:
[00044072] 847c 2000                 or.w       #$2000,d2
.scan7:
[00044076] b03c 0020                 cmp.b      #$20,d0
[0004407a] 6412                      bcc.s      .scan8
[0004407c] 847c 8000                 or.w       #$8000,d2
[00044080] b03c 000d                 cmp.b      #$0D,d0
[00044084] 6608                      bne.s      .scan8
[00044086] 0802 000d                 btst       #13,d2
[0004408a] 6702                      beq.s      .scan8
[0004408c] 700a                      moveq.l    #10,d0
.scan8:
[0004408e] b23c 0054                 cmp.b      #$54,d1
[00044092] 6516                      bcs.s      .scan9
[00044094] b23c 005d                 cmp.b      #$5D,d1
[00044098] 6210                      bhi.s      .scan9
[0004409a] 923c 0019                 sub.b      #$19,d1
[0004409e] 3602                      move.w     d2,d3
[000440a0] c67c 0300                 and.w      #$0300,d3
[000440a4] 6604                      bne.s      .scan9
[000440a6] 847c 0300                 or.w       #$0300,d2
.scan9:
[000440aa] b23c 003b                 cmp.b      #$3B,d1
[000440ae] 650c                      bcs.s      .cat_cod
[000440b0] b23c 0044                 cmp.b      #$44,d1
[000440b4] 6206                      bhi.s      .cat_cod
[000440b6] 1001                      move.b     d1,d0
[000440b8] 903c 002b                 sub.b      #$2B,d0
.cat_cod:
[000440bc] 2079 0010 f586            movea.l    pkey_shi,a0
[000440c2] 1630 1000                 move.b     0(a0,d1.w),d3
[000440c6] 8042                      or.w       d2,d0
[000440c8] 6b06                      bmi.s      .scan10
[000440ca] c47c 0c00                 and.w      #$0C00,d2
[000440ce] 660e                      bne.s      .scan11
.scan10:
[000440d0] 2079 0010 f582            movea.l    pkey_uns,a0
[000440d6] b630 1000                 cmp.b      0(a0,d1.w),d3
[000440da] 6714                      beq.s      .scan12
[000440dc] 6016                      bra.s      .exit
.scan11:
[000440de] 807c 8000                 or.w       #$8000,d0
[000440e2] 2079 0010 f58a            movea.l    pkey_cap,a0
[000440e8] b630 1000                 cmp.b      0(a0,d1.w),d3
[000440ec] 6606                      bne.s      .exit
[000440ee] 1003                      move.b     d3,d0
.scan12:
[000440f0] 807c 4000                 or.w       #$4000,d0
.exit:
[000440f4] 4a40                      tst.w      d0
[000440f6] 4cdf 0018                 movem.l    (a7)+,d3-d4
[000440fa] 4e75                      rts
.tos306:
[000440fc] c47c 1000                 and.w      #$1000,d2
[00044100] 8042                      or.w       d2,d0
[00044102] 4cdf 0018                 movem.l    (a7)+,d3-d4
[00044106] 4e75                      rts
nkc_n2to:
[00044108] 3200                      move.w     d0,d1
[0004410a] c27c 8c00                 and.w      #$8C00,d1
[0004410e] b27c 8000                 cmp.w      #$8000,d1
[00044112] 6624                      bne.s      .ktab0
[00044114] b03c 0020                 cmp.b      #$20,d0
[00044118] 651e                      bcs.s      .ktab0
[0004411a] 3200                      move.w     d0,d1
[0004411c] c0bc 0000 1300            and.l      #$00001300,d0
[00044122] 0801 000d                 btst       #13,d1
[00044126] 6704                      beq.s      .mackey
[00044128] 807c 0c00                 or.w       #$0C00,d0
.mackey:
[0004412c] 803c 00ff                 or.b       #$FF,d0
[00044130] 4840                      swap       d0
[00044132] 1001                      move.b     d1,d0
[00044134] 6000 012a                 bra        .exit
.ktab0:
[00044138] 3200                      move.w     d0,d1
[0004413a] c27c 0300                 and.w      #$0300,d1
[0004413e] 670e                      beq.s      .ktab1
[00044140] 43f9 000e 054e            lea.l      n_to_sca,a1
[00044146] 2079 0010 f586            movea.l    pkey_shi,a0
[0004414c] 601a                      bra.s      .ktab3
.ktab1:
[0004414e] 43f9 000e 052e            lea.l      n_to_sca,a1
[00044154] 0800 000c                 btst       #12,d0
[00044158] 6708                      beq.s      .ktab2
[0004415a] 2079 0010 f58a            movea.l    pkey_cap,a0
[00044160] 6006                      bra.s      .ktab3
.ktab2:
[00044162] 2079 0010 f582            movea.l    pkey_uns,a0
.ktab3:
[00044168] b03c 0020                 cmp.b      #$20,d0
[0004416c] 6534                      bcs.s      .lowasci
[0004416e] 6100 fdb2                 bsr        nk_finds
[00044172] 665a                      bne.s      .found
[00044174] 0800 000f                 btst       #15,d0
[00044178] 6718                      beq.s      .notfoun
[0004417a] 2208                      move.l     a0,d1
[0004417c] 41f9 000e 0424            lea.l      tolower,a0
[00044182] 7400                      moveq.l    #0,d2
[00044184] 1400                      move.b     d0,d2
[00044186] 1030 2000                 move.b     0(a0,d2.w),d0
[0004418a] 2041                      movea.l    d1,a0
[0004418c] 6100 fd94                 bsr        nk_finds
[00044190] 663c                      bne.s      .found
.notfoun:
[00044192] 7200                      moveq.l    #0,d1
[00044194] 1200                      move.b     d0,d1
[00044196] c07c 1f00                 and.w      #$1F00,d0
[0004419a] 4840                      swap       d0
[0004419c] 3001                      move.w     d1,d0
[0004419e] 6000 00c0                 bra        .exit
.lowasci:
[000441a2] 0800 000f                 btst       #15,d0
[000441a6] 6606                      bne.s      .func
[000441a8] c07c 10ff                 and.w      #$10FF,d0
[000441ac] 60e4                      bra.s      .notfoun
.func:
[000441ae] 7200                      moveq.l    #0,d1
[000441b0] 1200                      move.b     d0,d1
[000441b2] 3401                      move.w     d1,d2
[000441b4] 1231 1000                 move.b     0(a1,d1.w),d1
[000441b8] 6606                      bne.s      .getasci
[000441ba] 7000                      moveq.l    #0,d0
[000441bc] 6000 00a2                 bra        .exit
.getasci:
[000441c0] 43f9 000e 052e            lea.l      n_to_sca,a1
[000441c6] 1431 2000                 move.b     0(a1,d2.w),d2
[000441ca] 1030 2000                 move.b     0(a0,d2.w),d0
.found:
[000441ce] 3400                      move.w     d0,d2
[000441d0] c07c 1f00                 and.w      #$1F00,d0
[000441d4] 1001                      move.b     d1,d0
[000441d6] 4840                      swap       d0
[000441d8] 4240                      clr.w      d0
[000441da] 1002                      move.b     d2,d0
[000441dc] 0802 000a                 btst       #10,d2
[000441e0] 6748                      beq.s      .alterna
[000441e2] b23c 004b                 cmp.b      #$4B,d1
[000441e6] 660a                      bne.s      .scanchk
[000441e8] d0bc 0028 0000            add.l      #$00280000,d0
[000441ee] 4200                      clr.b      d0
[000441f0] 606e                      bra.s      .exit
.scanchk:
[000441f2] b23c 004d                 cmp.b      #$4D,d1
[000441f6] 660a                      bne.s      .scanchk
[000441f8] d0bc 0027 0000            add.l      #$00270000,d0
[000441fe] 4200                      clr.b      d0
[00044200] 605e                      bra.s      .exit
.scanchk:
[00044202] b23c 0047                 cmp.b      #$47,d1
[00044206] 6608                      bne.s      .ascchk
[00044208] d0bc 0030 0000            add.l      #$00300000,d0
[0004420e] 6050                      bra.s      .exit
.ascchk:
[00044210] 41f9 000e 0524            lea.l      asc_tran,a0
.ascloop:
[00044216] 3218                      move.w     (a0)+,d1
[00044218] 670a                      beq.s      .noctrla
[0004421a] b200                      cmp.b      d0,d1
[0004421c] 66f8                      bne.s      .ascloop
[0004421e] e049                      lsr.w      #8,d1
[00044220] 1001                      move.b     d1,d0
[00044222] 603c                      bra.s      .exit
.noctrla:
[00044224] c03c 001f                 and.b      #$1F,d0
[00044228] 6036                      bra.s      .exit
.alterna:
[0004422a] 0802 000b                 btst       #11,d2
[0004422e] 6730                      beq.s      .exit
[00044230] b23c 0002                 cmp.b      #$02,d1
[00044234] 6510                      bcs.s      .alphach
[00044236] b23c 000d                 cmp.b      #$0D,d1
[0004423a] 620a                      bhi.s      .alphach
[0004423c] d0bc 0076 0000            add.l      #$00760000,d0
[00044242] 4200                      clr.b      d0
[00044244] 601a                      bra.s      .exit
.alphach:
[00044246] b03c 0041                 cmp.b      #$41,d0
[0004424a] 6514                      bcs.s      .exit
[0004424c] b03c 007a                 cmp.b      #$7A,d0
[00044250] 620e                      bhi.s      .exit
[00044252] b03c 005a                 cmp.b      #$5A,d0
[00044256] 6306                      bls.s      .ascii0
[00044258] b03c 0061                 cmp.b      #$61,d0
[0004425c] 6502                      bcs.s      .exit
.ascii0:
[0004425e] 4200                      clr.b      d0
.exit:
[00044260] 4a80                      tst.l      d0
[00044262] 4e75                      rts
nkc_toup:
[00044264] 41f9 000e 0324            lea.l      toupper,a0
[0004426a] c07c 00ff                 and.w      #$00FF,d0
[0004426e] 1030 0000                 move.b     0(a0,d0.w),d0
[00044272] 4e75                      rts
nkc_tolo:
[00044274] 41f9 000e 0424            lea.l      tolower,a0
[0004427a] c07c 00ff                 and.w      #$00FF,d0
[0004427e] 1030 0000                 move.b     0(a0,d0.w),d0
[00044282] 4e75                      rts
