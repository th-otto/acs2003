A_cycle:
[00066c46] 2f02                      move.l     d2,-(a7)
[00066c48] 2f0a                      move.l     a2,-(a7)
[00066c4a] 4fef ffac                 lea.l      -84(a7),a7
[00066c4e] 41f9 000e 1db8            lea.l      $000E1DB8,a0
[00066c54] 43ef 000c                 lea.l      12(a7),a1
[00066c58] 12d8                      move.b     (a0)+,(a1)+
[00066c5a] 12d8                      move.b     (a0)+,(a1)+
[00066c5c] 206f 0060                 movea.l    96(a7),a0
[00066c60] 3028 0016                 move.w     22(a0),d0
[00066c64] 660a                      bne.s      A_cycle_1
[00066c66] 206f 0060                 movea.l    96(a7),a0
[00066c6a] 3028 0018                 move.w     24(a0),d0
[00066c6e] 6758                      beq.s      A_cycle_2
A_cycle_1:
[00066c70] 206f 0060                 movea.l    96(a7),a0
[00066c74] 3f68 0012 0048            move.w     18(a0),72(a7)
[00066c7a] 206f 0060                 movea.l    96(a7),a0
[00066c7e] 3f68 0014 004a            move.w     20(a0),74(a7)
[00066c84] 206f 0060                 movea.l    96(a7),a0
[00066c88] 3028 0012                 move.w     18(a0),d0
[00066c8c] 206f 0060                 movea.l    96(a7),a0
[00066c90] d068 0016                 add.w      22(a0),d0
[00066c94] 5340                      subq.w     #1,d0
[00066c96] 3f40 004c                 move.w     d0,76(a7)
[00066c9a] 206f 0060                 movea.l    96(a7),a0
[00066c9e] 3028 0014                 move.w     20(a0),d0
[00066ca2] 206f 0060                 movea.l    96(a7),a0
[00066ca6] d068 0018                 add.w      24(a0),d0
[00066caa] 5340                      subq.w     #1,d0
[00066cac] 3f40 004e                 move.w     d0,78(a7)
[00066cb0] 41ef 0048                 lea.l      72(a7),a0
[00066cb4] 7201                      moveq.l    #1,d1
[00066cb6] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066cbc] 3029 0010                 move.w     16(a1),d0
[00066cc0] 4eb9 0007 2230            jsr        vs_clip
[00066cc6] 6016                      bra.s      A_cycle_3
A_cycle_2:
[00066cc8] 41ef 0048                 lea.l      72(a7),a0
[00066ccc] 4241                      clr.w      d1
[00066cce] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066cd4] 3029 0010                 move.w     16(a1),d0
[00066cd8] 4eb9 0007 2230            jsr        vs_clip
A_cycle_3:
[00066cde] 206f 0060                 movea.l    96(a7),a0
[00066ce2] 3028 0008                 move.w     8(a0),d0
[00066ce6] 206f 0060                 movea.l    96(a7),a0
[00066cea] 3228 0006                 move.w     6(a0),d1
[00066cee] b340                      eor.w      d1,d0
[00066cf0] 6600 054e                 bne        A_cycle_4
[00066cf4] 206f 0060                 movea.l    96(a7),a0
[00066cf8] 3228 0004                 move.w     4(a0),d1
[00066cfc] 48c1                      ext.l      d1
[00066cfe] 2001                      move.l     d1,d0
[00066d00] d080                      add.l      d0,d0
[00066d02] d081                      add.l      d1,d0
[00066d04] e788                      lsl.l      #3,d0
[00066d06] 206f 0060                 movea.l    96(a7),a0
[00066d0a] 2050                      movea.l    (a0),a0
[00066d0c] d1c0                      adda.l     d0,a0
[00066d0e] 2f48 0004                 move.l     a0,4(a7)
[00066d12] 206f 0004                 movea.l    4(a7),a0
[00066d16] 2f68 000c 0008            move.l     12(a0),8(a7)
[00066d1c] 206f 0008                 movea.l    8(a7),a0
[00066d20] 2ea8 0010                 move.l     16(a0),(a7)
[00066d24] 206f 0060                 movea.l    96(a7),a0
[00066d28] 3028 000e                 move.w     14(a0),d0
[00066d2c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066d32] 3228 0012                 move.w     18(a0),d1
[00066d36] d241                      add.w      d1,d1
[00066d38] 9041                      sub.w      d1,d0
[00066d3a] 5340                      subq.w     #1,d0
[00066d3c] 3f40 001a                 move.w     d0,26(a7)
[00066d40] 206f 0060                 movea.l    96(a7),a0
[00066d44] 3028 000a                 move.w     10(a0),d0
[00066d48] 3f40 0044                 move.w     d0,68(a7)
[00066d4c] 3f40 0038                 move.w     d0,56(a7)
[00066d50] 3f40 0034                 move.w     d0,52(a7)
[00066d54] 3f40 0048                 move.w     d0,72(a7)
[00066d58] d06f 001a                 add.w      26(a7),d0
[00066d5c] 3f40 0040                 move.w     d0,64(a7)
[00066d60] 3f40 003c                 move.w     d0,60(a7)
[00066d64] 5240                      addq.w     #1,d0
[00066d66] 3f40 0030                 move.w     d0,48(a7)
[00066d6a] 3f40 0024                 move.w     d0,36(a7)
[00066d6e] 3f40 0020                 move.w     d0,32(a7)
[00066d72] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066d78] 3228 0012                 move.w     18(a0),d1
[00066d7c] d241                      add.w      d1,d1
[00066d7e] d041                      add.w      d1,d0
[00066d80] 3f40 002c                 move.w     d0,44(a7)
[00066d84] 3f40 0028                 move.w     d0,40(a7)
[00066d88] 3f40 004c                 move.w     d0,76(a7)
[00066d8c] 206f 0060                 movea.l    96(a7),a0
[00066d90] 3028 000c                 move.w     12(a0),d0
[00066d94] 3f40 003e                 move.w     d0,62(a7)
[00066d98] 3f40 002a                 move.w     d0,42(a7)
[00066d9c] 3f40 003a                 move.w     d0,58(a7)
[00066da0] 3f40 0026                 move.w     d0,38(a7)
[00066da4] 3f40 004a                 move.w     d0,74(a7)
[00066da8] 206f 0060                 movea.l    96(a7),a0
[00066dac] d068 0010                 add.w      16(a0),d0
[00066db0] 3f40 0046                 move.w     d0,70(a7)
[00066db4] 3f40 0032                 move.w     d0,50(a7)
[00066db8] 3f40 0042                 move.w     d0,66(a7)
[00066dbc] 3f40 002e                 move.w     d0,46(a7)
[00066dc0] 3f40 0036                 move.w     d0,54(a7)
[00066dc4] 3f40 0022                 move.w     d0,34(a7)
[00066dc8] 3f40 004e                 move.w     d0,78(a7)
[00066dcc] 7201                      moveq.l    #1,d1
[00066dce] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066dd4] 3028 0010                 move.w     16(a0),d0
[00066dd8] 4eb9 0007 3070            jsr        vswr_mode
[00066dde] 7201                      moveq.l    #1,d1
[00066de0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066de6] 3028 0010                 move.w     16(a0),d0
[00066dea] 4eb9 0007 316a            jsr        vsl_width
[00066df0] 7201                      moveq.l    #1,d1
[00066df2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066df8] 3028 0010                 move.w     16(a0),d0
[00066dfc] 4eb9 0007 30c4            jsr        vsl_type
[00066e02] 4242                      clr.w      d2
[00066e04] 4241                      clr.w      d1
[00066e06] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066e0c] 3028 0010                 move.w     16(a0),d0
[00066e10] 4eb9 0007 3214            jsr        vsl_ends
[00066e16] 7201                      moveq.l    #1,d1
[00066e18] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066e1e] 3028 0010                 move.w     16(a0),d0
[00066e22] 4eb9 0007 3660            jsr        vsf_interior
[00066e28] 7201                      moveq.l    #1,d1
[00066e2a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066e30] 3028 0010                 move.w     16(a0),d0
[00066e34] 4eb9 0007 375c            jsr        vsf_perimeter
[00066e3a] 206f 0008                 movea.l    8(a7),a0
[00066e3e] 2028 0004                 move.l     4(a0),d0
[00066e42] c0bc 0001 0000            and.l      #$00010000,d0
[00066e48] 6700 00e2                 beq        A_cycle_5
[00066e4c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066e52] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[00066e58] 6d00 00d2                 blt        A_cycle_5
[00066e5c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066e62] 2068 023c                 movea.l    572(a0),a0
[00066e66] 3028 000e                 move.w     14(a0),d0
[00066e6a] c07c 0100                 and.w      #$0100,d0
[00066e6e] 6600 00bc                 bne        A_cycle_5
[00066e72] 7208                      moveq.l    #8,d1
[00066e74] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066e7a] 3028 0010                 move.w     16(a0),d0
[00066e7e] 4eb9 0007 3708            jsr        vsf_color
[00066e84] 41ef 0048                 lea.l      72(a7),a0
[00066e88] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066e8e] 3029 0010                 move.w     16(a1),d0
[00066e92] 4eb9 0007 282e            jsr        v_bar
[00066e98] 720f                      moveq.l    #15,d1
[00066e9a] 206f 0008                 movea.l    8(a7),a0
[00066e9e] c268 0006                 and.w      6(a0),d1
[00066ea2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066ea8] 3028 0010                 move.w     16(a0),d0
[00066eac] 4eb9 0007 31c0            jsr        vsl_color
[00066eb2] 41ef 0034                 lea.l      52(a7),a0
[00066eb6] 7203                      moveq.l    #3,d1
[00066eb8] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066ebe] 3029 0010                 move.w     16(a1),d0
[00066ec2] 4eb9 0007 22e0            jsr        v_pline
[00066ec8] 41ef 0020                 lea.l      32(a7),a0
[00066ecc] 7203                      moveq.l    #3,d1
[00066ece] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066ed4] 3029 0010                 move.w     16(a1),d0
[00066ed8] 4eb9 0007 22e0            jsr        v_pline
[00066ede] 206f 0008                 movea.l    8(a7),a0
[00066ee2] 2228 0004                 move.l     4(a0),d1
[00066ee6] e881                      asr.l      #4,d1
[00066ee8] c27c 000f                 and.w      #$000F,d1
[00066eec] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066ef2] 3028 0010                 move.w     16(a0),d0
[00066ef6] 4eb9 0007 31c0            jsr        vsl_color
[00066efc] 41ef 003c                 lea.l      60(a7),a0
[00066f00] 7203                      moveq.l    #3,d1
[00066f02] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066f08] 3029 0010                 move.w     16(a1),d0
[00066f0c] 4eb9 0007 22e0            jsr        v_pline
[00066f12] 41ef 0028                 lea.l      40(a7),a0
[00066f16] 7203                      moveq.l    #3,d1
[00066f18] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066f1e] 3029 0010                 move.w     16(a1),d0
[00066f22] 4eb9 0007 22e0            jsr        v_pline
[00066f28] 6000 00a0                 bra        A_cycle_6
A_cycle_5:
[00066f2c] 4241                      clr.w      d1
[00066f2e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066f34] 3028 0010                 move.w     16(a0),d0
[00066f38] 4eb9 0007 3708            jsr        vsf_color
[00066f3e] 41ef 0048                 lea.l      72(a7),a0
[00066f42] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066f48] 3029 0010                 move.w     16(a1),d0
[00066f4c] 4eb9 0007 282e            jsr        v_bar
[00066f52] 7201                      moveq.l    #1,d1
[00066f54] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066f5a] 3028 0010                 move.w     16(a0),d0
[00066f5e] 4eb9 0007 31c0            jsr        vsl_color
[00066f64] 41ef 0034                 lea.l      52(a7),a0
[00066f68] 7203                      moveq.l    #3,d1
[00066f6a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066f70] 3029 0010                 move.w     16(a1),d0
[00066f74] 4eb9 0007 22e0            jsr        v_pline
[00066f7a] 41ef 0040                 lea.l      64(a7),a0
[00066f7e] 7202                      moveq.l    #2,d1
[00066f80] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066f86] 3029 0010                 move.w     16(a1),d0
[00066f8a] 4eb9 0007 22e0            jsr        v_pline
[00066f90] 342f 0040                 move.w     64(a7),d2
[00066f94] 322f 0042                 move.w     66(a7),d1
[00066f98] 302f 003e                 move.w     62(a7),d0
[00066f9c] 4eb9 0004 75e6            jsr        dotted_yline
[00066fa2] 7201                      moveq.l    #1,d1
[00066fa4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066faa] 3028 0010                 move.w     16(a0),d0
[00066fae] 4eb9 0007 30c4            jsr        vsl_type
[00066fb4] 41ef 0024                 lea.l      36(a7),a0
[00066fb8] 7204                      moveq.l    #4,d1
[00066fba] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066fc0] 3029 0010                 move.w     16(a1),d0
[00066fc4] 4eb9 0007 22e0            jsr        v_pline
A_cycle_6:
[00066fca] 206f 0060                 movea.l    96(a7),a0
[00066fce] 3028 0010                 move.w     16(a0),d0
[00066fd2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066fd8] 9068 0014                 sub.w      20(a0),d0
[00066fdc] e240                      asr.w      #1,d0
[00066fde] 206f 0060                 movea.l    96(a7),a0
[00066fe2] d068 000c                 add.w      12(a0),d0
[00066fe6] 3f40 001e                 move.w     d0,30(a7)
[00066fea] 4241                      clr.w      d1
[00066fec] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066ff2] 3028 0010                 move.w     16(a0),d0
[00066ff6] 4eb9 0007 3492            jsr        vst_rotation
[00066ffc] 7201                      moveq.l    #1,d1
[00066ffe] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067004] 3028 0010                 move.w     16(a0),d0
[00067008] 4eb9 0007 353a            jsr        vst_color
[0006700e] 43ef 0018                 lea.l      24(a7),a1
[00067012] 41ef 0018                 lea.l      24(a7),a0
[00067016] 7405                      moveq.l    #5,d2
[00067018] 4241                      clr.w      d1
[0006701a] 2479 0010 ee4e            movea.l    ACSblk,a2
[00067020] 302a 0010                 move.w     16(a2),d0
[00067024] 4eb9 0007 35e2            jsr        vst_alignment
[0006702a] 4241                      clr.w      d1
[0006702c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067032] 3028 0010                 move.w     16(a0),d0
[00067036] 4eb9 0007 358e            jsr        vst_effects
[0006703c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067042] 3228 0290                 move.w     656(a0),d1
[00067046] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006704c] 3028 0010                 move.w     16(a0),d0
[00067050] 4eb9 0007 34e6            jsr        vst_font
[00067056] 486f 0018                 pea.l      24(a7)
[0006705a] 486f 001a                 pea.l      26(a7)
[0006705e] 43ef 0020                 lea.l      32(a7),a1
[00067062] 41ef 0020                 lea.l      32(a7),a0
[00067066] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006706c] 322a 0292                 move.w     658(a2),d1
[00067070] 2479 0010 ee4e            movea.l    ACSblk,a2
[00067076] 302a 0010                 move.w     16(a2),d0
[0006707a] 4eb9 0007 3370            jsr        vst_height
[00067080] 504f                      addq.w     #8,a7
[00067082] 7202                      moveq.l    #2,d1
[00067084] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006708a] 3028 0010                 move.w     16(a0),d0
[0006708e] 4eb9 0007 3070            jsr        vswr_mode
[00067094] 7201                      moveq.l    #1,d1
[00067096] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006709c] 3028 0010                 move.w     16(a0),d0
[000670a0] 4eb9 0007 31c0            jsr        vsl_color
[000670a6] 206f 0060                 movea.l    96(a7),a0
[000670aa] 3028 000a                 move.w     10(a0),d0
[000670ae] 206f 0060                 movea.l    96(a7),a0
[000670b2] d068 000e                 add.w      14(a0),d0
[000670b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000670bc] 9068 0012                 sub.w      18(a0),d0
[000670c0] 72fe                      moveq.l    #-2,d1
[000670c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000670c8] d268 0012                 add.w      18(a0),d1
[000670cc] e241                      asr.w      #1,d1
[000670ce] 9041                      sub.w      d1,d0
[000670d0] 5340                      subq.w     #1,d0
[000670d2] 3f40 001c                 move.w     d0,28(a7)
[000670d6] 206f 0008                 movea.l    8(a7),a0
[000670da] 2028 0004                 move.l     4(a0),d0
[000670de] e080                      asr.l      #8,d0
[000670e0] 1f40 0012                 move.b     d0,18(a7)
[000670e4] 102f 0012                 move.b     18(a7),d0
[000670e8] 6706                      beq.s      A_cycle_7
[000670ea] 1f6f 0012 000c            move.b     18(a7),12(a7)
A_cycle_7:
[000670f0] 41ef 000c                 lea.l      12(a7),a0
[000670f4] 342f 001e                 move.w     30(a7),d2
[000670f8] 322f 001c                 move.w     28(a7),d1
[000670fc] 2279 0010 ee4e            movea.l    ACSblk,a1
[00067102] 3029 0010                 move.w     16(a1),d0
[00067106] 4eb9 0007 24b0            jsr        v_gtext
[0006710c] 7020                      moveq.l    #32,d0
[0006710e] 206f 0060                 movea.l    96(a7),a0
[00067112] c068 0008                 and.w      8(a0),d0
[00067116] 6766                      beq.s      A_cycle_8
[00067118] 7001                      moveq.l    #1,d0
[0006711a] 206f 0060                 movea.l    96(a7),a0
[0006711e] d068 000a                 add.w      10(a0),d0
[00067122] 3f40 0048                 move.w     d0,72(a7)
[00067126] 206f 0060                 movea.l    96(a7),a0
[0006712a] 3028 000c                 move.w     12(a0),d0
[0006712e] 206f 0060                 movea.l    96(a7),a0
[00067132] d068 0010                 add.w      16(a0),d0
[00067136] 5240                      addq.w     #1,d0
[00067138] 3f40 004a                 move.w     d0,74(a7)
[0006713c] 3f40 004e                 move.w     d0,78(a7)
[00067140] 206f 0060                 movea.l    96(a7),a0
[00067144] 3028 000a                 move.w     10(a0),d0
[00067148] 206f 0060                 movea.l    96(a7),a0
[0006714c] d068 000e                 add.w      14(a0),d0
[00067150] 5240                      addq.w     #1,d0
[00067152] 3f40 004c                 move.w     d0,76(a7)
[00067156] 3f40 0050                 move.w     d0,80(a7)
[0006715a] 7001                      moveq.l    #1,d0
[0006715c] 206f 0060                 movea.l    96(a7),a0
[00067160] d068 000c                 add.w      12(a0),d0
[00067164] 3f40 0052                 move.w     d0,82(a7)
[00067168] 41ef 0048                 lea.l      72(a7),a0
[0006716c] 7203                      moveq.l    #3,d1
[0006716e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00067174] 3029 0010                 move.w     16(a1),d0
[00067178] 4eb9 0007 22e0            jsr        v_pline
A_cycle_8:
[0006717e] 2057                      movea.l    (a7),a0
[00067180] 2010                      move.l     (a0),d0
[00067182] 6700 00bc                 beq        A_cycle_4
[00067186] 7202                      moveq.l    #2,d1
[00067188] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006718e] 3028 0010                 move.w     16(a0),d0
[00067192] 4eb9 0007 3070            jsr        vswr_mode
[00067198] 206f 0060                 movea.l    96(a7),a0
[0006719c] 3028 000e                 move.w     14(a0),d0
[000671a0] 48c0                      ext.l      d0
[000671a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000671a8] 81e8 0012                 divs.w     18(a0),d0
[000671ac] 5540                      subq.w     #2,d0
[000671ae] 3f40 0014                 move.w     d0,20(a7)
[000671b2] 302f 0014                 move.w     20(a7),d0
[000671b6] 6a04                      bpl.s      A_cycle_9
[000671b8] 426f 0014                 clr.w      20(a7)
A_cycle_9:
[000671bc] 302f 0014                 move.w     20(a7),d0
[000671c0] 48c0                      ext.l      d0
[000671c2] 2f00                      move.l     d0,-(a7)
[000671c4] 206f 0004                 movea.l    4(a7),a0
[000671c8] 2050                      movea.l    (a0),a0
[000671ca] 4eb9 0008 2f6c            jsr        strlen
[000671d0] 221f                      move.l     (a7)+,d1
[000671d2] b280                      cmp.l      d0,d1
[000671d4] 6448                      bcc.s      A_cycle_10
[000671d6] 302f 0014                 move.w     20(a7),d0
[000671da] 2057                      movea.l    (a7),a0
[000671dc] 2050                      movea.l    (a0),a0
[000671de] d0c0                      adda.w     d0,a0
[000671e0] 2f48 000e                 move.l     a0,14(a7)
[000671e4] 206f 000e                 movea.l    14(a7),a0
[000671e8] 1f50 0012                 move.b     (a0),18(a7)
[000671ec] 206f 000e                 movea.l    14(a7),a0
[000671f0] 4210                      clr.b      (a0)
[000671f2] 2057                      movea.l    (a7),a0
[000671f4] 2050                      movea.l    (a0),a0
[000671f6] 342f 001e                 move.w     30(a7),d2
[000671fa] 7201                      moveq.l    #1,d1
[000671fc] 226f 0060                 movea.l    96(a7),a1
[00067200] d269 000a                 add.w      10(a1),d1
[00067204] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006720a] 3029 0010                 move.w     16(a1),d0
[0006720e] 4eb9 0007 24b0            jsr        v_gtext
[00067214] 206f 000e                 movea.l    14(a7),a0
[00067218] 10af 0012                 move.b     18(a7),(a0)
[0006721c] 6022                      bra.s      A_cycle_4
A_cycle_10:
[0006721e] 2057                      movea.l    (a7),a0
[00067220] 2050                      movea.l    (a0),a0
[00067222] 342f 001e                 move.w     30(a7),d2
[00067226] 7201                      moveq.l    #1,d1
[00067228] 226f 0060                 movea.l    96(a7),a1
[0006722c] d269 000a                 add.w      10(a1),d1
[00067230] 2279 0010 ee4e            movea.l    ACSblk,a1
[00067236] 3029 0010                 move.w     16(a1),d0
[0006723a] 4eb9 0007 24b0            jsr        v_gtext
A_cycle_4:
[00067240] 41ef 0048                 lea.l      72(a7),a0
[00067244] 4241                      clr.w      d1
[00067246] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006724c] 3029 0010                 move.w     16(a1),d0
[00067250] 4eb9 0007 2230            jsr        vs_clip
[00067256] 70ee                      moveq.l    #-18,d0
[00067258] 206f 0060                 movea.l    96(a7),a0
[0006725c] c068 0008                 and.w      8(a0),d0
[00067260] 4fef 0054                 lea.l      84(a7),a7
[00067264] 245f                      movea.l    (a7)+,a2
[00067266] 241f                      move.l     (a7)+,d2
[00067268] 4e75                      rts

set:
[0006726a] 4fef fff2                 lea.l      -14(a7),a7
[0006726e] 2f48 000a                 move.l     a0,10(a7)
[00067272] 2f49 0006                 move.l     a1,6(a7)
[00067276] 206f 000a                 movea.l    10(a7),a0
[0006727a] 2050                      movea.l    (a0),a0
[0006727c] 4eb9 0004 c6c8            jsr        Ax_ifree
[00067282] 2f6f 0006 0002            move.l     6(a7),2(a7)
[00067288] 4257                      clr.w      (a7)
[0006728a] 6006                      bra.s      set_1
[0006728c] 52af 0002                 addq.l     #1,2(a7)
set_2:
[00067290] 5257                      addq.w     #1,(a7)
set_1:
[00067292] 206f 0002                 movea.l    2(a7),a0
[00067296] 1010                      move.b     (a0),d0
[00067298] 4880                      ext.w      d0
[0006729a] 41f9 000e 1dbb            lea.l      $000E1DBB,a0
[000672a0] 4eb9 0008 2e8a            jsr        strchr
[000672a6] 2008                      move.l     a0,d0
[000672a8] 67e2                      beq.s      set_2
[000672aa] 7001                      moveq.l    #1,d0
[000672ac] d057                      add.w      (a7),d0
[000672ae] 48c0                      ext.l      d0
[000672b0] 4eb9 0004 c608            jsr        Ax_malloc
[000672b6] 2f48 0002                 move.l     a0,2(a7)
[000672ba] 3017                      move.w     (a7),d0
[000672bc] 6f12                      ble.s      set_3
[000672be] 3017                      move.w     (a7),d0
[000672c0] 48c0                      ext.l      d0
[000672c2] 226f 0006                 movea.l    6(a7),a1
[000672c6] 206f 0002                 movea.l    2(a7),a0
[000672ca] 4eb9 0008 2fd6            jsr        strncpy
set_3:
[000672d0] 3017                      move.w     (a7),d0
[000672d2] 206f 0002                 movea.l    2(a7),a0
[000672d6] 4230 0000                 clr.b      0(a0,d0.w)
[000672da] 206f 000a                 movea.l    10(a7),a0
[000672de] 20af 0002                 move.l     2(a7),(a0)
[000672e2] 4fef 000e                 lea.l      14(a7),a7
[000672e6] 4e75                      rts

next_entry:
[000672e8] 594f                      subq.w     #4,a7
[000672ea] 2e88                      move.l     a0,(a7)
[000672ec] 602a                      bra.s      next_entry_1
[000672ee] 2057                      movea.l    (a7),a0
next_entry_6:
[000672f0] 1010                      move.b     (a0),d0
[000672f2] 6602                      bne.s      next_entry_2
[000672f4] 6024                      bra.s      next_entry_3
next_entry_2:
[000672f6] 2057                      movea.l    (a7),a0
[000672f8] 0c10 005d                 cmpi.b     #$5D,(a0)
[000672fc] 660c                      bne.s      next_entry_4
[000672fe] 5297                      addq.l     #1,(a7)
[00067300] 2057                      movea.l    (a7),a0
[00067302] 0c10 007c                 cmpi.b     #$7C,(a0)
[00067306] 6702                      beq.s      next_entry_4
[00067308] 6010                      bra.s      next_entry_3
next_entry_4:
[0006730a] 2057                      movea.l    (a7),a0
[0006730c] 0c10 007c                 cmpi.b     #$7C,(a0)
[00067310] 6604                      bne.s      next_entry_5
[00067312] 5297                      addq.l     #1,(a7)
[00067314] 6004                      bra.s      next_entry_3
next_entry_5:
[00067316] 5297                      addq.l     #1,(a7)
next_entry_1:
[00067318] 60d4                      bra.s      next_entry_6
next_entry_3:
[0006731a] 2057                      movea.l    (a7),a0
[0006731c] 584f                      addq.w     #4,a7
[0006731e] 4e75                      rts

next:
[00067320] 514f                      subq.w     #8,a7
[00067322] 2f48 0004                 move.l     a0,4(a7)
[00067326] 206f 0004                 movea.l    4(a7),a0
[0006732a] 2068 0004                 movea.l    4(a0),a0
[0006732e] 6100 ffb8                 bsr.w      next_entry
[00067332] 2e88                      move.l     a0,(a7)
[00067334] 2057                      movea.l    (a7),a0
[00067336] 1010                      move.b     (a0),d0
[00067338] 6608                      bne.s      next_1
[0006733a] 206f 0004                 movea.l    4(a7),a0
[0006733e] 2ea8 0008                 move.l     8(a0),(a7)
next_1:
[00067342] 6008                      bra.s      next_2
[00067344] 2057                      movea.l    (a7),a0
next_3:
[00067346] 6100 ffa0                 bsr.w      next_entry
[0006734a] 2e88                      move.l     a0,(a7)
next_2:
[0006734c] 2057                      movea.l    (a7),a0
[0006734e] 0c10 005b                 cmpi.b     #$5B,(a0)
[00067352] 67f0                      beq.s      next_3
[00067354] 206f 0004                 movea.l    4(a7),a0
[00067358] 2157 0004                 move.l     (a7),4(a0)
[0006735c] 2257                      movea.l    (a7),a1
[0006735e] 206f 0004                 movea.l    4(a7),a0
[00067362] 6100 ff06                 bsr        set
[00067366] 504f                      addq.w     #8,a7
[00067368] 4e75                      rts

make_popup:
[0006736a] 594f                      subq.w     #4,a7
[0006736c] 2e88                      move.l     a0,(a7)
[0006736e] 2057                      movea.l    (a7),a0
[00067370] 4290                      clr.l      (a0)
[00067372] 2057                      movea.l    (a7),a0
[00067374] 217c 000e 1dbe 0004       move.l     #$000E1DBE,4(a0)
[0006737c] 2057                      movea.l    (a7),a0
[0006737e] 6100 ffa0                 bsr.w      next
[00067382] 584f                      addq.w     #4,a7
[00067384] 4e75                      rts

cyc_getindex:
[00067386] 4fef fff0                 lea.l      -16(a7),a7
[0006738a] 2f48 000c                 move.l     a0,12(a7)
[0006738e] 2f49 0008                 move.l     a1,8(a7)
[00067392] 206f 000c                 movea.l    12(a7),a0
[00067396] 2050                      movea.l    (a0),a0
[00067398] 4eb9 0008 2f6c            jsr        strlen
[0006739e] 3f40 0004                 move.w     d0,4(a7)
[000673a2] 206f 000c                 movea.l    12(a7),a0
[000673a6] 2ea8 0008                 move.l     8(a0),(a7)
[000673aa] 426f 0006                 clr.w      6(a7)
[000673ae] 6064                      bra.s      cyc_getindex_1
[000673b0] 2057                      movea.l    (a7),a0
cyc_getindex_7:
[000673b2] 0c10 005b                 cmpi.b     #$5B,(a0)
[000673b6] 6740                      beq.s      cyc_getindex_2
[000673b8] 302f 0004                 move.w     4(a7),d0
[000673bc] 48c0                      ext.l      d0
[000673be] 2257                      movea.l    (a7),a1
[000673c0] 206f 000c                 movea.l    12(a7),a0
[000673c4] 2050                      movea.l    (a0),a0
[000673c6] 4eb9 0008 2fb8            jsr        strncmp
[000673cc] 4a40                      tst.w      d0
[000673ce] 6624                      bne.s      cyc_getindex_3
[000673d0] 302f 0004                 move.w     4(a7),d0
[000673d4] 2057                      movea.l    (a7),a0
[000673d6] 1030 0000                 move.b     0(a0,d0.w),d0
[000673da] 670e                      beq.s      cyc_getindex_4
[000673dc] 302f 0004                 move.w     4(a7),d0
[000673e0] 2057                      movea.l    (a7),a0
[000673e2] 0c30 007c 0000            cmpi.b     #$7C,0(a0,d0.w)
[000673e8] 660a                      bne.s      cyc_getindex_3
cyc_getindex_4:
[000673ea] 206f 0008                 movea.l    8(a7),a0
[000673ee] 30af 0006                 move.w     6(a7),(a0)
[000673f2] 6022                      bra.s      cyc_getindex_5
cyc_getindex_3:
[000673f4] 526f 0006                 addq.w     #1,6(a7)
cyc_getindex_2:
[000673f8] 707c                      moveq.l    #124,d0
[000673fa] 2057                      movea.l    (a7),a0
[000673fc] 4eb9 0008 2e8a            jsr        strchr
[00067402] 2e88                      move.l     a0,(a7)
[00067404] 2017                      move.l     (a7),d0
[00067406] 660a                      bne.s      cyc_getindex_6
[00067408] 206f 0008                 movea.l    8(a7),a0
[0006740c] 30bc ffff                 move.w     #$FFFF,(a0)
[00067410] 6004                      bra.s      cyc_getindex_5
cyc_getindex_6:
[00067412] 5297                      addq.l     #1,(a7)
cyc_getindex_1:
[00067414] 609a                      bra.s      cyc_getindex_7
cyc_getindex_5:
[00067416] 4fef 0010                 lea.l      16(a7),a7
[0006741a] 4e75                      rts

cyc_index:
[0006741c] 4fef fff6                 lea.l      -10(a7),a7
[00067420] 2f48 0006                 move.l     a0,6(a7)
[00067424] 2f49 0002                 move.l     a1,2(a7)
[00067428] 7001                      moveq.l    #1,d0
[0006742a] 206f 0002                 movea.l    2(a7),a0
[0006742e] d050                      add.w      (a0),d0
[00067430] 3e80                      move.w     d0,(a7)
[00067432] 206f 0006                 movea.l    6(a7),a0
[00067436] 217c 000e 1dbf 0004       move.l     #$000E1DBF,4(a0)
[0006743e] 6008                      bra.s      cyc_index_1
[00067440] 206f 0006                 movea.l    6(a7),a0
cyc_index_2:
[00067444] 6100 feda                 bsr        next
cyc_index_1:
[00067448] 3017                      move.w     (a7),d0
[0006744a] 5357                      subq.w     #1,(a7)
[0006744c] 4a40                      tst.w      d0
[0006744e] 6ef0                      bgt.s      cyc_index_2
[00067450] 4fef 000a                 lea.l      10(a7),a7
[00067454] 4e75                      rts

Auo_cycle_14:
Auo_cycle_9:
Auo_cycle:
[00067456] 4fef ffe6                 lea.l      -26(a7),a7
[0006745a] 2f48 0016                 move.l     a0,22(a7)
[0006745e] 3f40 0014                 move.w     d0,20(a7)
[00067462] 2f49 0010                 move.l     a1,16(a7)
[00067466] 206f 0016                 movea.l    22(a7),a0
[0006746a] 2f68 000c 0004            move.l     12(a0),4(a7)
[00067470] 206f 0004                 movea.l    4(a7),a0
[00067474] 2ea8 0010                 move.l     16(a0),(a7)
[00067478] 302f 0014                 move.w     20(a7),d0
[0006747c] b07c 0009                 cmp.w      #$0009,d0
[00067480] 6700 0110                 beq        Auo_cycle_1
[00067484] 6e20                      bgt.s      Auo_cycle_2
[00067486] b07c 0006                 cmp.w      #$0006,d0
[0006748a] 6200 01c0                 bhi        Auo_cycle_3
[0006748e] d040                      add.w      d0,d0
[00067490] 303b 0006                 move.w     $00067498(pc,d0.w),d0
[00067494] 4efb 0002                 jmp        $00067498(pc,d0.w)
J52:
[00067498] 01b4                      dc.w $01b4   ; Auo_cycle_3-J52
[0006749a] 003c                      dc.w $003c   ; Auo_cycle_4-J52
[0006749c] 00b6                      dc.w $00b6   ; Auo_cycle_5-J52
[0006749e] 0126                      dc.w $0126   ; Auo_cycle_6-J52
[000674a0] 00ec                      dc.w $00ec   ; Auo_cycle_7-J52
[000674a2] 0132                      dc.w $0132   ; Auo_cycle_8-J52
[000674a4] 0132                      dc.w $0132   ; Auo_cycle_8-J52
Auo_cycle_2:
[000674a6] b07c                      dc.w $b07c   ; Auo_cycle_9-J52
[000674a8] 0190                      dc.w $0190   ; Auo_cycle_10-J52
[000674aa] 6700                      dc.w $6700   ; Auo_cycle_11-J52
[000674ac] 0160                      dc.w $0160   ; Auo_cycle_12-J52
[000674ae] 6e12                      dc.w $6e12   ; Auo_cycle_13-J52
[000674b0] 907c                      dc.w $907c   ; Auo_cycle_14-J52
[000674b2] 0013 6700                 ori.b      #$00,(a3)
[000674b6] 0194                      bclr       d0,(a4)
[000674b8] 5340                      subq.w     #1,d0
[000674ba] 6700 018e                 beq        Auo_cycle_15
[000674be] 6000 018c                 bra        Auo_cycle_3
[000674c2] 907c 0191                 sub.w      #$0191,d0
[000674c6] 6700 012c                 beq        Auo_cycle_16
[000674ca] 5340                      subq.w     #1,d0
[000674cc] 6700 0132                 beq        Auo_cycle_17
[000674d0] 6000 017a                 bra        Auo_cycle_3
Auo_cycle_4:
[000674d4] 7016                      moveq.l    #22,d0
[000674d6] 4eb9 0004 c608            jsr        Ax_malloc
[000674dc] 2e88                      move.l     a0,(a7)
[000674de] 2017                      move.l     (a7),d0
[000674e0] 6760                      beq.s      Auo_cycle_18
[000674e2] 7216                      moveq.l    #22,d1
[000674e4] 4240                      clr.w      d0
[000674e6] 2057                      movea.l    (a7),a0
[000674e8] 4eb9 0008 36ea            jsr        memset
[000674ee] 206f 0004                 movea.l    4(a7),a0
[000674f2] 2028 000c                 move.l     12(a0),d0
[000674f6] 6716                      beq.s      Auo_cycle_19
[000674f8] 206f 0004                 movea.l    4(a7),a0
[000674fc] 2068 000c                 movea.l    12(a0),a0
[00067500] 4eb9 0004 643c            jsr        Ast_create
[00067506] 2257                      movea.l    (a7),a1
[00067508] 2348 0008                 move.l     a0,8(a1)
[0006750c] 6012                      bra.s      Auo_cycle_20
Auo_cycle_19:
[0006750e] 41f9 000e 1dc0            lea.l      $000E1DC0,a0
[00067514] 4eb9 0004 643c            jsr        Ast_create
[0006751a] 2257                      movea.l    (a7),a1
[0006751c] 2348 0008                 move.l     a0,8(a1)
Auo_cycle_20:
[00067520] 2057                      movea.l    (a7),a0
[00067522] 2028 0008                 move.l     8(a0),d0
[00067526] 6710                      beq.s      Auo_cycle_21
[00067528] 206f 0004                 movea.l    4(a7),a0
[0006752c] 2157 0010                 move.l     (a7),16(a0)
[00067530] 2057                      movea.l    (a7),a0
[00067532] 6100 fe36                 bsr        make_popup
[00067536] 6008                      bra.s      Auo_cycle_22
Auo_cycle_21:
[00067538] 206f 0010                 movea.l    16(a7),a0
[0006753c] 30bc ffff                 move.w     #$FFFF,(a0)
Auo_cycle_22:
[00067540] 6008                      bra.s      Auo_cycle_23
Auo_cycle_18:
[00067542] 206f 0010                 movea.l    16(a7),a0
[00067546] 30bc ffff                 move.w     #$FFFF,(a0)
Auo_cycle_23:
[0006754a] 6000 0104                 bra        Auo_cycle_24
Auo_cycle_5:
[0006754e] 2057                      movea.l    (a7),a0
[00067550] 2028 0008                 move.l     8(a0),d0
[00067554] 670c                      beq.s      Auo_cycle_25
[00067556] 2057                      movea.l    (a7),a0
[00067558] 2068 0008                 movea.l    8(a0),a0
[0006755c] 4eb9 0004 649c            jsr        Ast_delete
Auo_cycle_25:
[00067562] 2057                      movea.l    (a7),a0
[00067564] 2010                      move.l     (a0),d0
[00067566] 670a                      beq.s      Auo_cycle_26
[00067568] 2057                      movea.l    (a7),a0
[0006756a] 2050                      movea.l    (a0),a0
[0006756c] 4eb9 0004 c7c8            jsr        Ax_free
Auo_cycle_26:
[00067572] 206f 0004                 movea.l    4(a7),a0
[00067576] 2068 0010                 movea.l    16(a0),a0
[0006757a] 4eb9 0004 c7c8            jsr        Ax_free
[00067580] 6000 00ce                 bra        Auo_cycle_24
Auo_cycle_7:
[00067584] 226f 0010                 movea.l    16(a7),a1
[00067588] 2057                      movea.l    (a7),a0
[0006758a] 6100 fcde                 bsr        set
[0006758e] 6000 00c0                 bra        Auo_cycle_24
Auo_cycle_1:
[00067592] 2f6f 0010 000c            move.l     16(a7),12(a7)
[00067598] 206f 000c                 movea.l    12(a7),a0
[0006759c] 2257                      movea.l    (a7),a1
[0006759e] 2350 000c                 move.l     (a0),12(a1)
[000675a2] 206f 000c                 movea.l    12(a7),a0
[000675a6] 2257                      movea.l    (a7),a1
[000675a8] 2368 0004 0010            move.l     4(a0),16(a1)
[000675ae] 206f 000c                 movea.l    12(a7),a0
[000675b2] 2257                      movea.l    (a7),a1
[000675b4] 3368 0008 0014            move.w     8(a0),20(a1)
[000675ba] 6000 0094                 bra        Auo_cycle_24
Auo_cycle_6:
[000675be] 2057                      movea.l    (a7),a0
[000675c0] 226f 0010                 movea.l    16(a7),a1
[000675c4] 2290                      move.l     (a0),(a1)
[000675c6] 6000 0088                 bra        Auo_cycle_24
Auo_cycle_8:
[000675ca] 2057                      movea.l    (a7),a0
[000675cc] 2f68 000c 0008            move.l     12(a0),8(a7)
[000675d2] 202f 0008                 move.l     8(a7),d0
[000675d6] 6604                      bne.s      Auo_cycle_27
[000675d8] 6000 0076                 bra.w      Auo_cycle_24
Auo_cycle_27:
[000675dc] 72ff                      moveq.l    #-1,d1
[000675de] 2057                      movea.l    (a7),a0
[000675e0] 3028 0014                 move.w     20(a0),d0
[000675e4] 206f 0008                 movea.l    8(a7),a0
[000675e8] 226f 0008                 movea.l    8(a7),a1
[000675ec] 2269 0066                 movea.l    102(a1),a1
[000675f0] 4e91                      jsr        (a1)
[000675f2] 605c                      bra.s      Auo_cycle_24
Auo_cycle_16:
[000675f4] 226f 0010                 movea.l    16(a7),a1
Auo_cycle_12:
[000675f8] 2057                      movea.l    (a7),a0
[000675fa] 6100 fe20                 bsr        cyc_index
[000675fe] 6050                      bra.s      Auo_cycle_24
Auo_cycle_17:
[00067600] 226f 0010                 movea.l    16(a7),a1
[00067604] 2057                      movea.l    (a7),a0
[00067606] 6100 fd7e                 bsr        cyc_getindex
[0006760a] 6044                      bra.s      Auo_cycle_24
[0006760c] 2057                      movea.l    (a7),a0
[0006760e] 2068 0008                 movea.l    8(a0),a0
[00067612] 4eb9 0004 c7c8            jsr        Ax_free
[00067618] 206f 0010                 movea.l    16(a7),a0
[0006761c] 4eb9 0004 643c            jsr        Ast_create
[00067622] 2257                      movea.l    (a7),a1
[00067624] 2348 0008                 move.l     a0,8(a1)
Auo_cycle_10:
[00067628] 2057                      movea.l    (a7),a0
[0006762a] 2028 0008                 move.l     8(a0),d0
[0006762e] 6612                      bne.s      Auo_cycle_28
[00067630] 41f9 000e 1dc1            lea.l      $000E1DC1,a0
[00067636] 4eb9 0004 643c            jsr        Ast_create
[0006763c] 2257                      movea.l    (a7),a1
[0006763e] 2348 0008                 move.l     a0,8(a1)
Auo_cycle_28:
[00067642] 2057                      movea.l    (a7),a0
[00067644] 6100 fd24                 bsr        make_popup
[00067648] 6006                      bra.s      Auo_cycle_24
Auo_cycle_15:
[0006764a] 6004                      bra.s      Auo_cycle_24
Auo_cycle_3:
[0006764c] 4240                      clr.w      d0
[0006764e] 6002                      bra.s      Auo_cycle_29
Auo_cycle_24:
[00067650] 7001                      moveq.l    #1,d0
Auo_cycle_29:
[00067652] 4fef 001a                 lea.l      26(a7),a7
[00067656] 4e75                      rts
Auo_cycle_11:
Auo_cycle_13:

count_it:
[00067658] 4fef fff4                 lea.l      -12(a7),a7
[0006765c] 2f48 0008                 move.l     a0,8(a7)
[00067660] 2f49 0004                 move.l     a1,4(a7)
[00067664] 2eaf 0008                 move.l     8(a7),(a7)
[00067668] 206f 0004                 movea.l    4(a7),a0
[0006766c] 30bc 0001                 move.w     #$0001,(a0)
[00067670] 6028                      bra.s      count_it_1
[00067672] 2057                      movea.l    (a7),a0
count_it_4:
[00067674] 0c10 007c                 cmpi.b     #$7C,(a0)
[00067678] 6606                      bne.s      count_it_2
[0006767a] 206f 0004                 movea.l    4(a7),a0
[0006767e] 5250                      addq.w     #1,(a0)
count_it_2:
[00067680] 2057                      movea.l    (a7),a0
[00067682] 0c10 005d                 cmpi.b     #$5D,(a0)
[00067686] 6610                      bne.s      count_it_3
[00067688] 2057                      movea.l    (a7),a0
[0006768a] 0c28 007c 0001            cmpi.b     #$7C,1(a0)
[00067690] 6706                      beq.s      count_it_3
[00067692] 206f 0004                 movea.l    4(a7),a0
[00067696] 5250                      addq.w     #1,(a0)
count_it_3:
[00067698] 5297                      addq.l     #1,(a7)
count_it_1:
[0006769a] 2057                      movea.l    (a7),a0
[0006769c] 1010                      move.b     (a0),d0
[0006769e] 66d2                      bne.s      count_it_4
[000676a0] 2eaf 0008                 move.l     8(a7),(a7)
[000676a4] 7001                      moveq.l    #1,d0
[000676a6] 206f 0004                 movea.l    4(a7),a0
[000676aa] d050                      add.w      (a0),d0
[000676ac] 206f 0010                 movea.l    16(a7),a0
[000676b0] 3080                      move.w     d0,(a0)
[000676b2] 6010                      bra.s      count_it_5
[000676b4] 2057                      movea.l    (a7),a0
count_it_7:
[000676b6] 0c10 005b                 cmpi.b     #$5B,(a0)
[000676ba] 6606                      bne.s      count_it_6
[000676bc] 206f 0010                 movea.l    16(a7),a0
[000676c0] 5250                      addq.w     #1,(a0)
count_it_6:
[000676c2] 5297                      addq.l     #1,(a7)
count_it_5:
[000676c4] 2057                      movea.l    (a7),a0
[000676c6] 1010                      move.b     (a0),d0
[000676c8] 66ea                      bne.s      count_it_7
[000676ca] 4fef 000c                 lea.l      12(a7),a7
[000676ce] 4e75                      rts

make_panel:
[000676d0] 4fef ffda                 lea.l      -38(a7),a7
[000676d4] 2f48 0022                 move.l     a0,34(a7)
[000676d8] 2f49 001e                 move.l     a1,30(a7)
[000676dc] 3f40 001c                 move.w     d0,28(a7)
[000676e0] 3f41 001a                 move.w     d1,26(a7)
[000676e4] 3f42 0018                 move.w     d2,24(a7)
[000676e8] 206f 001e                 movea.l    30(a7),a0
[000676ec] 3f50 000a                 move.w     (a0),10(a7)
[000676f0] 322f 000a                 move.w     10(a7),d1
[000676f4] 48c1                      ext.l      d1
[000676f6] 2001                      move.l     d1,d0
[000676f8] d080                      add.l      d0,d0
[000676fa] d081                      add.l      d1,d0
[000676fc] e788                      lsl.l      #3,d0
[000676fe] 206f 0022                 movea.l    34(a7),a0
[00067702] d1c0                      adda.l     d0,a0
[00067704] 2f48 0014                 move.l     a0,20(a7)
[00067708] 70ff                      moveq.l    #-1,d0
[0006770a] d06f 000a                 add.w      10(a7),d0
[0006770e] 206f 0014                 movea.l    20(a7),a0
[00067712] 3080                      move.w     d0,(a0)
[00067714] 7001                      moveq.l    #1,d0
[00067716] d06f 000a                 add.w      10(a7),d0
[0006771a] 206f 0014                 movea.l    20(a7),a0
[0006771e] 3140 0002                 move.w     d0,2(a0)
[00067722] 206f 0014                 movea.l    20(a7),a0
[00067726] 317c 0014 0006            move.w     #$0014,6(a0)
[0006772c] 206f 0014                 movea.l    20(a7),a0
[00067730] 317c 0080 0008            move.w     #$0080,8(a0)
[00067736] 206f 0014                 movea.l    20(a7),a0
[0006773a] 317c 0020 000a            move.w     #$0020,10(a0)
[00067740] 206f 0014                 movea.l    20(a7),a0
[00067744] 217c 00ff 1001 000c       move.l     #$00FF1001,12(a0)
[0006774c] 4240                      clr.w      d0
[0006774e] 206f 0014                 movea.l    20(a7),a0
[00067752] 3140 0012                 move.w     d0,18(a0)
[00067756] 206f 0014                 movea.l    20(a7),a0
[0006775a] 3140 0010                 move.w     d0,16(a0)
[0006775e] 206f 0014                 movea.l    20(a7),a0
[00067762] 316f 001c 0014            move.w     28(a7),20(a0)
[00067768] 426f 0006                 clr.w      6(a7)
[0006776c] 206f 001e                 movea.l    30(a7),a0
[00067770] 5250                      addq.w     #1,(a0)
[00067772] 4257                      clr.w      (a7)
[00067774] 6000 0262                 bra        make_panel_1
[00067778] 206f 001e                 movea.l    30(a7),a0
make_panel_22:
[0006777c] 3f50 0008                 move.w     (a0),8(a7)
[00067780] 322f 0008                 move.w     8(a7),d1
[00067784] 48c1                      ext.l      d1
[00067786] 2001                      move.l     d1,d0
[00067788] d080                      add.l      d0,d0
[0006778a] d081                      add.l      d1,d0
[0006778c] e788                      lsl.l      #3,d0
[0006778e] 206f 0022                 movea.l    34(a7),a0
[00067792] d1c0                      adda.l     d0,a0
[00067794] 2f48 0010                 move.l     a0,16(a7)
[00067798] 206f 001e                 movea.l    30(a7),a0
[0006779c] 5250                      addq.w     #1,(a0)
[0006779e] 206f 002a                 movea.l    42(a7),a0
[000677a2] 2050                      movea.l    (a0),a0
[000677a4] 0c10 005b                 cmpi.b     #$5B,(a0)
[000677a8] 6640                      bne.s      make_panel_2
[000677aa] 206f 001e                 movea.l    30(a7),a0
[000677ae] 3010                      move.w     (a0),d0
[000677b0] 206f 0010                 movea.l    16(a7),a0
[000677b4] 3140 0004                 move.w     d0,4(a0)
[000677b8] 206f 0010                 movea.l    16(a7),a0
[000677bc] 3140 0002                 move.w     d0,2(a0)
[000677c0] 302f 0018                 move.w     24(a7),d0
[000677c4] 670c                      beq.s      make_panel_3
[000677c6] 206f 0010                 movea.l    16(a7),a0
[000677ca] 317c 0018 0006            move.w     #$0018,6(a0)
[000677d0] 600a                      bra.s      make_panel_4
make_panel_3:
[000677d2] 206f 0010                 movea.l    16(a7),a0
[000677d6] 317c 0020 0006            move.w     #$0020,6(a0)
make_panel_4:
[000677dc] 3f7c 0001 0002            move.w     #$0001,2(a7)
[000677e2] 206f 002a                 movea.l    42(a7),a0
[000677e6] 5290                      addq.l     #1,(a0)
[000677e8] 6032                      bra.s      make_panel_5
make_panel_2:
[000677ea] 70ff                      moveq.l    #-1,d0
[000677ec] 206f 0010                 movea.l    16(a7),a0
[000677f0] 3140 0004                 move.w     d0,4(a0)
[000677f4] 206f 0010                 movea.l    16(a7),a0
[000677f8] 3140 0002                 move.w     d0,2(a0)
[000677fc] 302f 0018                 move.w     24(a7),d0
[00067800] 670c                      beq.s      make_panel_6
[00067802] 206f 0010                 movea.l    16(a7),a0
[00067806] 317c 0018 0006            move.w     #$0018,6(a0)
[0006780c] 600a                      bra.s      make_panel_7
make_panel_6:
[0006780e] 206f 0010                 movea.l    16(a7),a0
[00067812] 317c 001c 0006            move.w     #$001C,6(a0)
make_panel_7:
[00067818] 426f 0002                 clr.w      2(a7)
make_panel_5:
[0006781c] 206f 002a                 movea.l    42(a7),a0
[00067820] 2050                      movea.l    (a0),a0
[00067822] b1ef 0036                 cmpa.l     54(a7),a0
[00067826] 660c                      bne.s      make_panel_8
[00067828] 206f 0010                 movea.l    16(a7),a0
[0006782c] 317c 0004 000a            move.w     #$0004,10(a0)
[00067832] 6008                      bra.s      make_panel_9
make_panel_8:
[00067834] 206f 0010                 movea.l    16(a7),a0
[00067838] 4268 000a                 clr.w      10(a0)
make_panel_9:
[0006783c] 206f 002e                 movea.l    46(a7),a0
[00067840] 2f50 000c                 move.l     (a0),12(a7)
[00067844] 302f 0018                 move.w     24(a7),d0
[00067848] 6738                      beq.s      make_panel_10
[0006784a] 206f 0032                 movea.l    50(a7),a0
[0006784e] 226f 0010                 movea.l    16(a7),a1
[00067852] 2350 000c                 move.l     (a0),12(a1)
[00067856] 7020                      moveq.l    #32,d0
[00067858] 43f9 000e 1d98            lea.l      a3dproto,a1
[0006785e] 206f 0032                 movea.l    50(a7),a0
[00067862] 2050                      movea.l    (a0),a0
[00067864] 4eb9 0008 3500            jsr        memcpy
[0006786a] 206f 0032                 movea.l    50(a7),a0
[0006786e] 2050                      movea.l    (a0),a0
[00067870] 216f 000c 000c            move.l     12(a7),12(a0)
[00067876] 206f 0032                 movea.l    50(a7),a0
[0006787a] 0690 0000 0020            addi.l     #$00000020,(a0)
[00067880] 600a                      bra.s      make_panel_11
make_panel_10:
[00067882] 206f 0010                 movea.l    16(a7),a0
[00067886] 216f 000c 000c            move.l     12(a7),12(a0)
make_panel_11:
[0006788c] 302f 001a                 move.w     26(a7),d0
[00067890] 48c0                      ext.l      d0
[00067892] 206f 002e                 movea.l    46(a7),a0
[00067896] d190                      add.l      d0,(a0)
[00067898] 7020                      moveq.l    #32,d0
[0006789a] 206f 000c                 movea.l    12(a7),a0
[0006789e] 1140 0001                 move.b     d0,1(a0)
[000678a2] 206f 000c                 movea.l    12(a7),a0
[000678a6] 1080                      move.b     d0,(a0)
[000678a8] 54af 000c                 addq.l     #2,12(a7)
[000678ac] 70fd                      moveq.l    #-3,d0
[000678ae] d06f 001a                 add.w      26(a7),d0
[000678b2] 3f40 0004                 move.w     d0,4(a7)
[000678b6] 6046                      bra.s      make_panel_12
[000678b8] 206f 002a                 movea.l    42(a7),a0
make_panel_17:
[000678bc] 2050                      movea.l    (a0),a0
[000678be] 0c10 005d                 cmpi.b     #$5D,(a0)
[000678c2] 661a                      bne.s      make_panel_13
[000678c4] 3ebc 0001                 move.w     #$0001,(a7)
[000678c8] 206f 002a                 movea.l    42(a7),a0
[000678cc] 2050                      movea.l    (a0),a0
[000678ce] 0c28 007c 0001            cmpi.b     #$7C,1(a0)
[000678d4] 6606                      bne.s      make_panel_14
[000678d6] 206f 002a                 movea.l    42(a7),a0
[000678da] 5290                      addq.l     #1,(a0)
make_panel_14:
[000678dc] 6036                      bra.s      make_panel_15
make_panel_13:
[000678de] 302f 0004                 move.w     4(a7),d0
[000678e2] 6f14                      ble.s      make_panel_16
[000678e4] 206f 002a                 movea.l    42(a7),a0
[000678e8] 2050                      movea.l    (a0),a0
[000678ea] 226f 000c                 movea.l    12(a7),a1
[000678ee] 1290                      move.b     (a0),(a1)
[000678f0] 52af 000c                 addq.l     #1,12(a7)
[000678f4] 536f 0004                 subq.w     #1,4(a7)
make_panel_16:
[000678f8] 206f 002a                 movea.l    42(a7),a0
[000678fc] 5290                      addq.l     #1,(a0)
make_panel_12:
[000678fe] 206f 002a                 movea.l    42(a7),a0
[00067902] 2050                      movea.l    (a0),a0
[00067904] 1010                      move.b     (a0),d0
[00067906] 670c                      beq.s      make_panel_15
[00067908] 206f 002a                 movea.l    42(a7),a0
[0006790c] 2050                      movea.l    (a0),a0
[0006790e] 0c10 007c                 cmpi.b     #$7C,(a0)
[00067912] 66a4                      bne.s      make_panel_17
make_panel_15:
[00067914] 206f 000c                 movea.l    12(a7),a0
[00067918] 4210                      clr.b      (a0)
[0006791a] 206f 002a                 movea.l    42(a7),a0
[0006791e] 2050                      movea.l    (a0),a0
[00067920] 1010                      move.b     (a0),d0
[00067922] 6706                      beq.s      make_panel_18
[00067924] 206f 002a                 movea.l    42(a7),a0
[00067928] 5290                      addq.l     #1,(a0)
make_panel_18:
[0006792a] 302f 0002                 move.w     2(a7),d0
[0006792e] 672c                      beq.s      make_panel_19
[00067930] 2f2f 0036                 move.l     54(a7),-(a7)
[00067934] 2f2f 0036                 move.l     54(a7),-(a7)
[00067938] 2f2f 0036                 move.l     54(a7),-(a7)
[0006793c] 2f2f 0036                 move.l     54(a7),-(a7)
[00067940] 342f 0028                 move.w     40(a7),d2
[00067944] 322f 002a                 move.w     42(a7),d1
[00067948] 302f 002c                 move.w     44(a7),d0
[0006794c] 226f 002e                 movea.l    46(a7),a1
[00067950] 206f 0032                 movea.l    50(a7),a0
[00067954] 6100 fd7a                 bsr        make_panel
[00067958] 4fef 0010                 lea.l      16(a7),a7
make_panel_19:
[0006795c] 206f 0010                 movea.l    16(a7),a0
[00067960] 317c 0001 0008            move.w     #$0001,8(a0)
[00067966] 302f 0006                 move.w     6(a7),d0
[0006796a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067970] c1e8 0014                 muls.w     20(a0),d0
[00067974] 206f 0010                 movea.l    16(a7),a0
[00067978] 3140 0012                 move.w     d0,18(a0)
[0006797c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067982] 226f 0010                 movea.l    16(a7),a1
[00067986] 3368 0014 0016            move.w     20(a0),22(a1)
[0006798c] 206f 0010                 movea.l    16(a7),a0
[00067990] 4268 0010                 clr.w      16(a0)
[00067994] 206f 0010                 movea.l    16(a7),a0
[00067998] 316f 001c 0014            move.w     28(a7),20(a0)
[0006799e] 206f 001e                 movea.l    30(a7),a0
[000679a2] 226f 0010                 movea.l    16(a7),a1
[000679a6] 3290                      move.w     (a0),(a1)
[000679a8] 526f 0006                 addq.w     #1,6(a7)
[000679ac] 3017                      move.w     (a7),d0
[000679ae] 6628                      bne.s      make_panel_1
[000679b0] 206f 002a                 movea.l    42(a7),a0
[000679b4] 2050                      movea.l    (a0),a0
[000679b6] 0c10 005d                 cmpi.b     #$5D,(a0)
[000679ba] 661c                      bne.s      make_panel_1
[000679bc] 206f 002a                 movea.l    42(a7),a0
[000679c0] 2050                      movea.l    (a0),a0
[000679c2] 0c28 007c 0001            cmpi.b     #$7C,1(a0)
[000679c8] 6606                      bne.s      make_panel_20
[000679ca] 206f 002a                 movea.l    42(a7),a0
[000679ce] 5290                      addq.l     #1,(a0)
make_panel_20:
[000679d0] 206f 002a                 movea.l    42(a7),a0
[000679d4] 5290                      addq.l     #1,(a0)
[000679d6] 6010                      bra.s      make_panel_21
make_panel_1:
[000679d8] 206f 002a                 movea.l    42(a7),a0
[000679dc] 2050                      movea.l    (a0),a0
[000679de] 1010                      move.b     (a0),d0
[000679e0] 6706                      beq.s      make_panel_21
[000679e2] 3017                      move.w     (a7),d0
[000679e4] 6700 fd92                 beq        make_panel_22
make_panel_21:
[000679e8] 206f 0010                 movea.l    16(a7),a0
[000679ec] 30af 000a                 move.w     10(a7),(a0)
[000679f0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000679f6] 3028 0014                 move.w     20(a0),d0
[000679fa] c1ef 0006                 muls.w     6(a7),d0
[000679fe] 206f 0014                 movea.l    20(a7),a0
[00067a02] 3140 0016                 move.w     d0,22(a0)
[00067a06] 206f 0014                 movea.l    20(a7),a0
[00067a0a] 316f 0008 0004            move.w     8(a7),4(a0)
[00067a10] 4fef 0026                 lea.l      38(a7),a7
[00067a14] 4e75                      rts

create_popup:
[00067a16] 4fef ffdc                 lea.l      -36(a7),a7
[00067a1a] 2f48 0020                 move.l     a0,32(a7)
[00067a1e] 2f49 001c                 move.l     a1,28(a7)
[00067a22] 3f40 001a                 move.w     d0,26(a7)
[00067a26] 3f41 0018                 move.w     d1,24(a7)
[00067a2a] 486f 000e                 pea.l      14(a7)
[00067a2e] 43ef 0014                 lea.l      20(a7),a1
[00067a32] 206f 0024                 movea.l    36(a7),a0
[00067a36] 6100 fc20                 bsr        count_it
[00067a3a] 584f                      addq.w     #4,a7
[00067a3c] 302f 001a                 move.w     26(a7),d0
[00067a40] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067a46] d068 0012                 add.w      18(a0),d0
[00067a4a] 5340                      subq.w     #1,d0
[00067a4c] 48c0                      ext.l      d0
[00067a4e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067a54] 81e8 0012                 divs.w     18(a0),d0
[00067a58] 3f40 0012                 move.w     d0,18(a7)
[00067a5c] 302f 0012                 move.w     18(a7),d0
[00067a60] 6a04                      bpl.s      create_popup_1
[00067a62] 426f 0012                 clr.w      18(a7)
create_popup_1:
[00067a66] 566f 0012                 addq.w     #3,18(a7)
[00067a6a] 302f 0018                 move.w     24(a7),d0
[00067a6e] 6730                      beq.s      create_popup_2
[00067a70] 322f 000e                 move.w     14(a7),d1
[00067a74] 48c1                      ext.l      d1
[00067a76] 2001                      move.l     d1,d0
[00067a78] d080                      add.l      d0,d0
[00067a7a] d081                      add.l      d1,d0
[00067a7c] e788                      lsl.l      #3,d0
[00067a7e] 322f 0010                 move.w     16(a7),d1
[00067a82] c3ef 0012                 muls.w     18(a7),d1
[00067a86] 48c1                      ext.l      d1
[00067a88] d081                      add.l      d1,d0
[00067a8a] 322f 0010                 move.w     16(a7),d1
[00067a8e] 48c1                      ext.l      d1
[00067a90] eb89                      lsl.l      #5,d1
[00067a92] d081                      add.l      d1,d0
[00067a94] 4eb9 0004 c608            jsr        Ax_malloc
[00067a9a] 2f48 0014                 move.l     a0,20(a7)
[00067a9e] 6024                      bra.s      create_popup_3
create_popup_2:
[00067aa0] 322f 000e                 move.w     14(a7),d1
[00067aa4] 48c1                      ext.l      d1
[00067aa6] 2001                      move.l     d1,d0
[00067aa8] d080                      add.l      d0,d0
[00067aaa] d081                      add.l      d1,d0
[00067aac] e788                      lsl.l      #3,d0
[00067aae] 322f 0010                 move.w     16(a7),d1
[00067ab2] c3ef 0012                 muls.w     18(a7),d1
[00067ab6] 48c1                      ext.l      d1
[00067ab8] d081                      add.l      d1,d0
[00067aba] 4eb9 0004 c608            jsr        Ax_malloc
[00067ac0] 2f48 0014                 move.l     a0,20(a7)
create_popup_3:
[00067ac4] 202f 0014                 move.l     20(a7),d0
[00067ac8] 6606                      bne.s      create_popup_4
[00067aca] 91c8                      suba.l     a0,a0
[00067acc] 6000 0098                 bra        create_popup_5
create_popup_4:
[00067ad0] 426f 000c                 clr.w      12(a7)
[00067ad4] 322f 000e                 move.w     14(a7),d1
[00067ad8] 48c1                      ext.l      d1
[00067ada] 2001                      move.l     d1,d0
[00067adc] d080                      add.l      d0,d0
[00067ade] d081                      add.l      d1,d0
[00067ae0] e788                      lsl.l      #3,d0
[00067ae2] 206f 0014                 movea.l    20(a7),a0
[00067ae6] d1c0                      adda.l     d0,a0
[00067ae8] 2f48 0004                 move.l     a0,4(a7)
[00067aec] 302f 0010                 move.w     16(a7),d0
[00067af0] c1ef 0012                 muls.w     18(a7),d0
[00067af4] 206f 0004                 movea.l    4(a7),a0
[00067af8] d0c0                      adda.w     d0,a0
[00067afa] 2e88                      move.l     a0,(a7)
[00067afc] 2f6f 0020 0008            move.l     32(a7),8(a7)
[00067b02] 2f2f 001c                 move.l     28(a7),-(a7)
[00067b06] 486f 0004                 pea.l      4(a7)
[00067b0a] 486f 000c                 pea.l      12(a7)
[00067b0e] 486f 0014                 pea.l      20(a7)
[00067b12] 342f 0028                 move.w     40(a7),d2
[00067b16] 322f 0022                 move.w     34(a7),d1
[00067b1a] 302f 002a                 move.w     42(a7),d0
[00067b1e] 43ef 001c                 lea.l      28(a7),a1
[00067b22] 206f 0024                 movea.l    36(a7),a0
[00067b26] 6100 fba8                 bsr        make_panel
[00067b2a] 4fef 0010                 lea.l      16(a7),a7
[00067b2e] 206f 0014                 movea.l    20(a7),a0
[00067b32] 30bc ffff                 move.w     #$FFFF,(a0)
[00067b36] 206f 0014                 movea.l    20(a7),a0
[00067b3a] 0268 ff7f 0008            andi.w     #$FF7F,8(a0)
[00067b40] 206f 0014                 movea.l    20(a7),a0
[00067b44] 0068 8000 000a            ori.w      #$8000,10(a0)
[00067b4a] 322f 000c                 move.w     12(a7),d1
[00067b4e] 48c1                      ext.l      d1
[00067b50] 2001                      move.l     d1,d0
[00067b52] d080                      add.l      d0,d0
[00067b54] d081                      add.l      d1,d0
[00067b56] e788                      lsl.l      #3,d0
[00067b58] 206f 0014                 movea.l    20(a7),a0
[00067b5c] 0070 0020 08f0            ori.w      #$0020,-16(a0,d0.l)
[00067b62] 206f 0014                 movea.l    20(a7),a0
create_popup_5:
[00067b66] 4fef 0024                 lea.l      36(a7),a7
[00067b6a] 4e75                      rts

Ame_strpopup:
[00067b6c] 4fef ffde                 lea.l      -34(a7),a7
[00067b70] 2f48 001e                 move.l     a0,30(a7)
[00067b74] 2f49 001a                 move.l     a1,26(a7)
[00067b78] 3f40 0018                 move.w     d0,24(a7)
[00067b7c] 3f41 0016                 move.w     d1,22(a7)
[00067b80] 3f42 0014                 move.w     d2,20(a7)
[00067b84] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067b8a] 2068 023c                 movea.l    572(a0),a0
[00067b8e] 3028 000e                 move.w     14(a0),d0
[00067b92] c07c 0100                 and.w      #$0100,d0
[00067b96] 6612                      bne.s      Ame_strpopup_1
[00067b98] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067b9e] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[00067ba4] 6d04                      blt.s      Ame_strpopup_1
[00067ba6] 7001                      moveq.l    #1,d0
[00067ba8] 6002                      bra.s      Ame_strpopup_2
Ame_strpopup_1:
[00067baa] 4240                      clr.w      d0
Ame_strpopup_2:
[00067bac] 3f40 000c                 move.w     d0,12(a7)
[00067bb0] 322f 000c                 move.w     12(a7),d1
[00067bb4] 302f 0018                 move.w     24(a7),d0
[00067bb8] 226f 0026                 movea.l    38(a7),a1
[00067bbc] 206f 001a                 movea.l    26(a7),a0
[00067bc0] 6100 fe54                 bsr        create_popup
[00067bc4] 2f48 0010                 move.l     a0,16(a7)
[00067bc8] 202f 0010                 move.l     16(a7),d0
[00067bcc] 6700 00ce                 beq        Ame_strpopup_3
[00067bd0] 322f 0014                 move.w     20(a7),d1
[00067bd4] 302f 0016                 move.w     22(a7),d0
[00067bd8] 226f 0010                 movea.l    16(a7),a1
[00067bdc] 206f 001e                 movea.l    30(a7),a0
[00067be0] 4eb9 0004 e84a            jsr        Ame_popup
[00067be6] 3f40 000e                 move.w     d0,14(a7)
[00067bea] 302f 000e                 move.w     14(a7),d0
[00067bee] 6b00 0098                 bmi        Ame_strpopup_4
[00067bf2] 302f 000c                 move.w     12(a7),d0
[00067bf6] 6722                      beq.s      Ame_strpopup_5
[00067bf8] 322f 000e                 move.w     14(a7),d1
[00067bfc] 48c1                      ext.l      d1
[00067bfe] 2001                      move.l     d1,d0
[00067c00] d080                      add.l      d0,d0
[00067c02] d081                      add.l      d1,d0
[00067c04] e788                      lsl.l      #3,d0
[00067c06] 206f 0010                 movea.l    16(a7),a0
[00067c0a] 2070 080c                 movea.l    12(a0,d0.l),a0
[00067c0e] 2068 000c                 movea.l    12(a0),a0
[00067c12] 5448                      addq.w     #2,a0
[00067c14] 2f48 0004                 move.l     a0,4(a7)
[00067c18] 601c                      bra.s      Ame_strpopup_6
Ame_strpopup_5:
[00067c1a] 322f 000e                 move.w     14(a7),d1
[00067c1e] 48c1                      ext.l      d1
[00067c20] 2001                      move.l     d1,d0
[00067c22] d080                      add.l      d0,d0
[00067c24] d081                      add.l      d1,d0
[00067c26] e788                      lsl.l      #3,d0
[00067c28] 206f 0010                 movea.l    16(a7),a0
[00067c2c] 2070 080c                 movea.l    12(a0,d0.l),a0
[00067c30] 5448                      addq.w     #2,a0
[00067c32] 2f48 0004                 move.l     a0,4(a7)
Ame_strpopup_6:
[00067c36] 206f 0004                 movea.l    4(a7),a0
[00067c3a] 4eb9 0008 2f6c            jsr        strlen
[00067c40] 2e80                      move.l     d0,(a7)
[00067c42] 226f 0004                 movea.l    4(a7),a1
[00067c46] 206f 001a                 movea.l    26(a7),a0
[00067c4a] 4eb9 0008 3008            jsr        strstr
[00067c50] 2f48 0008                 move.l     a0,8(a7)
[00067c54] 6014                      bra.s      Ame_strpopup_7
[00067c56] 226f 0004                 movea.l    4(a7),a1
Ame_strpopup_8:
[00067c5a] 206f 0008                 movea.l    8(a7),a0
[00067c5e] 5248                      addq.w     #1,a0
[00067c60] 4eb9 0008 3008            jsr        strstr
[00067c66] 2f48 0008                 move.l     a0,8(a7)
Ame_strpopup_7:
[00067c6a] 2217                      move.l     (a7),d1
[00067c6c] 206f 0008                 movea.l    8(a7),a0
[00067c70] 1030 1800                 move.b     0(a0,d1.l),d0
[00067c74] 4880                      ext.w      d0
[00067c76] 41f9 000e 1dc2            lea.l      $000E1DC2,a0
[00067c7c] 4eb9 0008 2e8a            jsr        strchr
[00067c82] 2008                      move.l     a0,d0
[00067c84] 67d0                      beq.s      Ame_strpopup_8
[00067c86] 6004                      bra.s      Ame_strpopup_9
Ame_strpopup_4:
[00067c88] 42af 0008                 clr.l      8(a7)
Ame_strpopup_9:
[00067c8c] 206f 0010                 movea.l    16(a7),a0
[00067c90] 4eb9 0004 c7c8            jsr        Ax_free
[00067c96] 206f 0008                 movea.l    8(a7),a0
[00067c9a] 6002                      bra.s      Ame_strpopup_10
Ame_strpopup_3:
[00067c9c] 91c8                      suba.l     a0,a0
Ame_strpopup_10:
[00067c9e] 4fef 0022                 lea.l      34(a7),a7
[00067ca2] 4e75                      rts

Aus_cycle:
[00067ca4] 2f0a                      move.l     a2,-(a7)
[00067ca6] 4fef ffd6                 lea.l      -42(a7),a7
[00067caa] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067cb0] 2f68 025c 001c            move.l     604(a0),28(a7)
[00067cb6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067cbc] 3ea8 0260                 move.w     608(a0),(a7)
[00067cc0] 2f39 000e 692a            move.l     _globl,-(a7)
[00067cc6] 486f 000c                 pea.l      12(a7)
[00067cca] 43ef 0012                 lea.l      18(a7),a1
[00067cce] 302f 0008                 move.w     8(a7),d0
[00067cd2] 206f 0024                 movea.l    36(a7),a0
[00067cd6] 4eb9 0007 9d14            jsr        mt_objc_offset
[00067cdc] 504f                      addq.w     #8,a7
[00067cde] 3217                      move.w     (a7),d1
[00067ce0] 48c1                      ext.l      d1
[00067ce2] 2001                      move.l     d1,d0
[00067ce4] d080                      add.l      d0,d0
[00067ce6] d081                      add.l      d1,d0
[00067ce8] e788                      lsl.l      #3,d0
[00067cea] 206f 001c                 movea.l    28(a7),a0
[00067cee] d1c0                      adda.l     d0,a0
[00067cf0] 2f48 0018                 move.l     a0,24(a7)
[00067cf4] 206f 0018                 movea.l    24(a7),a0
[00067cf8] 2f68 000c 0010            move.l     12(a0),16(a7)
[00067cfe] 206f 0018                 movea.l    24(a7),a0
[00067d02] 3f68 0014 0002            move.w     20(a0),2(a7)
[00067d08] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067d0e] 2068 0258                 movea.l    600(a0),a0
[00067d12] 3028 0034                 move.w     52(a0),d0
[00067d16] d16f 000a                 add.w      d0,10(a7)
[00067d1a] 302f 000a                 move.w     10(a7),d0
[00067d1e] d06f 0002                 add.w      2(a7),d0
[00067d22] 3f40 0006                 move.w     d0,6(a7)
[00067d26] 302f 0006                 move.w     6(a7),d0
[00067d2a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067d30] 3228 0012                 move.w     18(a0),d1
[00067d34] d241                      add.w      d1,d1
[00067d36] 9041                      sub.w      d1,d0
[00067d38] 3f40 0004                 move.w     d0,4(a7)
[00067d3c] 206f 0010                 movea.l    16(a7),a0
[00067d40] 2f68 0010 000c            move.l     16(a0),12(a7)
[00067d46] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067d4c] 3028 0262                 move.w     610(a0),d0
[00067d50] b06f 0004                 cmp.w      4(a7),d0
[00067d54] 6d1c                      blt.s      Aus_cycle_1
[00067d56] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067d5c] 3028 0262                 move.w     610(a0),d0
[00067d60] b06f 0006                 cmp.w      6(a7),d0
[00067d64] 6c0c                      bge.s      Aus_cycle_1
[00067d66] 206f 000c                 movea.l    12(a7),a0
[00067d6a] 6100 f5b4                 bsr        next
[00067d6e] 6000 00f4                 bra        Aus_cycle_2
Aus_cycle_1:
[00067d72] 206f 0018                 movea.l    24(a7),a0
[00067d76] 3028 0016                 move.w     22(a0),d0
[00067d7a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067d80] 9068 0014                 sub.w      20(a0),d0
[00067d84] e240                      asr.w      #1,d0
[00067d86] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067d8c] 2068 0258                 movea.l    600(a0),a0
[00067d90] d068 0036                 add.w      54(a0),d0
[00067d94] d16f 0008                 add.w      d0,8(a7)
[00067d98] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067d9e] 2068 023c                 movea.l    572(a0),a0
[00067da2] 3f68 000e 0006            move.w     14(a0),6(a7)
[00067da8] 2039 000e 1d9c            move.l     $000E1D9C,d0
[00067dae] c0bc f0ff 0fff            and.l      #$F0FF0FFF,d0
[00067db4] 720f                      moveq.l    #15,d1
[00067db6] 206f 0010                 movea.l    16(a7),a0
[00067dba] c2a8 0004                 and.l      4(a0),d1
[00067dbe] 740c                      moveq.l    #12,d2
[00067dc0] e5a9                      lsl.l      d2,d1
[00067dc2] 8081                      or.l       d1,d0
[00067dc4] 206f 0010                 movea.l    16(a7),a0
[00067dc8] 2228 0004                 move.l     4(a0),d1
[00067dcc] c2bc 0000 00f0            and.l      #$000000F0,d1
[00067dd2] 7414                      moveq.l    #20,d2
[00067dd4] e5a9                      lsl.l      d2,d1
[00067dd6] 8081                      or.l       d1,d0
[00067dd8] 23c0 000e 1d9c            move.l     d0,$000E1D9C
[00067dde] 206f 0010                 movea.l    16(a7),a0
[00067de2] 2028 0004                 move.l     4(a0),d0
[00067de6] c0bc 0001 0000            and.l      #$00010000,d0
[00067dec] 6610                      bne.s      Aus_cycle_3
[00067dee] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067df4] 2068 023c                 movea.l    572(a0),a0
[00067df8] 0068 0100 000e            ori.w      #$0100,14(a0)
Aus_cycle_3:
[00067dfe] 206f 000c                 movea.l    12(a7),a0
[00067e02] 2f28 0004                 move.l     4(a0),-(a7)
[00067e06] 342f 000c                 move.w     12(a7),d2
[00067e0a] 322f 000e                 move.w     14(a7),d1
[00067e0e] 302f 0006                 move.w     6(a7),d0
[00067e12] 206f 0010                 movea.l    16(a7),a0
[00067e16] 2268 0008                 movea.l    8(a0),a1
[00067e1a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067e20] 2068 0258                 movea.l    600(a0),a0
[00067e24] 6100 fd46                 bsr        Ame_strpopup
[00067e28] 584f                      addq.w     #4,a7
[00067e2a] 2f48 0014                 move.l     a0,20(a7)
[00067e2e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067e34] 2068 023c                 movea.l    572(a0),a0
[00067e38] 316f 0006 000e            move.w     6(a7),14(a0)
[00067e3e] 23fc 09f1 0178 000e 1d9c  move.l     #$09F10178,$000E1D9C
[00067e48] 202f 0014                 move.l     20(a7),d0
[00067e4c] 6716                      beq.s      Aus_cycle_2
[00067e4e] 206f 000c                 movea.l    12(a7),a0
[00067e52] 216f 0014 0004            move.l     20(a7),4(a0)
[00067e58] 226f 0014                 movea.l    20(a7),a1
[00067e5c] 206f 000c                 movea.l    12(a7),a0
[00067e60] 6100 f408                 bsr        set
Aus_cycle_2:
[00067e64] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067e6a] 2f68 0258 0020            move.l     600(a0),32(a7)
[00067e70] 2f6f 0018 0024            move.l     24(a7),36(a7)
[00067e76] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067e7c] 2068 0258                 movea.l    600(a0),a0
[00067e80] 2068 0018                 movea.l    24(a0),a0
[00067e84] 2279 0010 ee4e            movea.l    ACSblk,a1
[00067e8a] b1e9 025c                 cmpa.l     604(a1),a0
[00067e8e] 660c                      bne.s      Aus_cycle_4
[00067e90] 3017                      move.w     (a7),d0
[00067e92] 807c 1000                 or.w       #$1000,d0
[00067e96] 3f40 0028                 move.w     d0,40(a7)
[00067e9a] 6004                      bra.s      Aus_cycle_5
Aus_cycle_4:
[00067e9c] 3f57 0028                 move.w     (a7),40(a7)
Aus_cycle_5:
[00067ea0] 43ef 0020                 lea.l      32(a7),a1
[00067ea4] 7009                      moveq.l    #9,d0
[00067ea6] 206f 0018                 movea.l    24(a7),a0
[00067eaa] 246f 0010                 movea.l    16(a7),a2
[00067eae] 246a 0008                 movea.l    8(a2),a2
[00067eb2] 4e92                      jsr        (a2)
[00067eb4] 93c9                      suba.l     a1,a1
[00067eb6] 7005                      moveq.l    #5,d0
[00067eb8] 206f 0018                 movea.l    24(a7),a0
[00067ebc] 246f 0010                 movea.l    16(a7),a2
[00067ec0] 246a 0008                 movea.l    8(a2),a2
[00067ec4] 4e92                      jsr        (a2)
[00067ec6] 4fef 002a                 lea.l      42(a7),a7
[00067eca] 245f                      movea.l    (a7)+,a2
[00067ecc] 4e75                      rts

	.data

a3dproto:
[000e1d98] 00064a22                  dc.l A_3Dbutton
[000e1d9c]                           dc.w $09f1
[000e1d9e]                           dc.w $0178
[000e1da0] 000630f2                  dc.l Auo_string
[000e1da4] 000e1dba                  dc.l $000e1dba
[000e1da8]                           dc.w $0000
[000e1daa]                           dc.w $0000
[000e1dac]                           dc.w $0000
[000e1dae]                           dc.w $0000
[000e1db0]                           dc.w $0000
[000e1db2]                           dc.w $0000
[000e1db4]                           dc.w $0000
[000e1db6]                           dc.w $0000
[000e1db8]                           dc.w $0200
[000e1dba]                           dc.w $007c
[000e1dbc]                           dc.w $5d00
[000e1dbe]                           dc.w $0000
[000e1dc0]                           dc.w $0000
[000e1dc2]                           dc.b '[]|',0
