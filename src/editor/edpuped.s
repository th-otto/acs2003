pu_init:
[000264ac] 48e7 1c3e                 movem.l    d3-d5/a2-a6,-(a7)
[000264b0] 2448                      movea.l    a0,a2
[000264b2] 4eb9 0002 c438            jsr        ed_init
[000264b8] 4a40                      tst.w      d0
[000264ba] 6704                      beq.s      pu_init_1
[000264bc] 70ff                      moveq.l    #-1,d0
[000264be] 6066                      bra.s      pu_init_2
pu_init_1:
[000264c0] 266a 0014                 movea.l    20(a2),a3
[000264c4] 284b                      movea.l    a3,a4
[000264c6] 2a52                      movea.l    (a2),a5
[000264c8] 2c6d 0004                 movea.l    4(a5),a6
[000264cc] 202e 000e                 move.l     14(a6),d0
[000264d0] 7238                      moveq.l    #56,d1
[000264d2] 4eb9 0008 3c5a            jsr        _uldiv
[000264d8] 2600                      move.l     d0,d3
[000264da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000264e0] 3768 000c 0014            move.w     12(a0),20(a3)
[000264e6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000264ec] 3768 000e 0016            move.w     14(a0),22(a3)
[000264f2] 4244                      clr.w      d4
[000264f4] 601e                      bra.s      pu_init_3
[000264f6] 3a04                      move.w     d4,d5
pu_init_4:
[000264f8] da45                      add.w      d5,d5
[000264fa] da44                      add.w      d4,d5
[000264fc] 5645                      addq.w     #3,d5
[000264fe] 3205                      move.w     d5,d1
[00026500] 48c1                      ext.l      d1
[00026502] 2001                      move.l     d1,d0
[00026504] d080                      add.l      d0,d0
[00026506] d081                      add.l      d1,d0
[00026508] e788                      lsl.l      #3,d0
[0002650a] 29bc 0002 671c 0800       move.l     #pup_edit,0(a4,d0.l)
[00026512] 5244                      addq.w     #1,d4
pu_init_3:
[00026514] b644                      cmp.w      d4,d3
[00026516] 6ede                      bgt.s      pu_init_4
[00026518] 302d 0018                 move.w     24(a5),d0
[0002651c] 204a                      movea.l    a2,a0
[0002651e] 4eb9 0002 68c6            jsr        set_menu
[00026524] 4240                      clr.w      d0
pu_init_2:
[00026526] 4cdf 7c38                 movem.l    (a7)+,d3-d5/a2-a6
[0002652a] 4e75                      rts

pu_make:
[0002652c] 48e7 0038                 movem.l    a2-a4,-(a7)
[00026530] 594f                      subq.w     #4,a7
[00026532] 2e88                      move.l     a0,(a7)
[00026534] 2668 0004                 movea.l    4(a0),a3
[00026538] 286b 0012                 movea.l    18(a3),a4
[0002653c] 200c                      move.l     a4,d0
[0002653e] 670c                      beq.s      pu_make_1
[00026540] 204c                      movea.l    a4,a0
[00026542] 4eb9 0005 6bea            jsr        Awi_show
[00026548] 6000 0086                 bra        pu_make_2
pu_make_1:
[0002654c] 7032                      moveq.l    #50,d0
[0002654e] 4eb9 0004 c608            jsr        Ax_malloc
[00026554] 2448                      movea.l    a0,a2
[00026556] 200a                      move.l     a2,d0
[00026558] 6772                      beq.s      pu_make_3
[0002655a] 2257                      movea.l    (a7),a1
[0002655c] 2091                      move.l     (a1),(a0)
[0002655e] 254b 0004                 move.l     a3,4(a2)
[00026562] 357c 0001 0008            move.w     #$0001,8(a2)
[00026568] 357c 0002 0018            move.w     #$0002,24(a2)
[0002656e] 426a 000a                 clr.w      10(a2)
[00026572] 42aa 001e                 clr.l      30(a2)
[00026576] 43eb 0016                 lea.l      22(a3),a1
[0002657a] 23c9 000c 8ecc            move.l     a1,$000C8ECC
[00026580] 2079 000c 8ed8            movea.l    $000C8ED8,a0
[00026586] 2149 0008                 move.l     a1,8(a0)
[0002658a] 41f9 000c 8e7e            lea.l      WI_POPUP,a0
[00026590] 4eb9 0005 7052            jsr        Awi_create
[00026596] 2848                      movea.l    a0,a4
[00026598] 200c                      move.l     a4,d0
[0002659a] 6730                      beq.s      pu_make_3
[0002659c] 2257                      movea.l    (a7),a1
[0002659e] 2051                      movea.l    (a1),a0
[000265a0] 4868 0168                 pea.l      360(a0)
[000265a4] 43eb 003a                 lea.l      58(a3),a1
[000265a8] 204c                      movea.l    a4,a0
[000265aa] 4eb9 0001 6372            jsr        wi_pos
[000265b0] 584f                      addq.w     #4,a7
[000265b2] 288a                      move.l     a2,(a4)
[000265b4] 274c 0012                 move.l     a4,18(a3)
[000265b8] 204c                      movea.l    a4,a0
[000265ba] 226c 000c                 movea.l    12(a4),a1
[000265be] 4e91                      jsr        (a1)
[000265c0] 4a40                      tst.w      d0
[000265c2] 670c                      beq.s      pu_make_2
[000265c4] 204c                      movea.l    a4,a0
[000265c6] 4eb9 0002 c8c8            jsr        ed_term
pu_make_3:
[000265cc] 91c8                      suba.l     a0,a0
[000265ce] 6002                      bra.s      pu_make_4
pu_make_2:
[000265d0] 204c                      movea.l    a4,a0
pu_make_4:
[000265d2] 584f                      addq.w     #4,a7
[000265d4] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000265d8] 4e75                      rts

new_menu:
[000265da] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[000265de] 2448                      movea.l    a0,a2
[000265e0] 3800                      move.w     d0,d4
[000265e2] 2050                      movea.l    (a0),a0
[000265e4] 2650                      movea.l    (a0),a3
[000265e6] 2868 0004                 movea.l    4(a0),a4
[000265ea] 4879 000b b690            pea.l      protosub
[000265f0] 224c                      movea.l    a4,a1
[000265f2] 204b                      movea.l    a3,a0
[000265f4] 4240                      clr.w      d0
[000265f6] 4eb9 0002 d0dc            jsr        copysub_ob
[000265fc] 584f                      addq.w     #4,a7
[000265fe] 3600                      move.w     d0,d3
[00026600] 72fe                      moveq.l    #-2,d1
[00026602] d244                      add.w      d4,d1
[00026604] 48c1                      ext.l      d1
[00026606] 83fc 0003                 divs.w     #$0003,d1
[0002660a] 3801                      move.w     d1,d4
[0002660c] 286c 0004                 movea.l    4(a4),a4
[00026610] 48c1                      ext.l      d1
[00026612] 2401                      move.l     d1,d2
[00026614] e78a                      lsl.l      #3,d2
[00026616] 9481                      sub.l      d1,d2
[00026618] e78a                      lsl.l      #3,d2
[0002661a] 3980 280c                 move.w     d0,12(a4,d2.l)
[0002661e] 3980 280a                 move.w     d0,10(a4,d2.l)
[00026622] 3203                      move.w     d3,d1
[00026624] 48c1                      ext.l      d1
[00026626] 2001                      move.l     d1,d0
[00026628] e788                      lsl.l      #3,d0
[0002662a] 9081                      sub.l      d1,d0
[0002662c] e788                      lsl.l      #3,d0
[0002662e] 3984 0808                 move.w     d4,8(a4,d0.l)
[00026632] 204a                      movea.l    a2,a0
[00026634] 226a 0010                 movea.l    16(a2),a1
[00026638] 4e91                      jsr        (a1)
[0002663a] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[0002663e] 4e75                      rts

open_menu:
[00026640] 48e7 1c38                 movem.l    d3-d5/a2-a4,-(a7)
[00026644] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002664a] 3628 0260                 move.w     608(a0),d3
[0002664e] 2468 0258                 movea.l    600(a0),a2
[00026652] 266a 0014                 movea.l    20(a2),a3
[00026656] 3203                      move.w     d3,d1
[00026658] 48c1                      ext.l      d1
[0002665a] 2001                      move.l     d1,d0
[0002665c] d080                      add.l      d0,d0
[0002665e] d081                      add.l      d1,d0
[00026660] e788                      lsl.l      #3,d0
[00026662] 3833 0802                 move.w     2(a3,d0.l),d4
[00026666] 4eb9 0004 810e            jsr        Adr_unselect
[0002666c] 2852                      movea.l    (a2),a4
[0002666e] 3a2c 0018                 move.w     24(a4),d5
[00026672] 4a44                      tst.w      d4
[00026674] 6a26                      bpl.s      open_menu_1
[00026676] 4eb9 0005 0c80            jsr        Aev_release
[0002667c] 41f9 000c 497c            lea.l      NEW_POPUP,a0
[00026682] 7001                      moveq.l    #1,d0
[00026684] 4eb9 0005 a600            jsr        Awi_alert
[0002668a] 5540                      subq.w     #2,d0
[0002668c] 6700 0088                 beq        open_menu_2
[00026690] 3003                      move.w     d3,d0
[00026692] 204a                      movea.l    a2,a0
[00026694] 6100 ff44                 bsr        new_menu
[00026698] 266a 0014                 movea.l    20(a2),a3
open_menu_1:
[0002669c] 7201                      moveq.l    #1,d1
[0002669e] 3403                      move.w     d3,d2
[000266a0] 48c2                      ext.l      d2
[000266a2] 2002                      move.l     d2,d0
[000266a4] d080                      add.l      d0,d0
[000266a6] d082                      add.l      d2,d0
[000266a8] e788                      lsl.l      #3,d0
[000266aa] 8273 08f2                 or.w       -14(a3,d0.l),d1
[000266ae] 70ff                      moveq.l    #-1,d0
[000266b0] d043                      add.w      d3,d0
[000266b2] 204a                      movea.l    a2,a0
[000266b4] 226a 0066                 movea.l    102(a2),a1
[000266b8] 4e91                      jsr        (a1)
[000266ba] 7801                      moveq.l    #1,d4
[000266bc] 3203                      move.w     d3,d1
[000266be] 48c1                      ext.l      d1
[000266c0] 2001                      move.l     d1,d0
[000266c2] d080                      add.l      d0,d0
[000266c4] d081                      add.l      d1,d0
[000266c6] e788                      lsl.l      #3,d0
[000266c8] d873 0802                 add.w      2(a3,d0.l),d4
[000266cc] 3944 0018                 move.w     d4,24(a4)
[000266d0] 74fe                      moveq.l    #-2,d2
[000266d2] d444                      add.w      d4,d2
[000266d4] 48c2                      ext.l      d2
[000266d6] 85fc 0003                 divs.w     #$0003,d2
[000266da] 3942 000a                 move.w     d2,10(a4)
[000266de] 3005                      move.w     d5,d0
[000266e0] 48c0                      ext.l      d0
[000266e2] 2600                      move.l     d0,d3
[000266e4] d683                      add.l      d3,d3
[000266e6] d680                      add.l      d0,d3
[000266e8] e78b                      lsl.l      #3,d3
[000266ea] 0273 e7ff 3808            andi.w     #$E7FF,8(a3,d3.l)
[000266f0] 3204                      move.w     d4,d1
[000266f2] 48c1                      ext.l      d1
[000266f4] 2a01                      move.l     d1,d5
[000266f6] da85                      add.l      d5,d5
[000266f8] da81                      add.l      d1,d5
[000266fa] e78d                      lsl.l      #3,d5
[000266fc] 0073 1800 5808            ori.w      #$1800,8(a3,d5.l)
[00026702] 204a                      movea.l    a2,a0
[00026704] 3004                      move.w     d4,d0
[00026706] 4eb9 0002 68c6            jsr        set_menu
[0002670c] 3004                      move.w     d4,d0
[0002670e] 204a                      movea.l    a2,a0
[00026710] 4eb9 0005 1b80            jsr        Awi_obredraw
open_menu_2:
[00026716] 4cdf 1c38                 movem.l    (a7)+,d3-d5/a2-a4
[0002671a] 4e75                      rts

pup_edit:
[0002671c] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[00026720] 4fef fff0                 lea.l      -16(a7),a7
[00026724] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002672a] 2468 0258                 movea.l    600(a0),a2
[0002672e] 266a 0014                 movea.l    20(a2),a3
[00026732] 3828 0260                 move.w     608(a0),d4
[00026736] 2852                      movea.l    (a2),a4
[00026738] 362c 0018                 move.w     24(a4),d3
[0002673c] 70ff                      moveq.l    #-1,d0
[0002673e] d043                      add.w      d3,d0
[00026740] 224b                      movea.l    a3,a1
[00026742] 41d7                      lea.l      (a7),a0
[00026744] 4eb9 0004 fe06            jsr        Aob_offset
[0002674a] 70ff                      moveq.l    #-1,d0
[0002674c] d044                      add.w      d4,d0
[0002674e] 224b                      movea.l    a3,a1
[00026750] 41ef 0008                 lea.l      8(a7),a0
[00026754] 4eb9 0004 fe06            jsr        Aob_offset
[0002675a] 43ef 0008                 lea.l      8(a7),a1
[0002675e] 41d7                      lea.l      (a7),a0
[00026760] 4eb9 0006 c662            jsr        intersect
[00026766] 302f 0004                 move.w     4(a7),d0
[0002676a] 6752                      beq.s      pup_edit_1
[0002676c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026772] 0c68 0002 02ca            cmpi.w     #$0002,714(a0)
[00026778] 6616                      bne.s      pup_edit_2
[0002677a] 204b                      movea.l    a3,a0
[0002677c] 3004                      move.w     d4,d0
[0002677e] 4eb9 0005 0f3a            jsr        Aob_up
[00026784] b640                      cmp.w      d0,d3
[00026786] 6608                      bne.s      pup_edit_2
[00026788] 6100 feb6                 bsr        open_menu
[0002678c] 6000 012e                 bra        pup_edit_3
pup_edit_2:
[00026790] 3204                      move.w     d4,d1
[00026792] 48c1                      ext.l      d1
[00026794] 2001                      move.l     d1,d0
[00026796] d080                      add.l      d0,d0
[00026798] d081                      add.l      d1,d0
[0002679a] e788                      lsl.l      #3,d0
[0002679c] 0073 0040 080a            ori.w      #$0040,10(a3,d0.l)
[000267a2] 4eb9 0002 deb8            jsr        ed_edit
[000267a8] 3204                      move.w     d4,d1
[000267aa] 48c1                      ext.l      d1
[000267ac] 2001                      move.l     d1,d0
[000267ae] d080                      add.l      d0,d0
[000267b0] d081                      add.l      d1,d0
[000267b2] e788                      lsl.l      #3,d0
[000267b4] 0273 ffbf 080a            andi.w     #$FFBF,10(a3,d0.l)
[000267ba] 6000 0100                 bra        pup_edit_3
pup_edit_1:
[000267be] 4eb9 0004 810e            jsr        Adr_unselect
[000267c4] 3203                      move.w     d3,d1
[000267c6] 48c1                      ext.l      d1
[000267c8] 2001                      move.l     d1,d0
[000267ca] d080                      add.l      d0,d0
[000267cc] d081                      add.l      d1,d0
[000267ce] e788                      lsl.l      #3,d0
[000267d0] 0273 e7ff 0808            andi.w     #$E7FF,8(a3,d0.l)
[000267d6] 204a                      movea.l    a2,a0
[000267d8] 3003                      move.w     d3,d0
[000267da] 4eb9 0002 f244            jsr        undraw
[000267e0] 7801                      moveq.l    #1,d4
[000267e2] d86b 0002                 add.w      2(a3),d4
[000267e6] 6014                      bra.s      pup_edit_4
[000267e8] 7001                      moveq.l    #1,d0
pup_edit_5:
[000267ea] 3404                      move.w     d4,d2
[000267ec] 48c2                      ext.l      d2
[000267ee] 2202                      move.l     d2,d1
[000267f0] d281                      add.l      d1,d1
[000267f2] d282                      add.l      d2,d1
[000267f4] e789                      lsl.l      #3,d1
[000267f6] d073 1800                 add.w      0(a3,d1.l),d0
[000267fa] 3800                      move.w     d0,d4
pup_edit_4:
[000267fc] 7001                      moveq.l    #1,d0
[000267fe] 3404                      move.w     d4,d2
[00026800] 48c2                      ext.l      d2
[00026802] 2202                      move.l     d2,d1
[00026804] d281                      add.l      d1,d1
[00026806] d282                      add.l      d2,d1
[00026808] e789                      lsl.l      #3,d1
[0002680a] d073 1800                 add.w      0(a3,d1.l),d0
[0002680e] b640                      cmp.w      d0,d3
[00026810] 66d6                      bne.s      pup_edit_5
[00026812] 4273 1800                 clr.w      0(a3,d1.l)
[00026816] 3744 0004                 move.w     d4,4(a3)
[0002681a] 206c 0004                 movea.l    4(a4),a0
[0002681e] 2a68 0004                 movea.l    4(a0),a5
[00026822] 78fe                      moveq.l    #-2,d4
[00026824] d843                      add.w      d3,d4
[00026826] 48c4                      ext.l      d4
[00026828] 89fc 0003                 divs.w     #$0003,d4
[0002682c] 48c4                      ext.l      d4
[0002682e] 2004                      move.l     d4,d0
[00026830] e788                      lsl.l      #3,d0
[00026832] 9084                      sub.l      d4,d0
[00026834] e788                      lsl.l      #3,d0
[00026836] dbc0                      adda.l     d0,a5
[00026838] 342d 0008                 move.w     8(a5),d2
[0002683c] 3802                      move.w     d2,d4
[0002683e] d844                      add.w      d4,d4
[00026840] d842                      add.w      d2,d4
[00026842] 5444                      addq.w     #2,d4
[00026844] 72ff                      moveq.l    #-1,d1
[00026846] d243                      add.w      d3,d1
[00026848] 3404                      move.w     d4,d2
[0002684a] 48c2                      ext.l      d2
[0002684c] 2002                      move.l     d2,d0
[0002684e] d080                      add.l      d0,d0
[00026850] d082                      add.l      d2,d0
[00026852] e788                      lsl.l      #3,d0
[00026854] 3781 0802                 move.w     d1,2(a3,d0.l)
[00026858] 3783 0804                 move.w     d3,4(a3,d0.l)
[0002685c] 3403                      move.w     d3,d2
[0002685e] 48c2                      ext.l      d2
[00026860] 2202                      move.l     d2,d1
[00026862] d281                      add.l      d1,d1
[00026864] d282                      add.l      d2,d1
[00026866] e789                      lsl.l      #3,d1
[00026868] 3784 1800                 move.w     d4,0(a3,d1.l)
[0002686c] 3233 08f0                 move.w     -16(a3,d0.l),d1
[00026870] c27c fffe                 and.w      #$FFFE,d1
[00026874] 70ff                      moveq.l    #-1,d0
[00026876] d044                      add.w      d4,d0
[00026878] 204a                      movea.l    a2,a0
[0002687a] 226a 0066                 movea.l    102(a2),a1
[0002687e] 4e91                      jsr        (a1)
[00026880] 3004                      move.w     d4,d0
[00026882] 204b                      movea.l    a3,a0
[00026884] 4eb9 0005 0f3a            jsr        Aob_up
[0002688a] 3600                      move.w     d0,d3
[0002688c] 3940 0018                 move.w     d0,24(a4)
[00026890] 4a43                      tst.w      d3
[00026892] 6b10                      bmi.s      pup_edit_6
[00026894] 72fe                      moveq.l    #-2,d1
[00026896] d243                      add.w      d3,d1
[00026898] 48c1                      ext.l      d1
[0002689a] 83fc 0003                 divs.w     #$0003,d1
[0002689e] 3941 000a                 move.w     d1,10(a4)
[000268a2] 6006                      bra.s      pup_edit_7
pup_edit_6:
[000268a4] 397c ffff 000a            move.w     #$FFFF,10(a4)
pup_edit_7:
[000268aa] 3203                      move.w     d3,d1
[000268ac] 48c1                      ext.l      d1
[000268ae] 2001                      move.l     d1,d0
[000268b0] d080                      add.l      d0,d0
[000268b2] d081                      add.l      d1,d0
[000268b4] e788                      lsl.l      #3,d0
[000268b6] 0073 1800 0808            ori.w      #$1800,8(a3,d0.l)
pup_edit_3:
[000268bc] 4fef 0010                 lea.l      16(a7),a7
[000268c0] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[000268c4] 4e75                      rts

set_menu:
[000268c6] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[000268ca] 2448                      movea.l    a0,a2
[000268cc] 3600                      move.w     d0,d3
[000268ce] 266a 0014                 movea.l    20(a2),a3
[000268d2] 204b                      movea.l    a3,a0
[000268d4] 4eb9 0005 0f3a            jsr        Aob_up
[000268da] 3800                      move.w     d0,d4
[000268dc] 5340                      subq.w     #1,d0
[000268de] 6d00 00b6                 blt        set_menu_1
[000268e2] 72ff                      moveq.l    #-1,d1
[000268e4] 3004                      move.w     d4,d0
[000268e6] 48c0                      ext.l      d0
[000268e8] 2400                      move.l     d0,d2
[000268ea] d482                      add.l      d2,d2
[000268ec] d480                      add.l      d0,d2
[000268ee] e78a                      lsl.l      #3,d2
[000268f0] 3781 2804                 move.w     d1,4(a3,d2.l)
[000268f4] 3781 2802                 move.w     d1,2(a3,d2.l)
[000268f8] 0073 0001 28f2            ori.w      #$0001,-14(a3,d2.l)
[000268fe] 3003                      move.w     d3,d0
[00026900] 48c0                      ext.l      d0
[00026902] 2200                      move.l     d0,d1
[00026904] d281                      add.l      d1,d1
[00026906] d280                      add.l      d0,d1
[00026908] e789                      lsl.l      #3,d1
[0002690a] 0273 ff7f 1808            andi.w     #$FF7F,8(a3,d1.l)
[00026910] 0273 ff7f 18f0            andi.w     #$FF7F,-16(a3,d1.l)
[00026916] 204b                      movea.l    a3,a0
[00026918] 3004                      move.w     d4,d0
[0002691a] 4eb9 0005 0f3a            jsr        Aob_up
[00026920] 3800                      move.w     d0,d4
[00026922] 204a                      movea.l    a2,a0
[00026924] 6100 ffa0                 bsr.w      set_menu
[00026928] 382b 0004                 move.w     4(a3),d4
[0002692c] 302b 002a                 move.w     42(a3),d0
[00026930] 3403                      move.w     d3,d2
[00026932] 48c2                      ext.l      d2
[00026934] 2202                      move.l     d2,d1
[00026936] d281                      add.l      d1,d1
[00026938] d282                      add.l      d2,d1
[0002693a] e789                      lsl.l      #3,d1
[0002693c] 3780 1812                 move.w     d0,18(a3,d1.l)
[00026940] 3780 18fa                 move.w     d0,-6(a3,d1.l)
[00026944] 3404                      move.w     d4,d2
[00026946] 48c2                      ext.l      d2
[00026948] 2002                      move.l     d2,d0
[0002694a] d080                      add.l      d0,d0
[0002694c] d082                      add.l      d2,d0
[0002694e] e788                      lsl.l      #3,d0
[00026950] 3233 0810                 move.w     16(a3,d0.l),d1
[00026954] d273 0814                 add.w      20(a3,d0.l),d1
[00026958] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002695e] 3428 0012                 move.w     18(a0),d2
[00026962] d442                      add.w      d2,d2
[00026964] d242                      add.w      d2,d1
[00026966] 3403                      move.w     d3,d2
[00026968] 48c2                      ext.l      d2
[0002696a] 2002                      move.l     d2,d0
[0002696c] d080                      add.l      d0,d0
[0002696e] d082                      add.l      d2,d0
[00026970] e788                      lsl.l      #3,d0
[00026972] 3781 0810                 move.w     d1,16(a3,d0.l)
[00026976] 3781 08f8                 move.w     d1,-8(a3,d0.l)
[0002697a] 4273 0800                 clr.w      0(a3,d0.l)
[0002697e] 72ff                      moveq.l    #-1,d1
[00026980] d243                      add.w      d3,d1
[00026982] 3004                      move.w     d4,d0
[00026984] 48c0                      ext.l      d0
[00026986] 2400                      move.l     d0,d2
[00026988] d482                      add.l      d2,d2
[0002698a] d480                      add.l      d0,d2
[0002698c] e78a                      lsl.l      #3,d2
[0002698e] 3781 2800                 move.w     d1,0(a3,d2.l)
[00026992] 3743 0004                 move.w     d3,4(a3)
set_menu_1:
[00026996] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[0002699a] 4e75                      rts

	.data

subtree:
[000bb658]                           dc.w $0000
[000bb65a]                           dc.w $0000
[000bb65c]                           dc.w $0000
[000bb65e]                           dc.w $0000
[000bb660]                           dc.w $ffff
[000bb662]                           dc.w $ffff
[000bb664]                           dc.w $ffff
[000bb666]                           dc.w $0014
[000bb668]                           dc.w $0080
[000bb66a]                           dc.w $0020
[000bb66c]                           dc.w $00ff
[000bb66e]                           dc.w $1101
[000bb670]                           dc.w $0000
[000bb672]                           dc.w $0000
[000bb674]                           dc.w $000c
[000bb676]                           dc.w $0004
[000bb678]                           dc.w $0000
[000bb67a]                           dc.w $0000
[000bb67c]                           dc.w $0000
[000bb67e]                           dc.w $0000
[000bb680]                           dc.w $8000
[000bb682]                           dc.w $0000
[000bb684]                           dc.w $0000
[000bb686]                           dc.w $0000
[000bb688]                           dc.w $0000
[000bb68a]                           dc.w $0000
[000bb68c]                           dc.w $0000
[000bb68e]                           dc.w $0000
protosub:
[000bb690]                           dc.w $0000
[000bb692]                           dc.w $0000
[000bb694] 000bb658                  dc.l subtree
[000bb698]                           dc.w $0000
[000bb69a]                           dc.w $0000
[000bb69c]                           dc.w $0038
[000bb69e]                           dc.w $0000
[000bb6a0]                           dc.w $0038
[000bb6a2]                           dc.w $0000
[000bb6a4]                           dc.w $0000
[000bb6a6]                           dc.b 'SUBPROTO',0
[000bb6af]                           dc.b $00
[000bb6b0]                           dc.w $0000
[000bb6b2]                           dc.w $0000
[000bb6b4]                           dc.w $0000
[000bb6b6]                           dc.w $0000
[000bb6b8]                           dc.w $0000
[000bb6ba]                           dc.w $0000
[000bb6bc]                           dc.w $0000
[000bb6be]                           dc.w $0000
[000bb6c0]                           dc.w $0000
[000bb6c2]                           dc.w $0000
[000bb6c4]                           dc.w $0000
[000bb6c6]                           dc.w $0001
[000bb6c8]                           dc.w $0000
[000bb6ca]                           dc.w $0000
[000bb6cc]                           dc.w $0000
[000bb6ce]                           dc.w $0000
[000bb6d0]                           dc.w $0000
