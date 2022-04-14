edst_type:
[00031992] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00031996] 514f                      subq.w     #8,a7
[00031998] 45f9 000c adbc            lea.l      POP_TYPESEL,a2
[0003199e] 204a                      movea.l    a2,a0
[000319a0] 4eb9 0004 f064            jsr        Aob_create
[000319a6] 2648                      movea.l    a0,a3
[000319a8] 200b                      move.l     a3,d0
[000319aa] 6700 011c                 beq        $00031AC8
[000319ae] 49f9 0010 ee4e            lea.l      ACSblk,a4
[000319b4] 7005                      moveq.l    #5,d0
[000319b6] 2054                      movea.l    (a4),a0
[000319b8] 2268 0258                 movea.l    600(a0),a1
[000319bc] 2269 0014                 movea.l    20(a1),a1
[000319c0] 41d7                      lea.l      (a7),a0
[000319c2] 4eb9 0004 fe06            jsr        Aob_offset
[000319c8] 7001                      moveq.l    #1,d0
[000319ca] 2054                      movea.l    (a4),a0
[000319cc] 2268 0258                 movea.l    600(a0),a1
[000319d0] d069 0034                 add.w      52(a1),d0
[000319d4] d157                      add.w      d0,(a7)
[000319d6] 7201                      moveq.l    #1,d1
[000319d8] d269 0036                 add.w      54(a1),d1
[000319dc] d36f 0002                 add.w      d1,2(a7)
[000319e0] 2268 025c                 movea.l    604(a0),a1
[000319e4] 3429 0036                 move.w     54(a1),d2
[000319e8] 947c 001a                 sub.w      #$001A,d2
[000319ec] 6712                      beq.s      $00031A00
[000319ee] 5542                      subq.w     #2,d2
[000319f0] 6706                      beq.s      $000319F8
[000319f2] 5942                      subq.w     #4,d2
[000319f4] 6712                      beq.s      $00031A08
[000319f6] 6016                      bra.s      $00031A0E
[000319f8] 006b 0004 0022            ori.w      #$0004,34(a3)
[000319fe] 600e                      bra.s      $00031A0E
[00031a00] 006b 0004 003a            ori.w      #$0004,58(a3)
[00031a06] 6006                      bra.s      $00031A0E
[00031a08] 006b 0004 0052            ori.w      #$0004,82(a3)
[00031a0e] 322f 0002                 move.w     2(a7),d1
[00031a12] 3017                      move.w     (a7),d0
[00031a14] 224b                      movea.l    a3,a1
[00031a16] 2054                      movea.l    (a4),a0
[00031a18] 2068 0258                 movea.l    600(a0),a0
[00031a1c] 4eb9 0004 e84a            jsr        Ame_popup
[00031a22] 3600                      move.w     d0,d3
[00031a24] 5340                      subq.w     #1,d0
[00031a26] 670a                      beq.s      $00031A32
[00031a28] 5340                      subq.w     #1,d0
[00031a2a] 6726                      beq.s      $00031A52
[00031a2c] 5340                      subq.w     #1,d0
[00031a2e] 6742                      beq.s      $00031A72
[00031a30] 605e                      bra.s      $00031A90
[00031a32] 2054                      movea.l    (a4),a0
[00031a34] 2268 025c                 movea.l    604(a0),a1
[00031a38] 337c 001c 0036            move.w     #$001C,54(a1)
[00031a3e] 43ea fe69                 lea.l      -407(a2),a1
[00031a42] 7007                      moveq.l    #7,d0
[00031a44] 2054                      movea.l    (a4),a0
[00031a46] 2068 025c                 movea.l    604(a0),a0
[00031a4a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031a50] 603e                      bra.s      $00031A90
[00031a52] 2054                      movea.l    (a4),a0
[00031a54] 2268 025c                 movea.l    604(a0),a1
[00031a58] 337c 001a 0036            move.w     #$001A,54(a1)
[00031a5e] 43ea fe72                 lea.l      -398(a2),a1
[00031a62] 7007                      moveq.l    #7,d0
[00031a64] 2054                      movea.l    (a4),a0
[00031a66] 2068 025c                 movea.l    604(a0),a0
[00031a6a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031a70] 601e                      bra.s      $00031A90
[00031a72] 2054                      movea.l    (a4),a0
[00031a74] 2268 025c                 movea.l    604(a0),a1
[00031a78] 337c 0020 0036            move.w     #$0020,54(a1)
[00031a7e] 43ea fe7b                 lea.l      -389(a2),a1
[00031a82] 7007                      moveq.l    #7,d0
[00031a84] 2054                      movea.l    (a4),a0
[00031a86] 2068 025c                 movea.l    604(a0),a0
[00031a8a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031a90] 4a43                      tst.w      d3
[00031a92] 6f2c                      ble.s      $00031AC0
[00031a94] 72ff                      moveq.l    #-1,d1
[00031a96] 7005                      moveq.l    #5,d0
[00031a98] 2054                      movea.l    (a4),a0
[00031a9a] 2068 0258                 movea.l    600(a0),a0
[00031a9e] 2254                      movea.l    (a4),a1
[00031aa0] 2469 0258                 movea.l    600(a1),a2
[00031aa4] 226a 0066                 movea.l    102(a2),a1
[00031aa8] 4e91                      jsr        (a1)
[00031aaa] 72ff                      moveq.l    #-1,d1
[00031aac] 7001                      moveq.l    #1,d0
[00031aae] 2054                      movea.l    (a4),a0
[00031ab0] 2068 0258                 movea.l    600(a0),a0
[00031ab4] 2254                      movea.l    (a4),a1
[00031ab6] 2469 0258                 movea.l    600(a1),a2
[00031aba] 226a 0066                 movea.l    102(a2),a1
[00031abe] 4e91                      jsr        (a1)
[00031ac0] 204b                      movea.l    a3,a0
[00031ac2] 4eb9 0004 f20a            jsr        Aob_delete
[00031ac8] 504f                      addq.w     #8,a7
[00031aca] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00031ace] 4e75                      rts

; start editor\edobstrm.c

edst_ok:
[00031ad0] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00031ad4] 594f                      subq.w     #4,a7
[00031ad6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031adc] 2068 0258                 movea.l    600(a0),a0
[00031ae0] 2468 0014                 movea.l    20(a0),a2
[00031ae4] 2650                      movea.l    (a0),a3
[00031ae6] 2853                      movea.l    (a3),a4
[00031ae8] 006c 0001 0006            ori.w      #$0001,6(a4)
[00031aee] 206b 0004                 movea.l    4(a3),a0
[00031af2] 2a68 0004                 movea.l    4(a0),a5
[00031af6] 322b 000a                 move.w     10(a3),d1
[00031afa] 48c1                      ext.l      d1
[00031afc] 2001                      move.l     d1,d0
[00031afe] e788                      lsl.l      #3,d0
[00031b00] 9081                      sub.l      d1,d0
[00031b02] e788                      lsl.l      #3,d0
[00031b04] dbc0                      adda.l     d0,a5
[00031b06] 3b6a 0036 000e            move.w     54(a2),14(a5)
[00031b0c] 43d7                      lea.l      (a7),a1
[00031b0e] 7003                      moveq.l    #3,d0
[00031b10] 41ea 0138                 lea.l      312(a2),a0
[00031b14] 4eb9 0006 a068            jsr        Auo_boxed
[00031b1a] 2057                      movea.l    (a7),a0
[00031b1c] 4eb9 0008 2f6c            jsr        strlen
[00031b22] 2600                      move.l     d0,d3
[00031b24] 2f17                      move.l     (a7),-(a7)
[00031b26] 226d 0014                 movea.l    20(a5),a1
[00031b2a] 204c                      movea.l    a4,a0
[00031b2c] 4eb9 0003 607a            jsr        change_string
[00031b32] 584f                      addq.w     #4,a7
[00031b34] b66d 001c                 cmp.w      28(a5),d3
[00031b38] 6f04                      ble.s      $00031B3E
[00031b3a] 3b43 001c                 move.w     d3,28(a5)
[00031b3e] 4eb9 0002 f27c            jsr        ed_abort
[00031b44] 584f                      addq.w     #4,a7
[00031b46] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00031b4a] 4e75                      rts
set_str:
[00031b4c] 48e7 0038                 movem.l    a2-a4,-(a7)
[00031b50] 2648                      movea.l    a0,a3
[00031b52] 49f9 000c af6c            lea.l      sm,a4
[00031b58] 41ec feb0                 lea.l      -336(a4),a0
[00031b5c] 4eb9 0004 f064            jsr        Aob_create
[00031b62] 2448                      movea.l    a0,a2
[00031b64] 200a                      move.l     a2,d0
[00031b66] 6606                      bne.s      $00031B6E
[00031b68] 91c8                      suba.l     a0,a0
[00031b6a] 6000 007a                 bra.w      $00031BE6
[00031b6e] 700d                      moveq.l    #13,d0
[00031b70] 224a                      movea.l    a2,a1
[00031b72] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031b78] 2068 0258                 movea.l    600(a0),a0
[00031b7c] 4eb9 0003 0b9a            jsr        oe_beself
[00031b82] 356b 000e 0036            move.w     14(a3),54(a2)
[00031b88] 356b 0012 003a            move.w     18(a3),58(a2)
[00031b8e] 206b 0014                 movea.l    20(a3),a0
[00031b92] 2268 0004                 movea.l    4(a0),a1
[00031b96] 700d                      moveq.l    #13,d0
[00031b98] 204a                      movea.l    a2,a0
[00031b9a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031ba0] 302b 000e                 move.w     14(a3),d0
[00031ba4] 907c 001a                 sub.w      #$001A,d0
[00031ba8] 671a                      beq.s      $00031BC4
[00031baa] 5540                      subq.w     #2,d0
[00031bac] 6706                      beq.s      $00031BB4
[00031bae] 5940                      subq.w     #4,d0
[00031bb0] 6722                      beq.s      $00031BD4
[00031bb2] 602e                      bra.s      $00031BE2
[00031bb4] 43ec fcb9                 lea.l      -839(a4),a1
[00031bb8] 7007                      moveq.l    #7,d0
[00031bba] 204a                      movea.l    a2,a0
[00031bbc] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031bc2] 601e                      bra.s      $00031BE2
[00031bc4] 43ec fcc2                 lea.l      -830(a4),a1
[00031bc8] 7007                      moveq.l    #7,d0
[00031bca] 204a                      movea.l    a2,a0
[00031bcc] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031bd2] 600e                      bra.s      $00031BE2
[00031bd4] 43ec fccb                 lea.l      -821(a4),a1
[00031bd8] 7007                      moveq.l    #7,d0
[00031bda] 204a                      movea.l    a2,a0
[00031bdc] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031be2] 288a                      move.l     a2,(a4)
[00031be4] 204c                      movea.l    a4,a0
[00031be6] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00031bea] 4e75                      rts
