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
[00028d90] 6b28                      bmi.s      edpa_col_1
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
edpa_col_1:
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
[00028ea0] 6700 0080                 beq        object_tree_1
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
[00028ede] 6706                      beq.s      object_tree_2
[00028ee0] 006a 0001 00b2            ori.w      #$0001,178(a2)
object_tree_2:
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
object_tree_1:
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

	.data

BUBBLE_01:
[000c03e4]                           dc.b 'Die énderungen werden Åbernommen und Åberschreiben die alten Einstellungen.',0
BUBBLE_02:
[000c0430]                           dc.b 'Die énderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
TEXT_005:
[000c047b]                           dc.b $4f
[000c047c]                           dc.w $4b00
TEXT_009:
[000c047e]                           dc.b 'Abbruch',0
TEXT_02:
[000c0486]                           dc.b 'Rahmen',0
TEXT_03:
[000c048d]                           dc.b 'Muster:',0
TEXT_11:
[000c0495]                           dc.b 'Farbe:',0
help_title:
[000c049c]                           dc.b 'Der Pattern-Editor',0
title:
[000c04af]                           dc.b 'PATTERN -',0
[000c04b9]                           dc.b $00
[000c04ba] 00064a22                  dc.l A_3Dbutton
[000c04be]                           dc.w $29c1
[000c04c0]                           dc.w $0178
[000c04c2] 000630f2                  dc.l Auo_string
[000c04c6] 000c047b                  dc.l TEXT_005
[000c04ca]                           dc.w $0000
[000c04cc]                           dc.w $0000
[000c04ce]                           dc.w $0000
[000c04d0]                           dc.w $0000
[000c04d2] 000c03e4                  dc.l BUBBLE_01
[000c04d6]                           dc.w $0000
[000c04d8]                           dc.w $0000
A_3DBUTTON04:
[000c04da] 00064a22                  dc.l A_3Dbutton
[000c04de]                           dc.w $29c1
[000c04e0]                           dc.w $0178
[000c04e2] 000630f2                  dc.l Auo_string
[000c04e6] 000c047e                  dc.l TEXT_009
[000c04ea]                           dc.w $0000
[000c04ec]                           dc.w $0000
[000c04ee]                           dc.w $0000
[000c04f0]                           dc.w $0000
[000c04f2] 000c0430                  dc.l BUBBLE_02
[000c04f6]                           dc.w $0000
[000c04f8]                           dc.w $0000
A_3DBUTTON06:
[000c04fa] 00064a22                  dc.l A_3Dbutton
[000c04fe]                           dc.w $21f1
[000c0500]                           dc.w $01f8
[000c0502] 000630f2                  dc.l Auo_string
[000c0506]                           dc.w $0000
[000c0508]                           dc.w $0000
[000c050a]                           dc.w $0000
[000c050c]                           dc.w $0000
[000c050e]                           dc.w $0000
[000c0510]                           dc.w $0000
[000c0512]                           dc.w $0000
[000c0514]                           dc.w $0000
[000c0516]                           dc.w $0000
[000c0518]                           dc.w $0000
A_3DBUTTON07:
[000c051a] 00064a22                  dc.l A_3Dbutton
[000c051e]                           dc.w $29f1
[000c0520]                           dc.w $01f8
[000c0522] 000630f2                  dc.l Auo_string
[000c0526]                           dc.w $0000
[000c0528]                           dc.w $0000
[000c052a]                           dc.w $0000
[000c052c]                           dc.w $0000
[000c052e]                           dc.w $0000
[000c0530]                           dc.w $0000
[000c0532]                           dc.w $0000
[000c0534]                           dc.w $0000
[000c0536]                           dc.w $0000
[000c0538]                           dc.w $0000
A_3DBUTTON27:
[000c053a] 00064a22                  dc.l A_3Dbutton
[000c053e]                           dc.w $09f1
[000c0540]                           dc.w $0178
[000c0542] 000630f2                  dc.l Auo_string
[000c0546]                           dc.w $0000
[000c0548]                           dc.w $0000
[000c054a]                           dc.w $0000
[000c054c]                           dc.w $0000
[000c054e]                           dc.w $0000
[000c0550]                           dc.w $0000
[000c0552]                           dc.w $0000
[000c0554]                           dc.w $0000
[000c0556]                           dc.w $0000
[000c0558]                           dc.w $0000
A_ARROWS02:
[000c055a] 00065c72                  dc.l A_arrows
[000c055e]                           dc.w $1301
[000c0560]                           dc.w $0001
[000c0562]                           dc.w $0000
[000c0564]                           dc.w $0000
[000c0566]                           dc.w $0000
[000c0568]                           dc.w $0000
[000c056a]                           dc.w $0000
[000c056c]                           dc.w $0000
[000c056e]                           dc.w $0000
[000c0570]                           dc.w $0000
[000c0572]                           dc.w $0000
[000c0574]                           dc.w $0000
[000c0576]                           dc.w $0000
[000c0578]                           dc.w $0000
A_CHECKBOX02:
[000c057a] 0006323e                  dc.l A_checkbox
[000c057e]                           dc.w $0000
[000c0580]                           dc.w $0001
[000c0582] 000630f2                  dc.l Auo_string
[000c0586] 000c0486                  dc.l TEXT_02
[000c058a]                           dc.w $0000
[000c058c]                           dc.w $0000
[000c058e]                           dc.w $0000
[000c0590]                           dc.w $0000
[000c0592]                           dc.w $0000
[000c0594]                           dc.w $0000
[000c0596]                           dc.w $0000
[000c0598]                           dc.w $0000
A_INNERFRAME02:
[000c059a] 00064256                  dc.l A_innerframe
[000c059e]                           dc.w $1800
[000c05a0]                           dc.w $8f19
[000c05a2] 000630f2                  dc.l Auo_string
[000c05a6] 000c048d                  dc.l TEXT_03
[000c05aa]                           dc.w $0000
[000c05ac]                           dc.w $0000
[000c05ae]                           dc.w $0000
[000c05b0]                           dc.w $0000
[000c05b2]                           dc.w $0000
[000c05b4]                           dc.w $0000
[000c05b6]                           dc.w $0000
[000c05b8]                           dc.w $0000
A_pattern001:
[000c05ba] 000659ea                  dc.l A_pattern
[000c05be]                           dc.w $0050
[000c05c0]                           dc.w $0001
[000c05c2]                           dc.w $0000
[000c05c4]                           dc.w $0000
[000c05c6]                           dc.w $0000
[000c05c8]                           dc.w $0000
[000c05ca]                           dc.w $0000
[000c05cc]                           dc.w $0000
[000c05ce]                           dc.w $0000
[000c05d0]                           dc.w $0000
[000c05d2]                           dc.w $0000
[000c05d4]                           dc.w $0000
[000c05d6]                           dc.w $0000
[000c05d8]                           dc.w $0000
USER_007:
[000c05da] 000659ea                  dc.l A_pattern
[000c05de]                           dc.w $0021
[000c05e0]                           dc.w $0001
[000c05e2]                           dc.w $0000
[000c05e4]                           dc.w $0000
[000c05e6]                           dc.w $0000
[000c05e8]                           dc.w $0000
[000c05ea]                           dc.w $0000
[000c05ec]                           dc.w $0000
[000c05ee]                           dc.w $0000
[000c05f0]                           dc.w $0000
[000c05f2]                           dc.w $0000
[000c05f4]                           dc.w $0000
[000c05f6]                           dc.w $0000
[000c05f8]                           dc.w $0000
USER_009:
[000c05fa] 000659ea                  dc.l A_pattern
[000c05fe]                           dc.w $0023
[000c0600]                           dc.w $0001
[000c0602]                           dc.w $0000
[000c0604]                           dc.w $0000
[000c0606]                           dc.w $0000
[000c0608]                           dc.w $0000
[000c060a]                           dc.w $0000
[000c060c]                           dc.w $0000
[000c060e]                           dc.w $0000
[000c0610]                           dc.w $0000
[000c0612]                           dc.w $0000
[000c0614]                           dc.w $0000
[000c0616]                           dc.w $0000
[000c0618]                           dc.w $0000
USER_012:
[000c061a] 000659ea                  dc.l A_pattern
[000c061e]                           dc.w $0022
[000c0620]                           dc.w $0001
[000c0622]                           dc.w $0000
[000c0624]                           dc.w $0000
[000c0626]                           dc.w $0000
[000c0628]                           dc.w $0000
[000c062a]                           dc.w $0000
[000c062c]                           dc.w $0000
[000c062e]                           dc.w $0000
[000c0630]                           dc.w $0000
[000c0632]                           dc.w $0000
[000c0634]                           dc.w $0000
[000c0636]                           dc.w $0000
[000c0638]                           dc.w $0000
USER_013:
[000c063a] 000659ea                  dc.l A_pattern
[000c063e]                           dc.w $0024
[000c0640]                           dc.w $0001
[000c0642]                           dc.w $0000
[000c0644]                           dc.w $0000
[000c0646]                           dc.w $0000
[000c0648]                           dc.w $0000
[000c064a]                           dc.w $0000
[000c064c]                           dc.w $0000
[000c064e]                           dc.w $0000
[000c0650]                           dc.w $0000
[000c0652]                           dc.w $0000
[000c0654]                           dc.w $0000
[000c0656]                           dc.w $0000
[000c0658]                           dc.w $0000
USER_014:
[000c065a] 000659ea                  dc.l A_pattern
[000c065e]                           dc.w $0025
[000c0660]                           dc.w $0001
[000c0662]                           dc.w $0000
[000c0664]                           dc.w $0000
[000c0666]                           dc.w $0000
[000c0668]                           dc.w $0000
[000c066a]                           dc.w $0000
[000c066c]                           dc.w $0000
[000c066e]                           dc.w $0000
[000c0670]                           dc.w $0000
[000c0672]                           dc.w $0000
[000c0674]                           dc.w $0000
[000c0676]                           dc.w $0000
[000c0678]                           dc.w $0000
USER_015:
[000c067a] 000659ea                  dc.l A_pattern
[000c067e]                           dc.w $0026
[000c0680]                           dc.w $0001
[000c0682]                           dc.w $0000
[000c0684]                           dc.w $0000
[000c0686]                           dc.w $0000
[000c0688]                           dc.w $0000
[000c068a]                           dc.w $0000
[000c068c]                           dc.w $0000
[000c068e]                           dc.w $0000
[000c0690]                           dc.w $0000
[000c0692]                           dc.w $0000
[000c0694]                           dc.w $0000
[000c0696]                           dc.w $0000
[000c0698]                           dc.w $0000
USER_016:
[000c069a] 000659ea                  dc.l A_pattern
[000c069e]                           dc.w $0027
[000c06a0]                           dc.w $0001
[000c06a2]                           dc.w $0000
[000c06a4]                           dc.w $0000
[000c06a6]                           dc.w $0000
[000c06a8]                           dc.w $0000
[000c06aa]                           dc.w $0000
[000c06ac]                           dc.w $0000
[000c06ae]                           dc.w $0000
[000c06b0]                           dc.w $0000
[000c06b2]                           dc.w $0000
[000c06b4]                           dc.w $0000
[000c06b6]                           dc.w $0000
[000c06b8]                           dc.w $0000
USER_017:
[000c06ba] 000659ea                  dc.l A_pattern
[000c06be]                           dc.w $0028
[000c06c0]                           dc.w $0001
[000c06c2]                           dc.w $0000
[000c06c4]                           dc.w $0000
[000c06c6]                           dc.w $0000
[000c06c8]                           dc.w $0000
[000c06ca]                           dc.w $0000
[000c06cc]                           dc.w $0000
[000c06ce]                           dc.w $0000
[000c06d0]                           dc.w $0000
[000c06d2]                           dc.w $0000
[000c06d4]                           dc.w $0000
[000c06d6]                           dc.w $0000
[000c06d8]                           dc.w $0000
USER_018:
[000c06da] 000659ea                  dc.l A_pattern
[000c06de]                           dc.w $0029
[000c06e0]                           dc.w $0001
[000c06e2]                           dc.w $0000
[000c06e4]                           dc.w $0000
[000c06e6]                           dc.w $0000
[000c06e8]                           dc.w $0000
[000c06ea]                           dc.w $0000
[000c06ec]                           dc.w $0000
[000c06ee]                           dc.w $0000
[000c06f0]                           dc.w $0000
[000c06f2]                           dc.w $0000
[000c06f4]                           dc.w $0000
[000c06f6]                           dc.w $0000
[000c06f8]                           dc.w $0000
USER_019:
[000c06fa] 000659ea                  dc.l A_pattern
[000c06fe]                           dc.w $002a
[000c0700]                           dc.w $0001
[000c0702]                           dc.w $0000
[000c0704]                           dc.w $0000
[000c0706]                           dc.w $0000
[000c0708]                           dc.w $0000
[000c070a]                           dc.w $0000
[000c070c]                           dc.w $0000
[000c070e]                           dc.w $0000
[000c0710]                           dc.w $0000
[000c0712]                           dc.w $0000
[000c0714]                           dc.w $0000
[000c0716]                           dc.w $0000
[000c0718]                           dc.w $0000
USER_020:
[000c071a] 000659ea                  dc.l A_pattern
[000c071e]                           dc.w $002b
[000c0720]                           dc.w $0001
[000c0722]                           dc.w $0000
[000c0724]                           dc.w $0000
[000c0726]                           dc.w $0000
[000c0728]                           dc.w $0000
[000c072a]                           dc.w $0000
[000c072c]                           dc.w $0000
[000c072e]                           dc.w $0000
[000c0730]                           dc.w $0000
[000c0732]                           dc.w $0000
[000c0734]                           dc.w $0000
[000c0736]                           dc.w $0000
[000c0738]                           dc.w $0000
USER_021:
[000c073a] 000659ea                  dc.l A_pattern
[000c073e]                           dc.w $002c
[000c0740]                           dc.w $0001
[000c0742]                           dc.w $0000
[000c0744]                           dc.w $0000
[000c0746]                           dc.w $0000
[000c0748]                           dc.w $0000
[000c074a]                           dc.w $0000
[000c074c]                           dc.w $0000
[000c074e]                           dc.w $0000
[000c0750]                           dc.w $0000
[000c0752]                           dc.w $0000
[000c0754]                           dc.w $0000
[000c0756]                           dc.w $0000
[000c0758]                           dc.w $0000
USER_022:
[000c075a] 000659ea                  dc.l A_pattern
[000c075e]                           dc.w $0061
[000c0760]                           dc.w $0001
[000c0762]                           dc.w $0000
[000c0764]                           dc.w $0000
[000c0766]                           dc.w $0000
[000c0768]                           dc.w $0000
[000c076a]                           dc.w $0000
[000c076c]                           dc.w $0000
[000c076e]                           dc.w $0000
[000c0770]                           dc.w $0000
[000c0772]                           dc.w $0000
[000c0774]                           dc.w $0000
[000c0776]                           dc.w $0000
[000c0778]                           dc.w $0000
USER_023:
[000c077a] 000659ea                  dc.l A_pattern
[000c077e]                           dc.w $0062
[000c0780]                           dc.w $0001
[000c0782]                           dc.w $0000
[000c0784]                           dc.w $0000
[000c0786]                           dc.w $0000
[000c0788]                           dc.w $0000
[000c078a]                           dc.w $0000
[000c078c]                           dc.w $0000
[000c078e]                           dc.w $0000
[000c0790]                           dc.w $0000
[000c0792]                           dc.w $0000
[000c0794]                           dc.w $0000
[000c0796]                           dc.w $0000
[000c0798]                           dc.w $0000
USER_024:
[000c079a] 000659ea                  dc.l A_pattern
[000c079e]                           dc.w $0063
[000c07a0]                           dc.w $0001
[000c07a2]                           dc.w $0000
[000c07a4]                           dc.w $0000
[000c07a6]                           dc.w $0000
[000c07a8]                           dc.w $0000
[000c07aa]                           dc.w $0000
[000c07ac]                           dc.w $0000
[000c07ae]                           dc.w $0000
[000c07b0]                           dc.w $0000
[000c07b2]                           dc.w $0000
[000c07b4]                           dc.w $0000
[000c07b6]                           dc.w $0000
[000c07b8]                           dc.w $0000
USER_025:
[000c07ba] 000659ea                  dc.l A_pattern
[000c07be]                           dc.w $0064
[000c07c0]                           dc.w $0001
[000c07c2]                           dc.w $0000
[000c07c4]                           dc.w $0000
[000c07c6]                           dc.w $0000
[000c07c8]                           dc.w $0000
[000c07ca]                           dc.w $0000
[000c07cc]                           dc.w $0000
[000c07ce]                           dc.w $0000
[000c07d0]                           dc.w $0000
[000c07d2]                           dc.w $0000
[000c07d4]                           dc.w $0000
[000c07d6]                           dc.w $0000
[000c07d8]                           dc.w $0000
USER_026:
[000c07da] 000659ea                  dc.l A_pattern
[000c07de]                           dc.w $0065
[000c07e0]                           dc.w $0001
[000c07e2]                           dc.w $0000
[000c07e4]                           dc.w $0000
[000c07e6]                           dc.w $0000
[000c07e8]                           dc.w $0000
[000c07ea]                           dc.w $0000
[000c07ec]                           dc.w $0000
[000c07ee]                           dc.w $0000
[000c07f0]                           dc.w $0000
[000c07f2]                           dc.w $0000
[000c07f4]                           dc.w $0000
[000c07f6]                           dc.w $0000
[000c07f8]                           dc.w $0000
USER_027:
[000c07fa] 000659ea                  dc.l A_pattern
[000c07fe]                           dc.w $0066
[000c0800]                           dc.w $0001
[000c0802]                           dc.w $0000
[000c0804]                           dc.w $0000
[000c0806]                           dc.w $0000
[000c0808]                           dc.w $0000
[000c080a]                           dc.w $0000
[000c080c]                           dc.w $0000
[000c080e]                           dc.w $0000
[000c0810]                           dc.w $0000
[000c0812]                           dc.w $0000
[000c0814]                           dc.w $0000
[000c0816]                           dc.w $0000
[000c0818]                           dc.w $0000
USER_028:
[000c081a] 000659ea                  dc.l A_pattern
[000c081e]                           dc.w $0067
[000c0820]                           dc.w $0001
[000c0822]                           dc.w $0000
[000c0824]                           dc.w $0000
[000c0826]                           dc.w $0000
[000c0828]                           dc.w $0000
[000c082a]                           dc.w $0000
[000c082c]                           dc.w $0000
[000c082e]                           dc.w $0000
[000c0830]                           dc.w $0000
[000c0832]                           dc.w $0000
[000c0834]                           dc.w $0000
[000c0836]                           dc.w $0000
[000c0838]                           dc.w $0000
USER_029:
[000c083a] 000659ea                  dc.l A_pattern
[000c083e]                           dc.w $0068
[000c0840]                           dc.w $0001
[000c0842]                           dc.w $0000
[000c0844]                           dc.w $0000
[000c0846]                           dc.w $0000
[000c0848]                           dc.w $0000
[000c084a]                           dc.w $0000
[000c084c]                           dc.w $0000
[000c084e]                           dc.w $0000
[000c0850]                           dc.w $0000
[000c0852]                           dc.w $0000
[000c0854]                           dc.w $0000
[000c0856]                           dc.w $0000
[000c0858]                           dc.w $0000
USER_030:
[000c085a] 000659ea                  dc.l A_pattern
[000c085e]                           dc.w $0069
[000c0860]                           dc.w $0001
[000c0862]                           dc.w $0000
[000c0864]                           dc.w $0000
[000c0866]                           dc.w $0000
[000c0868]                           dc.w $0000
[000c086a]                           dc.w $0000
[000c086c]                           dc.w $0000
[000c086e]                           dc.w $0000
[000c0870]                           dc.w $0000
[000c0872]                           dc.w $0000
[000c0874]                           dc.w $0000
[000c0876]                           dc.w $0000
[000c0878]                           dc.w $0000
USER_031:
[000c087a] 000659ea                  dc.l A_pattern
[000c087e]                           dc.w $006b
[000c0880]                           dc.w $0001
[000c0882]                           dc.w $0000
[000c0884]                           dc.w $0000
[000c0886]                           dc.w $0000
[000c0888]                           dc.w $0000
[000c088a]                           dc.w $0000
[000c088c]                           dc.w $0000
[000c088e]                           dc.w $0000
[000c0890]                           dc.w $0000
[000c0892]                           dc.w $0000
[000c0894]                           dc.w $0000
[000c0896]                           dc.w $0000
[000c0898]                           dc.w $0000
USER_032:
[000c089a] 000659ea                  dc.l A_pattern
[000c089e]                           dc.w $006a
[000c08a0]                           dc.w $0001
[000c08a2]                           dc.w $0000
[000c08a4]                           dc.w $0000
[000c08a6]                           dc.w $0000
[000c08a8]                           dc.w $0000
[000c08aa]                           dc.w $0000
[000c08ac]                           dc.w $0000
[000c08ae]                           dc.w $0000
[000c08b0]                           dc.w $0000
[000c08b2]                           dc.w $0000
[000c08b4]                           dc.w $0000
[000c08b6]                           dc.w $0000
[000c08b8]                           dc.w $0000
USER_033:
[000c08ba] 000659ea                  dc.l A_pattern
[000c08be]                           dc.w $006c
[000c08c0]                           dc.w $0001
[000c08c2]                           dc.w $0000
[000c08c4]                           dc.w $0000
[000c08c6]                           dc.w $0000
[000c08c8]                           dc.w $0000
[000c08ca]                           dc.w $0000
[000c08cc]                           dc.w $0000
[000c08ce]                           dc.w $0000
[000c08d0]                           dc.w $0000
[000c08d2]                           dc.w $0000
[000c08d4]                           dc.w $0000
[000c08d6]                           dc.w $0000
[000c08d8]                           dc.w $0000
USER_034:
[000c08da] 000659ea                  dc.l A_pattern
[000c08de]                           dc.w $006d
[000c08e0]                           dc.w $0001
[000c08e2]                           dc.w $0000
[000c08e4]                           dc.w $0000
[000c08e6]                           dc.w $0000
[000c08e8]                           dc.w $0000
[000c08ea]                           dc.w $0000
[000c08ec]                           dc.w $0000
[000c08ee]                           dc.w $0000
[000c08f0]                           dc.w $0000
[000c08f2]                           dc.w $0000
[000c08f4]                           dc.w $0000
[000c08f6]                           dc.w $0000
[000c08f8]                           dc.w $0000
USER_035:
[000c08fa] 000659ea                  dc.l A_pattern
[000c08fe]                           dc.w $006e
[000c0900]                           dc.w $0001
[000c0902]                           dc.w $0000
[000c0904]                           dc.w $0000
[000c0906]                           dc.w $0000
[000c0908]                           dc.w $0000
[000c090a]                           dc.w $0000
[000c090c]                           dc.w $0000
[000c090e]                           dc.w $0000
[000c0910]                           dc.w $0000
[000c0912]                           dc.w $0000
[000c0914]                           dc.w $0000
[000c0916]                           dc.w $0000
[000c0918]                           dc.w $0000
USER_036:
[000c091a] 000659ea                  dc.l A_pattern
[000c091e]                           dc.w $006f
[000c0920]                           dc.w $0001
[000c0922]                           dc.w $0000
[000c0924]                           dc.w $0000
[000c0926]                           dc.w $0000
[000c0928]                           dc.w $0000
[000c092a]                           dc.w $0000
[000c092c]                           dc.w $0000
[000c092e]                           dc.w $0000
[000c0930]                           dc.w $0000
[000c0932]                           dc.w $0000
[000c0934]                           dc.w $0000
[000c0936]                           dc.w $0000
[000c0938]                           dc.w $0000
USER_037:
[000c093a] 000659ea                  dc.l A_pattern
[000c093e]                           dc.w $0070
[000c0940]                           dc.w $0001
[000c0942]                           dc.w $0000
[000c0944]                           dc.w $0000
[000c0946]                           dc.w $0000
[000c0948]                           dc.w $0000
[000c094a]                           dc.w $0000
[000c094c]                           dc.w $0000
[000c094e]                           dc.w $0000
[000c0950]                           dc.w $0000
[000c0952]                           dc.w $0000
[000c0954]                           dc.w $0000
[000c0956]                           dc.w $0000
[000c0958]                           dc.w $0000
USER_038:
[000c095a] 000659ea                  dc.l A_pattern
[000c095e]                           dc.w $0071
[000c0960]                           dc.w $0001
[000c0962]                           dc.w $0000
[000c0964]                           dc.w $0000
[000c0966]                           dc.w $0000
[000c0968]                           dc.w $0000
[000c096a]                           dc.w $0000
[000c096c]                           dc.w $0000
[000c096e]                           dc.w $0000
[000c0970]                           dc.w $0000
[000c0972]                           dc.w $0000
[000c0974]                           dc.w $0000
[000c0976]                           dc.w $0000
[000c0978]                           dc.w $0000
USER_039:
[000c097a] 000659ea                  dc.l A_pattern
[000c097e]                           dc.w $0072
[000c0980]                           dc.w $0001
[000c0982]                           dc.w $0000
[000c0984]                           dc.w $0000
[000c0986]                           dc.w $0000
[000c0988]                           dc.w $0000
[000c098a]                           dc.w $0000
[000c098c]                           dc.w $0000
[000c098e]                           dc.w $0000
[000c0990]                           dc.w $0000
[000c0992]                           dc.w $0000
[000c0994]                           dc.w $0000
[000c0996]                           dc.w $0000
[000c0998]                           dc.w $0000
USER_040:
[000c099a] 000659ea                  dc.l A_pattern
[000c099e]                           dc.w $0073
[000c09a0]                           dc.w $0001
[000c09a2]                           dc.w $0000
[000c09a4]                           dc.w $0000
[000c09a6]                           dc.w $0000
[000c09a8]                           dc.w $0000
[000c09aa]                           dc.w $0000
[000c09ac]                           dc.w $0000
[000c09ae]                           dc.w $0000
[000c09b0]                           dc.w $0000
[000c09b2]                           dc.w $0000
[000c09b4]                           dc.w $0000
[000c09b6]                           dc.w $0000
[000c09b8]                           dc.w $0000
USER_041:
[000c09ba] 000659ea                  dc.l A_pattern
[000c09be]                           dc.w $0074
[000c09c0]                           dc.w $0001
[000c09c2]                           dc.w $0000
[000c09c4]                           dc.w $0000
[000c09c6]                           dc.w $0000
[000c09c8]                           dc.w $0000
[000c09ca]                           dc.w $0000
[000c09cc]                           dc.w $0000
[000c09ce]                           dc.w $0000
[000c09d0]                           dc.w $0000
[000c09d2]                           dc.w $0000
[000c09d4]                           dc.w $0000
[000c09d6]                           dc.w $0000
[000c09d8]                           dc.w $0000
USER_042:
[000c09da] 000659ea                  dc.l A_pattern
[000c09de]                           dc.w $0075
[000c09e0]                           dc.w $0001
[000c09e2]                           dc.w $0000
[000c09e4]                           dc.w $0000
[000c09e6]                           dc.w $0000
[000c09e8]                           dc.w $0000
[000c09ea]                           dc.w $0000
[000c09ec]                           dc.w $0000
[000c09ee]                           dc.w $0000
[000c09f0]                           dc.w $0000
[000c09f2]                           dc.w $0000
[000c09f4]                           dc.w $0000
[000c09f6]                           dc.w $0000
[000c09f8]                           dc.w $0000
USER_043:
[000c09fa] 000659ea                  dc.l A_pattern
[000c09fe]                           dc.w $0076
[000c0a00]                           dc.w $0001
[000c0a02]                           dc.w $0000
[000c0a04]                           dc.w $0000
[000c0a06]                           dc.w $0000
[000c0a08]                           dc.w $0000
[000c0a0a]                           dc.w $0000
[000c0a0c]                           dc.w $0000
[000c0a0e]                           dc.w $0000
[000c0a10]                           dc.w $0000
[000c0a12]                           dc.w $0000
[000c0a14]                           dc.w $0000
[000c0a16]                           dc.w $0000
[000c0a18]                           dc.w $0000
USER_044:
[000c0a1a] 000659ea                  dc.l A_pattern
[000c0a1e]                           dc.w $0077
[000c0a20]                           dc.w $0001
[000c0a22]                           dc.w $0000
[000c0a24]                           dc.w $0000
[000c0a26]                           dc.w $0000
[000c0a28]                           dc.w $0000
[000c0a2a]                           dc.w $0000
[000c0a2c]                           dc.w $0000
[000c0a2e]                           dc.w $0000
[000c0a30]                           dc.w $0000
[000c0a32]                           dc.w $0000
[000c0a34]                           dc.w $0000
[000c0a36]                           dc.w $0000
[000c0a38]                           dc.w $0000
USER_045:
[000c0a3a] 000659ea                  dc.l A_pattern
[000c0a3e]                           dc.w $0078
[000c0a40]                           dc.w $0001
[000c0a42]                           dc.w $0000
[000c0a44]                           dc.w $0000
[000c0a46]                           dc.w $0000
[000c0a48]                           dc.w $0000
[000c0a4a]                           dc.w $0000
[000c0a4c]                           dc.w $0000
[000c0a4e]                           dc.w $0000
[000c0a50]                           dc.w $0000
[000c0a52]                           dc.w $0000
[000c0a54]                           dc.w $0000
[000c0a56]                           dc.w $0000
[000c0a58]                           dc.w $0000
USER_046:
[000c0a5a] 000659ea                  dc.l A_pattern
[000c0a5e]                           dc.w $00a1
[000c0a60]                           dc.w $0001
[000c0a62]                           dc.w $0000
[000c0a64]                           dc.w $0000
[000c0a66]                           dc.w $0000
[000c0a68]                           dc.w $0000
[000c0a6a]                           dc.w $0000
[000c0a6c]                           dc.w $0000
[000c0a6e]                           dc.w $0000
[000c0a70]                           dc.w $0000
[000c0a72]                           dc.w $0000
[000c0a74]                           dc.w $0000
[000c0a76]                           dc.w $0000
[000c0a78]                           dc.w $0000
USER_047:
[000c0a7a] 000659ea                  dc.l A_pattern
[000c0a7e]                           dc.w $00a2
[000c0a80]                           dc.w $0001
[000c0a82]                           dc.w $0000
[000c0a84]                           dc.w $0000
[000c0a86]                           dc.w $0000
[000c0a88]                           dc.w $0000
[000c0a8a]                           dc.w $0000
[000c0a8c]                           dc.w $0000
[000c0a8e]                           dc.w $0000
[000c0a90]                           dc.w $0000
[000c0a92]                           dc.w $0000
[000c0a94]                           dc.w $0000
[000c0a96]                           dc.w $0000
[000c0a98]                           dc.w $0000
USER_048:
[000c0a9a] 000659ea                  dc.l A_pattern
[000c0a9e]                           dc.w $00a3
[000c0aa0]                           dc.w $0001
[000c0aa2]                           dc.w $0000
[000c0aa4]                           dc.w $0000
[000c0aa6]                           dc.w $0000
[000c0aa8]                           dc.w $0000
[000c0aaa]                           dc.w $0000
[000c0aac]                           dc.w $0000
[000c0aae]                           dc.w $0000
[000c0ab0]                           dc.w $0000
[000c0ab2]                           dc.w $0000
[000c0ab4]                           dc.w $0000
[000c0ab6]                           dc.w $0000
[000c0ab8]                           dc.w $0000
USER_049:
[000c0aba] 000659ea                  dc.l A_pattern
[000c0abe]                           dc.w $00a4
[000c0ac0]                           dc.w $0001
[000c0ac2]                           dc.w $0000
[000c0ac4]                           dc.w $0000
[000c0ac6]                           dc.w $0000
[000c0ac8]                           dc.w $0000
[000c0aca]                           dc.w $0000
[000c0acc]                           dc.w $0000
[000c0ace]                           dc.w $0000
[000c0ad0]                           dc.w $0000
[000c0ad2]                           dc.w $0000
[000c0ad4]                           dc.w $0000
[000c0ad6]                           dc.w $0000
[000c0ad8]                           dc.w $0000
USER_050:
[000c0ada] 000659ea                  dc.l A_pattern
[000c0ade]                           dc.w $00a5
[000c0ae0]                           dc.w $0001
[000c0ae2]                           dc.w $0000
[000c0ae4]                           dc.w $0000
[000c0ae6]                           dc.w $0000
[000c0ae8]                           dc.w $0000
[000c0aea]                           dc.w $0000
[000c0aec]                           dc.w $0000
[000c0aee]                           dc.w $0000
[000c0af0]                           dc.w $0000
[000c0af2]                           dc.w $0000
[000c0af4]                           dc.w $0000
[000c0af6]                           dc.w $0000
[000c0af8]                           dc.w $0000
USER_051:
[000c0afa] 000659ea                  dc.l A_pattern
[000c0afe]                           dc.w $00a6
[000c0b00]                           dc.w $0001
[000c0b02]                           dc.w $0000
[000c0b04]                           dc.w $0000
[000c0b06]                           dc.w $0000
[000c0b08]                           dc.w $0000
[000c0b0a]                           dc.w $0000
[000c0b0c]                           dc.w $0000
[000c0b0e]                           dc.w $0000
[000c0b10]                           dc.w $0000
[000c0b12]                           dc.w $0000
[000c0b14]                           dc.w $0000
[000c0b16]                           dc.w $0000
[000c0b18]                           dc.w $0000
ED_PATTERN:
[000c0b1a]                           dc.w $ffff
[000c0b1c]                           dc.w $0001
[000c0b1e]                           dc.w $000f
[000c0b20]                           dc.w $0018
[000c0b22]                           dc.w $0040
[000c0b24]                           dc.w $0010
[000c0b26] 000c04fa                  dc.l A_3DBUTTON06
[000c0b2a]                           dc.w $0000
[000c0b2c]                           dc.w $0000
[000c0b2e]                           dc.w $002e
[000c0b30]                           dc.w $000a
_01_ED_PATTERN:
[000c0b32]                           dc.w $0003
[000c0b34]                           dc.w $0002
[000c0b36]                           dc.w $0002
[000c0b38]                           dc.w $0018
[000c0b3a]                           dc.w $0040
[000c0b3c]                           dc.w $0010
[000c0b3e] 000c051a                  dc.l A_3DBUTTON07
[000c0b42]                           dc.w $0000
[000c0b44]                           dc.w $0000
[000c0b46]                           dc.w $000a
[000c0b48]                           dc.w $0003
_02_ED_PATTERN:
[000c0b4a]                           dc.w $0001
[000c0b4c]                           dc.w $ffff
[000c0b4e]                           dc.w $ffff
[000c0b50]                           dc.w $0018
[000c0b52]                           dc.w $0000
[000c0b54]                           dc.w $0000
[000c0b56] 000c05ba                  dc.l A_pattern001
[000c0b5a]                           dc.w $0001
[000c0b5c]                           dc.w $0001
[000c0b5e]                           dc.w $0008
[000c0b60]                           dc.w $0001
_03_ED_PATTERN:
[000c0b62]                           dc.w $0005
[000c0b64]                           dc.w $ffff
[000c0b66]                           dc.w $ffff
[000c0b68]                           dc.w $0018
[000c0b6a]                           dc.w $4007
[000c0b6c]                           dc.w $0010
[000c0b6e] 000c04ba                  dc.l A_3DBUTTON01
[000c0b72]                           dc.w $0013
[000c0b74]                           dc.w $0001
[000c0b76]                           dc.w $000c
[000c0b78]                           dc.w $0002
_03aED_PATTERN:
[000c0b7a] 00028f74                  dc.l ok
[000c0b7e]                           dc.w $0000
[000c0b80]                           dc.w $0000
[000c0b82]                           dc.w $8000
[000c0b84]                           dc.w $884f
[000c0b86]                           dc.w $0000
[000c0b88]                           dc.w $0000
[000c0b8a]                           dc.w $0000
[000c0b8c]                           dc.w $0000
[000c0b8e]                           dc.w $0000
[000c0b90]                           dc.w $0000
_05_ED_PATTERN:
[000c0b92]                           dc.w $0007
[000c0b94]                           dc.w $ffff
[000c0b96]                           dc.w $ffff
[000c0b98]                           dc.w $0018
[000c0b9a]                           dc.w $4005
[000c0b9c]                           dc.w $0010
[000c0b9e] 000c04da                  dc.l A_3DBUTTON04
[000c0ba2]                           dc.w $0021
[000c0ba4]                           dc.w $0001
[000c0ba6]                           dc.w $000c
[000c0ba8]                           dc.w $0002
_05aED_PATTERN:
[000c0baa] 00028f68                  dc.l abort
[000c0bae]                           dc.w $0000
[000c0bb0]                           dc.w $0000
[000c0bb2]                           dc.w $8000
[000c0bb4]                           dc.w $8841
[000c0bb6]                           dc.w $0000
[000c0bb8]                           dc.w $0000
[000c0bba]                           dc.w $0000
[000c0bbc]                           dc.w $0000
[000c0bbe]                           dc.w $0000
[000c0bc0]                           dc.w $0000
_07_ED_PATTERN:
[000c0bc2]                           dc.w $0009
[000c0bc4]                           dc.w $ffff
[000c0bc6]                           dc.w $ffff
[000c0bc8]                           dc.w $0018
[000c0bca]                           dc.w $0041
[000c0bcc]                           dc.w $0000
[000c0bce] 000c057a                  dc.l A_CHECKBOX02
[000c0bd2]                           dc.w $0002
[000c0bd4]                           dc.w $0004
[000c0bd6]                           dc.w $0009
[000c0bd8]                           dc.w $0001
_07aED_PATTERN:
[000c0bda] 00028dc0                  dc.l edpa_frame
[000c0bde]                           dc.w $0000
[000c0be0]                           dc.w $0000
[000c0be2]                           dc.w $8000
[000c0be4]                           dc.w $8852
[000c0be6]                           dc.w $0000
[000c0be8]                           dc.w $0000
[000c0bea]                           dc.w $0000
[000c0bec]                           dc.w $0000
[000c0bee]                           dc.w $0000
[000c0bf0]                           dc.w $0000
_09_ED_PATTERN:
[000c0bf2]                           dc.w $000b
[000c0bf4]                           dc.w $000a
[000c0bf6]                           dc.w $000a
[000c0bf8]                           dc.w $001c
[000c0bfa]                           dc.w $0040
[000c0bfc]                           dc.w $0000
[000c0bfe] 000c0495                  dc.l TEXT_11
[000c0c02]                           dc.w $0010
[000c0c04]                           dc.w $0004
[000c0c06]                           dc.w $0006
[000c0c08]                           dc.w $0001
_10_ED_PATTERN:
[000c0c0a]                           dc.w $0009
[000c0c0c]                           dc.w $ffff
[000c0c0e]                           dc.w $ffff
[000c0c10]                           dc.w $0018
[000c0c12]                           dc.w $0040
[000c0c14]                           dc.w $0000
[000c0c16] 000c055a                  dc.l A_ARROWS02
[000c0c1a]                           dc.w $0000
[000c0c1c]                           dc.w $0000
[000c0c1e]                           dc.w $0001
[000c0c20]                           dc.w $0001
_11_ED_PATTERN:
[000c0c22]                           dc.w $000f
[000c0c24]                           dc.w $000d
[000c0c26]                           dc.w $000e
[000c0c28]                           dc.w $0014
[000c0c2a]                           dc.w $0040
[000c0c2c]                           dc.w $0020
[000c0c2e]                           dc.w $00ff
[000c0c30]                           dc.w $1101
[000c0c32]                           dc.w $0017
[000c0c34]                           dc.w $0004
[000c0c36]                           dc.w $0012
[000c0c38]                           dc.w $0001
_11aED_PATTERN:
[000c0c3a] 00028d64                  dc.l edpa_col
[000c0c3e]                           dc.w $0000
[000c0c40]                           dc.w $0000
[000c0c42]                           dc.w $8000
[000c0c44]                           dc.w $8846
[000c0c46]                           dc.w $0000
[000c0c48]                           dc.w $0000
[000c0c4a]                           dc.w $0000
[000c0c4c]                           dc.w $0000
[000c0c4e]                           dc.w $0000
[000c0c50]                           dc.w $0000
_13_ED_PATTERN:
[000c0c52]                           dc.w $000e
[000c0c54]                           dc.w $ffff
[000c0c56]                           dc.w $ffff
[000c0c58]                           dc.w $0014
[000c0c5a]                           dc.w $0000
[000c0c5c]                           dc.w $0000
[000c0c5e]                           dc.w $0001
[000c0c60]                           dc.w $1171
[000c0c62]                           dc.w $0010
[000c0c64]                           dc.w $0000
[000c0c66]                           dc.w $0002
[000c0c68]                           dc.w $0001
_14_ED_PATTERN:
[000c0c6a]                           dc.w $000b
[000c0c6c]                           dc.w $ffff
[000c0c6e]                           dc.w $ffff
[000c0c70]                           dc.w $0018
[000c0c72]                           dc.w $0000
[000c0c74]                           dc.w $0000
[000c0c76] 000c053a                  dc.l A_3DBUTTON27
[000c0c7a]                           dc.w $0000
[000c0c7c]                           dc.w $0000
[000c0c7e]                           dc.w $0010
[000c0c80]                           dc.w $0001
_15_ED_PATTERN:
[000c0c82]                           dc.w $0000
[000c0c84]                           dc.w $0010
[000c0c86]                           dc.w $0062
[000c0c88]                           dc.w $0018
[000c0c8a]                           dc.w $0040
[000c0c8c]                           dc.w $0000
[000c0c8e] 000c059a                  dc.l A_INNERFRAME02
[000c0c92]                           dc.w $0001
[000c0c94]                           dc.w $0005
[000c0c96]                           dc.w $002c
[000c0c98]                           dc.w $0005
_16_ED_PATTERN:
[000c0c9a]                           dc.w $0012
[000c0c9c]                           dc.w $ffff
[000c0c9e]                           dc.w $ffff
[000c0ca0]                           dc.w $0018
[000c0ca2]                           dc.w $0005
[000c0ca4]                           dc.w $0000
[000c0ca6] 000c05da                  dc.l USER_007
[000c0caa]                           dc.w $0001
[000c0cac]                           dc.w $0001
[000c0cae]                           dc.w $0003
[000c0cb0]                           dc.w $0001
_16aED_PATTERN:
[000c0cb2] 00028df6                  dc.l edpa_pattern
[000c0cb6]                           dc.w $0000
[000c0cb8]                           dc.w $0000
[000c0cba]                           dc.w $8000
[000c0cbc]                           dc.w $0000
[000c0cbe]                           dc.w $0000
[000c0cc0]                           dc.w $0000
[000c0cc2]                           dc.w $0000
[000c0cc4]                           dc.w $0000
[000c0cc6]                           dc.w $0000
[000c0cc8]                           dc.w $0000
_18_ED_PATTERN:
[000c0cca]                           dc.w $0014
[000c0ccc]                           dc.w $ffff
[000c0cce]                           dc.w $ffff
[000c0cd0]                           dc.w $0018
[000c0cd2]                           dc.w $0005
[000c0cd4]                           dc.w $0000
[000c0cd6] 000c061a                  dc.l USER_012
[000c0cda]                           dc.w $0001
[000c0cdc]                           dc.w $0002
[000c0cde]                           dc.w $0003
[000c0ce0]                           dc.w $0001
_18aED_PATTERN:
[000c0ce2] 00028df6                  dc.l edpa_pattern
[000c0ce6]                           dc.w $0000
[000c0ce8]                           dc.w $0000
[000c0cea]                           dc.w $8000
[000c0cec]                           dc.w $0000
[000c0cee]                           dc.w $0000
[000c0cf0]                           dc.w $0000
[000c0cf2]                           dc.w $0000
[000c0cf4]                           dc.w $0000
[000c0cf6]                           dc.w $0000
[000c0cf8]                           dc.w $0000
_20_ED_PATTERN:
[000c0cfa]                           dc.w $0016
[000c0cfc]                           dc.w $ffff
[000c0cfe]                           dc.w $ffff
[000c0d00]                           dc.w $0018
[000c0d02]                           dc.w $0005
[000c0d04]                           dc.w $0000
[000c0d06] 000c05fa                  dc.l USER_009
[000c0d0a]                           dc.w $0001
[000c0d0c]                           dc.w $0003
[000c0d0e]                           dc.w $0003
[000c0d10]                           dc.w $0001
_20aED_PATTERN:
[000c0d12] 00028df6                  dc.l edpa_pattern
[000c0d16]                           dc.w $0000
[000c0d18]                           dc.w $0000
[000c0d1a]                           dc.w $8000
[000c0d1c]                           dc.w $0000
[000c0d1e]                           dc.w $0000
[000c0d20]                           dc.w $0000
[000c0d22]                           dc.w $0000
[000c0d24]                           dc.w $0000
[000c0d26]                           dc.w $0000
[000c0d28]                           dc.w $0000
_22_ED_PATTERN:
[000c0d2a]                           dc.w $0018
[000c0d2c]                           dc.w $ffff
[000c0d2e]                           dc.w $ffff
[000c0d30]                           dc.w $0018
[000c0d32]                           dc.w $0005
[000c0d34]                           dc.w $0000
[000c0d36] 000c063a                  dc.l USER_013
[000c0d3a]                           dc.w $0004
[000c0d3c]                           dc.w $0001
[000c0d3e]                           dc.w $0003
[000c0d40]                           dc.w $0001
_22aED_PATTERN:
[000c0d42] 00028df6                  dc.l edpa_pattern
[000c0d46]                           dc.w $0000
[000c0d48]                           dc.w $0000
[000c0d4a]                           dc.w $8000
[000c0d4c]                           dc.w $0000
[000c0d4e]                           dc.w $0000
[000c0d50]                           dc.w $0000
[000c0d52]                           dc.w $0000
[000c0d54]                           dc.w $0000
[000c0d56]                           dc.w $0000
[000c0d58]                           dc.w $0000
_24_ED_PATTERN:
[000c0d5a]                           dc.w $001a
[000c0d5c]                           dc.w $ffff
[000c0d5e]                           dc.w $ffff
[000c0d60]                           dc.w $0018
[000c0d62]                           dc.w $0005
[000c0d64]                           dc.w $0000
[000c0d66] 000c065a                  dc.l USER_014
[000c0d6a]                           dc.w $0004
[000c0d6c]                           dc.w $0002
[000c0d6e]                           dc.w $0003
[000c0d70]                           dc.w $0001
_24aED_PATTERN:
[000c0d72] 00028df6                  dc.l edpa_pattern
[000c0d76]                           dc.w $0000
[000c0d78]                           dc.w $0000
[000c0d7a]                           dc.w $8000
[000c0d7c]                           dc.w $0000
[000c0d7e]                           dc.w $0000
[000c0d80]                           dc.w $0000
[000c0d82]                           dc.w $0000
[000c0d84]                           dc.w $0000
[000c0d86]                           dc.w $0000
[000c0d88]                           dc.w $0000
_26_ED_PATTERN:
[000c0d8a]                           dc.w $001c
[000c0d8c]                           dc.w $ffff
[000c0d8e]                           dc.w $ffff
[000c0d90]                           dc.w $0018
[000c0d92]                           dc.w $0005
[000c0d94]                           dc.w $0000
[000c0d96] 000c067a                  dc.l USER_015
[000c0d9a]                           dc.w $0004
[000c0d9c]                           dc.w $0003
[000c0d9e]                           dc.w $0003
[000c0da0]                           dc.w $0001
_26aED_PATTERN:
[000c0da2] 00028df6                  dc.l edpa_pattern
[000c0da6]                           dc.w $0000
[000c0da8]                           dc.w $0000
[000c0daa]                           dc.w $8000
[000c0dac]                           dc.w $0000
[000c0dae]                           dc.w $0000
[000c0db0]                           dc.w $0000
[000c0db2]                           dc.w $0000
[000c0db4]                           dc.w $0000
[000c0db6]                           dc.w $0000
[000c0db8]                           dc.w $0000
_28_ED_PATTERN:
[000c0dba]                           dc.w $001e
[000c0dbc]                           dc.w $ffff
[000c0dbe]                           dc.w $ffff
[000c0dc0]                           dc.w $0018
[000c0dc2]                           dc.w $0005
[000c0dc4]                           dc.w $0000
[000c0dc6] 000c06fa                  dc.l USER_019
[000c0dca]                           dc.w $000a
[000c0dcc]                           dc.w $0001
[000c0dce]                           dc.w $0003
[000c0dd0]                           dc.w $0001
_28aED_PATTERN:
[000c0dd2] 00028df6                  dc.l edpa_pattern
[000c0dd6]                           dc.w $0000
[000c0dd8]                           dc.w $0000
[000c0dda]                           dc.w $8000
[000c0ddc]                           dc.w $0000
[000c0dde]                           dc.w $0000
[000c0de0]                           dc.w $0000
[000c0de2]                           dc.w $0000
[000c0de4]                           dc.w $0000
[000c0de6]                           dc.w $0000
[000c0de8]                           dc.w $0000
_30_ED_PATTERN:
[000c0dea]                           dc.w $0020
[000c0dec]                           dc.w $ffff
[000c0dee]                           dc.w $ffff
[000c0df0]                           dc.w $0018
[000c0df2]                           dc.w $0005
[000c0df4]                           dc.w $0000
[000c0df6] 000c071a                  dc.l USER_020
[000c0dfa]                           dc.w $000a
[000c0dfc]                           dc.w $0002
[000c0dfe]                           dc.w $0003
[000c0e00]                           dc.w $0001
_30aED_PATTERN:
[000c0e02] 00028df6                  dc.l edpa_pattern
[000c0e06]                           dc.w $0000
[000c0e08]                           dc.w $0000
[000c0e0a]                           dc.w $8000
[000c0e0c]                           dc.w $0000
[000c0e0e]                           dc.w $0000
[000c0e10]                           dc.w $0000
[000c0e12]                           dc.w $0000
[000c0e14]                           dc.w $0000
[000c0e16]                           dc.w $0000
[000c0e18]                           dc.w $0000
_32_ED_PATTERN:
[000c0e1a]                           dc.w $0022
[000c0e1c]                           dc.w $ffff
[000c0e1e]                           dc.w $ffff
[000c0e20]                           dc.w $0018
[000c0e22]                           dc.w $0005
[000c0e24]                           dc.w $0000
[000c0e26] 000c073a                  dc.l USER_021
[000c0e2a]                           dc.w $000a
[000c0e2c]                           dc.w $0003
[000c0e2e]                           dc.w $0003
[000c0e30]                           dc.w $0001
_32aED_PATTERN:
[000c0e32] 00028df6                  dc.l edpa_pattern
[000c0e36]                           dc.w $0000
[000c0e38]                           dc.w $0000
[000c0e3a]                           dc.w $8000
[000c0e3c]                           dc.w $0000
[000c0e3e]                           dc.w $0000
[000c0e40]                           dc.w $0000
[000c0e42]                           dc.w $0000
[000c0e44]                           dc.w $0000
[000c0e46]                           dc.w $0000
[000c0e48]                           dc.w $0000
_34_ED_PATTERN:
[000c0e4a]                           dc.w $0024
[000c0e4c]                           dc.w $ffff
[000c0e4e]                           dc.w $ffff
[000c0e50]                           dc.w $0018
[000c0e52]                           dc.w $0005
[000c0e54]                           dc.w $0000
[000c0e56] 000c06ba                  dc.l USER_017
[000c0e5a]                           dc.w $0007
[000c0e5c]                           dc.w $0002
[000c0e5e]                           dc.w $0003
[000c0e60]                           dc.w $0001
_34aED_PATTERN:
[000c0e62] 00028df6                  dc.l edpa_pattern
[000c0e66]                           dc.w $0000
[000c0e68]                           dc.w $0000
[000c0e6a]                           dc.w $8000
[000c0e6c]                           dc.w $0000
[000c0e6e]                           dc.w $0000
[000c0e70]                           dc.w $0000
[000c0e72]                           dc.w $0000
[000c0e74]                           dc.w $0000
[000c0e76]                           dc.w $0000
[000c0e78]                           dc.w $0000
_36_ED_PATTERN:
[000c0e7a]                           dc.w $0026
[000c0e7c]                           dc.w $ffff
[000c0e7e]                           dc.w $ffff
[000c0e80]                           dc.w $0018
[000c0e82]                           dc.w $0005
[000c0e84]                           dc.w $0000
[000c0e86] 000c06da                  dc.l USER_018
[000c0e8a]                           dc.w $0007
[000c0e8c]                           dc.w $0003
[000c0e8e]                           dc.w $0003
[000c0e90]                           dc.w $0001
_36aED_PATTERN:
[000c0e92] 00028df6                  dc.l edpa_pattern
[000c0e96]                           dc.w $0000
[000c0e98]                           dc.w $0000
[000c0e9a]                           dc.w $8000
[000c0e9c]                           dc.w $0000
[000c0e9e]                           dc.w $0000
[000c0ea0]                           dc.w $0000
[000c0ea2]                           dc.w $0000
[000c0ea4]                           dc.w $0000
[000c0ea6]                           dc.w $0000
[000c0ea8]                           dc.w $0000
_38_ED_PATTERN:
[000c0eaa]                           dc.w $0028
[000c0eac]                           dc.w $ffff
[000c0eae]                           dc.w $ffff
[000c0eb0]                           dc.w $0018
[000c0eb2]                           dc.w $0005
[000c0eb4]                           dc.w $0000
[000c0eb6] 000c069a                  dc.l USER_016
[000c0eba]                           dc.w $0007
[000c0ebc]                           dc.w $0001
[000c0ebe]                           dc.w $0003
[000c0ec0]                           dc.w $0001
_38aED_PATTERN:
[000c0ec2] 00028df6                  dc.l edpa_pattern
[000c0ec6]                           dc.w $0000
[000c0ec8]                           dc.w $0000
[000c0eca]                           dc.w $8000
[000c0ecc]                           dc.w $0000
[000c0ece]                           dc.w $0000
[000c0ed0]                           dc.w $0000
[000c0ed2]                           dc.w $0000
[000c0ed4]                           dc.w $0000
[000c0ed6]                           dc.w $0000
[000c0ed8]                           dc.w $0000
_40_ED_PATTERN:
[000c0eda]                           dc.w $002a
[000c0edc]                           dc.w $ffff
[000c0ede]                           dc.w $ffff
[000c0ee0]                           dc.w $0018
[000c0ee2]                           dc.w $0005
[000c0ee4]                           dc.w $0000
[000c0ee6] 000c07ba                  dc.l USER_025
[000c0eea]                           dc.w $0010
[000c0eec]                           dc.w $0001
[000c0eee]                           dc.w $0003
[000c0ef0]                           dc.w $0001
_40aED_PATTERN:
[000c0ef2] 00028df6                  dc.l edpa_pattern
[000c0ef6]                           dc.w $0000
[000c0ef8]                           dc.w $0000
[000c0efa]                           dc.w $8000
[000c0efc]                           dc.w $0000
[000c0efe]                           dc.w $0000
[000c0f00]                           dc.w $0000
[000c0f02]                           dc.w $0000
[000c0f04]                           dc.w $0000
[000c0f06]                           dc.w $0000
[000c0f08]                           dc.w $0000
_42_ED_PATTERN:
[000c0f0a]                           dc.w $002c
[000c0f0c]                           dc.w $ffff
[000c0f0e]                           dc.w $ffff
[000c0f10]                           dc.w $0018
[000c0f12]                           dc.w $0005
[000c0f14]                           dc.w $0000
[000c0f16] 000c07da                  dc.l USER_026
[000c0f1a]                           dc.w $0010
[000c0f1c]                           dc.w $0002
[000c0f1e]                           dc.w $0003
[000c0f20]                           dc.w $0001
_42aED_PATTERN:
[000c0f22] 00028df6                  dc.l edpa_pattern
[000c0f26]                           dc.w $0000
[000c0f28]                           dc.w $0000
[000c0f2a]                           dc.w $8000
[000c0f2c]                           dc.w $0000
[000c0f2e]                           dc.w $0000
[000c0f30]                           dc.w $0000
[000c0f32]                           dc.w $0000
[000c0f34]                           dc.w $0000
[000c0f36]                           dc.w $0000
[000c0f38]                           dc.w $0000
_44_ED_PATTERN:
[000c0f3a]                           dc.w $002e
[000c0f3c]                           dc.w $ffff
[000c0f3e]                           dc.w $ffff
[000c0f40]                           dc.w $0018
[000c0f42]                           dc.w $0005
[000c0f44]                           dc.w $0000
[000c0f46] 000c07fa                  dc.l USER_027
[000c0f4a]                           dc.w $0010
[000c0f4c]                           dc.w $0003
[000c0f4e]                           dc.w $0003
[000c0f50]                           dc.w $0001
_44aED_PATTERN:
[000c0f52] 00028df6                  dc.l edpa_pattern
[000c0f56]                           dc.w $0000
[000c0f58]                           dc.w $0000
[000c0f5a]                           dc.w $8000
[000c0f5c]                           dc.w $0000
[000c0f5e]                           dc.w $0000
[000c0f60]                           dc.w $0000
[000c0f62]                           dc.w $0000
[000c0f64]                           dc.w $0000
[000c0f66]                           dc.w $0000
[000c0f68]                           dc.w $0000
_46_ED_PATTERN:
[000c0f6a]                           dc.w $0030
[000c0f6c]                           dc.w $ffff
[000c0f6e]                           dc.w $ffff
[000c0f70]                           dc.w $0018
[000c0f72]                           dc.w $0005
[000c0f74]                           dc.w $0000
[000c0f76] 000c079a                  dc.l USER_024
[000c0f7a]                           dc.w $000d
[000c0f7c]                           dc.w $0003
[000c0f7e]                           dc.w $0003
[000c0f80]                           dc.w $0001
_46aED_PATTERN:
[000c0f82] 00028df6                  dc.l edpa_pattern
[000c0f86]                           dc.w $0000
[000c0f88]                           dc.w $0000
[000c0f8a]                           dc.w $8000
[000c0f8c]                           dc.w $0000
[000c0f8e]                           dc.w $0000
[000c0f90]                           dc.w $0000
[000c0f92]                           dc.w $0000
[000c0f94]                           dc.w $0000
[000c0f96]                           dc.w $0000
[000c0f98]                           dc.w $0000
_48_ED_PATTERN:
[000c0f9a]                           dc.w $0032
[000c0f9c]                           dc.w $ffff
[000c0f9e]                           dc.w $ffff
[000c0fa0]                           dc.w $0018
[000c0fa2]                           dc.w $0005
[000c0fa4]                           dc.w $0000
[000c0fa6] 000c075a                  dc.l USER_022
[000c0faa]                           dc.w $000d
[000c0fac]                           dc.w $0001
[000c0fae]                           dc.w $0003
[000c0fb0]                           dc.w $0001
_48aED_PATTERN:
[000c0fb2] 00028df6                  dc.l edpa_pattern
[000c0fb6]                           dc.w $0000
[000c0fb8]                           dc.w $0000
[000c0fba]                           dc.w $8000
[000c0fbc]                           dc.w $0000
[000c0fbe]                           dc.w $0000
[000c0fc0]                           dc.w $0000
[000c0fc2]                           dc.w $0000
[000c0fc4]                           dc.w $0000
[000c0fc6]                           dc.w $0000
[000c0fc8]                           dc.w $0000
_50_ED_PATTERN:
[000c0fca]                           dc.w $0034
[000c0fcc]                           dc.w $ffff
[000c0fce]                           dc.w $ffff
[000c0fd0]                           dc.w $0018
[000c0fd2]                           dc.w $0005
[000c0fd4]                           dc.w $0000
[000c0fd6] 000c077a                  dc.l USER_023
[000c0fda]                           dc.w $000d
[000c0fdc]                           dc.w $0002
[000c0fde]                           dc.w $0003
[000c0fe0]                           dc.w $0001
_50aED_PATTERN:
[000c0fe2] 00028df6                  dc.l edpa_pattern
[000c0fe6]                           dc.w $0000
[000c0fe8]                           dc.w $0000
[000c0fea]                           dc.w $8000
[000c0fec]                           dc.w $0000
[000c0fee]                           dc.w $0000
[000c0ff0]                           dc.w $0000
[000c0ff2]                           dc.w $0000
[000c0ff4]                           dc.w $0000
[000c0ff6]                           dc.w $0000
[000c0ff8]                           dc.w $0000
_52_ED_PATTERN:
[000c0ffa]                           dc.w $0036
[000c0ffc]                           dc.w $ffff
[000c0ffe]                           dc.w $ffff
[000c1000]                           dc.w $0018
[000c1002]                           dc.w $0005
[000c1004]                           dc.w $0000
[000c1006] 000c087a                  dc.l USER_031
[000c100a]                           dc.w $0016
[000c100c]                           dc.w $0001
[000c100e]                           dc.w $0003
[000c1010]                           dc.w $0001
_52aED_PATTERN:
[000c1012] 00028df6                  dc.l edpa_pattern
[000c1016]                           dc.w $0000
[000c1018]                           dc.w $0000
[000c101a]                           dc.w $8000
[000c101c]                           dc.w $0000
[000c101e]                           dc.w $0000
[000c1020]                           dc.w $0000
[000c1022]                           dc.w $0000
[000c1024]                           dc.w $0000
[000c1026]                           dc.w $0000
[000c1028]                           dc.w $0000
_54_ED_PATTERN:
[000c102a]                           dc.w $0038
[000c102c]                           dc.w $ffff
[000c102e]                           dc.w $ffff
[000c1030]                           dc.w $0018
[000c1032]                           dc.w $0005
[000c1034]                           dc.w $0000
[000c1036] 000c089a                  dc.l USER_032
[000c103a]                           dc.w $0016
[000c103c]                           dc.w $0002
[000c103e]                           dc.w $0003
[000c1040]                           dc.w $0001
_54aED_PATTERN:
[000c1042] 00028df6                  dc.l edpa_pattern
[000c1046]                           dc.w $0000
[000c1048]                           dc.w $0000
[000c104a]                           dc.w $8000
[000c104c]                           dc.w $0000
[000c104e]                           dc.w $0000
[000c1050]                           dc.w $0000
[000c1052]                           dc.w $0000
[000c1054]                           dc.w $0000
[000c1056]                           dc.w $0000
[000c1058]                           dc.w $0000
_56_ED_PATTERN:
[000c105a]                           dc.w $003a
[000c105c]                           dc.w $ffff
[000c105e]                           dc.w $ffff
[000c1060]                           dc.w $0018
[000c1062]                           dc.w $0005
[000c1064]                           dc.w $0000
[000c1066] 000c08ba                  dc.l USER_033
[000c106a]                           dc.w $0016
[000c106c]                           dc.w $0003
[000c106e]                           dc.w $0003
[000c1070]                           dc.w $0001
_56aED_PATTERN:
[000c1072] 00028df6                  dc.l edpa_pattern
[000c1076]                           dc.w $0000
[000c1078]                           dc.w $0000
[000c107a]                           dc.w $8000
[000c107c]                           dc.w $0000
[000c107e]                           dc.w $0000
[000c1080]                           dc.w $0000
[000c1082]                           dc.w $0000
[000c1084]                           dc.w $0000
[000c1086]                           dc.w $0000
[000c1088]                           dc.w $0000
_58_ED_PATTERN:
[000c108a]                           dc.w $003c
[000c108c]                           dc.w $ffff
[000c108e]                           dc.w $ffff
[000c1090]                           dc.w $0018
[000c1092]                           dc.w $0005
[000c1094]                           dc.w $0000
[000c1096] 000c081a                  dc.l USER_028
[000c109a]                           dc.w $0013
[000c109c]                           dc.w $0001
[000c109e]                           dc.w $0003
[000c10a0]                           dc.w $0001
_58aED_PATTERN:
[000c10a2] 00028df6                  dc.l edpa_pattern
[000c10a6]                           dc.w $0000
[000c10a8]                           dc.w $0000
[000c10aa]                           dc.w $8000
[000c10ac]                           dc.w $0000
[000c10ae]                           dc.w $0000
[000c10b0]                           dc.w $0000
[000c10b2]                           dc.w $0000
[000c10b4]                           dc.w $0000
[000c10b6]                           dc.w $0000
[000c10b8]                           dc.w $0000
_60_ED_PATTERN:
[000c10ba]                           dc.w $003e
[000c10bc]                           dc.w $ffff
[000c10be]                           dc.w $ffff
[000c10c0]                           dc.w $0018
[000c10c2]                           dc.w $0005
[000c10c4]                           dc.w $0000
[000c10c6] 000c083a                  dc.l USER_029
[000c10ca]                           dc.w $0013
[000c10cc]                           dc.w $0002
[000c10ce]                           dc.w $0003
[000c10d0]                           dc.w $0001
_60aED_PATTERN:
[000c10d2] 00028df6                  dc.l edpa_pattern
[000c10d6]                           dc.w $0000
[000c10d8]                           dc.w $0000
[000c10da]                           dc.w $8000
[000c10dc]                           dc.w $0000
[000c10de]                           dc.w $0000
[000c10e0]                           dc.w $0000
[000c10e2]                           dc.w $0000
[000c10e4]                           dc.w $0000
[000c10e6]                           dc.w $0000
[000c10e8]                           dc.w $0000
_62_ED_PATTERN:
[000c10ea]                           dc.w $0040
[000c10ec]                           dc.w $ffff
[000c10ee]                           dc.w $ffff
[000c10f0]                           dc.w $0018
[000c10f2]                           dc.w $0005
[000c10f4]                           dc.w $0000
[000c10f6] 000c085a                  dc.l USER_030
[000c10fa]                           dc.w $0013
[000c10fc]                           dc.w $0003
[000c10fe]                           dc.w $0003
[000c1100]                           dc.w $0001
_62aED_PATTERN:
[000c1102] 00028df6                  dc.l edpa_pattern
[000c1106]                           dc.w $0000
[000c1108]                           dc.w $0000
[000c110a]                           dc.w $8000
[000c110c]                           dc.w $0000
[000c110e]                           dc.w $0000
[000c1110]                           dc.w $0000
[000c1112]                           dc.w $0000
[000c1114]                           dc.w $0000
[000c1116]                           dc.w $0000
[000c1118]                           dc.w $0000
_64_ED_PATTERN:
[000c111a]                           dc.w $0042
[000c111c]                           dc.w $ffff
[000c111e]                           dc.w $ffff
[000c1120]                           dc.w $0018
[000c1122]                           dc.w $0005
[000c1124]                           dc.w $0000
[000c1126] 000c08da                  dc.l USER_034
[000c112a]                           dc.w $0019
[000c112c]                           dc.w $0001
[000c112e]                           dc.w $0003
[000c1130]                           dc.w $0001
_64aED_PATTERN:
[000c1132] 00028df6                  dc.l edpa_pattern
[000c1136]                           dc.w $0000
[000c1138]                           dc.w $0000
[000c113a]                           dc.w $8000
[000c113c]                           dc.w $0000
[000c113e]                           dc.w $0000
[000c1140]                           dc.w $0000
[000c1142]                           dc.w $0000
[000c1144]                           dc.w $0000
[000c1146]                           dc.w $0000
[000c1148]                           dc.w $0000
_66_ED_PATTERN:
[000c114a]                           dc.w $0044
[000c114c]                           dc.w $ffff
[000c114e]                           dc.w $ffff
[000c1150]                           dc.w $0018
[000c1152]                           dc.w $0005
[000c1154]                           dc.w $0000
[000c1156] 000c08fa                  dc.l USER_035
[000c115a]                           dc.w $0019
[000c115c]                           dc.w $0002
[000c115e]                           dc.w $0003
[000c1160]                           dc.w $0001
_66aED_PATTERN:
[000c1162] 00028df6                  dc.l edpa_pattern
[000c1166]                           dc.w $0000
[000c1168]                           dc.w $0000
[000c116a]                           dc.w $8000
[000c116c]                           dc.w $0000
[000c116e]                           dc.w $0000
[000c1170]                           dc.w $0000
[000c1172]                           dc.w $0000
[000c1174]                           dc.w $0000
[000c1176]                           dc.w $0000
[000c1178]                           dc.w $0000
_68_ED_PATTERN:
[000c117a]                           dc.w $0046
[000c117c]                           dc.w $ffff
[000c117e]                           dc.w $ffff
[000c1180]                           dc.w $0018
[000c1182]                           dc.w $0005
[000c1184]                           dc.w $0000
[000c1186] 000c091a                  dc.l USER_036
[000c118a]                           dc.w $0019
[000c118c]                           dc.w $0003
[000c118e]                           dc.w $0003
[000c1190]                           dc.w $0001
_68aED_PATTERN:
[000c1192] 00028df6                  dc.l edpa_pattern
[000c1196]                           dc.w $0000
[000c1198]                           dc.w $0000
[000c119a]                           dc.w $8000
[000c119c]                           dc.w $0000
[000c119e]                           dc.w $0000
[000c11a0]                           dc.w $0000
[000c11a2]                           dc.w $0000
[000c11a4]                           dc.w $0000
[000c11a6]                           dc.w $0000
[000c11a8]                           dc.w $0000
_70_ED_PATTERN:
[000c11aa]                           dc.w $0048
[000c11ac]                           dc.w $ffff
[000c11ae]                           dc.w $ffff
[000c11b0]                           dc.w $0018
[000c11b2]                           dc.w $0005
[000c11b4]                           dc.w $0000
[000c11b6] 000c099a                  dc.l USER_040
[000c11ba]                           dc.w $001f
[000c11bc]                           dc.w $0001
[000c11be]                           dc.w $0003
[000c11c0]                           dc.w $0001
_70aED_PATTERN:
[000c11c2] 00028df6                  dc.l edpa_pattern
[000c11c6]                           dc.w $0000
[000c11c8]                           dc.w $0000
[000c11ca]                           dc.w $8000
[000c11cc]                           dc.w $0000
[000c11ce]                           dc.w $0000
[000c11d0]                           dc.w $0000
[000c11d2]                           dc.w $0000
[000c11d4]                           dc.w $0000
[000c11d6]                           dc.w $0000
[000c11d8]                           dc.w $0000
_72_ED_PATTERN:
[000c11da]                           dc.w $004a
[000c11dc]                           dc.w $ffff
[000c11de]                           dc.w $ffff
[000c11e0]                           dc.w $0018
[000c11e2]                           dc.w $0005
[000c11e4]                           dc.w $0000
[000c11e6] 000c09ba                  dc.l USER_041
[000c11ea]                           dc.w $001f
[000c11ec]                           dc.w $0002
[000c11ee]                           dc.w $0003
[000c11f0]                           dc.w $0001
_72aED_PATTERN:
[000c11f2] 00028df6                  dc.l edpa_pattern
[000c11f6]                           dc.w $0000
[000c11f8]                           dc.w $0000
[000c11fa]                           dc.w $8000
[000c11fc]                           dc.w $0000
[000c11fe]                           dc.w $0000
[000c1200]                           dc.w $0000
[000c1202]                           dc.w $0000
[000c1204]                           dc.w $0000
[000c1206]                           dc.w $0000
[000c1208]                           dc.w $0000
_74_ED_PATTERN:
[000c120a]                           dc.w $004c
[000c120c]                           dc.w $ffff
[000c120e]                           dc.w $ffff
[000c1210]                           dc.w $0018
[000c1212]                           dc.w $0005
[000c1214]                           dc.w $0000
[000c1216] 000c09da                  dc.l USER_042
[000c121a]                           dc.w $001f
[000c121c]                           dc.w $0003
[000c121e]                           dc.w $0003
[000c1220]                           dc.w $0001
_74aED_PATTERN:
[000c1222] 00028df6                  dc.l edpa_pattern
[000c1226]                           dc.w $0000
[000c1228]                           dc.w $0000
[000c122a]                           dc.w $8000
[000c122c]                           dc.w $0000
[000c122e]                           dc.w $0000
[000c1230]                           dc.w $0000
[000c1232]                           dc.w $0000
[000c1234]                           dc.w $0000
[000c1236]                           dc.w $0000
[000c1238]                           dc.w $0000
_76_ED_PATTERN:
[000c123a]                           dc.w $004e
[000c123c]                           dc.w $ffff
[000c123e]                           dc.w $ffff
[000c1240]                           dc.w $0018
[000c1242]                           dc.w $0005
[000c1244]                           dc.w $0000
[000c1246] 000c095a                  dc.l USER_038
[000c124a]                           dc.w $001c
[000c124c]                           dc.w $0002
[000c124e]                           dc.w $0003
[000c1250]                           dc.w $0001
_76aED_PATTERN:
[000c1252] 00028df6                  dc.l edpa_pattern
[000c1256]                           dc.w $0000
[000c1258]                           dc.w $0000
[000c125a]                           dc.w $8000
[000c125c]                           dc.w $0000
[000c125e]                           dc.w $0000
[000c1260]                           dc.w $0000
[000c1262]                           dc.w $0000
[000c1264]                           dc.w $0000
[000c1266]                           dc.w $0000
[000c1268]                           dc.w $0000
_78_ED_PATTERN:
[000c126a]                           dc.w $0050
[000c126c]                           dc.w $ffff
[000c126e]                           dc.w $ffff
[000c1270]                           dc.w $0018
[000c1272]                           dc.w $0005
[000c1274]                           dc.w $0000
[000c1276] 000c097a                  dc.l USER_039
[000c127a]                           dc.w $001c
[000c127c]                           dc.w $0003
[000c127e]                           dc.w $0003
[000c1280]                           dc.w $0001
_78aED_PATTERN:
[000c1282] 00028df6                  dc.l edpa_pattern
[000c1286]                           dc.w $0000
[000c1288]                           dc.w $0000
[000c128a]                           dc.w $8000
[000c128c]                           dc.w $0000
[000c128e]                           dc.w $0000
[000c1290]                           dc.w $0000
[000c1292]                           dc.w $0000
[000c1294]                           dc.w $0000
[000c1296]                           dc.w $0000
[000c1298]                           dc.w $0000
_80_ED_PATTERN:
[000c129a]                           dc.w $0052
[000c129c]                           dc.w $ffff
[000c129e]                           dc.w $ffff
[000c12a0]                           dc.w $0018
[000c12a2]                           dc.w $0005
[000c12a4]                           dc.w $0000
[000c12a6] 000c093a                  dc.l USER_037
[000c12aa]                           dc.w $001c
[000c12ac]                           dc.w $0001
[000c12ae]                           dc.w $0003
[000c12b0]                           dc.w $0001
_80aED_PATTERN:
[000c12b2] 00028df6                  dc.l edpa_pattern
[000c12b6]                           dc.w $0000
[000c12b8]                           dc.w $0000
[000c12ba]                           dc.w $8000
[000c12bc]                           dc.w $0000
[000c12be]                           dc.w $0000
[000c12c0]                           dc.w $0000
[000c12c2]                           dc.w $0000
[000c12c4]                           dc.w $0000
[000c12c6]                           dc.w $0000
[000c12c8]                           dc.w $0000
_82_ED_PATTERN:
[000c12ca]                           dc.w $0054
[000c12cc]                           dc.w $ffff
[000c12ce]                           dc.w $ffff
[000c12d0]                           dc.w $0018
[000c12d2]                           dc.w $0005
[000c12d4]                           dc.w $0000
[000c12d6] 000c0a5a                  dc.l USER_046
[000c12da]                           dc.w $0025
[000c12dc]                           dc.w $0001
[000c12de]                           dc.w $0003
[000c12e0]                           dc.w $0001
_82aED_PATTERN:
[000c12e2] 00028df6                  dc.l edpa_pattern
[000c12e6]                           dc.w $0000
[000c12e8]                           dc.w $0000
[000c12ea]                           dc.w $8000
[000c12ec]                           dc.w $0000
[000c12ee]                           dc.w $0000
[000c12f0]                           dc.w $0000
[000c12f2]                           dc.w $0000
[000c12f4]                           dc.w $0000
[000c12f6]                           dc.w $0000
[000c12f8]                           dc.w $0000
_84_ED_PATTERN:
[000c12fa]                           dc.w $0056
[000c12fc]                           dc.w $ffff
[000c12fe]                           dc.w $ffff
[000c1300]                           dc.w $0018
[000c1302]                           dc.w $0005
[000c1304]                           dc.w $0000
[000c1306] 000c0a7a                  dc.l USER_047
[000c130a]                           dc.w $0025
[000c130c]                           dc.w $0002
[000c130e]                           dc.w $0003
[000c1310]                           dc.w $0001
_84aED_PATTERN:
[000c1312] 00028df6                  dc.l edpa_pattern
[000c1316]                           dc.w $0000
[000c1318]                           dc.w $0000
[000c131a]                           dc.w $8000
[000c131c]                           dc.w $0000
[000c131e]                           dc.w $0000
[000c1320]                           dc.w $0000
[000c1322]                           dc.w $0000
[000c1324]                           dc.w $0000
[000c1326]                           dc.w $0000
[000c1328]                           dc.w $0000
_86_ED_PATTERN:
[000c132a]                           dc.w $0058
[000c132c]                           dc.w $ffff
[000c132e]                           dc.w $ffff
[000c1330]                           dc.w $0018
[000c1332]                           dc.w $0005
[000c1334]                           dc.w $0000
[000c1336] 000c0a9a                  dc.l USER_048
[000c133a]                           dc.w $0025
[000c133c]                           dc.w $0003
[000c133e]                           dc.w $0003
[000c1340]                           dc.w $0001
_86aED_PATTERN:
[000c1342] 00028df6                  dc.l edpa_pattern
[000c1346]                           dc.w $0000
[000c1348]                           dc.w $0000
[000c134a]                           dc.w $8000
[000c134c]                           dc.w $0000
[000c134e]                           dc.w $0000
[000c1350]                           dc.w $0000
[000c1352]                           dc.w $0000
[000c1354]                           dc.w $0000
[000c1356]                           dc.w $0000
[000c1358]                           dc.w $0000
_88_ED_PATTERN:
[000c135a]                           dc.w $005a
[000c135c]                           dc.w $ffff
[000c135e]                           dc.w $ffff
[000c1360]                           dc.w $0018
[000c1362]                           dc.w $0005
[000c1364]                           dc.w $0000
[000c1366] 000c0a3a                  dc.l USER_045
[000c136a]                           dc.w $0022
[000c136c]                           dc.w $0003
[000c136e]                           dc.w $0003
[000c1370]                           dc.w $0001
_88aED_PATTERN:
[000c1372] 00028df6                  dc.l edpa_pattern
[000c1376]                           dc.w $0000
[000c1378]                           dc.w $0000
[000c137a]                           dc.w $8000
[000c137c]                           dc.w $0000
[000c137e]                           dc.w $0000
[000c1380]                           dc.w $0000
[000c1382]                           dc.w $0000
[000c1384]                           dc.w $0000
[000c1386]                           dc.w $0000
[000c1388]                           dc.w $0000
_90_ED_PATTERN:
[000c138a]                           dc.w $005c
[000c138c]                           dc.w $ffff
[000c138e]                           dc.w $ffff
[000c1390]                           dc.w $0018
[000c1392]                           dc.w $0005
[000c1394]                           dc.w $0000
[000c1396] 000c09fa                  dc.l USER_043
[000c139a]                           dc.w $0022
[000c139c]                           dc.w $0001
[000c139e]                           dc.w $0003
[000c13a0]                           dc.w $0001
_90aED_PATTERN:
[000c13a2] 00028df6                  dc.l edpa_pattern
[000c13a6]                           dc.w $0000
[000c13a8]                           dc.w $0000
[000c13aa]                           dc.w $8000
[000c13ac]                           dc.w $0000
[000c13ae]                           dc.w $0000
[000c13b0]                           dc.w $0000
[000c13b2]                           dc.w $0000
[000c13b4]                           dc.w $0000
[000c13b6]                           dc.w $0000
[000c13b8]                           dc.w $0000
_92_ED_PATTERN:
[000c13ba]                           dc.w $005e
[000c13bc]                           dc.w $ffff
[000c13be]                           dc.w $ffff
[000c13c0]                           dc.w $0018
[000c13c2]                           dc.w $0005
[000c13c4]                           dc.w $0000
[000c13c6] 000c0a1a                  dc.l USER_044
[000c13ca]                           dc.w $0022
[000c13cc]                           dc.w $0002
[000c13ce]                           dc.w $0003
[000c13d0]                           dc.w $0001
_92aED_PATTERN:
[000c13d2] 00028df6                  dc.l edpa_pattern
[000c13d6]                           dc.w $0000
[000c13d8]                           dc.w $0000
[000c13da]                           dc.w $8000
[000c13dc]                           dc.w $0000
[000c13de]                           dc.w $0000
[000c13e0]                           dc.w $0000
[000c13e2]                           dc.w $0000
[000c13e4]                           dc.w $0000
[000c13e6]                           dc.w $0000
[000c13e8]                           dc.w $0000
_94_ED_PATTERN:
[000c13ea]                           dc.w $0060
[000c13ec]                           dc.w $ffff
[000c13ee]                           dc.w $ffff
[000c13f0]                           dc.w $0018
[000c13f2]                           dc.w $0005
[000c13f4]                           dc.w $0000
[000c13f6] 000c0aba                  dc.l USER_049
[000c13fa]                           dc.w $0028
[000c13fc]                           dc.w $0001
[000c13fe]                           dc.w $0003
[000c1400]                           dc.w $0001
_94aED_PATTERN:
[000c1402] 00028df6                  dc.l edpa_pattern
[000c1406]                           dc.w $0000
[000c1408]                           dc.w $0000
[000c140a]                           dc.w $8000
[000c140c]                           dc.w $0000
[000c140e]                           dc.w $0000
[000c1410]                           dc.w $0000
[000c1412]                           dc.w $0000
[000c1414]                           dc.w $0000
[000c1416]                           dc.w $0000
[000c1418]                           dc.w $0000
_96_ED_PATTERN:
[000c141a]                           dc.w $0062
[000c141c]                           dc.w $ffff
[000c141e]                           dc.w $ffff
[000c1420]                           dc.w $0018
[000c1422]                           dc.w $0005
[000c1424]                           dc.w $0000
[000c1426] 000c0ada                  dc.l USER_050
[000c142a]                           dc.w $0028
[000c142c]                           dc.w $0002
[000c142e]                           dc.w $0003
[000c1430]                           dc.w $0001
_96aED_PATTERN:
[000c1432] 00028df6                  dc.l edpa_pattern
[000c1436]                           dc.w $0000
[000c1438]                           dc.w $0000
[000c143a]                           dc.w $8000
[000c143c]                           dc.w $0000
[000c143e]                           dc.w $0000
[000c1440]                           dc.w $0000
[000c1442]                           dc.w $0000
[000c1444]                           dc.w $0000
[000c1446]                           dc.w $0000
[000c1448]                           dc.w $0000
_98_ED_PATTERN:
[000c144a]                           dc.w $000f
[000c144c]                           dc.w $ffff
[000c144e]                           dc.w $ffff
[000c1450]                           dc.w $0018
[000c1452]                           dc.w $0005
[000c1454]                           dc.w $0000
[000c1456] 000c0afa                  dc.l USER_051
[000c145a]                           dc.w $0028
[000c145c]                           dc.w $0003
[000c145e]                           dc.w $0003
[000c1460]                           dc.w $0001
_98aED_PATTERN:
[000c1462] 00028df6                  dc.l edpa_pattern
[000c1466]                           dc.w $0000
[000c1468]                           dc.w $0000
[000c146a]                           dc.w $8020
[000c146c]                           dc.w $0000
[000c146e]                           dc.w $0000
[000c1470]                           dc.w $0000
[000c1472]                           dc.w $0000
[000c1474]                           dc.w $0000
[000c1476]                           dc.w $0000
[000c1478]                           dc.w $0000
pattern:
[000c147a] 000659ea                  dc.l A_pattern
[000c147e]                           dc.w $0023
[000c1480]                           dc.w $0001
[000c1482]                           dc.w $0000
[000c1484]                           dc.w $0000
[000c1486]                           dc.w $0000
[000c1488]                           dc.w $0000
[000c148a]                           dc.w $0000
[000c148c]                           dc.w $0000
[000c148e]                           dc.w $0000
[000c1490]                           dc.w $0000
[000c1492]                           dc.w $0000
[000c1494]                           dc.w $0000
[000c1496]                           dc.w $0000
[000c1498]                           dc.w $0000
visual:
[000c149a]                           dc.w $ffff
[000c149c]                           dc.w $ffff
[000c149e]                           dc.w $ffff
[000c14a0]                           dc.w $0018
[000c14a2]                           dc.w $0000
[000c14a4]                           dc.w $0000
[000c14a6] 000c147a                  dc.l pattern
[000c14aa]                           dc.w $0000
[000c14ac]                           dc.w $0000
[000c14ae]                           dc.w $000a
[000c14b0]                           dc.w $0002
logical:
[000c14b2]                           dc.w $ffff
[000c14b4]                           dc.w $ffff
[000c14b6]                           dc.w $ffff
[000c14b8]                           dc.w $0018
[000c14ba]                           dc.w $0040
[000c14bc]                           dc.w $0000
[000c14be]                           dc.w $0000
[000c14c0]                           dc.w $0000
[000c14c2]                           dc.w $0000
[000c14c4]                           dc.w $0000
[000c14c6]                           dc.w $0003
[000c14c8]                           dc.w $0001
aud:
[000c14ca] 000c1548                  dc.l $000c1548
[000c14ce]                           dc.w $0000
[000c14d0]                           dc.w $0000
[000c14d2]                           dc.w $0000
[000c14d4]                           dc.w $0000
[000c14d6]                           dc.w $0000
[000c14d8]                           dc.w $0000
[000c14da]                           dc.w $0000
[000c14dc]                           dc.w $0000
[000c14de]                           dc.w $0000
[000c14e0]                           dc.w $0000
[000c14e2]                           dc.w $0000
[000c14e4]                           dc.w $0000
[000c14e6]                           dc.w $0000
[000c14e8]                           dc.w $0000
[000c14ea]                           dc.w $0000
[000c14ec]                           dc.w $0000
[000c14ee]                           dc.w $0000
[000c14f0]                           dc.w $0000
[000c14f2]                           dc.w $0000
[000c14f4]                           dc.w $0000
[000c14f6]                           dc.w $0000
data:
[000c14f8]                           dc.b 'A_pattern',0
[000c1502]                           dc.w $0000
[000c1504]                           dc.w $0000
[000c1506]                           dc.w $0000
[000c1508]                           dc.w $0000
[000c150a]                           dc.w $0000
[000c150c]                           dc.w $0000
[000c150e]                           dc.w $0000
[000c1510]                           dc.w $0000
[000c1512]                           dc.w $0000
[000c1514]                           dc.w $0000
[000c1516]                           dc.w $0000
[000c1518] 00028e86                  dc.l object_tree
[000c151c] 00028f2c                  dc.l test_it
[000c1520] 00028f74                  dc.l ok
[000c1524] 0004f20a                  dc.l Aob_delete
[000c1528] 000c149a                  dc.l visual
[000c152c] 000c14b2                  dc.l logical
[000c1530] 000c14ca                  dc.l aud
[000c1534] 00028e6c                  dc.l minsize
[000c1538]                           dc.w $0000
[000c153a]                           dc.w $0000
[000c153c] 000c04af                  dc.l title
[000c1540] 000c049c                  dc.l help_title
[000c1544]                           dc.w $0000
[000c1546]                           dc.w $0000
[000c1548]                           dc.b '0x230001L',0
[000c1552]                           dc.b '0x%lxL',0
[000c1559]                           dc.b $00
