edim_col:
[000213f4] 3f03                      move.w     d3,-(a7)
[000213f6] 2f0a                      move.l     a2,-(a7)
[000213f8] 45f9 0010 ee4e            lea.l      ACSblk,a2
[000213fe] 700a                      moveq.l    #10,d0
[00021400] 3f00                      move.w     d0,-(a7)
[00021402] 740b                      moveq.l    #11,d2
[00021404] 7208                      moveq.l    #8,d1
[00021406] 2052                      movea.l    (a2),a0
[00021408] 2268 025c                 movea.l    604(a0),a1
[0002140c] 2069 0054                 movea.l    84(a1),a0
[00021410] 3028 000c                 move.w     12(a0),d0
[00021414] 4eb9 0003 0bde            jsr        oe_colsel
[0002141a] 544f                      addq.w     #2,a7
[0002141c] 3600                      move.w     d0,d3
[0002141e] 6b24                      bmi.s      $00021444
[00021420] 2052                      movea.l    (a2),a0
[00021422] 2268 025c                 movea.l    604(a0),a1
[00021426] 2069 0054                 movea.l    84(a1),a0
[0002142a] 3140 000c                 move.w     d0,12(a0)
[0002142e] 72ff                      moveq.l    #-1,d1
[00021430] 2052                      movea.l    (a2),a0
[00021432] 2068 0258                 movea.l    600(a0),a0
[00021436] 2252                      movea.l    (a2),a1
[00021438] 2269 0258                 movea.l    600(a1),a1
[0002143c] 2269 0066                 movea.l    102(a1),a1
[00021440] 7001                      moveq.l    #1,d0
[00021442] 4e91                      jsr        (a1)
[00021444] 245f                      movea.l    (a7)+,a2
[00021446] 361f                      move.w     (a7)+,d3
[00021448] 4e75                      rts

; start edit2\edimaged.c

edim_thin:
[0002144a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00021450] 2068 025c                 movea.l    604(a0),a0
[00021454] 41e8 0030                 lea.l      48(a0),a0
[00021458] 7008                      moveq.l    #8,d0
[0002145a] 3140 0016                 move.w     d0,22(a0)
[0002145e] 3140 0014                 move.w     d0,20(a0)
[00021462] 72ff                      moveq.l    #-1,d1
[00021464] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002146a] 2068 0258                 movea.l    600(a0),a0
[0002146e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00021474] 2269 0258                 movea.l    600(a1),a1
[00021478] 2269 0066                 movea.l    102(a1),a1
[0002147c] 7001                      moveq.l    #1,d0
[0002147e] 4e91                      jsr        (a1)
[00021480] 4e75                      rts
edim_thick:
[00021482] 2079 0010 ee4e            movea.l    ACSblk,a0
[00021488] 2068 025c                 movea.l    604(a0),a0
[0002148c] 41e8 0030                 lea.l      48(a0),a0
[00021490] 7018                      moveq.l    #24,d0
[00021492] 3140 0016                 move.w     d0,22(a0)
[00021496] 3140 0014                 move.w     d0,20(a0)
[0002149a] 72ff                      moveq.l    #-1,d1
[0002149c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000214a2] 2068 0258                 movea.l    600(a0),a0
[000214a6] 2279 0010 ee4e            movea.l    ACSblk,a1
[000214ac] 2269 0258                 movea.l    600(a1),a1
[000214b0] 2269 0066                 movea.l    102(a1),a1
[000214b4] 7001                      moveq.l    #1,d0
[000214b6] 4e91                      jsr        (a1)
[000214b8] 4e75                      rts
edim_black:
[000214ba] 2079 0010 ee4e            movea.l    ACSblk,a0
[000214c0] 2068 025c                 movea.l    604(a0),a0
[000214c4] 317c 0008 0284            move.w     #$0008,644(a0)
[000214ca] 0268 ff8f 003e            andi.w     #$FF8F,62(a0)
[000214d0] 0068 0070 003e            ori.w      #$0070,62(a0)
[000214d6] 72ff                      moveq.l    #-1,d1
[000214d8] 7001                      moveq.l    #1,d0
[000214da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000214e0] 2068 0258                 movea.l    600(a0),a0
[000214e4] 2279 0010 ee4e            movea.l    ACSblk,a1
[000214ea] 2269 0258                 movea.l    600(a1),a1
[000214ee] 2269 0066                 movea.l    102(a1),a1
[000214f2] 4e91                      jsr        (a1)
[000214f4] 4e75                      rts
edim_white:
[000214f6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000214fc] 2068 025c                 movea.l    604(a0),a0
[00021500] 317c 0009 0284            move.w     #$0009,644(a0)
[00021506] 0268 ff8f 003e            andi.w     #$FF8F,62(a0)
[0002150c] 72ff                      moveq.l    #-1,d1
[0002150e] 7001                      moveq.l    #1,d0
[00021510] 2079 0010 ee4e            movea.l    ACSblk,a0
[00021516] 2068 0258                 movea.l    600(a0),a0
[0002151a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00021520] 2269 0258                 movea.l    600(a1),a1
[00021524] 2269 0066                 movea.l    102(a1),a1
[00021528] 4e91                      jsr        (a1)
[0002152a] 4e75                      rts
edim_nextpattern:
[0002152c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00021532] 2268 025c                 movea.l    604(a0),a1
[00021536] 2069 0024                 movea.l    36(a1),a0
[0002153a] 5848                      addq.w     #4,a0
[0002153c] 3028 0002                 move.w     2(a0),d0
[00021540] d07c 0010                 add.w      #$0010,d0
[00021544] c07c 0070                 and.w      #$0070,d0
[00021548] 0268 ff8f 0002            andi.w     #$FF8F,2(a0)
[0002154e] 8168 0002                 or.w       d0,2(a0)
[00021552] 72ff                      moveq.l    #-1,d1
[00021554] 7001                      moveq.l    #1,d0
[00021556] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002155c] 2068 0258                 movea.l    600(a0),a0
[00021560] 2279 0010 ee4e            movea.l    ACSblk,a1
[00021566] 2269 0258                 movea.l    600(a1),a1
[0002156a] 2269 0066                 movea.l    102(a1),a1
[0002156e] 4e91                      jsr        (a1)
[00021570] 4e75                      rts
edim_up:
[00021572] 2f03                      move.l     d3,-(a7)
[00021574] 2f0a                      move.l     a2,-(a7)
[00021576] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002157c] 2268 0258                 movea.l    600(a0),a1
[00021580] 2051                      movea.l    (a1),a0
[00021582] 2268 0008                 movea.l    8(a0),a1
[00021586] 2269 0054                 movea.l    84(a1),a1
[0002158a] 3029 0004                 move.w     4(a1),d0
[0002158e] e240                      asr.w      #1,d0
[00021590] 3200                      move.w     d0,d1
[00021592] c3e9 0006                 muls.w     6(a1),d1
[00021596] 2268 0010                 movea.l    16(a0),a1
[0002159a] 3400                      move.w     d0,d2
[0002159c] 48c2                      ext.l      d2
[0002159e] d482                      add.l      d2,d2
[000215a0] 45f1 2800                 lea.l      0(a1,d2.l),a2
[000215a4] 3401                      move.w     d1,d2
[000215a6] 9440                      sub.w      d0,d2
[000215a8] 6004                      bra.s      $000215AE
[000215aa] 32da                      move.w     (a2)+,(a1)+
[000215ac] 5342                      subq.w     #1,d2
[000215ae] 4a42                      tst.w      d2
[000215b0] 6ef8                      bgt.s      $000215AA
[000215b2] 3601                      move.w     d1,d3
[000215b4] 48c3                      ext.l      d3
[000215b6] d683                      add.l      d3,d3
[000215b8] 2268 0010                 movea.l    16(a0),a1
[000215bc] 43f1 38fe                 lea.l      -2(a1,d3.l),a1
[000215c0] 3400                      move.w     d0,d2
[000215c2] 6006                      bra.s      $000215CA
[000215c4] 4251                      clr.w      (a1)
[000215c6] 5549                      subq.w     #2,a1
[000215c8] 5342                      subq.w     #1,d2
[000215ca] 4a42                      tst.w      d2
[000215cc] 6ef6                      bgt.s      $000215C4
[000215ce] 72ff                      moveq.l    #-1,d1
[000215d0] 7019                      moveq.l    #25,d0
[000215d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000215d8] 2068 0258                 movea.l    600(a0),a0
[000215dc] 2279 0010 ee4e            movea.l    ACSblk,a1
[000215e2] 2469 0258                 movea.l    600(a1),a2
[000215e6] 226a 0066                 movea.l    102(a2),a1
[000215ea] 4e91                      jsr        (a1)
[000215ec] 245f                      movea.l    (a7)+,a2
[000215ee] 261f                      move.l     (a7)+,d3
[000215f0] 4e75                      rts
edim_down:
[000215f2] 2f0a                      move.l     a2,-(a7)
[000215f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000215fa] 2268 0258                 movea.l    600(a0),a1
[000215fe] 2051                      movea.l    (a1),a0
[00021600] 2268 0008                 movea.l    8(a0),a1
[00021604] 2269 0054                 movea.l    84(a1),a1
[00021608] 3029 0004                 move.w     4(a1),d0
[0002160c] e240                      asr.w      #1,d0
[0002160e] 3200                      move.w     d0,d1
[00021610] c3e9 0006                 muls.w     6(a1),d1
[00021614] 3401                      move.w     d1,d2
[00021616] 48c2                      ext.l      d2
[00021618] d482                      add.l      d2,d2
[0002161a] 2268 0010                 movea.l    16(a0),a1
[0002161e] 43f1 28fe                 lea.l      -2(a1,d2.l),a1
[00021622] 2449                      movea.l    a1,a2
[00021624] 3400                      move.w     d0,d2
[00021626] 48c2                      ext.l      d2
[00021628] d482                      add.l      d2,d2
[0002162a] 95c2                      suba.l     d2,a2
[0002162c] 9240                      sub.w      d0,d1
[0002162e] 6008                      bra.s      $00021638
[00021630] 3292                      move.w     (a2),(a1)
[00021632] 554a                      subq.w     #2,a2
[00021634] 5549                      subq.w     #2,a1
[00021636] 5341                      subq.w     #1,d1
[00021638] 4a41                      tst.w      d1
[0002163a] 6ef4                      bgt.s      $00021630
[0002163c] 2268 0010                 movea.l    16(a0),a1
[00021640] 3200                      move.w     d0,d1
[00021642] 6004                      bra.s      $00021648
[00021644] 4259                      clr.w      (a1)+
[00021646] 5341                      subq.w     #1,d1
[00021648] 4a41                      tst.w      d1
[0002164a] 6ef8                      bgt.s      $00021644
[0002164c] 72ff                      moveq.l    #-1,d1
[0002164e] 7019                      moveq.l    #25,d0
[00021650] 2079 0010 ee4e            movea.l    ACSblk,a0
[00021656] 2068 0258                 movea.l    600(a0),a0
[0002165a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00021660] 2469 0258                 movea.l    600(a1),a2
[00021664] 226a 0066                 movea.l    102(a2),a1
[00021668] 4e91                      jsr        (a1)
[0002166a] 245f                      movea.l    (a7)+,a2
[0002166c] 4e75                      rts
edim_right:
[0002166e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00021674] 2268 0258                 movea.l    600(a0),a1
[00021678] 2051                      movea.l    (a1),a0
[0002167a] 2268 0008                 movea.l    8(a0),a1
[0002167e] 2269 0054                 movea.l    84(a1),a1
[00021682] 3229 0004                 move.w     4(a1),d1
[00021686] e241                      asr.w      #1,d1
[00021688] 3001                      move.w     d1,d0
[0002168a] c1e9 0006                 muls.w     6(a1),d0
[0002168e] 3200                      move.w     d0,d1
[00021690] 2268 0010                 movea.l    16(a0),a1
[00021694] 4240                      clr.w      d0
[00021696] 601e                      bra.s      $000216B6
[00021698] 7401                      moveq.l    #1,d2
[0002169a] c440                      and.w      d0,d2
[0002169c] 670e                      beq.s      $000216AC
[0002169e] 3011                      move.w     (a1),d0
[000216a0] 3400                      move.w     d0,d2
[000216a2] e24a                      lsr.w      #1,d2
[000216a4] 847c 8000                 or.w       #$8000,d2
[000216a8] 32c2                      move.w     d2,(a1)+
[000216aa] 6008                      bra.s      $000216B4
[000216ac] 3011                      move.w     (a1),d0
[000216ae] 3400                      move.w     d0,d2
[000216b0] e24a                      lsr.w      #1,d2
[000216b2] 32c2                      move.w     d2,(a1)+
[000216b4] 5341                      subq.w     #1,d1
[000216b6] 4a41                      tst.w      d1
[000216b8] 6ede                      bgt.s      $00021698
[000216ba] 72ff                      moveq.l    #-1,d1
[000216bc] 7019                      moveq.l    #25,d0
[000216be] 2079 0010 ee4e            movea.l    ACSblk,a0
[000216c4] 2068 0258                 movea.l    600(a0),a0
[000216c8] 2279 0010 ee4e            movea.l    ACSblk,a1
[000216ce] 2269 0258                 movea.l    600(a1),a1
[000216d2] 2269 0066                 movea.l    102(a1),a1
[000216d6] 4e91                      jsr        (a1)
[000216d8] 4e75                      rts
edim_left:
[000216da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000216e0] 2268 0258                 movea.l    600(a0),a1
[000216e4] 2051                      movea.l    (a1),a0
[000216e6] 2268 0008                 movea.l    8(a0),a1
[000216ea] 2269 0054                 movea.l    84(a1),a1
[000216ee] 3229 0004                 move.w     4(a1),d1
[000216f2] e241                      asr.w      #1,d1
[000216f4] 3001                      move.w     d1,d0
[000216f6] c1e9 0006                 muls.w     6(a1),d0
[000216fa] 3200                      move.w     d0,d1
[000216fc] 48c0                      ext.l      d0
[000216fe] d080                      add.l      d0,d0
[00021700] 2268 0010                 movea.l    16(a0),a1
[00021704] 43f1 08fe                 lea.l      -2(a1,d0.l),a1
[00021708] 4240                      clr.w      d0
[0002170a] 6024                      bra.s      $00021730
[0002170c] 343c 8000                 move.w     #$8000,d2
[00021710] c440                      and.w      d0,d2
[00021712] 6710                      beq.s      $00021724
[00021714] 3011                      move.w     (a1),d0
[00021716] 3400                      move.w     d0,d2
[00021718] d442                      add.w      d2,d2
[0002171a] 847c 0001                 or.w       #$0001,d2
[0002171e] 3282                      move.w     d2,(a1)
[00021720] 5549                      subq.w     #2,a1
[00021722] 600a                      bra.s      $0002172E
[00021724] 3011                      move.w     (a1),d0
[00021726] 3400                      move.w     d0,d2
[00021728] d442                      add.w      d2,d2
[0002172a] 3282                      move.w     d2,(a1)
[0002172c] 5549                      subq.w     #2,a1
[0002172e] 5341                      subq.w     #1,d1
[00021730] 4a41                      tst.w      d1
[00021732] 6ed8                      bgt.s      $0002170C
[00021734] 72ff                      moveq.l    #-1,d1
[00021736] 7019                      moveq.l    #25,d0
[00021738] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002173e] 2068 0258                 movea.l    600(a0),a0
[00021742] 2279 0010 ee4e            movea.l    ACSblk,a1
[00021748] 2269 0258                 movea.l    600(a1),a1
[0002174c] 2269 0066                 movea.l    102(a1),a1
[00021750] 4e91                      jsr        (a1)
[00021752] 4e75                      rts
edim_resize:
[00021754] 48e7 1f30                 movem.l    d3-d7/a2-a3,-(a7)
[00021758] 594f                      subq.w     #4,a7
[0002175a] 3f40 0002                 move.w     d0,2(a7)
[0002175e] 3e81                      move.w     d1,(a7)
[00021760] 740f                      moveq.l    #15,d2
[00021762] d440                      add.w      d0,d2
[00021764] c47c fff0                 and.w      #$FFF0,d2
[00021768] 3f42 0002                 move.w     d2,2(a7)
[0002176c] 3429 0004                 move.w     4(a1),d2
[00021770] e242                      asr.w      #1,d2
[00021772] 362f 0002                 move.w     2(a7),d3
[00021776] e843                      asr.w      #4,d3
[00021778] b443                      cmp.w      d3,d2
[0002177a] 6c54                      bge.s      $000217D0
[0002177c] 78ff                      moveq.l    #-1,d4
[0002177e] d869 0006                 add.w      6(a1),d4
[00021782] 6048                      bra.s      $000217CC
[00021784] 3a04                      move.w     d4,d5
[00021786] cbc2                      muls.w     d2,d5
[00021788] 3204                      move.w     d4,d1
[0002178a] c3c3                      muls.w     d3,d1
[0002178c] 70ff                      moveq.l    #-1,d0
[0002178e] d042                      add.w      d2,d0
[00021790] 601c                      bra.s      $000217AE
[00021792] 3c05                      move.w     d5,d6
[00021794] dc40                      add.w      d0,d6
[00021796] 48c6                      ext.l      d6
[00021798] dc86                      add.l      d6,d6
[0002179a] 2451                      movea.l    (a1),a2
[0002179c] 3e01                      move.w     d1,d7
[0002179e] de40                      add.w      d0,d7
[000217a0] 48c7                      ext.l      d7
[000217a2] de87                      add.l      d7,d7
[000217a4] 2651                      movea.l    (a1),a3
[000217a6] 37b2 6800 7800            move.w     0(a2,d6.l),0(a3,d7.l)
[000217ac] 5340                      subq.w     #1,d0
[000217ae] 4a40                      tst.w      d0
[000217b0] 6ae0                      bpl.s      $00021792
[000217b2] 3002                      move.w     d2,d0
[000217b4] 6010                      bra.s      $000217C6
[000217b6] 3c01                      move.w     d1,d6
[000217b8] dc40                      add.w      d0,d6
[000217ba] 48c6                      ext.l      d6
[000217bc] dc86                      add.l      d6,d6
[000217be] 2451                      movea.l    (a1),a2
[000217c0] 4272 6800                 clr.w      0(a2,d6.l)
[000217c4] 5240                      addq.w     #1,d0
[000217c6] b640                      cmp.w      d0,d3
[000217c8] 6eec                      bgt.s      $000217B6
[000217ca] 5344                      subq.w     #1,d4
[000217cc] 4a44                      tst.w      d4
[000217ce] 6ab4                      bpl.s      $00021784
[000217d0] b443                      cmp.w      d3,d2
[000217d2] 6f38                      ble.s      $0002180C
[000217d4] 4244                      clr.w      d4
[000217d6] 602e                      bra.s      $00021806
[000217d8] 3a04                      move.w     d4,d5
[000217da] cbc2                      muls.w     d2,d5
[000217dc] 3204                      move.w     d4,d1
[000217de] c3c3                      muls.w     d3,d1
[000217e0] 4240                      clr.w      d0
[000217e2] 601c                      bra.s      $00021800
[000217e4] 3c05                      move.w     d5,d6
[000217e6] dc40                      add.w      d0,d6
[000217e8] 48c6                      ext.l      d6
[000217ea] dc86                      add.l      d6,d6
[000217ec] 2451                      movea.l    (a1),a2
[000217ee] 3e01                      move.w     d1,d7
[000217f0] de40                      add.w      d0,d7
[000217f2] 48c7                      ext.l      d7
[000217f4] de87                      add.l      d7,d7
[000217f6] 2651                      movea.l    (a1),a3
[000217f8] 37b2 6800 7800            move.w     0(a2,d6.l),0(a3,d7.l)
[000217fe] 5240                      addq.w     #1,d0
[00021800] b640                      cmp.w      d0,d3
[00021802] 6ee0                      bgt.s      $000217E4
[00021804] 5244                      addq.w     #1,d4
[00021806] b869 0006                 cmp.w      6(a1),d4
[0002180a] 6dcc                      blt.s      $000217D8
[0002180c] 78ff                      moveq.l    #-1,d4
[0002180e] d857                      add.w      (a7),d4
[00021810] 6020                      bra.s      $00021832
[00021812] 3204                      move.w     d4,d1
[00021814] c3c3                      muls.w     d3,d1
[00021816] 70ff                      moveq.l    #-1,d0
[00021818] d043                      add.w      d3,d0
[0002181a] 6010                      bra.s      $0002182C
[0002181c] 3401                      move.w     d1,d2
[0002181e] d440                      add.w      d0,d2
[00021820] 48c2                      ext.l      d2
[00021822] d482                      add.l      d2,d2
[00021824] 2451                      movea.l    (a1),a2
[00021826] 4272 2800                 clr.w      0(a2,d2.l)
[0002182a] 5340                      subq.w     #1,d0
[0002182c] 4a40                      tst.w      d0
[0002182e] 6aec                      bpl.s      $0002181C
[00021830] 5344                      subq.w     #1,d4
[00021832] b869 0006                 cmp.w      6(a1),d4
[00021836] 6cda                      bge.s      $00021812
[00021838] 316f 0002 008c            move.w     2(a7),140(a0)
[0002183e] 302f 0002                 move.w     2(a7),d0
[00021842] e640                      asr.w      #3,d0
[00021844] 3340 0004                 move.w     d0,4(a1)
[00021848] 3217                      move.w     (a7),d1
[0002184a] 3341 0006                 move.w     d1,6(a1)
[0002184e] 3141 008e                 move.w     d1,142(a0)
[00021852] 584f                      addq.w     #4,a7
[00021854] 4cdf 0cf8                 movem.l    (a7)+,d3-d7/a2-a3
[00021858] 4e75                      rts
edim_direct:
[0002185a] 48e7 002c                 movem.l    a2/a4-a5,-(a7)
[0002185e] 594f                      subq.w     #4,a7
[00021860] 41f9 000b 1e00            lea.l      WI_IMPOS,a0
[00021866] 2279 000b 1e08            movea.l    $000B1E08,a1
[0002186c] 4e91                      jsr        (a1)
[0002186e] 2448                      movea.l    a0,a2
[00021870] 200a                      move.l     a2,d0
[00021872] 6700 00fe                 beq        $00021972
[00021876] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002187c] 2069 025c                 movea.l    604(a1),a0
[00021880] 2868 0054                 movea.l    84(a0),a4
[00021884] 322c 0004                 move.w     4(a4),d1
[00021888] e749                      lsl.w      #3,d1
[0002188a] 3f01                      move.w     d1,-(a7)
[0002188c] 43f9 000b 20fa            lea.l      $000B20FA,a1
[00021892] 206a 0014                 movea.l    20(a2),a0
[00021896] 7009                      moveq.l    #9,d0
[00021898] 4eb9 0005 0f94            jsr        Aob_printf
[0002189e] 544f                      addq.w     #2,a7
[000218a0] 3f2c 0006                 move.w     6(a4),-(a7)
[000218a4] 43f9 000b 20fa            lea.l      $000B20FA,a1
[000218aa] 7003                      moveq.l    #3,d0
[000218ac] 206a 0014                 movea.l    20(a2),a0
[000218b0] 4eb9 0005 0f94            jsr        Aob_printf
[000218b6] 544f                      addq.w     #2,a7
[000218b8] 204a                      movea.l    a2,a0
[000218ba] 4eb9 0005 9df4            jsr        Awi_dialog
[000218c0] 5940                      subq.w     #4,d0
[000218c2] 6600 00a6                 bne        $0002196A
[000218c6] 4bef 0002                 lea.l      2(a7),a5
[000218ca] 4855                      pea.l      (a5)
[000218cc] 43f9 000b 20fa            lea.l      $000B20FA,a1
[000218d2] 7009                      moveq.l    #9,d0
[000218d4] 206a 0014                 movea.l    20(a2),a0
[000218d8] 4eb9 0005 10fe            jsr        Aob_scanf
[000218de] 584f                      addq.w     #4,a7
[000218e0] 4857                      pea.l      (a7)
[000218e2] 43f9 000b 20fa            lea.l      $000B20FA,a1
[000218e8] 7003                      moveq.l    #3,d0
[000218ea] 206a 0014                 movea.l    20(a2),a0
[000218ee] 4eb9 0005 10fe            jsr        Aob_scanf
[000218f4] 584f                      addq.w     #4,a7
[000218f6] 0c55 00c0                 cmpi.w     #$00C0,(a5)
[000218fa] 6f04                      ble.s      $00021900
[000218fc] 3abc 00c0                 move.w     #$00C0,(a5)
[00021900] 0c57 00c0                 cmpi.w     #$00C0,(a7)
[00021904] 6f04                      ble.s      $0002190A
[00021906] 3ebc 00c0                 move.w     #$00C0,(a7)
[0002190a] 700f                      moveq.l    #15,d0
[0002190c] d055                      add.w      (a5),d0
[0002190e] c07c fff0                 and.w      #$FFF0,d0
[00021912] 3a80                      move.w     d0,(a5)
[00021914] 72ff                      moveq.l    #-1,d1
[00021916] d279 0008 4808            add.w      imagesnap,d1
[0002191c] e241                      asr.w      #1,d1
[0002191e] d257                      add.w      (a7),d1
[00021920] 3439 0008 4808            move.w     imagesnap,d2
[00021926] 4442                      neg.w      d2
[00021928] c242                      and.w      d2,d1
[0002192a] 3e81                      move.w     d1,(a7)
[0002192c] 224c                      movea.l    a4,a1
[0002192e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00021934] 2068 025c                 movea.l    604(a0),a0
[00021938] 6100 fe1a                 bsr        edim_resize
[0002193c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00021942] 2268 025c                 movea.l    604(a0),a1
[00021946] 0069 0080 0080            ori.w      #$0080,128(a1)
[0002194c] 72ff                      moveq.l    #-1,d1
[0002194e] 7001                      moveq.l    #1,d0
[00021950] 2079 0010 ee4e            movea.l    ACSblk,a0
[00021956] 2068 0258                 movea.l    600(a0),a0
[0002195a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00021960] 2869 0258                 movea.l    600(a1),a4
[00021964] 226c 0066                 movea.l    102(a4),a1
[00021968] 4e91                      jsr        (a1)
[0002196a] 204a                      movea.l    a2,a0
[0002196c] 4eb9 0005 85f2            jsr        Awi_delete
[00021972] 584f                      addq.w     #4,a7
[00021974] 4cdf 3400                 movem.l    (a7)+,a2/a4-a5
[00021978] 4e75                      rts
control:
[0002197a] 343c 0080                 move.w     #$0080,d2
[0002197e] c468 0080                 and.w      128(a0),d2
[00021982] 6626                      bne.s      $000219AA
[00021984] 3428 0088                 move.w     136(a0),d2
[00021988] b451                      cmp.w      (a1),d2
[0002198a] 661e                      bne.s      $000219AA
[0002198c] 3428 008a                 move.w     138(a0),d2
[00021990] b469 0002                 cmp.w      2(a1),d2
[00021994] 6614                      bne.s      $000219AA
[00021996] 3428 008c                 move.w     140(a0),d2
[0002199a] b469 0004                 cmp.w      4(a1),d2
[0002199e] 660a                      bne.s      $000219AA
[000219a0] 3428 008e                 move.w     142(a0),d2
[000219a4] b469 0006                 cmp.w      6(a1),d2
[000219a8] 6720                      beq.s      $000219CA
[000219aa] 0268 ff7f 0080            andi.w     #$FF7F,128(a0)
[000219b0] 3151 0088                 move.w     (a1),136(a0)
[000219b4] 3169 0002 008a            move.w     2(a1),138(a0)
[000219ba] 3169 0004 008c            move.w     4(a1),140(a0)
[000219c0] 3169 0006 008e            move.w     6(a1),142(a0)
[000219c6] 4240                      clr.w      d0
[000219c8] 4e75                      rts
[000219ca] 3411                      move.w     (a1),d2
[000219cc] d469 0004                 add.w      4(a1),d2
[000219d0] 5342                      subq.w     #1,d2
[000219d2] 9440                      sub.w      d0,d2
[000219d4] 3002                      move.w     d2,d0
[000219d6] 3429 0002                 move.w     2(a1),d2
[000219da] d469 0006                 add.w      6(a1),d2
[000219de] 5342                      subq.w     #1,d2
[000219e0] 9441                      sub.w      d1,d2
[000219e2] 3202                      move.w     d2,d1
[000219e4] b07c 0008                 cmp.w      #$0008,d0
[000219e8] 6f0a                      ble.s      $000219F4
[000219ea] 3429 0004                 move.w     4(a1),d2
[000219ee] e642                      asr.w      #3,d2
[000219f0] b042                      cmp.w      d2,d0
[000219f2] 6e10                      bgt.s      $00021A04
[000219f4] b27c 0008                 cmp.w      #$0008,d1
[000219f8] 6f0e                      ble.s      $00021A08
[000219fa] 3029 0006                 move.w     6(a1),d0
[000219fe] e640                      asr.w      #3,d0
[00021a00] b240                      cmp.w      d0,d1
[00021a02] 6f04                      ble.s      $00021A08
[00021a04] 7001                      moveq.l    #1,d0
[00021a06] 4e75                      rts
[00021a08] 7002                      moveq.l    #2,d0
[00021a0a] 4e75                      rts
edim_control:
[00021a0c] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[00021a10] 4fef fff0                 lea.l      -16(a7),a7
[00021a14] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00021a1a] 2052                      movea.l    (a2),a0
[00021a1c] 2868 0258                 movea.l    600(a0),a4
[00021a20] 266c 0014                 movea.l    20(a4),a3
[00021a24] 3628 0260                 move.w     608(a0),d3
[00021a28] 3203                      move.w     d3,d1
[00021a2a] 48c1                      ext.l      d1
[00021a2c] 2001                      move.l     d1,d0
[00021a2e] d080                      add.l      d0,d0
[00021a30] d081                      add.l      d1,d0
[00021a32] e788                      lsl.l      #3,d0
[00021a34] 3433 080a                 move.w     10(a3,d0.l),d2
[00021a38] c47c 4000                 and.w      #$4000,d2
[00021a3c] 670a                      beq.s      $00021A48
[00021a3e] 4eb9 0002 2214            jsr        edim_edit
[00021a44] 6000 012a                 bra        $00021B70
[00021a48] 2052                      movea.l    (a2),a0
[00021a4a] 3c28 0262                 move.w     610(a0),d6
[00021a4e] 3e28 0264                 move.w     612(a0),d7
[00021a52] 2f39 000e 692a            move.l     _globl,-(a7)
[00021a58] 486f 0004                 pea.l      4(a7)
[00021a5c] 43ef 000a                 lea.l      10(a7),a1
[00021a60] 3003                      move.w     d3,d0
[00021a62] 204b                      movea.l    a3,a0
[00021a64] 4eb9 0007 9d14            jsr        mt_objc_offset
[00021a6a] 504f                      addq.w     #8,a7
[00021a6c] 302c 0034                 move.w     52(a4),d0
[00021a70] d16f 0002                 add.w      d0,2(a7)
[00021a74] 322c 0036                 move.w     54(a4),d1
[00021a78] d357                      add.w      d1,(a7)
[00021a7a] 3003                      move.w     d3,d0
[00021a7c] 48c0                      ext.l      d0
[00021a7e] 2400                      move.l     d0,d2
[00021a80] d482                      add.l      d2,d2
[00021a82] d480                      add.l      d0,d2
[00021a84] e78a                      lsl.l      #3,d2
[00021a86] 3833 2814                 move.w     20(a3,d2.l),d4
[00021a8a] 3a33 2816                 move.w     22(a3,d2.l),d5
[00021a8e] b87c 00c0                 cmp.w      #$00C0,d4
[00021a92] 6f04                      ble.s      $00021A98
[00021a94] 383c 00c0                 move.w     #$00C0,d4
[00021a98] ba7c 00c0                 cmp.w      #$00C0,d5
[00021a9c] 6f04                      ble.s      $00021AA2
[00021a9e] 3a3c 00c0                 move.w     #$00C0,d5
[00021aa2] 9c6f 0002                 sub.w      2(a7),d6
[00021aa6] 9e57                      sub.w      (a7),d7
[00021aa8] 3203                      move.w     d3,d1
[00021aaa] 48c1                      ext.l      d1
[00021aac] 2001                      move.l     d1,d0
[00021aae] d080                      add.l      d0,d0
[00021ab0] d081                      add.l      d1,d0
[00021ab2] e788                      lsl.l      #3,d0
[00021ab4] 2873 080c                 movea.l    12(a3,d0.l),a4
[00021ab8] 4bef 0008                 lea.l      8(a7),a5
[00021abc] 3aac 0008                 move.w     8(a4),(a5)
[00021ac0] 3b6c 000a 0002            move.w     10(a4),2(a5)
[00021ac6] 302c 0004                 move.w     4(a4),d0
[00021aca] e748                      lsl.w      #3,d0
[00021acc] 3b40 0004                 move.w     d0,4(a5)
[00021ad0] 3b6c 0006 0006            move.w     6(a4),6(a5)
[00021ad6] 3207                      move.w     d7,d1
[00021ad8] 204d                      movea.l    a5,a0
[00021ada] 3006                      move.w     d6,d0
[00021adc] 4eb9 0006 b7a6            jsr        Aob_within
[00021ae2] 4a40                      tst.w      d0
[00021ae4] 6764                      beq.s      $00021B4A
[00021ae6] 3207                      move.w     d7,d1
[00021ae8] 3006                      move.w     d6,d0
[00021aea] 224d                      movea.l    a5,a1
[00021aec] 204b                      movea.l    a3,a0
[00021aee] 6100 fe8a                 bsr        control
[00021af2] 5340                      subq.w     #1,d0
[00021af4] 6700 007a                 beq.w      $00021B70
[00021af8] 5340                      subq.w     #1,d0
[00021afa] 6702                      beq.s      $00021AFE
[00021afc] 605c                      bra.s      $00021B5A
[00021afe] 3005                      move.w     d5,d0
[00021b00] 906c 000a                 sub.w      10(a4),d0
[00021b04] 3f00                      move.w     d0,-(a7)
[00021b06] 3204                      move.w     d4,d1
[00021b08] 926c 0008                 sub.w      8(a4),d1
[00021b0c] 3f01                      move.w     d1,-(a7)
[00021b0e] 7408                      moveq.l    #8,d2
[00021b10] 3f02                      move.w     d2,-(a7)
[00021b12] 43ef 000a                 lea.l      10(a7),a1
[00021b16] 41ef 000c                 lea.l      12(a7),a0
[00021b1a] 322f 0006                 move.w     6(a7),d1
[00021b1e] d26c 000a                 add.w      10(a4),d1
[00021b22] 302f 0008                 move.w     8(a7),d0
[00021b26] d06c 0008                 add.w      8(a4),d0
[00021b2a] 7410                      moveq.l    #16,d2
[00021b2c] 4eb9 0001 596a            jsr        A_rubberbox
[00021b32] 5c4f                      addq.w     #6,a7
[00021b34] 4a40                      tst.w      d0
[00021b36] 6722                      beq.s      $00021B5A
[00021b38] 322f 0004                 move.w     4(a7),d1
[00021b3c] 302f 0006                 move.w     6(a7),d0
[00021b40] 224c                      movea.l    a4,a1
[00021b42] 204b                      movea.l    a3,a0
[00021b44] 6100 fc0e                 bsr        edim_resize
[00021b48] 6010                      bra.s      $00021B5A
[00021b4a] 303c 0080                 move.w     #$0080,d0
[00021b4e] c06b 0080                 and.w      128(a3),d0
[00021b52] 661c                      bne.s      $00021B70
[00021b54] 006b 0080 0080            ori.w      #$0080,128(a3)
[00021b5a] 72ff                      moveq.l    #-1,d1
[00021b5c] 7001                      moveq.l    #1,d0
[00021b5e] 2052                      movea.l    (a2),a0
[00021b60] 2068 0258                 movea.l    600(a0),a0
[00021b64] 2252                      movea.l    (a2),a1
[00021b66] 2669 0258                 movea.l    600(a1),a3
[00021b6a] 226b 0066                 movea.l    102(a3),a1
[00021b6e] 4e91                      jsr        (a1)
[00021b70] 4fef 0010                 lea.l      16(a7),a7
[00021b74] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[00021b78] 4e75                      rts
edim_set:
[00021b7a] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[00021b7e] 4fef ffe4                 lea.l      -28(a7),a7
[00021b82] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00021b88] 2053                      movea.l    (a3),a0
[00021b8a] 2468 0258                 movea.l    600(a0),a2
[00021b8e] 2eaa 0014                 move.l     20(a2),(a7)
[00021b92] 3f68 0262 0016            move.w     610(a0),22(a7)
[00021b98] 49ef 0014                 lea.l      20(a7),a4
[00021b9c] 2053                      movea.l    (a3),a0
[00021b9e] 38a8 0264                 move.w     612(a0),(a4)
[00021ba2] 3628 0260                 move.w     608(a0),d3
[00021ba6] 3203                      move.w     d3,d1
[00021ba8] 48c1                      ext.l      d1
[00021baa] 2001                      move.l     d1,d0
[00021bac] d080                      add.l      d0,d0
[00021bae] d081                      add.l      d1,d0
[00021bb0] e788                      lsl.l      #3,d0
[00021bb2] 2257                      movea.l    (a7),a1
[00021bb4] 3431 080a                 move.w     10(a1,d0.l),d2
[00021bb8] c47c 4000                 and.w      #$4000,d2
[00021bbc] 6720                      beq.s      $00021BDE
[00021bbe] 3029 0284                 move.w     644(a1),d0
[00021bc2] 5140                      subq.w     #8,d0
[00021bc4] 6708                      beq.s      $00021BCE
[00021bc6] 5340                      subq.w     #1,d0
[00021bc8] 670c                      beq.s      $00021BD6
[00021bca] 6000 0258                 bra        $00021E24
[00021bce] 6100 f926                 bsr        edim_white
[00021bd2] 6000 0250                 bra        $00021E24
[00021bd6] 6100 f8e2                 bsr        edim_black
[00021bda] 6000 0248                 bra        $00021E24
[00021bde] 2f39 000e 692a            move.l     _globl,-(a7)
[00021be4] 486f 0014                 pea.l      20(a7)
[00021be8] 43ef 001a                 lea.l      26(a7),a1
[00021bec] 3003                      move.w     d3,d0
[00021bee] 206a 0014                 movea.l    20(a2),a0
[00021bf2] 4eb9 0007 9d14            jsr        mt_objc_offset
[00021bf8] 504f                      addq.w     #8,a7
[00021bfa] 302f 0016                 move.w     22(a7),d0
[00021bfe] 906a 0034                 sub.w      52(a2),d0
[00021c02] 906f 0012                 sub.w      18(a7),d0
[00021c06] 48c0                      ext.l      d0
[00021c08] 81fc 0008                 divs.w     #$0008,d0
[00021c0c] 3f40 0016                 move.w     d0,22(a7)
[00021c10] 3214                      move.w     (a4),d1
[00021c12] 926a 0036                 sub.w      54(a2),d1
[00021c16] 926f 0010                 sub.w      16(a7),d1
[00021c1a] 48c1                      ext.l      d1
[00021c1c] 83fc 0008                 divs.w     #$0008,d1
[00021c20] 3881                      move.w     d1,(a4)
[00021c22] e748                      lsl.w      #3,d0
[00021c24] d06a 0034                 add.w      52(a2),d0
[00021c28] d06f 0012                 add.w      18(a7),d0
[00021c2c] 3f40 0008                 move.w     d0,8(a7)
[00021c30] e749                      lsl.w      #3,d1
[00021c32] d26a 0036                 add.w      54(a2),d1
[00021c36] d26f 0010                 add.w      16(a7),d1
[00021c3a] 3f41 000a                 move.w     d1,10(a7)
[00021c3e] 7408                      moveq.l    #8,d2
[00021c40] 3f42 000e                 move.w     d2,14(a7)
[00021c44] 3f42 000c                 move.w     d2,12(a7)
[00021c48] 2652                      movea.l    (a2),a3
[00021c4a] 206b 0008                 movea.l    8(a3),a0
[00021c4e] 2f68 0054 0018            move.l     84(a0),24(a7)
[00021c54] 226f 0018                 movea.l    24(a7),a1
[00021c58] 3029 0004                 move.w     4(a1),d0
[00021c5c] e240                      asr.w      #1,d0
[00021c5e] 72ff                      moveq.l    #-1,d1
[00021c60] d269 0006                 add.w      6(a1),d1
[00021c64] 3400                      move.w     d0,d2
[00021c66] c5d4                      muls.w     (a4),d2
[00021c68] 382f 0016                 move.w     22(a7),d4
[00021c6c] e844                      asr.w      #4,d4
[00021c6e] d444                      add.w      d4,d2
[00021c70] 3802                      move.w     d2,d4
[00021c72] 48c4                      ext.l      d4
[00021c74] d884                      add.l      d4,d4
[00021c76] 2a6b 0010                 movea.l    16(a3),a5
[00021c7a] dbc4                      adda.l     d4,a5
[00021c7c] 740f                      moveq.l    #15,d2
[00021c7e] 780f                      moveq.l    #15,d4
[00021c80] c86f 0016                 and.w      22(a7),d4
[00021c84] 9444                      sub.w      d4,d2
[00021c86] 206b 000c                 movea.l    12(a3),a0
[00021c8a] 0c68 0008 0044            cmpi.w     #$0008,68(a0)
[00021c90] 663a                      bne.s      $00021CCC
[00021c92] 7601                      moveq.l    #1,d3
[00021c94] e56b                      lsl.w      d2,d3
[00021c96] 3828 003e                 move.w     62(a0),d4
[00021c9a] e84c                      lsr.w      #4,d4
[00021c9c] c87c 0007                 and.w      #$0007,d4
[00021ca0] 4a44                      tst.w      d4
[00021ca2] 6716                      beq.s      $00021CBA
[00021ca4] 5f44                      subq.w     #7,d4
[00021ca6] 6704                      beq.s      $00021CAC
[00021ca8] 6000 0146                 bra        $00021DF0
[00021cac] 3815                      move.w     (a5),d4
[00021cae] c843                      and.w      d3,d4
[00021cb0] 6600 014a                 bne        $00021DFC
[00021cb4] 8755                      or.w       d3,(a5)
[00021cb6] 6000 0138                 bra        $00021DF0
[00021cba] 3815                      move.w     (a5),d4
[00021cbc] c843                      and.w      d3,d4
[00021cbe] 6700 013c                 beq        $00021DFC
[00021cc2] 3803                      move.w     d3,d4
[00021cc4] 4644                      not.w      d4
[00021cc6] c955                      and.w      d4,(a5)
[00021cc8] 6000 0126                 bra        $00021DF0
[00021ccc] 4a42                      tst.w      d2
[00021cce] 6f0a                      ble.s      $00021CDA
[00021cd0] 7607                      moveq.l    #7,d3
[00021cd2] 78ff                      moveq.l    #-1,d4
[00021cd4] d802                      add.b      d2,d4
[00021cd6] e96b                      lsl.w      d4,d3
[00021cd8] 6002                      bra.s      $00021CDC
[00021cda] 7603                      moveq.l    #3,d3
[00021cdc] 206b 000c                 movea.l    12(a3),a0
[00021ce0] 3828 003e                 move.w     62(a0),d4
[00021ce4] e84c                      lsr.w      #4,d4
[00021ce6] c87c 0007                 and.w      #$0007,d4
[00021cea] 4a44                      tst.w      d4
[00021cec] 6728                      beq.s      $00021D16
[00021cee] 5f44                      subq.w     #7,d4
[00021cf0] 6702                      beq.s      $00021CF4
[00021cf2] 604e                      bra.s      $00021D42
[00021cf4] 3814                      move.w     (a4),d4
[00021cf6] 670c                      beq.s      $00021D04
[00021cf8] 204d                      movea.l    a5,a0
[00021cfa] 3800                      move.w     d0,d4
[00021cfc] 48c4                      ext.l      d4
[00021cfe] d884                      add.l      d4,d4
[00021d00] 91c4                      suba.l     d4,a0
[00021d02] 8750                      or.w       d3,(a0)
[00021d04] b254                      cmp.w      (a4),d1
[00021d06] 670a                      beq.s      $00021D12
[00021d08] 3800                      move.w     d0,d4
[00021d0a] 48c4                      ext.l      d4
[00021d0c] d884                      add.l      d4,d4
[00021d0e] 8775 4800                 or.w       d3,0(a5,d4.l)
[00021d12] 8755                      or.w       d3,(a5)
[00021d14] 602c                      bra.s      $00021D42
[00021d16] 3814                      move.w     (a4),d4
[00021d18] 6710                      beq.s      $00021D2A
[00021d1a] 3803                      move.w     d3,d4
[00021d1c] 4644                      not.w      d4
[00021d1e] 204d                      movea.l    a5,a0
[00021d20] 3a00                      move.w     d0,d5
[00021d22] 48c5                      ext.l      d5
[00021d24] da85                      add.l      d5,d5
[00021d26] 91c5                      suba.l     d5,a0
[00021d28] c950                      and.w      d4,(a0)
[00021d2a] b254                      cmp.w      (a4),d1
[00021d2c] 670e                      beq.s      $00021D3C
[00021d2e] 3803                      move.w     d3,d4
[00021d30] 4644                      not.w      d4
[00021d32] 3a00                      move.w     d0,d5
[00021d34] 48c5                      ext.l      d5
[00021d36] da85                      add.l      d5,d5
[00021d38] c975 5800                 and.w      d4,0(a5,d5.l)
[00021d3c] 3803                      move.w     d3,d4
[00021d3e] 4644                      not.w      d4
[00021d40] c955                      and.w      d4,(a5)
[00021d42] 4243                      clr.w      d3
[00021d44] 4a42                      tst.w      d2
[00021d46] 661a                      bne.s      $00021D62
[00021d48] 206f 0018                 movea.l    24(a7),a0
[00021d4c] 3828 0004                 move.w     4(a0),d4
[00021d50] e74c                      lsl.w      #3,d4
[00021d52] 5344                      subq.w     #1,d4
[00021d54] 3a2f 0016                 move.w     22(a7),d5
[00021d58] ba44                      cmp.w      d4,d5
[00021d5a] 6706                      beq.s      $00021D62
[00021d5c] 363c 8000                 move.w     #$8000,d3
[00021d60] 544d                      addq.w     #2,a5
[00021d62] b47c 000f                 cmp.w      #$000F,d2
[00021d66] 660a                      bne.s      $00021D72
[00021d68] 342f 0016                 move.w     22(a7),d2
[00021d6c] 6704                      beq.s      $00021D72
[00021d6e] 7601                      moveq.l    #1,d3
[00021d70] 554d                      subq.w     #2,a5
[00021d72] 4a43                      tst.w      d3
[00021d74] 6766                      beq.s      $00021DDC
[00021d76] 206b 000c                 movea.l    12(a3),a0
[00021d7a] 3428 003e                 move.w     62(a0),d2
[00021d7e] e84a                      lsr.w      #4,d2
[00021d80] c47c 0007                 and.w      #$0007,d2
[00021d84] 4a42                      tst.w      d2
[00021d86] 6728                      beq.s      $00021DB0
[00021d88] 5f42                      subq.w     #7,d2
[00021d8a] 6702                      beq.s      $00021D8E
[00021d8c] 604e                      bra.s      $00021DDC
[00021d8e] 3414                      move.w     (a4),d2
[00021d90] 670c                      beq.s      $00021D9E
[00021d92] 204d                      movea.l    a5,a0
[00021d94] 3800                      move.w     d0,d4
[00021d96] 48c4                      ext.l      d4
[00021d98] d884                      add.l      d4,d4
[00021d9a] 91c4                      suba.l     d4,a0
[00021d9c] 8750                      or.w       d3,(a0)
[00021d9e] b254                      cmp.w      (a4),d1
[00021da0] 670a                      beq.s      $00021DAC
[00021da2] 3400                      move.w     d0,d2
[00021da4] 48c2                      ext.l      d2
[00021da6] d482                      add.l      d2,d2
[00021da8] 8775 2800                 or.w       d3,0(a5,d2.l)
[00021dac] 8755                      or.w       d3,(a5)
[00021dae] 602c                      bra.s      $00021DDC
[00021db0] 3414                      move.w     (a4),d2
[00021db2] 6710                      beq.s      $00021DC4
[00021db4] 3803                      move.w     d3,d4
[00021db6] 4644                      not.w      d4
[00021db8] 204d                      movea.l    a5,a0
[00021dba] 3a00                      move.w     d0,d5
[00021dbc] 48c5                      ext.l      d5
[00021dbe] da85                      add.l      d5,d5
[00021dc0] 91c5                      suba.l     d5,a0
[00021dc2] c950                      and.w      d4,(a0)
[00021dc4] b254                      cmp.w      (a4),d1
[00021dc6] 670e                      beq.s      $00021DD6
[00021dc8] 3203                      move.w     d3,d1
[00021dca] 4641                      not.w      d1
[00021dcc] 3400                      move.w     d0,d2
[00021dce] 48c2                      ext.l      d2
[00021dd0] d482                      add.l      d2,d2
[00021dd2] c375 2800                 and.w      d1,0(a5,d2.l)
[00021dd6] 3003                      move.w     d3,d0
[00021dd8] 4640                      not.w      d0
[00021dda] c155                      and.w      d0,(a5)
[00021ddc] 516f 0008                 subq.w     #8,8(a7)
[00021de0] 516f 000a                 subq.w     #8,10(a7)
[00021de4] 066f 0010 000c            addi.w     #$0010,12(a7)
[00021dea] 066f 0010 000e            addi.w     #$0010,14(a7)
[00021df0] 43ef 0008                 lea.l      8(a7),a1
[00021df4] 204a                      movea.l    a2,a0
[00021df6] 266a 006a                 movea.l    106(a2),a3
[00021dfa] 4e93                      jsr        (a3)
[00021dfc] 2f39 000e 692a            move.l     _globl,-(a7)
[00021e02] 486f 0008                 pea.l      8(a7)
[00021e06] 486f 000e                 pea.l      14(a7)
[00021e0a] 224c                      movea.l    a4,a1
[00021e0c] 41ef 0022                 lea.l      34(a7),a0
[00021e10] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[00021e16] 4fef 000c                 lea.l      12(a7),a7
[00021e1a] 7001                      moveq.l    #1,d0
[00021e1c] c06f 0006                 and.w      6(a7),d0
[00021e20] 6600 fdd8                 bne        $00021BFA
[00021e24] 4fef 001c                 lea.l      28(a7),a7
[00021e28] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[00021e2c] 4e75                      rts
edim_abort:
[00021e2e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00021e34] 2068 0258                 movea.l    600(a0),a0
[00021e38] 4eb9 0002 2596            jsr        term
[00021e3e] 4e75                      rts
edim_ok:
[00021e40] 2079 0010 ee4e            movea.l    ACSblk,a0
[00021e46] 2068 0258                 movea.l    600(a0),a0
[00021e4a] 4eb9 0002 2382            jsr        acc_image
[00021e50] 2079 0010 ee4e            movea.l    ACSblk,a0
[00021e56] 2068 0258                 movea.l    600(a0),a0
[00021e5a] 4eb9 0002 2596            jsr        term
[00021e60] 4e75                      rts
edim_acc:
[00021e62] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[00021e66] 514f                      subq.w     #8,a7
[00021e68] 2079 0010 ee4e            movea.l    ACSblk,a0
[00021e6e] 2468 0258                 movea.l    600(a0),a2
[00021e72] 2eaa 0014                 move.l     20(a2),(a7)
[00021e76] 2868 0240                 movea.l    576(a0),a4
[00021e7a] 4eb9 0004 7e1e            jsr        Adr_start
[00021e80] 4eb9 0004 7e2a            jsr        Adr_next
[00021e86] 3600                      move.w     d0,d3
[00021e88] 6b00 00ba                 bmi        $00021F44
[00021e8c] 48c0                      ext.l      d0
[00021e8e] 2200                      move.l     d0,d1
[00021e90] d281                      add.l      d1,d1
[00021e92] d280                      add.l      d0,d1
[00021e94] e789                      lsl.l      #3,d1
[00021e96] 266c 0014                 movea.l    20(a4),a3
[00021e9a] 47f3 1818                 lea.l      24(a3,d1.l),a3
[00021e9e] 0c6b 000a 0016            cmpi.w     #$000A,22(a3)
[00021ea4] 6600 009e                 bne        $00021F44
[00021ea8] 2a6b 000c                 movea.l    12(a3),a5
[00021eac] 0c6d 00c0 0004            cmpi.w     #$00C0,4(a5)
[00021eb2] 6e10                      bgt.s      $00021EC4
[00021eb4] 0c6d 00c0 0006            cmpi.w     #$00C0,6(a5)
[00021eba] 6e08                      bgt.s      $00021EC4
[00021ebc] 0c6d 0001 000a            cmpi.w     #$0001,10(a5)
[00021ec2] 6710                      beq.s      $00021ED4
[00021ec4] 41f9 000b 0e70            lea.l      ERR_LARGE,a0
[00021eca] 7001                      moveq.l    #1,d0
[00021ecc] 4eb9 0005 a600            jsr        Awi_alert
[00021ed2] 6070                      bra.s      $00021F44
[00021ed4] 302d 0006                 move.w     6(a5),d0
[00021ed8] 48c0                      ext.l      d0
[00021eda] d080                      add.l      d0,d0
[00021edc] 322d 0008                 move.w     8(a5),d1
[00021ee0] 48c1                      ext.l      d1
[00021ee2] 4eb9 0008 3cac            jsr        _lmul
[00021ee8] 2800                      move.l     d0,d4
[00021eea] 2f52 0004                 move.l     (a2),4(a7)
[00021eee] 2255                      movea.l    (a5),a1
[00021ef0] 206f 0004                 movea.l    4(a7),a0
[00021ef4] 2068 0010                 movea.l    16(a0),a0
[00021ef8] 2004                      move.l     d4,d0
[00021efa] 4eb9 0008 3500            jsr        memcpy
[00021f00] 206f 0004                 movea.l    4(a7),a0
[00021f04] 2268 0008                 movea.l    8(a0),a1
[00021f08] 2669 0054                 movea.l    84(a1),a3
[00021f0c] 302d 0008                 move.w     8(a5),d0
[00021f10] e948                      lsl.w      #4,d0
[00021f12] 2057                      movea.l    (a7),a0
[00021f14] 3140 008c                 move.w     d0,140(a0)
[00021f18] 322d 0008                 move.w     8(a5),d1
[00021f1c] d241                      add.w      d1,d1
[00021f1e] 3741 0004                 move.w     d1,4(a3)
[00021f22] 302d 0006                 move.w     6(a5),d0
[00021f26] 3740 0006                 move.w     d0,6(a3)
[00021f2a] 3140 008e                 move.w     d0,142(a0)
[00021f2e] 72ff                      moveq.l    #-1,d1
[00021f30] 226a 0066                 movea.l    102(a2),a1
[00021f34] 204a                      movea.l    a2,a0
[00021f36] 7001                      moveq.l    #1,d0
[00021f38] 4e91                      jsr        (a1)
[00021f3a] 3003                      move.w     d3,d0
[00021f3c] 204c                      movea.l    a4,a0
[00021f3e] 4eb9 0004 7f76            jsr        Adr_del
[00021f44] 504f                      addq.w     #8,a7
[00021f46] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[00021f4a] 4e75                      rts
edim_bitmap:
[00021f4c] 48e7 3f3c                 movem.l    d2-d7/a2-a5,-(a7)
[00021f50] 4fef ffe0                 lea.l      -32(a7),a7
[00021f54] 206f 004c                 movea.l    76(a7),a0
[00021f58] 3f68 0016 0004            move.w     22(a0),4(a7)
[00021f5e] 3f68 0018 0006            move.w     24(a0),6(a7)
[00021f64] 49f9 0010 ee4e            lea.l      ACSblk,a4
[00021f6a] 302f 0004                 move.w     4(a7),d0
[00021f6e] 6606                      bne.s      $00021F76
[00021f70] 322f 0006                 move.w     6(a7),d1
[00021f74] 6730                      beq.s      $00021FA6
[00021f76] 206f 004c                 movea.l    76(a7),a0
[00021f7a] 3ea8 0012                 move.w     18(a0),(a7)
[00021f7e] 3f68 0014 0002            move.w     20(a0),2(a7)
[00021f84] 70ff                      moveq.l    #-1,d0
[00021f86] d057                      add.w      (a7),d0
[00021f88] d16f 0004                 add.w      d0,4(a7)
[00021f8c] 70ff                      moveq.l    #-1,d0
[00021f8e] d06f 0002                 add.w      2(a7),d0
[00021f92] d16f 0006                 add.w      d0,6(a7)
[00021f96] 41d7                      lea.l      (a7),a0
[00021f98] 7201                      moveq.l    #1,d1
[00021f9a] 2254                      movea.l    (a4),a1
[00021f9c] 3029 0010                 move.w     16(a1),d0
[00021fa0] 4eb9 0007 2230            jsr        vs_clip
[00021fa6] 206f 004c                 movea.l    76(a7),a0
[00021faa] 2068 001a                 movea.l    26(a0),a0
[00021fae] 2050                      movea.l    (a0),a0
[00021fb0] 2268 0008                 movea.l    8(a0),a1
[00021fb4] 2f69 0054 001c            move.l     84(a1),28(a7)
[00021fba] 206f 001c                 movea.l    28(a7),a0
[00021fbe] 2f50 0018                 move.l     (a0),24(a7)
[00021fc2] 3628 0004                 move.w     4(a0),d3
[00021fc6] e243                      asr.w      #1,d3
[00021fc8] 4bef 0008                 lea.l      8(a7),a5
[00021fcc] 4255                      clr.w      (a5)
[00021fce] 426d 0002                 clr.w      2(a5)
[00021fd2] 3b7c 001f 0004            move.w     #$001F,4(a5)
[00021fd8] 3b7c 0007 0006            move.w     #$0007,6(a5)
[00021fde] 206f 004c                 movea.l    76(a7),a0
[00021fe2] 3b68 000c 000a            move.w     12(a0),10(a5)
[00021fe8] 7007                      moveq.l    #7,d0
[00021fea] d068 000c                 add.w      12(a0),d0
[00021fee] 3b40 000e                 move.w     d0,14(a5)
[00021ff2] 4244                      clr.w      d4
[00021ff4] 45f9 000b 20a2            lea.l      the_mfdb,a2
[00021ffa] 6000 00d8                 bra        $000220D4
[00021ffe] 302d 000e                 move.w     14(a5),d0
[00022002] b06f 0002                 cmp.w      2(a7),d0
[00022006] 6d00 00b8                 blt        $000220C0
[0002200a] 322d 000a                 move.w     10(a5),d1
[0002200e] b26f 0006                 cmp.w      6(a7),d1
[00022012] 6e00 00ac                 bgt        $000220C0
[00022016] 206f 004c                 movea.l    76(a7),a0
[0002201a] 3b68 000a 0008            move.w     10(a0),8(a5)
[00022020] 701f                      moveq.l    #31,d0
[00022022] d068 000a                 add.w      10(a0),d0
[00022026] 3b40 000c                 move.w     d0,12(a5)
[0002202a] 4245                      clr.w      d5
[0002202c] 6000 008a                 bra        $000220B8
[00022030] 206f 0018                 movea.l    24(a7),a0
[00022034] 54af 0018                 addq.l     #2,24(a7)
[00022038] 3c10                      move.w     (a0),d6
[0002203a] 303c 0080                 move.w     #$0080,d0
[0002203e] d06d 000c                 add.w      12(a5),d0
[00022042] b057                      cmp.w      (a7),d0
[00022044] 6d64                      blt.s      $000220AA
[00022046] 322d 0008                 move.w     8(a5),d1
[0002204a] b26f 0004                 cmp.w      4(a7),d1
[0002204e] 6e5a                      bgt.s      $000220AA
[00022050] 7e03                      moveq.l    #3,d7
[00022052] 6050                      bra.s      $000220A4
[00022054] 302d 000c                 move.w     12(a5),d0
[00022058] b057                      cmp.w      (a7),d0
[0002205a] 6d38                      blt.s      $00022094
[0002205c] 322d 0008                 move.w     8(a5),d1
[00022060] b26f 0004                 cmp.w      4(a7),d1
[00022064] 6e2e                      bgt.s      $00022094
[00022066] 3406                      move.w     d6,d2
[00022068] 700c                      moveq.l    #12,d0
[0002206a] e062                      asr.w      d0,d2
[0002206c] c47c 000f                 and.w      #$000F,d2
[00022070] e54a                      lsl.w      #2,d2
[00022072] 24b2 2018                 move.l     24(a2,d2.w),(a2)
[00022076] 486a 0014                 pea.l      20(a2)
[0002207a] 2054                      movea.l    (a4),a0
[0002207c] 4868 026a                 pea.l      618(a0)
[00022080] 224a                      movea.l    a2,a1
[00022082] 204d                      movea.l    a5,a0
[00022084] 2654                      movea.l    (a4),a3
[00022086] 302b 0010                 move.w     16(a3),d0
[0002208a] 7201                      moveq.l    #1,d1
[0002208c] 4eb9 0007 4902            jsr        vrt_cpyfm
[00022092] 504f                      addq.w     #8,a7
[00022094] e94e                      lsl.w      #4,d6
[00022096] 066d 0020 0008            addi.w     #$0020,8(a5)
[0002209c] 066d 0020 000c            addi.w     #$0020,12(a5)
[000220a2] 5347                      subq.w     #1,d7
[000220a4] 4a47                      tst.w      d7
[000220a6] 6aac                      bpl.s      $00022054
[000220a8] 600c                      bra.s      $000220B6
[000220aa] 066d 0080 0008            addi.w     #$0080,8(a5)
[000220b0] 066d 0080 000c            addi.w     #$0080,12(a5)
[000220b6] 5245                      addq.w     #1,d5
[000220b8] b645                      cmp.w      d5,d3
[000220ba] 6e00 ff74                 bgt        $00022030
[000220be] 600a                      bra.s      $000220CA
[000220c0] 3003                      move.w     d3,d0
[000220c2] 48c0                      ext.l      d0
[000220c4] d080                      add.l      d0,d0
[000220c6] d1af 0018                 add.l      d0,24(a7)
[000220ca] 506d 000a                 addq.w     #8,10(a5)
[000220ce] 506d 000e                 addq.w     #8,14(a5)
[000220d2] 5244                      addq.w     #1,d4
[000220d4] 206f 001c                 movea.l    28(a7),a0
[000220d8] b868 0006                 cmp.w      6(a0),d4
[000220dc] 6d00 ff20                 blt        $00021FFE
[000220e0] 41d7                      lea.l      (a7),a0
[000220e2] 4241                      clr.w      d1
[000220e4] 2254                      movea.l    (a4),a1
[000220e6] 3029 0010                 move.w     16(a1),d0
[000220ea] 4eb9 0007 2230            jsr        vs_clip
[000220f0] 206f 004c                 movea.l    76(a7),a0
[000220f4] 3028 0008                 move.w     8(a0),d0
[000220f8] 4fef 0020                 lea.l      32(a7),a7
[000220fc] 4cdf 3cfc                 movem.l    (a7)+,d2-d7/a2-a5
[00022100] 4e75                      rts
edim_struct:
[00022102] 48e7 0038                 movem.l    a2-a4,-(a7)
[00022106] 514f                      subq.w     #8,a7
[00022108] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0002210e] 2052                      movea.l    (a2),a0
[00022110] 3228 0260                 move.w     608(a0),d1
[00022114] 48c1                      ext.l      d1
[00022116] 2001                      move.l     d1,d0
[00022118] d080                      add.l      d0,d0
[0002211a] d081                      add.l      d1,d0
[0002211c] e788                      lsl.l      #3,d0
[0002211e] 2268 025c                 movea.l    604(a0),a1
[00022122] 0271 fffe 080a            andi.w     #$FFFE,10(a1,d0.l)
[00022128] 2052                      movea.l    (a2),a0
[0002212a] 2668 0258                 movea.l    600(a0),a3
[0002212e] 2853                      movea.l    (a3),a4
[00022130] 4eb9 0005 1388            jsr        Awi_diaend
[00022136] 377c ffff 001c            move.w     #$FFFF,28(a3)
[0002213c] 276c 0008 0014            move.l     8(a4),20(a3)
[00022142] 2052                      movea.l    (a2),a0
[00022144] 3028 0004                 move.w     4(a0),d0
[00022148] d040                      add.w      d0,d0
[0002214a] 226b 0014                 movea.l    20(a3),a1
[0002214e] d069 0014                 add.w      20(a1),d0
[00022152] 3740 0028                 move.w     d0,40(a3)
[00022156] 2052                      movea.l    (a2),a0
[00022158] 3228 0006                 move.w     6(a0),d1
[0002215c] e549                      lsl.w      #2,d1
[0002215e] 226b 0014                 movea.l    20(a3),a1
[00022162] d269 0016                 add.w      22(a1),d1
[00022166] 3741 002a                 move.w     d1,42(a3)
[0002216a] 2f39 000e 692a            move.l     _globl,-(a7)
[00022170] 486f 000a                 pea.l      10(a7)
[00022174] 486f 000c                 pea.l      12(a7)
[00022178] 206b 0014                 movea.l    20(a3),a0
[0002217c] 3f28 0016                 move.w     22(a0),-(a7)
[00022180] 3f28 0014                 move.w     20(a0),-(a7)
[00022184] 3f28 0012                 move.w     18(a0),-(a7)
[00022188] 43ef 0014                 lea.l      20(a7),a1
[0002218c] 41ef 0012                 lea.l      18(a7),a0
[00022190] 286b 0014                 movea.l    20(a3),a4
[00022194] 342c 0010                 move.w     16(a4),d2
[00022198] 322b 0022                 move.w     34(a3),d1
[0002219c] c27c f01f                 and.w      #$F01F,d1
[000221a0] 4240                      clr.w      d0
[000221a2] 4eb9 0007 b8da            jsr        mt_wind_calc
[000221a8] 4fef 0012                 lea.l      18(a7),a7
[000221ac] 302b 0022                 move.w     34(a3),d0
[000221b0] 2052                      movea.l    (a2),a0
[000221b2] 322f 0004                 move.w     4(a7),d1
[000221b6] b268 000c                 cmp.w      12(a0),d1
[000221ba] 6c04                      bge.s      $000221C0
[000221bc] c07c f1ff                 and.w      #$F1FF,d0
[000221c0] 2052                      movea.l    (a2),a0
[000221c2] 322f 0006                 move.w     6(a7),d1
[000221c6] b268 000e                 cmp.w      14(a0),d1
[000221ca] 6c04                      bge.s      $000221D0
[000221cc] c07c fe3f                 and.w      #$FE3F,d0
[000221d0] 3200                      move.w     d0,d1
[000221d2] c27c 0900                 and.w      #$0900,d1
[000221d6] 6604                      bne.s      $000221DC
[000221d8] c07c ffdf                 and.w      #$FFDF,d0
[000221dc] b06b 0022                 cmp.w      34(a3),d0
[000221e0] 6722                      beq.s      $00022204
[000221e2] 3740 0022                 move.w     d0,34(a3)
[000221e6] 006b 0100 0056            ori.w      #$0100,86(a3)
[000221ec] 204b                      movea.l    a3,a0
[000221ee] 4eb9 0005 8362            jsr        Awi_closed
[000221f4] 204b                      movea.l    a3,a0
[000221f6] 4eb9 0005 7428            jsr        Awi_open
[000221fc] 026b feff 0056            andi.w     #$FEFF,86(a3)
[00022202] 6008                      bra.s      $0002220C
[00022204] 204b                      movea.l    a3,a0
[00022206] 4eb9 0001 607e            jsr        view_shrink
[0002220c] 504f                      addq.w     #8,a7
[0002220e] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00022212] 4e75                      rts
edim_edit:
[00022214] 48e7 0038                 movem.l    a2-a4,-(a7)
[00022218] 594f                      subq.w     #4,a7
[0002221a] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00022220] 2052                      movea.l    (a2),a0
[00022222] 2668 0258                 movea.l    600(a0),a3
[00022226] 3228 0260                 move.w     608(a0),d1
[0002222a] 48c1                      ext.l      d1
[0002222c] 2001                      move.l     d1,d0
[0002222e] d080                      add.l      d0,d0
[00022230] d081                      add.l      d1,d0
[00022232] e788                      lsl.l      #3,d0
[00022234] 2268 025c                 movea.l    604(a0),a1
[00022238] 0271 fffe 080a            andi.w     #$FFFE,10(a1,d0.l)
[0002223e] 2853                      movea.l    (a3),a4
[00022240] 4eb9 0005 1388            jsr        Awi_diaend
[00022246] 377c ffff 001c            move.w     #$FFFF,28(a3)
[0002224c] 206c 000c                 movea.l    12(a4),a0
[00022250] 2748 0014                 move.l     a0,20(a3)
[00022254] 226c 0008                 movea.l    8(a4),a1
[00022258] 2ea9 0054                 move.l     84(a1),(a7)
[0002225c] 2857                      movea.l    (a7),a4
[0002225e] 302c 0004                 move.w     4(a4),d0
[00022262] e748                      lsl.w      #3,d0
[00022264] e748                      lsl.w      #3,d0
[00022266] 322c 0006                 move.w     6(a4),d1
[0002226a] e749                      lsl.w      #3,d1
[0002226c] 2868 0264                 movea.l    612(a0),a4
[00022270] 294b 0004                 move.l     a3,4(a4)
[00022274] 3140 026c                 move.w     d0,620(a0)
[00022278] 3140 0254                 move.w     d0,596(a0)
[0002227c] 3141 026e                 move.w     d1,622(a0)
[00022280] 3141 0256                 move.w     d1,598(a0)
[00022284] 317c 0008 0284            move.w     #$0008,644(a0)
[0002228a] 2852                      movea.l    (a2),a4
[0002228c] 342c 0012                 move.w     18(a4),d2
[00022290] d442                      add.w      d2,d2
[00022292] d468 0250                 add.w      592(a0),d2
[00022296] d042                      add.w      d2,d0
[00022298] 342c 0014                 move.w     20(a4),d2
[0002229c] d442                      add.w      d2,d2
[0002229e] d468 0252                 add.w      594(a0),d2
[000222a2] d242                      add.w      d2,d1
[000222a4] b069 0014                 cmp.w      20(a1),d0
[000222a8] 6c08                      bge.s      $000222B2
[000222aa] 3169 0014 0014            move.w     20(a1),20(a0)
[000222b0] 6004                      bra.s      $000222B6
[000222b2] 3140 0014                 move.w     d0,20(a0)
[000222b6] b269 0016                 cmp.w      22(a1),d1
[000222ba] 6c08                      bge.s      $000222C4
[000222bc] 3169 0016 0016            move.w     22(a1),22(a0)
[000222c2] 6004                      bra.s      $000222C8
[000222c4] 3141 0016                 move.w     d1,22(a0)
[000222c8] 7008                      moveq.l    #8,d0
[000222ca] 3140 0046                 move.w     d0,70(a0)
[000222ce] 3140 0044                 move.w     d0,68(a0)
[000222d2] 0268 ff8f 003e            andi.w     #$FF8F,62(a0)
[000222d8] 0068 0070 003e            ori.w      #$0070,62(a0)
[000222de] 2052                      movea.l    (a2),a0
[000222e0] 3028 000c                 move.w     12(a0),d0
[000222e4] 3228 0004                 move.w     4(a0),d1
[000222e8] d241                      add.w      d1,d1
[000222ea] 226b 0014                 movea.l    20(a3),a1
[000222ee] d269 0014                 add.w      20(a1),d1
[000222f2] b041                      cmp.w      d1,d0
[000222f4] 6c02                      bge.s      $000222F8
[000222f6] 6010                      bra.s      $00022308
[000222f8] 2052                      movea.l    (a2),a0
[000222fa] 3028 0004                 move.w     4(a0),d0
[000222fe] d040                      add.w      d0,d0
[00022300] 226b 0014                 movea.l    20(a3),a1
[00022304] d069 0014                 add.w      20(a1),d0
[00022308] 3740 0028                 move.w     d0,40(a3)
[0002230c] 2052                      movea.l    (a2),a0
[0002230e] 3228 000e                 move.w     14(a0),d1
[00022312] 3428 0006                 move.w     6(a0),d2
[00022316] e54a                      lsl.w      #2,d2
[00022318] 226b 0014                 movea.l    20(a3),a1
[0002231c] d469 0016                 add.w      22(a1),d2
[00022320] b242                      cmp.w      d2,d1
[00022322] 6c02                      bge.s      $00022326
[00022324] 6010                      bra.s      $00022336
[00022326] 2052                      movea.l    (a2),a0
[00022328] 3228 0006                 move.w     6(a0),d1
[0002232c] e549                      lsl.w      #2,d1
[0002232e] 226b 0014                 movea.l    20(a3),a1
[00022332] d269 0016                 add.w      22(a1),d1
[00022336] 3741 002a                 move.w     d1,42(a3)
[0002233a] 302b 0022                 move.w     34(a3),d0
[0002233e] c07c 0100                 and.w      #$0100,d0
[00022342] 670a                      beq.s      $0002234E
[00022344] 342b 0022                 move.w     34(a3),d2
[00022348] c47c 0800                 and.w      #$0800,d2
[0002234c] 6624                      bne.s      $00022372
[0002234e] 006b 0100 0056            ori.w      #$0100,86(a3)
[00022354] 204b                      movea.l    a3,a0
[00022356] 4eb9 0005 8362            jsr        Awi_closed
[0002235c] 006b 0fe0 0022            ori.w      #$0FE0,34(a3)
[00022362] 204b                      movea.l    a3,a0
[00022364] 4eb9 0005 7428            jsr        Awi_open
[0002236a] 026b feff 0056            andi.w     #$FEFF,86(a3)
[00022370] 6008                      bra.s      $0002237A
[00022372] 204b                      movea.l    a3,a0
[00022374] 4eb9 0001 6012            jsr        view_grow
[0002237a] 584f                      addq.w     #4,a7
[0002237c] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00022380] 4e75                      rts
acc_image:
[00022382] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[00022386] 2050                      movea.l    (a0),a0
[00022388] 2250                      movea.l    (a0),a1
[0002238a] 0069 0001 0006            ori.w      #$0001,6(a1)
[00022390] 2468 0004                 movea.l    4(a0),a2
[00022394] 2068 0008                 movea.l    8(a0),a0
[00022398] 266a 0004                 movea.l    4(a2),a3
[0002239c] 2868 0054                 movea.l    84(a0),a4
[000223a0] 362c 0004                 move.w     4(a4),d3
[000223a4] c7ec 0006                 muls.w     6(a4),d3
[000223a8] 48c3                      ext.l      d3
[000223aa] 780e                      moveq.l    #14,d4
[000223ac] d883                      add.l      d3,d4
[000223ae] 2004                      move.l     d4,d0
[000223b0] 4eb9 0004 c608            jsr        Ax_malloc
[000223b6] 2a48                      movea.l    a0,a5
[000223b8] 200d                      move.l     a5,d0
[000223ba] 6734                      beq.s      $000223F0
[000223bc] 224c                      movea.l    a4,a1
[000223be] 700e                      moveq.l    #14,d0
[000223c0] 4eb9 0008 3500            jsr        memcpy
[000223c6] 2abc 0000 000e            move.l     #$0000000E,(a5)
[000223cc] 254d 0004                 move.l     a5,4(a2)
[000223d0] 2003                      move.l     d3,d0
[000223d2] 2254                      movea.l    (a4),a1
[000223d4] 4bed 000e                 lea.l      14(a5),a5
[000223d8] 204d                      movea.l    a5,a0
[000223da] 4eb9 0008 3500            jsr        memcpy
[000223e0] 2544 000a                 move.l     d4,10(a2)
[000223e4] 2544 000e                 move.l     d4,14(a2)
[000223e8] 204b                      movea.l    a3,a0
[000223ea] 4eb9 0004 c7c8            jsr        Ax_free
[000223f0] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[000223f4] 4e75                      rts
im_make:
[000223f6] 48e7 0038                 movem.l    a2-a4,-(a7)
[000223fa] 594f                      subq.w     #4,a7
[000223fc] 2e88                      move.l     a0,(a7)
[000223fe] 2668 0004                 movea.l    4(a0),a3
[00022402] 286b 0012                 movea.l    18(a3),a4
[00022406] 200c                      move.l     a4,d0
[00022408] 670c                      beq.s      $00022416
[0002240a] 204c                      movea.l    a4,a0
[0002240c] 4eb9 0005 6bea            jsr        Awi_show
[00022412] 6000 009e                 bra        $000224B2
[00022416] 7014                      moveq.l    #20,d0
[00022418] 4eb9 0004 c608            jsr        Ax_malloc
[0002241e] 2448                      movea.l    a0,a2
[00022420] 200a                      move.l     a2,d0
[00022422] 6700 008a                 beq        $000224AE
[00022426] 2257                      movea.l    (a7),a1
[00022428] 2091                      move.l     (a1),(a0)
[0002242a] 2569 0004 0004            move.l     4(a1),4(a2)
[00022430] 41eb 0016                 lea.l      22(a3),a0
[00022434] 23c8 000b 1dac            move.l     a0,$000B1DAC
[0002243a] 2279 000b 1db8            movea.l    $000B1DB8,a1
[00022440] 2348 0008                 move.l     a0,8(a1)
[00022444] 41f9 000b 1d5e            lea.l      WI_IMAGE,a0
[0002244a] 4eb9 0005 7052            jsr        Awi_create
[00022450] 2848                      movea.l    a0,a4
[00022452] 200c                      move.l     a4,d0
[00022454] 6758                      beq.s      $000224AE
[00022456] 2257                      movea.l    (a7),a1
[00022458] 2051                      movea.l    (a1),a0
[0002245a] 4868 0168                 pea.l      360(a0)
[0002245e] 43eb 003a                 lea.l      58(a3),a1
[00022462] 204c                      movea.l    a4,a0
[00022464] 4eb9 0001 6372            jsr        wi_pos
[0002246a] 584f                      addq.w     #4,a7
[0002246c] 288a                      move.l     a2,(a4)
[0002246e] 256c 0014 0008            move.l     20(a4),8(a2)
[00022474] 41f9 000b 19e6            lea.l      EDIT_IMAGE2,a0
[0002247a] 4eb9 0004 f064            jsr        Aob_create
[00022480] 2548 000c                 move.l     a0,12(a2)
[00022484] 2008                      move.l     a0,d0
[00022486] 6726                      beq.s      $000224AE
[00022488] 4eb9 0004 fbdc            jsr        Aob_fix
[0002248e] 274c 0012                 move.l     a4,18(a3)
[00022492] 204c                      movea.l    a4,a0
[00022494] 4eb9 0002 2508            jsr        set_image
[0002249a] 204c                      movea.l    a4,a0
[0002249c] 226c 000c                 movea.l    12(a4),a1
[000224a0] 4e91                      jsr        (a1)
[000224a2] 4a40                      tst.w      d0
[000224a4] 670c                      beq.s      $000224B2
[000224a6] 204c                      movea.l    a4,a0
[000224a8] 4eb9 0002 2596            jsr        term
[000224ae] 91c8                      suba.l     a0,a0
[000224b0] 6002                      bra.s      $000224B4
[000224b2] 204c                      movea.l    a4,a0
[000224b4] 584f                      addq.w     #4,a7
[000224b6] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000224ba] 4e75                      rts
im_service:
[000224bc] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000224c0] 2448                      movea.l    a0,a2
[000224c2] 3600                      move.w     d0,d3
[000224c4] 2849                      movea.l    a1,a4
[000224c6] 2650                      movea.l    (a0),a3
[000224c8] 5540                      subq.w     #2,d0
[000224ca] 6708                      beq.s      $000224D4
[000224cc] 907c 270e                 sub.w      #$270E,d0
[000224d0] 6712                      beq.s      $000224E4
[000224d2] 601e                      bra.s      $000224F2
[000224d4] 204a                      movea.l    a2,a0
[000224d6] 6100 feaa                 bsr        acc_image
[000224da] 204a                      movea.l    a2,a0
[000224dc] 4eb9 0002 2596            jsr        term
[000224e2] 601c                      bra.s      $00022500
[000224e4] 226b 0004                 movea.l    4(a3),a1
[000224e8] 204a                      movea.l    a2,a0
[000224ea] 4eb9 0001 60ea            jsr        new_name
[000224f0] 600e                      bra.s      $00022500
[000224f2] 224c                      movea.l    a4,a1
[000224f4] 3003                      move.w     d3,d0
[000224f6] 204a                      movea.l    a2,a0
[000224f8] 4eb9 0005 9dd0            jsr        Awi_service
[000224fe] 6002                      bra.s      $00022502
[00022500] 7001                      moveq.l    #1,d0
[00022502] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00022506] 4e75                      rts
set_image:
[00022508] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0002250c] 2448                      movea.l    a0,a2
[0002250e] 2650                      movea.l    (a0),a3
[00022510] 206b 0008                 movea.l    8(a3),a0
[00022514] 2868 0054                 movea.l    84(a0),a4
[00022518] 206b 0004                 movea.l    4(a3),a0
[0002251c] 2a68 0004                 movea.l    4(a0),a5
[00022520] 4240                      clr.w      d0
[00022522] 3b40 000a                 move.w     d0,10(a5)
[00022526] 3b40 0008                 move.w     d0,8(a5)
[0002252a] 224d                      movea.l    a5,a1
[0002252c] 204c                      movea.l    a4,a0
[0002252e] 700e                      moveq.l    #14,d0
[00022530] 4eb9 0008 3500            jsr        memcpy
[00022536] 263c 0000 1200            move.l     #$00001200,d3
[0002253c] 2003                      move.l     d3,d0
[0002253e] 4eb9 0004 c608            jsr        Ax_malloc
[00022544] 2888                      move.l     a0,(a4)
[00022546] 2748 0010                 move.l     a0,16(a3)
[0002254a] 2008                      move.l     a0,d0
[0002254c] 670e                      beq.s      $0002255C
[0002254e] 2215                      move.l     (a5),d1
[00022550] 43f5 1800                 lea.l      0(a5,d1.l),a1
[00022554] 2003                      move.l     d3,d0
[00022556] 4eb9 0008 3500            jsr        memcpy
[0002255c] 302c 000c                 move.w     12(a4),d0
[00022560] 48c0                      ext.l      d0
[00022562] e588                      lsl.l      #2,d0
[00022564] 41f9 000c a6d0            lea.l      colour_text,a0
[0002256a] 2270 0800                 movea.l    0(a0,d0.l),a1
[0002256e] 206a 0014                 movea.l    20(a2),a0
[00022572] 700b                      moveq.l    #11,d0
[00022574] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002257a] 206a 0014                 movea.l    20(a2),a0
[0002257e] 302c 000c                 move.w     12(a4),d0
[00022582] 0268 fff0 00fe            andi.w     #$FFF0,254(a0)
[00022588] c07c 000f                 and.w      #$000F,d0
[0002258c] 8168 00fe                 or.w       d0,254(a0)
[00022590] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00022594] 4e75                      rts
term:
[00022596] 2f0a                      move.l     a2,-(a7)
[00022598] 2f0b                      move.l     a3,-(a7)
[0002259a] 2448                      movea.l    a0,a2
[0002259c] 006a 0100 0056            ori.w      #$0100,86(a2)
[000225a2] 2650                      movea.l    (a0),a3
[000225a4] 226b 0004                 movea.l    4(a3),a1
[000225a8] 42a9 0012                 clr.l      18(a1)
[000225ac] 226a 0014                 movea.l    20(a2),a1
[000225b0] b3eb 0008                 cmpa.l     8(a3),a1
[000225b4] 660c                      bne.s      $000225C2
[000225b6] 206b 000c                 movea.l    12(a3),a0
[000225ba] 4eb9 0004 f20a            jsr        Aob_delete
[000225c0] 600a                      bra.s      $000225CC
[000225c2] 206b 0008                 movea.l    8(a3),a0
[000225c6] 4eb9 0004 f20a            jsr        Aob_delete
[000225cc] 302a 0056                 move.w     86(a2),d0
[000225d0] c07c 0800                 and.w      #$0800,d0
[000225d4] 6716                      beq.s      $000225EC
[000225d6] 43ea 002c                 lea.l      44(a2),a1
[000225da] 206b 0004                 movea.l    4(a3),a0
[000225de] 41e8 003a                 lea.l      58(a0),a0
[000225e2] 7008                      moveq.l    #8,d0
[000225e4] 4eb9 0008 3500            jsr        memcpy
[000225ea] 6014                      bra.s      $00022600
[000225ec] 7008                      moveq.l    #8,d0
[000225ee] 43ea 0024                 lea.l      36(a2),a1
[000225f2] 206b 0004                 movea.l    4(a3),a0
[000225f6] 41e8 003a                 lea.l      58(a0),a0
[000225fa] 4eb9 0008 3500            jsr        memcpy
[00022600] 206b 0010                 movea.l    16(a3),a0
[00022604] 4eb9 0004 c7c8            jsr        Ax_free
[0002260a] 204b                      movea.l    a3,a0
[0002260c] 4eb9 0004 c7c8            jsr        Ax_free
[00022612] 204a                      movea.l    a2,a0
[00022614] 4eb9 0005 8362            jsr        Awi_closed
[0002261a] 204a                      movea.l    a2,a0
[0002261c] 4eb9 0005 85f2            jsr        Awi_delete
[00022622] 265f                      movea.l    (a7)+,a3
[00022624] 245f                      movea.l    (a7)+,a2
[00022626] 4e75                      rts

	.data

ERR_LARGE:
[000b0e70]                           dc.b '[3][ Die Bilddaten umspannen| einen zu grossen Bereich | (Limit 196 x 196), oder| liegen nicht im| Standardformat vor.][ OK ]',0
TEXT_002:
[000b0eee]                           dc.w $004f
[000b0ef0]                           dc.w $4b00
TEXT_004:
[000b0ef2]                           dc.b 'Abbruch',0
TEXT_01:
[000b0efa]                           dc.b 'Farbe:',0
TEXT_019:
[000b0f01]                           dc.b 'Struktur',0
TEXT_02:
[000b0f0a]                           dc.b 'Pinsel:',0
TEXT_03:
[000b0f12]                           dc.b 'Schiebe:',0
TEXT_04:
[000b0f1b]                           dc.b 'St„rke:',0
TEXT_05:
[000b0f23]                           dc.b 'Breite:',0
TEXT_06:
[000b0f2b]                           dc.b '  H”he:',0
TEXT_07:
[000b0f33]                           dc.b ' Bild-Editor ',0
TEXT_08:
[000b0f41]                           dc.b 'neues Muster',0
TEXT_09:
[000b0f4e]                           dc.b 'Edit...',0
TEXT_10:
[000b0f56]                           dc.b 'Ausmaže...',0
TEXT_11:
[000b0f61]                           dc.b ' Ausmaže ',0
TEXT_12:
[000b0f6b]                           dc.b 'THINN',0
TEXT_13:
[000b0f71]                           dc.b 'FAT',0
TEXT_208:
[000b0f75]                           dc.b 'BILDER',0
DATAS_13:
[000b0f7c]                           dc.w $0000
[000b0f7e]                           dc.w $0000
[000b0f80]                           dc.w $02c0
[000b0f82]                           dc.w $0000
[000b0f84]                           dc.w $0000
[000b0f86]                           dc.w $0000
[000b0f88]                           dc.w $7fff
[000b0f8a]                           dc.w $ffff
[000b0f8c]                           dc.w $fffe
[000b0f8e]                           dc.w $4000
[000b0f90]                           dc.w $0000
[000b0f92]                           dc.w $0002
[000b0f94]                           dc.w $4000
[000b0f96]                           dc.w $0000
[000b0f98]                           dc.w $0002
[000b0f9a]                           dc.w $4000
[000b0f9c]                           dc.w $0000
[000b0f9e]                           dc.w $3802
[000b0fa0]                           dc.w $4000
[000b0fa2]                           dc.w $0000
[000b0fa4]                           dc.w $7c02
[000b0fa6]                           dc.w $4000
[000b0fa8]                           dc.w $0000
[000b0faa]                           dc.w $7c02
[000b0fac]                           dc.w $4000
[000b0fae]                           dc.w $0000
[000b0fb0]                           dc.w $7c02
[000b0fb2]                           dc.w $4000
[000b0fb4]                           dc.w $0000
[000b0fb6]                           dc.w $3802
[000b0fb8]                           dc.w $4000
[000b0fba]                           dc.w $0000
[000b0fbc]                           dc.w $0002
[000b0fbe]                           dc.w $4000
[000b0fc0]                           dc.w $0000
[000b0fc2]                           dc.w $0002
[000b0fc4]                           dc.w $4000
[000b0fc6]                           dc.w $0000
[000b0fc8]                           dc.w $0002
[000b0fca]                           dc.w $4000
[000b0fcc]                           dc.w $0000
[000b0fce]                           dc.w $0002
[000b0fd0]                           dc.w $4000
[000b0fd2]                           dc.w $0000
[000b0fd4]                           dc.w $0002
[000b0fd6]                           dc.w $4000
[000b0fd8]                           dc.w $0000
[000b0fda]                           dc.w $7f02
[000b0fdc]                           dc.w $7cc0
[000b0fde]                           dc.w $000f
[000b0fe0]                           dc.w $ff82
[000b0fe2]                           dc.w $7fc0
[000b0fe4]                           dc.w $f83f
[000b0fe6]                           dc.w $ffe2
[000b0fe8]                           dc.w $7fe3
[000b0fea]                           dc.w $ffff
[000b0fec]                           dc.w $fffe
[000b0fee]                           dc.w $7fe3
[000b0ff0]                           dc.w $ffff
[000b0ff2]                           dc.w $fffe
[000b0ff4]                           dc.w $7fe3
[000b0ff6]                           dc.w $ffff
[000b0ff8]                           dc.w $fffe
[000b0ffa]                           dc.w $7fe3
[000b0ffc]                           dc.w $ffff
[000b0ffe]                           dc.w $fffe
[000b1000]                           dc.w $7fff
[000b1002]                           dc.w $ffff
[000b1004]                           dc.w $fffe
[000b1006]                           dc.w $7fff
[000b1008]                           dc.w $ff7f
[000b100a]                           dc.w $fffe
[000b100c]                           dc.w $7fff
[000b100e]                           dc.w $ff5f
[000b1010]                           dc.w $fffe
[000b1012]                           dc.w $7fff
[000b1014]                           dc.w $ff1f
[000b1016]                           dc.w $fffe
[000b1018]                           dc.w $7fff
[000b101a]                           dc.w $ffbf
[000b101c]                           dc.w $fffe
[000b101e]                           dc.w $7fff
[000b1020]                           dc.w $ffff
[000b1022]                           dc.w $fffe
[000b1024]                           dc.w $7fff
[000b1026]                           dc.w $ffff
[000b1028]                           dc.w $fffe
[000b102a]                           dc.w $0000
[000b102c]                           dc.w $0000
[000b102e]                           dc.w $0000
[000b1030]                           dc.w $0000
[000b1032]                           dc.w $0000
[000b1034]                           dc.w $0000
[000b1036]                           dc.w $7fff
[000b1038]                           dc.w $ffff
[000b103a]                           dc.w $fffe
[000b103c]                           dc.w $4000
[000b103e]                           dc.w $0000
[000b1040]                           dc.w $0002
[000b1042]                           dc.w $4000
[000b1044]                           dc.w $0000
[000b1046]                           dc.w $0002
[000b1048]                           dc.w $4000
[000b104a]                           dc.w $0000
[000b104c]                           dc.w $0002
[000b104e]                           dc.w $4000
[000b1050]                           dc.w $0000
[000b1052]                           dc.w $0002
[000b1054]                           dc.w $4000
[000b1056]                           dc.w $0000
[000b1058]                           dc.w $0002
[000b105a]                           dc.w $4000
[000b105c]                           dc.w $0000
[000b105e]                           dc.w $0002
[000b1060]                           dc.w $4000
[000b1062]                           dc.w $0000
[000b1064]                           dc.w $0002
[000b1066]                           dc.w $4018
[000b1068]                           dc.w $0000
[000b106a]                           dc.w $0002
[000b106c]                           dc.w $403c
[000b106e]                           dc.w $0000
[000b1070]                           dc.w $0002
[000b1072]                           dc.w $403c
[000b1074]                           dc.w $8000
[000b1076]                           dc.w $0002
[000b1078]                           dc.w $403d
[000b107a]                           dc.w $c000
[000b107c]                           dc.w $0002
[000b107e]                           dc.w $403f
[000b1080]                           dc.w $c000
[000b1082]                           dc.w $0002
[000b1084]                           dc.w $403f
[000b1086]                           dc.w $c000
[000b1088]                           dc.w $7f02
[000b108a]                           dc.w $7cff
[000b108c]                           dc.w $800f
[000b108e]                           dc.w $ff82
[000b1090]                           dc.w $7fff
[000b1092]                           dc.w $f83f
[000b1094]                           dc.w $ffe2
[000b1096]                           dc.w $7fff
[000b1098]                           dc.w $ffff
[000b109a]                           dc.w $fffe
[000b109c]                           dc.w $7fff
[000b109e]                           dc.w $ffff
[000b10a0]                           dc.w $fffe
[000b10a2]                           dc.w $7fff
[000b10a4]                           dc.w $ffff
[000b10a6]                           dc.w $fffe
[000b10a8]                           dc.w $7fff
[000b10aa]                           dc.w $ffff
[000b10ac]                           dc.w $fffe
[000b10ae]                           dc.w $7fff
[000b10b0]                           dc.w $ffff
[000b10b2]                           dc.w $fffe
[000b10b4]                           dc.w $7fff
[000b10b6]                           dc.w $ffff
[000b10b8]                           dc.w $fffe
[000b10ba]                           dc.w $7fff
[000b10bc]                           dc.w $ffff
[000b10be]                           dc.w $fffe
[000b10c0]                           dc.w $7fff
[000b10c2]                           dc.w $ffff
[000b10c4]                           dc.w $fffe
[000b10c6]                           dc.w $7fff
[000b10c8]                           dc.w $ffff
[000b10ca]                           dc.w $fffe
[000b10cc]                           dc.w $7fff
[000b10ce]                           dc.w $ffff
[000b10d0]                           dc.w $fffe
[000b10d2]                           dc.w $7fff
[000b10d4]                           dc.w $ffff
[000b10d6]                           dc.w $fffe
[000b10d8]                           dc.w $0000
[000b10da]                           dc.w $0000
[000b10dc]                           dc.w $0000
[000b10de]                           dc.w $0000
[000b10e0]                           dc.w $0000
[000b10e2]                           dc.w $0000
[000b10e4]                           dc.w $7fff
[000b10e6]                           dc.w $ffff
[000b10e8]                           dc.w $fffe
[000b10ea]                           dc.w $7fff
[000b10ec]                           dc.w $ffff
[000b10ee]                           dc.w $fffe
[000b10f0]                           dc.w $7fff
[000b10f2]                           dc.w $ffff
[000b10f4]                           dc.w $fffe
[000b10f6]                           dc.w $7fff
[000b10f8]                           dc.w $ffff
[000b10fa]                           dc.w $c7fe
[000b10fc]                           dc.w $7fd0
[000b10fe]                           dc.w $3fff
[000b1100]                           dc.w $83fe
[000b1102]                           dc.w $7fff
[000b1104]                           dc.w $cbff
[000b1106]                           dc.w $83fe
[000b1108]                           dc.w $7fff
[000b110a]                           dc.w $fc3f
[000b110c]                           dc.w $83fe
[000b110e]                           dc.w $7fff
[000b1110]                           dc.w $ffff
[000b1112]                           dc.w $c7fe
[000b1114]                           dc.w $7fe7
[000b1116]                           dc.w $ffff
[000b1118]                           dc.w $fffe
[000b111a]                           dc.w $7fc3
[000b111c]                           dc.w $ffff
[000b111e]                           dc.w $fffe
[000b1120]                           dc.w $7fc3
[000b1122]                           dc.w $7fff
[000b1124]                           dc.w $fffe
[000b1126]                           dc.w $7fc2
[000b1128]                           dc.w $3fff
[000b112a]                           dc.w $fffe
[000b112c]                           dc.w $7fc0
[000b112e]                           dc.w $3fff
[000b1130]                           dc.w $fffe
[000b1132]                           dc.w $7fc0
[000b1134]                           dc.w $3fff
[000b1136]                           dc.w $80fe
[000b1138]                           dc.w $4300
[000b113a]                           dc.w $7ff0
[000b113c]                           dc.w $007e
[000b113e]                           dc.w $4000
[000b1140]                           dc.w $07c0
[000b1142]                           dc.w $001e
[000b1144]                           dc.w $4000
[000b1146]                           dc.w $0000
[000b1148]                           dc.w $0002
[000b114a]                           dc.w $4000
[000b114c]                           dc.w $0000
[000b114e]                           dc.w $0002
[000b1150]                           dc.w $4000
[000b1152]                           dc.w $0000
[000b1154]                           dc.w $0002
[000b1156]                           dc.w $4000
[000b1158]                           dc.w $0000
[000b115a]                           dc.w $0002
[000b115c]                           dc.w $4000
[000b115e]                           dc.w $0000
[000b1160]                           dc.w $0002
[000b1162]                           dc.w $4000
[000b1164]                           dc.w $0000
[000b1166]                           dc.w $0002
[000b1168]                           dc.w $4000
[000b116a]                           dc.w $0000
[000b116c]                           dc.w $0002
[000b116e]                           dc.w $4000
[000b1170]                           dc.w $0000
[000b1172]                           dc.w $0002
[000b1174]                           dc.w $4000
[000b1176]                           dc.w $0000
[000b1178]                           dc.w $0002
[000b117a]                           dc.w $4000
[000b117c]                           dc.w $0000
[000b117e]                           dc.w $0002
[000b1180]                           dc.w $7fff
[000b1182]                           dc.w $ffff
[000b1184]                           dc.w $fffe
[000b1186]                           dc.w $0000
[000b1188]                           dc.w $0000
[000b118a]                           dc.w $0000
[000b118c]                           dc.w $0000
[000b118e]                           dc.w $0000
[000b1190]                           dc.w $0000
[000b1192]                           dc.w $7fff
[000b1194]                           dc.w $ffff
[000b1196]                           dc.w $fffe
[000b1198]                           dc.w $4000
[000b119a]                           dc.w $0000
[000b119c]                           dc.w $0002
[000b119e]                           dc.w $4000
[000b11a0]                           dc.w $0000
[000b11a2]                           dc.w $0002
[000b11a4]                           dc.w $4000
[000b11a6]                           dc.w $0000
[000b11a8]                           dc.w $0002
[000b11aa]                           dc.w $4000
[000b11ac]                           dc.w $0000
[000b11ae]                           dc.w $0002
[000b11b0]                           dc.w $4000
[000b11b2]                           dc.w $0000
[000b11b4]                           dc.w $0002
[000b11b6]                           dc.w $4000
[000b11b8]                           dc.w $0000
[000b11ba]                           dc.w $0002
[000b11bc]                           dc.w $4000
[000b11be]                           dc.w $0000
[000b11c0]                           dc.w $0002
[000b11c2]                           dc.w $4000
[000b11c4]                           dc.w $0000
[000b11c6]                           dc.w $0002
[000b11c8]                           dc.w $4000
[000b11ca]                           dc.w $0000
[000b11cc]                           dc.w $0002
[000b11ce]                           dc.w $4004
[000b11d0]                           dc.w $0000
[000b11d2]                           dc.w $0002
[000b11d4]                           dc.w $4004
[000b11d6]                           dc.w $0000
[000b11d8]                           dc.w $0002
[000b11da]                           dc.b '@$@',0
[000b11de]                           dc.w $0002
[000b11e0]                           dc.b '@$@',0
[000b11e4]                           dc.w $0002
[000b11e6]                           dc.w $5cc0
[000b11e8]                           dc.w $8000
[000b11ea]                           dc.w $0002
[000b11ec]                           dc.w $4323
[000b11ee]                           dc.w $0000
[000b11f0]                           dc.w $0002
[000b11f2]                           dc.w $4004
[000b11f4]                           dc.w $0080
[000b11f6]                           dc.w $001e
[000b11f8]                           dc.w $4004
[000b11fa]                           dc.w $007c
[000b11fc]                           dc.w $01fe
[000b11fe]                           dc.w $4004
[000b1200]                           dc.w $0003
[000b1202]                           dc.w $fff2
[000b1204]                           dc.w $4004
[000b1206]                           dc.w $0002
[000b1208]                           dc.w $ffc2
[000b120a]                           dc.w $4000
[000b120c]                           dc.w $0000
[000b120e]                           dc.w $0002
[000b1210]                           dc.w $4000
[000b1212]                           dc.w $0080
[000b1214]                           dc.w $0002
[000b1216]                           dc.w $4000
[000b1218]                           dc.w $00a0
[000b121a]                           dc.w $0002
[000b121c]                           dc.w $4000
[000b121e]                           dc.w $0060
[000b1220]                           dc.w $0002
[000b1222]                           dc.w $4000
[000b1224]                           dc.w $0040
[000b1226]                           dc.w $0002
[000b1228]                           dc.w $4000
[000b122a]                           dc.w $0000
[000b122c]                           dc.w $0002
[000b122e]                           dc.w $7fff
[000b1230]                           dc.w $ffff
[000b1232]                           dc.w $fffe
[000b1234]                           dc.w $0000
[000b1236]                           dc.w $0000
[000b1238]                           dc.w $0000
DATAS_14:
[000b123a]                           dc.w $0000
[000b123c]                           dc.w $0000
[000b123e]                           dc.w $0000
[000b1240]                           dc.w $7fff
[000b1242]                           dc.w $ffff
[000b1244]                           dc.w $fffe
[000b1246]                           dc.w $7fff
[000b1248]                           dc.w $ffff
[000b124a]                           dc.w $fffe
[000b124c]                           dc.w $7fff
[000b124e]                           dc.w $ffff
[000b1250]                           dc.w $fffe
[000b1252]                           dc.w $7fff
[000b1254]                           dc.w $ffff
[000b1256]                           dc.w $fffe
[000b1258]                           dc.w $7fff
[000b125a]                           dc.w $ffff
[000b125c]                           dc.w $fffe
[000b125e]                           dc.w $7fff
[000b1260]                           dc.w $ffff
[000b1262]                           dc.w $fffe
[000b1264]                           dc.w $7fff
[000b1266]                           dc.w $ffff
[000b1268]                           dc.w $fffe
[000b126a]                           dc.w $7fff
[000b126c]                           dc.w $ffff
[000b126e]                           dc.w $fffe
[000b1270]                           dc.w $7fff
[000b1272]                           dc.w $ffff
[000b1274]                           dc.w $fffe
[000b1276]                           dc.w $7fff
[000b1278]                           dc.w $ffff
[000b127a]                           dc.w $fffe
[000b127c]                           dc.w $7fff
[000b127e]                           dc.w $ffff
[000b1280]                           dc.w $fffe
[000b1282]                           dc.w $7fff
[000b1284]                           dc.w $ffff
[000b1286]                           dc.w $fffe
[000b1288]                           dc.w $7fff
[000b128a]                           dc.w $ffff
[000b128c]                           dc.w $fffe
[000b128e]                           dc.w $7fff
[000b1290]                           dc.w $ffff
[000b1292]                           dc.w $fffe
[000b1294]                           dc.w $7fff
[000b1296]                           dc.w $ffff
[000b1298]                           dc.w $fffe
[000b129a]                           dc.w $7fff
[000b129c]                           dc.w $ffff
[000b129e]                           dc.w $fffe
[000b12a0]                           dc.w $7fff
[000b12a2]                           dc.w $ffff
[000b12a4]                           dc.w $fffe
[000b12a6]                           dc.w $7fff
[000b12a8]                           dc.w $ffff
[000b12aa]                           dc.w $fffe
[000b12ac]                           dc.w $7fff
[000b12ae]                           dc.w $ffff
[000b12b0]                           dc.w $fffe
[000b12b2]                           dc.w $7fff
[000b12b4]                           dc.w $ffff
[000b12b6]                           dc.w $fffe
[000b12b8]                           dc.w $7fff
[000b12ba]                           dc.w $ffff
[000b12bc]                           dc.w $fffe
[000b12be]                           dc.w $7fff
[000b12c0]                           dc.w $ffff
[000b12c2]                           dc.w $fffe
[000b12c4]                           dc.w $7fff
[000b12c6]                           dc.w $ffff
[000b12c8]                           dc.w $fffe
[000b12ca]                           dc.w $7fff
[000b12cc]                           dc.w $ffff
[000b12ce]                           dc.w $fffe
[000b12d0]                           dc.w $7fff
[000b12d2]                           dc.w $ffff
[000b12d4]                           dc.w $fffe
[000b12d6]                           dc.w $7fff
[000b12d8]                           dc.w $ffff
[000b12da]                           dc.w $fffe
[000b12dc]                           dc.w $7fff
[000b12de]                           dc.w $ffff
[000b12e0]                           dc.w $fffe
[000b12e2]                           dc.w $0000
[000b12e4]                           dc.w $0000
[000b12e6]                           dc.w $0000
TEDINFO_01:
[000b12e8] 000b0f6b                  dc.l TEXT_12
[000b12ec] 000b0eee                  dc.l TEXT_002
[000b12f0] 000b0eee                  dc.l TEXT_002
[000b12f4]                           dc.w $0005
[000b12f6]                           dc.w $0006
[000b12f8]                           dc.w $0002
[000b12fa]                           dc.w $1180
[000b12fc]                           dc.w $0000
[000b12fe]                           dc.w $ffff
[000b1300]                           dc.w $0006
[000b1302]                           dc.w $0001
TEDINFO_02:
[000b1304] 000b0f71                  dc.l TEXT_13
[000b1308] 000b0eee                  dc.l TEXT_002
[000b130c] 000b0eee                  dc.l TEXT_002
[000b1310]                           dc.w $0005
[000b1312]                           dc.w $0006
[000b1314]                           dc.w $0002
[000b1316]                           dc.w $1180
[000b1318]                           dc.w $0000
[000b131a]                           dc.w $ffff
[000b131c]                           dc.w $0004
[000b131e]                           dc.w $0001
A_3DBUTTON01:
[000b1320] 00064a22                  dc.l A_3Dbutton
[000b1324]                           dc.w $29f1
[000b1326]                           dc.w $0178
[000b1328] 000630f2                  dc.l Auo_string
[000b132c]                           dc.w $0000
[000b132e]                           dc.w $0000
[000b1330]                           dc.w $0000
[000b1332]                           dc.w $0000
[000b1334]                           dc.w $0000
[000b1336]                           dc.w $0000
[000b1338]                           dc.w $0000
[000b133a]                           dc.w $0000
[000b133c]                           dc.w $0000
[000b133e]                           dc.w $0000
A_3DBUTTON02:
[000b1340] 00064a22                  dc.l A_3Dbutton
[000b1344]                           dc.w $29c1
[000b1346]                           dc.w $0178
[000b1348] 000630f2                  dc.l Auo_string
[000b134c] 000b0f41                  dc.l TEXT_08
[000b1350]                           dc.w $0000
[000b1352]                           dc.w $0000
[000b1354]                           dc.w $0000
[000b1356]                           dc.w $0000
[000b1358]                           dc.w $0000
[000b135a]                           dc.w $0000
[000b135c]                           dc.w $0000
[000b135e]                           dc.w $0000
A_3DBUTTON03:
[000b1360] 00064a22                  dc.l A_3Dbutton
[000b1364]                           dc.w $29c1
[000b1366]                           dc.w $0178
[000b1368] 000630f2                  dc.l Auo_string
[000b136c] 000b0f4e                  dc.l TEXT_09
[000b1370]                           dc.w $0000
[000b1372]                           dc.w $0000
[000b1374]                           dc.w $0000
[000b1376]                           dc.w $0000
[000b1378]                           dc.w $0000
[000b137a]                           dc.w $0000
[000b137c]                           dc.w $0000
[000b137e]                           dc.w $0000
A_3DBUTTON04:
[000b1380] 00064a22                  dc.l A_3Dbutton
[000b1384]                           dc.w $21f1
[000b1386]                           dc.w $01f8
[000b1388] 000630f2                  dc.l Auo_string
[000b138c]                           dc.w $0000
[000b138e]                           dc.w $0000
[000b1390]                           dc.w $0000
[000b1392]                           dc.w $0000
[000b1394]                           dc.w $0000
[000b1396]                           dc.w $0000
[000b1398]                           dc.w $0000
[000b139a]                           dc.w $0000
[000b139c]                           dc.w $0000
[000b139e]                           dc.w $0000
A_3DBUTTON05:
[000b13a0] 00064a22                  dc.l A_3Dbutton
[000b13a4]                           dc.w $29c1
[000b13a6]                           dc.w $0178
[000b13a8] 000630f2                  dc.l Auo_string
[000b13ac] 000b0f01                  dc.l TEXT_019
[000b13b0]                           dc.w $0000
[000b13b2]                           dc.w $0000
[000b13b4]                           dc.w $0000
[000b13b6]                           dc.w $0000
[000b13b8]                           dc.w $0000
[000b13ba]                           dc.w $0000
[000b13bc]                           dc.w $0000
[000b13be]                           dc.w $0000
A_3DBUTTON06:
[000b13c0] 00064a22                  dc.l A_3Dbutton
[000b13c4]                           dc.w $29c1
[000b13c6]                           dc.w $0178
[000b13c8] 000630f2                  dc.l Auo_string
[000b13cc] 000b0ef2                  dc.l TEXT_004
[000b13d0]                           dc.w $0000
[000b13d2]                           dc.w $0000
[000b13d4]                           dc.w $0000
[000b13d6]                           dc.w $0000
[000b13d8]                           dc.w $0000
[000b13da]                           dc.w $0000
[000b13dc]                           dc.w $0000
[000b13de]                           dc.w $0000
A_3DBUTTON07:
[000b13e0] 00064a22                  dc.l A_3Dbutton
[000b13e4]                           dc.w $29c1
[000b13e6]                           dc.w $0178
[000b13e8] 000630f2                  dc.l Auo_string
[000b13ec] 000b0eef                  dc.l TEXT_003
[000b13f0]                           dc.w $0000
[000b13f2]                           dc.w $0000
[000b13f4]                           dc.w $0000
[000b13f6]                           dc.w $0000
[000b13f8]                           dc.w $0000
[000b13fa]                           dc.w $0000
[000b13fc]                           dc.w $0000
[000b13fe]                           dc.w $0000
A_3DBUTTON08:
[000b1400] 00064a22                  dc.l A_3Dbutton
[000b1404]                           dc.w $2100
[000b1406]                           dc.w $0178
[000b1408] 000630f2                  dc.l Auo_string
[000b140c]                           dc.w $0000
[000b140e]                           dc.w $0000
[000b1410]                           dc.w $0000
[000b1412]                           dc.w $0000
[000b1414]                           dc.w $0000
[000b1416]                           dc.w $0000
[000b1418]                           dc.w $0000
[000b141a]                           dc.w $0000
[000b141c]                           dc.w $0000
[000b141e]                           dc.w $0000
A_3DBUTTON09:
[000b1420] 00064a22                  dc.l A_3Dbutton
[000b1424]                           dc.w $29c1
[000b1426]                           dc.w $0178
[000b1428] 000630f2                  dc.l Auo_string
[000b142c] 000b0f56                  dc.l TEXT_10
[000b1430]                           dc.w $0000
[000b1432]                           dc.w $0000
[000b1434]                           dc.w $0000
[000b1436]                           dc.w $0000
[000b1438]                           dc.w $0000
[000b143a]                           dc.w $0000
[000b143c]                           dc.w $0000
[000b143e]                           dc.w $0000
A_3DBUTTON13:
[000b1440] 00064a22                  dc.l A_3Dbutton
[000b1444]                           dc.w $2022
[000b1446]                           dc.w $9198
[000b1448] 000630f2                  dc.l Auo_string
[000b144c]                           dc.w $0000
[000b144e]                           dc.w $0000
[000b1450]                           dc.w $0000
[000b1452]                           dc.w $0000
[000b1454]                           dc.w $0000
[000b1456]                           dc.w $0000
[000b1458]                           dc.w $0000
[000b145a]                           dc.w $0000
[000b145c]                           dc.w $0000
[000b145e]                           dc.w $0000
A_3DBUTTON14:
[000b1460] 00064a22                  dc.l A_3Dbutton
[000b1464]                           dc.w $a021
[000b1466]                           dc.w $91f8
[000b1468] 000630f2                  dc.l Auo_string
[000b146c]                           dc.w $0000
[000b146e]                           dc.w $0000
[000b1470]                           dc.w $0000
[000b1472]                           dc.w $0000
[000b1474]                           dc.w $0000
[000b1476]                           dc.w $0000
[000b1478]                           dc.w $0000
[000b147a]                           dc.w $0000
[000b147c]                           dc.w $0000
[000b147e]                           dc.w $0000
A_3DBUTTON17:
[000b1480] 00064a22                  dc.l A_3Dbutton
[000b1484]                           dc.w $29f1
[000b1486]                           dc.w $01f8
[000b1488] 000630f2                  dc.l Auo_string
[000b148c]                           dc.w $0000
[000b148e]                           dc.w $0000
[000b1490]                           dc.w $0000
[000b1492]                           dc.w $0000
[000b1494]                           dc.w $0000
[000b1496]                           dc.w $0000
[000b1498]                           dc.w $0000
[000b149a]                           dc.w $0000
[000b149c]                           dc.w $0000
[000b149e]                           dc.w $0000
A_3DBUTTON27:
[000b14a0] 00064a22                  dc.l A_3Dbutton
[000b14a4]                           dc.w $09f1
[000b14a6]                           dc.w $0178
[000b14a8] 000630f2                  dc.l Auo_string
[000b14ac]                           dc.w $0000
[000b14ae]                           dc.w $0000
[000b14b0]                           dc.w $0000
[000b14b2]                           dc.w $0000
[000b14b4]                           dc.w $0000
[000b14b6]                           dc.w $0000
[000b14b8]                           dc.w $0000
[000b14ba]                           dc.w $0000
[000b14bc]                           dc.w $0000
[000b14be]                           dc.w $0000
A_ARROWS02:
[000b14c0] 00065c72                  dc.l A_arrows
[000b14c4]                           dc.w $1301
[000b14c6]                           dc.w $0001
[000b14c8]                           dc.w $0000
[000b14ca]                           dc.w $0000
[000b14cc]                           dc.w $0000
[000b14ce]                           dc.w $0000
[000b14d0]                           dc.w $0000
[000b14d2]                           dc.w $0000
[000b14d4]                           dc.w $0000
[000b14d6]                           dc.w $0000
[000b14d8]                           dc.w $0000
[000b14da]                           dc.w $0000
[000b14dc]                           dc.w $0000
[000b14de]                           dc.w $0000
A_BOXED03:
[000b14e0] 0006afea                  dc.l A_boxed
[000b14e4]                           dc.w $9070
[000b14e6]                           dc.w $0512
[000b14e8] 0006a068                  dc.l Auo_boxed
[000b14ec]                           dc.w $0000
[000b14ee]                           dc.w $0000
[000b14f0]                           dc.w $0000
[000b14f2]                           dc.w $0000
[000b14f4]                           dc.w $0000
[000b14f6]                           dc.w $0000
[000b14f8]                           dc.w $0000
[000b14fa]                           dc.w $0000
[000b14fc]                           dc.w $0000
[000b14fe]                           dc.w $0000
A_INNERFRAME02:
[000b1500] 00064256                  dc.l A_innerframe
[000b1504]                           dc.w $1000
[000b1506]                           dc.w $8f19
[000b1508] 000630f2                  dc.l Auo_string
[000b150c] 000b0f0a                  dc.l TEXT_02
[000b1510]                           dc.w $0000
[000b1512]                           dc.w $0000
[000b1514]                           dc.w $0000
[000b1516]                           dc.w $0000
[000b1518]                           dc.w $0000
[000b151a]                           dc.w $0000
[000b151c]                           dc.w $0000
[000b151e]                           dc.w $0000
A_INNERFRAME03:
[000b1520] 00064256                  dc.l A_innerframe
[000b1524]                           dc.w $1000
[000b1526]                           dc.w $8f19
[000b1528] 000630f2                  dc.l Auo_string
[000b152c] 000b0f1b                  dc.l TEXT_04
[000b1530]                           dc.w $0000
[000b1532]                           dc.w $0000
[000b1534]                           dc.w $0000
[000b1536]                           dc.w $0000
[000b1538]                           dc.w $0000
[000b153a]                           dc.w $0000
[000b153c]                           dc.w $0000
[000b153e]                           dc.w $0000
A_INNERFRAME04:
[000b1540] 00064256                  dc.l A_innerframe
[000b1544]                           dc.w $1000
[000b1546]                           dc.w $8f19
[000b1548] 000630f2                  dc.l Auo_string
[000b154c] 000b0f12                  dc.l TEXT_03
[000b1550]                           dc.w $0000
[000b1552]                           dc.w $0000
[000b1554]                           dc.w $0000
[000b1556]                           dc.w $0000
[000b1558]                           dc.w $0000
[000b155a]                           dc.w $0000
[000b155c]                           dc.w $0000
[000b155e]                           dc.w $0000
EDIM_BITMAP01:
[000b1560] 00021f4c                  dc.l edim_bitmap
[000b1564]                           dc.w $0000
[000b1566]                           dc.w $0000
[000b1568]                           dc.w $0000
[000b156a]                           dc.w $0000
[000b156c]                           dc.w $0000
[000b156e]                           dc.w $0000
[000b1570]                           dc.w $0000
[000b1572]                           dc.w $0000
[000b1574]                           dc.w $0000
[000b1576]                           dc.w $0000
[000b1578]                           dc.w $0000
[000b157a]                           dc.w $0000
[000b157c]                           dc.w $0000
[000b157e]                           dc.w $0000
USER_001:
[000b1580] 0002ccba                  dc.l user_control
[000b1584]                           dc.w $0000
[000b1586]                           dc.w $0000
[000b1588]                           dc.w $0000
[000b158a]                           dc.w $0000
[000b158c]                           dc.w $0000
[000b158e]                           dc.w $0000
[000b1590]                           dc.w $0000
[000b1592]                           dc.w $0000
[000b1594]                           dc.w $0000
[000b1596]                           dc.w $0000
[000b1598]                           dc.w $0000
[000b159a]                           dc.w $0000
[000b159c]                           dc.w $0000
[000b159e]                           dc.w $0000
_C4_IC_IMAGE:
[000b15a0]                           dc.w $0004
[000b15a2] 000b0f82                  dc.l $000b0f82
[000b15a6] 000b123a                  dc.l DATAS_14
[000b15aa]                           dc.w $0000
[000b15ac]                           dc.w $0000
[000b15ae]                           dc.w $0000
[000b15b0]                           dc.w $0000
[000b15b2]                           dc.w $0000
[000b15b4]                           dc.w $0000
_MSK_IC_IMAGE:
[000b15b6]                           dc.w $0000
[000b15b8]                           dc.w $0000
[000b15ba]                           dc.w $0000
[000b15bc]                           dc.w $7fff
[000b15be]                           dc.w $ffff
[000b15c0]                           dc.w $fffe
[000b15c2]                           dc.w $7fff
[000b15c4]                           dc.w $ffff
[000b15c6]                           dc.w $fffe
[000b15c8]                           dc.w $7fff
[000b15ca]                           dc.w $ffff
[000b15cc]                           dc.w $fffe
[000b15ce]                           dc.w $7fff
[000b15d0]                           dc.w $ffff
[000b15d2]                           dc.w $fffe
[000b15d4]                           dc.w $7fff
[000b15d6]                           dc.w $ffff
[000b15d8]                           dc.w $fffe
[000b15da]                           dc.w $7fff
[000b15dc]                           dc.w $ffff
[000b15de]                           dc.w $fffe
[000b15e0]                           dc.w $7fff
[000b15e2]                           dc.w $ffff
[000b15e4]                           dc.w $fffe
[000b15e6]                           dc.w $7fff
[000b15e8]                           dc.w $ffff
[000b15ea]                           dc.w $fffe
[000b15ec]                           dc.w $7fff
[000b15ee]                           dc.w $ffff
[000b15f0]                           dc.w $fffe
[000b15f2]                           dc.w $7fff
[000b15f4]                           dc.w $ffff
[000b15f6]                           dc.w $fffe
[000b15f8]                           dc.w $7fff
[000b15fa]                           dc.w $ffff
[000b15fc]                           dc.w $fffe
[000b15fe]                           dc.w $7fff
[000b1600]                           dc.w $ffff
[000b1602]                           dc.w $fffe
[000b1604]                           dc.w $7fff
[000b1606]                           dc.w $ffff
[000b1608]                           dc.w $fffe
[000b160a]                           dc.w $7fff
[000b160c]                           dc.w $ffff
[000b160e]                           dc.w $fffe
[000b1610]                           dc.w $7fff
[000b1612]                           dc.w $ffff
[000b1614]                           dc.w $fffe
[000b1616]                           dc.w $7fff
[000b1618]                           dc.w $ffff
[000b161a]                           dc.w $fffe
[000b161c]                           dc.w $7fff
[000b161e]                           dc.w $ffff
[000b1620]                           dc.w $fffe
[000b1622]                           dc.w $7fff
[000b1624]                           dc.w $ffff
[000b1626]                           dc.w $fffe
[000b1628]                           dc.w $7fff
[000b162a]                           dc.w $ffff
[000b162c]                           dc.w $fffe
[000b162e]                           dc.w $7fff
[000b1630]                           dc.w $ffff
[000b1632]                           dc.w $fffe
[000b1634]                           dc.w $7fff
[000b1636]                           dc.w $ffff
[000b1638]                           dc.w $fffe
[000b163a]                           dc.w $7fff
[000b163c]                           dc.w $ffff
[000b163e]                           dc.w $fffe
[000b1640]                           dc.w $7fff
[000b1642]                           dc.w $ffff
[000b1644]                           dc.w $fffe
[000b1646]                           dc.w $7fff
[000b1648]                           dc.w $ffff
[000b164a]                           dc.w $fffe
[000b164c]                           dc.w $7fff
[000b164e]                           dc.w $ffff
[000b1650]                           dc.w $fffe
[000b1652]                           dc.w $7fff
[000b1654]                           dc.w $ffff
[000b1656]                           dc.w $fffe
[000b1658]                           dc.w $7fff
[000b165a]                           dc.w $ffff
[000b165c]                           dc.w $fffe
[000b165e]                           dc.w $0000
[000b1660]                           dc.w $0000
[000b1662]                           dc.w $0000
_DAT_IC_IMAGE:
[000b1664]                           dc.w $0000
[000b1666]                           dc.w $0000
[000b1668]                           dc.w $0000
[000b166a]                           dc.w $7fff
[000b166c]                           dc.w $ffff
[000b166e]                           dc.w $fffe
[000b1670]                           dc.w $4000
[000b1672]                           dc.w $0000
[000b1674]                           dc.w $0002
[000b1676]                           dc.w $4000
[000b1678]                           dc.w $0000
[000b167a]                           dc.w $0002
[000b167c]                           dc.w $4000
[000b167e]                           dc.w $0000
[000b1680]                           dc.w $3802
[000b1682]                           dc.w $400f
[000b1684]                           dc.w $c000
[000b1686]                           dc.w $4402
[000b1688]                           dc.w $4000
[000b168a]                           dc.w $2c00
[000b168c]                           dc.w $4402
[000b168e]                           dc.w $4000
[000b1690]                           dc.w $03c0
[000b1692]                           dc.w $4402
[000b1694]                           dc.w $4000
[000b1696]                           dc.w $0000
[000b1698]                           dc.w $3802
[000b169a]                           dc.w $4018
[000b169c]                           dc.w $0000
[000b169e]                           dc.w $0002
[000b16a0]                           dc.w $4024
[000b16a2]                           dc.w $0000
[000b16a4]                           dc.w $0002
[000b16a6]                           dc.w $4024
[000b16a8]                           dc.w $8000
[000b16aa]                           dc.w $0002
[000b16ac]                           dc.b '@%@',0
[000b16b0]                           dc.w $0002
[000b16b2]                           dc.b '@&@',0
[000b16b6]                           dc.w $0002
[000b16b8]                           dc.b '@ @',0
[000b16bc]                           dc.w $3f02
[000b16be]                           dc.w $5ce0
[000b16c0]                           dc.w $800f
[000b16c2]                           dc.w $c082
[000b16c4]                           dc.w $4313
[000b16c6]                           dc.w $7830
[000b16c8]                           dc.w $0062
[000b16ca]                           dc.w $4014
[000b16cc]                           dc.w $07f0
[000b16ce]                           dc.w $001e
[000b16d0]                           dc.w $4014
[000b16d2]                           dc.w $000e
[000b16d4]                           dc.w $07e2
[000b16d6]                           dc.w $4014
[000b16d8]                           dc.w $0001
[000b16da]                           dc.w $f802
[000b16dc]                           dc.w $4014
[000b16de]                           dc.w $0000
[000b16e0]                           dc.w $0002
[000b16e2]                           dc.w $4000
[000b16e4]                           dc.w $0000
[000b16e6]                           dc.w $0002
[000b16e8]                           dc.w $4000
[000b16ea]                           dc.w $0080
[000b16ec]                           dc.w $0002
[000b16ee]                           dc.w $4000
[000b16f0]                           dc.w $00a0
[000b16f2]                           dc.w $0002
[000b16f4]                           dc.w $4000
[000b16f6]                           dc.w $0040
[000b16f8]                           dc.w $0002
[000b16fa]                           dc.w $4000
[000b16fc]                           dc.w $0040
[000b16fe]                           dc.w $0002
[000b1700]                           dc.w $4000
[000b1702]                           dc.w $0000
[000b1704]                           dc.w $0002
[000b1706]                           dc.w $7fff
[000b1708]                           dc.w $ffff
[000b170a]                           dc.w $fffe
[000b170c]                           dc.w $0000
[000b170e]                           dc.w $0000
[000b1710]                           dc.w $0000
IC_IMAGE:
[000b1712] 000b15b6                  dc.l _MSK_IC_IMAGE
[000b1716] 000b1664                  dc.l _DAT_IC_IMAGE
[000b171a] 000b0f75                  dc.l TEXT_208
[000b171e]                           dc.w $1000
[000b1720]                           dc.w $0000
[000b1722]                           dc.w $0000
[000b1724]                           dc.w $000c
[000b1726]                           dc.w $0000
[000b1728]                           dc.w $0030
[000b172a]                           dc.w $001d
[000b172c]                           dc.w $0000
[000b172e]                           dc.w $0020
[000b1730]                           dc.w $0048
[000b1732]                           dc.w $0008
[000b1734] 000b15a0                  dc.l _C4_IC_IMAGE
_IMG_IMAGE_001:
[000b1738]                           dc.w $07ff
[000b173a]                           dc.w $ffff
[000b173c]                           dc.w $ff80
[000b173e]                           dc.w $0c00
[000b1740]                           dc.w $0000
[000b1742]                           dc.w $00c0
[000b1744]                           dc.w $183f
[000b1746]                           dc.w $f03f
[000b1748]                           dc.w $f060
[000b174a]                           dc.w $187f
[000b174c]                           dc.w $f860
[000b174e]                           dc.w $1860
[000b1750]                           dc.w $187f
[000b1752]                           dc.w $f860
[000b1754]                           dc.w $1860
[000b1756]                           dc.w $187f
[000b1758]                           dc.w $f860
[000b175a]                           dc.w $1860
[000b175c]                           dc.w $187f
[000b175e]                           dc.w $f860
[000b1760]                           dc.w $1860
[000b1762]                           dc.w $187f
[000b1764]                           dc.w $f860
[000b1766]                           dc.w $1860
[000b1768]                           dc.w $187f
[000b176a]                           dc.w $f860
[000b176c]                           dc.w $1860
[000b176e]                           dc.w $187f
[000b1770]                           dc.w $f860
[000b1772]                           dc.w $1860
[000b1774]                           dc.w $187f
[000b1776]                           dc.w $f860
[000b1778]                           dc.w $1860
[000b177a]                           dc.w $187f
[000b177c]                           dc.w $f860
[000b177e]                           dc.w $1860
[000b1780]                           dc.w $187f
[000b1782]                           dc.w $f860
[000b1784]                           dc.w $1860
[000b1786]                           dc.w $187f
[000b1788]                           dc.w $f860
[000b178a]                           dc.w $1860
[000b178c]                           dc.w $183f
[000b178e]                           dc.w $f03f
[000b1790]                           dc.w $f060
[000b1792]                           dc.w $0c00
[000b1794]                           dc.w $0000
[000b1796]                           dc.w $00c0
[000b1798]                           dc.w $07ff
[000b179a]                           dc.w $ffff
[000b179c]                           dc.w $ff80
[000b179e]                           dc.w $0000
[000b17a0]                           dc.w $0000
[000b17a2]                           dc.w $0000
[000b17a4]                           dc.w $3f30
[000b17a6]                           dc.w $c787
[000b17a8]                           dc.w $8fe0
[000b17aa]                           dc.w $0c39
[000b17ac]                           dc.w $cccc
[000b17ae]                           dc.w $cc00
[000b17b0]                           dc.w $0c36
[000b17b2]                           dc.w $cfcc
[000b17b4]                           dc.w $0f80
[000b17b6]                           dc.w $0c30
[000b17b8]                           dc.w $cccd
[000b17ba]                           dc.w $cc00
[000b17bc]                           dc.w $3f30
[000b17be]                           dc.w $ccc7
[000b17c0]                           dc.w $cfe0
[000b17c2]                           dc.w $0000
[000b17c4]                           dc.w $0000
[000b17c6]                           dc.w $0000
IMAGE_001:
[000b17c8] 000b1738                  dc.l _IMG_IMAGE_001
[000b17cc]                           dc.w $0006
[000b17ce]                           dc.w $0018
[000b17d0]                           dc.w $0000
[000b17d2]                           dc.w $0000
[000b17d4]                           dc.w $0001
EDIT_IMAGE:
[000b17d6]                           dc.w $ffff
[000b17d8]                           dc.w $0001
[000b17da]                           dc.w $0014
[000b17dc]                           dc.w $0018
[000b17de]                           dc.w $0040
[000b17e0]                           dc.w $0010
[000b17e2] 000b1380                  dc.l A_3DBUTTON04
[000b17e6]                           dc.w $0000
[000b17e8]                           dc.w $0000
[000b17ea]                           dc.w $0036
[000b17ec]                           dc.w $000e
_01_EDIT_IMAGE:
[000b17ee]                           dc.w $0006
[000b17f0]                           dc.w $0003
[000b17f2]                           dc.w $0003
[000b17f4]                           dc.w $0018
[000b17f6]                           dc.w $1000
[000b17f8]                           dc.w $0010
[000b17fa] 000b1440                  dc.l A_3DBUTTON13
[000b17fe]                           dc.w $0002
[000b1800]                           dc.w $0001
[000b1802]                           dc.w $0018
[000b1804]                           dc.w $000c
_01aEDIT_IMAGE:
[000b1806]                           dc.w $0000
[000b1808]                           dc.w $0000
[000b180a] 00021e62                  dc.l edim_acc
[000b180e]                           dc.w $8000
[000b1810]                           dc.w $0000
[000b1812]                           dc.w $0000
[000b1814]                           dc.w $0000
[000b1816]                           dc.w $0000
[000b1818]                           dc.w $0000
[000b181a]                           dc.w $0000
[000b181c]                           dc.w $0000
_03_EDIT_IMAGE:
[000b181e]                           dc.w $0001
[000b1820]                           dc.w $0005
[000b1822]                           dc.w $0005
[000b1824]                           dc.w $0017
[000b1826]                           dc.w $0040
[000b1828]                           dc.w $0000
[000b182a] 000b17c8                  dc.l IMAGE_001
[000b182e]                           dc.w $0000
[000b1830]                           dc.w $0000
[000b1832]                           dc.w $0018
[000b1834]                           dc.w $000c
_03aEDIT_IMAGE:
[000b1836] 00021a0c                  dc.l edim_control
[000b183a]                           dc.w $0000
[000b183c]                           dc.w $0000
[000b183e]                           dc.w $8000
[000b1840]                           dc.w $0000
[000b1842]                           dc.w $0000
[000b1844]                           dc.w $0000
[000b1846]                           dc.w $0000
[000b1848]                           dc.w $0000
[000b184a]                           dc.w $0000
[000b184c]                           dc.w $0000
_05_EDIT_IMAGE:
[000b184e]                           dc.w $0003
[000b1850]                           dc.w $ffff
[000b1852]                           dc.w $ffff
[000b1854]                           dc.w $0018
[000b1856]                           dc.w $0080
[000b1858]                           dc.w $0011
[000b185a] 000b1580                  dc.l USER_001
[000b185e]                           dc.w $0003
[000b1860]                           dc.w $0001
[000b1862]                           dc.w $0009
[000b1864]                           dc.w $0004
_06_EDIT_IMAGE:
[000b1866]                           dc.w $0008
[000b1868]                           dc.w $0007
[000b186a]                           dc.w $0007
[000b186c]                           dc.w $001c
[000b186e]                           dc.w $0040
[000b1870]                           dc.w $0000
[000b1872] 000b0efa                  dc.l TEXT_01
[000b1876]                           dc.w $001b
[000b1878]                           dc.w $0001
[000b187a]                           dc.w $0007
[000b187c]                           dc.w $0001
_07_EDIT_IMAGE:
[000b187e]                           dc.w $0006
[000b1880]                           dc.w $ffff
[000b1882]                           dc.w $ffff
[000b1884]                           dc.w $0018
[000b1886]                           dc.w $0040
[000b1888]                           dc.w $0000
[000b188a] 000b14c0                  dc.l A_ARROWS02
[000b188e]                           dc.w $0000
[000b1890]                           dc.w $0000
[000b1892]                           dc.w $0001
[000b1894]                           dc.w $0001
_08_EDIT_IMAGE:
[000b1896]                           dc.w $000c
[000b1898]                           dc.w $000a
[000b189a]                           dc.w $000b
[000b189c]                           dc.w $0014
[000b189e]                           dc.w $0040
[000b18a0]                           dc.w $0020
[000b18a2]                           dc.w $00ff
[000b18a4]                           dc.w $1101
[000b18a6]                           dc.w $0023
[000b18a8]                           dc.w $0001
[000b18aa]                           dc.w $0012
[000b18ac]                           dc.w $0001
_08aEDIT_IMAGE:
[000b18ae] 000213f4                  dc.l edim_col
[000b18b2]                           dc.w $0000
[000b18b4]                           dc.w $0000
[000b18b6]                           dc.w $8000
[000b18b8]                           dc.w $8846
[000b18ba]                           dc.w $0000
[000b18bc]                           dc.w $0000
[000b18be]                           dc.w $0000
[000b18c0]                           dc.w $0000
[000b18c2]                           dc.w $0000
[000b18c4]                           dc.w $0000
_10_EDIT_IMAGE:
[000b18c6]                           dc.w $000b
[000b18c8]                           dc.w $ffff
[000b18ca]                           dc.w $ffff
[000b18cc]                           dc.w $0014
[000b18ce]                           dc.w $0000
[000b18d0]                           dc.w $0000
[000b18d2]                           dc.w $0001
[000b18d4]                           dc.w $1171
[000b18d6]                           dc.w $0010
[000b18d8]                           dc.w $0000
[000b18da]                           dc.w $0002
[000b18dc]                           dc.w $0001
_11_EDIT_IMAGE:
[000b18de]                           dc.w $0008
[000b18e0]                           dc.w $ffff
[000b18e2]                           dc.w $ffff
[000b18e4]                           dc.w $0018
[000b18e6]                           dc.w $0000
[000b18e8]                           dc.w $0000
[000b18ea] 000b14a0                  dc.l A_3DBUTTON27
[000b18ee]                           dc.w $0000
[000b18f0]                           dc.w $0000
[000b18f2]                           dc.w $0010
[000b18f4]                           dc.w $0001
_12_EDIT_IMAGE:
[000b18f6]                           dc.w $000e
[000b18f8]                           dc.w $ffff
[000b18fa]                           dc.w $ffff
[000b18fc]                           dc.w $0018
[000b18fe]                           dc.w $0040
[000b1900]                           dc.w $0000
[000b1902] 000b1340                  dc.l A_3DBUTTON02
[000b1906]                           dc.w $0023
[000b1908]                           dc.w $0003
[000b190a]                           dc.w $0013
[000b190c]                           dc.w $0002
_12aEDIT_IMAGE:
[000b190e] 0002152c                  dc.l edim_nextpattern
[000b1912]                           dc.w $0000
[000b1914]                           dc.w $0000
[000b1916]                           dc.w $8000
[000b1918]                           dc.w $0000
[000b191a]                           dc.w $0000
[000b191c]                           dc.w $0000
[000b191e]                           dc.w $0000
[000b1920]                           dc.w $0000
[000b1922]                           dc.w $0000
[000b1924]                           dc.w $0000
_14_EDIT_IMAGE:
[000b1926]                           dc.w $0010
[000b1928]                           dc.w $ffff
[000b192a]                           dc.w $ffff
[000b192c]                           dc.w $0018
[000b192e]                           dc.w $0005
[000b1930]                           dc.w $0010
[000b1932] 000b1360                  dc.l A_3DBUTTON03
[000b1936]                           dc.w $001b
[000b1938]                           dc.w $0007
[000b193a]                           dc.w $000c
[000b193c]                           dc.w $0002
_14aEDIT_IMAGE:
[000b193e] 00022214                  dc.l edim_edit
[000b1942]                           dc.w $0000
[000b1944]                           dc.w $0000
[000b1946]                           dc.w $8000
[000b1948]                           dc.w $8845
[000b194a]                           dc.w $0000
[000b194c]                           dc.w $0000
[000b194e]                           dc.w $0000
[000b1950]                           dc.w $0000
[000b1952]                           dc.w $0000
[000b1954]                           dc.w $0000
_16_EDIT_IMAGE:
[000b1956]                           dc.w $0012
[000b1958]                           dc.w $ffff
[000b195a]                           dc.w $ffff
[000b195c]                           dc.w $0018
[000b195e]                           dc.w $0005
[000b1960]                           dc.w $0010
[000b1962] 000b1420                  dc.l A_3DBUTTON09
[000b1966]                           dc.w $0029
[000b1968]                           dc.w $0007
[000b196a]                           dc.w $000c
[000b196c]                           dc.w $0002
_16aEDIT_IMAGE:
[000b196e] 0002185a                  dc.l edim_direct
[000b1972]                           dc.w $0000
[000b1974]                           dc.w $0000
[000b1976]                           dc.w $8000
[000b1978]                           dc.w $8844
[000b197a]                           dc.w $0000
[000b197c]                           dc.w $0000
[000b197e]                           dc.w $0000
[000b1980]                           dc.w $0000
[000b1982]                           dc.w $0000
[000b1984]                           dc.w $0000
_18_EDIT_IMAGE:
[000b1986]                           dc.w $0014
[000b1988]                           dc.w $ffff
[000b198a]                           dc.w $ffff
[000b198c]                           dc.w $0018
[000b198e]                           dc.w $4007
[000b1990]                           dc.w $0010
[000b1992] 000b13e0                  dc.l A_3DBUTTON07
[000b1996]                           dc.w $001b
[000b1998]                           dc.w $000b
[000b199a]                           dc.w $000c
[000b199c]                           dc.w $0002
_18aEDIT_IMAGE:
[000b199e] 00021e40                  dc.l edim_ok
[000b19a2]                           dc.w $0000
[000b19a4]                           dc.w $0000
[000b19a6]                           dc.w $8000
[000b19a8]                           dc.w $884f
[000b19aa]                           dc.w $0000
[000b19ac]                           dc.w $0000
[000b19ae]                           dc.w $0000
[000b19b0]                           dc.w $0000
[000b19b2]                           dc.w $0000
[000b19b4]                           dc.w $0000
_20_EDIT_IMAGE:
[000b19b6]                           dc.w $0000
[000b19b8]                           dc.w $ffff
[000b19ba]                           dc.w $ffff
[000b19bc]                           dc.w $0018
[000b19be]                           dc.w $4005
[000b19c0]                           dc.w $0010
[000b19c2] 000b13c0                  dc.l A_3DBUTTON06
[000b19c6]                           dc.w $0029
[000b19c8]                           dc.w $000b
[000b19ca]                           dc.w $000c
[000b19cc]                           dc.w $0002
_20aEDIT_IMAGE:
[000b19ce] 00021e2e                  dc.l edim_abort
[000b19d2]                           dc.w $0000
[000b19d4]                           dc.w $0000
[000b19d6]                           dc.w $8020
[000b19d8]                           dc.w $8841
[000b19da]                           dc.w $0000
[000b19dc]                           dc.w $0000
[000b19de]                           dc.w $0000
[000b19e0]                           dc.w $0000
[000b19e2]                           dc.w $0000
[000b19e4]                           dc.w $0000
EDIT_IMAGE2:
[000b19e6]                           dc.w $ffff
[000b19e8]                           dc.w $0001
[000b19ea]                           dc.w $0018
[000b19ec]                           dc.w $0018
[000b19ee]                           dc.w $0040
[000b19f0]                           dc.w $0010
[000b19f2] 000b1320                  dc.l A_3DBUTTON01
[000b19f6]                           dc.w $0000
[000b19f8]                           dc.w $0000
[000b19fa]                           dc.w $0032
[000b19fc]                           dc.w $0009
_01_EDIT_IMAGE2:
[000b19fe]                           dc.w $0003
[000b1a00]                           dc.w $0002
[000b1a02]                           dc.w $0002
[000b1a04]                           dc.w $0018
[000b1a06]                           dc.w $0000
[000b1a08]                           dc.w $0010
[000b1a0a] 000b1400                  dc.l A_3DBUTTON08
[000b1a0e]                           dc.w $0000
[000b1a10]                           dc.w $0000
[000b1a12]                           dc.w $0006
[000b1a14]                           dc.w $0003
_02_EDIT_IMAGE2:
[000b1a16]                           dc.w $0001
[000b1a18]                           dc.w $ffff
[000b1a1a]                           dc.w $ffff
[000b1a1c]                           dc.w $0014
[000b1a1e]                           dc.w $0000
[000b1a20]                           dc.w $0000
[000b1a22]                           dc.w $0001
[000b1a24]                           dc.w $1101
[000b1a26]                           dc.w $0002
[000b1a28]                           dc.w $0001
[000b1a2a]                           dc.w $0002
[000b1a2c]                           dc.w $0001
_03_EDIT_IMAGE2:
[000b1a2e]                           dc.w $0008
[000b1a30]                           dc.w $0004
[000b1a32]                           dc.w $0006
[000b1a34]                           dc.w $0018
[000b1a36]                           dc.w $0040
[000b1a38]                           dc.w $0000
[000b1a3a] 000b1500                  dc.l A_INNERFRAME02
[000b1a3e]                           dc.w $0006
[000b1a40]                           dc.w $0000
[000b1a42]                           dc.w $0009
[000b1a44]                           dc.w $0003
_04_EDIT_IMAGE2:
[000b1a46]                           dc.w $0006
[000b1a48]                           dc.w $ffff
[000b1a4a]                           dc.w $ffff
[000b1a4c]                           dc.w $0014
[000b1a4e]                           dc.w $0005
[000b1a50]                           dc.w $0000
[000b1a52]                           dc.w $0001
[000b1a54]                           dc.w $0171
[000b1a56]                           dc.w $0001
[000b1a58]                           dc.w $0001
[000b1a5a]                           dc.w $0003
[000b1a5c]                           dc.w $0001
_04aEDIT_IMAGE2:
[000b1a5e] 000214ba                  dc.l edim_black
[000b1a62]                           dc.w $0000
[000b1a64]                           dc.w $0000
[000b1a66]                           dc.w $8000
[000b1a68]                           dc.w $0053
[000b1a6a]                           dc.w $0000
[000b1a6c]                           dc.w $0000
[000b1a6e]                           dc.w $0000
[000b1a70]                           dc.w $0000
[000b1a72]                           dc.w $0000
[000b1a74]                           dc.w $0000
_06_EDIT_IMAGE2:
[000b1a76]                           dc.w $0003
[000b1a78]                           dc.w $ffff
[000b1a7a]                           dc.w $ffff
[000b1a7c]                           dc.w $0014
[000b1a7e]                           dc.w $0005
[000b1a80]                           dc.w $0000
[000b1a82]                           dc.w $0001
[000b1a84]                           dc.w $1170
[000b1a86]                           dc.w $0005
[000b1a88]                           dc.w $0001
[000b1a8a]                           dc.w $0003
[000b1a8c]                           dc.w $0001
_06aEDIT_IMAGE2:
[000b1a8e] 000214f6                  dc.l edim_white
[000b1a92]                           dc.w $0000
[000b1a94]                           dc.w $0000
[000b1a96]                           dc.w $8000
[000b1a98]                           dc.w $0057
[000b1a9a]                           dc.w $0000
[000b1a9c]                           dc.w $0000
[000b1a9e]                           dc.w $0000
[000b1aa0]                           dc.w $0000
[000b1aa2]                           dc.w $0000
[000b1aa4]                           dc.w $0000
_08_EDIT_IMAGE2:
[000b1aa6]                           dc.w $000d
[000b1aa8]                           dc.w $0009
[000b1aaa]                           dc.w $000b
[000b1aac]                           dc.w $0018
[000b1aae]                           dc.w $0040
[000b1ab0]                           dc.w $0000
[000b1ab2] 000b1520                  dc.l A_INNERFRAME03
[000b1ab6]                           dc.w $000f
[000b1ab8]                           dc.w $0000
[000b1aba]                           dc.w $000a
[000b1abc]                           dc.w $0003
_09_EDIT_IMAGE2:
[000b1abe]                           dc.w $000b
[000b1ac0]                           dc.w $ffff
[000b1ac2]                           dc.w $ffff
[000b1ac4]                           dc.w $0015
[000b1ac6]                           dc.w $0005
[000b1ac8]                           dc.w $0000
[000b1aca] 000b12e8                  dc.l TEDINFO_01
[000b1ace]                           dc.w $0001
[000b1ad0]                           dc.w $0001
[000b1ad2]                           dc.w $0005
[000b1ad4]                           dc.w $0001
_09aEDIT_IMAGE2:
[000b1ad6] 0002144a                  dc.l edim_thin
[000b1ada]                           dc.w $0000
[000b1adc]                           dc.w $0000
[000b1ade]                           dc.w $8000
[000b1ae0]                           dc.w $0044
[000b1ae2]                           dc.w $0000
[000b1ae4]                           dc.w $0000
[000b1ae6]                           dc.w $0000
[000b1ae8]                           dc.w $0000
[000b1aea]                           dc.w $0000
[000b1aec]                           dc.w $0000
_11_EDIT_IMAGE2:
[000b1aee]                           dc.w $0008
[000b1af0]                           dc.w $ffff
[000b1af2]                           dc.w $ffff
[000b1af4]                           dc.w $0015
[000b1af6]                           dc.w $0005
[000b1af8]                           dc.w $0000
[000b1afa] 000b1304                  dc.l TEDINFO_02
[000b1afe]                           dc.w $0005
[000b1b00]                           dc.w $0001
[000b1b02]                           dc.w $0004
[000b1b04]                           dc.w $0001
_11aEDIT_IMAGE2:
[000b1b06] 00021482                  dc.l edim_thick
[000b1b0a]                           dc.w $0000
[000b1b0c]                           dc.w $0000
[000b1b0e]                           dc.w $8000
[000b1b10]                           dc.w $0046
[000b1b12]                           dc.w $0000
[000b1b14]                           dc.w $0000
[000b1b16]                           dc.w $0000
[000b1b18]                           dc.w $0000
[000b1b1a]                           dc.w $0000
[000b1b1c]                           dc.w $0000
_13_EDIT_IMAGE2:
[000b1b1e]                           dc.w $0016
[000b1b20]                           dc.w $000e
[000b1b22]                           dc.w $0014
[000b1b24]                           dc.w $0018
[000b1b26]                           dc.w $0040
[000b1b28]                           dc.w $0000
[000b1b2a] 000b1540                  dc.l A_INNERFRAME04
[000b1b2e]                           dc.w $0019
[000b1b30]                           dc.w $0000
[000b1b32]                           dc.w $000a
[000b1b34]                           dc.w $0003
_14_EDIT_IMAGE2:
[000b1b36]                           dc.w $0010
[000b1b38]                           dc.w $ffff
[000b1b3a]                           dc.w $ffff
[000b1b3c]                           dc.w $001b
[000b1b3e]                           dc.w $0005
[000b1b40]                           dc.w $0000
[000b1b42]                           dc.w $0400
[000b1b44]                           dc.w $1101
[000b1b46]                           dc.w $0001
[000b1b48]                           dc.w $0001
[000b1b4a]                           dc.w $0002
[000b1b4c]                           dc.w $0001
_14aEDIT_IMAGE2:
[000b1b4e] 000216da                  dc.l edim_left
[000b1b52]                           dc.w $0000
[000b1b54]                           dc.w $0000
[000b1b56]                           dc.w $8000
[000b1b58]                           dc.w $8004
[000b1b5a]                           dc.w $0000
[000b1b5c]                           dc.w $0000
[000b1b5e]                           dc.w $0000
[000b1b60]                           dc.w $0000
[000b1b62]                           dc.w $0000
[000b1b64]                           dc.w $0000
_16_EDIT_IMAGE2:
[000b1b66]                           dc.w $0012
[000b1b68]                           dc.w $ffff
[000b1b6a]                           dc.w $ffff
[000b1b6c]                           dc.w $001b
[000b1b6e]                           dc.w $0005
[000b1b70]                           dc.w $0000
[000b1b72]                           dc.w $0100
[000b1b74]                           dc.w $1101
[000b1b76]                           dc.w $0003
[000b1b78]                           dc.w $0001
[000b1b7a]                           dc.w $0002
[000b1b7c]                           dc.w $0001
_16aEDIT_IMAGE2:
[000b1b7e] 00021572                  dc.l edim_up
[000b1b82]                           dc.w $0000
[000b1b84]                           dc.w $0000
[000b1b86]                           dc.w $8000
[000b1b88]                           dc.w $8001
[000b1b8a]                           dc.w $0000
[000b1b8c]                           dc.w $0000
[000b1b8e]                           dc.w $0000
[000b1b90]                           dc.w $0000
[000b1b92]                           dc.w $0000
[000b1b94]                           dc.w $0000
_18_EDIT_IMAGE2:
[000b1b96]                           dc.w $0014
[000b1b98]                           dc.w $ffff
[000b1b9a]                           dc.w $ffff
[000b1b9c]                           dc.w $001b
[000b1b9e]                           dc.w $0005
[000b1ba0]                           dc.w $0000
[000b1ba2]                           dc.w $0200
[000b1ba4]                           dc.w $1101
[000b1ba6]                           dc.w $0005
[000b1ba8]                           dc.w $0001
[000b1baa]                           dc.w $0002
[000b1bac]                           dc.w $0001
_18aEDIT_IMAGE2:
[000b1bae] 000215f2                  dc.l edim_down
[000b1bb2]                           dc.w $0000
[000b1bb4]                           dc.w $0000
[000b1bb6]                           dc.w $8000
[000b1bb8]                           dc.w $8002
[000b1bba]                           dc.w $0000
[000b1bbc]                           dc.w $0000
[000b1bbe]                           dc.w $0000
[000b1bc0]                           dc.w $0000
[000b1bc2]                           dc.w $0000
[000b1bc4]                           dc.w $0000
_20_EDIT_IMAGE2:
[000b1bc6]                           dc.w $000d
[000b1bc8]                           dc.w $ffff
[000b1bca]                           dc.w $ffff
[000b1bcc]                           dc.w $001b
[000b1bce]                           dc.w $0005
[000b1bd0]                           dc.w $0000
[000b1bd2]                           dc.w $0300
[000b1bd4]                           dc.w $1101
[000b1bd6]                           dc.w $0007
[000b1bd8]                           dc.w $0001
[000b1bda]                           dc.w $0002
[000b1bdc]                           dc.w $0001
_20aEDIT_IMAGE2:
[000b1bde] 0002166e                  dc.l edim_right
[000b1be2]                           dc.w $0000
[000b1be4]                           dc.w $0000
[000b1be6]                           dc.w $8000
[000b1be8]                           dc.w $8003
[000b1bea]                           dc.w $0000
[000b1bec]                           dc.w $0000
[000b1bee]                           dc.w $0000
[000b1bf0]                           dc.w $0000
[000b1bf2]                           dc.w $0000
[000b1bf4]                           dc.w $0000
_22_EDIT_IMAGE2:
[000b1bf6]                           dc.w $0018
[000b1bf8]                           dc.w $ffff
[000b1bfa]                           dc.w $ffff
[000b1bfc]                           dc.w $0018
[000b1bfe]                           dc.w $0007
[000b1c00]                           dc.w $0010
[000b1c02] 000b13a0                  dc.l A_3DBUTTON05
[000b1c06]                           dc.w $0024
[000b1c08]                           dc.w $0001
[000b1c0a]                           dc.w $000c
[000b1c0c]                           dc.w $0002
_22aEDIT_IMAGE2:
[000b1c0e] 00022102                  dc.l edim_struct
[000b1c12]                           dc.w $0000
[000b1c14]                           dc.w $0000
[000b1c16]                           dc.w $8000
[000b1c18]                           dc.w $8853
[000b1c1a]                           dc.w $0000
[000b1c1c]                           dc.w $0000
[000b1c1e]                           dc.w $0000
[000b1c20]                           dc.w $0000
[000b1c22]                           dc.w $0000
[000b1c24]                           dc.w $0000
_24_EDIT_IMAGE2:
[000b1c26]                           dc.w $0000
[000b1c28]                           dc.w $0019
[000b1c2a]                           dc.w $0019
[000b1c2c]                           dc.w $0018
[000b1c2e]                           dc.w $0000
[000b1c30]                           dc.w $0010
[000b1c32] 000b1460                  dc.l A_3DBUTTON14
[000b1c36]                           dc.w $0002
[000b1c38]                           dc.w $0004
[000b1c3a]                           dc.w $000e
[000b1c3c]                           dc.w $0004
_25_EDIT_IMAGE2:
[000b1c3e]                           dc.w $0018
[000b1c40]                           dc.w $ffff
[000b1c42]                           dc.w $ffff
[000b1c44]                           dc.w $0018
[000b1c46]                           dc.w $0040
[000b1c48]                           dc.w $0000
[000b1c4a] 000b1560                  dc.l EDIM_BITMAP01
[000b1c4e]                           dc.w $0000
[000b1c50]                           dc.w $0000
[000b1c52]                           dc.w $000e
[000b1c54]                           dc.w $0004
_25aEDIT_IMAGE2:
[000b1c56] 00021b7a                  dc.l edim_set
[000b1c5a]                           dc.w $0000
[000b1c5c]                           dc.w $0000
[000b1c5e]                           dc.w $8020
[000b1c60]                           dc.w $0000
[000b1c62]                           dc.w $0000
[000b1c64]                           dc.w $0000
[000b1c66]                           dc.w $0000
[000b1c68]                           dc.w $0000
[000b1c6a]                           dc.w $0008
[000b1c6c]                           dc.w $0000
IM_POS:
[000b1c6e]                           dc.w $ffff
[000b1c70]                           dc.w $0001
[000b1c72]                           dc.w $0001
[000b1c74]                           dc.w $0019
[000b1c76]                           dc.w $0000
[000b1c78]                           dc.w $0000
[000b1c7a]                           dc.w $00ff
[000b1c7c]                           dc.w $1141
[000b1c7e]                           dc.w $0000
[000b1c80]                           dc.w $0000
[000b1c82]                           dc.w $001a
[000b1c84]                           dc.w $0006
_01_IM_POS:
[000b1c86]                           dc.w $0000
[000b1c88]                           dc.w $0002
[000b1c8a]                           dc.w $0009
[000b1c8c]                           dc.w $0018
[000b1c8e]                           dc.w $0040
[000b1c90]                           dc.w $0010
[000b1c92] 000b1480                  dc.l A_3DBUTTON17
[000b1c96]                           dc.w $0000
[000b1c98]                           dc.w $0000
[000b1c9a]                           dc.w $001a
[000b1c9c]                           dc.w $0006
_02_IM_POS:
[000b1c9e]                           dc.w $0003
[000b1ca0]                           dc.w $ffff
[000b1ca2]                           dc.w $ffff
[000b1ca4]                           dc.w $001c
[000b1ca6]                           dc.w $0000
[000b1ca8]                           dc.w $0000
[000b1caa] 000b0f23                  dc.l TEXT_05
[000b1cae]                           dc.w $0001
[000b1cb0]                           dc.w $0001
[000b1cb2]                           dc.w $0007
[000b1cb4]                           dc.w $0001
_03_IM_POS:
[000b1cb6]                           dc.w $0004
[000b1cb8]                           dc.w $ffff
[000b1cba]                           dc.w $ffff
[000b1cbc]                           dc.w $0018
[000b1cbe]                           dc.w $0008
[000b1cc0]                           dc.w $0010
[000b1cc2] 000b14e0                  dc.l A_BOXED03
[000b1cc6]                           dc.w $0015
[000b1cc8]                           dc.w $0001
[000b1cca]                           dc.w $0004
[000b1ccc]                           dc.w $0001
_04_IM_POS:
[000b1cce]                           dc.w $0006
[000b1cd0]                           dc.w $ffff
[000b1cd2]                           dc.w $ffff
[000b1cd4]                           dc.w $0018
[000b1cd6]                           dc.w $4007
[000b1cd8]                           dc.w $0010
[000b1cda] 000b13e0                  dc.l A_3DBUTTON07
[000b1cde]                           dc.w $0002
[000b1ce0]                           dc.w $0003
[000b1ce2]                           dc.w $000a
[000b1ce4]                           dc.w $0002
_04aIM_POS:
[000b1ce6]                           dc.w $0000
[000b1ce8]                           dc.w $0000
[000b1cea]                           dc.w $0000
[000b1cec]                           dc.w $0000
[000b1cee]                           dc.w $8000
[000b1cf0]                           dc.w $884f
[000b1cf2]                           dc.w $0000
[000b1cf4]                           dc.w $0000
[000b1cf6]                           dc.w $0000
[000b1cf8]                           dc.w $0000
[000b1cfa]                           dc.w $0000
[000b1cfc]                           dc.w $0000
_06_IM_POS:
[000b1cfe]                           dc.w $0008
[000b1d00]                           dc.w $ffff
[000b1d02]                           dc.w $ffff
[000b1d04]                           dc.w $0018
[000b1d06]                           dc.w $4005
[000b1d08]                           dc.w $0010
[000b1d0a] 000b13c0                  dc.l A_3DBUTTON06
[000b1d0e]                           dc.w $000e
[000b1d10]                           dc.w $0003
[000b1d12]                           dc.w $000a
[000b1d14]                           dc.w $0002
_06aIM_POS:
[000b1d16]                           dc.w $0000
[000b1d18]                           dc.w $0000
[000b1d1a]                           dc.w $0000
[000b1d1c]                           dc.w $0000
[000b1d1e]                           dc.w $8000
[000b1d20]                           dc.w $8841
[000b1d22]                           dc.w $0000
[000b1d24]                           dc.w $0000
[000b1d26]                           dc.w $0000
[000b1d28]                           dc.w $0000
[000b1d2a]                           dc.w $0000
[000b1d2c]                           dc.w $0000
_08_IM_POS:
[000b1d2e]                           dc.w $0009
[000b1d30]                           dc.w $ffff
[000b1d32]                           dc.w $ffff
[000b1d34]                           dc.w $001c
[000b1d36]                           dc.w $0000
[000b1d38]                           dc.w $0000
[000b1d3a] 000b0f2b                  dc.l TEXT_06
[000b1d3e]                           dc.w $000e
[000b1d40]                           dc.w $0001
[000b1d42]                           dc.w $0007
[000b1d44]                           dc.w $0001
_09_IM_POS:
[000b1d46]                           dc.w $0001
[000b1d48]                           dc.w $ffff
[000b1d4a]                           dc.w $ffff
[000b1d4c]                           dc.w $0018
[000b1d4e]                           dc.w $0028
[000b1d50]                           dc.w $0010
[000b1d52] 000b14e0                  dc.l A_BOXED03
[000b1d56]                           dc.w $0008
[000b1d58]                           dc.w $0001
[000b1d5a]                           dc.w $0004
[000b1d5c]                           dc.w $0001
WI_IMAGE:
[000b1d5e]                           dc.w $0000
[000b1d60]                           dc.w $0000
[000b1d62] 000224bc                  dc.l im_service
[000b1d66] 000223f6                  dc.l im_make
[000b1d6a] 00057428                  dc.l Awi_open
[000b1d6e] 00055e94                  dc.l Awi_init
[000b1d72] 000b17d6                  dc.l EDIT_IMAGE
[000b1d76]                           dc.w $0000
[000b1d78]                           dc.w $0000
[000b1d7a]                           dc.w $0000
[000b1d7c]                           dc.w $0000
[000b1d7e]                           dc.w $ffff
[000b1d80]                           dc.w $601f
[000b1d82]                           dc.w $0000
[000b1d84]                           dc.w $0000
[000b1d86]                           dc.w $0063
[000b1d88]                           dc.w $0063
[000b1d8a]                           dc.w $0000
[000b1d8c]                           dc.w $0000
[000b1d8e]                           dc.w $0000
[000b1d90]                           dc.w $0000
[000b1d92]                           dc.w $0000
[000b1d94]                           dc.w $0000
[000b1d96]                           dc.w $0000
[000b1d98]                           dc.w $0000
[000b1d9a]                           dc.w $ffff
[000b1d9c]                           dc.w $ffff
[000b1d9e]                           dc.w $ffff
[000b1da0]                           dc.w $ffff
[000b1da2]                           dc.w $0000
[000b1da4]                           dc.w $0000
[000b1da6]                           dc.w $fcf8
[000b1da8] 000b0f33                  dc.l TEXT_07
[000b1dac] 000b0eee                  dc.l TEXT_002
[000b1db0]                           dc.w $2710
[000b1db2]                           dc.w $0100
[000b1db4]                           dc.w $0000
[000b1db6]                           dc.w $ffff
[000b1db8] 000b1712                  dc.l IC_IMAGE
[000b1dbc]                           dc.w $0000
[000b1dbe]                           dc.w $0000
[000b1dc0] 0006b744                  dc.l Awi_keys
[000b1dc4] 00051852                  dc.l Awi_obchange
[000b1dc8] 00051c46                  dc.l Awi_redraw
[000b1dcc] 000587a4                  dc.l Awi_topped
[000b1dd0] 00058362                  dc.l Awi_closed
[000b1dd4] 000587ec                  dc.l Awi_fulled
[000b1dd8] 0005217c                  dc.l Awi_arrowed
[000b1ddc] 000524b4                  dc.l Awi_hslid
[000b1de0] 0005255e                  dc.l Awi_vslid
[000b1de4] 00058bb0                  dc.l Awi_sized
[000b1de8] 00058d50                  dc.l Awi_moved
[000b1dec] 0005998a                  dc.l Awi_iconify
[000b1df0] 00059c6c                  dc.l Awi_uniconify
[000b1df4] 0005b5b6                  dc.l Awi_gemscript
[000b1df8]                           dc.w $0000
[000b1dfa]                           dc.w $0000
[000b1dfc]                           dc.w $0000
[000b1dfe]                           dc.w $0000
WI_IMPOS:
[000b1e00]                           dc.w $0000
[000b1e02]                           dc.w $0000
[000b1e04] 00059dd0                  dc.l Awi_service
[000b1e08] 00056c16                  dc.l Awi_selfcreate
[000b1e0c] 00057428                  dc.l Awi_open
[000b1e10] 00055e94                  dc.l Awi_init
[000b1e14] 000b1c6e                  dc.l IM_POS
[000b1e18]                           dc.w $0000
[000b1e1a]                           dc.w $0000
[000b1e1c]                           dc.w $0000
[000b1e1e]                           dc.w $0000
[000b1e20]                           dc.w $ffff
[000b1e22]                           dc.w $200b
[000b1e24]                           dc.w $0000
[000b1e26]                           dc.w $0000
[000b1e28]                           dc.w $0078
[000b1e2a]                           dc.w $0032
[000b1e2c]                           dc.w $0000
[000b1e2e]                           dc.w $0000
[000b1e30]                           dc.w $0000
[000b1e32]                           dc.w $0000
[000b1e34]                           dc.w $0000
[000b1e36]                           dc.w $0000
[000b1e38]                           dc.w $0000
[000b1e3a]                           dc.w $0000
[000b1e3c]                           dc.w $ffff
[000b1e3e]                           dc.w $ffff
[000b1e40]                           dc.w $ffff
[000b1e42]                           dc.w $ffff
[000b1e44]                           dc.w $0000
[000b1e46]                           dc.w $0000
[000b1e48]                           dc.w $f8f8
[000b1e4a] 000b0f61                  dc.l TEXT_11
[000b1e4e] 000b0eee                  dc.l TEXT_002
[000b1e52]                           dc.w $2710
[000b1e54]                           dc.w $0000
[000b1e56]                           dc.w $0000
[000b1e58]                           dc.w $ffff
[000b1e5a]                           dc.w $0000
[000b1e5c]                           dc.w $0000
[000b1e5e]                           dc.w $0000
[000b1e60]                           dc.w $0000
[000b1e62] 0006b744                  dc.l Awi_keys
[000b1e66] 00051852                  dc.l Awi_obchange
[000b1e6a] 00051c46                  dc.l Awi_redraw
[000b1e6e] 000587a4                  dc.l Awi_topped
[000b1e72] 00058362                  dc.l Awi_closed
[000b1e76] 000587ec                  dc.l Awi_fulled
[000b1e7a] 0005217c                  dc.l Awi_arrowed
[000b1e7e] 000524b4                  dc.l Awi_hslid
[000b1e82] 0005255e                  dc.l Awi_vslid
[000b1e86] 00058bb0                  dc.l Awi_sized
[000b1e8a] 00058d50                  dc.l Awi_moved
[000b1e8e] 0005998a                  dc.l Awi_iconify
[000b1e92] 00059c6c                  dc.l Awi_uniconify
[000b1e96] 0005b5b6                  dc.l Awi_gemscript
[000b1e9a]                           dc.w $0000
[000b1e9c]                           dc.w $0000
[000b1e9e]                           dc.w $0000
[000b1ea0]                           dc.w $0000
oooo:
[000b1ea2]                           dc.w $0000
[000b1ea4]                           dc.w $0000
[000b1ea6]                           dc.w $0000
[000b1ea8]                           dc.w $0000
[000b1eaa]                           dc.w $0000
[000b1eac]                           dc.w $0000
[000b1eae]                           dc.w $0000
[000b1eb0]                           dc.w $0000
[000b1eb2]                           dc.w $0000
[000b1eb4]                           dc.w $0000
[000b1eb6]                           dc.w $0000
[000b1eb8]                           dc.w $0000
[000b1eba]                           dc.w $0000
[000b1ebc]                           dc.w $0000
[000b1ebe]                           dc.w $0000
[000b1ec0]                           dc.w $0000
oooi:
[000b1ec2]                           dc.w $0000
[000b1ec4]                           dc.w $0000
[000b1ec6]                           dc.w $0000
[000b1ec8]                           dc.w $00fe
[000b1eca]                           dc.w $0000
[000b1ecc]                           dc.w $00fe
[000b1ece]                           dc.w $0000
[000b1ed0]                           dc.w $00fe
[000b1ed2]                           dc.w $0000
[000b1ed4]                           dc.w $00fe
[000b1ed6]                           dc.w $0000
[000b1ed8]                           dc.w $00fe
[000b1eda]                           dc.w $0000
[000b1edc]                           dc.w $00fe
[000b1ede]                           dc.w $0000
[000b1ee0]                           dc.w $00fe
ooio:
[000b1ee2]                           dc.w $0000
[000b1ee4]                           dc.w $0000
[000b1ee6]                           dc.w $0000
[000b1ee8]                           dc.w $fe00
[000b1eea]                           dc.w $0000
[000b1eec]                           dc.w $fe00
[000b1eee]                           dc.w $0000
[000b1ef0]                           dc.w $fe00
[000b1ef2]                           dc.w $0000
[000b1ef4]                           dc.w $fe00
[000b1ef6]                           dc.w $0000
[000b1ef8]                           dc.w $fe00
[000b1efa]                           dc.w $0000
[000b1efc]                           dc.w $fe00
[000b1efe]                           dc.w $0000
[000b1f00]                           dc.w $fe00
ooii:
[000b1f02]                           dc.w $0000
[000b1f04]                           dc.w $0000
[000b1f06]                           dc.w $0000
[000b1f08]                           dc.w $fefe
[000b1f0a]                           dc.w $0000
[000b1f0c]                           dc.w $fefe
[000b1f0e]                           dc.w $0000
[000b1f10]                           dc.w $fefe
[000b1f12]                           dc.w $0000
[000b1f14]                           dc.w $fefe
[000b1f16]                           dc.w $0000
[000b1f18]                           dc.w $fefe
[000b1f1a]                           dc.w $0000
[000b1f1c]                           dc.w $fefe
[000b1f1e]                           dc.w $0000
[000b1f20]                           dc.w $fefe
oioo:
[000b1f22]                           dc.w $0000
[000b1f24]                           dc.w $0000
[000b1f26]                           dc.w $00fe
[000b1f28]                           dc.w $0000
[000b1f2a]                           dc.w $00fe
[000b1f2c]                           dc.w $0000
[000b1f2e]                           dc.w $00fe
[000b1f30]                           dc.w $0000
[000b1f32]                           dc.w $00fe
[000b1f34]                           dc.w $0000
[000b1f36]                           dc.w $00fe
[000b1f38]                           dc.w $0000
[000b1f3a]                           dc.w $00fe
[000b1f3c]                           dc.w $0000
[000b1f3e]                           dc.w $00fe
[000b1f40]                           dc.w $0000
oioi:
[000b1f42]                           dc.w $0000
[000b1f44]                           dc.w $0000
[000b1f46]                           dc.w $00fe
[000b1f48]                           dc.w $00fe
[000b1f4a]                           dc.w $00fe
[000b1f4c]                           dc.w $00fe
[000b1f4e]                           dc.w $00fe
[000b1f50]                           dc.w $00fe
[000b1f52]                           dc.w $00fe
[000b1f54]                           dc.w $00fe
[000b1f56]                           dc.w $00fe
[000b1f58]                           dc.w $00fe
[000b1f5a]                           dc.w $00fe
[000b1f5c]                           dc.w $00fe
[000b1f5e]                           dc.w $00fe
[000b1f60]                           dc.w $00fe
oiio:
[000b1f62]                           dc.w $0000
[000b1f64]                           dc.w $0000
[000b1f66]                           dc.w $00fe
[000b1f68]                           dc.w $fe00
[000b1f6a]                           dc.w $00fe
[000b1f6c]                           dc.w $fe00
[000b1f6e]                           dc.w $00fe
[000b1f70]                           dc.w $fe00
[000b1f72]                           dc.w $00fe
[000b1f74]                           dc.w $fe00
[000b1f76]                           dc.w $00fe
[000b1f78]                           dc.w $fe00
[000b1f7a]                           dc.w $00fe
[000b1f7c]                           dc.w $fe00
[000b1f7e]                           dc.w $00fe
[000b1f80]                           dc.w $fe00
oiii:
[000b1f82]                           dc.w $0000
[000b1f84]                           dc.w $0000
[000b1f86]                           dc.w $00fe
[000b1f88]                           dc.w $fefe
[000b1f8a]                           dc.w $00fe
[000b1f8c]                           dc.w $fefe
[000b1f8e]                           dc.w $00fe
[000b1f90]                           dc.w $fefe
[000b1f92]                           dc.w $00fe
[000b1f94]                           dc.w $fefe
[000b1f96]                           dc.w $00fe
[000b1f98]                           dc.w $fefe
[000b1f9a]                           dc.w $00fe
[000b1f9c]                           dc.w $fefe
[000b1f9e]                           dc.w $00fe
[000b1fa0]                           dc.w $fefe
iooo:
[000b1fa2]                           dc.w $0000
[000b1fa4]                           dc.w $0000
[000b1fa6]                           dc.w $fe00
[000b1fa8]                           dc.w $0000
[000b1faa]                           dc.w $fe00
[000b1fac]                           dc.w $0000
[000b1fae]                           dc.w $fe00
[000b1fb0]                           dc.w $0000
[000b1fb2]                           dc.w $fe00
[000b1fb4]                           dc.w $0000
[000b1fb6]                           dc.w $fe00
[000b1fb8]                           dc.w $0000
[000b1fba]                           dc.w $fe00
[000b1fbc]                           dc.w $0000
[000b1fbe]                           dc.w $fe00
[000b1fc0]                           dc.w $0000
iooi:
[000b1fc2]                           dc.w $0000
[000b1fc4]                           dc.w $0000
[000b1fc6]                           dc.w $fe00
[000b1fc8]                           dc.w $00fe
[000b1fca]                           dc.w $fe00
[000b1fcc]                           dc.w $00fe
[000b1fce]                           dc.w $fe00
[000b1fd0]                           dc.w $00fe
[000b1fd2]                           dc.w $fe00
[000b1fd4]                           dc.w $00fe
[000b1fd6]                           dc.w $fe00
[000b1fd8]                           dc.w $00fe
[000b1fda]                           dc.w $fe00
[000b1fdc]                           dc.w $00fe
[000b1fde]                           dc.w $fe00
[000b1fe0]                           dc.w $00fe
ioio:
[000b1fe2]                           dc.w $0000
[000b1fe4]                           dc.w $0000
[000b1fe6]                           dc.w $fe00
[000b1fe8]                           dc.w $fe00
[000b1fea]                           dc.w $fe00
[000b1fec]                           dc.w $fe00
[000b1fee]                           dc.w $fe00
[000b1ff0]                           dc.w $fe00
[000b1ff2]                           dc.w $fe00
[000b1ff4]                           dc.w $fe00
[000b1ff6]                           dc.w $fe00
[000b1ff8]                           dc.w $fe00
[000b1ffa]                           dc.w $fe00
[000b1ffc]                           dc.w $fe00
[000b1ffe]                           dc.w $fe00
[000b2000]                           dc.w $fe00
ioii:
[000b2002]                           dc.w $0000
[000b2004]                           dc.w $0000
[000b2006]                           dc.w $fe00
[000b2008]                           dc.w $fefe
[000b200a]                           dc.w $fe00
[000b200c]                           dc.w $fefe
[000b200e]                           dc.w $fe00
[000b2010]                           dc.w $fefe
[000b2012]                           dc.w $fe00
[000b2014]                           dc.w $fefe
[000b2016]                           dc.w $fe00
[000b2018]                           dc.w $fefe
[000b201a]                           dc.w $fe00
[000b201c]                           dc.w $fefe
[000b201e]                           dc.w $fe00
[000b2020]                           dc.w $fefe
iioo:
[000b2022]                           dc.w $0000
[000b2024]                           dc.w $0000
[000b2026]                           dc.w $fefe
[000b2028]                           dc.w $0000
[000b202a]                           dc.w $fefe
[000b202c]                           dc.w $0000
[000b202e]                           dc.w $fefe
[000b2030]                           dc.w $0000
[000b2032]                           dc.w $fefe
[000b2034]                           dc.w $0000
[000b2036]                           dc.w $fefe
[000b2038]                           dc.w $0000
[000b203a]                           dc.w $fefe
[000b203c]                           dc.w $0000
[000b203e]                           dc.w $fefe
[000b2040]                           dc.w $0000
iioi:
[000b2042]                           dc.w $0000
[000b2044]                           dc.w $0000
[000b2046]                           dc.w $fefe
[000b2048]                           dc.w $00fe
[000b204a]                           dc.w $fefe
[000b204c]                           dc.w $00fe
[000b204e]                           dc.w $fefe
[000b2050]                           dc.w $00fe
[000b2052]                           dc.w $fefe
[000b2054]                           dc.w $00fe
[000b2056]                           dc.w $fefe
[000b2058]                           dc.w $00fe
[000b205a]                           dc.w $fefe
[000b205c]                           dc.w $00fe
[000b205e]                           dc.w $fefe
[000b2060]                           dc.w $00fe
iiio:
[000b2062]                           dc.w $0000
[000b2064]                           dc.w $0000
[000b2066]                           dc.w $fefe
[000b2068]                           dc.w $fe00
[000b206a]                           dc.w $fefe
[000b206c]                           dc.w $fe00
[000b206e]                           dc.w $fefe
[000b2070]                           dc.w $fe00
[000b2072]                           dc.w $fefe
[000b2074]                           dc.w $fe00
[000b2076]                           dc.w $fefe
[000b2078]                           dc.w $fe00
[000b207a]                           dc.w $fefe
[000b207c]                           dc.w $fe00
[000b207e]                           dc.w $fefe
[000b2080]                           dc.w $fe00
iiii:
[000b2082]                           dc.w $0000
[000b2084]                           dc.w $0000
[000b2086]                           dc.w $fefe
[000b2088]                           dc.w $fefe
[000b208a]                           dc.w $fefe
[000b208c]                           dc.w $fefe
[000b208e]                           dc.w $fefe
[000b2090]                           dc.w $fefe
[000b2092]                           dc.w $fefe
[000b2094]                           dc.w $fefe
[000b2096]                           dc.w $fefe
[000b2098]                           dc.w $fefe
[000b209a]                           dc.w $fefe
[000b209c]                           dc.w $fefe
[000b209e]                           dc.w $fefe
[000b20a0]                           dc.w $fefe
the_mfdb:
[000b20a2]                           dc.w $0000
[000b20a4]                           dc.w $0000
[000b20a6]                           dc.w $0020
[000b20a8]                           dc.w $0008
[000b20aa]                           dc.w $0002
[000b20ac]                           dc.w $0001
[000b20ae]                           dc.w $0001
[000b20b0]                           dc.w $0000
[000b20b2]                           dc.w $0000
[000b20b4]                           dc.w $0000
color:
[000b20b6]                           dc.w $0001
[000b20b8]                           dc.w $0000
pic:
[000b20ba] 000b1ea2                  dc.l oooo
[000b20be] 000b1ec2                  dc.l oooi
[000b20c2] 000b1ee2                  dc.l ooio
[000b20c6] 000b1f02                  dc.l ooii
[000b20ca] 000b1f22                  dc.l oioo
[000b20ce] 000b1f42                  dc.l oioi
[000b20d2] 000b1f62                  dc.l oiio
[000b20d6] 000b1f82                  dc.l oiii
[000b20da] 000b1fa2                  dc.l iooo
[000b20de] 000b1fc2                  dc.l iooi
[000b20e2] 000b1fe2                  dc.l ioio
[000b20e6] 000b2002                  dc.l ioii
[000b20ea] 000b2022                  dc.l iioo
[000b20ee] 000b2042                  dc.l iioi
[000b20f2] 000b2062                  dc.l iiio
[000b20f6] 000b2082                  dc.l iiii
[000b20fa]                           dc.w $2564
[000b20fc]                           dc.w $0000
