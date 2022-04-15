align:
[0002544c] 48e7 1f20                 movem.l    d3-d7/a2,-(a7)
[00025450] 554f                      subq.w     #2,a7
[00025452] 2448                      movea.l    a0,a2
[00025454] 3c2a 000a                 move.w     10(a2),d6
[00025458] 3206                      move.w     d6,d1
[0002545a] 48c1                      ext.l      d1
[0002545c] 2001                      move.l     d1,d0
[0002545e] e788                      lsl.l      #3,d0
[00025460] 9081                      sub.l      d1,d0
[00025462] e788                      lsl.l      #3,d0
[00025464] 3632 080a                 move.w     10(a2,d0.l),d3
[00025468] 3003                      move.w     d3,d0
[0002546a] 48c0                      ext.l      d0
[0002546c] 2400                      move.l     d0,d2
[0002546e] e78a                      lsl.l      #3,d2
[00025470] 9480                      sub.l      d0,d2
[00025472] e78a                      lsl.l      #3,d2
[00025474] 3eb2 2818                 move.w     24(a2,d2.l),(a7)
[00025478] 3406                      move.w     d6,d2
[0002547a] 48c2                      ext.l      d2
[0002547c] 2202                      move.l     d2,d1
[0002547e] e789                      lsl.l      #3,d1
[00025480] 9282                      sub.l      d2,d1
[00025482] e789                      lsl.l      #3,d1
[00025484] 3c32 1808                 move.w     8(a2,d1.l),d6
[00025488] 2200                      move.l     d0,d1
[0002548a] e789                      lsl.l      #3,d1
[0002548c] 9280                      sub.l      d0,d1
[0002548e] e789                      lsl.l      #3,d1
[00025490] 3a32 180a                 move.w     10(a2,d1.l),d5
[00025494] 3205                      move.w     d5,d1
[00025496] 48c1                      ext.l      d1
[00025498] 2401                      move.l     d1,d2
[0002549a] e78a                      lsl.l      #3,d2
[0002549c] 9481                      sub.l      d1,d2
[0002549e] e78a                      lsl.l      #3,d2
[000254a0] 0272 dfff 2812            andi.w     #$DFFF,18(a2,d2.l)
[000254a6] 3406                      move.w     d6,d2
[000254a8] 48c2                      ext.l      d2
[000254aa] 2002                      move.l     d2,d0
[000254ac] e788                      lsl.l      #3,d0
[000254ae] 9082                      sub.l      d2,d0
[000254b0] e788                      lsl.l      #3,d0
[000254b2] 3c32 080a                 move.w     10(a2,d0.l),d6
[000254b6] 3406                      move.w     d6,d2
[000254b8] 48c2                      ext.l      d2
[000254ba] 2002                      move.l     d2,d0
[000254bc] e788                      lsl.l      #3,d0
[000254be] 9082                      sub.l      d2,d0
[000254c0] e788                      lsl.l      #3,d0
[000254c2] 3e32 080a                 move.w     10(a2,d0.l),d7
[000254c6] 3832 081c                 move.w     28(a2,d0.l),d4
[000254ca] 3407                      move.w     d7,d2
[000254cc] 48c2                      ext.l      d2
[000254ce] 2202                      move.l     d2,d1
[000254d0] e789                      lsl.l      #3,d1
[000254d2] 9282                      sub.l      d2,d1
[000254d4] e789                      lsl.l      #3,d1
[000254d6] 3584 181c                 move.w     d4,28(a2,d1.l)
[000254da] 3e32 1808                 move.w     8(a2,d1.l),d7
[000254de] 3407                      move.w     d7,d2
[000254e0] 48c2                      ext.l      d2
[000254e2] 2202                      move.l     d2,d1
[000254e4] e789                      lsl.l      #3,d1
[000254e6] 9282                      sub.l      d2,d1
[000254e8] e789                      lsl.l      #3,d1
[000254ea] 3584 181c                 move.w     d4,28(a2,d1.l)
[000254ee] 4244                      clr.w      d4
[000254f0] 6034                      bra.s      $00025526
[000254f2] 3205                      move.w     d5,d1
[000254f4] 48c1                      ext.l      d1
[000254f6] 2001                      move.l     d1,d0
[000254f8] e788                      lsl.l      #3,d0
[000254fa] 9081                      sub.l      d1,d0
[000254fc] e788                      lsl.l      #3,d0
[000254fe] 4272 081a                 clr.w      26(a2,d0.l)
[00025502] 3584 0818                 move.w     d4,24(a2,d0.l)
[00025506] 3404                      move.w     d4,d2
[00025508] d457                      add.w      (a7),d2
[0002550a] 3206                      move.w     d6,d1
[0002550c] 48c1                      ext.l      d1
[0002550e] 2e01                      move.l     d1,d7
[00025510] e78f                      lsl.l      #3,d7
[00025512] 9e81                      sub.l      d1,d7
[00025514] e78f                      lsl.l      #3,d7
[00025516] 3582 7818                 move.w     d2,24(a2,d7.l)
[0002551a] d872 081c                 add.w      28(a2,d0.l),d4
[0002551e] 3a32 0808                 move.w     8(a2,d0.l),d5
[00025522] 3c32 7808                 move.w     8(a2,d7.l),d6
[00025526] b645                      cmp.w      d5,d3
[00025528] 66c8                      bne.s      $000254F2
[0002552a] 3203                      move.w     d3,d1
[0002552c] 48c1                      ext.l      d1
[0002552e] 2001                      move.l     d1,d0
[00025530] e788                      lsl.l      #3,d0
[00025532] 9081                      sub.l      d1,d0
[00025534] e788                      lsl.l      #3,d0
[00025536] 3584 081c                 move.w     d4,28(a2,d0.l)
[0002553a] 544f                      addq.w     #2,a7
[0002553c] 4cdf 04f8                 movem.l    (a7)+,d3-d7/a2
[00025540] 4e75                      rts
find_drop:
[00025542] 48e7 1e20                 movem.l    d3-d6/a2,-(a7)
[00025546] 2448                      movea.l    a0,a2
[00025548] 3c00                      move.w     d0,d6
[0002554a] 7a01                      moveq.l    #1,d5
[0002554c] da6a 0002                 add.w      2(a2),d5
[00025550] 7201                      moveq.l    #1,d1
[00025552] 3005                      move.w     d5,d0
[00025554] 48c0                      ext.l      d0
[00025556] 2400                      move.l     d0,d2
[00025558] d482                      add.l      d2,d2
[0002555a] d480                      add.l      d0,d2
[0002555c] e78a                      lsl.l      #3,d2
[0002555e] d272 2802                 add.w      2(a2,d2.l),d1
[00025562] 3a01                      move.w     d1,d5
[00025564] 7601                      moveq.l    #1,d3
[00025566] 48c1                      ext.l      d1
[00025568] 2001                      move.l     d1,d0
[0002556a] d080                      add.l      d0,d0
[0002556c] d081                      add.l      d1,d0
[0002556e] e788                      lsl.l      #3,d0
[00025570] d672 0802                 add.w      2(a2,d0.l),d3
[00025574] 7801                      moveq.l    #1,d4
[00025576] 3003                      move.w     d3,d0
[00025578] 48c0                      ext.l      d0
[0002557a] 2400                      move.l     d0,d2
[0002557c] d482                      add.l      d2,d2
[0002557e] d480                      add.l      d0,d2
[00025580] e78a                      lsl.l      #3,d2
[00025582] d872 2802                 add.w      2(a2,d2.l),d4
[00025586] 7201                      moveq.l    #1,d1
[00025588] 3005                      move.w     d5,d0
[0002558a] 48c0                      ext.l      d0
[0002558c] 2400                      move.l     d0,d2
[0002558e] d482                      add.l      d2,d2
[00025590] d480                      add.l      d0,d2
[00025592] e78a                      lsl.l      #3,d2
[00025594] d272 2800                 add.w      0(a2,d2.l),d1
[00025598] 3a01                      move.w     d1,d5
[0002559a] 7001                      moveq.l    #1,d0
[0002559c] 48c1                      ext.l      d1
[0002559e] 2401                      move.l     d1,d2
[000255a0] d482                      add.l      d2,d2
[000255a2] d481                      add.l      d1,d2
[000255a4] e78a                      lsl.l      #3,d2
[000255a6] d072 2802                 add.w      2(a2,d2.l),d0
[000255aa] 3a00                      move.w     d0,d5
[000255ac] 6030                      bra.s      $000255DE
[000255ae] bc44                      cmp.w      d4,d6
[000255b0] 6604                      bne.s      $000255B6
[000255b2] 3005                      move.w     d5,d0
[000255b4] 6032                      bra.s      $000255E8
[000255b6] 7001                      moveq.l    #1,d0
[000255b8] 3404                      move.w     d4,d2
[000255ba] 48c2                      ext.l      d2
[000255bc] 2202                      move.l     d2,d1
[000255be] d281                      add.l      d1,d1
[000255c0] d282                      add.l      d2,d1
[000255c2] e789                      lsl.l      #3,d1
[000255c4] d072 1800                 add.w      0(a2,d1.l),d0
[000255c8] 3800                      move.w     d0,d4
[000255ca] 7201                      moveq.l    #1,d1
[000255cc] 3005                      move.w     d5,d0
[000255ce] 48c0                      ext.l      d0
[000255d0] 2400                      move.l     d0,d2
[000255d2] d482                      add.l      d2,d2
[000255d4] d480                      add.l      d0,d2
[000255d6] e78a                      lsl.l      #3,d2
[000255d8] d272 2800                 add.w      0(a2,d2.l),d1
[000255dc] 3a01                      move.w     d1,d5
[000255de] 7001                      moveq.l    #1,d0
[000255e0] d043                      add.w      d3,d0
[000255e2] b840                      cmp.w      d0,d4
[000255e4] 66c8                      bne.s      $000255AE
[000255e6] 70ff                      moveq.l    #-1,d0
[000255e8] 4cdf 0478                 movem.l    (a7)+,d3-d6/a2
[000255ec] 4e75                      rts
find_title:
[000255ee] 48e7 1e20                 movem.l    d3-d6/a2,-(a7)
[000255f2] 2448                      movea.l    a0,a2
[000255f4] 3c00                      move.w     d0,d6
[000255f6] 7801                      moveq.l    #1,d4
[000255f8] d86a 0002                 add.w      2(a2),d4
[000255fc] 7201                      moveq.l    #1,d1
[000255fe] 3004                      move.w     d4,d0
[00025600] 48c0                      ext.l      d0
[00025602] 2400                      move.l     d0,d2
[00025604] d482                      add.l      d2,d2
[00025606] d480                      add.l      d0,d2
[00025608] e78a                      lsl.l      #3,d2
[0002560a] d272 2802                 add.w      2(a2,d2.l),d1
[0002560e] 3801                      move.w     d1,d4
[00025610] 7601                      moveq.l    #1,d3
[00025612] 48c1                      ext.l      d1
[00025614] 2001                      move.l     d1,d0
[00025616] d080                      add.l      d0,d0
[00025618] d081                      add.l      d1,d0
[0002561a] e788                      lsl.l      #3,d0
[0002561c] d672 0802                 add.w      2(a2,d0.l),d3
[00025620] 7401                      moveq.l    #1,d2
[00025622] 3203                      move.w     d3,d1
[00025624] 48c1                      ext.l      d1
[00025626] 2001                      move.l     d1,d0
[00025628] d080                      add.l      d0,d0
[0002562a] d081                      add.l      d1,d0
[0002562c] e788                      lsl.l      #3,d0
[0002562e] d472 0802                 add.w      2(a2,d0.l),d2
[00025632] 3602                      move.w     d2,d3
[00025634] 7001                      moveq.l    #1,d0
[00025636] 3404                      move.w     d4,d2
[00025638] 48c2                      ext.l      d2
[0002563a] 2202                      move.l     d2,d1
[0002563c] d281                      add.l      d1,d1
[0002563e] d282                      add.l      d2,d1
[00025640] e789                      lsl.l      #3,d1
[00025642] d072 1800                 add.w      0(a2,d1.l),d0
[00025646] 3800                      move.w     d0,d4
[00025648] 7a01                      moveq.l    #1,d5
[0002564a] 48c0                      ext.l      d0
[0002564c] 2200                      move.l     d0,d1
[0002564e] d281                      add.l      d1,d1
[00025650] d280                      add.l      d0,d1
[00025652] e789                      lsl.l      #3,d1
[00025654] da72 1802                 add.w      2(a2,d1.l),d5
[00025658] 6030                      bra.s      $0002568A
[0002565a] bc45                      cmp.w      d5,d6
[0002565c] 6604                      bne.s      $00025662
[0002565e] 3003                      move.w     d3,d0
[00025660] 6032                      bra.s      $00025694
[00025662] 7001                      moveq.l    #1,d0
[00025664] 3403                      move.w     d3,d2
[00025666] 48c2                      ext.l      d2
[00025668] 2202                      move.l     d2,d1
[0002566a] d281                      add.l      d1,d1
[0002566c] d282                      add.l      d2,d1
[0002566e] e789                      lsl.l      #3,d1
[00025670] d072 1800                 add.w      0(a2,d1.l),d0
[00025674] 3600                      move.w     d0,d3
[00025676] 7201                      moveq.l    #1,d1
[00025678] 3005                      move.w     d5,d0
[0002567a] 48c0                      ext.l      d0
[0002567c] 2400                      move.l     d0,d2
[0002567e] d482                      add.l      d2,d2
[00025680] d480                      add.l      d0,d2
[00025682] e78a                      lsl.l      #3,d2
[00025684] d272 2800                 add.w      0(a2,d2.l),d1
[00025688] 3a01                      move.w     d1,d5
[0002568a] 7001                      moveq.l    #1,d0
[0002568c] d044                      add.w      d4,d0
[0002568e] ba40                      cmp.w      d0,d5
[00025690] 66c8                      bne.s      $0002565A
[00025692] 70ff                      moveq.l    #-1,d0
[00025694] 4cdf 0478                 movem.l    (a7)+,d3-d6/a2
[00025698] 4e75                      rts
me_init:
[0002569a] 48e7 1f38                 movem.l    d3-d7/a2-a4,-(a7)
[0002569e] 2648                      movea.l    a0,a3
[000256a0] 2450                      movea.l    (a0),a2
[000256a2] 226a 0004                 movea.l    4(a2),a1
[000256a6] 2069 0004                 movea.l    4(a1),a0
[000256aa] 6100 fda0                 bsr        align
[000256ae] 204b                      movea.l    a3,a0
[000256b0] 4eb9 0002 c438            jsr        ed_init
[000256b6] 3600                      move.w     d0,d3
[000256b8] 4a40                      tst.w      d0
[000256ba] 6600 0252                 bne        $0002590E
[000256be] 266b 0014                 movea.l    20(a3),a3
[000256c2] 284b                      movea.l    a3,a4
[000256c4] 3c2b 0002                 move.w     2(a3),d6
[000256c8] 3406                      move.w     d6,d2
[000256ca] 48c2                      ext.l      d2
[000256cc] 2202                      move.l     d2,d1
[000256ce] d281                      add.l      d1,d1
[000256d0] d282                      add.l      d2,d1
[000256d2] e789                      lsl.l      #3,d1
[000256d4] 3033 1810                 move.w     16(a3,d1.l),d0
[000256d8] d040                      add.w      d0,d0
[000256da] 916b 0014                 sub.w      d0,20(a3)
[000256de] 3033 1812                 move.w     18(a3,d1.l),d0
[000256e2] d040                      add.w      d0,d0
[000256e4] 916b 0016                 sub.w      d0,22(a3)
[000256e8] 4240                      clr.w      d0
[000256ea] 3780 1828                 move.w     d0,40(a3,d1.l)
[000256ee] 3780 1810                 move.w     d0,16(a3,d1.l)
[000256f2] 91c8                      suba.l     a0,a0
[000256f4] 3788 182a                 move.w     a0,42(a3,d1.l)
[000256f8] 3788 1812                 move.w     a0,18(a3,d1.l)
[000256fc] 4273 1820                 clr.w      32(a3,d1.l)
[00025700] 3c33 181a                 move.w     26(a3,d1.l),d6
[00025704] 3206                      move.w     d6,d1
[00025706] 48c1                      ext.l      d1
[00025708] 2001                      move.l     d1,d0
[0002570a] d080                      add.l      d0,d0
[0002570c] d081                      add.l      d1,d0
[0002570e] e788                      lsl.l      #3,d0
[00025710] 27bc 00ff 1100 080c       move.l     #$00FF1100,12(a3,d0.l)
[00025718] 0073 1800 0820            ori.w      #$1800,32(a3,d0.l)
[0002571e] 29bc 0002 5d16 0834       move.l     #mbar_dragged,52(a4,d0.l)
[00025726] 29bc 0002 5d64 0830       move.l     #new_title,48(a4,d0.l)
[0002572e] 3833 081a                 move.w     26(a3,d0.l),d4
[00025732] 3204                      move.w     d4,d1
[00025734] 48c1                      ext.l      d1
[00025736] 2401                      move.l     d1,d2
[00025738] d482                      add.l      d2,d2
[0002573a] d481                      add.l      d1,d2
[0002573c] e78a                      lsl.l      #3,d2
[0002573e] 4273 2820                 clr.w      32(a3,d2.l)
[00025742] 3a33 281a                 move.w     26(a3,d2.l),d5
[00025746] 3205                      move.w     d5,d1
[00025748] 48c1                      ext.l      d1
[0002574a] 2001                      move.l     d1,d0
[0002574c] d080                      add.l      d0,d0
[0002574e] d081                      add.l      d1,d0
[00025750] e788                      lsl.l      #3,d0
[00025752] 2073 080c                 movea.l    12(a3,d0.l),a0
[00025756] 4eb9 0004 649c            jsr        Ast_delete
[0002575c] 41f9 000b b644            lea.l      $000BB644,a0
[00025762] 4eb9 0004 643c            jsr        Ast_create
[00025768] 3205                      move.w     d5,d1
[0002576a] 48c1                      ext.l      d1
[0002576c] 2001                      move.l     d1,d0
[0002576e] d080                      add.l      d0,d0
[00025770] d081                      add.l      d1,d0
[00025772] e788                      lsl.l      #3,d0
[00025774] 2788 080c                 move.l     a0,12(a3,d0.l)
[00025778] 0073 1800 0820            ori.w      #$1800,32(a3,d0.l)
[0002577e] 29bc 0002 5d64 0830       move.l     #new_title,48(a4,d0.l)
[00025786] 6020                      bra.s      $000257A8
[00025788] 3205                      move.w     d5,d1
[0002578a] 48c1                      ext.l      d1
[0002578c] 2001                      move.l     d1,d0
[0002578e] d080                      add.l      d0,d0
[00025790] d081                      add.l      d1,d0
[00025792] e788                      lsl.l      #3,d0
[00025794] 0073 1800 0820            ori.w      #$1800,32(a3,d0.l)
[0002579a] 39bc 2af9 0846            move.w     #$2AF9,70(a4,d0.l)
[000257a0] 29bc 0002 62c0 0830       move.l     #title_edit,48(a4,d0.l)
[000257a8] 3205                      move.w     d5,d1
[000257aa] 48c1                      ext.l      d1
[000257ac] 2001                      move.l     d1,d0
[000257ae] d080                      add.l      d0,d0
[000257b0] d081                      add.l      d1,d0
[000257b2] e788                      lsl.l      #3,d0
[000257b4] 29bc 0002 6262 0834       move.l     #title_dragged,52(a4,d0.l)
[000257bc] 3a33 0818                 move.w     24(a3,d0.l),d5
[000257c0] 7001                      moveq.l    #1,d0
[000257c2] d044                      add.w      d4,d0
[000257c4] ba40                      cmp.w      d0,d5
[000257c6] 66c0                      bne.s      $00025788
[000257c8] 3406                      move.w     d6,d2
[000257ca] 48c2                      ext.l      d2
[000257cc] 2202                      move.l     d2,d1
[000257ce] d281                      add.l      d1,d1
[000257d0] d282                      add.l      d2,d1
[000257d2] e789                      lsl.l      #3,d1
[000257d4] 3a33 1818                 move.w     24(a3,d1.l),d5
[000257d8] 3005                      move.w     d5,d0
[000257da] 48c0                      ext.l      d0
[000257dc] 2c00                      move.l     d0,d6
[000257de] dc86                      add.l      d6,d6
[000257e0] dc80                      add.l      d0,d6
[000257e2] e78e                      lsl.l      #3,d6
[000257e4] 29bc 0002 5d64 6830       move.l     #new_title,48(a4,d6.l)
[000257ec] 3c33 681a                 move.w     26(a3,d6.l),d6
[000257f0] 3406                      move.w     d6,d2
[000257f2] 48c2                      ext.l      d2
[000257f4] 2202                      move.l     d2,d1
[000257f6] d281                      add.l      d1,d1
[000257f8] d282                      add.l      d2,d1
[000257fa] e789                      lsl.l      #3,d1
[000257fc] 4273 1820                 clr.w      32(a3,d1.l)
[00025800] 42b4 1834                 clr.l      52(a4,d1.l)
[00025804] 3e33 181a                 move.w     26(a3,d1.l),d7
[00025808] 3407                      move.w     d7,d2
[0002580a] 48c2                      ext.l      d2
[0002580c] 2002                      move.l     d2,d0
[0002580e] d080                      add.l      d0,d0
[00025810] d082                      add.l      d2,d0
[00025812] e788                      lsl.l      #3,d0
[00025814] 29bc 0002 5e68 0830       move.l     #obspec_only,48(a4,d0.l)
[0002581c] 3e33 0818                 move.w     24(a3,d0.l),d7
[00025820] 7001                      moveq.l    #1,d0
[00025822] d046                      add.w      d6,d0
[00025824] be40                      cmp.w      d0,d7
[00025826] 6700 0080                 beq        $000258A8
[0002582a] 3207                      move.w     d7,d1
[0002582c] 48c1                      ext.l      d1
[0002582e] 2401                      move.l     d1,d2
[00025830] d482                      add.l      d2,d2
[00025832] d481                      add.l      d1,d2
[00025834] e78a                      lsl.l      #3,d2
[00025836] 29bc 0002 5e68 2830       move.l     #obspec_only,48(a4,d2.l)
[0002583e] 3e33 2818                 move.w     24(a3,d2.l),d7
[00025842] be40                      cmp.w      d0,d7
[00025844] 6762                      beq.s      $000258A8
[00025846] 603a                      bra.s      $00025882
[00025848] 3207                      move.w     d7,d1
[0002584a] 48c1                      ext.l      d1
[0002584c] 2001                      move.l     d1,d0
[0002584e] d080                      add.l      d0,d0
[00025850] d081                      add.l      d1,d0
[00025852] e788                      lsl.l      #3,d0
[00025854] 4273 0820                 clr.w      32(a3,d0.l)
[00025858] 2073 080c                 movea.l    12(a3,d0.l),a0
[0002585c] 4eb9 0004 649c            jsr        Ast_delete
[00025862] 41f9 000b b64a            lea.l      $000BB64A,a0
[00025868] 4eb9 0004 643c            jsr        Ast_create
[0002586e] 3207                      move.w     d7,d1
[00025870] 48c1                      ext.l      d1
[00025872] 2001                      move.l     d1,d0
[00025874] d080                      add.l      d0,d0
[00025876] d081                      add.l      d1,d0
[00025878] e788                      lsl.l      #3,d0
[0002587a] 2788 080c                 move.l     a0,12(a3,d0.l)
[0002587e] 3e33 0818                 move.w     24(a3,d0.l),d7
[00025882] 7001                      moveq.l    #1,d0
[00025884] d046                      add.w      d6,d0
[00025886] be40                      cmp.w      d0,d7
[00025888] 66be                      bne.s      $00025848
[0002588a] 601c                      bra.s      $000258A8
[0002588c] 3206                      move.w     d6,d1
[0002588e] 48c1                      ext.l      d1
[00025890] 2001                      move.l     d1,d0
[00025892] d080                      add.l      d0,d0
[00025894] d081                      add.l      d1,d0
[00025896] e788                      lsl.l      #3,d0
[00025898] 0073 0080 0808            ori.w      #$0080,8(a3,d0.l)
[0002589e] 0073 0080 0820            ori.w      #$0080,32(a3,d0.l)
[000258a4] 3c33 0818                 move.w     24(a3,d0.l),d6
[000258a8] 7001                      moveq.l    #1,d0
[000258aa] d045                      add.w      d5,d0
[000258ac] bc40                      cmp.w      d0,d6
[000258ae] 66dc                      bne.s      $0002588C
[000258b0] 3c2a 0018                 move.w     24(a2),d6
[000258b4] 4a46                      tst.w      d6
[000258b6] 6f56                      ble.s      $0002590E
[000258b8] 204b                      movea.l    a3,a0
[000258ba] 3006                      move.w     d6,d0
[000258bc] 6100 fd30                 bsr        find_title
[000258c0] 3e00                      move.w     d0,d7
[000258c2] 48c0                      ext.l      d0
[000258c4] 2200                      move.l     d0,d1
[000258c6] d281                      add.l      d1,d1
[000258c8] d280                      add.l      d0,d1
[000258ca] e789                      lsl.l      #3,d1
[000258cc] 0073 0001 18f2            ori.w      #$0001,-14(a3,d1.l)
[000258d2] 7401                      moveq.l    #1,d2
[000258d4] 3204                      move.w     d4,d1
[000258d6] 48c1                      ext.l      d1
[000258d8] 2a01                      move.l     d1,d5
[000258da] da85                      add.l      d5,d5
[000258dc] da81                      add.l      d1,d5
[000258de] e78d                      lsl.l      #3,d5
[000258e0] d473 581a                 add.w      26(a3,d5.l),d2
[000258e4] be42                      cmp.w      d2,d7
[000258e6] 670e                      beq.s      $000258F6
[000258e8] 2800                      move.l     d0,d4
[000258ea] d884                      add.l      d4,d4
[000258ec] d880                      add.l      d0,d4
[000258ee] e78c                      lsl.l      #3,d4
[000258f0] 0073 0001 480a            ori.w      #$0001,10(a3,d4.l)
[000258f6] 3206                      move.w     d6,d1
[000258f8] 48c1                      ext.l      d1
[000258fa] 2001                      move.l     d1,d0
[000258fc] d080                      add.l      d0,d0
[000258fe] d081                      add.l      d1,d0
[00025900] e788                      lsl.l      #3,d0
[00025902] 0273 ff7f 08f0            andi.w     #$FF7F,-16(a3,d0.l)
[00025908] 0273 ff7f 0808            andi.w     #$FF7F,8(a3,d0.l)
[0002590e] 3003                      move.w     d3,d0
[00025910] 4cdf 1cf8                 movem.l    (a7)+,d3-d7/a2-a4
[00025914] 4e75                      rts
me_make:
[00025916] 48e7 0038                 movem.l    a2-a4,-(a7)
[0002591a] 594f                      subq.w     #4,a7
[0002591c] 2e88                      move.l     a0,(a7)
[0002591e] 2668 0004                 movea.l    4(a0),a3
[00025922] 286b 0012                 movea.l    18(a3),a4
[00025926] 200c                      move.l     a4,d0
[00025928] 670c                      beq.s      $00025936
[0002592a] 204c                      movea.l    a4,a0
[0002592c] 4eb9 0005 6bea            jsr        Awi_show
[00025932] 6000 008a                 bra        $000259BE
[00025936] 7032                      moveq.l    #50,d0
[00025938] 4eb9 0004 c608            jsr        Ax_malloc
[0002593e] 2448                      movea.l    a0,a2
[00025940] 200a                      move.l     a2,d0
[00025942] 6776                      beq.s      $000259BA
[00025944] 2257                      movea.l    (a7),a1
[00025946] 2091                      move.l     (a1),(a0)
[00025948] 2569 0004 0004            move.l     4(a1),4(a2)
[0002594e] 357c 0001 0008            move.w     #$0001,8(a2)
[00025954] 357c ffff 0018            move.w     #$FFFF,24(a2)
[0002595a] 357c ffff 000a            move.w     #$FFFF,10(a2)
[00025960] 42aa 001e                 clr.l      30(a2)
[00025964] 41eb 0016                 lea.l      22(a3),a0
[00025968] 23c8 000c 8d88            move.l     a0,$000C8D88
[0002596e] 2279 000c 8d94            movea.l    $000C8D94,a1
[00025974] 2348 0008                 move.l     a0,8(a1)
[00025978] 41f9 000c 8d3a            lea.l      WI_MENU,a0
[0002597e] 4eb9 0005 7052            jsr        Awi_create
[00025984] 2848                      movea.l    a0,a4
[00025986] 200c                      move.l     a4,d0
[00025988] 6730                      beq.s      $000259BA
[0002598a] 2257                      movea.l    (a7),a1
[0002598c] 2051                      movea.l    (a1),a0
[0002598e] 4868 0168                 pea.l      360(a0)
[00025992] 43eb 003a                 lea.l      58(a3),a1
[00025996] 204c                      movea.l    a4,a0
[00025998] 4eb9 0001 6372            jsr        wi_pos
[0002599e] 584f                      addq.w     #4,a7
[000259a0] 288a                      move.l     a2,(a4)
[000259a2] 274c 0012                 move.l     a4,18(a3)
[000259a6] 204c                      movea.l    a4,a0
[000259a8] 226c 000c                 movea.l    12(a4),a1
[000259ac] 4e91                      jsr        (a1)
[000259ae] 4a40                      tst.w      d0
[000259b0] 670c                      beq.s      $000259BE
[000259b2] 204c                      movea.l    a4,a0
[000259b4] 4eb9 0002 c8c8            jsr        ed_term
[000259ba] 91c8                      suba.l     a0,a0
[000259bc] 6002                      bra.s      $000259C0
[000259be] 204c                      movea.l    a4,a0
[000259c0] 584f                      addq.w     #4,a7
[000259c2] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000259c6] 4e75                      rts
make_title:
[000259c8] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[000259cc] 4fef ffe2                 lea.l      -30(a7),a7
[000259d0] 2448                      movea.l    a0,a2
[000259d2] 3f40 001c                 move.w     d0,28(a7)
[000259d6] 3f41 001a                 move.w     d1,26(a7)
[000259da] 3f42 0018                 move.w     d2,24(a7)
[000259de] 2279 0010 ee4e            movea.l    ACSblk,a1
[000259e4] 2f69 0240 0014            move.l     576(a1),20(a7)
[000259ea] 48c0                      ext.l      d0
[000259ec] 2400                      move.l     d0,d2
[000259ee] d482                      add.l      d2,d2
[000259f0] d480                      add.l      d0,d2
[000259f2] e78a                      lsl.l      #3,d2
[000259f4] 206f 0014                 movea.l    20(a7),a0
[000259f8] 2668 0014                 movea.l    20(a0),a3
[000259fc] 47f3 2818                 lea.l      24(a3,d2.l),a3
[00025a00] 0c6b 2af8 0016            cmpi.w     #$2AF8,22(a3)
[00025a06] 670a                      beq.s      $00025A12
[00025a08] 0c6b 2af9 0016            cmpi.w     #$2AF9,22(a3)
[00025a0e] 6600 02fc                 bne        $00025D0C
[00025a12] 2f6b 000c 0008            move.l     12(a3),8(a7)
[00025a18] 206f 0008                 movea.l    8(a7),a0
[00025a1c] 2a68 0004                 movea.l    4(a0),a5
[00025a20] 3f6b 0012 000c            move.w     18(a3),12(a7)
[00025a26] 322f 000c                 move.w     12(a7),d1
[00025a2a] 48c1                      ext.l      d1
[00025a2c] 2001                      move.l     d1,d0
[00025a2e] e788                      lsl.l      #3,d0
[00025a30] 9081                      sub.l      d1,d0
[00025a32] e788                      lsl.l      #3,d0
[00025a34] 0c35 0020 080f            cmpi.b     #$20,15(a5,d0.l)
[00025a3a] 6600 02d0                 bne        $00025D0C
[00025a3e] 0c75 ffff 080a            cmpi.w     #$FFFF,10(a5,d0.l)
[00025a44] 6600 02c6                 bne        $00025D0C
[00025a48] 2f52 0004                 move.l     (a2),4(a7)
[00025a4c] 226f 0004                 movea.l    4(a7),a1
[00025a50] 2e91                      move.l     (a1),(a7)
[00025a52] 2869 0004                 movea.l    4(a1),a4
[00025a56] 342f 0018                 move.w     24(a7),d2
[00025a5a] 6700 00a6                 beq        $00025B02
[00025a5e] 0c6b 2af8 0016            cmpi.w     #$2AF8,22(a3)
[00025a64] 6700 009c                 beq        $00025B02
[00025a68] 306f 001a                 movea.w    26(a7),a0
[00025a6c] b0ef 001c                 cmpa.w     28(a7),a0
[00025a70] 6700 029a                 beq        $00025D0C
[00025a74] 7201                      moveq.l    #1,d1
[00025a76] 3408                      move.w     a0,d2
[00025a78] 48c2                      ext.l      d2
[00025a7a] 2002                      move.l     d2,d0
[00025a7c] d080                      add.l      d0,d0
[00025a7e] d082                      add.l      d2,d0
[00025a80] e788                      lsl.l      #3,d0
[00025a82] 226a 0014                 movea.l    20(a2),a1
[00025a86] d271 0800                 add.w      0(a1,d0.l),d1
[00025a8a] b26f 001c                 cmp.w      28(a7),d1
[00025a8e] 6700 027c                 beq        $00025D0C
[00025a92] 7cfe                      moveq.l    #-2,d6
[00025a94] dc6f 001c                 add.w      28(a7),d6
[00025a98] 48c6                      ext.l      d6
[00025a9a] 8dfc 0003                 divs.w     #$0003,d6
[00025a9e] 2049                      movea.l    a1,a0
[00025aa0] 302f 001c                 move.w     28(a7),d0
[00025aa4] 6100 fa9c                 bsr        find_drop
[00025aa8] 3e00                      move.w     d0,d7
[00025aaa] 7afe                      moveq.l    #-2,d5
[00025aac] da40                      add.w      d0,d5
[00025aae] 48c5                      ext.l      d5
[00025ab0] 8bfc 0003                 divs.w     #$0003,d5
[00025ab4] 204d                      movea.l    a5,a0
[00025ab6] 3006                      move.w     d6,d0
[00025ab8] 4eb9 0002 d556            jsr        unlink_ob
[00025abe] 3205                      move.w     d5,d1
[00025ac0] 48c1                      ext.l      d1
[00025ac2] 2001                      move.l     d1,d0
[00025ac4] e788                      lsl.l      #3,d0
[00025ac6] 9081                      sub.l      d1,d0
[00025ac8] e788                      lsl.l      #3,d0
[00025aca] 3f75 080a 000e            move.w     10(a5,d0.l),14(a7)
[00025ad0] 3635 080c                 move.w     12(a5,d0.l),d3
[00025ad4] 74ff                      moveq.l    #-1,d2
[00025ad6] 3b82 080c                 move.w     d2,12(a5,d0.l)
[00025ada] 3b82 080a                 move.w     d2,10(a5,d0.l)
[00025ade] 204d                      movea.l    a5,a0
[00025ae0] 3005                      move.w     d5,d0
[00025ae2] 4eb9 0002 d556            jsr        unlink_ob
[00025ae8] 3205                      move.w     d5,d1
[00025aea] 48c1                      ext.l      d1
[00025aec] 2001                      move.l     d1,d0
[00025aee] e788                      lsl.l      #3,d0
[00025af0] 9081                      sub.l      d1,d0
[00025af2] e788                      lsl.l      #3,d0
[00025af4] 3baf 000e 080a            move.w     14(a7),10(a5,d0.l)
[00025afa] 3b83 080c                 move.w     d3,12(a5,d0.l)
[00025afe] 6000 00bc                 bra        $00025BBC
[00025b02] 0c6b 2af8 0016            cmpi.w     #$2AF8,22(a3)
[00025b08] 661c                      bne.s      $00025B26
[00025b0a] 4879 000b b602            pea.l      protodrop
[00025b10] 4240                      clr.w      d0
[00025b12] 224c                      movea.l    a4,a1
[00025b14] 206f 0004                 movea.l    4(a7),a0
[00025b18] 4eb9 0002 d0dc            jsr        copysub_ob
[00025b1e] 584f                      addq.w     #4,a7
[00025b20] 3a00                      move.w     d0,d5
[00025b22] 6000 0080                 bra        $00025BA4
[00025b26] 382d 000a                 move.w     10(a5),d4
[00025b2a] 3204                      move.w     d4,d1
[00025b2c] 48c1                      ext.l      d1
[00025b2e] 2001                      move.l     d1,d0
[00025b30] e788                      lsl.l      #3,d0
[00025b32] 9081                      sub.l      d1,d0
[00025b34] e788                      lsl.l      #3,d0
[00025b36] 3f75 080a 0012            move.w     10(a5,d0.l),18(a7)
[00025b3c] 3f75 0808 0010            move.w     8(a5,d0.l),16(a7)
[00025b42] 362f 0012                 move.w     18(a7),d3
[00025b46] 48c3                      ext.l      d3
[00025b48] 2403                      move.l     d3,d2
[00025b4a] e78a                      lsl.l      #3,d2
[00025b4c] 9483                      sub.l      d3,d2
[00025b4e] e78a                      lsl.l      #3,d2
[00025b50] 3635 280a                 move.w     10(a5,d2.l),d3
[00025b54] 302f 0010                 move.w     16(a7),d0
[00025b58] 48c0                      ext.l      d0
[00025b5a] 2200                      move.l     d0,d1
[00025b5c] e789                      lsl.l      #3,d1
[00025b5e] 9280                      sub.l      d0,d1
[00025b60] e789                      lsl.l      #3,d1
[00025b62] 3e35 180a                 move.w     10(a5,d1.l),d7
[00025b66] 6020                      bra.s      $00025B88
[00025b68] 3203                      move.w     d3,d1
[00025b6a] 48c1                      ext.l      d1
[00025b6c] 2001                      move.l     d1,d0
[00025b6e] e788                      lsl.l      #3,d0
[00025b70] 9081                      sub.l      d1,d0
[00025b72] e788                      lsl.l      #3,d0
[00025b74] 3635 0808                 move.w     8(a5,d0.l),d3
[00025b78] 3207                      move.w     d7,d1
[00025b7a] 48c1                      ext.l      d1
[00025b7c] 2001                      move.l     d1,d0
[00025b7e] e788                      lsl.l      #3,d0
[00025b80] 9081                      sub.l      d1,d0
[00025b82] e788                      lsl.l      #3,d0
[00025b84] 3e35 0808                 move.w     8(a5,d0.l),d7
[00025b88] b66f 000c                 cmp.w      12(a7),d3
[00025b8c] 66da                      bne.s      $00025B68
[00025b8e] 2f2f 0008                 move.l     8(a7),-(a7)
[00025b92] 3007                      move.w     d7,d0
[00025b94] 224c                      movea.l    a4,a1
[00025b96] 206f 0004                 movea.l    4(a7),a0
[00025b9a] 4eb9 0002 d0dc            jsr        copysub_ob
[00025ba0] 584f                      addq.w     #4,a7
[00025ba2] 3a00                      move.w     d0,d5
[00025ba4] 2f2f 0008                 move.l     8(a7),-(a7)
[00025ba8] 302f 0010                 move.w     16(a7),d0
[00025bac] 224c                      movea.l    a4,a1
[00025bae] 206f 0004                 movea.l    4(a7),a0
[00025bb2] 4eb9 0002 d0dc            jsr        copysub_ob
[00025bb8] 584f                      addq.w     #4,a7
[00025bba] 3c00                      move.w     d0,d6
[00025bbc] 302f 001c                 move.w     28(a7),d0
[00025bc0] 206f 0014                 movea.l    20(a7),a0
[00025bc4] 4eb9 0004 7f76            jsr        Adr_del
[00025bca] 2a6c 0004                 movea.l    4(a4),a5
[00025bce] 3206                      move.w     d6,d1
[00025bd0] 48c1                      ext.l      d1
[00025bd2] 2001                      move.l     d1,d0
[00025bd4] e788                      lsl.l      #3,d0
[00025bd6] 9081                      sub.l      d1,d0
[00025bd8] e788                      lsl.l      #3,d0
[00025bda] 3bbc 0301 081e            move.w     #$0301,30(a5,d0.l)
[00025be0] 382d 000a                 move.w     10(a5),d4
[00025be4] 3604                      move.w     d4,d3
[00025be6] 48c3                      ext.l      d3
[00025be8] 2403                      move.l     d3,d2
[00025bea] e78a                      lsl.l      #3,d2
[00025bec] 9483                      sub.l      d3,d2
[00025bee] e78a                      lsl.l      #3,d2
[00025bf0] 3f75 280a 0012            move.w     10(a5,d2.l),18(a7)
[00025bf6] 3f75 2808 0010            move.w     8(a5,d2.l),16(a7)
[00025bfc] 76fe                      moveq.l    #-2,d3
[00025bfe] d66f 001a                 add.w      26(a7),d3
[00025c02] 48c3                      ext.l      d3
[00025c04] 87fc 0003                 divs.w     #$0003,d3
[00025c08] 302f 0012                 move.w     18(a7),d0
[00025c0c] 48c0                      ext.l      d0
[00025c0e] 2800                      move.l     d0,d4
[00025c10] e78c                      lsl.l      #3,d4
[00025c12] 9880                      sub.l      d0,d4
[00025c14] e78c                      lsl.l      #3,d4
[00025c16] 3835 480c                 move.w     12(a5,d4.l),d4
[00025c1a] b843                      cmp.w      d3,d4
[00025c1c] 667c                      bne.s      $00025C9A
[00025c1e] 322f 0010                 move.w     16(a7),d1
[00025c22] 48c1                      ext.l      d1
[00025c24] 2401                      move.l     d1,d2
[00025c26] e78a                      lsl.l      #3,d2
[00025c28] 9481                      sub.l      d1,d2
[00025c2a] e78a                      lsl.l      #3,d2
[00025c2c] 3e35 280c                 move.w     12(a5,d2.l),d7
[00025c30] 3406                      move.w     d6,d2
[00025c32] 48c2                      ext.l      d2
[00025c34] 2002                      move.l     d2,d0
[00025c36] e788                      lsl.l      #3,d0
[00025c38] 9082                      sub.l      d2,d0
[00025c3a] e788                      lsl.l      #3,d0
[00025c3c] 3baf 0012 0808            move.w     18(a7),8(a5,d0.l)
[00025c42] 302f 0012                 move.w     18(a7),d0
[00025c46] 48c0                      ext.l      d0
[00025c48] 2200                      move.l     d0,d1
[00025c4a] e789                      lsl.l      #3,d1
[00025c4c] 9280                      sub.l      d0,d1
[00025c4e] e789                      lsl.l      #3,d1
[00025c50] 3b86 180c                 move.w     d6,12(a5,d1.l)
[00025c54] 3204                      move.w     d4,d1
[00025c56] 48c1                      ext.l      d1
[00025c58] 2401                      move.l     d1,d2
[00025c5a] e78a                      lsl.l      #3,d2
[00025c5c] 9481                      sub.l      d1,d2
[00025c5e] e78a                      lsl.l      #3,d2
[00025c60] 3b86 2808                 move.w     d6,8(a5,d2.l)
[00025c64] 3005                      move.w     d5,d0
[00025c66] 48c0                      ext.l      d0
[00025c68] 2800                      move.l     d0,d4
[00025c6a] e78c                      lsl.l      #3,d4
[00025c6c] 9880                      sub.l      d0,d4
[00025c6e] e78c                      lsl.l      #3,d4
[00025c70] 3baf 0010 4808            move.w     16(a7),8(a5,d4.l)
[00025c76] 322f 0010                 move.w     16(a7),d1
[00025c7a] 48c1                      ext.l      d1
[00025c7c] 2401                      move.l     d1,d2
[00025c7e] e78a                      lsl.l      #3,d2
[00025c80] 9481                      sub.l      d1,d2
[00025c82] e78a                      lsl.l      #3,d2
[00025c84] 3b85 280c                 move.w     d5,12(a5,d2.l)
[00025c88] 3007                      move.w     d7,d0
[00025c8a] 48c0                      ext.l      d0
[00025c8c] 2800                      move.l     d0,d4
[00025c8e] e78c                      lsl.l      #3,d4
[00025c90] 9880                      sub.l      d0,d4
[00025c92] e78c                      lsl.l      #3,d4
[00025c94] 3b85 4808                 move.w     d5,8(a5,d4.l)
[00025c98] 605a                      bra.s      $00025CF4
[00025c9a] 302f 001a                 move.w     26(a7),d0
[00025c9e] 206a 0014                 movea.l    20(a2),a0
[00025ca2] 6100 f89e                 bsr        find_drop
[00025ca6] 3e00                      move.w     d0,d7
[00025ca8] 5547                      subq.w     #2,d7
[00025caa] 48c7                      ext.l      d7
[00025cac] 8ffc 0003                 divs.w     #$0003,d7
[00025cb0] 3203                      move.w     d3,d1
[00025cb2] 48c1                      ext.l      d1
[00025cb4] 2001                      move.l     d1,d0
[00025cb6] e788                      lsl.l      #3,d0
[00025cb8] 9081                      sub.l      d1,d0
[00025cba] e788                      lsl.l      #3,d0
[00025cbc] 3806                      move.w     d6,d4
[00025cbe] 48c4                      ext.l      d4
[00025cc0] 2404                      move.l     d4,d2
[00025cc2] e78a                      lsl.l      #3,d2
[00025cc4] 9484                      sub.l      d4,d2
[00025cc6] e78a                      lsl.l      #3,d2
[00025cc8] 3bb5 0808 2808            move.w     8(a5,d0.l),8(a5,d2.l)
[00025cce] 3b86 0808                 move.w     d6,8(a5,d0.l)
[00025cd2] 3c07                      move.w     d7,d6
[00025cd4] 48c6                      ext.l      d6
[00025cd6] 2606                      move.l     d6,d3
[00025cd8] e78b                      lsl.l      #3,d3
[00025cda] 9686                      sub.l      d6,d3
[00025cdc] e78b                      lsl.l      #3,d3
[00025cde] 3405                      move.w     d5,d2
[00025ce0] 48c2                      ext.l      d2
[00025ce2] 2202                      move.l     d2,d1
[00025ce4] e789                      lsl.l      #3,d1
[00025ce6] 9282                      sub.l      d2,d1
[00025ce8] e789                      lsl.l      #3,d1
[00025cea] 3bb5 3808 1808            move.w     8(a5,d3.l),8(a5,d1.l)
[00025cf0] 3b85 3808                 move.w     d5,8(a5,d3.l)
[00025cf4] 204d                      movea.l    a5,a0
[00025cf6] 6100 f754                 bsr        align
[00025cfa] 204a                      movea.l    a2,a0
[00025cfc] 226a 0010                 movea.l    16(a2),a1
[00025d00] 4e91                      jsr        (a1)
[00025d02] 4240                      clr.w      d0
[00025d04] 204a                      movea.l    a2,a0
[00025d06] 4eb9 0005 1b80            jsr        Awi_obredraw
[00025d0c] 4fef 001e                 lea.l      30(a7),a7
[00025d10] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[00025d14] 4e75                      rts
mbar_dragged:
[00025d16] 2f03                      move.l     d3,-(a7)
[00025d18] 2f0a                      move.l     a2,-(a7)
[00025d1a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00025d20] 2468 025c                 movea.l    604(a0),a2
[00025d24] 362a 0002                 move.w     2(a2),d3
[00025d28] 48c3                      ext.l      d3
[00025d2a] 2403                      move.l     d3,d2
[00025d2c] d482                      add.l      d2,d2
[00025d2e] d483                      add.l      d3,d2
[00025d30] e78a                      lsl.l      #3,d2
[00025d32] 3432 281a                 move.w     26(a2,d2.l),d2
[00025d36] 48c2                      ext.l      d2
[00025d38] 2202                      move.l     d2,d1
[00025d3a] d281                      add.l      d1,d1
[00025d3c] d282                      add.l      d2,d1
[00025d3e] e789                      lsl.l      #3,d1
[00025d40] 3232 181a                 move.w     26(a2,d1.l),d1
[00025d44] 48c1                      ext.l      d1
[00025d46] 2001                      move.l     d1,d0
[00025d48] d080                      add.l      d0,d0
[00025d4a] d081                      add.l      d1,d0
[00025d4c] e788                      lsl.l      #3,d0
[00025d4e] 3632 081c                 move.w     28(a2,d0.l),d3
[00025d52] 2068 0258                 movea.l    600(a0),a0
[00025d56] 3003                      move.w     d3,d0
[00025d58] 4eb9 0002 6278            jsr        tdragged
[00025d5e] 245f                      movea.l    (a7)+,a2
[00025d60] 261f                      move.l     (a7)+,d3
[00025d62] 4e75                      rts
new_title:
[00025d64] 48e7 1c38                 movem.l    d3-d5/a2-a4,-(a7)
[00025d68] 2079 0010 ee4e            movea.l    ACSblk,a0
[00025d6e] 2468 0258                 movea.l    600(a0),a2
[00025d72] 3628 0260                 move.w     608(a0),d3
[00025d76] 266a 0014                 movea.l    20(a2),a3
[00025d7a] 2852                      movea.l    (a2),a4
[00025d7c] 382c 0018                 move.w     24(a4),d4
[00025d80] 4a44                      tst.w      d4
[00025d82] 6f60                      ble.s      $00025DE4
[00025d84] 3004                      move.w     d4,d0
[00025d86] 204b                      movea.l    a3,a0
[00025d88] 6100 f864                 bsr        find_title
[00025d8c] 3a00                      move.w     d0,d5
[00025d8e] b640                      cmp.w      d0,d3
[00025d90] 6700 00d0                 beq        $00025E62
[00025d94] 4eb9 0004 810e            jsr        Adr_unselect
[00025d9a] 3205                      move.w     d5,d1
[00025d9c] 48c1                      ext.l      d1
[00025d9e] 2001                      move.l     d1,d0
[00025da0] d080                      add.l      d0,d0
[00025da2] d081                      add.l      d1,d0
[00025da4] e788                      lsl.l      #3,d0
[00025da6] 0273 fffe 08f2            andi.w     #$FFFE,-14(a3,d0.l)
[00025dac] 0273 fffe 080a            andi.w     #$FFFE,10(a3,d0.l)
[00025db2] 3204                      move.w     d4,d1
[00025db4] 48c1                      ext.l      d1
[00025db6] 2401                      move.l     d1,d2
[00025db8] d482                      add.l      d2,d2
[00025dba] d481                      add.l      d1,d2
[00025dbc] e78a                      lsl.l      #3,d2
[00025dbe] 0073 0080 28f0            ori.w      #$0080,-16(a3,d2.l)
[00025dc4] 0073 0080 2808            ori.w      #$0080,8(a3,d2.l)
[00025dca] 0273 e7ff 2808            andi.w     #$E7FF,8(a3,d2.l)
[00025dd0] 204a                      movea.l    a2,a0
[00025dd2] 3005                      move.w     d5,d0
[00025dd4] 4eb9 0005 1b80            jsr        Awi_obredraw
[00025dda] 3004                      move.w     d4,d0
[00025ddc] 204a                      movea.l    a2,a0
[00025dde] 4eb9 0005 1b80            jsr        Awi_obredraw
[00025de4] 3003                      move.w     d3,d0
[00025de6] 204b                      movea.l    a3,a0
[00025de8] 6100 f758                 bsr        find_drop
[00025dec] 3a00                      move.w     d0,d5
[00025dee] 3940 0018                 move.w     d0,24(a4)
[00025df2] 397c ffff 000a            move.w     #$FFFF,10(a4)
[00025df8] 4a40                      tst.w      d0
[00025dfa] 6b66                      bmi.s      $00025E62
[00025dfc] 3403                      move.w     d3,d2
[00025dfe] 48c2                      ext.l      d2
[00025e00] 2202                      move.l     d2,d1
[00025e02] d281                      add.l      d1,d1
[00025e04] d282                      add.l      d2,d1
[00025e06] e789                      lsl.l      #3,d1
[00025e08] 0073 0001 18f2            ori.w      #$0001,-14(a3,d1.l)
[00025e0e] 48c0                      ext.l      d0
[00025e10] 2800                      move.l     d0,d4
[00025e12] d884                      add.l      d4,d4
[00025e14] d880                      add.l      d0,d4
[00025e16] e78c                      lsl.l      #3,d4
[00025e18] 0273 ff7f 48f0            andi.w     #$FF7F,-16(a3,d4.l)
[00025e1e] 0273 ff7f 4808            andi.w     #$FF7F,8(a3,d4.l)
[00025e24] 0073 1800 4808            ori.w      #$1800,8(a3,d4.l)
[00025e2a] 204a                      movea.l    a2,a0
[00025e2c] 3003                      move.w     d3,d0
[00025e2e] 4eb9 0005 1b80            jsr        Awi_obredraw
[00025e34] 3005                      move.w     d5,d0
[00025e36] 204a                      movea.l    a2,a0
[00025e38] 4eb9 0005 1b80            jsr        Awi_obredraw
[00025e3e] 3205                      move.w     d5,d1
[00025e40] 48c1                      ext.l      d1
[00025e42] 2001                      move.l     d1,d0
[00025e44] d080                      add.l      d0,d0
[00025e46] d081                      add.l      d1,d0
[00025e48] e788                      lsl.l      #3,d0
[00025e4a] 41f3 0818                 lea.l      24(a3,d0.l),a0
[00025e4e] 2428 0004                 move.l     4(a0),d2
[00025e52] 670e                      beq.s      $00025E62
[00025e54] 76fe                      moveq.l    #-2,d3
[00025e56] d645                      add.w      d5,d3
[00025e58] 48c3                      ext.l      d3
[00025e5a] 87fc 0003                 divs.w     #$0003,d3
[00025e5e] 3943 000a                 move.w     d3,10(a4)
[00025e62] 4cdf 1c38                 movem.l    (a7)+,d3-d5/a2-a4
[00025e66] 4e75                      rts
obspec_only:
[00025e68] 2079 0010 ee4e            movea.l    ACSblk,a0
[00025e6e] 2268 0258                 movea.l    600(a0),a1
[00025e72] 2051                      movea.l    (a1),a0
[00025e74] 70fe                      moveq.l    #-2,d0
[00025e76] 2279 0010 ee4e            movea.l    ACSblk,a1
[00025e7c] d069 0260                 add.w      608(a1),d0
[00025e80] 48c0                      ext.l      d0
[00025e82] 81fc 0003                 divs.w     #$0003,d0
[00025e86] 3140 000a                 move.w     d0,10(a0)
[00025e8a] 317c ffff 0018            move.w     #$FFFF,24(a0)
[00025e90] 4eb9 0002 f856            jsr        edob_specs
[00025e96] 4e75                      rts
me_service:
[00025e98] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[00025e9c] 2448                      movea.l    a0,a2
[00025e9e] 3600                      move.w     d0,d3
[00025ea0] 2849                      movea.l    a1,a4
[00025ea2] b07c 000b                 cmp.w      #$000B,d0
[00025ea6] 660a                      bne.s      $00025EB2
[00025ea8] 4eb9 0002 5f16            jsr        ti_delete
[00025eae] 7001                      moveq.l    #1,d0
[00025eb0] 605e                      bra.s      $00025F10
[00025eb2] b67c 0002                 cmp.w      #$0002,d3
[00025eb6] 664c                      bne.s      $00025F04
[00025eb8] 2052                      movea.l    (a2),a0
[00025eba] 2268 0004                 movea.l    4(a0),a1
[00025ebe] 2669 0004                 movea.l    4(a1),a3
[00025ec2] 342b 000c                 move.w     12(a3),d2
[00025ec6] 48c2                      ext.l      d2
[00025ec8] 2202                      move.l     d2,d1
[00025eca] e789                      lsl.l      #3,d1
[00025ecc] 9282                      sub.l      d2,d1
[00025ece] e789                      lsl.l      #3,d1
[00025ed0] 3233 180a                 move.w     10(a3,d1.l),d1
[00025ed4] 48c1                      ext.l      d1
[00025ed6] 2001                      move.l     d1,d0
[00025ed8] e788                      lsl.l      #3,d0
[00025eda] 9081                      sub.l      d1,d0
[00025edc] e788                      lsl.l      #3,d0
[00025ede] 3833 080a                 move.w     10(a3,d0.l),d4
[00025ee2] 3404                      move.w     d4,d2
[00025ee4] 48c2                      ext.l      d2
[00025ee6] 2002                      move.l     d2,d0
[00025ee8] e788                      lsl.l      #3,d0
[00025eea] 9082                      sub.l      d2,d0
[00025eec] e788                      lsl.l      #3,d0
[00025eee] 4273 082a                 clr.w      42(a3,d0.l)
[00025ef2] 3433 0808                 move.w     8(a3,d0.l),d2
[00025ef6] 48c2                      ext.l      d2
[00025ef8] 2202                      move.l     d2,d1
[00025efa] e789                      lsl.l      #3,d1
[00025efc] 9282                      sub.l      d2,d1
[00025efe] e789                      lsl.l      #3,d1
[00025f00] 4273 182a                 clr.w      42(a3,d1.l)
[00025f04] 224c                      movea.l    a4,a1
[00025f06] 3003                      move.w     d3,d0
[00025f08] 204a                      movea.l    a2,a0
[00025f0a] 4eb9 0002 c7ae            jsr        ed_service
[00025f10] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[00025f14] 4e75                      rts
ti_delete:
[00025f16] 48e7 1c38                 movem.l    d3-d5/a2-a4,-(a7)
[00025f1a] 2448                      movea.l    a0,a2
[00025f1c] 41f9 0010 ee4e            lea.l      ACSblk,a0
[00025f22] 2250                      movea.l    (a0),a1
[00025f24] b5e9 0240                 cmpa.l     576(a1),a2
[00025f28] 6600 00f0                 bne        $0002601A
[00025f2c] 7004                      moveq.l    #4,d0
[00025f2e] c069 0266                 and.w      614(a1),d0
[00025f32] 6704                      beq.s      $00025F38
[00025f34] 7601                      moveq.l    #1,d3
[00025f36] 6002                      bra.s      $00025F3A
[00025f38] 4243                      clr.w      d3
[00025f3a] 2652                      movea.l    (a2),a3
[00025f3c] 2250                      movea.l    (a0),a1
[00025f3e] 4269 0248                 clr.w      584(a1)
[00025f42] 6000 00b2                 bra        $00025FF6
[00025f46] 3204                      move.w     d4,d1
[00025f48] 48c1                      ext.l      d1
[00025f4a] 2001                      move.l     d1,d0
[00025f4c] d080                      add.l      d0,d0
[00025f4e] d081                      add.l      d1,d0
[00025f50] e788                      lsl.l      #3,d0
[00025f52] 286a 0014                 movea.l    20(a2),a4
[00025f56] 49f4 0818                 lea.l      24(a4,d0.l),a4
[00025f5a] 0c6c 2af8 0016            cmpi.w     #$2AF8,22(a4)
[00025f60] 6616                      bne.s      $00025F78
[00025f62] 204a                      movea.l    a2,a0
[00025f64] 3004                      move.w     d4,d0
[00025f66] 4eb9 0004 7f76            jsr        Adr_del
[00025f6c] 3203                      move.w     d3,d1
[00025f6e] 3004                      move.w     d4,d0
[00025f70] 204a                      movea.l    a2,a0
[00025f72] 4eb9 0002 d96c            jsr        del_obentry
[00025f78] 0c6c 2af9 0016            cmpi.w     #$2AF9,22(a4)
[00025f7e] 6676                      bne.s      $00025FF6
[00025f80] 3004                      move.w     d4,d0
[00025f82] 204a                      movea.l    a2,a0
[00025f84] 4eb9 0004 7f76            jsr        Adr_del
[00025f8a] 3004                      move.w     d4,d0
[00025f8c] 206a 0014                 movea.l    20(a2),a0
[00025f90] 6100 f5b0                 bsr        find_drop
[00025f94] 3a00                      move.w     d0,d5
[00025f96] 377c ffff 0018            move.w     #$FFFF,24(a3)
[00025f9c] 4241                      clr.w      d1
[00025f9e] 204a                      movea.l    a2,a0
[00025fa0] 3004                      move.w     d4,d0
[00025fa2] 4eb9 0002 d96c            jsr        del_obentry
[00025fa8] 4241                      clr.w      d1
[00025faa] 3005                      move.w     d5,d0
[00025fac] 204a                      movea.l    a2,a0
[00025fae] 4eb9 0002 d96c            jsr        del_obentry
[00025fb4] 206b 0004                 movea.l    4(a3),a0
[00025fb8] 4eb9 0002 d4ee            jsr        pack_ob
[00025fbe] 206b 0004                 movea.l    4(a3),a0
[00025fc2] 2068 0004                 movea.l    4(a0),a0
[00025fc6] 6100 f484                 bsr        align
[00025fca] 204a                      movea.l    a2,a0
[00025fcc] 226a 0010                 movea.l    16(a2),a1
[00025fd0] 4e91                      jsr        (a1)
[00025fd2] 7a01                      moveq.l    #1,d5
[00025fd4] 206a 0014                 movea.l    20(a2),a0
[00025fd8] 3228 0002                 move.w     2(a0),d1
[00025fdc] 48c1                      ext.l      d1
[00025fde] 2001                      move.l     d1,d0
[00025fe0] d080                      add.l      d0,d0
[00025fe2] d081                      add.l      d1,d0
[00025fe4] e788                      lsl.l      #3,d0
[00025fe6] da70 081a                 add.w      26(a0,d0.l),d5
[00025fea] 204a                      movea.l    a2,a0
[00025fec] 3005                      move.w     d5,d0
[00025fee] 4eb9 0005 1b80            jsr        Awi_obredraw
[00025ff4] 6024                      bra.s      $0002601A
[00025ff6] 4eb9 0004 7e2a            jsr        Adr_next
[00025ffc] 3800                      move.w     d0,d4
[00025ffe] 6a00 ff46                 bpl        $00025F46
[00026002] 206b 0004                 movea.l    4(a3),a0
[00026006] 4eb9 0002 d4ee            jsr        pack_ob
[0002600c] 204a                      movea.l    a2,a0
[0002600e] 226a 0010                 movea.l    16(a2),a1
[00026012] 4e91                      jsr        (a1)
[00026014] 377c ffff 000a            move.w     #$FFFF,10(a3)
[0002601a] 4cdf 1c38                 movem.l    (a7)+,d3-d5/a2-a4
[0002601e] 4e75                      rts
title_rubber:
[00026020] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[00026024] 4fef ffe8                 lea.l      -24(a7),a7
[00026028] 2f48 0014                 move.l     a0,20(a7)
[0002602c] 2c49                      movea.l    a1,a6
[0002602e] 3600                      move.w     d0,d3
[00026030] 3801                      move.w     d1,d4
[00026032] 266f 0044                 movea.l    68(a7),a3
[00026036] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002603c] 2069 023c                 movea.l    572(a1),a0
[00026040] 41e8 0044                 lea.l      68(a0),a0
[00026044] 4eb9 0004 ee3c            jsr        Amo_new
[0002604a] 486f 0012                 pea.l      18(a7)
[0002604e] 486f 0014                 pea.l      20(a7)
[00026052] 224e                      movea.l    a6,a1
[00026054] 206f 001c                 movea.l    28(a7),a0
[00026058] 4eb9 0002 e3da            jsr        min_size
[0002605e] 504f                      addq.w     #8,a7
[00026060] d76f 0010                 add.w      d3,16(a7)
[00026064] 3a2e 0016                 move.w     22(a6),d5
[00026068] da44                      add.w      d4,d5
[0002606a] 3c03                      move.w     d3,d6
[0002606c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026072] dc68 0012                 add.w      18(a0),d6
[00026076] 3e28 0012                 move.w     18(a0),d7
[0002607a] eb4f                      lsl.w      #5,d7
[0002607c] de6f 0010                 add.w      16(a7),d7
[00026080] 4240                      clr.w      d0
[00026082] 3f40 0002                 move.w     d0,2(a7)
[00026086] 3e80                      move.w     d0,(a7)
[00026088] 3228 0008                 move.w     8(a0),d1
[0002608c] d268 000c                 add.w      12(a0),d1
[00026090] 3f41 0004                 move.w     d1,4(a7)
[00026094] 3028 000a                 move.w     10(a0),d0
[00026098] d068 000e                 add.w      14(a0),d0
[0002609c] 3f40 0006                 move.w     d0,6(a7)
[000260a0] 41d7                      lea.l      (a7),a0
[000260a2] 2279 0010 ee4e            movea.l    ACSblk,a1
[000260a8] 3029 0010                 move.w     16(a1),d0
[000260ac] 7201                      moveq.l    #1,d1
[000260ae] 4eb9 0007 2230            jsr        vs_clip
[000260b4] 7203                      moveq.l    #3,d1
[000260b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000260bc] 3028 0010                 move.w     16(a0),d0
[000260c0] 4eb9 0007 3070            jsr        vswr_mode
[000260c6] 7201                      moveq.l    #1,d1
[000260c8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000260ce] 3028 0010                 move.w     16(a0),d0
[000260d2] 4eb9 0007 316a            jsr        vsl_width
[000260d8] 7201                      moveq.l    #1,d1
[000260da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000260e0] 3028 0010                 move.w     16(a0),d0
[000260e4] 4eb9 0007 31c0            jsr        vsl_color
[000260ea] 4242                      clr.w      d2
[000260ec] 4241                      clr.w      d1
[000260ee] 2079 0010 ee4e            movea.l    ACSblk,a0
[000260f4] 3028 0010                 move.w     16(a0),d0
[000260f8] 4eb9 0007 3214            jsr        vsl_ends
[000260fe] 7207                      moveq.l    #7,d1
[00026100] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026106] 3028 0010                 move.w     16(a0),d0
[0002610a] 4eb9 0007 30c4            jsr        vsl_type
[00026110] 4df9 000e 692a            lea.l      _globl,a6
[00026116] 49ef 000c                 lea.l      12(a7),a4
[0002611a] 4bef 000e                 lea.l      14(a7),a5
[0002611e] 2f16                      move.l     (a6),-(a7)
[00026120] 4854                      pea.l      (a4)
[00026122] 4855                      pea.l      (a5)
[00026124] 43ef 001e                 lea.l      30(a7),a1
[00026128] 41ef 0014                 lea.l      20(a7),a0
[0002612c] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[00026132] 4fef 000c                 lea.l      12(a7),a7
[00026136] 45ef 000a                 lea.l      10(a7),a2
[0002613a] 36af 0008                 move.w     8(a7),(a3)
[0002613e] 7004                      moveq.l    #4,d0
[00026140] c054                      and.w      (a4),d0
[00026142] 6612                      bne.s      $00026156
[00026144] 3213                      move.w     (a3),d1
[00026146] b26f 0010                 cmp.w      16(a7),d1
[0002614a] 6c04                      bge.s      $00026150
[0002614c] 36af 0010                 move.w     16(a7),(a3)
[00026150] be53                      cmp.w      (a3),d7
[00026152] 6c02                      bge.s      $00026156
[00026154] 3687                      move.w     d7,(a3)
[00026156] bc53                      cmp.w      (a3),d6
[00026158] 6f02                      ble.s      $0002615C
[0002615a] 3686                      move.w     d6,(a3)
[0002615c] 7001                      moveq.l    #1,d0
[0002615e] c055                      and.w      (a5),d0
[00026160] 6632                      bne.s      $00026194
[00026162] 41d7                      lea.l      (a7),a0
[00026164] 4241                      clr.w      d1
[00026166] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002616c] 3029 0010                 move.w     16(a1),d0
[00026170] 4eb9 0007 2230            jsr        vs_clip
[00026176] 70ff                      moveq.l    #-1,d0
[00026178] d043                      add.w      d3,d0
[0002617a] 9153                      sub.w      d0,(a3)
[0002617c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026182] 2068 023c                 movea.l    572(a0),a0
[00026186] 41e8 0038                 lea.l      56(a0),a0
[0002618a] 4eb9 0004 ee3c            jsr        Amo_new
[00026190] 6000 00c6                 bra        $00026258
[00026194] 2256                      movea.l    (a6),a1
[00026196] 91c8                      suba.l     a0,a0
[00026198] 303c 0100                 move.w     #$0100,d0
[0002619c] 4eb9 0007 abe4            jsr        mt_graf_mouse
[000261a2] 3404                      move.w     d4,d2
[000261a4] 3213                      move.w     (a3),d1
[000261a6] 3003                      move.w     d3,d0
[000261a8] 4eb9 0004 7518            jsr        dotted_xline
[000261ae] 3405                      move.w     d5,d2
[000261b0] 3213                      move.w     (a3),d1
[000261b2] 3003                      move.w     d3,d0
[000261b4] 4eb9 0004 7518            jsr        dotted_xline
[000261ba] 3403                      move.w     d3,d2
[000261bc] 3205                      move.w     d5,d1
[000261be] 3004                      move.w     d4,d0
[000261c0] 4eb9 0004 75e6            jsr        dotted_yline
[000261c6] 3413                      move.w     (a3),d2
[000261c8] 3205                      move.w     d5,d1
[000261ca] 3004                      move.w     d4,d0
[000261cc] 4eb9 0004 75e6            jsr        dotted_yline
[000261d2] 2256                      movea.l    (a6),a1
[000261d4] 91c8                      suba.l     a0,a0
[000261d6] 303c 0101                 move.w     #$0101,d0
[000261da] 4eb9 0007 abe4            jsr        mt_graf_mouse
[000261e0] 2f16                      move.l     (a6),-(a7)
[000261e2] 4854                      pea.l      (a4)
[000261e4] 4855                      pea.l      (a5)
[000261e6] 43ef 001e                 lea.l      30(a7),a1
[000261ea] 204a                      movea.l    a2,a0
[000261ec] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[000261f2] 4fef 000c                 lea.l      12(a7),a7
[000261f6] 7001                      moveq.l    #1,d0
[000261f8] c055                      and.w      (a5),d0
[000261fa] 6708                      beq.s      $00026204
[000261fc] 3212                      move.w     (a2),d1
[000261fe] b26f 0008                 cmp.w      8(a7),d1
[00026202] 67dc                      beq.s      $000261E0
[00026204] 2256                      movea.l    (a6),a1
[00026206] 91c8                      suba.l     a0,a0
[00026208] 303c 0100                 move.w     #$0100,d0
[0002620c] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00026212] 3404                      move.w     d4,d2
[00026214] 3213                      move.w     (a3),d1
[00026216] 3003                      move.w     d3,d0
[00026218] 4eb9 0004 7518            jsr        dotted_xline
[0002621e] 3405                      move.w     d5,d2
[00026220] 3213                      move.w     (a3),d1
[00026222] 3003                      move.w     d3,d0
[00026224] 4eb9 0004 7518            jsr        dotted_xline
[0002622a] 3403                      move.w     d3,d2
[0002622c] 3205                      move.w     d5,d1
[0002622e] 3004                      move.w     d4,d0
[00026230] 4eb9 0004 75e6            jsr        dotted_yline
[00026236] 3413                      move.w     (a3),d2
[00026238] 3205                      move.w     d5,d1
[0002623a] 3004                      move.w     d4,d0
[0002623c] 4eb9 0004 75e6            jsr        dotted_yline
[00026242] 2256                      movea.l    (a6),a1
[00026244] 91c8                      suba.l     a0,a0
[00026246] 303c 0101                 move.w     #$0101,d0
[0002624a] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00026250] 3f52 0008                 move.w     (a2),8(a7)
[00026254] 6000 fee0                 bra        $00026136
[00026258] 4fef 0018                 lea.l      24(a7),a7
[0002625c] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[00026260] 4e75                      rts
title_dragged:
[00026262] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026268] 3028 0260                 move.w     608(a0),d0
[0002626c] 2068 0258                 movea.l    600(a0),a0
[00026270] 4eb9 0002 6278            jsr        tdragged
[00026276] 4e75                      rts
tdragged:
[00026278] 48e7 1c20                 movem.l    d3-d5/a2,-(a7)
[0002627c] 2448                      movea.l    a0,a2
[0002627e] 3800                      move.w     d0,d4
[00026280] 41f9 0010 ee4e            lea.l      ACSblk,a0
[00026286] 2250                      movea.l    (a0),a1
[00026288] b5e9 0240                 cmpa.l     576(a1),a2
[0002628c] 660c                      bne.s      $0002629A
[0002628e] 7003                      moveq.l    #3,d0
[00026290] c069 0266                 and.w      614(a1),d0
[00026294] 6604                      bne.s      $0002629A
[00026296] 7601                      moveq.l    #1,d3
[00026298] 6002                      bra.s      $0002629C
[0002629a] 4243                      clr.w      d3
[0002629c] 2250                      movea.l    (a0),a1
[0002629e] 4269 0248                 clr.w      584(a1)
[000262a2] 600c                      bra.s      $000262B0
[000262a4] 3403                      move.w     d3,d2
[000262a6] 3204                      move.w     d4,d1
[000262a8] 3005                      move.w     d5,d0
[000262aa] 204a                      movea.l    a2,a0
[000262ac] 6100 f71a                 bsr        make_title
[000262b0] 4eb9 0004 7e2a            jsr        Adr_next
[000262b6] 3a00                      move.w     d0,d5
[000262b8] 6aea                      bpl.s      $000262A4
[000262ba] 4cdf 0438                 movem.l    (a7)+,d3-d5/a2
[000262be] 4e75                      rts
title_edit:
[000262c0] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[000262c4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000262ca] 2468 0258                 movea.l    600(a0),a2
[000262ce] 266a 0014                 movea.l    20(a2),a3
[000262d2] 3628 0260                 move.w     608(a0),d3
[000262d6] 3203                      move.w     d3,d1
[000262d8] 48c1                      ext.l      d1
[000262da] 2001                      move.l     d1,d0
[000262dc] d080                      add.l      d0,d0
[000262de] d081                      add.l      d1,d0
[000262e0] e788                      lsl.l      #3,d0
[000262e2] 3433 080a                 move.w     10(a3,d0.l),d2
[000262e6] c47c 4000                 and.w      #$4000,d2
[000262ea] 6706                      beq.s      $000262F2
[000262ec] 6100 fb7a                 bsr        obspec_only
[000262f0] 6036                      bra.s      $00026328
[000262f2] 7001                      moveq.l    #1,d0
[000262f4] 3403                      move.w     d3,d2
[000262f6] 48c2                      ext.l      d2
[000262f8] 2202                      move.l     d2,d1
[000262fa] d281                      add.l      d1,d1
[000262fc] d282                      add.l      d2,d1
[000262fe] e789                      lsl.l      #3,d1
[00026300] c073 180a                 and.w      10(a3,d1.l),d0
[00026304] 670c                      beq.s      $00026312
[00026306] 204a                      movea.l    a2,a0
[00026308] 3003                      move.w     d3,d0
[0002630a] 4eb9 0002 632e            jsr        title_dragsize
[00026310] 6016                      bra.s      $00026328
[00026312] 3203                      move.w     d3,d1
[00026314] 48c1                      ext.l      d1
[00026316] 2001                      move.l     d1,d0
[00026318] d080                      add.l      d0,d0
[0002631a] d081                      add.l      d1,d0
[0002631c] e788                      lsl.l      #3,d0
[0002631e] 0073 0001 080a            ori.w      #$0001,10(a3,d0.l)
[00026324] 6100 fa3e                 bsr        new_title
[00026328] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0002632c] 4e75                      rts
title_dragsize:
[0002632e] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[00026332] 4fef fff4                 lea.l      -12(a7),a7
[00026336] 2448                      movea.l    a0,a2
[00026338] 3600                      move.w     d0,d3
[0002633a] 2f39 000e 692a            move.l     _globl,-(a7)
[00026340] 486f 0004                 pea.l      4(a7)
[00026344] 486f 0008                 pea.l      8(a7)
[00026348] 43ef 000e                 lea.l      14(a7),a1
[0002634c] 41ef 0010                 lea.l      16(a7),a0
[00026350] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[00026356] 4fef 000c                 lea.l      12(a7),a7
[0002635a] 3203                      move.w     d3,d1
[0002635c] 48c1                      ext.l      d1
[0002635e] 2001                      move.l     d1,d0
[00026360] d080                      add.l      d0,d0
[00026362] d081                      add.l      d1,d0
[00026364] e788                      lsl.l      #3,d0
[00026366] 266a 0014                 movea.l    20(a2),a3
[0002636a] 47f3 08e8                 lea.l      -24(a3,d0.l),a3
[0002636e] 2f39 000e 692a            move.l     _globl,-(a7)
[00026374] 486f 000c                 pea.l      12(a7)
[00026378] 43ef 0012                 lea.l      18(a7),a1
[0002637c] 206a 0014                 movea.l    20(a2),a0
[00026380] 3003                      move.w     d3,d0
[00026382] 4eb9 0007 9d14            jsr        mt_objc_offset
[00026388] 504f                      addq.w     #8,a7
[0002638a] 302b 0014                 move.w     20(a3),d0
[0002638e] 322b 0016                 move.w     22(a3),d1
[00026392] 342a 0034                 move.w     52(a2),d2
[00026396] d46f 000a                 add.w      10(a7),d2
[0002639a] d440                      add.w      d0,d2
[0002639c] 946f 0004                 sub.w      4(a7),d2
[000263a0] 3f42 0006                 move.w     d2,6(a7)
[000263a4] 342a 0036                 move.w     54(a2),d2
[000263a8] d46f 0008                 add.w      8(a7),d2
[000263ac] d441                      add.w      d1,d2
[000263ae] 946f 0002                 sub.w      2(a7),d2
[000263b2] 0c6f 0008 0006            cmpi.w     #$0008,6(a7)
[000263b8] 6f0c                      ble.s      $000263C6
[000263ba] 3800                      move.w     d0,d4
[000263bc] e644                      asr.w      #3,d4
[000263be] 306f 0006                 movea.w    6(a7),a0
[000263c2] b0c4                      cmpa.w     d4,a0
[000263c4] 6e0e                      bgt.s      $000263D4
[000263c6] b47c 0008                 cmp.w      #$0008,d2
[000263ca] 6f36                      ble.s      $00026402
[000263cc] 3001                      move.w     d1,d0
[000263ce] e640                      asr.w      #3,d0
[000263d0] b440                      cmp.w      d0,d2
[000263d2] 6f2e                      ble.s      $00026402
[000263d4] 4eb9 0004 810e            jsr        Adr_unselect
[000263da] 026b fffe 0022            andi.w     #$FFFE,34(a3)
[000263e0] 3003                      move.w     d3,d0
[000263e2] 204a                      movea.l    a2,a0
[000263e4] 4eb9 0004 7e6a            jsr        Adr_add
[000263ea] 322f 0002                 move.w     2(a7),d1
[000263ee] 302f 0004                 move.w     4(a7),d0
[000263f2] 4eb9 0004 9140            jsr        Adr_drag
[000263f8] 4eb9 0004 810e            jsr        Adr_unselect
[000263fe] 6000 00a2                 bra        $000264A2
[00026402] 2052                      movea.l    (a2),a0
[00026404] 2068 0004                 movea.l    4(a0),a0
[00026408] 2868 0004                 movea.l    4(a0),a4
[0002640c] 70fe                      moveq.l    #-2,d0
[0002640e] d043                      add.w      d3,d0
[00026410] 48c0                      ext.l      d0
[00026412] 81fc 0003                 divs.w     #$0003,d0
[00026416] 3600                      move.w     d0,d3
[00026418] 486f 0006                 pea.l      6(a7)
[0002641c] 322f 000c                 move.w     12(a7),d1
[00026420] d26a 0036                 add.w      54(a2),d1
[00026424] 302f 000e                 move.w     14(a7),d0
[00026428] d06a 0034                 add.w      52(a2),d0
[0002642c] 224b                      movea.l    a3,a1
[0002642e] 3803                      move.w     d3,d4
[00026430] 48c4                      ext.l      d4
[00026432] 2404                      move.l     d4,d2
[00026434] e78a                      lsl.l      #3,d2
[00026436] 9484                      sub.l      d4,d2
[00026438] e78a                      lsl.l      #3,d2
[0002643a] 41f4 2800                 lea.l      0(a4,d2.l),a0
[0002643e] 6100 fbe0                 bsr        title_rubber
[00026442] 584f                      addq.w     #4,a7
[00026444] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002644a] 3028 0012                 move.w     18(a0),d0
[0002644e] 48c0                      ext.l      d0
[00026450] 81fc 0002                 divs.w     #$0002,d0
[00026454] d06f 0006                 add.w      6(a7),d0
[00026458] 48c0                      ext.l      d0
[0002645a] 81e8 0012                 divs.w     18(a0),d0
[0002645e] 3f40 0006                 move.w     d0,6(a7)
[00026462] 3403                      move.w     d3,d2
[00026464] 48c2                      ext.l      d2
[00026466] 2202                      move.l     d2,d1
[00026468] e789                      lsl.l      #3,d1
[0002646a] 9282                      sub.l      d2,d1
[0002646c] e789                      lsl.l      #3,d1
[0002646e] 3980 181c                 move.w     d0,28(a4,d1.l)
[00026472] 204c                      movea.l    a4,a0
[00026474] 6100 efd6                 bsr        align
[00026478] 204a                      movea.l    a2,a0
[0002647a] 226a 0010                 movea.l    16(a2),a1
[0002647e] 4e91                      jsr        (a1)
[00026480] 7601                      moveq.l    #1,d3
[00026482] 206a 0014                 movea.l    20(a2),a0
[00026486] 3228 0002                 move.w     2(a0),d1
[0002648a] 48c1                      ext.l      d1
[0002648c] 2001                      move.l     d1,d0
[0002648e] d080                      add.l      d0,d0
[00026490] d081                      add.l      d1,d0
[00026492] e788                      lsl.l      #3,d0
[00026494] d670 081a                 add.w      26(a0,d0.l),d3
[00026498] 204a                      movea.l    a2,a0
[0002649a] 3003                      move.w     d3,d0
[0002649c] 4eb9 0005 1b80            jsr        Awi_obredraw
[000264a2] 4fef 000c                 lea.l      12(a7),a7
[000264a6] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[000264aa] 4e75                      rts

	.data

droptree:
[000bb5ca]                           dc.w $0000
[000bb5cc]                           dc.w $0000
[000bb5ce]                           dc.w $0000
[000bb5d0]                           dc.w $0000
[000bb5d2]                           dc.w $ffff
[000bb5d4]                           dc.w $ffff
[000bb5d6]                           dc.w $ffff
[000bb5d8]                           dc.w $0014
[000bb5da]                           dc.w $0000
[000bb5dc]                           dc.w $0000
[000bb5de]                           dc.w $00ff
[000bb5e0]                           dc.w $1101
[000bb5e2]                           dc.w $0000
[000bb5e4]                           dc.w $0000
[000bb5e6]                           dc.w $000c
[000bb5e8]                           dc.w $0001
[000bb5ea]                           dc.w $0000
[000bb5ec]                           dc.w $0000
[000bb5ee]                           dc.w $0000
[000bb5f0]                           dc.w $0000
[000bb5f2]                           dc.w $8000
[000bb5f4]                           dc.w $0000
[000bb5f6]                           dc.w $0000
[000bb5f8]                           dc.w $0000
[000bb5fa]                           dc.w $0000
[000bb5fc]                           dc.w $0000
[000bb5fe]                           dc.w $0000
[000bb600]                           dc.w $0000
protodrop:
[000bb602]                           dc.w $0000
[000bb604]                           dc.w $0000
[000bb606] 000bb5ca                  dc.l droptree
[000bb60a]                           dc.w $0000
[000bb60c]                           dc.w $0000
[000bb60e]                           dc.w $0038
[000bb610]                           dc.w $0000
[000bb612]                           dc.w $0038
[000bb614]                           dc.w $0000
[000bb616]                           dc.w $0000
[000bb618]                           dc.b 'DROPPROTO',0
[000bb622]                           dc.w $0000
[000bb624]                           dc.w $0000
[000bb626]                           dc.w $0000
[000bb628]                           dc.w $0000
[000bb62a]                           dc.w $0000
[000bb62c]                           dc.w $0000
[000bb62e]                           dc.w $0000
[000bb630]                           dc.w $0000
[000bb632]                           dc.w $0000
[000bb634]                           dc.w $0000
[000bb636]                           dc.w $0000
[000bb638]                           dc.w $0001
[000bb63a]                           dc.w $0000
[000bb63c]                           dc.w $0000
[000bb63e]                           dc.w $0000
[000bb640]                           dc.w $0000
[000bb642]                           dc.w $0000
[000bb644]                           dc.b ' NAME',0
[000bb64a]                           dc.b '  ACC EINTRAG',0
