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
[000269c4] 6716                      beq.s      $000269DC
[000269c6] 2040                      movea.l    d0,a0
[000269c8] 4eb9 0008 2f6c            jsr        strlen
[000269ce] 2600                      move.l     d0,d3
[000269d0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000269d6] c7e8 0012                 muls.w     18(a0),d3
[000269da] 600a                      bra.s      $000269E6
[000269dc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000269e2] 3628 0012                 move.w     18(a0),d3
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
[00026a18] 6700 02c6                 beq        $00026CE0
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
[00026ad6] 661e                      bne.s      $00026AF6
[00026ad8] 226d 000a                 movea.l    10(a5),a1
[00026adc] 7002                      moveq.l    #2,d0
[00026ade] 204a                      movea.l    a2,a0
[00026ae0] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026ae6] 226d 000a                 movea.l    10(a5),a1
[00026aea] 7008                      moveq.l    #8,d0
[00026aec] 204a                      movea.l    a2,a0
[00026aee] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026af4] 6020                      bra.s      $00026B16
[00026af6] 43f9 000b ce5a            lea.l      $000BCE5A,a1
[00026afc] 7002                      moveq.l    #2,d0
[00026afe] 204a                      movea.l    a2,a0
[00026b00] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026b06] 43f9 000b ce5a            lea.l      $000BCE5A,a1
[00026b0c] 7008                      moveq.l    #8,d0
[00026b0e] 204a                      movea.l    a2,a0
[00026b10] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026b16] 206a 0504                 movea.l    1284(a2),a0
[00026b1a] 2768 000c 0018            move.l     12(a0),24(a3)
[00026b20] 206d 0026                 movea.l    38(a5),a0
[00026b24] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00026b2a] 4a40                      tst.w      d0
[00026b2c] 6712                      beq.s      $00026B40
[00026b2e] 43f9 000b ce5a            lea.l      $000BCE5A,a1
[00026b34] 7035                      moveq.l    #53,d0
[00026b36] 204a                      movea.l    a2,a0
[00026b38] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026b3e] 600e                      bra.s      $00026B4E
[00026b40] 226d 0026                 movea.l    38(a5),a1
[00026b44] 7035                      moveq.l    #53,d0
[00026b46] 204a                      movea.l    a2,a0
[00026b48] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026b4e] 206a 051c                 movea.l    1308(a2),a0
[00026b52] 2768 000c 001c            move.l     12(a0),28(a3)
[00026b58] 206d 002a                 movea.l    42(a5),a0
[00026b5c] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00026b62] 4a40                      tst.w      d0
[00026b64] 6712                      beq.s      $00026B78
[00026b66] 43f9 000b ce5a            lea.l      $000BCE5A,a1
[00026b6c] 7036                      moveq.l    #54,d0
[00026b6e] 204a                      movea.l    a2,a0
[00026b70] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026b76] 600e                      bra.s      $00026B86
[00026b78] 226d 002a                 movea.l    42(a5),a1
[00026b7c] 7036                      moveq.l    #54,d0
[00026b7e] 204a                      movea.l    a2,a0
[00026b80] 4eb9 0005 0fd8            jsr        Aob_puttext
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
[00026c5e] 6712                      beq.s      $00026C72
[00026c60] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[00026c66] 204a                      movea.l    a2,a0
[00026c68] 7014                      moveq.l    #20,d0
[00026c6a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00026c70] 6010                      bra.s      $00026C82
[00026c72] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[00026c78] 7014                      moveq.l    #20,d0
[00026c7a] 204a                      movea.l    a2,a0
[00026c7c] 4eb9 0005 0fd8            jsr        Aob_puttext
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
[00026cb8] 6706                      beq.s      $00026CC0
[00026cba] 006a 0001 048a            ori.w      #$0001,1162(a2)
[00026cc0] 302e 0002                 move.w     2(a6),d0
[00026cc4] e648                      lsr.w      #3,d0
[00026cc6] c07c 0001                 and.w      #$0001,d0
[00026cca] 6706                      beq.s      $00026CD2
[00026ccc] 006a 0001 024a            ori.w      #$0001,586(a2)
[00026cd2] 7001                      moveq.l    #1,d0
[00026cd4] c06e 0002                 and.w      2(a6),d0
[00026cd8] 6706                      beq.s      $00026CE0
[00026cda] 006a 0001 027a            ori.w      #$0001,634(a2)
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
[00026d1c] 6608                      bne.s      $00026D26
[00026d1e] 256b 000a 000c            move.l     10(a3),12(a2)
[00026d24] 6004                      bra.s      $00026D2A
[00026d26] 42aa 000c                 clr.l      12(a2)
[00026d2a] 7000                      moveq.l    #0,d0
[00026d2c] 2540 0014                 move.l     d0,20(a2)
[00026d30] 2540 0010                 move.l     d0,16(a2)
[00026d34] 206b 0026                 movea.l    38(a3),a0
[00026d38] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00026d3e] 4a40                      tst.w      d0
[00026d40] 6704                      beq.s      $00026D46
[00026d42] 91c8                      suba.l     a0,a0
[00026d44] 6004                      bra.s      $00026D4A
[00026d46] 206b 0026                 movea.l    38(a3),a0
[00026d4a] 2548 0018                 move.l     a0,24(a2)
[00026d4e] 206b 002a                 movea.l    42(a3),a0
[00026d52] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00026d58] 4a40                      tst.w      d0
[00026d5a] 6704                      beq.s      $00026D60
[00026d5c] 91c8                      suba.l     a0,a0
[00026d5e] 6004                      bra.s      $00026D64
[00026d60] 206b 002a                 movea.l    42(a3),a0
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
[00026dca] 6f04                      ble.s      $00026DD0
[00026dcc] 3ebc 00ff                 move.w     #$00FF,(a7)
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
[00026e20] 6720                      beq.s      $00026E42
[00026e22] 4eb9 0008 2f6c            jsr        strlen
[00026e28] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026e2e] c1e8 0012                 muls.w     18(a0),d0
[00026e32] 3e80                      move.w     d0,(a7)
[00026e34] 357c 0002 0008            move.w     #$0002,8(a2)
[00026e3a] 256f 0030 000a            move.l     48(a7),10(a2)
[00026e40] 6012                      bra.s      $00026E54
[00026e42] 2079 0010 ee4e            movea.l    ACSblk,a0
[00026e48] 3ea8 0012                 move.w     18(a0),(a7)
[00026e4c] 426a 0008                 clr.w      8(a2)
[00026e50] 42aa 000a                 clr.l      10(a2)
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
[00026e92] 6704                      beq.s      $00026E98
[00026e94] 42aa 0026                 clr.l      38(a2)
[00026e98] 43ea 002a                 lea.l      42(a2),a1
[00026e9c] 7003                      moveq.l    #3,d0
[00026e9e] 41eb 0510                 lea.l      1296(a3),a0
[00026ea2] 4eb9 0006 a068            jsr        Auo_boxed
[00026ea8] 206a 002a                 movea.l    42(a2),a0
[00026eac] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00026eb2] 4a40                      tst.w      d0
[00026eb4] 6704                      beq.s      $00026EBA
[00026eb6] 42aa 002a                 clr.l      42(a2)
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
[00026f0c] 670e                      beq.s      $00026F1C
[00026f0e] 026b fffd 0002            andi.w     #$FFFD,2(a3)
[00026f14] 006b 0002 0002            ori.w      #$0002,2(a3)
[00026f1a] 6006                      bra.s      $00026F22
[00026f1c] 026b fffd 0002            andi.w     #$FFFD,2(a3)
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
[00026f80] 670e                      beq.s      $00026F90
[00026f82] 026b fff7 0002            andi.w     #$FFF7,2(a3)
[00026f88] 006b 0008 0002            ori.w      #$0008,2(a3)
[00026f8e] 6006                      bra.s      $00026F96
[00026f90] 026b fff7 0002            andi.w     #$FFF7,2(a3)
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
[00026ff4] 670e                      beq.s      $00027004
[00026ff6] 026b fffe 0002            andi.w     #$FFFE,2(a3)
[00026ffc] 006b 0001 0002            ori.w      #$0001,2(a3)
[00027002] 6006                      bra.s      $0002700A
[00027004] 026b fffe 0002            andi.w     #$FFFE,2(a3)
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
[0002706c] 6f2c                      ble.s      $0002709A
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
[000270d0] 6f2e                      ble.s      $00027100
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
[0002711c] 6700 00ea                 beq        $00027208
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
[00027190] 6f6e                      ble.s      $00027200
[00027192] b07c 0001                 cmp.w      #$0001,d0
[00027196] 661c                      bne.s      $000271B4
[00027198] 026d fffb 0002            andi.w     #$FFFB,2(a5)
[0002719e] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[000271a4] 7014                      moveq.l    #20,d0
[000271a6] 2053                      movea.l    (a3),a0
[000271a8] 2068 025c                 movea.l    604(a0),a0
[000271ac] 4eb9 0005 0fd8            jsr        Aob_puttext
[000271b2] 6020                      bra.s      $000271D4
[000271b4] 026d fffb 0002            andi.w     #$FFFB,2(a5)
[000271ba] 006d 0004 0002            ori.w      #$0004,2(a5)
[000271c0] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[000271c6] 7014                      moveq.l    #20,d0
[000271c8] 2053                      movea.l    (a3),a0
[000271ca] 2068 025c                 movea.l    604(a0),a0
[000271ce] 4eb9 0005 0fd8            jsr        Aob_puttext
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
[00027200] 204a                      movea.l    a2,a0
[00027202] 4eb9 0004 f20a            jsr        Aob_delete
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
[00027228] 6700 0172                 beq        $0002739C
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
[00027280] 6f00 0112                 ble        $00027394
[00027284] 48c0                      ext.l      d0
[00027286] 2200                      move.l     d0,d1
[00027288] d281                      add.l      d1,d1
[0002728a] d280                      add.l      d0,d1
[0002728c] e789                      lsl.l      #3,d1
[0002728e] 4bf2 1818                 lea.l      24(a2,d1.l),a5
[00027292] 342d 0008                 move.w     8(a5),d2
[00027296] c47c 8000                 and.w      #$8000,d2
[0002729a] 6700 00f8                 beq        $00027394
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
[000272f6] 6770                      beq.s      $00027368
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
[00027394] 204a                      movea.l    a2,a0
[00027396] 4eb9 0004 f20a            jsr        Aob_delete
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
[000273d6] 6f30                      ble.s      $00027408
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
[00027408] 245f                      movea.l    (a7)+,a2
[0002740a] 361f                      move.w     (a7)+,d3
[0002740c] 4e75                      rts
