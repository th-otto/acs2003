proto_fulled:
[000422ee] 48e7 0038                 movem.l    a2-a4,-(a7)
[000422f2] 2448                      movea.l    a0,a2
[000422f4] 47ea 0024                 lea.l      36(a2),a3
[000422f8] 49ea 002c                 lea.l      44(a2),a4
[000422fc] 7001                      moveq.l    #1,d0
[000422fe] c06a 0056                 and.w      86(a2),d0
[00042302] 6724                      beq.s      proto_fulled_1
[00042304] 3694                      move.w     (a4),(a3)
[00042306] 376c 0002 0002            move.w     2(a4),2(a3)
[0004230c] 376c 0004 0004            move.w     4(a4),4(a3)
[00042312] 376c 0006 0006            move.w     6(a4),6(a3)
[00042318] 224c                      movea.l    a4,a1
[0004231a] 4eb9 0004 27da            jsr        proto_sized
[00042320] 026a fffe 0056            andi.w     #$FFFE,86(a2)
[00042326] 602a                      bra.s      proto_fulled_2
proto_fulled_1:
[00042328] 3893                      move.w     (a3),(a4)
[0004232a] 396b 0002 0002            move.w     2(a3),2(a4)
[00042330] 396b 0004 0004            move.w     4(a3),4(a4)
[00042336] 396b 0006 0006            move.w     6(a3),6(a4)
[0004233c] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042342] 5049                      addq.w     #8,a1
[00042344] 204a                      movea.l    a2,a0
[00042346] 4eb9 0004 27da            jsr        proto_sized
[0004234c] 006a 0001 0056            ori.w      #$0001,86(a2)
proto_fulled_2:
[00042352] 3f2b 0006                 move.w     6(a3),-(a7)
[00042356] 3f2b 0004                 move.w     4(a3),-(a7)
[0004235a] 3f2b 0002                 move.w     2(a3),-(a7)
[0004235e] 3f13                      move.w     (a3),-(a7)
[00042360] 7205                      moveq.l    #5,d1
[00042362] 302a 0020                 move.w     32(a2),d0
[00042366] 4eb9 0007 f926            jsr        wind_set
[0004236c] 504f                      addq.w     #8,a7
[0004236e] 4eb9 0004 b086            jsr        Aev_mess
[00042374] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00042378] 4e75                      rts

proto_arrowed:
[0004237a] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[0004237e] 514f                      subq.w     #8,a7
[00042380] 3800                      move.w     d0,d4
[00042382] 2468 0014                 movea.l    20(a0),a2
[00042386] 45ea 0030                 lea.l      48(a2),a2
[0004238a] 266a 000c                 movea.l    12(a2),a3
[0004238e] 2868 0014                 movea.l    20(a0),a4
[00042392] 49ec 0048                 lea.l      72(a4),a4
[00042396] 2f6c 000c 0004            move.l     12(a4),4(a7)
[0004239c] 4243                      clr.w      d3
[0004239e] 3004                      move.w     d4,d0
proto_arrowed_18:
[000423a0] b07c 0007                 cmp.w      #$0007,d0
[000423a4] 6200 00a2                 bhi        proto_arrowed_1
[000423a8] d040                      add.w      d0,d0
[000423aa] 303b 0006                 move.w     $000423B2(pc,d0.w),d0
[000423ae] 4efb 0002                 jmp        $000423B2(pc,d0.w)
J34:
[000423b2] 0034                      dc.w $0034   ; proto_arrowed_2-J34
[000423b4] 0046                      dc.w $0046   ; proto_arrowed_3-J34
[000423b6] 0010                      dc.w $0010   ; proto_arrowed_4-J34
[000423b8] 0022                      dc.w $0022   ; proto_arrowed_5-J34
[000423ba] 005c                      dc.w $005c   ; proto_arrowed_6-J34
[000423bc] 006a                      dc.w $006a   ; proto_arrowed_7-J34
[000423be] 007a                      dc.w $007a   ; proto_arrowed_8-J34
[000423c0] 0088                      dc.w $0088   ; proto_arrowed_9-J34
proto_arrowed_4:
[000423c2] 93c9                      suba.l     a1,a1
[000423c4] 700b                      moveq.l    #11,d0
[000423c6] 204c                      movea.l    a4,a0
[000423c8] 2a6f 0004                 movea.l    4(a7),a5
[000423cc] 2a6d 0008                 movea.l    8(a5),a5
[000423d0] 4e95                      jsr        (a5)
[000423d2] 6036                      bra.s      proto_arrowed_10
proto_arrowed_5:
[000423d4] 93c9                      suba.l     a1,a1
[000423d6] 700a                      moveq.l    #10,d0
[000423d8] 204c                      movea.l    a4,a0
[000423da] 2a6f 0004                 movea.l    4(a7),a5
[000423de] 2a6d 0008                 movea.l    8(a5),a5
[000423e2] 4e95                      jsr        (a5)
[000423e4] 6024                      bra.s      proto_arrowed_10
proto_arrowed_2:
[000423e6] 93c9                      suba.l     a1,a1
[000423e8] 700d                      moveq.l    #13,d0
[000423ea] 204c                      movea.l    a4,a0
[000423ec] 2a6f 0004                 movea.l    4(a7),a5
[000423f0] 2a6d 0008                 movea.l    8(a5),a5
[000423f4] 4e95                      jsr        (a5)
[000423f6] 6010                      bra.s      proto_arrowed_11
proto_arrowed_3:
[000423f8] 93c9                      suba.l     a1,a1
[000423fa] 700c                      moveq.l    #12,d0
[000423fc] 204c                      movea.l    a4,a0
[000423fe] 2a6f 0004                 movea.l    4(a7),a5
[00042402] 2a6d 0008                 movea.l    8(a5),a5
[00042406] 4e95                      jsr        (a5)
proto_arrowed_11:
[00042408] 4243                      clr.w      d3
proto_arrowed_10:
[0004240a] 7a01                      moveq.l    #1,d5
[0004240c] 603a                      bra.s      proto_arrowed_1
proto_arrowed_6:
[0004240e] 93c9                      suba.l     a1,a1
[00042410] 700d                      moveq.l    #13,d0
[00042412] 204a                      movea.l    a2,a0
[00042414] 2a6b 0008                 movea.l    8(a3),a5
[00042418] 4e95                      jsr        (a5)
[0004241a] 600c                      bra.s      proto_arrowed_12
proto_arrowed_7:
[0004241c] 93c9                      suba.l     a1,a1
[0004241e] 700c                      moveq.l    #12,d0
[00042420] 204a                      movea.l    a2,a0
[00042422] 2a6b 0008                 movea.l    8(a3),a5
[00042426] 4e95                      jsr        (a5)
proto_arrowed_12:
[00042428] 4243                      clr.w      d3
[0004242a] 601a                      bra.s      proto_arrowed_13
proto_arrowed_8:
[0004242c] 93c9                      suba.l     a1,a1
[0004242e] 700b                      moveq.l    #11,d0
[00042430] 204a                      movea.l    a2,a0
[00042432] 2a6b 0008                 movea.l    8(a3),a5
[00042436] 4e95                      jsr        (a5)
[00042438] 600c                      bra.s      proto_arrowed_13
proto_arrowed_9:
[0004243a] 93c9                      suba.l     a1,a1
[0004243c] 700a                      moveq.l    #10,d0
[0004243e] 204a                      movea.l    a2,a0
[00042440] 2a6b 0008                 movea.l    8(a3),a5
[00042444] 4e95                      jsr        (a5)
proto_arrowed_13:
[00042446] 4245                      clr.w      d5
proto_arrowed_1:
[00042448] 4a45                      tst.w      d5
[0004244a] 672c                      beq.s      proto_arrowed_14
[0004244c] 3003                      move.w     d3,d0
[0004244e] 5343                      subq.w     #1,d3
[00042450] 4a40                      tst.w      d0
[00042452] 6612                      bne.s      proto_arrowed_15
[00042454] 93c9                      suba.l     a1,a1
[00042456] 7005                      moveq.l    #5,d0
[00042458] 204c                      movea.l    a4,a0
[0004245a] 2a6f 0004                 movea.l    4(a7),a5
[0004245e] 2a6d 0008                 movea.l    8(a5),a5
[00042462] 4e95                      jsr        (a5)
[00042464] 7604                      moveq.l    #4,d3
proto_arrowed_15:
[00042466] 93c9                      suba.l     a1,a1
[00042468] 7069                      moveq.l    #105,d0
[0004246a] 204c                      movea.l    a4,a0
[0004246c] 2a6f 0004                 movea.l    4(a7),a5
[00042470] 2a6d 0008                 movea.l    8(a5),a5
[00042474] 4e95                      jsr        (a5)
[00042476] 6022                      bra.s      proto_arrowed_16
proto_arrowed_14:
[00042478] 3003                      move.w     d3,d0
[0004247a] 5343                      subq.w     #1,d3
[0004247c] 4a40                      tst.w      d0
[0004247e] 660e                      bne.s      proto_arrowed_17
[00042480] 93c9                      suba.l     a1,a1
[00042482] 7005                      moveq.l    #5,d0
[00042484] 204a                      movea.l    a2,a0
[00042486] 2a6b 0008                 movea.l    8(a3),a5
[0004248a] 4e95                      jsr        (a5)
[0004248c] 7604                      moveq.l    #4,d3
proto_arrowed_17:
[0004248e] 93c9                      suba.l     a1,a1
[00042490] 7069                      moveq.l    #105,d0
[00042492] 204a                      movea.l    a2,a0
[00042494] 2a6b 0008                 movea.l    8(a3),a5
[00042498] 4e95                      jsr        (a5)
proto_arrowed_16:
[0004249a] 2f39 000e 692a            move.l     _globl,-(a7)
[000424a0] 486f 0006                 pea.l      6(a7)
[000424a4] 486f 0008                 pea.l      8(a7)
[000424a8] 43ef 000e                 lea.l      14(a7),a1
[000424ac] 41ef 000e                 lea.l      14(a7),a0
[000424b0] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[000424b6] 4fef 000c                 lea.l      12(a7),a7
[000424ba] 7001                      moveq.l    #1,d0
[000424bc] c057                      and.w      (a7),d0
[000424be] 6600 fede                 bne        proto_arrowed_18
[000424c2] b67c 0004                 cmp.w      #$0004,d3
[000424c6] 6722                      beq.s      proto_arrowed_19
[000424c8] 4a45                      tst.w      d5
[000424ca] 6712                      beq.s      proto_arrowed_20
[000424cc] 93c9                      suba.l     a1,a1
[000424ce] 204c                      movea.l    a4,a0
[000424d0] 246f 0004                 movea.l    4(a7),a2
[000424d4] 246a 0008                 movea.l    8(a2),a2
[000424d8] 7005                      moveq.l    #5,d0
[000424da] 4e92                      jsr        (a2)
[000424dc] 600c                      bra.s      proto_arrowed_19
proto_arrowed_20:
[000424de] 93c9                      suba.l     a1,a1
[000424e0] 7005                      moveq.l    #5,d0
[000424e2] 204c                      movea.l    a4,a0
[000424e4] 246b 0008                 movea.l    8(a3),a2
[000424e8] 4e92                      jsr        (a2)
proto_arrowed_19:
[000424ea] 504f                      addq.w     #8,a7
[000424ec] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[000424f0] 4e75                      rts

proto_hslid:
[000424f2] 48e7 0038                 movem.l    a2-a4,-(a7)
[000424f6] 554f                      subq.w     #2,a7
[000424f8] 3e80                      move.w     d0,(a7)
[000424fa] 2468 0014                 movea.l    20(a0),a2
[000424fe] 45ea 0030                 lea.l      48(a2),a2
[00042502] 266a 000c                 movea.l    12(a2),a3
[00042506] 43d7                      lea.l      (a7),a1
[00042508] 204a                      movea.l    a2,a0
[0004250a] 286b 0008                 movea.l    8(a3),a4
[0004250e] 706a                      moveq.l    #106,d0
[00042510] 4e94                      jsr        (a4)
[00042512] 93c9                      suba.l     a1,a1
[00042514] 7005                      moveq.l    #5,d0
[00042516] 204a                      movea.l    a2,a0
[00042518] 286b 0008                 movea.l    8(a3),a4
[0004251c] 4e94                      jsr        (a4)
[0004251e] 93c9                      suba.l     a1,a1
[00042520] 7069                      moveq.l    #105,d0
[00042522] 204a                      movea.l    a2,a0
[00042524] 286b 0008                 movea.l    8(a3),a4
[00042528] 4e94                      jsr        (a4)
[0004252a] 544f                      addq.w     #2,a7
[0004252c] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00042530] 4e75                      rts

proto_make:
[00042532] 48e7 003e                 movem.l    a2-a6,-(a7)
[00042536] 4fef ffec                 lea.l      -20(a7),a7
[0004253a] 2448                      movea.l    a0,a2
[0004253c] 23fc 000d 6584 000d 63f4  move.l     #edit,$000D63F4
[00042546] 41f9 000d 63e0            lea.l      PROTOCOL,a0
[0004254c] 4eb9 0005 7052            jsr        Awi_create
[00042552] 2648                      movea.l    a0,a3
[00042554] 200b                      move.l     a3,d0
[00042556] 6606                      bne.s      proto_make_1
[00042558] 91c8                      suba.l     a0,a0
[0004255a] 6000 017c                 bra        proto_make_2
proto_make_1:
[0004255e] 006b 0060 0054            ori.w      #$0060,84(a3)
[00042564] 286b 0014                 movea.l    20(a3),a4
[00042568] 4df9 0010 ee4e            lea.l      ACSblk,a6
[0004256e] 200a                      move.l     a2,d0
[00042570] 6704                      beq.s      proto_make_3
[00042572] 2a4a                      movea.l    a2,a5
[00042574] 6014                      bra.s      proto_make_4
proto_make_3:
[00042576] 4bf9 000d 65e4            lea.l      def,a5
[0004257c] 2056                      movea.l    (a6),a0
[0004257e] 3aa8 0290                 move.w     656(a0),(a5)
[00042582] 2056                      movea.l    (a6),a0
[00042584] 3b68 0292 0002            move.w     658(a0),2(a5)
proto_make_4:
[0004258a] 376d 000c 0024            move.w     12(a5),36(a3)
[00042590] 376d 000e 0026            move.w     14(a5),38(a3)
[00042596] 3215                      move.w     (a5),d1
[00042598] 2056                      movea.l    (a6),a0
[0004259a] 3028 0010                 move.w     16(a0),d0
[0004259e] 4eb9 0007 34e6            jsr        vst_font
[000425a4] 486f 0002                 pea.l      2(a7)
[000425a8] 486f 0008                 pea.l      8(a7)
[000425ac] 43ef 0008                 lea.l      8(a7),a1
[000425b0] 41ef 0008                 lea.l      8(a7),a0
[000425b4] 322d 0002                 move.w     2(a5),d1
[000425b8] 2456                      movea.l    (a6),a2
[000425ba] 302a 0010                 move.w     16(a2),d0
[000425be] 4eb9 0007 3370            jsr        vst_height
[000425c4] 504f                      addq.w     #8,a7
[000425c6] 302f 0004                 move.w     4(a7),d0
[000425ca] c1ed 0004                 muls.w     4(a5),d0
[000425ce] 3940 0014                 move.w     d0,20(a4)
[000425d2] 322f 0002                 move.w     2(a7),d1
[000425d6] c3ed 0006                 muls.w     6(a5),d1
[000425da] 3941 0016                 move.w     d1,22(a4)
[000425de] 2056                      movea.l    (a6),a0
[000425e0] 3028 000c                 move.w     12(a0),d0
[000425e4] 3428 0012                 move.w     18(a0),d2
[000425e8] d442                      add.w      d2,d2
[000425ea] 9042                      sub.w      d2,d0
[000425ec] 3e80                      move.w     d0,(a7)
[000425ee] 322c 0014                 move.w     20(a4),d1
[000425f2] b240                      cmp.w      d0,d1
[000425f4] 6f04                      ble.s      proto_make_5
[000425f6] 3940 0014                 move.w     d0,20(a4)
proto_make_5:
[000425fa] 2056                      movea.l    (a6),a0
[000425fc] 3028 000e                 move.w     14(a0),d0
[00042600] 3428 0014                 move.w     20(a0),d2
[00042604] 3202                      move.w     d2,d1
[00042606] d241                      add.w      d1,d1
[00042608] d242                      add.w      d2,d1
[0004260a] 9041                      sub.w      d1,d0
[0004260c] 3e80                      move.w     d0,(a7)
[0004260e] 302c 0016                 move.w     22(a4),d0
[00042612] b057                      cmp.w      (a7),d0
[00042614] 6f04                      ble.s      proto_make_6
[00042616] 3957 0016                 move.w     (a7),22(a4)
proto_make_6:
[0004261a] 224d                      movea.l    a5,a1
[0004261c] 303c 00cf                 move.w     #$00CF,d0
[00042620] 204c                      movea.l    a4,a0
[00042622] 4eb9 0003 a772            jsr        Auo_editor
[00042628] 43ed 0002                 lea.l      2(a5),a1
[0004262c] 303c 00d0                 move.w     #$00D0,d0
[00042630] 204c                      movea.l    a4,a0
[00042632] 4eb9 0003 a772            jsr        Auo_editor
[00042638] 302d 000a                 move.w     10(a5),d0
[0004263c] 48c0                      ext.l      d0
[0004263e] 2f40 0006                 move.l     d0,6(a7)
[00042642] 43ef 0006                 lea.l      6(a7),a1
[00042646] 204c                      movea.l    a4,a0
[00042648] 303c 00cd                 move.w     #$00CD,d0
[0004264c] 4eb9 0003 a772            jsr        Auo_editor
[00042652] 43ed 0008                 lea.l      8(a5),a1
[00042656] 303c 00ec                 move.w     #$00EC,d0
[0004265a] 204c                      movea.l    a4,a0
[0004265c] 4eb9 0003 a772            jsr        Auo_editor
[00042662] 45ef 000a                 lea.l      10(a7),a2
[00042666] 248b                      move.l     a3,(a2)
[00042668] 254c 0004                 move.l     a4,4(a2)
[0004266c] 426a 0008                 clr.w      8(a2)
[00042670] 224a                      movea.l    a2,a1
[00042672] 7009                      moveq.l    #9,d0
[00042674] 204c                      movea.l    a4,a0
[00042676] 4eb9 0003 a772            jsr        Auo_editor
[0004267c] 93c9                      suba.l     a1,a1
[0004267e] 303c 00ee                 move.w     #$00EE,d0
[00042682] 204c                      movea.l    a4,a0
[00042684] 4eb9 0003 a772            jsr        Auo_editor
[0004268a] 206b 0014                 movea.l    20(a3),a0
[0004268e] 41e8 0030                 lea.l      48(a0),a0
[00042692] 2548 0004                 move.l     a0,4(a2)
[00042696] 357c 0002 0008            move.w     #$0002,8(a2)
[0004269c] 224a                      movea.l    a2,a1
[0004269e] 303c 00c9                 move.w     #$00C9,d0
[000426a2] 204c                      movea.l    a4,a0
[000426a4] 4eb9 0003 a772            jsr        Auo_editor
[000426aa] 206b 0014                 movea.l    20(a3),a0
[000426ae] 41e8 0048                 lea.l      72(a0),a0
[000426b2] 2548 0004                 move.l     a0,4(a2)
[000426b6] 357c 0003 0008            move.w     #$0003,8(a2)
[000426bc] 224a                      movea.l    a2,a1
[000426be] 303c 00c8                 move.w     #$00C8,d0
[000426c2] 204c                      movea.l    a4,a0
[000426c4] 4eb9 0003 a772            jsr        Auo_editor
[000426ca] 93c9                      suba.l     a1,a1
[000426cc] 7006                      moveq.l    #6,d0
[000426ce] 204c                      movea.l    a4,a0
[000426d0] 4eb9 0003 a772            jsr        Auo_editor
[000426d6] 204b                      movea.l    a3,a0
proto_make_2:
[000426d8] 4fef 0014                 lea.l      20(a7),a7
[000426dc] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[000426e0] 4e75                      rts

term:
[000426e2] 4eb9 0005 85f2            jsr        Awi_delete
[000426e8] 4e75                      rts

proto_service:
[000426ea] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000426ee] 2448                      movea.l    a0,a2
[000426f0] 3600                      move.w     d0,d3
[000426f2] 2649                      movea.l    a1,a3
[000426f4] 5540                      subq.w     #2,d0
[000426f6] 6712                      beq.s      proto_service_1
[000426f8] 907c 0009                 sub.w      #$0009,d0
[000426fc] 6724                      beq.s      proto_service_2
[000426fe] 5940                      subq.w     #4,d0
[00042700] 6746                      beq.s      proto_service_3
[00042702] 907c 00b9                 sub.w      #$00B9,d0
[00042706] 673a                      beq.s      proto_service_4
[00042708] 6062                      bra.s      proto_service_5
proto_service_1:
[0004270a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042710] 3028 023a                 move.w     570(a0),d0
[00042714] 6604                      bne.s      proto_service_6
[00042716] b5cb                      cmpa.l     a3,a2
[00042718] 6660                      bne.s      proto_service_7
proto_service_6:
[0004271a] 204a                      movea.l    a2,a0
[0004271c] 6100 ffc4                 bsr.w      term
[00042720] 6058                      bra.s      proto_service_7
proto_service_2:
[00042722] 93c9                      suba.l     a1,a1
[00042724] 303c 00ce                 move.w     #$00CE,d0
[00042728] 206a 0014                 movea.l    20(a2),a0
[0004272c] 4eb9 0003 a772            jsr        Auo_editor
[00042732] 93c9                      suba.l     a1,a1
[00042734] 7006                      moveq.l    #6,d0
[00042736] 206a 0014                 movea.l    20(a2),a0
[0004273a] 4eb9 0003 a772            jsr        Auo_editor
[00042740] 6038                      bra.s      proto_service_7
proto_service_4:
[00042742] 26aa 0014                 move.l     20(a2),(a3)
[00042746] 6032                      bra.s      proto_service_7
proto_service_3:
[00042748] 41f9 000d 6482            lea.l      WIPR_INFO,a0
[0004274e] 2279 000d 648a            movea.l    $000D648A,a1
[00042754] 4e91                      jsr        (a1)
[00042756] 2848                      movea.l    a0,a4
[00042758] 200c                      move.l     a4,d0
[0004275a] 671e                      beq.s      proto_service_7
[0004275c] 4eb9 0005 9df4            jsr        Awi_dialog
[00042762] 204c                      movea.l    a4,a0
[00042764] 4eb9 0005 85f2            jsr        Awi_delete
[0004276a] 600e                      bra.s      proto_service_7
proto_service_5:
[0004276c] 224b                      movea.l    a3,a1
[0004276e] 3003                      move.w     d3,d0
[00042770] 204a                      movea.l    a2,a0
[00042772] 4eb9 0005 9dd0            jsr        Awi_service
[00042778] 6002                      bra.s      proto_service_8
proto_service_7:
[0004277a] 7001                      moveq.l    #1,d0
proto_service_8:
[0004277c] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00042780] 4e75                      rts

proto_moved:
[00042782] 2f0b                      move.l     a3,-(a7)
[00042784] 2f0c                      move.l     a4,-(a7)
[00042786] 594f                      subq.w     #4,a7
[00042788] 2648                      movea.l    a0,a3
[0004278a] 2849                      movea.l    a1,a4
[0004278c] 2f39 000e 692a            move.l     _globl,-(a7)
[00042792] 486f 0004                 pea.l      4(a7)
[00042796] 486f 0008                 pea.l      8(a7)
[0004279a] 4267                      clr.w      -(a7)
[0004279c] 4267                      clr.w      -(a7)
[0004279e] 4267                      clr.w      -(a7)
[000427a0] 43ef 0012                 lea.l      18(a7),a1
[000427a4] 41ef 0014                 lea.l      20(a7),a0
[000427a8] 4242                      clr.w      d2
[000427aa] 322b 0022                 move.w     34(a3),d1
[000427ae] 7001                      moveq.l    #1,d0
[000427b0] 4eb9 0007 b8da            jsr        mt_wind_calc
[000427b6] 4fef 0012                 lea.l      18(a7),a7
[000427ba] 7008                      moveq.l    #8,d0
[000427bc] d054                      add.w      (a4),d0
[000427be] c07c fff0                 and.w      #$FFF0,d0
[000427c2] 906f 0002                 sub.w      2(a7),d0
[000427c6] 3880                      move.w     d0,(a4)
[000427c8] 224c                      movea.l    a4,a1
[000427ca] 204b                      movea.l    a3,a0
[000427cc] 4eb9 0005 8d50            jsr        Awi_moved
[000427d2] 584f                      addq.w     #4,a7
[000427d4] 285f                      movea.l    (a7)+,a4
[000427d6] 265f                      movea.l    (a7)+,a3
[000427d8] 4e75                      rts

proto_sized:
[000427da] 48e7 003c                 movem.l    a2-a5,-(a7)
[000427de] 594f                      subq.w     #4,a7
[000427e0] 2448                      movea.l    a0,a2
[000427e2] 2a49                      movea.l    a1,a5
[000427e4] 266a 0014                 movea.l    20(a2),a3
[000427e8] 286a 005e                 movea.l    94(a2),a4
[000427ec] 2f39 000e 692a            move.l     _globl,-(a7)
[000427f2] 486b 0016                 pea.l      22(a3)
[000427f6] 486b 0014                 pea.l      20(a3)
[000427fa] 3f2d 0006                 move.w     6(a5),-(a7)
[000427fe] 3f2d 0004                 move.w     4(a5),-(a7)
[00042802] 4267                      clr.w      -(a7)
[00042804] 43ef 0012                 lea.l      18(a7),a1
[00042808] 41ef 0014                 lea.l      20(a7),a0
[0004280c] 4242                      clr.w      d2
[0004280e] 322a 0022                 move.w     34(a2),d1
[00042812] 7001                      moveq.l    #1,d0
[00042814] 4eb9 0007 b8da            jsr        mt_wind_calc
[0004281a] 4fef 0012                 lea.l      18(a7),a7
[0004281e] 7008                      moveq.l    #8,d0
[00042820] d055                      add.w      (a5),d0
[00042822] c07c fff0                 and.w      #$FFF0,d0
[00042826] 906f 0002                 sub.w      2(a7),d0
[0004282a] 3a80                      move.w     d0,(a5)
[0004282c] 220c                      move.l     a4,d1
[0004282e] 6716                      beq.s      proto_sized_1
[00042830] 302c 0002                 move.w     2(a4),d0
[00042834] 48c0                      ext.l      d0
[00042836] 2400                      move.l     d0,d2
[00042838] d482                      add.l      d2,d2
[0004283a] d480                      add.l      d0,d2
[0004283c] e78a                      lsl.l      #3,d2
[0004283e] 3234 2816                 move.w     22(a4,d2.l),d1
[00042842] 936b 0016                 sub.w      d1,22(a3)
proto_sized_1:
[00042846] 202a 0018                 move.l     24(a2),d0
[0004284a] 670a                      beq.s      proto_sized_2
[0004284c] 2040                      movea.l    d0,a0
[0004284e] 3228 0016                 move.w     22(a0),d1
[00042852] 936b 0016                 sub.w      d1,22(a3)
proto_sized_2:
[00042856] 93c9                      suba.l     a1,a1
[00042858] 303c 00ee                 move.w     #$00EE,d0
[0004285c] 204b                      movea.l    a3,a0
[0004285e] 4eb9 0003 a772            jsr        Auo_editor
[00042864] 93c9                      suba.l     a1,a1
[00042866] 303c 00fd                 move.w     #$00FD,d0
[0004286a] 204b                      movea.l    a3,a0
[0004286c] 4eb9 0003 a772            jsr        Auo_editor
[00042872] 224d                      movea.l    a5,a1
[00042874] 204a                      movea.l    a2,a0
[00042876] 4eb9 0005 8bb0            jsr        Awi_sized
[0004287c] 584f                      addq.w     #4,a7
[0004287e] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00042882] 4e75                      rts

proto_vslid:
[00042884] 48e7 0038                 movem.l    a2-a4,-(a7)
[00042888] 554f                      subq.w     #2,a7
[0004288a] 3e80                      move.w     d0,(a7)
[0004288c] 2468 0014                 movea.l    20(a0),a2
[00042890] 45ea 0048                 lea.l      72(a2),a2
[00042894] 266a 000c                 movea.l    12(a2),a3
[00042898] 43d7                      lea.l      (a7),a1
[0004289a] 204a                      movea.l    a2,a0
[0004289c] 286b 0008                 movea.l    8(a3),a4
[000428a0] 706a                      moveq.l    #106,d0
[000428a2] 4e94                      jsr        (a4)
[000428a4] 93c9                      suba.l     a1,a1
[000428a6] 7005                      moveq.l    #5,d0
[000428a8] 204a                      movea.l    a2,a0
[000428aa] 286b 0008                 movea.l    8(a3),a4
[000428ae] 4e94                      jsr        (a4)
[000428b0] 93c9                      suba.l     a1,a1
[000428b2] 7069                      moveq.l    #105,d0
[000428b4] 204a                      movea.l    a2,a0
[000428b6] 286b 0008                 movea.l    8(a3),a4
[000428ba] 4e94                      jsr        (a4)
[000428bc] 544f                      addq.w     #2,a7
[000428be] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000428c2] 4e75                      rts

wprintf:
[000428c4] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[000428c8] 2448                      movea.l    a0,a2
[000428ca] 76ff                      moveq.l    #-1,d3
[000428cc] 200a                      move.l     a2,d0
[000428ce] 6714                      beq.s      wprintf_1
[000428d0] 47ef 0010                 lea.l      16(a7),a3
[000428d4] 2f0b                      move.l     a3,-(a7)
[000428d6] 206a 0014                 movea.l    20(a2),a0
[000428da] 4eb9 0003 b7b0            jsr        uvprintf
[000428e0] 584f                      addq.w     #4,a7
[000428e2] 3600                      move.w     d0,d3
wprintf_1:
[000428e4] 3003                      move.w     d3,d0
[000428e6] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000428ea] 4e75                      rts

	.data

TEXT_002:
[000d5abc]                           dc.w $0050
[000d5abe]                           dc.b 'ROTOCOL',0
TEXT_03:
[000d5ac6]                           dc.b ' PROTOCOL ',0
TEXT_04:
[000d5ad1]                           dc.b 'PROTOKOLL',0
TEXT_05:
[000d5adb]                           dc.b 'Auf diesem Fenster k”nnen Ausgaben analog zu printf erfolgen!|Ein ACSpro-Feature...',0
TEXT_08:
[000d5b2f]                           dc.b ' Information ',0
[000d5b3d]                           dc.b $00
DATAS_01:
[000d5b3e]                           dc.w $0000
[000d5b40]                           dc.w $0000
[000d5b42]                           dc.w $0208
[000d5b44]                           dc.w $ffff
[000d5b46]                           dc.w $ffc0
[000d5b48]                           dc.w $8000
[000d5b4a]                           dc.w $0040
[000d5b4c]                           dc.w $8000
[000d5b4e]                           dc.w $0040
[000d5b50]                           dc.w $9fff
[000d5b52]                           dc.w $fe78
[000d5b54]                           dc.w $9fff
[000d5b56]                           dc.w $fe58
[000d5b58]                           dc.w $8000
[000d5b5a]                           dc.w $0058
[000d5b5c]                           dc.w $9fff
[000d5b5e]                           dc.w $fe5f
[000d5b60]                           dc.w $9fff
[000d5b62]                           dc.w $fe59
[000d5b64]                           dc.w $8000
[000d5b66]                           dc.w $0059
[000d5b68]                           dc.w $9fff
[000d5b6a]                           dc.w $fe59
[000d5b6c]                           dc.w $9fff
[000d5b6e]                           dc.w $fe59
[000d5b70]                           dc.w $8000
[000d5b72]                           dc.w $0059
[000d5b74]                           dc.w $9fff
[000d5b76]                           dc.w $fe59
[000d5b78]                           dc.w $9fff
[000d5b7a]                           dc.w $fe59
[000d5b7c]                           dc.w $8000
[000d5b7e]                           dc.w $0059
[000d5b80]                           dc.w $9fff
[000d5b82]                           dc.w $fe59
[000d5b84]                           dc.w $9fff
[000d5b86]                           dc.w $fe59
[000d5b88]                           dc.w $8000
[000d5b8a]                           dc.w $0059
[000d5b8c]                           dc.w $9fff
[000d5b8e]                           dc.w $ffd9
[000d5b90]                           dc.w $9fff
[000d5b92]                           dc.w $fed9
[000d5b94]                           dc.w $8000
[000d5b96]                           dc.w $3db9
[000d5b98]                           dc.w $8000
[000d5b9a]                           dc.w $3b79
[000d5b9c]                           dc.w $8000
[000d5b9e]                           dc.w $36f9
[000d5ba0]                           dc.w $8000
[000d5ba2]                           dc.w $2df9
[000d5ba4]                           dc.w $8000
[000d5ba6]                           dc.w $3bf9
[000d5ba8]                           dc.w $ffff
[000d5baa]                           dc.w $f7f9
[000d5bac]                           dc.w $0800
[000d5bae]                           dc.w $0ff9
[000d5bb0]                           dc.w $0fff
[000d5bb2]                           dc.w $fff9
[000d5bb4]                           dc.w $0fff
[000d5bb6]                           dc.w $fff9
[000d5bb8]                           dc.w $0080
[000d5bba]                           dc.w $0001
[000d5bbc]                           dc.w $0080
[000d5bbe]                           dc.w $0001
[000d5bc0]                           dc.w $00ff
[000d5bc2]                           dc.w $ffff
[000d5bc4]                           dc.w $ffff
[000d5bc6]                           dc.w $ffc0
[000d5bc8]                           dc.w $8000
[000d5bca]                           dc.w $0040
[000d5bcc]                           dc.w $8000
[000d5bce]                           dc.w $0040
[000d5bd0]                           dc.w $9fff
[000d5bd2]                           dc.w $fe78
[000d5bd4]                           dc.w $9fff
[000d5bd6]                           dc.w $fe58
[000d5bd8]                           dc.w $8000
[000d5bda]                           dc.w $0058
[000d5bdc]                           dc.w $9fff
[000d5bde]                           dc.w $fe5f
[000d5be0]                           dc.w $9fff
[000d5be2]                           dc.w $fe59
[000d5be4]                           dc.w $8000
[000d5be6]                           dc.w $0059
[000d5be8]                           dc.w $9fff
[000d5bea]                           dc.w $fe59
[000d5bec]                           dc.w $9fff
[000d5bee]                           dc.w $fe59
[000d5bf0]                           dc.w $8000
[000d5bf2]                           dc.w $0059
[000d5bf4]                           dc.w $9fff
[000d5bf6]                           dc.w $fe59
[000d5bf8]                           dc.w $9fff
[000d5bfa]                           dc.w $fe59
[000d5bfc]                           dc.w $8000
[000d5bfe]                           dc.w $0059
[000d5c00]                           dc.w $9fff
[000d5c02]                           dc.w $fe59
[000d5c04]                           dc.w $9fff
[000d5c06]                           dc.w $fe59
[000d5c08]                           dc.w $8000
[000d5c0a]                           dc.w $0059
[000d5c0c]                           dc.w $9fff
[000d5c0e]                           dc.w $ffd9
[000d5c10]                           dc.w $9fff
[000d5c12]                           dc.w $fed9
[000d5c14]                           dc.w $8000
[000d5c16]                           dc.w $3db9
[000d5c18]                           dc.w $8000
[000d5c1a]                           dc.w $3b79
[000d5c1c]                           dc.w $8000
[000d5c1e]                           dc.w $36f9
[000d5c20]                           dc.w $8000
[000d5c22]                           dc.w $2df9
[000d5c24]                           dc.w $8000
[000d5c26]                           dc.w $3bf9
[000d5c28]                           dc.w $ffff
[000d5c2a]                           dc.w $f7f9
[000d5c2c]                           dc.w $0800
[000d5c2e]                           dc.w $0ff9
[000d5c30]                           dc.w $0fff
[000d5c32]                           dc.w $fff9
[000d5c34]                           dc.w $0fff
[000d5c36]                           dc.w $fff9
[000d5c38]                           dc.w $0080
[000d5c3a]                           dc.w $0001
[000d5c3c]                           dc.w $0080
[000d5c3e]                           dc.w $0001
[000d5c40]                           dc.w $00ff
[000d5c42]                           dc.w $ffff
[000d5c44]                           dc.w $ffff
[000d5c46]                           dc.w $ffc0
[000d5c48]                           dc.w $8000
[000d5c4a]                           dc.w $0040
[000d5c4c]                           dc.w $8000
[000d5c4e]                           dc.w $0040
[000d5c50]                           dc.w $8000
[000d5c52]                           dc.w $0078
[000d5c54]                           dc.w $8000
[000d5c56]                           dc.w $0058
[000d5c58]                           dc.w $8000
[000d5c5a]                           dc.w $0058
[000d5c5c]                           dc.w $8000
[000d5c5e]                           dc.w $005f
[000d5c60]                           dc.w $8000
[000d5c62]                           dc.w $0059
[000d5c64]                           dc.w $8000
[000d5c66]                           dc.w $0059
[000d5c68]                           dc.w $8000
[000d5c6a]                           dc.w $0059
[000d5c6c]                           dc.w $8000
[000d5c6e]                           dc.w $0059
[000d5c70]                           dc.w $8000
[000d5c72]                           dc.w $0059
[000d5c74]                           dc.w $8000
[000d5c76]                           dc.w $0059
[000d5c78]                           dc.w $8000
[000d5c7a]                           dc.w $0059
[000d5c7c]                           dc.w $8000
[000d5c7e]                           dc.w $0059
[000d5c80]                           dc.w $8000
[000d5c82]                           dc.w $0059
[000d5c84]                           dc.w $8000
[000d5c86]                           dc.w $0059
[000d5c88]                           dc.w $8000
[000d5c8a]                           dc.w $0059
[000d5c8c]                           dc.w $8000
[000d5c8e]                           dc.w $3fd9
[000d5c90]                           dc.w $8000
[000d5c92]                           dc.w $3ed9
[000d5c94]                           dc.w $8000
[000d5c96]                           dc.w $3db9
[000d5c98]                           dc.w $8000
[000d5c9a]                           dc.w $3b79
[000d5c9c]                           dc.w $8000
[000d5c9e]                           dc.w $36f9
[000d5ca0]                           dc.w $8000
[000d5ca2]                           dc.w $2df9
[000d5ca4]                           dc.w $8000
[000d5ca6]                           dc.w $3bf9
[000d5ca8]                           dc.w $ffff
[000d5caa]                           dc.w $f7f9
[000d5cac]                           dc.w $0800
[000d5cae]                           dc.w $0ff9
[000d5cb0]                           dc.w $0fff
[000d5cb2]                           dc.w $fff9
[000d5cb4]                           dc.w $0fff
[000d5cb6]                           dc.w $fff9
[000d5cb8]                           dc.w $0080
[000d5cba]                           dc.w $0001
[000d5cbc]                           dc.w $0080
[000d5cbe]                           dc.w $0001
[000d5cc0]                           dc.w $00ff
[000d5cc2]                           dc.w $ffff
[000d5cc4]                           dc.w $ffff
[000d5cc6]                           dc.w $ffc0
[000d5cc8]                           dc.w $8000
[000d5cca]                           dc.w $0040
[000d5ccc]                           dc.w $8000
[000d5cce]                           dc.w $0040
[000d5cd0]                           dc.w $8000
[000d5cd2]                           dc.w $0078
[000d5cd4]                           dc.w $9fff
[000d5cd6]                           dc.w $fe68
[000d5cd8]                           dc.w $8000
[000d5cda]                           dc.w $0068
[000d5cdc]                           dc.w $8000
[000d5cde]                           dc.w $006f
[000d5ce0]                           dc.w $9fff
[000d5ce2]                           dc.w $fe6f
[000d5ce4]                           dc.w $8000
[000d5ce6]                           dc.w $006f
[000d5ce8]                           dc.w $8000
[000d5cea]                           dc.w $006f
[000d5cec]                           dc.w $9fff
[000d5cee]                           dc.w $fe6f
[000d5cf0]                           dc.w $8000
[000d5cf2]                           dc.w $006f
[000d5cf4]                           dc.w $8000
[000d5cf6]                           dc.w $006f
[000d5cf8]                           dc.w $9fff
[000d5cfa]                           dc.w $fe6f
[000d5cfc]                           dc.w $8000
[000d5cfe]                           dc.w $006f
[000d5d00]                           dc.w $8000
[000d5d02]                           dc.w $006f
[000d5d04]                           dc.w $9fff
[000d5d06]                           dc.w $fe6f
[000d5d08]                           dc.w $8000
[000d5d0a]                           dc.w $006f
[000d5d0c]                           dc.w $8000
[000d5d0e]                           dc.w $3fef
[000d5d10]                           dc.w $9fff
[000d5d12]                           dc.w $e1ef
[000d5d14]                           dc.w $8000
[000d5d16]                           dc.w $23cf
[000d5d18]                           dc.w $8000
[000d5d1a]                           dc.w $278f
[000d5d1c]                           dc.w $8000
[000d5d1e]                           dc.w $2f0f
[000d5d20]                           dc.w $8000
[000d5d22]                           dc.w $3e0f
[000d5d24]                           dc.w $8000
[000d5d26]                           dc.w $3c0f
[000d5d28]                           dc.w $ffff
[000d5d2a]                           dc.w $f80f
[000d5d2c]                           dc.w $0fff
[000d5d2e]                           dc.w $f00f
[000d5d30]                           dc.w $0800
[000d5d32]                           dc.w $000f
[000d5d34]                           dc.w $0fff
[000d5d36]                           dc.w $ffff
[000d5d38]                           dc.w $00ff
[000d5d3a]                           dc.w $ffff
[000d5d3c]                           dc.w $00ff
[000d5d3e]                           dc.w $ffff
[000d5d40]                           dc.w $00ff
[000d5d42]                           dc.w $ffff
DATAS_02:
[000d5d44]                           dc.w $ffff
[000d5d46]                           dc.w $ffc0
[000d5d48]                           dc.w $ffff
[000d5d4a]                           dc.w $ffc0
[000d5d4c]                           dc.w $ffff
[000d5d4e]                           dc.w $ffc0
[000d5d50]                           dc.w $ffff
[000d5d52]                           dc.w $fff8
[000d5d54]                           dc.w $ffff
[000d5d56]                           dc.w $fff8
[000d5d58]                           dc.w $ffff
[000d5d5a]                           dc.w $fff8
[000d5d5c]                           dc.w $ffff
[000d5d5e]                           dc.w $ffff
[000d5d60]                           dc.w $ffff
[000d5d62]                           dc.w $ffff
[000d5d64]                           dc.w $ffff
[000d5d66]                           dc.w $ffff
[000d5d68]                           dc.w $ffff
[000d5d6a]                           dc.w $ffff
[000d5d6c]                           dc.w $ffff
[000d5d6e]                           dc.w $ffff
[000d5d70]                           dc.w $ffff
[000d5d72]                           dc.w $ffff
[000d5d74]                           dc.w $ffff
[000d5d76]                           dc.w $ffff
[000d5d78]                           dc.w $ffff
[000d5d7a]                           dc.w $ffff
[000d5d7c]                           dc.w $ffff
[000d5d7e]                           dc.w $ffff
[000d5d80]                           dc.w $ffff
[000d5d82]                           dc.w $ffff
[000d5d84]                           dc.w $ffff
[000d5d86]                           dc.w $ffff
[000d5d88]                           dc.w $ffff
[000d5d8a]                           dc.w $ffff
[000d5d8c]                           dc.w $ffff
[000d5d8e]                           dc.w $ffff
[000d5d90]                           dc.w $ffff
[000d5d92]                           dc.w $ffff
[000d5d94]                           dc.w $ffff
[000d5d96]                           dc.w $ffff
[000d5d98]                           dc.w $ffff
[000d5d9a]                           dc.w $ffff
[000d5d9c]                           dc.w $ffff
[000d5d9e]                           dc.w $ffff
[000d5da0]                           dc.w $ffff
[000d5da2]                           dc.w $ffff
[000d5da4]                           dc.w $ffff
[000d5da6]                           dc.w $ffff
[000d5da8]                           dc.w $ffff
[000d5daa]                           dc.w $ffff
[000d5dac]                           dc.w $0fff
[000d5dae]                           dc.w $ffff
[000d5db0]                           dc.w $0fff
[000d5db2]                           dc.w $ffff
[000d5db4]                           dc.w $0fff
[000d5db6]                           dc.w $ffff
[000d5db8]                           dc.w $00ff
[000d5dba]                           dc.w $ffff
[000d5dbc]                           dc.w $00ff
[000d5dbe]                           dc.w $ffff
[000d5dc0]                           dc.w $00ff
[000d5dc2]                           dc.w $ffff
DATAS_03:
[000d5dc4]                           dc.w $0000
[000d5dc6]                           dc.w $0000
[000d5dc8]                           dc.w $0208
[000d5dca]                           dc.w $ffff
[000d5dcc]                           dc.w $ffc0
[000d5dce]                           dc.w $8000
[000d5dd0]                           dc.w $0040
[000d5dd2]                           dc.w $8000
[000d5dd4]                           dc.w $0040
[000d5dd6]                           dc.w $9fff
[000d5dd8]                           dc.w $fe78
[000d5dda]                           dc.w $9fff
[000d5ddc]                           dc.w $fe78
[000d5dde]                           dc.w $8000
[000d5de0]                           dc.w $0078
[000d5de2]                           dc.w $9fff
[000d5de4]                           dc.w $fe7f
[000d5de6]                           dc.w $9fff
[000d5de8]                           dc.w $fe7f
[000d5dea]                           dc.w $8000
[000d5dec]                           dc.w $007f
[000d5dee]                           dc.w $9fff
[000d5df0]                           dc.w $fe7f
[000d5df2]                           dc.w $9fff
[000d5df4]                           dc.w $fe7f
[000d5df6]                           dc.w $8000
[000d5df8]                           dc.w $007f
[000d5dfa]                           dc.w $9fff
[000d5dfc]                           dc.w $fe7f
[000d5dfe]                           dc.w $9fff
[000d5e00]                           dc.w $fe7f
[000d5e02]                           dc.w $8000
[000d5e04]                           dc.w $007f
[000d5e06]                           dc.w $9fff
[000d5e08]                           dc.w $fe7f
[000d5e0a]                           dc.w $9fff
[000d5e0c]                           dc.w $fe7f
[000d5e0e]                           dc.w $8000
[000d5e10]                           dc.w $007f
[000d5e12]                           dc.w $9fff
[000d5e14]                           dc.w $ffff
[000d5e16]                           dc.w $9fff
[000d5e18]                           dc.w $feff
[000d5e1a]                           dc.w $8000
[000d5e1c]                           dc.w $3dff
[000d5e1e]                           dc.w $8000
[000d5e20]                           dc.w $3bff
[000d5e22]                           dc.w $8000
[000d5e24]                           dc.w $37ff
[000d5e26]                           dc.w $8000
[000d5e28]                           dc.w $2fff
[000d5e2a]                           dc.w $8000
[000d5e2c]                           dc.w $3fff
[000d5e2e]                           dc.w $ffff
[000d5e30]                           dc.w $ffff
[000d5e32]                           dc.w $0fff
[000d5e34]                           dc.w $ffff
[000d5e36]                           dc.w $0fff
[000d5e38]                           dc.w $ffff
[000d5e3a]                           dc.w $0fff
[000d5e3c]                           dc.w $ffff
[000d5e3e]                           dc.w $00ff
[000d5e40]                           dc.w $ffff
[000d5e42]                           dc.w $00ff
[000d5e44]                           dc.w $ffff
[000d5e46]                           dc.w $00ff
[000d5e48]                           dc.w $ffff
[000d5e4a]                           dc.w $ffff
[000d5e4c]                           dc.w $ffc0
[000d5e4e]                           dc.w $8000
[000d5e50]                           dc.w $0040
[000d5e52]                           dc.w $8000
[000d5e54]                           dc.w $0040
[000d5e56]                           dc.w $9fff
[000d5e58]                           dc.w $fe78
[000d5e5a]                           dc.w $9fff
[000d5e5c]                           dc.w $fe78
[000d5e5e]                           dc.w $8000
[000d5e60]                           dc.w $0078
[000d5e62]                           dc.w $9fff
[000d5e64]                           dc.w $fe7f
[000d5e66]                           dc.w $9fff
[000d5e68]                           dc.w $fe7f
[000d5e6a]                           dc.w $8000
[000d5e6c]                           dc.w $007f
[000d5e6e]                           dc.w $9fff
[000d5e70]                           dc.w $fe7f
[000d5e72]                           dc.w $9fff
[000d5e74]                           dc.w $fe7f
[000d5e76]                           dc.w $8000
[000d5e78]                           dc.w $007f
[000d5e7a]                           dc.w $9fff
[000d5e7c]                           dc.w $fe7f
[000d5e7e]                           dc.w $9fff
[000d5e80]                           dc.w $fe7f
[000d5e82]                           dc.w $8000
[000d5e84]                           dc.w $007f
[000d5e86]                           dc.w $9fff
[000d5e88]                           dc.w $fe7f
[000d5e8a]                           dc.w $9fff
[000d5e8c]                           dc.w $fe7f
[000d5e8e]                           dc.w $8000
[000d5e90]                           dc.w $007f
[000d5e92]                           dc.w $9fff
[000d5e94]                           dc.w $ffff
[000d5e96]                           dc.w $9fff
[000d5e98]                           dc.w $feff
[000d5e9a]                           dc.w $8000
[000d5e9c]                           dc.w $3dff
[000d5e9e]                           dc.w $8000
[000d5ea0]                           dc.w $3bff
[000d5ea2]                           dc.w $8000
[000d5ea4]                           dc.w $37ff
[000d5ea6]                           dc.w $8000
[000d5ea8]                           dc.w $2fff
[000d5eaa]                           dc.w $8000
[000d5eac]                           dc.w $3fff
[000d5eae]                           dc.w $ffff
[000d5eb0]                           dc.w $ffff
[000d5eb2]                           dc.w $0fff
[000d5eb4]                           dc.w $ffff
[000d5eb6]                           dc.w $0fff
[000d5eb8]                           dc.w $ffff
[000d5eba]                           dc.w $0fff
[000d5ebc]                           dc.w $ffff
[000d5ebe]                           dc.w $00ff
[000d5ec0]                           dc.w $ffff
[000d5ec2]                           dc.w $00ff
[000d5ec4]                           dc.w $ffff
[000d5ec6]                           dc.w $00ff
[000d5ec8]                           dc.w $ffff
[000d5eca]                           dc.w $ffff
[000d5ecc]                           dc.w $ffc0
[000d5ece]                           dc.w $8000
[000d5ed0]                           dc.w $0040
[000d5ed2]                           dc.w $8000
[000d5ed4]                           dc.w $0040
[000d5ed6]                           dc.w $8000
[000d5ed8]                           dc.w $0078
[000d5eda]                           dc.w $8000
[000d5edc]                           dc.w $0048
[000d5ede]                           dc.w $8000
[000d5ee0]                           dc.w $0048
[000d5ee2]                           dc.w $8000
[000d5ee4]                           dc.w $004f
[000d5ee6]                           dc.w $8000
[000d5ee8]                           dc.w $0049
[000d5eea]                           dc.w $8000
[000d5eec]                           dc.w $0049
[000d5eee]                           dc.w $8000
[000d5ef0]                           dc.w $0049
[000d5ef2]                           dc.w $8000
[000d5ef4]                           dc.w $0049
[000d5ef6]                           dc.w $8000
[000d5ef8]                           dc.w $0049
[000d5efa]                           dc.w $8000
[000d5efc]                           dc.w $0049
[000d5efe]                           dc.w $8000
[000d5f00]                           dc.w $0049
[000d5f02]                           dc.w $8000
[000d5f04]                           dc.w $0049
[000d5f06]                           dc.w $8000
[000d5f08]                           dc.w $0049
[000d5f0a]                           dc.w $8000
[000d5f0c]                           dc.w $0049
[000d5f0e]                           dc.w $8000
[000d5f10]                           dc.w $0049
[000d5f12]                           dc.w $8000
[000d5f14]                           dc.w $3fc9
[000d5f16]                           dc.w $8000
[000d5f18]                           dc.w $3ec9
[000d5f1a]                           dc.w $8000
[000d5f1c]                           dc.w $3d89
[000d5f1e]                           dc.w $8000
[000d5f20]                           dc.w $3b09
[000d5f22]                           dc.w $8000
[000d5f24]                           dc.w $3609
[000d5f26]                           dc.w $8000
[000d5f28]                           dc.w $2c09
[000d5f2a]                           dc.w $8000
[000d5f2c]                           dc.w $3809
[000d5f2e]                           dc.w $ffff
[000d5f30]                           dc.w $f009
[000d5f32]                           dc.w $0800
[000d5f34]                           dc.w $0009
[000d5f36]                           dc.w $0800
[000d5f38]                           dc.w $0009
[000d5f3a]                           dc.w $0fff
[000d5f3c]                           dc.w $fff9
[000d5f3e]                           dc.w $0080
[000d5f40]                           dc.w $0001
[000d5f42]                           dc.w $0080
[000d5f44]                           dc.w $0001
[000d5f46]                           dc.w $00ff
[000d5f48]                           dc.w $ffff
[000d5f4a]                           dc.w $ffff
[000d5f4c]                           dc.w $ffc0
[000d5f4e]                           dc.w $8000
[000d5f50]                           dc.w $0040
[000d5f52]                           dc.w $8000
[000d5f54]                           dc.w $0040
[000d5f56]                           dc.w $8000
[000d5f58]                           dc.w $0078
[000d5f5a]                           dc.w $9fff
[000d5f5c]                           dc.w $fe68
[000d5f5e]                           dc.w $8000
[000d5f60]                           dc.w $0068
[000d5f62]                           dc.w $8000
[000d5f64]                           dc.w $006f
[000d5f66]                           dc.w $9fff
[000d5f68]                           dc.w $fe6f
[000d5f6a]                           dc.w $8000
[000d5f6c]                           dc.w $006f
[000d5f6e]                           dc.w $8000
[000d5f70]                           dc.w $006f
[000d5f72]                           dc.w $9fff
[000d5f74]                           dc.w $fe6f
[000d5f76]                           dc.w $8000
[000d5f78]                           dc.w $006f
[000d5f7a]                           dc.w $8000
[000d5f7c]                           dc.w $006f
[000d5f7e]                           dc.w $9fff
[000d5f80]                           dc.w $fe6f
[000d5f82]                           dc.w $8000
[000d5f84]                           dc.w $006f
[000d5f86]                           dc.w $8000
[000d5f88]                           dc.w $006f
[000d5f8a]                           dc.w $9fff
[000d5f8c]                           dc.w $fe6f
[000d5f8e]                           dc.w $8000
[000d5f90]                           dc.w $006f
[000d5f92]                           dc.w $8000
[000d5f94]                           dc.w $3fef
[000d5f96]                           dc.w $9fff
[000d5f98]                           dc.w $e1ef
[000d5f9a]                           dc.w $8000
[000d5f9c]                           dc.w $23cf
[000d5f9e]                           dc.w $8000
[000d5fa0]                           dc.w $278f
[000d5fa2]                           dc.w $8000
[000d5fa4]                           dc.w $2f0f
[000d5fa6]                           dc.w $8000
[000d5fa8]                           dc.w $3e0f
[000d5faa]                           dc.w $8000
[000d5fac]                           dc.w $3c0f
[000d5fae]                           dc.w $ffff
[000d5fb0]                           dc.w $f80f
[000d5fb2]                           dc.w $0fff
[000d5fb4]                           dc.w $f00f
[000d5fb6]                           dc.w $0800
[000d5fb8]                           dc.w $000f
[000d5fba]                           dc.w $0fff
[000d5fbc]                           dc.w $ffff
[000d5fbe]                           dc.w $00ff
[000d5fc0]                           dc.w $ffff
[000d5fc2]                           dc.w $00ff
[000d5fc4]                           dc.w $ffff
[000d5fc6]                           dc.w $00ff
[000d5fc8]                           dc.w $ffff
DATAS_04:
[000d5fca]                           dc.w $ffff
[000d5fcc]                           dc.w $ffc0
[000d5fce]                           dc.w $ffff
[000d5fd0]                           dc.w $ffc0
[000d5fd2]                           dc.w $ffff
[000d5fd4]                           dc.w $ffc0
[000d5fd6]                           dc.w $ffff
[000d5fd8]                           dc.w $fff8
[000d5fda]                           dc.w $ffff
[000d5fdc]                           dc.w $fff8
[000d5fde]                           dc.w $ffff
[000d5fe0]                           dc.w $fff8
[000d5fe2]                           dc.w $ffff
[000d5fe4]                           dc.w $ffff
[000d5fe6]                           dc.w $ffff
[000d5fe8]                           dc.w $ffff
[000d5fea]                           dc.w $ffff
[000d5fec]                           dc.w $ffff
[000d5fee]                           dc.w $ffff
[000d5ff0]                           dc.w $ffff
[000d5ff2]                           dc.w $ffff
[000d5ff4]                           dc.w $ffff
[000d5ff6]                           dc.w $ffff
[000d5ff8]                           dc.w $ffff
[000d5ffa]                           dc.w $ffff
[000d5ffc]                           dc.w $ffff
[000d5ffe]                           dc.w $ffff
[000d6000]                           dc.w $ffff
[000d6002]                           dc.w $ffff
[000d6004]                           dc.w $ffff
[000d6006]                           dc.w $ffff
[000d6008]                           dc.w $ffff
[000d600a]                           dc.w $ffff
[000d600c]                           dc.w $ffff
[000d600e]                           dc.w $ffff
[000d6010]                           dc.w $ffff
[000d6012]                           dc.w $ffff
[000d6014]                           dc.w $ffff
[000d6016]                           dc.w $ffff
[000d6018]                           dc.w $ffff
[000d601a]                           dc.w $ffff
[000d601c]                           dc.w $ffff
[000d601e]                           dc.w $ffff
[000d6020]                           dc.w $ffff
[000d6022]                           dc.w $ffff
[000d6024]                           dc.w $ffff
[000d6026]                           dc.w $ffff
[000d6028]                           dc.w $ffff
[000d602a]                           dc.w $ffff
[000d602c]                           dc.w $ffff
[000d602e]                           dc.w $ffff
[000d6030]                           dc.w $ffff
[000d6032]                           dc.w $0fff
[000d6034]                           dc.w $ffff
[000d6036]                           dc.w $0fff
[000d6038]                           dc.w $ffff
[000d603a]                           dc.w $0fff
[000d603c]                           dc.w $ffff
[000d603e]                           dc.w $00ff
[000d6040]                           dc.w $ffff
[000d6042]                           dc.w $00ff
[000d6044]                           dc.w $ffff
[000d6046]                           dc.w $00ff
[000d6048]                           dc.w $ffff
A_3DBUTTON02:
[000d604a] 00064a22                  dc.l A_3Dbutton
[000d604e]                           dc.w $2021
[000d6050]                           dc.w $9178
[000d6052] 000630f2                  dc.l Auo_string
[000d6056]                           dc.w $0000
[000d6058]                           dc.w $0000
[000d605a]                           dc.w $0000
[000d605c]                           dc.w $0000
[000d605e]                           dc.w $0000
[000d6060]                           dc.w $0000
[000d6062]                           dc.w $0000
[000d6064]                           dc.w $0000
[000d6066]                           dc.w $0000
[000d6068]                           dc.w $0000
A_3DBUTTON04:
[000d606a] 00064a22                  dc.l A_3Dbutton
[000d606e]                           dc.w $29f1
[000d6070]                           dc.w $01f8
[000d6072] 000630f2                  dc.l Auo_string
[000d6076]                           dc.w $0000
[000d6078]                           dc.w $0000
[000d607a]                           dc.w $0000
[000d607c]                           dc.w $0000
[000d607e]                           dc.w $0000
[000d6080]                           dc.w $0000
[000d6082]                           dc.w $0000
[000d6084]                           dc.w $0000
[000d6086]                           dc.w $0000
[000d6088]                           dc.w $0000
A_FTEXT02:
[000d608a] 0006639a                  dc.l A_ftext
[000d608e]                           dc.w $0001
[000d6090]                           dc.w $000d
[000d6092] 00066924                  dc.l Auo_ftext
[000d6096] 000d5adb                  dc.l TEXT_05
[000d609a]                           dc.w $0000
[000d609c]                           dc.w $0000
[000d609e]                           dc.w $0000
[000d60a0]                           dc.w $0000
[000d60a2]                           dc.w $0000
[000d60a4]                           dc.w $0000
[000d60a6]                           dc.w $0000
[000d60a8]                           dc.w $0000
_C4_PROTO_ICON:
[000d60aa]                           dc.w $0004
[000d60ac] 000d5b44                  dc.l $000d5b44
[000d60b0] 000d5d44                  dc.l DATAS_02
[000d60b4] 000d5dca                  dc.l $000d5dca
[000d60b8] 000d5fca                  dc.l DATAS_04
[000d60bc]                           dc.w $0000
[000d60be]                           dc.w $0000
_MSK_PROTO_ICON:
[000d60c0]                           dc.w $0000
[000d60c2]                           dc.w $0000
[000d60c4]                           dc.w $0000
[000d60c6]                           dc.w $0000
[000d60c8]                           dc.w $0fff
[000d60ca]                           dc.w $ff00
[000d60cc]                           dc.w $0fff
[000d60ce]                           dc.w $ff00
[000d60d0]                           dc.w $0fff
[000d60d2]                           dc.w $ff40
[000d60d4]                           dc.w $0fff
[000d60d6]                           dc.w $ff40
[000d60d8]                           dc.w $0fff
[000d60da]                           dc.w $ff50
[000d60dc]                           dc.w $0fff
[000d60de]                           dc.w $ff50
[000d60e0]                           dc.w $0fff
[000d60e2]                           dc.w $ff50
[000d60e4]                           dc.w $0fff
[000d60e6]                           dc.w $ff50
[000d60e8]                           dc.w $0fff
[000d60ea]                           dc.w $ff50
[000d60ec]                           dc.w $0fff
[000d60ee]                           dc.w $ff50
[000d60f0]                           dc.w $0fff
[000d60f2]                           dc.w $ff50
[000d60f4]                           dc.w $0fff
[000d60f6]                           dc.w $ff50
[000d60f8]                           dc.w $0fff
[000d60fa]                           dc.w $ff50
[000d60fc]                           dc.w $0fff
[000d60fe]                           dc.w $ff50
[000d6100]                           dc.w $0fff
[000d6102]                           dc.w $ff50
[000d6104]                           dc.w $0fff
[000d6106]                           dc.w $ff50
[000d6108]                           dc.w $0fff
[000d610a]                           dc.w $ff50
[000d610c]                           dc.w $0fff
[000d610e]                           dc.w $ff50
[000d6110]                           dc.w $0fff
[000d6112]                           dc.w $ff50
[000d6114]                           dc.w $0fff
[000d6116]                           dc.w $c050
[000d6118]                           dc.w $0fff
[000d611a]                           dc.w $de50
[000d611c]                           dc.w $0fff
[000d611e]                           dc.w $dcd0
[000d6120]                           dc.w $0fff
[000d6122]                           dc.w $d9d0
[000d6124]                           dc.w $0fff
[000d6126]                           dc.w $d3d0
[000d6128]                           dc.w $0fff
[000d612a]                           dc.w $c7d0
[000d612c]                           dc.w $0000
[000d612e]                           dc.w $0fd0
[000d6130]                           dc.w $03ff
[000d6132]                           dc.w $ffd0
[000d6134]                           dc.w $0000
[000d6136]                           dc.w $0010
[000d6138]                           dc.w $00ff
[000d613a]                           dc.w $fff0
[000d613c]                           dc.w $0000
[000d613e]                           dc.w $0000
_DAT_PROTO_ICON:
[000d6140]                           dc.w $0000
[000d6142]                           dc.w $0000
[000d6144]                           dc.w $1fff
[000d6146]                           dc.w $ff80
[000d6148]                           dc.w $1000
[000d614a]                           dc.w $0080
[000d614c]                           dc.w $1000
[000d614e]                           dc.w $00e0
[000d6150]                           dc.w $1000
[000d6152]                           dc.w $00a0
[000d6154]                           dc.w $1000
[000d6156]                           dc.w $00b8
[000d6158]                           dc.w $1000
[000d615a]                           dc.w $00a8
[000d615c]                           dc.w $1000
[000d615e]                           dc.w $00a8
[000d6160]                           dc.w $1000
[000d6162]                           dc.w $00a8
[000d6164]                           dc.w $1000
[000d6166]                           dc.w $00a8
[000d6168]                           dc.w $1000
[000d616a]                           dc.w $00a8
[000d616c]                           dc.w $1000
[000d616e]                           dc.w $00a8
[000d6170]                           dc.w $1000
[000d6172]                           dc.w $00a8
[000d6174]                           dc.w $1000
[000d6176]                           dc.w $00a8
[000d6178]                           dc.w $1000
[000d617a]                           dc.w $00a8
[000d617c]                           dc.w $1000
[000d617e]                           dc.w $00a8
[000d6180]                           dc.w $1000
[000d6182]                           dc.w $00a8
[000d6184]                           dc.w $1000
[000d6186]                           dc.w $00a8
[000d6188]                           dc.w $1000
[000d618a]                           dc.w $00a8
[000d618c]                           dc.w $1000
[000d618e]                           dc.w $00a8
[000d6190]                           dc.w $1000
[000d6192]                           dc.w $00a8
[000d6194]                           dc.w $1000
[000d6196]                           dc.w $3fa8
[000d6198]                           dc.w $1000
[000d619a]                           dc.w $21a8
[000d619c]                           dc.w $1000
[000d619e]                           dc.w $2328
[000d61a0]                           dc.w $1000
[000d61a2]                           dc.w $2628
[000d61a4]                           dc.w $1000
[000d61a6]                           dc.w $2c28
[000d61a8]                           dc.w $1000
[000d61aa]                           dc.w $3828
[000d61ac]                           dc.w $1fff
[000d61ae]                           dc.w $f028
[000d61b0]                           dc.w $0400
[000d61b2]                           dc.w $0028
[000d61b4]                           dc.w $07ff
[000d61b6]                           dc.w $ffe8
[000d61b8]                           dc.w $0100
[000d61ba]                           dc.w $0008
[000d61bc]                           dc.w $01ff
[000d61be]                           dc.w $fff8
PROTO_ICON:
[000d61c0] 000d60c0                  dc.l _MSK_PROTO_ICON
[000d61c4] 000d6140                  dc.l _DAT_PROTO_ICON
[000d61c8] 000d5ad1                  dc.l TEXT_04
[000d61cc]                           dc.w $1000
[000d61ce]                           dc.w $0000
[000d61d0]                           dc.w $0000
[000d61d2]                           dc.w $0014
[000d61d4]                           dc.w $0000
[000d61d6]                           dc.w $0020
[000d61d8]                           dc.w $0020
[000d61da]                           dc.w $0000
[000d61dc]                           dc.w $0020
[000d61de]                           dc.w $0048
[000d61e0]                           dc.w $0008
[000d61e2] 000d60aa                  dc.l _C4_PROTO_ICON
_MSK_PROT_ICON:
[000d61e6]                           dc.w $0fff
[000d61e8]                           dc.w $ffff
[000d61ea]                           dc.w $ff00
[000d61ec]                           dc.w $0fff
[000d61ee]                           dc.w $ffff
[000d61f0]                           dc.w $ff80
[000d61f2]                           dc.w $0fff
[000d61f4]                           dc.w $ffff
[000d61f6]                           dc.w $fffc
[000d61f8]                           dc.w $0fff
[000d61fa]                           dc.w $ffff
[000d61fc]                           dc.w $fffc
[000d61fe]                           dc.w $0fff
[000d6200]                           dc.w $ffff
[000d6202]                           dc.w $fffc
[000d6204]                           dc.w $0fff
[000d6206]                           dc.w $ffff
[000d6208]                           dc.w $fffc
[000d620a]                           dc.w $0fff
[000d620c]                           dc.w $ffff
[000d620e]                           dc.w $fffc
[000d6210]                           dc.w $0fff
[000d6212]                           dc.w $ffff
[000d6214]                           dc.w $fffc
[000d6216]                           dc.w $0fff
[000d6218]                           dc.w $ffff
[000d621a]                           dc.w $fffc
[000d621c]                           dc.w $0fff
[000d621e]                           dc.w $ffff
[000d6220]                           dc.w $fffc
[000d6222]                           dc.w $0fff
[000d6224]                           dc.w $ffff
[000d6226]                           dc.w $fffc
[000d6228]                           dc.w $0fff
[000d622a]                           dc.w $ffff
[000d622c]                           dc.w $fffc
[000d622e]                           dc.w $0fff
[000d6230]                           dc.w $ffff
[000d6232]                           dc.w $fffc
[000d6234]                           dc.w $0fff
[000d6236]                           dc.w $ffff
[000d6238]                           dc.w $fffc
[000d623a]                           dc.w $0fff
[000d623c]                           dc.w $ffff
[000d623e]                           dc.w $fffc
[000d6240]                           dc.w $0fff
[000d6242]                           dc.w $ffff
[000d6244]                           dc.w $fffc
[000d6246]                           dc.w $0fff
[000d6248]                           dc.w $ffff
[000d624a]                           dc.w $fffc
[000d624c]                           dc.w $0fff
[000d624e]                           dc.w $ffff
[000d6250]                           dc.w $fffc
[000d6252]                           dc.w $0fff
[000d6254]                           dc.w $ffff
[000d6256]                           dc.w $fffc
[000d6258]                           dc.w $0fff
[000d625a]                           dc.w $ffff
[000d625c]                           dc.w $fffc
[000d625e]                           dc.w $0fff
[000d6260]                           dc.w $ffff
[000d6262]                           dc.w $fffc
[000d6264]                           dc.w $0fff
[000d6266]                           dc.w $ffff
[000d6268]                           dc.w $fffc
[000d626a]                           dc.w $0fff
[000d626c]                           dc.w $ffff
[000d626e]                           dc.w $fffc
[000d6270]                           dc.w $0fff
[000d6272]                           dc.w $ffff
[000d6274]                           dc.w $fffc
[000d6276]                           dc.w $0fff
[000d6278]                           dc.w $ffff
[000d627a]                           dc.w $fffc
[000d627c]                           dc.w $0fff
[000d627e]                           dc.w $ffff
[000d6280]                           dc.w $fffc
[000d6282]                           dc.w $0fff
[000d6284]                           dc.w $ffff
[000d6286]                           dc.w $fffc
[000d6288]                           dc.w $0fff
[000d628a]                           dc.w $ffff
[000d628c]                           dc.w $fffc
[000d628e]                           dc.w $0fff
[000d6290]                           dc.w $ffff
[000d6292]                           dc.w $fffc
[000d6294]                           dc.w $03ff
[000d6296]                           dc.w $ffff
[000d6298]                           dc.w $fffc
[000d629a]                           dc.w $03ff
[000d629c]                           dc.w $ffff
[000d629e]                           dc.w $fffc
_DAT_PROT_ICON:
[000d62a0]                           dc.w $0fff
[000d62a2]                           dc.w $ffff
[000d62a4]                           dc.w $ff00
[000d62a6]                           dc.w $0800
[000d62a8]                           dc.w $0000
[000d62aa]                           dc.w $0180
[000d62ac]                           dc.w $0800
[000d62ae]                           dc.w $0000
[000d62b0]                           dc.w $017c
[000d62b2]                           dc.w $0a39
[000d62b4]                           dc.w $9fdf
[000d62b6]                           dc.w $7124
[000d62b8]                           dc.w $0839
[000d62ba]                           dc.w $9fdf
[000d62bc]                           dc.w $71f4
[000d62be]                           dc.w $0800
[000d62c0]                           dc.w $0000
[000d62c2]                           dc.w $0014
[000d62c4]                           dc.w $0a00
[000d62c6]                           dc.w $0000
[000d62c8]                           dc.w $0054
[000d62ca]                           dc.w $083d
[000d62cc]                           dc.w $df75
[000d62ce]                           dc.w $e414
[000d62d0]                           dc.w $0800
[000d62d2]                           dc.w $0000
[000d62d4]                           dc.w $0014
[000d62d6]                           dc.w $0a00
[000d62d8]                           dc.w $0000
[000d62da]                           dc.w $0054
[000d62dc]                           dc.w $0827
[000d62de]                           dc.w $cf9e
[000d62e0]                           dc.w $7c14
[000d62e2]                           dc.w $0800
[000d62e4]                           dc.w $0000
[000d62e6]                           dc.w $0014
[000d62e8]                           dc.w $0a00
[000d62ea]                           dc.w $0000
[000d62ec]                           dc.w $0054
[000d62ee]                           dc.w $081f
[000d62f0]                           dc.w $79ef
[000d62f2]                           dc.w $cc14
[000d62f4]                           dc.w $0800
[000d62f6]                           dc.w $0000
[000d62f8]                           dc.w $0014
[000d62fa]                           dc.w $0a00
[000d62fc]                           dc.w $0000
[000d62fe]                           dc.w $0054
[000d6300]                           dc.w $0837
[000d6302]                           dc.w $bf3d
[000d6304]                           dc.w $dc14
[000d6306]                           dc.w $0800
[000d6308]                           dc.w $0000
[000d630a]                           dc.w $0014
[000d630c]                           dc.w $0a00
[000d630e]                           dc.w $0000
[000d6310]                           dc.w $0054
[000d6312]                           dc.w $083c
[000d6314]                           dc.w $f7d7
[000d6316]                           dc.w $7c14
[000d6318]                           dc.w $0800
[000d631a]                           dc.w $0000
[000d631c]                           dc.w $0014
[000d631e]                           dc.w $0a00
[000d6320]                           dc.w $0000
[000d6322]                           dc.w $0054
[000d6324]                           dc.w $0837
[000d6326]                           dc.w $defe
[000d6328]                           dc.w $ec14
[000d632a]                           dc.w $0800
[000d632c]                           dc.w $0000
[000d632e]                           dc.w $0014
[000d6330]                           dc.w $0a00
[000d6332]                           dc.w $0000
[000d6334]                           dc.w $0054
[000d6336]                           dc.w $0800
[000d6338]                           dc.w $0000
[000d633a]                           dc.w $0014
[000d633c]                           dc.w $0800
[000d633e]                           dc.w $0000
[000d6340]                           dc.w $0014
[000d6342]                           dc.w $0800
[000d6344]                           dc.w $0000
[000d6346]                           dc.w $0014
[000d6348]                           dc.w $0fff
[000d634a]                           dc.w $ffff
[000d634c]                           dc.w $fff4
[000d634e]                           dc.w $0200
[000d6350]                           dc.w $0000
[000d6352]                           dc.w $0004
[000d6354]                           dc.w $03ff
[000d6356]                           dc.w $ffff
[000d6358]                           dc.w $fffc
PROT_ICON:
[000d635a] 000d61e6                  dc.l _MSK_PROT_ICON
[000d635e] 000d62a0                  dc.l _DAT_PROT_ICON
[000d6362] 000d5abd                  dc.l TEXT_02
[000d6366]                           dc.w $1000
[000d6368]                           dc.w $0000
[000d636a]                           dc.w $0000
[000d636c]                           dc.w $000c
[000d636e]                           dc.w $0000
[000d6370]                           dc.w $0030
[000d6372]                           dc.w $001f
[000d6374]                           dc.w $0000
[000d6376]                           dc.w $0020
[000d6378]                           dc.w $0048
[000d637a]                           dc.w $0008
[000d637c]                           dc.w $0000
[000d637e]                           dc.w $0000
INFOBOX:
[000d6380]                           dc.w $ffff
[000d6382]                           dc.w $0001
[000d6384]                           dc.w $0001
[000d6386]                           dc.w $0019
[000d6388]                           dc.w $0040
[000d638a]                           dc.w $0000
[000d638c]                           dc.w $00ff
[000d638e]                           dc.w $1141
[000d6390]                           dc.w $0000
[000d6392]                           dc.w $0000
[000d6394]                           dc.w $001c
[000d6396]                           dc.w $0006
_01_INFOBOX:
[000d6398]                           dc.w $0000
[000d639a]                           dc.w $0002
[000d639c]                           dc.w $0002
[000d639e]                           dc.w $0018
[000d63a0]                           dc.w $0040
[000d63a2]                           dc.w $0010
[000d63a4] 000d606a                  dc.l A_3DBUTTON04
[000d63a8]                           dc.w $0000
[000d63aa]                           dc.w $0000
[000d63ac]                           dc.w $001c
[000d63ae]                           dc.w $0006
_02_INFOBOX:
[000d63b0]                           dc.w $0001
[000d63b2]                           dc.w $0003
[000d63b4]                           dc.w $0003
[000d63b6]                           dc.w $0018
[000d63b8]                           dc.w $0040
[000d63ba]                           dc.w $0000
[000d63bc] 000d604a                  dc.l A_3DBUTTON02
[000d63c0]                           dc.w $0002
[000d63c2]                           dc.w $0001
[000d63c4]                           dc.w $0018
[000d63c6]                           dc.w $0004
_03_INFOBOX:
[000d63c8]                           dc.w $0002
[000d63ca]                           dc.w $ffff
[000d63cc]                           dc.w $ffff
[000d63ce]                           dc.w $0018
[000d63d0]                           dc.w $0060
[000d63d2]                           dc.w $0000
[000d63d4] 000d608a                  dc.l A_FTEXT02
[000d63d8]                           dc.w $0000
[000d63da]                           dc.w $0000
[000d63dc]                           dc.w $0018
[000d63de]                           dc.w $0004
PROTOCOL:
[000d63e0]                           dc.w $0000
[000d63e2]                           dc.w $0000
[000d63e4] 000426ea                  dc.l proto_service
[000d63e8] 00042532                  dc.l proto_make
[000d63ec] 00057428                  dc.l Awi_open
[000d63f0] 00055e94                  dc.l Awi_init
[000d63f4]                           dc.w $0000
[000d63f6]                           dc.w $0000
[000d63f8]                           dc.w $0000
[000d63fa]                           dc.w $0000
[000d63fc]                           dc.w $0000
[000d63fe]                           dc.w $0000
[000d6400]                           dc.w $ffff
[000d6402]                           dc.w $4fef
[000d6404]                           dc.w $0000
[000d6406]                           dc.w $0000
[000d6408]                           dc.w $0063
[000d640a]                           dc.w $0063
[000d640c]                           dc.w $0000
[000d640e]                           dc.w $0000
[000d6410]                           dc.w $0000
[000d6412]                           dc.w $0000
[000d6414]                           dc.w $0000
[000d6416]                           dc.w $0000
[000d6418]                           dc.w $0000
[000d641a]                           dc.w $0000
[000d641c]                           dc.w $ffff
[000d641e]                           dc.w $ffff
[000d6420]                           dc.w $ffff
[000d6422]                           dc.w $ffff
[000d6424]                           dc.w $0000
[000d6426]                           dc.w $0000
[000d6428]                           dc.w $fefe
[000d642a] 000d5ac6                  dc.l TEXT_03
[000d642e] 000d5abc                  dc.l TEXT_002
[000d6432]                           dc.w $2710
[000d6434]                           dc.w $0103
[000d6436]                           dc.w $0000
[000d6438]                           dc.w $ffff
[000d643a] 000d61c0                  dc.l PROTO_ICON
[000d643e]                           dc.w $0000
[000d6440]                           dc.w $0000
[000d6442] 0006b744                  dc.l Awi_keys
[000d6446] 00051852                  dc.l Awi_obchange
[000d644a] 00051c46                  dc.l Awi_redraw
[000d644e] 000587a4                  dc.l Awi_topped
[000d6452] 00058362                  dc.l Awi_closed
[000d6456] 000422ee                  dc.l proto_fulled
[000d645a] 0004237a                  dc.l proto_arrowed
[000d645e] 000424f2                  dc.l proto_hslid
[000d6462] 00042884                  dc.l proto_vslid
[000d6466] 000427da                  dc.l proto_sized
[000d646a] 00042782                  dc.l proto_moved
[000d646e] 0005998a                  dc.l Awi_iconify
[000d6472] 00059c6c                  dc.l Awi_uniconify
[000d6476] 0005b5b6                  dc.l Awi_gemscript
[000d647a]                           dc.w $0000
[000d647c]                           dc.w $0000
[000d647e]                           dc.w $0000
[000d6480]                           dc.w $0000
WIPR_INFO:
[000d6482]                           dc.w $0000
[000d6484]                           dc.w $0000
[000d6486] 00059dd0                  dc.l Awi_service
[000d648a] 00056c16                  dc.l Awi_selfcreate
[000d648e] 00057428                  dc.l Awi_open
[000d6492] 00055e94                  dc.l Awi_init
[000d6496] 000d6380                  dc.l INFOBOX
[000d649a]                           dc.w $0000
[000d649c]                           dc.w $0000
[000d649e]                           dc.w $0000
[000d64a0]                           dc.w $0000
[000d64a2]                           dc.w $ffff
[000d64a4]                           dc.w $000b
[000d64a6]                           dc.w $0000
[000d64a8]                           dc.w $0000
[000d64aa]                           dc.w $0078
[000d64ac]                           dc.w $0032
[000d64ae]                           dc.w $0000
[000d64b0]                           dc.w $0000
[000d64b2]                           dc.w $0000
[000d64b4]                           dc.w $0000
[000d64b6]                           dc.w $0000
[000d64b8]                           dc.w $0000
[000d64ba]                           dc.w $0000
[000d64bc]                           dc.w $0000
[000d64be]                           dc.w $ffff
[000d64c0]                           dc.w $ffff
[000d64c2]                           dc.w $ffff
[000d64c4]                           dc.w $ffff
[000d64c6]                           dc.w $0000
[000d64c8]                           dc.w $0000
[000d64ca]                           dc.w $f8f8
[000d64cc] 000d5b2f                  dc.l TEXT_08
[000d64d0] 000d5abc                  dc.l TEXT_002
[000d64d4]                           dc.w $2710
[000d64d6]                           dc.w $0000
[000d64d8]                           dc.w $0000
[000d64da]                           dc.w $ffff
[000d64dc]                           dc.w $0000
[000d64de]                           dc.w $0000
[000d64e0]                           dc.w $0000
[000d64e2]                           dc.w $0000
[000d64e4] 0006b744                  dc.l Awi_keys
[000d64e8] 00051852                  dc.l Awi_obchange
[000d64ec] 00051c46                  dc.l Awi_redraw
[000d64f0] 000587a4                  dc.l Awi_topped
[000d64f4] 00058362                  dc.l Awi_closed
[000d64f8] 000587ec                  dc.l Awi_fulled
[000d64fc] 0005217c                  dc.l Awi_arrowed
[000d6500] 000524b4                  dc.l Awi_hslid
[000d6504] 0005255e                  dc.l Awi_vslid
[000d6508] 00058bb0                  dc.l Awi_sized
[000d650c] 00058d50                  dc.l Awi_moved
[000d6510] 0005998a                  dc.l Awi_iconify
[000d6514] 00059c6c                  dc.l Awi_uniconify
[000d6518] 0005b5b6                  dc.l Awi_gemscript
[000d651c]                           dc.w $0000
[000d651e]                           dc.w $0000
[000d6520]                           dc.w $0000
[000d6522]                           dc.w $0000
euser:
[000d6524] 00037bfa                  dc.l A_editor
[000d6528]                           dc.w $0000
[000d652a]                           dc.w $0000
[000d652c] 0003a772                  dc.l Auo_editor
[000d6530]                           dc.w $0000
[000d6532]                           dc.w $0000
[000d6534]                           dc.w $0000
[000d6536]                           dc.w $0000
[000d6538]                           dc.w $0000
[000d653a]                           dc.w $0000
[000d653c]                           dc.w $0000
[000d653e]                           dc.w $0000
[000d6540]                           dc.w $0000
[000d6542]                           dc.w $0000
vslider:
[000d6544] 00037828                  dc.l A_wislider
[000d6548]                           dc.w $0000
[000d654a]                           dc.w $0001
[000d654c] 00037834                  dc.l Auo_wislider
[000d6550]                           dc.w $0000
[000d6552]                           dc.w $0000
[000d6554]                           dc.w $0000
[000d6556]                           dc.w $0000
[000d6558]                           dc.w $0000
[000d655a]                           dc.w $0000
[000d655c]                           dc.w $0000
[000d655e]                           dc.w $0000
[000d6560]                           dc.w $0000
[000d6562]                           dc.w $0000
hslider:
[000d6564] 00037828                  dc.l A_wislider
[000d6568]                           dc.w $0000
[000d656a]                           dc.w $0000
[000d656c] 00037834                  dc.l Auo_wislider
[000d6570]                           dc.w $0000
[000d6572]                           dc.w $0000
[000d6574]                           dc.w $0000
[000d6576]                           dc.w $0000
[000d6578]                           dc.w $0000
[000d657a]                           dc.w $0000
[000d657c]                           dc.w $0000
[000d657e]                           dc.w $0000
[000d6580]                           dc.w $0000
[000d6582]                           dc.w $0000
edit:
[000d6584]                           dc.w $ffff
[000d6586]                           dc.w $ffff
[000d6588]                           dc.w $ffff
[000d658a]                           dc.w $0018
[000d658c]                           dc.w $0000
[000d658e]                           dc.w $8000
[000d6590] 000d6524                  dc.l euser
[000d6594]                           dc.w $0000
[000d6596]                           dc.w $0000
[000d6598]                           dc.w $0028
[000d659a]                           dc.w $000a
edit0:
[000d659c]                           dc.w $0000
[000d659e]                           dc.w $0000
[000d65a0]                           dc.w $0000
[000d65a2]                           dc.w $0000
[000d65a4]                           dc.w $8000
[000d65a6]                           dc.w $0000
[000d65a8]                           dc.w $0000
[000d65aa]                           dc.w $0000
[000d65ac]                           dc.w $0000
[000d65ae]                           dc.w $0000
[000d65b0]                           dc.w $0000
[000d65b2]                           dc.w $0000
hor:
[000d65b4]                           dc.w $ffff
[000d65b6]                           dc.w $ffff
[000d65b8]                           dc.w $ffff
[000d65ba]                           dc.w $0018
[000d65bc]                           dc.w $0000
[000d65be]                           dc.w $0000
[000d65c0] 000d6564                  dc.l hslider
[000d65c4]                           dc.w $0000
[000d65c6]                           dc.w $0000
[000d65c8]                           dc.w $0000
[000d65ca]                           dc.w $0000
ver:
[000d65cc]                           dc.w $ffff
[000d65ce]                           dc.w $ffff
[000d65d0]                           dc.w $ffff
[000d65d2]                           dc.w $0018
[000d65d4]                           dc.w $0020
[000d65d6]                           dc.w $0000
[000d65d8] 000d6544                  dc.l vslider
[000d65dc]                           dc.w $0000
[000d65de]                           dc.w $0000
[000d65e0]                           dc.w $0000
[000d65e2]                           dc.w $0000
def:
[000d65e4]                           dc.w $0001
[000d65e6]                           dc.w $000d
[000d65e8]                           dc.w $0028
[000d65ea]                           dc.w $000f
[000d65ec]                           dc.w $0004
[000d65ee]                           dc.w $0100
[000d65f0]                           dc.w $0000
[000d65f2]                           dc.w $0000
