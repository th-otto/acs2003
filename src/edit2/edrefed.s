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
[0001d4f8] 6706                      beq.s      $0001D500
[0001d4fa] 006b 0200 0038            ori.w      #$0200,56(a3)
[0001d500] 2469 0008                 movea.l    8(a1),a2
[0001d504] 200a                      move.l     a2,d0
[0001d506] 6700 007c                 beq.w      $0001D584
[0001d50a] 43ef 0008                 lea.l      8(a7),a1
[0001d50e] 204a                      movea.l    a2,a0
[0001d510] 286a 0004                 movea.l    4(a2),a4
[0001d514] 303c 00cf                 move.w     #$00CF,d0
[0001d518] 4e94                      jsr        (a4)
[0001d51a] 202f 0008                 move.l     8(a7),d0
[0001d51e] 6f4c                      ble.s      $0001D56C
[0001d520] 7001                      moveq.l    #1,d0
[0001d522] d0af 0008                 add.l      8(a7),d0
[0001d526] 4eb9 0004 c608            jsr        Ax_malloc
[0001d52c] 2e88                      move.l     a0,(a7)
[0001d52e] 2008                      move.l     a0,d0
[0001d530] 6752                      beq.s      $0001D584
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
[0001d56a] 6018                      bra.s      $0001D584
[0001d56c] 206b 0004                 movea.l    4(a3),a0
[0001d570] 4eb9 0004 c6c8            jsr        Ax_ifree
[0001d576] 42ab 0004                 clr.l      4(a3)
[0001d57a] 7000                      moveq.l    #0,d0
[0001d57c] 2740 000e                 move.l     d0,14(a3)
[0001d580] 2740 000a                 move.l     d0,10(a3)
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
[0001d5a0] 670c                      beq.s      $0001D5AE
[0001d5a2] 204c                      movea.l    a4,a0
[0001d5a4] 4eb9 0005 6bea            jsr        Awi_show
[0001d5aa] 6000 00a6                 bra        $0001D652
[0001d5ae] 700c                      moveq.l    #12,d0
[0001d5b0] 4eb9 0004 c608            jsr        Ax_malloc
[0001d5b6] 2448                      movea.l    a0,a2
[0001d5b8] 200a                      move.l     a2,d0
[0001d5ba] 6700 0092                 beq        $0001D64E
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
[0001d5f0] 660a                      bne.s      $0001D5FC
[0001d5f2] 204a                      movea.l    a2,a0
[0001d5f4] 4eb9 0004 c7c8            jsr        Ax_free
[0001d5fa] 6052                      bra.s      $0001D64E
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
[0001d624] 6f14                      ble.s      $0001D63A
[0001d626] 322b 0038                 move.w     56(a3),d1
[0001d62a] c27c 0200                 and.w      #$0200,d1
[0001d62e] 660a                      bne.s      $0001D63A
[0001d630] 204c                      movea.l    a4,a0
[0001d632] 4eb9 0001 d876            jsr        ref_edit
[0001d638] 6018                      bra.s      $0001D652
[0001d63a] 204c                      movea.l    a4,a0
[0001d63c] 226c 000c                 movea.l    12(a4),a1
[0001d640] 4e91                      jsr        (a1)
[0001d642] 4a40                      tst.w      d0
[0001d644] 670c                      beq.s      $0001D652
[0001d646] 204c                      movea.l    a4,a0
[0001d648] 4eb9 0001 d7da            jsr        term
[0001d64e] 91c8                      suba.l     a0,a0
[0001d650] 6002                      bra.s      $0001D654
[0001d652] 204c                      movea.l    a4,a0
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
[0001d66a] 6712                      beq.s      $0001D67E
[0001d66c] 907c 00cf                 sub.w      #$00CF,d0
[0001d670] 6712                      beq.s      $0001D684
[0001d672] 5340                      subq.w     #1,d0
[0001d674] 6708                      beq.s      $0001D67E
[0001d676] 907c 263e                 sub.w      #$263E,d0
[0001d67a] 6712                      beq.s      $0001D68E
[0001d67c] 601e                      bra.s      $0001D69C
[0001d67e] 204a                      movea.l    a2,a0
[0001d680] 6100 fe32                 bsr        acc_eref
[0001d684] 204a                      movea.l    a2,a0
[0001d686] 4eb9 0001 d7da            jsr        term
[0001d68c] 601c                      bra.s      $0001D6AA
[0001d68e] 226b 0004                 movea.l    4(a3),a1
[0001d692] 204a                      movea.l    a2,a0
[0001d694] 4eb9 0001 60ea            jsr        new_name
[0001d69a] 600e                      bra.s      $0001D6AA
[0001d69c] 224c                      movea.l    a4,a1
[0001d69e] 3003                      move.w     d3,d0
[0001d6a0] 204a                      movea.l    a2,a0
[0001d6a2] 4eb9 0005 9dd0            jsr        Awi_service
[0001d6a8] 6002                      bra.s      $0001D6AC
[0001d6aa] 7001                      moveq.l    #1,d0
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
[0001d6cc] 6002                      bra.s      $0001D6D0
[0001d6ce] 524b                      addq.w     #1,a3
[0001d6d0] 0c13 0020                 cmpi.b     #$20,(a3)
[0001d6d4] 67f8                      beq.s      $0001D6CE
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
[0001d72c] 6b48                      bmi.s      $0001D776
[0001d72e] 48c0                      ext.l      d0
[0001d730] 2200                      move.l     d0,d1
[0001d732] d281                      add.l      d1,d1
[0001d734] d280                      add.l      d0,d1
[0001d736] e789                      lsl.l      #3,d1
[0001d738] 41f2 1818                 lea.l      24(a2,d1.l),a0
[0001d73c] b67c 0001                 cmp.w      #$0001,d3
[0001d740] 6710                      beq.s      $0001D752
[0001d742] 3428 0008                 move.w     8(a0),d2
[0001d746] c47c 8000                 and.w      #$8000,d2
[0001d74a] 672a                      beq.s      $0001D776
[0001d74c] 3228 000e                 move.w     14(a0),d1
[0001d750] 6724                      beq.s      $0001D776
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
[0001d792] 6b08                      bmi.s      $0001D79C
[0001d794] b679 000a af90            cmp.w      cross_type_anz,d3
[0001d79a] 6d02                      blt.s      $0001D79E
[0001d79c] 4243                      clr.w      d3
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
[0001d7e8] 6600 0086                 bne        $0001D870
[0001d7ec] 006a 0300 0056            ori.w      #$0300,86(a2)
[0001d7f2] 2650                      movea.l    (a0),a3
[0001d7f4] 286b 0008                 movea.l    8(a3),a4
[0001d7f8] 200c                      move.l     a4,d0
[0001d7fa] 6728                      beq.s      $0001D824
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
[0001d824] 206b 0004                 movea.l    4(a3),a0
[0001d828] 42a8 0012                 clr.l      18(a0)
[0001d82c] 302a 0056                 move.w     86(a2),d0
[0001d830] c07c 0800                 and.w      #$0800,d0
[0001d834] 6716                      beq.s      $0001D84C
[0001d836] 43ea 002c                 lea.l      44(a2),a1
[0001d83a] 206b 0004                 movea.l    4(a3),a0
[0001d83e] 41e8 003a                 lea.l      58(a0),a0
[0001d842] 7008                      moveq.l    #8,d0
[0001d844] 4eb9 0008 3500            jsr        memcpy
[0001d84a] 6014                      bra.s      $0001D860
[0001d84c] 7008                      moveq.l    #8,d0
[0001d84e] 43ea 0024                 lea.l      36(a2),a1
[0001d852] 206b 0004                 movea.l    4(a3),a0
[0001d856] 41e8 003a                 lea.l      58(a0),a0
[0001d85a] 4eb9 0008 3500            jsr        memcpy
[0001d860] 204b                      movea.l    a3,a0
[0001d862] 4eb9 0004 c7c8            jsr        Ax_free
[0001d868] 204a                      movea.l    a2,a0
[0001d86a] 4eb9 0005 85f2            jsr        Awi_delete
[0001d870] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0001d874] 4e75                      rts
ref_edit:
[0001d876] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[0001d87a] 4fef fbb4                 lea.l      -1100(a7),a7
[0001d87e] 2f48 0448                 move.l     a0,1096(a7)
[0001d882] 2450                      movea.l    (a0),a2
[0001d884] 266a 0008                 movea.l    8(a2),a3
[0001d888] 200b                      move.l     a3,d0
[0001d88a] 6600 017c                 bne        $0001DA08
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
[0001d950] 6f14                      ble.s      $0001D966
[0001d952] 226c 0004                 movea.l    4(a4),a1
[0001d956] 204b                      movea.l    a3,a0
[0001d958] 2a6b 0004                 movea.l    4(a3),a5
[0001d95c] 303c 00cd                 move.w     #$00CD,d0
[0001d960] 4e95                      jsr        (a5)
[0001d962] 6000 0088                 bra        $0001D9EC
[0001d966] 2052                      movea.l    (a2),a0
[0001d968] 3028 020e                 move.w     526(a0),d0
[0001d96c] 4a40                      tst.w      d0
[0001d96e] 6706                      beq.s      $0001D976
[0001d970] 5340                      subq.w     #1,d0
[0001d972] 672a                      beq.s      $0001D99E
[0001d974] 602e                      bra.s      $0001D9A4
[0001d976] 302c 0038                 move.w     56(a4),d0
[0001d97a] c07c 0500                 and.w      #$0500,d0
[0001d97e] b07c 0100                 cmp.w      #$0100,d0
[0001d982] 6712                      beq.s      $0001D996
[0001d984] 43f9 000a cb7d            lea.l      $000ACB7D,a1
[0001d98a] 204b                      movea.l    a3,a0
[0001d98c] 246b 0004                 movea.l    4(a3),a2
[0001d990] 303c 00cd                 move.w     #$00CD,d0
[0001d994] 4e92                      jsr        (a2)
[0001d996] 4bf9 000a b022            lea.l      c_type,a5
[0001d99c] 6006                      bra.s      $0001D9A4
[0001d99e] 4bf9 000a af92            lea.l      p_type,a5
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
