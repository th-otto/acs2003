Apd_close:
[0003b7f0] 48e7 002c                 movem.l    a2/a4-a5,-(a7)
[0003b7f4] 554f                      subq.w     #2,a7
[0003b7f6] 95ca                      suba.l     a2,a2
[0003b7f8] 4bf9 0010 ee4e            lea.l      ACSblk,a5
[0003b7fe] 42a7                      clr.l      -(a7)
[0003b800] 42a7                      clr.l      -(a7)
[0003b802] 42a7                      clr.l      -(a7)
[0003b804] 486f 000c                 pea.l      12(a7)
[0003b808] 720a                      moveq.l    #10,d1
[0003b80a] 4240                      clr.w      d0
[0003b80c] 4eb9 0007 f7ba            jsr        wind_get
[0003b812] 4fef 0010                 lea.l      16(a7),a7
[0003b816] 3017                      move.w     (a7),d0
[0003b818] 4eb9 0005 5e68            jsr        Awi_wid
[0003b81e] 2848                      movea.l    a0,a4
[0003b820] 4eb9 0005 5e8c            jsr        Awi_root
[0003b826] b9c8                      cmpa.l     a0,a4
[0003b828] 6608                      bne.s      $0003B832
[0003b82a] 2055                      movea.l    (a5),a0
[0003b82c] 3028 0236                 move.w     566(a0),d0
[0003b830] 6652                      bne.s      $0003B884
[0003b832] 200c                      move.l     a4,d0
[0003b834] 674e                      beq.s      $0003B884
[0003b836] 7204                      moveq.l    #4,d1
[0003b838] c26c 0054                 and.w      84(a4),d1
[0003b83c] 671c                      beq.s      $0003B85A
[0003b83e] 7402                      moveq.l    #2,d2
[0003b840] c46c 0022                 and.w      34(a4),d2
[0003b844] 6614                      bne.s      $0003B85A
[0003b846] 200a                      move.l     a2,d0
[0003b848] 6604                      bne.s      $0003B84E
[0003b84a] 244c                      movea.l    a4,a2
[0003b84c] 6004                      bra.s      $0003B852
[0003b84e] b9ca                      cmpa.l     a2,a4
[0003b850] 6732                      beq.s      $0003B884
[0003b852] 4eb9 0005 6b70            jsr        Awi_down
[0003b858] 609e                      bra.s      $0003B7F8
[0003b85a] 7001                      moveq.l    #1,d0
[0003b85c] c06c 0054                 and.w      84(a4),d0
[0003b860] 660c                      bne.s      $0003B86E
[0003b862] 2055                      movea.l    (a5),a0
[0003b864] 2268 023c                 movea.l    572(a0),a1
[0003b868] 2229 0034                 move.l     52(a1),d1
[0003b86c] 670a                      beq.s      $0003B878
[0003b86e] 204c                      movea.l    a4,a0
[0003b870] 226c 0072                 movea.l    114(a4),a1
[0003b874] 4e91                      jsr        (a1)
[0003b876] 600c                      bra.s      $0003B884
[0003b878] 93c9                      suba.l     a1,a1
[0003b87a] 7002                      moveq.l    #2,d0
[0003b87c] 204c                      movea.l    a4,a0
[0003b87e] 246c 0004                 movea.l    4(a4),a2
[0003b882] 4e92                      jsr        (a2)
[0003b884] 544f                      addq.w     #2,a7
[0003b886] 4cdf 3400                 movem.l    (a7)+,a2/a4-a5
[0003b88a] 4e75                      rts
Apd_delete:
[0003b88c] 2f0a                      move.l     a2,-(a7)
[0003b88e] 2f0b                      move.l     a3,-(a7)
[0003b890] 554f                      subq.w     #2,a7
[0003b892] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003b898] 3028 0246                 move.w     582(a0),d0
[0003b89c] 663e                      bne.s      $0003B8DC
[0003b89e] 42a7                      clr.l      -(a7)
[0003b8a0] 42a7                      clr.l      -(a7)
[0003b8a2] 42a7                      clr.l      -(a7)
[0003b8a4] 486f 000c                 pea.l      12(a7)
[0003b8a8] 720a                      moveq.l    #10,d1
[0003b8aa] 4240                      clr.w      d0
[0003b8ac] 4eb9 0007 f7ba            jsr        wind_get
[0003b8b2] 4fef 0010                 lea.l      16(a7),a7
[0003b8b6] 3017                      move.w     (a7),d0
[0003b8b8] 4eb9 0005 5e68            jsr        Awi_wid
[0003b8be] 2448                      movea.l    a0,a2
[0003b8c0] 200a                      move.l     a2,d0
[0003b8c2] 6736                      beq.s      $0003B8FA
[0003b8c4] 4eb9 0005 5e8c            jsr        Awi_root
[0003b8ca] b5c8                      cmpa.l     a0,a2
[0003b8cc] 672c                      beq.s      $0003B8FA
[0003b8ce] 93c9                      suba.l     a1,a1
[0003b8d0] 7002                      moveq.l    #2,d0
[0003b8d2] 204a                      movea.l    a2,a0
[0003b8d4] 266a 0004                 movea.l    4(a2),a3
[0003b8d8] 4e93                      jsr        (a3)
[0003b8da] 601e                      bra.s      $0003B8FA
[0003b8dc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003b8e2] 2268 0258                 movea.l    600(a0),a1
[0003b8e6] 2468 0240                 movea.l    576(a0),a2
[0003b8ea] b3ca                      cmpa.l     a2,a1
[0003b8ec] 670c                      beq.s      $0003B8FA
[0003b8ee] 700b                      moveq.l    #11,d0
[0003b8f0] 266a 0004                 movea.l    4(a2),a3
[0003b8f4] 204a                      movea.l    a2,a0
[0003b8f6] 93c9                      suba.l     a1,a1
[0003b8f8] 4e93                      jsr        (a3)
[0003b8fa] 544f                      addq.w     #2,a7
[0003b8fc] 265f                      movea.l    (a7)+,a3
[0003b8fe] 245f                      movea.l    (a7)+,a2
[0003b900] 4e75                      rts
Apd_info:
[0003b902] 2f0a                      move.l     a2,-(a7)
[0003b904] 2f0b                      move.l     a3,-(a7)
[0003b906] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0003b90c] 2052                      movea.l    (a2),a0
[0003b90e] 3028 0246                 move.w     582(a0),d0
[0003b912] 6608                      bne.s      $0003B91C
[0003b914] 2068 029c                 movea.l    668(a0),a0
[0003b918] 4e90                      jsr        (a0)
[0003b91a] 601e                      bra.s      $0003B93A
[0003b91c] 2052                      movea.l    (a2),a0
[0003b91e] 2268 0258                 movea.l    600(a0),a1
[0003b922] 2668 0240                 movea.l    576(a0),a3
[0003b926] b3cb                      cmpa.l     a3,a1
[0003b928] 6710                      beq.s      $0003B93A
[0003b92a] b7c9                      cmpa.l     a1,a3
[0003b92c] 670c                      beq.s      $0003B93A
[0003b92e] 700f                      moveq.l    #15,d0
[0003b930] 246b 0004                 movea.l    4(a3),a2
[0003b934] 204b                      movea.l    a3,a0
[0003b936] 93c9                      suba.l     a1,a1
[0003b938] 4e92                      jsr        (a2)
[0003b93a] 265f                      movea.l    (a7)+,a3
[0003b93c] 245f                      movea.l    (a7)+,a2
[0003b93e] 4e75                      rts
Apd_list:
[0003b940] 2f0a                      move.l     a2,-(a7)
[0003b942] 2f0b                      move.l     a3,-(a7)
[0003b944] 554f                      subq.w     #2,a7
[0003b946] 42a7                      clr.l      -(a7)
[0003b948] 42a7                      clr.l      -(a7)
[0003b94a] 42a7                      clr.l      -(a7)
[0003b94c] 486f 000c                 pea.l      12(a7)
[0003b950] 720a                      moveq.l    #10,d1
[0003b952] 4240                      clr.w      d0
[0003b954] 4eb9 0007 f7ba            jsr        wind_get
[0003b95a] 4fef 0010                 lea.l      16(a7),a7
[0003b95e] 3017                      move.w     (a7),d0
[0003b960] 4eb9 0005 5e68            jsr        Awi_wid
[0003b966] 2448                      movea.l    a0,a2
[0003b968] 4eb9 0005 69d6            jsr        Awi_list
[0003b96e] 2648                      movea.l    a0,a3
[0003b970] b5c8                      cmpa.l     a0,a2
[0003b972] 6608                      bne.s      $0003B97C
[0003b974] 4eb9 0005 69d6            jsr        Awi_list
[0003b97a] 2648                      movea.l    a0,a3
[0003b97c] 200a                      move.l     a2,d0
[0003b97e] 6714                      beq.s      $0003B994
[0003b980] 6008                      bra.s      $0003B98A
[0003b982] 4eb9 0005 69d6            jsr        Awi_list
[0003b988] 2648                      movea.l    a0,a3
[0003b98a] b7ca                      cmpa.l     a2,a3
[0003b98c] 6706                      beq.s      $0003B994
[0003b98e] 302b 0020                 move.w     32(a3),d0
[0003b992] 6fee                      ble.s      $0003B982
[0003b994] 200b                      move.l     a3,d0
[0003b996] 670e                      beq.s      $0003B9A6
[0003b998] 322b 0020                 move.w     32(a3),d1
[0003b99c] 6f08                      ble.s      $0003B9A6
[0003b99e] 204b                      movea.l    a3,a0
[0003b9a0] 4eb9 0005 6bea            jsr        Awi_show
[0003b9a6] 544f                      addq.w     #2,a7
[0003b9a8] 265f                      movea.l    (a7)+,a3
[0003b9aa] 245f                      movea.l    (a7)+,a2
[0003b9ac] 4e75                      rts
Apd_module:
[0003b9ae] 2039 000c f38e            move.l     module_window,d0
[0003b9b4] 6708                      beq.s      $0003B9BE
[0003b9b6] 2040                      movea.l    d0,a0
[0003b9b8] 4eb9 0005 6bea            jsr        Awi_show
[0003b9be] 4e75                      rts
Apd_new:
[0003b9c0] 91c8                      suba.l     a0,a0
[0003b9c2] 4eb9 0003 bc2e            jsr        new_call
[0003b9c8] 4e75                      rts
Apd_open:
[0003b9ca] 2f0a                      move.l     a2,-(a7)
[0003b9cc] 2f0b                      move.l     a3,-(a7)
[0003b9ce] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003b9d4] 3028 0246                 move.w     582(a0),d0
[0003b9d8] 6e0a                      bgt.s      $0003B9E4
[0003b9da] 91c8                      suba.l     a0,a0
[0003b9dc] 4eb9 0003 bc2e            jsr        new_call
[0003b9e2] 601c                      bra.s      $0003BA00
[0003b9e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003b9ea] 2468 0240                 movea.l    576(a0),a2
[0003b9ee] b5e8 0258                 cmpa.l     600(a0),a2
[0003b9f2] 670c                      beq.s      $0003BA00
[0003b9f4] 93c9                      suba.l     a1,a1
[0003b9f6] 700a                      moveq.l    #10,d0
[0003b9f8] 266a 0004                 movea.l    4(a2),a3
[0003b9fc] 204a                      movea.l    a2,a0
[0003b9fe] 4e93                      jsr        (a3)
[0003ba00] 265f                      movea.l    (a7)+,a3
[0003ba02] 245f                      movea.l    (a7)+,a2
[0003ba04] 4e75                      rts
Apd_quit:
[0003ba06] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003ba0c] 2068 02a0                 movea.l    672(a0),a0
[0003ba10] 4e90                      jsr        (a0)
[0003ba12] 4e75                      rts
open_one_file:
[0003ba14] 2f0a                      move.l     a2,-(a7)
[0003ba16] 2f0b                      move.l     a3,-(a7)
[0003ba18] 4fef ff00                 lea.l      -256(a7),a7
[0003ba1c] 2448                      movea.l    a0,a2
[0003ba1e] 2649                      movea.l    a1,a3
[0003ba20] 43f9 000d 033e            lea.l      $000D033E,a1
[0003ba26] 41d7                      lea.l      (a7),a0
[0003ba28] 303c 00ff                 move.w     #$00FF,d0
[0003ba2c] 10d9                      move.b     (a1)+,(a0)+
[0003ba2e] 51c8 fffc                 dbf        d0,$0003BA2C
[0003ba32] 200a                      move.l     a2,d0
[0003ba34] 672c                      beq.s      $0003BA62
[0003ba36] 222a 0114                 move.l     276(a2),d1
[0003ba3a] 6726                      beq.s      $0003BA62
[0003ba3c] 204b                      movea.l    a3,a0
[0003ba3e] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0003ba44] 4a40                      tst.w      d0
[0003ba46] 660a                      bne.s      $0003BA52
[0003ba48] 224b                      movea.l    a3,a1
[0003ba4a] 41d7                      lea.l      (a7),a0
[0003ba4c] 4eb9 0004 c2a8            jsr        Af_unquote
[0003ba52] 200b                      move.l     a3,d0
[0003ba54] 6704                      beq.s      $0003BA5A
[0003ba56] 41d7                      lea.l      (a7),a0
[0003ba58] 6002                      bra.s      $0003BA5C
[0003ba5a] 91c8                      suba.l     a0,a0
[0003ba5c] 226a 0114                 movea.l    276(a2),a1
[0003ba60] 4e91                      jsr        (a1)
[0003ba62] 4fef 0100                 lea.l      256(a7),a7
[0003ba66] 265f                      movea.l    (a7)+,a3
[0003ba68] 245f                      movea.l    (a7)+,a2
[0003ba6a] 4e75                      rts
open_files:
[0003ba6c] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003ba70] 2448                      movea.l    a0,a2
[0003ba72] 2849                      movea.l    a1,a4
[0003ba74] 200a                      move.l     a2,d0
[0003ba76] 674e                      beq.s      $0003BAC6
[0003ba78] 222a 0114                 move.l     276(a2),d1
[0003ba7c] 6748                      beq.s      $0003BAC6
[0003ba7e] 97cb                      suba.l     a3,a3
[0003ba80] 2049                      movea.l    a1,a0
[0003ba82] 4eb9 0004 c366            jsr        Af_parseCmdLine
[0003ba88] 2648                      movea.l    a0,a3
[0003ba8a] 200b                      move.l     a3,d0
[0003ba8c] 6730                      beq.s      $0003BABE
[0003ba8e] 226b 0038                 movea.l    56(a3),a1
[0003ba92] 4e91                      jsr        (a1)
[0003ba94] 4a80                      tst.l      d0
[0003ba96] 6f14                      ble.s      $0003BAAC
[0003ba98] 487a ff7a                 pea.l      open_one_file(pc)
[0003ba9c] 42a7                      clr.l      -(a7)
[0003ba9e] 224a                      movea.l    a2,a1
[0003baa0] 204b                      movea.l    a3,a0
[0003baa2] 286b 0040                 movea.l    64(a3),a4
[0003baa6] 4e94                      jsr        (a4)
[0003baa8] 504f                      addq.w     #8,a7
[0003baaa] 6008                      bra.s      $0003BAB4
[0003baac] 93c9                      suba.l     a1,a1
[0003baae] 204a                      movea.l    a2,a0
[0003bab0] 6100 ff62                 bsr        open_one_file
[0003bab4] 204b                      movea.l    a3,a0
[0003bab6] 4eb9 0007 0c5e            jsr        Alu_delete
[0003babc] 6008                      bra.s      $0003BAC6
[0003babe] 93c9                      suba.l     a1,a1
[0003bac0] 204a                      movea.l    a2,a0
[0003bac2] 6100 ff50                 bsr        open_one_file
[0003bac6] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003baca] 4e75                      rts
OpenDraggedFiles:
[0003bacc] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003bad0] 2a48                      movea.l    a0,a5
[0003bad2] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003bad8] 2469 0240                 movea.l    576(a1),a2
[0003badc] 0c69 0001 0246            cmpi.w     #$0001,582(a1)
[0003bae2] 6d00 0090                 blt        $0003BB74
[0003bae6] 4eb9 0004 7e1e            jsr        Adr_start
[0003baec] 6000 0078                 bra.w      $0003BB66
[0003baf0] 3003                      move.w     d3,d0
[0003baf2] c07c 1000                 and.w      #$1000,d0
[0003baf6] 6720                      beq.s      $0003BB18
[0003baf8] 222a 0018                 move.l     24(a2),d1
[0003bafc] 6716                      beq.s      $0003BB14
[0003bafe] 3003                      move.w     d3,d0
[0003bb00] c07c 0fff                 and.w      #$0FFF,d0
[0003bb04] 48c0                      ext.l      d0
[0003bb06] 2400                      move.l     d0,d2
[0003bb08] d482                      add.l      d2,d2
[0003bb0a] d480                      add.l      d0,d2
[0003bb0c] e78a                      lsl.l      #3,d2
[0003bb0e] 2641                      movea.l    d1,a3
[0003bb10] d7c2                      adda.l     d2,a3
[0003bb12] 6002                      bra.s      $0003BB16
[0003bb14] 97cb                      suba.l     a3,a3
[0003bb16] 601a                      bra.s      $0003BB32
[0003bb18] 202a 0014                 move.l     20(a2),d0
[0003bb1c] 6712                      beq.s      $0003BB30
[0003bb1e] 3403                      move.w     d3,d2
[0003bb20] 48c2                      ext.l      d2
[0003bb22] 2202                      move.l     d2,d1
[0003bb24] d281                      add.l      d1,d1
[0003bb26] d282                      add.l      d2,d1
[0003bb28] e789                      lsl.l      #3,d1
[0003bb2a] 2640                      movea.l    d0,a3
[0003bb2c] d7c1                      adda.l     d1,a3
[0003bb2e] 6002                      bra.s      $0003BB32
[0003bb30] 97cb                      suba.l     a3,a3
[0003bb32] 200b                      move.l     a3,d0
[0003bb34] 6718                      beq.s      $0003BB4E
[0003bb36] 7220                      moveq.l    #32,d1
[0003bb38] c26b 0008                 and.w      8(a3),d1
[0003bb3c] 6610                      bne.s      $0003BB4E
[0003bb3e] 342b 0020                 move.w     32(a3),d2
[0003bb42] c47c 8000                 and.w      #$8000,d2
[0003bb46] 6706                      beq.s      $0003BB4E
[0003bb48] 49eb 0018                 lea.l      24(a3),a4
[0003bb4c] 6002                      bra.s      $0003BB50
[0003bb4e] 99cc                      suba.l     a4,a4
[0003bb50] 200c                      move.l     a4,d0
[0003bb52] 6712                      beq.s      $0003BB66
[0003bb54] 0c6c 0014 0016            cmpi.w     #$0014,22(a4)
[0003bb5a] 660a                      bne.s      $0003BB66
[0003bb5c] 226c 000c                 movea.l    12(a4),a1
[0003bb60] 204d                      movea.l    a5,a0
[0003bb62] 6100 ff08                 bsr        open_files
[0003bb66] 4eb9 0004 7e2a            jsr        Adr_next
[0003bb6c] 3600                      move.w     d0,d3
[0003bb6e] 5240                      addq.w     #1,d0
[0003bb70] 6600 ff7e                 bne        $0003BAF0
[0003bb74] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0003bb78] 4e75                      rts
CheckDraggedFiles:
[0003bb7a] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003bb7e] 2648                      movea.l    a0,a3
[0003bb80] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003bb86] 2469 0240                 movea.l    576(a1),a2
[0003bb8a] 0c69 0001 0246            cmpi.w     #$0001,582(a1)
[0003bb90] 6c08                      bge.s      $0003BB9A
[0003bb92] 4250                      clr.w      (a0)
[0003bb94] 4240                      clr.w      d0
[0003bb96] 6000 0090                 bra        $0003BC28
[0003bb9a] 4eb9 0004 7e1e            jsr        Adr_start
[0003bba0] 6000 0074                 bra.w      $0003BC16
[0003bba4] 3003                      move.w     d3,d0
[0003bba6] c07c 1000                 and.w      #$1000,d0
[0003bbaa] 6720                      beq.s      $0003BBCC
[0003bbac] 222a 0018                 move.l     24(a2),d1
[0003bbb0] 6716                      beq.s      $0003BBC8
[0003bbb2] 3003                      move.w     d3,d0
[0003bbb4] c07c 0fff                 and.w      #$0FFF,d0
[0003bbb8] 48c0                      ext.l      d0
[0003bbba] 2400                      move.l     d0,d2
[0003bbbc] d482                      add.l      d2,d2
[0003bbbe] d480                      add.l      d0,d2
[0003bbc0] e78a                      lsl.l      #3,d2
[0003bbc2] 2841                      movea.l    d1,a4
[0003bbc4] d9c2                      adda.l     d2,a4
[0003bbc6] 6002                      bra.s      $0003BBCA
[0003bbc8] 99cc                      suba.l     a4,a4
[0003bbca] 601a                      bra.s      $0003BBE6
[0003bbcc] 202a 0014                 move.l     20(a2),d0
[0003bbd0] 6712                      beq.s      $0003BBE4
[0003bbd2] 3403                      move.w     d3,d2
[0003bbd4] 48c2                      ext.l      d2
[0003bbd6] 2202                      move.l     d2,d1
[0003bbd8] d281                      add.l      d1,d1
[0003bbda] d282                      add.l      d2,d1
[0003bbdc] e789                      lsl.l      #3,d1
[0003bbde] 2840                      movea.l    d0,a4
[0003bbe0] d9c1                      adda.l     d1,a4
[0003bbe2] 6002                      bra.s      $0003BBE6
[0003bbe4] 99cc                      suba.l     a4,a4
[0003bbe6] 200c                      move.l     a4,d0
[0003bbe8] 6718                      beq.s      $0003BC02
[0003bbea] 7220                      moveq.l    #32,d1
[0003bbec] c26c 0008                 and.w      8(a4),d1
[0003bbf0] 6610                      bne.s      $0003BC02
[0003bbf2] 342c 0020                 move.w     32(a4),d2
[0003bbf6] c47c 8000                 and.w      #$8000,d2
[0003bbfa] 6706                      beq.s      $0003BC02
[0003bbfc] 4bec 0018                 lea.l      24(a4),a5
[0003bc00] 6002                      bra.s      $0003BC04
[0003bc02] 9bcd                      suba.l     a5,a5
[0003bc04] 200d                      move.l     a5,d0
[0003bc06] 670e                      beq.s      $0003BC16
[0003bc08] 0c6d 0014 0016            cmpi.w     #$0014,22(a5)
[0003bc0e] 6606                      bne.s      $0003BC16
[0003bc10] 36bc 0001                 move.w     #$0001,(a3)
[0003bc14] 6010                      bra.s      $0003BC26
[0003bc16] 4eb9 0004 7e2a            jsr        Adr_next
[0003bc1c] 3600                      move.w     d0,d3
[0003bc1e] 5240                      addq.w     #1,d0
[0003bc20] 6600 ff82                 bne.w      $0003BBA4
[0003bc24] 4253                      clr.w      (a3)
[0003bc26] 7001                      moveq.l    #1,d0
[0003bc28] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0003bc2c] 4e75                      rts
new_call:
[0003bc2e] 2f0a                      move.l     a2,-(a7)
[0003bc30] 2f0b                      move.l     a3,-(a7)
[0003bc32] 2648                      movea.l    a0,a3
[0003bc34] 2039 000c f38e            move.l     module_window,d0
[0003bc3a] 670c                      beq.s      $0003BC48
[0003bc3c] 2240                      movea.l    d0,a1
[0003bc3e] 2451                      movea.l    (a1),a2
[0003bc40] 204a                      movea.l    a2,a0
[0003bc42] 224b                      movea.l    a3,a1
[0003bc44] 6100 fe26                 bsr        open_files
[0003bc48] 265f                      movea.l    (a7)+,a3
[0003bc4a] 245f                      movea.l    (a7)+,a2
[0003bc4c] 4e75                      rts
build_work:
[0003bc4e] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[0003bc52] 5d4f                      subq.w     #6,a7
[0003bc54] 426f 0004                 clr.w      4(a7)
[0003bc58] 203c 0000 3018            move.l     #$00003018,d0
[0003bc5e] 4eb9 0004 c608            jsr        Ax_malloc
[0003bc64] 2648                      movea.l    a0,a3
[0003bc66] 284b                      movea.l    a3,a4
[0003bc68] 200c                      move.l     a4,d0
[0003bc6a] 6700 009a                 beq        $0003BD06
[0003bc6e] 45f9 000d 00c2            lea.l      PUR_ICONS,a2
[0003bc74] 7018                      moveq.l    #24,d0
[0003bc76] 224a                      movea.l    a2,a1
[0003bc78] 204c                      movea.l    a4,a0
[0003bc7a] 4eb9 0008 3500            jsr        memcpy
[0003bc80] 4bea 0018                 lea.l      24(a2),a5
[0003bc84] 49ec 0018                 lea.l      24(a4),a4
[0003bc88] 4243                      clr.w      d3
[0003bc8a] 6000 00aa                 bra        $0003BD36
[0003bc8e] 7018                      moveq.l    #24,d0
[0003bc90] 224d                      movea.l    a5,a1
[0003bc92] 204c                      movea.l    a4,a0
[0003bc94] 4eb9 0008 3500            jsr        memcpy
[0003bc9a] 7018                      moveq.l    #24,d0
[0003bc9c] 43ed 0018                 lea.l      24(a5),a1
[0003bca0] 41ec 0018                 lea.l      24(a4),a0
[0003bca4] 4eb9 0008 3500            jsr        memcpy
[0003bcaa] 102c 0007                 move.b     7(a4),d0
[0003bcae] 4880                      ext.w      d0
[0003bcb0] 907c 0018                 sub.w      #$0018,d0
[0003bcb4] 670a                      beq.s      $0003BCC0
[0003bcb6] 5f40                      subq.w     #7,d0
[0003bcb8] 6738                      beq.s      $0003BCF2
[0003bcba] 5540                      subq.w     #2,d0
[0003bcbc] 6734                      beq.s      $0003BCF2
[0003bcbe] 6042                      bra.s      $0003BD02
[0003bcc0] 206c 000c                 movea.l    12(a4),a0
[0003bcc4] 4eb9 0004 fb5e            jsr        Aus_create
[0003bcca] 2448                      movea.l    a0,a2
[0003bccc] 2e88                      move.l     a0,(a7)
[0003bcce] 2948 000c                 move.l     a0,12(a4)
[0003bcd2] 200a                      move.l     a2,d0
[0003bcd4] 672c                      beq.s      $0003BD02
[0003bcd6] 222a 0008                 move.l     8(a2),d1
[0003bcda] 6726                      beq.s      $0003BD02
[0003bcdc] 43ef 0004                 lea.l      4(a7),a1
[0003bce0] 2c41                      movea.l    d1,a6
[0003bce2] 204c                      movea.l    a4,a0
[0003bce4] 7001                      moveq.l    #1,d0
[0003bce6] 4e96                      jsr        (a6)
[0003bce8] 0c6f ffff 0004            cmpi.w     #$FFFF,4(a7)
[0003bcee] 6716                      beq.s      $0003BD06
[0003bcf0] 6010                      bra.s      $0003BD02
[0003bcf2] 206c 000c                 movea.l    12(a4),a0
[0003bcf6] 4eb9 0004 f606            jsr        Aic_create
[0003bcfc] 2e88                      move.l     a0,(a7)
[0003bcfe] 2948 000c                 move.l     a0,12(a4)
[0003bd02] 2017                      move.l     (a7),d0
[0003bd04] 6606                      bne.s      $0003BD0C
[0003bd06] 91c8                      suba.l     a0,a0
[0003bd08] 6000 007e                 bra.w      $0003BD88
[0003bd0c] 006c 0080 0008            ori.w      #$0080,8(a4)
[0003bd12] 026c ffdf 0008            andi.w     #$FFDF,8(a4)
[0003bd18] 026c ffdf 0020            andi.w     #$FFDF,32(a4)
[0003bd1e] 70ff                      moveq.l    #-1,d0
[0003bd20] 3940 0004                 move.w     d0,4(a4)
[0003bd24] 3940 0002                 move.w     d0,2(a4)
[0003bd28] 3203                      move.w     d3,d1
[0003bd2a] d241                      add.w      d1,d1
[0003bd2c] 5641                      addq.w     #3,d1
[0003bd2e] 3881                      move.w     d1,(a4)
[0003bd30] 49ec 0030                 lea.l      48(a4),a4
[0003bd34] 5243                      addq.w     #1,d3
[0003bd36] b67c 0100                 cmp.w      #$0100,d3
[0003bd3a] 6d00 ff52                 blt        $0003BC8E
[0003bd3e] 49ec ffd0                 lea.l      -48(a4),a4
[0003bd42] 006c 0020 0020            ori.w      #$0020,32(a4)
[0003bd48] 4254                      clr.w      (a4)
[0003bd4a] 36bc ffff                 move.w     #$FFFF,(a3)
[0003bd4e] 377c 0001 0002            move.w     #$0001,2(a3)
[0003bd54] 377c 01ff 0004            move.w     #$01FF,4(a3)
[0003bd5a] 376c 0016 0016            move.w     22(a4),22(a3)
[0003bd60] 0c6d 000c 0014            cmpi.w     #$000C,20(a5)
[0003bd66] 6c04                      bge.s      $0003BD6C
[0003bd68] 700c                      moveq.l    #12,d0
[0003bd6a] 6004                      bra.s      $0003BD70
[0003bd6c] 302d 0014                 move.w     20(a5),d0
[0003bd70] 3740 0014                 move.w     d0,20(a3)
[0003bd74] 7201                      moveq.l    #1,d1
[0003bd76] 3741 002a                 move.w     d1,42(a3)
[0003bd7a] 3741 0028                 move.w     d1,40(a3)
[0003bd7e] 204b                      movea.l    a3,a0
[0003bd80] 4eb9 0004 fbdc            jsr        Aob_fix
[0003bd86] 204b                      movea.l    a3,a0
[0003bd88] 5c4f                      addq.w     #6,a7
[0003bd8a] 4cdf 7c08                 movem.l    (a7)+,d3/a2-a6
[0003bd8e] 4e75                      rts
click_modwin:
[0003bd90] 2f0a                      move.l     a2,-(a7)
[0003bd92] 2f0b                      move.l     a3,-(a7)
[0003bd94] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0003bd9a] 2052                      movea.l    (a2),a0
[0003bd9c] 3228 0260                 move.w     608(a0),d1
[0003bda0] 48c1                      ext.l      d1
[0003bda2] 2001                      move.l     d1,d0
[0003bda4] d080                      add.l      d0,d0
[0003bda6] d081                      add.l      d1,d0
[0003bda8] e788                      lsl.l      #3,d0
[0003bdaa] 2068 025c                 movea.l    604(a0),a0
[0003bdae] 41f0 0818                 lea.l      24(a0,d0.l),a0
[0003bdb2] 2668 000c                 movea.l    12(a0),a3
[0003bdb6] 240b                      move.l     a3,d2
[0003bdb8] 6700 00ae                 beq        $0003BE68
[0003bdbc] 342b 0020                 move.w     32(a3),d2
[0003bdc0] 6f00 007c                 ble.w      $0003BE3E
[0003bdc4] 2252                      movea.l    (a2),a1
[0003bdc6] 2069 025c                 movea.l    604(a1),a0
[0003bdca] 3230 080a                 move.w     10(a0,d0.l),d1
[0003bdce] c27c 4000                 and.w      #$4000,d1
[0003bdd2] 676a                      beq.s      $0003BE3E
[0003bdd4] 3429 0008                 move.w     8(a1),d2
[0003bdd8] 3029 000c                 move.w     12(a1),d0
[0003bddc] e240                      asr.w      #1,d0
[0003bdde] d069 0008                 add.w      8(a1),d0
[0003bde2] 322b 0028                 move.w     40(a3),d1
[0003bde6] e241                      asr.w      #1,d1
[0003bde8] 9041                      sub.w      d1,d0
[0003bdea] b440                      cmp.w      d0,d2
[0003bdec] 6f02                      ble.s      $0003BDF0
[0003bdee] 6014                      bra.s      $0003BE04
[0003bdf0] 2052                      movea.l    (a2),a0
[0003bdf2] 3428 000c                 move.w     12(a0),d2
[0003bdf6] e242                      asr.w      #1,d2
[0003bdf8] d468 0008                 add.w      8(a0),d2
[0003bdfc] 302b 0028                 move.w     40(a3),d0
[0003be00] e240                      asr.w      #1,d0
[0003be02] 9440                      sub.w      d0,d2
[0003be04] 3742 0024                 move.w     d2,36(a3)
[0003be08] 2052                      movea.l    (a2),a0
[0003be0a] 3028 000a                 move.w     10(a0),d0
[0003be0e] 3228 000e                 move.w     14(a0),d1
[0003be12] e241                      asr.w      #1,d1
[0003be14] d268 000a                 add.w      10(a0),d1
[0003be18] 342b 002a                 move.w     42(a3),d2
[0003be1c] e242                      asr.w      #1,d2
[0003be1e] 9242                      sub.w      d2,d1
[0003be20] b041                      cmp.w      d1,d0
[0003be22] 6f02                      ble.s      $0003BE26
[0003be24] 6014                      bra.s      $0003BE3A
[0003be26] 2052                      movea.l    (a2),a0
[0003be28] 3028 000e                 move.w     14(a0),d0
[0003be2c] e240                      asr.w      #1,d0
[0003be2e] d068 000a                 add.w      10(a0),d0
[0003be32] 322b 002a                 move.w     42(a3),d1
[0003be36] e241                      asr.w      #1,d1
[0003be38] 9041                      sub.w      d1,d0
[0003be3a] 3740 0026                 move.w     d0,38(a3)
[0003be3e] 302b 0020                 move.w     32(a3),d0
[0003be42] 6f1c                      ble.s      $0003BE60
[0003be44] 006b 0010 0056            ori.w      #$0010,86(a3)
[0003be4a] 43eb 0024                 lea.l      36(a3),a1
[0003be4e] 204b                      movea.l    a3,a0
[0003be50] 246b 0086                 movea.l    134(a3),a2
[0003be54] 4e92                      jsr        (a2)
[0003be56] 204b                      movea.l    a3,a0
[0003be58] 226b 006e                 movea.l    110(a3),a1
[0003be5c] 4e91                      jsr        (a1)
[0003be5e] 6008                      bra.s      $0003BE68
[0003be60] 204b                      movea.l    a3,a0
[0003be62] 4eb9 0005 6bea            jsr        Awi_show
[0003be68] 265f                      movea.l    (a7)+,a3
[0003be6a] 245f                      movea.l    (a7)+,a2
[0003be6c] 4e75                      rts
drag_modwin:
[0003be6e] 2f0a                      move.l     a2,-(a7)
[0003be70] 2f0b                      move.l     a3,-(a7)
[0003be72] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003be78] 3228 0260                 move.w     608(a0),d1
[0003be7c] 48c1                      ext.l      d1
[0003be7e] 2001                      move.l     d1,d0
[0003be80] d080                      add.l      d0,d0
[0003be82] d081                      add.l      d1,d0
[0003be84] e788                      lsl.l      #3,d0
[0003be86] 2068 025c                 movea.l    604(a0),a0
[0003be8a] 41f0 0818                 lea.l      24(a0,d0.l),a0
[0003be8e] 2468 000c                 movea.l    12(a0),a2
[0003be92] 240a                      move.l     a2,d2
[0003be94] 670c                      beq.s      $0003BEA2
[0003be96] 93c9                      suba.l     a1,a1
[0003be98] 266a 0004                 movea.l    4(a2),a3
[0003be9c] 204a                      movea.l    a2,a0
[0003be9e] 7010                      moveq.l    #16,d0
[0003bea0] 4e93                      jsr        (a3)
[0003bea2] 265f                      movea.l    (a7)+,a3
[0003bea4] 245f                      movea.l    (a7)+,a2
[0003bea6] 4e75                      rts
mod_deldrag:
[0003bea8] 2f0a                      move.l     a2,-(a7)
[0003beaa] 93c9                      suba.l     a1,a1
[0003beac] 700b                      moveq.l    #11,d0
[0003beae] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003beb4] 2068 0240                 movea.l    576(a0),a0
[0003beb8] 2479 0010 ee4e            movea.l    ACSblk,a2
[0003bebe] 246a 0240                 movea.l    576(a2),a2
[0003bec2] 246a 0004                 movea.l    4(a2),a2
[0003bec6] 4e92                      jsr        (a2)
[0003bec8] 245f                      movea.l    (a7)+,a2
[0003beca] 4e75                      rts
mod_delete:
[0003becc] 2f0a                      move.l     a2,-(a7)
[0003bece] 93c9                      suba.l     a1,a1
[0003bed0] 700b                      moveq.l    #11,d0
[0003bed2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003bed8] 2068 0258                 movea.l    600(a0),a0
[0003bedc] 2479 0010 ee4e            movea.l    ACSblk,a2
[0003bee2] 246a 0258                 movea.l    600(a2),a2
[0003bee6] 246a 0004                 movea.l    4(a2),a2
[0003beea] 4e92                      jsr        (a2)
[0003beec] 245f                      movea.l    (a7)+,a2
[0003beee] 4e75                      rts
mod_info:
[0003bef0] 2f0a                      move.l     a2,-(a7)
[0003bef2] 93c9                      suba.l     a1,a1
[0003bef4] 700f                      moveq.l    #15,d0
[0003bef6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003befc] 2068 0258                 movea.l    600(a0),a0
[0003bf00] 2479 0010 ee4e            movea.l    ACSblk,a2
[0003bf06] 246a 0258                 movea.l    600(a2),a2
[0003bf0a] 246a 0004                 movea.l    4(a2),a2
[0003bf0e] 4e92                      jsr        (a2)
[0003bf10] 245f                      movea.l    (a7)+,a2
[0003bf12] 4e75                      rts
mod_infodrag:
[0003bf14] 2f0a                      move.l     a2,-(a7)
[0003bf16] 93c9                      suba.l     a1,a1
[0003bf18] 700f                      moveq.l    #15,d0
[0003bf1a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003bf20] 2068 0240                 movea.l    576(a0),a0
[0003bf24] 2479 0010 ee4e            movea.l    ACSblk,a2
[0003bf2a] 246a 0240                 movea.l    576(a2),a2
[0003bf2e] 246a 0004                 movea.l    4(a2),a2
[0003bf32] 4e92                      jsr        (a2)
[0003bf34] 245f                      movea.l    (a7)+,a2
[0003bf36] 4e75                      rts
load_mod:
[0003bf38] 2f0a                      move.l     a2,-(a7)
[0003bf3a] 2f0b                      move.l     a3,-(a7)
[0003bf3c] 2648                      movea.l    a0,a3
[0003bf3e] 2449                      movea.l    a1,a2
[0003bf40] 2049                      movea.l    a1,a0
[0003bf42] 4eb9 0007 1408            jsr        Ash_module
[0003bf48] 224a                      movea.l    a2,a1
[0003bf4a] 41eb 0004                 lea.l      4(a3),a0
[0003bf4e] 4eb9 0008 2f0c            jsr        strcpy
[0003bf54] 265f                      movea.l    (a7)+,a3
[0003bf56] 245f                      movea.l    (a7)+,a2
[0003bf58] 4e75                      rts
mod_load:
[0003bf5a] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003bf5e] 4fef ff00                 lea.l      -256(a7),a7
[0003bf62] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003bf68] 2268 0258                 movea.l    600(a0),a1
[0003bf6c] 2451                      movea.l    (a1),a2
[0003bf6e] 43ea 0004                 lea.l      4(a2),a1
[0003bf72] 41d7                      lea.l      (a7),a0
[0003bf74] 4eb9 0008 2f0c            jsr        strcpy
[0003bf7a] 42a7                      clr.l      -(a7)
[0003bf7c] 4879 000d 045e            pea.l      $000D045E
[0003bf82] 7201                      moveq.l    #1,d1
[0003bf84] 4240                      clr.w      d0
[0003bf86] 43ef 0008                 lea.l      8(a7),a1
[0003bf8a] 41f9 000c f41b            lea.l      MODUL_LOAD_TITEL,a0
[0003bf90] 4eb9 0006 dc24            jsr        Af_fileselect
[0003bf96] 504f                      addq.w     #8,a7
[0003bf98] 2648                      movea.l    a0,a3
[0003bf9a] 200b                      move.l     a3,d0
[0003bf9c] 6718                      beq.s      $0003BFB6
[0003bf9e] 487a ff98                 pea.l      load_mod(pc)
[0003bfa2] 42a7                      clr.l      -(a7)
[0003bfa4] 224a                      movea.l    a2,a1
[0003bfa6] 286b 0040                 movea.l    64(a3),a4
[0003bfaa] 4e94                      jsr        (a4)
[0003bfac] 504f                      addq.w     #8,a7
[0003bfae] 204b                      movea.l    a3,a0
[0003bfb0] 4eb9 0007 0c5e            jsr        Alu_delete
[0003bfb6] 4fef 0100                 lea.l      256(a7),a7
[0003bfba] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003bfbe] 4e75                      rts
modul_close:
[0003bfc0] 2f0a                      move.l     a2,-(a7)
[0003bfc2] 2f0b                      move.l     a3,-(a7)
[0003bfc4] 2448                      movea.l    a0,a2
[0003bfc6] 006a 0100 0056            ori.w      #$0100,86(a2)
[0003bfcc] 2650                      movea.l    (a0),a3
[0003bfce] 7008                      moveq.l    #8,d0
[0003bfd0] 43ea 0024                 lea.l      36(a2),a1
[0003bfd4] 41eb 0106                 lea.l      262(a3),a0
[0003bfd8] 4eb9 0008 3500            jsr        memcpy
[0003bfde] 204a                      movea.l    a2,a0
[0003bfe0] 4eb9 0005 8362            jsr        Awi_closed
[0003bfe6] 026a feff 0056            andi.w     #$FEFF,86(a2)
[0003bfec] 265f                      movea.l    (a7)+,a3
[0003bfee] 245f                      movea.l    (a7)+,a2
[0003bff0] 4e75                      rts
modul_make:
[0003bff2] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[0003bff6] 554f                      subq.w     #2,a7
[0003bff8] 7600                      moveq.l    #0,d3
[0003bffa] 203c 0000 0118            move.l     #$00000118,d0
[0003c000] 4eb9 0004 c608            jsr        Ax_malloc
[0003c006] 2448                      movea.l    a0,a2
[0003c008] 4df9 0010 ee4e            lea.l      ACSblk,a6
[0003c00e] 200a                      move.l     a2,d0
[0003c010] 6700 0174                 beq        $0003C186
[0003c014] 223c 0000 0118            move.l     #$00000118,d1
[0003c01a] 204a                      movea.l    a2,a0
[0003c01c] 4240                      clr.w      d0
[0003c01e] 4eb9 0008 36ea            jsr        memset
[0003c024] 47f9 000d 045e            lea.l      $000D045E,a3
[0003c02a] 41eb 0008                 lea.l      8(a3),a0
[0003c02e] 4eb9 0004 b496            jsr        Af_cfgfile
[0003c034] 4240                      clr.w      d0
[0003c036] 4eb9 0008 0cc0            jsr        Fopen
[0003c03c] 2800                      move.l     d0,d4
[0003c03e] 4a80                      tst.l      d0
[0003c040] 6a14                      bpl.s      $0003C056
[0003c042] 41eb 000e                 lea.l      14(a3),a0
[0003c046] 4eb9 0004 b496            jsr        Af_cfgfile
[0003c04c] 4240                      clr.w      d0
[0003c04e] 4eb9 0008 0cc0            jsr        Fopen
[0003c054] 2800                      move.l     d0,d4
[0003c056] 4a84                      tst.l      d4
[0003c058] 6f1a                      ble.s      $0003C074
[0003c05a] 204a                      movea.l    a2,a0
[0003c05c] 223c 0000 0114            move.l     #$00000114,d1
[0003c062] 3004                      move.w     d4,d0
[0003c064] 4eb9 0008 0cd2            jsr        Fread
[0003c06a] 2600                      move.l     d0,d3
[0003c06c] 3004                      move.w     d4,d0
[0003c06e] 4eb9 0008 0c7e            jsr        Fclose
[0003c074] 49f9 000d 029c            lea.l      PUR_MODULE,a4
[0003c07a] 206c ffa8                 movea.l    -88(a4),a0
[0003c07e] b1fc 000c f431            cmpa.l     #NAME_PUR_DESK,a0
[0003c084] 6704                      beq.s      $0003C08A
[0003c086] 2948 004a                 move.l     a0,74(a4)
[0003c08a] 204c                      movea.l    a4,a0
[0003c08c] 4eb9 0005 7052            jsr        Awi_create
[0003c092] 2a48                      movea.l    a0,a5
[0003c094] 294d f0f2                 move.l     a5,-3854(a4)
[0003c098] 200d                      move.l     a5,d0
[0003c09a] 6700 00e2                 beq        $0003C17E
[0003c09e] 7204                      moveq.l    #4,d1
[0003c0a0] d283                      add.l      d3,d1
[0003c0a2] b2bc 0000 0118            cmp.l      #$00000118,d1
[0003c0a8] 660a                      bne.s      $0003C0B4
[0003c0aa] 0c92 5044 534b            cmpi.l     #$5044534B,(a2)
[0003c0b0] 6700 00a4                 beq        $0003C156
[0003c0b4] 223c 0000 0118            move.l     #$00000118,d1
[0003c0ba] 4240                      clr.w      d0
[0003c0bc] 204a                      movea.l    a2,a0
[0003c0be] 4eb9 0008 36ea            jsr        memset
[0003c0c4] 2056                      movea.l    (a6),a0
[0003c0c6] 2268 023c                 movea.l    572(a0),a1
[0003c0ca] 3569 000e 0112            move.w     14(a1),274(a2)
[0003c0d0] 2056                      movea.l    (a6),a0
[0003c0d2] 1028 02d6                 move.b     726(a0),d0
[0003c0d6] 6712                      beq.s      $0003C0EA
[0003c0d8] 2248                      movea.l    a0,a1
[0003c0da] 43e9 02d6                 lea.l      726(a1),a1
[0003c0de] 41ea 0004                 lea.l      4(a2),a0
[0003c0e2] 4eb9 0008 2f0c            jsr        strcpy
[0003c0e8] 600e                      bra.s      $0003C0F8
[0003c0ea] 43eb 0014                 lea.l      20(a3),a1
[0003c0ee] 41ea 0004                 lea.l      4(a2),a0
[0003c0f2] 4eb9 0008 2f0c            jsr        strcpy
[0003c0f8] 0c2a 0043 0004            cmpi.b     #$43,4(a2)
[0003c0fe] 6c22                      bge.s      $0003C122
[0003c100] 4eb9 0008 0bd2            jsr        Dgetdrv
[0003c106] 4eb9 0008 0c48            jsr        Dsetdrv
[0003c10c] c0bc 0000 0004            and.l      #$00000004,d0
[0003c112] 670e                      beq.s      $0003C122
[0003c114] 43eb 0018                 lea.l      24(a3),a1
[0003c118] 41ea 0004                 lea.l      4(a2),a0
[0003c11c] 4eb9 0008 2f0c            jsr        strcpy
[0003c122] 2056                      movea.l    (a6),a0
[0003c124] 3028 0008                 move.w     8(a0),d0
[0003c128] d068 0012                 add.w      18(a0),d0
[0003c12c] 3540 0106                 move.w     d0,262(a2)
[0003c130] 2056                      movea.l    (a6),a0
[0003c132] 3228 0008                 move.w     8(a0),d1
[0003c136] d268 0012                 add.w      18(a0),d1
[0003c13a] 3541 0106                 move.w     d1,262(a2)
[0003c13e] 2056                      movea.l    (a6),a0
[0003c140] 3028 000c                 move.w     12(a0),d0
[0003c144] e240                      asr.w      #1,d0
[0003c146] 3540 010a                 move.w     d0,266(a2)
[0003c14a] 2056                      movea.l    (a6),a0
[0003c14c] 3228 000e                 move.w     14(a0),d1
[0003c150] e241                      asr.w      #1,d1
[0003c152] 3541 010c                 move.w     d1,268(a2)
[0003c156] 24bc 5044 534b            move.l     #$5044534B,(a2)
[0003c15c] 426a 0104                 clr.w      260(a2)
[0003c160] 297c 000c f428 004a       move.l     #NAME_MODULE,74(a4)
[0003c168] 2a8a                      move.l     a2,(a5)
[0003c16a] 6100 fae2                 bsr        build_work
[0003c16e] 2b48 0014                 move.l     a0,20(a5)
[0003c172] 2008                      move.l     a0,d0
[0003c174] 6616                      bne.s      $0003C18C
[0003c176] 204d                      movea.l    a5,a0
[0003c178] 4eb9 0005 85f2            jsr        Awi_delete
[0003c17e] 204a                      movea.l    a2,a0
[0003c180] 4eb9 0004 c7c8            jsr        Ax_free
[0003c186] 91c8                      suba.l     a0,a0
[0003c188] 6000 009e                 bra        $0003C228
[0003c18c] 7008                      moveq.l    #8,d0
[0003c18e] 43ea 0106                 lea.l      262(a2),a1
[0003c192] 41ed 0024                 lea.l      36(a5),a0
[0003c196] 4eb9 0008 3500            jsr        memcpy
[0003c19c] 302d 0024                 move.w     36(a5),d0
[0003c1a0] 2056                      movea.l    (a6),a0
[0003c1a2] 3228 0008                 move.w     8(a0),d1
[0003c1a6] d268 000c                 add.w      12(a0),d1
[0003c1aa] b041                      cmp.w      d1,d0
[0003c1ac] 6f0c                      ble.s      $0003C1BA
[0003c1ae] 3428 0008                 move.w     8(a0),d2
[0003c1b2] d468 0012                 add.w      18(a0),d2
[0003c1b6] 3b42 0024                 move.w     d2,36(a5)
[0003c1ba] 302d 0026                 move.w     38(a5),d0
[0003c1be] 2056                      movea.l    (a6),a0
[0003c1c0] 3228 000a                 move.w     10(a0),d1
[0003c1c4] d268 000e                 add.w      14(a0),d1
[0003c1c8] b041                      cmp.w      d1,d0
[0003c1ca] 6f0c                      ble.s      $0003C1D8
[0003c1cc] 3428 000a                 move.w     10(a0),d2
[0003c1d0] d468 0014                 add.w      20(a0),d2
[0003c1d4] 3b42 0024                 move.w     d2,36(a5)
[0003c1d8] 2f39 000e 692a            move.l     _globl,-(a7)
[0003c1de] 206d 0014                 movea.l    20(a5),a0
[0003c1e2] 4868 0016                 pea.l      22(a0)
[0003c1e6] 4868 0014                 pea.l      20(a0)
[0003c1ea] 3f2d 002a                 move.w     42(a5),-(a7)
[0003c1ee] 3f2d 0028                 move.w     40(a5),-(a7)
[0003c1f2] 3f2d 0026                 move.w     38(a5),-(a7)
[0003c1f6] 43ef 0012                 lea.l      18(a7),a1
[0003c1fa] 41ef 0012                 lea.l      18(a7),a0
[0003c1fe] 342d 0024                 move.w     36(a5),d2
[0003c202] 322d 0022                 move.w     34(a5),d1
[0003c206] 7001                      moveq.l    #1,d0
[0003c208] 4eb9 0007 b8da            jsr        mt_wind_calc
[0003c20e] 4fef 0012                 lea.l      18(a7),a7
[0003c212] 202d 0018                 move.l     24(a5),d0
[0003c216] 670e                      beq.s      $0003C226
[0003c218] 2040                      movea.l    d0,a0
[0003c21a] 3228 0016                 move.w     22(a0),d1
[0003c21e] 226d 0014                 movea.l    20(a5),a1
[0003c222] 9369 0016                 sub.w      d1,22(a1)
[0003c226] 204d                      movea.l    a5,a0
[0003c228] 544f                      addq.w     #2,a7
[0003c22a] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[0003c22e] 4e75                      rts
modul_serv:
[0003c230] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[0003c234] 4fef fff2                 lea.l      -14(a7),a7
[0003c238] 2448                      movea.l    a0,a2
[0003c23a] 3600                      move.w     d0,d3
[0003c23c] 2f49 000a                 move.l     a1,10(a7)
[0003c240] 2f50 0006                 move.l     (a0),6(a7)
[0003c244] 47f9 0010 ee4e            lea.l      ACSblk,a3
[0003c24a] 3003                      move.w     d3,d0
[0003c24c] b07c 0030                 cmp.w      #$0030,d0
[0003c250] 6700 0300                 beq        $0003C552
[0003c254] 6e4a                      bgt.s      $0003C2A0
[0003c256] b07c 001b                 cmp.w      #$001B,d0
[0003c25a] 6200 0392                 bhi        $0003C5EE
[0003c25e] d040                      add.w      d0,d0
[0003c260] 303b 0006                 move.w     $0003C268(pc,d0.w),d0
[0003c264] 4efb 0002                 jmp        $0003C268(pc,d0.w)
J28:
[0003c268] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c26a] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c26c] 0062                      dc.w $0062   ; $0003c2ca-$0003c268
[0003c26e] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c270] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c272] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c274] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c276] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c278] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c27a] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c27c] 0176                      dc.w $0176   ; $0003c3de-$0003c268
[0003c27e] 0176                      dc.w $0176   ; $0003c3de-$0003c268
[0003c280] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c282] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c284] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c286] 0176                      dc.w $0176   ; $0003c3de-$0003c268
[0003c288] 013a                      dc.w $013a   ; $0003c3a2-$0003c268
[0003c28a] 0122                      dc.w $0122   ; $0003c38a-$0003c268
[0003c28c] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c28e] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c290] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c292] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c294] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c296] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c298] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c29a] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c29c] 0386                      dc.w $0386   ; $0003c5ee-$0003c268
[0003c29e] 0316                      dc.w $0316   ; $0003c57e-$0003c268
[0003c2a0] 907c                      dc.w $907c   ; $000352e4-$0003c268
[0003c2a2] 0064                      dc.w $0064   ; $0003c2cc-$0003c268
[0003c2a4] b07c                      dc.w $b07c   ; $000372e4-$0003c268
[0003c2a6] 0009                      dc.w $0009   ; $0003c271-$0003c268
[0003c2a8] 6200 0344                 bhi        $0003C5EE
[0003c2ac] d040                      add.w      d0,d0
[0003c2ae] 303b 0006                 move.w     $0003C2B6(pc,d0.w),d0
[0003c2b2] 4efb 0002                 jmp        $0003C2B6(pc,d0.w)
J29:
[0003c2b6] 028c                      dc.w $028c   ; $0003c542-$0003c2b6
[0003c2b8] 0268                      dc.w $0268   ; $0003c51e-$0003c2b6
[0003c2ba] 0244                      dc.w $0244   ; $0003c4fa-$0003c2b6
[0003c2bc] 0256                      dc.w $0256   ; $0003c50c-$0003c2b6
[0003c2be] 0200                      dc.w $0200   ; $0003c4b6-$0003c2b6
[0003c2c0] 0100                      dc.w $0100   ; $0003c3b6-$0003c2b6
[0003c2c2] 0338                      dc.w $0338   ; $0003c5ee-$0003c2b6
[0003c2c4] 0338                      dc.w $0338   ; $0003c5ee-$0003c2b6
[0003c2c6] 0338                      dc.w $0338   ; $0003c5ee-$0003c2b6
[0003c2c8] 0278                      dc.w $0278   ; $0003c52e-$0003c2b6
[0003c2ca] 2053                      movea.l    (a3),a0
[0003c2cc] 3028 023a                 move.w     570(a0),d0
[0003c2d0] 6700 00ae                 beq        $0003C380
[0003c2d4] 322a 0020                 move.w     32(a2),d1
[0003c2d8] 6f42                      ble.s      $0003C31C
[0003c2da] 342a 0056                 move.w     86(a2),d2
[0003c2de] c47c 0800                 and.w      #$0800,d2
[0003c2e2] 6716                      beq.s      $0003C2FA
[0003c2e4] 43ea 002c                 lea.l      44(a2),a1
[0003c2e8] 206f 0006                 movea.l    6(a7),a0
[0003c2ec] 41e8 0106                 lea.l      262(a0),a0
[0003c2f0] 7008                      moveq.l    #8,d0
[0003c2f2] 4eb9 0008 3500            jsr        memcpy
[0003c2f8] 6014                      bra.s      $0003C30E
[0003c2fa] 7008                      moveq.l    #8,d0
[0003c2fc] 43ea 0024                 lea.l      36(a2),a1
[0003c300] 206f 0006                 movea.l    6(a7),a0
[0003c304] 41e8 0106                 lea.l      262(a0),a0
[0003c308] 4eb9 0008 3500            jsr        memcpy
[0003c30e] 206f 0006                 movea.l    6(a7),a0
[0003c312] 00a8 0000 0001 010e       ori.l      #$00000001,270(a0)
[0003c31a] 600c                      bra.s      $0003C328
[0003c31c] 206f 0006                 movea.l    6(a7),a0
[0003c320] 02a8 ffff fffe 010e       andi.l     #$FFFFFFFE,270(a0)
[0003c328] 41f9 000d 0466            lea.l      $000D0466,a0
[0003c32e] 4eb9 0004 b496            jsr        Af_cfgfile
[0003c334] 4240                      clr.w      d0
[0003c336] 4eb9 0008 0c8e            jsr        Fcreate
[0003c33c] 2800                      move.l     d0,d4
[0003c33e] 4a80                      tst.l      d0
[0003c340] 6f1a                      ble.s      $0003C35C
[0003c342] 206f 0006                 movea.l    6(a7),a0
[0003c346] 223c 0000 0114            move.l     #$00000114,d1
[0003c34c] 3004                      move.w     d4,d0
[0003c34e] 4eb9 0008 0d5e            jsr        Fwrite
[0003c354] 3004                      move.w     d4,d0
[0003c356] 4eb9 0008 0c7e            jsr        Fclose
[0003c35c] 206a 0014                 movea.l    20(a2),a0
[0003c360] 4eb9 0004 c7c8            jsr        Ax_free
[0003c366] 42aa 0014                 clr.l      20(a2)
[0003c36a] 206f 0006                 movea.l    6(a7),a0
[0003c36e] 4eb9 0004 c7c8            jsr        Ax_free
[0003c374] 204a                      movea.l    a2,a0
[0003c376] 4eb9 0005 85f2            jsr        Awi_delete
[0003c37c] 6000 0280                 bra        $0003C5FE
[0003c380] 204a                      movea.l    a2,a0
[0003c382] 6100 fc3c                 bsr        modul_close
[0003c386] 6000 0276                 bra        $0003C5FE
[0003c38a] 206f 0006                 movea.l    6(a7),a0
[0003c38e] 2028 0114                 move.l     276(a0),d0
[0003c392] 6700 026a                 beq        $0003C5FE
[0003c396] 206f 000a                 movea.l    10(a7),a0
[0003c39a] 6100 f7de                 bsr        CheckDraggedFiles
[0003c39e] 6000 025e                 bra        $0003C5FE
[0003c3a2] 206f 0006                 movea.l    6(a7),a0
[0003c3a6] 2028 0114                 move.l     276(a0),d0
[0003c3aa] 6700 0252                 beq        $0003C5FE
[0003c3ae] 6100 f71c                 bsr        OpenDraggedFiles
[0003c3b2] 6000 024a                 bra        $0003C5FE
[0003c3b6] 202f 000a                 move.l     10(a7),d0
[0003c3ba] 6700 0242                 beq        $0003C5FE
[0003c3be] 222a 0014                 move.l     20(a2),d1
[0003c3c2] 6700 023a                 beq        $0003C5FE
[0003c3c6] 2040                      movea.l    d0,a0
[0003c3c8] 2241                      movea.l    d1,a1
[0003c3ca] 3368 0006 0006            move.w     6(a0),6(a1)
[0003c3d0] 226a 0014                 movea.l    20(a2),a1
[0003c3d4] 2368 000c 000c            move.l     12(a0),12(a1)
[0003c3da] 6000 0222                 bra        $0003C5FE
[0003c3de] 302a 0056                 move.w     86(a2),d0
[0003c3e2] c07c 0800                 and.w      #$0800,d0
[0003c3e6] 6706                      beq.s      $0003C3EE
[0003c3e8] 4240                      clr.w      d0
[0003c3ea] 6000 0214                 bra        $0003C600
[0003c3ee] 2053                      movea.l    (a3),a0
[0003c3f0] 3028 0246                 move.w     582(a0),d0
[0003c3f4] 6706                      beq.s      $0003C3FC
[0003c3f6] b5e8 0240                 cmpa.l     576(a0),a2
[0003c3fa] 670c                      beq.s      $0003C408
[0003c3fc] 2053                      movea.l    (a3),a0
[0003c3fe] 2068 029c                 movea.l    668(a0),a0
[0003c402] 4e90                      jsr        (a0)
[0003c404] 6000 01f8                 bra        $0003C5FE
[0003c408] 2053                      movea.l    (a3),a0
[0003c40a] 3828 0246                 move.w     582(a0),d4
[0003c40e] 3004                      move.w     d4,d0
[0003c410] 48c0                      ext.l      d0
[0003c412] d080                      add.l      d0,d0
[0003c414] 4eb9 0004 c608            jsr        Ax_malloc
[0003c41a] 2648                      movea.l    a0,a3
[0003c41c] 284b                      movea.l    a3,a4
[0003c41e] 200c                      move.l     a4,d0
[0003c420] 6700 01dc                 beq        $0003C5FE
[0003c424] 4eb9 0004 7e1e            jsr        Adr_start
[0003c42a] 6002                      bra.s      $0003C42E
[0003c42c] 36c5                      move.w     d5,(a3)+
[0003c42e] 4eb9 0004 7e2a            jsr        Adr_next
[0003c434] 3a00                      move.w     d0,d5
[0003c436] 6af4                      bpl.s      $0003C42C
[0003c438] 43f9 0003 cc00            lea.l      sort_obnr,a1
[0003c43e] 7202                      moveq.l    #2,d1
[0003c440] 3004                      move.w     d4,d0
[0003c442] 48c0                      ext.l      d0
[0003c444] 204c                      movea.l    a4,a0
[0003c446] 4eb9 0008 1240            jsr        qsort
[0003c44c] 4245                      clr.w      d5
[0003c44e] 6056                      bra.s      $0003C4A6
[0003c450] 3205                      move.w     d5,d1
[0003c452] 48c1                      ext.l      d1
[0003c454] d281                      add.l      d1,d1
[0003c456] 3434 1800                 move.w     0(a4,d1.l),d2
[0003c45a] 48c2                      ext.l      d2
[0003c45c] 2002                      move.l     d2,d0
[0003c45e] d080                      add.l      d0,d0
[0003c460] d082                      add.l      d2,d0
[0003c462] e788                      lsl.l      #3,d0
[0003c464] 266a 0014                 movea.l    20(a2),a3
[0003c468] 47f3 0818                 lea.l      24(a3,d0.l),a3
[0003c46c] 0c6b 0001 0016            cmpi.w     #$0001,22(a3)
[0003c472] 6630                      bne.s      $0003C4A4
[0003c474] 3034 1800                 move.w     0(a4,d1.l),d0
[0003c478] 204a                      movea.l    a2,a0
[0003c47a] 4eb9 0004 7f76            jsr        Adr_del
[0003c480] 266b 000c                 movea.l    12(a3),a3
[0003c484] b67c 000b                 cmp.w      #$000B,d3
[0003c488] 660e                      bne.s      $0003C498
[0003c48a] 93c9                      suba.l     a1,a1
[0003c48c] 7002                      moveq.l    #2,d0
[0003c48e] 204b                      movea.l    a3,a0
[0003c490] 2a6b 0004                 movea.l    4(a3),a5
[0003c494] 4e95                      jsr        (a5)
[0003c496] 600c                      bra.s      $0003C4A4
[0003c498] 93c9                      suba.l     a1,a1
[0003c49a] 3003                      move.w     d3,d0
[0003c49c] 204b                      movea.l    a3,a0
[0003c49e] 2a6b 0004                 movea.l    4(a3),a5
[0003c4a2] 4e95                      jsr        (a5)
[0003c4a4] 5245                      addq.w     #1,d5
[0003c4a6] b845                      cmp.w      d5,d4
[0003c4a8] 6ea6                      bgt.s      $0003C450
[0003c4aa] 204c                      movea.l    a4,a0
[0003c4ac] 4eb9 0004 c7c8            jsr        Ax_free
[0003c4b2] 6000 014a                 bra        $0003C5FE
[0003c4b6] 206f 000a                 movea.l    10(a7),a0
[0003c4ba] 226f 0006                 movea.l    6(a7),a1
[0003c4be] 2350 0114                 move.l     (a0),276(a1)
[0003c4c2] 3039 000c f392            move.w     my_menu,d0
[0003c4c8] 6700 0134                 beq        $0003C5FE
[0003c4cc] 2229 0114                 move.l     276(a1),d1
[0003c4d0] 6614                      bne.s      $0003C4E6
[0003c4d2] 4eb9 0005 5e8c            jsr        Awi_root
[0003c4d8] 2068 005e                 movea.l    94(a0),a0
[0003c4dc] 0068 0008 01a2            ori.w      #$0008,418(a0)
[0003c4e2] 6000 011a                 bra        $0003C5FE
[0003c4e6] 4eb9 0005 5e8c            jsr        Awi_root
[0003c4ec] 2068 005e                 movea.l    94(a0),a0
[0003c4f0] 0268 fff7 01a2            andi.w     #$FFF7,418(a0)
[0003c4f6] 6000 0106                 bra        $0003C5FE
[0003c4fa] 206f 000a                 movea.l    10(a7),a0
[0003c4fe] 3010                      move.w     (a0),d0
[0003c500] 204a                      movea.l    a2,a0
[0003c502] 4eb9 0003 c7e4            jsr        ghost_icon
[0003c508] 6000 00f4                 bra        $0003C5FE
[0003c50c] 206f 000a                 movea.l    10(a7),a0
[0003c510] 3010                      move.w     (a0),d0
[0003c512] 204a                      movea.l    a2,a0
[0003c514] 4eb9 0003 c838            jsr        norm_icon
[0003c51a] 6000 00e2                 bra        $0003C5FE
[0003c51e] 226f 000a                 movea.l    10(a7),a1
[0003c522] 204a                      movea.l    a2,a0
[0003c524] 4eb9 0003 c956            jsr        rem_icon
[0003c52a] 6000 00d2                 bra        $0003C5FE
[0003c52e] 7201                      moveq.l    #1,d1
[0003c530] 206f 000a                 movea.l    10(a7),a0
[0003c534] 3010                      move.w     (a0),d0
[0003c536] 204a                      movea.l    a2,a0
[0003c538] 4eb9 0003 cb28            jsr        update_icon
[0003c53e] 6000 00be                 bra        $0003C5FE
[0003c542] 226f 000a                 movea.l    10(a7),a1
[0003c546] 204a                      movea.l    a2,a0
[0003c548] 4eb9 0003 c8e4            jsr        place_icon
[0003c54e] 6000 00ae                 bra        $0003C5FE
[0003c552] 206f 0006                 movea.l    6(a7),a0
[0003c556] 2028 0114                 move.l     276(a0),d0
[0003c55a] 6700 00a2                 beq        $0003C5FE
[0003c55e] 222f 000a                 move.l     10(a7),d1
[0003c562] 6700 009a                 beq        $0003C5FE
[0003c566] 487a f4ac                 pea.l      open_one_file(pc)
[0003c56a] 42a7                      clr.l      -(a7)
[0003c56c] 2248                      movea.l    a0,a1
[0003c56e] 2641                      movea.l    d1,a3
[0003c570] 266b 0040                 movea.l    64(a3),a3
[0003c574] 2041                      movea.l    d1,a0
[0003c576] 4e93                      jsr        (a3)
[0003c578] 504f                      addq.w     #8,a7
[0003c57a] 6000 0082                 bra        $0003C5FE
[0003c57e] 206f 000a                 movea.l    10(a7),a0
[0003c582] 0c50 4711                 cmpi.w     #$4711,(a0)
[0003c586] 6666                      bne.s      $0003C5EE
[0003c588] 2668 0006                 movea.l    6(a0),a3
[0003c58c] 200b                      move.l     a3,d0
[0003c58e] 675e                      beq.s      $0003C5EE
[0003c590] 1013                      move.b     (a3),d0
[0003c592] 675a                      beq.s      $0003C5EE
[0003c594] 204b                      movea.l    a3,a0
[0003c596] 4eb9 0004 643c            jsr        Ast_create
[0003c59c] 2848                      movea.l    a0,a4
[0003c59e] 200c                      move.l     a4,d0
[0003c5a0] 674c                      beq.s      $0003C5EE
[0003c5a2] 43f9 000d 047a            lea.l      $000D047A,a1
[0003c5a8] 2f09                      move.l     a1,-(a7)
[0003c5aa] 41ef 0004                 lea.l      4(a7),a0
[0003c5ae] 224c                      movea.l    a4,a1
[0003c5b0] 4eb9 0004 b758            jsr        Af_2ext
[0003c5b6] 225f                      movea.l    (a7)+,a1
[0003c5b8] 4eb9 0004 66ea            jsr        Ast_icmp
[0003c5be] 4a40                      tst.w      d0
[0003c5c0] 6712                      beq.s      $0003C5D4
[0003c5c2] 43f9 000d 047d            lea.l      $000D047D,a1
[0003c5c8] 41d7                      lea.l      (a7),a0
[0003c5ca] 4eb9 0004 66ea            jsr        Ast_icmp
[0003c5d0] 4a40                      tst.w      d0
[0003c5d2] 660a                      bne.s      $0003C5DE
[0003c5d4] 204c                      movea.l    a4,a0
[0003c5d6] 4eb9 0007 1408            jsr        Ash_module
[0003c5dc] 6006                      bra.s      $0003C5E4
[0003c5de] 204c                      movea.l    a4,a0
[0003c5e0] 6100 f64c                 bsr        new_call
[0003c5e4] 204c                      movea.l    a4,a0
[0003c5e6] 4eb9 0004 649c            jsr        Ast_delete
[0003c5ec] 6010                      bra.s      $0003C5FE
[0003c5ee] 226f 000a                 movea.l    10(a7),a1
[0003c5f2] 3003                      move.w     d3,d0
[0003c5f4] 204a                      movea.l    a2,a0
[0003c5f6] 4eb9 0005 9dd0            jsr        Awi_service
[0003c5fc] 6002                      bra.s      $0003C600
[0003c5fe] 7001                      moveq.l    #1,d0
[0003c600] 4fef 000e                 lea.l      14(a7),a7
[0003c604] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[0003c608] 4e75                      rts
pd_make:
[0003c60a] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0003c60e] 4fef fef2                 lea.l      -270(a7),a7
[0003c612] 95ca                      suba.l     a2,a2
[0003c614] 49f9 000d 01fa            lea.l      PUR_DESK,a4
[0003c61a] 206c 005e                 movea.l    94(a4),a0
[0003c61e] b1fc 000c fd32            cmpa.l     #_PMENU,a0
[0003c624] 6652                      bne.s      $0003C678
[0003c626] 2648                      movea.l    a0,a3
[0003c628] 382b 0004                 move.w     4(a3),d4
[0003c62c] 48c4                      ext.l      d4
[0003c62e] 2604                      move.l     d4,d3
[0003c630] d683                      add.l      d3,d3
[0003c632] d684                      add.l      d4,d3
[0003c634] e78b                      lsl.l      #3,d3
[0003c636] 3633 3802                 move.w     2(a3,d3.l),d3
[0003c63a] 48c3                      ext.l      d3
[0003c63c] 2403                      move.l     d3,d2
[0003c63e] d482                      add.l      d2,d2
[0003c640] d483                      add.l      d3,d2
[0003c642] e78a                      lsl.l      #3,d2
[0003c644] 3433 2802                 move.w     2(a3,d2.l),d2
[0003c648] 48c2                      ext.l      d2
[0003c64a] 2202                      move.l     d2,d1
[0003c64c] d281                      add.l      d1,d1
[0003c64e] d282                      add.l      d2,d1
[0003c650] e789                      lsl.l      #3,d1
[0003c652] 3233 1800                 move.w     0(a3,d1.l),d1
[0003c656] 48c1                      ext.l      d1
[0003c658] 2001                      move.l     d1,d0
[0003c65a] d080                      add.l      d0,d0
[0003c65c] d081                      add.l      d1,d0
[0003c65e] e788                      lsl.l      #3,d0
[0003c660] d7c0                      adda.l     d0,a3
[0003c662] 377c 0018 0006            move.w     #$0018,6(a3)
[0003c668] 006b 2000 000a            ori.w      #$2000,10(a3)
[0003c66e] 277c 000d 043e 000c       move.l     #Sep,12(a3)
[0003c676] 6004                      bra.s      $0003C67C
[0003c678] 426c f198                 clr.w      -3688(a4)
[0003c67c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003c682] 3028 0236                 move.w     566(a0),d0
[0003c686] 6732                      beq.s      $0003C6BA
[0003c688] 3228 0238                 move.w     568(a0),d1
[0003c68c] 660e                      bne.s      $0003C69C
[0003c68e] 242c 0014                 move.l     20(a4),d2
[0003c692] 6608                      bne.s      $0003C69C
[0003c694] 297c 000d 00aa 0014       move.l     #PUR_BACK,20(a4)
[0003c69c] 204c                      movea.l    a4,a0
[0003c69e] 4eb9 0005 7052            jsr        Awi_create
[0003c6a4] 2648                      movea.l    a0,a3
[0003c6a6] 200b                      move.l     a3,d0
[0003c6a8] 6724                      beq.s      $0003C6CE
[0003c6aa] 226c 00aa                 movea.l    170(a4),a1
[0003c6ae] 91c8                      suba.l     a0,a0
[0003c6b0] 4e91                      jsr        (a1)
[0003c6b2] 2688                      move.l     a0,(a3)
[0003c6b4] 6720                      beq.s      $0003C6D6
[0003c6b6] 2450                      movea.l    (a0),a2
[0003c6b8] 601c                      bra.s      $0003C6D6
[0003c6ba] 296c 005e 0100            move.l     94(a4),256(a4)
[0003c6c0] 91c8                      suba.l     a0,a0
[0003c6c2] 226c 00aa                 movea.l    170(a4),a1
[0003c6c6] 4e91                      jsr        (a1)
[0003c6c8] 2648                      movea.l    a0,a3
[0003c6ca] 200b                      move.l     a3,d0
[0003c6cc] 6606                      bne.s      $0003C6D4
[0003c6ce] 91c8                      suba.l     a0,a0
[0003c6d0] 6000 00ba                 bra        $0003C78C
[0003c6d4] 2453                      movea.l    (a3),a2
[0003c6d6] 200a                      move.l     a2,d0
[0003c6d8] 6700 00b0                 beq        $0003C78A
[0003c6dc] 49ef 000e                 lea.l      14(a7),a4
[0003c6e0] 43ea 0004                 lea.l      4(a2),a1
[0003c6e4] 204c                      movea.l    a4,a0
[0003c6e6] 4eb9 0008 2f0c            jsr        strcpy
[0003c6ec] 0c14 0043                 cmpi.b     #$43,(a4)
[0003c6f0] 6c18                      bge.s      $0003C70A
[0003c6f2] 4eb9 0008 0bd2            jsr        Dgetdrv
[0003c6f8] 4eb9 0008 0c48            jsr        Dsetdrv
[0003c6fe] c0bc 0000 0004            and.l      #$00000004,d0
[0003c704] 6704                      beq.s      $0003C70A
[0003c706] 18bc 0043                 move.b     #$43,(a4)
[0003c70a] 705c                      moveq.l    #92,d0
[0003c70c] 204c                      movea.l    a4,a0
[0003c70e] 4eb9 0008 2e9e            jsr        strrchr
[0003c714] 2f48 0004                 move.l     a0,4(a7)
[0003c718] 670a                      beq.s      $0003C724
[0003c71a] 1028 0001                 move.b     1(a0),d0
[0003c71e] 6704                      beq.s      $0003C724
[0003c720] 4228 0001                 clr.b      1(a0)
[0003c724] 204c                      movea.l    a4,a0
[0003c726] 4eb9 0004 bfa2            jsr        Af_readdir
[0003c72c] 2a48                      movea.l    a0,a5
[0003c72e] 2e8d                      move.l     a5,(a7)
[0003c730] 200d                      move.l     a5,d0
[0003c732] 673a                      beq.s      $0003C76E
[0003c734] 602c                      bra.s      $0003C762
[0003c736] 43f9 000d 047d            lea.l      $000D047D,a1
[0003c73c] 2f09                      move.l     a1,-(a7)
[0003c73e] 2255                      movea.l    (a5),a1
[0003c740] 41ef 000c                 lea.l      12(a7),a0
[0003c744] 4eb9 0004 b758            jsr        Af_2ext
[0003c74a] 225f                      movea.l    (a7)+,a1
[0003c74c] 4eb9 0004 66ea            jsr        Ast_icmp
[0003c752] 4a40                      tst.w      d0
[0003c754] 6608                      bne.s      $0003C75E
[0003c756] 2055                      movea.l    (a5),a0
[0003c758] 4eb9 0007 1408            jsr        Ash_module
[0003c75e] 2a6d 0004                 movea.l    4(a5),a5
[0003c762] 200d                      move.l     a5,d0
[0003c764] 66d0                      bne.s      $0003C736
[0003c766] 2057                      movea.l    (a7),a0
[0003c768] 4eb9 0004 c0a6            jsr        Af_freedir
[0003c76e] 7001                      moveq.l    #1,d0
[0003c770] c0aa 010e                 and.l      270(a2),d0
[0003c774] 6714                      beq.s      $0003C78A
[0003c776] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003c77c] 3228 0236                 move.w     566(a0),d1
[0003c780] 6708                      beq.s      $0003C78A
[0003c782] 2053                      movea.l    (a3),a0
[0003c784] 4eb9 0005 7428            jsr        Awi_open
[0003c78a] 204b                      movea.l    a3,a0
[0003c78c] 4fef 010e                 lea.l      270(a7),a7
[0003c790] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0003c794] 4e75                      rts
pd_serv:
[0003c796] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0003c79a] 2448                      movea.l    a0,a2
[0003c79c] 3600                      move.w     d0,d3
[0003c79e] 2849                      movea.l    a1,a4
[0003c7a0] 2650                      movea.l    (a0),a3
[0003c7a2] 5540                      subq.w     #2,d0
[0003c7a4] 6702                      beq.s      $0003C7A8
[0003c7a6] 6026                      bra.s      $0003C7CE
[0003c7a8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003c7ae] 3028 0236                 move.w     566(a0),d0
[0003c7b2] 6710                      beq.s      $0003C7C4
[0003c7b4] 3228 023a                 move.w     570(a0),d1
[0003c7b8] 6722                      beq.s      $0003C7DC
[0003c7ba] 204a                      movea.l    a2,a0
[0003c7bc] 4eb9 0005 85f2            jsr        Awi_delete
[0003c7c2] 6018                      bra.s      $0003C7DC
[0003c7c4] 204a                      movea.l    a2,a0
[0003c7c6] 4eb9 0005 8362            jsr        Awi_closed
[0003c7cc] 600e                      bra.s      $0003C7DC
[0003c7ce] 224c                      movea.l    a4,a1
[0003c7d0] 3003                      move.w     d3,d0
[0003c7d2] 204b                      movea.l    a3,a0
[0003c7d4] 246b 0004                 movea.l    4(a3),a2
[0003c7d8] 4e92                      jsr        (a2)
[0003c7da] 6002                      bra.s      $0003C7DE
[0003c7dc] 7001                      moveq.l    #1,d0
[0003c7de] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0003c7e2] 4e75                      rts
ghost_icon:
[0003c7e4] 3f03                      move.w     d3,-(a7)
[0003c7e6] 2f0a                      move.l     a2,-(a7)
[0003c7e8] 2448                      movea.l    a0,a2
[0003c7ea] 3600                      move.w     d0,d3
[0003c7ec] 2050                      movea.l    (a0),a0
[0003c7ee] 4a40                      tst.w      d0
[0003c7f0] 6b40                      bmi.s      $0003C832
[0003c7f2] 3228 0104                 move.w     260(a0),d1
[0003c7f6] 673a                      beq.s      $0003C832
[0003c7f8] 48c0                      ext.l      d0
[0003c7fa] 2400                      move.l     d0,d2
[0003c7fc] d482                      add.l      d2,d2
[0003c7fe] d480                      add.l      d0,d2
[0003c800] e78a                      lsl.l      #3,d2
[0003c802] 206a 0014                 movea.l    20(a2),a0
[0003c806] d1c2                      adda.l     d2,a0
[0003c808] 0268 cffa 0008            andi.w     #$CFFA,8(a0)
[0003c80e] 0068 0040 0008            ori.w      #$0040,8(a0)
[0003c814] 0268 fffe 000a            andi.w     #$FFFE,10(a0)
[0003c81a] 2068 000c                 movea.l    12(a0),a0
[0003c81e] 20a8 0004                 move.l     4(a0),(a0)
[0003c822] 42a8 0022                 clr.l      34(a0)
[0003c826] 7201                      moveq.l    #1,d1
[0003c828] 204a                      movea.l    a2,a0
[0003c82a] 3003                      move.w     d3,d0
[0003c82c] 4eb9 0003 cb28            jsr        update_icon
[0003c832] 245f                      movea.l    (a7)+,a2
[0003c834] 361f                      move.w     (a7)+,d3
[0003c836] 4e75                      rts
norm_icon:
[0003c838] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0003c83c] 2448                      movea.l    a0,a2
[0003c83e] 3600                      move.w     d0,d3
[0003c840] 2050                      movea.l    (a0),a0
[0003c842] 4a40                      tst.w      d0
[0003c844] 6b00 0098                 bmi        $0003C8DE
[0003c848] 3228 0104                 move.w     260(a0),d1
[0003c84c] 6700 0090                 beq        $0003C8DE
[0003c850] 48c0                      ext.l      d0
[0003c852] 2400                      move.l     d0,d2
[0003c854] d482                      add.l      d2,d2
[0003c856] d480                      add.l      d0,d2
[0003c858] e78a                      lsl.l      #3,d2
[0003c85a] 266a 0014                 movea.l    20(a2),a3
[0003c85e] d7c2                      adda.l     d2,a3
[0003c860] 49eb 0018                 lea.l      24(a3),a4
[0003c864] 026b ef3f 0008            andi.w     #$EF3F,8(a3)
[0003c86a] 006b 2005 0008            ori.w      #$2005,8(a3)
[0003c870] 026b fffe 000a            andi.w     #$FFFE,10(a3)
[0003c876] 222c 0010                 move.l     16(a4),d1
[0003c87a] 6720                      beq.s      $0003C89C
[0003c87c] 2241                      movea.l    d1,a1
[0003c87e] 206b 000c                 movea.l    12(a3),a0
[0003c882] 7026                      moveq.l    #38,d0
[0003c884] 4eb9 0008 3500            jsr        memcpy
[0003c88a] 303c 00ff                 move.w     #$00FF,d0
[0003c88e] 206c 0010                 movea.l    16(a4),a0
[0003c892] c068 000c                 and.w      12(a0),d0
[0003c896] 3940 000a                 move.w     d0,10(a4)
[0003c89a] 6024                      bra.s      $0003C8C0
[0003c89c] 7026                      moveq.l    #38,d0
[0003c89e] 43f9 000c fc7e            lea.l      I_WIN,a1
[0003c8a4] 206b 000c                 movea.l    12(a3),a0
[0003c8a8] 4eb9 0008 3500            jsr        memcpy
[0003c8ae] 206c 000c                 movea.l    12(a4),a0
[0003c8b2] 226b 000c                 movea.l    12(a3),a1
[0003c8b6] 2368 004a 0008            move.l     74(a0),8(a1)
[0003c8bc] 426c 000a                 clr.w      10(a4)
[0003c8c0] 7010                      moveq.l    #16,d0
[0003c8c2] 206c 000c                 movea.l    12(a4),a0
[0003c8c6] c068 0054                 and.w      84(a0),d0
[0003c8ca] 6706                      beq.s      $0003C8D2
[0003c8cc] 006b 1000 0008            ori.w      #$1000,8(a3)
[0003c8d2] 7201                      moveq.l    #1,d1
[0003c8d4] 3003                      move.w     d3,d0
[0003c8d6] 204a                      movea.l    a2,a0
[0003c8d8] 4eb9 0003 cb28            jsr        update_icon
[0003c8de] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0003c8e2] 4e75                      rts
place_icon:
[0003c8e4] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0003c8e8] 2448                      movea.l    a0,a2
[0003c8ea] 2849                      movea.l    a1,a4
[0003c8ec] 2650                      movea.l    (a0),a3
[0003c8ee] 0c6b 0100 0104            cmpi.w     #$0100,260(a3)
[0003c8f4] 6c54                      bge.s      $0003C94A
[0003c8f6] 362b 0104                 move.w     260(a3),d3
[0003c8fa] d643                      add.w      d3,d3
[0003c8fc] 5243                      addq.w     #1,d3
[0003c8fe] 3203                      move.w     d3,d1
[0003c900] 48c1                      ext.l      d1
[0003c902] 2001                      move.l     d1,d0
[0003c904] d080                      add.l      d0,d0
[0003c906] d081                      add.l      d1,d0
[0003c908] e788                      lsl.l      #3,d0
[0003c90a] 206a 0014                 movea.l    20(a2),a0
[0003c90e] d1c0                      adda.l     d0,a0
[0003c910] 0268 ff7f 0008            andi.w     #$FF7F,8(a0)
[0003c916] 41e8 0018                 lea.l      24(a0),a0
[0003c91a] 317c 0001 0016            move.w     #$0001,22(a0)
[0003c920] 20bc 0003 bd90            move.l     #click_modwin,(a0)
[0003c926] 217c 0003 be6e 0004       move.l     #drag_modwin,4(a0)
[0003c92e] 2149 000c                 move.l     a1,12(a0)
[0003c932] 216c 005a 0010            move.l     90(a4),16(a0)
[0003c938] 3943 0058                 move.w     d3,88(a4)
[0003c93c] 526b 0104                 addq.w     #1,260(a3)
[0003c940] 204a                      movea.l    a2,a0
[0003c942] 3003                      move.w     d3,d0
[0003c944] 6100 fef2                 bsr        norm_icon
[0003c948] 6006                      bra.s      $0003C950
[0003c94a] 397c ffff 0058            move.w     #$FFFF,88(a4)
[0003c950] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0003c954] 4e75                      rts
rem_icon:
[0003c956] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[0003c95a] 514f                      subq.w     #8,a7
[0003c95c] 2648                      movea.l    a0,a3
[0003c95e] 2f49 0004                 move.l     a1,4(a7)
[0003c962] 3611                      move.w     (a1),d3
[0003c964] 2e90                      move.l     (a0),(a7)
[0003c966] 4a43                      tst.w      d3
[0003c968] 6b00 01b6                 bmi        $0003CB20
[0003c96c] 2257                      movea.l    (a7),a1
[0003c96e] 3029 0104                 move.w     260(a1),d0
[0003c972] 6700 01ac                 beq        $0003CB20
[0003c976] 3403                      move.w     d3,d2
[0003c978] 48c2                      ext.l      d2
[0003c97a] 2202                      move.l     d2,d1
[0003c97c] d281                      add.l      d1,d1
[0003c97e] d282                      add.l      d2,d1
[0003c980] e789                      lsl.l      #3,d1
[0003c982] 206b 0014                 movea.l    20(a3),a0
[0003c986] 3830 1800                 move.w     0(a0,d1.l),d4
[0003c98a] 226f 0004                 movea.l    4(a7),a1
[0003c98e] 3011                      move.w     (a1),d0
[0003c990] 4eb9 0005 0f3a            jsr        Aob_up
[0003c996] 3a00                      move.w     d0,d5
[0003c998] 6000 009e                 bra        $0003CA38
[0003c99c] 7026                      moveq.l    #38,d0
[0003c99e] 3404                      move.w     d4,d2
[0003c9a0] 48c2                      ext.l      d2
[0003c9a2] 2202                      move.l     d2,d1
[0003c9a4] d281                      add.l      d1,d1
[0003c9a6] d282                      add.l      d2,d1
[0003c9a8] e789                      lsl.l      #3,d1
[0003c9aa] 206b 0014                 movea.l    20(a3),a0
[0003c9ae] 2270 180c                 movea.l    12(a0,d1.l),a1
[0003c9b2] 3403                      move.w     d3,d2
[0003c9b4] 48c2                      ext.l      d2
[0003c9b6] 2202                      move.l     d2,d1
[0003c9b8] d281                      add.l      d1,d1
[0003c9ba] d282                      add.l      d2,d1
[0003c9bc] e789                      lsl.l      #3,d1
[0003c9be] 2070 180c                 movea.l    12(a0,d1.l),a0
[0003c9c2] 4eb9 0008 3500            jsr        memcpy
[0003c9c8] 3204                      move.w     d4,d1
[0003c9ca] 48c1                      ext.l      d1
[0003c9cc] 2001                      move.l     d1,d0
[0003c9ce] d080                      add.l      d0,d0
[0003c9d0] d081                      add.l      d1,d0
[0003c9d2] e788                      lsl.l      #3,d0
[0003c9d4] 206b 0014                 movea.l    20(a3),a0
[0003c9d8] 3203                      move.w     d3,d1
[0003c9da] 48c1                      ext.l      d1
[0003c9dc] 2401                      move.l     d1,d2
[0003c9de] d482                      add.l      d2,d2
[0003c9e0] d481                      add.l      d1,d2
[0003c9e2] e78a                      lsl.l      #3,d2
[0003c9e4] 226b 0014                 movea.l    20(a3),a1
[0003c9e8] 33b0 0808 2808            move.w     8(a0,d0.l),8(a1,d2.l)
[0003c9ee] 206b 0014                 movea.l    20(a3),a0
[0003c9f2] 226b 0014                 movea.l    20(a3),a1
[0003c9f6] 33b0 080a 280a            move.w     10(a0,d0.l),10(a1,d2.l)
[0003c9fc] 2a6b 0014                 movea.l    20(a3),a5
[0003ca00] 4bf5 2818                 lea.l      24(a5,d2.l),a5
[0003ca04] 246b 0014                 movea.l    20(a3),a2
[0003ca08] 45f2 0818                 lea.l      24(a2,d0.l),a2
[0003ca0c] 286a 000c                 movea.l    12(a2),a4
[0003ca10] 2b4c 000c                 move.l     a4,12(a5)
[0003ca14] 2b6a 0010 0010            move.l     16(a2),16(a5)
[0003ca1a] 220c                      move.l     a4,d1
[0003ca1c] 6704                      beq.s      $0003CA22
[0003ca1e] 556c 0058                 subq.w     #2,88(a4)
[0003ca22] 3604                      move.w     d4,d3
[0003ca24] 3203                      move.w     d3,d1
[0003ca26] 48c1                      ext.l      d1
[0003ca28] 2001                      move.l     d1,d0
[0003ca2a] d080                      add.l      d0,d0
[0003ca2c] d081                      add.l      d1,d0
[0003ca2e] e788                      lsl.l      #3,d0
[0003ca30] 206b 0014                 movea.l    20(a3),a0
[0003ca34] 3830 0800                 move.w     0(a0,d0.l),d4
[0003ca38] 4a45                      tst.w      d5
[0003ca3a] 6b20                      bmi.s      $0003CA5C
[0003ca3c] ba44                      cmp.w      d4,d5
[0003ca3e] 671c                      beq.s      $0003CA5C
[0003ca40] 303c 0080                 move.w     #$0080,d0
[0003ca44] 3404                      move.w     d4,d2
[0003ca46] 48c2                      ext.l      d2
[0003ca48] 2202                      move.l     d2,d1
[0003ca4a] d281                      add.l      d1,d1
[0003ca4c] d282                      add.l      d2,d1
[0003ca4e] e789                      lsl.l      #3,d1
[0003ca50] 206b 0014                 movea.l    20(a3),a0
[0003ca54] c070 1808                 and.w      8(a0,d1.l),d0
[0003ca58] 6700 ff42                 beq        $0003C99C
[0003ca5c] 3203                      move.w     d3,d1
[0003ca5e] 48c1                      ext.l      d1
[0003ca60] 2001                      move.l     d1,d0
[0003ca62] d080                      add.l      d0,d0
[0003ca64] d081                      add.l      d1,d0
[0003ca66] e788                      lsl.l      #3,d0
[0003ca68] 286b 0014                 movea.l    20(a3),a4
[0003ca6c] d9c0                      adda.l     d0,a4
[0003ca6e] 006c 0080 0008            ori.w      #$0080,8(a4)
[0003ca74] 4bec 0018                 lea.l      24(a4),a5
[0003ca78] 426d 0016                 clr.w      22(a5)
[0003ca7c] 7400                      moveq.l    #0,d2
[0003ca7e] 2b42 0010                 move.l     d2,16(a5)
[0003ca82] 2b42 000c                 move.l     d2,12(a5)
[0003ca86] 2b42 0004                 move.l     d2,4(a5)
[0003ca8a] 2a82                      move.l     d2,(a5)
[0003ca8c] 2057                      movea.l    (a7),a0
[0003ca8e] 5368 0104                 subq.w     #1,260(a0)
[0003ca92] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003ca98] 3429 023a                 move.w     570(a1),d2
[0003ca9c] 6600 007a                 bne.w      $0003CB18
[0003caa0] 3028 0104                 move.w     260(a0),d0
[0003caa4] 6760                      beq.s      $0003CB06
[0003caa6] 246f 0004                 movea.l    4(a7),a2
[0003caaa] 3612                      move.w     (a2),d3
[0003caac] 3403                      move.w     d3,d2
[0003caae] 48c2                      ext.l      d2
[0003cab0] 2202                      move.l     d2,d1
[0003cab2] d281                      add.l      d1,d1
[0003cab4] d282                      add.l      d2,d1
[0003cab6] e789                      lsl.l      #3,d1
[0003cab8] 286b 0014                 movea.l    20(a3),a4
[0003cabc] 3834 1800                 move.w     0(a4,d1.l),d4
[0003cac0] 6022                      bra.s      $0003CAE4
[0003cac2] 4241                      clr.w      d1
[0003cac4] 3003                      move.w     d3,d0
[0003cac6] 204b                      movea.l    a3,a0
[0003cac8] 4eb9 0003 cb28            jsr        update_icon
[0003cace] 3604                      move.w     d4,d3
[0003cad0] 3203                      move.w     d3,d1
[0003cad2] 48c1                      ext.l      d1
[0003cad4] 2001                      move.l     d1,d0
[0003cad6] d080                      add.l      d0,d0
[0003cad8] d081                      add.l      d1,d0
[0003cada] e788                      lsl.l      #3,d0
[0003cadc] 206b 0014                 movea.l    20(a3),a0
[0003cae0] 3830 0800                 move.w     0(a0,d0.l),d4
[0003cae4] 4a45                      tst.w      d5
[0003cae6] 6b1e                      bmi.s      $0003CB06
[0003cae8] ba44                      cmp.w      d4,d5
[0003caea] 671a                      beq.s      $0003CB06
[0003caec] 303c 0080                 move.w     #$0080,d0
[0003caf0] 3403                      move.w     d3,d2
[0003caf2] 48c2                      ext.l      d2
[0003caf4] 2202                      move.l     d2,d1
[0003caf6] d281                      add.l      d1,d1
[0003caf8] d282                      add.l      d2,d1
[0003cafa] e789                      lsl.l      #3,d1
[0003cafc] 206b 0014                 movea.l    20(a3),a0
[0003cb00] c070 1808                 and.w      8(a0,d1.l),d0
[0003cb04] 67bc                      beq.s      $0003CAC2
[0003cb06] 006b 0010 0056            ori.w      #$0010,86(a3)
[0003cb0c] 43eb 0024                 lea.l      36(a3),a1
[0003cb10] 204b                      movea.l    a3,a0
[0003cb12] 246b 0086                 movea.l    134(a3),a2
[0003cb16] 4e92                      jsr        (a2)
[0003cb18] 206f 0004                 movea.l    4(a7),a0
[0003cb1c] 30bc ffff                 move.w     #$FFFF,(a0)
[0003cb20] 504f                      addq.w     #8,a7
[0003cb22] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[0003cb26] 4e75                      rts
update_icon:
[0003cb28] 48e7 0838                 movem.l    d4/a2-a4,-(a7)
[0003cb2c] 2448                      movea.l    a0,a2
[0003cb2e] 3801                      move.w     d1,d4
[0003cb30] 2050                      movea.l    (a0),a0
[0003cb32] 4a40                      tst.w      d0
[0003cb34] 6b00 00c4                 bmi        $0003CBFA
[0003cb38] 3428 0104                 move.w     260(a0),d2
[0003cb3c] 6700 00bc                 beq        $0003CBFA
[0003cb40] 48c0                      ext.l      d0
[0003cb42] 2200                      move.l     d0,d1
[0003cb44] d281                      add.l      d1,d1
[0003cb46] d280                      add.l      d0,d1
[0003cb48] e789                      lsl.l      #3,d1
[0003cb4a] 266a 0014                 movea.l    20(a2),a3
[0003cb4e] d7c1                      adda.l     d1,a3
[0003cb50] 49eb 0018                 lea.l      24(a3),a4
[0003cb54] 242c 0010                 move.l     16(a4),d2
[0003cb58] 6736                      beq.s      $0003CB90
[0003cb5a] 2042                      movea.l    d2,a0
[0003cb5c] 3228 0016                 move.w     22(a0),d1
[0003cb60] b26b 0014                 cmp.w      20(a3),d1
[0003cb64] 6c2a                      bge.s      $0003CB90
[0003cb66] 3028 0018                 move.w     24(a0),d0
[0003cb6a] b06b 0016                 cmp.w      22(a3),d0
[0003cb6e] 6c20                      bge.s      $0003CB90
[0003cb70] 2242                      movea.l    d2,a1
[0003cb72] 206b 000c                 movea.l    12(a3),a0
[0003cb76] 7026                      moveq.l    #38,d0
[0003cb78] 4eb9 0008 3500            jsr        memcpy
[0003cb7e] 303c 00ff                 move.w     #$00FF,d0
[0003cb82] 206c 0010                 movea.l    16(a4),a0
[0003cb86] c068 000c                 and.w      12(a0),d0
[0003cb8a] 3940 000a                 move.w     d0,10(a4)
[0003cb8e] 602c                      bra.s      $0003CBBC
[0003cb90] 7026                      moveq.l    #38,d0
[0003cb92] 43f9 000c fc7e            lea.l      I_WIN,a1
[0003cb98] 206b 000c                 movea.l    12(a3),a0
[0003cb9c] 4eb9 0008 3500            jsr        memcpy
[0003cba2] 206c 000c                 movea.l    12(a4),a0
[0003cba6] 2068 004a                 movea.l    74(a0),a0
[0003cbaa] 4eb9 0004 643c            jsr        Ast_create
[0003cbb0] 226b 000c                 movea.l    12(a3),a1
[0003cbb4] 2348 0008                 move.l     a0,8(a1)
[0003cbb8] 426c 000a                 clr.w      10(a4)
[0003cbbc] 302b 0008                 move.w     8(a3),d0
[0003cbc0] c07c 2000                 and.w      #$2000,d0
[0003cbc4] 660c                      bne.s      $0003CBD2
[0003cbc6] 206b 000c                 movea.l    12(a3),a0
[0003cbca] 20a8 0004                 move.l     4(a0),(a0)
[0003cbce] 42a8 0022                 clr.l      34(a0)
[0003cbd2] 204b                      movea.l    a3,a0
[0003cbd4] 4eb9 0004 fd76            jsr        Aob_icon
[0003cbda] 302a 0056                 move.w     86(a2),d0
[0003cbde] c07c 0800                 and.w      #$0800,d0
[0003cbe2] 6616                      bne.s      $0003CBFA
[0003cbe4] 4a44                      tst.w      d4
[0003cbe6] 6712                      beq.s      $0003CBFA
[0003cbe8] 006a 0010 0056            ori.w      #$0010,86(a2)
[0003cbee] 43ea 0024                 lea.l      36(a2),a1
[0003cbf2] 204a                      movea.l    a2,a0
[0003cbf4] 266a 0086                 movea.l    134(a2),a3
[0003cbf8] 4e93                      jsr        (a3)
[0003cbfa] 4cdf 1c10                 movem.l    (a7)+,d4/a2-a4
[0003cbfe] 4e75                      rts
sort_obnr:
[0003cc00] 3010                      move.w     (a0),d0
[0003cc02] b051                      cmp.w      (a1),d0
[0003cc04] 6c04                      bge.s      $0003CC0A
[0003cc06] 7001                      moveq.l    #1,d0
[0003cc08] 4e75                      rts
[0003cc0a] 3010                      move.w     (a0),d0
[0003cc0c] b051                      cmp.w      (a1),d0
[0003cc0e] 6f04                      ble.s      $0003CC14
[0003cc10] 70ff                      moveq.l    #-1,d0
[0003cc12] 4e75                      rts
[0003cc14] 4240                      clr.w      d0
[0003cc16] 4e75                      rts
purGEMScript:
[0003cc18] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0003cc1c] 2848                      movea.l    a0,a4
[0003cc1e] 3600                      move.w     d0,d3
[0003cc20] 2449                      movea.l    a1,a2
[0003cc22] 266f 0014                 movea.l    20(a7),a3
[0003cc26] 43f9 000d 0481            lea.l      $000D0481,a1
[0003cc2c] 2052                      movea.l    (a2),a0
[0003cc2e] 4eb9 0004 66ea            jsr        Ast_icmp
[0003cc34] 4a40                      tst.w      d0
[0003cc36] 6628                      bne.s      $0003CC60
[0003cc38] 2053                      movea.l    (a3),a0
[0003cc3a] 2050                      movea.l    (a0),a0
[0003cc3c] 4eb9 0004 649c            jsr        Ast_delete
[0003cc42] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003cc48] 41e8 0220                 lea.l      544(a0),a0
[0003cc4c] 4eb9 0004 643c            jsr        Ast_create
[0003cc52] 2253                      movea.l    (a3),a1
[0003cc54] 2288                      move.l     a0,(a1)
[0003cc56] 377c 0001 0004            move.w     #$0001,4(a3)
[0003cc5c] 4240                      clr.w      d0
[0003cc5e] 6010                      bra.s      $0003CC70
[0003cc60] 2f0b                      move.l     a3,-(a7)
[0003cc62] 224a                      movea.l    a2,a1
[0003cc64] 3003                      move.w     d3,d0
[0003cc66] 204c                      movea.l    a4,a0
[0003cc68] 4eb9 0005 b5b6            jsr        Awi_gemscript
[0003cc6e] 584f                      addq.w     #4,a7
[0003cc70] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0003cc74] 4e75                      rts
