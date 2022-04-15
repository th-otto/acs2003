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

	.data

TEXT_003:
[000cac0a]                           dc.w $4f4b
[000cac0c]                           dc.w $0041
[000cac0e]                           dc.b 'bbruch',0
TEXT_02:
[000cac15]                           dc.b 'Text:',0
TEXT_03:
[000cac1b]                           dc.b 'Typ:',0
TEXT_030:
[000cac20]                           dc.b 'TEXT',0
TYPE0:
[000cac25]                           dc.b '  String',0
TYPE1:
[000cac2e]                           dc.b '  Button',0
TYPE2:
[000cac37]                           dc.b '  Titel',0
help_title:
[000cac3f]                           dc.b 'Der String-Editor',0
title:
[000cac51]                           dc.b ' STRINGS -',0
A_3DBUTTON01:
[000cac5c] 00064a22                  dc.l A_3Dbutton
[000cac60]                           dc.w $29f1
[000cac62]                           dc.w $0178
[000cac64] 000630f2                  dc.l Auo_string
[000cac68]                           dc.w $0000
[000cac6a]                           dc.w $0000
[000cac6c]                           dc.w $0000
[000cac6e]                           dc.w $0000
[000cac70]                           dc.w $0000
[000cac72]                           dc.w $0000
[000cac74]                           dc.w $0000
[000cac76]                           dc.w $0000
[000cac78]                           dc.w $0000
[000cac7a]                           dc.w $0000
A_3DBUTTON02:
[000cac7c] 00064a22                  dc.l A_3Dbutton
[000cac80]                           dc.w $29c1
[000cac82]                           dc.w $0178
[000cac84] 000630f2                  dc.l Auo_string
[000cac88] 000cac0a                  dc.l TEXT_003
[000cac8c]                           dc.w $0000
[000cac8e]                           dc.w $0000
[000cac90]                           dc.w $0000
[000cac92]                           dc.w $0000
[000cac94]                           dc.w $0000
[000cac96]                           dc.w $0000
[000cac98]                           dc.w $0000
[000cac9a]                           dc.w $0000
A_3DBUTTON04:
[000cac9c] 00064a22                  dc.l A_3Dbutton
[000caca0]                           dc.w $29c1
[000caca2]                           dc.w $0178
[000caca4] 000630f2                  dc.l Auo_string
[000caca8] 000cac0d                  dc.l TEXT_004
[000cacac]                           dc.w $0000
[000cacae]                           dc.w $0000
[000cacb0]                           dc.w $0000
[000cacb2]                           dc.w $0000
[000cacb4]                           dc.w $0000
[000cacb6]                           dc.w $0000
[000cacb8]                           dc.w $0000
[000cacba]                           dc.w $0000
A_3DBUTTON05:
[000cacbc] 00064a22                  dc.l A_3Dbutton
[000cacc0]                           dc.w $21f1
[000cacc2]                           dc.w $0178
[000cacc4] 000630f2                  dc.l Auo_string
[000cacc8]                           dc.w $0000
[000cacca]                           dc.w $0000
[000caccc]                           dc.w $0000
[000cacce]                           dc.w $0000
[000cacd0]                           dc.w $0000
[000cacd2]                           dc.w $0000
[000cacd4]                           dc.w $0000
[000cacd6]                           dc.w $0000
[000cacd8]                           dc.w $0000
[000cacda]                           dc.w $0000
A_3DBUTTON06:
[000cacdc] 00064a22                  dc.l A_3Dbutton
[000cace0]                           dc.w $09f1
[000cace2]                           dc.w $0178
[000cace4] 000630f2                  dc.l Auo_string
[000cace8] 000cac2e                  dc.l TYPE1
[000cacec]                           dc.w $0000
[000cacee]                           dc.w $0000
[000cacf0]                           dc.w $0000
[000cacf2]                           dc.w $0000
[000cacf4]                           dc.w $0000
[000cacf6]                           dc.w $0000
[000cacf8]                           dc.w $0000
[000cacfa]                           dc.w $0000
A_3DBUTTON07:
[000cacfc] 00064a22                  dc.l A_3Dbutton
[000cad00]                           dc.w $09f1
[000cad02]                           dc.w $0178
[000cad04] 000630f2                  dc.l Auo_string
[000cad08] 000cac37                  dc.l TYPE2
[000cad0c]                           dc.w $0000
[000cad0e]                           dc.w $0000
[000cad10]                           dc.w $0000
[000cad12]                           dc.w $0000
[000cad14]                           dc.w $0000
[000cad16]                           dc.w $0000
[000cad18]                           dc.w $0000
[000cad1a]                           dc.w $0000
A_3DBUTTON09:
[000cad1c] 00064a22                  dc.l A_3Dbutton
[000cad20]                           dc.w $09f1
[000cad22]                           dc.w $0178
[000cad24] 000630f2                  dc.l Auo_string
[000cad28] 000cac25                  dc.l TYPE0
[000cad2c]                           dc.w $0000
[000cad2e]                           dc.w $0000
[000cad30]                           dc.w $0000
[000cad32]                           dc.w $0000
[000cad34]                           dc.w $0000
[000cad36]                           dc.w $0000
[000cad38]                           dc.w $0000
[000cad3a]                           dc.w $0000
A_3DBUTTON23:
[000cad3c] 00064a22                  dc.l A_3Dbutton
[000cad40]                           dc.w $09f1
[000cad42]                           dc.w $0178
[000cad44] 000630f2                  dc.l Auo_string
[000cad48]                           dc.w $0000
[000cad4a]                           dc.w $0000
[000cad4c]                           dc.w $0000
[000cad4e]                           dc.w $0000
[000cad50]                           dc.w $0000
[000cad52]                           dc.w $0000
[000cad54]                           dc.w $0000
[000cad56]                           dc.w $0000
[000cad58]                           dc.w $0000
[000cad5a]                           dc.w $0000
A_ARROWS02:
[000cad5c] 00065c72                  dc.l A_arrows
[000cad60]                           dc.w $1301
[000cad62]                           dc.w $0001
[000cad64]                           dc.w $0000
[000cad66]                           dc.w $0000
[000cad68]                           dc.w $0000
[000cad6a]                           dc.w $0000
[000cad6c]                           dc.w $0000
[000cad6e]                           dc.w $0000
[000cad70]                           dc.w $0000
[000cad72]                           dc.w $0000
[000cad74]                           dc.w $0000
[000cad76]                           dc.w $0000
[000cad78]                           dc.w $0000
[000cad7a]                           dc.w $0000
A_BOXED01:
[000cad7c] 0006afea                  dc.l A_boxed
[000cad80]                           dc.w $9000
[000cad82]                           dc.w $ff12
[000cad84] 0006a068                  dc.l Auo_boxed
[000cad88]                           dc.w $0000
[000cad8a]                           dc.w $0000
[000cad8c]                           dc.w $0000
[000cad8e]                           dc.w $0000
[000cad90]                           dc.w $0000
[000cad92]                           dc.w $0000
[000cad94]                           dc.w $0000
[000cad96]                           dc.w $0000
[000cad98]                           dc.w $0000
[000cad9a]                           dc.w $0000
A_INNERFRAME02:
[000cad9c] 00064256                  dc.l A_innerframe
[000cada0]                           dc.w $1000
[000cada2]                           dc.w $8f19
[000cada4] 000630f2                  dc.l Auo_string
[000cada8] 000cac15                  dc.l TEXT_02
[000cadac]                           dc.w $0000
[000cadae]                           dc.w $0000
[000cadb0]                           dc.w $0000
[000cadb2]                           dc.w $0000
[000cadb4]                           dc.w $0000
[000cadb6]                           dc.w $0000
[000cadb8]                           dc.w $0000
[000cadba]                           dc.w $0000
POP_TYPESEL:
[000cadbc]                           dc.w $ffff
[000cadbe]                           dc.w $0001
[000cadc0]                           dc.w $0003
[000cadc2]                           dc.w $0014
[000cadc4]                           dc.w $0000
[000cadc6]                           dc.w $0020
[000cadc8]                           dc.w $00ff
[000cadca]                           dc.w $1100
[000cadcc]                           dc.w $0000
[000cadce]                           dc.w $0000
[000cadd0]                           dc.w $000b
[000cadd2]                           dc.w $0003
_01_POP_TYPESEL:
[000cadd4]                           dc.w $0002
[000cadd6]                           dc.w $ffff
[000cadd8]                           dc.w $ffff
[000cadda]                           dc.w $0018
[000caddc]                           dc.w $0041
[000cadde]                           dc.w $0000
[000cade0] 000cad1c                  dc.l A_3DBUTTON09
[000cade4]                           dc.w $0000
[000cade6]                           dc.w $0000
[000cade8]                           dc.w $000b
[000cadea]                           dc.w $0001
_02_POP_TYPESEL:
[000cadec]                           dc.w $0003
[000cadee]                           dc.w $ffff
[000cadf0]                           dc.w $ffff
[000cadf2]                           dc.w $0018
[000cadf4]                           dc.w $0041
[000cadf6]                           dc.w $0000
[000cadf8] 000cacdc                  dc.l A_3DBUTTON06
[000cadfc]                           dc.w $0000
[000cadfe]                           dc.w $0001
[000cae00]                           dc.w $000b
[000cae02]                           dc.w $0001
_03_POP_TYPESEL:
[000cae04]                           dc.w $0000
[000cae06]                           dc.w $ffff
[000cae08]                           dc.w $ffff
[000cae0a]                           dc.w $0018
[000cae0c]                           dc.w $0061
[000cae0e]                           dc.w $0000
[000cae10] 000cacfc                  dc.l A_3DBUTTON07
[000cae14]                           dc.w $0000
[000cae16]                           dc.w $0002
[000cae18]                           dc.w $000b
[000cae1a]                           dc.w $0001
ED_STR:
[000cae1c]                           dc.w $ffff
[000cae1e]                           dc.w $0001
[000cae20]                           dc.w $000c
[000cae22]                           dc.w $0018
[000cae24]                           dc.w $0040
[000cae26]                           dc.w $0010
[000cae28] 000cacbc                  dc.l A_3DBUTTON05
[000cae2c]                           dc.w $0000
[000cae2e]                           dc.w $0000
[000cae30]                           dc.w $003d
[000cae32]                           dc.w $0007
_01_ED_STR:
[000cae34]                           dc.w $0003
[000cae36]                           dc.w $0002
[000cae38]                           dc.w $0002
[000cae3a]                           dc.w $0018
[000cae3c]                           dc.w $0000
[000cae3e]                           dc.w $0010
[000cae40] 000cac5c                  dc.l A_3DBUTTON01
[000cae44]                           dc.w $0000
[000cae46]                           dc.w $0000
[000cae48]                           dc.w $000b
[000cae4a]                           dc.w $0003
_02_ED_STR:
[000cae4c]                           dc.w $0001
[000cae4e]                           dc.w $ffff
[000cae50]                           dc.w $ffff
[000cae52]                           dc.w $001a
[000cae54]                           dc.w $0040
[000cae56]                           dc.w $0000
[000cae58] 000cac20                  dc.l TEXT_030
[000cae5c]                           dc.w $0002
[000cae5e]                           dc.w $0001
[000cae60]                           dc.w $0007
[000cae62]                           dc.w $0001
_03_ED_STR:
[000cae64]                           dc.w $0005
[000cae66]                           dc.w $0004
[000cae68]                           dc.w $0004
[000cae6a]                           dc.w $001c
[000cae6c]                           dc.w $0040
[000cae6e]                           dc.w $0000
[000cae70] 000cac1b                  dc.l TEXT_03
[000cae74]                           dc.w $000d
[000cae76]                           dc.w $0001
[000cae78]                           dc.w $0005
[000cae7a]                           dc.w $0001
_04_ED_STR:
[000cae7c]                           dc.w $0003
[000cae7e]                           dc.w $ffff
[000cae80]                           dc.w $ffff
[000cae82]                           dc.w $0018
[000cae84]                           dc.w $0040
[000cae86]                           dc.w $0000
[000cae88] 000cad5c                  dc.l A_ARROWS02
[000cae8c]                           dc.w $0000
[000cae8e]                           dc.w $0000
[000cae90]                           dc.w $0001
[000cae92]                           dc.w $0001
_05_ED_STR:
[000cae94]                           dc.w $0008
[000cae96]                           dc.w $0007
[000cae98]                           dc.w $0007
[000cae9a]                           dc.w $0014
[000cae9c]                           dc.w $0040
[000cae9e]                           dc.w $0020
[000caea0]                           dc.w $00ff
[000caea2]                           dc.w $1101
[000caea4]                           dc.w $0012
[000caea6]                           dc.w $0001
[000caea8]                           dc.w $000b
[000caeaa]                           dc.w $0001
_05aED_STR:
[000caeac] 00031992                  dc.l edst_type
[000caeb0]                           dc.w $0000
[000caeb2]                           dc.w $0000
[000caeb4]                           dc.w $8000
[000caeb6]                           dc.w $8854
[000caeb8]                           dc.w $0000
[000caeba]                           dc.w $0000
[000caebc]                           dc.w $0000
[000caebe]                           dc.w $0000
[000caec0]                           dc.w $0000
[000caec2]                           dc.w $0000
_07_ED_STR:
[000caec4]                           dc.w $0005
[000caec6]                           dc.w $ffff
[000caec8]                           dc.w $ffff
[000caeca]                           dc.w $0018
[000caecc]                           dc.w $0000
[000caece]                           dc.w $0000
[000caed0] 000cad3c                  dc.l A_3DBUTTON23
[000caed4]                           dc.w $0000
[000caed6]                           dc.w $0000
[000caed8]                           dc.w $000b
[000caeda]                           dc.w $0001
_08_ED_STR:
[000caedc]                           dc.w $000a
[000caede]                           dc.w $ffff
[000caee0]                           dc.w $ffff
[000caee2]                           dc.w $0018
[000caee4]                           dc.w $4007
[000caee6]                           dc.w $0010
[000caee8] 000cac7c                  dc.l A_3DBUTTON02
[000caeec]                           dc.w $0021
[000caeee]                           dc.w $0001
[000caef0]                           dc.w $000c
[000caef2]                           dc.w $0002
_08aED_STR:
[000caef4] 00031ad0                  dc.l edst_ok
[000caef8]                           dc.w $0000
[000caefa]                           dc.w $0000
[000caefc]                           dc.w $8000
[000caefe]                           dc.w $884f
[000caf00]                           dc.w $0000
[000caf02]                           dc.w $0000
[000caf04]                           dc.w $0000
[000caf06]                           dc.w $0000
[000caf08]                           dc.w $0000
[000caf0a]                           dc.w $0000
_10_ED_STR:
[000caf0c]                           dc.w $000c
[000caf0e]                           dc.w $ffff
[000caf10]                           dc.w $ffff
[000caf12]                           dc.w $0018
[000caf14]                           dc.w $4005
[000caf16]                           dc.w $0010
[000caf18] 000cac9c                  dc.l A_3DBUTTON04
[000caf1c]                           dc.w $002f
[000caf1e]                           dc.w $0001
[000caf20]                           dc.w $000c
[000caf22]                           dc.w $0002
_10aED_STR:
[000caf24] 0002f27c                  dc.l ed_abort
[000caf28]                           dc.w $0000
[000caf2a]                           dc.w $0000
[000caf2c]                           dc.w $8000
[000caf2e]                           dc.w $8841
[000caf30]                           dc.w $0000
[000caf32]                           dc.w $0000
[000caf34]                           dc.w $0000
[000caf36]                           dc.w $0000
[000caf38]                           dc.w $0000
[000caf3a]                           dc.w $0000
_12_ED_STR:
[000caf3c]                           dc.w $0000
[000caf3e]                           dc.w $000d
[000caf40]                           dc.w $000d
[000caf42]                           dc.w $0018
[000caf44]                           dc.w $0040
[000caf46]                           dc.w $0000
[000caf48] 000cad9c                  dc.l A_INNERFRAME02
[000caf4c]                           dc.w $0001
[000caf4e]                           dc.w $0003
[000caf50]                           dc.w $003b
[000caf52]                           dc.w $0004
_13_ED_STR:
[000caf54]                           dc.w $000c
[000caf56]                           dc.w $ffff
[000caf58]                           dc.w $ffff
[000caf5a]                           dc.w $0018
[000caf5c]                           dc.w $0028
[000caf5e]                           dc.w $0010
[000caf60] 000cad7c                  dc.l A_BOXED01
[000caf64]                           dc.w $0001
[000caf66]                           dc.w $0002
[000caf68]                           dc.w $0039
[000caf6a]                           dc.w $0001
sm:
[000caf6c]                           dc.w $0000
[000caf6e]                           dc.w $0000
[000caf70] 00031ad0                  dc.l edst_ok
[000caf74] 0004f20a                  dc.l Aob_delete
[000caf78] 000cac51                  dc.l title
[000caf7c] 000cac3f                  dc.l help_title
[000caf80]                           dc.w $0000
[000caf82]                           dc.w $0000

