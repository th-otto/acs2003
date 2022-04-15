Alu_create:
[00070c0a] 594f                      subq.w     #4,a7
[00070c0c] 7044                      moveq.l    #68,d0
[00070c0e] 4eb9 0004 c608            jsr        Ax_malloc
[00070c14] 2e88                      move.l     a0,(a7)
[00070c16] 2017                      move.l     (a7),d0
[00070c18] 6604                      bne.s      $00070C1E
[00070c1a] 91c8                      suba.l     a0,a0
[00070c1c] 603c                      bra.s      $00070C5A
[00070c1e] 7044                      moveq.l    #68,d0
[00070c20] 43f9 000e 3298            lea.l      empty,a1
[00070c26] 2057                      movea.l    (a7),a0
[00070c28] 4eb9 0008 3500            jsr        memcpy
[00070c2e] 7014                      moveq.l    #20,d0
[00070c30] 4eb9 0004 c608            jsr        Ax_malloc
[00070c36] 2257                      movea.l    (a7),a1
[00070c38] 2288                      move.l     a0,(a1)
[00070c3a] 2057                      movea.l    (a7),a0
[00070c3c] 2010                      move.l     (a0),d0
[00070c3e] 660e                      bne.s      $00070C4E
[00070c40] 7044                      moveq.l    #68,d0
[00070c42] 2057                      movea.l    (a7),a0
[00070c44] 4eb9 0004 cc28            jsr        Ax_recycle
[00070c4a] 91c8                      suba.l     a0,a0
[00070c4c] 600c                      bra.s      $00070C5A
[00070c4e] 2057                      movea.l    (a7),a0
[00070c50] 2050                      movea.l    (a0),a0
[00070c52] 4eb9 0007 0c86            jsr        InitLinListe
[00070c58] 2057                      movea.l    (a7),a0
[00070c5a] 584f                      addq.w     #4,a7
[00070c5c] 4e75                      rts
Alu_delete:
[00070c5e] 594f                      subq.w     #4,a7
[00070c60] 2e88                      move.l     a0,(a7)
[00070c62] 2017                      move.l     (a7),d0
[00070c64] 671c                      beq.s      $00070C82
[00070c66] 2057                      movea.l    (a7),a0
[00070c68] 4eb9 0007 0caa            jsr        Alu_clearElem
[00070c6e] 2057                      movea.l    (a7),a0
[00070c70] 2050                      movea.l    (a0),a0
[00070c72] 4eb9 0004 c7c8            jsr        Ax_free
[00070c78] 7044                      moveq.l    #68,d0
[00070c7a] 2057                      movea.l    (a7),a0
[00070c7c] 4eb9 0004 cc28            jsr        Ax_recycle
[00070c82] 584f                      addq.w     #4,a7
[00070c84] 4e75                      rts
InitLinListe:
[00070c86] 594f                      subq.w     #4,a7
[00070c88] 2e88                      move.l     a0,(a7)
[00070c8a] 2057                      movea.l    (a7),a0
[00070c8c] 4290                      clr.l      (a0)
[00070c8e] 2057                      movea.l    (a7),a0
[00070c90] 42a8 0004                 clr.l      4(a0)
[00070c94] 2057                      movea.l    (a7),a0
[00070c96] 42a8 0008                 clr.l      8(a0)
[00070c9a] 2057                      movea.l    (a7),a0
[00070c9c] 42a8 000c                 clr.l      12(a0)
[00070ca0] 2057                      movea.l    (a7),a0
[00070ca2] 42a8 0010                 clr.l      16(a0)
[00070ca6] 584f                      addq.w     #4,a7
[00070ca8] 4e75                      rts
Alu_clearElem:
[00070caa] 4fef fff0                 lea.l      -16(a7),a7
[00070cae] 2f48 000c                 move.l     a0,12(a7)
[00070cb2] 206f 000c                 movea.l    12(a7),a0
[00070cb6] 2f50 0008                 move.l     (a0),8(a7)
[00070cba] 206f 0008                 movea.l    8(a7),a0
[00070cbe] 2f50 0004                 move.l     (a0),4(a7)
[00070cc2] 6032                      bra.s      $00070CF6
[00070cc4] 206f 0004                 movea.l    4(a7),a0
[00070cc8] 2e90                      move.l     (a0),(a7)
[00070cca] 206f 000c                 movea.l    12(a7),a0
[00070cce] 2028 0004                 move.l     4(a0),d0
[00070cd2] 6712                      beq.s      $00070CE6
[00070cd4] 206f 0004                 movea.l    4(a7),a0
[00070cd8] 2068 0008                 movea.l    8(a0),a0
[00070cdc] 226f 000c                 movea.l    12(a7),a1
[00070ce0] 2269 0004                 movea.l    4(a1),a1
[00070ce4] 4e91                      jsr        (a1)
[00070ce6] 700c                      moveq.l    #12,d0
[00070ce8] 206f 0004                 movea.l    4(a7),a0
[00070cec] 4eb9 0004 cc28            jsr        Ax_recycle
[00070cf2] 2f57 0004                 move.l     (a7),4(a7)
[00070cf6] 202f 0004                 move.l     4(a7),d0
[00070cfa] 66c8                      bne.s      $00070CC4
[00070cfc] 206f 0008                 movea.l    8(a7),a0
[00070d00] 6100 ff84                 bsr.w      InitLinListe
[00070d04] 4fef 0010                 lea.l      16(a7),a7
[00070d08] 4e75                      rts
Alu_appendElem:
[00070d0a] 4fef fff0                 lea.l      -16(a7),a7
[00070d0e] 2f48 000c                 move.l     a0,12(a7)
[00070d12] 2f49 0008                 move.l     a1,8(a7)
[00070d16] 42af 0004                 clr.l      4(a7)
[00070d1a] 206f 000c                 movea.l    12(a7),a0
[00070d1e] 2e90                      move.l     (a0),(a7)
[00070d20] 700c                      moveq.l    #12,d0
[00070d22] 4eb9 0004 c608            jsr        Ax_malloc
[00070d28] 2f48 0004                 move.l     a0,4(a7)
[00070d2c] 202f 0004                 move.l     4(a7),d0
[00070d30] 6604                      bne.s      $00070D36
[00070d32] 4240                      clr.w      d0
[00070d34] 6062                      bra.s      $00070D98
[00070d36] 206f 0004                 movea.l    4(a7),a0
[00070d3a] 216f 0008 0008            move.l     8(a7),8(a0)
[00070d40] 7000                      moveq.l    #0,d0
[00070d42] 206f 0004                 movea.l    4(a7),a0
[00070d46] 2140 0004                 move.l     d0,4(a0)
[00070d4a] 206f 0004                 movea.l    4(a7),a0
[00070d4e] 2080                      move.l     d0,(a0)
[00070d50] 2057                      movea.l    (a7),a0
[00070d52] 2010                      move.l     (a0),d0
[00070d54] 6614                      bne.s      $00070D6A
[00070d56] 2057                      movea.l    (a7),a0
[00070d58] 20af 0004                 move.l     4(a7),(a0)
[00070d5c] 2057                      movea.l    (a7),a0
[00070d5e] 216f 0004 000c            move.l     4(a7),12(a0)
[00070d64] 2057                      movea.l    (a7),a0
[00070d66] 42a8 0010                 clr.l      16(a0)
[00070d6a] 2057                      movea.l    (a7),a0
[00070d6c] 2028 0004                 move.l     4(a0),d0
[00070d70] 670a                      beq.s      $00070D7C
[00070d72] 2057                      movea.l    (a7),a0
[00070d74] 2068 0004                 movea.l    4(a0),a0
[00070d78] 20af 0004                 move.l     4(a7),(a0)
[00070d7c] 2057                      movea.l    (a7),a0
[00070d7e] 226f 0004                 movea.l    4(a7),a1
[00070d82] 2368 0004 0004            move.l     4(a0),4(a1)
[00070d88] 2057                      movea.l    (a7),a0
[00070d8a] 216f 0004 0004            move.l     4(a7),4(a0)
[00070d90] 2057                      movea.l    (a7),a0
[00070d92] 52a8 0008                 addq.l     #1,8(a0)
[00070d96] 7001                      moveq.l    #1,d0
[00070d98] 4fef 0010                 lea.l      16(a7),a7
[00070d9c] 4e75                      rts
Alu_insertElem:
[00070d9e] 4fef ffe6                 lea.l      -26(a7),a7
[00070da2] 2f48 0016                 move.l     a0,22(a7)
[00070da6] 2f49 0012                 move.l     a1,18(a7)
[00070daa] 3f40 0010                 move.w     d0,16(a7)
[00070dae] 42af 0008                 clr.l      8(a7)
[00070db2] 42af 0004                 clr.l      4(a7)
[00070db6] 206f 0016                 movea.l    22(a7),a0
[00070dba] 2e90                      move.l     (a0),(a7)
[00070dbc] 700c                      moveq.l    #12,d0
[00070dbe] 4eb9 0004 c608            jsr        Ax_malloc
[00070dc4] 2f48 0008                 move.l     a0,8(a7)
[00070dc8] 202f 0008                 move.l     8(a7),d0
[00070dcc] 6606                      bne.s      $00070DD4
[00070dce] 4240                      clr.w      d0
[00070dd0] 6000 00c4                 bra        $00070E96
[00070dd4] 42af 000c                 clr.l      12(a7)
[00070dd8] 2057                      movea.l    (a7),a0
[00070dda] 2f50 0004                 move.l     (a0),4(a7)
[00070dde] 600c                      bra.s      $00070DEC
[00070de0] 206f 0004                 movea.l    4(a7),a0
[00070de4] 2f50 0004                 move.l     (a0),4(a7)
[00070de8] 52af 000c                 addq.l     #1,12(a7)
[00070dec] 70ff                      moveq.l    #-1,d0
[00070dee] d06f 0010                 add.w      16(a7),d0
[00070df2] 48c0                      ext.l      d0
[00070df4] 222f 000c                 move.l     12(a7),d1
[00070df8] b280                      cmp.l      d0,d1
[00070dfa] 6c06                      bge.s      $00070E02
[00070dfc] 202f 0004                 move.l     4(a7),d0
[00070e00] 66de                      bne.s      $00070DE0
[00070e02] 70ff                      moveq.l    #-1,d0
[00070e04] d06f 0010                 add.w      16(a7),d0
[00070e08] 48c0                      ext.l      d0
[00070e0a] 222f 000c                 move.l     12(a7),d1
[00070e0e] b280                      cmp.l      d0,d1
[00070e10] 6606                      bne.s      $00070E18
[00070e12] 202f 0004                 move.l     4(a7),d0
[00070e16] 6608                      bne.s      $00070E20
[00070e18] 2057                      movea.l    (a7),a0
[00070e1a] 2f68 0004 0004            move.l     4(a0),4(a7)
[00070e20] 206f 0008                 movea.l    8(a7),a0
[00070e24] 216f 0012 0008            move.l     18(a7),8(a0)
[00070e2a] 206f 0008                 movea.l    8(a7),a0
[00070e2e] 4290                      clr.l      (a0)
[00070e30] 202f 0004                 move.l     4(a7),d0
[00070e34] 673c                      beq.s      $00070E72
[00070e36] 206f 0004                 movea.l    4(a7),a0
[00070e3a] 226f 0008                 movea.l    8(a7),a1
[00070e3e] 2290                      move.l     (a0),(a1)
[00070e40] 206f 0004                 movea.l    4(a7),a0
[00070e44] 20af 0008                 move.l     8(a7),(a0)
[00070e48] 206f 0008                 movea.l    8(a7),a0
[00070e4c] 216f 0004 0004            move.l     4(a7),4(a0)
[00070e52] 206f 0008                 movea.l    8(a7),a0
[00070e56] 2010                      move.l     (a0),d0
[00070e58] 670e                      beq.s      $00070E68
[00070e5a] 206f 0008                 movea.l    8(a7),a0
[00070e5e] 2050                      movea.l    (a0),a0
[00070e60] 216f 0008 0004            move.l     8(a7),4(a0)
[00070e66] 6008                      bra.s      $00070E70
[00070e68] 2057                      movea.l    (a7),a0
[00070e6a] 216f 0008 0004            move.l     8(a7),4(a0)
[00070e70] 601c                      bra.s      $00070E8E
[00070e72] 206f 0008                 movea.l    8(a7),a0
[00070e76] 2257                      movea.l    (a7),a1
[00070e78] 2348 0004                 move.l     a0,4(a1)
[00070e7c] 2257                      movea.l    (a7),a1
[00070e7e] 2288                      move.l     a0,(a1)
[00070e80] 2057                      movea.l    (a7),a0
[00070e82] 216f 0008 000c            move.l     8(a7),12(a0)
[00070e88] 2057                      movea.l    (a7),a0
[00070e8a] 42a8 0010                 clr.l      16(a0)
[00070e8e] 2057                      movea.l    (a7),a0
[00070e90] 52a8 0008                 addq.l     #1,8(a0)
[00070e94] 7001                      moveq.l    #1,d0
[00070e96] 4fef 001a                 lea.l      26(a7),a7
[00070e9a] 4e75                      rts
Alu_deleteElem:
[00070e9c] 4fef ffe6                 lea.l      -26(a7),a7
[00070ea0] 2f48 0016                 move.l     a0,22(a7)
[00070ea4] 3f40 0014                 move.w     d0,20(a7)
[00070ea8] 42af 000c                 clr.l      12(a7)
[00070eac] 42af 0008                 clr.l      8(a7)
[00070eb0] 206f 0016                 movea.l    22(a7),a0
[00070eb4] 2f50 0004                 move.l     (a0),4(a7)
[00070eb8] 42af 0010                 clr.l      16(a7)
[00070ebc] 42af 000c                 clr.l      12(a7)
[00070ec0] 206f 0004                 movea.l    4(a7),a0
[00070ec4] 2f50 0008                 move.l     (a0),8(a7)
[00070ec8] 6012                      bra.s      $00070EDC
[00070eca] 2f6f 0008 000c            move.l     8(a7),12(a7)
[00070ed0] 206f 0008                 movea.l    8(a7),a0
[00070ed4] 2f50 0008                 move.l     (a0),8(a7)
[00070ed8] 52af 0010                 addq.l     #1,16(a7)
[00070edc] 302f 0014                 move.w     20(a7),d0
[00070ee0] 48c0                      ext.l      d0
[00070ee2] 222f 0010                 move.l     16(a7),d1
[00070ee6] b280                      cmp.l      d0,d1
[00070ee8] 6c06                      bge.s      $00070EF0
[00070eea] 202f 0008                 move.l     8(a7),d0
[00070eee] 66da                      bne.s      $00070ECA
[00070ef0] 302f 0014                 move.w     20(a7),d0
[00070ef4] 48c0                      ext.l      d0
[00070ef6] 222f 0010                 move.l     16(a7),d1
[00070efa] b280                      cmp.l      d0,d1
[00070efc] 6706                      beq.s      $00070F04
[00070efe] 91c8                      suba.l     a0,a0
[00070f00] 6000 007e                 bra.w      $00070F80
[00070f04] 202f 000c                 move.l     12(a7),d0
[00070f08] 670c                      beq.s      $00070F16
[00070f0a] 206f 0008                 movea.l    8(a7),a0
[00070f0e] 226f 000c                 movea.l    12(a7),a1
[00070f12] 2290                      move.l     (a0),(a1)
[00070f14] 600a                      bra.s      $00070F20
[00070f16] 206f 0008                 movea.l    8(a7),a0
[00070f1a] 226f 0004                 movea.l    4(a7),a1
[00070f1e] 2290                      move.l     (a0),(a1)
[00070f20] 206f 0008                 movea.l    8(a7),a0
[00070f24] 2010                      move.l     (a0),d0
[00070f26] 670e                      beq.s      $00070F36
[00070f28] 206f 0008                 movea.l    8(a7),a0
[00070f2c] 2050                      movea.l    (a0),a0
[00070f2e] 216f 000c 0004            move.l     12(a7),4(a0)
[00070f34] 600a                      bra.s      $00070F40
[00070f36] 206f 0004                 movea.l    4(a7),a0
[00070f3a] 216f 000c 0004            move.l     12(a7),4(a0)
[00070f40] 206f 0004                 movea.l    4(a7),a0
[00070f44] 53a8 0008                 subq.l     #1,8(a0)
[00070f48] 206f 0004                 movea.l    4(a7),a0
[00070f4c] 2068 000c                 movea.l    12(a0),a0
[00070f50] b1ef 0008                 cmpa.l     8(a7),a0
[00070f54] 6614                      bne.s      $00070F6A
[00070f56] 206f 0004                 movea.l    4(a7),a0
[00070f5a] 226f 0004                 movea.l    4(a7),a1
[00070f5e] 2350 000c                 move.l     (a0),12(a1)
[00070f62] 206f 0004                 movea.l    4(a7),a0
[00070f66] 42a8 0010                 clr.l      16(a0)
[00070f6a] 206f 0008                 movea.l    8(a7),a0
[00070f6e] 2ea8 0008                 move.l     8(a0),(a7)
[00070f72] 700c                      moveq.l    #12,d0
[00070f74] 206f 0008                 movea.l    8(a7),a0
[00070f78] 4eb9 0004 cc28            jsr        Ax_recycle
[00070f7e] 2057                      movea.l    (a7),a0
[00070f80] 4fef 001a                 lea.l      26(a7),a7
[00070f84] 4e75                      rts
Alu_ptrCmp:
[00070f86] 514f                      subq.w     #8,a7
[00070f88] 2f48 0004                 move.l     a0,4(a7)
[00070f8c] 2e89                      move.l     a1,(a7)
[00070f8e] 206f 0004                 movea.l    4(a7),a0
[00070f92] b1d7                      cmpa.l     (a7),a0
[00070f94] 6604                      bne.s      $00070F9A
[00070f96] 7001                      moveq.l    #1,d0
[00070f98] 6002                      bra.s      $00070F9C
[00070f9a] 4240                      clr.w      d0
[00070f9c] 504f                      addq.w     #8,a7
[00070f9e] 4e75                      rts
Alu_deleteForElem:
[00070fa0] 2f0a                      move.l     a2,-(a7)
[00070fa2] 4fef ffe8                 lea.l      -24(a7),a7
[00070fa6] 2f48 0014                 move.l     a0,20(a7)
[00070faa] 2f49 0010                 move.l     a1,16(a7)
[00070fae] 42af 000c                 clr.l      12(a7)
[00070fb2] 42af 0008                 clr.l      8(a7)
[00070fb6] 42af 0004                 clr.l      4(a7)
[00070fba] 206f 0014                 movea.l    20(a7),a0
[00070fbe] 2e90                      move.l     (a0),(a7)
[00070fc0] 42af 0004                 clr.l      4(a7)
[00070fc4] 2057                      movea.l    (a7),a0
[00070fc6] 2f50 0008                 move.l     (a0),8(a7)
[00070fca] 6000 00aa                 bra        $00071076
[00070fce] 202f 0020                 move.l     32(a7),d0
[00070fd2] 6718                      beq.s      $00070FEC
[00070fd4] 206f 0008                 movea.l    8(a7),a0
[00070fd8] 2268 0008                 movea.l    8(a0),a1
[00070fdc] 206f 0010                 movea.l    16(a7),a0
[00070fe0] 246f 0020                 movea.l    32(a7),a2
[00070fe4] 4e92                      jsr        (a2)
[00070fe6] 4a40                      tst.w      d0
[00070fe8] 6700 007e                 beq.w      $00071068
[00070fec] 202f 0004                 move.l     4(a7),d0
[00070ff0] 670c                      beq.s      $00070FFE
[00070ff2] 206f 0008                 movea.l    8(a7),a0
[00070ff6] 226f 0004                 movea.l    4(a7),a1
[00070ffa] 2290                      move.l     (a0),(a1)
[00070ffc] 6008                      bra.s      $00071006
[00070ffe] 206f 0008                 movea.l    8(a7),a0
[00071002] 2257                      movea.l    (a7),a1
[00071004] 2290                      move.l     (a0),(a1)
[00071006] 206f 0008                 movea.l    8(a7),a0
[0007100a] 2010                      move.l     (a0),d0
[0007100c] 670e                      beq.s      $0007101C
[0007100e] 206f 0008                 movea.l    8(a7),a0
[00071012] 2050                      movea.l    (a0),a0
[00071014] 216f 0004 0004            move.l     4(a7),4(a0)
[0007101a] 6008                      bra.s      $00071024
[0007101c] 2057                      movea.l    (a7),a0
[0007101e] 216f 0004 0004            move.l     4(a7),4(a0)
[00071024] 2057                      movea.l    (a7),a0
[00071026] 53a8 0008                 subq.l     #1,8(a0)
[0007102a] 2057                      movea.l    (a7),a0
[0007102c] 2068 000c                 movea.l    12(a0),a0
[00071030] b1ef 0008                 cmpa.l     8(a7),a0
[00071034] 660e                      bne.s      $00071044
[00071036] 2057                      movea.l    (a7),a0
[00071038] 2257                      movea.l    (a7),a1
[0007103a] 2350 000c                 move.l     (a0),12(a1)
[0007103e] 2057                      movea.l    (a7),a0
[00071040] 42a8 0010                 clr.l      16(a0)
[00071044] 206f 0008                 movea.l    8(a7),a0
[00071048] 2068 0008                 movea.l    8(a0),a0
[0007104c] 226f 0014                 movea.l    20(a7),a1
[00071050] 2269 0004                 movea.l    4(a1),a1
[00071054] 4e91                      jsr        (a1)
[00071056] 700c                      moveq.l    #12,d0
[00071058] 206f 0008                 movea.l    8(a7),a0
[0007105c] 4eb9 0004 cc28            jsr        Ax_recycle
[00071062] 52af 000c                 addq.l     #1,12(a7)
[00071066] 6006                      bra.s      $0007106E
[00071068] 2f6f 0008 0004            move.l     8(a7),4(a7)
[0007106e] 206f 0008                 movea.l    8(a7),a0
[00071072] 2f50 0008                 move.l     (a0),8(a7)
[00071076] 202f 0008                 move.l     8(a7),d0
[0007107a] 6600 ff52                 bne        $00070FCE
[0007107e] 202f 000c                 move.l     12(a7),d0
[00071082] 4fef 0018                 lea.l      24(a7),a7
[00071086] 245f                      movea.l    (a7)+,a2
[00071088] 4e75                      rts
Alu_searchElem:
[0007108a] 4fef ffec                 lea.l      -20(a7),a7
[0007108e] 2f48 0010                 move.l     a0,16(a7)
[00071092] 2f40 000c                 move.l     d0,12(a7)
[00071096] 42af 0004                 clr.l      4(a7)
[0007109a] 206f 0010                 movea.l    16(a7),a0
[0007109e] 2e90                      move.l     (a0),(a7)
[000710a0] 42af 0008                 clr.l      8(a7)
[000710a4] 2057                      movea.l    (a7),a0
[000710a6] 2f50 0004                 move.l     (a0),4(a7)
[000710aa] 600c                      bra.s      $000710B8
[000710ac] 206f 0004                 movea.l    4(a7),a0
[000710b0] 2f50 0004                 move.l     (a0),4(a7)
[000710b4] 52af 0008                 addq.l     #1,8(a7)
[000710b8] 202f 0008                 move.l     8(a7),d0
[000710bc] b0af 000c                 cmp.l      12(a7),d0
[000710c0] 6c06                      bge.s      $000710C8
[000710c2] 202f 0004                 move.l     4(a7),d0
[000710c6] 66e4                      bne.s      $000710AC
[000710c8] 202f 0008                 move.l     8(a7),d0
[000710cc] b0af 000c                 cmp.l      12(a7),d0
[000710d0] 6620                      bne.s      $000710F2
[000710d2] 202f 0004                 move.l     4(a7),d0
[000710d6] 671a                      beq.s      $000710F2
[000710d8] 2057                      movea.l    (a7),a0
[000710da] 216f 0004 000c            move.l     4(a7),12(a0)
[000710e0] 2057                      movea.l    (a7),a0
[000710e2] 216f 000c 0010            move.l     12(a7),16(a0)
[000710e8] 206f 0004                 movea.l    4(a7),a0
[000710ec] 2068 0008                 movea.l    8(a0),a0
[000710f0] 6002                      bra.s      $000710F4
[000710f2] 91c8                      suba.l     a0,a0
[000710f4] 4fef 0014                 lea.l      20(a7),a7
[000710f8] 4e75                      rts
Alu_searchForElem:
[000710fa] 2f0a                      move.l     a2,-(a7)
[000710fc] 4fef ffea                 lea.l      -22(a7),a7
[00071100] 2f48 0012                 move.l     a0,18(a7)
[00071104] 2f49 000e                 move.l     a1,14(a7)
[00071108] 426f 000c                 clr.w      12(a7)
[0007110c] 42af 0008                 clr.l      8(a7)
[00071110] 42af 0004                 clr.l      4(a7)
[00071114] 206f 0012                 movea.l    18(a7),a0
[00071118] 2e90                      move.l     (a0),(a7)
[0007111a] 42af 0008                 clr.l      8(a7)
[0007111e] 2057                      movea.l    (a7),a0
[00071120] 2f50 0004                 move.l     (a0),4(a7)
[00071124] 6030                      bra.s      $00071156
[00071126] 202f 001e                 move.l     30(a7),d0
[0007112a] 6716                      beq.s      $00071142
[0007112c] 206f 0004                 movea.l    4(a7),a0
[00071130] 2268 0008                 movea.l    8(a0),a1
[00071134] 206f 000e                 movea.l    14(a7),a0
[00071138] 246f 001e                 movea.l    30(a7),a2
[0007113c] 4e92                      jsr        (a2)
[0007113e] 4a40                      tst.w      d0
[00071140] 6708                      beq.s      $0007114A
[00071142] 3f7c 0001 000c            move.w     #$0001,12(a7)
[00071148] 6018                      bra.s      $00071162
[0007114a] 206f 0004                 movea.l    4(a7),a0
[0007114e] 2f50 0004                 move.l     (a0),4(a7)
[00071152] 52af 0008                 addq.l     #1,8(a7)
[00071156] 302f 000c                 move.w     12(a7),d0
[0007115a] 6606                      bne.s      $00071162
[0007115c] 202f 0004                 move.l     4(a7),d0
[00071160] 66c4                      bne.s      $00071126
[00071162] 302f 000c                 move.w     12(a7),d0
[00071166] 6720                      beq.s      $00071188
[00071168] 202f 0004                 move.l     4(a7),d0
[0007116c] 671a                      beq.s      $00071188
[0007116e] 2057                      movea.l    (a7),a0
[00071170] 216f 0004 000c            move.l     4(a7),12(a0)
[00071176] 2057                      movea.l    (a7),a0
[00071178] 216f 0008 0010            move.l     8(a7),16(a0)
[0007117e] 206f 0004                 movea.l    4(a7),a0
[00071182] 2068 0008                 movea.l    8(a0),a0
[00071186] 6002                      bra.s      $0007118A
[00071188] 91c8                      suba.l     a0,a0
[0007118a] 4fef 0016                 lea.l      22(a7),a7
[0007118e] 245f                      movea.l    (a7)+,a2
[00071190] 4e75                      rts
Alu_firstElem:
[00071192] 514f                      subq.w     #8,a7
[00071194] 2f48 0004                 move.l     a0,4(a7)
[00071198] 206f 0004                 movea.l    4(a7),a0
[0007119c] 2e90                      move.l     (a0),(a7)
[0007119e] 2057                      movea.l    (a7),a0
[000711a0] 2257                      movea.l    (a7),a1
[000711a2] 2350 000c                 move.l     (a0),12(a1)
[000711a6] 2057                      movea.l    (a7),a0
[000711a8] 42a8 0010                 clr.l      16(a0)
[000711ac] 2057                      movea.l    (a7),a0
[000711ae] 2010                      move.l     (a0),d0
[000711b0] 6606                      bne.s      $000711B8
[000711b2] 91c8                      suba.l     a0,a0
[000711b4] 600c                      bra.s      $000711C2
[000711b6] 600a                      bra.s      $000711C2
[000711b8] 2057                      movea.l    (a7),a0
[000711ba] 2050                      movea.l    (a0),a0
[000711bc] 2068 0008                 movea.l    8(a0),a0
[000711c0] 4e71                      nop
[000711c2] 504f                      addq.w     #8,a7
[000711c4] 4e75                      rts
Alu_lastElem:
[000711c6] 514f                      subq.w     #8,a7
[000711c8] 2f48 0004                 move.l     a0,4(a7)
[000711cc] 206f 0004                 movea.l    4(a7),a0
[000711d0] 2e90                      move.l     (a0),(a7)
[000711d2] 2057                      movea.l    (a7),a0
[000711d4] 2257                      movea.l    (a7),a1
[000711d6] 2368 0004 000c            move.l     4(a0),12(a1)
[000711dc] 70ff                      moveq.l    #-1,d0
[000711de] 2057                      movea.l    (a7),a0
[000711e0] d0a8 0008                 add.l      8(a0),d0
[000711e4] 2057                      movea.l    (a7),a0
[000711e6] 2140 0010                 move.l     d0,16(a0)
[000711ea] 2057                      movea.l    (a7),a0
[000711ec] 2028 0004                 move.l     4(a0),d0
[000711f0] 6606                      bne.s      $000711F8
[000711f2] 91c8                      suba.l     a0,a0
[000711f4] 600e                      bra.s      $00071204
[000711f6] 600c                      bra.s      $00071204
[000711f8] 2057                      movea.l    (a7),a0
[000711fa] 2068 0004                 movea.l    4(a0),a0
[000711fe] 2068 0008                 movea.l    8(a0),a0
[00071202] 4e71                      nop
[00071204] 504f                      addq.w     #8,a7
[00071206] 4e75                      rts
Alu_aktNrElem:
[00071208] 514f                      subq.w     #8,a7
[0007120a] 2f48 0004                 move.l     a0,4(a7)
[0007120e] 206f 0004                 movea.l    4(a7),a0
[00071212] 2e90                      move.l     (a0),(a7)
[00071214] 2057                      movea.l    (a7),a0
[00071216] 2028 000c                 move.l     12(a0),d0
[0007121a] 6606                      bne.s      $00071222
[0007121c] 70ff                      moveq.l    #-1,d0
[0007121e] 600a                      bra.s      $0007122A
[00071220] 6008                      bra.s      $0007122A
[00071222] 2057                      movea.l    (a7),a0
[00071224] 2028 0010                 move.l     16(a0),d0
[00071228] 4e71                      nop
[0007122a] 504f                      addq.w     #8,a7
[0007122c] 4e75                      rts
Alu_aktElem:
[0007122e] 514f                      subq.w     #8,a7
[00071230] 2f48 0004                 move.l     a0,4(a7)
[00071234] 206f 0004                 movea.l    4(a7),a0
[00071238] 2e90                      move.l     (a0),(a7)
[0007123a] 2057                      movea.l    (a7),a0
[0007123c] 2028 000c                 move.l     12(a0),d0
[00071240] 6606                      bne.s      $00071248
[00071242] 91c8                      suba.l     a0,a0
[00071244] 600e                      bra.s      $00071254
[00071246] 600c                      bra.s      $00071254
[00071248] 2057                      movea.l    (a7),a0
[0007124a] 2068 000c                 movea.l    12(a0),a0
[0007124e] 2068 0008                 movea.l    8(a0),a0
[00071252] 4e71                      nop
[00071254] 504f                      addq.w     #8,a7
[00071256] 4e75                      rts
Alu_skipElem:
[00071258] 4fef ffee                 lea.l      -18(a7),a7
[0007125c] 2f48 000e                 move.l     a0,14(a7)
[00071260] 3f40 000c                 move.w     d0,12(a7)
[00071264] 2f41 0008                 move.l     d1,8(a7)
[00071268] 206f 000e                 movea.l    14(a7),a0
[0007126c] 2f50 0004                 move.l     (a0),4(a7)
[00071270] 302f 000c                 move.w     12(a7),d0
[00071274] 672a                      beq.s      $000712A0
[00071276] 4297                      clr.l      (a7)
[00071278] 6012                      bra.s      $0007128C
[0007127a] 206f 0004                 movea.l    4(a7),a0
[0007127e] 2068 000c                 movea.l    12(a0),a0
[00071282] 226f 0004                 movea.l    4(a7),a1
[00071286] 2350 000c                 move.l     (a0),12(a1)
[0007128a] 5297                      addq.l     #1,(a7)
[0007128c] 2017                      move.l     (a7),d0
[0007128e] b0af 0008                 cmp.l      8(a7),d0
[00071292] 6c0a                      bge.s      $0007129E
[00071294] 206f 0004                 movea.l    4(a7),a0
[00071298] 2028 000c                 move.l     12(a0),d0
[0007129c] 66dc                      bne.s      $0007127A
[0007129e] 602a                      bra.s      $000712CA
[000712a0] 4297                      clr.l      (a7)
[000712a2] 6014                      bra.s      $000712B8
[000712a4] 206f 0004                 movea.l    4(a7),a0
[000712a8] 2068 000c                 movea.l    12(a0),a0
[000712ac] 226f 0004                 movea.l    4(a7),a1
[000712b0] 2368 0004 000c            move.l     4(a0),12(a1)
[000712b6] 5297                      addq.l     #1,(a7)
[000712b8] 2017                      move.l     (a7),d0
[000712ba] b0af 0008                 cmp.l      8(a7),d0
[000712be] 6c0a                      bge.s      $000712CA
[000712c0] 206f 0004                 movea.l    4(a7),a0
[000712c4] 2028 000c                 move.l     12(a0),d0
[000712c8] 66da                      bne.s      $000712A4
[000712ca] 206f 0004                 movea.l    4(a7),a0
[000712ce] 2028 000c                 move.l     12(a0),d0
[000712d2] 6606                      bne.s      $000712DA
[000712d4] 91c8                      suba.l     a0,a0
[000712d6] 6010                      bra.s      $000712E8
[000712d8] 600e                      bra.s      $000712E8
[000712da] 206f 0004                 movea.l    4(a7),a0
[000712de] 2068 000c                 movea.l    12(a0),a0
[000712e2] 2068 0008                 movea.l    8(a0),a0
[000712e6] 4e71                      nop
[000712e8] 4fef 0012                 lea.l      18(a7),a7
[000712ec] 4e75                      rts
Alu_countElem:
[000712ee] 594f                      subq.w     #4,a7
[000712f0] 2e88                      move.l     a0,(a7)
[000712f2] 2057                      movea.l    (a7),a0
[000712f4] 2050                      movea.l    (a0),a0
[000712f6] 2028 0008                 move.l     8(a0),d0
[000712fa] 584f                      addq.w     #4,a7
[000712fc] 4e75                      rts
Alu_countForElem:
[000712fe] 2f0a                      move.l     a2,-(a7)
[00071300] 4fef ffec                 lea.l      -20(a7),a7
[00071304] 2f48 0010                 move.l     a0,16(a7)
[00071308] 2f49 000c                 move.l     a1,12(a7)
[0007130c] 42af 0008                 clr.l      8(a7)
[00071310] 42af 0004                 clr.l      4(a7)
[00071314] 206f 0010                 movea.l    16(a7),a0
[00071318] 2e90                      move.l     (a0),(a7)
[0007131a] 2057                      movea.l    (a7),a0
[0007131c] 2f50 0004                 move.l     (a0),4(a7)
[00071320] 6028                      bra.s      $0007134A
[00071322] 202f 001c                 move.l     28(a7),d0
[00071326] 6716                      beq.s      $0007133E
[00071328] 206f 0004                 movea.l    4(a7),a0
[0007132c] 2268 0008                 movea.l    8(a0),a1
[00071330] 206f 000c                 movea.l    12(a7),a0
[00071334] 246f 001c                 movea.l    28(a7),a2
[00071338] 4e92                      jsr        (a2)
[0007133a] 4a40                      tst.w      d0
[0007133c] 6704                      beq.s      $00071342
[0007133e] 52af 0008                 addq.l     #1,8(a7)
[00071342] 206f 0004                 movea.l    4(a7),a0
[00071346] 2f50 0004                 move.l     (a0),4(a7)
[0007134a] 202f 0004                 move.l     4(a7),d0
[0007134e] 66d2                      bne.s      $00071322
[00071350] 202f 0008                 move.l     8(a7),d0
[00071354] 4fef 0014                 lea.l      20(a7),a7
[00071358] 245f                      movea.l    (a7)+,a2
[0007135a] 4e75                      rts
Alu_doForElem:
[0007135c] 2f0a                      move.l     a2,-(a7)
[0007135e] 4fef fff0                 lea.l      -16(a7),a7
[00071362] 2f48 000c                 move.l     a0,12(a7)
[00071366] 2f49 0008                 move.l     a1,8(a7)
[0007136a] 42af 0004                 clr.l      4(a7)
[0007136e] 206f 000c                 movea.l    12(a7),a0
[00071372] 2e90                      move.l     (a0),(a7)
[00071374] 2057                      movea.l    (a7),a0
[00071376] 2f50 0004                 move.l     (a0),4(a7)
[0007137a] 6036                      bra.s      $000713B2
[0007137c] 202f 0018                 move.l     24(a7),d0
[00071380] 6716                      beq.s      $00071398
[00071382] 206f 0004                 movea.l    4(a7),a0
[00071386] 2268 0008                 movea.l    8(a0),a1
[0007138a] 206f 0008                 movea.l    8(a7),a0
[0007138e] 246f 0018                 movea.l    24(a7),a2
[00071392] 4e92                      jsr        (a2)
[00071394] 4a40                      tst.w      d0
[00071396] 6712                      beq.s      $000713AA
[00071398] 206f 0004                 movea.l    4(a7),a0
[0007139c] 2268 0008                 movea.l    8(a0),a1
[000713a0] 206f 0008                 movea.l    8(a7),a0
[000713a4] 246f 001c                 movea.l    28(a7),a2
[000713a8] 4e92                      jsr        (a2)
[000713aa] 206f 0004                 movea.l    4(a7),a0
[000713ae] 2f50 0004                 move.l     (a0),4(a7)
[000713b2] 202f 0004                 move.l     4(a7),d0
[000713b6] 66c4                      bne.s      $0007137C
[000713b8] 4fef 0010                 lea.l      16(a7),a7
[000713bc] 245f                      movea.l    (a7)+,a2
[000713be] 4e75                      rts

	.data

empty:
[000e3298]                           dc.l 0
[000e329c] 0004c7c8                  dc.l Ax_free
[000e32a0] 00070caa                  dc.l Alu_clearElem
[000e32a4] 00070d0a                  dc.l Alu_appendElem
[000e32a8] 00070d9e                  dc.l Alu_insertElem
[000e32ac] 00070e9c                  dc.l Alu_deleteElem
[000e32b0] 00070fa0                  dc.l Alu_deleteForElem
[000e32b4] 0007108a                  dc.l Alu_searchElem
[000e32b8] 000710fa                  dc.l Alu_searchForElem
[000e32bc] 00071192                  dc.l Alu_firstElem
[000e32c0] 000711c6                  dc.l Alu_lastElem
[000e32c4] 0007122e                  dc.l Alu_aktElem
[000e32c8] 00071208                  dc.l Alu_aktNrElem
[000e32cc] 00071258                  dc.l Alu_skipElem
[000e32d0] 000712ee                  dc.l Alu_countElem
[000e32d4] 000712fe                  dc.l Alu_countForElem
[000e32d8] 0007135c                  dc.l Alu_doForElem
