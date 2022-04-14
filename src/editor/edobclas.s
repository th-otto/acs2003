make_a_window:
[0002ba08] 4eb9 0005 7052            jsr        Awi_create
[0002ba0e] 2008                      move.l     a0,d0
[0002ba10] 6604                      bne.s      $0002BA16
[0002ba12] 91c8                      suba.l     a0,a0
[0002ba14] 4e71                      nop
[0002ba16] 4e75                      rts

; start editor\edobclas.c

close_uc:
[0002ba18] 2f0a                      move.l     a2,-(a7)
[0002ba1a] 2448                      movea.l    a0,a2
[0002ba1c] 5379 000c 9106            subq.w     #1,visible_editors
[0002ba22] 3039 000c 9106            move.w     visible_editors,d0
[0002ba28] 6e18                      bgt.s      $0002BA42
[0002ba2a] 2279 000b b542            movea.l    parts_window,a1
[0002ba30] 3229 0020                 move.w     32(a1),d1
[0002ba34] 6b0c                      bmi.s      $0002BA42
[0002ba36] 2269 0072                 movea.l    114(a1),a1
[0002ba3a] 2079 000b b542            movea.l    parts_window,a0
[0002ba40] 4e91                      jsr        (a1)
[0002ba42] 302a 0020                 move.w     32(a2),d0
[0002ba46] 6b08                      bmi.s      $0002BA50
[0002ba48] 204a                      movea.l    a2,a0
[0002ba4a] 4eb9 0005 8362            jsr        Awi_closed
[0002ba50] 245f                      movea.l    (a7)+,a2
[0002ba52] 4e75                      rts
close_me:
[0002ba54] 2f0a                      move.l     a2,-(a7)
[0002ba56] 2f0b                      move.l     a3,-(a7)
[0002ba58] 2448                      movea.l    a0,a2
[0002ba5a] 2650                      movea.l    (a0),a3
[0002ba5c] 0c6b 0001 0008            cmpi.w     #$0001,8(a3)
[0002ba62] 6706                      beq.s      $0002BA6A
[0002ba64] 202a 0014                 move.l     20(a2),d0
[0002ba68] 6608                      bne.s      $0002BA72
[0002ba6a] 204a                      movea.l    a2,a0
[0002ba6c] 6100 ffaa                 bsr.w      close_uc
[0002ba70] 6010                      bra.s      $0002BA82
[0002ba72] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002ba78] 214a 0258                 move.l     a2,600(a0)
[0002ba7c] 206b 001a                 movea.l    26(a3),a0
[0002ba80] 4e90                      jsr        (a0)
[0002ba82] 265f                      movea.l    (a7)+,a3
[0002ba84] 245f                      movea.l    (a7)+,a2
[0002ba86] 4e75                      rts
open_me:
[0002ba88] 2f0a                      move.l     a2,-(a7)
[0002ba8a] 2448                      movea.l    a0,a2
[0002ba8c] 3039 000c 9106            move.w     visible_editors,d0
[0002ba92] 6616                      bne.s      $0002BAAA
[0002ba94] 2279 000b b542            movea.l    parts_window,a1
[0002ba9a] 2269 000c                 movea.l    12(a1),a1
[0002ba9e] 2079 000b b542            movea.l    parts_window,a0
[0002baa4] 4e91                      jsr        (a1)
[0002baa6] 4a40                      tst.w      d0
[0002baa8] 6618                      bne.s      $0002BAC2
[0002baaa] 5279 000c 9106            addq.w     #1,visible_editors
[0002bab0] 204a                      movea.l    a2,a0
[0002bab2] 4eb9 0005 7428            jsr        Awi_open
[0002bab8] 5240                      addq.w     #1,d0
[0002baba] 660a                      bne.s      $0002BAC6
[0002babc] 204a                      movea.l    a2,a0
[0002babe] 6100 ff58                 bsr        close_uc
[0002bac2] 70ff                      moveq.l    #-1,d0
[0002bac4] 600a                      bra.s      $0002BAD0
[0002bac6] 204a                      movea.l    a2,a0
[0002bac8] 4eb9 0002 5072            jsr        glue_parts
[0002bace] 4240                      clr.w      d0
[0002bad0] 245f                      movea.l    (a7)+,a2
[0002bad2] 4e75                      rts
top_me:
[0002bad4] 2f0a                      move.l     a2,-(a7)
[0002bad6] 2448                      movea.l    a0,a2
[0002bad8] 3039 000c 9106            move.w     visible_editors,d0
[0002bade] 6714                      beq.s      $0002BAF4
[0002bae0] 2079 000b b542            movea.l    parts_window,a0
[0002bae6] 4eb9 0005 6bea            jsr        Awi_show
[0002baec] 204a                      movea.l    a2,a0
[0002baee] 4eb9 0002 5072            jsr        glue_parts
[0002baf4] 204a                      movea.l    a2,a0
[0002baf6] 4eb9 0005 87a4            jsr        Awi_topped
[0002bafc] 245f                      movea.l    (a7)+,a2
[0002bafe] 4e75                      rts
move_me:
[0002bb00] 2f0b                      move.l     a3,-(a7)
[0002bb02] 2648                      movea.l    a0,a3
[0002bb04] 4eb9 0005 8d50            jsr        Awi_moved
[0002bb0a] 204b                      movea.l    a3,a0
[0002bb0c] 4eb9 0002 5072            jsr        glue_parts
[0002bb12] 265f                      movea.l    (a7)+,a3
[0002bb14] 4e75                      rts
key_me:
[0002bb16] 48e7 1820                 movem.l    d3-d4/a2,-(a7)
[0002bb1a] 2448                      movea.l    a0,a2
[0002bb1c] 3800                      move.w     d0,d4
[0002bb1e] 3601                      move.w     d1,d3
[0002bb20] 2050                      movea.l    (a0),a0
[0002bb22] 2408                      move.l     a0,d2
[0002bb24] 6700 0090                 beq        $0002BBB6
[0002bb28] 0c68 0001 0008            cmpi.w     #$0001,8(a0)
[0002bb2e] 6600 0086                 bne        $0002BBB6
[0002bb32] 72ff                      moveq.l    #-1,d1
[0002bb34] c203                      and.b      d3,d1
[0002bb36] b23c 000e                 cmp.b      #$0E,d1
[0002bb3a] 675a                      beq.s      $0002BB96
[0002bb3c] 4a43                      tst.w      d3
[0002bb3e] 6f60                      ble.s      $0002BBA0
[0002bb40] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002bb46] 214a 0258                 move.l     a2,600(a0)
[0002bb4a] 1001                      move.b     d1,d0
[0002bb4c] 4eb9 0004 64b6            jsr        Ach_toupper
[0002bb52] 4880                      ext.w      d0
[0002bb54] b07c 0050                 cmp.w      #$0050,d0
[0002bb58] 6734                      beq.s      $0002BB8E
[0002bb5a] 6e0e                      bgt.s      $0002BB6A
[0002bb5c] 907c 000e                 sub.w      #$000E,d0
[0002bb60] 6734                      beq.s      $0002BB96
[0002bb62] 907c 0038                 sub.w      #$0038,d0
[0002bb66] 6716                      beq.s      $0002BB7E
[0002bb68] 6044                      bra.s      $0002BBAE
[0002bb6a] 907c 0052                 sub.w      #$0052,d0
[0002bb6e] 6706                      beq.s      $0002BB76
[0002bb70] 5340                      subq.w     #1,d0
[0002bb72] 6712                      beq.s      $0002BB86
[0002bb74] 6038                      bra.s      $0002BBAE
[0002bb76] 4eb9 0002 f420            jsr        edob_refs
[0002bb7c] 6034                      bra.s      $0002BBB2
[0002bb7e] 4eb9 0002 f708            jsr        edob_aflags
[0002bb84] 602c                      bra.s      $0002BBB2
[0002bb86] 4eb9 0002 f856            jsr        edob_specs
[0002bb8c] 6024                      bra.s      $0002BBB2
[0002bb8e] 4eb9 0003 05bc            jsr        edob_pos
[0002bb94] 601c                      bra.s      $0002BBB2
[0002bb96] 204a                      movea.l    a2,a0
[0002bb98] 4eb9 0005 3456            jsr        Awi_help
[0002bb9e] 6012                      bra.s      $0002BBB2
[0002bba0] b63c 0009                 cmp.b      #$09,d3
[0002bba4] 6608                      bne.s      $0002BBAE
[0002bba6] 4eb9 0002 e632            jsr        edob_next
[0002bbac] 6004                      bra.s      $0002BBB2
[0002bbae] 70ff                      moveq.l    #-1,d0
[0002bbb0] 6010                      bra.s      $0002BBC2
[0002bbb2] 4240                      clr.w      d0
[0002bbb4] 600c                      bra.s      $0002BBC2
[0002bbb6] 3203                      move.w     d3,d1
[0002bbb8] 3004                      move.w     d4,d0
[0002bbba] 204a                      movea.l    a2,a0
[0002bbbc] 4eb9 0006 b744            jsr        Awi_keys
[0002bbc2] 4cdf 0418                 movem.l    (a7)+,d3-d4/a2
[0002bbc6] 4e75                      rts
eded_info:
[0002bbc8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002bbce] 2068 0258                 movea.l    600(a0),a0
[0002bbd2] 4eb9 0002 bbe8            jsr        ed_info
[0002bbd8] 4e75                      rts
eded_parts:
[0002bbda] 2079 000b b542            movea.l    parts_window,a0
[0002bbe0] 4eb9 0005 6bea            jsr        Awi_show
[0002bbe6] 4e75                      rts
ed_info:
[0002bbe8] 48e7 0038                 movem.l    a2-a4,-(a7)
[0002bbec] 4fef fff6                 lea.l      -10(a7),a7
[0002bbf0] 2450                      movea.l    (a0),a2
[0002bbf2] 266a 0004                 movea.l    4(a2),a3
[0002bbf6] 41f9 000c 8c98            lea.l      WI_INFO,a0
[0002bbfc] 2279 000c 8ca0            movea.l    $000C8CA0,a1
[0002bc02] 4e91                      jsr        (a1)
[0002bc04] 2848                      movea.l    a0,a4
[0002bc06] 200c                      move.l     a4,d0
[0002bc08] 6760                      beq.s      $0002BC6A
[0002bc0a] 2252                      movea.l    (a2),a1
[0002bc0c] 2269 0008                 movea.l    8(a1),a1
[0002bc10] 206c 0014                 movea.l    20(a4),a0
[0002bc14] 7004                      moveq.l    #4,d0
[0002bc16] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002bc1c] 43eb 0016                 lea.l      22(a3),a1
[0002bc20] 7005                      moveq.l    #5,d0
[0002bc22] 206c 0014                 movea.l    20(a4),a0
[0002bc26] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002bc2c] 202b 000e                 move.l     14(a3),d0
[0002bc30] 7238                      moveq.l    #56,d1
[0002bc32] 4eb9 0008 3c5a            jsr        _uldiv
[0002bc38] 2f00                      move.l     d0,-(a7)
[0002bc3a] 43f9 000c 91a8            lea.l      $000C91A8,a1
[0002bc40] 41ef 0004                 lea.l      4(a7),a0
[0002bc44] 4eb9 0008 15ac            jsr        sprintf
[0002bc4a] 584f                      addq.w     #4,a7
[0002bc4c] 43d7                      lea.l      (a7),a1
[0002bc4e] 7006                      moveq.l    #6,d0
[0002bc50] 206c 0014                 movea.l    20(a4),a0
[0002bc54] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002bc5a] 204c                      movea.l    a4,a0
[0002bc5c] 4eb9 0005 9df4            jsr        Awi_dialog
[0002bc62] 204c                      movea.l    a4,a0
[0002bc64] 4eb9 0005 85f2            jsr        Awi_delete
[0002bc6a] 4fef 000a                 lea.l      10(a7),a7
[0002bc6e] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0002bc72] 4e75                      rts
eded_keys:
[0002bc74] 48e7 1c38                 movem.l    d3-d5/a2-a4,-(a7)
[0002bc78] 4fef ffdc                 lea.l      -36(a7),a7
[0002bc7c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002bc82] 2268 0258                 movea.l    600(a0),a1
[0002bc86] 2f51 0020                 move.l     (a1),32(a7)
[0002bc8a] 206f 0020                 movea.l    32(a7),a0
[0002bc8e] 2868 0004                 movea.l    4(a0),a4
[0002bc92] 266c 0004                 movea.l    4(a4),a3
[0002bc96] 202c 000e                 move.l     14(a4),d0
[0002bc9a] 7238                      moveq.l    #56,d1
[0002bc9c] 4eb9 0008 3c5a            jsr        _uldiv
[0002bca2] 2600                      move.l     d0,d3
[0002bca4] 4244                      clr.w      d4
[0002bca6] 6000 00ce                 bra        $0002BD76
[0002bcaa] 102b 000f                 move.b     15(a3),d0
[0002bcae] 4880                      ext.w      d0
[0002bcb0] 907c 0015                 sub.w      #$0015,d0
[0002bcb4] b07c 000b                 cmp.w      #$000B,d0
[0002bcb8] 6234                      bhi.s      $0002BCEE
[0002bcba] d040                      add.w      d0,d0
[0002bcbc] 303b 0006                 move.w     $0002BCC4(pc,d0.w),d0
[0002bcc0] 4efb 0002                 jmp        $0002BCC4(pc,d0.w)
J15:
[0002bcc4] 001e                      dc.w $001e   ; $0002bce2-$0002bcc4
[0002bcc6] 001e                      dc.w $001e   ; $0002bce2-$0002bcc4
[0002bcc8] 002a                      dc.w $002a   ; $0002bcee-$0002bcc4
[0002bcca] 002a                      dc.w $002a   ; $0002bcee-$0002bcc4
[0002bccc] 002a                      dc.w $002a   ; $0002bcee-$0002bcc4
[0002bcce] 0018                      dc.w $0018   ; $0002bcdc-$0002bcc4
[0002bcd0] 002a                      dc.w $002a   ; $0002bcee-$0002bcc4
[0002bcd2] 0018                      dc.w $0018   ; $0002bcdc-$0002bcc4
[0002bcd4] 002a                      dc.w $002a   ; $0002bcee-$0002bcc4
[0002bcd6] 002a                      dc.w $002a   ; $0002bcee-$0002bcc4
[0002bcd8] 002a                      dc.w $002a   ; $0002bcee-$0002bcc4
[0002bcda] 0018                      dc.w $0018   ; $0002bcdc-$0002bcc4
[0002bcdc] 286b 0014                 movea.l    20(a3),a4
[0002bce0] 600e                      bra.s      $0002BCF0
[0002bce2] 206b 0014                 movea.l    20(a3),a0
[0002bce6] 2068 0004                 movea.l    4(a0),a0
[0002bcea] 2850                      movea.l    (a0),a4
[0002bcec] 6002                      bra.s      $0002BCF0
[0002bcee] 99cc                      suba.l     a4,a4
[0002bcf0] 200c                      move.l     a4,d0
[0002bcf2] 6700 007c                 beq.w      $0002BD70
[0002bcf6] 246c 0004                 movea.l    4(a4),a2
[0002bcfa] 204a                      movea.l    a2,a0
[0002bcfc] 4eb9 0008 2f6c            jsr        strlen
[0002bd02] 2a00                      move.l     d0,d5
[0002bd04] ba7c 001e                 cmp.w      #$001E,d5
[0002bd08] 6f06                      ble.s      $0002BD10
[0002bd0a] 9a7c 001e                 sub.w      #$001E,d5
[0002bd0e] 6002                      bra.s      $0002BD12
[0002bd10] 4245                      clr.w      d5
[0002bd12] 4217                      clr.b      (a7)
[0002bd14] 701e                      moveq.l    #30,d0
[0002bd16] 43f2 5000                 lea.l      0(a2,d5.w),a1
[0002bd1a] 41d7                      lea.l      (a7),a0
[0002bd1c] 4eb9 0008 2f96            jsr        strncat
[0002bd22] 4eb9 0008 2f6c            jsr        strlen
[0002bd28] 3a00                      move.w     d0,d5
[0002bd2a] 6002                      bra.s      $0002BD2E
[0002bd2c] 5345                      subq.w     #1,d5
[0002bd2e] 4a45                      tst.w      d5
[0002bd30] 6f08                      ble.s      $0002BD3A
[0002bd32] 0c37 0020 50ff            cmpi.b     #$20,-1(a7,d5.w)
[0002bd38] 67f2                      beq.s      $0002BD2C
[0002bd3a] 4a45                      tst.w      d5
[0002bd3c] 6732                      beq.s      $0002BD70
[0002bd3e] 4237 5000                 clr.b      0(a7,d5.w)
[0002bd42] 7020                      moveq.l    #32,d0
[0002bd44] 41d7                      lea.l      (a7),a0
[0002bd46] 4eb9 0008 2e9e            jsr        strrchr
[0002bd4c] 2448                      movea.l    a0,a2
[0002bd4e] 200a                      move.l     a2,d0
[0002bd50] 671e                      beq.s      $0002BD70
[0002bd52] 41ea 0001                 lea.l      1(a2),a0
[0002bd56] 4eb9 0003 325a            jsr        key_code
[0002bd5c] 3a00                      move.w     d0,d5
[0002bd5e] 6710                      beq.s      $0002BD70
[0002bd60] 206f 0020                 movea.l    32(a7),a0
[0002bd64] 2250                      movea.l    (a0),a1
[0002bd66] 0069 0001 0006            ori.w      #$0001,6(a1)
[0002bd6c] 3740 002a                 move.w     d0,42(a3)
[0002bd70] 47eb 0038                 lea.l      56(a3),a3
[0002bd74] 5244                      addq.w     #1,d4
[0002bd76] b644                      cmp.w      d4,d3
[0002bd78] 6e00 ff30                 bgt        $0002BCAA
[0002bd7c] 4fef 0024                 lea.l      36(a7),a7
[0002bd80] 4cdf 1c38                 movem.l    (a7)+,d3-d5/a2-a4
[0002bd84] 4e75                      rts
click_ans:
[0002bd86] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0002bd8a] 3600                      move.w     d0,d3
[0002bd8c] 2650                      movea.l    (a0),a3
[0002bd8e] 41f9 000c 8fc2            lea.l      WI_TRYCLICK,a0
[0002bd94] 2279 000c 8fca            movea.l    $000C8FCA,a1
[0002bd9a] 4e91                      jsr        (a1)
[0002bd9c] 2448                      movea.l    a0,a2
[0002bd9e] 200a                      move.l     a2,d0
[0002bda0] 6606                      bne.s      $0002BDA8
[0002bda2] 4240                      clr.w      d0
[0002bda4] 6000 00c4                 bra        $0002BE6A
[0002bda8] 705c                      moveq.l    #92,d0
[0002bdaa] 2053                      movea.l    (a3),a0
[0002bdac] 2068 0008                 movea.l    8(a0),a0
[0002bdb0] 4eb9 0008 2e9e            jsr        strrchr
[0002bdb6] 2248                      movea.l    a0,a1
[0002bdb8] 5249                      addq.w     #1,a1
[0002bdba] 7003                      moveq.l    #3,d0
[0002bdbc] 206a 0014                 movea.l    20(a2),a0
[0002bdc0] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002bdc6] 226b 0004                 movea.l    4(a3),a1
[0002bdca] 43e9 0016                 lea.l      22(a1),a1
[0002bdce] 7005                      moveq.l    #5,d0
[0002bdd0] 206a 0014                 movea.l    20(a2),a0
[0002bdd4] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002bdda] 206b 0004                 movea.l    4(a3),a0
[0002bdde] 2668 0004                 movea.l    4(a0),a3
[0002bde2] 3203                      move.w     d3,d1
[0002bde4] e241                      asr.w      #1,d1
[0002bde6] 48c1                      ext.l      d1
[0002bde8] 2001                      move.l     d1,d0
[0002bdea] e788                      lsl.l      #3,d0
[0002bdec] 9081                      sub.l      d1,d0
[0002bdee] e788                      lsl.l      #3,d0
[0002bdf0] 2873 0820                 movea.l    32(a3,d0.l),a4
[0002bdf4] 240c                      move.l     a4,d2
[0002bdf6] 6614                      bne.s      $0002BE0C
[0002bdf8] 43f9 000c 91ad            lea.l      $000C91AD,a1
[0002bdfe] 206a 0014                 movea.l    20(a2),a0
[0002be02] 7007                      moveq.l    #7,d0
[0002be04] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002be0a] 6010                      bra.s      $0002BE1C
[0002be0c] 43ec 0016                 lea.l      22(a4),a1
[0002be10] 7007                      moveq.l    #7,d0
[0002be12] 206a 0014                 movea.l    20(a2),a0
[0002be16] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002be1c] 3203                      move.w     d3,d1
[0002be1e] e241                      asr.w      #1,d1
[0002be20] 48c1                      ext.l      d1
[0002be22] 2001                      move.l     d1,d0
[0002be24] e788                      lsl.l      #3,d0
[0002be26] 9081                      sub.l      d1,d0
[0002be28] e788                      lsl.l      #3,d0
[0002be2a] 2873 0800                 movea.l    0(a3,d0.l),a4
[0002be2e] 240c                      move.l     a4,d2
[0002be30] 6614                      bne.s      $0002BE46
[0002be32] 43f9 000c 91ad            lea.l      $000C91AD,a1
[0002be38] 206a 0014                 movea.l    20(a2),a0
[0002be3c] 7009                      moveq.l    #9,d0
[0002be3e] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002be44] 6010                      bra.s      $0002BE56
[0002be46] 43ec 0016                 lea.l      22(a4),a1
[0002be4a] 7009                      moveq.l    #9,d0
[0002be4c] 206a 0014                 movea.l    20(a2),a0
[0002be50] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002be56] 204a                      movea.l    a2,a0
[0002be58] 4eb9 0005 9df4            jsr        Awi_dialog
[0002be5e] 3600                      move.w     d0,d3
[0002be60] 204a                      movea.l    a2,a0
[0002be62] 4eb9 0005 85f2            jsr        Awi_delete
[0002be68] 3003                      move.w     d3,d0
[0002be6a] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0002be6e] 4e75                      rts
try_click:
[0002be70] 48e7 0038                 movem.l    a2-a4,-(a7)
[0002be74] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0002be7a] 2052                      movea.l    (a2),a0
[0002be7c] 2668 0258                 movea.l    600(a0),a3
[0002be80] 2868 025c                 movea.l    604(a0),a4
[0002be84] 3028 0260                 move.w     608(a0),d0
[0002be88] 204b                      movea.l    a3,a0
[0002be8a] 6100 fefa                 bsr        click_ans
[0002be8e] b07c 000a                 cmp.w      #$000A,d0
[0002be92] 671c                      beq.s      $0002BEB0
[0002be94] b9eb 0014                 cmpa.l     20(a3),a4
[0002be98] 6706                      beq.s      $0002BEA0
[0002be9a] b9eb 005e                 cmpa.l     94(a3),a4
[0002be9e] 6608                      bne.s      $0002BEA8
[0002bea0] 4eb9 0002 f27c            jsr        ed_abort
[0002bea6] 6008                      bra.s      $0002BEB0
[0002bea8] 2052                      movea.l    (a2),a0
[0002beaa] 317c 0001 0268            move.w     #$0001,616(a0)
[0002beb0] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0002beb4] 4e75                      rts
try_drag:
[0002beb6] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0002beba] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002bec0] 2268 0258                 movea.l    600(a0),a1
[0002bec4] 2651                      movea.l    (a1),a3
[0002bec6] 3628 0260                 move.w     608(a0),d3
[0002beca] 41f9 000c 9064            lea.l      WI_TRYDRAG,a0
[0002bed0] 2279 000c 906c            movea.l    $000C906C,a1
[0002bed6] 4e91                      jsr        (a1)
[0002bed8] 2448                      movea.l    a0,a2
[0002beda] 200a                      move.l     a2,d0
[0002bedc] 6700 00e0                 beq        $0002BFBE
[0002bee0] 705c                      moveq.l    #92,d0
[0002bee2] 2253                      movea.l    (a3),a1
[0002bee4] 2069 0008                 movea.l    8(a1),a0
[0002bee8] 4eb9 0008 2e9e            jsr        strrchr
[0002beee] 2248                      movea.l    a0,a1
[0002bef0] 5249                      addq.w     #1,a1
[0002bef2] 7003                      moveq.l    #3,d0
[0002bef4] 206a 0014                 movea.l    20(a2),a0
[0002bef8] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002befe] 226b 0004                 movea.l    4(a3),a1
[0002bf02] 43e9 0016                 lea.l      22(a1),a1
[0002bf06] 7005                      moveq.l    #5,d0
[0002bf08] 206a 0014                 movea.l    20(a2),a0
[0002bf0c] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002bf12] 206b 0004                 movea.l    4(a3),a0
[0002bf16] 2668 0004                 movea.l    4(a0),a3
[0002bf1a] 3203                      move.w     d3,d1
[0002bf1c] e241                      asr.w      #1,d1
[0002bf1e] 48c1                      ext.l      d1
[0002bf20] 2001                      move.l     d1,d0
[0002bf22] e788                      lsl.l      #3,d0
[0002bf24] 9081                      sub.l      d1,d0
[0002bf26] e788                      lsl.l      #3,d0
[0002bf28] 2873 0824                 movea.l    36(a3,d0.l),a4
[0002bf2c] 240c                      move.l     a4,d2
[0002bf2e] 6614                      bne.s      $0002BF44
[0002bf30] 43f9 000c 91ad            lea.l      $000C91AD,a1
[0002bf36] 206a 0014                 movea.l    20(a2),a0
[0002bf3a] 7007                      moveq.l    #7,d0
[0002bf3c] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002bf42] 6010                      bra.s      $0002BF54
[0002bf44] 43ec 0016                 lea.l      22(a4),a1
[0002bf48] 7007                      moveq.l    #7,d0
[0002bf4a] 206a 0014                 movea.l    20(a2),a0
[0002bf4e] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002bf54] 3203                      move.w     d3,d1
[0002bf56] e241                      asr.w      #1,d1
[0002bf58] 48c1                      ext.l      d1
[0002bf5a] 2001                      move.l     d1,d0
[0002bf5c] e788                      lsl.l      #3,d0
[0002bf5e] 9081                      sub.l      d1,d0
[0002bf60] e788                      lsl.l      #3,d0
[0002bf62] 2873 0800                 movea.l    0(a3,d0.l),a4
[0002bf66] 240c                      move.l     a4,d2
[0002bf68] 6614                      bne.s      $0002BF7E
[0002bf6a] 43f9 000c 91ad            lea.l      $000C91AD,a1
[0002bf70] 206a 0014                 movea.l    20(a2),a0
[0002bf74] 7009                      moveq.l    #9,d0
[0002bf76] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002bf7c] 6010                      bra.s      $0002BF8E
[0002bf7e] 43ec 0016                 lea.l      22(a4),a1
[0002bf82] 7009                      moveq.l    #9,d0
[0002bf84] 206a 0014                 movea.l    20(a2),a0
[0002bf88] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002bf8e] 204a                      movea.l    a2,a0
[0002bf90] 4eb9 0005 9df4            jsr        Awi_dialog
[0002bf96] 3600                      move.w     d0,d3
[0002bf98] 204a                      movea.l    a2,a0
[0002bf9a] 4eb9 0005 85f2            jsr        Awi_delete
[0002bfa0] b67c 000a                 cmp.w      #$000A,d3
[0002bfa4] 6612                      bne.s      $0002BFB8
[0002bfa6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002bfac] 4268 024a                 clr.w      586(a0)
[0002bfb0] 4eb9 0004 810e            jsr        Adr_unselect
[0002bfb6] 6006                      bra.s      $0002BFBE
[0002bfb8] 4eb9 0002 f27c            jsr        ed_abort
[0002bfbe] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0002bfc2] 4e75                      rts
fix_cicon:
[0002bfc4] 48e7 0038                 movem.l    a2-a4,-(a7)
[0002bfc8] 2648                      movea.l    a0,a3
[0002bfca] 7052                      moveq.l    #82,d0
[0002bfcc] 4eb9 0004 c608            jsr        Ax_malloc
[0002bfd2] 2448                      movea.l    a0,a2
[0002bfd4] 200a                      move.l     a2,d0
[0002bfd6] 6700 008a                 beq        $0002C062
[0002bfda] 224b                      movea.l    a3,a1
[0002bfdc] 7052                      moveq.l    #82,d0
[0002bfde] 4eb9 0008 3500            jsr        memcpy
[0002bfe4] 200b                      move.l     a3,d0
[0002bfe6] d192                      add.l      d0,(a2)
[0002bfe8] d1aa 0004                 add.l      d0,4(a2)
[0002bfec] 206a 0008                 movea.l    8(a2),a0
[0002bff0] 2068 0004                 movea.l    4(a0),a0
[0002bff4] 4eb9 0004 643c            jsr        Ast_create
[0002bffa] 2548 0008                 move.l     a0,8(a2)
[0002bffe] 99cc                      suba.l     a4,a4
[0002c000] 302b 0026                 move.w     38(a3),d0
[0002c004] 6712                      beq.s      $0002C018
[0002c006] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002c00c] 0c69 0004 001c            cmpi.w     #$0004,28(a1)
[0002c012] 6d04                      blt.s      $0002C018
[0002c014] 49ea 0026                 lea.l      38(a2),a4
[0002c018] 302b 003c                 move.w     60(a3),d0
[0002c01c] 6712                      beq.s      $0002C030
[0002c01e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002c024] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[0002c02a] 6d04                      blt.s      $0002C030
[0002c02c] 49ea 003c                 lea.l      60(a2),a4
[0002c030] 254c 0022                 move.l     a4,34(a2)
[0002c034] 200c                      move.l     a4,d0
[0002c036] 6772                      beq.s      $0002C0AA
[0002c038] 206c 0006                 movea.l    6(a4),a0
[0002c03c] 2968 0004 0006            move.l     4(a0),6(a4)
[0002c042] 2f0a                      move.l     a2,-(a7)
[0002c044] 3014                      move.w     (a4),d0
[0002c046] 226c 0006                 movea.l    6(a4),a1
[0002c04a] 206c 0002                 movea.l    2(a4),a0
[0002c04e] 2068 0004                 movea.l    4(a0),a0
[0002c052] 4eb9 0001 6766            jsr        to_cicon
[0002c058] 584f                      addq.w     #4,a7
[0002c05a] 2948 0002                 move.l     a0,2(a4)
[0002c05e] 2008                      move.l     a0,d0
[0002c060] 6604                      bne.s      $0002C066
[0002c062] 91c8                      suba.l     a0,a0
[0002c064] 6046                      bra.s      $0002C0AC
[0002c066] 202c 000a                 move.l     10(a4),d0
[0002c06a] 6734                      beq.s      $0002C0A0
[0002c06c] 2f0a                      move.l     a2,-(a7)
[0002c06e] 3014                      move.w     (a4),d0
[0002c070] 206c 000e                 movea.l    14(a4),a0
[0002c074] 2268 0004                 movea.l    4(a0),a1
[0002c078] 266c 000a                 movea.l    10(a4),a3
[0002c07c] 206b 0004                 movea.l    4(a3),a0
[0002c080] 4eb9 0001 6766            jsr        to_cicon
[0002c086] 584f                      addq.w     #4,a7
[0002c088] 2948 000a                 move.l     a0,10(a4)
[0002c08c] 2008                      move.l     a0,d0
[0002c08e] 670c                      beq.s      $0002C09C
[0002c090] 226c 000e                 movea.l    14(a4),a1
[0002c094] 2969 0004 000e            move.l     4(a1),14(a4)
[0002c09a] 6004                      bra.s      $0002C0A0
[0002c09c] 42ac 000e                 clr.l      14(a4)
[0002c0a0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002c0a6] 38a8 001c                 move.w     28(a0),(a4)
[0002c0aa] 204a                      movea.l    a2,a0
[0002c0ac] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0002c0b0] 4e75                      rts
try:
[0002c0b2] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0002c0b6] 4fef ffe4                 lea.l      -28(a7),a7
[0002c0ba] 2a48                      movea.l    a0,a5
[0002c0bc] 2f49 0018                 move.l     a1,24(a7)
[0002c0c0] 202d 000e                 move.l     14(a5),d0
[0002c0c4] 7238                      moveq.l    #56,d1
[0002c0c6] 4eb9 0008 3c5a            jsr        _uldiv
[0002c0cc] 2600                      move.l     d0,d3
[0002c0ce] 3203                      move.w     d3,d1
[0002c0d0] d241                      add.w      d1,d1
[0002c0d2] 48c1                      ext.l      d1
[0002c0d4] 2001                      move.l     d1,d0
[0002c0d6] d080                      add.l      d0,d0
[0002c0d8] d081                      add.l      d1,d0
[0002c0da] e788                      lsl.l      #3,d0
[0002c0dc] 4eb9 0004 c608            jsr        Ax_malloc
[0002c0e2] 2448                      movea.l    a0,a2
[0002c0e4] 2e88                      move.l     a0,(a7)
[0002c0e6] 200a                      move.l     a2,d0
[0002c0e8] 6700 01c4                 beq        $0002C2AE
[0002c0ec] 4eb9 0004 810e            jsr        Adr_unselect
[0002c0f2] 226f 0018                 movea.l    24(a7),a1
[0002c0f6] 204d                      movea.l    a5,a0
[0002c0f8] 4eb9 0002 cb4e            jsr        reorg
[0002c0fe] 2f6d 0004 000a            move.l     4(a5),10(a7)
[0002c104] 4244                      clr.w      d4
[0002c106] 6000 01be                 bra        $0002C2C6
[0002c10a] 7030                      moveq.l    #48,d0
[0002c10c] 226f 000a                 movea.l    10(a7),a1
[0002c110] 5049                      addq.w     #8,a1
[0002c112] 204a                      movea.l    a2,a0
[0002c114] 4eb9 0008 3500            jsr        memcpy
[0002c11a] 026a dfff 000a            andi.w     #$DFFF,10(a2)
[0002c120] 3012                      move.w     (a2),d0
[0002c122] 6b02                      bmi.s      $0002C126
[0002c124] e3d2                      lsl.w      (a2)
[0002c126] 302a 0002                 move.w     2(a2),d0
[0002c12a] 6b04                      bmi.s      $0002C130
[0002c12c] e3ea 0002                 lsl.w      2(a2)
[0002c130] 302a 0004                 move.w     4(a2),d0
[0002c134] 6b04                      bmi.s      $0002C13A
[0002c136] e3ea 0004                 lsl.w      4(a2)
[0002c13a] 47ea 0018                 lea.l      24(a2),a3
[0002c13e] 26bc 0002 be70            move.l     #try_click,(a3)
[0002c144] 277c 0002 beb6 0004       move.l     #try_drag,4(a3)
[0002c14c] 102a 0007                 move.b     7(a2),d0
[0002c150] 4880                      ext.w      d0
[0002c152] 907c 0015                 sub.w      #$0015,d0
[0002c156] b07c 000c                 cmp.w      #$000C,d0
[0002c15a] 6200 015c                 bhi        $0002C2B8
[0002c15e] d040                      add.w      d0,d0
[0002c160] 303b 0006                 move.w     $0002C168(pc,d0.w),d0
[0002c164] 4efb 0002                 jmp        $0002C168(pc,d0.w)
J16:
[0002c168] 001a                      dc.w $001a   ; $0002c182-$0002c168
[0002c16a] 001a                      dc.w $001a   ; $0002c182-$0002c168
[0002c16c] 0092                      dc.w $0092   ; $0002c1fa-$0002c168
[0002c16e] 00c4                      dc.w $00c4   ; $0002c22c-$0002c168
[0002c170] 0150                      dc.w $0150   ; $0002c2b8-$0002c168
[0002c172] 011e                      dc.w $011e   ; $0002c286-$0002c168
[0002c174] 0150                      dc.w $0150   ; $0002c2b8-$0002c168
[0002c176] 011e                      dc.w $011e   ; $0002c286-$0002c168
[0002c178] 001a                      dc.w $001a   ; $0002c182-$0002c168
[0002c17a] 001a                      dc.w $001a   ; $0002c182-$0002c168
[0002c17c] 0132                      dc.w $0132   ; $0002c29a-$0002c168
[0002c17e] 011e                      dc.w $011e   ; $0002c286-$0002c168
[0002c180] 0132                      dc.w $0132   ; $0002c29a-$0002c168
[0002c182] 286a 000c                 movea.l    12(a2),a4
[0002c186] 701c                      moveq.l    #28,d0
[0002c188] 4eb9 0004 c608            jsr        Ax_malloc
[0002c18e] 2a48                      movea.l    a0,a5
[0002c190] 200d                      move.l     a5,d0
[0002c192] 6700 011a                 beq        $0002C2AE
[0002c196] 226c 0004                 movea.l    4(a4),a1
[0002c19a] 701c                      moveq.l    #28,d0
[0002c19c] 4eb9 0008 3500            jsr        memcpy
[0002c1a2] 2055                      movea.l    (a5),a0
[0002c1a4] 2068 0004                 movea.l    4(a0),a0
[0002c1a8] 4eb9 0004 643c            jsr        Ast_create
[0002c1ae] 2a88                      move.l     a0,(a5)
[0002c1b0] 226d 0004                 movea.l    4(a5),a1
[0002c1b4] 2069 0004                 movea.l    4(a1),a0
[0002c1b8] 4eb9 0004 643c            jsr        Ast_create
[0002c1be] 2b48 0004                 move.l     a0,4(a5)
[0002c1c2] 226d 0008                 movea.l    8(a5),a1
[0002c1c6] 2069 0004                 movea.l    4(a1),a0
[0002c1ca] 4eb9 0004 643c            jsr        Ast_create
[0002c1d0] 2b48 0008                 move.l     a0,8(a5)
[0002c1d4] 2055                      movea.l    (a5),a0
[0002c1d6] 4eb9 0008 2f6c            jsr        strlen
[0002c1dc] 5240                      addq.w     #1,d0
[0002c1de] 3b40 0018                 move.w     d0,24(a5)
[0002c1e2] 206d 0004                 movea.l    4(a5),a0
[0002c1e6] 4eb9 0008 2f6c            jsr        strlen
[0002c1ec] 5240                      addq.w     #1,d0
[0002c1ee] 3b40 001a                 move.w     d0,26(a5)
[0002c1f2] 254d 000c                 move.l     a5,12(a2)
[0002c1f6] 6000 00c0                 bra        $0002C2B8
[0002c1fa] 286a 000c                 movea.l    12(a2),a4
[0002c1fe] 700e                      moveq.l    #14,d0
[0002c200] 4eb9 0004 c608            jsr        Ax_malloc
[0002c206] 2a48                      movea.l    a0,a5
[0002c208] 200d                      move.l     a5,d0
[0002c20a] 6700 00a2                 beq        $0002C2AE
[0002c20e] 226c 0004                 movea.l    4(a4),a1
[0002c212] 700e                      moveq.l    #14,d0
[0002c214] 4eb9 0008 3500            jsr        memcpy
[0002c21a] 206c 0004                 movea.l    4(a4),a0
[0002c21e] 41e8 000e                 lea.l      14(a0),a0
[0002c222] 2a88                      move.l     a0,(a5)
[0002c224] 254d 000c                 move.l     a5,12(a2)
[0002c228] 6000 008e                 bra        $0002C2B8
[0002c22c] 286a 000c                 movea.l    12(a2),a4
[0002c230] 7020                      moveq.l    #32,d0
[0002c232] 4eb9 0004 c608            jsr        Ax_malloc
[0002c238] 2a48                      movea.l    a0,a5
[0002c23a] 200d                      move.l     a5,d0
[0002c23c] 6770                      beq.s      $0002C2AE
[0002c23e] 224d                      movea.l    a5,a1
[0002c240] 204c                      movea.l    a4,a0
[0002c242] 4eb9 0002 cae2            jsr        map_user
[0002c248] 254d 000c                 move.l     a5,12(a2)
[0002c24c] 202d 0008                 move.l     8(a5),d0
[0002c250] 6766                      beq.s      $0002C2B8
[0002c252] 3f7c 0001 0008            move.w     #$0001,8(a7)
[0002c258] 43ef 0008                 lea.l      8(a7),a1
[0002c25c] 204a                      movea.l    a2,a0
[0002c25e] 2640                      movea.l    d0,a3
[0002c260] 7001                      moveq.l    #1,d0
[0002c262] 4e93                      jsr        (a3)
[0002c264] 2f6f 0018 000e            move.l     24(a7),14(a7)
[0002c26a] 2f4a 0012                 move.l     a2,18(a7)
[0002c26e] 3004                      move.w     d4,d0
[0002c270] d040                      add.w      d0,d0
[0002c272] 3f40 0016                 move.w     d0,22(a7)
[0002c276] 43ef 000e                 lea.l      14(a7),a1
[0002c27a] 204a                      movea.l    a2,a0
[0002c27c] 266d 0008                 movea.l    8(a5),a3
[0002c280] 7009                      moveq.l    #9,d0
[0002c282] 4e93                      jsr        (a3)
[0002c284] 6032                      bra.s      $0002C2B8
[0002c286] 286a 000c                 movea.l    12(a2),a4
[0002c28a] 206c 0004                 movea.l    4(a4),a0
[0002c28e] 4eb9 0004 643c            jsr        Ast_create
[0002c294] 2548 000c                 move.l     a0,12(a2)
[0002c298] 601e                      bra.s      $0002C2B8
[0002c29a] 286a 000c                 movea.l    12(a2),a4
[0002c29e] 206c 0004                 movea.l    4(a4),a0
[0002c2a2] 6100 fd20                 bsr        fix_cicon
[0002c2a6] 2f48 0004                 move.l     a0,4(a7)
[0002c2aa] 2008                      move.l     a0,d0
[0002c2ac] 6604                      bne.s      $0002C2B2
[0002c2ae] 91c8                      suba.l     a0,a0
[0002c2b0] 602e                      bra.s      $0002C2E0
[0002c2b2] 256f 0004 000c            move.l     4(a7),12(a2)
[0002c2b8] 45ea 0030                 lea.l      48(a2),a2
[0002c2bc] 06af 0000 0038 000a       addi.l     #$00000038,10(a7)
[0002c2c4] 5244                      addq.w     #1,d4
[0002c2c6] b644                      cmp.w      d4,d3
[0002c2c8] 6e00 fe40                 bgt        $0002C10A
[0002c2cc] 45ea ffe8                 lea.l      -24(a2),a2
[0002c2d0] 006a 0020 0008            ori.w      #$0020,8(a2)
[0002c2d6] 2057                      movea.l    (a7),a0
[0002c2d8] 4eb9 0004 fbdc            jsr        Aob_fix
[0002c2de] 2057                      movea.l    (a7),a0
[0002c2e0] 4fef 001c                 lea.l      28(a7),a7
[0002c2e4] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0002c2e8] 4e75                      rts
eded_try:
[0002c2ea] 48e7 003c                 movem.l    a2-a5,-(a7)
[0002c2ee] 514f                      subq.w     #8,a7
[0002c2f0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002c2f6] 2468 0258                 movea.l    600(a0),a2
[0002c2fa] 2a52                      movea.l    (a2),a5
[0002c2fc] 2f55 0004                 move.l     (a5),4(a7)
[0002c300] 286d 0004                 movea.l    4(a5),a4
[0002c304] 224a                      movea.l    a2,a1
[0002c306] 206d 0004                 movea.l    4(a5),a0
[0002c30a] 6100 fda6                 bsr        try
[0002c30e] 2a48                      movea.l    a0,a5
[0002c310] 200d                      move.l     a5,d0
[0002c312] 6700 011c                 beq        $0002C430
[0002c316] 43ec 0016                 lea.l      22(a4),a1
[0002c31a] 206f 0004                 movea.l    4(a7),a0
[0002c31e] 2068 0018                 movea.l    24(a0),a0
[0002c322] 4eb9 0003 337c            jsr        find_entry
[0002c328] b9c8                      cmpa.l     a0,a4
[0002c32a] 666e                      bne.s      $0002C39A
[0002c32c] 2f39 000e 692a            move.l     _globl,-(a7)
[0002c332] 486f 0006                 pea.l      6(a7)
[0002c336] 486f 0008                 pea.l      8(a7)
[0002c33a] 43ef 000c                 lea.l      12(a7),a1
[0002c33e] 41ef 000c                 lea.l      12(a7),a0
[0002c342] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0002c348] 4fef 000c                 lea.l      12(a7),a7
[0002c34c] 7004                      moveq.l    #4,d0
[0002c34e] c06f 0002                 and.w      2(a7),d0
[0002c352] 671c                      beq.s      $0002C370
[0002c354] 204a                      movea.l    a2,a0
[0002c356] 226a 0010                 movea.l    16(a2),a1
[0002c35a] 4e91                      jsr        (a1)
[0002c35c] 204d                      movea.l    a5,a0
[0002c35e] 4eb9 0006 c596            jsr        A_dialog
[0002c364] 204d                      movea.l    a5,a0
[0002c366] 4eb9 0004 f20a            jsr        Aob_delete
[0002c36c] 6000 00c2                 bra        $0002C430
[0002c370] 42a7                      clr.l      -(a7)
[0002c372] 42a7                      clr.l      -(a7)
[0002c374] 42a7                      clr.l      -(a7)
[0002c376] 4879 0004 f20a            pea.l      Aob_delete
[0002c37c] 4879 0002 f27c            pea.l      ed_abort
[0002c382] 4879 000c 4e2f            pea.l      testmode
[0002c388] 224d                      movea.l    a5,a1
[0002c38a] 204a                      movea.l    a2,a0
[0002c38c] 4eb9 0002 f488            jsr        change_work
[0002c392] 4fef 0018                 lea.l      24(a7),a7
[0002c396] 6000 0098                 bra        $0002C430
[0002c39a] 43ec 0016                 lea.l      22(a4),a1
[0002c39e] 206f 0004                 movea.l    4(a7),a0
[0002c3a2] 2068 001c                 movea.l    28(a0),a0
[0002c3a6] 4eb9 0003 337c            jsr        find_entry
[0002c3ac] b9c8                      cmpa.l     a0,a4
[0002c3ae] 6648                      bne.s      $0002C3F8
[0002c3b0] 41f9 000c 89e0            lea.l      MINIOB,a0
[0002c3b6] 4eb9 0004 f064            jsr        Aob_create
[0002c3bc] 2648                      movea.l    a0,a3
[0002c3be] 376a 0038 0014            move.w     56(a2),20(a3)
[0002c3c4] 376a 003a 0016            move.w     58(a2),22(a3)
[0002c3ca] 006b 8000 000a            ori.w      #$8000,10(a3)
[0002c3d0] 42a7                      clr.l      -(a7)
[0002c3d2] 42a7                      clr.l      -(a7)
[0002c3d4] 2f0d                      move.l     a5,-(a7)
[0002c3d6] 4879 0004 f20a            pea.l      Aob_delete
[0002c3dc] 4879 0002 f27c            pea.l      ed_abort
[0002c3e2] 4879 000c 4e2f            pea.l      testmode
[0002c3e8] 224b                      movea.l    a3,a1
[0002c3ea] 204a                      movea.l    a2,a0
[0002c3ec] 4eb9 0002 f488            jsr        change_work
[0002c3f2] 4fef 0018                 lea.l      24(a7),a7
[0002c3f6] 6038                      bra.s      $0002C430
[0002c3f8] 43ec 0016                 lea.l      22(a4),a1
[0002c3fc] 206f 0004                 movea.l    4(a7),a0
[0002c400] 2068 0020                 movea.l    32(a0),a0
[0002c404] 4eb9 0003 337c            jsr        find_entry
[0002c40a] b9c8                      cmpa.l     a0,a4
[0002c40c] 6622                      bne.s      $0002C430
[0002c40e] 204a                      movea.l    a2,a0
[0002c410] 226a 0010                 movea.l    16(a2),a1
[0002c414] 4e91                      jsr        (a1)
[0002c416] 4eb9 0004 ef0c            jsr        Amo_unbusy
[0002c41c] 72ff                      moveq.l    #-1,d1
[0002c41e] 70ff                      moveq.l    #-1,d0
[0002c420] 224d                      movea.l    a5,a1
[0002c422] 204a                      movea.l    a2,a0
[0002c424] 4eb9 0004 e84a            jsr        Ame_popup
[0002c42a] 4eb9 0004 eec0            jsr        Amo_busy
[0002c430] 504f                      addq.w     #8,a7
[0002c432] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0002c436] 4e75                      rts
ed_init:
[0002c438] 48e7 1e3e                 movem.l    d3-d6/a2-a6,-(a7)
[0002c43c] 4fef ffe4                 lea.l      -28(a7),a7
[0002c440] 2f48 0018                 move.l     a0,24(a7)
[0002c444] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002c44a] 2069 0240                 movea.l    576(a1),a0
[0002c44e] b1ef 0018                 cmpa.l     24(a7),a0
[0002c452] 6606                      bne.s      $0002C45A
[0002c454] 4eb9 0004 810e            jsr        Adr_unselect
[0002c45a] 206f 0018                 movea.l    24(a7),a0
[0002c45e] 2f50 000a                 move.l     (a0),10(a7)
[0002c462] 226f 000a                 movea.l    10(a7),a1
[0002c466] 2869 0004                 movea.l    4(a1),a4
[0002c46a] 2f6c 0004 0006            move.l     4(a4),6(a7)
[0002c470] 202c 000e                 move.l     14(a4),d0
[0002c474] 7238                      moveq.l    #56,d1
[0002c476] 4eb9 0008 3c5a            jsr        _uldiv
[0002c47c] 2600                      move.l     d0,d3
[0002c47e] 206f 0018                 movea.l    24(a7),a0
[0002c482] 2a68 0014                 movea.l    20(a0),a5
[0002c486] 4244                      clr.w      d4
[0002c488] 3a04                      move.w     d4,d5
[0002c48a] 200d                      move.l     a5,d0
[0002c48c] 6710                      beq.s      $0002C49E
[0002c48e] 3a2d 0010                 move.w     16(a5),d5
[0002c492] 382d 0012                 move.w     18(a5),d4
[0002c496] 204d                      movea.l    a5,a0
[0002c498] 4eb9 0004 f20a            jsr        Aob_delete
[0002c49e] 206f 000a                 movea.l    10(a7),a0
[0002c4a2] 317c 0001 0008            move.w     #$0001,8(a0)
[0002c4a8] 3203                      move.w     d3,d1
[0002c4aa] d241                      add.w      d1,d1
[0002c4ac] d243                      add.w      d3,d1
[0002c4ae] 5241                      addq.w     #1,d1
[0002c4b0] 48c1                      ext.l      d1
[0002c4b2] 2001                      move.l     d1,d0
[0002c4b4] d080                      add.l      d0,d0
[0002c4b6] d081                      add.l      d1,d0
[0002c4b8] e788                      lsl.l      #3,d0
[0002c4ba] 4eb9 0004 c608            jsr        Ax_malloc
[0002c4c0] 2a48                      movea.l    a0,a5
[0002c4c2] 226f 0018                 movea.l    24(a7),a1
[0002c4c6] 2348 0014                 move.l     a0,20(a1)
[0002c4ca] 200d                      move.l     a5,d0
[0002c4cc] 6700 01b8                 beq        $0002C686
[0002c4d0] 43f9 000c 9190            lea.l      deskob,a1
[0002c4d6] 204d                      movea.l    a5,a0
[0002c4d8] 7018                      moveq.l    #24,d0
[0002c4da] 4eb9 0008 3500            jsr        memcpy
[0002c4e0] 47ed 0018                 lea.l      24(a5),a3
[0002c4e4] 23cc 000c 9164            move.l     a4,$000C9164
[0002c4ea] 4246                      clr.w      d6
[0002c4ec] 6000 024a                 bra        $0002C738
[0002c4f0] 3006                      move.w     d6,d0
[0002c4f2] 48c0                      ext.l      d0
[0002c4f4] 23c0 000c 9168            move.l     d0,$000C9168
[0002c4fa] 43f9 000c 9128            lea.l      entry,a1
[0002c500] 204b                      movea.l    a3,a0
[0002c502] 7048                      moveq.l    #72,d0
[0002c504] 4eb9 0008 3500            jsr        memcpy
[0002c50a] 7018                      moveq.l    #24,d0
[0002c50c] 3406                      move.w     d6,d2
[0002c50e] 48c2                      ext.l      d2
[0002c510] 2202                      move.l     d2,d1
[0002c512] e789                      lsl.l      #3,d1
[0002c514] 9282                      sub.l      d2,d1
[0002c516] e789                      lsl.l      #3,d1
[0002c518] 226f 0006                 movea.l    6(a7),a1
[0002c51c] 43f1 1808                 lea.l      8(a1,d1.l),a1
[0002c520] 204b                      movea.l    a3,a0
[0002c522] 4eb9 0008 3500            jsr        memcpy
[0002c528] 102b 0007                 move.b     7(a3),d0
[0002c52c] 4880                      ext.w      d0
[0002c52e] 907c 0015                 sub.w      #$0015,d0
[0002c532] b07c 000c                 cmp.w      #$000C,d0
[0002c536] 6200 0158                 bhi        $0002C690
[0002c53a] d040                      add.w      d0,d0
[0002c53c] 303b 0006                 move.w     $0002C544(pc,d0.w),d0
[0002c540] 4efb 0002                 jmp        $0002C544(pc,d0.w)
J17:
[0002c544] 001a                      dc.w $001a   ; $0002c55e-$0002c544
[0002c546] 001a                      dc.w $001a   ; $0002c55e-$0002c544
[0002c548] 0092                      dc.w $0092   ; $0002c5d6-$0002c544
[0002c54a] 00c4                      dc.w $00c4   ; $0002c608-$0002c544
[0002c54c] 014c                      dc.w $014c   ; $0002c690-$0002c544
[0002c54e] 011e                      dc.w $011e   ; $0002c662-$0002c544
[0002c550] 014c                      dc.w $014c   ; $0002c690-$0002c544
[0002c552] 011e                      dc.w $011e   ; $0002c662-$0002c544
[0002c554] 001a                      dc.w $001a   ; $0002c55e-$0002c544
[0002c556] 001a                      dc.w $001a   ; $0002c55e-$0002c544
[0002c558] 0132                      dc.w $0132   ; $0002c676-$0002c544
[0002c55a] 011e                      dc.w $011e   ; $0002c662-$0002c544
[0002c55c] 0132                      dc.w $0132   ; $0002c676-$0002c544
[0002c55e] 246b 000c                 movea.l    12(a3),a2
[0002c562] 701c                      moveq.l    #28,d0
[0002c564] 4eb9 0004 c608            jsr        Ax_malloc
[0002c56a] 2848                      movea.l    a0,a4
[0002c56c] 200c                      move.l     a4,d0
[0002c56e] 6700 0116                 beq        $0002C686
[0002c572] 226a 0004                 movea.l    4(a2),a1
[0002c576] 701c                      moveq.l    #28,d0
[0002c578] 4eb9 0008 3500            jsr        memcpy
[0002c57e] 2054                      movea.l    (a4),a0
[0002c580] 2068 0004                 movea.l    4(a0),a0
[0002c584] 4eb9 0004 643c            jsr        Ast_create
[0002c58a] 2888                      move.l     a0,(a4)
[0002c58c] 226c 0004                 movea.l    4(a4),a1
[0002c590] 2069 0004                 movea.l    4(a1),a0
[0002c594] 4eb9 0004 643c            jsr        Ast_create
[0002c59a] 2948 0004                 move.l     a0,4(a4)
[0002c59e] 226c 0008                 movea.l    8(a4),a1
[0002c5a2] 2069 0004                 movea.l    4(a1),a0
[0002c5a6] 4eb9 0004 643c            jsr        Ast_create
[0002c5ac] 2948 0008                 move.l     a0,8(a4)
[0002c5b0] 2054                      movea.l    (a4),a0
[0002c5b2] 4eb9 0008 2f6c            jsr        strlen
[0002c5b8] 5240                      addq.w     #1,d0
[0002c5ba] 3940 0018                 move.w     d0,24(a4)
[0002c5be] 206c 0004                 movea.l    4(a4),a0
[0002c5c2] 4eb9 0008 2f6c            jsr        strlen
[0002c5c8] 5240                      addq.w     #1,d0
[0002c5ca] 3940 001a                 move.w     d0,26(a4)
[0002c5ce] 274c 000c                 move.l     a4,12(a3)
[0002c5d2] 6000 00bc                 bra        $0002C690
[0002c5d6] 246b 000c                 movea.l    12(a3),a2
[0002c5da] 700e                      moveq.l    #14,d0
[0002c5dc] 4eb9 0004 c608            jsr        Ax_malloc
[0002c5e2] 2848                      movea.l    a0,a4
[0002c5e4] 200c                      move.l     a4,d0
[0002c5e6] 6700 009e                 beq        $0002C686
[0002c5ea] 226a 0004                 movea.l    4(a2),a1
[0002c5ee] 700e                      moveq.l    #14,d0
[0002c5f0] 4eb9 0008 3500            jsr        memcpy
[0002c5f6] 206a 0004                 movea.l    4(a2),a0
[0002c5fa] 41e8 000e                 lea.l      14(a0),a0
[0002c5fe] 2888                      move.l     a0,(a4)
[0002c600] 274c 000c                 move.l     a4,12(a3)
[0002c604] 6000 008a                 bra        $0002C690
[0002c608] 246b 000c                 movea.l    12(a3),a2
[0002c60c] 7020                      moveq.l    #32,d0
[0002c60e] 4eb9 0004 c608            jsr        Ax_malloc
[0002c614] 2848                      movea.l    a0,a4
[0002c616] 200c                      move.l     a4,d0
[0002c618] 676c                      beq.s      $0002C686
[0002c61a] 224c                      movea.l    a4,a1
[0002c61c] 204a                      movea.l    a2,a0
[0002c61e] 4eb9 0002 cae2            jsr        map_user
[0002c624] 274c 000c                 move.l     a4,12(a3)
[0002c628] 202c 0008                 move.l     8(a4),d0
[0002c62c] 6762                      beq.s      $0002C690
[0002c62e] 3f7c 0001 0004            move.w     #$0001,4(a7)
[0002c634] 43ef 0004                 lea.l      4(a7),a1
[0002c638] 204b                      movea.l    a3,a0
[0002c63a] 2c40                      movea.l    d0,a6
[0002c63c] 7001                      moveq.l    #1,d0
[0002c63e] 4e96                      jsr        (a6)
[0002c640] 2f6f 0018 000e            move.l     24(a7),14(a7)
[0002c646] 2f4b 0012                 move.l     a3,18(a7)
[0002c64a] 3006                      move.w     d6,d0
[0002c64c] d040                      add.w      d0,d0
[0002c64e] 3f40 0016                 move.w     d0,22(a7)
[0002c652] 43ef 000e                 lea.l      14(a7),a1
[0002c656] 204b                      movea.l    a3,a0
[0002c658] 2c6c 0008                 movea.l    8(a4),a6
[0002c65c] 7009                      moveq.l    #9,d0
[0002c65e] 4e96                      jsr        (a6)
[0002c660] 602e                      bra.s      $0002C690
[0002c662] 246b 000c                 movea.l    12(a3),a2
[0002c666] 206a 0004                 movea.l    4(a2),a0
[0002c66a] 4eb9 0004 643c            jsr        Ast_create
[0002c670] 2748 000c                 move.l     a0,12(a3)
[0002c674] 601a                      bra.s      $0002C690
[0002c676] 246b 000c                 movea.l    12(a3),a2
[0002c67a] 206a 0004                 movea.l    4(a2),a0
[0002c67e] 6100 f944                 bsr        fix_cicon
[0002c682] 2e88                      move.l     a0,(a7)
[0002c684] 6606                      bne.s      $0002C68C
[0002c686] 70ff                      moveq.l    #-1,d0
[0002c688] 6000 011a                 bra        $0002C7A4
[0002c68c] 2757 000c                 move.l     (a7),12(a3)
[0002c690] 3213                      move.w     (a3),d1
[0002c692] 3001                      move.w     d1,d0
[0002c694] d040                      add.w      d0,d0
[0002c696] d041                      add.w      d1,d0
[0002c698] 5240                      addq.w     #1,d0
[0002c69a] 3740 0018                 move.w     d0,24(a3)
[0002c69e] 3413                      move.w     (a3),d2
[0002c6a0] 48c2                      ext.l      d2
[0002c6a2] 2202                      move.l     d2,d1
[0002c6a4] e789                      lsl.l      #3,d1
[0002c6a6] 9282                      sub.l      d2,d1
[0002c6a8] e789                      lsl.l      #3,d1
[0002c6aa] 206f 0006                 movea.l    6(a7),a0
[0002c6ae] bc70 180c                 cmp.w      12(a0,d1.l),d6
[0002c6b2] 6604                      bne.s      $0002C6B8
[0002c6b4] 526b 0018                 addq.w     #1,24(a3)
[0002c6b8] 302b 0002                 move.w     2(a3),d0
[0002c6bc] 6b26                      bmi.s      $0002C6E4
[0002c6be] 3200                      move.w     d0,d1
[0002c6c0] d241                      add.w      d1,d1
[0002c6c2] d240                      add.w      d0,d1
[0002c6c4] 5241                      addq.w     #1,d1
[0002c6c6] 3741 001a                 move.w     d1,26(a3)
[0002c6ca] 342b 0004                 move.w     4(a3),d2
[0002c6ce] 3002                      move.w     d2,d0
[0002c6d0] d040                      add.w      d0,d0
[0002c6d2] d042                      add.w      d2,d0
[0002c6d4] 5440                      addq.w     #2,d0
[0002c6d6] 3740 001c                 move.w     d0,28(a3)
[0002c6da] 72ff                      moveq.l    #-1,d1
[0002c6dc] 3741 0004                 move.w     d1,4(a3)
[0002c6e0] 3741 0002                 move.w     d1,2(a3)
[0002c6e4] 3006                      move.w     d6,d0
[0002c6e6] d040                      add.w      d0,d0
[0002c6e8] d046                      add.w      d6,d0
[0002c6ea] 5440                      addq.w     #2,d0
[0002c6ec] 3680                      move.w     d0,(a3)
[0002c6ee] 376b 0010 0028            move.w     16(a3),40(a3)
[0002c6f4] 376b 0012 002a            move.w     18(a3),42(a3)
[0002c6fa] 376b 0014 002c            move.w     20(a3),44(a3)
[0002c700] 376b 0016 002e            move.w     22(a3),46(a3)
[0002c706] 323c 0080                 move.w     #$0080,d1
[0002c70a] c26b 0008                 and.w      8(a3),d1
[0002c70e] 6706                      beq.s      $0002C716
[0002c710] 006b 0080 0020            ori.w      #$0080,32(a3)
[0002c716] 302b 000a                 move.w     10(a3),d0
[0002c71a] c07c 1000                 and.w      #$1000,d0
[0002c71e] 6706                      beq.s      $0002C726
[0002c720] 006b 1000 0022            ori.w      #$1000,34(a3)
[0002c726] 026b 06d7 0008            andi.w     #$06D7,8(a3)
[0002c72c] 026b 0f3f 000a            andi.w     #$0F3F,10(a3)
[0002c732] 5246                      addq.w     #1,d6
[0002c734] 47eb 0048                 lea.l      72(a3),a3
[0002c738] b646                      cmp.w      d6,d3
[0002c73a] 6e00 fdb4                 bgt        $0002C4F0
[0002c73e] 47eb ffe8                 lea.l      -24(a3),a3
[0002c742] 006b 0020 0008            ori.w      #$0020,8(a3)
[0002c748] 426d 0030                 clr.w      48(a5)
[0002c74c] 302d 0014                 move.w     20(a5),d0
[0002c750] e240                      asr.w      #1,d0
[0002c752] 3b40 0028                 move.w     d0,40(a5)
[0002c756] 3b40 0040                 move.w     d0,64(a5)
[0002c75a] 322d 0016                 move.w     22(a5),d1
[0002c75e] e241                      asr.w      #1,d1
[0002c760] 3b41 002a                 move.w     d1,42(a5)
[0002c764] 3b41 0042                 move.w     d1,66(a5)
[0002c768] 302d 002c                 move.w     44(a5),d0
[0002c76c] d16d 0014                 add.w      d0,20(a5)
[0002c770] 302d 002e                 move.w     46(a5),d0
[0002c774] d16d 0016                 add.w      d0,22(a5)
[0002c778] 206f 000a                 movea.l    10(a7),a0
[0002c77c] 3028 0018                 move.w     24(a0),d0
[0002c780] 6b10                      bmi.s      $0002C792
[0002c782] 48c0                      ext.l      d0
[0002c784] 2200                      move.l     d0,d1
[0002c786] d281                      add.l      d1,d1
[0002c788] d280                      add.l      d0,d1
[0002c78a] e789                      lsl.l      #3,d1
[0002c78c] 0075 1800 1808            ori.w      #$1800,8(a5,d1.l)
[0002c792] 204d                      movea.l    a5,a0
[0002c794] 4eb9 0004 fbdc            jsr        Aob_fix
[0002c79a] 3b45 0010                 move.w     d5,16(a5)
[0002c79e] 3b44 0012                 move.w     d4,18(a5)
[0002c7a2] 4240                      clr.w      d0
[0002c7a4] 4fef 001c                 lea.l      28(a7),a7
[0002c7a8] 4cdf 7c78                 movem.l    (a7)+,d3-d6/a2-a6
[0002c7ac] 4e75                      rts
ed_service:
[0002c7ae] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0002c7b2] 2448                      movea.l    a0,a2
[0002c7b4] 3600                      move.w     d0,d3
[0002c7b6] 2849                      movea.l    a1,a4
[0002c7b8] 2650                      movea.l    (a0),a3
[0002c7ba] b07c 0012                 cmp.w      #$0012,d0
[0002c7be] 6762                      beq.s      $0002C822
[0002c7c0] 6e32                      bgt.s      $0002C7F4
[0002c7c2] b07c 000f                 cmp.w      #$000F,d0
[0002c7c6] 6200 00ea                 bhi        $0002C8B2
[0002c7ca] d040                      add.w      d0,d0
[0002c7cc] 303b 0006                 move.w     $0002C7D4(pc,d0.w),d0
[0002c7d0] 4efb 0002                 jmp        $0002C7D4(pc,d0.w)
J18:
[0002c7d4] 00de                      dc.w $00de   ; $0002c8b2-$0002c7d4
[0002c7d6] 00ca                      dc.w $00ca   ; $0002c89e-$0002c7d4
[0002c7d8] 00a0                      dc.w $00a0   ; $0002c874-$0002c7d4
[0002c7da] 00aa                      dc.w $00aa   ; $0002c87e-$0002c7d4
[0002c7dc] 00de                      dc.w $00de   ; $0002c8b2-$0002c7d4
[0002c7de] 00de                      dc.w $00de   ; $0002c8b2-$0002c7d4
[0002c7e0] 00de                      dc.w $00de   ; $0002c8b2-$0002c7d4
[0002c7e2] 00de                      dc.w $00de   ; $0002c8b2-$0002c7d4
[0002c7e4] 00de                      dc.w $00de   ; $0002c8b2-$0002c7d4
[0002c7e6] 00de                      dc.w $00de   ; $0002c8b2-$0002c7d4
[0002c7e8] 00de                      dc.w $00de   ; $0002c8b2-$0002c7d4
[0002c7ea] 00c0                      dc.w $00c0   ; $0002c894-$0002c7d4
[0002c7ec] 00de                      dc.w $00de   ; $0002c8b2-$0002c7d4
[0002c7ee] 00de                      dc.w $00de   ; $0002c8b2-$0002c7d4
[0002c7f0] 00de                      dc.w $00de   ; $0002c8b2-$0002c7d4
[0002c7f2] 00d2                      dc.w $00d2   ; $0002c8a6-$0002c7d4
[0002c7f4] 907c                      dc.w $907c   ; $00025850-$0002c7d4
[0002c7f6] 0024                      dc.w $0024   ; $0002c7f8-$0002c7d4
[0002c7f8] 6720                      beq.s      $0002C81A
[0002c7fa] 5340                      subq.w     #1,d0
[0002c7fc] 6714                      beq.s      $0002C812
[0002c7fe] 907c 03d2                 sub.w      #$03D2,d0
[0002c802] 6700 00aa                 beq        $0002C8AE
[0002c806] 907c 2319                 sub.w      #$2319,d0
[0002c80a] 6700 007a                 beq.w      $0002C886
[0002c80e] 6000 00a2                 bra        $0002C8B2
[0002c812] 42ac 0002                 clr.l      2(a4)
[0002c816] 6000 00a8                 bra        $0002C8C0
[0002c81a] 38bc 0001                 move.w     #$0001,(a4)
[0002c81e] 6000 00a0                 bra        $0002C8C0
[0002c822] 204c                      movea.l    a4,a0
[0002c824] 3039 0008 4806            move.w     snapping,d0
[0002c82a] 6716                      beq.s      $0002C842
[0002c82c] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002c832] 30a9 0012                 move.w     18(a1),(a0)
[0002c836] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002c83c] 3169 0014 0002            move.w     20(a1),2(a0)
[0002c842] 317c 0003 000c            move.w     #$0003,12(a0)
[0002c848] 317c 000b 000e            move.w     #$000B,14(a0)
[0002c84e] 317c 0003 0010            move.w     #$0003,16(a0)
[0002c854] 317c 000c 0012            move.w     #$000C,18(a0)
[0002c85a] 317c 0003 0014            move.w     #$0003,20(a0)
[0002c860] 317c 000b 0016            move.w     #$000B,22(a0)
[0002c866] 317c 0003 0018            move.w     #$0003,24(a0)
[0002c86c] 317c 000c 001a            move.w     #$000C,26(a0)
[0002c872] 604c                      bra.s      $0002C8C0
[0002c874] 204a                      movea.l    a2,a0
[0002c876] 4eb9 0002 c8c8            jsr        ed_term
[0002c87c] 6042                      bra.s      $0002C8C0
[0002c87e] 204a                      movea.l    a2,a0
[0002c880] 6100 f196                 bsr        close_uc
[0002c884] 603a                      bra.s      $0002C8C0
[0002c886] 226b 0004                 movea.l    4(a3),a1
[0002c88a] 204a                      movea.l    a2,a0
[0002c88c] 4eb9 0001 60ea            jsr        new_name
[0002c892] 602c                      bra.s      $0002C8C0
[0002c894] 204a                      movea.l    a2,a0
[0002c896] 4eb9 0002 da56            jsr        ed_delete
[0002c89c] 6022                      bra.s      $0002C8C0
[0002c89e] 4279 000c 9106            clr.w      visible_editors
[0002c8a4] 601a                      bra.s      $0002C8C0
[0002c8a6] 204a                      movea.l    a2,a0
[0002c8a8] 6100 f33e                 bsr        ed_info
[0002c8ac] 6012                      bra.s      $0002C8C0
[0002c8ae] 288a                      move.l     a2,(a4)
[0002c8b0] 600e                      bra.s      $0002C8C0
[0002c8b2] 224c                      movea.l    a4,a1
[0002c8b4] 3003                      move.w     d3,d0
[0002c8b6] 204a                      movea.l    a2,a0
[0002c8b8] 4eb9 0005 9dd0            jsr        Awi_service
[0002c8be] 6002                      bra.s      $0002C8C2
[0002c8c0] 7001                      moveq.l    #1,d0
[0002c8c2] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0002c8c6] 4e75                      rts
ed_term:
[0002c8c8] 2f0a                      move.l     a2,-(a7)
[0002c8ca] 2f0b                      move.l     a3,-(a7)
[0002c8cc] 2448                      movea.l    a0,a2
[0002c8ce] 2650                      movea.l    (a0),a3
[0002c8d0] 006a 0100 0056            ori.w      #$0100,86(a2)
[0002c8d6] 200b                      move.l     a3,d0
[0002c8d8] 6772                      beq.s      $0002C94C
[0002c8da] 0c6b 0002 0008            cmpi.w     #$0002,8(a3)
[0002c8e0] 6610                      bne.s      $0002C8F2
[0002c8e2] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002c8e8] 2348 0258                 move.l     a0,600(a1)
[0002c8ec] 206b 001a                 movea.l    26(a3),a0
[0002c8f0] 4e90                      jsr        (a0)
[0002c8f2] 206b 001e                 movea.l    30(a3),a0
[0002c8f6] 4eb9 0004 c7c8            jsr        Ax_free
[0002c8fc] 224a                      movea.l    a2,a1
[0002c8fe] 206b 0004                 movea.l    4(a3),a0
[0002c902] 4eb9 0002 cb4e            jsr        reorg
[0002c908] 302a 0056                 move.w     86(a2),d0
[0002c90c] c07c 0800                 and.w      #$0800,d0
[0002c910] 6716                      beq.s      $0002C928
[0002c912] 43ea 002c                 lea.l      44(a2),a1
[0002c916] 206b 0004                 movea.l    4(a3),a0
[0002c91a] 41e8 003a                 lea.l      58(a0),a0
[0002c91e] 7008                      moveq.l    #8,d0
[0002c920] 4eb9 0008 3500            jsr        memcpy
[0002c926] 6014                      bra.s      $0002C93C
[0002c928] 7008                      moveq.l    #8,d0
[0002c92a] 43ea 0024                 lea.l      36(a2),a1
[0002c92e] 206b 0004                 movea.l    4(a3),a0
[0002c932] 41e8 003a                 lea.l      58(a0),a0
[0002c936] 4eb9 0008 3500            jsr        memcpy
[0002c93c] 206b 0004                 movea.l    4(a3),a0
[0002c940] 42a8 0012                 clr.l      18(a0)
[0002c944] 204b                      movea.l    a3,a0
[0002c946] 4eb9 0004 c7c8            jsr        Ax_free
[0002c94c] 204a                      movea.l    a2,a0
[0002c94e] 4eb9 0005 85f2            jsr        Awi_delete
[0002c954] 265f                      movea.l    (a7)+,a3
[0002c956] 245f                      movea.l    (a7)+,a2
[0002c958] 4e75                      rts
set_userdef:
[0002c95a] 2f0a                      move.l     a2,-(a7)
[0002c95c] 2f0b                      move.l     a3,-(a7)
[0002c95e] 2649                      movea.l    a1,a3
[0002c960] 2468 0004                 movea.l    4(a0),a2
[0002c964] 226a 0004                 movea.l    4(a2),a1
[0002c968] 43e9 0016                 lea.l      22(a1),a1
[0002c96c] 2689                      move.l     a1,(a3)
[0002c96e] 226a 0008                 movea.l    8(a2),a1
[0002c972] 43e9 0016                 lea.l      22(a1),a1
[0002c976] 2749 0004                 move.l     a1,4(a3)
[0002c97a] 202a 000c                 move.l     12(a2),d0
[0002c97e] 6606                      bne.s      $0002C986
[0002c980] 0268 fffc 0038            andi.w     #$FFFC,56(a0)
[0002c986] 202a 0010                 move.l     16(a2),d0
[0002c98a] 6606                      bne.s      $0002C992
[0002c98c] 0268 fff3 0038            andi.w     #$FFF3,56(a0)
[0002c992] 202a 0014                 move.l     20(a2),d0
[0002c996] 6606                      bne.s      $0002C99E
[0002c998] 0268 ffcf 0038            andi.w     #$FFCF,56(a0)
[0002c99e] 7003                      moveq.l    #3,d0
[0002c9a0] c068 0038                 and.w      56(a0),d0
[0002c9a4] 3740 0008                 move.w     d0,8(a3)
[0002c9a8] 4a40                      tst.w      d0
[0002c9aa] 670e                      beq.s      $0002C9BA
[0002c9ac] 5340                      subq.w     #1,d0
[0002c9ae] 6710                      beq.s      $0002C9C0
[0002c9b0] 5340                      subq.w     #1,d0
[0002c9b2] 671a                      beq.s      $0002C9CE
[0002c9b4] 5340                      subq.w     #1,d0
[0002c9b6] 6726                      beq.s      $0002C9DE
[0002c9b8] 6038                      bra.s      $0002C9F2
[0002c9ba] 42ab 000a                 clr.l      10(a3)
[0002c9be] 6018                      bra.s      $0002C9D8
[0002c9c0] 226a 000c                 movea.l    12(a2),a1
[0002c9c4] 43e9 0016                 lea.l      22(a1),a1
[0002c9c8] 2749 000a                 move.l     a1,10(a3)
[0002c9cc] 600a                      bra.s      $0002C9D8
[0002c9ce] 226a 000c                 movea.l    12(a2),a1
[0002c9d2] 2769 0004 000a            move.l     4(a1),10(a3)
[0002c9d8] 42ab 000e                 clr.l      14(a3)
[0002c9dc] 6014                      bra.s      $0002C9F2
[0002c9de] 226a 000c                 movea.l    12(a2),a1
[0002c9e2] 2769 0004 000a            move.l     4(a1),10(a3)
[0002c9e8] 226a 000c                 movea.l    12(a2),a1
[0002c9ec] 2769 000e 000e            move.l     14(a1),14(a3)
[0002c9f2] 3028 0038                 move.w     56(a0),d0
[0002c9f6] e440                      asr.w      #2,d0
[0002c9f8] c07c 0003                 and.w      #$0003,d0
[0002c9fc] 3740 0012                 move.w     d0,18(a3)
[0002ca00] 4a40                      tst.w      d0
[0002ca02] 670e                      beq.s      $0002CA12
[0002ca04] 5340                      subq.w     #1,d0
[0002ca06] 6710                      beq.s      $0002CA18
[0002ca08] 5340                      subq.w     #1,d0
[0002ca0a] 671a                      beq.s      $0002CA26
[0002ca0c] 5340                      subq.w     #1,d0
[0002ca0e] 6726                      beq.s      $0002CA36
[0002ca10] 6038                      bra.s      $0002CA4A
[0002ca12] 42ab 0014                 clr.l      20(a3)
[0002ca16] 6018                      bra.s      $0002CA30
[0002ca18] 226a 0010                 movea.l    16(a2),a1
[0002ca1c] 43e9 0016                 lea.l      22(a1),a1
[0002ca20] 2749 0014                 move.l     a1,20(a3)
[0002ca24] 600a                      bra.s      $0002CA30
[0002ca26] 226a 0010                 movea.l    16(a2),a1
[0002ca2a] 2769 0004 0014            move.l     4(a1),20(a3)
[0002ca30] 42ab 0018                 clr.l      24(a3)
[0002ca34] 6014                      bra.s      $0002CA4A
[0002ca36] 226a 0010                 movea.l    16(a2),a1
[0002ca3a] 2769 0004 0014            move.l     4(a1),20(a3)
[0002ca40] 226a 0010                 movea.l    16(a2),a1
[0002ca44] 2769 000e 0018            move.l     14(a1),24(a3)
[0002ca4a] 3028 0038                 move.w     56(a0),d0
[0002ca4e] e840                      asr.w      #4,d0
[0002ca50] c07c 0003                 and.w      #$0003,d0
[0002ca54] 3740 001c                 move.w     d0,28(a3)
[0002ca58] 4a40                      tst.w      d0
[0002ca5a] 670e                      beq.s      $0002CA6A
[0002ca5c] 5340                      subq.w     #1,d0
[0002ca5e] 6710                      beq.s      $0002CA70
[0002ca60] 5340                      subq.w     #1,d0
[0002ca62] 671a                      beq.s      $0002CA7E
[0002ca64] 5340                      subq.w     #1,d0
[0002ca66] 6726                      beq.s      $0002CA8E
[0002ca68] 6038                      bra.s      $0002CAA2
[0002ca6a] 42ab 001e                 clr.l      30(a3)
[0002ca6e] 6018                      bra.s      $0002CA88
[0002ca70] 206a 0014                 movea.l    20(a2),a0
[0002ca74] 41e8 0016                 lea.l      22(a0),a0
[0002ca78] 2748 001e                 move.l     a0,30(a3)
[0002ca7c] 600a                      bra.s      $0002CA88
[0002ca7e] 206a 0014                 movea.l    20(a2),a0
[0002ca82] 2768 0004 001e            move.l     4(a0),30(a3)
[0002ca88] 42ab 0022                 clr.l      34(a3)
[0002ca8c] 6014                      bra.s      $0002CAA2
[0002ca8e] 206a 0014                 movea.l    20(a2),a0
[0002ca92] 2768 0004 001e            move.l     4(a0),30(a3)
[0002ca98] 206a 0014                 movea.l    20(a2),a0
[0002ca9c] 2768 000e 0022            move.l     14(a0),34(a3)
[0002caa2] 202a 0018                 move.l     24(a2),d0
[0002caa6] 6604                      bne.s      $0002CAAC
[0002caa8] 91c8                      suba.l     a0,a0
[0002caaa] 600e                      bra.s      $0002CABA
[0002caac] 206a 0018                 movea.l    24(a2),a0
[0002cab0] 2068 0004                 movea.l    4(a0),a0
[0002cab4] 4eb9 0004 643c            jsr        Ast_create
[0002caba] 2748 0026                 move.l     a0,38(a3)
[0002cabe] 202a 001c                 move.l     28(a2),d0
[0002cac2] 6604                      bne.s      $0002CAC8
[0002cac4] 93c9                      suba.l     a1,a1
[0002cac6] 6010                      bra.s      $0002CAD8
[0002cac8] 206a 001c                 movea.l    28(a2),a0
[0002cacc] 2068 0004                 movea.l    4(a0),a0
[0002cad0] 4eb9 0004 643c            jsr        Ast_create
[0002cad6] 2248                      movea.l    a0,a1
[0002cad8] 2749 002a                 move.l     a1,42(a3)
[0002cadc] 265f                      movea.l    (a7)+,a3
[0002cade] 245f                      movea.l    (a7)+,a2
[0002cae0] 4e75                      rts
map_user:
[0002cae2] 48e7 003c                 movem.l    a2-a5,-(a7)
[0002cae6] 4fef ffd2                 lea.l      -46(a7),a7
[0002caea] 2648                      movea.l    a0,a3
[0002caec] 2449                      movea.l    a1,a2
[0002caee] 7220                      moveq.l    #32,d1
[0002caf0] 4240                      clr.w      d0
[0002caf2] 2049                      movea.l    a1,a0
[0002caf4] 4eb9 0008 36ea            jsr        memset
[0002cafa] 286b 0004                 movea.l    4(a3),a4
[0002cafe] 2054                      movea.l    (a4),a0
[0002cb00] 41e8 0016                 lea.l      22(a0),a0
[0002cb04] 4eb9 0002 4e1a            jsr        part_get
[0002cb0a] 2a48                      movea.l    a0,a5
[0002cb0c] 200d                      move.l     a5,d0
[0002cb0e] 6714                      beq.s      $0002CB24
[0002cb10] 43d7                      lea.l      (a7),a1
[0002cb12] 204b                      movea.l    a3,a0
[0002cb14] 6100 fe44                 bsr        set_userdef
[0002cb18] 224a                      movea.l    a2,a1
[0002cb1a] 41d7                      lea.l      (a7),a0
[0002cb1c] 266d 0024                 movea.l    36(a5),a3
[0002cb20] 4e93                      jsr        (a3)
[0002cb22] 6020                      bra.s      $0002CB44
[0002cb24] 24bc 0002 ce6a            move.l     #user_dummy,(a2)
[0002cb2a] 486a 0004                 pea.l      4(a2)
[0002cb2e] 43f9 000c 91b6            lea.l      $000C91B6,a1
[0002cb34] 206c 0004                 movea.l    4(a4),a0
[0002cb38] 41e8 0016                 lea.l      22(a0),a0
[0002cb3c] 4eb9 0008 1b26            jsr        sscanf
[0002cb42] 584f                      addq.w     #4,a7
[0002cb44] 4fef 002e                 lea.l      46(a7),a7
[0002cb48] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0002cb4c] 4e75                      rts
reorg:
[0002cb4e] 48e7 003c                 movem.l    a2-a5,-(a7)
[0002cb52] 554f                      subq.w     #2,a7
[0002cb54] 2448                      movea.l    a0,a2
[0002cb56] 2a49                      movea.l    a1,a5
[0002cb58] 4257                      clr.w      (a7)
[0002cb5a] 202a 000e                 move.l     14(a2),d0
[0002cb5e] 4eb9 0004 c608            jsr        Ax_malloc
[0002cb64] 2648                      movea.l    a0,a3
[0002cb66] 200b                      move.l     a3,d0
[0002cb68] 673e                      beq.s      $0002CBA8
[0002cb6a] 286a 0004                 movea.l    4(a2),a4
[0002cb6e] 2a55                      movea.l    (a5),a5
[0002cb70] 486d 000a                 pea.l      10(a5)
[0002cb74] 3f2d 000a                 move.w     10(a5),-(a7)
[0002cb78] 486d 0018                 pea.l      24(a5)
[0002cb7c] 486f 000a                 pea.l      10(a7)
[0002cb80] 342d 0018                 move.w     24(a5),d2
[0002cb84] 72ff                      moveq.l    #-1,d1
[0002cb86] 224b                      movea.l    a3,a1
[0002cb88] 4240                      clr.w      d0
[0002cb8a] 204c                      movea.l    a4,a0
[0002cb8c] 4eb9 0002 cbb0            jsr        subtree
[0002cb92] 4fef 000e                 lea.l      14(a7),a7
[0002cb96] 254b 0004                 move.l     a3,4(a2)
[0002cb9a] 256a 000e 000a            move.l     14(a2),10(a2)
[0002cba0] 204c                      movea.l    a4,a0
[0002cba2] 4eb9 0004 c7c8            jsr        Ax_free
[0002cba8] 544f                      addq.w     #2,a7
[0002cbaa] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0002cbae] 4e75                      rts
subtree:
[0002cbb0] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[0002cbb4] 594f                      subq.w     #4,a7
[0002cbb6] 2a48                      movea.l    a0,a5
[0002cbb8] 3800                      move.w     d0,d4
[0002cbba] 2c49                      movea.l    a1,a6
[0002cbbc] 246f 0030                 movea.l    48(a7),a2
[0002cbc0] 3f41 0002                 move.w     d1,2(a7)
[0002cbc4] 3e82                      move.w     d2,(a7)
[0002cbc6] 266f 0034                 movea.l    52(a7),a3
[0002cbca] 3c2f 0038                 move.w     56(a7),d6
[0002cbce] 286f 003a                 movea.l    58(a7),a4
[0002cbd2] 3612                      move.w     (a2),d3
[0002cbd4] 3004                      move.w     d4,d0
[0002cbd6] d040                      add.w      d0,d0
[0002cbd8] d044                      add.w      d4,d0
[0002cbda] 5440                      addq.w     #2,d0
[0002cbdc] 3217                      move.w     (a7),d1
[0002cbde] b240                      cmp.w      d0,d1
[0002cbe0] 660a                      bne.s      $0002CBEC
[0002cbe2] 3403                      move.w     d3,d2
[0002cbe4] d442                      add.w      d2,d2
[0002cbe6] d443                      add.w      d3,d2
[0002cbe8] 5442                      addq.w     #2,d2
[0002cbea] 3682                      move.w     d2,(a3)
[0002cbec] b846                      cmp.w      d6,d4
[0002cbee] 6602                      bne.s      $0002CBF2
[0002cbf0] 3883                      move.w     d3,(a4)
[0002cbf2] 7038                      moveq.l    #56,d0
[0002cbf4] 3404                      move.w     d4,d2
[0002cbf6] 48c2                      ext.l      d2
[0002cbf8] 2202                      move.l     d2,d1
[0002cbfa] e789                      lsl.l      #3,d1
[0002cbfc] 9282                      sub.l      d2,d1
[0002cbfe] e789                      lsl.l      #3,d1
[0002cc00] 43f5 1800                 lea.l      0(a5,d1.l),a1
[0002cc04] 3403                      move.w     d3,d2
[0002cc06] 48c2                      ext.l      d2
[0002cc08] 2202                      move.l     d2,d1
[0002cc0a] e789                      lsl.l      #3,d1
[0002cc0c] 9282                      sub.l      d2,d1
[0002cc0e] e789                      lsl.l      #3,d1
[0002cc10] 41f6 1800                 lea.l      0(a6,d1.l),a0
[0002cc14] 4eb9 0008 3500            jsr        memcpy
[0002cc1a] 5252                      addq.w     #1,(a2)
[0002cc1c] 3204                      move.w     d4,d1
[0002cc1e] 48c1                      ext.l      d1
[0002cc20] 2001                      move.l     d1,d0
[0002cc22] e788                      lsl.l      #3,d0
[0002cc24] 9081                      sub.l      d1,d0
[0002cc26] e788                      lsl.l      #3,d0
[0002cc28] 3e35 0808                 move.w     8(a5,d0.l),d7
[0002cc2c] 3a35 080a                 move.w     10(a5,d0.l),d5
[0002cc30] 4a45                      tst.w      d5
[0002cc32] 6b3e                      bmi.s      $0002CC72
[0002cc34] 3203                      move.w     d3,d1
[0002cc36] 48c1                      ext.l      d1
[0002cc38] 2401                      move.l     d1,d2
[0002cc3a] e78a                      lsl.l      #3,d2
[0002cc3c] 9481                      sub.l      d1,d2
[0002cc3e] e78a                      lsl.l      #3,d2
[0002cc40] 3d92 280a                 move.w     (a2),10(a6,d2.l)
[0002cc44] 2f0c                      move.l     a4,-(a7)
[0002cc46] 3f06                      move.w     d6,-(a7)
[0002cc48] 2f0b                      move.l     a3,-(a7)
[0002cc4a] 2f0a                      move.l     a2,-(a7)
[0002cc4c] 224e                      movea.l    a6,a1
[0002cc4e] 204d                      movea.l    a5,a0
[0002cc50] 3005                      move.w     d5,d0
[0002cc52] 3203                      move.w     d3,d1
[0002cc54] 342f 000e                 move.w     14(a7),d2
[0002cc58] 6100 ff56                 bsr        subtree
[0002cc5c] 4fef 000e                 lea.l      14(a7),a7
[0002cc60] 3a00                      move.w     d0,d5
[0002cc62] 3403                      move.w     d3,d2
[0002cc64] 48c2                      ext.l      d2
[0002cc66] 2202                      move.l     d2,d1
[0002cc68] e789                      lsl.l      #3,d1
[0002cc6a] 9282                      sub.l      d2,d1
[0002cc6c] e789                      lsl.l      #3,d1
[0002cc6e] 3d80 180c                 move.w     d0,12(a6,d1.l)
[0002cc72] 4a47                      tst.w      d7
[0002cc74] 6b28                      bmi.s      $0002CC9E
[0002cc76] 3203                      move.w     d3,d1
[0002cc78] 48c1                      ext.l      d1
[0002cc7a] 2001                      move.l     d1,d0
[0002cc7c] e788                      lsl.l      #3,d0
[0002cc7e] 9081                      sub.l      d1,d0
[0002cc80] e788                      lsl.l      #3,d0
[0002cc82] 3d92 0808                 move.w     (a2),8(a6,d0.l)
[0002cc86] 3a07                      move.w     d7,d5
[0002cc88] 48c5                      ext.l      d5
[0002cc8a] 2405                      move.l     d5,d2
[0002cc8c] e78a                      lsl.l      #3,d2
[0002cc8e] 9485                      sub.l      d5,d2
[0002cc90] e78a                      lsl.l      #3,d2
[0002cc92] b875 280c                 cmp.w      12(a5,d2.l),d4
[0002cc96] 6706                      beq.s      $0002CC9E
[0002cc98] 3807                      move.w     d7,d4
[0002cc9a] 6000 ff36                 bra        $0002CBD2
[0002cc9e] 3203                      move.w     d3,d1
[0002cca0] 48c1                      ext.l      d1
[0002cca2] 2001                      move.l     d1,d0
[0002cca4] e788                      lsl.l      #3,d0
[0002cca6] 9081                      sub.l      d1,d0
[0002cca8] e788                      lsl.l      #3,d0
[0002ccaa] 3daf 0002 0808            move.w     2(a7),8(a6,d0.l)
[0002ccb0] 3003                      move.w     d3,d0
[0002ccb2] 584f                      addq.w     #4,a7
[0002ccb4] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[0002ccb8] 4e75                      rts
user_control:
[0002ccba] 48e7 2038                 movem.l    d2/a2-a4,-(a7)
[0002ccbe] 246f 0014                 movea.l    20(a7),a2
[0002ccc2] 7001                      moveq.l    #1,d0
[0002ccc4] c06a 0008                 and.w      8(a2),d0
[0002ccc8] 660a                      bne.s      $0002CCD4
[0002ccca] 7201                      moveq.l    #1,d1
[0002cccc] c26a 0006                 and.w      6(a2),d1
[0002ccd0] 6700 0190                 beq        $0002CE62
[0002ccd4] 47f9 0010 c586            lea.l      pxy,a3
[0002ccda] 376a 0016 0004            move.w     22(a2),4(a3)
[0002cce0] 376a 0018 0006            move.w     24(a2),6(a3)
[0002cce6] 49f9 0010 ee4e            lea.l      ACSblk,a4
[0002ccec] 302b 0004                 move.w     4(a3),d0
[0002ccf0] 6606                      bne.s      $0002CCF8
[0002ccf2] 322b 0006                 move.w     6(a3),d1
[0002ccf6] 672c                      beq.s      $0002CD24
[0002ccf8] 36aa 0012                 move.w     18(a2),(a3)
[0002ccfc] 376a 0014 0002            move.w     20(a2),2(a3)
[0002cd02] 70ff                      moveq.l    #-1,d0
[0002cd04] d053                      add.w      (a3),d0
[0002cd06] d16b 0004                 add.w      d0,4(a3)
[0002cd0a] 70ff                      moveq.l    #-1,d0
[0002cd0c] d06b 0002                 add.w      2(a3),d0
[0002cd10] d16b 0006                 add.w      d0,6(a3)
[0002cd14] 204b                      movea.l    a3,a0
[0002cd16] 7201                      moveq.l    #1,d1
[0002cd18] 2254                      movea.l    (a4),a1
[0002cd1a] 3029 0010                 move.w     16(a1),d0
[0002cd1e] 4eb9 0007 2230            jsr        vs_clip
[0002cd24] 7203                      moveq.l    #3,d1
[0002cd26] 2054                      movea.l    (a4),a0
[0002cd28] 3028 0010                 move.w     16(a0),d0
[0002cd2c] 4eb9 0007 3070            jsr        vswr_mode
[0002cd32] 7201                      moveq.l    #1,d1
[0002cd34] 2054                      movea.l    (a4),a0
[0002cd36] 3028 0010                 move.w     16(a0),d0
[0002cd3a] 4eb9 0007 316a            jsr        vsl_width
[0002cd40] 4242                      clr.w      d2
[0002cd42] 4241                      clr.w      d1
[0002cd44] 2054                      movea.l    (a4),a0
[0002cd46] 3028 0010                 move.w     16(a0),d0
[0002cd4a] 4eb9 0007 3214            jsr        vsl_ends
[0002cd50] 7207                      moveq.l    #7,d1
[0002cd52] 2054                      movea.l    (a4),a0
[0002cd54] 3028 0010                 move.w     16(a0),d0
[0002cd58] 4eb9 0007 30c4            jsr        vsl_type
[0002cd5e] 7201                      moveq.l    #1,d1
[0002cd60] 2054                      movea.l    (a4),a0
[0002cd62] 3028 0010                 move.w     16(a0),d0
[0002cd66] 4eb9 0007 31c0            jsr        vsl_color
[0002cd6c] 36aa 000a                 move.w     10(a2),(a3)
[0002cd70] 376a 000c 0002            move.w     12(a2),2(a3)
[0002cd76] 3013                      move.w     (a3),d0
[0002cd78] d06a 000e                 add.w      14(a2),d0
[0002cd7c] 5340                      subq.w     #1,d0
[0002cd7e] 3740 0004                 move.w     d0,4(a3)
[0002cd82] 322b 0002                 move.w     2(a3),d1
[0002cd86] d26a 0010                 add.w      16(a2),d1
[0002cd8a] 5341                      subq.w     #1,d1
[0002cd8c] 3741 0006                 move.w     d1,6(a3)
[0002cd90] 342b 0002                 move.w     2(a3),d2
[0002cd94] 3013                      move.w     (a3),d0
[0002cd96] 322b 0004                 move.w     4(a3),d1
[0002cd9a] 4eb9 0004 76bc            jsr        xline2
[0002cda0] 342b 0006                 move.w     6(a3),d2
[0002cda4] 322b 0004                 move.w     4(a3),d1
[0002cda8] 3013                      move.w     (a3),d0
[0002cdaa] 4eb9 0004 76bc            jsr        xline2
[0002cdb0] 3413                      move.w     (a3),d2
[0002cdb2] 322b 0006                 move.w     6(a3),d1
[0002cdb6] 302b 0002                 move.w     2(a3),d0
[0002cdba] 4eb9 0004 778a            jsr        yline2
[0002cdc0] 342b 0004                 move.w     4(a3),d2
[0002cdc4] 322b 0006                 move.w     6(a3),d1
[0002cdc8] 302b 0002                 move.w     2(a3),d0
[0002cdcc] 4eb9 0004 778a            jsr        yline2
[0002cdd2] 302a 000e                 move.w     14(a2),d0
[0002cdd6] e640                      asr.w      #3,d0
[0002cdd8] 5140                      subq.w     #8,d0
[0002cdda] 6f10                      ble.s      $0002CDEC
[0002cddc] 322b 0004                 move.w     4(a3),d1
[0002cde0] 342a 000e                 move.w     14(a2),d2
[0002cde4] e642                      asr.w      #3,d2
[0002cde6] 9242                      sub.w      d2,d1
[0002cde8] 3681                      move.w     d1,(a3)
[0002cdea] 6008                      bra.s      $0002CDF4
[0002cdec] 70f8                      moveq.l    #-8,d0
[0002cdee] d06b 0004                 add.w      4(a3),d0
[0002cdf2] 3680                      move.w     d0,(a3)
[0002cdf4] 302a 0010                 move.w     16(a2),d0
[0002cdf8] e640                      asr.w      #3,d0
[0002cdfa] 5140                      subq.w     #8,d0
[0002cdfc] 6f12                      ble.s      $0002CE10
[0002cdfe] 322b 0006                 move.w     6(a3),d1
[0002ce02] 342a 0010                 move.w     16(a2),d2
[0002ce06] e642                      asr.w      #3,d2
[0002ce08] 9242                      sub.w      d2,d1
[0002ce0a] 3741 0002                 move.w     d1,2(a3)
[0002ce0e] 600a                      bra.s      $0002CE1A
[0002ce10] 70f8                      moveq.l    #-8,d0
[0002ce12] d06b 0006                 add.w      6(a3),d0
[0002ce16] 3740 0002                 move.w     d0,2(a3)
[0002ce1a] 7201                      moveq.l    #1,d1
[0002ce1c] 2054                      movea.l    (a4),a0
[0002ce1e] 3028 0010                 move.w     16(a0),d0
[0002ce22] 4eb9 0007 3660            jsr        vsf_interior
[0002ce28] 7201                      moveq.l    #1,d1
[0002ce2a] 2054                      movea.l    (a4),a0
[0002ce2c] 3028 0010                 move.w     16(a0),d0
[0002ce30] 4eb9 0007 3708            jsr        vsf_color
[0002ce36] 4241                      clr.w      d1
[0002ce38] 2054                      movea.l    (a4),a0
[0002ce3a] 3028 0010                 move.w     16(a0),d0
[0002ce3e] 4eb9 0007 375c            jsr        vsf_perimeter
[0002ce44] 204b                      movea.l    a3,a0
[0002ce46] 2254                      movea.l    (a4),a1
[0002ce48] 3029 0010                 move.w     16(a1),d0
[0002ce4c] 4eb9 0007 282e            jsr        v_bar
[0002ce52] 204b                      movea.l    a3,a0
[0002ce54] 4241                      clr.w      d1
[0002ce56] 2254                      movea.l    (a4),a1
[0002ce58] 3029 0010                 move.w     16(a1),d0
[0002ce5c] 4eb9 0007 2230            jsr        vs_clip
[0002ce62] 4240                      clr.w      d0
[0002ce64] 4cdf 1c04                 movem.l    (a7)+,d2/a2-a4
[0002ce68] 4e75                      rts
user_dummy:
[0002ce6a] 48e7 2028                 movem.l    d2/a2/a4,-(a7)
[0002ce6e] 514f                      subq.w     #8,a7
[0002ce70] 246f 0018                 movea.l    24(a7),a2
[0002ce74] 3f6a 0016 0004            move.w     22(a2),4(a7)
[0002ce7a] 3f6a 0018 0006            move.w     24(a2),6(a7)
[0002ce80] 49f9 0010 ee4e            lea.l      ACSblk,a4
[0002ce86] 302f 0004                 move.w     4(a7),d0
[0002ce8a] 6606                      bne.s      $0002CE92
[0002ce8c] 322f 0006                 move.w     6(a7),d1
[0002ce90] 672c                      beq.s      $0002CEBE
[0002ce92] 3eaa 0012                 move.w     18(a2),(a7)
[0002ce96] 3f6a 0014 0002            move.w     20(a2),2(a7)
[0002ce9c] 70ff                      moveq.l    #-1,d0
[0002ce9e] d057                      add.w      (a7),d0
[0002cea0] d16f 0004                 add.w      d0,4(a7)
[0002cea4] 70ff                      moveq.l    #-1,d0
[0002cea6] d06f 0002                 add.w      2(a7),d0
[0002ceaa] d16f 0006                 add.w      d0,6(a7)
[0002ceae] 41d7                      lea.l      (a7),a0
[0002ceb0] 7201                      moveq.l    #1,d1
[0002ceb2] 2254                      movea.l    (a4),a1
[0002ceb4] 3029 0010                 move.w     16(a1),d0
[0002ceb8] 4eb9 0007 2230            jsr        vs_clip
[0002cebe] 7001                      moveq.l    #1,d0
[0002cec0] c06a 0008                 and.w      8(a2),d0
[0002cec4] 6664                      bne.s      $0002CF2A
[0002cec6] 7201                      moveq.l    #1,d1
[0002cec8] c26a 0006                 and.w      6(a2),d1
[0002cecc] 665c                      bne.s      $0002CF2A
[0002cece] 2054                      movea.l    (a4),a0
[0002ced0] 3028 0010                 move.w     16(a0),d0
[0002ced4] 7203                      moveq.l    #3,d1
[0002ced6] 4eb9 0007 3070            jsr        vswr_mode
[0002cedc] 3eaa 000a                 move.w     10(a2),(a7)
[0002cee0] 3f6a 000c 0002            move.w     12(a2),2(a7)
[0002cee6] 3017                      move.w     (a7),d0
[0002cee8] d06a 000e                 add.w      14(a2),d0
[0002ceec] 5340                      subq.w     #1,d0
[0002ceee] 3f40 0004                 move.w     d0,4(a7)
[0002cef2] 322f 0002                 move.w     2(a7),d1
[0002cef6] d26a 0010                 add.w      16(a2),d1
[0002cefa] 5341                      subq.w     #1,d1
[0002cefc] 3f41 0006                 move.w     d1,6(a7)
[0002cf00] 2054                      movea.l    (a4),a0
[0002cf02] 3028 0010                 move.w     16(a0),d0
[0002cf06] 7201                      moveq.l    #1,d1
[0002cf08] 4eb9 0007 3660            jsr        vsf_interior
[0002cf0e] 7201                      moveq.l    #1,d1
[0002cf10] 2054                      movea.l    (a4),a0
[0002cf12] 3028 0010                 move.w     16(a0),d0
[0002cf16] 4eb9 0007 3708            jsr        vsf_color
[0002cf1c] 41d7                      lea.l      (a7),a0
[0002cf1e] 2254                      movea.l    (a4),a1
[0002cf20] 3029 0010                 move.w     16(a1),d0
[0002cf24] 4eb9 0007 282e            jsr        v_bar
[0002cf2a] 41d7                      lea.l      (a7),a0
[0002cf2c] 4241                      clr.w      d1
[0002cf2e] 2254                      movea.l    (a4),a1
[0002cf30] 3029 0010                 move.w     16(a1),d0
[0002cf34] 4eb9 0007 2230            jsr        vs_clip
[0002cf3a] 70fe                      moveq.l    #-2,d0
[0002cf3c] c06a 0008                 and.w      8(a2),d0
[0002cf40] 504f                      addq.w     #8,a7
[0002cf42] 4cdf 1404                 movem.l    (a7)+,d2/a2/a4
[0002cf46] 4e75                      rts
