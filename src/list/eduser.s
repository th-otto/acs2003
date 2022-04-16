add_2ref:
[00034db4] 2f0a                      move.l     a2,-(a7)
[00034db6] 2f0b                      move.l     a3,-(a7)
[00034db8] 2648                      movea.l    a0,a3
[00034dba] 2449                      movea.l    a1,a2
[00034dbc] 200a                      move.l     a2,d0
[00034dbe] 6604                      bne.s      add_2ref_1
[00034dc0] 91c8                      suba.l     a0,a0
[00034dc2] 600a                      bra.s      add_2ref_2
add_2ref_1:
[00034dc4] 224a                      movea.l    a2,a1
[00034dc6] 204b                      movea.l    a3,a0
[00034dc8] 4eb9 0003 5c26            jsr        add_ref
add_2ref_2:
[00034dce] 265f                      movea.l    (a7)+,a3
[00034dd0] 245f                      movea.l    (a7)+,a2
[00034dd2] 4e75                      rts

del_2ref:
[00034dd4] 2f0a                      move.l     a2,-(a7)
[00034dd6] 2449                      movea.l    a1,a2
[00034dd8] 200a                      move.l     a2,d0
[00034dda] 6706                      beq.s      del_2ref_1
[00034ddc] 4eb9 0003 5dae            jsr        del_ref
del_2ref_1:
[00034de2] 245f                      movea.l    (a7)+,a2
[00034de4] 4e75                      rts

add_3ref:
[00034de6] 2f0a                      move.l     a2,-(a7)
[00034de8] 2f0b                      move.l     a3,-(a7)
[00034dea] 2648                      movea.l    a0,a3
[00034dec] 2449                      movea.l    a1,a2
[00034dee] 220a                      move.l     a2,d1
[00034df0] 6736                      beq.s      add_3ref_1
[00034df2] 7403                      moveq.l    #3,d2
[00034df4] c440                      and.w      d0,d2
[00034df6] 5342                      subq.w     #1,d2
[00034df8] 670a                      beq.s      add_3ref_2
[00034dfa] 5342                      subq.w     #1,d2
[00034dfc] 6712                      beq.s      add_3ref_3
[00034dfe] 5342                      subq.w     #1,d2
[00034e00] 671a                      beq.s      add_3ref_4
[00034e02] 6024                      bra.s      add_3ref_1
add_3ref_2:
[00034e04] 224a                      movea.l    a2,a1
[00034e06] 204b                      movea.l    a3,a0
[00034e08] 4eb9 0003 5c26            jsr        add_ref
[00034e0e] 601a                      bra.s      add_3ref_5
add_3ref_3:
[00034e10] 224a                      movea.l    a2,a1
[00034e12] 204b                      movea.l    a3,a0
[00034e14] 4eb9 0003 5f3e            jsr        add_string
[00034e1a] 600e                      bra.s      add_3ref_5
add_3ref_4:
[00034e1c] 224a                      movea.l    a2,a1
[00034e1e] 204b                      movea.l    a3,a0
[00034e20] 4eb9 0003 42d4            jsr        add_data
[00034e26] 6002                      bra.s      add_3ref_5
add_3ref_1:
[00034e28] 91c8                      suba.l     a0,a0
add_3ref_5:
[00034e2a] 265f                      movea.l    (a7)+,a3
[00034e2c] 245f                      movea.l    (a7)+,a2
[00034e2e] 4e75                      rts

del_3ref:
[00034e30] 2f0a                      move.l     a2,-(a7)
[00034e32] 2f0b                      move.l     a3,-(a7)
[00034e34] 2648                      movea.l    a0,a3
[00034e36] 2449                      movea.l    a1,a2
[00034e38] 220a                      move.l     a2,d1
[00034e3a] 6734                      beq.s      del_3ref_1
[00034e3c] 7403                      moveq.l    #3,d2
[00034e3e] c440                      and.w      d0,d2
[00034e40] 5342                      subq.w     #1,d2
[00034e42] 670a                      beq.s      del_3ref_2
[00034e44] 5342                      subq.w     #1,d2
[00034e46] 6712                      beq.s      del_3ref_3
[00034e48] 5342                      subq.w     #1,d2
[00034e4a] 671a                      beq.s      del_3ref_4
[00034e4c] 6022                      bra.s      del_3ref_1
del_3ref_2:
[00034e4e] 224a                      movea.l    a2,a1
[00034e50] 204b                      movea.l    a3,a0
[00034e52] 4eb9 0003 5dae            jsr        del_ref
[00034e58] 6016                      bra.s      del_3ref_1
del_3ref_3:
[00034e5a] 224a                      movea.l    a2,a1
[00034e5c] 204b                      movea.l    a3,a0
[00034e5e] 4eb9 0003 6108            jsr        del_string
[00034e64] 600a                      bra.s      del_3ref_1
del_3ref_4:
[00034e66] 224a                      movea.l    a2,a1
[00034e68] 204b                      movea.l    a3,a0
[00034e6a] 4eb9 0003 43b6            jsr        del_data
del_3ref_1:
[00034e70] 265f                      movea.l    (a7)+,a3
[00034e72] 245f                      movea.l    (a7)+,a2
[00034e74] 4e75                      rts

comp_it:
[00034e76] 2f0a                      move.l     a2,-(a7)
[00034e78] 2f0b                      move.l     a3,-(a7)
[00034e7a] 2448                      movea.l    a0,a2
[00034e7c] 2649                      movea.l    a1,a3
[00034e7e] 200a                      move.l     a2,d0
[00034e80] 6608                      bne.s      comp_it_1
[00034e82] 220b                      move.l     a3,d1
[00034e84] 6604                      bne.s      comp_it_1
[00034e86] 7001                      moveq.l    #1,d0
[00034e88] 6024                      bra.s      comp_it_2
comp_it_1:
[00034e8a] 200a                      move.l     a2,d0
[00034e8c] 6704                      beq.s      comp_it_3
[00034e8e] 220b                      move.l     a3,d1
[00034e90] 6604                      bne.s      comp_it_4
comp_it_3:
[00034e92] 4240                      clr.w      d0
[00034e94] 6018                      bra.s      comp_it_2
comp_it_4:
[00034e96] 43eb 0016                 lea.l      22(a3),a1
[00034e9a] 41ea 0016                 lea.l      22(a2),a0
[00034e9e] 4eb9 0008 2eba            jsr        strcmp
[00034ea4] 4a40                      tst.w      d0
[00034ea6] 6604                      bne.s      comp_it_5
[00034ea8] 7001                      moveq.l    #1,d0
[00034eaa] 6002                      bra.s      comp_it_2
comp_it_5:
[00034eac] 4240                      clr.w      d0
comp_it_2:
[00034eae] 265f                      movea.l    (a7)+,a3
[00034eb0] 245f                      movea.l    (a7)+,a2
[00034eb2] 4e75                      rts

comp2_it:
[00034eb4] 2f0a                      move.l     a2,-(a7)
[00034eb6] 2f0b                      move.l     a3,-(a7)
[00034eb8] 2448                      movea.l    a0,a2
[00034eba] 2649                      movea.l    a1,a3
[00034ebc] 220a                      move.l     a2,d1
[00034ebe] 6608                      bne.s      comp2_it_1
[00034ec0] 240b                      move.l     a3,d2
[00034ec2] 6604                      bne.s      comp2_it_1
[00034ec4] 7001                      moveq.l    #1,d0
[00034ec6] 605e                      bra.s      comp2_it_2
comp2_it_1:
[00034ec8] 220a                      move.l     a2,d1
[00034eca] 6758                      beq.s      comp2_it_3
[00034ecc] 240b                      move.l     a3,d2
[00034ece] 6754                      beq.s      comp2_it_3
[00034ed0] 7203                      moveq.l    #3,d1
[00034ed2] c240                      and.w      d0,d1
[00034ed4] 4a41                      tst.w      d1
[00034ed6] 670e                      beq.s      comp2_it_4
[00034ed8] 5341                      subq.w     #1,d1
[00034eda] 670a                      beq.s      comp2_it_4
[00034edc] 5341                      subq.w     #1,d1
[00034ede] 6720                      beq.s      comp2_it_5
[00034ee0] 5341                      subq.w     #1,d1
[00034ee2] 671c                      beq.s      comp2_it_5
[00034ee4] 603e                      bra.s      comp2_it_3
comp2_it_4:
[00034ee6] 43eb 0016                 lea.l      22(a3),a1
[00034eea] 41ea 0016                 lea.l      22(a2),a0
[00034eee] 4eb9 0008 2eba            jsr        strcmp
[00034ef4] 4a40                      tst.w      d0
[00034ef6] 6604                      bne.s      comp2_it_6
[00034ef8] 7001                      moveq.l    #1,d0
[00034efa] 6002                      bra.s      comp2_it_7
comp2_it_6:
[00034efc] 4240                      clr.w      d0
comp2_it_7:
[00034efe] 6026                      bra.s      comp2_it_2
comp2_it_5:
[00034f00] 202a 000e                 move.l     14(a2),d0
[00034f04] b0ab 000e                 cmp.l      14(a3),d0
[00034f08] 6616                      bne.s      comp2_it_8
[00034f0a] 226b 0004                 movea.l    4(a3),a1
[00034f0e] 206a 0004                 movea.l    4(a2),a0
[00034f12] 4eb9 0008 34ea            jsr        memcmp
[00034f18] 4a40                      tst.w      d0
[00034f1a] 6604                      bne.s      comp2_it_8
[00034f1c] 7001                      moveq.l    #1,d0
[00034f1e] 6002                      bra.s      comp2_it_9
comp2_it_8:
[00034f20] 4240                      clr.w      d0
comp2_it_9:
[00034f22] 6002                      bra.s      comp2_it_2
comp2_it_3:
[00034f24] 4240                      clr.w      d0
comp2_it_2:
[00034f26] 265f                      movea.l    (a7)+,a3
[00034f28] 245f                      movea.l    (a7)+,a2
[00034f2a] 4e75                      rts

add_user:
[00034f2c] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[00034f30] 514f                      subq.w     #8,a7
[00034f32] 2448                      movea.l    a0,a2
[00034f34] 2f49 0004                 move.l     a1,4(a7)
[00034f38] 006a 0001 0006            ori.w      #$0001,6(a2)
[00034f3e] 206a 0038                 movea.l    56(a2),a0
[00034f42] 2ea8 0004                 move.l     4(a0),(a7)
[00034f46] 2a69 0004                 movea.l    4(a1),a5
[00034f4a] 3629 0038                 move.w     56(a1),d3
[00034f4e] c67c 00ff                 and.w      #$00FF,d3
[00034f52] 7006                      moveq.l    #6,d0
[00034f54] 2279 0010 ee4e            movea.l    ACSblk,a1
[00034f5a] c069 0266                 and.w      614(a1),d0
[00034f5e] 5d40                      subq.w     #6,d0
[00034f60] 6700 00dc                 beq        add_user_1
[00034f64] 2828 000e                 move.l     14(a0),d4
[00034f68] e48c                      lsr.l      #2,d4
[00034f6a] 4245                      clr.w      d5
[00034f6c] 6000 00ca                 bra        add_user_2
add_user_5:
[00034f70] 3005                      move.w     d5,d0
[00034f72] 48c0                      ext.l      d0
[00034f74] e588                      lsl.l      #2,d0
[00034f76] 2057                      movea.l    (a7),a0
[00034f78] 2670 0800                 movea.l    0(a0,d0.l),a3
[00034f7c] 286b 0004                 movea.l    4(a3),a4
[00034f80] 322b 0038                 move.w     56(a3),d1
[00034f84] c27c 00ff                 and.w      #$00FF,d1
[00034f88] b641                      cmp.w      d1,d3
[00034f8a] 6600 00aa                 bne        add_user_3
[00034f8e] 2255                      movea.l    (a5),a1
[00034f90] 43e9 0016                 lea.l      22(a1),a1
[00034f94] 2054                      movea.l    (a4),a0
[00034f96] 41e8 0016                 lea.l      22(a0),a0
[00034f9a] 4eb9 0008 2eba            jsr        strcmp
[00034fa0] 4a40                      tst.w      d0
[00034fa2] 6600 0092                 bne        add_user_3
[00034fa6] 226d 0004                 movea.l    4(a5),a1
[00034faa] 43e9 0016                 lea.l      22(a1),a1
[00034fae] 206c 0004                 movea.l    4(a4),a0
[00034fb2] 41e8 0016                 lea.l      22(a0),a0
[00034fb6] 4eb9 0008 2eba            jsr        strcmp
[00034fbc] 4a40                      tst.w      d0
[00034fbe] 6600 0076                 bne.w      add_user_3
[00034fc2] 226d 0008                 movea.l    8(a5),a1
[00034fc6] 206c 0008                 movea.l    8(a4),a0
[00034fca] 6100 feaa                 bsr        comp_it
[00034fce] 4a40                      tst.w      d0
[00034fd0] 6764                      beq.s      add_user_3
[00034fd2] 3003                      move.w     d3,d0
[00034fd4] 226d 000c                 movea.l    12(a5),a1
[00034fd8] 206c 000c                 movea.l    12(a4),a0
[00034fdc] 6100 fed6                 bsr        comp2_it
[00034fe0] 4a40                      tst.w      d0
[00034fe2] 6752                      beq.s      add_user_3
[00034fe4] 3003                      move.w     d3,d0
[00034fe6] e440                      asr.w      #2,d0
[00034fe8] 226d 0010                 movea.l    16(a5),a1
[00034fec] 206c 0010                 movea.l    16(a4),a0
[00034ff0] 6100 fec2                 bsr        comp2_it
[00034ff4] 4a40                      tst.w      d0
[00034ff6] 673e                      beq.s      add_user_3
[00034ff8] 3003                      move.w     d3,d0
[00034ffa] e840                      asr.w      #4,d0
[00034ffc] 226d 0014                 movea.l    20(a5),a1
[00035000] 206c 0014                 movea.l    20(a4),a0
[00035004] 6100 feae                 bsr        comp2_it
[00035008] 4a40                      tst.w      d0
[0003500a] 672a                      beq.s      add_user_3
[0003500c] 7002                      moveq.l    #2,d0
[0003500e] 226d 0018                 movea.l    24(a5),a1
[00035012] 206c 0018                 movea.l    24(a4),a0
[00035016] 6100 fe9c                 bsr        comp2_it
[0003501a] 4a40                      tst.w      d0
[0003501c] 6718                      beq.s      add_user_3
[0003501e] 7002                      moveq.l    #2,d0
[00035020] 226d 001c                 movea.l    28(a5),a1
[00035024] 206c 001c                 movea.l    28(a4),a0
[00035028] 6100 fe8a                 bsr        comp2_it
[0003502c] 4a40                      tst.w      d0
[0003502e] 6706                      beq.s      add_user_3
[00035030] 526b 0036                 addq.w     #1,54(a3)
[00035034] 6044                      bra.s      add_user_4
add_user_3:
[00035036] 5245                      addq.w     #1,d5
add_user_2:
[00035038] b845                      cmp.w      d5,d4
[0003503a] 6e00 ff34                 bgt        add_user_5
add_user_1:
[0003503e] 226f 0004                 movea.l    4(a7),a1
[00035042] 204a                      movea.l    a2,a0
[00035044] 4eb9 0003 5122            jsr        copy_user
[0003504a] 2648                      movea.l    a0,a3
[0003504c] 200b                      move.l     a3,d0
[0003504e] 6604                      bne.s      add_user_6
[00035050] 91c8                      suba.l     a0,a0
[00035052] 6028                      bra.s      add_user_7
add_user_6:
[00035054] 2f39 000c e560            move.l     $000CE560,-(a7)
[0003505a] 206f 0008                 movea.l    8(a7),a0
[0003505e] 4868 0016                 pea.l      22(a0)
[00035062] 224b                      movea.l    a3,a1
[00035064] 204a                      movea.l    a2,a0
[00035066] 4eb9 0001 81c6            jsr        objname
[0003506c] 504f                      addq.w     #8,a7
[0003506e] 224b                      movea.l    a3,a1
[00035070] 206a 0038                 movea.l    56(a2),a0
[00035074] 4eb9 0003 33b4            jsr        add_entry
add_user_4:
[0003507a] 204b                      movea.l    a3,a0
add_user_7:
[0003507c] 504f                      addq.w     #8,a7
[0003507e] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[00035082] 4e75                      rts

del_user:
[00035084] 48e7 0038                 movem.l    a2-a4,-(a7)
[00035088] 2448                      movea.l    a0,a2
[0003508a] 2649                      movea.l    a1,a3
[0003508c] 006a 0001 0006            ori.w      #$0001,6(a2)
[00035092] 536b 0036                 subq.w     #1,54(a3)
[00035096] 302b 0036                 move.w     54(a3),d0
[0003509a] 6e00 0080                 bgt        del_user_1
[0003509e] 286b 0004                 movea.l    4(a3),a4
[000350a2] 2254                      movea.l    (a4),a1
[000350a4] 4eb9 0003 5dae            jsr        del_ref
[000350aa] 226c 0004                 movea.l    4(a4),a1
[000350ae] 204a                      movea.l    a2,a0
[000350b0] 4eb9 0003 5dae            jsr        del_ref
[000350b6] 226c 0008                 movea.l    8(a4),a1
[000350ba] 204a                      movea.l    a2,a0
[000350bc] 6100 fd16                 bsr        del_2ref
[000350c0] 302b 0038                 move.w     56(a3),d0
[000350c4] 226c 000c                 movea.l    12(a4),a1
[000350c8] 204a                      movea.l    a2,a0
[000350ca] 6100 fd64                 bsr        del_3ref
[000350ce] 302b 0038                 move.w     56(a3),d0
[000350d2] e440                      asr.w      #2,d0
[000350d4] 226c 0010                 movea.l    16(a4),a1
[000350d8] 204a                      movea.l    a2,a0
[000350da] 6100 fd54                 bsr        del_3ref
[000350de] 302b 0038                 move.w     56(a3),d0
[000350e2] e840                      asr.w      #4,d0
[000350e4] 226c 0014                 movea.l    20(a4),a1
[000350e8] 204a                      movea.l    a2,a0
[000350ea] 6100 fd44                 bsr        del_3ref
[000350ee] 7002                      moveq.l    #2,d0
[000350f0] 226c 0018                 movea.l    24(a4),a1
[000350f4] 204a                      movea.l    a2,a0
[000350f6] 6100 fd38                 bsr        del_3ref
[000350fa] 7002                      moveq.l    #2,d0
[000350fc] 226c 001c                 movea.l    28(a4),a1
[00035100] 204a                      movea.l    a2,a0
[00035102] 6100 fd2c                 bsr        del_3ref
[00035106] 224b                      movea.l    a3,a1
[00035108] 206a 0038                 movea.l    56(a2),a0
[0003510c] 4eb9 0003 3420            jsr        del_entry
[00035112] 224b                      movea.l    a3,a1
[00035114] 204a                      movea.l    a2,a0
[00035116] 4eb9 0001 7f52            jsr        objfree
del_user_1:
[0003511c] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00035120] 4e75                      rts

copy_user:
[00035122] 48e7 003e                 movem.l    a2-a6,-(a7)
[00035126] 2448                      movea.l    a0,a2
[00035128] 2849                      movea.l    a1,a4
[0003512a] 7020                      moveq.l    #32,d0
[0003512c] 4eb9 0001 7fae            jsr        objmalloc
[00035132] 2648                      movea.l    a0,a3
[00035134] 200b                      move.l     a3,d0
[00035136] 6606                      bne.s      copy_user_1
[00035138] 91c8                      suba.l     a0,a0
[0003513a] 6000 009e                 bra        copy_user_2
copy_user_1:
[0003513e] 2a6c 0004                 movea.l    4(a4),a5
[00035142] 2c6b 0004                 movea.l    4(a3),a6
[00035146] 277c 0000 0020 000e       move.l     #$00000020,14(a3)
[0003514e] 376c 0038 0038            move.w     56(a4),56(a3)
[00035154] 2255                      movea.l    (a5),a1
[00035156] 204a                      movea.l    a2,a0
[00035158] 4eb9 0003 5c26            jsr        add_ref
[0003515e] 2c88                      move.l     a0,(a6)
[00035160] 226d 0004                 movea.l    4(a5),a1
[00035164] 204a                      movea.l    a2,a0
[00035166] 4eb9 0003 5c26            jsr        add_ref
[0003516c] 2d48 0004                 move.l     a0,4(a6)
[00035170] 226d 0008                 movea.l    8(a5),a1
[00035174] 204a                      movea.l    a2,a0
[00035176] 6100 fc3c                 bsr        add_2ref
[0003517a] 2d48 0008                 move.l     a0,8(a6)
[0003517e] 302c 0038                 move.w     56(a4),d0
[00035182] 226d 000c                 movea.l    12(a5),a1
[00035186] 204a                      movea.l    a2,a0
[00035188] 6100 fc5c                 bsr        add_3ref
[0003518c] 2d48 000c                 move.l     a0,12(a6)
[00035190] 302c 0038                 move.w     56(a4),d0
[00035194] e440                      asr.w      #2,d0
[00035196] 226d 0010                 movea.l    16(a5),a1
[0003519a] 204a                      movea.l    a2,a0
[0003519c] 6100 fc48                 bsr        add_3ref
[000351a0] 2d48 0010                 move.l     a0,16(a6)
[000351a4] 302c 0038                 move.w     56(a4),d0
[000351a8] e840                      asr.w      #4,d0
[000351aa] 226d 0014                 movea.l    20(a5),a1
[000351ae] 204a                      movea.l    a2,a0
[000351b0] 6100 fc34                 bsr        add_3ref
[000351b4] 2d48 0014                 move.l     a0,20(a6)
[000351b8] 7002                      moveq.l    #2,d0
[000351ba] 226d 0018                 movea.l    24(a5),a1
[000351be] 204a                      movea.l    a2,a0
[000351c0] 6100 fc24                 bsr        add_3ref
[000351c4] 2d48 0018                 move.l     a0,24(a6)
[000351c8] 7002                      moveq.l    #2,d0
[000351ca] 226d 001c                 movea.l    28(a5),a1
[000351ce] 204a                      movea.l    a2,a0
[000351d0] 6100 fc14                 bsr        add_3ref
[000351d4] 2d48 001c                 move.l     a0,28(a6)
[000351d8] 204b                      movea.l    a3,a0
copy_user_2:
[000351da] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[000351de] 4e75                      rts

set_udftype:
[000351e0] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000351e4] 2648                      movea.l    a0,a3
[000351e6] 2449                      movea.l    a1,a2
[000351e8] 2601                      move.l     d1,d3
[000351ea] 286f 0014                 movea.l    20(a7),a4
[000351ee] 3400                      move.w     d0,d2
[000351f0] 5342                      subq.w     #1,d2
[000351f2] 670a                      beq.s      set_udftype_1
[000351f4] 5342                      subq.w     #1,d2
[000351f6] 6724                      beq.s      set_udftype_2
[000351f8] 5342                      subq.w     #1,d2
[000351fa] 6744                      beq.s      set_udftype_3
[000351fc] 6062                      bra.s      set_udftype_4
set_udftype_1:
[000351fe] 701f                      moveq.l    #31,d0
[00035200] 224a                      movea.l    a2,a1
[00035202] 41eb 0016                 lea.l      22(a3),a0
[00035206] 4eb9 0008 2fd6            jsr        strncpy
[0003520c] 42ab 0004                 clr.l      4(a3)
[00035210] 7000                      moveq.l    #0,d0
[00035212] 2740 000a                 move.l     d0,10(a3)
[00035216] 2740 000e                 move.l     d0,14(a3)
[0003521a] 6040                      bra.s      set_udftype_5
set_udftype_2:
[0003521c] 43f9 000c e7f0            lea.l      $000CE7F0,a1
[00035222] 41eb 0016                 lea.l      22(a3),a0
[00035226] 4eb9 0008 2f0c            jsr        strcpy
[0003522c] 204a                      movea.l    a2,a0
[0003522e] 4eb9 0008 2f6c            jsr        strlen
[00035234] 5280                      addq.l     #1,d0
[00035236] 2740 000a                 move.l     d0,10(a3)
[0003523a] 2740 000e                 move.l     d0,14(a3)
[0003523e] 6018                      bra.s      set_udftype_6
set_udftype_3:
[00035240] 43f9 000c e7f8            lea.l      $000CE7F8,a1
[00035246] 41eb 0016                 lea.l      22(a3),a0
[0003524a] 4eb9 0008 2f0c            jsr        strcpy
[00035250] 2743 000a                 move.l     d3,10(a3)
[00035254] 2743 000e                 move.l     d3,14(a3)
set_udftype_6:
[00035258] 274a 0004                 move.l     a2,4(a3)
set_udftype_5:
[0003525c] 288b                      move.l     a3,(a4)
[0003525e] 6002                      bra.s      set_udftype_7
set_udftype_4:
[00035260] 4294                      clr.l      (a4)
set_udftype_7:
[00035262] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00035266] 4e75                      rts

set_usertype:
[00035268] 48e7 003e                 movem.l    a2-a6,-(a7)
[0003526c] 2648                      movea.l    a0,a3
[0003526e] 2c49                      movea.l    a1,a6
[00035270] 246f 0018                 movea.l    24(a7),a2
[00035274] 2a6f 001c                 movea.l    28(a7),a5
[00035278] 1012                      move.b     (a2),d0
[0003527a] 6758                      beq.s      set_usertype_1
[0003527c] 206b 0034                 movea.l    52(a3),a0
[00035280] 224a                      movea.l    a2,a1
[00035282] 4eb9 0003 337c            jsr        find_entry
[00035288] 2848                      movea.l    a0,a4
[0003528a] 200c                      move.l     a4,d0
[0003528c] 6706                      beq.s      set_usertype_2
[0003528e] 2a80                      move.l     d0,(a5)
[00035290] 7002                      moveq.l    #2,d0
[00035292] 6044                      bra.s      set_usertype_3
set_usertype_2:
[00035294] 224a                      movea.l    a2,a1
[00035296] 206b 0044                 movea.l    68(a3),a0
[0003529a] 4eb9 0003 337c            jsr        find_entry
[000352a0] 2848                      movea.l    a0,a4
[000352a2] 200c                      move.l     a4,d0
[000352a4] 6706                      beq.s      set_usertype_4
[000352a6] 2a80                      move.l     d0,(a5)
[000352a8] 7003                      moveq.l    #3,d0
[000352aa] 602c                      bra.s      set_usertype_3
set_usertype_4:
[000352ac] 224a                      movea.l    a2,a1
[000352ae] 206b 003c                 movea.l    60(a3),a0
[000352b2] 4eb9 0003 337c            jsr        find_entry
[000352b8] 2848                      movea.l    a0,a4
[000352ba] 200c                      move.l     a4,d0
[000352bc] 6704                      beq.s      set_usertype_5
[000352be] 2a80                      move.l     d0,(a5)
[000352c0] 600e                      bra.s      set_usertype_6
set_usertype_5:
[000352c2] 224a                      movea.l    a2,a1
[000352c4] 41ee 0016                 lea.l      22(a6),a0
[000352c8] 4eb9 0008 2f0c            jsr        strcpy
[000352ce] 2a8e                      move.l     a6,(a5)
set_usertype_6:
[000352d0] 7001                      moveq.l    #1,d0
[000352d2] 6004                      bra.s      set_usertype_3
set_usertype_1:
[000352d4] 4295                      clr.l      (a5)
[000352d6] 4240                      clr.w      d0
set_usertype_3:
[000352d8] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[000352dc] 4e75                      rts

change_user:
[000352de] 48e7 003c                 movem.l    a2-a5,-(a7)
[000352e2] 2648                      movea.l    a0,a3
[000352e4] 2a49                      movea.l    a1,a5
[000352e6] 246f 0014                 movea.l    20(a7),a2
[000352ea] 49f9 000c e78e            lea.l      us_blk,a4
[000352f0] 701f                      moveq.l    #31,d0
[000352f2] 43f9 000c e7f5            lea.l      $000CE7F5,a1
[000352f8] 2f00                      move.l     d0,-(a7)
[000352fa] 2f09                      move.l     a1,-(a7)
[000352fc] 2252                      movea.l    (a2),a1
[000352fe] 41ec 0036                 lea.l      54(a4),a0
[00035302] 4eb9 0008 2f0c            jsr        strcpy
[00035308] 225f                      movea.l    (a7)+,a1
[0003530a] 201f                      move.l     (a7)+,d0
[0003530c] 4eb9 0008 2f96            jsr        strncat
[00035312] 4eb9 0008 3180            jsr        strupr
[00035318] 2252                      movea.l    (a2),a1
[0003531a] 41ec fe06                 lea.l      -506(a4),a0
[0003531e] 4eb9 0008 2f0c            jsr        strcpy
[00035324] 226a 0004                 movea.l    4(a2),a1
[00035328] 41ec fe48                 lea.l      -440(a4),a0
[0003532c] 4eb9 0008 2f0c            jsr        strcpy
[00035332] 206a 0008                 movea.l    8(a2),a0
[00035336] 1010                      move.b     (a0),d0
[00035338] 671c                      beq.s      change_user_1
[0003533a] 2248                      movea.l    a0,a1
[0003533c] 41ec fe8a                 lea.l      -374(a4),a0
[00035340] 701f                      moveq.l    #31,d0
[00035342] 4eb9 0008 2fd6            jsr        strncpy
[00035348] 422c feaa                 clr.b      -342(a4)
[0003534c] 297c 000c e602 0008       move.l     #serv,8(a4)
[00035354] 6004                      bra.s      change_user_2
change_user_1:
[00035356] 42ac 0008                 clr.l      8(a4)
change_user_2:
[0003535a] 486c 000c                 pea.l      12(a4)
[0003535e] 2f2a 000c                 move.l     12(a2),-(a7)
[00035362] 43ec feb6                 lea.l      -330(a4),a1
[00035366] 204b                      movea.l    a3,a0
[00035368] 6100 fefe                 bsr        set_usertype
[0003536c] 504f                      addq.w     #8,a7
[0003536e] 3f00                      move.w     d0,-(a7)
[00035370] 486c 0010                 pea.l      16(a4)
[00035374] 2f2a 0010                 move.l     16(a2),-(a7)
[00035378] 43ec fef8                 lea.l      -264(a4),a1
[0003537c] 204b                      movea.l    a3,a0
[0003537e] 6100 fee8                 bsr        set_usertype
[00035382] 504f                      addq.w     #8,a7
[00035384] e548                      lsl.w      #2,d0
[00035386] 805f                      or.w       (a7)+,d0
[00035388] 3f00                      move.w     d0,-(a7)
[0003538a] 486c 0014                 pea.l      20(a4)
[0003538e] 2f2a 0014                 move.l     20(a2),-(a7)
[00035392] 43ec ff3a                 lea.l      -198(a4),a1
[00035396] 204b                      movea.l    a3,a0
[00035398] 6100 fece                 bsr        set_usertype
[0003539c] 504f                      addq.w     #8,a7
[0003539e] e948                      lsl.w      #4,d0
[000353a0] 805f                      or.w       (a7)+,d0
[000353a2] 3940 0058                 move.w     d0,88(a4)
[000353a6] 206a 0018                 movea.l    24(a2),a0
[000353aa] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000353b0] 4a40                      tst.w      d0
[000353b2] 662a                      bne.s      change_user_3
[000353b4] 302c fdec                 move.w     -532(a4),d0
[000353b8] 48c0                      ext.l      d0
[000353ba] 226a 0018                 movea.l    24(a2),a1
[000353be] 206c ff80                 movea.l    -128(a4),a0
[000353c2] 4eb9 0008 2fd6            jsr        strncpy
[000353c8] 302c fdec                 move.w     -532(a4),d0
[000353cc] 206c ff80                 movea.l    -128(a4),a0
[000353d0] 4230 0000                 clr.b      0(a0,d0.w)
[000353d4] 297c 000c e70a 0018       move.l     #bubble,24(a4)
[000353dc] 6004                      bra.s      change_user_4
change_user_3:
[000353de] 42ac 0018                 clr.l      24(a4)
change_user_4:
[000353e2] 206a 001c                 movea.l    28(a2),a0
[000353e6] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000353ec] 4a40                      tst.w      d0
[000353ee] 662a                      bne.s      change_user_5
[000353f0] 302c fdee                 move.w     -530(a4),d0
[000353f4] 48c0                      ext.l      d0
[000353f6] 226a 0018                 movea.l    24(a2),a1
[000353fa] 206c ffc2                 movea.l    -62(a4),a0
[000353fe] 4eb9 0008 2fd6            jsr        strncpy
[00035404] 302c fdee                 move.w     -530(a4),d0
[00035408] 206c ffc2                 movea.l    -62(a4),a0
[0003540c] 4230 0000                 clr.b      0(a0,d0.w)
[00035410] 297c 000c e74c 001c       move.l     #context,28(a4)
[00035418] 6004                      bra.s      change_user_6
change_user_5:
[0003541a] 42ac 001c                 clr.l      28(a4)
change_user_6:
[0003541e] 43ec 0020                 lea.l      32(a4),a1
[00035422] 204b                      movea.l    a3,a0
[00035424] 6100 fb06                 bsr        add_user
[00035428] 2848                      movea.l    a0,a4
[0003542a] 200c                      move.l     a4,d0
[0003542c] 6708                      beq.s      change_user_7
[0003542e] 224d                      movea.l    a5,a1
[00035430] 204b                      movea.l    a3,a0
[00035432] 6100 fc50                 bsr        del_user
change_user_7:
[00035436] 204c                      movea.l    a4,a0
[00035438] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003543c] 4e75                      rts

chgadd_3ref:
[0003543e] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00035442] 2848                      movea.l    a0,a4
[00035444] 2a49                      movea.l    a1,a5
[00035446] 3600                      move.w     d0,d3
[00035448] 266f 0018                 movea.l    24(a7),a3
[0003544c] 95ca                      suba.l     a2,a2
[0003544e] 240b                      move.l     a3,d2
[00035450] 6752                      beq.s      chgadd_3ref_1
[00035452] 7003                      moveq.l    #3,d0
[00035454] c041                      and.w      d1,d0
[00035456] 5340                      subq.w     #1,d0
[00035458] 670a                      beq.s      chgadd_3ref_2
[0003545a] 5340                      subq.w     #1,d0
[0003545c] 6714                      beq.s      chgadd_3ref_3
[0003545e] 5340                      subq.w     #1,d0
[00035460] 6736                      beq.s      chgadd_3ref_4
[00035462] 6040                      bra.s      chgadd_3ref_1
chgadd_3ref_2:
[00035464] 224b                      movea.l    a3,a1
[00035466] 204c                      movea.l    a4,a0
[00035468] 4eb9 0003 5c26            jsr        add_ref
[0003546e] 2448                      movea.l    a0,a2
[00035470] 6032                      bra.s      chgadd_3ref_1
chgadd_3ref_3:
[00035472] 2015                      move.l     (a5),d0
[00035474] 660e                      bne.s      chgadd_3ref_5
[00035476] 224b                      movea.l    a3,a1
[00035478] 204c                      movea.l    a4,a0
[0003547a] 4eb9 0003 5f3e            jsr        add_string
[00035480] 2448                      movea.l    a0,a2
[00035482] 6020                      bra.s      chgadd_3ref_1
chgadd_3ref_5:
[00035484] 2f2b 0004                 move.l     4(a3),-(a7)
[00035488] 2255                      movea.l    (a5),a1
[0003548a] 204c                      movea.l    a4,a0
[0003548c] 4eb9 0003 607a            jsr        change_string
[00035492] 584f                      addq.w     #4,a7
[00035494] 2448                      movea.l    a0,a2
[00035496] 600c                      bra.s      chgadd_3ref_1
chgadd_3ref_4:
[00035498] 224b                      movea.l    a3,a1
[0003549a] 204c                      movea.l    a4,a0
[0003549c] 4eb9 0003 42d4            jsr        add_data
[000354a2] 2448                      movea.l    a0,a2
chgadd_3ref_1:
[000354a4] 2015                      move.l     (a5),d0
[000354a6] 670e                      beq.s      chgadd_3ref_6
[000354a8] b5c0                      cmpa.l     d0,a2
[000354aa] 670a                      beq.s      chgadd_3ref_6
[000354ac] 2240                      movea.l    d0,a1
[000354ae] 204c                      movea.l    a4,a0
[000354b0] 3003                      move.w     d3,d0
[000354b2] 6100 f97c                 bsr        del_3ref
chgadd_3ref_6:
[000354b6] 2a8a                      move.l     a2,(a5)
[000354b8] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[000354bc] 4e75                      rts

change_udf:
[000354be] 48e7 003e                 movem.l    a2-a6,-(a7)
[000354c2] 594f                      subq.w     #4,a7
[000354c4] 2848                      movea.l    a0,a4
[000354c6] 2449                      movea.l    a1,a2
[000354c8] 2a6f 001c                 movea.l    28(a7),a5
[000354cc] 266a 0004                 movea.l    4(a2),a3
[000354d0] 006c 0001 0006            ori.w      #$0001,6(a4)
[000354d6] 2053                      movea.l    (a3),a0
[000354d8] 41e8 0016                 lea.l      22(a0),a0
[000354dc] 2e88                      move.l     a0,(a7)
[000354de] 4df9 000c e78e            lea.l      us_blk,a6
[000354e4] 701f                      moveq.l    #31,d0
[000354e6] 43f9 000c e7f5            lea.l      $000CE7F5,a1
[000354ec] 2f00                      move.l     d0,-(a7)
[000354ee] 2f09                      move.l     a1,-(a7)
[000354f0] 41ee 0036                 lea.l      54(a6),a0
[000354f4] 226f 0008                 movea.l    8(a7),a1
[000354f8] 4eb9 0008 2f0c            jsr        strcpy
[000354fe] 225f                      movea.l    (a7)+,a1
[00035500] 201f                      move.l     (a7)+,d0
[00035502] 4eb9 0008 2f96            jsr        strncat
[00035508] 4eb9 0008 3180            jsr        strupr
[0003550e] 2257                      movea.l    (a7),a1
[00035510] 41ee fe06                 lea.l      -506(a6),a0
[00035514] 4eb9 0008 2f0c            jsr        strcpy
[0003551a] 2255                      movea.l    (a5),a1
[0003551c] 41ee fe48                 lea.l      -440(a6),a0
[00035520] 4eb9 0008 2f0c            jsr        strcpy
[00035526] 206d 0004                 movea.l    4(a5),a0
[0003552a] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00035530] 4a40                      tst.w      d0
[00035532] 6618                      bne.s      change_udf_1
[00035534] 226d 0004                 movea.l    4(a5),a1
[00035538] 41ee fe8a                 lea.l      -374(a6),a0
[0003553c] 4eb9 0008 2f0c            jsr        strcpy
[00035542] 2d7c 000c e602 0008       move.l     #serv,8(a6)
[0003554a] 6004                      bra.s      change_udf_2
change_udf_1:
[0003554c] 42ae 0008                 clr.l      8(a6)
change_udf_2:
[00035550] 302d 0012                 move.w     18(a5),d0
[00035554] e548                      lsl.w      #2,d0
[00035556] 806d 0008                 or.w       8(a5),d0
[0003555a] 322d 001c                 move.w     28(a5),d1
[0003555e] e949                      lsl.w      #4,d1
[00035560] 8041                      or.w       d1,d0
[00035562] 3d40 0058                 move.w     d0,88(a6)
[00035566] 486e 000c                 pea.l      12(a6)
[0003556a] 222d 000e                 move.l     14(a5),d1
[0003556e] 226d 000a                 movea.l    10(a5),a1
[00035572] 302d 0008                 move.w     8(a5),d0
[00035576] 41ee feb6                 lea.l      -330(a6),a0
[0003557a] 6100 fc64                 bsr        set_udftype
[0003557e] 584f                      addq.w     #4,a7
[00035580] 486e 0010                 pea.l      16(a6)
[00035584] 222d 0018                 move.l     24(a5),d1
[00035588] 226d 0014                 movea.l    20(a5),a1
[0003558c] 302d 0012                 move.w     18(a5),d0
[00035590] 41ee fef8                 lea.l      -264(a6),a0
[00035594] 6100 fc4a                 bsr        set_udftype
[00035598] 584f                      addq.w     #4,a7
[0003559a] 486e 0014                 pea.l      20(a6)
[0003559e] 222d 0022                 move.l     34(a5),d1
[000355a2] 226d 001e                 movea.l    30(a5),a1
[000355a6] 302d 001c                 move.w     28(a5),d0
[000355aa] 41ee ff3a                 lea.l      -198(a6),a0
[000355ae] 6100 fc30                 bsr        set_udftype
[000355b2] 584f                      addq.w     #4,a7
[000355b4] 206d 0026                 movea.l    38(a5),a0
[000355b8] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000355be] 4a40                      tst.w      d0
[000355c0] 6640                      bne.s      change_udf_3
[000355c2] 70ff                      moveq.l    #-1,d0
[000355c4] d06e fdec                 add.w      -532(a6),d0
[000355c8] 48c0                      ext.l      d0
[000355ca] 226d 0026                 movea.l    38(a5),a1
[000355ce] 206e ff80                 movea.l    -128(a6),a0
[000355d2] 4eb9 0008 2fd6            jsr        strncpy
[000355d8] 302e fdec                 move.w     -532(a6),d0
[000355dc] 206e ff80                 movea.l    -128(a6),a0
[000355e0] 4230 0000                 clr.b      0(a0,d0.w)
[000355e4] 206e ff80                 movea.l    -128(a6),a0
[000355e8] 4eb9 0008 2f6c            jsr        strlen
[000355ee] 5280                      addq.l     #1,d0
[000355f0] 2d40 ff8a                 move.l     d0,-118(a6)
[000355f4] 2d40 ff86                 move.l     d0,-122(a6)
[000355f8] 2d7c 000c e70a 0018       move.l     #bubble,24(a6)
[00035600] 6004                      bra.s      change_udf_4
change_udf_3:
[00035602] 42ae 0018                 clr.l      24(a6)
change_udf_4:
[00035606] 206d 002a                 movea.l    42(a5),a0
[0003560a] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00035610] 4a40                      tst.w      d0
[00035612] 6640                      bne.s      change_udf_5
[00035614] 70ff                      moveq.l    #-1,d0
[00035616] d06e fdee                 add.w      -530(a6),d0
[0003561a] 48c0                      ext.l      d0
[0003561c] 226d 002a                 movea.l    42(a5),a1
[00035620] 206e ffc2                 movea.l    -62(a6),a0
[00035624] 4eb9 0008 2fd6            jsr        strncpy
[0003562a] 302e fdee                 move.w     -530(a6),d0
[0003562e] 206e ffc2                 movea.l    -62(a6),a0
[00035632] 4230 0000                 clr.b      0(a0,d0.w)
[00035636] 206e ffc2                 movea.l    -62(a6),a0
[0003563a] 4eb9 0008 2f6c            jsr        strlen
[00035640] 5280                      addq.l     #1,d0
[00035642] 2d40 ffcc                 move.l     d0,-52(a6)
[00035646] 2d40 ffc8                 move.l     d0,-56(a6)
[0003564a] 2d7c 000c e74c 001c       move.l     #context,28(a6)
[00035652] 6004                      bra.s      change_udf_6
change_udf_5:
[00035654] 42ae 001c                 clr.l      28(a6)
change_udf_6:
[00035658] 2a53                      movea.l    (a3),a5
[0003565a] 43ee fdf0                 lea.l      -528(a6),a1
[0003565e] 204c                      movea.l    a4,a0
[00035660] 4eb9 0003 5c26            jsr        add_ref
[00035666] 2688                      move.l     a0,(a3)
[00035668] 2008                      move.l     a0,d0
[0003566a] 670c                      beq.s      change_udf_7
[0003566c] 224d                      movea.l    a5,a1
[0003566e] 204c                      movea.l    a4,a0
[00035670] 4eb9 0003 5dae            jsr        del_ref
[00035676] 6002                      bra.s      change_udf_8
change_udf_7:
[00035678] 268d                      move.l     a5,(a3)
change_udf_8:
[0003567a] 2a6b 0004                 movea.l    4(a3),a5
[0003567e] 43ee fe32                 lea.l      -462(a6),a1
[00035682] 204c                      movea.l    a4,a0
[00035684] 4eb9 0003 5c26            jsr        add_ref
[0003568a] 2748 0004                 move.l     a0,4(a3)
[0003568e] 2008                      move.l     a0,d0
[00035690] 670c                      beq.s      change_udf_9
[00035692] 224d                      movea.l    a5,a1
[00035694] 204c                      movea.l    a4,a0
[00035696] 4eb9 0003 5dae            jsr        del_ref
[0003569c] 6004                      bra.s      change_udf_10
change_udf_9:
[0003569e] 274d 0004                 move.l     a5,4(a3)
change_udf_10:
[000356a2] 202e 0008                 move.l     8(a6),d0
[000356a6] 6724                      beq.s      change_udf_11
[000356a8] 2a6b 0008                 movea.l    8(a3),a5
[000356ac] 43ee fe74                 lea.l      -396(a6),a1
[000356b0] 204c                      movea.l    a4,a0
[000356b2] 6100 f700                 bsr        add_2ref
[000356b6] 2748 0008                 move.l     a0,8(a3)
[000356ba] 2008                      move.l     a0,d0
[000356bc] 670a                      beq.s      change_udf_12
[000356be] 224d                      movea.l    a5,a1
[000356c0] 204c                      movea.l    a4,a0
[000356c2] 6100 f710                 bsr        del_2ref
[000356c6] 6004                      bra.s      change_udf_11
change_udf_12:
[000356c8] 274d 0008                 move.l     a5,8(a3)
change_udf_11:
[000356cc] 2f2e 000c                 move.l     12(a6),-(a7)
[000356d0] 322e 0058                 move.w     88(a6),d1
[000356d4] 302a 0038                 move.w     56(a2),d0
[000356d8] 43eb 000c                 lea.l      12(a3),a1
[000356dc] 204c                      movea.l    a4,a0
[000356de] 6100 fd5e                 bsr        chgadd_3ref
[000356e2] 584f                      addq.w     #4,a7
[000356e4] 2f2e 0010                 move.l     16(a6),-(a7)
[000356e8] 322e 0058                 move.w     88(a6),d1
[000356ec] e441                      asr.w      #2,d1
[000356ee] 302a 0038                 move.w     56(a2),d0
[000356f2] e440                      asr.w      #2,d0
[000356f4] 43eb 0010                 lea.l      16(a3),a1
[000356f8] 204c                      movea.l    a4,a0
[000356fa] 6100 fd42                 bsr        chgadd_3ref
[000356fe] 584f                      addq.w     #4,a7
[00035700] 2f2e 0014                 move.l     20(a6),-(a7)
[00035704] 322e 0058                 move.w     88(a6),d1
[00035708] e841                      asr.w      #4,d1
[0003570a] 302a 0038                 move.w     56(a2),d0
[0003570e] e840                      asr.w      #4,d0
[00035710] 43eb 0014                 lea.l      20(a3),a1
[00035714] 204c                      movea.l    a4,a0
[00035716] 6100 fd26                 bsr        chgadd_3ref
[0003571a] 584f                      addq.w     #4,a7
[0003571c] 2f2e 0018                 move.l     24(a6),-(a7)
[00035720] 7202                      moveq.l    #2,d1
[00035722] 7002                      moveq.l    #2,d0
[00035724] 43eb 0018                 lea.l      24(a3),a1
[00035728] 204c                      movea.l    a4,a0
[0003572a] 6100 fd12                 bsr        chgadd_3ref
[0003572e] 584f                      addq.w     #4,a7
[00035730] 2f2e 001c                 move.l     28(a6),-(a7)
[00035734] 7202                      moveq.l    #2,d1
[00035736] 7002                      moveq.l    #2,d0
[00035738] 43eb 001c                 lea.l      28(a3),a1
[0003573c] 204c                      movea.l    a4,a0
[0003573e] 6100 fcfe                 bsr        chgadd_3ref
[00035742] 584f                      addq.w     #4,a7
[00035744] 70c0                      moveq.l    #-64,d0
[00035746] c06a 0038                 and.w      56(a2),d0
[0003574a] 723f                      moveq.l    #63,d1
[0003574c] c26e 0058                 and.w      88(a6),d1
[00035750] 8041                      or.w       d1,d0
[00035752] 3540 0038                 move.w     d0,56(a2)
[00035756] 584f                      addq.w     #4,a7
[00035758] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[0003575c] 4e75                      rts

new_work:
[0003575e] 303c 271f                 move.w     #$271F,d0
[00035762] 2279 000b 3270            movea.l    $000B3270,a1
[00035768] 4eb9 0003 3dd6            jsr        work_icon
[0003576e] 4e75                      rts

	.data

list_user:
[000ce550]                           dc.w $0000
[000ce552]                           dc.w $0000
[000ce554]                           dc.w $0000
[000ce556]                           dc.w $0000
[000ce558] 000b3216                  dc.l WI_USER
[000ce55c] 000cd12c                  dc.l us_list
[000ce560] 000cd13c                  dc.l us_name
[000ce564]                           dc.w $271f
[000ce566]                           dc.w $0000
[000ce568]                           dc.w $0000
[000ce56a] 00035122                  dc.l copy_user
[000ce56e] 00035084                  dc.l del_user
[000ce572] 0003575e                  dc.l new_work
[000ce576]                           dc.w $0000
[000ce578]                           dc.w $0000
bubble_len:
[000ce57a]                           dc.w $0102
context_len:
[000ce57c]                           dc.w $0102
call:
[000ce57e]                           dc.w $0000
[000ce580]                           dc.w $0000
[000ce582]                           dc.w $0000
[000ce584]                           dc.w $0000
[000ce586]                           dc.w $0000
[000ce588]                           dc.w $0000
[000ce58a]                           dc.w $0000
[000ce58c]                           dc.w $0000
[000ce58e]                           dc.w $0000
[000ce590]                           dc.w $0000
[000ce592]                           dc.w $0000
[000ce594]                           dc.w $0000
[000ce596]                           dc.w $0000
[000ce598]                           dc.w $0000
[000ce59a]                           dc.w $0000
[000ce59c]                           dc.w $0000
[000ce59e]                           dc.w $0000
[000ce5a0]                           dc.w $0000
[000ce5a2]                           dc.w $0000
[000ce5a4]                           dc.w $0000
[000ce5a6]                           dc.w $0000
[000ce5a8]                           dc.w $0000
[000ce5aa]                           dc.w $0000
[000ce5ac]                           dc.w $0000
[000ce5ae]                           dc.w $0000
[000ce5b0]                           dc.w $0000
[000ce5b2]                           dc.w $0000
[000ce5b4]                           dc.w $0001
[000ce5b6]                           dc.w $0003
[000ce5b8]                           dc.w $0000
[000ce5ba]                           dc.w $0000
[000ce5bc]                           dc.w $0000
[000ce5be]                           dc.w $0000
parm:
[000ce5c0]                           dc.w $0000
[000ce5c2]                           dc.w $0000
[000ce5c4]                           dc.w $0000
[000ce5c6]                           dc.w $0000
[000ce5c8]                           dc.w $0000
[000ce5ca]                           dc.w $0000
[000ce5cc]                           dc.w $0000
[000ce5ce]                           dc.w $0000
[000ce5d0]                           dc.w $0000
[000ce5d2]                           dc.w $0000
[000ce5d4]                           dc.w $0000
[000ce5d6]                           dc.w $0000
[000ce5d8]                           dc.w $0000
[000ce5da]                           dc.w $0000
[000ce5dc]                           dc.w $0000
[000ce5de]                           dc.w $0000
[000ce5e0]                           dc.w $0000
[000ce5e2]                           dc.w $0000
[000ce5e4]                           dc.w $0000
[000ce5e6]                           dc.w $0000
[000ce5e8]                           dc.w $0000
[000ce5ea]                           dc.w $0000
[000ce5ec]                           dc.w $0000
[000ce5ee]                           dc.w $0000
[000ce5f0]                           dc.w $0000
[000ce5f2]                           dc.w $0000
[000ce5f4]                           dc.w $0000
[000ce5f6]                           dc.w $0001
[000ce5f8]                           dc.w $0000
[000ce5fa]                           dc.w $0000
[000ce5fc]                           dc.w $0000
[000ce5fe]                           dc.w $0000
[000ce600]                           dc.w $0000
serv:
[000ce602]                           dc.w $0000
[000ce604]                           dc.w $0000
[000ce606]                           dc.w $0000
[000ce608]                           dc.w $0000
[000ce60a]                           dc.w $0000
[000ce60c]                           dc.w $0000
[000ce60e]                           dc.w $0000
[000ce610]                           dc.w $0000
[000ce612]                           dc.w $0000
[000ce614]                           dc.w $0000
[000ce616]                           dc.w $0000
[000ce618]                           dc.w $0000
[000ce61a]                           dc.w $0000
[000ce61c]                           dc.w $0000
[000ce61e]                           dc.w $0000
[000ce620]                           dc.w $0000
[000ce622]                           dc.w $0000
[000ce624]                           dc.w $0000
[000ce626]                           dc.w $0000
[000ce628]                           dc.w $0000
[000ce62a]                           dc.w $0000
[000ce62c]                           dc.w $0000
[000ce62e]                           dc.w $0000
[000ce630]                           dc.w $0000
[000ce632]                           dc.w $0000
[000ce634]                           dc.w $0000
[000ce636]                           dc.w $0000
[000ce638]                           dc.w $0001
[000ce63a]                           dc.w $0004
[000ce63c]                           dc.w $0000
[000ce63e]                           dc.w $0000
[000ce640]                           dc.w $0000
[000ce642]                           dc.w $0000
ptr1:
[000ce644]                           dc.w $0000
[000ce646]                           dc.w $0000
[000ce648]                           dc.w $0000
[000ce64a]                           dc.w $0000
[000ce64c]                           dc.w $0000
[000ce64e]                           dc.w $0000
[000ce650]                           dc.w $0000
[000ce652]                           dc.w $0000
[000ce654]                           dc.w $0000
[000ce656]                           dc.w $0000
[000ce658]                           dc.w $0000
[000ce65a]                           dc.w $0000
[000ce65c]                           dc.w $0000
[000ce65e]                           dc.w $0000
[000ce660]                           dc.w $0000
[000ce662]                           dc.w $0000
[000ce664]                           dc.w $0000
[000ce666]                           dc.w $0000
[000ce668]                           dc.w $0000
[000ce66a]                           dc.w $0000
[000ce66c]                           dc.w $0000
[000ce66e]                           dc.w $0000
[000ce670]                           dc.w $0000
[000ce672]                           dc.w $0000
[000ce674]                           dc.w $0000
[000ce676]                           dc.w $0000
[000ce678]                           dc.w $0000
[000ce67a]                           dc.w $0001
[000ce67c]                           dc.w $0000
[000ce67e]                           dc.w $0000
[000ce680]                           dc.w $0000
[000ce682]                           dc.w $0000
[000ce684]                           dc.w $0000
ptr2:
[000ce686]                           dc.w $0000
[000ce688]                           dc.w $0000
[000ce68a]                           dc.w $0000
[000ce68c]                           dc.w $0000
[000ce68e]                           dc.w $0000
[000ce690]                           dc.w $0000
[000ce692]                           dc.w $0000
[000ce694]                           dc.w $0000
[000ce696]                           dc.w $0000
[000ce698]                           dc.w $0000
[000ce69a]                           dc.w $0000
[000ce69c]                           dc.w $0000
[000ce69e]                           dc.w $0000
[000ce6a0]                           dc.w $0000
[000ce6a2]                           dc.w $0000
[000ce6a4]                           dc.w $0000
[000ce6a6]                           dc.w $0000
[000ce6a8]                           dc.w $0000
[000ce6aa]                           dc.w $0000
[000ce6ac]                           dc.w $0000
[000ce6ae]                           dc.w $0000
[000ce6b0]                           dc.w $0000
[000ce6b2]                           dc.w $0000
[000ce6b4]                           dc.w $0000
[000ce6b6]                           dc.w $0000
[000ce6b8]                           dc.w $0000
[000ce6ba]                           dc.w $0000
[000ce6bc]                           dc.w $0001
[000ce6be]                           dc.w $0000
[000ce6c0]                           dc.w $0000
[000ce6c2]                           dc.w $0000
[000ce6c4]                           dc.w $0000
[000ce6c6]                           dc.w $0000
ptr3:
[000ce6c8]                           dc.w $0000
[000ce6ca]                           dc.w $0000
[000ce6cc]                           dc.w $0000
[000ce6ce]                           dc.w $0000
[000ce6d0]                           dc.w $0000
[000ce6d2]                           dc.w $0000
[000ce6d4]                           dc.w $0000
[000ce6d6]                           dc.w $0000
[000ce6d8]                           dc.w $0000
[000ce6da]                           dc.w $0000
[000ce6dc]                           dc.w $0000
[000ce6de]                           dc.w $0000
[000ce6e0]                           dc.w $0000
[000ce6e2]                           dc.w $0000
[000ce6e4]                           dc.w $0000
[000ce6e6]                           dc.w $0000
[000ce6e8]                           dc.w $0000
[000ce6ea]                           dc.w $0000
[000ce6ec]                           dc.w $0000
[000ce6ee]                           dc.w $0000
[000ce6f0]                           dc.w $0000
[000ce6f2]                           dc.w $0000
[000ce6f4]                           dc.w $0000
[000ce6f6]                           dc.w $0000
[000ce6f8]                           dc.w $0000
[000ce6fa]                           dc.w $0000
[000ce6fc]                           dc.w $0000
[000ce6fe]                           dc.w $0001
[000ce700]                           dc.w $0000
[000ce702]                           dc.w $0000
[000ce704]                           dc.w $0000
[000ce706]                           dc.w $0000
[000ce708]                           dc.w $0000
bubble:
[000ce70a]                           dc.w $0000
[000ce70c]                           dc.w $0000
[000ce70e] 0010c62e                  dc.l bubble_string
[000ce712]                           dc.w $0000
[000ce714]                           dc.w $0000
[000ce716]                           dc.w $0000
[000ce718]                           dc.w $0000
[000ce71a]                           dc.w $0000
[000ce71c]                           dc.w $0000
[000ce71e]                           dc.w $0000
[000ce720]                           dc.b 'BUBBLE_01',0
[000ce72a]                           dc.w $0000
[000ce72c]                           dc.w $0000
[000ce72e]                           dc.w $0000
[000ce730]                           dc.w $0000
[000ce732]                           dc.w $0000
[000ce734]                           dc.w $0000
[000ce736]                           dc.w $0000
[000ce738]                           dc.w $0000
[000ce73a]                           dc.w $0000
[000ce73c]                           dc.w $0000
[000ce73e]                           dc.w $0000
[000ce740]                           dc.w $0001
[000ce742]                           dc.w $0000
[000ce744]                           dc.w $0000
[000ce746]                           dc.w $0000
[000ce748]                           dc.w $0000
[000ce74a]                           dc.w $0000
context:
[000ce74c]                           dc.w $0000
[000ce74e]                           dc.w $0000
[000ce750] 0010c730                  dc.l context_string
[000ce754]                           dc.w $0000
[000ce756]                           dc.w $0000
[000ce758]                           dc.w $0000
[000ce75a]                           dc.w $0000
[000ce75c]                           dc.w $0000
[000ce75e]                           dc.w $0000
[000ce760]                           dc.w $0000
[000ce762]                           dc.b 'CONTEXT_01',0
[000ce76d]                           dc.b $00
[000ce76e]                           dc.w $0000
[000ce770]                           dc.w $0000
[000ce772]                           dc.w $0000
[000ce774]                           dc.w $0000
[000ce776]                           dc.w $0000
[000ce778]                           dc.w $0000
[000ce77a]                           dc.w $0000
[000ce77c]                           dc.w $0000
[000ce77e]                           dc.w $0000
[000ce780]                           dc.w $0000
[000ce782]                           dc.w $0001
[000ce784]                           dc.w $0000
[000ce786]                           dc.w $0000
[000ce788]                           dc.w $0000
[000ce78a]                           dc.w $0000
[000ce78c]                           dc.w $0000
us_blk:
[000ce78e] 000ce57e                  dc.l call
[000ce792] 000ce5c0                  dc.l parm
[000ce796]                           dc.w $0000
[000ce798]                           dc.w $0000
[000ce79a]                           dc.w $0000
[000ce79c]                           dc.w $0000
[000ce79e]                           dc.w $0000
[000ce7a0]                           dc.w $0000
[000ce7a2]                           dc.w $0000
[000ce7a4]                           dc.w $0000
[000ce7a6] 000ce70a                  dc.l bubble
[000ce7aa] 000ce74c                  dc.l context
new_user:
[000ce7ae]                           dc.w $0000
[000ce7b0]                           dc.w $0000
[000ce7b2] 000ce78e                  dc.l us_blk
[000ce7b6]                           dc.w $0000
[000ce7b8]                           dc.w $0000
[000ce7ba]                           dc.w $0020
[000ce7bc]                           dc.w $0000
[000ce7be]                           dc.w $0020
[000ce7c0]                           dc.w $0000
[000ce7c2]                           dc.w $0000
[000ce7c4]                           dc.b 'USERBLK_01',0
[000ce7cf]                           dc.b $00
[000ce7d0]                           dc.w $0000
[000ce7d2]                           dc.w $0000
[000ce7d4]                           dc.w $0000
[000ce7d6]                           dc.w $0000
[000ce7d8]                           dc.w $0000
[000ce7da]                           dc.w $0000
[000ce7dc]                           dc.w $0000
[000ce7de]                           dc.w $0000
[000ce7e0]                           dc.w $0000
[000ce7e2]                           dc.w $0000
[000ce7e4]                           dc.w $0001
[000ce7e6]                           dc.w $0000
[000ce7e8]                           dc.w $0000
[000ce7ea]                           dc.w $0000
[000ce7ec]                           dc.w $0000
[000ce7ee]                           dc.w $0000
[000ce7f0]                           dc.b 'TEXT_01',0
[000ce7f8]                           dc.b 'DATAS_01',0
[000ce801]                           dc.b $00

