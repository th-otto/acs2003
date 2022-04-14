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

; start acsplus\proto.c

proto_fulled:
[000422ee] 48e7 0038                 movem.l    a2-a4,-(a7)
[000422f2] 2448                      movea.l    a0,a2
[000422f4] 47ea 0024                 lea.l      36(a2),a3
[000422f8] 49ea 002c                 lea.l      44(a2),a4
[000422fc] 7001                      moveq.l    #1,d0
[000422fe] c06a 0056                 and.w      86(a2),d0
[00042302] 6724                      beq.s      $00042328
[00042304] 3694                      move.w     (a4),(a3)
[00042306] 376c 0002 0002            move.w     2(a4),2(a3)
[0004230c] 376c 0004 0004            move.w     4(a4),4(a3)
[00042312] 376c 0006 0006            move.w     6(a4),6(a3)
[00042318] 224c                      movea.l    a4,a1
[0004231a] 4eb9 0004 27da            jsr        proto_sized
[00042320] 026a fffe 0056            andi.w     #$FFFE,86(a2)
[00042326] 602a                      bra.s      $00042352
[00042328] 3893                      move.w     (a3),(a4)
[0004232a] 396b 0002 0002            move.w     2(a3),2(a4)
[00042330] 396b 0004 0004            move.w     4(a3),4(a4)
[00042336] 396b 0006 0006            move.w     6(a3),6(a4)
[0004233c] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042342] 5049                      addq.w     #8,a1
[00042344] 204a                      movea.l    a2,a0
[00042346] 4eb9 0004 27da            jsr        proto_sized
[0004234c] 006a 0001 0056            ori.w      #$0001,86(a2)
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
[000423a0] b07c 0007                 cmp.w      #$0007,d0
[000423a4] 6200 00a2                 bhi        $00042448
[000423a8] d040                      add.w      d0,d0
[000423aa] 303b 0006                 move.w     $000423B2(pc,d0.w),d0
[000423ae] 4efb 0002                 jmp        $000423B2(pc,d0.w)
J34:
[000423b2] 0034                      dc.w $0034   ; $000423e6-$000423b2
[000423b4] 0046                      dc.w $0046   ; $000423f8-$000423b2
[000423b6] 0010                      dc.w $0010   ; $000423c2-$000423b2
[000423b8] 0022                      dc.w $0022   ; $000423d4-$000423b2
[000423ba] 005c                      dc.w $005c   ; $0004240e-$000423b2
[000423bc] 006a                      dc.w $006a   ; $0004241c-$000423b2
[000423be] 007a                      dc.w $007a   ; $0004242c-$000423b2
[000423c0] 0088                      dc.w $0088   ; $0004243a-$000423b2
[000423c2] 93c9                      suba.l     a1,a1
[000423c4] 700b                      moveq.l    #11,d0
[000423c6] 204c                      movea.l    a4,a0
[000423c8] 2a6f 0004                 movea.l    4(a7),a5
[000423cc] 2a6d 0008                 movea.l    8(a5),a5
[000423d0] 4e95                      jsr        (a5)
[000423d2] 6036                      bra.s      $0004240A
[000423d4] 93c9                      suba.l     a1,a1
[000423d6] 700a                      moveq.l    #10,d0
[000423d8] 204c                      movea.l    a4,a0
[000423da] 2a6f 0004                 movea.l    4(a7),a5
[000423de] 2a6d 0008                 movea.l    8(a5),a5
[000423e2] 4e95                      jsr        (a5)
[000423e4] 6024                      bra.s      $0004240A
[000423e6] 93c9                      suba.l     a1,a1
[000423e8] 700d                      moveq.l    #13,d0
[000423ea] 204c                      movea.l    a4,a0
[000423ec] 2a6f 0004                 movea.l    4(a7),a5
[000423f0] 2a6d 0008                 movea.l    8(a5),a5
[000423f4] 4e95                      jsr        (a5)
[000423f6] 6010                      bra.s      $00042408
[000423f8] 93c9                      suba.l     a1,a1
[000423fa] 700c                      moveq.l    #12,d0
[000423fc] 204c                      movea.l    a4,a0
[000423fe] 2a6f 0004                 movea.l    4(a7),a5
[00042402] 2a6d 0008                 movea.l    8(a5),a5
[00042406] 4e95                      jsr        (a5)
[00042408] 4243                      clr.w      d3
[0004240a] 7a01                      moveq.l    #1,d5
[0004240c] 603a                      bra.s      $00042448
[0004240e] 93c9                      suba.l     a1,a1
[00042410] 700d                      moveq.l    #13,d0
[00042412] 204a                      movea.l    a2,a0
[00042414] 2a6b 0008                 movea.l    8(a3),a5
[00042418] 4e95                      jsr        (a5)
[0004241a] 600c                      bra.s      $00042428
[0004241c] 93c9                      suba.l     a1,a1
[0004241e] 700c                      moveq.l    #12,d0
[00042420] 204a                      movea.l    a2,a0
[00042422] 2a6b 0008                 movea.l    8(a3),a5
[00042426] 4e95                      jsr        (a5)
[00042428] 4243                      clr.w      d3
[0004242a] 601a                      bra.s      $00042446
[0004242c] 93c9                      suba.l     a1,a1
[0004242e] 700b                      moveq.l    #11,d0
[00042430] 204a                      movea.l    a2,a0
[00042432] 2a6b 0008                 movea.l    8(a3),a5
[00042436] 4e95                      jsr        (a5)
[00042438] 600c                      bra.s      $00042446
[0004243a] 93c9                      suba.l     a1,a1
[0004243c] 700a                      moveq.l    #10,d0
[0004243e] 204a                      movea.l    a2,a0
[00042440] 2a6b 0008                 movea.l    8(a3),a5
[00042444] 4e95                      jsr        (a5)
[00042446] 4245                      clr.w      d5
[00042448] 4a45                      tst.w      d5
[0004244a] 672c                      beq.s      $00042478
[0004244c] 3003                      move.w     d3,d0
[0004244e] 5343                      subq.w     #1,d3
[00042450] 4a40                      tst.w      d0
[00042452] 6612                      bne.s      $00042466
[00042454] 93c9                      suba.l     a1,a1
[00042456] 7005                      moveq.l    #5,d0
[00042458] 204c                      movea.l    a4,a0
[0004245a] 2a6f 0004                 movea.l    4(a7),a5
[0004245e] 2a6d 0008                 movea.l    8(a5),a5
[00042462] 4e95                      jsr        (a5)
[00042464] 7604                      moveq.l    #4,d3
[00042466] 93c9                      suba.l     a1,a1
[00042468] 7069                      moveq.l    #105,d0
[0004246a] 204c                      movea.l    a4,a0
[0004246c] 2a6f 0004                 movea.l    4(a7),a5
[00042470] 2a6d 0008                 movea.l    8(a5),a5
[00042474] 4e95                      jsr        (a5)
[00042476] 6022                      bra.s      $0004249A
[00042478] 3003                      move.w     d3,d0
[0004247a] 5343                      subq.w     #1,d3
[0004247c] 4a40                      tst.w      d0
[0004247e] 660e                      bne.s      $0004248E
[00042480] 93c9                      suba.l     a1,a1
[00042482] 7005                      moveq.l    #5,d0
[00042484] 204a                      movea.l    a2,a0
[00042486] 2a6b 0008                 movea.l    8(a3),a5
[0004248a] 4e95                      jsr        (a5)
[0004248c] 7604                      moveq.l    #4,d3
[0004248e] 93c9                      suba.l     a1,a1
[00042490] 7069                      moveq.l    #105,d0
[00042492] 204a                      movea.l    a2,a0
[00042494] 2a6b 0008                 movea.l    8(a3),a5
[00042498] 4e95                      jsr        (a5)
[0004249a] 2f39 000e 692a            move.l     _globl,-(a7)
[000424a0] 486f 0006                 pea.l      6(a7)
[000424a4] 486f 0008                 pea.l      8(a7)
[000424a8] 43ef 000e                 lea.l      14(a7),a1
[000424ac] 41ef 000e                 lea.l      14(a7),a0
[000424b0] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[000424b6] 4fef 000c                 lea.l      12(a7),a7
[000424ba] 7001                      moveq.l    #1,d0
[000424bc] c057                      and.w      (a7),d0
[000424be] 6600 fede                 bne        $0004239E
[000424c2] b67c 0004                 cmp.w      #$0004,d3
[000424c6] 6722                      beq.s      $000424EA
[000424c8] 4a45                      tst.w      d5
[000424ca] 6712                      beq.s      $000424DE
[000424cc] 93c9                      suba.l     a1,a1
[000424ce] 204c                      movea.l    a4,a0
[000424d0] 246f 0004                 movea.l    4(a7),a2
[000424d4] 246a 0008                 movea.l    8(a2),a2
[000424d8] 7005                      moveq.l    #5,d0
[000424da] 4e92                      jsr        (a2)
[000424dc] 600c                      bra.s      $000424EA
[000424de] 93c9                      suba.l     a1,a1
[000424e0] 7005                      moveq.l    #5,d0
[000424e2] 204c                      movea.l    a4,a0
[000424e4] 246b 0008                 movea.l    8(a3),a2
[000424e8] 4e92                      jsr        (a2)
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
[00042556] 6606                      bne.s      $0004255E
[00042558] 91c8                      suba.l     a0,a0
[0004255a] 6000 017c                 bra        $000426D8
[0004255e] 006b 0060 0054            ori.w      #$0060,84(a3)
[00042564] 286b 0014                 movea.l    20(a3),a4
[00042568] 4df9 0010 ee4e            lea.l      ACSblk,a6
[0004256e] 200a                      move.l     a2,d0
[00042570] 6704                      beq.s      $00042576
[00042572] 2a4a                      movea.l    a2,a5
[00042574] 6014                      bra.s      $0004258A
[00042576] 4bf9 000d 65e4            lea.l      def,a5
[0004257c] 2056                      movea.l    (a6),a0
[0004257e] 3aa8 0290                 move.w     656(a0),(a5)
[00042582] 2056                      movea.l    (a6),a0
[00042584] 3b68 0292 0002            move.w     658(a0),2(a5)
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
[000425f4] 6f04                      ble.s      $000425FA
[000425f6] 3940 0014                 move.w     d0,20(a4)
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
[00042614] 6f04                      ble.s      $0004261A
[00042616] 3957 0016                 move.w     (a7),22(a4)
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
[000426f6] 6712                      beq.s      $0004270A
[000426f8] 907c 0009                 sub.w      #$0009,d0
[000426fc] 6724                      beq.s      $00042722
[000426fe] 5940                      subq.w     #4,d0
[00042700] 6746                      beq.s      $00042748
[00042702] 907c 00b9                 sub.w      #$00B9,d0
[00042706] 673a                      beq.s      $00042742
[00042708] 6062                      bra.s      $0004276C
[0004270a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042710] 3028 023a                 move.w     570(a0),d0
[00042714] 6604                      bne.s      $0004271A
[00042716] b5cb                      cmpa.l     a3,a2
[00042718] 6660                      bne.s      $0004277A
[0004271a] 204a                      movea.l    a2,a0
[0004271c] 6100 ffc4                 bsr.w      term
[00042720] 6058                      bra.s      $0004277A
[00042722] 93c9                      suba.l     a1,a1
[00042724] 303c 00ce                 move.w     #$00CE,d0
[00042728] 206a 0014                 movea.l    20(a2),a0
[0004272c] 4eb9 0003 a772            jsr        Auo_editor
[00042732] 93c9                      suba.l     a1,a1
[00042734] 7006                      moveq.l    #6,d0
[00042736] 206a 0014                 movea.l    20(a2),a0
[0004273a] 4eb9 0003 a772            jsr        Auo_editor
[00042740] 6038                      bra.s      $0004277A
[00042742] 26aa 0014                 move.l     20(a2),(a3)
[00042746] 6032                      bra.s      $0004277A
[00042748] 41f9 000d 6482            lea.l      WIPR_INFO,a0
[0004274e] 2279 000d 648a            movea.l    $000D648A,a1
[00042754] 4e91                      jsr        (a1)
[00042756] 2848                      movea.l    a0,a4
[00042758] 200c                      move.l     a4,d0
[0004275a] 671e                      beq.s      $0004277A
[0004275c] 4eb9 0005 9df4            jsr        Awi_dialog
[00042762] 204c                      movea.l    a4,a0
[00042764] 4eb9 0005 85f2            jsr        Awi_delete
[0004276a] 600e                      bra.s      $0004277A
[0004276c] 224b                      movea.l    a3,a1
[0004276e] 3003                      move.w     d3,d0
[00042770] 204a                      movea.l    a2,a0
[00042772] 4eb9 0005 9dd0            jsr        Awi_service
[00042778] 6002                      bra.s      $0004277C
[0004277a] 7001                      moveq.l    #1,d0
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
[0004282e] 6716                      beq.s      $00042846
[00042830] 302c 0002                 move.w     2(a4),d0
[00042834] 48c0                      ext.l      d0
[00042836] 2400                      move.l     d0,d2
[00042838] d482                      add.l      d2,d2
[0004283a] d480                      add.l      d0,d2
[0004283c] e78a                      lsl.l      #3,d2
[0004283e] 3234 2816                 move.w     22(a4,d2.l),d1
[00042842] 936b 0016                 sub.w      d1,22(a3)
[00042846] 202a 0018                 move.l     24(a2),d0
[0004284a] 670a                      beq.s      $00042856
[0004284c] 2040                      movea.l    d0,a0
[0004284e] 3228 0016                 move.w     22(a0),d1
[00042852] 936b 0016                 sub.w      d1,22(a3)
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
[000428ce] 6714                      beq.s      $000428E4
[000428d0] 47ef 0010                 lea.l      16(a7),a3
[000428d4] 2f0b                      move.l     a3,-(a7)
[000428d6] 206a 0014                 movea.l    20(a2),a0
[000428da] 4eb9 0003 b7b0            jsr        uvprintf
[000428e0] 584f                      addq.w     #4,a7
[000428e2] 3600                      move.w     d0,d3
[000428e4] 3003                      move.w     d3,d0
[000428e6] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000428ea] 4e75                      rts
