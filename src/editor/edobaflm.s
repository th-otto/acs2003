set_it:
[00032714] 48e7 0830                 movem.l    d4/a2-a3,-(a7)
[00032718] 2448                      movea.l    a0,a2
[0003271a] 3801                      move.w     d1,d4
[0003271c] 2649                      movea.l    a1,a3
[0003271e] 48c0                      ext.l      d0
[00032720] 2200                      move.l     d0,d1
[00032722] d281                      add.l      d1,d1
[00032724] d280                      add.l      d0,d1
[00032726] e789                      lsl.l      #3,d1
[00032728] 3232 1802                 move.w     2(a2,d1.l),d1
[0003272c] 48c1                      ext.l      d1
[0003272e] 2401                      move.l     d1,d2
[00032730] d482                      add.l      d2,d2
[00032732] d481                      add.l      d1,d2
[00032734] e78a                      lsl.l      #3,d2
[00032736] 41f2 2800                 lea.l      0(a2,d2.l),a0
[0003273a] 7408                      moveq.l    #8,d2
[0003273c] c468 000a                 and.w      10(a0),d2
[00032740] 6612                      bne.s      $00032754
[00032742] 7001                      moveq.l    #1,d0
[00032744] c068 000a                 and.w      10(a0),d0
[00032748] 6704                      beq.s      $0003274E
[0003274a] 8951                      or.w       d4,(a1)
[0003274c] 6006                      bra.s      $00032754
[0003274e] 3004                      move.w     d4,d0
[00032750] 4640                      not.w      d0
[00032752] c153                      and.w      d0,(a3)
[00032754] 4cdf 0c10                 movem.l    (a7)+,d4/a2-a3
[00032758] 4e75                      rts
edafl_ok:
[0003275a] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0003275e] 514f                      subq.w     #8,a7
[00032760] 2079 0010 ee4e            movea.l    ACSblk,a0
[00032766] 2268 0258                 movea.l    600(a0),a1
[0003276a] 2051                      movea.l    (a1),a0
[0003276c] 2469 0014                 movea.l    20(a1),a2
[00032770] 2250                      movea.l    (a0),a1
[00032772] 0069 0001 0006            ori.w      #$0001,6(a1)
[00032778] 2268 0004                 movea.l    4(a0),a1
[0003277c] 2f69 0004 0004            move.l     4(a1),4(a7)
[00032782] 2ea8 001e                 move.l     30(a0),(a7)
[00032786] 6700 0190                 beq        $00032918
[0003278a] 2057                      movea.l    (a7),a0
[0003278c] 5497                      addq.l     #2,(a7)
[0003278e] 3610                      move.w     (a0),d3
[00032790] 4eb9 0004 eec0            jsr        Amo_busy
[00032796] 6000 016a                 bra        $00032902
[0003279a] 2057                      movea.l    (a7),a0
[0003279c] 5497                      addq.l     #2,(a7)
[0003279e] 3210                      move.w     (a0),d1
[000327a0] 48c1                      ext.l      d1
[000327a2] 2001                      move.l     d1,d0
[000327a4] e788                      lsl.l      #3,d0
[000327a6] 9081                      sub.l      d1,d0
[000327a8] e788                      lsl.l      #3,d0
[000327aa] 266f 0004                 movea.l    4(a7),a3
[000327ae] d7c0                      adda.l     d0,a3
[000327b0] 49eb 0010                 lea.l      16(a3),a4
[000327b4] 224c                      movea.l    a4,a1
[000327b6] 7204                      moveq.l    #4,d1
[000327b8] 7002                      moveq.l    #2,d0
[000327ba] 204a                      movea.l    a2,a0
[000327bc] 6100 ff56                 bsr        set_it
[000327c0] 224c                      movea.l    a4,a1
[000327c2] 7240                      moveq.l    #64,d1
[000327c4] 700b                      moveq.l    #11,d0
[000327c6] 204a                      movea.l    a2,a0
[000327c8] 6100 ff4a                 bsr        set_it
[000327cc] 224c                      movea.l    a4,a1
[000327ce] 7202                      moveq.l    #2,d1
[000327d0] 7014                      moveq.l    #20,d0
[000327d2] 204a                      movea.l    a2,a0
[000327d4] 6100 ff3e                 bsr        set_it
[000327d8] 224c                      movea.l    a4,a1
[000327da] 323c 4000                 move.w     #$4000,d1
[000327de] 701d                      moveq.l    #29,d0
[000327e0] 204a                      movea.l    a2,a0
[000327e2] 6100 ff30                 bsr        set_it
[000327e6] 224c                      movea.l    a4,a1
[000327e8] 7201                      moveq.l    #1,d1
[000327ea] 7005                      moveq.l    #5,d0
[000327ec] 204a                      movea.l    a2,a0
[000327ee] 6100 ff24                 bsr        set_it
[000327f2] 303c 0080                 move.w     #$0080,d0
[000327f6] c06a 0158                 and.w      344(a2),d0
[000327fa] 660c                      bne.s      $00032808
[000327fc] 224c                      movea.l    a4,a1
[000327fe] 7208                      moveq.l    #8,d1
[00032800] 204a                      movea.l    a2,a0
[00032802] 700e                      moveq.l    #14,d0
[00032804] 6100 ff0e                 bsr        set_it
[00032808] 224c                      movea.l    a4,a1
[0003280a] 7210                      moveq.l    #16,d1
[0003280c] 7017                      moveq.l    #23,d0
[0003280e] 204a                      movea.l    a2,a0
[00032810] 6100 ff02                 bsr        set_it
[00032814] 224c                      movea.l    a4,a1
[00032816] 323c 2000                 move.w     #$2000,d1
[0003281a] 7008                      moveq.l    #8,d0
[0003281c] 204a                      movea.l    a2,a0
[0003281e] 6100 fef4                 bsr        set_it
[00032822] 224c                      movea.l    a4,a1
[00032824] 323c 1000                 move.w     #$1000,d1
[00032828] 7011                      moveq.l    #17,d0
[0003282a] 204a                      movea.l    a2,a0
[0003282c] 6100 fee6                 bsr        set_it
[00032830] 224c                      movea.l    a4,a1
[00032832] 323c 0800                 move.w     #$0800,d1
[00032836] 701a                      moveq.l    #26,d0
[00032838] 204a                      movea.l    a2,a0
[0003283a] 6100 fed8                 bsr        set_it
[0003283e] 303c 0080                 move.w     #$0080,d0
[00032842] c06a 0518                 and.w      1304(a2),d0
[00032846] 6628                      bne.s      $00032870
[00032848] 0254 f9ff                 andi.w     #$F9FF,(a4)
[0003284c] 7001                      moveq.l    #1,d0
[0003284e] c06a 0562                 and.w      1378(a2),d0
[00032852] 6704                      beq.s      $00032858
[00032854] 0054 0200                 ori.w      #$0200,(a4)
[00032858] 7001                      moveq.l    #1,d0
[0003285a] c06a 05c2                 and.w      1474(a2),d0
[0003285e] 6704                      beq.s      $00032864
[00032860] 0054 0400                 ori.w      #$0400,(a4)
[00032864] 7001                      moveq.l    #1,d0
[00032866] c06a 0592                 and.w      1426(a2),d0
[0003286a] 6704                      beq.s      $00032870
[0003286c] 0054 0600                 ori.w      #$0600,(a4)
[00032870] 49eb 0012                 lea.l      18(a3),a4
[00032874] 224c                      movea.l    a4,a1
[00032876] 323c 2000                 move.w     #$2000,d1
[0003287a] 7020                      moveq.l    #32,d0
[0003287c] 204a                      movea.l    a2,a0
[0003287e] 6100 fe94                 bsr        set_it
[00032882] 224c                      movea.l    a4,a1
[00032884] 7201                      moveq.l    #1,d1
[00032886] 7024                      moveq.l    #36,d0
[00032888] 204a                      movea.l    a2,a0
[0003288a] 6100 fe88                 bsr        set_it
[0003288e] 224c                      movea.l    a4,a1
[00032890] 7208                      moveq.l    #8,d1
[00032892] 702a                      moveq.l    #42,d0
[00032894] 204a                      movea.l    a2,a0
[00032896] 6100 fe7c                 bsr        set_it
[0003289a] 224c                      movea.l    a4,a1
[0003289c] 7202                      moveq.l    #2,d1
[0003289e] 7027                      moveq.l    #39,d0
[000328a0] 204a                      movea.l    a2,a0
[000328a2] 6100 fe70                 bsr        set_it
[000328a6] 224c                      movea.l    a4,a1
[000328a8] 7204                      moveq.l    #4,d1
[000328aa] 702d                      moveq.l    #45,d0
[000328ac] 204a                      movea.l    a2,a0
[000328ae] 6100 fe64                 bsr        set_it
[000328b2] 224c                      movea.l    a4,a1
[000328b4] 7210                      moveq.l    #16,d1
[000328b6] 7030                      moveq.l    #48,d0
[000328b8] 204a                      movea.l    a2,a0
[000328ba] 6100 fe58                 bsr        set_it
[000328be] 224c                      movea.l    a4,a1
[000328c0] 7220                      moveq.l    #32,d1
[000328c2] 7033                      moveq.l    #51,d0
[000328c4] 204a                      movea.l    a2,a0
[000328c6] 6100 fe4c                 bsr        set_it
[000328ca] 224c                      movea.l    a4,a1
[000328cc] 323c 0200                 move.w     #$0200,d1
[000328d0] 7040                      moveq.l    #64,d0
[000328d2] 204a                      movea.l    a2,a0
[000328d4] 6100 fe3e                 bsr        set_it
[000328d8] 224c                      movea.l    a4,a1
[000328da] 323c 0400                 move.w     #$0400,d1
[000328de] 7049                      moveq.l    #73,d0
[000328e0] 204a                      movea.l    a2,a0
[000328e2] 6100 fe30                 bsr        set_it
[000328e6] 224c                      movea.l    a4,a1
[000328e8] 323c 0100                 move.w     #$0100,d1
[000328ec] 7043                      moveq.l    #67,d0
[000328ee] 204a                      movea.l    a2,a0
[000328f0] 6100 fe22                 bsr        set_it
[000328f4] 224c                      movea.l    a4,a1
[000328f6] 323c 0800                 move.w     #$0800,d1
[000328fa] 7046                      moveq.l    #70,d0
[000328fc] 204a                      movea.l    a2,a0
[000328fe] 6100 fe14                 bsr        set_it
[00032902] 3003                      move.w     d3,d0
[00032904] 5343                      subq.w     #1,d3
[00032906] 4a40                      tst.w      d0
[00032908] 6e00 fe90                 bgt        $0003279A
[0003290c] 4eb9 0004 ef0c            jsr        Amo_unbusy
[00032912] 4eb9 0002 f27c            jsr        ed_abort
[00032918] 504f                      addq.w     #8,a7
[0003291a] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0003291e] 4e75                      rts
preset_it:
[00032920] 48e7 1c20                 movem.l    d3-d5/a2,-(a7)
[00032924] 2448                      movea.l    a0,a2
[00032926] 3600                      move.w     d0,d3
[00032928] 3801                      move.w     d1,d4
[0003292a] 3a02                      move.w     d2,d5
[0003292c] 48c0                      ext.l      d0
[0003292e] 2200                      move.l     d0,d1
[00032930] d281                      add.l      d1,d1
[00032932] d280                      add.l      d0,d1
[00032934] e789                      lsl.l      #3,d1
[00032936] 3232 1802                 move.w     2(a2,d1.l),d1
[0003293a] 48c1                      ext.l      d1
[0003293c] 2401                      move.l     d1,d2
[0003293e] d482                      add.l      d2,d2
[00032940] d481                      add.l      d1,d2
[00032942] e78a                      lsl.l      #3,d2
[00032944] 41f2 2800                 lea.l      0(a2,d2.l),a0
[00032948] 4a44                      tst.w      d4
[0003294a] 6604                      bne.s      $00032950
[0003294c] 4a45                      tst.w      d5
[0003294e] 6706                      beq.s      $00032956
[00032950] 0268 fff7 000a            andi.w     #$FFF7,10(a0)
[00032956] 4a44                      tst.w      d4
[00032958] 6706                      beq.s      $00032960
[0003295a] 0068 0001 000a            ori.w      #$0001,10(a0)
[00032960] 0c6f 0001 0014            cmpi.w     #$0001,20(a7)
[00032966] 6616                      bne.s      $0003297E
[00032968] 3203                      move.w     d3,d1
[0003296a] 48c1                      ext.l      d1
[0003296c] 2001                      move.l     d1,d0
[0003296e] d080                      add.l      d0,d0
[00032970] d081                      add.l      d1,d0
[00032972] e788                      lsl.l      #3,d0
[00032974] 25bc 0003 2d8a 0818       move.l     #ea_duostate,24(a2,d0.l)
[0003297c] 6014                      bra.s      $00032992
[0003297e] 3203                      move.w     d3,d1
[00032980] 48c1                      ext.l      d1
[00032982] 2001                      move.l     d1,d0
[00032984] d080                      add.l      d0,d0
[00032986] d081                      add.l      d1,d0
[00032988] e788                      lsl.l      #3,d0
[0003298a] 25bc 0003 2d0e 0818       move.l     #ea_tristate,24(a2,d0.l)
[00032992] 4cdf 0438                 movem.l    (a7)+,d3-d5/a2
[00032996] 4e75                      rts
set_aflags:
[00032998] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[0003299c] 554f                      subq.w     #2,a7
[0003299e] 4243                      clr.w      d3
[000329a0] 47f9 000c c866            lea.l      sm,a3
[000329a6] 41eb f760                 lea.l      -2208(a3),a0
[000329aa] 4eb9 0004 f064            jsr        Aob_create
[000329b0] 2448                      movea.l    a0,a2
[000329b2] 200a                      move.l     a2,d0
[000329b4] 6606                      bne.s      $000329BC
[000329b6] 91c8                      suba.l     a0,a0
[000329b8] 6000 034c                 bra        $00032D06
[000329bc] 268a                      move.l     a2,(a3)
[000329be] 2079 0010 ee4e            movea.l    ACSblk,a0
[000329c4] 2268 0258                 movea.l    600(a0),a1
[000329c8] 2a51                      movea.l    (a1),a5
[000329ca] 383c ffff                 move.w     #$FFFF,d4
[000329ce] 3a04                      move.w     d4,d5
[000329d0] 4246                      clr.w      d6
[000329d2] 3e06                      move.w     d6,d7
[000329d4] 4eb9 0004 eec0            jsr        Amo_busy
[000329da] 4eb9 0004 7e1e            jsr        Adr_start
[000329e0] 6034                      bra.s      $00032A16
[000329e2] 72fe                      moveq.l    #-2,d1
[000329e4] d257                      add.w      (a7),d1
[000329e6] 48c1                      ext.l      d1
[000329e8] 83fc 0003                 divs.w     #$0003,d1
[000329ec] 48c1                      ext.l      d1
[000329ee] 2001                      move.l     d1,d0
[000329f0] e788                      lsl.l      #3,d0
[000329f2] 9081                      sub.l      d1,d0
[000329f4] e788                      lsl.l      #3,d0
[000329f6] 206d 0004                 movea.l    4(a5),a0
[000329fa] 2068 0004                 movea.l    4(a0),a0
[000329fe] d1c0                      adda.l     d0,a0
[00032a00] 49e8 0008                 lea.l      8(a0),a4
[00032a04] ca6c 000a                 and.w      10(a4),d5
[00032a08] 8e6c 000a                 or.w       10(a4),d7
[00032a0c] c86c 0008                 and.w      8(a4),d4
[00032a10] 8c6c 0008                 or.w       8(a4),d6
[00032a14] 5243                      addq.w     #1,d3
[00032a16] 4eb9 0004 7e2a            jsr        Adr_next
[00032a1c] 3e80                      move.w     d0,(a7)
[00032a1e] 6ac2                      bpl.s      $000329E2
[00032a20] 4bf9 0010 c58e            lea.l      wintitel,a5
[00032a26] b67c 0001                 cmp.w      #$0001,d3
[00032a2a] 6648                      bne.s      $00032A74
[00032a2c] 43eb f2ea                 lea.l      -3350(a3),a1
[00032a30] 204d                      movea.l    a5,a0
[00032a32] 4eb9 0008 2f0c            jsr        strcpy
[00032a38] 302c 0008                 move.w     8(a4),d0
[00032a3c] c07c 0600                 and.w      #$0600,d0
[00032a40] 907c 0200                 sub.w      #$0200,d0
[00032a44] 670e                      beq.s      $00032A54
[00032a46] 907c 0200                 sub.w      #$0200,d0
[00032a4a] 6710                      beq.s      $00032A5C
[00032a4c] 907c 0200                 sub.w      #$0200,d0
[00032a50] 6712                      beq.s      $00032A64
[00032a52] 6018                      bra.s      $00032A6C
[00032a54] 006a 0001 0562            ori.w      #$0001,1378(a2)
[00032a5a] 602e                      bra.s      $00032A8A
[00032a5c] 006a 0001 05c2            ori.w      #$0001,1474(a2)
[00032a62] 6026                      bra.s      $00032A8A
[00032a64] 006a 0001 0592            ori.w      #$0001,1426(a2)
[00032a6a] 601e                      bra.s      $00032A8A
[00032a6c] 006a 0001 0532            ori.w      #$0001,1330(a2)
[00032a72] 6016                      bra.s      $00032A8A
[00032a74] 3f03                      move.w     d3,-(a7)
[00032a76] 43eb f2f4                 lea.l      -3340(a3),a1
[00032a7a] 204d                      movea.l    a5,a0
[00032a7c] 4eb9 0008 15ac            jsr        sprintf
[00032a82] 544f                      addq.w     #2,a7
[00032a84] 006a 0080 0518            ori.w      #$0080,1304(a2)
[00032a8a] 274d 000c                 move.l     a5,12(a3)
[00032a8e] 3f03                      move.w     d3,-(a7)
[00032a90] 7004                      moveq.l    #4,d0
[00032a92] c046                      and.w      d6,d0
[00032a94] 6604                      bne.s      $00032A9A
[00032a96] 7401                      moveq.l    #1,d2
[00032a98] 6002                      bra.s      $00032A9C
[00032a9a] 4242                      clr.w      d2
[00032a9c] 7204                      moveq.l    #4,d1
[00032a9e] c244                      and.w      d4,d1
[00032aa0] 7002                      moveq.l    #2,d0
[00032aa2] 204a                      movea.l    a2,a0
[00032aa4] 6100 fe7a                 bsr        preset_it
[00032aa8] 544f                      addq.w     #2,a7
[00032aaa] 3f03                      move.w     d3,-(a7)
[00032aac] 7040                      moveq.l    #64,d0
[00032aae] c046                      and.w      d6,d0
[00032ab0] 6604                      bne.s      $00032AB6
[00032ab2] 7401                      moveq.l    #1,d2
[00032ab4] 6002                      bra.s      $00032AB8
[00032ab6] 4242                      clr.w      d2
[00032ab8] 7240                      moveq.l    #64,d1
[00032aba] c244                      and.w      d4,d1
[00032abc] 700b                      moveq.l    #11,d0
[00032abe] 204a                      movea.l    a2,a0
[00032ac0] 6100 fe5e                 bsr        preset_it
[00032ac4] 544f                      addq.w     #2,a7
[00032ac6] 3f03                      move.w     d3,-(a7)
[00032ac8] 7002                      moveq.l    #2,d0
[00032aca] c046                      and.w      d6,d0
[00032acc] 6604                      bne.s      $00032AD2
[00032ace] 7401                      moveq.l    #1,d2
[00032ad0] 6002                      bra.s      $00032AD4
[00032ad2] 4242                      clr.w      d2
[00032ad4] 7202                      moveq.l    #2,d1
[00032ad6] c244                      and.w      d4,d1
[00032ad8] 7014                      moveq.l    #20,d0
[00032ada] 204a                      movea.l    a2,a0
[00032adc] 6100 fe42                 bsr        preset_it
[00032ae0] 544f                      addq.w     #2,a7
[00032ae2] 3f03                      move.w     d3,-(a7)
[00032ae4] 3006                      move.w     d6,d0
[00032ae6] c07c 4000                 and.w      #$4000,d0
[00032aea] 6604                      bne.s      $00032AF0
[00032aec] 7401                      moveq.l    #1,d2
[00032aee] 6002                      bra.s      $00032AF2
[00032af0] 4242                      clr.w      d2
[00032af2] 3204                      move.w     d4,d1
[00032af4] c27c 4000                 and.w      #$4000,d1
[00032af8] 701d                      moveq.l    #29,d0
[00032afa] 204a                      movea.l    a2,a0
[00032afc] 6100 fe22                 bsr        preset_it
[00032b00] 544f                      addq.w     #2,a7
[00032b02] 3f03                      move.w     d3,-(a7)
[00032b04] 7001                      moveq.l    #1,d0
[00032b06] c046                      and.w      d6,d0
[00032b08] 6604                      bne.s      $00032B0E
[00032b0a] 7401                      moveq.l    #1,d2
[00032b0c] 6002                      bra.s      $00032B10
[00032b0e] 4242                      clr.w      d2
[00032b10] 7201                      moveq.l    #1,d1
[00032b12] c244                      and.w      d4,d1
[00032b14] 7005                      moveq.l    #5,d0
[00032b16] 204a                      movea.l    a2,a0
[00032b18] 6100 fe06                 bsr        preset_it
[00032b1c] 544f                      addq.w     #2,a7
[00032b1e] 3f03                      move.w     d3,-(a7)
[00032b20] 7008                      moveq.l    #8,d0
[00032b22] c046                      and.w      d6,d0
[00032b24] 6604                      bne.s      $00032B2A
[00032b26] 7401                      moveq.l    #1,d2
[00032b28] 6002                      bra.s      $00032B2C
[00032b2a] 4242                      clr.w      d2
[00032b2c] 7208                      moveq.l    #8,d1
[00032b2e] c244                      and.w      d4,d1
[00032b30] 700e                      moveq.l    #14,d0
[00032b32] 204a                      movea.l    a2,a0
[00032b34] 6100 fdea                 bsr        preset_it
[00032b38] 544f                      addq.w     #2,a7
[00032b3a] 3f03                      move.w     d3,-(a7)
[00032b3c] 7010                      moveq.l    #16,d0
[00032b3e] c046                      and.w      d6,d0
[00032b40] 6604                      bne.s      $00032B46
[00032b42] 7401                      moveq.l    #1,d2
[00032b44] 6002                      bra.s      $00032B48
[00032b46] 4242                      clr.w      d2
[00032b48] 7210                      moveq.l    #16,d1
[00032b4a] c244                      and.w      d4,d1
[00032b4c] 7017                      moveq.l    #23,d0
[00032b4e] 204a                      movea.l    a2,a0
[00032b50] 6100 fdce                 bsr        preset_it
[00032b54] 544f                      addq.w     #2,a7
[00032b56] 3f03                      move.w     d3,-(a7)
[00032b58] 3006                      move.w     d6,d0
[00032b5a] c07c 2000                 and.w      #$2000,d0
[00032b5e] 6604                      bne.s      $00032B64
[00032b60] 7401                      moveq.l    #1,d2
[00032b62] 6002                      bra.s      $00032B66
[00032b64] 4242                      clr.w      d2
[00032b66] 3204                      move.w     d4,d1
[00032b68] c27c 2000                 and.w      #$2000,d1
[00032b6c] 7008                      moveq.l    #8,d0
[00032b6e] 204a                      movea.l    a2,a0
[00032b70] 6100 fdae                 bsr        preset_it
[00032b74] 544f                      addq.w     #2,a7
[00032b76] 3f03                      move.w     d3,-(a7)
[00032b78] 3006                      move.w     d6,d0
[00032b7a] c07c 1000                 and.w      #$1000,d0
[00032b7e] 6604                      bne.s      $00032B84
[00032b80] 7401                      moveq.l    #1,d2
[00032b82] 6002                      bra.s      $00032B86
[00032b84] 4242                      clr.w      d2
[00032b86] 3204                      move.w     d4,d1
[00032b88] c27c 1000                 and.w      #$1000,d1
[00032b8c] 7011                      moveq.l    #17,d0
[00032b8e] 204a                      movea.l    a2,a0
[00032b90] 6100 fd8e                 bsr        preset_it
[00032b94] 544f                      addq.w     #2,a7
[00032b96] 3f03                      move.w     d3,-(a7)
[00032b98] 3006                      move.w     d6,d0
[00032b9a] c07c 0800                 and.w      #$0800,d0
[00032b9e] 6604                      bne.s      $00032BA4
[00032ba0] 7401                      moveq.l    #1,d2
[00032ba2] 6002                      bra.s      $00032BA6
[00032ba4] 4242                      clr.w      d2
[00032ba6] 3204                      move.w     d4,d1
[00032ba8] c27c 0800                 and.w      #$0800,d1
[00032bac] 701a                      moveq.l    #26,d0
[00032bae] 204a                      movea.l    a2,a0
[00032bb0] 6100 fd6e                 bsr        preset_it
[00032bb4] 544f                      addq.w     #2,a7
[00032bb6] 3f03                      move.w     d3,-(a7)
[00032bb8] 3007                      move.w     d7,d0
[00032bba] c07c 2000                 and.w      #$2000,d0
[00032bbe] 6604                      bne.s      $00032BC4
[00032bc0] 7401                      moveq.l    #1,d2
[00032bc2] 6002                      bra.s      $00032BC6
[00032bc4] 4242                      clr.w      d2
[00032bc6] 3205                      move.w     d5,d1
[00032bc8] c27c 2000                 and.w      #$2000,d1
[00032bcc] 7020                      moveq.l    #32,d0
[00032bce] 204a                      movea.l    a2,a0
[00032bd0] 6100 fd4e                 bsr        preset_it
[00032bd4] 544f                      addq.w     #2,a7
[00032bd6] 3f03                      move.w     d3,-(a7)
[00032bd8] 7001                      moveq.l    #1,d0
[00032bda] c047                      and.w      d7,d0
[00032bdc] 6604                      bne.s      $00032BE2
[00032bde] 7401                      moveq.l    #1,d2
[00032be0] 6002                      bra.s      $00032BE4
[00032be2] 4242                      clr.w      d2
[00032be4] 7201                      moveq.l    #1,d1
[00032be6] c245                      and.w      d5,d1
[00032be8] 7024                      moveq.l    #36,d0
[00032bea] 204a                      movea.l    a2,a0
[00032bec] 6100 fd32                 bsr        preset_it
[00032bf0] 544f                      addq.w     #2,a7
[00032bf2] 3f03                      move.w     d3,-(a7)
[00032bf4] 7008                      moveq.l    #8,d0
[00032bf6] c047                      and.w      d7,d0
[00032bf8] 6604                      bne.s      $00032BFE
[00032bfa] 7401                      moveq.l    #1,d2
[00032bfc] 6002                      bra.s      $00032C00
[00032bfe] 4242                      clr.w      d2
[00032c00] 7208                      moveq.l    #8,d1
[00032c02] c245                      and.w      d5,d1
[00032c04] 702a                      moveq.l    #42,d0
[00032c06] 204a                      movea.l    a2,a0
[00032c08] 6100 fd16                 bsr        preset_it
[00032c0c] 544f                      addq.w     #2,a7
[00032c0e] 3f03                      move.w     d3,-(a7)
[00032c10] 7002                      moveq.l    #2,d0
[00032c12] c047                      and.w      d7,d0
[00032c14] 6604                      bne.s      $00032C1A
[00032c16] 7401                      moveq.l    #1,d2
[00032c18] 6002                      bra.s      $00032C1C
[00032c1a] 4242                      clr.w      d2
[00032c1c] 7202                      moveq.l    #2,d1
[00032c1e] c245                      and.w      d5,d1
[00032c20] 7027                      moveq.l    #39,d0
[00032c22] 204a                      movea.l    a2,a0
[00032c24] 6100 fcfa                 bsr        preset_it
[00032c28] 544f                      addq.w     #2,a7
[00032c2a] 3f03                      move.w     d3,-(a7)
[00032c2c] 7004                      moveq.l    #4,d0
[00032c2e] c047                      and.w      d7,d0
[00032c30] 6604                      bne.s      $00032C36
[00032c32] 7401                      moveq.l    #1,d2
[00032c34] 6002                      bra.s      $00032C38
[00032c36] 4242                      clr.w      d2
[00032c38] 7204                      moveq.l    #4,d1
[00032c3a] c245                      and.w      d5,d1
[00032c3c] 702d                      moveq.l    #45,d0
[00032c3e] 204a                      movea.l    a2,a0
[00032c40] 6100 fcde                 bsr        preset_it
[00032c44] 544f                      addq.w     #2,a7
[00032c46] 3f03                      move.w     d3,-(a7)
[00032c48] 7010                      moveq.l    #16,d0
[00032c4a] c047                      and.w      d7,d0
[00032c4c] 6604                      bne.s      $00032C52
[00032c4e] 7401                      moveq.l    #1,d2
[00032c50] 6002                      bra.s      $00032C54
[00032c52] 4242                      clr.w      d2
[00032c54] 7210                      moveq.l    #16,d1
[00032c56] c245                      and.w      d5,d1
[00032c58] 7030                      moveq.l    #48,d0
[00032c5a] 204a                      movea.l    a2,a0
[00032c5c] 6100 fcc2                 bsr        preset_it
[00032c60] 544f                      addq.w     #2,a7
[00032c62] 3f03                      move.w     d3,-(a7)
[00032c64] 7020                      moveq.l    #32,d0
[00032c66] c047                      and.w      d7,d0
[00032c68] 6604                      bne.s      $00032C6E
[00032c6a] 7401                      moveq.l    #1,d2
[00032c6c] 6002                      bra.s      $00032C70
[00032c6e] 4242                      clr.w      d2
[00032c70] 7220                      moveq.l    #32,d1
[00032c72] c245                      and.w      d5,d1
[00032c74] 7033                      moveq.l    #51,d0
[00032c76] 204a                      movea.l    a2,a0
[00032c78] 6100 fca6                 bsr        preset_it
[00032c7c] 544f                      addq.w     #2,a7
[00032c7e] 3f03                      move.w     d3,-(a7)
[00032c80] 3007                      move.w     d7,d0
[00032c82] c07c 0200                 and.w      #$0200,d0
[00032c86] 6604                      bne.s      $00032C8C
[00032c88] 7401                      moveq.l    #1,d2
[00032c8a] 6002                      bra.s      $00032C8E
[00032c8c] 4242                      clr.w      d2
[00032c8e] 3205                      move.w     d5,d1
[00032c90] c27c 0200                 and.w      #$0200,d1
[00032c94] 7040                      moveq.l    #64,d0
[00032c96] 204a                      movea.l    a2,a0
[00032c98] 6100 fc86                 bsr        preset_it
[00032c9c] 544f                      addq.w     #2,a7
[00032c9e] 3f03                      move.w     d3,-(a7)
[00032ca0] 3007                      move.w     d7,d0
[00032ca2] c07c 0400                 and.w      #$0400,d0
[00032ca6] 6604                      bne.s      $00032CAC
[00032ca8] 7401                      moveq.l    #1,d2
[00032caa] 6002                      bra.s      $00032CAE
[00032cac] 4242                      clr.w      d2
[00032cae] 3205                      move.w     d5,d1
[00032cb0] c27c 0400                 and.w      #$0400,d1
[00032cb4] 7049                      moveq.l    #73,d0
[00032cb6] 204a                      movea.l    a2,a0
[00032cb8] 6100 fc66                 bsr        preset_it
[00032cbc] 544f                      addq.w     #2,a7
[00032cbe] 3f03                      move.w     d3,-(a7)
[00032cc0] 3007                      move.w     d7,d0
[00032cc2] c07c 0100                 and.w      #$0100,d0
[00032cc6] 6604                      bne.s      $00032CCC
[00032cc8] 7401                      moveq.l    #1,d2
[00032cca] 6002                      bra.s      $00032CCE
[00032ccc] 4242                      clr.w      d2
[00032cce] 3205                      move.w     d5,d1
[00032cd0] c27c 0100                 and.w      #$0100,d1
[00032cd4] 7043                      moveq.l    #67,d0
[00032cd6] 204a                      movea.l    a2,a0
[00032cd8] 6100 fc46                 bsr        preset_it
[00032cdc] 544f                      addq.w     #2,a7
[00032cde] 3f03                      move.w     d3,-(a7)
[00032ce0] 3007                      move.w     d7,d0
[00032ce2] c07c 0800                 and.w      #$0800,d0
[00032ce6] 6604                      bne.s      $00032CEC
[00032ce8] 7401                      moveq.l    #1,d2
[00032cea] 6002                      bra.s      $00032CEE
[00032cec] 4242                      clr.w      d2
[00032cee] 3205                      move.w     d5,d1
[00032cf0] c27c 0800                 and.w      #$0800,d1
[00032cf4] 7046                      moveq.l    #70,d0
[00032cf6] 204a                      movea.l    a2,a0
[00032cf8] 6100 fc26                 bsr        preset_it
[00032cfc] 544f                      addq.w     #2,a7
[00032cfe] 4eb9 0004 ef0c            jsr        Amo_unbusy
[00032d04] 204b                      movea.l    a3,a0
[00032d06] 544f                      addq.w     #2,a7
[00032d08] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[00032d0c] 4e75                      rts
ea_tristate:
[00032d0e] 2f0a                      move.l     a2,-(a7)
[00032d10] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00032d16] 2052                      movea.l    (a2),a0
[00032d18] 3428 0260                 move.w     608(a0),d2
[00032d1c] 48c2                      ext.l      d2
[00032d1e] 2202                      move.l     d2,d1
[00032d20] d281                      add.l      d1,d1
[00032d22] d282                      add.l      d2,d1
[00032d24] e789                      lsl.l      #3,d1
[00032d26] 2268 025c                 movea.l    604(a0),a1
[00032d2a] 3231 1802                 move.w     2(a1,d1.l),d1
[00032d2e] 48c1                      ext.l      d1
[00032d30] 2001                      move.l     d1,d0
[00032d32] d080                      add.l      d0,d0
[00032d34] d081                      add.l      d1,d0
[00032d36] e788                      lsl.l      #3,d0
[00032d38] 2049                      movea.l    a1,a0
[00032d3a] d1c0                      adda.l     d0,a0
[00032d3c] 7008                      moveq.l    #8,d0
[00032d3e] c068 000a                 and.w      10(a0),d0
[00032d42] 670e                      beq.s      $00032D52
[00032d44] 0068 0001 000a            ori.w      #$0001,10(a0)
[00032d4a] 0268 fff7 000a            andi.w     #$FFF7,10(a0)
[00032d50] 6016                      bra.s      $00032D68
[00032d52] 7001                      moveq.l    #1,d0
[00032d54] c068 000a                 and.w      10(a0),d0
[00032d58] 6708                      beq.s      $00032D62
[00032d5a] 0268 fffe 000a            andi.w     #$FFFE,10(a0)
[00032d60] 6006                      bra.s      $00032D68
[00032d62] 0068 0008 000a            ori.w      #$0008,10(a0)
[00032d68] 72ff                      moveq.l    #-1,d1
[00032d6a] 2052                      movea.l    (a2),a0
[00032d6c] 3028 0260                 move.w     608(a0),d0
[00032d70] 2068 0258                 movea.l    600(a0),a0
[00032d74] 2252                      movea.l    (a2),a1
[00032d76] 2269 0258                 movea.l    600(a1),a1
[00032d7a] 2269 0066                 movea.l    102(a1),a1
[00032d7e] 4e91                      jsr        (a1)
[00032d80] 4eb9 0005 0c80            jsr        Aev_release
[00032d86] 245f                      movea.l    (a7)+,a2
[00032d88] 4e75                      rts
ea_duostate:
[00032d8a] 2f0a                      move.l     a2,-(a7)
[00032d8c] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00032d92] 2052                      movea.l    (a2),a0
[00032d94] 3428 0260                 move.w     608(a0),d2
[00032d98] 48c2                      ext.l      d2
[00032d9a] 2202                      move.l     d2,d1
[00032d9c] d281                      add.l      d1,d1
[00032d9e] d282                      add.l      d2,d1
[00032da0] e789                      lsl.l      #3,d1
[00032da2] 2268 025c                 movea.l    604(a0),a1
[00032da6] 3231 1802                 move.w     2(a1,d1.l),d1
[00032daa] 48c1                      ext.l      d1
[00032dac] 2001                      move.l     d1,d0
[00032dae] d080                      add.l      d0,d0
[00032db0] d081                      add.l      d1,d0
[00032db2] e788                      lsl.l      #3,d0
[00032db4] 2049                      movea.l    a1,a0
[00032db6] d1c0                      adda.l     d0,a0
[00032db8] 7001                      moveq.l    #1,d0
[00032dba] c068 000a                 and.w      10(a0),d0
[00032dbe] 6708                      beq.s      $00032DC8
[00032dc0] 0268 fffe 000a            andi.w     #$FFFE,10(a0)
[00032dc6] 6006                      bra.s      $00032DCE
[00032dc8] 0068 0001 000a            ori.w      #$0001,10(a0)
[00032dce] 72ff                      moveq.l    #-1,d1
[00032dd0] 2052                      movea.l    (a2),a0
[00032dd2] 3028 0260                 move.w     608(a0),d0
[00032dd6] 2068 0258                 movea.l    600(a0),a0
[00032dda] 2252                      movea.l    (a2),a1
[00032ddc] 2269 0258                 movea.l    600(a1),a1
[00032de0] 2269 0066                 movea.l    102(a1),a1
[00032de4] 4e91                      jsr        (a1)
[00032de6] 4eb9 0005 0c80            jsr        Aev_release
[00032dec] 245f                      movea.l    (a7)+,a2
[00032dee] 4e75                      rts
