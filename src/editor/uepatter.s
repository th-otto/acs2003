edpa_col:
[00028d64] 3f03                      move.w     d3,-(a7)
[00028d66] 2f0a                      move.l     a2,-(a7)
[00028d68] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028d6e] 2268 025c                 movea.l    604(a0),a1
[00028d72] 2469 003c                 movea.l    60(a1),a2
[00028d76] 584a                      addq.w     #4,a2
[00028d78] 700d                      moveq.l    #13,d0
[00028d7a] 3f00                      move.w     d0,-(a7)
[00028d7c] 740e                      moveq.l    #14,d2
[00028d7e] 720b                      moveq.l    #11,d1
[00028d80] 700f                      moveq.l    #15,d0
[00028d82] c06a 0002                 and.w      2(a2),d0
[00028d86] 4eb9 0003 0bde            jsr        oe_colsel
[00028d8c] 544f                      addq.w     #2,a7
[00028d8e] 3600                      move.w     d0,d3
[00028d90] 6b28                      bmi.s      $00028DBA
[00028d92] 72f0                      moveq.l    #-16,d1
[00028d94] c292                      and.l      (a2),d1
[00028d96] 48c0                      ext.l      d0
[00028d98] 8280                      or.l       d0,d1
[00028d9a] 2481                      move.l     d1,(a2)
[00028d9c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028da2] 2068 0258                 movea.l    600(a0),a0
[00028da6] 2279 0010 ee4e            movea.l    ACSblk,a1
[00028dac] 2469 0258                 movea.l    600(a1),a2
[00028db0] 226a 0066                 movea.l    102(a2),a1
[00028db4] 7001                      moveq.l    #1,d0
[00028db6] 72ff                      moveq.l    #-1,d1
[00028db8] 4e91                      jsr        (a1)
[00028dba] 245f                      movea.l    (a7)+,a2
[00028dbc] 361f                      move.w     (a7)+,d3
[00028dbe] 4e75                      rts
edpa_frame:
[00028dc0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028dc6] 2268 025c                 movea.l    604(a0),a1
[00028dca] 2069 003c                 movea.l    60(a1),a0
[00028dce] 0aa8 0020 0000 0004       eori.l     #$00200000,4(a0)
[00028dd6] 72ff                      moveq.l    #-1,d1
[00028dd8] 7002                      moveq.l    #2,d0
[00028dda] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028de0] 2068 0258                 movea.l    600(a0),a0
[00028de4] 2279 0010 ee4e            movea.l    ACSblk,a1
[00028dea] 2269 0258                 movea.l    600(a1),a1
[00028dee] 2269 0066                 movea.l    102(a1),a1
[00028df2] 4e91                      jsr        (a1)
[00028df4] 4e75                      rts
edpa_pattern:
[00028df6] 2f0a                      move.l     a2,-(a7)
[00028df8] 2f0b                      move.l     a3,-(a7)
[00028dfa] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00028e00] 2052                      movea.l    (a2),a0
[00028e02] 2268 025c                 movea.l    604(a0),a1
[00028e06] 2669 003c                 movea.l    60(a1),a3
[00028e0a] 584b                      addq.w     #4,a3
[00028e0c] 3228 0260                 move.w     608(a0),d1
[00028e10] 48c1                      ext.l      d1
[00028e12] 2001                      move.l     d1,d0
[00028e14] d080                      add.l      d0,d0
[00028e16] d081                      add.l      d1,d0
[00028e18] e788                      lsl.l      #3,d0
[00028e1a] 2071 080c                 movea.l    12(a1,d0.l),a0
[00028e1e] 243c 00df 0000            move.l     #$00DF0000,d2
[00028e24] c4a8 0004                 and.l      4(a0),d2
[00028e28] 2013                      move.l     (a3),d0
[00028e2a] c0bc ff20 ffff            and.l      #$FF20FFFF,d0
[00028e30] 8480                      or.l       d0,d2
[00028e32] 2682                      move.l     d2,(a3)
[00028e34] 72ff                      moveq.l    #-1,d1
[00028e36] 7002                      moveq.l    #2,d0
[00028e38] 2052                      movea.l    (a2),a0
[00028e3a] 2068 0258                 movea.l    600(a0),a0
[00028e3e] 2252                      movea.l    (a2),a1
[00028e40] 2669 0258                 movea.l    600(a1),a3
[00028e44] 226b 0066                 movea.l    102(a3),a1
[00028e48] 4e91                      jsr        (a1)
[00028e4a] 265f                      movea.l    (a7)+,a3
[00028e4c] 245f                      movea.l    (a7)+,a2
[00028e4e] 4e75                      rts

; start editor\uepatter.c

init_pattern:
[00028e50] 2f0a                      move.l     a2,-(a7)
[00028e52] 2f0b                      move.l     a3,-(a7)
[00028e54] 2448                      movea.l    a0,a2
[00028e56] 43f9 000c 14f8            lea.l      data,a1
[00028e5c] 303c 2329                 move.w     #$2329,d0
[00028e60] 266a 0004                 movea.l    4(a2),a3
[00028e64] 4e93                      jsr        (a3)
[00028e66] 265f                      movea.l    (a7)+,a3
[00028e68] 245f                      movea.l    (a7)+,a2
[00028e6a] 4e75                      rts
minsize:
[00028e6c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028e72] 32a8 0012                 move.w     18(a0),(a1)
[00028e76] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028e7c] 226f 0004                 movea.l    4(a7),a1
[00028e80] 32a8 0014                 move.w     20(a0),(a1)
[00028e84] 4e75                      rts
object_tree:
[00028e86] 48e7 0034                 movem.l    a2-a3/a5,-(a7)
[00028e8a] 594f                      subq.w     #4,a7
[00028e8c] 2a48                      movea.l    a0,a5
[00028e8e] 2649                      movea.l    a1,a3
[00028e90] 41f9 000c 0b1a            lea.l      ED_PATTERN,a0
[00028e96] 4eb9 0004 f064            jsr        Aob_create
[00028e9c] 2448                      movea.l    a0,a2
[00028e9e] 200a                      move.l     a2,d0
[00028ea0] 6700 0080                 beq        $00028F22
[00028ea4] 41ea 0030                 lea.l      48(a2),a0
[00028ea8] 7216                      moveq.l    #22,d1
[00028eaa] c26b 0008                 and.w      8(a3),d1
[00028eae] 8368 0008                 or.w       d1,8(a0)
[00028eb2] 723f                      moveq.l    #63,d1
[00028eb4] c26b 000a                 and.w      10(a3),d1
[00028eb8] 8368 000a                 or.w       d1,10(a0)
[00028ebc] 2668 000c                 movea.l    12(a0),a3
[00028ec0] 4857                      pea.l      (a7)
[00028ec2] 43f9 000c 1552            lea.l      $000C1552,a1
[00028ec8] 2055                      movea.l    (a5),a0
[00028eca] 4eb9 0008 1b26            jsr        sscanf
[00028ed0] 584f                      addq.w     #4,a7
[00028ed2] 2757 0004                 move.l     (a7),4(a3)
[00028ed6] 2017                      move.l     (a7),d0
[00028ed8] c0bc 0020 0000            and.l      #$00200000,d0
[00028ede] 6706                      beq.s      $00028EE6
[00028ee0] 006a 0001 00b2            ori.w      #$0001,178(a2)
[00028ee6] 700f                      moveq.l    #15,d0
[00028ee8] c06f 0002                 and.w      2(a7),d0
[00028eec] 48c0                      ext.l      d0
[00028eee] e588                      lsl.l      #2,d0
[00028ef0] 41f9 000c a6d0            lea.l      colour_text,a0
[00028ef6] 2270 0800                 movea.l    0(a0,d0.l),a1
[00028efa] 204a                      movea.l    a2,a0
[00028efc] 700e                      moveq.l    #14,d0
[00028efe] 4eb9 0005 0fd8            jsr        Aob_puttext
[00028f04] 700f                      moveq.l    #15,d0
[00028f06] c06f 0002                 and.w      2(a7),d0
[00028f0a] 026a fff0 0146            andi.w     #$FFF0,326(a2)
[00028f10] c07c 000f                 and.w      #$000F,d0
[00028f14] 816a 0146                 or.w       d0,326(a2)
[00028f18] 7000                      moveq.l    #0,d0
[00028f1a] 2740 001c                 move.l     d0,28(a3)
[00028f1e] 2740 0018                 move.l     d0,24(a3)
[00028f22] 204a                      movea.l    a2,a0
[00028f24] 584f                      addq.w     #4,a7
[00028f26] 4cdf 2c00                 movem.l    (a7)+,a2-a3/a5
[00028f2a] 4e75                      rts
test_it:
[00028f2c] 2f0a                      move.l     a2,-(a7)
[00028f2e] 2449                      movea.l    a1,a2
[00028f30] 22bc 0006 59ea            move.l     #A_pattern,(a1)
[00028f36] 486a 0004                 pea.l      4(a2)
[00028f3a] 43f9 000c 1552            lea.l      $000C1552,a1
[00028f40] 2050                      movea.l    (a0),a0
[00028f42] 4eb9 0008 1b26            jsr        sscanf
[00028f48] 584f                      addq.w     #4,a7
[00028f4a] 42aa 0008                 clr.l      8(a2)
[00028f4e] 7000                      moveq.l    #0,d0
[00028f50] 2540 0014                 move.l     d0,20(a2)
[00028f54] 2540 0010                 move.l     d0,16(a2)
[00028f58] 2540 000c                 move.l     d0,12(a2)
[00028f5c] 42aa 0018                 clr.l      24(a2)
[00028f60] 42aa 001c                 clr.l      28(a2)
[00028f64] 245f                      movea.l    (a7)+,a2
[00028f66] 4e75                      rts
abort:
[00028f68] 2079 000c 1538            movea.l    $000C1538,a0
[00028f6e] 2050                      movea.l    (a0),a0
[00028f70] 4e90                      jsr        (a0)
[00028f72] 4e75                      rts
ok:
[00028f74] 2f0a                      move.l     a2,-(a7)
[00028f76] 2f0b                      move.l     a3,-(a7)
[00028f78] 4fef ffd2                 lea.l      -46(a7),a7
[00028f7c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028f82] 2268 0258                 movea.l    600(a0),a1
[00028f86] 2069 0014                 movea.l    20(a1),a0
[00028f8a] 2668 003c                 movea.l    60(a0),a3
[00028f8e] 45f9 0010 c4c2            lea.l      parm,a2
[00028f94] 2f2b 0004                 move.l     4(a3),-(a7)
[00028f98] 43f9 000c 1552            lea.l      $000C1552,a1
[00028f9e] 204a                      movea.l    a2,a0
[00028fa0] 4eb9 0008 15ac            jsr        sprintf
[00028fa6] 584f                      addq.w     #4,a7
[00028fa8] 2e8a                      move.l     a2,(a7)
[00028faa] 2f7c 000c 1551 0004       move.l     #$000C1551,4(a7)
[00028fb2] 4240                      clr.w      d0
[00028fb4] 3f40 001c                 move.w     d0,28(a7)
[00028fb8] 3f40 0012                 move.w     d0,18(a7)
[00028fbc] 3f40 0008                 move.w     d0,8(a7)
[00028fc0] 7200                      moveq.l    #0,d1
[00028fc2] 2f41 001e                 move.l     d1,30(a7)
[00028fc6] 2f41 0014                 move.l     d1,20(a7)
[00028fca] 2f41 000a                 move.l     d1,10(a7)
[00028fce] 7000                      moveq.l    #0,d0
[00028fd0] 2f40 0022                 move.l     d0,34(a7)
[00028fd4] 2f40 0018                 move.l     d0,24(a7)
[00028fd8] 2f40 000e                 move.l     d0,14(a7)
[00028fdc] 42af 0026                 clr.l      38(a7)
[00028fe0] 42af 002a                 clr.l      42(a7)
[00028fe4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028fea] 3228 0014                 move.w     20(a0),d1
[00028fee] 3028 0012                 move.w     18(a0),d0
[00028ff2] 41d7                      lea.l      (a7),a0
[00028ff4] 2279 000c 1538            movea.l    $000C1538,a1
[00028ffa] 2269 0004                 movea.l    4(a1),a1
[00028ffe] 4e91                      jsr        (a1)
[00029000] 6100 ff66                 bsr        abort
[00029004] 4fef 002e                 lea.l      46(a7),a7
[00029008] 265f                      movea.l    (a7)+,a3
[0002900a] 245f                      movea.l    (a7)+,a2
[0002900c] 4e75                      rts
