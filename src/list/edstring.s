add_string:
[00035f3e] 48e7 1c3e                 movem.l    d3-d5/a2-a6,-(a7)
[00035f42] 594f                      subq.w     #4,a7
[00035f44] 2648                      movea.l    a0,a3
[00035f46] 2449                      movea.l    a1,a2
[00035f48] 200a                      move.l     a2,d0
[00035f4a] 6700 0114                 beq        $00036060
[00035f4e] 222a 0004                 move.l     4(a2),d1
[00035f52] 6700 010c                 beq        $00036060
[00035f56] 006b 0001 0006            ori.w      #$0001,6(a3)
[00035f5c] 2eab 0034                 move.l     52(a3),(a7)
[00035f60] 2257                      movea.l    (a7),a1
[00035f62] 2a69 0004                 movea.l    4(a1),a5
[00035f66] 7206                      moveq.l    #6,d1
[00035f68] 2079 0010 ee4e            movea.l    ACSblk,a0
[00035f6e] c268 0266                 and.w      614(a0),d1
[00035f72] 5d41                      subq.w     #6,d1
[00035f74] 6700 00b6                 beq        $0003602C
[00035f78] 2629 000e                 move.l     14(a1),d3
[00035f7c] e48b                      lsr.l      #2,d3
[00035f7e] 4244                      clr.w      d4
[00035f80] 6000 00a4                 bra        $00036026
[00035f84] 3004                      move.w     d4,d0
[00035f86] 48c0                      ext.l      d0
[00035f88] e588                      lsl.l      #2,d0
[00035f8a] 2c75 0800                 movea.l    0(a5,d0.l),a6
[00035f8e] 226a 0004                 movea.l    4(a2),a1
[00035f92] 206e 0004                 movea.l    4(a6),a0
[00035f96] 4eb9 0008 2eba            jsr        strcmp
[00035f9c] 4a40                      tst.w      d0
[00035f9e] 6600 0084                 bne        $00036024
[00035fa2] 4245                      clr.w      d5
[00035fa4] 6030                      bra.s      $00035FD6
[00035fa6] 3005                      move.w     d5,d0
[00035fa8] 48c0                      ext.l      d0
[00035faa] e588                      lsl.l      #2,d0
[00035fac] 41f3 0800                 lea.l      0(a3,d0.l),a0
[00035fb0] 2268 01f6                 movea.l    502(a0),a1
[00035fb4] 2869 0004                 movea.l    4(a1),a4
[00035fb8] 226e 0004                 movea.l    4(a6),a1
[00035fbc] 3204                      move.w     d4,d1
[00035fbe] 48c1                      ext.l      d1
[00035fc0] e589                      lsl.l      #2,d1
[00035fc2] 2074 1800                 movea.l    0(a4,d1.l),a0
[00035fc6] 2068 0004                 movea.l    4(a0),a0
[00035fca] 4eb9 0008 2eba            jsr        strcmp
[00035fd0] 4a40                      tst.w      d0
[00035fd2] 6608                      bne.s      $00035FDC
[00035fd4] 5245                      addq.w     #1,d5
[00035fd6] ba7c 0003                 cmp.w      #$0003,d5
[00035fda] 6dca                      blt.s      $00035FA6
[00035fdc] ba7c 0003                 cmp.w      #$0003,d5
[00035fe0] 673c                      beq.s      $0003601E
[00035fe2] 4245                      clr.w      d5
[00035fe4] 602c                      bra.s      $00036012
[00035fe6] 3005                      move.w     d5,d0
[00035fe8] 48c0                      ext.l      d0
[00035fea] e588                      lsl.l      #2,d0
[00035fec] 41f3 0800                 lea.l      0(a3,d0.l),a0
[00035ff0] 2268 01f6                 movea.l    502(a0),a1
[00035ff4] 2869 0004                 movea.l    4(a1),a4
[00035ff8] 3204                      move.w     d4,d1
[00035ffa] 48c1                      ext.l      d1
[00035ffc] e589                      lsl.l      #2,d1
[00035ffe] 2074 1800                 movea.l    0(a4,d1.l),a0
[00036002] 2068 0004                 movea.l    4(a0),a0
[00036006] 4eb9 0008 2f6c            jsr        strlen
[0003600c] 4a80                      tst.l      d0
[0003600e] 6608                      bne.s      $00036018
[00036010] 5245                      addq.w     #1,d5
[00036012] ba7c 0003                 cmp.w      #$0003,d5
[00036016] 6dce                      blt.s      $00035FE6
[00036018] ba7c 0003                 cmp.w      #$0003,d5
[0003601c] 6606                      bne.s      $00036024
[0003601e] 526e 0036                 addq.w     #1,54(a6)
[00036022] 604c                      bra.s      $00036070
[00036024] 5244                      addq.w     #1,d4
[00036026] b644                      cmp.w      d4,d3
[00036028] 6e00 ff5a                 bgt        $00035F84
[0003602c] 224a                      movea.l    a2,a1
[0003602e] 204b                      movea.l    a3,a0
[00036030] 4eb9 0003 6416            jsr        copy_str
[00036036] 2c48                      movea.l    a0,a6
[00036038] 200e                      move.l     a6,d0
[0003603a] 6724                      beq.s      $00036060
[0003603c] 2f39 000c f01a            move.l     $000CF01A,-(a7)
[00036042] 486a 0016                 pea.l      22(a2)
[00036046] 224e                      movea.l    a6,a1
[00036048] 204b                      movea.l    a3,a0
[0003604a] 4eb9 0001 81c6            jsr        objname
[00036050] 504f                      addq.w     #8,a7
[00036052] 224e                      movea.l    a6,a1
[00036054] 2057                      movea.l    (a7),a0
[00036056] 4eb9 0003 33b4            jsr        add_entry
[0003605c] 5240                      addq.w     #1,d0
[0003605e] 6604                      bne.s      $00036064
[00036060] 91c8                      suba.l     a0,a0
[00036062] 600e                      bra.s      $00036072
[00036064] 224e                      movea.l    a6,a1
[00036066] 7001                      moveq.l    #1,d0
[00036068] 204b                      movea.l    a3,a0
[0003606a] 4eb9 0003 618e            jsr        serv_str
[00036070] 204e                      movea.l    a6,a0
[00036072] 584f                      addq.w     #4,a7
[00036074] 4cdf 7c38                 movem.l    (a7)+,d3-d5/a2-a6
[00036078] 4e75                      rts
change_string:
[0003607a] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003607e] 2648                      movea.l    a0,a3
[00036080] 2449                      movea.l    a1,a2
[00036082] 286f 0018                 movea.l    24(a7),a4
[00036086] 200a                      move.l     a2,d0
[00036088] 6604                      bne.s      $0003608E
[0003608a] 91c8                      suba.l     a0,a0
[0003608c] 6074                      bra.s      $00036102
[0003608e] 006b 0001 0006            ori.w      #$0001,6(a3)
[00036094] 204c                      movea.l    a4,a0
[00036096] 4eb9 0008 2f6c            jsr        strlen
[0003609c] 2600                      move.l     d0,d3
[0003609e] 5243                      addq.w     #1,d3
[000360a0] 3003                      move.w     d3,d0
[000360a2] 48c0                      ext.l      d0
[000360a4] b0aa 000a                 cmp.l      10(a2),d0
[000360a8] 6e16                      bgt.s      $000360C0
[000360aa] 224c                      movea.l    a4,a1
[000360ac] 206a 0004                 movea.l    4(a2),a0
[000360b0] 4eb9 0008 2f0c            jsr        strcpy
[000360b6] 3003                      move.w     d3,d0
[000360b8] 48c0                      ext.l      d0
[000360ba] 2540 000e                 move.l     d0,14(a2)
[000360be] 602e                      bra.s      $000360EE
[000360c0] 2a6a 0004                 movea.l    4(a2),a5
[000360c4] 204c                      movea.l    a4,a0
[000360c6] 4eb9 0004 643c            jsr        Ast_create
[000360cc] 2548 0004                 move.l     a0,4(a2)
[000360d0] 2008                      move.l     a0,d0
[000360d2] 6606                      bne.s      $000360DA
[000360d4] 254d 0004                 move.l     a5,4(a2)
[000360d8] 6014                      bra.s      $000360EE
[000360da] 204d                      movea.l    a5,a0
[000360dc] 4eb9 0004 c7c8            jsr        Ax_free
[000360e2] 3003                      move.w     d3,d0
[000360e4] 48c0                      ext.l      d0
[000360e6] 2540 000a                 move.l     d0,10(a2)
[000360ea] 2540 000e                 move.l     d0,14(a2)
[000360ee] 206b 0034                 movea.l    52(a3),a0
[000360f2] 2028 0012                 move.l     18(a0),d0
[000360f6] 6708                      beq.s      $00036100
[000360f8] 2240                      movea.l    d0,a1
[000360fa] 0069 0020 0056            ori.w      #$0020,86(a1)
[00036100] 204a                      movea.l    a2,a0
[00036102] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00036106] 4e75                      rts
del_string:
[00036108] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003610c] 2448                      movea.l    a0,a2
[0003610e] 2649                      movea.l    a1,a3
[00036110] 006a 0001 0006            ori.w      #$0001,6(a2)
[00036116] 536b 0036                 subq.w     #1,54(a3)
[0003611a] 302b 0036                 move.w     54(a3),d0
[0003611e] 6e36                      bgt.s      $00036156
[00036120] 286b 0012                 movea.l    18(a3),a4
[00036124] 220c                      move.l     a4,d1
[00036126] 670c                      beq.s      $00036134
[00036128] 2a6c 0004                 movea.l    4(a4),a5
[0003612c] 204c                      movea.l    a4,a0
[0003612e] 7002                      moveq.l    #2,d0
[00036130] 93c9                      suba.l     a1,a1
[00036132] 4e95                      jsr        (a5)
[00036134] 224b                      movea.l    a3,a1
[00036136] 206a 0034                 movea.l    52(a2),a0
[0003613a] 4eb9 0003 3420            jsr        del_entry
[00036140] 224b                      movea.l    a3,a1
[00036142] 204a                      movea.l    a2,a0
[00036144] 4eb9 0001 7f52            jsr        objfree
[0003614a] 224b                      movea.l    a3,a1
[0003614c] 7003                      moveq.l    #3,d0
[0003614e] 204a                      movea.l    a2,a0
[00036150] 4eb9 0003 618e            jsr        serv_str
[00036156] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003615a] 4e75                      rts
dup_string:
[0003615c] 48e7 0038                 movem.l    a2-a4,-(a7)
[00036160] 2848                      movea.l    a0,a4
[00036162] 2449                      movea.l    a1,a2
[00036164] 47f9 000c f034            lea.l      free_string,a3
[0003616a] 274a 0004                 move.l     a2,4(a3)
[0003616e] 204a                      movea.l    a2,a0
[00036170] 4eb9 0008 2f6c            jsr        strlen
[00036176] 5280                      addq.l     #1,d0
[00036178] 2740 000a                 move.l     d0,10(a3)
[0003617c] 2740 000e                 move.l     d0,14(a3)
[00036180] 224b                      movea.l    a3,a1
[00036182] 204c                      movea.l    a4,a0
[00036184] 6100 fdb8                 bsr        add_string
[00036188] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003618c] 4e75                      rts
serv_str:
[0003618e] 48e7 1e1e                 movem.l    d3-d6/a3-a6,-(a7)
[00036192] 4fef ff92                 lea.l      -110(a7),a7
[00036196] 2648                      movea.l    a0,a3
[00036198] 2f49 006a                 move.l     a1,106(a7)
[0003619c] 41f9 000c f076            lea.l      $000CF076,a0
[000361a2] 43ef 0028                 lea.l      40(a7),a1
[000361a6] 720f                      moveq.l    #15,d1
[000361a8] 22d8                      move.l     (a0)+,(a1)+
[000361aa] 51c9 fffc                 dbf        d1,$000361A8
[000361ae] 32d8                      move.w     (a0)+,(a1)+
[000361b0] 3200                      move.w     d0,d1
[000361b2] 5341                      subq.w     #1,d1
[000361b4] 6710                      beq.s      $000361C6
[000361b6] 5341                      subq.w     #1,d1
[000361b8] 6700 0090                 beq        $0003624A
[000361bc] 5341                      subq.w     #1,d1
[000361be] 6700 01be                 beq        $0003637E
[000361c2] 6000 0242                 bra        $00036406
[000361c6] 4243                      clr.w      d3
[000361c8] 6076                      bra.s      $00036240
[000361ca] 206f 006a                 movea.l    106(a7),a0
[000361ce] 2f68 0004 002c            move.l     4(a0),44(a7)
[000361d4] 2028 000a                 move.l     10(a0),d0
[000361d8] 2f40 0032                 move.l     d0,50(a7)
[000361dc] 2f40 0036                 move.l     d0,54(a7)
[000361e0] 43ef 0028                 lea.l      40(a7),a1
[000361e4] 204b                      movea.l    a3,a0
[000361e6] 4eb9 0003 6416            jsr        copy_str
[000361ec] 2848                      movea.l    a0,a4
[000361ee] 200c                      move.l     a4,d0
[000361f0] 6700 0214                 beq        $00036406
[000361f4] 3f03                      move.w     d3,-(a7)
[000361f6] 226f 006c                 movea.l    108(a7),a1
[000361fa] 4869 0016                 pea.l      22(a1)
[000361fe] 43f9 000c f0b8            lea.l      $000CF0B8,a1
[00036204] 41ec 0016                 lea.l      22(a4),a0
[00036208] 4eb9 0008 15ac            jsr        sprintf
[0003620e] 5c4f                      addq.w     #6,a7
[00036210] 42a7                      clr.l      -(a7)
[00036212] 486c 0016                 pea.l      22(a4)
[00036216] 224c                      movea.l    a4,a1
[00036218] 204b                      movea.l    a3,a0
[0003621a] 4eb9 0001 81c6            jsr        objname
[00036220] 504f                      addq.w     #8,a7
[00036222] 224c                      movea.l    a4,a1
[00036224] 3003                      move.w     d3,d0
[00036226] 48c0                      ext.l      d0
[00036228] e588                      lsl.l      #2,d0
[0003622a] 41f3 0800                 lea.l      0(a3,d0.l),a0
[0003622e] 2068 01f6                 movea.l    502(a0),a0
[00036232] 4eb9 0003 33b4            jsr        add_entry
[00036238] 5240                      addq.w     #1,d0
[0003623a] 6700 01ca                 beq        $00036406
[0003623e] 5243                      addq.w     #1,d3
[00036240] b67c 0003                 cmp.w      #$0003,d3
[00036244] 6d84                      blt.s      $000361CA
[00036246] 6000 01c2                 bra        $0003640A
[0003624a] 206b 0034                 movea.l    52(a3),a0
[0003624e] 2828 000e                 move.l     14(a0),d4
[00036252] e48c                      lsr.l      #2,d4
[00036254] 226b 01f6                 movea.l    502(a3),a1
[00036258] 2a29 000e                 move.l     14(a1),d5
[0003625c] e48d                      lsr.l      #2,d5
[0003625e] 2c49                      movea.l    a1,a6
[00036260] 2f6e 0004 0024            move.l     4(a6),36(a7)
[00036266] 2f68 0004 0020            move.l     4(a0),32(a7)
[0003626c] 4245                      clr.w      d5
[0003626e] 6014                      bra.s      $00036284
[00036270] 3005                      move.w     d5,d0
[00036272] 48c0                      ext.l      d0
[00036274] e588                      lsl.l      #2,d0
[00036276] 206f 0020                 movea.l    32(a7),a0
[0003627a] 2270 0800                 movea.l    0(a0,d0.l),a1
[0003627e] 4229 0033                 clr.b      51(a1)
[00036282] 5245                      addq.w     #1,d5
[00036284] b845                      cmp.w      d5,d4
[00036286] 6ee8                      bgt.s      $00036270
[00036288] 4246                      clr.w      d6
[0003628a] 6000 0072                 bra.w      $000362FE
[0003628e] 4217                      clr.b      (a7)
[00036290] 701c                      moveq.l    #28,d0
[00036292] 3206                      move.w     d6,d1
[00036294] 48c1                      ext.l      d1
[00036296] e589                      lsl.l      #2,d1
[00036298] 206f 0024                 movea.l    36(a7),a0
[0003629c] 2270 1800                 movea.l    0(a0,d1.l),a1
[000362a0] 43e9 0016                 lea.l      22(a1),a1
[000362a4] 41d7                      lea.l      (a7),a0
[000362a6] 4eb9 0008 2f96            jsr        strncat
[000362ac] 2a48                      movea.l    a0,a5
[000362ae] 7001                      moveq.l    #1,d0
[000362b0] 41d7                      lea.l      (a7),a0
[000362b2] 4eb9 0008 2e8a            jsr        strchr
[000362b8] 2a48                      movea.l    a0,a5
[000362ba] 200d                      move.l     a5,d0
[000362bc] 670a                      beq.s      $000362C8
[000362be] 0c2d 0001 0002            cmpi.b     #$01,2(a5)
[000362c4] 6602                      bne.s      $000362C8
[000362c6] 4210                      clr.b      (a0)
[000362c8] 200d                      move.l     a5,d0
[000362ca] 6704                      beq.s      $000362D0
[000362cc] 1215                      move.b     (a5),d1
[000362ce] 66de                      bne.s      $000362AE
[000362d0] 4243                      clr.w      d3
[000362d2] 6020                      bra.s      $000362F4
[000362d4] 43d7                      lea.l      (a7),a1
[000362d6] 3003                      move.w     d3,d0
[000362d8] 48c0                      ext.l      d0
[000362da] e588                      lsl.l      #2,d0
[000362dc] 206f 0020                 movea.l    32(a7),a0
[000362e0] 2070 0800                 movea.l    0(a0,d0.l),a0
[000362e4] 41e8 0016                 lea.l      22(a0),a0
[000362e8] 4eb9 0008 2eba            jsr        strcmp
[000362ee] 4a40                      tst.w      d0
[000362f0] 6706                      beq.s      $000362F8
[000362f2] 5243                      addq.w     #1,d3
[000362f4] b843                      cmp.w      d3,d4
[000362f6] 6edc                      bgt.s      $000362D4
[000362f8] b843                      cmp.w      d3,d4
[000362fa] 6708                      beq.s      $00036304
[000362fc] 5246                      addq.w     #1,d6
[000362fe] ba46                      cmp.w      d6,d5
[00036300] 6e00 ff8c                 bgt.w      $0003628E
[00036304] ba46                      cmp.w      d6,d5
[00036306] 6f00 0102                 ble        $0003640A
[0003630a] 4243                      clr.w      d3
[0003630c] 6066                      bra.s      $00036374
[0003630e] 3003                      move.w     d3,d0
[00036310] 48c0                      ext.l      d0
[00036312] e588                      lsl.l      #2,d0
[00036314] 41f3 0800                 lea.l      0(a3,d0.l),a0
[00036318] 2c68 01f6                 movea.l    502(a0),a6
[0003631c] 2f6e 0004 0024            move.l     4(a6),36(a7)
[00036322] 3206                      move.w     d6,d1
[00036324] 48c1                      ext.l      d1
[00036326] e589                      lsl.l      #2,d1
[00036328] 226f 0024                 movea.l    36(a7),a1
[0003632c] 2a71 1800                 movea.l    0(a1,d1.l),a5
[00036330] 3f03                      move.w     d3,-(a7)
[00036332] 206f 006c                 movea.l    108(a7),a0
[00036336] 4868 0016                 pea.l      22(a0)
[0003633a] 43f9 000c f0b8            lea.l      $000CF0B8,a1
[00036340] 41ed 0016                 lea.l      22(a5),a0
[00036344] 4eb9 0008 15ac            jsr        sprintf
[0003634a] 5c4f                      addq.w     #6,a7
[0003634c] 42a7                      clr.l      -(a7)
[0003634e] 486d 0016                 pea.l      22(a5)
[00036352] 224d                      movea.l    a5,a1
[00036354] 204b                      movea.l    a3,a0
[00036356] 4eb9 0001 81c6            jsr        objname
[0003635c] 504f                      addq.w     #8,a7
[0003635e] 224d                      movea.l    a5,a1
[00036360] 204e                      movea.l    a6,a0
[00036362] 4eb9 0003 3420            jsr        del_entry
[00036368] 224d                      movea.l    a5,a1
[0003636a] 204e                      movea.l    a6,a0
[0003636c] 4eb9 0003 33b4            jsr        add_entry
[00036372] 5243                      addq.w     #1,d3
[00036374] b67c 0003                 cmp.w      #$0003,d3
[00036378] 6d94                      blt.s      $0003630E
[0003637a] 6000 008e                 bra        $0003640A
[0003637e] 4243                      clr.w      d3
[00036380] 6000 007a                 bra.w      $000363FC
[00036384] 3003                      move.w     d3,d0
[00036386] 48c0                      ext.l      d0
[00036388] e588                      lsl.l      #2,d0
[0003638a] 41f3 0800                 lea.l      0(a3,d0.l),a0
[0003638e] 2268 01f6                 movea.l    502(a0),a1
[00036392] 2a29 000e                 move.l     14(a1),d5
[00036396] e48d                      lsr.l      #2,d5
[00036398] 2c49                      movea.l    a1,a6
[0003639a] 2f6e 0004 0024            move.l     4(a6),36(a7)
[000363a0] 3f03                      move.w     d3,-(a7)
[000363a2] 2a6f 006c                 movea.l    108(a7),a5
[000363a6] 486d 0016                 pea.l      22(a5)
[000363aa] 43f9 000c f0b8            lea.l      $000CF0B8,a1
[000363b0] 41ef 0006                 lea.l      6(a7),a0
[000363b4] 4eb9 0008 15ac            jsr        sprintf
[000363ba] 5c4f                      addq.w     #6,a7
[000363bc] 4246                      clr.w      d6
[000363be] 6036                      bra.s      $000363F6
[000363c0] 3006                      move.w     d6,d0
[000363c2] 48c0                      ext.l      d0
[000363c4] e588                      lsl.l      #2,d0
[000363c6] 206f 0024                 movea.l    36(a7),a0
[000363ca] 2870 0800                 movea.l    0(a0,d0.l),a4
[000363ce] 43ec 0016                 lea.l      22(a4),a1
[000363d2] 41d7                      lea.l      (a7),a0
[000363d4] 4eb9 0008 2eba            jsr        strcmp
[000363da] 4a40                      tst.w      d0
[000363dc] 6616                      bne.s      $000363F4
[000363de] 224c                      movea.l    a4,a1
[000363e0] 204e                      movea.l    a6,a0
[000363e2] 4eb9 0003 3420            jsr        del_entry
[000363e8] 224c                      movea.l    a4,a1
[000363ea] 204b                      movea.l    a3,a0
[000363ec] 4eb9 0001 7f52            jsr        objfree
[000363f2] 6006                      bra.s      $000363FA
[000363f4] 5246                      addq.w     #1,d6
[000363f6] ba46                      cmp.w      d6,d5
[000363f8] 6ec6                      bgt.s      $000363C0
[000363fa] 5243                      addq.w     #1,d3
[000363fc] b67c 0003                 cmp.w      #$0003,d3
[00036400] 6d00 ff82                 blt.w      $00036384
[00036404] 6004                      bra.s      $0003640A
[00036406] 4240                      clr.w      d0
[00036408] 6002                      bra.s      $0003640C
[0003640a] 7001                      moveq.l    #1,d0
[0003640c] 4fef 006e                 lea.l      110(a7),a7
[00036410] 4cdf 7878                 movem.l    (a7)+,d3-d6/a3-a6
[00036414] 4e75                      rts
copy_str:
[00036416] 2f0a                      move.l     a2,-(a7)
[00036418] 2f0b                      move.l     a3,-(a7)
[0003641a] 2648                      movea.l    a0,a3
[0003641c] 2449                      movea.l    a1,a2
[0003641e] 006b 0001 0006            ori.w      #$0001,6(a3)
[00036424] 202a 000a                 move.l     10(a2),d0
[00036428] 4eb9 0001 7fae            jsr        objmalloc
[0003642e] 2648                      movea.l    a0,a3
[00036430] 200b                      move.l     a3,d0
[00036432] 6604                      bne.s      $00036438
[00036434] 91c8                      suba.l     a0,a0
[00036436] 601c                      bra.s      $00036454
[00036438] 226a 0004                 movea.l    4(a2),a1
[0003643c] 206b 0004                 movea.l    4(a3),a0
[00036440] 4eb9 0008 2f0c            jsr        strcpy
[00036446] 202a 000e                 move.l     14(a2),d0
[0003644a] 2740 000e                 move.l     d0,14(a3)
[0003644e] 2740 000a                 move.l     d0,10(a3)
[00036452] 204b                      movea.l    a3,a0
[00036454] 265f                      movea.l    (a7)+,a3
[00036456] 245f                      movea.l    (a7)+,a2
[00036458] 4e75                      rts
new_work:
[0003645a] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0003645e] 594f                      subq.w     #4,a7
[00036460] 2ea8 0004                 move.l     4(a0),(a7)
[00036464] 2628 000e                 move.l     14(a0),d3
[00036468] e48b                      lsr.l      #2,d3
[0003646a] 3203                      move.w     d3,d1
[0003646c] 48c1                      ext.l      d1
[0003646e] 2001                      move.l     d1,d0
[00036470] d080                      add.l      d0,d0
[00036472] d081                      add.l      d1,d0
[00036474] e988                      lsl.l      #4,d0
[00036476] 9081                      sub.l      d1,d0
[00036478] d080                      add.l      d0,d0
[0003647a] d0bc 0000 0030            add.l      #$00000030,d0
[00036480] 4eb9 0004 c608            jsr        Ax_malloc
[00036486] 2648                      movea.l    a0,a3
[00036488] 200b                      move.l     a3,d0
[0003648a] 6606                      bne.s      $00036492
[0003648c] 91c8                      suba.l     a0,a0
[0003648e] 6000 00dc                 bra        $0003656C
[00036492] 7030                      moveq.l    #48,d0
[00036494] 43f9 000c ef68            lea.l      inner,a1
[0003649a] 204b                      movea.l    a3,a0
[0003649c] 4eb9 0008 3500            jsr        memcpy
[000364a2] 49eb 0030                 lea.l      48(a3),a4
[000364a6] 4a43                      tst.w      d3
[000364a8] 6f00 00b8                 ble        $00036562
[000364ac] 3203                      move.w     d3,d1
[000364ae] d241                      add.w      d1,d1
[000364b0] 48c1                      ext.l      d1
[000364b2] 2001                      move.l     d1,d0
[000364b4] d080                      add.l      d0,d0
[000364b6] d081                      add.l      d1,d0
[000364b8] e788                      lsl.l      #3,d0
[000364ba] 4bf3 0830                 lea.l      48(a3,d0.l),a5
[000364be] 4244                      clr.w      d4
[000364c0] 607c                      bra.s      $0003653E
[000364c2] 7030                      moveq.l    #48,d0
[000364c4] 43f9 000c ef98            lea.l      proto,a1
[000364ca] 204c                      movea.l    a4,a0
[000364cc] 4eb9 0008 3500            jsr        memcpy
[000364d2] 3004                      move.w     d4,d0
[000364d4] d040                      add.w      d0,d0
[000364d6] 5840                      addq.w     #4,d0
[000364d8] 3880                      move.w     d0,(a4)
[000364da] 294d 000c                 move.l     a5,12(a4)
[000364de] 3204                      move.w     d4,d1
[000364e0] 48c1                      ext.l      d1
[000364e2] e589                      lsl.l      #2,d1
[000364e4] 2057                      movea.l    (a7),a0
[000364e6] 2470 1800                 movea.l    0(a0,d1.l),a2
[000364ea] 342a 0038                 move.w     56(a2),d2
[000364ee] c47c 0100                 and.w      #$0100,d2
[000364f2] 6606                      bne.s      $000364FA
[000364f4] 006c 0010 000a            ori.w      #$0010,10(a4)
[000364fa] 294a 0024                 move.l     a2,36(a4)
[000364fe] 700c                      moveq.l    #12,d0
[00036500] 43ea 0016                 lea.l      22(a2),a1
[00036504] 204d                      movea.l    a5,a0
[00036506] 4eb9 0008 2fd6            jsr        strncpy
[0003650c] 43f9 000c f0c2            lea.l      $000CF0C2,a1
[00036512] 204d                      movea.l    a5,a0
[00036514] 4eb9 0008 2e42            jsr        strcat
[0003651a] 1b7c 0020 000c            move.b     #$20,12(a5)
[00036520] 7020                      moveq.l    #32,d0
[00036522] 226a 0004                 movea.l    4(a2),a1
[00036526] 41ed 000d                 lea.l      13(a5),a0
[0003652a] 4eb9 0008 2fd6            jsr        strncpy
[00036530] 422d 002d                 clr.b      45(a5)
[00036534] 4bed 002e                 lea.l      46(a5),a5
[00036538] 49ec 0030                 lea.l      48(a4),a4
[0003653c] 5244                      addq.w     #1,d4
[0003653e] b644                      cmp.w      d4,d3
[00036540] 6e00 ff80                 bgt.w      $000364C2
[00036544] 3003                      move.w     d3,d0
[00036546] d040                      add.w      d0,d0
[00036548] 3740 0004                 move.w     d0,4(a3)
[0003654c] 377c 0002 0002            move.w     #$0002,2(a3)
[00036552] 026b ffdf 0020            andi.w     #$FFDF,32(a3)
[00036558] 426c ffd0                 clr.w      -48(a4)
[0003655c] 006c 0020 fff0            ori.w      #$0020,-16(a4)
[00036562] 204b                      movea.l    a3,a0
[00036564] 4eb9 0004 fbdc            jsr        Aob_fix
[0003656a] 204b                      movea.l    a3,a0
[0003656c] 584f                      addq.w     #4,a7
[0003656e] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[00036572] 4e75                      rts
