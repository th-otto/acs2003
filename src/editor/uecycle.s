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
[00027e90] 6606                      bne.s      $00027E98
[00027e92] 91c8                      suba.l     a0,a0
[00027e94] 6000 01cc                 bra        $00028062
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
[00027f12] 6618                      bne.s      $00027F2C
[00027f14] 41f9 000b eb1a            lea.l      A_ADAPTCYC,a0
[00027f1a] 7001                      moveq.l    #1,d0
[00027f1c] 4eb9 0005 a600            jsr        Awi_alert
[00027f22] 5340                      subq.w     #1,d0
[00027f24] 6606                      bne.s      $00027F2C
[00027f26] 2ebc 0001 0290            move.l     #$00010290,(a7)
[00027f2c] 2757 0004                 move.l     (a7),4(a3)
[00027f30] 0c6d 0002 0008            cmpi.w     #$0002,8(a5)
[00027f36] 6608                      bne.s      $00027F40
[00027f38] 2f6d 000a 0006            move.l     10(a5),6(a7)
[00027f3e] 6008                      bra.s      $00027F48
[00027f40] 2f7c 000b f573 0006       move.l     #$000BF573,6(a7)
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
[00027fe8] 6706                      beq.s      $00027FF0
[00027fea] 006a 0001 00e2            ori.w      #$0001,226(a2)
[00027ff0] 206a 030c                 movea.l    780(a2),a0
[00027ff4] 2768 000c 0018            move.l     12(a0),24(a3)
[00027ffa] 206d 0026                 movea.l    38(a5),a0
[00027ffe] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00028004] 4a40                      tst.w      d0
[00028006] 6712                      beq.s      $0002801A
[00028008] 43f9 000b f573            lea.l      $000BF573,a1
[0002800e] 7020                      moveq.l    #32,d0
[00028010] 204a                      movea.l    a2,a0
[00028012] 4eb9 0005 0fd8            jsr        Aob_puttext
[00028018] 600e                      bra.s      $00028028
[0002801a] 226d 0026                 movea.l    38(a5),a1
[0002801e] 7020                      moveq.l    #32,d0
[00028020] 204a                      movea.l    a2,a0
[00028022] 4eb9 0005 0fd8            jsr        Aob_puttext
[00028028] 206a 033c                 movea.l    828(a2),a0
[0002802c] 2768 000c 001c            move.l     12(a0),28(a3)
[00028032] 206d 002a                 movea.l    42(a5),a0
[00028036] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002803c] 4a40                      tst.w      d0
[0002803e] 6712                      beq.s      $00028052
[00028040] 43f9 000b f573            lea.l      $000BF573,a1
[00028046] 7022                      moveq.l    #34,d0
[00028048] 204a                      movea.l    a2,a0
[0002804a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00028050] 600e                      bra.s      $00028060
[00028052] 226d 002a                 movea.l    42(a5),a1
[00028056] 7022                      moveq.l    #34,d0
[00028058] 204a                      movea.l    a2,a0
[0002805a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00028060] 204a                      movea.l    a2,a0
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
[0002809c] 6608                      bne.s      $000280A6
[0002809e] 256b 000a 000c            move.l     10(a3),12(a2)
[000280a4] 6004                      bra.s      $000280AA
[000280a6] 42aa 000c                 clr.l      12(a2)
[000280aa] 7000                      moveq.l    #0,d0
[000280ac] 2540 0014                 move.l     d0,20(a2)
[000280b0] 2540 0010                 move.l     d0,16(a2)
[000280b4] 206b 0026                 movea.l    38(a3),a0
[000280b8] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000280be] 4a40                      tst.w      d0
[000280c0] 6704                      beq.s      $000280C6
[000280c2] 91c8                      suba.l     a0,a0
[000280c4] 6004                      bra.s      $000280CA
[000280c6] 206b 0026                 movea.l    38(a3),a0
[000280ca] 2548 0018                 move.l     a0,24(a2)
[000280ce] 206b 002a                 movea.l    42(a3),a0
[000280d2] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000280d8] 4a40                      tst.w      d0
[000280da] 6704                      beq.s      $000280E0
[000280dc] 91c8                      suba.l     a0,a0
[000280de] 6004                      bra.s      $000280E4
[000280e0] 206b 002a                 movea.l    42(a3),a0
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
[00028174] 670c                      beq.s      $00028182
[00028176] 3f7c 0002 0008            move.w     #$0002,8(a7)
[0002817c] 2f48 000a                 move.l     a0,10(a7)
[00028180] 6008                      bra.s      $0002818A
[00028182] 426f 0008                 clr.w      8(a7)
[00028186] 42af 000a                 clr.l      10(a7)
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
[000281c8] 6704                      beq.s      $000281CE
[000281ca] 42af 0026                 clr.l      38(a7)
[000281ce] 43ef 002a                 lea.l      42(a7),a1
[000281d2] 7003                      moveq.l    #3,d0
[000281d4] 41eb 0330                 lea.l      816(a3),a0
[000281d8] 4eb9 0006 a068            jsr        Auo_boxed
[000281de] 206f 002a                 movea.l    42(a7),a0
[000281e2] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000281e8] 4a40                      tst.w      d0
[000281ea] 6704                      beq.s      $000281F0
[000281ec] 42af 002a                 clr.l      42(a7)
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
[00028248] 6b2a                      bmi.s      $00028274
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
[000282a6] 6b2e                      bmi.s      $000282D6
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
[00028334] 6708                      beq.s      $0002833E
[00028336] 00ab 0001 0000 0004       ori.l      #$00010000,4(a3)
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
