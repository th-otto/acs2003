INmemory:
[0004c4be] 554f                      subq.w     #2,a7
[0004c4c0] 3039 000e 0898            move.w     MemInit,d0
[0004c4c6] 5279 000e 0898            addq.w     #1,MemInit
[0004c4cc] 4a40                      tst.w      d0
[0004c4ce] 6706                      beq.s      $0004C4D6
[0004c4d0] 4240                      clr.w      d0
[0004c4d2] 6000 0090                 bra        $0004C564
[0004c4d6] 4257                      clr.w      (a7)
[0004c4d8] 605a                      bra.s      $0004C534
[0004c4da] 3217                      move.w     (a7),d1
[0004c4dc] 48c1                      ext.l      d1
[0004c4de] 2001                      move.l     d1,d0
[0004c4e0] e588                      lsl.l      #2,d0
[0004c4e2] d081                      add.l      d1,d0
[0004c4e4] e588                      lsl.l      #2,d0
[0004c4e6] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004c4ec] 4270 080a                 clr.w      10(a0,d0.l)
[0004c4f0] 3217                      move.w     (a7),d1
[0004c4f2] 48c1                      ext.l      d1
[0004c4f4] 2001                      move.l     d1,d0
[0004c4f6] e588                      lsl.l      #2,d0
[0004c4f8] d081                      add.l      d1,d0
[0004c4fa] e588                      lsl.l      #2,d0
[0004c4fc] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004c502] 4270 080c                 clr.w      12(a0,d0.l)
[0004c506] 3217                      move.w     (a7),d1
[0004c508] 48c1                      ext.l      d1
[0004c50a] 2001                      move.l     d1,d0
[0004c50c] e588                      lsl.l      #2,d0
[0004c50e] d081                      add.l      d1,d0
[0004c510] e588                      lsl.l      #2,d0
[0004c512] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004c518] 4270 080e                 clr.w      14(a0,d0.l)
[0004c51c] 3217                      move.w     (a7),d1
[0004c51e] 48c1                      ext.l      d1
[0004c520] 2001                      move.l     d1,d0
[0004c522] e588                      lsl.l      #2,d0
[0004c524] d081                      add.l      d1,d0
[0004c526] e588                      lsl.l      #2,d0
[0004c528] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004c52e] 42b0 0810                 clr.l      16(a0,d0.l)
[0004c532] 5257                      addq.w     #1,(a7)
[0004c534] 3017                      move.w     (a7),d0
[0004c536] b079 000e 0b32            cmp.w      freeBlockListAnz,d0
[0004c53c] 6d9c                      blt.s      $0004C4DA
[0004c53e] 3039 000e 0b32            move.w     freeBlockListAnz,d0
[0004c544] 6f1c                      ble.s      $0004C562
[0004c546] 43f9 0004 cb58            lea.l      sortFreeMemList,a1
[0004c54c] 7214                      moveq.l    #20,d1
[0004c54e] 3039 000e 0b32            move.w     freeBlockListAnz,d0
[0004c554] 48c0                      ext.l      d0
[0004c556] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004c55c] 4eb9 0008 1240            jsr        qsort
[0004c562] 4240                      clr.w      d0
[0004c564] 544f                      addq.w     #2,a7
[0004c566] 4e75                      rts
TRmemory:
[0004c568] 4fef fff6                 lea.l      -10(a7),a7
[0004c56c] 5379 000e 0898            subq.w     #1,MemInit
[0004c572] 6704                      beq.s      $0004C578
[0004c574] 6000 008c                 bra        $0004C602
[0004c578] 426f 0008                 clr.w      8(a7)
[0004c57c] 604a                      bra.s      $0004C5C8
[0004c57e] 322f 0008                 move.w     8(a7),d1
[0004c582] 48c1                      ext.l      d1
[0004c584] 2001                      move.l     d1,d0
[0004c586] e588                      lsl.l      #2,d0
[0004c588] d081                      add.l      d1,d0
[0004c58a] e588                      lsl.l      #2,d0
[0004c58c] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004c592] d1c0                      adda.l     d0,a0
[0004c594] 2f48 0004                 move.l     a0,4(a7)
[0004c598] 6020                      bra.s      $0004C5BA
[0004c59a] 206f 0004                 movea.l    4(a7),a0
[0004c59e] 2ea8 0010                 move.l     16(a0),(a7)
[0004c5a2] 206f 0004                 movea.l    4(a7),a0
[0004c5a6] 2068 0010                 movea.l    16(a0),a0
[0004c5aa] 226f 0004                 movea.l    4(a7),a1
[0004c5ae] 2350 0010                 move.l     (a0),16(a1)
[0004c5b2] 2057                      movea.l    (a7),a0
[0004c5b4] 4eb9 0004 c7c8            jsr        Ax_free
[0004c5ba] 206f 0004                 movea.l    4(a7),a0
[0004c5be] 2028 0010                 move.l     16(a0),d0
[0004c5c2] 66d6                      bne.s      $0004C59A
[0004c5c4] 526f 0008                 addq.w     #1,8(a7)
[0004c5c8] 302f 0008                 move.w     8(a7),d0
[0004c5cc] b079 000e 0b32            cmp.w      freeBlockListAnz,d0
[0004c5d2] 6daa                      blt.s      $0004C57E
[0004c5d4] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004c5da] b1fc 000e 0926            cmpa.l     #_freeBlockList,a0
[0004c5e0] 670c                      beq.s      $0004C5EE
[0004c5e2] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004c5e8] 4eb9 0004 c7c8            jsr        Ax_free
[0004c5ee] 2039 000e 0b34            move.l     freeBlockStat,d0
[0004c5f4] 670c                      beq.s      $0004C602
[0004c5f6] 2079 000e 0b34            movea.l    freeBlockStat,a0
[0004c5fc] 4eb9 0004 c7c8            jsr        Ax_free
[0004c602] 4fef 000a                 lea.l      10(a7),a7
[0004c606] 4e75                      rts
Ax_malloc:
[0004c608] 514f                      subq.w     #8,a7
[0004c60a] 2f40 0004                 move.l     d0,4(a7)
[0004c60e] 202f 0004                 move.l     4(a7),d0
[0004c612] 4eb9 0004 cbac            jsr        RecycleFreeBlocks
[0004c618] 2e88                      move.l     a0,(a7)
[0004c61a] 2017                      move.l     (a7),d0
[0004c61c] 660c                      bne.s      $0004C62A
[0004c61e] 202f 0004                 move.l     4(a7),d0
[0004c622] 4eb9 0004 c630            jsr        _malloc
[0004c628] 2e88                      move.l     a0,(a7)
[0004c62a] 2057                      movea.l    (a7),a0
[0004c62c] 504f                      addq.w     #8,a7
[0004c62e] 4e75                      rts
_malloc:
[0004c630] 514f                      subq.w     #8,a7
[0004c632] 2f40 0004                 move.l     d0,4(a7)
[0004c636] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004c63c] 3028 0236                 move.w     566(a0),d0
[0004c640] 660c                      bne.s      $0004C64E
[0004c642] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004c648] 3028 0238                 move.w     568(a0),d0
[0004c64c] 670e                      beq.s      $0004C65C
[0004c64e] 202f 0004                 move.l     4(a7),d0
[0004c652] 4eb9 0008 32ca            jsr        malloc
[0004c658] 2e88                      move.l     a0,(a7)
[0004c65a] 6018                      bra.s      $0004C674
[0004c65c] 4eb9 0004 3ef8            jsr        accgemdo
[0004c662] 202f 0004                 move.l     4(a7),d0
[0004c666] 4eb9 0008 32ca            jsr        malloc
[0004c66c] 2e88                      move.l     a0,(a7)
[0004c66e] 4eb9 0004 3f10            jsr        oldgemdo
[0004c674] 2017                      move.l     (a7),d0
[0004c676] 6604                      bne.s      $0004C67C
[0004c678] 91c8                      suba.l     a0,a0
[0004c67a] 6048                      bra.s      $0004C6C4
[0004c67c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004c682] 2068 023c                 movea.l    572(a0),a0
[0004c686] 3028 000e                 move.w     14(a0),d0
[0004c68a] c07c 0400                 and.w      #$0400,d0
[0004c68e] 6632                      bne.s      $0004C6C2
[0004c690] 2057                      movea.l    (a7),a0
[0004c692] b1f9 0011 3694            cmpa.l     watch_max,a0
[0004c698] 6428                      bcc.s      $0004C6C2
[0004c69a] 2057                      movea.l    (a7),a0
[0004c69c] b1f9 0011 3690            cmpa.l     watch_min,a0
[0004c6a2] 651e                      bcs.s      $0004C6C2
[0004c6a4] 91c8                      suba.l     a0,a0
[0004c6a6] 7005                      moveq.l    #5,d0
[0004c6a8] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c6ae] 2269 03d6                 movea.l    982(a1),a1
[0004c6b2] 4e91                      jsr        (a1)
[0004c6b4] 2057                      movea.l    (a7),a0
[0004c6b6] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c6bc] 2269 02d2                 movea.l    722(a1),a1
[0004c6c0] 4e91                      jsr        (a1)
[0004c6c2] 2057                      movea.l    (a7),a0
[0004c6c4] 504f                      addq.w     #8,a7
[0004c6c6] 4e75                      rts
Ax_ifree:
[0004c6c8] 514f                      subq.w     #8,a7
[0004c6ca] 2f48 0004                 move.l     a0,4(a7)
[0004c6ce] 2eaf 0004                 move.l     4(a7),(a7)
[0004c6d2] 202f 0004                 move.l     4(a7),d0
[0004c6d6] 670c                      beq.s      $0004C6E4
[0004c6d8] 206f 0004                 movea.l    4(a7),a0
[0004c6dc] b1fc 000e 05da            cmpa.l     #null_string,a0
[0004c6e2] 6604                      bne.s      $0004C6E8
[0004c6e4] 6000 00de                 bra        $0004C7C4
[0004c6e8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004c6ee] 2068 023c                 movea.l    572(a0),a0
[0004c6f2] 3028 000e                 move.w     14(a0),d0
[0004c6f6] c07c 0400                 and.w      #$0400,d0
[0004c6fa] 6600 008e                 bne        $0004C78A
[0004c6fe] 206f 0004                 movea.l    4(a7),a0
[0004c702] b1f9 0011 3694            cmpa.l     watch_max,a0
[0004c708] 642c                      bcc.s      $0004C736
[0004c70a] 206f 0004                 movea.l    4(a7),a0
[0004c70e] b1f9 0011 3690            cmpa.l     watch_min,a0
[0004c714] 6520                      bcs.s      $0004C736
[0004c716] 91c8                      suba.l     a0,a0
[0004c718] 7005                      moveq.l    #5,d0
[0004c71a] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c720] 2269 03d6                 movea.l    982(a1),a1
[0004c724] 4e91                      jsr        (a1)
[0004c726] 206f 0004                 movea.l    4(a7),a0
[0004c72a] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c730] 2269 02d2                 movea.l    722(a1),a1
[0004c734] 4e91                      jsr        (a1)
[0004c736] 0caf 0000 1000 0004       cmpi.l     #$00001000,4(a7)
[0004c73e] 6c22                      bge.s      $0004C762
[0004c740] 91c8                      suba.l     a0,a0
[0004c742] 7005                      moveq.l    #5,d0
[0004c744] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c74a] 2269 03d6                 movea.l    982(a1),a1
[0004c74e] 4e91                      jsr        (a1)
[0004c750] 206f 0004                 movea.l    4(a7),a0
[0004c754] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c75a] 2269 02d2                 movea.l    722(a1),a1
[0004c75e] 4e91                      jsr        (a1)
[0004c760] 6062                      bra.s      $0004C7C4
[0004c762] 7001                      moveq.l    #1,d0
[0004c764] c097                      and.l      (a7),d0
[0004c766] 6722                      beq.s      $0004C78A
[0004c768] 91c8                      suba.l     a0,a0
[0004c76a] 7006                      moveq.l    #6,d0
[0004c76c] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c772] 2269 03d6                 movea.l    982(a1),a1
[0004c776] 4e91                      jsr        (a1)
[0004c778] 206f 0004                 movea.l    4(a7),a0
[0004c77c] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c782] 2269 02d2                 movea.l    722(a1),a1
[0004c786] 4e91                      jsr        (a1)
[0004c788] 603a                      bra.s      $0004C7C4
[0004c78a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004c790] 3028 0236                 move.w     566(a0),d0
[0004c794] 660c                      bne.s      $0004C7A2
[0004c796] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004c79c] 3028 0238                 move.w     568(a0),d0
[0004c7a0] 670c                      beq.s      $0004C7AE
[0004c7a2] 206f 0004                 movea.l    4(a7),a0
[0004c7a6] 4eb9 0008 3394            jsr        free
[0004c7ac] 6016                      bra.s      $0004C7C4
[0004c7ae] 4eb9 0004 3ef8            jsr        accgemdo
[0004c7b4] 206f 0004                 movea.l    4(a7),a0
[0004c7b8] 4eb9 0008 3394            jsr        free
[0004c7be] 4eb9 0004 3f10            jsr        oldgemdo
[0004c7c4] 504f                      addq.w     #8,a7
[0004c7c6] 4e75                      rts
Ax_free:
[0004c7c8] 4fef fff4                 lea.l      -12(a7),a7
[0004c7cc] 2f48 0008                 move.l     a0,8(a7)
[0004c7d0] 2eaf 0008                 move.l     8(a7),(a7)
[0004c7d4] 202f 0008                 move.l     8(a7),d0
[0004c7d8] 670c                      beq.s      $0004C7E6
[0004c7da] 206f 0008                 movea.l    8(a7),a0
[0004c7de] b1fc 000e 05da            cmpa.l     #null_string,a0
[0004c7e4] 6604                      bne.s      $0004C7EA
[0004c7e6] 6000 0108                 bra        $0004C8F0
[0004c7ea] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004c7f0] 2068 023c                 movea.l    572(a0),a0
[0004c7f4] 3028 000e                 move.w     14(a0),d0
[0004c7f8] c07c 0400                 and.w      #$0400,d0
[0004c7fc] 6600 0090                 bne        $0004C88E
[0004c800] 206f 0008                 movea.l    8(a7),a0
[0004c804] b1f9 0011 3694            cmpa.l     watch_max,a0
[0004c80a] 642c                      bcc.s      $0004C838
[0004c80c] 206f 0008                 movea.l    8(a7),a0
[0004c810] b1f9 0011 3690            cmpa.l     watch_min,a0
[0004c816] 6520                      bcs.s      $0004C838
[0004c818] 91c8                      suba.l     a0,a0
[0004c81a] 7005                      moveq.l    #5,d0
[0004c81c] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c822] 2269 03d6                 movea.l    982(a1),a1
[0004c826] 4e91                      jsr        (a1)
[0004c828] 206f 0008                 movea.l    8(a7),a0
[0004c82c] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c832] 2269 02d2                 movea.l    722(a1),a1
[0004c836] 4e91                      jsr        (a1)
[0004c838] 0caf 0000 1000 0008       cmpi.l     #$00001000,8(a7)
[0004c840] 6c24                      bge.s      $0004C866
[0004c842] 91c8                      suba.l     a0,a0
[0004c844] 7005                      moveq.l    #5,d0
[0004c846] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c84c] 2269 03d6                 movea.l    982(a1),a1
[0004c850] 4e91                      jsr        (a1)
[0004c852] 206f 0008                 movea.l    8(a7),a0
[0004c856] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c85c] 2269 02d2                 movea.l    722(a1),a1
[0004c860] 4e91                      jsr        (a1)
[0004c862] 6000 008c                 bra        $0004C8F0
[0004c866] 7001                      moveq.l    #1,d0
[0004c868] c097                      and.l      (a7),d0
[0004c86a] 6722                      beq.s      $0004C88E
[0004c86c] 91c8                      suba.l     a0,a0
[0004c86e] 7006                      moveq.l    #6,d0
[0004c870] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c876] 2269 03d6                 movea.l    982(a1),a1
[0004c87a] 4e91                      jsr        (a1)
[0004c87c] 206f 0008                 movea.l    8(a7),a0
[0004c880] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004c886] 2269 02d2                 movea.l    722(a1),a1
[0004c88a] 4e91                      jsr        (a1)
[0004c88c] 6062                      bra.s      $0004C8F0
[0004c88e] 2079 000e 0922            movea.l    act,a0
[0004c894] 7020                      moveq.l    #32,d0
[0004c896] b0a8 0004                 cmp.l      4(a0),d0
[0004c89a] 6e38                      bgt.s      $0004C8D4
[0004c89c] 203c 0000 0088            move.l     #$00000088,d0
[0004c8a2] 6100 fd64                 bsr        Ax_malloc
[0004c8a6] 2f48 0004                 move.l     a0,4(a7)
[0004c8aa] 202f 0004                 move.l     4(a7),d0
[0004c8ae] 660a                      bne.s      $0004C8BA
[0004c8b0] 206f 0008                 movea.l    8(a7),a0
[0004c8b4] 6100 fe12                 bsr        Ax_ifree
[0004c8b8] 6036                      bra.s      $0004C8F0
[0004c8ba] 206f 0004                 movea.l    4(a7),a0
[0004c8be] 20b9 000e 0922            move.l     act,(a0)
[0004c8c4] 206f 0004                 movea.l    4(a7),a0
[0004c8c8] 42a8 0004                 clr.l      4(a0)
[0004c8cc] 23ef 0004 000e 0922       move.l     4(a7),act
[0004c8d4] 2079 000e 0922            movea.l    act,a0
[0004c8da] 2028 0004                 move.l     4(a0),d0
[0004c8de] 52a8 0004                 addq.l     #1,4(a0)
[0004c8e2] e588                      lsl.l      #2,d0
[0004c8e4] 2079 000e 0922            movea.l    act,a0
[0004c8ea] 21af 0008 0808            move.l     8(a7),8(a0,d0.l)
[0004c8f0] 4fef 000c                 lea.l      12(a7),a7
[0004c8f4] 4e75                      rts
Ax_release:
[0004c8f6] 594f                      subq.w     #4,a7
[0004c8f8] 605e                      bra.s      $0004C958
[0004c8fa] 601a                      bra.s      $0004C916
[0004c8fc] 2079 000e 0922            movea.l    act,a0
[0004c902] 2028 0004                 move.l     4(a0),d0
[0004c906] e588                      lsl.l      #2,d0
[0004c908] 2079 000e 0922            movea.l    act,a0
[0004c90e] 2070 0808                 movea.l    8(a0,d0.l),a0
[0004c912] 6100 fdb4                 bsr        Ax_ifree
[0004c916] 2079 000e 0922            movea.l    act,a0
[0004c91c] 2028 0004                 move.l     4(a0),d0
[0004c920] 53a8 0004                 subq.l     #1,4(a0)
[0004c924] 4a80                      tst.l      d0
[0004c926] 6ed4                      bgt.s      $0004C8FC
[0004c928] 2079 000e 0922            movea.l    act,a0
[0004c92e] 42a8 0004                 clr.l      4(a0)
[0004c932] 2079 000e 0922            movea.l    act,a0
[0004c938] 2e90                      move.l     (a0),(a7)
[0004c93a] 2017                      move.l     (a7),d0
[0004c93c] 6602                      bne.s      $0004C940
[0004c93e] 601a                      bra.s      $0004C95A
[0004c940] 203c 0000 0088            move.l     #$00000088,d0
[0004c946] 2079 000e 0922            movea.l    act,a0
[0004c94c] 4eb9 0004 cc28            jsr        Ax_recycle
[0004c952] 23d7 000e 0922            move.l     (a7),act
[0004c958] 60a0                      bra.s      $0004C8FA
[0004c95a] 584f                      addq.w     #4,a7
[0004c95c] 4e75                      rts
Ax_glmalloc:
[0004c95e] 4fef fff6                 lea.l      -10(a7),a7
[0004c962] 2f40 0006                 move.l     d0,6(a7)
[0004c966] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004c96c] 3028 0236                 move.w     566(a0),d0
[0004c970] 6612                      bne.s      $0004C984
[0004c972] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004c978] 3028 0238                 move.w     568(a0),d0
[0004c97c] 6606                      bne.s      $0004C984
[0004c97e] 4eb9 0004 3ef8            jsr        accgemdo
[0004c984] 4eb9 0008 0e64            jsr        Mxmask
[0004c98a] 3f40 0004                 move.w     d0,4(a7)
[0004c98e] 302f 0004                 move.w     4(a7),d0
[0004c992] 6714                      beq.s      $0004C9A8
[0004c994] 7223                      moveq.l    #35,d1
[0004c996] c26f 0004                 and.w      4(a7),d1
[0004c99a] 202f 0006                 move.l     6(a7),d0
[0004c99e] 4eb9 0008 0dc2            jsr        Mxalloc
[0004c9a4] 2e88                      move.l     a0,(a7)
[0004c9a6] 600c                      bra.s      $0004C9B4
[0004c9a8] 202f 0006                 move.l     6(a7),d0
[0004c9ac] 4eb9 0008 0d8a            jsr        Malloc
[0004c9b2] 2e88                      move.l     a0,(a7)
[0004c9b4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004c9ba] 3028 0236                 move.w     566(a0),d0
[0004c9be] 6612                      bne.s      $0004C9D2
[0004c9c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004c9c6] 3028 0238                 move.w     568(a0),d0
[0004c9ca] 6606                      bne.s      $0004C9D2
[0004c9cc] 4eb9 0004 3f10            jsr        oldgemdo
[0004c9d2] 2057                      movea.l    (a7),a0
[0004c9d4] 4fef 000a                 lea.l      10(a7),a7
[0004c9d8] 4e75                      rts
Ax_glfree:
[0004c9da] 594f                      subq.w     #4,a7
[0004c9dc] 2e88                      move.l     a0,(a7)
[0004c9de] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004c9e4] 3028 0236                 move.w     566(a0),d0
[0004c9e8] 660c                      bne.s      $0004C9F6
[0004c9ea] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004c9f0] 3028 0238                 move.w     568(a0),d0
[0004c9f4] 670a                      beq.s      $0004CA00
[0004c9f6] 2057                      movea.l    (a7),a0
[0004c9f8] 4eb9 0008 0d9c            jsr        Mfree
[0004c9fe] 6014                      bra.s      $0004CA14
[0004ca00] 4eb9 0004 3ef8            jsr        accgemdo
[0004ca06] 2057                      movea.l    (a7),a0
[0004ca08] 4eb9 0008 0d9c            jsr        Mfree
[0004ca0e] 4eb9 0004 3f10            jsr        oldgemdo
[0004ca14] 584f                      addq.w     #4,a7
[0004ca16] 4e75                      rts
handle_sigbus:
[0004ca18] 2f02                      move.l     d2,-(a7)
[0004ca1a] 4eb9 0008 0e14            jsr        Psigretu
[0004ca20] 7001                      moveq.l    #1,d0
[0004ca22] 41f9 0011 3698            lea.l      check,a0
[0004ca28] 4eb9 0008 1098            jsr        longjmp
[0004ca2e] 241f                      move.l     (a7)+,d2
[0004ca30] 4e75                      rts
Ax_memCheck:
[0004ca32] 4fef ffe2                 lea.l      -30(a7),a7
[0004ca36] 2f48 001a                 move.l     a0,26(a7)
[0004ca3a] 2f40 0016                 move.l     d0,22(a7)
[0004ca3e] 3f41 0014                 move.w     d1,20(a7)
[0004ca42] 2f6f 001a 0002            move.l     26(a7),2(a7)
[0004ca48] 41fa ffce                 lea.l      handle_sigbus(pc),a0
[0004ca4c] 700a                      moveq.l    #10,d0
[0004ca4e] 4eb9 0008 0e00            jsr        Psignal
[0004ca54] 2f40 000a                 move.l     d0,10(a7)
[0004ca58] 70e0                      moveq.l    #-32,d0
[0004ca5a] b0af 000a                 cmp.l      10(a7),d0
[0004ca5e] 6606                      bne.s      $0004CA66
[0004ca60] 7001                      moveq.l    #1,d0
[0004ca62] 6000 00ee                 bra        $0004CB52
[0004ca66] 41fa ffb0                 lea.l      handle_sigbus(pc),a0
[0004ca6a] 700b                      moveq.l    #11,d0
[0004ca6c] 4eb9 0008 0e00            jsr        Psignal
[0004ca72] 2f40 0006                 move.l     d0,6(a7)
[0004ca76] 70e0                      moveq.l    #-32,d0
[0004ca78] b0af 0006                 cmp.l      6(a7),d0
[0004ca7c] 6612                      bne.s      $0004CA90
[0004ca7e] 206f 000a                 movea.l    10(a7),a0
[0004ca82] 700a                      moveq.l    #10,d0
[0004ca84] 4eb9 0008 0e00            jsr        Psignal
[0004ca8a] 7001                      moveq.l    #1,d0
[0004ca8c] 6000 00c4                 bra        $0004CB52
[0004ca90] 3f7c 0001 0012            move.w     #$0001,18(a7)
[0004ca96] 41f9 0011 3698            lea.l      check,a0
[0004ca9c] 4eb9 0008 108e            jsr        setjmp
[0004caa2] 4a40                      tst.w      d0
[0004caa4] 6708                      beq.s      $0004CAAE
[0004caa6] 426f 0012                 clr.w      18(a7)
[0004caaa] 6000 008a                 bra        $0004CB36
[0004caae] 70ff                      moveq.l    #-1,d0
[0004cab0] c06f 0018                 and.w      24(a7),d0
[0004cab4] 5440                      addq.w     #2,d0
[0004cab6] 6728                      beq.s      $0004CAE0
[0004cab8] 5340                      subq.w     #1,d0
[0004caba] 6702                      beq.s      $0004CABE
[0004cabc] 604e                      bra.s      $0004CB0C
[0004cabe] 1ebc 0041                 move.b     #$41,(a7)
[0004cac2] 6016                      bra.s      $0004CADA
[0004cac4] 206f 0002                 movea.l    2(a7),a0
[0004cac8] 1e90                      move.b     (a0),(a7)
[0004caca] 302f 0014                 move.w     20(a7),d0
[0004cace] 6706                      beq.s      $0004CAD6
[0004cad0] 206f 0002                 movea.l    2(a7),a0
[0004cad4] 1097                      move.b     (a7),(a0)
[0004cad6] 52af 0002                 addq.l     #1,2(a7)
[0004cada] 1017                      move.b     (a7),d0
[0004cadc] 66e6                      bne.s      $0004CAC4
[0004cade] 6056                      bra.s      $0004CB36
[0004cae0] 1ebc 0041                 move.b     #$41,(a7)
[0004cae4] 6016                      bra.s      $0004CAFC
[0004cae6] 206f 0002                 movea.l    2(a7),a0
[0004caea] 1e90                      move.b     (a0),(a7)
[0004caec] 302f 0014                 move.w     20(a7),d0
[0004caf0] 6706                      beq.s      $0004CAF8
[0004caf2] 206f 0002                 movea.l    2(a7),a0
[0004caf6] 1097                      move.b     (a7),(a0)
[0004caf8] 52af 0002                 addq.l     #1,2(a7)
[0004cafc] 1017                      move.b     (a7),d0
[0004cafe] 66e6                      bne.s      $0004CAE6
[0004cb00] 206f 0002                 movea.l    2(a7),a0
[0004cb04] 1028 ffff                 move.b     -1(a0),d0
[0004cb08] 66dc                      bne.s      $0004CAE6
[0004cb0a] 602a                      bra.s      $0004CB36
[0004cb0c] 42af 000e                 clr.l      14(a7)
[0004cb10] 601a                      bra.s      $0004CB2C
[0004cb12] 206f 0002                 movea.l    2(a7),a0
[0004cb16] 1e90                      move.b     (a0),(a7)
[0004cb18] 302f 0014                 move.w     20(a7),d0
[0004cb1c] 6706                      beq.s      $0004CB24
[0004cb1e] 206f 0002                 movea.l    2(a7),a0
[0004cb22] 1097                      move.b     (a7),(a0)
[0004cb24] 52af 000e                 addq.l     #1,14(a7)
[0004cb28] 52af 0002                 addq.l     #1,2(a7)
[0004cb2c] 202f 000e                 move.l     14(a7),d0
[0004cb30] b0af 0016                 cmp.l      22(a7),d0
[0004cb34] 6ddc                      blt.s      $0004CB12
[0004cb36] 206f 000a                 movea.l    10(a7),a0
[0004cb3a] 700a                      moveq.l    #10,d0
[0004cb3c] 4eb9 0008 0e00            jsr        Psignal
[0004cb42] 206f 0006                 movea.l    6(a7),a0
[0004cb46] 700b                      moveq.l    #11,d0
[0004cb48] 4eb9 0008 0e00            jsr        Psignal
[0004cb4e] 302f 0012                 move.w     18(a7),d0
[0004cb52] 4fef 001e                 lea.l      30(a7),a7
[0004cb56] 4e75                      rts
sortFreeMemList:
[0004cb58] 514f                      subq.w     #8,a7
[0004cb5a] 2f48 0004                 move.l     a0,4(a7)
[0004cb5e] 2e89                      move.l     a1,(a7)
[0004cb60] 206f 0004                 movea.l    4(a7),a0
[0004cb64] 2010                      move.l     (a0),d0
[0004cb66] 2057                      movea.l    (a7),a0
[0004cb68] b090                      cmp.l      (a0),d0
[0004cb6a] 6712                      beq.s      $0004CB7E
[0004cb6c] 206f 0004                 movea.l    4(a7),a0
[0004cb70] 3028 0002                 move.w     2(a0),d0
[0004cb74] 2057                      movea.l    (a7),a0
[0004cb76] 9068 0002                 sub.w      2(a0),d0
[0004cb7a] 6012                      bra.s      $0004CB8E
[0004cb7c] 6010                      bra.s      $0004CB8E
[0004cb7e] 2057                      movea.l    (a7),a0
[0004cb80] 3028 0008                 move.w     8(a0),d0
[0004cb84] 206f 0004                 movea.l    4(a7),a0
[0004cb88] 9068 0008                 sub.w      8(a0),d0
[0004cb8c] 4e71                      nop
[0004cb8e] 504f                      addq.w     #8,a7
[0004cb90] 4e75                      rts
searchFreeMemList:
[0004cb92] 514f                      subq.w     #8,a7
[0004cb94] 2f48 0004                 move.l     a0,4(a7)
[0004cb98] 2e89                      move.l     a1,(a7)
[0004cb9a] 206f 0004                 movea.l    4(a7),a0
[0004cb9e] 3028 0002                 move.w     2(a0),d0
[0004cba2] 2057                      movea.l    (a7),a0
[0004cba4] 9068 0002                 sub.w      2(a0),d0
[0004cba8] 504f                      addq.w     #8,a7
[0004cbaa] 4e75                      rts
RecycleFreeBlocks:
[0004cbac] 4fef fff4                 lea.l      -12(a7),a7
[0004cbb0] 2f40 0004                 move.l     d0,4(a7)
[0004cbb4] 4297                      clr.l      (a7)
[0004cbb6] 3039 000e 0b32            move.w     freeBlockListAnz,d0
[0004cbbc] 6f22                      ble.s      $0004CBE0
[0004cbbe] 487a ffd2                 pea.l      searchFreeMemList(pc)
[0004cbc2] 7214                      moveq.l    #20,d1
[0004cbc4] 3039 000e 0b32            move.w     freeBlockListAnz,d0
[0004cbca] 48c0                      ext.l      d0
[0004cbcc] 2279 000e 0b2e            movea.l    freeBlockList,a1
[0004cbd2] 41ef 0008                 lea.l      8(a7),a0
[0004cbd6] 4eb9 0008 10a4            jsr        bsearch
[0004cbdc] 584f                      addq.w     #4,a7
[0004cbde] 2e88                      move.l     a0,(a7)
[0004cbe0] 2017                      move.l     (a7),d0
[0004cbe2] 673c                      beq.s      $0004CC20
[0004cbe4] 2057                      movea.l    (a7),a0
[0004cbe6] 2028 0010                 move.l     16(a0),d0
[0004cbea] 6734                      beq.s      $0004CC20
[0004cbec] 2057                      movea.l    (a7),a0
[0004cbee] 2f68 0010 0008            move.l     16(a0),8(a7)
[0004cbf4] 206f 0008                 movea.l    8(a7),a0
[0004cbf8] 2257                      movea.l    (a7),a1
[0004cbfa] 2350 0010                 move.l     (a0),16(a1)
[0004cbfe] 2057                      movea.l    (a7),a0
[0004cc00] 3028 000a                 move.w     10(a0),d0
[0004cc04] 6f06                      ble.s      $0004CC0C
[0004cc06] 2057                      movea.l    (a7),a0
[0004cc08] 5368 000a                 subq.w     #1,10(a0)
[0004cc0c] 2057                      movea.l    (a7),a0
[0004cc0e] 3028 000e                 move.w     14(a0),d0
[0004cc12] 6f06                      ble.s      $0004CC1A
[0004cc14] 2057                      movea.l    (a7),a0
[0004cc16] 5368 000e                 subq.w     #1,14(a0)
[0004cc1a] 206f 0008                 movea.l    8(a7),a0
[0004cc1e] 6002                      bra.s      $0004CC22
[0004cc20] 91c8                      suba.l     a0,a0
[0004cc22] 4fef 000c                 lea.l      12(a7),a7
[0004cc26] 4e75                      rts
Ax_recycle:
[0004cc28] 4fef ffee                 lea.l      -18(a7),a7
[0004cc2c] 2f48 000e                 move.l     a0,14(a7)
[0004cc30] 2f40 000a                 move.l     d0,10(a7)
[0004cc34] 426f 0008                 clr.w      8(a7)
[0004cc38] 2f6f 000e 0004            move.l     14(a7),4(a7)
[0004cc3e] 4297                      clr.l      (a7)
[0004cc40] 202f 000e                 move.l     14(a7),d0
[0004cc44] 670c                      beq.s      $0004CC52
[0004cc46] 206f 000e                 movea.l    14(a7),a0
[0004cc4a] b1fc 000e 05da            cmpa.l     #null_string,a0
[0004cc50] 6604                      bne.s      $0004CC56
[0004cc52] 6000 0088                 bra        $0004CCDC
[0004cc56] 3039 000e 0b32            move.w     freeBlockListAnz,d0
[0004cc5c] 6f22                      ble.s      $0004CC80
[0004cc5e] 487a ff32                 pea.l      searchFreeMemList(pc)
[0004cc62] 7214                      moveq.l    #20,d1
[0004cc64] 3039 000e 0b32            move.w     freeBlockListAnz,d0
[0004cc6a] 48c0                      ext.l      d0
[0004cc6c] 2279 000e 0b2e            movea.l    freeBlockList,a1
[0004cc72] 41ef 000e                 lea.l      14(a7),a0
[0004cc76] 4eb9 0008 10a4            jsr        bsearch
[0004cc7c] 584f                      addq.w     #4,a7
[0004cc7e] 2e88                      move.l     a0,(a7)
[0004cc80] 2017                      move.l     (a7),d0
[0004cc82] 674a                      beq.s      $0004CCCE
[0004cc84] 2057                      movea.l    (a7),a0
[0004cc86] 3028 000a                 move.w     10(a0),d0
[0004cc8a] 2057                      movea.l    (a7),a0
[0004cc8c] b068 0008                 cmp.w      8(a0),d0
[0004cc90] 6c36                      bge.s      $0004CCC8
[0004cc92] 2057                      movea.l    (a7),a0
[0004cc94] 226f 0004                 movea.l    4(a7),a1
[0004cc98] 22a8 0010                 move.l     16(a0),(a1)
[0004cc9c] 2057                      movea.l    (a7),a0
[0004cc9e] 216f 0004 0010            move.l     4(a7),16(a0)
[0004cca4] 3f7c 0001 0008            move.w     #$0001,8(a7)
[0004ccaa] 2057                      movea.l    (a7),a0
[0004ccac] 5268 000a                 addq.w     #1,10(a0)
[0004ccb0] 2057                      movea.l    (a7),a0
[0004ccb2] 3028 000a                 move.w     10(a0),d0
[0004ccb6] 2057                      movea.l    (a7),a0
[0004ccb8] b068 000c                 cmp.w      12(a0),d0
[0004ccbc] 6f0a                      ble.s      $0004CCC8
[0004ccbe] 2057                      movea.l    (a7),a0
[0004ccc0] 2257                      movea.l    (a7),a1
[0004ccc2] 3368 000a 000c            move.w     10(a0),12(a1)
[0004ccc8] 2057                      movea.l    (a7),a0
[0004ccca] 5268 000e                 addq.w     #1,14(a0)
[0004ccce] 302f 0008                 move.w     8(a7),d0
[0004ccd2] 6608                      bne.s      $0004CCDC
[0004ccd4] 206f 000e                 movea.l    14(a7),a0
[0004ccd8] 6100 faee                 bsr        Ax_free
[0004ccdc] 4fef 0012                 lea.l      18(a7),a7
[0004cce0] 4e75                      rts
createNewList:
[0004cce2] 4fef fff2                 lea.l      -14(a7),a7
[0004cce6] 2f40 000a                 move.l     d0,10(a7)
[0004ccea] 3f41 0008                 move.w     d1,8(a7)
[0004ccee] 2f48 0004                 move.l     a0,4(a7)
[0004ccf2] 4297                      clr.l      (a7)
[0004ccf4] 7201                      moveq.l    #1,d1
[0004ccf6] d279 000e 0b32            add.w      freeBlockListAnz,d1
[0004ccfc] 48c1                      ext.l      d1
[0004ccfe] 2001                      move.l     d1,d0
[0004cd00] e588                      lsl.l      #2,d0
[0004cd02] d081                      add.l      d1,d0
[0004cd04] e588                      lsl.l      #2,d0
[0004cd06] 6100 f928                 bsr        _malloc
[0004cd0a] 2e88                      move.l     a0,(a7)
[0004cd0c] 2017                      move.l     (a7),d0
[0004cd0e] 6606                      bne.s      $0004CD16
[0004cd10] 4240                      clr.w      d0
[0004cd12] 6000 00b2                 bra        $0004CDC6
[0004cd16] 3239 000e 0b32            move.w     freeBlockListAnz,d1
[0004cd1c] 48c1                      ext.l      d1
[0004cd1e] 2001                      move.l     d1,d0
[0004cd20] e588                      lsl.l      #2,d0
[0004cd22] d081                      add.l      d1,d0
[0004cd24] e588                      lsl.l      #2,d0
[0004cd26] 2279 000e 0b2e            movea.l    freeBlockList,a1
[0004cd2c] 2057                      movea.l    (a7),a0
[0004cd2e] 4eb9 0008 3500            jsr        memcpy
[0004cd34] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004cd3a] b1fc 000e 0926            cmpa.l     #_freeBlockList,a0
[0004cd40] 670a                      beq.s      $0004CD4C
[0004cd42] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004cd48] 6100 fa7e                 bsr        Ax_free
[0004cd4c] 23d7 000e 0b2e            move.l     (a7),freeBlockList
[0004cd52] 5279 000e 0b32            addq.w     #1,freeBlockListAnz
[0004cd58] 3239 000e 0b32            move.w     freeBlockListAnz,d1
[0004cd5e] 48c1                      ext.l      d1
[0004cd60] 2001                      move.l     d1,d0
[0004cd62] e588                      lsl.l      #2,d0
[0004cd64] d081                      add.l      d1,d0
[0004cd66] e588                      lsl.l      #2,d0
[0004cd68] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004cd6e] 41f0 08ec                 lea.l      -20(a0,d0.l),a0
[0004cd72] 2e88                      move.l     a0,(a7)
[0004cd74] 2057                      movea.l    (a7),a0
[0004cd76] 20af 000a                 move.l     10(a7),(a0)
[0004cd7a] 2057                      movea.l    (a7),a0
[0004cd7c] 216f 0004 0004            move.l     4(a7),4(a0)
[0004cd82] 2057                      movea.l    (a7),a0
[0004cd84] 42a8 0010                 clr.l      16(a0)
[0004cd88] 2057                      movea.l    (a7),a0
[0004cd8a] 316f 0008 0008            move.w     8(a7),8(a0)
[0004cd90] 2057                      movea.l    (a7),a0
[0004cd92] 4268 000a                 clr.w      10(a0)
[0004cd96] 2057                      movea.l    (a7),a0
[0004cd98] 4268 000c                 clr.w      12(a0)
[0004cd9c] 2057                      movea.l    (a7),a0
[0004cd9e] 4268 000e                 clr.w      14(a0)
[0004cda2] 3039 000e 0b32            move.w     freeBlockListAnz,d0
[0004cda8] 6f1a                      ble.s      $0004CDC4
[0004cdaa] 43fa fdac                 lea.l      sortFreeMemList(pc),a1
[0004cdae] 7214                      moveq.l    #20,d1
[0004cdb0] 3039 000e 0b32            move.w     freeBlockListAnz,d0
[0004cdb6] 48c0                      ext.l      d0
[0004cdb8] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004cdbe] 4eb9 0008 1240            jsr        qsort
[0004cdc4] 7001                      moveq.l    #1,d0
[0004cdc6] 4fef 000e                 lea.l      14(a7),a7
[0004cdca] 4e75                      rts
deleteOldList:
[0004cdcc] 4fef fff0                 lea.l      -16(a7),a7
[0004cdd0] 2f48 000c                 move.l     a0,12(a7)
[0004cdd4] 42af 0008                 clr.l      8(a7)
[0004cdd8] 601e                      bra.s      $0004CDF8
[0004cdda] 206f 000c                 movea.l    12(a7),a0
[0004cdde] 2f68 0010 0004            move.l     16(a0),4(a7)
[0004cde4] 206f 0004                 movea.l    4(a7),a0
[0004cde8] 226f 000c                 movea.l    12(a7),a1
[0004cdec] 2350 0010                 move.l     (a0),16(a1)
[0004cdf0] 206f 0004                 movea.l    4(a7),a0
[0004cdf4] 6100 f9d2                 bsr        Ax_free
[0004cdf8] 206f 000c                 movea.l    12(a7),a0
[0004cdfc] 2028 0010                 move.l     16(a0),d0
[0004ce00] 66d8                      bne.s      $0004CDDA
[0004ce02] 0c79 0001 000e 0b32       cmpi.w     #$0001,freeBlockListAnz
[0004ce0a] 6f1a                      ble.s      $0004CE26
[0004ce0c] 72ff                      moveq.l    #-1,d1
[0004ce0e] d279 000e 0b32            add.w      freeBlockListAnz,d1
[0004ce14] 48c1                      ext.l      d1
[0004ce16] 2001                      move.l     d1,d0
[0004ce18] e588                      lsl.l      #2,d0
[0004ce1a] d081                      add.l      d1,d0
[0004ce1c] e588                      lsl.l      #2,d0
[0004ce1e] 6100 f810                 bsr        _malloc
[0004ce22] 2f48 0008                 move.l     a0,8(a7)
[0004ce26] 202f 0008                 move.l     8(a7),d0
[0004ce2a] 6700 008e                 beq        $0004CEBA
[0004ce2e] 4257                      clr.w      (a7)
[0004ce30] 426f 0002                 clr.w      2(a7)
[0004ce34] 6052                      bra.s      $0004CE88
[0004ce36] 322f 0002                 move.w     2(a7),d1
[0004ce3a] 48c1                      ext.l      d1
[0004ce3c] 2001                      move.l     d1,d0
[0004ce3e] e588                      lsl.l      #2,d0
[0004ce40] d081                      add.l      d1,d0
[0004ce42] e588                      lsl.l      #2,d0
[0004ce44] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004ce4a] d1c0                      adda.l     d0,a0
[0004ce4c] b1ef 000c                 cmpa.l     12(a7),a0
[0004ce50] 6732                      beq.s      $0004CE84
[0004ce52] 7014                      moveq.l    #20,d0
[0004ce54] 342f 0002                 move.w     2(a7),d2
[0004ce58] 48c2                      ext.l      d2
[0004ce5a] 2202                      move.l     d2,d1
[0004ce5c] e589                      lsl.l      #2,d1
[0004ce5e] d282                      add.l      d2,d1
[0004ce60] e589                      lsl.l      #2,d1
[0004ce62] 2279 000e 0b2e            movea.l    freeBlockList,a1
[0004ce68] d3c1                      adda.l     d1,a1
[0004ce6a] 3417                      move.w     (a7),d2
[0004ce6c] 5257                      addq.w     #1,(a7)
[0004ce6e] 48c2                      ext.l      d2
[0004ce70] 2202                      move.l     d2,d1
[0004ce72] e589                      lsl.l      #2,d1
[0004ce74] d282                      add.l      d2,d1
[0004ce76] e589                      lsl.l      #2,d1
[0004ce78] 206f 0008                 movea.l    8(a7),a0
[0004ce7c] d1c1                      adda.l     d1,a0
[0004ce7e] 4eb9 0008 3500            jsr        memcpy
[0004ce84] 526f 0002                 addq.w     #1,2(a7)
[0004ce88] 302f 0002                 move.w     2(a7),d0
[0004ce8c] b079 000e 0b32            cmp.w      freeBlockListAnz,d0
[0004ce92] 6da2                      blt.s      $0004CE36
[0004ce94] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004ce9a] b1fc 000e 0926            cmpa.l     #_freeBlockList,a0
[0004cea0] 670a                      beq.s      $0004CEAC
[0004cea2] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004cea8] 6100 f91e                 bsr        Ax_free
[0004ceac] 23ef 0008 000e 0b2e       move.l     8(a7),freeBlockList
[0004ceb4] 5379 000e 0b32            subq.w     #1,freeBlockListAnz
[0004ceba] 3039 000e 0b32            move.w     freeBlockListAnz,d0
[0004cec0] 6f1a                      ble.s      $0004CEDC
[0004cec2] 43fa fc94                 lea.l      sortFreeMemList(pc),a1
[0004cec6] 7214                      moveq.l    #20,d1
[0004cec8] 3039 000e 0b32            move.w     freeBlockListAnz,d0
[0004cece] 48c0                      ext.l      d0
[0004ced0] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004ced6] 4eb9 0008 1240            jsr        qsort
[0004cedc] 4fef 0010                 lea.l      16(a7),a7
[0004cee0] 4e75                      rts
Ax_setRecycleSize:
[0004cee2] 4fef ffea                 lea.l      -22(a7),a7
[0004cee6] 2f40 000e                 move.l     d0,14(a7)
[0004ceea] 3f41 000c                 move.w     d1,12(a7)
[0004ceee] 2f48 0008                 move.l     a0,8(a7)
[0004cef2] 42af 0004                 clr.l      4(a7)
[0004cef6] 4257                      clr.w      (a7)
[0004cef8] 7008                      moveq.l    #8,d0
[0004cefa] b0af 000e                 cmp.l      14(a7),d0
[0004cefe] 6f0c                      ble.s      $0004CF0C
[0004cf00] 202f 000e                 move.l     14(a7),d0
[0004cf04] 6706                      beq.s      $0004CF0C
[0004cf06] 4240                      clr.w      d0
[0004cf08] 6000 00ee                 bra        $0004CFF8
[0004cf0c] 2039 000e 0b34            move.l     freeBlockStat,d0
[0004cf12] 670a                      beq.s      $0004CF1E
[0004cf14] 2079 000e 0b34            movea.l    freeBlockStat,a0
[0004cf1a] 6100 f8ac                 bsr        Ax_free
[0004cf1e] 42b9 000e 0b34            clr.l      freeBlockStat
[0004cf24] 3039 000e 0b32            move.w     freeBlockListAnz,d0
[0004cf2a] 6f24                      ble.s      $0004CF50
[0004cf2c] 487a fc64                 pea.l      searchFreeMemList(pc)
[0004cf30] 7214                      moveq.l    #20,d1
[0004cf32] 3039 000e 0b32            move.w     freeBlockListAnz,d0
[0004cf38] 48c0                      ext.l      d0
[0004cf3a] 2279 000e 0b2e            movea.l    freeBlockList,a1
[0004cf40] 41ef 0012                 lea.l      18(a7),a0
[0004cf44] 4eb9 0008 10a4            jsr        bsearch
[0004cf4a] 584f                      addq.w     #4,a7
[0004cf4c] 2f48 0004                 move.l     a0,4(a7)
[0004cf50] 202f 0004                 move.l     4(a7),d0
[0004cf54] 661c                      bne.s      $0004CF72
[0004cf56] 302f 000c                 move.w     12(a7),d0
[0004cf5a] 6f12                      ble.s      $0004CF6E
[0004cf5c] 206f 0008                 movea.l    8(a7),a0
[0004cf60] 322f 000c                 move.w     12(a7),d1
[0004cf64] 202f 000e                 move.l     14(a7),d0
[0004cf68] 6100 fd78                 bsr        createNewList
[0004cf6c] 3e80                      move.w     d0,(a7)
[0004cf6e] 6000 0086                 bra        $0004CFF6
[0004cf72] 3f6f 000c 0002            move.w     12(a7),2(a7)
[0004cf78] 6022                      bra.s      $0004CF9C
[0004cf7a] 206f 0004                 movea.l    4(a7),a0
[0004cf7e] 2f68 0010 0012            move.l     16(a0),18(a7)
[0004cf84] 206f 0012                 movea.l    18(a7),a0
[0004cf88] 226f 0004                 movea.l    4(a7),a1
[0004cf8c] 2350 0010                 move.l     (a0),16(a1)
[0004cf90] 206f 0012                 movea.l    18(a7),a0
[0004cf94] 6100 f832                 bsr        Ax_free
[0004cf98] 526f 0002                 addq.w     #1,2(a7)
[0004cf9c] 206f 0004                 movea.l    4(a7),a0
[0004cfa0] 2028 0010                 move.l     16(a0),d0
[0004cfa4] 671c                      beq.s      $0004CFC2
[0004cfa6] 206f 0004                 movea.l    4(a7),a0
[0004cfaa] 302f 0002                 move.w     2(a7),d0
[0004cfae] b068 0008                 cmp.w      8(a0),d0
[0004cfb2] 6c0e                      bge.s      $0004CFC2
[0004cfb4] 206f 0004                 movea.l    4(a7),a0
[0004cfb8] 302f 0002                 move.w     2(a7),d0
[0004cfbc] b068 000a                 cmp.w      10(a0),d0
[0004cfc0] 6db8                      blt.s      $0004CF7A
[0004cfc2] 206f 0004                 movea.l    4(a7),a0
[0004cfc6] 316f 000c 0008            move.w     12(a7),8(a0)
[0004cfcc] 206f 0004                 movea.l    4(a7),a0
[0004cfd0] 3028 000a                 move.w     10(a0),d0
[0004cfd4] b06f 000c                 cmp.w      12(a7),d0
[0004cfd8] 6f0a                      ble.s      $0004CFE4
[0004cfda] 206f 0004                 movea.l    4(a7),a0
[0004cfde] 316f 000c 000a            move.w     12(a7),10(a0)
[0004cfe4] 302f 000c                 move.w     12(a7),d0
[0004cfe8] 6e08                      bgt.s      $0004CFF2
[0004cfea] 206f 0004                 movea.l    4(a7),a0
[0004cfee] 6100 fddc                 bsr        deleteOldList
[0004cff2] 3ebc 0001                 move.w     #$0001,(a7)
[0004cff6] 3017                      move.w     (a7),d0
[0004cff8] 4fef 0016                 lea.l      22(a7),a7
[0004cffc] 4e75                      rts
Ax_getRecycleStat:
[0004cffe] 4fef fff2                 lea.l      -14(a7),a7
[0004d002] 2f48 000a                 move.l     a0,10(a7)
[0004d006] 42af 0006                 clr.l      6(a7)
[0004d00a] 42af 0002                 clr.l      2(a7)
[0004d00e] 2039 000e 0b34            move.l     freeBlockStat,d0
[0004d014] 6622                      bne.s      $0004D038
[0004d016] 3039 000e 0b32            move.w     freeBlockListAnz,d0
[0004d01c] 48c0                      ext.l      d0
[0004d01e] e988                      lsl.l      #4,d0
[0004d020] 6100 f5e6                 bsr        Ax_malloc
[0004d024] 23c8 000e 0b34            move.l     a0,freeBlockStat
[0004d02a] 2039 000e 0b34            move.l     freeBlockStat,d0
[0004d030] 6606                      bne.s      $0004D038
[0004d032] 91c8                      suba.l     a0,a0
[0004d034] 6000 00a4                 bra        $0004D0DA
[0004d038] 4257                      clr.w      (a7)
[0004d03a] 607c                      bra.s      $0004D0B8
[0004d03c] 3217                      move.w     (a7),d1
[0004d03e] 48c1                      ext.l      d1
[0004d040] 2001                      move.l     d1,d0
[0004d042] e588                      lsl.l      #2,d0
[0004d044] d081                      add.l      d1,d0
[0004d046] e588                      lsl.l      #2,d0
[0004d048] 2079 000e 0b2e            movea.l    freeBlockList,a0
[0004d04e] d1c0                      adda.l     d0,a0
[0004d050] 2f48 0006                 move.l     a0,6(a7)
[0004d054] 3017                      move.w     (a7),d0
[0004d056] 48c0                      ext.l      d0
[0004d058] e988                      lsl.l      #4,d0
[0004d05a] 2079 000e 0b34            movea.l    freeBlockStat,a0
[0004d060] d1c0                      adda.l     d0,a0
[0004d062] 2f48 0002                 move.l     a0,2(a7)
[0004d066] 206f 0006                 movea.l    6(a7),a0
[0004d06a] 226f 0002                 movea.l    2(a7),a1
[0004d06e] 2290                      move.l     (a0),(a1)
[0004d070] 206f 0006                 movea.l    6(a7),a0
[0004d074] 226f 0002                 movea.l    2(a7),a1
[0004d078] 2368 0004 0004            move.l     4(a0),4(a1)
[0004d07e] 206f 0006                 movea.l    6(a7),a0
[0004d082] 226f 0002                 movea.l    2(a7),a1
[0004d086] 3368 0008 0008            move.w     8(a0),8(a1)
[0004d08c] 206f 0006                 movea.l    6(a7),a0
[0004d090] 226f 0002                 movea.l    2(a7),a1
[0004d094] 3368 000a 000a            move.w     10(a0),10(a1)
[0004d09a] 206f 0006                 movea.l    6(a7),a0
[0004d09e] 226f 0002                 movea.l    2(a7),a1
[0004d0a2] 3368 000c 000c            move.w     12(a0),12(a1)
[0004d0a8] 206f 0006                 movea.l    6(a7),a0
[0004d0ac] 226f 0002                 movea.l    2(a7),a1
[0004d0b0] 3368 000e 000e            move.w     14(a0),14(a1)
[0004d0b6] 5257                      addq.w     #1,(a7)
[0004d0b8] 3017                      move.w     (a7),d0
[0004d0ba] b079 000e 0b32            cmp.w      freeBlockListAnz,d0
[0004d0c0] 6d00 ff7a                 blt        $0004D03C
[0004d0c4] 202f 000a                 move.l     10(a7),d0
[0004d0c8] 670a                      beq.s      $0004D0D4
[0004d0ca] 206f 000a                 movea.l    10(a7),a0
[0004d0ce] 30b9 000e 0b32            move.w     freeBlockListAnz,(a0)
[0004d0d4] 2079 000e 0b34            movea.l    freeBlockStat,a0
[0004d0da] 4fef 000e                 lea.l      14(a7),a7
[0004d0de] 4e75                      rts
