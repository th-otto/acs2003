
editref_abort:
[0001d480] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001d486] 2068 0258                 movea.l    600(a0),a0
[0001d48a] 4eb9 0001 d7da            jsr        term
[0001d490] 4e75                      rts

editref_ok:
[0001d492] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001d498] 2068 0258                 movea.l    600(a0),a0
[0001d49c] 4eb9 0001 d4b4            jsr        acc_eref
[0001d4a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001d4a8] 2068 0258                 movea.l    600(a0),a0
[0001d4ac] 4eb9 0001 d7da            jsr        term
[0001d4b2] 4e75                      rts

acc_eref:
[0001d4b4] 48e7 0038                 movem.l    a2-a4,-(a7)
[0001d4b8] 4fef fff4                 lea.l      -12(a7),a7
[0001d4bc] 2250                      movea.l    (a0),a1
[0001d4be] 2451                      movea.l    (a1),a2
[0001d4c0] 006a 0001 0006            ori.w      #$0001,6(a2)
[0001d4c6] 2468 0014                 movea.l    20(a0),a2
[0001d4ca] 45ea 0150                 lea.l      336(a2),a2
[0001d4ce] 2f4a 0004                 move.l     a2,4(a7)
[0001d4d2] 2669 0004                 movea.l    4(a1),a3
[0001d4d6] 302b 0038                 move.w     56(a3),d0
[0001d4da] 3200                      move.w     d0,d1
[0001d4dc] c27c fd00                 and.w      #$FD00,d1
[0001d4e0] 343c 00ff                 move.w     #$00FF,d2
[0001d4e4] c46a 000e                 and.w      14(a2),d2
[0001d4e8] 8242                      or.w       d2,d1
[0001d4ea] 3741 0038                 move.w     d1,56(a3)
[0001d4ee] 7001                      moveq.l    #1,d0
[0001d4f0] 2468 0014                 movea.l    20(a0),a2
[0001d4f4] c06a 0052                 and.w      82(a2),d0
[0001d4f8] 6706                      beq.s      acc_eref_1
[0001d4fa] 006b 0200 0038            ori.w      #$0200,56(a3)
acc_eref_1:
[0001d500] 2469 0008                 movea.l    8(a1),a2
[0001d504] 200a                      move.l     a2,d0
[0001d506] 6700 007c                 beq.w      acc_eref_2
[0001d50a] 43ef 0008                 lea.l      8(a7),a1
[0001d50e] 204a                      movea.l    a2,a0
[0001d510] 286a 0004                 movea.l    4(a2),a4
[0001d514] 303c 00cf                 move.w     #$00CF,d0
[0001d518] 4e94                      jsr        (a4)
[0001d51a] 202f 0008                 move.l     8(a7),d0
[0001d51e] 6f4c                      ble.s      acc_eref_3
[0001d520] 7001                      moveq.l    #1,d0
[0001d522] d0af 0008                 add.l      8(a7),d0
[0001d526] 4eb9 0004 c608            jsr        Ax_malloc
[0001d52c] 2e88                      move.l     a0,(a7)
[0001d52e] 2008                      move.l     a0,d0
[0001d530] 6752                      beq.s      acc_eref_2
[0001d532] 206b 0004                 movea.l    4(a3),a0
[0001d536] 4eb9 0004 c6c8            jsr        Ax_ifree
[0001d53c] 2257                      movea.l    (a7),a1
[0001d53e] 303c 00ce                 move.w     #$00CE,d0
[0001d542] 204a                      movea.l    a2,a0
[0001d544] 286a 0004                 movea.l    4(a2),a4
[0001d548] 4e94                      jsr        (a4)
[0001d54a] 2757 0004                 move.l     (a7),4(a3)
[0001d54e] 7001                      moveq.l    #1,d0
[0001d550] d0af 0008                 add.l      8(a7),d0
[0001d554] 2740 000e                 move.l     d0,14(a3)
[0001d558] 2740 000a                 move.l     d0,10(a3)
[0001d55c] 93c9                      suba.l     a1,a1
[0001d55e] 204a                      movea.l    a2,a0
[0001d560] 286a 0004                 movea.l    4(a2),a4
[0001d564] 303c 00d3                 move.w     #$00D3,d0
[0001d568] 4e94                      jsr        (a4)
[0001d56a] 6018                      bra.s      acc_eref_2
acc_eref_3:
[0001d56c] 206b 0004                 movea.l    4(a3),a0
[0001d570] 4eb9 0004 c6c8            jsr        Ax_ifree
[0001d576] 42ab 0004                 clr.l      4(a3)
[0001d57a] 7000                      moveq.l    #0,d0
[0001d57c] 2740 000e                 move.l     d0,14(a3)
[0001d580] 2740 000a                 move.l     d0,10(a3)
acc_eref_2:
[0001d584] 4fef 000c                 lea.l      12(a7),a7
[0001d588] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0001d58c] 4e75                      rts

rf_make:
[0001d58e] 48e7 0038                 movem.l    a2-a4,-(a7)
[0001d592] 594f                      subq.w     #4,a7
[0001d594] 2e88                      move.l     a0,(a7)
[0001d596] 2668 0004                 movea.l    4(a0),a3
[0001d59a] 286b 0012                 movea.l    18(a3),a4
[0001d59e] 200c                      move.l     a4,d0
[0001d5a0] 670c                      beq.s      rf_make_1
[0001d5a2] 204c                      movea.l    a4,a0
[0001d5a4] 4eb9 0005 6bea            jsr        Awi_show
[0001d5aa] 6000 00a6                 bra        rf_make_2
rf_make_1:
[0001d5ae] 700c                      moveq.l    #12,d0
[0001d5b0] 4eb9 0004 c608            jsr        Ax_malloc
[0001d5b6] 2448                      movea.l    a0,a2
[0001d5b8] 200a                      move.l     a2,d0
[0001d5ba] 6700 0092                 beq        rf_make_3
[0001d5be] 2257                      movea.l    (a7),a1
[0001d5c0] 2091                      move.l     (a1),(a0)
[0001d5c2] 2569 0004 0004            move.l     4(a1),4(a2)
[0001d5c8] 42aa 0008                 clr.l      8(a2)
[0001d5cc] 41eb 0016                 lea.l      22(a3),a0
[0001d5d0] 23c8 000a aef0            move.l     a0,$000AAEF0
[0001d5d6] 2279 000a aefc            movea.l    $000AAEFC,a1
[0001d5dc] 2348 0008                 move.l     a0,8(a1)
[0001d5e0] 41f9 000a aea2            lea.l      WI_REF,a0
[0001d5e6] 4eb9 0005 7052            jsr        Awi_create
[0001d5ec] 2848                      movea.l    a0,a4
[0001d5ee] 200c                      move.l     a4,d0
[0001d5f0] 660a                      bne.s      rf_make_4
[0001d5f2] 204a                      movea.l    a2,a0
[0001d5f4] 4eb9 0004 c7c8            jsr        Ax_free
[0001d5fa] 6052                      bra.s      rf_make_3
rf_make_4:
[0001d5fc] 2057                      movea.l    (a7),a0
[0001d5fe] 2250                      movea.l    (a0),a1
[0001d600] 4869 0168                 pea.l      360(a1)
[0001d604] 43eb 003a                 lea.l      58(a3),a1
[0001d608] 204c                      movea.l    a4,a0
[0001d60a] 4eb9 0001 6372            jsr        wi_pos
[0001d610] 584f                      addq.w     #4,a7
[0001d612] 288a                      move.l     a2,(a4)
[0001d614] 274c 0012                 move.l     a4,18(a3)
[0001d618] 204c                      movea.l    a4,a0
[0001d61a] 4eb9 0001 d77c            jsr        set_eref
[0001d620] 202b 000e                 move.l     14(a3),d0
[0001d624] 6f14                      ble.s      rf_make_5
[0001d626] 322b 0038                 move.w     56(a3),d1
[0001d62a] c27c 0200                 and.w      #$0200,d1
[0001d62e] 660a                      bne.s      rf_make_5
[0001d630] 204c                      movea.l    a4,a0
[0001d632] 4eb9 0001 d876            jsr        ref_edit
[0001d638] 6018                      bra.s      rf_make_2
rf_make_5:
[0001d63a] 204c                      movea.l    a4,a0
[0001d63c] 226c 000c                 movea.l    12(a4),a1
[0001d640] 4e91                      jsr        (a1)
[0001d642] 4a40                      tst.w      d0
[0001d644] 670c                      beq.s      rf_make_2
[0001d646] 204c                      movea.l    a4,a0
[0001d648] 4eb9 0001 d7da            jsr        term
rf_make_3:
[0001d64e] 91c8                      suba.l     a0,a0
[0001d650] 6002                      bra.s      rf_make_6
rf_make_2:
[0001d652] 204c                      movea.l    a4,a0
rf_make_6:
[0001d654] 584f                      addq.w     #4,a7
[0001d656] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0001d65a] 4e75                      rts

rf_service:
[0001d65c] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0001d660] 2448                      movea.l    a0,a2
[0001d662] 3600                      move.w     d0,d3
[0001d664] 2849                      movea.l    a1,a4
[0001d666] 2650                      movea.l    (a0),a3
[0001d668] 5540                      subq.w     #2,d0
[0001d66a] 6712                      beq.s      rf_service_1
[0001d66c] 907c 00cf                 sub.w      #$00CF,d0
[0001d670] 6712                      beq.s      rf_service_2
[0001d672] 5340                      subq.w     #1,d0
[0001d674] 6708                      beq.s      rf_service_1
[0001d676] 907c 263e                 sub.w      #$263E,d0
[0001d67a] 6712                      beq.s      rf_service_3
[0001d67c] 601e                      bra.s      rf_service_4
rf_service_1:
[0001d67e] 204a                      movea.l    a2,a0
[0001d680] 6100 fe32                 bsr        acc_eref
rf_service_2:
[0001d684] 204a                      movea.l    a2,a0
[0001d686] 4eb9 0001 d7da            jsr        term
[0001d68c] 601c                      bra.s      rf_service_5
rf_service_3:
[0001d68e] 226b 0004                 movea.l    4(a3),a1
[0001d692] 204a                      movea.l    a2,a0
[0001d694] 4eb9 0001 60ea            jsr        new_name
[0001d69a] 600e                      bra.s      rf_service_5
rf_service_4:
[0001d69c] 224c                      movea.l    a4,a1
[0001d69e] 3003                      move.w     d3,d0
[0001d6a0] 204a                      movea.l    a2,a0
[0001d6a2] 4eb9 0005 9dd0            jsr        Awi_service
[0001d6a8] 6002                      bra.s      rf_service_6
rf_service_5:
[0001d6aa] 7001                      moveq.l    #1,d0
rf_service_6:
[0001d6ac] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0001d6b0] 4e75                      rts

set_type:
[0001d6b2] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0001d6b6] 4fef ffce                 lea.l      -50(a7),a7
[0001d6ba] 2848                      movea.l    a0,a4
[0001d6bc] 2449                      movea.l    a1,a2
[0001d6be] 3600                      move.w     d0,d3
[0001d6c0] 43d7                      lea.l      (a7),a1
[0001d6c2] 204a                      movea.l    a2,a0
[0001d6c4] 4eb9 0005 11da            jsr        Aob_gettext
[0001d6ca] 47d7                      lea.l      (a7),a3
[0001d6cc] 6002                      bra.s      set_type_1
[0001d6ce] 524b                      addq.w     #1,a3
set_type_2:
set_type_1:
[0001d6d0] 0c13 0020                 cmpi.b     #$20,(a3)
[0001d6d4] 67f8                      beq.s      set_type_2
[0001d6d6] 224b                      movea.l    a3,a1
[0001d6d8] 700d                      moveq.l    #13,d0
[0001d6da] 204c                      movea.l    a4,a0
[0001d6dc] 4eb9 0005 0fd8            jsr        Aob_puttext
[0001d6e2] 49ec 0150                 lea.l      336(a4),a4
[0001d6e6] 3203                      move.w     d3,d1
[0001d6e8] 48c1                      ext.l      d1
[0001d6ea] 2001                      move.l     d1,d0
[0001d6ec] d080                      add.l      d0,d0
[0001d6ee] d081                      add.l      d1,d0
[0001d6f0] e788                      lsl.l      #3,d0
[0001d6f2] 41f2 0818                 lea.l      24(a2,d0.l),a0
[0001d6f6] 2968 000c 000c            move.l     12(a0),12(a4)
[0001d6fc] 4fef 0032                 lea.l      50(a7),a7
[0001d700] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0001d704] 4e75                      rts

editref_choose:
[0001d706] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0001d70a] 45f9 000a a19a            lea.l      REF_TYPE,a2
[0001d710] 47f9 0010 ee4e            lea.l      ACSblk,a3
[0001d716] 72ff                      moveq.l    #-1,d1
[0001d718] 70ff                      moveq.l    #-1,d0
[0001d71a] 224a                      movea.l    a2,a1
[0001d71c] 2053                      movea.l    (a3),a0
[0001d71e] 2068 0258                 movea.l    600(a0),a0
[0001d722] 4eb9 0004 e84a            jsr        Ame_popup
[0001d728] 3600                      move.w     d0,d3
[0001d72a] 4a40                      tst.w      d0
[0001d72c] 6b48                      bmi.s      editref_choose_1
[0001d72e] 48c0                      ext.l      d0
[0001d730] 2200                      move.l     d0,d1
[0001d732] d281                      add.l      d1,d1
[0001d734] d280                      add.l      d0,d1
[0001d736] e789                      lsl.l      #3,d1
[0001d738] 41f2 1818                 lea.l      24(a2,d1.l),a0
[0001d73c] b67c 0001                 cmp.w      #$0001,d3
[0001d740] 6710                      beq.s      editref_choose_2
[0001d742] 3428 0008                 move.w     8(a0),d2
[0001d746] c47c 8000                 and.w      #$8000,d2
[0001d74a] 672a                      beq.s      editref_choose_1
[0001d74c] 3228 000e                 move.w     14(a0),d1
[0001d750] 6724                      beq.s      editref_choose_1
editref_choose_2:
[0001d752] 3003                      move.w     d3,d0
[0001d754] 224a                      movea.l    a2,a1
[0001d756] 2053                      movea.l    (a3),a0
[0001d758] 2068 025c                 movea.l    604(a0),a0
[0001d75c] 6100 ff54                 bsr        set_type
[0001d760] 72ff                      moveq.l    #-1,d1
[0001d762] 700d                      moveq.l    #13,d0
[0001d764] 2053                      movea.l    (a3),a0
[0001d766] 2068 0258                 movea.l    600(a0),a0
[0001d76a] 2253                      movea.l    (a3),a1
[0001d76c] 2469 0258                 movea.l    600(a1),a2
[0001d770] 226a 0066                 movea.l    102(a2),a1
[0001d774] 4e91                      jsr        (a1)
editref_choose_1:
[0001d776] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0001d77a] 4e75                      rts

set_eref:
[0001d77c] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0001d780] 2448                      movea.l    a0,a2
[0001d782] 2650                      movea.l    (a0),a3
[0001d784] 226b 0004                 movea.l    4(a3),a1
[0001d788] 3629 0038                 move.w     56(a1),d3
[0001d78c] c67c 00ff                 and.w      #$00FF,d3
[0001d790] 4a43                      tst.w      d3
[0001d792] 6b08                      bmi.s      set_eref_1
[0001d794] b679 000a af90            cmp.w      cross_type_anz,d3
[0001d79a] 6d02                      blt.s      set_eref_2
set_eref_1:
[0001d79c] 4243                      clr.w      d3
set_eref_2:
[0001d79e] 3203                      move.w     d3,d1
[0001d7a0] d241                      add.w      d1,d1
[0001d7a2] 41f9 000a af44            lea.l      cross_type,a0
[0001d7a8] 3030 1000                 move.w     0(a0,d1.w),d0
[0001d7ac] 43f9 000a a19a            lea.l      REF_TYPE,a1
[0001d7b2] 206a 0014                 movea.l    20(a2),a0
[0001d7b6] 6100 fefa                 bsr        set_type
[0001d7ba] 206a 0014                 movea.l    20(a2),a0
[0001d7be] 41e8 0048                 lea.l      72(a0),a0
[0001d7c2] 226b 0004                 movea.l    4(a3),a1
[0001d7c6] 3029 0038                 move.w     56(a1),d0
[0001d7ca] c07c 0200                 and.w      #$0200,d0
[0001d7ce] 4eb9 0001 58a2            jsr        set_flag
[0001d7d4] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0001d7d8] 4e75                      rts

term:
[0001d7da] 48e7 003c                 movem.l    a2-a5,-(a7)
[0001d7de] 2448                      movea.l    a0,a2
[0001d7e0] 302a 0056                 move.w     86(a2),d0
[0001d7e4] c07c 0200                 and.w      #$0200,d0
[0001d7e8] 6600 0086                 bne        term_1
[0001d7ec] 006a 0300 0056            ori.w      #$0300,86(a2)
[0001d7f2] 2650                      movea.l    (a0),a3
[0001d7f4] 286b 0008                 movea.l    8(a3),a4
[0001d7f8] 200c                      move.l     a4,d0
[0001d7fa] 6728                      beq.s      term_2
[0001d7fc] 93c9                      suba.l     a1,a1
[0001d7fe] 2a6c 0004                 movea.l    4(a4),a5
[0001d802] 204c                      movea.l    a4,a0
[0001d804] 303c 00d3                 move.w     #$00D3,d0
[0001d808] 4e95                      jsr        (a5)
[0001d80a] 93c9                      suba.l     a1,a1
[0001d80c] 303c 00d0                 move.w     #$00D0,d0
[0001d810] 204c                      movea.l    a4,a0
[0001d812] 2a6c 0004                 movea.l    4(a4),a5
[0001d816] 4e95                      jsr        (a5)
[0001d818] 93c9                      suba.l     a1,a1
[0001d81a] 7002                      moveq.l    #2,d0
[0001d81c] 204c                      movea.l    a4,a0
[0001d81e] 2a6c 0004                 movea.l    4(a4),a5
[0001d822] 4e95                      jsr        (a5)
term_2:
[0001d824] 206b 0004                 movea.l    4(a3),a0
[0001d828] 42a8 0012                 clr.l      18(a0)
[0001d82c] 302a 0056                 move.w     86(a2),d0
[0001d830] c07c 0800                 and.w      #$0800,d0
[0001d834] 6716                      beq.s      term_3
[0001d836] 43ea 002c                 lea.l      44(a2),a1
[0001d83a] 206b 0004                 movea.l    4(a3),a0
[0001d83e] 41e8 003a                 lea.l      58(a0),a0
[0001d842] 7008                      moveq.l    #8,d0
[0001d844] 4eb9 0008 3500            jsr        memcpy
[0001d84a] 6014                      bra.s      term_4
term_3:
[0001d84c] 7008                      moveq.l    #8,d0
[0001d84e] 43ea 0024                 lea.l      36(a2),a1
[0001d852] 206b 0004                 movea.l    4(a3),a0
[0001d856] 41e8 003a                 lea.l      58(a0),a0
[0001d85a] 4eb9 0008 3500            jsr        memcpy
term_4:
[0001d860] 204b                      movea.l    a3,a0
[0001d862] 4eb9 0004 c7c8            jsr        Ax_free
[0001d868] 204a                      movea.l    a2,a0
[0001d86a] 4eb9 0005 85f2            jsr        Awi_delete
term_1:
[0001d870] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0001d874] 4e75                      rts

ref_edit:
[0001d876] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[0001d87a] 4fef fbb4                 lea.l      -1100(a7),a7
[0001d87e] 2f48 0448                 move.l     a0,1096(a7)
[0001d882] 2450                      movea.l    (a0),a2
[0001d884] 266a 0008                 movea.l    8(a2),a3
[0001d888] 200b                      move.l     a3,d0
[0001d88a] 6600 017c                 bne        ref_edit_1
[0001d88e] 286a 0004                 movea.l    4(a2),a4
[0001d892] 43ec 0016                 lea.l      22(a4),a1
[0001d896] 2f49 0440                 move.l     a1,1088(a7)
[0001d89a] 2279 000d 34dc            movea.l    $000D34DC,a1
[0001d8a0] 91c8                      suba.l     a0,a0
[0001d8a2] 4e91                      jsr        (a1)
[0001d8a4] 2648                      movea.l    a0,a3
[0001d8a6] 2548 0008                 move.l     a0,8(a2)
[0001d8aa] 226f 0448                 movea.l    1096(a7),a1
[0001d8ae] 303c 00d0                 move.w     #$00D0,d0
[0001d8b2] 2a6b 0004                 movea.l    4(a3),a5
[0001d8b6] 204b                      movea.l    a3,a0
[0001d8b8] 4e95                      jsr        (a5)
[0001d8ba] 4bef 0400                 lea.l      1024(a7),a5
[0001d8be] 43f9 000a cb6f            lea.l      $000ACB6F,a1
[0001d8c4] 2f09                      move.l     a1,-(a7)
[0001d8c6] 43f9 000a cb6d            lea.l      $000ACB6D,a1
[0001d8cc] 204d                      movea.l    a5,a0
[0001d8ce] 4eb9 0008 2f0c            jsr        strcpy
[0001d8d4] 226f 0444                 movea.l    1092(a7),a1
[0001d8d8] 4eb9 0008 2e42            jsr        strcat
[0001d8de] 225f                      movea.l    (a7)+,a1
[0001d8e0] 4eb9 0008 2e42            jsr        strcat
[0001d8e6] 224d                      movea.l    a5,a1
[0001d8e8] 303c 00cb                 move.w     #$00CB,d0
[0001d8ec] 204b                      movea.l    a3,a0
[0001d8ee] 2c6b 0004                 movea.l    4(a3),a6
[0001d8f2] 4e96                      jsr        (a6)
[0001d8f4] 43f9 000a cb6f            lea.l      $000ACB6F,a1
[0001d8fa] 2f09                      move.l     a1,-(a7)
[0001d8fc] 43f9 000a cb77            lea.l      $000ACB77,a1
[0001d902] 204d                      movea.l    a5,a0
[0001d904] 4eb9 0008 2f0c            jsr        strcpy
[0001d90a] 226f 0444                 movea.l    1092(a7),a1
[0001d90e] 4eb9 0008 2e42            jsr        strcat
[0001d914] 225f                      movea.l    (a7)+,a1
[0001d916] 4eb9 0008 2e42            jsr        strcat
[0001d91c] 224d                      movea.l    a5,a1
[0001d91e] 303c 00cc                 move.w     #$00CC,d0
[0001d922] 204b                      movea.l    a3,a0
[0001d924] 2c6b 0004                 movea.l    4(a3),a6
[0001d928] 4e96                      jsr        (a6)
[0001d92a] 226f 0440                 movea.l    1088(a7),a1
[0001d92e] 303c 00d5                 move.w     #$00D5,d0
[0001d932] 204b                      movea.l    a3,a0
[0001d934] 2a6b 0004                 movea.l    4(a3),a5
[0001d938] 4e95                      jsr        (a5)
[0001d93a] 43f9 000a cb7b            lea.l      $000ACB7B,a1
[0001d940] 303c 00c9                 move.w     #$00C9,d0
[0001d944] 204b                      movea.l    a3,a0
[0001d946] 2a6b 0004                 movea.l    4(a3),a5
[0001d94a] 4e95                      jsr        (a5)
[0001d94c] 202c 000e                 move.l     14(a4),d0
[0001d950] 6f14                      ble.s      ref_edit_2
[0001d952] 226c 0004                 movea.l    4(a4),a1
[0001d956] 204b                      movea.l    a3,a0
[0001d958] 2a6b 0004                 movea.l    4(a3),a5
[0001d95c] 303c 00cd                 move.w     #$00CD,d0
[0001d960] 4e95                      jsr        (a5)
[0001d962] 6000 0088                 bra        ref_edit_3
ref_edit_2:
[0001d966] 2052                      movea.l    (a2),a0
[0001d968] 3028 020e                 move.w     526(a0),d0
[0001d96c] 4a40                      tst.w      d0
[0001d96e] 6706                      beq.s      ref_edit_4
[0001d970] 5340                      subq.w     #1,d0
[0001d972] 672a                      beq.s      ref_edit_5
[0001d974] 602e                      bra.s      ref_edit_6
ref_edit_4:
[0001d976] 302c 0038                 move.w     56(a4),d0
[0001d97a] c07c 0500                 and.w      #$0500,d0
[0001d97e] b07c 0100                 cmp.w      #$0100,d0
[0001d982] 6712                      beq.s      ref_edit_7
[0001d984] 43f9 000a cb7d            lea.l      $000ACB7D,a1
[0001d98a] 204b                      movea.l    a3,a0
[0001d98c] 246b 0004                 movea.l    4(a3),a2
[0001d990] 303c 00cd                 move.w     #$00CD,d0
[0001d994] 4e92                      jsr        (a2)
ref_edit_7:
[0001d996] 4bf9 000a b022            lea.l      c_type,a5
[0001d99c] 6006                      bra.s      ref_edit_6
ref_edit_5:
[0001d99e] 4bf9 000a af92            lea.l      p_type,a5
ref_edit_6:
[0001d9a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001d9aa] 2268 025c                 movea.l    604(a0),a1
[0001d9ae] 43e9 0150                 lea.l      336(a1),a1
[0001d9b2] 2f49 0444                 move.l     a1,1092(a7)
[0001d9b6] 3629 000e                 move.w     14(a1),d3
[0001d9ba] 486c 0016                 pea.l      22(a4)
[0001d9be] 486c 0016                 pea.l      22(a4)
[0001d9c2] 486c 0016                 pea.l      22(a4)
[0001d9c6] 3003                      move.w     d3,d0
[0001d9c8] 48c0                      ext.l      d0
[0001d9ca] e588                      lsl.l      #2,d0
[0001d9cc] 2275 0800                 movea.l    0(a5,d0.l),a1
[0001d9d0] 41ef 000c                 lea.l      12(a7),a0
[0001d9d4] 4eb9 0008 15ac            jsr        sprintf
[0001d9da] 4fef 000c                 lea.l      12(a7),a7
[0001d9de] 43d7                      lea.l      (a7),a1
[0001d9e0] 303c 00cd                 move.w     #$00CD,d0
[0001d9e4] 204b                      movea.l    a3,a0
[0001d9e6] 246b 0004                 movea.l    4(a3),a2
[0001d9ea] 4e92                      jsr        (a2)
ref_edit_3:
[0001d9ec] 93c9                      suba.l     a1,a1
[0001d9ee] 303c 00d4                 move.w     #$00D4,d0
[0001d9f2] 204b                      movea.l    a3,a0
[0001d9f4] 246b 0004                 movea.l    4(a3),a2
[0001d9f8] 4e92                      jsr        (a2)
[0001d9fa] 93c9                      suba.l     a1,a1
[0001d9fc] 303c 00d3                 move.w     #$00D3,d0
[0001da00] 204b                      movea.l    a3,a0
[0001da02] 246b 0004                 movea.l    4(a3),a2
[0001da06] 4e92                      jsr        (a2)
ref_edit_1:
[0001da08] 204b                      movea.l    a3,a0
[0001da0a] 4eb9 0005 6bea            jsr        Awi_show
[0001da10] 4fef 044c                 lea.l      1100(a7),a7
[0001da14] 4cdf 7c08                 movem.l    (a7)+,d3/a2-a6
[0001da18] 4e75                      rts

editref_edit:
[0001da1a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001da20] 2068 0258                 movea.l    600(a0),a0
[0001da24] 6100 fe50                 bsr        ref_edit
[0001da28] 4e75                      rts

	.data


BUBBLE_01:
[000a94ca]                           dc.b 'Die Žnderungen werden bernommen.',0
BUBBLE_02:
[000a94ec]                           dc.b 'Die Žnderungen werden verworfen.',0
BUBBLE_03:
[000a950d]                           dc.b 'Der Editor wird aufgerufen, um die Routine zu bearbeiten.',0
BUBBLE_04:
[000a9547]                           dc.b 'Die Routine wird extern definiert, also u.U. in einem anderen Modul.',0
BUBBLE_05:
[000a958c]                           dc.b 'In diesem Popup wird der Typ der Routine angegeben.',0
TEXT_002:
[000a95c0]                           dc.b 0
TEXT_003:
[000a95c1]                           dc.b 'OK',0
TEXT_004:
[000a95c4]                           dc.b 'Abbruch',0
TEXT_01:
[000a95cc]                           dc.b ' Closed',0
TEXT_02:
[000a95d4]                           dc.b 'Typ:',0
TEXT_03:
[000a95d9]                           dc.b 'GEMScript',0
TEXT_04:
[000a95e3]                           dc.b '  Iconify',0
TEXT_05:
[000a95ed]                           dc.b ' Fulled',0
TEXT_06:
[000a95f5]                           dc.b ' Arrowed',0
TEXT_07:
[000a95fe]                           dc.b ' Hslid',0
TEXT_08:
[000a9605]                           dc.b ' Vslid',0
TEXT_09:
[000a960c]                           dc.b ' Moved',0
TEXT_10:
[000a9613]                           dc.b ' Sized',0
TEXT_11:
[000a961a]                           dc.b ' Referenz-Editor ',0
TEXT_12:
[000a962c]                           dc.b '  Uniconify',0
TEXT_13:
[000a9638]                           dc.b '  GEMScript',0
TEXT_14:
[000a9644]                           dc.b 'Edit',0
TEXT_15:
[000a9649]                           dc.b 'extern',0
TEXT_16:
[000a9650]                           dc.b 'REFERENZ',0
TEXT_17:
[000a9659]                           dc.b '  Objekt   '
[000a9664]                           dc.w $0300
TEXT_174:
[000a9666]                           dc.b '  UOservice',0
TEXT_18:
[000a9672]                           dc.b '  Userdef  '
[000a967d]                           dc.b $03
[000a967e]                           dc.b 0
TEXT_19:
[000a9680]                           dc.b '  kein Typ',0
TEXT_20:
[000a968a]                           dc.b '  Fenster  '
[000a9695]                           dc.b $03
[000a9696]                           dc.b 0
TEXT_21:
[000a9698]                           dc.b '  DrawCode',0
TEXT_22:
[000a96a2]                           dc.b '  UO-Service',0
TEXT_23:
[000a96af]                           dc.b '  Closed',0
TEXT_24:
[000a96b8]                           dc.b '  System   '
[000a96c3]                           dc.b $03
[000a96c4]                           dc.b 0
TEXT_25:
[000a96c6]                           dc.b '  Fulled',0
TEXT_26:
[000a96ce]                           dc.b '  Arrowed',0
TEXT_27:
[000a96d8]                           dc.b '  V-Slide',0
TEXT_28:
[000a96e2]                           dc.b '  Change',0
TEXT_29:
[000a96eb]                           dc.b '  Moved',0
TEXT_30:
[000a96f3]                           dc.b '  Sized',0
TEXT_31:
[000a96fb]                           dc.b '  H-Slide',0
TEXT_32:
[000a9705]                           dc.b '  ACSinit',0
TEXT_33:
[000a970f]                           dc.b '  ACSmessage',0
TEXT_34:
[000a971c]                           dc.b '  ACSkey',0
TEXT_35:
[000a9725]                           dc.b '  ACSbutton',0
TEXT_357:
[000a9731]                           dc.b '  Drag',0
TEXT_358:
[000a9738]                           dc.b '  Keys',0
TEXT_359:
[000a973f]                           dc.b '  Service',0
TEXT_36:
[000a9749]                           dc.b '  ACSGEMScript',0
TEXT_360:
[000a9758]                           dc.b '  Create',0
TEXT_364:
[000a9761]                           dc.b '  Click',0
TEXT_365:
[000a9769]                           dc.b '  Open',0
TEXT_366:
[000a9770]                           dc.b '  Topped',0
TEXT_367:
[000a9779]                           dc.b '  Userdef',0
TEXT_37:
[000a9783]                           dc.b '  ACSinit0',0
TEXT_370:
[000a978e]                           dc.b '  Init',0
TEXT_371:
[000a9795]                           dc.b '  Changed',0
TEXT_372:
[000a979f]                           dc.b '  Redraw',0
TEXT_38:
[000a97a8]                           dc.b '  ACSterm',0
TEXT_39:
[000a97b2]                           dc.b '  ACSaboutme',0
TEXT_40:
[000a97bf]                           dc.b '  ACSclose',0
TEXT_41:
[000a97ca]                           dc.b '  ACSmproto',0
TEXT_42:
[000a97d6]                           dc.b '  ACStimer',0
TEXT_43:
[000a97e1]                           dc.b '  ACSmouse',0
TEXT_44:
[000a97ec]                           dc.b '  ACSwikey',0
[000a97f7]                           dc.b $00
DATAS_05:
[000a97f8]                           dc.w $0000
[000a97fa]                           dc.w $0000
[000a97fc]                           dc.w $020e
[000a97fe]                           dc.w $0001
[000a9800]                           dc.w $0000
[000a9802]                           dc.w $0003
[000a9804]                           dc.w $8000
[000a9806]                           dc.w $0006
[000a9808]                           dc.w $c000
[000a980a]                           dc.w $000c
[000a980c]                           dc.w $6000
[000a980e]                           dc.w $0018
[000a9810]                           dc.w $3000
[000a9812]                           dc.w $0031
[000a9814]                           dc.w $1800
[000a9816]                           dc.w $0062
[000a9818]                           dc.w $8c00
[000a981a]                           dc.w $00c4
[000a981c]                           dc.w $4600
[000a981e]                           dc.w $0188
[000a9820]                           dc.w $2300
[000a9822]                           dc.w $0310
[000a9824]                           dc.w $1180
[000a9826]                           dc.w $0790
[000a9828]                           dc.w $20c0
[000a982a]                           dc.w $0fc8
[000a982c]                           dc.w $4860
[000a982e]                           dc.w $1f84
[000a9830]                           dc.w $9830
[000a9832]                           dc.w $3703
[000a9834]                           dc.w $3218
[000a9836]                           dc.w $6200
[000a9838]                           dc.w $640c
[000a983a]                           dc.w $c000
[000a983c]                           dc.w $c906
[000a983e]                           dc.w $6200
[000a9840]                           dc.w $920c
[000a9842]                           dc.w $3101
[000a9844]                           dc.w $f418
[000a9846]                           dc.w $1886
[000a9848]                           dc.w $ac04
[000a984a]                           dc.w $0c4d
[000a984c]                           dc.w $f404
[000a984e]                           dc.w $062a
[000a9850]                           dc.w $3804
[000a9852]                           dc.w $031f
[000a9854]                           dc.w $fc04
[000a9856]                           dc.w $018b
[000a9858]                           dc.w $e804
[000a985a]                           dc.w $00c5
[000a985c]                           dc.w $5404
[000a985e]                           dc.w $0063
[000a9860]                           dc.w $a804
[000a9862]                           dc.w $0031
[000a9864]                           dc.w $fc04
[000a9866]                           dc.w $0018
[000a9868]                           dc.w $0c04
[000a986a]                           dc.w $000c
[000a986c]                           dc.w $1bf8
[000a986e]                           dc.w $0006
[000a9870]                           dc.w $3000
[000a9872]                           dc.w $0003
[000a9874]                           dc.w $6000
[000a9876]                           dc.w $0001
[000a9878]                           dc.w $c000
[000a987a]                           dc.w $0000
[000a987c]                           dc.w $8000
[000a987e]                           dc.w $0001
[000a9880]                           dc.w $0000
[000a9882]                           dc.w $0003
[000a9884]                           dc.w $8000
[000a9886]                           dc.w $0006
[000a9888]                           dc.w $c000
[000a988a]                           dc.w $000c
[000a988c]                           dc.w $6000
[000a988e]                           dc.w $0018
[000a9890]                           dc.w $3000
[000a9892]                           dc.w $0031
[000a9894]                           dc.w $1800
[000a9896]                           dc.w $0063
[000a9898]                           dc.w $8c00
[000a989a]                           dc.w $00c6
[000a989c]                           dc.w $c600
[000a989e]                           dc.w $018d
[000a98a0]                           dc.w $6300
[000a98a2]                           dc.w $031a
[000a98a4]                           dc.w $b180
[000a98a6]                           dc.w $0795
[000a98a8]                           dc.w $60c0
[000a98aa]                           dc.w $0fca
[000a98ac]                           dc.w $c860
[000a98ae]                           dc.w $1f85
[000a98b0]                           dc.w $9830
[000a98b2]                           dc.w $3703
[000a98b4]                           dc.w $3218
[000a98b6]                           dc.w $6200
[000a98b8]                           dc.w $640c
[000a98ba]                           dc.w $c000
[000a98bc]                           dc.w $c906
[000a98be]                           dc.w $6200
[000a98c0]                           dc.w $920c
[000a98c2]                           dc.w $3101
[000a98c4]                           dc.w $f418
[000a98c6]                           dc.w $1886
[000a98c8]                           dc.w $ac04
[000a98ca]                           dc.w $0c4d
[000a98cc]                           dc.w $f404
[000a98ce]                           dc.w $062a
[000a98d0]                           dc.w $3804
[000a98d2]                           dc.w $031f
[000a98d4]                           dc.w $fc04
[000a98d6]                           dc.w $018b
[000a98d8]                           dc.w $e804
[000a98da]                           dc.w $00c5
[000a98dc]                           dc.w $5404
[000a98de]                           dc.w $0063
[000a98e0]                           dc.w $a804
[000a98e2]                           dc.w $0031
[000a98e4]                           dc.w $fc04
[000a98e6]                           dc.w $0018
[000a98e8]                           dc.w $0c04
[000a98ea]                           dc.w $000c
[000a98ec]                           dc.w $1bf8
[000a98ee]                           dc.w $0006
[000a98f0]                           dc.w $3000
[000a98f2]                           dc.w $0003
[000a98f4]                           dc.w $6000
[000a98f6]                           dc.w $0001
[000a98f8]                           dc.w $c000
[000a98fa]                           dc.w $0000
[000a98fc]                           dc.w $8000
[000a98fe]                           dc.w $0001
[000a9900]                           dc.w $0000
[000a9902]                           dc.w $0003
[000a9904]                           dc.w $8000
[000a9906]                           dc.w $0006
[000a9908]                           dc.w $c000
[000a990a]                           dc.w $000c
[000a990c]                           dc.w $6000
[000a990e]                           dc.w $0018
[000a9910]                           dc.w $3000
[000a9912]                           dc.w $0031
[000a9914]                           dc.w $1800
[000a9916]                           dc.w $0063
[000a9918]                           dc.w $8c00
[000a991a]                           dc.w $00c7
[000a991c]                           dc.w $c600
[000a991e]                           dc.w $018f
[000a9920]                           dc.w $e300
[000a9922]                           dc.w $031f
[000a9924]                           dc.w $f180
[000a9926]                           dc.w $079f
[000a9928]                           dc.w $e0c0
[000a992a]                           dc.w $0fcf
[000a992c]                           dc.w $c860
[000a992e]                           dc.w $1f87
[000a9930]                           dc.w $9830
[000a9932]                           dc.w $3703
[000a9934]                           dc.w $3218
[000a9936]                           dc.w $6200
[000a9938]                           dc.w $640c
[000a993a]                           dc.w $c000
[000a993c]                           dc.w $c906
[000a993e]                           dc.w $6200
[000a9940]                           dc.w $920c
[000a9942]                           dc.w $3101
[000a9944]                           dc.w $f418
[000a9946]                           dc.w $1886
[000a9948]                           dc.w $0ffc
[000a994a]                           dc.w $0c4d
[000a994c]                           dc.w $e7fc
[000a994e]                           dc.w $062a
[000a9950]                           dc.w $33fc
[000a9952]                           dc.w $031f
[000a9954]                           dc.w $fbfc
[000a9956]                           dc.w $0189
[000a9958]                           dc.w $e3fc
[000a995a]                           dc.w $00c4
[000a995c]                           dc.w $03fc
[000a995e]                           dc.w $0063
[000a9960]                           dc.w $03fc
[000a9962]                           dc.w $0031
[000a9964]                           dc.w $fffc
[000a9966]                           dc.w $0018
[000a9968]                           dc.w $0ffc
[000a996a]                           dc.w $000c
[000a996c]                           dc.w $1bf8
[000a996e]                           dc.w $0006
[000a9970]                           dc.w $3000
[000a9972]                           dc.w $0003
[000a9974]                           dc.w $6000
[000a9976]                           dc.w $0001
[000a9978]                           dc.w $c000
[000a997a]                           dc.w $0000
[000a997c]                           dc.w $8000
[000a997e]                           dc.w $0000
[000a9980]                           dc.w $0000
[000a9982]                           dc.w $0001
[000a9984]                           dc.w $0000
[000a9986]                           dc.w $0002
[000a9988]                           dc.w $8000
[000a998a]                           dc.w $0004
[000a998c]                           dc.w $4000
[000a998e]                           dc.w $0008
[000a9990]                           dc.w $2000
[000a9992]                           dc.w $0011
[000a9994]                           dc.w $1000
[000a9996]                           dc.w $0022
[000a9998]                           dc.w $8800
[000a999a]                           dc.w $0044
[000a999c]                           dc.w $4400
[000a999e]                           dc.w $0088
[000a99a0]                           dc.w $2200
[000a99a2]                           dc.w $0110
[000a99a4]                           dc.w $1100
[000a99a6]                           dc.w $0390
[000a99a8]                           dc.w $2080
[000a99aa]                           dc.w $07c8
[000a99ac]                           dc.w $4840
[000a99ae]                           dc.w $0f84
[000a99b0]                           dc.w $9820
[000a99b2]                           dc.w $1703
[000a99b4]                           dc.w $3210
[000a99b6]                           dc.w $2200
[000a99b8]                           dc.w $6408
[000a99ba]                           dc.w $4000
[000a99bc]                           dc.w $c904
[000a99be]                           dc.w $2200
[000a99c0]                           dc.w $9208
[000a99c2]                           dc.w $1101
[000a99c4]                           dc.w $f410
[000a99c6]                           dc.w $0886
[000a99c8]                           dc.w $0c00
[000a99ca]                           dc.w $044d
[000a99cc]                           dc.w $e400
[000a99ce]                           dc.w $022a
[000a99d0]                           dc.w $3000
[000a99d2]                           dc.w $011f
[000a99d4]                           dc.w $f800
[000a99d6]                           dc.w $0089
[000a99d8]                           dc.w $e000
[000a99da]                           dc.w $0044
[000a99dc]                           dc.w $0000
[000a99de]                           dc.w $0023
[000a99e0]                           dc.w $0000
[000a99e2]                           dc.w $0011
[000a99e4]                           dc.w $fc00
[000a99e6]                           dc.w $0008
[000a99e8]                           dc.w $0800
[000a99ea]                           dc.w $0004
[000a99ec]                           dc.w $1000
[000a99ee]                           dc.w $0002
[000a99f0]                           dc.w $2000
[000a99f2]                           dc.w $0001
[000a99f4]                           dc.w $4000
[000a99f6]                           dc.w $0000
[000a99f8]                           dc.w $8000
[000a99fa]                           dc.w $0000
[000a99fc]                           dc.w $0000
DATAS_06:
[000a99fe]                           dc.w $0001
[000a9a00]                           dc.w $0000
[000a9a02]                           dc.w $0003
[000a9a04]                           dc.w $8000
[000a9a06]                           dc.w $0007
[000a9a08]                           dc.w $c000
[000a9a0a]                           dc.w $000f
[000a9a0c]                           dc.w $e000
[000a9a0e]                           dc.w $001f
[000a9a10]                           dc.w $f000
[000a9a12]                           dc.w $003f
[000a9a14]                           dc.w $f800
[000a9a16]                           dc.w $007f
[000a9a18]                           dc.w $fc00
[000a9a1a]                           dc.w $00ff
[000a9a1c]                           dc.w $fe00
[000a9a1e]                           dc.w $01ff
[000a9a20]                           dc.w $ff00
[000a9a22]                           dc.w $03ff
[000a9a24]                           dc.w $ff80
[000a9a26]                           dc.w $07ff
[000a9a28]                           dc.w $ffc0
[000a9a2a]                           dc.w $0fff
[000a9a2c]                           dc.w $ffe0
[000a9a2e]                           dc.w $1fff
[000a9a30]                           dc.w $fff0
[000a9a32]                           dc.w $3fff
[000a9a34]                           dc.w $fff8
[000a9a36]                           dc.w $7fff
[000a9a38]                           dc.w $fffc
[000a9a3a]                           dc.w $ffff
[000a9a3c]                           dc.w $fffe
[000a9a3e]                           dc.w $7fff
[000a9a40]                           dc.w $fffc
[000a9a42]                           dc.w $3fff
[000a9a44]                           dc.w $fff8
[000a9a46]                           dc.w $1fff
[000a9a48]                           dc.w $fffc
[000a9a4a]                           dc.w $0fff
[000a9a4c]                           dc.w $fffc
[000a9a4e]                           dc.w $07ff
[000a9a50]                           dc.w $fffc
[000a9a52]                           dc.w $03ff
[000a9a54]                           dc.w $fffc
[000a9a56]                           dc.w $01ff
[000a9a58]                           dc.w $fffc
[000a9a5a]                           dc.w $00ff
[000a9a5c]                           dc.w $fffc
[000a9a5e]                           dc.w $007f
[000a9a60]                           dc.w $fffc
[000a9a62]                           dc.w $003f
[000a9a64]                           dc.w $fffc
[000a9a66]                           dc.w $001f
[000a9a68]                           dc.w $fffc
[000a9a6a]                           dc.w $000f
[000a9a6c]                           dc.w $fbf8
[000a9a6e]                           dc.w $0007
[000a9a70]                           dc.w $f000
[000a9a72]                           dc.w $0003
[000a9a74]                           dc.w $e000
[000a9a76]                           dc.w $0001
[000a9a78]                           dc.w $c000
[000a9a7a]                           dc.w $0000
[000a9a7c]                           dc.w $8000
A_3DBUTTON01:
[000a9a7e] 00064a22                  dc.l A_3Dbutton
[000a9a82]                           dc.w $09f1
[000a9a84]                           dc.w $0178
[000a9a86] 000630f2                  dc.l Auo_string
[000a9a8a] 000a967f                  dc.l TEXT_19
[000a9a8e]                           dc.w $0000
[000a9a90]                           dc.w $0000
[000a9a92]                           dc.w $0000
[000a9a94]                           dc.w $0000
[000a9a96]                           dc.w $0000
[000a9a98]                           dc.w $0000
[000a9a9a]                           dc.w $0000
[000a9a9c]                           dc.w $0000
A_3DBUTTON02:
[000a9a9e] 00064a22                  dc.l A_3Dbutton
[000a9aa2]                           dc.w $29c1
[000a9aa4]                           dc.w $0178
[000a9aa6] 000630f2                  dc.l Auo_string
[000a9aaa] 000a9644                  dc.l TEXT_14
[000a9aae]                           dc.w $0000
[000a9ab0]                           dc.w $0000
[000a9ab2]                           dc.w $0000
[000a9ab4]                           dc.w $0000
[000a9ab6] 000a950d                  dc.l BUBBLE_03
[000a9aba]                           dc.w $0000
[000a9abc]                           dc.w $0000
A_3DBUTTON03:
[000a9abe] 00064a22                  dc.l A_3Dbutton
[000a9ac2]                           dc.w $29f1
[000a9ac4]                           dc.w $0178
[000a9ac6] 000630f2                  dc.l Auo_string
[000a9aca]                           dc.w $0000
[000a9acc]                           dc.w $0000
[000a9ace]                           dc.w $0000
[000a9ad0]                           dc.w $0000
[000a9ad2]                           dc.w $0000
[000a9ad4]                           dc.w $0000
[000a9ad6]                           dc.w $0000
[000a9ad8]                           dc.w $0000
[000a9ada]                           dc.w $0000
[000a9adc]                           dc.w $0000
A_3DBUTTON04:
[000a9ade] 00064a22                  dc.l A_3Dbutton
[000a9ae2]                           dc.w $29c1
[000a9ae4]                           dc.w $0178
[000a9ae6] 000630f2                  dc.l Auo_string
[000a9aea] 000a95c1                  dc.l TEXT_003
[000a9aee]                           dc.w $0000
[000a9af0]                           dc.w $0000
[000a9af2]                           dc.w $0000
[000a9af4]                           dc.w $0000
[000a9af6] 000a94ca                  dc.l BUBBLE_01
[000a9afa]                           dc.w $0000
[000a9afc]                           dc.w $0000
A_3DBUTTON05:
[000a9afe] 00064a22                  dc.l A_3Dbutton
[000a9b02]                           dc.w $09f1
[000a9b04]                           dc.w $0178
[000a9b06] 000630f2                  dc.l Auo_string
[000a9b0a] 000a9672                  dc.l TEXT_18
[000a9b0e]                           dc.w $0000
[000a9b10]                           dc.w $0000
[000a9b12]                           dc.w $0000
[000a9b14]                           dc.w $0000
[000a9b16]                           dc.w $0000
[000a9b18]                           dc.w $0000
[000a9b1a]                           dc.w $0000
[000a9b1c]                           dc.w $0000
A_3DBUTTON06:
[000a9b1e] 00064a22                  dc.l A_3Dbutton
[000a9b22]                           dc.w $09f1
[000a9b24]                           dc.w $0178
[000a9b26] 000630f2                  dc.l Auo_string
[000a9b2a] 000a9659                  dc.l TEXT_17
[000a9b2e]                           dc.w $0000
[000a9b30]                           dc.w $0000
[000a9b32]                           dc.w $0000
[000a9b34]                           dc.w $0000
[000a9b36]                           dc.w $0000
[000a9b38]                           dc.w $0000
[000a9b3a]                           dc.w $0000
[000a9b3c]                           dc.w $0000
A_3DBUTTON07:
[000a9b3e] 00064a22                  dc.l A_3Dbutton
[000a9b42]                           dc.w $29c1
[000a9b44]                           dc.w $0178
[000a9b46] 000630f2                  dc.l Auo_string
[000a9b4a] 000a95c4                  dc.l TEXT_004
[000a9b4e]                           dc.w $0000
[000a9b50]                           dc.w $0000
[000a9b52]                           dc.w $0000
[000a9b54]                           dc.w $0000
[000a9b56] 000a94ec                  dc.l BUBBLE_02
[000a9b5a]                           dc.w $0000
[000a9b5c]                           dc.w $0000
A_3DBUTTON08:
[000a9b5e] 00064a22                  dc.l A_3Dbutton
[000a9b62]                           dc.w $09f1
[000a9b64]                           dc.w $0178
[000a9b66] 000630f2                  dc.l Auo_string
[000a9b6a] 000a968a                  dc.l TEXT_20
[000a9b6e]                           dc.w $0000
[000a9b70]                           dc.w $0000
[000a9b72]                           dc.w $0000
[000a9b74]                           dc.w $0000
[000a9b76]                           dc.w $0000
[000a9b78]                           dc.w $0000
[000a9b7a]                           dc.w $0000
[000a9b7c]                           dc.w $0000
A_3DBUTTON09:
[000a9b7e] 00064a22                  dc.l A_3Dbutton
[000a9b82]                           dc.w $09f1
[000a9b84]                           dc.w $0178
[000a9b86] 000630f2                  dc.l Auo_string
[000a9b8a] 000a9731                  dc.l TEXT_357
[000a9b8e]                           dc.w $0000
[000a9b90]                           dc.w $0000
[000a9b92]                           dc.w $0000
[000a9b94]                           dc.w $0000
[000a9b96]                           dc.w $0000
[000a9b98]                           dc.w $0000
[000a9b9a]                           dc.w $0000
[000a9b9c]                           dc.w $0000
A_3DBUTTON10:
[000a9b9e] 00064a22                  dc.l A_3Dbutton
[000a9ba2]                           dc.w $09f1
[000a9ba4]                           dc.w $0178
[000a9ba6] 000630f2                  dc.l Auo_string
[000a9baa] 000a9761                  dc.l TEXT_364
[000a9bae]                           dc.w $0000
[000a9bb0]                           dc.w $0000
[000a9bb2]                           dc.w $0000
[000a9bb4]                           dc.w $0000
[000a9bb6]                           dc.w $0000
[000a9bb8]                           dc.w $0000
[000a9bba]                           dc.w $0000
[000a9bbc]                           dc.w $0000
A_3DBUTTON11:
[000a9bbe] 00064a22                  dc.l A_3Dbutton
[000a9bc2]                           dc.w $09f1
[000a9bc4]                           dc.w $0178
[000a9bc6] 000630f2                  dc.l Auo_string
[000a9bca] 000a9697                  dc.l TEXT_21
[000a9bce]                           dc.w $0000
[000a9bd0]                           dc.w $0000
[000a9bd2]                           dc.w $0000
[000a9bd4]                           dc.w $0000
[000a9bd6]                           dc.w $0000
[000a9bd8]                           dc.w $0000
[000a9bda]                           dc.w $0000
[000a9bdc]                           dc.w $0000
A_3DBUTTON12:
[000a9bde] 00064a22                  dc.l A_3Dbutton
[000a9be2]                           dc.w $09f1
[000a9be4]                           dc.w $0178
[000a9be6] 000630f2                  dc.l Auo_string
[000a9bea] 000a96a2                  dc.l TEXT_22
[000a9bee]                           dc.w $0000
[000a9bf0]                           dc.w $0000
[000a9bf2]                           dc.w $0000
[000a9bf4]                           dc.w $0000
[000a9bf6]                           dc.w $0000
[000a9bf8]                           dc.w $0000
[000a9bfa]                           dc.w $0000
[000a9bfc]                           dc.w $0000
A_3DBUTTON13:
[000a9bfe] 00064a22                  dc.l A_3Dbutton
[000a9c02]                           dc.w $09f1
[000a9c04]                           dc.w $0178
[000a9c06] 000630f2                  dc.l Auo_string
[000a9c0a] 000a978e                  dc.l TEXT_370
[000a9c0e]                           dc.w $0000
[000a9c10]                           dc.w $0000
[000a9c12]                           dc.w $0000
[000a9c14]                           dc.w $0000
[000a9c16]                           dc.w $0000
[000a9c18]                           dc.w $0000
[000a9c1a]                           dc.w $0000
[000a9c1c]                           dc.w $0000
A_3DBUTTON14:
[000a9c1e] 00064a22                  dc.l A_3Dbutton
[000a9c22]                           dc.w $09f1
[000a9c24]                           dc.w $0178
[000a9c26] 000630f2                  dc.l Auo_string
[000a9c2a] 000a9769                  dc.l TEXT_365
[000a9c2e]                           dc.w $0000
[000a9c30]                           dc.w $0000
[000a9c32]                           dc.w $0000
[000a9c34]                           dc.w $0000
[000a9c36]                           dc.w $0000
[000a9c38]                           dc.w $0000
[000a9c3a]                           dc.w $0000
[000a9c3c]                           dc.w $0000
A_3DBUTTON15:
[000a9c3e] 00064a22                  dc.l A_3Dbutton
[000a9c42]                           dc.w $09f1
[000a9c44]                           dc.w $0178
[000a9c46] 000630f2                  dc.l Auo_string
[000a9c4a] 000a9758                  dc.l TEXT_360
[000a9c4e]                           dc.w $0000
[000a9c50]                           dc.w $0000
[000a9c52]                           dc.w $0000
[000a9c54]                           dc.w $0000
[000a9c56]                           dc.w $0000
[000a9c58]                           dc.w $0000
[000a9c5a]                           dc.w $0000
[000a9c5c]                           dc.w $0000
A_3DBUTTON16:
[000a9c5e] 00064a22                  dc.l A_3Dbutton
[000a9c62]                           dc.w $09f1
[000a9c64]                           dc.w $0178
[000a9c66] 000630f2                  dc.l Auo_string
[000a9c6a] 000a973f                  dc.l TEXT_359
[000a9c6e]                           dc.w $0000
[000a9c70]                           dc.w $0000
[000a9c72]                           dc.w $0000
[000a9c74]                           dc.w $0000
[000a9c76]                           dc.w $0000
[000a9c78]                           dc.w $0000
[000a9c7a]                           dc.w $0000
[000a9c7c]                           dc.w $0000
A_3DBUTTON17:
[000a9c7e] 00064a22                  dc.l A_3Dbutton
[000a9c82]                           dc.w $09f1
[000a9c84]                           dc.w $0178
[000a9c86] 000630f2                  dc.l Auo_string
[000a9c8a] 000a9738                  dc.l TEXT_358
[000a9c8e]                           dc.w $0000
[000a9c90]                           dc.w $0000
[000a9c92]                           dc.w $0000
[000a9c94]                           dc.w $0000
[000a9c96]                           dc.w $0000
[000a9c98]                           dc.w $0000
[000a9c9a]                           dc.w $0000
[000a9c9c]                           dc.w $0000
A_3DBUTTON18:
[000a9c9e] 00064a22                  dc.l A_3Dbutton
[000a9ca2]                           dc.w $09f1
[000a9ca4]                           dc.w $0178
[000a9ca6] 000630f2                  dc.l Auo_string
[000a9caa] 000a95e3                  dc.l TEXT_04
[000a9cae]                           dc.w $0000
[000a9cb0]                           dc.w $0000
[000a9cb2]                           dc.w $0000
[000a9cb4]                           dc.w $0000
[000a9cb6]                           dc.w $0000
[000a9cb8]                           dc.w $0000
[000a9cba]                           dc.w $0000
[000a9cbc]                           dc.w $0000
A_3DBUTTON19:
[000a9cbe] 00064a22                  dc.l A_3Dbutton
[000a9cc2]                           dc.w $09f1
[000a9cc4]                           dc.w $0178
[000a9cc6] 000630f2                  dc.l Auo_string
[000a9cca] 000a979f                  dc.l TEXT_372
[000a9cce]                           dc.w $0000
[000a9cd0]                           dc.w $0000
[000a9cd2]                           dc.w $0000
[000a9cd4]                           dc.w $0000
[000a9cd6]                           dc.w $0000
[000a9cd8]                           dc.w $0000
[000a9cda]                           dc.w $0000
[000a9cdc]                           dc.w $0000
A_3DBUTTON20:
[000a9cde] 00064a22                  dc.l A_3Dbutton
[000a9ce2]                           dc.w $09f1
[000a9ce4]                           dc.w $0178
[000a9ce6] 000630f2                  dc.l Auo_string
[000a9cea] 000a9770                  dc.l TEXT_366
[000a9cee]                           dc.w $0000
[000a9cf0]                           dc.w $0000
[000a9cf2]                           dc.w $0000
[000a9cf4]                           dc.w $0000
[000a9cf6]                           dc.w $0000
[000a9cf8]                           dc.w $0000
[000a9cfa]                           dc.w $0000
[000a9cfc]                           dc.w $0000
A_3DBUTTON21:
[000a9cfe] 00064a22                  dc.l A_3Dbutton
[000a9d02]                           dc.w $09f1
[000a9d04]                           dc.w $0178
[000a9d06] 000630f2                  dc.l Auo_string
[000a9d0a] 000a96af                  dc.l TEXT_23
[000a9d0e]                           dc.w $0000
[000a9d10]                           dc.w $0000
[000a9d12]                           dc.w $0000
[000a9d14]                           dc.w $0000
[000a9d16]                           dc.w $0000
[000a9d18]                           dc.w $0000
[000a9d1a]                           dc.w $0000
[000a9d1c]                           dc.w $0000
A_3DBUTTON22:
[000a9d1e] 00064a22                  dc.l A_3Dbutton
[000a9d22]                           dc.w $09f1
[000a9d24]                           dc.w $0178
[000a9d26] 000630f2                  dc.l Auo_string
[000a9d2a] 000a96c5                  dc.l TEXT_25
[000a9d2e]                           dc.w $0000
[000a9d30]                           dc.w $0000
[000a9d32]                           dc.w $0000
[000a9d34]                           dc.w $0000
[000a9d36]                           dc.w $0000
[000a9d38]                           dc.w $0000
[000a9d3a]                           dc.w $0000
[000a9d3c]                           dc.w $0000
A_3DBUTTON23:
[000a9d3e] 00064a22                  dc.l A_3Dbutton
[000a9d42]                           dc.w $09f1
[000a9d44]                           dc.w $0178
[000a9d46] 000630f2                  dc.l Auo_string
[000a9d4a] 000a96ce                  dc.l TEXT_26
[000a9d4e]                           dc.w $0000
[000a9d50]                           dc.w $0000
[000a9d52]                           dc.w $0000
[000a9d54]                           dc.w $0000
[000a9d56]                           dc.w $0000
[000a9d58]                           dc.w $0000
[000a9d5a]                           dc.w $0000
[000a9d5c]                           dc.w $0000
A_3DBUTTON24:
[000a9d5e] 00064a22                  dc.l A_3Dbutton
[000a9d62]                           dc.w $09f1
[000a9d64]                           dc.w $0178
[000a9d66] 000630f2                  dc.l Auo_string
[000a9d6a] 000a96d8                  dc.l TEXT_27
[000a9d6e]                           dc.w $0000
[000a9d70]                           dc.w $0000
[000a9d72]                           dc.w $0000
[000a9d74]                           dc.w $0000
[000a9d76]                           dc.w $0000
[000a9d78]                           dc.w $0000
[000a9d7a]                           dc.w $0000
[000a9d7c]                           dc.w $0000
A_3DBUTTON25:
[000a9d7e] 00064a22                  dc.l A_3Dbutton
[000a9d82]                           dc.w $09f1
[000a9d84]                           dc.w $0178
[000a9d86] 000630f2                  dc.l Auo_string
[000a9d8a] 000a96e2                  dc.l TEXT_28
[000a9d8e]                           dc.w $0000
[000a9d90]                           dc.w $0000
[000a9d92]                           dc.w $0000
[000a9d94]                           dc.w $0000
[000a9d96]                           dc.w $0000
[000a9d98]                           dc.w $0000
[000a9d9a]                           dc.w $0000
[000a9d9c]                           dc.w $0000
A_3DBUTTON26:
[000a9d9e] 00064a22                  dc.l A_3Dbutton
[000a9da2]                           dc.w $09f1
[000a9da4]                           dc.w $0178
[000a9da6] 000630f2                  dc.l Auo_string
[000a9daa] 000a96eb                  dc.l TEXT_29
[000a9dae]                           dc.w $0000
[000a9db0]                           dc.w $0000
[000a9db2]                           dc.w $0000
[000a9db4]                           dc.w $0000
[000a9db6]                           dc.w $0000
[000a9db8]                           dc.w $0000
[000a9dba]                           dc.w $0000
[000a9dbc]                           dc.w $0000
A_3DBUTTON27:
[000a9dbe] 00064a22                  dc.l A_3Dbutton
[000a9dc2]                           dc.w $09f1
[000a9dc4]                           dc.w $0178
[000a9dc6] 000630f2                  dc.l Auo_string
[000a9dca] 000a96f3                  dc.l TEXT_30
[000a9dce]                           dc.w $0000
[000a9dd0]                           dc.w $0000
[000a9dd2]                           dc.w $0000
[000a9dd4]                           dc.w $0000
[000a9dd6]                           dc.w $0000
[000a9dd8]                           dc.w $0000
[000a9dda]                           dc.w $0000
[000a9ddc]                           dc.w $0000
A_3DBUTTON28:
[000a9dde] 00064a22                  dc.l A_3Dbutton
[000a9de2]                           dc.w $09f1
[000a9de4]                           dc.w $0178
[000a9de6] 000630f2                  dc.l Auo_string
[000a9dea] 000a96fb                  dc.l TEXT_31
[000a9dee]                           dc.w $0000
[000a9df0]                           dc.w $0000
[000a9df2]                           dc.w $0000
[000a9df4]                           dc.w $0000
[000a9df6]                           dc.w $0000
[000a9df8]                           dc.w $0000
[000a9dfa]                           dc.w $0000
[000a9dfc]                           dc.w $0000
A_3DBUTTON29:
[000a9dfe] 00064a22                  dc.l A_3Dbutton
[000a9e02]                           dc.w $29f1
[000a9e04]                           dc.w $0178
[000a9e06] 000630f2                  dc.l Auo_string
[000a9e0a]                           dc.w $0000
[000a9e0c]                           dc.w $0000
[000a9e0e]                           dc.w $0000
[000a9e10]                           dc.w $0000
[000a9e12]                           dc.w $0000
[000a9e14]                           dc.w $0000
[000a9e16] 000a958c                  dc.l BUBBLE_05
[000a9e1a]                           dc.w $0000
[000a9e1c]                           dc.w $0000
A_3DBUTTON30:
[000a9e1e] 00064a22                  dc.l A_3Dbutton
[000a9e22]                           dc.w $09f1
[000a9e24]                           dc.w $0178
[000a9e26] 000630f2                  dc.l Auo_string
[000a9e2a] 000a962c                  dc.l TEXT_12
[000a9e2e]                           dc.w $0000
[000a9e30]                           dc.w $0000
[000a9e32]                           dc.w $0000
[000a9e34]                           dc.w $0000
[000a9e36]                           dc.w $0000
[000a9e38]                           dc.w $0000
[000a9e3a]                           dc.w $0000
[000a9e3c]                           dc.w $0000
A_3DBUTTON31:
[000a9e3e] 00064a22                  dc.l A_3Dbutton
[000a9e42]                           dc.w $09f1
[000a9e44]                           dc.w $0178
[000a9e46] 000630f2                  dc.l Auo_string
[000a9e4a] 000a9638                  dc.l TEXT_13
[000a9e4e]                           dc.w $0000
[000a9e50]                           dc.w $0000
[000a9e52]                           dc.w $0000
[000a9e54]                           dc.w $0000
[000a9e56]                           dc.w $0000
[000a9e58]                           dc.w $0000
[000a9e5a]                           dc.w $0000
[000a9e5c]                           dc.w $0000
A_3DBUTTON32:
[000a9e5e] 00064a22                  dc.l A_3Dbutton
[000a9e62]                           dc.w $09f1
[000a9e64]                           dc.w $0178
[000a9e66] 000630f2                  dc.l Auo_string
[000a9e6a] 000a96b8                  dc.l TEXT_24
[000a9e6e]                           dc.w $0000
[000a9e70]                           dc.w $0000
[000a9e72]                           dc.w $0000
[000a9e74]                           dc.w $0000
[000a9e76]                           dc.w $0000
[000a9e78]                           dc.w $0000
[000a9e7a]                           dc.w $0000
[000a9e7c]                           dc.w $0000
A_3DBUTTON33:
[000a9e7e] 00064a22                  dc.l A_3Dbutton
[000a9e82]                           dc.w $09f1
[000a9e84]                           dc.w $0178
[000a9e86] 000630f2                  dc.l Auo_string
[000a9e8a] 000a9705                  dc.l TEXT_32
[000a9e8e]                           dc.w $0000
[000a9e90]                           dc.w $0000
[000a9e92]                           dc.w $0000
[000a9e94]                           dc.w $0000
[000a9e96]                           dc.w $0000
[000a9e98]                           dc.w $0000
[000a9e9a]                           dc.w $0000
[000a9e9c]                           dc.w $0000
A_3DBUTTON34:
[000a9e9e] 00064a22                  dc.l A_3Dbutton
[000a9ea2]                           dc.w $09f1
[000a9ea4]                           dc.w $0178
[000a9ea6] 000630f2                  dc.l Auo_string
[000a9eaa] 000a970f                  dc.l TEXT_33
[000a9eae]                           dc.w $0000
[000a9eb0]                           dc.w $0000
[000a9eb2]                           dc.w $0000
[000a9eb4]                           dc.w $0000
[000a9eb6]                           dc.w $0000
[000a9eb8]                           dc.w $0000
[000a9eba]                           dc.w $0000
[000a9ebc]                           dc.w $0000
A_3DBUTTON35:
[000a9ebe] 00064a22                  dc.l A_3Dbutton
[000a9ec2]                           dc.w $09f1
[000a9ec4]                           dc.w $0178
[000a9ec6] 000630f2                  dc.l Auo_string
[000a9eca] 000a971c                  dc.l TEXT_34
[000a9ece]                           dc.w $0000
[000a9ed0]                           dc.w $0000
[000a9ed2]                           dc.w $0000
[000a9ed4]                           dc.w $0000
[000a9ed6]                           dc.w $0000
[000a9ed8]                           dc.w $0000
[000a9eda]                           dc.w $0000
[000a9edc]                           dc.w $0000
A_3DBUTTON36:
[000a9ede] 00064a22                  dc.l A_3Dbutton
[000a9ee2]                           dc.w $09f1
[000a9ee4]                           dc.w $0178
[000a9ee6] 000630f2                  dc.l Auo_string
[000a9eea] 000a9725                  dc.l TEXT_35
[000a9eee]                           dc.w $0000
[000a9ef0]                           dc.w $0000
[000a9ef2]                           dc.w $0000
[000a9ef4]                           dc.w $0000
[000a9ef6]                           dc.w $0000
[000a9ef8]                           dc.w $0000
[000a9efa]                           dc.w $0000
[000a9efc]                           dc.w $0000
A_3DBUTTON37:
[000a9efe] 00064a22                  dc.l A_3Dbutton
[000a9f02]                           dc.w $09f1
[000a9f04]                           dc.w $0178
[000a9f06] 000630f2                  dc.l Auo_string
[000a9f0a] 000a9749                  dc.l TEXT_36
[000a9f0e]                           dc.w $0000
[000a9f10]                           dc.w $0000
[000a9f12]                           dc.w $0000
[000a9f14]                           dc.w $0000
[000a9f16]                           dc.w $0000
[000a9f18]                           dc.w $0000
[000a9f1a]                           dc.w $0000
[000a9f1c]                           dc.w $0000
A_3DBUTTON38:
[000a9f1e] 00064a22                  dc.l A_3Dbutton
[000a9f22]                           dc.w $09f1
[000a9f24]                           dc.w $0178
[000a9f26] 000630f2                  dc.l Auo_string
[000a9f2a] 000a9783                  dc.l TEXT_37
[000a9f2e]                           dc.w $0000
[000a9f30]                           dc.w $0000
[000a9f32]                           dc.w $0000
[000a9f34]                           dc.w $0000
[000a9f36]                           dc.w $0000
[000a9f38]                           dc.w $0000
[000a9f3a]                           dc.w $0000
[000a9f3c]                           dc.w $0000
A_3DBUTTON39:
[000a9f3e] 00064a22                  dc.l A_3Dbutton
[000a9f42]                           dc.w $09f1
[000a9f44]                           dc.w $0178
[000a9f46] 000630f2                  dc.l Auo_string
[000a9f4a] 000a97a8                  dc.l TEXT_38
[000a9f4e]                           dc.w $0000
[000a9f50]                           dc.w $0000
[000a9f52]                           dc.w $0000
[000a9f54]                           dc.w $0000
[000a9f56]                           dc.w $0000
[000a9f58]                           dc.w $0000
[000a9f5a]                           dc.w $0000
[000a9f5c]                           dc.w $0000
A_3DBUTTON40:
[000a9f5e] 00064a22                  dc.l A_3Dbutton
[000a9f62]                           dc.w $09f1
[000a9f64]                           dc.w $0178
[000a9f66] 000630f2                  dc.l Auo_string
[000a9f6a] 000a97b2                  dc.l TEXT_39
[000a9f6e]                           dc.w $0000
[000a9f70]                           dc.w $0000
[000a9f72]                           dc.w $0000
[000a9f74]                           dc.w $0000
[000a9f76]                           dc.w $0000
[000a9f78]                           dc.w $0000
[000a9f7a]                           dc.w $0000
[000a9f7c]                           dc.w $0000
A_3DBUTTON41:
[000a9f7e] 00064a22                  dc.l A_3Dbutton
[000a9f82]                           dc.w $09f1
[000a9f84]                           dc.w $0178
[000a9f86] 000630f2                  dc.l Auo_string
[000a9f8a] 000a97bf                  dc.l TEXT_40
[000a9f8e]                           dc.w $0000
[000a9f90]                           dc.w $0000
[000a9f92]                           dc.w $0000
[000a9f94]                           dc.w $0000
[000a9f96]                           dc.w $0000
[000a9f98]                           dc.w $0000
[000a9f9a]                           dc.w $0000
[000a9f9c]                           dc.w $0000
A_3DBUTTON42:
[000a9f9e] 00064a22                  dc.l A_3Dbutton
[000a9fa2]                           dc.w $09f1
[000a9fa4]                           dc.w $0178
[000a9fa6] 000630f2                  dc.l Auo_string
[000a9faa] 000a97ca                  dc.l TEXT_41
[000a9fae]                           dc.w $0000
[000a9fb0]                           dc.w $0000
[000a9fb2]                           dc.w $0000
[000a9fb4]                           dc.w $0000
[000a9fb6]                           dc.w $0000
[000a9fb8]                           dc.w $0000
[000a9fba]                           dc.w $0000
[000a9fbc]                           dc.w $0000
A_3DBUTTON43:
[000a9fbe] 00064a22                  dc.l A_3Dbutton
[000a9fc2]                           dc.w $09f1
[000a9fc4]                           dc.w $0178
[000a9fc6] 000630f2                  dc.l Auo_string
[000a9fca] 000a97d6                  dc.l TEXT_42
[000a9fce]                           dc.w $0000
[000a9fd0]                           dc.w $0000
[000a9fd2]                           dc.w $0000
[000a9fd4]                           dc.w $0000
[000a9fd6]                           dc.w $0000
[000a9fd8]                           dc.w $0000
[000a9fda]                           dc.w $0000
[000a9fdc]                           dc.w $0000
A_3DBUTTON44:
[000a9fde] 00064a22                  dc.l A_3Dbutton
[000a9fe2]                           dc.w $09f1
[000a9fe4]                           dc.w $0178
[000a9fe6] 000630f2                  dc.l Auo_string
[000a9fea] 000a97e1                  dc.l TEXT_43
[000a9fee]                           dc.w $0000
[000a9ff0]                           dc.w $0000
[000a9ff2]                           dc.w $0000
[000a9ff4]                           dc.w $0000
[000a9ff6]                           dc.w $0000
[000a9ff8]                           dc.w $0000
[000a9ffa]                           dc.w $0000
[000a9ffc]                           dc.w $0000
A_3DBUTTON45:
[000a9ffe] 00064a22                  dc.l A_3Dbutton
[000aa002]                           dc.w $09f1
[000aa004]                           dc.w $0178
[000aa006] 000630f2                  dc.l Auo_string
[000aa00a] 000a97ec                  dc.l TEXT_44
[000aa00e]                           dc.w $0000
[000aa010]                           dc.w $0000
[000aa012]                           dc.w $0000
[000aa014]                           dc.w $0000
[000aa016]                           dc.w $0000
[000aa018]                           dc.w $0000
[000aa01a]                           dc.w $0000
[000aa01c]                           dc.w $0000
A_ARROWS02:
[000aa01e] 00065c72                  dc.l A_arrows
[000aa022]                           dc.w $1301
[000aa024]                           dc.w $0001
[000aa026]                           dc.w $0000
[000aa028]                           dc.w $0000
[000aa02a]                           dc.w $0000
[000aa02c]                           dc.w $0000
[000aa02e]                           dc.w $0000
[000aa030]                           dc.w $0000
[000aa032]                           dc.w $0000
[000aa034]                           dc.w $0000
[000aa036]                           dc.w $0000
[000aa038]                           dc.w $0000
[000aa03a]                           dc.w $0000
[000aa03c]                           dc.w $0000
A_CHECKBOX01:
[000aa03e] 0006323e                  dc.l A_checkbox
[000aa042]                           dc.w $0000
[000aa044]                           dc.w $0001
[000aa046] 000630f2                  dc.l Auo_string
[000aa04a] 000a9649                  dc.l TEXT_15
[000aa04e]                           dc.w $0000
[000aa050]                           dc.w $0000
[000aa052]                           dc.w $0000
[000aa054]                           dc.w $0000
[000aa056] 000a9547                  dc.l BUBBLE_04
[000aa05a]                           dc.w $0000
[000aa05c]                           dc.w $0000
_C4_IC_REF:
[000aa05e]                           dc.w $0004
[000aa060] 000a97fe                  dc.l $000a97fe
[000aa064] 000a99fe                  dc.l DATAS_06
[000aa068]                           dc.w $0000
[000aa06a]                           dc.w $0000
[000aa06c]                           dc.w $0000
[000aa06e]                           dc.w $0000
[000aa070]                           dc.w $0000
[000aa072]                           dc.w $0000
_MSK_IC_REF:
[000aa074]                           dc.w $0000
[000aa076]                           dc.w $0000
[000aa078]                           dc.w $0001
[000aa07a]                           dc.w $0000
[000aa07c]                           dc.w $0003
[000aa07e]                           dc.w $8000
[000aa080]                           dc.w $0007
[000aa082]                           dc.w $c000
[000aa084]                           dc.w $000f
[000aa086]                           dc.w $e000
[000aa088]                           dc.w $001f
[000aa08a]                           dc.w $f000
[000aa08c]                           dc.w $003e
[000aa08e]                           dc.w $f800
[000aa090]                           dc.w $007d
[000aa092]                           dc.w $7c00
[000aa094]                           dc.w $00fa
[000aa096]                           dc.w $be00
[000aa098]                           dc.w $01f5
[000aa09a]                           dc.w $5f00
[000aa09c]                           dc.w $03fa
[000aa09e]                           dc.w $bf80
[000aa0a0]                           dc.w $07fd
[000aa0a2]                           dc.w $7fc0
[000aa0a4]                           dc.w $0ffe
[000aa0a6]                           dc.w $ffe0
[000aa0a8]                           dc.w $1fff
[000aa0aa]                           dc.w $fff0
[000aa0ac]                           dc.w $3fff
[000aa0ae]                           dc.w $fff8
[000aa0b0]                           dc.w $7fff
[000aa0b2]                           dc.w $fffc
[000aa0b4]                           dc.w $3fff
[000aa0b6]                           dc.w $fffe
[000aa0b8]                           dc.w $1fff
[000aa0ba]                           dc.w $fffc
[000aa0bc]                           dc.w $0fff
[000aa0be]                           dc.w $fffe
[000aa0c0]                           dc.w $07ff
[000aa0c2]                           dc.w $fffe
[000aa0c4]                           dc.w $03ff
[000aa0c6]                           dc.w $fffe
[000aa0c8]                           dc.w $01ff
[000aa0ca]                           dc.w $fffe
[000aa0cc]                           dc.w $00ff
[000aa0ce]                           dc.w $fffe
[000aa0d0]                           dc.w $007f
[000aa0d2]                           dc.w $fffe
[000aa0d4]                           dc.w $003f
[000aa0d6]                           dc.w $fffe
[000aa0d8]                           dc.w $001f
[000aa0da]                           dc.w $fffe
[000aa0dc]                           dc.w $000f
[000aa0de]                           dc.w $fbfe
[000aa0e0]                           dc.w $0007
[000aa0e2]                           dc.w $f000
[000aa0e4]                           dc.w $0003
[000aa0e6]                           dc.w $e000
[000aa0e8]                           dc.w $0001
[000aa0ea]                           dc.w $c000
[000aa0ec]                           dc.w $0000
[000aa0ee]                           dc.w $8000
[000aa0f0]                           dc.w $0000
[000aa0f2]                           dc.w $0000
_DAT_IC_REF:
[000aa0f4]                           dc.w $0000
[000aa0f6]                           dc.w $0000
[000aa0f8]                           dc.w $0001
[000aa0fa]                           dc.w $0000
[000aa0fc]                           dc.w $0002
[000aa0fe]                           dc.w $8000
[000aa100]                           dc.w $0004
[000aa102]                           dc.w $4000
[000aa104]                           dc.w $0008
[000aa106]                           dc.w $2000
[000aa108]                           dc.w $0011
[000aa10a]                           dc.w $1000
[000aa10c]                           dc.w $0022
[000aa10e]                           dc.w $8800
[000aa110]                           dc.w $0045
[000aa112]                           dc.w $4400
[000aa114]                           dc.w $008a
[000aa116]                           dc.w $a200
[000aa118]                           dc.w $0115
[000aa11a]                           dc.w $5100
[000aa11c]                           dc.w $039a
[000aa11e]                           dc.w $a080
[000aa120]                           dc.w $07cd
[000aa122]                           dc.w $4840
[000aa124]                           dc.w $0f86
[000aa126]                           dc.w $9820
[000aa128]                           dc.w $1703
[000aa12a]                           dc.w $3210
[000aa12c]                           dc.w $2200
[000aa12e]                           dc.w $6408
[000aa130]                           dc.w $4000
[000aa132]                           dc.w $c904
[000aa134]                           dc.w $2200
[000aa136]                           dc.w $0202
[000aa138]                           dc.w $1101
[000aa13a]                           dc.w $f404
[000aa13c]                           dc.w $0886
[000aa13e]                           dc.w $0bfe
[000aa140]                           dc.w $044d
[000aa142]                           dc.w $e600
[000aa144]                           dc.w $022a
[000aa146]                           dc.w $3200
[000aa148]                           dc.w $011f
[000aa14a]                           dc.w $fa00
[000aa14c]                           dc.w $0089
[000aa14e]                           dc.w $e200
[000aa150]                           dc.w $0044
[000aa152]                           dc.w $0200
[000aa154]                           dc.w $0023
[000aa156]                           dc.w $0200
[000aa158]                           dc.w $0011
[000aa15a]                           dc.w $fe00
[000aa15c]                           dc.w $0008
[000aa15e]                           dc.w $0bfe
[000aa160]                           dc.w $0004
[000aa162]                           dc.w $1000
[000aa164]                           dc.w $0002
[000aa166]                           dc.w $2000
[000aa168]                           dc.w $0001
[000aa16a]                           dc.w $4000
[000aa16c]                           dc.w $0000
[000aa16e]                           dc.w $8000
[000aa170]                           dc.w $0000
[000aa172]                           dc.w $0000
IC_REF:
[000aa174] 000aa074                  dc.l _MSK_IC_REF
[000aa178] 000aa0f4                  dc.l _DAT_IC_REF
[000aa17c] 000a9650                  dc.l TEXT_16
[000aa180]                           dc.w $1000
[000aa182]                           dc.w $0000
[000aa184]                           dc.w $0000
[000aa186]                           dc.w $0014
[000aa188]                           dc.w $0000
[000aa18a]                           dc.w $0020
[000aa18c]                           dc.w $0020
[000aa18e]                           dc.w $0000
[000aa190]                           dc.w $0020
[000aa192]                           dc.w $0048
[000aa194]                           dc.w $0008
[000aa196] 000aa05e                  dc.l _C4_IC_REF
REF_TYPE:
[000aa19a]                           dc.w $ffff
[000aa19c]                           dc.w $0001
[000aa19e]                           dc.w $0056
[000aa1a0]                           dc.w $0014
[000aa1a2]                           dc.w $0000
[000aa1a4]                           dc.w $0020
[000aa1a6]                           dc.w $00ff
[000aa1a8]                           dc.w $1100
[000aa1aa]                           dc.w $0000
[000aa1ac]                           dc.w $0000
[000aa1ae]                           dc.w $000d
[000aa1b0]                           dc.w $0005
_01_REF_TYPE:
[000aa1b2]                           dc.w $0022
[000aa1b4]                           dc.w $0002
[000aa1b6]                           dc.w $0020
[000aa1b8]                           dc.w $0014
[000aa1ba]                           dc.w $0080
[000aa1bc]                           dc.w $0020
[000aa1be]                           dc.w $00ff
[000aa1c0]                           dc.w $1101
[000aa1c2]                           dc.w $0000
[000aa1c4]                           dc.w $0003
[000aa1c6]                           dc.w $0014
[000aa1c8]                           dc.w $0008
_02_REF_TYPE:
[000aa1ca]                           dc.w $0004
[000aa1cc]                           dc.w $ffff
[000aa1ce]                           dc.w $ffff
[000aa1d0]                           dc.w $001c
[000aa1d2]                           dc.w $0001
[000aa1d4]                           dc.w $0000
[000aa1d6] 000a9769                  dc.l TEXT_365
[000aa1da]                           dc.w $0000
[000aa1dc]                           dc.w $0000
[000aa1de]                           dc.w $000a
[000aa1e0]                           dc.w $0001
_02aREF_TYPE:
[000aa1e2]                           dc.w $0000
[000aa1e4]                           dc.w $0000
[000aa1e6]                           dc.w $0000
[000aa1e8]                           dc.w $0000
[000aa1ea]                           dc.w $8000
[000aa1ec]                           dc.w $0000
[000aa1ee]                           dc.w $0000
[000aa1f0]                           dc.w $0006
[000aa1f2]                           dc.w $0000
[000aa1f4]                           dc.w $0000
[000aa1f6]                           dc.w $0000
[000aa1f8]                           dc.w $0000
_04_REF_TYPE:
[000aa1fa]                           dc.w $0006
[000aa1fc]                           dc.w $ffff
[000aa1fe]                           dc.w $ffff
[000aa200]                           dc.w $001c
[000aa202]                           dc.w $0001
[000aa204]                           dc.w $0000
[000aa206] 000a95cc                  dc.l TEXT_01
[000aa20a]                           dc.w $000a
[000aa20c]                           dc.w $0000
[000aa20e]                           dc.w $000a
[000aa210]                           dc.w $0001
_04aREF_TYPE:
[000aa212]                           dc.w $0000
[000aa214]                           dc.w $0000
[000aa216]                           dc.w $0000
[000aa218]                           dc.w $0000
[000aa21a]                           dc.w $8000
[000aa21c]                           dc.w $0000
[000aa21e]                           dc.w $0000
[000aa220]                           dc.w $000e
[000aa222]                           dc.w $0000
[000aa224]                           dc.w $0000
[000aa226]                           dc.w $0000
[000aa228]                           dc.w $0000
_06_REF_TYPE:
[000aa22a]                           dc.w $0008
[000aa22c]                           dc.w $ffff
[000aa22e]                           dc.w $ffff
[000aa230]                           dc.w $001c
[000aa232]                           dc.w $0001
[000aa234]                           dc.w $0000
[000aa236] 000a9758                  dc.l TEXT_360
[000aa23a]                           dc.w $0000
[000aa23c]                           dc.w $0001
[000aa23e]                           dc.w $000a
[000aa240]                           dc.w $0001
_06aREF_TYPE:
[000aa242]                           dc.w $0000
[000aa244]                           dc.w $0000
[000aa246]                           dc.w $0000
[000aa248]                           dc.w $0000
[000aa24a]                           dc.w $8000
[000aa24c]                           dc.w $0000
[000aa24e]                           dc.w $0000
[000aa250]                           dc.w $0007
[000aa252]                           dc.w $0000
[000aa254]                           dc.w $0000
[000aa256]                           dc.w $0000
[000aa258]                           dc.w $0000
_08_REF_TYPE:
[000aa25a]                           dc.w $000a
[000aa25c]                           dc.w $ffff
[000aa25e]                           dc.w $ffff
[000aa260]                           dc.w $001c
[000aa262]                           dc.w $0001
[000aa264]                           dc.w $0000
[000aa266] 000a95ed                  dc.l TEXT_05
[000aa26a]                           dc.w $000a
[000aa26c]                           dc.w $0001
[000aa26e]                           dc.w $000a
[000aa270]                           dc.w $0001
_08aREF_TYPE:
[000aa272]                           dc.w $0000
[000aa274]                           dc.w $0000
[000aa276]                           dc.w $0000
[000aa278]                           dc.w $0000
[000aa27a]                           dc.w $8000
[000aa27c]                           dc.w $0000
[000aa27e]                           dc.w $0000
[000aa280]                           dc.w $0014
[000aa282]                           dc.w $0000
[000aa284]                           dc.w $0000
[000aa286]                           dc.w $0000
[000aa288]                           dc.w $0000
_10_REF_TYPE:
[000aa28a]                           dc.w $000c
[000aa28c]                           dc.w $ffff
[000aa28e]                           dc.w $ffff
[000aa290]                           dc.w $001c
[000aa292]                           dc.w $0001
[000aa294]                           dc.w $0000
[000aa296] 000a973f                  dc.l TEXT_359
[000aa29a]                           dc.w $0000
[000aa29c]                           dc.w $0002
[000aa29e]                           dc.w $000a
[000aa2a0]                           dc.w $0001
_10aREF_TYPE:
[000aa2a2]                           dc.w $0000
[000aa2a4]                           dc.w $0000
[000aa2a6]                           dc.w $0000
[000aa2a8]                           dc.w $0000
[000aa2aa]                           dc.w $8000
[000aa2ac]                           dc.w $0000
[000aa2ae]                           dc.w $0000
[000aa2b0]                           dc.w $0015
[000aa2b2]                           dc.w $0000
[000aa2b4]                           dc.w $0000
[000aa2b6]                           dc.w $0000
[000aa2b8]                           dc.w $0000
_12_REF_TYPE:
[000aa2ba]                           dc.w $000e
[000aa2bc]                           dc.w $ffff
[000aa2be]                           dc.w $ffff
[000aa2c0]                           dc.w $001c
[000aa2c2]                           dc.w $0001
[000aa2c4]                           dc.w $0000
[000aa2c6] 000a95f5                  dc.l TEXT_06
[000aa2ca]                           dc.w $000a
[000aa2cc]                           dc.w $0002
[000aa2ce]                           dc.w $000a
[000aa2d0]                           dc.w $0001
_12aREF_TYPE:
[000aa2d2]                           dc.w $0000
[000aa2d4]                           dc.w $0000
[000aa2d6]                           dc.w $0000
[000aa2d8]                           dc.w $0000
[000aa2da]                           dc.w $8000
[000aa2dc]                           dc.w $0000
[000aa2de]                           dc.w $0000
[000aa2e0]                           dc.w $000f
[000aa2e2]                           dc.w $0000
[000aa2e4]                           dc.w $0000
[000aa2e6]                           dc.w $0000
[000aa2e8]                           dc.w $0000
_14_REF_TYPE:
[000aa2ea]                           dc.w $0010
[000aa2ec]                           dc.w $ffff
[000aa2ee]                           dc.w $ffff
[000aa2f0]                           dc.w $001c
[000aa2f2]                           dc.w $0001
[000aa2f4]                           dc.w $0000
[000aa2f6] 000a978e                  dc.l TEXT_370
[000aa2fa]                           dc.w $0000
[000aa2fc]                           dc.w $0003
[000aa2fe]                           dc.w $000a
[000aa300]                           dc.w $0001
_14aREF_TYPE:
[000aa302]                           dc.w $0000
[000aa304]                           dc.w $0000
[000aa306]                           dc.w $0000
[000aa308]                           dc.w $0000
[000aa30a]                           dc.w $8000
[000aa30c]                           dc.w $0000
[000aa30e]                           dc.w $0000
[000aa310]                           dc.w $0008
[000aa312]                           dc.w $0000
[000aa314]                           dc.w $0000
[000aa316]                           dc.w $0000
[000aa318]                           dc.w $0000
_16_REF_TYPE:
[000aa31a]                           dc.w $0012
[000aa31c]                           dc.w $ffff
[000aa31e]                           dc.w $ffff
[000aa320]                           dc.w $001c
[000aa322]                           dc.w $0001
[000aa324]                           dc.w $0000
[000aa326] 000a95fe                  dc.l TEXT_07
[000aa32a]                           dc.w $000a
[000aa32c]                           dc.w $0003
[000aa32e]                           dc.w $000a
[000aa330]                           dc.w $0001
_16aREF_TYPE:
[000aa332]                           dc.w $0000
[000aa334]                           dc.w $0000
[000aa336]                           dc.w $0000
[000aa338]                           dc.w $0000
[000aa33a]                           dc.w $8000
[000aa33c]                           dc.w $0000
[000aa33e]                           dc.w $0000
[000aa340]                           dc.w $0010
[000aa342]                           dc.w $0000
[000aa344]                           dc.w $0000
[000aa346]                           dc.w $0000
[000aa348]                           dc.w $0000
_18_REF_TYPE:
[000aa34a]                           dc.w $0014
[000aa34c]                           dc.w $ffff
[000aa34e]                           dc.w $ffff
[000aa350]                           dc.w $001c
[000aa352]                           dc.w $0001
[000aa354]                           dc.w $0000
[000aa356] 000a9738                  dc.l TEXT_358
[000aa35a]                           dc.w $0000
[000aa35c]                           dc.w $0004
[000aa35e]                           dc.w $000a
[000aa360]                           dc.w $0001
_18aREF_TYPE:
[000aa362]                           dc.w $0000
[000aa364]                           dc.w $0000
[000aa366]                           dc.w $0000
[000aa368]                           dc.w $0000
[000aa36a]                           dc.w $8000
[000aa36c]                           dc.w $0000
[000aa36e]                           dc.w $0000
[000aa370]                           dc.w $0009
[000aa372]                           dc.w $0000
[000aa374]                           dc.w $0000
[000aa376]                           dc.w $0000
[000aa378]                           dc.w $0000
_20_REF_TYPE:
[000aa37a]                           dc.w $0016
[000aa37c]                           dc.w $ffff
[000aa37e]                           dc.w $ffff
[000aa380]                           dc.w $001c
[000aa382]                           dc.w $0001
[000aa384]                           dc.w $0000
[000aa386] 000a9605                  dc.l TEXT_08
[000aa38a]                           dc.w $000a
[000aa38c]                           dc.w $0004
[000aa38e]                           dc.w $000a
[000aa390]                           dc.w $0001
_20aREF_TYPE:
[000aa392]                           dc.w $0000
[000aa394]                           dc.w $0000
[000aa396]                           dc.w $0000
[000aa398]                           dc.w $0000
[000aa39a]                           dc.w $8000
[000aa39c]                           dc.w $0000
[000aa39e]                           dc.w $0000
[000aa3a0]                           dc.w $0011
[000aa3a2]                           dc.w $0000
[000aa3a4]                           dc.w $0000
[000aa3a6]                           dc.w $0000
[000aa3a8]                           dc.w $0000
_22_REF_TYPE:
[000aa3aa]                           dc.w $0018
[000aa3ac]                           dc.w $ffff
[000aa3ae]                           dc.w $ffff
[000aa3b0]                           dc.w $001c
[000aa3b2]                           dc.w $0001
[000aa3b4]                           dc.w $0000
[000aa3b6] 000a9795                  dc.l TEXT_371
[000aa3ba]                           dc.w $0000
[000aa3bc]                           dc.w $0005
[000aa3be]                           dc.w $000a
[000aa3c0]                           dc.w $0001
_22aREF_TYPE:
[000aa3c2]                           dc.w $0000
[000aa3c4]                           dc.w $0000
[000aa3c6]                           dc.w $0000
[000aa3c8]                           dc.w $0000
[000aa3ca]                           dc.w $8000
[000aa3cc]                           dc.w $0000
[000aa3ce]                           dc.w $0000
[000aa3d0]                           dc.w $000a
[000aa3d2]                           dc.w $0000
[000aa3d4]                           dc.w $0000
[000aa3d6]                           dc.w $0000
[000aa3d8]                           dc.w $0000
_24_REF_TYPE:
[000aa3da]                           dc.w $001a
[000aa3dc]                           dc.w $ffff
[000aa3de]                           dc.w $ffff
[000aa3e0]                           dc.w $001c
[000aa3e2]                           dc.w $0001
[000aa3e4]                           dc.w $0000
[000aa3e6] 000a960c                  dc.l TEXT_09
[000aa3ea]                           dc.w $000a
[000aa3ec]                           dc.w $0005
[000aa3ee]                           dc.w $000a
[000aa3f0]                           dc.w $0001
_24aREF_TYPE:
[000aa3f2]                           dc.w $0000
[000aa3f4]                           dc.w $0000
[000aa3f6]                           dc.w $0000
[000aa3f8]                           dc.w $0000
[000aa3fa]                           dc.w $8000
[000aa3fc]                           dc.w $0000
[000aa3fe]                           dc.w $0000
[000aa400]                           dc.w $0012
[000aa402]                           dc.w $0000
[000aa404]                           dc.w $0000
[000aa406]                           dc.w $0000
[000aa408]                           dc.w $0000
_26_REF_TYPE:
[000aa40a]                           dc.w $001c
[000aa40c]                           dc.w $ffff
[000aa40e]                           dc.w $ffff
[000aa410]                           dc.w $001c
[000aa412]                           dc.w $0001
[000aa414]                           dc.w $0000
[000aa416] 000a979f                  dc.l TEXT_372
[000aa41a]                           dc.w $0000
[000aa41c]                           dc.w $0006
[000aa41e]                           dc.w $000a
[000aa420]                           dc.w $0001
_26aREF_TYPE:
[000aa422]                           dc.w $0000
[000aa424]                           dc.w $0000
[000aa426]                           dc.w $0000
[000aa428]                           dc.w $0000
[000aa42a]                           dc.w $8000
[000aa42c]                           dc.w $0000
[000aa42e]                           dc.w $0000
[000aa430]                           dc.w $000b
[000aa432]                           dc.w $0000
[000aa434]                           dc.w $0000
[000aa436]                           dc.w $0000
[000aa438]                           dc.w $0000
_28_REF_TYPE:
[000aa43a]                           dc.w $001e
[000aa43c]                           dc.w $ffff
[000aa43e]                           dc.w $ffff
[000aa440]                           dc.w $001c
[000aa442]                           dc.w $0001
[000aa444]                           dc.w $0000
[000aa446] 000a9613                  dc.l TEXT_10
[000aa44a]                           dc.w $000a
[000aa44c]                           dc.w $0006
[000aa44e]                           dc.w $000a
[000aa450]                           dc.w $0001
_28aREF_TYPE:
[000aa452]                           dc.w $0000
[000aa454]                           dc.w $0000
[000aa456]                           dc.w $0000
[000aa458]                           dc.w $0000
[000aa45a]                           dc.w $8000
[000aa45c]                           dc.w $0000
[000aa45e]                           dc.w $0000
[000aa460]                           dc.w $0013
[000aa462]                           dc.w $0000
[000aa464]                           dc.w $0000
[000aa466]                           dc.w $0000
[000aa468]                           dc.w $0000
_30_REF_TYPE:
[000aa46a]                           dc.w $0020
[000aa46c]                           dc.w $ffff
[000aa46e]                           dc.w $ffff
[000aa470]                           dc.w $001c
[000aa472]                           dc.w $0001
[000aa474]                           dc.w $0000
[000aa476] 000a9770                  dc.l TEXT_366
[000aa47a]                           dc.w $0000
[000aa47c]                           dc.w $0007
[000aa47e]                           dc.w $000a
[000aa480]                           dc.w $0001
_30aREF_TYPE:
[000aa482]                           dc.w $0000
[000aa484]                           dc.w $0000
[000aa486]                           dc.w $0000
[000aa488]                           dc.w $0000
[000aa48a]                           dc.w $8000
[000aa48c]                           dc.w $0000
[000aa48e]                           dc.w $0000
[000aa490]                           dc.w $000c
[000aa492]                           dc.w $0000
[000aa494]                           dc.w $0000
[000aa496]                           dc.w $0000
[000aa498]                           dc.w $0000
_32_REF_TYPE:
[000aa49a]                           dc.w $0001
[000aa49c]                           dc.w $ffff
[000aa49e]                           dc.w $ffff
[000aa4a0]                           dc.w $001c
[000aa4a2]                           dc.w $0000
[000aa4a4]                           dc.w $0000
[000aa4a6] 000a95d9                  dc.l TEXT_03
[000aa4aa]                           dc.w $000b
[000aa4ac]                           dc.w $0007
[000aa4ae]                           dc.w $0009
[000aa4b0]                           dc.w $0001
_32aREF_TYPE:
[000aa4b2]                           dc.w $0000
[000aa4b4]                           dc.w $0000
[000aa4b6]                           dc.w $0000
[000aa4b8]                           dc.w $0000
[000aa4ba]                           dc.w $8000
[000aa4bc]                           dc.w $0000
[000aa4be]                           dc.w $0000
[000aa4c0]                           dc.w $0018
[000aa4c2]                           dc.w $0000
[000aa4c4]                           dc.w $0000
[000aa4c6]                           dc.w $0000
[000aa4c8]                           dc.w $0000
_34_REF_TYPE:
[000aa4ca]                           dc.w $002c
[000aa4cc]                           dc.w $0023
[000aa4ce]                           dc.w $0025
[000aa4d0]                           dc.w $0014
[000aa4d2]                           dc.w $0080
[000aa4d4]                           dc.w $0020
[000aa4d6]                           dc.w $00ff
[000aa4d8]                           dc.w $1101
[000aa4da]                           dc.w $0000
[000aa4dc]                           dc.w $0001
[000aa4de]                           dc.w $0009
[000aa4e0]                           dc.w $0002
_35_REF_TYPE:
[000aa4e2]                           dc.w $0025
[000aa4e4]                           dc.w $ffff
[000aa4e6]                           dc.w $ffff
[000aa4e8]                           dc.w $001c
[000aa4ea]                           dc.w $0001
[000aa4ec]                           dc.w $0000
[000aa4ee] 000a9761                  dc.l TEXT_364
[000aa4f2]                           dc.w $0000
[000aa4f4]                           dc.w $0000
[000aa4f6]                           dc.w $0009
[000aa4f8]                           dc.w $0001
_35aREF_TYPE:
[000aa4fa]                           dc.w $0000
[000aa4fc]                           dc.w $0000
[000aa4fe]                           dc.w $0000
[000aa500]                           dc.w $0000
[000aa502]                           dc.w $8000
[000aa504]                           dc.w $0000
[000aa506]                           dc.w $0000
[000aa508]                           dc.w $0001
[000aa50a]                           dc.w $0000
[000aa50c]                           dc.w $0000
[000aa50e]                           dc.w $0000
[000aa510]                           dc.w $0000
_37_REF_TYPE:
[000aa512]                           dc.w $0022
[000aa514]                           dc.w $0027
[000aa516]                           dc.w $0027
[000aa518]                           dc.w $001c
[000aa51a]                           dc.w $0001
[000aa51c]                           dc.w $0000
[000aa51e] 000a9731                  dc.l TEXT_357
[000aa522]                           dc.w $0000
[000aa524]                           dc.w $0001
[000aa526]                           dc.w $0009
[000aa528]                           dc.w $0001
_37aREF_TYPE:
[000aa52a]                           dc.w $0000
[000aa52c]                           dc.w $0000
[000aa52e]                           dc.w $0000
[000aa530]                           dc.w $0000
[000aa532]                           dc.w $8000
[000aa534]                           dc.w $0000
[000aa536]                           dc.w $0000
[000aa538]                           dc.w $0002
[000aa53a]                           dc.w $0000
[000aa53c]                           dc.w $0000
[000aa53e]                           dc.w $0000
[000aa540]                           dc.w $0000
_39_REF_TYPE:
[000aa542]                           dc.w $0025
[000aa544]                           dc.w $0028
[000aa546]                           dc.w $002a
[000aa548]                           dc.w $0014
[000aa54a]                           dc.w $0080
[000aa54c]                           dc.w $0020
[000aa54e]                           dc.w $00ff
[000aa550]                           dc.w $1101
[000aa552]                           dc.w $0000
[000aa554]                           dc.w $0000
[000aa556]                           dc.w $000d
[000aa558]                           dc.w $0002
_40_REF_TYPE:
[000aa55a]                           dc.w $002a
[000aa55c]                           dc.w $ffff
[000aa55e]                           dc.w $ffff
[000aa560]                           dc.w $001c
[000aa562]                           dc.w $0001
[000aa564]                           dc.w $0000
[000aa566] 000a9779                  dc.l TEXT_367
[000aa56a]                           dc.w $0000
[000aa56c]                           dc.w $0000
[000aa56e]                           dc.w $000d
[000aa570]                           dc.w $0001
_40aREF_TYPE:
[000aa572]                           dc.w $0000
[000aa574]                           dc.w $0000
[000aa576]                           dc.w $0000
[000aa578]                           dc.w $0000
[000aa57a]                           dc.w $8000
[000aa57c]                           dc.w $0000
[000aa57e]                           dc.w $0000
[000aa580]                           dc.w $0003
[000aa582]                           dc.w $0000
[000aa584]                           dc.w $0000
[000aa586]                           dc.w $0000
[000aa588]                           dc.w $0000
_42_REF_TYPE:
[000aa58a]                           dc.w $0027
[000aa58c]                           dc.w $ffff
[000aa58e]                           dc.w $ffff
[000aa590]                           dc.w $001c
[000aa592]                           dc.w $0001
[000aa594]                           dc.w $0000
[000aa596] 000a9666                  dc.l TEXT_174
[000aa59a]                           dc.w $0000
[000aa59c]                           dc.w $0001
[000aa59e]                           dc.w $000d
[000aa5a0]                           dc.w $0001
_42aREF_TYPE:
[000aa5a2]                           dc.w $0000
[000aa5a4]                           dc.w $0000
[000aa5a6]                           dc.w $0000
[000aa5a8]                           dc.w $0000
[000aa5aa]                           dc.w $8000
[000aa5ac]                           dc.w $0000
[000aa5ae]                           dc.w $0000
[000aa5b0]                           dc.w $0004
[000aa5b2]                           dc.w $0000
[000aa5b4]                           dc.w $0000
[000aa5b6]                           dc.w $0000
[000aa5b8]                           dc.w $0000
_44_REF_TYPE:
[000aa5ba]                           dc.w $002e
[000aa5bc]                           dc.w $ffff
[000aa5be]                           dc.w $ffff
[000aa5c0]                           dc.w $0018
[000aa5c2]                           dc.w $0041
[000aa5c4]                           dc.w $0000
[000aa5c6] 000a9a7e                  dc.l A_3DBUTTON01
[000aa5ca]                           dc.w $0000
[000aa5cc]                           dc.w $0000
[000aa5ce]                           dc.w $000d
[000aa5d0]                           dc.w $0001
_44aREF_TYPE:
[000aa5d2]                           dc.w $0000
[000aa5d4]                           dc.w $0000
[000aa5d6]                           dc.w $0000
[000aa5d8]                           dc.w $0000
[000aa5da]                           dc.w $8000
[000aa5dc]                           dc.w $0000
[000aa5de]                           dc.w $0000
[000aa5e0]                           dc.w $0000
[000aa5e2]                           dc.w $0000
[000aa5e4]                           dc.w $0000
[000aa5e6]                           dc.w $0000
[000aa5e8]                           dc.w $0000
_46_REF_TYPE:
[000aa5ea]                           dc.w $0034
[000aa5ec]                           dc.w $002f
[000aa5ee]                           dc.w $002f
[000aa5f0]                           dc.w $0018
[000aa5f2]                           dc.w $0041
[000aa5f4]                           dc.w $0000
[000aa5f6] 000a9b1e                  dc.l A_3DBUTTON06
[000aa5fa]                           dc.w $0000
[000aa5fc]                           dc.w $0001
[000aa5fe]                           dc.w $000d
[000aa600]                           dc.w $0001
_47_REF_TYPE:
[000aa602]                           dc.w $002e
[000aa604]                           dc.w $0030
[000aa606]                           dc.w $0032
[000aa608]                           dc.w $0014
[000aa60a]                           dc.w $0080
[000aa60c]                           dc.w $0020
[000aa60e]                           dc.w $00ff
[000aa610]                           dc.w $1101
[000aa612]                           dc.w $0000
[000aa614]                           dc.w $0000
[000aa616]                           dc.w $0009
[000aa618]                           dc.w $0002
_48_REF_TYPE:
[000aa61a]                           dc.w $0032
[000aa61c]                           dc.w $ffff
[000aa61e]                           dc.w $ffff
[000aa620]                           dc.w $0018
[000aa622]                           dc.w $0041
[000aa624]                           dc.w $0000
[000aa626] 000a9b9e                  dc.l A_3DBUTTON10
[000aa62a]                           dc.w $0000
[000aa62c]                           dc.w $0000
[000aa62e]                           dc.w $0009
[000aa630]                           dc.w $0001
_48aREF_TYPE:
[000aa632]                           dc.w $0000
[000aa634]                           dc.w $0000
[000aa636]                           dc.w $0000
[000aa638]                           dc.w $0000
[000aa63a]                           dc.w $8000
[000aa63c]                           dc.w $0000
[000aa63e]                           dc.w $0000
[000aa640]                           dc.w $0001
[000aa642]                           dc.w $0000
[000aa644]                           dc.w $0000
[000aa646]                           dc.w $0000
[000aa648]                           dc.w $0000
_50_REF_TYPE:
[000aa64a]                           dc.w $002f
[000aa64c]                           dc.w $ffff
[000aa64e]                           dc.w $ffff
[000aa650]                           dc.w $0018
[000aa652]                           dc.w $0041
[000aa654]                           dc.w $0000
[000aa656] 000a9b7e                  dc.l A_3DBUTTON09
[000aa65a]                           dc.w $0000
[000aa65c]                           dc.w $0001
[000aa65e]                           dc.w $0009
[000aa660]                           dc.w $0001
_50aREF_TYPE:
[000aa662]                           dc.w $0000
[000aa664]                           dc.w $0000
[000aa666]                           dc.w $0000
[000aa668]                           dc.w $0000
[000aa66a]                           dc.w $8000
[000aa66c]                           dc.w $0000
[000aa66e]                           dc.w $0000
[000aa670]                           dc.w $0002
[000aa672]                           dc.w $0000
[000aa674]                           dc.w $0000
[000aa676]                           dc.w $0000
[000aa678]                           dc.w $0000
_52_REF_TYPE:
[000aa67a]                           dc.w $0050
[000aa67c]                           dc.w $0035
[000aa67e]                           dc.w $0035
[000aa680]                           dc.w $0018
[000aa682]                           dc.w $0041
[000aa684]                           dc.w $0000
[000aa686] 000a9e5e                  dc.l A_3DBUTTON32
[000aa68a]                           dc.w $0000
[000aa68c]                           dc.w $0004
[000aa68e]                           dc.w $000d
[000aa690]                           dc.w $0001
_53_REF_TYPE:
[000aa692]                           dc.w $0034
[000aa694]                           dc.w $0036
[000aa696]                           dc.w $004e
[000aa698]                           dc.w $0014
[000aa69a]                           dc.w $0080
[000aa69c]                           dc.w $0020
[000aa69e]                           dc.w $00ff
[000aa6a0]                           dc.w $1101
[000aa6a2]                           dc.w $0000
[000aa6a4]                           dc.w $0000
[000aa6a6]                           dc.w $000f
[000aa6a8]                           dc.w $000d
_54_REF_TYPE:
[000aa6aa]                           dc.w $0038
[000aa6ac]                           dc.w $ffff
[000aa6ae]                           dc.w $ffff
[000aa6b0]                           dc.w $0018
[000aa6b2]                           dc.w $0041
[000aa6b4]                           dc.w $0000
[000aa6b6] 000a9f1e                  dc.l A_3DBUTTON38
[000aa6ba]                           dc.w $0000
[000aa6bc]                           dc.w $0000
[000aa6be]                           dc.w $000f
[000aa6c0]                           dc.w $0001
_54aREF_TYPE:
[000aa6c2]                           dc.w $0000
[000aa6c4]                           dc.w $0000
[000aa6c6]                           dc.w $0000
[000aa6c8]                           dc.w $0000
[000aa6ca]                           dc.w $8000
[000aa6cc]                           dc.w $0000
[000aa6ce]                           dc.w $0000
[000aa6d0]                           dc.w $0019
[000aa6d2]                           dc.w $0000
[000aa6d4]                           dc.w $0000
[000aa6d6]                           dc.w $0000
[000aa6d8]                           dc.w $0000
_56_REF_TYPE:
[000aa6da]                           dc.w $003a
[000aa6dc]                           dc.w $ffff
[000aa6de]                           dc.w $ffff
[000aa6e0]                           dc.w $0018
[000aa6e2]                           dc.w $0041
[000aa6e4]                           dc.w $0000
[000aa6e6] 000a9e7e                  dc.l A_3DBUTTON33
[000aa6ea]                           dc.w $0000
[000aa6ec]                           dc.w $0001
[000aa6ee]                           dc.w $000f
[000aa6f0]                           dc.w $0001
_56aREF_TYPE:
[000aa6f2]                           dc.w $0000
[000aa6f4]                           dc.w $0000
[000aa6f6]                           dc.w $0000
[000aa6f8]                           dc.w $0000
[000aa6fa]                           dc.w $8000
[000aa6fc]                           dc.w $0000
[000aa6fe]                           dc.w $0000
[000aa700]                           dc.w $001a
[000aa702]                           dc.w $0000
[000aa704]                           dc.w $0000
[000aa706]                           dc.w $0000
[000aa708]                           dc.w $0000
_58_REF_TYPE:
[000aa70a]                           dc.w $003c
[000aa70c]                           dc.w $ffff
[000aa70e]                           dc.w $ffff
[000aa710]                           dc.w $0018
[000aa712]                           dc.w $0041
[000aa714]                           dc.w $0000
[000aa716] 000a9f3e                  dc.l A_3DBUTTON39
[000aa71a]                           dc.w $0000
[000aa71c]                           dc.w $0002
[000aa71e]                           dc.w $000f
[000aa720]                           dc.w $0001
_58aREF_TYPE:
[000aa722]                           dc.w $0000
[000aa724]                           dc.w $0000
[000aa726]                           dc.w $0000
[000aa728]                           dc.w $0000
[000aa72a]                           dc.w $8000
[000aa72c]                           dc.w $0000
[000aa72e]                           dc.w $0000
[000aa730]                           dc.w $001b
[000aa732]                           dc.w $0000
[000aa734]                           dc.w $0000
[000aa736]                           dc.w $0000
[000aa738]                           dc.w $0000
_60_REF_TYPE:
[000aa73a]                           dc.w $003e
[000aa73c]                           dc.w $ffff
[000aa73e]                           dc.w $ffff
[000aa740]                           dc.w $0018
[000aa742]                           dc.w $0041
[000aa744]                           dc.w $0000
[000aa746] 000a9f5e                  dc.l A_3DBUTTON40
[000aa74a]                           dc.w $0000
[000aa74c]                           dc.w $0003
[000aa74e]                           dc.w $000f
[000aa750]                           dc.w $0001
_60aREF_TYPE:
[000aa752]                           dc.w $0000
[000aa754]                           dc.w $0000
[000aa756]                           dc.w $0000
[000aa758]                           dc.w $0000
[000aa75a]                           dc.w $8000
[000aa75c]                           dc.w $0000
[000aa75e]                           dc.w $0000
[000aa760]                           dc.w $001c
[000aa762]                           dc.w $0000
[000aa764]                           dc.w $0000
[000aa766]                           dc.w $0000
[000aa768]                           dc.w $0000
_62_REF_TYPE:
[000aa76a]                           dc.w $0040
[000aa76c]                           dc.w $ffff
[000aa76e]                           dc.w $ffff
[000aa770]                           dc.w $0018
[000aa772]                           dc.w $0041
[000aa774]                           dc.w $0000
[000aa776] 000a9f7e                  dc.l A_3DBUTTON41
[000aa77a]                           dc.w $0000
[000aa77c]                           dc.w $0004
[000aa77e]                           dc.w $000f
[000aa780]                           dc.w $0001
_62aREF_TYPE:
[000aa782]                           dc.w $0000
[000aa784]                           dc.w $0000
[000aa786]                           dc.w $0000
[000aa788]                           dc.w $0000
[000aa78a]                           dc.w $8000
[000aa78c]                           dc.w $0000
[000aa78e]                           dc.w $0000
[000aa790]                           dc.w $001d
[000aa792]                           dc.w $0000
[000aa794]                           dc.w $0000
[000aa796]                           dc.w $0000
[000aa798]                           dc.w $0000
_64_REF_TYPE:
[000aa79a]                           dc.w $0042
[000aa79c]                           dc.w $ffff
[000aa79e]                           dc.w $ffff
[000aa7a0]                           dc.w $0018
[000aa7a2]                           dc.w $0041
[000aa7a4]                           dc.w $0000
[000aa7a6] 000a9e9e                  dc.l A_3DBUTTON34
[000aa7aa]                           dc.w $0000
[000aa7ac]                           dc.w $0005
[000aa7ae]                           dc.w $000f
[000aa7b0]                           dc.w $0001
_64aREF_TYPE:
[000aa7b2]                           dc.w $0000
[000aa7b4]                           dc.w $0000
[000aa7b6]                           dc.w $0000
[000aa7b8]                           dc.w $0000
[000aa7ba]                           dc.w $8000
[000aa7bc]                           dc.w $0000
[000aa7be]                           dc.w $0000
[000aa7c0]                           dc.w $001e
[000aa7c2]                           dc.w $0000
[000aa7c4]                           dc.w $0000
[000aa7c6]                           dc.w $0000
[000aa7c8]                           dc.w $0000
_66_REF_TYPE:
[000aa7ca]                           dc.w $0044
[000aa7cc]                           dc.w $ffff
[000aa7ce]                           dc.w $ffff
[000aa7d0]                           dc.w $0018
[000aa7d2]                           dc.w $0041
[000aa7d4]                           dc.w $0000
[000aa7d6] 000a9f9e                  dc.l A_3DBUTTON42
[000aa7da]                           dc.w $0000
[000aa7dc]                           dc.w $0006
[000aa7de]                           dc.w $000f
[000aa7e0]                           dc.w $0001
_66aREF_TYPE:
[000aa7e2]                           dc.w $0000
[000aa7e4]                           dc.w $0000
[000aa7e6]                           dc.w $0000
[000aa7e8]                           dc.w $0000
[000aa7ea]                           dc.w $8000
[000aa7ec]                           dc.w $0000
[000aa7ee]                           dc.w $0000
[000aa7f0]                           dc.w $001f
[000aa7f2]                           dc.w $0000
[000aa7f4]                           dc.w $0000
[000aa7f6]                           dc.w $0000
[000aa7f8]                           dc.w $0000
_68_REF_TYPE:
[000aa7fa]                           dc.w $0046
[000aa7fc]                           dc.w $ffff
[000aa7fe]                           dc.w $ffff
[000aa800]                           dc.w $0018
[000aa802]                           dc.w $0041
[000aa804]                           dc.w $0000
[000aa806] 000a9fbe                  dc.l A_3DBUTTON43
[000aa80a]                           dc.w $0000
[000aa80c]                           dc.w $0007
[000aa80e]                           dc.w $000f
[000aa810]                           dc.w $0001
_68aREF_TYPE:
[000aa812]                           dc.w $0000
[000aa814]                           dc.w $0000
[000aa816]                           dc.w $0000
[000aa818]                           dc.w $0000
[000aa81a]                           dc.w $8000
[000aa81c]                           dc.w $0000
[000aa81e]                           dc.w $0000
[000aa820]                           dc.w $0020
[000aa822]                           dc.w $0000
[000aa824]                           dc.w $0000
[000aa826]                           dc.w $0000
[000aa828]                           dc.w $0000
_70_REF_TYPE:
[000aa82a]                           dc.w $0048
[000aa82c]                           dc.w $ffff
[000aa82e]                           dc.w $ffff
[000aa830]                           dc.w $0018
[000aa832]                           dc.w $0041
[000aa834]                           dc.w $0000
[000aa836] 000a9ebe                  dc.l A_3DBUTTON35
[000aa83a]                           dc.w $0000
[000aa83c]                           dc.w $0008
[000aa83e]                           dc.w $000f
[000aa840]                           dc.w $0001
_70aREF_TYPE:
[000aa842]                           dc.w $0000
[000aa844]                           dc.w $0000
[000aa846]                           dc.w $0000
[000aa848]                           dc.w $0000
[000aa84a]                           dc.w $8000
[000aa84c]                           dc.w $0000
[000aa84e]                           dc.w $0000
[000aa850]                           dc.w $0021
[000aa852]                           dc.w $0000
[000aa854]                           dc.w $0000
[000aa856]                           dc.w $0000
[000aa858]                           dc.w $0000
_72_REF_TYPE:
[000aa85a]                           dc.w $004a
[000aa85c]                           dc.w $ffff
[000aa85e]                           dc.w $ffff
[000aa860]                           dc.w $0018
[000aa862]                           dc.w $0041
[000aa864]                           dc.w $0000
[000aa866] 000a9ede                  dc.l A_3DBUTTON36
[000aa86a]                           dc.w $0000
[000aa86c]                           dc.w $0009
[000aa86e]                           dc.w $000f
[000aa870]                           dc.w $0001
_72aREF_TYPE:
[000aa872]                           dc.w $0000
[000aa874]                           dc.w $0000
[000aa876]                           dc.w $0000
[000aa878]                           dc.w $0000
[000aa87a]                           dc.w $8000
[000aa87c]                           dc.w $0000
[000aa87e]                           dc.w $0000
[000aa880]                           dc.w $0022
[000aa882]                           dc.w $0000
[000aa884]                           dc.w $0000
[000aa886]                           dc.w $0000
[000aa888]                           dc.w $0000
_74_REF_TYPE:
[000aa88a]                           dc.w $004c
[000aa88c]                           dc.w $ffff
[000aa88e]                           dc.w $ffff
[000aa890]                           dc.w $0018
[000aa892]                           dc.w $0041
[000aa894]                           dc.w $0000
[000aa896] 000a9fde                  dc.l A_3DBUTTON44
[000aa89a]                           dc.w $0000
[000aa89c]                           dc.w $000a
[000aa89e]                           dc.w $000f
[000aa8a0]                           dc.w $0001
_74aREF_TYPE:
[000aa8a2]                           dc.w $0000
[000aa8a4]                           dc.w $0000
[000aa8a6]                           dc.w $0000
[000aa8a8]                           dc.w $0000
[000aa8aa]                           dc.w $8000
[000aa8ac]                           dc.w $0000
[000aa8ae]                           dc.w $0000
[000aa8b0]                           dc.w $0023
[000aa8b2]                           dc.w $0000
[000aa8b4]                           dc.w $0000
[000aa8b6]                           dc.w $0000
[000aa8b8]                           dc.w $0000
_76_REF_TYPE:
[000aa8ba]                           dc.w $004e
[000aa8bc]                           dc.w $ffff
[000aa8be]                           dc.w $ffff
[000aa8c0]                           dc.w $0018
[000aa8c2]                           dc.w $0041
[000aa8c4]                           dc.w $0000
[000aa8c6] 000a9ffe                  dc.l A_3DBUTTON45
[000aa8ca]                           dc.w $0000
[000aa8cc]                           dc.w $000b
[000aa8ce]                           dc.w $000f
[000aa8d0]                           dc.w $0001
_76aREF_TYPE:
[000aa8d2]                           dc.w $0000
[000aa8d4]                           dc.w $0000
[000aa8d6]                           dc.w $0000
[000aa8d8]                           dc.w $0000
[000aa8da]                           dc.w $8000
[000aa8dc]                           dc.w $0000
[000aa8de]                           dc.w $0000
[000aa8e0]                           dc.w $0024
[000aa8e2]                           dc.w $0000
[000aa8e4]                           dc.w $0000
[000aa8e6]                           dc.w $0000
[000aa8e8]                           dc.w $0000
_78_REF_TYPE:
[000aa8ea]                           dc.w $0035
[000aa8ec]                           dc.w $ffff
[000aa8ee]                           dc.w $ffff
[000aa8f0]                           dc.w $0018
[000aa8f2]                           dc.w $0041
[000aa8f4]                           dc.w $0000
[000aa8f6] 000a9efe                  dc.l A_3DBUTTON37
[000aa8fa]                           dc.w $0000
[000aa8fc]                           dc.w $000c
[000aa8fe]                           dc.w $000f
[000aa900]                           dc.w $0001
_78aREF_TYPE:
[000aa902]                           dc.w $0000
[000aa904]                           dc.w $0000
[000aa906]                           dc.w $0000
[000aa908]                           dc.w $0000
[000aa90a]                           dc.w $8000
[000aa90c]                           dc.w $0000
[000aa90e]                           dc.w $0000
[000aa910]                           dc.w $0025
[000aa912]                           dc.w $0000
[000aa914]                           dc.w $0000
[000aa916]                           dc.w $0000
[000aa918]                           dc.w $0000
_80_REF_TYPE:
[000aa91a]                           dc.w $0056
[000aa91c]                           dc.w $0051
[000aa91e]                           dc.w $0051
[000aa920]                           dc.w $0018
[000aa922]                           dc.w $0041
[000aa924]                           dc.w $0000
[000aa926] 000a9afe                  dc.l A_3DBUTTON05
[000aa92a]                           dc.w $0000
[000aa92c]                           dc.w $0002
[000aa92e]                           dc.w $000d
[000aa930]                           dc.w $0001
_81_REF_TYPE:
[000aa932]                           dc.w $0050
[000aa934]                           dc.w $0052
[000aa936]                           dc.w $0054
[000aa938]                           dc.w $0014
[000aa93a]                           dc.w $0080
[000aa93c]                           dc.w $0020
[000aa93e]                           dc.w $00ff
[000aa940]                           dc.w $1101
[000aa942]                           dc.w $0000
[000aa944]                           dc.w $0000
[000aa946]                           dc.w $000e
[000aa948]                           dc.w $0002
_82_REF_TYPE:
[000aa94a]                           dc.w $0054
[000aa94c]                           dc.w $ffff
[000aa94e]                           dc.w $ffff
[000aa950]                           dc.w $0018
[000aa952]                           dc.w $0005
[000aa954]                           dc.w $0000
[000aa956] 000a9bbe                  dc.l A_3DBUTTON11
[000aa95a]                           dc.w $0000
[000aa95c]                           dc.w $0000
[000aa95e]                           dc.w $000e
[000aa960]                           dc.w $0001
_82aREF_TYPE:
[000aa962]                           dc.w $0000
[000aa964]                           dc.w $0000
[000aa966]                           dc.w $0000
[000aa968]                           dc.w $0000
[000aa96a]                           dc.w $8000
[000aa96c]                           dc.w $0000
[000aa96e]                           dc.w $0000
[000aa970]                           dc.w $0003
[000aa972]                           dc.w $0000
[000aa974]                           dc.w $0000
[000aa976]                           dc.w $0000
[000aa978]                           dc.w $0000
_84_REF_TYPE:
[000aa97a]                           dc.w $0051
[000aa97c]                           dc.w $ffff
[000aa97e]                           dc.w $ffff
[000aa980]                           dc.w $0018
[000aa982]                           dc.w $0005
[000aa984]                           dc.w $0000
[000aa986] 000a9bde                  dc.l A_3DBUTTON12
[000aa98a]                           dc.w $0000
[000aa98c]                           dc.w $0001
[000aa98e]                           dc.w $000e
[000aa990]                           dc.w $0001
_84aREF_TYPE:
[000aa992]                           dc.w $0000
[000aa994]                           dc.w $0000
[000aa996]                           dc.w $0000
[000aa998]                           dc.w $0000
[000aa99a]                           dc.w $8000
[000aa99c]                           dc.w $0000
[000aa99e]                           dc.w $0000
[000aa9a0]                           dc.w $0004
[000aa9a2]                           dc.w $0000
[000aa9a4]                           dc.w $0000
[000aa9a6]                           dc.w $0000
[000aa9a8]                           dc.w $0000
_86_REF_TYPE:
[000aa9aa]                           dc.w $0000
[000aa9ac]                           dc.w $0057
[000aa9ae]                           dc.w $0057
[000aa9b0]                           dc.w $0018
[000aa9b2]                           dc.w $0041
[000aa9b4]                           dc.w $0000
[000aa9b6] 000a9b5e                  dc.l A_3DBUTTON08
[000aa9ba]                           dc.w $0000
[000aa9bc]                           dc.w $0003
[000aa9be]                           dc.w $000d
[000aa9c0]                           dc.w $0001
_87_REF_TYPE:
[000aa9c2]                           dc.w $0056
[000aa9c4]                           dc.w $0058
[000aa9c6]                           dc.w $007a
[000aa9c8]                           dc.w $0014
[000aa9ca]                           dc.w $0080
[000aa9cc]                           dc.w $0020
[000aa9ce]                           dc.w $00ff
[000aa9d0]                           dc.w $1101
[000aa9d2]                           dc.w $0000
[000aa9d4]                           dc.w $0000
[000aa9d6]                           dc.w $000c
[000aa9d8]                           dc.w $0012
_88_REF_TYPE:
[000aa9da]                           dc.w $005a
[000aa9dc]                           dc.w $ffff
[000aa9de]                           dc.w $ffff
[000aa9e0]                           dc.w $0018
[000aa9e2]                           dc.w $0041
[000aa9e4]                           dc.w $0000
[000aa9e6] 000a9c1e                  dc.l A_3DBUTTON14
[000aa9ea]                           dc.w $0000
[000aa9ec]                           dc.w $0000
[000aa9ee]                           dc.w $000c
[000aa9f0]                           dc.w $0001
_88aREF_TYPE:
[000aa9f2]                           dc.w $0000
[000aa9f4]                           dc.w $0000
[000aa9f6]                           dc.w $0000
[000aa9f8]                           dc.w $0000
[000aa9fa]                           dc.w $8000
[000aa9fc]                           dc.w $0000
[000aa9fe]                           dc.w $0000
[000aaa00]                           dc.w $0006
[000aaa02]                           dc.w $0000
[000aaa04]                           dc.w $0000
[000aaa06]                           dc.w $0000
[000aaa08]                           dc.w $0000
_90_REF_TYPE:
[000aaa0a]                           dc.w $005c
[000aaa0c]                           dc.w $ffff
[000aaa0e]                           dc.w $ffff
[000aaa10]                           dc.w $0018
[000aaa12]                           dc.w $0041
[000aaa14]                           dc.w $0000
[000aaa16] 000a9c3e                  dc.l A_3DBUTTON15
[000aaa1a]                           dc.w $0000
[000aaa1c]                           dc.w $0001
[000aaa1e]                           dc.w $000c
[000aaa20]                           dc.w $0001
_90aREF_TYPE:
[000aaa22]                           dc.w $0000
[000aaa24]                           dc.w $0000
[000aaa26]                           dc.w $0000
[000aaa28]                           dc.w $0000
[000aaa2a]                           dc.w $8000
[000aaa2c]                           dc.w $0000
[000aaa2e]                           dc.w $0000
[000aaa30]                           dc.w $0007
[000aaa32]                           dc.w $0000
[000aaa34]                           dc.w $0000
[000aaa36]                           dc.w $0000
[000aaa38]                           dc.w $0000
_92_REF_TYPE:
[000aaa3a]                           dc.w $005e
[000aaa3c]                           dc.w $ffff
[000aaa3e]                           dc.w $ffff
[000aaa40]                           dc.w $0018
[000aaa42]                           dc.w $0041
[000aaa44]                           dc.w $0000
[000aaa46] 000a9c5e                  dc.l A_3DBUTTON16
[000aaa4a]                           dc.w $0000
[000aaa4c]                           dc.w $0002
[000aaa4e]                           dc.w $000c
[000aaa50]                           dc.w $0001
_92aREF_TYPE:
[000aaa52]                           dc.w $0000
[000aaa54]                           dc.w $0000
[000aaa56]                           dc.w $0000
[000aaa58]                           dc.w $0000
[000aaa5a]                           dc.w $8000
[000aaa5c]                           dc.w $0000
[000aaa5e]                           dc.w $0000
[000aaa60]                           dc.w $0015
[000aaa62]                           dc.w $0000
[000aaa64]                           dc.w $0000
[000aaa66]                           dc.w $0000
[000aaa68]                           dc.w $0000
_94_REF_TYPE:
[000aaa6a]                           dc.w $0060
[000aaa6c]                           dc.w $ffff
[000aaa6e]                           dc.w $ffff
[000aaa70]                           dc.w $0018
[000aaa72]                           dc.w $0041
[000aaa74]                           dc.w $0000
[000aaa76] 000a9bfe                  dc.l A_3DBUTTON13
[000aaa7a]                           dc.w $0000
[000aaa7c]                           dc.w $0003
[000aaa7e]                           dc.w $000c
[000aaa80]                           dc.w $0001
_94aREF_TYPE:
[000aaa82]                           dc.w $0000
[000aaa84]                           dc.w $0000
[000aaa86]                           dc.w $0000
[000aaa88]                           dc.w $0000
[000aaa8a]                           dc.w $8000
[000aaa8c]                           dc.w $0000
[000aaa8e]                           dc.w $0000
[000aaa90]                           dc.w $0008
[000aaa92]                           dc.w $0000
[000aaa94]                           dc.w $0000
[000aaa96]                           dc.w $0000
[000aaa98]                           dc.w $0000
_96_REF_TYPE:
[000aaa9a]                           dc.w $0062
[000aaa9c]                           dc.w $ffff
[000aaa9e]                           dc.w $ffff
[000aaaa0]                           dc.w $0018
[000aaaa2]                           dc.w $0041
[000aaaa4]                           dc.w $0000
[000aaaa6] 000a9c7e                  dc.l A_3DBUTTON17
[000aaaaa]                           dc.w $0000
[000aaaac]                           dc.w $0004
[000aaaae]                           dc.w $000c
[000aaab0]                           dc.w $0001
_96aREF_TYPE:
[000aaab2]                           dc.w $0000
[000aaab4]                           dc.w $0000
[000aaab6]                           dc.w $0000
[000aaab8]                           dc.w $0000
[000aaaba]                           dc.w $8000
[000aaabc]                           dc.w $0000
[000aaabe]                           dc.w $0000
[000aaac0]                           dc.w $0009
[000aaac2]                           dc.w $0000
[000aaac4]                           dc.w $0000
[000aaac6]                           dc.w $0000
[000aaac8]                           dc.w $0000
_98_REF_TYPE:
[000aaaca]                           dc.w $0064
[000aaacc]                           dc.w $ffff
[000aaace]                           dc.w $ffff
[000aaad0]                           dc.w $0018
[000aaad2]                           dc.w $0041
[000aaad4]                           dc.w $0000
[000aaad6] 000a9d7e                  dc.l A_3DBUTTON25
[000aaada]                           dc.w $0000
[000aaadc]                           dc.w $0005
[000aaade]                           dc.w $000c
[000aaae0]                           dc.w $0001
_98aREF_TYPE:
[000aaae2]                           dc.w $0000
[000aaae4]                           dc.w $0000
[000aaae6]                           dc.w $0000
[000aaae8]                           dc.w $0000
[000aaaea]                           dc.w $8000
[000aaaec]                           dc.w $0000
[000aaaee]                           dc.w $0000
[000aaaf0]                           dc.w $000a
[000aaaf2]                           dc.w $0000
[000aaaf4]                           dc.w $0000
[000aaaf6]                           dc.w $0000
[000aaaf8]                           dc.w $0000
_100_REF_TYPE:
[000aaafa]                           dc.w $0066
[000aaafc]                           dc.w $ffff
[000aaafe]                           dc.w $ffff
[000aab00]                           dc.w $0018
[000aab02]                           dc.w $0041
[000aab04]                           dc.w $0000
[000aab06] 000a9cbe                  dc.l A_3DBUTTON19
[000aab0a]                           dc.w $0000
[000aab0c]                           dc.w $0006
[000aab0e]                           dc.w $000c
[000aab10]                           dc.w $0001
_100aREF_TYPE:
[000aab12]                           dc.w $0000
[000aab14]                           dc.w $0000
[000aab16]                           dc.w $0000
[000aab18]                           dc.w $0000
[000aab1a]                           dc.w $8000
[000aab1c]                           dc.w $0000
[000aab1e]                           dc.w $0000
[000aab20]                           dc.w $000b
[000aab22]                           dc.w $0000
[000aab24]                           dc.w $0000
[000aab26]                           dc.w $0000
[000aab28]                           dc.w $0000
_102_REF_TYPE:
[000aab2a]                           dc.w $0068
[000aab2c]                           dc.w $ffff
[000aab2e]                           dc.w $ffff
[000aab30]                           dc.w $0018
[000aab32]                           dc.w $0041
[000aab34]                           dc.w $0000
[000aab36] 000a9cde                  dc.l A_3DBUTTON20
[000aab3a]                           dc.w $0000
[000aab3c]                           dc.w $0007
[000aab3e]                           dc.w $000c
[000aab40]                           dc.w $0001
_102aREF_TYPE:
[000aab42]                           dc.w $0000
[000aab44]                           dc.w $0000
[000aab46]                           dc.w $0000
[000aab48]                           dc.w $0000
[000aab4a]                           dc.w $8000
[000aab4c]                           dc.w $0000
[000aab4e]                           dc.w $0000
[000aab50]                           dc.w $000c
[000aab52]                           dc.w $0000
[000aab54]                           dc.w $0000
[000aab56]                           dc.w $0000
[000aab58]                           dc.w $0000
_104_REF_TYPE:
[000aab5a]                           dc.w $006a
[000aab5c]                           dc.w $ffff
[000aab5e]                           dc.w $ffff
[000aab60]                           dc.w $0018
[000aab62]                           dc.w $0041
[000aab64]                           dc.w $0000
[000aab66] 000a9cfe                  dc.l A_3DBUTTON21
[000aab6a]                           dc.w $0000
[000aab6c]                           dc.w $0008
[000aab6e]                           dc.w $000c
[000aab70]                           dc.w $0001
_104aREF_TYPE:
[000aab72]                           dc.w $0000
[000aab74]                           dc.w $0000
[000aab76]                           dc.w $0000
[000aab78]                           dc.w $0000
[000aab7a]                           dc.w $8000
[000aab7c]                           dc.w $0000
[000aab7e]                           dc.w $0000
[000aab80]                           dc.w $000e
[000aab82]                           dc.w $0000
[000aab84]                           dc.w $0000
[000aab86]                           dc.w $0000
[000aab88]                           dc.w $0000
_106_REF_TYPE:
[000aab8a]                           dc.w $006c
[000aab8c]                           dc.w $ffff
[000aab8e]                           dc.w $ffff
[000aab90]                           dc.w $0018
[000aab92]                           dc.w $0041
[000aab94]                           dc.w $0000
[000aab96] 000a9d1e                  dc.l A_3DBUTTON22
[000aab9a]                           dc.w $0000
[000aab9c]                           dc.w $0009
[000aab9e]                           dc.w $000c
[000aaba0]                           dc.w $0001
_106aREF_TYPE:
[000aaba2]                           dc.w $0000
[000aaba4]                           dc.w $0000
[000aaba6]                           dc.w $0000
[000aaba8]                           dc.w $0000
[000aabaa]                           dc.w $8000
[000aabac]                           dc.w $0000
[000aabae]                           dc.w $0000
[000aabb0]                           dc.w $0014
[000aabb2]                           dc.w $0000
[000aabb4]                           dc.w $0000
[000aabb6]                           dc.w $0000
[000aabb8]                           dc.w $0000
_108_REF_TYPE:
[000aabba]                           dc.w $006e
[000aabbc]                           dc.w $ffff
[000aabbe]                           dc.w $ffff
[000aabc0]                           dc.w $0018
[000aabc2]                           dc.w $0041
[000aabc4]                           dc.w $0000
[000aabc6] 000a9d3e                  dc.l A_3DBUTTON23
[000aabca]                           dc.w $0000
[000aabcc]                           dc.w $000a
[000aabce]                           dc.w $000c
[000aabd0]                           dc.w $0001
_108aREF_TYPE:
[000aabd2]                           dc.w $0000
[000aabd4]                           dc.w $0000
[000aabd6]                           dc.w $0000
[000aabd8]                           dc.w $0000
[000aabda]                           dc.w $8000
[000aabdc]                           dc.w $0000
[000aabde]                           dc.w $0000
[000aabe0]                           dc.w $000f
[000aabe2]                           dc.w $0000
[000aabe4]                           dc.w $0000
[000aabe6]                           dc.w $0000
[000aabe8]                           dc.w $0000
_110_REF_TYPE:
[000aabea]                           dc.w $0070
[000aabec]                           dc.w $ffff
[000aabee]                           dc.w $ffff
[000aabf0]                           dc.w $0018
[000aabf2]                           dc.w $0041
[000aabf4]                           dc.w $0000
[000aabf6] 000a9dde                  dc.l A_3DBUTTON28
[000aabfa]                           dc.w $0000
[000aabfc]                           dc.w $000b
[000aabfe]                           dc.w $000c
[000aac00]                           dc.w $0001
_110aREF_TYPE:
[000aac02]                           dc.w $0000
[000aac04]                           dc.w $0000
[000aac06]                           dc.w $0000
[000aac08]                           dc.w $0000
[000aac0a]                           dc.w $8000
[000aac0c]                           dc.w $0000
[000aac0e]                           dc.w $0000
[000aac10]                           dc.w $0010
[000aac12]                           dc.w $0000
[000aac14]                           dc.w $0000
[000aac16]                           dc.w $0000
[000aac18]                           dc.w $0000
_112_REF_TYPE:
[000aac1a]                           dc.w $0072
[000aac1c]                           dc.w $ffff
[000aac1e]                           dc.w $ffff
[000aac20]                           dc.w $0018
[000aac22]                           dc.w $0041
[000aac24]                           dc.w $0000
[000aac26] 000a9d5e                  dc.l A_3DBUTTON24
[000aac2a]                           dc.w $0000
[000aac2c]                           dc.w $000c
[000aac2e]                           dc.w $000c
[000aac30]                           dc.w $0001
_112aREF_TYPE:
[000aac32]                           dc.w $0000
[000aac34]                           dc.w $0000
[000aac36]                           dc.w $0000
[000aac38]                           dc.w $0000
[000aac3a]                           dc.w $8000
[000aac3c]                           dc.w $0000
[000aac3e]                           dc.w $0000
[000aac40]                           dc.w $0011
[000aac42]                           dc.w $0000
[000aac44]                           dc.w $0000
[000aac46]                           dc.w $0000
[000aac48]                           dc.w $0000
_114_REF_TYPE:
[000aac4a]                           dc.w $0074
[000aac4c]                           dc.w $ffff
[000aac4e]                           dc.w $ffff
[000aac50]                           dc.w $0018
[000aac52]                           dc.w $0041
[000aac54]                           dc.w $0000
[000aac56] 000a9d9e                  dc.l A_3DBUTTON26
[000aac5a]                           dc.w $0000
[000aac5c]                           dc.w $000d
[000aac5e]                           dc.w $000c
[000aac60]                           dc.w $0001
_114aREF_TYPE:
[000aac62]                           dc.w $0000
[000aac64]                           dc.w $0000
[000aac66]                           dc.w $0000
[000aac68]                           dc.w $0000
[000aac6a]                           dc.w $8000
[000aac6c]                           dc.w $0000
[000aac6e]                           dc.w $0000
[000aac70]                           dc.w $0012
[000aac72]                           dc.w $0000
[000aac74]                           dc.w $0000
[000aac76]                           dc.w $0000
[000aac78]                           dc.w $0000
_116_REF_TYPE:
[000aac7a]                           dc.w $0076
[000aac7c]                           dc.w $ffff
[000aac7e]                           dc.w $ffff
[000aac80]                           dc.w $0018
[000aac82]                           dc.w $0041
[000aac84]                           dc.w $0000
[000aac86] 000a9dbe                  dc.l A_3DBUTTON27
[000aac8a]                           dc.w $0000
[000aac8c]                           dc.w $000e
[000aac8e]                           dc.w $000c
[000aac90]                           dc.w $0001
_116aREF_TYPE:
[000aac92]                           dc.w $0000
[000aac94]                           dc.w $0000
[000aac96]                           dc.w $0000
[000aac98]                           dc.w $0000
[000aac9a]                           dc.w $8000
[000aac9c]                           dc.w $0000
[000aac9e]                           dc.w $0000
[000aaca0]                           dc.w $0013
[000aaca2]                           dc.w $0000
[000aaca4]                           dc.w $0000
[000aaca6]                           dc.w $0000
[000aaca8]                           dc.w $0000
_118_REF_TYPE:
[000aacaa]                           dc.w $0078
[000aacac]                           dc.w $ffff
[000aacae]                           dc.w $ffff
[000aacb0]                           dc.w $0018
[000aacb2]                           dc.w $0041
[000aacb4]                           dc.w $0000
[000aacb6] 000a9c9e                  dc.l A_3DBUTTON18
[000aacba]                           dc.w $0000
[000aacbc]                           dc.w $000f
[000aacbe]                           dc.w $000c
[000aacc0]                           dc.w $0001
_118aREF_TYPE:
[000aacc2]                           dc.w $0000
[000aacc4]                           dc.w $0000
[000aacc6]                           dc.w $0000
[000aacc8]                           dc.w $0000
[000aacca]                           dc.w $8000
[000aaccc]                           dc.w $0000
[000aacce]                           dc.w $0000
[000aacd0]                           dc.w $0016
[000aacd2]                           dc.w $0000
[000aacd4]                           dc.w $0000
[000aacd6]                           dc.w $0000
[000aacd8]                           dc.w $0000
_120_REF_TYPE:
[000aacda]                           dc.w $007a
[000aacdc]                           dc.w $ffff
[000aacde]                           dc.w $ffff
[000aace0]                           dc.w $0018
[000aace2]                           dc.w $0041
[000aace4]                           dc.w $0000
[000aace6] 000a9e1e                  dc.l A_3DBUTTON30
[000aacea]                           dc.w $0000
[000aacec]                           dc.w $0010
[000aacee]                           dc.w $000c
[000aacf0]                           dc.w $0001
_120aREF_TYPE:
[000aacf2]                           dc.w $0000
[000aacf4]                           dc.w $0000
[000aacf6]                           dc.w $0000
[000aacf8]                           dc.w $0000
[000aacfa]                           dc.w $8000
[000aacfc]                           dc.w $0000
[000aacfe]                           dc.w $0000
[000aad00]                           dc.w $0017
[000aad02]                           dc.w $0000
[000aad04]                           dc.w $0000
[000aad06]                           dc.w $0000
[000aad08]                           dc.w $0000
_122_REF_TYPE:
[000aad0a]                           dc.w $0057
[000aad0c]                           dc.w $ffff
[000aad0e]                           dc.w $ffff
[000aad10]                           dc.w $0018
[000aad12]                           dc.w $0041
[000aad14]                           dc.w $0000
[000aad16] 000a9e3e                  dc.l A_3DBUTTON31
[000aad1a]                           dc.w $0000
[000aad1c]                           dc.w $0011
[000aad1e]                           dc.w $000c
[000aad20]                           dc.w $0001
_122aREF_TYPE:
[000aad22]                           dc.w $0000
[000aad24]                           dc.w $0000
[000aad26]                           dc.w $0000
[000aad28]                           dc.w $0000
[000aad2a]                           dc.w $8020
[000aad2c]                           dc.w $0000
[000aad2e]                           dc.w $0000
[000aad30]                           dc.w $0018
[000aad32]                           dc.w $0000
[000aad34]                           dc.w $0000
[000aad36]                           dc.w $0000
[000aad38]                           dc.w $0000
EDIT_REF:
[000aad3a]                           dc.w $ffff
[000aad3c]                           dc.w $0001
[000aad3e]                           dc.w $000b
[000aad40]                           dc.w $0018
[000aad42]                           dc.w $0040
[000aad44]                           dc.w $0010
[000aad46] 000a9abe                  dc.l A_3DBUTTON03
[000aad4a]                           dc.w $0000
[000aad4c]                           dc.w $0000
[000aad4e]                           dc.w $0026
[000aad50]                           dc.w $0006
_01_EDIT_REF:
[000aad52]                           dc.w $0003
[000aad54]                           dc.w $0002
[000aad56]                           dc.w $0002
[000aad58]                           dc.w $001c
[000aad5a]                           dc.w $0040
[000aad5c]                           dc.w $0000
[000aad5e] 000a95d4                  dc.l TEXT_02
[000aad62]                           dc.w $0002
[000aad64]                           dc.w $0001
[000aad66]                           dc.w $0005
[000aad68]                           dc.w $0001
_02_EDIT_REF:
[000aad6a]                           dc.w $0001
[000aad6c]                           dc.w $ffff
[000aad6e]                           dc.w $ffff
[000aad70]                           dc.w $0018
[000aad72]                           dc.w $0040
[000aad74]                           dc.w $0000
[000aad76] 000aa01e                  dc.l A_ARROWS02
[000aad7a]                           dc.w $0000
[000aad7c]                           dc.w $0000
[000aad7e]                           dc.w $0001
[000aad80]                           dc.w $0001
_03_EDIT_REF:
[000aad82]                           dc.w $0005
[000aad84]                           dc.w $ffff
[000aad86]                           dc.w $ffff
[000aad88]                           dc.w $0018
[000aad8a]                           dc.w $0001
[000aad8c]                           dc.w $0001
[000aad8e] 000aa03e                  dc.l A_CHECKBOX01
[000aad92]                           dc.w $001a
[000aad94]                           dc.w $0001
[000aad96]                           dc.w $0009
[000aad98]                           dc.w $0001
_03aEDIT_REF:
[000aad9a]                           dc.w $0000
[000aad9c]                           dc.w $0000
[000aad9e]                           dc.w $0000
[000aada0]                           dc.w $0000
[000aada2]                           dc.w $8000
[000aada4]                           dc.w $8858
[000aada6]                           dc.w $0000
[000aada8]                           dc.w $0000
[000aadaa]                           dc.w $0000
[000aadac]                           dc.w $0000
[000aadae]                           dc.w $0000
[000aadb0]                           dc.w $0000
_05_EDIT_REF:
[000aadb2]                           dc.w $0007
[000aadb4]                           dc.w $ffff
[000aadb6]                           dc.w $ffff
[000aadb8]                           dc.w $0018
[000aadba]                           dc.w $0005
[000aadbc]                           dc.w $0010
[000aadbe] 000a9a9e                  dc.l A_3DBUTTON02
[000aadc2]                           dc.w $0002
[000aadc4]                           dc.w $0003
[000aadc6]                           dc.w $000a
[000aadc8]                           dc.w $0002
_05aEDIT_REF:
[000aadca] 0001da1a                  dc.l editref_edit
[000aadce]                           dc.w $0000
[000aadd0]                           dc.w $0000
[000aadd2]                           dc.w $8000
[000aadd4]                           dc.w $8845
[000aadd6]                           dc.w $0000
[000aadd8]                           dc.w $0000
[000aadda]                           dc.w $0000
[000aaddc]                           dc.w $0000
[000aadde]                           dc.w $0000
[000aade0]                           dc.w $0000
_07_EDIT_REF:
[000aade2]                           dc.w $0009
[000aade4]                           dc.w $ffff
[000aade6]                           dc.w $ffff
[000aade8]                           dc.w $0018
[000aadea]                           dc.w $4007
[000aadec]                           dc.w $0010
[000aadee] 000a9ade                  dc.l A_3DBUTTON04
[000aadf2]                           dc.w $000e
[000aadf4]                           dc.w $0003
[000aadf6]                           dc.w $000a
[000aadf8]                           dc.w $0002
_07aEDIT_REF:
[000aadfa] 0001d492                  dc.l editref_ok
[000aadfe]                           dc.w $0000
[000aae00]                           dc.w $0000
[000aae02]                           dc.w $8000
[000aae04]                           dc.w $884f
[000aae06]                           dc.w $0000
[000aae08]                           dc.w $0000
[000aae0a]                           dc.w $0000
[000aae0c]                           dc.w $0000
[000aae0e]                           dc.w $0000
[000aae10]                           dc.w $0000
_09_EDIT_REF:
[000aae12]                           dc.w $000b
[000aae14]                           dc.w $ffff
[000aae16]                           dc.w $ffff
[000aae18]                           dc.w $0018
[000aae1a]                           dc.w $4005
[000aae1c]                           dc.w $0010
[000aae1e] 000a9b3e                  dc.l A_3DBUTTON07
[000aae22]                           dc.w $001a
[000aae24]                           dc.w $0003
[000aae26]                           dc.w $000a
[000aae28]                           dc.w $0002
_09aEDIT_REF:
[000aae2a] 0001d480                  dc.l editref_abort
[000aae2e]                           dc.w $0000
[000aae30]                           dc.w $0000
[000aae32]                           dc.w $8000
[000aae34]                           dc.w $8841
[000aae36]                           dc.w $0000
[000aae38]                           dc.w $0000
[000aae3a]                           dc.w $0000
[000aae3c]                           dc.w $0000
[000aae3e]                           dc.w $0000
[000aae40]                           dc.w $0000
_11_EDIT_REF:
[000aae42]                           dc.w $0000
[000aae44]                           dc.w $000d
[000aae46]                           dc.w $000d
[000aae48]                           dc.w $0014
[000aae4a]                           dc.w $0040
[000aae4c]                           dc.w $0020
[000aae4e]                           dc.w $00ff
[000aae50]                           dc.w $1101
[000aae52]                           dc.w $0008
[000aae54]                           dc.w $0001
[000aae56]                           dc.w $000e
[000aae58]                           dc.w $0001
_11aEDIT_REF:
[000aae5a] 0001d706                  dc.l editref_choose
[000aae5e]                           dc.w $0000
[000aae60]                           dc.w $0000
[000aae62]                           dc.w $8000
[000aae64]                           dc.w $8854
[000aae66]                           dc.w $0000
[000aae68]                           dc.w $0000
[000aae6a]                           dc.w $0000
[000aae6c]                           dc.w $0000
[000aae6e]                           dc.w $0000
[000aae70]                           dc.w $0000
_13_EDIT_REF:
[000aae72]                           dc.w $000b
[000aae74]                           dc.w $ffff
[000aae76]                           dc.w $ffff
[000aae78]                           dc.w $0018
[000aae7a]                           dc.w $0000
[000aae7c]                           dc.w $0000
[000aae7e] 000a9dfe                  dc.l A_3DBUTTON29
[000aae82]                           dc.w $0000
[000aae84]                           dc.w $0000
[000aae86]                           dc.w $000e
[000aae88]                           dc.w $0001
_13aEDIT_REF:
[000aae8a]                           dc.w $0000
[000aae8c]                           dc.w $0000
[000aae8e]                           dc.w $0000
[000aae90]                           dc.w $0000
[000aae92]                           dc.w $8020
[000aae94]                           dc.w $0000
[000aae96]                           dc.w $0000
[000aae98]                           dc.w $0000
[000aae9a]                           dc.w $0000
[000aae9c]                           dc.w $0000
[000aae9e]                           dc.w $0000
[000aaea0]                           dc.w $0000
WI_REF:
[000aaea2]                           dc.w $0000
[000aaea4]                           dc.w $0000
[000aaea6] 0001d65c                  dc.l rf_service
[000aaeaa] 0001d58e                  dc.l rf_make
[000aaeae] 00057428                  dc.l Awi_open
[000aaeb2] 00055e94                  dc.l Awi_init
[000aaeb6] 000aad3a                  dc.l EDIT_REF
[000aaeba]                           dc.w $0000
[000aaebc]                           dc.w $0000
[000aaebe]                           dc.w $0000
[000aaec0]                           dc.w $0000
[000aaec2]                           dc.w $ffff
[000aaec4]                           dc.w $601f
[000aaec6]                           dc.w $0000
[000aaec8]                           dc.w $0000
[000aaeca]                           dc.w $0063
[000aaecc]                           dc.w $0063
[000aaece]                           dc.w $0000
[000aaed0]                           dc.w $0000
[000aaed2]                           dc.w $0000
[000aaed4]                           dc.w $0000
[000aaed6]                           dc.w $0000
[000aaed8]                           dc.w $0000
[000aaeda]                           dc.w $0000
[000aaedc]                           dc.w $0000
[000aaede]                           dc.w $ffff
[000aaee0]                           dc.w $ffff
[000aaee2]                           dc.w $ffff
[000aaee4]                           dc.w $ffff
[000aaee6]                           dc.w $0000
[000aaee8]                           dc.w $0000
[000aaeea]                           dc.w $fcf8
[000aaeec] 000a961a                  dc.l TEXT_11
[000aaef0] 000a95c0                  dc.l TEXT_002
[000aaef4]                           dc.w $2710
[000aaef6]                           dc.w $0100
[000aaef8]                           dc.w $0000
[000aaefa]                           dc.w $ffff
[000aaefc] 000aa174                  dc.l IC_REF
[000aaf00]                           dc.w $0000
[000aaf02]                           dc.w $0000
[000aaf04] 0006b744                  dc.l Awi_keys
[000aaf08] 00051852                  dc.l Awi_obchange
[000aaf0c] 00051c46                  dc.l Awi_redraw
[000aaf10] 000587a4                  dc.l Awi_topped
[000aaf14] 00058362                  dc.l Awi_closed
[000aaf18] 000587ec                  dc.l Awi_fulled
[000aaf1c] 0005217c                  dc.l Awi_arrowed
[000aaf20] 000524b4                  dc.l Awi_hslid
[000aaf24] 0005255e                  dc.l Awi_vslid
[000aaf28] 00058bb0                  dc.l Awi_sized
[000aaf2c] 00058d50                  dc.l Awi_moved
[000aaf30] 0005998a                  dc.l Awi_iconify
[000aaf34] 00059c6c                  dc.l Awi_uniconify
[000aaf38] 0005b5b6                  dc.l Awi_gemscript
[000aaf3c]                           dc.w $0000
[000aaf3e]                           dc.w $0000
[000aaf40]                           dc.w $0000
[000aaf42]                           dc.w $0000
cross_type:
[000aaf44]                           dc.w $002c
[000aaf46]                           dc.w $0030
[000aaf48]                           dc.w $0032
[000aaf4a]                           dc.w $0052
[000aaf4c]                           dc.w $0054
[000aaf4e]                           dc.w $002c
[000aaf50]                           dc.w $0058
[000aaf52]                           dc.w $005a
[000aaf54]                           dc.w $005e
[000aaf56]                           dc.w $0060
[000aaf58]                           dc.w $0062
[000aaf5a]                           dc.w $0064
[000aaf5c]                           dc.w $0066
[000aaf5e]                           dc.w $002c
[000aaf60]                           dc.w $0068
[000aaf62]                           dc.w $006c
[000aaf64]                           dc.w $006e
[000aaf66]                           dc.w $0070
[000aaf68]                           dc.w $0072
[000aaf6a]                           dc.w $0074
[000aaf6c]                           dc.w $006a
[000aaf6e]                           dc.w $005c
[000aaf70]                           dc.w $0076
[000aaf72]                           dc.w $0078
[000aaf74]                           dc.w $007a
[000aaf76]                           dc.w $0036
[000aaf78]                           dc.w $0038
[000aaf7a]                           dc.w $003a
[000aaf7c]                           dc.w $003c
[000aaf7e]                           dc.w $003e
[000aaf80]                           dc.w $0040
[000aaf82]                           dc.w $0042
[000aaf84]                           dc.w $0044
[000aaf86]                           dc.w $0046
[000aaf88]                           dc.w $0048
[000aaf8a]                           dc.w $004a
[000aaf8c]                           dc.w $004c
[000aaf8e]                           dc.w $004e
cross_type_anz:
[000aaf90]                           dc.w $0026
p_type:
[000aaf92] 000ab0ba                  dc.l $000ab0ba
[000aaf96] 000ab0f5                  dc.l $000ab0f5
[000aaf9a] 000ab127                  dc.l $000ab127
[000aaf9e] 000ab158                  dc.l $000ab158
[000aafa2] 000ab1d8                  dc.l $000ab1d8
[000aafa6] 000ab0ba                  dc.l $000ab0ba
[000aafaa] 000ab259                  dc.l $000ab259
[000aafae] 000ab2b6                  dc.l $000ab2b6
[000aafb2] 000ab347                  dc.l $000ab347
[000aafb6] 000ab3a4                  dc.l $000ab3a4
[000aafba] 000ab42f                  dc.l $000ab42f
[000aafbe] 000ab492                  dc.l $000ab492
[000aafc2] 000ab4ed                  dc.l $000ab4ed
[000aafc6] 000ab0ba                  dc.l $000ab0ba
[000aafca] 000ab538                  dc.l $000ab538
[000aafce] 000ab583                  dc.l $000ab583
[000aafd2] 000ab6a0                  dc.l $000ab6a0
[000aafd6] 000ab6f9                  dc.l $000ab6f9
[000aafda] 000ab752                  dc.l $000ab752
[000aafde] 000ab7ad                  dc.l $000ab7ad
[000aafe2] 000ab808                  dc.l $000ab808
[000aafe6] 000ab852                  dc.l $000ab852
[000aafea] 000ab9cb                  dc.l $000ab9cb
[000aafee] 000aba3c                  dc.l $000aba3c
[000aaff2] 000abaef                  dc.l $000abaef
[000aaff6] 000abb33                  dc.l $000abb33
[000aaffa] 000abb69                  dc.l $000abb69
[000aaffe] 000abb9b                  dc.l $000abb9b
[000ab002] 000abbcd                  dc.l $000abbcd
[000ab006] 000abc23                  dc.l $000abc23
[000ab00a] 000abc78                  dc.l $000abc78
[000ab00e] 000abcaa                  dc.l $000abcaa
[000ab012] 000abcf5                  dc.l $000abcf5
[000ab016] 000abd46                  dc.l $000abd46
[000ab01a] 000abd77                  dc.l $000abd77
[000ab01e] 000abdc9                  dc.l $000abdc9
c_type:
[000ab022] 000abe66                  dc.l $000abe66
[000ab026] 000abe9f                  dc.l $000abe9f
[000ab02a] 000abecf                  dc.l $000abecf
[000ab02e] 000abefe                  dc.l $000abefe
[000ab032] 000abf5c                  dc.l $000abf5c
[000ab036] 000abfc8                  dc.l $000abfc8
[000ab03a] 000ac001                  dc.l $000ac001
[000ab03e] 000ac04b                  dc.l $000ac04b
[000ab042] 000ac0e2                  dc.l $000ac0e2
[000ab046] 000ac12d                  dc.l $000ac12d
[000ab04a] 000ac1a8                  dc.l $000ac1a8
[000ab04e] 000ac204                  dc.l $000ac204
[000ab052] 000ac252                  dc.l $000ac252
[000ab056] 000abe66                  dc.l $000abe66
[000ab05a] 000ac293                  dc.l $000ac293
[000ab05e] 000ac2d4                  dc.l $000ac2d4
[000ab062] 000ac447                  dc.l $000ac447
[000ab066] 000ac493                  dc.l $000ac493
[000ab06a] 000ac4df                  dc.l $000ac4df
[000ab06e] 000ac52c                  dc.l $000ac52c
[000ab072] 000ac579                  dc.l $000ac579
[000ab076] 000ac5ba                  dc.l $000ac5ba
[000ab07a] 000ac6a9                  dc.l $000ac6a9
[000ab07e] 000ac716                  dc.l $000ac716
[000ab082] 000ac777                  dc.l $000ac777
[000ab086] 000ac818                  dc.l $000ac818
[000ab08a] 000ac818                  dc.l $000ac818
[000ab08e] 000ac85c                  dc.l $000ac85c
[000ab092] 000ac897                  dc.l $000ac897
[000ab096] 000ac8ce                  dc.l $000ac8ce
[000ab09a] 000ac905                  dc.l $000ac905
[000ab09e] 000ac948                  dc.l $000ac948
[000ab0a2] 000ac98a                  dc.l $000ac98a
[000ab0a6] 000ac9c1                  dc.l $000ac9c1
[000ab0aa] 000aca0a                  dc.l $000aca0a
[000ab0ae] 000aca5a                  dc.l $000aca5a
[000ab0b2] 000aca90                  dc.l $000aca90
[000ab0b6] 000acae0                  dc.l $000acae0
[000ab0ba]                           dc.b 'Procedure %s;',$0d,$0a,'{ Unkown type of routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab0f5]                           dc.b 'Procedure %s;',$0d,$0a,'{ Click routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab127]                           dc.b 'Procedure %s;',$0d,$0a,'{ Drag routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab158]                           dc.b 'Function %s (dummy1, dummy2: Pointer; pb: PARMBLKPtr): Integer;',$0d,$0a,'{ USERDEF routine }',$0d,$0a,'Begin',$0d,$0a,$09,'%s := pb^.pb_currstate;',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab1d8]                           dc.b 'Function %s (entry: ACSOBJECTPtr; task: Integer; in_out: Pointer): Boolean;',$0d,$0a,'{ USERDEF service }',$0d,$0a,'Begin',$0d,$0a,$09,'%s := FALSE;',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab259]                           dc.b 'Function %s (wind: AwindowPtr): Integer;',$0d,$0a,'{ wind.open routine }',$0d,$0a,'Begin',$0d,$0a,$09,'%s := OK;',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab2b6]                           dc.b 'Function %s (para: Pointer): AwindowPtr;',$0d,$0a,'{ wind.create routine }',$0d,$0a,$09,'Var wi: AwindowPtr;',$0d,$0a,'Begin',$0d,$0a,$0d,$0a,$09,'wi := Awi_create (@..);',$0d,$0a,$09,'%s := wi;',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab347]                           dc.b 'Function %s (wind: AwindowPtr): Integer;',$0d,$0a,'{ wind.init routine }',$0d,$0a,'Begin',$0d,$0a,$09,'%s := OK;',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab3a4]                           dc.b 'Function %s (wind: AwindowPtr; kstate, key: Integer): Integer;',$0d,$0a,'{ wind.keys routine }',$0d,$0a,'Begin',$0d,$0a,$09,'%s := Awi_keys (wi, kstate, key);',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab42f]                           dc.b 'Procedure %s (wind: AwindowPtr; obnr, state: Integer);',$0d,$0a,'{ wind.obchange routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab492]                           dc.b 'Procedure %s (wind: AwindowPtr; area: AxywhPtr);',$0d,$0a,'{ wind.redraw routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab4ed]                           dc.b 'Procedure %s (wind: AwindowPtr);',$0d,$0a,'{ wind.topped routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab538]                           dc.b 'Procedure %s (wind: AwindowPtr);',$0d,$0a,'{ wind.closed routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab583]                           dc.b 'Procedure %s (wind: AwindowPtr; which, amount: Integer);',$0d,$0a,'{ wind.arrowed routine }',$0d,$0a,'Begin',$0d,$0a,$09,'Case (which) of',$0d,$0a,$09,'WA_UPLINE:',$0d,$0a,$09,'{ };',$0d,$0a,$09,'WA_DNLINE:',$0d,$0a,$09,'{ };',$0d,$0a,$09,'WA_UPPAGE:',$0d,$0a,$09,'{ };',$0d,$0a,$09,'WA_DNPAGE:',$0d,$0a,$09,'{ };',$0d,$0a,$09,'WA_LFPAGE:',$0d,$0a,$09,'{ };',$0d,$0a,$09,'WA_RTPAGE:',$0d,$0a,$09,'{ };',$0d,$0a,$09,'WA_LFLINE:',$0d,$0a,$09,'{ };',$0d,$0a,$09,'WA_RTLINE:',$0d,$0a,$09,'{ };',$0d,$0a,$09,'End;',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab6a0]                           dc.b 'Procedure %s( wind: AwindowPtr; pos: Integer );',$0d,$0a,'{ wind.hslid routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab6f9]                           dc.b 'Procedure %s( wind: AwindowPtr; pos: Integer );',$0d,$0a,'{ wind.vslid routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab752]                           dc.b 'Procedure %s( wind: AwindowPtr; area: AxywhPtr );',$0d,$0a,'{ wind.moved routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab7ad]                           dc.b 'Procedure %s( wind: AwindowPtr; area: AxywhPtr );',$0d,$0a,'{ wind.sized routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab808]                           dc.b 'Procedure %s( wind: AwindowPtr );',$0d,$0a,'{ wi.fulled routine }',$0d,$0a,'Begin',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab852]                           dc.b 'Function %s( wind: AwindowPtr; task: Integer; in_out: Pointer): Boolean;',$0d,$0a,'{ wi.service routine }',$0d,$0a,'Begin',$0d,$0a,$09,'case (task) of ',$0d,$0a,$09,'AS_TERM:',$0d,$0a,$09,$09,'Awi_delete (wind);',$0d,$0a,$09,'Else Begin',$0d,$0a,$09,$09,'%s := Awi_service(wind, task, in_out);',$0d,$0a,$09,$09,'Exit;',$0d,$0a,$09,'End;',$0d,$0a,$09,'%s := TRUE;',$0d,$0a,'End;',$0d,$0a,$0d,$0a,'{ Window-Iconify-Routine }',$0d,$0a,'Function %s( wi: AwindowPtr; all: Integer ) : Integer;',$0d,$0a,'Begin',$0d,$0a,$09,'%s:=Awi_iconify(wi, all);',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000ab9cb]                           dc.b '{ Window-Uniconify-Routine }',$0d,$0a,'Function %s( wi: AwindowPtr ) : Integer;',$0d,$0a,'Begin',$0d,$0a,$09,'%s:=Awi_uniconify(wi);',$0d,$0a,'End;',$0d,$0a,$0d,$0a,0
[000aba3c]                           dc.b '{ Window-GEMScript-Routine }',$0d,$0a,'Function %s( wi: AwindowPtr; anz: Integer; cmd: Pointer; antwort: A_GSAntwortPtr ) : Integer',$0d,$0a,'{',$0d,$0a,$09,'return Awi_gemscript(wi, anz, cmd, antwort);',$0d,$0a,'}',$0d,$0a,$0d,$0a,'{ System-Init-Routine }',$0d,$0a,'Function %s : Integer;',$0d,$0a,'{',$0d,$0a,$09,'%s:=OK;',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abb33]                           dc.b '{ System-Terminier-Routine }',$0d,$0a,'Procedure %s;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abb69]                           dc.b '{ System-About-Routine }',$0d,$0a,'Procedure %s;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abb9b]                           dc.b '{ System-Close-Routine }',$0d,$0a,'Procedure %s;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abbcd]                           dc.b '{ System-Message-Routine }',$0d,$0a,'Procedure %s( message: array [0..7] of Integer;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abc23]                           dc.b '{ System-Message-Filter }',$0d,$0a,'Procedure %s( message: array [0..7] of Integer;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abc78]                           dc.b '{ System-Timer-Routine }',$0d,$0a,'Procedure %s;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abcaa]                           dc.b '{ System-Key-Filter }',$0d,$0a,'Procedure %s( Var kstate, key: Integer );',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abcf5]                           dc.b '{ System-Button-Filter }',$0d,$0a,'Procedure %s( Var button, kreturn: Integer )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abd46]                           dc.b '{ System-Maus-Routine }',$0d,$0a,'Procedure %s;',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abd77]                           dc.b '{ System-Window-Key-Filter }',$0d,$0a,'Procedure %s( Var kstate, key: Integer );',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abdc9]                           dc.b '{ System-GEMScript-Routine }',$0d,$0a,'Function %s( anz: Integer; cmd: Pointer; antwort: A_GSAntwortPtr ) : Integer;',$0d,$0a,'{',$0d,$0a,$09,'%s:=ACSGEMScript(anz, cmd, antwort);',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abe66]                           dc.b $09,'/* Unkown type of routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abe9f]                           dc.b $09,'/* Click routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abecf]                           dc.b $09,'/* Drag routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abefe]                           dc.b $09,'/* USERDEF Draw-Routine */',$0d,$0a,'INT16 CDECL %s( PARMBLK *pb )',$0d,$0a,'{',$09,'return pb->pb_currstate;',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abf5c]                           dc.b $09,'/* USERDEF Service-Routine */',$0d,$0a,'INT16 %s( OBJECT *entry, INT16 task, void *in_out )',$0d,$0a,'{',$09,'return FALSE;',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000abfc8]                           dc.b $09,'/* Unkown type of routine */void %s( void )',$0d,$0a,$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac001]                           dc.b $09,'/* Window-Open-Routine*/',$0d,$0a,'INT16 %s( Awindow *wind )',$0d,$0a,'{',$09,'return OK;',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac04b]                           dc.b $09,'/* Window-Create-Routine */',$0d,$0a,'Awindow *%s( void *para )',$0d,$0a,'{',$09,'Awindow',$09,'*wi;',$0d,$0a,$0d,$0a,$09,'wi=Awi_create(&..);',$0d,$0a,'if( wi== NULL )',$0d,$0a,$09,$09,'return NULL;',$0d,$0a,$0d,$0a,$09,'return wi;',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac0e2]                           dc.b $09,'/* Window-Init-Routine */',$0d,$0a,'INT16 %s( Awindow *wind )',$0d,$0a,'{',$09,'return OK;',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac12d]                           dc.b $09,'/* Window-Keys-Routine */',$0d,$0a,'INT16 %s( Awindow *wind, INT16 kstate, INT16 key )',$0d,$0a,'{',$09,'return Awi_keys(wi, kstate, key);',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac1a8]                           dc.b $09,'/* Window-Obchange-Routine */',$0d,$0a,'void %s( Awindow *wind, INT16 obnr, INT16 state )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac204]                           dc.b $09,'/* Window-Redraw-Routine */',$0d,$0a,'void %s( Awindow *wind, Axywh *area )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac252]                           dc.b $09,'/* Window-Topped-Routine */',$0d,$0a,'void %s( Awindow *wind )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac293]                           dc.b $09,'/* Window-Closed-Routine */',$0d,$0a,'void %s( Awindow *wind )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac2d4]                           dc.b $09,'/* Window-Arrowed-Routine */',$0d,$0a,'void %s( Awindow *wind, INT16 which, INT16 amount )',$0d,$0a,'{',$0d,$0a,$09,'switch(which)',$0d,$0a,$09,'{',$0d,$0a,$09,$09,'case WA_UPLINE:',$0d,$0a,$09,$09,$09,'break;',$0d,$0a,$0d,$0a,$09,$09,'case WA_DNLINE:',$0d,$0a,$09,$09,$09,'break;',$0d,$0a,$0d,$0a,$09,$09,'case WA_UPPAGE:',$0d,$0a,$09,$09,$09,'break;',$0d,$0a,$0d,$0a,$09,$09,'case WA_DNPAGE:',$0d,$0a,$09,$09,$09,'break;',$0d,$0a,$0d,$0a,$09,$09,'case WA_LFPAGE:',$0d,$0a,$09,$09,$09,'break;',$0d,$0a,$0d,$0a,$09,$09,'case WA_RTPAGE:',$0d,$0a,$09,$09,$09,'break;',$0d,$0a,$0d,$0a,$09,$09,'case WA_LFLINE:',$0d,$0a,$09,$09,$09,'break;',$0d,$0a,$0d,$0a,$09,$09,'case WA_RTLINE:',$0d,$0a,$09,$09,$09,'break;',$0d,$0a,$09,'}',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac447]                           dc.b $09,'/* Window-HSlide-Routine */',$0d,$0a,'void %s( Awindow *wind, INT16 pos )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac493]                           dc.b $09,'/* Window-VSlide-Routine */',$0d,$0a,'void %s( Awindow *wind, INT16 pos )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac4df]                           dc.b $09,'/* Window-Moved-Routine */',$0d,$0a,'void %s( Awindow *wind, Axywh *area )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac52c]                           dc.b $09,'/* Window-Sized-Routine */',$0d,$0a,'void %s( Awindow *wind, Axywh *area )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac579]                           dc.b $09,'/* Window-Fulled-Routine */',$0d,$0a,'void %s( Awindow *wind )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac5ba]                           dc.b $09,'/* Window-Service-Routine */',$0d,$0a,'INT16 %s( Awindow *wind, INT16 task, void *in_out )',$0d,$0a,'{',$0d,$0a,$09,'switch(task)',$0d,$0a,$09,'{',$0d,$0a,$09,$09,'case AS_TERM:',$0d,$0a,$09,$09,$09,'Awi_delete(wind);',$0d,$0a,$09,$09,$09,'break;',$0d,$0a,$0d,$0a,$09,$09,'default:',$0d,$0a,$09,$09,$09,'return Awi_service(wind, task, in_out);',$0d,$0a,$09,'}',$0d,$0a,$09,'return TRUE;',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac6a9]                           dc.b $09,'/* Window-Iconify-Routine */',$0d,$0a,'INT16 %s( Awindow *wind, INT16 all )',$0d,$0a,'{',$0d,$0a,$09,'return Awi_iconify(wi, all);',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac716]                           dc.b $09,'/* Window-Uniconify-Routine */',$0d,$0a,'INT16 %s( Awindow *wind )',$0d,$0a,'{',$0d,$0a,$09,'return Awi_uniconify(wi);',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac777]                           dc.b $09,'/* Window-GEMScript-Routine */',$0d,$0a,'INT16 %s( Awindow *wind, INT16 anz, char **cmd, A_GSAntwort *antwort )',$0d,$0a,'{',$0d,$0a,$09,'return Awi_gemscript(wi, anz, cmd, antwort);',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac818]                           dc.b $09,'/* System-Init-Routine */',$0d,$0a,'INT16 %s( void )',$0d,$0a,'{',$0d,$0a,$09,'return OK;',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac85c]                           dc.b $09,'/* System-Terminier-Routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac897]                           dc.b $09,'/* System-About-Routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac8ce]                           dc.b $09,'/* System-Close-Routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac905]                           dc.b $09,'/* System-Message-Routine */',$0d,$0a,'void %s( INT16 *message )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac948]                           dc.b $09,'/* System-Message-Filter */',$0d,$0a,'void %s( INT16 *message )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac98a]                           dc.b $09,'/* System-Timer-Routine */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000ac9c1]                           dc.b $09,'/* System-Key-Filter */',$0d,$0a,'void %s( INT16 *kstate, INT16 *key )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000aca0a]                           dc.b $09,'/* System-Button-Filter */',$0d,$0a,'void %s( INT16 *button, INT16 *kreturn )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000aca5a]                           dc.b $09,'/* System-Mouse-Filter */',$0d,$0a,'void %s( void )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000aca90]                           dc.b $09,'/* System-Window-Key-Filter */',$0d,$0a,'void %s( INT16 *kstate, INT16 *key )',$0d,$0a,'{',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000acae0]                           dc.b $09,'/* System-GEMScript-Routine */',$0d,$0a,'INT16 %s( INT16 anz, char **cmd, A_GSAntwort *antwort )',$0d,$0a,'{',$0d,$0a,$09,'return ACSGEMScript(anz, cmd, antwort);',$0d,$0a,'}',$0d,$0a,$0d,$0a,0
[000acb6d]                           dc.b $20
[000acb6e]                           dc.w $0020
[000acb70]                           dc.b '(REF) ',0
[000acb77]                           dc.b ' * ',0
[000acb7b]                           dc.b $43
[000acb7c]                           dc.w $0073
[000acb7e]                           dc.b 'tatic ',0
[000acb85]                           dc.b $00
