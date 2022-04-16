init_boxed:
[0002699c] 2f0a                      move.l     a2,-(a7)
[0002699e] 2f0b                      move.l     a3,-(a7)
[000269a0] 2448                      movea.l    a0,a2
[000269a2] 43f9 000b ce0a            lea.l      data,a1
[000269a8] 303c 2329                 move.w     #$2329,d0
[000269ac] 266a 0004                 movea.l    4(a2),a3
[000269b0] 4e93                      jsr        (a3)
[000269b2] 265f                      movea.l    (a7)+,a3
[000269b4] 245f                      movea.l    (a7)+,a2
[000269b6] 4e75                      rts

minsize:
[000269b8] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[000269bc] 2448                      movea.l    a0,a2
[000269be] 2649                      movea.l    a1,a3
[000269c0] 202a 000c                 move.l     12(a2),d0
[000269c4] 6716                      beq.s      minsize_1
[000269c6] 2040                      movea.l    d0,a0
[000269c8] 4eb9 0008 2f6c            jsr        strlen
[000269ce] 2600                      move.l     d0,d3
[000269d0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000269d6] c7e8 0012                 muls.w     18(a0),d3
[000269da] 600a                      bra.s      minsize_2
minsize_1:
[000269dc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000269e2] 3628 0012                 move.w     18(a0),d3
minsize_2:
[000269e6] 3683                      move.w     d3,(a3)
[000269e8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000269ee] 226f 0010                 movea.l    16(a7),a1
[000269f2] 32a8 0014                 move.w     20(a0),(a1)
[000269f6] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000269fa] 4e75                      rts

object_tree:
[000269fc] 48e7 003e                 movem.l    a2-a6,-(a7)
[00026a00] 4fef fff2                 lea.l      -14(a7),a7
[00026a04] 2a48                      movea.l    a0,a5
[00026a06] 2649                      movea.l    a1,a3
[00026a08] 41f9 000b c7d8            lea.l      ED_BOXED,a0
[00026a0e] 4eb9 0004 f064            jsr        Aob_create
[00026a14] 2448                      movea.l    a0,a2
[00026a16] 200a                      move.l     a2,d0
[00026a18] 6700 02c6                 beq        object_tree_1
[00026a1c] 49ea 0030                 lea.l      48(a2),a4
[00026a20] 7216                      moveq.l    #22,d1
[00026a22] c26b 0008                 and.w      8(a3),d1
[00026a26] 836c 0008                 or.w       d1,8(a4)
[00026a2a] 723f                      moveq.l    #63,d1
[00026a2c] c26b 000a                 and.w      10(a3),d1
[00026a30] 836c 000a                 or.w       d1,10(a4)
[00026a34] 266c 000c                 movea.l    12(a4),a3
[00026a38] 4857                      pea.l      (a7)
[00026a3a] 43f9 000b ce7e            lea.l      $000BCE7E,a1
[00026a40] 2055                      movea.l    (a5),a0
[00026a42] 4eb9 0008 1b26            jsr        sscanf
[00026a48] 584f                      addq.w     #4,a7
[00026a4a] 2757 0004                 move.l     (a7),4(a3)
[00026a4e] 4deb 0004                 lea.l      4(a3),a6
[00026a52] 7016                      moveq.l    #22,d0
[00026a54] 224a                      movea.l    a2,a1
[00026a56] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026a5c] 2068 0258                 movea.l    600(a0),a0
[00026a60] 4eb9 0003 0b9a            jsr        oe_beself
[00026a66] 7008                      moveq.l    #8,d0
[00026a68] 224a                      movea.l    a2,a1
[00026a6a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026a70] 2068 0258                 movea.l    600(a0),a0
[00026a74] 4eb9 0003 0b9a            jsr        oe_beself
[00026a7a] 7002                      moveq.l    #2,d0
[00026a7c] 224a                      movea.l    a2,a1
[00026a7e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026a84] 2068 0258                 movea.l    600(a0),a0
[00026a88] 4eb9 0003 0b9a            jsr        oe_beself
[00026a8e] 7035                      moveq.l    #53,d0
[00026a90] 224a                      movea.l    a2,a1
[00026a92] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026a98] 2068 0258                 movea.l    600(a0),a0
[00026a9c] 4eb9 0003 0b9a            jsr        oe_beself
[00026aa2] 7036                      moveq.l    #54,d0
[00026aa4] 224a                      movea.l    a2,a1
[00026aa6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026aac] 2068 0258                 movea.l    600(a0),a0
[00026ab0] 4eb9 0003 0b9a            jsr        oe_beself
[00026ab6] 286a 00cc                 movea.l    204(a2),a4
[00026aba] 584c                      addq.w     #4,a4
[00026abc] 3016                      move.w     (a6),d0
[00026abe] e648                      lsr.w      #3,d0
[00026ac0] c07c 001f                 and.w      #$001F,d0
[00026ac4] 0254 ff07                 andi.w     #$FF07,(a4)
[00026ac8] c07c 001f                 and.w      #$001F,d0
[00026acc] e748                      lsl.w      #3,d0
[00026ace] 8154                      or.w       d0,(a4)
[00026ad0] 0c6d 0002 0008            cmpi.w     #$0002,8(a5)
[00026ad6] 661e                      bne.s      object_tree_2
[00026ad8] 226d 000a                 movea.l    10(a5),a1
[00026adc] 7002                      moveq.l    #2,d0
[00026ade] 204a                      movea.l    a2,a0
[00026ae0] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026ae6] 226d 000a                 movea.l    10(a5),a1
[00026aea] 7008                      moveq.l    #8,d0
[00026aec] 204a                      movea.l    a2,a0
[00026aee] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026af4] 6020                      bra.s      object_tree_3
object_tree_2:
[00026af6] 43f9 000b ce5a            lea.l      $000BCE5A,a1
[00026afc] 7002                      moveq.l    #2,d0
[00026afe] 204a                      movea.l    a2,a0
[00026b00] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026b06] 43f9 000b ce5a            lea.l      $000BCE5A,a1
[00026b0c] 7008                      moveq.l    #8,d0
[00026b0e] 204a                      movea.l    a2,a0
[00026b10] 4eb9 0005 0fd8            jsr        Aob_puttext
object_tree_3:
[00026b16] 206a 0504                 movea.l    1284(a2),a0
[00026b1a] 2768 000c 0018            move.l     12(a0),24(a3)
[00026b20] 206d 0026                 movea.l    38(a5),a0
[00026b24] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00026b2a] 4a40                      tst.w      d0
[00026b2c] 6712                      beq.s      object_tree_4
[00026b2e] 43f9 000b ce5a            lea.l      $000BCE5A,a1
[00026b34] 7035                      moveq.l    #53,d0
[00026b36] 204a                      movea.l    a2,a0
[00026b38] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026b3e] 600e                      bra.s      object_tree_5
object_tree_4:
[00026b40] 226d 0026                 movea.l    38(a5),a1
[00026b44] 7035                      moveq.l    #53,d0
[00026b46] 204a                      movea.l    a2,a0
[00026b48] 4eb9 0005 0fd8            jsr        Aob_puttext
object_tree_5:
[00026b4e] 206a 051c                 movea.l    1308(a2),a0
[00026b52] 2768 000c 001c            move.l     12(a0),28(a3)
[00026b58] 206d 002a                 movea.l    42(a5),a0
[00026b5c] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00026b62] 4a40                      tst.w      d0
[00026b64] 6712                      beq.s      object_tree_6
[00026b66] 43f9 000b ce5a            lea.l      $000BCE5A,a1
[00026b6c] 7036                      moveq.l    #54,d0
[00026b6e] 204a                      movea.l    a2,a0
[00026b70] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026b76] 600e                      bra.s      object_tree_7
object_tree_6:
[00026b78] 226d 002a                 movea.l    42(a5),a1
[00026b7c] 7036                      moveq.l    #54,d0
[00026b7e] 204a                      movea.l    a2,a0
[00026b80] 4eb9 0005 0fd8            jsr        Aob_puttext
object_tree_7:
[00026b86] 302e 0002                 move.w     2(a6),d0
[00026b8a] e848                      lsr.w      #4,d0
[00026b8c] c07c 000f                 and.w      #$000F,d0
[00026b90] 7200                      moveq.l    #0,d1
[00026b92] 3200                      move.w     d0,d1
[00026b94] e589                      lsl.l      #2,d1
[00026b96] 41f9 000c a6d0            lea.l      colour_text,a0
[00026b9c] 2270 1800                 movea.l    0(a0,d1.l),a1
[00026ba0] 204a                      movea.l    a2,a0
[00026ba2] 700f                      moveq.l    #15,d0
[00026ba4] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026baa] 302e 0002                 move.w     2(a6),d0
[00026bae] e848                      lsr.w      #4,d0
[00026bb0] c07c 000f                 and.w      #$000F,d0
[00026bb4] 026a fff0 015e            andi.w     #$FFF0,350(a2)
[00026bba] c07c 000f                 and.w      #$000F,d0
[00026bbe] 816a 015e                 or.w       d0,350(a2)
[00026bc2] 3016                      move.w     (a6),d0
[00026bc4] e048                      lsr.w      #8,d0
[00026bc6] c07c 000f                 and.w      #$000F,d0
[00026bca] 7200                      moveq.l    #0,d1
[00026bcc] 3200                      move.w     d0,d1
[00026bce] e589                      lsl.l      #2,d1
[00026bd0] 41f9 000c a6d0            lea.l      colour_text,a0
[00026bd6] 2270 1800                 movea.l    0(a0,d1.l),a1
[00026bda] 204a                      movea.l    a2,a0
[00026bdc] 702f                      moveq.l    #47,d0
[00026bde] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026be4] 3016                      move.w     (a6),d0
[00026be6] e048                      lsr.w      #8,d0
[00026be8] c07c 000f                 and.w      #$000F,d0
[00026bec] 026a fff0 045e            andi.w     #$FFF0,1118(a2)
[00026bf2] c07c 000f                 and.w      #$000F,d0
[00026bf6] 816a 045e                 or.w       d0,1118(a2)
[00026bfa] 3016                      move.w     (a6),d0
[00026bfc] 720c                      moveq.l    #12,d1
[00026bfe] e268                      lsr.w      d1,d0
[00026c00] c07c 000f                 and.w      #$000F,d0
[00026c04] 7400                      moveq.l    #0,d2
[00026c06] 3400                      move.w     d0,d2
[00026c08] e58a                      lsl.l      #2,d2
[00026c0a] 41f9 000c a6d0            lea.l      colour_text,a0
[00026c10] 2270 2800                 movea.l    0(a0,d2.l),a1
[00026c14] 204a                      movea.l    a2,a0
[00026c16] 7028                      moveq.l    #40,d0
[00026c18] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026c1e] 3016                      move.w     (a6),d0
[00026c20] 720c                      moveq.l    #12,d1
[00026c22] e268                      lsr.w      d1,d0
[00026c24] c07c 000f                 and.w      #$000F,d0
[00026c28] 026a fff0 03b6            andi.w     #$FFF0,950(a2)
[00026c2e] c07c 000f                 and.w      #$000F,d0
[00026c32] 816a 03b6                 or.w       d0,950(a2)
[00026c36] 3016                      move.w     (a6),d0
[00026c38] e648                      lsr.w      #3,d0
[00026c3a] c07c 001f                 and.w      #$001F,d0
[00026c3e] e548                      lsl.w      #2,d0
[00026c40] 41f9 000b cd00            lea.l      masklist,a0
[00026c46] 2270 0000                 movea.l    0(a0,d0.w),a1
[00026c4a] 204a                      movea.l    a2,a0
[00026c4c] 701e                      moveq.l    #30,d0
[00026c4e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026c54] 302e 0002                 move.w     2(a6),d0
[00026c58] e448                      lsr.w      #2,d0
[00026c5a] c07c 0001                 and.w      #$0001,d0
[00026c5e] 6712                      beq.s      object_tree_8
[00026c60] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[00026c66] 204a                      movea.l    a2,a0
[00026c68] 7014                      moveq.l    #20,d0
[00026c6a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026c70] 6010                      bra.s      object_tree_9
object_tree_8:
[00026c72] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[00026c78] 7014                      moveq.l    #20,d0
[00026c7a] 204a                      movea.l    a2,a0
[00026c7c] 4eb9 0005 0fd8            jsr        Aob_puttext
object_tree_9:
[00026c82] 302e 0002                 move.w     2(a6),d0
[00026c86] e048                      lsr.w      #8,d0
[00026c88] c07c 00ff                 and.w      #$00FF,d0
[00026c8c] 3f00                      move.w     d0,-(a7)
[00026c8e] 43f9 000b ce85            lea.l      $000BCE85,a1
[00026c94] 41ef 0006                 lea.l      6(a7),a0
[00026c98] 4eb9 0008 15ac            jsr        sprintf
[00026c9e] 544f                      addq.w     #2,a7
[00026ca0] 43ef 0004                 lea.l      4(a7),a1
[00026ca4] 7016                      moveq.l    #22,d0
[00026ca6] 204a                      movea.l    a2,a0
[00026ca8] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026cae] 302e 0002                 move.w     2(a6),d0
[00026cb2] e248                      lsr.w      #1,d0
[00026cb4] c07c 0001                 and.w      #$0001,d0
[00026cb8] 6706                      beq.s      object_tree_10
[00026cba] 006a 0001 048a            ori.w      #$0001,1162(a2)
object_tree_10:
[00026cc0] 302e 0002                 move.w     2(a6),d0
[00026cc4] e648                      lsr.w      #3,d0
[00026cc6] c07c 0001                 and.w      #$0001,d0
[00026cca] 6706                      beq.s      object_tree_11
[00026ccc] 006a 0001 024a            ori.w      #$0001,586(a2)
object_tree_11:
[00026cd2] 7001                      moveq.l    #1,d0
[00026cd4] c06e 0002                 and.w      2(a6),d0
[00026cd8] 6706                      beq.s      object_tree_1
[00026cda] 006a 0001 027a            ori.w      #$0001,634(a2)
object_tree_1:
[00026ce0] 204a                      movea.l    a2,a0
[00026ce2] 4fef 000e                 lea.l      14(a7),a7
[00026ce6] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[00026cea] 4e75                      rts

test_it:
[00026cec] 2f0a                      move.l     a2,-(a7)
[00026cee] 2f0b                      move.l     a3,-(a7)
[00026cf0] 2648                      movea.l    a0,a3
[00026cf2] 2449                      movea.l    a1,a2
[00026cf4] 22bc 0006 afea            move.l     #A_boxed,(a1)
[00026cfa] 486a 0004                 pea.l      4(a2)
[00026cfe] 43f9 000b ce7e            lea.l      $000BCE7E,a1
[00026d04] 2050                      movea.l    (a0),a0
[00026d06] 4eb9 0008 1b26            jsr        sscanf
[00026d0c] 584f                      addq.w     #4,a7
[00026d0e] 257c 0006 a068 0008       move.l     #Auo_boxed,8(a2)
[00026d16] 0c6b 0002 0008            cmpi.w     #$0002,8(a3)
[00026d1c] 6608                      bne.s      test_it_1
[00026d1e] 256b 000a 000c            move.l     10(a3),12(a2)
[00026d24] 6004                      bra.s      test_it_2
test_it_1:
[00026d26] 42aa 000c                 clr.l      12(a2)
test_it_2:
[00026d2a] 7000                      moveq.l    #0,d0
[00026d2c] 2540 0014                 move.l     d0,20(a2)
[00026d30] 2540 0010                 move.l     d0,16(a2)
[00026d34] 206b 0026                 movea.l    38(a3),a0
[00026d38] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00026d3e] 4a40                      tst.w      d0
[00026d40] 6704                      beq.s      test_it_3
[00026d42] 91c8                      suba.l     a0,a0
[00026d44] 6004                      bra.s      test_it_4
test_it_3:
[00026d46] 206b 0026                 movea.l    38(a3),a0
test_it_4:
[00026d4a] 2548 0018                 move.l     a0,24(a2)
[00026d4e] 206b 002a                 movea.l    42(a3),a0
[00026d52] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00026d58] 4a40                      tst.w      d0
[00026d5a] 6704                      beq.s      test_it_5
[00026d5c] 91c8                      suba.l     a0,a0
[00026d5e] 6004                      bra.s      test_it_6
test_it_5:
[00026d60] 206b 002a                 movea.l    42(a3),a0
test_it_6:
[00026d64] 2548 001c                 move.l     a0,28(a2)
[00026d68] 265f                      movea.l    (a7)+,a3
[00026d6a] 245f                      movea.l    (a7)+,a2
[00026d6c] 4e75                      rts

abort:
[00026d6e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026d74] 2268 0258                 movea.l    600(a0),a1
[00026d78] 2069 0014                 movea.l    20(a1),a0
[00026d7c] 2068 003c                 movea.l    60(a0),a0
[00026d80] 42a8 0018                 clr.l      24(a0)
[00026d84] 42a8 001c                 clr.l      28(a0)
[00026d88] 2079 000b ce4a            movea.l    $000BCE4A,a0
[00026d8e] 2050                      movea.l    (a0),a0
[00026d90] 4e90                      jsr        (a0)
[00026d92] 4e75                      rts

ok:
[00026d94] 2f0a                      move.l     a2,-(a7)
[00026d96] 2f0b                      move.l     a3,-(a7)
[00026d98] 4fef ffcc                 lea.l      -52(a7),a7
[00026d9c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026da2] 2268 0258                 movea.l    600(a0),a1
[00026da6] 2669 0014                 movea.l    20(a1),a3
[00026daa] 206b 003c                 movea.l    60(a3),a0
[00026dae] 45e8 0004                 lea.l      4(a0),a2
[00026db2] 4857                      pea.l      (a7)
[00026db4] 43f9 000b ce85            lea.l      $000BCE85,a1
[00026dba] 7016                      moveq.l    #22,d0
[00026dbc] 204b                      movea.l    a3,a0
[00026dbe] 4eb9 0005 10fe            jsr        Aob_scanf
[00026dc4] 584f                      addq.w     #4,a7
[00026dc6] 0c57 00ff                 cmpi.w     #$00FF,(a7)
[00026dca] 6f04                      ble.s      ok_1
[00026dcc] 3ebc 00ff                 move.w     #$00FF,(a7)
ok_1:
[00026dd0] 3017                      move.w     (a7),d0
[00026dd2] 026a 00ff 0002            andi.w     #$00FF,2(a2)
[00026dd8] c07c 00ff                 and.w      #$00FF,d0
[00026ddc] e148                      lsl.w      #8,d0
[00026dde] 816a 0002                 or.w       d0,2(a2)
[00026de2] 2f12                      move.l     (a2),-(a7)
[00026de4] 43f9 000b ce7e            lea.l      $000BCE7E,a1
[00026dea] 41f9 0010 c41c            lea.l      parm,a0
[00026df0] 4eb9 0008 15ac            jsr        sprintf
[00026df6] 584f                      addq.w     #4,a7
[00026df8] 45ef 0002                 lea.l      2(a7),a2
[00026dfc] 24bc 0010 c41c            move.l     #parm,(a2)
[00026e02] 257c 000b ce6f 0004       move.l     #$000BCE6F,4(a2)
[00026e0a] 43ef 0030                 lea.l      48(a7),a1
[00026e0e] 7003                      moveq.l    #3,d0
[00026e10] 41eb 00c0                 lea.l      192(a3),a0
[00026e14] 4eb9 0006 a068            jsr        Auo_boxed
[00026e1a] 206f 0030                 movea.l    48(a7),a0
[00026e1e] 1010                      move.b     (a0),d0
[00026e20] 6720                      beq.s      ok_2
[00026e22] 4eb9 0008 2f6c            jsr        strlen
[00026e28] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026e2e] c1e8 0012                 muls.w     18(a0),d0
[00026e32] 3e80                      move.w     d0,(a7)
[00026e34] 357c 0002 0008            move.w     #$0002,8(a2)
[00026e3a] 256f 0030 000a            move.l     48(a7),10(a2)
[00026e40] 6012                      bra.s      ok_3
ok_2:
[00026e42] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026e48] 3ea8 0012                 move.w     18(a0),(a7)
[00026e4c] 426a 0008                 clr.w      8(a2)
[00026e50] 42aa 000a                 clr.l      10(a2)
ok_3:
[00026e54] 42aa 000e                 clr.l      14(a2)
[00026e58] 4240                      clr.w      d0
[00026e5a] 3540 001c                 move.w     d0,28(a2)
[00026e5e] 3540 0012                 move.w     d0,18(a2)
[00026e62] 7200                      moveq.l    #0,d1
[00026e64] 2541 001e                 move.l     d1,30(a2)
[00026e68] 2541 0014                 move.l     d1,20(a2)
[00026e6c] 7000                      moveq.l    #0,d0
[00026e6e] 2540 0022                 move.l     d0,34(a2)
[00026e72] 2540 0018                 move.l     d0,24(a2)
[00026e76] 43ea 0026                 lea.l      38(a2),a1
[00026e7a] 41eb 04f8                 lea.l      1272(a3),a0
[00026e7e] 7003                      moveq.l    #3,d0
[00026e80] 4eb9 0006 a068            jsr        Auo_boxed
[00026e86] 206a 0026                 movea.l    38(a2),a0
[00026e8a] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00026e90] 4a40                      tst.w      d0
[00026e92] 6704                      beq.s      ok_4
[00026e94] 42aa 0026                 clr.l      38(a2)
ok_4:
[00026e98] 43ea 002a                 lea.l      42(a2),a1
[00026e9c] 7003                      moveq.l    #3,d0
[00026e9e] 41eb 0510                 lea.l      1296(a3),a0
[00026ea2] 4eb9 0006 a068            jsr        Auo_boxed
[00026ea8] 206a 002a                 movea.l    42(a2),a0
[00026eac] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00026eb2] 4a40                      tst.w      d0
[00026eb4] 6704                      beq.s      ok_5
[00026eb6] 42aa 002a                 clr.l      42(a2)
ok_5:
[00026eba] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026ec0] 3228 0014                 move.w     20(a0),d1
[00026ec4] 3017                      move.w     (a7),d0
[00026ec6] 204a                      movea.l    a2,a0
[00026ec8] 2279 000b ce4a            movea.l    $000BCE4A,a1
[00026ece] 2269 0004                 movea.l    4(a1),a1
[00026ed2] 4e91                      jsr        (a1)
[00026ed4] 6100 fe98                 bsr        abort
[00026ed8] 4fef 0034                 lea.l      52(a7),a7
[00026edc] 265f                      movea.l    (a7)+,a3
[00026ede] 245f                      movea.l    (a7)+,a2
[00026ee0] 4e75                      rts

edbe_3d:
[00026ee2] 2f0a                      move.l     a2,-(a7)
[00026ee4] 2f0b                      move.l     a3,-(a7)
[00026ee6] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00026eec] 2052                      movea.l    (a2),a0
[00026eee] 2268 025c                 movea.l    604(a0),a1
[00026ef2] 2669 003c                 movea.l    60(a1),a3
[00026ef6] 584b                      addq.w     #4,a3
[00026ef8] 7001                      moveq.l    #1,d0
[00026efa] 3428 0260                 move.w     608(a0),d2
[00026efe] 48c2                      ext.l      d2
[00026f00] 2202                      move.l     d2,d1
[00026f02] d281                      add.l      d1,d1
[00026f04] d282                      add.l      d2,d1
[00026f06] e789                      lsl.l      #3,d1
[00026f08] c071 180a                 and.w      10(a1,d1.l),d0
[00026f0c] 670e                      beq.s      edbe_3d_1
[00026f0e] 026b fffd 0002            andi.w     #$FFFD,2(a3)
[00026f14] 006b 0002 0002            ori.w      #$0002,2(a3)
[00026f1a] 6006                      bra.s      edbe_3d_2
edbe_3d_1:
[00026f1c] 026b fffd 0002            andi.w     #$FFFD,2(a3)
edbe_3d_2:
[00026f22] 72ff                      moveq.l    #-1,d1
[00026f24] 2052                      movea.l    (a2),a0
[00026f26] 3028 0260                 move.w     608(a0),d0
[00026f2a] 2068 0258                 movea.l    600(a0),a0
[00026f2e] 2252                      movea.l    (a2),a1
[00026f30] 2669 0258                 movea.l    600(a1),a3
[00026f34] 226b 0066                 movea.l    102(a3),a1
[00026f38] 4e91                      jsr        (a1)
[00026f3a] 72ff                      moveq.l    #-1,d1
[00026f3c] 7001                      moveq.l    #1,d0
[00026f3e] 2052                      movea.l    (a2),a0
[00026f40] 2068 0258                 movea.l    600(a0),a0
[00026f44] 2252                      movea.l    (a2),a1
[00026f46] 2669 0258                 movea.l    600(a1),a3
[00026f4a] 226b 0066                 movea.l    102(a3),a1
[00026f4e] 4e91                      jsr        (a1)
[00026f50] 265f                      movea.l    (a7)+,a3
[00026f52] 245f                      movea.l    (a7)+,a2
[00026f54] 4e75                      rts

edbe_autobig:
[00026f56] 2f0a                      move.l     a2,-(a7)
[00026f58] 2f0b                      move.l     a3,-(a7)
[00026f5a] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00026f60] 2052                      movea.l    (a2),a0
[00026f62] 2268 025c                 movea.l    604(a0),a1
[00026f66] 2669 003c                 movea.l    60(a1),a3
[00026f6a] 584b                      addq.w     #4,a3
[00026f6c] 7001                      moveq.l    #1,d0
[00026f6e] 3428 0260                 move.w     608(a0),d2
[00026f72] 48c2                      ext.l      d2
[00026f74] 2202                      move.l     d2,d1
[00026f76] d281                      add.l      d1,d1
[00026f78] d282                      add.l      d2,d1
[00026f7a] e789                      lsl.l      #3,d1
[00026f7c] c071 180a                 and.w      10(a1,d1.l),d0
[00026f80] 670e                      beq.s      edbe_autobig_1
[00026f82] 026b fff7 0002            andi.w     #$FFF7,2(a3)
[00026f88] 006b 0008 0002            ori.w      #$0008,2(a3)
[00026f8e] 6006                      bra.s      edbe_autobig_2
edbe_autobig_1:
[00026f90] 026b fff7 0002            andi.w     #$FFF7,2(a3)
edbe_autobig_2:
[00026f96] 72ff                      moveq.l    #-1,d1
[00026f98] 2052                      movea.l    (a2),a0
[00026f9a] 3028 0260                 move.w     608(a0),d0
[00026f9e] 2068 0258                 movea.l    600(a0),a0
[00026fa2] 2252                      movea.l    (a2),a1
[00026fa4] 2669 0258                 movea.l    600(a1),a3
[00026fa8] 226b 0066                 movea.l    102(a3),a1
[00026fac] 4e91                      jsr        (a1)
[00026fae] 72ff                      moveq.l    #-1,d1
[00026fb0] 7001                      moveq.l    #1,d0
[00026fb2] 2052                      movea.l    (a2),a0
[00026fb4] 2068 0258                 movea.l    600(a0),a0
[00026fb8] 2252                      movea.l    (a2),a1
[00026fba] 2669 0258                 movea.l    600(a1),a3
[00026fbe] 226b 0066                 movea.l    102(a3),a1
[00026fc2] 4e91                      jsr        (a1)
[00026fc4] 265f                      movea.l    (a7)+,a3
[00026fc6] 245f                      movea.l    (a7)+,a2
[00026fc8] 4e75                      rts

edbe_secret:
[00026fca] 2f0a                      move.l     a2,-(a7)
[00026fcc] 2f0b                      move.l     a3,-(a7)
[00026fce] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00026fd4] 2052                      movea.l    (a2),a0
[00026fd6] 2268 025c                 movea.l    604(a0),a1
[00026fda] 2669 003c                 movea.l    60(a1),a3
[00026fde] 584b                      addq.w     #4,a3
[00026fe0] 7001                      moveq.l    #1,d0
[00026fe2] 3428 0260                 move.w     608(a0),d2
[00026fe6] 48c2                      ext.l      d2
[00026fe8] 2202                      move.l     d2,d1
[00026fea] d281                      add.l      d1,d1
[00026fec] d282                      add.l      d2,d1
[00026fee] e789                      lsl.l      #3,d1
[00026ff0] c071 180a                 and.w      10(a1,d1.l),d0
[00026ff4] 670e                      beq.s      edbe_secret_1
[00026ff6] 026b fffe 0002            andi.w     #$FFFE,2(a3)
[00026ffc] 006b 0001 0002            ori.w      #$0001,2(a3)
[00027002] 6006                      bra.s      edbe_secret_2
edbe_secret_1:
[00027004] 026b fffe 0002            andi.w     #$FFFE,2(a3)
edbe_secret_2:
[0002700a] 72ff                      moveq.l    #-1,d1
[0002700c] 2052                      movea.l    (a2),a0
[0002700e] 3028 0260                 move.w     608(a0),d0
[00027012] 2068 0258                 movea.l    600(a0),a0
[00027016] 2252                      movea.l    (a2),a1
[00027018] 2669 0258                 movea.l    600(a1),a3
[0002701c] 226b 0066                 movea.l    102(a3),a1
[00027020] 4e91                      jsr        (a1)
[00027022] 72ff                      moveq.l    #-1,d1
[00027024] 7001                      moveq.l    #1,d0
[00027026] 2052                      movea.l    (a2),a0
[00027028] 2068 0258                 movea.l    600(a0),a0
[0002702c] 2252                      movea.l    (a2),a1
[0002702e] 2669 0258                 movea.l    600(a1),a3
[00027032] 226b 0066                 movea.l    102(a3),a1
[00027036] 4e91                      jsr        (a1)
[00027038] 265f                      movea.l    (a7)+,a3
[0002703a] 245f                      movea.l    (a7)+,a2
[0002703c] 4e75                      rts

edbe_incol:
[0002703e] 3f03                      move.w     d3,-(a7)
[00027040] 2f0a                      move.l     a2,-(a7)
[00027042] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027048] 2268 025c                 movea.l    604(a0),a1
[0002704c] 2469 003c                 movea.l    60(a1),a2
[00027050] 584a                      addq.w     #4,a2
[00027052] 702e                      moveq.l    #46,d0
[00027054] 3f00                      move.w     d0,-(a7)
[00027056] 742f                      moveq.l    #47,d2
[00027058] 722c                      moveq.l    #44,d1
[0002705a] 3012                      move.w     (a2),d0
[0002705c] e048                      lsr.w      #8,d0
[0002705e] c07c 000f                 and.w      #$000F,d0
[00027062] 4eb9 0003 0bde            jsr        oe_colsel
[00027068] 544f                      addq.w     #2,a7
[0002706a] 3600                      move.w     d0,d3
[0002706c] 6f2c                      ble.s      edbe_incol_1
[0002706e] 3203                      move.w     d3,d1
[00027070] 0252 f0ff                 andi.w     #$F0FF,(a2)
[00027074] c27c 000f                 and.w      #$000F,d1
[00027078] e149                      lsl.w      #8,d1
[0002707a] 8352                      or.w       d1,(a2)
[0002707c] 72ff                      moveq.l    #-1,d1
[0002707e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027084] 2068 0258                 movea.l    600(a0),a0
[00027088] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002708e] 2469 0258                 movea.l    600(a1),a2
[00027092] 226a 0066                 movea.l    102(a2),a1
[00027096] 7001                      moveq.l    #1,d0
[00027098] 4e91                      jsr        (a1)
edbe_incol_1:
[0002709a] 245f                      movea.l    (a7)+,a2
[0002709c] 361f                      move.w     (a7)+,d3
[0002709e] 4e75                      rts

edbe_outcol:
[000270a0] 2f03                      move.l     d3,-(a7)
[000270a2] 2f0a                      move.l     a2,-(a7)
[000270a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000270aa] 2268 025c                 movea.l    604(a0),a1
[000270ae] 2469 003c                 movea.l    60(a1),a2
[000270b2] 584a                      addq.w     #4,a2
[000270b4] 7027                      moveq.l    #39,d0
[000270b6] 3f00                      move.w     d0,-(a7)
[000270b8] 7428                      moveq.l    #40,d2
[000270ba] 7225                      moveq.l    #37,d1
[000270bc] 3012                      move.w     (a2),d0
[000270be] 760c                      moveq.l    #12,d3
[000270c0] e668                      lsr.w      d3,d0
[000270c2] c07c 000f                 and.w      #$000F,d0
[000270c6] 4eb9 0003 0bde            jsr        oe_colsel
[000270cc] 544f                      addq.w     #2,a7
[000270ce] 3600                      move.w     d0,d3
[000270d0] 6f2e                      ble.s      edbe_outcol_1
[000270d2] 3203                      move.w     d3,d1
[000270d4] 0252 0fff                 andi.w     #$0FFF,(a2)
[000270d8] c27c 000f                 and.w      #$000F,d1
[000270dc] e149                      lsl.w      #8,d1
[000270de] e949                      lsl.w      #4,d1
[000270e0] 8352                      or.w       d1,(a2)
[000270e2] 72ff                      moveq.l    #-1,d1
[000270e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000270ea] 2068 0258                 movea.l    600(a0),a0
[000270ee] 2279 0010 ee4e            movea.l    ACSblk,a1
[000270f4] 2469 0258                 movea.l    600(a1),a2
[000270f8] 226a 0066                 movea.l    102(a2),a1
[000270fc] 7001                      moveq.l    #1,d0
[000270fe] 4e91                      jsr        (a1)
edbe_outcol_1:
[00027100] 245f                      movea.l    (a7)+,a2
[00027102] 261f                      move.l     (a7)+,d3
[00027104] 4e75                      rts

edbe_size:
[00027106] 48e7 0034                 movem.l    a2-a3/a5,-(a7)
[0002710a] 514f                      subq.w     #8,a7
[0002710c] 41f9 000c a0a0            lea.l      POP_SIZESEL,a0
[00027112] 4eb9 0004 f064            jsr        Aob_create
[00027118] 2448                      movea.l    a0,a2
[0002711a] 200a                      move.l     a2,d0
[0002711c] 6700 00ea                 beq        edbe_size_1
[00027120] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00027126] 7012                      moveq.l    #18,d0
[00027128] 2053                      movea.l    (a3),a0
[0002712a] 2268 0258                 movea.l    600(a0),a1
[0002712e] 2269 0014                 movea.l    20(a1),a1
[00027132] 41d7                      lea.l      (a7),a0
[00027134] 4eb9 0004 fe06            jsr        Aob_offset
[0002713a] 7001                      moveq.l    #1,d0
[0002713c] 2053                      movea.l    (a3),a0
[0002713e] 2268 0258                 movea.l    600(a0),a1
[00027142] d069 0034                 add.w      52(a1),d0
[00027146] d157                      add.w      d0,(a7)
[00027148] 7201                      moveq.l    #1,d1
[0002714a] d269 0036                 add.w      54(a1),d1
[0002714e] d36f 0002                 add.w      d1,2(a7)
[00027152] 2268 025c                 movea.l    604(a0),a1
[00027156] 2a69 003c                 movea.l    60(a1),a5
[0002715a] 584d                      addq.w     #4,a5
[0002715c] 302d 0002                 move.w     2(a5),d0
[00027160] e448                      lsr.w      #2,d0
[00027162] c07c 0001                 and.w      #$0001,d0
[00027166] 5240                      addq.w     #1,d0
[00027168] 7200                      moveq.l    #0,d1
[0002716a] 3200                      move.w     d0,d1
[0002716c] 2401                      move.l     d1,d2
[0002716e] d482                      add.l      d2,d2
[00027170] d481                      add.l      d1,d2
[00027172] e78a                      lsl.l      #3,d2
[00027174] 0072 0004 280a            ori.w      #$0004,10(a2,d2.l)
[0002717a] 322f 0002                 move.w     2(a7),d1
[0002717e] 3017                      move.w     (a7),d0
[00027180] 224a                      movea.l    a2,a1
[00027182] 2053                      movea.l    (a3),a0
[00027184] 2068 0258                 movea.l    600(a0),a0
[00027188] 4eb9 0004 e84a            jsr        Ame_popup
[0002718e] 4a40                      tst.w      d0
[00027190] 6f6e                      ble.s      edbe_size_2
[00027192] b07c 0001                 cmp.w      #$0001,d0
[00027196] 661c                      bne.s      edbe_size_3
[00027198] 026d fffb 0002            andi.w     #$FFFB,2(a5)
[0002719e] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[000271a4] 7014                      moveq.l    #20,d0
[000271a6] 2053                      movea.l    (a3),a0
[000271a8] 2068 025c                 movea.l    604(a0),a0
[000271ac] 4eb9 0005 0fd8            jsr        Aob_puttext
[000271b2] 6020                      bra.s      edbe_size_4
edbe_size_3:
[000271b4] 026d fffb 0002            andi.w     #$FFFB,2(a5)
[000271ba] 006d 0004 0002            ori.w      #$0004,2(a5)
[000271c0] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[000271c6] 7014                      moveq.l    #20,d0
[000271c8] 2053                      movea.l    (a3),a0
[000271ca] 2068 025c                 movea.l    604(a0),a0
[000271ce] 4eb9 0005 0fd8            jsr        Aob_puttext
edbe_size_4:
[000271d4] 72ff                      moveq.l    #-1,d1
[000271d6] 7014                      moveq.l    #20,d0
[000271d8] 2053                      movea.l    (a3),a0
[000271da] 2068 0258                 movea.l    600(a0),a0
[000271de] 2253                      movea.l    (a3),a1
[000271e0] 2a69 0258                 movea.l    600(a1),a5
[000271e4] 226d 0066                 movea.l    102(a5),a1
[000271e8] 4e91                      jsr        (a1)
[000271ea] 72ff                      moveq.l    #-1,d1
[000271ec] 7001                      moveq.l    #1,d0
[000271ee] 2053                      movea.l    (a3),a0
[000271f0] 2068 0258                 movea.l    600(a0),a0
[000271f4] 2253                      movea.l    (a3),a1
[000271f6] 2a69 0258                 movea.l    600(a1),a5
[000271fa] 226d 0066                 movea.l    102(a5),a1
[000271fe] 4e91                      jsr        (a1)
edbe_size_2:
[00027200] 204a                      movea.l    a2,a0
[00027202] 4eb9 0004 f20a            jsr        Aob_delete
edbe_size_1:
[00027208] 504f                      addq.w     #8,a7
[0002720a] 4cdf 2c00                 movem.l    (a7)+,a2-a3/a5
[0002720e] 4e75                      rts

edbe_mask:
[00027210] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00027214] 4fef fff0                 lea.l      -16(a7),a7
[00027218] 41f9 000b c1a8            lea.l      POP_MASKSEL,a0
[0002721e] 4eb9 0004 f064            jsr        Aob_create
[00027224] 2448                      movea.l    a0,a2
[00027226] 200a                      move.l     a2,d0
[00027228] 6700 0172                 beq        edbe_mask_1
[0002722c] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00027232] 4bef 0008                 lea.l      8(a7),a5
[00027236] 701c                      moveq.l    #28,d0
[00027238] 2053                      movea.l    (a3),a0
[0002723a] 2268 0258                 movea.l    600(a0),a1
[0002723e] 2269 0014                 movea.l    20(a1),a1
[00027242] 204d                      movea.l    a5,a0
[00027244] 4eb9 0004 fe06            jsr        Aob_offset
[0002724a] 7001                      moveq.l    #1,d0
[0002724c] 2053                      movea.l    (a3),a0
[0002724e] 2268 0258                 movea.l    600(a0),a1
[00027252] d069 0034                 add.w      52(a1),d0
[00027256] d155                      add.w      d0,(a5)
[00027258] 7201                      moveq.l    #1,d1
[0002725a] d269 0036                 add.w      54(a1),d1
[0002725e] d36d 0002                 add.w      d1,2(a5)
[00027262] 2268 025c                 movea.l    604(a0),a1
[00027266] 2869 003c                 movea.l    60(a1),a4
[0002726a] 584c                      addq.w     #4,a4
[0002726c] 2068 0258                 movea.l    600(a0),a0
[00027270] 224a                      movea.l    a2,a1
[00027272] 3015                      move.w     (a5),d0
[00027274] 322d 0002                 move.w     2(a5),d1
[00027278] 4eb9 0004 e84a            jsr        Ame_popup
[0002727e] 3600                      move.w     d0,d3
[00027280] 6f00 0112                 ble        edbe_mask_2
[00027284] 48c0                      ext.l      d0
[00027286] 2200                      move.l     d0,d1
[00027288] d281                      add.l      d1,d1
[0002728a] d280                      add.l      d0,d1
[0002728c] e789                      lsl.l      #3,d1
[0002728e] 4bf2 1818                 lea.l      24(a2,d1.l),a5
[00027292] 342d 0008                 move.w     8(a5),d2
[00027296] c47c 8000                 and.w      #$8000,d2
[0002729a] 6700 00f8                 beq        edbe_mask_2
[0002729e] 342d 000e                 move.w     14(a5),d2
[000272a2] 0254 ff07                 andi.w     #$FF07,(a4)
[000272a6] c47c 001f                 and.w      #$001F,d2
[000272aa] e74a                      lsl.w      #3,d2
[000272ac] 8554                      or.w       d2,(a4)
[000272ae] 3414                      move.w     (a4),d2
[000272b0] e64a                      lsr.w      #3,d2
[000272b2] c47c 001f                 and.w      #$001F,d2
[000272b6] e54a                      lsl.w      #2,d2
[000272b8] 41f9 000b cd00            lea.l      masklist,a0
[000272be] 2270 2000                 movea.l    0(a0,d2.w),a1
[000272c2] 2053                      movea.l    (a3),a0
[000272c4] 2068 025c                 movea.l    604(a0),a0
[000272c8] 701e                      moveq.l    #30,d0
[000272ca] 4eb9 0005 0fd8            jsr        Aob_puttext
[000272d0] 43ef 0004                 lea.l      4(a7),a1
[000272d4] 7003                      moveq.l    #3,d0
[000272d6] 2053                      movea.l    (a3),a0
[000272d8] 2068 0258                 movea.l    600(a0),a0
[000272dc] 2068 0014                 movea.l    20(a0),a0
[000272e0] 41e8 00c0                 lea.l      192(a0),a0
[000272e4] 4eb9 0006 a068            jsr        Auo_boxed
[000272ea] 206f 0004                 movea.l    4(a7),a0
[000272ee] 4eb9 0004 643c            jsr        Ast_create
[000272f4] 2e88                      move.l     a0,(a7)
[000272f6] 6770                      beq.s      edbe_mask_3
[000272f8] 43f9 000b ce5a            lea.l      $000BCE5A,a1
[000272fe] 7004                      moveq.l    #4,d0
[00027300] 2053                      movea.l    (a3),a0
[00027302] 2068 0258                 movea.l    600(a0),a0
[00027306] 2068 0014                 movea.l    20(a0),a0
[0002730a] 41e8 00c0                 lea.l      192(a0),a0
[0002730e] 4eb9 0006 a068            jsr        Auo_boxed
[00027314] 2053                      movea.l    (a3),a0
[00027316] 2268 025c                 movea.l    604(a0),a1
[0002731a] 2869 00cc                 movea.l    204(a1),a4
[0002731e] 584c                      addq.w     #4,a4
[00027320] 302d 000e                 move.w     14(a5),d0
[00027324] 0254 ff07                 andi.w     #$FF07,(a4)
[00027328] c07c 001f                 and.w      #$001F,d0
[0002732c] e748                      lsl.w      #3,d0
[0002732e] 8154                      or.w       d0,(a4)
[00027330] 2257                      movea.l    (a7),a1
[00027332] 7004                      moveq.l    #4,d0
[00027334] 2053                      movea.l    (a3),a0
[00027336] 2868 0258                 movea.l    600(a0),a4
[0002733a] 206c 0014                 movea.l    20(a4),a0
[0002733e] 41e8 00c0                 lea.l      192(a0),a0
[00027342] 4eb9 0006 a068            jsr        Auo_boxed
[00027348] 93c9                      suba.l     a1,a1
[0002734a] 7006                      moveq.l    #6,d0
[0002734c] 2053                      movea.l    (a3),a0
[0002734e] 2868 0258                 movea.l    600(a0),a4
[00027352] 206c 0014                 movea.l    20(a4),a0
[00027356] 41e8 00c0                 lea.l      192(a0),a0
[0002735a] 4eb9 0006 a068            jsr        Auo_boxed
[00027360] 2057                      movea.l    (a7),a0
[00027362] 4eb9 0004 649c            jsr        Ast_delete
edbe_mask_3:
[00027368] 72ff                      moveq.l    #-1,d1
[0002736a] 701c                      moveq.l    #28,d0
[0002736c] 2053                      movea.l    (a3),a0
[0002736e] 2068 0258                 movea.l    600(a0),a0
[00027372] 2253                      movea.l    (a3),a1
[00027374] 2869 0258                 movea.l    600(a1),a4
[00027378] 226c 0066                 movea.l    102(a4),a1
[0002737c] 4e91                      jsr        (a1)
[0002737e] 72ff                      moveq.l    #-1,d1
[00027380] 7001                      moveq.l    #1,d0
[00027382] 2053                      movea.l    (a3),a0
[00027384] 2068 0258                 movea.l    600(a0),a0
[00027388] 2253                      movea.l    (a3),a1
[0002738a] 2869 0258                 movea.l    600(a1),a4
[0002738e] 226c 0066                 movea.l    102(a4),a1
[00027392] 4e91                      jsr        (a1)
edbe_mask_2:
[00027394] 204a                      movea.l    a2,a0
[00027396] 4eb9 0004 f20a            jsr        Aob_delete
edbe_mask_1:
[0002739c] 4fef 0010                 lea.l      16(a7),a7
[000273a0] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[000273a4] 4e75                      rts

edbe_textcol:
[000273a6] 3f03                      move.w     d3,-(a7)
[000273a8] 2f0a                      move.l     a2,-(a7)
[000273aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[000273b0] 2268 025c                 movea.l    604(a0),a1
[000273b4] 2469 003c                 movea.l    60(a1),a2
[000273b8] 584a                      addq.w     #4,a2
[000273ba] 700e                      moveq.l    #14,d0
[000273bc] 3f00                      move.w     d0,-(a7)
[000273be] 740f                      moveq.l    #15,d2
[000273c0] 720c                      moveq.l    #12,d1
[000273c2] 302a 0002                 move.w     2(a2),d0
[000273c6] e848                      lsr.w      #4,d0
[000273c8] c07c 000f                 and.w      #$000F,d0
[000273cc] 4eb9 0003 0bde            jsr        oe_colsel
[000273d2] 544f                      addq.w     #2,a7
[000273d4] 3600                      move.w     d0,d3
[000273d6] 6f30                      ble.s      edbe_textcol_1
[000273d8] 3203                      move.w     d3,d1
[000273da] 026a ff0f 0002            andi.w     #$FF0F,2(a2)
[000273e0] c27c 000f                 and.w      #$000F,d1
[000273e4] e949                      lsl.w      #4,d1
[000273e6] 836a 0002                 or.w       d1,2(a2)
[000273ea] 72ff                      moveq.l    #-1,d1
[000273ec] 2079 0010 ee4e            movea.l    ACSblk,a0
[000273f2] 2068 0258                 movea.l    600(a0),a0
[000273f6] 2279 0010 ee4e            movea.l    ACSblk,a1
[000273fc] 2469 0258                 movea.l    600(a1),a2
[00027400] 226a 0066                 movea.l    102(a2),a1
[00027404] 7001                      moveq.l    #1,d0
[00027406] 4e91                      jsr        (a1)
edbe_textcol_1:
[00027408] 245f                      movea.l    (a7)+,a2
[0002740a] 361f                      move.w     (a7)+,d3
[0002740c] 4e75                      rts

	.data

BUBBLE_01:
[000bb6d2]                           dc.b 'Die énderungen werden Åbernommen und Åberschreiben die alten Einstellungen.',0
BUBBLE_02:
[000bb71e]                           dc.b 'Die énderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
BUBBLE_03:
[000bb769]                           dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_04:
[000bb7bb]                           dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
PMT00:
[000bb83f]                           dc.b '  alle Zeichen',0
PMT01:
[000bb84e]                           dc.b '  normaler Pfad',0
PMT02:
[000bb85e]                           dc.b '  normale Datei',0
PMT03:
[000bb86e]                           dc.b '  TOS-Datei',0
PMT04:
[000bb87a]                           dc.b '  TOS-Datei-Muster',0
PMT05:
[000bb88d]                           dc.b '  TOS-Pfad',0
PMT06:
[000bb898]                           dc.b '  TOS-Pfad-Muster',0
PMT07:
[000bb8aa]                           dc.b '  normal',0
PMT08:
[000bb8b3]                           dc.b '  Buchstaben',0
PMT09:
[000bb8c0]                           dc.b '  Buchstaben & Zahlen',0
PMT10:
[000bb8d6]                           dc.b '  BinÑrzahl',0
PMT11:
[000bb8e2]                           dc.b '  neg. BinÑrzahl',0
PMT12:
[000bb8f3]                           dc.b '  Oktalzahl',0
PMT13:
[000bb8ff]                           dc.b '  neg. Oktalzahl',0
PMT14:
[000bb910]                           dc.b '  Dezimalzahl',0
PMT15:
[000bb91e]                           dc.b '  neg. Dezimalzahl',0
PMT16:
[000bb931]                           dc.b '  Hexadezimalzahl',0
PMT17:
[000bb943]                           dc.b '  neg. Hexadezimalzahl',0
PMT18:
[000bb95a]                           dc.b '  Flieûkommazahl',0
PMT19:
[000bb96b]                           dc.b '  neg. Flieûkommazahl',0
PMT20:
[000bb981]                           dc.b '  TT.MM.JJJJ',0
PMT21:
[000bb98e]                           dc.b '  TT/MM/JJJJ',0
PMT22:
[000bb99b]                           dc.b '  MM.TT.JJJJ',0
PMT23:
[000bb9a8]                           dc.b '  MM/TT/JJJJ',0
PMT24:
[000bb9b5]                           dc.b '  Stunden unbegrenzt',0
PMT25:
[000bb9ca]                           dc.b '  max. 12 Stunden',0
PMT26:
[000bb9dc]                           dc.b '  max. 24 Stunden',0
TEXT_005:
[000bb9ee]                           dc.b '  Datum             '
[000bba02]                           dc.w $0300
TEXT_009:
[000bba04]                           dc.b 'Abbruch',0
TEXT_01:
[000bba0c]                           dc.b '3D-Modus',0
TEXT_02:
[000bba15]                           dc.b 'unsichtbarer Text',0
TEXT_05:
[000bba27]                           dc.b 'Sonstiges',0
TEXT_06:
[000bba31]                           dc.b '  Zeit              '
[000bba45]                           dc.b $03
[000bba46]                           dc.w $004b
[000bba48]                           dc.b 'apitalisieren',0
TEXT_08:
[000bba56]                           dc.b 'BubbleGEM-Text',0
TEXT_09:
[000bba65]                           dc.b 'unten:',0
TEXT_10:
[000bba6c]                           dc.b 'Rahmen:                ',0
TEXT_11:
[000bba84]                           dc.b 'Farbe:',0
TEXT_12:
[000bba8b]                           dc.b 'Grîûe:',0
TEXT_13:
[000bba92]                           dc.b 'LÑnge:',0
TEXT_14:
[000bba99]                           dc.b 'Text:',0
TEXT_15:
[000bba9f]                           dc.b 'Maske:',0
TEXT_16:
[000bbaa6]                           dc.b 'Context-Popup',0
TEXT_18:
[000bbab4]                           dc.b 'Eingabe:',0
TEXT_19:
[000bbabd]                           dc.b 'oben:',0
TEXT_20:
[000bbac3]                           dc.b 'Format: Std:Min:Sek',0
TEXT_21:
[000bbad7]                           dc.b 'links/',0
TEXT_22:
[000bbade]                           dc.b 'rechts/',0
TEXT_30:
[000bbae6]                           dc.b '  Zahlen            '
[000bbafa]                           dc.w $0300
TEXT_41:
[000bbafc]                           dc.w $4f4b
[000bbafe]                           dc.w $0020
[000bbb00]                           dc.b ' Pfad              '
[000bbb13]                           dc.b $03
[000bbb14]                           dc.w $0020
[000bbb16]                           dc.b ' Datei             '
[000bbb29]                           dc.b $03
[000bbb2a]                           dc.w $0044
[000bbb2c]                           dc.b 'er BoxEdit-Editor',0
title:
[000bbb3e]                           dc.b 'BOXEDIT -',0
A_3DBUTTON01:
[000bbb48] 00064a22                  dc.l A_3Dbutton
[000bbb4c]                           dc.w $09f1
[000bbb4e]                           dc.w $0178
[000bbb50] 000630f2                  dc.l Auo_string
[000bbb54] 000bbb15                  dc.l TXT1
[000bbb58]                           dc.w $0000
[000bbb5a]                           dc.w $0000
[000bbb5c]                           dc.w $0000
[000bbb5e]                           dc.w $0000
[000bbb60]                           dc.w $0000
[000bbb62]                           dc.w $0000
[000bbb64]                           dc.w $0000
[000bbb66]                           dc.w $0000
A_3DBUTTON02:
[000bbb68] 00064a22                  dc.l A_3Dbutton
[000bbb6c]                           dc.w $09f1
[000bbb6e]                           dc.w $0178
[000bbb70] 000630f2                  dc.l Auo_string
[000bbb74] 000bb83f                  dc.l PMT00
[000bbb78]                           dc.w $0000
[000bbb7a]                           dc.w $0000
[000bbb7c]                           dc.w $0000
[000bbb7e]                           dc.w $0000
[000bbb80]                           dc.w $0000
[000bbb82]                           dc.w $0000
[000bbb84]                           dc.w $0000
[000bbb86]                           dc.w $0000
A_3DBUTTON03:
[000bbb88] 00064a22                  dc.l A_3Dbutton
[000bbb8c]                           dc.w $09f1
[000bbb8e]                           dc.w $0178
[000bbb90] 000630f2                  dc.l Auo_string
[000bbb94] 000bbae6                  dc.l TEXT_30
[000bbb98]                           dc.w $0000
[000bbb9a]                           dc.w $0000
[000bbb9c]                           dc.w $0000
[000bbb9e]                           dc.w $0000
[000bbba0]                           dc.w $0000
[000bbba2]                           dc.w $0000
[000bbba4]                           dc.w $0000
[000bbba6]                           dc.w $0000
A_3DBUTTON04:
[000bbba8] 00064a22                  dc.l A_3Dbutton
[000bbbac]                           dc.w $09f1
[000bbbae]                           dc.w $0178
[000bbbb0] 000630f2                  dc.l Auo_string
[000bbbb4] 000bb9ee                  dc.l TEXT_005
[000bbbb8]                           dc.w $0000
[000bbbba]                           dc.w $0000
[000bbbbc]                           dc.w $0000
[000bbbbe]                           dc.w $0000
[000bbbc0]                           dc.w $0000
[000bbbc2]                           dc.w $0000
[000bbbc4]                           dc.w $0000
[000bbbc6]                           dc.w $0000
A_3DBUTTON05:
[000bbbc8] 00064a22                  dc.l A_3Dbutton
[000bbbcc]                           dc.w $09f1
[000bbbce]                           dc.w $0178
[000bbbd0] 000630f2                  dc.l Auo_string
[000bbbd4] 000bbaff                  dc.l TXT0
[000bbbd8]                           dc.w $0000
[000bbbda]                           dc.w $0000
[000bbbdc]                           dc.w $0000
[000bbbde]                           dc.w $0000
[000bbbe0]                           dc.w $0000
[000bbbe2]                           dc.w $0000
[000bbbe4]                           dc.w $0000
[000bbbe6]                           dc.w $0000
A_3DBUTTON06:
[000bbbe8] 00064a22                  dc.l A_3Dbutton
[000bbbec]                           dc.w $21f1
[000bbbee]                           dc.w $0178
[000bbbf0] 000630f2                  dc.l Auo_string
[000bbbf4]                           dc.w $0000
[000bbbf6]                           dc.w $0000
[000bbbf8]                           dc.w $0000
[000bbbfa]                           dc.w $0000
[000bbbfc]                           dc.w $0000
[000bbbfe]                           dc.w $0000
[000bbc00]                           dc.w $0000
[000bbc02]                           dc.w $0000
[000bbc04]                           dc.w $0000
[000bbc06]                           dc.w $0000
A_3DBUTTON07:
[000bbc08] 00064a22                  dc.l A_3Dbutton
[000bbc0c]                           dc.w $09f1
[000bbc0e]                           dc.w $0178
[000bbc10] 000630f2                  dc.l Auo_string
[000bbc14]                           dc.w $0000
[000bbc16]                           dc.w $0000
[000bbc18]                           dc.w $0000
[000bbc1a]                           dc.w $0000
[000bbc1c]                           dc.w $0000
[000bbc1e]                           dc.w $0000
[000bbc20]                           dc.w $0000
[000bbc22]                           dc.w $0000
[000bbc24]                           dc.w $0000
[000bbc26]                           dc.w $0000
A_3DBUTTON08:
[000bbc28] 00064a22                  dc.l A_3Dbutton
[000bbc2c]                           dc.w $09f1
[000bbc2e]                           dc.w $0178
[000bbc30] 000630f2                  dc.l Auo_string
[000bbc34] 000bb85e                  dc.l PMT02
[000bbc38]                           dc.w $0000
[000bbc3a]                           dc.w $0000
[000bbc3c]                           dc.w $0000
[000bbc3e]                           dc.w $0000
[000bbc40]                           dc.w $0000
[000bbc42]                           dc.w $0000
[000bbc44]                           dc.w $0000
[000bbc46]                           dc.w $0000
A_3DBUTTON09:
[000bbc48] 00064a22                  dc.l A_3Dbutton
[000bbc4c]                           dc.w $29c1
[000bbc4e]                           dc.w $0178
[000bbc50] 000630f2                  dc.l Auo_string
[000bbc54] 000bba04                  dc.l TEXT_009
[000bbc58]                           dc.w $0000
[000bbc5a]                           dc.w $0000
[000bbc5c]                           dc.w $0000
[000bbc5e]                           dc.w $0000
[000bbc60] 000bb71e                  dc.l BUBBLE_02
[000bbc64]                           dc.w $0000
[000bbc66]                           dc.w $0000
A_3DBUTTON10:
[000bbc68] 00064a22                  dc.l A_3Dbutton
[000bbc6c]                           dc.w $09f1
[000bbc6e]                           dc.w $0178
[000bbc70] 000630f2                  dc.l Auo_string
[000bbc74] 000bb86e                  dc.l PMT03
[000bbc78]                           dc.w $0000
[000bbc7a]                           dc.w $0000
[000bbc7c]                           dc.w $0000
[000bbc7e]                           dc.w $0000
[000bbc80]                           dc.w $0000
[000bbc82]                           dc.w $0000
[000bbc84]                           dc.w $0000
[000bbc86]                           dc.w $0000
A_3DBUTTON11:
[000bbc88] 00064a22                  dc.l A_3Dbutton
[000bbc8c]                           dc.w $09f1
[000bbc8e]                           dc.w $0178
[000bbc90] 000630f2                  dc.l Auo_string
[000bbc94] 000bb8aa                  dc.l PMT07
[000bbc98]                           dc.w $0000
[000bbc9a]                           dc.w $0000
[000bbc9c]                           dc.w $0000
[000bbc9e]                           dc.w $0000
[000bbca0]                           dc.w $0000
[000bbca2]                           dc.w $0000
[000bbca4]                           dc.w $0000
[000bbca6]                           dc.w $0000
A_3DBUTTON12:
[000bbca8] 00064a22                  dc.l A_3Dbutton
[000bbcac]                           dc.w $09f1
[000bbcae]                           dc.w $0178
[000bbcb0] 000630f2                  dc.l Auo_string
[000bbcb4] 000bb8d6                  dc.l PMT10
[000bbcb8]                           dc.w $0000
[000bbcba]                           dc.w $0000
[000bbcbc]                           dc.w $0000
[000bbcbe]                           dc.w $0000
[000bbcc0]                           dc.w $0000
[000bbcc2]                           dc.w $0000
[000bbcc4]                           dc.w $0000
[000bbcc6]                           dc.w $0000
A_3DBUTTON13:
[000bbcc8] 00064a22                  dc.l A_3Dbutton
[000bbccc]                           dc.w $09f1
[000bbcce]                           dc.w $0178
[000bbcd0] 000630f2                  dc.l Auo_string
[000bbcd4] 000bb8b3                  dc.l PMT08
[000bbcd8]                           dc.w $0000
[000bbcda]                           dc.w $0000
[000bbcdc]                           dc.w $0000
[000bbcde]                           dc.w $0000
[000bbce0]                           dc.w $0000
[000bbce2]                           dc.w $0000
[000bbce4]                           dc.w $0000
[000bbce6]                           dc.w $0000
A_3DBUTTON14:
[000bbce8] 00064a22                  dc.l A_3Dbutton
[000bbcec]                           dc.w $09f1
[000bbcee]                           dc.w $0178
[000bbcf0] 000630f2                  dc.l Auo_string
[000bbcf4] 000bb8c0                  dc.l PMT09
[000bbcf8]                           dc.w $0000
[000bbcfa]                           dc.w $0000
[000bbcfc]                           dc.w $0000
[000bbcfe]                           dc.w $0000
[000bbd00]                           dc.w $0000
[000bbd02]                           dc.w $0000
[000bbd04]                           dc.w $0000
[000bbd06]                           dc.w $0000
A_3DBUTTON15:
[000bbd08] 00064a22                  dc.l A_3Dbutton
[000bbd0c]                           dc.w $09f1
[000bbd0e]                           dc.w $0178
[000bbd10] 000630f2                  dc.l Auo_string
[000bbd14] 000bb8e2                  dc.l PMT11
[000bbd18]                           dc.w $0000
[000bbd1a]                           dc.w $0000
[000bbd1c]                           dc.w $0000
[000bbd1e]                           dc.w $0000
[000bbd20]                           dc.w $0000
[000bbd22]                           dc.w $0000
[000bbd24]                           dc.w $0000
[000bbd26]                           dc.w $0000
A_3DBUTTON16:
[000bbd28] 00064a22                  dc.l A_3Dbutton
[000bbd2c]                           dc.w $29c1
[000bbd2e]                           dc.w $0178
[000bbd30] 000630f2                  dc.l Auo_string
[000bbd34] 000bbafc                  dc.l TEXT_41
[000bbd38]                           dc.w $0000
[000bbd3a]                           dc.w $0000
[000bbd3c]                           dc.w $0000
[000bbd3e]                           dc.w $0000
[000bbd40] 000bb6d2                  dc.l BUBBLE_01
[000bbd44]                           dc.w $0000
[000bbd46]                           dc.w $0000
A_3DBUTTON25:
[000bbd48] 00064a22                  dc.l A_3Dbutton
[000bbd4c]                           dc.w $09f1
[000bbd4e]                           dc.w $0178
[000bbd50] 000630f2                  dc.l Auo_string
[000bbd54] 000bb981                  dc.l PMT20
[000bbd58]                           dc.w $0000
[000bbd5a]                           dc.w $0000
[000bbd5c]                           dc.w $0000
[000bbd5e]                           dc.w $0000
[000bbd60]                           dc.w $0000
[000bbd62]                           dc.w $0000
[000bbd64]                           dc.w $0000
[000bbd66]                           dc.w $0000
A_3DBUTTON26:
[000bbd68] 00064a22                  dc.l A_3Dbutton
[000bbd6c]                           dc.w $09f1
[000bbd6e]                           dc.w $0178
[000bbd70] 000630f2                  dc.l Auo_string
[000bbd74] 000bb99b                  dc.l PMT22
[000bbd78]                           dc.w $0000
[000bbd7a]                           dc.w $0000
[000bbd7c]                           dc.w $0000
[000bbd7e]                           dc.w $0000
[000bbd80]                           dc.w $0000
[000bbd82]                           dc.w $0000
[000bbd84]                           dc.w $0000
[000bbd86]                           dc.w $0000
A_3DBUTTON27:
[000bbd88] 00064a22                  dc.l A_3Dbutton
[000bbd8c]                           dc.w $09f1
[000bbd8e]                           dc.w $0178
[000bbd90] 000630f2                  dc.l Auo_string
[000bbd94]                           dc.w $0000
[000bbd96]                           dc.w $0000
[000bbd98]                           dc.w $0000
[000bbd9a]                           dc.w $0000
[000bbd9c]                           dc.w $0000
[000bbd9e]                           dc.w $0000
[000bbda0]                           dc.w $0000
[000bbda2]                           dc.w $0000
[000bbda4]                           dc.w $0000
[000bbda6]                           dc.w $0000
A_3DBUTTON28:
[000bbda8] 00064a22                  dc.l A_3Dbutton
[000bbdac]                           dc.w $09f1
[000bbdae]                           dc.w $0178
[000bbdb0] 000630f2                  dc.l Auo_string
[000bbdb4] 000bb98e                  dc.l PMT21
[000bbdb8]                           dc.w $0000
[000bbdba]                           dc.w $0000
[000bbdbc]                           dc.w $0000
[000bbdbe]                           dc.w $0000
[000bbdc0]                           dc.w $0000
[000bbdc2]                           dc.w $0000
[000bbdc4]                           dc.w $0000
[000bbdc6]                           dc.w $0000
A_3DBUTTON29:
[000bbdc8] 00064a22                  dc.l A_3Dbutton
[000bbdcc]                           dc.w $09f1
[000bbdce]                           dc.w $0178
[000bbdd0] 000630f2                  dc.l Auo_string
[000bbdd4] 000bba31                  dc.l TEXT_06
[000bbdd8]                           dc.w $0000
[000bbdda]                           dc.w $0000
[000bbddc]                           dc.w $0000
[000bbdde]                           dc.w $0000
[000bbde0]                           dc.w $0000
[000bbde2]                           dc.w $0000
[000bbde4]                           dc.w $0000
[000bbde6]                           dc.w $0000
A_3DBUTTON30:
[000bbde8] 00064a22                  dc.l A_3Dbutton
[000bbdec]                           dc.w $09f1
[000bbdee]                           dc.w $0178
[000bbdf0] 000630f2                  dc.l Auo_string
[000bbdf4] 000bb9b5                  dc.l PMT24
[000bbdf8]                           dc.w $0000
[000bbdfa]                           dc.w $0000
[000bbdfc]                           dc.w $0000
[000bbdfe]                           dc.w $0000
[000bbe00]                           dc.w $0000
[000bbe02]                           dc.w $0000
[000bbe04]                           dc.w $0000
[000bbe06]                           dc.w $0000
A_3DBUTTON31:
[000bbe08] 00064a22                  dc.l A_3Dbutton
[000bbe0c]                           dc.w $09f1
[000bbe0e]                           dc.w $0178
[000bbe10] 000630f2                  dc.l Auo_string
[000bbe14] 000bb9ca                  dc.l PMT25
[000bbe18]                           dc.w $0000
[000bbe1a]                           dc.w $0000
[000bbe1c]                           dc.w $0000
[000bbe1e]                           dc.w $0000
[000bbe20]                           dc.w $0000
[000bbe22]                           dc.w $0000
[000bbe24]                           dc.w $0000
[000bbe26]                           dc.w $0000
A_3DBUTTON32:
[000bbe28] 00064a22                  dc.l A_3Dbutton
[000bbe2c]                           dc.w $09f1
[000bbe2e]                           dc.w $0178
[000bbe30] 000630f2                  dc.l Auo_string
[000bbe34] 000bb9dc                  dc.l PMT26
[000bbe38]                           dc.w $0000
[000bbe3a]                           dc.w $0000
[000bbe3c]                           dc.w $0000
[000bbe3e]                           dc.w $0000
[000bbe40]                           dc.w $0000
[000bbe42]                           dc.w $0000
[000bbe44]                           dc.w $0000
[000bbe46]                           dc.w $0000
A_3DBUTTON33:
[000bbe48] 00064a22                  dc.l A_3Dbutton
[000bbe4c]                           dc.w $6900
[000bbe4e]                           dc.w $0178
[000bbe50] 000630f2                  dc.l Auo_string
[000bbe54] 000bbac3                  dc.l TEXT_20
[000bbe58]                           dc.w $0000
[000bbe5a]                           dc.w $0000
[000bbe5c]                           dc.w $0000
[000bbe5e]                           dc.w $0000
[000bbe60]                           dc.w $0000
[000bbe62]                           dc.w $0000
[000bbe64]                           dc.w $0000
[000bbe66]                           dc.w $0000
A_3DBUTTON34:
[000bbe68] 00064a22                  dc.l A_3Dbutton
[000bbe6c]                           dc.w $09f1
[000bbe6e]                           dc.w $0178
[000bbe70] 000630f2                  dc.l Auo_string
[000bbe74] 000bb9a8                  dc.l PMT23
[000bbe78]                           dc.w $0000
[000bbe7a]                           dc.w $0000
[000bbe7c]                           dc.w $0000
[000bbe7e]                           dc.w $0000
[000bbe80]                           dc.w $0000
[000bbe82]                           dc.w $0000
[000bbe84]                           dc.w $0000
[000bbe86]                           dc.w $0000
A_3DBUTTON35:
[000bbe88] 00064a22                  dc.l A_3Dbutton
[000bbe8c]                           dc.w $09f1
[000bbe8e]                           dc.w $0178
[000bbe90] 000630f2                  dc.l Auo_string
[000bbe94] 000bb84e                  dc.l PMT01
[000bbe98]                           dc.w $0000
[000bbe9a]                           dc.w $0000
[000bbe9c]                           dc.w $0000
[000bbe9e]                           dc.w $0000
[000bbea0]                           dc.w $0000
[000bbea2]                           dc.w $0000
[000bbea4]                           dc.w $0000
[000bbea6]                           dc.w $0000
A_3DBUTTON36:
[000bbea8] 00064a22                  dc.l A_3Dbutton
[000bbeac]                           dc.w $09f1
[000bbeae]                           dc.w $0178
[000bbeb0] 000630f2                  dc.l Auo_string
[000bbeb4] 000bb88d                  dc.l PMT05
[000bbeb8]                           dc.w $0000
[000bbeba]                           dc.w $0000
[000bbebc]                           dc.w $0000
[000bbebe]                           dc.w $0000
[000bbec0]                           dc.w $0000
[000bbec2]                           dc.w $0000
[000bbec4]                           dc.w $0000
[000bbec6]                           dc.w $0000
A_3DBUTTON37:
[000bbec8] 00064a22                  dc.l A_3Dbutton
[000bbecc]                           dc.w $09f1
[000bbece]                           dc.w $0178
[000bbed0] 000630f2                  dc.l Auo_string
[000bbed4] 000bb898                  dc.l PMT06
[000bbed8]                           dc.w $0000
[000bbeda]                           dc.w $0000
[000bbedc]                           dc.w $0000
[000bbede]                           dc.w $0000
[000bbee0]                           dc.w $0000
[000bbee2]                           dc.w $0000
[000bbee4]                           dc.w $0000
[000bbee6]                           dc.w $0000
A_3DBUTTON38:
[000bbee8] 00064a22                  dc.l A_3Dbutton
[000bbeec]                           dc.w $09f1
[000bbeee]                           dc.w $0178
[000bbef0] 000630f2                  dc.l Auo_string
[000bbef4] 000bb87a                  dc.l PMT04
[000bbef8]                           dc.w $0000
[000bbefa]                           dc.w $0000
[000bbefc]                           dc.w $0000
[000bbefe]                           dc.w $0000
[000bbf00]                           dc.w $0000
[000bbf02]                           dc.w $0000
[000bbf04]                           dc.w $0000
[000bbf06]                           dc.w $0000
A_3DBUTTON39:
[000bbf08] 00064a22                  dc.l A_3Dbutton
[000bbf0c]                           dc.w $09f1
[000bbf0e]                           dc.w $0178
[000bbf10] 000630f2                  dc.l Auo_string
[000bbf14] 000bb8f3                  dc.l PMT12
[000bbf18]                           dc.w $0000
[000bbf1a]                           dc.w $0000
[000bbf1c]                           dc.w $0000
[000bbf1e]                           dc.w $0000
[000bbf20]                           dc.w $0000
[000bbf22]                           dc.w $0000
[000bbf24]                           dc.w $0000
[000bbf26]                           dc.w $0000
A_3DBUTTON40:
[000bbf28] 00064a22                  dc.l A_3Dbutton
[000bbf2c]                           dc.w $09f1
[000bbf2e]                           dc.w $0178
[000bbf30] 000630f2                  dc.l Auo_string
[000bbf34] 000bb8ff                  dc.l PMT13
[000bbf38]                           dc.w $0000
[000bbf3a]                           dc.w $0000
[000bbf3c]                           dc.w $0000
[000bbf3e]                           dc.w $0000
[000bbf40]                           dc.w $0000
[000bbf42]                           dc.w $0000
[000bbf44]                           dc.w $0000
[000bbf46]                           dc.w $0000
A_3DBUTTON41:
[000bbf48] 00064a22                  dc.l A_3Dbutton
[000bbf4c]                           dc.w $09f1
[000bbf4e]                           dc.w $0178
[000bbf50] 000630f2                  dc.l Auo_string
[000bbf54] 000bb910                  dc.l PMT14
[000bbf58]                           dc.w $0000
[000bbf5a]                           dc.w $0000
[000bbf5c]                           dc.w $0000
[000bbf5e]                           dc.w $0000
[000bbf60]                           dc.w $0000
[000bbf62]                           dc.w $0000
[000bbf64]                           dc.w $0000
[000bbf66]                           dc.w $0000
A_3DBUTTON42:
[000bbf68] 00064a22                  dc.l A_3Dbutton
[000bbf6c]                           dc.w $09f1
[000bbf6e]                           dc.w $0178
[000bbf70] 000630f2                  dc.l Auo_string
[000bbf74] 000bb91e                  dc.l PMT15
[000bbf78]                           dc.w $0000
[000bbf7a]                           dc.w $0000
[000bbf7c]                           dc.w $0000
[000bbf7e]                           dc.w $0000
[000bbf80]                           dc.w $0000
[000bbf82]                           dc.w $0000
[000bbf84]                           dc.w $0000
[000bbf86]                           dc.w $0000
A_3DBUTTON43:
[000bbf88] 00064a22                  dc.l A_3Dbutton
[000bbf8c]                           dc.w $09f1
[000bbf8e]                           dc.w $0178
[000bbf90] 000630f2                  dc.l Auo_string
[000bbf94] 000bb931                  dc.l PMT16
[000bbf98]                           dc.w $0000
[000bbf9a]                           dc.w $0000
[000bbf9c]                           dc.w $0000
[000bbf9e]                           dc.w $0000
[000bbfa0]                           dc.w $0000
[000bbfa2]                           dc.w $0000
[000bbfa4]                           dc.w $0000
[000bbfa6]                           dc.w $0000
A_3DBUTTON44:
[000bbfa8] 00064a22                  dc.l A_3Dbutton
[000bbfac]                           dc.w $09f1
[000bbfae]                           dc.w $0178
[000bbfb0] 000630f2                  dc.l Auo_string
[000bbfb4] 000bb943                  dc.l PMT17
[000bbfb8]                           dc.w $0000
[000bbfba]                           dc.w $0000
[000bbfbc]                           dc.w $0000
[000bbfbe]                           dc.w $0000
[000bbfc0]                           dc.w $0000
[000bbfc2]                           dc.w $0000
[000bbfc4]                           dc.w $0000
[000bbfc6]                           dc.w $0000
A_3DBUTTON45:
[000bbfc8] 00064a22                  dc.l A_3Dbutton
[000bbfcc]                           dc.w $09f1
[000bbfce]                           dc.w $0178
[000bbfd0] 000630f2                  dc.l Auo_string
[000bbfd4] 000bb95a                  dc.l PMT18
[000bbfd8]                           dc.w $0000
[000bbfda]                           dc.w $0000
[000bbfdc]                           dc.w $0000
[000bbfde]                           dc.w $0000
[000bbfe0]                           dc.w $0000
[000bbfe2]                           dc.w $0000
[000bbfe4]                           dc.w $0000
[000bbfe6]                           dc.w $0000
A_3DBUTTON46:
[000bbfe8] 00064a22                  dc.l A_3Dbutton
[000bbfec]                           dc.w $09f1
[000bbfee]                           dc.w $0178
[000bbff0] 000630f2                  dc.l Auo_string
[000bbff4] 000bb96b                  dc.l PMT19
[000bbff8]                           dc.w $0000
[000bbffa]                           dc.w $0000
[000bbffc]                           dc.w $0000
[000bbffe]                           dc.w $0000
[000bc000]                           dc.w $0000
[000bc002]                           dc.w $0000
[000bc004]                           dc.w $0000
[000bc006]                           dc.w $0000
A_ARROWS02:
[000bc008] 00065c72                  dc.l A_arrows
[000bc00c]                           dc.w $1301
[000bc00e]                           dc.w $0001
[000bc010]                           dc.w $0000
[000bc012]                           dc.w $0000
[000bc014]                           dc.w $0000
[000bc016]                           dc.w $0000
[000bc018]                           dc.w $0000
[000bc01a]                           dc.w $0000
[000bc01c]                           dc.w $0000
[000bc01e]                           dc.w $0000
[000bc020]                           dc.w $0000
[000bc022]                           dc.w $0000
[000bc024]                           dc.w $0000
[000bc026]                           dc.w $0000
A_BOXED01:
[000bc028] 0006afea                  dc.l A_boxed
[000bc02c]                           dc.w $9000
[000bc02e]                           dc.w $ff12
[000bc030] 0006a068                  dc.l Auo_boxed
[000bc034]                           dc.w $0000
[000bc036]                           dc.w $0000
[000bc038]                           dc.w $0000
[000bc03a]                           dc.w $0000
[000bc03c]                           dc.w $0000
[000bc03e]                           dc.w $0000
[000bc040]                           dc.w $0000
[000bc042]                           dc.w $0000
[000bc044]                           dc.w $0000
[000bc046]                           dc.w $0000
A_BOXED02:
[000bc048] 0006afea                  dc.l A_boxed
[000bc04c]                           dc.w $9038
[000bc04e]                           dc.w $ff12
[000bc050] 0006a068                  dc.l Auo_boxed
[000bc054]                           dc.w $0000
[000bc056]                           dc.w $0000
[000bc058]                           dc.w $0000
[000bc05a]                           dc.w $0000
[000bc05c]                           dc.w $0000
[000bc05e]                           dc.w $0000
[000bc060]                           dc.w $0000
[000bc062]                           dc.w $0000
[000bc064]                           dc.w $0000
[000bc066]                           dc.w $0000
A_BOXED03:
[000bc068] 0006afea                  dc.l A_boxed
[000bc06c]                           dc.w $9070
[000bc06e]                           dc.w $0512
[000bc070] 0006a068                  dc.l Auo_boxed
[000bc074]                           dc.w $0000
[000bc076]                           dc.w $0000
[000bc078]                           dc.w $0000
[000bc07a]                           dc.w $0000
[000bc07c]                           dc.w $0000
[000bc07e]                           dc.w $0000
[000bc080]                           dc.w $0000
[000bc082]                           dc.w $0000
[000bc084]                           dc.w $0000
[000bc086]                           dc.w $0000
A_BOXED04:
[000bc088] 0006afea                  dc.l A_boxed
[000bc08c]                           dc.w $9038
[000bc08e]                           dc.w $ff12
[000bc090] 0006a068                  dc.l Auo_boxed
[000bc094]                           dc.w $0000
[000bc096]                           dc.w $0000
[000bc098]                           dc.w $0000
[000bc09a]                           dc.w $0000
[000bc09c]                           dc.w $0000
[000bc09e]                           dc.w $0000
[000bc0a0] 000bb769                  dc.l BUBBLE_03
[000bc0a4]                           dc.w $0000
[000bc0a6]                           dc.w $0000
A_BOXED05:
[000bc0a8] 0006afea                  dc.l A_boxed
[000bc0ac]                           dc.w $9038
[000bc0ae]                           dc.w $ff12
[000bc0b0] 0006a068                  dc.l Auo_boxed
[000bc0b4]                           dc.w $0000
[000bc0b6]                           dc.w $0000
[000bc0b8]                           dc.w $0000
[000bc0ba]                           dc.w $0000
[000bc0bc]                           dc.w $0000
[000bc0be]                           dc.w $0000
[000bc0c0] 000bb7bb                  dc.l BUBBLE_04
[000bc0c4]                           dc.w $0000
[000bc0c6]                           dc.w $0000
A_CHECKBOX01:
[000bc0c8] 0006323e                  dc.l A_checkbox
[000bc0cc]                           dc.w $0000
[000bc0ce]                           dc.w $0001
[000bc0d0] 000630f2                  dc.l Auo_string
[000bc0d4] 000bba0c                  dc.l TEXT_01
[000bc0d8]                           dc.w $0000
[000bc0da]                           dc.w $0000
[000bc0dc]                           dc.w $0000
[000bc0de]                           dc.w $0000
[000bc0e0]                           dc.w $0000
[000bc0e2]                           dc.w $0000
[000bc0e4]                           dc.w $0000
[000bc0e6]                           dc.w $0000
A_CHECKBOX02:
[000bc0e8] 0006323e                  dc.l A_checkbox
[000bc0ec]                           dc.w $0000
[000bc0ee]                           dc.w $0001
[000bc0f0] 000630f2                  dc.l Auo_string
[000bc0f4] 000bba47                  dc.l TEXT_07
[000bc0f8]                           dc.w $0000
[000bc0fa]                           dc.w $0000
[000bc0fc]                           dc.w $0000
[000bc0fe]                           dc.w $0000
[000bc100]                           dc.w $0000
[000bc102]                           dc.w $0000
[000bc104]                           dc.w $0000
[000bc106]                           dc.w $0000
A_CHECKBOX03:
[000bc108] 0006323e                  dc.l A_checkbox
[000bc10c]                           dc.w $0000
[000bc10e]                           dc.w $0001
[000bc110] 000630f2                  dc.l Auo_string
[000bc114] 000bba15                  dc.l TEXT_02
[000bc118]                           dc.w $0000
[000bc11a]                           dc.w $0000
[000bc11c]                           dc.w $0000
[000bc11e]                           dc.w $0000
[000bc120]                           dc.w $0000
[000bc122]                           dc.w $0000
[000bc124]                           dc.w $0000
[000bc126]                           dc.w $0000
A_INNERFRAME01:
[000bc128] 00064256                  dc.l A_innerframe
[000bc12c]                           dc.w $1800
[000bc12e]                           dc.w $8f19
[000bc130] 000630f2                  dc.l Auo_string
[000bc134] 000bba6c                  dc.l TEXT_10
[000bc138]                           dc.w $0000
[000bc13a]                           dc.w $0000
[000bc13c]                           dc.w $0000
[000bc13e]                           dc.w $0000
[000bc140]                           dc.w $0000
[000bc142]                           dc.w $0000
[000bc144]                           dc.w $0000
[000bc146]                           dc.w $0000
A_INNERFRAME02:
[000bc148] 00064256                  dc.l A_innerframe
[000bc14c]                           dc.w $1800
[000bc14e]                           dc.w $8f19
[000bc150] 000630f2                  dc.l Auo_string
[000bc154] 000bba99                  dc.l TEXT_14
[000bc158]                           dc.w $0000
[000bc15a]                           dc.w $0000
[000bc15c]                           dc.w $0000
[000bc15e]                           dc.w $0000
[000bc160]                           dc.w $0000
[000bc162]                           dc.w $0000
[000bc164]                           dc.w $0000
[000bc166]                           dc.w $0000
A_INNERFRAME03:
[000bc168] 00064256                  dc.l A_innerframe
[000bc16c]                           dc.w $1800
[000bc16e]                           dc.w $8f19
[000bc170] 000630f2                  dc.l Auo_string
[000bc174] 000bba27                  dc.l TEXT_05
[000bc178]                           dc.w $0000
[000bc17a]                           dc.w $0000
[000bc17c]                           dc.w $0000
[000bc17e]                           dc.w $0000
[000bc180]                           dc.w $0000
[000bc182]                           dc.w $0000
[000bc184]                           dc.w $0000
[000bc186]                           dc.w $0000
A_INNERFRAME04:
[000bc188] 00064256                  dc.l A_innerframe
[000bc18c]                           dc.w $1800
[000bc18e]                           dc.w $8f19
[000bc190] 000630f2                  dc.l Auo_string
[000bc194] 000bbab4                  dc.l TEXT_18
[000bc198]                           dc.w $0000
[000bc19a]                           dc.w $0000
[000bc19c]                           dc.w $0000
[000bc19e]                           dc.w $0000
[000bc1a0]                           dc.w $0000
[000bc1a2]                           dc.w $0000
[000bc1a4]                           dc.w $0000
[000bc1a6]                           dc.w $0000
POP_MASKSEL:
[000bc1a8]                           dc.w $ffff
[000bc1aa]                           dc.w $0001
[000bc1ac]                           dc.w $0039
[000bc1ae]                           dc.w $0014
[000bc1b0]                           dc.w $0000
[000bc1b2]                           dc.w $0020
[000bc1b4]                           dc.w $00ff
[000bc1b6]                           dc.w $1100
[000bc1b8]                           dc.w $0000
[000bc1ba]                           dc.w $0000
[000bc1bc]                           dc.w $0016
[000bc1be]                           dc.w $0009
_01_POP_MASKSEL:
[000bc1c0]                           dc.w $0003
[000bc1c2]                           dc.w $ffff
[000bc1c4]                           dc.w $ffff
[000bc1c6]                           dc.w $0018
[000bc1c8]                           dc.w $0001
[000bc1ca]                           dc.w $0000
[000bc1cc] 000bbb68                  dc.l A_3DBUTTON02
[000bc1d0]                           dc.w $0000
[000bc1d2]                           dc.w $0000
[000bc1d4]                           dc.w $0016
[000bc1d6]                           dc.w $0001
_01aPOP_MASKSEL:
[000bc1d8]                           dc.w $0000
[000bc1da]                           dc.w $0000
[000bc1dc]                           dc.w $0000
[000bc1de]                           dc.w $0000
[000bc1e0]                           dc.w $8000
[000bc1e2]                           dc.w $0000
[000bc1e4]                           dc.w $0000
[000bc1e6]                           dc.w $0000
[000bc1e8]                           dc.w $0000
[000bc1ea]                           dc.w $0000
[000bc1ec]                           dc.w $0000
[000bc1ee]                           dc.w $0000
_03_POP_MASKSEL:
[000bc1f0]                           dc.w $0005
[000bc1f2]                           dc.w $ffff
[000bc1f4]                           dc.w $ffff
[000bc1f6]                           dc.w $0018
[000bc1f8]                           dc.w $0001
[000bc1fa]                           dc.w $0000
[000bc1fc] 000bbc88                  dc.l A_3DBUTTON11
[000bc200]                           dc.w $0000
[000bc202]                           dc.w $0001
[000bc204]                           dc.w $0016
[000bc206]                           dc.w $0001
_03aPOP_MASKSEL:
[000bc208]                           dc.w $0000
[000bc20a]                           dc.w $0000
[000bc20c]                           dc.w $0000
[000bc20e]                           dc.w $0000
[000bc210]                           dc.w $8000
[000bc212]                           dc.w $0000
[000bc214]                           dc.w $0000
[000bc216]                           dc.w $0007
[000bc218]                           dc.w $0000
[000bc21a]                           dc.w $0000
[000bc21c]                           dc.w $0000
[000bc21e]                           dc.w $0000
_05_POP_MASKSEL:
[000bc220]                           dc.w $0007
[000bc222]                           dc.w $ffff
[000bc224]                           dc.w $ffff
[000bc226]                           dc.w $0018
[000bc228]                           dc.w $0001
[000bc22a]                           dc.w $0000
[000bc22c] 000bbcc8                  dc.l A_3DBUTTON13
[000bc230]                           dc.w $0000
[000bc232]                           dc.w $0002
[000bc234]                           dc.w $0016
[000bc236]                           dc.w $0001
_05aPOP_MASKSEL:
[000bc238]                           dc.w $0000
[000bc23a]                           dc.w $0000
[000bc23c]                           dc.w $0000
[000bc23e]                           dc.w $0000
[000bc240]                           dc.w $8000
[000bc242]                           dc.w $0000
[000bc244]                           dc.w $0000
[000bc246]                           dc.w $0008
[000bc248]                           dc.w $0000
[000bc24a]                           dc.w $0000
[000bc24c]                           dc.w $0000
[000bc24e]                           dc.w $0000
_07_POP_MASKSEL:
[000bc250]                           dc.w $0009
[000bc252]                           dc.w $ffff
[000bc254]                           dc.w $ffff
[000bc256]                           dc.w $0018
[000bc258]                           dc.w $0001
[000bc25a]                           dc.w $0000
[000bc25c] 000bbce8                  dc.l A_3DBUTTON14
[000bc260]                           dc.w $0000
[000bc262]                           dc.w $0003
[000bc264]                           dc.w $0016
[000bc266]                           dc.w $0001
_07aPOP_MASKSEL:
[000bc268]                           dc.w $0000
[000bc26a]                           dc.w $0000
[000bc26c]                           dc.w $0000
[000bc26e]                           dc.w $0000
[000bc270]                           dc.w $8000
[000bc272]                           dc.w $0000
[000bc274]                           dc.w $0000
[000bc276]                           dc.w $0009
[000bc278]                           dc.w $0000
[000bc27a]                           dc.w $0000
[000bc27c]                           dc.w $0000
[000bc27e]                           dc.w $0000
_09_POP_MASKSEL:
[000bc280]                           dc.w $0011
[000bc282]                           dc.w $000a
[000bc284]                           dc.w $000a
[000bc286]                           dc.w $0018
[000bc288]                           dc.w $0001
[000bc28a]                           dc.w $0000
[000bc28c] 000bbbc8                  dc.l A_3DBUTTON05
[000bc290]                           dc.w $0000
[000bc292]                           dc.w $0004
[000bc294]                           dc.w $0016
[000bc296]                           dc.w $0001
_10_POP_MASKSEL:
[000bc298]                           dc.w $0009
[000bc29a]                           dc.w $000b
[000bc29c]                           dc.w $000f
[000bc29e]                           dc.w $0014
[000bc2a0]                           dc.w $0080
[000bc2a2]                           dc.w $0020
[000bc2a4]                           dc.w $00ff
[000bc2a6]                           dc.w $1101
[000bc2a8]                           dc.w $0000
[000bc2aa]                           dc.w $0000
[000bc2ac]                           dc.w $0012
[000bc2ae]                           dc.w $0003
_11_POP_MASKSEL:
[000bc2b0]                           dc.w $000d
[000bc2b2]                           dc.w $ffff
[000bc2b4]                           dc.w $ffff
[000bc2b6]                           dc.w $0018
[000bc2b8]                           dc.w $0001
[000bc2ba]                           dc.w $0000
[000bc2bc] 000bbe88                  dc.l A_3DBUTTON35
[000bc2c0]                           dc.w $0000
[000bc2c2]                           dc.w $0000
[000bc2c4]                           dc.w $0012
[000bc2c6]                           dc.w $0001
_11aPOP_MASKSEL:
[000bc2c8]                           dc.w $0000
[000bc2ca]                           dc.w $0000
[000bc2cc]                           dc.w $0000
[000bc2ce]                           dc.w $0000
[000bc2d0]                           dc.w $8000
[000bc2d2]                           dc.w $0000
[000bc2d4]                           dc.w $0000
[000bc2d6]                           dc.w $0001
[000bc2d8]                           dc.w $0000
[000bc2da]                           dc.w $0000
[000bc2dc]                           dc.w $0000
[000bc2de]                           dc.w $0000
_13_POP_MASKSEL:
[000bc2e0]                           dc.w $000f
[000bc2e2]                           dc.w $ffff
[000bc2e4]                           dc.w $ffff
[000bc2e6]                           dc.w $0018
[000bc2e8]                           dc.w $0001
[000bc2ea]                           dc.w $0000
[000bc2ec] 000bbea8                  dc.l A_3DBUTTON36
[000bc2f0]                           dc.w $0000
[000bc2f2]                           dc.w $0001
[000bc2f4]                           dc.w $0012
[000bc2f6]                           dc.w $0001
_13aPOP_MASKSEL:
[000bc2f8]                           dc.w $0000
[000bc2fa]                           dc.w $0000
[000bc2fc]                           dc.w $0000
[000bc2fe]                           dc.w $0000
[000bc300]                           dc.w $8000
[000bc302]                           dc.w $0000
[000bc304]                           dc.w $0000
[000bc306]                           dc.w $0005
[000bc308]                           dc.w $0000
[000bc30a]                           dc.w $0000
[000bc30c]                           dc.w $0000
[000bc30e]                           dc.w $0000
_15_POP_MASKSEL:
[000bc310]                           dc.w $000a
[000bc312]                           dc.w $ffff
[000bc314]                           dc.w $ffff
[000bc316]                           dc.w $0018
[000bc318]                           dc.w $0001
[000bc31a]                           dc.w $0000
[000bc31c] 000bbec8                  dc.l A_3DBUTTON37
[000bc320]                           dc.w $0000
[000bc322]                           dc.w $0002
[000bc324]                           dc.w $0012
[000bc326]                           dc.w $0001
_15aPOP_MASKSEL:
[000bc328]                           dc.w $0000
[000bc32a]                           dc.w $0000
[000bc32c]                           dc.w $0000
[000bc32e]                           dc.w $0000
[000bc330]                           dc.w $8000
[000bc332]                           dc.w $0000
[000bc334]                           dc.w $0000
[000bc336]                           dc.w $0006
[000bc338]                           dc.w $0000
[000bc33a]                           dc.w $0000
[000bc33c]                           dc.w $0000
[000bc33e]                           dc.w $0000
_17_POP_MASKSEL:
[000bc340]                           dc.w $0019
[000bc342]                           dc.w $0012
[000bc344]                           dc.w $0012
[000bc346]                           dc.w $0018
[000bc348]                           dc.w $0001
[000bc34a]                           dc.w $0000
[000bc34c] 000bbb48                  dc.l A_3DBUTTON01
[000bc350]                           dc.w $0000
[000bc352]                           dc.w $0005
[000bc354]                           dc.w $0016
[000bc356]                           dc.w $0001
_18_POP_MASKSEL:
[000bc358]                           dc.w $0011
[000bc35a]                           dc.w $0013
[000bc35c]                           dc.w $0017
[000bc35e]                           dc.w $0014
[000bc360]                           dc.w $0080
[000bc362]                           dc.w $0020
[000bc364]                           dc.w $00ff
[000bc366]                           dc.w $1101
[000bc368]                           dc.w $0000
[000bc36a]                           dc.w $0000
[000bc36c]                           dc.w $0013
[000bc36e]                           dc.w $0003
_19_POP_MASKSEL:
[000bc370]                           dc.w $0015
[000bc372]                           dc.w $ffff
[000bc374]                           dc.w $ffff
[000bc376]                           dc.w $0018
[000bc378]                           dc.w $0001
[000bc37a]                           dc.w $0000
[000bc37c] 000bbc28                  dc.l A_3DBUTTON08
[000bc380]                           dc.w $0000
[000bc382]                           dc.w $0000
[000bc384]                           dc.w $0013
[000bc386]                           dc.w $0001
_19aPOP_MASKSEL:
[000bc388]                           dc.w $0000
[000bc38a]                           dc.w $0000
[000bc38c]                           dc.w $0000
[000bc38e]                           dc.w $0000
[000bc390]                           dc.w $8000
[000bc392]                           dc.w $0000
[000bc394]                           dc.w $0000
[000bc396]                           dc.w $0002
[000bc398]                           dc.w $0000
[000bc39a]                           dc.w $0000
[000bc39c]                           dc.w $0000
[000bc39e]                           dc.w $0000
_21_POP_MASKSEL:
[000bc3a0]                           dc.w $0017
[000bc3a2]                           dc.w $ffff
[000bc3a4]                           dc.w $ffff
[000bc3a6]                           dc.w $0018
[000bc3a8]                           dc.w $0001
[000bc3aa]                           dc.w $0000
[000bc3ac] 000bbc68                  dc.l A_3DBUTTON10
[000bc3b0]                           dc.w $0000
[000bc3b2]                           dc.w $0001
[000bc3b4]                           dc.w $0013
[000bc3b6]                           dc.w $0001
_21aPOP_MASKSEL:
[000bc3b8]                           dc.w $0000
[000bc3ba]                           dc.w $0000
[000bc3bc]                           dc.w $0000
[000bc3be]                           dc.w $0000
[000bc3c0]                           dc.w $8000
[000bc3c2]                           dc.w $0000
[000bc3c4]                           dc.w $0000
[000bc3c6]                           dc.w $0003
[000bc3c8]                           dc.w $0000
[000bc3ca]                           dc.w $0000
[000bc3cc]                           dc.w $0000
[000bc3ce]                           dc.w $0000
_23_POP_MASKSEL:
[000bc3d0]                           dc.w $0012
[000bc3d2]                           dc.w $ffff
[000bc3d4]                           dc.w $ffff
[000bc3d6]                           dc.w $0018
[000bc3d8]                           dc.w $0001
[000bc3da]                           dc.w $0000
[000bc3dc] 000bbee8                  dc.l A_3DBUTTON38
[000bc3e0]                           dc.w $0000
[000bc3e2]                           dc.w $0002
[000bc3e4]                           dc.w $0013
[000bc3e6]                           dc.w $0001
_23aPOP_MASKSEL:
[000bc3e8]                           dc.w $0000
[000bc3ea]                           dc.w $0000
[000bc3ec]                           dc.w $0000
[000bc3ee]                           dc.w $0000
[000bc3f0]                           dc.w $8000
[000bc3f2]                           dc.w $0000
[000bc3f4]                           dc.w $0000
[000bc3f6]                           dc.w $0004
[000bc3f8]                           dc.w $0000
[000bc3fa]                           dc.w $0000
[000bc3fc]                           dc.w $0000
[000bc3fe]                           dc.w $0000
_25_POP_MASKSEL:
[000bc400]                           dc.w $002f
[000bc402]                           dc.w $001a
[000bc404]                           dc.w $001a
[000bc406]                           dc.w $0018
[000bc408]                           dc.w $0001
[000bc40a]                           dc.w $0000
[000bc40c] 000bbb88                  dc.l A_3DBUTTON03
[000bc410]                           dc.w $0000
[000bc412]                           dc.w $0006
[000bc414]                           dc.w $0016
[000bc416]                           dc.w $0001
_26_POP_MASKSEL:
[000bc418]                           dc.w $0019
[000bc41a]                           dc.w $001b
[000bc41c]                           dc.w $002d
[000bc41e]                           dc.w $0014
[000bc420]                           dc.w $0080
[000bc422]                           dc.w $0020
[000bc424]                           dc.w $00ff
[000bc426]                           dc.w $1101
[000bc428]                           dc.w $0000
[000bc42a]                           dc.w $0000
[000bc42c]                           dc.w $0017
[000bc42e]                           dc.w $000a
_27_POP_MASKSEL:
[000bc430]                           dc.w $001d
[000bc432]                           dc.w $ffff
[000bc434]                           dc.w $ffff
[000bc436]                           dc.w $0018
[000bc438]                           dc.w $0001
[000bc43a]                           dc.w $0000
[000bc43c] 000bbca8                  dc.l A_3DBUTTON12
[000bc440]                           dc.w $0000
[000bc442]                           dc.w $0000
[000bc444]                           dc.w $0017
[000bc446]                           dc.w $0001
_27aPOP_MASKSEL:
[000bc448]                           dc.w $0000
[000bc44a]                           dc.w $0000
[000bc44c]                           dc.w $0000
[000bc44e]                           dc.w $0000
[000bc450]                           dc.w $8000
[000bc452]                           dc.w $0000
[000bc454]                           dc.w $0000
[000bc456]                           dc.w $000a
[000bc458]                           dc.w $0000
[000bc45a]                           dc.w $0000
[000bc45c]                           dc.w $0000
[000bc45e]                           dc.w $0000
_29_POP_MASKSEL:
[000bc460]                           dc.w $001f
[000bc462]                           dc.w $ffff
[000bc464]                           dc.w $ffff
[000bc466]                           dc.w $0018
[000bc468]                           dc.w $0001
[000bc46a]                           dc.w $0000
[000bc46c] 000bbd08                  dc.l A_3DBUTTON15
[000bc470]                           dc.w $0000
[000bc472]                           dc.w $0001
[000bc474]                           dc.w $0017
[000bc476]                           dc.w $0001
_29aPOP_MASKSEL:
[000bc478]                           dc.w $0000
[000bc47a]                           dc.w $0000
[000bc47c]                           dc.w $0000
[000bc47e]                           dc.w $0000
[000bc480]                           dc.w $8000
[000bc482]                           dc.w $0000
[000bc484]                           dc.w $0000
[000bc486]                           dc.w $000b
[000bc488]                           dc.w $0000
[000bc48a]                           dc.w $0000
[000bc48c]                           dc.w $0000
[000bc48e]                           dc.w $0000
_31_POP_MASKSEL:
[000bc490]                           dc.w $0021
[000bc492]                           dc.w $ffff
[000bc494]                           dc.w $ffff
[000bc496]                           dc.w $0018
[000bc498]                           dc.w $0001
[000bc49a]                           dc.w $0000
[000bc49c] 000bbf08                  dc.l A_3DBUTTON39
[000bc4a0]                           dc.w $0000
[000bc4a2]                           dc.w $0002
[000bc4a4]                           dc.w $0017
[000bc4a6]                           dc.w $0001
_31aPOP_MASKSEL:
[000bc4a8]                           dc.w $0000
[000bc4aa]                           dc.w $0000
[000bc4ac]                           dc.w $0000
[000bc4ae]                           dc.w $0000
[000bc4b0]                           dc.w $8000
[000bc4b2]                           dc.w $0000
[000bc4b4]                           dc.w $0000
[000bc4b6]                           dc.w $000c
[000bc4b8]                           dc.w $0000
[000bc4ba]                           dc.w $0000
[000bc4bc]                           dc.w $0000
[000bc4be]                           dc.w $0000
_33_POP_MASKSEL:
[000bc4c0]                           dc.w $0023
[000bc4c2]                           dc.w $ffff
[000bc4c4]                           dc.w $ffff
[000bc4c6]                           dc.w $0018
[000bc4c8]                           dc.w $0001
[000bc4ca]                           dc.w $0000
[000bc4cc] 000bbf28                  dc.l A_3DBUTTON40
[000bc4d0]                           dc.w $0000
[000bc4d2]                           dc.w $0003
[000bc4d4]                           dc.w $0017
[000bc4d6]                           dc.w $0001
_33aPOP_MASKSEL:
[000bc4d8]                           dc.w $0000
[000bc4da]                           dc.w $0000
[000bc4dc]                           dc.w $0000
[000bc4de]                           dc.w $0000
[000bc4e0]                           dc.w $8000
[000bc4e2]                           dc.w $0000
[000bc4e4]                           dc.w $0000
[000bc4e6]                           dc.w $000d
[000bc4e8]                           dc.w $0000
[000bc4ea]                           dc.w $0000
[000bc4ec]                           dc.w $0000
[000bc4ee]                           dc.w $0000
_35_POP_MASKSEL:
[000bc4f0]                           dc.w $0025
[000bc4f2]                           dc.w $ffff
[000bc4f4]                           dc.w $ffff
[000bc4f6]                           dc.w $0018
[000bc4f8]                           dc.w $0001
[000bc4fa]                           dc.w $0000
[000bc4fc] 000bbf48                  dc.l A_3DBUTTON41
[000bc500]                           dc.w $0000
[000bc502]                           dc.w $0004
[000bc504]                           dc.w $0017
[000bc506]                           dc.w $0001
_35aPOP_MASKSEL:
[000bc508]                           dc.w $0000
[000bc50a]                           dc.w $0000
[000bc50c]                           dc.w $0000
[000bc50e]                           dc.w $0000
[000bc510]                           dc.w $8000
[000bc512]                           dc.w $0000
[000bc514]                           dc.w $0000
[000bc516]                           dc.w $000e
[000bc518]                           dc.w $0000
[000bc51a]                           dc.w $0000
[000bc51c]                           dc.w $0000
[000bc51e]                           dc.w $0000
_37_POP_MASKSEL:
[000bc520]                           dc.w $0027
[000bc522]                           dc.w $ffff
[000bc524]                           dc.w $ffff
[000bc526]                           dc.w $0018
[000bc528]                           dc.w $0001
[000bc52a]                           dc.w $0000
[000bc52c] 000bbf68                  dc.l A_3DBUTTON42
[000bc530]                           dc.w $0000
[000bc532]                           dc.w $0005
[000bc534]                           dc.w $0017
[000bc536]                           dc.w $0001
_37aPOP_MASKSEL:
[000bc538]                           dc.w $0000
[000bc53a]                           dc.w $0000
[000bc53c]                           dc.w $0000
[000bc53e]                           dc.w $0000
[000bc540]                           dc.w $8000
[000bc542]                           dc.w $0000
[000bc544]                           dc.w $0000
[000bc546]                           dc.w $000f
[000bc548]                           dc.w $0000
[000bc54a]                           dc.w $0000
[000bc54c]                           dc.w $0000
[000bc54e]                           dc.w $0000
_39_POP_MASKSEL:
[000bc550]                           dc.w $0029
[000bc552]                           dc.w $ffff
[000bc554]                           dc.w $ffff
[000bc556]                           dc.w $0018
[000bc558]                           dc.w $0001
[000bc55a]                           dc.w $0000
[000bc55c] 000bbf88                  dc.l A_3DBUTTON43
[000bc560]                           dc.w $0000
[000bc562]                           dc.w $0006
[000bc564]                           dc.w $0017
[000bc566]                           dc.w $0001
_39aPOP_MASKSEL:
[000bc568]                           dc.w $0000
[000bc56a]                           dc.w $0000
[000bc56c]                           dc.w $0000
[000bc56e]                           dc.w $0000
[000bc570]                           dc.w $8000
[000bc572]                           dc.w $0000
[000bc574]                           dc.w $0000
[000bc576]                           dc.w $0010
[000bc578]                           dc.w $0000
[000bc57a]                           dc.w $0000
[000bc57c]                           dc.w $0000
[000bc57e]                           dc.w $0000
_41_POP_MASKSEL:
[000bc580]                           dc.w $002b
[000bc582]                           dc.w $ffff
[000bc584]                           dc.w $ffff
[000bc586]                           dc.w $0018
[000bc588]                           dc.w $0001
[000bc58a]                           dc.w $0000
[000bc58c] 000bbfa8                  dc.l A_3DBUTTON44
[000bc590]                           dc.w $0000
[000bc592]                           dc.w $0007
[000bc594]                           dc.w $0017
[000bc596]                           dc.w $0001
_41aPOP_MASKSEL:
[000bc598]                           dc.w $0000
[000bc59a]                           dc.w $0000
[000bc59c]                           dc.w $0000
[000bc59e]                           dc.w $0000
[000bc5a0]                           dc.w $8000
[000bc5a2]                           dc.w $0000
[000bc5a4]                           dc.w $0000
[000bc5a6]                           dc.w $0011
[000bc5a8]                           dc.w $0000
[000bc5aa]                           dc.w $0000
[000bc5ac]                           dc.w $0000
[000bc5ae]                           dc.w $0000
_43_POP_MASKSEL:
[000bc5b0]                           dc.w $002d
[000bc5b2]                           dc.w $ffff
[000bc5b4]                           dc.w $ffff
[000bc5b6]                           dc.w $0018
[000bc5b8]                           dc.w $0001
[000bc5ba]                           dc.w $0000
[000bc5bc] 000bbfc8                  dc.l A_3DBUTTON45
[000bc5c0]                           dc.w $0000
[000bc5c2]                           dc.w $0008
[000bc5c4]                           dc.w $0017
[000bc5c6]                           dc.w $0001
_43aPOP_MASKSEL:
[000bc5c8]                           dc.w $0000
[000bc5ca]                           dc.w $0000
[000bc5cc]                           dc.w $0000
[000bc5ce]                           dc.w $0000
[000bc5d0]                           dc.w $8000
[000bc5d2]                           dc.w $0000
[000bc5d4]                           dc.w $0000
[000bc5d6]                           dc.w $0012
[000bc5d8]                           dc.w $0000
[000bc5da]                           dc.w $0000
[000bc5dc]                           dc.w $0000
[000bc5de]                           dc.w $0000
_45_POP_MASKSEL:
[000bc5e0]                           dc.w $001a
[000bc5e2]                           dc.w $ffff
[000bc5e4]                           dc.w $ffff
[000bc5e6]                           dc.w $0018
[000bc5e8]                           dc.w $0001
[000bc5ea]                           dc.w $0000
[000bc5ec] 000bbfe8                  dc.l A_3DBUTTON46
[000bc5f0]                           dc.w $0000
[000bc5f2]                           dc.w $0009
[000bc5f4]                           dc.w $0017
[000bc5f6]                           dc.w $0001
_45aPOP_MASKSEL:
[000bc5f8]                           dc.w $0000
[000bc5fa]                           dc.w $0000
[000bc5fc]                           dc.w $0000
[000bc5fe]                           dc.w $0000
[000bc600]                           dc.w $8000
[000bc602]                           dc.w $0000
[000bc604]                           dc.w $0000
[000bc606]                           dc.w $0013
[000bc608]                           dc.w $0000
[000bc60a]                           dc.w $0000
[000bc60c]                           dc.w $0000
[000bc60e]                           dc.w $0000
_47_POP_MASKSEL:
[000bc610]                           dc.w $0039
[000bc612]                           dc.w $0030
[000bc614]                           dc.w $0030
[000bc616]                           dc.w $0018
[000bc618]                           dc.w $0001
[000bc61a]                           dc.w $0000
[000bc61c] 000bbba8                  dc.l A_3DBUTTON04
[000bc620]                           dc.w $0000
[000bc622]                           dc.w $0007
[000bc624]                           dc.w $0016
[000bc626]                           dc.w $0001
_48_POP_MASKSEL:
[000bc628]                           dc.w $002f
[000bc62a]                           dc.w $0031
[000bc62c]                           dc.w $0037
[000bc62e]                           dc.w $0014
[000bc630]                           dc.w $0080
[000bc632]                           dc.w $0020
[000bc634]                           dc.w $00ff
[000bc636]                           dc.w $1101
[000bc638]                           dc.w $0000
[000bc63a]                           dc.w $0000
[000bc63c]                           dc.w $000e
[000bc63e]                           dc.w $0004
_49_POP_MASKSEL:
[000bc640]                           dc.w $0033
[000bc642]                           dc.w $ffff
[000bc644]                           dc.w $ffff
[000bc646]                           dc.w $0018
[000bc648]                           dc.w $0001
[000bc64a]                           dc.w $0000
[000bc64c] 000bbd48                  dc.l A_3DBUTTON25
[000bc650]                           dc.w $0000
[000bc652]                           dc.w $0000
[000bc654]                           dc.w $000e
[000bc656]                           dc.w $0001
_49aPOP_MASKSEL:
[000bc658]                           dc.w $0000
[000bc65a]                           dc.w $0000
[000bc65c]                           dc.w $0000
[000bc65e]                           dc.w $0000
[000bc660]                           dc.w $8000
[000bc662]                           dc.w $0000
[000bc664]                           dc.w $0000
[000bc666]                           dc.w $0014
[000bc668]                           dc.w $0000
[000bc66a]                           dc.w $0000
[000bc66c]                           dc.w $0000
[000bc66e]                           dc.w $0000
_51_POP_MASKSEL:
[000bc670]                           dc.w $0035
[000bc672]                           dc.w $ffff
[000bc674]                           dc.w $ffff
[000bc676]                           dc.w $0018
[000bc678]                           dc.w $0001
[000bc67a]                           dc.w $0000
[000bc67c] 000bbda8                  dc.l A_3DBUTTON28
[000bc680]                           dc.w $0000
[000bc682]                           dc.w $0001
[000bc684]                           dc.w $000e
[000bc686]                           dc.w $0001
_51aPOP_MASKSEL:
[000bc688]                           dc.w $0000
[000bc68a]                           dc.w $0000
[000bc68c]                           dc.w $0000
[000bc68e]                           dc.w $0000
[000bc690]                           dc.w $8000
[000bc692]                           dc.w $0000
[000bc694]                           dc.w $0000
[000bc696]                           dc.w $0015
[000bc698]                           dc.w $0000
[000bc69a]                           dc.w $0000
[000bc69c]                           dc.w $0000
[000bc69e]                           dc.w $0000
_53_POP_MASKSEL:
[000bc6a0]                           dc.w $0037
[000bc6a2]                           dc.w $ffff
[000bc6a4]                           dc.w $ffff
[000bc6a6]                           dc.w $0018
[000bc6a8]                           dc.w $0001
[000bc6aa]                           dc.w $0000
[000bc6ac] 000bbd68                  dc.l A_3DBUTTON26
[000bc6b0]                           dc.w $0000
[000bc6b2]                           dc.w $0002
[000bc6b4]                           dc.w $000e
[000bc6b6]                           dc.w $0001
_53aPOP_MASKSEL:
[000bc6b8]                           dc.w $0000
[000bc6ba]                           dc.w $0000
[000bc6bc]                           dc.w $0000
[000bc6be]                           dc.w $0000
[000bc6c0]                           dc.w $8000
[000bc6c2]                           dc.w $0000
[000bc6c4]                           dc.w $0000
[000bc6c6]                           dc.w $0016
[000bc6c8]                           dc.w $0000
[000bc6ca]                           dc.w $0000
[000bc6cc]                           dc.w $0000
[000bc6ce]                           dc.w $0000
_55_POP_MASKSEL:
[000bc6d0]                           dc.w $0030
[000bc6d2]                           dc.w $ffff
[000bc6d4]                           dc.w $ffff
[000bc6d6]                           dc.w $0018
[000bc6d8]                           dc.w $0001
[000bc6da]                           dc.w $0000
[000bc6dc] 000bbe68                  dc.l A_3DBUTTON34
[000bc6e0]                           dc.w $0000
[000bc6e2]                           dc.w $0003
[000bc6e4]                           dc.w $000e
[000bc6e6]                           dc.w $0001
_55aPOP_MASKSEL:
[000bc6e8]                           dc.w $0000
[000bc6ea]                           dc.w $0000
[000bc6ec]                           dc.w $0000
[000bc6ee]                           dc.w $0000
[000bc6f0]                           dc.w $8000
[000bc6f2]                           dc.w $0000
[000bc6f4]                           dc.w $0000
[000bc6f6]                           dc.w $0017
[000bc6f8]                           dc.w $0000
[000bc6fa]                           dc.w $0000
[000bc6fc]                           dc.w $0000
[000bc6fe]                           dc.w $0000
_57_POP_MASKSEL:
[000bc700]                           dc.w $0000
[000bc702]                           dc.w $003a
[000bc704]                           dc.w $003a
[000bc706]                           dc.w $0018
[000bc708]                           dc.w $0001
[000bc70a]                           dc.w $0000
[000bc70c] 000bbdc8                  dc.l A_3DBUTTON29
[000bc710]                           dc.w $0000
[000bc712]                           dc.w $0008
[000bc714]                           dc.w $0016
[000bc716]                           dc.w $0001
_58_POP_MASKSEL:
[000bc718]                           dc.w $0039
[000bc71a]                           dc.w $003b
[000bc71c]                           dc.w $0040
[000bc71e]                           dc.w $0014
[000bc720]                           dc.w $0080
[000bc722]                           dc.w $0020
[000bc724]                           dc.w $00ff
[000bc726]                           dc.w $1101
[000bc728]                           dc.w $0000
[000bc72a]                           dc.w $0000
[000bc72c]                           dc.w $0015
[000bc72e]                           dc.w $0004
_59_POP_MASKSEL:
[000bc730]                           dc.w $003c
[000bc732]                           dc.w $ffff
[000bc734]                           dc.w $ffff
[000bc736]                           dc.w $0018
[000bc738]                           dc.w $0000
[000bc73a]                           dc.w $0000
[000bc73c] 000bbe48                  dc.l A_3DBUTTON33
[000bc740]                           dc.w $0000
[000bc742]                           dc.w $0000
[000bc744]                           dc.w $0015
[000bc746]                           dc.w $0001
_60_POP_MASKSEL:
[000bc748]                           dc.w $003e
[000bc74a]                           dc.w $ffff
[000bc74c]                           dc.w $ffff
[000bc74e]                           dc.w $0018
[000bc750]                           dc.w $0001
[000bc752]                           dc.w $0000
[000bc754] 000bbde8                  dc.l A_3DBUTTON30
[000bc758]                           dc.w $0000
[000bc75a]                           dc.w $0001
[000bc75c]                           dc.w $0015
[000bc75e]                           dc.w $0001
_60aPOP_MASKSEL:
[000bc760]                           dc.w $0000
[000bc762]                           dc.w $0000
[000bc764]                           dc.w $0000
[000bc766]                           dc.w $0000
[000bc768]                           dc.w $8000
[000bc76a]                           dc.w $0000
[000bc76c]                           dc.w $0000
[000bc76e]                           dc.w $0018
[000bc770]                           dc.w $0000
[000bc772]                           dc.w $0000
[000bc774]                           dc.w $0000
[000bc776]                           dc.w $0000
_62_POP_MASKSEL:
[000bc778]                           dc.w $0040
[000bc77a]                           dc.w $ffff
[000bc77c]                           dc.w $ffff
[000bc77e]                           dc.w $0018
[000bc780]                           dc.w $0001
[000bc782]                           dc.w $0000
[000bc784] 000bbe08                  dc.l A_3DBUTTON31
[000bc788]                           dc.w $0000
[000bc78a]                           dc.w $0002
[000bc78c]                           dc.w $0015
[000bc78e]                           dc.w $0001
_62aPOP_MASKSEL:
[000bc790]                           dc.w $0000
[000bc792]                           dc.w $0000
[000bc794]                           dc.w $0000
[000bc796]                           dc.w $0000
[000bc798]                           dc.w $8000
[000bc79a]                           dc.w $0000
[000bc79c]                           dc.w $0000
[000bc79e]                           dc.w $0019
[000bc7a0]                           dc.w $0000
[000bc7a2]                           dc.w $0000
[000bc7a4]                           dc.w $0000
[000bc7a6]                           dc.w $0000
_64_POP_MASKSEL:
[000bc7a8]                           dc.w $003a
[000bc7aa]                           dc.w $ffff
[000bc7ac]                           dc.w $ffff
[000bc7ae]                           dc.w $0018
[000bc7b0]                           dc.w $0001
[000bc7b2]                           dc.w $0000
[000bc7b4] 000bbe28                  dc.l A_3DBUTTON32
[000bc7b8]                           dc.w $0000
[000bc7ba]                           dc.w $0003
[000bc7bc]                           dc.w $0015
[000bc7be]                           dc.w $0001
_64aPOP_MASKSEL:
[000bc7c0]                           dc.w $0000
[000bc7c2]                           dc.w $0000
[000bc7c4]                           dc.w $0000
[000bc7c6]                           dc.w $0000
[000bc7c8]                           dc.w $8020
[000bc7ca]                           dc.w $0000
[000bc7cc]                           dc.w $0000
[000bc7ce]                           dc.w $001a
[000bc7d0]                           dc.w $0000
[000bc7d2]                           dc.w $0000
[000bc7d4]                           dc.w $0000
[000bc7d6]                           dc.w $0000
ED_BOXED:
[000bc7d8]                           dc.w $ffff
[000bc7da]                           dc.w $0001
[000bc7dc]                           dc.w $0032
[000bc7de]                           dc.w $0018
[000bc7e0]                           dc.w $0000
[000bc7e2]                           dc.w $0010
[000bc7e4] 000bbbe8                  dc.l A_3DBUTTON06
[000bc7e8]                           dc.w $0000
[000bc7ea]                           dc.w $0000
[000bc7ec]                           dc.w $003c
[000bc7ee]                           dc.w $0014
_01_ED_BOXED:
[000bc7f0]                           dc.w $0003
[000bc7f2]                           dc.w $0002
[000bc7f4]                           dc.w $0002
[000bc7f6]                           dc.w $0018
[000bc7f8]                           dc.w $0040
[000bc7fa]                           dc.w $0010
[000bc7fc] 000bbc08                  dc.l A_3DBUTTON07
[000bc800]                           dc.w $0000
[000bc802]                           dc.w $0000
[000bc804]                           dc.w $0017
[000bc806]                           dc.w $0003
_02_ED_BOXED:
[000bc808]                           dc.w $0001
[000bc80a]                           dc.w $ffff
[000bc80c]                           dc.w $ffff
[000bc80e]                           dc.w $0018
[000bc810]                           dc.w $0000
[000bc812]                           dc.w $0010
[000bc814] 000bc048                  dc.l A_BOXED02
[000bc818]                           dc.w $0002
[000bc81a]                           dc.w $0001
[000bc81c]                           dc.w $0013
[000bc81e]                           dc.w $0001
_03_ED_BOXED:
[000bc820]                           dc.w $0005
[000bc822]                           dc.w $ffff
[000bc824]                           dc.w $ffff
[000bc826]                           dc.w $0018
[000bc828]                           dc.w $4007
[000bc82a]                           dc.w $0010
[000bc82c] 000bbd28                  dc.l A_3DBUTTON16
[000bc830]                           dc.w $0020
[000bc832]                           dc.w $0001
[000bc834]                           dc.w $000c
[000bc836]                           dc.w $0002
_03aED_BOXED:
[000bc838] 00026d94                  dc.l ok
[000bc83c]                           dc.w $0000
[000bc83e]                           dc.w $0000
[000bc840]                           dc.w $8000
[000bc842]                           dc.w $884f
[000bc844]                           dc.w $0000
[000bc846]                           dc.w $0000
[000bc848]                           dc.w $0000
[000bc84a]                           dc.w $0000
[000bc84c]                           dc.w $0000
[000bc84e]                           dc.w $0000
_05_ED_BOXED:
[000bc850]                           dc.w $0007
[000bc852]                           dc.w $ffff
[000bc854]                           dc.w $ffff
[000bc856]                           dc.w $0018
[000bc858]                           dc.w $4005
[000bc85a]                           dc.w $0010
[000bc85c] 000bbc48                  dc.l A_3DBUTTON09
[000bc860]                           dc.w $002e
[000bc862]                           dc.w $0001
[000bc864]                           dc.w $000c
[000bc866]                           dc.w $0002
_05aED_BOXED:
[000bc868] 00026d6e                  dc.l abort
[000bc86c]                           dc.w $0000
[000bc86e]                           dc.w $0000
[000bc870]                           dc.w $8000
[000bc872]                           dc.w $8841
[000bc874]                           dc.w $0000
[000bc876]                           dc.w $0000
[000bc878]                           dc.w $0000
[000bc87a]                           dc.w $0000
[000bc87c]                           dc.w $0000
[000bc87e]                           dc.w $0000
_07_ED_BOXED:
[000bc880]                           dc.w $0017
[000bc882]                           dc.w $0008
[000bc884]                           dc.w $0016
[000bc886]                           dc.w $0018
[000bc888]                           dc.w $0040
[000bc88a]                           dc.w $0000
[000bc88c] 000bc148                  dc.l A_INNERFRAME02
[000bc890]                           dc.w $0001
[000bc892]                           dc.w $0004
[000bc894]                           dc.w $003a
[000bc896]                           dc.w $0005
_08_ED_BOXED:
[000bc898]                           dc.w $000a
[000bc89a]                           dc.w $ffff
[000bc89c]                           dc.w $ffff
[000bc89e]                           dc.w $0018
[000bc8a0]                           dc.w $0048
[000bc8a2]                           dc.w $0010
[000bc8a4] 000bc028                  dc.l A_BOXED01
[000bc8a8]                           dc.w $0001
[000bc8aa]                           dc.w $0001
[000bc8ac]                           dc.w $0038
[000bc8ae]                           dc.w $0002
_08aED_BOXED:
[000bc8b0] 00069b4e                  dc.l Aus_boxed
[000bc8b4]                           dc.w $0000
[000bc8b6]                           dc.w $0000
[000bc8b8]                           dc.w $8000
[000bc8ba]                           dc.w $0000
[000bc8bc]                           dc.w $0000
[000bc8be]                           dc.w $0000
[000bc8c0]                           dc.w $0000
[000bc8c2]                           dc.w $0000
[000bc8c4]                           dc.w $0000
[000bc8c6]                           dc.w $0000
_10_ED_BOXED:
[000bc8c8]                           dc.w $000c
[000bc8ca]                           dc.w $000b
[000bc8cc]                           dc.w $000b
[000bc8ce]                           dc.w $001c
[000bc8d0]                           dc.w $0040
[000bc8d2]                           dc.w $0000
[000bc8d4] 000bba84                  dc.l TEXT_11
[000bc8d8]                           dc.w $0001
[000bc8da]                           dc.w $0003
[000bc8dc]                           dc.w $0006
[000bc8de]                           dc.w $0001
_11_ED_BOXED:
[000bc8e0]                           dc.w $000a
[000bc8e2]                           dc.w $ffff
[000bc8e4]                           dc.w $ffff
[000bc8e6]                           dc.w $0018
[000bc8e8]                           dc.w $0040
[000bc8ea]                           dc.w $0000
[000bc8ec] 000bc008                  dc.l A_ARROWS02
[000bc8f0]                           dc.w $0000
[000bc8f2]                           dc.w $0000
[000bc8f4]                           dc.w $0001
[000bc8f6]                           dc.w $0001
_12_ED_BOXED:
[000bc8f8]                           dc.w $0010
[000bc8fa]                           dc.w $000e
[000bc8fc]                           dc.w $000f
[000bc8fe]                           dc.w $0014
[000bc900]                           dc.w $0040
[000bc902]                           dc.w $0020
[000bc904]                           dc.w $00ff
[000bc906]                           dc.w $1101
[000bc908]                           dc.w $0008
[000bc90a]                           dc.w $0003
[000bc90c]                           dc.w $0012
[000bc90e]                           dc.w $0001
_12aED_BOXED:
[000bc910] 000273a6                  dc.l edbe_textcol
[000bc914]                           dc.w $0000
[000bc916]                           dc.w $0000
[000bc918]                           dc.w $8000
[000bc91a]                           dc.w $8846
[000bc91c]                           dc.w $0000
[000bc91e]                           dc.w $0000
[000bc920]                           dc.w $0000
[000bc922]                           dc.w $0000
[000bc924]                           dc.w $0000
[000bc926]                           dc.w $0000
_14_ED_BOXED:
[000bc928]                           dc.w $000f
[000bc92a]                           dc.w $ffff
[000bc92c]                           dc.w $ffff
[000bc92e]                           dc.w $0014
[000bc930]                           dc.w $0000
[000bc932]                           dc.w $0000
[000bc934]                           dc.w $0001
[000bc936]                           dc.w $1171
[000bc938]                           dc.w $0010
[000bc93a]                           dc.w $0000
[000bc93c]                           dc.w $0002
[000bc93e]                           dc.w $0001
_15_ED_BOXED:
[000bc940]                           dc.w $000c
[000bc942]                           dc.w $ffff
[000bc944]                           dc.w $ffff
[000bc946]                           dc.w $0018
[000bc948]                           dc.w $0000
[000bc94a]                           dc.w $0000
[000bc94c] 000bbd88                  dc.l A_3DBUTTON27
[000bc950]                           dc.w $0000
[000bc952]                           dc.w $0000
[000bc954]                           dc.w $0010
[000bc956]                           dc.w $0001
_16_ED_BOXED:
[000bc958]                           dc.w $0012
[000bc95a]                           dc.w $0011
[000bc95c]                           dc.w $0011
[000bc95e]                           dc.w $001c
[000bc960]                           dc.w $0040
[000bc962]                           dc.w $0000
[000bc964] 000bba8b                  dc.l TEXT_12
[000bc968]                           dc.w $001d
[000bc96a]                           dc.w $0003
[000bc96c]                           dc.w $0006
[000bc96e]                           dc.w $0001
_17_ED_BOXED:
[000bc970]                           dc.w $0010
[000bc972]                           dc.w $ffff
[000bc974]                           dc.w $ffff
[000bc976]                           dc.w $0018
[000bc978]                           dc.w $0040
[000bc97a]                           dc.w $0000
[000bc97c] 000bc008                  dc.l A_ARROWS02
[000bc980]                           dc.w $0000
[000bc982]                           dc.w $0000
[000bc984]                           dc.w $0001
[000bc986]                           dc.w $0001
_18_ED_BOXED:
[000bc988]                           dc.w $0015
[000bc98a]                           dc.w $0014
[000bc98c]                           dc.w $0014
[000bc98e]                           dc.w $0014
[000bc990]                           dc.w $0040
[000bc992]                           dc.w $0020
[000bc994]                           dc.w $00ff
[000bc996]                           dc.w $1101
[000bc998]                           dc.w $0024
[000bc99a]                           dc.w $0003
[000bc99c]                           dc.w $0008
[000bc99e]                           dc.w $0001
_18aED_BOXED:
[000bc9a0] 00027106                  dc.l edbe_size
[000bc9a4]                           dc.w $0000
[000bc9a6]                           dc.w $0000
[000bc9a8]                           dc.w $8000
[000bc9aa]                           dc.w $8847
[000bc9ac]                           dc.w $0000
[000bc9ae]                           dc.w $0000
[000bc9b0]                           dc.w $0000
[000bc9b2]                           dc.w $0000
[000bc9b4]                           dc.w $0000
[000bc9b6]                           dc.w $0000
_20_ED_BOXED:
[000bc9b8]                           dc.w $0012
[000bc9ba]                           dc.w $ffff
[000bc9bc]                           dc.w $ffff
[000bc9be]                           dc.w $0018
[000bc9c0]                           dc.w $0000
[000bc9c2]                           dc.w $0000
[000bc9c4] 000bbc08                  dc.l A_3DBUTTON07
[000bc9c8]                           dc.w $0000
[000bc9ca]                           dc.w $0000
[000bc9cc]                           dc.w $0008
[000bc9ce]                           dc.w $0001
_21_ED_BOXED:
[000bc9d0]                           dc.w $0016
[000bc9d2]                           dc.w $ffff
[000bc9d4]                           dc.w $ffff
[000bc9d6]                           dc.w $001c
[000bc9d8]                           dc.w $0040
[000bc9da]                           dc.w $0000
[000bc9dc] 000bba92                  dc.l TEXT_13
[000bc9e0]                           dc.w $002f
[000bc9e2]                           dc.w $0003
[000bc9e4]                           dc.w $0007
[000bc9e6]                           dc.w $0001
_22_ED_BOXED:
[000bc9e8]                           dc.w $0007
[000bc9ea]                           dc.w $ffff
[000bc9ec]                           dc.w $ffff
[000bc9ee]                           dc.w $0018
[000bc9f0]                           dc.w $0008
[000bc9f2]                           dc.w $0010
[000bc9f4] 000bc068                  dc.l A_BOXED03
[000bc9f8]                           dc.w $0036
[000bc9fa]                           dc.w $0003
[000bc9fc]                           dc.w $0003
[000bc9fe]                           dc.w $0001
_23_ED_BOXED:
[000bca00]                           dc.w $0021
[000bca02]                           dc.w $0018
[000bca04]                           dc.w $001f
[000bca06]                           dc.w $0018
[000bca08]                           dc.w $0040
[000bca0a]                           dc.w $0000
[000bca0c] 000bc188                  dc.l A_INNERFRAME04
[000bca10]                           dc.w $0001
[000bca12]                           dc.w $0009
[000bca14]                           dc.w $001e
[000bca16]                           dc.w $0006
_24_ED_BOXED:
[000bca18]                           dc.w $001a
[000bca1a]                           dc.w $ffff
[000bca1c]                           dc.w $ffff
[000bca1e]                           dc.w $0018
[000bca20]                           dc.w $0041
[000bca22]                           dc.w $0000
[000bca24] 000bc0e8                  dc.l A_CHECKBOX02
[000bca28]                           dc.w $0007
[000bca2a]                           dc.w $0001
[000bca2c]                           dc.w $0011
[000bca2e]                           dc.w $0001
_24aED_BOXED:
[000bca30] 00026f56                  dc.l edbe_autobig
[000bca34]                           dc.w $0000
[000bca36]                           dc.w $0000
[000bca38]                           dc.w $8000
[000bca3a]                           dc.w $884b
[000bca3c]                           dc.w $0000
[000bca3e]                           dc.w $0000
[000bca40]                           dc.w $0000
[000bca42]                           dc.w $0000
[000bca44]                           dc.w $0000
[000bca46]                           dc.w $0000
_26_ED_BOXED:
[000bca48]                           dc.w $001c
[000bca4a]                           dc.w $ffff
[000bca4c]                           dc.w $ffff
[000bca4e]                           dc.w $0018
[000bca50]                           dc.w $0041
[000bca52]                           dc.w $0000
[000bca54] 000bc108                  dc.l A_CHECKBOX03
[000bca58]                           dc.w $0007
[000bca5a]                           dc.w $0002
[000bca5c]                           dc.w $0014
[000bca5e]                           dc.w $0001
_26aED_BOXED:
[000bca60] 00026fca                  dc.l edbe_secret
[000bca64]                           dc.w $0000
[000bca66]                           dc.w $0000
[000bca68]                           dc.w $8000
[000bca6a]                           dc.w $0000
[000bca6c]                           dc.w $0000
[000bca6e]                           dc.w $0000
[000bca70]                           dc.w $0000
[000bca72]                           dc.w $0000
[000bca74]                           dc.w $0000
[000bca76]                           dc.w $0000
_28_ED_BOXED:
[000bca78]                           dc.w $001f
[000bca7a]                           dc.w $001e
[000bca7c]                           dc.w $001e
[000bca7e]                           dc.w $0014
[000bca80]                           dc.w $0040
[000bca82]                           dc.w $0020
[000bca84]                           dc.w $00ff
[000bca86]                           dc.w $1101
[000bca88]                           dc.w $0007
[000bca8a]                           dc.w $0004
[000bca8c]                           dc.w $0016
[000bca8e]                           dc.w $0001
_28aED_BOXED:
[000bca90] 00027210                  dc.l edbe_mask
[000bca94]                           dc.w $0000
[000bca96]                           dc.w $0000
[000bca98]                           dc.w $8000
[000bca9a]                           dc.w $884d
[000bca9c]                           dc.w $0000
[000bca9e]                           dc.w $0000
[000bcaa0]                           dc.w $0000
[000bcaa2]                           dc.w $0000
[000bcaa4]                           dc.w $0000
[000bcaa6]                           dc.w $0000
_30_ED_BOXED:
[000bcaa8]                           dc.w $001c
[000bcaaa]                           dc.w $ffff
[000bcaac]                           dc.w $ffff
[000bcaae]                           dc.w $0018
[000bcab0]                           dc.w $0000
[000bcab2]                           dc.w $0000
[000bcab4] 000bbc08                  dc.l A_3DBUTTON07
[000bcab8]                           dc.w $0000
[000bcaba]                           dc.w $0000
[000bcabc]                           dc.w $0016
[000bcabe]                           dc.w $0001
_31_ED_BOXED:
[000bcac0]                           dc.w $0017
[000bcac2]                           dc.w $0020
[000bcac4]                           dc.w $0020
[000bcac6]                           dc.w $001c
[000bcac8]                           dc.w $0040
[000bcaca]                           dc.w $0000
[000bcacc] 000bba9f                  dc.l TEXT_15
[000bcad0]                           dc.w $0001
[000bcad2]                           dc.w $0004
[000bcad4]                           dc.w $0006
[000bcad6]                           dc.w $0001
_32_ED_BOXED:
[000bcad8]                           dc.w $001f
[000bcada]                           dc.w $ffff
[000bcadc]                           dc.w $ffff
[000bcade]                           dc.w $0018
[000bcae0]                           dc.w $0040
[000bcae2]                           dc.w $0000
[000bcae4] 000bc008                  dc.l A_ARROWS02
[000bcae8]                           dc.w $0000
[000bcaea]                           dc.w $0000
[000bcaec]                           dc.w $0001
[000bcaee]                           dc.w $0001
_33_ED_BOXED:
[000bcaf0]                           dc.w $0032
[000bcaf2]                           dc.w $0022
[000bcaf4]                           dc.w $0030
[000bcaf6]                           dc.w $0018
[000bcaf8]                           dc.w $0040
[000bcafa]                           dc.w $0000
[000bcafc] 000bc128                  dc.l A_INNERFRAME01
[000bcb00]                           dc.w $001f
[000bcb02]                           dc.w $0009
[000bcb04]                           dc.w $001c
[000bcb06]                           dc.w $0006
_34_ED_BOXED:
[000bcb08]                           dc.w $0024
[000bcb0a]                           dc.w $0023
[000bcb0c]                           dc.w $0023
[000bcb0e]                           dc.w $001c
[000bcb10]                           dc.w $0040
[000bcb12]                           dc.w $0000
[000bcb14] 000bbad7                  dc.l TEXT_21
[000bcb18]                           dc.w $0002
[000bcb1a]                           dc.w $0001
[000bcb1c]                           dc.w $0006
[000bcb1e]                           dc.w $0001
_35_ED_BOXED:
[000bcb20]                           dc.w $0022
[000bcb22]                           dc.w $ffff
[000bcb24]                           dc.w $ffff
[000bcb26]                           dc.w $0018
[000bcb28]                           dc.w $0040
[000bcb2a]                           dc.w $0000
[000bcb2c] 000bc008                  dc.l A_ARROWS02
[000bcb30]                           dc.w $0000
[000bcb32]                           dc.w $0000
[000bcb34]                           dc.w $0001
[000bcb36]                           dc.w $0001
_36_ED_BOXED:
[000bcb38]                           dc.w $0025
[000bcb3a]                           dc.w $ffff
[000bcb3c]                           dc.w $ffff
[000bcb3e]                           dc.w $001c
[000bcb40]                           dc.w $0040
[000bcb42]                           dc.w $0000
[000bcb44] 000bbabd                  dc.l TEXT_19
[000bcb48]                           dc.w $0003
[000bcb4a]                           dc.w $0002
[000bcb4c]                           dc.w $0005
[000bcb4e]                           dc.w $0001
_37_ED_BOXED:
[000bcb50]                           dc.w $0029
[000bcb52]                           dc.w $0027
[000bcb54]                           dc.w $0028
[000bcb56]                           dc.w $0014
[000bcb58]                           dc.w $0040
[000bcb5a]                           dc.w $0020
[000bcb5c]                           dc.w $00ff
[000bcb5e]                           dc.w $1101
[000bcb60]                           dc.w $0009
[000bcb62]                           dc.w $0002
[000bcb64]                           dc.w $0012
[000bcb66]                           dc.w $0001
_37aED_BOXED:
[000bcb68] 000270a0                  dc.l edbe_outcol
[000bcb6c]                           dc.w $0000
[000bcb6e]                           dc.w $0000
[000bcb70]                           dc.w $8000
[000bcb72]                           dc.w $884c
[000bcb74]                           dc.w $0000
[000bcb76]                           dc.w $0000
[000bcb78]                           dc.w $0000
[000bcb7a]                           dc.w $0000
[000bcb7c]                           dc.w $0000
[000bcb7e]                           dc.w $0000
_39_ED_BOXED:
[000bcb80]                           dc.w $0028
[000bcb82]                           dc.w $ffff
[000bcb84]                           dc.w $ffff
[000bcb86]                           dc.w $0014
[000bcb88]                           dc.w $0000
[000bcb8a]                           dc.w $0000
[000bcb8c]                           dc.w $4301
[000bcb8e]                           dc.w $1371
[000bcb90]                           dc.w $0010
[000bcb92]                           dc.w $0000
[000bcb94]                           dc.w $0002
[000bcb96]                           dc.w $0001
_40_ED_BOXED:
[000bcb98]                           dc.w $0025
[000bcb9a]                           dc.w $ffff
[000bcb9c]                           dc.w $ffff
[000bcb9e]                           dc.w $0018
[000bcba0]                           dc.w $0000
[000bcba2]                           dc.w $0000
[000bcba4] 000bbd88                  dc.l A_3DBUTTON27
[000bcba8]                           dc.w $0000
[000bcbaa]                           dc.w $0000
[000bcbac]                           dc.w $0010
[000bcbae]                           dc.w $0001
_41_ED_BOXED:
[000bcbb0]                           dc.w $002b
[000bcbb2]                           dc.w $002a
[000bcbb4]                           dc.w $002a
[000bcbb6]                           dc.w $001c
[000bcbb8]                           dc.w $0040
[000bcbba]                           dc.w $0000
[000bcbbc] 000bbade                  dc.l TEXT_22
[000bcbc0]                           dc.w $0001
[000bcbc2]                           dc.w $0003
[000bcbc4]                           dc.w $0007
[000bcbc6]                           dc.w $0001
_42_ED_BOXED:
[000bcbc8]                           dc.w $0029
[000bcbca]                           dc.w $ffff
[000bcbcc]                           dc.w $ffff
[000bcbce]                           dc.w $0018
[000bcbd0]                           dc.w $0040
[000bcbd2]                           dc.w $0000
[000bcbd4] 000bc008                  dc.l A_ARROWS02
[000bcbd8]                           dc.w $0000
[000bcbda]                           dc.w $0000
[000bcbdc]                           dc.w $0001
[000bcbde]                           dc.w $0001
_43_ED_BOXED:
[000bcbe0]                           dc.w $002c
[000bcbe2]                           dc.w $ffff
[000bcbe4]                           dc.w $ffff
[000bcbe6]                           dc.w $001c
[000bcbe8]                           dc.w $0040
[000bcbea]                           dc.w $0000
[000bcbec] 000bba65                  dc.l TEXT_09
[000bcbf0]                           dc.w $0002
[000bcbf2]                           dc.w $0004
[000bcbf4]                           dc.w $0006
[000bcbf6]                           dc.w $0001
_44_ED_BOXED:
[000bcbf8]                           dc.w $0030
[000bcbfa]                           dc.w $002e
[000bcbfc]                           dc.w $002f
[000bcbfe]                           dc.w $0014
[000bcc00]                           dc.w $0040
[000bcc02]                           dc.w $0020
[000bcc04]                           dc.w $00ff
[000bcc06]                           dc.w $1101
[000bcc08]                           dc.w $0009
[000bcc0a]                           dc.w $0004
[000bcc0c]                           dc.w $0012
[000bcc0e]                           dc.w $0001
_44aED_BOXED:
[000bcc10] 0002703e                  dc.l edbe_incol
[000bcc14]                           dc.w $0000
[000bcc16]                           dc.w $0000
[000bcc18]                           dc.w $8000
[000bcc1a]                           dc.w $8852
[000bcc1c]                           dc.w $0000
[000bcc1e]                           dc.w $0000
[000bcc20]                           dc.w $0000
[000bcc22]                           dc.w $0000
[000bcc24]                           dc.w $0000
[000bcc26]                           dc.w $0000
_46_ED_BOXED:
[000bcc28]                           dc.w $002f
[000bcc2a]                           dc.w $ffff
[000bcc2c]                           dc.w $ffff
[000bcc2e]                           dc.w $0014
[000bcc30]                           dc.w $0000
[000bcc32]                           dc.w $0000
[000bcc34]                           dc.w $4301
[000bcc36]                           dc.w $1371
[000bcc38]                           dc.w $0010
[000bcc3a]                           dc.w $0000
[000bcc3c]                           dc.w $0002
[000bcc3e]                           dc.w $0001
_47_ED_BOXED:
[000bcc40]                           dc.w $002c
[000bcc42]                           dc.w $ffff
[000bcc44]                           dc.w $ffff
[000bcc46]                           dc.w $0018
[000bcc48]                           dc.w $0000
[000bcc4a]                           dc.w $0000
[000bcc4c] 000bbd88                  dc.l A_3DBUTTON27
[000bcc50]                           dc.w $0000
[000bcc52]                           dc.w $0000
[000bcc54]                           dc.w $0010
[000bcc56]                           dc.w $0001
_48_ED_BOXED:
[000bcc58]                           dc.w $0021
[000bcc5a]                           dc.w $ffff
[000bcc5c]                           dc.w $ffff
[000bcc5e]                           dc.w $0018
[000bcc60]                           dc.w $0041
[000bcc62]                           dc.w $0000
[000bcc64] 000bc0c8                  dc.l A_CHECKBOX01
[000bcc68]                           dc.w $0007
[000bcc6a]                           dc.w $0000
[000bcc6c]                           dc.w $000b
[000bcc6e]                           dc.w $0001
_48aED_BOXED:
[000bcc70] 00026ee2                  dc.l edbe_3d
[000bcc74]                           dc.w $0000
[000bcc76]                           dc.w $0000
[000bcc78]                           dc.w $8000
[000bcc7a]                           dc.w $8844
[000bcc7c]                           dc.w $0000
[000bcc7e]                           dc.w $0000
[000bcc80]                           dc.w $0000
[000bcc82]                           dc.w $0000
[000bcc84]                           dc.w $0000
[000bcc86]                           dc.w $0000
_50_ED_BOXED:
[000bcc88]                           dc.w $0000
[000bcc8a]                           dc.w $0033
[000bcc8c]                           dc.w $0036
[000bcc8e]                           dc.w $0018
[000bcc90]                           dc.w $0040
[000bcc92]                           dc.w $0000
[000bcc94] 000bc168                  dc.l A_INNERFRAME03
[000bcc98]                           dc.w $0001
[000bcc9a]                           dc.w $000f
[000bcc9c]                           dc.w $003a
[000bcc9e]                           dc.w $0005
_51_ED_BOXED:
[000bcca0]                           dc.w $0034
[000bcca2]                           dc.w $ffff
[000bcca4]                           dc.w $ffff
[000bcca6]                           dc.w $001c
[000bcca8]                           dc.w $0000
[000bccaa]                           dc.w $0000
[000bccac] 000bba56                  dc.l TEXT_08
[000bccb0]                           dc.w $0001
[000bccb2]                           dc.w $0001
[000bccb4]                           dc.w $000e
[000bccb6]                           dc.w $0001
_52_ED_BOXED:
[000bccb8]                           dc.w $0035
[000bccba]                           dc.w $ffff
[000bccbc]                           dc.w $ffff
[000bccbe]                           dc.w $001c
[000bccc0]                           dc.w $0000
[000bccc2]                           dc.w $0000
[000bccc4] 000bbaa6                  dc.l TEXT_16
[000bccc8]                           dc.w $0001
[000bccca]                           dc.w $0003
[000bcccc]                           dc.w $000d
[000bccce]                           dc.w $0001
_53_ED_BOXED:
[000bccd0]                           dc.w $0036
[000bccd2]                           dc.w $ffff
[000bccd4]                           dc.w $ffff
[000bccd6]                           dc.w $0018
[000bccd8]                           dc.w $0008
[000bccda]                           dc.w $0010
[000bccdc] 000bc088                  dc.l A_BOXED04
[000bcce0]                           dc.w $0010
[000bcce2]                           dc.w $0001
[000bcce4]                           dc.w $0029
[000bcce6]                           dc.w $0001
_54_ED_BOXED:
[000bcce8]                           dc.w $0032
[000bccea]                           dc.w $ffff
[000bccec]                           dc.w $ffff
[000bccee]                           dc.w $0018
[000bccf0]                           dc.w $0028
[000bccf2]                           dc.w $0010
[000bccf4] 000bc0a8                  dc.l A_BOXED05
[000bccf8]                           dc.w $0010
[000bccfa]                           dc.w $0003
[000bccfc]                           dc.w $0029
[000bccfe]                           dc.w $0001
masklist:
[000bcd00] 000bb83f                  dc.l PMT00
[000bcd04] 000bb84e                  dc.l PMT01
[000bcd08] 000bb85e                  dc.l PMT02
[000bcd0c] 000bb86e                  dc.l PMT03
[000bcd10] 000bb87a                  dc.l PMT04
[000bcd14] 000bb88d                  dc.l PMT05
[000bcd18] 000bb898                  dc.l PMT06
[000bcd1c] 000bb8aa                  dc.l PMT07
[000bcd20] 000bb8b3                  dc.l PMT08
[000bcd24] 000bb8c0                  dc.l PMT09
[000bcd28] 000bb8d6                  dc.l PMT10
[000bcd2c] 000bb8e2                  dc.l PMT11
[000bcd30] 000bb8f3                  dc.l PMT12
[000bcd34] 000bb8ff                  dc.l PMT13
[000bcd38] 000bb910                  dc.l PMT14
[000bcd3c] 000bb91e                  dc.l PMT15
[000bcd40] 000bb931                  dc.l PMT16
[000bcd44] 000bb943                  dc.l PMT17
[000bcd48] 000bb95a                  dc.l PMT18
[000bcd4c] 000bb96b                  dc.l PMT19
[000bcd50] 000bb981                  dc.l PMT20
[000bcd54] 000bb98e                  dc.l PMT21
[000bcd58] 000bb99b                  dc.l PMT22
[000bcd5c] 000bb9a8                  dc.l PMT23
[000bcd60] 000bb9b5                  dc.l PMT24
[000bcd64] 000bb9ca                  dc.l PMT25
[000bcd68] 000bb9dc                  dc.l PMT26
[000bcd6c] 000bce5a                  dc.l $000bce5a
[000bcd70] 000bce5a                  dc.l $000bce5a
[000bcd74] 000bce5a                  dc.l $000bce5a
[000bcd78] 000bce5a                  dc.l $000bce5a
[000bcd7c] 000bce5a                  dc.l $000bce5a
[000bcd80] 000bce5a                  dc.l $000bce5a
[000bcd84] 000bce5a                  dc.l $000bce5a
[000bcd88] 000bce5a                  dc.l $000bce5a
DB1:
[000bcd8c] 0006afea                  dc.l A_boxed
[000bcd90]                           dc.w $9038
[000bcd92]                           dc.w $ff12
[000bcd94] 0006a068                  dc.l Auo_boxed
[000bcd98] 000bce5b                  dc.l $000bce5b
[000bcd9c]                           dc.w $0000
[000bcd9e]                           dc.w $0000
[000bcda0]                           dc.w $0000
[000bcda2]                           dc.w $0000
[000bcda4]                           dc.w $0000
[000bcda6]                           dc.w $0000
[000bcda8]                           dc.w $0000
[000bcdaa]                           dc.w $0000
visual:
[000bcdac]                           dc.w $ffff
[000bcdae]                           dc.w $ffff
[000bcdb0]                           dc.w $ffff
[000bcdb2]                           dc.w $0018
[000bcdb4]                           dc.w $2005
[000bcdb6]                           dc.w $0010
[000bcdb8] 000bcd8c                  dc.l DB1
[000bcdbc]                           dc.w $0000
[000bcdbe]                           dc.w $0000
[000bcdc0]                           dc.w $000a
[000bcdc2]                           dc.w $0001
logical:
[000bcdc4]                           dc.w $ffff
[000bcdc6]                           dc.w $ffff
[000bcdc8]                           dc.w $ffff
[000bcdca]                           dc.w $0018
[000bcdcc]                           dc.w $0008
[000bcdce]                           dc.w $0010
[000bcdd0] 000bcd8c                  dc.l DB1
[000bcdd4]                           dc.w $0000
[000bcdd6]                           dc.w $0000
[000bcdd8]                           dc.w $000a
[000bcdda]                           dc.w $0001
aud:
[000bcddc] 000bce63                  dc.l $000bce63
[000bcde0] 000bce6f                  dc.l $000bce6f
[000bcde4]                           dc.w $0002
[000bcde6] 000bce79                  dc.l $000bce79
[000bcdea]                           dc.w $0000
[000bcdec]                           dc.w $0000
[000bcdee]                           dc.w $0000
[000bcdf0]                           dc.w $0000
[000bcdf2]                           dc.w $0000
[000bcdf4]                           dc.w $0000
[000bcdf6]                           dc.w $0000
[000bcdf8]                           dc.w $0000
[000bcdfa]                           dc.w $0000
[000bcdfc]                           dc.w $0000
[000bcdfe]                           dc.w $0000
[000bce00]                           dc.w $0000
[000bce02]                           dc.w $0000
[000bce04]                           dc.w $0000
[000bce06]                           dc.w $0000
[000bce08]                           dc.w $0000
data:
[000bce0a]                           dc.b 'A_boxed',0
[000bce12]                           dc.w $0000
[000bce14]                           dc.w $0000
[000bce16]                           dc.w $0000
[000bce18]                           dc.w $0000
[000bce1a]                           dc.w $0000
[000bce1c]                           dc.w $0000
[000bce1e]                           dc.w $0000
[000bce20]                           dc.w $0000
[000bce22]                           dc.w $0000
[000bce24]                           dc.w $0000
[000bce26]                           dc.w $0000
[000bce28]                           dc.w $0000
[000bce2a] 000269fc                  dc.l object_tree
[000bce2e] 00026cec                  dc.l test_it
[000bce32] 00026d94                  dc.l ok
[000bce36] 0004f20a                  dc.l Aob_delete
[000bce3a] 000bcdac                  dc.l visual
[000bce3e] 000bcdc4                  dc.l logical
[000bce42] 000bcddc                  dc.l aud
[000bce46] 000269b8                  dc.l minsize
[000bce4a]                           dc.w $0000
[000bce4c]                           dc.w $0000
[000bce4e] 000bbb3e                  dc.l title
[000bce52] 000bbb2b                  dc.l help_title
[000bce56]                           dc.w $0000
[000bce58]                           dc.w $0000
[000bce5a]                           dc.w $0042
[000bce5c]                           dc.b 'oxEdit',0
[000bce63]                           dc.b '0x9038ff12L',0
[000bce6f]                           dc.b 'Auo_boxed',0
[000bce79]                           dc.b 'Text',0
[000bce7e]                           dc.b '0x%lxL',0
[000bce85]                           dc.b $25
[000bce86]                           dc.w $6400
