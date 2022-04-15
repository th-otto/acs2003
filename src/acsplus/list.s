AddItem:
[000412ae] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[000412b2] 2448                      movea.l    a0,a2
[000412b4] 7600                      moveq.l    #0,d3
[000412b6] 2650                      movea.l    (a0),a3
[000412b8] 2849                      movea.l    a1,a4
[000412ba] 202b 0090                 move.l     144(a3),d0
[000412be] 675e                      beq.s      $0004131E
[000412c0] 6002                      bra.s      $000412C4
[000412c2] 5283                      addq.l     #1,d3
[000412c4] b6ab 0090                 cmp.l      144(a3),d3
[000412c8] 6c28                      bge.s      $000412F2
[000412ca] 2f13                      move.l     (a3),-(a7)
[000412cc] 224c                      movea.l    a4,a1
[000412ce] 2f09                      move.l     a1,-(a7)
[000412d0] 2003                      move.l     d3,d0
[000412d2] 222b 0084                 move.l     132(a3),d1
[000412d6] 4eb9 0008 3cac            jsr        _lmul
[000412dc] 206b 0094                 movea.l    148(a3),a0
[000412e0] d1c0                      adda.l     d0,a0
[000412e2] 2a6b 00a4                 movea.l    164(a3),a5
[000412e6] 225f                      movea.l    (a7)+,a1
[000412e8] 4e95                      jsr        (a5)
[000412ea] 584f                      addq.w     #4,a7
[000412ec] 3800                      move.w     d0,d4
[000412ee] 5240                      addq.w     #1,d0
[000412f0] 67d0                      beq.s      $000412C2
[000412f2] b87c fffe                 cmp.w      #$FFFE,d4
[000412f6] 6604                      bne.s      $000412FC
[000412f8] 262b 0090                 move.l     144(a3),d3
[000412fc] b6ab 0090                 cmp.l      144(a3),d3
[00041300] 6c1c                      bge.s      $0004131E
[00041302] 4a44                      tst.w      d4
[00041304] 6618                      bne.s      $0004131E
[00041306] 2053                      movea.l    (a3),a0
[00041308] 7003                      moveq.l    #3,d0
[0004130a] 226b 00b4                 movea.l    180(a3),a1
[0004130e] 4e91                      jsr        (a1)
[00041310] 5340                      subq.w     #1,d0
[00041312] 6654                      bne.s      $00041368
[00041314] 2003                      move.l     d3,d0
[00041316] 204a                      movea.l    a2,a0
[00041318] 4eb9 0004 1450            jsr        DeleteItem
[0004131e] 7001                      moveq.l    #1,d0
[00041320] d0ab 0090                 add.l      144(a3),d0
[00041324] b0ab 0088                 cmp.l      136(a3),d0
[00041328] 6f00 00a2                 ble        $000413CC
[0004132c] 202b 0084                 move.l     132(a3),d0
[00041330] 222b 0088                 move.l     136(a3),d1
[00041334] d2ab 008c                 add.l      140(a3),d1
[00041338] 4eb9 0008 3cac            jsr        _lmul
[0004133e] 4eb9 0004 c608            jsr        Ax_malloc
[00041344] 2848                      movea.l    a0,a4
[00041346] 200c                      move.l     a4,d0
[00041348] 6624                      bne.s      $0004136E
[0004134a] 2053                      movea.l    (a3),a0
[0004134c] 7001                      moveq.l    #1,d0
[0004134e] 226b 00b4                 movea.l    180(a3),a1
[00041352] 4e91                      jsr        (a1)
[00041354] 4a40                      tst.w      d0
[00041356] 6610                      bne.s      $00041368
[00041358] 91c8                      suba.l     a0,a0
[0004135a] 7003                      moveq.l    #3,d0
[0004135c] 2279 0010 ee4e            movea.l    ACSblk,a1
[00041362] 2269 03d6                 movea.l    982(a1),a1
[00041366] 4e91                      jsr        (a1)
[00041368] 4240                      clr.w      d0
[0004136a] 6000 00de                 bra        $0004144A
[0004136e] 202b 008c                 move.l     140(a3),d0
[00041372] 222b 0084                 move.l     132(a3),d1
[00041376] 4eb9 0008 3cac            jsr        _lmul
[0004137c] 2200                      move.l     d0,d1
[0004137e] 2f01                      move.l     d1,-(a7)
[00041380] 202b 0084                 move.l     132(a3),d0
[00041384] 222b 0088                 move.l     136(a3),d1
[00041388] 4eb9 0008 3cac            jsr        _lmul
[0004138e] 41f4 0800                 lea.l      0(a4,d0.l),a0
[00041392] 4240                      clr.w      d0
[00041394] 221f                      move.l     (a7)+,d1
[00041396] 4eb9 0008 36ea            jsr        memset
[0004139c] 202b 0084                 move.l     132(a3),d0
[000413a0] 222b 0088                 move.l     136(a3),d1
[000413a4] 4eb9 0008 3cac            jsr        _lmul
[000413aa] 226b 0094                 movea.l    148(a3),a1
[000413ae] 204c                      movea.l    a4,a0
[000413b0] 4eb9 0008 3500            jsr        memcpy
[000413b6] 206b 0094                 movea.l    148(a3),a0
[000413ba] 4eb9 0004 c7c8            jsr        Ax_free
[000413c0] 274c 0094                 move.l     a4,148(a3)
[000413c4] 202b 008c                 move.l     140(a3),d0
[000413c8] d1ab 0088                 add.l      d0,136(a3)
[000413cc] b6ab 0090                 cmp.l      144(a3),d3
[000413d0] 6c44                      bge.s      $00041416
[000413d2] 202b 0090                 move.l     144(a3),d0
[000413d6] 9083                      sub.l      d3,d0
[000413d8] 222b 0084                 move.l     132(a3),d1
[000413dc] 4eb9 0008 3cac            jsr        _lmul
[000413e2] 2f00                      move.l     d0,-(a7)
[000413e4] 2003                      move.l     d3,d0
[000413e6] 222b 0084                 move.l     132(a3),d1
[000413ea] 4eb9 0008 3cac            jsr        _lmul
[000413f0] 226b 0094                 movea.l    148(a3),a1
[000413f4] d3c0                      adda.l     d0,a1
[000413f6] 2f09                      move.l     a1,-(a7)
[000413f8] 7001                      moveq.l    #1,d0
[000413fa] d083                      add.l      d3,d0
[000413fc] 222b 0084                 move.l     132(a3),d1
[00041400] 4eb9 0008 3cac            jsr        _lmul
[00041406] 206b 0094                 movea.l    148(a3),a0
[0004140a] d1c0                      adda.l     d0,a0
[0004140c] 225f                      movea.l    (a7)+,a1
[0004140e] 201f                      move.l     (a7)+,d0
[00041410] 4eb9 0008 3500            jsr        memcpy
[00041416] 202b 0084                 move.l     132(a3),d0
[0004141a] 224c                      movea.l    a4,a1
[0004141c] 2f00                      move.l     d0,-(a7)
[0004141e] 2f09                      move.l     a1,-(a7)
[00041420] 2003                      move.l     d3,d0
[00041422] 222b 0084                 move.l     132(a3),d1
[00041426] 4eb9 0008 3cac            jsr        _lmul
[0004142c] 206b 0094                 movea.l    148(a3),a0
[00041430] d1c0                      adda.l     d0,a0
[00041432] 225f                      movea.l    (a7)+,a1
[00041434] 201f                      move.l     (a7)+,d0
[00041436] 4eb9 0008 3500            jsr        memcpy
[0004143c] 52ab 0090                 addq.l     #1,144(a3)
[00041440] 00ab 0000 0001 009c       ori.l      #$00000001,156(a3)
[00041448] 7001                      moveq.l    #1,d0
[0004144a] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0004144e] 4e75                      rts
DeleteItem:
[00041450] 2f03                      move.l     d3,-(a7)
[00041452] 2f0a                      move.l     a2,-(a7)
[00041454] 2600                      move.l     d0,d3
[00041456] 2450                      movea.l    (a0),a2
[00041458] b0aa 0090                 cmp.l      144(a2),d0
[0004145c] 6c04                      bge.s      $00041462
[0004145e] 4a80                      tst.l      d0
[00041460] 6a0e                      bpl.s      $00041470
[00041462] 2052                      movea.l    (a2),a0
[00041464] 7002                      moveq.l    #2,d0
[00041466] 226a 00b4                 movea.l    180(a2),a1
[0004146a] 4e91                      jsr        (a1)
[0004146c] 4240                      clr.w      d0
[0004146e] 6054                      bra.s      $000414C4
[00041470] 202a 0084                 move.l     132(a2),d0
[00041474] 222a 0090                 move.l     144(a2),d1
[00041478] 9283                      sub.l      d3,d1
[0004147a] 5381                      subq.l     #1,d1
[0004147c] 4eb9 0008 3cac            jsr        _lmul
[00041482] 2f00                      move.l     d0,-(a7)
[00041484] 7001                      moveq.l    #1,d0
[00041486] d083                      add.l      d3,d0
[00041488] 222a 0084                 move.l     132(a2),d1
[0004148c] 4eb9 0008 3cac            jsr        _lmul
[00041492] 226a 0094                 movea.l    148(a2),a1
[00041496] d3c0                      adda.l     d0,a1
[00041498] 2f09                      move.l     a1,-(a7)
[0004149a] 2003                      move.l     d3,d0
[0004149c] 222a 0084                 move.l     132(a2),d1
[000414a0] 4eb9 0008 3cac            jsr        _lmul
[000414a6] 206a 0094                 movea.l    148(a2),a0
[000414aa] d1c0                      adda.l     d0,a0
[000414ac] 225f                      movea.l    (a7)+,a1
[000414ae] 201f                      move.l     (a7)+,d0
[000414b0] 4eb9 0008 3500            jsr        memcpy
[000414b6] 53aa 0090                 subq.l     #1,144(a2)
[000414ba] 00aa 0000 0001 009c       ori.l      #$00000001,156(a2)
[000414c2] 7001                      moveq.l    #1,d0
[000414c4] 245f                      movea.l    (a7)+,a2
[000414c6] 261f                      move.l     (a7)+,d3
[000414c8] 4e75                      rts
GetItem:
[000414ca] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[000414ce] 2600                      move.l     d0,d3
[000414d0] 2649                      movea.l    a1,a3
[000414d2] 2450                      movea.l    (a0),a2
[000414d4] b0aa 0090                 cmp.l      144(a2),d0
[000414d8] 6c04                      bge.s      $000414DE
[000414da] 4a80                      tst.l      d0
[000414dc] 6a0e                      bpl.s      $000414EC
[000414de] 2052                      movea.l    (a2),a0
[000414e0] 7002                      moveq.l    #2,d0
[000414e2] 226a 00b4                 movea.l    180(a2),a1
[000414e6] 4e91                      jsr        (a1)
[000414e8] 4240                      clr.w      d0
[000414ea] 6024                      bra.s      $00041510
[000414ec] 202a 0084                 move.l     132(a2),d0
[000414f0] 2f00                      move.l     d0,-(a7)
[000414f2] 2003                      move.l     d3,d0
[000414f4] 222a 0084                 move.l     132(a2),d1
[000414f8] 4eb9 0008 3cac            jsr        _lmul
[000414fe] 226a 0094                 movea.l    148(a2),a1
[00041502] d3c0                      adda.l     d0,a1
[00041504] 204b                      movea.l    a3,a0
[00041506] 201f                      move.l     (a7)+,d0
[00041508] 4eb9 0008 3500            jsr        memcpy
[0004150e] 7001                      moveq.l    #1,d0
[00041510] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00041514] 4e75                      rts
ReplaceItem:
[00041516] 2f0a                      move.l     a2,-(a7)
[00041518] 2f0b                      move.l     a3,-(a7)
[0004151a] 2448                      movea.l    a0,a2
[0004151c] 2649                      movea.l    a1,a3
[0004151e] 6100 ff30                 bsr        DeleteItem
[00041522] 4a40                      tst.w      d0
[00041524] 6710                      beq.s      $00041536
[00041526] 224b                      movea.l    a3,a1
[00041528] 204a                      movea.l    a2,a0
[0004152a] 6100 fd82                 bsr        AddItem
[0004152e] 4a40                      tst.w      d0
[00041530] 6704                      beq.s      $00041536
[00041532] 7001                      moveq.l    #1,d0
[00041534] 6002                      bra.s      $00041538
[00041536] 4240                      clr.w      d0
[00041538] 265f                      movea.l    (a7)+,a3
[0004153a] 245f                      movea.l    (a7)+,a2
[0004153c] 4e75                      rts
UpdateList:
[0004153e] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00041542] 4fef fdfe                 lea.l      -514(a7),a7
[00041546] 2448                      movea.l    a0,a2
[00041548] 2650                      movea.l    (a0),a3
[0004154a] 93c9                      suba.l     a1,a1
[0004154c] 303c 00e2                 move.w     #$00E2,d0
[00041550] 206a 0014                 movea.l    20(a2),a0
[00041554] 4eb9 0003 a772            jsr        Auo_editor
[0004155a] 93c9                      suba.l     a1,a1
[0004155c] 303c 00ce                 move.w     #$00CE,d0
[00041560] 206a 0014                 movea.l    20(a2),a0
[00041564] 4eb9 0003 a772            jsr        Auo_editor
[0004156a] 7600                      moveq.l    #0,d3
[0004156c] 6048                      bra.s      $000415B6
[0004156e] 2003                      move.l     d3,d0
[00041570] 222b 0084                 move.l     132(a3),d1
[00041574] 4eb9 0008 3cac            jsr        _lmul
[0004157a] 286b 0094                 movea.l    148(a3),a4
[0004157e] d9c0                      adda.l     d0,a4
[00041580] 2f13                      move.l     (a3),-(a7)
[00041582] 224c                      movea.l    a4,a1
[00041584] 41ef 0004                 lea.l      4(a7),a0
[00041588] 2a6b 00b8                 movea.l    184(a3),a5
[0004158c] 4e95                      jsr        (a5)
[0004158e] 584f                      addq.w     #4,a7
[00041590] 4a83                      tst.l      d3
[00041592] 6710                      beq.s      $000415A4
[00041594] 93c9                      suba.l     a1,a1
[00041596] 303c 00cb                 move.w     #$00CB,d0
[0004159a] 206a 0014                 movea.l    20(a2),a0
[0004159e] 4eb9 0003 a772            jsr        Auo_editor
[000415a4] 43d7                      lea.l      (a7),a1
[000415a6] 303c 00cc                 move.w     #$00CC,d0
[000415aa] 206a 0014                 movea.l    20(a2),a0
[000415ae] 4eb9 0003 a772            jsr        Auo_editor
[000415b4] 5283                      addq.l     #1,d3
[000415b6] b6ab 0090                 cmp.l      144(a3),d3
[000415ba] 6db2                      blt.s      $0004156E
[000415bc] 93c9                      suba.l     a1,a1
[000415be] 7006                      moveq.l    #6,d0
[000415c0] 206a 0014                 movea.l    20(a2),a0
[000415c4] 4eb9 0003 a772            jsr        Auo_editor
[000415ca] 93c9                      suba.l     a1,a1
[000415cc] 303c 00e6                 move.w     #$00E6,d0
[000415d0] 206a 0014                 movea.l    20(a2),a0
[000415d4] 4eb9 0003 a772            jsr        Auo_editor
[000415da] 7001                      moveq.l    #1,d0
[000415dc] 4fef 0202                 lea.l      514(a7),a7
[000415e0] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[000415e4] 4e75                      rts
full_list:
[000415e6] 48e7 0038                 movem.l    a2-a4,-(a7)
[000415ea] 2448                      movea.l    a0,a2
[000415ec] 47ea 0024                 lea.l      36(a2),a3
[000415f0] 49ea 002c                 lea.l      44(a2),a4
[000415f4] 7001                      moveq.l    #1,d0
[000415f6] c06a 0056                 and.w      86(a2),d0
[000415fa] 6724                      beq.s      $00041620
[000415fc] 3694                      move.w     (a4),(a3)
[000415fe] 376c 0002 0002            move.w     2(a4),2(a3)
[00041604] 376c 0004 0004            move.w     4(a4),4(a3)
[0004160a] 376c 0006 0006            move.w     6(a4),6(a3)
[00041610] 224c                      movea.l    a4,a1
[00041612] 4eb9 0004 21ce            jsr        size_list
[00041618] 026a fffe 0056            andi.w     #$FFFE,86(a2)
[0004161e] 602a                      bra.s      $0004164A
[00041620] 3893                      move.w     (a3),(a4)
[00041622] 396b 0002 0002            move.w     2(a3),2(a4)
[00041628] 396b 0004 0004            move.w     4(a3),4(a4)
[0004162e] 396b 0006 0006            move.w     6(a3),6(a4)
[00041634] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004163a] 5049                      addq.w     #8,a1
[0004163c] 204a                      movea.l    a2,a0
[0004163e] 4eb9 0004 21ce            jsr        size_list
[00041644] 006a 0001 0056            ori.w      #$0001,86(a2)
[0004164a] 3f2b 0006                 move.w     6(a3),-(a7)
[0004164e] 3f2b 0004                 move.w     4(a3),-(a7)
[00041652] 3f2b 0002                 move.w     2(a3),-(a7)
[00041656] 3f13                      move.w     (a3),-(a7)
[00041658] 7205                      moveq.l    #5,d1
[0004165a] 302a 0020                 move.w     32(a2),d0
[0004165e] 4eb9 0007 f926            jsr        wind_set
[00041664] 504f                      addq.w     #8,a7
[00041666] 4eb9 0004 b086            jsr        Aev_mess
[0004166c] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00041670] 4e75                      rts
selline:
[00041672] 2f0a                      move.l     a2,-(a7)
[00041674] 2f0b                      move.l     a3,-(a7)
[00041676] 4fef fff0                 lea.l      -16(a7),a7
[0004167a] 2448                      movea.l    a0,a2
[0004167c] 2f40 000c                 move.l     d0,12(a7)
[00041680] 2649                      movea.l    a1,a3
[00041682] 4a80                      tst.l      d0
[00041684] 6a12                      bpl.s      $00041698
[00041686] 43ef 000c                 lea.l      12(a7),a1
[0004168a] 303c 00e9                 move.w     #$00E9,d0
[0004168e] 4eb9 0003 a772            jsr        Auo_editor
[00041694] 53af 000c                 subq.l     #1,12(a7)
[00041698] 202f 000c                 move.l     12(a7),d0
[0004169c] 2740 0008                 move.l     d0,8(a3)
[000416a0] 2680                      move.l     d0,(a3)
[000416a2] 2e80                      move.l     d0,(a7)
[000416a4] 43d7                      lea.l      (a7),a1
[000416a6] 204a                      movea.l    a2,a0
[000416a8] 303c 00ca                 move.w     #$00CA,d0
[000416ac] 4eb9 0003 a772            jsr        Auo_editor
[000416b2] 42ab 0004                 clr.l      4(a3)
[000416b6] 276f 0004 000c            move.l     4(a7),12(a3)
[000416bc] 4fef 0010                 lea.l      16(a7),a7
[000416c0] 265f                      movea.l    (a7)+,a3
[000416c2] 245f                      movea.l    (a7)+,a2
[000416c4] 4e75                      rts
key_list:
[000416c6] 48e7 181c                 movem.l    d3-d4/a3-a5,-(a7)
[000416ca] 4fef fff0                 lea.l      -16(a7),a7
[000416ce] 2648                      movea.l    a0,a3
[000416d0] 3800                      move.w     d0,d4
[000416d2] 3601                      move.w     d1,d3
[000416d4] 43f9 000d 5a5c            lea.l      $000D5A5C,a1
[000416da] 41d7                      lea.l      (a7),a0
[000416dc] 740f                      moveq.l    #15,d2
[000416de] 10d9                      move.b     (a1)+,(a0)+
[000416e0] 51ca fffc                 dbf        d2,$000416DE
[000416e4] 2853                      movea.l    (a3),a4
[000416e6] b63c 000e                 cmp.b      #$0E,d3
[000416ea] 660e                      bne.s      $000416FA
[000416ec] 2054                      movea.l    (a4),a0
[000416ee] 226c 00b4                 movea.l    180(a4),a1
[000416f2] 7004                      moveq.l    #4,d0
[000416f4] 4e91                      jsr        (a1)
[000416f6] 6000 0128                 bra        $00041820
[000416fa] 202c 0090                 move.l     144(a4),d0
[000416fe] 6700 00d8                 beq        $000417D8
[00041702] 2079 0010 ee4e            movea.l    ACSblk,a0
[00041708] 214b 0258                 move.l     a3,600(a0)
[0004170c] 2a6b 0014                 movea.l    20(a3),a5
[00041710] 43d7                      lea.l      (a7),a1
[00041712] 303c 00e3                 move.w     #$00E3,d0
[00041716] 204d                      movea.l    a5,a0
[00041718] 4eb9 0003 a772            jsr        Auo_editor
[0004171e] 1003                      move.b     d3,d0
[00041720] 4880                      ext.w      d0
[00041722] b07c 000f                 cmp.w      #$000F,d0
[00041726] 6200 00a2                 bhi        $000417CA
[0004172a] d040                      add.w      d0,d0
[0004172c] 303b 0006                 move.w     $00041734(pc,d0.w),d0
[00041730] 4efb 0002                 jmp        $00041734(pc,d0.w)
J33:
[00041734] 0096                      dc.w $0096   ; $000417ca-$00041734
[00041736] 0020                      dc.w $0020   ; $00041754-$00041734
[00041738] 002e                      dc.w $002e   ; $00041762-$00041734
[0004173a] 0096                      dc.w $0096   ; $000417ca-$00041734
[0004173c] 0096                      dc.w $0096   ; $000417ca-$00041734
[0004173e] 0096                      dc.w $0096   ; $000417ca-$00041734
[00041740] 0096                      dc.w $0096   ; $000417ca-$00041734
[00041742] 0096                      dc.w $0096   ; $000417ca-$00041734
[00041744] 0096                      dc.w $0096   ; $000417ca-$00041734
[00041746] 0096                      dc.w $0096   ; $000417ca-$00041734
[00041748] 0096                      dc.w $0096   ; $000417ca-$00041734
[0004174a] 0096                      dc.w $0096   ; $000417ca-$00041734
[0004174c] 0062                      dc.w $0062   ; $00041796-$00041734
[0004174e] 0076                      dc.w $0076   ; $000417aa-$00041734
[00041750] 0096                      dc.w $0096   ; $000417ca-$00041734
[00041752] 0082                      dc.w $0082   ; $000417b6-$00041734
[00041754] 2017                      move.l     (a7),d0
[00041756] 6f32                      ble.s      $0004178A
[00041758] 5397                      subq.l     #1,(a7)
[0004175a] 53af 0008                 subq.l     #1,8(a7)
[0004175e] 6000 0096                 bra        $000417F6
[00041762] 2017                      move.l     (a7),d0
[00041764] 6b38                      bmi.s      $0004179E
[00041766] 72ff                      moveq.l    #-1,d1
[00041768] d2ac 0090                 add.l      144(a4),d1
[0004176c] b081                      cmp.l      d1,d0
[0004176e] 6c2e                      bge.s      $0004179E
[00041770] 5297                      addq.l     #1,(a7)
[00041772] 2017                      move.l     (a7),d0
[00041774] b0ac 0090                 cmp.l      144(a4),d0
[00041778] 6c24                      bge.s      $0004179E
[0004177a] 52af 0008                 addq.l     #1,8(a7)
[0004177e] 202f 0008                 move.l     8(a7),d0
[00041782] b0ac 0090                 cmp.l      144(a4),d0
[00041786] 6d00 006e                 blt.w      $000417F6
[0004178a] 43d7                      lea.l      (a7),a1
[0004178c] 70ff                      moveq.l    #-1,d0
[0004178e] 204d                      movea.l    a5,a0
[00041790] 6100 fee0                 bsr        selline
[00041794] 6060                      bra.s      $000417F6
[00041796] 3003                      move.w     d3,d0
[00041798] c07c 0300                 and.w      #$0300,d0
[0004179c] 66ec                      bne.s      $0004178A
[0004179e] 43d7                      lea.l      (a7),a1
[000417a0] 7000                      moveq.l    #0,d0
[000417a2] 204d                      movea.l    a5,a0
[000417a4] 6100 fecc                 bsr        selline
[000417a8] 604c                      bra.s      $000417F6
[000417aa] 2017                      move.l     (a7),d0
[000417ac] 6b1c                      bmi.s      $000417CA
[000417ae] 4eb9 0004 1cb6            jsr        list_open
[000417b4] 604e                      bra.s      $00041804
[000417b6] 2017                      move.l     (a7),d0
[000417b8] 6b10                      bmi.s      $000417CA
[000417ba] 93c9                      suba.l     a1,a1
[000417bc] 204d                      movea.l    a5,a0
[000417be] 303c 00e2                 move.w     #$00E2,d0
[000417c2] 4eb9 0003 a772            jsr        Auo_editor
[000417c8] 603a                      bra.s      $00041804
[000417ca] 2054                      movea.l    (a4),a0
[000417cc] 3003                      move.w     d3,d0
[000417ce] 226c 00b0                 movea.l    176(a4),a1
[000417d2] 4e91                      jsr        (a1)
[000417d4] 2e80                      move.l     d0,(a7)
[000417d6] 6a0e                      bpl.s      $000417E6
[000417d8] 3203                      move.w     d3,d1
[000417da] 3004                      move.w     d4,d0
[000417dc] 204b                      movea.l    a3,a0
[000417de] 4eb9 0006 b744            jsr        Awi_keys
[000417e4] 603c                      bra.s      $00041822
[000417e6] 2017                      move.l     (a7),d0
[000417e8] b0ac 0090                 cmp.l      144(a4),d0
[000417ec] 6c9c                      bge.s      $0004178A
[000417ee] 43d7                      lea.l      (a7),a1
[000417f0] 204d                      movea.l    a5,a0
[000417f2] 6100 fe7e                 bsr        selline
[000417f6] 43d7                      lea.l      (a7),a1
[000417f8] 303c 00e4                 move.w     #$00E4,d0
[000417fc] 204d                      movea.l    a5,a0
[000417fe] 4eb9 0003 a772            jsr        Auo_editor
[00041804] 93c9                      suba.l     a1,a1
[00041806] 303c 00db                 move.w     #$00DB,d0
[0004180a] 204d                      movea.l    a5,a0
[0004180c] 4eb9 0003 a772            jsr        Auo_editor
[00041812] 93c9                      suba.l     a1,a1
[00041814] 303c 00e6                 move.w     #$00E6,d0
[00041818] 204d                      movea.l    a5,a0
[0004181a] 4eb9 0003 a772            jsr        Auo_editor
[00041820] 70ff                      moveq.l    #-1,d0
[00041822] 4fef 0010                 lea.l      16(a7),a7
[00041826] 4cdf 3818                 movem.l    (a7)+,d3-d4/a3-a5
[0004182a] 4e75                      rts
list_acc:
[0004182c] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[00041830] 4243                      clr.w      d3
[00041832] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00041838] 2052                      movea.l    (a2),a0
[0004183a] 3028 0246                 move.w     582(a0),d0
[0004183e] 6700 0088                 beq        $000418C8
[00041842] 2268 0258                 movea.l    600(a0),a1
[00041846] 2651                      movea.l    (a1),a3
[00041848] 4eb9 0004 7e1e            jsr        Adr_start
[0004184e] 6060                      bra.s      $000418B0
[00041850] 3004                      move.w     d4,d0
[00041852] c07c 1000                 and.w      #$1000,d0
[00041856] 6720                      beq.s      $00041878
[00041858] 3404                      move.w     d4,d2
[0004185a] c47c 0fff                 and.w      #$0FFF,d2
[0004185e] 48c2                      ext.l      d2
[00041860] 2202                      move.l     d2,d1
[00041862] d281                      add.l      d1,d1
[00041864] d282                      add.l      d2,d1
[00041866] e789                      lsl.l      #3,d1
[00041868] 2052                      movea.l    (a2),a0
[0004186a] 2268 0240                 movea.l    576(a0),a1
[0004186e] 2869 0018                 movea.l    24(a1),a4
[00041872] 49f4 1818                 lea.l      24(a4,d1.l),a4
[00041876] 601a                      bra.s      $00041892
[00041878] 3204                      move.w     d4,d1
[0004187a] 48c1                      ext.l      d1
[0004187c] 2001                      move.l     d1,d0
[0004187e] d080                      add.l      d0,d0
[00041880] d081                      add.l      d1,d0
[00041882] e788                      lsl.l      #3,d0
[00041884] 2052                      movea.l    (a2),a0
[00041886] 2268 0240                 movea.l    576(a0),a1
[0004188a] 2869 0014                 movea.l    20(a1),a4
[0004188e] 49f4 0818                 lea.l      24(a4,d0.l),a4
[00041892] 2253                      movea.l    (a3),a1
[00041894] 204c                      movea.l    a4,a0
[00041896] 2a6b 00a0                 movea.l    160(a3),a5
[0004189a] 4e95                      jsr        (a5)
[0004189c] 5340                      subq.w     #1,d0
[0004189e] 6610                      bne.s      $000418B0
[000418a0] 7601                      moveq.l    #1,d3
[000418a2] 3004                      move.w     d4,d0
[000418a4] 2052                      movea.l    (a2),a0
[000418a6] 2068 0240                 movea.l    576(a0),a0
[000418aa] 4eb9 0004 7f76            jsr        Adr_del
[000418b0] 4eb9 0004 7e2a            jsr        Adr_next
[000418b6] 3800                      move.w     d0,d4
[000418b8] 6a96                      bpl.s      $00041850
[000418ba] 4a43                      tst.w      d3
[000418bc] 670a                      beq.s      $000418C8
[000418be] 2052                      movea.l    (a2),a0
[000418c0] 2068 0258                 movea.l    600(a0),a0
[000418c4] 6100 fc78                 bsr        UpdateList
[000418c8] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[000418cc] 4e75                      rts
list_click:
[000418ce] 48e7 003e                 movem.l    a2-a6,-(a7)
[000418d2] 4fef ffdc                 lea.l      -36(a7),a7
[000418d6] 41f9 000d 5a6c            lea.l      $000D5A6C,a0
[000418dc] 43ef 0014                 lea.l      20(a7),a1
[000418e0] 700f                      moveq.l    #15,d0
[000418e2] 12d8                      move.b     (a0)+,(a1)+
[000418e4] 51c8 fffc                 dbf        d0,$000418E2
[000418e8] 41f9 000d 5a7c            lea.l      $000D5A7C,a0
[000418ee] 43ef 0004                 lea.l      4(a7),a1
[000418f2] 700f                      moveq.l    #15,d0
[000418f4] 12d8                      move.b     (a0)+,(a1)+
[000418f6] 51c8 fffc                 dbf        d0,$000418F4
[000418fa] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00041900] 2053                      movea.l    (a3),a0
[00041902] 2268 0258                 movea.l    600(a0),a1
[00041906] 2851                      movea.l    (a1),a4
[00041908] 202c 0090                 move.l     144(a4),d0
[0004190c] 6700 01f0                 beq        $00041AFE
[00041910] 43ef 0014                 lea.l      20(a7),a1
[00041914] 3428 0260                 move.w     608(a0),d2
[00041918] 48c2                      ext.l      d2
[0004191a] 2202                      move.l     d2,d1
[0004191c] d281                      add.l      d1,d1
[0004191e] d282                      add.l      d2,d1
[00041920] e789                      lsl.l      #3,d1
[00041922] 2068 025c                 movea.l    604(a0),a0
[00041926] d1c1                      adda.l     d1,a0
[00041928] 303c 00e3                 move.w     #$00E3,d0
[0004192c] 4eb9 0003 a772            jsr        Auo_editor
[00041932] 202f 0014                 move.l     20(a7),d0
[00041936] 6b00 0156                 bmi        $00041A8E
[0004193a] 2053                      movea.l    (a3),a0
[0004193c] 0c68 0002 02ca            cmpi.w     #$0002,714(a0)
[00041942] 6600 014a                 bne        $00041A8E
[00041946] 202c 0084                 move.l     132(a4),d0
[0004194a] 4eb9 0004 c608            jsr        Ax_malloc
[00041950] 2e88                      move.l     a0,(a7)
[00041952] 6620                      bne.s      $00041974
[00041954] 2054                      movea.l    (a4),a0
[00041956] 7001                      moveq.l    #1,d0
[00041958] 226c 00b4                 movea.l    180(a4),a1
[0004195c] 4e91                      jsr        (a1)
[0004195e] 4a40                      tst.w      d0
[00041960] 6600 01be                 bne        $00041B20
[00041964] 91c8                      suba.l     a0,a0
[00041966] 7003                      moveq.l    #3,d0
[00041968] 2253                      movea.l    (a3),a1
[0004196a] 2269 03d6                 movea.l    982(a1),a1
[0004196e] 4e91                      jsr        (a1)
[00041970] 6000 01ae                 bra        $00041B20
[00041974] 202c 0084                 move.l     132(a4),d0
[00041978] 2f00                      move.l     d0,-(a7)
[0004197a] 202f 0018                 move.l     24(a7),d0
[0004197e] 222c 0084                 move.l     132(a4),d1
[00041982] 4eb9 0008 3cac            jsr        _lmul
[00041988] 226c 0094                 movea.l    148(a4),a1
[0004198c] d3c0                      adda.l     d0,a1
[0004198e] 206f 0004                 movea.l    4(a7),a0
[00041992] 201f                      move.l     (a7)+,d0
[00041994] 4eb9 0008 3500            jsr        memcpy
[0004199a] 2053                      movea.l    (a3),a0
[0004199c] 2268 0258                 movea.l    600(a0),a1
[000419a0] 2469 0014                 movea.l    20(a1),a2
[000419a4] 45ea 0030                 lea.l      48(a2),a2
[000419a8] 4bea 0018                 lea.l      24(a2),a5
[000419ac] 2f14                      move.l     (a4),-(a7)
[000419ae] 2c6c 00a8                 movea.l    168(a4),a6
[000419b2] 204d                      movea.l    a5,a0
[000419b4] 226f 0004                 movea.l    4(a7),a1
[000419b8] 4e96                      jsr        (a6)
[000419ba] 584f                      addq.w     #4,a7
[000419bc] 5340                      subq.w     #1,d0
[000419be] 6600 00c2                 bne        $00041A82
[000419c2] 302d 0016                 move.w     22(a5),d0
[000419c6] 6700 00ba                 beq        $00041A82
[000419ca] 2053                      movea.l    (a3),a0
[000419cc] 3228 0012                 move.w     18(a0),d1
[000419d0] d241                      add.w      d1,d1
[000419d2] 3541 0014                 move.w     d1,20(a2)
[000419d6] 2053                      movea.l    (a3),a0
[000419d8] 3568 0014 0016            move.w     20(a0),22(a2)
[000419de] 2053                      movea.l    (a3),a0
[000419e0] 3028 0262                 move.w     610(a0),d0
[000419e4] 2268 0258                 movea.l    600(a0),a1
[000419e8] 9069 0034                 sub.w      52(a1),d0
[000419ec] 9068 0012                 sub.w      18(a0),d0
[000419f0] 3540 0010                 move.w     d0,16(a2)
[000419f4] 2053                      movea.l    (a3),a0
[000419f6] 3228 0264                 move.w     612(a0),d1
[000419fa] 2268 0258                 movea.l    600(a0),a1
[000419fe] 9269 0036                 sub.w      54(a1),d1
[00041a02] 3428 0014                 move.w     20(a0),d2
[00041a06] e242                      asr.w      #1,d2
[00041a08] 9242                      sub.w      d2,d1
[00041a0a] 3541 0012                 move.w     d1,18(a2)
[00041a0e] 026a ff7f 0008            andi.w     #$FF7F,8(a2)
[00041a14] 7002                      moveq.l    #2,d0
[00041a16] 2053                      movea.l    (a3),a0
[00041a18] 2068 0258                 movea.l    600(a0),a0
[00041a1c] 4eb9 0004 7e6a            jsr        Adr_add
[00041a22] 2053                      movea.l    (a3),a0
[00041a24] 3228 0264                 move.w     612(a0),d1
[00041a28] 3028 0262                 move.w     610(a0),d0
[00041a2c] 4eb9 0004 9140            jsr        Adr_drag
[00041a32] 7002                      moveq.l    #2,d0
[00041a34] 2053                      movea.l    (a3),a0
[00041a36] 2068 0258                 movea.l    600(a0),a0
[00041a3a] 4eb9 0004 7f76            jsr        Adr_del
[00041a40] 4240                      clr.w      d0
[00041a42] 3540 0016                 move.w     d0,22(a2)
[00041a46] 3540 0014                 move.w     d0,20(a2)
[00041a4a] 3540 0012                 move.w     d0,18(a2)
[00041a4e] 3540 0010                 move.w     d0,16(a2)
[00041a52] 006a 0080 0008            ori.w      #$0080,8(a2)
[00041a58] 202d 000c                 move.l     12(a5),d0
[00041a5c] 6708                      beq.s      $00041A66
[00041a5e] 2040                      movea.l    d0,a0
[00041a60] 4eb9 0004 c7c8            jsr        Ax_free
[00041a66] 202d 0010                 move.l     16(a5),d0
[00041a6a] 6708                      beq.s      $00041A74
[00041a6c] 2040                      movea.l    d0,a0
[00041a6e] 4eb9 0004 c7c8            jsr        Ax_free
[00041a74] 7000                      moveq.l    #0,d0
[00041a76] 2b40 0010                 move.l     d0,16(a5)
[00041a7a] 2b40 000c                 move.l     d0,12(a5)
[00041a7e] 426d 0016                 clr.w      22(a5)
[00041a82] 2057                      movea.l    (a7),a0
[00041a84] 4eb9 0004 c7c8            jsr        Ax_free
[00041a8a] 6000 0094                 bra        $00041B20
[00041a8e] 4eb9 0003 b3b6            jsr        Aus_editor
[00041a94] 2053                      movea.l    (a3),a0
[00041a96] 3228 0260                 move.w     608(a0),d1
[00041a9a] 48c1                      ext.l      d1
[00041a9c] 2001                      move.l     d1,d0
[00041a9e] d080                      add.l      d0,d0
[00041aa0] d081                      add.l      d1,d0
[00041aa2] e788                      lsl.l      #3,d0
[00041aa4] 2268 025c                 movea.l    604(a0),a1
[00041aa8] 3431 080a                 move.w     10(a1,d0.l),d2
[00041aac] c47c 4000                 and.w      #$4000,d2
[00041ab0] 676e                      beq.s      $00041B20
[00041ab2] 43ef 0004                 lea.l      4(a7),a1
[00041ab6] 2068 025c                 movea.l    604(a0),a0
[00041aba] d1c0                      adda.l     d0,a0
[00041abc] 303c 00e3                 move.w     #$00E3,d0
[00041ac0] 4eb9 0003 a772            jsr        Auo_editor
[00041ac6] 202f 0014                 move.l     20(a7),d0
[00041aca] 6b2a                      bmi.s      $00041AF6
[00041acc] 222f 0004                 move.l     4(a7),d1
[00041ad0] 6a24                      bpl.s      $00041AF6
[00041ad2] 43ef 0014                 lea.l      20(a7),a1
[00041ad6] 2053                      movea.l    (a3),a0
[00041ad8] 3028 0260                 move.w     608(a0),d0
[00041adc] 48c0                      ext.l      d0
[00041ade] 2400                      move.l     d0,d2
[00041ae0] d482                      add.l      d2,d2
[00041ae2] d480                      add.l      d0,d2
[00041ae4] e78a                      lsl.l      #3,d2
[00041ae6] 2068 025c                 movea.l    604(a0),a0
[00041aea] d1c2                      adda.l     d2,a0
[00041aec] 303c 00e4                 move.w     #$00E4,d0
[00041af0] 4eb9 0003 a772            jsr        Auo_editor
[00041af6] 4eb9 0004 1cb6            jsr        list_open
[00041afc] 6022                      bra.s      $00041B20
[00041afe] 93c9                      suba.l     a1,a1
[00041b00] 303c 00e2                 move.w     #$00E2,d0
[00041b04] 2053                      movea.l    (a3),a0
[00041b06] 3428 0260                 move.w     608(a0),d2
[00041b0a] 48c2                      ext.l      d2
[00041b0c] 2202                      move.l     d2,d1
[00041b0e] d281                      add.l      d1,d1
[00041b10] d282                      add.l      d2,d1
[00041b12] e789                      lsl.l      #3,d1
[00041b14] 2068 025c                 movea.l    604(a0),a0
[00041b18] d1c1                      adda.l     d1,a0
[00041b1a] 4eb9 0003 a772            jsr        Auo_editor
[00041b20] 4fef 0024                 lea.l      36(a7),a7
[00041b24] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[00041b28] 4e75                      rts
list_copy:
[00041b2a] 2f0a                      move.l     a2,-(a7)
[00041b2c] 4fef fff0                 lea.l      -16(a7),a7
[00041b30] 41f9 000d 5a8c            lea.l      $000D5A8C,a0
[00041b36] 43d7                      lea.l      (a7),a1
[00041b38] 700f                      moveq.l    #15,d0
[00041b3a] 12d8                      move.b     (a0)+,(a1)+
[00041b3c] 51c8 fffc                 dbf        d0,$00041B3A
[00041b40] 2079 0010 ee4e            movea.l    ACSblk,a0
[00041b46] 2268 0258                 movea.l    600(a0),a1
[00041b4a] 2451                      movea.l    (a1),a2
[00041b4c] 43d7                      lea.l      (a7),a1
[00041b4e] 303c 00e3                 move.w     #$00E3,d0
[00041b52] 2068 0258                 movea.l    600(a0),a0
[00041b56] 2068 0014                 movea.l    20(a0),a0
[00041b5a] 4eb9 0003 a772            jsr        Auo_editor
[00041b60] 202a 0084                 move.l     132(a2),d0
[00041b64] 2f00                      move.l     d0,-(a7)
[00041b66] 202f 0004                 move.l     4(a7),d0
[00041b6a] 222a 0084                 move.l     132(a2),d1
[00041b6e] 4eb9 0008 3cac            jsr        _lmul
[00041b74] 226a 0094                 movea.l    148(a2),a1
[00041b78] d3c0                      adda.l     d0,a1
[00041b7a] 206a 0098                 movea.l    152(a2),a0
[00041b7e] 201f                      move.l     (a7)+,d0
[00041b80] 4eb9 0008 3500            jsr        memcpy
[00041b86] 00aa 0000 0002 009c       ori.l      #$00000002,156(a2)
[00041b8e] 93c9                      suba.l     a1,a1
[00041b90] 303c 00e6                 move.w     #$00E6,d0
[00041b94] 2079 0010 ee4e            movea.l    ACSblk,a0
[00041b9a] 2468 0258                 movea.l    600(a0),a2
[00041b9e] 206a 0014                 movea.l    20(a2),a0
[00041ba2] 4eb9 0003 a772            jsr        Auo_editor
[00041ba8] 4fef 0010                 lea.l      16(a7),a7
[00041bac] 245f                      movea.l    (a7)+,a2
[00041bae] 4e75                      rts
list_cut:
[00041bb0] 2f0a                      move.l     a2,-(a7)
[00041bb2] 2f0b                      move.l     a3,-(a7)
[00041bb4] 4fef fff0                 lea.l      -16(a7),a7
[00041bb8] 41f9 000d 5a9c            lea.l      $000D5A9C,a0
[00041bbe] 43d7                      lea.l      (a7),a1
[00041bc0] 700f                      moveq.l    #15,d0
[00041bc2] 12d8                      move.b     (a0)+,(a1)+
[00041bc4] 51c8 fffc                 dbf        d0,$00041BC2
[00041bc8] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00041bce] 2052                      movea.l    (a2),a0
[00041bd0] 2268 0258                 movea.l    600(a0),a1
[00041bd4] 2651                      movea.l    (a1),a3
[00041bd6] 43d7                      lea.l      (a7),a1
[00041bd8] 303c 00e3                 move.w     #$00E3,d0
[00041bdc] 2068 0258                 movea.l    600(a0),a0
[00041be0] 2068 0014                 movea.l    20(a0),a0
[00041be4] 4eb9 0003 a772            jsr        Auo_editor
[00041bea] 202b 0084                 move.l     132(a3),d0
[00041bee] 2f00                      move.l     d0,-(a7)
[00041bf0] 202f 0004                 move.l     4(a7),d0
[00041bf4] 222b 0084                 move.l     132(a3),d1
[00041bf8] 4eb9 0008 3cac            jsr        _lmul
[00041bfe] 226b 0094                 movea.l    148(a3),a1
[00041c02] d3c0                      adda.l     d0,a1
[00041c04] 206b 0098                 movea.l    152(a3),a0
[00041c08] 201f                      move.l     (a7)+,d0
[00041c0a] 4eb9 0008 3500            jsr        memcpy
[00041c10] 2017                      move.l     (a7),d0
[00041c12] 2052                      movea.l    (a2),a0
[00041c14] 2068 0258                 movea.l    600(a0),a0
[00041c18] 6100 f836                 bsr        DeleteItem
[00041c1c] 00ab 0000 0002 009c       ori.l      #$00000002,156(a3)
[00041c24] 2052                      movea.l    (a2),a0
[00041c26] 2068 0258                 movea.l    600(a0),a0
[00041c2a] 6100 f912                 bsr        UpdateList
[00041c2e] 4fef 0010                 lea.l      16(a7),a7
[00041c32] 265f                      movea.l    (a7)+,a3
[00041c34] 245f                      movea.l    (a7)+,a2
[00041c36] 4e75                      rts
list_new:
[00041c38] 48e7 003c                 movem.l    a2-a5,-(a7)
[00041c3c] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00041c42] 2052                      movea.l    (a2),a0
[00041c44] 2268 0258                 movea.l    600(a0),a1
[00041c48] 2651                      movea.l    (a1),a3
[00041c4a] 202b 0084                 move.l     132(a3),d0
[00041c4e] 4eb9 0004 c608            jsr        Ax_malloc
[00041c54] 2848                      movea.l    a0,a4
[00041c56] 200c                      move.l     a4,d0
[00041c58] 661c                      bne.s      $00041C76
[00041c5a] 2053                      movea.l    (a3),a0
[00041c5c] 7001                      moveq.l    #1,d0
[00041c5e] 226b 00b4                 movea.l    180(a3),a1
[00041c62] 4e91                      jsr        (a1)
[00041c64] 4a40                      tst.w      d0
[00041c66] 6648                      bne.s      $00041CB0
[00041c68] 91c8                      suba.l     a0,a0
[00041c6a] 7003                      moveq.l    #3,d0
[00041c6c] 2252                      movea.l    (a2),a1
[00041c6e] 2269 03d6                 movea.l    982(a1),a1
[00041c72] 4e91                      jsr        (a1)
[00041c74] 603a                      bra.s      $00041CB0
[00041c76] 222b 0084                 move.l     132(a3),d1
[00041c7a] 4240                      clr.w      d0
[00041c7c] 204c                      movea.l    a4,a0
[00041c7e] 4eb9 0008 36ea            jsr        memset
[00041c84] 2253                      movea.l    (a3),a1
[00041c86] 204c                      movea.l    a4,a0
[00041c88] 2a6b 00ac                 movea.l    172(a3),a5
[00041c8c] 4e95                      jsr        (a5)
[00041c8e] 5340                      subq.w     #1,d0
[00041c90] 660c                      bne.s      $00041C9E
[00041c92] 224c                      movea.l    a4,a1
[00041c94] 2052                      movea.l    (a2),a0
[00041c96] 2068 0258                 movea.l    600(a0),a0
[00041c9a] 6100 f612                 bsr        AddItem
[00041c9e] 204c                      movea.l    a4,a0
[00041ca0] 4eb9 0004 c7c8            jsr        Ax_free
[00041ca6] 2052                      movea.l    (a2),a0
[00041ca8] 2068 0258                 movea.l    600(a0),a0
[00041cac] 6100 f890                 bsr        UpdateList
[00041cb0] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00041cb4] 4e75                      rts
list_open:
[00041cb6] 48e7 003c                 movem.l    a2-a5,-(a7)
[00041cba] 4fef fff0                 lea.l      -16(a7),a7
[00041cbe] 41f9 000d 5aac            lea.l      $000D5AAC,a0
[00041cc4] 43d7                      lea.l      (a7),a1
[00041cc6] 700f                      moveq.l    #15,d0
[00041cc8] 12d8                      move.b     (a0)+,(a1)+
[00041cca] 51c8 fffc                 dbf        d0,$00041CC8
[00041cce] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00041cd4] 2052                      movea.l    (a2),a0
[00041cd6] 2268 0258                 movea.l    600(a0),a1
[00041cda] 2651                      movea.l    (a1),a3
[00041cdc] 43d7                      lea.l      (a7),a1
[00041cde] 303c 00e3                 move.w     #$00E3,d0
[00041ce2] 2068 0258                 movea.l    600(a0),a0
[00041ce6] 2068 0014                 movea.l    20(a0),a0
[00041cea] 4eb9 0003 a772            jsr        Auo_editor
[00041cf0] 202b 0084                 move.l     132(a3),d0
[00041cf4] 4eb9 0004 c608            jsr        Ax_malloc
[00041cfa] 2848                      movea.l    a0,a4
[00041cfc] 200c                      move.l     a4,d0
[00041cfe] 661c                      bne.s      $00041D1C
[00041d00] 2053                      movea.l    (a3),a0
[00041d02] 7001                      moveq.l    #1,d0
[00041d04] 226b 00b4                 movea.l    180(a3),a1
[00041d08] 4e91                      jsr        (a1)
[00041d0a] 4a40                      tst.w      d0
[00041d0c] 6678                      bne.s      $00041D86
[00041d0e] 91c8                      suba.l     a0,a0
[00041d10] 7003                      moveq.l    #3,d0
[00041d12] 2252                      movea.l    (a2),a1
[00041d14] 2269 03d6                 movea.l    982(a1),a1
[00041d18] 4e91                      jsr        (a1)
[00041d1a] 606a                      bra.s      $00041D86
[00041d1c] 202b 0084                 move.l     132(a3),d0
[00041d20] 2f00                      move.l     d0,-(a7)
[00041d22] 202f 0004                 move.l     4(a7),d0
[00041d26] 222b 0084                 move.l     132(a3),d1
[00041d2a] 4eb9 0008 3cac            jsr        _lmul
[00041d30] 226b 0094                 movea.l    148(a3),a1
[00041d34] d3c0                      adda.l     d0,a1
[00041d36] 204c                      movea.l    a4,a0
[00041d38] 201f                      move.l     (a7)+,d0
[00041d3a] 4eb9 0008 3500            jsr        memcpy
[00041d40] 2253                      movea.l    (a3),a1
[00041d42] 204c                      movea.l    a4,a0
[00041d44] 2a6b 00ac                 movea.l    172(a3),a5
[00041d48] 4e95                      jsr        (a5)
[00041d4a] 5340                      subq.w     #1,d0
[00041d4c] 661a                      bne.s      $00041D68
[00041d4e] 224c                      movea.l    a4,a1
[00041d50] 2017                      move.l     (a7),d0
[00041d52] 2052                      movea.l    (a2),a0
[00041d54] 2068 0258                 movea.l    600(a0),a0
[00041d58] 6100 f7bc                 bsr        ReplaceItem
[00041d5c] 2052                      movea.l    (a2),a0
[00041d5e] 2068 0258                 movea.l    600(a0),a0
[00041d62] 6100 f7da                 bsr        UpdateList
[00041d66] 6016                      bra.s      $00041D7E
[00041d68] 93c9                      suba.l     a1,a1
[00041d6a] 303c 00e6                 move.w     #$00E6,d0
[00041d6e] 2052                      movea.l    (a2),a0
[00041d70] 2668 0258                 movea.l    600(a0),a3
[00041d74] 206b 0014                 movea.l    20(a3),a0
[00041d78] 4eb9 0003 a772            jsr        Auo_editor
[00041d7e] 204c                      movea.l    a4,a0
[00041d80] 4eb9 0004 c7c8            jsr        Ax_free
[00041d86] 4fef 0010                 lea.l      16(a7),a7
[00041d8a] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00041d8e] 4e75                      rts
list_paste:
[00041d90] 2f0a                      move.l     a2,-(a7)
[00041d92] 2079 0010 ee4e            movea.l    ACSblk,a0
[00041d98] 2268 0258                 movea.l    600(a0),a1
[00041d9c] 2451                      movea.l    (a1),a2
[00041d9e] 226a 0098                 movea.l    152(a2),a1
[00041da2] 2068 0258                 movea.l    600(a0),a0
[00041da6] 6100 f506                 bsr        AddItem
[00041daa] 2079 0010 ee4e            movea.l    ACSblk,a0
[00041db0] 2068 0258                 movea.l    600(a0),a0
[00041db4] 6100 f788                 bsr        UpdateList
[00041db8] 245f                      movea.l    (a7)+,a2
[00041dba] 4e75                      rts
live_list:
[00041dbc] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00041dc0] 4fef fff0                 lea.l      -16(a7),a7
[00041dc4] 2448                      movea.l    a0,a2
[00041dc6] 4243                      clr.w      d3
[00041dc8] 2650                      movea.l    (a0),a3
[00041dca] 43d7                      lea.l      (a7),a1
[00041dcc] 303c 00e3                 move.w     #$00E3,d0
[00041dd0] 206a 0014                 movea.l    20(a2),a0
[00041dd4] 4eb9 0003 a772            jsr        Auo_editor
[00041dda] 2017                      move.l     (a7),d0
[00041ddc] 6b28                      bmi.s      $00041E06
[00041dde] 7208                      moveq.l    #8,d1
[00041de0] 206a 0018                 movea.l    24(a2),a0
[00041de4] c268 0052                 and.w      82(a0),d1
[00041de8] 6744                      beq.s      $00041E2E
[00041dea] 0268 fff7 0052            andi.w     #$FFF7,82(a0)
[00041df0] 206a 0018                 movea.l    24(a2),a0
[00041df4] 0268 fff7 0082            andi.w     #$FFF7,130(a0)
[00041dfa] 206a 0018                 movea.l    24(a2),a0
[00041dfe] 0268 fff7 00b2            andi.w     #$FFF7,178(a0)
[00041e04] 6026                      bra.s      $00041E2C
[00041e06] 7008                      moveq.l    #8,d0
[00041e08] 206a 0018                 movea.l    24(a2),a0
[00041e0c] c068 0052                 and.w      82(a0),d0
[00041e10] 661c                      bne.s      $00041E2E
[00041e12] 0068 0008 0052            ori.w      #$0008,82(a0)
[00041e18] 206a 0018                 movea.l    24(a2),a0
[00041e1c] 0068 0008 0082            ori.w      #$0008,130(a0)
[00041e22] 206a 0018                 movea.l    24(a2),a0
[00041e26] 0068 0008 00b2            ori.w      #$0008,178(a0)
[00041e2c] 7601                      moveq.l    #1,d3
[00041e2e] 7002                      moveq.l    #2,d0
[00041e30] c0ab 009c                 and.l      156(a3),d0
[00041e34] 6714                      beq.s      $00041E4A
[00041e36] 7208                      moveq.l    #8,d1
[00041e38] 206a 0018                 movea.l    24(a2),a0
[00041e3c] c268 00e2                 and.w      226(a0),d1
[00041e40] 671c                      beq.s      $00041E5E
[00041e42] 0268 fff7 00e2            andi.w     #$FFF7,226(a0)
[00041e48] 6012                      bra.s      $00041E5C
[00041e4a] 7008                      moveq.l    #8,d0
[00041e4c] 206a 0018                 movea.l    24(a2),a0
[00041e50] c068 00e2                 and.w      226(a0),d0
[00041e54] 6608                      bne.s      $00041E5E
[00041e56] 0068 0008 00e2            ori.w      #$0008,226(a0)
[00041e5c] 7601                      moveq.l    #1,d3
[00041e5e] 4a43                      tst.w      d3
[00041e60] 670e                      beq.s      $00041E70
[00041e62] 72ff                      moveq.l    #-1,d1
[00041e64] 303c 1000                 move.w     #$1000,d0
[00041e68] 204a                      movea.l    a2,a0
[00041e6a] 226a 0066                 movea.l    102(a2),a1
[00041e6e] 4e91                      jsr        (a1)
[00041e70] 4fef 0010                 lea.l      16(a7),a7
[00041e74] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00041e78] 4e75                      rts
make_list:
[00041e7a] 48e7 003c                 movem.l    a2-a5,-(a7)
[00041e7e] 4fef ffe8                 lea.l      -24(a7),a7
[00041e82] 47ef 0008                 lea.l      8(a7),a3
[00041e86] 2448                      movea.l    a0,a2
[00041e88] 200a                      move.l     a2,d0
[00041e8a] 6700 010a                 beq        $00041F96
[00041e8e] 203c 0000 1c00            move.l     #$00001C00,d0
[00041e94] 222a 0090                 move.l     144(a2),d1
[00041e98] 4eb9 0008 3cf6            jsr        _ldiv
[00041e9e] 2680                      move.l     d0,(a3)
[00041ea0] 7202                      moveq.l    #2,d1
[00041ea2] b280                      cmp.l      d0,d1
[00041ea4] 6f02                      ble.s      $00041EA8
[00041ea6] 2681                      move.l     d1,(a3)
[00041ea8] 23ea 008c 000d 5a14       move.l     140(a2),$000D5A14
[00041eb0] 203c 0000 00c0            move.l     #$000000C0,d0
[00041eb6] 4eb9 0004 c608            jsr        Ax_malloc
[00041ebc] 2848                      movea.l    a0,a4
[00041ebe] 200c                      move.l     a4,d0
[00041ec0] 6700 00d4                 beq        $00041F96
[00041ec4] 202a 0090                 move.l     144(a2),d0
[00041ec8] 2213                      move.l     (a3),d1
[00041eca] 4eb9 0008 3cac            jsr        _lmul
[00041ed0] 4eb9 0004 c608            jsr        Ax_malloc
[00041ed6] 2948 0094                 move.l     a0,148(a4)
[00041eda] 6700 00ba                 beq        $00041F96
[00041ede] 202a 0090                 move.l     144(a2),d0
[00041ee2] 4eb9 0004 c608            jsr        Ax_malloc
[00041ee8] 2948 0098                 move.l     a0,152(a4)
[00041eec] 6700 00a8                 beq        $00041F96
[00041ef0] 43ea 0004                 lea.l      4(a2),a1
[00041ef4] 41ec 0004                 lea.l      4(a4),a0
[00041ef8] 4eb9 0008 2f0c            jsr        strcpy
[00041efe] 23c8 000d 5a04            move.l     a0,$000D5A04
[00041f04] 2892                      move.l     (a2),(a4)
[00041f06] 296a 0094 00a0            move.l     148(a2),160(a4)
[00041f0c] 296a 0098 00a4            move.l     152(a2),164(a4)
[00041f12] 296a 009c 00a8            move.l     156(a2),168(a4)
[00041f18] 296a 00a0 00ac            move.l     160(a2),172(a4)
[00041f1e] 296a 00a4 00b0            move.l     164(a2),176(a4)
[00041f24] 296a 00a8 00b4            move.l     168(a2),180(a4)
[00041f2a] 296a 00ac 00b8            move.l     172(a2),184(a4)
[00041f30] 296a 00b0 00bc            move.l     176(a2),188(a4)
[00041f36] 42ac 009c                 clr.l      156(a4)
[00041f3a] 296a 0090 0084            move.l     144(a2),132(a4)
[00041f40] 42ac 0090                 clr.l      144(a4)
[00041f44] 2013                      move.l     (a3),d0
[00041f46] 2940 008c                 move.l     d0,140(a4)
[00041f4a] 2940 0088                 move.l     d0,136(a4)
[00041f4e] 202a 0090                 move.l     144(a2),d0
[00041f52] 2213                      move.l     (a3),d1
[00041f54] 4eb9 0008 3cac            jsr        _lmul
[00041f5a] 2200                      move.l     d0,d1
[00041f5c] 206c 0094                 movea.l    148(a4),a0
[00041f60] 4240                      clr.w      d0
[00041f62] 4eb9 0008 36ea            jsr        memset
[00041f68] 41f9 000d 59ba            lea.l      LIST_WINDOW,a0
[00041f6e] 4eb9 0005 7052            jsr        Awi_create
[00041f74] 2a48                      movea.l    a0,a5
[00041f76] 200d                      move.l     a5,d0
[00041f78] 6622                      bne.s      $00041F9C
[00041f7a] 206c 0098                 movea.l    152(a4),a0
[00041f7e] 4eb9 0004 c7c8            jsr        Ax_free
[00041f84] 206c 0094                 movea.l    148(a4),a0
[00041f88] 4eb9 0004 c7c8            jsr        Ax_free
[00041f8e] 204c                      movea.l    a4,a0
[00041f90] 4eb9 0004 c7c8            jsr        Ax_free
[00041f96] 91c8                      suba.l     a0,a0
[00041f98] 6000 010e                 bra        $000420A8
[00041f9c] 302a 008a                 move.w     138(a2),d0
[00041fa0] 6f64                      ble.s      $00042006
[00041fa2] 322a 0088                 move.w     136(a2),d1
[00041fa6] 6f5e                      ble.s      $00042006
[00041fa8] 43ea 0084                 lea.l      132(a2),a1
[00041fac] 41ed 0024                 lea.l      36(a5),a0
[00041fb0] 7008                      moveq.l    #8,d0
[00041fb2] 4eb9 0008 3500            jsr        memcpy
[00041fb8] 2f39 000e 692a            move.l     _globl,-(a7)
[00041fbe] 206d 0014                 movea.l    20(a5),a0
[00041fc2] 4868 0016                 pea.l      22(a0)
[00041fc6] 4868 0014                 pea.l      20(a0)
[00041fca] 3f2d 002a                 move.w     42(a5),-(a7)
[00041fce] 3f2d 0028                 move.w     40(a5),-(a7)
[00041fd2] 3f2d 0026                 move.w     38(a5),-(a7)
[00041fd6] 43ef 001e                 lea.l      30(a7),a1
[00041fda] 41ef 001e                 lea.l      30(a7),a0
[00041fde] 342d 0024                 move.w     36(a5),d2
[00041fe2] 322d 0022                 move.w     34(a5),d1
[00041fe6] 7001                      moveq.l    #1,d0
[00041fe8] 4eb9 0007 b8da            jsr        mt_wind_calc
[00041fee] 4fef 0012                 lea.l      18(a7),a7
[00041ff2] 202d 0018                 move.l     24(a5),d0
[00041ff6] 670e                      beq.s      $00042006
[00041ff8] 2040                      movea.l    d0,a0
[00041ffa] 3228 0016                 move.w     22(a0),d1
[00041ffe] 226d 0014                 movea.l    20(a5),a1
[00042002] 9369 0016                 sub.w      d1,22(a1)
[00042006] 2a8c                      move.l     a4,(a5)
[00042008] 286d 0014                 movea.l    20(a5),a4
[0004200c] 93c9                      suba.l     a1,a1
[0004200e] 303c 00dd                 move.w     #$00DD,d0
[00042012] 204c                      movea.l    a4,a0
[00042014] 4eb9 0003 a772            jsr        Auo_editor
[0004201a] 26bc 000f 423f            move.l     #$000F423F,(a3)
[00042020] 224b                      movea.l    a3,a1
[00042022] 303c 00cd                 move.w     #$00CD,d0
[00042026] 204c                      movea.l    a4,a0
[00042028] 4eb9 0003 a772            jsr        Auo_editor
[0004202e] 26bc 0000 0200            move.l     #$00000200,(a3)
[00042034] 224b                      movea.l    a3,a1
[00042036] 303c 00d2                 move.w     #$00D2,d0
[0004203a] 204c                      movea.l    a4,a0
[0004203c] 4eb9 0003 a772            jsr        Auo_editor
[00042042] 93c9                      suba.l     a1,a1
[00042044] 700e                      moveq.l    #14,d0
[00042046] 204c                      movea.l    a4,a0
[00042048] 4eb9 0003 a772            jsr        Auo_editor
[0004204e] 93c9                      suba.l     a1,a1
[00042050] 303c 00fd                 move.w     #$00FD,d0
[00042054] 204c                      movea.l    a4,a0
[00042056] 4eb9 0003 a772            jsr        Auo_editor
[0004205c] 2f4d 000e                 move.l     a5,14(a7)
[00042060] 206d 0014                 movea.l    20(a5),a0
[00042064] 41e8 0060                 lea.l      96(a0),a0
[00042068] 2f48 0012                 move.l     a0,18(a7)
[0004206c] 3f7c 0004 0016            move.w     #$0004,22(a7)
[00042072] 43ef 000e                 lea.l      14(a7),a1
[00042076] 303c 00c8                 move.w     #$00C8,d0
[0004207a] 204c                      movea.l    a4,a0
[0004207c] 4eb9 0003 a772            jsr        Auo_editor
[00042082] 2ebc 0004 1dbc            move.l     #live_list,(a7)
[00042088] 2f4d 0004                 move.l     a5,4(a7)
[0004208c] 43d7                      lea.l      (a7),a1
[0004208e] 303c 00e5                 move.w     #$00E5,d0
[00042092] 204c                      movea.l    a4,a0
[00042094] 4eb9 0003 a772            jsr        Auo_editor
[0004209a] 93c9                      suba.l     a1,a1
[0004209c] 7006                      moveq.l    #6,d0
[0004209e] 204c                      movea.l    a4,a0
[000420a0] 4eb9 0003 a772            jsr        Auo_editor
[000420a6] 204d                      movea.l    a5,a0
[000420a8] 4fef 0018                 lea.l      24(a7),a7
[000420ac] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[000420b0] 4e75                      rts
serv_list:
[000420b2] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[000420b6] 2448                      movea.l    a0,a2
[000420b8] 3600                      move.w     d0,d3
[000420ba] 2849                      movea.l    a1,a4
[000420bc] 2650                      movea.l    (a0),a3
[000420be] b07c 0193                 cmp.w      #$0193,d0
[000420c2] 6700 00ae                 beq        $00042172
[000420c6] 6e2a                      bgt.s      $000420F2
[000420c8] b07c 0190                 cmp.w      #$0190,d0
[000420cc] 6700 008c                 beq        $0004215A
[000420d0] 6e0e                      bgt.s      $000420E0
[000420d2] 5540                      subq.w     #2,d0
[000420d4] 673a                      beq.s      $00042110
[000420d6] 907c 000d                 sub.w      #$000D,d0
[000420da] 6770                      beq.s      $0004214C
[000420dc] 6000 00da                 bra        $000421B8
[000420e0] 907c 0191                 sub.w      #$0191,d0
[000420e4] 6700 007c                 beq.w      $00042162
[000420e8] 5340                      subq.w     #1,d0
[000420ea] 6700 007c                 beq.w      $00042168
[000420ee] 6000 00c8                 bra        $000421B8
[000420f2] 907c 0194                 sub.w      #$0194,d0
[000420f6] 6700 0084                 beq        $0004217C
[000420fa] 5340                      subq.w     #1,d0
[000420fc] 6700 008e                 beq        $0004218C
[00042100] 5340                      subq.w     #1,d0
[00042102] 6700 009a                 beq        $0004219E
[00042106] 5340                      subq.w     #1,d0
[00042108] 6700 00a4                 beq        $000421AE
[0004210c] 6000 00aa                 bra        $000421B8
[00042110] 2053                      movea.l    (a3),a0
[00042112] 226b 00bc                 movea.l    188(a3),a1
[00042116] 4e91                      jsr        (a1)
[00042118] 4a40                      tst.w      d0
[0004211a] 6612                      bne.s      $0004212E
[0004211c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042122] 3028 023a                 move.w     570(a0),d0
[00042126] 6606                      bne.s      $0004212E
[00042128] 4240                      clr.w      d0
[0004212a] 6000 009c                 bra        $000421C8
[0004212e] 206b 0094                 movea.l    148(a3),a0
[00042132] 4eb9 0004 c7c8            jsr        Ax_free
[00042138] 204b                      movea.l    a3,a0
[0004213a] 4eb9 0004 c7c8            jsr        Ax_free
[00042140] 204a                      movea.l    a2,a0
[00042142] 4eb9 0005 85f2            jsr        Awi_delete
[00042148] 6000 007c                 bra.w      $000421C6
[0004214c] 2053                      movea.l    (a3),a0
[0004214e] 7004                      moveq.l    #4,d0
[00042150] 226b 00b4                 movea.l    180(a3),a1
[00042154] 4e91                      jsr        (a1)
[00042156] 6000 006e                 bra.w      $000421C6
[0004215a] 204a                      movea.l    a2,a0
[0004215c] 6100 f3e0                 bsr        UpdateList
[00042160] 6066                      bra.s      $000421C8
[00042162] 28ab 0090                 move.l     144(a3),(a4)
[00042166] 605e                      bra.s      $000421C6
[00042168] 224c                      movea.l    a4,a1
[0004216a] 204a                      movea.l    a2,a0
[0004216c] 6100 f140                 bsr        AddItem
[00042170] 6056                      bra.s      $000421C8
[00042172] 2014                      move.l     (a4),d0
[00042174] 204a                      movea.l    a2,a0
[00042176] 6100 f2d8                 bsr        DeleteItem
[0004217a] 604c                      bra.s      $000421C8
[0004217c] 2a4c                      movea.l    a4,a5
[0004217e] 226d 0004                 movea.l    4(a5),a1
[00042182] 2015                      move.l     (a5),d0
[00042184] 204a                      movea.l    a2,a0
[00042186] 6100 f342                 bsr        GetItem
[0004218a] 603c                      bra.s      $000421C8
[0004218c] 7001                      moveq.l    #1,d0
[0004218e] c0ab 009c                 and.l      156(a3),d0
[00042192] 6706                      beq.s      $0004219A
[00042194] 38bc 0001                 move.w     #$0001,(a4)
[00042198] 602c                      bra.s      $000421C6
[0004219a] 4254                      clr.w      (a4)
[0004219c] 6028                      bra.s      $000421C6
[0004219e] 2a4c                      movea.l    a4,a5
[000421a0] 226d 0004                 movea.l    4(a5),a1
[000421a4] 2015                      move.l     (a5),d0
[000421a6] 204a                      movea.l    a2,a0
[000421a8] 6100 f36c                 bsr        ReplaceItem
[000421ac] 601a                      bra.s      $000421C8
[000421ae] 02ab ffff fffe 009c       andi.l     #$FFFFFFFE,156(a3)
[000421b6] 600e                      bra.s      $000421C6
[000421b8] 224c                      movea.l    a4,a1
[000421ba] 3003                      move.w     d3,d0
[000421bc] 204a                      movea.l    a2,a0
[000421be] 4eb9 0005 9dd0            jsr        Awi_service
[000421c4] 6002                      bra.s      $000421C8
[000421c6] 7001                      moveq.l    #1,d0
[000421c8] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[000421cc] 4e75                      rts
size_list:
[000421ce] 48e7 003c                 movem.l    a2-a5,-(a7)
[000421d2] 594f                      subq.w     #4,a7
[000421d4] 2648                      movea.l    a0,a3
[000421d6] 2449                      movea.l    a1,a2
[000421d8] 41f9 0010 ee4e            lea.l      ACSblk,a0
[000421de] 302a 0004                 move.w     4(a2),d0
[000421e2] 2250                      movea.l    (a0),a1
[000421e4] 3429 0012                 move.w     18(a1),d2
[000421e8] 3202                      move.w     d2,d1
[000421ea] e549                      lsl.w      #2,d1
[000421ec] d242                      add.w      d2,d1
[000421ee] b041                      cmp.w      d1,d0
[000421f0] 6c04                      bge.s      $000421F6
[000421f2] 3541 0004                 move.w     d1,4(a2)
[000421f6] 302a 0006                 move.w     6(a2),d0
[000421fa] 2250                      movea.l    (a0),a1
[000421fc] 3429 0014                 move.w     20(a1),d2
[00042200] 3202                      move.w     d2,d1
[00042202] e549                      lsl.w      #2,d1
[00042204] d242                      add.w      d2,d1
[00042206] b041                      cmp.w      d1,d0
[00042208] 6c04                      bge.s      $0004220E
[0004220a] 3541 0006                 move.w     d1,6(a2)
[0004220e] 286b 0014                 movea.l    20(a3),a4
[00042212] 2a6b 005e                 movea.l    94(a3),a5
[00042216] 2f39 000e 692a            move.l     _globl,-(a7)
[0004221c] 486c 0016                 pea.l      22(a4)
[00042220] 486c 0014                 pea.l      20(a4)
[00042224] 3f2a 0006                 move.w     6(a2),-(a7)
[00042228] 3f2a 0004                 move.w     4(a2),-(a7)
[0004222c] 4267                      clr.w      -(a7)
[0004222e] 43ef 0012                 lea.l      18(a7),a1
[00042232] 41ef 0014                 lea.l      20(a7),a0
[00042236] 4242                      clr.w      d2
[00042238] 322b 0022                 move.w     34(a3),d1
[0004223c] 7001                      moveq.l    #1,d0
[0004223e] 4eb9 0007 b8da            jsr        mt_wind_calc
[00042244] 4fef 0012                 lea.l      18(a7),a7
[00042248] 7007                      moveq.l    #7,d0
[0004224a] d052                      add.w      (a2),d0
[0004224c] c07c fff7                 and.w      #$FFF7,d0
[00042250] 906f 0002                 sub.w      2(a7),d0
[00042254] 3480                      move.w     d0,(a2)
[00042256] 220d                      move.l     a5,d1
[00042258] 6716                      beq.s      $00042270
[0004225a] 302d 0002                 move.w     2(a5),d0
[0004225e] 48c0                      ext.l      d0
[00042260] 2400                      move.l     d0,d2
[00042262] d482                      add.l      d2,d2
[00042264] d480                      add.l      d0,d2
[00042266] e78a                      lsl.l      #3,d2
[00042268] 3235 2816                 move.w     22(a5,d2.l),d1
[0004226c] 936c 0016                 sub.w      d1,22(a4)
[00042270] 202b 0018                 move.l     24(a3),d0
[00042274] 670a                      beq.s      $00042280
[00042276] 2040                      movea.l    d0,a0
[00042278] 3228 0016                 move.w     22(a0),d1
[0004227c] 936c 0016                 sub.w      d1,22(a4)
[00042280] 93c9                      suba.l     a1,a1
[00042282] 303c 00ee                 move.w     #$00EE,d0
[00042286] 204c                      movea.l    a4,a0
[00042288] 4eb9 0003 a772            jsr        Auo_editor
[0004228e] 93c9                      suba.l     a1,a1
[00042290] 303c 00fd                 move.w     #$00FD,d0
[00042294] 204c                      movea.l    a4,a0
[00042296] 4eb9 0003 a772            jsr        Auo_editor
[0004229c] 224a                      movea.l    a2,a1
[0004229e] 204b                      movea.l    a3,a0
[000422a0] 4eb9 0005 8bb0            jsr        Awi_sized
[000422a6] 584f                      addq.w     #4,a7
[000422a8] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[000422ac] 4e75                      rts
vslide_list:
[000422ae] 48e7 0038                 movem.l    a2-a4,-(a7)
[000422b2] 554f                      subq.w     #2,a7
[000422b4] 3e80                      move.w     d0,(a7)
[000422b6] 2468 0014                 movea.l    20(a0),a2
[000422ba] 45ea 0060                 lea.l      96(a2),a2
[000422be] 266a 000c                 movea.l    12(a2),a3
[000422c2] 43d7                      lea.l      (a7),a1
[000422c4] 204a                      movea.l    a2,a0
[000422c6] 286b 0008                 movea.l    8(a3),a4
[000422ca] 706a                      moveq.l    #106,d0
[000422cc] 4e94                      jsr        (a4)
[000422ce] 93c9                      suba.l     a1,a1
[000422d0] 7005                      moveq.l    #5,d0
[000422d2] 204a                      movea.l    a2,a0
[000422d4] 286b 0008                 movea.l    8(a3),a4
[000422d8] 4e94                      jsr        (a4)
[000422da] 93c9                      suba.l     a1,a1
[000422dc] 7069                      moveq.l    #105,d0
[000422de] 204a                      movea.l    a2,a0
[000422e0] 286b 0008                 movea.l    8(a3),a4
[000422e4] 4e94                      jsr        (a4)
[000422e6] 544f                      addq.w     #2,a7
[000422e8] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000422ec] 4e75                      rts

	.data

TEXT_002:
[000d4ed0]                           dc.w $0000
DATAS_05:
[000d4ed2]                           dc.w $0000
[000d4ed4]                           dc.w $0000
[000d4ed6]                           dc.w $0088
[000d4ed8]                           dc.w $0000
[000d4eda]                           dc.w $7dde
[000d4edc]                           dc.w $7dde
[000d4ede]                           dc.w $7dde
[000d4ee0]                           dc.w $7c9e
[000d4ee2]                           dc.w $7ebe
[000d4ee4]                           dc.w $7e3e
[000d4ee6]                           dc.w $7f7e
[000d4ee8]                           dc.b '~>~éx'
[000d4eed]                           dc.b $b6
[000d4eee]                           dc.w $76b6
[000d4ef0]                           dc.w $76b6
[000d4ef2]                           dc.w $76ce
[000d4ef4]                           dc.w $79fe
[000d4ef6]                           dc.w $0000
[000d4ef8]                           dc.w $0000
[000d4efa]                           dc.w $7dde
[000d4efc]                           dc.w $7dde
[000d4efe]                           dc.w $7dde
[000d4f00]                           dc.w $7c9e
[000d4f02]                           dc.w $7ebe
[000d4f04]                           dc.w $7e3e
[000d4f06]                           dc.w $7f7e
[000d4f08]                           dc.b '~>~éx'
[000d4f0d]                           dc.b $b6
[000d4f0e]                           dc.w $76b6
[000d4f10]                           dc.w $76b6
[000d4f12]                           dc.w $76ce
[000d4f14]                           dc.w $79fe
[000d4f16]                           dc.w $0000
[000d4f18]                           dc.w $0000
[000d4f1a]                           dc.w $7ffe
[000d4f1c]                           dc.w $7ffe
[000d4f1e]                           dc.w $7ffe
[000d4f20]                           dc.w $7ffe
[000d4f22]                           dc.w $7ffe
[000d4f24]                           dc.w $7ffe
[000d4f26]                           dc.w $7ffe
[000d4f28]                           dc.w $7ffe
[000d4f2a]                           dc.w $7ffe
[000d4f2c]                           dc.w $7ffe
[000d4f2e]                           dc.w $7ffe
[000d4f30]                           dc.w $7ffe
[000d4f32]                           dc.w $7ffe
[000d4f34]                           dc.w $7ffe
[000d4f36]                           dc.w $0000
[000d4f38]                           dc.w $0001
[000d4f3a]                           dc.w $0001
[000d4f3c]                           dc.w $0001
[000d4f3e]                           dc.w $0001
[000d4f40]                           dc.w $0001
[000d4f42]                           dc.w $0001
[000d4f44]                           dc.w $0001
[000d4f46]                           dc.w $0001
[000d4f48]                           dc.w $0001
[000d4f4a]                           dc.w $0001
[000d4f4c]                           dc.w $0001
[000d4f4e]                           dc.w $0001
[000d4f50]                           dc.w $0001
[000d4f52]                           dc.w $0001
[000d4f54]                           dc.w $0001
[000d4f56]                           dc.w $ffff
DATAS_06:
[000d4f58]                           dc.w $ffff
[000d4f5a]                           dc.w $ffff
[000d4f5c]                           dc.w $ffff
[000d4f5e]                           dc.w $ffff
[000d4f60]                           dc.w $ffff
[000d4f62]                           dc.w $ffff
[000d4f64]                           dc.w $ffff
[000d4f66]                           dc.w $ffff
[000d4f68]                           dc.w $ffff
[000d4f6a]                           dc.w $ffff
[000d4f6c]                           dc.w $ffff
[000d4f6e]                           dc.w $ffff
[000d4f70]                           dc.w $ffff
[000d4f72]                           dc.w $ffff
[000d4f74]                           dc.w $ffff
[000d4f76]                           dc.w $ffff
DATAS_07:
[000d4f78]                           dc.w $0000
[000d4f7a]                           dc.w $0000
[000d4f7c]                           dc.w $0094
[000d4f7e]                           dc.w $0000
[000d4f80]                           dc.w $7dde
[000d4f82]                           dc.w $7dde
[000d4f84]                           dc.w $7dde
[000d4f86]                           dc.w $7c9e
[000d4f88]                           dc.w $7ebe
[000d4f8a]                           dc.w $7e3e
[000d4f8c]                           dc.w $7f7e
[000d4f8e]                           dc.b '~>~éx'
[000d4f93]                           dc.b $b6
[000d4f94]                           dc.w $76b6
[000d4f96]                           dc.w $76b6
[000d4f98]                           dc.w $76ce
[000d4f9a]                           dc.w $79fe
[000d4f9c]                           dc.w $0000
[000d4f9e]                           dc.w $0000
[000d4fa0]                           dc.w $7dde
[000d4fa2]                           dc.w $7dde
[000d4fa4]                           dc.w $7dde
[000d4fa6]                           dc.w $7c9e
[000d4fa8]                           dc.w $7ebe
[000d4faa]                           dc.w $7e3e
[000d4fac]                           dc.w $7f7e
[000d4fae]                           dc.b '~>~éx'
[000d4fb3]                           dc.b $b6
[000d4fb4]                           dc.w $76b6
[000d4fb6]                           dc.w $76b6
[000d4fb8]                           dc.w $76ce
[000d4fba]                           dc.w $79fe
[000d4fbc]                           dc.w $0000
[000d4fbe]                           dc.w $0000
[000d4fc0]                           dc.w $7ffe
[000d4fc2]                           dc.w $7ffe
[000d4fc4]                           dc.w $7ffe
[000d4fc6]                           dc.w $7ffe
[000d4fc8]                           dc.w $7ffe
[000d4fca]                           dc.w $7ffe
[000d4fcc]                           dc.w $7ffe
[000d4fce]                           dc.w $7ffe
[000d4fd0]                           dc.w $7ffe
[000d4fd2]                           dc.w $7ffe
[000d4fd4]                           dc.w $7ffe
[000d4fd6]                           dc.w $7ffe
[000d4fd8]                           dc.w $7ffe
[000d4fda]                           dc.w $7ffe
[000d4fdc]                           dc.w $0000
[000d4fde]                           dc.w $ffff
[000d4fe0]                           dc.w $8000
[000d4fe2]                           dc.w $8000
[000d4fe4]                           dc.w $8000
[000d4fe6]                           dc.w $8000
[000d4fe8]                           dc.w $8000
[000d4fea]                           dc.w $8000
[000d4fec]                           dc.w $8000
[000d4fee]                           dc.w $8000
[000d4ff0]                           dc.w $8000
[000d4ff2]                           dc.w $8000
[000d4ff4]                           dc.w $8000
[000d4ff6]                           dc.w $8000
[000d4ff8]                           dc.w $8000
[000d4ffa]                           dc.w $8000
[000d4ffc]                           dc.w $8000
DATAS_08:
[000d4ffe]                           dc.w $ffff
[000d5000]                           dc.w $ffff
[000d5002]                           dc.w $ffff
[000d5004]                           dc.w $ffff
[000d5006]                           dc.w $ffff
[000d5008]                           dc.w $ffff
[000d500a]                           dc.w $ffff
[000d500c]                           dc.w $ffff
[000d500e]                           dc.w $ffff
[000d5010]                           dc.w $ffff
[000d5012]                           dc.w $ffff
[000d5014]                           dc.w $ffff
[000d5016]                           dc.w $ffff
[000d5018]                           dc.w $ffff
[000d501a]                           dc.w $ffff
[000d501c]                           dc.w $ffff
DATAS_09:
[000d501e]                           dc.w $0000
[000d5020]                           dc.w $0000
[000d5022]                           dc.w $0088
[000d5024]                           dc.w $0000
[000d5026]                           dc.w $7ffe
[000d5028]                           dc.w $63fe
[000d502a]                           dc.w $62fe
[000d502c]                           dc.w $63fe
[000d502e]                           dc.w $60fe
[000d5030]                           dc.w $61fe
[000d5032]                           dc.w $611e
[000d5034]                           dc.w $6116
[000d5036]                           dc.w $7f1e
[000d5038]                           dc.w $7f06
[000d503a]                           dc.w $7f06
[000d503c]                           dc.w $7f06
[000d503e]                           dc.w $7f06
[000d5040]                           dc.w $7ffe
[000d5042]                           dc.w $0000
[000d5044]                           dc.w $0000
[000d5046]                           dc.w $7ffe
[000d5048]                           dc.w $63fe
[000d504a]                           dc.w $62fe
[000d504c]                           dc.w $63fe
[000d504e]                           dc.w $60fe
[000d5050]                           dc.w $61fe
[000d5052]                           dc.w $611e
[000d5054]                           dc.w $6116
[000d5056]                           dc.w $7f1e
[000d5058]                           dc.w $7f06
[000d505a]                           dc.w $7f06
[000d505c]                           dc.w $7f06
[000d505e]                           dc.w $7f06
[000d5060]                           dc.w $7ffe
[000d5062]                           dc.w $0000
[000d5064]                           dc.w $0000
[000d5066]                           dc.w $7ffe
[000d5068]                           dc.w $63fe
[000d506a]                           dc.w $62fe
[000d506c]                           dc.w $63fe
[000d506e]                           dc.w $60fe
[000d5070]                           dc.w $61fe
[000d5072]                           dc.w $611e
[000d5074]                           dc.w $6116
[000d5076]                           dc.w $7f1e
[000d5078]                           dc.w $7f06
[000d507a]                           dc.w $7f06
[000d507c]                           dc.w $7f06
[000d507e]                           dc.w $7f06
[000d5080]                           dc.w $7ffe
[000d5082]                           dc.w $0000
[000d5084]                           dc.w $0001
[000d5086]                           dc.w $3e01
[000d5088]                           dc.w $2301
[000d508a]                           dc.b '"Å#Å Å!'
[000d5091]                           dc.b $f1
[000d5092]                           dc.w $2119
[000d5094]                           dc.w $2115
[000d5096]                           dc.w $3f1d
[000d5098]                           dc.w $0105
[000d509a]                           dc.w $0105
[000d509c]                           dc.w $0105
[000d509e]                           dc.w $0105
[000d50a0]                           dc.w $01fd
[000d50a2]                           dc.w $ffff
DATAS_10:
[000d50a4]                           dc.w $ffff
[000d50a6]                           dc.w $ffff
[000d50a8]                           dc.w $ffff
[000d50aa]                           dc.w $ffff
[000d50ac]                           dc.w $ffff
[000d50ae]                           dc.w $ffff
[000d50b0]                           dc.w $ffff
[000d50b2]                           dc.w $ffff
[000d50b4]                           dc.w $ffff
[000d50b6]                           dc.w $ffff
[000d50b8]                           dc.w $ffff
[000d50ba]                           dc.w $ffff
[000d50bc]                           dc.w $ffff
[000d50be]                           dc.w $ffff
[000d50c0]                           dc.w $ffff
[000d50c2]                           dc.w $ffff
DATAS_11:
[000d50c4]                           dc.w $0000
[000d50c6]                           dc.w $0000
[000d50c8]                           dc.w $0088
[000d50ca]                           dc.w $0000
[000d50cc]                           dc.w $7ffe
[000d50ce]                           dc.w $63fe
[000d50d0]                           dc.w $62fe
[000d50d2]                           dc.w $63fe
[000d50d4]                           dc.w $60fe
[000d50d6]                           dc.w $61fe
[000d50d8]                           dc.w $611e
[000d50da]                           dc.w $6116
[000d50dc]                           dc.w $7f1e
[000d50de]                           dc.w $7f06
[000d50e0]                           dc.w $7f06
[000d50e2]                           dc.w $7f06
[000d50e4]                           dc.w $7f06
[000d50e6]                           dc.w $7ffe
[000d50e8]                           dc.w $0000
[000d50ea]                           dc.w $0000
[000d50ec]                           dc.w $7ffe
[000d50ee]                           dc.w $63fe
[000d50f0]                           dc.w $62fe
[000d50f2]                           dc.w $63fe
[000d50f4]                           dc.w $60fe
[000d50f6]                           dc.w $61fe
[000d50f8]                           dc.w $611e
[000d50fa]                           dc.w $6116
[000d50fc]                           dc.w $7f1e
[000d50fe]                           dc.w $7f06
[000d5100]                           dc.w $7f06
[000d5102]                           dc.w $7f06
[000d5104]                           dc.w $7f06
[000d5106]                           dc.w $7ffe
[000d5108]                           dc.w $0000
[000d510a]                           dc.w $0000
[000d510c]                           dc.w $7ffe
[000d510e]                           dc.w $63fe
[000d5110]                           dc.w $62fe
[000d5112]                           dc.w $63fe
[000d5114]                           dc.w $60fe
[000d5116]                           dc.w $61fe
[000d5118]                           dc.w $611e
[000d511a]                           dc.w $6116
[000d511c]                           dc.w $7f1e
[000d511e]                           dc.w $7f06
[000d5120]                           dc.w $7f06
[000d5122]                           dc.w $7f06
[000d5124]                           dc.w $7f06
[000d5126]                           dc.w $7ffe
[000d5128]                           dc.w $0000
[000d512a]                           dc.w $ffff
[000d512c]                           dc.w $be00
[000d512e]                           dc.w $a300
[000d5130]                           dc.w $a280
[000d5132]                           dc.w $a380
[000d5134]                           dc.w $a080
[000d5136]                           dc.w $a1f0
[000d5138]                           dc.w $a118
[000d513a]                           dc.w $a114
[000d513c]                           dc.w $bf1c
[000d513e]                           dc.w $8104
[000d5140]                           dc.w $8104
[000d5142]                           dc.w $8104
[000d5144]                           dc.w $8104
[000d5146]                           dc.w $81fc
[000d5148]                           dc.w $8000
DATAS_12:
[000d514a]                           dc.w $ffff
[000d514c]                           dc.w $ffff
[000d514e]                           dc.w $ffff
[000d5150]                           dc.w $ffff
[000d5152]                           dc.w $ffff
[000d5154]                           dc.w $ffff
[000d5156]                           dc.w $ffff
[000d5158]                           dc.w $ffff
[000d515a]                           dc.w $ffff
[000d515c]                           dc.w $ffff
[000d515e]                           dc.w $ffff
[000d5160]                           dc.w $ffff
[000d5162]                           dc.w $ffff
[000d5164]                           dc.w $ffff
[000d5166]                           dc.w $ffff
[000d5168]                           dc.w $ffff
DATAS_13:
[000d516a]                           dc.w $0000
[000d516c]                           dc.w $0000
[000d516e]                           dc.w $0088
[000d5170]                           dc.w $0000
[000d5172]                           dc.w $7ffe
[000d5174]                           dc.w $7ffe
[000d5176]                           dc.w $7ffe
[000d5178]                           dc.w $7ffe
[000d517a]                           dc.w $7ffe
[000d517c]                           dc.w $7ffe
[000d517e]                           dc.w $77fe
[000d5180]                           dc.w $7ffe
[000d5182]                           dc.w $7ffe
[000d5184]                           dc.w $7ffe
[000d5186]                           dc.w $7ffe
[000d5188]                           dc.w $7ffe
[000d518a]                           dc.w $7ffe
[000d518c]                           dc.w $7ffe
[000d518e]                           dc.w $0000
[000d5190]                           dc.w $0000
[000d5192]                           dc.w $7ffe
[000d5194]                           dc.w $7ffe
[000d5196]                           dc.w $7ffe
[000d5198]                           dc.w $7ffe
[000d519a]                           dc.w $7ffe
[000d519c]                           dc.w $7ffe
[000d519e]                           dc.w $7ffe
[000d51a0]                           dc.w $7ffe
[000d51a2]                           dc.w $7ffe
[000d51a4]                           dc.w $7ffe
[000d51a6]                           dc.w $7ffe
[000d51a8]                           dc.w $7ffe
[000d51aa]                           dc.w $7ffe
[000d51ac]                           dc.w $7ffe
[000d51ae]                           dc.w $0000
[000d51b0]                           dc.w $0000
[000d51b2]                           dc.w $7ffe
[000d51b4]                           dc.w $7ffe
[000d51b6]                           dc.w $7ffe
[000d51b8]                           dc.w $77fe
[000d51ba]                           dc.w $6abe
[000d51bc]                           dc.w $757e
[000d51be]                           dc.w $6bfe
[000d51c0]                           dc.w $7602
[000d51c2]                           dc.w $6c06
[000d51c4]                           dc.w $780e
[000d51c6]                           dc.w $701e
[000d51c8]                           dc.w $7ffe
[000d51ca]                           dc.w $7ffe
[000d51cc]                           dc.w $7ffe
[000d51ce]                           dc.w $0000
[000d51d0]                           dc.w $0001
[000d51d2]                           dc.w $0001
[000d51d4]                           dc.w $0071
[000d51d6]                           dc.w $1c8b
[000d51d8]                           dc.w $23e7
[000d51da]                           dc.b ' / !!'
[000d51df]                           dc.b $ff
[000d51e0]                           dc.w $2203
[000d51e2]                           dc.w $2405
[000d51e4]                           dc.w $2809
[000d51e6]                           dc.w $3011
[000d51e8]                           dc.w $3fe1
[000d51ea]                           dc.w $0001
[000d51ec]                           dc.w $0001
[000d51ee]                           dc.w $ffff
DATAS_14:
[000d51f0]                           dc.w $ffff
[000d51f2]                           dc.w $ffff
[000d51f4]                           dc.w $ffff
[000d51f6]                           dc.w $ffff
[000d51f8]                           dc.w $ffff
[000d51fa]                           dc.w $ffff
[000d51fc]                           dc.w $ffff
[000d51fe]                           dc.w $ffff
[000d5200]                           dc.w $ffff
[000d5202]                           dc.w $ffff
[000d5204]                           dc.w $ffff
[000d5206]                           dc.w $ffff
[000d5208]                           dc.w $ffff
[000d520a]                           dc.w $ffff
[000d520c]                           dc.w $ffff
[000d520e]                           dc.w $ffff
DATAS_15:
[000d5210]                           dc.w $0000
[000d5212]                           dc.w $0000
[000d5214]                           dc.w $008e
[000d5216]                           dc.w $0000
[000d5218]                           dc.w $7ffe
[000d521a]                           dc.w $7ffe
[000d521c]                           dc.w $7ffe
[000d521e]                           dc.w $7ffe
[000d5220]                           dc.w $7ffe
[000d5222]                           dc.w $7ffe
[000d5224]                           dc.w $7ffe
[000d5226]                           dc.w $7ffe
[000d5228]                           dc.w $7ffe
[000d522a]                           dc.w $7ffe
[000d522c]                           dc.w $7ffe
[000d522e]                           dc.w $7ffe
[000d5230]                           dc.w $7ffe
[000d5232]                           dc.w $7ffe
[000d5234]                           dc.w $0000
[000d5236]                           dc.w $0000
[000d5238]                           dc.w $7ffe
[000d523a]                           dc.w $7ffe
[000d523c]                           dc.w $7ffe
[000d523e]                           dc.w $7ffe
[000d5240]                           dc.w $7ffe
[000d5242]                           dc.w $7ffe
[000d5244]                           dc.w $7ffe
[000d5246]                           dc.w $7ffe
[000d5248]                           dc.w $7ffe
[000d524a]                           dc.w $7ffe
[000d524c]                           dc.w $7ffe
[000d524e]                           dc.w $7ffe
[000d5250]                           dc.w $7ffe
[000d5252]                           dc.w $7ffe
[000d5254]                           dc.w $0000
[000d5256]                           dc.w $0000
[000d5258]                           dc.w $7ffe
[000d525a]                           dc.w $7ffe
[000d525c]                           dc.w $7ffe
[000d525e]                           dc.w $77fe
[000d5260]                           dc.w $6abe
[000d5262]                           dc.w $757e
[000d5264]                           dc.w $6bfe
[000d5266]                           dc.w $7602
[000d5268]                           dc.w $6c06
[000d526a]                           dc.w $780e
[000d526c]                           dc.w $701e
[000d526e]                           dc.w $7ffe
[000d5270]                           dc.w $7ffe
[000d5272]                           dc.w $7ffe
[000d5274]                           dc.w $0000
[000d5276]                           dc.w $ffff
[000d5278]                           dc.w $8000
[000d527a]                           dc.w $8070
[000d527c]                           dc.w $9c8a
[000d527e]                           dc.w $a3e6
[000d5280]                           dc.w $a02e
[000d5282]                           dc.w $a020
[000d5284]                           dc.w $a1fe
[000d5286]                           dc.w $a202
[000d5288]                           dc.w $a404
[000d528a]                           dc.w $a808
[000d528c]                           dc.w $b010
[000d528e]                           dc.w $bfe0
[000d5290]                           dc.w $8000
[000d5292]                           dc.w $8000
[000d5294]                           dc.w $8000
DATAS_16:
[000d5296]                           dc.w $ffff
[000d5298]                           dc.w $ffff
[000d529a]                           dc.w $ffff
[000d529c]                           dc.w $ffff
[000d529e]                           dc.w $ffff
[000d52a0]                           dc.w $ffff
[000d52a2]                           dc.w $ffff
[000d52a4]                           dc.w $ffff
[000d52a6]                           dc.w $ffff
[000d52a8]                           dc.w $ffff
[000d52aa]                           dc.w $ffff
[000d52ac]                           dc.w $ffff
[000d52ae]                           dc.w $ffff
[000d52b0]                           dc.w $ffff
[000d52b2]                           dc.w $ffff
[000d52b4]                           dc.w $ffff
DATAS_17:
[000d52b6]                           dc.w $0000
[000d52b8]                           dc.w $0000
[000d52ba]                           dc.w $0088
[000d52bc]                           dc.w $0000
[000d52be]                           dc.w $7ffe
[000d52c0]                           dc.w $7ffe
[000d52c2]                           dc.w $7ffe
[000d52c4]                           dc.w $7ffe
[000d52c6]                           dc.w $7ffe
[000d52c8]                           dc.w $7ffe
[000d52ca]                           dc.w $7ffe
[000d52cc]                           dc.w $7f1e
[000d52ce]                           dc.w $7f16
[000d52d0]                           dc.w $7f1e
[000d52d2]                           dc.w $7f06
[000d52d4]                           dc.w $7f06
[000d52d6]                           dc.w $7f06
[000d52d8]                           dc.w $7ffe
[000d52da]                           dc.w $0000
[000d52dc]                           dc.w $0000
[000d52de]                           dc.w $7ffe
[000d52e0]                           dc.w $7ffe
[000d52e2]                           dc.w $7ffe
[000d52e4]                           dc.w $781e
[000d52e6]                           dc.w $7ffe
[000d52e8]                           dc.w $7ffe
[000d52ea]                           dc.w $7ffe
[000d52ec]                           dc.w $7f1e
[000d52ee]                           dc.w $7f16
[000d52f0]                           dc.w $7f1e
[000d52f2]                           dc.w $7f06
[000d52f4]                           dc.w $7f06
[000d52f6]                           dc.w $7f06
[000d52f8]                           dc.w $7ffe
[000d52fa]                           dc.w $0000
[000d52fc]                           dc.w $0000
[000d52fe]                           dc.w $7ffe
[000d5300]                           dc.w $7ffe
[000d5302]                           dc.w $57f6
[000d5304]                           dc.w $681a
[000d5306]                           dc.w $5ff6
[000d5308]                           dc.w $6aaa
[000d530a]                           dc.w $55f6
[000d530c]                           dc.w $6b1a
[000d530e]                           dc.w $5516
[000d5310]                           dc.w $6b1e
[000d5312]                           dc.w $5506
[000d5314]                           dc.w $6b06
[000d5316]                           dc.w $7f06
[000d5318]                           dc.w $7ffe
[000d531a]                           dc.w $0000
[000d531c]                           dc.w $0001
[000d531e]                           dc.w $03c1
[000d5320]                           dc.w $7e7d
[000d5322]                           dc.w $45a3
[000d5324]                           dc.w $4813
[000d5326]                           dc.w $4ff3
[000d5328]                           dc.w $4003
[000d532a]                           dc.w $41f3
[000d532c]                           dc.w $411b
[000d532e]                           dc.w $4117
[000d5330]                           dc.w $411f
[000d5332]                           dc.w $4107
[000d5334]                           dc.w $4107
[000d5336]                           dc.w $3f05
[000d5338]                           dc.w $01fd
[000d533a]                           dc.w $ffff
DATAS_18:
[000d533c]                           dc.w $ffff
[000d533e]                           dc.w $ffff
[000d5340]                           dc.w $ffff
[000d5342]                           dc.w $ffff
[000d5344]                           dc.w $ffff
[000d5346]                           dc.w $ffff
[000d5348]                           dc.w $ffff
[000d534a]                           dc.w $ffff
[000d534c]                           dc.w $ffff
[000d534e]                           dc.w $ffff
[000d5350]                           dc.w $ffff
[000d5352]                           dc.w $ffff
[000d5354]                           dc.w $ffff
[000d5356]                           dc.w $ffff
[000d5358]                           dc.w $ffff
[000d535a]                           dc.w $ffff
DATAS_19:
[000d535c]                           dc.w $0000
[000d535e]                           dc.w $0000
[000d5360]                           dc.w $0088
[000d5362]                           dc.w $0000
[000d5364]                           dc.w $7ffe
[000d5366]                           dc.w $7ffe
[000d5368]                           dc.w $7ffe
[000d536a]                           dc.w $7ffe
[000d536c]                           dc.w $7ffe
[000d536e]                           dc.w $7ffe
[000d5370]                           dc.w $7ffe
[000d5372]                           dc.w $7f1e
[000d5374]                           dc.w $7f16
[000d5376]                           dc.w $7f1e
[000d5378]                           dc.w $7f06
[000d537a]                           dc.w $7f06
[000d537c]                           dc.w $7f06
[000d537e]                           dc.w $7ffe
[000d5380]                           dc.w $0000
[000d5382]                           dc.w $0000
[000d5384]                           dc.w $7ffe
[000d5386]                           dc.w $7ffe
[000d5388]                           dc.w $7ffe
[000d538a]                           dc.w $781e
[000d538c]                           dc.w $7ffe
[000d538e]                           dc.w $7ffe
[000d5390]                           dc.w $7ffe
[000d5392]                           dc.w $7f1e
[000d5394]                           dc.w $7f16
[000d5396]                           dc.w $7f1e
[000d5398]                           dc.w $7f06
[000d539a]                           dc.w $7f06
[000d539c]                           dc.w $7f06
[000d539e]                           dc.w $7ffe
[000d53a0]                           dc.w $0000
[000d53a2]                           dc.w $0000
[000d53a4]                           dc.w $7ffe
[000d53a6]                           dc.w $7ffe
[000d53a8]                           dc.w $57f6
[000d53aa]                           dc.w $681a
[000d53ac]                           dc.w $5ff6
[000d53ae]                           dc.w $6aaa
[000d53b0]                           dc.w $55f6
[000d53b2]                           dc.w $6b1a
[000d53b4]                           dc.w $5516
[000d53b6]                           dc.w $6b1e
[000d53b8]                           dc.w $5506
[000d53ba]                           dc.w $6b06
[000d53bc]                           dc.w $7f06
[000d53be]                           dc.w $7ffe
[000d53c0]                           dc.w $0000
[000d53c2]                           dc.w $ffff
[000d53c4]                           dc.w $83c0
[000d53c6]                           dc.w $be7c
[000d53c8]                           dc.w $c5a2
[000d53ca]                           dc.w $c812
[000d53cc]                           dc.w $cff2
[000d53ce]                           dc.w $c002
[000d53d0]                           dc.w $c1f2
[000d53d2]                           dc.w $c11a
[000d53d4]                           dc.w $c116
[000d53d6]                           dc.w $c11e
[000d53d8]                           dc.w $c106
[000d53da]                           dc.w $c106
[000d53dc]                           dc.w $bf06
[000d53de]                           dc.w $81fc
[000d53e0]                           dc.w $8000
DATAS_20:
[000d53e2]                           dc.w $ffff
[000d53e4]                           dc.w $ffff
[000d53e6]                           dc.w $ffff
[000d53e8]                           dc.w $ffff
[000d53ea]                           dc.w $ffff
[000d53ec]                           dc.w $ffff
[000d53ee]                           dc.w $ffff
[000d53f0]                           dc.w $ffff
[000d53f2]                           dc.w $ffff
[000d53f4]                           dc.w $ffff
[000d53f6]                           dc.w $ffff
[000d53f8]                           dc.w $ffff
[000d53fa]                           dc.w $ffff
[000d53fc]                           dc.w $ffff
[000d53fe]                           dc.w $ffff
[000d5400]                           dc.w $ffff
DATAS_21:
[000d5402]                           dc.w $0000
[000d5404]                           dc.w $0000
[000d5406]                           dc.w $0088
[000d5408]                           dc.w $0000
[000d540a]                           dc.w $7ffe
[000d540c]                           dc.w $7ffe
[000d540e]                           dc.w $70be
[000d5410]                           dc.b 'pûpép'
[000d5415]                           dc.b $fe
[000d5416]                           dc.w $700e
[000d5418]                           dc.w $700e
[000d541a]                           dc.w $700e
[000d541c]                           dc.w $700e
[000d541e]                           dc.w $700e
[000d5420]                           dc.w $700e
[000d5422]                           dc.w $7ffe
[000d5424]                           dc.w $7ffe
[000d5426]                           dc.w $0000
[000d5428]                           dc.w $0000
[000d542a]                           dc.w $7ffe
[000d542c]                           dc.w $7ffe
[000d542e]                           dc.w $70be
[000d5430]                           dc.b 'pûpép'
[000d5435]                           dc.b $fe
[000d5436]                           dc.w $700e
[000d5438]                           dc.w $700e
[000d543a]                           dc.w $700e
[000d543c]                           dc.w $700e
[000d543e]                           dc.w $700e
[000d5440]                           dc.w $700e
[000d5442]                           dc.w $7ffe
[000d5444]                           dc.w $7ffe
[000d5446]                           dc.w $0000
[000d5448]                           dc.w $0000
[000d544a]                           dc.w $7ffe
[000d544c]                           dc.w $7ffe
[000d544e]                           dc.w $70be
[000d5450]                           dc.b 'pûpép'
[000d5455]                           dc.b $fe
[000d5456]                           dc.w $700e
[000d5458]                           dc.w $700e
[000d545a]                           dc.w $700e
[000d545c]                           dc.w $700e
[000d545e]                           dc.w $700e
[000d5460]                           dc.w $700e
[000d5462]                           dc.w $7ffe
[000d5464]                           dc.w $7ffe
[000d5466]                           dc.w $0000
[000d5468]                           dc.w $0001
[000d546a]                           dc.w $0001
[000d546c]                           dc.w $1fc1
[000d546e]                           dc.w $10e1
[000d5470]                           dc.w $10b1
[000d5472]                           dc.w $1099
[000d5474]                           dc.w $10f9
[000d5476]                           dc.w $1009
[000d5478]                           dc.w $1009
[000d547a]                           dc.w $1009
[000d547c]                           dc.w $1009
[000d547e]                           dc.w $1009
[000d5480]                           dc.w $1009
[000d5482]                           dc.w $1ff9
[000d5484]                           dc.w $0001
[000d5486]                           dc.w $ffff
DATAS_22:
[000d5488]                           dc.w $ffff
[000d548a]                           dc.w $ffff
[000d548c]                           dc.w $ffff
[000d548e]                           dc.w $ffff
[000d5490]                           dc.w $ffff
[000d5492]                           dc.w $ffff
[000d5494]                           dc.w $ffff
[000d5496]                           dc.w $ffff
[000d5498]                           dc.w $ffff
[000d549a]                           dc.w $ffff
[000d549c]                           dc.w $ffff
[000d549e]                           dc.w $ffff
[000d54a0]                           dc.w $ffff
[000d54a2]                           dc.w $ffff
[000d54a4]                           dc.w $ffff
[000d54a6]                           dc.w $ffff
DATAS_23:
[000d54a8]                           dc.w $0000
[000d54aa]                           dc.w $0000
[000d54ac]                           dc.w $0088
[000d54ae]                           dc.w $0000
[000d54b0]                           dc.w $7ffe
[000d54b2]                           dc.w $7ffe
[000d54b4]                           dc.w $70be
[000d54b6]                           dc.b 'pûpép'
[000d54bb]                           dc.b $fe
[000d54bc]                           dc.w $700e
[000d54be]                           dc.w $700e
[000d54c0]                           dc.w $700e
[000d54c2]                           dc.w $700e
[000d54c4]                           dc.w $700e
[000d54c6]                           dc.w $700e
[000d54c8]                           dc.w $7ffe
[000d54ca]                           dc.w $7ffe
[000d54cc]                           dc.w $0000
[000d54ce]                           dc.w $0000
[000d54d0]                           dc.w $7ffe
[000d54d2]                           dc.w $7ffe
[000d54d4]                           dc.w $70be
[000d54d6]                           dc.b 'pûpép'
[000d54db]                           dc.b $fe
[000d54dc]                           dc.w $700e
[000d54de]                           dc.w $700e
[000d54e0]                           dc.w $700e
[000d54e2]                           dc.w $700e
[000d54e4]                           dc.w $700e
[000d54e6]                           dc.w $700e
[000d54e8]                           dc.w $7ffe
[000d54ea]                           dc.w $7ffe
[000d54ec]                           dc.w $0000
[000d54ee]                           dc.w $0000
[000d54f0]                           dc.w $7ffe
[000d54f2]                           dc.w $7ffe
[000d54f4]                           dc.w $70be
[000d54f6]                           dc.b 'pûpép'
[000d54fb]                           dc.b $fe
[000d54fc]                           dc.w $700e
[000d54fe]                           dc.w $700e
[000d5500]                           dc.w $700e
[000d5502]                           dc.w $700e
[000d5504]                           dc.w $700e
[000d5506]                           dc.w $700e
[000d5508]                           dc.w $7ffe
[000d550a]                           dc.w $7ffe
[000d550c]                           dc.w $0000
[000d550e]                           dc.w $ffff
[000d5510]                           dc.w $8000
[000d5512]                           dc.w $9fc0
[000d5514]                           dc.w $90e0
[000d5516]                           dc.w $90b0
[000d5518]                           dc.w $9098
[000d551a]                           dc.w $90f8
[000d551c]                           dc.w $9008
[000d551e]                           dc.w $9008
[000d5520]                           dc.w $9008
[000d5522]                           dc.w $9008
[000d5524]                           dc.w $9008
[000d5526]                           dc.w $9008
[000d5528]                           dc.w $9ff8
[000d552a]                           dc.w $8000
[000d552c]                           dc.w $8000
DATAS_24:
[000d552e]                           dc.w $ffff
[000d5530]                           dc.w $ffff
[000d5532]                           dc.w $ffff
[000d5534]                           dc.w $ffff
[000d5536]                           dc.w $ffff
[000d5538]                           dc.w $ffff
[000d553a]                           dc.w $ffff
[000d553c]                           dc.w $ffff
[000d553e]                           dc.w $ffff
[000d5540]                           dc.w $ffff
[000d5542]                           dc.w $ffff
[000d5544]                           dc.w $ffff
[000d5546]                           dc.w $ffff
[000d5548]                           dc.w $ffff
[000d554a]                           dc.w $ffff
[000d554c]                           dc.w $ffff
A_3DBUTTON06:
[000d554e] 00064a22                  dc.l A_3Dbutton
[000d5552]                           dc.w $29f1
[000d5554]                           dc.w $9178
[000d5556] 000630f2                  dc.l Auo_string
[000d555a]                           dc.w $0000
[000d555c]                           dc.w $0000
[000d555e]                           dc.w $0000
[000d5560]                           dc.w $0000
[000d5562]                           dc.w $0000
[000d5564]                           dc.w $0000
[000d5566]                           dc.w $0000
[000d5568]                           dc.w $0000
[000d556a]                           dc.w $0000
[000d556c]                           dc.w $0000
A_EDITOR01:
[000d556e] 00037bfa                  dc.l A_editor
[000d5572]                           dc.w $0000
[000d5574]                           dc.w $0000
[000d5576] 0003a772                  dc.l Auo_editor
[000d557a]                           dc.w $0000
[000d557c]                           dc.w $0000
[000d557e]                           dc.w $0000
[000d5580]                           dc.w $0000
[000d5582]                           dc.w $0000
[000d5584]                           dc.w $0000
[000d5586]                           dc.w $0000
[000d5588]                           dc.w $0000
[000d558a]                           dc.w $0000
[000d558c]                           dc.w $0000
A_SELECT01:
[000d558e] 000661d6                  dc.l A_select
[000d5592]                           dc.w $0000
[000d5594]                           dc.w $0000
[000d5596]                           dc.w $0000
[000d5598]                           dc.w $0000
[000d559a]                           dc.w $0000
[000d559c]                           dc.w $0000
[000d559e]                           dc.w $0000
[000d55a0]                           dc.w $0000
[000d55a2]                           dc.w $0000
[000d55a4]                           dc.w $0000
[000d55a6]                           dc.w $0000
[000d55a8]                           dc.w $0000
[000d55aa]                           dc.w $0000
[000d55ac]                           dc.w $0000
A_WISLIDER01:
[000d55ae] 00037828                  dc.l A_wislider
[000d55b2]                           dc.w $0000
[000d55b4]                           dc.w $0001
[000d55b6] 00037834                  dc.l Auo_wislider
[000d55ba]                           dc.w $0000
[000d55bc]                           dc.w $0000
[000d55be]                           dc.w $0000
[000d55c0]                           dc.w $0000
[000d55c2]                           dc.w $0000
[000d55c4]                           dc.w $0000
[000d55c6]                           dc.w $0000
[000d55c8]                           dc.w $0000
[000d55ca]                           dc.w $0000
[000d55cc]                           dc.w $0000
_C4_IC_COPY:
[000d55ce]                           dc.w $0004
[000d55d0] 000d5024                  dc.l $000d5024
[000d55d4] 000d50a4                  dc.l DATAS_10
[000d55d8] 000d50ca                  dc.l $000d50ca
[000d55dc] 000d514a                  dc.l DATAS_12
[000d55e0]                           dc.w $0000
[000d55e2]                           dc.w $0000
_MSK_IC_COPY:
[000d55e4]                           dc.w $0000
[000d55e6]                           dc.w $7e00
[000d55e8]                           dc.w $7f00
[000d55ea]                           dc.w $7f80
[000d55ec]                           dc.w $7f80
[000d55ee]                           dc.w $7f80
[000d55f0]                           dc.w $7ff8
[000d55f2]                           dc.w $7ffc
[000d55f4]                           dc.w $7ffe
[000d55f6]                           dc.w $7ffe
[000d55f8]                           dc.w $01fe
[000d55fa]                           dc.w $01fe
[000d55fc]                           dc.w $01fe
[000d55fe]                           dc.w $01fe
[000d5600]                           dc.w $01fe
[000d5602]                           dc.w $0000
_DAT_IC_COPY:
[000d5604]                           dc.w $0000
[000d5606]                           dc.w $7e00
[000d5608]                           dc.w $4300
[000d560a]                           dc.w $4280
[000d560c]                           dc.w $4380
[000d560e]                           dc.w $4080
[000d5610]                           dc.w $41f8
[000d5612]                           dc.w $410c
[000d5614]                           dc.w $410a
[000d5616]                           dc.w $7f0e
[000d5618]                           dc.w $0102
[000d561a]                           dc.w $0102
[000d561c]                           dc.w $0102
[000d561e]                           dc.w $0102
[000d5620]                           dc.w $01fe
[000d5622]                           dc.w $0000
IC_COPY:
[000d5624] 000d55e4                  dc.l _MSK_IC_COPY
[000d5628] 000d5604                  dc.l _DAT_IC_COPY
[000d562c] 000d4ed0                  dc.l TEXT_002
[000d5630]                           dc.w $1000
[000d5632]                           dc.w $0006
[000d5634]                           dc.w $0006
[000d5636]                           dc.w $0000
[000d5638]                           dc.w $0000
[000d563a]                           dc.w $0010
[000d563c]                           dc.w $0010
[000d563e]                           dc.w $0006
[000d5640]                           dc.w $0006
[000d5642]                           dc.w $0000
[000d5644]                           dc.w $0000
[000d5646] 000d55ce                  dc.l _C4_IC_COPY
_C4_IC_CUT:
[000d564a]                           dc.w $0004
[000d564c] 000d4ed8                  dc.l $000d4ed8
[000d5650] 000d4f58                  dc.l DATAS_06
[000d5654] 000d4f7e                  dc.l $000d4f7e
[000d5658] 000d4ffe                  dc.l DATAS_08
[000d565c]                           dc.w $0000
[000d565e]                           dc.w $0000
_MSK_IC_CUT:
[000d5660]                           dc.w $3ffe
[000d5662]                           dc.w $3ffe
[000d5664]                           dc.w $3ffe
[000d5666]                           dc.w $3ffe
[000d5668]                           dc.w $3ffe
[000d566a]                           dc.w $3ffe
[000d566c]                           dc.w $3ffe
[000d566e]                           dc.w $3ffe
[000d5670]                           dc.w $3ffe
[000d5672]                           dc.w $3ffe
[000d5674]                           dc.w $3ffe
[000d5676]                           dc.w $3ffe
[000d5678]                           dc.w $3ffe
[000d567a]                           dc.w $3ffe
[000d567c]                           dc.w $3ffe
[000d567e]                           dc.w $3ffe
_DAT_IC_CUT:
[000d5680]                           dc.w $3ffe
[000d5682]                           dc.b '""""""#b!B!'
[000d568d]                           dc.b $c2
[000d568e]                           dc.w $2082
[000d5690]                           dc.w $21c2
[000d5692]                           dc.b ''r)J)J)J)2&'
[000d569d]                           dc.b $02
[000d569e]                           dc.w $3ffe
IC_CUT:
[000d56a0] 000d5660                  dc.l _MSK_IC_CUT
[000d56a4] 000d5680                  dc.l _DAT_IC_CUT
[000d56a8] 000d4ed0                  dc.l TEXT_002
[000d56ac]                           dc.w $1000
[000d56ae]                           dc.w $0006
[000d56b0]                           dc.w $0006
[000d56b2]                           dc.w $0000
[000d56b4]                           dc.w $0000
[000d56b6]                           dc.w $0010
[000d56b8]                           dc.w $0010
[000d56ba]                           dc.w $0006
[000d56bc]                           dc.w $0006
[000d56be]                           dc.w $0000
[000d56c0]                           dc.w $0000
[000d56c2] 000d564a                  dc.l _C4_IC_CUT
_C4_IC_NEW:
[000d56c6]                           dc.w $0004
[000d56c8] 000d5408                  dc.l $000d5408
[000d56cc] 000d5488                  dc.l DATAS_22
[000d56d0] 000d54ae                  dc.l $000d54ae
[000d56d4] 000d552e                  dc.l DATAS_24
[000d56d8]                           dc.w $0000
[000d56da]                           dc.w $0000
_MSK_IC_NEW:
[000d56dc]                           dc.w $0000
[000d56de]                           dc.w $3fe0
[000d56e0]                           dc.w $3ff0
[000d56e2]                           dc.w $3ff8
[000d56e4]                           dc.w $3ffc
[000d56e6]                           dc.w $3ffc
[000d56e8]                           dc.w $3ffc
[000d56ea]                           dc.w $3ffc
[000d56ec]                           dc.w $3ffc
[000d56ee]                           dc.w $3ffc
[000d56f0]                           dc.w $3ffc
[000d56f2]                           dc.w $3ffc
[000d56f4]                           dc.w $3ffc
[000d56f6]                           dc.w $3ffc
[000d56f8]                           dc.w $3ffc
[000d56fa]                           dc.w $0000
_DAT_IC_NEW:
[000d56fc]                           dc.w $0000
[000d56fe]                           dc.w $3fe0
[000d5700]                           dc.b ' p X L | '
[000d5709]                           dc.b $04
[000d570a]                           dc.w $2004
[000d570c]                           dc.w $2004
[000d570e]                           dc.w $2004
[000d5710]                           dc.w $2004
[000d5712]                           dc.w $2004
[000d5714]                           dc.w $2004
[000d5716]                           dc.w $2004
[000d5718]                           dc.w $3ffc
[000d571a]                           dc.w $0000
IC_NEW:
[000d571c] 000d56dc                  dc.l _MSK_IC_NEW
[000d5720] 000d56fc                  dc.l _DAT_IC_NEW
[000d5724] 000d4ed0                  dc.l TEXT_002
[000d5728]                           dc.w $1000
[000d572a]                           dc.w $0006
[000d572c]                           dc.w $0006
[000d572e]                           dc.w $0000
[000d5730]                           dc.w $0000
[000d5732]                           dc.w $0010
[000d5734]                           dc.w $0010
[000d5736]                           dc.w $0006
[000d5738]                           dc.w $0006
[000d573a]                           dc.w $0000
[000d573c]                           dc.w $0000
[000d573e] 000d56c6                  dc.l _C4_IC_NEW
_C4_IC_OPEN:
[000d5742]                           dc.w $0004
[000d5744] 000d5170                  dc.l $000d5170
[000d5748] 000d51f0                  dc.l DATAS_14
[000d574c] 000d5216                  dc.l $000d5216
[000d5750] 000d5296                  dc.l DATAS_16
[000d5754]                           dc.w $0000
[000d5756]                           dc.w $0000
_MSK_IC_OPEN:
[000d5758]                           dc.w $0000
[000d575a]                           dc.w $01f0
[000d575c]                           dc.w $03f8
[000d575e]                           dc.w $03ff
[000d5760]                           dc.w $3fff
[000d5762]                           dc.w $7fff
[000d5764]                           dc.w $7fff
[000d5766]                           dc.w $7fff
[000d5768]                           dc.w $7ffe
[000d576a]                           dc.w $7ffe
[000d576c]                           dc.w $7ffe
[000d576e]                           dc.w $7ffc
[000d5770]                           dc.w $7ff8
[000d5772]                           dc.w $7ff0
[000d5774]                           dc.w $7fe0
[000d5776]                           dc.w $0000
_DAT_IC_OPEN:
[000d5778]                           dc.w $0000
[000d577a]                           dc.w $0000
[000d577c]                           dc.w $00e0
[000d577e]                           dc.w $0110
[000d5780]                           dc.w $3c0a
[000d5782]                           dc.w $4206
[000d5784]                           dc.w $41ce
[000d5786]                           dc.b '@ @ C'
[000d578b]                           dc.b $fc
[000d578c]                           dc.w $4402
[000d578e]                           dc.w $4804
[000d5790]                           dc.w $5008
[000d5792]                           dc.w $6010
[000d5794]                           dc.w $7fe0
[000d5796]                           dc.w $0000
IC_OPEN:
[000d5798] 000d5758                  dc.l _MSK_IC_OPEN
[000d579c] 000d5778                  dc.l _DAT_IC_OPEN
[000d57a0] 000d4ed0                  dc.l TEXT_002
[000d57a4]                           dc.w $1000
[000d57a6]                           dc.w $0006
[000d57a8]                           dc.w $0006
[000d57aa]                           dc.w $0000
[000d57ac]                           dc.w $0000
[000d57ae]                           dc.w $0010
[000d57b0]                           dc.w $0010
[000d57b2]                           dc.w $0006
[000d57b4]                           dc.w $0006
[000d57b6]                           dc.w $0000
[000d57b8]                           dc.w $0000
[000d57ba] 000d5742                  dc.l _C4_IC_OPEN
_C4_IC_PASTE:
[000d57be]                           dc.w $0004
[000d57c0] 000d52bc                  dc.l $000d52bc
[000d57c4] 000d533c                  dc.l DATAS_18
[000d57c8] 000d5362                  dc.l $000d5362
[000d57cc] 000d53e2                  dc.l DATAS_20
[000d57d0]                           dc.w $0000
[000d57d2]                           dc.w $0000
_MSK_IC_PASTE:
[000d57d4]                           dc.w $03c0
[000d57d6]                           dc.w $3ffc
[000d57d8]                           dc.w $7ffe
[000d57da]                           dc.w $7ffe
[000d57dc]                           dc.w $7ffe
[000d57de]                           dc.w $7ffe
[000d57e0]                           dc.w $7ffe
[000d57e2]                           dc.w $7ffe
[000d57e4]                           dc.w $7ffe
[000d57e6]                           dc.w $7ffe
[000d57e8]                           dc.w $7ffe
[000d57ea]                           dc.w $7ffe
[000d57ec]                           dc.w $7ffe
[000d57ee]                           dc.w $3ffe
[000d57f0]                           dc.w $00fe
[000d57f2]                           dc.w $0000
_DAT_IC_PASTE:
[000d57f4]                           dc.w $03c0
[000d57f6]                           dc.w $3e7c
[000d57f8]                           dc.w $45a2
[000d57fa]                           dc.w $47e2
[000d57fc]                           dc.w $4002
[000d57fe]                           dc.w $4002
[000d5800]                           dc.w $4002
[000d5802]                           dc.w $4002
[000d5804]                           dc.w $40fa
[000d5806]                           dc.w $408e
[000d5808]                           dc.w $408a
[000d580a]                           dc.w $408e
[000d580c]                           dc.w $4082
[000d580e]                           dc.w $3f82
[000d5810]                           dc.w $00fe
[000d5812]                           dc.w $0000
IC_PASTE:
[000d5814] 000d57d4                  dc.l _MSK_IC_PASTE
[000d5818] 000d57f4                  dc.l _DAT_IC_PASTE
[000d581c] 000d4ed0                  dc.l TEXT_002
[000d5820]                           dc.w $1000
[000d5822]                           dc.w $0006
[000d5824]                           dc.w $0006
[000d5826]                           dc.w $0000
[000d5828]                           dc.w $0000
[000d582a]                           dc.w $0010
[000d582c]                           dc.w $0010
[000d582e]                           dc.w $0006
[000d5830]                           dc.w $0006
[000d5832]                           dc.w $0000
[000d5834]                           dc.w $0000
[000d5836] 000d57be                  dc.l _C4_IC_PASTE
D_LIST:
[000d583a]                           dc.w $ffff
[000d583c]                           dc.w $0002
[000d583e]                           dc.w $0004
[000d5840]                           dc.w $0018
[000d5842]                           dc.w $1840
[000d5844]                           dc.w $0000
[000d5846] 000d556e                  dc.l A_EDITOR01
[000d584a]                           dc.w $0000
[000d584c]                           dc.w $0000
[000d584e]                           dc.w $001e
[000d5850]                           dc.w $000a
_00aD_LIST:
[000d5852] 000418ce                  dc.l list_click
[000d5856] 0004182c                  dc.l list_acc
[000d585a]                           dc.w $8000
[000d585c]                           dc.w $0000
[000d585e]                           dc.w $0000
[000d5860]                           dc.w $0000
[000d5862]                           dc.w $0000
[000d5864]                           dc.w $0000
[000d5866]                           dc.w $0000
[000d5868]                           dc.w $0000
_02_D_LIST:
[000d586a]                           dc.w $0004
[000d586c]                           dc.w $ffff
[000d586e]                           dc.w $ffff
[000d5870]                           dc.w $0018
[000d5872]                           dc.w $2000
[000d5874]                           dc.w $0000
[000d5876] 000d558e                  dc.l A_SELECT01
[000d587a]                           dc.w $0000
[000d587c]                           dc.w $0000
[000d587e]                           dc.w $0000
[000d5880]                           dc.w $0000
_02aD_LIST:
[000d5882]                           dc.w $0000
[000d5884]                           dc.w $0000
[000d5886]                           dc.w $0000
[000d5888]                           dc.w $0000
[000d588a]                           dc.w $8000
[000d588c]                           dc.w $0000
[000d588e]                           dc.w $0000
[000d5890]                           dc.w $0000
[000d5892]                           dc.w $0000
[000d5894]                           dc.w $0000
[000d5896]                           dc.w $0000
[000d5898]                           dc.w $0000
_04_D_LIST:
[000d589a]                           dc.w $0000
[000d589c]                           dc.w $ffff
[000d589e]                           dc.w $ffff
[000d58a0]                           dc.w $0018
[000d58a2]                           dc.w $0060
[000d58a4]                           dc.w $0000
[000d58a6] 000d55ae                  dc.l A_WISLIDER01
[000d58aa]                           dc.w $001c
[000d58ac]                           dc.w $0000
[000d58ae]                           dc.w $0000
[000d58b0]                           dc.w $0000
T_LIST:
[000d58b2]                           dc.w $ffff
[000d58b4]                           dc.w $0001
[000d58b6]                           dc.w $0009
[000d58b8]                           dc.w $0018
[000d58ba]                           dc.w $0040
[000d58bc]                           dc.w $0000
[000d58be] 000d554e                  dc.l A_3DBUTTON06
[000d58c2]                           dc.w $0000
[000d58c4]                           dc.w $0000
[000d58c6]                           dc.w $0032
[000d58c8]                           dc.w $1600
_01_T_LIST:
[000d58ca]                           dc.w $0003
[000d58cc]                           dc.w $ffff
[000d58ce]                           dc.w $ffff
[000d58d0]                           dc.w $001f
[000d58d2]                           dc.w $0005
[000d58d4]                           dc.w $0000
[000d58d6] 000d571c                  dc.l IC_NEW
[000d58da]                           dc.w $0300
[000d58dc]                           dc.w $0300
[000d58de]                           dc.w $1000
[000d58e0]                           dc.w $1000
_01aT_LIST:
[000d58e2] 00041c38                  dc.l list_new
[000d58e6]                           dc.w $0000
[000d58e8]                           dc.w $0000
[000d58ea]                           dc.w $8000
[000d58ec]                           dc.w $844e
[000d58ee]                           dc.w $0000
[000d58f0]                           dc.w $0000
[000d58f2]                           dc.w $0000
[000d58f4]                           dc.w $0000
[000d58f6]                           dc.w $0000
[000d58f8]                           dc.w $0000
_03_T_LIST:
[000d58fa]                           dc.w $0005
[000d58fc]                           dc.w $ffff
[000d58fe]                           dc.w $ffff
[000d5900]                           dc.w $001f
[000d5902]                           dc.w $0005
[000d5904]                           dc.w $0008
[000d5906] 000d5798                  dc.l IC_OPEN
[000d590a]                           dc.w $0302
[000d590c]                           dc.w $0300
[000d590e]                           dc.w $1000
[000d5910]                           dc.w $1000
_03aT_LIST:
[000d5912] 00041cb6                  dc.l list_open
[000d5916]                           dc.w $0000
[000d5918]                           dc.w $0000
[000d591a]                           dc.w $8000
[000d591c]                           dc.w $844f
[000d591e]                           dc.w $0000
[000d5920]                           dc.w $0000
[000d5922]                           dc.w $0000
[000d5924]                           dc.w $0000
[000d5926]                           dc.w $0000
[000d5928]                           dc.w $0000
_05_T_LIST:
[000d592a]                           dc.w $0007
[000d592c]                           dc.w $ffff
[000d592e]                           dc.w $ffff
[000d5930]                           dc.w $001f
[000d5932]                           dc.w $0005
[000d5934]                           dc.w $0008
[000d5936] 000d56a0                  dc.l IC_CUT
[000d593a]                           dc.w $0306
[000d593c]                           dc.w $0300
[000d593e]                           dc.w $1000
[000d5940]                           dc.w $1000
_05aT_LIST:
[000d5942] 00041bb0                  dc.l list_cut
[000d5946]                           dc.w $0000
[000d5948]                           dc.w $0000
[000d594a]                           dc.w $8000
[000d594c]                           dc.w $8458
[000d594e]                           dc.w $0000
[000d5950]                           dc.w $0000
[000d5952]                           dc.w $0000
[000d5954]                           dc.w $0000
[000d5956]                           dc.w $0000
[000d5958]                           dc.w $0000
_07_T_LIST:
[000d595a]                           dc.w $0009
[000d595c]                           dc.w $ffff
[000d595e]                           dc.w $ffff
[000d5960]                           dc.w $001f
[000d5962]                           dc.w $0005
[000d5964]                           dc.w $0008
[000d5966] 000d5624                  dc.l IC_COPY
[000d596a]                           dc.w $0308
[000d596c]                           dc.w $0300
[000d596e]                           dc.w $1000
[000d5970]                           dc.w $1000
_07aT_LIST:
[000d5972] 00041b2a                  dc.l list_copy
[000d5976]                           dc.w $0000
[000d5978]                           dc.w $0000
[000d597a]                           dc.w $8000
[000d597c]                           dc.w $8443
[000d597e]                           dc.w $0000
[000d5980]                           dc.w $0000
[000d5982]                           dc.w $0000
[000d5984]                           dc.w $0000
[000d5986]                           dc.w $0000
[000d5988]                           dc.w $0000
_09_T_LIST:
[000d598a]                           dc.w $0000
[000d598c]                           dc.w $ffff
[000d598e]                           dc.w $ffff
[000d5990]                           dc.w $001f
[000d5992]                           dc.w $0005
[000d5994]                           dc.w $0008
[000d5996] 000d5814                  dc.l IC_PASTE
[000d599a]                           dc.w $030a
[000d599c]                           dc.w $0300
[000d599e]                           dc.w $1000
[000d59a0]                           dc.w $1000
_09aT_LIST:
[000d59a2] 00041d90                  dc.l list_paste
[000d59a6]                           dc.w $0000
[000d59a8]                           dc.w $0000
[000d59aa]                           dc.w $8020
[000d59ac]                           dc.w $8456
[000d59ae]                           dc.w $0000
[000d59b0]                           dc.w $0000
[000d59b2]                           dc.w $0000
[000d59b4]                           dc.w $0000
[000d59b6]                           dc.w $0000
[000d59b8]                           dc.w $0000
LIST_WINDOW:
[000d59ba]                           dc.w $0000
[000d59bc]                           dc.w $0000
[000d59be] 000420b2                  dc.l serv_list
[000d59c2] 00041e7a                  dc.l make_list
[000d59c6] 00057428                  dc.l Awi_open
[000d59ca] 00055e94                  dc.l Awi_init
[000d59ce] 000d583a                  dc.l D_LIST
[000d59d2] 000d58b2                  dc.l T_LIST
[000d59d6]                           dc.w $0000
[000d59d8]                           dc.w $0000
[000d59da]                           dc.w $ffff
[000d59dc]                           dc.w $41ef
[000d59de]                           dc.w $0000
[000d59e0]                           dc.w $0000
[000d59e2]                           dc.w $0078
[000d59e4]                           dc.w $0032
[000d59e6]                           dc.w $0000
[000d59e8]                           dc.w $0000
[000d59ea]                           dc.w $0000
[000d59ec]                           dc.w $0000
[000d59ee]                           dc.w $0000
[000d59f0]                           dc.w $0000
[000d59f2]                           dc.w $0000
[000d59f4]                           dc.w $0000
[000d59f6]                           dc.w $ffff
[000d59f8]                           dc.w $ffff
[000d59fa]                           dc.w $ffff
[000d59fc]                           dc.w $ffff
[000d59fe]                           dc.w $0000
[000d5a00]                           dc.w $0000
[000d5a02]                           dc.w $f8f8
[000d5a04] 000d4ed1                  dc.l TEXT_01
[000d5a08] 000d4ed0                  dc.l TEXT_002
[000d5a0c]                           dc.w $0000
[000d5a0e]                           dc.w $0100
[000d5a10]                           dc.w $0000
[000d5a12]                           dc.w $ffff
[000d5a14]                           dc.w $0000
[000d5a16]                           dc.w $0000
[000d5a18]                           dc.w $0000
[000d5a1a]                           dc.w $0000
[000d5a1c] 000416c6                  dc.l key_list
[000d5a20] 00051852                  dc.l Awi_obchange
[000d5a24] 00051c46                  dc.l Awi_redraw
[000d5a28] 000587a4                  dc.l Awi_topped
[000d5a2c] 00058362                  dc.l Awi_closed
[000d5a30] 000415e6                  dc.l full_list
[000d5a34] 0005217c                  dc.l Awi_arrowed
[000d5a38] 000524b4                  dc.l Awi_hslid
[000d5a3c] 000422ae                  dc.l vslide_list
[000d5a40] 000421ce                  dc.l size_list
[000d5a44] 00058d50                  dc.l Awi_moved
[000d5a48] 0005998a                  dc.l Awi_iconify
[000d5a4c] 00059c6c                  dc.l Awi_uniconify
[000d5a50] 0005b5b6                  dc.l Awi_gemscript
[000d5a54]                           dc.w $0000
[000d5a56]                           dc.w $0000
[000d5a58]                           dc.w $0000
[000d5a5a]                           dc.w $0000
[000d5a5c]                           dc.w $0000
[000d5a5e]                           dc.w $0000
[000d5a60]                           dc.w $0000
[000d5a62]                           dc.w $0000
[000d5a64]                           dc.w $0000
[000d5a66]                           dc.w $0000
[000d5a68]                           dc.w $0000
[000d5a6a]                           dc.w $0000
[000d5a6c]                           dc.w $0000
[000d5a6e]                           dc.w $0000
[000d5a70]                           dc.w $0000
[000d5a72]                           dc.w $0000
[000d5a74]                           dc.w $0000
[000d5a76]                           dc.w $0000
[000d5a78]                           dc.w $0000
[000d5a7a]                           dc.w $0000
[000d5a7c]                           dc.w $0000
[000d5a7e]                           dc.w $0000
[000d5a80]                           dc.w $0000
[000d5a82]                           dc.w $0000
[000d5a84]                           dc.w $0000
[000d5a86]                           dc.w $0000
[000d5a88]                           dc.w $0000
[000d5a8a]                           dc.w $0000
[000d5a8c]                           dc.w $0000
[000d5a8e]                           dc.w $0000
[000d5a90]                           dc.w $0000
[000d5a92]                           dc.w $0000
[000d5a94]                           dc.w $0000
[000d5a96]                           dc.w $0000
[000d5a98]                           dc.w $0000
[000d5a9a]                           dc.w $0000
[000d5a9c]                           dc.w $0000
[000d5a9e]                           dc.w $0000
[000d5aa0]                           dc.w $0000
[000d5aa2]                           dc.w $0000
[000d5aa4]                           dc.w $0000
[000d5aa6]                           dc.w $0000
[000d5aa8]                           dc.w $0000
[000d5aaa]                           dc.w $0000
[000d5aac]                           dc.w $0000
[000d5aae]                           dc.w $0000
[000d5ab0]                           dc.w $0000
[000d5ab2]                           dc.w $0000
[000d5ab4]                           dc.w $0000
[000d5ab6]                           dc.w $0000
[000d5ab8]                           dc.w $0000
[000d5aba]                           dc.w $0000
