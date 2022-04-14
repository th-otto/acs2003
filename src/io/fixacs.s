ConvertWindowV2x:
[00016db2] 2f0a                      move.l     a2,-(a7)
[00016db4] 2f0b                      move.l     a3,-(a7)
[00016db6] 2448                      movea.l    a0,a2
[00016db8] 2649                      movea.l    a1,a3
[00016dba] 203c 0000 008e            move.l     #$0000008E,d0
[00016dc0] 2049                      movea.l    a1,a0
[00016dc2] 224a                      movea.l    a2,a1
[00016dc4] 4eb9 0008 3500            jsr        memcpy
[00016dca] 42ab 008e                 clr.l      142(a3)
[00016dce] 42ab 0092                 clr.l      146(a3)
[00016dd2] 42ab 0096                 clr.l      150(a3)
[00016dd6] 42ab 009a                 clr.l      154(a3)
[00016dda] 42ab 009e                 clr.l      158(a3)
[00016dde] 265f                      movea.l    (a7)+,a3
[00016de0] 245f                      movea.l    (a7)+,a2
[00016de2] 4e75                      rts
ConvertUserV1x:
[00016de4] 2290                      move.l     (a0),(a1)
[00016de6] 2368 0004 0004            move.l     4(a0),4(a1)
[00016dec] 42a9 0008                 clr.l      8(a1)
[00016df0] 42a9 000c                 clr.l      12(a1)
[00016df4] 42a9 0010                 clr.l      16(a1)
[00016df8] 42a9 0014                 clr.l      20(a1)
[00016dfc] 42a9 0018                 clr.l      24(a1)
[00016e00] 42a9 001c                 clr.l      28(a1)
[00016e04] 4e75                      rts
ConvertUserV2x:
[00016e06] 2290                      move.l     (a0),(a1)
[00016e08] 2368 0004 0004            move.l     4(a0),4(a1)
[00016e0e] 2368 0008 0008            move.l     8(a0),8(a1)
[00016e14] 2368 000c 000c            move.l     12(a0),12(a1)
[00016e1a] 2368 0010 0010            move.l     16(a0),16(a1)
[00016e20] 2368 0014 0014            move.l     20(a0),20(a1)
[00016e26] 42a9 0018                 clr.l      24(a1)
[00016e2a] 42a9 001c                 clr.l      28(a1)
[00016e2e] 4e75                      rts
fix_config:
[00016e30] 2f0a                      move.l     a2,-(a7)
[00016e32] 2448                      movea.l    a0,a2
[00016e34] 4eb9 0001 6f8c            jsr        fix_ob
[00016e3a] 41ea 0004                 lea.l      4(a2),a0
[00016e3e] 4eb9 0001 6f8c            jsr        fix_ob
[00016e44] 41ea 0008                 lea.l      8(a2),a0
[00016e48] 4eb9 0001 6f8c            jsr        fix_ob
[00016e4e] 41ea 0012                 lea.l      18(a2),a0
[00016e52] 4eb9 0001 6f8c            jsr        fix_ob
[00016e58] 41ea 0016                 lea.l      22(a2),a0
[00016e5c] 4eb9 0001 6f8c            jsr        fix_ob
[00016e62] 41ea 001a                 lea.l      26(a2),a0
[00016e66] 4eb9 0001 6f8c            jsr        fix_ob
[00016e6c] 41ea 001e                 lea.l      30(a2),a0
[00016e70] 4eb9 0001 6f8c            jsr        fix_ob
[00016e76] 41ea 0022                 lea.l      34(a2),a0
[00016e7a] 4eb9 0001 6f8c            jsr        fix_ob
[00016e80] 41ea 0026                 lea.l      38(a2),a0
[00016e84] 4eb9 0001 6f8c            jsr        fix_ob
[00016e8a] 41ea 002a                 lea.l      42(a2),a0
[00016e8e] 4eb9 0001 6f8c            jsr        fix_ob
[00016e94] 41ea 002e                 lea.l      46(a2),a0
[00016e98] 4eb9 0001 6f8c            jsr        fix_ob
[00016e9e] 41ea 0032                 lea.l      50(a2),a0
[00016ea2] 4eb9 0001 6f8c            jsr        fix_ob
[00016ea8] 41ea 0036                 lea.l      54(a2),a0
[00016eac] 4eb9 0001 6f8c            jsr        fix_ob
[00016eb2] 41ea 003a                 lea.l      58(a2),a0
[00016eb6] 4eb9 0001 6f8c            jsr        fix_ob
[00016ebc] 41ea 0042                 lea.l      66(a2),a0
[00016ec0] 4eb9 0001 6f8c            jsr        fix_ob
[00016ec6] 41ea 0046                 lea.l      70(a2),a0
[00016eca] 4eb9 0001 6f8c            jsr        fix_ob
[00016ed0] 41ea 004a                 lea.l      74(a2),a0
[00016ed4] 4eb9 0001 6f8c            jsr        fix_ob
[00016eda] 245f                      movea.l    (a7)+,a2
[00016edc] 4e75                      rts
unfix_config:
[00016ede] 2f0a                      move.l     a2,-(a7)
[00016ee0] 2448                      movea.l    a0,a2
[00016ee2] 4eb9 0001 6f9c            jsr        unfix_ob
[00016ee8] 41ea 0004                 lea.l      4(a2),a0
[00016eec] 4eb9 0001 6f9c            jsr        unfix_ob
[00016ef2] 41ea 0008                 lea.l      8(a2),a0
[00016ef6] 4eb9 0001 6f9c            jsr        unfix_ob
[00016efc] 41ea 0012                 lea.l      18(a2),a0
[00016f00] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f06] 41ea 0016                 lea.l      22(a2),a0
[00016f0a] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f10] 41ea 001a                 lea.l      26(a2),a0
[00016f14] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f1a] 41ea 001e                 lea.l      30(a2),a0
[00016f1e] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f24] 41ea 0022                 lea.l      34(a2),a0
[00016f28] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f2e] 41ea 0026                 lea.l      38(a2),a0
[00016f32] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f38] 41ea 002a                 lea.l      42(a2),a0
[00016f3c] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f42] 41ea 002e                 lea.l      46(a2),a0
[00016f46] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f4c] 41ea 0032                 lea.l      50(a2),a0
[00016f50] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f56] 41ea 0036                 lea.l      54(a2),a0
[00016f5a] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f60] 41ea 003a                 lea.l      58(a2),a0
[00016f64] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f6a] 41ea 0042                 lea.l      66(a2),a0
[00016f6e] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f74] 41ea 0046                 lea.l      70(a2),a0
[00016f78] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f7e] 41ea 004a                 lea.l      74(a2),a0
[00016f82] 4eb9 0001 6f9c            jsr        unfix_ob
[00016f88] 245f                      movea.l    (a7)+,a2
[00016f8a] 4e75                      rts
fix_ob:
[00016f8c] 2010                      move.l     (a0),d0
[00016f8e] 670a                      beq.s      $00016F9A
[00016f90] 2240                      movea.l    d0,a1
[00016f92] 7200                      moveq.l    #0,d1
[00016f94] 3229 0008                 move.w     8(a1),d1
[00016f98] 2081                      move.l     d1,(a0)
[00016f9a] 4e75                      rts
unfix_ob:
[00016f9c] 3028 0002                 move.w     2(a0),d0
[00016fa0] 48c0                      ext.l      d0
[00016fa2] e588                      lsl.l      #2,d0
[00016fa4] 2279 000a 49f8            movea.l    trans,a1
[00016faa] 20b1 0800                 move.l     0(a1,d0.l),(a0)
[00016fae] 4e75                      rts
next_trans:
[00016fb0] 3039 000e 772a            move.w     used,d0
[00016fb6] 48c0                      ext.l      d0
[00016fb8] 72ff                      moveq.l    #-1,d1
[00016fba] d2b9 000a 49fc            add.l      transcount,d1
[00016fc0] b081                      cmp.l      d1,d0
[00016fc2] 6d10                      blt.s      $00016FD4
[00016fc4] 41f9 000a 77c3            lea.l      ERR_TRANS,a0
[00016fca] 7001                      moveq.l    #1,d0
[00016fcc] 4eb9 0005 a600            jsr        Awi_alert
[00016fd2] 4e75                      rts
[00016fd4] 5279 000e 772a            addq.w     #1,used
[00016fda] 4e75                      rts
fix_all:
[00016fdc] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00016fe0] 2648                      movea.l    a0,a3
[00016fe2] 7602                      moveq.l    #2,d3
[00016fe4] 49f9 000a 49f8            lea.l      trans,a4
[00016fea] 45ec 0008                 lea.l      8(a4),a2
[00016fee] 206b 0010                 movea.l    16(a3),a0
[00016ff2] 6004                      bra.s      $00016FF8
[00016ff4] 5283                      addq.l     #1,d3
[00016ff6] 2050                      movea.l    (a0),a0
[00016ff8] 2008                      move.l     a0,d0
[00016ffa] 66f8                      bne.s      $00016FF4
[00016ffc] 2003                      move.l     d3,d0
[00016ffe] e588                      lsl.l      #2,d0
[00017000] 4eb9 0004 c608            jsr        Ax_malloc
[00017006] 2888                      move.l     a0,(a4)
[00017008] 2008                      move.l     a0,d0
[0001700a] 6616                      bne.s      $00017022
[0001700c] 2279 0010 ee4e            movea.l    ACSblk,a1
[00017012] 2269 03d6                 movea.l    982(a1),a1
[00017016] 7003                      moveq.l    #3,d0
[00017018] 91c8                      suba.l     a0,a0
[0001701a] 4e91                      jsr        (a1)
[0001701c] 4240                      clr.w      d0
[0001701e] 6000 024e                 bra        $0001726E
[00017022] 2203                      move.l     d3,d1
[00017024] e589                      lsl.l      #2,d1
[00017026] 4240                      clr.w      d0
[00017028] 2054                      movea.l    (a4),a0
[0001702a] 4eb9 0008 36ea            jsr        memset
[00017030] 2943 0004                 move.l     d3,4(a4)
[00017034] 2743 0164                 move.l     d3,356(a3)
[00017038] 206b 0010                 movea.l    16(a3),a0
[0001703c] 4eb9 0001 7a90            jsr        fix_labels
[00017042] 2252                      movea.l    (a2),a1
[00017044] 206b 0014                 movea.l    20(a3),a0
[00017048] 4eb9 0001 7b14            jsr        fix_list
[0001704e] 226a 0004                 movea.l    4(a2),a1
[00017052] 206b 0018                 movea.l    24(a3),a0
[00017056] 4eb9 0001 7b14            jsr        fix_list
[0001705c] 226a 0008                 movea.l    8(a2),a1
[00017060] 206b 001c                 movea.l    28(a3),a0
[00017064] 4eb9 0001 7b14            jsr        fix_list
[0001706a] 226a 000c                 movea.l    12(a2),a1
[0001706e] 206b 0020                 movea.l    32(a3),a0
[00017072] 4eb9 0001 7b14            jsr        fix_list
[00017078] 226a 0010                 movea.l    16(a2),a1
[0001707c] 206b 0024                 movea.l    36(a3),a0
[00017080] 4eb9 0001 7b14            jsr        fix_list
[00017086] 226a 0014                 movea.l    20(a2),a1
[0001708a] 206b 0028                 movea.l    40(a3),a0
[0001708e] 4eb9 0001 7b14            jsr        fix_list
[00017094] 226a 0018                 movea.l    24(a2),a1
[00017098] 206b 002c                 movea.l    44(a3),a0
[0001709c] 4eb9 0001 7b14            jsr        fix_list
[000170a2] 226a 001c                 movea.l    28(a2),a1
[000170a6] 206b 0030                 movea.l    48(a3),a0
[000170aa] 4eb9 0001 7b14            jsr        fix_list
[000170b0] 226a 0020                 movea.l    32(a2),a1
[000170b4] 206b 0034                 movea.l    52(a3),a0
[000170b8] 4eb9 0001 7b14            jsr        fix_list
[000170be] 226a 0024                 movea.l    36(a2),a1
[000170c2] 206b 0038                 movea.l    56(a3),a0
[000170c6] 4eb9 0001 7b14            jsr        fix_list
[000170cc] 226a 0028                 movea.l    40(a2),a1
[000170d0] 206b 003c                 movea.l    60(a3),a0
[000170d4] 4eb9 0001 7b14            jsr        fix_list
[000170da] 226a 002c                 movea.l    44(a2),a1
[000170de] 206b 0040                 movea.l    64(a3),a0
[000170e2] 4eb9 0001 7b14            jsr        fix_list
[000170e8] 226a 0030                 movea.l    48(a2),a1
[000170ec] 206b 0044                 movea.l    68(a3),a0
[000170f0] 4eb9 0001 7b14            jsr        fix_list
[000170f6] 4243                      clr.w      d3
[000170f8] 601a                      bra.s      $00017114
[000170fa] 226a 0034                 movea.l    52(a2),a1
[000170fe] 3003                      move.w     d3,d0
[00017100] 48c0                      ext.l      d0
[00017102] e588                      lsl.l      #2,d0
[00017104] 41f3 0800                 lea.l      0(a3,d0.l),a0
[00017108] 2068 01f6                 movea.l    502(a0),a0
[0001710c] 4eb9 0001 7b14            jsr        fix_list
[00017112] 5243                      addq.w     #1,d3
[00017114] b67c 0003                 cmp.w      #$0003,d3
[00017118] 6de0                      blt.s      $000170FA
[0001711a] 4243                      clr.w      d3
[0001711c] 601a                      bra.s      $00017138
[0001711e] 226a 0038                 movea.l    56(a2),a1
[00017122] 3003                      move.w     d3,d0
[00017124] 48c0                      ext.l      d0
[00017126] e588                      lsl.l      #2,d0
[00017128] 41f3 0800                 lea.l      0(a3,d0.l),a0
[0001712c] 2068 0202                 movea.l    514(a0),a0
[00017130] 4eb9 0001 7b14            jsr        fix_list
[00017136] 5243                      addq.w     #1,d3
[00017138] b67c 0003                 cmp.w      #$0003,d3
[0001713c] 6de0                      blt.s      $0001711E
[0001713e] 206b 0014                 movea.l    20(a3),a0
[00017142] 7000                      moveq.l    #0,d0
[00017144] 3028 0008                 move.w     8(a0),d0
[00017148] 2740 0014                 move.l     d0,20(a3)
[0001714c] 206b 0018                 movea.l    24(a3),a0
[00017150] 7200                      moveq.l    #0,d1
[00017152] 3228 0008                 move.w     8(a0),d1
[00017156] 2741 0018                 move.l     d1,24(a3)
[0001715a] 206b 001c                 movea.l    28(a3),a0
[0001715e] 7000                      moveq.l    #0,d0
[00017160] 3028 0008                 move.w     8(a0),d0
[00017164] 2740 001c                 move.l     d0,28(a3)
[00017168] 206b 0020                 movea.l    32(a3),a0
[0001716c] 7200                      moveq.l    #0,d1
[0001716e] 3228 0008                 move.w     8(a0),d1
[00017172] 2741 0020                 move.l     d1,32(a3)
[00017176] 206b 0024                 movea.l    36(a3),a0
[0001717a] 7000                      moveq.l    #0,d0
[0001717c] 3028 0008                 move.w     8(a0),d0
[00017180] 2740 0024                 move.l     d0,36(a3)
[00017184] 206b 0028                 movea.l    40(a3),a0
[00017188] 7200                      moveq.l    #0,d1
[0001718a] 3228 0008                 move.w     8(a0),d1
[0001718e] 2741 0028                 move.l     d1,40(a3)
[00017192] 206b 002c                 movea.l    44(a3),a0
[00017196] 7000                      moveq.l    #0,d0
[00017198] 3028 0008                 move.w     8(a0),d0
[0001719c] 2740 002c                 move.l     d0,44(a3)
[000171a0] 206b 0030                 movea.l    48(a3),a0
[000171a4] 7200                      moveq.l    #0,d1
[000171a6] 3228 0008                 move.w     8(a0),d1
[000171aa] 2741 0030                 move.l     d1,48(a3)
[000171ae] 206b 0034                 movea.l    52(a3),a0
[000171b2] 7000                      moveq.l    #0,d0
[000171b4] 3028 0008                 move.w     8(a0),d0
[000171b8] 2740 0034                 move.l     d0,52(a3)
[000171bc] 206b 0038                 movea.l    56(a3),a0
[000171c0] 7200                      moveq.l    #0,d1
[000171c2] 3228 0008                 move.w     8(a0),d1
[000171c6] 2741 0038                 move.l     d1,56(a3)
[000171ca] 206b 003c                 movea.l    60(a3),a0
[000171ce] 7000                      moveq.l    #0,d0
[000171d0] 3028 0008                 move.w     8(a0),d0
[000171d4] 2740 003c                 move.l     d0,60(a3)
[000171d8] 206b 0040                 movea.l    64(a3),a0
[000171dc] 7200                      moveq.l    #0,d1
[000171de] 3228 0008                 move.w     8(a0),d1
[000171e2] 2741 0040                 move.l     d1,64(a3)
[000171e6] 206b 0044                 movea.l    68(a3),a0
[000171ea] 7000                      moveq.l    #0,d0
[000171ec] 3028 0008                 move.w     8(a0),d0
[000171f0] 2740 0044                 move.l     d0,68(a3)
[000171f4] 41eb 007c                 lea.l      124(a3),a0
[000171f8] 6100 fd92                 bsr        fix_ob
[000171fc] 41eb 0080                 lea.l      128(a3),a0
[00017200] 6100 fd8a                 bsr        fix_ob
[00017204] 49eb 0084                 lea.l      132(a3),a4
[00017208] 761f                      moveq.l    #31,d3
[0001720a] 600c                      bra.s      $00017218
[0001720c] 41ec 0002                 lea.l      2(a4),a0
[00017210] 6100 fd7a                 bsr        fix_ob
[00017214] 5c4c                      addq.w     #6,a4
[00017216] 5343                      subq.w     #1,d3
[00017218] 4a43                      tst.w      d3
[0001721a] 6af0                      bpl.s      $0001720C
[0001721c] 4243                      clr.w      d3
[0001721e] 601a                      bra.s      $0001723A
[00017220] 3003                      move.w     d3,d0
[00017222] 48c0                      ext.l      d0
[00017224] e588                      lsl.l      #2,d0
[00017226] 41f3 0800                 lea.l      0(a3,d0.l),a0
[0001722a] 2268 01f6                 movea.l    502(a0),a1
[0001722e] 7200                      moveq.l    #0,d1
[00017230] 3229 0008                 move.w     8(a1),d1
[00017234] 2141 01f6                 move.l     d1,502(a0)
[00017238] 5243                      addq.w     #1,d3
[0001723a] b67c 0003                 cmp.w      #$0003,d3
[0001723e] 6de0                      blt.s      $00017220
[00017240] 4243                      clr.w      d3
[00017242] 601a                      bra.s      $0001725E
[00017244] 3003                      move.w     d3,d0
[00017246] 48c0                      ext.l      d0
[00017248] e588                      lsl.l      #2,d0
[0001724a] 41f3 0800                 lea.l      0(a3,d0.l),a0
[0001724e] 2268 0202                 movea.l    514(a0),a1
[00017252] 7200                      moveq.l    #0,d1
[00017254] 3229 0008                 move.w     8(a1),d1
[00017258] 2141 0202                 move.l     d1,514(a0)
[0001725c] 5243                      addq.w     #1,d3
[0001725e] b67c 0003                 cmp.w      #$0003,d3
[00017262] 6de0                      blt.s      $00017244
[00017264] 41eb 0214                 lea.l      532(a3),a0
[00017268] 6100 fbc6                 bsr        fix_config
[0001726c] 7001                      moveq.l    #1,d0
[0001726e] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00017272] 4e75                      rts
unfix_all:
[00017274] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00017278] 2848                      movea.l    a0,a4
[0001727a] 47f9 000a 49f8            lea.l      trans,a3
[00017280] 45eb 0044                 lea.l      68(a3),a2
[00017284] 2013                      move.l     (a3),d0
[00017286] 6700 0214                 beq        $0001749C
[0001728a] 322c 0004                 move.w     4(a4),d1
[0001728e] 927c 0064                 sub.w      #$0064,d1
[00017292] 6712                      beq.s      $000172A6
[00017294] 927c 0064                 sub.w      #$0064,d1
[00017298] 6712                      beq.s      $000172AC
[0001729a] 5b41                      subq.w     #5,d1
[0001729c] 670e                      beq.s      $000172AC
[0001729e] 927c 005f                 sub.w      #$005F,d1
[000172a2] 6708                      beq.s      $000172AC
[000172a4] 600a                      bra.s      $000172B0
[000172a6] 45eb 00bc                 lea.l      188(a3),a2
[000172aa] 6004                      bra.s      $000172B0
[000172ac] 45eb 0080                 lea.l      128(a3),a2
[000172b0] 4eb9 0001 7ac6            jsr        unfix_labels
[000172b6] 4243                      clr.w      d3
[000172b8] 6014                      bra.s      $000172CE
[000172ba] 3003                      move.w     d3,d0
[000172bc] 48c0                      ext.l      d0
[000172be] e588                      lsl.l      #2,d0
[000172c0] 41f4 0800                 lea.l      0(a4,d0.l),a0
[000172c4] 41e8 01f6                 lea.l      502(a0),a0
[000172c8] 6100 fcd2                 bsr        unfix_ob
[000172cc] 5243                      addq.w     #1,d3
[000172ce] b67c 0003                 cmp.w      #$0003,d3
[000172d2] 6de6                      blt.s      $000172BA
[000172d4] 4243                      clr.w      d3
[000172d6] 6014                      bra.s      $000172EC
[000172d8] 3003                      move.w     d3,d0
[000172da] 48c0                      ext.l      d0
[000172dc] e588                      lsl.l      #2,d0
[000172de] 41f4 0800                 lea.l      0(a4,d0.l),a0
[000172e2] 41e8 0202                 lea.l      514(a0),a0
[000172e6] 6100 fcb4                 bsr        unfix_ob
[000172ea] 5243                      addq.w     #1,d3
[000172ec] b67c 0003                 cmp.w      #$0003,d3
[000172f0] 6de6                      blt.s      $000172D8
[000172f2] 41ec 0014                 lea.l      20(a4),a0
[000172f6] 6100 fca4                 bsr        unfix_ob
[000172fa] 41ec 0018                 lea.l      24(a4),a0
[000172fe] 6100 fc9c                 bsr        unfix_ob
[00017302] 41ec 001c                 lea.l      28(a4),a0
[00017306] 6100 fc94                 bsr        unfix_ob
[0001730a] 41ec 0020                 lea.l      32(a4),a0
[0001730e] 6100 fc8c                 bsr        unfix_ob
[00017312] 41ec 0028                 lea.l      40(a4),a0
[00017316] 6100 fc84                 bsr        unfix_ob
[0001731a] 41ec 002c                 lea.l      44(a4),a0
[0001731e] 6100 fc7c                 bsr        unfix_ob
[00017322] 41ec 0030                 lea.l      48(a4),a0
[00017326] 6100 fc74                 bsr        unfix_ob
[0001732a] 41ec 0024                 lea.l      36(a4),a0
[0001732e] 6100 fc6c                 bsr        unfix_ob
[00017332] 41ec 0038                 lea.l      56(a4),a0
[00017336] 6100 fc64                 bsr        unfix_ob
[0001733a] 41ec 0034                 lea.l      52(a4),a0
[0001733e] 6100 fc5c                 bsr        unfix_ob
[00017342] 41ec 003c                 lea.l      60(a4),a0
[00017346] 6100 fc54                 bsr        unfix_ob
[0001734a] 41ec 0040                 lea.l      64(a4),a0
[0001734e] 6100 fc4c                 bsr        unfix_ob
[00017352] 41ec 0044                 lea.l      68(a4),a0
[00017356] 6100 fc44                 bsr        unfix_ob
[0001735a] 41ec 007c                 lea.l      124(a4),a0
[0001735e] 6100 fc3c                 bsr        unfix_ob
[00017362] 41ec 0080                 lea.l      128(a4),a0
[00017366] 6100 fc34                 bsr        unfix_ob
[0001736a] 4bec 0084                 lea.l      132(a4),a5
[0001736e] 761f                      moveq.l    #31,d3
[00017370] 600c                      bra.s      $0001737E
[00017372] 41ed 0002                 lea.l      2(a5),a0
[00017376] 6100 fc24                 bsr        unfix_ob
[0001737a] 5c4d                      addq.w     #6,a5
[0001737c] 5343                      subq.w     #1,d3
[0001737e] 4a43                      tst.w      d3
[00017380] 6af0                      bpl.s      $00017372
[00017382] 2252                      movea.l    (a2),a1
[00017384] 206c 0014                 movea.l    20(a4),a0
[00017388] 4eb9 0001 7b5a            jsr        unfix_list
[0001738e] 226a 0004                 movea.l    4(a2),a1
[00017392] 206c 0018                 movea.l    24(a4),a0
[00017396] 4eb9 0001 7b5a            jsr        unfix_list
[0001739c] 226a 0008                 movea.l    8(a2),a1
[000173a0] 206c 001c                 movea.l    28(a4),a0
[000173a4] 4eb9 0001 7b5a            jsr        unfix_list
[000173aa] 226a 000c                 movea.l    12(a2),a1
[000173ae] 206c 0020                 movea.l    32(a4),a0
[000173b2] 4eb9 0001 7b5a            jsr        unfix_list
[000173b8] 226a 0010                 movea.l    16(a2),a1
[000173bc] 206c 0024                 movea.l    36(a4),a0
[000173c0] 4eb9 0001 7b5a            jsr        unfix_list
[000173c6] 226a 0014                 movea.l    20(a2),a1
[000173ca] 206c 0028                 movea.l    40(a4),a0
[000173ce] 4eb9 0001 7b5a            jsr        unfix_list
[000173d4] 226a 0018                 movea.l    24(a2),a1
[000173d8] 206c 002c                 movea.l    44(a4),a0
[000173dc] 4eb9 0001 7b5a            jsr        unfix_list
[000173e2] 226a 001c                 movea.l    28(a2),a1
[000173e6] 206c 0030                 movea.l    48(a4),a0
[000173ea] 4eb9 0001 7b5a            jsr        unfix_list
[000173f0] 226a 0024                 movea.l    36(a2),a1
[000173f4] 206c 0038                 movea.l    56(a4),a0
[000173f8] 4eb9 0001 7b5a            jsr        unfix_list
[000173fe] 226a 0020                 movea.l    32(a2),a1
[00017402] 206c 0034                 movea.l    52(a4),a0
[00017406] 4eb9 0001 7b5a            jsr        unfix_list
[0001740c] 226a 0028                 movea.l    40(a2),a1
[00017410] 206c 003c                 movea.l    60(a4),a0
[00017414] 4eb9 0001 7b5a            jsr        unfix_list
[0001741a] 226a 002c                 movea.l    44(a2),a1
[0001741e] 206c 0040                 movea.l    64(a4),a0
[00017422] 4eb9 0001 7b5a            jsr        unfix_list
[00017428] 226a 0030                 movea.l    48(a2),a1
[0001742c] 206c 0044                 movea.l    68(a4),a0
[00017430] 4eb9 0001 7b5a            jsr        unfix_list
[00017436] 4243                      clr.w      d3
[00017438] 601a                      bra.s      $00017454
[0001743a] 226a 0034                 movea.l    52(a2),a1
[0001743e] 3003                      move.w     d3,d0
[00017440] 48c0                      ext.l      d0
[00017442] e588                      lsl.l      #2,d0
[00017444] 41f4 0800                 lea.l      0(a4,d0.l),a0
[00017448] 2068 01f6                 movea.l    502(a0),a0
[0001744c] 4eb9 0001 7b5a            jsr        unfix_list
[00017452] 5243                      addq.w     #1,d3
[00017454] b67c 0003                 cmp.w      #$0003,d3
[00017458] 6de0                      blt.s      $0001743A
[0001745a] 4243                      clr.w      d3
[0001745c] 601a                      bra.s      $00017478
[0001745e] 226a 0038                 movea.l    56(a2),a1
[00017462] 3003                      move.w     d3,d0
[00017464] 48c0                      ext.l      d0
[00017466] e588                      lsl.l      #2,d0
[00017468] 41f4 0800                 lea.l      0(a4,d0.l),a0
[0001746c] 2068 0202                 movea.l    514(a0),a0
[00017470] 4eb9 0001 7b5a            jsr        unfix_list
[00017476] 5243                      addq.w     #1,d3
[00017478] b67c 0003                 cmp.w      #$0003,d3
[0001747c] 6de0                      blt.s      $0001745E
[0001747e] 2053                      movea.l    (a3),a0
[00017480] 2968 0004 0010            move.l     4(a0),16(a4)
[00017486] 41ec 0214                 lea.l      532(a4),a0
[0001748a] 6100 fa52                 bsr        unfix_config
[0001748e] 2053                      movea.l    (a3),a0
[00017490] 4eb9 0004 c7c8            jsr        Ax_free
[00017496] 4293                      clr.l      (a3)
[00017498] 42ab 0004                 clr.l      4(a3)
[0001749c] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[000174a0] 4e75                      rts
wr_all:
[000174a2] 2f03                      move.l     d3,-(a7)
[000174a4] 2f0a                      move.l     a2,-(a7)
[000174a6] 2448                      movea.l    a0,a2
[000174a8] 7008                      moveq.l    #8,d0
[000174aa] 2279 0010 ee4e            movea.l    ACSblk,a1
[000174b0] 5049                      addq.w     #8,a1
[000174b2] 41ea 0168                 lea.l      360(a2),a0
[000174b6] 4eb9 0008 3500            jsr        memcpy
[000174bc] 203c 0000 0262            move.l     #$00000262,d0
[000174c2] 204a                      movea.l    a2,a0
[000174c4] 4eb9 0001 82d2            jsr        save_buf
[000174ca] 7601                      moveq.l    #1,d3
[000174cc] 3003                      move.w     d3,d0
[000174ce] 48c0                      ext.l      d0
[000174d0] e588                      lsl.l      #2,d0
[000174d2] 2079 000a 49f8            movea.l    trans,a0
[000174d8] 2470 0800                 movea.l    0(a0,d0.l),a2
[000174dc] 204a                      movea.l    a2,a0
[000174de] 7042                      moveq.l    #66,d0
[000174e0] 4eb9 0001 82d2            jsr        save_buf
[000174e6] 202a 000e                 move.l     14(a2),d0
[000174ea] 6f0a                      ble.s      $000174F6
[000174ec] 206a 0004                 movea.l    4(a2),a0
[000174f0] 4eb9 0001 82d2            jsr        save_buf
[000174f6] 5243                      addq.w     #1,d3
[000174f8] 2012                      move.l     (a2),d0
[000174fa] 66d0                      bne.s      $000174CC
[000174fc] 245f                      movea.l    (a7)+,a2
[000174fe] 261f                      move.l     (a7)+,d3
[00017500] 4e75                      rts
rd_all:
[00017502] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[00017506] 2848                      movea.l    a0,a4
[00017508] 263c 0000 2000            move.l     #$00002000,d3
[0001750e] 7006                      moveq.l    #6,d0
[00017510] 4eb9 0001 83c8            jsr        read_buf
[00017516] 0c94 2e41 4353            cmpi.l     #$2E414353,(a4)
[0001751c] 6630                      bne.s      $0001754E
[0001751e] 0c6c 0191 0004            cmpi.w     #$0191,4(a4)
[00017524] 6740                      beq.s      $00017566
[00017526] 0c6c 0190 0004            cmpi.w     #$0190,4(a4)
[0001752c] 6738                      beq.s      $00017566
[0001752e] 0c6c 012c 0004            cmpi.w     #$012C,4(a4)
[00017534] 6730                      beq.s      $00017566
[00017536] 0c6c 00cd 0004            cmpi.w     #$00CD,4(a4)
[0001753c] 6728                      beq.s      $00017566
[0001753e] 0c6c 00c8 0004            cmpi.w     #$00C8,4(a4)
[00017544] 6720                      beq.s      $00017566
[00017546] 0c6c 0064 0004            cmpi.w     #$0064,4(a4)
[0001754c] 6718                      beq.s      $00017566
[0001754e] 41f9 000a 773d            lea.l      ERR_FILETYP,a0
[00017554] 7001                      moveq.l    #1,d0
[00017556] 4eb9 0005 a600            jsr        Awi_alert
[0001755c] 91c8                      suba.l     a0,a0
[0001755e] 4240                      clr.w      d0
[00017560] 4eb9 0001 829c            jsr        assert_error
[00017566] 382c 0004                 move.w     4(a4),d4
[0001756a] 45f9 000a 4af0            lea.l      zero,a2
[00017570] 3004                      move.w     d4,d0
[00017572] b07c 00cd                 cmp.w      #$00CD,d0
[00017576] 6764                      beq.s      $000175DC
[00017578] 6e10                      bgt.s      $0001758A
[0001757a] 907c 0064                 sub.w      #$0064,d0
[0001757e] 671e                      beq.s      $0001759E
[00017580] 907c 0064                 sub.w      #$0064,d0
[00017584] 6756                      beq.s      $000175DC
[00017586] 6000 00fe                 bra        $00017686
[0001758a] 907c 012c                 sub.w      #$012C,d0
[0001758e] 6700 00ac                 beq        $0001763C
[00017592] 907c 0064                 sub.w      #$0064,d0
[00017596] 6700 00ce                 beq        $00017666
[0001759a] 6000 00ea                 bra        $00017686
[0001759e] 7a3a                      moveq.l    #58,d5
[000175a0] 203c 0000 0146            move.l     #$00000146,d0
[000175a6] 41ec 0006                 lea.l      6(a4),a0
[000175aa] 4eb9 0001 83c8            jsr        read_buf
[000175b0] 7008                      moveq.l    #8,d0
[000175b2] 224a                      movea.l    a2,a1
[000175b4] 41ec 014c                 lea.l      332(a4),a0
[000175b8] 4eb9 0008 3500            jsr        memcpy
[000175be] 7008                      moveq.l    #8,d0
[000175c0] 224a                      movea.l    a2,a1
[000175c2] 41ec 0154                 lea.l      340(a4),a0
[000175c6] 4eb9 0008 3500            jsr        memcpy
[000175cc] 7008                      moveq.l    #8,d0
[000175ce] 224a                      movea.l    a2,a1
[000175d0] 41ec 015c                 lea.l      348(a4),a0
[000175d4] 4eb9 0008 3500            jsr        memcpy
[000175da] 6012                      bra.s      $000175EE
[000175dc] 7a42                      moveq.l    #66,d5
[000175de] 203c 0000 015e            move.l     #$0000015E,d0
[000175e4] 41ec 0006                 lea.l      6(a4),a0
[000175e8] 4eb9 0001 83c8            jsr        read_buf
[000175ee] 7008                      moveq.l    #8,d0
[000175f0] 2279 0010 ee4e            movea.l    ACSblk,a1
[000175f6] 5049                      addq.w     #8,a1
[000175f8] 41ec 0168                 lea.l      360(a4),a0
[000175fc] 4eb9 0008 3500            jsr        memcpy
[00017602] 42ac 0170                 clr.l      368(a4)
[00017606] 426c 01f4                 clr.w      500(a4)
[0001760a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00017610] 43e9 02d6                 lea.l      726(a1),a1
[00017614] 41ec 0174                 lea.l      372(a4),a0
[00017618] 4eb9 0008 2f0c            jsr        strcpy
[0001761e] 720c                      moveq.l    #12,d1
[00017620] 4240                      clr.w      d0
[00017622] 41ec 01f6                 lea.l      502(a4),a0
[00017626] 4eb9 0008 36ea            jsr        memset
[0001762c] 720c                      moveq.l    #12,d1
[0001762e] 4240                      clr.w      d0
[00017630] 41ec 0202                 lea.l      514(a4),a0
[00017634] 4eb9 0008 36ea            jsr        memset
[0001763a] 6016                      bra.s      $00017652
[0001763c] 7a42                      moveq.l    #66,d5
[0001763e] 203c 0000 0208            move.l     #$00000208,d0
[00017644] 41ec 0006                 lea.l      6(a4),a0
[00017648] 4eb9 0001 83c8            jsr        read_buf
[0001764e] 262c 0164                 move.l     356(a4),d3
[00017652] 7010                      moveq.l    #16,d0
[00017654] c06c 0006                 and.w      6(a4),d0
[00017658] 6704                      beq.s      $0001765E
[0001765a] 7201                      moveq.l    #1,d1
[0001765c] 6002                      bra.s      $00017660
[0001765e] 4241                      clr.w      d1
[00017660] 3941 020e                 move.w     d1,526(a4)
[00017664] 6042                      bra.s      $000176A8
[00017666] 7a42                      moveq.l    #66,d5
[00017668] 203c 0000 020e            move.l     #$0000020E,d0
[0001766e] 41ec 0006                 lea.l      6(a4),a0
[00017672] 4eb9 0001 83c8            jsr        read_buf
[00017678] 7046                      moveq.l    #70,d0
[0001767a] 41ec 0214                 lea.l      532(a4),a0
[0001767e] 4eb9 0001 83c8            jsr        read_buf
[00017684] 601e                      bra.s      $000176A4
[00017686] 7a42                      moveq.l    #66,d5
[00017688] 203c 0000 020e            move.l     #$0000020E,d0
[0001768e] 41ec 0006                 lea.l      6(a4),a0
[00017692] 4eb9 0001 83c8            jsr        read_buf
[00017698] 704e                      moveq.l    #78,d0
[0001769a] 41ec 0214                 lea.l      532(a4),a0
[0001769e] 4eb9 0001 83c8            jsr        read_buf
[000176a4] 262c 0164                 move.l     356(a4),d3
[000176a8] 7001                      moveq.l    #1,d0
[000176aa] b083                      cmp.l      d3,d0
[000176ac] 6f06                      ble.s      $000176B4
[000176ae] 263c 0000 2000            move.l     #$00002000,d3
[000176b4] 47ea ff08                 lea.l      -248(a2),a3
[000176b8] 2003                      move.l     d3,d0
[000176ba] e588                      lsl.l      #2,d0
[000176bc] 4eb9 0004 c608            jsr        Ax_malloc
[000176c2] 2688                      move.l     a0,(a3)
[000176c4] 2008                      move.l     a0,d0
[000176c6] 660a                      bne.s      $000176D2
[000176c8] 7003                      moveq.l    #3,d0
[000176ca] 91c8                      suba.l     a0,a0
[000176cc] 4eb9 0001 829c            jsr        assert_error
[000176d2] 2543 ff0c                 move.l     d3,-244(a2)
[000176d6] 2203                      move.l     d3,d1
[000176d8] e589                      lsl.l      #2,d1
[000176da] 4240                      clr.w      d0
[000176dc] 2053                      movea.l    (a3),a0
[000176de] 4eb9 0008 36ea            jsr        memset
[000176e4] 7000                      moveq.l    #0,d0
[000176e6] 2940 0148                 move.l     d0,328(a4)
[000176ea] 2940 0144                 move.l     d0,324(a4)
[000176ee] 2940 000c                 move.l     d0,12(a4)
[000176f2] 026c ff9f 0006            andi.w     #$FF9F,6(a4)
[000176f8] 7042                      moveq.l    #66,d0
[000176fa] 4eb9 0004 c608            jsr        Ax_malloc
[00017700] 2848                      movea.l    a0,a4
[00017702] 200c                      move.l     a4,d0
[00017704] 660a                      bne.s      $00017710
[00017706] 7003                      moveq.l    #3,d0
[00017708] 91c8                      suba.l     a0,a0
[0001770a] 4eb9 0001 829c            jsr        assert_error
[00017710] 7008                      moveq.l    #8,d0
[00017712] 224a                      movea.l    a2,a1
[00017714] 41ec 003a                 lea.l      58(a4),a0
[00017718] 4eb9 0008 3500            jsr        memcpy
[0001771e] 3005                      move.w     d5,d0
[00017720] 48c0                      ext.l      d0
[00017722] 204c                      movea.l    a4,a0
[00017724] 4eb9 0001 83c8            jsr        read_buf
[0001772a] 42ac 0004                 clr.l      4(a4)
[0001772e] 42ac 0012                 clr.l      18(a4)
[00017732] 296c 000e 000a            move.l     14(a4),10(a4)
[00017738] b87c 0064                 cmp.w      #$0064,d4
[0001773c] 6606                      bne.s      $00017744
[0001773e] 026c 0100 0038            andi.w     #$0100,56(a4)
[00017744] 7000                      moveq.l    #0,d0
[00017746] 302c 0008                 move.w     8(a4),d0
[0001774a] e588                      lsl.l      #2,d0
[0001774c] 2053                      movea.l    (a3),a0
[0001774e] 218c 0800                 move.l     a4,0(a0,d0.l)
[00017752] 7001                      moveq.l    #1,d0
[00017754] d06c 0008                 add.w      8(a4),d0
[00017758] 7200                      moveq.l    #0,d1
[0001775a] 3200                      move.w     d0,d1
[0001775c] e589                      lsl.l      #2,d1
[0001775e] 2053                      movea.l    (a3),a0
[00017760] 42b0 1800                 clr.l      0(a0,d1.l)
[00017764] 202c 000a                 move.l     10(a4),d0
[00017768] 6f26                      ble.s      $00017790
[0001776a] 4eb9 0004 c608            jsr        Ax_malloc
[00017770] 2a48                      movea.l    a0,a5
[00017772] 200d                      move.l     a5,d0
[00017774] 660a                      bne.s      $00017780
[00017776] 7003                      moveq.l    #3,d0
[00017778] 91c8                      suba.l     a0,a0
[0001777a] 4eb9 0001 829c            jsr        assert_error
[00017780] 202c 000a                 move.l     10(a4),d0
[00017784] 204d                      movea.l    a5,a0
[00017786] 4eb9 0001 83c8            jsr        read_buf
[0001778c] 294d 0004                 move.l     a5,4(a4)
[00017790] 2014                      move.l     (a4),d0
[00017792] 6600 ff64                 bne        $000176F8
[00017796] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[0001779a] 4e75                      rts
fix_window:
[0001779c] 2f0a                      move.l     a2,-(a7)
[0001779e] 2468 0004                 movea.l    4(a0),a2
[000177a2] 204a                      movea.l    a2,a0
[000177a4] 6100 f7e6                 bsr        fix_ob
[000177a8] 41ea 0004                 lea.l      4(a2),a0
[000177ac] 6100 f7de                 bsr        fix_ob
[000177b0] 41ea 0008                 lea.l      8(a2),a0
[000177b4] 6100 f7d6                 bsr        fix_ob
[000177b8] 41ea 000c                 lea.l      12(a2),a0
[000177bc] 6100 f7ce                 bsr        fix_ob
[000177c0] 41ea 0010                 lea.l      16(a2),a0
[000177c4] 6100 f7c6                 bsr        fix_ob
[000177c8] 41ea 0014                 lea.l      20(a2),a0
[000177cc] 6100 f7be                 bsr        fix_ob
[000177d0] 41ea 0018                 lea.l      24(a2),a0
[000177d4] 6100 f7b6                 bsr        fix_ob
[000177d8] 41ea 004a                 lea.l      74(a2),a0
[000177dc] 6100 f7ae                 bsr        fix_ob
[000177e0] 41ea 004e                 lea.l      78(a2),a0
[000177e4] 6100 f7a6                 bsr        fix_ob
[000177e8] 41ea 005a                 lea.l      90(a2),a0
[000177ec] 6100 f79e                 bsr        fix_ob
[000177f0] 41ea 005e                 lea.l      94(a2),a0
[000177f4] 6100 f796                 bsr        fix_ob
[000177f8] 41ea 0062                 lea.l      98(a2),a0
[000177fc] 6100 f78e                 bsr        fix_ob
[00017800] 41ea 0066                 lea.l      102(a2),a0
[00017804] 6100 f786                 bsr        fix_ob
[00017808] 41ea 006a                 lea.l      106(a2),a0
[0001780c] 6100 f77e                 bsr        fix_ob
[00017810] 41ea 006e                 lea.l      110(a2),a0
[00017814] 6100 f776                 bsr        fix_ob
[00017818] 41ea 0072                 lea.l      114(a2),a0
[0001781c] 6100 f76e                 bsr        fix_ob
[00017820] 41ea 0076                 lea.l      118(a2),a0
[00017824] 6100 f766                 bsr        fix_ob
[00017828] 41ea 007a                 lea.l      122(a2),a0
[0001782c] 6100 f75e                 bsr        fix_ob
[00017830] 41ea 007e                 lea.l      126(a2),a0
[00017834] 6100 f756                 bsr        fix_ob
[00017838] 41ea 0082                 lea.l      130(a2),a0
[0001783c] 6100 f74e                 bsr        fix_ob
[00017840] 41ea 0086                 lea.l      134(a2),a0
[00017844] 6100 f746                 bsr        fix_ob
[00017848] 41ea 008a                 lea.l      138(a2),a0
[0001784c] 6100 f73e                 bsr        fix_ob
[00017850] 41ea 008e                 lea.l      142(a2),a0
[00017854] 6100 f736                 bsr        fix_ob
[00017858] 41ea 0092                 lea.l      146(a2),a0
[0001785c] 6100 f72e                 bsr        fix_ob
[00017860] 41ea 0096                 lea.l      150(a2),a0
[00017864] 6100 f726                 bsr        fix_ob
[00017868] 41ea 009a                 lea.l      154(a2),a0
[0001786c] 6100 f71e                 bsr        fix_ob
[00017870] 41ea 009e                 lea.l      158(a2),a0
[00017874] 6100 f716                 bsr        fix_ob
[00017878] 245f                      movea.l    (a7)+,a2
[0001787a] 4e75                      rts
unfix_window:
[0001787c] 2f0a                      move.l     a2,-(a7)
[0001787e] 2468 0004                 movea.l    4(a0),a2
[00017882] 204a                      movea.l    a2,a0
[00017884] 6100 f716                 bsr        unfix_ob
[00017888] 41ea 0004                 lea.l      4(a2),a0
[0001788c] 6100 f70e                 bsr        unfix_ob
[00017890] 41ea 0008                 lea.l      8(a2),a0
[00017894] 6100 f706                 bsr        unfix_ob
[00017898] 41ea 000c                 lea.l      12(a2),a0
[0001789c] 6100 f6fe                 bsr        unfix_ob
[000178a0] 41ea 0010                 lea.l      16(a2),a0
[000178a4] 6100 f6f6                 bsr        unfix_ob
[000178a8] 41ea 0014                 lea.l      20(a2),a0
[000178ac] 6100 f6ee                 bsr        unfix_ob
[000178b0] 41ea 0018                 lea.l      24(a2),a0
[000178b4] 6100 f6e6                 bsr        unfix_ob
[000178b8] 41ea 004a                 lea.l      74(a2),a0
[000178bc] 6100 f6de                 bsr        unfix_ob
[000178c0] 41ea 004e                 lea.l      78(a2),a0
[000178c4] 6100 f6d6                 bsr        unfix_ob
[000178c8] 41ea 005a                 lea.l      90(a2),a0
[000178cc] 6100 f6ce                 bsr        unfix_ob
[000178d0] 41ea 005e                 lea.l      94(a2),a0
[000178d4] 6100 f6c6                 bsr        unfix_ob
[000178d8] 41ea 0062                 lea.l      98(a2),a0
[000178dc] 6100 f6be                 bsr        unfix_ob
[000178e0] 41ea 0066                 lea.l      102(a2),a0
[000178e4] 6100 f6b6                 bsr        unfix_ob
[000178e8] 41ea 006a                 lea.l      106(a2),a0
[000178ec] 6100 f6ae                 bsr        unfix_ob
[000178f0] 41ea 006e                 lea.l      110(a2),a0
[000178f4] 6100 f6a6                 bsr        unfix_ob
[000178f8] 41ea 0072                 lea.l      114(a2),a0
[000178fc] 6100 f69e                 bsr        unfix_ob
[00017900] 41ea 0076                 lea.l      118(a2),a0
[00017904] 6100 f696                 bsr        unfix_ob
[00017908] 41ea 007a                 lea.l      122(a2),a0
[0001790c] 6100 f68e                 bsr        unfix_ob
[00017910] 41ea 007e                 lea.l      126(a2),a0
[00017914] 6100 f686                 bsr        unfix_ob
[00017918] 41ea 0082                 lea.l      130(a2),a0
[0001791c] 6100 f67e                 bsr        unfix_ob
[00017920] 41ea 0086                 lea.l      134(a2),a0
[00017924] 6100 f676                 bsr        unfix_ob
[00017928] 41ea 008a                 lea.l      138(a2),a0
[0001792c] 6100 f66e                 bsr        unfix_ob
[00017930] 41ea 008e                 lea.l      142(a2),a0
[00017934] 6100 f666                 bsr        unfix_ob
[00017938] 41ea 0092                 lea.l      146(a2),a0
[0001793c] 6100 f65e                 bsr        unfix_ob
[00017940] 41ea 0096                 lea.l      150(a2),a0
[00017944] 6100 f656                 bsr        unfix_ob
[00017948] 41ea 009a                 lea.l      154(a2),a0
[0001794c] 6100 f64e                 bsr        unfix_ob
[00017950] 41ea 009e                 lea.l      158(a2),a0
[00017954] 6100 f646                 bsr        unfix_ob
[00017958] 245f                      movea.l    (a7)+,a2
[0001795a] 4e75                      rts
fix_icon:
[0001795c] 2f0a                      move.l     a2,-(a7)
[0001795e] 2468 0004                 movea.l    4(a0),a2
[00017962] 41ea 0008                 lea.l      8(a2),a0
[00017966] 6100 f624                 bsr        fix_ob
[0001796a] 41ea 0028                 lea.l      40(a2),a0
[0001796e] 6100 f61c                 bsr        fix_ob
[00017972] 41ea 002c                 lea.l      44(a2),a0
[00017976] 6100 f614                 bsr        fix_ob
[0001797a] 41ea 0030                 lea.l      48(a2),a0
[0001797e] 6100 f60c                 bsr        fix_ob
[00017982] 41ea 0034                 lea.l      52(a2),a0
[00017986] 6100 f604                 bsr        fix_ob
[0001798a] 41ea 003e                 lea.l      62(a2),a0
[0001798e] 6100 f5fc                 bsr        fix_ob
[00017992] 41ea 0042                 lea.l      66(a2),a0
[00017996] 6100 f5f4                 bsr        fix_ob
[0001799a] 41ea 0046                 lea.l      70(a2),a0
[0001799e] 6100 f5ec                 bsr        fix_ob
[000179a2] 41ea 004a                 lea.l      74(a2),a0
[000179a6] 6100 f5e4                 bsr        fix_ob
[000179aa] 245f                      movea.l    (a7)+,a2
[000179ac] 4e75                      rts
unfix_icon:
[000179ae] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000179b2] 2448                      movea.l    a0,a2
[000179b4] 266a 0004                 movea.l    4(a2),a3
[000179b8] 41eb 0008                 lea.l      8(a3),a0
[000179bc] 6100 f5de                 bsr        unfix_ob
[000179c0] 7052                      moveq.l    #82,d0
[000179c2] b093                      cmp.l      (a3),d0
[000179c4] 6700 0084                 beq        $00017A4A
[000179c8] 7630                      moveq.l    #48,d3
[000179ca] d6aa 000e                 add.l      14(a2),d3
[000179ce] 2003                      move.l     d3,d0
[000179d0] 4eb9 0004 c608            jsr        Ax_malloc
[000179d6] 2848                      movea.l    a0,a4
[000179d8] 200c                      move.l     a4,d0
[000179da] 660a                      bne.s      $000179E6
[000179dc] 7003                      moveq.l    #3,d0
[000179de] 91c8                      suba.l     a0,a0
[000179e0] 4eb9 0001 829c            jsr        assert_error
[000179e6] 7022                      moveq.l    #34,d0
[000179e8] 224b                      movea.l    a3,a1
[000179ea] 204c                      movea.l    a4,a0
[000179ec] 4eb9 0008 3500            jsr        memcpy
[000179f2] 7216                      moveq.l    #22,d1
[000179f4] 4240                      clr.w      d0
[000179f6] 41ec 0026                 lea.l      38(a4),a0
[000179fa] 4eb9 0008 36ea            jsr        memset
[00017a00] 7216                      moveq.l    #22,d1
[00017a02] 4240                      clr.w      d0
[00017a04] 41ec 003c                 lea.l      60(a4),a0
[00017a08] 4eb9 0008 36ea            jsr        memset
[00017a0e] 06ac 0000 0030 0004       addi.l     #$00000030,4(a4)
[00017a16] 0694 0000 0030            addi.l     #$00000030,(a4)
[00017a1c] 42ac 0022                 clr.l      34(a4)
[00017a20] 70de                      moveq.l    #-34,d0
[00017a22] d0aa 000e                 add.l      14(a2),d0
[00017a26] 43eb 0022                 lea.l      34(a3),a1
[00017a2a] 41ec 0052                 lea.l      82(a4),a0
[00017a2e] 4eb9 0008 3500            jsr        memcpy
[00017a34] 204b                      movea.l    a3,a0
[00017a36] 4eb9 0004 c6c8            jsr        Ax_ifree
[00017a3c] 254c 0004                 move.l     a4,4(a2)
[00017a40] 2543 000a                 move.l     d3,10(a2)
[00017a44] 2543 000e                 move.l     d3,14(a2)
[00017a48] 6040                      bra.s      $00017A8A
[00017a4a] 41eb 0028                 lea.l      40(a3),a0
[00017a4e] 6100 f54c                 bsr        unfix_ob
[00017a52] 41eb 002c                 lea.l      44(a3),a0
[00017a56] 6100 f544                 bsr        unfix_ob
[00017a5a] 41eb 0030                 lea.l      48(a3),a0
[00017a5e] 6100 f53c                 bsr        unfix_ob
[00017a62] 41eb 0034                 lea.l      52(a3),a0
[00017a66] 6100 f534                 bsr        unfix_ob
[00017a6a] 41eb 003e                 lea.l      62(a3),a0
[00017a6e] 6100 f52c                 bsr        unfix_ob
[00017a72] 41eb 0042                 lea.l      66(a3),a0
[00017a76] 6100 f524                 bsr        unfix_ob
[00017a7a] 41eb 0046                 lea.l      70(a3),a0
[00017a7e] 6100 f51c                 bsr        unfix_ob
[00017a82] 41eb 004a                 lea.l      74(a3),a0
[00017a86] 6100 f514                 bsr        unfix_ob
[00017a8a] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00017a8e] 4e75                      rts
fix_labels:
[00017a90] 2f0a                      move.l     a2,-(a7)
[00017a92] 2f0b                      move.l     a3,-(a7)
[00017a94] 2648                      movea.l    a0,a3
[00017a96] 45f9 000e 772a            lea.l      used,a2
[00017a9c] 34bc 0001                 move.w     #$0001,(a2)
[00017aa0] 601a                      bra.s      $00017ABC
[00017aa2] 3012                      move.w     (a2),d0
[00017aa4] 48c0                      ext.l      d0
[00017aa6] e588                      lsl.l      #2,d0
[00017aa8] 2079 000a 49f8            movea.l    trans,a0
[00017aae] 218b 0800                 move.l     a3,0(a0,d0.l)
[00017ab2] 3752 0008                 move.w     (a2),8(a3)
[00017ab6] 2653                      movea.l    (a3),a3
[00017ab8] 6100 f4f6                 bsr        next_trans
[00017abc] 200b                      move.l     a3,d0
[00017abe] 66e2                      bne.s      $00017AA2
[00017ac0] 265f                      movea.l    (a7)+,a3
[00017ac2] 245f                      movea.l    (a7)+,a2
[00017ac4] 4e75                      rts
unfix_labels:
[00017ac6] 2f0a                      move.l     a2,-(a7)
[00017ac8] 2f0b                      move.l     a3,-(a7)
[00017aca] 41f9 000a 49f8            lea.l      trans,a0
[00017ad0] 2250                      movea.l    (a0),a1
[00017ad2] 4291                      clr.l      (a1)
[00017ad4] 7201                      moveq.l    #1,d1
[00017ad6] 7002                      moveq.l    #2,d0
[00017ad8] 45e8 0004                 lea.l      4(a0),a2
[00017adc] 6028                      bra.s      $00017B06
[00017ade] 3401                      move.w     d1,d2
[00017ae0] 48c2                      ext.l      d2
[00017ae2] e58a                      lsl.l      #2,d2
[00017ae4] 2250                      movea.l    (a0),a1
[00017ae6] 2271 2800                 movea.l    0(a1,d2.l),a1
[00017aea] 2409                      move.l     a1,d2
[00017aec] 6714                      beq.s      $00017B02
[00017aee] 3400                      move.w     d0,d2
[00017af0] 48c2                      ext.l      d2
[00017af2] b492                      cmp.l      (a2),d2
[00017af4] 6c0a                      bge.s      $00017B00
[00017af6] e58a                      lsl.l      #2,d2
[00017af8] 2650                      movea.l    (a0),a3
[00017afa] 22b3 2800                 move.l     0(a3,d2.l),(a1)
[00017afe] 6002                      bra.s      $00017B02
[00017b00] 4291                      clr.l      (a1)
[00017b02] 5241                      addq.w     #1,d1
[00017b04] 5240                      addq.w     #1,d0
[00017b06] 3401                      move.w     d1,d2
[00017b08] 48c2                      ext.l      d2
[00017b0a] b492                      cmp.l      (a2),d2
[00017b0c] 6dd0                      blt.s      $00017ADE
[00017b0e] 265f                      movea.l    (a7)+,a3
[00017b10] 245f                      movea.l    (a7)+,a2
[00017b12] 4e75                      rts
fix_list:
[00017b14] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[00017b18] 2849                      movea.l    a1,a4
[00017b1a] 2028 000e                 move.l     14(a0),d0
[00017b1e] 6f34                      ble.s      $00017B54
[00017b20] 2468 0004                 movea.l    4(a0),a2
[00017b24] 2600                      move.l     d0,d3
[00017b26] e48b                      lsr.l      #2,d3
[00017b28] 4244                      clr.w      d4
[00017b2a] 6024                      bra.s      $00017B50
[00017b2c] 3004                      move.w     d4,d0
[00017b2e] 48c0                      ext.l      d0
[00017b30] e588                      lsl.l      #2,d0
[00017b32] 2672 0800                 movea.l    0(a2,d0.l),a3
[00017b36] 220c                      move.l     a4,d1
[00017b38] 6704                      beq.s      $00017B3E
[00017b3a] 204b                      movea.l    a3,a0
[00017b3c] 4e94                      jsr        (a4)
[00017b3e] 7000                      moveq.l    #0,d0
[00017b40] 302b 0008                 move.w     8(a3),d0
[00017b44] 3204                      move.w     d4,d1
[00017b46] 48c1                      ext.l      d1
[00017b48] e589                      lsl.l      #2,d1
[00017b4a] 2580 1800                 move.l     d0,0(a2,d1.l)
[00017b4e] 5244                      addq.w     #1,d4
[00017b50] b644                      cmp.w      d4,d3
[00017b52] 6ed8                      bgt.s      $00017B2C
[00017b54] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[00017b58] 4e75                      rts
unfix_list:
[00017b5a] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[00017b5e] 2849                      movea.l    a1,a4
[00017b60] 2008                      move.l     a0,d0
[00017b62] 6740                      beq.s      $00017BA4
[00017b64] 2228 000e                 move.l     14(a0),d1
[00017b68] 6f3a                      ble.s      $00017BA4
[00017b6a] 2468 0004                 movea.l    4(a0),a2
[00017b6e] 2601                      move.l     d1,d3
[00017b70] e48b                      lsr.l      #2,d3
[00017b72] 4244                      clr.w      d4
[00017b74] 602a                      bra.s      $00017BA0
[00017b76] 3004                      move.w     d4,d0
[00017b78] 48c0                      ext.l      d0
[00017b7a] e588                      lsl.l      #2,d0
[00017b7c] 2232 0800                 move.l     0(a2,d0.l),d1
[00017b80] e589                      lsl.l      #2,d1
[00017b82] 2079 000a 49f8            movea.l    trans,a0
[00017b88] 2670 1800                 movea.l    0(a0,d1.l),a3
[00017b8c] 240c                      move.l     a4,d2
[00017b8e] 6704                      beq.s      $00017B94
[00017b90] 204b                      movea.l    a3,a0
[00017b92] 4e94                      jsr        (a4)
[00017b94] 3004                      move.w     d4,d0
[00017b96] 48c0                      ext.l      d0
[00017b98] e588                      lsl.l      #2,d0
[00017b9a] 258b 0800                 move.l     a3,0(a2,d0.l)
[00017b9e] 5244                      addq.w     #1,d4
[00017ba0] b644                      cmp.w      d4,d3
[00017ba2] 6ed2                      bgt.s      $00017B76
[00017ba4] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[00017ba8] 4e75                      rts
fix_object:
[00017baa] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[00017bae] 2648                      movea.l    a0,a3
[00017bb0] 246b 0004                 movea.l    4(a3),a2
[00017bb4] 202b 000e                 move.l     14(a3),d0
[00017bb8] 7238                      moveq.l    #56,d1
[00017bba] 4eb9 0008 3c5a            jsr        _uldiv
[00017bc0] 2600                      move.l     d0,d3
[00017bc2] 4244                      clr.w      d4
[00017bc4] 47f9 000a 7836            lea.l      ERR_TYPE,a3
[00017bca] 6000 007e                 bra.w      $00017C4A
[00017bce] 204a                      movea.l    a2,a0
[00017bd0] 6100 f3ba                 bsr        fix_ob
[00017bd4] 41ea 0004                 lea.l      4(a2),a0
[00017bd8] 6100 f3b2                 bsr        fix_ob
[00017bdc] 102a 000f                 move.b     15(a2),d0
[00017be0] 4880                      ext.w      d0
[00017be2] 907c 0014                 sub.w      #$0014,d0
[00017be6] b07c 000c                 cmp.w      #$000C,d0
[00017bea] 622e                      bhi.s      $00017C1A
[00017bec] d040                      add.w      d0,d0
[00017bee] 303b 0006                 move.w     $00017BF6(pc,d0.w),d0
[00017bf2] 4efb 0002                 jmp        $00017BF6(pc,d0.w)
J1:
[00017bf6] 002e                      dc.w $002e   ; $00017c24-$00017bf6
[00017bf8] 001a                      dc.w $001a   ; $00017c10-$00017bf6
[00017bfa] 001a                      dc.w $001a   ; $00017c10-$00017bf6
[00017bfc] 001a                      dc.w $001a   ; $00017c10-$00017bf6
[00017bfe] 001a                      dc.w $001a   ; $00017c10-$00017bf6
[00017c00] 002e                      dc.w $002e   ; $00017c24-$00017bf6
[00017c02] 001a                      dc.w $001a   ; $00017c10-$00017bf6
[00017c04] 002e                      dc.w $002e   ; $00017c24-$00017bf6
[00017c06] 001a                      dc.w $001a   ; $00017c10-$00017bf6
[00017c08] 001a                      dc.w $001a   ; $00017c10-$00017bf6
[00017c0a] 001a                      dc.w $001a   ; $00017c10-$00017bf6
[00017c0c] 001a                      dc.w $001a   ; $00017c10-$00017bf6
[00017c0e] 001a                      dc.w $001a   ; $00017c10-$00017bf6
[00017c10] 41ea 0014                 lea.l      20(a2),a0
[00017c14] 6100 f376                 bsr        fix_ob
[00017c18] 600a                      bra.s      $00017C24
[00017c1a] 204b                      movea.l    a3,a0
[00017c1c] 7001                      moveq.l    #1,d0
[00017c1e] 4eb9 0005 a600            jsr        Awi_alert
[00017c24] 41ea 0020                 lea.l      32(a2),a0
[00017c28] 6100 f362                 bsr        fix_ob
[00017c2c] 41ea 0024                 lea.l      36(a2),a0
[00017c30] 6100 f35a                 bsr        fix_ob
[00017c34] 41ea 002c                 lea.l      44(a2),a0
[00017c38] 6100 f352                 bsr        fix_ob
[00017c3c] 41ea 0030                 lea.l      48(a2),a0
[00017c40] 6100 f34a                 bsr        fix_ob
[00017c44] 45ea 0038                 lea.l      56(a2),a2
[00017c48] 5244                      addq.w     #1,d4
[00017c4a] b644                      cmp.w      d4,d3
[00017c4c] 6e00 ff80                 bgt.w      $00017BCE
[00017c50] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[00017c54] 4e75                      rts
unfix_object:
[00017c56] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[00017c5a] 2648                      movea.l    a0,a3
[00017c5c] 246b 0004                 movea.l    4(a3),a2
[00017c60] 202b 000e                 move.l     14(a3),d0
[00017c64] 7238                      moveq.l    #56,d1
[00017c66] 4eb9 0008 3c5a            jsr        _uldiv
[00017c6c] 2600                      move.l     d0,d3
[00017c6e] 4244                      clr.w      d4
[00017c70] 47f9 000a 7836            lea.l      ERR_TYPE,a3
[00017c76] 6000 007e                 bra.w      $00017CF6
[00017c7a] 204a                      movea.l    a2,a0
[00017c7c] 6100 f31e                 bsr        unfix_ob
[00017c80] 41ea 0004                 lea.l      4(a2),a0
[00017c84] 6100 f316                 bsr        unfix_ob
[00017c88] 102a 000f                 move.b     15(a2),d0
[00017c8c] 4880                      ext.w      d0
[00017c8e] 907c 0014                 sub.w      #$0014,d0
[00017c92] b07c 000c                 cmp.w      #$000C,d0
[00017c96] 622e                      bhi.s      $00017CC6
[00017c98] d040                      add.w      d0,d0
[00017c9a] 303b 0006                 move.w     $00017CA2(pc,d0.w),d0
[00017c9e] 4efb 0002                 jmp        $00017CA2(pc,d0.w)
J2:
[00017ca2] 002e                      dc.w $002e   ; $00017cd0-$00017ca2
[00017ca4] 001a                      dc.w $001a   ; $00017cbc-$00017ca2
[00017ca6] 001a                      dc.w $001a   ; $00017cbc-$00017ca2
[00017ca8] 001a                      dc.w $001a   ; $00017cbc-$00017ca2
[00017caa] 001a                      dc.w $001a   ; $00017cbc-$00017ca2
[00017cac] 002e                      dc.w $002e   ; $00017cd0-$00017ca2
[00017cae] 001a                      dc.w $001a   ; $00017cbc-$00017ca2
[00017cb0] 002e                      dc.w $002e   ; $00017cd0-$00017ca2
[00017cb2] 001a                      dc.w $001a   ; $00017cbc-$00017ca2
[00017cb4] 001a                      dc.w $001a   ; $00017cbc-$00017ca2
[00017cb6] 001a                      dc.w $001a   ; $00017cbc-$00017ca2
[00017cb8] 001a                      dc.w $001a   ; $00017cbc-$00017ca2
[00017cba] 001a                      dc.w $001a   ; $00017cbc-$00017ca2
[00017cbc] 41ea 0014                 lea.l      20(a2),a0
[00017cc0] 6100 f2da                 bsr        unfix_ob
[00017cc4] 600a                      bra.s      $00017CD0
[00017cc6] 204b                      movea.l    a3,a0
[00017cc8] 7001                      moveq.l    #1,d0
[00017cca] 4eb9 0005 a600            jsr        Awi_alert
[00017cd0] 41ea 0020                 lea.l      32(a2),a0
[00017cd4] 6100 f2c6                 bsr        unfix_ob
[00017cd8] 41ea 0024                 lea.l      36(a2),a0
[00017cdc] 6100 f2be                 bsr        unfix_ob
[00017ce0] 41ea 002c                 lea.l      44(a2),a0
[00017ce4] 6100 f2b6                 bsr        unfix_ob
[00017ce8] 41ea 0030                 lea.l      48(a2),a0
[00017cec] 6100 f2ae                 bsr        unfix_ob
[00017cf0] 45ea 0038                 lea.l      56(a2),a2
[00017cf4] 5244                      addq.w     #1,d4
[00017cf6] b644                      cmp.w      d4,d3
[00017cf8] 6e00 ff80                 bgt.w      $00017C7A
[00017cfc] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[00017d00] 4e75                      rts
fix_tedinfo:
[00017d02] 2f0a                      move.l     a2,-(a7)
[00017d04] 2468 0004                 movea.l    4(a0),a2
[00017d08] 204a                      movea.l    a2,a0
[00017d0a] 6100 f280                 bsr        fix_ob
[00017d0e] 41ea 0004                 lea.l      4(a2),a0
[00017d12] 6100 f278                 bsr        fix_ob
[00017d16] 41ea 0008                 lea.l      8(a2),a0
[00017d1a] 6100 f270                 bsr        fix_ob
[00017d1e] 245f                      movea.l    (a7)+,a2
[00017d20] 4e75                      rts
unfix_tedinfo:
[00017d22] 2f0a                      move.l     a2,-(a7)
[00017d24] 2468 0004                 movea.l    4(a0),a2
[00017d28] 204a                      movea.l    a2,a0
[00017d2a] 6100 f270                 bsr        unfix_ob
[00017d2e] 41ea 0004                 lea.l      4(a2),a0
[00017d32] 6100 f268                 bsr        unfix_ob
[00017d36] 41ea 0008                 lea.l      8(a2),a0
[00017d3a] 6100 f260                 bsr        unfix_ob
[00017d3e] 245f                      movea.l    (a7)+,a2
[00017d40] 4e75                      rts
fix_user:
[00017d42] 2f0a                      move.l     a2,-(a7)
[00017d44] 2468 0004                 movea.l    4(a0),a2
[00017d48] 204a                      movea.l    a2,a0
[00017d4a] 6100 f240                 bsr        fix_ob
[00017d4e] 41ea 0004                 lea.l      4(a2),a0
[00017d52] 6100 f238                 bsr        fix_ob
[00017d56] 41ea 0008                 lea.l      8(a2),a0
[00017d5a] 6100 f230                 bsr        fix_ob
[00017d5e] 41ea 000c                 lea.l      12(a2),a0
[00017d62] 6100 f228                 bsr        fix_ob
[00017d66] 41ea 0010                 lea.l      16(a2),a0
[00017d6a] 6100 f220                 bsr        fix_ob
[00017d6e] 41ea 0014                 lea.l      20(a2),a0
[00017d72] 6100 f218                 bsr        fix_ob
[00017d76] 41ea 0018                 lea.l      24(a2),a0
[00017d7a] 6100 f210                 bsr        fix_ob
[00017d7e] 41ea 001c                 lea.l      28(a2),a0
[00017d82] 6100 f208                 bsr        fix_ob
[00017d86] 245f                      movea.l    (a7)+,a2
[00017d88] 4e75                      rts
unfix_user:
[00017d8a] 2f0a                      move.l     a2,-(a7)
[00017d8c] 2468 0004                 movea.l    4(a0),a2
[00017d90] 204a                      movea.l    a2,a0
[00017d92] 6100 f208                 bsr        unfix_ob
[00017d96] 41ea 0004                 lea.l      4(a2),a0
[00017d9a] 6100 f200                 bsr        unfix_ob
[00017d9e] 41ea 0008                 lea.l      8(a2),a0
[00017da2] 6100 f1f8                 bsr        unfix_ob
[00017da6] 41ea 000c                 lea.l      12(a2),a0
[00017daa] 6100 f1f0                 bsr        unfix_ob
[00017dae] 41ea 0010                 lea.l      16(a2),a0
[00017db2] 6100 f1e8                 bsr        unfix_ob
[00017db6] 41ea 0014                 lea.l      20(a2),a0
[00017dba] 6100 f1e0                 bsr        unfix_ob
[00017dbe] 41ea 0018                 lea.l      24(a2),a0
[00017dc2] 6100 f1d8                 bsr        unfix_ob
[00017dc6] 41ea 001c                 lea.l      28(a2),a0
[00017dca] 6100 f1d0                 bsr        unfix_ob
[00017dce] 245f                      movea.l    (a7)+,a2
[00017dd0] 4e75                      rts
unfix_window2:
[00017dd2] 48e7 0038                 movem.l    a2-a4,-(a7)
[00017dd6] 2448                      movea.l    a0,a2
[00017dd8] 266a 0004                 movea.l    4(a2),a3
[00017ddc] 203c 0000 00a2            move.l     #$000000A2,d0
[00017de2] 4eb9 0004 c608            jsr        Ax_malloc
[00017de8] 2848                      movea.l    a0,a4
[00017dea] 200c                      move.l     a4,d0
[00017dec] 660a                      bne.s      $00017DF8
[00017dee] 7003                      moveq.l    #3,d0
[00017df0] 91c8                      suba.l     a0,a0
[00017df2] 4eb9 0001 829c            jsr        assert_error
[00017df8] 224c                      movea.l    a4,a1
[00017dfa] 204b                      movea.l    a3,a0
[00017dfc] 6100 efb4                 bsr        ConvertWindowV2x
[00017e00] 204b                      movea.l    a3,a0
[00017e02] 4eb9 0004 c6c8            jsr        Ax_ifree
[00017e08] 254c 0004                 move.l     a4,4(a2)
[00017e0c] 203c 0000 00a2            move.l     #$000000A2,d0
[00017e12] 2540 000a                 move.l     d0,10(a2)
[00017e16] 2540 000e                 move.l     d0,14(a2)
[00017e1a] 204a                      movea.l    a2,a0
[00017e1c] 6100 fa5e                 bsr        unfix_window
[00017e20] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00017e24] 4e75                      rts
unfix_user1:
[00017e26] 48e7 0038                 movem.l    a2-a4,-(a7)
[00017e2a] 2448                      movea.l    a0,a2
[00017e2c] 266a 0004                 movea.l    4(a2),a3
[00017e30] 7020                      moveq.l    #32,d0
[00017e32] 4eb9 0004 c608            jsr        Ax_malloc
[00017e38] 2848                      movea.l    a0,a4
[00017e3a] 200c                      move.l     a4,d0
[00017e3c] 660a                      bne.s      $00017E48
[00017e3e] 7003                      moveq.l    #3,d0
[00017e40] 91c8                      suba.l     a0,a0
[00017e42] 4eb9 0001 829c            jsr        assert_error
[00017e48] 224c                      movea.l    a4,a1
[00017e4a] 204b                      movea.l    a3,a0
[00017e4c] 6100 ef96                 bsr        ConvertUserV1x
[00017e50] 204b                      movea.l    a3,a0
[00017e52] 4eb9 0004 c6c8            jsr        Ax_ifree
[00017e58] 254c 0004                 move.l     a4,4(a2)
[00017e5c] 7020                      moveq.l    #32,d0
[00017e5e] 2540 000a                 move.l     d0,10(a2)
[00017e62] 2540 000e                 move.l     d0,14(a2)
[00017e66] 426a 0038                 clr.w      56(a2)
[00017e6a] 204a                      movea.l    a2,a0
[00017e6c] 6100 ff1c                 bsr        unfix_user
[00017e70] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00017e74] 4e75                      rts
unfix_user2:
[00017e76] 48e7 0038                 movem.l    a2-a4,-(a7)
[00017e7a] 2448                      movea.l    a0,a2
[00017e7c] 266a 0004                 movea.l    4(a2),a3
[00017e80] 7020                      moveq.l    #32,d0
[00017e82] 4eb9 0004 c608            jsr        Ax_malloc
[00017e88] 2848                      movea.l    a0,a4
[00017e8a] 200c                      move.l     a4,d0
[00017e8c] 660a                      bne.s      $00017E98
[00017e8e] 7003                      moveq.l    #3,d0
[00017e90] 91c8                      suba.l     a0,a0
[00017e92] 4eb9 0001 829c            jsr        assert_error
[00017e98] 224c                      movea.l    a4,a1
[00017e9a] 204b                      movea.l    a3,a0
[00017e9c] 6100 ef68                 bsr        ConvertUserV2x
[00017ea0] 204b                      movea.l    a3,a0
[00017ea2] 4eb9 0004 c6c8            jsr        Ax_ifree
[00017ea8] 254c 0004                 move.l     a4,4(a2)
[00017eac] 7020                      moveq.l    #32,d0
[00017eae] 2540 000a                 move.l     d0,10(a2)
[00017eb2] 2540 000e                 move.l     d0,14(a2)
[00017eb6] 204a                      movea.l    a2,a0
[00017eb8] 6100 fed0                 bsr        unfix_user
[00017ebc] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00017ec0] 4e75                      rts
release_err:
[00017ec2] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00017ec6] 45f9 000a 49f8            lea.l      trans,a2
[00017ecc] 2012                      move.l     (a2),d0
[00017ece] 6740                      beq.s      $00017F10
[00017ed0] 7601                      moveq.l    #1,d3
[00017ed2] 6024                      bra.s      $00017EF8
[00017ed4] 3003                      move.w     d3,d0
[00017ed6] 48c0                      ext.l      d0
[00017ed8] e588                      lsl.l      #2,d0
[00017eda] 2052                      movea.l    (a2),a0
[00017edc] 2670 0800                 movea.l    0(a0,d0.l),a3
[00017ee0] 220b                      move.l     a3,d1
[00017ee2] 671e                      beq.s      $00017F02
[00017ee4] 206b 0004                 movea.l    4(a3),a0
[00017ee8] 4eb9 0004 c6c8            jsr        Ax_ifree
[00017eee] 204b                      movea.l    a3,a0
[00017ef0] 4eb9 0004 c6c8            jsr        Ax_ifree
[00017ef6] 5243                      addq.w     #1,d3
[00017ef8] 3003                      move.w     d3,d0
[00017efa] 48c0                      ext.l      d0
[00017efc] b0aa 0004                 cmp.l      4(a2),d0
[00017f00] 6dd2                      blt.s      $00017ED4
[00017f02] 2052                      movea.l    (a2),a0
[00017f04] 4eb9 0004 c7c8            jsr        Ax_free
[00017f0a] 4292                      clr.l      (a2)
[00017f0c] 42aa 0004                 clr.l      4(a2)
[00017f10] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00017f14] 4e75                      rts
free_acs:
[00017f16] 48e7 0038                 movem.l    a2-a4,-(a7)
[00017f1a] 2448                      movea.l    a0,a2
[00017f1c] 266a 0010                 movea.l    16(a2),a3
[00017f20] 6018                      bra.s      $00017F3A
[00017f22] 2853                      movea.l    (a3),a4
[00017f24] 206b 0004                 movea.l    4(a3),a0
[00017f28] 4eb9 0004 c6c8            jsr        Ax_ifree
[00017f2e] 7042                      moveq.l    #66,d0
[00017f30] 204b                      movea.l    a3,a0
[00017f32] 4eb9 0004 cc28            jsr        Ax_recycle
[00017f38] 264c                      movea.l    a4,a3
[00017f3a] 200b                      move.l     a3,d0
[00017f3c] 66e4                      bne.s      $00017F22
[00017f3e] 204a                      movea.l    a2,a0
[00017f40] 203c 0000 0262            move.l     #$00000262,d0
[00017f46] 4eb9 0004 cc28            jsr        Ax_recycle
[00017f4c] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00017f50] 4e75                      rts
objfree:
[00017f52] 48e7 0038                 movem.l    a2-a4,-(a7)
[00017f56] 2849                      movea.l    a1,a4
[00017f58] 0068 0001 0006            ori.w      #$0001,6(a0)
[00017f5e] 45e8 0010                 lea.l      16(a0),a2
[00017f62] 6016                      bra.s      $00017F7A
[00017f64] 200b                      move.l     a3,d0
[00017f66] 6610                      bne.s      $00017F78
[00017f68] 41f9 000a 770a            lea.l      A_MISSENTRY,a0
[00017f6e] 7001                      moveq.l    #1,d0
[00017f70] 4eb9 0005 a600            jsr        Awi_alert
[00017f76] 6030                      bra.s      $00017FA8
[00017f78] 244b                      movea.l    a3,a2
[00017f7a] 2652                      movea.l    (a2),a3
[00017f7c] b9cb                      cmpa.l     a3,a4
[00017f7e] 66e4                      bne.s      $00017F64
[00017f80] 2494                      move.l     (a4),(a2)
[00017f82] 202c 0012                 move.l     18(a4),d0
[00017f86] 670e                      beq.s      $00017F96
[00017f88] 93c9                      suba.l     a1,a1
[00017f8a] 2040                      movea.l    d0,a0
[00017f8c] 2440                      movea.l    d0,a2
[00017f8e] 246a 0004                 movea.l    4(a2),a2
[00017f92] 7002                      moveq.l    #2,d0
[00017f94] 4e92                      jsr        (a2)
[00017f96] 206c 0004                 movea.l    4(a4),a0
[00017f9a] 4eb9 0004 c7c8            jsr        Ax_free
[00017fa0] 204c                      movea.l    a4,a0
[00017fa2] 4eb9 0004 c7c8            jsr        Ax_free
[00017fa8] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00017fac] 4e75                      rts
objmalloc:
[00017fae] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00017fb2] 2848                      movea.l    a0,a4
[00017fb4] 2600                      move.l     d0,d3
[00017fb6] 4a80                      tst.l      d0
[00017fb8] 6f18                      ble.s      $00017FD2
[00017fba] 4eb9 0004 c608            jsr        Ax_malloc
[00017fc0] 2448                      movea.l    a0,a2
[00017fc2] 200a                      move.l     a2,d0
[00017fc4] 6724                      beq.s      $00017FEA
[00017fc6] 2203                      move.l     d3,d1
[00017fc8] 4240                      clr.w      d0
[00017fca] 4eb9 0008 36ea            jsr        memset
[00017fd0] 6002                      bra.s      $00017FD4
[00017fd2] 95ca                      suba.l     a2,a2
[00017fd4] 7042                      moveq.l    #66,d0
[00017fd6] 4eb9 0004 c608            jsr        Ax_malloc
[00017fdc] 2648                      movea.l    a0,a3
[00017fde] 200b                      move.l     a3,d0
[00017fe0] 660c                      bne.s      $00017FEE
[00017fe2] 204a                      movea.l    a2,a0
[00017fe4] 4eb9 0004 c7c8            jsr        Ax_free
[00017fea] 91c8                      suba.l     a0,a0
[00017fec] 6034                      bra.s      $00018022
[00017fee] 7242                      moveq.l    #66,d1
[00017ff0] 4240                      clr.w      d0
[00017ff2] 204b                      movea.l    a3,a0
[00017ff4] 4eb9 0008 36ea            jsr        memset
[00017ffa] 302c 0006                 move.w     6(a4),d0
[00017ffe] c07c 1000                 and.w      #$1000,d0
[00018002] 6706                      beq.s      $0001800A
[00018004] 006b 0400 0038            ori.w      #$0400,56(a3)
[0001800a] 274a 0004                 move.l     a2,4(a3)
[0001800e] 377c 0001 0036            move.w     #$0001,54(a3)
[00018014] 26ac 0010                 move.l     16(a4),(a3)
[00018018] 294b 0010                 move.l     a3,16(a4)
[0001801c] 2743 000a                 move.l     d3,10(a3)
[00018020] 204b                      movea.l    a3,a0
[00018022] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00018026] 4e75                      rts
objextent:
[00018028] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0001802c] 2448                      movea.l    a0,a2
[0001802e] 2600                      move.l     d0,d3
[00018030] 222a 000e                 move.l     14(a2),d1
[00018034] d280                      add.l      d0,d1
[00018036] b2aa 000a                 cmp.l      10(a2),d1
[0001803a] 6f42                      ble.s      $0001807E
[0001803c] eb88                      lsl.l      #5,d0
[0001803e] d0aa 000a                 add.l      10(a2),d0
[00018042] 4eb9 0004 c608            jsr        Ax_malloc
[00018048] 2648                      movea.l    a0,a3
[0001804a] 200b                      move.l     a3,d0
[0001804c] 6604                      bne.s      $00018052
[0001804e] 70ff                      moveq.l    #-1,d0
[00018050] 602e                      bra.s      $00018080
[00018052] 202a 0004                 move.l     4(a2),d0
[00018056] 671a                      beq.s      $00018072
[00018058] 202a 000a                 move.l     10(a2),d0
[0001805c] 226a 0004                 movea.l    4(a2),a1
[00018060] 204b                      movea.l    a3,a0
[00018062] 4eb9 0008 3500            jsr        memcpy
[00018068] 206a 0004                 movea.l    4(a2),a0
[0001806c] 4eb9 0004 c7c8            jsr        Ax_free
[00018072] 2003                      move.l     d3,d0
[00018074] eb88                      lsl.l      #5,d0
[00018076] d1aa 000a                 add.l      d0,10(a2)
[0001807a] 254b 0004                 move.l     a3,4(a2)
[0001807e] 4240                      clr.w      d0
[00018080] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00018084] 4e75                      rts
makeformat:
[00018086] 48e7 1820                 movem.l    d3-d4/a2,-(a7)
[0001808a] 2448                      movea.l    a0,a2
[0001808c] 4243                      clr.w      d3
[0001808e] 3003                      move.w     d3,d0
[00018090] 4eb9 0008 2e8a            jsr        strchr
[00018096] 2448                      movea.l    a0,a2
[00018098] 6002                      bra.s      $0001809C
[0001809a] 5243                      addq.w     #1,d3
[0001809c] 1022                      move.b     -(a2),d0
[0001809e] 4880                      ext.w      d0
[000180a0] 4eb9 0008 37ce            jsr        isdigit
[000180a6] 4a40                      tst.w      d0
[000180a8] 6706                      beq.s      $000180B0
[000180aa] b67c 0004                 cmp.w      #$0004,d3
[000180ae] 6dea                      blt.s      $0001809A
[000180b0] 524a                      addq.w     #1,a2
[000180b2] 4a43                      tst.w      d3
[000180b4] 6f34                      ble.s      $000180EA
[000180b6] 204a                      movea.l    a2,a0
[000180b8] 4244                      clr.w      d4
[000180ba] 6014                      bra.s      $000180D0
[000180bc] 3004                      move.w     d4,d0
[000180be] e548                      lsl.w      #2,d0
[000180c0] d044                      add.w      d4,d0
[000180c2] d040                      add.w      d0,d0
[000180c4] 1218                      move.b     (a0)+,d1
[000180c6] 4881                      ext.w      d1
[000180c8] d041                      add.w      d1,d0
[000180ca] d07c ffd0                 add.w      #$FFD0,d0
[000180ce] 3800                      move.w     d0,d4
[000180d0] 1010                      move.b     (a0),d0
[000180d2] 66e8                      bne.s      $000180BC
[000180d4] 43f9 000a 4af8            lea.l      $000A4AF8,a1
[000180da] 204a                      movea.l    a2,a0
[000180dc] 4eb9 0008 2f0c            jsr        strcpy
[000180e2] d72a 0002                 add.b      d3,2(a2)
[000180e6] 3004                      move.w     d4,d0
[000180e8] 6002                      bra.s      $000180EC
[000180ea] 70ff                      moveq.l    #-1,d0
[000180ec] 4cdf 0418                 movem.l    (a7)+,d3-d4/a2
[000180f0] 4e75                      rts
uniquename:
[000180f2] 48e7 182e                 movem.l    d3-d4/a2/a4-a6,-(a7)
[000180f6] 4fef ffb0                 lea.l      -80(a7),a7
[000180fa] 2a48                      movea.l    a0,a5
[000180fc] 2449                      movea.l    a1,a2
[000180fe] 43ea 0016                 lea.l      22(a2),a1
[00018102] 41d7                      lea.l      (a7),a0
[00018104] 4eb9 0008 2f0c            jsr        strcpy
[0001810a] 41d7                      lea.l      (a7),a0
[0001810c] 6100 ff78                 bsr        makeformat
[00018110] 3600                      move.w     d0,d3
[00018112] 49ef 0028                 lea.l      40(a7),a4
[00018116] 4a43                      tst.w      d3
[00018118] 6b24                      bmi.s      $0001813E
[0001811a] 3003                      move.w     d3,d0
[0001811c] 5243                      addq.w     #1,d3
[0001811e] 3f00                      move.w     d0,-(a7)
[00018120] 43ef 0002                 lea.l      2(a7),a1
[00018124] 204c                      movea.l    a4,a0
[00018126] 4eb9 0008 15ac            jsr        sprintf
[0001812c] 544f                      addq.w     #2,a7
[0001812e] 422c 001f                 clr.b      31(a4)
[00018132] 224c                      movea.l    a4,a1
[00018134] 41ea 0016                 lea.l      22(a2),a0
[00018138] 4eb9 0008 2f0c            jsr        strcpy
[0001813e] 41ea 0016                 lea.l      22(a2),a0
[00018142] 4eb9 0008 2f6c            jsr        strlen
[00018148] 2800                      move.l     d0,d4
[0001814a] 4ded 0010                 lea.l      16(a5),a6
[0001814e] 6060                      bra.s      $000181B0
[00018150] 2256                      movea.l    (a6),a1
[00018152] 43e9 0016                 lea.l      22(a1),a1
[00018156] 41ea 0016                 lea.l      22(a2),a0
[0001815a] 4eb9 0008 2eba            jsr        strcmp
[00018160] 4a40                      tst.w      d0
[00018162] 6b50                      bmi.s      $000181B4
[00018164] 4a40                      tst.w      d0
[00018166] 6646                      bne.s      $000181AE
[00018168] b5d6                      cmpa.l     (a6),a2
[0001816a] 6742                      beq.s      $000181AE
[0001816c] 4a43                      tst.w      d3
[0001816e] 6b3a                      bmi.s      $000181AA
[00018170] 3003                      move.w     d3,d0
[00018172] 5243                      addq.w     #1,d3
[00018174] 3f00                      move.w     d0,-(a7)
[00018176] 43ef 0002                 lea.l      2(a7),a1
[0001817a] 204c                      movea.l    a4,a0
[0001817c] 4eb9 0008 15ac            jsr        sprintf
[00018182] 544f                      addq.w     #2,a7
[00018184] 422c 001f                 clr.b      31(a4)
[00018188] 224c                      movea.l    a4,a1
[0001818a] 41ea 0016                 lea.l      22(a2),a0
[0001818e] 4eb9 0008 2f0c            jsr        strcpy
[00018194] 1034 4000                 move.b     0(a4,d4.w),d0
[00018198] 6714                      beq.s      $000181AE
[0001819a] 4ded 0010                 lea.l      16(a5),a6
[0001819e] 204c                      movea.l    a4,a0
[000181a0] 4eb9 0008 2f6c            jsr        strlen
[000181a6] 2800                      move.l     d0,d4
[000181a8] 6006                      bra.s      $000181B0
[000181aa] 70ff                      moveq.l    #-1,d0
[000181ac] 600e                      bra.s      $000181BC
[000181ae] 2c56                      movea.l    (a6),a6
[000181b0] 2016                      move.l     (a6),d0
[000181b2] 669c                      bne.s      $00018150
[000181b4] 206f 006c                 movea.l    108(a7),a0
[000181b8] 208e                      move.l     a6,(a0)
[000181ba] 4240                      clr.w      d0
[000181bc] 4fef 0050                 lea.l      80(a7),a7
[000181c0] 4cdf 7418                 movem.l    (a7)+,d3-d4/a2/a4-a6
[000181c4] 4e75                      rts
objname:
[000181c6] 48e7 0034                 movem.l    a2-a3/a5,-(a7)
[000181ca] 594f                      subq.w     #4,a7
[000181cc] 2648                      movea.l    a0,a3
[000181ce] 2449                      movea.l    a1,a2
[000181d0] 2a6f 0018                 movea.l    24(a7),a5
[000181d4] 41ea 0016                 lea.l      22(a2),a0
[000181d8] 226f 0014                 movea.l    20(a7),a1
[000181dc] 4eb9 0008 2f0c            jsr        strcpy
[000181e2] 41eb 0010                 lea.l      16(a3),a0
[000181e6] 2e88                      move.l     a0,(a7)
[000181e8] 6002                      bra.s      $000181EC
[000181ea] 2e88                      move.l     a0,(a7)
[000181ec] 2257                      movea.l    (a7),a1
[000181ee] 2051                      movea.l    (a1),a0
[000181f0] b5c8                      cmpa.l     a0,a2
[000181f2] 66f6                      bne.s      $000181EA
[000181f4] 2292                      move.l     (a2),(a1)
[000181f6] 600e                      bra.s      $00018206
[000181f8] 2f0d                      move.l     a5,-(a7)
[000181fa] 224a                      movea.l    a2,a1
[000181fc] 204b                      movea.l    a3,a0
[000181fe] 4eb9 0001 61a0            jsr        newlabel
[00018204] 584f                      addq.w     #4,a7
[00018206] 4857                      pea.l      (a7)
[00018208] 224a                      movea.l    a2,a1
[0001820a] 204b                      movea.l    a3,a0
[0001820c] 6100 fee4                 bsr        uniquename
[00018210] 584f                      addq.w     #4,a7
[00018212] 5240                      addq.w     #1,d0
[00018214] 6604                      bne.s      $0001821A
[00018216] 200d                      move.l     a5,d0
[00018218] 66de                      bne.s      $000181F8
[0001821a] 2057                      movea.l    (a7),a0
[0001821c] 2490                      move.l     (a0),(a2)
[0001821e] 2057                      movea.l    (a7),a0
[00018220] 208a                      move.l     a2,(a0)
[00018222] 006b 0001 0006            ori.w      #$0001,6(a3)
[00018228] 584f                      addq.w     #4,a7
[0001822a] 4cdf 2c00                 movem.l    (a7)+,a2-a3/a5
[0001822e] 4e75                      rts
