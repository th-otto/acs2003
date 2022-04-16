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
[00032740] 6612                      bne.s      set_it_1
[00032742] 7001                      moveq.l    #1,d0
[00032744] c068 000a                 and.w      10(a0),d0
[00032748] 6704                      beq.s      set_it_2
[0003274a] 8951                      or.w       d4,(a1)
[0003274c] 6006                      bra.s      set_it_1
set_it_2:
[0003274e] 3004                      move.w     d4,d0
[00032750] 4640                      not.w      d0
[00032752] c153                      and.w      d0,(a3)
set_it_1:
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
[00032786] 6700 0190                 beq        edafl_ok_1
[0003278a] 2057                      movea.l    (a7),a0
[0003278c] 5497                      addq.l     #2,(a7)
[0003278e] 3610                      move.w     (a0),d3
[00032790] 4eb9 0004 eec0            jsr        Amo_busy
[00032796] 6000 016a                 bra        edafl_ok_2
edafl_ok_7:
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
[000327fa] 660c                      bne.s      edafl_ok_3
[000327fc] 224c                      movea.l    a4,a1
[000327fe] 7208                      moveq.l    #8,d1
[00032800] 204a                      movea.l    a2,a0
[00032802] 700e                      moveq.l    #14,d0
[00032804] 6100 ff0e                 bsr        set_it
edafl_ok_3:
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
[00032846] 6628                      bne.s      edafl_ok_4
[00032848] 0254 f9ff                 andi.w     #$F9FF,(a4)
[0003284c] 7001                      moveq.l    #1,d0
[0003284e] c06a 0562                 and.w      1378(a2),d0
[00032852] 6704                      beq.s      edafl_ok_5
[00032854] 0054 0200                 ori.w      #$0200,(a4)
edafl_ok_5:
[00032858] 7001                      moveq.l    #1,d0
[0003285a] c06a 05c2                 and.w      1474(a2),d0
[0003285e] 6704                      beq.s      edafl_ok_6
[00032860] 0054 0400                 ori.w      #$0400,(a4)
edafl_ok_6:
[00032864] 7001                      moveq.l    #1,d0
[00032866] c06a 0592                 and.w      1426(a2),d0
[0003286a] 6704                      beq.s      edafl_ok_4
[0003286c] 0054 0600                 ori.w      #$0600,(a4)
edafl_ok_4:
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
edafl_ok_2:
[00032902] 3003                      move.w     d3,d0
[00032904] 5343                      subq.w     #1,d3
[00032906] 4a40                      tst.w      d0
[00032908] 6e00 fe90                 bgt        edafl_ok_7
[0003290c] 4eb9 0004 ef0c            jsr        Amo_unbusy
[00032912] 4eb9 0002 f27c            jsr        ed_abort
edafl_ok_1:
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
[0003294a] 6604                      bne.s      preset_it_1
[0003294c] 4a45                      tst.w      d5
[0003294e] 6706                      beq.s      preset_it_2
preset_it_1:
[00032950] 0268 fff7 000a            andi.w     #$FFF7,10(a0)
preset_it_2:
[00032956] 4a44                      tst.w      d4
[00032958] 6706                      beq.s      preset_it_3
[0003295a] 0068 0001 000a            ori.w      #$0001,10(a0)
preset_it_3:
[00032960] 0c6f 0001 0014            cmpi.w     #$0001,20(a7)
[00032966] 6616                      bne.s      preset_it_4
[00032968] 3203                      move.w     d3,d1
[0003296a] 48c1                      ext.l      d1
[0003296c] 2001                      move.l     d1,d0
[0003296e] d080                      add.l      d0,d0
[00032970] d081                      add.l      d1,d0
[00032972] e788                      lsl.l      #3,d0
[00032974] 25bc 0003 2d8a 0818       move.l     #ea_duostate,24(a2,d0.l)
[0003297c] 6014                      bra.s      preset_it_5
preset_it_4:
[0003297e] 3203                      move.w     d3,d1
[00032980] 48c1                      ext.l      d1
[00032982] 2001                      move.l     d1,d0
[00032984] d080                      add.l      d0,d0
[00032986] d081                      add.l      d1,d0
[00032988] e788                      lsl.l      #3,d0
[0003298a] 25bc 0003 2d0e 0818       move.l     #ea_tristate,24(a2,d0.l)
preset_it_5:
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
[000329b4] 6606                      bne.s      set_aflags_1
[000329b6] 91c8                      suba.l     a0,a0
[000329b8] 6000 034c                 bra        set_aflags_2
set_aflags_1:
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
[000329e0] 6034                      bra.s      set_aflags_3
set_aflags_4:
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
set_aflags_3:
[00032a16] 4eb9 0004 7e2a            jsr        Adr_next
[00032a1c] 3e80                      move.w     d0,(a7)
[00032a1e] 6ac2                      bpl.s      set_aflags_4
[00032a20] 4bf9 0010 c58e            lea.l      wintitel,a5
[00032a26] b67c 0001                 cmp.w      #$0001,d3
[00032a2a] 6648                      bne.s      set_aflags_5
[00032a2c] 43eb f2ea                 lea.l      -3350(a3),a1
[00032a30] 204d                      movea.l    a5,a0
[00032a32] 4eb9 0008 2f0c            jsr        strcpy
[00032a38] 302c 0008                 move.w     8(a4),d0
[00032a3c] c07c 0600                 and.w      #$0600,d0
[00032a40] 907c 0200                 sub.w      #$0200,d0
[00032a44] 670e                      beq.s      set_aflags_6
[00032a46] 907c 0200                 sub.w      #$0200,d0
[00032a4a] 6710                      beq.s      set_aflags_7
[00032a4c] 907c 0200                 sub.w      #$0200,d0
[00032a50] 6712                      beq.s      set_aflags_8
[00032a52] 6018                      bra.s      set_aflags_9
set_aflags_6:
[00032a54] 006a 0001 0562            ori.w      #$0001,1378(a2)
[00032a5a] 602e                      bra.s      set_aflags_10
set_aflags_7:
[00032a5c] 006a 0001 05c2            ori.w      #$0001,1474(a2)
[00032a62] 6026                      bra.s      set_aflags_10
set_aflags_8:
[00032a64] 006a 0001 0592            ori.w      #$0001,1426(a2)
[00032a6a] 601e                      bra.s      set_aflags_10
set_aflags_9:
[00032a6c] 006a 0001 0532            ori.w      #$0001,1330(a2)
[00032a72] 6016                      bra.s      set_aflags_10
set_aflags_5:
[00032a74] 3f03                      move.w     d3,-(a7)
[00032a76] 43eb f2f4                 lea.l      -3340(a3),a1
[00032a7a] 204d                      movea.l    a5,a0
[00032a7c] 4eb9 0008 15ac            jsr        sprintf
[00032a82] 544f                      addq.w     #2,a7
[00032a84] 006a 0080 0518            ori.w      #$0080,1304(a2)
set_aflags_10:
[00032a8a] 274d 000c                 move.l     a5,12(a3)
[00032a8e] 3f03                      move.w     d3,-(a7)
[00032a90] 7004                      moveq.l    #4,d0
[00032a92] c046                      and.w      d6,d0
[00032a94] 6604                      bne.s      set_aflags_11
[00032a96] 7401                      moveq.l    #1,d2
[00032a98] 6002                      bra.s      set_aflags_12
set_aflags_11:
[00032a9a] 4242                      clr.w      d2
set_aflags_12:
[00032a9c] 7204                      moveq.l    #4,d1
[00032a9e] c244                      and.w      d4,d1
[00032aa0] 7002                      moveq.l    #2,d0
[00032aa2] 204a                      movea.l    a2,a0
[00032aa4] 6100 fe7a                 bsr        preset_it
[00032aa8] 544f                      addq.w     #2,a7
[00032aaa] 3f03                      move.w     d3,-(a7)
[00032aac] 7040                      moveq.l    #64,d0
[00032aae] c046                      and.w      d6,d0
[00032ab0] 6604                      bne.s      set_aflags_13
[00032ab2] 7401                      moveq.l    #1,d2
[00032ab4] 6002                      bra.s      set_aflags_14
set_aflags_13:
[00032ab6] 4242                      clr.w      d2
set_aflags_14:
[00032ab8] 7240                      moveq.l    #64,d1
[00032aba] c244                      and.w      d4,d1
[00032abc] 700b                      moveq.l    #11,d0
[00032abe] 204a                      movea.l    a2,a0
[00032ac0] 6100 fe5e                 bsr        preset_it
[00032ac4] 544f                      addq.w     #2,a7
[00032ac6] 3f03                      move.w     d3,-(a7)
[00032ac8] 7002                      moveq.l    #2,d0
[00032aca] c046                      and.w      d6,d0
[00032acc] 6604                      bne.s      set_aflags_15
[00032ace] 7401                      moveq.l    #1,d2
[00032ad0] 6002                      bra.s      set_aflags_16
set_aflags_15:
[00032ad2] 4242                      clr.w      d2
set_aflags_16:
[00032ad4] 7202                      moveq.l    #2,d1
[00032ad6] c244                      and.w      d4,d1
[00032ad8] 7014                      moveq.l    #20,d0
[00032ada] 204a                      movea.l    a2,a0
[00032adc] 6100 fe42                 bsr        preset_it
[00032ae0] 544f                      addq.w     #2,a7
[00032ae2] 3f03                      move.w     d3,-(a7)
[00032ae4] 3006                      move.w     d6,d0
[00032ae6] c07c 4000                 and.w      #$4000,d0
[00032aea] 6604                      bne.s      set_aflags_17
[00032aec] 7401                      moveq.l    #1,d2
[00032aee] 6002                      bra.s      set_aflags_18
set_aflags_17:
[00032af0] 4242                      clr.w      d2
set_aflags_18:
[00032af2] 3204                      move.w     d4,d1
[00032af4] c27c 4000                 and.w      #$4000,d1
[00032af8] 701d                      moveq.l    #29,d0
[00032afa] 204a                      movea.l    a2,a0
[00032afc] 6100 fe22                 bsr        preset_it
[00032b00] 544f                      addq.w     #2,a7
[00032b02] 3f03                      move.w     d3,-(a7)
[00032b04] 7001                      moveq.l    #1,d0
[00032b06] c046                      and.w      d6,d0
[00032b08] 6604                      bne.s      set_aflags_19
[00032b0a] 7401                      moveq.l    #1,d2
[00032b0c] 6002                      bra.s      set_aflags_20
set_aflags_19:
[00032b0e] 4242                      clr.w      d2
set_aflags_20:
[00032b10] 7201                      moveq.l    #1,d1
[00032b12] c244                      and.w      d4,d1
[00032b14] 7005                      moveq.l    #5,d0
[00032b16] 204a                      movea.l    a2,a0
[00032b18] 6100 fe06                 bsr        preset_it
[00032b1c] 544f                      addq.w     #2,a7
[00032b1e] 3f03                      move.w     d3,-(a7)
[00032b20] 7008                      moveq.l    #8,d0
[00032b22] c046                      and.w      d6,d0
[00032b24] 6604                      bne.s      set_aflags_21
[00032b26] 7401                      moveq.l    #1,d2
[00032b28] 6002                      bra.s      set_aflags_22
set_aflags_21:
[00032b2a] 4242                      clr.w      d2
set_aflags_22:
[00032b2c] 7208                      moveq.l    #8,d1
[00032b2e] c244                      and.w      d4,d1
[00032b30] 700e                      moveq.l    #14,d0
[00032b32] 204a                      movea.l    a2,a0
[00032b34] 6100 fdea                 bsr        preset_it
[00032b38] 544f                      addq.w     #2,a7
[00032b3a] 3f03                      move.w     d3,-(a7)
[00032b3c] 7010                      moveq.l    #16,d0
[00032b3e] c046                      and.w      d6,d0
[00032b40] 6604                      bne.s      set_aflags_23
[00032b42] 7401                      moveq.l    #1,d2
[00032b44] 6002                      bra.s      set_aflags_24
set_aflags_23:
[00032b46] 4242                      clr.w      d2
set_aflags_24:
[00032b48] 7210                      moveq.l    #16,d1
[00032b4a] c244                      and.w      d4,d1
[00032b4c] 7017                      moveq.l    #23,d0
[00032b4e] 204a                      movea.l    a2,a0
[00032b50] 6100 fdce                 bsr        preset_it
[00032b54] 544f                      addq.w     #2,a7
[00032b56] 3f03                      move.w     d3,-(a7)
[00032b58] 3006                      move.w     d6,d0
[00032b5a] c07c 2000                 and.w      #$2000,d0
[00032b5e] 6604                      bne.s      set_aflags_25
[00032b60] 7401                      moveq.l    #1,d2
[00032b62] 6002                      bra.s      set_aflags_26
set_aflags_25:
[00032b64] 4242                      clr.w      d2
set_aflags_26:
[00032b66] 3204                      move.w     d4,d1
[00032b68] c27c 2000                 and.w      #$2000,d1
[00032b6c] 7008                      moveq.l    #8,d0
[00032b6e] 204a                      movea.l    a2,a0
[00032b70] 6100 fdae                 bsr        preset_it
[00032b74] 544f                      addq.w     #2,a7
[00032b76] 3f03                      move.w     d3,-(a7)
[00032b78] 3006                      move.w     d6,d0
[00032b7a] c07c 1000                 and.w      #$1000,d0
[00032b7e] 6604                      bne.s      set_aflags_27
[00032b80] 7401                      moveq.l    #1,d2
[00032b82] 6002                      bra.s      set_aflags_28
set_aflags_27:
[00032b84] 4242                      clr.w      d2
set_aflags_28:
[00032b86] 3204                      move.w     d4,d1
[00032b88] c27c 1000                 and.w      #$1000,d1
[00032b8c] 7011                      moveq.l    #17,d0
[00032b8e] 204a                      movea.l    a2,a0
[00032b90] 6100 fd8e                 bsr        preset_it
[00032b94] 544f                      addq.w     #2,a7
[00032b96] 3f03                      move.w     d3,-(a7)
[00032b98] 3006                      move.w     d6,d0
[00032b9a] c07c 0800                 and.w      #$0800,d0
[00032b9e] 6604                      bne.s      set_aflags_29
[00032ba0] 7401                      moveq.l    #1,d2
[00032ba2] 6002                      bra.s      set_aflags_30
set_aflags_29:
[00032ba4] 4242                      clr.w      d2
set_aflags_30:
[00032ba6] 3204                      move.w     d4,d1
[00032ba8] c27c 0800                 and.w      #$0800,d1
[00032bac] 701a                      moveq.l    #26,d0
[00032bae] 204a                      movea.l    a2,a0
[00032bb0] 6100 fd6e                 bsr        preset_it
[00032bb4] 544f                      addq.w     #2,a7
[00032bb6] 3f03                      move.w     d3,-(a7)
[00032bb8] 3007                      move.w     d7,d0
[00032bba] c07c 2000                 and.w      #$2000,d0
[00032bbe] 6604                      bne.s      set_aflags_31
[00032bc0] 7401                      moveq.l    #1,d2
[00032bc2] 6002                      bra.s      set_aflags_32
set_aflags_31:
[00032bc4] 4242                      clr.w      d2
set_aflags_32:
[00032bc6] 3205                      move.w     d5,d1
[00032bc8] c27c 2000                 and.w      #$2000,d1
[00032bcc] 7020                      moveq.l    #32,d0
[00032bce] 204a                      movea.l    a2,a0
[00032bd0] 6100 fd4e                 bsr        preset_it
[00032bd4] 544f                      addq.w     #2,a7
[00032bd6] 3f03                      move.w     d3,-(a7)
[00032bd8] 7001                      moveq.l    #1,d0
[00032bda] c047                      and.w      d7,d0
[00032bdc] 6604                      bne.s      set_aflags_33
[00032bde] 7401                      moveq.l    #1,d2
[00032be0] 6002                      bra.s      set_aflags_34
set_aflags_33:
[00032be2] 4242                      clr.w      d2
set_aflags_34:
[00032be4] 7201                      moveq.l    #1,d1
[00032be6] c245                      and.w      d5,d1
[00032be8] 7024                      moveq.l    #36,d0
[00032bea] 204a                      movea.l    a2,a0
[00032bec] 6100 fd32                 bsr        preset_it
[00032bf0] 544f                      addq.w     #2,a7
[00032bf2] 3f03                      move.w     d3,-(a7)
[00032bf4] 7008                      moveq.l    #8,d0
[00032bf6] c047                      and.w      d7,d0
[00032bf8] 6604                      bne.s      set_aflags_35
[00032bfa] 7401                      moveq.l    #1,d2
[00032bfc] 6002                      bra.s      set_aflags_36
set_aflags_35:
[00032bfe] 4242                      clr.w      d2
set_aflags_36:
[00032c00] 7208                      moveq.l    #8,d1
[00032c02] c245                      and.w      d5,d1
[00032c04] 702a                      moveq.l    #42,d0
[00032c06] 204a                      movea.l    a2,a0
[00032c08] 6100 fd16                 bsr        preset_it
[00032c0c] 544f                      addq.w     #2,a7
[00032c0e] 3f03                      move.w     d3,-(a7)
[00032c10] 7002                      moveq.l    #2,d0
[00032c12] c047                      and.w      d7,d0
[00032c14] 6604                      bne.s      set_aflags_37
[00032c16] 7401                      moveq.l    #1,d2
[00032c18] 6002                      bra.s      set_aflags_38
set_aflags_37:
[00032c1a] 4242                      clr.w      d2
set_aflags_38:
[00032c1c] 7202                      moveq.l    #2,d1
[00032c1e] c245                      and.w      d5,d1
[00032c20] 7027                      moveq.l    #39,d0
[00032c22] 204a                      movea.l    a2,a0
[00032c24] 6100 fcfa                 bsr        preset_it
[00032c28] 544f                      addq.w     #2,a7
[00032c2a] 3f03                      move.w     d3,-(a7)
[00032c2c] 7004                      moveq.l    #4,d0
[00032c2e] c047                      and.w      d7,d0
[00032c30] 6604                      bne.s      set_aflags_39
[00032c32] 7401                      moveq.l    #1,d2
[00032c34] 6002                      bra.s      set_aflags_40
set_aflags_39:
[00032c36] 4242                      clr.w      d2
set_aflags_40:
[00032c38] 7204                      moveq.l    #4,d1
[00032c3a] c245                      and.w      d5,d1
[00032c3c] 702d                      moveq.l    #45,d0
[00032c3e] 204a                      movea.l    a2,a0
[00032c40] 6100 fcde                 bsr        preset_it
[00032c44] 544f                      addq.w     #2,a7
[00032c46] 3f03                      move.w     d3,-(a7)
[00032c48] 7010                      moveq.l    #16,d0
[00032c4a] c047                      and.w      d7,d0
[00032c4c] 6604                      bne.s      set_aflags_41
[00032c4e] 7401                      moveq.l    #1,d2
[00032c50] 6002                      bra.s      set_aflags_42
set_aflags_41:
[00032c52] 4242                      clr.w      d2
set_aflags_42:
[00032c54] 7210                      moveq.l    #16,d1
[00032c56] c245                      and.w      d5,d1
[00032c58] 7030                      moveq.l    #48,d0
[00032c5a] 204a                      movea.l    a2,a0
[00032c5c] 6100 fcc2                 bsr        preset_it
[00032c60] 544f                      addq.w     #2,a7
[00032c62] 3f03                      move.w     d3,-(a7)
[00032c64] 7020                      moveq.l    #32,d0
[00032c66] c047                      and.w      d7,d0
[00032c68] 6604                      bne.s      set_aflags_43
[00032c6a] 7401                      moveq.l    #1,d2
[00032c6c] 6002                      bra.s      set_aflags_44
set_aflags_43:
[00032c6e] 4242                      clr.w      d2
set_aflags_44:
[00032c70] 7220                      moveq.l    #32,d1
[00032c72] c245                      and.w      d5,d1
[00032c74] 7033                      moveq.l    #51,d0
[00032c76] 204a                      movea.l    a2,a0
[00032c78] 6100 fca6                 bsr        preset_it
[00032c7c] 544f                      addq.w     #2,a7
[00032c7e] 3f03                      move.w     d3,-(a7)
[00032c80] 3007                      move.w     d7,d0
[00032c82] c07c 0200                 and.w      #$0200,d0
[00032c86] 6604                      bne.s      set_aflags_45
[00032c88] 7401                      moveq.l    #1,d2
[00032c8a] 6002                      bra.s      set_aflags_46
set_aflags_45:
[00032c8c] 4242                      clr.w      d2
set_aflags_46:
[00032c8e] 3205                      move.w     d5,d1
[00032c90] c27c 0200                 and.w      #$0200,d1
[00032c94] 7040                      moveq.l    #64,d0
[00032c96] 204a                      movea.l    a2,a0
[00032c98] 6100 fc86                 bsr        preset_it
[00032c9c] 544f                      addq.w     #2,a7
[00032c9e] 3f03                      move.w     d3,-(a7)
[00032ca0] 3007                      move.w     d7,d0
[00032ca2] c07c 0400                 and.w      #$0400,d0
[00032ca6] 6604                      bne.s      set_aflags_47
[00032ca8] 7401                      moveq.l    #1,d2
[00032caa] 6002                      bra.s      set_aflags_48
set_aflags_47:
[00032cac] 4242                      clr.w      d2
set_aflags_48:
[00032cae] 3205                      move.w     d5,d1
[00032cb0] c27c 0400                 and.w      #$0400,d1
[00032cb4] 7049                      moveq.l    #73,d0
[00032cb6] 204a                      movea.l    a2,a0
[00032cb8] 6100 fc66                 bsr        preset_it
[00032cbc] 544f                      addq.w     #2,a7
[00032cbe] 3f03                      move.w     d3,-(a7)
[00032cc0] 3007                      move.w     d7,d0
[00032cc2] c07c 0100                 and.w      #$0100,d0
[00032cc6] 6604                      bne.s      set_aflags_49
[00032cc8] 7401                      moveq.l    #1,d2
[00032cca] 6002                      bra.s      set_aflags_50
set_aflags_49:
[00032ccc] 4242                      clr.w      d2
set_aflags_50:
[00032cce] 3205                      move.w     d5,d1
[00032cd0] c27c 0100                 and.w      #$0100,d1
[00032cd4] 7043                      moveq.l    #67,d0
[00032cd6] 204a                      movea.l    a2,a0
[00032cd8] 6100 fc46                 bsr        preset_it
[00032cdc] 544f                      addq.w     #2,a7
[00032cde] 3f03                      move.w     d3,-(a7)
[00032ce0] 3007                      move.w     d7,d0
[00032ce2] c07c 0800                 and.w      #$0800,d0
[00032ce6] 6604                      bne.s      set_aflags_51
[00032ce8] 7401                      moveq.l    #1,d2
[00032cea] 6002                      bra.s      set_aflags_52
set_aflags_51:
[00032cec] 4242                      clr.w      d2
set_aflags_52:
[00032cee] 3205                      move.w     d5,d1
[00032cf0] c27c 0800                 and.w      #$0800,d1
[00032cf4] 7046                      moveq.l    #70,d0
[00032cf6] 204a                      movea.l    a2,a0
[00032cf8] 6100 fc26                 bsr        preset_it
[00032cfc] 544f                      addq.w     #2,a7
[00032cfe] 4eb9 0004 ef0c            jsr        Amo_unbusy
[00032d04] 204b                      movea.l    a3,a0
set_aflags_2:
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
[00032d42] 670e                      beq.s      ea_tristate_1
[00032d44] 0068 0001 000a            ori.w      #$0001,10(a0)
[00032d4a] 0268 fff7 000a            andi.w     #$FFF7,10(a0)
[00032d50] 6016                      bra.s      ea_tristate_2
ea_tristate_1:
[00032d52] 7001                      moveq.l    #1,d0
[00032d54] c068 000a                 and.w      10(a0),d0
[00032d58] 6708                      beq.s      ea_tristate_3
[00032d5a] 0268 fffe 000a            andi.w     #$FFFE,10(a0)
[00032d60] 6006                      bra.s      ea_tristate_2
ea_tristate_3:
[00032d62] 0068 0008 000a            ori.w      #$0008,10(a0)
ea_tristate_2:
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
[00032dbe] 6708                      beq.s      ea_duostate_1
[00032dc0] 0268 fffe 000a            andi.w     #$FFFE,10(a0)
[00032dc6] 6006                      bra.s      ea_duostate_2
ea_duostate_1:
[00032dc8] 0068 0001 000a            ori.w      #$0001,10(a0)
ea_duostate_2:
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

	.data

TEXT_001:
[000cb9f6]                           dc.b 'Abbruch',0
TEXT_003:
[000cb9fe]                           dc.w $4f4b
[000cba00]                           dc.w $0020
[000cba02]                           dc.b '  Edit',0
TEXT_02:
[000cba09]                           dc.b '   Default',0
TEXT_03:
[000cba14]                           dc.b '   Defaultable',0
TEXT_04:
[000cba23]                           dc.b '   Selectable',0
TEXT_05:
[000cba31]                           dc.b '   Accept',0
TEXT_06:
[000cba3b]                           dc.b '   Radiobutton',0
TEXT_07:
[000cba4a]                           dc.b '   Constant',0
TEXT_08:
[000cba56]                           dc.b '   Dragable',0
TEXT_09:
[000cba62]                           dc.b '   Silent',0
TEXT_10:
[000cba6c]                           dc.b '   Selected',0
TEXT_11:
[000cba78]                           dc.b '   Crossed',0
TEXT_12:
[000cba83]                           dc.b '   Disabled',0
TEXT_13:
[000cba8f]                           dc.b '   Outlined',0
TEXT_14:
[000cba9b]                           dc.b '   Checked',0
TEXT_15:
[000cbaa6]                           dc.b '   Shadowed',0
TEXT_16:
[000cbab2]                           dc.b '   Oben',0
TEXT_17:
[000cbaba]                           dc.b '   Rechts',0
TEXT_18:
[000cbac4]                           dc.b '   Unten',0
TEXT_19:
[000cbacd]                           dc.b 'Indicator',0
TEXT_20:
[000cbad7]                           dc.b '   Touchexit',0
TEXT_21:
[000cbae4]                           dc.b 'None',0
TEXT_22:
[000cbae9]                           dc.b 'AES-4-Flags:',0
TEXT_23:
[000cbaf6]                           dc.b '   Exit',0
TEXT_25:
[000cbafe]                           dc.b 'Status:',0
TEXT_26:
[000cbb06]                           dc.b 'Aussehen:',0
TEXT_27:
[000cbb10]                           dc.b 'Activator',0
TEXT_28:
[000cbb1a]                           dc.b 'Background',0
TEXT_29:
[000cbb25]                           dc.b 'Verhalten:',0
TEXT_30:
[000cbb30]                           dc.b '   Links',0
help_title:
[000cbb39]                           dc.b 'Der Objekt-Flag-Editor',0
title1:
[000cbb50]                           dc.b ' STATUS -',0
titlemore:
[000cbb5a]                           dc.b ' %d STATI -',0
A_3DBUTTON01:
[000cbb66] 00064a22                  dc.l A_3Dbutton
[000cbb6a]                           dc.w $29c1
[000cbb6c]                           dc.w $0178
[000cbb6e] 000630f2                  dc.l Auo_string
[000cbb72] 000cb9f6                  dc.l TEXT_001
[000cbb76]                           dc.w $0000
[000cbb78]                           dc.w $0000
[000cbb7a]                           dc.w $0000
[000cbb7c]                           dc.w $0000
[000cbb7e]                           dc.w $0000
[000cbb80]                           dc.w $0000
[000cbb82]                           dc.w $0000
[000cbb84]                           dc.w $0000
A_3DBUTTON02:
[000cbb86] 00064a22                  dc.l A_3Dbutton
[000cbb8a]                           dc.w $21f1
[000cbb8c]                           dc.w $0178
[000cbb8e] 000630f2                  dc.l Auo_string
[000cbb92]                           dc.w $0000
[000cbb94]                           dc.w $0000
[000cbb96]                           dc.w $0000
[000cbb98]                           dc.w $0000
[000cbb9a]                           dc.w $0000
[000cbb9c]                           dc.w $0000
[000cbb9e]                           dc.w $0000
[000cbba0]                           dc.w $0000
[000cbba2]                           dc.w $0000
[000cbba4]                           dc.w $0000
A_3DBUTTON03:
[000cbba6] 00064a22                  dc.l A_3Dbutton
[000cbbaa]                           dc.w $a900
[000cbbac]                           dc.w $0178
[000cbbae] 000630f2                  dc.l Auo_string
[000cbbb2] 000cbaf6                  dc.l TEXT_23
[000cbbb6]                           dc.w $0000
[000cbbb8]                           dc.w $0000
[000cbbba]                           dc.w $0000
[000cbbbc]                           dc.w $0000
[000cbbbe]                           dc.w $0000
[000cbbc0]                           dc.w $0000
[000cbbc2]                           dc.w $0000
[000cbbc4]                           dc.w $0000
A_3DBUTTON04:
[000cbbc6] 00064a22                  dc.l A_3Dbutton
[000cbbca]                           dc.w $a900
[000cbbcc]                           dc.w $0178
[000cbbce] 000630f2                  dc.l Auo_string
[000cbbd2] 000cba23                  dc.l TEXT_04
[000cbbd6]                           dc.w $0000
[000cbbd8]                           dc.w $0000
[000cbbda]                           dc.w $0000
[000cbbdc]                           dc.w $0000
[000cbbde]                           dc.w $0000
[000cbbe0]                           dc.w $0000
[000cbbe2]                           dc.w $0000
[000cbbe4]                           dc.w $0000
A_3DBUTTON05:
[000cbbe6] 00064a22                  dc.l A_3Dbutton
[000cbbea]                           dc.w $29c1
[000cbbec]                           dc.w $0178
[000cbbee] 000630f2                  dc.l Auo_string
[000cbbf2] 000cb9fe                  dc.l TEXT_003
[000cbbf6]                           dc.w $0000
[000cbbf8]                           dc.w $0000
[000cbbfa]                           dc.w $0000
[000cbbfc]                           dc.w $0000
[000cbbfe]                           dc.w $0000
[000cbc00]                           dc.w $0000
[000cbc02]                           dc.w $0000
[000cbc04]                           dc.w $0000
A_3DBUTTON06:
[000cbc06] 00064a22                  dc.l A_3Dbutton
[000cbc0a]                           dc.w $a900
[000cbc0c]                           dc.w $0178
[000cbc0e] 000630f2                  dc.l Auo_string
[000cbc12] 000cba56                  dc.l TEXT_08
[000cbc16]                           dc.w $0000
[000cbc18]                           dc.w $0000
[000cbc1a]                           dc.w $0000
[000cbc1c]                           dc.w $0000
[000cbc1e]                           dc.w $0000
[000cbc20]                           dc.w $0000
[000cbc22]                           dc.w $0000
[000cbc24]                           dc.w $0000
A_3DBUTTON07:
[000cbc26] 00064a22                  dc.l A_3Dbutton
[000cbc2a]                           dc.w $a900
[000cbc2c]                           dc.w $0178
[000cbc2e] 000630f2                  dc.l Auo_string
[000cbc32] 000cba01                  dc.l TEXT_01
[000cbc36]                           dc.w $0000
[000cbc38]                           dc.w $0000
[000cbc3a]                           dc.w $0000
[000cbc3c]                           dc.w $0000
[000cbc3e]                           dc.w $0000
[000cbc40]                           dc.w $0000
[000cbc42]                           dc.w $0000
[000cbc44]                           dc.w $0000
A_3DBUTTON08:
[000cbc46] 00064a22                  dc.l A_3Dbutton
[000cbc4a]                           dc.w $a900
[000cbc4c]                           dc.w $0178
[000cbc4e] 000630f2                  dc.l Auo_string
[000cbc52] 000cbad7                  dc.l TEXT_20
[000cbc56]                           dc.w $0000
[000cbc58]                           dc.w $0000
[000cbc5a]                           dc.w $0000
[000cbc5c]                           dc.w $0000
[000cbc5e]                           dc.w $0000
[000cbc60]                           dc.w $0000
[000cbc62]                           dc.w $0000
[000cbc64]                           dc.w $0000
A_3DBUTTON09:
[000cbc66] 00064a22                  dc.l A_3Dbutton
[000cbc6a]                           dc.w $a900
[000cbc6c]                           dc.w $0178
[000cbc6e] 000630f2                  dc.l Auo_string
[000cbc72] 000cba31                  dc.l TEXT_05
[000cbc76]                           dc.w $0000
[000cbc78]                           dc.w $0000
[000cbc7a]                           dc.w $0000
[000cbc7c]                           dc.w $0000
[000cbc7e]                           dc.w $0000
[000cbc80]                           dc.w $0000
[000cbc82]                           dc.w $0000
[000cbc84]                           dc.w $0000
A_3DBUTTON10:
[000cbc86] 00064a22                  dc.l A_3Dbutton
[000cbc8a]                           dc.w $a900
[000cbc8c]                           dc.w $0178
[000cbc8e] 000630f2                  dc.l Auo_string
[000cbc92] 000cba09                  dc.l TEXT_02
[000cbc96]                           dc.w $0000
[000cbc98]                           dc.w $0000
[000cbc9a]                           dc.w $0000
[000cbc9c]                           dc.w $0000
[000cbc9e]                           dc.w $0000
[000cbca0]                           dc.w $0000
[000cbca2]                           dc.w $0000
[000cbca4]                           dc.w $0000
A_3DBUTTON11:
[000cbca6] 00064a22                  dc.l A_3Dbutton
[000cbcaa]                           dc.w $a900
[000cbcac]                           dc.w $0178
[000cbcae] 000630f2                  dc.l Auo_string
[000cbcb2] 000cba3b                  dc.l TEXT_06
[000cbcb6]                           dc.w $0000
[000cbcb8]                           dc.w $0000
[000cbcba]                           dc.w $0000
[000cbcbc]                           dc.w $0000
[000cbcbe]                           dc.w $0000
[000cbcc0]                           dc.w $0000
[000cbcc2]                           dc.w $0000
[000cbcc4]                           dc.w $0000
A_3DBUTTON12:
[000cbcc6] 00064a22                  dc.l A_3Dbutton
[000cbcca]                           dc.w $a900
[000cbccc]                           dc.w $0178
[000cbcce] 000630f2                  dc.l Auo_string
[000cbcd2] 000cba62                  dc.l TEXT_09
[000cbcd6]                           dc.w $0000
[000cbcd8]                           dc.w $0000
[000cbcda]                           dc.w $0000
[000cbcdc]                           dc.w $0000
[000cbcde]                           dc.w $0000
[000cbce0]                           dc.w $0000
[000cbce2]                           dc.w $0000
[000cbce4]                           dc.w $0000
A_3DBUTTON13:
[000cbce6] 00064a22                  dc.l A_3Dbutton
[000cbcea]                           dc.w $a900
[000cbcec]                           dc.w $0178
[000cbcee] 000630f2                  dc.l Auo_string
[000cbcf2] 000cba14                  dc.l TEXT_03
[000cbcf6]                           dc.w $0000
[000cbcf8]                           dc.w $0000
[000cbcfa]                           dc.w $0000
[000cbcfc]                           dc.w $0000
[000cbcfe]                           dc.w $0000
[000cbd00]                           dc.w $0000
[000cbd02]                           dc.w $0000
[000cbd04]                           dc.w $0000
A_3DBUTTON14:
[000cbd06] 00064a22                  dc.l A_3Dbutton
[000cbd0a]                           dc.w $a900
[000cbd0c]                           dc.w $0178
[000cbd0e] 000630f2                  dc.l Auo_string
[000cbd12] 000cba4a                  dc.l TEXT_07
[000cbd16]                           dc.w $0000
[000cbd18]                           dc.w $0000
[000cbd1a]                           dc.w $0000
[000cbd1c]                           dc.w $0000
[000cbd1e]                           dc.w $0000
[000cbd20]                           dc.w $0000
[000cbd22]                           dc.w $0000
[000cbd24]                           dc.w $0000
A_3DBUTTON15:
[000cbd26] 00064a22                  dc.l A_3Dbutton
[000cbd2a]                           dc.w $a900
[000cbd2c]                           dc.w $0178
[000cbd2e] 000630f2                  dc.l Auo_string
[000cbd32] 000cba6c                  dc.l TEXT_10
[000cbd36]                           dc.w $0000
[000cbd38]                           dc.w $0000
[000cbd3a]                           dc.w $0000
[000cbd3c]                           dc.w $0000
[000cbd3e]                           dc.w $0000
[000cbd40]                           dc.w $0000
[000cbd42]                           dc.w $0000
[000cbd44]                           dc.w $0000
A_3DBUTTON16:
[000cbd46] 00064a22                  dc.l A_3Dbutton
[000cbd4a]                           dc.w $a900
[000cbd4c]                           dc.w $0178
[000cbd4e] 000630f2                  dc.l Auo_string
[000cbd52] 000cba78                  dc.l TEXT_11
[000cbd56]                           dc.w $0000
[000cbd58]                           dc.w $0000
[000cbd5a]                           dc.w $0000
[000cbd5c]                           dc.w $0000
[000cbd5e]                           dc.w $0000
[000cbd60]                           dc.w $0000
[000cbd62]                           dc.w $0000
[000cbd64]                           dc.w $0000
A_3DBUTTON17:
[000cbd66] 00064a22                  dc.l A_3Dbutton
[000cbd6a]                           dc.w $a900
[000cbd6c]                           dc.w $0178
[000cbd6e] 000630f2                  dc.l Auo_string
[000cbd72] 000cba8f                  dc.l TEXT_13
[000cbd76]                           dc.w $0000
[000cbd78]                           dc.w $0000
[000cbd7a]                           dc.w $0000
[000cbd7c]                           dc.w $0000
[000cbd7e]                           dc.w $0000
[000cbd80]                           dc.w $0000
[000cbd82]                           dc.w $0000
[000cbd84]                           dc.w $0000
A_3DBUTTON18:
[000cbd86] 00064a22                  dc.l A_3Dbutton
[000cbd8a]                           dc.w $a900
[000cbd8c]                           dc.w $0178
[000cbd8e] 000630f2                  dc.l Auo_string
[000cbd92] 000cba83                  dc.l TEXT_12
[000cbd96]                           dc.w $0000
[000cbd98]                           dc.w $0000
[000cbd9a]                           dc.w $0000
[000cbd9c]                           dc.w $0000
[000cbd9e]                           dc.w $0000
[000cbda0]                           dc.w $0000
[000cbda2]                           dc.w $0000
[000cbda4]                           dc.w $0000
A_3DBUTTON19:
[000cbda6] 00064a22                  dc.l A_3Dbutton
[000cbdaa]                           dc.w $a900
[000cbdac]                           dc.w $0178
[000cbdae] 000630f2                  dc.l Auo_string
[000cbdb2] 000cba9b                  dc.l TEXT_14
[000cbdb6]                           dc.w $0000
[000cbdb8]                           dc.w $0000
[000cbdba]                           dc.w $0000
[000cbdbc]                           dc.w $0000
[000cbdbe]                           dc.w $0000
[000cbdc0]                           dc.w $0000
[000cbdc2]                           dc.w $0000
[000cbdc4]                           dc.w $0000
A_3DBUTTON20:
[000cbdc6] 00064a22                  dc.l A_3Dbutton
[000cbdca]                           dc.w $a900
[000cbdcc]                           dc.w $0178
[000cbdce] 000630f2                  dc.l Auo_string
[000cbdd2] 000cbaa6                  dc.l TEXT_15
[000cbdd6]                           dc.w $0000
[000cbdd8]                           dc.w $0000
[000cbdda]                           dc.w $0000
[000cbddc]                           dc.w $0000
[000cbdde]                           dc.w $0000
[000cbde0]                           dc.w $0000
[000cbde2]                           dc.w $0000
[000cbde4]                           dc.w $0000
A_3DBUTTON21:
[000cbde6] 00064a22                  dc.l A_3Dbutton
[000cbdea]                           dc.w $a900
[000cbdec]                           dc.w $0178
[000cbdee] 000630f2                  dc.l Auo_string
[000cbdf2] 000cbab2                  dc.l TEXT_16
[000cbdf6]                           dc.w $0000
[000cbdf8]                           dc.w $0000
[000cbdfa]                           dc.w $0000
[000cbdfc]                           dc.w $0000
[000cbdfe]                           dc.w $0000
[000cbe00]                           dc.w $0000
[000cbe02]                           dc.w $0000
[000cbe04]                           dc.w $0000
A_3DBUTTON22:
[000cbe06] 00064a22                  dc.l A_3Dbutton
[000cbe0a]                           dc.w $a900
[000cbe0c]                           dc.w $0178
[000cbe0e] 000630f2                  dc.l Auo_string
[000cbe12] 000cbaba                  dc.l TEXT_17
[000cbe16]                           dc.w $0000
[000cbe18]                           dc.w $0000
[000cbe1a]                           dc.w $0000
[000cbe1c]                           dc.w $0000
[000cbe1e]                           dc.w $0000
[000cbe20]                           dc.w $0000
[000cbe22]                           dc.w $0000
[000cbe24]                           dc.w $0000
A_3DBUTTON23:
[000cbe26] 00064a22                  dc.l A_3Dbutton
[000cbe2a]                           dc.w $a900
[000cbe2c]                           dc.w $0178
[000cbe2e] 000630f2                  dc.l Auo_string
[000cbe32] 000cbac4                  dc.l TEXT_18
[000cbe36]                           dc.w $0000
[000cbe38]                           dc.w $0000
[000cbe3a]                           dc.w $0000
[000cbe3c]                           dc.w $0000
[000cbe3e]                           dc.w $0000
[000cbe40]                           dc.w $0000
[000cbe42]                           dc.w $0000
[000cbe44]                           dc.w $0000
A_3DBUTTON29:
[000cbe46] 00064a22                  dc.l A_3Dbutton
[000cbe4a]                           dc.w $a900
[000cbe4c]                           dc.w $0178
[000cbe4e] 000630f2                  dc.l Auo_string
[000cbe52] 000cbb30                  dc.l TEXT_30
[000cbe56]                           dc.w $0000
[000cbe58]                           dc.w $0000
[000cbe5a]                           dc.w $0000
[000cbe5c]                           dc.w $0000
[000cbe5e]                           dc.w $0000
[000cbe60]                           dc.w $0000
[000cbe62]                           dc.w $0000
[000cbe64]                           dc.w $0000
A_ARROWS01:
[000cbe66] 00065c72                  dc.l A_arrows
[000cbe6a]                           dc.w $2249
[000cbe6c]                           dc.w $0001
[000cbe6e]                           dc.w $0000
[000cbe70]                           dc.w $0000
[000cbe72]                           dc.w $0000
[000cbe74]                           dc.w $0000
[000cbe76]                           dc.w $0000
[000cbe78]                           dc.w $0000
[000cbe7a]                           dc.w $0000
[000cbe7c]                           dc.w $0000
[000cbe7e]                           dc.w $0000
[000cbe80]                           dc.w $0000
[000cbe82]                           dc.w $0000
[000cbe84]                           dc.w $0000
A_ARROWS02:
[000cbe86] 00065c72                  dc.l A_arrows
[000cbe8a]                           dc.w $0049
[000cbe8c]                           dc.w $0001
[000cbe8e]                           dc.w $0000
[000cbe90]                           dc.w $0000
[000cbe92]                           dc.w $0000
[000cbe94]                           dc.w $0000
[000cbe96]                           dc.w $0000
[000cbe98]                           dc.w $0000
[000cbe9a]                           dc.w $0000
[000cbe9c]                           dc.w $0000
[000cbe9e]                           dc.w $0000
[000cbea0]                           dc.w $0000
[000cbea2]                           dc.w $0000
[000cbea4]                           dc.w $0000
A_CHECKBOX01:
[000cbea6] 0006323e                  dc.l A_checkbox
[000cbeaa]                           dc.w $0000
[000cbeac]                           dc.w $0001
[000cbeae] 000630f2                  dc.l Auo_string
[000cbeb2]                           dc.w $0000
[000cbeb4]                           dc.w $0000
[000cbeb6]                           dc.w $0000
[000cbeb8]                           dc.w $0000
[000cbeba]                           dc.w $0000
[000cbebc]                           dc.w $0000
[000cbebe]                           dc.w $0000
[000cbec0]                           dc.w $0000
[000cbec2]                           dc.w $0000
[000cbec4]                           dc.w $0000
A_CHECKBOX02:
[000cbec6] 0006323e                  dc.l A_checkbox
[000cbeca]                           dc.w $0000
[000cbecc]                           dc.w $0001
[000cbece] 000630f2                  dc.l Auo_string
[000cbed2] 000cbacd                  dc.l TEXT_19
[000cbed6]                           dc.w $0000
[000cbed8]                           dc.w $0000
[000cbeda]                           dc.w $0000
[000cbedc]                           dc.w $0000
[000cbede]                           dc.w $0000
[000cbee0]                           dc.w $0000
[000cbee2]                           dc.w $0000
[000cbee4]                           dc.w $0000
A_CHECKBOX03:
[000cbee6] 0006323e                  dc.l A_checkbox
[000cbeea]                           dc.w $0000
[000cbeec]                           dc.w $0001
[000cbeee] 000630f2                  dc.l Auo_string
[000cbef2] 000cbae4                  dc.l TEXT_21
[000cbef6]                           dc.w $0000
[000cbef8]                           dc.w $0000
[000cbefa]                           dc.w $0000
[000cbefc]                           dc.w $0000
[000cbefe]                           dc.w $0000
[000cbf00]                           dc.w $0000
[000cbf02]                           dc.w $0000
[000cbf04]                           dc.w $0000
A_CHECKBOX04:
[000cbf06] 0006323e                  dc.l A_checkbox
[000cbf0a]                           dc.w $0000
[000cbf0c]                           dc.w $0001
[000cbf0e] 000630f2                  dc.l Auo_string
[000cbf12] 000cbb10                  dc.l TEXT_27
[000cbf16]                           dc.w $0000
[000cbf18]                           dc.w $0000
[000cbf1a]                           dc.w $0000
[000cbf1c]                           dc.w $0000
[000cbf1e]                           dc.w $0000
[000cbf20]                           dc.w $0000
[000cbf22]                           dc.w $0000
[000cbf24]                           dc.w $0000
A_CHECKBOX05:
[000cbf26] 0006323e                  dc.l A_checkbox
[000cbf2a]                           dc.w $0000
[000cbf2c]                           dc.w $0001
[000cbf2e] 000630f2                  dc.l Auo_string
[000cbf32] 000cbb1a                  dc.l TEXT_28
[000cbf36]                           dc.w $0000
[000cbf38]                           dc.w $0000
[000cbf3a]                           dc.w $0000
[000cbf3c]                           dc.w $0000
[000cbf3e]                           dc.w $0000
[000cbf40]                           dc.w $0000
[000cbf42]                           dc.w $0000
[000cbf44]                           dc.w $0000
A_INNERFRAME02:
[000cbf46] 00064256                  dc.l A_innerframe
[000cbf4a]                           dc.w $1800
[000cbf4c]                           dc.w $8f19
[000cbf4e] 000630f2                  dc.l Auo_string
[000cbf52] 000cbafe                  dc.l TEXT_25
[000cbf56]                           dc.w $0000
[000cbf58]                           dc.w $0000
[000cbf5a]                           dc.w $0000
[000cbf5c]                           dc.w $0000
[000cbf5e]                           dc.w $0000
[000cbf60]                           dc.w $0000
[000cbf62]                           dc.w $0000
[000cbf64]                           dc.w $0000
A_INNERFRAME03:
[000cbf66] 00064256                  dc.l A_innerframe
[000cbf6a]                           dc.w $1800
[000cbf6c]                           dc.w $8f19
[000cbf6e] 000630f2                  dc.l Auo_string
[000cbf72] 000cbb06                  dc.l TEXT_26
[000cbf76]                           dc.w $0000
[000cbf78]                           dc.w $0000
[000cbf7a]                           dc.w $0000
[000cbf7c]                           dc.w $0000
[000cbf7e]                           dc.w $0000
[000cbf80]                           dc.w $0000
[000cbf82]                           dc.w $0000
[000cbf84]                           dc.w $0000
A_INNERFRAME04:
[000cbf86] 00064256                  dc.l A_innerframe
[000cbf8a]                           dc.w $1800
[000cbf8c]                           dc.w $8f19
[000cbf8e] 000630f2                  dc.l Auo_string
[000cbf92] 000cbb25                  dc.l TEXT_29
[000cbf96]                           dc.w $0000
[000cbf98]                           dc.w $0000
[000cbf9a]                           dc.w $0000
[000cbf9c]                           dc.w $0000
[000cbf9e]                           dc.w $0000
[000cbfa0]                           dc.w $0000
[000cbfa2]                           dc.w $0000
[000cbfa4]                           dc.w $0000
A_INNERFRAME05:
[000cbfa6] 00064256                  dc.l A_innerframe
[000cbfaa]                           dc.w $1800
[000cbfac]                           dc.w $8f19
[000cbfae] 000630f2                  dc.l Auo_string
[000cbfb2] 000cbae9                  dc.l TEXT_22
[000cbfb6]                           dc.w $0000
[000cbfb8]                           dc.w $0000
[000cbfba]                           dc.w $0000
[000cbfbc]                           dc.w $0000
[000cbfbe]                           dc.w $0000
[000cbfc0]                           dc.w $0000
[000cbfc2]                           dc.w $0000
[000cbfc4]                           dc.w $0000
ED_AFLAGS:
[000cbfc6]                           dc.w $ffff
[000cbfc8]                           dc.w $0001
[000cbfca]                           dc.w $005a
[000cbfcc]                           dc.w $0018
[000cbfce]                           dc.w $0040
[000cbfd0]                           dc.w $0010
[000cbfd2] 000cbb86                  dc.l A_3DBUTTON02
[000cbfd6]                           dc.w $0000
[000cbfd8]                           dc.w $0000
[000cbfda]                           dc.w $002e
[000cbfdc]                           dc.w $0014
_01_ED_AFLAGS:
[000cbfde]                           dc.w $0023
[000cbfe0]                           dc.w $0002
[000cbfe2]                           dc.w $0020
[000cbfe4]                           dc.w $0018
[000cbfe6]                           dc.w $0040
[000cbfe8]                           dc.w $0000
[000cbfea] 000cbf86                  dc.l A_INNERFRAME04
[000cbfee]                           dc.w $0001
[000cbff0]                           dc.w $0000
[000cbff2]                           dc.w $002c
[000cbff4]                           dc.w $0006
_02_ED_AFLAGS:
[000cbff6]                           dc.w $0005
[000cbff8]                           dc.w $0004
[000cbffa]                           dc.w $0004
[000cbffc]                           dc.w $0018
[000cbffe]                           dc.w $0040
[000cc000]                           dc.w $0000
[000cc002] 000cbba6                  dc.l A_3DBUTTON03
[000cc006]                           dc.w $0001
[000cc008]                           dc.w $0001
[000cc00a]                           dc.w $0007
[000cc00c]                           dc.w $0001
_02aED_AFLAGS:
[000cc00e]                           dc.w $0000
[000cc010]                           dc.w $0000
[000cc012]                           dc.w $0000
[000cc014]                           dc.w $0000
[000cc016]                           dc.w $8000
[000cc018]                           dc.w $8845
[000cc01a]                           dc.w $0000
[000cc01c]                           dc.w $0000
[000cc01e]                           dc.w $0000
[000cc020]                           dc.w $0000
[000cc022]                           dc.w $0000
[000cc024]                           dc.w $0000
_04_ED_AFLAGS:
[000cc026]                           dc.w $0002
[000cc028]                           dc.w $ffff
[000cc02a]                           dc.w $ffff
[000cc02c]                           dc.w $0018
[000cc02e]                           dc.w $0000
[000cc030]                           dc.w $0008
[000cc032] 000cbea6                  dc.l A_CHECKBOX01
[000cc036]                           dc.w $0000
[000cc038]                           dc.w $0000
[000cc03a]                           dc.w $0002
[000cc03c]                           dc.w $0001
_05_ED_AFLAGS:
[000cc03e]                           dc.w $0008
[000cc040]                           dc.w $0007
[000cc042]                           dc.w $0007
[000cc044]                           dc.w $0018
[000cc046]                           dc.w $0040
[000cc048]                           dc.w $0000
[000cc04a] 000cbbc6                  dc.l A_3DBUTTON04
[000cc04e]                           dc.w $0010
[000cc050]                           dc.w $0001
[000cc052]                           dc.w $000d
[000cc054]                           dc.w $0001
_05aED_AFLAGS:
[000cc056]                           dc.w $0000
[000cc058]                           dc.w $0000
[000cc05a]                           dc.w $0000
[000cc05c]                           dc.w $0000
[000cc05e]                           dc.w $8000
[000cc060]                           dc.w $8853
[000cc062]                           dc.w $0000
[000cc064]                           dc.w $0000
[000cc066]                           dc.w $0000
[000cc068]                           dc.w $0000
[000cc06a]                           dc.w $0000
[000cc06c]                           dc.w $0000
_07_ED_AFLAGS:
[000cc06e]                           dc.w $0005
[000cc070]                           dc.w $ffff
[000cc072]                           dc.w $ffff
[000cc074]                           dc.w $0018
[000cc076]                           dc.w $0000
[000cc078]                           dc.w $0008
[000cc07a] 000cbea6                  dc.l A_CHECKBOX01
[000cc07e]                           dc.w $0000
[000cc080]                           dc.w $0000
[000cc082]                           dc.w $0002
[000cc084]                           dc.w $0001
_08_ED_AFLAGS:
[000cc086]                           dc.w $000b
[000cc088]                           dc.w $000a
[000cc08a]                           dc.w $000a
[000cc08c]                           dc.w $0018
[000cc08e]                           dc.w $0040
[000cc090]                           dc.w $0000
[000cc092] 000cbc06                  dc.l A_3DBUTTON06
[000cc096]                           dc.w $0020
[000cc098]                           dc.w $0001
[000cc09a]                           dc.w $000b
[000cc09c]                           dc.w $0001
_08aED_AFLAGS:
[000cc09e]                           dc.w $0000
[000cc0a0]                           dc.w $0000
[000cc0a2]                           dc.w $0000
[000cc0a4]                           dc.w $0000
[000cc0a6]                           dc.w $8000
[000cc0a8]                           dc.w $8847
[000cc0aa]                           dc.w $0000
[000cc0ac]                           dc.w $0000
[000cc0ae]                           dc.w $0000
[000cc0b0]                           dc.w $0000
[000cc0b2]                           dc.w $0000
[000cc0b4]                           dc.w $0000
_10_ED_AFLAGS:
[000cc0b6]                           dc.w $0008
[000cc0b8]                           dc.w $ffff
[000cc0ba]                           dc.w $ffff
[000cc0bc]                           dc.w $0018
[000cc0be]                           dc.w $0000
[000cc0c0]                           dc.w $0008
[000cc0c2] 000cbea6                  dc.l A_CHECKBOX01
[000cc0c6]                           dc.w $0000
[000cc0c8]                           dc.w $0000
[000cc0ca]                           dc.w $0002
[000cc0cc]                           dc.w $0001
_11_ED_AFLAGS:
[000cc0ce]                           dc.w $000e
[000cc0d0]                           dc.w $000d
[000cc0d2]                           dc.w $000d
[000cc0d4]                           dc.w $0018
[000cc0d6]                           dc.w $0040
[000cc0d8]                           dc.w $0000
[000cc0da] 000cbc46                  dc.l A_3DBUTTON08
[000cc0de]                           dc.w $0001
[000cc0e0]                           dc.w $0002
[000cc0e2]                           dc.w $000c
[000cc0e4]                           dc.w $0001
_11aED_AFLAGS:
[000cc0e6]                           dc.w $0000
[000cc0e8]                           dc.w $0000
[000cc0ea]                           dc.w $0000
[000cc0ec]                           dc.w $0000
[000cc0ee]                           dc.w $8000
[000cc0f0]                           dc.w $8854
[000cc0f2]                           dc.w $0000
[000cc0f4]                           dc.w $0000
[000cc0f6]                           dc.w $0000
[000cc0f8]                           dc.w $0000
[000cc0fa]                           dc.w $0000
[000cc0fc]                           dc.w $0000
_13_ED_AFLAGS:
[000cc0fe]                           dc.w $000b
[000cc100]                           dc.w $ffff
[000cc102]                           dc.w $ffff
[000cc104]                           dc.w $0018
[000cc106]                           dc.w $0000
[000cc108]                           dc.w $0008
[000cc10a] 000cbea6                  dc.l A_CHECKBOX01
[000cc10e]                           dc.w $0000
[000cc110]                           dc.w $0000
[000cc112]                           dc.w $0002
[000cc114]                           dc.w $0001
_14_ED_AFLAGS:
[000cc116]                           dc.w $0011
[000cc118]                           dc.w $0010
[000cc11a]                           dc.w $0010
[000cc11c]                           dc.w $0018
[000cc11e]                           dc.w $0040
[000cc120]                           dc.w $0000
[000cc122] 000cbc26                  dc.l A_3DBUTTON07
[000cc126]                           dc.w $0010
[000cc128]                           dc.w $0002
[000cc12a]                           dc.w $0007
[000cc12c]                           dc.w $0001
_14aED_AFLAGS:
[000cc12e]                           dc.w $0000
[000cc130]                           dc.w $0000
[000cc132]                           dc.w $0000
[000cc134]                           dc.w $0000
[000cc136]                           dc.w $8000
[000cc138]                           dc.w $8849
[000cc13a]                           dc.w $0000
[000cc13c]                           dc.w $0000
[000cc13e]                           dc.w $0000
[000cc140]                           dc.w $0000
[000cc142]                           dc.w $0000
[000cc144]                           dc.w $0000
_16_ED_AFLAGS:
[000cc146]                           dc.w $000e
[000cc148]                           dc.w $ffff
[000cc14a]                           dc.w $ffff
[000cc14c]                           dc.w $0018
[000cc14e]                           dc.w $0000
[000cc150]                           dc.w $0008
[000cc152] 000cbea6                  dc.l A_CHECKBOX01
[000cc156]                           dc.w $0000
[000cc158]                           dc.w $0000
[000cc15a]                           dc.w $0002
[000cc15c]                           dc.w $0001
_17_ED_AFLAGS:
[000cc15e]                           dc.w $0014
[000cc160]                           dc.w $0013
[000cc162]                           dc.w $0013
[000cc164]                           dc.w $0018
[000cc166]                           dc.w $0040
[000cc168]                           dc.w $0000
[000cc16a] 000cbc66                  dc.l A_3DBUTTON09
[000cc16e]                           dc.w $0020
[000cc170]                           dc.w $0002
[000cc172]                           dc.w $0009
[000cc174]                           dc.w $0001
_17aED_AFLAGS:
[000cc176]                           dc.w $0000
[000cc178]                           dc.w $0000
[000cc17a]                           dc.w $0000
[000cc17c]                           dc.w $0000
[000cc17e]                           dc.w $8000
[000cc180]                           dc.w $8850
[000cc182]                           dc.w $0000
[000cc184]                           dc.w $0000
[000cc186]                           dc.w $0000
[000cc188]                           dc.w $0000
[000cc18a]                           dc.w $0000
[000cc18c]                           dc.w $0000
_19_ED_AFLAGS:
[000cc18e]                           dc.w $0011
[000cc190]                           dc.w $ffff
[000cc192]                           dc.w $ffff
[000cc194]                           dc.w $0018
[000cc196]                           dc.w $0000
[000cc198]                           dc.w $0008
[000cc19a] 000cbea6                  dc.l A_CHECKBOX01
[000cc19e]                           dc.w $0000
[000cc1a0]                           dc.w $0000
[000cc1a2]                           dc.w $0002
[000cc1a4]                           dc.w $0001
_20_ED_AFLAGS:
[000cc1a6]                           dc.w $0017
[000cc1a8]                           dc.w $0016
[000cc1aa]                           dc.w $0016
[000cc1ac]                           dc.w $0018
[000cc1ae]                           dc.w $0040
[000cc1b0]                           dc.w $0000
[000cc1b2] 000cbc86                  dc.l A_3DBUTTON10
[000cc1b6]                           dc.w $0001
[000cc1b8]                           dc.w $0003
[000cc1ba]                           dc.w $000a
[000cc1bc]                           dc.w $0001
_20aED_AFLAGS:
[000cc1be]                           dc.w $0000
[000cc1c0]                           dc.w $0000
[000cc1c2]                           dc.w $0000
[000cc1c4]                           dc.w $0000
[000cc1c6]                           dc.w $8000
[000cc1c8]                           dc.w $8844
[000cc1ca]                           dc.w $0000
[000cc1cc]                           dc.w $0000
[000cc1ce]                           dc.w $0000
[000cc1d0]                           dc.w $0000
[000cc1d2]                           dc.w $0000
[000cc1d4]                           dc.w $0000
_22_ED_AFLAGS:
[000cc1d6]                           dc.w $0014
[000cc1d8]                           dc.w $ffff
[000cc1da]                           dc.w $ffff
[000cc1dc]                           dc.w $0018
[000cc1de]                           dc.w $0000
[000cc1e0]                           dc.w $0008
[000cc1e2] 000cbea6                  dc.l A_CHECKBOX01
[000cc1e6]                           dc.w $0000
[000cc1e8]                           dc.w $0000
[000cc1ea]                           dc.w $0002
[000cc1ec]                           dc.w $0001
_23_ED_AFLAGS:
[000cc1ee]                           dc.w $001a
[000cc1f0]                           dc.w $0019
[000cc1f2]                           dc.w $0019
[000cc1f4]                           dc.w $0018
[000cc1f6]                           dc.w $0040
[000cc1f8]                           dc.w $0000
[000cc1fa] 000cbca6                  dc.l A_3DBUTTON11
[000cc1fe]                           dc.w $0010
[000cc200]                           dc.w $0003
[000cc202]                           dc.w $000e
[000cc204]                           dc.w $0001
_23aED_AFLAGS:
[000cc206]                           dc.w $0000
[000cc208]                           dc.w $0000
[000cc20a]                           dc.w $0000
[000cc20c]                           dc.w $0000
[000cc20e]                           dc.w $8000
[000cc210]                           dc.w $8852
[000cc212]                           dc.w $0000
[000cc214]                           dc.w $0000
[000cc216]                           dc.w $0000
[000cc218]                           dc.w $0000
[000cc21a]                           dc.w $0000
[000cc21c]                           dc.w $0000
_25_ED_AFLAGS:
[000cc21e]                           dc.w $0017
[000cc220]                           dc.w $ffff
[000cc222]                           dc.w $ffff
[000cc224]                           dc.w $0018
[000cc226]                           dc.w $0000
[000cc228]                           dc.w $0008
[000cc22a] 000cbea6                  dc.l A_CHECKBOX01
[000cc22e]                           dc.w $0000
[000cc230]                           dc.w $0000
[000cc232]                           dc.w $0002
[000cc234]                           dc.w $0001
_26_ED_AFLAGS:
[000cc236]                           dc.w $001d
[000cc238]                           dc.w $001c
[000cc23a]                           dc.w $001c
[000cc23c]                           dc.w $0018
[000cc23e]                           dc.w $0040
[000cc240]                           dc.w $0000
[000cc242] 000cbcc6                  dc.l A_3DBUTTON12
[000cc246]                           dc.w $0020
[000cc248]                           dc.w $0003
[000cc24a]                           dc.w $0009
[000cc24c]                           dc.w $0001
_26aED_AFLAGS:
[000cc24e]                           dc.w $0000
[000cc250]                           dc.w $0000
[000cc252]                           dc.w $0000
[000cc254]                           dc.w $0000
[000cc256]                           dc.w $8000
[000cc258]                           dc.w $884c
[000cc25a]                           dc.w $0000
[000cc25c]                           dc.w $0000
[000cc25e]                           dc.w $0000
[000cc260]                           dc.w $0000
[000cc262]                           dc.w $0000
[000cc264]                           dc.w $0000
_28_ED_AFLAGS:
[000cc266]                           dc.w $001a
[000cc268]                           dc.w $ffff
[000cc26a]                           dc.w $ffff
[000cc26c]                           dc.w $0018
[000cc26e]                           dc.w $0000
[000cc270]                           dc.w $0008
[000cc272] 000cbea6                  dc.l A_CHECKBOX01
[000cc276]                           dc.w $0000
[000cc278]                           dc.w $0000
[000cc27a]                           dc.w $0002
[000cc27c]                           dc.w $0001
_29_ED_AFLAGS:
[000cc27e]                           dc.w $0020
[000cc280]                           dc.w $001f
[000cc282]                           dc.w $001f
[000cc284]                           dc.w $0018
[000cc286]                           dc.w $0040
[000cc288]                           dc.w $0000
[000cc28a] 000cbce6                  dc.l A_3DBUTTON13
[000cc28e]                           dc.w $0001
[000cc290]                           dc.w $0004
[000cc292]                           dc.w $000e
[000cc294]                           dc.w $0001
_29aED_AFLAGS:
[000cc296]                           dc.w $0000
[000cc298]                           dc.w $0000
[000cc29a]                           dc.w $0000
[000cc29c]                           dc.w $0000
[000cc29e]                           dc.w $8000
[000cc2a0]                           dc.w $8846
[000cc2a2]                           dc.w $0000
[000cc2a4]                           dc.w $0000
[000cc2a6]                           dc.w $0000
[000cc2a8]                           dc.w $0000
[000cc2aa]                           dc.w $0000
[000cc2ac]                           dc.w $0000
_31_ED_AFLAGS:
[000cc2ae]                           dc.w $001d
[000cc2b0]                           dc.w $ffff
[000cc2b2]                           dc.w $ffff
[000cc2b4]                           dc.w $0018
[000cc2b6]                           dc.w $0000
[000cc2b8]                           dc.w $0008
[000cc2ba] 000cbea6                  dc.l A_CHECKBOX01
[000cc2be]                           dc.w $0000
[000cc2c0]                           dc.w $0000
[000cc2c2]                           dc.w $0002
[000cc2c4]                           dc.w $0001
_32_ED_AFLAGS:
[000cc2c6]                           dc.w $0001
[000cc2c8]                           dc.w $0022
[000cc2ca]                           dc.w $0022
[000cc2cc]                           dc.w $0018
[000cc2ce]                           dc.w $0040
[000cc2d0]                           dc.w $0000
[000cc2d2] 000cbd06                  dc.l A_3DBUTTON14
[000cc2d6]                           dc.w $0010
[000cc2d8]                           dc.w $0004
[000cc2da]                           dc.w $000b
[000cc2dc]                           dc.w $0001
_32aED_AFLAGS:
[000cc2de]                           dc.w $0000
[000cc2e0]                           dc.w $0000
[000cc2e2]                           dc.w $0000
[000cc2e4]                           dc.w $0000
[000cc2e6]                           dc.w $8000
[000cc2e8]                           dc.w $8843
[000cc2ea]                           dc.w $0000
[000cc2ec]                           dc.w $0000
[000cc2ee]                           dc.w $0000
[000cc2f0]                           dc.w $0000
[000cc2f2]                           dc.w $0000
[000cc2f4]                           dc.w $0000
_34_ED_AFLAGS:
[000cc2f6]                           dc.w $0020
[000cc2f8]                           dc.w $ffff
[000cc2fa]                           dc.w $ffff
[000cc2fc]                           dc.w $0018
[000cc2fe]                           dc.w $0000
[000cc300]                           dc.w $0008
[000cc302] 000cbea6                  dc.l A_CHECKBOX01
[000cc306]                           dc.w $0000
[000cc308]                           dc.w $0000
[000cc30a]                           dc.w $0002
[000cc30c]                           dc.w $0001
_35_ED_AFLAGS:
[000cc30e]                           dc.w $0036
[000cc310]                           dc.w $0024
[000cc312]                           dc.w $0033
[000cc314]                           dc.w $0018
[000cc316]                           dc.w $0040
[000cc318]                           dc.w $0000
[000cc31a] 000cbf46                  dc.l A_INNERFRAME02
[000cc31e]                           dc.w $0001
[000cc320]                           dc.w $0006
[000cc322]                           dc.w $001c
[000cc324]                           dc.w $0006
_36_ED_AFLAGS:
[000cc326]                           dc.w $0027
[000cc328]                           dc.w $0026
[000cc32a]                           dc.w $0026
[000cc32c]                           dc.w $0018
[000cc32e]                           dc.w $0040
[000cc330]                           dc.w $0000
[000cc332] 000cbd26                  dc.l A_3DBUTTON15
[000cc336]                           dc.w $0001
[000cc338]                           dc.w $0001
[000cc33a]                           dc.w $000b
[000cc33c]                           dc.w $0001
_36aED_AFLAGS:
[000cc33e]                           dc.w $0000
[000cc340]                           dc.w $0000
[000cc342]                           dc.w $0000
[000cc344]                           dc.w $0000
[000cc346]                           dc.w $8000
[000cc348]                           dc.w $8b53
[000cc34a]                           dc.w $0000
[000cc34c]                           dc.w $0000
[000cc34e]                           dc.w $0000
[000cc350]                           dc.w $0000
[000cc352]                           dc.w $0000
[000cc354]                           dc.w $0000
_38_ED_AFLAGS:
[000cc356]                           dc.w $0024
[000cc358]                           dc.w $ffff
[000cc35a]                           dc.w $ffff
[000cc35c]                           dc.w $0018
[000cc35e]                           dc.w $0000
[000cc360]                           dc.w $0008
[000cc362] 000cbea6                  dc.l A_CHECKBOX01
[000cc366]                           dc.w $0000
[000cc368]                           dc.w $0000
[000cc36a]                           dc.w $0002
[000cc36c]                           dc.w $0001
_39_ED_AFLAGS:
[000cc36e]                           dc.w $002a
[000cc370]                           dc.w $0029
[000cc372]                           dc.w $0029
[000cc374]                           dc.w $0018
[000cc376]                           dc.w $0040
[000cc378]                           dc.w $0000
[000cc37a] 000cbd46                  dc.l A_3DBUTTON16
[000cc37e]                           dc.w $0010
[000cc380]                           dc.w $0001
[000cc382]                           dc.w $000a
[000cc384]                           dc.w $0001
_39aED_AFLAGS:
[000cc386]                           dc.w $0000
[000cc388]                           dc.w $0000
[000cc38a]                           dc.w $0000
[000cc38c]                           dc.w $0000
[000cc38e]                           dc.w $8000
[000cc390]                           dc.w $8b52
[000cc392]                           dc.w $0000
[000cc394]                           dc.w $0000
[000cc396]                           dc.w $0000
[000cc398]                           dc.w $0000
[000cc39a]                           dc.w $0000
[000cc39c]                           dc.w $0000
_41_ED_AFLAGS:
[000cc39e]                           dc.w $0027
[000cc3a0]                           dc.w $ffff
[000cc3a2]                           dc.w $ffff
[000cc3a4]                           dc.w $0018
[000cc3a6]                           dc.w $0000
[000cc3a8]                           dc.w $0008
[000cc3aa] 000cbea6                  dc.l A_CHECKBOX01
[000cc3ae]                           dc.w $0000
[000cc3b0]                           dc.w $0000
[000cc3b2]                           dc.w $0002
[000cc3b4]                           dc.w $0001
_42_ED_AFLAGS:
[000cc3b6]                           dc.w $002d
[000cc3b8]                           dc.w $002c
[000cc3ba]                           dc.w $002c
[000cc3bc]                           dc.w $0018
[000cc3be]                           dc.w $0040
[000cc3c0]                           dc.w $0000
[000cc3c2] 000cbd86                  dc.l A_3DBUTTON18
[000cc3c6]                           dc.w $0001
[000cc3c8]                           dc.w $0002
[000cc3ca]                           dc.w $000b
[000cc3cc]                           dc.w $0001
_42aED_AFLAGS:
[000cc3ce]                           dc.w $0000
[000cc3d0]                           dc.w $0000
[000cc3d2]                           dc.w $0000
[000cc3d4]                           dc.w $0000
[000cc3d6]                           dc.w $8000
[000cc3d8]                           dc.w $8b44
[000cc3da]                           dc.w $0000
[000cc3dc]                           dc.w $0000
[000cc3de]                           dc.w $0000
[000cc3e0]                           dc.w $0000
[000cc3e2]                           dc.w $0000
[000cc3e4]                           dc.w $0000
_44_ED_AFLAGS:
[000cc3e6]                           dc.w $002a
[000cc3e8]                           dc.w $ffff
[000cc3ea]                           dc.w $ffff
[000cc3ec]                           dc.w $0018
[000cc3ee]                           dc.w $0000
[000cc3f0]                           dc.w $0008
[000cc3f2] 000cbea6                  dc.l A_CHECKBOX01
[000cc3f6]                           dc.w $0000
[000cc3f8]                           dc.w $0000
[000cc3fa]                           dc.w $0002
[000cc3fc]                           dc.w $0001
_45_ED_AFLAGS:
[000cc3fe]                           dc.w $0030
[000cc400]                           dc.w $002f
[000cc402]                           dc.w $002f
[000cc404]                           dc.w $0018
[000cc406]                           dc.w $0040
[000cc408]                           dc.w $0000
[000cc40a] 000cbda6                  dc.l A_3DBUTTON19
[000cc40e]                           dc.w $0010
[000cc410]                           dc.w $0002
[000cc412]                           dc.w $000a
[000cc414]                           dc.w $0001
_45aED_AFLAGS:
[000cc416]                           dc.w $0000
[000cc418]                           dc.w $0000
[000cc41a]                           dc.w $0000
[000cc41c]                           dc.w $0000
[000cc41e]                           dc.w $8000
[000cc420]                           dc.w $8b43
[000cc422]                           dc.w $0000
[000cc424]                           dc.w $0000
[000cc426]                           dc.w $0000
[000cc428]                           dc.w $0000
[000cc42a]                           dc.w $0000
[000cc42c]                           dc.w $0000
_47_ED_AFLAGS:
[000cc42e]                           dc.w $002d
[000cc430]                           dc.w $ffff
[000cc432]                           dc.w $ffff
[000cc434]                           dc.w $0018
[000cc436]                           dc.w $0000
[000cc438]                           dc.w $0008
[000cc43a] 000cbea6                  dc.l A_CHECKBOX01
[000cc43e]                           dc.w $0000
[000cc440]                           dc.w $0000
[000cc442]                           dc.w $0002
[000cc444]                           dc.w $0001
_48_ED_AFLAGS:
[000cc446]                           dc.w $0033
[000cc448]                           dc.w $0032
[000cc44a]                           dc.w $0032
[000cc44c]                           dc.w $0018
[000cc44e]                           dc.w $0040
[000cc450]                           dc.w $0000
[000cc452] 000cbd66                  dc.l A_3DBUTTON17
[000cc456]                           dc.w $0001
[000cc458]                           dc.w $0003
[000cc45a]                           dc.w $000b
[000cc45c]                           dc.w $0001
_48aED_AFLAGS:
[000cc45e]                           dc.w $0000
[000cc460]                           dc.w $0000
[000cc462]                           dc.w $0000
[000cc464]                           dc.w $0000
[000cc466]                           dc.w $8000
[000cc468]                           dc.w $8b4f
[000cc46a]                           dc.w $0000
[000cc46c]                           dc.w $0000
[000cc46e]                           dc.w $0000
[000cc470]                           dc.w $0000
[000cc472]                           dc.w $0000
[000cc474]                           dc.w $0000
_50_ED_AFLAGS:
[000cc476]                           dc.w $0030
[000cc478]                           dc.w $ffff
[000cc47a]                           dc.w $ffff
[000cc47c]                           dc.w $0018
[000cc47e]                           dc.w $0000
[000cc480]                           dc.w $0008
[000cc482] 000cbea6                  dc.l A_CHECKBOX01
[000cc486]                           dc.w $0000
[000cc488]                           dc.w $0000
[000cc48a]                           dc.w $0002
[000cc48c]                           dc.w $0001
_51_ED_AFLAGS:
[000cc48e]                           dc.w $0023
[000cc490]                           dc.w $0035
[000cc492]                           dc.w $0035
[000cc494]                           dc.w $0018
[000cc496]                           dc.w $0040
[000cc498]                           dc.w $0000
[000cc49a] 000cbdc6                  dc.l A_3DBUTTON20
[000cc49e]                           dc.w $0010
[000cc4a0]                           dc.w $0003
[000cc4a2]                           dc.w $000b
[000cc4a4]                           dc.w $0001
_51aED_AFLAGS:
[000cc4a6]                           dc.w $0000
[000cc4a8]                           dc.w $0000
[000cc4aa]                           dc.w $0000
[000cc4ac]                           dc.w $0000
[000cc4ae]                           dc.w $8000
[000cc4b0]                           dc.w $8b48
[000cc4b2]                           dc.w $0000
[000cc4b4]                           dc.w $0000
[000cc4b6]                           dc.w $0000
[000cc4b8]                           dc.w $0000
[000cc4ba]                           dc.w $0000
[000cc4bc]                           dc.w $0000
_53_ED_AFLAGS:
[000cc4be]                           dc.w $0033
[000cc4c0]                           dc.w $ffff
[000cc4c2]                           dc.w $ffff
[000cc4c4]                           dc.w $0018
[000cc4c6]                           dc.w $0000
[000cc4c8]                           dc.w $0008
[000cc4ca] 000cbea6                  dc.l A_CHECKBOX01
[000cc4ce]                           dc.w $0000
[000cc4d0]                           dc.w $0000
[000cc4d2]                           dc.w $0002
[000cc4d4]                           dc.w $0001
_54_ED_AFLAGS:
[000cc4d6]                           dc.w $003f
[000cc4d8]                           dc.w $0037
[000cc4da]                           dc.w $003d
[000cc4dc]                           dc.w $0018
[000cc4de]                           dc.w $0040
[000cc4e0]                           dc.w $0000
[000cc4e2] 000cbfa6                  dc.l A_INNERFRAME05
[000cc4e6]                           dc.w $001d
[000cc4e8]                           dc.w $0006
[000cc4ea]                           dc.w $0010
[000cc4ec]                           dc.w $0006
_55_ED_AFLAGS:
[000cc4ee]                           dc.w $0039
[000cc4f0]                           dc.w $ffff
[000cc4f2]                           dc.w $ffff
[000cc4f4]                           dc.w $0018
[000cc4f6]                           dc.w $0011
[000cc4f8]                           dc.w $0000
[000cc4fa] 000cbee6                  dc.l A_CHECKBOX03
[000cc4fe]                           dc.w $0001
[000cc500]                           dc.w $0001
[000cc502]                           dc.w $0007
[000cc504]                           dc.w $0001
_55aED_AFLAGS:
[000cc506]                           dc.w $0000
[000cc508]                           dc.w $0000
[000cc50a]                           dc.w $0000
[000cc50c]                           dc.w $0000
[000cc50e]                           dc.w $8000
[000cc510]                           dc.w $8b4e
[000cc512]                           dc.w $0000
[000cc514]                           dc.w $0000
[000cc516]                           dc.w $0000
[000cc518]                           dc.w $0000
[000cc51a]                           dc.w $0000
[000cc51c]                           dc.w $0000
_57_ED_AFLAGS:
[000cc51e]                           dc.w $003b
[000cc520]                           dc.w $ffff
[000cc522]                           dc.w $ffff
[000cc524]                           dc.w $0018
[000cc526]                           dc.w $0011
[000cc528]                           dc.w $0000
[000cc52a] 000cbec6                  dc.l A_CHECKBOX02
[000cc52e]                           dc.w $0001
[000cc530]                           dc.w $0002
[000cc532]                           dc.w $000c
[000cc534]                           dc.w $0001
_57aED_AFLAGS:
[000cc536]                           dc.w $0000
[000cc538]                           dc.w $0000
[000cc53a]                           dc.w $0000
[000cc53c]                           dc.w $0000
[000cc53e]                           dc.w $8000
[000cc540]                           dc.w $8b49
[000cc542]                           dc.w $0000
[000cc544]                           dc.w $0000
[000cc546]                           dc.w $0000
[000cc548]                           dc.w $0000
[000cc54a]                           dc.w $0000
[000cc54c]                           dc.w $0000
_59_ED_AFLAGS:
[000cc54e]                           dc.w $003d
[000cc550]                           dc.w $ffff
[000cc552]                           dc.w $ffff
[000cc554]                           dc.w $0018
[000cc556]                           dc.w $0011
[000cc558]                           dc.w $0000
[000cc55a] 000cbf06                  dc.l A_CHECKBOX04
[000cc55e]                           dc.w $0001
[000cc560]                           dc.w $0003
[000cc562]                           dc.w $000c
[000cc564]                           dc.w $0001
_59aED_AFLAGS:
[000cc566]                           dc.w $0000
[000cc568]                           dc.w $0000
[000cc56a]                           dc.w $0000
[000cc56c]                           dc.w $0000
[000cc56e]                           dc.w $8000
[000cc570]                           dc.w $8b41
[000cc572]                           dc.w $0000
[000cc574]                           dc.w $0000
[000cc576]                           dc.w $0000
[000cc578]                           dc.w $0000
[000cc57a]                           dc.w $0000
[000cc57c]                           dc.w $0000
_61_ED_AFLAGS:
[000cc57e]                           dc.w $0036
[000cc580]                           dc.w $ffff
[000cc582]                           dc.w $ffff
[000cc584]                           dc.w $0018
[000cc586]                           dc.w $0011
[000cc588]                           dc.w $0000
[000cc58a] 000cbf26                  dc.l A_CHECKBOX05
[000cc58e]                           dc.w $0001
[000cc590]                           dc.w $0004
[000cc592]                           dc.w $000d
[000cc594]                           dc.w $0001
_61aED_AFLAGS:
[000cc596]                           dc.w $0000
[000cc598]                           dc.w $0000
[000cc59a]                           dc.w $0000
[000cc59c]                           dc.w $0000
[000cc59e]                           dc.w $8000
[000cc5a0]                           dc.w $8b4b
[000cc5a2]                           dc.w $0000
[000cc5a4]                           dc.w $0000
[000cc5a6]                           dc.w $0000
[000cc5a8]                           dc.w $0000
[000cc5aa]                           dc.w $0000
[000cc5ac]                           dc.w $0000
_63_ED_AFLAGS:
[000cc5ae]                           dc.w $0058
[000cc5b0]                           dc.w $0040
[000cc5b2]                           dc.w $0055
[000cc5b4]                           dc.w $0018
[000cc5b6]                           dc.w $0040
[000cc5b8]                           dc.w $0000
[000cc5ba] 000cbf66                  dc.l A_INNERFRAME03
[000cc5be]                           dc.w $0001
[000cc5c0]                           dc.w $000c
[000cc5c2]                           dc.w $002c
[000cc5c4]                           dc.w $0005
_64_ED_AFLAGS:
[000cc5c6]                           dc.w $0043
[000cc5c8]                           dc.w $0042
[000cc5ca]                           dc.w $0042
[000cc5cc]                           dc.w $0018
[000cc5ce]                           dc.w $0040
[000cc5d0]                           dc.w $0000
[000cc5d2] 000cbe46                  dc.l A_3DBUTTON29
[000cc5d6]                           dc.w $0001
[000cc5d8]                           dc.w $0001
[000cc5da]                           dc.w $0008
[000cc5dc]                           dc.w $0001
_64aED_AFLAGS:
[000cc5de]                           dc.w $0000
[000cc5e0]                           dc.w $0000
[000cc5e2]                           dc.w $0000
[000cc5e4]                           dc.w $0000
[000cc5e6]                           dc.w $8000
[000cc5e8]                           dc.w $8b4c
[000cc5ea]                           dc.w $0000
[000cc5ec]                           dc.w $0000
[000cc5ee]                           dc.w $0000
[000cc5f0]                           dc.w $0000
[000cc5f2]                           dc.w $0000
[000cc5f4]                           dc.w $0000
_66_ED_AFLAGS:
[000cc5f6]                           dc.w $0040
[000cc5f8]                           dc.w $ffff
[000cc5fa]                           dc.w $ffff
[000cc5fc]                           dc.w $0018
[000cc5fe]                           dc.w $0000
[000cc600]                           dc.w $0008
[000cc602] 000cbea6                  dc.l A_CHECKBOX01
[000cc606]                           dc.w $0000
[000cc608]                           dc.w $0000
[000cc60a]                           dc.w $0002
[000cc60c]                           dc.w $0001
_67_ED_AFLAGS:
[000cc60e]                           dc.w $0046
[000cc610]                           dc.w $0045
[000cc612]                           dc.w $0045
[000cc614]                           dc.w $0018
[000cc616]                           dc.w $0040
[000cc618]                           dc.w $0000
[000cc61a] 000cbe06                  dc.l A_3DBUTTON22
[000cc61e]                           dc.w $000b
[000cc620]                           dc.w $0001
[000cc622]                           dc.w $0009
[000cc624]                           dc.w $0001
_67aED_AFLAGS:
[000cc626]                           dc.w $0000
[000cc628]                           dc.w $0000
[000cc62a]                           dc.w $0000
[000cc62c]                           dc.w $0000
[000cc62e]                           dc.w $8000
[000cc630]                           dc.w $8b45
[000cc632]                           dc.w $0000
[000cc634]                           dc.w $0000
[000cc636]                           dc.w $0000
[000cc638]                           dc.w $0000
[000cc63a]                           dc.w $0000
[000cc63c]                           dc.w $0000
_69_ED_AFLAGS:
[000cc63e]                           dc.w $0043
[000cc640]                           dc.w $ffff
[000cc642]                           dc.w $ffff
[000cc644]                           dc.w $0018
[000cc646]                           dc.w $0000
[000cc648]                           dc.w $0008
[000cc64a] 000cbea6                  dc.l A_CHECKBOX01
[000cc64e]                           dc.w $0000
[000cc650]                           dc.w $0000
[000cc652]                           dc.w $0002
[000cc654]                           dc.w $0001
_70_ED_AFLAGS:
[000cc656]                           dc.w $0049
[000cc658]                           dc.w $0048
[000cc65a]                           dc.w $0048
[000cc65c]                           dc.w $0018
[000cc65e]                           dc.w $0040
[000cc660]                           dc.w $0000
[000cc662] 000cbde6                  dc.l A_3DBUTTON21
[000cc666]                           dc.w $0016
[000cc668]                           dc.w $0001
[000cc66a]                           dc.w $0007
[000cc66c]                           dc.w $0001
_70aED_AFLAGS:
[000cc66e]                           dc.w $0000
[000cc670]                           dc.w $0000
[000cc672]                           dc.w $0000
[000cc674]                           dc.w $0000
[000cc676]                           dc.w $8000
[000cc678]                           dc.w $8b42
[000cc67a]                           dc.w $0000
[000cc67c]                           dc.w $0000
[000cc67e]                           dc.w $0000
[000cc680]                           dc.w $0000
[000cc682]                           dc.w $0000
[000cc684]                           dc.w $0000
_72_ED_AFLAGS:
[000cc686]                           dc.w $0046
[000cc688]                           dc.w $ffff
[000cc68a]                           dc.w $ffff
[000cc68c]                           dc.w $0018
[000cc68e]                           dc.w $0000
[000cc690]                           dc.w $0008
[000cc692] 000cbea6                  dc.l A_CHECKBOX01
[000cc696]                           dc.w $0000
[000cc698]                           dc.w $0000
[000cc69a]                           dc.w $0002
[000cc69c]                           dc.w $0001
_73_ED_AFLAGS:
[000cc69e]                           dc.w $004c
[000cc6a0]                           dc.w $004b
[000cc6a2]                           dc.w $004b
[000cc6a4]                           dc.w $0018
[000cc6a6]                           dc.w $0040
[000cc6a8]                           dc.w $0000
[000cc6aa] 000cbe26                  dc.l A_3DBUTTON23
[000cc6ae]                           dc.w $0020
[000cc6b0]                           dc.w $0001
[000cc6b2]                           dc.w $0008
[000cc6b4]                           dc.w $0001
_73aED_AFLAGS:
[000cc6b6]                           dc.w $0000
[000cc6b8]                           dc.w $0000
[000cc6ba]                           dc.w $0000
[000cc6bc]                           dc.w $0000
[000cc6be]                           dc.w $8000
[000cc6c0]                           dc.w $8b55
[000cc6c2]                           dc.w $0000
[000cc6c4]                           dc.w $0000
[000cc6c6]                           dc.w $0000
[000cc6c8]                           dc.w $0000
[000cc6ca]                           dc.w $0000
[000cc6cc]                           dc.w $0000
_75_ED_AFLAGS:
[000cc6ce]                           dc.w $0049
[000cc6d0]                           dc.w $ffff
[000cc6d2]                           dc.w $ffff
[000cc6d4]                           dc.w $0018
[000cc6d6]                           dc.w $0000
[000cc6d8]                           dc.w $0008
[000cc6da] 000cbea6                  dc.l A_CHECKBOX01
[000cc6de]                           dc.w $0000
[000cc6e0]                           dc.w $0000
[000cc6e2]                           dc.w $0002
[000cc6e4]                           dc.w $0001
_76_ED_AFLAGS:
[000cc6e6]                           dc.w $004f
[000cc6e8]                           dc.w $004d
[000cc6ea]                           dc.w $004e
[000cc6ec]                           dc.w $0014
[000cc6ee]                           dc.w $0000
[000cc6f0]                           dc.w $0000
[000cc6f2]                           dc.w $0000
[000cc6f4]                           dc.w $0101
[000cc6f6]                           dc.w $0004
[000cc6f8]                           dc.w $0002
[000cc6fa]                           dc.w $0004
[000cc6fc]                           dc.w $0002
_77_ED_AFLAGS:
[000cc6fe]                           dc.w $004e
[000cc700]                           dc.w $ffff
[000cc702]                           dc.w $ffff
[000cc704]                           dc.w $0018
[000cc706]                           dc.w $0040
[000cc708]                           dc.w $0000
[000cc70a] 000cbe66                  dc.l A_ARROWS01
[000cc70e]                           dc.w $0000
[000cc710]                           dc.w $0001
[000cc712]                           dc.w $0004
[000cc714]                           dc.w $0001
_78_ED_AFLAGS:
[000cc716]                           dc.w $004c
[000cc718]                           dc.w $ffff
[000cc71a]                           dc.w $ffff
[000cc71c]                           dc.w $0014
[000cc71e]                           dc.w $0040
[000cc720]                           dc.w $0000
[000cc722]                           dc.w $0001
[000cc724]                           dc.w $1111
[000cc726]                           dc.w $0000
[000cc728]                           dc.w $0000
[000cc72a]                           dc.w $0002
[000cc72c]                           dc.w $0001
_79_ED_AFLAGS:
[000cc72e]                           dc.w $0052
[000cc730]                           dc.w $0050
[000cc732]                           dc.w $0051
[000cc734]                           dc.w $0014
[000cc736]                           dc.w $0000
[000cc738]                           dc.w $0000
[000cc73a]                           dc.w $0000
[000cc73c]                           dc.w $0101
[000cc73e]                           dc.w $000e
[000cc740]                           dc.w $0002
[000cc742]                           dc.w $0004
[000cc744]                           dc.w $0002
_80_ED_AFLAGS:
[000cc746]                           dc.w $0051
[000cc748]                           dc.w $ffff
[000cc74a]                           dc.w $ffff
[000cc74c]                           dc.w $0018
[000cc74e]                           dc.w $0040
[000cc750]                           dc.w $0000
[000cc752] 000cbe66                  dc.l A_ARROWS01
[000cc756]                           dc.w $0002
[000cc758]                           dc.w $0001
[000cc75a]                           dc.w $0002
[000cc75c]                           dc.w $0001
_81_ED_AFLAGS:
[000cc75e]                           dc.w $004f
[000cc760]                           dc.w $ffff
[000cc762]                           dc.w $ffff
[000cc764]                           dc.w $0014
[000cc766]                           dc.w $0040
[000cc768]                           dc.w $0000
[000cc76a]                           dc.w $0001
[000cc76c]                           dc.w $1111
[000cc76e]                           dc.w $0000
[000cc770]                           dc.w $0000
[000cc772]                           dc.w $0002
[000cc774]                           dc.w $0001
_82_ED_AFLAGS:
[000cc776]                           dc.w $0055
[000cc778]                           dc.w $0053
[000cc77a]                           dc.w $0054
[000cc77c]                           dc.w $0014
[000cc77e]                           dc.w $0000
[000cc780]                           dc.w $0000
[000cc782]                           dc.w $0000
[000cc784]                           dc.w $0101
[000cc786]                           dc.w $0019
[000cc788]                           dc.w $0002
[000cc78a]                           dc.w $0004
[000cc78c]                           dc.w $0002
_83_ED_AFLAGS:
[000cc78e]                           dc.w $0054
[000cc790]                           dc.w $ffff
[000cc792]                           dc.w $ffff
[000cc794]                           dc.w $0018
[000cc796]                           dc.w $0040
[000cc798]                           dc.w $0000
[000cc79a] 000cbe86                  dc.l A_ARROWS02
[000cc79e]                           dc.w $0002
[000cc7a0]                           dc.w $0000
[000cc7a2]                           dc.w $0002
[000cc7a4]                           dc.w $0002
_84_ED_AFLAGS:
[000cc7a6]                           dc.w $0052
[000cc7a8]                           dc.w $ffff
[000cc7aa]                           dc.w $ffff
[000cc7ac]                           dc.w $0014
[000cc7ae]                           dc.w $0040
[000cc7b0]                           dc.w $0000
[000cc7b2]                           dc.w $0001
[000cc7b4]                           dc.w $1111
[000cc7b6]                           dc.w $0000
[000cc7b8]                           dc.w $0000
[000cc7ba]                           dc.w $0002
[000cc7bc]                           dc.w $0001
_85_ED_AFLAGS:
[000cc7be]                           dc.w $003f
[000cc7c0]                           dc.w $0056
[000cc7c2]                           dc.w $0057
[000cc7c4]                           dc.w $0014
[000cc7c6]                           dc.w $0000
[000cc7c8]                           dc.w $0000
[000cc7ca]                           dc.w $0000
[000cc7cc]                           dc.w $0101
[000cc7ce]                           dc.w $0023
[000cc7d0]                           dc.w $0002
[000cc7d2]                           dc.w $0004
[000cc7d4]                           dc.w $0002
_86_ED_AFLAGS:
[000cc7d6]                           dc.w $0057
[000cc7d8]                           dc.w $ffff
[000cc7da]                           dc.w $ffff
[000cc7dc]                           dc.w $0018
[000cc7de]                           dc.w $0040
[000cc7e0]                           dc.w $0000
[000cc7e2] 000cbe86                  dc.l A_ARROWS02
[000cc7e6]                           dc.w $0002
[000cc7e8]                           dc.w $0001
[000cc7ea]                           dc.w $0002
[000cc7ec]                           dc.w $0001
_87_ED_AFLAGS:
[000cc7ee]                           dc.w $0055
[000cc7f0]                           dc.w $ffff
[000cc7f2]                           dc.w $ffff
[000cc7f4]                           dc.w $0014
[000cc7f6]                           dc.w $0040
[000cc7f8]                           dc.w $0000
[000cc7fa]                           dc.w $0001
[000cc7fc]                           dc.w $1111
[000cc7fe]                           dc.w $0000
[000cc800]                           dc.w $0000
[000cc802]                           dc.w $0002
[000cc804]                           dc.w $0001
_88_ED_AFLAGS:
[000cc806]                           dc.w $005a
[000cc808]                           dc.w $ffff
[000cc80a]                           dc.w $ffff
[000cc80c]                           dc.w $0018
[000cc80e]                           dc.w $4007
[000cc810]                           dc.w $0010
[000cc812] 000cbbe6                  dc.l A_3DBUTTON05
[000cc816]                           dc.w $0009
[000cc818]                           dc.w $0011
[000cc81a]                           dc.w $000c
[000cc81c]                           dc.w $0002
_88aED_AFLAGS:
[000cc81e] 0003275a                  dc.l edafl_ok
[000cc822]                           dc.w $0000
[000cc824]                           dc.w $0000
[000cc826]                           dc.w $8000
[000cc828]                           dc.w $884f
[000cc82a]                           dc.w $0000
[000cc82c]                           dc.w $0000
[000cc82e]                           dc.w $0000
[000cc830]                           dc.w $0000
[000cc832]                           dc.w $0000
[000cc834]                           dc.w $0000
_90_ED_AFLAGS:
[000cc836]                           dc.w $0000
[000cc838]                           dc.w $ffff
[000cc83a]                           dc.w $ffff
[000cc83c]                           dc.w $0018
[000cc83e]                           dc.w $4005
[000cc840]                           dc.w $0010
[000cc842] 000cbb66                  dc.l A_3DBUTTON01
[000cc846]                           dc.w $0019
[000cc848]                           dc.w $0011
[000cc84a]                           dc.w $000c
[000cc84c]                           dc.w $0002
_90aED_AFLAGS:
[000cc84e] 0002f27c                  dc.l ed_abort
[000cc852]                           dc.w $0000
[000cc854]                           dc.w $0000
[000cc856]                           dc.w $8020
[000cc858]                           dc.w $8841
[000cc85a]                           dc.w $0000
[000cc85c]                           dc.w $0000
[000cc85e]                           dc.w $0000
[000cc860]                           dc.w $0000
[000cc862]                           dc.w $0000
[000cc864]                           dc.w $0000
sm:
[000cc866]                           dc.w $0000
[000cc868]                           dc.w $0000
[000cc86a] 0003275a                  dc.l edafl_ok
[000cc86e] 0004f20a                  dc.l Aob_delete
[000cc872]                           dc.w $0000
[000cc874]                           dc.w $0000
[000cc876] 000cbb39                  dc.l help_title
[000cc87a]                           dc.w $0000
[000cc87c]                           dc.w $0000
