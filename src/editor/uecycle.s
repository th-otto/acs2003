init_cycle:
[00027e26] 2f0a                      move.l     a2,-(a7)
[00027e28] 2f0b                      move.l     a3,-(a7)
[00027e2a] 2448                      movea.l    a0,a2
[00027e2c] 43f9 000b f514            lea.l      data,a1
[00027e32] 303c 2329                 move.w     #$2329,d0
[00027e36] 266a 0004                 movea.l    4(a2),a3
[00027e3a] 4e93                      jsr        (a3)
[00027e3c] 265f                      movea.l    (a7)+,a3
[00027e3e] 245f                      movea.l    (a7)+,a2
[00027e40] 4e75                      rts

minsize:
[00027e42] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027e48] 3228 0012                 move.w     18(a0),d1
[00027e4c] 3001                      move.w     d1,d0
[00027e4e] d040                      add.w      d0,d0
[00027e50] d041                      add.w      d1,d0
[00027e52] d040                      add.w      d0,d0
[00027e54] 3280                      move.w     d0,(a1)
[00027e56] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027e5c] 226f 0004                 movea.l    4(a7),a1
[00027e60] 32a8 0014                 move.w     20(a0),(a1)
[00027e64] 4e75                      rts

object_tree:
[00027e66] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00027e6a] 4fef fff6                 lea.l      -10(a7),a7
[00027e6e] 2a48                      movea.l    a0,a5
[00027e70] 2649                      movea.l    a1,a3
[00027e72] 41f9 000b f564            lea.l      $000BF564,a0
[00027e78] 43ef 0004                 lea.l      4(a7),a1
[00027e7c] 12d8                      move.b     (a0)+,(a1)+
[00027e7e] 12d8                      move.b     (a0)+,(a1)+
[00027e80] 41f9 000b f14e            lea.l      ED_CYCLE,a0
[00027e86] 4eb9 0004 f064            jsr        Aob_create
[00027e8c] 2448                      movea.l    a0,a2
[00027e8e] 200a                      move.l     a2,d0
[00027e90] 6606                      bne.s      object_tree_1
[00027e92] 91c8                      suba.l     a0,a0
[00027e94] 6000 01cc                 bra        object_tree_2
object_tree_1:
[00027e98] 41ea 0030                 lea.l      48(a2),a0
[00027e9c] 7016                      moveq.l    #22,d0
[00027e9e] c06b 0008                 and.w      8(a3),d0
[00027ea2] 8168 0008                 or.w       d0,8(a0)
[00027ea6] 703f                      moveq.l    #63,d0
[00027ea8] c06b 000a                 and.w      10(a3),d0
[00027eac] 8168 000a                 or.w       d0,10(a0)
[00027eb0] 2668 000c                 movea.l    12(a0),a3
[00027eb4] 49f9 0010 ee4e            lea.l      ACSblk,a4
[00027eba] 701b                      moveq.l    #27,d0
[00027ebc] 224a                      movea.l    a2,a1
[00027ebe] 2054                      movea.l    (a4),a0
[00027ec0] 2068 0258                 movea.l    600(a0),a0
[00027ec4] 4eb9 0003 0b9a            jsr        oe_beself
[00027eca] 7008                      moveq.l    #8,d0
[00027ecc] 224a                      movea.l    a2,a1
[00027ece] 2054                      movea.l    (a4),a0
[00027ed0] 2068 0258                 movea.l    600(a0),a0
[00027ed4] 4eb9 0003 0b9a            jsr        oe_beself
[00027eda] 7020                      moveq.l    #32,d0
[00027edc] 224a                      movea.l    a2,a1
[00027ede] 2054                      movea.l    (a4),a0
[00027ee0] 2068 0258                 movea.l    600(a0),a0
[00027ee4] 4eb9 0003 0b9a            jsr        oe_beself
[00027eea] 7022                      moveq.l    #34,d0
[00027eec] 224a                      movea.l    a2,a1
[00027eee] 2054                      movea.l    (a4),a0
[00027ef0] 2068 0258                 movea.l    600(a0),a0
[00027ef4] 4eb9 0003 0b9a            jsr        oe_beself
[00027efa] 4857                      pea.l      (a7)
[00027efc] 43f9 000b f587            lea.l      $000BF587,a1
[00027f02] 2055                      movea.l    (a5),a0
[00027f04] 4eb9 0008 1b26            jsr        sscanf
[00027f0a] 584f                      addq.w     #4,a7
[00027f0c] 0c97 0001 0000            cmpi.l     #$00010000,(a7)
[00027f12] 6618                      bne.s      object_tree_3
[00027f14] 41f9 000b eb1a            lea.l      A_ADAPTCYC,a0
[00027f1a] 7001                      moveq.l    #1,d0
[00027f1c] 4eb9 0005 a600            jsr        Awi_alert
[00027f22] 5340                      subq.w     #1,d0
[00027f24] 6606                      bne.s      object_tree_3
[00027f26] 2ebc 0001 0290            move.l     #$00010290,(a7)
object_tree_3:
[00027f2c] 2757 0004                 move.l     (a7),4(a3)
[00027f30] 0c6d 0002 0008            cmpi.w     #$0002,8(a5)
[00027f36] 6608                      bne.s      object_tree_4
[00027f38] 2f6d 000a 0006            move.l     10(a5),6(a7)
[00027f3e] 6008                      bra.s      object_tree_5
object_tree_4:
[00027f40] 2f7c 000b f573 0006       move.l     #$000BF573,6(a7)
object_tree_5:
[00027f48] 226f 0006                 movea.l    6(a7),a1
[00027f4c] 303c 0190                 move.w     #$0190,d0
[00027f50] 41ea 0030                 lea.l      48(a2),a0
[00027f54] 4eb9 0006 7456            jsr        Auo_cycle
[00027f5a] 2617                      move.l     (a7),d3
[00027f5c] e883                      asr.l      #4,d3
[00027f5e] c67c 000f                 and.w      #$000F,d3
[00027f62] 3003                      move.w     d3,d0
[00027f64] 48c0                      ext.l      d0
[00027f66] e588                      lsl.l      #2,d0
[00027f68] 41f9 000c a6d0            lea.l      colour_text,a0
[00027f6e] 2270 0800                 movea.l    0(a0,d0.l),a1
[00027f72] 204a                      movea.l    a2,a0
[00027f74] 7019                      moveq.l    #25,d0
[00027f76] 4eb9 0005 0fd8            jsr        Aob_puttext
[00027f7c] 3003                      move.w     d3,d0
[00027f7e] 026a fff0 024e            andi.w     #$FFF0,590(a2)
[00027f84] c07c 000f                 and.w      #$000F,d0
[00027f88] 816a 024e                 or.w       d0,590(a2)
[00027f8c] 760f                      moveq.l    #15,d3
[00027f8e] c66f 0002                 and.w      2(a7),d3
[00027f92] 3003                      move.w     d3,d0
[00027f94] 48c0                      ext.l      d0
[00027f96] e588                      lsl.l      #2,d0
[00027f98] 41f9 000c a6d0            lea.l      colour_text,a0
[00027f9e] 2270 0800                 movea.l    0(a0,d0.l),a1
[00027fa2] 204a                      movea.l    a2,a0
[00027fa4] 7012                      moveq.l    #18,d0
[00027fa6] 4eb9 0005 0fd8            jsr        Aob_puttext
[00027fac] 3003                      move.w     d3,d0
[00027fae] 026a fff0 01a6            andi.w     #$FFF0,422(a2)
[00027fb4] c07c 000f                 and.w      #$000F,d0
[00027fb8] 816a 01a6                 or.w       d0,422(a2)
[00027fbc] 2017                      move.l     (a7),d0
[00027fbe] e080                      asr.l      #8,d0
[00027fc0] 1f40 0004                 move.b     d0,4(a7)
[00027fc4] 43ef 0004                 lea.l      4(a7),a1
[00027fc8] 204a                      movea.l    a2,a0
[00027fca] 701b                      moveq.l    #27,d0
[00027fcc] 4eb9 0005 0fd8            jsr        Aob_puttext
[00027fd2] 226f 0006                 movea.l    6(a7),a1
[00027fd6] 7008                      moveq.l    #8,d0
[00027fd8] 204a                      movea.l    a2,a0
[00027fda] 4eb9 0005 0fd8            jsr        Aob_puttext
[00027fe0] 2017                      move.l     (a7),d0
[00027fe2] c0bc 0001 0000            and.l      #$00010000,d0
[00027fe8] 6706                      beq.s      object_tree_6
[00027fea] 006a 0001 00e2            ori.w      #$0001,226(a2)
object_tree_6:
[00027ff0] 206a 030c                 movea.l    780(a2),a0
[00027ff4] 2768 000c 0018            move.l     12(a0),24(a3)
[00027ffa] 206d 0026                 movea.l    38(a5),a0
[00027ffe] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00028004] 4a40                      tst.w      d0
[00028006] 6712                      beq.s      object_tree_7
[00028008] 43f9 000b f573            lea.l      $000BF573,a1
[0002800e] 7020                      moveq.l    #32,d0
[00028010] 204a                      movea.l    a2,a0
[00028012] 4eb9 0005 0fd8            jsr        Aob_puttext
[00028018] 600e                      bra.s      object_tree_8
object_tree_7:
[0002801a] 226d 0026                 movea.l    38(a5),a1
[0002801e] 7020                      moveq.l    #32,d0
[00028020] 204a                      movea.l    a2,a0
[00028022] 4eb9 0005 0fd8            jsr        Aob_puttext
object_tree_8:
[00028028] 206a 033c                 movea.l    828(a2),a0
[0002802c] 2768 000c 001c            move.l     12(a0),28(a3)
[00028032] 206d 002a                 movea.l    42(a5),a0
[00028036] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002803c] 4a40                      tst.w      d0
[0002803e] 6712                      beq.s      object_tree_9
[00028040] 43f9 000b f573            lea.l      $000BF573,a1
[00028046] 7022                      moveq.l    #34,d0
[00028048] 204a                      movea.l    a2,a0
[0002804a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00028050] 600e                      bra.s      object_tree_10
object_tree_9:
[00028052] 226d 002a                 movea.l    42(a5),a1
[00028056] 7022                      moveq.l    #34,d0
[00028058] 204a                      movea.l    a2,a0
[0002805a] 4eb9 0005 0fd8            jsr        Aob_puttext
object_tree_10:
[00028060] 204a                      movea.l    a2,a0
object_tree_2:
[00028062] 4fef 000a                 lea.l      10(a7),a7
[00028066] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0002806a] 4e75                      rts

test_it:
[0002806c] 2f0a                      move.l     a2,-(a7)
[0002806e] 2f0b                      move.l     a3,-(a7)
[00028070] 2648                      movea.l    a0,a3
[00028072] 2449                      movea.l    a1,a2
[00028074] 22bc 0006 6c46            move.l     #A_cycle,(a1)
[0002807a] 486a 0004                 pea.l      4(a2)
[0002807e] 43f9 000b f587            lea.l      $000BF587,a1
[00028084] 2050                      movea.l    (a0),a0
[00028086] 4eb9 0008 1b26            jsr        sscanf
[0002808c] 584f                      addq.w     #4,a7
[0002808e] 257c 0006 7456 0008       move.l     #Auo_cycle,8(a2)
[00028096] 0c6b 0002 0008            cmpi.w     #$0002,8(a3)
[0002809c] 6608                      bne.s      test_it_1
[0002809e] 256b 000a 000c            move.l     10(a3),12(a2)
[000280a4] 6004                      bra.s      test_it_2
test_it_1:
[000280a6] 42aa 000c                 clr.l      12(a2)
test_it_2:
[000280aa] 7000                      moveq.l    #0,d0
[000280ac] 2540 0014                 move.l     d0,20(a2)
[000280b0] 2540 0010                 move.l     d0,16(a2)
[000280b4] 206b 0026                 movea.l    38(a3),a0
[000280b8] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000280be] 4a40                      tst.w      d0
[000280c0] 6704                      beq.s      test_it_3
[000280c2] 91c8                      suba.l     a0,a0
[000280c4] 6004                      bra.s      test_it_4
test_it_3:
[000280c6] 206b 0026                 movea.l    38(a3),a0
test_it_4:
[000280ca] 2548 0018                 move.l     a0,24(a2)
[000280ce] 206b 002a                 movea.l    42(a3),a0
[000280d2] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000280d8] 4a40                      tst.w      d0
[000280da] 6704                      beq.s      test_it_5
[000280dc] 91c8                      suba.l     a0,a0
[000280de] 6004                      bra.s      test_it_6
test_it_5:
[000280e0] 206b 002a                 movea.l    42(a3),a0
test_it_6:
[000280e4] 2548 001c                 move.l     a0,28(a2)
[000280e8] 265f                      movea.l    (a7)+,a3
[000280ea] 245f                      movea.l    (a7)+,a2
[000280ec] 4e75                      rts

abort:
[000280ee] 2079 0010 ee4e            movea.l    ACSblk,a0
[000280f4] 2268 0258                 movea.l    600(a0),a1
[000280f8] 2069 0014                 movea.l    20(a1),a0
[000280fc] 2068 003c                 movea.l    60(a0),a0
[00028100] 42a8 0018                 clr.l      24(a0)
[00028104] 42a8 001c                 clr.l      28(a0)
[00028108] 2079 000b f554            movea.l    $000BF554,a0
[0002810e] 2050                      movea.l    (a0),a0
[00028110] 4e90                      jsr        (a0)
[00028112] 4e75                      rts

ok:
[00028114] 48e7 003c                 movem.l    a2-a5,-(a7)
[00028118] 4fef ffce                 lea.l      -50(a7),a7
[0002811c] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00028122] 2052                      movea.l    (a2),a0
[00028124] 2268 0258                 movea.l    600(a0),a1
[00028128] 2669 0014                 movea.l    20(a1),a3
[0002812c] 2069 0014                 movea.l    20(a1),a0
[00028130] 2a68 003c                 movea.l    60(a0),a5
[00028134] 4eb9 0002 82dc            jsr        prepair
[0002813a] 49f9 0010 c47e            lea.l      parm,a4
[00028140] 2f2d 0004                 move.l     4(a5),-(a7)
[00028144] 43f9 000b f587            lea.l      $000BF587,a1
[0002814a] 204c                      movea.l    a4,a0
[0002814c] 4eb9 0008 15ac            jsr        sprintf
[00028152] 584f                      addq.w     #4,a7
[00028154] 2e8c                      move.l     a4,(a7)
[00028156] 2f7c 000b f57d 0004       move.l     #$000BF57D,4(a7)
[0002815e] 43ef 002e                 lea.l      46(a7),a1
[00028162] 7003                      moveq.l    #3,d0
[00028164] 41eb 00c0                 lea.l      192(a3),a0
[00028168] 4eb9 0006 a068            jsr        Auo_boxed
[0002816e] 206f 002e                 movea.l    46(a7),a0
[00028172] 1010                      move.b     (a0),d0
[00028174] 670c                      beq.s      ok_1
[00028176] 3f7c 0002 0008            move.w     #$0002,8(a7)
[0002817c] 2f48 000a                 move.l     a0,10(a7)
[00028180] 6008                      bra.s      ok_2
ok_1:
[00028182] 426f 0008                 clr.w      8(a7)
[00028186] 42af 000a                 clr.l      10(a7)
ok_2:
[0002818a] 42af 000e                 clr.l      14(a7)
[0002818e] 4240                      clr.w      d0
[00028190] 3f40 001c                 move.w     d0,28(a7)
[00028194] 3f40 0012                 move.w     d0,18(a7)
[00028198] 7200                      moveq.l    #0,d1
[0002819a] 2f41 001e                 move.l     d1,30(a7)
[0002819e] 2f41 0014                 move.l     d1,20(a7)
[000281a2] 7000                      moveq.l    #0,d0
[000281a4] 2f40 0022                 move.l     d0,34(a7)
[000281a8] 2f40 0018                 move.l     d0,24(a7)
[000281ac] 43ef 0026                 lea.l      38(a7),a1
[000281b0] 41eb 0300                 lea.l      768(a3),a0
[000281b4] 7003                      moveq.l    #3,d0
[000281b6] 4eb9 0006 a068            jsr        Auo_boxed
[000281bc] 206f 0026                 movea.l    38(a7),a0
[000281c0] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000281c6] 4a40                      tst.w      d0
[000281c8] 6704                      beq.s      ok_3
[000281ca] 42af 0026                 clr.l      38(a7)
ok_3:
[000281ce] 43ef 002a                 lea.l      42(a7),a1
[000281d2] 7003                      moveq.l    #3,d0
[000281d4] 41eb 0330                 lea.l      816(a3),a0
[000281d8] 4eb9 0006 a068            jsr        Auo_boxed
[000281de] 206f 002a                 movea.l    42(a7),a0
[000281e2] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000281e8] 4a40                      tst.w      d0
[000281ea] 6704                      beq.s      ok_4
[000281ec] 42af 002a                 clr.l      42(a7)
ok_4:
[000281f0] 2052                      movea.l    (a2),a0
[000281f2] 3228 0014                 move.w     20(a0),d1
[000281f6] 3428 0012                 move.w     18(a0),d2
[000281fa] 3002                      move.w     d2,d0
[000281fc] d040                      add.w      d0,d0
[000281fe] d042                      add.w      d2,d0
[00028200] d040                      add.w      d0,d0
[00028202] 41d7                      lea.l      (a7),a0
[00028204] 2279 000b f554            movea.l    $000BF554,a1
[0002820a] 2269 0004                 movea.l    4(a1),a1
[0002820e] 4e91                      jsr        (a1)
[00028210] 6100 fedc                 bsr        abort
[00028214] 4fef 0032                 lea.l      50(a7),a7
[00028218] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0002821c] 4e75                      rts

edcyc_outcol:
[0002821e] 2f0a                      move.l     a2,-(a7)
[00028220] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028226] 2268 025c                 movea.l    604(a0),a1
[0002822a] 2469 003c                 movea.l    60(a1),a2
[0002822e] 584a                      addq.w     #4,a2
[00028230] 7011                      moveq.l    #17,d0
[00028232] 3f00                      move.w     d0,-(a7)
[00028234] 7412                      moveq.l    #18,d2
[00028236] 720f                      moveq.l    #15,d1
[00028238] 700f                      moveq.l    #15,d0
[0002823a] c06a 0002                 and.w      2(a2),d0
[0002823e] 4eb9 0003 0bde            jsr        oe_colsel
[00028244] 544f                      addq.w     #2,a7
[00028246] 4a40                      tst.w      d0
[00028248] 6b2a                      bmi.s      edcyc_outcol_1
[0002824a] 72f0                      moveq.l    #-16,d1
[0002824c] c292                      and.l      (a2),d1
[0002824e] 3400                      move.w     d0,d2
[00028250] 48c2                      ext.l      d2
[00028252] 8282                      or.l       d2,d1
[00028254] 2481                      move.l     d1,(a2)
[00028256] 7001                      moveq.l    #1,d0
[00028258] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002825e] 2068 0258                 movea.l    600(a0),a0
[00028262] 2279 0010 ee4e            movea.l    ACSblk,a1
[00028268] 2469 0258                 movea.l    600(a1),a2
[0002826c] 226a 0066                 movea.l    102(a2),a1
[00028270] 72ff                      moveq.l    #-1,d1
[00028272] 4e91                      jsr        (a1)
edcyc_outcol_1:
[00028274] 245f                      movea.l    (a7)+,a2
[00028276] 4e75                      rts

edcyc_incol:
[00028278] 3f03                      move.w     d3,-(a7)
[0002827a] 2f0a                      move.l     a2,-(a7)
[0002827c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028282] 2268 025c                 movea.l    604(a0),a1
[00028286] 2469 003c                 movea.l    60(a1),a2
[0002828a] 584a                      addq.w     #4,a2
[0002828c] 7018                      moveq.l    #24,d0
[0002828e] 3f00                      move.w     d0,-(a7)
[00028290] 7419                      moveq.l    #25,d2
[00028292] 7216                      moveq.l    #22,d1
[00028294] 2012                      move.l     (a2),d0
[00028296] e880                      asr.l      #4,d0
[00028298] c07c 000f                 and.w      #$000F,d0
[0002829c] 4eb9 0003 0bde            jsr        oe_colsel
[000282a2] 544f                      addq.w     #2,a7
[000282a4] 3600                      move.w     d0,d3
[000282a6] 6b2e                      bmi.s      edcyc_incol_1
[000282a8] 2212                      move.l     (a2),d1
[000282aa] c2bc ffff ff0f            and.l      #$FFFFFF0F,d1
[000282b0] e948                      lsl.w      #4,d0
[000282b2] 48c0                      ext.l      d0
[000282b4] 8280                      or.l       d0,d1
[000282b6] 2481                      move.l     d1,(a2)
[000282b8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000282be] 2068 0258                 movea.l    600(a0),a0
[000282c2] 2279 0010 ee4e            movea.l    ACSblk,a1
[000282c8] 2469 0258                 movea.l    600(a1),a2
[000282cc] 226a 0066                 movea.l    102(a2),a1
[000282d0] 7001                      moveq.l    #1,d0
[000282d2] 72ff                      moveq.l    #-1,d1
[000282d4] 4e91                      jsr        (a1)
edcyc_incol_1:
[000282d6] 245f                      movea.l    (a7)+,a2
[000282d8] 361f                      move.w     (a7)+,d3
[000282da] 4e75                      rts

prepair:
[000282dc] 48e7 0038                 movem.l    a2-a4,-(a7)
[000282e0] 4fef fff0                 lea.l      -16(a7),a7
[000282e4] 45f9 0010 ee4e            lea.l      ACSblk,a2
[000282ea] 2052                      movea.l    (a2),a0
[000282ec] 2268 0258                 movea.l    600(a0),a1
[000282f0] 2069 0014                 movea.l    20(a1),a0
[000282f4] 2668 003c                 movea.l    60(a0),a3
[000282f8] 43ef 000a                 lea.l      10(a7),a1
[000282fc] 701b                      moveq.l    #27,d0
[000282fe] 4eb9 0005 11da            jsr        Aob_gettext
[00028304] 202b 0004                 move.l     4(a3),d0
[00028308] c0bc 0000 00ff            and.l      #$000000FF,d0
[0002830e] 122f 000a                 move.b     10(a7),d1
[00028312] 4881                      ext.w      d1
[00028314] 48c1                      ext.l      d1
[00028316] c2bc 0000 00ff            and.l      #$000000FF,d1
[0002831c] e189                      lsl.l      #8,d1
[0002831e] d081                      add.l      d1,d0
[00028320] 2740 0004                 move.l     d0,4(a3)
[00028324] 7201                      moveq.l    #1,d1
[00028326] 2052                      movea.l    (a2),a0
[00028328] 2268 0258                 movea.l    600(a0),a1
[0002832c] 2069 0014                 movea.l    20(a1),a0
[00028330] c268 00e2                 and.w      226(a0),d1
[00028334] 6708                      beq.s      prepair_1
[00028336] 00ab 0001 0000 0004       ori.l      #$00010000,4(a3)
prepair_1:
[0002833e] 43ef 000c                 lea.l      12(a7),a1
[00028342] 7003                      moveq.l    #3,d0
[00028344] 2052                      movea.l    (a2),a0
[00028346] 2068 0258                 movea.l    600(a0),a0
[0002834a] 2068 0014                 movea.l    20(a0),a0
[0002834e] 41e8 00c0                 lea.l      192(a0),a0
[00028352] 4eb9 0006 a068            jsr        Auo_boxed
[00028358] 2052                      movea.l    (a2),a0
[0002835a] 2ea8 0258                 move.l     600(a0),(a7)
[0002835e] 2268 0258                 movea.l    600(a0),a1
[00028362] 2069 0014                 movea.l    20(a1),a0
[00028366] 41e8 0030                 lea.l      48(a0),a0
[0002836a] 2f48 0004                 move.l     a0,4(a7)
[0002836e] 3f7c 0002 0008            move.w     #$0002,8(a7)
[00028374] 43d7                      lea.l      (a7),a1
[00028376] 7009                      moveq.l    #9,d0
[00028378] 286b 0008                 movea.l    8(a3),a4
[0002837c] 4e94                      jsr        (a4)
[0002837e] 226f 000c                 movea.l    12(a7),a1
[00028382] 303c 0190                 move.w     #$0190,d0
[00028386] 2052                      movea.l    (a2),a0
[00028388] 2868 0258                 movea.l    600(a0),a4
[0002838c] 206c 0014                 movea.l    20(a4),a0
[00028390] 41e8 0030                 lea.l      48(a0),a0
[00028394] 286b 0008                 movea.l    8(a3),a4
[00028398] 4e94                      jsr        (a4)
[0002839a] 93c9                      suba.l     a1,a1
[0002839c] 7005                      moveq.l    #5,d0
[0002839e] 2052                      movea.l    (a2),a0
[000283a0] 2868 0258                 movea.l    600(a0),a4
[000283a4] 206c 0014                 movea.l    20(a4),a0
[000283a8] 41e8 0030                 lea.l      48(a0),a0
[000283ac] 286b 0008                 movea.l    8(a3),a4
[000283b0] 4e94                      jsr        (a4)
[000283b2] 4fef 0010                 lea.l      16(a7),a7
[000283b6] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000283ba] 4e75                      rts

	.data

A_ADAPTCYC:
[000beb1a]                           dc.b '[2][ Dies ist wahrscheinlich ein| Objekt nach alter Definition.| Soll es auf den Standardwert| gesetzt werden?][OK| Abbruch ]',0
BUBBLE_01:
[000beb98]                           dc.b 'Die énderungen werden Åbernommen und Åberschreiben die alten Einstellungen.',0
BUBBLE_02:
[000bebe4]                           dc.b 'Die énderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
BUBBLE_03:
[000bec2f]                           dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_04:
[000bec81]                           dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
BUBBLE_05:
[000bed05]                           dc.b 'Hier wird das Zeichen eingegeben, das im Popup auf der rechten Seite beim Anklicken zum nÑchsten Wert blÑttert.',0
BUBBLE_06:
[000bed75]                           dc.b 'Dieser Button stellt das Beispiel-Popup links oben um auf den gerade eingegebenen Text. Damit kînnen Sie Ihr Popup direkt ausprobieren.',0
BUBBLE_07:
[000bedfd]                           dc.b 'Durch diese Checkbox kann die 3D-Darstellung ein- und ausgeschaltet werden. Das Ergebnis wird nach Klick auf den Button "Probe" am Beispiel-Popup oben links dargestellt.',0
TEXT_001:
[000beea7]                           dc.b 'Weiû|Rot|GrÅn|Blau|Gelb|TÅrkis|Lila|Schwarz',0
TEXT_005:
[000beed3]                           dc.b $4f
[000beed4]                           dc.w $4b00
TEXT_008:
[000beed6]                           dc.b 'Probe',0
TEXT_009:
[000beedc]                           dc.b 'Abbruch',0
TEXT_01:
[000beee4]                           dc.b '3D-Modus',0
TEXT_02:
[000beeed]                           dc.b 'Zyklus-Zeichen:',0
TEXT_05:
[000beefd]                           dc.b 'Sonstiges',0
TEXT_08:
[000bef07]                           dc.b 'BubbleGEM-Text',0
TEXT_09:
[000bef16]                           dc.b 'unten:',0
TEXT_10:
[000bef1d]                           dc.b 'Rahmen:',0
TEXT_16:
[000bef25]                           dc.b 'Context-Popup',0
TEXT_19:
[000bef33]                           dc.b 'oben:',0
TEXT_21:
[000bef39]                           dc.b 'links/',0
TEXT_22:
[000bef40]                           dc.b 'rechts/',0
help_title:
[000bef48]                           dc.b 'Der Cycle-Button-Editor',0
title:
[000bef60]                           dc.b 'CYCLEBUTTON -',0
A_3DBUTTON01:
[000bef6e] 00064a22                  dc.l A_3Dbutton
[000bef72]                           dc.w $a9f1
[000bef74]                           dc.w $01f8
[000bef76] 000630f2                  dc.l Auo_string
[000bef7a]                           dc.w $0000
[000bef7c]                           dc.w $0000
[000bef7e]                           dc.w $0000
[000bef80]                           dc.w $0000
[000bef82]                           dc.w $0000
[000bef84]                           dc.w $0000
[000bef86]                           dc.w $0000
[000bef88]                           dc.w $0000
[000bef8a]                           dc.w $0000
[000bef8c]                           dc.w $0000
A_3DBUTTON02:
[000bef8e] 00064a22                  dc.l A_3Dbutton
[000bef92]                           dc.w $21f1
[000bef94]                           dc.w $0178
[000bef96] 000630f2                  dc.l Auo_string
[000bef9a]                           dc.w $0000
[000bef9c]                           dc.w $0000
[000bef9e]                           dc.w $0000
[000befa0]                           dc.w $0000
[000befa2]                           dc.w $0000
[000befa4]                           dc.w $0000
[000befa6]                           dc.w $0000
[000befa8]                           dc.w $0000
[000befaa]                           dc.w $0000
[000befac]                           dc.w $0000
A_3DBUTTON03:
[000befae] 00064a22                  dc.l A_3Dbutton
[000befb2]                           dc.w $29c1
[000befb4]                           dc.w $0178
[000befb6] 000630f2                  dc.l Auo_string
[000befba] 000beed3                  dc.l TEXT_005
[000befbe]                           dc.w $0000
[000befc0]                           dc.w $0000
[000befc2]                           dc.w $0000
[000befc4]                           dc.w $0000
[000befc6] 000beb98                  dc.l BUBBLE_01
[000befca]                           dc.w $0000
[000befcc]                           dc.w $0000
A_3DBUTTON06:
[000befce] 00064a22                  dc.l A_3Dbutton
[000befd2]                           dc.w $29c1
[000befd4]                           dc.w $0178
[000befd6] 000630f2                  dc.l Auo_string
[000befda] 000beedc                  dc.l TEXT_009
[000befde]                           dc.w $0000
[000befe0]                           dc.w $0000
[000befe2]                           dc.w $0000
[000befe4]                           dc.w $0000
[000befe6] 000bebe4                  dc.l BUBBLE_02
[000befea]                           dc.w $0000
[000befec]                           dc.w $0000
A_3DBUTTON07:
[000befee] 00064a22                  dc.l A_3Dbutton
[000beff2]                           dc.w $29c1
[000beff4]                           dc.w $0178
[000beff6] 000630f2                  dc.l Auo_string
[000beffa] 000beed6                  dc.l TEXT_008
[000beffe]                           dc.w $0000
[000bf000]                           dc.w $0000
[000bf002]                           dc.w $0000
[000bf004]                           dc.w $0000
[000bf006] 000bed75                  dc.l BUBBLE_06
[000bf00a]                           dc.w $0000
[000bf00c]                           dc.w $0000
A_3DBUTTON27:
[000bf00e] 00064a22                  dc.l A_3Dbutton
[000bf012]                           dc.w $09f1
[000bf014]                           dc.w $0178
[000bf016] 000630f2                  dc.l Auo_string
[000bf01a]                           dc.w $0000
[000bf01c]                           dc.w $0000
[000bf01e]                           dc.w $0000
[000bf020]                           dc.w $0000
[000bf022]                           dc.w $0000
[000bf024]                           dc.w $0000
[000bf026]                           dc.w $0000
[000bf028]                           dc.w $0000
[000bf02a]                           dc.w $0000
[000bf02c]                           dc.w $0000
A_ARROWS02:
[000bf02e] 00065c72                  dc.l A_arrows
[000bf032]                           dc.w $1301
[000bf034]                           dc.w $0001
[000bf036]                           dc.w $0000
[000bf038]                           dc.w $0000
[000bf03a]                           dc.w $0000
[000bf03c]                           dc.w $0000
[000bf03e]                           dc.w $0000
[000bf040]                           dc.w $0000
[000bf042]                           dc.w $0000
[000bf044]                           dc.w $0000
[000bf046]                           dc.w $0000
[000bf048]                           dc.w $0000
[000bf04a]                           dc.w $0000
[000bf04c]                           dc.w $0000
A_BOXED01:
[000bf04e] 0006afea                  dc.l A_boxed
[000bf052]                           dc.w $9000
[000bf054]                           dc.w $0112
[000bf056] 0006a068                  dc.l Auo_boxed
[000bf05a]                           dc.w $0000
[000bf05c]                           dc.w $0000
[000bf05e]                           dc.w $0000
[000bf060]                           dc.w $0000
[000bf062]                           dc.w $0000
[000bf064]                           dc.w $0000
[000bf066] 000bed05                  dc.l BUBBLE_05
[000bf06a]                           dc.w $0000
[000bf06c]                           dc.w $0000
A_BOXED02:
[000bf06e] 0006afea                  dc.l A_boxed
[000bf072]                           dc.w $9000
[000bf074]                           dc.w $ff12
[000bf076] 0006a068                  dc.l Auo_boxed
[000bf07a]                           dc.w $0000
[000bf07c]                           dc.w $0000
[000bf07e]                           dc.w $0000
[000bf080]                           dc.w $0000
[000bf082]                           dc.w $0000
[000bf084]                           dc.w $0000
[000bf086]                           dc.w $0000
[000bf088]                           dc.w $0000
[000bf08a]                           dc.w $0000
[000bf08c]                           dc.w $0000
A_BOXED04:
[000bf08e] 0006afea                  dc.l A_boxed
[000bf092]                           dc.w $9038
[000bf094]                           dc.w $ff12
[000bf096] 0006a068                  dc.l Auo_boxed
[000bf09a]                           dc.w $0000
[000bf09c]                           dc.w $0000
[000bf09e]                           dc.w $0000
[000bf0a0]                           dc.w $0000
[000bf0a2]                           dc.w $0000
[000bf0a4]                           dc.w $0000
[000bf0a6] 000bec2f                  dc.l BUBBLE_03
[000bf0aa]                           dc.w $0000
[000bf0ac]                           dc.w $0000
A_BOXED05:
[000bf0ae] 0006afea                  dc.l A_boxed
[000bf0b2]                           dc.w $9038
[000bf0b4]                           dc.w $ff12
[000bf0b6] 0006a068                  dc.l Auo_boxed
[000bf0ba]                           dc.w $0000
[000bf0bc]                           dc.w $0000
[000bf0be]                           dc.w $0000
[000bf0c0]                           dc.w $0000
[000bf0c2]                           dc.w $0000
[000bf0c4]                           dc.w $0000
[000bf0c6] 000bec81                  dc.l BUBBLE_04
[000bf0ca]                           dc.w $0000
[000bf0cc]                           dc.w $0000
A_CHECKBOX01:
[000bf0ce] 0006323e                  dc.l A_checkbox
[000bf0d2]                           dc.w $0000
[000bf0d4]                           dc.w $0001
[000bf0d6] 000630f2                  dc.l Auo_string
[000bf0da] 000beee4                  dc.l TEXT_01
[000bf0de]                           dc.w $0000
[000bf0e0]                           dc.w $0000
[000bf0e2]                           dc.w $0000
[000bf0e4]                           dc.w $0000
[000bf0e6] 000bedfd                  dc.l BUBBLE_07
[000bf0ea]                           dc.w $0000
[000bf0ec]                           dc.w $0000
A_INNERFRAME01:
[000bf0ee] 00064256                  dc.l A_innerframe
[000bf0f2]                           dc.w $1000
[000bf0f4]                           dc.w $8f19
[000bf0f6] 000630f2                  dc.l Auo_string
[000bf0fa] 000bef1d                  dc.l TEXT_10
[000bf0fe]                           dc.w $0000
[000bf100]                           dc.w $0000
[000bf102]                           dc.w $0000
[000bf104]                           dc.w $0000
[000bf106]                           dc.w $0000
[000bf108]                           dc.w $0000
[000bf10a]                           dc.w $0000
[000bf10c]                           dc.w $0000
A_INNERFRAME03:
[000bf10e] 00064256                  dc.l A_innerframe
[000bf112]                           dc.w $1800
[000bf114]                           dc.w $8f19
[000bf116] 000630f2                  dc.l Auo_string
[000bf11a] 000beefd                  dc.l TEXT_05
[000bf11e]                           dc.w $0000
[000bf120]                           dc.w $0000
[000bf122]                           dc.w $0000
[000bf124]                           dc.w $0000
[000bf126]                           dc.w $0000
[000bf128]                           dc.w $0000
[000bf12a]                           dc.w $0000
[000bf12c]                           dc.w $0000
A_cycle002:
[000bf12e] 00066c46                  dc.l A_cycle
[000bf132]                           dc.w $0001
[000bf134]                           dc.w $0290
[000bf136] 00067456                  dc.l Auo_cycle
[000bf13a] 000beea7                  dc.l TEXT_001
[000bf13e]                           dc.w $0000
[000bf140]                           dc.w $0000
[000bf142]                           dc.w $0000
[000bf144]                           dc.w $0000
[000bf146]                           dc.w $0000
[000bf148]                           dc.w $0000
[000bf14a]                           dc.w $0000
[000bf14c]                           dc.w $0000
ED_CYCLE:
[000bf14e]                           dc.w $ffff
[000bf150]                           dc.w $0001
[000bf152]                           dc.w $001e
[000bf154]                           dc.w $0018
[000bf156]                           dc.w $0040
[000bf158]                           dc.w $0010
[000bf15a] 000bef8e                  dc.l A_3DBUTTON02
[000bf15e]                           dc.w $0000
[000bf160]                           dc.w $0000
[000bf162]                           dc.w $0033
[000bf164]                           dc.w $0013
_01_ED_CYCLE:
[000bf166]                           dc.w $0004
[000bf168]                           dc.w $0002
[000bf16a]                           dc.w $0002
[000bf16c]                           dc.w $0018
[000bf16e]                           dc.w $0000
[000bf170]                           dc.w $0010
[000bf172] 000bef6e                  dc.l A_3DBUTTON01
[000bf176]                           dc.w $0000
[000bf178]                           dc.w $0000
[000bf17a]                           dc.w $0016
[000bf17c]                           dc.w $0003
_02_ED_CYCLE:
[000bf17e]                           dc.w $0001
[000bf180]                           dc.w $ffff
[000bf182]                           dc.w $ffff
[000bf184]                           dc.w $0018
[000bf186]                           dc.w $0040
[000bf188]                           dc.w $0000
[000bf18a] 000bf12e                  dc.l A_cycle002
[000bf18e]                           dc.w $0001
[000bf190]                           dc.w $0001
[000bf192]                           dc.w $0014
[000bf194]                           dc.w $0001
_02aED_CYCLE:
[000bf196] 00067ca4                  dc.l Aus_cycle
[000bf19a]                           dc.w $0000
[000bf19c]                           dc.w $0000
[000bf19e]                           dc.w $8000
[000bf1a0]                           dc.w $0000
[000bf1a2]                           dc.w $0000
[000bf1a4]                           dc.w $0000
[000bf1a6]                           dc.w $0000
[000bf1a8]                           dc.w $0000
[000bf1aa]                           dc.w $0000
[000bf1ac]                           dc.w $0000
_04_ED_CYCLE:
[000bf1ae]                           dc.w $0006
[000bf1b0]                           dc.w $ffff
[000bf1b2]                           dc.w $ffff
[000bf1b4]                           dc.w $0018
[000bf1b6]                           dc.w $4007
[000bf1b8]                           dc.w $0010
[000bf1ba] 000befae                  dc.l A_3DBUTTON03
[000bf1be]                           dc.w $0018
[000bf1c0]                           dc.w $0001
[000bf1c2]                           dc.w $000c
[000bf1c4]                           dc.w $0002
_04aED_CYCLE:
[000bf1c6] 00028114                  dc.l ok
[000bf1ca]                           dc.w $0000
[000bf1cc]                           dc.w $0000
[000bf1ce]                           dc.w $8000
[000bf1d0]                           dc.w $884f
[000bf1d2]                           dc.w $0000
[000bf1d4]                           dc.w $0000
[000bf1d6]                           dc.w $0000
[000bf1d8]                           dc.w $0000
[000bf1da]                           dc.w $0000
[000bf1dc]                           dc.w $0000
_06_ED_CYCLE:
[000bf1de]                           dc.w $0008
[000bf1e0]                           dc.w $ffff
[000bf1e2]                           dc.w $ffff
[000bf1e4]                           dc.w $0018
[000bf1e6]                           dc.w $4005
[000bf1e8]                           dc.w $0010
[000bf1ea] 000befce                  dc.l A_3DBUTTON06
[000bf1ee]                           dc.w $0026
[000bf1f0]                           dc.w $0001
[000bf1f2]                           dc.w $000c
[000bf1f4]                           dc.w $0002
_06aED_CYCLE:
[000bf1f6] 000280ee                  dc.l abort
[000bf1fa]                           dc.w $0000
[000bf1fc]                           dc.w $0000
[000bf1fe]                           dc.w $8000
[000bf200]                           dc.w $8841
[000bf202]                           dc.w $0000
[000bf204]                           dc.w $0000
[000bf206]                           dc.w $0000
[000bf208]                           dc.w $0000
[000bf20a]                           dc.w $0000
[000bf20c]                           dc.w $0000
_08_ED_CYCLE:
[000bf20e]                           dc.w $0009
[000bf210]                           dc.w $ffff
[000bf212]                           dc.w $ffff
[000bf214]                           dc.w $0018
[000bf216]                           dc.w $0008
[000bf218]                           dc.w $0010
[000bf21a] 000bf06e                  dc.l A_BOXED02
[000bf21e]                           dc.w $0001
[000bf220]                           dc.w $0004
[000bf222]                           dc.w $0031
[000bf224]                           dc.w $0001
_09_ED_CYCLE:
[000bf226]                           dc.w $000b
[000bf228]                           dc.w $ffff
[000bf22a]                           dc.w $ffff
[000bf22c]                           dc.w $0018
[000bf22e]                           dc.w $0001
[000bf230]                           dc.w $0000
[000bf232] 000bf0ce                  dc.l A_CHECKBOX01
[000bf236]                           dc.w $0001
[000bf238]                           dc.w $0006
[000bf23a]                           dc.w $000b
[000bf23c]                           dc.w $0001
_09aED_CYCLE:
[000bf23e]                           dc.w $0000
[000bf240]                           dc.w $0000
[000bf242]                           dc.w $0000
[000bf244]                           dc.w $0000
[000bf246]                           dc.w $8000
[000bf248]                           dc.w $8844
[000bf24a]                           dc.w $0000
[000bf24c]                           dc.w $0000
[000bf24e]                           dc.w $0000
[000bf250]                           dc.w $0000
[000bf252]                           dc.w $0000
[000bf254]                           dc.w $0000
_11_ED_CYCLE:
[000bf256]                           dc.w $001a
[000bf258]                           dc.w $000c
[000bf25a]                           dc.w $0016
[000bf25c]                           dc.w $0018
[000bf25e]                           dc.w $0040
[000bf260]                           dc.w $0000
[000bf262] 000bf0ee                  dc.l A_INNERFRAME01
[000bf266]                           dc.w $0016
[000bf268]                           dc.w $0006
[000bf26a]                           dc.w $001c
[000bf26c]                           dc.w $0006
_12_ED_CYCLE:
[000bf26e]                           dc.w $000e
[000bf270]                           dc.w $000d
[000bf272]                           dc.w $000d
[000bf274]                           dc.w $001c
[000bf276]                           dc.w $0040
[000bf278]                           dc.w $0000
[000bf27a] 000bef39                  dc.l TEXT_21
[000bf27e]                           dc.w $0002
[000bf280]                           dc.w $0001
[000bf282]                           dc.w $0006
[000bf284]                           dc.w $0001
_13_ED_CYCLE:
[000bf286]                           dc.w $000c
[000bf288]                           dc.w $ffff
[000bf28a]                           dc.w $ffff
[000bf28c]                           dc.w $0018
[000bf28e]                           dc.w $0040
[000bf290]                           dc.w $0000
[000bf292] 000bf02e                  dc.l A_ARROWS02
[000bf296]                           dc.w $0000
[000bf298]                           dc.w $0000
[000bf29a]                           dc.w $0001
[000bf29c]                           dc.w $0001
_14_ED_CYCLE:
[000bf29e]                           dc.w $000f
[000bf2a0]                           dc.w $ffff
[000bf2a2]                           dc.w $ffff
[000bf2a4]                           dc.w $001c
[000bf2a6]                           dc.w $0040
[000bf2a8]                           dc.w $0000
[000bf2aa] 000bef33                  dc.l TEXT_19
[000bf2ae]                           dc.w $0003
[000bf2b0]                           dc.w $0002
[000bf2b2]                           dc.w $0005
[000bf2b4]                           dc.w $0001
_15_ED_CYCLE:
[000bf2b6]                           dc.w $0013
[000bf2b8]                           dc.w $0011
[000bf2ba]                           dc.w $0012
[000bf2bc]                           dc.w $0014
[000bf2be]                           dc.w $0040
[000bf2c0]                           dc.w $0020
[000bf2c2]                           dc.w $00ff
[000bf2c4]                           dc.w $1101
[000bf2c6]                           dc.w $0009
[000bf2c8]                           dc.w $0002
[000bf2ca]                           dc.w $0012
[000bf2cc]                           dc.w $0001
_15aED_CYCLE:
[000bf2ce] 0002821e                  dc.l edcyc_outcol
[000bf2d2]                           dc.w $0000
[000bf2d4]                           dc.w $0000
[000bf2d6]                           dc.w $8000
[000bf2d8]                           dc.w $884c
[000bf2da]                           dc.w $0000
[000bf2dc]                           dc.w $0000
[000bf2de]                           dc.w $0000
[000bf2e0]                           dc.w $0000
[000bf2e2]                           dc.w $0000
[000bf2e4]                           dc.w $0000
_17_ED_CYCLE:
[000bf2e6]                           dc.w $0012
[000bf2e8]                           dc.w $ffff
[000bf2ea]                           dc.w $ffff
[000bf2ec]                           dc.w $0014
[000bf2ee]                           dc.w $0000
[000bf2f0]                           dc.w $0000
[000bf2f2]                           dc.w $4301
[000bf2f4]                           dc.w $1371
[000bf2f6]                           dc.w $0010
[000bf2f8]                           dc.w $0000
[000bf2fa]                           dc.w $0002
[000bf2fc]                           dc.w $0001
_18_ED_CYCLE:
[000bf2fe]                           dc.w $000f
[000bf300]                           dc.w $ffff
[000bf302]                           dc.w $ffff
[000bf304]                           dc.w $0018
[000bf306]                           dc.w $0000
[000bf308]                           dc.w $0000
[000bf30a] 000bf00e                  dc.l A_3DBUTTON27
[000bf30e]                           dc.w $0000
[000bf310]                           dc.w $0000
[000bf312]                           dc.w $0010
[000bf314]                           dc.w $0001
_19_ED_CYCLE:
[000bf316]                           dc.w $0015
[000bf318]                           dc.w $0014
[000bf31a]                           dc.w $0014
[000bf31c]                           dc.w $001c
[000bf31e]                           dc.w $0040
[000bf320]                           dc.w $0000
[000bf322] 000bef40                  dc.l TEXT_22
[000bf326]                           dc.w $0001
[000bf328]                           dc.w $0003
[000bf32a]                           dc.w $0007
[000bf32c]                           dc.w $0001
_20_ED_CYCLE:
[000bf32e]                           dc.w $0013
[000bf330]                           dc.w $ffff
[000bf332]                           dc.w $ffff
[000bf334]                           dc.w $0018
[000bf336]                           dc.w $0040
[000bf338]                           dc.w $0000
[000bf33a] 000bf02e                  dc.l A_ARROWS02
[000bf33e]                           dc.w $0000
[000bf340]                           dc.w $0000
[000bf342]                           dc.w $0001
[000bf344]                           dc.w $0001
_21_ED_CYCLE:
[000bf346]                           dc.w $0016
[000bf348]                           dc.w $ffff
[000bf34a]                           dc.w $ffff
[000bf34c]                           dc.w $001c
[000bf34e]                           dc.w $0040
[000bf350]                           dc.w $0000
[000bf352] 000bef16                  dc.l TEXT_09
[000bf356]                           dc.w $0002
[000bf358]                           dc.w $0004
[000bf35a]                           dc.w $0006
[000bf35c]                           dc.w $0001
_22_ED_CYCLE:
[000bf35e]                           dc.w $000b
[000bf360]                           dc.w $0018
[000bf362]                           dc.w $0019
[000bf364]                           dc.w $0014
[000bf366]                           dc.w $0040
[000bf368]                           dc.w $0020
[000bf36a]                           dc.w $00ff
[000bf36c]                           dc.w $1101
[000bf36e]                           dc.w $0009
[000bf370]                           dc.w $0004
[000bf372]                           dc.w $0012
[000bf374]                           dc.w $0001
_22aED_CYCLE:
[000bf376] 00028278                  dc.l edcyc_incol
[000bf37a]                           dc.w $0000
[000bf37c]                           dc.w $0000
[000bf37e]                           dc.w $8000
[000bf380]                           dc.w $8852
[000bf382]                           dc.w $0000
[000bf384]                           dc.w $0000
[000bf386]                           dc.w $0000
[000bf388]                           dc.w $0000
[000bf38a]                           dc.w $0000
[000bf38c]                           dc.w $0000
_24_ED_CYCLE:
[000bf38e]                           dc.w $0019
[000bf390]                           dc.w $ffff
[000bf392]                           dc.w $ffff
[000bf394]                           dc.w $0014
[000bf396]                           dc.w $0000
[000bf398]                           dc.w $0000
[000bf39a]                           dc.w $4301
[000bf39c]                           dc.w $1371
[000bf39e]                           dc.w $0010
[000bf3a0]                           dc.w $0000
[000bf3a2]                           dc.w $0002
[000bf3a4]                           dc.w $0001
_25_ED_CYCLE:
[000bf3a6]                           dc.w $0016
[000bf3a8]                           dc.w $ffff
[000bf3aa]                           dc.w $ffff
[000bf3ac]                           dc.w $0018
[000bf3ae]                           dc.w $0000
[000bf3b0]                           dc.w $0000
[000bf3b2] 000bf00e                  dc.l A_3DBUTTON27
[000bf3b6]                           dc.w $0000
[000bf3b8]                           dc.w $0000
[000bf3ba]                           dc.w $0010
[000bf3bc]                           dc.w $0001
_26_ED_CYCLE:
[000bf3be]                           dc.w $001b
[000bf3c0]                           dc.w $ffff
[000bf3c2]                           dc.w $ffff
[000bf3c4]                           dc.w $001c
[000bf3c6]                           dc.w $0040
[000bf3c8]                           dc.w $0000
[000bf3ca] 000beeed                  dc.l TEXT_02
[000bf3ce]                           dc.w $0001
[000bf3d0]                           dc.w $0807
[000bf3d2]                           dc.w $000f
[000bf3d4]                           dc.w $0001
_27_ED_CYCLE:
[000bf3d6]                           dc.w $001c
[000bf3d8]                           dc.w $ffff
[000bf3da]                           dc.w $ffff
[000bf3dc]                           dc.w $0018
[000bf3de]                           dc.w $0008
[000bf3e0]                           dc.w $0010
[000bf3e2] 000bf04e                  dc.l A_BOXED01
[000bf3e6]                           dc.w $0011
[000bf3e8]                           dc.w $0807
[000bf3ea]                           dc.w $0001
[000bf3ec]                           dc.w $0001
_28_ED_CYCLE:
[000bf3ee]                           dc.w $001e
[000bf3f0]                           dc.w $ffff
[000bf3f2]                           dc.w $ffff
[000bf3f4]                           dc.w $0018
[000bf3f6]                           dc.w $0005
[000bf3f8]                           dc.w $0010
[000bf3fa] 000befee                  dc.l A_3DBUTTON07
[000bf3fe]                           dc.w $0001
[000bf400]                           dc.w $0009
[000bf402]                           dc.w $000b
[000bf404]                           dc.w $0002
_28aED_CYCLE:
[000bf406] 000282dc                  dc.l prepair
[000bf40a]                           dc.w $0000
[000bf40c]                           dc.w $0000
[000bf40e]                           dc.w $8000
[000bf410]                           dc.w $8850
[000bf412]                           dc.w $0000
[000bf414]                           dc.w $0000
[000bf416]                           dc.w $0000
[000bf418]                           dc.w $0000
[000bf41a]                           dc.w $0000
[000bf41c]                           dc.w $0000
_30_ED_CYCLE:
[000bf41e]                           dc.w $0000
[000bf420]                           dc.w $001f
[000bf422]                           dc.w $0022
[000bf424]                           dc.w $0018
[000bf426]                           dc.w $0040
[000bf428]                           dc.w $0000
[000bf42a] 000bf10e                  dc.l A_INNERFRAME03
[000bf42e]                           dc.w $0001
[000bf430]                           dc.w $000c
[000bf432]                           dc.w $0031
[000bf434]                           dc.w $0005
_31_ED_CYCLE:
[000bf436]                           dc.w $0020
[000bf438]                           dc.w $ffff
[000bf43a]                           dc.w $ffff
[000bf43c]                           dc.w $001c
[000bf43e]                           dc.w $0000
[000bf440]                           dc.w $0000
[000bf442] 000bef07                  dc.l TEXT_08
[000bf446]                           dc.w $0001
[000bf448]                           dc.w $0001
[000bf44a]                           dc.w $000e
[000bf44c]                           dc.w $0001
_32_ED_CYCLE:
[000bf44e]                           dc.w $0021
[000bf450]                           dc.w $ffff
[000bf452]                           dc.w $ffff
[000bf454]                           dc.w $0018
[000bf456]                           dc.w $0008
[000bf458]                           dc.w $0010
[000bf45a] 000bf08e                  dc.l A_BOXED04
[000bf45e]                           dc.w $0010
[000bf460]                           dc.w $0001
[000bf462]                           dc.w $0020
[000bf464]                           dc.w $0001
_33_ED_CYCLE:
[000bf466]                           dc.w $0022
[000bf468]                           dc.w $ffff
[000bf46a]                           dc.w $ffff
[000bf46c]                           dc.w $001c
[000bf46e]                           dc.w $0000
[000bf470]                           dc.w $0000
[000bf472] 000bef25                  dc.l TEXT_16
[000bf476]                           dc.w $0001
[000bf478]                           dc.w $0003
[000bf47a]                           dc.w $000d
[000bf47c]                           dc.w $0001
_34_ED_CYCLE:
[000bf47e]                           dc.w $001e
[000bf480]                           dc.w $ffff
[000bf482]                           dc.w $ffff
[000bf484]                           dc.w $0018
[000bf486]                           dc.w $0028
[000bf488]                           dc.w $0010
[000bf48a] 000bf0ae                  dc.l A_BOXED05
[000bf48e]                           dc.w $0010
[000bf490]                           dc.w $0003
[000bf492]                           dc.w $0020
[000bf494]                           dc.w $0001
cycle:
[000bf496] 00066c46                  dc.l A_cycle
[000bf49a]                           dc.w $0001
[000bf49c]                           dc.w $0290
[000bf49e] 00067456                  dc.l Auo_cycle
[000bf4a2] 000bf566                  dc.l $000bf566
[000bf4a6]                           dc.w $0000
[000bf4a8]                           dc.w $0000
[000bf4aa]                           dc.w $0000
[000bf4ac]                           dc.w $0000
[000bf4ae]                           dc.w $0000
[000bf4b0]                           dc.w $0000
[000bf4b2]                           dc.w $0000
[000bf4b4]                           dc.w $0000
visual:
[000bf4b6]                           dc.w $ffff
[000bf4b8]                           dc.w $ffff
[000bf4ba]                           dc.w $ffff
[000bf4bc]                           dc.w $0018
[000bf4be]                           dc.w $0000
[000bf4c0]                           dc.w $0030
[000bf4c2] 000bf496                  dc.l cycle
[000bf4c6]                           dc.w $0000
[000bf4c8]                           dc.w $0000
[000bf4ca]                           dc.w $000a
[000bf4cc]                           dc.w $0001
logical:
[000bf4ce]                           dc.w $ffff
[000bf4d0]                           dc.w $ffff
[000bf4d2]                           dc.w $ffff
[000bf4d4]                           dc.w $0018
[000bf4d6]                           dc.w $0040
[000bf4d8]                           dc.w $0030
[000bf4da]                           dc.w $0000
[000bf4dc]                           dc.w $0000
[000bf4de]                           dc.w $0000
[000bf4e0]                           dc.w $0000
[000bf4e2]                           dc.w $0006
[000bf4e4]                           dc.w $0001
aud:
[000bf4e6] 000bf574                  dc.l $000bf574
[000bf4ea] 000bf57d                  dc.l $000bf57d
[000bf4ee]                           dc.w $0002
[000bf4f0] 000bf566                  dc.l $000bf566
[000bf4f4]                           dc.w $0000
[000bf4f6]                           dc.w $0000
[000bf4f8]                           dc.w $0000
[000bf4fa]                           dc.w $0000
[000bf4fc]                           dc.w $0000
[000bf4fe]                           dc.w $0000
[000bf500]                           dc.w $0000
[000bf502]                           dc.w $0000
[000bf504]                           dc.w $0000
[000bf506]                           dc.w $0000
[000bf508]                           dc.w $0000
[000bf50a]                           dc.w $0000
[000bf50c]                           dc.w $0000
[000bf50e]                           dc.w $0000
[000bf510]                           dc.w $0000
[000bf512]                           dc.w $0000
data:
[000bf514]                           dc.b 'A_cycle',0
[000bf51c]                           dc.w $0000
[000bf51e]                           dc.w $0000
[000bf520]                           dc.w $0000
[000bf522]                           dc.w $0000
[000bf524]                           dc.w $0000
[000bf526]                           dc.w $0000
[000bf528]                           dc.w $0000
[000bf52a]                           dc.w $0000
[000bf52c]                           dc.w $0000
[000bf52e]                           dc.w $0000
[000bf530]                           dc.w $0000
[000bf532]                           dc.w $0000
[000bf534] 00027e66                  dc.l object_tree
[000bf538] 0002806c                  dc.l test_it
[000bf53c] 00028114                  dc.l ok
[000bf540] 0004f20a                  dc.l Aob_delete
[000bf544] 000bf4b6                  dc.l visual
[000bf548] 000bf4ce                  dc.l logical
[000bf54c] 000bf4e6                  dc.l aud
[000bf550] 00027e42                  dc.l minsize
[000bf554]                           dc.w $0000
[000bf556]                           dc.w $0000
[000bf558] 000bef60                  dc.l title
[000bf55c] 000bef48                  dc.l help_title
[000bf560]                           dc.w $0000
[000bf562]                           dc.w $0000
[000bf564]                           dc.w $2000
[000bf566]                           dc.b 'Rot|GrÅn|Blau',0
[000bf574]                           dc.b '0x10290L',0
[000bf57d]                           dc.b 'Auo_cycle',0
[000bf587]                           dc.b '0x%lxL',0
