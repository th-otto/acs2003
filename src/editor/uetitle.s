edti_pos:
[0002b3b0] 48e7 0038                 movem.l    a2-a4,-(a7)
[0002b3b4] 514f                      subq.w     #8,a7
[0002b3b6] 41f9 000c 9f68            lea.l      POP_HORPOSSEL,a0
[0002b3bc] 4eb9 0004 f064            jsr        Aob_create
[0002b3c2] 2448                      movea.l    a0,a2
[0002b3c4] 200a                      move.l     a2,d0
[0002b3c6] 6700 0122                 beq        edti_pos_1
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
[0002b40c] 670a                      beq.s      edti_pos_2
[0002b40e] 5342                      subq.w     #1,d2
[0002b410] 670e                      beq.s      edti_pos_3
[0002b412] 5342                      subq.w     #1,d2
[0002b414] 6712                      beq.s      edti_pos_4
[0002b416] 6016                      bra.s      edti_pos_5
edti_pos_2:
[0002b418] 006a 0004 0022            ori.w      #$0004,34(a2)
[0002b41e] 600e                      bra.s      edti_pos_5
edti_pos_3:
[0002b420] 006a 0004 003a            ori.w      #$0004,58(a2)
[0002b426] 6006                      bra.s      edti_pos_5
edti_pos_4:
[0002b428] 006a 0004 0052            ori.w      #$0004,82(a2)
edti_pos_5:
[0002b42e] 322f 0002                 move.w     2(a7),d1
[0002b432] 3017                      move.w     (a7),d0
[0002b434] 224a                      movea.l    a2,a1
[0002b436] 2053                      movea.l    (a3),a0
[0002b438] 2068 0258                 movea.l    600(a0),a0
[0002b43c] 4eb9 0004 e84a            jsr        Ame_popup
[0002b442] 4a40                      tst.w      d0
[0002b444] 6f00 009c                 ble        edti_pos_6
[0002b448] 2053                      movea.l    (a3),a0
[0002b44a] 2268 025c                 movea.l    604(a0),a1
[0002b44e] 2869 003c                 movea.l    60(a1),a4
[0002b452] 584c                      addq.w     #4,a4
[0002b454] 0294 ffff fffc            andi.l     #$FFFFFFFC,(a4)
[0002b45a] 3200                      move.w     d0,d1
[0002b45c] 5341                      subq.w     #1,d1
[0002b45e] 670a                      beq.s      edti_pos_7
[0002b460] 5341                      subq.w     #1,d1
[0002b462] 671c                      beq.s      edti_pos_8
[0002b464] 5341                      subq.w     #1,d1
[0002b466] 6734                      beq.s      edti_pos_9
[0002b468] 604c                      bra.s      edti_pos_10
edti_pos_7:
[0002b46a] 43f9 000c 9769            lea.l      HPOS_TEXT1,a1
[0002b470] 701b                      moveq.l    #27,d0
[0002b472] 2053                      movea.l    (a3),a0
[0002b474] 2068 025c                 movea.l    604(a0),a0
[0002b478] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b47e] 6036                      bra.s      edti_pos_10
edti_pos_8:
[0002b480] 0094 0000 0001            ori.l      #$00000001,(a4)
[0002b486] 43f9 000c 9771            lea.l      HPOS_TEXT2,a1
[0002b48c] 701b                      moveq.l    #27,d0
[0002b48e] 2053                      movea.l    (a3),a0
[0002b490] 2068 025c                 movea.l    604(a0),a0
[0002b494] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b49a] 601a                      bra.s      edti_pos_10
edti_pos_9:
[0002b49c] 0094 0000 0002            ori.l      #$00000002,(a4)
[0002b4a2] 43f9 000c 9779            lea.l      HPOS_TEXT3,a1
[0002b4a8] 701b                      moveq.l    #27,d0
[0002b4aa] 2053                      movea.l    (a3),a0
[0002b4ac] 2068 025c                 movea.l    604(a0),a0
[0002b4b0] 4eb9 0005 0fd8            jsr        Aob_puttext
edti_pos_10:
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
edti_pos_6:
[0002b4e2] 204a                      movea.l    a2,a0
[0002b4e4] 4eb9 0004 f20a            jsr        Aob_delete
edti_pos_1:
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
[0002b532] 6700 00ea                 beq        edti_size_1
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
[0002b5a0] 6f74                      ble.s      edti_size_2
[0002b5a2] 2053                      movea.l    (a3),a0
[0002b5a4] 2268 025c                 movea.l    604(a0),a1
[0002b5a8] 2869 003c                 movea.l    60(a1),a4
[0002b5ac] 584c                      addq.w     #4,a4
[0002b5ae] b07c 0001                 cmp.w      #$0001,d0
[0002b5b2] 661c                      bne.s      edti_size_3
[0002b5b4] 0294 ffff fffb            andi.l     #$FFFFFFFB,(a4)
[0002b5ba] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[0002b5c0] 700d                      moveq.l    #13,d0
[0002b5c2] 2053                      movea.l    (a3),a0
[0002b5c4] 2068 025c                 movea.l    604(a0),a0
[0002b5c8] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b5ce] 601a                      bra.s      edti_size_4
edti_size_3:
[0002b5d0] 0094 0000 0004            ori.l      #$00000004,(a4)
[0002b5d6] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[0002b5dc] 700d                      moveq.l    #13,d0
[0002b5de] 2053                      movea.l    (a3),a0
[0002b5e0] 2068 025c                 movea.l    604(a0),a0
[0002b5e4] 4eb9 0005 0fd8            jsr        Aob_puttext
edti_size_4:
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
edti_size_2:
[0002b616] 204a                      movea.l    a2,a0
[0002b618] 4eb9 0004 f20a            jsr        Aob_delete
edti_size_1:
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
[0002b6b8] 6606                      bne.s      object_tree_1
[0002b6ba] 91c8                      suba.l     a0,a0
[0002b6bc] 6000 0194                 bra        object_tree_2
object_tree_1:
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
[0002b73e] 6610                      bne.s      object_tree_3
[0002b740] 226d 000a                 movea.l    10(a5),a1
[0002b744] 700e                      moveq.l    #14,d0
[0002b746] 204a                      movea.l    a2,a0
[0002b748] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b74e] 6020                      bra.s      object_tree_4
object_tree_3:
[0002b750] 43f9 000c 4963            lea.l      $000C4963,a1
[0002b756] 7004                      moveq.l    #4,d0
[0002b758] 204b                      movea.l    a3,a0
[0002b75a] 2c6c 0008                 movea.l    8(a4),a6
[0002b75e] 4e96                      jsr        (a6)
[0002b760] 43f9 000c 4963            lea.l      $000C4963,a1
[0002b766] 700e                      moveq.l    #14,d0
[0002b768] 204a                      movea.l    a2,a0
[0002b76a] 4eb9 0005 0fd8            jsr        Aob_puttext
object_tree_4:
[0002b770] 7004                      moveq.l    #4,d0
[0002b772] c097                      and.l      (a7),d0
[0002b774] 6712                      beq.s      object_tree_5
[0002b776] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[0002b77c] 204a                      movea.l    a2,a0
[0002b77e] 700d                      moveq.l    #13,d0
[0002b780] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b786] 6010                      bra.s      object_tree_6
object_tree_5:
[0002b788] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[0002b78e] 700d                      moveq.l    #13,d0
[0002b790] 204a                      movea.l    a2,a0
[0002b792] 4eb9 0005 0fd8            jsr        Aob_puttext
object_tree_6:
[0002b798] 7003                      moveq.l    #3,d0
[0002b79a] c06f 0002                 and.w      2(a7),d0
[0002b79e] 4a40                      tst.w      d0
[0002b7a0] 670a                      beq.s      object_tree_7
[0002b7a2] 5340                      subq.w     #1,d0
[0002b7a4] 6718                      beq.s      object_tree_8
[0002b7a6] 5340                      subq.w     #1,d0
[0002b7a8] 6726                      beq.s      object_tree_9
[0002b7aa] 6034                      bra.s      object_tree_10
object_tree_7:
[0002b7ac] 43f9 000c 9769            lea.l      HPOS_TEXT1,a1
[0002b7b2] 701b                      moveq.l    #27,d0
[0002b7b4] 204a                      movea.l    a2,a0
[0002b7b6] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b7bc] 6022                      bra.s      object_tree_10
object_tree_8:
[0002b7be] 43f9 000c 9771            lea.l      HPOS_TEXT2,a1
[0002b7c4] 701b                      moveq.l    #27,d0
[0002b7c6] 204a                      movea.l    a2,a0
[0002b7c8] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b7ce] 6010                      bra.s      object_tree_10
object_tree_9:
[0002b7d0] 43f9 000c 9779            lea.l      HPOS_TEXT3,a1
[0002b7d6] 701b                      moveq.l    #27,d0
[0002b7d8] 204a                      movea.l    a2,a0
[0002b7da] 4eb9 0005 0fd8            jsr        Aob_puttext
object_tree_10:
[0002b7e0] 206a 0234                 movea.l    564(a2),a0
[0002b7e4] 2968 000c 0018            move.l     12(a0),24(a4)
[0002b7ea] 206d 0026                 movea.l    38(a5),a0
[0002b7ee] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b7f4] 4a40                      tst.w      d0
[0002b7f6] 6712                      beq.s      object_tree_11
[0002b7f8] 43f9 000c 4963            lea.l      $000C4963,a1
[0002b7fe] 7017                      moveq.l    #23,d0
[0002b800] 204a                      movea.l    a2,a0
[0002b802] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b808] 600e                      bra.s      object_tree_12
object_tree_11:
[0002b80a] 226d 0026                 movea.l    38(a5),a1
[0002b80e] 7017                      moveq.l    #23,d0
[0002b810] 204a                      movea.l    a2,a0
[0002b812] 4eb9 0005 0fd8            jsr        Aob_puttext
object_tree_12:
[0002b818] 206a 024c                 movea.l    588(a2),a0
[0002b81c] 2968 000c 001c            move.l     12(a0),28(a4)
[0002b822] 206d 002a                 movea.l    42(a5),a0
[0002b826] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b82c] 4a40                      tst.w      d0
[0002b82e] 6712                      beq.s      object_tree_13
[0002b830] 43f9 000c 4963            lea.l      $000C4963,a1
[0002b836] 7018                      moveq.l    #24,d0
[0002b838] 204a                      movea.l    a2,a0
[0002b83a] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002b840] 600e                      bra.s      object_tree_14
object_tree_13:
[0002b842] 226d 002a                 movea.l    42(a5),a1
[0002b846] 7018                      moveq.l    #24,d0
[0002b848] 204a                      movea.l    a2,a0
[0002b84a] 4eb9 0005 0fd8            jsr        Aob_puttext
object_tree_14:
[0002b850] 204a                      movea.l    a2,a0
object_tree_2:
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
[0002b88a] 6608                      bne.s      test_it_1
[0002b88c] 256b 000a 000c            move.l     10(a3),12(a2)
[0002b892] 6004                      bra.s      test_it_2
test_it_1:
[0002b894] 42aa 000c                 clr.l      12(a2)
test_it_2:
[0002b898] 7000                      moveq.l    #0,d0
[0002b89a] 2540 0014                 move.l     d0,20(a2)
[0002b89e] 2540 0010                 move.l     d0,16(a2)
[0002b8a2] 206b 0026                 movea.l    38(a3),a0
[0002b8a6] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b8ac] 4a40                      tst.w      d0
[0002b8ae] 6704                      beq.s      test_it_3
[0002b8b0] 91c8                      suba.l     a0,a0
[0002b8b2] 6004                      bra.s      test_it_4
test_it_3:
[0002b8b4] 206b 0026                 movea.l    38(a3),a0
test_it_4:
[0002b8b8] 2548 0018                 move.l     a0,24(a2)
[0002b8bc] 206b 002a                 movea.l    42(a3),a0
[0002b8c0] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b8c6] 4a40                      tst.w      d0
[0002b8c8] 6704                      beq.s      test_it_5
[0002b8ca] 91c8                      suba.l     a0,a0
[0002b8cc] 6004                      bra.s      test_it_6
test_it_5:
[0002b8ce] 206b 002a                 movea.l    42(a3),a0
test_it_6:
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
[0002b9b8] 6704                      beq.s      ok_1
[0002b9ba] 42ac 0026                 clr.l      38(a4)
ok_1:
[0002b9be] 43ec 002a                 lea.l      42(a4),a1
[0002b9c2] 7003                      moveq.l    #3,d0
[0002b9c4] 41ea 0240                 lea.l      576(a2),a0
[0002b9c8] 4eb9 0006 a068            jsr        Auo_boxed
[0002b9ce] 206c 002a                 movea.l    42(a4),a0
[0002b9d2] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b9d8] 4a40                      tst.w      d0
[0002b9da] 6704                      beq.s      ok_2
[0002b9dc] 42ac 002a                 clr.l      42(a4)
ok_2:
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

	.data

BUBBLE_01:
[000c42ba]                           dc.b 'Die énderungen werden Åbernommen und Åberschreiben die alten Einstellungen.',0
BUBBLE_02:
[000c4306]                           dc.b 'Die énderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
BUBBLE_03:
[000c4351]                           dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_05:
[000c43a3]                           dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
TEXT_005:
[000c4427]                           dc.b $4f
[000c4428]                           dc.w $4b00
TEXT_006:
[000c442a]                           dc.b 'TEXT',0
TEXT_009:
[000c442f]                           dc.b 'Abbruch',0
TEXT_04:
[000c4437]                           dc.b 'Position:',0
TEXT_05:
[000c4441]                           dc.b 'Sonstiges',0
TEXT_06:
[000c444b]                           dc.b 'BubbleGEM-Text',0
TEXT_07:
[000c445a]                           dc.b 'Context-Popup',0
TEXT_12:
[000c4468]                           dc.b 'Grîûe:',0
TEXT_13:
[000c446f]                           dc.b 'Modus:',0
help_title:
[000c4476]                           dc.b 'Der Title-Editor',0
title:
[000c4487]                           dc.b 'TITLE -',0
[000c448f]                           dc.b $00
[000c4490] 00064a22                  dc.l A_3Dbutton
[000c4494]                           dc.w $29c1
[000c4496]                           dc.w $0178
[000c4498] 000630f2                  dc.l Auo_string
[000c449c] 000c4427                  dc.l TEXT_005
[000c44a0]                           dc.w $0000
[000c44a2]                           dc.w $0000
[000c44a4]                           dc.w $0000
[000c44a6]                           dc.w $0000
[000c44a8] 000c42ba                  dc.l BUBBLE_01
[000c44ac]                           dc.w $0000
[000c44ae]                           dc.w $0000
A_3DBUTTON04:
[000c44b0] 00064a22                  dc.l A_3Dbutton
[000c44b4]                           dc.w $29f1
[000c44b6]                           dc.w $0178
[000c44b8] 000630f2                  dc.l Auo_string
[000c44bc]                           dc.w $0000
[000c44be]                           dc.w $0000
[000c44c0]                           dc.w $0000
[000c44c2]                           dc.w $0000
[000c44c4]                           dc.w $0000
[000c44c6]                           dc.w $0000
[000c44c8]                           dc.w $0000
[000c44ca]                           dc.w $0000
[000c44cc]                           dc.w $0000
[000c44ce]                           dc.w $0000
A_3DBUTTON05:
[000c44d0] 00064a22                  dc.l A_3Dbutton
[000c44d4]                           dc.w $21f1
[000c44d6]                           dc.w $0178
[000c44d8] 000630f2                  dc.l Auo_string
[000c44dc]                           dc.w $0000
[000c44de]                           dc.w $0000
[000c44e0]                           dc.w $0000
[000c44e2]                           dc.w $0000
[000c44e4]                           dc.w $0000
[000c44e6]                           dc.w $0000
[000c44e8]                           dc.w $0000
[000c44ea]                           dc.w $0000
[000c44ec]                           dc.w $0000
[000c44ee]                           dc.w $0000
A_3DBUTTON06:
[000c44f0] 00064a22                  dc.l A_3Dbutton
[000c44f4]                           dc.w $29c1
[000c44f6]                           dc.w $0178
[000c44f8] 000630f2                  dc.l Auo_string
[000c44fc] 000c442f                  dc.l TEXT_009
[000c4500]                           dc.w $0000
[000c4502]                           dc.w $0000
[000c4504]                           dc.w $0000
[000c4506]                           dc.w $0000
[000c4508] 000c4306                  dc.l BUBBLE_02
[000c450c]                           dc.w $0000
[000c450e]                           dc.w $0000
A_3DBUTTON27:
[000c4510] 00064a22                  dc.l A_3Dbutton
[000c4514]                           dc.w $09f1
[000c4516]                           dc.w $0178
[000c4518] 000630f2                  dc.l Auo_string
[000c451c]                           dc.w $0000
[000c451e]                           dc.w $0000
[000c4520]                           dc.w $0000
[000c4522]                           dc.w $0000
[000c4524]                           dc.w $0000
[000c4526]                           dc.w $0000
[000c4528]                           dc.w $0000
[000c452a]                           dc.w $0000
[000c452c]                           dc.w $0000
[000c452e]                           dc.w $0000
A_ARROWS02:
[000c4530] 00065c72                  dc.l A_arrows
[000c4534]                           dc.w $1301
[000c4536]                           dc.w $0001
[000c4538]                           dc.w $0000
[000c453a]                           dc.w $0000
[000c453c]                           dc.w $0000
[000c453e]                           dc.w $0000
[000c4540]                           dc.w $0000
[000c4542]                           dc.w $0000
[000c4544]                           dc.w $0000
[000c4546]                           dc.w $0000
[000c4548]                           dc.w $0000
[000c454a]                           dc.w $0000
[000c454c]                           dc.w $0000
[000c454e]                           dc.w $0000
A_BOXED02:
[000c4550] 0006afea                  dc.l A_boxed
[000c4554]                           dc.w $9000
[000c4556]                           dc.w $ff12
[000c4558] 0006a068                  dc.l Auo_boxed
[000c455c]                           dc.w $0000
[000c455e]                           dc.w $0000
[000c4560]                           dc.w $0000
[000c4562]                           dc.w $0000
[000c4564]                           dc.w $0000
[000c4566]                           dc.w $0000
[000c4568]                           dc.w $0000
[000c456a]                           dc.w $0000
[000c456c]                           dc.w $0000
[000c456e]                           dc.w $0000
A_BOXED03:
[000c4570] 0006afea                  dc.l A_boxed
[000c4574]                           dc.w $9038
[000c4576]                           dc.w $ff12
[000c4578] 0006a068                  dc.l Auo_boxed
[000c457c]                           dc.w $0000
[000c457e]                           dc.w $0000
[000c4580]                           dc.w $0000
[000c4582]                           dc.w $0000
[000c4584]                           dc.w $0000
[000c4586]                           dc.w $0000
[000c4588] 000c4351                  dc.l BUBBLE_03
[000c458c]                           dc.w $0000
[000c458e]                           dc.w $0000
A_BOXED04:
[000c4590] 0006afea                  dc.l A_boxed
[000c4594]                           dc.w $9038
[000c4596]                           dc.w $ff12
[000c4598] 0006a068                  dc.l Auo_boxed
[000c459c]                           dc.w $0000
[000c459e]                           dc.w $0000
[000c45a0]                           dc.w $0000
[000c45a2]                           dc.w $0000
[000c45a4]                           dc.w $0000
[000c45a6]                           dc.w $0000
[000c45a8] 000c43a3                  dc.l BUBBLE_05
[000c45ac]                           dc.w $0000
[000c45ae]                           dc.w $0000
A_INNERFRAME03:
[000c45b0] 00064256                  dc.l A_innerframe
[000c45b4]                           dc.w $1800
[000c45b6]                           dc.w $8f19
[000c45b8] 000630f2                  dc.l Auo_string
[000c45bc] 000c4441                  dc.l TEXT_05
[000c45c0]                           dc.w $0000
[000c45c2]                           dc.w $0000
[000c45c4]                           dc.w $0000
[000c45c6]                           dc.w $0000
[000c45c8]                           dc.w $0000
[000c45ca]                           dc.w $0000
[000c45cc]                           dc.w $0000
[000c45ce]                           dc.w $0000
A_TITLE01:
[000c45d0] 00065620                  dc.l A_title
[000c45d4]                           dc.w $0000
[000c45d6]                           dc.w $0000
[000c45d8] 000630f2                  dc.l Auo_string
[000c45dc] 000c442a                  dc.l TEXT_006
[000c45e0]                           dc.w $0000
[000c45e2]                           dc.w $0000
[000c45e4]                           dc.w $0000
[000c45e6]                           dc.w $0000
[000c45e8]                           dc.w $0000
[000c45ea]                           dc.w $0000
[000c45ec]                           dc.w $0000
[000c45ee]                           dc.w $0000
ED_TITLE:
[000c45f0]                           dc.w $ffff
[000c45f2]                           dc.w $0001
[000c45f4]                           dc.w $0019
[000c45f6]                           dc.w $0018
[000c45f8]                           dc.w $0040
[000c45fa]                           dc.w $0010
[000c45fc] 000c44d0                  dc.l A_3DBUTTON05
[000c4600]                           dc.w $0000
[000c4602]                           dc.w $0000
[000c4604]                           dc.w $002c
[000c4606]                           dc.w $000d
_01_ED_TITLE:
[000c4608]                           dc.w $0003
[000c460a]                           dc.w $0002
[000c460c]                           dc.w $0002
[000c460e]                           dc.w $0018
[000c4610]                           dc.w $0040
[000c4612]                           dc.w $0000
[000c4614] 000c44b0                  dc.l A_3DBUTTON04
[000c4618]                           dc.w $0000
[000c461a]                           dc.w $0000
[000c461c]                           dc.w $000c
[000c461e]                           dc.w $0003
_02_ED_TITLE:
[000c4620]                           dc.w $0001
[000c4622]                           dc.w $ffff
[000c4624]                           dc.w $ffff
[000c4626]                           dc.w $0018
[000c4628]                           dc.w $0000
[000c462a]                           dc.w $0000
[000c462c] 000c45d0                  dc.l A_TITLE01
[000c4630]                           dc.w $0001
[000c4632]                           dc.w $0001
[000c4634]                           dc.w $000a
[000c4636]                           dc.w $0001
_03_ED_TITLE:
[000c4638]                           dc.w $0005
[000c463a]                           dc.w $ffff
[000c463c]                           dc.w $ffff
[000c463e]                           dc.w $0018
[000c4640]                           dc.w $4007
[000c4642]                           dc.w $0000
[000c4644] 000c4490                  dc.l A_3DBUTTON03
[000c4648]                           dc.w $0010
[000c464a]                           dc.w $0001
[000c464c]                           dc.w $000c
[000c464e]                           dc.w $0002
_03aED_TITLE:
[000c4650] 0002b902                  dc.l ok
[000c4654]                           dc.w $0000
[000c4656]                           dc.w $0000
[000c4658]                           dc.w $8000
[000c465a]                           dc.w $884f
[000c465c]                           dc.w $0000
[000c465e]                           dc.w $0000
[000c4660]                           dc.w $0000
[000c4662]                           dc.w $0000
[000c4664]                           dc.w $0000
[000c4666]                           dc.w $0000
_05_ED_TITLE:
[000c4668]                           dc.w $0007
[000c466a]                           dc.w $ffff
[000c466c]                           dc.w $ffff
[000c466e]                           dc.w $0018
[000c4670]                           dc.w $4005
[000c4672]                           dc.w $0000
[000c4674] 000c44f0                  dc.l A_3DBUTTON06
[000c4678]                           dc.w $001f
[000c467a]                           dc.w $0001
[000c467c]                           dc.w $000c
[000c467e]                           dc.w $0002
_05aED_TITLE:
[000c4680] 0002b8dc                  dc.l abort
[000c4684]                           dc.w $0000
[000c4686]                           dc.w $0000
[000c4688]                           dc.w $8000
[000c468a]                           dc.w $8841
[000c468c]                           dc.w $0000
[000c468e]                           dc.w $0000
[000c4690]                           dc.w $0000
[000c4692]                           dc.w $0000
[000c4694]                           dc.w $0000
[000c4696]                           dc.w $0000
_07_ED_TITLE:
[000c4698]                           dc.w $0009
[000c469a]                           dc.w $0008
[000c469c]                           dc.w $0008
[000c469e]                           dc.w $001c
[000c46a0]                           dc.w $0040
[000c46a2]                           dc.w $0000
[000c46a4] 000c4437                  dc.l TEXT_04
[000c46a8]                           dc.w $0002
[000c46aa]                           dc.w $0004
[000c46ac]                           dc.w $0009
[000c46ae]                           dc.w $0001
_08_ED_TITLE:
[000c46b0]                           dc.w $0007
[000c46b2]                           dc.w $ffff
[000c46b4]                           dc.w $ffff
[000c46b6]                           dc.w $0018
[000c46b8]                           dc.w $0040
[000c46ba]                           dc.w $0000
[000c46bc] 000c4530                  dc.l A_ARROWS02
[000c46c0]                           dc.w $0000
[000c46c2]                           dc.w $0000
[000c46c4]                           dc.w $0001
[000c46c6]                           dc.w $0001
_09_ED_TITLE:
[000c46c8]                           dc.w $000b
[000c46ca]                           dc.w $000a
[000c46cc]                           dc.w $000a
[000c46ce]                           dc.w $001c
[000c46d0]                           dc.w $0040
[000c46d2]                           dc.w $0000
[000c46d4] 000c4468                  dc.l TEXT_12
[000c46d8]                           dc.w $001c
[000c46da]                           dc.w $0004
[000c46dc]                           dc.w $0006
[000c46de]                           dc.w $0001
_10_ED_TITLE:
[000c46e0]                           dc.w $0009
[000c46e2]                           dc.w $ffff
[000c46e4]                           dc.w $ffff
[000c46e6]                           dc.w $0018
[000c46e8]                           dc.w $0040
[000c46ea]                           dc.w $0000
[000c46ec] 000c4530                  dc.l A_ARROWS02
[000c46f0]                           dc.w $0000
[000c46f2]                           dc.w $0000
[000c46f4]                           dc.w $0001
[000c46f6]                           dc.w $0001
_11_ED_TITLE:
[000c46f8]                           dc.w $000e
[000c46fa]                           dc.w $000d
[000c46fc]                           dc.w $000d
[000c46fe]                           dc.w $0014
[000c4700]                           dc.w $0040
[000c4702]                           dc.w $0020
[000c4704]                           dc.w $00ff
[000c4706]                           dc.w $1101
[000c4708]                           dc.w $0023
[000c470a]                           dc.w $0004
[000c470c]                           dc.w $0008
[000c470e]                           dc.w $0001
_11aED_TITLE:
[000c4710] 0002b51c                  dc.l edti_size
[000c4714]                           dc.w $0000
[000c4716]                           dc.w $0000
[000c4718]                           dc.w $8000
[000c471a]                           dc.w $8847
[000c471c]                           dc.w $0000
[000c471e]                           dc.w $0000
[000c4720]                           dc.w $0000
[000c4722]                           dc.w $0000
[000c4724]                           dc.w $0000
[000c4726]                           dc.w $0000
_13_ED_TITLE:
[000c4728]                           dc.w $000b
[000c472a]                           dc.w $ffff
[000c472c]                           dc.w $ffff
[000c472e]                           dc.w $0018
[000c4730]                           dc.w $0000
[000c4732]                           dc.w $0000
[000c4734] 000c44b0                  dc.l A_3DBUTTON04
[000c4738]                           dc.w $0000
[000c473a]                           dc.w $0000
[000c473c]                           dc.w $0008
[000c473e]                           dc.w $0001
_14_ED_TITLE:
[000c4740]                           dc.w $000f
[000c4742]                           dc.w $ffff
[000c4744]                           dc.w $ffff
[000c4746]                           dc.w $0018
[000c4748]                           dc.w $0008
[000c474a]                           dc.w $0010
[000c474c] 000c4550                  dc.l A_BOXED02
[000c4750]                           dc.w $0002
[000c4752]                           dc.w $0006
[000c4754]                           dc.w $0018
[000c4756]                           dc.w $0001
_15_ED_TITLE:
[000c4758]                           dc.w $0010
[000c475a]                           dc.w $ffff
[000c475c]                           dc.w $ffff
[000c475e]                           dc.w $001c
[000c4760]                           dc.w $0040
[000c4762]                           dc.w $0000
[000c4764] 000c446f                  dc.l TEXT_13
[000c4768]                           dc.w $001c
[000c476a]                           dc.w $0006
[000c476c]                           dc.w $0006
[000c476e]                           dc.w $0001
_16_ED_TITLE:
[000c4770]                           dc.w $0012
[000c4772]                           dc.w $ffff
[000c4774]                           dc.w $ffff
[000c4776]                           dc.w $001b
[000c4778]                           dc.w $0005
[000c477a]                           dc.w $0000
[000c477c]                           dc.w $43ff
[000c477e]                           dc.w $1121
[000c4780]                           dc.w $0023
[000c4782]                           dc.w $0006
[000c4784]                           dc.w $0003
[000c4786]                           dc.w $0001
_16aED_TITLE:
[000c4788] 0002b626                  dc.l edti_trans
[000c478c]                           dc.w $0000
[000c478e]                           dc.w $0000
[000c4790]                           dc.w $8000
[000c4792]                           dc.w $0000
[000c4794]                           dc.w $0000
[000c4796]                           dc.w $0000
[000c4798]                           dc.w $0000
[000c479a]                           dc.w $0000
[000c479c]                           dc.w $0000
[000c479e]                           dc.w $0000
_18_ED_TITLE:
[000c47a0]                           dc.w $0014
[000c47a2]                           dc.w $ffff
[000c47a4]                           dc.w $ffff
[000c47a6]                           dc.w $001b
[000c47a8]                           dc.w $0005
[000c47aa]                           dc.w $0000
[000c47ac]                           dc.w $43ff
[000c47ae]                           dc.w $11a1
[000c47b0]                           dc.w $0027
[000c47b2]                           dc.w $0006
[000c47b4]                           dc.w $0003
[000c47b6]                           dc.w $0001
_18aED_TITLE:
[000c47b8] 0002b4f2                  dc.l edti_replace
[000c47bc]                           dc.w $0000
[000c47be]                           dc.w $0000
[000c47c0]                           dc.w $8000
[000c47c2]                           dc.w $0000
[000c47c4]                           dc.w $0000
[000c47c6]                           dc.w $0000
[000c47c8]                           dc.w $0000
[000c47ca]                           dc.w $0000
[000c47cc]                           dc.w $0000
[000c47ce]                           dc.w $0000
_20_ED_TITLE:
[000c47d0]                           dc.w $0019
[000c47d2]                           dc.w $0015
[000c47d4]                           dc.w $0018
[000c47d6]                           dc.w $0018
[000c47d8]                           dc.w $0040
[000c47da]                           dc.w $0000
[000c47dc] 000c45b0                  dc.l A_INNERFRAME03
[000c47e0]                           dc.w $0001
[000c47e2]                           dc.w $0008
[000c47e4]                           dc.w $002a
[000c47e6]                           dc.w $0005
_21_ED_TITLE:
[000c47e8]                           dc.w $0016
[000c47ea]                           dc.w $ffff
[000c47ec]                           dc.w $ffff
[000c47ee]                           dc.w $001c
[000c47f0]                           dc.w $0000
[000c47f2]                           dc.w $0000
[000c47f4] 000c444b                  dc.l TEXT_06
[000c47f8]                           dc.w $0001
[000c47fa]                           dc.w $0001
[000c47fc]                           dc.w $000e
[000c47fe]                           dc.w $0001
_22_ED_TITLE:
[000c4800]                           dc.w $0017
[000c4802]                           dc.w $ffff
[000c4804]                           dc.w $ffff
[000c4806]                           dc.w $001c
[000c4808]                           dc.w $0000
[000c480a]                           dc.w $0000
[000c480c] 000c445a                  dc.l TEXT_07
[000c4810]                           dc.w $0001
[000c4812]                           dc.w $0003
[000c4814]                           dc.w $000d
[000c4816]                           dc.w $0001
_23_ED_TITLE:
[000c4818]                           dc.w $0018
[000c481a]                           dc.w $ffff
[000c481c]                           dc.w $ffff
[000c481e]                           dc.w $0018
[000c4820]                           dc.w $0008
[000c4822]                           dc.w $0010
[000c4824] 000c4570                  dc.l A_BOXED03
[000c4828]                           dc.w $0010
[000c482a]                           dc.w $0001
[000c482c]                           dc.w $0019
[000c482e]                           dc.w $0001
_24_ED_TITLE:
[000c4830]                           dc.w $0014
[000c4832]                           dc.w $ffff
[000c4834]                           dc.w $ffff
[000c4836]                           dc.w $0018
[000c4838]                           dc.w $0008
[000c483a]                           dc.w $0010
[000c483c] 000c4590                  dc.l A_BOXED04
[000c4840]                           dc.w $0010
[000c4842]                           dc.w $0003
[000c4844]                           dc.w $0019
[000c4846]                           dc.w $0001
_25_ED_TITLE:
[000c4848]                           dc.w $0000
[000c484a]                           dc.w $001b
[000c484c]                           dc.w $001b
[000c484e]                           dc.w $0014
[000c4850]                           dc.w $0040
[000c4852]                           dc.w $0020
[000c4854]                           dc.w $00ff
[000c4856]                           dc.w $1101
[000c4858]                           dc.w $0010
[000c485a]                           dc.w $0004
[000c485c]                           dc.w $000a
[000c485e]                           dc.w $0001
_25aED_TITLE:
[000c4860] 0002b3b0                  dc.l edti_pos
[000c4864]                           dc.w $0000
[000c4866]                           dc.w $0000
[000c4868]                           dc.w $8000
[000c486a]                           dc.w $8850
[000c486c]                           dc.w $0000
[000c486e]                           dc.w $0000
[000c4870]                           dc.w $0000
[000c4872]                           dc.w $0000
[000c4874]                           dc.w $0000
[000c4876]                           dc.w $0000
_27_ED_TITLE:
[000c4878]                           dc.w $0019
[000c487a]                           dc.w $ffff
[000c487c]                           dc.w $ffff
[000c487e]                           dc.w $0018
[000c4880]                           dc.w $0020
[000c4882]                           dc.w $0000
[000c4884] 000c4510                  dc.l A_3DBUTTON27
[000c4888]                           dc.w $0000
[000c488a]                           dc.w $0000
[000c488c]                           dc.w $000a
[000c488e]                           dc.w $0001
utitle:
[000c4890] 00065620                  dc.l A_title
[000c4894]                           dc.w $0000
[000c4896]                           dc.w $0000
[000c4898] 000630f2                  dc.l Auo_string
[000c489c] 000c495e                  dc.l $000c495e
[000c48a0]                           dc.w $0000
[000c48a2]                           dc.w $0000
[000c48a4]                           dc.w $0000
[000c48a6]                           dc.w $0000
[000c48a8]                           dc.w $0000
[000c48aa]                           dc.w $0000
[000c48ac]                           dc.w $0000
[000c48ae]                           dc.w $0000
visual:
[000c48b0]                           dc.w $ffff
[000c48b2]                           dc.w $ffff
[000c48b4]                           dc.w $ffff
[000c48b6]                           dc.w $0018
[000c48b8]                           dc.w $0000
[000c48ba]                           dc.w $0000
[000c48bc] 000c4890                  dc.l utitle
[000c48c0]                           dc.w $0000
[000c48c2]                           dc.w $0000
[000c48c4]                           dc.w $0007
[000c48c6]                           dc.w $0001
logical:
[000c48c8]                           dc.w $ffff
[000c48ca]                           dc.w $ffff
[000c48cc]                           dc.w $ffff
[000c48ce]                           dc.w $0018
[000c48d0]                           dc.w $0040
[000c48d2]                           dc.w $0000
[000c48d4] 000c4890                  dc.l utitle
[000c48d8]                           dc.w $0000
[000c48da]                           dc.w $0000
[000c48dc]                           dc.w $0007
[000c48de]                           dc.w $0001
aud:
[000c48e0] 000c4964                  dc.l $000c4964
[000c48e4] 000c4969                  dc.l $000c4969
[000c48e8]                           dc.w $0002
[000c48ea] 000c495e                  dc.l $000c495e
[000c48ee]                           dc.w $0000
[000c48f0]                           dc.w $0000
[000c48f2]                           dc.w $0000
[000c48f4]                           dc.w $0000
[000c48f6]                           dc.w $0000
[000c48f8]                           dc.w $0000
[000c48fa]                           dc.w $0000
[000c48fc]                           dc.w $0000
[000c48fe]                           dc.w $0000
[000c4900]                           dc.w $0000
[000c4902]                           dc.w $0000
[000c4904]                           dc.w $0000
[000c4906]                           dc.w $0000
[000c4908]                           dc.w $0000
[000c490a]                           dc.w $0000
[000c490c]                           dc.w $0000
data:
[000c490e]                           dc.b 'A_title',0
[000c4916]                           dc.w $0000
[000c4918]                           dc.w $0000
[000c491a]                           dc.w $0000
[000c491c]                           dc.w $0000
[000c491e]                           dc.w $0000
[000c4920]                           dc.w $0000
[000c4922]                           dc.w $0000
[000c4924]                           dc.w $0000
[000c4926]                           dc.w $0000
[000c4928]                           dc.w $0000
[000c492a]                           dc.w $0000
[000c492c]                           dc.w $0000
[000c492e] 0002b69e                  dc.l object_tree
[000c4932] 0002b85a                  dc.l test_it
[000c4936] 0002b902                  dc.l ok
[000c493a] 0004f20a                  dc.l Aob_delete
[000c493e] 000c48b0                  dc.l visual
[000c4942] 000c48c8                  dc.l logical
[000c4946] 000c48e0                  dc.l aud
[000c494a] 0002b66c                  dc.l minsize
[000c494e]                           dc.w $0000
[000c4950]                           dc.w $0000
[000c4952] 000c4487                  dc.l title
[000c4956] 000c4476                  dc.l help_title
[000c495a]                           dc.w $0000
[000c495c]                           dc.w $0000
[000c495e]                           dc.b 'TITEL',0
[000c4964]                           dc.b '0x0L',0
[000c4969]                           dc.b 'Auo_string',0
[000c4974]                           dc.b '0x%lxL',0
[000c497b]                           dc.b $00
