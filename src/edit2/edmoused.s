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
[00022658] 6b2a                      bmi.s      edmo_backcol_1
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
edmo_backcol_1:
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
[000226bc] 6b2c                      bmi.s      edmo_frontcol_1
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
edmo_frontcol_1:
[000226ea] 245f                      movea.l    (a7)+,a2
[000226ec] 261f                      move.l     (a7)+,d3
[000226ee] 4e75                      rts

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
[00022816] 6726                      beq.s      edmo_x_1
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
edmo_x_1:
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
[00022894] 6726                      beq.s      edmo_y_1
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
edmo_y_1:
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
[000228f2] 672c                      beq.s      edmo_set_1
[000228f4] 3029 02e4                 move.w     740(a1),d0
[000228f8] 5140                      subq.w     #8,d0
[000228fa] 670c                      beq.s      edmo_set_2
[000228fc] 5340                      subq.w     #1,d0
[000228fe] 6710                      beq.s      edmo_set_3
[00022900] 5340                      subq.w     #1,d0
[00022902] 6714                      beq.s      edmo_set_4
[00022904] 6000 01ba                 bra        edmo_set_5
edmo_set_2:
[00022908] 6100 fe18                 bsr        edmo_white
[0002290c] 6000 01b2                 bra        edmo_set_5
edmo_set_3:
[00022910] 6100 fe3c                 bsr        edmo_invisible
[00022914] 6000 01aa                 bra        edmo_set_5
edmo_set_4:
[00022918] 6100 fdd6                 bsr        edmo_black
[0002291c] 6000 01a2                 bra        edmo_set_5
edmo_set_1:
[00022920] 2079 0010 ee4e            movea.l    ACSblk,a0
[00022926] 3f68 0262 0016            move.w     610(a0),22(a7)
[0002292c] 3f68 0264 0014            move.w     612(a0),20(a7)
[00022932] 2f53 0018                 move.l     (a3),24(a7)
edmo_set_15:
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
[0002298c] 6b00 0132                 bmi        edmo_set_5
[00022990] 4a41                      tst.w      d1
[00022992] 6b00 012c                 bmi        edmo_set_5
[00022996] b07c 000f                 cmp.w      #$000F,d0
[0002299a] 6e00 0124                 bgt        edmo_set_5
[0002299e] b27c 000f                 cmp.w      #$000F,d1
[000229a2] 6e00 011c                 bgt        edmo_set_5
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
[000229f6] 671c                      beq.s      edmo_set_6
[000229f8] 5942                      subq.w     #4,d2
[000229fa] 672e                      beq.s      edmo_set_7
[000229fc] 5742                      subq.w     #3,d2
[000229fe] 6702                      beq.s      edmo_set_8
[00022a00] 603c                      bra.s      edmo_set_9
edmo_set_8:
[00022a02] 3215                      move.w     (a5),d1
[00022a04] c240                      and.w      d0,d1
[00022a06] 6708                      beq.s      edmo_set_10
[00022a08] 3412                      move.w     (a2),d2
[00022a0a] c440                      and.w      d0,d2
[00022a0c] 6600 0088                 bne        edmo_set_11
edmo_set_10:
[00022a10] 8155                      or.w       d0,(a5)
[00022a12] 6012                      bra.s      edmo_set_12
edmo_set_6:
[00022a14] 3215                      move.w     (a5),d1
[00022a16] c240                      and.w      d0,d1
[00022a18] 6606                      bne.s      edmo_set_13
[00022a1a] 3412                      move.w     (a2),d2
[00022a1c] c440                      and.w      d0,d2
[00022a1e] 6676                      bne.s      edmo_set_11
edmo_set_13:
[00022a20] 3200                      move.w     d0,d1
[00022a22] 4641                      not.w      d1
[00022a24] c355                      and.w      d1,(a5)
edmo_set_12:
[00022a26] 8152                      or.w       d0,(a2)
[00022a28] 6014                      bra.s      edmo_set_9
edmo_set_7:
[00022a2a] 3215                      move.w     (a5),d1
[00022a2c] c240                      and.w      d0,d1
[00022a2e] 6606                      bne.s      edmo_set_14
[00022a30] 3412                      move.w     (a2),d2
[00022a32] c440                      and.w      d0,d2
[00022a34] 6760                      beq.s      edmo_set_11
edmo_set_14:
[00022a36] 3200                      move.w     d0,d1
[00022a38] 4641                      not.w      d1
[00022a3a] c355                      and.w      d1,(a5)
[00022a3c] c352                      and.w      d1,(a2)
edmo_set_9:
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
edmo_set_11:
[00022a96] 2f39 000e 692a            move.l     _globl,-(a7)
[00022a9c] 486f 0008                 pea.l      8(a7)
[00022aa0] 486f 000e                 pea.l      14(a7)
[00022aa4] 43ef 0020                 lea.l      32(a7),a1
[00022aa8] 41ef 0022                 lea.l      34(a7),a0
[00022aac] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[00022ab2] 4fef 000c                 lea.l      12(a7),a7
[00022ab6] 7001                      moveq.l    #1,d0
[00022ab8] c06f 0006                 and.w      6(a7),d0
[00022abc] 6600 fe78                 bne        edmo_set_15
edmo_set_5:
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
[00022b20] 6606                      bne.s      edmo_bitmap_1
[00022b22] 322f 0006                 move.w     6(a7),d1
[00022b26] 6730                      beq.s      edmo_bitmap_2
edmo_bitmap_1:
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
edmo_bitmap_2:
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
[00022ba4] 6000 00f2                 bra        edmo_bitmap_3
edmo_bitmap_11:
[00022ba8] 302d 000e                 move.w     14(a5),d0
[00022bac] b06f 0002                 cmp.w      2(a7),d0
[00022bb0] 6d00 00d4                 blt        edmo_bitmap_4
[00022bb4] 322d 000a                 move.w     10(a5),d1
[00022bb8] b26f 0006                 cmp.w      6(a7),d1
[00022bbc] 6e00 00c8                 bgt        edmo_bitmap_4
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
[00022bea] 6000 0092                 bra        edmo_bitmap_5
edmo_bitmap_9:
[00022bee] 302d 000c                 move.w     12(a5),d0
[00022bf2] b057                      cmp.w      (a7),d0
[00022bf4] 6d00 007a                 blt.w      edmo_bitmap_6
[00022bf8] 322d 0008                 move.w     8(a5),d1
[00022bfc] b26f 0004                 cmp.w      4(a7),d1
[00022c00] 6e6e                      bgt.s      edmo_bitmap_6
[00022c02] 3404                      move.w     d4,d2
[00022c04] c47c 8000                 and.w      #$8000,d2
[00022c08] 6720                      beq.s      edmo_bitmap_7
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
[00022c28] 6046                      bra.s      edmo_bitmap_6
edmo_bitmap_7:
[00022c2a] 3005                      move.w     d5,d0
[00022c2c] c07c 8000                 and.w      #$8000,d0
[00022c30] 6720                      beq.s      edmo_bitmap_8
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
[00022c50] 601e                      bra.s      edmo_bitmap_6
edmo_bitmap_8:
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
edmo_bitmap_6:
[00022c70] d844                      add.w      d4,d4
[00022c72] da45                      add.w      d5,d5
[00022c74] 506d 0008                 addq.w     #8,8(a5)
[00022c78] 506d 000c                 addq.w     #8,12(a5)
[00022c7c] 5346                      subq.w     #1,d6
edmo_bitmap_5:
[00022c7e] 4a46                      tst.w      d6
[00022c80] 6a00 ff6c                 bpl        edmo_bitmap_9
[00022c84] 6008                      bra.s      edmo_bitmap_10
edmo_bitmap_4:
[00022c86] 54af 001c                 addq.l     #2,28(a7)
[00022c8a] 54af 0018                 addq.l     #2,24(a7)
edmo_bitmap_10:
[00022c8e] 506d 000a                 addq.w     #8,10(a5)
[00022c92] 506d 000e                 addq.w     #8,14(a5)
[00022c96] 5243                      addq.w     #1,d3
edmo_bitmap_3:
[00022c98] b67c 0010                 cmp.w      #$0010,d3
[00022c9c] 6d00 ff0a                 blt        edmo_bitmap_11
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
[00022d40] 670a                      beq.s      mo_make_1
[00022d42] 204c                      movea.l    a4,a0
[00022d44] 4eb9 0005 6bea            jsr        Awi_show
[00022d4a] 6074                      bra.s      mo_make_2
mo_make_1:
[00022d4c] 7048                      moveq.l    #72,d0
[00022d4e] 4eb9 0004 c608            jsr        Ax_malloc
[00022d54] 2e88                      move.l     a0,(a7)
[00022d56] 2008                      move.l     a0,d0
[00022d58] 6762                      beq.s      mo_make_3
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
[00022d86] 6734                      beq.s      mo_make_3
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
[00022db2] 670c                      beq.s      mo_make_2
[00022db4] 204c                      movea.l    a4,a0
[00022db6] 4eb9 0002 2f8e            jsr        term
mo_make_3:
[00022dbc] 91c8                      suba.l     a0,a0
[00022dbe] 6002                      bra.s      mo_make_4
mo_make_2:
[00022dc0] 204c                      movea.l    a4,a0
mo_make_4:
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
[00022dd8] 6708                      beq.s      mo_service_1
[00022dda] 907c 270e                 sub.w      #$270E,d0
[00022dde] 6712                      beq.s      mo_service_2
[00022de0] 601e                      bra.s      mo_service_3
mo_service_1:
[00022de2] 204a                      movea.l    a2,a0
[00022de4] 6100 fedc                 bsr        acc_mouse
[00022de8] 204a                      movea.l    a2,a0
[00022dea] 4eb9 0002 2f8e            jsr        term
[00022df0] 601c                      bra.s      mo_service_4
mo_service_2:
[00022df2] 226b 0004                 movea.l    4(a3),a1
[00022df6] 204a                      movea.l    a2,a0
[00022df8] 4eb9 0001 60ea            jsr        new_name
[00022dfe] 600e                      bra.s      mo_service_4
mo_service_3:
[00022e00] 224c                      movea.l    a4,a1
[00022e02] 3003                      move.w     d3,d0
[00022e04] 204a                      movea.l    a2,a0
[00022e06] 4eb9 0005 9dd0            jsr        Awi_service
[00022e0c] 6002                      bra.s      mo_service_5
mo_service_4:
[00022e0e] 7001                      moveq.l    #1,d0
mo_service_5:
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
[00022e7a] 6f04                      ble.s      set_mouse_1
[00022e7c] 3141 0016                 move.w     d1,22(a0)
set_mouse_1:
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
[00022fa4] 6716                      beq.s      term_1
[00022fa6] 43ea 002c                 lea.l      44(a2),a1
[00022faa] 206b 0004                 movea.l    4(a3),a0
[00022fae] 41e8 003a                 lea.l      58(a0),a0
[00022fb2] 7008                      moveq.l    #8,d0
[00022fb4] 4eb9 0008 3500            jsr        memcpy
[00022fba] 6014                      bra.s      term_2
term_1:
[00022fbc] 7008                      moveq.l    #8,d0
[00022fbe] 43ea 0024                 lea.l      36(a2),a1
[00022fc2] 206b 0004                 movea.l    4(a3),a0
[00022fc6] 41e8 003a                 lea.l      58(a0),a0
[00022fca] 4eb9 0008 3500            jsr        memcpy
term_2:
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

	.data

TEXT_001:
[000b20fe]                           dc.b 'Abbruch',0
TEXT_002:
[000b2106]                           dc.w $004f
[000b2108]                           dc.w $4b00
TEXT_01:
[000b210a]                           dc.b 'neues Muster',0
TEXT_03:
[000b2117]                           dc.b 'Pinsel:',0
TEXT_04:
[000b211f]                           dc.b ' Maus-Editor ',0
TEXT_05:
[000b212d]                           dc.b 'Beispiel:',0
TEXT_09:
[000b2137]                           dc.b 'hinten:',0
TEXT_10:
[000b213f]                           dc.b 'vorne:',0
TEXT_18:
[000b2146]                           dc.b 'Farbe:',0
TEXT_210:
[000b214d]                           dc.b 'MŽUSE',0
[000b2153]                           dc.b $00
[000b2154] 00064a22                  dc.l A_3Dbutton
[000b2158]                           dc.w $29c1
[000b215a]                           dc.w $0178
[000b215c] 000630f2                  dc.l Auo_string
[000b2160] 000b20fe                  dc.l TEXT_001
[000b2164]                           dc.w $0000
[000b2166]                           dc.w $0000
[000b2168]                           dc.w $0000
[000b216a]                           dc.w $0000
[000b216c]                           dc.w $0000
[000b216e]                           dc.w $0000
[000b2170]                           dc.w $0000
[000b2172]                           dc.w $0000
A_3DBUTTON03:
[000b2174] 00064a22                  dc.l A_3Dbutton
[000b2178]                           dc.w $29c1
[000b217a]                           dc.w $0178
[000b217c] 000630f2                  dc.l Auo_string
[000b2180] 000b2107                  dc.l TEXT_003
[000b2184]                           dc.w $0000
[000b2186]                           dc.w $0000
[000b2188]                           dc.w $0000
[000b218a]                           dc.w $0000
[000b218c]                           dc.w $0000
[000b218e]                           dc.w $0000
[000b2190]                           dc.w $0000
[000b2192]                           dc.w $0000
A_3DBUTTON04:
[000b2194] 00064a22                  dc.l A_3Dbutton
[000b2198]                           dc.w $29c1
[000b219a]                           dc.w $0178
[000b219c] 000630f2                  dc.l Auo_string
[000b21a0] 000b210a                  dc.l TEXT_01
[000b21a4]                           dc.w $0000
[000b21a6]                           dc.w $0000
[000b21a8]                           dc.w $0000
[000b21aa]                           dc.w $0000
[000b21ac]                           dc.w $0000
[000b21ae]                           dc.w $0000
[000b21b0]                           dc.w $0000
[000b21b2]                           dc.w $0000
A_3DBUTTON05:
[000b21b4] 00064a22                  dc.l A_3Dbutton
[000b21b8]                           dc.w $2000
[000b21ba]                           dc.w $91c8
[000b21bc] 000630f2                  dc.l Auo_string
[000b21c0]                           dc.w $0000
[000b21c2]                           dc.w $0000
[000b21c4]                           dc.w $0000
[000b21c6]                           dc.w $0000
[000b21c8]                           dc.w $0000
[000b21ca]                           dc.w $0000
[000b21cc]                           dc.w $0000
[000b21ce]                           dc.w $0000
[000b21d0]                           dc.w $0000
[000b21d2]                           dc.w $0000
A_3DBUTTON06:
[000b21d4] 00064a22                  dc.l A_3Dbutton
[000b21d8]                           dc.w $a021
[000b21da]                           dc.w $91f8
[000b21dc] 000630f2                  dc.l Auo_string
[000b21e0]                           dc.w $0000
[000b21e2]                           dc.w $0000
[000b21e4]                           dc.w $0000
[000b21e6]                           dc.w $0000
[000b21e8]                           dc.w $0000
[000b21ea]                           dc.w $0000
[000b21ec]                           dc.w $0000
[000b21ee]                           dc.w $0000
[000b21f0]                           dc.w $0000
[000b21f2]                           dc.w $0000
A_3DBUTTON07:
[000b21f4] 00064a22                  dc.l A_3Dbutton
[000b21f8]                           dc.w $21f1
[000b21fa]                           dc.w $0178
[000b21fc] 000630f2                  dc.l Auo_string
[000b2200]                           dc.w $0000
[000b2202]                           dc.w $0000
[000b2204]                           dc.w $0000
[000b2206]                           dc.w $0000
[000b2208]                           dc.w $0000
[000b220a]                           dc.w $0000
[000b220c]                           dc.w $0000
[000b220e]                           dc.w $0000
[000b2210]                           dc.w $0000
[000b2212]                           dc.w $0000
A_3DBUTTON27:
[000b2214] 00064a22                  dc.l A_3Dbutton
[000b2218]                           dc.w $09f1
[000b221a]                           dc.w $0178
[000b221c] 000630f2                  dc.l Auo_string
[000b2220]                           dc.w $0000
[000b2222]                           dc.w $0000
[000b2224]                           dc.w $0000
[000b2226]                           dc.w $0000
[000b2228]                           dc.w $0000
[000b222a]                           dc.w $0000
[000b222c]                           dc.w $0000
[000b222e]                           dc.w $0000
[000b2230]                           dc.w $0000
[000b2232]                           dc.w $0000
A_ARROWS02:
[000b2234] 00065c72                  dc.l A_arrows
[000b2238]                           dc.w $1301
[000b223a]                           dc.w $0001
[000b223c]                           dc.w $0000
[000b223e]                           dc.w $0000
[000b2240]                           dc.w $0000
[000b2242]                           dc.w $0000
[000b2244]                           dc.w $0000
[000b2246]                           dc.w $0000
[000b2248]                           dc.w $0000
[000b224a]                           dc.w $0000
[000b224c]                           dc.w $0000
[000b224e]                           dc.w $0000
[000b2250]                           dc.w $0000
[000b2252]                           dc.w $0000
A_INNERFRAME02:
[000b2254] 00064256                  dc.l A_innerframe
[000b2258]                           dc.w $1000
[000b225a]                           dc.w $8f19
[000b225c] 000630f2                  dc.l Auo_string
[000b2260] 000b2146                  dc.l TEXT_18
[000b2264]                           dc.w $0000
[000b2266]                           dc.w $0000
[000b2268]                           dc.w $0000
[000b226a]                           dc.w $0000
[000b226c]                           dc.w $0000
[000b226e]                           dc.w $0000
[000b2270]                           dc.w $0000
[000b2272]                           dc.w $0000
A_INNERFRAME03:
[000b2274] 00064256                  dc.l A_innerframe
[000b2278]                           dc.w $1000
[000b227a]                           dc.w $8f19
[000b227c] 000630f2                  dc.l Auo_string
[000b2280] 000b2117                  dc.l TEXT_03
[000b2284]                           dc.w $0000
[000b2286]                           dc.w $0000
[000b2288]                           dc.w $0000
[000b228a]                           dc.w $0000
[000b228c]                           dc.w $0000
[000b228e]                           dc.w $0000
[000b2290]                           dc.w $0000
[000b2292]                           dc.w $0000
A_INNERFRAME04:
[000b2294] 00064256                  dc.l A_innerframe
[000b2298]                           dc.w $1000
[000b229a]                           dc.w $8f19
[000b229c] 000630f2                  dc.l Auo_string
[000b22a0] 000b212d                  dc.l TEXT_05
[000b22a4]                           dc.w $0000
[000b22a6]                           dc.w $0000
[000b22a8]                           dc.w $0000
[000b22aa]                           dc.w $0000
[000b22ac]                           dc.w $0000
[000b22ae]                           dc.w $0000
[000b22b0]                           dc.w $0000
[000b22b2]                           dc.w $0000
USER_004:
[000b22b4] 00022afe                  dc.l edmo_bitmap
[000b22b8]                           dc.w $0000
[000b22ba]                           dc.w $0000
[000b22bc]                           dc.w $0000
[000b22be]                           dc.w $0000
[000b22c0]                           dc.w $0000
[000b22c2]                           dc.w $0000
[000b22c4]                           dc.w $0000
[000b22c6]                           dc.w $0000
[000b22c8]                           dc.w $0000
[000b22ca]                           dc.w $0000
[000b22cc]                           dc.w $0000
[000b22ce]                           dc.w $0000
[000b22d0]                           dc.w $0000
[000b22d2]                           dc.w $0000
_MSK_IC_MOUSE:
[000b22d4]                           dc.w $0000
[000b22d6]                           dc.w $0000
[000b22d8]                           dc.w $0000
[000b22da]                           dc.w $0000
[000b22dc]                           dc.w $0000
[000b22de]                           dc.w $0000
[000b22e0]                           dc.w $0000
[000b22e2]                           dc.w $0000
[000b22e4]                           dc.w $0000
[000b22e6]                           dc.w $0200
[000b22e8]                           dc.w $0100
[000b22ea]                           dc.w $1c00
[000b22ec]                           dc.w $0700
[000b22ee]                           dc.w $0380
[000b22f0]                           dc.w $3e00
[000b22f2]                           dc.w $0780
[000b22f4]                           dc.w $0380
[000b22f6]                           dc.w $3e00
[000b22f8]                           dc.w $07c0
[000b22fa]                           dc.w $0380
[000b22fc]                           dc.w $ff80
[000b22fe]                           dc.w $07e0
[000b2300]                           dc.w $1ff1
[000b2302]                           dc.w $ffc0
[000b2304]                           dc.w $07f0
[000b2306]                           dc.w $3ff9
[000b2308]                           dc.w $ffc0
[000b230a]                           dc.w $07e0
[000b230c]                           dc.w $1ff1
[000b230e]                           dc.w $ffc0
[000b2310]                           dc.w $07e0
[000b2312]                           dc.w $0380
[000b2314]                           dc.w $ff80
[000b2316]                           dc.w $02e0
[000b2318]                           dc.w $0380
[000b231a]                           dc.w $3e00
[000b231c]                           dc.w $0040
[000b231e]                           dc.w $0380
[000b2320]                           dc.w $3e00
[000b2322]                           dc.w $0000
[000b2324]                           dc.w $0100
[000b2326]                           dc.w $1c00
[000b2328]                           dc.w $0000
[000b232a]                           dc.w $0000
[000b232c]                           dc.w $0000
[000b232e]                           dc.w $03fc
[000b2330]                           dc.w $0000
[000b2332]                           dc.w $1c00
[000b2334]                           dc.w $07fe
[000b2336]                           dc.w $06c0
[000b2338]                           dc.w $3e00
[000b233a]                           dc.w $07fe
[000b233c]                           dc.w $0fe0
[000b233e]                           dc.w $7f00
[000b2340]                           dc.w $07fe
[000b2342]                           dc.w $07c0
[000b2344]                           dc.w $2700
[000b2346]                           dc.w $03fc
[000b2348]                           dc.w $0380
[000b234a]                           dc.w $0700
[000b234c]                           dc.w $01f8
[000b234e]                           dc.w $0380
[000b2350]                           dc.w $0e00
[000b2352]                           dc.w $00f0
[000b2354]                           dc.w $0380
[000b2356]                           dc.w $1c00
[000b2358]                           dc.w $01f8
[000b235a]                           dc.w $0380
[000b235c]                           dc.w $1c00
[000b235e]                           dc.w $03fc
[000b2360]                           dc.w $0380
[000b2362]                           dc.w $0800
[000b2364]                           dc.w $07fe
[000b2366]                           dc.w $07c0
[000b2368]                           dc.w $1c00
[000b236a]                           dc.w $07fe
[000b236c]                           dc.w $0fe0
[000b236e]                           dc.w $1c00
[000b2370]                           dc.w $07fe
[000b2372]                           dc.w $06c0
[000b2374]                           dc.w $0800
[000b2376]                           dc.w $03fc
[000b2378]                           dc.w $0000
[000b237a]                           dc.w $0000
[000b237c]                           dc.w $0000
[000b237e]                           dc.w $0000
[000b2380]                           dc.w $0000
[000b2382]                           dc.w $0000
[000b2384]                           dc.w $0000
[000b2386]                           dc.w $0000
_DAT_IC_MOUSE:
[000b2388]                           dc.w $0000
[000b238a]                           dc.w $0000
[000b238c]                           dc.w $0000
[000b238e]                           dc.w $0000
[000b2390]                           dc.w $0000
[000b2392]                           dc.w $0000
[000b2394]                           dc.w $0000
[000b2396]                           dc.w $0000
[000b2398]                           dc.w $0000
[000b239a]                           dc.w $0000
[000b239c]                           dc.w $0000
[000b239e]                           dc.w $0000
[000b23a0]                           dc.w $0200
[000b23a2]                           dc.w $0100
[000b23a4]                           dc.w $1c00
[000b23a6]                           dc.w $0300
[000b23a8]                           dc.w $0100
[000b23aa]                           dc.w $1c00
[000b23ac]                           dc.w $0380
[000b23ae]                           dc.w $0100
[000b23b0]                           dc.w $1c00
[000b23b2]                           dc.w $03c0
[000b23b4]                           dc.w $0100
[000b23b6]                           dc.w $f780
[000b23b8]                           dc.w $03e0
[000b23ba]                           dc.w $1ef0
[000b23bc]                           dc.w $e380
[000b23be]                           dc.w $0380
[000b23c0]                           dc.w $0100
[000b23c2]                           dc.w $f780
[000b23c4]                           dc.w $02c0
[000b23c6]                           dc.w $0100
[000b23c8]                           dc.w $1c00
[000b23ca]                           dc.w $0040
[000b23cc]                           dc.w $0100
[000b23ce]                           dc.w $1c00
[000b23d0]                           dc.w $0000
[000b23d2]                           dc.w $0100
[000b23d4]                           dc.w $1c00
[000b23d6]                           dc.w $0000
[000b23d8]                           dc.w $0000
[000b23da]                           dc.w $0000
[000b23dc]                           dc.w $0000
[000b23de]                           dc.w $0000
[000b23e0]                           dc.w $0000
[000b23e2]                           dc.w $0000
[000b23e4]                           dc.w $0000
[000b23e6]                           dc.w $0000
[000b23e8]                           dc.w $03fc
[000b23ea]                           dc.w $0000
[000b23ec]                           dc.w $1c00
[000b23ee]                           dc.w $0204
[000b23f0]                           dc.w $06c0
[000b23f2]                           dc.w $2200
[000b23f4]                           dc.w $0204
[000b23f6]                           dc.w $0100
[000b23f8]                           dc.w $0200
[000b23fa]                           dc.w $01b8
[000b23fc]                           dc.w $0100
[000b23fe]                           dc.w $0200
[000b2400]                           dc.w $00f0
[000b2402]                           dc.w $0100
[000b2404]                           dc.w $0400
[000b2406]                           dc.w $0060
[000b2408]                           dc.w $0100
[000b240a]                           dc.w $0800
[000b240c]                           dc.w $00f0
[000b240e]                           dc.w $0100
[000b2410]                           dc.w $0800
[000b2412]                           dc.w $0148
[000b2414]                           dc.w $0100
[000b2416]                           dc.w $0000
[000b2418]                           dc.w $0244
[000b241a]                           dc.w $0100
[000b241c]                           dc.w $0800
[000b241e]                           dc.w $02f4
[000b2420]                           dc.w $06c0
[000b2422]                           dc.w $0800
[000b2424]                           dc.w $03fc
[000b2426]                           dc.w $0000
[000b2428]                           dc.w $0000
[000b242a]                           dc.w $0000
[000b242c]                           dc.w $0000
[000b242e]                           dc.w $0000
[000b2430]                           dc.w $0000
[000b2432]                           dc.w $0000
[000b2434]                           dc.w $0000
[000b2436]                           dc.w $0000
[000b2438]                           dc.w $0000
[000b243a]                           dc.w $0000
IC_MOUSE:
[000b243c] 000b22d4                  dc.l _MSK_IC_MOUSE
[000b2440] 000b2388                  dc.l _DAT_IC_MOUSE
[000b2444] 000b214d                  dc.l TEXT_210
[000b2448]                           dc.w $1000
[000b244a]                           dc.w $0000
[000b244c]                           dc.w $0000
[000b244e]                           dc.w $000c
[000b2450]                           dc.w $0000
[000b2452]                           dc.w $0030
[000b2454]                           dc.w $001e
[000b2456]                           dc.w $0000
[000b2458]                           dc.w $0020
[000b245a]                           dc.w $0048
[000b245c]                           dc.w $0008
[000b245e]                           dc.w $0000
[000b2460]                           dc.w $0000
_MSK_MOUSEDUMMY:
[000b2462]                           dc.w $ffff
[000b2464]                           dc.w $ffff
[000b2466]                           dc.w $ffff
[000b2468]                           dc.w $ffff
[000b246a]                           dc.w $ffff
[000b246c]                           dc.w $ffff
[000b246e]                           dc.w $ffff
[000b2470]                           dc.w $ffff
[000b2472]                           dc.w $ffff
[000b2474]                           dc.w $ffff
[000b2476]                           dc.w $ffff
[000b2478]                           dc.w $ffff
[000b247a]                           dc.w $ffff
[000b247c]                           dc.w $ffff
[000b247e]                           dc.w $ffff
[000b2480]                           dc.w $ffff
_DAT_MOUSEDUMMY:
[000b2482]                           dc.w $7ffe
[000b2484]                           dc.w $bffd
[000b2486]                           dc.w $dffb
[000b2488]                           dc.w $eff7
[000b248a]                           dc.w $f7ef
[000b248c]                           dc.w $fbdf
[000b248e]                           dc.w $fdbf
[000b2490]                           dc.w $fe7f
[000b2492]                           dc.w $fe7f
[000b2494]                           dc.w $fdbf
[000b2496]                           dc.w $fbdf
[000b2498]                           dc.w $f7ef
[000b249a]                           dc.w $eff7
[000b249c]                           dc.w $dffb
[000b249e]                           dc.w $bffd
[000b24a0]                           dc.w $7ffe
MOUSEDUMMY:
[000b24a2] 000b2462                  dc.l _MSK_MOUSEDUMMY
[000b24a6] 000b2482                  dc.l _DAT_MOUSEDUMMY
[000b24aa] 000b2106                  dc.l TEXT_002
[000b24ae]                           dc.w $1000
[000b24b0]                           dc.w $000a
[000b24b2]                           dc.w $000a
[000b24b4]                           dc.w $0000
[000b24b6]                           dc.w $0000
[000b24b8]                           dc.w $0010
[000b24ba]                           dc.w $0010
[000b24bc]                           dc.w $0000
[000b24be]                           dc.w $0000
[000b24c0]                           dc.w $0008
[000b24c2]                           dc.w $0008
[000b24c4]                           dc.w $0000
[000b24c6]                           dc.w $0000
EDIT_MOUSE:
[000b24c8]                           dc.w $ffff
[000b24ca]                           dc.w $0001
[000b24cc]                           dc.w $0026
[000b24ce]                           dc.w $0018
[000b24d0]                           dc.w $0040
[000b24d2]                           dc.w $0010
[000b24d4] 000b21f4                  dc.l A_3DBUTTON07
[000b24d8]                           dc.w $0000
[000b24da]                           dc.w $0000
[000b24dc]                           dc.w $0032
[000b24de]                           dc.w $000d
_01_EDIT_MOUSE:
[000b24e0]                           dc.w $0008
[000b24e2]                           dc.w $0002
[000b24e4]                           dc.w $0006
[000b24e6]                           dc.w $0018
[000b24e8]                           dc.w $0040
[000b24ea]                           dc.w $0000
[000b24ec] 000b2274                  dc.l A_INNERFRAME03
[000b24f0]                           dc.w $000a
[000b24f2]                           dc.w $0000
[000b24f4]                           dc.w $000a
[000b24f6]                           dc.w $0003
_02_EDIT_MOUSE:
[000b24f8]                           dc.w $0004
[000b24fa]                           dc.w $ffff
[000b24fc]                           dc.w $ffff
[000b24fe]                           dc.w $0014
[000b2500]                           dc.w $0005
[000b2502]                           dc.w $0000
[000b2504]                           dc.w $0001
[000b2506]                           dc.w $0171
[000b2508]                           dc.w $0001
[000b250a]                           dc.w $0001
[000b250c]                           dc.w $0002
[000b250e]                           dc.w $0001
_02aEDIT_MOUSE:
[000b2510] 000226f0                  dc.l edmo_black
[000b2514]                           dc.w $0000
[000b2516]                           dc.w $0000
[000b2518]                           dc.w $8000
[000b251a]                           dc.w $0053
[000b251c]                           dc.w $0000
[000b251e]                           dc.w $0000
[000b2520]                           dc.w $0000
[000b2522]                           dc.w $0000
[000b2524]                           dc.w $0000
[000b2526]                           dc.w $0000
_04_EDIT_MOUSE:
[000b2528]                           dc.w $0006
[000b252a]                           dc.w $ffff
[000b252c]                           dc.w $ffff
[000b252e]                           dc.w $0014
[000b2530]                           dc.w $0005
[000b2532]                           dc.w $0000
[000b2534]                           dc.w $0001
[000b2536]                           dc.w $1170
[000b2538]                           dc.w $0004
[000b253a]                           dc.w $0001
[000b253c]                           dc.w $0002
[000b253e]                           dc.w $0001
_04aEDIT_MOUSE:
[000b2540] 00022722                  dc.l edmo_white
[000b2544]                           dc.w $0000
[000b2546]                           dc.w $0000
[000b2548]                           dc.w $8000
[000b254a]                           dc.w $0057
[000b254c]                           dc.w $0000
[000b254e]                           dc.w $0000
[000b2550]                           dc.w $0000
[000b2552]                           dc.w $0000
[000b2554]                           dc.w $0000
[000b2556]                           dc.w $0000
_06_EDIT_MOUSE:
[000b2558]                           dc.w $0001
[000b255a]                           dc.w $ffff
[000b255c]                           dc.w $ffff
[000b255e]                           dc.w $0014
[000b2560]                           dc.w $0005
[000b2562]                           dc.w $0000
[000b2564]                           dc.w $0001
[000b2566]                           dc.w $1141
[000b2568]                           dc.w $0007
[000b256a]                           dc.w $0001
[000b256c]                           dc.w $0002
[000b256e]                           dc.w $0001
_06aEDIT_MOUSE:
[000b2570] 0002274e                  dc.l edmo_invisible
[000b2574]                           dc.w $0000
[000b2576]                           dc.w $0000
[000b2578]                           dc.w $8000
[000b257a]                           dc.w $0054
[000b257c]                           dc.w $0000
[000b257e]                           dc.w $0000
[000b2580]                           dc.w $0000
[000b2582]                           dc.w $0000
[000b2584]                           dc.w $0000
[000b2586]                           dc.w $0000
_08_EDIT_MOUSE:
[000b2588]                           dc.w $0015
[000b258a]                           dc.w $0009
[000b258c]                           dc.w $0011
[000b258e]                           dc.w $0018
[000b2590]                           dc.w $0040
[000b2592]                           dc.w $0000
[000b2594] 000b2254                  dc.l A_INNERFRAME02
[000b2598]                           dc.w $0015
[000b259a]                           dc.w $0000
[000b259c]                           dc.w $001c
[000b259e]                           dc.w $0005
_09_EDIT_MOUSE:
[000b25a0]                           dc.w $000b
[000b25a2]                           dc.w $000a
[000b25a4]                           dc.w $000a
[000b25a6]                           dc.w $001c
[000b25a8]                           dc.w $0040
[000b25aa]                           dc.w $0000
[000b25ac] 000b213f                  dc.l TEXT_10
[000b25b0]                           dc.w $0001
[000b25b2]                           dc.w $0001
[000b25b4]                           dc.w $0006
[000b25b6]                           dc.w $0001
_10_EDIT_MOUSE:
[000b25b8]                           dc.w $0009
[000b25ba]                           dc.w $ffff
[000b25bc]                           dc.w $ffff
[000b25be]                           dc.w $0018
[000b25c0]                           dc.w $0040
[000b25c2]                           dc.w $0000
[000b25c4] 000b2234                  dc.l A_ARROWS02
[000b25c8]                           dc.w $0000
[000b25ca]                           dc.w $0000
[000b25cc]                           dc.w $0001
[000b25ce]                           dc.w $0001
_11_EDIT_MOUSE:
[000b25d0]                           dc.w $000f
[000b25d2]                           dc.w $000d
[000b25d4]                           dc.w $000e
[000b25d6]                           dc.w $0014
[000b25d8]                           dc.w $0040
[000b25da]                           dc.w $0020
[000b25dc]                           dc.w $00ff
[000b25de]                           dc.w $1101
[000b25e0]                           dc.w $0009
[000b25e2]                           dc.w $0001
[000b25e4]                           dc.w $0012
[000b25e6]                           dc.w $0001
_11aEDIT_MOUSE:
[000b25e8] 0002268a                  dc.l edmo_frontcol
[000b25ec]                           dc.w $0000
[000b25ee]                           dc.w $0000
[000b25f0]                           dc.w $8000
[000b25f2]                           dc.w $8856
[000b25f4]                           dc.w $0000
[000b25f6]                           dc.w $0000
[000b25f8]                           dc.w $0000
[000b25fa]                           dc.w $0000
[000b25fc]                           dc.w $0000
[000b25fe]                           dc.w $0000
_13_EDIT_MOUSE:
[000b2600]                           dc.w $000e
[000b2602]                           dc.w $ffff
[000b2604]                           dc.w $ffff
[000b2606]                           dc.w $0014
[000b2608]                           dc.w $0000
[000b260a]                           dc.w $0000
[000b260c]                           dc.w $0001
[000b260e]                           dc.w $1171
[000b2610]                           dc.w $0010
[000b2612]                           dc.w $0000
[000b2614]                           dc.w $0002
[000b2616]                           dc.w $0001
_14_EDIT_MOUSE:
[000b2618]                           dc.w $000b
[000b261a]                           dc.w $ffff
[000b261c]                           dc.w $ffff
[000b261e]                           dc.w $0018
[000b2620]                           dc.w $0000
[000b2622]                           dc.w $0000
[000b2624] 000b2214                  dc.l A_3DBUTTON27
[000b2628]                           dc.w $0000
[000b262a]                           dc.w $0000
[000b262c]                           dc.w $0010
[000b262e]                           dc.w $0001
_15_EDIT_MOUSE:
[000b2630]                           dc.w $0011
[000b2632]                           dc.w $0010
[000b2634]                           dc.w $0010
[000b2636]                           dc.w $001c
[000b2638]                           dc.w $0040
[000b263a]                           dc.w $0000
[000b263c] 000b2137                  dc.l TEXT_09
[000b2640]                           dc.w $0001
[000b2642]                           dc.w $0003
[000b2644]                           dc.w $0007
[000b2646]                           dc.w $0001
_16_EDIT_MOUSE:
[000b2648]                           dc.w $000f
[000b264a]                           dc.w $ffff
[000b264c]                           dc.w $ffff
[000b264e]                           dc.w $0018
[000b2650]                           dc.w $0040
[000b2652]                           dc.w $0000
[000b2654] 000b2234                  dc.l A_ARROWS02
[000b2658]                           dc.w $0000
[000b265a]                           dc.w $0000
[000b265c]                           dc.w $0001
[000b265e]                           dc.w $0001
_17_EDIT_MOUSE:
[000b2660]                           dc.w $0008
[000b2662]                           dc.w $0013
[000b2664]                           dc.w $0014
[000b2666]                           dc.w $0014
[000b2668]                           dc.w $0040
[000b266a]                           dc.w $0020
[000b266c]                           dc.w $00ff
[000b266e]                           dc.w $1101
[000b2670]                           dc.w $0009
[000b2672]                           dc.w $0003
[000b2674]                           dc.w $0012
[000b2676]                           dc.w $0001
_17aEDIT_MOUSE:
[000b2678] 00022628                  dc.l edmo_backcol
[000b267c]                           dc.w $0000
[000b267e]                           dc.w $0000
[000b2680]                           dc.w $8000
[000b2682]                           dc.w $8848
[000b2684]                           dc.w $0000
[000b2686]                           dc.w $0000
[000b2688]                           dc.w $0000
[000b268a]                           dc.w $0000
[000b268c]                           dc.w $0000
[000b268e]                           dc.w $0000
_19_EDIT_MOUSE:
[000b2690]                           dc.w $0014
[000b2692]                           dc.w $ffff
[000b2694]                           dc.w $ffff
[000b2696]                           dc.w $0014
[000b2698]                           dc.w $0000
[000b269a]                           dc.w $0000
[000b269c]                           dc.w $0001
[000b269e]                           dc.w $1171
[000b26a0]                           dc.w $0010
[000b26a2]                           dc.w $0000
[000b26a4]                           dc.w $0002
[000b26a6]                           dc.w $0001
_20_EDIT_MOUSE:
[000b26a8]                           dc.w $0011
[000b26aa]                           dc.w $ffff
[000b26ac]                           dc.w $ffff
[000b26ae]                           dc.w $0018
[000b26b0]                           dc.w $0000
[000b26b2]                           dc.w $0000
[000b26b4] 000b2214                  dc.l A_3DBUTTON27
[000b26b8]                           dc.w $0000
[000b26ba]                           dc.w $0000
[000b26bc]                           dc.w $0010
[000b26be]                           dc.w $0001
_21_EDIT_MOUSE:
[000b26c0]                           dc.w $0016
[000b26c2]                           dc.w $ffff
[000b26c4]                           dc.w $ffff
[000b26c6]                           dc.w $0014
[000b26c8]                           dc.w $0000
[000b26ca]                           dc.w $0000
[000b26cc]                           dc.w $0001
[000b26ce]                           dc.w $1171
[000b26d0]                           dc.w $0002
[000b26d2]                           dc.w $0001
[000b26d4]                           dc.w $0002
[000b26d6]                           dc.w $0001
_22_EDIT_MOUSE:
[000b26d8]                           dc.w $001f
[000b26da]                           dc.w $0017
[000b26dc]                           dc.w $001d
[000b26de]                           dc.w $0018
[000b26e0]                           dc.w $0000
[000b26e2]                           dc.w $0010
[000b26e4] 000b21d4                  dc.l A_3DBUTTON06
[000b26e8]                           dc.w $0002
[000b26ea]                           dc.w $0003
[000b26ec]                           dc.w $0012
[000b26ee]                           dc.w $000a
_23_EDIT_MOUSE:
[000b26f0]                           dc.w $001a
[000b26f2]                           dc.w $0019
[000b26f4]                           dc.w $0019
[000b26f6]                           dc.w $0014
[000b26f8]                           dc.w $0040
[000b26fa]                           dc.w $0000
[000b26fc]                           dc.w $5601
[000b26fe]                           dc.w $1101
[000b2700]                           dc.w $0002
[000b2702]                           dc.w $0000
[000b2704]                           dc.w $0010
[000b2706]                           dc.w $0001
_23aEDIT_MOUSE:
[000b2708] 000227c6                  dc.l edmo_x
[000b270c]                           dc.w $0000
[000b270e]                           dc.w $0000
[000b2710]                           dc.w $8000
[000b2712]                           dc.w $0000
[000b2714]                           dc.w $0000
[000b2716]                           dc.w $0000
[000b2718]                           dc.w $0000
[000b271a]                           dc.w $0000
[000b271c]                           dc.w $0000
[000b271e]                           dc.w $0000
_25_EDIT_MOUSE:
[000b2720]                           dc.w $0017
[000b2722]                           dc.w $ffff
[000b2724]                           dc.w $ffff
[000b2726]                           dc.w $0014
[000b2728]                           dc.w $0000
[000b272a]                           dc.w $0000
[000b272c]                           dc.w $5601
[000b272e]                           dc.w $1141
[000b2730]                           dc.w $0007
[000b2732]                           dc.w $0000
[000b2734]                           dc.w $0002
[000b2736]                           dc.w $0001
_26_EDIT_MOUSE:
[000b2738]                           dc.w $001d
[000b273a]                           dc.w $001c
[000b273c]                           dc.w $001c
[000b273e]                           dc.w $0014
[000b2740]                           dc.w $0040
[000b2742]                           dc.w $0000
[000b2744]                           dc.w $0001
[000b2746]                           dc.w $1101
[000b2748]                           dc.w $0000
[000b274a]                           dc.w $0001
[000b274c]                           dc.w $0002
[000b274e]                           dc.w $0009
_26aEDIT_MOUSE:
[000b2750] 00022846                  dc.l edmo_y
[000b2754]                           dc.w $0000
[000b2756]                           dc.w $0000
[000b2758]                           dc.w $8000
[000b275a]                           dc.w $0000
[000b275c]                           dc.w $0000
[000b275e]                           dc.w $0000
[000b2760]                           dc.w $0000
[000b2762]                           dc.w $0000
[000b2764]                           dc.w $0000
[000b2766]                           dc.w $0000
_28_EDIT_MOUSE:
[000b2768]                           dc.w $001a
[000b276a]                           dc.w $ffff
[000b276c]                           dc.w $ffff
[000b276e]                           dc.w $0014
[000b2770]                           dc.w $0000
[000b2772]                           dc.w $0000
[000b2774]                           dc.w $5601
[000b2776]                           dc.w $1141
[000b2778]                           dc.w $0000
[000b277a]                           dc.w $0002
[000b277c]                           dc.w $0002
[000b277e]                           dc.w $0001
_29_EDIT_MOUSE:
[000b2780]                           dc.w $0016
[000b2782]                           dc.w $ffff
[000b2784]                           dc.w $ffff
[000b2786]                           dc.w $0018
[000b2788]                           dc.w $0040
[000b278a]                           dc.w $0000
[000b278c] 000b22b4                  dc.l USER_004
[000b2790]                           dc.w $0002
[000b2792]                           dc.w $0001
[000b2794]                           dc.w $0010
[000b2796]                           dc.w $0009
_29aEDIT_MOUSE:
[000b2798] 000228c4                  dc.l edmo_set
[000b279c]                           dc.w $0000
[000b279e]                           dc.w $0000
[000b27a0]                           dc.w $8000
[000b27a2]                           dc.w $0000
[000b27a4]                           dc.w $0000
[000b27a6]                           dc.w $0000
[000b27a8]                           dc.w $0000
[000b27aa]                           dc.w $0000
[000b27ac]                           dc.w $0008
[000b27ae]                           dc.w $0000
_31_EDIT_MOUSE:
[000b27b0]                           dc.w $0024
[000b27b2]                           dc.w $0020
[000b27b4]                           dc.w $0022
[000b27b6]                           dc.w $0018
[000b27b8]                           dc.w $0040
[000b27ba]                           dc.w $0000
[000b27bc] 000b2294                  dc.l A_INNERFRAME04
[000b27c0]                           dc.w $0015
[000b27c2]                           dc.w $0005
[000b27c4]                           dc.w $001c
[000b27c6]                           dc.w $0005
_32_EDIT_MOUSE:
[000b27c8]                           dc.w $0022
[000b27ca]                           dc.w $0021
[000b27cc]                           dc.w $0021
[000b27ce]                           dc.w $0018
[000b27d0]                           dc.w $0000
[000b27d2]                           dc.w $0010
[000b27d4] 000b21b4                  dc.l A_3DBUTTON05
[000b27d8]                           dc.w $0001
[000b27da]                           dc.w $0001
[000b27dc]                           dc.w $0008
[000b27de]                           dc.w $0003
_33_EDIT_MOUSE:
[000b27e0]                           dc.w $0020
[000b27e2]                           dc.w $ffff
[000b27e4]                           dc.w $ffff
[000b27e6]                           dc.w $001f
[000b27e8]                           dc.w $0000
[000b27ea]                           dc.w $0000
[000b27ec] 000b24a2                  dc.l MOUSEDUMMY
[000b27f0]                           dc.w $0003
[000b27f2]                           dc.w $0001
[000b27f4]                           dc.w $0002
[000b27f6]                           dc.w $0001
_34_EDIT_MOUSE:
[000b27f8]                           dc.w $001f
[000b27fa]                           dc.w $ffff
[000b27fc]                           dc.w $ffff
[000b27fe]                           dc.w $0018
[000b2800]                           dc.w $0040
[000b2802]                           dc.w $0000
[000b2804] 000b2194                  dc.l A_3DBUTTON04
[000b2808]                           dc.w $000b
[000b280a]                           dc.w $0001
[000b280c]                           dc.w $000f
[000b280e]                           dc.w $0002
_34aEDIT_MOUSE:
[000b2810] 00022780                  dc.l edmo_next
[000b2814]                           dc.w $0000
[000b2816]                           dc.w $0000
[000b2818]                           dc.w $8000
[000b281a]                           dc.w $0000
[000b281c]                           dc.w $0000
[000b281e]                           dc.w $0000
[000b2820]                           dc.w $0000
[000b2822]                           dc.w $0000
[000b2824]                           dc.w $0000
[000b2826]                           dc.w $0000
_36_EDIT_MOUSE:
[000b2828]                           dc.w $0026
[000b282a]                           dc.w $ffff
[000b282c]                           dc.w $ffff
[000b282e]                           dc.w $0018
[000b2830]                           dc.w $4007
[000b2832]                           dc.w $0010
[000b2834] 000b2174                  dc.l A_3DBUTTON03
[000b2838]                           dc.w $0016
[000b283a]                           dc.w $000a
[000b283c]                           dc.w $000c
[000b283e]                           dc.w $0002
_36aEDIT_MOUSE:
[000b2840] 00022adc                  dc.l edmo_ok
[000b2844]                           dc.w $0000
[000b2846]                           dc.w $0000
[000b2848]                           dc.w $8000
[000b284a]                           dc.w $884f
[000b284c]                           dc.w $0000
[000b284e]                           dc.w $0000
[000b2850]                           dc.w $0000
[000b2852]                           dc.w $0000
[000b2854]                           dc.w $0000
[000b2856]                           dc.w $0000
_38_EDIT_MOUSE:
[000b2858]                           dc.w $0000
[000b285a]                           dc.w $ffff
[000b285c]                           dc.w $ffff
[000b285e]                           dc.w $0018
[000b2860]                           dc.w $4005
[000b2862]                           dc.w $0010
[000b2864] 000b2154                  dc.l A_3DBUTTON01
[000b2868]                           dc.w $0024
[000b286a]                           dc.w $000a
[000b286c]                           dc.w $000c
[000b286e]                           dc.w $0002
_38aEDIT_MOUSE:
[000b2870] 00022aca                  dc.l edmo_abort
[000b2874]                           dc.w $0000
[000b2876]                           dc.w $0000
[000b2878]                           dc.w $8020
[000b287a]                           dc.w $8841
[000b287c]                           dc.w $0000
[000b287e]                           dc.w $0000
[000b2880]                           dc.w $0000
[000b2882]                           dc.w $0000
[000b2884]                           dc.w $0000
[000b2886]                           dc.w $0000
WI_MOUSE:
[000b2888]                           dc.w $0000
[000b288a]                           dc.w $0000
[000b288c] 00022dca                  dc.l mo_service
[000b2890] 00022d2e                  dc.l mo_make
[000b2894] 00057428                  dc.l Awi_open
[000b2898] 00055e94                  dc.l Awi_init
[000b289c] 000b24c8                  dc.l EDIT_MOUSE
[000b28a0]                           dc.w $0000
[000b28a2]                           dc.w $0000
[000b28a4]                           dc.w $0000
[000b28a6]                           dc.w $0000
[000b28a8]                           dc.w $ffff
[000b28aa]                           dc.w $601f
[000b28ac]                           dc.w $0000
[000b28ae]                           dc.w $0000
[000b28b0]                           dc.w $0063
[000b28b2]                           dc.w $0063
[000b28b4]                           dc.w $0000
[000b28b6]                           dc.w $0000
[000b28b8]                           dc.w $0000
[000b28ba]                           dc.w $0000
[000b28bc]                           dc.w $0000
[000b28be]                           dc.w $0000
[000b28c0]                           dc.w $0000
[000b28c2]                           dc.w $0000
[000b28c4]                           dc.w $ffff
[000b28c6]                           dc.w $ffff
[000b28c8]                           dc.w $ffff
[000b28ca]                           dc.w $ffff
[000b28cc]                           dc.w $0000
[000b28ce]                           dc.w $0000
[000b28d0]                           dc.w $fcf8
[000b28d2] 000b211f                  dc.l TEXT_04
[000b28d6] 000b2106                  dc.l TEXT_002
[000b28da]                           dc.w $2710
[000b28dc]                           dc.w $0100
[000b28de]                           dc.w $0000
[000b28e0]                           dc.w $ffff
[000b28e2] 000b243c                  dc.l IC_MOUSE
[000b28e6]                           dc.w $0000
[000b28e8]                           dc.w $0000
[000b28ea] 0006b744                  dc.l Awi_keys
[000b28ee] 00051852                  dc.l Awi_obchange
[000b28f2] 00051c46                  dc.l Awi_redraw
[000b28f6] 000587a4                  dc.l Awi_topped
[000b28fa] 00058362                  dc.l Awi_closed
[000b28fe] 000587ec                  dc.l Awi_fulled
[000b2902] 0005217c                  dc.l Awi_arrowed
[000b2906] 000524b4                  dc.l Awi_hslid
[000b290a] 0005255e                  dc.l Awi_vslid
[000b290e] 00058bb0                  dc.l Awi_sized
[000b2912] 00058d50                  dc.l Awi_moved
[000b2916] 0005998a                  dc.l Awi_iconify
[000b291a] 00059c6c                  dc.l Awi_uniconify
[000b291e] 0005b5b6                  dc.l Awi_gemscript
[000b2922]                           dc.w $0000
[000b2924]                           dc.w $0000
[000b2926]                           dc.w $0000
[000b2928]                           dc.w $0000
blackim:
[000b292a]                           dc.w $0000
[000b292c]                           dc.w $fe00
[000b292e]                           dc.w $fe00
[000b2930]                           dc.w $fe00
[000b2932]                           dc.w $fe00
[000b2934]                           dc.w $fe00
[000b2936]                           dc.w $fe00
[000b2938]                           dc.w $fe00
black:
[000b293a] 000b292a                  dc.l blackim
[000b293e]                           dc.w $0008
[000b2940]                           dc.w $0008
[000b2942]                           dc.w $0001
[000b2944]                           dc.w $0001
[000b2946]                           dc.w $0001
[000b2948]                           dc.w $0000
[000b294a]                           dc.w $0000
[000b294c]                           dc.w $0000
whiteim:
[000b294e]                           dc.w $0000
[000b2950]                           dc.w $0000
[000b2952]                           dc.w $0000
[000b2954]                           dc.w $0000
[000b2956]                           dc.w $0000
[000b2958]                           dc.w $0000
[000b295a]                           dc.w $0000
[000b295c]                           dc.w $0000
white:
[000b295e] 000b294e                  dc.l whiteim
[000b2962]                           dc.w $0008
[000b2964]                           dc.w $0008
[000b2966]                           dc.w $0001
[000b2968]                           dc.w $0001
[000b296a]                           dc.w $0001
[000b296c]                           dc.w $0000
[000b296e]                           dc.w $0000
[000b2970]                           dc.w $0000
invisiim:
[000b2972]                           dc.w $0000
[000b2974]                           dc.w $aa00
[000b2976]                           dc.w $5400
[000b2978]                           dc.w $aa00
[000b297a]                           dc.w $5400
[000b297c]                           dc.w $aa00
[000b297e]                           dc.w $5400
[000b2980]                           dc.w $aa00
invisible:
[000b2982] 000b2972                  dc.l invisiim
[000b2986]                           dc.w $0008
[000b2988]                           dc.w $0008
[000b298a]                           dc.w $0001
[000b298c]                           dc.w $0001
[000b298e]                           dc.w $0001
[000b2990]                           dc.w $0000
[000b2992]                           dc.w $0000
[000b2994]                           dc.w $0000
color:
[000b2996]                           dc.w $0001
[000b2998]                           dc.w $0000
