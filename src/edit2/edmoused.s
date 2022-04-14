edmo_backcol:
[00022628] 3f03                      move.w     d3,-(a7)
[0002262a] 2f0a                      move.l     a2,-(a7)
[0002262c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00022632] 2268 025c                 movea.l    604(a0),a1
[00022636] 2469 0324                 movea.l    804(a1),a2
[0002263a] 45ea 000c                 lea.l      12(a2),a2
[0002263e] 7013                      moveq.l    #19,d0
[00022640] 3f00                      move.w     d0,-(a7)
[00022642] 7414                      moveq.l    #20,d2
[00022644] 7211                      moveq.l    #17,d1
[00022646] 3012                      move.w     (a2),d0
[00022648] e040                      asr.w      #8,d0
[0002264a] c07c 000f                 and.w      #$000F,d0
[0002264e] 4eb9 0003 0bde            jsr        oe_colsel
[00022654] 544f                      addq.w     #2,a7
[00022656] 3600                      move.w     d0,d3
[00022658] 6b2a                      bmi.s      $00022684
[0002265a] 3212                      move.w     (a2),d1
[0002265c] c27c f0ff                 and.w      #$F0FF,d1
[00022660] e148                      lsl.w      #8,d0
[00022662] 8240                      or.w       d0,d1
[00022664] 3481                      move.w     d1,(a2)
[00022666] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002266c] 2068 0258                 movea.l    600(a0),a0
[00022670] 2279 0010 ee4e            movea.l    ACSblk,a1
[00022676] 2469 0258                 movea.l    600(a1),a2
[0002267a] 226a 0066                 movea.l    102(a2),a1
[0002267e] 7020                      moveq.l    #32,d0
[00022680] 72ff                      moveq.l    #-1,d1
[00022682] 4e91                      jsr        (a1)
[00022684] 245f                      movea.l    (a7)+,a2
[00022686] 361f                      move.w     (a7)+,d3
[00022688] 4e75                      rts
edmo_frontcol:
[0002268a] 2f03                      move.l     d3,-(a7)
[0002268c] 2f0a                      move.l     a2,-(a7)
[0002268e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00022694] 2268 025c                 movea.l    604(a0),a1
[00022698] 2469 0324                 movea.l    804(a1),a2
[0002269c] 45ea 000c                 lea.l      12(a2),a2
[000226a0] 700d                      moveq.l    #13,d0
[000226a2] 3f00                      move.w     d0,-(a7)
[000226a4] 740e                      moveq.l    #14,d2
[000226a6] 720b                      moveq.l    #11,d1
[000226a8] 3012                      move.w     (a2),d0
[000226aa] 760c                      moveq.l    #12,d3
[000226ac] e660                      asr.w      d3,d0
[000226ae] c07c 000f                 and.w      #$000F,d0
[000226b2] 4eb9 0003 0bde            jsr        oe_colsel
[000226b8] 544f                      addq.w     #2,a7
[000226ba] 3600                      move.w     d0,d3
[000226bc] 6b2c                      bmi.s      $000226EA
[000226be] 3212                      move.w     (a2),d1
[000226c0] c27c 0fff                 and.w      #$0FFF,d1
[000226c4] 740c                      moveq.l    #12,d2
[000226c6] e568                      lsl.w      d2,d0
[000226c8] 8240                      or.w       d0,d1
[000226ca] 3481                      move.w     d1,(a2)
[000226cc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000226d2] 2068 0258                 movea.l    600(a0),a0
[000226d6] 2279 0010 ee4e            movea.l    ACSblk,a1
[000226dc] 2469 0258                 movea.l    600(a1),a2
[000226e0] 226a 0066                 movea.l    102(a2),a1
[000226e4] 7020                      moveq.l    #32,d0
[000226e6] 72ff                      moveq.l    #-1,d1
[000226e8] 4e91                      jsr        (a1)
[000226ea] 245f                      movea.l    (a7)+,a2
[000226ec] 261f                      move.l     (a7)+,d3
[000226ee] 4e75                      rts

; start edit2\edmoused.c

edmo_black:
[000226f0] 2f0a                      move.l     a2,-(a7)
[000226f2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000226f8] 2468 0258                 movea.l    600(a0),a2
[000226fc] 206a 0014                 movea.l    20(a2),a0
[00022700] 317c 0008 02e4            move.w     #$0008,740(a0)
[00022706] 0268 ff8f 0206            andi.w     #$FF8F,518(a0)
[0002270c] 0068 0070 0206            ori.w      #$0070,518(a0)
[00022712] 72ff                      moveq.l    #-1,d1
[00022714] 7015                      moveq.l    #21,d0
[00022716] 204a                      movea.l    a2,a0
[00022718] 226a 0066                 movea.l    102(a2),a1
[0002271c] 4e91                      jsr        (a1)
[0002271e] 245f                      movea.l    (a7)+,a2
[00022720] 4e75                      rts
edmo_white:
[00022722] 2f0a                      move.l     a2,-(a7)
[00022724] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002272a] 2468 0258                 movea.l    600(a0),a2
[0002272e] 206a 0014                 movea.l    20(a2),a0
[00022732] 317c 0009 02e4            move.w     #$0009,740(a0)
[00022738] 0268 ff8f 0206            andi.w     #$FF8F,518(a0)
[0002273e] 72ff                      moveq.l    #-1,d1
[00022740] 7015                      moveq.l    #21,d0
[00022742] 204a                      movea.l    a2,a0
[00022744] 226a 0066                 movea.l    102(a2),a1
[00022748] 4e91                      jsr        (a1)
[0002274a] 245f                      movea.l    (a7)+,a2
[0002274c] 4e75                      rts
edmo_invisible:
[0002274e] 2f0a                      move.l     a2,-(a7)
[00022750] 2079 0010 ee4e            movea.l    ACSblk,a0
[00022756] 2468 0258                 movea.l    600(a0),a2
[0002275a] 206a 0014                 movea.l    20(a2),a0
[0002275e] 317c 000a 02e4            move.w     #$000A,740(a0)
[00022764] 0268 ff8f 0206            andi.w     #$FF8F,518(a0)
[0002276a] 0068 0040 0206            ori.w      #$0040,518(a0)
[00022770] 72ff                      moveq.l    #-1,d1
[00022772] 7015                      moveq.l    #21,d0
[00022774] 204a                      movea.l    a2,a0
[00022776] 226a 0066                 movea.l    102(a2),a1
[0002277a] 4e91                      jsr        (a1)
[0002277c] 245f                      movea.l    (a7)+,a2
[0002277e] 4e75                      rts
edmo_next:
[00022780] 2079 0010 ee4e            movea.l    ACSblk,a0
[00022786] 2268 025c                 movea.l    604(a0),a1
[0002278a] 2069 030c                 movea.l    780(a1),a0
[0002278e] 5848                      addq.w     #4,a0
[00022790] 3028 0002                 move.w     2(a0),d0
[00022794] d07c 0010                 add.w      #$0010,d0
[00022798] c07c 0070                 and.w      #$0070,d0
[0002279c] 0268 ff8f 0002            andi.w     #$FF8F,2(a0)
[000227a2] 8168 0002                 or.w       d0,2(a0)
[000227a6] 72ff                      moveq.l    #-1,d1
[000227a8] 7020                      moveq.l    #32,d0
[000227aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[000227b0] 2068 0258                 movea.l    600(a0),a0
[000227b4] 2279 0010 ee4e            movea.l    ACSblk,a1
[000227ba] 2269 0258                 movea.l    600(a1),a1
[000227be] 2269 0066                 movea.l    102(a1),a1
[000227c2] 4e91                      jsr        (a1)
[000227c4] 4e75                      rts
edmo_x:
[000227c6] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[000227ca] 594f                      subq.w     #4,a7
[000227cc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000227d2] 2468 0258                 movea.l    600(a0),a2
[000227d6] 266a 0014                 movea.l    20(a2),a3
[000227da] 3628 0262                 move.w     610(a0),d3
[000227de] 2f39 000e 692a            move.l     _globl,-(a7)
[000227e4] 486f 0004                 pea.l      4(a7)
[000227e8] 43ef 000a                 lea.l      10(a7),a1
[000227ec] 3028 0260                 move.w     608(a0),d0
[000227f0] 204b                      movea.l    a3,a0
[000227f2] 4eb9 0007 9d14            jsr        mt_objc_offset
[000227f8] 504f                      addq.w     #8,a7
[000227fa] 3003                      move.w     d3,d0
[000227fc] 906a 0034                 sub.w      52(a2),d0
[00022800] 906f 0002                 sub.w      2(a7),d0
[00022804] 48c0                      ext.l      d0
[00022806] 81fc 0008                 divs.w     #$0008,d0
[0002280a] c07c 000f                 and.w      #$000F,d0
[0002280e] e748                      lsl.w      #3,d0
[00022810] 3600                      move.w     d0,d3
[00022812] b06b 0268                 cmp.w      616(a3),d0
[00022816] 6726                      beq.s      $0002283E
[00022818] 006b 0080 0260            ori.w      #$0080,608(a3)
[0002281e] 204a                      movea.l    a2,a0
[00022820] 7019                      moveq.l    #25,d0
[00022822] 4eb9 0005 1b80            jsr        Awi_obredraw
[00022828] 026b ff7f 0260            andi.w     #$FF7F,608(a3)
[0002282e] 3743 0268                 move.w     d3,616(a3)
[00022832] 72ff                      moveq.l    #-1,d1
[00022834] 7019                      moveq.l    #25,d0
[00022836] 204a                      movea.l    a2,a0
[00022838] 226a 0066                 movea.l    102(a2),a1
[0002283c] 4e91                      jsr        (a1)
[0002283e] 584f                      addq.w     #4,a7
[00022840] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00022844] 4e75                      rts
edmo_y:
[00022846] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0002284a] 594f                      subq.w     #4,a7
[0002284c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00022852] 2468 0258                 movea.l    600(a0),a2
[00022856] 266a 0014                 movea.l    20(a2),a3
[0002285a] 3628 0264                 move.w     612(a0),d3
[0002285e] 2f39 000e 692a            move.l     _globl,-(a7)
[00022864] 486f 0004                 pea.l      4(a7)
[00022868] 43ef 000a                 lea.l      10(a7),a1
[0002286c] 3028 0260                 move.w     608(a0),d0
[00022870] 204b                      movea.l    a3,a0
[00022872] 4eb9 0007 9d14            jsr        mt_objc_offset
[00022878] 504f                      addq.w     #8,a7
[0002287a] 3003                      move.w     d3,d0
[0002287c] 906a 0036                 sub.w      54(a2),d0
[00022880] 9057                      sub.w      (a7),d0
[00022882] 48c0                      ext.l      d0
[00022884] 81fc 0008                 divs.w     #$0008,d0
[00022888] c07c 000f                 and.w      #$000F,d0
[0002288c] e748                      lsl.w      #3,d0
[0002288e] 3600                      move.w     d0,d3
[00022890] b06b 02b2                 cmp.w      690(a3),d0
[00022894] 6726                      beq.s      $000228BC
[00022896] 006b 0080 02a8            ori.w      #$0080,680(a3)
[0002289c] 204a                      movea.l    a2,a0
[0002289e] 701c                      moveq.l    #28,d0
[000228a0] 4eb9 0005 1b80            jsr        Awi_obredraw
[000228a6] 026b ff7f 02a8            andi.w     #$FF7F,680(a3)
[000228ac] 3743 02b2                 move.w     d3,690(a3)
[000228b0] 72ff                      moveq.l    #-1,d1
[000228b2] 701c                      moveq.l    #28,d0
[000228b4] 204a                      movea.l    a2,a0
[000228b6] 226a 0066                 movea.l    102(a2),a1
[000228ba] 4e91                      jsr        (a1)
[000228bc] 584f                      addq.w     #4,a7
[000228be] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000228c2] 4e75                      rts
edmo_set:
[000228c4] 48e7 003c                 movem.l    a2-a5,-(a7)
[000228c8] 4fef ffe4                 lea.l      -28(a7),a7
[000228cc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000228d2] 2668 0258                 movea.l    600(a0),a3
[000228d6] 2eab 0014                 move.l     20(a3),(a7)
[000228da] 3228 0260                 move.w     608(a0),d1
[000228de] 48c1                      ext.l      d1
[000228e0] 2001                      move.l     d1,d0
[000228e2] d080                      add.l      d0,d0
[000228e4] d081                      add.l      d1,d0
[000228e6] e788                      lsl.l      #3,d0
[000228e8] 2257                      movea.l    (a7),a1
[000228ea] 3431 080a                 move.w     10(a1,d0.l),d2
[000228ee] c47c 4000                 and.w      #$4000,d2
[000228f2] 672c                      beq.s      $00022920
[000228f4] 3029 02e4                 move.w     740(a1),d0
[000228f8] 5140                      subq.w     #8,d0
[000228fa] 670c                      beq.s      $00022908
[000228fc] 5340                      subq.w     #1,d0
[000228fe] 6710                      beq.s      $00022910
[00022900] 5340                      subq.w     #1,d0
[00022902] 6714                      beq.s      $00022918
[00022904] 6000 01ba                 bra        $00022AC0
[00022908] 6100 fe18                 bsr        edmo_white
[0002290c] 6000 01b2                 bra        $00022AC0
[00022910] 6100 fe3c                 bsr        edmo_invisible
[00022914] 6000 01aa                 bra        $00022AC0
[00022918] 6100 fdd6                 bsr        edmo_black
[0002291c] 6000 01a2                 bra        $00022AC0
[00022920] 2079 0010 ee4e            movea.l    ACSblk,a0
[00022926] 3f68 0262 0016            move.w     610(a0),22(a7)
[0002292c] 3f68 0264 0014            move.w     612(a0),20(a7)
[00022932] 2f53 0018                 move.l     (a3),24(a7)
[00022936] 49ef 0008                 lea.l      8(a7),a4
[0002293a] 2f39 000e 692a            move.l     _globl,-(a7)
[00022940] 486f 0014                 pea.l      20(a7)
[00022944] 43ef 001a                 lea.l      26(a7),a1
[00022948] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002294e] 3028 0260                 move.w     608(a0),d0
[00022952] 206f 0008                 movea.l    8(a7),a0
[00022956] 4eb9 0007 9d14            jsr        mt_objc_offset
[0002295c] 504f                      addq.w     #8,a7
[0002295e] 302f 0016                 move.w     22(a7),d0
[00022962] 906b 0034                 sub.w      52(a3),d0
[00022966] 906f 0012                 sub.w      18(a7),d0
[0002296a] 48c0                      ext.l      d0
[0002296c] 81fc 0008                 divs.w     #$0008,d0
[00022970] 3f40 0016                 move.w     d0,22(a7)
[00022974] 322f 0014                 move.w     20(a7),d1
[00022978] 926b 0036                 sub.w      54(a3),d1
[0002297c] 926f 0010                 sub.w      16(a7),d1
[00022980] 48c1                      ext.l      d1
[00022982] 83fc 0008                 divs.w     #$0008,d1
[00022986] 3f41 0014                 move.w     d1,20(a7)
[0002298a] 4a40                      tst.w      d0
[0002298c] 6b00 0132                 bmi        $00022AC0
[00022990] 4a41                      tst.w      d1
[00022992] 6b00 012c                 bmi        $00022AC0
[00022996] b07c 000f                 cmp.w      #$000F,d0
[0002299a] 6e00 0124                 bgt        $00022AC0
[0002299e] b27c 000f                 cmp.w      #$000F,d1
[000229a2] 6e00 011c                 bgt        $00022AC0
[000229a6] e748                      lsl.w      #3,d0
[000229a8] d06b 0034                 add.w      52(a3),d0
[000229ac] d06f 0012                 add.w      18(a7),d0
[000229b0] 3880                      move.w     d0,(a4)
[000229b2] e749                      lsl.w      #3,d1
[000229b4] d26b 0036                 add.w      54(a3),d1
[000229b8] d26f 0010                 add.w      16(a7),d1
[000229bc] 3941 0002                 move.w     d1,2(a4)
[000229c0] 7408                      moveq.l    #8,d2
[000229c2] 3942 0006                 move.w     d2,6(a4)
[000229c6] 3942 0004                 move.w     d2,4(a4)
[000229ca] 302f 0014                 move.w     20(a7),d0
[000229ce] 48c0                      ext.l      d0
[000229d0] d080                      add.l      d0,d0
[000229d2] 246f 0018                 movea.l    24(a7),a2
[000229d6] 45f2 0808                 lea.l      8(a2,d0.l),a2
[000229da] 4bea 0020                 lea.l      32(a2),a5
[000229de] 7001                      moveq.l    #1,d0
[000229e0] 720f                      moveq.l    #15,d1
[000229e2] 922f 0017                 sub.b      23(a7),d1
[000229e6] e368                      lsl.w      d1,d0
[000229e8] 2057                      movea.l    (a7),a0
[000229ea] 3428 0206                 move.w     518(a0),d2
[000229ee] e84a                      lsr.w      #4,d2
[000229f0] c47c 0007                 and.w      #$0007,d2
[000229f4] 4a42                      tst.w      d2
[000229f6] 671c                      beq.s      $00022A14
[000229f8] 5942                      subq.w     #4,d2
[000229fa] 672e                      beq.s      $00022A2A
[000229fc] 5742                      subq.w     #3,d2
[000229fe] 6702                      beq.s      $00022A02
[00022a00] 603c                      bra.s      $00022A3E
[00022a02] 3215                      move.w     (a5),d1
[00022a04] c240                      and.w      d0,d1
[00022a06] 6708                      beq.s      $00022A10
[00022a08] 3412                      move.w     (a2),d2
[00022a0a] c440                      and.w      d0,d2
[00022a0c] 6600 0088                 bne        $00022A96
[00022a10] 8155                      or.w       d0,(a5)
[00022a12] 6012                      bra.s      $00022A26
[00022a14] 3215                      move.w     (a5),d1
[00022a16] c240                      and.w      d0,d1
[00022a18] 6606                      bne.s      $00022A20
[00022a1a] 3412                      move.w     (a2),d2
[00022a1c] c440                      and.w      d0,d2
[00022a1e] 6676                      bne.s      $00022A96
[00022a20] 3200                      move.w     d0,d1
[00022a22] 4641                      not.w      d1
[00022a24] c355                      and.w      d1,(a5)
[00022a26] 8152                      or.w       d0,(a2)
[00022a28] 6014                      bra.s      $00022A3E
[00022a2a] 3215                      move.w     (a5),d1
[00022a2c] c240                      and.w      d0,d1
[00022a2e] 6606                      bne.s      $00022A36
[00022a30] 3412                      move.w     (a2),d2
[00022a32] c440                      and.w      d0,d2
[00022a34] 6760                      beq.s      $00022A96
[00022a36] 3200                      move.w     d0,d1
[00022a38] 4641                      not.w      d1
[00022a3a] c355                      and.w      d1,(a5)
[00022a3c] c352                      and.w      d1,(a2)
[00022a3e] 224c                      movea.l    a4,a1
[00022a40] 204b                      movea.l    a3,a0
[00022a42] 246b 006a                 movea.l    106(a3),a2
[00022a46] 4e92                      jsr        (a2)
[00022a48] 2f39 000e 692a            move.l     _globl,-(a7)
[00022a4e] 486f 0014                 pea.l      20(a7)
[00022a52] 43ef 001a                 lea.l      26(a7),a1
[00022a56] 7021                      moveq.l    #33,d0
[00022a58] 206f 0008                 movea.l    8(a7),a0
[00022a5c] 4eb9 0007 9d14            jsr        mt_objc_offset
[00022a62] 504f                      addq.w     #8,a7
[00022a64] 302b 0034                 move.w     52(a3),d0
[00022a68] d06f 0016                 add.w      22(a7),d0
[00022a6c] d06f 0012                 add.w      18(a7),d0
[00022a70] 3880                      move.w     d0,(a4)
[00022a72] 322b 0036                 move.w     54(a3),d1
[00022a76] d26f 0014                 add.w      20(a7),d1
[00022a7a] d26f 0010                 add.w      16(a7),d1
[00022a7e] 3941 0002                 move.w     d1,2(a4)
[00022a82] 7401                      moveq.l    #1,d2
[00022a84] 3942 0006                 move.w     d2,6(a4)
[00022a88] 3942 0004                 move.w     d2,4(a4)
[00022a8c] 224c                      movea.l    a4,a1
[00022a8e] 204b                      movea.l    a3,a0
[00022a90] 246b 006a                 movea.l    106(a3),a2
[00022a94] 4e92                      jsr        (a2)
[00022a96] 2f39 000e 692a            move.l     _globl,-(a7)
[00022a9c] 486f 0008                 pea.l      8(a7)
[00022aa0] 486f 000e                 pea.l      14(a7)
[00022aa4] 43ef 0020                 lea.l      32(a7),a1
[00022aa8] 41ef 0022                 lea.l      34(a7),a0
[00022aac] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[00022ab2] 4fef 000c                 lea.l      12(a7),a7
[00022ab6] 7001                      moveq.l    #1,d0
[00022ab8] c06f 0006                 and.w      6(a7),d0
[00022abc] 6600 fe78                 bne        $00022936
[00022ac0] 4fef 001c                 lea.l      28(a7),a7
[00022ac4] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00022ac8] 4e75                      rts
edmo_abort:
[00022aca] 2079 0010 ee4e            movea.l    ACSblk,a0
[00022ad0] 2068 0258                 movea.l    600(a0),a0
[00022ad4] 4eb9 0002 2f8e            jsr        term
[00022ada] 4e75                      rts
edmo_ok:
[00022adc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00022ae2] 2068 0258                 movea.l    600(a0),a0
[00022ae6] 4eb9 0002 2cc2            jsr        acc_mouse
[00022aec] 2079 0010 ee4e            movea.l    ACSblk,a0
[00022af2] 2068 0258                 movea.l    600(a0),a0
[00022af6] 4eb9 0002 2f8e            jsr        term
[00022afc] 4e75                      rts
edmo_bitmap:
[00022afe] 48e7 3e3c                 movem.l    d2-d6/a2-a5,-(a7)
[00022b02] 4fef ffe0                 lea.l      -32(a7),a7
[00022b06] 206f 0048                 movea.l    72(a7),a0
[00022b0a] 3f68 0016 0004            move.w     22(a0),4(a7)
[00022b10] 3f68 0018 0006            move.w     24(a0),6(a7)
[00022b16] 49f9 0010 ee4e            lea.l      ACSblk,a4
[00022b1c] 302f 0004                 move.w     4(a7),d0
[00022b20] 6606                      bne.s      $00022B28
[00022b22] 322f 0006                 move.w     6(a7),d1
[00022b26] 6730                      beq.s      $00022B58
[00022b28] 206f 0048                 movea.l    72(a7),a0
[00022b2c] 3ea8 0012                 move.w     18(a0),(a7)
[00022b30] 3f68 0014 0002            move.w     20(a0),2(a7)
[00022b36] 70ff                      moveq.l    #-1,d0
[00022b38] d057                      add.w      (a7),d0
[00022b3a] d16f 0004                 add.w      d0,4(a7)
[00022b3e] 70ff                      moveq.l    #-1,d0
[00022b40] d06f 0002                 add.w      2(a7),d0
[00022b44] d16f 0006                 add.w      d0,6(a7)
[00022b48] 41d7                      lea.l      (a7),a0
[00022b4a] 7201                      moveq.l    #1,d1
[00022b4c] 2254                      movea.l    (a4),a1
[00022b4e] 3029 0010                 move.w     16(a1),d0
[00022b52] 4eb9 0007 2230            jsr        vs_clip
[00022b58] 206f 0048                 movea.l    72(a7),a0
[00022b5c] 2068 001a                 movea.l    26(a0),a0
[00022b60] 2050                      movea.l    (a0),a0
[00022b62] 43e8 0008                 lea.l      8(a0),a1
[00022b66] 2f49 0018                 move.l     a1,24(a7)
[00022b6a] 43e9 0020                 lea.l      32(a1),a1
[00022b6e] 2f49 001c                 move.l     a1,28(a7)
[00022b72] 4bef 0008                 lea.l      8(a7),a5
[00022b76] 4255                      clr.w      (a5)
[00022b78] 426d 0002                 clr.w      2(a5)
[00022b7c] 3b7c 0007 0004            move.w     #$0007,4(a5)
[00022b82] 3b7c 0007 0006            move.w     #$0007,6(a5)
[00022b88] 206f 0048                 movea.l    72(a7),a0
[00022b8c] 3b68 000c 000a            move.w     12(a0),10(a5)
[00022b92] 7007                      moveq.l    #7,d0
[00022b94] d068 000c                 add.w      12(a0),d0
[00022b98] 3b40 000e                 move.w     d0,14(a5)
[00022b9c] 4243                      clr.w      d3
[00022b9e] 45f9 000b 2996            lea.l      color,a2
[00022ba4] 6000 00f2                 bra        $00022C98
[00022ba8] 302d 000e                 move.w     14(a5),d0
[00022bac] b06f 0002                 cmp.w      2(a7),d0
[00022bb0] 6d00 00d4                 blt        $00022C86
[00022bb4] 322d 000a                 move.w     10(a5),d1
[00022bb8] b26f 0006                 cmp.w      6(a7),d1
[00022bbc] 6e00 00c8                 bgt        $00022C86
[00022bc0] 206f 0048                 movea.l    72(a7),a0
[00022bc4] 3b68 000a 0008            move.w     10(a0),8(a5)
[00022bca] 7007                      moveq.l    #7,d0
[00022bcc] d068 000a                 add.w      10(a0),d0
[00022bd0] 3b40 000c                 move.w     d0,12(a5)
[00022bd4] 226f 001c                 movea.l    28(a7),a1
[00022bd8] 54af 001c                 addq.l     #2,28(a7)
[00022bdc] 3811                      move.w     (a1),d4
[00022bde] 226f 0018                 movea.l    24(a7),a1
[00022be2] 54af 0018                 addq.l     #2,24(a7)
[00022be6] 3a11                      move.w     (a1),d5
[00022be8] 7c0f                      moveq.l    #15,d6
[00022bea] 6000 0092                 bra        $00022C7E
[00022bee] 302d 000c                 move.w     12(a5),d0
[00022bf2] b057                      cmp.w      (a7),d0
[00022bf4] 6d00 007a                 blt.w      $00022C70
[00022bf8] 322d 0008                 move.w     8(a5),d1
[00022bfc] b26f 0004                 cmp.w      4(a7),d1
[00022c00] 6e6e                      bgt.s      $00022C70
[00022c02] 3404                      move.w     d4,d2
[00022c04] c47c 8000                 and.w      #$8000,d2
[00022c08] 6720                      beq.s      $00022C2A
[00022c0a] 4852                      pea.l      (a2)
[00022c0c] 2054                      movea.l    (a4),a0
[00022c0e] 4868 026a                 pea.l      618(a0)
[00022c12] 43ea ffa4                 lea.l      -92(a2),a1
[00022c16] 204d                      movea.l    a5,a0
[00022c18] 2654                      movea.l    (a4),a3
[00022c1a] 302b 0010                 move.w     16(a3),d0
[00022c1e] 7201                      moveq.l    #1,d1
[00022c20] 4eb9 0007 4902            jsr        vrt_cpyfm
[00022c26] 504f                      addq.w     #8,a7
[00022c28] 6046                      bra.s      $00022C70
[00022c2a] 3005                      move.w     d5,d0
[00022c2c] c07c 8000                 and.w      #$8000,d0
[00022c30] 6720                      beq.s      $00022C52
[00022c32] 4852                      pea.l      (a2)
[00022c34] 2054                      movea.l    (a4),a0
[00022c36] 4868 026a                 pea.l      618(a0)
[00022c3a] 43ea ffc8                 lea.l      -56(a2),a1
[00022c3e] 204d                      movea.l    a5,a0
[00022c40] 7201                      moveq.l    #1,d1
[00022c42] 2654                      movea.l    (a4),a3
[00022c44] 302b 0010                 move.w     16(a3),d0
[00022c48] 4eb9 0007 4902            jsr        vrt_cpyfm
[00022c4e] 504f                      addq.w     #8,a7
[00022c50] 601e                      bra.s      $00022C70
[00022c52] 4852                      pea.l      (a2)
[00022c54] 2054                      movea.l    (a4),a0
[00022c56] 4868 026a                 pea.l      618(a0)
[00022c5a] 43ea ffec                 lea.l      -20(a2),a1
[00022c5e] 204d                      movea.l    a5,a0
[00022c60] 7201                      moveq.l    #1,d1
[00022c62] 2654                      movea.l    (a4),a3
[00022c64] 302b 0010                 move.w     16(a3),d0
[00022c68] 4eb9 0007 4902            jsr        vrt_cpyfm
[00022c6e] 504f                      addq.w     #8,a7
[00022c70] d844                      add.w      d4,d4
[00022c72] da45                      add.w      d5,d5
[00022c74] 506d 0008                 addq.w     #8,8(a5)
[00022c78] 506d 000c                 addq.w     #8,12(a5)
[00022c7c] 5346                      subq.w     #1,d6
[00022c7e] 4a46                      tst.w      d6
[00022c80] 6a00 ff6c                 bpl        $00022BEE
[00022c84] 6008                      bra.s      $00022C8E
[00022c86] 54af 001c                 addq.l     #2,28(a7)
[00022c8a] 54af 0018                 addq.l     #2,24(a7)
[00022c8e] 506d 000a                 addq.w     #8,10(a5)
[00022c92] 506d 000e                 addq.w     #8,14(a5)
[00022c96] 5243                      addq.w     #1,d3
[00022c98] b67c 0010                 cmp.w      #$0010,d3
[00022c9c] 6d00 ff0a                 blt        $00022BA8
[00022ca0] 41d7                      lea.l      (a7),a0
[00022ca2] 4241                      clr.w      d1
[00022ca4] 2254                      movea.l    (a4),a1
[00022ca6] 3029 0010                 move.w     16(a1),d0
[00022caa] 4eb9 0007 2230            jsr        vs_clip
[00022cb0] 206f 0048                 movea.l    72(a7),a0
[00022cb4] 3028 0008                 move.w     8(a0),d0
[00022cb8] 4fef 0020                 lea.l      32(a7),a7
[00022cbc] 4cdf 3c7c                 movem.l    (a7)+,d2-d6/a2-a5
[00022cc0] 4e75                      rts
acc_mouse:
[00022cc2] 2f0a                      move.l     a2,-(a7)
[00022cc4] 2f0b                      move.l     a3,-(a7)
[00022cc6] 2450                      movea.l    (a0),a2
[00022cc8] 2252                      movea.l    (a2),a1
[00022cca] 0069 0001 0006            ori.w      #$0001,6(a1)
[00022cd0] 226a 0004                 movea.l    4(a2),a1
[00022cd4] 2068 0014                 movea.l    20(a0),a0
[00022cd8] 2669 0004                 movea.l    4(a1),a3
[00022cdc] 2268 0324                 movea.l    804(a0),a1
[00022ce0] 3029 000c                 move.w     12(a1),d0
[00022ce4] e040                      asr.w      #8,d0
[00022ce6] c07c 000f                 and.w      #$000F,d0
[00022cea] 3740 0006                 move.w     d0,6(a3)
[00022cee] 3229 000c                 move.w     12(a1),d1
[00022cf2] 740c                      moveq.l    #12,d2
[00022cf4] e461                      asr.w      d2,d1
[00022cf6] c27c 000f                 and.w      #$000F,d1
[00022cfa] 3741 0008                 move.w     d1,8(a3)
[00022cfe] 3028 0268                 move.w     616(a0),d0
[00022d02] 48c0                      ext.l      d0
[00022d04] 81fc 0008                 divs.w     #$0008,d0
[00022d08] 3680                      move.w     d0,(a3)
[00022d0a] 3228 02b2                 move.w     690(a0),d1
[00022d0e] 48c1                      ext.l      d1
[00022d10] 83fc 0008                 divs.w     #$0008,d1
[00022d14] 3741 0002                 move.w     d1,2(a3)
[00022d18] 7040                      moveq.l    #64,d0
[00022d1a] 43ea 0008                 lea.l      8(a2),a1
[00022d1e] 41eb 000a                 lea.l      10(a3),a0
[00022d22] 4eb9 0008 3500            jsr        memcpy
[00022d28] 265f                      movea.l    (a7)+,a3
[00022d2a] 245f                      movea.l    (a7)+,a2
[00022d2c] 4e75                      rts
mo_make:
[00022d2e] 48e7 0038                 movem.l    a2-a4,-(a7)
[00022d32] 594f                      subq.w     #4,a7
[00022d34] 2448                      movea.l    a0,a2
[00022d36] 266a 0004                 movea.l    4(a2),a3
[00022d3a] 286b 0012                 movea.l    18(a3),a4
[00022d3e] 200c                      move.l     a4,d0
[00022d40] 670a                      beq.s      $00022D4C
[00022d42] 204c                      movea.l    a4,a0
[00022d44] 4eb9 0005 6bea            jsr        Awi_show
[00022d4a] 6074                      bra.s      $00022DC0
[00022d4c] 7048                      moveq.l    #72,d0
[00022d4e] 4eb9 0004 c608            jsr        Ax_malloc
[00022d54] 2e88                      move.l     a0,(a7)
[00022d56] 2008                      move.l     a0,d0
[00022d58] 6762                      beq.s      $00022DBC
[00022d5a] 2092                      move.l     (a2),(a0)
[00022d5c] 216a 0004 0004            move.l     4(a2),4(a0)
[00022d62] 43eb 0016                 lea.l      22(a3),a1
[00022d66] 23c9 000b 28d6            move.l     a1,$000B28D6
[00022d6c] 2079 000b 28e2            movea.l    $000B28E2,a0
[00022d72] 2149 0008                 move.l     a1,8(a0)
[00022d76] 41f9 000b 2888            lea.l      WI_MOUSE,a0
[00022d7c] 4eb9 0005 7052            jsr        Awi_create
[00022d82] 2848                      movea.l    a0,a4
[00022d84] 200c                      move.l     a4,d0
[00022d86] 6734                      beq.s      $00022DBC
[00022d88] 2252                      movea.l    (a2),a1
[00022d8a] 4869 0168                 pea.l      360(a1)
[00022d8e] 43eb 003a                 lea.l      58(a3),a1
[00022d92] 4eb9 0001 6372            jsr        wi_pos
[00022d98] 584f                      addq.w     #4,a7
[00022d9a] 2897                      move.l     (a7),(a4)
[00022d9c] 274c 0012                 move.l     a4,18(a3)
[00022da0] 204c                      movea.l    a4,a0
[00022da2] 4eb9 0002 2e16            jsr        set_mouse
[00022da8] 204c                      movea.l    a4,a0
[00022daa] 226c 000c                 movea.l    12(a4),a1
[00022dae] 4e91                      jsr        (a1)
[00022db0] 4a40                      tst.w      d0
[00022db2] 670c                      beq.s      $00022DC0
[00022db4] 204c                      movea.l    a4,a0
[00022db6] 4eb9 0002 2f8e            jsr        term
[00022dbc] 91c8                      suba.l     a0,a0
[00022dbe] 6002                      bra.s      $00022DC2
[00022dc0] 204c                      movea.l    a4,a0
[00022dc2] 584f                      addq.w     #4,a7
[00022dc4] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00022dc8] 4e75                      rts
mo_service:
[00022dca] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00022dce] 2448                      movea.l    a0,a2
[00022dd0] 3600                      move.w     d0,d3
[00022dd2] 2849                      movea.l    a1,a4
[00022dd4] 2650                      movea.l    (a0),a3
[00022dd6] 5540                      subq.w     #2,d0
[00022dd8] 6708                      beq.s      $00022DE2
[00022dda] 907c 270e                 sub.w      #$270E,d0
[00022dde] 6712                      beq.s      $00022DF2
[00022de0] 601e                      bra.s      $00022E00
[00022de2] 204a                      movea.l    a2,a0
[00022de4] 6100 fedc                 bsr        acc_mouse
[00022de8] 204a                      movea.l    a2,a0
[00022dea] 4eb9 0002 2f8e            jsr        term
[00022df0] 601c                      bra.s      $00022E0E
[00022df2] 226b 0004                 movea.l    4(a3),a1
[00022df6] 204a                      movea.l    a2,a0
[00022df8] 4eb9 0001 60ea            jsr        new_name
[00022dfe] 600e                      bra.s      $00022E0E
[00022e00] 224c                      movea.l    a4,a1
[00022e02] 3003                      move.w     d3,d0
[00022e04] 204a                      movea.l    a2,a0
[00022e06] 4eb9 0005 9dd0            jsr        Awi_service
[00022e0c] 6002                      bra.s      $00022E10
[00022e0e] 7001                      moveq.l    #1,d0
[00022e10] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00022e14] 4e75                      rts
set_mouse:
[00022e16] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00022e1a] 514f                      subq.w     #8,a7
[00022e1c] 2448                      movea.l    a0,a2
[00022e1e] 2f50 0004                 move.l     (a0),4(a7)
[00022e22] 226f 0004                 movea.l    4(a7),a1
[00022e26] 2069 0004                 movea.l    4(a1),a0
[00022e2a] 2ea8 0004                 move.l     4(a0),(a7)
[00022e2e] 206a 0014                 movea.l    20(a2),a0
[00022e32] 707f                      moveq.l    #127,d0
[00022e34] 43e8 0210                 lea.l      528(a0),a1
[00022e38] 49e8 02b8                 lea.l      696(a0),a4
[00022e3c] 266c 000c                 movea.l    12(a4),a3
[00022e40] 274a 0004                 move.l     a2,4(a3)
[00022e44] 3200                      move.w     d0,d1
[00022e46] d26c 0010                 add.w      16(a4),d1
[00022e4a] 5241                      addq.w     #1,d1
[00022e4c] 3341 0014                 move.w     d1,20(a1)
[00022e50] 3400                      move.w     d0,d2
[00022e52] d46c 0012                 add.w      18(a4),d2
[00022e56] 5242                      addq.w     #1,d2
[00022e58] 3342 0016                 move.w     d2,22(a1)
[00022e5c] 3940 0016                 move.w     d0,22(a4)
[00022e60] 3940 0014                 move.w     d0,20(a4)
[00022e64] 3229 0012                 move.w     18(a1),d1
[00022e68] d269 0016                 add.w      22(a1),d1
[00022e6c] 2679 0010 ee4e            movea.l    ACSblk,a3
[00022e72] d26b 0014                 add.w      20(a3),d1
[00022e76] b268 0016                 cmp.w      22(a0),d1
[00022e7a] 6f04                      ble.s      $00022E80
[00022e7c] 3141 0016                 move.w     d1,22(a0)
[00022e80] 49e8 0228                 lea.l      552(a0),a4
[00022e84] 3940 0014                 move.w     d0,20(a4)
[00022e88] 49e8 0258                 lea.l      600(a0),a4
[00022e8c] 397c 0008 0014            move.w     #$0008,20(a4)
[00022e92] 2257                      movea.l    (a7),a1
[00022e94] 3211                      move.w     (a1),d1
[00022e96] e749                      lsl.w      #3,d1
[00022e98] 3941 0010                 move.w     d1,16(a4)
[00022e9c] 49e8 0270                 lea.l      624(a0),a4
[00022ea0] 3940 0016                 move.w     d0,22(a4)
[00022ea4] 49e8 02a0                 lea.l      672(a0),a4
[00022ea8] 397c 0008 0016            move.w     #$0008,22(a4)
[00022eae] 3029 0002                 move.w     2(a1),d0
[00022eb2] e748                      lsl.w      #3,d0
[00022eb4] 3940 0012                 move.w     d0,18(a4)
[00022eb8] 49e8 0318                 lea.l      792(a0),a4
[00022ebc] 7010                      moveq.l    #16,d0
[00022ebe] 3940 0016                 move.w     d0,22(a4)
[00022ec2] 3940 0014                 move.w     d0,20(a4)
[00022ec6] 266c 000c                 movea.l    12(a4),a3
[00022eca] 3229 0008                 move.w     8(a1),d1
[00022ece] e949                      lsl.w      #4,d1
[00022ed0] d269 0006                 add.w      6(a1),d1
[00022ed4] e149                      lsl.w      #8,d1
[00022ed6] 3741 000c                 move.w     d1,12(a3)
[00022eda] 206f 0004                 movea.l    4(a7),a0
[00022ede] 5048                      addq.w     #8,a0
[00022ee0] 2688                      move.l     a0,(a3)
[00022ee2] 286f 0004                 movea.l    4(a7),a4
[00022ee6] 49ec 0028                 lea.l      40(a4),a4
[00022eea] 274c 0004                 move.l     a4,4(a3)
[00022eee] 426b 001a                 clr.w      26(a3)
[00022ef2] 377c 0012 001c            move.w     #$0012,28(a3)
[00022ef8] 377c 0010 001e            move.w     #$0010,30(a3)
[00022efe] 377c 0002 0020            move.w     #$0002,32(a3)
[00022f04] 7040                      moveq.l    #64,d0
[00022f06] 43e9 000a                 lea.l      10(a1),a1
[00022f0a] 4eb9 0008 3500            jsr        memcpy
[00022f10] 362b 000c                 move.w     12(a3),d3
[00022f14] 700c                      moveq.l    #12,d0
[00022f16] e063                      asr.w      d0,d3
[00022f18] c67c 000f                 and.w      #$000F,d3
[00022f1c] 3203                      move.w     d3,d1
[00022f1e] 48c1                      ext.l      d1
[00022f20] e589                      lsl.l      #2,d1
[00022f22] 41f9 000c a6d0            lea.l      colour_text,a0
[00022f28] 2270 1800                 movea.l    0(a0,d1.l),a1
[00022f2c] 206a 0014                 movea.l    20(a2),a0
[00022f30] 700e                      moveq.l    #14,d0
[00022f32] 4eb9 0005 0fd8            jsr        Aob_puttext
[00022f38] 206a 0014                 movea.l    20(a2),a0
[00022f3c] 3003                      move.w     d3,d0
[00022f3e] 0268 fff0 0146            andi.w     #$FFF0,326(a0)
[00022f44] c07c 000f                 and.w      #$000F,d0
[00022f48] 8168 0146                 or.w       d0,326(a0)
[00022f4c] 362b 000c                 move.w     12(a3),d3
[00022f50] e043                      asr.w      #8,d3
[00022f52] c67c 000f                 and.w      #$000F,d3
[00022f56] 3003                      move.w     d3,d0
[00022f58] 48c0                      ext.l      d0
[00022f5a] e588                      lsl.l      #2,d0
[00022f5c] 41f9 000c a6d0            lea.l      colour_text,a0
[00022f62] 2270 0800                 movea.l    0(a0,d0.l),a1
[00022f66] 206a 0014                 movea.l    20(a2),a0
[00022f6a] 7014                      moveq.l    #20,d0
[00022f6c] 4eb9 0005 0fd8            jsr        Aob_puttext
[00022f72] 206a 0014                 movea.l    20(a2),a0
[00022f76] 3003                      move.w     d3,d0
[00022f78] 0268 fff0 01d6            andi.w     #$FFF0,470(a0)
[00022f7e] c07c 000f                 and.w      #$000F,d0
[00022f82] 8168 01d6                 or.w       d0,470(a0)
[00022f86] 504f                      addq.w     #8,a7
[00022f88] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00022f8c] 4e75                      rts
term:
[00022f8e] 2f0a                      move.l     a2,-(a7)
[00022f90] 2f0b                      move.l     a3,-(a7)
[00022f92] 2448                      movea.l    a0,a2
[00022f94] 006a 0100 0056            ori.w      #$0100,86(a2)
[00022f9a] 2650                      movea.l    (a0),a3
[00022f9c] 302a 0056                 move.w     86(a2),d0
[00022fa0] c07c 0800                 and.w      #$0800,d0
[00022fa4] 6716                      beq.s      $00022FBC
[00022fa6] 43ea 002c                 lea.l      44(a2),a1
[00022faa] 206b 0004                 movea.l    4(a3),a0
[00022fae] 41e8 003a                 lea.l      58(a0),a0
[00022fb2] 7008                      moveq.l    #8,d0
[00022fb4] 4eb9 0008 3500            jsr        memcpy
[00022fba] 6014                      bra.s      $00022FD0
[00022fbc] 7008                      moveq.l    #8,d0
[00022fbe] 43ea 0024                 lea.l      36(a2),a1
[00022fc2] 206b 0004                 movea.l    4(a3),a0
[00022fc6] 41e8 003a                 lea.l      58(a0),a0
[00022fca] 4eb9 0008 3500            jsr        memcpy
[00022fd0] 206b 0004                 movea.l    4(a3),a0
[00022fd4] 42a8 0012                 clr.l      18(a0)
[00022fd8] 204b                      movea.l    a3,a0
[00022fda] 4eb9 0004 c7c8            jsr        Ax_free
[00022fe0] 204a                      movea.l    a2,a0
[00022fe2] 4eb9 0005 8362            jsr        Awi_closed
[00022fe8] 204a                      movea.l    a2,a0
[00022fea] 4eb9 0005 85f2            jsr        Awi_delete
[00022ff0] 265f                      movea.l    (a7)+,a3
[00022ff2] 245f                      movea.l    (a7)+,a2
[00022ff4] 4e75                      rts
