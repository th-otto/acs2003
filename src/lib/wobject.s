Awi_diaend:
[00051388] 2f0a                      move.l     a2,-(a7)
[0005138a] 4fef fff0                 lea.l      -16(a7),a7
[0005138e] 2039 000e 0cb2            move.l     open_dialog,d0
[00051394] 672c                      beq.s      $000513C2
[00051396] 486f 0002                 pea.l      2(a7)
[0005139a] 486f 0008                 pea.l      8(a7)
[0005139e] 43ef 0010                 lea.l      16(a7),a1
[000513a2] 2079 000e 0cb2            movea.l    open_dialog,a0
[000513a8] 4eb9 0005 2df2            jsr        Awi_find_edit
[000513ae] 504f                      addq.w     #8,a7
[000513b0] 4a40                      tst.w      d0
[000513b2] 670e                      beq.s      $000513C2
[000513b4] 7002                      moveq.l    #2,d0
[000513b6] 2079 000e 0cb2            movea.l    open_dialog,a0
[000513bc] c068 0056                 and.w      86(a0),d0
[000513c0] 6604                      bne.s      $000513C6
[000513c2] 6000 00b0                 bra        $00051474
[000513c6] 322f 0002                 move.w     2(a7),d1
[000513ca] 48c1                      ext.l      d1
[000513cc] 2001                      move.l     d1,d0
[000513ce] d080                      add.l      d0,d0
[000513d0] d081                      add.l      d1,d0
[000513d2] e788                      lsl.l      #3,d0
[000513d4] 206f 0008                 movea.l    8(a7),a0
[000513d8] 2f70 080c 000c            move.l     12(a0,d0.l),12(a7)
[000513de] 2079 000e 0cb2            movea.l    open_dialog,a0
[000513e4] 0268 fffd 0056            andi.w     #$FFFD,86(a0)
[000513ea] 23f9 000e 0cb2 000e 0cb6  move.l     open_dialog,last_edit
[000513f4] 2079 000e 0cb2            movea.l    open_dialog,a0
[000513fa] 3028 001c                 move.w     28(a0),d0
[000513fe] 3e80                      move.w     d0,(a7)
[00051400] 33c0 000e 0cbe            move.w     d0,$000E0CBE
[00051406] 3017                      move.w     (a7),d0
[00051408] c07c 1000                 and.w      #$1000,d0
[0005140c] 6710                      beq.s      $0005141E
[0005140e] 2079 000e 0cb2            movea.l    open_dialog,a0
[00051414] 23e8 0018 000e 0cba       move.l     24(a0),$000E0CBA
[0005141c] 600e                      bra.s      $0005142C
[0005141e] 2079 000e 0cb2            movea.l    open_dialog,a0
[00051424] 23e8 0014 000e 0cba       move.l     20(a0),$000E0CBA
[0005142c] 70ff                      moveq.l    #-1,d0
[0005142e] 2079 000e 0cb2            movea.l    open_dialog,a0
[00051434] 3140 001e                 move.w     d0,30(a0)
[00051438] 2079 000e 0cb2            movea.l    open_dialog,a0
[0005143e] 3140 001c                 move.w     d0,28(a0)
[00051442] 2079 000e 0cb2            movea.l    open_dialog,a0
[00051448] 4268 0052                 clr.w      82(a0)
[0005144c] 42b9 000e 0cb2            clr.l      open_dialog
[00051452] 93c9                      suba.l     a1,a1
[00051454] 7006                      moveq.l    #6,d0
[00051456] 342f 0002                 move.w     2(a7),d2
[0005145a] 48c2                      ext.l      d2
[0005145c] 2202                      move.l     d2,d1
[0005145e] d281                      add.l      d1,d1
[00051460] d282                      add.l      d2,d1
[00051462] e789                      lsl.l      #3,d1
[00051464] 206f 0008                 movea.l    8(a7),a0
[00051468] d1c1                      adda.l     d1,a0
[0005146a] 246f 000c                 movea.l    12(a7),a2
[0005146e] 246a 0008                 movea.l    8(a2),a2
[00051472] 4e92                      jsr        (a2)
[00051474] 4fef 0010                 lea.l      16(a7),a7
[00051478] 245f                      movea.l    (a7)+,a2
[0005147a] 4e75                      rts
Awi_diastart:
[0005147c] 2f0a                      move.l     a2,-(a7)
[0005147e] 4fef ffde                 lea.l      -34(a7),a7
[00051482] 3ebc ffff                 move.w     #$FFFF,(a7)
[00051486] 42a7                      clr.l      -(a7)
[00051488] 42a7                      clr.l      -(a7)
[0005148a] 42a7                      clr.l      -(a7)
[0005148c] 486f 0012                 pea.l      18(a7)
[00051490] 720a                      moveq.l    #10,d1
[00051492] 4240                      clr.w      d0
[00051494] 4eb9 0007 f7ba            jsr        wind_get
[0005149a] 4fef 0010                 lea.l      16(a7),a7
[0005149e] 302f 0006                 move.w     6(a7),d0
[000514a2] 6f1c                      ble.s      $000514C0
[000514a4] 302f 0006                 move.w     6(a7),d0
[000514a8] 4eb9 0005 5e68            jsr        Awi_wid
[000514ae] 2f48 001e                 move.l     a0,30(a7)
[000514b2] 670c                      beq.s      $000514C0
[000514b4] 7002                      moveq.l    #2,d0
[000514b6] 206f 001e                 movea.l    30(a7),a0
[000514ba] c068 0056                 and.w      86(a0),d0
[000514be] 6704                      beq.s      $000514C4
[000514c0] 6000 0208                 bra        $000516CA
[000514c4] 206f 001e                 movea.l    30(a7),a0
[000514c8] 3028 001c                 move.w     28(a0),d0
[000514cc] 6a00 0080                 bpl        $0005154E
[000514d0] 206f 001e                 movea.l    30(a7),a0
[000514d4] b1f9 000e 0cb6            cmpa.l     last_edit,a0
[000514da] 6672                      bne.s      $0005154E
[000514dc] 206f 001e                 movea.l    30(a7),a0
[000514e0] 2068 0014                 movea.l    20(a0),a0
[000514e4] b1f9 000e 0cba            cmpa.l     $000E0CBA,a0
[000514ea] 6628                      bne.s      $00051514
[000514ec] 7008                      moveq.l    #8,d0
[000514ee] 3439 000e 0cbe            move.w     $000E0CBE,d2
[000514f4] 48c2                      ext.l      d2
[000514f6] 2202                      move.l     d2,d1
[000514f8] d281                      add.l      d1,d1
[000514fa] d282                      add.l      d2,d1
[000514fc] e789                      lsl.l      #3,d1
[000514fe] 206f 001e                 movea.l    30(a7),a0
[00051502] 2068 0014                 movea.l    20(a0),a0
[00051506] c070 1808                 and.w      8(a0,d1.l),d0
[0005150a] 6706                      beq.s      $00051512
[0005150c] 3eb9 000e 0cbe            move.w     $000E0CBE,(a7)
[00051512] 603a                      bra.s      $0005154E
[00051514] 206f 001e                 movea.l    30(a7),a0
[00051518] 2068 0018                 movea.l    24(a0),a0
[0005151c] b1f9 000e 0cba            cmpa.l     $000E0CBA,a0
[00051522] 662a                      bne.s      $0005154E
[00051524] 7008                      moveq.l    #8,d0
[00051526] 3439 000e 0cbe            move.w     $000E0CBE,d2
[0005152c] c47c 0fff                 and.w      #$0FFF,d2
[00051530] 48c2                      ext.l      d2
[00051532] 2202                      move.l     d2,d1
[00051534] d281                      add.l      d1,d1
[00051536] d282                      add.l      d2,d1
[00051538] e789                      lsl.l      #3,d1
[0005153a] 206f 001e                 movea.l    30(a7),a0
[0005153e] 2068 0018                 movea.l    24(a0),a0
[00051542] c070 1808                 and.w      8(a0,d1.l),d0
[00051546] 6706                      beq.s      $0005154E
[00051548] 3eb9 000e 0cbe            move.w     $000E0CBE,(a7)
[0005154e] 3017                      move.w     (a7),d0
[00051550] 6f36                      ble.s      $00051588
[00051552] 3039 000e 0cbe            move.w     $000E0CBE,d0
[00051558] c07c 1000                 and.w      #$1000,d0
[0005155c] 6718                      beq.s      $00051576
[0005155e] 3039 000e 0cbe            move.w     $000E0CBE,d0
[00051564] c07c 0fff                 and.w      #$0FFF,d0
[00051568] 3e80                      move.w     d0,(a7)
[0005156a] 206f 001e                 movea.l    30(a7),a0
[0005156e] 2f68 0018 000c            move.l     24(a0),12(a7)
[00051574] 6010                      bra.s      $00051586
[00051576] 3eb9 000e 0cbe            move.w     $000E0CBE,(a7)
[0005157c] 206f 001e                 movea.l    30(a7),a0
[00051580] 2f68 0014 000c            move.l     20(a0),12(a7)
[00051586] 601e                      bra.s      $000515A6
[00051588] 4857                      pea.l      (a7)
[0005158a] 486f 000c                 pea.l      12(a7)
[0005158e] 43ef 0014                 lea.l      20(a7),a1
[00051592] 206f 0026                 movea.l    38(a7),a0
[00051596] 4eb9 0005 2df2            jsr        Awi_find_edit
[0005159c] 504f                      addq.w     #8,a7
[0005159e] 4a40                      tst.w      d0
[000515a0] 6604                      bne.s      $000515A6
[000515a2] 6000 0126                 bra        $000516CA
[000515a6] 3217                      move.w     (a7),d1
[000515a8] 48c1                      ext.l      d1
[000515aa] 2001                      move.l     d1,d0
[000515ac] d080                      add.l      d0,d0
[000515ae] d081                      add.l      d1,d0
[000515b0] e788                      lsl.l      #3,d0
[000515b2] 206f 000c                 movea.l    12(a7),a0
[000515b6] 2f70 080c 001a            move.l     12(a0,d0.l),26(a7)
[000515bc] 206f 001e                 movea.l    30(a7),a0
[000515c0] 0068 0002 0056            ori.w      #$0002,86(a0)
[000515c6] 23ef 001e 000e 0cb2       move.l     30(a7),open_dialog
[000515ce] 206f 001e                 movea.l    30(a7),a0
[000515d2] 226f 000c                 movea.l    12(a7),a1
[000515d6] b3e8 0014                 cmpa.l     20(a0),a1
[000515da] 660a                      bne.s      $000515E6
[000515dc] 206f 001e                 movea.l    30(a7),a0
[000515e0] 3157 001c                 move.w     (a7),28(a0)
[000515e4] 600e                      bra.s      $000515F4
[000515e6] 3017                      move.w     (a7),d0
[000515e8] 807c 1000                 or.w       #$1000,d0
[000515ec] 206f 001e                 movea.l    30(a7),a0
[000515f0] 3140 001c                 move.w     d0,28(a0)
[000515f4] 2f6f 001e 0010            move.l     30(a7),16(a7)
[000515fa] 206f 001e                 movea.l    30(a7),a0
[000515fe] 226f 000c                 movea.l    12(a7),a1
[00051602] b3e8 0014                 cmpa.l     20(a0),a1
[00051606] 6620                      bne.s      $00051628
[00051608] 3217                      move.w     (a7),d1
[0005160a] 48c1                      ext.l      d1
[0005160c] 2001                      move.l     d1,d0
[0005160e] d080                      add.l      d0,d0
[00051610] d081                      add.l      d1,d0
[00051612] e788                      lsl.l      #3,d0
[00051614] 206f 001e                 movea.l    30(a7),a0
[00051618] 2068 0014                 movea.l    20(a0),a0
[0005161c] d1c0                      adda.l     d0,a0
[0005161e] 2f48 0014                 move.l     a0,20(a7)
[00051622] 3f57 0018                 move.w     (a7),24(a7)
[00051626] 6028                      bra.s      $00051650
[00051628] 3217                      move.w     (a7),d1
[0005162a] c27c 0fff                 and.w      #$0FFF,d1
[0005162e] 48c1                      ext.l      d1
[00051630] 2001                      move.l     d1,d0
[00051632] d080                      add.l      d0,d0
[00051634] d081                      add.l      d1,d0
[00051636] e788                      lsl.l      #3,d0
[00051638] 206f 001e                 movea.l    30(a7),a0
[0005163c] 2068 0018                 movea.l    24(a0),a0
[00051640] d1c0                      adda.l     d0,a0
[00051642] 2f48 0014                 move.l     a0,20(a7)
[00051646] 3017                      move.w     (a7),d0
[00051648] 807c 1000                 or.w       #$1000,d0
[0005164c] 3f40 0018                 move.w     d0,24(a7)
[00051650] 43ef 0010                 lea.l      16(a7),a1
[00051654] 7009                      moveq.l    #9,d0
[00051656] 3417                      move.w     (a7),d2
[00051658] 48c2                      ext.l      d2
[0005165a] 2202                      move.l     d2,d1
[0005165c] d281                      add.l      d1,d1
[0005165e] d282                      add.l      d2,d1
[00051660] e789                      lsl.l      #3,d1
[00051662] 206f 000c                 movea.l    12(a7),a0
[00051666] d1c1                      adda.l     d1,a0
[00051668] 246f 001a                 movea.l    26(a7),a2
[0005166c] 246a 0008                 movea.l    8(a2),a2
[00051670] 4e92                      jsr        (a2)
[00051672] 206f 001e                 movea.l    30(a7),a0
[00051676] 3028 001e                 move.w     30(a0),d0
[0005167a] 6a2e                      bpl.s      $000516AA
[0005167c] 426f 0002                 clr.w      2(a7)
[00051680] 3f7c ffff 0004            move.w     #$FFFF,4(a7)
[00051686] 43ef 0002                 lea.l      2(a7),a1
[0005168a] 303c 02c2                 move.w     #$02C2,d0
[0005168e] 3417                      move.w     (a7),d2
[00051690] 48c2                      ext.l      d2
[00051692] 2202                      move.l     d2,d1
[00051694] d281                      add.l      d1,d1
[00051696] d282                      add.l      d2,d1
[00051698] e789                      lsl.l      #3,d1
[0005169a] 206f 000c                 movea.l    12(a7),a0
[0005169e] d1c1                      adda.l     d1,a0
[000516a0] 246f 001a                 movea.l    26(a7),a2
[000516a4] 246a 0008                 movea.l    8(a2),a2
[000516a8] 4e92                      jsr        (a2)
[000516aa] 93c9                      suba.l     a1,a1
[000516ac] 7006                      moveq.l    #6,d0
[000516ae] 3417                      move.w     (a7),d2
[000516b0] 48c2                      ext.l      d2
[000516b2] 2202                      move.l     d2,d1
[000516b4] d281                      add.l      d1,d1
[000516b6] d282                      add.l      d2,d1
[000516b8] e789                      lsl.l      #3,d1
[000516ba] 206f 000c                 movea.l    12(a7),a0
[000516be] d1c1                      adda.l     d1,a0
[000516c0] 246f 001a                 movea.l    26(a7),a2
[000516c4] 246a 0008                 movea.l    8(a2),a2
[000516c8] 4e92                      jsr        (a2)
[000516ca] 4fef 0022                 lea.l      34(a7),a7
[000516ce] 245f                      movea.l    (a7)+,a2
[000516d0] 4e75                      rts
Awi_self0:
[000516d2] 2f0a                      move.l     a2,-(a7)
[000516d4] 4fef ffee                 lea.l      -18(a7),a7
[000516d8] 2f48 000e                 move.l     a0,14(a7)
[000516dc] 2f49 000a                 move.l     a1,10(a7)
[000516e0] 3f40 0008                 move.w     d0,8(a7)
[000516e4] 3f7c ffff 0006            move.w     #$FFFF,6(a7)
[000516ea] 6000 0112                 bra        $000517FE
[000516ee] 302f 0006                 move.w     6(a7),d0
[000516f2] 6a06                      bpl.s      $000516FA
[000516f4] 426f 0004                 clr.w      4(a7)
[000516f8] 6018                      bra.s      $00051712
[000516fa] 322f 0006                 move.w     6(a7),d1
[000516fe] 48c1                      ext.l      d1
[00051700] 2001                      move.l     d1,d0
[00051702] d080                      add.l      d0,d0
[00051704] d081                      add.l      d1,d0
[00051706] e788                      lsl.l      #3,d0
[00051708] 206f 000a                 movea.l    10(a7),a0
[0005170c] 3f70 0802 0004            move.w     2(a0,d0.l),4(a7)
[00051712] 302f 0004                 move.w     4(a7),d0
[00051716] 6a5a                      bpl.s      $00051772
[00051718] 322f 0006                 move.w     6(a7),d1
[0005171c] 48c1                      ext.l      d1
[0005171e] 2001                      move.l     d1,d0
[00051720] d080                      add.l      d0,d0
[00051722] d081                      add.l      d1,d0
[00051724] e788                      lsl.l      #3,d0
[00051726] 206f 000a                 movea.l    10(a7),a0
[0005172a] 3f70 0800 0004            move.w     0(a0,d0.l),4(a7)
[00051730] 601e                      bra.s      $00051750
[00051732] 3f6f 0004 0006            move.w     4(a7),6(a7)
[00051738] 322f 0004                 move.w     4(a7),d1
[0005173c] 48c1                      ext.l      d1
[0005173e] 2001                      move.l     d1,d0
[00051740] d080                      add.l      d0,d0
[00051742] d081                      add.l      d1,d0
[00051744] e788                      lsl.l      #3,d0
[00051746] 206f 000a                 movea.l    10(a7),a0
[0005174a] 3f70 0800 0004            move.w     0(a0,d0.l),4(a7)
[00051750] 302f 0004                 move.w     4(a7),d0
[00051754] 6b1c                      bmi.s      $00051772
[00051756] 322f 0004                 move.w     4(a7),d1
[0005175a] 48c1                      ext.l      d1
[0005175c] 2001                      move.l     d1,d0
[0005175e] d080                      add.l      d0,d0
[00051760] d081                      add.l      d1,d0
[00051762] e788                      lsl.l      #3,d0
[00051764] 206f 000a                 movea.l    10(a7),a0
[00051768] 322f 0006                 move.w     6(a7),d1
[0005176c] b270 0804                 cmp.w      4(a0,d0.l),d1
[00051770] 67c0                      beq.s      $00051732
[00051772] 302f 0004                 move.w     4(a7),d0
[00051776] 6a04                      bpl.s      $0005177C
[00051778] 6000 0088                 bra        $00051802
[0005177c] 322f 0004                 move.w     4(a7),d1
[00051780] 48c1                      ext.l      d1
[00051782] 2001                      move.l     d1,d0
[00051784] d080                      add.l      d0,d0
[00051786] d081                      add.l      d1,d0
[00051788] e788                      lsl.l      #3,d0
[0005178a] 206f 000a                 movea.l    10(a7),a0
[0005178e] 0c30 0018 0807            cmpi.b     #$18,7(a0,d0.l)
[00051794] 6662                      bne.s      $000517F8
[00051796] 322f 0004                 move.w     4(a7),d1
[0005179a] 48c1                      ext.l      d1
[0005179c] 2001                      move.l     d1,d0
[0005179e] d080                      add.l      d0,d0
[000517a0] d081                      add.l      d1,d0
[000517a2] e788                      lsl.l      #3,d0
[000517a4] 206f 000a                 movea.l    10(a7),a0
[000517a8] 2eb0 080c                 move.l     12(a0,d0.l),(a7)
[000517ac] 674a                      beq.s      $000517F8
[000517ae] 2057                      movea.l    (a7),a0
[000517b0] 2028 0008                 move.l     8(a0),d0
[000517b4] 6742                      beq.s      $000517F8
[000517b6] 322f 0004                 move.w     4(a7),d1
[000517ba] 48c1                      ext.l      d1
[000517bc] 2001                      move.l     d1,d0
[000517be] d080                      add.l      d0,d0
[000517c0] d081                      add.l      d1,d0
[000517c2] e788                      lsl.l      #3,d0
[000517c4] 206f 000a                 movea.l    10(a7),a0
[000517c8] d1c0                      adda.l     d0,a0
[000517ca] 226f 000e                 movea.l    14(a7),a1
[000517ce] 2348 0004                 move.l     a0,4(a1)
[000517d2] 302f 0004                 move.w     4(a7),d0
[000517d6] 806f 0008                 or.w       8(a7),d0
[000517da] 206f 000e                 movea.l    14(a7),a0
[000517de] 3140 0008                 move.w     d0,8(a0)
[000517e2] 226f 000e                 movea.l    14(a7),a1
[000517e6] 7009                      moveq.l    #9,d0
[000517e8] 206f 000e                 movea.l    14(a7),a0
[000517ec] 2068 0004                 movea.l    4(a0),a0
[000517f0] 2457                      movea.l    (a7),a2
[000517f2] 246a 0008                 movea.l    8(a2),a2
[000517f6] 4e92                      jsr        (a2)
[000517f8] 3f6f 0004 0006            move.w     4(a7),6(a7)
[000517fe] 6000 feee                 bra        $000516EE
[00051802] 4fef 0012                 lea.l      18(a7),a7
[00051806] 245f                      movea.l    (a7)+,a2
[00051808] 4e75                      rts
Awi_uoself:
[0005180a] 4fef fff2                 lea.l      -14(a7),a7
[0005180e] 2f48 000a                 move.l     a0,10(a7)
[00051812] 2eaf 000a                 move.l     10(a7),(a7)
[00051816] 206f 000a                 movea.l    10(a7),a0
[0005181a] 2028 0018                 move.l     24(a0),d0
[0005181e] 6712                      beq.s      $00051832
[00051820] 303c 1000                 move.w     #$1000,d0
[00051824] 206f 000a                 movea.l    10(a7),a0
[00051828] 2268 0018                 movea.l    24(a0),a1
[0005182c] 41d7                      lea.l      (a7),a0
[0005182e] 6100 fea2                 bsr        Awi_self0
[00051832] 206f 000a                 movea.l    10(a7),a0
[00051836] 2028 0014                 move.l     20(a0),d0
[0005183a] 6710                      beq.s      $0005184C
[0005183c] 4240                      clr.w      d0
[0005183e] 206f 000a                 movea.l    10(a7),a0
[00051842] 2268 0014                 movea.l    20(a0),a1
[00051846] 41d7                      lea.l      (a7),a0
[00051848] 6100 fe88                 bsr        Awi_self0
[0005184c] 4fef 000e                 lea.l      14(a7),a7
[00051850] 4e75                      rts
Awi_obchange:
[00051852] 4fef ffd0                 lea.l      -48(a7),a7
[00051856] 2f48 002c                 move.l     a0,44(a7)
[0005185a] 3f40 002a                 move.w     d0,42(a7)
[0005185e] 3f41 0028                 move.w     d1,40(a7)
[00051862] 206f 002c                 movea.l    44(a7),a0
[00051866] 3028 0056                 move.w     86(a0),d0
[0005186a] c07c 2800                 and.w      #$2800,d0
[0005186e] 6710                      beq.s      $00051880
[00051870] 4240                      clr.w      d0
[00051872] 206f 002c                 movea.l    44(a7),a0
[00051876] 4eb9 0005 1b80            jsr        Awi_obredraw
[0005187c] 6000 02fc                 bra        $00051B7A
[00051880] 302f 002a                 move.w     42(a7),d0
[00051884] c07c 1000                 and.w      #$1000,d0
[00051888] 6722                      beq.s      $000518AC
[0005188a] 206f 002c                 movea.l    44(a7),a0
[0005188e] 2f68 0018 0010            move.l     24(a0),16(a7)
[00051894] 202f 0010                 move.l     16(a7),d0
[00051898] 6604                      bne.s      $0005189E
[0005189a] 6000 02de                 bra        $00051B7A
[0005189e] 302f 002a                 move.w     42(a7),d0
[000518a2] c07c 0fff                 and.w      #$0FFF,d0
[000518a6] 3f40 0002                 move.w     d0,2(a7)
[000518aa] 601a                      bra.s      $000518C6
[000518ac] 206f 002c                 movea.l    44(a7),a0
[000518b0] 2f68 0014 0010            move.l     20(a0),16(a7)
[000518b6] 202f 0010                 move.l     16(a7),d0
[000518ba] 6604                      bne.s      $000518C0
[000518bc] 6000 02bc                 bra        $00051B7A
[000518c0] 3f6f 002a 0002            move.w     42(a7),2(a7)
[000518c6] 322f 0002                 move.w     2(a7),d1
[000518ca] 48c1                      ext.l      d1
[000518cc] 2001                      move.l     d1,d0
[000518ce] d080                      add.l      d0,d0
[000518d0] d081                      add.l      d1,d0
[000518d2] e788                      lsl.l      #3,d0
[000518d4] 206f 0010                 movea.l    16(a7),a0
[000518d8] d1c0                      adda.l     d0,a0
[000518da] 2f48 000c                 move.l     a0,12(a7)
[000518de] 0c6f ffff 0028            cmpi.w     #$FFFF,40(a7)
[000518e4] 660a                      bne.s      $000518F0
[000518e6] 206f 000c                 movea.l    12(a7),a0
[000518ea] 3f68 000a 0028            move.w     10(a0),40(a7)
[000518f0] 206f 000c                 movea.l    12(a7),a0
[000518f4] 0c28 0021 0007            cmpi.b     #$21,7(a0)
[000518fa] 661c                      bne.s      $00051918
[000518fc] 206f 000c                 movea.l    12(a7),a0
[00051900] 316f 0028 000a            move.w     40(a7),10(a0)
[00051906] 302f 002a                 move.w     42(a7),d0
[0005190a] 206f 002c                 movea.l    44(a7),a0
[0005190e] 4eb9 0005 1b80            jsr        Awi_obredraw
[00051914] 6000 0264                 bra        $00051B7A
[00051918] 206f 002c                 movea.l    44(a7),a0
[0005191c] 3f68 0034 0020            move.w     52(a0),32(a7)
[00051922] 206f 002c                 movea.l    44(a7),a0
[00051926] 3f68 0038 0024            move.w     56(a0),36(a7)
[0005192c] 302f 002a                 move.w     42(a7),d0
[00051930] c07c 1000                 and.w      #$1000,d0
[00051934] 6720                      beq.s      $00051956
[00051936] 206f 002c                 movea.l    44(a7),a0
[0005193a] 3028 0036                 move.w     54(a0),d0
[0005193e] 206f 0010                 movea.l    16(a7),a0
[00051942] d068 0012                 add.w      18(a0),d0
[00051946] 3f40 0022                 move.w     d0,34(a7)
[0005194a] 206f 0010                 movea.l    16(a7),a0
[0005194e] 3f68 0016 0026            move.w     22(a0),38(a7)
[00051954] 6014                      bra.s      $0005196A
[00051956] 206f 002c                 movea.l    44(a7),a0
[0005195a] 3f68 0036 0022            move.w     54(a0),34(a7)
[00051960] 206f 002c                 movea.l    44(a7),a0
[00051964] 3f68 003a 0026            move.w     58(a0),38(a7)
[0005196a] 206f 000c                 movea.l    12(a7),a0
[0005196e] 3028 000a                 move.w     10(a0),d0
[00051972] 322f 0028                 move.w     40(a7),d1
[00051976] b340                      eor.w      d1,d0
[00051978] c07c 0008                 and.w      #$0008,d0
[0005197c] 670a                      beq.s      $00051988
[0005197e] 206f 000c                 movea.l    12(a7),a0
[00051982] 316f 0028 000a            move.w     40(a7),10(a0)
[00051988] 206f 000c                 movea.l    12(a7),a0
[0005198c] 3ea8 000a                 move.w     10(a0),(a7)
[00051990] 206f 002c                 movea.l    44(a7),a0
[00051994] 3f68 0020 000a            move.w     32(a0),10(a7)
[0005199a] 302f 000a                 move.w     10(a7),d0
[0005199e] 6b00 01d0                 bmi        $00051B70
[000519a2] 206f 002c                 movea.l    44(a7),a0
[000519a6] 41e8 0034                 lea.l      52(a0),a0
[000519aa] 2f48 0014                 move.l     a0,20(a7)
[000519ae] 206f 0010                 movea.l    16(a7),a0
[000519b2] 3f68 0010 0008            move.w     16(a0),8(a7)
[000519b8] 206f 0010                 movea.l    16(a7),a0
[000519bc] 3f68 0012 0006            move.w     18(a0),6(a7)
[000519c2] 206f 0014                 movea.l    20(a7),a0
[000519c6] 3010                      move.w     (a0),d0
[000519c8] 206f 0010                 movea.l    16(a7),a0
[000519cc] d168 0010                 add.w      d0,16(a0)
[000519d0] 206f 0014                 movea.l    20(a7),a0
[000519d4] 3028 0002                 move.w     2(a0),d0
[000519d8] 206f 0010                 movea.l    16(a7),a0
[000519dc] d168 0012                 add.w      d0,18(a0)
[000519e0] 2279 000e 692a            movea.l    _globl,a1
[000519e6] 91c8                      suba.l     a0,a0
[000519e8] 303c 0100                 move.w     #$0100,d0
[000519ec] 4eb9 0007 abe4            jsr        mt_graf_mouse
[000519f2] 486f 001e                 pea.l      30(a7)
[000519f6] 486f 0020                 pea.l      32(a7)
[000519fa] 486f 0022                 pea.l      34(a7)
[000519fe] 486f 0024                 pea.l      36(a7)
[00051a02] 720b                      moveq.l    #11,d1
[00051a04] 302f 001a                 move.w     26(a7),d0
[00051a08] 4eb9 0007 f7ba            jsr        wind_get
[00051a0e] 4fef 0010                 lea.l      16(a7),a7
[00051a12] 6000 012e                 bra        $00051B42
[00051a16] 43ef 0020                 lea.l      32(a7),a1
[00051a1a] 41ef 0018                 lea.l      24(a7),a0
[00051a1e] 4eb9 0006 c662            jsr        intersect
[00051a24] 302f 001c                 move.w     28(a7),d0
[00051a28] 6700 00f8                 beq        $00051B22
[00051a2c] 302f 002a                 move.w     42(a7),d0
[00051a30] c07c 1000                 and.w      #$1000,d0
[00051a34] 6740                      beq.s      $00051A76
[00051a36] 302f 001a                 move.w     26(a7),d0
[00051a3a] d06f 001e                 add.w      30(a7),d0
[00051a3e] 3f40 0004                 move.w     d0,4(a7)
[00051a42] 206f 0014                 movea.l    20(a7),a0
[00051a46] 302f 0004                 move.w     4(a7),d0
[00051a4a] b068 0002                 cmp.w      2(a0),d0
[00051a4e] 6f24                      ble.s      $00051A74
[00051a50] 41f9 000e 0cca            lea.l      $000E0CCA,a0
[00051a56] 7001                      moveq.l    #1,d0
[00051a58] 2279 0010 ee4e            movea.l    ACSblk,a1
[00051a5e] 2269 03d6                 movea.l    982(a1),a1
[00051a62] 4e91                      jsr        (a1)
[00051a64] 206f 0014                 movea.l    20(a7),a0
[00051a68] 3028 0002                 move.w     2(a0),d0
[00051a6c] 906f 001a                 sub.w      26(a7),d0
[00051a70] 3f40 001e                 move.w     d0,30(a7)
[00051a74] 603a                      bra.s      $00051AB0
[00051a76] 302f 001a                 move.w     26(a7),d0
[00051a7a] 206f 0014                 movea.l    20(a7),a0
[00051a7e] 9068 0002                 sub.w      2(a0),d0
[00051a82] 3f40 0004                 move.w     d0,4(a7)
[00051a86] 302f 0004                 move.w     4(a7),d0
[00051a8a] 6a24                      bpl.s      $00051AB0
[00051a8c] 41f9 000e 0cd5            lea.l      $000E0CD5,a0
[00051a92] 7001                      moveq.l    #1,d0
[00051a94] 2279 0010 ee4e            movea.l    ACSblk,a1
[00051a9a] 2269 03d6                 movea.l    982(a1),a1
[00051a9e] 4e91                      jsr        (a1)
[00051aa0] 302f 0004                 move.w     4(a7),d0
[00051aa4] 916f 001a                 sub.w      d0,26(a7)
[00051aa8] 302f 0004                 move.w     4(a7),d0
[00051aac] d16f 001e                 add.w      d0,30(a7)
[00051ab0] 302f 001e                 move.w     30(a7),d0
[00051ab4] 6f6c                      ble.s      $00051B22
[00051ab6] 302f 0028                 move.w     40(a7),d0
[00051aba] b057                      cmp.w      (a7),d0
[00051abc] 662a                      bne.s      $00051AE8
[00051abe] 3f2f 001e                 move.w     30(a7),-(a7)
[00051ac2] 3f2f 001e                 move.w     30(a7),-(a7)
[00051ac6] 3f2f 001e                 move.w     30(a7),-(a7)
[00051aca] 2279 000e 692a            movea.l    _globl,a1
[00051ad0] 342f 001e                 move.w     30(a7),d2
[00051ad4] 7208                      moveq.l    #8,d1
[00051ad6] 302f 0008                 move.w     8(a7),d0
[00051ada] 206f 0016                 movea.l    22(a7),a0
[00051ade] 4eb9 0007 9c0c            jsr        mt_objc_draw
[00051ae4] 5c4f                      addq.w     #6,a7
[00051ae6] 603a                      bra.s      $00051B22
[00051ae8] 206f 000c                 movea.l    12(a7),a0
[00051aec] 3157 000a                 move.w     (a7),10(a0)
[00051af0] 7001                      moveq.l    #1,d0
[00051af2] 3f00                      move.w     d0,-(a7)
[00051af4] 3f2f 002a                 move.w     42(a7),-(a7)
[00051af8] 3f2f 0022                 move.w     34(a7),-(a7)
[00051afc] 3f2f 0022                 move.w     34(a7),-(a7)
[00051b00] 3f2f 0022                 move.w     34(a7),-(a7)
[00051b04] 2279 000e 692a            movea.l    _globl,a1
[00051b0a] 342f 0022                 move.w     34(a7),d2
[00051b0e] 4241                      clr.w      d1
[00051b10] 302f 000c                 move.w     12(a7),d0
[00051b14] 206f 001a                 movea.l    26(a7),a0
[00051b18] 4eb9 0007 9f2c            jsr        mt_objc_change
[00051b1e] 4fef 000a                 lea.l      10(a7),a7
[00051b22] 486f 001e                 pea.l      30(a7)
[00051b26] 486f 0020                 pea.l      32(a7)
[00051b2a] 486f 0022                 pea.l      34(a7)
[00051b2e] 486f 0024                 pea.l      36(a7)
[00051b32] 720c                      moveq.l    #12,d1
[00051b34] 302f 001a                 move.w     26(a7),d0
[00051b38] 4eb9 0007 f7ba            jsr        wind_get
[00051b3e] 4fef 0010                 lea.l      16(a7),a7
[00051b42] 302f 001c                 move.w     28(a7),d0
[00051b46] 6e00 fece                 bgt        $00051A16
[00051b4a] 2279 000e 692a            movea.l    _globl,a1
[00051b50] 91c8                      suba.l     a0,a0
[00051b52] 303c 0101                 move.w     #$0101,d0
[00051b56] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00051b5c] 206f 0010                 movea.l    16(a7),a0
[00051b60] 316f 0008 0010            move.w     8(a7),16(a0)
[00051b66] 206f 0010                 movea.l    16(a7),a0
[00051b6a] 316f 0006 0012            move.w     6(a7),18(a0)
[00051b70] 206f 000c                 movea.l    12(a7),a0
[00051b74] 316f 0028 000a            move.w     40(a7),10(a0)
[00051b7a] 4fef 0030                 lea.l      48(a7),a7
[00051b7e] 4e75                      rts
Awi_obredraw:
[00051b80] 2f0a                      move.l     a2,-(a7)
[00051b82] 4fef fff2                 lea.l      -14(a7),a7
[00051b86] 2f48 000a                 move.l     a0,10(a7)
[00051b8a] 3f40 0008                 move.w     d0,8(a7)
[00051b8e] 41f9 000e 0cc0            lea.l      $000E0CC0,a0
[00051b94] 43d7                      lea.l      (a7),a1
[00051b96] 22d8                      move.l     (a0)+,(a1)+
[00051b98] 22d8                      move.l     (a0)+,(a1)+
[00051b9a] 206f 000a                 movea.l    10(a7),a0
[00051b9e] 3028 0056                 move.w     86(a0),d0
[00051ba2] c07c 2800                 and.w      #$2800,d0
[00051ba6] 6714                      beq.s      $00051BBC
[00051ba8] 43d7                      lea.l      (a7),a1
[00051baa] 206f 000a                 movea.l    10(a7),a0
[00051bae] 246f 000a                 movea.l    10(a7),a2
[00051bb2] 246a 006a                 movea.l    106(a2),a2
[00051bb6] 4e92                      jsr        (a2)
[00051bb8] 6000 0084                 bra        $00051C3E
[00051bbc] 7008                      moveq.l    #8,d0
[00051bbe] 206f 000a                 movea.l    10(a7),a0
[00051bc2] c068 0056                 and.w      86(a0),d0
[00051bc6] 6718                      beq.s      $00051BE0
[00051bc8] 302f 0008                 move.w     8(a7),d0
[00051bcc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00051bd2] 2268 025c                 movea.l    604(a0),a1
[00051bd6] 41d7                      lea.l      (a7),a0
[00051bd8] 4eb9 0004 fe06            jsr        Aob_offset
[00051bde] 604e                      bra.s      $00051C2E
[00051be0] 302f 0008                 move.w     8(a7),d0
[00051be4] c07c 1000                 and.w      #$1000,d0
[00051be8] 671a                      beq.s      $00051C04
[00051bea] 302f 0008                 move.w     8(a7),d0
[00051bee] c07c 0fff                 and.w      #$0FFF,d0
[00051bf2] 206f 000a                 movea.l    10(a7),a0
[00051bf6] 2268 0018                 movea.l    24(a0),a1
[00051bfa] 41d7                      lea.l      (a7),a0
[00051bfc] 4eb9 0004 fe06            jsr        Aob_offset
[00051c02] 6014                      bra.s      $00051C18
[00051c04] 302f 0008                 move.w     8(a7),d0
[00051c08] 206f 000a                 movea.l    10(a7),a0
[00051c0c] 2268 0014                 movea.l    20(a0),a1
[00051c10] 41d7                      lea.l      (a7),a0
[00051c12] 4eb9 0004 fe06            jsr        Aob_offset
[00051c18] 206f 000a                 movea.l    10(a7),a0
[00051c1c] 3028 0034                 move.w     52(a0),d0
[00051c20] d157                      add.w      d0,(a7)
[00051c22] 206f 000a                 movea.l    10(a7),a0
[00051c26] 3028 0036                 move.w     54(a0),d0
[00051c2a] d16f 0002                 add.w      d0,2(a7)
[00051c2e] 43d7                      lea.l      (a7),a1
[00051c30] 206f 000a                 movea.l    10(a7),a0
[00051c34] 246f 000a                 movea.l    10(a7),a2
[00051c38] 246a 006a                 movea.l    106(a2),a2
[00051c3c] 4e92                      jsr        (a2)
[00051c3e] 4fef 000e                 lea.l      14(a7),a7
[00051c42] 245f                      movea.l    (a7)+,a2
[00051c44] 4e75                      rts
Awi_redraw:
[00051c46] 4fef ffcc                 lea.l      -52(a7),a7
[00051c4a] 2f48 0030                 move.l     a0,48(a7)
[00051c4e] 2f49 002c                 move.l     a1,44(a7)
[00051c52] 206f 0030                 movea.l    48(a7),a0
[00051c56] 3f68 0020 002a            move.w     32(a0),42(a7)
[00051c5c] 6b1a                      bmi.s      $00051C78
[00051c5e] 206f 0030                 movea.l    48(a7),a0
[00051c62] 2f68 0014 0008            move.l     20(a0),8(a7)
[00051c68] 670e                      beq.s      $00051C78
[00051c6a] 206f 0030                 movea.l    48(a7),a0
[00051c6e] 3028 0056                 move.w     86(a0),d0
[00051c72] c07c 2000                 and.w      #$2000,d0
[00051c76] 6704                      beq.s      $00051C7C
[00051c78] 6000 0476                 bra        $000520F0
[00051c7c] 206f 0030                 movea.l    48(a7),a0
[00051c80] 3028 0056                 move.w     86(a0),d0
[00051c84] c07c 0800                 and.w      #$0800,d0
[00051c88] 673e                      beq.s      $00051CC8
[00051c8a] 206f 002c                 movea.l    44(a7),a0
[00051c8e] 3028 0004                 move.w     4(a0),d0
[00051c92] 206f 0008                 movea.l    8(a7),a0
[00051c96] b068 0014                 cmp.w      20(a0),d0
[00051c9a] 6e12                      bgt.s      $00051CAE
[00051c9c] 206f 002c                 movea.l    44(a7),a0
[00051ca0] 3028 0006                 move.w     6(a0),d0
[00051ca4] 206f 0008                 movea.l    8(a7),a0
[00051ca8] b068 0016                 cmp.w      22(a0),d0
[00051cac] 6f1a                      ble.s      $00051CC8
[00051cae] 206f 0030                 movea.l    48(a7),a0
[00051cb2] 4eb9 0005 9c6c            jsr        Awi_uniconify
[00051cb8] 4eb9 0004 b086            jsr        Aev_mess
[00051cbe] 206f 0030                 movea.l    48(a7),a0
[00051cc2] 2f68 0014 0008            move.l     20(a0),8(a7)
[00051cc8] 206f 0030                 movea.l    48(a7),a0
[00051ccc] 3028 0056                 move.w     86(a0),d0
[00051cd0] c07c 0800                 and.w      #$0800,d0
[00051cd4] 6700 0124                 beq        $00051DFA
[00051cd8] 206f 0030                 movea.l    48(a7),a0
[00051cdc] 3028 0020                 move.w     32(a0),d0
[00051ce0] e548                      lsl.w      #2,d0
[00051ce2] 41f9 0011 4326            lea.l      _ACSv_wiicons,a0
[00051ce8] 2f70 0000 0008            move.l     0(a0,d0.w),8(a7)
[00051cee] 6700 010a                 beq        $00051DFA
[00051cf2] 206f 002c                 movea.l    44(a7),a0
[00051cf6] 4868 0006                 pea.l      6(a0)
[00051cfa] 206f 0030                 movea.l    48(a7),a0
[00051cfe] 4868 0004                 pea.l      4(a0)
[00051d02] 206f 0034                 movea.l    52(a7),a0
[00051d06] 4868 0002                 pea.l      2(a0)
[00051d0a] 2f2f 0038                 move.l     56(a7),-(a7)
[00051d0e] 7204                      moveq.l    #4,d1
[00051d10] 206f 0040                 movea.l    64(a7),a0
[00051d14] 3028 0020                 move.w     32(a0),d0
[00051d18] 4eb9 0007 f7ba            jsr        wind_get
[00051d1e] 4fef 0010                 lea.l      16(a7),a7
[00051d22] 206f 002c                 movea.l    44(a7),a0
[00051d26] 226f 0008                 movea.l    8(a7),a1
[00051d2a] 3350 0010                 move.w     (a0),16(a1)
[00051d2e] 206f 002c                 movea.l    44(a7),a0
[00051d32] 226f 0008                 movea.l    8(a7),a1
[00051d36] 3368 0002 0012            move.w     2(a0),18(a1)
[00051d3c] 2279 000e 692a            movea.l    _globl,a1
[00051d42] 91c8                      suba.l     a0,a0
[00051d44] 303c 0100                 move.w     #$0100,d0
[00051d48] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00051d4e] 486f 0016                 pea.l      22(a7)
[00051d52] 486f 0018                 pea.l      24(a7)
[00051d56] 486f 001a                 pea.l      26(a7)
[00051d5a] 486f 001c                 pea.l      28(a7)
[00051d5e] 720b                      moveq.l    #11,d1
[00051d60] 206f 0040                 movea.l    64(a7),a0
[00051d64] 3028 0020                 move.w     32(a0),d0
[00051d68] 4eb9 0007 f7ba            jsr        wind_get
[00051d6e] 4fef 0010                 lea.l      16(a7),a7
[00051d72] 6064                      bra.s      $00051DD8
[00051d74] 226f 002c                 movea.l    44(a7),a1
[00051d78] 41ef 0010                 lea.l      16(a7),a0
[00051d7c] 4eb9 0006 c662            jsr        intersect
[00051d82] 302f 0014                 move.w     20(a7),d0
[00051d86] 6606                      bne.s      $00051D8E
[00051d88] 302f 0016                 move.w     22(a7),d0
[00051d8c] 6726                      beq.s      $00051DB4
[00051d8e] 3f2f 0016                 move.w     22(a7),-(a7)
[00051d92] 3f2f 0016                 move.w     22(a7),-(a7)
[00051d96] 3f2f 0016                 move.w     22(a7),-(a7)
[00051d9a] 2279 000e 692a            movea.l    _globl,a1
[00051da0] 342f 0016                 move.w     22(a7),d2
[00051da4] 7206                      moveq.l    #6,d1
[00051da6] 4240                      clr.w      d0
[00051da8] 206f 000e                 movea.l    14(a7),a0
[00051dac] 4eb9 0007 9c0c            jsr        mt_objc_draw
[00051db2] 5c4f                      addq.w     #6,a7
[00051db4] 486f 0016                 pea.l      22(a7)
[00051db8] 486f 0018                 pea.l      24(a7)
[00051dbc] 486f 001a                 pea.l      26(a7)
[00051dc0] 486f 001c                 pea.l      28(a7)
[00051dc4] 720c                      moveq.l    #12,d1
[00051dc6] 206f 0040                 movea.l    64(a7),a0
[00051dca] 3028 0020                 move.w     32(a0),d0
[00051dce] 4eb9 0007 f7ba            jsr        wind_get
[00051dd4] 4fef 0010                 lea.l      16(a7),a7
[00051dd8] 302f 0014                 move.w     20(a7),d0
[00051ddc] 6706                      beq.s      $00051DE4
[00051dde] 302f 0016                 move.w     22(a7),d0
[00051de2] 6690                      bne.s      $00051D74
[00051de4] 2279 000e 692a            movea.l    _globl,a1
[00051dea] 91c8                      suba.l     a0,a0
[00051dec] 303c 0101                 move.w     #$0101,d0
[00051df0] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00051df6] 6000 02f8                 bra        $000520F0
[00051dfa] 7010                      moveq.l    #16,d0
[00051dfc] 206f 0030                 movea.l    48(a7),a0
[00051e00] c068 0056                 and.w      86(a0),d0
[00051e04] 6716                      beq.s      $00051E1C
[00051e06] 206f 0030                 movea.l    48(a7),a0
[00051e0a] 41e8 0024                 lea.l      36(a0),a0
[00051e0e] 2f48 002c                 move.l     a0,44(a7)
[00051e12] 206f 0030                 movea.l    48(a7),a0
[00051e16] 0268 ffef 0056            andi.w     #$FFEF,86(a0)
[00051e1c] 206f 0008                 movea.l    8(a7),a0
[00051e20] 3f68 0010 0024            move.w     16(a0),36(a7)
[00051e26] 206f 0008                 movea.l    8(a7),a0
[00051e2a] 3f68 0012 0022            move.w     18(a0),34(a7)
[00051e30] 206f 0030                 movea.l    48(a7),a0
[00051e34] 41e8 0034                 lea.l      52(a0),a0
[00051e38] 2f48 000c                 move.l     a0,12(a7)
[00051e3c] 206f 000c                 movea.l    12(a7),a0
[00051e40] 3010                      move.w     (a0),d0
[00051e42] 206f 0008                 movea.l    8(a7),a0
[00051e46] d168 0010                 add.w      d0,16(a0)
[00051e4a] 206f 000c                 movea.l    12(a7),a0
[00051e4e] 3028 0002                 move.w     2(a0),d0
[00051e52] 206f 0008                 movea.l    8(a7),a0
[00051e56] d168 0012                 add.w      d0,18(a0)
[00051e5a] 2279 000e 692a            movea.l    _globl,a1
[00051e60] 91c8                      suba.l     a0,a0
[00051e62] 303c 0100                 move.w     #$0100,d0
[00051e66] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00051e6c] 486f 0016                 pea.l      22(a7)
[00051e70] 486f 0018                 pea.l      24(a7)
[00051e74] 486f 001a                 pea.l      26(a7)
[00051e78] 486f 001c                 pea.l      28(a7)
[00051e7c] 720b                      moveq.l    #11,d1
[00051e7e] 302f 003a                 move.w     58(a7),d0
[00051e82] 4eb9 0007 f7ba            jsr        wind_get
[00051e88] 4fef 0010                 lea.l      16(a7),a7
[00051e8c] 6000 0226                 bra        $000520B4
[00051e90] 226f 002c                 movea.l    44(a7),a1
[00051e94] 41ef 0010                 lea.l      16(a7),a0
[00051e98] 4eb9 0006 c662            jsr        intersect
[00051e9e] 302f 0014                 move.w     20(a7),d0
[00051ea2] 6608                      bne.s      $00051EAC
[00051ea4] 302f 0016                 move.w     22(a7),d0
[00051ea8] 6700 01ea                 beq        $00052094
[00051eac] 302f 0012                 move.w     18(a7),d0
[00051eb0] 206f 000c                 movea.l    12(a7),a0
[00051eb4] 9068 0002                 sub.w      2(a0),d0
[00051eb8] 3f40 0020                 move.w     d0,32(a7)
[00051ebc] 302f 0020                 move.w     32(a7),d0
[00051ec0] 6a00 01a6                 bpl        $00052068
[00051ec4] 206f 0030                 movea.l    48(a7),a0
[00051ec8] 2f68 005e 0004            move.l     94(a0),4(a7)
[00051ece] 6700 00c6                 beq        $00051F96
[00051ed2] 206f 0004                 movea.l    4(a7),a0
[00051ed6] 3228 0002                 move.w     2(a0),d1
[00051eda] 48c1                      ext.l      d1
[00051edc] 2001                      move.l     d1,d0
[00051ede] d080                      add.l      d0,d0
[00051ee0] d081                      add.l      d1,d0
[00051ee2] e788                      lsl.l      #3,d0
[00051ee4] 206f 0004                 movea.l    4(a7),a0
[00051ee8] 3f70 0802 0026            move.w     2(a0,d0.l),38(a7)
[00051eee] 322f 0026                 move.w     38(a7),d1
[00051ef2] 48c1                      ext.l      d1
[00051ef4] 2001                      move.l     d1,d0
[00051ef6] d080                      add.l      d0,d0
[00051ef8] d081                      add.l      d1,d0
[00051efa] e788                      lsl.l      #3,d0
[00051efc] 206f 0004                 movea.l    4(a7),a0
[00051f00] 0c70 0003 0802            cmpi.w     #$0003,2(a0,d0.l)
[00051f06] 6662                      bne.s      $00051F6A
[00051f08] 206f 0004                 movea.l    4(a7),a0
[00051f0c] 322f 0026                 move.w     38(a7),d1
[00051f10] 48c1                      ext.l      d1
[00051f12] 2001                      move.l     d1,d0
[00051f14] d080                      add.l      d0,d0
[00051f16] d081                      add.l      d1,d0
[00051f18] e788                      lsl.l      #3,d0
[00051f1a] 226f 0004                 movea.l    4(a7),a1
[00051f1e] 33a8 0048 0802            move.w     72(a0),2(a1,d0.l)
[00051f24] 206f 0004                 movea.l    4(a7),a0
[00051f28] 3f68 0004 0028            move.w     4(a0),40(a7)
[00051f2e] 342f 0028                 move.w     40(a7),d2
[00051f32] 48c2                      ext.l      d2
[00051f34] 2202                      move.l     d2,d1
[00051f36] d281                      add.l      d1,d1
[00051f38] d282                      add.l      d2,d1
[00051f3a] e789                      lsl.l      #3,d1
[00051f3c] 206f 0004                 movea.l    4(a7),a0
[00051f40] 3230 1802                 move.w     2(a0,d1.l),d1
[00051f44] 48c1                      ext.l      d1
[00051f46] 2001                      move.l     d1,d0
[00051f48] d080                      add.l      d0,d0
[00051f4a] d081                      add.l      d1,d0
[00051f4c] e788                      lsl.l      #3,d0
[00051f4e] 206f 0004                 movea.l    4(a7),a0
[00051f52] 342f 0028                 move.w     40(a7),d2
[00051f56] 48c2                      ext.l      d2
[00051f58] 2202                      move.l     d2,d1
[00051f5a] d281                      add.l      d1,d1
[00051f5c] d282                      add.l      d2,d1
[00051f5e] e789                      lsl.l      #3,d1
[00051f60] 226f 0004                 movea.l    4(a7),a1
[00051f64] 33b0 0800 1802            move.w     0(a0,d0.l),2(a1,d1.l)
[00051f6a] 3f2f 0016                 move.w     22(a7),-(a7)
[00051f6e] 3f2f 0016                 move.w     22(a7),-(a7)
[00051f72] 3f2f 0016                 move.w     22(a7),-(a7)
[00051f76] 2279 000e 692a            movea.l    _globl,a1
[00051f7c] 342f 0016                 move.w     22(a7),d2
[00051f80] 7206                      moveq.l    #6,d1
[00051f82] 206f 000a                 movea.l    10(a7),a0
[00051f86] 3028 0002                 move.w     2(a0),d0
[00051f8a] 206f 000a                 movea.l    10(a7),a0
[00051f8e] 4eb9 0007 9c0c            jsr        mt_objc_draw
[00051f94] 5c4f                      addq.w     #6,a7
[00051f96] 206f 0030                 movea.l    48(a7),a0
[00051f9a] 2ea8 0018                 move.l     24(a0),(a7)
[00051f9e] 6700 00b8                 beq        $00052058
[00051fa2] 2057                      movea.l    (a7),a0
[00051fa4] 3028 0012                 move.w     18(a0),d0
[00051fa8] 206f 000c                 movea.l    12(a7),a0
[00051fac] d068 0002                 add.w      2(a0),d0
[00051fb0] 3f40 001a                 move.w     d0,26(a7)
[00051fb4] 302f 001a                 move.w     26(a7),d0
[00051fb8] b06f 0012                 cmp.w      18(a7),d0
[00051fbc] 6c06                      bge.s      $00051FC4
[00051fbe] 3f6f 0012 001a            move.w     18(a7),26(a7)
[00051fc4] 302f 0012                 move.w     18(a7),d0
[00051fc8] d06f 0016                 add.w      22(a7),d0
[00051fcc] 3f40 0018                 move.w     d0,24(a7)
[00051fd0] 206f 000c                 movea.l    12(a7),a0
[00051fd4] 302f 0018                 move.w     24(a7),d0
[00051fd8] b068 0002                 cmp.w      2(a0),d0
[00051fdc] 6f0a                      ble.s      $00051FE8
[00051fde] 206f 000c                 movea.l    12(a7),a0
[00051fe2] 3f68 0002 0018            move.w     2(a0),24(a7)
[00051fe8] 302f 0018                 move.w     24(a7),d0
[00051fec] b06f 001a                 cmp.w      26(a7),d0
[00051ff0] 6f66                      ble.s      $00052058
[00051ff2] 2057                      movea.l    (a7),a0
[00051ff4] 3f68 0010 001e            move.w     16(a0),30(a7)
[00051ffa] 2057                      movea.l    (a7),a0
[00051ffc] 3f68 0012 001c            move.w     18(a0),28(a7)
[00052002] 206f 000c                 movea.l    12(a7),a0
[00052006] 3010                      move.w     (a0),d0
[00052008] 2057                      movea.l    (a7),a0
[0005200a] d168 0010                 add.w      d0,16(a0)
[0005200e] 206f 000c                 movea.l    12(a7),a0
[00052012] 3028 0002                 move.w     2(a0),d0
[00052016] 2057                      movea.l    (a7),a0
[00052018] d168 0012                 add.w      d0,18(a0)
[0005201c] 302f 0018                 move.w     24(a7),d0
[00052020] 906f 001a                 sub.w      26(a7),d0
[00052024] 3f00                      move.w     d0,-(a7)
[00052026] 3f2f 0016                 move.w     22(a7),-(a7)
[0005202a] 3f2f 001e                 move.w     30(a7),-(a7)
[0005202e] 2279 000e 692a            movea.l    _globl,a1
[00052034] 342f 0016                 move.w     22(a7),d2
[00052038] 7206                      moveq.l    #6,d1
[0005203a] 4240                      clr.w      d0
[0005203c] 206f 0006                 movea.l    6(a7),a0
[00052040] 4eb9 0007 9c0c            jsr        mt_objc_draw
[00052046] 5c4f                      addq.w     #6,a7
[00052048] 2057                      movea.l    (a7),a0
[0005204a] 316f 001e 0010            move.w     30(a7),16(a0)
[00052050] 2057                      movea.l    (a7),a0
[00052052] 316f 001c 0012            move.w     28(a7),18(a0)
[00052058] 302f 0020                 move.w     32(a7),d0
[0005205c] 916f 0012                 sub.w      d0,18(a7)
[00052060] 302f 0020                 move.w     32(a7),d0
[00052064] d16f 0016                 add.w      d0,22(a7)
[00052068] 302f 0016                 move.w     22(a7),d0
[0005206c] 6f26                      ble.s      $00052094
[0005206e] 3f2f 0016                 move.w     22(a7),-(a7)
[00052072] 3f2f 0016                 move.w     22(a7),-(a7)
[00052076] 3f2f 0016                 move.w     22(a7),-(a7)
[0005207a] 2279 000e 692a            movea.l    _globl,a1
[00052080] 342f 0016                 move.w     22(a7),d2
[00052084] 7206                      moveq.l    #6,d1
[00052086] 4240                      clr.w      d0
[00052088] 206f 000e                 movea.l    14(a7),a0
[0005208c] 4eb9 0007 9c0c            jsr        mt_objc_draw
[00052092] 5c4f                      addq.w     #6,a7
[00052094] 486f 0016                 pea.l      22(a7)
[00052098] 486f 0018                 pea.l      24(a7)
[0005209c] 486f 001a                 pea.l      26(a7)
[000520a0] 486f 001c                 pea.l      28(a7)
[000520a4] 720c                      moveq.l    #12,d1
[000520a6] 302f 003a                 move.w     58(a7),d0
[000520aa] 4eb9 0007 f7ba            jsr        wind_get
[000520b0] 4fef 0010                 lea.l      16(a7),a7
[000520b4] 302f 0014                 move.w     20(a7),d0
[000520b8] 6708                      beq.s      $000520C2
[000520ba] 302f 0016                 move.w     22(a7),d0
[000520be] 6600 fdd0                 bne        $00051E90
[000520c2] 2279 000e 692a            movea.l    _globl,a1
[000520c8] 91c8                      suba.l     a0,a0
[000520ca] 303c 0101                 move.w     #$0101,d0
[000520ce] 4eb9 0007 abe4            jsr        mt_graf_mouse
[000520d4] 206f 0030                 movea.l    48(a7),a0
[000520d8] 2068 0014                 movea.l    20(a0),a0
[000520dc] 316f 0024 0010            move.w     36(a7),16(a0)
[000520e2] 206f 0030                 movea.l    48(a7),a0
[000520e6] 2068 0014                 movea.l    20(a0),a0
[000520ea] 316f 0022 0012            move.w     34(a7),18(a0)
[000520f0] 4fef 0034                 lea.l      52(a7),a7
[000520f4] 4e75                      rts
next_arrow:
[000520f6] 2f0a                      move.l     a2,-(a7)
[000520f8] 4fef ffee                 lea.l      -18(a7),a7
[000520fc] 2f39 000e 692a            move.l     _globl,-(a7)
[00052102] 486f 0014                 pea.l      20(a7)
[00052106] 486f 0018                 pea.l      24(a7)
[0005210a] 486f 001c                 pea.l      28(a7)
[0005210e] 486f 0020                 pea.l      32(a7)
[00052112] 486f 0024                 pea.l      36(a7)
[00052116] 7005                      moveq.l    #5,d0
[00052118] 2f00                      move.l     d0,-(a7)
[0005211a] 4267                      clr.w      -(a7)
[0005211c] 4267                      clr.w      -(a7)
[0005211e] 4267                      clr.w      -(a7)
[00052120] 4267                      clr.w      -(a7)
[00052122] 4267                      clr.w      -(a7)
[00052124] 4267                      clr.w      -(a7)
[00052126] 4267                      clr.w      -(a7)
[00052128] 4267                      clr.w      -(a7)
[0005212a] 4267                      clr.w      -(a7)
[0005212c] 4267                      clr.w      -(a7)
[0005212e] 4267                      clr.w      -(a7)
[00052130] 43ef 0042                 lea.l      66(a7),a1
[00052134] 41ef 0032                 lea.l      50(a7),a0
[00052138] 4242                      clr.w      d2
[0005213a] 4241                      clr.w      d1
[0005213c] 7030                      moveq.l    #48,d0 MU_TIMER | MU_MESAG
[0005213e] 4eb9 0007 9240            jsr        mt_evnt_multi
[00052144] 4fef 0032                 lea.l      50(a7),a7
[00052148] c07c 0010                 and.w      #$0010,d0
[0005214c] 6724                      beq.s      $00052172
[0005214e] 0c57 0018                 cmpi.w     #$0018,(a7)
[00052152] 6606                      bne.s      $0005215A
[00052154] 7001                      moveq.l    #1,d0
[00052156] 601c                      bra.s      $00052174
[00052158] 6018                      bra.s      $00052172
[0005215a] 2279 000e 692a            movea.l    _globl,a1
[00052160] 41d7                      lea.l      (a7),a0
[00052162] 7210                      moveq.l    #16,d1
[00052164] 2479 0010 ee4e            movea.l    ACSblk,a2
[0005216a] 3012                      move.w     (a2),d0
[0005216c] 4eb9 0007 8ae8            jsr        mt_appl_write
[00052172] 4240                      clr.w      d0
[00052174] 4fef 0012                 lea.l      18(a7),a7
[00052178] 245f                      movea.l    (a7)+,a2
[0005217a] 4e75                      rts
Awi_arrowed:
[0005217c] 4fef ffe0                 lea.l      -32(a7),a7
[00052180] 2f48 001c                 move.l     a0,28(a7)
[00052184] 3f40 001a                 move.w     d0,26(a7)
[00052188] 3f41 0018                 move.w     d1,24(a7)
[0005218c] 206f 001c                 movea.l    28(a7),a0
[00052190] 3028 0020                 move.w     32(a0),d0
[00052194] 6e04                      bgt.s      $0005219A
[00052196] 6000 0316                 bra        $000524AE
[0005219a] 206f 001c                 movea.l    28(a7),a0
[0005219e] 3028 0048                 move.w     72(a0),d0
[000521a2] 807c ff00                 or.w       #$FF00,d0
[000521a6] 3f40 000c                 move.w     d0,12(a7)
[000521aa] 206f 001c                 movea.l    28(a7),a0
[000521ae] 3028 0048                 move.w     72(a0),d0
[000521b2] e040                      asr.w      #8,d0
[000521b4] 3f40 000a                 move.w     d0,10(a7)
[000521b8] 206f 001c                 movea.l    28(a7),a0
[000521bc] 2f68 0014 0014            move.l     20(a0),20(a7)
[000521c2] 302f 000c                 move.w     12(a7),d0
[000521c6] 4640                      not.w      d0
[000521c8] 206f 0014                 movea.l    20(a7),a0
[000521cc] d168 0014                 add.w      d0,20(a0)
[000521d0] 302f 000c                 move.w     12(a7),d0
[000521d4] 206f 0014                 movea.l    20(a7),a0
[000521d8] c168 0014                 and.w      d0,20(a0)
[000521dc] 302f 000a                 move.w     10(a7),d0
[000521e0] 4640                      not.w      d0
[000521e2] 206f 0014                 movea.l    20(a7),a0
[000521e6] d168 0016                 add.w      d0,22(a0)
[000521ea] 302f 000a                 move.w     10(a7),d0
[000521ee] 206f 0014                 movea.l    20(a7),a0
[000521f2] c168 0016                 and.w      d0,22(a0)
[000521f6] 302f 000c                 move.w     12(a7),d0
[000521fa] 4440                      neg.w      d0
[000521fc] 3f40 0008                 move.w     d0,8(a7)
[00052200] 302f 000a                 move.w     10(a7),d0
[00052204] 4440                      neg.w      d0
[00052206] 3f40 0006                 move.w     d0,6(a7)
[0005220a] 206f 001c                 movea.l    28(a7),a0
[0005220e] 3028 0038                 move.w     56(a0),d0
[00052212] 206f 0014                 movea.l    20(a7),a0
[00052216] 9068 0014                 sub.w      20(a0),d0
[0005221a] 3f40 0002                 move.w     d0,2(a7)
[0005221e] 206f 001c                 movea.l    28(a7),a0
[00052222] 3028 003a                 move.w     58(a0),d0
[00052226] 206f 0014                 movea.l    20(a7),a0
[0005222a] 9068 0016                 sub.w      22(a0),d0
[0005222e] 3e80                      move.w     d0,(a7)
[00052230] 302f 001a                 move.w     26(a7),d0
[00052234] b07c 0007                 cmp.w      #$0007,d0
[00052238] 6262                      bhi.s      $0005229C
[0005223a] d040                      add.w      d0,d0
[0005223c] 303b 0006                 move.w     $00052244(pc,d0.w),d0
[00052240] 4efb 0002                 jmp        $00052244(pc,d0.w)
J41:
[00052244] 0010                      dc.w $0010   ; $00052254-$00052244
[00052246] 0010                      dc.w $0010   ; $00052254-$00052244
[00052248] 0038                      dc.w $0038   ; $0005227c-$00052244
[0005224a] 0038                      dc.w $0038   ; $0005227c-$00052244
[0005224c] 0010                      dc.w $0010   ; $00052254-$00052244
[0005224e] 0010                      dc.w $0010   ; $00052254-$00052244
[00052250] 0018                      dc.w $0018   ; $0005225c-$00052244
[00052252] 0018                      dc.w $0018   ; $0005225c-$00052244
[00052254] 3f7c 0001 0004            move.w     #$0001,4(a7)
[0005225a] 6040                      bra.s      $0005229C
[0005225c] 203c 0000 03e8            move.l     #$000003E8,d0
[00052262] 206f 001c                 movea.l    28(a7),a0
[00052266] 3228 0040                 move.w     64(a0),d1
[0005226a] 48c1                      ext.l      d1
[0005226c] 4eb9 0008 3cf6            jsr        _ldiv
[00052272] e880                      asr.l      #4,d0
[00052274] 5440                      addq.w     #2,d0
[00052276] 3f40 0004                 move.w     d0,4(a7)
[0005227a] 6020                      bra.s      $0005229C
[0005227c] 203c 0000 03e8            move.l     #$000003E8,d0
[00052282] 206f 001c                 movea.l    28(a7),a0
[00052286] 3228 0042                 move.w     66(a0),d1
[0005228a] 48c1                      ext.l      d1
[0005228c] 4eb9 0008 3cf6            jsr        _ldiv
[00052292] e880                      asr.l      #4,d0
[00052294] 5440                      addq.w     #2,d0
[00052296] 3f40 0004                 move.w     d0,4(a7)
[0005229a] 4e71                      nop
[0005229c] 3f6f 0004 0012            move.w     4(a7),18(a7)
[000522a2] 206f 0014                 movea.l    20(a7),a0
[000522a6] 3f68 0010 0010            move.w     16(a0),16(a7)
[000522ac] 206f 0014                 movea.l    20(a7),a0
[000522b0] 3f68 0012 000e            move.w     18(a0),14(a7)
[000522b6] 302f 001a                 move.w     26(a7),d0
[000522ba] b07c 0007                 cmp.w      #$0007,d0
[000522be] 6200 0120                 bhi        $000523E0
[000522c2] d040                      add.w      d0,d0
[000522c4] 303b 0006                 move.w     $000522CC(pc,d0.w),d0
[000522c8] 4efb 0002                 jmp        $000522CC(pc,d0.w)
J42:
[000522cc] 0010                      dc.w $0010   ; $000522dc-$000522cc
[000522ce] 0032                      dc.w $0032   ; $000522fe-$000522cc
[000522d0] 0056                      dc.w $0056   ; $00052322-$000522cc
[000522d2] 0074                      dc.w $0074   ; $00052340-$000522cc
[000522d4] 0094                      dc.w $0094   ; $00052360-$000522cc
[000522d6] 00b4                      dc.w $00b4   ; $00052380-$000522cc
[000522d8] 00d8                      dc.w $00d8   ; $000523a4-$000522cc
[000522da] 00f4                      dc.w $00f4   ; $000523c0-$000522cc
[000522dc] 302f 000e                 move.w     14(a7),d0
[000522e0] 6604                      bne.s      $000522E6
[000522e2] 6000 01b6                 bra        $0005249A
[000522e6] 206f 001c                 movea.l    28(a7),a0
[000522ea] 3028 003a                 move.w     58(a0),d0
[000522ee] c1ef 0018                 muls.w     24(a7),d0
[000522f2] 206f 0014                 movea.l    20(a7),a0
[000522f6] d168 0012                 add.w      d0,18(a0)
[000522fa] 6000 00e4                 bra        $000523E0
[000522fe] 302f 000e                 move.w     14(a7),d0
[00052302] b057                      cmp.w      (a7),d0
[00052304] 6604                      bne.s      $0005230A
[00052306] 6000 0192                 bra        $0005249A
[0005230a] 206f 001c                 movea.l    28(a7),a0
[0005230e] 3028 003a                 move.w     58(a0),d0
[00052312] c1ef 0018                 muls.w     24(a7),d0
[00052316] 206f 0014                 movea.l    20(a7),a0
[0005231a] 9168 0012                 sub.w      d0,18(a0)
[0005231e] 6000 00c0                 bra        $000523E0
[00052322] 302f 000e                 move.w     14(a7),d0
[00052326] 6604                      bne.s      $0005232C
[00052328] 6000 0170                 bra        $0005249A
[0005232c] 302f 0006                 move.w     6(a7),d0
[00052330] c1ef 0018                 muls.w     24(a7),d0
[00052334] 206f 0014                 movea.l    20(a7),a0
[00052338] d168 0012                 add.w      d0,18(a0)
[0005233c] 6000 00a2                 bra        $000523E0
[00052340] 302f 000e                 move.w     14(a7),d0
[00052344] b057                      cmp.w      (a7),d0
[00052346] 6604                      bne.s      $0005234C
[00052348] 6000 0150                 bra        $0005249A
[0005234c] 302f 0006                 move.w     6(a7),d0
[00052350] c1ef 0018                 muls.w     24(a7),d0
[00052354] 206f 0014                 movea.l    20(a7),a0
[00052358] 9168 0012                 sub.w      d0,18(a0)
[0005235c] 6000 0082                 bra        $000523E0
[00052360] 302f 0010                 move.w     16(a7),d0
[00052364] 6604                      bne.s      $0005236A
[00052366] 6000 0132                 bra        $0005249A
[0005236a] 206f 001c                 movea.l    28(a7),a0
[0005236e] 3028 0038                 move.w     56(a0),d0
[00052372] c1ef 0018                 muls.w     24(a7),d0
[00052376] 206f 0014                 movea.l    20(a7),a0
[0005237a] d168 0010                 add.w      d0,16(a0)
[0005237e] 6060                      bra.s      $000523E0
[00052380] 302f 0010                 move.w     16(a7),d0
[00052384] b06f 0002                 cmp.w      2(a7),d0
[00052388] 6604                      bne.s      $0005238E
[0005238a] 6000 010e                 bra        $0005249A
[0005238e] 206f 001c                 movea.l    28(a7),a0
[00052392] 3028 0038                 move.w     56(a0),d0
[00052396] c1ef 0018                 muls.w     24(a7),d0
[0005239a] 206f 0014                 movea.l    20(a7),a0
[0005239e] 9168 0010                 sub.w      d0,16(a0)
[000523a2] 603c                      bra.s      $000523E0
[000523a4] 302f 0010                 move.w     16(a7),d0
[000523a8] 6604                      bne.s      $000523AE
[000523aa] 6000 00ee                 bra        $0005249A
[000523ae] 302f 0008                 move.w     8(a7),d0
[000523b2] c1ef 0018                 muls.w     24(a7),d0
[000523b6] 206f 0014                 movea.l    20(a7),a0
[000523ba] d168 0010                 add.w      d0,16(a0)
[000523be] 6020                      bra.s      $000523E0
[000523c0] 302f 0010                 move.w     16(a7),d0
[000523c4] b06f 0002                 cmp.w      2(a7),d0
[000523c8] 6604                      bne.s      $000523CE
[000523ca] 6000 00ce                 bra        $0005249A
[000523ce] 302f 0008                 move.w     8(a7),d0
[000523d2] c1ef 0018                 muls.w     24(a7),d0
[000523d6] 206f 0014                 movea.l    20(a7),a0
[000523da] 9168 0010                 sub.w      d0,16(a0)
[000523de] 4e71                      nop
[000523e0] 206f 0014                 movea.l    20(a7),a0
[000523e4] 3028 0010                 move.w     16(a0),d0
[000523e8] 6f08                      ble.s      $000523F2
[000523ea] 206f 0014                 movea.l    20(a7),a0
[000523ee] 4268 0010                 clr.w      16(a0)
[000523f2] 206f 0014                 movea.l    20(a7),a0
[000523f6] 3028 0010                 move.w     16(a0),d0
[000523fa] b06f 0002                 cmp.w      2(a7),d0
[000523fe] 6c0a                      bge.s      $0005240A
[00052400] 206f 0014                 movea.l    20(a7),a0
[00052404] 316f 0002 0010            move.w     2(a7),16(a0)
[0005240a] 206f 0014                 movea.l    20(a7),a0
[0005240e] 3028 0012                 move.w     18(a0),d0
[00052412] 6f08                      ble.s      $0005241C
[00052414] 206f 0014                 movea.l    20(a7),a0
[00052418] 4268 0012                 clr.w      18(a0)
[0005241c] 206f 0014                 movea.l    20(a7),a0
[00052420] 3028 0012                 move.w     18(a0),d0
[00052424] b057                      cmp.w      (a7),d0
[00052426] 6c08                      bge.s      $00052430
[00052428] 206f 0014                 movea.l    20(a7),a0
[0005242c] 3157 0012                 move.w     (a7),18(a0)
[00052430] 206f 0014                 movea.l    20(a7),a0
[00052434] 3028 0010                 move.w     16(a0),d0
[00052438] 4440                      neg.w      d0
[0005243a] 322f 0008                 move.w     8(a7),d1
[0005243e] 4441                      neg.w      d1
[00052440] c041                      and.w      d1,d0
[00052442] 4440                      neg.w      d0
[00052444] 206f 0014                 movea.l    20(a7),a0
[00052448] 3140 0010                 move.w     d0,16(a0)
[0005244c] 206f 0014                 movea.l    20(a7),a0
[00052450] 3028 0012                 move.w     18(a0),d0
[00052454] 4440                      neg.w      d0
[00052456] 322f 0006                 move.w     6(a7),d1
[0005245a] 4441                      neg.w      d1
[0005245c] c041                      and.w      d1,d0
[0005245e] 4440                      neg.w      d0
[00052460] 206f 0014                 movea.l    20(a7),a0
[00052464] 3140 0012                 move.w     d0,18(a0)
[00052468] 536f 0012                 subq.w     #1,18(a7)
[0005246c] 6610                      bne.s      $0005247E
[0005246e] 206f 001c                 movea.l    28(a7),a0
[00052472] 4eb9 0005 8ddc            jsr        Awi_cleanup
[00052478] 3f6f 0004 0012            move.w     4(a7),18(a7)
[0005247e] 322f 000e                 move.w     14(a7),d1
[00052482] 302f 0010                 move.w     16(a7),d0
[00052486] 206f 001c                 movea.l    28(a7),a0
[0005248a] 4eb9 0005 44c4            jsr        Awi_scroll
[00052490] 6100 fc64                 bsr        next_arrow
[00052494] 4a40                      tst.w      d0
[00052496] 6600 fe0a                 bne        $000522A2
[0005249a] 302f 0012                 move.w     18(a7),d0
[0005249e] b06f 0004                 cmp.w      4(a7),d0
[000524a2] 670a                      beq.s      $000524AE
[000524a4] 206f 001c                 movea.l    28(a7),a0
[000524a8] 4eb9 0005 8ddc            jsr        Awi_cleanup
[000524ae] 4fef 0020                 lea.l      32(a7),a7
[000524b2] 4e75                      rts
Awi_hslid:
[000524b4] 4fef fff4                 lea.l      -12(a7),a7
[000524b8] 2f48 0008                 move.l     a0,8(a7)
[000524bc] 3f40 0006                 move.w     d0,6(a7)
[000524c0] 206f 0008                 movea.l    8(a7),a0
[000524c4] 3028 0020                 move.w     32(a0),d0
[000524c8] 6e04                      bgt.s      $000524CE
[000524ca] 6000 008c                 bra        $00052558
[000524ce] 206f 0008                 movea.l    8(a7),a0
[000524d2] 2068 0014                 movea.l    20(a0),a0
[000524d6] 3f68 0010 0004            move.w     16(a0),4(a7)
[000524dc] 302f 0006                 move.w     6(a7),d0
[000524e0] 48c0                      ext.l      d0
[000524e2] 206f 0008                 movea.l    8(a7),a0
[000524e6] 2068 0014                 movea.l    20(a0),a0
[000524ea] 3228 0014                 move.w     20(a0),d1
[000524ee] 206f 0008                 movea.l    8(a7),a0
[000524f2] 9268 0038                 sub.w      56(a0),d1
[000524f6] 48c1                      ext.l      d1
[000524f8] 4eb9 0008 3cac            jsr        _lmul
[000524fe] 223c ffff fc18            move.l     #$FFFFFC18,d1
[00052504] 4eb9 0008 3cf6            jsr        _ldiv
[0005250a] 206f 0008                 movea.l    8(a7),a0
[0005250e] 3228 0048                 move.w     72(a0),d1
[00052512] 827c ff00                 or.w       #$FF00,d1
[00052516] c041                      and.w      d1,d0
[00052518] 3e80                      move.w     d0,(a7)
[0005251a] 302f 0004                 move.w     4(a7),d0
[0005251e] b057                      cmp.w      (a7),d0
[00052520] 6736                      beq.s      $00052558
[00052522] 206f 0008                 movea.l    8(a7),a0
[00052526] 2068 0014                 movea.l    20(a0),a0
[0005252a] 3157 0010                 move.w     (a7),16(a0)
[0005252e] 206f 0008                 movea.l    8(a7),a0
[00052532] 2068 0014                 movea.l    20(a0),a0
[00052536] 3f68 0012 0002            move.w     18(a0),2(a7)
[0005253c] 206f 0008                 movea.l    8(a7),a0
[00052540] 4eb9 0005 8ddc            jsr        Awi_cleanup
[00052546] 322f 0002                 move.w     2(a7),d1
[0005254a] 302f 0004                 move.w     4(a7),d0
[0005254e] 206f 0008                 movea.l    8(a7),a0
[00052552] 4eb9 0005 44c4            jsr        Awi_scroll
[00052558] 4fef 000c                 lea.l      12(a7),a7
[0005255c] 4e75                      rts
Awi_vslid:
[0005255e] 4fef fff4                 lea.l      -12(a7),a7
[00052562] 2f48 0008                 move.l     a0,8(a7)
[00052566] 3f40 0006                 move.w     d0,6(a7)
[0005256a] 206f 0008                 movea.l    8(a7),a0
[0005256e] 3028 0020                 move.w     32(a0),d0
[00052572] 6e04                      bgt.s      $00052578
[00052574] 6000 008a                 bra        $00052600
[00052578] 206f 0008                 movea.l    8(a7),a0
[0005257c] 2068 0014                 movea.l    20(a0),a0
[00052580] 3f68 0012 0002            move.w     18(a0),2(a7)
[00052586] 302f 0006                 move.w     6(a7),d0
[0005258a] 48c0                      ext.l      d0
[0005258c] 206f 0008                 movea.l    8(a7),a0
[00052590] 2068 0014                 movea.l    20(a0),a0
[00052594] 3228 0016                 move.w     22(a0),d1
[00052598] 206f 0008                 movea.l    8(a7),a0
[0005259c] 9268 003a                 sub.w      58(a0),d1
[000525a0] 48c1                      ext.l      d1
[000525a2] 4eb9 0008 3cac            jsr        _lmul
[000525a8] 223c ffff fc18            move.l     #$FFFFFC18,d1
[000525ae] 4eb9 0008 3cf6            jsr        _ldiv
[000525b4] 206f 0008                 movea.l    8(a7),a0
[000525b8] 3228 0048                 move.w     72(a0),d1
[000525bc] e041                      asr.w      #8,d1
[000525be] c041                      and.w      d1,d0
[000525c0] 3e80                      move.w     d0,(a7)
[000525c2] 302f 0002                 move.w     2(a7),d0
[000525c6] b057                      cmp.w      (a7),d0
[000525c8] 6736                      beq.s      $00052600
[000525ca] 206f 0008                 movea.l    8(a7),a0
[000525ce] 2068 0014                 movea.l    20(a0),a0
[000525d2] 3157 0012                 move.w     (a7),18(a0)
[000525d6] 206f 0008                 movea.l    8(a7),a0
[000525da] 2068 0014                 movea.l    20(a0),a0
[000525de] 3f68 0010 0004            move.w     16(a0),4(a7)
[000525e4] 206f 0008                 movea.l    8(a7),a0
[000525e8] 4eb9 0005 8ddc            jsr        Awi_cleanup
[000525ee] 322f 0002                 move.w     2(a7),d1
[000525f2] 302f 0004                 move.w     4(a7),d0
[000525f6] 206f 0008                 movea.l    8(a7),a0
[000525fa] 4eb9 0005 44c4            jsr        Awi_scroll
[00052600] 4fef 000c                 lea.l      12(a7),a7
[00052604] 4e75                      rts
Awi_wheeled:
[00052606] 4fef ffdc                 lea.l      -36(a7),a7
[0005260a] 2f48 0014                 move.l     a0,20(a7)
[0005260e] 2f49 0010                 move.l     a1,16(a7)
[00052612] 3f40 000e                 move.w     d0,14(a7)
[00052616] 3f41 000c                 move.w     d1,12(a7)
[0005261a] 426f 000a                 clr.w      10(a7)
[0005261e] 4eb9 0004 4374            jsr        nkc_kstate
[00052624] 3f40 0004                 move.w     d0,4(a7)
[00052628] 42a7                      clr.l      -(a7)
[0005262a] 93c9                      suba.l     a1,a1
[0005262c] 322f 0010                 move.w     16(a7),d1
[00052630] 302f 0012                 move.w     18(a7),d0
[00052634] 206f 0018                 movea.l    24(a7),a0
[00052638] 4eb9 0005 b008            jsr        Awi_obfind
[0005263e] 584f                      addq.w     #4,a7
[00052640] 2e88                      move.l     a0,(a7)
[00052642] 2017                      move.l     (a7),d0
[00052644] 670a                      beq.s      $00052650
[00052646] 2057                      movea.l    (a7),a0
[00052648] 0c68 0018 0006            cmpi.w     #$0018,6(a0)
[0005264e] 4e71                      nop
[00052650] 302f 000a                 move.w     10(a7),d0
[00052654] 6600 02a8                 bne        $000528FE
[00052658] 426f 001e                 clr.w      30(a7)
[0005265c] 426f 001c                 clr.w      28(a7)
[00052660] 486f 0008                 pea.l      8(a7)
[00052664] 7210                      moveq.l    #16,d1
[00052666] 206f 0018                 movea.l    24(a7),a0
[0005266a] 3028 0020                 move.w     32(a0),d0
[0005266e] 4eb9 0007 f7ba            jsr        wind_get
[00052674] 584f                      addq.w     #4,a7
[00052676] 486f 0006                 pea.l      6(a7)
[0005267a] 720f                      moveq.l    #15,d1
[0005267c] 206f 0018                 movea.l    24(a7),a0
[00052680] 3028 0020                 move.w     32(a0),d0
[00052684] 4eb9 0007 f7ba            jsr        wind_get
[0005268a] 584f                      addq.w     #4,a7
[0005268c] 2f39 000e 692a            move.l     _globl,-(a7)
[00052692] 486f 0024                 pea.l      36(a7)
[00052696] 486f 002a                 pea.l      42(a7)
[0005269a] 43ef 002c                 lea.l      44(a7),a1
[0005269e] 41ef 002c                 lea.l      44(a7),a0
[000526a2] 7008                      moveq.l    #8,d0
[000526a4] 4eb9 0007 8da2            jsr        mt_appl_getinfo
[000526aa] 4fef 000c                 lea.l      12(a7),a7
[000526ae] 4a40                      tst.w      d0
[000526b0] 6700 00d4                 beq        $00052786
[000526b4] 7003                      moveq.l    #3,d0
[000526b6] c06f 0022                 and.w      34(a7),d0
[000526ba] 5740                      subq.w     #3,d0
[000526bc] 6600 00c8                 bne        $00052786
[000526c0] 206f 0010                 movea.l    16(a7),a0
[000526c4] 3010                      move.w     (a0),d0
[000526c6] 6f26                      ble.s      $000526EE
[000526c8] 303c 0080                 move.w     #$0080,d0
[000526cc] 206f 0014                 movea.l    20(a7),a0
[000526d0] c068 0022                 and.w      34(a0),d0
[000526d4] 6718                      beq.s      $000526EE
[000526d6] 0c6f 03e8 0008            cmpi.w     #$03E8,8(a7)
[000526dc] 6c10                      bge.s      $000526EE
[000526de] 3f7c 0002 001c            move.w     #$0002,28(a7)
[000526e4] 206f 0010                 movea.l    16(a7),a0
[000526e8] 3f50 0018                 move.w     (a0),24(a7)
[000526ec] 602e                      bra.s      $0005271C
[000526ee] 206f 0010                 movea.l    16(a7),a0
[000526f2] 3010                      move.w     (a0),d0
[000526f4] 6a26                      bpl.s      $0005271C
[000526f6] 7040                      moveq.l    #64,d0
[000526f8] 206f 0014                 movea.l    20(a7),a0
[000526fc] c068 0022                 and.w      34(a0),d0
[00052700] 671a                      beq.s      $0005271C
[00052702] 0c6f 03e8 0008            cmpi.w     #$03E8,8(a7)
[00052708] 6c12                      bge.s      $0005271C
[0005270a] 3f7c 0003 001c            move.w     #$0003,28(a7)
[00052710] 206f 0010                 movea.l    16(a7),a0
[00052714] 3010                      move.w     (a0),d0
[00052716] 4440                      neg.w      d0
[00052718] 3f40 0018                 move.w     d0,24(a7)
[0005271c] 206f 0010                 movea.l    16(a7),a0
[00052720] 3028 0002                 move.w     2(a0),d0
[00052724] 6f28                      ble.s      $0005274E
[00052726] 206f 0014                 movea.l    20(a7),a0
[0005272a] 3028 0022                 move.w     34(a0),d0
[0005272e] c07c 0400                 and.w      #$0400,d0
[00052732] 671a                      beq.s      $0005274E
[00052734] 0c6f 03e8 0006            cmpi.w     #$03E8,6(a7)
[0005273a] 6c12                      bge.s      $0005274E
[0005273c] 3f7c 0007 001e            move.w     #$0007,30(a7)
[00052742] 206f 0010                 movea.l    16(a7),a0
[00052746] 3f68 0002 001a            move.w     2(a0),26(a7)
[0005274c] 6034                      bra.s      $00052782
[0005274e] 206f 0010                 movea.l    16(a7),a0
[00052752] 3028 0002                 move.w     2(a0),d0
[00052756] 6a2a                      bpl.s      $00052782
[00052758] 206f 0014                 movea.l    20(a7),a0
[0005275c] 3028 0022                 move.w     34(a0),d0
[00052760] c07c 0200                 and.w      #$0200,d0
[00052764] 671c                      beq.s      $00052782
[00052766] 0c6f 03e8 0006            cmpi.w     #$03E8,6(a7)
[0005276c] 6c14                      bge.s      $00052782
[0005276e] 3f7c 0006 001e            move.w     #$0006,30(a7)
[00052774] 206f 0010                 movea.l    16(a7),a0
[00052778] 3028 0002                 move.w     2(a0),d0
[0005277c] 4440                      neg.w      d0
[0005277e] 3f40 001a                 move.w     d0,26(a7)
[00052782] 6000 0136                 bra        $000528BA
[00052786] 206f 0010                 movea.l    16(a7),a0
[0005278a] 3010                      move.w     (a0),d0
[0005278c] 6f32                      ble.s      $000527C0
[0005278e] 303c 0080                 move.w     #$0080,d0
[00052792] 206f 0014                 movea.l    20(a7),a0
[00052796] c068 0022                 and.w      34(a0),d0
[0005279a] 6724                      beq.s      $000527C0
[0005279c] 302f 0004                 move.w     4(a7),d0
[000527a0] c07c 0400                 and.w      #$0400,d0
[000527a4] 6708                      beq.s      $000527AE
[000527a6] 0c6f 03e8 0008            cmpi.w     #$03E8,8(a7)
[000527ac] 6c12                      bge.s      $000527C0
[000527ae] 3f7c 0002 001c            move.w     #$0002,28(a7)
[000527b4] 206f 0010                 movea.l    16(a7),a0
[000527b8] 3f50 0018                 move.w     (a0),24(a7)
[000527bc] 6000 00fc                 bra        $000528BA
[000527c0] 206f 0010                 movea.l    16(a7),a0
[000527c4] 3010                      move.w     (a0),d0
[000527c6] 6a34                      bpl.s      $000527FC
[000527c8] 7040                      moveq.l    #64,d0
[000527ca] 206f 0014                 movea.l    20(a7),a0
[000527ce] c068 0022                 and.w      34(a0),d0
[000527d2] 6728                      beq.s      $000527FC
[000527d4] 302f 0004                 move.w     4(a7),d0
[000527d8] c07c 0400                 and.w      #$0400,d0
[000527dc] 6708                      beq.s      $000527E6
[000527de] 0c6f 03e8 0008            cmpi.w     #$03E8,8(a7)
[000527e4] 6c16                      bge.s      $000527FC
[000527e6] 3f7c 0003 001c            move.w     #$0003,28(a7)
[000527ec] 206f 0010                 movea.l    16(a7),a0
[000527f0] 3010                      move.w     (a0),d0
[000527f2] 4440                      neg.w      d0
[000527f4] 3f40 0018                 move.w     d0,24(a7)
[000527f8] 6000 00c0                 bra        $000528BA
[000527fc] 206f 0010                 movea.l    16(a7),a0
[00052800] 3010                      move.w     (a0),d0
[00052802] 6f28                      ble.s      $0005282C
[00052804] 206f 0014                 movea.l    20(a7),a0
[00052808] 3028 0022                 move.w     34(a0),d0
[0005280c] c07c 0400                 and.w      #$0400,d0
[00052810] 671a                      beq.s      $0005282C
[00052812] 0c6f 03e8 0006            cmpi.w     #$03E8,6(a7)
[00052818] 6c12                      bge.s      $0005282C
[0005281a] 3f7c 0007 001e            move.w     #$0007,30(a7)
[00052820] 206f 0010                 movea.l    16(a7),a0
[00052824] 3f50 001a                 move.w     (a0),26(a7)
[00052828] 6000 0090                 bra        $000528BA
[0005282c] 206f 0010                 movea.l    16(a7),a0
[00052830] 3010                      move.w     (a0),d0
[00052832] 6a2a                      bpl.s      $0005285E
[00052834] 206f 0014                 movea.l    20(a7),a0
[00052838] 3028 0022                 move.w     34(a0),d0
[0005283c] c07c 0200                 and.w      #$0200,d0
[00052840] 671c                      beq.s      $0005285E
[00052842] 0c6f 03e8 0006            cmpi.w     #$03E8,6(a7)
[00052848] 6c14                      bge.s      $0005285E
[0005284a] 3f7c 0006 001e            move.w     #$0006,30(a7)
[00052850] 206f 0010                 movea.l    16(a7),a0
[00052854] 3010                      move.w     (a0),d0
[00052856] 4440                      neg.w      d0
[00052858] 3f40 001a                 move.w     d0,26(a7)
[0005285c] 605c                      bra.s      $000528BA
[0005285e] 206f 0010                 movea.l    16(a7),a0
[00052862] 3010                      move.w     (a0),d0
[00052864] 6f26                      ble.s      $0005288C
[00052866] 303c 0080                 move.w     #$0080,d0
[0005286a] 206f 0014                 movea.l    20(a7),a0
[0005286e] c068 0022                 and.w      34(a0),d0
[00052872] 6718                      beq.s      $0005288C
[00052874] 0c6f 03e8 0008            cmpi.w     #$03E8,8(a7)
[0005287a] 6c10                      bge.s      $0005288C
[0005287c] 3f7c 0002 001c            move.w     #$0002,28(a7)
[00052882] 206f 0010                 movea.l    16(a7),a0
[00052886] 3f50 0018                 move.w     (a0),24(a7)
[0005288a] 602e                      bra.s      $000528BA
[0005288c] 206f 0010                 movea.l    16(a7),a0
[00052890] 3010                      move.w     (a0),d0
[00052892] 6a26                      bpl.s      $000528BA
[00052894] 7040                      moveq.l    #64,d0
[00052896] 206f 0014                 movea.l    20(a7),a0
[0005289a] c068 0022                 and.w      34(a0),d0
[0005289e] 671a                      beq.s      $000528BA
[000528a0] 0c6f 03e8 0008            cmpi.w     #$03E8,8(a7)
[000528a6] 6c12                      bge.s      $000528BA
[000528a8] 3f7c 0003 001c            move.w     #$0003,28(a7)
[000528ae] 206f 0010                 movea.l    16(a7),a0
[000528b2] 3010                      move.w     (a0),d0
[000528b4] 4440                      neg.w      d0
[000528b6] 3f40 0018                 move.w     d0,24(a7)
[000528ba] 302f 001e                 move.w     30(a7),d0
[000528be] 671c                      beq.s      $000528DC
[000528c0] 302f 001a                 move.w     26(a7),d0
[000528c4] 6716                      beq.s      $000528DC
[000528c6] 322f 001a                 move.w     26(a7),d1
[000528ca] 302f 001e                 move.w     30(a7),d0
[000528ce] 206f 0014                 movea.l    20(a7),a0
[000528d2] 226f 0014                 movea.l    20(a7),a1
[000528d6] 2269 007a                 movea.l    122(a1),a1
[000528da] 4e91                      jsr        (a1)
[000528dc] 302f 001c                 move.w     28(a7),d0
[000528e0] 671c                      beq.s      $000528FE
[000528e2] 302f 0018                 move.w     24(a7),d0
[000528e6] 6716                      beq.s      $000528FE
[000528e8] 322f 0018                 move.w     24(a7),d1
[000528ec] 302f 001c                 move.w     28(a7),d0
[000528f0] 206f 0014                 movea.l    20(a7),a0
[000528f4] 226f 0014                 movea.l    20(a7),a1
[000528f8] 2269 007a                 movea.l    122(a1),a1
[000528fc] 4e91                      jsr        (a1)
[000528fe] 7001                      moveq.l    #1,d0
[00052900] 4fef 0024                 lea.l      36(a7),a7
[00052904] 4e75                      rts
Awi_obview:
[00052906] 2f0a                      move.l     a2,-(a7)
[00052908] 4fef ffd8                 lea.l      -40(a7),a7
[0005290c] 2f48 0024                 move.l     a0,36(a7)
[00052910] 2f49 0020                 move.l     a1,32(a7)
[00052914] 206f 0024                 movea.l    36(a7),a0
[00052918] 3028 0020                 move.w     32(a0),d0
[0005291c] 6e04                      bgt.s      $00052922
[0005291e] 6000 0374                 bra        $00052C94
[00052922] 426f 001e                 clr.w      30(a7)
[00052926] 206f 0024                 movea.l    36(a7),a0
[0005292a] 2f68 0014 0008            move.l     20(a0),8(a7)
[00052930] 206f 0024                 movea.l    36(a7),a0
[00052934] 3028 0022                 move.w     34(a0),d0
[00052938] c07c 01c0                 and.w      #$01C0,d0
[0005293c] b07c 01c0                 cmp.w      #$01C0,d0
[00052940] 6608                      bne.s      $0005294A
[00052942] 3f7c 0001 001c            move.w     #$0001,28(a7)
[00052948] 6004                      bra.s      $0005294E
[0005294a] 426f 001c                 clr.w      28(a7)
[0005294e] 206f 0024                 movea.l    36(a7),a0
[00052952] 3028 0022                 move.w     34(a0),d0
[00052956] c07c 0e00                 and.w      #$0E00,d0
[0005295a] b07c 0e00                 cmp.w      #$0E00,d0
[0005295e] 6608                      bne.s      $00052968
[00052960] 3f7c 0001 001a            move.w     #$0001,26(a7)
[00052966] 6004                      bra.s      $0005296C
[00052968] 426f 001a                 clr.w      26(a7)
[0005296c] 206f 0024                 movea.l    36(a7),a0
[00052970] 3028 0048                 move.w     72(a0),d0
[00052974] 807c ff00                 or.w       #$FF00,d0
[00052978] 4440                      neg.w      d0
[0005297a] d040                      add.w      d0,d0
[0005297c] 206f 0020                 movea.l    32(a7),a0
[00052980] d168 0004                 add.w      d0,4(a0)
[00052984] 206f 0024                 movea.l    36(a7),a0
[00052988] 3028 0048                 move.w     72(a0),d0
[0005298c] e040                      asr.w      #8,d0
[0005298e] 4440                      neg.w      d0
[00052990] d040                      add.w      d0,d0
[00052992] 206f 0020                 movea.l    32(a7),a0
[00052996] d168 0006                 add.w      d0,6(a0)
[0005299a] 206f 0008                 movea.l    8(a7),a0
[0005299e] 3f68 0010 0018            move.w     16(a0),24(a7)
[000529a4] 206f 0008                 movea.l    8(a7),a0
[000529a8] 3f68 0012 0016            move.w     18(a0),22(a7)
[000529ae] 206f 0024                 movea.l    36(a7),a0
[000529b2] 3f68 0038 0014            move.w     56(a0),20(a7)
[000529b8] 206f 0024                 movea.l    36(a7),a0
[000529bc] 3f68 003a 0012            move.w     58(a0),18(a7)
[000529c2] 302f 001a                 move.w     26(a7),d0
[000529c6] 671c                      beq.s      $000529E4
[000529c8] 206f 0020                 movea.l    32(a7),a0
[000529cc] 3010                      move.w     (a0),d0
[000529ce] 6a14                      bpl.s      $000529E4
[000529d0] 206f 0020                 movea.l    32(a7),a0
[000529d4] 3010                      move.w     (a0),d0
[000529d6] 206f 0008                 movea.l    8(a7),a0
[000529da] 9168 0010                 sub.w      d0,16(a0)
[000529de] 3f7c 0001 001e            move.w     #$0001,30(a7)
[000529e4] 302f 001c                 move.w     28(a7),d0
[000529e8] 6720                      beq.s      $00052A0A
[000529ea] 206f 0020                 movea.l    32(a7),a0
[000529ee] 3028 0002                 move.w     2(a0),d0
[000529f2] 6a16                      bpl.s      $00052A0A
[000529f4] 206f 0020                 movea.l    32(a7),a0
[000529f8] 3028 0002                 move.w     2(a0),d0
[000529fc] 206f 0008                 movea.l    8(a7),a0
[00052a00] 9168 0012                 sub.w      d0,18(a0)
[00052a04] 3f7c 0001 001e            move.w     #$0001,30(a7)
[00052a0a] 302f 001a                 move.w     26(a7),d0
[00052a0e] 6722                      beq.s      $00052A32
[00052a10] 206f 0020                 movea.l    32(a7),a0
[00052a14] 3028 0004                 move.w     4(a0),d0
[00052a18] b06f 0014                 cmp.w      20(a7),d0
[00052a1c] 6f14                      ble.s      $00052A32
[00052a1e] 206f 0020                 movea.l    32(a7),a0
[00052a22] 226f 0024                 movea.l    36(a7),a1
[00052a26] 3368 0004 0038            move.w     4(a0),56(a1)
[00052a2c] 3f7c 0001 001e            move.w     #$0001,30(a7)
[00052a32] 302f 001c                 move.w     28(a7),d0
[00052a36] 6722                      beq.s      $00052A5A
[00052a38] 206f 0020                 movea.l    32(a7),a0
[00052a3c] 3028 0006                 move.w     6(a0),d0
[00052a40] b06f 0012                 cmp.w      18(a7),d0
[00052a44] 6f14                      ble.s      $00052A5A
[00052a46] 206f 0020                 movea.l    32(a7),a0
[00052a4a] 226f 0024                 movea.l    36(a7),a1
[00052a4e] 3368 0006 003a            move.w     6(a0),58(a1)
[00052a54] 3f7c 0001 001e            move.w     #$0001,30(a7)
[00052a5a] 206f 0020                 movea.l    32(a7),a0
[00052a5e] 3010                      move.w     (a0),d0
[00052a60] 206f 0020                 movea.l    32(a7),a0
[00052a64] d068 0004                 add.w      4(a0),d0
[00052a68] 206f 0024                 movea.l    36(a7),a0
[00052a6c] 9068 0038                 sub.w      56(a0),d0
[00052a70] 3f40 0010                 move.w     d0,16(a7)
[00052a74] 302f 001a                 move.w     26(a7),d0
[00052a78] 6718                      beq.s      $00052A92
[00052a7a] 302f 0010                 move.w     16(a7),d0
[00052a7e] 6f12                      ble.s      $00052A92
[00052a80] 302f 0010                 move.w     16(a7),d0
[00052a84] 206f 0008                 movea.l    8(a7),a0
[00052a88] 9168 0010                 sub.w      d0,16(a0)
[00052a8c] 3f7c 0001 001e            move.w     #$0001,30(a7)
[00052a92] 206f 0020                 movea.l    32(a7),a0
[00052a96] 3028 0002                 move.w     2(a0),d0
[00052a9a] 206f 0020                 movea.l    32(a7),a0
[00052a9e] d068 0006                 add.w      6(a0),d0
[00052aa2] 206f 0024                 movea.l    36(a7),a0
[00052aa6] 9068 003a                 sub.w      58(a0),d0
[00052aaa] 3f40 000e                 move.w     d0,14(a7)
[00052aae] 302f 001c                 move.w     28(a7),d0
[00052ab2] 6718                      beq.s      $00052ACC
[00052ab4] 302f 000e                 move.w     14(a7),d0
[00052ab8] 6f12                      ble.s      $00052ACC
[00052aba] 302f 000e                 move.w     14(a7),d0
[00052abe] 206f 0008                 movea.l    8(a7),a0
[00052ac2] 9168 0012                 sub.w      d0,18(a0)
[00052ac6] 3f7c 0001 001e            move.w     #$0001,30(a7)
[00052acc] 302f 001e                 move.w     30(a7),d0
[00052ad0] 6604                      bne.s      $00052AD6
[00052ad2] 6000 01c0                 bra        $00052C94
[00052ad6] 426f 000c                 clr.w      12(a7)
[00052ada] 206f 0024                 movea.l    36(a7),a0
[00052ade] 2f68 005e 0004            move.l     94(a0),4(a7)
[00052ae4] 671e                      beq.s      $00052B04
[00052ae6] 206f 0004                 movea.l    4(a7),a0
[00052aea] 3228 0002                 move.w     2(a0),d1
[00052aee] 48c1                      ext.l      d1
[00052af0] 2001                      move.l     d1,d0
[00052af2] d080                      add.l      d0,d0
[00052af4] d081                      add.l      d1,d0
[00052af6] e788                      lsl.l      #3,d0
[00052af8] 206f 0004                 movea.l    4(a7),a0
[00052afc] 3030 0816                 move.w     22(a0,d0.l),d0
[00052b00] d16f 000c                 add.w      d0,12(a7)
[00052b04] 206f 0024                 movea.l    36(a7),a0
[00052b08] 2ea8 0018                 move.l     24(a0),(a7)
[00052b0c] 670a                      beq.s      $00052B18
[00052b0e] 2057                      movea.l    (a7),a0
[00052b10] 3028 0016                 move.w     22(a0),d0
[00052b14] d16f 000c                 add.w      d0,12(a7)
[00052b18] 2f39 000e 692a            move.l     _globl,-(a7)
[00052b1e] 206f 0028                 movea.l    40(a7),a0
[00052b22] 4868 002a                 pea.l      42(a0)
[00052b26] 206f 002c                 movea.l    44(a7),a0
[00052b2a] 4868 0028                 pea.l      40(a0)
[00052b2e] 206f 0030                 movea.l    48(a7),a0
[00052b32] 3028 003a                 move.w     58(a0),d0
[00052b36] d06f 0018                 add.w      24(a7),d0
[00052b3a] 3f00                      move.w     d0,-(a7)
[00052b3c] 206f 0032                 movea.l    50(a7),a0
[00052b40] 3f28 0038                 move.w     56(a0),-(a7)
[00052b44] 206f 0034                 movea.l    52(a7),a0
[00052b48] 3028 0036                 move.w     54(a0),d0
[00052b4c] 906f 001c                 sub.w      28(a7),d0
[00052b50] 3f00                      move.w     d0,-(a7)
[00052b52] 226f 0036                 movea.l    54(a7),a1
[00052b56] 43e9 0026                 lea.l      38(a1),a1
[00052b5a] 206f 0036                 movea.l    54(a7),a0
[00052b5e] 41e8 0024                 lea.l      36(a0),a0
[00052b62] 246f 0036                 movea.l    54(a7),a2
[00052b66] 342a 0034                 move.w     52(a2),d2
[00052b6a] 246f 0036                 movea.l    54(a7),a2
[00052b6e] 322a 0022                 move.w     34(a2),d1
[00052b72] 4240                      clr.w      d0
[00052b74] 4eb9 0007 b8da            jsr        mt_wind_calc
[00052b7a] 4fef 0012                 lea.l      18(a7),a7
[00052b7e] 206f 0008                 movea.l    8(a7),a0
[00052b82] 3028 0010                 move.w     16(a0),d0
[00052b86] 4440                      neg.w      d0
[00052b88] 206f 0024                 movea.l    36(a7),a0
[00052b8c] 3228 0048                 move.w     72(a0),d1
[00052b90] 827c ff00                 or.w       #$FF00,d1
[00052b94] c041                      and.w      d1,d0
[00052b96] 4440                      neg.w      d0
[00052b98] 206f 0008                 movea.l    8(a7),a0
[00052b9c] 3140 0010                 move.w     d0,16(a0)
[00052ba0] 206f 0008                 movea.l    8(a7),a0
[00052ba4] 3028 0012                 move.w     18(a0),d0
[00052ba8] 4440                      neg.w      d0
[00052baa] 206f 0024                 movea.l    36(a7),a0
[00052bae] 3228 0048                 move.w     72(a0),d1
[00052bb2] e041                      asr.w      #8,d1
[00052bb4] c041                      and.w      d1,d0
[00052bb6] 4440                      neg.w      d0
[00052bb8] 206f 0008                 movea.l    8(a7),a0
[00052bbc] 3140 0012                 move.w     d0,18(a0)
[00052bc0] 206f 0024                 movea.l    36(a7),a0
[00052bc4] 4eb9 0005 8ddc            jsr        Awi_cleanup
[00052bca] 206f 0008                 movea.l    8(a7),a0
[00052bce] 3028 0010                 move.w     16(a0),d0
[00052bd2] b06f 0018                 cmp.w      24(a7),d0
[00052bd6] 662e                      bne.s      $00052C06
[00052bd8] 206f 0008                 movea.l    8(a7),a0
[00052bdc] 3028 0012                 move.w     18(a0),d0
[00052be0] b06f 0016                 cmp.w      22(a7),d0
[00052be4] 6620                      bne.s      $00052C06
[00052be6] 206f 0024                 movea.l    36(a7),a0
[00052bea] 3028 0038                 move.w     56(a0),d0
[00052bee] b06f 0014                 cmp.w      20(a7),d0
[00052bf2] 6612                      bne.s      $00052C06
[00052bf4] 206f 0024                 movea.l    36(a7),a0
[00052bf8] 3028 003a                 move.w     58(a0),d0
[00052bfc] b06f 0012                 cmp.w      18(a7),d0
[00052c00] 6604                      bne.s      $00052C06
[00052c02] 6000 0090                 bra        $00052C94
[00052c06] 206f 0024                 movea.l    36(a7),a0
[00052c0a] 0068 0010 0056            ori.w      #$0010,86(a0)
[00052c10] 206f 0024                 movea.l    36(a7),a0
[00052c14] 3f28 002a                 move.w     42(a0),-(a7)
[00052c18] 206f 0026                 movea.l    38(a7),a0
[00052c1c] 3f28 0028                 move.w     40(a0),-(a7)
[00052c20] 206f 0028                 movea.l    40(a7),a0
[00052c24] 3f28 0026                 move.w     38(a0),-(a7)
[00052c28] 206f 002a                 movea.l    42(a7),a0
[00052c2c] 3f28 0024                 move.w     36(a0),-(a7)
[00052c30] 7205                      moveq.l    #5,d1
[00052c32] 206f 002c                 movea.l    44(a7),a0
[00052c36] 3028 0020                 move.w     32(a0),d0
[00052c3a] 4eb9 0007 f926            jsr        wind_set
[00052c40] 504f                      addq.w     #8,a7
[00052c42] 2079 0010 ee4e            movea.l    ACSblk,a0
[00052c48] 2068 0280                 movea.l    640(a0),a0
[00052c4c] 0c50 0300                 cmpi.w     #$0300,(a0)
[00052c50] 6f1a                      ble.s      $00052C6C
[00052c52] 2079 0010 ee4e            movea.l    ACSblk,a0
[00052c58] 2068 0280                 movea.l    640(a0),a0
[00052c5c] 0c50 0400                 cmpi.w     #$0400,(a0)
[00052c60] 6c0a                      bge.s      $00052C6C
[00052c62] 206f 0024                 movea.l    36(a7),a0
[00052c66] 4eb9 0005 7376            jsr        Awi_slider
[00052c6c] 4eb9 0004 b086            jsr        Aev_mess
[00052c72] 7010                      moveq.l    #16,d0
[00052c74] 206f 0024                 movea.l    36(a7),a0
[00052c78] c068 0056                 and.w      86(a0),d0
[00052c7c] 6716                      beq.s      $00052C94
[00052c7e] 226f 0024                 movea.l    36(a7),a1
[00052c82] 43e9 0024                 lea.l      36(a1),a1
[00052c86] 206f 0024                 movea.l    36(a7),a0
[00052c8a] 246f 0024                 movea.l    36(a7),a2
[00052c8e] 246a 006a                 movea.l    106(a2),a2
[00052c92] 4e92                      jsr        (a2)
[00052c94] 4fef 0028                 lea.l      40(a7),a7
[00052c98] 245f                      movea.l    (a7)+,a2
[00052c9a] 4e75                      rts
Aob_chdef:
[00052c9c] 4fef fff4                 lea.l      -12(a7),a7
[00052ca0] 2f48 0008                 move.l     a0,8(a7)
[00052ca4] 2f49 0004                 move.l     a1,4(a7)
[00052ca8] 7202                      moveq.l    #2,d1
[00052caa] 70ff                      moveq.l    #-1,d0
[00052cac] 206f 0004                 movea.l    4(a7),a0
[00052cb0] 4eb9 0005 0e62            jsr        Aob_findflag
[00052cb6] 3f40 0002                 move.w     d0,2(a7)
[00052cba] 6a06                      bpl.s      $00052CC2
[00052cbc] 4240                      clr.w      d0
[00052cbe] 6000 012c                 bra        $00052DEC
[00052cc2] 323c 4000                 move.w     #$4000,d1
[00052cc6] 302f 0002                 move.w     2(a7),d0
[00052cca] 206f 0004                 movea.l    4(a7),a0
[00052cce] 4eb9 0005 0e62            jsr        Aob_findflag
[00052cd4] 3e80                      move.w     d0,(a7)
[00052cd6] 3017                      move.w     (a7),d0
[00052cd8] 6b1a                      bmi.s      $00052CF4
[00052cda] 303c 0080                 move.w     #$0080,d0
[00052cde] 3417                      move.w     (a7),d2
[00052ce0] 48c2                      ext.l      d2
[00052ce2] 2202                      move.l     d2,d1
[00052ce4] d281                      add.l      d1,d1
[00052ce6] d282                      add.l      d2,d1
[00052ce8] e789                      lsl.l      #3,d1
[00052cea] 206f 0004                 movea.l    4(a7),a0
[00052cee] c070 1808                 and.w      8(a0,d1.l),d0
[00052cf2] 6712                      beq.s      $00052D06
[00052cf4] 323c 4000                 move.w     #$4000,d1
[00052cf8] 70ff                      moveq.l    #-1,d0
[00052cfa] 206f 0004                 movea.l    4(a7),a0
[00052cfe] 4eb9 0005 0e62            jsr        Aob_findflag
[00052d04] 3e80                      move.w     d0,(a7)
[00052d06] 3017                      move.w     (a7),d0
[00052d08] 6b22                      bmi.s      $00052D2C
[00052d0a] 303c 0080                 move.w     #$0080,d0
[00052d0e] 3417                      move.w     (a7),d2
[00052d10] 48c2                      ext.l      d2
[00052d12] 2202                      move.l     d2,d1
[00052d14] d281                      add.l      d1,d1
[00052d16] d282                      add.l      d2,d1
[00052d18] e789                      lsl.l      #3,d1
[00052d1a] 206f 0004                 movea.l    4(a7),a0
[00052d1e] c070 1808                 and.w      8(a0,d1.l),d0
[00052d22] 6608                      bne.s      $00052D2C
[00052d24] 302f 0002                 move.w     2(a7),d0
[00052d28] b057                      cmp.w      (a7),d0
[00052d2a] 6606                      bne.s      $00052D32
[00052d2c] 4240                      clr.w      d0
[00052d2e] 6000 00bc                 bra        $00052DEC
[00052d32] 302f 0002                 move.w     2(a7),d0
[00052d36] 6b18                      bmi.s      $00052D50
[00052d38] 322f 0002                 move.w     2(a7),d1
[00052d3c] 48c1                      ext.l      d1
[00052d3e] 2001                      move.l     d1,d0
[00052d40] d080                      add.l      d0,d0
[00052d42] d081                      add.l      d1,d0
[00052d44] e788                      lsl.l      #3,d0
[00052d46] 206f 0004                 movea.l    4(a7),a0
[00052d4a] 0270 fffd 0808            andi.w     #$FFFD,8(a0,d0.l)
[00052d50] 3217                      move.w     (a7),d1
[00052d52] 48c1                      ext.l      d1
[00052d54] 2001                      move.l     d1,d0
[00052d56] d080                      add.l      d0,d0
[00052d58] d081                      add.l      d1,d0
[00052d5a] e788                      lsl.l      #3,d0
[00052d5c] 206f 0004                 movea.l    4(a7),a0
[00052d60] 0070 0002 0808            ori.w      #$0002,8(a0,d0.l)
[00052d66] 2079 0010 ee4e            movea.l    ACSblk,a0
[00052d6c] 216f 0004 025c            move.l     4(a7),604(a0)
[00052d72] 206f 0008                 movea.l    8(a7),a0
[00052d76] 2068 0018                 movea.l    24(a0),a0
[00052d7a] b1ef 0004                 cmpa.l     4(a7),a0
[00052d7e] 663a                      bne.s      $00052DBA
[00052d80] 302f 0002                 move.w     2(a7),d0
[00052d84] 807c 1000                 or.w       #$1000,d0
[00052d88] 206f 0008                 movea.l    8(a7),a0
[00052d8c] 6100 edf2                 bsr        Awi_obredraw
[00052d90] 3417                      move.w     (a7),d2
[00052d92] 48c2                      ext.l      d2
[00052d94] 2002                      move.l     d2,d0
[00052d96] d080                      add.l      d0,d0
[00052d98] d082                      add.l      d2,d0
[00052d9a] e788                      lsl.l      #3,d0
[00052d9c] 206f 0004                 movea.l    4(a7),a0
[00052da0] 3230 080a                 move.w     10(a0,d0.l),d1
[00052da4] 3017                      move.w     (a7),d0
[00052da6] 807c 1000                 or.w       #$1000,d0
[00052daa] 206f 0008                 movea.l    8(a7),a0
[00052dae] 226f 0008                 movea.l    8(a7),a1
[00052db2] 2269 0066                 movea.l    102(a1),a1
[00052db6] 4e91                      jsr        (a1)
[00052db8] 6030                      bra.s      $00052DEA
[00052dba] 302f 0002                 move.w     2(a7),d0
[00052dbe] 206f 0008                 movea.l    8(a7),a0
[00052dc2] 6100 edbc                 bsr        Awi_obredraw
[00052dc6] 3417                      move.w     (a7),d2
[00052dc8] 48c2                      ext.l      d2
[00052dca] 2002                      move.l     d2,d0
[00052dcc] d080                      add.l      d0,d0
[00052dce] d082                      add.l      d2,d0
[00052dd0] e788                      lsl.l      #3,d0
[00052dd2] 206f 0004                 movea.l    4(a7),a0
[00052dd6] 3230 080a                 move.w     10(a0,d0.l),d1
[00052dda] 3017                      move.w     (a7),d0
[00052ddc] 206f 0008                 movea.l    8(a7),a0
[00052de0] 226f 0008                 movea.l    8(a7),a1
[00052de4] 2269 0066                 movea.l    102(a1),a1
[00052de8] 4e91                      jsr        (a1)
[00052dea] 7001                      moveq.l    #1,d0
[00052dec] 4fef 000c                 lea.l      12(a7),a7
[00052df0] 4e75                      rts
Awi_find_edit:
[00052df2] 4fef ffee                 lea.l      -18(a7),a7
[00052df6] 2f48 000e                 move.l     a0,14(a7)
[00052dfa] 2f49 000a                 move.l     a1,10(a7)
[00052dfe] 206f 000e                 movea.l    14(a7),a0
[00052e02] 3f68 001c 0008            move.w     28(a0),8(a7)
[00052e08] 302f 0008                 move.w     8(a7),d0
[00052e0c] 6b6e                      bmi.s      $00052E7C
[00052e0e] 302f 0008                 move.w     8(a7),d0
[00052e12] c07c 1000                 and.w      #$1000,d0
[00052e16] 670c                      beq.s      $00052E24
[00052e18] 206f 000e                 movea.l    14(a7),a0
[00052e1c] 2f68 0018 0004            move.l     24(a0),4(a7)
[00052e22] 600a                      bra.s      $00052E2E
[00052e24] 206f 000e                 movea.l    14(a7),a0
[00052e28] 2f68 0014 0004            move.l     20(a0),4(a7)
[00052e2e] 202f 0004                 move.l     4(a7),d0
[00052e32] 6742                      beq.s      $00052E76
[00052e34] 322f 0008                 move.w     8(a7),d1
[00052e38] c27c 0fff                 and.w      #$0FFF,d1
[00052e3c] 48c1                      ext.l      d1
[00052e3e] 2001                      move.l     d1,d0
[00052e40] d080                      add.l      d0,d0
[00052e42] d081                      add.l      d1,d0
[00052e44] e788                      lsl.l      #3,d0
[00052e46] 206f 0004                 movea.l    4(a7),a0
[00052e4a] 0c30 0018 0807            cmpi.b     #$18,7(a0,d0.l)
[00052e50] 6624                      bne.s      $00052E76
[00052e52] 322f 0008                 move.w     8(a7),d1
[00052e56] c27c 0fff                 and.w      #$0FFF,d1
[00052e5a] 48c1                      ext.l      d1
[00052e5c] 2001                      move.l     d1,d0
[00052e5e] d080                      add.l      d0,d0
[00052e60] d081                      add.l      d1,d0
[00052e62] e788                      lsl.l      #3,d0
[00052e64] 206f 0004                 movea.l    4(a7),a0
[00052e68] 2eb0 080c                 move.l     12(a0,d0.l),(a7)
[00052e6c] 6708                      beq.s      $00052E76
[00052e6e] 2057                      movea.l    (a7),a0
[00052e70] 2028 0008                 move.l     8(a0),d0
[00052e74] 6606                      bne.s      $00052E7C
[00052e76] 3f7c ffff 0008            move.w     #$FFFF,8(a7)
[00052e7c] 302f 0008                 move.w     8(a7),d0
[00052e80] 6a4e                      bpl.s      $00052ED0
[00052e82] 206f 000e                 movea.l    14(a7),a0
[00052e86] 2028 0014                 move.l     20(a0),d0
[00052e8a] 6744                      beq.s      $00052ED0
[00052e8c] 7208                      moveq.l    #8,d1
[00052e8e] 70ff                      moveq.l    #-1,d0
[00052e90] 206f 000e                 movea.l    14(a7),a0
[00052e94] 2068 0014                 movea.l    20(a0),a0
[00052e98] 4eb9 0005 0e62            jsr        Aob_findflag
[00052e9e] 3f40 0008                 move.w     d0,8(a7)
[00052ea2] 6a2c                      bpl.s      $00052ED0
[00052ea4] 206f 000e                 movea.l    14(a7),a0
[00052ea8] 2028 0018                 move.l     24(a0),d0
[00052eac] 6722                      beq.s      $00052ED0
[00052eae] 7208                      moveq.l    #8,d1
[00052eb0] 70ff                      moveq.l    #-1,d0
[00052eb2] 206f 000e                 movea.l    14(a7),a0
[00052eb6] 2068 0018                 movea.l    24(a0),a0
[00052eba] 4eb9 0005 0e62            jsr        Aob_findflag
[00052ec0] 807c 1000                 or.w       #$1000,d0
[00052ec4] 3f40 0008                 move.w     d0,8(a7)
[00052ec8] 6b06                      bmi.s      $00052ED0
[00052eca] 006f 1000 0008            ori.w      #$1000,8(a7)
[00052ed0] 302f 0008                 move.w     8(a7),d0
[00052ed4] 6f00 009a                 ble        $00052F70
[00052ed8] 302f 0008                 move.w     8(a7),d0
[00052edc] c07c 1000                 and.w      #$1000,d0
[00052ee0] 6728                      beq.s      $00052F0A
[00052ee2] 206f 000e                 movea.l    14(a7),a0
[00052ee6] 226f 000a                 movea.l    10(a7),a1
[00052eea] 22a8 0018                 move.l     24(a0),(a1)
[00052eee] 206f 000e                 movea.l    14(a7),a0
[00052ef2] 226f 0016                 movea.l    22(a7),a1
[00052ef6] 22a8 0014                 move.l     20(a0),(a1)
[00052efa] 302f 0008                 move.w     8(a7),d0
[00052efe] c07c 0fff                 and.w      #$0FFF,d0
[00052f02] 206f 001a                 movea.l    26(a7),a0
[00052f06] 3080                      move.w     d0,(a0)
[00052f08] 6020                      bra.s      $00052F2A
[00052f0a] 206f 000e                 movea.l    14(a7),a0
[00052f0e] 226f 000a                 movea.l    10(a7),a1
[00052f12] 22a8 0014                 move.l     20(a0),(a1)
[00052f16] 206f 000e                 movea.l    14(a7),a0
[00052f1a] 226f 0016                 movea.l    22(a7),a1
[00052f1e] 22a8 0018                 move.l     24(a0),(a1)
[00052f22] 206f 001a                 movea.l    26(a7),a0
[00052f26] 30af 0008                 move.w     8(a7),(a0)
[00052f2a] 206f 001a                 movea.l    26(a7),a0
[00052f2e] 3210                      move.w     (a0),d1
[00052f30] 48c1                      ext.l      d1
[00052f32] 2001                      move.l     d1,d0
[00052f34] d080                      add.l      d0,d0
[00052f36] d081                      add.l      d1,d0
[00052f38] e788                      lsl.l      #3,d0
[00052f3a] 206f 000a                 movea.l    10(a7),a0
[00052f3e] 2050                      movea.l    (a0),a0
[00052f40] 0c30 0018 0807            cmpi.b     #$18,7(a0,d0.l)
[00052f46] 6628                      bne.s      $00052F70
[00052f48] 206f 001a                 movea.l    26(a7),a0
[00052f4c] 3210                      move.w     (a0),d1
[00052f4e] 48c1                      ext.l      d1
[00052f50] 2001                      move.l     d1,d0
[00052f52] d080                      add.l      d0,d0
[00052f54] d081                      add.l      d1,d0
[00052f56] e788                      lsl.l      #3,d0
[00052f58] 206f 000a                 movea.l    10(a7),a0
[00052f5c] 2050                      movea.l    (a0),a0
[00052f5e] 2eb0 080c                 move.l     12(a0,d0.l),(a7)
[00052f62] 670c                      beq.s      $00052F70
[00052f64] 2057                      movea.l    (a7),a0
[00052f66] 2028 0008                 move.l     8(a0),d0
[00052f6a] 6704                      beq.s      $00052F70
[00052f6c] 7001                      moveq.l    #1,d0
[00052f6e] 6016                      bra.s      $00052F86
[00052f70] 7000                      moveq.l    #0,d0
[00052f72] 206f 0016                 movea.l    22(a7),a0
[00052f76] 2080                      move.l     d0,(a0)
[00052f78] 206f 000a                 movea.l    10(a7),a0
[00052f7c] 2080                      move.l     d0,(a0)
[00052f7e] 206f 001a                 movea.l    26(a7),a0
[00052f82] 4250                      clr.w      (a0)
[00052f84] 4240                      clr.w      d0
[00052f86] 4fef 0012                 lea.l      18(a7),a7
[00052f8a] 4e75                      rts
Awi_char:
[00052f8c] 2f0a                      move.l     a2,-(a7)
[00052f8e] 4fef fff4                 lea.l      -12(a7),a7
[00052f92] 2f48 0008                 move.l     a0,8(a7)
[00052f96] 2f49 0004                 move.l     a1,4(a7)
[00052f9a] 1f40 0002                 move.b     d0,2(a7)
[00052f9e] 41f9 000e 0cc8            lea.l      $000E0CC8,a0
[00052fa4] 43d7                      lea.l      (a7),a1
[00052fa6] 12d8                      move.b     (a0)+,(a1)+
[00052fa8] 12d8                      move.b     (a0)+,(a1)+
[00052faa] 1eaf 0002                 move.b     2(a7),(a7)
[00052fae] 43d7                      lea.l      (a7),a1
[00052fb0] 303c 02c0                 move.w     #$02C0,d0
[00052fb4] 206f 0004                 movea.l    4(a7),a0
[00052fb8] 246f 0008                 movea.l    8(a7),a2
[00052fbc] 246a 0008                 movea.l    8(a2),a2
[00052fc0] 4e92                      jsr        (a2)
[00052fc2] 4fef 000c                 lea.l      12(a7),a7
[00052fc6] 245f                      movea.l    (a7)+,a2
[00052fc8] 4e75                      rts
Awi_firstedit:
[00052fca] 5d4f                      subq.w     #6,a7
[00052fcc] 2f48 0002                 move.l     a0,2(a7)
[00052fd0] 206f 0002                 movea.l    2(a7),a0
[00052fd4] 2028 0018                 move.l     24(a0),d0
[00052fd8] 671e                      beq.s      $00052FF8
[00052fda] 7208                      moveq.l    #8,d1
[00052fdc] 70ff                      moveq.l    #-1,d0
[00052fde] 206f 0002                 movea.l    2(a7),a0
[00052fe2] 2068 0018                 movea.l    24(a0),a0
[00052fe6] 4eb9 0005 0e62            jsr        Aob_findflag
[00052fec] 3e80                      move.w     d0,(a7)
[00052fee] 6f08                      ble.s      $00052FF8
[00052ff0] 3017                      move.w     (a7),d0
[00052ff2] 807c 1000                 or.w       #$1000,d0
[00052ff6] 601c                      bra.s      $00053014
[00052ff8] 7208                      moveq.l    #8,d1
[00052ffa] 70ff                      moveq.l    #-1,d0
[00052ffc] 206f 0002                 movea.l    2(a7),a0
[00053000] 2068 0014                 movea.l    20(a0),a0
[00053004] 4eb9 0005 0e62            jsr        Aob_findflag
[0005300a] 3e80                      move.w     d0,(a7)
[0005300c] 6f04                      ble.s      $00053012
[0005300e] 3017                      move.w     (a7),d0
[00053010] 6002                      bra.s      $00053014
[00053012] 70ff                      moveq.l    #-1,d0
[00053014] 5c4f                      addq.w     #6,a7
[00053016] 4e75                      rts
Awi_lastedit:
[00053018] 4fef fff4                 lea.l      -12(a7),a7
[0005301c] 2f48 0008                 move.l     a0,8(a7)
[00053020] 4297                      clr.l      (a7)
[00053022] 206f 0008                 movea.l    8(a7),a0
[00053026] 2028 0014                 move.l     20(a0),d0
[0005302a] 6720                      beq.s      $0005304C
[0005302c] 7208                      moveq.l    #8,d1
[0005302e] 70ff                      moveq.l    #-1,d0
[00053030] 206f 0008                 movea.l    8(a7),a0
[00053034] 2068 0014                 movea.l    20(a0),a0
[00053038] 4eb9 0005 0e62            jsr        Aob_findflag
[0005303e] 4a40                      tst.w      d0
[00053040] 6f0a                      ble.s      $0005304C
[00053042] 206f 0008                 movea.l    8(a7),a0
[00053046] 2ea8 0014                 move.l     20(a0),(a7)
[0005304a] 6008                      bra.s      $00053054
[0005304c] 206f 0008                 movea.l    8(a7),a0
[00053050] 2ea8 0018                 move.l     24(a0),(a7)
[00053054] 2017                      move.l     (a7),d0
[00053056] 6746                      beq.s      $0005309E
[00053058] 3f7c ffff 0004            move.w     #$FFFF,4(a7)
[0005305e] 3f6f 0004 0006            move.w     4(a7),6(a7)
[00053064] 7208                      moveq.l    #8,d1
[00053066] 302f 0006                 move.w     6(a7),d0
[0005306a] 2057                      movea.l    (a7),a0
[0005306c] 4eb9 0005 0e62            jsr        Aob_findflag
[00053072] 3f40 0004                 move.w     d0,4(a7)
[00053076] 302f 0004                 move.w     4(a7),d0
[0005307a] 6ee2                      bgt.s      $0005305E
[0005307c] 302f 0006                 move.w     6(a7),d0
[00053080] 6f1c                      ble.s      $0005309E
[00053082] 206f 0008                 movea.l    8(a7),a0
[00053086] 2068 0018                 movea.l    24(a0),a0
[0005308a] b1d7                      cmpa.l     (a7),a0
[0005308c] 660a                      bne.s      $00053098
[0005308e] 302f 0006                 move.w     6(a7),d0
[00053092] 807c 1000                 or.w       #$1000,d0
[00053096] 6004                      bra.s      $0005309C
[00053098] 302f 0006                 move.w     6(a7),d0
[0005309c] 6002                      bra.s      $000530A0
[0005309e] 70ff                      moveq.l    #-1,d0
[000530a0] 4fef 000c                 lea.l      12(a7),a7
[000530a4] 4e75                      rts
Awi_focuschg:
[000530a6] 2f0a                      move.l     a2,-(a7)
[000530a8] 4fef ffec                 lea.l      -20(a7),a7
[000530ac] 2f48 0010                 move.l     a0,16(a7)
[000530b0] 3f40 000e                 move.w     d0,14(a7)
[000530b4] 3f41 000c                 move.w     d1,12(a7)
[000530b8] 302f 000c                 move.w     12(a7),d0
[000530bc] 6e06                      bgt.s      $000530C4
[000530be] 7001                      moveq.l    #1,d0
[000530c0] 6000 00ae                 bra        $00053170
[000530c4] 302f 000c                 move.w     12(a7),d0
[000530c8] c07c 1000                 and.w      #$1000,d0
[000530cc] 670c                      beq.s      $000530DA
[000530ce] 206f 0010                 movea.l    16(a7),a0
[000530d2] 2f68 0018 0008            move.l     24(a0),8(a7)
[000530d8] 600a                      bra.s      $000530E4
[000530da] 206f 0010                 movea.l    16(a7),a0
[000530de] 2f68 0014 0008            move.l     20(a0),8(a7)
[000530e4] 43ef 000c                 lea.l      12(a7),a1
[000530e8] 7008                      moveq.l    #8,d0
[000530ea] 206f 0010                 movea.l    16(a7),a0
[000530ee] 246f 0010                 movea.l    16(a7),a2
[000530f2] 246a 0004                 movea.l    4(a2),a2
[000530f6] 4e92                      jsr        (a2)
[000530f8] 4a40                      tst.w      d0
[000530fa] 6710                      beq.s      $0005310C
[000530fc] 302f 000c                 move.w     12(a7),d0
[00053100] b06f 000e                 cmp.w      14(a7),d0
[00053104] 6606                      bne.s      $0005310C
[00053106] 4240                      clr.w      d0
[00053108] 6066                      bra.s      $00053170
[0005310a] 6062                      bra.s      $0005316E
[0005310c] 6100 e27a                 bsr        Awi_diaend
[00053110] 206f 0010                 movea.l    16(a7),a0
[00053114] 316f 000c 001c            move.w     12(a7),28(a0)
[0005311a] 302f 000c                 move.w     12(a7),d0
[0005311e] c07c 0fff                 and.w      #$0FFF,d0
[00053122] 226f 0008                 movea.l    8(a7),a1
[00053126] 41d7                      lea.l      (a7),a0
[00053128] 4eb9 0004 fe06            jsr        Aob_offset
[0005312e] 3017                      move.w     (a7),d0
[00053130] 6b28                      bmi.s      $0005315A
[00053132] 302f 0002                 move.w     2(a7),d0
[00053136] 6b22                      bmi.s      $0005315A
[00053138] 3017                      move.w     (a7),d0
[0005313a] d06f 0004                 add.w      4(a7),d0
[0005313e] 206f 0010                 movea.l    16(a7),a0
[00053142] b068 0038                 cmp.w      56(a0),d0
[00053146] 6c12                      bge.s      $0005315A
[00053148] 302f 0002                 move.w     2(a7),d0
[0005314c] d06f 0006                 add.w      6(a7),d0
[00053150] 206f 0010                 movea.l    16(a7),a0
[00053154] b068 003a                 cmp.w      58(a0),d0
[00053158] 6d10                      blt.s      $0005316A
[0005315a] 43d7                      lea.l      (a7),a1
[0005315c] 206f 0010                 movea.l    16(a7),a0
[00053160] 6100 f7a4                 bsr        Awi_obview
[00053164] 4eb9 0004 b086            jsr        Aev_mess
[0005316a] 6100 e310                 bsr        Awi_diastart
[0005316e] 7001                      moveq.l    #1,d0
[00053170] 4fef 0014                 lea.l      20(a7),a7
[00053174] 245f                      movea.l    (a7)+,a2
[00053176] 4e75                      rts
Awi_newsel:
[00053178] 4fef fff0                 lea.l      -16(a7),a7
[0005317c] 2f48 000c                 move.l     a0,12(a7)
[00053180] 3f40 000a                 move.w     d0,10(a7)
[00053184] 3f41 0008                 move.w     d1,8(a7)
[00053188] 302f 000a                 move.w     10(a7),d0
[0005318c] 6f10                      ble.s      $0005319E
[0005318e] 302f 000a                 move.w     10(a7),d0
[00053192] 206f 000c                 movea.l    12(a7),a0
[00053196] 4eb9 0004 7f76            jsr        Adr_del
[0005319c] 6006                      bra.s      $000531A4
[0005319e] 4eb9 0004 810e            jsr        Adr_unselect
[000531a4] 302f 0008                 move.w     8(a7),d0
[000531a8] 206f 000c                 movea.l    12(a7),a0
[000531ac] 4eb9 0004 7e6a            jsr        Adr_add
[000531b2] 302f 0008                 move.w     8(a7),d0
[000531b6] 206f 000c                 movea.l    12(a7),a0
[000531ba] 2268 0014                 movea.l    20(a0),a1
[000531be] 41d7                      lea.l      (a7),a0
[000531c0] 4eb9 0004 fe06            jsr        Aob_offset
[000531c6] 43d7                      lea.l      (a7),a1
[000531c8] 206f 000c                 movea.l    12(a7),a0
[000531cc] 6100 f738                 bsr        Awi_obview
[000531d0] 4fef 0010                 lea.l      16(a7),a7
[000531d4] 4e75                      rts
Awi_prevsel:
[000531d6] 4fef ffec                 lea.l      -20(a7),a7
[000531da] 2f48 0010                 move.l     a0,16(a7)
[000531de] 3f40 000e                 move.w     d0,14(a7)
[000531e2] 3f41 000c                 move.w     d1,12(a7)
[000531e6] 3ebc ffff                 move.w     #$FFFF,(a7)
[000531ea] 206f 0010                 movea.l    16(a7),a0
[000531ee] 2f68 0014 0008            move.l     20(a0),8(a7)
[000531f4] 206f 0008                 movea.l    8(a7),a0
[000531f8] 3f68 0002 0006            move.w     2(a0),6(a7)
[000531fe] 206f 0008                 movea.l    8(a7),a0
[00053202] 3f68 0004 0004            move.w     4(a0),4(a7)
[00053208] 322f 0004                 move.w     4(a7),d1
[0005320c] 48c1                      ext.l      d1
[0005320e] 2001                      move.l     d1,d0
[00053210] d080                      add.l      d0,d0
[00053212] d081                      add.l      d1,d0
[00053214] e788                      lsl.l      #3,d0
[00053216] 206f 0008                 movea.l    8(a7),a0
[0005321a] 3030 0808                 move.w     8(a0,d0.l),d0
[0005321e] c07c 8000                 and.w      #$8000,d0
[00053222] 6704                      beq.s      $00053228
[00053224] 536f 0004                 subq.w     #1,4(a7)
[00053228] 302f 0006                 move.w     6(a7),d0
[0005322c] b06f 0004                 cmp.w      4(a7),d0
[00053230] 6608                      bne.s      $0005323A
[00053232] 302f 0006                 move.w     6(a7),d0
[00053236] 6000 00e2                 bra        $0005331A
[0005323a] 302f 0004                 move.w     4(a7),d0
[0005323e] b06f 000e                 cmp.w      14(a7),d0
[00053242] 6f0c                      ble.s      $00053250
[00053244] 302f 000e                 move.w     14(a7),d0
[00053248] 6706                      beq.s      $00053250
[0005324a] 3f6f 000e 0004            move.w     14(a7),4(a7)
[00053250] 3f6f 0006 0002            move.w     6(a7),2(a7)
[00053256] 6000 009c                 bra        $000532F4
[0005325a] 7001                      moveq.l    #1,d0
[0005325c] 342f 0002                 move.w     2(a7),d2
[00053260] 48c2                      ext.l      d2
[00053262] 2202                      move.l     d2,d1
[00053264] d281                      add.l      d1,d1
[00053266] d282                      add.l      d2,d1
[00053268] e789                      lsl.l      #3,d1
[0005326a] 206f 0008                 movea.l    8(a7),a0
[0005326e] c070 1808                 and.w      8(a0,d1.l),d0
[00053272] 6760                      beq.s      $000532D4
[00053274] 303c 0080                 move.w     #$0080,d0
[00053278] 342f 0002                 move.w     2(a7),d2
[0005327c] 48c2                      ext.l      d2
[0005327e] 2202                      move.l     d2,d1
[00053280] d281                      add.l      d1,d1
[00053282] d282                      add.l      d2,d1
[00053284] e789                      lsl.l      #3,d1
[00053286] 206f 0008                 movea.l    8(a7),a0
[0005328a] c070 1808                 and.w      8(a0,d1.l),d0
[0005328e] 6644                      bne.s      $000532D4
[00053290] 302f 000c                 move.w     12(a7),d0
[00053294] 673a                      beq.s      $000532D0
[00053296] 302f 000e                 move.w     14(a7),d0
[0005329a] 6734                      beq.s      $000532D0
[0005329c] 322f 000e                 move.w     14(a7),d1
[000532a0] 48c1                      ext.l      d1
[000532a2] 2001                      move.l     d1,d0
[000532a4] d080                      add.l      d0,d0
[000532a6] d081                      add.l      d1,d0
[000532a8] e788                      lsl.l      #3,d0
[000532aa] 206f 0008                 movea.l    8(a7),a0
[000532ae] 3030 0810                 move.w     16(a0,d0.l),d0
[000532b2] 342f 0002                 move.w     2(a7),d2
[000532b6] 48c2                      ext.l      d2
[000532b8] 2202                      move.l     d2,d1
[000532ba] d281                      add.l      d1,d1
[000532bc] d282                      add.l      d2,d1
[000532be] e789                      lsl.l      #3,d1
[000532c0] 206f 0008                 movea.l    8(a7),a0
[000532c4] b070 1810                 cmp.w      16(a0,d1.l),d0
[000532c8] 6604                      bne.s      $000532CE
[000532ca] 3eaf 0002                 move.w     2(a7),(a7)
[000532ce] 6004                      bra.s      $000532D4
[000532d0] 3eaf 0002                 move.w     2(a7),(a7)
[000532d4] 322f 0002                 move.w     2(a7),d1
[000532d8] 48c1                      ext.l      d1
[000532da] 2001                      move.l     d1,d0
[000532dc] d080                      add.l      d0,d0
[000532de] d081                      add.l      d1,d0
[000532e0] e788                      lsl.l      #3,d0
[000532e2] 206f 0008                 movea.l    8(a7),a0
[000532e6] 3f70 0800 0002            move.w     0(a0,d0.l),2(a7)
[000532ec] 302f 0002                 move.w     2(a7),d0
[000532f0] 6602                      bne.s      $000532F4
[000532f2] 6024                      bra.s      $00053318
[000532f4] 302f 000e                 move.w     14(a7),d0
[000532f8] 670c                      beq.s      $00053306
[000532fa] 302f 0002                 move.w     2(a7),d0
[000532fe] b06f 0004                 cmp.w      4(a7),d0
[00053302] 6d00 ff56                 blt        $0005325A
[00053306] 302f 000e                 move.w     14(a7),d0
[0005330a] 660c                      bne.s      $00053318
[0005330c] 302f 0002                 move.w     2(a7),d0
[00053310] b06f 0004                 cmp.w      4(a7),d0
[00053314] 6f00 ff44                 ble        $0005325A
[00053318] 3017                      move.w     (a7),d0
[0005331a] 4fef 0014                 lea.l      20(a7),a7
[0005331e] 4e75                      rts
Awi_nextsel:
[00053320] 4fef ffee                 lea.l      -18(a7),a7
[00053324] 2f48 000e                 move.l     a0,14(a7)
[00053328] 3f40 000c                 move.w     d0,12(a7)
[0005332c] 3f41 000a                 move.w     d1,10(a7)
[00053330] 206f 000e                 movea.l    14(a7),a0
[00053334] 2f68 0014 0006            move.l     20(a0),6(a7)
[0005333a] 206f 0006                 movea.l    6(a7),a0
[0005333e] 3f68 0002 0004            move.w     2(a0),4(a7)
[00053344] 206f 0006                 movea.l    6(a7),a0
[00053348] 3f68 0004 0002            move.w     4(a0),2(a7)
[0005334e] 322f 0002                 move.w     2(a7),d1
[00053352] 48c1                      ext.l      d1
[00053354] 2001                      move.l     d1,d0
[00053356] d080                      add.l      d0,d0
[00053358] d081                      add.l      d1,d0
[0005335a] e788                      lsl.l      #3,d0
[0005335c] 206f 0006                 movea.l    6(a7),a0
[00053360] 3030 0808                 move.w     8(a0,d0.l),d0
[00053364] c07c 8000                 and.w      #$8000,d0
[00053368] 6704                      beq.s      $0005336E
[0005336a] 536f 0002                 subq.w     #1,2(a7)
[0005336e] 302f 0004                 move.w     4(a7),d0
[00053372] b06f 0002                 cmp.w      2(a7),d0
[00053376] 6608                      bne.s      $00053380
[00053378] 302f 0004                 move.w     4(a7),d0
[0005337c] 6000 00d2                 bra        $00053450
[00053380] 302f 000c                 move.w     12(a7),d0
[00053384] 6728                      beq.s      $000533AE
[00053386] 302f 0004                 move.w     4(a7),d0
[0005338a] b06f 000c                 cmp.w      12(a7),d0
[0005338e] 6c06                      bge.s      $00053396
[00053390] 3f6f 000c 0004            move.w     12(a7),4(a7)
[00053396] 322f 0004                 move.w     4(a7),d1
[0005339a] 48c1                      ext.l      d1
[0005339c] 2001                      move.l     d1,d0
[0005339e] d080                      add.l      d0,d0
[000533a0] d081                      add.l      d1,d0
[000533a2] e788                      lsl.l      #3,d0
[000533a4] 206f 0006                 movea.l    6(a7),a0
[000533a8] 3eb0 0800                 move.w     0(a0,d0.l),(a7)
[000533ac] 6004                      bra.s      $000533B2
[000533ae] 3eaf 0004                 move.w     4(a7),(a7)
[000533b2] 6000 0090                 bra        $00053444
[000533b6] 7001                      moveq.l    #1,d0
[000533b8] 3417                      move.w     (a7),d2
[000533ba] 48c2                      ext.l      d2
[000533bc] 2202                      move.l     d2,d1
[000533be] d281                      add.l      d1,d1
[000533c0] d282                      add.l      d2,d1
[000533c2] e789                      lsl.l      #3,d1
[000533c4] 206f 0006                 movea.l    6(a7),a0
[000533c8] c070 1808                 and.w      8(a0,d1.l),d0
[000533cc] 675c                      beq.s      $0005342A
[000533ce] 303c 0080                 move.w     #$0080,d0
[000533d2] 3417                      move.w     (a7),d2
[000533d4] 48c2                      ext.l      d2
[000533d6] 2202                      move.l     d2,d1
[000533d8] d281                      add.l      d1,d1
[000533da] d282                      add.l      d2,d1
[000533dc] e789                      lsl.l      #3,d1
[000533de] 206f 0006                 movea.l    6(a7),a0
[000533e2] c070 1808                 and.w      8(a0,d1.l),d0
[000533e6] 6642                      bne.s      $0005342A
[000533e8] 302f 000a                 move.w     10(a7),d0
[000533ec] 6738                      beq.s      $00053426
[000533ee] 302f 000c                 move.w     12(a7),d0
[000533f2] 672c                      beq.s      $00053420
[000533f4] 322f 000c                 move.w     12(a7),d1
[000533f8] 48c1                      ext.l      d1
[000533fa] 2001                      move.l     d1,d0
[000533fc] d080                      add.l      d0,d0
[000533fe] d081                      add.l      d1,d0
[00053400] e788                      lsl.l      #3,d0
[00053402] 206f 0006                 movea.l    6(a7),a0
[00053406] 3030 0810                 move.w     16(a0,d0.l),d0
[0005340a] 3417                      move.w     (a7),d2
[0005340c] 48c2                      ext.l      d2
[0005340e] 2202                      move.l     d2,d1
[00053410] d281                      add.l      d1,d1
[00053412] d282                      add.l      d2,d1
[00053414] e789                      lsl.l      #3,d1
[00053416] 206f 0006                 movea.l    6(a7),a0
[0005341a] b070 1810                 cmp.w      16(a0,d1.l),d0
[0005341e] 6604                      bne.s      $00053424
[00053420] 3017                      move.w     (a7),d0
[00053422] 602c                      bra.s      $00053450
[00053424] 6004                      bra.s      $0005342A
[00053426] 3017                      move.w     (a7),d0
[00053428] 6026                      bra.s      $00053450
[0005342a] 3217                      move.w     (a7),d1
[0005342c] 48c1                      ext.l      d1
[0005342e] 2001                      move.l     d1,d0
[00053430] d080                      add.l      d0,d0
[00053432] d081                      add.l      d1,d0
[00053434] e788                      lsl.l      #3,d0
[00053436] 206f 0006                 movea.l    6(a7),a0
[0005343a] 3eb0 0800                 move.w     0(a0,d0.l),(a7)
[0005343e] 3017                      move.w     (a7),d0
[00053440] 6602                      bne.s      $00053444
[00053442] 600a                      bra.s      $0005344E
[00053444] 3017                      move.w     (a7),d0
[00053446] b06f 0002                 cmp.w      2(a7),d0
[0005344a] 6f00 ff6a                 ble        $000533B6
[0005344e] 70ff                      moveq.l    #-1,d0
[00053450] 4fef 0012                 lea.l      18(a7),a7
[00053454] 4e75                      rts
Awi_help:
[00053456] 2f0a                      move.l     a2,-(a7)
[00053458] 4fef fff4                 lea.l      -12(a7),a7
[0005345c] 2f48 0008                 move.l     a0,8(a7)
[00053460] 206f 0008                 movea.l    8(a7),a0
[00053464] 2f68 009a 0004            move.l     154(a0),4(a7)
[0005346a] 206f 0008                 movea.l    8(a7),a0
[0005346e] 2ea8 009e                 move.l     158(a0),(a7)
[00053472] 43d7                      lea.l      (a7),a1
[00053474] 7029                      moveq.l    #41,d0
[00053476] 206f 0008                 movea.l    8(a7),a0
[0005347a] 246f 0008                 movea.l    8(a7),a2
[0005347e] 246a 0004                 movea.l    4(a2),a2
[00053482] 4e92                      jsr        (a2)
[00053484] 206f 0004                 movea.l    4(a7),a0
[00053488] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0005348e] 4a40                      tst.w      d0
[00053490] 6650                      bne.s      $000534E2
[00053492] 2057                      movea.l    (a7),a0
[00053494] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0005349a] 4a40                      tst.w      d0
[0005349c] 662e                      bne.s      $000534CC
[0005349e] 2257                      movea.l    (a7),a1
[000534a0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000534a6] 41e8 0220                 lea.l      544(a0),a0
[000534aa] 4eb9 0004 66ea            jsr        Ast_icmp
[000534b0] 4a40                      tst.w      d0
[000534b2] 6718                      beq.s      $000534CC
[000534b4] 2f2f 0008                 move.l     8(a7),-(a7)
[000534b8] 226f 0008                 movea.l    8(a7),a1
[000534bc] 206f 0004                 movea.l    4(a7),a0
[000534c0] 4eb9 0006 21ea            jsr        Aev_STGuideHelp
[000534c6] 584f                      addq.w     #4,a7
[000534c8] 601c                      bra.s      $000534E6
[000534ca] 6014                      bra.s      $000534E0
[000534cc] 2f2f 0008                 move.l     8(a7),-(a7)
[000534d0] 226f 0008                 movea.l    8(a7),a1
[000534d4] 91c8                      suba.l     a0,a0
[000534d6] 4eb9 0006 21ea            jsr        Aev_STGuideHelp
[000534dc] 584f                      addq.w     #4,a7
[000534de] 6006                      bra.s      $000534E6
[000534e0] 6004                      bra.s      $000534E6
[000534e2] 4240                      clr.w      d0
[000534e4] 4e71                      nop
[000534e6] 4fef 000c                 lea.l      12(a7),a7
[000534ea] 245f                      movea.l    (a7)+,a2
[000534ec] 4e75                      rts
Awi_keyACWork:
[000534ee] 4fef fff6                 lea.l      -10(a7),a7
[000534f2] 2f48 0006                 move.l     a0,6(a7)
[000534f6] 3f40 0004                 move.w     d0,4(a7)
[000534fa] 3f41 0002                 move.w     d1,2(a7)
[000534fe] 3ebc ffff                 move.w     #$FFFF,(a7)
[00053502] 302f 0002                 move.w     2(a7),d0
[00053506] c07c 8c00                 and.w      #$8C00,d0
[0005350a] 6600 00ee                 bne        $000535FA
[0005350e] 302f 0002                 move.w     2(a7),d0
[00053512] c07c 00ff                 and.w      #$00FF,d0
[00053516] 4eb9 0008 381a            jsr        isascii
[0005351c] 4a40                      tst.w      d0
[0005351e] 6700 00da                 beq        $000535FA
[00053522] 302f 0002                 move.w     2(a7),d0
[00053526] c07c 00ff                 and.w      #$00FF,d0
[0005352a] 4eb9 0008 37aa            jsr        isalnum
[00053530] 4a40                      tst.w      d0
[00053532] 6700 00c6                 beq        $000535FA
[00053536] 7002                      moveq.l    #2,d0
[00053538] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005353e] c068 04fc                 and.w      1276(a0),d0
[00053542] 672a                      beq.s      $0005356E
[00053544] 7008                      moveq.l    #8,d0
[00053546] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005354c] c068 04fc                 and.w      1276(a0),d0
[00053550] 671c                      beq.s      $0005356E
[00053552] 3017                      move.w     (a7),d0
[00053554] 6a18                      bpl.s      $0005356E
[00053556] 322f 0002                 move.w     2(a7),d1
[0005355a] 827c 8400                 or.w       #$8400,d1
[0005355e] 302f 0004                 move.w     4(a7),d0
[00053562] 206f 0006                 movea.l    6(a7),a0
[00053566] 4eb9 0005 03d0            jsr        Aob_wobkey
[0005356c] 3e80                      move.w     d0,(a7)
[0005356e] 7001                      moveq.l    #1,d0
[00053570] 2079 0010 ee4e            movea.l    ACSblk,a0
[00053576] c068 04fc                 and.w      1276(a0),d0
[0005357a] 671c                      beq.s      $00053598
[0005357c] 3017                      move.w     (a7),d0
[0005357e] 6a18                      bpl.s      $00053598
[00053580] 322f 0002                 move.w     2(a7),d1
[00053584] 827c 8800                 or.w       #$8800,d1
[00053588] 302f 0004                 move.w     4(a7),d0
[0005358c] 206f 0006                 movea.l    6(a7),a0
[00053590] 4eb9 0005 03d0            jsr        Aob_wobkey
[00053596] 3e80                      move.w     d0,(a7)
[00053598] 7002                      moveq.l    #2,d0
[0005359a] 2079 0010 ee4e            movea.l    ACSblk,a0
[000535a0] c068 04fc                 and.w      1276(a0),d0
[000535a4] 672a                      beq.s      $000535D0
[000535a6] 7008                      moveq.l    #8,d0
[000535a8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000535ae] c068 04fc                 and.w      1276(a0),d0
[000535b2] 661c                      bne.s      $000535D0
[000535b4] 3017                      move.w     (a7),d0
[000535b6] 6a18                      bpl.s      $000535D0
[000535b8] 322f 0002                 move.w     2(a7),d1
[000535bc] 827c 8400                 or.w       #$8400,d1
[000535c0] 302f 0004                 move.w     4(a7),d0
[000535c4] 206f 0006                 movea.l    6(a7),a0
[000535c8] 4eb9 0005 03d0            jsr        Aob_wobkey
[000535ce] 3e80                      move.w     d0,(a7)
[000535d0] 7004                      moveq.l    #4,d0
[000535d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000535d8] c068 04fc                 and.w      1276(a0),d0
[000535dc] 671c                      beq.s      $000535FA
[000535de] 3017                      move.w     (a7),d0
[000535e0] 6a18                      bpl.s      $000535FA
[000535e2] 322f 0002                 move.w     2(a7),d1
[000535e6] 827c 8c00                 or.w       #$8C00,d1
[000535ea] 302f 0004                 move.w     4(a7),d0
[000535ee] 206f 0006                 movea.l    6(a7),a0
[000535f2] 4eb9 0005 03d0            jsr        Aob_wobkey
[000535f8] 3e80                      move.w     d0,(a7)
[000535fa] 3017                      move.w     (a7),d0
[000535fc] 4fef 000a                 lea.l      10(a7),a7
[00053600] 4e75                      rts
Awi_keyACTool:
[00053602] 4fef fff6                 lea.l      -10(a7),a7
[00053606] 2f48 0006                 move.l     a0,6(a7)
[0005360a] 3f40 0004                 move.w     d0,4(a7)
[0005360e] 3f41 0002                 move.w     d1,2(a7)
[00053612] 3ebc ffff                 move.w     #$FFFF,(a7)
[00053616] 302f 0002                 move.w     2(a7),d0
[0005361a] c07c 8c00                 and.w      #$8C00,d0
[0005361e] 6600 00f2                 bne        $00053712
[00053622] 302f 0002                 move.w     2(a7),d0
[00053626] c07c 00ff                 and.w      #$00FF,d0
[0005362a] 4eb9 0008 381a            jsr        isascii
[00053630] 4a40                      tst.w      d0
[00053632] 6700 00de                 beq        $00053712
[00053636] 302f 0002                 move.w     2(a7),d0
[0005363a] c07c 00ff                 and.w      #$00FF,d0
[0005363e] 4eb9 0008 37aa            jsr        isalnum
[00053644] 4a40                      tst.w      d0
[00053646] 6700 00ca                 beq        $00053712
[0005364a] 7020                      moveq.l    #32,d0
[0005364c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00053652] c068 04fc                 and.w      1276(a0),d0
[00053656] 672c                      beq.s      $00053684
[00053658] 303c 0080                 move.w     #$0080,d0
[0005365c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00053662] c068 04fc                 and.w      1276(a0),d0
[00053666] 671c                      beq.s      $00053684
[00053668] 3017                      move.w     (a7),d0
[0005366a] 6a18                      bpl.s      $00053684
[0005366c] 322f 0002                 move.w     2(a7),d1
[00053670] 827c 8400                 or.w       #$8400,d1
[00053674] 302f 0004                 move.w     4(a7),d0
[00053678] 206f 0006                 movea.l    6(a7),a0
[0005367c] 4eb9 0005 0334            jsr        Aob_tobkey
[00053682] 3e80                      move.w     d0,(a7)
[00053684] 7010                      moveq.l    #16,d0
[00053686] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005368c] c068 04fc                 and.w      1276(a0),d0
[00053690] 671c                      beq.s      $000536AE
[00053692] 3017                      move.w     (a7),d0
[00053694] 6a18                      bpl.s      $000536AE
[00053696] 322f 0002                 move.w     2(a7),d1
[0005369a] 827c 8800                 or.w       #$8800,d1
[0005369e] 302f 0004                 move.w     4(a7),d0
[000536a2] 206f 0006                 movea.l    6(a7),a0
[000536a6] 4eb9 0005 0334            jsr        Aob_tobkey
[000536ac] 3e80                      move.w     d0,(a7)
[000536ae] 7020                      moveq.l    #32,d0
[000536b0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000536b6] c068 04fc                 and.w      1276(a0),d0
[000536ba] 672c                      beq.s      $000536E8
[000536bc] 303c 0080                 move.w     #$0080,d0
[000536c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000536c6] c068 04fc                 and.w      1276(a0),d0
[000536ca] 661c                      bne.s      $000536E8
[000536cc] 3017                      move.w     (a7),d0
[000536ce] 6a18                      bpl.s      $000536E8
[000536d0] 322f 0002                 move.w     2(a7),d1
[000536d4] 827c 8400                 or.w       #$8400,d1
[000536d8] 302f 0004                 move.w     4(a7),d0
[000536dc] 206f 0006                 movea.l    6(a7),a0
[000536e0] 4eb9 0005 0334            jsr        Aob_tobkey
[000536e6] 3e80                      move.w     d0,(a7)
[000536e8] 7040                      moveq.l    #64,d0
[000536ea] 2079 0010 ee4e            movea.l    ACSblk,a0
[000536f0] c068 04fc                 and.w      1276(a0),d0
[000536f4] 671c                      beq.s      $00053712
[000536f6] 3017                      move.w     (a7),d0
[000536f8] 6a18                      bpl.s      $00053712
[000536fa] 322f 0002                 move.w     2(a7),d1
[000536fe] 827c 8c00                 or.w       #$8C00,d1
[00053702] 302f 0004                 move.w     4(a7),d0
[00053706] 206f 0006                 movea.l    6(a7),a0
[0005370a] 4eb9 0005 0334            jsr        Aob_tobkey
[00053710] 3e80                      move.w     d0,(a7)
[00053712] 3017                      move.w     (a7),d0
[00053714] 4fef 000a                 lea.l      10(a7),a7
[00053718] 4e75                      rts
Awi_keyACSwitch:
[0005371a] 4fef fff6                 lea.l      -10(a7),a7
[0005371e] 2f48 0006                 move.l     a0,6(a7)
[00053722] 3f40 0004                 move.w     d0,4(a7)
[00053726] 3f41 0002                 move.w     d1,2(a7)
[0005372a] 3ebc ffff                 move.w     #$FFFF,(a7)
[0005372e] 302f 0002                 move.w     2(a7),d0
[00053732] c07c 0c00                 and.w      #$0C00,d0
[00053736] 6662                      bne.s      $0005379A
[00053738] 3017                      move.w     (a7),d0
[0005373a] 6a22                      bpl.s      $0005375E
[0005373c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00053742] 3028 04fc                 move.w     1276(a0),d0
[00053746] c07c 0100                 and.w      #$0100,d0
[0005374a] 6712                      beq.s      $0005375E
[0005374c] 322f 0002                 move.w     2(a7),d1
[00053750] 302f 0004                 move.w     4(a7),d0
[00053754] 206f 0006                 movea.l    6(a7),a0
[00053758] 6100 fea8                 bsr        Awi_keyACTool
[0005375c] 3e80                      move.w     d0,(a7)
[0005375e] 3017                      move.w     (a7),d0
[00053760] 6a12                      bpl.s      $00053774
[00053762] 322f 0002                 move.w     2(a7),d1
[00053766] 302f 0004                 move.w     4(a7),d0
[0005376a] 206f 0006                 movea.l    6(a7),a0
[0005376e] 6100 fd7e                 bsr        Awi_keyACWork
[00053772] 3e80                      move.w     d0,(a7)
[00053774] 3017                      move.w     (a7),d0
[00053776] 6a22                      bpl.s      $0005379A
[00053778] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005377e] 3028 04fc                 move.w     1276(a0),d0
[00053782] c07c 0100                 and.w      #$0100,d0
[00053786] 6612                      bne.s      $0005379A
[00053788] 322f 0002                 move.w     2(a7),d1
[0005378c] 302f 0004                 move.w     4(a7),d0
[00053790] 206f 0006                 movea.l    6(a7),a0
[00053794] 6100 fe6c                 bsr        Awi_keyACTool
[00053798] 3e80                      move.w     d0,(a7)
[0005379a] 3017                      move.w     (a7),d0
[0005379c] 4fef 000a                 lea.l      10(a7),a7
[000537a0] 4e75                      rts
Awi_keysend:
[000537a2] 2f0a                      move.l     a2,-(a7)
[000537a4] 4fef feca                 lea.l      -310(a7),a7
[000537a8] 2f48 0132                 move.l     a0,306(a7)
[000537ac] 3f40 0130                 move.w     d0,304(a7)
[000537b0] 3f41 012e                 move.w     d1,302(a7)
[000537b4] 3f7c ffff 0122            move.w     #$FFFF,290(a7)
[000537ba] 206f 0132                 movea.l    306(a7),a0
[000537be] 3028 0056                 move.w     86(a0),d0
[000537c2] c07c 0800                 and.w      #$0800,d0
[000537c6] 670a                      beq.s      $000537D2
[000537c8] 70ff                      moveq.l    #-1,d0
[000537ca] d06f 0122                 add.w      290(a7),d0
[000537ce] 6000 0cec                 bra        $000544BC
[000537d2] 70ff                      moveq.l    #-1,d0
[000537d4] c02f 012f                 and.b      303(a7),d0
[000537d8] b03c 000e                 cmp.b      #$0E,d0
[000537dc] 6610                      bne.s      $000537EE
[000537de] 206f 0132                 movea.l    306(a7),a0
[000537e2] 6100 fc72                 bsr        Awi_help
[000537e6] 302f 0122                 move.w     290(a7),d0
[000537ea] 6000 0cd0                 bra        $000544BC
[000537ee] 7008                      moveq.l    #8,d0
[000537f0] 206f 0132                 movea.l    306(a7),a0
[000537f4] c068 0054                 and.w      84(a0),d0
[000537f8] 6700 0476                 beq        $00053C70
[000537fc] 206f 0132                 movea.l    306(a7),a0
[00053800] 3028 001c                 move.w     28(a0),d0
[00053804] 6a00 046a                 bpl        $00053C70
[00053808] 206f 0132                 movea.l    306(a7),a0
[0005380c] 2f68 0014 0016            move.l     20(a0),22(a7)
[00053812] 202f 0016                 move.l     22(a7),d0
[00053816] 660a                      bne.s      $00053822
[00053818] 70ff                      moveq.l    #-1,d0
[0005381a] d06f 0122                 add.w      290(a7),d0
[0005381e] 6000 0c9c                 bra        $000544BC
[00053822] 206f 0132                 movea.l    306(a7),a0
[00053826] 3028 001c                 move.w     28(a0),d0
[0005382a] 6f14                      ble.s      $00053840
[0005382c] 206f 0132                 movea.l    306(a7),a0
[00053830] 3028 001c                 move.w     28(a0),d0
[00053834] c07c 1000                 and.w      #$1000,d0
[00053838] 6706                      beq.s      $00053840
[0005383a] 4eb9 0004 810e            jsr        Adr_unselect
[00053840] 206f 0132                 movea.l    306(a7),a0
[00053844] 3028 001c                 move.w     28(a0),d0
[00053848] c07c 0fff                 and.w      #$0FFF,d0
[0005384c] 3f40 012c                 move.w     d0,300(a7)
[00053850] 3f40 0128                 move.w     d0,296(a7)
[00053854] 302f 012e                 move.w     302(a7),d0
[00053858] 6a00 034a                 bpl        $00053BA4
[0005385c] 102f 012f                 move.b     303(a7),d0
[00053860] 4880                      ext.w      d0
[00053862] b07c 000f                 cmp.w      #$000F,d0
[00053866] 6200 0332                 bhi        $00053B9A
[0005386a] d040                      add.w      d0,d0
[0005386c] 303b 0006                 move.w     $00053874(pc,d0.w),d0
[00053870] 4efb 0002                 jmp        $00053874(pc,d0.w)
J43:
[00053874] 0326                      dc.w $0326   ; $00053b9a-$00053874
[00053876] 0190                      dc.w $0190   ; $00053a04-$00053874
[00053878] 01ee                      dc.w $01ee   ; $00053a62-$00053874
[0005387a] 0132                      dc.w $0132   ; $000539a6-$00053874
[0005387c] 00d4                      dc.w $00d4   ; $00053948-$00053874
[0005387e] 0326                      dc.w $0326   ; $00053b9a-$00053874
[00053880] 0326                      dc.w $0326   ; $00053b9a-$00053874
[00053882] 0326                      dc.w $0326   ; $00053b9a-$00053874
[00053884] 0326                      dc.w $0326   ; $00053b9a-$00053874
[00053886] 0326                      dc.w $0326   ; $00053b9a-$00053874
[00053888] 002a                      dc.w $002a   ; $0005389e-$00053874
[0005388a] 0326                      dc.w $0326   ; $00053b9a-$00053874
[0005388c] 024c                      dc.w $024c   ; $00053ac0-$00053874
[0005388e] 002a                      dc.w $002a   ; $0005389e-$00053874
[00053890] 0326                      dc.w $0326   ; $00053b9a-$00053874
[00053892] 0020                      dc.w $0020   ; $00053894-$00053874
[00053894] 4eb9 0004 810e            jsr        Adr_unselect
[0005389a] 6000 0304                 bra        $00053BA0
[0005389e] 2079 0010 ee4e            movea.l    ACSblk,a0
[000538a4] 2068 0240                 movea.l    576(a0),a0
[000538a8] b1ef 0132                 cmpa.l     306(a7),a0
[000538ac] 6600 008c                 bne        $0005393A
[000538b0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000538b6] 41e8 0266                 lea.l      614(a0),a0
[000538ba] 2279 0010 ee4e            movea.l    ACSblk,a1
[000538c0] 3029 0010                 move.w     16(a1),d0
[000538c4] 4eb9 0007 5314            jsr        vq_key_s
[000538ca] 4eb9 0004 7e1e            jsr        Adr_start
[000538d0] 6050                      bra.s      $00053922
[000538d2] 322f 012c                 move.w     300(a7),d1
[000538d6] 48c1                      ext.l      d1
[000538d8] 2001                      move.l     d1,d0
[000538da] d080                      add.l      d0,d0
[000538dc] d081                      add.l      d1,d0
[000538de] e788                      lsl.l      #3,d0
[000538e0] 206f 0016                 movea.l    22(a7),a0
[000538e4] 0070 4000 080a            ori.w      #$4000,10(a0,d0.l)
[000538ea] 302f 012c                 move.w     300(a7),d0
[000538ee] 226f 0016                 movea.l    22(a7),a1
[000538f2] 206f 0132                 movea.l    306(a7),a0
[000538f6] 4eb9 0005 046c            jsr        Aob_execute
[000538fc] 322f 012c                 move.w     300(a7),d1
[00053900] 48c1                      ext.l      d1
[00053902] 2001                      move.l     d1,d0
[00053904] d080                      add.l      d0,d0
[00053906] d081                      add.l      d1,d0
[00053908] e788                      lsl.l      #3,d0
[0005390a] 206f 0016                 movea.l    22(a7),a0
[0005390e] 0270 bfff 080a            andi.w     #$BFFF,10(a0,d0.l)
[00053914] 302f 012c                 move.w     300(a7),d0
[00053918] 206f 0132                 movea.l    306(a7),a0
[0005391c] 4eb9 0004 7f76            jsr        Adr_del
[00053922] 4eb9 0004 7e2a            jsr        Adr_next
[00053928] 3f40 012c                 move.w     d0,300(a7)
[0005392c] 6b0a                      bmi.s      $00053938
[0005392e] 302f 012c                 move.w     300(a7),d0
[00053932] c07c 1000                 and.w      #$1000,d0
[00053936] 679a                      beq.s      $000538D2
[00053938] 600a                      bra.s      $00053944
[0005393a] 70ff                      moveq.l    #-1,d0
[0005393c] d06f 0122                 add.w      290(a7),d0
[00053940] 6000 0b7a                 bra        $000544BC
[00053944] 6000 025a                 bra        $00053BA0
[00053948] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005394e] 2068 0240                 movea.l    576(a0),a0
[00053952] b1ef 0132                 cmpa.l     306(a7),a0
[00053956] 6612                      bne.s      $0005396A
[00053958] 4eb9 0004 7e1e            jsr        Adr_start
[0005395e] 4eb9 0004 7e2a            jsr        Adr_next
[00053964] 3f40 012c                 move.w     d0,300(a7)
[00053968] 6004                      bra.s      $0005396E
[0005396a] 426f 012c                 clr.w      300(a7)
[0005396e] 4241                      clr.w      d1
[00053970] 302f 012c                 move.w     300(a7),d0
[00053974] 206f 0132                 movea.l    306(a7),a0
[00053978] 6100 f85c                 bsr        Awi_prevsel
[0005397c] 3f40 012a                 move.w     d0,298(a7)
[00053980] 302f 012a                 move.w     298(a7),d0
[00053984] 6f12                      ble.s      $00053998
[00053986] 322f 012a                 move.w     298(a7),d1
[0005398a] 302f 012c                 move.w     300(a7),d0
[0005398e] 206f 0132                 movea.l    306(a7),a0
[00053992] 6100 f7e4                 bsr        Awi_newsel
[00053996] 600a                      bra.s      $000539A2
[00053998] 70ff                      moveq.l    #-1,d0
[0005399a] d06f 0122                 add.w      290(a7),d0
[0005399e] 6000 0b1c                 bra        $000544BC
[000539a2] 6000 01fc                 bra        $00053BA0
[000539a6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000539ac] 2068 0240                 movea.l    576(a0),a0
[000539b0] b1ef 0132                 cmpa.l     306(a7),a0
[000539b4] 6612                      bne.s      $000539C8
[000539b6] 4eb9 0004 7e1e            jsr        Adr_start
[000539bc] 4eb9 0004 7e2a            jsr        Adr_next
[000539c2] 3f40 012c                 move.w     d0,300(a7)
[000539c6] 6004                      bra.s      $000539CC
[000539c8] 426f 012c                 clr.w      300(a7)
[000539cc] 4241                      clr.w      d1
[000539ce] 302f 012c                 move.w     300(a7),d0
[000539d2] 206f 0132                 movea.l    306(a7),a0
[000539d6] 6100 f948                 bsr        Awi_nextsel
[000539da] 3f40 012a                 move.w     d0,298(a7)
[000539de] 302f 012a                 move.w     298(a7),d0
[000539e2] 6f12                      ble.s      $000539F6
[000539e4] 322f 012a                 move.w     298(a7),d1
[000539e8] 302f 012c                 move.w     300(a7),d0
[000539ec] 206f 0132                 movea.l    306(a7),a0
[000539f0] 6100 f786                 bsr        Awi_newsel
[000539f4] 600a                      bra.s      $00053A00
[000539f6] 70ff                      moveq.l    #-1,d0
[000539f8] d06f 0122                 add.w      290(a7),d0
[000539fc] 6000 0abe                 bra        $000544BC
[00053a00] 6000 019e                 bra        $00053BA0
[00053a04] 2079 0010 ee4e            movea.l    ACSblk,a0
[00053a0a] 2068 0240                 movea.l    576(a0),a0
[00053a0e] b1ef 0132                 cmpa.l     306(a7),a0
[00053a12] 6612                      bne.s      $00053A26
[00053a14] 4eb9 0004 7e1e            jsr        Adr_start
[00053a1a] 4eb9 0004 7e2a            jsr        Adr_next
[00053a20] 3f40 012c                 move.w     d0,300(a7)
[00053a24] 6004                      bra.s      $00053A2A
[00053a26] 426f 012c                 clr.w      300(a7)
[00053a2a] 7201                      moveq.l    #1,d1
[00053a2c] 302f 012c                 move.w     300(a7),d0
[00053a30] 206f 0132                 movea.l    306(a7),a0
[00053a34] 6100 f7a0                 bsr        Awi_prevsel
[00053a38] 3f40 012a                 move.w     d0,298(a7)
[00053a3c] 302f 012a                 move.w     298(a7),d0
[00053a40] 6f12                      ble.s      $00053A54
[00053a42] 322f 012a                 move.w     298(a7),d1
[00053a46] 302f 012c                 move.w     300(a7),d0
[00053a4a] 206f 0132                 movea.l    306(a7),a0
[00053a4e] 6100 f728                 bsr        Awi_newsel
[00053a52] 600a                      bra.s      $00053A5E
[00053a54] 70ff                      moveq.l    #-1,d0
[00053a56] d06f 0122                 add.w      290(a7),d0
[00053a5a] 6000 0a60                 bra        $000544BC
[00053a5e] 6000 0140                 bra        $00053BA0
[00053a62] 2079 0010 ee4e            movea.l    ACSblk,a0
[00053a68] 2068 0240                 movea.l    576(a0),a0
[00053a6c] b1ef 0132                 cmpa.l     306(a7),a0
[00053a70] 6612                      bne.s      $00053A84
[00053a72] 4eb9 0004 7e1e            jsr        Adr_start
[00053a78] 4eb9 0004 7e2a            jsr        Adr_next
[00053a7e] 3f40 012c                 move.w     d0,300(a7)
[00053a82] 6004                      bra.s      $00053A88
[00053a84] 426f 012c                 clr.w      300(a7)
[00053a88] 7201                      moveq.l    #1,d1
[00053a8a] 302f 012c                 move.w     300(a7),d0
[00053a8e] 206f 0132                 movea.l    306(a7),a0
[00053a92] 6100 f88c                 bsr        Awi_nextsel
[00053a96] 3f40 012a                 move.w     d0,298(a7)
[00053a9a] 302f 012a                 move.w     298(a7),d0
[00053a9e] 6f12                      ble.s      $00053AB2
[00053aa0] 322f 012a                 move.w     298(a7),d1
[00053aa4] 302f 012c                 move.w     300(a7),d0
[00053aa8] 206f 0132                 movea.l    306(a7),a0
[00053aac] 6100 f6ca                 bsr        Awi_newsel
[00053ab0] 600a                      bra.s      $00053ABC
[00053ab2] 70ff                      moveq.l    #-1,d0
[00053ab4] d06f 0122                 add.w      290(a7),d0
[00053ab8] 6000 0a02                 bra        $000544BC
[00053abc] 6000 00e2                 bra        $00053BA0
[00053ac0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00053ac6] 2068 0240                 movea.l    576(a0),a0
[00053aca] b1ef 0132                 cmpa.l     306(a7),a0
[00053ace] 6600 009a                 bne        $00053B6A
[00053ad2] 302f 012e                 move.w     302(a7),d0
[00053ad6] c07c 0300                 and.w      #$0300,d0
[00053ada] 672c                      beq.s      $00053B08
[00053adc] 206f 0016                 movea.l    22(a7),a0
[00053ae0] 3f68 0004 012c            move.w     4(a0),300(a7)
[00053ae6] 322f 012c                 move.w     300(a7),d1
[00053aea] 48c1                      ext.l      d1
[00053aec] 2001                      move.l     d1,d0
[00053aee] d080                      add.l      d0,d0
[00053af0] d081                      add.l      d1,d0
[00053af2] e788                      lsl.l      #3,d0
[00053af4] 206f 0016                 movea.l    22(a7),a0
[00053af8] 3030 0808                 move.w     8(a0,d0.l),d0
[00053afc] c07c 8000                 and.w      #$8000,d0
[00053b00] 6704                      beq.s      $00053B06
[00053b02] 536f 012c                 subq.w     #1,300(a7)
[00053b06] 600a                      bra.s      $00053B12
[00053b08] 206f 0016                 movea.l    22(a7),a0
[00053b0c] 3f68 0002 012c            move.w     2(a0),300(a7)
[00053b12] 302f 012c                 move.w     300(a7),d0
[00053b16] 6f46                      ble.s      $00053B5E
[00053b18] 7001                      moveq.l    #1,d0
[00053b1a] 342f 012c                 move.w     300(a7),d2
[00053b1e] 48c2                      ext.l      d2
[00053b20] 2202                      move.l     d2,d1
[00053b22] d281                      add.l      d1,d1
[00053b24] d282                      add.l      d2,d1
[00053b26] e789                      lsl.l      #3,d1
[00053b28] 206f 0016                 movea.l    22(a7),a0
[00053b2c] c070 1808                 and.w      8(a0,d1.l),d0
[00053b30] 672c                      beq.s      $00053B5E
[00053b32] 303c 0080                 move.w     #$0080,d0
[00053b36] 342f 012c                 move.w     300(a7),d2
[00053b3a] 48c2                      ext.l      d2
[00053b3c] 2202                      move.l     d2,d1
[00053b3e] d281                      add.l      d1,d1
[00053b40] d282                      add.l      d2,d1
[00053b42] e789                      lsl.l      #3,d1
[00053b44] 206f 0016                 movea.l    22(a7),a0
[00053b48] c070 1808                 and.w      8(a0,d1.l),d0
[00053b4c] 6610                      bne.s      $00053B5E
[00053b4e] 322f 012c                 move.w     300(a7),d1
[00053b52] 70ff                      moveq.l    #-1,d0
[00053b54] 206f 0132                 movea.l    306(a7),a0
[00053b58] 6100 f61e                 bsr        Awi_newsel
[00053b5c] 600a                      bra.s      $00053B68
[00053b5e] 70ff                      moveq.l    #-1,d0
[00053b60] d06f 0122                 add.w      290(a7),d0
[00053b64] 6000 0956                 bra        $000544BC
[00053b68] 602e                      bra.s      $00053B98
[00053b6a] 302f 012e                 move.w     302(a7),d0
[00053b6e] c07c 0300                 and.w      #$0300,d0
[00053b72] 6714                      beq.s      $00053B88
[00053b74] 303c 03e8                 move.w     #$03E8,d0
[00053b78] 206f 0132                 movea.l    306(a7),a0
[00053b7c] 226f 0132                 movea.l    306(a7),a1
[00053b80] 2269 0082                 movea.l    130(a1),a1
[00053b84] 4e91                      jsr        (a1)
[00053b86] 6010                      bra.s      $00053B98
[00053b88] 4240                      clr.w      d0
[00053b8a] 206f 0132                 movea.l    306(a7),a0
[00053b8e] 226f 0132                 movea.l    306(a7),a1
[00053b92] 2269 0082                 movea.l    130(a1),a1
[00053b96] 4e91                      jsr        (a1)
[00053b98] 6006                      bra.s      $00053BA0
[00053b9a] 3f7c ffff 012c            move.w     #$FFFF,300(a7)
[00053ba0] 6000 00c6                 bra        $00053C68
[00053ba4] 206f 0016                 movea.l    22(a7),a0
[00053ba8] 3f68 0002 012c            move.w     2(a0),300(a7)
[00053bae] 6000 00b0                 bra        $00053C60
[00053bb2] 303c 0080                 move.w     #$0080,d0
[00053bb6] 342f 012c                 move.w     300(a7),d2
[00053bba] 48c2                      ext.l      d2
[00053bbc] 2202                      move.l     d2,d1
[00053bbe] d281                      add.l      d1,d1
[00053bc0] d282                      add.l      d2,d1
[00053bc2] e789                      lsl.l      #3,d1
[00053bc4] 206f 0016                 movea.l    22(a7),a0
[00053bc8] c070 1808                 and.w      8(a0,d1.l),d0
[00053bcc] 6600 007a                 bne.w      $00053C48
[00053bd0] 43ef 001e                 lea.l      30(a7),a1
[00053bd4] 302f 012c                 move.w     300(a7),d0
[00053bd8] 206f 0016                 movea.l    22(a7),a0
[00053bdc] 4eb9 0005 11da            jsr        Aob_gettext
[00053be2] 3f40 0124                 move.w     d0,292(a7)
[00053be6] 6f60                      ble.s      $00053C48
[00053be8] 426f 0126                 clr.w      294(a7)
[00053bec] 6004                      bra.s      $00053BF2
[00053bee] 526f 0126                 addq.w     #1,294(a7)
[00053bf2] 322f 0126                 move.w     294(a7),d1
[00053bf6] 1037 101e                 move.b     30(a7,d1.w),d0
[00053bfa] 4880                      ext.w      d0
[00053bfc] 4eb9 0008 37aa            jsr        isalnum
[00053c02] 4a40                      tst.w      d0
[00053c04] 660a                      bne.s      $00053C10
[00053c06] 302f 0126                 move.w     294(a7),d0
[00053c0a] b06f 0124                 cmp.w      292(a7),d0
[00053c0e] 6dde                      blt.s      $00053BEE
[00053c10] 302f 0126                 move.w     294(a7),d0
[00053c14] b06f 0124                 cmp.w      292(a7),d0
[00053c18] 6c2e                      bge.s      $00053C48
[00053c1a] 102f 012f                 move.b     303(a7),d0
[00053c1e] 4eb9 0004 64b6            jsr        Ach_toupper
[00053c24] 1f00                      move.b     d0,-(a7)
[00053c26] 322f 0128                 move.w     296(a7),d1
[00053c2a] 1037 1020                 move.b     32(a7,d1.w),d0
[00053c2e] 4eb9 0004 64b6            jsr        Ach_toupper
[00053c34] b01f                      cmp.b      (a7)+,d0
[00053c36] 6610                      bne.s      $00053C48
[00053c38] 322f 012c                 move.w     300(a7),d1
[00053c3c] 70ff                      moveq.l    #-1,d0
[00053c3e] 206f 0132                 movea.l    306(a7),a0
[00053c42] 6100 f534                 bsr        Awi_newsel
[00053c46] 6020                      bra.s      $00053C68
[00053c48] 322f 012c                 move.w     300(a7),d1
[00053c4c] 48c1                      ext.l      d1
[00053c4e] 2001                      move.l     d1,d0
[00053c50] d080                      add.l      d0,d0
[00053c52] d081                      add.l      d1,d0
[00053c54] e788                      lsl.l      #3,d0
[00053c56] 206f 0016                 movea.l    22(a7),a0
[00053c5a] 3f70 0800 012c            move.w     0(a0,d0.l),300(a7)
[00053c60] 302f 012c                 move.w     300(a7),d0
[00053c64] 6e00 ff4c                 bgt        $00053BB2
[00053c68] 302f 0122                 move.w     290(a7),d0
[00053c6c] 6000 084e                 bra        $000544BC
[00053c70] 486f 012c                 pea.l      300(a7)
[00053c74] 486f 0016                 pea.l      22(a7)
[00053c78] 43ef 001e                 lea.l      30(a7),a1
[00053c7c] 206f 013a                 movea.l    314(a7),a0
[00053c80] 6100 f170                 bsr        Awi_find_edit
[00053c84] 504f                      addq.w     #8,a7
[00053c86] 3f6f 012c 0128            move.w     300(a7),296(a7)
[00053c8c] 202f 0016                 move.l     22(a7),d0
[00053c90] 663c                      bne.s      $00053CCE
[00053c92] 206f 0132                 movea.l    306(a7),a0
[00053c96] 2f68 0014 0016            move.l     20(a0),22(a7)
[00053c9c] 202f 0016                 move.l     22(a7),d0
[00053ca0] 6622                      bne.s      $00053CC4
[00053ca2] 206f 0132                 movea.l    306(a7),a0
[00053ca6] 2f68 0018 0016            move.l     24(a0),22(a7)
[00053cac] 202f 0016                 move.l     22(a7),d0
[00053cb0] 660c                      bne.s      $00053CBE
[00053cb2] 70ff                      moveq.l    #-1,d0
[00053cb4] d06f 0122                 add.w      290(a7),d0
[00053cb8] 6000 0802                 bra        $000544BC
[00053cbc] 6004                      bra.s      $00053CC2
[00053cbe] 42af 0012                 clr.l      18(a7)
[00053cc2] 600a                      bra.s      $00053CCE
[00053cc4] 206f 0132                 movea.l    306(a7),a0
[00053cc8] 2f68 0018 0012            move.l     24(a0),18(a7)
[00053cce] 0c2f 000d 012f            cmpi.b     #$0D,303(a7)
[00053cd4] 670a                      beq.s      $00053CE0
[00053cd6] 0c2f 000a 012f            cmpi.b     #$0A,303(a7)
[00053cdc] 6600 00b6                 bne        $00053D94
[00053ce0] 7202                      moveq.l    #2,d1
[00053ce2] 70ff                      moveq.l    #-1,d0
[00053ce4] 206f 0016                 movea.l    22(a7),a0
[00053ce8] 4eb9 0005 0e62            jsr        Aob_findflag
[00053cee] 3f40 012a                 move.w     d0,298(a7)
[00053cf2] 302f 012a                 move.w     298(a7),d0
[00053cf6] 6b1c                      bmi.s      $00053D14
[00053cf8] 303c 0080                 move.w     #$0080,d0
[00053cfc] 342f 012a                 move.w     298(a7),d2
[00053d00] 48c2                      ext.l      d2
[00053d02] 2202                      move.l     d2,d1
[00053d04] d281                      add.l      d1,d1
[00053d06] d282                      add.l      d2,d1
[00053d08] e789                      lsl.l      #3,d1
[00053d0a] 206f 0016                 movea.l    22(a7),a0
[00053d0e] c070 1808                 and.w      8(a0,d1.l),d0
[00053d12] 6766                      beq.s      $00053D7A
[00053d14] 202f 0012                 move.l     18(a7),d0
[00053d18] 6754                      beq.s      $00053D6E
[00053d1a] 7202                      moveq.l    #2,d1
[00053d1c] 70ff                      moveq.l    #-1,d0
[00053d1e] 206f 0012                 movea.l    18(a7),a0
[00053d22] 4eb9 0005 0e62            jsr        Aob_findflag
[00053d28] 3f40 012a                 move.w     d0,298(a7)
[00053d2c] 302f 012a                 move.w     298(a7),d0
[00053d30] 6b1c                      bmi.s      $00053D4E
[00053d32] 303c 0080                 move.w     #$0080,d0
[00053d36] 342f 012a                 move.w     298(a7),d2
[00053d3a] 48c2                      ext.l      d2
[00053d3c] 2202                      move.l     d2,d1
[00053d3e] d281                      add.l      d1,d1
[00053d40] d282                      add.l      d2,d1
[00053d42] e789                      lsl.l      #3,d1
[00053d44] 206f 0016                 movea.l    22(a7),a0
[00053d48] c070 1808                 and.w      8(a0,d1.l),d0
[00053d4c] 670c                      beq.s      $00053D5A
[00053d4e] 70ff                      moveq.l    #-1,d0
[00053d50] d06f 0122                 add.w      290(a7),d0
[00053d54] 6000 0766                 bra        $000544BC
[00053d58] 6012                      bra.s      $00053D6C
[00053d5a] 302f 012a                 move.w     298(a7),d0
[00053d5e] 226f 0012                 movea.l    18(a7),a1
[00053d62] 206f 0132                 movea.l    306(a7),a0
[00053d66] 4eb9 0005 046c            jsr        Aob_execute
[00053d6c] 600a                      bra.s      $00053D78
[00053d6e] 70ff                      moveq.l    #-1,d0
[00053d70] d06f 0122                 add.w      290(a7),d0
[00053d74] 6000 0746                 bra        $000544BC
[00053d78] 6012                      bra.s      $00053D8C
[00053d7a] 302f 012a                 move.w     298(a7),d0
[00053d7e] 226f 0016                 movea.l    22(a7),a1
[00053d82] 206f 0132                 movea.l    306(a7),a0
[00053d86] 4eb9 0005 046c            jsr        Aob_execute
[00053d8c] 302f 012a                 move.w     298(a7),d0
[00053d90] 6000 072a                 bra        $000544BC
[00053d94] 0c2f 0009 012f            cmpi.b     #$09,303(a7)
[00053d9a] 6656                      bne.s      $00053DF2
[00053d9c] 302f 012e                 move.w     302(a7),d0
[00053da0] c07c 0400                 and.w      #$0400,d0
[00053da4] 6734                      beq.s      $00053DDA
[00053da6] 226f 0016                 movea.l    22(a7),a1
[00053daa] 206f 0132                 movea.l    306(a7),a0
[00053dae] 6100 eeec                 bsr        Aob_chdef
[00053db2] 4a40                      tst.w      d0
[00053db4] 6716                      beq.s      $00053DCC
[00053db6] 202f 0012                 move.l     18(a7),d0
[00053dba] 6714                      beq.s      $00053DD0
[00053dbc] 226f 0012                 movea.l    18(a7),a1
[00053dc0] 206f 0132                 movea.l    306(a7),a0
[00053dc4] 6100 eed6                 bsr        Aob_chdef
[00053dc8] 4a40                      tst.w      d0
[00053dca] 6604                      bne.s      $00053DD0
[00053dcc] 536f 0122                 subq.w     #1,290(a7)
[00053dd0] 302f 0122                 move.w     290(a7),d0
[00053dd4] 6000 06e6                 bra        $000544BC
[00053dd8] 6018                      bra.s      $00053DF2
[00053dda] 302f 012e                 move.w     302(a7),d0
[00053dde] c07c 0300                 and.w      #$0300,d0
[00053de2] 6708                      beq.s      $00053DEC
[00053de4] 3f7c 8001 012e            move.w     #$8001,302(a7)
[00053dea] 6006                      bra.s      $00053DF2
[00053dec] 3f7c 8002 012e            move.w     #$8002,302(a7)
[00053df2] 486f 012c                 pea.l      300(a7)
[00053df6] 486f 0016                 pea.l      22(a7)
[00053dfa] 43ef 001e                 lea.l      30(a7),a1
[00053dfe] 206f 013a                 movea.l    314(a7),a0
[00053e02] 6100 efee                 bsr        Awi_find_edit
[00053e06] 504f                      addq.w     #8,a7
[00053e08] 4a40                      tst.w      d0
[00053e0a] 662e                      bne.s      $00053E3A
[00053e0c] 322f 012e                 move.w     302(a7),d1
[00053e10] 302f 0130                 move.w     304(a7),d0
[00053e14] 206f 0132                 movea.l    306(a7),a0
[00053e18] 6100 f900                 bsr        Awi_keyACSwitch
[00053e1c] 3f40 012c                 move.w     d0,300(a7)
[00053e20] 302f 012c                 move.w     300(a7),d0
[00053e24] 6a0c                      bpl.s      $00053E32
[00053e26] 70ff                      moveq.l    #-1,d0
[00053e28] d06f 0122                 add.w      290(a7),d0
[00053e2c] 6000 068e                 bra        $000544BC
[00053e30] 6008                      bra.s      $00053E3A
[00053e32] 302f 012c                 move.w     300(a7),d0
[00053e36] 6000 0684                 bra        $000544BC
[00053e3a] 322f 012c                 move.w     300(a7),d1
[00053e3e] 48c1                      ext.l      d1
[00053e40] 2001                      move.l     d1,d0
[00053e42] d080                      add.l      d0,d0
[00053e44] d081                      add.l      d1,d0
[00053e46] e788                      lsl.l      #3,d0
[00053e48] 206f 0016                 movea.l    22(a7),a0
[00053e4c] 2f70 080c 000e            move.l     12(a0,d0.l),14(a7)
[00053e52] 2079 000e 0cb2            movea.l    open_dialog,a0
[00053e58] b1ef 0132                 cmpa.l     306(a7),a0
[00053e5c] 6704                      beq.s      $00053E62
[00053e5e] 6100 d528                 bsr        Awi_diaend
[00053e62] 2f6f 0132 0004            move.l     306(a7),4(a7)
[00053e68] 322f 012c                 move.w     300(a7),d1
[00053e6c] 48c1                      ext.l      d1
[00053e6e] 2001                      move.l     d1,d0
[00053e70] d080                      add.l      d0,d0
[00053e72] d081                      add.l      d1,d0
[00053e74] e788                      lsl.l      #3,d0
[00053e76] 206f 0016                 movea.l    22(a7),a0
[00053e7a] d1c0                      adda.l     d0,a0
[00053e7c] 2f48 0008                 move.l     a0,8(a7)
[00053e80] 3f6f 012c 000c            move.w     300(a7),12(a7)
[00053e86] 43ef 0004                 lea.l      4(a7),a1
[00053e8a] 7009                      moveq.l    #9,d0
[00053e8c] 342f 012c                 move.w     300(a7),d2
[00053e90] 48c2                      ext.l      d2
[00053e92] 2202                      move.l     d2,d1
[00053e94] d281                      add.l      d1,d1
[00053e96] d282                      add.l      d2,d1
[00053e98] e789                      lsl.l      #3,d1
[00053e9a] 206f 0016                 movea.l    22(a7),a0
[00053e9e] d1c1                      adda.l     d1,a0
[00053ea0] 246f 000e                 movea.l    14(a7),a2
[00053ea4] 246a 0008                 movea.l    8(a2),a2
[00053ea8] 4e92                      jsr        (a2)
[00053eaa] 302f 012e                 move.w     302(a7),d0
[00053eae] 6a00 05c6                 bpl        $00054476
[00053eb2] 102f 012f                 move.b     303(a7),d0
[00053eb6] 4880                      ext.w      d0
[00053eb8] b07c 001f                 cmp.w      #$001F,d0
[00053ebc] 6700 0218                 beq        $000540D6
[00053ec0] 6e4a                      bgt.s      $00053F0C
[00053ec2] b07c 001b                 cmp.w      #$001B,d0
[00053ec6] 6200 058c                 bhi        $00054454
[00053eca] d040                      add.w      d0,d0
[00053ecc] 303b 0006                 move.w     $00053ED4(pc,d0.w),d0
[00053ed0] 4efb 0002                 jmp        $00053ED4(pc,d0.w)
J44:
[00053ed4] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053ed6] 02b2                      dc.w $02b2   ; $00054186-$00053ed4
[00053ed8] 033a                      dc.w $033a   ; $0005420e-$00053ed4
[00053eda] 006e                      dc.w $006e   ; $00053f42-$00053ed4
[00053edc] 00f4                      dc.w $00f4   ; $00053fc8-$00053ed4
[00053ede] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053ee0] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053ee2] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053ee4] 017a                      dc.w $017a   ; $0005404e-$00053ed4
[00053ee6] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053ee8] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053eea] 03b0                      dc.w $03b0   ; $00054284-$00053ed4
[00053eec] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053eee] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053ef0] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053ef2] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053ef4] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053ef6] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053ef8] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053efa] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053efc] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053efe] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053f00] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053f02] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053f04] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053f06] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053f08] 0580                      dc.w $0580   ; $00054454-$00053ed4
[00053f0a] 028a                      dc.w $028a   ; $0005415e-$00053ed4
[00053f0c] b07c                      dc.w $b07c   ; $0004ef50-$00053ed4
[00053f0e] 0063 6700                 ori.w      #$6700,-(a3)
[00053f12] 039a                      bclr       d1,(a2)+
[00053f14] 6e1a                      bgt.s      $00053F30
[00053f16] 907c 0043                 sub.w      #$0043,d0
[00053f1a] 6700 0390                 beq        $000542AC
[00053f1e] 907c 0013                 sub.w      #$0013,d0
[00053f22] 6700 04b6                 beq        $000543DA
[00053f26] 5540                      subq.w     #2,d0
[00053f28] 6700 0382                 beq        $000542AC
[00053f2c] 6000 0526                 bra        $00054454
[00053f30] 907c 0076                 sub.w      #$0076,d0
[00053f34] 6700 04a4                 beq        $000543DA
[00053f38] 5540                      subq.w     #2,d0
[00053f3a] 6700 0370                 beq        $000542AC
[00053f3e] 6000 0514                 bra        $00054454
[00053f42] 302f 012e                 move.w     302(a7),d0
[00053f46] c07c 0300                 and.w      #$0300,d0
[00053f4a] 6724                      beq.s      $00053F70
[00053f4c] 93c9                      suba.l     a1,a1
[00053f4e] 700f                      moveq.l    #15,d0
[00053f50] 342f 012c                 move.w     300(a7),d2
[00053f54] 48c2                      ext.l      d2
[00053f56] 2202                      move.l     d2,d1
[00053f58] d281                      add.l      d1,d1
[00053f5a] d282                      add.l      d2,d1
[00053f5c] e789                      lsl.l      #3,d1
[00053f5e] 206f 0016                 movea.l    22(a7),a0
[00053f62] d1c1                      adda.l     d1,a0
[00053f64] 246f 000e                 movea.l    14(a7),a2
[00053f68] 246a 0008                 movea.l    8(a2),a2
[00053f6c] 4e92                      jsr        (a2)
[00053f6e] 6054                      bra.s      $00053FC4
[00053f70] 302f 012e                 move.w     302(a7),d0
[00053f74] c07c 0400                 and.w      #$0400,d0
[00053f78] 6726                      beq.s      $00053FA0
[00053f7a] 93c9                      suba.l     a1,a1
[00053f7c] 303c 02be                 move.w     #$02BE,d0
[00053f80] 342f 012c                 move.w     300(a7),d2
[00053f84] 48c2                      ext.l      d2
[00053f86] 2202                      move.l     d2,d1
[00053f88] d281                      add.l      d1,d1
[00053f8a] d282                      add.l      d2,d1
[00053f8c] e789                      lsl.l      #3,d1
[00053f8e] 206f 0016                 movea.l    22(a7),a0
[00053f92] d1c1                      adda.l     d1,a0
[00053f94] 246f 000e                 movea.l    14(a7),a2
[00053f98] 246a 0008                 movea.l    8(a2),a2
[00053f9c] 4e92                      jsr        (a2)
[00053f9e] 6024                      bra.s      $00053FC4
[00053fa0] 93c9                      suba.l     a1,a1
[00053fa2] 303c 02bc                 move.w     #$02BC,d0
[00053fa6] 342f 012c                 move.w     300(a7),d2
[00053faa] 48c2                      ext.l      d2
[00053fac] 2202                      move.l     d2,d1
[00053fae] d281                      add.l      d1,d1
[00053fb0] d282                      add.l      d2,d1
[00053fb2] e789                      lsl.l      #3,d1
[00053fb4] 206f 0016                 movea.l    22(a7),a0
[00053fb8] d1c1                      adda.l     d1,a0
[00053fba] 246f 000e                 movea.l    14(a7),a2
[00053fbe] 246a 0008                 movea.l    8(a2),a2
[00053fc2] 4e92                      jsr        (a2)
[00053fc4] 6000 04ae                 bra        $00054474
[00053fc8] 302f 012e                 move.w     302(a7),d0
[00053fcc] c07c 0300                 and.w      #$0300,d0
[00053fd0] 6724                      beq.s      $00053FF6
[00053fd2] 93c9                      suba.l     a1,a1
[00053fd4] 700e                      moveq.l    #14,d0
[00053fd6] 342f 012c                 move.w     300(a7),d2
[00053fda] 48c2                      ext.l      d2
[00053fdc] 2202                      move.l     d2,d1
[00053fde] d281                      add.l      d1,d1
[00053fe0] d282                      add.l      d2,d1
[00053fe2] e789                      lsl.l      #3,d1
[00053fe4] 206f 0016                 movea.l    22(a7),a0
[00053fe8] d1c1                      adda.l     d1,a0
[00053fea] 246f 000e                 movea.l    14(a7),a2
[00053fee] 246a 0008                 movea.l    8(a2),a2
[00053ff2] 4e92                      jsr        (a2)
[00053ff4] 6054                      bra.s      $0005404A
[00053ff6] 302f 012e                 move.w     302(a7),d0
[00053ffa] c07c 0400                 and.w      #$0400,d0
[00053ffe] 6726                      beq.s      $00054026
[00054000] 93c9                      suba.l     a1,a1
[00054002] 303c 02bf                 move.w     #$02BF,d0
[00054006] 342f 012c                 move.w     300(a7),d2
[0005400a] 48c2                      ext.l      d2
[0005400c] 2202                      move.l     d2,d1
[0005400e] d281                      add.l      d1,d1
[00054010] d282                      add.l      d2,d1
[00054012] e789                      lsl.l      #3,d1
[00054014] 206f 0016                 movea.l    22(a7),a0
[00054018] d1c1                      adda.l     d1,a0
[0005401a] 246f 000e                 movea.l    14(a7),a2
[0005401e] 246a 0008                 movea.l    8(a2),a2
[00054022] 4e92                      jsr        (a2)
[00054024] 6024                      bra.s      $0005404A
[00054026] 93c9                      suba.l     a1,a1
[00054028] 303c 02bd                 move.w     #$02BD,d0
[0005402c] 342f 012c                 move.w     300(a7),d2
[00054030] 48c2                      ext.l      d2
[00054032] 2202                      move.l     d2,d1
[00054034] d281                      add.l      d1,d1
[00054036] d282                      add.l      d2,d1
[00054038] e789                      lsl.l      #3,d1
[0005403a] 206f 0016                 movea.l    22(a7),a0
[0005403e] d1c1                      adda.l     d1,a0
[00054040] 246f 000e                 movea.l    14(a7),a2
[00054044] 246a 0008                 movea.l    8(a2),a2
[00054048] 4e92                      jsr        (a2)
[0005404a] 6000 0428                 bra        $00054474
[0005404e] 302f 012e                 move.w     302(a7),d0
[00054052] c07c 0300                 and.w      #$0300,d0
[00054056] 6726                      beq.s      $0005407E
[00054058] 93c9                      suba.l     a1,a1
[0005405a] 303c 02c6                 move.w     #$02C6,d0
[0005405e] 342f 012c                 move.w     300(a7),d2
[00054062] 48c2                      ext.l      d2
[00054064] 2202                      move.l     d2,d1
[00054066] d281                      add.l      d1,d1
[00054068] d282                      add.l      d2,d1
[0005406a] e789                      lsl.l      #3,d1
[0005406c] 206f 0016                 movea.l    22(a7),a0
[00054070] d1c1                      adda.l     d1,a0
[00054072] 246f 000e                 movea.l    14(a7),a2
[00054076] 246a 0008                 movea.l    8(a2),a2
[0005407a] 4e92                      jsr        (a2)
[0005407c] 6054                      bra.s      $000540D2
[0005407e] 302f 012e                 move.w     302(a7),d0
[00054082] c07c 0400                 and.w      #$0400,d0
[00054086] 6726                      beq.s      $000540AE
[00054088] 93c9                      suba.l     a1,a1
[0005408a] 303c 02c5                 move.w     #$02C5,d0
[0005408e] 342f 012c                 move.w     300(a7),d2
[00054092] 48c2                      ext.l      d2
[00054094] 2202                      move.l     d2,d1
[00054096] d281                      add.l      d1,d1
[00054098] d282                      add.l      d2,d1
[0005409a] e789                      lsl.l      #3,d1
[0005409c] 206f 0016                 movea.l    22(a7),a0
[000540a0] d1c1                      adda.l     d1,a0
[000540a2] 246f 000e                 movea.l    14(a7),a2
[000540a6] 246a 0008                 movea.l    8(a2),a2
[000540aa] 4e92                      jsr        (a2)
[000540ac] 6024                      bra.s      $000540D2
[000540ae] 93c9                      suba.l     a1,a1
[000540b0] 303c 02c4                 move.w     #$02C4,d0
[000540b4] 342f 012c                 move.w     300(a7),d2
[000540b8] 48c2                      ext.l      d2
[000540ba] 2202                      move.l     d2,d1
[000540bc] d281                      add.l      d1,d1
[000540be] d282                      add.l      d2,d1
[000540c0] e789                      lsl.l      #3,d1
[000540c2] 206f 0016                 movea.l    22(a7),a0
[000540c6] d1c1                      adda.l     d1,a0
[000540c8] 246f 000e                 movea.l    14(a7),a2
[000540cc] 246a 0008                 movea.l    8(a2),a2
[000540d0] 4e92                      jsr        (a2)
[000540d2] 6000 03a0                 bra        $00054474
[000540d6] 302f 012e                 move.w     302(a7),d0
[000540da] c07c 0300                 and.w      #$0300,d0
[000540de] 6726                      beq.s      $00054106
[000540e0] 93c9                      suba.l     a1,a1
[000540e2] 303c 02c9                 move.w     #$02C9,d0
[000540e6] 342f 012c                 move.w     300(a7),d2
[000540ea] 48c2                      ext.l      d2
[000540ec] 2202                      move.l     d2,d1
[000540ee] d281                      add.l      d1,d1
[000540f0] d282                      add.l      d2,d1
[000540f2] e789                      lsl.l      #3,d1
[000540f4] 206f 0016                 movea.l    22(a7),a0
[000540f8] d1c1                      adda.l     d1,a0
[000540fa] 246f 000e                 movea.l    14(a7),a2
[000540fe] 246a 0008                 movea.l    8(a2),a2
[00054102] 4e92                      jsr        (a2)
[00054104] 6054                      bra.s      $0005415A
[00054106] 302f 012e                 move.w     302(a7),d0
[0005410a] c07c 0400                 and.w      #$0400,d0
[0005410e] 6726                      beq.s      $00054136
[00054110] 93c9                      suba.l     a1,a1
[00054112] 303c 02c8                 move.w     #$02C8,d0
[00054116] 342f 012c                 move.w     300(a7),d2
[0005411a] 48c2                      ext.l      d2
[0005411c] 2202                      move.l     d2,d1
[0005411e] d281                      add.l      d1,d1
[00054120] d282                      add.l      d2,d1
[00054122] e789                      lsl.l      #3,d1
[00054124] 206f 0016                 movea.l    22(a7),a0
[00054128] d1c1                      adda.l     d1,a0
[0005412a] 246f 000e                 movea.l    14(a7),a2
[0005412e] 246a 0008                 movea.l    8(a2),a2
[00054132] 4e92                      jsr        (a2)
[00054134] 6024                      bra.s      $0005415A
[00054136] 93c9                      suba.l     a1,a1
[00054138] 303c 02c7                 move.w     #$02C7,d0
[0005413c] 342f 012c                 move.w     300(a7),d2
[00054140] 48c2                      ext.l      d2
[00054142] 2202                      move.l     d2,d1
[00054144] d281                      add.l      d1,d1
[00054146] d282                      add.l      d2,d1
[00054148] e789                      lsl.l      #3,d1
[0005414a] 206f 0016                 movea.l    22(a7),a0
[0005414e] d1c1                      adda.l     d1,a0
[00054150] 246f 000e                 movea.l    14(a7),a2
[00054154] 246a 0008                 movea.l    8(a2),a2
[00054158] 4e92                      jsr        (a2)
[0005415a] 6000 0318                 bra        $00054474
[0005415e] 93c9                      suba.l     a1,a1
[00054160] 303c 02ca                 move.w     #$02CA,d0
[00054164] 342f 012c                 move.w     300(a7),d2
[00054168] 48c2                      ext.l      d2
[0005416a] 2202                      move.l     d2,d1
[0005416c] d281                      add.l      d1,d1
[0005416e] d282                      add.l      d2,d1
[00054170] e789                      lsl.l      #3,d1
[00054172] 206f 0016                 movea.l    22(a7),a0
[00054176] d1c1                      adda.l     d1,a0
[00054178] 246f 000e                 movea.l    14(a7),a2
[0005417c] 246a 0008                 movea.l    8(a2),a2
[00054180] 4e92                      jsr        (a2)
[00054182] 6000 02f0                 bra        $00054474
[00054186] 3f7c ffff 012a            move.w     #$FFFF,298(a7)
[0005418c] 302f 012e                 move.w     302(a7),d0
[00054190] c07c 0300                 and.w      #$0300,d0
[00054194] 670e                      beq.s      $000541A4
[00054196] 206f 0132                 movea.l    306(a7),a0
[0005419a] 6100 ee2e                 bsr        Awi_firstedit
[0005419e] 3f40 012a                 move.w     d0,298(a7)
[000541a2] 604e                      bra.s      $000541F2
[000541a4] 6006                      bra.s      $000541AC
[000541a6] 3f6f 0128 012a            move.w     296(a7),298(a7)
[000541ac] 7208                      moveq.l    #8,d1
[000541ae] 302f 012a                 move.w     298(a7),d0
[000541b2] 206f 0016                 movea.l    22(a7),a0
[000541b6] 4eb9 0005 0e62            jsr        Aob_findflag
[000541bc] 3f40 0128                 move.w     d0,296(a7)
[000541c0] 6f0a                      ble.s      $000541CC
[000541c2] 302f 0128                 move.w     296(a7),d0
[000541c6] b06f 012c                 cmp.w      300(a7),d0
[000541ca] 6dda                      blt.s      $000541A6
[000541cc] 302f 012a                 move.w     298(a7),d0
[000541d0] 6a0c                      bpl.s      $000541DE
[000541d2] 206f 0132                 movea.l    306(a7),a0
[000541d6] 6100 ee40                 bsr        Awi_lastedit
[000541da] 3f40 012a                 move.w     d0,298(a7)
[000541de] 206f 0132                 movea.l    306(a7),a0
[000541e2] 2068 0018                 movea.l    24(a0),a0
[000541e6] b1ef 0016                 cmpa.l     22(a7),a0
[000541ea] 6606                      bne.s      $000541F2
[000541ec] 006f 1000 012a            ori.w      #$1000,298(a7)
[000541f2] 322f 012a                 move.w     298(a7),d1
[000541f6] 302f 012c                 move.w     300(a7),d0
[000541fa] 206f 0132                 movea.l    306(a7),a0
[000541fe] 6100 eea6                 bsr        Awi_focuschg
[00054202] 4a40                      tst.w      d0
[00054204] 6604                      bne.s      $0005420A
[00054206] 536f 0122                 subq.w     #1,290(a7)
[0005420a] 6000 0268                 bra        $00054474
[0005420e] 3f7c ffff 012a            move.w     #$FFFF,298(a7)
[00054214] 302f 012e                 move.w     302(a7),d0
[00054218] c07c 0300                 and.w      #$0300,d0
[0005421c] 670e                      beq.s      $0005422C
[0005421e] 206f 0132                 movea.l    306(a7),a0
[00054222] 6100 edf4                 bsr        Awi_lastedit
[00054226] 3f40 012a                 move.w     d0,298(a7)
[0005422a] 603c                      bra.s      $00054268
[0005422c] 7208                      moveq.l    #8,d1
[0005422e] 302f 012c                 move.w     300(a7),d0
[00054232] 206f 0016                 movea.l    22(a7),a0
[00054236] 4eb9 0005 0e62            jsr        Aob_findflag
[0005423c] 3f40 012a                 move.w     d0,298(a7)
[00054240] 302f 012a                 move.w     298(a7),d0
[00054244] 6a0e                      bpl.s      $00054254
[00054246] 206f 0132                 movea.l    306(a7),a0
[0005424a] 6100 ed7e                 bsr        Awi_firstedit
[0005424e] 3f40 012a                 move.w     d0,298(a7)
[00054252] 6014                      bra.s      $00054268
[00054254] 206f 0132                 movea.l    306(a7),a0
[00054258] 2068 0018                 movea.l    24(a0),a0
[0005425c] b1ef 0016                 cmpa.l     22(a7),a0
[00054260] 6606                      bne.s      $00054268
[00054262] 006f 1000 012a            ori.w      #$1000,298(a7)
[00054268] 322f 012a                 move.w     298(a7),d1
[0005426c] 302f 012c                 move.w     300(a7),d0
[00054270] 206f 0132                 movea.l    306(a7),a0
[00054274] 6100 ee30                 bsr        Awi_focuschg
[00054278] 4a40                      tst.w      d0
[0005427a] 6604                      bne.s      $00054280
[0005427c] 536f 0122                 subq.w     #1,290(a7)
[00054280] 6000 01f2                 bra        $00054474
[00054284] 93c9                      suba.l     a1,a1
[00054286] 303c 02cc                 move.w     #$02CC,d0
[0005428a] 342f 012c                 move.w     300(a7),d2
[0005428e] 48c2                      ext.l      d2
[00054290] 2202                      move.l     d2,d1
[00054292] d281                      add.l      d1,d1
[00054294] d282                      add.l      d2,d1
[00054296] e789                      lsl.l      #3,d1
[00054298] 206f 0016                 movea.l    22(a7),a0
[0005429c] d1c1                      adda.l     d1,a0
[0005429e] 246f 000e                 movea.l    14(a7),a2
[000542a2] 246a 0008                 movea.l    8(a2),a2
[000542a6] 4e92                      jsr        (a2)
[000542a8] 6000 01ca                 bra        $00054474
[000542ac] 302f 012e                 move.w     302(a7),d0
[000542b0] c07c 0400                 and.w      #$0400,d0
[000542b4] 6700 0100                 beq        $000543B6
[000542b8] 43ef 001a                 lea.l      26(a7),a1
[000542bc] 7003                      moveq.l    #3,d0
[000542be] 342f 012c                 move.w     300(a7),d2
[000542c2] 48c2                      ext.l      d2
[000542c4] 2202                      move.l     d2,d1
[000542c6] d281                      add.l      d1,d1
[000542c8] d282                      add.l      d2,d1
[000542ca] e789                      lsl.l      #3,d1
[000542cc] 206f 0016                 movea.l    22(a7),a0
[000542d0] d1c1                      adda.l     d1,a0
[000542d2] 246f 000e                 movea.l    14(a7),a2
[000542d6] 246a 0008                 movea.l    8(a2),a2
[000542da] 4e92                      jsr        (a2)
[000542dc] 4a40                      tst.w      d0
[000542de] 6700 00d6                 beq        $000543B6
[000542e2] 43ef 011e                 lea.l      286(a7),a1
[000542e6] 303c 02c3                 move.w     #$02C3,d0
[000542ea] 342f 012c                 move.w     300(a7),d2
[000542ee] 48c2                      ext.l      d2
[000542f0] 2202                      move.l     d2,d1
[000542f2] d281                      add.l      d1,d1
[000542f4] d282                      add.l      d2,d1
[000542f6] e789                      lsl.l      #3,d1
[000542f8] 206f 0016                 movea.l    22(a7),a0
[000542fc] d1c1                      adda.l     d1,a0
[000542fe] 246f 000e                 movea.l    14(a7),a2
[00054302] 246a 0008                 movea.l    8(a2),a2
[00054306] 4e92                      jsr        (a2)
[00054308] 4a40                      tst.w      d0
[0005430a] 6700 00aa                 beq        $000543B6
[0005430e] 302f 012e                 move.w     302(a7),d0
[00054312] c07c 0300                 and.w      #$0300,d0
[00054316] 6608                      bne.s      $00054320
[00054318] 91c8                      suba.l     a0,a0
[0005431a] 4eb9 0006 c904            jsr        Ascrp_clear
[00054320] 302f 012e                 move.w     302(a7),d0
[00054324] c07c 0300                 and.w      #$0300,d0
[00054328] 6704                      beq.s      $0005432E
[0005432a] 7201                      moveq.l    #1,d1
[0005432c] 6002                      bra.s      $00054330
[0005432e] 4241                      clr.w      d1
[00054330] 3f01                      move.w     d1,-(a7)
[00054332] 206f 001c                 movea.l    28(a7),a0
[00054336] 4eb9 0008 2f6c            jsr        strlen
[0005433c] 226f 001c                 movea.l    28(a7),a1
[00054340] 41f9 000e 0ce0            lea.l      $000E0CE0,a0
[00054346] 321f                      move.w     (a7)+,d1
[00054348] 4eb9 0006 cc22            jsr        Ascrp_put
[0005434e] 0c2f 0078 012f            cmpi.b     #$78,303(a7)
[00054354] 6708                      beq.s      $0005435E
[00054356] 0c2f 0058 012f            cmpi.b     #$58,303(a7)
[0005435c] 6656                      bne.s      $000543B4
[0005435e] 302f 0120                 move.w     288(a7),d0
[00054362] b06f 011e                 cmp.w      286(a7),d0
[00054366] 6f26                      ble.s      $0005438E
[00054368] 93c9                      suba.l     a1,a1
[0005436a] 303c 02c7                 move.w     #$02C7,d0
[0005436e] 342f 012c                 move.w     300(a7),d2
[00054372] 48c2                      ext.l      d2
[00054374] 2202                      move.l     d2,d1
[00054376] d281                      add.l      d1,d1
[00054378] d282                      add.l      d2,d1
[0005437a] e789                      lsl.l      #3,d1
[0005437c] 206f 0016                 movea.l    22(a7),a0
[00054380] d1c1                      adda.l     d1,a0
[00054382] 246f 000e                 movea.l    14(a7),a2
[00054386] 246a 0008                 movea.l    8(a2),a2
[0005438a] 4e92                      jsr        (a2)
[0005438c] 6026                      bra.s      $000543B4
[0005438e] 43f9 000e 0ce4            lea.l      $000E0CE4,a1
[00054394] 7004                      moveq.l    #4,d0
[00054396] 342f 012c                 move.w     300(a7),d2
[0005439a] 48c2                      ext.l      d2
[0005439c] 2202                      move.l     d2,d1
[0005439e] d281                      add.l      d1,d1
[000543a0] d282                      add.l      d2,d1
[000543a2] e789                      lsl.l      #3,d1
[000543a4] 206f 0016                 movea.l    22(a7),a0
[000543a8] d1c1                      adda.l     d1,a0
[000543aa] 246f 000e                 movea.l    14(a7),a2
[000543ae] 246a 0008                 movea.l    8(a2),a2
[000543b2] 4e92                      jsr        (a2)
[000543b4] 6020                      bra.s      $000543D6
[000543b6] 102f 012f                 move.b     303(a7),d0
[000543ba] 342f 012c                 move.w     300(a7),d2
[000543be] 48c2                      ext.l      d2
[000543c0] 2202                      move.l     d2,d1
[000543c2] d281                      add.l      d1,d1
[000543c4] d282                      add.l      d2,d1
[000543c6] e789                      lsl.l      #3,d1
[000543c8] 226f 0016                 movea.l    22(a7),a1
[000543cc] d3c1                      adda.l     d1,a1
[000543ce] 206f 000e                 movea.l    14(a7),a0
[000543d2] 6100 ebb8                 bsr        Awi_char
[000543d6] 6000 009c                 bra        $00054474
[000543da] 302f 012e                 move.w     302(a7),d0
[000543de] c07c 0400                 and.w      #$0400,d0
[000543e2] 674e                      beq.s      $00054432
[000543e4] 4857                      pea.l      (a7)
[000543e6] 43ef 001e                 lea.l      30(a7),a1
[000543ea] 41f9 000e 0ce5            lea.l      $000E0CE5,a0
[000543f0] 4eb9 0006 ca2c            jsr        Ascrp_get
[000543f6] 584f                      addq.w     #4,a7
[000543f8] 4a40                      tst.w      d0
[000543fa] 6736                      beq.s      $00054432
[000543fc] 2017                      move.l     (a7),d0
[000543fe] 6f26                      ble.s      $00054426
[00054400] 226f 001a                 movea.l    26(a7),a1
[00054404] 303c 02c1                 move.w     #$02C1,d0
[00054408] 342f 012c                 move.w     300(a7),d2
[0005440c] 48c2                      ext.l      d2
[0005440e] 2202                      move.l     d2,d1
[00054410] d281                      add.l      d1,d1
[00054412] d282                      add.l      d2,d1
[00054414] e789                      lsl.l      #3,d1
[00054416] 206f 0016                 movea.l    22(a7),a0
[0005441a] d1c1                      adda.l     d1,a0
[0005441c] 246f 000e                 movea.l    14(a7),a2
[00054420] 246a 0008                 movea.l    8(a2),a2
[00054424] 4e92                      jsr        (a2)
[00054426] 206f 001a                 movea.l    26(a7),a0
[0005442a] 4eb9 0004 c7c8            jsr        Ax_free
[00054430] 6020                      bra.s      $00054452
[00054432] 102f 012f                 move.b     303(a7),d0
[00054436] 342f 012c                 move.w     300(a7),d2
[0005443a] 48c2                      ext.l      d2
[0005443c] 2202                      move.l     d2,d1
[0005443e] d281                      add.l      d1,d1
[00054440] d282                      add.l      d2,d1
[00054442] e789                      lsl.l      #3,d1
[00054444] 226f 0016                 movea.l    22(a7),a1
[00054448] d3c1                      adda.l     d1,a1
[0005444a] 206f 000e                 movea.l    14(a7),a0
[0005444e] 6100 eb3c                 bsr        Awi_char
[00054452] 6020                      bra.s      $00054474
[00054454] 102f 012f                 move.b     303(a7),d0
[00054458] 342f 012c                 move.w     300(a7),d2
[0005445c] 48c2                      ext.l      d2
[0005445e] 2202                      move.l     d2,d1
[00054460] d281                      add.l      d1,d1
[00054462] d282                      add.l      d2,d1
[00054464] e789                      lsl.l      #3,d1
[00054466] 226f 0016                 movea.l    22(a7),a1
[0005446a] d3c1                      adda.l     d1,a1
[0005446c] 206f 000e                 movea.l    14(a7),a0
[00054470] 6100 eb1a                 bsr        Awi_char
[00054474] 6020                      bra.s      $00054496
[00054476] 102f 012f                 move.b     303(a7),d0
[0005447a] 342f 012c                 move.w     300(a7),d2
[0005447e] 48c2                      ext.l      d2
[00054480] 2202                      move.l     d2,d1
[00054482] d281                      add.l      d1,d1
[00054484] d282                      add.l      d2,d1
[00054486] e789                      lsl.l      #3,d1
[00054488] 226f 0016                 movea.l    22(a7),a1
[0005448c] d3c1                      adda.l     d1,a1
[0005448e] 206f 000e                 movea.l    14(a7),a0
[00054492] 6100 eaf8                 bsr        Awi_char
[00054496] 93c9                      suba.l     a1,a1
[00054498] 7005                      moveq.l    #5,d0
[0005449a] 342f 012c                 move.w     300(a7),d2
[0005449e] 48c2                      ext.l      d2
[000544a0] 2202                      move.l     d2,d1
[000544a2] d281                      add.l      d1,d1
[000544a4] d282                      add.l      d2,d1
[000544a6] e789                      lsl.l      #3,d1
[000544a8] 206f 0016                 movea.l    22(a7),a0
[000544ac] d1c1                      adda.l     d1,a0
[000544ae] 246f 000e                 movea.l    14(a7),a2
[000544b2] 246a 0008                 movea.l    8(a2),a2
[000544b6] 4e92                      jsr        (a2)
[000544b8] 302f 0122                 move.w     290(a7),d0
[000544bc] 4fef 0136                 lea.l      310(a7),a7
[000544c0] 245f                      movea.l    (a7)+,a2
[000544c2] 4e75                      rts
Awi_scroll:
[000544c4] 2f0a                      move.l     a2,-(a7)
[000544c6] 4fef ffd2                 lea.l      -46(a7),a7
[000544ca] 2f48 002a                 move.l     a0,42(a7)
[000544ce] 3f40 0028                 move.w     d0,40(a7)
[000544d2] 3f41 0026                 move.w     d1,38(a7)
[000544d6] 206f 002a                 movea.l    42(a7),a0
[000544da] 3f68 0020 0020            move.w     32(a0),32(a7)
[000544e0] 302f 0020                 move.w     32(a7),d0
[000544e4] 6a04                      bpl.s      $000544EA
[000544e6] 6000 0294                 bra        $0005477C
[000544ea] 302f 0028                 move.w     40(a7),d0
[000544ee] 206f 002a                 movea.l    42(a7),a0
[000544f2] 2068 0014                 movea.l    20(a0),a0
[000544f6] 9068 0010                 sub.w      16(a0),d0
[000544fa] 3f40 0024                 move.w     d0,36(a7)
[000544fe] 302f 0026                 move.w     38(a7),d0
[00054502] 206f 002a                 movea.l    42(a7),a0
[00054506] 2068 0014                 movea.l    20(a0),a0
[0005450a] 9068 0012                 sub.w      18(a0),d0
[0005450e] 3f40 0022                 move.w     d0,34(a7)
[00054512] 303c 0080                 move.w     #$0080,d0
[00054516] 206f 002a                 movea.l    42(a7),a0
[0005451a] c068 0054                 and.w      84(a0),d0
[0005451e] 6640                      bne.s      $00054560
[00054520] 206f 002a                 movea.l    42(a7),a0
[00054524] 302f 0024                 move.w     36(a7),d0
[00054528] b068 0038                 cmp.w      56(a0),d0
[0005452c] 6c32                      bge.s      $00054560
[0005452e] 206f 002a                 movea.l    42(a7),a0
[00054532] 3028 0038                 move.w     56(a0),d0
[00054536] 4440                      neg.w      d0
[00054538] 322f 0024                 move.w     36(a7),d1
[0005453c] b240                      cmp.w      d0,d1
[0005453e] 6f20                      ble.s      $00054560
[00054540] 206f 002a                 movea.l    42(a7),a0
[00054544] 302f 0022                 move.w     34(a7),d0
[00054548] b068 003a                 cmp.w      58(a0),d0
[0005454c] 6c12                      bge.s      $00054560
[0005454e] 206f 002a                 movea.l    42(a7),a0
[00054552] 3028 003a                 move.w     58(a0),d0
[00054556] 4440                      neg.w      d0
[00054558] 322f 0022                 move.w     34(a7),d1
[0005455c] b240                      cmp.w      d0,d1
[0005455e] 6e1a                      bgt.s      $0005457A
[00054560] 226f 002a                 movea.l    42(a7),a1
[00054564] 43e9 0034                 lea.l      52(a1),a1
[00054568] 206f 002a                 movea.l    42(a7),a0
[0005456c] 246f 002a                 movea.l    42(a7),a2
[00054570] 246a 006a                 movea.l    106(a2),a2
[00054574] 4e92                      jsr        (a2)
[00054576] 6000 0204                 bra        $0005477C
[0005457a] 486f 000e                 pea.l      14(a7)
[0005457e] 486f 0010                 pea.l      16(a7)
[00054582] 486f 0012                 pea.l      18(a7)
[00054586] 486f 0014                 pea.l      20(a7)
[0005458a] 720b                      moveq.l    #11,d1
[0005458c] 302f 0030                 move.w     48(a7),d0
[00054590] 4eb9 0007 f7ba            jsr        wind_get
[00054596] 4fef 0010                 lea.l      16(a7),a7
[0005459a] 302f 000c                 move.w     12(a7),d0
[0005459e] 6706                      beq.s      $000545A6
[000545a0] 302f 000e                 move.w     14(a7),d0
[000545a4] 6604                      bne.s      $000545AA
[000545a6] 6000 01d4                 bra        $0005477C
[000545aa] 486f 0006                 pea.l      6(a7)
[000545ae] 486f 0008                 pea.l      8(a7)
[000545b2] 486f 000a                 pea.l      10(a7)
[000545b6] 486f 000c                 pea.l      12(a7)
[000545ba] 720c                      moveq.l    #12,d1
[000545bc] 302f 0030                 move.w     48(a7),d0
[000545c0] 4eb9 0007 f7ba            jsr        wind_get
[000545c6] 4fef 0010                 lea.l      16(a7),a7
[000545ca] 302f 0004                 move.w     4(a7),d0
[000545ce] 6606                      bne.s      $000545D6
[000545d0] 302f 0006                 move.w     6(a7),d0
[000545d4] 671a                      beq.s      $000545F0
[000545d6] 226f 002a                 movea.l    42(a7),a1
[000545da] 43e9 0034                 lea.l      52(a1),a1
[000545de] 206f 002a                 movea.l    42(a7),a0
[000545e2] 246f 002a                 movea.l    42(a7),a2
[000545e6] 246a 006a                 movea.l    106(a2),a2
[000545ea] 4e92                      jsr        (a2)
[000545ec] 6000 018e                 bra        $0005477C
[000545f0] 2279 0010 ee4e            movea.l    ACSblk,a1
[000545f6] 5049                      addq.w     #8,a1
[000545f8] 41ef 0008                 lea.l      8(a7),a0
[000545fc] 4eb9 0006 c662            jsr        intersect
[00054602] 226f 002a                 movea.l    42(a7),a1
[00054606] 43e9 0034                 lea.l      52(a1),a1
[0005460a] 41ef 0008                 lea.l      8(a7),a0
[0005460e] 4eb9 0006 c662            jsr        intersect
[00054614] 302f 000c                 move.w     12(a7),d0
[00054618] 6706                      beq.s      $00054620
[0005461a] 302f 000e                 move.w     14(a7),d0
[0005461e] 6604                      bne.s      $00054624
[00054620] 6000 015a                 bra        $0005477C
[00054624] 302f 0008                 move.w     8(a7),d0
[00054628] 3f40 0018                 move.w     d0,24(a7)
[0005462c] 3f40 0010                 move.w     d0,16(a7)
[00054630] 302f 000a                 move.w     10(a7),d0
[00054634] 3f40 001a                 move.w     d0,26(a7)
[00054638] 3f40 0012                 move.w     d0,18(a7)
[0005463c] 302f 0008                 move.w     8(a7),d0
[00054640] d06f 000c                 add.w      12(a7),d0
[00054644] 5340                      subq.w     #1,d0
[00054646] 3f40 001c                 move.w     d0,28(a7)
[0005464a] 3f40 0014                 move.w     d0,20(a7)
[0005464e] 302f 000a                 move.w     10(a7),d0
[00054652] d06f 000e                 add.w      14(a7),d0
[00054656] 5340                      subq.w     #1,d0
[00054658] 3f40 001e                 move.w     d0,30(a7)
[0005465c] 3f40 0016                 move.w     d0,22(a7)
[00054660] 302f 0024                 move.w     36(a7),d0
[00054664] 6742                      beq.s      $000546A8
[00054666] 302f 0024                 move.w     36(a7),d0
[0005466a] 6f22                      ble.s      $0005468E
[0005466c] 302f 0024                 move.w     36(a7),d0
[00054670] d16f 0010                 add.w      d0,16(a7)
[00054674] 302f 0024                 move.w     36(a7),d0
[00054678] 916f 001c                 sub.w      d0,28(a7)
[0005467c] 7001                      moveq.l    #1,d0
[0005467e] d06f 001c                 add.w      28(a7),d0
[00054682] 3f40 0008                 move.w     d0,8(a7)
[00054686] 3f6f 0024 000c            move.w     36(a7),12(a7)
[0005468c] 601a                      bra.s      $000546A8
[0005468e] 302f 0024                 move.w     36(a7),d0
[00054692] d16f 0014                 add.w      d0,20(a7)
[00054696] 302f 0024                 move.w     36(a7),d0
[0005469a] 916f 0018                 sub.w      d0,24(a7)
[0005469e] 302f 0024                 move.w     36(a7),d0
[000546a2] 4440                      neg.w      d0
[000546a4] 3f40 000c                 move.w     d0,12(a7)
[000546a8] 302f 0022                 move.w     34(a7),d0
[000546ac] 6742                      beq.s      $000546F0
[000546ae] 302f 0022                 move.w     34(a7),d0
[000546b2] 6f22                      ble.s      $000546D6
[000546b4] 302f 0022                 move.w     34(a7),d0
[000546b8] d16f 0012                 add.w      d0,18(a7)
[000546bc] 302f 0022                 move.w     34(a7),d0
[000546c0] 916f 001e                 sub.w      d0,30(a7)
[000546c4] 7001                      moveq.l    #1,d0
[000546c6] d06f 001e                 add.w      30(a7),d0
[000546ca] 3f40 000a                 move.w     d0,10(a7)
[000546ce] 3f6f 0022 000e            move.w     34(a7),14(a7)
[000546d4] 601a                      bra.s      $000546F0
[000546d6] 302f 0022                 move.w     34(a7),d0
[000546da] d16f 0016                 add.w      d0,22(a7)
[000546de] 302f 0022                 move.w     34(a7),d0
[000546e2] 916f 001a                 sub.w      d0,26(a7)
[000546e6] 302f 0022                 move.w     34(a7),d0
[000546ea] 4440                      neg.w      d0
[000546ec] 3f40 000e                 move.w     d0,14(a7)
[000546f0] 302f 0010                 move.w     16(a7),d0
[000546f4] b06f 0014                 cmp.w      20(a7),d0
[000546f8] 6e70                      bgt.s      $0005476A
[000546fa] 302f 0012                 move.w     18(a7),d0
[000546fe] b06f 0016                 cmp.w      22(a7),d0
[00054702] 6e66                      bgt.s      $0005476A
[00054704] 41ef 0010                 lea.l      16(a7),a0
[00054708] 4241                      clr.w      d1
[0005470a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00054710] 3029 0010                 move.w     16(a1),d0
[00054714] 4eb9 0007 2230            jsr        vs_clip
[0005471a] 2279 000e 692a            movea.l    _globl,a1
[00054720] 91c8                      suba.l     a0,a0
[00054722] 303c 0100                 move.w     #$0100,d0
[00054726] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0005472c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00054732] 4868 026a                 pea.l      618(a0)
[00054736] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005473c] 43e9 026a                 lea.l      618(a1),a1
[00054740] 41ef 0014                 lea.l      20(a7),a0
[00054744] 7203                      moveq.l    #3,d1
[00054746] 2479 0010 ee4e            movea.l    ACSblk,a2
[0005474c] 302a 0010                 move.w     16(a2),d0
[00054750] 4eb9 0007 489e            jsr        vro_cpyfm
[00054756] 584f                      addq.w     #4,a7
[00054758] 2279 000e 692a            movea.l    _globl,a1
[0005475e] 91c8                      suba.l     a0,a0
[00054760] 303c 0101                 move.w     #$0101,d0
[00054764] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0005476a] 43ef 0008                 lea.l      8(a7),a1
[0005476e] 206f 002a                 movea.l    42(a7),a0
[00054772] 246f 002a                 movea.l    42(a7),a2
[00054776] 246a 006a                 movea.l    106(a2),a2
[0005477a] 4e92                      jsr        (a2)
[0005477c] 4fef 002e                 lea.l      46(a7),a7
[00054780] 245f                      movea.l    (a7)+,a2
[00054782] 4e75                      rts
Aob_flags:
[00054784] 4fef fff2                 lea.l      -14(a7),a7
[00054788] 2f48 000a                 move.l     a0,10(a7)
[0005478c] 3f40 0008                 move.w     d0,8(a7)
[00054790] 3f41 0006                 move.w     d1,6(a7)
[00054794] 3f42 0004                 move.w     d2,4(a7)
[00054798] 4297                      clr.l      (a7)
[0005479a] 302f 0008                 move.w     8(a7),d0
[0005479e] c07c 1000                 and.w      #$1000,d0
[000547a2] 672a                      beq.s      $000547CE
[000547a4] 206f 000a                 movea.l    10(a7),a0
[000547a8] 2028 0018                 move.l     24(a0),d0
[000547ac] 671e                      beq.s      $000547CC
[000547ae] 322f 0008                 move.w     8(a7),d1
[000547b2] c27c 0fff                 and.w      #$0FFF,d1
[000547b6] 48c1                      ext.l      d1
[000547b8] 2001                      move.l     d1,d0
[000547ba] d080                      add.l      d0,d0
[000547bc] d081                      add.l      d1,d0
[000547be] e788                      lsl.l      #3,d0
[000547c0] 206f 000a                 movea.l    10(a7),a0
[000547c4] 2068 0018                 movea.l    24(a0),a0
[000547c8] d1c0                      adda.l     d0,a0
[000547ca] 2e88                      move.l     a0,(a7)
[000547cc] 6024                      bra.s      $000547F2
[000547ce] 206f 000a                 movea.l    10(a7),a0
[000547d2] 2028 0014                 move.l     20(a0),d0
[000547d6] 671a                      beq.s      $000547F2
[000547d8] 322f 0008                 move.w     8(a7),d1
[000547dc] 48c1                      ext.l      d1
[000547de] 2001                      move.l     d1,d0
[000547e0] d080                      add.l      d0,d0
[000547e2] d081                      add.l      d1,d0
[000547e4] e788                      lsl.l      #3,d0
[000547e6] 206f 000a                 movea.l    10(a7),a0
[000547ea] 2068 0014                 movea.l    20(a0),a0
[000547ee] d1c0                      adda.l     d0,a0
[000547f0] 2e88                      move.l     a0,(a7)
[000547f2] 2017                      move.l     (a7),d0
[000547f4] 6750                      beq.s      $00054846
[000547f6] 302f 0004                 move.w     4(a7),d0
[000547fa] 670c                      beq.s      $00054808
[000547fc] 302f 0006                 move.w     6(a7),d0
[00054800] 2057                      movea.l    (a7),a0
[00054802] 8168 0008                 or.w       d0,8(a0)
[00054806] 600c                      bra.s      $00054814
[00054808] 302f 0006                 move.w     6(a7),d0
[0005480c] 4640                      not.w      d0
[0005480e] 2057                      movea.l    (a7),a0
[00054810] c168 0008                 and.w      d0,8(a0)
[00054814] 206f 000a                 movea.l    10(a7),a0
[00054818] 3028 0020                 move.w     32(a0),d0
[0005481c] 6b20                      bmi.s      $0005483E
[0005481e] 7020                      moveq.l    #32,d0
[00054820] 206f 000a                 movea.l    10(a7),a0
[00054824] c068 0056                 and.w      86(a0),d0
[00054828] 6614                      bne.s      $0005483E
[0005482a] 72ff                      moveq.l    #-1,d1
[0005482c] 302f 0008                 move.w     8(a7),d0
[00054830] 206f 000a                 movea.l    10(a7),a0
[00054834] 226f 000a                 movea.l    10(a7),a1
[00054838] 2269 0066                 movea.l    102(a1),a1
[0005483c] 4e91                      jsr        (a1)
[0005483e] 2057                      movea.l    (a7),a0
[00054840] 3028 0008                 move.w     8(a0),d0
[00054844] 6002                      bra.s      $00054848
[00054846] 4240                      clr.w      d0
[00054848] 4fef 000e                 lea.l      14(a7),a7
[0005484c] 4e75                      rts
Aob_state:
[0005484e] 4fef fff2                 lea.l      -14(a7),a7
[00054852] 2f48 000a                 move.l     a0,10(a7)
[00054856] 3f40 0008                 move.w     d0,8(a7)
[0005485a] 3f41 0006                 move.w     d1,6(a7)
[0005485e] 3f42 0004                 move.w     d2,4(a7)
[00054862] 4297                      clr.l      (a7)
[00054864] 302f 0008                 move.w     8(a7),d0
[00054868] c07c 1000                 and.w      #$1000,d0
[0005486c] 672a                      beq.s      $00054898
[0005486e] 206f 000a                 movea.l    10(a7),a0
[00054872] 2028 0018                 move.l     24(a0),d0
[00054876] 671e                      beq.s      $00054896
[00054878] 322f 0008                 move.w     8(a7),d1
[0005487c] c27c 0fff                 and.w      #$0FFF,d1
[00054880] 48c1                      ext.l      d1
[00054882] 2001                      move.l     d1,d0
[00054884] d080                      add.l      d0,d0
[00054886] d081                      add.l      d1,d0
[00054888] e788                      lsl.l      #3,d0
[0005488a] 206f 000a                 movea.l    10(a7),a0
[0005488e] 2068 0018                 movea.l    24(a0),a0
[00054892] d1c0                      adda.l     d0,a0
[00054894] 2e88                      move.l     a0,(a7)
[00054896] 6028                      bra.s      $000548C0
[00054898] 206f 000a                 movea.l    10(a7),a0
[0005489c] 2028 0014                 move.l     20(a0),d0
[000548a0] 671e                      beq.s      $000548C0
[000548a2] 322f 0008                 move.w     8(a7),d1
[000548a6] c27c 0fff                 and.w      #$0FFF,d1
[000548aa] 48c1                      ext.l      d1
[000548ac] 2001                      move.l     d1,d0
[000548ae] d080                      add.l      d0,d0
[000548b0] d081                      add.l      d1,d0
[000548b2] e788                      lsl.l      #3,d0
[000548b4] 206f 000a                 movea.l    10(a7),a0
[000548b8] 2068 0014                 movea.l    20(a0),a0
[000548bc] d1c0                      adda.l     d0,a0
[000548be] 2e88                      move.l     a0,(a7)
[000548c0] 2017                      move.l     (a7),d0
[000548c2] 6750                      beq.s      $00054914
[000548c4] 302f 0004                 move.w     4(a7),d0
[000548c8] 670c                      beq.s      $000548D6
[000548ca] 302f 0006                 move.w     6(a7),d0
[000548ce] 2057                      movea.l    (a7),a0
[000548d0] 8168 000a                 or.w       d0,10(a0)
[000548d4] 600c                      bra.s      $000548E2
[000548d6] 302f 0006                 move.w     6(a7),d0
[000548da] 4640                      not.w      d0
[000548dc] 2057                      movea.l    (a7),a0
[000548de] c168 000a                 and.w      d0,10(a0)
[000548e2] 206f 000a                 movea.l    10(a7),a0
[000548e6] 3028 0020                 move.w     32(a0),d0
[000548ea] 6b20                      bmi.s      $0005490C
[000548ec] 7020                      moveq.l    #32,d0
[000548ee] 206f 000a                 movea.l    10(a7),a0
[000548f2] c068 0056                 and.w      86(a0),d0
[000548f6] 6614                      bne.s      $0005490C
[000548f8] 72ff                      moveq.l    #-1,d1
[000548fa] 302f 0008                 move.w     8(a7),d0
[000548fe] 206f 000a                 movea.l    10(a7),a0
[00054902] 226f 000a                 movea.l    10(a7),a1
[00054906] 2269 0066                 movea.l    102(a1),a1
[0005490a] 4e91                      jsr        (a1)
[0005490c] 2057                      movea.l    (a7),a0
[0005490e] 3028 000a                 move.w     10(a0),d0
[00054912] 6002                      bra.s      $00054916
[00054914] 4240                      clr.w      d0
[00054916] 4fef 000e                 lea.l      14(a7),a7
[0005491a] 4e75                      rts
Aob_service:
[0005491c] 2f0a                      move.l     a2,-(a7)
[0005491e] 4fef ffec                 lea.l      -20(a7),a7
[00054922] 2f48 0010                 move.l     a0,16(a7)
[00054926] 3f40 000e                 move.w     d0,14(a7)
[0005492a] 3f41 000c                 move.w     d1,12(a7)
[0005492e] 2f49 0008                 move.l     a1,8(a7)
[00054932] 2079 0010 ee4e            movea.l    ACSblk,a0
[00054938] 2068 023c                 movea.l    572(a0),a0
[0005493c] 3028 000e                 move.w     14(a0),d0
[00054940] c07c 0200                 and.w      #$0200,d0
[00054944] 6608                      bne.s      $0005494E
[00054946] 202f 0010                 move.l     16(a7),d0
[0005494a] 6700 0078                 beq.w      $000549C4
[0005494e] 322f 000e                 move.w     14(a7),d1
[00054952] c27c 0fff                 and.w      #$0FFF,d1
[00054956] 48c1                      ext.l      d1
[00054958] 2001                      move.l     d1,d0
[0005495a] d080                      add.l      d0,d0
[0005495c] d081                      add.l      d1,d0
[0005495e] e788                      lsl.l      #3,d0
[00054960] 206f 0010                 movea.l    16(a7),a0
[00054964] d1c0                      adda.l     d0,a0
[00054966] 2f48 0004                 move.l     a0,4(a7)
[0005496a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00054970] 2068 023c                 movea.l    572(a0),a0
[00054974] 3028 000e                 move.w     14(a0),d0
[00054978] c07c 0200                 and.w      #$0200,d0
[0005497c] 660c                      bne.s      $0005498A
[0005497e] 206f 0004                 movea.l    4(a7),a0
[00054982] 0c28 0018 0007            cmpi.b     #$18,7(a0)
[00054988] 663a                      bne.s      $000549C4
[0005498a] 206f 0004                 movea.l    4(a7),a0
[0005498e] 2ea8 000c                 move.l     12(a0),(a7)
[00054992] 2079 0010 ee4e            movea.l    ACSblk,a0
[00054998] 2068 023c                 movea.l    572(a0),a0
[0005499c] 3028 000e                 move.w     14(a0),d0
[000549a0] c07c 0200                 and.w      #$0200,d0
[000549a4] 6608                      bne.s      $000549AE
[000549a6] 2057                      movea.l    (a7),a0
[000549a8] 2028 0008                 move.l     8(a0),d0
[000549ac] 6716                      beq.s      $000549C4
[000549ae] 226f 0008                 movea.l    8(a7),a1
[000549b2] 302f 000c                 move.w     12(a7),d0
[000549b6] 206f 0004                 movea.l    4(a7),a0
[000549ba] 2457                      movea.l    (a7),a2
[000549bc] 246a 0008                 movea.l    8(a2),a2
[000549c0] 4e92                      jsr        (a2)
[000549c2] 6002                      bra.s      $000549C6
[000549c4] 4240                      clr.w      d0
[000549c6] 4fef 0014                 lea.l      20(a7),a7
[000549ca] 245f                      movea.l    (a7)+,a2
[000549cc] 4e75                      rts
Awi_observice:
[000549ce] 4fef fff4                 lea.l      -12(a7),a7
[000549d2] 2f48 0008                 move.l     a0,8(a7)
[000549d6] 3f40 0006                 move.w     d0,6(a7)
[000549da] 3f41 0004                 move.w     d1,4(a7)
[000549de] 2e89                      move.l     a1,(a7)
[000549e0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000549e6] 2068 023c                 movea.l    572(a0),a0
[000549ea] 3028 000e                 move.w     14(a0),d0
[000549ee] c07c 0200                 and.w      #$0200,d0
[000549f2] 6606                      bne.s      $000549FA
[000549f4] 202f 0008                 move.l     8(a7),d0
[000549f8] 673c                      beq.s      $00054A36
[000549fa] 302f 0006                 move.w     6(a7),d0
[000549fe] c07c 1000                 and.w      #$1000,d0
[00054a02] 671a                      beq.s      $00054A1E
[00054a04] 2257                      movea.l    (a7),a1
[00054a06] 322f 0004                 move.w     4(a7),d1
[00054a0a] 302f 0006                 move.w     6(a7),d0
[00054a0e] 206f 0008                 movea.l    8(a7),a0
[00054a12] 2068 0018                 movea.l    24(a0),a0
[00054a16] 6100 ff04                 bsr        Aob_service
[00054a1a] 601c                      bra.s      $00054A38
[00054a1c] 6018                      bra.s      $00054A36
[00054a1e] 2257                      movea.l    (a7),a1
[00054a20] 322f 0004                 move.w     4(a7),d1
[00054a24] 302f 0006                 move.w     6(a7),d0
[00054a28] 206f 0008                 movea.l    8(a7),a0
[00054a2c] 2068 0014                 movea.l    20(a0),a0
[00054a30] 6100 feea                 bsr        Aob_service
[00054a34] 6002                      bra.s      $00054A38
[00054a36] 4240                      clr.w      d0
[00054a38] 4fef 000c                 lea.l      12(a7),a7
[00054a3c] 4e75                      rts
Aob_visible:
[00054a3e] 4fef fff6                 lea.l      -10(a7),a7
[00054a42] 2f48 0006                 move.l     a0,6(a7)
[00054a46] 3f40 0004                 move.w     d0,4(a7)
[00054a4a] 3ebc 0001                 move.w     #$0001,(a7)
[00054a4e] 3f6f 0004 0002            move.w     4(a7),2(a7)
[00054a54] 6030                      bra.s      $00054A86
[00054a56] 303c 0080                 move.w     #$0080,d0
[00054a5a] 342f 0002                 move.w     2(a7),d2
[00054a5e] 48c2                      ext.l      d2
[00054a60] 2202                      move.l     d2,d1
[00054a62] d281                      add.l      d1,d1
[00054a64] d282                      add.l      d2,d1
[00054a66] e789                      lsl.l      #3,d1
[00054a68] 206f 0006                 movea.l    6(a7),a0
[00054a6c] c070 1808                 and.w      8(a0,d1.l),d0
[00054a70] 6702                      beq.s      $00054A74
[00054a72] 4257                      clr.w      (a7)
[00054a74] 302f 0002                 move.w     2(a7),d0
[00054a78] 206f 0006                 movea.l    6(a7),a0
[00054a7c] 4eb9 0005 0f3a            jsr        Aob_up
[00054a82] 3f40 0002                 move.w     d0,2(a7)
[00054a86] 302f 0002                 move.w     2(a7),d0
[00054a8a] 6b04                      bmi.s      $00054A90
[00054a8c] 3017                      move.w     (a7),d0
[00054a8e] 66c6                      bne.s      $00054A56
[00054a90] 3017                      move.w     (a7),d0
[00054a92] 4fef 000a                 lea.l      10(a7),a7
[00054a96] 4e75                      rts
Awi_obvisible:
[00054a98] 5d4f                      subq.w     #6,a7
[00054a9a] 2f48 0002                 move.l     a0,2(a7)
[00054a9e] 3e80                      move.w     d0,(a7)
[00054aa0] 202f 0002                 move.l     2(a7),d0
[00054aa4] 671c                      beq.s      $00054AC2
[00054aa6] 3017                      move.w     (a7),d0
[00054aa8] 6b18                      bmi.s      $00054AC2
[00054aaa] 206f 0002                 movea.l    2(a7),a0
[00054aae] 3028 0020                 move.w     32(a0),d0
[00054ab2] 6b0e                      bmi.s      $00054AC2
[00054ab4] 206f 0002                 movea.l    2(a7),a0
[00054ab8] 3028 0056                 move.w     86(a0),d0
[00054abc] c07c 3800                 and.w      #$3800,d0
[00054ac0] 6704                      beq.s      $00054AC6
[00054ac2] 4240                      clr.w      d0
[00054ac4] 6038                      bra.s      $00054AFE
[00054ac6] 3017                      move.w     (a7),d0
[00054ac8] c07c 1000                 and.w      #$1000,d0
[00054acc] 6720                      beq.s      $00054AEE
[00054ace] 206f 0002                 movea.l    2(a7),a0
[00054ad2] 2028 0018                 move.l     24(a0),d0
[00054ad6] 6716                      beq.s      $00054AEE
[00054ad8] 3017                      move.w     (a7),d0
[00054ada] c07c 0fff                 and.w      #$0FFF,d0
[00054ade] 206f 0002                 movea.l    2(a7),a0
[00054ae2] 2068 0018                 movea.l    24(a0),a0
[00054ae6] 6100 ff56                 bsr        Aob_visible
[00054aea] 6012                      bra.s      $00054AFE
[00054aec] 6010                      bra.s      $00054AFE
[00054aee] 3017                      move.w     (a7),d0
[00054af0] 206f 0002                 movea.l    2(a7),a0
[00054af4] 2068 0014                 movea.l    20(a0),a0
[00054af8] 6100 ff44                 bsr        Aob_visible
[00054afc] 4e71                      nop
[00054afe] 5c4f                      addq.w     #6,a7
[00054b00] 4e75                      rts
