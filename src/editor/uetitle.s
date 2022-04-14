edti_pos:
[0002b3b0] 48e7 0038                 movem.l    a2-a4,-(a7)
[0002b3b4] 514f                      subq.w     #8,a7
[0002b3b6] 41f9 000c 9f68            lea.l      POP_HORPOSSEL,a0
[0002b3bc] 4eb9 0004 f064            jsr        Aob_create
[0002b3c2] 2448                      movea.l    a0,a2
[0002b3c4] 200a                      move.l     a2,d0
[0002b3c6] 6700 0122                 beq        $0002B4EA
[0002b3ca] 47f9 0010 ee4e            lea.l      ACSblk,a3
[0002b3d0] 7019                      moveq.l    #25,d0
[0002b3d2] 2053                      movea.l    (a3),a0
[0002b3d4] 2268 0258                 movea.l    600(a0),a1
[0002b3d8] 2269 0014                 movea.l    20(a1),a1
[0002b3dc] 41d7                      lea.l      (a7),a0
[0002b3de] 4eb9 0004 fe06            jsr        Aob_offset
[0002b3e4] 7001                      moveq.l    #1,d0
[0002b3e6] 2053                      movea.l    (a3),a0
[0002b3e8] 2268 0258                 movea.l    600(a0),a1
[0002b3ec] d069 0034                 add.w      52(a1),d0
[0002b3f0] d157                      add.w      d0,(a7)
[0002b3f2] 7201                      moveq.l    #1,d1
[0002b3f4] d269 0036                 add.w      54(a1),d1
[0002b3f8] d36f 0002                 add.w      d1,2(a7)
[0002b3fc] 7403                      moveq.l    #3,d2
[0002b3fe] 2268 025c                 movea.l    604(a0),a1
[0002b402] 2069 003c                 movea.l    60(a1),a0
[0002b406] c468 0006                 and.w      6(a0),d2
[0002b40a] 4a42                      tst.w      d2
[0002b40c] 670a                      beq.s      $0002B418
[0002b40e] 5342                      subq.w     #1,d2
[0002b410] 670e                      beq.s      $0002B420
[0002b412] 5342                      subq.w     #1,d2
[0002b414] 6712                      beq.s      $0002B428
[0002b416] 6016                      bra.s      $0002B42E
[0002b418] 006a 0004 0022            ori.w      #$0004,34(a2)
[0002b41e] 600e                      bra.s      $0002B42E
[0002b420] 006a 0004 003a            ori.w      #$0004,58(a2)
[0002b426] 6006                      bra.s      $0002B42E
[0002b428] 006a 0004 0052            ori.w      #$0004,82(a2)
[0002b42e] 322f 0002                 move.w     2(a7),d1
[0002b432] 3017                      move.w     (a7),d0
[0002b434] 224a                      movea.l    a2,a1
[0002b436] 2053                      movea.l    (a3),a0
[0002b438] 2068 0258                 movea.l    600(a0),a0
[0002b43c] 4eb9 0004 e84a            jsr        Ame_popup
[0002b442] 4a40                      tst.w      d0
[0002b444] 6f00 009c                 ble        $0002B4E2
[0002b448] 2053                      movea.l    (a3),a0
[0002b44a] 2268 025c                 movea.l    604(a0),a1
[0002b44e] 2869 003c                 movea.l    60(a1),a4
[0002b452] 584c                      addq.w     #4,a4
[0002b454] 0294 ffff fffc            andi.l     #$FFFFFFFC,(a4)
[0002b45a] 3200                      move.w     d0,d1
[0002b45c] 5341                      subq.w     #1,d1
[0002b45e] 670a                      beq.s      $0002B46A
[0002b460] 5341                      subq.w     #1,d1
[0002b462] 671c                      beq.s      $0002B480
[0002b464] 5341                      subq.w     #1,d1
[0002b466] 6734                      beq.s      $0002B49C
[0002b468] 604c                      bra.s      $0002B4B6
[0002b46a] 43f9 000c 9769            lea.l      HPOS_TEXT1,a1
[0002b470] 701b                      moveq.l    #27,d0
[0002b472] 2053                      movea.l    (a3),a0
[0002b474] 2068 025c                 movea.l    604(a0),a0
[0002b478] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b47e] 6036                      bra.s      $0002B4B6
[0002b480] 0094 0000 0001            ori.l      #$00000001,(a4)
[0002b486] 43f9 000c 9771            lea.l      HPOS_TEXT2,a1
[0002b48c] 701b                      moveq.l    #27,d0
[0002b48e] 2053                      movea.l    (a3),a0
[0002b490] 2068 025c                 movea.l    604(a0),a0
[0002b494] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b49a] 601a                      bra.s      $0002B4B6
[0002b49c] 0094 0000 0002            ori.l      #$00000002,(a4)
[0002b4a2] 43f9 000c 9779            lea.l      HPOS_TEXT3,a1
[0002b4a8] 701b                      moveq.l    #27,d0
[0002b4aa] 2053                      movea.l    (a3),a0
[0002b4ac] 2068 025c                 movea.l    604(a0),a0
[0002b4b0] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b4b6] 72ff                      moveq.l    #-1,d1
[0002b4b8] 701b                      moveq.l    #27,d0
[0002b4ba] 2053                      movea.l    (a3),a0
[0002b4bc] 2068 0258                 movea.l    600(a0),a0
[0002b4c0] 2253                      movea.l    (a3),a1
[0002b4c2] 2869 0258                 movea.l    600(a1),a4
[0002b4c6] 226c 0066                 movea.l    102(a4),a1
[0002b4ca] 4e91                      jsr        (a1)
[0002b4cc] 72ff                      moveq.l    #-1,d1
[0002b4ce] 7001                      moveq.l    #1,d0
[0002b4d0] 2053                      movea.l    (a3),a0
[0002b4d2] 2068 0258                 movea.l    600(a0),a0
[0002b4d6] 2253                      movea.l    (a3),a1
[0002b4d8] 2869 0258                 movea.l    600(a1),a4
[0002b4dc] 226c 0066                 movea.l    102(a4),a1
[0002b4e0] 4e91                      jsr        (a1)
[0002b4e2] 204a                      movea.l    a2,a0
[0002b4e4] 4eb9 0004 f20a            jsr        Aob_delete
[0002b4ea] 504f                      addq.w     #8,a7
[0002b4ec] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0002b4f0] 4e75                      rts
edti_replace:
[0002b4f2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002b4f8] 2268 025c                 movea.l    604(a0),a1
[0002b4fc] 2069 003c                 movea.l    60(a1),a0
[0002b500] 00a8 0000 0008 0004       ori.l      #$00000008,4(a0)
[0002b508] 7002                      moveq.l    #2,d0
[0002b50a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002b510] 2068 0258                 movea.l    600(a0),a0
[0002b514] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002b51a] 4e75                      rts
edti_size:
[0002b51c] 48e7 0038                 movem.l    a2-a4,-(a7)
[0002b520] 514f                      subq.w     #8,a7
[0002b522] 41f9 000c a0a0            lea.l      POP_SIZESEL,a0
[0002b528] 4eb9 0004 f064            jsr        Aob_create
[0002b52e] 2448                      movea.l    a0,a2
[0002b530] 200a                      move.l     a2,d0
[0002b532] 6700 00ea                 beq        $0002B61E
[0002b536] 47f9 0010 ee4e            lea.l      ACSblk,a3
[0002b53c] 700b                      moveq.l    #11,d0
[0002b53e] 2053                      movea.l    (a3),a0
[0002b540] 2268 0258                 movea.l    600(a0),a1
[0002b544] 2269 0014                 movea.l    20(a1),a1
[0002b548] 41d7                      lea.l      (a7),a0
[0002b54a] 4eb9 0004 fe06            jsr        Aob_offset
[0002b550] 7001                      moveq.l    #1,d0
[0002b552] 2053                      movea.l    (a3),a0
[0002b554] 2268 0258                 movea.l    600(a0),a1
[0002b558] d069 0034                 add.w      52(a1),d0
[0002b55c] d157                      add.w      d0,(a7)
[0002b55e] 7201                      moveq.l    #1,d1
[0002b560] d269 0036                 add.w      54(a1),d1
[0002b564] d36f 0002                 add.w      d1,2(a7)
[0002b568] 2268 025c                 movea.l    604(a0),a1
[0002b56c] 2069 003c                 movea.l    60(a1),a0
[0002b570] 2028 0004                 move.l     4(a0),d0
[0002b574] e480                      asr.l      #2,d0
[0002b576] c07c 0001                 and.w      #$0001,d0
[0002b57a] 48c0                      ext.l      d0
[0002b57c] 2400                      move.l     d0,d2
[0002b57e] d482                      add.l      d2,d2
[0002b580] d480                      add.l      d0,d2
[0002b582] e78a                      lsl.l      #3,d2
[0002b584] 0072 0004 2822            ori.w      #$0004,34(a2,d2.l)
[0002b58a] 322f 0002                 move.w     2(a7),d1
[0002b58e] 3017                      move.w     (a7),d0
[0002b590] 224a                      movea.l    a2,a1
[0002b592] 2053                      movea.l    (a3),a0
[0002b594] 2068 0258                 movea.l    600(a0),a0
[0002b598] 4eb9 0004 e84a            jsr        Ame_popup
[0002b59e] 4a40                      tst.w      d0
[0002b5a0] 6f74                      ble.s      $0002B616
[0002b5a2] 2053                      movea.l    (a3),a0
[0002b5a4] 2268 025c                 movea.l    604(a0),a1
[0002b5a8] 2869 003c                 movea.l    60(a1),a4
[0002b5ac] 584c                      addq.w     #4,a4
[0002b5ae] b07c 0001                 cmp.w      #$0001,d0
[0002b5b2] 661c                      bne.s      $0002B5D0
[0002b5b4] 0294 ffff fffb            andi.l     #$FFFFFFFB,(a4)
[0002b5ba] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[0002b5c0] 700d                      moveq.l    #13,d0
[0002b5c2] 2053                      movea.l    (a3),a0
[0002b5c4] 2068 025c                 movea.l    604(a0),a0
[0002b5c8] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b5ce] 601a                      bra.s      $0002B5EA
[0002b5d0] 0094 0000 0004            ori.l      #$00000004,(a4)
[0002b5d6] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[0002b5dc] 700d                      moveq.l    #13,d0
[0002b5de] 2053                      movea.l    (a3),a0
[0002b5e0] 2068 025c                 movea.l    604(a0),a0
[0002b5e4] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b5ea] 72ff                      moveq.l    #-1,d1
[0002b5ec] 700d                      moveq.l    #13,d0
[0002b5ee] 2053                      movea.l    (a3),a0
[0002b5f0] 2068 0258                 movea.l    600(a0),a0
[0002b5f4] 2253                      movea.l    (a3),a1
[0002b5f6] 2869 0258                 movea.l    600(a1),a4
[0002b5fa] 226c 0066                 movea.l    102(a4),a1
[0002b5fe] 4e91                      jsr        (a1)
[0002b600] 72ff                      moveq.l    #-1,d1
[0002b602] 7001                      moveq.l    #1,d0
[0002b604] 2053                      movea.l    (a3),a0
[0002b606] 2068 0258                 movea.l    600(a0),a0
[0002b60a] 2253                      movea.l    (a3),a1
[0002b60c] 2869 0258                 movea.l    600(a1),a4
[0002b610] 226c 0066                 movea.l    102(a4),a1
[0002b614] 4e91                      jsr        (a1)
[0002b616] 204a                      movea.l    a2,a0
[0002b618] 4eb9 0004 f20a            jsr        Aob_delete
[0002b61e] 504f                      addq.w     #8,a7
[0002b620] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0002b624] 4e75                      rts
edti_trans:
[0002b626] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002b62c] 2268 025c                 movea.l    604(a0),a1
[0002b630] 2069 003c                 movea.l    60(a1),a0
[0002b634] 02a8 ffff fff7 0004       andi.l     #$FFFFFFF7,4(a0)
[0002b63c] 7002                      moveq.l    #2,d0
[0002b63e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002b644] 2068 0258                 movea.l    600(a0),a0
[0002b648] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002b64e] 4e75                      rts

; start editor\uetitle.c

init_title:
[0002b650] 2f0a                      move.l     a2,-(a7)
[0002b652] 2f0b                      move.l     a3,-(a7)
[0002b654] 2448                      movea.l    a0,a2
[0002b656] 43f9 000c 490e            lea.l      data,a1
[0002b65c] 303c 2329                 move.w     #$2329,d0
[0002b660] 266a 0004                 movea.l    4(a2),a3
[0002b664] 4e93                      jsr        (a3)
[0002b666] 265f                      movea.l    (a7)+,a3
[0002b668] 245f                      movea.l    (a7)+,a2
[0002b66a] 4e75                      rts
minsize:
[0002b66c] 2f0a                      move.l     a2,-(a7)
[0002b66e] 2f0b                      move.l     a3,-(a7)
[0002b670] 2649                      movea.l    a1,a3
[0002b672] 2468 000c                 movea.l    12(a0),a2
[0002b676] 204a                      movea.l    a2,a0
[0002b678] 4eb9 0008 2f6c            jsr        strlen
[0002b67e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002b684] c1e8 0012                 muls.w     18(a0),d0
[0002b688] 3680                      move.w     d0,(a3)
[0002b68a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002b690] 226f 000c                 movea.l    12(a7),a1
[0002b694] 32a8 0014                 move.w     20(a0),(a1)
[0002b698] 265f                      movea.l    (a7)+,a3
[0002b69a] 245f                      movea.l    (a7)+,a2
[0002b69c] 4e75                      rts
object_tree:
[0002b69e] 48e7 003e                 movem.l    a2-a6,-(a7)
[0002b6a2] 594f                      subq.w     #4,a7
[0002b6a4] 2a48                      movea.l    a0,a5
[0002b6a6] 2849                      movea.l    a1,a4
[0002b6a8] 41f9 000c 45f0            lea.l      ED_TITLE,a0
[0002b6ae] 4eb9 0004 f064            jsr        Aob_create
[0002b6b4] 2448                      movea.l    a0,a2
[0002b6b6] 200a                      move.l     a2,d0
[0002b6b8] 6606                      bne.s      $0002B6C0
[0002b6ba] 91c8                      suba.l     a0,a0
[0002b6bc] 6000 0194                 bra        $0002B852
[0002b6c0] 47ea 0030                 lea.l      48(a2),a3
[0002b6c4] 7016                      moveq.l    #22,d0
[0002b6c6] c06c 0008                 and.w      8(a4),d0
[0002b6ca] 816b 0008                 or.w       d0,8(a3)
[0002b6ce] 703f                      moveq.l    #63,d0
[0002b6d0] c06c 000a                 and.w      10(a4),d0
[0002b6d4] 816b 000a                 or.w       d0,10(a3)
[0002b6d8] 49f9 0010 ee4e            lea.l      ACSblk,a4
[0002b6de] 700e                      moveq.l    #14,d0
[0002b6e0] 224a                      movea.l    a2,a1
[0002b6e2] 2054                      movea.l    (a4),a0
[0002b6e4] 2068 0258                 movea.l    600(a0),a0
[0002b6e8] 4eb9 0003 0b9a            jsr        oe_beself
[0002b6ee] 7002                      moveq.l    #2,d0
[0002b6f0] 224a                      movea.l    a2,a1
[0002b6f2] 2054                      movea.l    (a4),a0
[0002b6f4] 2068 0258                 movea.l    600(a0),a0
[0002b6f8] 4eb9 0003 0b9a            jsr        oe_beself
[0002b6fe] 7017                      moveq.l    #23,d0
[0002b700] 224a                      movea.l    a2,a1
[0002b702] 2054                      movea.l    (a4),a0
[0002b704] 2068 0258                 movea.l    600(a0),a0
[0002b708] 4eb9 0003 0b9a            jsr        oe_beself
[0002b70e] 7018                      moveq.l    #24,d0
[0002b710] 224a                      movea.l    a2,a1
[0002b712] 2054                      movea.l    (a4),a0
[0002b714] 2068 0258                 movea.l    600(a0),a0
[0002b718] 4eb9 0003 0b9a            jsr        oe_beself
[0002b71e] 286b 000c                 movea.l    12(a3),a4
[0002b722] 4857                      pea.l      (a7)
[0002b724] 43f9 000c 4974            lea.l      $000C4974,a1
[0002b72a] 2055                      movea.l    (a5),a0
[0002b72c] 4eb9 0008 1b26            jsr        sscanf
[0002b732] 584f                      addq.w     #4,a7
[0002b734] 2957 0004                 move.l     (a7),4(a4)
[0002b738] 0c6d 0002 0008            cmpi.w     #$0002,8(a5)
[0002b73e] 6610                      bne.s      $0002B750
[0002b740] 226d 000a                 movea.l    10(a5),a1
[0002b744] 700e                      moveq.l    #14,d0
[0002b746] 204a                      movea.l    a2,a0
[0002b748] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b74e] 6020                      bra.s      $0002B770
[0002b750] 43f9 000c 4963            lea.l      $000C4963,a1
[0002b756] 7004                      moveq.l    #4,d0
[0002b758] 204b                      movea.l    a3,a0
[0002b75a] 2c6c 0008                 movea.l    8(a4),a6
[0002b75e] 4e96                      jsr        (a6)
[0002b760] 43f9 000c 4963            lea.l      $000C4963,a1
[0002b766] 700e                      moveq.l    #14,d0
[0002b768] 204a                      movea.l    a2,a0
[0002b76a] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b770] 7004                      moveq.l    #4,d0
[0002b772] c097                      and.l      (a7),d0
[0002b774] 6712                      beq.s      $0002B788
[0002b776] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[0002b77c] 204a                      movea.l    a2,a0
[0002b77e] 700d                      moveq.l    #13,d0
[0002b780] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b786] 6010                      bra.s      $0002B798
[0002b788] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[0002b78e] 700d                      moveq.l    #13,d0
[0002b790] 204a                      movea.l    a2,a0
[0002b792] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b798] 7003                      moveq.l    #3,d0
[0002b79a] c06f 0002                 and.w      2(a7),d0
[0002b79e] 4a40                      tst.w      d0
[0002b7a0] 670a                      beq.s      $0002B7AC
[0002b7a2] 5340                      subq.w     #1,d0
[0002b7a4] 6718                      beq.s      $0002B7BE
[0002b7a6] 5340                      subq.w     #1,d0
[0002b7a8] 6726                      beq.s      $0002B7D0
[0002b7aa] 6034                      bra.s      $0002B7E0
[0002b7ac] 43f9 000c 9769            lea.l      HPOS_TEXT1,a1
[0002b7b2] 701b                      moveq.l    #27,d0
[0002b7b4] 204a                      movea.l    a2,a0
[0002b7b6] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b7bc] 6022                      bra.s      $0002B7E0
[0002b7be] 43f9 000c 9771            lea.l      HPOS_TEXT2,a1
[0002b7c4] 701b                      moveq.l    #27,d0
[0002b7c6] 204a                      movea.l    a2,a0
[0002b7c8] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b7ce] 6010                      bra.s      $0002B7E0
[0002b7d0] 43f9 000c 9779            lea.l      HPOS_TEXT3,a1
[0002b7d6] 701b                      moveq.l    #27,d0
[0002b7d8] 204a                      movea.l    a2,a0
[0002b7da] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b7e0] 206a 0234                 movea.l    564(a2),a0
[0002b7e4] 2968 000c 0018            move.l     12(a0),24(a4)
[0002b7ea] 206d 0026                 movea.l    38(a5),a0
[0002b7ee] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b7f4] 4a40                      tst.w      d0
[0002b7f6] 6712                      beq.s      $0002B80A
[0002b7f8] 43f9 000c 4963            lea.l      $000C4963,a1
[0002b7fe] 7017                      moveq.l    #23,d0
[0002b800] 204a                      movea.l    a2,a0
[0002b802] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b808] 600e                      bra.s      $0002B818
[0002b80a] 226d 0026                 movea.l    38(a5),a1
[0002b80e] 7017                      moveq.l    #23,d0
[0002b810] 204a                      movea.l    a2,a0
[0002b812] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b818] 206a 024c                 movea.l    588(a2),a0
[0002b81c] 2968 000c 001c            move.l     12(a0),28(a4)
[0002b822] 206d 002a                 movea.l    42(a5),a0
[0002b826] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b82c] 4a40                      tst.w      d0
[0002b82e] 6712                      beq.s      $0002B842
[0002b830] 43f9 000c 4963            lea.l      $000C4963,a1
[0002b836] 7018                      moveq.l    #24,d0
[0002b838] 204a                      movea.l    a2,a0
[0002b83a] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b840] 600e                      bra.s      $0002B850
[0002b842] 226d 002a                 movea.l    42(a5),a1
[0002b846] 7018                      moveq.l    #24,d0
[0002b848] 204a                      movea.l    a2,a0
[0002b84a] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b850] 204a                      movea.l    a2,a0
[0002b852] 584f                      addq.w     #4,a7
[0002b854] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[0002b858] 4e75                      rts
test_it:
[0002b85a] 2f0a                      move.l     a2,-(a7)
[0002b85c] 2f0b                      move.l     a3,-(a7)
[0002b85e] 2648                      movea.l    a0,a3
[0002b860] 2449                      movea.l    a1,a2
[0002b862] 22bc 0006 5620            move.l     #A_title,(a1)
[0002b868] 486a 0004                 pea.l      4(a2)
[0002b86c] 43f9 000c 4974            lea.l      $000C4974,a1
[0002b872] 2050                      movea.l    (a0),a0
[0002b874] 4eb9 0008 1b26            jsr        sscanf
[0002b87a] 584f                      addq.w     #4,a7
[0002b87c] 257c 0006 30f2 0008       move.l     #Auo_string,8(a2)
[0002b884] 0c6b 0002 0008            cmpi.w     #$0002,8(a3)
[0002b88a] 6608                      bne.s      $0002B894
[0002b88c] 256b 000a 000c            move.l     10(a3),12(a2)
[0002b892] 6004                      bra.s      $0002B898
[0002b894] 42aa 000c                 clr.l      12(a2)
[0002b898] 7000                      moveq.l    #0,d0
[0002b89a] 2540 0014                 move.l     d0,20(a2)
[0002b89e] 2540 0010                 move.l     d0,16(a2)
[0002b8a2] 206b 0026                 movea.l    38(a3),a0
[0002b8a6] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b8ac] 4a40                      tst.w      d0
[0002b8ae] 6704                      beq.s      $0002B8B4
[0002b8b0] 91c8                      suba.l     a0,a0
[0002b8b2] 6004                      bra.s      $0002B8B8
[0002b8b4] 206b 0026                 movea.l    38(a3),a0
[0002b8b8] 2548 0018                 move.l     a0,24(a2)
[0002b8bc] 206b 002a                 movea.l    42(a3),a0
[0002b8c0] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b8c6] 4a40                      tst.w      d0
[0002b8c8] 6704                      beq.s      $0002B8CE
[0002b8ca] 91c8                      suba.l     a0,a0
[0002b8cc] 6004                      bra.s      $0002B8D2
[0002b8ce] 206b 002a                 movea.l    42(a3),a0
[0002b8d2] 2548 001c                 move.l     a0,28(a2)
[0002b8d6] 265f                      movea.l    (a7)+,a3
[0002b8d8] 245f                      movea.l    (a7)+,a2
[0002b8da] 4e75                      rts
abort:
[0002b8dc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002b8e2] 2268 0258                 movea.l    600(a0),a1
[0002b8e6] 2069 0014                 movea.l    20(a1),a0
[0002b8ea] 2068 003c                 movea.l    60(a0),a0
[0002b8ee] 42a8 0018                 clr.l      24(a0)
[0002b8f2] 42a8 001c                 clr.l      28(a0)
[0002b8f6] 2079 000c 494e            movea.l    $000C494E,a0
[0002b8fc] 2050                      movea.l    (a0),a0
[0002b8fe] 4e90                      jsr        (a0)
[0002b900] 4e75                      rts
ok:
[0002b902] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0002b906] 4fef ffce                 lea.l      -50(a7),a7
[0002b90a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002b910] 2268 0258                 movea.l    600(a0),a1
[0002b914] 2469 0014                 movea.l    20(a1),a2
[0002b918] 286a 003c                 movea.l    60(a2),a4
[0002b91c] 47f9 0010 c566            lea.l      parm,a3
[0002b922] 2f2c 0004                 move.l     4(a4),-(a7)
[0002b926] 43f9 000c 4974            lea.l      $000C4974,a1
[0002b92c] 204b                      movea.l    a3,a0
[0002b92e] 4eb9 0008 15ac            jsr        sprintf
[0002b934] 584f                      addq.w     #4,a7
[0002b936] 49ef 0004                 lea.l      4(a7),a4
[0002b93a] 288b                      move.l     a3,(a4)
[0002b93c] 297c 000c 4969 0004       move.l     #$000C4969,4(a4)
[0002b944] 43d7                      lea.l      (a7),a1
[0002b946] 7003                      moveq.l    #3,d0
[0002b948] 41ea 0150                 lea.l      336(a2),a0
[0002b94c] 4eb9 0006 a068            jsr        Auo_boxed
[0002b952] 2057                      movea.l    (a7),a0
[0002b954] 4eb9 0008 2f6c            jsr        strlen
[0002b95a] 5680                      addq.l     #3,d0
[0002b95c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002b962] 3228 0012                 move.w     18(a0),d1
[0002b966] 48c1                      ext.l      d1
[0002b968] 4eb9 0008 3c32            jsr        _ulmul
[0002b96e] 2600                      move.l     d0,d3
[0002b970] 397c 0002 0008            move.w     #$0002,8(a4)
[0002b976] 2957 000a                 move.l     (a7),10(a4)
[0002b97a] 42ac 000e                 clr.l      14(a4)
[0002b97e] 4240                      clr.w      d0
[0002b980] 3940 001c                 move.w     d0,28(a4)
[0002b984] 3940 0012                 move.w     d0,18(a4)
[0002b988] 7200                      moveq.l    #0,d1
[0002b98a] 2941 001e                 move.l     d1,30(a4)
[0002b98e] 2941 0014                 move.l     d1,20(a4)
[0002b992] 7000                      moveq.l    #0,d0
[0002b994] 2940 0022                 move.l     d0,34(a4)
[0002b998] 2940 0018                 move.l     d0,24(a4)
[0002b99c] 43ec 0026                 lea.l      38(a4),a1
[0002b9a0] 41ea 0228                 lea.l      552(a2),a0
[0002b9a4] 7003                      moveq.l    #3,d0
[0002b9a6] 4eb9 0006 a068            jsr        Auo_boxed
[0002b9ac] 206c 0026                 movea.l    38(a4),a0
[0002b9b0] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b9b6] 4a40                      tst.w      d0
[0002b9b8] 6704                      beq.s      $0002B9BE
[0002b9ba] 42ac 0026                 clr.l      38(a4)
[0002b9be] 43ec 002a                 lea.l      42(a4),a1
[0002b9c2] 7003                      moveq.l    #3,d0
[0002b9c4] 41ea 0240                 lea.l      576(a2),a0
[0002b9c8] 4eb9 0006 a068            jsr        Auo_boxed
[0002b9ce] 206c 002a                 movea.l    42(a4),a0
[0002b9d2] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b9d8] 4a40                      tst.w      d0
[0002b9da] 6704                      beq.s      $0002B9E0
[0002b9dc] 42ac 002a                 clr.l      42(a4)
[0002b9e0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002b9e6] 3228 0014                 move.w     20(a0),d1
[0002b9ea] 3003                      move.w     d3,d0
[0002b9ec] 204c                      movea.l    a4,a0
[0002b9ee] 2279 000c 494e            movea.l    $000C494E,a1
[0002b9f4] 2269 0004                 movea.l    4(a1),a1
[0002b9f8] 4e91                      jsr        (a1)
[0002b9fa] 6100 fee0                 bsr        abort
[0002b9fe] 4fef 0032                 lea.l      50(a7),a7
[0002ba02] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0002ba06] 4e75                      rts
